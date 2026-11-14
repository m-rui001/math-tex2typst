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

#align(center)[#text(size: 16pt, weight: "bold")[Cycle--clique Ramsey numbers]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

For finite simple graphs $H$ and $J$, the Ramsey number $R \( H \, J \)$ is the least integer $N$ such that every
  red–blue colouring of the edges of the complete graph on $N$ vertices contains a red copy of $H$ or a blue copy
  of $J$. Copies need not be induced. Write $C_m$ for the cycle on exactly $m$ vertices and $K_n$ for the complete
  graph on $n$ vertices.

#thm([Theorem 1.1.])[
  #emph[For all integers $m gt.eq n gt.eq 3$ with $\( m \, n \) eq.not \( 3 \, 3 \)$,
$ R \( C_m \, K_n \) = \( m - 1 \) \( n - 1 \) + 1 . $

 For the excluded pair, $R \( C_3 \, K_3 \) = 6$.]
] <thm:main>

Theorem 1 establishes the cycle–clique conjecture of Erdős, Faudree,
  Rousseau and Schelp #cite(label("ErdosFaudreeRousseauSchelp1978")), in the formulation stated by Keevash,
  Long and Skokan #cite(label("KeevashLongSkokan2021")). The cycle length in the theorem is exact.
  Its lower bound comes from $n - 1$ disjoint red cliques of order $m - 1$, with all edges between them blue.
  The task is to show that one additional vertex forces one of the two specified graphs.

=== 1.1 Previous results and the parameter range <previous-results-and-the-parameter-range>

The case $n = 3$ goes back to Chartrand and Schuster #cite(label("ChartrandSchuster1971"));
  see also Bondy and Erdős #cite(label("BondyErdos1973")) p. 47.
  Bondy and Erdős #cite(label("BondyErdos1973")) Theorem 4 established the formula when $m gt.eq n^2 - 2$.
  The complete conjectured range was established for $n = 4$ by Yang,
  Huang and Zhang #cite(label("YangHuangZhang1999")), for $n =
  5$ by Bollobás and coauthors #cite(label("BollobasEtAl2000")), for $n =
  6$ by Schiermeyer #cite(label("Schiermeyer2003")), and for $n = 7$ by Chen,
  Cheng and Zhang #cite(label("ChenChengZhang2008")). For $n = 8$, further cases were established:
  $m = 8$ #cite(label("JaradatAlzaleq2007")) #cite(label("ZhangZhang2009")), $m =
  9$ #cite(label("BatainehJaradatAlZaleq2011")), and $10 lt.eq m lt.eq 15$ #cite(label("Baniabedalruhman2023")).
  Theorem 1 of Nikiforov #cite(label("Nikiforov2005")) states the formula for $n gt.eq 4$ and $m gt.eq 4 n + 2$.

Keevash, Long and Skokan #cite(label("KeevashLongSkokan2021")) Theorem 1.1 proved that an absolute constant $C
  gt.eq 1$ suffices whenever

#[#set math.equation(numbering: n => "(1.1)")
 $ n gt.eq 3 \, wide m gt.eq C frac(log_2 n, log_2 log_2 n) . $ <intro:kls>]

This already contains every pair $m gt.eq n$ once $n$ is sufficiently large.
  Indeed, the right-hand side of (1.1) is $o \( n \)$. For each of the finitely many smaller values of $n$,
  only finitely many $m gt.eq n$ lie below that threshold. Thus their theorem leaves at most finitely many pairs
  in the range of Theorem 1. Our result completes that range.
  The finite calculation below comes from an explicit structural reduction and does not require a numerical value
  of the constant in (1.1).

=== 1.2 The proof <the-proof>

Set $k = m - 1$ and $a = n - 1$. A failure of the upper bound gives a graph with no cycle of order $k +
  1$ and independence number at most $a lt.eq k$. Holding $k$ fixed and minimizing $a$ produces a useful expansion
  property: every nonempty independent set $I$ has at least $k \| I \| + 1$ vertices in its closed neighbourhood.
  In particular, the minimum degree is at least $k$.

The first structural step finds a clique of order

$ t gt.eq max { 3 \, floor.l k \/ 2 floor.r } . $

The proof uses distance layers in a rooted tree, followed by an explicit path-rotation argument.
  Independent-set expansion and rooted distance layers already appear in the cycle–clique argument of Erdős,
  Faudree, Rousseau and Schelp #cite(label("ErdosFaudreeRousseauSchelp1978")) Section 3.
  We prove the particular quantitative statements needed here in Sections 2 and 3.
  The two smallest values $k = 3 \, 4$ are then settled directly.

For $k gt.eq 5$, fix a maximum clique $Q$ of order $t$. Consider paths between its vertices whose nonempty
  interiors lie outside $Q$ and are pairwise disjoint, and whose endpoint pairs form disjoint chains.
  The total number of interior vertices is called the #emph[amount] of the system.
  We maximize this amount below $k + 1 - t$, breaking ties by minimizing the number of paths.
  Certain improvements of this system would close to a cycle of order exactly $k + 1$;
  all such improvements are therefore forbidden.

These prohibitions make neighbourhoods of suitable path vertices disjoint and anticomplete.
  Expansion then supplies independent sets inside those neighbourhoods.
  A separate size lemma raises the available independence bound from two to three when needed.
  For $t gt.eq 9$, this argument and a short numerical classification give more than $k$ independent vertices,
  a contradiction. Sections 6–8 develop this part of the proof.

The remaining case has $3 lt.eq t lt.eq 8$, and the clique bound gives $5 lt.eq k lt.eq 17$.
  A pattern records each chain by its sequence of interior-vertex counts,
  up to chain reversal and permutation of components. There are $3 \,
  099$ parameter-pattern instances across the $42$ admissible pairs $\( k \, t \)$.
  Section 9 proves the inference rules that exclude them: path replacement, exact-cycle closure,
  neighbourhood growth, independent-set packing, and contradiction under an added edge or a path with one new
  interior vertex. The computation enumerates these patterns, rather than graphs or edge colourings.
  Appendix 10 describes two separate exact implementations and the accompanying deduction traces.
  All structural arguments and all mathematical inference rules are proved in the main text.

== 2 A minimal counterexample and neighborhood expansion <sec:reduction>

All graphs in the proof are finite and simple. For a graph $H$, write $alpha \( H \)$ for its independence number,
  $omega \( H \)$ for its clique number, and $delta \( H \)$ for its minimum degree.
  If $X subset.eq V \( H \)$, then $H \[ X \]$ is the induced subgraph on $X$ and $H -
  X$ is the induced subgraph on $V \( H \) \\ X$. We sometimes write $alpha \( X \)$ for $alpha \( H \[ X \] \)$
  when the ambient graph is clear. The open neighborhood of a vertex $x$ is denoted by $N_H \( x \)$.
  For a set $X$, put $N_H \( X \) = union.big_(x in X) N_H \( x \)$, and

$ N_H \[ X \] = X union union.big_(x in X) N_H \( x \) $

is the closed neighborhood of a set $X$. Thus $N_H \[ x \] = N_H \[ { x } \]$.
  The order of a path or cycle is its number of vertices, and its length is its number of edges.
  In particular, a copy of $C_m$ always has exactly $m$ vertices.

The upper bound is equivalent to the assertion that every graph on $\( m - 1 \) \( n - 1 \) +
  1$ vertices contains either a cycle of order $m$ or an independent set of order $n$:
  apply this assertion to the red graph of a two-coloring. Set $k = m - 1$ and $a = n - 1$.
  In the range $m gt.eq n gt.eq 3$ with $\( m \, n \) = \( 3 \, 3 \)$ excluded, these parameters satisfy

$ k gt.eq 3 \, wide 2 lt.eq a lt.eq k . $

Conversely, every such pair $\( k \, a \)$ corresponds to a pair in the required range.
  We will rule out counterexamples for each fixed $k$.

Fix $k gt.eq 3$ and suppose that the upper bound fails for at least one $a in { 2 \, dots.h \, k }$.
  Choose the least such $a$, and fix a graph $G$ with

#[#set math.equation(numbering: n => "(2.1)")
 $ \| V \( G \) \| = k a + 1 \, wide alpha \( G \) lt.eq a \, wide
   G upright(" contains no ") C_(k + 1) . $ <red:counterexample>]

The choice of the least independence parameter will turn deletion of an independent set and all its neighbors into
  a useful expansion bound. The graph $G$ and the parameter $k$ retain this meaning throughout the upper-bound
  proof; the parameter $a$ is used through Section 4.

#thm([Lemma 2.1.])[
  #emph[For every integer $b$ with $0 lt.eq b < a$, a graph $H$ containing no $C_(k + 1)$ and satisfying
    $alpha \( H \) lt.eq b$ has at most $k b$ vertices.]
] <red:smaller>

#proof[
  If $b = 0$, the graph $H$ is empty, since any vertex would be an independent set of order one.
    If $b = 1$, the graph is complete. A complete graph with at least $k +
    1$ vertices contains a cycle of exactly $k + 1$ vertices, so in this case $\| V \( H \) \| lt.eq k$.
  Now let $2 lt.eq b < a$. If $\| V \( H \) \| gt.eq k b + 1$, take an induced subgraph on $k b + 1$ vertices.
    It still contains no $C_(k + 1)$ and has independence number at most $b$.
    It would therefore be a counterexample for the smaller parameter $b$, contrary to the choice of $a$. ◻
]

Independent-set deletion and neighbourhood expansion already enter the cycle–clique argument of Erdős, Faudree,
  Rousseau and Schelp #cite(label("ErdosFaudreeRousseauSchelp1978")) Section 3.
  The following closed neighbourhood bound comes directly from our fixed-parameter minimality.

#thm([Lemma 2.2.])[
  (Independent-set expansion).  #emph[For every nonempty independent set $I$ in the graph $G$ fixed in (2.1),
#[#set math.equation(numbering: n => "(2.2)")
 $ \| N_G \[ I \] \| gt.eq k \| I \| + 1 . $ <red:expansion-bound>]

 In particular, $delta \( G \) gt.eq k$ and $alpha \( G \) lt.eq k$.]
] <red:expansion>

#proof[
  Put $r = \| I \|$, so that $1 lt.eq r lt.eq a$. Every independent set in $G -
    N_G \[ I \]$ can be adjoined to $I$, because it has no edges to $I$. Consequently,
  $ alpha #scale(x: 120%, y: 120%)[\(] G - N_G \[ I \] #scale(x: 120%, y: 120%)[\)] lt.eq a - r . $
  The integer $a - r$ lies between zero and $a - 1$. The graph $G - N_G \[ I \]$ also contains no $C_(k + 1)$,
    so Lemma 2 applies, including when $r = a$, and gives
  $ \| V \( G \) \\ N_G \[ I \] \| lt.eq k \( a - r \) . $
  Subtracting from $\| V \( G \) \| = k a + 1$ proves (2.2).
    Applying the bound to $I = { x }$ yields $d_G \( x \) + 1 gt.eq k + 1$, and hence $delta \( G \) gt.eq k$.
    Finally, $alpha \( G \) lt.eq a lt.eq k$ by the choice of the parameters. ◻
]

The remainder of the upper-bound proof uses (2.1) and Lemma 3 to derive a contradiction.
  The first structural step, in Section 3, finds a large clique.
  Section 4 then disposes of $k = 3 \, 4$; all later arguments may assume $k gt.eq 5$.

== 3 A large clique <sec:clique>

We continue with the graph from Section 2, and write $t = omega \( G \)$ for its maximum clique size.
  The next result supplies the clique around which we will organize the rest of the proof.

#thm([Theorem 3.1.])[
  #emph[Let $k gt.eq 3$ and $2 lt.eq a lt.eq k$ be integers, and let $G$ be a finite simple graph such that
$ \| V \( G \) \| = k a + 1 \, wide alpha \( G \) lt.eq a \, wide C_(k + 1) subset.eq.not G . $

 Suppose also that
$ \| N_G \[ I \] \| gt.eq k \| I \| + 1 quad upright("for every nonempty independent set ") I subset.eq V \( G \) . $

 Then its maximum clique size $t$ satisfies
#[#set math.equation(numbering: n => "(3.1)")
 $ max { 3 \, floor.l k \/ 2 floor.r } lt.eq t lt.eq k . $ <clq:bound-equation>]

]
] <clq:bound>

Lemma 3 gives the expansion hypothesis for our graph. We first obtain a triangle.
  For larger $k$, we then find an induced subgraph in a single distance layer with enough internal expansion to
  force a long path. Tree paths above that layer will close the path into a cycle on exactly $k + 1$ vertices.
  This layer-and-tree strategy has its antecedent in Erdős, Faudree,
  Rousseau and Schelp #cite(label("ErdosFaudreeRousseauSchelp1978")) Section 3;
  the quantitative layer and coloured-path statements used here are proved below.

#thm([Lemma 3.2.])[
  #emph[Under the hypotheses of Theorem 4, we have $3 lt.eq t lt.eq k$.]
] <clq:triangle>

#proof[
  A clique on $k + 1$ vertices contains a $C_(k + 1)$, so $t lt.eq k$.
    For the other inequality, put $r_b = R \( K_3 \, K_b \)$. The elementary Ramsey recurrence gives
  $ r_2 = 3 \, wide r_b lt.eq b + r_(b - 1) quad \( b gt.eq 3 \) \, wide r_b lt.eq frac(b \( b + 1 \), 2) . $
  Indeed, in a graph on $b + r_(b - 1)$ vertices, choose a vertex $v$.
    If $v$ has at least $b$ neighbors, either two of them are adjacent, giving a triangle,
    or there is an independent set of size $b$. Otherwise $v$ has at least $r_(b - 1)$ nonneighbors;
    among them there is a triangle or an independent set of size $b - 1$, to which $v$ can be added.
    Induction gives the displayed bound on $r_b$.
  Since $a lt.eq k$ and $k gt.eq 3$, we have $a + 3 lt.eq 2 k$, and hence
  $ R \( K_3 \, K_(a + 1) \) lt.eq frac(\( a + 1 \) \( a + 2 \), 2) lt.eq k a + 1 = \| V \( G \) \| . $
  The alternative of an independent set of size $a + 1$ is excluded, so $G$ contains a triangle. ◻
]

For $k lt.eq 7$, Lemma 5 already proves Theorem 4. We therefore consider $k gt.eq 8$, and put $s =
  floor.l k \/ 2 floor.r gt.eq 4$. The following proposition isolates the information needed from the distance
  layers. It does not require the whole graph to be connected.

#thm([Proposition 3.3.])[
  #emph[Let $k gt.eq 8$ be an integer, set $s = floor.l k \/ 2 floor.r$,
    and let $G$ be a nonempty finite simple graph with $alpha \( G \) lt.eq k$ and
$ \| N_G \[ I \] \| gt.eq k \| I \| + 1 quad upright("for every nonempty independent set ") I subset.eq V \( G \) . $

 Suppose that $G$ contains no $K_s$. Fix a vertex $r$ and a breadth-first spanning tree $T$ of its component,
   rooted at $r$. Then there exist $i in { 1 \, dots.h \, s }$ and an induced subgraph $H$ of $G$,
   all of whose vertices have depth $i$ in $T$, such that $H$ is connected and nonbipartite, and
#[#set math.equation(numbering: n => "(3.2)")
 $ \| V \( H \) \| gt.eq k \, wide delta \( H \) gt.eq s \,\
\| N_H \[ I \] \| gt.eq s \| I \| quad \( I eq.not diameter upright(" independent in ") H \) . $ <clq:H-properties>]

 The last inequality is strict whenever $k$ is odd or $H - N_H \[ I \]$ is nonempty.]
] <clq:layer-interface>

#proof[
  Let $D_j$ be the set of vertices at distance $j$ from $r$. These are exactly the depth layers of $T$.
    Layers beyond the maximum depth are empty, and we use $alpha \( diameter \) = 0$.
    Every edge in the root component joins layers whose indices differ by at most one.
    Thus maximum independent sets chosen in layers of one parity can be united, giving an independent set of size
  $ p_i := sum_(0 lt.eq j lt.eq i\
j equiv i med \( mod med 2 \)) alpha \( D_j \) . $
  In particular $p_i lt.eq k$ and $p_0 = 1$. Applying expansion to a singleton gives $delta \( G \) gt.eq k$,
    so $D_1 eq.not diameter$. Consequently every union defining $p_i$ is nonempty:
    it contains either the root or an independent vertex from $D_1$.
  For $1 lt.eq i lt.eq s$, the closed neighborhood of the independent union defining $p_(i - 1)$ is contained in
    $D_0 union dots.h.c union D_i$. No vertex in another component is adjacent to this union.
    Expansion and $\| D_0 \| = 1$ give
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(j = 1)^i \| D_j \| gt.eq k p_(i - 1) . $ <clq:layer-sum>]
  Also, the two parity sums partition the indices from zero through $i$, so
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(j = 1)^i alpha \( D_j \) = p_i + p_(i - 1) - 1 . $ <clq:parity-sum>]
  Suppose first that $k = 2 s$. If every nonempty layer $D_j$, $1 lt.eq j lt.eq s$,
    satisfied $\| D_j \| < s alpha \( D_j \)$, then (3.3) and (3.4) would imply
  $ 2 s p_(i - 1) lt.eq sum_(j = 1)^i \| D_j \| < s \( p_i + p_(i - 1) - 1 \) wide \( 1 lt.eq i lt.eq s \) . $
  The strict inequality holds even when some layers are empty, since every sum contains the nonempty layer $D_1$.
    It follows that $p_i > p_(i - 1) + 1$, and therefore, by integrality, $p_i gt.eq p_(i - 1) + 2$.
    Iterating to $i = s$ gives $p_s gt.eq 2 s + 1 > k$, a contradiction.
    Hence some nonempty layer $D_i$, $1 lt.eq i lt.eq s$, satisfies
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| D_i \| gt.eq s alpha \( D_i \) . $ <clq:even-layer>]
  Now suppose that $k = 2 s + 1$. If $\| D_j \| lt.eq s alpha \( D_j \)$ for every $1 lt.eq j lt.eq s$,
    including empty layers, the same two identities give
  $ \( 2 s + 1 \) p_(i - 1) lt.eq s \( p_i + p_(i - 1) - 1 \) \, wide p_i gt.eq p_(i - 1) + 1 + ⌈p_(i - 1) / s⌉ . $
  Starting from $p_0 = 1$, each increment is at least two, so $p_(s - 1) gt.eq 2 s - 1 > s$.
    The last increment is consequently at least three, giving $p_s gt.eq 2 s + 2 > k$, again a contradiction.
    Thus some layer $D_i$, $1 lt.eq i lt.eq s$, satisfies
  #[#set math.equation(numbering: n => "(3.6)")
   $ \| D_i \| > s alpha \( D_i \) . $ <clq:odd-layer>]
  This layer is necessarily nonempty.
  We have found a layer of sufficiently large order relative to its independence number.
    Choose within it a nonempty induced subgraph $H$ of minimum order satisfying the corresponding inequality
    (3.5) or (3.6). Since $G$ has no $K_s$, such an $H$ cannot be complete:
    a complete graph satisfying either inequality would have at least $s$ vertices. Thus $alpha \( H \) gt.eq 2$.
    For even $k$ this gives $\| V \( H \) \| gt.eq 2 s = k$; for odd $k$ it gives $\| V \( H \) \| > 2 s$,
    hence $\| V \( H \) \| gt.eq 2 s + 1 = k$.
  The graph $H$ is connected. Otherwise each component $H_j$ would be a proper nonempty induced subgraph and would
    fail the chosen inequality. Since independence number is additive across components,
    summing these failures would give
  $
    cases(delim: "{", \| V \( H \) \| < s alpha \( H \) \, & k upright(" even") \,, \| V \( H \) \| lt.eq s
    alpha \( H \) \, & k upright(" odd") \,) $
  contrary to its choice. Nor is $H$ bipartite: a bipartition would give $alpha \( H \) gt.eq \| V \( H \) \| \/
    2$, incompatible with $\| V \( H \) \| gt.eq s alpha \( H \)$ and $s gt.eq 4$.
  Let $I$ be a nonempty independent set in $H$, and put $R = H - N_H \[ I \]$.
    An independent set in $R$ can be united with $I$, so
  $ alpha \( R \) lt.eq alpha \( H \) - \| I \| . $
  If $R eq.not diameter$, minimality gives $\| V \( R \) \| < s alpha \( R \)$ for even $k$,
    and $\| V \( R \) \| lt.eq s alpha \( R \)$ for odd $k$. Comparing with the defining inequality for $H$,
    one comparison is strict in each parity. Therefore
  $ \| N_H \[ I \] \| = \| V \( H \) \| - \| V \( R \) \| > s #scale(x: 120%, y: 120%)[\(] alpha \( H \) -
    alpha \( R \) #scale(x: 120%, y: 120%)[\)] gt.eq s \| I \| . $
  If $R = diameter$, instead use $\| N_H \[ I \] \| = \| V \( H \) \| gt.eq s alpha \( H \) gt.eq s \| I \|$;
    the first inequality is strict for odd $k$.
  Finally, take $I = { v }$. When $H - N_H \[ v \]$ is nonempty,
    the strict neighborhood bound gives $d_H \( v \) + 1 > s$, hence $d_H \( v \) gt.eq s$.
    When it is empty, the order bound gives $d_H \( v \) = \| V \( H \) \| - 1 gt.eq k - 1 gt.eq s$.
    This proves all the asserted properties of $H$. ◻
]

We now have a connected, nonbipartite graph $H$ inside a single depth layer $D_i$, with $1 lt.eq i lt.eq s$,
  satisfying (3.2). Under the assumption that $G$ has no $K_s$, the same is true of $H$.
  The next argument uses these properties to construct a path in $H$ whose ends can be joined through the tree
  above $D_i$, producing the forbidden cycle.

=== 3.1 Paths of a prescribed length <paths-of-a-prescribed-length>

We now show how the graph supplied by Proposition 6 yields a forbidden cycle.
  The main step concerns paths whose ends lie in different parts of a partition.
  We first record the elementary longest-path bound needed when all vertices of the layer have a common tree parent.

#thm([Lemma 3.4.])[
  #emph[Let $d gt.eq 2$, and let $F$ be a finite connected graph with $delta \( F \) gt.eq d$.
    Then $F$ contains a path of order at least $min { \| V \( F \) \| \, 2 d + 1 }$.]
] <clq:long-path>

#proof[
  Let $v_1 \, dots.h \, v_r$ be a longest path in $F$. All neighbors of either end belong to the path.
    Suppose that $r < min { \| V \( F \) \| \, 2 d + 1 }$. The two sets
  $ { j in { 1 \, dots.h \, r - 1 } : v_j v_r in E \( F \) } \, wide { j in { 1 \, dots.h \, r - 1 } :
    v_1 v_(j + 1) in E \( F \) } $
  have at least $d$ elements each, whereas their common index set has $r - 1 lt.eq 2 d - 1$ elements.
    Choose an index $j$ in their intersection. If $j = 1$ or $j = r - 1$,
    the edge $v_1 v_r$ closes the path to a cycle. For $2 lt.eq j lt.eq r - 2$,
    the two indicated edges instead give the cycle
  $ v_1 \, dots.h \, v_j \, v_r \, v_(r - 1) \, dots.h \, v_(j + 1) \, v_1 $
  through all vertices of the path. Thus in every case there is a cycle on these $r$ vertices.
    Since $r < \| V \( F \) \|$ and $F$ is connected, some vertex outside the cycle has a neighbor on it.
    Starting with that vertex and then traversing the cycle with one edge omitted gives a longer path,
    a contradiction. ◻
]

The next lemma uses only minimum degree, the exclusion of a clique, and expansion of independent pairs.
  Its proof identifies a clique of possible path ends, shows that this clique attaches to the remaining graph
  through one vertex, and uses that attachment to extend a path.

#thm([Lemma 3.5.])[
  #emph[Let $s gt.eq 4$, and let $H$ be a finite connected nonbipartite graph containing no $K_s$. Suppose that
$ delta \( H \) gt.eq s \, wide \| N_H \[ { a \, b } \] \| gt.eq 2 s quad upright("whenever ") a \,
  b upright(" are distinct and nonadjacent.") $

 For every nonconstant map $chi : V \( H \) arrow.r { 0 \, 1 }$ and every integer $1 lt.eq ell lt.eq 2 s - 2$,
   there is a path in $H$ of length exactly $ell$ whose ends receive different values of $chi$.]
] <clq:coloured-path>

#proof[
  Fix $chi$ and $ell$, and suppose that no such path exists.
    There are vertices $y \, z$ with $chi \( y \) eq.not chi \( z \)$ and a common neighbor $x$.
    Indeed, if no such pair existed, the color would be preserved along every walk of length two.
    In a connected nonbipartite graph there is an even walk between any two vertices:
    if a connecting path has odd length, first insert an odd closed walk obtained by going to an odd cycle,
    traversing it, and returning. Preservation of the color along successive pairs of steps would make $chi$
    constant. This proves the assertion, and $x \, y \, z$ are distinct because the graph is simple.
  Let $K$ be the component containing $x$ in $H - { y \, z }$.
    Every vertex of $K$ loses at most two neighbors on deleting $y \, z$,
    and all its other neighbors lie in the same component. Thus
  #[#set math.equation(numbering: n => "(3.7)")
   $ delta \( K \) gt.eq s - 2 . $ <clq:component-degree>]
  There is no path of order at least $ell$ starting at $x$ in $K$.
    For the first $ell$ vertices of such a path form a path with some last vertex $b$.
    At least one of $y \, z$ has color different from $b$; prefixing that vertex gives a path of length $ell$ with
    differently colored ends.
  Choose a longest path $P$ starting at $x$ in $K$, and write $W = V \( P \)$ and $r = \| W \|$.
    All neighbors in $K$ of its last vertex lie on $P$, so (3.7) gives $r gt.eq s - 1$.
    If $ell lt.eq s - 1$, this already contradicts the preceding paragraph.
    This disposes in particular of $ell = 1 \, 2$. Henceforth we have
  #[#set math.equation(numbering: n => "(3.8)")
   $ s lt.eq ell lt.eq 2 s - 2 \, wide s - 1 lt.eq r lt.eq ell - 1 . $ <clq:path-order>]
  #emph[The possible last vertices form a clique.] Define
  $ E = { e in W : upright("there is a path from ") x upright(" to ") e upright("
 whose vertex set is exactly ") W } . $
  Every such path has the maximum possible order among paths starting at $x$ in $K$.
    Its last vertex has no neighbor in $K - W$. Since vertices of $K$ have no neighbors in
    $H - \( K union { y \, z } \)$, we obtain
  #[#set math.equation(numbering: n => "(3.9)")
   $ N_K \( e \) subset.eq W \, wide N_H \( e \) subset.eq W union { y \,
     z } quad \( e in E \) . $ <clq:endpoint-neighbors>]
  If two vertices of $E$ were nonadjacent, their closed neighborhood in $H$ would have size at most $r + 2 lt.eq
    ell + 1 lt.eq 2 s - 1$, contrary to the hypothesis. Thus $E$ is a clique.
    Also $x in.not E$, because a simple path with more than one vertex has distinct ends, and $r gt.eq s - 1 gt.eq 3$.
  We use the standard fixed-end path rotation of Pósa #cite(label("Posa1963")) p. 358.
    The endpoint-clique and attachment conclusions needed here follow from our stated hypotheses.
    Explicitly, let $v_1 = x \, dots.h \, v_r = e$ be any path from $x$ with vertex set $W$.
    For an edge $e v_j$ with $1 lt.eq j lt.eq r - 2$, the sequence
  #[#set math.equation(numbering: n => "(3.10)")
   $ v_1 \, dots.h \, v_j \, v_r \, v_(r - 1) \, dots.h \, v_(j + 1) $ <clq:rotation>]
  is another path from $x$ on exactly $W$. Its last vertex is $v_(j + 1)$.
    The operation is valid also when $j = 1$, so the pivot may be $x$.
    For $j = r - 1$, the original path itself has last vertex $v_(j + 1) = e$.
    Therefore the successor of every neighbor of $e$ along the path belongs to $E$.
    Different neighbors have different successors, and hence
  #[#set math.equation(numbering: n => "(3.11)")
   $ d_K \( e \) lt.eq \| E \| wide \( e in E \) . $ <clq:endpoint-degree>]
  Combining (3.7) with the fact that $E$ is a clique and $H$ has no $K_s$ gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ s - 2 lt.eq \| E \| lt.eq s - 1 . $ <clq:endpoint-size>]
  On every path from $x$ with vertex set $W$, the vertices of $E$ form a consecutive final segment.
    To see this, let $e$ be its last vertex. Every earlier vertex of $E$ is adjacent to $e$,
    since $E$ is a clique. The rotation then places its successor in $E$ as well.
    Thus membership in $E$ is preserved on moving forward along the path.
  #emph[The endpoint clique attaches through one vertex.] Fix one of the paths from $x$ on $W$.
    Let $u$ be the predecessor of its final segment $E$, and let $w_0$ be the first vertex of that segment.
    Both are defined because $E$ is nonempty and $x in.not E$; in particular, $u in.not E$ and $u w_0$ is an edge.
  For $w in E - { w_0 }$, reorder the final clique segment so that it still starts at $w_0$ and now ends at $w$.
    Every neighbor of $w$ in $K$ lies on this path by (3.9), and the successor of each neighbor belongs to $E$ by
    the rotation. A vertex of the prefix strictly before $u$ has its successor outside $E$,
    so it cannot be a neighbor of $w$. Consequently
  #[#set math.equation(numbering: n => "(3.13)")
   $ N_K \( w \) subset.eq \( E - { w } \) union { u } wide \( w in E - { w_0 } \) . $ <clq:partial-attachment>]
  We claim that $u$ has at least two neighbors in $E$. There are two possibilities in (3.12).
    If $\| E \| = s - 2$, each $w in E - { w_0 }$ has at most $\( s - 3 \) + 3 = s$ possible neighbors in $H$:
    the other vertices of $E$, and $u \, y \, z$. Minimum degree $s$ forces all these adjacencies.
    Since $\| E \| gt.eq 2$, there is such a $w$, and $u$ is adjacent to both $w_0$ and $w$.
  If $\| E \| = s - 1$, suppose instead that $w_0$ is the only neighbor of $u$ in $E$.
    By (3.13), every vertex in $E - { w_0 }$ must then see both $y$ and $z$ to have degree at least $s$.
    The vertex $w_0$ is itself a possible last vertex by the definition of $E$,
    whether or not it is last in our fixed order. Thus (3.11) gives $d_K \( w_0 \) lt.eq s - 1$,
    so $w_0$ sees at least one of $y \, z$. That vertex is adjacent to all of $E$, giving a $K_s$,
    a contradiction. We have proved the claim.
  Choose a second neighbor $w_1 in E - { w_0 }$ of $u$. Keeping the prefix through $u$ fixed,
    we can enter $E$ at $w_1$ and reorder this clique so that $w_0$ is last.
    The same successor argument used for (3.13) now applies to $w_0$ as well. It follows that
  #[#set math.equation(numbering: n => "(3.14)")
   $ N_K \( E \) \\ E subset.eq { u } \, wide \| N_K \( u \) ∩ E \| gt.eq 2 . $ <clq:attachment>]
  There is a vertex $w in E$ adjacent to both $y \, z$. For $\| E \| = s - 2$, any vertex of $E -
    { w_0 }$ already has this property. For $\| E \| = s - 1$, suppose none does.
    Each vertex of $E$ then has at most one neighbor among $y \, z$ and, by (3.14), no neighbor in $K -
    E$ other than $u$. To have degree at least $s$, it must be adjacent to $u$.
    Thus $E union { u }$ would be a $K_s$, again a contradiction.
  #emph[A path starting in the endpoint clique is long enough.] We now seek a path of order at least $ell$
    starting at this vertex $w$ in $K$. Since both $y$ and $z$ are adjacent to $w$,
    the same prefix argument used at $x$ will give the final contradiction.
  First, $K$ is not a clique. Its minimum degree would force a clique $K$ to have at least $s - 1$ vertices.
    It cannot have at least $s$ vertices, and if it has exactly $s - 1$,
    minimum degree $s$ in $H$ forces every vertex of $K$ to see both $y \, z$. Then $K union { y }$ is a $K_s$.
    Hence $K$ has a nonadjacent pair. Its closed neighborhood in $H$ is contained in $K union { y \, z }$,
    so the independent-pair hypothesis gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ \| V \( K \) \| gt.eq 2 s - 2 . $ <clq:component-size>]
  The graph $K - E$ is connected. Otherwise, since $K$ is connected, each component of $K -
    E$ would have a neighbor in $E$; (3.14) would force every one of these components to contain $u$. Moreover,
  $ \| V \( K - E \) \| gt.eq \( 2 s - 2 \) - \( s - 1 \) = s - 1 gt.eq 3 . $
  Let $R$ be a longest path starting at $u$ in $K - E$, and let $v$ be its last vertex.
    Connectedness and the preceding size bound ensure that $R$ is nontrivial, so $v eq.not u$.
    By (3.14), the vertex $v$ has no neighbor in $E$; by maximality of $R$, all its neighbors in $K -
    E$ lie on $R$. Thus all its neighbors in $K$ lie on $R$, and
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| V \( R \) \| gt.eq d_K \( v \) + 1 gt.eq s - 1 . $ <clq:remaining-path-order>]
  If $\| E \| = s - 2$ and $\| V \( R \) \| = s - 1$, the vertices $v \, w$ are nonadjacent by (3.14),
    since $v eq.not u$. Their closed neighborhood in $H$ is contained in
  $ E union V \( R \) union { y \, z } . $
  These sets are disjoint and have total size $\( s - 2 \) + \( s - 1 \) + 2 = 2 s - 1$,
    contrary to the hypothesis. Together with (3.12) and (3.16), this proves
  $ \| E \| + \| V \( R \) \| gt.eq 2 s - 2 gt.eq ell . $
  By (3.14), choose a neighbor $e$ of $u$ in $E$ different from $w$.
    Traverse all of the clique $E$ in a path starting at $w$ and ending at $e$, follow the edge $e u$,
    and then follow $R$ from $u$, as shown in Figure 1. The vertex sets $E$ and $V \( R \)$ are disjoint,
    so this is a simple path in $K$ of order $\| E \| + \| V \( R \) \| gt.eq ell$ starting at $w$.
    Take its first $ell$ vertices and prefix whichever of $y \, z$ has color different from its last vertex.
    The prefixed vertex lies outside $K$, so the resulting path is simple and has length exactly $ell$.
    This contradicts the choice of $ell$ and completes the proof. ◻
]

=== 3.2 Closing a path through the breadth-first tree <closing-a-path-through-the-breadth-first-tree>

The preceding lemma now supplies the path within one distance layer;
  the tree supplies a disjoint path of the complementary length.

#proof[
  Lemma 5 gives $3 lt.eq t lt.eq k$. If $s = floor.l k \/ 2 floor.r lt.eq 3$, this is the required bound.
    Suppose therefore that $s gt.eq 4$ and that $G$ has no $K_s$.
    Choose a vertex of $G$ and a breadth-first spanning tree of its component rooted at that vertex.
    Since $alpha \( G \) lt.eq a lt.eq k$, Proposition 6 applies and gives $H$ in one distance layer $D_i$ of this
    tree, where $1 lt.eq i lt.eq s$.
  In the breadth-first tree defining this layer, let $c$ be the lowest common ancestor of all vertices of $H$.
    They all have depth $i$, so their distance below $c$ is the same integer
  $ p = i - "depth" \( c \) . $
  The graph $H$ has at least $k$ vertices, so $c$ is a proper ancestor of its vertices, giving $1 lt.eq p lt.eq
    i lt.eq s$. At least two child branches of $c$ meet $H$, since otherwise the common child would be a lower
    common ancestor.
  If $p = 1$, every vertex of $H$ is adjacent to $c$. By Lemma 7, the graph $H$ contains a path of order at least
  $ min { \| V \( H \) \| \, 2 s + 1 } gt.eq k \, $
  because $\| V \( H \) \| gt.eq k$ and $k in { 2 s \, 2 s + 1 }$.
    Take a subpath of order exactly $k$ and join both ends to $c$.
    The vertex $c$ lies above $D_i$, so this gives a simple cycle of order $k + 1$, a contradiction.
  Suppose that $p gt.eq 2$. Partition the child branches of $c$ that meet $H$ into two nonempty classes,
    and color each vertex of $H$ according to its class. This is a nonconstant coloring.
    Vertices of different colors have tree distance exactly $2 p$,
    and all internal vertices of their tree path have depth less than $i$. Set
  $ ell = k + 1 - 2 p . $
  The inequalities $p lt.eq s$, $p gt.eq 2$, and $k in { 2 s \, 2 s + 1 }$ give $1 lt.eq ell lt.eq 2 s - 2$.
    The graph $H$ has all the hypotheses of Lemma 8: its independent-set neighborhood bound applies in particular
    to independent pairs. That lemma supplies a path in $H$ of length exactly $ell$ with differently colored ends.
    Its vertices have depth $i$, so its interior is disjoint from the tree path between its ends.
    The union of the two paths is therefore a simple cycle of length
  $ ell + 2 p = k + 1 . $
  This final contradiction proves $t gt.eq s$ and hence the theorem. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.76, -0.76), (2.185, 1.14), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((0.95, 0.855), [$E$ \(a clique\)])
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, -0.03528), [$w$], anchor: "north")
  circle((1.615, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.615, -0.03528), [$e$], anchor: "north")
  line((0, 0), (0.57, 0.285), (1.045, -0.2375), (1.615, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  rect((2.66, -0.76), (6.175, 1.14), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((4.37, 0.855), [$K-E$])
  circle((3.04, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.04, -0.03528), [$u$], anchor: "north")
  circle((5.7, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5.7, -0.03528), [$v$], anchor: "north")
  line((1.615, 0), (3.04, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.04, 0), (3.8, 0.2375), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.8, 0.2375), (4.56, -0.19), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((4.56, -0.19), (5.7, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  content((4.37, 0.4275), [$R$])
  circle((-0.57, 1.9), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((-0.57, 1.935), [$y$], anchor: "south")
  circle((-0.95, 1.425), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((-0.95, 1.46), [$z$], anchor: "south")
  line((-0.57, 1.9), (0, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (-0.95, 1.425), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.95, 1.425), (0, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
})],
  caption: [Figure 1: The final construction in Lemma 8. Every edge from $E$ to $K - E$ is incident with $u$. A vertex $w in E$ sees both $y$ and $z$. Choose a neighbour $e eq.not w$ of $u$ in $E$, traverse all of $E$ from $w$ to $e$, and continue through $u$ along $R$. Prefixing the appropriate one of $y \, z$ to an exact initial segment gives the required cross-colour path. The schematic shows this traversal; other edges are unspecified. ],
) <fig:clique-endpoints>

== 4 The cases of four- and five-cycles <sec:small>

We now rule out the minimal counterexample when $k = 3$ or $k = 4$.
  Only the triangle guaranteed by Lemma 5 is needed from the preceding section.
  The argument examines the neighbors outside a clique and uses the absence of the required exact cycle to
  separate their neighborhoods.

#thm([Proposition 4.1.])[
  #emph[Let $k in { 3 \, 4 }$ and let $a$ be an integer with $2 lt.eq a lt.eq k$. There is no graph $G$ with
$ \| V \( G \) \| = k a + 1 \, wide alpha \( G \) lt.eq a \, wide G upright(" contains no ") C_(k + 1) \, $

 such that $\| N_G \[ I \] \| gt.eq k \| I \| + 1$ for every nonempty independent set $I subset.eq V \( G \)$.]
] <small:cases>

#proof[
  Suppose such a graph exists. Applying the neighborhood bound to a singleton gives $delta \( G \) gt.eq k$.
    Lemma 5 supplies a triangle, and a clique of order $k + 1$ would contain the forbidden cycle, so $3 lt.eq
    omega \( G \) lt.eq k$.
  For a clique $Q = { q_1 \, dots.h \, q_t }$, let $F = G - Q$ and put
  $ U_i = N_G \( q_i \) ∩ V \( F \) wide \( 1 lt.eq i lt.eq t \) . $
  We will use this notation with different choices of $Q$, specifying the choice each time.
    A path between two distinct vertices of $Q$ whose internal vertices lie in $F$ can be completed using edges of
    $Q$. The exact numbers of internal vertices that are forbidden are checked below.
  #strong[The case $k = 3$.] Choose a triangle $Q = { q_1 \, q_2 \, q_3 }$.
    Each $U_i$ is nonempty, since $q_i$ has two neighbors inside $Q$ and degree at least three.
    For distinct $i \, j$, write $h$ for the remaining index. A common vertex $u in U_i ∩ U_j$ would give the cycle
  $ q_i \, u \, q_j \, q_h \, q_i $
  of order four. If $u in U_i$ and $v in U_j$ were adjacent, then
  $ q_i \, u \, v \, q_j \, q_i $
  would be a cycle of order four. Thus the sets $U_1 \, U_2 \, U_3$ are pairwise disjoint and pairwise anticomplete.
  Choosing one vertex from each $U_i$ gives an independent set of order three. Hence $a = 3$.
    If any $U_i$ contained two nonadjacent vertices, adjoining one vertex from each of the other two sets would
    give an independent set of order four. Therefore each $U_i$ is a clique.
    Moreover, ${ q_i } union U_i$ is a clique and there is no $K_4$, so
  $ 1 lt.eq \| U_i \| lt.eq 2 . $
  Since $\| V \( F \) \| = 7$, the set
  $ W = V \( F \) \\ \( U_1 union U_2 union U_3 \) $
  is nonempty. Every vertex of $W$ has no neighbor in $Q$ by the definition of the $U_i$.
  Fix $w in W$. If $w$ saw two distinct vertices $u \, v in U_i$, then $w \, u \, q_i \, v \, w$ would be a $C_4$.
    Thus $w$ has at most one neighbor in each $U_i$. On the other hand,
    if $w$ missed a vertex $u in U_i$ and a vertex $v in U_j$ for distinct $i \, j$, then ${ w \, u \, v \,
    q_h }$ would be an independent set of order four. Indeed, $w$ misses $Q$,
    the two exterior sets are anticomplete, and $q_h$ has no neighbor in either of them.
    It follows that $w$ is adjacent to every vertex of at least two of the $U_i$.
    These two sets must therefore be singletons.
  There are consequently at least two singleton sets among the three $U_i$.
    If exactly two are singletons, the three sizes are $1 \, 1 \, 2$, so $\| W \| = 3$.
    Every vertex of $W$ sees the two singleton vertices, say $u \, v$.
    Distinct $w \, w' in W$ then give the cycle $w \, u \, w' \, v \, w$ of order four.
    If all three $U_i$ are singletons, then $\| W \| = 4$. Each $w in
    W$ sees at least two of the three singleton vertices. Choose one pair of such neighbors for each $w$.
    There are only three pairs, so two vertices $w \, w'$ choose the same pair ${ u \, v }$, again giving $w \,
    u \, w' \, v \, w$. This rules out $k = 3$.
  #strong[The case $k = 4$ with a clique of order four.] Suppose first that $Q = { q_1 \, q_2 \, q_3 \,
    q_4 }$ is a clique. A path between distinct $q_i \, q_j$ with one, two,
    or three internal vertices outside $Q$ can be completed to a $C_5$ by a path in $Q$ of length three, two,
    or one, respectively. More explicitly, with $q_h \, q_ell$ the other clique vertices,
    the prohibited configurations yield
  $ q_i \, u \, q_j \, q_h \, q_ell \, q_i \,\
q_i \, u \, v \, q_j \, q_h \, q_i \,\
q_i \, u \, z \, v \, q_j \, q_i . $
  In every row the exterior vertices are distinct and lie outside $Q$, so the displayed cycle has exactly five vertices.
  The sets $U_i$ are nonempty. Their closed neighborhoods in $F$ are pairwise disjoint:
    an intersection of $N_F \[ U_i \]$ and $N_F \[ U_j \]$ would give vertices $u in U_i$,
    $v in U_j$ at distance at most two in $F$, with $u = v$ allowed.
    A shortest such path, joined to $q_i$ and $q_j$, is one of the three prohibited configurations.
    In particular, every vertex $u in U_i$ has exactly one neighbor in $Q$,
    so it has at least three neighbors in $F$. It follows that
  $ \| V \( F \) \| gt.eq sum_(i = 1)^4 \| N_F \[ U_i \] \| gt.eq 4 dot.op 4 = 16 . $
  But $\| V \( F \) \| = 4 a - 3 lt.eq 13$, a contradiction. We may therefore assume that $omega \( G \) = 3$.
  #strong[Triangles with disjoint exterior neighbor sets.] For any triangle $Q = { q_1 \, q_2 \, q_3 }$,
    every $U_i$ has size at least two. A path between distinct triangle vertices with two or three internal
    vertices outside $Q$ gives a $C_5$. In particular, if distinct $u in U_i$, $v in U_j$ are adjacent,
    or are joined by a two-edge path $u \, z \, v$ in $F$, the respective cycles are
  #[#set math.equation(numbering: n => "(4.1)")
   $ q_i \, u \, v \, q_j \, q_h \, q_i wide upright("and") wide q_i \, u \, z \, v \, q_j \, q_i \,
     $ <small:five-cycles>]
  where $h$ is the remaining triangle index.
  Suppose for the moment that $U_1 \, U_2 \, U_3$ are disjoint.
    By (4.1), their closed neighborhoods in $F$ are also pairwise disjoint.
    A maximum independent subset $J$ of $U_i$ has exactly one neighbor in $Q$, namely $q_i$.
    Thus the assumed expansion bound gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ \| N_F \[ U_i \] \| gt.eq \| N_F \[ J \] \| = \| N_G \[ J \] \| - 1 gt.eq
     4 alpha \( U_i \) . $ <small:one-neighbor-count>]
  Here $\| V \( F \) \| = 4 a - 2 lt.eq 14$. If any $U_i$ had independence number at least two,
    the three disjoint neighborhoods would together have at least $8 + 4 + 4 = 16$ vertices.
    Hence every $U_i$ is a clique. Its size is exactly two, because it has size at least two and adjoining $q_i$
    cannot produce a $K_4$.
  If the exterior neighbor sets were disjoint for every triangle, write $U_i = { u_i \,
    v_i }$ and apply that assertion to the triangle $T_i = { q_i \, u_i \, v_i }$.
    Each of $u_i \, v_i$ has at least two neighbors outside $T_i$,
    and the two sets of such neighbors are disjoint. All of these vertices lie in $F - U_i$:
    the original disjointness prevents $u_i$ or $v_i$ from seeing a vertex of $Q \\ { q_i }$.
    Consequently $\| N_F \[ U_i \] \| gt.eq 2 + 2 + 2 = 6$ for every $i$.
    The three original closed neighborhoods are disjoint, so this would require at least $18$ vertices in $F$,
    again impossible. Some triangle therefore has overlapping exterior neighbor sets.
  #strong[The necessary structure at an overlapping triangle.] Take a triangle for which $I =
    U_1 ∩ U_2 eq.not diameter$. No other pair of exterior sets overlaps.
    Indeed, a vertex in all three sets would form a $K_4$ with $Q$.
    If $x in U_1 ∩ U_2$ and $y in U_1 ∩ U_3$ are distinct, then
  $ q_2 \, x \, q_1 \, y \, q_3 \, q_2 $
  is a $C_5$; if instead $y in U_2 ∩ U_3$, use $q_1 \, x \, q_2 \, y \, q_3 \, q_1$.
    Also $I$ is independent, since adjacent vertices $x \, y in I$ would give the $K_4$ on $q_1 \, q_2 \, x \, y$.
  The four sets
  $ I \, wide A = U_1 \\ I \, wide B = U_2 \\ I \, wide D = U_3 $
  have pairwise disjoint closed neighborhoods in $F$. To check this even for pairs involving $I$,
    choose distinct triangle neighbors for vertices in the six possible pairs of classes as follows:
  $ upright("classes") & \( I \, A \) & \( I \, B \) & \( I \, D \) & \( A \, B \) & \( A \, D \) & \( B \, D \)\
upright("neighbors") & \( q_2 \, q_1 \) & \( q_1 \, q_2 \) & \( q_1 \, q_3 \) & \( q_1 \, q_2 \) & \( q_1 \,
  q_3 \) & \( q_2 \, q_3 \) . $
  If two vertices from the indicated classes were adjacent or shared a neighbor in $F$,
    the corresponding distinct triangle neighbors would close one of the cycles in (4.1).
    Since the classes themselves are disjoint, their closed neighborhoods are disjoint as claimed.
  Write $r = \| I \|$. The set $I$ is independent and its only neighbors in $Q$ are $q_1 \, q_2$. Hence
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| N_F \[ I \] \| = \| N_G \[ I \] \| - 2 gt.eq 4 r - 1 . $ <small:overlap-count>]
  Each nonempty one of $A \, B \, D$ has exactly one triangle neighbor,
    so the argument of (4.2) bounds the size of its closed neighborhood below by four times its independence
    number. These bounds may be added because the four closed neighborhoods are disjoint.
  If $r = 1$, then both $A$ and $B$ are nonempty, since $\| U_1 \| \, \| U_2 \| gt.eq 2$,
    and $D$ is nonempty as well. The four neighborhoods would have total size at least $3 + 4 + 4 + 4 = 15 > 14$.
    If $r gt.eq 3$, the neighborhoods of $I$ and $D$ alone would have total size at least $11 + 4 = 15 > 14$.
    Thus $r = 2$. In this case the neighborhoods of $I$ and $D$ already contribute at least $7 + 4 = 11$ vertices;
    a nonempty $A$ or $B$ would increase the bound to $15$. Therefore
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| I \| = 2 \, wide U_1 = U_2 = I . $ <small:overlap-structure>]
  Moreover, $alpha \( D \) gt.eq 2$ would give $7 + 8 = 15$ vertices, so $D$ is a clique.
    Its size is exactly two, by the degree bound and the absence of a $K_4$.
  This argument proves a necessary statement for #emph[every] triangle with overlapping exterior neighbor sets:
    exactly one pair overlaps, both sets in that pair equal an independent set of size two,
    and the third exterior neighbor set is a clique of size two.
    No condition on the exterior sets of other triangles was used in proving this statement.
  #strong[The final contradiction.] Write $I = { w \, z }$ and consider the triangle $T = { q_1 \, q_2 \, w }$.
    By (4.4), the exterior neighbor sets of its first two vertices are both
  $ N_G \( q_1 \) \\ T = N_G \( q_2 \) \\ T = { q_3 \, z } . $
  The necessary statement just proved therefore applies to $T$.
    Its third vertex $w$ has exactly two neighbors outside $T$. Neither $q_3$ nor $z$ is adjacent to $w$:
    adjacency to $q_3$ would give a $K_4$ with the original triangle, and $I$ is independent.
    Thus the neighbors of $w$ outside $T$ are precisely its neighbors in the original graph $F$,
    and $d_F \( w \) = 2$. The same reasoning applies to $z$. Consequently,
  $ \| N_F \[ I \] \| lt.eq \| I \| + d_F \( w \) + d_F \( z \) = 2 + 2 + 2 = 6 \, $
  whereas (4.3) gives $\| N_F \[ I \] \| gt.eq 7$. This contradiction completes the case $k = 4$ and the proof. ◻
]

By Lemma 3, the minimal counterexample satisfies all the assumptions of Proposition 9.
  Hence we may assume $k gt.eq 5$ from now on.

== 5 From size to independence <sec:size>

We next show that a vertex set larger than both $k$ and twice the clique number contains three independent
  vertices. The argument uses only the forbidden cycle and the clique bound.
  We first prove two elementary facts about graphs with independence number at most two.
  The first is a special case of the Chvátal–Erdős Hamiltonicity theorem #cite(label("ChvatalErdos1972"))
  Theorem 1. The shortening argument in the second appears in Radziszowski and Jin’s proof of their pancyclicity
  theorem #cite(label("RadziszowskiJin1994")) Theorem 2. We include both proofs.

#thm([Lemma 5.1.])[
  #emph[Every finite simple 2-connected graph $H$ with $alpha \( H \) lt.eq
    2$ contains a cycle through all its vertices.]
] <size:hamiltonian>

#proof[
  A 2-connected graph has minimum degree at least two and therefore contains a cycle:
    all neighbors of an endpoint of a longest path lie on that path, and two such neighbors give a cycle.
    Choose a cycle $C$ of maximum order, orient it, and write $a^(+)$ for the successor of $a in V \( C \)$.
  Suppose that a component $D$ of $H - V \( C \)$ exists. Its set of neighbors on $C$ contains at least two
    vertices. Indeed, it is nonempty by connectedness, and a unique such vertex would be a cutvertex of $H$.
    If $a in V \( C \)$ has a neighbor in $D$, then $a^(+)$ has none.
    Otherwise a path from $a$ to $a^(+)$ with nonempty interior in the connected graph $D$ could replace the edge
    $a a^(+)$, giving a longer cycle. This path exists even if $a$ and $a^(+)$ have the same neighbor in $D$.
  Choose distinct vertices $a \, b in V \( C \)$ with neighbors in $D$,
    and a path $P$ from $a$ to $b$ with nonempty interior in $D$.
    The vertices $a^(+) \, b^(+)$ are distinct, neither equals $a$ or $b$, and both have no neighbor in $D$.
    If $a^(+) b^(+)$ were an edge, we could traverse $P$ from $a$ to $b$,
    follow $C$ backwards from $b$ to $a^(+)$, use $a^(+) b^(+)$, and follow $C$ forwards from $b^(+)$ to $a$.
    Deleting $a a^(+)$ and $b b^(+)$ from $C$ leaves exactly the two cycle segments used here.
    Hence this would be a cycle containing every vertex of $C$ and at least one additional vertex,
    a contradiction. Thus $a^(+)$ and $b^(+)$ are nonadjacent.
    Together with any vertex of $D$, they form an independent triple, also a contradiction. Therefore $C$ is spanning. ◻
]

#thm([Lemma 5.2.])[
  #emph[Let $H$ be a finite simple graph on $r gt.eq 7$ vertices with $alpha \( H \) lt.eq 2$.
    If $H$ has a Hamiltonian cycle, then it has a cycle on exactly $r - 1$ vertices.]
] <size:shortening>

#proof[
  Label the vertices around a Hamiltonian cycle by $0 \, 1 \, dots.h \, r - 1$,
    with indices interpreted modulo $r$. If some edge joins $i$ to $i + 2$, it bypasses the vertex $i +
    1$ and gives the required cycle. Suppose there is no such edge.
    In each triple $i \, i + 2 \, i + 4$, the pairs $i \( i + 2 \)$ and $\( i + 2 \) \( i + 4 \)$ are nonedges.
    Since the triple is not independent, $i \( i + 4 \)$ is an edge. All cyclic step-four edges are therefore present.
  Consider the cyclic sequence
  #[#set math.equation(numbering: n => "(5.1)")
   $ 1 \, 2 \, dots.h \, r - 6 \, quad r - 2 \, r - 1 \, quad r - 5 \, r - 4 \, r - 3 \, quad
     1 . $ <size:shortening-cycle>]
  Before closing, its three blocks partition the vertices $1 \, dots.h \, r - 1$.
    Consecutive vertices within a block are adjacent on the original cycle.
    The three edges joining the blocks and closing the sequence are
  $ \( r - 6 \) \( r - 2 \) \, wide \( r - 1 \) \( r - 5 \) \, wide \( r - 3 \) 1 \; $
  their cyclic differences are $4 \, - 4 \, 4$, respectively. Thus (5.1) is a cycle of order $r - 1$.
    When $r = 7$, the first block is the singleton $1$, and the sequence is explicitly $1 \, 5 \, 6 \, 2 \, 3 \,
    4 \, 1$, so the same construction applies. ◻
]

#thm([Lemma 5.3.])[
  (Size test).  #emph[Let $k gt.eq 5$ and $t gt.eq 1$ be integers.
    Let $G$ be a finite simple graph with no cycle on exactly $k + 1$ vertices and with clique number at most $t$.
    For every $Y subset.eq V \( G \)$,
$ \| Y \| > max { k \, 2 t } quad arrow.r.double quad alpha \( G \[ Y \] \) gt.eq 3 . $

]
] <size:test>

#proof[
  Suppose that $H = G \[ Y \]$ has $alpha \( H \) lt.eq 2$ and order $n > max { k \, 2 t }$.
    If $H$ is disconnected, it has exactly two components, each a clique.
    Indeed, three components give an independent triple, as does a nonadjacent pair in one component together with
    a vertex of another. The two cliques have at most $t$ vertices each, contrary to $n > 2 t$.
  If $H$ has a cutvertex $v$, the same argument shows that $H - v$ has exactly two components $A \, B$,
    both cliques of order at most $t$. The inequalities
  $ \| A \| + \| B \| + 1 = n > 2 t \, wide \| A \| \, \| B \| lt.eq t $
  force $\| A \| = \| B \| = t$. The vertex $v$ must be adjacent to all of one component:
    a nonneighbor in each would form an independent triple with $v$.
    That component together with $v$ is a clique of order $t + 1$, again a contradiction.
  Consequently $H$ is 2-connected and has a Hamiltonian cycle by Lemma 10. Its order is $n gt.eq k + 1$.
    If a current cycle has order $r > k + 1$, the graph induced by its vertices is Hamiltonian,
    has independence number at most two, and satisfies $r gt.eq k + 2 gt.eq 7$.
    Lemma 11 therefore produces a cycle of order $r - 1$. Repeated shortening reaches exactly $k + 1$,
    contradicting the hypothesis on $G$. ◻
]

== 6 Optimal path systems <sec:paths>

We now assume $k gt.eq 5$ and work in the graph $G$ from the minimal-counterexample reduction.
  Thus $G$ has no cycle of order $k + 1$, $delta \( G \) gt.eq k$, $alpha \( G \) lt.eq k$,
  and the independent-set expansion of Lemma 3 holds. Fix a maximum clique $Q$, and write

$ t = \| Q \| \, wide h = k + 1 - t . $

By Theorem 4, $max \( 3 \, floor.l k \/ 2 floor.r \) lt.eq t lt.eq k$, so $h gt.eq 1$.
  Our first objective is to encode paths through vertices outside $Q$ in a way that allows us to close them into a
  cycle of exactly the forbidden order. We then choose an optimal encoding and relate short paths outside its
  vertex set to separated sets of vertices.

=== 6.1 Paths joining clique vertices <paths-joining-clique-vertices>

A #emph[path system on $Q$] is a collection $cal(R)$ of simple paths with the following properties.
  Each path has two distinct endpoints in $Q$ and a nonempty interior contained in $V \( G \) \\ Q$.
  The interiors of different paths are disjoint. Represent each path by the edge joining its endpoints in an
  auxiliary graph with vertex set $Q$. These represented edges must be distinct and must form a linear forest:
  every component is a path, including isolated vertices. We call these components #emph[chains].
  In particular, every unused clique vertex is a singleton chain; it does not represent a path with empty interior.

The #emph[amount] of an assigned path is its number of internal vertices.
  For a system $cal(R)$, let $q \( cal(R) \)$ be the sum of its amounts,
  let $e \( cal(R) \)$ be its number of assigned paths, and let $v \( cal(R) \)$ be the number of clique vertices
  incident with its represented edges. Thus singleton chains contribute neither to the amount nor to the
  incident-vertex count. The empty collection is allowed.

#thm([Lemma 6.1.])[
  (Closing a path system).  #emph[Let $G$ be a finite simple graph with no cycle of order $k + 1$,
    and let $Q$ be a clique of size $t$, where $3 lt.eq t lt.eq k$. Put $h = k + 1 - t$.
    No path system on $Q$, of total amount $q$ and with $v$ incident clique vertices, satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ h lt.eq q lt.eq k + 1 - v . $ <path:forbidden-interval>]

]
] <path:interval>

#proof[
  Suppose such a system exists. The integer
  $ u = k + 1 - q - v $
  satisfies $0 lt.eq u lt.eq t - v$: the first inequality follows from the upper bound on $q$,
    and the second from $q gt.eq h$. Choose exactly $u$ of the clique vertices not incident with represented edges.
  Expand each nontrivial chain by replacing its represented edges with their assigned paths.
    Each expansion is a simple path, and different expansions are vertex-disjoint.
    Indeed, their clique vertices belong to different forest components,
    and all assigned interiors are disjoint and lie outside $Q$.
    Adjoin the $u$ chosen unused clique vertices as singleton paths. These paths together contain exactly
  $ q + v + u = k + 1 $
  vertices, and all their endpoints belong to $Q$.
  There is at least one nontrivial expanded chain, since $q gt.eq h gt.eq 1$.
    If there is only one path in the resulting list, it has at least three vertices:
    it contains an assigned path with nonempty interior. The clique edge between its distinct endpoints closes it
    into a simple cycle. If there are two or more paths, order and orient them arbitrarily,
    join each path’s last endpoint to the next path’s first endpoint by a clique edge,
    and close the last to the first. This again gives a simple cycle.
    In the case of two paths with one singleton, the two joining edges use the two distinct endpoints of the
    nontrivial path; thus they are distinct. The case of two singleton paths cannot occur.
    All remaining cases follow directly from vertex-disjointness.
    The resulting cycle has order $k + 1$, a contradiction. ◻
]

Choose a path system $cal(P)$ of maximum total amount $L$ subject to $L < h$.
  Among systems with this amount, choose one with the minimum number $e$ of assigned paths. This choice exists:
  the empty system has amount zero, and $G$ is finite. Write

#[#set math.equation(numbering: n => "(6.2)")
 $ S = Q union union.big_(P in cal(P)) #scale(x: 120%, y: 120%)[\(] V \( P \) \\ Q #scale(x: 120%, y: 120%)[\)] \,
   wide F = G - S . $ <path:system-vertices>]

Since the amounts are positive integers and the interiors are disjoint,

#[#set math.equation(numbering: n => "(6.3)")
 $ 0 lt.eq e lt.eq L lt.eq h - 1 = k - t \, wide \| S \| = t + L lt.eq k . $ <path:budget>]

In particular, $L = 0$ forces $e = 0$; this includes the case $t = k$.

The choice of $cal(P)$ and Lemma 13 give a single criterion that we will apply to modified systems.

#thm([Lemma 6.2.])[
  (Optimality criterion).  #emph[Let $cal(R)$ be any path system on $Q$, with total amount $A$,
    with $e'$ assigned paths, and with $v'$ incident clique vertices. Then
#[#set math.equation(numbering: n => "(6.4)")
 $ L + upright(bold(1))_({ e' gt.eq e }) lt.eq A lt.eq k + 1 - v' $ <path:optimality-interval>]

 is impossible, where the indicator is one when $e' gt.eq e$ and zero otherwise.]
] <path:optimality>

#proof[
  If $A gt.eq h$, Lemma 13 applies. If $A < h$ and $e' gt.eq e$, the lower bound gives $A gt.eq L + 1$,
    contrary to the maximality of $L$. If $A < h$ and $e' < e$, that lower bound gives $A gt.eq L$.
    Strict inequality again contradicts maximality, and equality contradicts the choice of $e$. ◻
]

#thm([Lemma 6.3.])[
  #emph[Every vertex of $S$ has at least $k + 1 - \| S \| gt.eq 1$ neighbors in $F$.]
] <path:exterior>

#proof[
  A vertex of $S$ has at most $\| S \| - 1$ neighbors in $S$ and has degree at least $k$. Now use (6.3). ◻
]

=== 6.2 Outside paths and separated balls <outside-paths-and-separated-balls>

The next definitions apply to any set $X subset.eq V \( G \)$;
  later $X$ will be $S$ or a set obtained by adding vertices to $S$.
  For distinct $x \, y in X$, an #emph[outside path relative to $X$ with parameter $d$] is a simple $x$–$y$ path
  with exactly $d$ internal vertices, all in $V \( G \) \\ X$. Its length is $d + 1$.
  We allow $d = 0$, which means the edge $x y$.

For $x in X$, define subsets of $V \( G \) \\ X$ by

#[#set math.equation(numbering: n => "(6.5)")
 $ B_0 \( x \; X \) = N_G \( x \) \\ X \, wide B_(r + 1) \( x \; X \) =
   N_(G - X) \[ B_r \( x \; X \) \] quad \( r gt.eq 0 \) . $ <path:balls>]

Thus $B_r \( x \; X \)$ consists of the vertices at distance at most $r$ in $G -
  X$ from the outside-neighbor set $B_0 \( x \; X \)$. Every vertex of this ball is joined to $x$ by a path of at
  most $r + 1$ edges whose remaining vertices lie outside $X$. The balls are nested and may be empty.

#thm([Lemma 6.4.])[
  (Separation by forbidden outside paths).  #emph[Let $X subset.eq V \( G \)$ and let $x \, y in X$ be distinct.]
  + #emph[For integers $r \, s gt.eq 0$, if no outside $x$–$y$ path relative to $X$ has parameter $d$ with $1
    lt.eq d lt.eq r + s + 2$, then $B_r \( x \; X \)$ and $B_s \( y \; X \)$ are disjoint and anticomplete.]
  + #emph[For an integer $r gt.eq 1$, if no such path has parameter $1 lt.eq d lt.eq r$,
    then $y$ has no neighbor in $B_(r - 1) \( x \; X \)$.]
] <path:separation>

#proof[
  If the two balls in the first assertion meet, concatenate their paths from $x$ and $y$ to a common vertex.
    This gives an $x$–$y$ walk of at most $r + s + 2$ edges, all of whose internal vertices lie outside $X$.
    Deleting repeated portions produces a simple outside path with at most $r + s + 1$ internal vertices.
    If instead an edge joins the two balls, use that edge between the two paths.
    The resulting walk has at most $r + s + 3$ edges and yields an outside path with at most $r + s +
    2$ internal vertices. In both cases the parameter is at least one,
    since the walk has no direct step from $x$ to $y$. Each case contradicts the hypothesis.
  For the second assertion, a vertex of $B_(r - 1) \( x \; X \)$ has a path from $x$ of at most $r$ edges with all
    subsequent vertices outside $X$. If that vertex were adjacent to $y$,
    appending the edge to $y$ would give an outside path with between one and $r$ internal vertices. ◻
]

When choosing separated sets, we also allow the singleton ${ x }$ as an option with #emph[radius label $- 1$].
  This is a separate convention; it is not an additional step of the recursion (6.5).
  An option with radius $r gt.eq 0$ means the ball $B_r \( x \; X \)$.

#thm([Corollary 6.5.])[
  (Singleton and ball compatibility).  #emph[Consider two options based at distinct vertices $x \, y in X$,
    with integer radius labels $r \, s gt.eq - 1$. If $r = s = - 1$,
    the two options are disjoint and anticomplete whenever $x y in.not E \( G \)$.
    Otherwise, they are disjoint and anticomplete whenever all outside $x$–$y$ paths relative to $X$ with parameters
$ 1 lt.eq d lt.eq r + s + 2 $

 are forbidden.]
] <path:singleton>

#proof[
  The case of two singletons is immediate, and the case $r \, s gt.eq 0$ is Lemma 16.
    It remains to consider $r = - 1$ and $s gt.eq 0$, after interchanging the options if necessary.
    The singleton ${ x }$ and the ball $B_s \( y \; X \)$ are disjoint because they lie in $X$ and
    $V \( G \) \\ X$, respectively. An edge between them would give an outside $x$–$y$ path with between one and
    $s + 1 = r + s + 2$ internal vertices, contrary to the hypothesis. ◻
]

Pairwise separated options allow independent sets chosen in them to be combined.
  In particular, if their individual independence numbers are at least $u_1 \, dots.h \, u_j$,
  then $G$ has an independent set of size at least $u_1 + dots.h.c + u_j$.
  We will use this observation to turn the path restrictions imposed by optimality into a contradiction to
  $alpha \( G \) lt.eq k$.

== 7 Short paths between representatives <sec:growth>

We retain the optimal path system $cal(P)$ and the notation $Q \, t \, h \, L \, e \, S \, F$ from Section 6,
  and assume throughout this section that $t gt.eq 9$. We shall choose one vertex of $S$ for each vertex of $Q$ so
  that an outside path between two chosen vertices can be inserted into the system without losing any of its old
  interior vertices. Neighborhood expansion will then force such an outside path with at most six internal vertices.

Orient each chain of the forest represented by $cal(P)$. For each #emph[target] $q in Q$,
  define its #emph[representative] $rho \( q \) in S$ as follows.
  If $q$ is the first vertex of its chain, including a singleton chain, set $rho \( q \) = q$.
  Otherwise its incoming path, read in the chosen orientation, has the form

$ p \, z_1 \, z_2 \, dots.h \, z_a \, q \, wide a gt.eq 1 \; $

set $rho \( q \) = z_1$, the first interior vertex after the predecessor $p$.
  The segment from $rho \( q \)$ to $q$ therefore contains all $a$ interior vertices of the incoming path.
  The representatives are distinct, since different incoming paths have disjoint interiors and only chain starts
  are represented by clique vertices. Write $R = { rho \( q \) : q in Q }$, so $\| R \| = t$.

#thm([Lemma 7.1.])[
  (Replacing incoming paths).  #emph[Fix an orientation of the chains and distinct targets $q \, q' in Q$.
    Suppose an outside path relative to $S$ joins $rho \( q \)$ to $rho \( q' \)$ and has $d gt.eq
    1$ internal vertices. Let $r in { 0 \, 1 \, 2 }$ be the number of these two targets that have an incoming
    path. Deleting those $r$ paths from $cal(P)$ and inserting one new path from $q$ to $q'$ gives a valid path
    system with total amount $L + d$ and $e + 1 - r$ paths. It retains all the interior vertices of $cal(P)$.]
] <grow:replacement>

#proof[
  At each target with an incoming path, retain its segment from the representative to the target.
    At a chain start the corresponding segment consists only of the target.
    Concatenate the reverse of the segment at $q$, the given outside path, and the segment at $q'$.
    Figure 2 illustrates the construction with two incoming paths.
    The two retained segments have disjoint interiors, and the outside path has its interior in $F = G - S$,
    so the resulting path is simple. In particular, a retained segment contains no clique vertex except its own
    target. This remains true when the two targets are consecutive on one chain.
  After deleting the incoming paths, each target has degree at most one in the represented forest,
    and the targets lie in different components. If they belonged to different chains, this is immediate.
    If they belonged to the same chain, deleting the incoming edge at the later target separates them.
    The new edge between the targets thus creates neither a cycle nor a vertex of degree greater than two.
    It gives a valid linear forest.
  If the deleted paths have total amount $A$, their retained segments contribute exactly $A$ interior vertices to
    the new path. Its amount is therefore $A + d$, while the unchanged paths contribute $L - A$.
    The total is $L + d$, and the number of paths is $e - r + 1$. ◻
]

#thm([Lemma 7.2.])[
  (One-vertex detours).  #emph[For every orientation of the chains,
    no outside path relative to $S$ with one internal vertex joins two distinct representatives.
    Nor can such a path join consecutive vertices of any path of $cal(P)$.]
] <grow:one>

#proof[
  The first type of path would give a system of amount $L + 1$ by Lemma 18.
    For the second type, replace the step between the consecutive vertices by the proposed two-edge path.
    This keeps the represented forest and every old interior vertex, again increasing the amount to $L + 1$.
  Since $L < h$, either $L + 1 < h$, contrary to maximality of $L$, or $L + 1 = h$.
    In the latter case the new system has at most $t$ incident clique vertices,
    and hence lies in the forbidden interval of Lemma 13. ◻
]

We next translate these exclusions into growth of the balls defined in Section 6.
  Fix an orientation and a representative $x in R$. An outside neighbor $u in B_0 \( x \; S \)$ exists because $\|
  S \| lt.eq k$ and $delta \( G \) gt.eq k$. By Lemma 19, $u$ misses the other $t - 1$ representatives.
  Since its closed neighborhood in $F$ lies in $B_1 \( x \; S \)$, we obtain

#[#set math.equation(numbering: n => "(7.1)")
 $ \| B_1 \( x \; S \) \| gt.eq 1 + deg_F \( u \) gt.eq 1 + k -
   #scale(x: 120%, y: 120%)[\(] \| S \| - \( t - 1 \) #scale(x: 120%, y: 120%)[\)] = k - \| S \| + t . $ <grow:degree>]

Moreover, if some $y in S \\ R$ is missed by every vertex of $B_0 \( x \; S \)$,
  the same count improves the right-hand side by one. Only the one-vertex exclusions are needed for this degree
  estimate.

#thm([Lemma 7.3.])[
  (Independence in the second ball).  #emph[Fix an orientation and $x in R$.
    Suppose no outside path relative to $S$ with one or two internal vertices joins $x$ to any other
    representative. Then
$ alpha #scale(x: 120%, y: 120%)[\(] B_2 \( x \; S \) #scale(x: 120%, y: 120%)[\)] gt.eq 2 . $

 If, in addition, $B_1 \( x \; S \)$ is not a clique and $t < k$, then $alpha \( B_2 \( x \; S \) \) gt.eq 3$.]
] <grow:weights>

#proof[
  Every vertex of $B_1 \( x \; S \)$ misses $R \\ { x }$: an adjacency to another representative would give an
    outside path with one or two internal vertices.
  Suppose first that $B_2 \( x \; S \)$ were a clique. It contains $B_1 \( x \; S \)$,
    whose order is at least $k - \| S \| + t gt.eq t$ by (7.1). Since the maximum clique size is $t$, this forces
  $ B_1 \( x \; S \) = B_2 \( x \; S \) \, wide \| B_1 \( x \; S \) \| = t \, wide \| S \| = k . $
  Each vertex $z$ of this ball has at most $t - 1$ neighbors in $F$,
    because all those neighbors lie in $B_2 \( x \; S \)$. It also has at most $k - t + 1$ neighbors in $S$,
    since it misses the other representatives. As $deg_G \( z \) gt.eq k$, both bounds are attained.
    In particular every such $z$ is adjacent to $x$. The ball together with $x$ is then a clique of order $t + 1$,
    a contradiction. Thus $B_2 \( x \; S \)$ is not a clique and has an independent pair.
  Now suppose that $B_1 \( x \; S \)$ contains an independent pair $I$.
    Its closed neighborhood in $F$ lies in $B_2 \( x \; S \)$, and its neighborhood in $S$ avoids $R \\ { x }$.
    The expansion bound of Lemma 3 gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ \| B_2 \( x \; S \) \| gt.eq 2 k + 1 - #scale(x: 120%, y: 120%)[\(] \| S \| - \( t - 1 \)
     #scale(x: 120%, y: 120%)[\)] = 2 k - \| S \| + t gt.eq k + t . $ <grow:pair-expansion>]
  When $t < k$, this is greater than $max \( k \, 2 t \)$, so Lemma 12 gives an independent triple. ◻
]

The independent pairs in the second balls may already give a contradiction.
  When they do not, the only remaining obstruction to obtaining independent triples is a first ball that is a
  clique of order $t$ with $\| S \| = k$. In that case, the structure of the path system will supply an additional
  excluded neighbor for at least two representatives.

#thm([Lemma 7.4.])[
  (A short outside path).  #emph[Suppose $t gt.eq 9$. For every fixed orientation of the chains of $cal(P)$,
    two distinct representatives are joined by an outside path relative to $S$ with $1 lt.eq d lt.eq
    6$ internal vertices. By Lemma 19, such a path in fact has $2 lt.eq d lt.eq 6$.]
] <grow:short>

#proof[
  Fix an orientation and suppose that no such path exists. Lemma 16 makes the $t$ balls $B_2 \( x \; S \)$,
    $x in R$, pairwise disjoint and anticomplete. Each has an independent pair by Lemma 20,
    so together they give an independent set of order at least $2 t$.
    If $2 t > k$, this contradicts $alpha \( G \) lt.eq k$; this also settles the case $t =
    k$ without using the independent-triple conclusion.
  We may therefore assume $2 t lt.eq k$. The bound $floor.l k \/ 2 floor.r lt.eq t$ from Theorem 4 now gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ k in { 2 t \, 2 t + 1 } . $ <grow:parity>]
  In particular $t < k$, and it suffices to find two representatives whose first balls are not cliques.
    Lemma 20 would then give a combined independent set of order at least $2 t + 2 > k$.
  If $\| S \| < k$, equation (7.1) gives $\| B_1 \( x \; S \) \| > t$ at every representative, so any two suffice.
    It remains to consider $\| S \| = k$. In this case $L = k - t > 0$, and hence $e gt.eq 1$.
  Suppose first that $e gt.eq 2$. At least two representatives are interior vertices of paths of $cal(P)$.
    For each such representative $x$, let $y$ be the next vertex toward its target. This vertex is not in $R$:
    it is either a later interior vertex of the same path, or, when the amount is one, the target itself,
    which is not a chain start. By the consecutive-vertex assertion of Lemma 19,
    every outside neighbor of $x$ misses $y$. The improved degree count following (7.1) yields
  $ \| B_1 \( x \; S \) \| gt.eq k - \| S \| + t + 1 = t + 1 . $
  Thus the two chosen first balls are not cliques.
  Finally suppose that $e = 1$. The represented forest has one nonsingleton chain, consisting of a single edge,
    and $t - 2 gt.eq 7$ singleton chains. Let $x$ be the representative of any singleton chain.
    Reverse the nonsingleton chain, leaving every other orientation fixed,
    and let $y$ be its new starting clique vertex. The vertex $y$ was not in the original representative set $R$,
    whereas $x$ is a representative in both orientations. Lemma 19, applied to the reversed orientation,
    shows that every outside neighbor of $x$ misses $y$. Consequently $\| B_1 \( x \; S \) \| gt.eq t +
    1$ once again. Choosing two singleton representatives gives the two required noncliques and the final
    contradiction. The reversed orientation was used only for the unconditional one-vertex exclusion;
    the assumed absence of paths with up to six internal vertices concerned the original orientation alone. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.2), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((0, 1.235), [$p$], anchor: "south")
  circle((1.4, 1.2), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((1.4, 1.235), [$rho (q)$], anchor: "south")
  circle((4.8, 1.2), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((4.8, 1.235), [$q$], anchor: "south")
  circle((0, -1.2), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((0, -1.235), [$p'$], anchor: "north")
  circle((1.4, -1.2), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((1.4, -1.235), [$rho (q')$], anchor: "north")
  circle((4.8, -1.2), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((4.8, -1.235), [$q'$], anchor: "north")
  line((0, 1.2), (1.4, 1.2), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.4, 1.2), (0, -1.2), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, -1.2), (1.4, -1.2), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.4, 1.2), (4.8, 1.2), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.4, -1.2), (4.8, -1.2), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((1.4, 1.2), (1.4, -1.2), (0.6333, 0.6631), (0.6333, -0.6631), stroke: (thickness: 1.2pt, miter-limit: 10))
  content((0.7191, 2.776e-17), [$d$ new vertices], anchor: "east", padding: 0.1176cm)
  content((3.3, 0.78), [$a$ interior vertices])
  content((3.3, -0.78), [$b$ interior vertices])
  content((3.2, 0), [new path: $q arrow.l.r.long q'$])
})],
  caption: [Figure 2: Representative replacement when both targets have incoming paths. Each representative is the #emph[first] interior vertex on its incoming path. Deleting the initial edge of each incoming path leaves its full representative-to-target segment available. The new path has amount $a + b + d$, so the entire system has amount $L + d$. Lemma 18 also treats a target at a chain start and two targets on the same original chain. Dashed initial steps are not used by the new path. ],
) <fig:representatives>

== 8 Excluding large cliques <sec:terminal>

We retain the notation of Section 6 and assume $t gt.eq 9$.
  Our goal is to obtain more than $k$ independent vertices by combining independent sets in separated balls.
  Lemma 21 supplies a short outside path between representatives.
  We first show that such a path forces the optimal system $cal(P)$ into one of three configurations. By Theorem 4,

$ t lt.eq k lt.eq 2 t + 1 \, wide h = k + 1 - t \, wide L lt.eq k - t lt.eq t + 1 . $

=== 8.1 A restriction on small increases in amount <a-restriction-on-small-increases-in-amount>

The next lemma applies to any valid replacement system, not only to the construction between representatives.

#thm([Lemma 8.1.])[
  #emph[Let $t gt.eq 9$, and let $cal(R)$ be a valid path system consisting of some paths of $cal(P)$ and one new
    path. Suppose that its total amount is $L + d$, where $1 lt.eq d lt.eq 6$. Then
$ L = h - 1 = k - t . $

 Moreover, $cal(R)$ contains all $e$ paths of $cal(P)$, its new path has amount $d$,
   and every old path has amount at least $d$. In particular,
   a construction of this kind that removes an old path is impossible.]
] <terminal:increment>

#proof[
  If $L + d < h$, then $cal(R)$ contradicts the maximality of $L$.
    Otherwise choose an inclusion-minimal subcollection of $cal(R)$ with amount at least $h$.
    Write its amount as $h + j$, its number of paths as $r$, and its number of incident clique vertices as $w$.
    The subcollection contains the new path, since the old paths have total amount $L < h$. Also
  $ 0 lt.eq j lt.eq 5 \, $
  because $h + j lt.eq L + d lt.eq h + 5$. Lemma 13 gives
  $ h + j > k + 1 - w \, wide upright("or equivalently") wide w > t - j . $
  Since $w lt.eq t$, this also excludes $j = 0$. Thus
  #[#set math.equation(numbering: n => "(8.1)")
   $ 1 lt.eq j lt.eq 5 \, wide 2 r gt.eq w gt.eq t - j + 1 . $ <terminal:minimal>]
  Deleting any selected path lowers the amount below $h$; consequently every selected amount is at least $j + 1$.
    Suppose that all were at least $j + 2$. Exactly $r - 1$ of the selected paths are old, so
  $ \( r - 1 \) \( j + 2 \) lt.eq L lt.eq k - t . $
  Together with (8.1), this implies
  $ \( t - j - 1 \) \( j + 2 \) lt.eq 2 \( k - t \) lt.eq 2 t + 2 . $
  The left side is a concave function of $j$ on $\[ 1 \, 5 \]$.
    Its endpoint values are $3 \( t - 2 \)$ and $7 \( t - 6 \)$, whose differences from $2 t +
    2$ are respectively $t - 8$ and $5 t - 44$. Both are positive for $t gt.eq 9$, a contradiction.
  Some selected path therefore has amount exactly $j + 1$. Deleting it, whether it is old or new,
    leaves a valid system of amount $h - 1$. Maximality gives $L = h - 1$.
    The minimum-path tie-break in the choice of $cal(P)$ now gives $r - 1 gt.eq e$.
    On the other hand, $cal(R)$ has at most $e + 1$ paths, so $r lt.eq e + 1$. Hence $r = e + 1$:
    the selected subcollection is all of $cal(R)$, and all old paths occur in it.
    Comparing its two expressions for the total amount gives
  $ h + j = L + d = h - 1 + d \, wide j = d - 1 . $
  Thus every selected amount is at least $j + 1 = d$, and, since all old paths remain,
    the new path has amount exactly $d$. ◻
]

=== 8.2 The three possible configurations <the-three-possible-configurations>

Call a vertex of $Q$ #emph[missing] if it is not incident to any path of $cal(P)$.
  Thus the missing vertices are precisely the singleton chains of its represented forest.
  Let $v$ denote the number of incident vertices, so there are $t - v$ missing vertices.

#thm([Lemma 8.2.])[
  #emph[Suppose that, for some orientation of the chains, an outside path with parameter $d in { 1 \, dots.h \,
    6 }$ joins two representatives. Then $L = k - t$, and exactly one of the following alternatives holds:]
  + #emph[ $d = 2$, $v gt.eq t - 2$, and every old amount is at least two;]
  + #emph[ $d = 3$, $t in { 9 \, 11 }$, $e = \( t - 3 \) \/ 2$, and $v = t - 3$;
    the old paths represent a matching and have amounts at least three;]
  + #emph[ $d = 5$, $t = 9$, $k = 19$, $e = 2$, and $v = 4$;
    the old paths represent a matching and both have amount five.]
  #emph[In every alternative, the two targets must be starting vertices in their oriented chains.
    In Alternative Lemma 8.2 their union must contain all missing vertices.
    In Alternatives Lemma 8.2 and Lemma 8.2 both targets must be missing.]
  #emph[Once one of these alternatives holds, its parameter and endpoint restrictions apply to every outside path
    with parameter between one and six between representatives, in every orientation.]
] <terminal:classification>

#proof[
  Lemma 18 constructs a valid system of amount $L + d$, consisting of unchanged old paths and one new path.
    Lemma 22 shows that no old path was removed. The two targets must therefore be starting vertices,
    and every old amount is at least $d$. The proof of Lemma 22 also gives $j = d - 1 gt.eq 1$, so $d gt.eq 2$.
  Let $a in { 0 \, 1 \, 2 }$ be the number of missing targets among these two vertices.
    The new system has exactly $v + a$ incident vertices. Its amount is $h + d - 1$; hence Lemma 13 gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ v + a gt.eq t - d + 2 . $ <terminal:incident>]
  In particular, $v gt.eq t - d$. Since $v lt.eq 2 e$ and every old amount is at least $d$, we obtain
  #[#set math.equation(numbering: n => "(8.3)")
   $ 2 lt.eq d lt.eq 6 \, wide d ⌈frac(t - d, 2)⌉ lt.eq d e lt.eq L = k - t lt.eq t + 1 . $ <terminal:arithmetic>]
  For $d = 2$, this gives $v gt.eq t - 2$. Equation (8.2) says that $v + a gt.eq t$,
    so the two targets must cover all $t - v$ missing vertices.
  For $d = 3$, dropping the ceiling in (8.3) gives $3 \( t - 3 \) lt.eq 2 \( t + 1 \)$, and hence $t lt.eq 11$.
    At $t = 10$, the exact bound fails because $3 ceil.l 7 \/ 2 ceil.r = 12 > 11$.
    At $t = 9$ it forces $e = 3$, and at $t = 11$ it forces $e = 4$. In each case
  $ t - 3 lt.eq v lt.eq 2 e = t - 3 . $
  Thus $v = 2 e = t - 3$, so no two old edges share a clique vertex. Equation (8.2) then forces $a = 2$.
  For $d = 4$, the weaker bound $4 \( t - 4 \) lt.eq 2 \( t + 1 \)$ gives $t lt.eq 9$; but at $t =
    9$ the exact bound fails: $4 ceil.l 5 \/ 2 ceil.r = 12 > 10$.
    For $d = 5$, the weaker bound gives $3 t lt.eq 27$, hence $t = 9$.
    Now $2 lt.eq e lt.eq 2$ and $4 lt.eq v lt.eq 2 e = 4$. Moreover,
  $ 10 = 5 e lt.eq L lt.eq t + 1 = 10 \, $
  so $L = 10$, $k = 19$, and both amounts are five. Again (8.2) forces $a = 2$.
    Finally, for $d = 6$, the weaker bound gives $4 t lt.eq 38$, hence $t = 9$; there $6 ceil.l 3 \/ 2 ceil.r =
    12 > 10$, which is impossible.
  The three surviving alternatives are mutually exclusive properties of the fixed old system: they require respectively
  $ v gt.eq t - 2 \, wide v = t - 3 \, wide t = 9 \, med v = t - 5 . $
  The argument applies to every orientation and every pair admitting a path with parameter between one and six.
    Thus, once the old system lies in one alternative, any such path in any orientation must obey the
    corresponding parameter and endpoint restrictions. ◻
]

=== 8.3 Independent sets in balls <independent-sets-in-balls>

We next obtain bounds that apply to each representative individually.
  When choosing several balls later, we will check their pairwise separation separately.

#thm([Lemma 8.3.])[
  #emph[Under any alternative of Lemma 23, there are at least two nonsingleton chains.
    For every vertex $x$ that is a representative in some orientation,
$ \| B_1 \( x \; S \) \| gt.eq t + 1 \, wide alpha \( B_1 \( x \; S \) \) gt.eq 2 . $

 If $k gt.eq 2 t$, then also $alpha \( B_2 \( x \; S \) \) gt.eq 3$.]
] <terminal:weights>

#proof[
  The matching in Alternative Lemma 8.2 has three or four edges, and that in Alternative Lemma 8.2 has two.
    In Alternative Lemma 8.2, if there were only one nonsingleton chain, then
  $ v = e + 1 lt.eq ⌊frac(t + 1, 2)⌋ + 1 < t - 2 \, $
  contrary to $v gt.eq t - 2$. Here $2 e lt.eq L lt.eq t + 1$ was used.
    There cannot be no nonsingleton chain, since $v gt.eq t - 2 > 0$.
  Fix an orientation in which $x$ is a representative. Choose a nonsingleton chain other than the chain containing
    its target, and reverse only that chain. Its old terminal clique vertex becomes a representative,
    although it was not one of the original representatives; meanwhile $x$ remains a representative.
    By Lemma 19, every vertex of $B_0 \( x \; S \)$ is nonadjacent to the other $t -
    1$ original representatives and to this additional clique vertex.
  Lemma 23 gives $\| S \| = t + L = k$. The set $B_0 \( x \; S \)$ is nonempty, because $delta \( G \) gt.eq
    k$ and $\| S \| lt.eq k$. For $z in B_0 \( x \; S \)$, its closed neighborhood has size at least $k + 1$,
    meets $S$ in at most $\| S \| - t$ vertices, and is contained in $S union B_1 \( x \; S \)$. Therefore
  $ \| B_1 \( x \; S \) \| gt.eq k + 1 - \( \| S \| - t \) = t + 1 . $
  Since $t$ is the maximum clique size, this ball contains an independent pair $I$.
    The expansion inequality (2.2) and the containment $N_G \[ I \] subset.eq S union B_2 \( x \; S \)$ give
  $ \| B_2 \( x \; S \) \| gt.eq 2 k + 1 - \| S \| = k + 1 . $
  If $k gt.eq 2 t$, this exceeds $max \( k \, 2 t \)$, so Lemma 12 supplies an independent triple. ◻
]

=== 8.4 The final packings <the-final-packings>

#thm([Proposition 8.4.])[
  #emph[There is no counterexample $G$ with maximum clique size $t gt.eq 9$.]
] <terminal:contradiction>

#proof[
  By Lemma 21, some pair of representatives admits an outside path with parameter between one and six.
    We may therefore apply Lemma 23. In each of its alternatives we will choose balls with distinct bases that are
    pairwise disjoint and anticomplete. Independent sets in these balls then combine into an independent set in $G$.
  ===== 8.4.1 Alternative Lemma 8.2: at least one missing vertex. <alternative-terminaltwo-at-least-one-missing-vertex.>
  Put $c = t - v$, so $0 lt.eq c lt.eq 2$, and first suppose $c gt.eq 1$.
    Fix an orientation and choose the $v = t - c$ representatives whose targets are incident to old paths.
    No pair of these targets covers the missing vertices. The endpoint restriction in Lemma 23 therefore forbids
    every outside parameter $1 \, dots.h \, 6$ between any two chosen representatives.
    Their radius-two balls are pairwise disjoint and anticomplete by Lemma 16.
  We claim that each of these balls contains an independent triple, even when $k < 2 t$. First,
  $ k = t + L gt.eq t + 2 e gt.eq t + v gt.eq 2 t - 2 . $
  For a chosen base $x$, Lemma 24 gives an independent pair $I subset.eq B_1 \( x \; S \)$.
    There are at least two other chosen representatives, since $v gt.eq t - 2 gt.eq 7$.
    For either such representative $y$, the prohibition of parameters one and two means that $y$ has no neighbor
    in $B_1 \( x \; S \)$, by Lemma 16. Thus at least two vertices of $S$ are absent from $N_G \[ I \]$.
    Since $\| S \| = k$, expansion gives
  $ \| B_2 \( x \; S \) \| gt.eq 2 k + 1 - \( \| S \| - 2 \) = k + 3 gt.eq 2 t + 1 . $
  This exceeds both $k$ and $2 t$, so Lemma 12 proves the claim.
    The separated balls now give an independent set of size at least
  $ 3 \( t - c \) gt.eq 3 t - 6 > 2 t + 1 gt.eq k \, $
  a contradiction.
  ===== 8.4.2 Alternative Lemma 8.2: no missing vertex. <alternative-terminaltwo-no-missing-vertex.>
  Now $c = 0$. The bounds
  $ t = v lt.eq 2 e lt.eq L lt.eq t + 1 $
  give $e = ceil.l t \/ 2 ceil.r$ and $k = t + L gt.eq 2 t$.
    Lemma 24 therefore gives an independent triple in the radius-two ball of any representative.
    We select at least $t - 1$ interior vertices as follows.
  If $t$ is even, then $e = t \/ 2$ and $v = 2 e$, so the represented forest is a matching.
    Every amount is at least two, and $L lt.eq 2 e + 1$, so at most one amount exceeds two; if it does,
    it is three. Choose both interior vertices on each amount-two path,
    and one first interior vertex on the possible amount-three path. This chooses $t$ or $t - 1$ vertices.
  If $t$ is odd, then $2 e = t + 1$, so $L = t + 1$ and every amount is two.
    The forest has $v - e = e - 1$ nonsingleton chains and $e$ edges.
    Exactly one chain therefore has two edges, and all the others have one.
    Choose the two interior representatives of the two-edge chain in one fixed orientation.
    On each single-edge chain choose both interior vertices. This chooses
  $ 2 + 2 \( e - 2 \) = t - 1 $
  vertices.
  Every chosen vertex is an interior representative in some orientation.
    Two chosen vertices on different chains can be representatives simultaneously,
    because the chains can be oriented independently. The two chosen vertices in the two-edge chain are
    simultaneous representatives by their definition. For any of these pairs,
    an outside path with parameter $1 lt.eq d lt.eq 6$ would give, by Lemma 18, a new system of amount $L +
    d$ that removes an old path. Lemma 22 rules this out.
  The only pairs not yet covered are the two interior vertices $a \, b$ of a single amount-two path $u \, a \,
    b \, v$. If an outside $a$-to-$b$ path with parameter $1 lt.eq d lt.eq 6$ existed,
    replace the step $a b$ by it. The resulting $u$-to-$v$ path has amount $2 + d$.
    Replacing the old path produces a valid system of amount $L + d$, consisting of $e -
    1$ unchanged paths and one new path. This again contradicts Lemma 22, which requires all old paths to remain.
  Thus every pair of chosen bases forbids parameters $1 \, dots.h \, 6$.
    Their radius-two balls are separated and give an independent set of size at least
  $ 3 \( t - 1 \) > 2 t + 1 gt.eq k \, $
  another contradiction.
  ===== 8.4.3 Alternative Lemma 8.2. <alternative-terminalthree.>
  Here $e = \( t - 3 \) \/ 2$, every amount is at least three, and
  $ k = t + L gt.eq t + 3 e = frac(5 t - 9, 2) gt.eq 2 t \, $
  since $t in { 9 \, 11 }$. In a fixed orientation, choose the representatives of all $t -
    3$ incident targets and one missing target. No pair has two missing targets,
    so the endpoint restriction forbids every parameter $1 \, dots.h \, 6$ between chosen representatives.
    Their $t - 2$ radius-two balls are separated and each contains an independent triple. They give
  $ 3 \( t - 2 \) > 2 t + 1 gt.eq k \, $
  which is impossible.
  ===== 8.4.4 Alternative Lemma 8.2. <alternative-terminalfive.>
  Here $t = 9$ and $k = 19$. Fix an orientation. At the four representatives with incident targets take radius-two
    balls, and at the five representatives with missing targets take radius-one balls.
    Among parameters $1 \, dots.h \, 6$, the only potentially permitted parameter between representatives is five,
    and that requires two missing targets. Consequently, incident–incident pairs forbid parameters $1 \, dots.h \,
    6$, incident–missing pairs forbid parameters $1 \, dots.h \, 5$,
    and missing–missing pairs forbid parameters $1 \, dots.h \, 4$.
    These are exactly the prohibitions required by Lemma 16 for radius pairs $\( 2 \, 2 \)$, $\( 2 \, 1 \)$,
    and $\( 1 \, 1 \)$, respectively. All nine balls are therefore pairwise disjoint and anticomplete.
    Lemma 24, using $19 gt.eq 2 dot.op 9$, supplies independent sets of total size
  $ 4 dot.op 3 + 5 dot.op 2 = 22 > 19 . $
  This final contradiction excludes every alternative and proves the proposition. ◻
]

== 9 The finite path-system argument <sec:finite>

It remains to treat maximum cliques of order at most eight.
  The clique bound in Theorem 4 makes this a finite problem:
  if $floor.l k \/ 2 floor.r lt.eq t lt.eq 8$, then $k lt.eq 2 t + 1 lt.eq 17$.
  We shall rule out the optimal path systems of Section 6 by a finite list of deductions from their required
  edges. The objects enumerated are weighted path systems; the ambient graphs are not enumerated.

#thm([Proposition 9.1.])[
  (Finite verification).  #emph[Let $k \, t$ be integers such that
#[#set math.equation(numbering: n => "(9.1)")
 $ 5 lt.eq k lt.eq 17 \, wide max { 3 \, floor.l k \/ 2 floor.r } lt.eq t lt.eq min { 8 \, k } . $ <finite:domain>]

 There is no finite simple graph $G$ satisfying all of the following:
   $G$ has no cycle on exactly $k + 1$ vertices, its clique number is $t$, $alpha \( G \) lt.eq k$, and
$ \| N_G \[ I \] \| gt.eq k \| I \| + 1 quad upright("for every nonempty independent set ") I subset.eq V \( G \) . $

 More precisely, every optimal path system on a maximum clique, chosen as in Section 6,
   gives a contradiction under these hypotheses.]
] <finite:verified>

The proof will be completed after we establish the deductions used by the computation and give its verified
  results. Throughout this section, suppose that such a graph exists.
  Fix a maximum clique $Q$ of order $t$, put $h = k + 1 - t$,
  and choose a path system $cal(P)$ of maximum total amount $L < h$,
  with the number $e$ of its paths as small as possible. An amount is the number of internal vertices of the
  corresponding path. In particular,

#[#set math.equation(numbering: n => "(9.2)")
 $ 0 lt.eq L lt.eq k - t \, wide S = Q union union.big_(R in cal(P)) #scale(x: 120%, y: 120%)[\(] V \( R \) \\ Q
   #scale(x: 120%, y: 120%)[\)] \, wide \| S \| = t + L lt.eq k . $ <finite:budget>]

The expansion hypothesis gives $delta \( G \) gt.eq k$. We also retain the forbidden amount interval from
  Lemma 13, the separation rules of Lemma 16, and the size test of Lemma 12.

=== 9.1 Patterns and their complete enumeration <patterns-and-their-complete-enumeration>

The paths of $cal(P)$ represent the edges of a linear forest on $Q$.
  Include every unused vertex of $Q$ as a singleton component of this forest.
  Orient a component temporarily and list its edge amounts in order,
  obtaining a tuple $p = \( q_1 \, dots.h \, q_r \)$ of positive integers.
  A singleton has the empty tuple $\( \)$. Reversing the component reverses its tuple,
  so we choose the lexicographically smaller of these two tuples.
  Sort the resulting component tuples in nondecreasing lexicographic order, retaining repeated components. Their list

$ P = \( p_1 \, dots.h \, p_c \) $

is the #emph[pattern] of the path system. For a tuple $p$,
  write $ell \( p \)$ for its number of entries and $sigma \( p \)$ for their sum,
  with both quantities zero when $p = \( \)$. Thus

#[#set math.equation(numbering: n => "(9.3)")
 $ sum_(i = 1)^c #scale(x: 120%, y: 120%)[\(] ell \( p_i \) + 1 #scale(x: 120%, y: 120%)[\)] = t \, wide
   sum_(i = 1)^c sigma \( p_i \) = L lt.eq k - t \, wide sum_(i = 1)^c ell \( p_i \) =
   e . $ <finite:pattern-parameters>]

#thm([Lemma 9.2.])[
  (Pattern coverage).  #emph[For nonnegative integers $t \, B$,
    the nondecreasing lists of reversal-normalized positive tuples satisfying
$ sum_(p in P) \( ell \( p \) + 1 \) = t \, wide sum_(p in P) sigma \( p \) lt.eq B $

 represent exactly once the isomorphism classes of linear forests on $t$ vertices with positive integer edge
   amounts of total at most $B$. Here empty tuples are allowed as singleton components.]
  #emph[All these lists are generated by the following recursion.
    Choose a first tuple $p$ with $ell \( p \) lt.eq t - 1$ and $sigma \( p \) lt.eq B$,
    subject to reversal normalization and any prescribed lower bound on $p$.
    Continue with $t - ell \( p \) - 1$ vertices, budget $B - sigma \( p \)$,
    and lower bound $p$ on the next tuple. At zero remaining vertices,
    emit the empty list for every remaining nonnegative budget.]
] <finite:coverage>

#proof[
  An isomorphism of two nontrivial paths either preserves or reverses their endpoint order.
    Therefore their weighted isomorphism classes agree exactly when their amount tuples agree up to reversal.
    A forest isomorphism permutes components and acts in this way within each one.
    Reversal normalization followed by sorting consequently gives a complete invariant, with multiplicities preserved.
  Every candidate first tuple is obtained by listing positive integer compositions of each amount from zero to
    $B$, restricting the number of entries to at most $t - 1$. The amount-zero candidate is just the empty tuple.
    For example, one may start with the empty tuple and repeatedly append a positive integer no larger than the
    remaining budget. Each tuple is reached once. Normalization and the lower bound are tested when selecting a
    component; a rejected prefix must still be extended, since a longer tuple can satisfy these conditions even
    when its prefix does not.
  Now induct on $t$. For $t = 0$ the empty list is the unique pattern, regardless of unused budget.
    For $t > 0$, the first tuple consumes $ell \( p \) + 1 gt.eq 1$ vertices and $sigma \( p \)$ amount.
    The inductive hypothesis supplies every allowed tail exactly once,
    while its lower bound $p$ enforces nondecreasing order. Conversely,
    every permitted list has exactly this first tuple and one of these tails.
    This proves both coverage and uniqueness. ◻
]

In particular, a system containing no paths is represented by $t$ empty component tuples.
  The outer empty list instead represents a forest on zero vertices. Unused amount budget is allowed:
  optimality does not require $L = k - t$. Enumerating some patterns that cannot occur as optimal systems causes
  no difficulty; Lemma 27 ensures that every system that could occur is present.

There are exactly $42$ parameter pairs in (9.1), and their pattern lists contain $3099$ instances in total.
  A pattern appearing for two different parameter pairs is counted once for each pair. Table 1 gives the counts.
  For completeness, these numbers have a separate elementary enumeration.
  If $a \( r \, m \)$ denotes the number of chain types with $r gt.eq 1$ edges and amount $m gt.eq r$,
  reversal pairs all positive compositions except the palindromes. Hence

#[#set math.equation(numbering: n => "(9.4)")
 $ a \( r \, m \) = 1 / 2 (binom(m - 1, r - 1) + b \( r \, m \)) \, $ <finite:chain-count>]

where

$ b \( 2 s \, m \) & =
  cases(delim: "{", binom(m \/ 2 - 1, s - 1) \, & m upright(" even") \,, 0 \, & m upright(" odd") \,)\
b \( 2 s + 1 \, m \) & = binom(floor.l \( m - 1 \) \/ 2 floor.r, s) . $

The even formula follows by pairing equal entries; the odd formula also allows a positive central entry and sums
  over the paired entries. The case $s = 0$ in the odd formula gives one type with a single edge.
  Choosing a multiset of chain types and then singleton components shows that the count for $\( t \, B \)$ is

#[#set math.equation(numbering: n => "(9.5)")
 $ sum_(L = 0)^B \[ x^t y^L \] thin frac(1, 1 - x) product_(r gt.eq 1)
   product_(m gt.eq r) \( 1 - x^(r + 1) y^m \)^(- a \( r \, m \)) . $ <finite:count-series>]

Only factors with $r + 1 lt.eq t$ and $m lt.eq B$ contribute.
  Thus the table can be checked by finite integer arithmetic independently of the deductions that exclude the patterns.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[admissible $t$
], table.cell(rowspan: 1, colspan: 1)[number of patterns, summed over $t$
]),
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$3 \, 4 \, 5$
], table.cell(rowspan: 1, colspan: 1)[$4 + 2 + 1 = 7$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$3 \, 4 \, 5 \, 6$
], table.cell(rowspan: 1, colspan: 1)[$6 + 5 + 2 + 1 = 14$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$3 \, 4 \, 5 \, 6 \, 7$
], table.cell(rowspan: 1, colspan: 1)[$9 + 9 + 5 + 2 + 1 = 26$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$4 \, 5 \, 6 \, 7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$16 + 10 + 5 + 2 + 1 = 34$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$4 \, 5 \, 6 \, 7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$25 + 20 + 11 + 5 + 2 = 63$
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$5 \, 6 \, 7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$35 + 24 + 11 + 5 = 75$
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[$5 \, 6 \, 7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$60 + 46 + 25 + 11 = 142$
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[$6 \, 7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$87 + 51 + 26 = 164$
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[$6 \, 7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$152 + 104 + 55 = 311$
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[$7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$197 + 118 = 315$
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[$7 \, 8$
], table.cell(rowspan: 1, colspan: 1)[$364 + 237 = 601$
],
  table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$468$
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$879$
],
)
]],
  caption: [Table 1: All admissible parameter pairs and their pattern counts, with amount budget $B = k - t$. These are counts of weighted forests, not of ambient graphs. ],
)

=== 9.2 Required edges and path labels <required-edges-and-path-labels>

We now give each pattern a concrete graph on $S$, to which the subsequent deductions can be applied.
  Process its components in their chosen order and traverse each one in its chosen orientation.
  Label its clique vertices and all intervening path interiors consecutively,
  beginning with label zero for the first component and continuing with the next unused label at each new
  component. Thus $S$ is identified with ${ 0 \, dots.h \, t + L - 1 }$.

Let $cal(E) \( P \)$ be the ordered list of pairs $\( a \, b \)$ of clique labels corresponding to the original
  paths, in this traversal order. An edge of amount $q$ has $b = a + q + 1$, and its expanded path is $a \, a +
  1 \, dots.h \, b$. Let $J$ be the graph whose edges are all clique edges on $Q$ and all consecutive steps of
  these expanded paths. We call these the #emph[required edges]:
  every one is present in $G \[ S \]$, while a pair not joined in $J$ may or may not be an edge of $G \[ S \]$.

For a label $x in S$, define the set of endpoint choices

#[#set math.equation(numbering: n => "(9.6)")
 $ T \( x \) =
   cases(delim: "{", { x } \, & x in Q \,, { a \, b } \, & a < x < b upright(" for ") \( a \, b \) in cal(E) \(
   P \) .) $ <finite:tips>]

For $x in Q$, the sole choice represents the segment of length zero.
  For an interior vertex, the two choices represent the two segments along its original path to its clique endpoints.

#thm([Lemma 9.3.])[
  (Label construction).  #emph[The construction labels every vertex of $S$ exactly once.
    It has exactly $t$ clique labels and $L$ interior labels, and
$ \| cal(E) \( P \) \| = e \, wide sum_(\( a \, b \) in cal(E) \( P \)) \( b - a - 1 \) = L . $

 Every interior label belongs to exactly one open interval $\( a \, b \)$ from $cal(E) \( P \)$,
   so (9.6) is well defined. The list $cal(E) \( P \)$ is increasing, with $a < b$ in every pair.
   For any subset of its edges, a connecting route from a clique label $z$ to a larger clique label $w$ follows
   increasing edges in list order.]
] <finite:labels>

#proof[
  A component tuple $p$ occupies exactly $ell \( p \) + 1 + sigma \( p \)$ consecutive labels.
    Its successive expanded paths share their common clique endpoint and have disjoint interiors.
    Different components occupy disjoint intervals of labels.
    Summing these facts gives the asserted counts and the unique interval for each interior vertex,
    including when some or all components are singletons.
  Within a component, the clique labels strictly increase along the path;
    all labels of an earlier component precede those of a later one.
    A subset of the old edges is a union of subpaths of these components.
    Its unique route between connected labels $z < w$ therefore traverses increasing labels,
    and these edges appear in the same order in $cal(E) \( P \)$. ◻
]

Relabeling and reversing components of an actual system produces exactly this required-edge representation.
  Additional ambient edges are retained as possibilities throughout the argument.
  We next use the optimality of $cal(P)$ and the absence of a $C_(k + 1)$ to deduce which paths outside $S$ are
  impossible.

=== 9.3 Deducing forbidden outside paths <finite:constraints>

For each pattern, we derive restrictions that every graph realizing the chosen optimal system must satisfy.
  These restrictions will supply separated balls for the independence argument.

Let $X$ be a vertex set containing $S$. For distinct $x \, y in X$,
  an #emph[outside path relative to $X$ with parameter $d$] is a simple $x$-$y$ path with exactly $d$ internal
  vertices, all in $V \( G \) \\ X$. Here $d$ is a nonnegative integer; in particular,
  parameter $0$ means the edge $x y$. We maintain sets

$ M_(x y) subset.eq { 0 \, 1 \, 2 \, dots.h } \, wide M_(y x) = M_(x y) \, wide M_(x x) = diameter \, $

with the interpretation that no such path exists when $d in M_(x y)$.
  The sets need not contain every forbidden parameter.

We also maintain a #emph[required-edge graph] $J$ on $X$: every edge of $J$ is known to be an edge of $G \[ X \]$.
  Edges omitted from $J$ are unspecified. Initially $X = S$,
  and $J$ consists of the clique edges and the steps of the expanded paths in Lemma 28.
  Thus neither the pattern nor $J$ asserts that an additional edge of $G \[ S \]$ is absent.

#thm([Lemma 9.4.])[
  (Extension rule).  #emph[Let $cal(P)$ be the chosen optimal path system, with total amount $L < h = k + 1 -
    t$ and $e$ paths, labelled as in Lemma 28. Fix $x < y$ in $S$, and choose $z in T \( x \)$,
    $w in T \( y \)$ with $z < w$. Let $E subset.eq cal(E) \( P \)$ consist of old endpoint edges whose
    represented paths do not contain $x$ or $y$ in their interiors.
    Suppose that $z \, w$ have degree at most one in $E$ and belong to different components of the forest $E$,
    with absent vertices treated as isolated. Here $V \( E \)$ denotes the set of endpoints of edges in $E$,
    excluding all isolated clique vertices. Put
$ e' & = \| E \| + 1 \,\
v' & = \| V \( E \) union { z \, w } #scale(x: 120%, y: 120%)[\|] \,\
q & = sum_(\( a \, b \) in E) \( b - a - 1 \) + \| x - z \| + \| y - w \| . $

 Every positive integer $d$ satisfying
#[#set math.equation(numbering: n => "(9.7)")
 $ L + upright(bold(1))_({ e' gt.eq e }) - q med lt.eq d lt.eq med k + 1 - v' - q $ <finite:extension-interval>]

 is a forbidden outside-path parameter between $x \, y$, relative to $S$.]
] <finite:extension-rule>

#proof[
  Suppose such an outside path exists. Extend its end $x$ to $z$ along the old path containing $x$,
    or use the singleton segment ${ x }$ if $x in Q$. Extend its other end from $y$ to $w$ in the same way.
    Each extension meets $Q$ only at its chosen endpoint.
  We first check that these two extension segments are disjoint.
    If both are nontrivial and supported on the same old path with endpoints $a < b$,
    the conditions $x < y$ and $z < w$ force $z = a \, w = b$.
    The two segments then have vertex sets ${ a \, dots.h \, x }$ and ${ y \, dots.h \, b }$, which are disjoint.
    If their supporting old paths are different, their interiors are disjoint,
    so an intersection could only be their common chosen clique endpoint.
    This would give $z = w$, contrary to the choice. If one segment is a singleton in $Q$,
    it likewise can meet the other segment only at that segment’s chosen clique endpoint, again excluded.
    Two singleton segments are disjoint because $x < y$.
  The assumed outside path has all its internal vertices outside $S$.
    Concatenating it with the two disjoint extension segments therefore gives a simple $z$-$w$ path whose interior
    lies outside $Q$. It has
  $ d + \| x - z \| + \| y - w \| $
  internal vertices: when $x in.not Q$, the first extension contributes all its vertices except $z$,
    including $x$, and similarly at $y$. In particular its amount is positive.
  Every old path containing $x$ or $y$ in its interior must be discarded,
    because that vertex is internal to the new path. These are exactly the old paths whose interiors can meet an
    extension. If $x \, y$ lie on the same old path it is discarded only once.
    Consequently the new path and all the old paths represented by $E$ have pairwise disjoint interiors.
    Taking a subset of the remaining old paths only discards more paths and preserves this property.
  The endpoint graph $E$ is already a linear forest. Adding $z w$ keeps every degree at most two,
    by the degree assumptions, and creates no cycle, because $z \, w$ were in different components.
    This condition also prevents a repeated endpoint edge. Hence the old paths represented by $E$,
    together with the new path, form an admissible system with $e'$ paths, $v'$ incident clique vertices, and amount
  $ A = q + d . $
  The lower bound in (9.7) says that $A gt.eq L + 1$ when $e' gt.eq e$, and $A gt.eq L$ when $e' < e$.
    If $A < h$, it contradicts maximality of $L$, or, in the case $A = L$ and $e' < e$,
    the minimum-path tie-break. If $A gt.eq h$, the upper bound gives
  $ h lt.eq A lt.eq k + 1 - v' \, $
  contrary to Lemma 13. Since $L < h$, these alternatives cover the entire stated interval. ◻
]

For fixed $x < y$, we put into $M_(x y)$ the union of the positive integer intervals (9.7) over all allowed
  choices of $z \, w \, E$, and set $M_(y x) = M_(x y)$. Empty intervals contribute nothing.
  This constructs the initial constraints with empty diagonal.

For example, when $k = 5 \, t = 3$ and $P = \( \( \) \, \( 2 \) \)$, we have $Q = { 0 \, 1 \,
  4 }$ and the old path $1 \, 2 \, 3 \, 4$. Choose $x = 0 \, y = 2 \, z = 0 \, w = 4$ and $E = diameter$.
  Then $L = 2$, $e = e' = 1$, $v' = 2$ and $q = 2$, so (9.7) forbids $d = 1 \, 2$.
  An outside $0$–$2$ path relative to $S$ with parameter $d$ would extend through $2 \, 3 \, 4$; for $d =
  1$ it closes through the unused clique vertex $1$, and for $d = 2$ it closes along the clique edge $4$–$0$.
  Both give a cycle of order six.

The forest condition in Lemma 29 also has a simple interpretation under the labelling of Lemma 28.
  Each component of $E$ is a subchain of an original monotonically labelled chain.
  Thus, for $z < w$, connectivity from $z$ to $w$ is equivalent to the existence of a route using only increasing
  old edges. Such a route is found by scanning the old edges in increasing chain order,
  starting with the reachable set ${ z }$ and adjoining $b$ whenever an edge $\( a \, b \) in
  E$ has $a$ already reachable. The degree and connectivity tests therefore implement precisely the forest
  condition used above.

#thm([Lemma 9.5.])[
  (Required-path rule).  #emph[Let $X supset.eq S$, let $J$ be a required-edge graph on $X$, and let $x \,
    y in X$ be distinct. If $J$ contains a simple $x$-$y$ path of length $ell$, where $1 lt.eq ell lt.eq k$, then
$ k - ell in M_(x y) $

 is a valid forbidden outside-path constraint relative to $X$.]
] <finite:required-path-rule>

#proof[
  If an outside path with $d = k - ell$ internal vertices existed, it would have length $d + 1$.
    Its interior is disjoint from the required path, since the latter lies wholly in $X$.
    Their union is therefore a simple cycle of length
  $ ell + \( d + 1 \) = k + 1 . $
  For $d = 0$, the outside path is the edge $x y$ and the required path has length $k gt.eq 5$,
    so the same conclusion holds without any repeated edge. Additional edges of $G$ may be chords of this cycle
    and do not affect the contradiction. ◻
]

Applying Lemma 30 to all simple paths in $J$ preserves symmetry, because each path can be reversed.
  It adds no diagonal entries, since a positive-length simple path has distinct endpoints.
  A required edge $x y in E \( J \)$ with $0 in M_(x y)$ is consequently an immediate contradiction.

#thm([Lemma 9.6.])[
  (Inheritance under enlargement).  #emph[Suppose $S subset.eq X subset.eq X'$.
    Every forbidden outside-path constraint relative to $X$, for endpoints in $X$, remains valid relative to $X'$.]
] <finite:inheritance>

#proof[
  An outside path relative to $X'$ has all its internal vertices in $V \( G \) \\ X' subset.eq V \( G \) \\ X$,
    so it is also an outside path relative to $X$. This includes parameter $0$, for which the interior is empty. ◻
]

In particular, when a hypothesis introduces a fresh vertex into $X$,
  the old constraints may be retained for all old endpoint pairs.
  Pairs involving the new vertex begin with no inherited constraints;
  Lemma 30 then provides exclusions using the enlarged required-edge graph.
  Every exclusion obtained so far is therefore justified by an actual path construction,
  independently of any unspecified edges of $G$.

=== 9.4 Packing independent sets <finite:packing-subsection>

The forbidden parameters now give lower bounds on independent sets in exterior balls.
  Throughout this subsection, $G$ has no $C_(k + 1)$, $omega \( G \) lt.eq t$, and $alpha \( G \) lt.eq k$,
  where $k gt.eq 5$ and $3 lt.eq t lt.eq k$. We also use the expansion property

$ \| N_G \[ I \] \| gt.eq k \| I \| + 1 wide upright("for every nonempty independent set ") I \, $

which was established in Lemma 3. In particular, $delta \( G \) gt.eq k$.
  Let $S subset.eq X subset.eq V \( G \)$, and let $M$ be a symmetric matrix of valid forbidden outside-path
  parameters on $X$, with empty diagonal, as defined above. Write $n_X = \| X \|$.
  The balls $B_r \( i \; X \)$ are those of Section 6.

#thm([Lemma 9.7.])[
  (Bounds for exterior balls).  #emph[For $i in X$, put
$ b_0 = k + 1 - n_X + \| { j in X : 0 in M_(i j) } \| . $

 Assume $b_0 > 0$, and define
$ u_0 = 1 + upright(bold(1))_({ b_0 gt.eq t }) . $

 For $r = 1 \, 2$, recursively set
#[#set math.equation(numbering: n => "(9.8)")
 $ A_r \( i \) & = { j in X : { 1 \, dots.h \, r } subset.eq M_(i j) } \, & T_r & = \| A_r \( i \) \| \,\
b_r & = max { b_(r - 1) \, thin k u_(r - 1) + 1 - n_X + T_r } \,\
hat(u)_r & = max { u_(r - 1) \, 1 + upright(bold(1))_({ b_r > t }) +
  upright(bold(1))_({ b_r > max \( k \, 2 t \) }) #scale(x: 120%, y: 120%)[}] . $ <finite:excluded-neighbors>]

 Set $u_r = hat(u)_r$, except that $u_r = 2$ when
#[#set math.equation(numbering: n => "(9.9)")
 $ hat(u)_r = 1 \, wide b_(r - 1) = b_r = t \, wide k + 1 - n_X + T_r gt.eq t . $ <finite:exception-condition>]

 Then, for $r = 0 \, 1 \, 2$,
$ \| B_r \( i \; X \) \| gt.eq b_r \, wide alpha \( B_r \( i \; X \) \) gt.eq u_r . $

]
] <finite:ball-bounds>

#proof[
  The empty diagonal means that the vertices counted by $\| { j : 0 in M_(i j) } \|$ are all distinct from $i$.
    They are nonneighbors of $i$. Thus at most $n_X - 1 - \| { j : 0 in M_(i j) } \|$ neighbors of $i$ lie in $X$,
    proving the bound on $\| B_0 \( i \; X \) \|$. Positivity gives an independent vertex.
    Furthermore, a $t$-clique in $B_0 \( i \; X \)$ together with $i$ would be a $\( t + 1 \)$-clique.
    Therefore $b_0 gt.eq t$ forces an independent pair, which proves the asserted value of $u_0$.
  Suppose the bounds have been proved at radius $r - 1$. Each vertex $j in A_r \( i \)$ is distinct from $i$,
    because $M_(i i)$ is empty, and has no neighbor in $B_(r - 1) \( i \; X \)$.
    Indeed, such a neighbor would give an outside $i$–$j$ path with between one and $r$ internal vertices,
    by the no-neighbor assertion of Lemma 16. Choose an independent set $I subset.eq
    B_(r - 1) \( i \; X \)$ of order $u_(r - 1)$. Its closed neighborhood outside $X$ is contained in
    $B_r \( i \; X \)$, whereas its closed neighborhood inside $X$ avoids the $T_r$ vertices of $A_r \( i \)$.
    Expansion gives
  $ \| B_r \( i \; X \) \| gt.eq k u_(r - 1) + 1 - \( n_X - T_r \) . $
  The balls are nested, so (9.8) follows. Nesting also preserves the independence bound $u_(r - 1)$.
    If $b_r > t$, the ball is not a clique; if $b_r > max \( k \, 2 t \)$,
    Lemma 12 supplies an independent triple. These are precisely the additional bounds in (9.8),
    with the stated strict inequalities.
  It remains to justify (9.9). If $B_r \( i \; X \)$ were a clique $C$, nesting and $b_(r - 1) = b_r = t$ would force
  $ B_(r - 1) \( i \; X \) = B_r \( i \; X \) = C \, wide \| C \| = t . $
  Every $v in C$ has at most $t - 1$ neighbors outside $X$,
    since $B_r \( i \; X \)$ contains all outside neighbors of the preceding ball.
    The vertices of $A_r \( i \)$ are also unavailable as neighbors. Hence
  $ k + 1 - t med lt.eq med \| N_G \( v \) ∩ X \| med lt.eq med n_X - T_r med lt.eq med k + 1 - t . $
  If the last inequality were strict, there would already be a contradiction.
    Otherwise equality forces $v$ to be adjacent to every vertex of $X \\ A_r \( i \)$, including $i$.
    Thus $C union { i }$ is a $\( t + 1 \)$-clique, a contradiction. The ball therefore contains an independent pair. ◻
]

For each $i in X$, include the #emph[singleton option] ${ i }$, label its radius by $- 1$, and give it weight one.
  If $b_0 > 0$, also include the options $B_r \( i \; X \)$, for $r = 0 \, 1 \, 2$,
  with weights $u_r$ from Lemma 32. If $b_0 lt.eq 0$, include no ball option at $i$:
  the available bound does not certify that a ball is nonempty. This omission makes no assertion about the actual ball.

#thm([Lemma 9.8.])[
  (Packing test).  #emph[Let a family of these options have distinct base vertices.
    For options based at $i \, j$ with radius labels $r \, s$, require
#[#set math.equation(numbering: n => "(9.10)")
 $
   cases(delim: "{", 0 in M_(i j) \, & r = s = - 1 \,, { 1 \, dots.h \, r + s + 2 } subset.eq M_(i j) \, &
   upright("otherwise") .) $ <finite:compatibility>]

 If every pair satisfies this condition, the sum of the option weights is at most $k$.]
] <finite:packing>

#proof[
  For $r \, s gt.eq 0$, the balls are disjoint and anticomplete by Lemma 16.
    For a singleton ${ i }$ and a ball $B_s \( j \; X \)$, disjointness is automatic.
    An edge between them would give an outside $i$–$j$ path with between one and $s + 1$ internal vertices,
    which is prohibited by (9.10) with $r = - 1$. Two singleton options are nonadjacent precisely when their
    joining edge is absent, as certified by $0 in M_(i j)$. Thus all represented sets are disjoint and pairwise
    anticomplete. Independent subsets of their certified weights combine into an independent set in $G$.
    Its order cannot exceed $k$. ◻
]

===== 9.4.1 Removing redundant radii. <removing-redundant-radii.>

Retain every singleton and every available radius-zero option.
  For $r = 1 \, 2$, retain the option at radius $r$ only when $u_r > u_(r - 1)$;
  still compute both bounds at every radius. This does not change whether a family of weight greater than $k$
  exists. Indeed, an omitted positive radius $r$ has the same weight as the most recent retained
  #emph[nonnegative] radius $q < r$ at that base. For every other radius $s gt.eq - 1$,
  replacing $r$ by $q$ weakens the positive-interval condition in (9.10).
  Since $q + s + 2 gt.eq 1$, this replacement never invokes the exceptional singleton–singleton condition.
  Replacing every omitted option in a compatible family therefore preserves its weight and compatibility.
  Distinct bases ensure that no replacement duplicates another member of the family.

===== 9.4.2 Searching for a packing. <searching-for-a-packing.>

Make a finite weighted graph whose vertices are the retained options,
  with edges given by (9.10) between distinct bases. The packing test asks for a clique of total weight greater
  than $k$. The following inclusion-and-exclusion search answers that question exactly.
  For a candidate list $V$ and a nonnegative threshold $K$, take its first member $x$.
  If its weight $w \( x \)$ exceeds $K$, return success. Otherwise let $Z$ be the remaining candidates adjacent to
  $x$. The branch containing $x$ succeeds exactly when $Z$ contains a clique of weight greater than $K -
  w \( x \)$; the branch excluding $x$ is the same question on $V \\ { x }$.
  The inclusion branch can be discarded when $sum_(z in Z) w \( z \) lt.eq K - w \( x \)$. The empty list fails.
  Induction on $\| V \|$ proves the recursion correct: every clique either contains $x$ or avoids it,
  and the discarded branch cannot reach the required weight.
  All recursive thresholds are nonnegative, since the one-option success was tested first.
  Any ordering of the options gives the same decision.

=== 9.5 Strengthening the forbidden parameters <finite:strengthening-subsection>

We apply the packing test on the original set $S$ and, temporarily, on a set with one additional vertex.
  On either set, a required edge whose parameter zero is forbidden is an immediate contradiction.
  The other test is a compatible family of weight greater than $k$.

#thm([Lemma 9.9.])[
  (Eliminating a path hypothesis).  #emph[Let $J$ be a required-edge graph on $S$,
    and let $M$ be a matrix of valid forbidden parameters relative to $S$.
    Fix distinct $i \, j in S$ and $d in { 0 \, 1 }$. Form a trial required-edge graph as follows:]
  + #emph[If $d = 0$, retain $X = S$ and require the edge $i j$ in addition to $J$.]
  + #emph[If $d = 1$, add a fresh vertex $z$, put $X = S union { z }$, and require the edges $i z \,
    z j$ in addition to $J$.]
  #emph[On the trial set, retain the old entries of $M$ on pairs in $S$,
    start with empty entries involving $z$ when it is present, and add all forbidden parameters from Lemma 30.
    If these trial data give either an immediate required-edge contradiction or a packing contradiction,
    then $d$ is forbidden between $i$ and $j$ relative to $S$.]
] <finite:strengthening>

#proof[
  Assume an outside $i$–$j$ path with parameter $d$ exists relative to $S$.
    For $d = 0$ it is the edge $i j$, so the trial required-edge graph is realized on $S$.
    For $d = 1$, choose its actual internal vertex $z in.not S$.
    The trial required-edge graph is then realized on $S union { z }$.
    There may be other edges involving $z$; the required graph does not assert their absence.
  In both cases, every old forbidden parameter remains valid on $X$ by Lemma 31:
    restricting the allowed outside vertices cannot create a previously forbidden path.
    The additional required-path constraints are valid by Lemma 30.
    Either stipulated contradiction is therefore impossible in this realization. This excludes the assumed path.
    In the case $d = 1$, the argument applies to any actual choice of its internal vertex,
    so the conclusion is a prohibition relative to the original set $S$, not merely to one enlarged trial set. ◻
]

The rules just proved give the following finite procedure for an optimal path-system pattern $P$.

+ Construct its required graph $J$ on $S$ and its initial matrix $M$ by Lemma 29.
  If the packing test gives a contradiction, return $1$.
+ Add all required-path constraints of Lemma 30. If there is a required-edge or packing contradiction, return $2$.
+ Using the current matrix unchanged, test every unordered pair $i \, j in S$ and every $d in { 0 \,
  1 }$ not already in $M_(i j)$. Skip $d = 0$ when $i j$ is already required by $J$.
  For each remaining choice, perform the trial of Lemma 34, and collect the choices whose trial gives a contradiction.
+ If none were collected, return $0$. Otherwise add every collected parameter to both symmetric entries of $M$.
  Return $2$ if the updated matrix gives a required-edge or packing contradiction; if it does not, repeat Step 3.

All tests in Step 3 use the same matrix from the beginning of that step.
  The required graph $J$ on $S$ never changes. Consequently its required-path constraints need only be added once
  in Step 2.

#thm([Proposition 9.10.])[
  (Meaning of a successful finite check).  #emph[The procedure terminates.
    An output of $1$ or $2$ proves that the pattern $P$ cannot be realized by an optimal path system in a graph
    with the hypotheses above. An output of $0$ asserts only that these tests have not produced a contradiction.]
] <finite:procedure-soundness>

#proof[
  Suppose such a realization exists. Its initial forbidden parameters are valid by Lemma 29,
    and the constraints added in Step 2 are valid by Lemma 30.
    Inductively assume the current matrix contains valid prohibitions.
    Each new entry collected in Step 3 follows from that same matrix by Lemma 34.
    Every collected prohibition therefore holds in the realization, and they may all be added simultaneously.
    No new entry has been assumed in proving another entry of its batch.
    This proves the invariant at every subsequent step. An immediate required-edge contradiction or a violation of
    Lemma 33 is thus impossible, proving the assertion about outputs $1$ and $2$.
  Every pass through Step 4 that does not terminate adds a previously absent parameter from the finite set of $2
    binom(\| S \|, 2)$ pair-and-parameter choices. The procedure must therefore terminate.
    Its soundness does not require that the two tests detect every possible obstruction to a realization. ◻
]

=== 9.6 Results and completion of the proof <results-and-completion-of-the-proof>

The complete procedure was run for every pattern in (9.1).
  Two implementations, described in Appendix 10, give the same results in Table 2.
  Output $1$ denotes a contradiction from the initial packing test;
  output $2$ denotes a contradiction after adding required-path constraints or strengthening the matrix.
  No pattern has output $0$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[output $0$
], table.cell(rowspan: 1, colspan: 1)[output $1$
], table.cell(rowspan: 1, colspan: 1)[output $2$
]),
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[3
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[5
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[30
], table.cell(rowspan: 1, colspan: 1)[4
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[57
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[71
], table.cell(rowspan: 1, colspan: 1)[4
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[134
], table.cell(rowspan: 1, colspan: 1)[8
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[161
], table.cell(rowspan: 1, colspan: 1)[3
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[305
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[315
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[597
], table.cell(rowspan: 1, colspan: 1)[4
],
  table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[468
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[878
], table.cell(rowspan: 1, colspan: 1)[1
],
  table.cell(rowspan: 1, colspan: 1)[Total
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3049
], table.cell(rowspan: 1, colspan: 1)[50
],
)
]],
  caption: [Table 2: Complete finite calculation. Every pattern gives a proved contradiction. The two successful output classes sum to $3099$. ],
)

#proof[
  Suppose such a graph exists and choose an optimal path system on a maximum clique.
    Lemma 27 places its pattern in the enumerated list. Lemma 28 gives its required-edge representation.
    All assumptions used by the procedure hold: the expansion and clique bounds are hypotheses of the proposition,
    the size test follows from Lemma 12, and optimality gives Lemma 29. Proposition 35 therefore applies.
    Table 2 records output $1$ or $2$ for every enumerated pattern,
    each of which contradicts the supposed realization. This proves the proposition. ◻
]

#proof[
  First suppose $m gt.eq n gt.eq 3$ and $\( m \, n \) eq.not \( 3 \, 3 \)$.
    Then $m gt.eq 4$, so $k = m - 1 gt.eq 3$, and $2 lt.eq n - 1 lt.eq k$.
    If the upper bound failed, choose the least failed independence parameter as in Section 2.
    The resulting graph $G$ has no $C_(k + 1)$, satisfies $alpha \( G \) lt.eq k$,
    and has the expansion property of Lemma 3. Theorem 4 gives $max { 3 \, floor.l k \/ 2 floor.r } lt.eq t =
    omega \( G \) lt.eq k$. Proposition 9 rules out $k = 3 \, 4$.
    For $k gt.eq 5$, Proposition 25 rules out $t gt.eq 9$. The remaining values satisfy (9.1),
    so Proposition 26 rules them out as well. This proves the upper bound.
  For the lower bound, colour the edges within each of $n - 1$ disjoint sets of size $m -
    1$ red and all edges between sets blue. A red connected graph lies in a single set and hence cannot be a
    $C_m$. A blue clique uses at most one vertex from each set and hence has order at most $n - 1$.
    This colouring has $\( m - 1 \) \( n - 1 \)$ vertices, proving the matching lower bound.
  Finally, colour the edges of a $5$-cycle red and its complementary $5$-cycle blue.
    This gives $R \( C_3 \, K_3 \) gt.eq 6$. In a two-colouring of $K_6$,
    one vertex has at least three neighbours of one colour, say red.
    Any red edge among those neighbours completes a red triangle; if there is none,
    the three neighbours form a blue triangle. Thus $R \( C_3 \, K_3 \) = 6$. ◻
]

== 10 Exact implementations and accompanying data <app:implementation>

The finite proof uses integer arithmetic, finite sets, and exhaustive search.
  The accompanying project contains two complete Python programs, both using only the standard library.
  This appendix relates their operations to the mathematical rules.
  The first program is reproduced below in full; the second and the complete deduction traces are supplied as
  separate files in the project.

=== 10.1 The compact implementation <the-compact-implementation>

The function #raw("forests") implements the recursion in Lemma 27.
  Its nested function continues to extend a tuple even when that tuple is not itself selected,
  so no valid longer tuple is lost. An empty tuple consumes one clique vertex,
  which ensures termination even at zero amount. The function #raw("data") implements Lemma 28:
  its adjacency lists contain required edges, and its endpoint lists give $T \( x \)$.

For a pair $x < y$, #raw("forbidden") considers all subsets of old paths not meeting $x$ or $y$ internally,
  and every permitted endpoint choice. It tests endpoint degrees and increasing-edge reachability,
  which is equivalent to connectivity by Lemma 28. Its interval endpoints are precisely those of (9.7).
  The functions #raw("empty") and #raw("initial") create separate sets for the matrix entries,
  copy each initial constraint to its symmetric position, and leave the diagonal empty.

The function #raw("exact") adds every instance of the required-path rule.
  For each starting vertex, its state is a pair $\( U \, x \)$ consisting of the visited vertex set,
  encoded by a bitmask, and the last vertex. Initially $U$ contains just the start.
  Each transition adds a required neighbour outside $U$. Induction on the number of transitions proves that the
  states at step $ell$ are exactly the visited-set and endpoint pairs of simple paths of length $ell$ from the
  start. Two paths with the same state have the same allowed continuations, so merging them loses no deduction.
  The function records $k - ell$ at every resulting endpoint, as required by Lemma 30.
  The starting vertex cannot be revisited, and reversing a path proves symmetry.
  When the required graph has one extra vertex, the initial copy of the old matrix fills only the old rows and
  columns; the new entries begin empty.

The function #raw("pack") computes Lemma 32, omits only the dominated radii described in the main text,
  and uses (9.10) as adjacency between options. Its recursive function #raw("find") is the inclusion-and-exclusion
  search proved in Section 9.4. The order of the options affects the running time but not the result.
  The special assignment #raw("req[0]={0}") handles two singleton options;
  every other compatibility test uses a positive interval.

The function #raw("bad") tests a required-edge conflict or a packing contradiction.
  The function #raw("attach") makes a fresh copy of all required adjacency lists and adds either an edge or one
  vertex with two incident edges. Finally, #raw("check") performs the procedure of Proposition 35.
  All trials in a round use the old matrix; the list of new consequences is added only after the trials finish.
  The outer loops are exactly (9.1).

=== 10.2 A separate implementation <a-separate-implementation>

The file #raw("verification/code/independent_checker.py") imports no part of the compact implementation.
  It generates the same patterns by first partitioning $t$ into component orders,
  then taking positive compositions of the amounts on each component, identifying reversal,
  and choosing multisets of components of equal order. This enumerates the same complete invariant proved in Lemma 27.

Old paths and their endpoint extensions are explicit vertex lists.
  Candidate extensions are checked for intersection, and their endpoint graph is tested by an undirected
  connectivity algorithm with degree counts. For each positive outside parameter,
  the program tests the optimality and cycle-closure inequalities directly.
  Forbidden parameters are stored as integer flags on unordered endpoint pairs.
  Required simple paths use sets of visited vertices, with the same state induction as above,
  rather than integer bitmasks.

The packing search retains all radii and branches by base vertex:
  it chooses one compatible radius at that base, or omits the base.
  Every compatible family has one of these choices. An upper bound obtained by summing the largest remaining
  weight at each base safely prunes branches. The returned witness is checked for distinct bases,
  pairwise compatibility, and total weight greater than $k$.
  These different representations and search choices give a separate implementation of the proved rules.
  Both complete runs give every row of Table 2.

=== 10.3 Deduction traces and reproduction <deduction-traces-and-reproduction>

The file #raw("verification/data/")#raw("certificates.jsonl") contains one record for each of the $3099$
  parameter-pattern instances. Each record gives its parameters, pattern, initial forbidden flags,
  every successful added prohibition grouped by simultaneous round, and a final contradiction witness.
  A packing witness records triples

$ \( upright("base vertex") \, med upright("radius") \, med upright("independence bound") \) . $

Radius $- 1$ denotes the singleton option, while radius $0$ denotes the outside-neighbour set.
  A flag’s bit in position $d$ records the prohibition of an outside path with $d$ internal vertices.
  In particular, $d = 0$ records a forbidden edge, not a singleton option.
  All final witnesses in the supplied run are packing contradictions.

These records are deduction traces. Their initial constraints and required-path consequences are recomputed by the
  full program; the records are not offered as proof objects for an additional independent minimal validator.
  The independent computational check is the separate implementation just described,
  together with the proved meaning of each inference. The trace makes its successful deductions available for
  inspection and exact comparison.

From the project directory, the command

#raw(block: true, lang: "", "python3 verification/code/verify.py --output /tmp/cycle-clique-check")

runs both complete programs in separate processes and retains their full output, errors, runtime information,
  implementation hashes and generated data. The wrapper checks the complete range $5 lt.eq k lt.eq 17$,
  all $42$ parameter pairs, exactly $3099$ distinct pattern instances, zero unresolved cases, every printed row,
  and equality of the generated trace with the supplied file.
  Only integer and finite-set operations enter the mathematical decisions;
  wall-clock times are recorded solely as execution metadata.

Use an ordinary Python 3 interpreter without optimization flags.
  The independent program also accepts restricted ranges for diagnostic runs,
  but their completion is not the full finite check. The wrapper above always runs and checks the complete domain.
  Building the paper and rerunning the calculations require no service, private repository,
  or additional mathematical input; the project README gives the build command and software requirements.

=== 10.4 The complete compact program <the-complete-compact-program>

#raw(block: true, lang: "Python", "")

#bibliography("refs.bib", style: "ieee", title: [References])
