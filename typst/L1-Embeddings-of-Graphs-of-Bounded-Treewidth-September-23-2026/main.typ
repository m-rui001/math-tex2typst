#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[$L_1$ Embeddings of Graphs of Bounded Treewidth]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A graph metric is the shortest-path metric $d_(G \, ell)$ of a finite connected undirected graph $G = \( V \, E \)$ with positive real edge lengths $ell : E arrow.r \( 0 \, oo \)$. An embedding into real $L_1$ has #emph[distortion at most $C$] if it can be rescaled so that every image distance is between the original distance and $C$ times that distance. We establish a bound depending only on the treewidth.

A #emph[tree decomposition] consists of a finite tree $T$ and subsets $B_t subset.eq V$, called bags, indexed by $t in V \( T \)$: the bags cover $V$, each graph edge has both endpoints in a bag, and the bags containing any fixed vertex induce a connected subtree of $T$. Its width is $max_t \| B_t \| - 1$; the treewidth of $G$ is the minimum width of a tree decomposition. Throughout this paper $k$ bounds #emph[bag cardinality], so the corresponding treewidth bound is $k - 1$.

#thm([Theorem 1.1.])[
  #emph[For every integer $k gt.eq 2$ there is a finite constant $C_k gt.eq 1$ with the following property. If a finite connected graph $G = \( V \, E \)$ admits a tree decomposition with bags of size at most $k$, then, for every edge-length function $ell : E arrow.r \( 0 \, oo \)$, there is a map $F$ from $V$ into a real $L_1$ space such that 
#[#set math.equation(numbering: n => "(1.1)")
 $ d_(G \, ell) \( u \, v \) lt.eq parallel F \( u \) - F \( v \) parallel_1 lt.eq C_k thin d_(G \, ell) \( u \, v \) #h(2em) \( u \, v in V \) . $ <eq:main-embedding>]

 The constant is independent of the number of vertices, the depth of the decomposition, and all ratios of edge lengths.]
] <thm:main>

The target can be taken to be a finite-dimensional real $ell_1$ space. The proof gives the existence of $C_k$, without an explicit estimate for its dependence on $k$. The bounded-treewidth family is one of the cases of the conjecture of Gupta, Newman, Rabinovich, and Sinclair, which predicts a uniform $L_1$ distortion bound for every proper minor-closed graph family [10]. By the excluded-planar-minor theorem of Robertson and Seymour [18], our result also gives a uniform bound for graphs excluding any fixed planar graph as a minor.

=== 1.1 Context and prior work <context-and-prior-work>

Finite $L_1$ pseudometrics are exactly the nonnegative combinations of cut pseudometrics. If $S subset.eq V$ and $delta_S \( u \, v \) = \| upright(bold(1))_S \( u \) - upright(bold(1))_S \( v \) \|$, then

#[#set math.equation(numbering: n => "(1.2)")
 $ D \( u \, v \) = sum_(S subset.eq V) w_S delta_S \( u \, v \) \, #h(2em) w_S gt.eq 0 \, $ <eq:intro-cut-representation>]

is realized by the vectors $\( w_S upright(bold(1))_S \( v \) \)_(S subset.eq V)$. Conversely, threshold sweeps through real coordinates give this representation for any finite set of $L_1$ points. We therefore seek cuts that charge graph edges by at most a constant times their lengths and separate every vertex pair by a comparable amount. The edge bound extends along shortest paths to all pairs.

Linial, London, and Rabinovich related low-distortion embeddings to approximate multicommodity flow–cut bounds [16]; Aumann and Rabani independently obtained a general approximate max-flow/min-cut theorem [2]. Given nonnegative edge capacities and nonnegative demands on unordered pairs of distinct vertices, not all zero, let $lambda_(*)$ be the largest common multiplier of the demands that can be routed fractionally, and let $phi.alt_(*)$ be the minimum ratio of crossing capacity to separated demand over cuts with positive separated demand. For instances with $lambda_(*) > 0$, the ratio $phi.alt_(*) \/ lambda_(*)$ is the flow–cut gap. Minimizing the cut ratio that defines $phi.alt_(*)$ is the nonuniform sparsest-cut problem. The worst such gap on a fixed graph equals the worst $L_1$ distortion of its weighted shortest-path metrics [10] Section 3, Theorem 3.2. For graphs with bags of size at most $k$, Theorem 1 therefore gives

$ lambda_(*) lt.eq phi.alt_(*) lt.eq C_k lambda_(*) . $

Gupta et al. proved the treewidth-two case [10]. The optimal distortion is $2$, by the upper bound of Chakrabarti, Jaffe, Lee, and Vincent [3] and the matching lower bound of Lee and Raghavendra [13]. Other structural restrictions also yielded uniform bounds: a fixed number of successive outer-face removals in a planar graph [5], and graphs formed by identifying edges of pieces from a fixed finite family [12]. A path decomposition is a tree decomposition whose indexing tree is a path; its minimum width is the graph’s #emph[pathwidth]. Lee and Sidiropoulos established the bounded-pathwidth case through stochastic embeddings into trees: each sampled tree metric dominates the graph metric, while its expected expansion is bounded by a function of the pathwidth [15]. Abraham, Filtser, Gupta, and Neiman subsequently obtained $O \( sqrt(p) \)$ distortion into $L_1$ for pathwidth $p$ [1]. The route through dominating trees cannot yield a uniform bound for all bounded-treewidth graphs: some series-parallel metrics require expected tree distortion $Omega \( log n \)$ [10] Theorem 5.6. We instead construct cut measures directly on a tree decomposition, allowing arbitrary branching.

A closer precursor is the local-consistency theorem of Chlamtáč, Krauthgamer, and Raghavendra [6] Corollary 1.2. For treewidth $t$, they obtain bounded $L_1$ distortion when the restrictions of the metric to sets of $t + 3$ vertices admit isometric cut representations whose distributions agree on overlaps. Their work supplies both the Markov gluing of consistent local laws and the bounded-state Markov-flow theorem used below. Here we construct the bag laws directly and prove separation without assuming such locally consistent isometric representations of the original metric.

The same line of work developed approximation algorithms for nonuniform sparsest cut using stronger relaxations [6,11,4,7]. These contain consistency information beyond the metric relaxation whose gap is measured by $L_1$ distortion, so their guarantees do not by themselves give the embedding theorem. There is nevertheless an algorithmic consequence of our result. Gupta, Talwar, and Witmer also approximate the minimum $L_1$ distortion [11] Section 3.3.1, and Cohen-Addad, Mömke, and Verdugo obtain fixed-parameter running time for this task [7]. For positive rational edge lengths, these algorithms and Theorem 1 yield embeddings of distortion at most $\( 2 + epsilon \) C_k$, for each fixed $epsilon > 0$, in fixed-parameter time with respect to $k$.

The other published input is the padded-decomposition theorem of Filtser et al. [9]. At each scale, it supplies a random partition into small-diameter parts with positive probability that a small ball around any specified vertex stays in one part. The padding parameters depend only on the treewidth. The same work gives the size-dependent $L_1$ distortion bound $O \( sqrt(log \( 2 + t \) log n) \)$ for $n$-vertex graphs of treewidth $t$, through its Euclidean embedding estimate [9]. Such partitions allow localized Lipschitz perturbations. Conroy and Filtser obtained related logarithmic padding bounds for general excluded-minor classes [8]. The issue addressed here is how to retain useful perturbations without accumulating a loss over the number of scales or the depth of the decomposition.

The companion paper on planar graph metrics [17] proves a universal distortion bound for that class. It also combines its planar theorem with Theorem 1 and the stochastic reduction of Lee and Sidiropoulos [14] Theorem 1.7 to obtain uniform $L_1$ distortion and nonuniform fractional flow–cut bounds for each fixed almost-embeddable family. Roughly, these graphs consist of a part embedded in a fixed surface, boundedly many additional pieces whose bounded-width path decompositions follow face-boundary order, and boundedly many extra vertices with arbitrary adjacencies. The reduction uses $1$-sums, or gluings at single vertices, of planar and bounded-treewidth graphs. Extending this conclusion through gluings along larger complete subgraphs remains a further step toward the full conjecture.

=== 1.2 The proof: preserving local laws and transporting separation <the-proof-preserving-local-laws-and-transporting-separation>

For a bag $B$, a #emph[bag cut law] assigns nonnegative masses to the binary labelings ${ 0 \, 1 }^B$. Two neighboring laws are consistent when their restrictions to the intersection agree. Because the bags form a tree, consistent laws glue into a global law of cuts: after sampling one bag, sample each neighboring bag conditionally on the labels of its intersection. Section 2 gives this Markov gluing and its exact marginals. Controlling the separation mass of an edge in its containing bag gives the global upper bound. Consistency alone does not supply a lower bound for vertices in distant bags.

===== 1.2.1 Particles preserve bag laws under repeated updates. <particles-preserve-bag-laws-under-repeated-updates.>

A #emph[particle] is a real function on all graph vertices. Sweeping a threshold through its values gives a cut measure. We keep a fixed number of particles and sum their symmetric threshold measures, which give each cut and its complement equal mass. Suppose two particles have the same weak order on the current bag. Replace them by $f + g$ and $f - g$, where $f$ is their average and the perturbation $g$ vanishes on that bag. The combined cut law on the bag is unchanged: successive threshold masses are affine in the ordered heights. This permits different continuations into the children of a decomposition node while preserving consistency.

Every perturbation has a fixed uniform Lipschitz bound. Nevertheless, repeated updates might appear to increase the particles’ Lipschitz constants without bound. Section 3 prevents this by a numerical invariant: a quadratic bound on sums of the largest particle differences controls every individual Lipschitz constant. Averaging two entries and adding opposite perturbations preserves this bound, which depends only on the fixed number of particles. Thus every particle remains uniformly Lipschitz after arbitrarily many updates.

===== 1.2.2 Unchanged particles carry uncertainty along bag paths. <unchanged-particles-carry-uncertainty-along-bag-paths.>

A #emph[reservation] freezes two particles, preventing their use in later updates until the reservation is released. Once the maximum number of simultaneous reservations is fixed, a sufficiently large particle list always leaves two unreserved particles with the same chosen increasing order: there are at most $k !$ such orders on a bag. The functions in a reserved pair remain unchanged, so their two cut measures form a common submeasure of the laws on every bag along the reserved segment. At its launch bag $A$, the pair $f plus.minus g$ agrees because $g \|_A = 0$. At a remote vertex $z$, the values may separate by $2 \| g \( z \) \|$.

The relevant quantity is #emph[uncertainty]: after fixing the binary assignment on a testing bag, take the smaller of the two masses corresponding to the possible labels at $z$, and sum over all assignments. The launch pair has uncertainty at least $2 \| g \( z \) \|$. Section 2 proves that a common submeasure transports this uncertainty to separation of the endpoints of a bag path. The proof inserts the full testing-bag assignment into a Markov chain and applies the published symmetric Markov-flow theorem. The chain has at most $2^k$ states per layer, so its loss depends only on $k$, independently of the number of bags.

===== 1.2.3 Two reservation schedules. <two-reservation-schedules.>

Section 4 first constructs a cut pseudometric $D_(upright("bag"))$ that separates all pairs in a common bag. For each bag, only a bounded number of dyadic scales match distances between its vertices. Particles perturbed using padded partitions are reserved along the consecutive bags where a scale remains relevant. This gives both a uniform upper bound on every pair and a uniform lower bound for pairs sharing a bag.

Section 5 constructs a second cut pseudometric $D_(upright("anc"))$. Here a reserved pair is attached to a launch bag, called its #emph[anchor]. A bounded list of anchors is retained on each descending path of the rooted decomposition. The list protects entries immediately after certain drops in the distances from vertices of the current bag to older launch bags. This rule depends only on the metric and decomposition, before any fresh perturbation is sampled. The rule protects only a bounded number of entries, independently of how small the eventual noise parameter must be.

Bounded bag size thus controls the assignment spaces in transport, the particle orders, the active scales, and the protected anchor entries. It also bounds the constants in the padded partitions used to construct the perturbations.

===== 1.2.4 A younger reservation contradicts the youngest one. <a-younger-reservation-contradicts-the-youngest-one.>

Section 6 combines the two metrics in a compactness argument. If their sum had no uniform lower bound, the common-bag comparison would allow us to normalize a sequence of poorly separated pairs so that one endpoint stays a fixed distance from the least common ancestor bag. Along the descending path to that endpoint, the distances from the bags to the endpoint fall to zero. Passing to a limit along a nonprincipal ultrafilter, only boundedly many reservations can survive from bags at a definite distance to bags approaching the endpoint. Choose the youngest such reservation.

Its perturbation contains two independent parts: a random multiple of distance to its launch bag, and local noise near the endpoint. Together they force every testing bag still at a definite distance to contain vertices $p \, q$, with $p$ nearest the endpoint, whose mutual distance lies between fixed multiples of the endpoint’s distances to the testing bag and to the launch bag. Otherwise the noise produces a positive height gap and hence separation by uncertainty transport. The proof uses this within-bag distance in the list rule to protect a younger successor. That successor also survives toward the endpoint, contradicting the choice of the youngest reservation.

The resulting positive lower constant depends only on $k$. Section 7 adds the two cut pseudometrics and expands their finite cut representation as in (1.2), completing the embedding in Theorem 1.

== 2 Cut measures and transport along a decomposition <sec:cuts>

The construction will prescribe a measure on the binary assignments of each bag. Our first task is to combine these measures into one global cut metric. Our second is to show that a cut measure present in every bag law along a path can force separation in the glued metric, even when the two vertices do not lie in a common bag.

Fix an integer $k gt.eq 2$. Let $G = \( V \, E \)$ be a finite connected simple undirected graph with a nonempty vertex set and positive edge lengths $ell : E arrow.r \( 0 \, oo \)$. Its shortest-path metric $d \( u \, v \)$ is the minimum sum of edge lengths along a path from $u$ to $v$, with $d \( u \, u \) = 0$. For a nonempty set $A subset.eq V$, put

$ d \( x \, A \) = min_(a in A) d \( x \, a \) \, #h(2em) Delta = "diam" \( V \, d \) . $

A tree decomposition consists of a finite tree $T$ and bags $B_t subset.eq V$, indexed by $t in V \( T \)$, such that the bags cover $V$, every graph edge has both endpoints in a bag, and

$ T_v = { t in V \( T \) : v in B_t } $

induces a connected subtree for every $v in V$. The treewidth of $G$ is the minimum of $max_t \| B_t \| - 1$ over all its tree decompositions. We assume $\| B_t \| lt.eq k$; thus the graph has treewidth at most $k - 1$. Bags are regarded as indexed occurrences, even when two bags have the same vertex set.

We may assume that all bags are nonempty. Indeed, deleting an empty bag separates the decomposition tree into components whose unions of bags are disjoint and have no graph edges between them. Connectedness of $G$ implies that exactly one of these components contains graph vertices, and all the others can be discarded. Repeating this operation removes all empty bags.

=== 2.1 Separators and consistent bag laws <separators-and-consistent-bag-laws>

#thm([Lemma 2.1.])[
  (Separator properties).  #emph[The following statements hold for a tree decomposition of a connected graph.]
  + #emph[If a bag $B$ lies on the tree path between bags $A$ and $C$, every graph path from a vertex of $A$ to a vertex of $C$ meets $B$.]
  + #emph[For adjacent bags $A \, C$, their intersection separates the unions of bags on the two sides of the corresponding tree edge. In particular, adjacent nonempty bags have nonempty intersection.]
  + #emph[If $A_0 \, dots.h \, A_r$ occur in this order on a tree path and $x in A_r$, then $d \( x \, A_i \)$ is nonincreasing in $i$. Moreover, if $B$ lies between $A$ and a bag containing $x$, some $v in B$ on a shortest path from $A$ to $x$ satisfies 
#[#set math.equation(numbering: n => "(2.1)")
 $ d \( x \, A \) - d \( v \, A \) = d \( x \, v \) . $ <eq:separator-geodesic>]

]
] <lem:separator>

#proof[
  Delete the node corresponding to $B$ from $T$. The occurrence subtree of each vertex outside $B$ lies in one resulting component. Two adjacent graph vertices outside $B$ lie in the same component, since some bag contains them both. A graph path avoiding $B$ therefore stays in one component. This proves the first assertion; if $B$ is an endpoint bag, that assertion is immediate.
  For a tree edge with endpoint bags $A \, C$, a graph vertex occurs on both sides precisely when it belongs to $A ∩ C$, by connectedness of its occurrence subtree. An edge joining the two sides away from this intersection would have no bag containing both endpoints. This proves the second assertion. If $A ∩ C$ were empty, the nonempty bags $A$ and $C$ would lie in different nonempty components of $G$.
  For the third assertion, a shortest path from $A_i$ to $x$ meets $A_(i + 1)$ by the first assertion, so $d \( x \, A_(i + 1) \) lt.eq d \( x \, A_i \)$. Finally, choose a shortest path from $A$ to $x$ and let $v$ be any of its vertices in $B$. Its initial segment has length $d \( v \, A \)$: a shorter path from $A$ to $v$ would shorten the chosen path to $x$. The remaining segment has length $d \( x \, v \)$, giving (2.1). ◻
]

For a finite set $S$, write $Omega_S = { 0 \, 1 }^S$. A #emph[labeled cut measure] on $S$ is a finite nonnegative measure on $Omega_S$. For $R subset.eq S$, its #emph[trace] $nu \|_R$ is the pushforward under restriction to $R$. The global complement map is $omega mapsto 1 - omega$; write $nu^c$ for its pushforward and

$ nu^(upright("sym")) = frac(nu + nu^c, 2) $

for symmetrization. A measure is #emph[symmetric] if $nu = nu^c$. The cut pseudometric represented by $nu$ is

#[#set math.equation(numbering: n => "(2.2)")
 $ D_nu \( u \, v \) = nu { omega : omega \( u \) eq.not omega \( v \) } . $ <eq:cut-metric>]

Symmetrization leaves this pseudometric unchanged.

A family $mu = \( mu_t \)_(t in V \( T \))$ of bag measures is #emph[consistent] if all its measures have the same mass $m > 0$ and

$ mu_t \|_(B_t ∩ B_s) = mu_s \|_(B_t ∩ B_s) #h(2em) \( t s in E \( T \) \) . $

The common trace on an intersection $S = B_t ∩ B_s$ is denoted by $mu_S$.

Sampling each bag conditionally on its overlap with the preceding bag is the same Markov sampling principle used by Chlamtáč, Krauthgamer, and Raghavendra in their rounding procedure [6] Section 3.2, Lemmas 3.3–3.4. We record its finite-measure form, including the precise marginals needed below.

#thm([Lemma 2.2.])[
  (Markov gluing).  #emph[Every consistent family of bag measures has a canonical Markov gluing $rho_mu$ on $Omega_V$, of mass $m$, with trace $mu_t$ on each bag. It is independent of the chosen root and is symmetric when every bag measure is symmetric. Along a path of bags, the successive intersection assignments, with a vertex label from the corresponding endpoint bag at either end, form a Markov chain under $rho_mu \/ m$. The associated pseudometric 
$ D_mu \( u \, v \) = rho_mu { omega : omega \( u \) eq.not omega \( v \) } $

 is realized in a finite-dimensional real $L_1$ space.]
] <lem:gluing>

#proof[
  Root $T$ and sample the root assignment with law $mu_t \/ m$. At a child bag $B_s$ with parent bag $B_t$, keep the labels on $S = B_t ∩ B_s$ and sample the remaining labels according to the conditional law of $mu_s$ given that assignment on $S$. Previously assigned vertices in $B_s$ are exactly those in $S$: any earlier occurrence of such a vertex is connected to $s$ through $t$. Consequently the sampling defines an assignment on all of $V$. An induction over the rooted tree, using consistency on $S$, proves that each bag has marginal $mu_s \/ m$. Multiply the resulting probability measure by $m$ to obtain $rho_mu$.
  For every full assignment $omega$ for which all separator factors are positive, its mass is
  #[#set math.equation(numbering: n => "(2.3)")
   $ rho_mu \( omega \) = frac(product_(t in V \( T \)) mu_t \( omega \|_(B_t) \), product_(t s in E \( T \)) mu_(B_t ∩ B_s) \( omega \|_(B_t ∩ B_s) \)) . $ <eq:gluing-product>]
  If a separator assignment has zero mass, the full assignment has zero mass as well, by the already established marginals. Formula (2.3) is independent of the root and invariant under complement when the bag measures are symmetric.
  Rooting at the first bag of a path and integrating out branches shows that each next intersection is sampled using only the previous intersection assignment. This also permits an endpoint vertex as the first or last layer, by conditioning the endpoint bag law on that vertex or restricting it to that vertex, respectively. Finally, on the finite measure space $\( Omega_V \, rho_mu \)$, the functions $F_v \( omega \) = omega \( v \)$ satisfy $parallel F_u - F_v parallel_1 = D_mu \( u \, v \)$. ◻
]

Two immediate consequences will be used repeatedly. First, if the separation mass in a bag containing each graph edge $u v$ is at most $U ell \( u v \)$, then the bag marginals and the triangle inequality give

#[#set math.equation(numbering: n => "(2.4)")
 $ D_mu \( u \, v \) lt.eq U d \( u \, v \) #h(2em) \( u \, v in V \) . $ <eq:edge-extension>]

Second, when the prepared laws depend measurably on auxiliary randomness and have an integrable common mass, the average of $rho_mu$ is again a finite cut measure. Thus averaging the resulting pseudometrics preserves their $L_1$ representation.

=== 2.2 A transport inequality for a common submeasure <a-transport-inequality-for-a-common-submeasure>

The glued measure need not preserve the contribution of any one function outside a bag. The next result gives a substitute: if the same cut measure remains present in every bag along a path segment, its uncertainty at the terminal vertex forces separation in the glued metric. The published flow theorem supplies the bound independent of the path’s length; we prove the passage from a common submeasure to a feasible flow.

The external input in this subsection is a theorem of Chlamtáč, Krauthgamer, and Raghavendra. A #emph[Markov flow graph] for a finite Markov chain $X_0 \, dots.h \, X_r$, with state sets $L_0 \, dots.h \, L_r$, has arcs only from $L_(i - 1)$ to $L_i$, with capacities

$ c_i \( a \, b \) = Pr \[ X_(i - 1) = a \, med X_i = b \] . $

We use the symmetric case: each layer has a fixed-point-free involution $theta_i$, and the joint law of $\( theta_i \( X_i \) \)_(i = 0)^r$ equals that of $\( X_i \)_(i = 0)^r$.

#thm([Theorem 2.3.])[
  (Symmetric Markov flow bound  [6] Theorem 4.4).  #emph[For every integer $w gt.eq 2$ there is a finite constant $C \( w \) gt.eq 1$ with the following property. Suppose a symmetric Markov flow graph has at most $w$ states per layer, first layer ${ s_0 \, s_1 }$, and last layer ${ t_0 \, t_1 }$, and its involutions interchange the two states in each endpoint layer. Every capacity-respecting flow from $s_0$ to $t_1$ has value at most 
$ C \( w \) Pr \[ X_0 = s_0 \, med X_r = t_1 \] . $

 The constant is independent of the number of layers and of all transition probabilities.]
] <thm:markov-flow>

Zero-probability states may be removed in complementary pairs: their incident capacities vanish, so neither feasible flows nor endpoint probabilities change. Deterministic transitions are allowed.

For the rest of the proof fix

#[#set math.equation(numbering: n => "(2.5)")
 $ b_k = C \( 2^k \)^(- 1) > 0 . $ <eq:bk-definition>]

For a labeled cut measure $nu$ on $V$, a set $P subset.eq V$, and $z in V$, define its #emph[uncertainty at $z$ given $P$] by

#[#set math.equation(numbering: n => "(2.6)")
 $ E_nu \( z divides P \) = sum_(b in Omega_P) min { nu \( omega \|_P = b \, omega \( z \) = 0 \) \, nu \( omega \|_P = b \, omega \( z \) = 1 \) #scale(x: 120%, y: 120%)[}] . $ <eq:uncertainty-definition>]

Thus $E_nu \( z divides P \)$ is the total mass of the less frequent label at $z$, summed over the possible assignments on $P$. It measures the part of the label at $z$ that cannot be predicted from that assignment. This functional is nondecreasing in $nu$, positively homogeneous, and concave. Complementing all labels leaves it unchanged, so

#[#set math.equation(numbering: n => "(2.7)")
 $ E_(nu^(upright("sym"))) \( z divides P \) gt.eq E_nu \( z divides P \) . $ <eq:uncertainty-symmetrization>]

These properties follow directly from the corresponding properties of the minimum of two nonnegative coordinates; for complement invariance, reindex the sum by $b mapsto 1 - b$.

#thm([Proposition 2.4.])[
  (Transport of uncertainty).  #emph[Let $mu$ be a consistent family of symmetric bag measures, with bags of size at most $k$. Consider the path $B_0 \, dots.h \, B_r$ from a bag containing $y$ to a bag containing $z$, and let $P = B_j$ lie on this path. Suppose a labeled cut measure $nu$ on $V$ satisfies 
$ nu \|_(B_i) lt.eq mu_(B_i) #h(2em) \( j lt.eq i lt.eq r \) . $

 Then the Markov-glued pseudometric satisfies 
#[#set math.equation(numbering: n => "(2.8)")
 $ D_mu \( y \, z \) gt.eq b_k E_nu \( z divides P \) . $ <eq:uncertainty-transport>]

 The measure $nu$ need not be symmetric.]
] <prop:uncertainty>

#proof[
  We will attach a prefix sampled from the glued law to a suffix sampled from $nu$. It is enough to dominate each consecutive joint marginal; no domination of $nu$ by the full glued measure is asserted. The full assignment on $P$ is inserted as a layer so that the attachment uses exactly the information in the uncertainty functional.
  Write $rho = rho_mu$ and let $m$ be its mass. If $z in P$, each assignment on $P$ determines the label at $z$, so $E_nu \( z divides P \) = 0$ and the assertion is immediate. Otherwise, use the vertex sets
  $ { y } \, med B_0 ∩ B_1 \, dots.h \, B_(r - 1) ∩ B_r \, med { z } \, $
  as indices for layers: the states in the layer indexed by a set $R$ are the assignments in $Omega_R$. Insert one additional layer consisting of the full assignment on $P$. This layer goes between the incoming and outgoing intersections at $P$; when $P = B_0$, it goes immediately after the $y$ layer. The vertex sets indexing consecutive layers are contained in a single bag.
  Under $rho \/ m$ these layers form a Markov chain. Indeed, the additional layer samples the rest of $P$ conditional on its incoming assignment, and its outgoing intersection is then a restriction of the full $P$ assignment. Summing over the additional coordinates gives exactly the original intersection transition. Every layer has at most $2^k$ states. All indexing vertex sets are nonempty by Lemma 2, so complementation acts on their assignment spaces without fixed points. Symmetry of the bag laws preserves the chain law. The mass-$m$ capacity on each consecutive pair is the corresponding projection of a bag measure.
  We construct a measure $lambda$ on paths in these layers. Take the suffix measure, beginning with the full $P$ layer, to be the projection of $nu$. For its assignment $b$ on $P$, attach an independent prefix with the conditional probability law under $rho \/ m$ given that same full assignment. Put
  $ m_b = rho \( omega \|_P = b \) \, #h(2em) n_b = nu \( omega \|_P = b \) . $
  The assumed domination at $P$ gives $0 lt.eq n_b lt.eq m_b$. For any prefix event $F$,
  $ lambda \( F \) = sum_(b : m_b > 0) n_b Pr_rho \[ F divides omega \|_P = b \] lt.eq sum_(b : m_b > 0) m_b Pr_rho \[ F divides omega \|_P = b \] = rho \( F \) . $
  Here and below conditional probabilities under $rho$ mean those under $rho \/ m$. Assignments with $m_b = 0$ have $n_b = 0$ and require no conditional law. Thus every prefix edge respects its original capacity. On the suffix, the law is the corresponding projection of $nu$; because the vertex sets indexing consecutive layers lie within a single suffix bag, its edges also respect the capacities. The attachment is consistent on all overlapping vertex labels: a vertex occurring on both sides of $P$ must occur in $P$, by the connectedness of its occurrence subtree.
  For $i in { 0 \, 1 }$ and $b in Omega_P$, set
  $ a_i \( b \) = nu \( omega \|_P = b \, omega \( z \) = i \) \, #h(2em) q_b = Pr_rho \[ omega \( y \) = 0 divides omega \|_P = b \] . $
  For $m_b = 0$, set $q_b = 0$; both $a_i \( b \)$ then vanish. The construction gives
  $ lambda \( omega \( y \) eq.not omega \( z \) \) & = sum_b #scale(x: 120%, y: 120%)[\(] q_b a_1 \( b \) + \( 1 - q_b \) a_0 \( b \) #scale(x: 120%, y: 120%)[\)]\
 & gt.eq sum_b min { a_0 \( b \) \, a_1 \( b \) } = E_nu \( z divides P \) . $
  Restrict $lambda$ first to paths with endpoint labels $\( 0 \, 1 \)$, and then to paths with endpoint labels $\( 1 \, 0 \)$. Each restriction defines a feasible flow: its arc masses satisfy conservation at intermediate states and are dominated by the original arc capacities. Apply Theorem 4 to the first flow and to the complemented second flow, normalizing all masses by $m$. After multiplying back by $m$ and adding, we obtain
  $ lambda \( omega \( y \) eq.not omega \( z \) \) lt.eq C \( 2^k \) rho \( omega \( y \) eq.not omega \( z \) \) = C \( 2^k \) D_mu \( y \, z \) . $
  Together with the preceding lower bound and (2.5), this proves the Proposition. ◻
]

=== 2.3 Threshold sweeps and height tests <threshold-sweeps-and-height-tests>

We now turn real functions into the common submeasures required by Proposition 5. The two tests below use either a gap between function values or a pair of opposite perturbations that agree on the testing set.

Fix a cutoff $M > 0$. For a function $F : V arrow.r \[ - M \, M \]$, let $sigma_F^M$ be the labeled cut measure obtained by pushing Lebesgue measure on $\[ - M \, M \]$ through

$ t mapsto omega_t \, #h(2em) omega_t \( v \) = upright(bold(1))_({ F \( v \) > t }) . $

Its total mass is $2 M$. Its symmetric version is $\( sigma_F^M \)^(upright("sym"))$, and both versions have separation mass

#[#set math.equation(numbering: n => "(2.9)")
 $ D_(sigma_F^M) \( u \, v \) = \| F \( u \) - F \( v \) \| . $ <eq:sweep-separation>]

We say that $F$ has #emph[sweep margin] at least $a > 0$ if $\| F \( v \) \| lt.eq M - a$ for every $v in V$. The constant assignments produced near either cutoff are retained as part of the measure.

#thm([Lemma 2.5.])[
  (Height-gap test).  #emph[Let $P subset.eq V$, $z in V$, and $t > 0$. Suppose that $F \( z \)$ has distance at least $t$ from both endpoints of $\[ - M \, M \]$ and that 
$ \| F \( z \) - F \( s \) \| gt.eq t #h(2em) \( s in P \) . $

 For $nu = \( sigma_F^M \)^(upright("sym"))$, one has 
$ E_nu \( z divides P \) gt.eq t . $

]
] <lem:height-gap>

#proof[
  No value $F \( s \)$ with $s in P$ lies in the open interval $\( F \( z \) - t \, F \( z \) + t \)$. The assignment on $P$ is therefore constant throughout this threshold interval. Its two halves each have length $t$, and the label at $z$ is opposite on the two halves. For that fixed assignment on $P$, the unsymmetrized sweep gives mass at least $t$ to each label at $z$. Thus $E_(sigma_F^M) \( z divides P \) gt.eq t$, and (2.7) proves the result. ◻
]

#thm([Lemma 2.6.])[
  (Uncertainty at a paired launch).  #emph[Let $A subset.eq V$ and let $f \, g : V arrow.r bb(R)$ satisfy $g \|_A = 0$ and $f + g \, f - g in \[ - M \, M \]^V$. Set 
$ nu = \( sigma_(f + g)^M \)^(upright("sym")) + \( sigma_(f - g)^M \)^(upright("sym")) . $

 Then, for every $z in V$, 
#[#set math.equation(numbering: n => "(2.10)")
 $ E_nu \( z divides A \) gt.eq 2 \| g \( z \) \| . $ <eq:launch-uncertainty>]

 Moreover, for every $u \, v in V$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ D_nu \( u \, v \) & = \| f \( u \) - f \( v \) + g \( u \) - g \( v \) \|\
 & quad + \| f \( u \) - f \( v \) - g \( u \) + g \( v \) \| gt.eq 2 \| g \( u \) - g \( v \) \| . $ <eq:paired-separation>]

]
] <lem:launch-gap>

#proof[
  The two height functions agree on $A$. For each threshold strictly between $f \( z \) - g \( z \)$ and $f \( z \) + g \( z \)$, their assignments on $A$ consequently agree and their labels at $z$ are opposite. For each $b in Omega_A$, let $I_b$ be the set of thresholds in this interval giving assignment $b$ on $A$. In the sum of the two unsymmetrized sweeps, each of the two possible labels at $z$, together with assignment $b$ on $A$, has mass at least the Lebesgue measure of $I_b$. Summing over $b$ gives uncertainty at least the length of the whole interval, namely $2 \| g \( z \) \|$. The sum of the symmetric sweeps is the symmetrization of their sum, so (2.7) proves (2.10). Formula (2.9) proves the equality in (2.11); the final inequality follows from $\| a + b \| + \| a - b \| gt.eq 2 \| b \|$. ◻
]

The two tests have the following consequences for the glued metric. Suppose $g \|_A = 0$ and the symmetric sweep measures of $f + g$ and $f - g$ have a sum $nu$ satisfying $nu \|_B lt.eq mu_B$ at every bag on a path segment from a bag $A$ to a bag containing $z$. If $A$ lies on the path from a bag containing $y$ to that terminal bag, then Proposition 5 and Lemma 7 give

#[#set math.equation(numbering: n => "(2.12)")
 $ D_mu \( y \, z \) gt.eq 2 b_k \| g \( z \) \| . $ <eq:launch-transport>]

In particular, $\| g \( z \) \| gt.eq d \( z \, A \) \/ 2$ gives $D_mu \( y \, z \) gt.eq b_k d \( z \, A \)$.

Likewise, suppose a single function’s symmetric sweep has trace dominated by the bag laws on the segment beginning at a testing bag $P$ and ending at a bag containing $z$, where $P$ lies on the path from a bag containing $y$ to that terminal bag. If auxiliary randomness produces a height gap $t$ as in Lemma 6 with probability at least $p$, and the trace domination holds on that event, apply the two estimates to each realization in the event. Averaging the pointwise inequality gives

#[#set math.equation(numbering: n => "(2.13)")
 $ bb(E) D_mu \( y \, z \) gt.eq b_k p t . $ <eq:averaged-height-test>]

The gap event may depend on the function values; the requirement is that the tested sweep remain a common submeasure throughout the specified segment on that event. Section 3 constructs bag laws with precisely this persistence property.

== 3 Particles and reservations <sec:particles>

We next construct consistent bag laws while preserving selected cut measures along specified portions of the decomposition. The basic operation changes two functions without changing their combined trace on the current bag. A uniform bound on all functions survives arbitrarily many such operations.

Throughout this section, let $Delta = "diam" \( V \) > 0$, and fix a rooted tree decomposition whose bags have size at most $k$, where $k gt.eq 2$. A #emph[particle] is a real function on all of $V$. We maintain a list $F_1 \, dots.h \, F_N$ of particles, initially all zero. The sweep $sigma_F^M$ and symmetrization of a cut measure have the meanings given in Section 2; in particular, $sigma_F^M$ has mass $2 M$.

If a common cutoff $M$ contains all current particle heights, the measure carried by the list has trace

$ sum_(i = 1)^N \( sigma_(F_i)^M \)^(upright("sym"))\|_P $

on a bag $P$. The update below preserves this entire trace, including the constant assignments. We will choose one cutoff that remains valid through every update after proving uniform bounds on the heights.

#thm([Lemma 3.1.])[
  (Affine trace update).  #emph[Let $P subset.eq V$, and suppose that particles $F_1 \, F_2$ admit a common weak increasing order on $P$. Put $f = \( F_1 + F_2 \) \/ 2$, and let $g : V arrow.r bb(R)$ vanish on $P$. If the four functions $F_1 \, F_2 \, f + g \, f - g$ take values in $\[ - M \, M \]$, then 
$ \( sigma_(F_1)^M + sigma_(F_2)^M \)\|_P = \( sigma_(f + g)^M + sigma_(f - g)^M \)\|_P . $

 The equality remains true after symmetrization. For nonempty $P$, it includes the masses of both constant assignments on $P$.]
] <lem:trace-update>

#proof[
  Write $P = { p_1 \, dots.h \, p_r }$ in a common weak increasing order. For a function $F$ with that order, sweeping the labels $upright(bold(1))_({ F \( p \) > t })$ gives, successively, the monotone assignments with masses
  $ F \( p_1 \) + M \, #h(2em) F \( p_(i + 1) \) - F \( p_i \) quad \( 1 lt.eq i < r \) \, #h(2em) M - F \( p_r \) . $
  Every other assignment has mass zero. These expressions are affine in the height vector, including the first and last expressions for the constant assignments. Equal heights merely give zero masses. Thus the sum of the traces for $F_1$ and $F_2$ is twice the trace for $f$. Since $f + g$ and $f - g$ both equal $f$ on $P$, the assertion follows. For $P = diameter$ there is just one assignment, of mass $2 M$ per sweep, and the same conclusion holds. Symmetrization and restriction are linear operations, so they preserve the identity. ◻
]

An #emph[update at $P$] replaces two particles having a common weak order on $P$ by

$ F_i \, F_j med mapsto med f + g \, f - g \, #h(2em) f = frac(F_i + F_j, 2) \, #h(2em) g \|_P = 0 . $

We call $g$ the perturbation. The empty set is an allowed interface before the root bag is processed. Fix constants $L \, B > 0$ and require every perturbation to satisfy

$ "Lip" \( g \) lt.eq L \, #h(2em) sup_(v in V) \| g \( v \) \| lt.eq B Delta . $

The choices $L = B = 3$ will suffice in all our applications. Keeping the two parameters separate makes clear which bound is used at each step.

Applying the triangle inequality after each update would increase the maximum Lipschitz bound by $L$ at every step. Instead, for each fixed $u eq.not v$, we control all the normalized differences $\( F_i \( u \) - F_i \( v \) \) \/ \( L d \( u \, v \) \)$ together. The sum over any $r$ indices is bounded by $r \( N - r \)$. Averaging the bounds for $r - 1$ and $r + 1$ leaves exactly one unit for the new perturbation, so the bound does not increase with the number of updates.

#thm([Lemma 3.2.])[
  (Uniform particle bounds).  #emph[After any finite sequence of updates starting from zero particles, 
$ "Lip" \( F_i \) lt.eq L \( N - 1 \) \, #h(2em) \| F_i \( v \) \| lt.eq B \( N - 1 \) Delta quad \( 1 lt.eq i lt.eq N \, med v in V \) . $

 These bounds hold for arbitrary choices of the updated pairs and perturbations subject to the displayed bounds, regardless of the number of updates.]
] <lem:particle-bounds>

#proof[
  We first prove a numerical invariant. Suppose a vector $a = \( a_1 \, dots.h \, a_N \)$ starts at zero and is changed by operations of the form
  $ a_i \, a_j med mapsto frac(a_i + a_j, 2) + e \, frac(a_i + a_j, 2) - e \, #h(2em) \| e \| lt.eq 1 . $
  At every stage its total is zero, and
  $ sum_(i in I) a_i lt.eq \| I \| \( N - \| I \| \) #h(2em) upright("for every ") I subset.eq { 1 \, dots.h \, N } . $
  For the induction, put $Q_r = r \( N - r \)$, including $Q_0 = Q_N = 0$. The assertion is true initially. An update leaves the sum over $I$ unchanged when $I$ contains both updated indices or neither. If $I$ contains exactly one of them, write $S$ for the remaining $r - 1$ indices, where $r = \| I \|$. Its new sum is at most
  $ 1 / 2 (sum_(h in S) a_h + sum_(h in S union { i \, j }) a_h) + 1 lt.eq 1 / 2 \( Q_(r - 1) + Q_(r + 1) \) + 1 = Q_r . $
  This proves the invariant. Singleton subsets give $a_i lt.eq N - 1$; their complements, together with the zero total, give $a_i gt.eq - \( N - 1 \)$.
  For distinct $u \, v$, apply the invariant to
  $ a_i = frac(F_i \( u \) - F_i \( v \), L thin d \( u \, v \)) . $
  The corresponding perturbation is $e = \( g \( u \) - g \( v \) \) \/ \( L thin d \( u \, v \) \)$, of absolute value at most one. This proves the Lipschitz bound. For each fixed $v$, apply the same invariant to $a_i = F_i \( v \) \/ \( B Delta \)$, with $e = g \( v \) \/ \( B Delta \)$, to obtain the value bound. The argument applies separately to every branch of a copied particle history. ◻
]

A #emph[reservation] freezes a pair of particles: neither particle may be used in another update while that reservation is in force. Releasing a reservation makes its particles available again; it does not remove them from the list. A reservation may be continued into any prescribed children using copies of the same pair. At a branching bag, the whole list and all reservation records are copied separately for each child. Consequently the number of simultaneous reservations is counted within one copy of the memory, not across different branches.

The following proposition packages the construction. It allows an arbitrary finite schedule of launches and releases; applications will choose their schedules from the graph and decomposition alone. The parameter $q$ counts only pairs held at the same time in one copy of the list. This is the quantity that must be fixed before choosing any geometric scale parameters.

#thm([Proposition 3.3.])[
  (Realization by particles).  #emph[Suppose a finite schedule requires at most $q$ simultaneous reserved pairs in each memory copy, including any temporary reservation made before another is released. Updates may be made at the current bag, or on a child-specific copy at its parent bag before moving to the child. Before processing the root, updates at the empty interface are also allowed. Every update uses a perturbation satisfying the bounds above and vanishing on its interface.]
  #emph[Choose 
$ N = 2 q + k ! + 2 \, #h(2em) M = #scale(x: 120%, y: 120%)[\(] B \( N - 1 \) + 2 #scale(x: 120%, y: 120%)[\)] Delta . $

 Then all requested updates and reservations can be carried out. They produce symmetric bag measures $mu_t$ with the following properties.]
  + #emph[Each $mu_t$ has the same total mass $m = 2 N M$, and neighboring bag measures have equal traces on their intersection.]
  + #emph[Every particle height is at distance at least $2 Delta$ from each endpoint of the sweep interval $\[ - M \, M \]$.]
  + #emph[The pseudometric $D_mu$ obtained by Markov gluing satisfies 
$ D_mu \( u \, v \) lt.eq U thin d \( u \, v \) quad upright("for all ") u \, v in V \, #h(2em) U = N L \( N - 1 \) . $

]
  + #emph[If a pair is reserved from a launch bag through a later bag on a descending path, its fixed symmetric two-particle cut measure has trace dominated by $mu_t$ at every bag on that segment. The segment includes the launch and release bags, even when the particles are reused at the release bag. A reservation launched at the empty interface has the same property from the root onward.]
  #emph[The statements hold for each realization of any auxiliary randomness. For measurable randomized choices, taking expectations also gives an $L_1$ pseudometric with the same upper bound.]
] <prop:particle-realization>

#proof[
  At every stage at most $2 q$ particles are reserved, leaving at least $k ! + 2$ free particles. For a bag of size $r lt.eq k$, choose a weak increasing listing for each free particle, breaking ties by a fixed ordering of the vertices. There are at most $r ! lt.eq k !$ such listings, so two free particles have the same listing. They are eligible for the next update. At the empty interface every pair is eligible. This also permits updates that do not initiate a reservation. Fix an ordering of particle pairs and always choose the first eligible pair using the pre-launch memory, before sampling any fresh perturbation randomness for that launch.
  Lemma 9 applies to each branch history, including the operations performed on copies at the parent bag. In particular, the stated choice of $M$ gives the asserted $2 Delta$ margins at every stage. It is fixed before the construction begins and therefore is the same for every particle, bag, and branch.
  Whenever the current bag is $B_t$, let its recorded law be
  $ mu_t = sum_(i = 1)^N \( sigma_(F_i)^M \)^(upright("sym"))\|_(B_t) . $
  Updates at $B_t$ leave this measure unchanged by Lemma 8, and releasing reservations makes no change to the functions. Thus it is immaterial whether this law is recorded before or after any operations at that bag. Preliminary operations at the empty interface take place before the root law is recorded.
  For a child $t'$ of $t$, copy the current memory and perform any child-specific operations while still at $B_t$. Its trace on $B_t$ remains $mu_t$. Move that copy to $B_(t')$ and record its law there. The two laws agree on $B_t ∩ B_(t')$, since both are restrictions of the same total cut measure carried by this copy before its operations at $B_(t')$. Those subsequent operations preserve the child law. This proves consistency on every decomposition edge. Each summand has mass $2 M$, both restriction and symmetrization preserve mass, and hence every bag law has mass $2 N M$. The construction of Section 2 therefore supplies the glued cut pseudometric $D_mu$.
  If $u v$ is a graph edge, choose a bag containing both endpoints. The glued law has the prescribed marginal on that bag. Sweeping separates $u$ and $v$ with mass $\| F_i \( u \) - F_i \( v \) \|$, and symmetrization preserves that mass. Consequently, by Lemma 9,
  $ D_mu \( u \, v \) = sum_(i = 1)^N \| F_i \( u \) - F_i \( v \) \| lt.eq N L \( N - 1 \) d \( u \, v \) lt.eq U ell \( u v \) . $
  Applying the triangle inequality along a shortest graph path proves $D_mu \( u \, v \) lt.eq U d \( u \, v \)$ for arbitrary vertices.
  For the last assertion, denote the two functions at launch by $H_1 \, H_2$ and set
  $ nu = \( sigma_(H_1)^M \)^(upright("sym")) + \( sigma_(H_2)^M \)^(upright("sym")) . $
  They remain unchanged while reserved, including in each child copy where the reservation continues. At any bag in that portion of the path, their two traces are summands of the current total trace, so $nu \|_(B_t) lt.eq mu_t$. At the launch bag this statement can be read just after the launching update; at the release bag it can be read just before the release. All other operations at either bag preserve the total trace. Thus the same domination holds for its recorded law even if the pair is immediately reused there. The case of a reservation started before the root is identical from its first bag onward.
  All bounds and trace identities hold for each realization of the auxiliary randomness. For measurable choices, expectation of the resulting finite cut measures realizes $bb(E) D_mu$ as an $L_1$ pseudometric, as in Section 2, and preserves the displayed upper inequality. ◻
]

The number of updates and the total number of reservations over the whole tree do not occur in $U$. With the common choice $L = B = 3$, one may use the explicit bounds

$ "Lip" \( F_i \) lt.eq 3 \( N - 1 \) \, #h(2em) M = \( 3 N - 1 \) Delta \, #h(2em) U = 3 N \( N - 1 \) . $

These constants depend only on $k$ and the maximum simultaneous reservation count $q$.

== 4 Separating pairs in a common bag <sec:perturbations>

Fix an integer $k gt.eq 2$. Throughout this section, $\( V \, d \)$ is the shortest-path metric of a finite connected graph with positive edge lengths and with a tree decomposition whose bags are nonempty and have size at most $k$. Write $Delta = "diam" \( V \, d \)$, and assume $\| V \| gt.eq 2$. All constants in this section depend only on $k$.

We first apply the particle construction to pairs of vertices that share a bag. At each bag, only boundedly many scales are needed to represent its pairwise distances. Reserving a particle pair at each of these scales will therefore fit into bounded memory. Padded partitions supply the perturbations used at each launch; their padding guarantee will also be used in the anchor construction of Section 5.

We use the following consequence of the padded-decomposition theorem for bounded-treewidth graphs [9] Theorem 1.2 and Definition 2.1. The diameter in its statement is measured in the original metric, sometimes called weak diameter.

#thm([Theorem 4.1.])[
  (Padded partitions).  #emph[There are constants $alpha in \( 0 \, 1 \/ 8 \]$ and $pi in \( 0 \, 1 \]$ such that, for every metric as above and every $r > 0$, there is a random partition $cal(P)$ of $V$ satisfying 
$ "diam" \( C \) lt.eq r quad \( C in cal(P) \) \, #h(2em) bb(P) #scale(x: 120%, y: 120%)[\[] B_d \( x \, alpha r \) subset.eq cal(P) \( x \) #scale(x: 120%, y: 120%)[\]] gt.eq pi quad \( x in V \) . $

 Here $cal(P) \( x \)$ denotes the part containing $x$.]
] <thm:padded>

To match parameters, the cited scheme has constants $beta_t > 0$ and $delta_t > 0$ for each treewidth $t gt.eq 2$, and at scale $r$ it gives padding probability at least $exp \( - beta_t gamma \)$ whenever $0 lt.eq gamma lt.eq delta_t$. Put $t_max = max { 2 \, k - 1 }$ and choose

$ alpha = min { 1 \/ 8 \, min_(2 lt.eq t lt.eq t_max) delta_t #scale(x: 120%, y: 120%)[}] \, #h(2em) pi = min_(2 lt.eq t lt.eq t_max) exp \( - beta_t alpha \) . $

These are positive constants depending only on the bag-size bound $k$.

For completeness, the treewidth-one case also follows without interpreting the source’s logarithmic bound at one. Attach a positive-length triangle at one vertex. The enlarged graph has treewidth two and preserves all original distances. Restricting its partition parts to the original vertices preserves both weak diameter and the padding event. For a fixed bound $k$, take common positive constants over the finitely many possible treewidth values.

We fix $alpha$ and $pi$ from Theorem 11 for the rest of the proof. For a subset $C subset.eq V$, we interpret $d \( z \, V \\ C \) = + oo$ when $C = V$; this expression will always be clipped by a finite constant.

#thm([Lemma 4.2.])[
  (Disjoint nonnegative bumps).  #emph[Let $E_1 \, dots.h \, E_m$ be pairwise disjoint subsets of a metric space. For each $i$, let $psi_i$ be a nonnegative $1$-Lipschitz function vanishing outside $E_i$, and let $u_i in \[ 0 \, 1 \]$. Then $sum_i u_i psi_i$ is $1$-Lipschitz.]
] <lem:disjoint-bumps>

#proof[
  Within one set $E_i$, the assertion follows from the Lipschitz bound for $u_i psi_i$. If $z \, w$ lie in different sets, the value of the sum at either point is nonnegative and at most $d \( z \, w \)$, since each bump vanishes at the other point. Their difference is therefore at most $d \( z \, w \)$ in absolute value. The same argument covers points outside all the sets. ◻
]

=== 4.1 Retaining a scale for pairs in a common bag <retaining-a-scale-for-pairs-in-a-common-bag>

There can be many distance scales in the graph, but a bag with at most $k$ vertices uses only a bounded number. We keep one reserved pair at each scale used by the current bag and release it when that scale is no longer needed. A scale first appearing at a child is launched at its parent, where its perturbation preserves the recorded parent law.

#thm([Proposition 4.3.])[
  (The co-bag embedding).  #emph[For every rooted tree decomposition with nonempty bags of size at most $k$, there is an $L_1$ pseudometric $D_(upright("bag"))$ on $V$ and constants $U_(upright("bag")) < oo$ and $a_(upright("bag")) > 0$, depending only on $k$, such that 
$ D_(upright("bag")) \( u \, v \) lt.eq U_(upright("bag")) d \( u \, v \) quad \( u \, v in V \) \, $

 and 
$ D_(upright("bag")) \( u \, v \) gt.eq a_(upright("bag")) d \( u \, v \) quad upright("whenever ") u \, v upright(" belong to a common bag") . $

 One may take 
$ R = 4 binom(k, 2) \, #h(2em) N = 2 R + k ! + 2 \, #h(2em) U_(upright("bag")) = 3 N \( N - 1 \) \, #h(2em) a_(upright("bag")) = frac(pi alpha, 64) . $

]
] <prop:cobag>

#proof[
  For a bag $B$, let $cal(A)_B$ be the set of scales $s = 2^j$ for which some distinct $u \, v in B$ satisfy
  $ s \/ 2 lt.eq d \( u \, v \) lt.eq 4 s . $
  Call these scales active at $B$. A fixed positive distance can belong to $\[ s \/ 2 \, 4 s \]$ for at most four powers of two $s$: equivalently, $s in \[ d \( u \, v \) \/ 4 \, 2 d \( u \, v \) \]$, an interval with endpoint ratio eight. Consequently $\| cal(A)_B \| lt.eq R$.
  The activity interval $\[ s \/ 2 \, 4 s \]$ is wider than the interval $\[ s \, 2 s \]$ used to choose a scale for a tested pair. This slack has a geometric purpose: if a pair at distance between $s$ and $2 s$ occurs later in a consecutive run of bags where $s$ is active, at least one endpoint must lie away from the inactive launch bag. A padded bump can then have positive amplitude at that endpoint while vanishing at the other. Retaining its pair carries that separation to the bag containing the tested vertices.
  We use the particle construction of Proposition 10, reserving one pair of particles for each active scale. Initially all $N$ particles vanish. At the root, launch a pair for each active scale using an empty interface, and then measure the root trace. For a child of a bag $A$, make a separate copy of the parent’s list. First drop the reservations of all scales that are inactive at this child; retain those active at both bags. Then launch the child’s newly active scales, with every update performed at $A$, before moving to the child. This order keeps at most $R$ pairs reserved at any time. It also leaves more than $k !$ particles free whenever an update is required, by the choice of $N$. Different children use their own copies. A retained pair is unchanged along every consecutive run of bags where its scale is active.
  Here is the perturbation used for a new scale $s$. Put $r = s \/ 16$, and sample a partition $cal(P)$ at scale $r$ from Theorem 11. For $C in cal(P)$ give an independent uniform coefficient $U_C in \[ 0 \, 1 \]$ to the bump
  $ psi_C \( z \) = cases(delim: "{", min { d \( z \, A \) \, d \( z \, V \\ C \) \, r } \, & z in C \,, 0 \, & z in.not C .) #h(2em) g \( z \) = sum_(C in cal(P)) U_C psi_C \( z \) . $
  For a root launch with empty interface, omit the term $d \( z \, A \)$. All these choices are fresh. Lemma 12 shows that $g$ is $1$-Lipschitz. It vanishes on the launch bag when that bag is nonempty. Since the scale is active at some bag, $s lt.eq 2 Delta$, and hence $0 lt.eq g lt.eq r lt.eq Delta \/ 8$.
  At each launch use two free particles with a common weak sorting order on the interface, replace them by $f + g$ and $f - g$ as in Lemma 8, and reserve them. An empty interface imposes no sorting constraint. All updates have $"Lip" \( g \) lt.eq 3$ and $\| g \| lt.eq 3 Delta$. Proposition 10 therefore gives consistent bag measures and a Markov-glued cut metric with upper bound $3 N \( N - 1 \) d$. Average over all the preparatory randomness to obtain $D_(upright("bag"))$; it is still an $L_1$ pseudometric with that upper bound. Dropping a reservation does not delete a particle, and all updates at a parent preserve its full trace, so this procedure also covers branching and the ending of active runs.
  It remains to prove the lower bound. Fix distinct $u \, v$ in a common bag $B$, and choose a dyadic scale $s$ with $s lt.eq d \( u \, v \) < 2 s$. This scale is active at $B$. Trace its reserved pair backwards to the start of its active run. Either this was a root launch with empty interface, or it was launched at a preceding bag $A$ where $s$ was inactive.
  In the latter case at least one of $u \, v$, say $w$, has $d \( w \, A \) gt.eq s \/ 8$. Indeed, if both distances were less than $s \/ 8$, nearest points $a \, b in A$ would satisfy
  $ 3 / 4 s < d \( a \, b \) < 9 / 4 s \, $
  by the triangle inequality and $s lt.eq d \( u \, v \) < 2 s$. In particular $a eq.not b$ and $s$ would be active at $A$, a contradiction. For an empty-interface launch take either endpoint as $w$.
  Let $w'$ be the other endpoint. In the partition sampled at this launch, $w \, w'$ lie in different parts, since $d \( w \, w' \) gt.eq s > r$. With probability at least $pi$, the part $C$ containing $w$ contains $B_d \( w \, alpha r \)$. On this event its bump amplitude $a = psi_C \( w \)$ is at least $alpha r$: the distance-to-$A$ cap, when present, is at least $s \/ 8 = 2 r$, and the other caps are also at least $alpha r$. Conditional on the partition and every coefficient other than $U_C$, the value $g \( w' \)$ is fixed and $g \( w \) = a U_C$. For every real $b$ and $a > 0$,
  $ integral_0^1 \| a t - b \| thin d t gt.eq a \/ 4 . $
  Consequently
  $ bb(E) thin \| g \( u \) - g \( v \) \| gt.eq frac(pi alpha r, 4) = frac(pi alpha s, 64) . $
  The reserved particles still supply their two sweep measures in the trace on $B$. By Equation (2.11), their separation of $u \, v$ is at least $2 \| g \( u \) - g \( v \) \|$, irrespective of the launch average $f$. The glued metric has the prescribed trace on $B$, and all other cut measures are nonnegative. Therefore
  $ D_(upright("bag")) \( u \, v \) gt.eq frac(pi alpha s, 32) gt.eq frac(pi alpha, 64) thin d \( u \, v \) . $
  For $u = v$ the required inequalities are immediate. This proves the proposition. ◻
]

== 5 The anchor construction <sec:anchors>

The common-bag pseudometric is one part of the lower bound. We now construct a second cut pseudometric $D_(upright("anc"))$ by launching particle pairs at bag occurrences and retaining only boundedly many pairs along each descending path. An #emph[anchor] is a bag occurrence together with the reserved pair launched there. Distinct occurrences of the same vertex set give distinct possible anchors. We assume $\| V \| gt.eq 2$ and use nonempty bags of size at most $k$; for a one-vertex graph both pseudometrics are zero.

At a launch bag $A$, the update produces $f_A + g_A$ and $f_A - g_A$, where $f_A$ is the average of the selected particles, and $g_A$ vanishes on $A$ and is at least $d \( thin dot.op thin \, A \)$. If $A$ lies on the bag path between two tested vertices and its pair survives to the terminal bag, the launch-uncertainty test forces separation. An older anchor may instead lie above the least common ancestor of the two endpoint bags. Its launch bag is then unavailable for this test. If its reservation reaches the terminal bag, we can use a later testing bag on the path and seek a height gap there.

We obtain these later height gaps from two independent parts of $g_A$: a random multiple of $h_A = d \( thin dot.op thin \, A \)$, and a smaller localized noise function. For a tested endpoint $x$ and a vertex $s$ of a testing bag, the first coefficient varies their height difference when $h_A \( x \) - h_A \( s \)$ is appreciable. A local coefficient varies the height at $x$ without changing it at $s$ outside the bump’s support. The next lemma supplies both variations with uniform Lipschitz control. We then give the deterministic retention rule. The testing bags used in Section 6 will be chosen from the metric and that rule, independently of the launch variables.

=== 5.1 Two independent sources of launch noise <two-independent-sources-of-launch-noise>

#thm([Lemma 5.1.])[
  (Ordinary launch noise).  #emph[Let $A subset.eq V$ be nonempty, put $h \( z \) = d \( z \, A \)$, and let $0 < eta < 1 \/ 4$. One can sample a random function 
$ g = xi h + v \, $

 using randomness independent of any previously sampled data. The function $v$ is constructed by first sampling a finite indexed family of nonnegative functions $\( phi_i \)_(i in cal(I))$ on $V$, called bumps, and then setting 
$ v = sum_(i in cal(I)) U_i phi_i . $

 Conditional on the bump family, the coefficients $U_i$ are independent and uniform on $\[ 0 \, 1 \]$. The following properties hold:]
  + #emph[$xi$ is uniform on $\[ 1 \, 2 \]$ and independent of the bump family and all its coefficients; $v$ is $1$-Lipschitz and satisfies $0 lt.eq v lt.eq eta h \/ 2$. Consequently $g \|_A = 0$, $"Lip" \( g \) lt.eq 3$, and 
$ h lt.eq g lt.eq 5 / 2 h lt.eq 5 / 2 Delta . $

]
  + #emph[Set $c = alpha \/ 8$ and $rho = pi \/ 2$. For each fixed $x$ with $D_0 = h \( x \) > 0$, there is an event of probability at least $rho$, determined by the bump family, on which an index $i \( x \) in cal(I)$, also determined by that family, selects a bump $phi_x = phi_(i \( x \))$ satisfying 
$ phi_x \( x \) gt.eq c eta D_0 \, #h(2em) phi_x \( z \) = 0 quad upright("if ") d \( x \, z \) > 4 eta D_0 . $

 Write $U_x = U_(i \( x \))$. Conditional on the bump family, $U_x$ is uniform and independent of $xi$, of the other bump coefficients, and of all previously sampled data. In particular, $v = v^(\\ x) + U_x phi_x$, where the remaining coefficients defining $v^(\\ x)$ are independent of $U_x$.]
  #emph[Different vertices may select the same bump and coefficient. The constants in these assertions are independent of $eta$, $A$, the number of vertices, and the ratio of the edge lengths. Only finitely many random partitions and coefficients are required.]
] <lem:ordinary-noise>

#proof[
  We divide the positive values of $h$ into randomly shifted dyadic bands and put nonnegative bumps in partition parts within each band. Conditional on their locations, we give the bumps independent coefficients. Disjoint supports keep their sum Lipschitz. A vertex well inside its band and its partition part then has one coefficient whose amplitude is a fixed fraction of $eta h \( x \)$.
  If $h$ vanishes everywhere, take $v = 0$ and sample $xi$ as stated. Otherwise let $h_min$ and $h_max$ be the smallest positive and the largest values of $h$. Sample $lambda$ uniformly on $\[ 0 \, 1 \)$, and put
  $ I = { floor.l log_2 h_min floor.r - 1 \, dots.h \, floor.l log_2 h_max floor.r } \, #h(2em) m = floor.l log_2 eta floor.r . $
  For $j in I$, define the random band and the fixed scale
  $ W_j = { z : 2^(j + lambda) lt.eq h \( z \) < 2^(j + 1 + lambda) } \, #h(2em) r_j = 2^(j + m) . $
  The bands partition ${ h > 0 }$. Independently of $lambda$, sample a partition $cal(P)_j$ at scale $r_j$ from Theorem 11, for each $j in I$. Thus the partition scales are fixed powers of two, not random functions of $lambda$. Consequently, conditioning on the band offset leaves each sampled partition with its original padding guarantee.
  For each nonempty $E = W_j ∩ C$, $C in cal(P)_j$, set
  $ phi_(j \, C) \( z \) = cases(delim: "{", min { r_j \/ 2 \, d \( z \, V \\ E \) } \, & z in E \,, 0 \, & z in.not E .) $
  Conditional on these locations, give the bumps independent uniform coefficients $U_(j \, C) in \[ 0 \, 1 \]$, and define
  $ v \( z \) = sum_(j \, C) U_(j \, C) phi_(j \, C) \( z \) . $
  This is a finite measurable construction: there are finitely many bands and partitions of the finite set $V$, and band memberships are measurable functions of $lambda$. If desired, the coefficients can be sampled in advance for every possible pair $\( j \, C \)$ with $C subset.eq V$.
  The nonempty sets $E$ are disjoint, and each bump is nonnegative and $1$-Lipschitz on all of $V$. Lemma 12 therefore shows that $v$ is $1$-Lipschitz, including at points where $h = 0$. For $z in W_j$,
  $ 0 lt.eq v \( z \) lt.eq r_j \/ 2 lt.eq eta 2^j \/ 2 lt.eq eta h \( z \) \/ 2 . $
  Sampling $xi$ independently gives the first assertion.
  Fix $x$ with $D_0 = h \( x \) > 0$, and let $j$ be its band index. The event
  #[#set math.equation(numbering: n => "(*)")
   $ log_2 D_0 - \( j + lambda \) in \[ 1 \/ 4 \, 3 \/ 4 \] $]
  has probability $1 \/ 2$. On this event, the value $D_0$ is at distance greater than $D_0 \/ 8$ from both numerical endpoints of its band. Since $h$ is $1$-Lipschitz, the ball $B_d \( x \, D_0 \/ 8 \)$ is contained in $W_j$. Also $r_j lt.eq eta D_0$, so $alpha r_j < D_0 \/ 8$. Conditional on $lambda$, the probability that $B_d \( x \, alpha r_j \)$ lies in its part $C in cal(P)_j$ is at least $pi$. On this padding event together with $\( * \)$,
  $ phi_(j \, C) \( x \) gt.eq alpha r_j . $
  Because $2^m > eta \/ 2$ and $D_0 < 2^(j + 2)$, we have $r_j > eta D_0 \/ 8$. Thus the last display is at least $c eta D_0$ with $c = alpha \/ 8$. The joint event has probability at least $rho = pi \/ 2$ and depends only on the locations. Finally, any point in the support of this bump is in the same partition part as $x$, and hence is at distance at most $r_j lt.eq eta D_0$ from $x$. This implies the stated support bound. Let $E_x$ be the event that the sampled family contains a bump with the two displayed bounds in the second assertion, and select the first such bump in a fixed ordering. This event and the selected index $i \( x \)$ are determined by the family. The band and padding event above implies $E_x$, so $Pr \( E_x \) gt.eq rho$. The independent coefficients are sampled after the family, which gives the stated conditional law of $U_x = U_(i \( x \))$. Finally, $xi$ is sampled independently of both the family and all coefficients. ◻
]

=== 5.2 Retaining anchors across distance drops <retaining-anchors-across-distance-drops>

For a vertex $p$ of the current bag, its distances to earlier launch bags decrease with launch time, by the separator property. Our rule protects the newer entry when two consecutive distances cross a threshold determined by a distance $d \( p \, q \)$ inside the current bag. Two thresholds for each ordered pair $\( p \, q \)$ protect only boundedly many entries. In the lower-bound argument, a distance visible in the bag will force this rule to retain the immediate successor of an old anchor. For now let $J > 0$ and $0 < eta < 1 \/ 4$ be parameters; the memory bound will be independent of their values.

Choose

$ n_0 = 2 k^2 + 2 . $

The cache is ordered by launch time, from oldest to youngest. Launch an anchor at the root and retain it permanently. At every other bag $B$, propose a new anchor launched at $B$. If the resulting list has at most $n_0$ entries, retain it. Otherwise it has $n_0 + 1$ entries, and exactly one non-root entry is evicted; the proposed anchor itself is an allowed eviction. Copies of a parent’s cache and particle list are maintained separately for its children.

Here is the eviction rule, with a parameter $J > 0$ to be fixed below. For every ordered pair of distinct vertices $p \, q in B$, consider the two thresholds

#[#set math.equation(numbering: n => "(5.1)")
 $ frac(d \( p \, q \), 100) \, #h(2em) J d \( p \, q \) . $ <eq:cache-thresholds>]

For each threshold $tau$, protect the entry immediately following a drop from a distance strictly greater than $tau$ to a distance at most $tau$ in the list

$ d \( p \, A_1 \) \, d \( p \, A_2 \) \, dots.h \, d \( p \, A_m \) \, $

where the $A_i$ are the anchors, including the proposal, in age order. If there is no such drop, that threshold protects no entry. Evict the oldest unprotected non-root entry. All tie-breaking choices made here are deterministic functions of the metric and decomposition. In particular, the launch and release times of every reservation are fixed before any perturbation is sampled. The identities of the two particles used at a launch may depend on earlier randomness, but the first-eligible-pair rule of Proposition 10 selects them before sampling that launch’s fresh variables.

#thm([Lemma 5.2.])[
  (The cache is well defined).  #emph[The displayed distance list is nonincreasing, and an eligible eviction always exists. The cache has at most $n_0$ entries after an eviction and at most $n_0 + 1$ simultaneous reservations when the proposed and evicted anchors are both included.]
] <lem:cache-defined>

#proof[
  If $A_i$ precedes $A_j$, then $A_j$ lies between $A_i$ and $B$ on the ancestry path. Lemma 2, applied to paths from $p in B$ to $A_i$, gives $d \( p \, A_j \) lt.eq d \( p \, A_i \)$. Thus a threshold protects at most one entry. There are at most $2 k \( k - 1 \)$ protected entries in total. At a full insertion there are $n_0$ non-root candidates, and $n_0 > 2 k \( k - 1 \)$, so at least one is eligible. The size assertions follow from performing exactly one eviction at such an insertion. ◻
]

=== 5.3 Realization and separation tests <realization-and-separation-tests>

At an anchor $A$, use the ordinary perturbation of Lemma 14:

#[#set math.equation(numbering: n => "(5.2)")
 $ h_A = d \( thin dot.op thin \, A \) \, #h(2em) g_A = xi_A h_A + v_A . $ <eq:anchor-perturbation>]

All randomness at this launch is fresh. Reserve the two particles $f_A + g_A$ and $f_A - g_A$, where $f_A$ is the average of the selected pair just before the launch. Their reservation lasts through the eviction bag, including that bag. A rejected proposal therefore has a one-bag reservation. At an insertion bag, record the trace after the proposal’s launch and before releasing any reservation; the trace-preserving operations of Proposition 10 make this convention consistent with both the incoming and outgoing lists. Write $rho > 0$ and $c > 0$ for the probability and amplitude constants, respectively, in Lemma 14.

Set

$ q_0 = n_0 + 1 \, #h(2em) N = 2 q_0 + k ! + 2 . $

This particle count covers the inclusive reservation bound in Lemma 15. Ordinary perturbations have Lipschitz constant at most $3$ and absolute value at most $3 "diam" \( V \)$, independently of $eta$. Proposition 10 therefore gives a cut pseudometric, averaged over all launch randomness, with

#[#set math.equation(numbering: n => "(5.3)")
 $ D_(upright("anc")) lt.eq U d \, #h(2em) U = 3 N \( N - 1 \) . $ <eq:anchor-upper>]

Every particle has Lipschitz constant at most $L_(upright(p)) = 3 \( N - 1 \)$. The common sweeping interval can be chosen with margin at least $2 "diam" \( V \)$ around all particle values. In particular, $N$, $L_(upright(p))$, and $U$ depend only on $k$ and do not depend on $J$ or $eta$.

Write $b_k > 0$ for the constant in Proposition 5.

We will repeatedly use two consequences of the cut-measure lemmas.

#thm([Lemma 5.3.])[
  (Tests along a reservation).  #emph[Let a path of bags run from a bag containing $y$ to a later bag containing $z$.]
  + #emph[If an anchor $A$ lies on this path and its reservation lasts from $A$ through the later bag, then 
#[#set math.equation(numbering: n => "(5.4)")
 $ D_(upright("anc")) \( y \, z \) gt.eq b_k d \( z \, A \) . $ <eq:anchor-launch-test>]

]
  + #emph[Suppose a testing bag $P$ lies on the path and a reserved particle $F$ is unchanged from $P$ through the later bag. If, with probability at least $theta$, it satisfies 
$ \| F \( z \) - F \( s \) \| gt.eq t quad upright("for every ") s in P \, $

 where $0 < t lt.eq "diam" \( V \)$, then 
#[#set math.equation(numbering: n => "(5.5)")
 $ D_(upright("anc")) \( y \, z \) gt.eq b_k theta t . $ <eq:anchor-height-test>]

 In the second assertion the tested reservation and vertices are chosen without consulting launch randomness.]
  #emph[Both assertions allow the later bag to be the eviction bag.]
] <lem:anchor-tests>

#proof[
  For each realization of the launch randomness, a reserved pair supplies a common submeasure throughout its reservation, including its endpoints. Since $g_A$ vanishes on $A$ and $\| g_A \( z \) \| gt.eq h_A \( z \) \/ 2$, Lemma 7 gives uncertainty at least $d \( z \, A \)$. Proposition 5 gives the first assertion after averaging. For the second assertion, use the single particle’s symmetrized sweep. The sweeping margin permits Lemma 6 to give uncertainty at least $t$ on the stated event. Apply Proposition 5 and average again. These transport estimates hold pointwise in the prepared laws. To establish the probability of a height gap in Section 6, we will instead condition on the launch history and selected fresh variables, leaving the later bag laws unconditioned. ◻
]

The preceding construction and tests hold for every $J > 0$ and $0 < eta < 1 \/ 4$. We now fix the member of this family used in the rest of the proof, choosing the parameters in the following order:

#[#set math.equation(numbering: n => "(5.6)")
 $ K > 2 + frac(2 U + 1, b_k) \, #h(2em) J = 10 \( K + 1 \) \, #h(2em) H > 10^5 J \, #h(2em) 0 < eta < frac(1, 10 H) . $ <eq:anchor-parameters>]

The memory bound, and hence $U$, was fixed independently of $J$ and $eta$. All these parameters, including $eta$, are now fixed for every graph with bag size at most $k$. From this point onward, $D_(upright("anc"))$ denotes the pseudometric with these choices.

== 6 Uniform lower comparison <sec:lower>

We prove that the two cut constructions together separate every pair. The common-bag estimate first puts a hypothetical collapsed pair into a useful position relative to its least common ancestor bag. The anchor retention rule will then contradict that collapse.

#thm([Proposition 6.1.])[
  (Uniform lower comparison).  #emph[For each fixed $k gt.eq 2$ there is a constant $lambda_k > 0$ such that, for every admissible weighted graph with a tree decomposition of bag size at most $k$ and every pair of vertices $u \, v$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ D_(upright("bag")) \( u \, v \) + D_(upright("anc")) \( u \, v \) gt.eq lambda_k d \( u \, v \) . $ <eq:combined-lower>]

]
] <prop:combined-lower>

=== 6.1 Normalizing a failure of the lower bound <normalizing-a-failure-of-the-lower-bound>

To prove a uniform lower bound, we argue by contradiction from a normalized sequence of poorly separated pairs. The bounded cache will yield a youngest reservation crossing from distance bounded away from zero to vanishing distance; the noise tests force geometric witnesses, and the eviction rule then preserves a younger such reservation.

We give the limiting argument explicitly. Fix a nonprincipal ultrafilter $cal(U)$ on $bb(N)$, obtained by extending the cofinite filter using Zorn’s lemma. An assertion about a sequence holds #emph[eventually] if its set of valid indices belongs to $cal(U)$; sequences are identified when they agree eventually. A #emph[standard] constant means a fixed real number, independent of the sequence index. A nonnegative real sequence is #emph[infinitesimal] if, for each $epsilon > 0$, it is eventually smaller than $epsilon$. We will use only the following elementary properties.

#thm([Lemma 6.2.])[
  (Finite limiting rules).  #emph[]
  + #emph[Of finitely many alternatives whose union holds eventually, at least one holds eventually. Finitely many eventual assertions hold simultaneously eventually.]
  + #emph[A sequence in $\[ 0 \, 1 \]$ that is not infinitesimal is eventually bounded below by a positive real constant. A finite minimum of such sequences has the same property.]
  + #emph[Sequences of times in finite linearly ordered paths are linearly ordered modulo $cal(U)$. If $delta_t in \[ 0 \, 1 \]$ is nonincreasing along each path, a time sequence with noninfinitesimal $delta_t$ precedes every time sequence with infinitesimal $delta_t$.]
] <lem:finite-limiting-rules>

#proof[
  The first assertion is the finite-union and finite-intersection property of an ultrafilter. If the second assertion failed, the sets on which the sequence is smaller than each positive constant would all belong to $cal(U)$, which is exactly infinitesimality. Take a finite minimum of the resulting positive lower bounds to obtain its last claim. For two time sequences, the alternatives $s < t$, $s = t$, and $s > t$ partition the indices, proving the ordering assertion. If a time with noninfinitesimal $delta$ were at or after one with infinitesimal $delta$, monotonicity would bound its $delta$ by an infinitesimal sequence, a contradiction. ◻
]

Suppose, towards a contradiction, that the constructed sum $D_(upright("bag")) + D_(upright("anc"))$ has no uniform positive lower comparison with $d$. Then there is a sequence of admissible metrics, decompositions, and distinct pairs $x \, y$, with $r = d \( x \, y \)$, such that

#[#set math.equation(numbering: n => "(6.2)")
 $ frac(D_(upright("bag")) \( x \, y \) + D_(upright("anc")) \( x \, y \), r) arrow.r 0 . $ <eq:failed-lower-comparison>]

All vertices, bags, metrics, and times in the rest of the argument denote sequences in these examples; inequalities and temporal comparisons are taken eventually unless stated otherwise. We write $a = o \( b \)$, for positive sequences $b$, when $\| a \| \/ b$ tends to zero along $cal(U)$; in particular, $o \( 1 \)$ denotes an infinitesimal sequence. These choices depend on the input metrics and the deterministic cache, not on the sampled particles.

Choose bags containing the two endpoints and let $S$ be their least common ancestor. Every $x$–$y$ path meets $S$ by Lemma 2; in particular

#[#set math.equation(numbering: n => "(6.3)")
 $ d \( x \, S \) lt.eq r \, #h(2em) d \( y \, S \) lt.eq r . $ <eq:lca-distance-bound>]

The two ratios on the left divided by $r$ cannot both be infinitesimal. Indeed, if $s \, t in S$ are respective nearest vertices, the upper bound $D_(upright("bag")) lt.eq U_(upright("bag")) d$ would give

$ D_(upright("bag")) \( s \, t \) lt.eq U_(upright("bag")) #scale(x: 120%, y: 120%)[\(] d \( x \, S \) + d \( y \, S \) #scale(x: 120%, y: 120%)[\)] + D_(upright("bag")) \( x \, y \) = o \( r \) \, $

whereas $d \( s \, t \) gt.eq r - d \( x \, S \) - d \( y \, S \) = \( 1 - o \( 1 \) \) r$. This contradicts the lower bound $D_(upright("bag")) \( s \, t \) gt.eq a_(upright("bag")) d \( s \, t \)$ from Proposition 13.

Interchange the endpoints, if necessary, so that $a = d \( x \, S \)$ satisfies $a \/ r gt.eq epsilon_0 > 0$ eventually. Discard the irrelevant indices where $a = 0$, and divide each metric, particle height, and cut mass by $a$. We rescale the already constructed objects; no scale-equivariance of a particular partition sampler is needed. All their stated inequalities and noise properties survive this change of units: the functions $h_A \, g_A \, v_A$, bump amplitudes, and sweep cutoff are divided by $a$, while the original independent uniform variables are unchanged. The support and amplitude bounds in Lemma 14 therefore hold in the rescaled metric. We use those bounds, without regenerating the partition samples or requiring their original scales to remain dyadic. Write $D = D_(upright("anc"))$ in the new units. We have

#[#set math.equation(numbering: n => "(6.4)")
 $ d \( x \, S \) = 1 \, #h(2em) D \( x \, y \) upright(" is infinitesimal") \, #h(2em) D lt.eq U d . $ <eq:normalized-failure>]

=== 6.2 A youngest crossing anchor <a-youngest-crossing-anchor>

Let $X$ be the chosen endpoint bag containing $x$, and consider the descending path from $S$ to $X$. Put $delta_B = d \( x \, B \)$. By Lemma 2, these numbers are nonincreasing, lie in $\[ 0 \, 1 \]$, and equal $1$ at $S$ and $0$ at $X$. A selected sequence of bags is called #emph[early] if its $delta_B$ is not infinitesimal, and #emph[late] otherwise. An early sequence has a positive standard lower bound for $delta_B$; that bound may depend on the selected sequence. We never assume a first late bag or a last early bag exists.

For an anchor whose reservation meets this path, restrict its reservation to the path, counting both launch and eviction bags and truncating at $X$ if it is not evicted earlier. Its effective start is its launch bag or $S$, whichever is later. Call a sequence of anchors #emph[crossing] if its effective start is early and its terminal bag is late. Equivalently, it has launched by an early time and remains present at a late time. Here an anchor sequence, like a time sequence, is an equivalence class modulo equality on a set in $cal(U)$. Its launch time and terminal time are defined by the deterministic cache, independently of the particles sampled in its reservation.

#thm([Lemma 6.3.])[
  (A youngest crossing anchor).  #emph[There are at most $n_0 + 1$ distinct crossing anchor sequences. The set is nonempty and has a youngest member $A_(*)$.]
] <lem:youngest-crossing>

#proof[
  The permanent root is crossing. Given any finite collection of crossing anchor sequences, take their latest effective start. It is early by Lemma 18. Every anchor in the collection has started, and each of their late terminal times follows this early time. Thus they are simultaneously present in the inclusive cache list. If $n_0 + 2$ distinct crossing sequences existed, select that many; their pairwise distinctness also holds simultaneously eventually. This would contradict the bound $n_0 + 1$ of Lemma 15. This bound concerns the set of equivalence classes of all crossing sequences, not just a list chosen in advance. The finite nonempty set of crossing anchors is ordered by launch time, so it has a youngest member. ◻
]

Fix $A_(*)$ and write

$ h_(*) = d \( thin dot.op thin \, A_(*) \) \, #h(2em) D_0 = h_(*) \( x \) . $

Choose its late terminal bag $Z$ and a nearest vertex $z in Z$ to $x$. Then $d \( x \, z \)$ is infinitesimal and

#[#set math.equation(numbering: n => "(6.5)")
 $ D \( y \, z \) lt.eq D \( y \, x \) + U d \( x \, z \) quad upright("is infinitesimal") . $ <eq:late-proxy>]

If a frozen particle of $A_(*)$ has, with positive standard probability, a positive standard height gap at $x$ from all vertices of an earlier testing bag $P$, the same holds with half the gap at $z$ eventually:

$ \| F \( z \) - F \( x \) \| lt.eq L_(upright(p)) d \( x \, z \) = o \( 1 \) . $

Provided $P$ is on the reservation and on the bag path from $y$ to $Z$, Lemma 16 then contradicts (6.5). We call this the #emph[late-proxy test]. All tolerances used below can be taken smaller than $1 \/ 4$. The normalized diameter is at least $1$, so the sweeping margins suffice for every such test.

#thm([Lemma 6.4.])[
  (The crossing anchor is old and distant).  #emph[The launch of $A_(*)$ is strictly above $S$, and $D_0 > H$ eventually. In particular, $A_(*)$ is present at every selected early bag from $S$ onward.]
] <lem:old-distant-anchor>

#proof[
  If $A_(*)$ launches at or below $S$, that launch is an early time on the path from $S$ to $X$. It also lies on the bag path from the chosen bag containing $y$ to $Z$. Equation (5.4) gives
  $ D \( y \, z \) gt.eq b_k d \( z \, A_(*) \) gt.eq b_k #scale(x: 120%, y: 120%)[\(] d \( x \, A_(*) \) - d \( x \, z \) #scale(x: 120%, y: 120%)[\)] . $
  The first distance in parentheses has a positive standard lower bound, contradicting (6.5). Hence the launch is strictly above $S$. The separator inequality now gives $D_0 gt.eq d \( x \, S \) = 1$. Its reservation starts before $S$ and has a late terminal time, proving the last assertion by Lemma 18.
  Suppose $D_0 lt.eq H$ on a set in $cal(U)$. Use the ordinary noise event at $x$ from Lemma 14, of probability at least $rho$. On this event, a fresh uniform coefficient has amplitude at least $c eta D_0 gt.eq c eta$ at $x$. Its support is within distance $4 eta D_0 lt.eq 4 eta H < 1$ of $x$, and so misses every vertex of $S$.
  Consider the frozen particle $F = f_(A_(*)) + xi_(A_(*)) h_(*) + v_(A_(*))$. Conditional on the past, sampled bump family, $xi_(A_(*))$, and all other coefficients, each inequality $\| F \( x \) - F \( s \) \| < t$ for $s in S$ excludes at most $2 t \/ \( c eta \)$ of the unit interval of this coefficient. Choose a positive standard $t < 1 \/ 4$ such that $2 k t \/ \( c eta \) < 1 \/ 2$. The union bound gives a simultaneous gap at least $t$ from all of $S$ with probability at least $rho \/ 2$. The late-proxy test at $S$ gives a contradiction. The ultrafilter alternative therefore is $D_0 > H$. ◻
]

=== 6.3 The obstruction and protected successors <the-obstruction-and-protected-successors>

Fix a selected early bag $B$, let $p in B$ be nearest to $x$, and write $delta = d \( x \, B \)$. We seek a vertex $q in B$ for which $d \( p \, q \)$ is neither too small compared with $delta$ nor too large compared with $D_0$. If no such vertex exists, the distance multiplier and local bump respectively vary the height differences from vertices near $p$ and from vertices far away. The two variations give a simultaneous height gap with positive probability, and the late-proxy test then contradicts the normalized failure.

This bag distance will then protect a younger anchor: a successor launched at or below $S$ remains close to $p$, whereas $A_(*)$ is far from $p$. One of the two thresholds defined by $d \( p \, q \)$ falls between their distances, forcing the successor to remain reserved.

#thm([Lemma 6.5.])[
  (A geometric obstruction at every early sequence).  #emph[Let $B$ be any selected early sequence of bags from $S$ to $X$ and let $p in B$ be nearest to $x$. Put $delta = d \( x \, B \)$. There is a sequence $q in B$ such that, eventually, 
#[#set math.equation(numbering: n => "(6.6)")
 $ delta / 4 lt.eq d \( p \, q \) lt.eq 10 D_0 . $ <eq:anchor-obstruction>]

]
] <lem:anchor-obstruction>

#proof[
  Otherwise, by the ultrafilter alternative, eventually every vertex $s in B$ is either #emph[near], with $d \( p \, s \) < delta \/ 4$, or #emph[far], with $d \( p \, s \) > 10 D_0$. A shortest path from $A_(*)$ to $x$ meets $B$ at a vertex $v_0$, by Lemmas 2 and 20. As $v_0$ lies on such a shortest path,
  $ h_(*) \( v_0 \) + d \( v_0 \, x \) = D_0 . $
  Moreover,
  $ d \( p \, v_0 \) lt.eq delta + d \( x \, v_0 \) lt.eq 1 + D_0 lt.eq 2 D_0 < 10 D_0 . $
  Thus $v_0$ must be near. For every near vertex $s$, we have $d \( v_0 \, s \) < delta \/ 2$, whence
  #[#set math.equation(numbering: n => "(6.7)")
   $ h_(*) \( x \) - h_(*) \( s \) gt.eq d \( x \, v_0 \) - d \( v_0 \, s \) > delta / 2 . $ <eq:near-anchor-height>]
  For every far vertex $s$, on the other hand,
  #[#set math.equation(numbering: n => "(6.8)")
   $ d \( x \, s \) gt.eq d \( p \, s \) - delta > 10 D_0 - delta gt.eq 9 D_0 > 4 eta D_0 . $ <eq:far-noise-support>]
  Again use the favorable bump event at $x$, of probability at least $rho$, and the particle $F = f_(A_(*)) + xi_(A_(*)) h_(*) + v_(A_(*))$. Condition on the past and the sampled bump family. For a far vertex $s$, the distinguished coefficient at $x$ does not affect $s$, by (6.8). Fixing $xi_(A_(*))$ and all other noise coefficients gives
  $ Pr #scale(x: 120%, y: 120%)[\(] \| F \( x \) - F \( s \) \| < t #scale(x: 120%, y: 120%)[\)] lt.eq frac(2 t, c eta D_0) . $
  For a near vertex $s$, instead fix all noise coefficients and use the independent uniform variable $xi_(A_(*)) in \[ 1 \, 2 \]$. Equation (6.7) gives
  $ Pr #scale(x: 120%, y: 120%)[\(] \| F \( x \) - F \( s \) \| < t #scale(x: 120%, y: 120%)[\)] lt.eq frac(4 t, delta) . $
  Each estimate remains true after averaging over the variables fixed only for that estimate. In particular the different bad events need not be independent. The selected anchor, bag, and vertices depend only on the metric and cache. Thus this selection has not conditioned either the distinguished bump coefficient or $xi_(A_(*))$.
  Since $B$ is early, $delta gt.eq epsilon > 0$ eventually for some standard $epsilon$. Since $D_0 > H$, we can choose a positive standard $t < 1 \/ 4$ with
  $ k (frac(4 t, epsilon) + frac(2 t, c eta H)) < 1 / 2 . $
  The union bound gives a height gap at least $t$ from all of $B$ with probability at least $rho \/ 2$. The reservation of $A_(*)$ contains $B$ and $Z$, and $B$ lies on the bag path from $y$ to $Z$. The late-proxy test is therefore a contradiction. This proves (6.6). Notice that the argument also permits $D_0$ to be unbounded. ◻
]

Figure 1 distinguishes the order of bags on the reserved path from the order of anchors in the cache. The next lemma uses the obstruction distance to protect the immediate successor in the second order.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.25, 2), [\(a\) A reserved interval on a bag path], anchor: "west", padding: 0.1176cm)
  line((0, 0), (10.2, 0), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.1048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.03528), [$A_*$], anchor: "north")
  circle((2, 0), radius: 0.1048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, -0.03528), [$S$], anchor: "north")
  circle((4.5, 0), radius: 0.1048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.5, -0.03528), [$B$], anchor: "north")
  circle((8, 0), radius: 0.1048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8, -0.03528), [$Z$], anchor: "north")
  circle((10, 0), radius: 0.1048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10, -0.03528), [$X$], anchor: "north")
  line((2, 0), (1, -1), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10))
  content((1, -1), [#text(size: 9pt)[toward a bag#linebreak()containing $y$]], anchor: "north", padding: 0.1176cm)
  line((0, 0.55), (8, 0.55), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  line((0, 0.42), (0, 0.68), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  line((8, 0.42), (8, 0.68), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  content((4, 0.6), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[unchanged particles launched at $A_*$]]], anchor: "south", padding: 0.1176cm)
  content((4.7, -1.05), [#text(size: 9pt)[$B$ selected early#linebreak()$d(x,B) gt.eq epsilon >0$]])
  content((8.45, -1.05), [#text(size: 9pt)[$Z$ selected late#linebreak()$d(x,Z)=o(1)$]])
  content((10, 0.2), [#text(size: 9pt)[$x in X$]], anchor: "south", padding: 0.1176cm)
  content((-0.25, -2.65), [\(b\) Protection at one testing bag $B$], anchor: "west", padding: 0.1176cm)
  line((0.7, -6.2), (10, -6.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((10, -6.2), [#text(fill: rgb("#000000"))[#text(size: 9pt)[age order]]], anchor: "west", padding: 0.1176cm)
  line((0.7, -6.2), (0.7, -3.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0.7, -3.25), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$d(p,A)$]]], anchor: "south", padding: 0.1176cm)
  line((0.7, -4.5), (9.5, -4.5), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.55, -4.5), [#text(size: 9pt)[$tau$]], anchor: "east", padding: 0.1176cm)
  line((1.4, -3.55), (3, -3.8), (4.2, -3.95), (6.15, -4.95), (7.7, -5.15), (9, -5.3), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((1.4, -3.55), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((3, -3.8), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((4.2, -3.95), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((6.15, -4.95), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((7.7, -5.15), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((9, -5.3), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((4.2, -3.95), [#text(size: 9pt)[$A_*$]], anchor: "south", padding: 0.1176cm)
  content((6.15, -4.95), [#text(size: 9pt)[$A'$#linebreak()protected]], anchor: "north", padding: 0.1176cm)
  content((7.05, -3.65), [#text(size: 9pt)[$d(p,A_*)> tau$]], anchor: "west", padding: 0.1176cm)
  content((7.05, -4.1), [#text(size: 9pt)[$tau gt.eq d(p,A')$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The two orders in the anchor argument. In (a), the selected early bag $B$ and late terminal bag $Z$ lie in the reservation of $A_(*)$; the branch toward $y$ makes $B$ a testing bag on the path to $Z$. The horizontal axis records bag order, not metric distance, and no first late or last early bag is depicted. In (b), the entries are ordered by launch time in the list at $B$. The distance list is nonincreasing. The immediate successor $A'$ is protected when one of the thresholds $tau = L \/ 100$ or $tau = J L$ lies between its distance and that of $A_(*)$, where $L = d \( p \, q \)$ is supplied by Lemma 21. All spacings are schematic. ],
) <fig:anchor-reservations>

#thm([Lemma 6.6.])[
  (Protection of the immediate successor).  #emph[At any selected early eviction test $B$, suppose the immediate successor $A'$ of $A_(*)$ in the inclusive cache list was launched at or after $S$. Then $A'$ is protected and cannot be evicted at this test.]
] <lem:protected-successor>

#proof[
  Let $p in B$ be nearest to $x$, and put $delta = d \( x \, B \)$. If $A'$ is the current proposal, $d \( p \, A' \) = 0$. Otherwise its reservation lasts from its launch through $B$, and its launch lies on the bag path from $y$ to $B$. Equation (5.4) yields
  $ b_k d \( p \, A' \) lt.eq D \( y \, p \) lt.eq D \( y \, x \) + U delta . $
  Because $delta$ is early, $D \( y \, x \) \/ delta$ is infinitesimal. The choice of $K$ in (5.6) consequently gives, eventually,
  #[#set math.equation(numbering: n => "(6.9)")
   $ d \( p \, A' \) lt.eq K delta . $ <eq:successor-distance-bounds>]
  This inequality also holds for a proposal. Monotonicity of distances along the path gives $d \( x \, A' \) lt.eq d \( x \, S \) = 1$, so in all cases
  #[#set math.equation(numbering: n => "(6.10)")
   $ d \( p \, A' \) lt.eq delta + 1 lt.eq 2 \, #h(2em) d \( p \, A_(*) \) gt.eq D_0 - delta gt.eq D_0 - 1 . $ <eq:successor-absolute-bounds>]
  Choose $q$ from Lemma 21 and write $L = d \( p \, q \)$. There are two alternatives. If $L lt.eq 300$, then
  $ J L gt.eq frac(J delta, 4) > K delta gt.eq d \( p \, A' \) \, #h(2em) J L lt.eq 300 J < H - 1 < D_0 - 1 lt.eq d \( p \, A_(*) \) . $
  If $L > 300$, then
  $ L / 100 > 3 > 2 gt.eq d \( p \, A' \) \, #h(2em) L / 100 lt.eq D_0 / 10 < D_0 - 1 lt.eq d \( p \, A_(*) \) . $
  In either case one of the thresholds in (5.1) lies strictly below $d \( p \, A_(*) \)$ and at or above $d \( p \, A' \)$. Since the distance list is nonincreasing and $A'$ immediately follows $A_(*)$, it is precisely the entry protected by this drop. ◻
]

#thm([Lemma 6.7.])[
  (A younger crossing anchor exists).  #emph[Under the normalized failure assumption (6.4), there is a crossing anchor younger than $A_(*)$.]
] <lem:younger-crossing>

#proof[
  Inspect the inclusive cache list at the insertion test at $S$. By Lemma 20, $A_(*)$ was launched strictly above $S$, so this is indeed a non-root insertion. Consider the younger entries whose launches were strictly above $S$. Their number is bounded by $n_0 + 1$; by a finite ultrafilter alternative, enumerate them as a fixed finite list of anchor sequences. These are all the anchors younger than $A_(*)$ and launched above $S$ that can be present at any later test: an evicted reservation never returns, and every later launch is at or below $S$.
  Each has effective start $S$, which is early. If any had a late terminal bag, it would be a crossing anchor younger than $A_(*)$. By the choice of $A_(*)$, every one must instead have an early terminal bag. Such a bag is its actual eviction bag, since the endpoint $X$ is late.
  If this finite list is nonempty, take the latest of these eviction times, say $B_0$. It is early. At this test an old younger anchor is actually evicted, so the new proposal is retained: exactly one entry is evicted at an insertion. The anchor $A_(*)$ remains present, because its terminal time is late. Immediately after this eviction no younger anchor launched above $S$ remains, and the retained proposal ensures that at least one younger entry exists. Therefore $A_(*)$ has an immediate successor $A'$ whose launch is at or after $S$.
  If the finite list is empty, the proposal at $S$ is itself the immediate successor of $A_(*)$. It is retained automatically when there is space; at a full insertion Lemma 22 prohibits its eviction. Thus in this case too there is an immediate successor $A'$ launched at or after $S$, present just after an early test $B_0 = S$.
  Fix this successor $A'$. Its launch is no later than the early time $B_0$, so its effective start is early. If its terminal bag is late, it is the required younger crossing anchor. Otherwise its terminal bag is an early eviction time $B_1$. The anchor $A_(*)$ is still present at $B_1$. While both anchors remain, $A'$ remains the immediate successor: there was no entry between them at $B_0$, and all subsequent insertions are younger than $A'$. Hence Lemma 22 prohibits eviction of $A'$ at $B_1$, a contradiction.
  This argument selected only a bounded list of anchors, its last eviction, and one successor’s terminal time. It does not use induction over an unbounded or limiting order of early times. ◻
]

#proof[
  If no such constant existed, choosing ratios smaller than $1 \/ i$ would give (6.2). The normalization above and Lemmas 19–23 would then produce a crossing anchor younger than the youngest crossing anchor. This contradiction rules out a sequence of ratios tending to zero. Their infimum over all nontrivial admissible examples and all distinct pairs is therefore positive. Choose $lambda_k$ no larger than that infimum. Equal pairs and the one-vertex graph satisfy (6.1) automatically. ◻
]

== 7 Completing the embedding <sec:conclusion>

#proof[
  The one-vertex graph is immediate. For every other admissible graph, Proposition 13 and the anchor construction give finite cut pseudometrics $D_(upright("bag"))$ and $D_(upright("anc"))$ satisfying the uniform upper bounds established there. Proposition 17 gives a constant $lambda_k > 0$, depending only on $k$, such that their sum $D$ obeys
  $ lambda_k d \( u \, v \) lt.eq D \( u \, v \) lt.eq \( U_(upright("bag")) + U \) d \( u \, v \) #h(2em) \( u \, v in V \) . $
  For each construction, average the mass assigned to each labeled cut $omega in { 0 \, 1 }^V$. The common total sweep mass is finite and deterministic for the given graph, so all these expected masses are finite. Adding the two measures and identifying $omega$ with $A = { v : omega \( v \) = 1 }$ gives
  $ D \( u \, v \) = sum_(A subset.eq V) w_A \| upright(bold(1))_A \( u \) - upright(bold(1))_A \( v \) \| \, #h(2em) w_A gt.eq 0 . $
  The map
  $ F \( v \) = #scale(x: 120%, y: 120%)[\(] lambda_k^(- 1) w_A upright(bold(1))_A \( v \) #scale(x: 120%, y: 120%)[\)]_(A subset.eq V) in ell_1^(thin 2^(\| V \|)) \( bb(R) \) $
  therefore has distance $D \/ lambda_k$ and satisfies (1.1) with $C_k = \( U_(upright("bag")) + U \) \/ lambda_k$. Every constant used to obtain this comparison depends only on $k$. ◻
]

The compactness argument establishes a positive uniform lower factor without an explicit numerical estimate; the embedding assertion requires only its existence.

#heading(level: 1)[References]
#bibitem([1])[Ittai Abraham, Arnold Filtser, Anupam Gupta, and Ofer Neiman. Metric embedding via shortest path decompositions. #emph[SIAM Journal on Computing] #strong[51]\(2):290--314, 2022. #link("https://doi.org/10.1137/19M1296021")[doi:10.1137/19M1296021].]
#bibitem([2])[Yonatan Aumann and Yuval Rabani. An $O \( log k \)$ approximate min-cut max-flow theorem and approximation algorithm. #emph[SIAM Journal on Computing] #strong[27]\(1):291--301, 1998. #link("https://doi.org/10.1137/S0097539794285983")[doi:10.1137/S0097539794285983].]
#bibitem([3])[Amit Chakrabarti, Alexander Jaffe, James R. Lee, and Justin Vincent. Embeddings of topological graphs: Lossy invariants, linearization, and 2-sums. In #emph[49th Annual IEEE Symposium on Foundations of Computer Science], pp.~761--770. IEEE, 2008. #link("https://doi.org/10.1109/FOCS.2008.79")[doi:10.1109/FOCS.2008.79].]
#bibitem([4])[Parinya Chalermsook, Matthias Kaul, Matthias Mnich, Joachim Spoerhase, Sumedha Uniyal, and Daniel Vaz. Approximating sparsest cut in low-treewidth graphs via combinatorial diameter. #emph[ACM Transactions on Algorithms] #strong[20]\(1), Article~6, pp.~1--20, 2024. #link("https://doi.org/10.1145/3632623")[doi:10.1145/3632623].]
#bibitem([5])[Chandra Chekuri, Anupam Gupta, Ilan Newman, Yuri Rabinovich, and Alistair Sinclair. Embedding $k$-outerplanar graphs into $ell_1$. #emph[SIAM Journal on Discrete Mathematics] #strong[20]\(1):119--136, 2006. #link("https://doi.org/10.1137/S0895480102417379")[doi:10.1137/S0895480102417379].]
#bibitem([6])[Eden Chlamtáč, Robert Krauthgamer, and Prasad Raghavendra. Approximating sparsest cut in graphs of bounded treewidth. In #emph[APPROX/RANDOM 2010], Lecture Notes in Computer Science, vol.~6302, pp.~124--137. Springer, 2010. #link("https://doi.org/10.1007/978-3-642-15369-3_10")[doi:10.1007/978-3-642-15369-3\_10]. Full version: #link("https://arxiv.org/abs/1006.3970v2")[arXiv:1006.3970v2].]
#bibitem([7])[Vincent Cohen-Addad, Tobias Mömke, and Victor Verdugo. A 2-approximation for the bounded treewidth sparsest cut problem in FPT time. #emph[Mathematical Programming] #strong[206]:479--495, 2024. #link("https://doi.org/10.1007/s10107-023-02044-1")[doi:10.1007/s10107-023-02044-1].]
#bibitem([8])[Jonathan Conroy and Arnold Filtser. How to protect yourself from threatening skeletons: Optimal padded decompositions for minor-free graphs. In #emph[57th Annual ACM Symposium on Theory of Computing], pp.~2281--2292. ACM, 2025. #link("https://doi.org/10.1145/3717823.3718252")[doi:10.1145/3717823.3718252].]
#bibitem([9])[Arnold Filtser, Tobias Friedrich, Davis Issac, Nikhil Kumar, Hung Le, Nadym Mallek, and Ziena Zeif. Optimal padded decomposition for bounded treewidth graphs. #emph[TheoretiCS] #strong[4], Article~22, pp.~1--39, 2025. #link("https://doi.org/10.46298/theoretics.25.22")[doi:10.46298/theoretics.25.22].]
#bibitem([10])[Anupam Gupta, Ilan Newman, Yuri Rabinovich, and Alistair Sinclair. Cuts, trees and $ell_1$-embeddings of graphs. #emph[Combinatorica] #strong[24]\(2):233--269, 2004. #link("https://doi.org/10.1007/s00493-004-0015-x")[doi:10.1007/s00493-004-0015-x]. #link("https://cs.nyu.edu/~ag10120/papers/focs99.pdf")[Author manuscript].]
#bibitem([11])[Anupam Gupta, Kunal Talwar, and David Witmer. Sparsest cut on bounded treewidth graphs: Algorithms and hardness results. In #emph[45th Annual ACM Symposium on Theory of Computing], pp.~281--290. ACM, 2013. #link("https://doi.org/10.1145/2488608.2488644")[doi:10.1145/2488608.2488644]. Full version: #link("https://arxiv.org/abs/1305.1347")[arXiv:1305.1347].]
#bibitem([12])[James R. Lee and Daniel E. Poore. On the 2-sum embedding conjecture. In #emph[29th Annual Symposium on Computational Geometry], pp.~197--206. ACM, 2013. #link("https://doi.org/10.1145/2462356.2492436")[doi:10.1145/2462356.2492436].]
#bibitem([13])[James R. Lee and Prasad Raghavendra. Coarse differentiation and multi-flows in planar graphs. #emph[Discrete & Computational Geometry] #strong[43]\(2):346--362, 2010. #link("https://doi.org/10.1007/s00454-009-9172-4")[doi:10.1007/s00454-009-9172-4].]
#bibitem([14])[James R. Lee and Anastasios Sidiropoulos. On the geometry of graphs with a forbidden minor. In #emph[41st Annual ACM Symposium on Theory of Computing], pp.~245--254. ACM, 2009. #link("https://doi.org/10.1145/1536414.1536450")[doi:10.1145/1536414.1536450].]
#bibitem([15])[James R. Lee and Anastasios Sidiropoulos. Pathwidth, trees, and random embeddings. #emph[Combinatorica] #strong[33]\(3):349--374, 2013. #link("https://doi.org/10.1007/s00493-013-2685-8")[doi:10.1007/s00493-013-2685-8].]
#bibitem([16])[Nathan Linial, Eran London, and Yuri Rabinovich. The geometry of graphs and some of its algorithmic applications. #emph[Combinatorica] #strong[15]\(2):215--245, 1995. #link("https://doi.org/10.1007/BF01200757")[doi:10.1007/BF01200757].]
#bibitem([17])[OpenAI. Planar Graph Metrics Embed into $L_1$ with Constant Distortion. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Planar-Graph-Metrics-Embed-into-L1-with-Constant-Distortion-September-23-2026/paper.pdf")[OAI:Planar-Graph-Metrics-Embed-into-L1-with-Constant-Distortion-September-23-2026], 2026.]
#bibitem([18])[Neil Robertson and P. D. Seymour. Graph minors. V. Excluding a planar graph. #emph[Journal of Combinatorial Theory, Series B] #strong[41]\(1):92--114, 1986. #link("https://doi.org/10.1016/0095-8956(86)90030-4")[doi:10.1016/0095-8956(86)90030-4].]


