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

#align(center)[#text(size: 16pt, weight: "bold")[The sharp terminal leave in random triangle removal]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Begin with the complete graph $K_n$. At each step, choose uniformly from the triangles whose three edges are still
  present, and delete those edges. Stop when no triangle remains.
  The removed triangles form an edge-disjoint packing; the edges left over form its #emph[leave].
  Let $F_n$ be the number of edges in this terminal graph. The problem is to determine the typical size of this
  leave, including its leading constant.

The accepted triangles form a partial Steiner triple system, and $F_n$ measures its uncovered pairs.
  Bollobás and Erdős conjectured in 1990 that the expected leave has order $n^(3 \/ 2)$,
  as reported in #cite(label("BohmanFriezeLubetzky2015")) Introduction.
  Spencer’s branching-process analysis and the independent nibble argument of Rödl and Thoma showed that the leave
  is $o \( n^2 \)$ with high probability #cite(label("Spencer1995")) #cite(label("RodlThoma1996")).
  Grable proved bounds $O \( n^(11 \/ 6 + xi) \)$ for each fixed $xi >
  0$ and outlined the higher-order calculations leading to $O \( n^(7 \/ 4 + xi) \)$ #cite(label("Grable1997"))
  Theorems 5 and 7. Bohman, Frieze and Lubetzky gave a short proof of the bound
  $O \( n^(7 \/ 4) log^(5 \/ 4) n \)$ #cite(label("BohmanFriezeLubetzky2010")) Theorem 1 and subsequently proved
  $F_n = n^(3 \/ 2 + o \( 1 \))$ with high probability #cite(label("BohmanFriezeLubetzky2015")) Theorem 1.
  Their analysis uses self-correcting dynamic concentration and carefully chosen triangular extensions to
  determine the exponent.

Joos and Kühn developed removal estimates for general strictly balanced hypergraphs,
  including pseudorandom starting hypergraphs #cite(label("joosKuehn2025")) Theorems 1.2–1.3.
  Their Conjecture 16.2 predicts an asymptotic constant for the terminal leave;
  its triangle specialization is $1 \/ \( 2 sqrt(2) \)$ in probability.
  The following theorem proves this triangle case with $L^2$ convergence.
  Numbered references to Joos and Kühn refer throughout to version 2.

#thm([Theorem 1.1.])[
  #emph[For the uniform triangle-removal process starting from $K_n$,
$ bb(E) [(F_n / n^(3 \/ 2) - frac(1, 2 sqrt(2)))^2] arrow.r 0 . $

 In particular,
$ F_n / n^(3 \/ 2) arrow.r^(bb(P)) frac(1, 2 sqrt(2)) \, wide frac(bb(E) F_n, n^(3 \/ 2)) arrow.r frac(1, 2 sqrt(2)) . $

]
] <thm:main>

The only external proof input is the early-prefix control from Joos and Kühn, specialized in Section 2.
  All subsequent continuation estimates are proved here. The theorem concerns removal from $K_n$;
  it does not assert a sharp constant for arbitrary starting graphs or for general hypergraph removal,
  or a fluctuation law.

=== 1.1 The continuation argument <the-continuation-argument>

The proof separates the part of the process governed by uniform subgraph counts from the final evolution of
  individual edges. Stop at a deterministic time when the edge density is approximately $p =
  n^(- 1 \/ 2 + epsilon.alt)$, for a small fixed $epsilon.alt > 0$. The graph then has

$ m = frac(n^2 p, 2) quad upright("edges") \, wide D = n p^2 $

triangles through each edge to relative error $o \( 1 \)$.
  Section 2 states the exact properties needed and verifies their application from the public removal estimates.

The continuation analysis uses backward priority exploration,
  whose hypergraph form appears in Spencer’s work #cite(label("Spencer1995")) Sections 2–4.
  Grable formulated triangle packing as a uniform priority scan and used adaptive exposure decision trees in his
  concentration analysis #cite(label("Grable1997")) Sections 1 and 4.
  The quantitative issue here is to follow a growing rescaled time interval and to approximate joint survival on
  the scale of its vanishing probability. A fixed-time local approximation alone does not give the precision
  required for a second moment.

Give the triangles of this graph fresh independent uniform priorities and scan them in increasing order,
  accepting a triangle when all its edges remain. This represents the continuation of uniform removal.
  An edge survives precisely when a recursive test returns true.
  A child test asks whether the other #emph[two] edges of a candidate triangle survive before its priority.
  We test the two edges with one jointly ordered list of candidates,
  which is essential to the later visitation estimate. Section 3 proves this rule and constructs an auxiliary tree
  in which each occurrence of a candidate receives an independent priority.

In this independent model, the survival probabilities satisfy exact product equations. The scalar comparison is

$ q \( t \) = \( 1 + 2 D t \)^(- 1 \/ 2) \, wide 0 lt.eq t lt.eq 1 . $

This is Spencer’s scalar branching law after the time change $c = D t$ #cite(label("Spencer1995")) Section 3,
  equation (9). Bal and Bennett obtained related matching estimates for fixed-degree random regular hypergraphs
  and regular hypergraphs of growing girth #cite(label("BalBennett2023")) Corollaries 3–4;
  here $D$ grows with $n$, and the terminal rescaled time is $D$.
  To prove a uniform approximation by $q$, one needs stability of a matrix acting on the graph’s edges.
  We obtain it from cycle counts in vertex links. Each normalized link matrix is close in Euclidean norm to its
  averaging projection; the sum of these projections has a directly controlled semigroup in the maximum norm.
  A finite perturbation expansion then gives the stability needed by the product equations (Section 4).

The final issue is the difference between independent occurrences and repeated triangle types in the finite graph.
  We compare the complete candidate lists exposed by one or two root queries.
  A repetition forces an extra graph edge in the union of at most two ancestral query paths (Section 5).
  Small rooted-template bounds control the number of such witnesses.
  Joint time ordering controls the probability that their calls are visited.
  Their combination gives an absolute error $o \( 1 \/ D \)$ (Section 6).
  This precision matters because the two-root survival probability is itself of order $1 \/ D$.

The one- and two-root probabilities determine the first and second moments of $F_n$. Their normalization is

$ m q \( 1 \) = frac(n^2 p, 2 sqrt(1 + 2 n p^2)) tilde.op frac(n^(3 \/ 2), 2 sqrt(2)) . $

Uniformity over the good prefix graphs, together with a sufficiently small prefix failure probability,
  gives the unconditional conclusion in Section 7.

The continuation estimates developed here are the maximum-norm stability of the unfolding and the smaller than
  $D^(- 1)$ error for adaptive paired queries. Both the numerical constant and the moment conclusion use these
  estimates.

=== 1.2 Conventions <conventions>

All graphs are finite and simple. An embedding is injective and preserves edges; it need not preserve nonedges.
  Thus an embedding of a fixed labeled cycle counts its ordered vertex labels, without division by automorphisms.
  The notation $\( 1 plus.minus a \) b$ means a number in $\[ \( 1 - a \) b \, \( 1 + a \) b \]$.
  All unspecified constants below are independent of $n$ and of the realized good prefix graph.
  They may depend on the fixed parameters introduced next. A statement holds with superpolynomially high
  probability if its failure probability is $n^(- omega \( 1 \))$,
  meaning smaller than $n^(- C)$ for every fixed $C > 0$ when $n$ is sufficiently large.

== 2 A uniform early prefix <sec:prefix>

This section supplies all the graph properties used in the continuation.
  In addition to degrees and link cycles, we need two upper bounds for small rooted graphs.
  The second is useful when all the remaining choices together have expected count below one.

Fix

#[#set math.equation(numbering: n => "(2.1)")
 $ epsilon.alt = 1 / 2000 \, wide r_0 = 8000 \, wide L = 100 \, wide B = 50 \, wide H_0 = max { r_0 + 1 \, 3 L +
   2 } = 8001 . $ <eq:constants>]

Here $r_0$ and $H_0$ bound the link-cycle lengths and template orders controlled by the prefix;
  $L$ and $B$ are fixed for the collision-witness count in Section 6.
  Write $G_i$ for the graph after $i$ removals, provided that step is reached, and put

#[#set math.equation(numbering: n => "(2.2)")
 $ p_i & = 1 - 1 / n - frac(6 i, n^2) \,\
i_0 & = ⌊n^2 / 6 (1 - 1 / n - n^(- 1 \/ 2 + epsilon.alt))⌋ \, wide p = p_(i_0) \, wide D = n p^2 \, wide m =
  frac(n^2 p, 2) . $ <eq:prefix-time>]

These quantities are deterministic. In particular,

#[#set math.equation(numbering: n => "(2.3)")
 $ p = n^(- 1 \/ 2 + epsilon.alt) + O \( n^(- 2) \) \, wide D tilde.op n^(2 epsilon.alt) \, wide e \( G_(i_0) \) =
   m $ <eq:scales>]

whenever $i_0$ is reached.

#prodef([Definition 2.1.])[
  (Rooted templates).  A template $\( H \, I \)$ consists of a graph $H$ and an independent set $I subset.eq
    V \( H \)$ of distinguished vertices. For an injection $psi : I arrow.r \[ n \]$,
    let $X_(H \, I \, psi) \( G \)$ count its edge-preserving injective extensions to $V \( H \)$ in $G$.
    Its scaling at density $p$ is
  $ S \( H \, I \) = n^(v \( H \) - \| I \|) p^(e \( H \)) . $
  A subtemplate with the same distinguished set is any subgraph $H' subset.eq H$ whose vertex set contains $I$,
    distinguished by $I$. When $v \( H \) > \| I \|$, the rooted density is
    $e \( H \) \/ \( v \( H \) - \| I \| \)$; it is zero when there are no free vertices.
    The template is #emph[balanced] if every same-root subtemplate has rooted density at most that of $\( H \, I \)$.
] <def:template>

The independence of $I$ is a property of the template. Its prescribed images may have additional edges in $G$.

#thm([Proposition 2.2.])[
  (Good prefix).  #emph[There are constants $c > 0$ and $C_0 <
    oo$ and an event $cal(G)_n$ measurable from the process through step $i_0$ such that
$ bb(P) \( cal(G)_n^c \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - \( log n \)^(4 \/ 3)
  #scale(x: 120%, y: 120%)[\)] = n^(- omega \( 1 \)) $

 for all sufficiently large $n$. On this event, $i_0$ is reached and $G =
   G_(i_0)$ has $m$ edges and the following simultaneous properties.]
  + #emph[ Every vertex has degree $\( 1 plus.minus n^(- c) \) n p$,
    and every two distinct vertices have $\( 1 plus.minus n^(- c) \) D$ common neighbors.]
  + #emph[ For every vertex $u$ and $3 lt.eq j lt.eq r_0$, the number of embeddings of a fixed labeled cycle $C_j$
    into the link $G \[ N_G \( u \) \]$ is $\( 1 plus.minus n^(- c) \) D^j$.]
  + #emph[ For every template $\( H \, I \)$ with $v \( H \) lt.eq H_0$ and every injection $psi :
    I arrow.r \[ n \]$, the following two bounds hold. If $S \( H' \, I \) gt.eq
    1$ for every same-root subtemplate $H'$, then
#[#set math.equation(numbering: n => "(2.4)")
 $ X_(H \, I \, psi) \( G \) lt.eq \( 1 + log n \)^(C_0) S \( H \, I \) . $ <eq:template-large>]

 If $n^(v \( H \) - \| J \|) p^(e \( H \) - e \( H \[ J \] \)) lt.eq
   1$ for every $I subset.eq J subset.eq V \( H \)$, then
#[#set math.equation(numbering: n => "(2.5)")
 $ X_(H \, I \, psi) \( G \) lt.eq \( 1 + log n \)^(C_0) . $ <eq:template-small>]

]
  #emph[All constants and bounds are uniform over the graph and the prescribed root images.]
] <prop:prefix>

#proof[
  We give the specialization of Joos–Kühn’s stopping estimates, including the parameters and rooted conventions.
    Their Sections 5–7 (pp. 9–11) set up the trajectories and stopping times;
    Lemma 10.1 (p. 50) controls those times, and Lemma 7.15 (pp. 16–17) supplies the two general extension bounds
    #cite(label("joosKuehn2025")).
  ===== 2.1 Public parameters and initial hypotheses. <public-parameters-and-initial-hypotheses.>
  Denote their small parameter by $eta$, keeping it distinct from $epsilon.alt$ in (2.1).
    Choose $eta$ small enough for their hierarchy and so that
  $ eta < epsilon.alt \/ 2 \, wide eta^(- 4) gt.eq H_0 . $
  Choose their $delta > 0$ sufficiently small in terms of $eta$, with $delta < 1 \/ 2$.
    These choices remain fixed as $n$ grows. The removed graph is a triangle, with uniformity parameter $k =
    2$ and 2-density $\( 3 - 1 \) \/ \( 3 - 2 \) = 2$; it is strictly 2-balanced.
    The initial density in their normalization is $theta = 2 e \( K_n \) \/ n^2 = 1 - 1 \/ n$.
    Their density trajectory is therefore exactly $p_i$ in (2.2).
    Their horizon has density $n^(- 1 \/ 2 + eta)$, strictly below $p_(i_0)$ for large $n$.
  Their Section 5 requires an $\( eta^4 \, delta \, 2 \)$-pseudorandom initial graph.
    For completeness, $K_n$ satisfies all its defining conditions (P1)–(P4) on p. 3.
    The public convention permits edges among distinguished vertices and ignores them in both counts and scalings.
    For a template with $r$ distinguished vertices, $a$ other vertices,
    and $b$ edges not internal to the distinguished set, every fixed root injection has exactly $\( n - r \)_a$
    extensions in $K_n$; here $\( x \)_a = x \( x - 1 \) dots.h.c \( x - a + 1 \)$ and $\( x \)_0 = 1$.
    For all templates with at most $eta^(- 4)$ vertices,
  $ frac(\( n - r \)_a, n^a theta^b) = 1 + O_eta \( n^(- 1) \) . $
  Their initial error parameter is $zeta_(upright("init")) = n^delta \/ \( sqrt(n) thin theta \)$.
    The displayed relative error is smaller than both $zeta_(upright("init"))$ and $zeta_(upright("init"))^delta$,
    which verifies the relative-error requirements (P1) and (P2).
    If $a gt.eq 1$, the scaling is asymptotic to $n^a$, while the upper scaling threshold in (P3) is at most
    $n^(1 \/ 2)$; thus neither small-scaling condition (P3) or (P4) applies.
    If $a = 0$, count and scaling are both exactly one, and the remaining conditions hold directly.
  ===== 2.2 Balanced counts and the stopping threshold. <balanced-counts-and-the-stopping-threshold.>
  The dynamic error parameter is
  $ zeta_i = frac(n^(eta^2), sqrt(n) thin p_i) = n^(eta^2) x_i^(- 1 \/ 2) \, wide x_i = n p_i^2 . $
  The balanced-template controls in Section 7 give relative error $zeta_i^delta$ until the relevant scaling
    reaches $zeta_i^(- sqrt(delta))$, simultaneously over the templates and root injections in their families.
    For a balanced rooted template with $a gt.eq 1$ free vertices and density at most two,
    its scaling is at least $x_i^a$. Throughout $i lt.eq i_0$, we have $x_i gt.eq n^(2 epsilon.alt)$ and
  $ x_i^a / zeta_i^(- sqrt(delta)) = n^(eta^2 sqrt(delta)) x_i^(a - sqrt(delta) \/ 2) arrow.r oo . $
  Thus each template used for parts Proposition 2.2 and Proposition 2.2 belongs to the tracked family initially
    and never reaches its threshold before $i_0$.
  A rooted edge counts degrees. A path of length two with its endpoints distinguished counts common neighbors,
    even when the prescribed endpoint images are adjacent. For a link cycle of length $j$,
    use the wheel whose center is distinguished and whose rim is the labeled $C_j$.
    This template has $j$ free vertices and $2 j$ edges. Any subset of $s$ free vertices has at most $s$ spokes
    and $s$ rim edges, so the wheel is balanced with density two.
    Its extensions are exactly the labeled link-cycle embeddings and have scaling $D^j$.
    The largest wheel has $r_0 + 1 lt.eq eta^(- 4)$ vertices.
    The degree and codegree templates are likewise balanced, with scalings $n p$ and $D$ respectively.
  At $i_0$,
  $ zeta_(i_0) lt.eq n^(- \( epsilon.alt - eta^2 \)) . $
  Choose any fixed $c$ with $0 < c < delta \( epsilon.alt - eta^2 \)$.
    The public relative errors then imply parts Proposition 2.2 and Proposition 2.2, with slack for fixed constants.
  ===== 2.3 General rooted extensions. <general-rooted-extensions.>
  On the same stopping controls, Lemma 7.15 applies to every template up to the public size cap,
    with no balance assumption on the target template. Its first case states that,
    if all same-root subtemplate scalings are at least one, the extension count is at most its scaling times
    $\( 1 + log n \)^(alpha_(H \, I))$. Its second case gives the bound $\( 1 + log n \)^(alpha_(H \, I))$ when
    every completion scaling after enlarging the distinguished set is at most one. Here
  $ alpha_(H \, I) = 2^(v \( H \) - \| I \| + 1) - 2 . $
  In our independent-root convention these hypotheses are exactly those in (2.4) and (2.5).
    For the latter, the public convention ignores the edges internal to the enlarged root set $J$,
    giving precisely the exponent $e \( H \) - e \( H \[ J \] \)$. We may take $C_0 = 2^(H_0 + 1) - 2$.
    Its size is immaterial: it is fixed independently of $n$.
  ===== 2.4 Probability and conditioning. <probability-and-conditioning.>
  Lemma 10.1 bounds the probability of failure of the required stopping controls before the public horizon by
    $exp \( - \( log n \)^(4 \/ 3) \)$. In particular the triangle count is controlled through $i_0$ around the
    positive trajectory $n^3 p_i^3 \/ 6$, with relative error tending to zero.
    Termination at or before $i_0$ would contradict that control, so $i_0$ is reached on this event.
    Define $cal(G)_n$ to be the event of reaching $i_0$ and satisfying the properties in the proposition at that
    time. It is determined by the prefix alone. The later public success event is a subset of $cal(G)_n$ and
    proves its probability estimate. We do not condition the continuation on any future stopping control. ◻
]

From now through Section 6, fix any prefix in $cal(G)_n$ and write $G = G_(i_0)$.
  All estimates will be uniform over this choice. Let $cal(E) = E \( G \)$,
  and let $cal(T)$ be the set of triangles of $G$, each regarded as a three-element subset of $cal(E)$.
  Thus $\| cal(E) \| = m$, and distinct members of $cal(T)$ have at most one common edge. For $e in cal(E)$, let

$ d_e = \| { T in cal(T) : e in T } \| = \( 1 plus.minus n^(- c) \) D . $

This last equality is the common-neighbor estimate for the endpoints of $e$.
  The task is now to analyze the removal process started from this fixed graph.

== 3 Exact queries and independent unfoldings <sec:queries>

Fix a graph $G$ supplied by Proposition 3, and retain $cal(E) =
  E \( G \)$ and the family $cal(T)$ of triangle edge sets.
  We first express edge survival by a finite recursive test.
  We then give each occurrence in that recursion fresh randomness.
  The resulting auxiliary model has exact product identities,
  which we will estimate before comparing it with the finite process.

=== 3.1 Priorities and the finite test <priorities-and-the-finite-test>

Independent priorities give the standard random greedy packing representation;
  see Spencer #cite(label("Spencer1995")) Section 1, Grable #cite(label("Grable1997")) Section 1,
  and the triangle-removal accounts #cite(label("BohmanFriezeLubetzky2015")) Section 1.2
  #cite(label("joosKuehn2025")) Section 14.1.

Assign independent uniform priorities $U_T in \[ 0 \, 1 \]$ to the triangles $T in cal(T)$.
  Scan the triangles in increasing priority order, accepting a triangle precisely when all three of its edges
  remain, and deleting those edges on acceptance. We work on the probability-one event that all priorities are
  distinct. An edge is #emph[untouched before $t$] if no accepted triangle with priority strictly below $t$ contains it.

#thm([Lemma 3.1.])[
  (Priority representation).  #emph[For any finite simple graph $G$,
    the graph sequence indexed by the accepted triangles in this scan has the law of uniform sequential triangle
    removal started from $G$.]
] <lem:priority>

#proof[
  The priority order is a uniform random permutation of $cal(T)$.
    Conditional on any scanned prefix, the unscanned triangles have uniform relative order.
    Every currently present triangle is unscanned: an accepted triangle has lost its edges,
    and a rejected triangle already had a deleted edge and can never become present again.
    Until the next acceptance the graph stays fixed. Thus the next accepted triangle, if there is one,
    is the first currently present triangle in the remaining permutation, and is uniform among those triangles.
    This also identifies the absorbing state when none remains. ◻
]

In applying the lemma after the good prefix, the priorities are fresh random variables on the triangles of the
  fixed graph $G$. The original process has the same continuation law because its next-step rule depends only on
  its current graph.

A #emph[call] consists of a focus (one or two edges), a threshold $t$, and, for a two-edge focus,
  a parent triangle. The finite test has two forms:

- A root call has focus ${ e }$, threshold $t in \[ 0 \, 1 \]$, and no parent.
  Its candidates are all triangles containing $e$.
- A non-root call has focus ${ f \, g } subset T$, parent triangle $T$, and threshold $t = U_T$.
  Its candidates are all triangles meeting the focus, except $T$.

Distinct triangles meet in at most one graph edge. Consequently every candidate $S$ contains exactly one focus
  edge, denoted $e \( S \)$. Its child call has focus $S \\ { e \( S \) }$, parent $S$, and threshold $U_S$.

At a call the test performs the following steps.

+ Expose the priorities of #emph[all] candidates, in a fixed deterministic order of triangle types.
  Each candidate occurs once in this list.
+ Sort the candidates by priority and consider those with $U_S < t$ in that order.
  For a pair focus this is one joint ordering of the candidates at both focus edges.
+ Evaluate each considered candidate’s child. At the first child returning true, stop and return false.
  If no child returns true, return true.

Exposing a candidate does not require visiting its child:
  priorities above the threshold and candidates skipped after an earlier success are also exposed.
  All calls use the same finite family $\( U_T \)_(T in cal(T))$.
  The test has no side effects; it does not delete edges or change any priority.

#thm([Lemma 3.2.])[
  (Exact paired test).  #emph[For any finite simple graph with distinct triangle priorities,
    the finite test terminates. A root call at $\( e \, t \)$ returns true exactly when $e$ is untouched before
    $t$ in the priority scan. A call with focus ${ f \, g } subset
    T$ and threshold $U_T$ returns true exactly when both $f$ and $g$ are untouched before $U_T$.]
] <lem:finite-test>

#proof[
  Along a recursive path the thresholds strictly decrease through the priorities of triangle types.
    No type can occur twice on that path, so its length is at most $\| cal(T) \|$.
    The branching is finite, proving termination.
  We prove correctness by induction on the number of triangle priorities strictly below the call’s threshold.
    Every child has a smaller threshold, so the induction hypothesis applies to it.
    Write $cal(F)$ for the focus of the present call. We claim that some edge of $cal(F)$ is deleted before $t$ if
    and only if some candidate $S$ with $U_S < t$ has both edges of $S \\ { e \( S \) }$ untouched before $U_S$.
  For the forward implication, take an accepted triangle that deletes a focus edge before $t$.
    It is a candidate and all its edges are untouched just before its acceptance.
    The omitted parent, when present, is at the threshold itself and cannot be this triangle.
    Conversely, suppose such a candidate exists and every focus edge is untouched before $t$.
    Its focus edge is then present at $U_S$, as are its two other edges.
    The scan accepts it, contradicting the assumed survival of the focus. This proves the claim.
    By induction the candidate condition is precisely that its child returns true,
    and the test returns false exactly when at least one such child exists. ◻
]

The parent omission is local to its call and is justified by the strict threshold.
  It does not erase that triangle from descendant lists. Also,
  the two finite survival events in a pair call need not be independent.
  We retain their joint chronological test, including its stopping rule, throughout the comparison argument.

=== 3.2 Fresh randomness at each occurrence <fresh-randomness-at-each-occurrence>

Backward exploration and comparison with independent branching occur in Spencer’s analysis
  #cite(label("Spencer1995")) Sections 2–4. We retain the paired query rule above and all candidate-list exposures
  for the finite comparison.

For a fixed root type, first construct the deterministic tree of all possible calls.
  Each node has one child for each candidate on its list, with the focus and parent specified above.
  The tree is countable and finitely branching. A triangle type may label many different child occurrences.

Assign an independent uniform variable to each child occurrence.
  This variable serves both as the candidate priority in its parent’s list and as the child’s threshold if the
  child is visited. Apply the same joint scanning and stopping rule on this tree.
  Different occurrences of a triangle type now have independent priorities;
  different root queries use disjoint trees with independent variables. We call this the #emph[independent unfolding].

We also allow a singleton root of type $e$ with a specified triangle $T in.rev e$ omitted from its root list.
  The omission affects that list only. Descendant occurrences of $T$ remain available whenever their own parent
  rule allows them. A two-edge root with focus ${ f \, g } subset T$, omitted parent $T$,
  and prescribed threshold $t$ is defined by the same independent construction.

The finiteness argument uses factorial decay along decreasing-priority paths,
  as in the local construction of graph adsorption processes by Penrose and
  Sudbury #cite(label("PenroseSudbury2005")) Proposition 1 and its proof.
  We give the argument for the present occurrence trees.

#thm([Lemma 3.3.])[
  (Finite evaluation).  #emph[For a fixed good graph $G$, independent unfoldings can be constructed so that,
    almost surely, every possible call and all thresholds $t in \[ 0 \, 1 \]$ have finite evaluations.
    Their outputs are jointly measurable in the threshold and the occurrence priorities.]
] <lem:unfolding-finite>

#proof[
  Put $d_max = max_(e in cal(E)) d_e$ and $M = 2 d_max$; every candidate list has at most $M$ entries.
    For large $n$, the good-graph estimates give $M lt.eq 4 D$.
    From any fixed possible node there are at most $M^j$ descendant paths of length $j$.
    On each path the $j$ occurrence priorities are independent uniforms,
    and the probability that they strictly decrease is $1 \/ j !$. Hence
  $ bb(P) \( upright("a decreasing path of length ") j upright(" starts at that node") \) lt.eq
    frac(M^j, j !) arrow.r 0 . $
  The events on the left decrease with $j$. Almost surely their depths are therefore bounded;
    finite branching makes the entire decreasing dependency tree finite.
    This argument uses threshold $1$, and thus works simultaneously for every smaller threshold.
    There are only countably many nodes in the forests for all possible root types,
    so a countable intersection gives the asserted simultaneous conclusion.
  Truncate the recursion at depth $j$, using any fixed Boolean value at the boundary.
    Its output is a measurable function of the threshold and finitely many priorities.
    On the probability-one event just proved, these outputs stabilize as $j arrow.r oo$, for all thresholds,
    to the output of the full evaluation. Defining an arbitrary value on the null exceptional set proves joint
    measurability. ◻
]

We may consequently evaluate a child’s subtree hypothetically even when the chronological test never reaches that
  child. These hypothetical outputs characterize the root event:
  a call returns true if and only if no child with priority below its threshold would return true.
  For fixed priorities this indicator is nonincreasing in the root threshold,
  since each child’s threshold is its own occurrence priority.

=== 3.3 Exact probability identities <exact-probability-identities>

Let $q_e \( t \)$ be the probability that a full singleton root at $e$ returns true at threshold $t$ in the
  independent unfolding. Let $q_(e \, T) \( t \)$ be the same probability when $T in.rev
  e$ is omitted only from that singleton root list. For $T = { e \, f \, g } in cal(T)$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ I_(e \, T) \( t \) = integral_0^t q_(f \, T) \( v \) q_(g \, T) \( v \) thin d v \, wide 0 lt.eq t lt.eq
   1 . $ <eq:integral>]

The integral is well defined by Lemma 6.

#thm([Proposition 3.4.])[
  (Product identities).  #emph[For every triangle $T = { e \, f \, g } in cal(T)$ and $t in \[ 0 \, 1 \]$,
    the independent unfolding satisfies
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(P) \( upright("the pair ") { f \, g } subset T upright(" returns true at ") t \) =
   q_(f \, T) \( t \) q_(g \, T) \( t \) \, $ <eq:pair>]

#[#set math.equation(numbering: n => "(3.3)")
 $ q_e \( t \) & = product_(S in.rev e) #scale(x: 120%, y: 120%)[\(] 1 -
   I_(e \, S) \( t \) #scale(x: 120%, y: 120%)[\)] \,\
q_(e \, T) \( t \) & = product_(S in.rev e\
S eq.not T) #scale(x: 120%, y: 120%)[\(] 1 - I_(e \, S) \( t \) #scale(x: 120%, y: 120%)[\)] . $ <eq:products>]

 In the pair probability, $T$ is omitted from the pair’s candidate list.
   All products are over $cal(T)$, and an empty product equals $1$.
   The functions $q_e$, $q_(e \, T)$, and $I_(e \, T)$ belong to $C^1 \( \[ 0 \, 1 \] \)$.
   Moreover, $q_e \( 0 \) = q_(e \, T) \( 0 \) = 1$ and $I_(e \, T) \( 0 \) = 0$.]
] <prop:products>

#proof[
  After omitting $T$, the candidate sets at $f$ and $g$ are disjoint:
    a triangle containing both edges would equal $T$. Their occurrence variables and all descendant variables are
    independent. The pair returns true precisely when every candidate in both sets fails to give a successful
    child below $t$. The two separate events have the laws of the singleton roots with $T$ omitted, proving (3.2).
    The ordering of the joint list changes which children are visited,
    but not this event that all relevant children fail.
  Consider a candidate $S = { e \, f \, g }$ at a singleton root $e$.
    Conditional on its occurrence priority being $v$, its child is a pair call at threshold $v$,
    with $S$ omitted and independent descendant priorities. Equation (3.2) gives its success probability as
    $q_(f \, S) \( v \) q_(g \, S) \( v \)$. Thus $I_(e \, S) \( t \)$ is exactly the probability that this
    candidate has priority below $t$ and a successful child. Different root candidates use disjoint sets of
    occurrence variables, including their descendants. Taking the probability that none succeeds proves both
    products in (3.3).
  Initially the probabilities are measurable and bounded between $0$ and $1$.
    Equation (3.1) therefore makes each $I_(e \, T)$ Lipschitz.
    The finite products imply continuity of all $q_e$ and $q_(e \, T)$.
    Substitution back into (3.1) now gives a continuous integrand, so the integrals, and then the products,
    are continuously differentiable. Derivatives at the endpoints have their one-sided interpretation.
    The initial values follow directly from the formulas. ◻
]

These identities describe the auxiliary independent model.
  They assert no factorization of survival probabilities in the finite priority system.
  We next estimate their solution uniformly over all edge and omitted-parent types;
  the finite evaluation above has already constructed this solution, so no recursive fixed-point assumption is needed.

== 4 Stable unfolded probabilities <sec:stability>

We now compute the survival probabilities in the independent unfolding.
  Throughout this section, $G$ is any graph satisfying Proposition 3; every estimate is uniform over such graphs.
  Spencer’s branching model has survival probability $\( 1 + Q c \)^(- 1 \/ Q)$ #cite(label("Spencer1995"))
  Section 3, equation (9). With $Q = 2$ and $c = D t$, its scalar comparison function is

#[#set math.equation(numbering: n => "(4.1)")
 $ q \( t \) = \( 1 + 2 D t \)^(- 1 \/ 2) \, wide 0 lt.eq t lt.eq 1 . $ <eq:scalar-survival>]

It solves $q' \( t \) = - D q \( t \)^3$ with $q \( 0 \) = 1$.
  We will show that the probabilities $q_e \( t \)$ and $q_(e \, T) \( t \)$ from Section 3 are uniformly
  asymptotic to $q \( t \)$. The essential issue is stability:
  small discrepancies between edge types must remain small throughout the time interval.

=== 4.1 The exact equation and its linearization <the-exact-equation-and-its-linearization>

Use the increasing change of variables

$ s = 1 / 2 log \( 1 + 2 D t \) \, wide S = 1 / 2 log \( 1 + 2 D \) \, wide t \( s \) = frac(e^(2 s) - 1, 2 D) . $

Thus $0 lt.eq s lt.eq S$, $q \( t \( s \) \) = e^(- s)$, and $S lt.eq log n$ for all sufficiently large $n$.
  Since $0 lt.eq I_(e \, T) \( t \) lt.eq t$, the product identities in Proposition 7 give $q_e \( t \) >
  0$ for $t < 1$. On any interval on which all product factors remain positive,
  define the vector $z \( s \) in bb(R)^(cal(E))$ by

$ z_e \( s \) = log frac(q_e \( t \( s \) \), q \( t \( s \) \)) . $

In particular, $z \( 0 \) = 0$. Positivity at $t = 1$ will follow from the estimates below.

Let $A$ be the real symmetric matrix indexed by $cal(E)$, with $A_(e f) =
  1$ if $e eq.not f$ belong to a common triangle of $G$, and $A_(e f) = 0$ otherwise.
  Each row indexed by $e$ has sum $2 d_e$. Linearity of the triangle hypergraph ensures that each pair of distinct
  edges contributes at most once to $A$.

Differentiating the products is legitimate by Proposition 7. For $T = { e \, f \, g }$ we have

$ I'_(e \, T) \( t \) = q_(f \, T) \( t \) q_(g \, T) \( t \) \, wide q_(f \, T) \( t \) =
  frac(q_f \( t \), 1 - I_(f \, T) \( t \)) \, wide frac(d t, d s) = frac(1, D q \( t \)^2) . $

Here and below a prime on $I$ denotes differentiation in $t$, and a prime on $z$ denotes differentiation in $s$.
  Taking the logarithmic derivative of $q_e$ consequently gives the exact identity

#[#set math.equation(numbering: n => "(4.2)")
 $ z'_e \( s \) = 1 - 1 / D sum_(T in cal(T)\
T = { e \, f \,
  g })
  frac(exp \( z_f \( s \) + z_g \( s \) \), \( 1 - I_(e \, T) \( t \) \) \( 1 - I_(f \, T) \( t \) \) \( 1 -
  I_(g \, T) \( t \) \)) \, wide t = t \( s \) . $ <eq:exact-z>]

The factor indexed by $e$ comes from differentiating its product;
  the other two factors come from the two omitted-parent probabilities.

For vectors, $lr(bar.v.double dot.op bar.v.double)_oo$ denotes the maximum norm and
  $lr(bar.v.double dot.op bar.v.double)_2$ the Euclidean norm.
  For matrices we use the corresponding induced operator norms. Fix

#[#set math.equation(numbering: n => "(4.3)")
 $ 0 < a < min { c \, 2 epsilon.alt } \, wide delta_n = n^(- a) . $ <eq:bootstrap-exponent>]

Suppose, provisionally, that on an interval starting at zero,

#[#set math.equation(numbering: n => "(4.4)")
 $ lr(bar.v.double z \( s \) bar.v.double)_oo lt.eq delta_n \, wide I_(e \, T) \( t \( s \) \) lt.eq 1 /
   2 quad \( e in T in cal(T) \) . $ <eq:bootstrap-assumptions>]

The omitted-parent identity then implies $q_(e \, T) \( t \) lt.eq 2 e^(delta_n) q \( t \)$.
  Integrating yields, on the same interval,

#[#set math.equation(numbering: n => "(4.5)")
 $ I_(e \, T) \( t \) lt.eq 4 e^(2 delta_n) integral_0^t frac(d v, 1 + 2 D v) =
   frac(2 e^(2 delta_n), D) log \( 1 + 2 D t \) = O #h(-0.16667em) (frac(log n, D)) . $ <eq:I-bootstrap>]

In particular, all three denominator factors in (4.2) are $1 + O \( log n \/ D \)$.
  Expanding the exponential and reciprocal factors gives, uniformly for each summand,

$ frac(e^(z_f + z_g), \( 1 - I_(e \, T) \) \( 1 - I_(f \, T) \) \( 1 - I_(g \, T) \)) = 1 + z_f + z_g +
  O #h(-0.16667em) (delta_n^2 + frac(log n, D)) . $

The sum of the linear terms is exactly $\( A z \)_e$. Since $d_e \/ D = 1 + O \( n^(- c) \)$,
  we obtain the conditional estimate

#[#set math.equation(numbering: n => "(4.6)")
 $ ∥z' \( s \) + \( A \/ D \) z \( s \)∥_oo lt.eq C (n^(- 2 a) + n^(- c) + frac(log n, D)) . $ <eq:linearized-error>]

The constant $C$ is independent of the graph and the provisional interval.
  The general bound $lr(bar.v.double e^(- s A \/ D) bar.v.double)_oo lt.eq
  e^(s lr(bar.v.double A \/ D bar.v.double)_oo)$ gives a loss of order $D$ at $s = S$,
  too large to guarantee control of the prefix error $n^(- c)$.
  We will instead prove a polylogarithmic bound, sufficient to turn (4.6) into a strict improvement of (4.4).

=== 4.2 From link spectra to a uniform semigroup bound <from-link-spectra-to-a-uniform-semigroup-bound>

The passage from even closed-walk counts to spectral control follows the sparse quasirandom trace method;
  compare Chung and Graham #cite(label("ChungGraham2002")) Theorem 1 and Facts 7–8.
  We prove the quantitative form required by the link hypotheses and then transfer it to the maximum norm on the
  full edge space.

#thm([Proposition 4.1.])[
  #emph[There are fixed constants $C_1 \, J < oo$ such that every graph $G$ satisfying the degree,
    codegree and link-cycle conditions of Proposition 3 obeys
#[#set math.equation(numbering: n => "(4.7)")
 $ sup_(0 lt.eq s lt.eq log n) ∥e^(- s A \/ D)∥_oo lt.eq C_1 \( 1 + log n \)^J $ <eq:semigroup>]

 for all sufficiently large $n$.]
] <prop:semigroup>

#proof[
  We first approximate the adjacency matrix on each star by an averaging operator.
    We then combine these averages and estimate the effect of the error. All constants in the proof are uniform in $G$.
  ===== 4.2.1 Closed walks in a link. <closed-walks-in-a-link.>
  For $u in \[ n \]$, let $cal(E)_u = { u v : v in N_G \( u \) }$ and $N_u = \| cal(E)_u \|$.
    Identify $u v in cal(E)_u$ with $v in N_G \( u \)$, and let $M_u$ be the adjacency matrix of the link
    $G \[ N_G \( u \) \]$ on this index set. We have $N_u = \( 1 plus.minus n^(- c) \) n p$,
    and every row sum of $M_u$ is $\( 1 plus.minus n^(- c) \) D$, by the codegree assumption. Put $r = r_0 = 8000$.
  The trace $"tr" \( M_u^r \)$ counts closed walks of length $r$ with a specified starting position.
    Walks whose $r$ positions are distinct are precisely embeddings of the labeled cycle $C_r$;
    their number is $\( 1 plus.minus n^(- c) \) D^r$. For all other walks,
    classify the patterns of identifications among the $r$ positions.
    There are only finitely many patterns, since $r$ is fixed.
    The support of any realized pattern is a connected simple graph; patterns forcing a loop have no realizations.
  If the support is a tree, every support edge is traversed at least twice:
    a walk crossing the cut obtained by deleting that edge must cross back.
    Thus the support has at most $r \/ 2$ edges. Choose the image of one vertex and then expose the other vertices
    along this tree. The link has maximum degree at most $2 D$,
    so this gives at most $O \( n p \) \( 2 D \)^(r \/ 2)$ realizations of each pattern.
  If the support contains a cycle, let it have $j < r$ vertices and choose one of its simple cycles,
    of length $b gt.eq 3$. The link-cycle condition gives $O \( D^b \)$ choices for this labeled cycle.
    A forest rooted at its vertices attaches all the other vertices of the connected support,
    using at most $\( 2 D \)^(j - b)$ choices. Ignoring its remaining edges only increases the count.
    The resulting bound is $O \( D^j \)$, and hence $O \( D^(r - 1) \)$ for each such pattern.
    These cases exhaust the non-injective walks. Dividing their total contribution by $D^r$ shows that
  #[#set math.equation(numbering: n => "(4.8)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] \( M_u \/ D \)^r #scale(x: 120%, y: 120%)[\)] & = 1 +
     O #h(-0.16667em) (n^(- c) + D^(- 1) + n p D^(- r \/ 2))\
 & = 1 + O \( n^(- c_(*)) \) \, wide c_(*) := min { c \, 1 \/ 1000 } . $ <eq:link-trace>]
  Indeed, $D tilde.op n^(1 \/ 1000)$ and $n p D^(- 4000) tilde.op n^(- 6999 \/ 2000)$.
  ===== 4.2.2 The leading eigendirection. <the-leading-eigendirection.>
  Write $B_u = M_u \/ D$, and order its real eigenvalues as $lambda_1 gt.eq lambda_2 gt.eq dots.h.c$.
    The row-sum bound gives $lambda_1 lt.eq 1 + n^(- c)$; the Rayleigh quotient of the normalized all-ones vector
    gives $lambda_1 gt.eq 1 - n^(- c)$. Because $r$ is even,
  $ 0 lt.eq sum_(j gt.eq 2) lambda_j^r = "tr" \( B_u^r \) - lambda_1^r = O \( n^(- c_(*)) \) . $
  Consequently, with the fixed positive constant $gamma = c_(*) \/ r$,
    all eigenvalues other than $lambda_1$ have absolute value $O \( n^(- gamma) \)$.
    In particular, $lambda_1$ is simple for large $n$.
  Let $upright(bold(j))_u = N_u^(- 1 \/ 2) upright(bold(1))$ and let $v_u$ be a unit eigenvector for $lambda_1$.
    The row sums also give $lr(bar.v.double \( B_u - upright("Id") \) upright(bold(j))_u bar.v.double)_2 lt.eq
    n^(- c)$. Write $upright(bold(j))_u = alpha v_u + w$, where $w perp v_u$.
    Every eigenvalue of $B_u - upright("Id")$ on $v_u^perp$ has absolute value at least $1 \/ 2$ for large $n$,
    so $lr(bar.v.double w bar.v.double)_2 lt.eq 2 n^(- c)$. The orthogonal projectors onto the lines spanned by
    $v_u$ and $upright(bold(j))_u$ therefore differ in operator norm by at most $2 n^(- c)$.
    Combining this with the eigenvalue estimates gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ ∥M_u / D - frac(upright(bold(1)) upright(bold(1))^(sans(T)), N_u)∥_2 =
     O \( n^(- gamma) \) . $ <eq:star-approximation>]
  ===== 4.2.3 Summing the star averages. <summing-the-star-averages.>
  Extend every star matrix by zero to the full edge space $bb(R)^(cal(E))$,
    and let $P$ be the sum of the averaging matrices $upright(bold(1)) upright(bold(1))^(sans(T)) \/
    N_u$ on the stars. Distinct edges lying in a common triangle have a unique common endpoint,
    so $A$ is the sum of the extended matrices $M_u$. Define
  $ R = A \/ D - P . $
  The matrix $P$ is symmetric and positive semidefinite. For every $x in bb(R)^(cal(E))$, estimate (4.9) gives
  $ \| x^(sans(T)) R x \| lt.eq C n^(- gamma) sum_(u in \[ n \])
    lr(bar.v.double x \|_(cal(E)_u) bar.v.double)_2^2 = 2 C n^(- gamma) lr(bar.v.double x bar.v.double)_2^2 . $
  Each edge lies in exactly two stars, which explains the last equality and prevents a loss proportional to the
    number of vertices. Since $R$ is symmetric, it follows that $lr(bar.v.double R bar.v.double)_2 =
    O \( n^(- gamma) \)$. Every row of $P$ has sum two, while a row of $A \/ D$ has sum $2 d_e \/ D$.
    Both matrices are entrywise nonnegative, so their absolute row sums also give
  #[#set math.equation(numbering: n => "(4.10)")
   $ lr(bar.v.double R bar.v.double)_2 = O \( n^(- gamma) \) \, wide lr(bar.v.double R bar.v.double)_oo =
     O \( 1 \) . $ <eq:R-norms>]
  We have thus obtained a small Euclidean error, whereas the evolution in (4.6) requires the maximum norm.
    The special form of $P$ supplies this stronger control. Define
  $ U : bb(R)^(\[ n \]) & arrow.r bb(R)^(cal(E)) \, & \( U y \)_(u v) & = y_u + y_v \,\
V : bb(R)^(cal(E)) & arrow.r bb(R)^(\[ n \]) \, & \( V x \)_u & = 1 / N_u sum_(e in cal(E)_u) x_e . $
  Then $P = U V$, $lr(bar.v.double U bar.v.double)_oo = 2$, and $lr(bar.v.double V bar.v.double)_oo = 1$.
    If $W$ is the neighbor random-walk matrix, defined by $\( W y \)_u = N_u^(- 1) sum_(v in N_G \( u \)) y_v$,
    then $V U = upright("Id") + W$ and $lr(bar.v.double W bar.v.double)_oo = 1$.
    The identity $\( U V \)^j = U \( V U \)^(j - 1) V$ for $j gt.eq 1$, applied to the exponential power series, yields
  $ E_0 \( s \) := e^(- s P) = upright("Id") - U integral_0^s e^(- v \( upright("Id") + W \)) thin d v thin V . $
  The exponential inside the integral satisfies $lr(bar.v.double e^(- v \( upright("Id") + W \)) bar.v.double)_oo
    lt.eq e^(- v) e^(v lr(bar.v.double W bar.v.double)_oo) = 1$. Hence, for every $s gt.eq 0$,
  #[#set math.equation(numbering: n => "(4.11)")
   $ lr(bar.v.double E_0 \( s \) bar.v.double)_oo lt.eq 1 + 2 s \, wide
     lr(bar.v.double E_0 \( s \) bar.v.double)_2 lt.eq 1 . $ <eq:average-semigroup>]
  The second inequality follows from the positive semidefiniteness of $P$.
    Likewise, $A \/ D = P + R$ is symmetric with smallest eigenvalue at least $- lr(bar.v.double R bar.v.double)_2$, so
  #[#set math.equation(numbering: n => "(4.12)")
   $ E \( s \) := e^(- s A \/ D) \, wide lr(bar.v.double E \( s \) bar.v.double)_2 lt.eq
     e^(s lr(bar.v.double R bar.v.double)_2) . $ <eq:full-semigroup-l2>]
  ===== 4.2.4 A finite perturbation expansion. <a-finite-perturbation-expansion.>
  It remains to transfer the maximum-norm estimate from $E_0$ to $E$.
    We use a finite form of the bounded-perturbation expansion for semigroups #cite(label("EngelNagel2000"))
    Theorem III.1.10, estimating its initial terms and remainder in different norms.
    Choose a fixed integer $K$ with $K gamma > 2$. Iterating the variation-of-constants identity
  $ E \( s \) = E_0 \( s \) - integral_0^s E_0 \( s - v \) R E \( v \) thin d v $
  gives terms with $j = 0 \, dots.h \, K - 1$ copies of $R$, followed by a remainder with $K$ copies.
    The term with $j$ copies is integrated over an ordered simplex of volume $s^j \/ j !$ and contains $j +
    1$ factors $E_0$, all at nonnegative times at most $s$. By (4.11), its maximum norm is at most
  $ \( 1 + 2 s \)^(j + 1) lr(bar.v.double R bar.v.double)_oo^j frac(s^j, j !) . $
  The remainder has the exact form
  $ cal(R)_K \( s \) = \( - 1 \)^K integral_(0 lt.eq t_K lt.eq dots.h.c lt.eq t_1 lt.eq s) & E_0 \( s - t_1 \) R
    E_0 \( t_1 - t_2 \) R dots.h.c\
 & #h(18mm)  dots.h.c E_0 \( t_(K - 1) - t_K \) R E \( t_K \) thin d t_K dots.h.c d t_1 . $
  Its Euclidean norm is at most
  $ lr(bar.v.double cal(R)_K \( s \) bar.v.double)_2 lt.eq lr(bar.v.double R bar.v.double)_2^K
    e^(s lr(bar.v.double R bar.v.double)_2) frac(s^K, K !) . $
  For an $m times m$ matrix $H$, Cauchy–Schwarz gives $lr(bar.v.double H bar.v.double)_oo lt.eq
    sqrt(m) thin lr(bar.v.double H bar.v.double)_2$. Here $m = \| cal(E) \| lt.eq n^2 \/ 2$, so,
    uniformly for $s lt.eq log n$,
  $ lr(bar.v.double cal(R)_K \( s \) bar.v.double)_oo lt.eq
    n \( C n^(- gamma) \)^K e^(C n^(- gamma) log n) frac(\( log n \)^K, K !) = o \( 1 \) . $
  The other $K$ terms have maximum norm bounded by a fixed power of $1 + log n$, by (4.10). This proves (4.7).
    The order $K$ may be large, but is fixed independently of $n$ and $G$. ◻
]

=== 4.3 Closing the probability estimate <closing-the-probability-estimate>

The semigroup bound now controls the cumulative error in (4.6).
  This is the only use of the spectral calculation in the probability argument.

#thm([Proposition 4.2.])[
  #emph[For every graph $G$ satisfying Proposition 3, the independent-unfolding probabilities obey
#[#set math.equation(numbering: n => "(4.13)")
 $ q_e \( t \) = \( 1 + o \( 1 \) \) q \( t \) \, wide q_(e \, T) \( t \) = \( 1 + o \( 1 \) \) q \( t \) \, wide
   I_(e \, T) \( t \) = O #h(-0.16667em) (frac(log n, D)) . $ <eq:unfolding-asymptotics>]

 The estimates hold uniformly over $G$, $0 lt.eq t lt.eq 1$, and every incident pair $e in T in cal(T)$;
   the first estimate also holds for every $e in cal(E)$.]
] <prop:unfolding>

#proof[
  Use $a$ and $delta_n$ from (4.3). All $I_(e \, T)$ vanish and all probabilities equal one at zero,
    so by continuity the conditions (4.4) hold on some interval starting at zero.
    On every such interval, (4.5) improves the second condition to $I_(e \, T) lt.eq 1 \/ 4$ for large $n$.
  Write $h \( s \) = z' \( s \) + \( A \/ D \) z \( s \)$. As $z \( 0 \) = 0$,
    variation of constants and Proposition 8 give, on the same interval,
  $ lr(bar.v.double z \( s \) bar.v.double)_oo & lt.eq integral_0^s
    lr(bar.v.double e^(- \( s - v \) A \/ D) bar.v.double)_oo lr(bar.v.double h \( v \) bar.v.double)_oo thin d v\
 & lt.eq C \( 1 + log n \)^(J + 1) (n^(- 2 a) + n^(- c) + frac(log n, D)) = o \( n^(- a) \) . $
  The last equality follows from $a > 0$, $c - a > 0$ and $2 epsilon.alt - a > 0$,
    together with $D tilde.op n^(2 epsilon.alt)$: every fixed power of $log
    n$ is dominated by each of these positive powers of $n$. In particular,
    for large $n$ this improves the first condition to $lr(bar.v.double z bar.v.double)_oo lt.eq delta_n \/ 2$.
    The spectral exponent $gamma$ only fixes the integer $K$ in the semigroup estimate.
  If either bootstrap condition had a first exit before $s = S$,
    these strict improvements would hold up to that exit. All product factors would then remain at least $3 \/ 4$,
    so the finitely many functions and their logarithms would be continuous on a neighborhood of the exit.
    Both conditions would persist beyond it, a contradiction.
    Thus the bounds hold for $s < S$, and continuity gives them also at $s = S$;
    the endpoint factors remain positive. This proves $z_e \( s \) =
    o \( n^(- a) \)$ throughout $\[ 0 \, S \]$ and the asserted bound on $I_(e \, T)$. Finally,
  $ frac(q_e \( t \), q \( t \)) = e^(z_e \( s \)) \, wide frac(q_(e \, T) \( t \), q \( t \)) =
    frac(e^(z_e \( s \)), 1 - I_(e \, T) \( t \)) \, $
  which establishes both probability estimates. ◻
]

One consequence records the precision needed for the later exploration of selected paths.
  Set $J_n = max_(e in T in cal(T) \, thin 0 lt.eq t lt.eq 1) I_(e \, T) \( t \)$.
  At a paired call with focus ${ f \, g } subset T$ and omitted parent $T$,
  the product of all no-success factors is $q_(f \, T) \( t \) q_(g \, T) \( t \)$.
  Deleting at most two factors from this product increases it by at most $\( 1 - J_n \)^(- 2)$.
  Hence, uniformly in the call and threshold, for large $n$ the resulting product is at most

#[#set math.equation(numbering: n => "(4.14)")
 $ frac(q_(f \, T) \( t \) q_(g \, T) \( t \), \( 1 - J_n \)^2) lt.eq 2 q \( t \)^2 =
   frac(2, 1 + 2 D t) . $ <eq:off-pattern-bound>]

This remains a statement about the independent unfolding. We next compare its queries with the finite priority process.

== 5 Coupling the finite and independent tests <sec:coupling>

Fix a graph $G$ satisfying Proposition 3. The independent probabilities from Proposition 9 approximate survival
  only if repeated uses of a finite triangle priority are sufficiently rare.
  We first give an exact coupling and then reduce its failure to a graph configuration supported on two visited
  call paths. Throughout this section, a #emph[triangle type] means a member of $cal(T)$,
  as distinguished from its possibly many occurrences in an unfolding.

Fix $k in { 1 \, 2 }$. Sample $k$ independent uniform oriented edges of $G$,
  with replacement and independently of all priorities. There are $2 m$ possible oriented edges.
  The orientation names the two endpoints and does not affect the test. With these roots, compare two experiments:
  the finite tests sharing one priority for each triangle type,
  and the independent unfoldings with disjoint occurrence trees for different roots. Every root has threshold $1$.
  Execute the roots in a fixed order, including every root regardless of the preceding answers.

At each visited call, expose the priorities of #emph[all] candidates in a fixed type order before sorting them for
  the test. Thus an exposed list includes candidates above the threshold and candidates never traversed because an
  earlier child returned true. In the independent experiment,
  let $cal(C)_k$ be the event that a triangle type appears at least twice among all these exposed lists.
  There is no repetition within one list: a candidate meeting both edges of a pair focus would be its omitted
  parent triangle.

#thm([Lemma 5.1.])[
  (Coupling by exposed triangle types).  #emph[Let $X^(upright("fin")) \, X^(upright("ind")) in { 0 \,
    1 }^k$ be the vectors of root answers in the two experiments, where $1$ denotes true.
    For every $H subset.eq { 0 \, 1 }^k$,
$ \| bb(P) \( X^(upright("fin")) in H \) - bb(P) \( X^(upright("ind")) in H \) #scale(x: 120%, y: 120%)[\|] lt.eq
  bb(P)_(upright("ind")) \( cal(C)_k \) . $

]
] <lem:coupling>

#proof[
  Assign independent uniform priorities $U_T$, $T in cal(T)$, for the finite experiment,
    and an independent supply of fresh uniform variables. Run the unfolding tests as follows.
    At the first exposure of a type $T$, use $U_T$; at each later exposure of that type, use a fresh variable instead.
  This procedure has the independent-unfolding law. Indeed, the type queried next is determined by $G$,
    the root labels and the execution history. If $Q$ is the set of types exposed so far,
    that history depends only on $\( U_T : T in Q \)$ and on the fresh variables already used.
    Every recursive computation contributing to a returned answer is part of this history,
    with its candidate lists exposed explicitly. Conditional on the history,
    the variables $\( U_T : T in.not Q \)$ are still independent uniforms.
    A fresh variable used for a repeated type is independent of the same history.
    Induction over exposures therefore gives independent uniform occurrence priorities.
    The unused occurrence variables may be filled in independently afterward.
  The evaluations terminate almost surely by Section 3. Until a repeated type is exposed,
    the unfolding and finite executions use the same priority at every candidate.
    They consequently have the same sorted lists, recursive calls, thresholds, answers and stopping decisions.
    On $cal(C)_k^c$ this agreement holds for the whole execution of all roots.
    The stated inequality follows from this coupling of the answer vectors. ◻
]

=== 5.1 The graph of visited calls <the-graph-of-visited-calls>

We now work entirely in the independent experiment. Its visited calls form a finite rooted forest almost surely.
  Construct a graph $Gamma$ and a label map $lambda : V \( Gamma \) arrow.r V \( G \)$ from this forest.
  Each root contributes two new #emph[formal] vertices $x \, y$, the edge $x y$,
  and labels given by its sampled ordered endpoints. Distinct roots have disjoint formal vertices even if their
  labels coincide. If a visited child is attached through a formal focus edge $x y$ of its parent,
  introduce a new formal vertex $z$, label it by the third vertex of the child’s triangle type,
  and add the edges $x z \, y z$. These two new edges are the child’s focus.
  If $x y$ is ordered, order them as $\( x \, z \) \, \( y \, z \)$,
  so subsequent choices of focus edge have fixed names.

The #emph[birth call] of a formal vertex or edge is the call that introduced it.
  Order the construction with all roots first and every parent before its children.
  The following properties hold in any such order:

+ Every formal edge has adjacent labels in $G$, and the three vertices in any one gluing have distinct labels.
+ Every formal edge is focused at exactly one call, its birth call. An attachment edge is not in the child’s focus.
+ No step adds an edge between two vertices already present.
+ The only triangles of $Gamma$ are the triangles introduced by the gluings.

For the last property, consider the latest vertex of a formal triangle.
  The initial disjoint root edges contain no triangle. A non-root vertex has exactly two older neighbours,
  namely the endpoints of its attachment edge, so the triangle must be its gluing triangle.

Figure 1 shows the distinction between a visited call and an exposed candidate.
  The formal graph records the former, but an extra adjacency between its labels can account for repetitions among
  the latter.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.6), [#text(size: 9pt)[Visited call path]])
  content((0, 0), [#box(inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[focus $\{"ab"\}$]]])])
  content((0, -1.25), [#box(inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[focus $\{"ac","bc"\}$]]])])
  content((0, -2.5), [#box(inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[focus $\{"ad","cd"\}$]]])])
  line((0, -0.3351), (0, -0.9149), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  content((0, -0.625), [#text(size: 9pt)[$"abc"$]], anchor: "east", padding: 0.1176cm)
  line((0, -1.585), (0, -2.165), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  content((0, -1.875), [#text(size: 9pt)[$"acd"$]], anchor: "east", padding: 0.1176cm)
  content((1.5, 0), [#text(size: 9pt)[$"abd"$ exposed#linebreak()through $"ab"$]], anchor: "west", padding: 0.1176cm)
  content((1.5, -2.5), [#text(size: 9pt)[$"abd"$ exposed#linebreak()through $"ad"$]], anchor: "west", padding: 0.1176cm)
  content((6.5, 0.6), [#text(size: 9pt)[Formal graph]])
  line((5.15, -1.25), (6.5, 0), (7.85, -1.25), close: true, fill: rgb("#f7f7f7"), stroke: none)
  line((5.15, -1.25), (7.85, -1.25), (6.5, -2.5), close: true, fill: rgb("#eff2f4"), stroke: none)
  line((5.15, -1.25), (6.5, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.5, 0), (7.85, -1.25), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((7.85, -1.25), (5.15, -1.25), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((5.15, -1.25), (6.5, -2.5), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.5, -2.5), (7.85, -1.25), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.5, 0), (6.5, -2.5), stroke: (paint: rgb("#194164"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((5.15, -1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5.115, -1.25), [$a$], anchor: "east")
  circle((6.5, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6.5, 0.03528), [$b$], anchor: "south")
  circle((7.85, -1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((7.885, -1.25), [$c$], anchor: "west")
  circle((6.5, -2.5), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6.5, -2.535), [$d$], anchor: "north")
})],
  caption: [Figure 1: A portion of the visited construction, with distinct labels written as the formal vertex names. The left arrows are parent–child steps: traversing $a b c$ introduces $c$, and traversing $a c d$ introduces $d$. The solid edges on the right are the corresponding edges of $Gamma$. The dashed segment $b d$ denotes an edge between labels in $G$ that is absent from $Gamma$. The type $a b d$ is exposed at the root through $a b$ and at the last displayed call through $a d$. The collision is therefore detected from these two candidate lists, regardless of whether either occurrence is traversed. Other calls are not shown. ],
) <fig:call-graph>

For a formal vertex $a$, its #emph[ancestral call path] is the path from a root to the birth call of $a$,
  including both ends. Given two formal vertices $a \, b$, let $Gamma_(a \, b)$ be the graph constructed from the
  union of their ancestral call paths, using the root edges and gluings on those paths. All its calls are visited.
  We call $\( a \, b \)$ an #emph[extra-edge witness] if $a \, b$ are distinct and nonadjacent in $Gamma$,
  their labels are adjacent in $G$, and $lambda$ is injective on $V \( Gamma_(a \, b) \)$.

#thm([Lemma 5.2.])[
  (A geometric witness for a collision).  #emph[If the initial root labels are all distinct,
    then every occurrence of $cal(C)_k$ produces an extra-edge witness.
    Moreover, uniformly over the graphs under consideration,
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(P)_(upright("ind")) \( cal(C)_k \) lt.eq O \( n^(- 1) \) +
   bb(P)_(upright("ind")) \( upright("an extra-edge witness exists") \) . $ <eq:collision-witness>]

 The $O \( n^(- 1) \)$ term may be omitted when $k = 1$.]
] <lem:witness>

#proof[
  First suppose that $lambda$ is injective on all of $Gamma$.
    If an edge of $G$ between two labels is absent from the formal graph,
    its two formal endpoints give the required witness. It remains to show that a collision is impossible when
    there is no such extra edge.
  Suppose that a triangle type $T$ is exposed at two calls.
    It cannot occur twice in one list, so the exposing calls are distinct.
    Their responsible focus edges are distinct by property (ii), and their images are distinct by injectivity.
    Those two edges already represent all three vertices of $T$,
    even if neither candidate occurrence is traversed. Since there are no extra edges between labels,
    the three formal vertices form a triangle of $Gamma$. By property (iv), it is a gluing triangle.
    Its two new edges are focused only at that gluing’s child call, which omits the triangle as its parent.
    Its attachment edge is focused at only one call. Hence the triangle can appear in at most one candidate list,
    a contradiction.
  Next suppose that the labels are not injective. Choose the first repetition in a construction order with roots
    first and parents before children. The distinct-root assumption means that this repetition occurs when a new
    vertex $z$ is attached through an edge $x y$. Write $w$ for the earlier vertex with $lambda \( w \) =
    lambda \( z \)$. All earlier labels are distinct. Property (i) shows that $x \, y \,
    w$ are distinct and that $lambda \( x \) lambda \( w \)$ and $lambda \( y \) lambda \( w \)$ are edges of $G$.
  If either $x w$ or $y w$ is absent formally, it gives an extra edge among the earlier vertices.
    The ancestral paths of its endpoints are entirely earlier in the construction, so their labels are injective.
    Property (iii) ensures that the pair remains nonadjacent in the completed graph. This is the desired witness.
  Otherwise $x y w$ is a formal triangle and hence an earlier gluing triangle.
    There are two possibilities for its latest vertex. If it is $x$ or $y$, then $x y$ was born at this gluing.
    The current call focusing $x y$ is exactly its birth call, and omits the triangle $x y w$ as its parent.
    It therefore cannot have the proposed child with the same triangle type.
    If the latest vertex is $w$, then $w$ was attached through $x y$.
    The children introducing $w$ and $z$ would belong to the same unique call focusing $x y$,
    and would have the same triangle type. That call contains this candidate only once and traverses it at most
    once, again a contradiction. Thus a first repeated label always produces an earlier extra edge.
  Finally, either endpoint of a uniform oriented root has distribution
  $ pi \( v \) = frac(deg_G \( v \), 2 m) \, wide max_v pi \( v \) = O \( n^(- 1) \) \, $
  by the degree estimate and $2 m = n^2 p$. For two independent roots,
    any fixed pair of their endpoints coincides with probability $sum_v pi \( v \)^2 lt.eq max_v pi \( v \)$.
    There are four pairs to consider; the two endpoints within each root are distinct.
    A union bound therefore gives the term $O \( n^(- 1) \)$ in (5.1). ◻
]

The root experiment still samples with replacement; we have only charged its overlaps to the error bound.
  The remaining task is to bound the probability of a visited,
  injectively labelled pair of call paths whose two marked vertices have an extra edge.
  This uses both the template estimates for $G$ and the independent-test probabilities.

== 6 Counting and visiting collision witnesses <sec:witnesses>

We now bound the probability of the marked path unions furnished by Lemma 11.
  The required precision is $o \( D^(- 1) \)$: the probability that two independent root queries both return true
  is asymptotic to $q \( 1 \)^2 tilde.op \( 2 D \)^(- 1)$. A collision estimate that merely tends to zero would
  not control that second moment.

Throughout this section, $G$ is any graph satisfying Proposition 3,
  and all constants and error estimates are uniform over such $G$. We work in the independent unfolding.
  The proof has two parts. First, the extra edge between the marked vertices makes their path union rare as a
  graph embedding. Second, reaching a long prescribed path requires many earlier candidate queries to fail.
  We retain the order of the selected priorities when combining these two bounds.

=== 6.1 Patterns and their embeddings <patterns-and-their-embeddings>

The paths in this section are paths in the #emph[call forest], not paths in the formal graph $Gamma$.
  Consider the union of the ancestral paths to the birth calls of two marked formal vertices $a \, b$.
  When the paths belong to the same rooted tree, let $h$ be their common trunk length and let $ell_1 \,
  ell_2$ be the two lengths after the trunk. Length counts non-root calls.
  When the paths belong to distinct trees, set $h = 0$ and let $ell_1 \, ell_2$ be their individual lengths.
  In both cases put

$ ell = h + ell_1 + ell_2 \, wide r = upright("the number of roots used") in { 1 \, 2 } . $

Zero lengths are allowed. A mark born at a root specifies one of its two formal endpoints.

A #emph[pattern] records these rooted paths, their marks, and the choice of focus edge at each child step.
  The named focus edges from Section 5 give at most two choices at a step.
  The choices of roots, the order of the two marked paths, and any marked root endpoints contribute only an
  absolute constant. Consequently, for each triple $\( h \, ell_1 \, ell_2 \)$ there are at most

#[#set math.equation(numbering: n => "(6.1)")
 $ C thin 2^ell $ <eq:pattern-count>]

patterns, for an absolute constant $C$. At a fork the two children each choose a focus edge;
  their third vertices will be determined by an embedding. Thus there is no further length-dependent multiplicity.
  Patterns that cannot occur under the query rule may be discarded.

The formal graph $J$ of a pattern starts with $r$ disjoint root edges and adds two edges and one vertex at each
  non-root call. In particular,

$ v \( J \) = 2 r + ell \, wide e \( J \) = r + 2 ell . $

We consider only patterns whose marks $a \, b$ are distinct and nonadjacent in $J$, and write $J^(+) = J + a b$.
  An embedding below is an injective map of the formal vertices into $V \( G \)$ that maps every edge of $J^(+)$
  to an edge of $G$ and respects the named endpoints of each root.

#thm([Lemma 6.1.])[
  (Embedding an extra edge).  #emph[For every such pattern with $r in { 1 \, 2 }$ roots and $ell$ non-root calls,
    the number of embeddings of $J^(+)$ into $G$ is at most
#[#set math.equation(numbering: n => "(6.2)")
 $ \( 2 m \)^r \( 2 D \)^ell D^(- B) $ <eq:embedding-bound>]

 for all sufficiently large $n$, uniformly over the pattern and $G$.]
] <lem:embeddings>

#proof[
  Write $kappa_n = \( 1 + log n \)^(C_0)$ for the common factor in the two template bounds of Proposition 3.
    Recall that $L = 100$, $B = 50$, $p tilde.op n^(- 1 \/ 2 + epsilon.alt)$, and $D =
    n p^2 tilde.op n^(2 epsilon.alt)$, where $epsilon.alt = 1 \/ 2000$.
  ===== 6.1.1 Fewer than $L$ calls. <fewer-than-l-calls.>
  Suppose $ell < L$. Regard $J^(+)$ as a template with no distinguished vertices.
    Order all root vertices first, ordering the endpoints of each root edge,
    and then add the other vertices in any parent-first order of their birth calls.
    Before adding $a b$, each vertex has at most two neighbors preceding it.
    Moreover, the first vertex of any nonempty vertex subset has no preceding neighbor within that subset.
    An induced subgraph on $v > 0$ vertices therefore has at most $2 v - 2$ edges from $J$, and at most $2 v -
    1 lt.eq 2 v$ from $J^(+)$. Every subgraph satisfies the same weaker bound $e lt.eq 2 v$.
    Since $p < 1$ and $D > 1$ for large $n$, its scaling is at least
  $ n^v p^(2 v) = D^v gt.eq 1 . $
  The empty subgraph has scaling one. The first template bound gives
  $ \# { J^(+) arrow.r.hook G } lt.eq kappa_n n^(2 r + ell) p^(r + 2 ell + 1) = kappa_n \( 2 m \)^r D^ell p . $
  Here the template has at most $4 + \( L - 1 \) = 103 lt.eq H_0$ vertices. The inequality
  $ p D^B = n^(- 1 \/ 2 + \( 2 B + 1 \) epsilon.alt + o \( 1 \)) = n^(- 899 \/ 2000 + o \( 1 \)) $
  shows that $kappa_n p lt.eq D^(- B)$ for large $n$. This proves (6.2) in the short case.
  ===== 6.1.2 The last $L$ births. <the-last-l-births.>
  Suppose $ell gt.eq L$. Choose any parent-first ordering of the non-root calls, with all roots placed first,
    and let $Z$ be the set of the last $L$ vertices born. The labels of the preceding vertices can be assigned in
    at most
  #[#set math.equation(numbering: n => "(6.3)")
   $ \( 2 m \)^r \( 2 D \)^(ell - L) $ <eq:preceding-labels>]
  ways. Indeed, there are $2 m$ choices for each oriented root,
    and at most $2 D$ common neighbors of the two endpoints of each subsequent attachment edge.
    Discarding restrictions against repeated labels only increases this bound.
    We now fix an injective assignment of these preceding labels.
  The birth call of every vertex in $Z$ is an ancestor of the birth call of a marked vertex in $Z$.
    To see this, every call in the pattern lies on a path to a marked birth call.
    Once that path enters the final suffix, all its subsequent calls lie in the suffix, by the parent-first order.
    In particular, at least one endpoint of $a b$ belongs to $Z$.
    Figure 2 illustrates how such a suffix can meet both arms.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.2121, -0.2121), (0.2121, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[$0$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((0, 0.3353), [root], anchor: "south")
  content((-0.2121, -0.9121), (0.2121, -0.4879), [#set text(hyphenate: false); #align(center + horizon)[$1$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((-0.2121, -1.612), (0.2121, -1.188), [#set text(hyphenate: false); #align(center + horizon)[$2$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((-1.612, -2.312), (-1.188, -1.888), [#set text(hyphenate: false); #align(center + horizon)[$3$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((-1.612, -3.712), (-1.188, -3.288), [#set text(hyphenate: false); #align(center + horizon)[$5$]], frame: "circle", fill: rgb("#d6dde3"), stroke: (paint: rgb("#194164"), thickness: 0.4pt, miter-limit: 10))
  content((-1.4, -3.835), [$"birth" (a)$], anchor: "north")
  content((1.188, -2.312), (1.612, -1.888), [#set text(hyphenate: false); #align(center + horizon)[$4$]], frame: "circle", fill: rgb("#d6dde3"), stroke: (paint: rgb("#194164"), thickness: 0.4pt, miter-limit: 10))
  content((1.188, -3.012), (1.612, -2.588), [#set text(hyphenate: false); #align(center + horizon)[$6$]], frame: "circle", fill: rgb("#d6dde3"), stroke: (paint: rgb("#194164"), thickness: 0.4pt, miter-limit: 10))
  content((1.188, -3.712), (1.612, -3.288), [#set text(hyphenate: false); #align(center + horizon)[$7$]], frame: "circle", fill: rgb("#d6dde3"), stroke: (paint: rgb("#194164"), thickness: 0.4pt, miter-limit: 10))
  content((1.4, -3.835), [$"birth" (b)$], anchor: "north")
  line((0, -0.3071), (0, -0.3929), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((0, -1.007), (0, -1.093), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((-0.2746, -1.537), (-1.125, -1.963), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((-1.4, -2.407), (-1.4, -3.193), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((0.2746, -1.537), (1.125, -1.963), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((1.4, -2.407), (1.4, -2.493), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((1.4, -3.107), (1.4, -3.193), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((-0.85, -0.7), [$h=2$])
  content((-2.45, -2.65), [$ell_1=2$])
  content((2.45, -2.65), [$ell_2=3$])
})],
    caption: [Figure 2: A union of two ancestral call paths. Nodes are calls and lines are parent–child relations, not edges of $G$ or $Gamma$. Each non-root call introduces one formal vertex. The numbers give one parent-first ordering; the last four non-root calls are shaded. Such a final suffix can occupy both arms and need not be connected. This small example illustrates the final block used below, where the proof takes $L = 100$. ],
  ) <fig:call-paths>
  Form a template $\( H \, I \)$ as follows. Its free vertices are $Z$.
    Retain the two backward edges of each vertex of $Z$, meaning its edges to the endpoints of its attachment
    edge, and retain $a b$. The distinguished set $I$ consists of all preceding vertices needed as endpoints of
    these edges. Include no edges with both endpoints in $I$.
    We may discard such constraints because we seek an upper bound on extensions.
    Thus $I$ is independent in the template, whether or not its prescribed images have edges between them in $G$.
  The backward edges use at most $2 L$ boundary vertices, and the extra edge uses at most one further boundary
    vertex. Hence
  $ \| I \| lt.eq 2 L + 1 \, wide v \( H \) lt.eq 3 L + 1 lt.eq H_0 . $
  The $2 L$ backward edges are distinct, and $a b$ is not one of them. Every retained edge touches $Z$, so
  #[#set math.equation(numbering: n => "(6.4)")
   $ e \( H \) = 2 L + 1 \, wide S \( H \, I \) = n^L p^(2 L + 1) = D^L p =
     n^(- 799 \/ 2000 + o \( 1 \)) < 1 . $ <eq:terminal-scaling>]
  We verify every completion condition needed for the second template bound. If $U subset.neq Z$, then
  #[#set math.equation(numbering: n => "(6.5)")
   $ e #scale(x: 120%, y: 120%)[\(] H \[ I union U \] #scale(x: 120%, y: 120%)[\)] lt.eq
     2 \| U \| . $ <eq:proper-free-edges>]
  Indeed, assign each backward edge to its newer endpoint in $Z$.
    In $H \[ I union U \]$ there are at most two such edges per vertex of $U$.
    If (6.5) failed, the induced graph would retain $a b$ and both backward edges of every vertex of $U$.
    Retaining $a b$ puts every free mark in $U$. Retaining both backward edges of a vertex also forces the vertex
    born at its immediate parent call into $U$, whenever that vertex belongs to $Z$.
    Indeed, both focus edges at a non-root parent contain its newly born vertex,
    so the child’s attachment edge contains that vertex. Repeating this argument backward along each marked path
    includes every vertex of $Z$, by the ancestor property just proved. This would give $U = Z$, a contradiction.
  For a proper $U$, (6.5) implies
  $ S #scale(x: 120%, y: 120%)[\(] H \[ I union U \] \, I #scale(x: 120%, y: 120%)[\)] =
    n^(\| U \|) p^(e \( H \[ I union U \] \)) gt.eq D^(\| U \|) gt.eq 1 . $
  Every intermediate set of distinguished vertices has the form $J_0 = I union U$, with $U subset.eq Z$.
    Its completion scaling is
  $ n^(v \( H \) - \| J_0 \|) p^(e \( H \) - e \( H \[ J_0 \] \)) = frac(S \( H \, I \), S \( H \[ J_0 \] \, I \)) . $
  For proper $U$ the numerator is less than one by (6.4), while the denominator is at least one.
    For $U = Z$ the ratio equals one. All the required completion scalings are therefore at most one.
  The second template bound now gives at most $kappa_n$ extensions for the labels of $Z$.
    In applying it we may ignore avoidance of previously assigned vertices outside $I$,
    again only enlarging the count. Since $L - B = 50 > 0$ and $D tilde.op n^(1 \/ 1000)$,
  $ kappa_n lt.eq \( 2 D \)^L D^(- B) $
  for all sufficiently large $n$. Multiplying this by (6.3) proves (6.2). The threshold for $n$ is uniform:
    the template order and its polylogarithmic exponent are fixed independently of the path lengths. ◻
]

The embedding bound supplies a factor $D^(- B)$ even when the paths are arbitrarily long.
  It remains to sum over their lengths. Counting paths alone would lose this factor,
  since a call can have order $D$ children. The next estimate uses the failures required to reach a prescribed
  child, together with the decreasing order of priorities.

=== 6.2 The probability of visiting prescribed paths <the-probability-of-visiting-prescribed-paths>

Fix a pattern and an embedding of $J^(+)$ #emph[before] exposing any priorities.
  The probability that its $r$ used roots have the prescribed ordered labels is $\( 2 m \)^(- r)$.
  Conditional on this root event, each step of the pattern specifies one candidate occurrence in a fixed potential
  call tree: its focus edge and third vertex determine its triangle.
  If these specifications cannot define distinct required children under the query rule,
  their visitation probability is zero and they can be discarded.
  Otherwise, write $u_y$ for the priority of the selected child occurrence corresponding to each of the $ell$
  non-root calls $y$. These are distinct independent uniform coordinates of the unfolding.

Set

#[#set math.equation(numbering: n => "(6.6)")
 $ b \( t \) = q \( t \)^2 = frac(1, 1 + 2 D t) \, wide C_D = 1 + 2 D \, wide mu =
   integral_0^1 b \( t \) thin d t = frac(log \( 1 + 2 D \), 2 D) . $ <eq:visitation-weights>]

#thm([Lemma 6.2.])[
  (Visiting an embedded pattern).  #emph[Conditional on the prescribed ordered root labels,
    the probability that all calls in the embedded pattern are visited is at most
#[#set math.equation(numbering: n => "(6.7)")
 $ C_D^3 frac(\( 2 mu \)^ell, h ! thin ell_1 ! thin ell_2 !) . $ <eq:visitation-bound>]

 This includes zero-length segments, with the convention $0 ! = 1$.]
] <lem:visitation>

#proof[
  Condition only on the selected priority coordinates $\( u_y \)$, not on actual visitation, return values,
    or previously exposed lists. For all required calls to be visited,
    these priorities must decrease along every required path.
  Consider a required non-root call $x$ that has one or two required children.
    Its focus is a pair ${ f \, g }$, and its omitted parent triangle is $T$.
    Let $t_x$ be the largest priority of its required children.
    Define $O_x$ prospectively to be the event that every off-pattern candidate at $x$ with priority below $t_x$
    has a child query returning false, when that subtree is evaluated hypothetically.
    Reaching all the required children necessitates $O_x$. In particular,
  #[#set math.equation(numbering: n => "(6.8)")
   $ { upright("all required calls are visited") } subset.eq {
     upright("priorities decrease along the required paths") } ∩ ⋂_x O_x . $ <eq:necessary-offpattern>]
  If a required call has two required children, reaching the later child also requires the earlier selected child
    to return false. We discard this additional condition in (6.8).
  Each $O_x$ depends only on subtrees rooted at off-pattern children of $x$.
    These subtrees contain none of the selected priority coordinates and are disjoint for different required
    calls. In particular, when one required call is an ancestor of another,
    the path between them starts through a selected child, so it does not enter an off-pattern subtree.
    The events $O_x$ are therefore independent conditional on $\( u_y \)$.
    This assertion concerns the prospective independent unfolding.
  For an off-pattern candidate $S$ attached through focus edge $e$,
    the probability that it is not a successful child before $t_x$ is exactly $1 - I_(e \, S) \( t_x \)$.
    By the product identities of Proposition 7,
  #[#set math.equation(numbering: n => "(6.9)")
   $ bb(P) \( O_x divides \( u_y \) \) =
     frac(q_(f \, T) \( t_x \) q_(g \, T) \( t_x \), product_(S upright(" selected at ") x) \( 1 - I_(e \( S \) \,
     S) \( t_x \) \)) \, $ <eq:offpattern-product>]
  where $e \( S \)$ is the unique focus edge contained in $S$.
    The denominator removes the one or two selected candidate factors from the complete product.
    The product estimate (4.14) therefore gives, uniformly in the types and in $t_x in \[ 0 \, 1 \]$,
  #[#set math.equation(numbering: n => "(6.10)")
   $ bb(P) \( O_x divides \( u_y \) \) lt.eq 2 b \( t_x \) $ <eq:offpattern-bound>]
  for all sufficiently large $n$.
  We next distribute these factors among the selected child priorities.
    At a call with one required child of priority $u$, the bound is $2 b \( u \)$.
    At a call with two required children of priorities $u \, v$, we use
  $ frac(b \( max { u \, v } \), b \( u \) b \( v \)) = frac(1, b \( min { u \, v } \)) lt.eq C_D . $
  There is at most one such non-root fork. We ignore the off-pattern requirements at roots entirely.
    There are at most two required child steps leaving roots in total,
    and inserting their missing factors $b \( u \) gt.eq C_D^(- 1)$ costs at most $C_D^2$.
    The number of non-root calls with required children is at most $ell$.
    Combining independence, (6.8), and (6.10), we obtain the conditional bound
  #[#set math.equation(numbering: n => "(6.11)")
   $ C_D^3 2^ell product_y b \( u_y \) $ <eq:conditional-visitation>]
  when the priorities decrease along the required paths, and zero otherwise.
    Every selected priority now carries one factor $b$. This also covers root marks and empty arms,
    which introduce no new priority coordinates.
  The selected priorities have joint Lebesgue density one. In integrating (6.11),
    retain the order constraints within the trunk and within each arm,
    but discard constraints joining different segments. For a segment of length $j$,
    symmetry of the product integrand gives
  $ integral_(1 > u_1 > dots.h.c > u_j > 0) product_(i = 1)^j b \( u_i \) thin d u_1 dots.h.c d u_j =
    frac(mu^j, j !) . $
  The three segments use disjoint coordinates. Their contributions multiply, proving (6.7).
    Priority ties have probability zero. ◻
]

=== 6.3 Summing all witnesses <summing-all-witnesses>

#thm([Proposition 6.3.])[
  (Uniform collision bound).  #emph[Fix $k in { 1 \, 2 }$ and sample $k$ independent uniform oriented edges of
    $G$, with replacement. Execute the independent root queries at threshold $1$,
    executing every root regardless of earlier outputs. Let $cal(C)_k$ be the event that an actual triangle type
    is repeated among all exposed candidate lists, including candidates not traversed. Then
#[#set math.equation(numbering: n => "(6.12)")
 $ bb(P)_(upright("ind")) \( cal(C)_k \) = O \( D^(15 - B) + n^(- 1) \) = O \( D^(- 35) + n^(- 1) \) =
   o \( D^(- 1) \) . $ <eq:collision-bound>]

 The bound is uniform over the graphs in Proposition 3. Consequently, by Lemma 10,
   the probabilities that all root queries return true in the finite and independent experiments differ by at most
   the same bound.]
] <prop:collision>

#proof[
  Lemma 11 reduces a collision to initial root overlap, which has probability $O \( n^(- 1) \)$,
    or to an injectively labeled marked path union with an extra edge.
    For each fixed length triple, multiply the pattern count (6.1), the embedding bound (6.2),
    the root-matching probability $\( 2 m \)^(- r)$, and the visitation bound (6.7).
    The result is at most an absolute constant times
  $ D^(- B) C_D^3 frac(\( 8 D mu \)^(h + ell_1 + ell_2), h ! thin ell_1 ! thin ell_2 !) . $
  For two-tree patterns $h = 0$; allowing all triples of nonnegative integers only enlarges the sum.
    A union bound over patterns and embeddings therefore bounds the witness probability by
  $ O
    (D^(- B) C_D^3 sum_(h \, ell_1 \, ell_2 gt.eq 0) frac(\( 8 D mu \)^(h + ell_1 + ell_2), h ! thin ell_1 ! thin
    ell_2 !)) & = O (D^(- B) C_D^3 exp \( 24 D mu \))\
 & = O (D^(- B) C_D^15) = O \( D^(15 - B) \) . $
  All terms are nonnegative; the countable union bound applies to the almost surely finite evaluations established
    in Section 3. The identity $24 D mu = 12 log C_D$ accounts for the exponent $15$.
    Finally, $B = 50$ and $D tilde.op n^(1 \/ 1000)$ imply $D^(- 35) + n^(- 1) = o \( D^(- 1) \)$, proving (6.12). ◻
]

We have thus compared the finite continuation with independent root queries at an error smaller than their
  two-root success probability. The first and second terminal moments can now be read directly from these
  root-query probabilities.

== 7 Terminal moments and the sharp constant <sec:moments>

We finish by converting the query estimates into moments and then removing the conditioning on the prefix.
  Both steps use the uniformity of all preceding bounds.

Fix a good prefix, and choose $k in { 1 \, 2 }$ oriented root edges independently and uniformly with replacement
  from the $2 m$ oriented edges of $G$. The orientations specify the formal roots and do not affect the query
  outputs. In the finite-priority model, each query at threshold one tests survival of its root edge in the same
  terminal graph. Conditional on that graph, its surviving edge fraction is $F_n \/ m$,
  and the sampled roots are independent. Consequently

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(P) \( upright("all ") k upright(" finite root queries return true") divides upright("prefix") \) =
   bb(E) [(F_n / m)^k \| upright("prefix")] . $ <eq:finite-moments>]

This identity includes the possibility of repeated sampled edges.
  Removing such samples would replace the ordinary second moment by a different expression.

In the independent unfolding, the trees of the $k$ roots are independent, even when their edge types coincide.
  Averaging over the roots gives

#[#set math.equation(numbering: n => "(7.2)")
 $ bb(P) \( upright("all ") k upright(" independent root queries return true") divides upright("prefix") \) =
   (1 / m sum_(e in cal(E)) q_e \( 1 \))^k = \( 1 + o \( 1 \) \) q \( 1 \)^k \, $ <eq:unfolded-moments>]

by Proposition 9. Lemma 10 and Proposition 14 bound the difference between (7.1) and (7.2) by

$ Delta_n = O \( D^(- 35) + n^(- 1) \) . $

Since $q \( 1 \)^2 = \( 1 + 2 D \)^(- 1)$,

#[#set math.equation(numbering: n => "(7.3)")
 $ frac(Delta_n, q \( 1 \)^2) = O \( D^(- 34) + D \/ n \) = o \( 1 \) . $ <eq:relative-error>]

This also controls $Delta_n \/ q \( 1 \)$, as $q \( 1 \) lt.eq 1$.

Set $Y_n = F_n \/ \( m q \( 1 \) \)$, using the deterministic $m$ and $D$ from (2.2).
  The two moment identities give, uniformly over all good prefixes,

$ bb(E) \[ Y_n divides upright("prefix") \] = 1 + o \( 1 \) \, wide bb(E) \[ Y_n^2 divides upright("prefix") \] =
  1 + o \( 1 \) . $

Subtracting twice the first identity from the second and adding one yields

#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E) \[ \( Y_n - 1 \)^2 divides upright("prefix") \] = o \( 1 \) quad
   upright("uniformly on ") cal(G)_n . $ <eq:conditional-l2>]

The normalization has the exact form

#[#set math.equation(numbering: n => "(7.5)")
 $ a_n := frac(m q \( 1 \), n^(3 \/ 2)) = frac(sqrt(D), 2 sqrt(1 + 2 D)) = frac(1, 2 sqrt(2 + 1 \/ D)) arrow.r
   a := frac(1, 2 sqrt(2)) . $ <eq:constant>]

In particular $a_n$ is bounded below by a positive constant for large $n$.
  Regardless of the prefix, $0 lt.eq F_n lt.eq binom(n, 2) lt.eq n^2 \/ 2$.
  It follows that $\( Y_n - 1 \)^2 lt.eq C n$ deterministically. The bad-prefix contribution therefore satisfies

$ bb(E) \[ \( Y_n - 1 \)^2 upright(bold(1))_(cal(G)_n^c) \] lt.eq C n bb(P) \( cal(G)_n^c \) = o \( 1 \) . $

On $cal(G)_n$, condition on the complete prefix and use (7.4). We conclude that

$ bb(E) \[ \( Y_n - 1 \)^2 \] arrow.r 0 . $

Finally,

$ bb(E) [(F_n / n^(3 \/ 2) - a)^2] lt.eq 2 a_n^2 bb(E) \[ \( Y_n - 1 \)^2 \] + 2 \( a_n - a \)^2 arrow.r 0 . $

Markov’s inequality gives the convergence in probability in Theorem 1;
  Cauchy–Schwarz gives the stated expectation limit. This completes the proof.

#bibliography("refs.bib", style: "ieee", title: [References])
