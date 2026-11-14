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

#align(center)[#text(size: 16pt, weight: "bold")[A Fully Polynomial Randomized Approximation Scheme \
for Perfect Matchings in General Graphs]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $G = \( V \, E \)$ be a finite simple undirected graph.
  A perfect matching is a set of edges incident to each vertex exactly once. Write

$ Z \( G \) = \# { M subset.eq E : M upright(" is a perfect matching of ") G } . $

A fully polynomial randomized approximation scheme approximates $Z \( G \)$ within a prescribed relative error,
  with a prescribed success probability, in time polynomial in the input length and the reciprocal error.
  The confidence parameter enters through its logarithm. We prove the following theorem,
  including a bound on the time of every execution.

#thm([Theorem 1.1.])[
  #emph[There is a uniform classical randomized algorithm which,
    given $G$ and rational parameters $0 < epsilon < 1$ and $0 < delta < 1 \/ 2$,
    returns a nonnegative rational number $hat(Z)$ such that
$ bb(P) #scale(x: 120%, y: 120%)[\[] \( 1 - epsilon \) Z \( G \) lt.eq
  hat(Z) lt.eq \( 1 + epsilon \) Z \( G \) #scale(x: 120%, y: 120%)[\]] gt.eq 1 - delta . $

 If $Z \( G \) = 0$, the output is zero with certainty. The worst-case bit running time is polynomial in the input
   encoding length, $epsilon^(- 1)$, and $log delta^(- 1)$.]
] <thm:main>

As consequences, 10 gives counting schemes for edge subsets with prescribed vertex degrees and for matchings of a
  specified size. On feasible inputs, its samplers always return a feasible object and approximate the
  corresponding uniform law in total variation.

=== 1.1 History and significance <history-and-significance>

Perfect matchings illustrate the distinction between finding a combinatorial structure and counting its
  realizations. Edmonds gave a polynomial-time algorithm for finding a maximum matching in a general graph [5].
  Valiant proved that exact counting is \#P-complete even for bipartite graphs,
  where it is the permanent of a zero–one matrix [19]. Pfaffian methods give polynomial-time exact counting for
  planar graphs [13].

For approximation, three problems must be distinguished: counting all matchings,
  counting bipartite perfect matchings, and counting perfect matchings in general graphs.
  Jerrum and Sinclair gave an FPRAS for the total number of matchings in an arbitrary graph,
  summed over all cardinalities [10] Corollary 4.5. Their perfect-matching algorithm applied when the ratio of
  near-perfect matchings, which leave exactly two vertices unmatched,
  to perfect matchings was bounded by a fixed polynomial [10] Theorem 5.3.
  Without such a bound, perfect matchings can carry too little stationary mass for this sampling approach.
  Approximating the total number of matchings therefore does not isolate its perfect-matching contribution with
  relative accuracy.

Jerrum, Sinclair, and Vigoda removed the ratio restriction in the bipartite setting and obtained an FPRAS for the
  permanent of every nonnegative matrix [11] Theorem 1.1. Their method assigns weights to near-perfect states
  according to their two unmatched vertices and learns suitable weights while gradually changing edge activities.
  The general-graph question was explicitly raised by Jerrum and Sinclair [10] Section 7(i) and remained a
  benchmark for approximate counting. Cai and Liu relate it to approximation for the eight-vertex model [2]; Fei,
  Goldberg, and Lu distinguish the spin-system parameter line equivalent to general perfect-matching approximation
  from the region covered by their FPRAS [7] Proposition 1.2 and Theorem 1.5.
  1 answers the general-graph perfect-matching approximation problem affirmatively.

A direct extension of the bipartite chain faces a precise obstruction.
  Štefankovič, Vigoda, and Wilmes constructed graphs on which every JSV-type chain has either exponentially small
  stationary probability of perfect matchings or exponentially slow mixing,
  even with arbitrary weights depending on the hole pattern [16] Definition 2.1 and Theorem 2.2 in the full
  version. Here JSV type means the perfect-and-near-perfect state space with the specified Broder proposals and a
  Metropolis acceptance rule. The sampler below uses a different state space:
  a product of perfect-matching spaces on an enlarged colored graph,
  with exchanges of alternating cycles between coordinates. Its energy comparison is proved for these states and moves.

Subsequent permanent algorithms sharpen the bipartite result.
  Bezáková, Štefankovič, Vazirani, and Vigoda accelerated the cooling schedule and improved the analysis of the
  matching chain [1]. Chen, Vigoda, and Yang obtain a further improvement through restricted Poincaré inequalities
  and coupled flows [4]; Chen, Guo, Vigoda, and Yang develop an energy-weighted multicommodity-flow comparison and
  improve the running time again [3]. These results concern bipartite perfect matchings.

For nonbipartite graphs, Yi gives deterministic relative approximation for hafnians,
  the weighted sums over perfect matchings, when the $n$-vertex support has minimum degree at least
  $\( 1 \/ 2 + gamma \) n$ and nonzero weights lie in $\[ theta \, 1 \]$ [21] Theorem 1.1.
  Here $0 < gamma < 1 \/ 2$ and $0 < theta lt.eq 1$ are fixed constants,
  and the polynomial running-time exponent may depend on them. 1 has no density promise on its simple unweighted input.

The proof below also builds on the methodological framework of weighted matching chains.
  Alternating overlays and weight-preserving switches underlie the encodings of Jerrum and Sinclair and of Jerrum,
  Sinclair, and Vigoda [10,11]. Their sampling-to-counting strategy learns local partition ratios while gradually
  changing activities. Here these ratios are exposed by marked edges in an enlarged graph,
  and vertex scaling maintains a row-wise balance condition.
  The capacity bound, subdivision and marked-edge identities needed for this construction are proved explicitly.

Energy comparison through weighted demands has classical antecedents in multicommodity-flow bounds for
  mixing [15]. Our comparison differs from routing every demand along a path of chain transitions:
  long-arc conversions enter a signed identity and need not be legal single updates.
  The resulting estimate initially controls only additive functions of two matching coordinates.
  The separate product-space argument is essential to obtain a spectral gap for arbitrary functions.
  It uses the classical orthogonal decomposition into coordinate interactions [6] Section 2;
  the ordered assignment of residual terms and the replication estimate are proved below.

=== 1.2 Proof architecture <proof-architecture>

The counting algorithm starts with the complete graph, whose perfect matchings are easy to count,
  and gradually suppresses the nonedges of $G$ by decreasing their positive activities.
  It estimates the ratios of successive partition functions and multiplies them.
  To keep the observations statistically useful, it updates vertex scales from estimates of the two-hole partition
  ratios: partition functions after deleting two vertices, divided by the current partition function.
  Accurate estimates keep each row maximum between two absolute constants.
  A vertex scale multiplies every complete matching weight by the same factor,
  preserving the probability law used to estimate the current counting ratio.

The purpose of balance is to control the extra mass introduced by an auxiliary graph.
  We replace each logical edge by a weighted path, with a bijection between logical perfect matchings and
  matchings using only these real path edges. We then add weak clique edges in overlapping bags indexed by a tree.
  Under balance, the added edges increase the partition function by at most a factor of two,
  so a sample uses only real edges with probability at least one half.
  A specially marked auxiliary edge exposes the corresponding two-hole partition ratio.
  These are exact event identities; they provide both the counting estimate and the data for the next scale update.

To prove the inflation bound, 3 assigns a pairing capacity to each even hole set using the strongest bottleneck
  paths between its vertices. The capacity pays for the weights of possible added edges on those holes.
  Subdivision transfers this bound to the real graph while making incident effective strengths comparable.
  The resulting geometry supplies the tree of clique bags. Thus the hole estimates control the probability of the
  observable events, while the tree-bag structure supplies a sampler for their law.

That sampler uses local switches in one matching and exchanges alternating cycles between two matching
  coordinates. Its energy comparison initially controls only additive functions of the two coordinates.
  A quadrangulation adapted to the bag labels gives an exact signed identity for a whole-cycle difference (Lemma
  5.1, Theorem 6.1). The identity is not a route through chain transitions:
  long arc conversions may change many edges. Two-matching encodings instead compare its terms with local switches
  and cycle exchanges, with polynomially bounded multiplicity.

A ladder of nearby weight distributions then places many independent coordinates at each tier.
  An ordered orthogonal decomposition ensures that each coordinate-interaction term is charged to at most one
  pair. Replication reduces the coefficient of their combined contribution enough to absorb it.
  This yields a spectral gap for arbitrary functions of the product state (20).
  The bottom tier has unit activities and admits exact counting and ideal sampling by a tree dynamic program.
  The sampler requires no balance assumption. It therefore remains defined, with the same time bound,
  after an inaccurate empirical estimate; balance is used only to prove that accurate estimates propagate through
  the counting stages.

1 summarizes the changes of law. Finally, Section 8, Section 9 account for all arithmetic and finite-bit random
  choices. Every polynomial has an absolute degree; the constants are chosen for transparent estimates rather than
  practical efficiency.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Object
], table.cell(rowspan: 1, colspan: 1)[Vertices
], table.cell(rowspan: 1, colspan: 1)[Relation of matching laws
]),
  table.cell(rowspan: 1, colspan: 1)[Input $G$
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[The target is its unweighted count $Z \( G \)$.
],
  table.cell(rowspan: 1, colspan: 1)[Complete graph
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[Raw activities $w^(\( j \))$ gradually suppress the nonedges of $G$.
],
  table.cell(rowspan: 1, colspan: 1)[Vertex scaling
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[Activities $lambda$ preserve the normalized raw matching law.
],
  table.cell(rowspan: 1, colspan: 1)[Real paths
], table.cell(rowspan: 1, colspan: 1)[$N$
], table.cell(rowspan: 1, colspan: 1)[Subdivision gives a matching bijection with a common weight multiplier.
],
  table.cell(rowspan: 1, colspan: 1)[Colored bags
], table.cell(rowspan: 1, colspan: 1)[$N$
], table.cell(rowspan: 1, colspan: 1)[Their activities $W$ recover the real law when every sampled edge is
  revealed as real.
],
  table.cell(rowspan: 1, colspan: 1)[Weight tiers
], table.cell(rowspan: 1, colspan: 1)[$N$
], table.cell(rowspan: 1, colspan: 1)[Common-interval clamps of $W$ connect the unit-activity law to the bag law
  on one colored state space.
],
)
]],
  caption: [Table 1: The successive graphs and probability laws. Here $n$ is the original vertex count and $N$ the enlarged count. Scaling, subdivision, conditioning, and clamping have distinct roles. ],
)

The specialized combinatorial and sampling arguments are proved here.
  We use Edmonds’s algorithm for the initial matching-existence test and Hoeffding’s bounded-variable inequality
  for concentration and confidence amplification [5,9].

== 2 Preliminaries <sec:preliminaries>

Logarithms are natural unless a base is indicated.

=== 2.1 Weighted matchings and holes <weighted-matchings-and-holes>

We allow parallel edges distinguished by colors. A matching specifies the actual colored edges it uses.
  For positive rational activities $a = \( a_e \)$, put

$ "wt"_a \( M \) = product_(e in M) a_e \, wide Z_a \( - U \) = sum_(M in cal(M) \( H - U \)) "wt"_a \( M \) \,
  wide Z_a = Z_a \( - diameter \) \, $

where $H$ is the underlying graph and $cal(M) \( H - U \)$ is its set of perfect matchings after deleting $U$.
  The empty graph has one perfect matching, of weight one. Whenever $Z_a > 0$, define

$ g_a \( U \) = frac(Z_a \( - U \), Z_a) \, wide pi_a \( M \) = frac("wt"_a \( M \), Z_a) . $

These weighted colored graphs are intermediate spaces constructed from the simple input graph.
  Their representation is explicit: vertices, colored edges, and rational activities are stored individually.
  The main theorem retains the finite simple undirected input model;
  it does not assert a counting algorithm for compressed edge multiplicities or for singleton-covering loops.

We call the vertices in $U$ #emph[holes]. For distinct vertices we abbreviate $g_a \( { i_1 \, dots.h \, i_k } \)$
  to $g_a \( i_1 dots.h.c i_k \)$. Collapsing parallel activities into their sum preserves every partition
  function. Conditional on a collapsed edge, its original type can be recovered with probabilities proportional to
  the summands.

The union of two matchings, with common edges retained twice, has maximum degree two.
  Its nontrivial components are alternating paths and even alternating cycles.
  Swapping the layers along a component preserves the product of their weights.
  In the union of two perfect matchings, deleting common identical edges leaves disjoint alternating cycles;
  different colors on the same pair of vertices form a cycle of length two.
  We fix a vertex order and a color order once and for all. They resolve every combinatorial tie in the proof.

=== 2.2 Bottleneck similarities <bottleneck-similarities>

For a positive weighted connected graph define

#[#set math.equation(numbering: n => "(2.1)")
 $ B_(i j) = max {1 \, med max_(P : i ⤳ j) med min_(e in P) a_e} quad \( i eq.not j \) . $ <eq:bottleneck>]

Simple paths suffice. This symmetric similarity satisfies $B_(i j) gt.eq min { B_(i k) \, B_(k j) }$:
  concatenating two paths and erasing loops cannot lower their minimum activity.
  For $t > 1$, its equivalence classes are the connected components of the graph retaining edges of activity at
  least $t$. Singletons are included. At $t = 1$ we take one class containing every vertex,
  consistently with the floor at one. For an even set $U$ define its #emph[pairing capacity]

#[#set math.equation(numbering: n => "(2.2)")
 $ Phi_B \( U \) = max_(cal(P)) product_(i j in cal(P)) B_(i j) \, wide Phi_B \( diameter \) = 1 \,
   $ <eq:pairing-capacity>]

where $cal(P)$ runs over pairings of $U$. We use this quantity only in proofs;
  the counting algorithm never needs to enumerate pairings or compute $Phi_B \( U \)$ for a general hole set.

=== 2.3 Tree bags <tree-bags>

#prodef([Definition 2.1.])[
  A #emph[tree-bag graph] consists of a finite rooted tree of labels and a finite even vertex set.
    A label $l$ at level $k$ has height $h_l = 2^k$; the root has level zero and a child has level one greater
    than its parent. Each vertex belongs to either one label or two adjacent labels.
    The bag at $l$ is the set of vertices belonging to $l$. For each unordered pair of distinct vertices and each
    common label $l$, there is one edge of color $l$. There are no other edges.
    For an integer parameter $D gt.eq 1$, its reference activities obey
  #[#set math.equation(numbering: n => "(2.3)")
   $ h_l / D lt.eq W_(x y \, l) lt.eq 3 h_l . $ <eq:bag-weight-range>]
  We also consider activities obtained by clamping all $W_e$ to one common interval $\[ a \, b \] subset \( 0 \, oo \)$.
] <def:tree-bags>

Every vertex pair has at most two edge colors. At any bag,
  the interfaces with its parent and its different children are disjoint:
  a vertex in two such interfaces would have at least three memberships.
  Empty bags and repeated underlying vertex sets are permitted.
  Clamping is monotone and does not increase the ratio of a larger activity to a smaller one.
  In particular, reference activities of nearby labels remain comparable after clamping.

=== 2.4 Dirichlet energy and approximation <dirichlet-energy-and-approximation>

For a finite reversible Markov kernel $P$ with stationary law $mu$, its Dirichlet energy is

#[#set math.equation(numbering: n => "(2.4)")
 $ cal(E)_(mu \, P) \( f \) = 1 / 2 sum_(x \, y) mu \( x \) P \( x \, y \) \( f \( x \) - f \( y \) \)^2 .
   $ <eq:dirichlet>]

A Poincaré inequality $"Var"_mu f lt.eq gamma^(- 1) cal(E)_(mu \, P) \( f \)$ means that the spectral gap is at
  least $gamma$. A symmetric proposal $Q$ has Metropolis acceptance probability [14,8] $min { 1 \,
  mu \( y \) \/ mu \( x \) }$ for a proposed move from $x$ to $y$. Its off-diagonal stationary capacity is

#[#set math.equation(numbering: n => "(2.5)")
 $ mu \( x \) P \( x \, y \) = Q \( x \, y \) min { mu \( x \) \, mu \( y \) } . $ <eq:metropolis-capacity>]

We regard inapplicable proposals as holding moves. All state spaces used below contain at least one perfect
  matching; thus their positive activities define probability laws with full support on that space.

Total variation is $parallel mu - rho parallel_("TV") = 1 / 2 sum_x \| mu \( x \) - rho \( x \) \|$.
  A deterministic map, or a common randomized postprocessing kernel, does not increase total variation,
  by the triangle inequality. Two finite laws at total variation distance $eta$ admit a coupling that disagrees
  with probability $eta$: first match the common masses $min \( mu \( x \) \, rho \( x \) \)$,
  then couple the remainders. Applying this construction successively bounds the discrepancy probability of an
  adaptive simulation by the sum of its conditional one-step errors.

== 3 Controlling the cost of unmatched vertices <sec:holes>

This section proves the bound that will control the additional edges in our sampling graph.
  It uses only alternating paths and differentiation of a finite partition function.

Let $V$ have even cardinality $n gt.eq 2$, and give every edge of the complete logical graph $K_V$ a positive
  activity $lambda_(i j)$. Use the weighted matching notation of 2,
  abbreviating $cal(M) \( K_V - U \)$ to $cal(M) \( - U \)$.
  For any positive activity array $a$ on this graph, define the row maxima

$ r_i \( a \) = max_(j eq.not i) g_a \( i j \) . $

The activities $a$ are #emph[balanced] if $1 \/ 4 lt.eq r_i \( a \) lt.eq 1$ for every $i$.
  Let $B$ be the bottleneck similarity of $lambda$ from (2.1), and let $Phi_B$ be its pairing capacity from (2.2).

The estimate we need controls every even hole set, although balance only bounds the two-hole ratios:

#thm([Theorem 3.1.])[
  (Logical hole bound).  #emph[Let $lambda$ be balanced, let $B$ be its bottleneck similarity, and set
$ D_0 = 10^8 \( n + 1 \)^4 . $

 For every even set $U subset.eq V$,
#[#set math.equation(numbering: n => "(3.1)")
 $ g_lambda \( U \) Phi_B \( U \) lt.eq 2 D_0^(\| U \| \/ 2) . $ <eq:logical-hole-bound>]

]
] <thm:logical-hole-bound>

To prove this, we will add a small activity proportional to $B_(i j)$ on every pair.
  Bounds for two and four holes keep the resulting partition inflation below two.
  Any pairing of an arbitrary hole set can then be inserted using the added edges, giving the stated bound.

We use two elementary alternating-path comparisons. Such weight-preserving overlays also underlie the weighted
  matching encodings in [10,11]; the comparisons and their constants needed here are proved below.
  In an overlay of two matchings, edges retain their layer. Common edges can be kept as two parallel copies.
  A path starting at a vertex unmatched in exactly one layer is then uniquely determined,
  and switching its edges between the layers preserves the product of their weights.

#thm([Lemma 3.2.])[
  (Four-hole inequality).  #emph[For any positive activities $mu$ and four distinct vertices $a \, b \, c \, d$,
$ g_mu \( a b c d \) lt.eq g_mu \( a b \) g_mu \( c d \) + g_mu \( a c \) g_mu \( b d \) +
  g_mu \( a d \) g_mu \( b c \) . $

 Consequently, if every row maximum is at most $4$, then
#[#set math.equation(numbering: n => "(3.2)")
 $ g_mu \( diameter \) = 1 \, wide g_mu \( U \) lt.eq 4 quad \( \| U \| = 2 \) \, wide g_mu \( U \) lt.eq
   48 quad \( \| U \| = 4 \) . $ <eq:small-hole-bounds>]

]
] <lem:four-holes>

#proof[
  Overlay $M in cal(M) \( - { a \, b \, c \, d } \)$ and $P in cal(M) \( - diameter \)$.
    The alternating path from $a$ ends at one of $b \, c \, d$, say $b$. Switch that path between the layers.
    The output layers miss ${ c \, d }$ and ${ a \, b }$, respectively, and their product weight is unchanged.
    This map is injective for the specified endpoint $b$: in the output overlay,
    follow the path from $a$ and switch it back. The same argument applies to endpoints $c \, d$.
    Summing the three injective comparisons and dividing by $Z_mu^2$ proves the inequality.
    The remaining assertions follow immediately. ◻
]

The four-hole comparison controls small hole sets by row maxima.
  We next need an additional factor when two holes are joined by a strong path.
  Normalizing by the row maximum at the moving hole will make the successive relocation errors add,
  without multiplying along the path.

The next lemma is stated with $mu gt.eq lambda$ so that it continues to apply while we add activities to the
  graph. Its bottleneck similarity always remains the one defined from $lambda$.

#thm([Lemma 3.3.])[
  (Relocating a hole along a strong path).  #emph[Let $B$ be defined by (2.1), and suppose that $mu_e gt.eq
    lambda_e$ for every edge and
$ 1 / 8 lt.eq r_i \( mu \) lt.eq 4 wide \( i in V \) . $

 If $\| U \| in { 2 \, 4 }$ and $i \, j in U$ are distinct, then
#[#set math.equation(numbering: n => "(3.3)")
 $ g_mu \( U \) lt.eq frac(10^5 n, B_(i j)) . $ <eq:hole-relocation-bound>]

]
] <lem:hole-relocation>

#proof[
  Throughout this proof, omit the subscript $mu$ from $g$ and $r$. Write $B = B_(i j)$.
    For $B lt.eq 8$, the assertion follows from (3.2). Suppose therefore that $B > 8$,
    and choose a simple path from $i$ to $j$ whose $lambda$-activities, and hence its $mu$-activities,
    are all at least $B$.
  We first give one step of the relocation. Let $a$ be the hole currently on this path,
    let $S$ be the current hole set, and let $z$ be the next vertex. Thus $a in S$ and $mu_(a z) gt.eq B$.
    If $z in S$, inserting $a z$ in a matching missing $S$ is injective and increases its weight by $mu_(a z)$. Hence
  #[#set math.equation(numbering: n => "(3.4)")
   $ frac(g \( S \), r_a) lt.eq frac(g \( S \\ { a \, z } \), B r_a) lt.eq 32 / B . $ <eq:adjacent-hole-fill>]
  The last inequality uses $\| S \| lt.eq 4$, (3.2), and $r_a gt.eq 1 \/ 8$.
  Now suppose $z in.not S$. Choose $p eq.not z$ with $g \( z p \) = r_z$.
    Inserting $a z$ gives $g \( a z \) lt.eq 1 \/ mu_(a z) lt.eq 1 \/ B < 1 \/ 8$, so $p eq.not a$.
    Overlay $M in cal(M) \( - S \)$ and $P in cal(M) \( - { z \, p } \)$.
    The path from $a$ starts with an edge of $P$. Its endpoint belongs to exactly one of the following three cases.
  + It ends at $z$. Switching the path gives layers missing $S \\ { a } union { z }$ and ${ a \, p }$.
    The product weight is unchanged.
  + It ends at $p$, which requires $p in.not S$. Switching gives layers missing $S \\ { a } union { p }$ and ${
    a \, z }$. Insert $a z$ in the second layer, making it perfect. The product weight increases by $mu_(a z) gt.eq B$.
  + It ends at $x in S \\ { a \, p }$. Switching gives layers missing $S \\ { a \, x }$ and ${ z \, p \, a \,
    x }$. Insert $a z$ in the second layer; its remaining holes are ${ p \, x }$.
    Again the product weight increases by at least $B$.
  These cases exhaust the possibilities. Indeed, the degree-one vertices in the overlay are exactly the symmetric
    difference of the two hole sets; if $p in S$, then $p$ is isolated and cannot be an endpoint of the path.
  The edge $a z$ is absent from both input layers, since the first misses $a$ and the second misses $z$.
    Switching cannot create an edge absent from the overlay. Each map is injective when its case and endpoint are
    specified. For case (i), the inverse switches the output path from $a$.
    For cases (ii) and (iii), first remove the inserted edge $a z$ from the second output layer,
    then switch the path from $a$ in the resulting overlay. This reconstructs both input layers,
    including their common edges. Summing over all inputs, using $g \( a p \) lt.eq r_a$,
    and dividing by $Z_mu^2 r_z$ yields
  #[#set math.equation(numbering: n => "(3.5)")
   $ g \( S \) lt.eq  & r_a / r_z g \( S \\ { a } union { z } \)\
 & +
   frac(1, B r_z)
   [upright(bold(1))_({ p in.not S }) g \( S \\ { a } union { p } \) + sum_(x in S \\ { a \, p }) g \( S \\ { a \,
   x } \) g \( p x \)] . $ <eq:relocation-step>]
  An inapplicable first term inside the brackets is omitted entirely. The brackets are at most $96$:
    for $\| S \| = 4$ their first term is at most $48$ and their at most three product terms are each at most
    $16$; for $\| S \| = 2$ the corresponding bound is $8$. After division by $r_a$, therefore,
  #[#set math.equation(numbering: n => "(3.6)")
   $ frac(g \( S \), r_a) lt.eq frac(g \( S \\ { a } union { z } \), r_z) + 6144 / B . $ <eq:normalized-relocation>]
  Starting at $a = i$, apply this recurrence along the chosen path, keeping all holes in $U \\ { i }$ fixed.
    Stop just before reaching the first of these fixed holes; such a hole exists because the path ends at $j$.
    The path is simple, so there are at most $n - 2$ recurrence steps, followed by (3.4).
    The normalization by the current row maximum makes the leading terms telescope. Since $r_i lt.eq 4$,
  $ g \( U \) lt.eq frac(4 #scale(x: 120%, y: 120%)[\(] 6144 \( n - 2 \) + 32 #scale(x: 120%, y: 120%)[\)], B)
    lt.eq frac(10^5 n, B) \, $
  as required. ◻
]

#proof[
  Temporarily add a distinguished parallel edge of activity $t B_(i j) \/ D_0$ to every pair $i j$, where $0 lt.eq
    t lt.eq 1$. Collapsing parallel edges gives activities
  $ mu_(i j) \( t \) = lambda_(i j) + t B_(i j) \/ D_0 . $
  Write $Z \( t \) = Z_(mu \( t \))$ and $g_t = g_(mu \( t \))$; $B$ remains fixed.
    All partition functions involved are polynomials in $t$, and $Z \( t \) > 0$.
    Differentiation of their finite sums gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ frac(d, d t) log Z \( t \) = 1 / D_0 sum_(i j) B_(i j) g_t \( i j \) \, $ <eq:partition-derivative>]
  where sums over edges are unordered, and for distinct $x \, y$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ frac(d, d t) g_t \( x y \) = 1 / D_0 sum_(i j : { i \, j } ∩ { x \, y } = diameter) B_(i j)
     g_t \( x y i j \) - g_t \( x y \) frac(d, d t) log Z \( t \) . $ <eq:hole-derivative>]
  On any initial time interval during which all row maxima belong to $\[ 1 \/ 8 \, 4 \]$,
    Lemma 5 bounds every summand $B_(i j) g_t \( i j \)$ and every summand $B_(i j) g_t \( x y i j \)$ by $10^5
    n$. Since
  $ frac(binom(n, 2) thin 10^5 n, D_0) < eta \, wide eta = 10^(- 3) \, $
  we obtain, throughout that interval,
  $ 0 lt.eq frac(d, d t) log Z \( t \) lt.eq eta \, wide - eta g_t \( x y \) lt.eq
    frac(d, d t) g_t \( x y \) lt.eq eta . $
  Integrating gives
  $ e^(- eta t) g_0 \( x y \) lt.eq g_t \( x y \) lt.eq g_0 \( x y \) + eta t . $
  For the lower row bound, fix a neighbor maximizing the row at time zero;
    the moving row maximum is at least this one evolving entry. Consequently, balance at time zero implies
  $ 1 / 4 e^(- eta) lt.eq r_i \( mu \( t \) \) lt.eq 1 + eta . $
  Both bounds lie strictly inside $\[ 1 \/ 8 \, 4 \]$. By continuity,
    the row maxima cannot first leave this interval before time $1$:
    at a proposed first exit the displayed strict bounds still hold and persist on a neighborhood.
    Thus all preceding estimates hold on $\[ 0 \, 1 \]$, and
  #[#set math.equation(numbering: n => "(3.9)")
   $ frac(Z \( 1 \), Z \( 0 \)) lt.eq e^eta < 2 . $ <eq:logical-inflation>]
  Choose a pairing $Q$ of $U$ attaining $Phi_B \( U \)$. At time $1$,
    keep the original and added parallel edges distinguished.
    To each original matching in $cal(M) \( - U \)$, add the edges of $Q$ using their #emph[added] copies,
    of activities $B_(i j) \/ D_0$. This is an injective map into perfect matchings at time $1$,
    and it multiplies every weight by $Phi_B \( U \) \/ D_0^(\| U \| \/ 2)$. Hence
  $ Z_lambda \( - U \) frac(Phi_B \( U \), D_0^(\| U \| \/ 2)) lt.eq Z \( 1 \) . $
  Divide by $Z \( 0 \) = Z_lambda$ and apply (3.9). ◻
]

== 4 A subdivision with controlled holes <sec:enlargement>

The sampler will use additional clique edges. To control the mass these edges introduce,
  we first replace each logical edge by a path. The path profile has two roles:
  equal adjacent factors make the ratio of its two matching patterns telescope,
  and the gradual change from each endpoint to the middle makes incident effective strengths comparable.
  We first construct the enlarged graph and identify its marked laws,
  then bound the mass introduced by its additional edges.

Throughout this section the logical graph is the complete graph on an even number $n gt.eq 2$ of vertices,
  with positive rational activities $lambda_(u v) lt.eq 4^K$, where $K gt.eq 0$ is an integer.
  Write $B$ for its bottleneck similarity, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ H_u = max_(v eq.not u) B_(u v) \, wide p = 2 K + 2 \, wide N = n + 4 p binom(n, 2) \, wide D =
   100 N^2 D_0 . $ <eq:enlargement-parameters>]

Here $D_0 = 10^8 \( n + 1 \)^4$ is the constant in 3. Thus $1 lt.eq B_(u v) lt.eq H_u lt.eq 4^K$.

=== 4.1 The path profile <the-path-profile>

Orient each logical edge $e = u v$ by the fixed vertex order, and replace it by a path

$ x_0 = u \, x_1 \, dots.h \, x_(4 p) \, x_(4 p + 1) = v . $

Internal vertices of different paths are distinct. Denote the activity of $x_(j - 1) x_j$ by $t_j = t_j^e$.
  For $1 lt.eq r lt.eq p$, set

#[#set math.equation(numbering: n => "(4.2)")
 $ t_(2 r - 1) = t_(2 r) & = max { B_(u v) \, H_u 2^(- \( r - 1 \)) } \,\
t_(4 p + 3 - 2 r) = t_(4 p + 2 - 2 r) & = max { B_(u v) \, H_v 2^(- \( r - 1 \)) } \,\
t_(2 p + 1) & = lambda_(u v) . $ <eq:path-profile>]

We call these the #emph[real] edges and write $Z'$ and $g'$ for their partition function and hole ratios.
  Let $B'$ be their bottleneck similarity. The two innermost equal pairs have activity $B_(u v)$,
  because $H_u 2^(- \( p - 1 \)) \, H_v 2^(- \( p - 1 \)) lt.eq 1 \/ 2$.

#thm([Lemma 4.1.])[
  #emph[The real graph has $N$ vertices. Its perfect matchings are in bijection with logical perfect matchings, and
#[#set math.equation(numbering: n => "(4.3)")
 $ Z' = C_0 Z_lambda \, wide C_0 = product_e product_(1 lt.eq j lt.eq 4 p + 1\
j upright(" even")) t_j^e . $ <eq:real-partition>]

 On a noncentral real edge, its effective strength $B'$ equals its activity.
   On the central edge of the path for $u v$, it equals $B_(u v)$.
   Incident effective strengths differ by a factor of at most two.
   For an internal vertex $x_j$, its maximum incident effective strength is
$ T_j = cases(delim: "{", t_j \, & 1 lt.eq j lt.eq 2 p \,, t_(j + 1) \, & 2 p + 1 lt.eq j lt.eq 4 p .) $

 Its #emph[home terminal] is $u$ in the first case and $v$ in the second.
   Every edge on its leg to its home has activity at least $T_j$.]
] <lem:subdivision>

#proof[
  An intact path has exactly two ways to match its internal vertices:
    the even-indexed edges, which use neither terminal, or the odd-indexed edges, which use both.
    The ratio of the latter weight to the former is $lambda_(u v)$,
    since all the noncentral factors cancel in equal adjacent pairs.
    A real perfect matching therefore chooses the odd tiling precisely on a logical perfect matching.
    This proves the bijection and (4.3).
  Every noncentral edge has an equal-activity twin sharing an internal vertex of degree two.
    A path connecting its endpoints that avoids that edge must use the twin.
    Its bottleneck therefore cannot exceed the edge activity, and the direct edge attains that activity.
  The minimum activity on the full path replacing $e$ is $lambda_e$.
    Consequently, for every $t > 1$, real edges of activity at least $t$ connect two terminals exactly when
    logical edges of activity at least $t$ connect them: a simple path between terminals traverses complete
    subdivision paths. In particular $B'$ restricted to terminals is $B$.
    Let $a = x_(2 p)$ and $b = x_(2 p + 1)$ be the ends of the central edge.
    The legs from $a \, b$ to $u \, v$ have minimum activity $B_(u v)$.
    If $B_(u v) > max { 1 \, lambda_(u v) }$, a logical path attaining $B_(u v)$ avoids $u v$,
    and its subdivision together with these legs connects $a$ to $b$ with bottleneck $B_(u v)$.
    If $B_(u v) = max { 1 \, lambda_(u v) }$, the central edge and the floor at one already give the lower bound.
    For the upper bound, any alternative path from $a$ to $b$ must first use an edge on a leg of activity
    $B_(u v)$. Thus $B'_(a b) = B_(u v)$ in all cases.
  Along each half of a path the displayed profile is nonincreasing toward the center and successive values differ
    by at most two. The effective strength at the center agrees with both innermost pairs.
    At a terminal $u$, every first edge has activity $H_u$. These facts give all remaining assertions. ◻
]

=== 4.2 The enlarged matching law <the-enlarged-matching-law>

For each integer $0 lt.eq k lt.eq floor.l log_2 max_u H_u floor.r$,
  take one label for every component of the enlarged graph whose retained edges have effective strength at least
  $2^k$, including singleton components. A label at level $k >
  0$ has as parent its containing component at level $k - 1$.
  At level zero there is one component; these labels therefore form a rooted tree.
  Components recurring at different levels are still different labels.

Label each real edge $x y$ by the component containing it at level $floor.l log_2 B'_(x y) floor.r$.
  A vertex belongs precisely to the labels of its incident real edges.
  Equal-level incident labels are identical, and the factor-two bound in 6 implies that there are at most two
  incident levels. If there are two, they are consecutive and their labels are parent and child.
  Thus these memberships satisfy 2. In particular, a bag is the set of vertices with that membership;
  it need not be the entire threshold component defining its label.

Within every bag of label $l$ and height $h_l$, add a virtual edge of activity $h_l \/ D$ for each vertex pair.
  Collapse any real edge of color $l$ into the virtual edge with the same endpoints and color,
  adding its activity. This gives one colored edge per common label, of activity

$ W_(x y \, l) = h_l \/ D +
  cases(delim: "{", t_(x y) \, & x y upright(" is a real edge with label ") l \,, 0 \, & upright("otherwise") .) $

Since a real edge assigned to $l$ has $t_(x y) lt.eq B'_(x y) < 2 h_l$, these weights satisfy (2.3).
  Also $1 \/ D lt.eq W_(x y \, l) lt.eq 3 dot.op 4^K$.

For each logical edge $e$, split off activity $1 \/ D$ from the virtual activity on its central colored edge,
  and mark that portion as the #emph[probe for $e$]. This is possible because $h_l gt.eq 1$.
  After sampling a colored matching, independently reveal the portion of each used edge in proportion to its real,
  probe, and remaining virtual activities; zero portions are omitted.

1 shows the two real tilings and the probe on one illustrative path.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 3.6), (0.59, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((0.59, 3.6), (1.18, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((1.18, 3.6), (1.77, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((1.77, 3.6), (2.36, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((2.36, 3.6), (2.95, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((2.95, 3.6), (3.54, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((3.54, 3.6), (4.13, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((4.13, 3.6), (4.72, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((4.72, 3.6), (5.31, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((5.31, 3.6), (5.9, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((5.9, 3.6), (6.49, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((6.49, 3.6), (7.08, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((7.08, 3.6), (7.67, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((7.67, 3.6), (8.26, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((8.26, 3.6), (8.85, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((8.85, 3.6), (9.44, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((9.44, 3.6), (10.03, 3.6), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((0, 1.8), (0.59, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((0.59, 1.8), (1.18, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((1.18, 1.8), (1.77, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((1.77, 1.8), (2.36, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((2.36, 1.8), (2.95, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((2.95, 1.8), (3.54, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((3.54, 1.8), (4.13, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((4.13, 1.8), (4.72, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((4.72, 1.8), (5.31, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((5.31, 1.8), (5.9, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((5.9, 1.8), (6.49, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((6.49, 1.8), (7.08, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((7.08, 1.8), (7.67, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((7.67, 1.8), (8.26, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((8.26, 1.8), (8.85, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((8.85, 1.8), (9.44, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((9.44, 1.8), (10.03, 1.8), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((0, 0), (0.59, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((0.59, 0), (1.18, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((1.18, 0), (1.77, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((1.77, 0), (2.36, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((2.36, 0), (2.95, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((2.95, 0), (3.54, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((3.54, 0), (4.13, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((4.13, 0), (4.72, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((4.72, 0), (5.31, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((5.31, 0), (5.9, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((5.9, 0), (6.49, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((6.49, 0), (7.08, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((7.08, 0), (7.67, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((7.67, 0), (8.26, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((8.26, 0), (8.85, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((8.85, 0), (9.44, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((9.44, 0), (10.03, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10))
  line((0.59, 3.6), (1.18, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((1.77, 3.6), (2.36, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((2.95, 3.6), (3.54, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((4.13, 3.6), (4.72, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((5.31, 3.6), (5.9, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((6.49, 3.6), (7.08, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((7.67, 3.6), (8.26, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((8.85, 3.6), (9.44, 3.6), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((0, 1.8), (0.59, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((1.18, 1.8), (1.77, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((2.36, 1.8), (2.95, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((3.54, 1.8), (4.13, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((4.72, 1.8), (5.31, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((5.9, 1.8), (6.49, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((7.08, 1.8), (7.67, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((8.26, 1.8), (8.85, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((9.44, 1.8), (10.03, 1.8), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((0, 0), (0.59, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((1.18, 0), (1.77, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((2.36, 0), (2.95, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((3.54, 0), (4.13, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((5.9, 0), (6.49, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((7.08, 0), (7.67, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((8.26, 0), (8.85, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((9.44, 0), (10.03, 0), stroke: (paint: rgb("#000000"), thickness: 1.5pt, miter-limit: 10))
  line((4.72, 0), (5.31, 0), stroke: (paint: rgb("#000000"), thickness: 1.8pt, miter-limit: 10, dash: "densely-dotted"))
  content((5.015, 0.1411), [$1"/"D$], anchor: "south", padding: 0.1176cm)
  circle((0, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((0.59, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((1.18, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((1.77, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((2.36, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((2.95, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((3.54, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((4.13, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((4.72, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((5.31, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((5.9, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((6.49, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((7.08, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((7.67, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((8.26, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((8.85, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((9.44, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((10.03, 3.6), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  content((0, 3.494), [$u$], anchor: "north", padding: 0.1176cm)
  content((4.72, 3.494), [$x_8$], anchor: "north", padding: 0.1176cm)
  content((5.31, 3.494), [$x_9$], anchor: "north", padding: 0.1176cm)
  content((10.03, 3.494), [$v$], anchor: "north", padding: 0.1176cm)
  circle((0, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((0.59, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((1.18, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((1.77, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((2.36, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((2.95, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((3.54, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((4.13, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((4.72, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((5.31, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((5.9, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((6.49, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((7.08, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((7.67, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((8.26, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((8.85, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((9.44, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((10.03, 1.8), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  content((0, 1.694), [$u$], anchor: "north", padding: 0.1176cm)
  content((4.72, 1.694), [$x_8$], anchor: "north", padding: 0.1176cm)
  content((5.31, 1.694), [$x_9$], anchor: "north", padding: 0.1176cm)
  content((10.03, 1.694), [$v$], anchor: "north", padding: 0.1176cm)
  circle((0, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((0.59, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((1.18, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((1.77, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((2.36, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((2.95, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((3.54, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((4.13, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((4.72, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((5.31, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((5.9, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((6.49, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((7.08, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((7.67, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((8.26, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((8.85, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((9.44, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  circle((10.03, 0), radius: 0.05488, fill: rgb("#000000"), stroke: none)
  content((0, -0.1058), [$u$], anchor: "north", padding: 0.1176cm)
  content((4.72, -0.1058), [$x_8$], anchor: "north", padding: 0.1176cm)
  content((5.31, -0.1058), [$x_9$], anchor: "north", padding: 0.1176cm)
  content((10.03, -0.1058), [$v$], anchor: "north", padding: 0.1176cm)
  circle((0, 3.6), radius: 0.05997, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, miter-limit: 10))
  circle((10.03, 3.6), radius: 0.05997, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, miter-limit: 10))
  content((0.295, 3.706), [#text(size: 7pt)[$4$]], anchor: "south", padding: 0.1176cm)
  content((0.885, 3.706), [#text(size: 7pt)[$4$]], anchor: "south", padding: 0.1176cm)
  content((1.475, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((2.065, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((2.655, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((3.245, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((3.835, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((4.425, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((5.015, 3.706), [#text(size: 7pt)[$frac(1, 2)$]], anchor: "south", padding: 0.1176cm)
  content((5.605, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((6.195, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((6.785, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((7.375, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((7.965, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((8.555, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((9.145, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((9.735, 3.706), [#text(size: 7pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((-0.531, 3.6), [even tiling], anchor: "east", padding: 0.1176cm)
  content((-0.531, 1.8), [odd tiling], anchor: "east", padding: 0.1176cm)
  content((-0.531, 0), [sole probe], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: One subdivision path with $K = 1$, $p = 4$ and $4 p + 1 = 17$ edges. The top labels are the real activities: $H_u = 4$, $H_v = B_(u v) = 2$, and $lambda_(u v) = 1 \/ 2$; the central edge has effective strength $B'_(x_8 x_9) = 2$. Solid edges show the selected real tiling. The even tiling uses neither terminal, and the odd tiling uses both; the odd-to-even weight ratio is $lambda_(u v)$. The last row uses the probe portion of the central colored bag edge and real portions elsewhere. Here the central label has height $h_l = 2$, so its collapsed activity $1 \/ 2 + 2 \/ D$ consists of real activity $1 \/ 2$, probe activity $1 \/ D$, and remaining virtual activity $1 \/ D$. The probe forces the real edges on the two outer legs to use both terminals. Their combined weight equals the even-tiling weight, so the remaining paths represent a logical matching with $u \, v$ deleted. ],
) <fig:subdivision-probe-example>

Let $Z_(upright("bag"))$ be the colored partition function of the enlarged graph, and put $I =
  Z_(upright("bag")) \/ Z'$. This ratio measures the mass introduced by the auxiliary edges.

#thm([Proposition 4.2.])[
  (Marked matching laws).  #emph[For arbitrary positive logical activities,
    sample from the bag matching law and reveal the edge portions as above.
    The all-real event has probability $1 \/ I$; conditional on this event,
    the decoded logical matching has law $pi_lambda$. For each logical edge $u v$,
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(P) \( upright("probe for ") u v upright(" is used and all other edges are real") \) =
   frac(g_lambda \( u v \), D I) . $ <eq:probe>]

 Conditional on this event, the residual logical matching has the $lambda$-weighted perfect-matching law on the
   vertices other than $u \, v$.]
] <prop:marked-laws>

#proof[
  Revealing portions recovers the weighted law before the real and virtual activities were collapsed.
    The all-real matchings have total weight $Z' = C_0 Z_lambda$,
    and their normalized law is transported to $pi_lambda$ by 6.
  Now require the probe on the path for $u v$ and real edges everywhere else.
    The probe matches $x_(2 p)$ to $x_(2 p + 1)$. The remaining vertices on its path have unique real tilings:
    the left one uses $u$, and the right one uses $v$. Equal adjacent activities in (4.2) show that their combined
    weight is exactly the even-edge baseline weight of this path.
    Other paths incident to $u$ or $v$ must use their even tilings.
    The remaining paths retain their even and odd alternatives, with ratio $lambda_e$.
    Consequently these marked matchings are in bijection with logical matchings missing $u \, v$,
    and every weight is multiplied by $C_0 \/ D$. Their total mass is $C_0 Z_lambda \( - u v \) \/ D$.
    Dividing by $Z_(upright("bag")) = I C_0 Z_lambda$ proves (4.4);
    the same constant weight multiplier proves the conditional-law assertion. ◻
]

The identities show what the enlarged graph provides to the counting algorithm.
  To use its all-real event with polynomially many samples,
  we also need a uniform lower bound on that event’s probability.
  The next lower-bound estimate requires balance; the construction and the exact laws above do not.

#thm([Proposition 4.3.])[
  (Bounded inflation).  #emph[If the logical activities are balanced, then
#[#set math.equation(numbering: n => "(4.5)")
 $ 1 lt.eq I lt.eq 2 . $ <eq:inflation>]

]
] <prop:bag-inflation>

We prove this bound in the remainder of the section. A collection of virtual edges leaves a set $U$ of endpoints
  to be removed from a real matching. Its added weight must therefore be compared with $g' \( U \)$.
  The next two subsections transfer the logical hole estimate to these enlarged hole sets.

=== 4.3 Exact accounting for deleted vertices <exact-accounting-for-deleted-vertices>

We next describe exactly what deleting internal vertices does to the logical graph.
  A path is #emph[broken] if at least one of its internal vertices is deleted.
  Let $E_(upright("br")) \( U \)$ be the set of logical edges whose paths are broken by a hole set $U$.

Consider the ordered internal holes on a broken path. If a real completion exists,
  successive hole indices alternate in parity, because the intervening internal run must have even order.
  A first hole of even index forces the prefix to match the terminal $u$;
  we say that this hole #emph[consumes] $u$ and map it to $u$.
  A last hole of odd index similarly consumes and maps to $v$.
  Remove all consumed holes (zero, one, or two) from the list.
  The remaining holes split, in their order, into pairs $\( j \, k \)$ with $j$ odd and $k$ even;
  call these #emph[neutral pairs]. There is no ambiguity when the list has one hole,
  since it cannot both have even and odd index.

Let $R$ be the set of explicitly deleted terminals together with all consumed terminals.
  Feasibility requires these terminals to be distinct. To each consumed hole $x_j$ assign the factor

$ f_j =
  cases(delim: "{", 1 \, & upright("if it maps to its home terminal") \,, lambda_e \/ T_j \, &
  upright("if it maps to the other terminal") .) $

For a neutral pair $\( j \, k \)$ assign

#[#set math.equation(numbering: n => "(4.6)")
 $ f_(j k) =
   cases(delim: "{", T_j^(- 1) \, & j \, k lt.eq 2 p \,, T_k^(- 1) \, & j \, k gt.eq 2 p + 1 \,, lambda_e \/ \(
   T_j T_k \) \, & j lt.eq 2 p < k .) $ <eq:neutral-factors>]

Let $F = F \( U \)$ be the product of all these factors on all broken paths; an empty product is one.
  Both $R$ and $F$ depend only on $U$ and the fixed path profiles, not on a choice of completion.

For a set $E_0$ of logical edges, write $Z_lambda \( - R \; E_0 upright(" forbidden") \)$ for the partition
  function after deleting $R$ and forbidding those edges.

#thm([Lemma 4.4.])[
  #emph[If an even hole set $U$ has a real completion, then $R$ is even, $\| R \| lt.eq \| U \|$, and
#[#set math.equation(numbering: n => "(4.7)")
 $ Z' \( - U \) = C_0 F \( U \) Z_lambda #scale(x: 120%, y: 120%)[\(] - R \;
   E_(upright("br")) \( U \) upright(" forbidden") #scale(x: 120%, y: 120%)[\)] . $ <eq:deletion-identity>]

 In particular, $g' \( U \) lt.eq F \( U \) g_lambda \( R \)$.]
] <lem:deletion-accounting>

#proof[
  Fix a broken path. A prefix ending immediately before a first hole of index $j$ has $j - 1$ internal vertices.
    If $j$ is odd it uses the even tiling and leaves $u$ unused;
    if $j$ is even it uses the odd tiling and consumes $u$. The suffix has the analogous alternatives.
    Every run between consecutive holes has a unique tiling, since its order is even.
    These parity conditions prove the stated description of consumed holes and neutral pairs.
    On each path the number of consumed holes has the same parity as the number of internal holes.
    Adding explicit terminal holes gives $\| R \| equiv \| U \| med \( mod med 2 \)$.
    Distinctness and $\| R \| lt.eq \| U \|$ follow from feasibility and the fact that each consumed terminal is
    charged to a different hole.
  For completeness, all factors can be obtained from one prefix ratio. For even $j$, define
  $ P \( j \) =
    frac(product_(i lt.eq j \, med i upright(" odd")) t_i, product_(i lt.eq j \, med i upright(" even")) t_i) \,
    wide P \( 0 \) = 1 . $
  The profile gives
  $ P \( j \) = cases(delim: "{", 1 \, & j lt.eq 2 p \,, lambda_e \/ T_j \, & j gt.eq 2 p + 2 .) $
  This is the factor for a first even-indexed hole consuming $u$;
    reflection gives the factor for a last odd-indexed hole consuming $v$.
    For a neutral pair $\( j \, k \)$, its shifted tiling relative to the even-edge baseline contributes
  $ frac(product_(i = j + 2 \, j + 4 \, dots.h \, k - 1) t_i, product_(i = j + 1 \, j + 3 \, dots.h \, k) t_i) =
    frac(P \( k \), P \( j - 1 \) t_j) . $
  If $j$ is odd on the left, its denominator is $T_j$; if $j$ is odd on the right, its denominator is $lambda_e$,
    also when $j = 2 p + 1$. Substitution proves (4.6). Prefixes and suffixes that do not consume a terminal,
    and runs outside these shifted intervals, retain their baseline even edges.
    Thus the product $F$ accounts for all changes to the baseline on broken paths.
  Every completion now determines a logical matching on the intact paths, using exactly the terminals outside $R$.
    Conversely, take any logical perfect matching on the vertices outside $R$ that uses no broken edge.
    Give its selected intact paths their odd tilings, give other intact paths their even tilings,
    and fill all broken paths by the uniquely forced runs just described.
    The distinctness conditions ensure that no terminal is used twice or is both used and deleted.
    This reconstructs a real completion and is inverse to the first map.
    Its weight is $C_0 F$ times the logical weight, which proves (4.7).
    Omitting the forbidden-edge condition and dividing by (4.3) gives the inequality. ◻
]

=== 4.4 Charging the pairing capacity <charging-the-pairing-capacity>

The deletion identity gives a factor $F \( U \)$ and a logical hole set $R$.
  To transfer the logical bound, we must compare the pairing capacity of $U$ with that of $R$.
  The next lemma expresses both capacities through threshold classes.
  Throughout the comparison, these classes belong to the original undeleted graphs,
  so they are independent of the completion being counted.

#thm([Lemma 4.5.])[
  (Pairings in a hierarchy).  #emph[Let $B gt.eq 1$ be a symmetric similarity on a finite vertex set $X$,
    satisfying $B_(i j) gt.eq min { B_(i k) \, B_(k j) }$. Let $cal(C)_t$ be the equivalence classes of $B gt.eq
    t$, including singletons. For every even set $U subset.eq X$,
#[#set math.equation(numbering: n => "(4.8)")
 $ log Phi_B \( U \) = integral_1^oo sum_(C in cal(C)_t) ⌊frac(\| C ∩ U \|, 2)⌋ frac(d t, t) . $ <eq:threshold-pairing>]

 There is one pairing that attains the maximum number of internal pairs in every threshold class simultaneously.]
] <lem:ultrametric-pairing>

#proof[
  For any pairing $Q$,
  $ log product_(i j in Q) B_(i j) = integral_1^oo \| { i j in Q : B_(i j) gt.eq t } \| thin frac(d t, t) . $
  Inside a threshold class $C$, there are at most $floor.l \| C ∩ U \| \/ 2 floor.r$ pairs of $Q$,
    proving the upper bound.
  The threshold classes form a laminar family: any two are disjoint or one contains the other.
    Process its finitely many distinct classes from smaller to larger, starting with the singletons.
    In each class, pair its currently unpaired elements of $U$ arbitrarily until at most one remains.
    When a class $C$ has been processed, exactly $floor.l \| C ∩ U \| \/ 2 floor.r$ pairs lie inside it.
    Subsequent processing cannot create another pair inside $C$,
    because at most one element of $C ∩ U$ remains unpaired. The final class is $X$, and $\| U \|$ is even,
    so the procedure produces a pairing. It attains every floor count, and therefore attains the integral upper bound. ◻
]

#thm([Lemma 4.6.])[
  #emph[If the logical activities are balanced, then for every even set $U$ of enlarged vertices,
$ g' \( U \) Phi_(B') \( U \) lt.eq 2 D_0^(\| U \| \/ 2) . $

 More precisely, for every $U$ with a real completion, the deterministic quantities above satisfy
#[#set math.equation(numbering: n => "(4.9)")
 $ F \( U \) Phi_(B') \( U \) lt.eq Phi_B \( R \) . $ <eq:threshold-charge>]

]
] <lem:lifted-hole-bound>

#proof[
  The assertion is immediate if $U$ has no completion, so suppose otherwise.
    For a threshold $t > 1$ and any set $A$ of enlarged vertices, let
  $ S'_t \( A \) = sum_C ⌊frac(\| A ∩ C \|, 2)⌋ \, $
  where $C$ ranges over the threshold classes of $B'$. Define $S_t$ on logical vertices in the same way using $B$.
    These definitions make sense even when $A$ has odd cardinality.
    The threshold partitions remain those of the undeleted graphs throughout this proof;
    only the sets of holes are changed.
  By 6, an internal vertex $x_j$ is isolated in the threshold partition precisely when $T_j < t$;
    otherwise it is connected to its home terminal. Call it #emph[active] in the latter case.
    The threshold relation induced on terminals is exactly the logical relation.
    These statements can equivalently be checked using raw real edges of activity at least $t$,
    since taking the bottleneck closure leaves threshold components unchanged.
  Remove the neutral pairs one at a time from the current hole set.
    For a pair on the same side, its active vertices lie in one class. Removing it reduces $S'_t$ by at most
  $ upright(bold(1))_({ max \( T_j \, T_k \) gt.eq t }) . $
  Indeed, two active holes are removed from one class, one active hole reduces a class floor by at most one,
    and an inactive hole is in a singleton class and contributes zero.
    On the left $max \( T_j \, T_k \) = T_j$; on the right it is $T_k$. For a cross pair, the loss is at most
  $ upright(bold(1))_({ T_j gt.eq t }) + upright(bold(1))_({ T_k gt.eq t }) -
    upright(bold(1))_({ lambda_e gt.eq t }) . $
  To see the subtracted term, when $lambda_e gt.eq t$ both vertices are active and are connected by the full path,
    so their removal reduces a single class floor by one. Otherwise the bound is the sum of the separate
    active-hole bounds. These arguments apply to the current set after any preceding removals.
  Next consider each consumed hole mapping away from home. If it is active and $lambda_e < t$, discard it.
    The floor loss is at most
  $ upright(bold(1))_({ T_j gt.eq t }) - upright(bold(1))_({ lambda_e gt.eq t }) . $
  The expression is nonnegative, since $T_j gt.eq B_e gt.eq lambda_e$.
    Every remaining active consumed hole can be mapped to its consumed terminal within its threshold class:
    a home mapping always has this property, and an away mapping retained by the rule has $lambda_e gt.eq t$.
    Together with explicitly deleted terminals, these maps are injective, by the distinctness in 9.
    Inactive internal holes lie in singleton classes and contribute no floor.
    Hence the floor sum remaining after the removals and discards is at most $S_t \( R \)$.
  Integrate these bounds against $d t \/ t$ on $\( 1 \, oo \)$.
    By 10, the integral of $S'_t \( U \)$ is $log Phi_(B') \( U \)$,
    and that of $S_t \( R \)$ is $log Phi_B \( R \)$. For a same-side neutral pair the integrated charge is
    exactly $- log f_(j k)$. For a cross pair it is
  $ log T_j + log T_k - log max { 1 \, lambda_e } lt.eq - log f_(j k) . $
  For an away-mapped hole it is
  $ log T_j - log max { 1 \, lambda_e } lt.eq - log f_j . $
  Home mappings cost zero. Summing proves $log Phi_(B') \( U \) lt.eq log Phi_B \( R \) - log F$, which is (4.9).
    Finally, Lemma 4.4, Theorem 3.1 give
  $ g' \( U \) Phi_(B') \( U \) lt.eq g_lambda \( R \) Phi_B \( R \) lt.eq 2 D_0^(\| R \| \/ 2) lt.eq
    2 D_0^(\| U \| \/ 2) . $
  ◻
]

#proof[
  Expand the partition function before collapsing real and virtual portions.
    A nonempty partial matching $Q$ of $a$ colored virtual edges, with endpoint set $U$,
    contributes relative to $Z'$ the mass
  $ g' \( U \) product_(x y \, l in Q) h_l / D . $
  Vertices sharing $l$ lie in the same threshold component at $h_l$, so $h_l lt.eq B'_(x y)$.
    Their pairing therefore gives
  $ g' \( U \) product_(x y \, l in Q) h_l / D lt.eq D^(- a) g' \( U \) Phi_(B') \( U \) lt.eq 2 \( D_0 \/ D \)^a $
  by 11. A vertex pair has at most two common labels, so there are fewer than $N^2$ colored virtual edges and at
    most $N^(2 a)$ choices for $Q$. The empty $Q$ contributes one. Consequently,
  $ 1 lt.eq I lt.eq 1 + 2 sum_(a gt.eq 1) \( N^2 D_0 \/ D \)^a = 1 + 2 / 99 < 2 . $
  ◻
]

== 5 A quadrangulation adapted to the labels <sec:cells>

We now turn to the sampling branch of the proof. Its input is a tree-bag graph as in 2;
  no balance assumption is needed. To compare two alternating matchings on a cycle,
  we shall subdivide its polygon into four-corner cells. A cell side may stand for a long arc of the original
  cycle. We first describe the matching patterns on such an arc and the endpoint repairs the cells must permit,
  then construct a quadrangulation with those properties.

Let $cal(C)$ be a simple even cycle of length $m gt.eq 4$ in the colored bag graph.
  Each edge retains its color, which is a node of the label tree. For a vertex $v$ of $cal(C)$, define

$ S_v = { upright("labels of the two edges of ") cal(C) upright(" incident to ") v } . $

Thus $S_v$ is a singleton or consists of two adjacent tree nodes.
  These sets refer to the #emph[original full cycle] throughout the construction;
  adding a diagonal never changes them. In particular, the cyclic sequence of edge labels is a walk on the tree,
  with repetitions allowed.

An #emph[arc] is one of the two paths in $cal(C)$ between distinct vertices,
  specified together with its endpoints. Its length is its number of edges. We use only odd arcs.
  An arc is #emph[admissible] if its endpoints $u \, v$ satisfy $S_u ∩ S_v eq.not diameter$.
  The clique property then supplies an edge joining them with any chosen label in this intersection.

For an admissible odd arc $J = \( v_0 \, dots.h \, v_s \)$, choose such a colored endpoint chord $e_J$ and put

$ T_J = { v_0 v_1 \, v_2 v_3 \, dots.h \, v_(s - 1) v_s } \, wide N_J = { v_1 v_2 \, v_3 v_4 \, dots.h \,
  v_(s - 2) v_(s - 1) } \, wide C_J = N_J union { e_J } . $

All path edges retain their cycle colors. The #emph[through pattern] $T_J$ and the #emph[closed pattern] $C_J$
  both perfectly match the vertices of $J$; the #emph[interior pattern] $N_J$ leaves only its two endpoints
  unmatched. The symbol $C_J$ denotes a matching, not the original cycle.
  Call $J$ #emph[short] if $s = 1$ and #emph[long] otherwise.
  On a short arc choose its actual cycle edge as $e_J$, so $T_J = C_J$.
  When a diagonal later represents two complementary arcs, we use the same colored chord in both patterns.
  2 shows these patterns on a long arc.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 1.7), (1.2, 1.7), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 0), (1.2, 0), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.2, 1.7), (2.4, 1.7), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.2, 0), (2.4, 0), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((2.4, 1.7), (3.6, 1.7), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((2.4, 0), (3.6, 0), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.6, 1.7), (4.8, 1.7), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.6, 0), (4.8, 0), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.8, 1.7), (6, 1.7), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.8, 0), (6, 0), stroke: (paint: rgb("#b8b8b8"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 1.7), (1.2, 1.7), stroke: (paint: rgb("#000000"), thickness: 1.4pt, miter-limit: 10))
  line((2.4, 1.7), (3.6, 1.7), stroke: (paint: rgb("#000000"), thickness: 1.4pt, miter-limit: 10))
  line((4.8, 1.7), (6, 1.7), stroke: (paint: rgb("#000000"), thickness: 1.4pt, miter-limit: 10))
  line((1.2, 0), (2.4, 0), stroke: (paint: rgb("#000000"), thickness: 1.4pt, miter-limit: 10))
  line((3.6, 0), (4.8, 0), stroke: (paint: rgb("#000000"), thickness: 1.4pt, miter-limit: 10))
  bezier((0, 0), (6, 0), (1.2, 1), (4.8, 1), stroke: (paint: rgb("#000000"), thickness: 1.4pt, miter-limit: 10))
  content((3, 0.8206), [$e_J$], anchor: "south", padding: 0.1176cm)
  circle((0, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, 1.665), [$v_0$], anchor: "north")
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, -0.03528), [$v_0$], anchor: "north")
  circle((1.2, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.2, 1.665), [$v_1$], anchor: "north")
  circle((1.2, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.2, -0.03528), [$v_1$], anchor: "north")
  circle((2.4, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((2.4, 1.665), [$v_2$], anchor: "north")
  circle((2.4, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((2.4, -0.03528), [$v_2$], anchor: "north")
  circle((3.6, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.6, 1.665), [$v_3$], anchor: "north")
  circle((3.6, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.6, -0.03528), [$v_3$], anchor: "north")
  circle((4.8, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((4.8, 1.665), [$v_4$], anchor: "north")
  circle((4.8, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((4.8, -0.03528), [$v_4$], anchor: "north")
  circle((6, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6, 1.665), [$v_5$], anchor: "north")
  circle((6, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6, -0.03528), [$v_5$], anchor: "north")
  content((-0.6, 1.7), [$T_J$], anchor: "east", padding: 0.1176cm)
  content((-0.6, 0), [$C_J$], anchor: "east", padding: 0.1176cm)
  content((6.6, 1.7), [through], anchor: "west", padding: 0.1176cm)
  content((6.6, 0), [$N_J union \{e_J\}$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The two patterns on a long odd arc, illustrated for $J = \( v_0 \, dots.h \, v_5 \)$. Solid edges form the indicated matching; faint dashed edges only locate the underlying path. Both $T_J$ and $C_J$ perfectly match the same vertices. The latter uses the interior pattern $N_J$ and the endpoint chord $e_J$; their union $T_J union C_J$ is the alternating cycle consisting of $J$ and its chord. Replacing $T_J$ by $C_J$ can change interior edges; this replacement need not be a single chain update. ],
) <fig:odd-arc-patterns>

Besides closing an arc with a chord, we shall sometimes need to free its endpoints while starting from its through
  pattern. Removing the first and last edges of a long arc from $T_J$ uncovers its endpoints and its two
  #emph[leaves] $v_1 \, v_(s - 1)$. Call $J$ #emph[good] if it is short or if

$ S_(v_1) ∩ S_(v_(s - 1)) eq.not diameter . $

For a good long arc, choose an edge between its leaves with a label in this intersection,
  called a #emph[leaf repair]. After the two boundary edges are removed,
  inserting this repair matches all internal vertices and leaves both endpoints free.
  For a short arc, deleting its sole edge does the same. This is the matching operation encoded by the good-arc
  condition. The #emph[boundary edges of an arc] mean only its first and last edges, which coincide for a short arc.

Realize the vertices of $cal(C)$ in their cyclic order as a convex polygon.
  A quadrangulation is a subdivision of this polygon into quadrilaterals by noncrossing diagonals.
  A side of a cell represents the arc of the original cycle from one corner to the next corner,
  containing no other corner of that cell. Consequently the four sides of each cell represent four consecutive
  arcs partitioning the entire cycle. An interior diagonal has two occurrences as a cell side,
  and their arcs are complementary in the original cycle.

#thm([Lemma 5.1.])[
  (Label-adapted quadrangulation).  #emph[The polygon of $cal(C)$ has a quadrangulation such that every cell side
    represents an admissible odd arc and the following hold in every cell:]
  + #emph[some opposite pair of sides consists of good arcs;]
  + #emph[if both arcs in an opposite pair are long, both arcs in the other opposite pair are good.]
  #emph[There are $\( m - 2 \) \/ 2$ cells and $\( m - 4 \) \/ 2$ interior diagonals.
    One can construct the quadrangulation in time polynomial in $m$ and the encoding length of the label tree.]
  #emph[Each diagonal may be assigned any common label from the fixed sets at its endpoints,
    used consistently in its two occurrences. For a short side, use the color of its actual cycle edge.
    These choices need not coincide with the auxiliary labels used in the construction.]
] <lem:quadrangulation>

#proof[
  We give a recursive splitting rule. A subproblem is an admissible odd arc $J = \( v_0 \, dots.h \, v_s \)$;
    its #emph[exterior] is its complementary arc in the full cycle.
    Choose a label $P in S_(v_0) ∩ S_(v_s)$, and write $a_i$ for the label of $v_i v_(i + 1)$, $0 lt.eq i < s$.
    Adjacent terms of this sequence are equal or adjacent in the tree. If $s = 1$, no cell is needed.
    For $s gt.eq 3$, we find indices
  #[#set math.equation(numbering: n => "(5.1)")
   $ 0 < p_1 < p_2 < s \, wide p_1 upright(" odd") \, quad p_2 upright(" even") \, $ <eq:cell-split-indices>]
  such that the three subarcs with successive endpoint pairs
  $ \( v_0 \, v_(p_1) \) \, wide \( v_(p_1) \, v_(p_2) \) \, wide \( v_(p_2) \, v_s \) $
  are admissible. They and the exterior arc form the four sides of the new cell.
    We call these the first, middle, third, and exterior sides, respectively.
  We repeatedly use the following elementary fact about a tree.
    If a contiguous part of the label walk avoids $P$ and its first and last labels are adjacent to $P$,
    these two labels coincide: the walk lies in a single component of the tree with $P$ removed,
    and that component has just one node adjacent to $P$.
  ===== 5.1 The exterior is good. <the-exterior-is-good.>
  It suffices to make either the middle side short or both the first and third sides short.
    Either alternative immediately implies (i) and (ii), because the exterior is good.
  First ensure that some $a_i$ equals $P$. If none does, $a_0$ and $a_(s - 1)$ are adjacent to $P$,
    because the endpoint sets contain $P$. The elementary tree fact gives $a_0 = a_(s - 1) =
    Q$ for a neighbor $Q$ of $P$. Replace $P$ by $Q$, which also lies in both endpoint sets.
    We now distinguish the exhaustive possibilities below.
  + Suppose $a_i = P$ for an odd $i$. Set $p_1 = i$ and $p_2 = i + 1$. The middle side is short.
    The first side’s two endpoints contain $P$, as do the third side’s two endpoints, so all three sides are admissible.
  + Otherwise all occurrences of $P$ have even indices. If their first index is $i > 0$, set $p_1 = i -
    1$ and $p_2 = i$. The prefix $a_0 \, dots.h \, a_(i - 1)$ avoids $P$,
    and its first and last labels are adjacent to $P$. They therefore equal the same neighbor $Q$.
    The first side’s endpoints both contain $Q$, and the third side’s endpoints both contain $P$.
    The middle side is short.
  + Suppose the first occurrence is at $0$, but the last occurrence is at $j < s - 1$.
    Set $p_1 = j + 1$ and $p_2 = j + 2$. The suffix $a_(j + 1) \, dots.h \,
    a_(s - 1)$ avoids $P$ and has its two end labels adjacent to $P$, so they equal one neighbor $Q$.
    The first side’s endpoints contain $P$, the third side’s endpoints contain $Q$, and the middle side is short.
  + In the remaining case $a_0 = a_(s - 1) = P$. Set $p_1 = 1$ and $p_2 = s - 1$.
    Both outer sides are short, and the middle side’s endpoints both contain $P$.
  All indices satisfy (5.1). For example, in (b) the even index $i$ is at least $2$,
    and in (c) the even index $j$ is at most $s - 3$.
  ===== 5.2 The exterior is not good. <the-exterior-is-not-good.>
  The exterior is then long. At least one of its leaves lacks $P$ in its fixed label set,
    since otherwise its two leaves would share $P$. Reverse the indexing of $J$ if necessary so that this leaf is
    the exterior neighbor of $v_0$. The exterior edge at $v_0$ cannot have label $P$.
    Since $P in S_(v_0)$, the first edge of $J$ must have label $a_0 = P$.
  If $a_(s - 1) = P$ as well, choose $p_1 = 1 \, p_2 = s - 1$.
    Both outer sides are short, and the middle side is admissible.
    Otherwise let $t - 1$ be the last index with $a_(t - 1) = P$. Thus $1 lt.eq t lt.eq s - 1$.
    The suffix $a_t \, dots.h \, a_(s - 1)$ avoids $P$. Its first label is adjacent to $P$,
    and its last label is adjacent to $P$ because $P in S_(v_s)$. Hence
  $ a_t = a_(s - 1) = Q $
  for the same neighbor $Q$ of $P$.
  - If $t$ is even, set $p_1 = 1 \, p_2 = t$. The first side is short.
    The middle side’s endpoints both contain $P$, and the third side’s endpoints both contain $Q$.
    The third side is good: if long, both its boundary edges have label $Q$, so both its leaves contain $Q$.
  - If $t$ is odd, set $p_1 = t \, p_2 = s - 1$. The third side is short.
    The first side’s endpoints both contain $P$, and the middle side’s endpoints both contain $Q$.
    The first side is good because, if long, both its boundary edges have label $P$.
  The required strict inequalities follow from $t gt.eq 2$ in the even case and $t lt.eq s - 2$ in the odd case.
    In either case the first and third sides are good and at least one is short. This proves (i).
    The only opposite pair that can contain two long sides is the middle–exterior pair,
    and its other pair is good, proving (ii).
  ===== 5.3 Recursion and consistent diagonals. <recursion-and-consistent-diagonals.>
  Start with any arc of length $m - 1$, whose exterior is the remaining single cycle edge.
    Its endpoints share that edge’s label. Apply the splitting rule and recurse on each of the three subarcs whose
    length exceeds one, always using the original sets $S_v$ and the complement in the original cycle as exterior.
    The three subpolygons have disjoint interiors, so all diagonals are noncrossing.
    Each recursive child has odd length and admissible endpoints by the construction.
    The splitting label $P$ is only an auxiliary witness to admissibility;
    it does not constrain the color of the closing diagonal. Thus each diagonal can be colored once and the same
    color used on both sides.
  For an odd arc of length $s$, the resulting number of cells is $\( s - 1 \) \/ 2$:
    this is zero for $s = 1$, and a split into odd lengths $s_1 + s_2 + s_3 = s$ gives
  $ 1 + sum_(i = 1)^3 frac(s_i - 1, 2) = frac(s - 1, 2) . $
  The root therefore gives $\( m - 2 \) \/ 2$ cells. Each nonroot recursive subproblem that creates a cell has one
    closing diagonal, giving one fewer interior diagonals than cells.
    A direct implementation scans at most $m$ labels in each of the $\( m - 2 \) \/ 2$ nontrivial subproblems;
    the recursion also has $m - 1$ short leaf arcs. Fixing total orders for any choices makes the construction
    deterministic, with $O \( m^2 \)$ label comparisons and polynomial bit cost. ◻
]

For each cell, choose its colored side chords as in 12; for each good long side, choose one leaf repair.
  These are precisely the additional edges needed for the local matching constructions in the next section.

#thm([Lemma 5.2.])[
  (Comparability within a cell).  #emph[Consider the four colored side chords of a cell,
    the first and last cycle edges of each of its four arcs, and one leaf repair for each good long arc.
    The labels of any two edges in this collection have tree distance at most $6$.
    Consequently their activities lie within a factor
$ A_0 = 1000 D $

 of one another. The same conclusion holds after clamping every edge activity to any common interval $\[ a \, b \]
   subset \( 0 \, oo \)$.]
] <lem:cell-comparability>

#proof[
  Two consecutive side chords have labels in the same fixed set $S_v$ at their common cell corner,
    so their labels are equal or adjacent. Any two of the four side-chord labels therefore have distance at most
    $2$. A boundary edge of an arc and its side chord have labels in the same $S_v$ at the relevant endpoint,
    giving distance at most $1$. A leaf repair and the boundary edge at either of its leaves have labels in that
    leaf’s fixed set, again giving distance at most $1$. Thus each edge in the stated collection is at distance at
    most $2$ from its side chord, and the diameter is at most $2 + 2 + 2 = 6$.
  Adjacent labels have heights differing by a factor $2$. If edges $e \, f$ have labels $ell \,
    ell'$ with distance at most $6$, the assumed activity bounds imply
  $ W_e / W_f lt.eq frac(3 h_ell, h_(ell') \/ D) lt.eq 3 D thin 2^6 = 192 D lt.eq A_0 . $
  The same bound holds with $e \, f$ exchanged. Finally the common clamp $psi \( x \) = max { a \, min { b \,
    x } }$ satisfies
  $ 1 lt.eq frac(psi \( x \), psi \( y \)) lt.eq x / y wide \( x gt.eq y > 0 \) . $
  For example this follows by observing that $log psi \( e^u \)$ is the clamp of $u$ to $\[ log a \, log b \]$,
    a nondecreasing $1$-Lipschitz function. Clamping therefore preserves the factor bound. ◻
]

== 6 A two-coordinate energy inequality <sec:energy>

This section proves the sampling argument’s main inequality.
  The four side chords of each cell give a two-edge switch whose changed edges have comparable activities.
  Long arc conversions are used in an exact signed identity and need not be individual chain moves.
  We control the resulting context errors by swapping an alternating cycle with an independent matching.
  Encodings by two matchings change only a bounded number of edges in their multiset union,
  and their preimage counts give polynomial load bounds. The variance-to-energy comparison is related to the flow
  method of [15], but we do not invoke a path-congestion theorem:
  the signed identity and its context-error estimates are established for the present pair kernel.

Fix a tree-bag graph on $N gt.eq 2$ vertices, with at least one perfect matching,
  and let $w$ be either its reference activities or any common clamp of them.
  Write $pi \( M \) = "wt"_w \( M \) \/ Z_w$ and $cal(M)$ for its colored perfect matchings. Throughout this section put

#[#set math.equation(numbering: n => "(6.1)")
 $ A_0 = 1000 D \, wide cal(T) = \( 10 N \)^30 \, wide L = \( 10^4 N D \)^100 . $ <eq:energy-constants>]

=== 6.1 The pair kernel <the-pair-kernel>

On $\( A \, B \) in cal(M)^2$, choose each of the following proposal types with probability $1 \/ 3$.

+ #emph[Two-edge switch.] Choose an unordered pair of distinct edges of $A$ uniformly,
  and choose either alternative pairing of their four endpoints with probability $1 \/ 2$.
  For each proposed edge, choose index $1$ or $2$ with probability $1 \/
  2$ from the ordered list of common labels of its endpoints. If an index is absent, stay put.
  If $A$ has fewer than two edges, stay put.
+ #emph[Color change.] Choose an edge of $A$ uniformly and choose index $1$ or $2$ from the common-label list with
  probability $1 \/ 2$. An absent index gives a holding move.
+ #emph[Cycle swap.] Choose uniformly one discrepancy cycle of $A \, B$ and interchange its two layers.
  If there is no discrepancy cycle, stay put.

Accept each proposal by the Metropolis rule for $pi ⊗ pi$.
  Denote the resulting kernel by $P$ and its energy by $cal(E)$. The proposal is symmetric.
  For the first two types, the reverse choice has the same edge, pairing, and color-index probabilities;
  the possible holding choices do not change this fact. For the third type,
  the discrepancy cycles and their number are unchanged by the swap.
  In particular, a cycle swap always has acceptance probability one, since its product weight is unchanged.

#thm([Theorem 6.1.])[
  (Pair energy inequality).  #emph[For every two real functions $f_1 \, f_2$ on $cal(M)$,
#[#set math.equation(numbering: n => "(6.2)")
 $ "Var"_pi f_1 lt.eq L thin cal(E) #scale(x: 120%, y: 120%)[\(] \( A \, B \) mapsto f_1 \( A \) +
   f_2 \( B \) #scale(x: 120%, y: 120%)[\)] . $ <eq:pair-energy>]

 The same constant works for every common-interval clamp of the reference activities.]
] <thm:pair-energy>

In the proof write $F \( A \, B \) = f_1 \( A \) + f_2 \( B \)$ and $E = cal(E) \( F \)$.
  A two-edge switch is called #emph[safe] if its four removed or inserted colored edges have activities within a
  factor $A_0$ of one another. Let $cal(S) \( A \)$ be its possible safe destinations,
  and let $cal(K) \( A \)$ be its possible destinations by changing one edge color.
  Consecutive labels have comparable heights, so every color change has activity ratio in $\[ A_0^(- 1) \, A_0 \]$.

#thm([Lemma 6.2.])[
  (Elementary energy bounds).  #emph[With the notation above,
#[#set math.equation(numbering: n => "(6.3)")
 $ sum_A pi \( A \) sum_(A' in cal(S) \( A \)) \( f_1 \( A \) - f_1 \( A' \) \)^2 & lt.eq 60 N^2 A_0^2 E \,\
sum_A pi \( A \) sum_(A' in cal(K) \( A \)) \( f_1 \( A \) - f_1 \( A' \) \)^2 & lt.eq 12 N A_0 E \,\
sum_(A \, B) pi \( A \) pi \( B \) sum_(C in cal(C) \( A \, B \)) #scale(x: 120%, y: 120%)[\(] F \( A \, B \) -
  F \( \( A \, B \)^C \) #scale(x: 120%, y: 120%)[\)]^2 & lt.eq 6 N E . $ <eq:safe-switch-energy>]

 Here $cal(C) \( A \, B \)$ denotes the discrepancy cycles, and $\( A \, B \)^C$ is the pair after swapping $C$.]
] <lem:elementary-pair-energy>

#proof[
  Every specified legal two-edge switch has proposal probability at least $1 \/ \( 30 N^2 \)$;
    its Metropolis acceptance is at least $A_0^(- 2)$ when safe.
    Every specified color change has proposal probability at least $1 \/ \( 6 N \)$ and acceptance at least
    $A_0^(- 1)$. These moves change only the $f_1$ summand of $F$,
    so summing the second-coordinate law and using the factor $1 \/ 2$ in the energy proves the first two bounds.
    There are at most $N$ discrepancy cycles. Each specified swap therefore has proposal probability at least
    $1 \/ \( 3 N \)$ and is accepted; this proves the third bound. ◻
]

=== 6.2 An exact identity on a cycle <an-exact-identity-on-a-cycle>

Fix a pair of demand matchings $\( I_1 \, I_2 \)$ and a simple discrepancy cycle $C$ of length at least four.
  All orientations and choices below are deterministic, using the orders fixed in 2.
  Let $R$ be the edges of $I_1$ outside $C$, and let $O_0 =
  I_1$ and $O_1$ be the matching obtained by toggling $C$ in $I_1$. Thus both orientations use $R$ outside $C$. Put

$ D_C = f_1 \( O_0 \) - f_1 \( O_1 \) . $

Apply 12 and fix the colors of its diagonals consistently.
  A cell’s four sides always mean the four odd arcs of the #emph[original whole cycle],
  not paths formed from earlier diagonals.

Use the through, interior, and closed patterns $T_J \, N_J \, C_J$ from 5, with the chosen chord colors.
  A side $J$ is #emph[through] in $O_epsilon$ if $T_J subset.eq O_epsilon$.
  Exactly one orientation $O_epsilon$ contains $T_J$; define

#[#set math.equation(numbering: n => "(6.4)")
 $ H_J = \( O_epsilon \\ T_J \) union C_J \, wide g_J = f_1 \( O_epsilon \) - f_1 \( H_J \) . $ <eq:canonical-gain>]

For a short side, the chord is its actual cycle edge, so $g_J = 0$.

The reason for using the original cycle on every cell side is already visible on a six-cycle
  $C = \( v_0 \, dots.h \, v_5 \, v_0 \)$. Take

$ O_0 = R union { v_0 v_1 \, v_2 v_3 \, v_4 v_5 } \, wide O_1 = R union { v_1 v_2 \, v_3 v_4 \, v_5 v_0 } \, $

and suppose the diagonal $e = v_0 v_3$ is admissible. In the two cells it represents the complementary arcs
  $J = \( v_3 \, v_4 \, v_5 \, v_0 \)$ and $macron(J) = \( v_0 \, v_1 \, v_2 \, v_3 \)$, respectively.
  Both conversions yield the same matching

$ H_J = H_(macron(J)) = H = R union { v_1 v_2 \, e \, v_4 v_5 } . $

Thus $g_(macron(J)) - g_J = f_1 \( O_0 \) - f_1 \( O_1 \) = D_C$;
  the shared diagonal contributes one whole-cycle difference, not zero. 3 displays this common converted matching.
  This example isolates the complementary-gain identity. Its cells have only one long side each,
  so the context errors introduced below vanish; cells with two opposite long sides require a further estimate.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0.9, 1.15), (2.6, 1.15), (3.5, 0), close: true, fill: rgb("#f5f5f5"), stroke: none)
  line((0, 0), (3.5, 0), (2.6, -1.15), (0.9, -1.15), close: true, fill: rgb("#ebebeb"), stroke: none)
  line((0, 0), (0.9, 1.15), (2.6, 1.15), (3.5, 0), (2.6, -1.15), (0.9, -1.15), close: true, stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (3.5, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.75, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$e$]])])
  content((1.75, 1.75), [$macron(J)$])
  content((1.75, -1.75), [$J$])
  line((6.2, 0), (7.1, 1.15), (8.8, 1.15), (9.7, 0), (8.8, -1.15), (7.1, -1.15), close: true, stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((7.1, 1.15), (8.8, 1.15), stroke: (paint: rgb("#000000"), thickness: 1.3pt, miter-limit: 10))
  line((6.2, 0), (9.7, 0), stroke: (paint: rgb("#000000"), thickness: 1.3pt, miter-limit: 10))
  content((7.95, 0.07056), [$e$], anchor: "south", padding: 0.1176cm)
  line((8.8, -1.15), (7.1, -1.15), stroke: (paint: rgb("#000000"), thickness: 1.3pt, miter-limit: 10))
  circle((0, 0), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0), [$v_0$], anchor: "east")
  circle((0.9, 1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((0.9, 1.185), [$v_1$], anchor: "south")
  circle((2.6, 1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((2.6, 1.185), [$v_2$], anchor: "south")
  circle((3.5, 0), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((3.535, 0), [$v_3$], anchor: "west")
  circle((2.6, -1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((2.6, -1.185), [$v_4$], anchor: "north")
  circle((0.9, -1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((0.9, -1.185), [$v_5$], anchor: "north")
  circle((6.2, 0), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((6.165, 0), [$v_0$], anchor: "east")
  circle((7.1, 1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((7.1, 1.185), [$v_1$], anchor: "south")
  circle((8.8, 1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((8.8, 1.185), [$v_2$], anchor: "south")
  circle((9.7, 0), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((9.735, 0), [$v_3$], anchor: "west")
  circle((8.8, -1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((8.8, -1.185), [$v_4$], anchor: "north")
  circle((7.1, -1.15), radius: 0.06486, fill: rgb("#000000"), stroke: none)
  content((7.1, -1.185), [$v_5$], anchor: "north")
  content((1.75, -2.35), [two cells, complementary arcs])
  content((7.95, -2.35), [common converted matching $H$])
})],
  caption: [Figure 3: An admissible diagonal $e = v_0 v_3$ cuts a six-cycle into two cells. In the upper cell its side follows the lower boundary arc $J$; in the lower cell its side follows the upper boundary arc $macron(J)$. The two occurrences use the same colored edge $e$. Converting the through pattern on either arc gives the restriction of $H$ shown on the right (the common outside matching $R$ is omitted), so their signed gains sum to $D_C$. The drawing concerns the signed identity, not a sequence of chain transitions. ],
) <fig:complementary-arcs>

In a cell, let $P$ be its opposite pair of sides through in $O_0$, and $Q$ its opposite pair through in $O_1$.
  Let $A_P$ use $N_J$ on every side and the chords of the two sides of $P$, together with $R$.
  Define $A_Q$ analogously and put

$ Delta = f_1 \( A_P \) - f_1 \( A_Q \) . $

These are legal perfect matchings: the interior vertices are matched by the $N_J$’s,
  and the two chosen chords match the four corners. Their difference is a safe two-edge switch by 13.

Order each opposite pair as $\( Y \, X \)$. For the orientation in which both are through,
  first convert $Y$ and then $X$. Write $A^(\( 0 \)) = O_epsilon$ and $A^(\( 1 \)) =
  H_Y$ for the two pre-conversion contexts of $X$. For a matching $R'$ on the vertices outside $X$, define

#[#set math.equation(numbering: n => "(6.5)")
 $ partial_X f \( R' \) = f \( T_X union R' \) - f \( C_X union R' \) . $ <eq:arc-derivative>]

The context error of the ordered opposite pair is

#[#set math.equation(numbering: n => "(6.6)")
 $ E_(Y \, X) = partial_X f_1 \( A^(\( 1 \)) \\ T_X \) - partial_X f_1 \( A^(\( 0 \)) \\ T_X \) . $ <eq:context-error>]

It is zero if either side is short. Denote these errors by $E_P \, E_Q$ for the two ordered pairs of the cell.

#thm([Lemma 6.3.])[
  (Cell identity and cancellation).  #emph[The quantities just defined satisfy
#[#set math.equation(numbering: n => "(6.7)")
 $ D_C = Delta + sum_(J in P) g_J - sum_(J in Q) g_J + E_P - E_Q $ <eq:single-cell-identity>]

 for each cell. Consequently,
#[#set math.equation(numbering: n => "(6.8)")
 $ D_C = sum_(upright("cells of ") C) \( Delta + E_P - E_Q \) . $ <eq:global-cell-identity>]

]
] <lem:cell-identity>

#proof[
  The first conversion in an opposite pair has its canonical gain.
    The second has its canonical gain plus the error in (6.6). Thus
  $ f_1 \( O_0 \) - f_1 \( A_P \) = sum_(J in P) g_J + E_P \, wide f_1 \( O_1 \) - f_1 \( A_Q \) =
    sum_(J in Q) g_J + E_Q . $
  Subtracting proves (6.7).
  Consider an interior diagonal with complementary arcs $J \, macron(J)$.
    They are through in opposite whole-cycle orientations, and their converted matchings coincide:
  $ H_J = H_(macron(J)) = R union N_J union N_(macron(J)) union { e_J } . $
  Therefore the two signed canonical gains contributed by this diagonal sum to $f_1 \( O_0 \) - f_1 \( O_1 \) =
    D_C$. The signs here are precisely those in (6.7): the arc through in $O_0$ has positive sign and the other
    negative sign. Boundary sides have zero gain. Summing (6.7) over the cells therefore gives one copy of $D_C$
    per cell on the left and one per interior diagonal on the right, in addition to the displayed local terms.
    The number of cells is one more than the number of diagonals, which proves (6.8). ◻
]

=== 6.3 Encoding the demands <encoding-the-demands>

A #emph[switch demand] specifies $\( I_1 \, I_2 \)$, a simple discrepancy cycle $C$,
  and one cell of its fixed quadrangulation. Its value is $Delta$ above.
  An #emph[error demand] specifies these data and one opposite pair with two long sides,
  in its fixed order $\( Y \, X \)$. Its value is $E_(Y \, X)$.
  The weight of either demand is $rho \( d \) = pi \( I_1 \) pi \( I_2 \)$.
  Repeated demands from different cells or different cycles are included separately in all sums.

#thm([Lemma 6.4.])[
  (Encodings with a bounded number of preimages).  #emph[Every switch demand has an encoding $\( A_P \, B \)$ by
    two perfect matchings, and every error demand has encodings $\( A^(\( j \)) \, B^(\( j \)) \)$ for $j = 0 \,
    1$, with the following properties.]
  + #emph[For each encoding $\( A \, B \)$, $rho \( d \) lt.eq A_0^4 pi \( A \) pi \( B \)$.]
  + #emph[For each encoding type and each fixed output pair, there are at most $cal(T)$ demand preimages.
    This bound includes the choices of cycle, cell, opposite pair, and context.]
  + #emph[For an error demand, both guide matchings satisfy $C_X subset.eq B^(\( j \))$.]
] <lem:encoding>

#proof[
  We first describe a repair operation. Start with the union of the four through patterns $T_J$ in a cell.
    Each corner is covered twice, once by each incident side. Select a good opposite pair of sides.
    For each selected short side delete its sole edge. For each selected long side delete its first and last
    edges, and insert its chosen leaf repair. Each corner loses exactly one incident edge.
    On a long selected side the only newly uncovered internal vertices are its two leaves,
    which the repair matches. Thus the resulting edges form a perfect matching of all cycle vertices.
    This verifies legality also for a side of length three: its two leaves are distinct and its repair is an
    ordinary colored edge between them.
  ===== 6.3.1 Switch demands. <switch-demands.>
  Use $A_P$ as the first output. In the second output retain the edges of $I_2$ outside $C$,
    start with all four through patterns, and apply the preceding repair operation to a good opposite pair,
    which exists by 12(i). Call the result $B$. Before these modifications,
    the original multiset union contains exactly one $T_J$ and one $N_J$ on each side.
    The output union adds the two $P$-chords and the leaf repairs and drops the selected boundary edges.
    If $r in { 0 \, 1 \, 2 }$ selected sides are long, the numbers added and dropped are both $2 + r lt.eq 4$.
  ===== 6.3.2 Error demands, context zero. <error-demands-context-zero.>
  The first output is $A^(\( 0 \)) = O_epsilon$, the canonical orientation in which $X \, Y$ are through.
    Start the second output with the complementary cycle orientation and the edges of $I_2$ outside $C$.
    It has the $N$ patterns on $X \, Y$. Insert their two chords.
    The other opposite pair is good by 12(ii), because $X \, Y$ are both long.
    On that other pair delete boundary edges and insert leaf repairs as above.
    The result is a perfect matching $B^(\( 0 \))$, containing both $C_X$ and $C_Y$.
    Again, the multiset union differs from the original by equally many added and dropped edges, at most four of each.
  ===== 6.3.3 Error demands, context one. <error-demands-context-one.>
  Interchange the patterns $T_Y$ and $C_Y$ between $A^(\( 0 \)) \, B^(\( 0 \))$.
    Each pattern perfectly matches the entire vertex set of $Y$,
    so the interchange is legal and gives $A^(\( 1 \)) = H_Y$ and a guide $B^(\( 1 \))$.
    The vertex sets of the opposite arcs $X \, Y$ are disjoint; hence $B^(\( 1 \))$ still contains $C_X$.
    This interchange does not change the multiset union or product weight.
  In every case all added and dropped edges are among the chords, boundary edges,
    and good-side leaf repairs of this one cell. They have pairwise activity ratio at most $A_0$ by 13.
    Since the two lists have equal length at most four, the input product weight is at most $A_0^4$ times the
    output product weight. Division by $Z_w^2$ proves (i).
  For completeness we give an inverse, including the information it needs.
    Attach a tag consisting of the four cell corners in cyclic order,
    lists of the added and dropped colored edges padded to length four each, one orientation bit,
    and fixed flags for the encoding type (switch, error context zero, or error context one), opposite pair,
    and order. An edge in these lists is an occurrence in the multiset union;
    coincident colored edges retain their multiplicities. Given the output pair and tag,
    remove the added occurrences and reinsert the dropped occurrences in its multiset union.
    This recovers the original colored union $I_1 union.plus I_2$.
    Its component containing the first tagged corner is the active simple cycle $C$.
    The orientation bit specifies which of the two alternating classes at that corner belongs to $I_1$,
    so alternation determines both original layers on all of $C$.
    Outside $C$, the output layers were unchanged; they recover $I_1 \, I_2$ there directly.
    The fixed quadrangulation can now be reconstructed. Its tagged corners identify the cell,
    and the flags identify the term and, if appropriate, its ordered pair.
    Thus this is an inverse on every tag produced by the construction.
  There are at most $2 N^2$ possible colored edges. Allowing a padding symbol, the tags have at most
  $ 128 N^4 \( 1 + 2 N^2 \)^8 lt.eq 128 dot.op 3^8 N^20 < \( 10 N \)^30 = cal(T) $
  possibilities for $N gt.eq 2$. Here the factor $128$ more than covers the orientation bit and the fixed flags;
    the lists themselves may be stored in the fixed colored-edge order.
    This proves (ii), and the constructions already proved (iii). ◻
]

The encodings provide two kinds of control. Their bounded preimage count converts a sum over demands to a sum over
  pairs of matchings. For context errors, the guide also contains a prescribed closed arc;
  this additional condition must survive that summation. We use the bounded preimage count for switches below,
  then retain the closed-arc condition when treating context errors in the next subsection.

We apply this lemma first to switches. For a fixed encoded pair $\( A \, B \)$ there are at most $cal(T)$ demands,
  and each has its associated destination $A_Q$ in $cal(S) \( A \)$. Therefore

#[#set math.equation(numbering: n => "(6.9)")
 $ sum_(d upright(" switch")) rho \( d \) Delta_d^2 & lt.eq
   A_0^4 cal(T) sum_(A \, B) pi \( A \) pi \( B \) sum_(A' in cal(S) \( A \)) \( f_1 \( A \) - f_1 \( A' \) \)^2\
 & lt.eq 60 N^2 A_0^6 cal(T) E . $ <eq:switch-demand-load>]

=== 6.4 Controlling context errors by cycle swaps <controlling-context-errors-by-cycle-swaps>

Here an identity $X$ means a directed, colored, simple odd path of length at least three together with a specified
  colored edge joining its endpoints. It determines $T_X \, C_X$ and (6.5). We may sum over all such identities:
  this is a finite proof device, and the algorithm does not enumerate them. Put

$ p_X = pi { B : C_X subset.eq B } . $

We omit identities with $p_X = 0$. Every identity arising from an error demand has $p_X > 0$,
  by the guide constructed in 17. For any first matching $A supset.eq T_X$ and either $j = 0 \, 1$,
  that lemma gives the following #emph[conditional demand-mass bound]:

#[#set math.equation(numbering: n => "(6.10)")
 $ sum_(d upright(" error") : X \( d \) = X\
A^(\( j \)) \( d \) = A) rho \( d \) lt.eq A_0^4 cal(T) thin pi \( A \) p_X . $ <eq:conditional-demand-mass>]

Indeed, for each guide $B supset.eq C_X$ there are at most $cal(T)$ preimages of $\( A \, B \)$;
  now sum its product weight over these guides. The factor $p_X$ is essential and will cancel the conditioning below.

The next comparison averages over precisely those guides counted by $p_X$.
  That conditional law can be concentrated on a very rare event.
  We therefore retain $p_X$ in the demand bound instead of estimating it from below.

For a fresh guide $B tilde.op pi$, define

$ mu_X = bb(E) #scale(x: 120%, y: 120%)[\[] partial_X f_2 \( B \\ C_X \) divides C_X subset.eq B
  #scale(x: 120%, y: 120%)[\]] . $

For an error demand, (6.6) and $\( a - b \)^2 lt.eq 2 \( a - c \)^2 + 2 \( b - c \)^2$ imply

$ E_d^2 lt.eq 2 sum_(j = 0)^1 #scale(x: 120%, y: 120%)[\(] partial_X f_1 \( A^(\( j \)) \\ T_X \) -
  mu_X #scale(x: 120%, y: 120%)[\)]^2 . $

Applying (6.10), and then Jensen’s inequality to the conditional expectation defining $mu_X$, gives

#[#set math.equation(numbering: n => "(6.11)")
 $ sum_(d upright(" error")) rho \( d \) E_d^2 & lt.eq 4 A_0^4 cal(T) sum_X sum_(A supset.eq T_X) pi \( A \) p_X
   #scale(x: 120%, y: 120%)[\(] partial_X f_1 \( A \\ T_X \) - mu_X #scale(x: 120%, y: 120%)[\)]^2\
 & lt.eq 4 A_0^4 cal(T) thin Sigma_(upright("swap")) \, $ <eq:error-demand-load>]

where

#[#set math.equation(numbering: n => "(6.12)")
 $ Sigma_(upright("swap")) = sum_X sum_(A supset.eq T_X\
B supset.eq C_X) pi \( A \) pi \( B \) #scale(x: 120%, y: 120%)[\(] partial_X f_1 \( A \\ T_X \) -
  partial_X f_2 \( B \\ C_X \) #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:swap-sum>]

In detail, for a fixed $X \, A$ Jensen bounds the squared difference from $mu_X$ by

$ 1 / p_X sum_(B supset.eq C_X) pi \( B \) #scale(x: 120%, y: 120%)[\(] partial_X f_1 \( A \\ T_X \) -
  partial_X f_2 \( B \\ C_X \) #scale(x: 120%, y: 120%)[\)]^2 . $

Multiplication by the $p_X$ in (6.10) removes this denominator exactly. No lower bound on $p_X$ is used.

#thm([Lemma 6.5.])[
  (Swap sum).  #emph[The sum in (6.12) satisfies $Sigma_(upright("swap")) lt.eq 12 N^2 E$.]
] <lem:swap-sum>

#proof[
  For a pair in (6.12), the matchings $T_X$ and $C_X$ cover exactly the same vertex set,
    and their union is one alternating cycle: the path $X$ together with its closing chord.
    Their edges are disjoint since $X$ is long and simple. Thus this is an entire discrepancy component of $A \,
    B$, not a portion of a larger one. Swapping it changes $F$ by exactly
  $ partial_X f_1 \( A \\ T_X \) - partial_X f_2 \( B \\ C_X \) . $
  For a fixed fresh pair $\( A \, B \)$ and one of its discrepancy cycles,
    an identity $X$ is determined by marking the closing chord in the second matching and choosing a direction
    around that cycle. The remaining colored path is then read from the pair.
    There are at most $2 N$ such choices. Consequently
  $ Sigma_(upright("swap")) lt.eq 2 N sum_(A \, B) pi \( A \) pi \( B \) sum_(C in cal(C) \( A \, B \))
    #scale(x: 120%, y: 120%)[\(] F \( A \, B \) - F \( \( A \, B \)^C \) #scale(x: 120%, y: 120%)[\)]^2 lt.eq 12 N^2 E $
  by (6.3). ◻
]

=== 6.5 Completion of the energy proof <completion-of-the-energy-proof>

#proof[
  Take independent $I_1 \, I_2$ with law $pi$. Toggle their discrepancy cycles in the order of their least
    vertices, converting $I_1$ to $I_2$. Cauchy–Schwarz over the at most $N$ cycles gives
  $ \( f_1 \( I_1 \) - f_1 \( I_2 \) \)^2 lt.eq
    N sum_C \( upright("the ") f_1 upright(" difference at the step for ") C \)^2 . $
  For each selected $C$, toggle all earlier cycles in #emph[both] demand matchings.
    This preserves their product weight, their union, and the selected cycle.
    It is its own inverse, since the union fixes the same cycle order.
    The term at that step becomes $D_C^2$ for the new demand pair, with the definition used above.
    Since $"Var"_pi f_1 = 1 / 2 bb(E) \( f_1 \( I_1 \) - f_1 \( I_2 \) \)^2$,
    we obtain the convenient slightly weaker bound
  #[#set math.equation(numbering: n => "(6.13)")
   $ "Var"_pi f_1 lt.eq N sum_(I_1 \, I_2) pi \( I_1 \) pi \( I_2 \) sum_(C in cal(C) \( I_1 \, I_2 \)) D_C^2 .
     $ <eq:cycle-demand-variance>]
  A length-two discrepancy cycle is a color change in $I_1$.
    For a fixed $I_1$ and specified change, summing the mass of $I_2$ that supplies the other color costs at most
    one. Its total contribution to the sum in (6.13) is therefore at most $12 N A_0 E$, by (6.3).
  For a simple cycle, there are fewer than $N$ cells, so (6.8) and Cauchy–Schwarz give
  $ D_C^2 lt.eq 3 N sum_(upright("cells")) \( Delta^2 + E_P^2 + E_Q^2 \) . $
  Sum over all such cycle demands. The errors with a short side vanish;
    all others are precisely the error demands already bounded.
    Equations (6.9), (6.11), and 18 bound the simple-cycle contribution by
  $ 3 N #scale(x: 120%, y: 120%)[\(] 60 N^2 A_0^6 cal(T) + 48 N^2 A_0^4 cal(T) #scale(x: 120%, y: 120%)[\)] E . $
  Combining the two cycle types in (6.13) and using $A_0 \, cal(T) gt.eq 1$ yields
  $ "Var"_pi f_1 lt.eq #scale(x: 120%, y: 120%)[\(] 12 N^2 A_0 +
    324 N^4 A_0^6 cal(T) #scale(x: 120%, y: 120%)[\)] E lt.eq 1000 N^4 A_0^6 cal(T) E . $
  Finally
  $ 1000 N^4 A_0^6 cal(T) = 10^51 N^34 D^6 lt.eq \( 10^4 N D \)^100 = L . $
  All comparisons used only 13 and the adjacent-label comparison for color changes.
    Both hold under any common clamp, proving the final assertion as well. ◻
]

== 7 A sampler from replicated adjacent tiers <sec:ladder>

The two-coordinate inequality controls an additive function of a pair;
  it is not a Poincaré inequality for all functions of that pair.
  We now turn it into a Poincaré inequality on a larger product space.
  The construction uses adjacent weight tiers, with many independent copies at each tier.
  Orthogonality of product projections controls the terms involving both members of a pair.
  The slot order ensures that no orthogonal interaction component occurs in two different pair residuals.
  Averaging over many guides then makes their total contribution small enough to absorb.
  Using several adjacent distributions in one product chain has antecedents in replica Monte Carlo [17,20].
  Here the coordinates are colored perfect matchings, the pair moves exchange alternating cycles,
  and the effect of replication is quantified by the proof below.

Throughout this section, the tree-bag graph has $N gt.eq 2$ vertices, $b_(upright("tree"))$ labels,
  maximum level at most $2 K$, and the integer parameter $D$ of 2, where $K$ is a nonnegative integer.
  Its reference activities are positive rationals. Let $cal(M)$ denote its common,
  nonempty set of colored perfect matchings. By (2.3),

#[#set math.equation(numbering: n => "(7.1)")
 $ D^(- 1) lt.eq W_e lt.eq 3 dot.op 4^K . $ <eq:ladder-global-range>]

=== 7.1 An exact refresh at unit activities <an-exact-refresh-at-unit-activities>

#thm([Lemma 7.1.])[
  #emph[The unit-activity partition function is computable by a dynamic program on the label tree.
    With exact rational categorical choices, its tables also produce an exact sample.
    The tables can be computed with $O \( \( b_(upright("tree")) + 1 \) \( N + 1 \)^3 \)$ arithmetic operations on
    counts of $O \( N log \( N + 1 \) \)$ bits. Label and loop indices use
    $O \( log \( b_(upright("tree")) + 1 \) + log \( N + 1 \) \)$ additional bits.
    Once the tables are available, a sample uses polynomially many integer operations and at most
    $4 \( b_(upright("tree")) + N + 1 \)$ rational categorical choices, each with at most $N + 1$ outcomes.
    A positive table also yields a matching by entirely deterministic backtracking.]
] <lem:base-refresh>

#proof[
  A colored matching assigns each vertex to the color of its matched edge.
    Conversely, assign each vertex to one of its one or two bags, and pair the vertices assigned to each bag.
    These two operations are inverse. Thus, if $a_l$ vertices are assigned to bag $l$,
    the number of matchings for that assignment is $product_l J \( a_l \)$, where
  $ J \( 0 \) = 1 \, wide J \( a \) = \( a - 1 \) ! ! quad upright("for even ") a > 0 \, wide J \( a \) = 0 quad
    upright("for odd ") a . $
  The values of $J$ count pairings of a complete graph.
  For a nonroot bag $C$, write $S_C$ for its interface with its parent, and put $s_C = \| S_C \|$;
    for the root use $S_C = diameter$. Let $u_C$ be the number of vertices belonging to $C$ alone.
    All interfaces incident to a bag are disjoint. For a fixed subset of $k$ vertices of $S_C$ assigned to $C$,
    let $F_C \( k \)$ count the assignments and pairings within the subtree of $C$;
    the other vertices of $S_C$ are assigned to its parent. The answer depends only on $k$:
    vertices of $S_C$ belong to no bag other than $C$ and its parent,
    and they are interchangeable in the complete clique of color $C$.
  If $C_1 \, dots.h \, C_d$ are the children of $C$, set $s_i = s_(C_i)$.
    Choosing $ell_i$ vertices of the $i$th interface to be assigned downward gives the recurrence
  #[#set math.equation(numbering: n => "(7.2)")
   $ F_C \( k \) = sum_(ell_1 = 0)^(s_1) dots.h.c sum_(ell_d = 0)^(s_d) J #h(-0.16667em)
     (u_C + k + sum_(i = 1)^d \( s_i - ell_i \)) product_(i = 1)^d binom(s_i, ell_i) F_(C_i) \( ell_i \) .
     $ <eq:base-dp>]
  The required partition function is $F_(upright("root")) \( 0 \)$.
    There is no exponential enumeration in evaluating this recurrence. Form the polynomial
  $ H_C \( z \) = product_(i = 1)^d (sum_(ell = 0)^(s_i) binom(s_i, ell) F_(C_i) \( ell \) z^(s_i - ell)) . $
  Its degree is at most $N$, and
  $ F_C \( k \) = sum_(a = 0)^N \[ z^a \] H_C \( z \) thin J \( u_C + k + a \) \, $
  with impossible indices contributing zero. Naive convolutions suffice for the asserted arithmetic bound.
    The intermediate counts enumerate assignments and partial pairings on at most $N$ vertices.
    There are at most $2^N$ assignments, and for any one assignment at most $N !$ such pairings,
    so $2^N N !$ bounds these counts. This gives the bit bound.
  For sampling, begin at the root with $k = 0$. At a visited bag,
    choose $a$ with probability proportional to $\[ z^a \] H_C \( z \) J \( u_C + k + a \)$.
    Backtrack the stored convolutions to choose the individual $ell_i$,
    then choose uniformly the corresponding interface subsets.
    Recurse on each child with its chosen subset, and independently choose a uniform pairing of the vertices
    assigned to the current bag. Every choice is proportional to its number of completions in (7.2);
    induction on the subtree therefore gives the uniform law on colored matchings.
    A uniform subset is generated by sequential inclusion choices,
    and a uniform pairing by repeatedly pairing the least remaining vertex with a uniformly chosen other vertex.
    The total number of interface vertices is at most $N$, since a shared vertex belongs to exactly one interface.
    There are at most $N \/ 2$ partner choices, $b_(upright("tree"))$ total-size choices,
    and $b_(upright("tree")) - 1$ convolution choices. This proves the stated draw bound.
    Choosing any positive-count branch instead yields a deterministic matching. ◻
]

=== 7.2 The product chain <the-product-chain>

Set

#[#set math.equation(numbering: n => "(7.3)")
 $ c = 1 + N^(- 2) \, wide T = min { t in bb(Z)_(gt.eq 0) : c^t gt.eq max \( D \, 3 dot.op 4^K \) } \, wide q =
   32 L \, $ <eq:ladder-parameters>]

where $L = \( 10^4 N D \)^100$ is the integer in 14. At tier $t in { 0 \, dots.h \, T }$,
  clamp every reference activity to $\[ c^(- t) \, c^t \]$ and denote the matching law by $pi_t$.
  Thus $pi_0$ is the uniform colored matching law and $pi_T$ is the desired law. Moreover,

#[#set math.equation(numbering: n => "(7.4)")
 $ 1 / 2 lt.eq frac(pi_(t - 1) \( A \), pi_t \( A \)) lt.eq
   2 wide \( A in cal(M) \, med 1 lt.eq t lt.eq T \) . $ <eq:adjacent-density>]

Indeed, an individual activity changes by a factor in $\[ c^(- 1) \, c \]$,
  so unnormalized matching weights and partition functions each change by factors in
  $\[ c^(- N \/ 2) \, c^(N \/ 2) \]$. The probability ratio is therefore in $\[ c^(- N) \, c^N \]$, and $c^N lt.eq
  exp \( 1 \/ N \) < 2$. Also $log \( 1 + N^(- 2) \) gt.eq \( 2 N^2 \)^(- 1)$, whence

#[#set math.equation(numbering: n => "(7.5)")
 $ T lt.eq 1 + 2 N^2 log max \( D \, 3 dot.op 4^K \) = O #scale(x: 120%, y: 120%)[\(] N^2 \( K + log D + 1 \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:ladder-tier-bound>]

Here and below, unbased logarithms are natural.

Use $q$ slots at each tier, with product stationary law

$ nu = ⨂_(t = 0)^T pi_t^(⊗ q) . $

An allowed pair $\( x \, y \)$ consists of a slot $x$ at tier $t gt.eq 1$ and any slot $y$ at tier $t - 1$.
  On this pair use exactly the symmetric proposal of 14, with local proposals acting on $x$,
  and accept by Metropolis for $pi_t ⊗ pi_(t - 1)$. Across unequal tiers a cycle swap uses this Metropolis
  acceptance ratio as well; the acceptance-one observation for two identical laws in 6 no longer applies.
  For each base slot there is instead the update that refreshes it from $pi_0$, using 19. There are

#[#set math.equation(numbering: n => "(7.6)")
 $ M = T q^2 + q $ <eq:ladder-update-count>]

updates. The chain $P$ holds with probability $1 \/ 2$; otherwise it chooses one of these $M$ updates uniformly.
  Every update preserves $nu$ and is reversible, so the same is true of $P$.

Write $cal(E)_(x y)$ for the energy of one allowed pair update,
  with all other coordinates integrated against $nu$, and $cal(E)_i$ for the energy of a refresh of base slot $i$.
  In this notation

#[#set math.equation(numbering: n => "(7.7)")
 $ cal(E)_(nu \, P) \( f \) =
   frac(1, 2 M) (sum_(x y) cal(E)_(x y) \( f \) + sum_(i upright(" base")) cal(E)_i \( f \)) .
   $ <eq:ladder-scan-energy>]

For later use, the two-coordinate inequality also applies across adjacent tiers.
  The pair state space and symmetric proposal are identical for the targets $pi_t ⊗ pi_t$ and $pi_t ⊗ pi_(t - 1)$.
  By (7.4), the latter target density is at least half the former at every pair state.
  The Metropolis capacity formula (2.5) thus shows that the unequal-tier energy dominates half the equal-tier
  energy. Consequently, for any functions $a$ and $b$ of the two slots,

#[#set math.equation(numbering: n => "(7.8)")
 $ "Var"_(pi_t) a lt.eq 2 L thin cal(E)_(x y) #scale(x: 120%, y: 120%)[\(] a \( x \) +
   b \( y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:unequal-pair-energy>]

In this display the energy is on the two slots alone; it can also be applied conditionally on any fixed values of
  other slots.

#thm([Lemma 7.2.])[
  #emph[The lazy product chain has spectral gap at least $3 \/ \( 8 M \)$, and hence at least $1 \/ \( 20 L M \)$.
    The dependence on $L$ in the stronger bound is carried by $q = 32 L$, and hence by $M$.]
] <lem:replica-gap>

#proof[
  Order the slots from highest tier to lowest, resolving ties arbitrarily.
    Thus every allowed guide $y$ follows its upper slot $x$. For each slot $x$,
    let $U_x$ be the set of its predecessors and put
  $ h_x = bb(E) \[ f divides U_x \, x \] - bb(E) \[ f divides U_x \] . $
  These are the orthogonal martingale increments, so
  #[#set math.equation(numbering: n => "(7.9)")
   $ "Var"_nu f = sum_x parallel h_x parallel_(L^2 \( nu \))^2 . $ <eq:ladder-martingale>]
  Fix an allowed pair $\( x \, y \)$, abbreviate $U = U_x$, and define
  $ k_(x y) = bb(E) \[ f divides U \, y \] - bb(E) \[ f divides U \] \, wide g_(x y) =
    bb(E) \[ f divides U \, x \, y \] \, $
  #[#set math.equation(numbering: n => "(7.10)")
   $ r_(x y) = g_(x y) - bb(E) \[ f divides U \] - h_x - k_(x y) . $ <eq:ladder-residual>]
  For fixed $U$, $h_x$ is centered over $x$ and $k_(x y)$ over $y$. Applying (7.8) and then averaging over $U$ gives
  $ parallel h_x parallel_2^2 lt.eq 2 L cal(E)_(x y) \( h_x + k_(x y) \) . $
  Conditional expectation onto $U \, x \, y$ decreases $cal(E)_(x y)$:
    the pair kernel is independent of all the other coordinates,
    and Jensen’s inequality applies to each difference across a transition.
    For any stationary Markov kernel, (2.4) and $\( a - b \)^2 lt.eq 2 a^2 + 2 b^2$ give $cal(E) \( v \) lt.eq
    2 parallel v parallel_2^2$. Using (7.10), and observing that functions of $U$ have zero pair energy,
    we conclude that
  #[#set math.equation(numbering: n => "(7.11)")
   $ parallel h_x parallel_2^2 & lt.eq 2 L #scale(x: 120%, y: 120%)[\(] 2 cal(E)_(x y) \( g_(x y) \) +
     2 cal(E)_(x y) \( r_(x y) \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 4 L cal(E)_(x y) \( f \) + 8 L parallel r_(x y) parallel_2^2 . $ <eq:ladder-one-pair>]
  We now have an estimate for one upper slot and one guide, but it contains a residual involving both slots.
    Replication helps only if these residual terms can be charged collectively.
    The ordering of slots makes that collective estimate possible.
  The key point is that the residuals in this bound are orthogonal #emph[over all allowed pairs].
    To verify it explicitly, use the orthogonal product (ANOVA) decomposition of Efron and Stein [6] Section 2,
    written here as
  $ f = sum_S f_S \, wide f_S = sum_(A subset.eq S) \( - 1 \)^(\| S \| - \| A \|) bb(E) \[ f divides A \] \, $
  where $S$ ranges over subsets of the slot set. Each $f_S$ depends only on the coordinates in $S$ and is centered
    in each coordinate of $S$. Therefore distinct $f_S$ are orthogonal, and $bb(E) \[ f divides A \] =
    sum_(S subset.eq A) f_S$. Substitution into (7.10) gives
  #[#set math.equation(numbering: n => "(7.12)")
   $ r_(x y) = sum_(S subset.eq U_x union { x \, y }\
x \, y in S) f_S . $ <eq:ladder-anova>]
  Every set $S$ in this sum has $y$ last and $x$ penultimate in the fixed slot order:
    all its other coordinates lie in $U_x$. These two positions determine the allowed pair uniquely.
    Thus even pairs that share a slot use disjoint sets of orthogonal components.
    Since every component here is nonconstant,
  #[#set math.equation(numbering: n => "(7.13)")
   $ sum_(x y) parallel r_(x y) parallel_2^2 lt.eq "Var"_nu f . $ <eq:ladder-residual-sum>]
  This decomposition is only an identity in the proof; the algorithm does not compute it.
  For a base slot $i$, conditional expectation onto $U_i \, i$ similarly decreases its refresh energy.
    The refresh energy of $h_i$ equals $parallel h_i parallel_2^2$,
    because $h_i$ is centered over $i$ given $U_i$. Hence $parallel h_i parallel_2^2 lt.eq cal(E)_i \( f \)$.
    Average (7.11) over the $q$ guides of each nonbase slot and sum over slots. (7.9), (7.13) yield
  $ "Var"_nu f lt.eq frac(4 L, q) sum_(x y) cal(E)_(x y) \( f \) + frac(8 L, q) "Var"_nu f +
    sum_(i upright(" base")) cal(E)_i \( f \) . $
  Since $q = 32 L$, absorption gives
  $ "Var"_nu f lt.eq 1 / 6 sum_(x y) cal(E)_(x y) \( f \) + 4 / 3 sum_(i upright(" base")) cal(E)_i \( f \) lt.eq
    frac(8 M, 3) cal(E)_(nu \, P) \( f \) . $
  This proves the first gap bound. The second follows from $L gt.eq 1$. ◻
]

=== 7.3 A quantitative sampling guarantee <a-quantitative-sampling-guarantee>

#thm([Theorem 7.3.])[
  #emph[Define $T \, q \, M$ by (7.3), (7.6), and put
#[#set math.equation(numbering: n => "(7.14)")
 $ Lambda & = 10 N q \( T + 1 \) #scale(x: 120%, y: 120%)[\(] K + ceil.l log_2 \( N D + 2 \) ceil.r +
   1 #scale(x: 120%, y: 120%)[\)] \,\
s \( xi \) & = ⌈20 L M #scale(x: 120%, y: 120%)[\(] Lambda + ceil.l log_2 \( 1 \/ xi \) ceil.r +
  1 #scale(x: 120%, y: 120%)[\)]⌉ wide \( 0 < xi < 1 \) . $ <eq:ladder-lambda>]

 Initialize all slots to any one colored perfect matching and run the exact chain for $s \( xi \)$ steps.
   The resulting product law is at total variation distance at most $xi$ from $nu$.
   In particular, any top-tier slot has law within $xi$ of the desired weighted matching law.]
  #emph[All tables, state representations, and transition probabilities are computable by rational arithmetic.
    Their sizes, arithmetic operation counts, and rational bit lengths are polynomial in $N \, D \, K$,
    $b_(upright("tree"))$, $log \( 1 \/ xi \)$, and the bit lengths of the reference activities.
    Exact rational choices here define an ideal process; the bounded-bit implementation in 9 adds at most $xi$ to
    the total variation error.]
] <thm:bag-sampler>

#proof[
  Every colored matching consists of $N \/ 2$ vertex pairs, each with at most two color choices.
    In particular, $\| cal(M) \| lt.eq \( 2 N^2 \)^N$. At every tier, all activities remain in the interval (7.1).
    For any $A in cal(M)$ this gives
  $ pi_t \( A \) gt.eq frac(1, \( 2 N^2 \)^N \( 3 D 4^K \)^(N \/ 2)) . $
  Taking the product over $q \( T + 1 \)$ slots and using $N gt.eq 2 \, D gt.eq 1$ shows that
  #[#set math.equation(numbering: n => "(7.15)")
   $ log frac(1, min nu) lt.eq Lambda . $ <eq:ladder-minimum-mass>]
  For example, with $a = ceil.l log_2 \( N D + 2 \) ceil.r$,
    the logarithm of the denominator in the preceding display is at most $N \( K + 5 / 2 a + 2 \)$,
    which is at most $10 N \( K + a + 1 \)$.
  For completeness, the finite-state spectral argument gives a direct mixing bound.
    Reversibility makes $P$ self-adjoint on $L^2 \( nu \)$. Its laziness makes its eigenvalues nonnegative,
    and 20 bounds every eigenvalue on the centered subspace above by $1 - gamma$, where $gamma =
    1 \/ \( 20 L M \)$. Starting from a point $z$, the centered initial density has squared norm $1 \/
    nu \( z \) - 1$. By diagonalization, reversibility, and (7.15),
  $ parallel P^s \( z \, dot.op \) - nu parallel_("TV") lt.eq 1 /
    2 \( 1 - gamma \)^s sqrt(frac(1, nu \( z \)) - 1) lt.eq 1 / 2 exp \( - gamma s + Lambda \/ 2 \) . $
  Substitution of (7.14) makes this at most $xi$. Projection onto a chosen top-tier coordinate cannot increase
    total variation.
  It remains to specify the computation represented by this chain.
    The unit-activity tables are supplied by 19; a positive table supplies an initial matching if one has not
    already been constructed. There are at most $N^2$ colored edges and $q \( T + 1 \)$ matching coordinates.
    Precompute the clamped activities at every tier using rational powers of $c$.
    The tier bound (7.5) is polynomial in the stated parameters, and these powers have polynomial bit length.
    A scan choice can be made by an integer in ${ 1 \, dots.h \, M }$,
    decoding either a base slot or an upper tier and two slot indices.
    A pair proposal is implemented by inspecting two matchings:
    the alternating components can be listed by following the union of their edges,
    and the local switch and color proposals require only finite lists of edges and at most two color choices per
    new edge. Metropolis acceptance uses a ratio of products of at most $2 N$ activities;
    the unknown partition functions cancel. A refresh uses the precomputed integer tables.
    Thus a step has polynomial arithmetic cost and rational probabilities of polynomial bit length.
    The bound $s \( xi \)$ is itself polynomial in the displayed parameters,
    which proves the assertion about the ideal computation.
  For the finite-bit assertion in this generality, including arbitrarily many empty bags, use the draw and option bounds
  $ R_(upright("draw"))^(upright("gen")) = 100 \( s \( xi \) + 1 \) \( b_(upright("tree")) + N + 1 \) \, wide
    R_(upright("opt")) = 10 \( M + N^2 + 1 \) . $
  Indeed a refresh uses at most $4 \( b_(upright("tree")) + N + 1 \)$ categorical choices,
    and laziness and the scan use two more. A pair step uses at most eight choices.
    A final revelation of edge types, when present, uses at most $N$ further choices.
    These fit the displayed draw bound. Every choice has at most $R_(upright("opt"))$ options.
    Take a fixed integer $k$ with $2^k gt.eq 2 R_(upright("draw"))^(upright("gen")) R_(upright("opt")) \/ xi$.
    24 and successive coupling then bound the cumulative simulation discrepancy by $xi$.
    This precision and the resulting bit cost are polynomial in the stated parameters,
    including $b_(upright("tree"))$. For the hierarchy constructed in 4,
    the smaller specialized bookkeeping in 9 follows from $b_(upright("tree")) lt.eq N \( 2 K + 1 \)$. ◻
]

== 8 From samples to the number of perfect matchings <sec:counting>

We now give the counting algorithm. Its sampling calls use only the tree-bag sampler proved above.
  In particular, neither balancing nor estimating a partition ratio requires an additional oracle.
  Positive completion, gradual suppression of nonedges, and estimation of successive partition ratios follow the
  annealing framework used for the permanent [11]. The marked observables and vertex-scale update below supply the
  general-graph implementation and its balance guarantees.

=== 8.1 The schedule and vertex scales <the-schedule-and-vertex-scales>

If $n = \| V \| = 0$, return one. If a binary vertex count is used and $n > 2 \| E \|$, return zero:
  the listed edges cannot cover all vertices. On the remaining nonempty input,
  perform a deterministic perfect-matching existence test and return zero if it fails.
  Thus the remaining case has even $n gt.eq 2$ and $Z \( G \) gt.eq 1$. Set

#[#set math.equation(numbering: n => "(8.1)")
 $ b = 1 + 1 / n \, wide K = min {k in bb(N) : k gt.eq 1 \, quad n^(n \/ 2) b^(- k) lt.eq epsilon /
   32} . $ <eq:schedule>]

Since $log \( 1 + 1 \/ n \) gt.eq 1 \/ \( 2 n \)$,

#[#set math.equation(numbering: n => "(8.2)")
 $ K lt.eq 1 + 2 n (n / 2 log n + log \( 32 \/ epsilon \)) . $ <eq:schedule-length>]

At stage $j in { 0 \, dots.h \, K }$ the complete logical graph has raw activities

$ w_(u v)^(\( j \)) = cases(delim: "{", 1 \, & u v in E \,, b^(- j) \, & u v in.not E .) $

Write $Z_j$ for its perfect-matching partition function. Then

#[#set math.equation(numbering: n => "(8.3)")
 $ Z_0 = \( n - 1 \) ! ! \, wide Z_K = \( n - 1 \) ! ! product_(j = 0)^(K - 1) Z_(j + 1) / Z_j . $ <eq:raw-telescoping>]

For sampling, we additionally maintain positive vertex scales $s_i$ and use activities $lambda_(i j) =
  w_(i j)^(\( j \)) s_i s_j$. Every perfect matching has the same vertex factor $product_i s_i$. Consequently

#[#set math.equation(numbering: n => "(8.4)")
 $ Z_lambda = Z_j product_i s_i \, wide g_lambda \( i j \) =
   frac(g_(w^(\( j \))) \( i j \), s_i s_j) . $ <eq:scaling-identities>]

Initialize $s_i = 1 \/ ⌊sqrt(n - 1)⌋$. At stage zero,

$ g_lambda \( i j \) = frac(⌊sqrt(n - 1)⌋^2, n - 1) in \[ 1 \/ 4 \, 1 \] \, $

so the logical graph is balanced. The update defined below always multiplies each scale by a positive number at
  most two, whether or not the estimates succeed. Starting from scales at most one and making at most $K$ updates,
  we therefore have at every sampling call

#[#set math.equation(numbering: n => "(8.5)")
 $ 0 < lambda_(i j) lt.eq 4^K . $ <eq:unconditional-height-bound>]

We use the same structural parameters throughout a trial:

#[#set math.equation(numbering: n => "(8.6)")
 $ D_0 = 10^8 \( n + 1 \)^4 \, wide p = 2 K + 2 \, wide N = n + 4 p binom(n, 2) \, wide D =
   100 N^2 D_0 . $ <eq:counting-structural-parameters>]

For each current $lambda$, construct the enlarged graph and marked bag edges of 4.

=== 8.2 Observables from one marked sample <observables-from-one-marked-sample>

Let $lambda^(+)$ denote the activities at the next raw stage, with the #emph[current] vertex scales retained.
  If $P$ is a logical perfect matching, or a logical matching missing one specified pair of vertices, put

$ u \( P \) = b^(- \# { e in P : e in.not E }) . $

Thus $"wt"_(lambda^(+)) \( P \) = u \( P \) "wt"_lambda \( P \)$ and

#[#set math.equation(numbering: n => "(8.7)")
 $ 1 / 2 < b^(- n \/ 2) lt.eq u \( P \) lt.eq 1 . $ <eq:bounded-reweighting>]

The strict left inequality follows from $\( 1 + 1 \/ n \)^(n \/ 2) < upright(e)^(1 \/ 2) < 2$.

Sample a colored perfect matching from the bag graph and reveal the real, virtual,
  and probe portions of its edges. Define the following observables, all in $\[ 0 \, 1 \]$:

$ a & = upright(bold(1))_({ upright("all edges real") }) \,\
d & = upright(bold(1))_({ upright("all edges real") }) u \( P \) \,\
z_(i j) & = upright(bold(1))_({ upright("probe ") i j upright(" and all other edges real") }) u \( P \) . $

Here $P$ is decoded only on the indicated event; elsewhere the observable is zero.
  On the all-real event it is a full logical perfect matching.
  On the sole-probe event it is a logical perfect matching missing $i \, j$.
  Write $I = Z_(upright("bag")) \/ Z'$ for the inflation factor. Under the exact marked bag law, the means satisfy

#[#set math.equation(numbering: n => "(8.8)")
 $ bb(E) a = 1 / I \, wide bb(E) d = frac(Z_(lambda^(+)), I Z_lambda) \, wide bb(E) z_(i j) =
   frac(Z_(lambda^(+)) \( - i j \), D I Z_lambda) . $ <eq:observable-means>]

The all-real probability in 7 gives the first equality. The other two follow by multiplying the weights in that
  event, or in the sole-probe identity (4.4), by $u \( P \)$ and summing. In particular,

#[#set math.equation(numbering: n => "(8.9)")
 $ R := Z_(j + 1) / Z_j = Z_(lambda^(+)) / Z_lambda = frac(bb(E) d, bb(E) a) \, wide g_(lambda^(+)) \( i j \) =
   D frac(bb(E) z_(i j), bb(E) d) . $ <eq:observable-ratios>]

Thus one batch of marked samples will estimate both the next raw partition ratio and the two-hole ratios needed to
  choose the next vertex scales.

=== 8.3 Estimating and restoring balance <estimating-and-restoring-balance>

Use

#[#set math.equation(numbering: n => "(8.10)")
 $ alpha = 10^(- 5) \, wide sigma = min {frac(alpha, 100 D) \, frac(epsilon, 1000 K)} \, wide
   S = ⌈10 sigma^(- 2) \( n + K + 1 \)⌉ \, wide xi = frac(1, 1000 K S) . $ <eq:statistical-parameters>]

At each stage make $S$ independent fresh sampler runs, each with marked output law at total variation distance at
  most $3 xi$ from the exact marked bag law. 9 implements these runs in bounded bit time.
  Let bars denote the empirical means of the observables. Set

#[#set math.equation(numbering: n => "(8.11)")
 $ hat(R) = cases(delim: "{", macron(d) \/ macron(a) \, & macron(a) > 0 \,, 1 \, & macron(a) = 0 .)
   $ <eq:ratio-estimate>]

If $macron(d) > 0$, form the symmetric array

#[#set math.equation(numbering: n => "(8.12)")
 $ G_(i j) = max {alpha \, min {3 \, D macron(z)_(i j) / macron(d) +
   alpha}} quad \( i eq.not j \) . $ <eq:upper-estimate>]

If $macron(d) = 0$, set all $G_(i j) = 1$. The following elementary balancing procedure will be useful.

#thm([Lemma 8.1.])[
  #emph[Suppose $G$ is symmetric and $alpha lt.eq G_(i j) lt.eq 3$ for $i eq.not j$.
    Initialize $v_i = 2$ for every vertex and visit the vertices in their fixed order, setting
#[#set math.equation(numbering: n => "(8.13)")
 $ v_i arrow.l max_(j eq.not i) G_(i j) / v_j . $ <eq:scale-update>]

 Every coordinate only decreases, all final coordinates lie in $\[ alpha \/ 2 \, 2 \]$,
   and the final vector satisfies $v_i v_j gt.eq G_(i j)$ with an equality in every row.]
] <lem:one-pass-scaling>

#proof[
  Initially all products equal four and hence dominate $G$.
    At an update, feasibility shows that the new value is at most the old value.
    The definition restores all constraints involving $i$ and leaves all other constraints unchanged.
    Since every other coordinate is at most two, the new value is at least $alpha \/ 2$.
    At least one constraint involving $i$ is tight. If its neighbor is visited later,
    that neighbor cannot decrease without violating this tight constraint. Thus the equality persists to the end. ◻
]

After estimating the current ratio, perform this procedure and replace $s_i$ by $s_i v_i$.
  These scales are used with the next raw stage.

===== 8.3.1 Algorithm outline. <algorithm-outline.>

After the zero test, one trial uses the parameters in (8.1), (8.6), (8.10) and the initial scales above.
  For $j = 0 \, dots.h \, K - 1$:

+ Form $lambda_(u v) = w_(u v)^(\( j \)) s_u s_v$ and its marked bag graph.
+ Obtain $S$ independent fresh marked samples using the bounded-bit implementation of 21.
  Compute the empirical means, then $hat(R)_j$ and $G$ by (8.11), (8.12), including their zero-denominator conventions.
+ Run the one-pass update (8.13) on $G$, replace $s_i$ by $s_i v_i$, and advance to the next raw stage.

The trial returns $Y = \( n - 1 \) ! ! product_(j = 0)^(K - 1) hat(R)_j$;
  the final algorithm takes the median of independent trials as specified below.
  The current scales are held fixed during each ratio estimate, so their common factors cancel.
  Every empirical history executes these same steps with the unconditional caps above.
  Balance is used only to prove the accuracy of histories whose estimates succeed.

#thm([Lemma 8.2.])[
  #emph[Suppose the current logical activities are balanced and every empirical mean is within $sigma$ of its
    exact mean. Then the next scaled activities are balanced and
#[#set math.equation(numbering: n => "(8.14)")
 $ lr(|hat(R) / R - 1|) lt.eq 10 sigma lt.eq frac(epsilon, 100 K) . $ <eq:stage-relative-error>]

]
] <lem:successful-stage>

#proof[
  By 8 and (8.7),
  $ bb(E) a gt.eq 1 / 2 \, wide bb(E) d gt.eq 1 / 4 \, wide 1 / 2 lt.eq R lt.eq 1 . $
  Reweighting both a full matching and a matching with two holes by factors in $\[ 1 \/ 2 \, 1 \]$ gives
  $ 1 / 2 g_lambda \( i j \) lt.eq g_(lambda^(+)) \( i j \) lt.eq 2 g_lambda \( i j \) . $
  In particular the pre-update row maxima lie in $\[ 1 \/ 8 \, 2 \]$.
    Write $g_(i j)^(+) = g_(lambda^(+)) \( i j \)$. Since $macron(d) gt.eq bb(E) d - sigma > 0$,
  $ lr(|D macron(z)_(i j) / macron(d) - g_(i j)^(+)|) & lt.eq
    frac(D \| macron(z)_(i j) - bb(E) z_(i j) \| + g_(i j)^(+) \| macron(d) - bb(E) d \|, bb(E) d - sigma)\
 & lt.eq frac(\( D + 2 \) sigma, 1 \/ 4 - sigma) < alpha . $
  The last inequality follows from $D gt.eq 1$ and $sigma lt.eq alpha \/ \( 100 D \)$.
    Since $0 lt.eq g_(i j)^(+) lt.eq 2$, both truncations in (8.12) preserve
  #[#set math.equation(numbering: n => "(8.15)")
   $ g_(i j)^(+) lt.eq G_(i j) lt.eq g_(i j)^(+) + 2 alpha . $ <eq:upper-estimate-accuracy>]
  During the scaling procedure every updated coordinate satisfies $v_i gt.eq max_j G_(i j) \/ 2 gt.eq 1 \/ 16$.
    At the end all entries of the newly scaled two-hole matrix are at most one, by feasibility and (8.4).
    In each row choose a final tight neighbor. For that pair,
  $ frac(g_(i j)^(+), v_i v_j) gt.eq 1 - frac(2 alpha, v_i v_j) gt.eq 1 - 512 alpha > 1 / 4 . $
  This proves balance.
  For the ratio estimate, using $R gt.eq 1 \/ 2$ and $macron(a) gt.eq 1 \/ 2 - sigma$,
  $ lr(|hat(R) / R - 1|) lt.eq
    frac(\| macron(d) - bb(E) d \| + R \| macron(a) - bb(E) a \|, R \( bb(E) a - sigma \)) lt.eq
    frac(2 sigma, \( 1 \/ 2 \) \( 1 \/ 2 - sigma \)) < 10 sigma . $
  The final bound in (8.14) is the other choice in (8.10). ◻
]

=== 8.4 Success probability and output <success-probability-and-output>

The form of Hoeffding’s inequality [9] Theorem 2 used here is:
  if $X_1 \, dots.h \, X_S$ are independent, take values in $\[ 0 \, 1 \]$, and have a common mean $mu$, then,
  for every $t > 0$,

#[#set math.equation(numbering: n => "(8.16)")
 $ bb(P) [lr(|S^(- 1) sum_(i = 1)^S X_i - mu|) > t] lt.eq 2 exp \( - 2 S t^2 \) . $ <eq:hoeffding>]

The theorem applies separately to each observable; the observables within a single sample need not be independent.

Condition on any history in which all preceding stages succeeded. By 23, the current activities are balanced.
  For independent ideal samples, a union bound over the at most $n^2 + 2$ observables gives failure probability at most

$ 2 \( n^2 + 2 \) exp \( - 2 S sigma^2 \) lt.eq 2 \( n^2 + 2 \) exp \( - 20 \( n + K + 1 \) \) < frac(1, 100 K) . $

One elementary verification of the last strict inequality is $log \( 200 K \( n^2 + 2 \) \) lt.eq 6 + K +
  2 n < 20 \( n + K + 1 \)$ for $n gt.eq 2 \, K gt.eq 1$. The actual fresh runs can be coupled to these ideal
  samples with disagreement probability at most $3 S xi = 3 \/ \( 1000 K \)$.
  Therefore the conditional probability of failure at the first unsuccessful stage is at most
  $13 \/ \( 1000 K \)$. Summing over all $K$ stages proves that a whole trial succeeds with probability at least
  $1 - 13 \/ 1000 > 0.9$.

The trial output is the nonnegative rational

#[#set math.equation(numbering: n => "(8.17)")
 $ Y = \( n - 1 \) ! ! product_(j = 0)^(K - 1) hat(R)_j . $ <eq:trial-output>]

On success, 23 and $product_i \( 1 - t_i \) gt.eq 1 - sum_i t_i$ for $t_i in \[ 0 \, 1 \]$ imply

$ \( 1 - epsilon \/ 100 \) Z_K lt.eq Y lt.eq exp \( epsilon \/ 100 \) Z_K . $

Every matching using a nonedge has raw final weight at most $b^(- K)$.
  There are at most $\( n - 1 \) ! ! lt.eq n^(n \/ 2)$ perfect matchings on the complete graph, so

#[#set math.equation(numbering: n => "(8.18)")
 $ Z \( G \) lt.eq Z_K lt.eq Z \( G \) + n^(n \/ 2) b^(- K) lt.eq \( 1 + epsilon \/ 32 \) Z \( G \) .
   $ <eq:padding-bias>]

For $0 < epsilon < 1$, the resulting lower bound exceeds $\( 1 - epsilon \) Z \( G \)$,
  and the upper bound is at most $\( 1 + epsilon \) Z \( G \)$.
  For example, $exp \( epsilon \/ 100 \) lt.eq 1 + epsilon \/ 50$, which gives

$ exp \( epsilon \/ 100 \) \( 1 + epsilon \/ 32 \) lt.eq 1 + (1 / 50 + 1 / 32 + 1 / 1600) epsilon < 1 + epsilon . $

To amplify, let $ell = ⌈log_2 \( 1 \/ delta \)⌉$, computed by rational comparisons with powers of two.
  Run $r = 10 \( ell + 1 \) + 1$ independent trials and return their median. This is an odd number of trials.
  Since each succeeds with probability at least $0.9$, Hoeffding’s inequality for their success indicators bounds
  the probability of fewer than half succeeding by

$ exp #scale(x: 120%, y: 120%)[\(] - 2 \( 0.4 \)^2 r #scale(x: 120%, y: 120%)[\)] lt.eq
  exp #scale(x: 120%, y: 120%)[\(] - 3.2 \( ell + 1 \) #scale(x: 120%, y: 120%)[\)] < 2^(- ell) lt.eq delta . $

Whenever a majority succeed, the median belongs to the desired interval.
  The deterministic zero branch was taken before any trials.
  This proves the correctness and probability assertions of 1, subject only to the bit implementation established next.

== 9 A bounded-bit implementation <sec:complexity>

We finish by specifying a classical finite-bit implementation and proving a worst-case bound.
  The argument is uniform over all empirical histories, including histories on which balance is lost.
  Balance controls the statistical accuracy of a successful trial;
  the unconditional caps in the algorithm control its running time.

=== 9.1 Sizes of the parameters and state spaces <sizes-of-the-parameters-and-state-spaces>

Let $sans(b)$ be the total binary input length. We use a standard explicit encoding of a finite graph and of the
  two rationals. If isolated vertices are specified by a binary vertex count,
  first return zero when $n > 2 \| E \|$. This test is valid for every nonempty graph admitting a perfect matching
  and ensures that the nonzero branch has $n lt.eq 2 \| E \| = O \( sans(b) \)$.
  The deterministic existence test [5] therefore has polynomial bit cost on the original graph.
  It is the only matching-existence oracle used.

(8.2) bounds $K$ polynomially in $sans(b)$. It can be found without logarithms by iterating rational powers of $b$
  and comparing the two sides of (8.1). The parameters $p \, N \, D_0 \,
  D$ are integers of polynomial numerical size in $n \, K$. The hierarchy has at most

#[#set math.equation(numbering: n => "(9.1)")
 $ H_(upright("tree")) = N \( 2 K + 1 \) $ <eq:hierarchy-size>]

nodes, since its levels are $0 \, dots.h \, 2 K$ and every level has at most $N$ components.
  The number of colored edges is less than $N^2$.

Use the ladder parameters $c \, T \, L \, q \, M \, Lambda$ from (6.1), (7.3), (7.6), (7.14), and write

$ t_(upright("mix")) = s \( xi \) \, $

where $s \( xi \)$ is defined in (7.14). The structural parameters $N \, D \, K$ are fixed throughout a trial.
  Hence the same $T$ makes the final tier unclamped on every empirical history, by (8.5), (7.1).
  It can be found by iterating rational powers of $c$ until the defining inequality in (7.3) holds.
  The bound (7.5) is polynomial in $N \, K \, D$. Ceilings of binary logarithms are found by integer or rational
  comparisons with powers of two. These bounds and the product-state size $q \( T + 1 \)$ are polynomial in
  $sans(b)$ and $epsilon^(- 1)$. Indeed,

$ sigma^(- 1) lt.eq C \( D + K epsilon^(- 1) \) \, wide S =
  O #scale(x: 120%, y: 120%)[\(] \( D^2 + K^2 epsilon^(- 2) \) \( n + K + 1 \) #scale(x: 120%, y: 120%)[\)] \,
  wide xi^(- 1) = 1000 K S \, $

for an absolute constant $C$. The exponent $100$ in $L$ is fixed.

There is no initial-sampling problem at the upper tiers. Pair the logical vertices in their fixed order and expand
  this matching by the path tilings. All logical activities are positive,
  so this is an available real perfect matching with assigned colors. Initialize every slot to that matching.
  The mixing bound applies from this deterministic product state.

=== 9.2 Rational bit lengths <rational-bit-lengths>

We record explicitly why the adaptive scales do not create an arithmetic blowup. Put

#[#set math.equation(numbering: n => "(9.2)")
 $ B_G = 1 + n ⌈log_2 \( n + 1 \)⌉ + ⌈log_2 \( S + 1 \)⌉ + ⌈log_2 \( D + 1 \)⌉ . $ <eq:empirical-bit-bound>]

Absolute multiplicative constants in the bit bounds below are independent of the input.

Every nonzero sample contribution is $\( n \/ \( n + 1 \) \)^a$ for some $0 lt.eq a lt.eq n \/ 2$.
  These fractions have the common denominator $Q = \( n + 1 \)^(n \/ 2)$.
  Thus empirical means, their ratios, and the capped entries $G_(i j)$ have $O \( B_G \)$ numerator and
  denominator bits. This bound does not involve the current scales.

An assignment in (8.13) chooses one maximizer $j$ and sets $v_i = G_(i j) \/ v_j$.
  At that moment $v_j$ is either the initial value two or an expression formed at an earlier update.
  Following such dependencies strictly decreases the update index, so it produces a chain of at most $n$ factors.
  Each $v_i$ consequently has $O \( n B_G \)$ bits. Accumulating at most $K$ scale updates gives $O \( K n B_G \)$
  bits per scale. The raw activities have $O \( K log \( n + 1 \) \)$ bits.
  These estimates apply even when all observations are unfavorable,
  because the clipping and branch conventions are unconditional.

Bottleneck entries $B_(i j)$ and the maxima $H_i = max_(j eq.not i)
  B_(i j)$ select from finitely many input activities and one; they do not involve sums over paths.
  Initialize $B_(i j) = max { 1 \, lambda_(i j) }$ and, for each vertex $k$,
  update the entries with distinct $i \, j eq.not k$ by

$ B_(i j) arrow.l max { B_(i j) \, min { B_(i k) \, B_(k j) } } . $

This is the max–min Floyd–Warshall recurrence: after processing $k$,
  the entries allow the processed vertices as internal path vertices. It uses $O \( n^3 \)$ rational comparisons.
  The path profiles add only powers of two of bit length $O \( K \)$.
  Bag activities are sums of a real activity and a dyadic height divided by $D$.
  Finally $c^(plus.minus t)$ has $O \( T log \( N + 1 \) \)$ bits for $t lt.eq T$.

It follows that every single-edge activity used by the sampler has numerator and denominator lengths at most the
  integer bound

#[#set math.equation(numbering: n => "(9.3)")
 $ B_W = C_1 #scale(x: 120%, y: 120%)[\(] K n B_G + K + ⌈log_2 \( D + 1 \)⌉ + T ⌈log_2 \( N + 1 \)⌉ +
   1 #scale(x: 120%, y: 120%)[\)] \, $ <eq:edge-bit-bound>]

where $C_1$ is a sufficiently large absolute positive integer.
  A product of at most $N$ such activities has $O \( N B_W \)$ bits.
  In a Metropolis acceptance ratio the unknown normalizing constants cancel.
  Thus even a cycle exchange at unequal tiers requires only rational products of this size.
  The real and probe revelation probabilities are likewise rational,
  respectively the real portion divided by the collapsed activity and $1 \/ \( D W \)$ for the probe portion.

By 19, the bottom-tier dynamic program uses counts of $O \( N log \( N + 1 \) \)$ bits.
  Its categorical normalizers count the same partial completions and obey the same bound.
  Label and loop indices use an additional $O \( log \( H_(upright("tree")) + 1 \) + log \( N + 1 \) \)$ bits,
  since $b_(upright("tree")) lt.eq H_(upright("tree"))$ in the constructed hierarchy.
  The table computation and sampling therefore use polynomially many integer operations with polynomial bit lengths.

=== 9.3 Random choices with a fixed number of bits <random-choices-with-a-fixed-number-of-bits>

#thm([Lemma 9.1.])[
  #emph[Let $p_1 \, dots.h \, p_r$ be nonnegative rational numbers summing to one.
    Choose a uniform integer $J in { 0 \, dots.h \, 2^k - 1 }$ using exactly $k$ fair bits,
    and return the least index $i$ such that $J \/ 2^k < sum_(j lt.eq i) p_j$.
    The output law is at total variation distance at most $2 r thin 2^(- k)$ from $\( p_i \)_(i = 1)^r$.]
] <lem:finite-random-choice>

#proof[
  For any interval $\[ a \, b \) subset.eq \[ 0 \, 1 \)$, the number of grid points $j \/
    2^k$ in the interval differs from $2^k \( b - a \)$ by at most two.
    Apply this to the successive cumulative-probability intervals and sum the absolute probability discrepancies.
    The factor one half in total variation only improves the stated bound.
    An outcome with $p_i = 0$ has an empty interval and is never returned. ◻
]

The exact categorical choices in the unit-tier dynamic program define an ideal transition law.
  The actual algorithm implements each such choice, along with every proposal and acceptance choice,
  by the fixed grid in 24. Hence exactness of the dynamic program is a counting identity;
  sampling from its tables in bounded bit time incurs the error budget derived below.

Every choice in the chain is either uniform on an explicitly indexed finite set, Bernoulli,
  or proportional to a list of nonnegative integers supplied by the dynamic program.
  For each used edge, final revelation is a rational categorical choice with at most three outcomes.
  Subsets and pairings are sampled sequentially, so no exponential list is needed.
  Uniform choices among the $M$ scan positions can be implemented by integer arithmetic on the index rather than
  by enumerating the scan positions.

A bound on the number of random choices in one complete sampler run, including marking its output, is

#[#set math.equation(numbering: n => "(9.4)")
 $ R_(upright("draw")) = 100 \( t_(upright("mix")) + 1 \) \( N + 1 \)^2 \( K + 2 \) . $ <eq:draw-bound>]

To see this, laziness and the scan take two choices per step,
  and a pair update takes at most eight further choices. By 19,
  a refresh takes at most $4 \( H_(upright("tree")) + N + 1 \)$ choices.
  Allowing both bounds at every step and adding the at most $N$ choices for final marking gives

$ t_(upright("mix")) #scale(x: 120%, y: 120%)[\(] 10 + 4 \( H_(upright("tree")) + N + 1 \)
  #scale(x: 120%, y: 120%)[\)] + N . $

Since $H_(upright("tree")) = N \( 2 K + 1 \)$, this is bounded by (9.4).
  The bound therefore includes every categorical choice made by the implemented sampler.
  The number of options in any one choice is at most

#[#set math.equation(numbering: n => "(9.5)")
 $ R_(upright("opt")) = 10 \( M + N^2 + 1 \) . $ <eq:option-bound>]

Choose the same bit budget $k$ for all these choices, with

#[#set math.equation(numbering: n => "(9.6)")
 $ 2^k gt.eq frac(2 R_(upright("draw")) R_(upright("opt")), xi) . $ <eq:coin-precision>]

This integer is found by doubling; $k$ is polynomially bounded.
  By 24, the sum of all conditional simulation errors is at most $xi$.
  Successive coupling, while the simulated and exact histories agree,
  bounds the total variation error of the whole run and its marking by $xi$.
  The exact-kernel mixing error is at most $xi$, so the implemented marked sample is within $2 xi$,
  and in particular $3 xi$, of the required law. The number of fair bits used has a deterministic bound $k
  R_(upright("draw"))$. There is no rejection loop or random convergence test.

=== 9.4 Total bit cost <total-bit-cost>

The preceding bounds already give a polynomial-time implementation.
  To make the accounting explicit, take a common bit bound

$ B_(*) = C #scale(x: 120%, y: 120%)[\(] N B_W + N log \( N + 1 \) + sans(b) + log \( M + 1 \) +
  log \( t_(upright("mix")) + 1 \) + log \( xi^(- 1) + 1 \) + 1 #scale(x: 120%, y: 120%)[\)] $

with a sufficiently large absolute constant $C$ and $B_W$ from (9.3).
  In particular $N B_W$ dominates $K B_G$, the bit cost of multiplying the $K$ empirical ratios.
  The bound $B_(*)$ covers all integers used in weight products, dynamic-program counts, cumulative choices,
  acceptance comparisons, and output products. All categorical laws just described admit common-denominator
  integer weights, so computing their cumulative sums respects the same bound.
  Schoolbook arithmetic and the Euclidean algorithm perform the needed operations within $O \( B_(*)^3 \)$ bit
  time per operation.

A deliberately loose bound of $O \( \( H_(upright("tree")) + 1 \) \( N + 1 \)^4 \)$ arithmetic operations covers
  graph construction, the bottom-tier tables, and any one transition or refresh;
  storing the product state additionally takes $O \( q \( T + 1 \) N B_(*) \)$ bits.
  Thus a trial, including all $K$ stages and $S$ fresh runs at each stage, has bit cost bounded by a fixed polynomial in

$ K \, med S \, med t_(upright("mix")) \, med H_(upright("tree")) \, med N \, med q \( T + 1 \) \, med B_(*) . $

For example, the sum of

$ C K S \( t_(upright("mix")) + 1 \) \( H_(upright("tree")) + 1 \) \( N + 1 \)^4 B_(*)^3 quad upright("and") quad
  C K S q \( T + 1 \) \( N + 1 \) B_(*)^3 $

is a valid coarse envelope for arithmetic, repeated initialization, and storage operations.
  Each displayed parameter is polynomial in $sans(b)$ and $epsilon^(- 1)$.
  The $r = 10 \( ⌈log_2 \( 1 \/ delta \)⌉ + 1 \) + 1$ repetitions and the rational comparisons used to select
  their median add a factor polynomial in $log delta^(- 1)$ and the input length.

All data structures, loop bounds, and rational comparisons have now been specified by finite procedures.
  Every auxiliary parameter is bounded by a polynomial of fixed degree,
  and the bound holds on every random history. Together with 8, this completes the proof of 1.

== 10 Prescribed-degree subgraphs and fixed-cardinality matchings <sec:prescribed-degree>

We record two counting consequences of 1 and a corresponding output-sampling guarantee.
  Throughout this section, the input host $G = \( V \, E \)$ is a finite simple undirected unweighted graph whose
  vertices and edges are explicitly listed, including any isolated vertices.
  Only edges in $E$ may be selected, so absent edges may be forbidden arbitrarily.
  The objects counted are labeled edge subsets, not isomorphism classes.
  For binary-encoded integer demands $f = \( f_v \)_(v in V)$ and a binary-encoded integer $k$, define

$ cal(F) \( G \, f \) & = { F subset.eq E : deg_F \( v \) = f_v upright(" for every ") v in V } \,\
cal(M)_k \( G \) & = { M subset.eq E : M upright(" is a matching and ") \| M \| = k } . $

#thm([Corollary 10.1.])[
  #emph[For either family $cal(A) = cal(F) \( G \, f \)$ or $cal(A) = cal(M)_k \( G \)$,
    there are uniform classical randomized algorithms with the following guarantees.]
  + #emph[Given rational $0 < epsilon < 1$ and $0 < delta < 1 \/ 2$,
    the counting algorithm returns a nonnegative rational $hat(N)$ such that
$ bb(P) \[ \( 1 - epsilon \) \| cal(A) \| lt.eq hat(N) lt.eq \( 1 + epsilon \) \| cal(A) \| \] gt.eq 1 - delta . $

 If $cal(A)$ is empty, it returns zero with certainty. Its bit running time on every execution is polynomial in
   the full input encoding length, $epsilon^(- 1)$, and $log delta^(- 1)$.]
  + #emph[Given rational $0 < tau < 1$, the sampling algorithm reports infeasibility exactly when $cal(A)$ is
    empty. Otherwise it returns a member $X$ of $cal(A)$ on every execution, and
$ "TV" \( cal(L) \( X \) \, U_(cal(A)) \) lt.eq tau \, $

 where $U_(cal(A))$ is the uniform law on $cal(A)$ and $"TV" \( mu \, nu \) = 1 / 2 sum_x \| mu \( x \) -
   nu \( x \) \|$. Its bit running time on every execution is polynomial in the full input encoding length and
   $tau^(- 1)$.]
] <cor:prescribed-degree>

Only the stated total-variation and polynomial-in-$tau^(- 1)$ sampling guarantee is asserted.
  In particular, the statement does not assert exact or pointwise almost-uniform sampling.
  The explicit simple unweighted host model does not encode edge weights or compressed multiplicities.

=== 10.1 Constant-fibre reductions <constant-fibre-reductions>

Write $n = \| V \|$, $m = \| E \|$, and $d_v = deg_G \( v \)$.

===== 10.1.1 The prescribed-degree reduction. <the-prescribed-degree-reduction.>

We use Tutte’s reduction of prescribed degrees to perfect matchings [18] pp. 348–349,
  keeping the dummy vertices labeled so that its counting multiplicity is explicit.
  If some $f_v$ is outside $0 lt.eq f_v lt.eq d_v$, the family is empty and we return zero or report
  infeasibility, as appropriate. For valid demands put $s_v = d_v - f_v$.
  Construct a simple unweighted graph $H_f$ with one tagged port $\( v \, e \)$ for every incidence of an edge $e$
  at $v$. For each original edge $e = { u \, v }$, join $\( u \, e \)$ to $\( v \, e \)$ by a cross edge.
  At each $v$, add $s_v$ labeled private dummy vertices, each adjacent to all $d_v$ ports at $v$.
  There are no other edges. The tags distinguish ports and dummies, so simplicity of $G$ makes $H_f$ simple.
  Its sizes satisfy

$ \| V \( H_f \) \| = 2 m + sum_v s_v = 4 m - sum_v f_v lt.eq 4 m \, wide \| E \( H_f \) \| = m +
  sum_v d_v s_v lt.eq m + 2 m \( n - 1 \) . $

Thus the gadget is explicit and polynomial in the host size;
  the initial demand check prevents expansion of arbitrarily large binary demands.

Project a perfect matching of $H_f$ to the original edges whose cross edges it contains.
  Each dummy at $v$ uses a distinct $v$-port. The remaining $f_v$ ports must use cross edges,
  so the projection lies in $cal(F) \( G \, f \)$. Conversely, an $f$-factor fixes its cross edges.
  Its remaining $s_v$ ports at $v$ can be bijected to the labeled dummies in $s_v !$ ways,
  independently at each vertex. Hence every factor has the same number of preimages, and

#[#set math.equation(numbering: n => "(10.1)")
 $ C_f = product_v \( d_v - f_v \) ! \, wide Z \( H_f \) =
   C_f \| cal(F) \( G \, f \) \| . $ <eq:prescribed-degree-fibre>]

The fibre may be factorial, but $log C_f = O \( m log \( n + 1 \) \)$, so $C_f$ has polynomial bit length.
  For an edgeless host with all demands zero, both the unique factor and the gadget’s unique perfect matching are
  empty, and $C_f = 1$ by $0 ! = 1$. Other infeasible valid inputs give gadgets without perfect matchings by the
  same correspondence.

===== 10.1.2 The fixed-cardinality reduction. <the-fixed-cardinality-reduction.>

If $k < 0$ or $2 k > n$, the family is empty, so return zero or report infeasibility, as appropriate.
  Otherwise put $q = n - 2 k$. Form $H_k$ by adding $q$ labeled dummy vertices to $G$,
  joining each dummy to every original vertex, and adding no edges between dummies. Keep all original edges.
  This is a simple unweighted graph with at most $2 n$ vertices and $m + n^2$ edges.
  In every perfect matching, the dummies use $q$ distinct original vertices;
  the remaining $2 k$ original vertices are paired by exactly $k$ host edges.
  Conversely, a $k$-matching leaves $q$ original vertices, which can be bijected to the dummies in $q !$ ways. Therefore

#[#set math.equation(numbering: n => "(10.2)")
 $ C_k = \( n - 2 k \) ! \, wide Z \( H_k \) = C_k \| cal(M)_k \( G \) \| . $ <eq:cardinality-fibre>]

Here $log C_k = O \( n log \( n + 1 \) \)$. The same bijection covers $k = 0$, $2 k = n$, and $n = k = 0$,
  using $0 ! = 1$.

#proof[
  Apply 1 to the appropriate gadget and divide its nonnegative rational output by the corresponding positive
    integer $C_f$ or $C_k$. Compute these factorial products exactly and perform exact rational division,
    without rounding to an integer. Their displayed bit lengths and the polynomial gadget sizes preserve the
    asserted relative error, confidence, certain-zero behavior, and every-execution bit bound.
    This proves the counting assertion. The correspondences also make feasibility equivalent to perfect-matching
    feasibility in the gadget. ◻
]

=== 10.2 A deletion sampler for perfect matchings <a-deletion-sampler-for-perfect-matchings>

The conversion from counts to samples uses the self-reduction framework of Jerrum, Valiant,
  and Vazirani [12] Section 6. We give the deletion procedure explicitly to retain feasibility on every execution
  and to track its total-variation and bit-time bounds. It uses 1 only through its counting guarantee.

#thm([Lemma 10.2.])[
  #emph[Given a finite simple undirected unweighted graph $H_0$ whose vertices and edges are explicitly listed,
    and a rational $0 < tau < 1$, there is a uniform classical randomized algorithm that reports infeasibility
    exactly when $H_0$ has no perfect matching. Otherwise it returns a perfect matching on every execution,
    and its output law is at total variation distance at most $tau$ from the uniform perfect-matching law.
    Its bit running time on every execution is polynomial in the full input encoding length and $tau^(- 1)$.]
] <lem:deletion-sampler>

#proof[
  First decide perfect-matching feasibility by the deterministic polynomial-time matching algorithm of
    Edmonds [5]. Report infeasibility if appropriate, and return the empty matching when $V \( H_0 \) = diameter$.
    Otherwise set $m_0 = \| E \( H_0 \) \|$ and $m_(*) = max { 1 \, m_0 }$. Choose
  $ eta = gamma = frac(tau, 8 m_(*)) \, wide t = min { j in bb(N) : 2^j gt.eq 8 m_(*) \/ tau } . $
  The integer $t$ is computed by doubling and exact rational comparison.
  Maintain a feasible residual graph $H$ and the already selected edges.
    Choose the first residual edge $e = u v$ in a fixed deterministic ordering.
    Perfect matchings of $H$ excluding $e$ are counted by $Z \( H - e \)$;
    those including $e$ correspond bijectively, after deleting $e$, to perfect matchings of $H - u - v$.
    Test both child graphs for feasibility exactly. At least one is feasible. If only one is feasible, take it.
    If both are feasible, make two fresh calls to 1, with relative error $eta$ and failure probability $gamma$,
    obtaining nonnegative rational estimates $A$ for $Z \( H - u - v \)$ and $B$ for $Z \( H - e \)$.
    If $A + B = 0$, take the exclusion child. Otherwise put $hat(p) = A \/ \( A + B \)$,
    draw exactly $t$ fresh fair bits as a uniform integer $J in { 0 \, dots.h \, 2^t - 1 }$,
    and take the inclusion child precisely when
  $ J < ⌊2^t hat(p)⌋ . $
  Replace $H$ by the chosen child. Whenever the inclusion child is taken, including a forced choice,
    append $e$ to the selected edges. All ratio and floor operations are exact rational or integer operations.
  Every chosen child is feasible, regardless of the estimates.
    Each decision removes at least one residual edge, so there are at most $m_0$ decisions.
    When no residual edges remain, feasibility forces the residual vertex set to be empty.
    The selected edges then form a perfect matching of $H_0$ on every execution.
  For the error bound, compare this process to the ideal deletion sampler that takes the inclusion child with its
    exact count ratio. These exact ratios telescope, giving the uniform perfect-matching law.
    At a history where both children are feasible, write their positive counts as $z_(+)$ and $z_(-)$, with $p =
    z_(+) \/ \( z_(+) + z_(-) \)$. When both estimates succeed, write $A = z_(+) \( 1 + a \)$ and $B =
    z_(-) \( 1 + b \)$, where $\| a \| \, \| b \| lt.eq eta$. Then
  $ \| hat(p) - p \| =
    frac(z_(+) z_(-) \| a - b \|, \( z_(+) + z_(-) \) \( z_(+) \( 1 + a \) + z_(-) \( 1 + b \) \)) lt.eq
    frac(eta, 2 \( 1 - eta \)) . $
  The last step uses $z_(+) z_(-) lt.eq \( z_(+) + z_(-) \)^2 \/ 4$.
    Fresh call randomness bounds the conditional probability that either estimate fails by $2 gamma$,
    at every adaptive history. On failure the branch law can change by at most one in total variation,
    while the dyadic floor changes the successful branch probability by at most $2^(- t)$.
    The fallback $A + B = 0$ occurs only on a failed estimate when both true counts are positive.
    Thus the conditional branch-law error is at most
  $ beta = frac(eta, 2 \( 1 - eta \)) + 2 gamma + 2^(- t) . $
  Forced branches have zero error. Couple the two deletion processes until their prefixes differ.
    With at most $m_0$ decisions, the output total-variation error is at most $m_0 beta$.
    Since $eta < 1 \/ 8$ and $2^(- t) lt.eq eta$, we have $beta lt.eq 4 eta$ and hence
  $ m_0 beta lt.eq 4 m_(*) eta = tau \/ 2 < tau . $
  There are at most $2 m_0$ counting calls and $2 m_0 + 1$ exact feasibility tests,
    all on simple graphs no larger than $H_0$. The inverse relative error is $8 m_(*) \/ tau$,
    and the logarithmic confidence cost is $log \( 8 m_(*) \/ tau \)$.
    The every-execution bit bound of 1 also bounds the bit lengths of its outputs on failed calls.
    Therefore the exact ratio and floor computations, the $t =
    O \( log \( m_(*) \/ tau \) \)$ fresh bits per branch, and all graph updates have bit cost polynomial in the
    full input length and $tau^(- 1)$ on every execution. No rejection loop or random stopping criterion is used. ◻
]

#proof[
  For sampling, apply 26 to $H_f$ or $H_k$ and decode by keeping the original edges represented by selected cross
    edges, or by discarding the dummy-incident edges, respectively.
    Exact feasibility testing of the gadget reports infeasibility precisely for an empty target family.
    Uniform perfect matchings project to the uniform target law because the fibres in (10.1) and (10.2) are
    constant across target members. Deterministic decoding cannot increase total variation and takes polynomial
    time, without enumerating any fibre. Every decoded output is feasible, which proves the sampling assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Ivona Bezáková, Daniel Štefankovič, Vijay~V. Vazirani, and Eric Vigoda.
  Accelerating simulated annealing for the permanent and combinatorial counting problems.
  #emph[SIAM Journal on Computing], 37(5): 1429--1454, 2008. .]
#bibitem([2])[Jin-Yi Cai and Tianyu Liu. Counting perfect matchings and the eight-vertex model.
  In Artur Czumaj, Anuj Dawar, and Emanuela Merelli, editors, #emph[47th International Colloquium on Automata,
  Languages, and Programming (ICALP 2020)], volume 168 of #emph[Leibniz International Proceedings in Informatics],
  pages 23:1--23:18. Schloss Dagstuhl--Leibniz-Zentrum für Informatik, 2020. .
  URL #link("https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ICALP.2020.23").]
#bibitem([3])[Xiaoyu Chen, Heng Guo, Eric Vigoda, and Xiongxin Yang. Fast FPRAS for the permanent.
  Preprint, arXiv:2609.20717v1, 2026. URL #link("https://arxiv.org/abs/2609.20717v1").]
#bibitem([4])[Xiaoyu Chen, Eric Vigoda, and Xiongxin Yang.
  Faster FPRAS for the permanent via restricted Poincaré inequalities and coupled flows.
  Preprint, arXiv:2608.26599v1, 2026. URL #link("https://arxiv.org/abs/2608.26599v1").]
#bibitem([5])[Jack Edmonds. Paths, trees, and flowers. #emph[Canadian Journal of Mathematics], 17: 449--467, 1965. .]
#bibitem([6])[Bradley Efron and Charles Stein. The jackknife estimate of variance.
  #emph[The Annals of Statistics], 9 (3): 586--596, 1981. .]
#bibitem([7])[Yumou Fei, Leslie~Ann Goldberg, and Pinyan Lu. Two-state spin systems with negative interactions.
  #emph[Information and Computation], 307: 105340, 2025. .]
#bibitem([8])[W.~K. Hastings. Monte Carlo sampling methods using Markov chains and their applications.
  #emph[Biometrika], 57 (1): 97--109, 1970. .]
#bibitem([9])[Wassily Hoeffding. Probability inequalities for sums of bounded random variables.
  #emph[Journal of the American Statistical Association], 58 (301): 13--30, 1963. .]
#bibitem([10])[Mark Jerrum and Alistair Sinclair. Approximating the permanent.
  #emph[SIAM Journal on Computing], 18 (6): 1149--1178, 1989. .]
#bibitem([11])[Mark Jerrum, Alistair Sinclair, and Eric Vigoda.
  A polynomial-time approximation algorithm for the permanent of a matrix with nonnegative entries.
  #emph[Journal of the ACM], 51 (4): 671--697, 2004. .]
#bibitem([12])[Mark~R. Jerrum, Leslie~G. Valiant, and Vijay~V. Vazirani.
  Random generation of combinatorial structures from a uniform distribution.
  #emph[Theoretical Computer Science], 43: 169--188, 1986. .]
#bibitem([13])[P.~W. Kasteleyn. Dimer statistics and phase transitions.
  #emph[Journal of Mathematical Physics], 4 (2): 287--293, 1963. .]
#bibitem([14])[Nicholas Metropolis, Arianna~W. Rosenbluth, Marshall~N. Rosenbluth, Augusta~H.
  Teller, and Edward Teller. Equation of state calculations by fast computing machines.
  #emph[The Journal of Chemical Physics], 21 (6): 1087--1092, 1953. .]
#bibitem([15])[Alistair Sinclair. Improved bounds for mixing rates of Markov chains and multicommodity flow.
  #emph[Combinatorics, Probability and Computing], 1: 351--370, 1992.
  URL #link("https://people.eecs.berkeley.edu/~sinclair/flow.pdf").]
#bibitem([16])[Daniel Štefankovič, Eric Vigoda, and John Wilmes. On counting perfect matchings in general graphs.
  In Michael~A. Bender, Martín Farach-Colton, and Miguel~A. Mosteiro, editors, #emph[LATIN 2018:
  Theoretical Informatics], volume 10807 of #emph[Lecture Notes in Computer Science], pages 873--885.
  Springer, 2018. . Full version: arXiv:1712.07504v1. URL #link("https://arxiv.org/abs/1712.07504v1").]
#bibitem([17])[Robert~H. Swendsen and Jian-Sheng Wang. Replica Monte Carlo simulation of spin-glasses.
  #emph[Physical Review Letters], 57 (21): 2607--2609, 1986. .]
#bibitem([18])[W.~T. Tutte. A short proof of the factor theorem for finite graphs.
  #emph[Canadian Journal of Mathematics], 6: 347--352, 1954. .]
#bibitem([19])[Leslie~G. Valiant. The complexity of computing the permanent.
  #emph[Theoretical Computer Science], 8 (2): 189--201, 1979. .]
#bibitem([20])[Jian-Sheng Wang and Robert~H. Swendsen. Replica Monte Carlo simulation (revisited).
  #emph[Progress of Theoretical Physics Supplement], 157: 317--323, 2005. . Preprint version:
  #link("https://arxiv.org/abs/cond-mat/0407273v1").]
#bibitem([21])[Zihong Yi. Diffuse Gaussian truncation for deterministic approximate counting.
  Preprint, arXiv:2609.04079v1, 2026. URL #link("https://arxiv.org/abs/2609.04079v1").]
