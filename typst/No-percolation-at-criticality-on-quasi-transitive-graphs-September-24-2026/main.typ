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

#align(center)[#text(size: 16pt, weight: "bold")[No percolation at criticality on quasi-transitive graphs]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Bernoulli bond percolation on an undirected graph $G = \( V \, E \)$ retains each edge independently with
  probability $p in \[ 0 \, 1 \]$. Retained edges are called open.
  The open cluster $C_x$ of a vertex $x$ consists of the vertices joined to $x$ by finite open paths,
  including $x$ itself. Write $x arrow.l.r A$ when $C_x$ meets a set $A subset.eq V$,
  and $x arrow.l.r y$ when $y in C_x$. With $bb(P)_p$ denoting the product law, the critical probability is

$ p_c \( G \) = inf { p in \[ 0 \, 1 \] : bb(P)_p \( upright("there is an infinite open cluster") \) > 0 } . $

A graph is #emph[quasi-transitive] if its automorphism group has finitely many orbits on vertices.
  This includes every vertex-transitive graph and every Cayley graph of a finitely generated group with a finite
  generating set.

The criticality problem asks whether an infinite cluster can first appear at the threshold itself.
  Benjamini and Schramm formulated the general quasi-transitive conjecture in their systematic study of
  percolation beyond Euclidean lattices #cite(label("BenjaminiSchramm1996")) Conjecture 4.

#thm([Theorem 1.1.])[
  #emph[Let $G$ be an infinite connected locally finite quasi-transitive undirected graph. If $p_c \( G \) < 1$, then
$ bb(P)_(p_c \( G \)) \( upright("there is an infinite open cluster") \) = 0 . $

 Equivalently, $bb(P)_(p_c \( G \)) \( \| C_x \| = oo \) = 0$ for every vertex $x$.]
] <thm:main>

Theorem 1 resolves the Benjamini–Schramm criticality conjecture positively for Bernoulli bond percolation.
  Its conclusion concerns all vertex orbits. The hypothesis $p_c < 1$ is necessary:
  at parameter one every edge is open, so an infinite connected graph percolates.
  In particular, the theorem includes nearest-neighbor bond percolation on $bb(Z)^d$ for every $d gt.eq 2$;
  see Corollary 23.

=== 1.1 The two subexponential arguments <the-two-subexponential-arguments>

For a vertex $x$, let $B \( x \, r \)$ be the graph-distance ball of integer radius $r$.
  Put $V_(-) \( r \) = min_x \| B \( x \, r \) \|$ and $V_(+) \( r \) = max_x \| B \( x \, r \) \|$.
  Quasi-transitivity makes these extrema finite and compares them up to a bounded shift of $r$.
  It also implies that $V_(+) \( r \)^(1 \/ r)$ has a limit.
  A limit greater than one is the exponential case covered by Hutchcroft.
  In the other case, the proof divides according to the following exhaustive alternatives:

+ $log V_(-) \( r \) \/ log r arrow.r oo$;
+ $V_(-) \( r \) lt.eq r^d$ along an unbounded sequence of radii, for some fixed finite $d$.

This division requires no classification of intermediate growth.

In case (i), suppose that an infinite cluster occurs at $p_c$.
  At a slightly smaller parameter, large finite clusters still occur with probability bounded away from zero.
  The volume growth then places two distinct large clusters within a distance that is small on the logarithmic
  scale of their sizes. Repeatedly bisecting a path between them produces a single adjacent pair.
  Each bisection adds at most one cluster and one possible connecting edge.
  We choose these edges using the decrease in a search’s conditional success probability,
  and control the total cost by relative entropy. Section 3 establishes the search and entropy estimates.
  Sections 4 and 5 show that the resulting adjacent pair contradicts the bound in Proposition 4:
  across a fixed edge, distinct clusters each of size at least $s$ occur with probability at most $C s^(- 1 \/ 2)$.

In case (ii), we apply the finitary structure theorem of Tessera and Tointon #cite(label("TesseraTointon2021"))
  Corollary 2.4 to an auxiliary vertex-transitive graph. Lifting its quotient action to $G$ and passing to a
  finite-index subgroup gives a finitely generated nilpotent quotient and a kernel with finite vertex orbits.
  Section 7 uses an induction on the number of infinite cyclic factors in a chosen series of that group.
  The one-dimensional case has $p_c = 1$. Otherwise there are two integer coordinates on vertices that change by a
  fixed translation under each group element. The induction excludes an infinite open ray whose two coordinates
  both remain bounded.

Under the assumed critical percolation, uniqueness and this exclusion produce two high-probability approximate
  moves in linearly independent coordinate directions in Section 8.
  After rescaling, the moves advance by $\( 1 \, 1 \)$ and $\( 1 \, - 1 \)$, with arbitrarily small edge steps.
  They persist at a parameter below $p_c$. In Section 9, we place corridors in these coordinates,
  with intersections confined to their common end regions. The joint gluing inequality (Theorem 10) transfers
  connections through each fresh corridor: reaching a relay set whose vertices have uniformly high target
  probabilities gives a high conditional chance of continuing to the target.
  Finally an adaptive exploration keeps the conditional chance of failure small at every tested site.
  A planar boundary count gives positive probability of infinitely many successful sites,
  hence an infinite open cluster below $p_c$. All paths and all revealed edges belong to $G$;
  the quotient supplies coordinates for this construction.

=== 1.2 History and related methods <history-and-related-methods>

Percolation was introduced by Broadbent and Hammersley #cite(label("BroadbentHammersley1957")).
  For nearest-neighbor bond percolation on $bb(Z)^d$, planar methods established critical nonpercolation in
  dimension two #cite(label("Harris1960")) #cite(label("Kesten1980")).
  The lace expansion gave the result in sufficiently high dimensions #cite(label("HaraSlade1990")),
  and Fitzner and van der Hofstad obtained it for $d gt.eq 11$ #cite(label("FitznerHofstad2017")).
  The sharpness theorems of Aizenman–Barsky and Menshikov describe the subcritical regime
  #cite(label("AizenmanBarsky1987")) #cite(label("Menshikov1986"));
  they do not by themselves settle the behavior at the threshold.

Beyond lattices, Benjamini, Lyons, Peres, and Schramm proved critical nonpercolation for nonamenable graphs
  admitting a unimodular quasi-transitive action #cite(label("BLPS1999Critical")).
  Timár excluded infinitely many infinite critical clusters on transitive nonunimodular graphs
  #cite(label("Timar2006Nonunimodular")), leaving the possibility of a unique infinite cluster.
  Hutchcroft excluded all infinite critical clusters on every quasi-transitive graph of exponential growth
  #cite(label("Hutchcroft2016")) Theorem 1.2; we use that entire theorem.
  Hermon and Hutchcroft treated unimodular quasi-transitive graphs satisfying a uniform stretched-exponential
  return-probability bound with exponent greater than $1 \/ 2$ #cite(label("HermonHutchcroft2021")) Theorem 1.2.
  The two arguments above cover the remaining subexponential case.

Our joint gluing theorem also has a finite-graph and lattice history that is distinct from the general
  quasi-transitive conclusion. Kozma and Nitzan conjectured the multiplicative connection inequality
  #cite(label("KozmaNitzan2024")) Conjecture 1 and showed that their weaker uniform near-one gluing Conjecture 3
  implies critical nonpercolation on $bb(Z)^d$ for every $d gt.eq 2$ #cite(label("KozmaNitzan2024")) Theorem 6.
  Leder’s public account reports a Lean formalization of that lattice conclusion and displays the first-contact
  comparison (GEN) #cite(label("Leder2026")) Section 3.4. Although the account does not claim Conjecture 1,
  (GEN) implies the finite joint inequality: take its increasing cluster functional to be the indicator of meeting
  the target and bound the resulting weighted mean by its minimum.
  The subsequent public manuscript #cite(label("ConnectionInequalities2026")) explicitly records this consequence
  and stronger finite connection comparisons. Its public site-percolation extension
  #cite(label("SiteCriticality2026")) treats independent labelled hyperedges and critical site percolation on
  $bb(Z)^d$ for $d gt.eq 3$. We give a direct joint-gluing proof with this antecedent credit.
  These finite and lattice results do not assert Theorem 1 for general quasi-transitive graphs.

The probabilistic tools are developed with their local predecessors at their points of use.
  The adjacent-cluster bound adapts the boundary-discrepancy method of Aizenman, Kesten,
  and Newman #cite(label("AizenmanKestenNewman1987")) Section 3 and Hutchcroft’s ghost-field formulation
  #cite(label("Hutchcroft2020Locality")) Section 3. Conditional association was developed by van den Berg and Kahn
  #cite(label("VanDenBergKahn2001")); alternating conditional-cluster resampling is the method of van den Berg,
  Häggström, and Kahn #cite(label("VanDenBergHaggstromKahn2006")).
  Decision-tree inequalities #cite(label("OSSS2005")) #cite(label("DuminilCopinRaoufiTassion2019")) provide
  related links between exploration and pivotality; here the local estimate uses the martingale of conditional
  connection probabilities. The entropy bound accommodates adaptive read sets whose overlap is controlled only
  under a comparison law, beyond the fixed-set setting of Shearer’s inequality and its relative-entropy forms
  #cite(label("ChungGrahamFranklShearer1986")) #cite(label("MadimanTetali2010")).

The geometric construction adapts the seed and adaptive-block strategy of Grimmett and Marstrand
  #cite(label("GrimmettMarstrand1990")) and the fresh-collar and stored-prediction arguments of Kozma and Nitzan
  #cite(label("KozmaNitzan2024")) Lemma 10 and proof of Theorem 6.
  Critical extinction in each fixed slab #cite(label("DuminilCopinSidoraviciusTassion2016Slabs")) does not alone
  give the full-lattice conclusion. Choosing useful directions by exit probabilities is related to Martineau and
  Tassion’s parallelogram construction #cite(label("MartineauTassion2017")).
  Here the two-direction argument and the conditional-failure boundary count are carried out on the original
  graph, including when the reveal domains are countable.

The structural reduction runs from Gromov’s polynomial-growth theorem #cite(label("Gromov1981")) through
  Trofimov’s graph and near-polynomial-growth theorems #cite(label("Trofimov1985")) #cite(label("Trofimov2003"))
  to Tessera and Tointon’s one-scale theorem #cite(label("TesseraTointon2021")) Corollary 2.4.
  The latter develops the approximate-group method of Breuillard, Green,
  and Tao #cite(label("BreuillardGreenTao2012")) and supplies the quotient action and stabilizer information used
  here. Related nilpotent quotients occur in percolation locality on polynomial-growth graphs
  #cite(label("ContrerasMartineauTassion2023Locality")). In this paper the quotient supplies coordinates;
  every connection and exposure uses original edges.

== 2 Uniformity and the growth alternatives <sec:preliminaries>

We record the reductions needed to use finite arguments uniformly on the infinite graph.
  Graph distance always counts edges. Unless specified otherwise,
  balls are induced subgraphs as well as vertex sets. The maximum degree is denoted by $D$.

=== 2.1 Graph conventions and the threshold <graph-conventions-and-the-threshold>

It suffices to prove Theorem 1 for simple graphs. Indeed, loops have no effect on clusters.
  If parallel edges occur, subdivide each edge once, using a distinct new vertex for each edge.
  The resulting graph is simple and remains connected and locally finite.
  There are finitely many edge orbits, since there are finitely many vertex orbits and each representative has
  finite degree. Lifting the original automorphisms therefore proves quasi-transitivity of the subdivided graph.
  At parameter $t$, each original edge is fully traversable with probability $t^2$, independently of the others.
  An infinite cluster in the subdivided graph contains infinitely many original vertices, by local finiteness.
  Thus percolation on it occurs exactly when the effective configuration on the original graph percolates,
  and its critical probability is $sqrt(p_c \( G \))$. The simple-graph conclusion at this parameter gives the
  desired conclusion on $G$.

Henceforth the infinite graph is simple. Finite auxiliary graphs may have parallel edges after contractions.
  Local finiteness and connectedness imply countability. Finitely many vertex orbits imply $D < oo$.
  For $p < 1 \/ D$, the probability of an open simple path of length $n$ starting at $x$ is at most $D^n p^n$,
  which tends to zero. An infinite cluster would contain such a path for every $n$, so

#[#set math.equation(numbering: n => "(1)")
 $ p_c gt.eq 1 \/ D > 0 . $ <eq:positive-threshold>]

The event that some infinite cluster exists is unchanged by altering finitely many edge states:
  adding finitely many edges joins only finitely many clusters,
  and deleting finitely many edges splits an infinite cluster into finitely many pieces.
  It is therefore a tail event and has probability zero or one.
  Monotonicity in $p$ shows that our definition of $p_c$ agrees with the supremum of the parameters at which
  almost surely every cluster is finite. In particular all clusters are finite almost surely for $p < p_c$.

We use Harris’s inequality: increasing functions of independent edge states have nonnegative covariance
  #cite(label("Harris1960")). For finitely many bits, this follows by induction from the covariance decomposition
  after conditioning on one bit; the two conditional means are themselves increasing.
  For bounded functions of countably many bits, conditional expectations on finite sets of coordinates and
  martingale convergence give the same conclusion. Decreasing functions are likewise positively correlated;
  an increasing and a decreasing function are negatively correlated.

If critical percolation occurs with positive probability,
  countability gives a vertex $x$ with $bb(P)_(p_c) \( \| C_x \| = oo \) > 0$.
  For a fixed path from $y$ to $x$, Harris’s inequality bounds $bb(P)_(p_c) \( \| C_y \| = oo \)$ below by this
  positive probability times $p_c$ to the path length. Finitely many vertex orbits then give

#[#set math.equation(numbering: n => "(2)")
 $ theta := min_(x in V) bb(P)_(p_c) \( \| C_x \| = oo \) > 0 . $ <eq:uniform-jump>]

This uniform lower bound is the contradiction hypothesis in both subexponential arguments.

=== 2.2 Ball comparisons <ball-comparisons>

#thm([Lemma 2.1.])[
  #emph[There is an integer $C_0$ such that every vertex orbit meets every ball of radius $C_0$.
    Moreover, for nonnegative integer radii,
#[#set math.equation(numbering: n => "(3)")
 $ V_(+) \( r \) lt.eq V_(-) \( r + C_0 \) \, wide V_(+) \( r + s \) lt.eq
   V_(+) \( r \) V_(+) \( s \) . $ <eq:ball-comparisons>]

 The limit $gamma = lim_(r arrow.r oo) V_(+) \( r \)^(1 \/ r)$ exists.
   If $gamma > 1$, every vertex ball has exponential growth; if $gamma = 1$, then $log V_(+) \( r \) = o \( r \)$.]
] <lem:orbit-growth>

#proof[
  Choose a representative in each of the finitely many orbits.
    For each representative and each orbit, fix a path to that orbit,
    and let $C_0$ bound the lengths of these finitely many paths. Translating them proves the density assertion.
    To compare balls, move the center of a ball attaining $V_(+) \( r \)$ within distance $C_0$ of a center
    attaining $V_(-) \( r + C_0 \)$. The translated smaller ball lies in the larger one.
    Also $B \( x \, r + s \)$ is covered by the radius-$s$ balls centered in $B \( x \, r \)$,
    proving the second inequality.
  Thus $log V_(+) \( r \)$ is subadditive. Dividing a radius into blocks of any fixed length shows that its
    quotient by $r$ converges to its infimum. This proves existence of $gamma$.
    Finally $V_(+) \( r - C_0 \) lt.eq \| B \( x \, r \) \| lt.eq V_(+) \( r \)$ for $r gt.eq
    C_0$ gives the claimed uniform growth conclusions. ◻
]

We now invoke precisely the following external result.

#thm([Theorem 2.2.])[
  (Hutchcroft #cite(label("Hutchcroft2016")) Theorem 1.2).  #emph[If a connected locally finite quasi-transitive
    graph satisfies $liminf_(r arrow.r oo) \| B \( x \, r \) \|^(1 \/ r) > 1$,
    then it has almost surely no infinite Bernoulli bond cluster at its critical probability.]
] <thm:exponential>

It remains to work under $log V_(+) \( r \) = o \( r \)$. Either

#[#set math.equation(numbering: n => "(4)")
 $ frac(log V_(-) \( r \), log r) arrow.r oo \, $ <eq:superpoly-growth>]

or this quotient is bounded along an unbounded sequence of integer radii.
  In the latter case there is a finite $d$ such that

#[#set math.equation(numbering: n => "(5)")
 $ V_(-) \( r \) lt.eq r^d quad upright("along that sequence.") $ <eq:polynomial-subsequence>]

These alternatives are exhaustive, including when the quotient oscillates.

=== 2.3 Exact clusters and finite witnesses <exact-clusters-and-finite-witnesses>

Conditioning on the exact vertex set of a cluster fixes its boundary edges closed and imposes only an internal
  connectivity condition. Consequently the edges induced outside that set keep their product law.
  Revealing every incident edge, including internal edges, has the same property.
  We will specify which of these two exposures is being used.

The event $\| C_x \| gt.eq s$, for a fixed positive integer $s$, can be witnessed inside $B \( x \, s - 1 \)$:
  a connected cluster of at least $s$ vertices contains a connected set of $s$ vertices containing $x$.
  Its probability is therefore continuous in $p$. A connection between fixed finite sets is the increasing union
  of connections in finite induced subgraphs. Its probability can be approximated from below by such finite
  events, at the same parameter $p$. These observations also apply uniformly to finitely many vertex or pair orbits.

== 3 Two clusters, depth-first search, and entropy <sec:dfs-entropy>

The interpolation argument will join clusters along a short path while controlling the change in probability.
  We prepare its three inputs: a bound on adjacent large distinct clusters,
  a second-moment estimate for depth-first pivotal edges, and an entropy bound for several explorations of the
  same configuration.

=== 3.1 Adjacent large distinct clusters <adjacent-large-distinct-clusters>

For an edge $e = x y$ and an integer $s gt.eq 1$, write

$ H_s \( e \) = { C_x eq.not C_y \, med \| C_x \| gt.eq s \, med \| C_y \| gt.eq s } . $

Cluster size means the number of vertices. The next estimate is uniform over the edges,
  including those in different automorphism orbits. Its proof adapts the cluster-boundary discrepancy argument of
  Aizenman, Kesten, and Newman #cite(label("AizenmanKestenNewman1987")) Section 3 and Hutchcroft’s ghost-field and
  martingale formulation #cite(label("Hutchcroft2020Locality")) Section 3.
  We give the finite-graph averaging argument and its quasi-transitive passage explicitly.

#thm([Proposition 3.1.])[
  #emph[Let $G$ be an infinite connected locally finite quasi-transitive graph of subexponential growth.
    For every $p_(*) > 0$ there is $C < oo$ such that
$ bb(P)_p \( H_s \( e \) \) lt.eq C s^(- 1 \/ 2) wide \( e in E \( G \) \, med s gt.eq 1 \, med p_(*) lt.eq p < 1 \) . $

 The constant may depend on $G$ and $p_(*)$.]
] <prop:two-cluster>

#proof[
  Let $D$ bound the degrees of $G$. We first prove an averaged estimate on any finite induced subgraph $F$.
    Independently of the edge states, mark each vertex with probability $1 - e^(- h)$, where $0 < h lt.eq 1$.
    Let $T_e$ be the event that the endpoints of $e$ lie in distinct clusters both containing a mark.
    Let $N_e$ count the marked clusters incident to $e$, counting a cluster only once even when it contains both
    endpoints, and put $I_e = upright(bold(1))_({ N_e gt.eq 1 })$.
    Flipping $e$ does not change the union of its endpoint clusters, so $I_e$ is unchanged by that flip.
    For closed $e$, $upright(bold(1))_(T_e) = N_e - I_e$, whereas for open $e$, $N_e = I_e$.
    With $q = 1 - p$, conditioning on all other edges therefore gives
  #[#set math.equation(numbering: n => "(6)")
   $ sum_(e in E \( F \)) bb(P)_p \( T_e \) = bb(E)_p sum_(K upright(" marked cluster"))
     (c \( K \) - q / p thin o \( K \)) \, $ <eq:marked-cluster-discrepancy>]
  where $c \( K \)$ and $o \( K \)$ count the closed and open edges incident to $K$, respectively.
    Each incidence is counted once per cluster.
  Explore a cluster $C_v$, querying all its incident edges, including internal edges, once each.
    If $T$ is the number of queries and $m = \| C_v \|$, then $T lt.eq D m$ and, when $T > 0$, $m lt.eq T +
    1 lt.eq 2 T$. The fresh query bits are independent Bernoulli variables of parameter $p$; after stopping,
    extend them with independent auxiliary bits. Let $Z_j$ be their centered partial sums.
    Since $o \( C_v \)$ is the number of open query bits,
  $ c \( C_v \) - q / p o \( C_v \) = - 1 / p Z_T . $
  Rewrite the sum over clusters in (6) as a sum over vertices, dividing the summand by the cluster size.
    Averaging the marks and taking absolute values gives
  #[#set math.equation(numbering: n => "(7)")
   $ frac(1, \| V \( F \) \|) sum_e bb(P)_p \( T_e \) lt.eq D /
     p max_(v in V \( F \)) bb(E)_p [frac(\| Z_T \|, T) min { 2 h T \, 1 }] \, $ <eq:marked-average-bound>]
  with value zero when $T = 0$. Doob’s maximal inequality yields
  $ bb(E)_p max_(j lt.eq 2^(k + 1)) \| Z_j \| lt.eq 2 sqrt(p q thin 2^(k + 1)) . $
  Partitioning according to $2^k lt.eq T < 2^(k + 1)$, the expectation in (7) is at most
  $ C_0 sqrt(p q) sum_(k gt.eq 0) 2^(- k \/ 2) min { 2^(k + 2) h \, 1 } lt.eq C_1 sqrt(p q) sqrt(h) . $
  For the last bound, split the sum where $2^k h$ first exceeds one;
    both resulting geometric series are bounded by a constant times $sqrt(h)$.
    On $H_s \( e \)$, conditional on the edges, the two clusters are marked with probability at least
    $\( 1 - e^(- h s) \)^2$. Taking $h = 1 \/ s$ therefore proves
  #[#set math.equation(numbering: n => "(8)")
   $ sum_(e in E \( F \)) bb(P)_p^F \( H_s \( e \) \) lt.eq C_2 \| V \( F \) \| s^(- 1 \/ 2) \,
     $ <eq:finite-two-cluster-average>]
  uniformly for $p gt.eq p_(*)$.
  To pass to an individual edge, choose $C'_0$ so that every vertex orbit is $C'_0$-dense.
    Fix an edge $e = x y$ and a center $o$. For every vertex of $B \( o \, n \)$,
    choose a point in the orbit of $x$ within distance $C'_0$.
    There are at least $\| B \( o \, n \) \| \/ V_(+) \( C'_0 \)$ distinct chosen points.
    At each, an automorphic copy of $e$ has both endpoints in $B \( o \, n + C'_0 + 1 \)$.
    Each unoriented edge is counted at most twice, so the number of distinct copies is at least
  $ frac(\| B \( o \, n \) \|, 2 V_(+) \( C'_0 \)) . $
  For fixed $s$, subexponential growth gives arbitrarily large $n$ with
  $ \| B \( o \, n + C'_0 + s + 1 \) \| lt.eq 2 \| B \( o \, n \) \| . $
  Otherwise iteration of this fixed-width expansion would force exponential growth.
    Set $F = G \[ B \( o \, n + C'_0 + s + 1 \) \]$. A connected cluster with at least $s$ vertices has a
    connected $s$-vertex witness within distance $s - 1$ of any specified vertex.
    Thus $H_s$ in the full graph implies $H_s$ in $F$ for each selected copy;
    restriction also preserves distinctness. All copies have the same full-graph probability.
    Apply (8) and the displayed bounds to obtain the proposition. The constants do not depend on the orbit of $e$. ◻
]

=== 3.2 Clusters conditioned to avoid one another <clusters-conditioned-to-avoid-one-another>

Conditional association of connection events was established by van den Berg and Kahn
  #cite(label("VanDenBergKahn2001")). The pivotal estimate uses the cluster-function correlation inequality of van
  den Berg, Häggström, and Kahn #cite(label("VanDenBergHaggstromKahn2006")) Theorems 1.3 and 1.4.
  We include the product-measure proof by alternating cluster updates,
  the method of #cite(label("VanDenBergHaggstromKahn2006")) Section 2.1.
  Here a cluster object records its vertices and all its open edges.
  For a root set, take the union of the cluster objects of its roots.
  Objects are ordered by inclusion of both vertices and edges.
  A random object is #emph[associated] if any two increasing real-valued functions of it have nonnegative covariance.

#thm([Lemma 3.2.])[
  (Avoidance correlation).  #emph[Let $G$ be a finite undirected graph with independent edge probabilities
    strictly between zero and one. Let $A \, B$ be disjoint nonempty vertex sets.
    Conditional on $A ↮ B$, each of the two cluster objects $C \( A \)$ and $C \( B \)$ is associated.
    If $f$ and $g$ are increasing functions of the respective objects, then
$ "Cov" #scale(x: 120%, y: 120%)[\(] f \( C \( A \) \) \,
  g \( C \( B \) \) divides A ↮ B #scale(x: 120%, y: 120%)[\)] lt.eq 0 . $

]
] <lem:avoidance>

#proof[
  Given one exact object under avoidance, the other has its ordinary product-cluster law after deleting the first
    object’s vertices. Indeed, the exact object fixes its open internal edges, its closed internal edges,
    and its closed boundary edges; all edges wholly outside it retain their independent laws.
    Avoidance is then automatic. By restriction of a common configuration,
    this conditional law is stochastically decreasing as the deleted object grows.
  Start with a deterministic admissible object at $A$, sample the object at $B$ by this conditional law,
    then update the object at $A$ in the same manner, and repeat. Association is preserved at every half-step.
    To see this, conditional on the current object, the next object is an increasing function of independent bits
    and is associated by Harris’s inequality. The two conditional means of increasing functions of the next object
    are decreasing functions of the current object. Their covariance is nonnegative when the current object is
    associated. The conditional covariance identity proves the assertion.
  The two-step chain on the $A$ objects has the avoidance marginal as a stationary law,
    because its updates are the two conditional laws of that joint distribution.
    Every transition has a common positive mass at the minimal object consisting of $A$ and no open edges:
    close all edges incident to $A$ in its update. This probability is bounded below by the product of the
    closed-edge probabilities over all edges of $G$. Subtracting that common mass from every transition shows that
    total variation distances contract by a factor strictly less than one.
    Consequently the chain converges to its stationary law. Association passes to this finite-state limit,
    proving association of $C \( A \)$; the same argument applies to $C \( B \)$.
  Finally, the conditional mean of $g \( C \( B \) \)$ given $C \( A \)$ is decreasing in $C \( A \)$.
    Association of the latter object makes its covariance with the increasing function $f \( C \( A \) \)$
    nonpositive. Taking conditional expectations proves the claimed cross covariance. ◻
]

=== 3.3 A depth-first pivotal second moment <a-depth-first-pivotal-second-moment>

Fix a finite undirected graph, a vertex $w$, and a deterministic target set $B$.
  Write $E = { w arrow.l.r B }$ and let $mu$ be homogeneous Bernoulli percolation with parameter $0 < p < 1$,
  with $q = 1 - p$. Parallel edges are allowed. We use the following deterministic lazy depth-first search.
  On reaching a vertex, push its unqueried edges to unreached vertices onto a stack in a fixed order.
  Pop the last entry; if its head has meanwhile been reached, skip it without reading its bit.
  Otherwise query the bit, reaching its head when it is open. Stop on reaching $B$ or exhausting the stack.

A #emph[query prefix] records the previously queried edges and their states. At a query of $e$, put

$ h = mu \( E divides upright("prefix") \) \, wide h_b = mu \( E divides upright("prefix") \, X_e = b \) \, wide
  d_e = h_1 - h_0 . $

These probabilities condition only on that search’s own query prefix.
  They are not conditioned on any additional cluster information that another construction may possess.
  Since $E$ is increasing, $0 lt.eq d_e lt.eq 1$. A queried edge is an #emph[actual open pivot] if it is open and
  closing it destroys $E$ in the full configuration, including unqueried edges.

#thm([Lemma 3.3.])[
  #emph[For the preceding search, let
$ W = sum_(e upright(" queried actual open pivot")) q d_e . $

 Then $bb(E)_mu W lt.eq 1$ and $bb(E)_mu W^2 lt.eq 3$.]
] <lem:dfs>

#proof[
  The claim is immediate if $w in B$ or $B = diameter$. The conditional probabilities of $E$ form a martingale
    along the search. At a query its conditional variance increment is $p q d_e^2$. The search decides $E$, so
  #[#set math.equation(numbering: n => "(9)")
   $ bb(E)_mu sum_(e upright(" queried")) p q d_e^2 = "Var"_mu \( upright(bold(1))_E \) lt.eq
     1 . $ <eq:dfs-variance-budget>]
  Given the pre-query prefix, the probability of an actual open pivot is $p d_e$. Thus (9) equals $bb(E) W$.
    It also bounds the diagonal terms in $bb(E) W^2$, since $p d_e \( q d_e \)^2 lt.eq p q d_e^2$.
  It remains to bound the products of weights from two pivots.
    We prove the following conditional estimate for each earlier query $f$:
  #[#set math.equation(numbering: n => "(10)")
   $ bb(E)
     [upright(bold(1))_({ f upright(" actual pivot") }) sum_(e upright(" later actual open pivot")) q d_e thin
     mid(bar.v) thin upright("prefix of ") f \, med f upright(" open")] lt.eq d_f . $ <eq:dfs-future-pair-bound>]
  Its right side is the pivotal probability before reading $f$.
    Multiplying by the probability $p$ that $f$ is open and by its weight $q
    d_f$ will bring the pair sum back within the variance budget (9).
  Fix this prefix and condition on $f$ being open, with new head $z$. If $z in B$ there are no later queries.
    Otherwise contract the vertices reached before $f$ to a root $A$ and delete $f$ for the connectivity
    calculations that follow. Those vertices are connected by known open edges and contain no target vertex.
    If $f$ is an actual pivot, $z$ connects to $B$ without using $A$, while $A$ does not connect to $B$.
    The depth-first subsearch from $z$ then succeeds before any older stack entry is resumed.
    We call this subsearch, stopped on success or exhaustion, the #emph[phase].
  At a query $e$ in the phase, contract its already reached vertices to $S$, containing $z$,
    and wire $B$ to one target vertex. Keep $A$ and $S$ separate:
    their only known open link before deletion was $f$. Delete queried closed edges.
    All unqueried edges remain independent, including older stack edges whose endpoints may now lie in $A$ and
    $S$. Whether still pending or already skipped, they have not been tested.
    The tail of $e$ lies in $S$ and its head $b$ is unreached.
  In this residual product graph with $e$ held closed, let
  $ upright("connectivity of ") A \, S \, B & upright("all separate") & S B upright(" only") & A B
    upright(" only") & A S upright(" only")\
upright("probability") & u & v & v_A & x . $
  The remaining possibility is that all three are connected. Define
  $ alpha & = bb(P) \( upright("all separate") \, med b arrow.l.r B \) \, & beta & =
    bb(P) \( upright("all separate") \, med b arrow.l.r A \) \,\
gamma & = bb(P) \( S B upright(" only") \, med b arrow.l.r A \) \, & sigma & =
  bb(P) \( A S upright(" only") \, med b arrow.l.r B \) . $
  Here and until the next conditioning all probabilities refer to the unqueried product bits with $f \,
    e$ deleted. In the actual search $f$ is open, so $A$ and $S$ are wired together when computing $d_e$. Consequently
  #[#set math.equation(numbering: n => "(11)")
   $ d_e = alpha + sigma \, wide
     bb(P) \( f \, e upright(" both actual open pivots") divides upright("prefix") \, f upright(" open") \) =
     p alpha . $ <eq:dfs-partition-pivots>]
  Indeed, opening $e$ joins the wired source to the target exactly in the $alpha$ or $sigma$ cases.
    In the second case $A$ was already connected to $S$ without $f$, so $f$ is not pivotal;
    the first case gives both pivots.
  Apply Lemma 5 with root sets $A$ and $S union B$, using the increasing events $b arrow.l.r A$ and $S arrow.l.r
    B$ in their respective cluster objects. It gives $gamma u lt.eq v beta$.
    Reversing the roles, with roots $B$ and $A union S$, gives $sigma u lt.eq x alpha$.
    The two decreasing isolation events $A ↮ S union B$ and $B ↮ A union
    S$ have intersection of probability $u$. Harris’s inequality therefore gives
  #[#set math.equation(numbering: n => "(12)")
   $ gamma u lt.eq v beta \, wide sigma u lt.eq x alpha \, wide
     u gt.eq \( u + v \) \( u + x \) . $ <eq:dfs-isolation-inequalities>]
  In particular, when $u > 0$,
  #[#set math.equation(numbering: n => "(13)")
   $ d_e lt.eq alpha frac(u + x, u) lt.eq frac(alpha, u + v) . $ <eq:dfs-pivotal-comparison>]
  The open-edge information in the cluster objects matters here:
    the union of the root vertices alone does not determine $S arrow.l.r B$.
  We now pay for these later pivotal weights with a second martingale.
    An actual pivot $f$ requires the old root $A$ to avoid both $z$ and the target.
    Accordingly, for the rest of the phase condition the deleted-$f$ configuration on the fixed event
  $ U = { A ↮ { z \, B } } . $
  Let $U_(upright("init"))$ be its probability at the beginning of the phase.
    If it is zero, no pair involving an actual pivot $f$ contributes.
    Otherwise, under this conditioned law, let $r$ be the conditional probability of $z arrow.l.r
    B$ along the phase. This is a bounded martingale even though its query bits are no longer Bernoulli with
    parameter $p$.
  At the current prefix write $U_0 \, U_1$ for the probabilities of $U$ when $e$ is closed and open.
    The partition above gives
  $ U_0 = u + v \, wide U_1 = U_0 - beta - gamma \, wide U_(upright("pre")) = q U_0 + p U_1 . $
  The corresponding probabilities of $U ∩ { z arrow.l.r B }$ are $v$ and $v + alpha - gamma$. Hence, whenever $U_1 > 0$,
  #[#set math.equation(numbering: n => "(14)")
   $ r_1 - r_0 = frac(U_0 alpha + v beta - u gamma, U_0 U_1) gt.eq alpha / U_1 . $ <eq:dfs-tilted-increment>]
  The conditional bit probabilities under the tilt are $p U_1 \/ U_(upright("pre"))$ and $q U_0 \/ U_(upright("pre"))$.
  Bayes’s formula multiplies the ordinary probability of this prefix by $U_(upright("pre")) \/
    U_(upright("init"))$. Thus, after multiplying the tilted martingale variance budget by $U_(upright("init"))$,
    its contribution at this prefix, expressed under the ordinary phase law, is
  $ p q frac(U_0 U_1, U_(upright("pre"))) \( r_1 - r_0 \)^2 . $
  If $alpha > 0$, then $u > 0$ and $U_1 gt.eq alpha > 0$; moreover $U_1 \, U_(upright("pre")) lt.eq U_0$.
    Equations (14) and (13) therefore give
  #[#set math.equation(numbering: n => "(15)")
   $ p q frac(U_0 U_1, U_(upright("pre"))) \( r_1 - r_0 \)^2 gt.eq
     p q frac(U_0 alpha^2, U_(upright("pre")) U_1) gt.eq p q alpha^2 / U_0 gt.eq
     p q alpha d_e . $ <eq:dfs-converted-budget>]
  When $alpha = 0$, discard the nonnegative variance contribution. The total converted variance is at most
  $ U_(upright("init")) r_(upright("init")) =
    bb(P) \( U \, med z arrow.l.r B divides upright("initial prefix") \) = d_f . $
  The last equality is precisely the pivotal event for $f$ before its bit is read.
    Using (11), the converted variance therefore bounds the conditional expected sum on the left of (10).
    All contributions when $f$ is pivotal occur inside the phase, as noted above,
    so this proves that estimate with the sum over every later query.
  Multiply (10) by $p q d_f$, average over the prefix of $f$, and sum over $f$.
    The sum of products over ordered pivot pairs is bounded by $bb(E) sum_f p q d_f^2 lt.eq 1$.
    Combining this with the diagonal bound and the factor two for cross terms in $W^2$ proves $bb(E) W^2 lt.eq 3$. ◻
]

=== 3.4 Entropy of overlapping transcripts <entropy-of-overlapping-transcripts>

For fixed coordinate subsets, related bounds are given by Shearer’s inequality
  #cite(label("ChungGrahamFranklShearer1986")) and its relative-entropy forms #cite(label("MadimanTetali2010"))
  Section IX. The read sets below are adaptive, and their overlap is bounded only under a possibly dependent
  comparison law. We prove the required estimate by ordering the algorithms randomly and charging each freshly
  queried bit to a common transcript.

A transcript records an algorithm’s ordered queries and answers, including its stopping decision.
  The next result charges several such transcripts to the information in one common configuration.
  Its overlap hypothesis is required only under the law being estimated.

For probability laws $Q \, R$ on a finite set, let

$ D \( Q bar.v.double R \) = sum_x Q \( x \) log frac(Q \( x \), R \( x \)) $

be their relative entropy, with zero summands omitted.

#thm([Lemma 3.4.])[
  #emph[Let $mu$ be the Bernoulli product law of parameter $0 < p < 1$ on a finite set of bits,
    and let $Q$ be any probability law on those bits. Consider finitely many terminating deterministic adaptive
    query algorithms, each reading any bit at most once. Let $Q_i \, mu_i$ be their transcript laws.
    Suppose that, on the support of $Q$, every bit is read by at most $a$ algorithms, where $a gt.eq
    1$ is an integer. Then
$ sum_i D \( Q_i bar.v.double mu_i \) lt.eq frac(a^2, 2 p \( 1 - p \)) D \( Q bar.v.double mu \) . $

]
] <lem:entropy>

#proof[
  Write $q = 1 - p$. At a pre-query node $h$ of algorithm $i$, let $e$ be the bit it queries and put $b_h =
    bb(E)_Q \[ X_e - p divides h \]$. The transcript entropy chain rule and the elementary Bernoulli bound
  $ d \( r bar.v.double p \) := r log r / p + \( 1 - r \) log frac(1 - r, q) lt.eq frac(\( r - p \)^2, p q) $
  give
  #[#set math.equation(numbering: n => "(16)")
   $ sum_i D \( Q_i bar.v.double mu_i \) lt.eq frac(1, p q) sum_(i \, h) Q \( h \) b_h^2 .
     $ <eq:local-transcript-entropy>]
  The Bernoulli reference at each node is still $p$, since its own history has not read that bit.
    The displayed bound follows from $log t lt.eq t - 1$, including endpoint values by continuity.
  Assign independent uniform priorities in $\[ 0 \, 1 \]$ to the algorithms and run them in priority order,
    caching previously read bits. Each algorithm follows exactly its original path;
    a cached answer supplies the same bit without a fresh query.
    For every fixed priority order, the combined fresh-query transcript is a function of the configuration.
    Data processing and the entropy chain rule give total fresh-query entropy at most $D \( Q bar.v.double mu \)$.
    The binary lower bound $d \( r bar.v.double p \) gt.eq 2 \( r - p \)^2$ follows because its second derivative
    in $r$ is $1 \/ \( r \( 1 - r \) \) gt.eq 4$, and its value and first derivative vanish at $r = p$. It implies
  #[#set math.equation(numbering: n => "(17)")
   $ bb(E)_(upright("priorities")) sum_(g upright(" global fresh-query node")) Q \( g \) b_g^2 lt.eq 1 /
     2 D \( Q bar.v.double mu \) \, $ <eq:global-transcript-budget>]
  where $b_g$ is the conditional bias given the entire global pre-query history and the fixed priorities.
  Fix a local node $h$ of algorithm $i$ with $Q \( h \) > 0$, querying $e$, and condition its priority to be $t$.
    For a configuration $omega$, let $K_e \( omega \)$ be the number of algorithms that read $e$.
    On configurations visiting $h$, $1 lt.eq K_e lt.eq a$, $Q$-almost surely.
    The read paths are unchanged by caching. Conditional on such a configuration,
    the query at $h$ is fresh exactly when all other $K_e - 1$ users have priority larger than $t$,
    an event of probability $\( 1 - t \)^(K_e - 1)$. The number $K_e$ may be correlated with $X_e$ under $Q$,
    so this freshness weight cannot be pulled out of a conditional expectation of the bias.
    Retain their dependence by defining
  $ z_h \( t \) = bb(E)_Q \[ \( X_e - p \) \( 1 - t \)^(K_e - 1) divides h \] \, wide w_h \( t \) =
    bb(E)_Q \[ \( 1 - t \)^(K_e - 1) divides h \] . $
  Pool the global pre-query nodes at which this local node is visited fresh, averaging the other priorities.
    Their total probability is $Q \( h \) w_h \( t \)$, and the sum of their probability-weighted biases is
    $Q \( h \) z_h \( t \)$. This pooling is legitimate before the bit is read:
    the current local node and membership in the cache are determined by the global pre-query history.
    Cauchy–Schwarz thus bounds their total squared-bias contribution below by
  #[#set math.equation(numbering: n => "(18)")
   $ Q \( h \) frac(z_h \( t \)^2, w_h \( t \)) \, $ <eq:entropy-pooled-bias>]
  with value zero when $w_h \( t \) = 0$. Every global fresh query belongs to exactly one local node,
    so these lower bounds can be summed over all nodes.
  At priority zero no other algorithm precedes $i$, so $z_h \( 0 \) = b_h$:
    this endpoint recovers the original local bias. The overlap bound makes $z_h$ a polynomial of degree at most
    $a - 1$, since $K_e in { 1 \, dots.h \, a }$ on the conditional $Q$ support. Also $0 lt.eq w_h lt.eq 1$.
    For any polynomial $z$ of degree at most $a - 1$, the classical shifted-Legendre endpoint bound
    #cite(label("DLMF")) Tables 18.3.1 and 18.6.1 gives
  #[#set math.equation(numbering: n => "(19)")
   $ \| z \( 0 \) \|^2 lt.eq a^2 integral_0^1 \| z \( t \) \|^2 thin d t . $ <eq:polynomial-endpoint>]
  Indeed, expand in the orthonormal shifted Legendre polynomials of degrees $0 \, dots.h \, a - 1$.
    Their squared endpoint values are $1 \, 3 \, dots.h \, 2 a - 1$, with sum $a^2$,
    and Cauchy–Schwarz gives (19). Integrating (18) therefore yields at least $Q \( h \) b_h^2 \/ a^2$.
    Combine with (17) and then (16) to prove the lemma.
  No overlap bound under $mu$ was used. The random variable $K_e$ may be correlated with $X_e$ under $Q$;
    this correlation is retained inside $z_h \( t \)$ throughout the argument. ◻
]

== 4 Finite interpolation <sec:interpolation>

The depth-first and entropy estimates let us move two large distinct clusters from the ends of a path to the ends
  of one edge. Binary subdivision limits the number of new clusters used to a logarithm of the path length.
  We must also control the probability cost of joining these clusters;
  counting the opened edges alone does not control how many original configurations can produce the same output.

#thm([Proposition 4.1.])[
  (Interpolation along a path).  #emph[Let $mu$ be Bernoulli bond percolation with parameter $p
    in \( 0 \, 1 \)$ on a finite undirected graph, and put $q = 1 - p$.
    Let $x_0 \, x_1 \, dots.h \, x_d$ be a simple path, with $d gt.eq 2$. Suppose that
$ mu \( x_j arrow.l.r x_k \) gt.eq c > 0 wide \( 0 lt.eq j < k lt.eq d \, med k - j < d \) . $

 For an integer $s gt.eq 1$, suppose that the clusters of $x_0 \,
   x_d$ are distinct and both have at least $s$ vertices with probability $delta > 0$.
   There is a path edge $e$ such that
$ - log mu \( H_s \( e \) \) lt.eq C #scale(x: 120%, y: 120%)[\(] log \( 1 \/ delta \) + ceil.l log_2 d ceil.r +
  1 #scale(x: 120%, y: 120%)[\)] . $

 Here $H_s \( e \)$ is the event that the endpoint clusters of $e$ are distinct and each has at least $s$
   vertices. The constant $C$ depends only on $c$ and positive lower bounds for $p$ and $q$.]
] <prop:interpolation>

Recall that for probability laws $P \, R$ on a finite space,

$ D \( P bar.v.double R \) = sum_x P \( x \) log frac(P \( x \), R \( x \)) $

is their relative entropy, with zero summands omitted. We will construct a law $Q_eta$ supported on $H_s \( e \)$
  for a fixed path edge $e$, with relative entropy of order $log \( 1 \/ delta \) + log d$ from $mu$.
  Since any law supported on an event of probability $u$ has relative entropy at least $log \( 1 \/ u \)$,
  this will prove the proposition.

We construct $Q_eta$ by opening contacts along two chains of clusters.
  A reverse procedure that guesses and closes these contacts will account for the possible multiplicity of the
  opening map.

An exact incidence exposure of a cluster records its vertex set and the states of every edge with at least one
  endpoint in that set, including internal edges skipped by a lazy search.
  All edges wholly outside the exposed set retain their product law.
  We will repeatedly use this observation for unions of distinct clusters.

=== 4.1 Contact weights and normalized exposures <contact-weights-and-normalized-exposures>

We first record the normalization that makes the construction possible.
  Suppose a union $O$ of exact clusters has been exposed, a deterministic target set $cal(A)$ is contained in $O$,
  and $w in.not O$. Run the deterministic lazy depth-first search of Lemma 6 from $w$ towards $cal(A)$.
  For every query $f$, let $h$ be the conditional probability of $w arrow.l.r
  cal(A)$ under the #emph[original product law $mu$, conditioned only on this search’s own query prefix].
  Write $h_0 \, h_1$ for the two continuations and $d_f = h_1 - h_0 gt.eq 0$. Thus $h = p h_1 + q h_0$.

A contact is a queried edge from the newly explored cluster into $O$.
  Every contact is closed in the exposed configuration. Give it weight

$ a_f = p d_f \, wide A = sum_(upright("queried contacts ") f) a_f \, wide h_(*) = mu \( w arrow.l.r cal(A) \) . $

The numbers $d_f$ are not recomputed under the law conditioned on $O$. This distinction is essential:
  under that conditioned law a contact is forced closed, and the ordinary conditional probability drops by $h -
  h_0 = p d_f$. Every noncontact query is a fresh Bernoulli bit,
  so its conditional expected change in $h$ is zero. The search fails and its final prefix certifies failure even
  under $mu$, since it has queried all edges leaving the cluster of $w$. Telescoping therefore gives

#[#set math.equation(numbering: n => "(20)")
 $ bb(E)_(upright("ext")) A = h_(*) . $ <eq:contact-normalization>]

Here the expectation samples only the product exterior of the fixed incidence exposure.

Conditional on the fixed incidence exposure and any query prefix,
  the same telescoping gives expected remaining contact weight at most one.
  The potential $h$ still uses only the search’s own prefix.
  Since each contact weight is at most one, expansion of the square yields

#[#set math.equation(numbering: n => "(21)")
 $ bb(E)_(upright("ext")) A^2 lt.eq bb(E)_(upright("ext")) sum_f a_f + 2 bb(E)_(upright("ext")) sum_f a_f lt.eq
   3 . $ <eq:contact-second-moment>]

In the middle expression the second sum bounds each contact weight multiplied by the conditional expected sum of
  subsequent weights. Consequently, when $h_(*) > 0$, the rule

#[#set math.equation(numbering: n => "(22)")
 $ a_f / h_(*) thin mu_(upright("ext")) \( d omega \) quad
   upright("on exterior configurations and a chosen contact ") f $ <eq:marked-contact-law>]

defines a probability measure, with counting measure on the contact coordinate.

After this choice, expose the exact incidence configuration of the new cluster $K = C_w$.
  The chosen contact, its query prefix, and its weight are determined by the old exposure and the incidence states
  of $K$. Thus the factor in (22) imposes no condition on edges wholly outside $O union K$.
  Conditional on the new exposure and chosen contact, those edges still have product law.
  This proves both normalization and preservation of the exterior law at each successive exposure.

=== 4.2 Binary interpolation and its description <binary-interpolation-and-its-description>

Let $J = ceil.l log_2 d ceil.r$. Start with the product law conditioned on the endpoint event in Proposition 8.
  Expose the two endpoint clusters, calling them the left and right bases,
  and assign every vertex in each base its respective side.
  Maintain an interval of the path whose endpoints have opposite sides.
  At a step $i$, take its midpoint $w_i$, using the lower index in a tie, and set

$ cal(A)_i = { x_0 \, x_d \, w_1 \, dots.h \, w_(i - 1) } . $

Every target anchor belongs to a previously exposed cluster.
  If $w_i$ already lies in their union $O$, make no new exposure and give it its cluster’s side; call this a hold.
  Otherwise apply (22) with $w = w_i$ and $cal(A) = cal(A)_i$, expose $K_i = C_(w_i)$,
  and record its chosen contact $f_i$. The cluster containing the head of $f_i$ is its parent,
  and $K_i$ inherits that parent’s side. Leave $f_i$ closed.
  Retain the subinterval joining $w_i$ to the endpoint of opposite side.

The new interval has length at most the ceiling of half the old length, so after $ell lt.eq
  J$ steps its endpoints are adjacent. At each nonhold step,
  one current endpoint is a target anchor at path-index distance strictly less than $d$ from $w_i$. Therefore

#[#set math.equation(numbering: n => "(23)")
 $ h_i := mu \( w_i arrow.l.r cal(A)_i \) gt.eq c . $ <eq:interpolation-root-bound>]

The preceding normalization constructs a joint law of a common final configuration $Omega$ and its chosen
  contacts. Equivalently, one successively multiplies the conditional exterior law by the normalized factors (22);
  each factor is measurable in the new frozen incidence data, so later exterior sampling preserves all earlier factors.

The parent relations form a forest rooted at the two bases.
  Call a nonbase cluster active if it lies on the ancestry path from the owner of one terminal endpoint to its
  base. The active clusters on each side form one chain. Record a descriptor consisting of the number of steps,
  the side and hold bit at each step, and the active indices.
  There are at most $sum_(j = 0)^J 8^j lt.eq 8^(J + 1)$ descriptors.
  Condition on one of maximum probability and denote the resulting joint law by $Q$.
  All midpoints, target sets, nonhold indices $I$, active indices $I_(*)$,
  and the terminal edge are now deterministic. Moreover, the parent of an active index is the preceding active
  index on its side, or its base if there is none. Indeed, the active indices on that side are exactly one
  ancestry chain, ordered by creation time. Thus every active parent has a deterministic anchor.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-5, 0), [#box(width: 1.12cm, height: 0.82cm, inset: 0.1764cm, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[$L$]])])
  content((-2.8, 0), [#box(width: 1.12cm, height: 0.82cm, inset: 0.1764cm, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[$K_1$]])])
  content((-0.6, 0), [#box(width: 1.12cm, height: 0.82cm, inset: 0.1764cm, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[$K_3$]])])
  content((1.9, 0), [#box(width: 1.12cm, height: 0.82cm, inset: 0.1764cm, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[$K_4$]])])
  content((4.1, 0), [#box(width: 1.12cm, height: 0.82cm, inset: 0.1764cm, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[$R$]])])
  content((-2.8, -1.55), [#box(width: 1.12cm, height: 0.82cm, inset: 0.1764cm, stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[$K_2$]])])
  line((-4.44, 0), (-3.36, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  content((-3.9, 0.1058), [$f_1$], anchor: "south", padding: 0.1176cm)
  line((-2.24, 0), (-1.16, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  content((-1.7, 0.1058), [$f_3$], anchor: "south", padding: 0.1176cm)
  line((2.46, 0), (3.54, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  content((3, 0.1058), [$f_4$], anchor: "south", padding: 0.1176cm)
  line((-0.04, 0), (1.34, 0), stroke: (paint: rgb("#8c8c8c"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  content((0.65, 0.1058), [$e$], anchor: "south", padding: 0.1176cm)
  line((-2.8, -0.41), (-2.8, -1.14), stroke: (paint: rgb("#8c8c8c"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  content((-2.659, -0.775), [$f_2$], anchor: "west", padding: 0.1176cm)
  content((-5, -0.5864), [left base], anchor: "north", padding: 0.1176cm)
  content((4.1, -0.5864), [right base], anchor: "north", padding: 0.1176cm)
  content((-2.8, -2.136), [#text(fill: rgb("#595959"))[inactive]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two ancestry chains at the end of interpolation. Here the terminal path edge $e$ joins $K_3$ to $K_4$. Only $f_1 \, f_3 \, f_4$ are opened. Each terminal cluster joins its own large base; the two sides remain distinct. The inactive contact $f_2$ stays closed. Vertices inside each cluster are suppressed. ],
) <fig:interpolation>

Relative to $mu$ on configurations and counting measure on the contacts indexed by $I$, the joint density satisfies

#[#set math.equation(numbering: n => "(24)")
 $ frac(d Q, d \( mu ⊗ upright("count") \)) lt.eq e^L product_(i in I) a_i \, wide a_i = p d_(f_i) \, wide L =
   log \( 1 \/ delta \) + \( J + 1 \) log 8 + J log \( 1 \/ c \) . $ <eq:interpolation-density>]

The three costs are the endpoint conditioning, descriptor conditioning, and the normalizers (23).

=== 4.3 The two chains and their inverse <the-two-chains-and-their-inverse>

Open only the active contacts in $Omega$, and call the resulting configuration $eta$.
  Each terminal endpoint is now joined along its active ancestry chain to a base cluster of size at least $s$.
  The two resulting clusters remain distinct: all original cluster boundaries were closed,
  and the only newly opened edges join clusters within one of the two same-side chains.
  Thus $Q_eta$ is supported on $H_s \( e \)$ for the terminal edge fixed by the descriptor.

We next give a reverse procedure and compute its probability of recovering the chosen contacts.
  This computation will identify the quantities that the remaining entropy estimates must control.

For the fixed schedule, expose all anchor clusters in order on an ordinary product configuration.
  Let $A_i$ be the sum of the contact weights at step $i$, with $A_i = 1$ when $w_i$ is already exposed.
  These quantities depend only on the configuration and schedule, not on earlier contact choices:
  the exposed union is exactly the union of the clusters of the preceding anchors. Write

$ X = sum_(i in I) log^(+) A_i \, wide log^(+) t = log max { 1 \, t } . $

For each active $i$, let $t_i$ be a standalone deterministic transcript that exposes the two exact clusters at
  $w_i$ and its parent anchor, querying all their incidence edges and caching duplicate queries.
  For an ordinary pair transcript $t$, call a contact $f$ admissible if the cluster at $w_i$ avoids $cal(A)_i$ and
  its depth-first search queries $f$ closed into the distinct parent cluster.
  Every pair selected under $Q$ is admissible.

Open just $f$ in an admissible configuration. It becomes the sole open exit from the original cluster of $w_i$,
  and the parent contains a target anchor. Hence $f$ is a queried actual open pivot.
  Let $S_i \( t \, f \)$ be the sum of the weights $q d$ of queried actual open pivots through $f$ in this
  modified search, including $f$ itself. This number is determined by $\( t \, f \)$.
  The prefix through $f$ uses only incidences of the original cluster at $w_i$;
  an earlier queried open edge is an actual pivot exactly when deleting it separates $w_i$ from the tail of $f$
  within that cluster. The exact incidence transcript records all the internal edges needed for this test.

Construct a reference probability $R$ on output configurations and marks as follows.
  First sample $eta$ under $mu$. On a working copy, process the active indices in descending order.
  At index $i$, run the $cal(A)_i$ depth-first search from $w_i$.
  For each queried actual open pivot of weight $b_f = q d_f$, let $S_f$ be the cumulative weight through it,
  and give that pivot guess probability

#[#set math.equation(numbering: n => "(25)")
 $ pi_i \( f \) = frac(b_f, \( 1 + S_f \)^2) . $ <eq:interpolation-inverse-guess>]

The sum of these probabilities is at most $integral_0^oo \( 1 + t \)^(- 2) thin d t = 1$,
  by comparison with the integral on each cumulative-weight interval.
  Assign the remaining probability to a dummy guess. Close the guessed pivot and continue,
  using arbitrary dummy defaults after an invalid history. After all active guesses,
  on the recovered working copy guess each inactive contact independently with probabilities $a_f \/ A_i$,
  again using a dummy default if necessary. The configuration marginal of $R$ is $mu$.

We verify that the true inverse guesses have precisely the weights just defined.
  At active step $i$, all later active contacts have already been closed.
  Every earlier active contact has both endpoints in original clusters created before $K_i$,
  since a contact joins its new cluster to an older parent. Thus none of those earlier contacts touches $K_i$.
  Its only open boundary edge in the current working copy is $f_i$,
  and its parent still contains the deterministic target anchor.
  The search prefix through $f_i$, its original-product conditional differences $d_f$,
  and the criterion for earlier actual pivots are therefore unchanged from the configuration with only $f_i$
  opened. In particular, the guess $f_i$ is available with cumulative weight exactly $S_i$.
  Holds add target anchors but no new cluster or switched edge, so they do not affect this argument.

The active contacts are distinct: different nonhold indices create distinct original clusters,
  and each contact joins its new cluster to an older one. Consequently the map $\( Omega \, \( f_i \) \)
  mapsto \( eta \, \( f_i \) \)$ is injective. Along the true inverse history,
  (24) bounds the ratio of the joint output density to $R$ by

$ e^L product_(i in I_(*)) frac(\( q \/ p \) a_i, q d_(f_i) \/ \( 1 + S_i \)^2) product_(i in I \\ I_(*)) A_i =
  e^L product_(i in I_(*)) \( 1 + S_i \)^2 product_(i in I \\ I_(*)) A_i . $

Here $q \/ p$ is the original-to-opened Bernoulli likelihood ratio for each active contact.
  It cancels because the forward weight is $a_i = p d_(f_i)$ and the inverse guess has numerator $q d_(f_i)$.
  Taking logarithms and discarding the marks by data processing gives

#[#set math.equation(numbering: n => "(26)")
 $ D \( Q_eta bar.v.double mu \) lt.eq L + 2 bb(E)_Q sum_(i in I_(*)) log \( 1 + S_i \) +
   bb(E)_Q X . $ <eq:interpolation-cost-to-bound>]

It remains to bound the two expectations on the right by a constant times $L + J$.
  We do this under the closed-contact law $Q$, before opening any edge.

=== 4.4 Entropy of the sampled configuration <entropy-of-the-sampled-configuration>

We use the same formula for $D \( P bar.v.double R \)$ when $R$ is a nonnegative finite measure rather than a
  probability; in that case it need not be nonnegative. For $P lt.double R$, Jensen’s inequality gives

#[#set math.equation(numbering: n => "(27)")
 $ bb(E)_P g lt.eq D \( P bar.v.double R \) + log sum R e^g . $ <eq:interpolation-entropy-inequality>]

Write $Q_Omega$ for the configuration marginal of $Q$ and put $D_Omega = D \( Q_Omega bar.v.double mu \)$.

By (21),

$ bb(E)_mu \[ max \( 1 \, A_i \)^2 divides upright("previous exact exposures") \] lt.eq 4 . $

Each $A_i$ is known after the next exact exposure. Successive conditional expectation therefore gives $bb(E)_mu
  e^(2 X) lt.eq 4^J$. Summing the density bound (24) over the possible contact choices,
  which only enlarges the sum if the descriptor restrictions are dropped, gives

$ D_Omega lt.eq L + bb(E)_Q X . $

Applying (27) to $2 X$ gives $2 bb(E)_Q X lt.eq D_Omega + J log 4$. Hence

#[#set math.equation(numbering: n => "(28)")
 $ D_Omega lt.eq 2 L + J log 4 \, wide bb(E)_Q X lt.eq L + J log 4 . $ <eq:interpolation-configuration-entropy>]

=== 4.5 Entropy of the inverse guesses <entropy-of-the-inverse-guesses>

We now estimate the sum involving $S_i$. The pair transcripts $t_i$ contain just the cluster data needed to
  determine each marked weight. On the support of $Q$, every cluster occurs in at most two such pairs,
  and an edge is incident to at most two clusters. Each bit is therefore read by at most four pair algorithms.
  Lemma 7 gives

#[#set math.equation(numbering: n => "(29)")
 $ sum_(i in I_(*)) D \( Q_(t_i) bar.v.double mu_(t_i) \) lt.eq C_p D_Omega \, $ <eq:interpolation-pair-entropy>]

with $C_p$ uniform when $p \, q$ are bounded below. The multiplicity condition is needed only on the support of $Q$.

For each active $i$, define a finite measure on marked pair transcripts by

$ nu_i \( t \, f \) = mu_(t_i) \( t \) thin p d_f quad upright("for admissible ") \( t \, f \) \, $

and zero otherwise. This reference measure combines the original pair transcript law with the contact weight used
  in the forward sampling. It need not have mass one. Its usefulness is the following bound,
  which converts the cost of an inverse guess to the pivotal second moment.

The map that opens $f$ and records $f$ is injective on full marked configurations.
  The original-to-modified product probability ratio is $q \/ p$,
  so multiplying the original weight $p d_f$ gives the modified weight $q d_f$.
  In any modified configuration, the admissible inverse marks are a subset of its queried actual open pivots.
  Their cumulative weights are at most the total $W$ from Lemma 6. Therefore

#[#set math.equation(numbering: n => "(30)")
 $ sum_(t \, f) nu_i \( t \, f \) \( 1 + S_i \( t \, f \) \) lt.eq bb(E)_mu \[ W \( 1 + W \) \] lt.eq
   4 . $ <eq:interpolation-contact-measure>]

We next control the entropy of the chosen marks, not just that of their pair transcripts.
  Write $cal(H) \( dot.op divides dot.op \)$ for conditional Shannon entropy.
  Taking logarithms in (24) and averaging yields

#[#set math.equation(numbering: n => "(31)")
 $ D_Omega + sum_(i in I) bb(E)_Q log \( 1 \/ a_i \) - cal(H) \( \( f_i \)_(i in I) divides Omega \) lt.eq
   L . $ <eq:interpolation-joint-contact-cost>]

Since $t_i$ is determined by $Omega$,

$ cal(H) \( \( f_i \)_(i in I) divides Omega \) lt.eq sum_(i in I_(*)) cal(H) \( f_i divides t_i \) +
  sum_(i in I \\ I_(*)) cal(H) \( f_i divides Omega \) . $

For an inactive index, nonnegativity of conditional relative entropy to the probabilities $a_f \/ A_i$ gives

$ bb(E)_Q log \( 1 \/ a_i \) - cal(H) \( f_i divides Omega \) gt.eq - bb(E)_Q log A_i . $

Combining these inequalities with (28) and (29), we obtain

$ sum_(i in I_(*)) D \( Q_(t_i \, f_i) bar.v.double nu_i \) & =
  sum_(i in I_(*)) [D \( Q_(t_i) bar.v.double mu_(t_i) \) + bb(E)_Q log \( 1 \/ a_i \) - cal(H) \( f_i divides t_i \)]\
 & lt.eq C_p D_Omega + L + bb(E)_Q X lt.eq C'_p \( L + J \) . $

All chosen weights are positive, and all spaces are finite, so these expressions are finite on the support of $Q$.
  Apply (27) with $g = log \( 1 + S_i \)$ and use (30). This proves

#[#set math.equation(numbering: n => "(32)")
 $ bb(E)_Q sum_(i in I_(*)) log \( 1 + S_i \) lt.eq C''_p \( L + J \) . $ <eq:interpolation-inverse-cost>]

Substituting (28) and (32) into (26) yields

#[#set math.equation(numbering: n => "(33)")
 $ D \( Q_eta bar.v.double mu \) lt.eq C'''_p \( L + J \) . $ <eq:interpolation-output-entropy>]

We already proved that $Q_eta$ is supported on $H_s \( e \)$.
  If $u = mu \( H_s \( e \) \)$, conditioning $mu$ on this event gives $D \( Q_eta bar.v.double mu \) gt.eq
  log \( 1 \/ u \)$. Together with the definition of $L$, the last display proves Proposition 8.

== 5 Subexponential growth faster than every power <sec:superpolynomial>

The interpolation estimate completes the first subexponential branch.
  We will find two large distinct clusters at distance whose logarithm is negligible compared with the logarithm
  of their sizes. Interpolation then places them across a single edge at a probability incompatible with Proposition 4.

#thm([Theorem 5.1.])[
  #emph[Let $G$ be an infinite connected locally finite quasi-transitive graph with $p_c < 1$. Suppose that
$ log V_(+) \( r \) = o \( r \) \, wide frac(log V_(-) \( r \), log r) arrow.r oo . $

 Then critical Bernoulli bond percolation on $G$ has almost surely no infinite cluster.]
] <thm:superpoly>

#proof[
  Suppose instead that critical percolation has an infinite cluster with positive probability.
    Let $theta > 0$ be the uniform lower bound in (2), and let $D$ be the maximum degree. By (1), $p_c > 0$.
    All constants below may depend on $G$ and $theta$, but will be independent of the scales and of $p
    in \[ p_c \/ 2 \, p_c \)$.
  ===== 5.1 A band of finite cluster sizes. <a-band-of-finite-cluster-sizes.>
  Choose an arbitrarily large integer $L gt.eq 2$. The event ${ \| C_v \| gt.eq
    L }$ is determined by a finite ball: if a cluster has at least $L$ vertices,
    a rooted spanning exploration finds $L$ of them within distance $L - 1$ of $v$.
    Finite-event continuity and the finitely many orbits therefore allow a single $p in \[ p_c \/ 2 \, p_c \)$ for which
  $ F_L \( v \) := bb(P)_p \( \| C_v \| gt.eq L \) gt.eq 3 theta \/ 4 wide upright("for every ") v . $
  All clusters at this $p$ are finite almost surely. We seek a size $s gt.eq
    L$ at which every vertex still has cluster-tail probability at least $theta \/ 2$,
    while some vertex has a cluster in the band $\[ s \, s^2 \)$ with probability at least $\( log s \)^(- 2)$.
    The first condition will force connections between nearby vertices;
    the second will supply a finite cluster small enough to find another large cluster nearby.
  Set $s_j = L^(2^j)$. The bands $\[ s_j \, s_j^2 \)$ are disjoint,
    and the required lower bounds $\( log s_j \)^(- 2)$ have a summable total.
    Let $k gt.eq 1$ be the first index for which $F_(s_k) \( z \) < theta \/ 2$ for some orbit representative $z$.
    Such an index exists because the finite-cluster tails decrease to zero. For this $z$,
  $ sum_(j = 0)^(k - 1) bb(P)_p \( s_j lt.eq \| C_z \| < s_j^2 \) = F_L \( z \) - F_(s_k) \( z \) > theta \/ 4 . $
  On the other hand, $sum_(j gt.eq 0) \( log s_j \)^(- 2) =
    4 \/ \( 3 \( log L \)^2 \) < theta \/ 4$ when $L$ is sufficiently large.
    Hence there are $j < k$ and $s = s_j$ such that
  #[#set math.equation(numbering: n => "(34)")
   $ f := bb(P)_p \( s lt.eq \| C_z \| < s^2 \) gt.eq \( log s \)^(- 2) \, wide F_s \( v \) gt.eq theta \/ 2 quad
     upright("for every ") v . $ <eq:superpoly-band>]
  In particular $s arrow.r oo$ as $L arrow.r oo$.
  ===== 5.2 A nearby pair of large distinct clusters. <a-nearby-pair-of-large-distinct-clusters.>
  Let $r$ be the least integer with $V_(-) \( r \) gt.eq s^4$. Such an integer exists:
    an infinite connected locally finite graph has vertices at every distance from each vertex,
    so $V_(-) \( r \) gt.eq r + 1$. The growth hypothesis implies
  #[#set math.equation(numbering: n => "(35)")
   $ log r = o \( log s \) . $ <eq:superpoly-radius>]
  Indeed, for every fixed $M > 0$, eventually $V_(-) \( t \) gt.eq t^M$.
    If $r - 1$ is beyond this threshold, minimality gives $\( r - 1 \)^M lt.eq V_(-) \( r - 1 \) < s^4$,
    so $r < 1 + s^(4 \/ M)$. The alternative that $r - 1$ remains below the threshold only improves the bound.
    Letting $M$ be arbitrarily large proves (35).
  Condition on an exact incidence exposure of a band cluster $K = C_z$, with $s lt.eq \| K \| < s^2$.
    Its exterior has independent product law. Resample all incidence edges of $K$ independently with parameter
    $p$, leaving the exterior unchanged. For every fixed such exposure,
    the resampled full configuration has law $bb(P)_p$, so the expected number of vertices in $B \( z \, r \)$
    belonging to clusters of size at least $s$ in that configuration is at least $\( theta \/ 2 \) \|
    B \( z \, r \) \|$.
  In the exterior graph $G \\ K$, at most
  $ \| K \| + D \| K \| \( s - 1 \) lt.eq s^2 + D s^3 $
  vertices lie in $K$ or in exterior clusters of size less than $s$ that are adjacent to $K$.
    Every vertex whose resampled cluster has size at least $s$, but whose exterior cluster has size less than $s$,
    lies in this set: otherwise its exterior cluster is unaffected by resampling incidence edges of $K$.
    Consequently, uniformly in the fixed band exposure, the expected number of vertices of $B \( z \, r \)$ in
    exterior clusters of size at least $s$ is at least
  $ \( theta \/ 2 \) \| B \( z \, r \) \| - s^2 - D s^3 gt.eq \( theta \/ 4 \) \| B \( z \, r \) \| $
  for sufficiently large $L$, because $\| B \( z \, r \) \| gt.eq s^4$.
    In the original configuration these exterior clusters are distinct from $C_z = K$.
    Averaging over the band event and then over $B \( z \, r \)$ therefore gives a deterministic $y in
    B \( z \, r \)$ such that
  $ bb(P)_p \( C_y \, C_z upright(" distinct") \, med \| C_y \| \, \| C_z \| gt.eq s \) gt.eq \( theta \/ 4 \) f . $
  Put $c_0 = theta^2 \/ 8$, and choose the smallest distance $d$ of any pair $x \, z'$ satisfying
  #[#set math.equation(numbering: n => "(36)")
   $ bb(P)_p \( C_x \, C_(z') upright(" distinct") \, med \| C_x \| \, \| C_(z') \| gt.eq s \) gt.eq
     c_0 f . $ <eq:superpoly-separated-pair>]
  The preceding pair shows that $d lt.eq r$. Distinct clusters rule out $d = 0$.
    Proposition 4 rules out $d = 1$ for all sufficiently large $L$,
    since its uniform bound $C s^(- 1 \/ 2)$ is smaller than $c_0 \( log s \)^(- 2)$.
    For any pair $u \, v$ at distance less than $d$, Harris’s inequality and (34) give probability at least
    $theta^2 \/ 4$ that both cluster sizes are at least $s$. By the minimality of $d$,
    the probability that they are also distinct is less than $c_0 f lt.eq c_0$. Thus
  #[#set math.equation(numbering: n => "(37)")
   $ bb(P)_p \( u arrow.l.r v \) gt.eq theta^2 \/ 8 wide \( d_G \( u \, v \) < d \) .
     $ <eq:superpoly-short-connections>]
  ===== 5.3 A finite graph to which interpolation applies. <a-finite-graph-to-which-interpolation-applies.>
  Fix a geodesic from $x$ to $z'$ of length $d$. We now choose a finite induced ball $F$ sufficiently large;
    the parameter $p$, size $s$, pair, and path remain fixed during this choice.
    First include the balls of radius $s$ around $x \, z'$. Every configuration in the infinite-graph event (36)
    then has two distinct endpoint clusters of size at least $s$ in $F$ as well:
    the size witnesses lie in those balls, and restriction cannot join distinct clusters.
    Therefore the finite endpoint-event probability $delta_F$ satisfies the exact lower bound
  #[#set math.equation(numbering: n => "(38)")
   $ delta_F gt.eq c_0 f . $ <eq:superpoly-finite-endpoints>]
  No limiting equality or loss in this bound is needed.
  For each proper pair on the geodesic, its path-index separation is less than $d$, so (37) applies.
    Connections in increasing finite induced balls increase to the full event,
    since every witnessing path is finite. There are only finitely many pairs,
    so enlarge $F$ until their finite-graph connection probabilities are all at least $theta^2 \/ 16$.
  Finally, all clusters at this fixed subcritical $p$ are finite almost surely.
    Enlarge $F$ further until, for each edge $e$ of the fixed geodesic,
    the probability that either full endpoint cluster is not contained in $F$ is at most $s^(- 1)$.
    If both clusters are contained, their restrictions equal the original clusters. Hence
  #[#set math.equation(numbering: n => "(39)")
   $ bb(P)_p^F \( H_s \( e \) \) lt.eq bb(P)_p \( H_s \( e \) \) + s^(- 1) lt.eq C s^(- 1 \/ 2) +
     s^(- 1) $ <eq:superpoly-finite-edge-error>]
  for every path edge. Enlarging $F$ preserves the earlier endpoint and connection bounds.
  Apply Proposition 8 in $F$ with $c = theta^2 \/ 16$. Its constants are uniform:
    $p gt.eq p_c \/ 2 > 0$ and $1 - p gt.eq 1 - p_c > 0$. By (34), (35), and (38), some path edge satisfies
  $ - log bb(P)_p^F \( H_s \( e \) \) lt.eq C' #scale(x: 120%, y: 120%)[\(] log \( 1 \/ \( c_0 f \) \) + log r +
    1 #scale(x: 120%, y: 120%)[\)] lt.eq C' #scale(x: 120%, y: 120%)[\(] 2 log log s + log r +
    C'' #scale(x: 120%, y: 120%)[\)] = o \( log s \) . $
  But (39) gives
  $ - log bb(P)_p^F \( H_s \( e \) \) gt.eq 1 / 2 log s - log \( C + 1 \) $
  for $s gt.eq 1$, a contradiction as $L arrow.r oo$. This proves the theorem. ◻
]

== 6 A joint gluing inequality <sec:gluing>

The geometric construction will reach a set of possible relay vertices and then need to continue to a target.
  The vertex reached is selected by the same edge configuration that must supply the continuation,
  so its connection probability cannot simply be treated as an independent factor.
  We prove an inequality that controls this dependence uniformly in the number of relays.

Connections in this section are witnessed by finite open paths, including paths of length zero.
  For an undirected graph $G$ with independent edge states, write $C^G \( x \)$ for the vertex cluster of $x$,
  and put $C^G \( S \) = union.big_(x in S) C^G \( x \)$. Superscripts are omitted when the graph is clear.
  Vertex deletion retains the original probabilities on all remaining edges.
  Parallel edges are allowed; loops can be discarded.

#thm([Theorem 6.1.])[
  (Joint gluing).  #emph[Let $G$ have countably many vertices and edges,
    with independent edge-open probabilities in $\[ 0 \, 1 \]$.
    For a vertex $o$, a nonempty set $A$ of vertices, and any set $T$ of vertices,
#[#set math.equation(numbering: n => "(40)")
 $ bb(P) \( o arrow.l.r A \, med o arrow.l.r T \) gt.eq bb(P) \( o arrow.l.r A \) inf_(a in A)
   bb(P) \( a arrow.l.r T \) . $ <eq:joint-gluing>]

 For finite $A$, the infimum is a minimum.]
] <thm:joint-gluing>

Taking $T = { b }$ and enlarging the event on the left proves the multiplicative gluing inequality of Kozma and
  Nitzan, Conjecture 1 of #cite(label("KozmaNitzan2024")). The finite statement also follows from the
  first-contact comparison (GEN) in #cite(label("Leder2026")) Section 3.4,
  as recorded in #cite(label("ConnectionInequalities2026")). We give a direct proof, then pass to countable graphs.

For the finite proof, with $o in.not A$, we will construct numbers $alpha_a gt.eq 0$, $a in A$,
  whose sum is $bb(P) \( o arrow.l.r A \)$ and for which

$ bb(P) \( o arrow.l.r A \, med o arrow.l.r T \) gt.eq sum_(a in A) alpha_a bb(P) \( a arrow.l.r T \) . $

Bounding the sum by its total mass times the least target probability will prove the theorem.
  The weights come from the inverse of a triangular matrix of conditional cluster probabilities.
  A positivity property of its cluster columns will give both the required signs in the inverse and the displayed
  comparison. Related coefficient questions appear in #cite(label("KozmaNitzan2024")) Section 5.2,
  where the system uses a symmetric matrix of joint connection probabilities instead.

=== 6.1 Conditional cluster columns <conditional-cluster-columns>

Throughout the finite-graph proof assume $p_e < 1$ for every edge; zero probabilities are permitted.
  If $C \( S \) = w$ has positive probability, its occurrence is determined by edges having an endpoint in $w$:
  all vertices of $w$ must connect to $S$ within $w$, and all edges from $w$ to its complement must be closed.
  Thus edges induced outside $w$ retain their independent original laws.
  The same observation applies inside a graph obtained by vertex deletion. For $S = diameter$, its cluster is empty.

Choose distinct distinguished vertices $x_1 \, dots.h \, x_N$.
  They need not exhaust the vertices of $G$; all other vertices and their edges remain in the graph.
  For $1 lt.eq k lt.eq N$, put

$ S_k = { x_1 \, dots.h \, x_(k - 1) } \, wide E_k = { C \( x_k \) ∩ S_k = diameter } \, wide d_k =
  bb(P) \( E_k \) > 0 . $

The positivity follows by closing every edge incident to $x_k$.
  Let $mu_k$ be the law of $C \( x_k \)$ conditional on $E_k$, and set

$ cal(D)_k = { U subset.eq V \( G \) : x_k in U \, med U ∩ S_k = diameter } . $

For $F : cal(D)_k arrow.r \[ 0 \, oo \)$, define vectors in $bb(R)^N$ by

$ v_k^F \( i \) = bb(E)_(mu_k) \[ upright(bold(1))_({ x_i in C \( x_k \) }) F \( C \( x_k \) \) \] \, wide h_k =
  v_k^1 . $

The matrix $H = \( h_1 med dots.h.c med h_N \)$ is unit lower triangular.

The vector $v_k^F - \( bb(E)_(mu_k) F \) h_k$ records the conditional covariances of $F \( C \( x_k \) \)$ with
  the distinguished-vertex indicators. For increasing $F$, we will show that this vector is a nonnegative
  combination of later columns. The following deletion estimate supplies the nonnegative terms in that combination.

=== 6.2 The deletion estimate and column positivity <the-deletion-estimate-and-column-positivity>

#thm([Lemma 6.2.])[
  (Deleted-set residual).  #emph[Fix a finite product graph $G$, a vertex $s$,
    a vertex set $S$ not containing $s$, and an increasing function $F$ on sets that contain $s$ and avoid $S$.
    For $w supset.eq S$ with $s in.not w$, define
$ c \( w \) = bb(E)^(G \\ w) F \( C \( s \) \) . $

 For $U subset.eq V \( G \) \\ \( S union { s } \)$, sample $W_U = C^(G \\ U) \( S \)$ and define
$ R_F \( U \) =
  bb(E)
  [upright(bold(1))_({ s in.not W_U }) #scale(x: 120%, y: 120%)[\(] c \( W_U \) - c \( W_U union U \)
  #scale(x: 120%, y: 120%)[\)]] \, $

 where the integrand is zero when $s in W_U$. Then $R_F$ is nonnegative and increasing under inclusion of $U$.]
] <lem:deleted-residual>

#proof[
  Sample all edges of $G$ once and use their restrictions for every graph below.
    Conditional on an exact value $W_U = w$, the edges induced outside $w$ have product law,
    including those involving the previously deleted vertices $U$. Consequently $R_F \( U \)$ is the expectation of
  $ D_U =
    upright(bold(1))_({ s in.not W_U })
    [F #scale(x: 120%, y: 120%)[\(] C^(G \\ W_U) \( s \) #scale(x: 120%, y: 120%)[\)] - F
    #scale(x: 120%, y: 120%)[\(] C^(G \\ \( W_U union U \)) \( s \) #scale(x: 120%, y: 120%)[\)]] $
  in this common configuration. This quantity is nonnegative.
  If $U subset.eq U'$, then $W_(U') subset.eq W_U$. On ${ s in.not W_U }$,
    the first cluster in $D_U$ grows when $U$ is replaced by $U'$.
    The second cluster is exactly $C^(G \\ U) \( s \)$: in $G \\ U$ the cluster of $s$ is disjoint from the union
    of the $S$-clusters. The corresponding second cluster for $U'$ is $C^(G \\ U') \( s \)$ and can only shrink.
    Increasingness of $F$ therefore gives $D_(U') gt.eq D_U$ on this event.
    On its complement, $D_U = 0$ and $D_(U') gt.eq 0$. Taking expectations proves the claim. ◻
]

#thm([Lemma 6.3.])[
  (Cluster-column positivity).  #emph[For every nonnegative increasing $F$ on $cal(D)_k$,
#[#set math.equation(numbering: n => "(41)")
 $ v_k^F - \( bb(E)_(mu_k) F \) h_k in {sum_(l > k) a_l h_l : a_l gt.eq 0} . $ <eq:cluster-column>]

 In particular $H^(- 1) v_k^F$ has nonnegative coordinates.]
] <lem:cluster-column>

#proof[
  We induct downward in $k$. At a fixed index, exposing the earlier clusters will split $v_k^F$ into an averaged
    version of itself and nonnegative contributions from later columns.
    Repeating the averaging will replace $F$ by its mean and leave exactly the difference in (41).
  For $k = N$, both vectors in the difference have only their $N$th coordinate nonzero,
    so the difference vanishes. Fix $k < N$ and assume the claim for all larger indices.
    Write $s = x_k$, $S = S_k$, $W = C \( S \)$, and $c \( w \) =
    bb(E)^(G \\ w) F \( C \( s \) \)$ for $w supset.eq S$ avoiding $s$.
    The function $c$ is nonincreasing in $w$ by restriction coupling.
  Condition on $W = w$ and $s in.not w$, and use the independent product law outside $w$.
    If $x_i in.not w$, partition its cluster by its earliest distinguished vertex.
    This is $x_k$ exactly when $x_i in C \( s \)$; write $L_(i l)^w$ for the case where it is $x_l$, $l > k$.
    Conditional on the exact cluster $U = C^(G \\ w) \( x_l \)$ in the latter case,
    the expected value of $F \( C \( s \) \)$ is $c \( w union U \)$.
    Partitioning the expectation $c \( w \)$ in this way yields
  #[#set math.equation(numbering: n => "(42)")
   $ bb(E)^(G \\ w) \[ upright(bold(1))_({ x_i in C \( s \) }) F \( C \( s \) \) \] & =
     c \( w \) bb(P)^(G \\ w) \( x_i in C \( s \) \)\
 & quad + sum_(l > k\
x_l in.not w) bb(E)^(G \\ w) \[ upright(bold(1))_(L_(i l)^w) { c \( w \) - c \( w union C \( x_l \) \) } \] .
  $ <eq:cluster-partition>]
  If $x_i in w$, every term is zero instead.
  We first average the leading term in (42). Given $C \( s \) = U$ under $E_k$,
    the earlier-root cluster $W$ has the law of $W_U = C^(G \\ U) \( S \)$,
    by the product law outside the exposed cluster. Define
  $ \( P F \) \( U \) = bb(E) \[ c \( W_U \) \] \, wide U in cal(D)_k . $
  This function is nonnegative and increasing, since $W_U$ shrinks with $U$ and $c$ decreases with its argument.
    Conditioning first on $W$ and then on $C \( s \)$ shows that the averaged leading term is
  $ bb(E) \[ upright(bold(1))_({ x_i in C \( s \) }) c \( W \) divides E_k \] =
    bb(E)_(mu_k) \[ upright(bold(1))_({ x_i in C \( s \) }) \( P F \) \( C \( s \) \) \] = v_k^(P F) \( i \) . $
  The remaining terms give later columns. More precisely, averaging (42) conditional on $E_k$ gives
  #[#set math.equation(numbering: n => "(43)")
   $ v_k^F = v_k^(P F) + sum_(l > k) v_l^(F_l) \, wide F_l \( U \) = d_l / d_k R_F \( U \) \, quad
     U in cal(D)_l . $ <eq:column-decomposition>]
  Here the residual uses the fixed roots $s \, S$ of this induction step.
    To check the normalization, on $E_k$ the event $L_(i l)^W$ is exactly $E_l ∩ { x_i in C \( x_l \) }$.
    Given $C \( x_l \) = U$ under $E_l$, the $S$-cluster is $W_U$ with product law in $G \\ U$,
    and the remaining condition $E_k$ is $s in.not W_U$. Division by $d_k$ and conditioning on $E_l$ give
    precisely the factor $d_l \/ d_k$. Lemma 11 shows that every $F_l$ is nonnegative and increasing.
    The induction hypothesis therefore places every term $v_l^(F_l)$ in the cone generated by $h_j$ with $j > k$.
  Thus one application of $P$ leaves a remainder in the cone of later columns.
    To iterate this decomposition, we identify the limit of $P^j F$.
    The operator $P$ first samples $W$ conditional on $C \( s \)$ and then samples $C \( s \)$ conditional on $W$.
    Both are conditional laws of the joint distribution given $E_k$,
    so $mu_k$ is stationary for this two-step Markov chain. These alternating cluster updates are the method of
    van den Berg, Häggström and Kahn #cite(label("VanDenBergHaggstromKahn2006")) Section 2.1.
    Every transition puts mass at least
  $ a = product_(e in.rev s) \( 1 - p_e \) > 0 $
  on ${ s }$. Subtracting this common mass from two transition averages shows $"osc" \( P g \) lt.eq \( 1 - a \)
    "osc" \( g \)$ for every function on the finite state space.
    Stationarity then implies $P^j F arrow.r bb(E)_(mu_k) F$ uniformly.
  Iterate (43). Each $P^j F$ remains nonnegative and increasing, so $v_k^F -
    v_k^(P^j F)$ belongs to the cone generated by the later columns. This cone is closed:
    on coordinates $k + 1 \, dots.h \, N$ its generators form a unit lower-triangular basis.
    Taking the limit proves (41). Finally $H^(- 1) h_l$ is the $l$th coordinate vector, proving the last assertion. ◻
]

=== 6.3 Nonnegative relay weights <nonnegative-relay-weights>

Apply Lemma 12 to

$ F \( U \) = upright(bold(1))_({ U ∩ { x_(k + 1) \, dots.h \, x_N } eq.not diameter }) . $

Its mean $m_k$ under $mu_k$ is less than one, since $x_k$ can be isolated.
  The centered vector is $\( 1 - m_k \) \( h_k - e_k \)$, where $e_k$ is the $k$th coordinate vector.
  Hence there are numbers $Gamma_(l k) gt.eq 0$, $l > k$, such that

$ h_k = e_k + sum_(l > k) Gamma_(l k) h_l . $

Let $Gamma$ be zero on and above the diagonal. In matrix form, $H = I + H Gamma$, and therefore

#[#set math.equation(numbering: n => "(44)")
 $ H^(- 1) = I - Gamma . $ <eq:cluster-inverse>]

Moreover, partitioning the cluster of $x_i$ by its first distinguished vertex gives

#[#set math.equation(numbering: n => "(45)")
 $ H d = upright(bold(1)) \, wide \( I - Gamma \) upright(bold(1)) = d \, wide
   d = \( d_1 \, dots.h \, d_N \)^(sans(T)) . $ <eq:cluster-row-mass>]

#proof[
  First suppose the graph is finite and all $p_e < 1$. If $o in A$,
    the left side of (40) equals $bb(P) \( o arrow.l.r T \)$ and the inequality is immediate.
    Otherwise take the distinguished list to consist of the vertices of $A$ followed by $x_N = o$, and set
  $ F \( U \) = upright(bold(1))_({ U ∩ A eq.not diameter \, med U ∩ T eq.not diameter }) \, wide y_i =
    bb(E) F \( C \( x_i \) \) . $
  This is one nonnegative increasing function, restricted to each $cal(D)_k$ as needed.
    Partitioning by the first distinguished vertex gives $y = sum_k d_k v_k^F$,
    so Lemma 12 implies $H^(- 1) y gt.eq 0$ coordinatewise. The last row of (44) yields
  $ y_N gt.eq sum_(i < N) Gamma_(N i) y_i . $
  For $i < N$, length-zero paths give $y_i = bb(P) \( x_i arrow.l.r T \)$,
    whereas $y_N$ is the joint probability in the theorem. By (45),
  $ sum_(i < N) Gamma_(N i) = 1 - d_N = bb(P) \( o arrow.l.r A \) . $
  Thus the promised relay weights are $alpha_(x_i) = Gamma_(N i)$ for $i < N$.
    They are nonnegative, proving the finite-graph inequality. This argument also covers $T = diameter$, when $F = 0$.
  All event probabilities on a finite graph are polynomials in the edge probabilities.
    Approximating each probability equal to one from below therefore includes deterministic open edges as well as
    closed ones.
  For a countable graph and finite $A$, exhaust the graph by finite subgraphs containing $o$ and $A$,
    and intersect $T$ with their vertex sets. Every connection has a finite witness,
    so the individual and joint connection events increase to the corresponding events in $G$.
    The minimum over the finite set $A$ also converges. This proves (40) for finite $A$.
    Finally exhaust a countable nonempty $A$ by finite nonempty sets $A_j$.
    The two events involving $A_j$ increase to those involving $A$,
    while $min_(a in A_j) bb(P) \( a arrow.l.r T \)$ decreases to the infimum over $A$.
    Taking limits proves the result. ◻
]

#thm([Corollary 6.4.])[
  (Failure after reaching a relay).  #emph[In the setting of Theorem 10, let $0 lt.eq lambda lt.eq 1$.
    If $bb(P) \( a arrow.l.r T \) gt.eq 1 - lambda$ for every $a in A$, then
$ bb(P) \( o arrow.l.r A \, med o ↮ T \) lt.eq lambda thin bb(P) \( o arrow.l.r A \) lt.eq lambda . $

 The same conclusion holds for $A = diameter$.]
] <cor:gluing-failure>

#proof[
  Subtract (40) from $bb(P) \( o arrow.l.r A \)$. For an empty relay set the event on the left is empty. ◻
]

The theorem and corollary may be applied after fixing any collection of edge states,
  provided the remaining edges still have product law. Relay and target sets must then be fixed under that
  conditioning. In particular, a later adaptive choice of contacts is not an additional conditioning to be
  inserted into their connection probabilities.

We apply this inequality in the corridor construction of Section 9.
  The remaining sections develop the geometric argument for graphs satisfying the polynomial bound along an
  unbounded sequence of radii, beginning with the quotient action that will supply the corridor coordinates.

== 7 Nilpotent quotients and bounded projections <sec:structure>

The remaining growth case has a polynomial bound along a sequence of scales.
  Its useful consequence is an action on the original graph with a nilpotent quotient.
  The quotient will supply coordinates; all percolation paths and edge exposures will remain in the original
  graph. We prove the following action theorem and then apply it to the action constructed from the polynomial scales.

#thm([Theorem 7.1.])[
  (Criticality with a nilpotent quotient action).  #emph[Let $G$ be an infinite connected locally finite graph of
    subexponential growth. Suppose a group $Lambda$ acts by automorphisms on $G$ with finitely many vertex orbits
    and admits an epimorphism $𝜚 : Lambda arrow.r N$ onto a finitely generated nilpotent group,
    such that $ker 𝜚$ has finite vertex orbits and $𝜚 \( Lambda_v \)$ is finite for every vertex $v$.
    Here $Lambda_v = { g in Lambda : g v = v }$ is the vertex stabilizer. If $p_c \( G \) < 1$, then
$ bb(P)_(p_c \( G \)) \( \| C_v \| = oo \) = 0 wide \( v in G \) . $

 Consequently, critical percolation has almost surely no infinite cluster.]
] <thm:structured>

The action need not be faithful, and $Lambda$ need not itself be nilpotent.
  We first show that a polynomial bound along an unbounded sequence supplies exactly these action data.
  We then prove the theorem by induction on a cyclic series of $N$.
  In the induction step, a component over a bounded coordinate box has a quotient with fewer infinite cyclic
  factors. This excludes rays with bounded projection; Sections 8 and 9 use the remaining rays to construct
  percolation below $p_c$.

=== 7.1 From polynomial scales to the quotient action <from-polynomial-scales-to-the-quotient-action>

The structural ancestry is Gromov’s group theorem #cite(label("Gromov1981")),
  Trofimov’s graph and near-polynomial growth theorems #cite(label("Trofimov1985")) #cite(label("Trofimov2003")),
  and Tessera and Tointon’s one-scale form #cite(label("TesseraTointon2021")).
  The proof below uses the latter with its action and stabilizer conclusions.

#thm([Proposition 7.2.])[
  (The action supplied by a polynomial scale).  #emph[Let $G$ be an infinite connected locally finite
    quasi-transitive graph. Suppose that for some $d < oo$ there are radii $R_j arrow.r
    oo$ such that $V_(-) \( R_j \) lt.eq R_j^d$. Then there are a finite-index subgroup $Lambda lt.eq
    "Aut" \( G \)$, a finitely generated nilpotent group $N$, and an epimorphism
$ 𝜚 : Lambda arrow.r N $

 with the following properties:]
  + #emph[$Lambda$ has finitely many vertex orbits;]
  + #emph[$ker 𝜚$ has finite vertex orbits;]
  + #emph[$𝜚 \( Lambda_v \)$ is finite for every vertex $v$, where $Lambda_v = { g in Lambda : g v = v }$.]
] <prop:nilpotent-model>

#proof[
  Increase $d$ if necessary so that $d gt.eq 1$. Let $C$ be a common density radius for the finitely many vertex
    orbits of $"Aut" \( G \)$. Fix one orbit $O$, set $L = 2 C + 1$,
    and form a graph $Gamma$ on $O$ by joining distinct vertices whose distance in $G$ is at most $L$.
    To connect two points of $O$, take a path between them in $G$ and replace its intermediate vertices by points
    of $O$ within distance $C$. Consecutive replacements are equal or adjacent in $Gamma$.
    Thus $Gamma$ is connected. It is locally finite, and the image $A$ of $"Aut" \( G \)$ on $O$ is a transitive
    subgroup of $"Aut" \( Gamma \)$.
  At a radius $R = R_j$, choose $x$ with $\| B \( x \, R \) \| =
    V_(-) \( R \)$ and $u in O$ with $d \( x \, u \) lt.eq C$. For $n = floor.l \( R - C \) \/ L floor.r$,
  $ B_Gamma \( u \, n \) subset.eq B_G \( u \, L n \) subset.eq B_G \( x \, R \) . $
  Writing $beta_Gamma \( n \)$ for the cardinality of a radius-$n$ ball in this transitive graph,
    we obtain $beta_Gamma \( n \) lt.eq R^d$. For all sufficiently large such scales, $R lt.eq
    c n$ with a fixed constant $c$. Absorbing $c^d$ into an extra power of $n$ gives
  $ beta_Gamma \( n \) lt.eq n^(d + 1) beta_Gamma \( 1 \) $
  for arbitrarily large integers $n$.
  Apply Tessera–Tointon’s Corollary 2.4 with growth exponent $d + 1$, $lambda = 1 \/ 2$,
    and the transitive group $A$ #cite(label("TesseraTointon2021")) Corollary 2.4.
    Its hypotheses require only one sufficiently large scale and do not require $A$ to be closed in
    $"Aut" \( Gamma \)$. The conclusion supplies a normal subgroup $H lt.closed
    A$ whose orbits have finite diameter, such that $Q = A \/ H$ acts faithfully on $Gamma \/ H$,
    is finitely generated and virtually nilpotent, and has finite vertex stabilizers.
    The $H$-orbits are finite because $Gamma$ is locally finite.
  Let $theta.alt : "Aut" \( G \) arrow.r Q$ be the composite epimorphism, and put $K = ker theta.alt$.
    Its orbits on $O$ are the $H$-orbits. For an arbitrary $v in G$, choose $u in O$ with $d \( u \, v \) lt.eq C$. Then
  $ K v subset.eq union.big_(w in K u) B_G \( w \, C \) \, $
  so $K v$ is finite. Also, $"Aut" \( G \)_v$ moves $u$ within the finite ball $B_G \( v \, C \)$.
    Hence its image under $theta.alt$ has a finite orbit on the block $H \( u \) in Gamma \/ H$.
    Its stabilizer at that block is a subgroup of the finite $Q$-stabilizer.
    The orbit–stabilizer formula therefore makes $theta.alt \( "Aut" \( G \)_v \)$ finite.
  Choose a finite-index nilpotent subgroup $N lt.eq Q$ and let $Lambda = theta.alt^(- 1) \( N \)$.
    A finite-index subgroup of a finitely generated group is finitely generated:
    rewriting a word through a finite set of coset representatives gives a finite generating set.
    Thus $N$ is finitely generated. Each $"Aut" \( G \)$-orbit splits into at most $\[ "Aut" \( G \) : Lambda \]$
    many $Lambda$-orbits. Restricting $theta.alt$ to $Lambda$ gives $𝜚$, with the other two properties already proved. ◻
]

=== 7.2 Cyclic series and the decreasing parameter <cyclic-series-and-the-decreasing-parameter>

A #emph[cyclic series] is a finite subnormal series

$ N = N_0 gt.closed N_1 gt.closed dots.h.c gt.closed N_k = { 1 } $

whose factors $N_i \/ N_(i + 1)$ are cyclic, possibly finite or trivial.
  We use the number of its infinite factors. The induction applies to all data equipped with a chosen series of at
  most a given count; independence of that count from the choice of series is not needed.

The group facts below are classical; see #cite(label("Robinson1996")) Theorems 5.2.5 and 5.2.18.
  We give the arguments to make the decrease of the induction parameter explicit.

#thm([Lemma 7.3.])[
  (Cyclic series and their subgroups).  #emph[Every finitely generated nilpotent group $N$ has a cyclic series.
    If such a series has $h$ infinite factors, then every subgroup $J lt.eq
    N$ is finitely generated and inherits a cyclic series with at most $h$ infinite factors.
    If $\[ N : J \] = oo$, the inherited count is strictly less than $h$.
    Moreover, if the finitely generated abelianization $N \/ \[ N \, N \]$ has rank at most one,
    then $\[ N \, N \]$ is finite. In this case $N$ is either finite or admits an epimorphism onto $bb(Z)$ with
    finite kernel.]
] <lem:rank>

#proof[
  Write $gamma_1 = N$ and $gamma_(i + 1) = \[ N \, gamma_i \]$ for the lower central series.
    The first factor $N \/ gamma_2$ is finitely generated abelian.
    Modulo $gamma_(i + 2)$, the commutator product identities give a bilinear map
  $ \( N \/ gamma_2 \) times \( gamma_i \/ gamma_(i + 1) \) arrow.r gamma_(i + 1) \/ gamma_(i + 2) \,
    wide \( x gamma_2 \, y gamma_(i + 1) \) mapsto \[ x \, y \] gamma_(i + 2) \, $
  whose values generate the target. Here bilinearity follows because commutators of one higher weight vanish in
    the target quotient. Inductively, images of pairs of finite generating sets generate each successive factor.
    These factors are abelian, and nilpotence makes only finitely many of them nontrivial.
    Refining each finitely generated abelian factor by adjoining its generators one at a time gives a cyclic series.
  For a subgroup $J$, intersect this series with $J$. The natural map
  $ \( J ∩ N_i \) \/ \( J ∩ N_(i + 1) \) arrow.r N_i \/ N_(i + 1) $
  is injective, so each inherited factor is cyclic. Lifting generators successively up this finite series shows
    that $J$ is finitely generated. Suppose its count of infinite factors is still $h$.
    Then its image in every infinite cyclic ambient factor is infinite, hence has finite index;
    its image in a finite factor also has finite index. Induction up the series gives $\[ N : J \] < oo$.
    Explicitly, if $J_i = J ∩ N_i$, then
  $ \[ J_i N_(i + 1) : J_i \] = \[ N_(i + 1) : J ∩ N_(i + 1) \] \, $
  and $\[ N_i : J_i N_(i + 1) \]$ is the index of the image in the cyclic factor.
    Both indices are finite at each step, starting from the trivial last group.
    This proves the strict decrease for infinite-index subgroups.
  For the last assertion, the first commutator pairing is alternating on $N \/ gamma_2$.
    If that abelian group has rank at most one, the pairing has only torsion values:
    its exterior square is a finitely generated torsion group.
    Its finitely many generating values make $gamma_2 \/ gamma_3$ finite.
    The displayed bilinear pairing then makes every later factor finite as well.
    Thus $\[ N \, N \] = gamma_2$ is finite. Rank zero of the abelianization makes $N$ finite.
    In rank one, projection of the abelianization onto its infinite cyclic factor gives an epimorphism $N arrow.r
    bb(Z)$ with finite kernel. ◻
]

=== 7.3 The induction and equivariant coordinates <the-induction-and-equivariant-coordinates>

Fix action data $\( G \, Lambda \, 𝜚 \, N \)$ as in Theorem 14,
  together with a cyclic series having $h$ infinite factors.
  We prove the theorem simultaneously for all such data by induction on $h$.
  A series with no infinite factor makes $N$ finite. Each $Lambda$-orbit is a finite union of $ker
  𝜚$-orbits and is therefore finite. There are finitely many $Lambda$-orbits, contrary to infinitude of $G$.
  This is the base case. For the induction step, assume the theorem for every such action whose quotient has a
  cyclic series with fewer than $h$ infinite factors. Suppose, towards a contradiction,
  that $p_c \( G \) < 1$ and critical percolation has an infinite cluster with positive probability.

We first construct the coordinates and dispose of the one-dimensional case.
  Suppose $phi.alt : N arrow.r bb(Z)^j$ is an epimorphism, where $j = 1$ or $2$.
  Choose representatives $v_1 \, dots.h \, v_k$ for the $Lambda$-orbits and put

#[#set math.equation(numbering: n => "(46)")
 $ pi \( g v_i \) = phi.alt 𝜚 \( g \) \, wide g in Lambda . $ <eq:equivariant-projection>]

This is well defined: if $g v_i = g' v_i$, then $\( g' \)^(- 1) g$ stabilizes $v_i$,
  its $𝜚$-image belongs to a finite group, and $phi.alt$ annihilates that image because $bb(Z)^j$ is torsion free.
  Moreover,

#[#set math.equation(numbering: n => "(47)")
 $ pi \( g x \) = phi.alt 𝜚 \( g \) + pi \( x \) . $ <eq:projection-equivariance>]

The map is onto, even on each vertex orbit. There are finitely many oriented edge orbits,
  so equivariance gives a finite bound

#[#set math.equation(numbering: n => "(48)")
 $ D_pi := sup_(x tilde.op y) \| pi \( x \) - pi \( y \) \| < oo . $ <eq:projection-edge-bound>]

The norm is Euclidean when $j = 2$.

Suppose that $phi.alt : N arrow.r bb(Z)$ has finite kernel. Then $L_0 = ker \( phi.alt 𝜚 \)$ has finite orbits:
  its image under $𝜚$ is finite, and its kernel has finite orbits. Thus

$ pi^(- 1) \( 0 \) = union.big_(i = 1)^k L_0 v_i $

is finite. An element with $phi.alt 𝜚$-value $t$ bijects this level onto $pi^(- 1) \( t \)$,
  so all integer levels have the same finite size.

Choose an integer $J gt.eq max \( 1 \, D_pi \)$. Edges crossing the cut from ${ pi lt.eq
  t }$ to ${ pi > t }$ have endpoints in a fixed number of levels around $t$.
  Their number is uniformly bounded, since degree and level sizes are bounded.
  The crossing-edge sets for levels $t in \( J + 1 \) bb(Z)$ are disjoint.
  For every $p < 1$, their all-closed events are independent with probabilities bounded below by a positive
  constant. Almost surely infinitely many such cuts are closed in both directions.
  Every open cluster is then confined between two closed cuts and lies in finitely many finite levels. This proves

#[#set math.equation(numbering: n => "(49)")
 $ p_c \( G \) = 1 quad upright("whenever ") N upright(" has an epimorphism to ") bb(Z) upright("
 with finite kernel.") $ <eq:cyclic-critical-one>]

Consequently, the hypotheses of Theorem 14 with $p_c \( G \) <
  1$ force the abelianization of $N$ to have rank at least two. It therefore admits an epimorphism onto $bb(Z)^2$.

=== 7.4 Excluding rays with bounded projection <excluding-rays-with-bounded-projection>

We now choose an epimorphism $phi.alt : N arrow.r bb(Z)^2$, as justified above,
  and let $pi$ be the associated coordinate map. The smaller-count induction applies to a component over a bounded
  box because its preserving subgroup maps into $ker phi.alt$, an infinite-index subgroup of $N$.
  The next lemma checks all the required action properties.

#thm([Lemma 7.4.])[
  (Exclusion of bounded projections).  #emph[ Let $\( G \, Lambda \, 𝜚 \, N \)$ satisfy the hypotheses of
    Theorem 14, with $p_c \( G \) < 1$. Fix a cyclic series for $N$ with $h$ infinite factors and an epimorphism
    $phi.alt : N arrow.r bb(Z)^2$. Let $pi$ be given by (46).
    Assume Theorem 14 for every such action whose nilpotent quotient has a cyclic series with fewer than $h$
    infinite factors. Then critical percolation on $G$ almost surely has no infinite open ray whose
    $pi$-projection is bounded.]
] <lem:bounded-projection>

#proof[
  Suppose otherwise. There are countably many finite boxes in $bb(Z)^2$ and countably many connected components of
    their inverse images. Hence some fixed finite box $Q$ and a fixed infinite connected component $G'$ of the
    induced graph $G \[ pi^(- 1) \( Q \) \]$ have an infinite open cluster at $p =
    p_c \( G \)$ with positive probability. Subgraph monotonicity gives $p_c \( G' \) gt.eq p_c \( G \)$;
    this positive probability gives the reverse inequality. Thus
  $ p_c \( G' \) = p_c \( G \) < 1 \, $
  and $G'$ percolates at its own critical value.
  Let $Lambda'$ consist of the elements of $ker \( phi.alt 𝜚 \)$ that preserve $G'$.
    It has finitely many vertex orbits on $G'$. Indeed, if $x \,
    y in G'$ lie in the same $Lambda$-orbit and satisfy $pi \( x \) = pi \( y \)$,
    choose $g in Lambda$ with $g x = y$. Equation (47) gives $phi.alt 𝜚 \( g \) = 0$.
    This element preserves the induced graph $G \[ pi^(- 1) \( Q \) \]$ and maps the component of $x$ to that of
    $y$; these are the same component. Thus $g in Lambda'$. There are only finitely many pairs of an original
    $Lambda$-orbit and a level in $Q$, which proves the claim.
  Set $N' = 𝜚 \( Lambda' \)$. Restriction gives an epimorphism $Lambda' arrow.r
    N'$ whose kernel has finite orbits and whose vertex stabilizers have finite images.
    The group $N'$ is nilpotent and is finitely generated by Lemma 16.
    It lies in $ker phi.alt$, which has infinite index in $N$,
    so its inherited cyclic series has strictly fewer than $h$ infinite factors.
    The graph $G'$ is connected, locally finite and infinite.
    Its intrinsic balls are contained in ambient balls of the same radius, so it has subexponential growth.
    It therefore satisfies every hypothesis of the smaller-count induction.
    Theorem 14 at that count forbids the critical infinite cluster just found, a contradiction. ◻
]

Thus the induction step has onto equivariant coordinates in $bb(Z)^2$, bounded coordinate jumps,
  and no infinite open ray trapped over a bounded set. The following two sections construct an infinite cluster at
  a parameter below $p_c \( G \)$ from the assumed critical jump.
  That contradiction completes the induction and proves Theorem 14.
  Proposition 15 then applies it to the remaining growth case.

== 8 Two approximate coordinate moves <sec:moves>

The quotient coordinates have bounded edge increments, but no symmetry need interchange their directions.
  We obtain two directions from connection probabilities, then normalize them by a linear map.
  The interface needed for the corridors is that the seed radius is fixed before the coordinate increments are
  made small.

#thm([Proposition 8.1.])[
  (Approximate moves).  #emph[Let $G$ be an infinite connected locally finite graph and let a group $Lambda$ act
    on it by automorphisms with finitely many vertex orbits. Let $pi : V \( G \) arrow.r bb(Z)^2$ be onto,
    with edge increments bounded in Euclidean norm by $D_pi$ and with $pi \( g x \) = pi \( x \) + a_g$,
    where $g mapsto a_g$ is an epimorphism from $Lambda$ to $bb(Z)^2$.
    Suppose $0 < p_c < 1$ and, at $p_c$, there is almost surely a unique infinite cluster and no infinite open ray
    with bounded $pi$-projection. For every $0 < e \, eta < 1 \/ 10$,
    there is an integer $m$ such that for every requested $rho_0 >
    0$ one can choose an invertible linear map $Phi : bb(R)^2 arrow.r
    bb(R)^2$ and a parameter $p' in \[ p_c \/ 2 \, p_c \)$ with the following properties.
    The coordinates $\( t \, z \) = Phi pi$ have edge increments at most $rho_0$ in supremum norm.
    For $y in V \( G \)$ and $s in { - 1 \, 1 }$, let $E_s \( y \)$ be the event that an open path starts in
    $B \( y \, m \)$, stays within supremum coordinate distance $100$ of $y$,
    and ends within supremum distance $e \/ 4$ of $\( t \( y \) + 1 \, z \( y \) + s \)$. Then
$ bb(P)_(p') \( E_s \( y \) \) gt.eq 1 - eta wide \( y in V \( G \) \, med s in { - 1 \, 1 } \) . $

 The radius $m$ is chosen before $rho_0$.]
] <prop:moves>

We verify the uniqueness hypothesis for the subexponential graph in our induction before proving the proposition.
  The adjacent-cluster bound supplies this fact without any coordinate assumptions.

#thm([Lemma 8.2.])[
  (Uniqueness under subexponential growth).  #emph[Let $G$ be infinite, connected,
    locally finite and quasi-transitive, with $log V_(+) \( r \) = o \( r \)$.
    If $p in \( 0 \, 1 \)$ and Bernoulli bond percolation at $p$ has an infinite cluster with positive
    probability, then it has exactly one infinite cluster almost surely.]
] <lem:uniqueness>

#proof[
  Letting $s arrow.r oo$ in Proposition 4 shows that, for every edge,
    the probability that its endpoints lie in distinct infinite clusters is zero.
    We show that this excludes any two infinite clusters, even if no edge initially joins them.
  Otherwise countability gives fixed vertices $x \, y$ that belong to distinct infinite clusters with positive
    probability. Choose a fixed simple path $x = x_0 \, x_1 \, dots.h \, x_d = y$.
    On that event let $j$ be the first index with $x_j in C_y$; some fixed $j gt.eq
    1$ occurs on a positive-probability subevent. Force the finitely many prefix edges $x_i x_(i + 1)$ for $0
    lt.eq i < j - 1$ open (none if $j = 1$). Every endpoint of these edges was outside $C_y$,
    so this modification leaves $C_y$ unchanged. It makes $C_(x_(j - 1))$ infinite through $x$,
    while that cluster remains distinct from $C_(x_j) = C_y$. The modified event still has positive probability:
    condition on all unmodified bits and use that the all-open state of the finite prefix has positive conditional
    probability. This contradicts the preceding conclusion for the fixed edge $x_(j - 1) x_j$.
    Thus there is at most one infinite cluster almost surely.
    Existence is a tail event, so its assumed positive probability is one. ◻
]

Under the contradiction hypothesis used to prove Theorem 14,
  this lemma and Lemma 17 verify the two percolation hypotheses of Proposition 18.
  The equivariant onto coordinates and their bounded increments were established in Section 7.
  The proposition’s proof uses only its stated hypotheses; in particular,
  absence of bounded-projection rays is an input supplied by the induction, not by the coordinate map alone.

Choosing geometry by exit probabilities also appears in Martineau and Tassion’s parallelogram construction
  #cite(label("MartineauTassion2017")) Section 3.2. The proof here obtains the two directions either from a disk
  of ellipses or from a projected strip.

#proof[
  Choose $o$ with $pi \( o \) = 0$ and put $zeta = e \/ 1000$.
    Countability gives a vertex with positive infinite-cluster probability.
    Harris’s inequality transfers this positivity along fixed paths to each of the finitely many orbit
    representatives. Hence
  $ theta := min_x bb(P)_(p_c) \( \| C_x \| = oo \) > 0 . $
  For each fixed nonzero linear functional $ell$ on $bb(R)^2$,
    the unique infinite cluster is unbounded above in $ell compose pi$, almost surely.
    Indeed, the union of all infinite clusters meets ${ ell compose pi > r }$ with probability at least $theta$,
    by choosing one vertex there. Its unboundedness above is a tail event:
    changing finitely many edges changes that union by at most finitely many vertices.
    Continuity from above and the zero-one law give probability one, and uniqueness gives the stated conclusion.
  We first construct the two events at $o$ and at $p_c$, with error smaller than $e \/
    8$ and failure probability smaller than $eta \/ 10$. In each of the two cases below the seed is chosen before
    the scales that make the coordinate map small. Only after fixing the map will we lower the percolation parameter.
  #emph[Case 1: no fixed direction supports a strip ray with positive probability.] For a unit vector $d$,
    a centered strip means ${ x : \| d^perp dot.op pi \( x \) \| lt.eq w }$ for some finite $w$.
    Translated strips are contained in wider centered strips.
    In this case the probability of a ray in such a strip is zero for each fixed $d$.
    We do not need a statement about the union over all directions.
  Cover the unit circle by $M$ arcs of angular radius at most $zeta$, with signed unit centers.
    Choose $m_0$ so that $B \( o \, m_0 \)$ hits the infinite cluster with probability greater than
    $1 - \( eta \/ 20 \)^M$. This choice does not involve any later scale.
    Fix an arbitrarily large $W$ containing the seed projections well inside the Euclidean ball of radius $W$.
    For $U gt.eq W$, consider the positive matrices
  $ A \( s \, phi \) = R_phi mat(delim: "(", W + \( U - W \) s, 0; 0, W) R_phi^(- 1) \, wide 0 lt.eq s lt.eq 1 \,
    quad phi in bb(R) \/ pi bb(Z) . $
  The parameter space is a disk: all angles at $s = 0$ give $W I$.
    Consider open paths from the seed whose last vertex is their first exit from ${ \| A^(- 1) pi \|_2 < 1 }$.
    Their final normalized radius is between $1$ and $1 + D_pi \/ W$.
    Seed contact with the infinite cluster guarantees such a path,
    since an infinite ray cannot have bounded projection. Split the exit event according to the $M$ endpoint arcs.
    Their misses are decreasing events. Harris’s inequality implies that at least one arc is hit with probability
    greater than $1 - eta \/ 20$. Call its center a favored center.
  For sufficiently large $U$, every favored center at a boundary parameter $s =
    1$ has its unoriented line within angle $pi \/ 16$ of the minor axis, uniformly in $phi$.
    Otherwise take $U_j arrow.r oo$ and boundary parameters violating this assertion.
    A subsequence of their major axes converges to a fixed direction $d$.
    Since the arc radii are small, favored exits have major-axis displacement bounded below by a positive constant
    times $U_j$, while the whole exit path has transverse displacement at most $W + D_pi$.
    Loop erasure gives arbitrarily long simple open paths from the finite seed.
    For each fixed length $l$, all such initial segments lie in the finite union of radius-$l$ balls about the
    seed. Convergence of the axes is uniform on the projections of this finite set.
    Since $D_pi < W$, it puts these segments in the centered strip about $d$ of width $2 W$,
    for all sufficiently large $j$. Such length-$l$ paths thus have probability at least $1 -
    eta \/ 20$ for every $l$. These events decrease with $l$,
    and finite branching supplies an infinite ray in the strip, a contradiction.
  Triangulate the parameter disk so finely that adjacent matrices satisfy $parallel A_i^(- 1) A_j -
    I parallel_2 lt.eq zeta$ and boundary angle increments are less than $pi \/ 32$.
    Choose one favored center at each vertex. Some adjacent center lines have projective separation at least
    $pi \/ 8$. Indeed, otherwise the principal increments of their doubled line angles have absolute value less
    than $pi \/ 4$. Their sum around each triangle is a multiple of $2 pi$ of absolute value less than $2 pi$,
    hence zero; summing triangles gives zero around the boundary.
    On the boundary, however, the doubled angles have lifts $2 phi +
    pi$ with errors of absolute value less than $pi \/ 8$. The mesh condition makes successive lift differences
    principal increments, whose total is $2 pi$. This is a contradiction.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((-3.1, 0), radius: 1.65, fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  line((-3.1, 0), (-1.45, 0), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.45, 0), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-1.45, -0.19), (-1.45, 0.19), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-1.933, 1.167), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.933, 1.167), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-1.861, 0.9912), (-2.006, 1.342), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-3.1, 1.65), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.1, 1.65), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-2.966, 1.516), (-3.234, 1.784), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-4.267, 1.167), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.267, 1.167), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-4.091, 1.094), (-4.442, 1.239), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-4.75, 2.021e-16), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.75, 2.021e-16), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-4.56, 1.788e-16), (-4.94, 2.253e-16), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-4.267, -1.167), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.267, -1.167), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-4.091, -1.094), (-4.442, -1.239), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-3.1, -1.65), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.1, -1.65), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-2.966, -1.516), (-3.234, -1.784), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  line((-3.1, 0), (-1.933, -1.167), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.933, -1.167), radius: 0.035, fill: rgb("#0000a6"), stroke: none)
  line((-1.861, -0.9912), (-2.006, -1.342), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10))
  content((-3.1, 0), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$s=0$#linebreak()$A="WI"$]])])
  arc((-1.168, 0.5176), start: 15deg, stop: 65deg, radius: 2, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#666666"))))
  content((-3.1, 2.08), [$s=1$], anchor: "south", padding: 0.1176cm)
  content((-3.1, -2.012), [#box(width: 5.135cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[Boundary center lines follow the minor axes.]])], anchor: "north")
  line((2.4, -0.05), (5, -0.05), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#8c8c8c"))))
  content((5, -0.05), [$t$], anchor: "west", padding: 0.1176cm)
  line((2.65, -1.7), (2.65, 1.65), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#8c8c8c"))))
  content((2.65, 1.65), [$z$], anchor: "south", padding: 0.1176cm)
  line((2.65, -0.05), (4.3, 1.25), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((2.65, -0.05), (4.3, -1.35), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  rect((4.15, 1.1), (4.45, 1.4), fill: rgb("#ebebff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  rect((4.15, -1.5), (4.45, -1.2), fill: rgb("#ebebff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  circle((2.65, -0.05), radius: 0.035, fill: black, stroke: none)
  content((4.626, 1.25), [$(1,1)$], anchor: "west", padding: 0.1176cm)
  content((4.626, -1.35), [$(1,-1)$], anchor: "west", padding: 0.1176cm)
  content((3.65, -2.012), [#box(width: 4.835cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[A linear map normalizes two separated directions.]])], anchor: "north")
})],
    caption: [Figure 2: The direction argument in Proposition 18. Left: the ellipse parameters form a disk; on its boundary, favored unoriented lines have doubled angles with winding number one. They therefore cannot vary by a small angle across every edge of a triangulation. Right: two separated favored directions yield the required moves. The endpoint error boxes are enlarged for clarity. ],
  ) <fig:moves>
  Take such an adjacent pair with matrices $A_i \, A_j$. Let $d_1 \,
    d_2$ be their signed favored unit arc centers in their respective normalized coordinates,
    so $\| det \( d_1 \, d_2 \) \| gt.eq sin \( pi \/ 8 \)$. Let $Psi$ send these original centers to
    $\( 1 \, 1 \)$ and $\( 1 \, - 1 \)$; its operator norm is less than $10$. Set $Phi = Psi A_i^(- 1)$.
    A point of the second path with normalized coordinate $u =
    A_j^(- 1) pi \( x \)$ has coordinate $A_i^(- 1) A_j u$ under the first matrix.
    Its displacement from $u$ is at most $zeta \| u \|_2$. Thus arc width, radial overshoot,
    and this adjacent-matrix error give endpoint error less than $e \/ 8$ once $D_pi \/ W < zeta$.
    The whole paths have coordinate displacement less than $30$, and edge increments tend to zero as $W arrow.r oo$.
  #emph[Case 2: some fixed direction supports a strip ray with positive probability.] Existence of a ray in some
    finite-width centered strip in that direction is a tail event:
    a suffix survives every finite edge modification. Its probability is therefore one.
    Choose a seed radius $m_0$ and a width $w$ so that a ray from $B \( o \, m_0 \)$ in that strip exists with
    probability greater than $1 - \( eta \/ 30 \)^2$. Enlarge $w$ to contain the seed projection as well.
    Write the longitudinal and transverse coordinates in these perpendicular axes.
    Such a ray is longitudinally unbounded in absolute value, by the bounded-projection hypothesis.
  Choose an arbitrarily large transverse scale $V$ with $w \/ V < zeta$ and $D_pi \/ V < zeta$.
    By uniqueness and the preceding directional tail observation,
    on the seed-strip event the seed also connects to absolute transverse level $V$.
    Stop at the first such crossing. Its finite path can be confined to some longitudinal bound $M \( V \)$ while
    retaining probability greater than $1 - 2 \( eta \/ 30 \)^2$:
    increase the bound and use continuity from below. Choose $U$ with $M \( V \) \/ U < zeta$ and $D_pi \/ U <
    zeta$. The strip ray also gives a first crossing of absolute longitudinal level $U$ with probability greater
    than $1 - \( eta \/ 30 \)^2$.
  Split each kind of exit by its sign. Harris’s inequality on the two misses supplies one favored sign of each
    kind, each with probability greater than $1 - eta \/ 10$.
    After division by $U \, V$, each endpoint is within supremum distance $zeta$ of its signed coordinate unit
    vector, and both paths lie in the square $\[ - 2 \, 2 \]^2$.
    A linear map sending those two vectors to $\( 1 \, 1 \) \, \( 1 \, - 1 \)$ gives endpoint error less than
    $e \/ 8$ and path displacement less than $30$. For any requested operator bound,
    first take $V$ sufficiently large, then determine the finite bound $M \( V \)$,
    and finally take $U$ sufficiently large. The last linear map has norm at most $2$,
    so the composite map has norm at most $2 \/ min \( U \, V \)$.
    No bound on the growth of $M \( V \)$ is needed. Thus edge increments can be made arbitrarily small after the
    seed has been fixed.
  Let $c$ be a density radius of the orbit $Lambda o$ and set $m = m_0 + c$.
    Given $y$, choose $g$ with $d \( g o \, y \) lt.eq c$. Equivariance translates the two events at $o$ to $g o$,
    and their seeds lie in $B \( y \, m \)$. Include in the preceding scale choices the requirements $\| Phi
    pi \( g o \) - Phi pi \( y \) \|_oo < e \/ 8$ and that edge increments are at most the requested $rho_0$:
    it suffices to make the operator norm of $Phi$ smaller than both $e \/ \( 8 \( c + 1 \) D_pi \)$ and $rho_0 \/
    D_pi$. The endpoint errors are then at most $e \/ 4$, and the path bound is less than $100$.
    All choices of $m$ preceded the requested small edge increment.
  Only now lower the percolation parameter. Finite paths witness the two events at $o$.
    Approximate each by a finite union of path witnesses, preserving a probability greater than $1 - eta$,
    with room to spare. Continuity of these finite events gives the same bounds at a common $p'
    in \[ p_c \/ 2 \, p_c \)$. Their translates give the required bounds at every $y$ by the preceding
    deterministic containment. ◻
]

== 9 Fresh corridors and a subcritical infinite cluster <sec:corridor-exploration>

Proposition 18 supplies paths with approximate coordinate displacements $\( 1 \, 1 \)$ and $\( 1 \, - 1 \)$.
  We will use them to transfer a connection through long corridors.
  The corridor axes have slopes $1 \/ 4$ and $- 1 \/ 4$: at each step,
  choosing the sign of the vertical move corrects the path’s displacement from its axis.
  The smaller slope leaves room for this correction even when the entrance point is not prescribed.

The corridors form the bonds of an oriented square lattice, but their vertex sets are coordinate preimages in $G$.
  All paths and revealed edges remain in $G$. We will reveal an incoming corridor only after estimating
  connections through the still fresh outgoing corridors. This order will give a uniform conditional failure bound
  for each tested lattice site.

=== 9.1 The deterministic layout <the-deterministic-layout>

The constant $C$ is the path-displacement bound from Proposition 18.
  Let $B$ be the initial vertical tolerance for an entrance, and let $H$ be the tube half-width. Fix

$ C = 100 \, wide mu = 1 / 4 \, wide B = 2 C + 10 \, wide H = 3 B . $

An endpoint rectangle of time half-width $J$ will contain every overlap of incident tubes.
  Choose that width first, and then the corridor length, by taking integers $J \, L$ with

$ J > 10 \( H \/ mu + C \) \, wide L > 10 \( J + B \) \, wide T = L + 1 / 2 . $

For a site $v = \( a \, b \) in bb(N)_0^2$, let $c_v = \( \( a + b \) T \, \( a - b \) mu T \)$.
  Its children are $\( a + 1 \, b \)$ and $\( a \, b + 1 \)$;
  their displacement from $v$ is $\( T \, sigma mu T \)$ with $sigma = 1$ and $- 1$, respectively.
  All regions below mean vertex preimages under the coordinates $\( t \, z \)$,
  with coordinates taken relative to the indicated center. Define

$ Q_v = { \| t - c_v^(\( 1 \)) \| lt.eq J \, med \| z - c_v^(\( 2 \)) \| lt.eq mu J + H } . $

For a parent–child pair $v \, x$ of sign $sigma$, let $D_(v x)$ be the induced subgraph on the union of $Q_v \,
  Q_x$ and the tube

$ 0 lt.eq t - c_v^(\( 1 \)) lt.eq T \, wide \| z - c_v^(\( 2 \)) - sigma mu \( t - c_v^(\( 1 \)) \) \| lt.eq H . $

Write $cal(E)_(v x)$ for its edge set, and $cal(Q)_v$ for the edge set induced by $Q_v$.

#thm([Lemma 9.1.])[
  (Corridor separation).  #emph[Distinct $Q_v$ are disjoint.
    Two distinct corridors with no common endpoint have disjoint vertex sets;
    corridors sharing an endpoint $v$ intersect only in $Q_v$. A corridor misses every nonendpoint $Q_w$.
    Consequently, common edges of incident corridors belong to $cal(Q)_v$ at their common endpoint.]
] <lem:corridors>

#proof[
  Site layers are spaced by $T$ in the time coordinate; within a layer their heights are spaced by $2 mu T$.
    The choices give $T > 2 J$ and $mu T > mu J + H$, so the $Q$ regions are disjoint.
    A tube near either endpoint layer has height differing from that endpoint by at most $mu J +
    H$ when its time differs by at most $J$. It therefore misses every other $Q$ in that layer;
    other layers are excluded by their time coordinates.
  Tubes in nonadjacent layer intervals have disjoint time interiors.
    At a common layer plane, distinct endpoint heights differ by $2 mu T > 2 H$,
    so adjacent-layer tubes can meet only at a shared endpoint, inside its $Q$.
    In the same layer interval, parallel tube axes are separated by $2 mu T$.
    Oppositely sloped axes can approach within $2 H$ only when they share a start,
    within time $H \/ mu$ of that start, or share an end, within time $H \/ mu$ of that end.
    These intersections lie in the corresponding $Q$, since $J > H \/ mu$.
    Combining these tube facts with the $Q$ facts proves the vertex claims.
    An edge in both induced subgraphs has both endpoints in their vertex intersection, proving the last assertion.
    Edges joining different corridors are never added merely because both their endpoints have been revealed. ◻
]

=== 9.2 Relay regions and the order of scales <subsec:corridor-scales>

Inside a corridor we will place successive input regions near integer times.
  Their vertical half-width decreases from $B$ by $1 \/ 2$ per step until it reaches $2$.
  The local moves can make this correction because their vertical displacement has magnitude one while the axis
  advances only $mu = 1 \/ 4$. The final move will be stopped at the child mark,
  halfway between the last two integer times.

For a vertex set $A$, its distance-$R$ collar is the ambient neighborhood ${ x in V \( G \) :
  d_G \( x \, A \) lt.eq R }$, where $d_G \( x \, A \) = inf_(a in A) d_G \( x \, a \)$ and $inf diameter = oo$.
  We need each input region’s collar to contain many disjoint finite seed trials.
  The collar may be wide in graph distance while narrow in coordinates,
  because the edge-coordinate bound is chosen last.

Let $epsilon$ be the permitted conditional probability of a failed lattice site. Choose it so small that

#[#set math.equation(numbering: n => "(50)")
 $ sum_(l gt.eq 1) 4^l epsilon^(l \/ 4) < 1 . $ <eq:directed-contour-series>]

The threshold $delta$ will test stored connection probabilities; $kappa$ will bound the loss at a single relay. Set

$ delta = epsilon \/ 4 \, wide kappa = frac(epsilon delta, 8 \( L + 1 \)) \, wide lambda = kappa \/ 4 \, wide K =
  log \( 4 \/ kappa \) . $

The transfer proof will use the auxiliary error $lambda$ and trial weight $K$.
  To keep accumulated endpoint errors below $1 \/ 100$, choose $e > 0$ with $\( L + 3 \) e < 1 \/ 100$.
  Choose the failure probability of a seed move to satisfy

$ 0 < eta_0 lt.eq frac(kappa lambda, 4 \( K + 1 \)) . $

Proposition 18, with $e \, eta_0$, first gives a seed radius $m$.
  We next choose the number $k$ of possible contacts needed for disjoint seed trials and the graph-distance collar
  width $R$. With $D$ the maximum degree, take integers

#[#set math.equation(numbering: n => "(51)")
 $ k & > V_(+) \( 4 m + 2 \) ⌈K \/ \( p_c \/ 2 \)^(m + 1 + V_(+) \( m \))⌉ \,\
R & > m + 4 \( 1 - p_c \)^(- D k) \/ kappa . $ <eq:corridor-trial-scales>]

Now choose $rho > 0$ so that

#[#set math.equation(numbering: n => "(52)")
 $ \( R + m + 1 \) rho < e \/ 10 \, $ <eq:corridor-coordinate-step>]

and obtain the coordinates and a common $p' in \[ p_c \/ 2 \, p_c \)$ from Proposition 18,
  with edge increments at most $rho$. Thus $m$ is fixed before the trial count and collar width;
  both are fixed before the coordinate scale and the parameter $p'$.

At site $v$ put

$ M_v = { 0 lt.eq t - c_v^(\( 1 \)) lt.eq rho \, med \| z - c_v^(\( 2 \)) \| lt.eq B } . $

In a corridor $v \, x$ of sign $sigma$, use the successive input regions $B_0 = M_v$ and, for $1 lt.eq i lt.eq L$,

#[#set math.equation(numbering: n => "(53)")
 $ B_i = { \| t - c_v^(\( 1 \)) - i \| lt.eq \( i + 1 \) e \, med \| z - c_v^(\( 2 \)) - sigma mu i \| lt.eq
   b_i } \, wide b_i = max \( 2 \, B - i \/ 2 \) . $ <eq:relay-regions>]

The last target is $B_(L + 1) = M_x$.

Each distance-$R$ collar of $B_i$, $0 lt.eq i lt.eq L$, is contained in $D_(v x)$.
  From every vertex $y$ in that collar, one of the two seed moves reaches the next region with probability at
  least $1 - eta_0$, using paths in $D_(v x)$. We give the estimates, including the last crossing.
  Suppose first that $0 lt.eq i < L$ and that $y$ is in the collar of $B_i$.
  A distance-$R$ displacement changes either coordinate by at most $R rho$.
  Write $r = z \( y \) - c_v^(\( 2 \)) - sigma mu i$ for the vertical error at the current integer time.
  Choose a move sign $tau in { - 1 \, 1 }$ with $tau r lt.eq 0$, either sign when $r = 0$.
  Its target error relative to the next axis point is $r + tau - sigma mu$, up to $e \/ 4$.
  With $b_0 = B$, its magnitude is at most

$ max \( 1 + mu \, b_i + R rho - 1 + mu \) + e \/ 4 lt.eq b_(i + 1) . $

The inequality follows from $mu = 1 \/ 4$, $b_i gt.eq 2$, and $R rho + e \/ 4 < 1 \/ 4$.
  Time error increases by at most $R rho + e \/ 4 < e$; at $i =
  0$ the additional initial interval length $rho$ also fits the allowed $2 e$.

Since $b_L = 2$, a move from the collar of $B_L$ starts below time $T$ and ends above it.
  The starting vertex may be anywhere in $B \( y \, m \)$, so its additional time error is $m rho$,
  paid for by (52). Along the path, the first vertex at or above $T$ has time in $\[ T \, T + rho \]$.
  Its height differs from the child center by at most $2 + R rho + C + mu \/ 2 < B$, so it lies in $M_x$.

For every move, while its time is between the endpoint times, its deviation from the tube axis is at most

$ B + R rho + C + mu #scale(x: 120%, y: 120%)[\(] \( L + 1 \) e + rho + R rho + C #scale(x: 120%, y: 120%)[\)] < H . $

Outside that time interval its time is within $C + 1$ of an endpoint and its height lies in that endpoint’s $Q$.
  This proves containment of the paths. Collar containment follows from the same estimates without the $C$ terms.
  The induced corridor therefore contains every original edge of each indicated path,
  as required for the seed-move probability to hold inside the corridor.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.18), (4.5, 2.43), (4.5, 2.07), (0, -0.18), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#000073"), thickness: 0.5pt, miter-limit: 10))
  line((0, 0), (4.5, 2.25), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((0, 0.18), (4.5, -2.07), (4.5, -2.43), (0, -0.18), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#000073"), thickness: 0.5pt, miter-limit: 10))
  line((0, 0), (4.5, -2.25), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((4.5, 2.43), (9, 0.18), (9, -0.18), (4.5, 2.07), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#000073"), thickness: 0.5pt, miter-limit: 10))
  line((4.5, 2.25), (9, 0), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((4.5, -2.07), (9, 0.18), (9, -0.18), (4.5, -2.43), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#000073"), thickness: 0.5pt, miter-limit: 10))
  line((4.5, -2.25), (9, 0), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  rect((-0.378, -0.468), (0.378, 0.468), fill: rgb("#fff2e6"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -0.27), (0.036, 0.27), fill: rgb("#002600"), stroke: (paint: rgb("#002600"), thickness: 0.4pt, miter-limit: 10))
  rect((4.122, 1.782), (4.878, 2.718), fill: rgb("#fff2e6"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  rect((4.5, 1.98), (4.536, 2.52), fill: rgb("#002600"), stroke: (paint: rgb("#002600"), thickness: 0.4pt, miter-limit: 10))
  rect((4.122, -2.718), (4.878, -1.782), fill: rgb("#fff2e6"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  rect((4.5, -2.52), (4.536, -1.98), fill: rgb("#002600"), stroke: (paint: rgb("#002600"), thickness: 0.4pt, miter-limit: 10))
  rect((8.622, -0.468), (9.378, 0.468), fill: rgb("#fff2e6"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  rect((9, -0.27), (9.036, 0.27), fill: rgb("#002600"), stroke: (paint: rgb("#002600"), thickness: 0.4pt, miter-limit: 10))
  content((-0.6249, 0), [$Q_((0,0))$], anchor: "east", padding: 0.1176cm)
  content((4.5, 2.93), [$Q_((1,0))$], anchor: "south", padding: 0.1176cm)
  content((4.5, -2.93), [$Q_((0,1))$], anchor: "north", padding: 0.1176cm)
  content((9.625, 0), [$Q_((1,1))$], anchor: "west", padding: 0.1176cm)
  content((2.25, 1.473), [$D_((0,0),(1,0))$], anchor: "south", angle: 26.57deg, padding: 0.1176cm)
  line((6.3, -1.935), (8.973, -0.252), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  content((6.3, -1.962), [mark $M_((1,1))$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 3: A diamond in the corridor layout. Corridors intersect only inside the rectangle at a shared endpoint. The narrow green regions are the marks $M_v$. Revealing an incoming corridor reveals the endpoint rectangle, while the parts of the outgoing corridors outside that rectangle remain fresh. Widths and the two coordinate scales are exaggerated; the separation inequalities are proved in Lemma 20. ],
) <fig:corridors>

=== 9.3 A transfer estimate in a fresh collar <a-transfer-estimate-in-a-fresh-collar>

The exterior-contact, independent-seed, and shell-conditioned target construction adapts Kozma and Nitzan’s
  Lemma 10 #cite(label("KozmaNitzan2024")) Section 4. We prove the version needed for fresh metric collars in the
  original graph, using Theorem 10.

The next argument applies to a countable product graph consisting of original edges of $G$ and one synthetic
  source $*$ wired to finitely many vertices. Edges outside the designated fresh region may have arbitrary
  independent probabilities, including zero and one.

#thm([Proposition 9.2.])[
  (Fresh-collar transfer).  #emph[Let $G$ and the parameters $m \, k \, R \, K \, eta_0 \, lambda \, kappa \,
    p'$ satisfy the choices in Subsection 9.2. Consider a countable product graph whose edges are original edges
    of $G$, together with a synthetic source $*$ joined by deterministic open edges to finitely many vertices.
    Original edges have arbitrary independent probabilities except where specified below.
    Let $T_(*)$ be a fixed vertex set in this product graph. Let $B_(*)$ be a vertex set whose distance-$R$ collar
    is contained in a subgraph $D_(*)$ having all its induced original edges present and iid with probability
    $p'$. Suppose each vertex $y$ in the collar satisfies
$ bb(P)_(p') \( B \( y \, m \) arrow.l.r T_(*) upright(" by paths in ") D_(*) \) gt.eq 1 - eta_0 . $

 Suppose the wired seed vertices are outside the collar, and all other edges of the product graph are original
   edges of $G$. Then
#[#set math.equation(numbering: n => "(54)")
 $ bb(P) \( * arrow.l.r B_(*) \, med * arrow.l.r.not T_(*) \) lt.eq kappa . $ <eq:fresh-collar-transfer>]

 In particular this applies to each successive pair in (53),
   whenever the whole corridor is fresh and the wires are outside the input collar.]
] <prop:transfer>

#proof[
  The empty input is immediate. We first choose a shell at which there are unlikely to be only a few exterior
    contacts. We will use the contacts to reach a relay set determined by independent interior bits,
    then apply joint gluing after those bits have been fixed.
  ===== 9.3.1 A shell with enough contacts. <a-shell-with-enough-contacts.>
  Use distance in the original graph to $B_(*)$. For $m + 1 lt.eq j lt.eq R$,
    let $X_j$ be the level-$j$ vertices reachable from $*$ using only vertices at levels at least $j$ and the
    wired source. It is measurable in the exterior bits with both endpoints at these levels.
    Hitting $B_(*)$ requires $X_j eq.not diameter$. If $1 lt.eq \| X_j \| < k$,
    closing all edges from $X_j$ to level $j - 1$ has conditional probability at least $\( 1 - p_c \)^(D k)$ and
    forces the minimum reached level to be exactly $j$. These minimum-level events are disjoint for different $j$.
    Thus some deterministic $j$ satisfies
  #[#set math.equation(numbering: n => "(55)")
   $ bb(P) \( 1 lt.eq \| X_j \| < k \) lt.eq frac(\( 1 - p_c \)^(- D k), R - m) < kappa \/ 4 . $ <eq:few-contacts>]
  The edges closed here are fresh collar edges, independent of the exterior.
    Distance changes by at most one along every original edge; the source wires lie outside all these levels.
  Fix this deterministic $j$. Let $cal(F)_(upright("ext"))$ be the sigma-field generated by edges with both
    endpoints at levels at least $j$. It determines $X_j$ and will determine the finite list of contacts used for
    trials.
  ===== 9.3.2 An interior relay set. <an-interior-relay-set.>
  For every level-$j$ vertex $v$, fix an inward geodesic of length $m + 1$ ending at $y_v$,
    and a spanning tree of $B \( y_v \, m \)$. The geodesic and tree lie in the collar,
    and every one of their edges has an endpoint of level less than $j$.
    Let $W_v$ be the event that all these trial edges are open. Its probability satisfies
  $ s_v := bb(P) \( W_v \) gt.eq s_0 := \( p_c \/ 2 \)^(m + 1 + V_(+) \( m \)) . $
  Let $xi$ be the configuration on the union of all these fixed trial edge sets,
    including trials at vertices not ultimately selected. These are fresh product bits,
    independent of $cal(F)_(upright("ext"))$. Define
  $ g_v \( xi \) = bb(P) \( B \( y_v \, m \) arrow.l.r T_(*) divides xi \) . $
  This conditional probability integrates over #emph[all] remaining bits,
    including those generating $cal(F)_(upright("ext"))$. The actual exterior chooses contacts but is not fixed in
    this target probability. The function $g_v$ is increasing in $xi$ and has mean at least $1 - eta_0$.
    Harris’s inequality and Markov’s inequality therefore give
  #[#set math.equation(numbering: n => "(56)")
   $ bb(P) \( W_v \, med g_v < 1 - lambda \) lt.eq s_v eta_0 \/ lambda . $ <eq:good-trial>]
  Define the relay set before choosing the contact list:
  $ A \( xi \) = { v : med d \( v \, B_(*) \) = j \, med W_v upright(" occurs") \, med g_v \( xi \) gt.eq 1 -
    lambda } . $
  This set contains every good trial vertex and depends only on $xi$.
    Given $xi$, each $v in A \( xi \)$ is connected by its trial edges to the whole seed ball,
    so its conditional probability of reaching $T_(*)$ is at least $1 - lambda$.
    The remaining law is a countable product with the trial states fixed. Corollary 13 gives
  $ bb(P) \( * arrow.l.r A \( xi \) \, med * arrow.l.r.not T_(*) divides xi \) lt.eq lambda . $
  It remains to bound the probability that the source hits $B_(*)$ without reaching this relay set.
  ===== 9.3.3 Reaching an interior relay from the exterior. <reaching-an-interior-relay-from-the-exterior.>
  Fix an enumeration of the countable vertex set. If $\| X_j \| gt.eq k$,
    select its first available vertices in this order, using only the exterior,
    at pairwise distances greater than $4 m + 2$, until the sum of their $s_v$ is in $\[ K \, K + 1 \]$.
    Greedy selection deletes at most $V_(+) \( 4 m + 2 \)$ candidates each time,
    so (51) guarantees this is possible; the selected list is finite even when $X_j$ is infinite.
    Each trial lies within distance $2 m + 1$ of its vertex, so the selected trials have disjoint edge sets.
    Conditional on the exterior, their probability of no success is at most $e^(- K) = kappa \/ 4$.
    By (56) their probability of a successful trial with $g_v < 1 -
    lambda$ is at most $\( K + 1 \) eta_0 \/ lambda lt.eq kappa \/ 4$.
    These estimates remain valid after selection because the entire $xi$ law is independent of the exterior
    selecting the list.
  On a hit of $B_(*)$, the contact set is nonempty. Outside the small-contact error in (55) and the two trial
    errors, some selected exterior contact belongs to $A \( xi \)$ and is already connected to the source.
    Thus the probability of hitting $B_(*)$ without hitting $A \( xi \)$ is at most $3 kappa \/ 4$.
    Integrating the conditional gluing bound and using $lambda = kappa \/ 4$ proves (54). ◻
]

=== 9.4 Adaptive exploration with stored predictions <adaptive-exploration-with-stored-predictions>

Stored high conditional probabilities are used in the proof of Kozma and Nitzan’s Theorem 6,
  particularly equations (30)–(32) #cite(label("KozmaNitzan2024")).
  The adaptive block strategy has an earlier antecedent in Grimmett and Marstrand
  #cite(label("GrimmettMarstrand1990")) Sections 3–4. Here we use an oriented quadrant,
  choose one incoming corridor, reveal whole edge domains, and prove the conditional-failure boundary estimate
  explicitly.

#thm([Proposition 9.3.])[
  (Subcritical exploration).  #emph[Suppose the coordinates and seed radius satisfy Proposition 18,
    the corridor layout satisfies Lemma 20, and every relay in (53) satisfies Proposition 21. If
$ 2 \( eta_0 + L kappa \) < delta \, wide delta + 2 \( L + 1 \) kappa \/ delta lt.eq epsilon \, wide
  sum_(l gt.eq 1) 4^l epsilon^(l \/ 4) < 1 \, $

 then Bernoulli bond percolation at $p'$ has an infinite cluster with positive probability.
   In particular, the choices (51)–(52) and the preceding error parameters have this consequence at $p' < p_c$.]
] <prop:exploration>

#proof[
  Choose $o$ with $\( t \( o \) \, z \( o \) \) = \( 0 \, 0 \)$,
    and wire a synthetic source to the finite ball $B \( o \, m \)$.
    A revealed history records a union of the edge domains $cal(Q)_v \,
    cal(E)_(v x)$ and their actual $p'$ states. In a prospective graph obtained by adding another edge domain,
    previously revealed states remain fixed and the other edges have their conditional product law.
    We include only the edges of those domains, even if further original edges join vertices already present.
    The domains may be infinite; the conditional-law justification below covers this point.
  ===== 9.4.1 Initialization. <initialization.>
  At the root site, the two moves reach the corresponding $B_1$ directly with probability at least $1 - eta_0$.
    From $B_1$ onward, source wires are outside each input collar, by their time separation and (52).
    Summing Proposition 21 in a fixed child corridor shows that the source misses its child mark with probability
    at most $eta_0 + L kappa$. Reveal $cal(Q)_0$. The two conditional predictions for reaching the child marks are
    both at least $1 - delta$ on an event of positive probability:
    the probability that either fails this threshold is at most $2 \( eta_0 + L kappa \) \/ delta < 1$.
    Condition on this $cal(Q)_0$-measurable event, declare the root good, and store these two predictions.
    The source already hits $M_0$ through $o$. For the rest of the proof,
    probabilities refer to the law conditioned on this initialization event.
  ===== 9.4.2 A test and its two exposure times. <a-test-and-its-two-exposure-times.>
  Process sites by increasing layer $a + b$, in a fixed order within each layer.
    A nonroot site is tested if it has a good parent; choose one such parent $w$ deterministically.
    Sites with no good parent are not tested. Before testing $v$, let $I$ denote the revealed history.
    There are two geometric facts at this time. The incoming corridor $cal(E)_(w v)$ meets $I$ only in its
    parent’s already known $cal(Q)_w$. Every outgoing corridor $cal(E)_(v x)$ misses $I$ entirely.
    Indeed, no revealed corridor has endpoint $v$ or either child of $v$:
    earlier tests reveal only their own incoming corridors, and all sites of a preceding layer are processed
    first. Apply Lemma 20 to these domains and to $cal(Q)_0$.
  The first fact preserves the prediction stored when $w$ became good.
    Intervening reveals meet $cal(E)_(w v)$ only in $cal(Q)_w$, which was already known then,
    so they leave the other incoming bits independent with parameter $p'$.
    The newly included history edges can only add paths. Thus, in the prospective graph $I union cal(E)_(w v)$,
  #[#set math.equation(numbering: n => "(57)")
   $ bb(P) \( A_v divides I \) gt.eq 1 - delta \, wide A_v =
     { * arrow.l.r M_v upright(" in ") I union cal(E)_(w v) } . $ <eq:stored-prediction>]
  The second fact allows us to estimate both outgoing predictions #emph[before] revealing the incoming corridor.
    For a child $x$ of $v$, use the prospective graph
  $ I union cal(E)_(w v) union cal(E)_(v x) . $
  Conditionally on $I$, every edge of $D_(v x)$ still has its fresh iid $p'$ law.
    In particular this includes the shared endpoint region $cal(Q)_v = cal(E)_(w v) ∩ cal(E)_(v x)$,
    which has not yet been revealed. The source wires lie outside all the input collars, by time separation.
    Apply Proposition 21 to the $L + 1$ consecutive relays, all in this same prospective graph. It gives
  #[#set math.equation(numbering: n => "(58)")
   $ bb(P) \( A_v \, med * arrow.l.r.not M_x divides I \) lt.eq \( L + 1 \) kappa . $ <eq:prospective-transfer>]
  A hit of the first region and a miss of the last entails a hit followed by a miss at some consecutive pair,
    so no independence between the successive estimates is needed.
  Now reveal all of $cal(E)_(w v)$ and call the enlarged history $F$.
    The event $A_v$ and every state in $cal(Q)_v$ are now known.
    The outgoing edges outside $cal(Q)_v$ remain unexposed. For each child compute
  $ q_x \( F \) = bb(P) \( * arrow.l.r M_x upright(" in ") F union cal(E)_(v x) divides F \) . $
  This product integral fixes the incoming states and integrates over the unexposed outgoing edges;
    computing it reveals no further edge. Declare $v$ good if $A_v$ occurs and both predictions are at least $1 -
    delta$; otherwise declare the tested site failed. In the good case store both predictions.
    By conditioning (58) on $F$,
  $ bb(E) \[ upright(bold(1))_(A_v) \( 1 - q_x \( F \) \) divides I \] lt.eq \( L + 1 \) kappa . $
  Together with (57) and Markov’s inequality, this gives the uniform conditional failure bound
  #[#set math.equation(numbering: n => "(59)")
   $ bb(P) \( v upright(" fails") divides I \) lt.eq delta + frac(2 \( L + 1 \) kappa, delta) lt.eq
     epsilon . $ <eq:conditional-test-failure>]
  ===== 9.4.3 Conditional laws for countable reveal domains. <conditional-laws-for-countable-reveal-domains.>
  We justify the product-law statements also for infinite reveal domains.
    At any finite slot there are only finitely many earlier decisions and parent choices.
    For each possible decision sequence, the union $R$ of revealed edge sets is deterministic,
    and the event of following that sequence is measurable in the coordinates of $R$.
    The sequence, its edge states, and every prediction are functions of those coordinates;
    a prediction is a measurable product integral on the countable complement.
    On this part of the history space, independence of disjoint coordinate sets gives the original product law on
    $R^c$, conditionally on the full revealed states. This is a statement about conditional kernels,
    and does not condition on a positive-probability individual infinite configuration.
    It follows either directly by Fubini on the two countable coordinate sets or by first testing cylinder
    functions on $R^c$ and then using a monotone class argument.
    The initial conditioning is measurable in $cal(Q)_0$ and hence preserves this property.
    This proves the induction on slots. In particular, future corridor bits are not revealed by decisions based on
    their conditional probabilities.
  ===== 9.4.4 A boundary of failed sites. <a-boundary-of-failed-sites.>
  For any fixed finite set $S$ of nonroot sites,
  #[#set math.equation(numbering: n => "(60)")
   $ bb(P) \( upright("every site of ") S upright(" is tested and fails") \) lt.eq
     epsilon^(\| S \|) . $ <eq:specified-failures>]
  Indeed, enumerate the finite slots up to the last site of $S$.
    At its slot, the event that a given site is tested and that the previous specified sites failed is measurable
    before the test. Apply (59) and iterate. A specified site that is not tested makes the event impossible.
    A set containing the good root also has probability zero.
  If the good set is finite, draw the counterclockwise boundaries of its unit site squares and cancel oppositely
    oriented shared edges. The remaining directed graph is finite and balanced,
    so its edges decompose into closed directed trails with no repeated edge.
    One trail contains the fixed west edge of the root square, since the sites lie in the nonnegative quadrant.
    In a trail of length $l$, half the steps point up or left, by horizontal and vertical balance.
    An up step crosses an east adjacency from a good site to a nongood child;
    a left step crosses a north adjacency of the same kind. Every such child was tested and failed,
    because all its parents were processed earlier. Each child has at most two parents,
    so this trail specifies at least $l \/ 4$ distinct failed sites.
  There are at most $4^l$ trails of length $l$ starting with the fixed oriented root edge.
    For each candidate, its up and left edges determine the outside child sites;
    restricting to edge-distinct trails preserves the preceding multiplicity bound.
    Equation (60) and a union bound show that the probability of a finite good set is at most the sum in (50),
    which is less than one.
  Thus with positive conditional probability there are infinitely many good sites.
    Their layers, hence their time coordinates, are unbounded.
    Each good mark was reached by an actual open path from the wired finite seed at its test,
    and later reveals do not change those states. The seed therefore has an infinite open component.
    Removing the synthetic source leaves an infinite cluster from one of its finitely many wired vertices.
    The initialization event had positive probability, so this conclusion also has positive probability in the
    unconditioned $p'$ law.
  Finally, the chosen parameters satisfy the two numerical hypotheses. They give $eta_0 lt.eq kappa$ and
  $ 2 \( eta_0 + L kappa \) lt.eq 2 \( L + 1 \) kappa = epsilon delta \/ 4 < delta \, wide delta +
    2 \( L + 1 \) kappa \/ delta = epsilon \/ 2 lt.eq epsilon . $
  The remaining hypothesis is exactly (50). ◻
]

Since $p' < p_c$, Proposition 22 contradicts the assumed critical jump and completes the induction in Theorem 14.

== 10 Completion and the lattice consequence <sec:completion>

#proof[
  The reduction in Section 2 permits us to work with a simple graph.
    By Lemma 2, its uniform exponential growth rate exists. If this rate is greater than one, Theorem 3 applies.
    Otherwise the graph has subexponential growth.
  In this remaining case, if (4) holds, Theorem 9 excludes critical percolation.
    If it does not hold, (5) holds along an unbounded sequence.
    Proposition 15 supplies the group action required by Theorem 14,
    which again excludes critical percolation when $p_c < 1$.
    Thus every fixed vertex has probability zero of belonging to an infinite critical cluster.
    The countable union over vertices proves the almost-sure assertion. ◻
]

#thm([Corollary 10.1.])[
  #emph[For nearest-neighbor Bernoulli bond percolation on $bb(Z)^d$, for every $d gt.eq 2$,
    there is almost surely no infinite cluster at the critical probability. In particular this holds on $bb(Z)^3$.]
] <cor:lattices>

#proof[
  The graph is infinite, connected, locally finite, and transitive.
    We verify $p_c < 1$ by a planar boundary count on a coordinate copy of $bb(Z)^2$.
    If its origin cluster is finite, the dual edges crossing its edge boundary contain a simple cycle surrounding
    the origin; all crossed primal edges are closed. To see the existence of such a cycle,
    the dual boundary has even degree at every vertex and decomposes into simple cycles.
    The positive horizontal ray from the origin crosses the whole boundary an odd number of times,
    so one cycle crosses this ray oddly. A closed cycle crosses the whole horizontal line evenly,
    and hence also crosses the negative ray.
  A cycle of length $n$ therefore has a positive-ray crossing at distance less than $n$ from the origin.
    Choosing that crossing, an orientation, and a nonbacktracking continuation bounds the number of candidates by
    $2 n 3^n$. Independence bounds the probability that the origin cluster is finite by
  $ sum_(n gt.eq 1) 2 n 3^n \( 1 - p \)^n . $
  For $p < 1$ sufficiently close to one this sum is less than one,
    so planar percolation occurs with positive probability. The same configuration is a subgraph of $bb(Z)^d$,
    proving $p_c \( bb(Z)^d \) < 1$. Theorem 1 now applies. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
