#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The strong thin tree conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a finite loopless undirected multigraph $G = \( V \, E \)$ and a nonempty proper subset $S subset V$, write $delta_G \( S \)$ for the edges with exactly one endpoint in $S$. Parallel edges are counted separately. A graph is $k$-edge-connected if $\| delta_G \( S \) \| gt.eq k$ for every nonempty proper $S$. A spanning tree $T$ is $alpha$-thin if

$ \| delta_T \( S \) \| lt.eq alpha \| delta_G \( S \) \| #h(2em) \( diameter eq.not S subset.neq V \) . $

A spanning tree retains connectivity using only $\| V \| - 1$ edges. Thinness asks that these edges occupy a small fraction of every cut simultaneously. The question is whether high edge connectivity alone forces such a tree, with a bound independent of the number of vertices.

#thm([Theorem 1.1.])[
  #emph[There is a universal constant $C > 0$ such that, for every integer $k gt.eq 1$, every finite $k$-edge-connected undirected multigraph without loops and with at least two vertices has a spanning tree $T$ satisfying 
$ \| delta_T \( S \) \| lt.eq C / k thin \| delta_G \( S \) \| #h(2em) upright("for every ") diameter eq.not S subset.neq V . $

]
] <thm:main>

=== The conjecture and its history <the-conjecture-and-its-history>

Goddyn’s thin tree conjecture asks whether, for every $epsilon > 0$, a sufficiently high edge connectivity guarantees an $epsilon$-thin spanning tree #cite(label("Goddyn")). The strong thin tree conjecture asks for the quantitative rate $C \/ k$. Theorem 1 resolves this stronger conjecture positively. The order $1 \/ k$ is necessary: with two vertices and $k$ parallel edges, every spanning tree uses exactly one of the $k$ edges of the only cut.

Thin trees connect this graph-theoretic question with approximation algorithms. In the asymmetric traveling salesman problem, one seeks a minimum-cost tour through all vertices of a directed metric. Asadpour, Goemans, Mądry, Oveis Gharan, and Saberi used maximum-entropy distributions on spanning trees to round the standard linear-programming relaxation, obtaining an $O \( log n \/ log log n \)$-approximation, where $n$ is the number of vertices #cite(label("AsadpourSODA")) #cite(label("Asadpour")). Their method explains the usefulness of controlling every cut: together with control of the tree’s cost, cut bounds permit an inexpensive Eulerian augmentation of a suitable oriented tree. For the underlying thin-tree problem, Oveis Gharan and Saberi established the inverse-connectivity bound for planar graphs and, with constants depending on the surface, for graphs of bounded orientable genus #cite(label("OveisGharanSaberi2011")) Theorem 5.1.

For general multigraphs, Anari and Oveis Gharan developed effective-resistance-reducing flows and the geometry of locally connected hierarchies. They proved the existence of a spanning tree with thinness $"poly" \( log log n \) \/ k$ #cite(label("AOG")) Corollary 1.8. Their work provides the principal geometric foundation of the present proof. Progress for specified families of cuts gives a complementary view of the problem. Klein and Olver obtained inverse-connectivity thinness for every prescribed laminar family #cite(label("KleinOlver2023")). Klein, Olver, and Yeoh constructed a spanning tree crossing every cut of size less than $\( 1 + 1 \/ 40 \) k$ at most $88$ times #cite(label("KleinOlverYeoh")) Theorem 1. Theorem 1 controls all cuts simultaneously and removes the dependence on $n$.

The thin-tree approach to asymmetric traveling salesman remains structurally useful, although constant-factor approximation for that problem has already been obtained by other methods. Svensson, Tarnawski, and Végh proved the first such guarantee #cite(label("SvenssonTarnawskiVegh2020")); Traub and Vygen subsequently improved it #cite(label("TraubVygen2022")). Our objective here is the underlying all-cut spanning-tree theorem.

=== The two main deductions <the-two-main-deductions>

High edge connectivity supplies many edge-disjoint spanning trees through the Nash–Williams–Tutte theorem #cite(label("NashWilliams")) #cite(label("Tutte")). For any fixed cut, the average number of edges used by the trees in such a packing is small. This averaging does not select one tree that is small on every cut. We maintain a large packing throughout a sequence of sparsifications: each step reduces cut sizes and the packing size by almost the same factor, and the accumulated relative loss remains bounded.

The first deduction extracts a large tree packing on edges of small resistance. For a graph $H$, let $b_e = upright(bold(1))_u - upright(bold(1))_v$ be an arbitrarily oriented incidence column of an edge $e = u v$, and let $L_H = sum_e b_e b_e^(sans(T))$ be its Laplacian. The resistance of $e$ with respect to a positive definite matrix $X$ is $b_e^(sans(T)) X^(- 1) b_e$. Write $upright(bold(1))_S$ for the indicator column of $S$, and $A prec.curly.eq B$ when $B - A$ is positive semidefinite. For all sufficiently large integers $r$, if $H$ on at least two vertices contains $r$ edge-disjoint spanning trees, we construct such a matrix $X$ with

$ L_H prec.curly.eq X \, #h(2em) upright(bold(1))_S^(sans(T)) X upright(bold(1))_S lt.eq 3 \| delta_H \( S \) \| quad \( diameter eq.not S subset.neq V \) \, $

such that the edges of $H$ with $b_e^(sans(T)) X^(- 1) b_e lt.eq 4 r^(- 1 \/ 2)$ still contain $floor.l \( 1 - r^(- 1 \/ 16) \) r floor.r$ edge-disjoint spanning trees. The starting point is a polynomial consequence of the locally connected hierarchy theorem of Anari and Oveis Gharan #cite(label("AOG")) Theorem 3.5; we prove the required consequence in full. For a given matrix, retain the edges below each resistance threshold and partition the vertices into maximal sets supporting the prescribed number of disjoint spanning trees. These partitions are nested. Selecting them by dyadic crossing-edge counts gives a rooted hierarchy of nested vertex sets and avoids a loss depending on the number of levels. The hierarchy estimate supplies a response matrix $Y$ with small resistance on almost all crossing edges of every selected partition at once (Lemma 9). We interpolate finitely many such responses and take a fixed-point limit. At the resulting matrix $X$, a nontrivial maximal packing partition of its own low-resistance graph would have too many crossing edges. This contradiction yields the extracted packing (Theorem 8).

The second deduction is a sparsification step that retains about half the tree packing while bounding each new cut by approximately half its previous size. We use two vector representations of the incidence columns. The matrix $X$ controls cut size. A separate isotropic representation—whose vector outer products sum to the identity— controls the partition inequalities for tree packing. Applying the Marcus–Spielman–Srivastava theorem #cite(label("MSS")) to the stacked columns controls both systems on the same selected edge set. The relative losses are $1 + O \( r^(- 1 \/ 16) \)$. They have a bounded product as the packing parameter decreases geometrically. Harvey and Olver used iterated matrix halving to obtain spectrally thin trees under an effective-resistance hypothesis #cite(label("HarveyOlver2014")) Appendix F. The additional packing representation here permits iteration from edge connectivity.

Preserving a packing requires more than a weighted spectral approximation. Sampling by effective resistance and spectral sparsification provide powerful ways to reduce a graph while approximately preserving its Laplacian #cite(label("SpielmanSrivastava2011")) #cite(label("BatsonSpielmanSrivastava2012")). Here the edges must retain their original unit multiplicities. For example, $q$ parallel edges between two vertices have the same Laplacian as one edge of weight $q$, but the former graph packs $q$ edge-disjoint spanning trees and the latter has only one. The second representation supplies the rank information needed to certify the partition inequalities after selecting an unweighted subset of edges.

=== Organization and inputs <organization-and-inputs>

Section 2 proves the tree-packing facts used below. Section 3 gives the precise hierarchy input, and Section 4 proves the extraction theorem. Sections 5 and 6 develop the auxiliary representation and the sparsification step. Section 7 proves Theorem 1, including the small-connectivity cases. The independent-vector theorem used in the sparsification appears as Theorem 15. The required hierarchy estimate and the finite-dimensional fixed-point theorem are proved in the appendices. All sufficiently large thresholds in the argument are absolute. Choices made after a particular finite graph has been fixed need not have a uniform algorithmic running time. The companion article #emph[A polynomial-time construction of strong thin trees] #cite(label("ConstructiveThinTreesCompanion")) develops the separate finite-bit construction, including graphs given by binary-encoded parallel-edge multiplicities. Its geometric input extends the hierarchy proof here from cut tests to a larger cone of metric tests.

== 2 Laplacians and tree packings <sec:preliminaries>

Unless a base is specified, $log$ denotes the natural logarithm.

All graphs in the proof are finite undirected loopless multigraphs. They have a common vertex set when one is said to be a subgraph of another. Each parallel edge has its own index. For a partition $cal(P)$ of the vertex set, let $E_H \( cal(P) \)$ denote the edges whose endpoints lie in different parts. A graph is $r$-tree-packable if it contains $r$ pairwise edge-disjoint spanning trees. On a singleton vertex set this property is taken to hold for every positive integer $r$.

=== 2.1 Matrix conventions <matrix-conventions>

Choose an orientation of each edge solely to define $b_e = upright(bold(1))_u - upright(bold(1))_v in bb(R)^V$, and put

$ L_H = sum_(e in E \( H \)) b_e b_e^(sans(T)) . $

Changing an orientation changes no matrix or resistance used below. For a real symmetric positive definite matrix $X$, define

$ R_X \( e \) = b_e^(sans(T)) X^(- 1) b_e . $

The order $A prec.curly.eq B$ means that $B - A$ is positive semidefinite. We use the operator norm for matrices unless otherwise specified. For every nonempty proper $S subset V$,

$ upright(bold(1))_S^(sans(T)) L_H upright(bold(1))_S = \| delta_H \( S \) \| . $

An inequality required only for these indicator vectors is called a #emph[cut inequality]. It need not be a semidefinite inequality. In particular, no cut inequality is imposed at $S = V$.

#thm([Lemma 2.1.])[
  #emph[For $X succ 0$, a column $b$, and $t > 0$, 
$ b^(sans(T)) X^(- 1) b lt.eq t quad arrow.l.r.double quad b b^(sans(T)) prec.curly.eq t X . $

 If $X succ.curly.eq Y succ 0$, then $b^(sans(T)) X^(- 1) b lt.eq b^(sans(T)) Y^(- 1) b$.]
] <lem:resistance-order>

#proof[
  Congruence by $X^(- 1 \/ 2)$ reduces the first assertion to the fact that the only possible nonzero eigenvalue of $a a^(sans(T))$ is $parallel a parallel^2$, with $a = X^(- 1 \/ 2) b$. For the second, $Y^(- 1 \/ 2) X Y^(- 1 \/ 2) succ.curly.eq I$; diagonalization and inversion give $X^(- 1) prec.curly.eq Y^(- 1)$. ◻
]

When a Laplacian is inverted, we will explicitly restrict it to

$ upright(bold(1))^perp = { x in bb(R)^V : sum_(v in V) x_v = 0 } . $

The shortcut matrices $X$ used in extraction are positive definite on the full space $bb(R)^V$, so their inverses require no such convention.

#thm([Lemma 2.2.])[
  (Incidence rank).  #emph[If $F$ has $n$ vertices and $c$ connected components, its incidence columns span a space of dimension $n - c$. In particular the columns of a spanning tree form a basis of $upright(bold(1))^perp$.]
] <lem:incidence-rank>

#proof[
  A vector is orthogonal to every incidence column precisely when its coordinates agree at the endpoints of each edge, equivalently when it is constant on every connected component. The orthogonal complement thus has dimension $c$. A tree on $n$ vertices has $n - 1$ edges, as follows by deleting leaves successively, so its spanning columns form a basis. ◻
]

=== 2.2 The partition criterion <the-partition-criterion>

#thm([Theorem 2.3.])[
  (Nash–Williams–Tutte).  #emph[For a positive integer $r$, a graph $H$ contains $r$ edge-disjoint spanning trees if and only if 
$ \| E_H \( cal(P) \) \| gt.eq r \( \| cal(P) \| - 1 \) #h(2em) upright("for every partition ") cal(P) upright(" of ") V \( H \) . $

]
] <thm:packing>

We include an exchange proof of this classical criterion #cite(label("NashWilliams")) #cite(label("Tutte")). The insertion and cycle exchanges below are the graphic form of the circuit exchanges in Edmonds’s matroid-partition proof #cite(label("Edmonds1965")) Section 1.6.

#proof[
  The necessity follows by counting the crossings of each tree. For sufficiency, choose $r$ disjoint forests whose total number $m$ of edges is maximum. A #emph[state] is such a choice. Starting from this state, allow a move that adds an unused edge to one forest and removes an edge of the resulting cycle.
  In every reachable state, every unused edge closes a cycle with each forest: otherwise adding it would increase $m$. Let $U$ be the set of edges that are unused in at least one reachable state. If an unused edge is added to a forest, every edge of the resulting cycle lies in $U$, since any one of its original edges can be made unused by the corresponding move. Such a move preserves the components of that forest restricted to its edges in $U$. It also leaves the other forests unchanged.
  Fix $e in U$. In a state where $e$ is unused, its endpoints are connected by edges in $U$ in each forest. The component invariance just proved carries this statement to the initial state. Consequently each component of $\( V \( H \) \, U \)$ is spanned by the $U$-edges of every forest. If there are $d$ such components, this accounts for $r \( n - d \)$ used edges, where $n = \| V \( H \) \|$. Every edge between these components is used, since every unused edge belongs to $U$. Their number is therefore at most
  $ m - r \( n - d \) . $
  If $m < r \( n - 1 \)$, this is smaller than $r \( d - 1 \)$, contrary to the partition hypothesis. Thus $m = r \( n - 1 \)$; each of the $r$ forests has $n - 1$ edges and is a spanning tree. ◻
]

#thm([Lemma 2.4.])[
  (Union and quotient properties).  #emph[Fix a positive integer $q$ and a graph $F$.]
  + #emph[If $F \[ A \]$ and $F \[ B \]$ are $q$-tree-packable and $A ∩ B eq.not diameter$, then $F \[ A union B \]$ is $q$-tree-packable.]
  + #emph[The inclusion-maximal $q$-tree-packable vertex sets form a partition $cal(P) \( F \)$. If $F subset.eq F'$, then $cal(P) \( F' \)$ coarsens $cal(P) \( F \)$.]
  + #emph[If $\| cal(P) \( F \) \| > 1$, then 
$ \| E_F \( cal(P) \( F \) \) \| < q \( \| cal(P) \( F \) \| - 1 \) . $

]
] <lem:packing-parts>

#proof[
  For (i), enumerate the $q$ trees on each of $A$ and $B$. In the $i$-th tree on $B$, contract all vertices of $A ∩ B$ to a single vertex, discard loops, and choose a spanning tree of the resulting connected multigraph. Its selected edges, together with the $i$-th tree on $A$, form a tree on $A union B$. Every selected edge has an endpoint outside $A$, so no such edge lies in any tree on $A$. The selections in different colors remain disjoint. This proves (i).
  Every singleton is packable, and finiteness gives maximal sets. Part (i) shows that two maximal sets cannot intersect unless equal. Every previously packable set remains packable when edges are added, which proves (ii).
  For (iii), contract the parts and remove loops. If its crossing count were at least $q \( d - 1 \)$, where $d = \| cal(P) \( F \) \| > 1$, the quotient would have a set $W$ of at least two vertices with $\| E \( W \) \| gt.eq q \( \| W \| - 1 \)$. Choose such $W$ inclusion-minimal. For each proper nonempty $J subset W$,
  $ \| E \( J \) \| lt.eq q \( \| J \| - 1 \) \; $
  this also holds for a singleton because loops were removed. For a partition $W = J_1 union.sq dots.h.c union.sq J_t$, with $t gt.eq 2$, subtraction gives at least
  $ q \( \| W \| - 1 \) - sum_(ell = 1)^t q \( \| J_ell \| - 1 \) = q \( t - 1 \) $
  edges between its parts. Theorem 4 supplies $q$ quotient trees on $W$. Attach to each color a packed tree inside each of its quotient vertices. This gives $q$ disjoint spanning trees on their union in $F$, contradicting maximality of the parts. ◻
]

== 3 Shortcuts for a locally connected hierarchy <sec:hierarchy>

We require one matrix that controls average resistances on several related boundaries. A hierarchy specifies the boundaries on which this control is required. The matrix need only obey an upper bound on cuts; an upper bound in the positive semidefinite order would be a stronger condition.

#prodef([Definition 3.1.])[
  (Hierarchy and its boundaries).  Let $H = \( V \, E \)$ be a finite loopless multigraph. A #emph[hierarchy] on $V$ is a finite rooted tree of distinct nonempty vertex sets. Its root is $V$, its leaves are the singleton sets, and the children of every nonleaf form a partition of that node into at least two sets. For a nonroot node $A$, write $A^(*)$ for its parent and define
  $ P \( A \) = delta_H \( A \) \, #h(2em) O \( A \) = E_H \( A \, A^(*) \\ A \) . $
  All edge sets here retain multiplicities. Given an integer $h gt.eq 2$, the hierarchy is #emph[locally $h$-connected] if $H \[ A \]$ is $h$-edge-connected for every node $A$. For singleton nodes this condition is vacuous.
] <def:hierarchy>

In this definition $\| O \( A \) \| gt.eq h$ for every nonroot $A$: it is the boundary of the nonempty proper set $A$ in the $h$-edge-connected graph $H \[ A^(*) \]$. An edge belongs to $O \( A \)$ for exactly two nodes of the full hierarchy. Indeed, if $C$ is the least node containing both endpoints, these two nodes are the two children of $C$ containing its endpoints. Consequently an edge belongs to at most two parent boundaries in any subcollection.

Orient each edge arbitrarily and let $b_e$ be its incidence column. As usual, $L_H = sum_(e in E) b_e b_e^(sans(T))$. A #emph[shortcut matrix] for $H$ means a symmetric positive definite matrix $D$ on $bb(R)^V$ such that

$ upright(bold(1))_S^(sans(T)) D upright(bold(1))_S lt.eq \| delta_H \( S \) \| #h(2em) \( diameter eq.not S subset.neq V \) . quad "(3.1)" $ <eq:hierarchy-shortcut>

Its edge resistance is $R_D \( e \) = b_e^(sans(T)) D^(- 1) b_e$. The restriction to proper nonempty cuts in (3.1) is essential: imposing the same inequality at $S = V$ would contradict positive definiteness. We do not impose $D prec.curly.eq L_H$.

The following estimate is the hierarchy input used in this paper. It is a polynomial consequence of the Tree-CP theorem of Anari and Oveis Gharan #cite(label("AOG")) Theorem 3.5, printed p. 22. We give a complete proof in Appendix 9, following their dual and geometric method with parameters chosen for this weaker bound.

#thm([Theorem 3.2.])[
  (Polynomial shortcut bound).  #emph[There is an absolute integer $q_H gt.eq 2$ such that the following holds for each integer $q gt.eq q_H$. Let $H$ have a locally $q$-connected hierarchy, and let $cal(M)$ be any collection of its nonroot nodes satisfying $\| O \( A \) \| gt.eq \| P \( A \) \| \/ q$. Then $H$ has a shortcut matrix $D$ such that 
$ frac(1, \| O \( A \) \|) sum_(e in O \( A \)) R_D \( e \) lt.eq q^(- 31 \/ 40) #h(2em) \( A in cal(M) \) . quad "(3.2)" $ <eq:hierarchy-power>

 The cutoff is independent of the graph, the hierarchy depth and the marked collection $cal(M)$.]
] <thm:hierarchy-power>

== 4 Extracting a tree packing with small resistance <sec:extraction>

Throughout this section, $H$ is an $r$-tree-packable graph on $n gt.eq 2$ vertices. Set

$ u = r^(- 1 \/ 16) \, #h(2em) q = floor.l \( 1 - u \) r floor.r . quad "(4.1)" $ <eq:parameters>

We take $r$ above an absolute threshold, so in particular $q > 1$. The threshold may be increased finitely many times below.

#thm([Theorem 4.1.])[
  (Shortcut extraction).  #emph[For all sufficiently large integers $r$, every $r$-tree-packable graph $H$ admits $X succ 0$ such that 
$ L_H prec.curly.eq X \, #h(2em) upright(bold(1))_S^(sans(T)) X upright(bold(1))_S lt.eq 3 \| delta_H \( S \) \| quad \( diameter eq.not S subset.neq V \) \, quad "(4.2)" $ <eq:shortcut-X>

 and the edges with $R_X \( e \) lt.eq 4 r^(- 1 \/ 2)$ contain $q$ edge-disjoint spanning trees. The lower threshold on $r$ is independent of $H$ and $n$.]
] <thm:extraction>

For a nontrivial maximal packing partition, Lemma 5(iii) limits the number of crossing edges in the threshold graph. We first construct a response that makes most crossing edges have small resistance. Averaging responses at nearby matrices and taking a fixed-point limit transfers this estimate to the matrix defining the partition, forcing that partition to be trivial.

=== 4.1 A compact set of matrices <a-compact-set-of-matrices>

Let

$ cal(K) = {X = X^(sans(T)) : X succ.curly.eq L_H + n^(- 1) I \, quad upright(bold(1))_S^(sans(T)) X upright(bold(1))_S lt.eq 3 \| delta_H \( S \) \| upright(" for ") diameter eq.not S subset.neq V} . quad "(4.3)" $ <eq:compact-domain>

This is a nonempty compact convex subset of the real symmetric matrices. Indeed, $H$ is connected, and $\| S \| \/ n < 1 lt.eq \| delta_H \( S \) \|$, so $L_H + n^(- 1) I$ belongs to $cal(K)$. Closedness and convexity follow from the defining inequalities. The singleton cuts give $X_(v v) lt.eq 3 deg_H \( v \)$, and positive semidefiniteness gives $\| X_(v w) \|^2 lt.eq X_(v v) X_(w w)$; hence the domain is bounded. Every matrix in $cal(K)$ is bounded below by $n^(- 1) I$.

Given any locally $q$-connected hierarchy in $H$, mark exactly the nonroot nodes satisfying

$ \| O \( A \) \| gt.eq q^(- 1) \| P \( A \) \| . $

For all sufficiently large absolute $r$, we have $q gt.eq r \/ 2$ and $q gt.eq q_H$. Theorem 7 gives a shortcut matrix $D$ whose average resistance on every marked $O \( A \)$ is at most

$ q^(- 31 \/ 40) lt.eq 2^(31 \/ 40) r^(- 31 \/ 40) lt.eq r^(- 3 \/ 4) \, $

where the final inequality holds for $r gt.eq 2^31$. Put

$ Y = L_H + n^(- 1) I + D . quad "(4.4)" $ <eq:hierarchy-response>

Then $Y in cal(K)$, since on every cut its quadratic form is at most $2 \| delta_H \( S \) \| + \| S \| \/ n lt.eq 3 \| delta_H \( S \) \|$. Lemma 2 also gives

$ frac(1, \| O \( A \) \|) sum_(e in O \( A \)) R_Y \( e \) lt.eq r^(- 3 \/ 4) #h(2em) upright("for every marked ") A . quad "(4.5)" $ <eq:response-average>

=== 4.2 Packing partitions and a simultaneous response <packing-partitions-and-a-simultaneous-response>

Fix $X in cal(K)$. For $s > 0$, let

$ F_s \( X \) = #scale(x: 120%, y: 120%)[\(] V \, { e in E \( H \) : R_X \( e \) lt.eq s } #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(P)_s \( X \) = cal(P) \( F_s \( X \) \) \, $

where $cal(P) \( F \)$ is the maximal packing partition of Lemma 5. Define

$ B_s \( X \) = E_H \( cal(P)_s \( X \) \) \, #h(2em) M_s \( X \) = \| B_s \( X \) \| . $

The crossing sets contain edges of $H$, including those absent from $F_s \( X \)$. As $s$ increases, the partitions coarsen and their crossing sets decrease. Only finitely many partitions occur. Each part induces a $q$-edge-connected subgraph of $H$, because it contains $q$ packed trees in $F_s \( X \)$.

#thm([Lemma 4.2.])[
  (Simultaneous response).  #emph[There is an absolute constant $C_0$, which may be taken to be $40$, such that for every $X in cal(K)$ there exists $Y in cal(K)$ with 
$ \| { e in B_s \( X \) : R_Y \( e \) > r^(- 1 \/ 2) } #scale(x: 120%, y: 120%)[\|] lt.eq C_0 r^(- 1 \/ 4) M_s \( X \) #h(2em) upright("for every ") s > 0 . quad "(4.6)" $ <eq:simultaneous-response>

]
] <lem:response>

#proof[
  Temporarily suppress $X$ from the notation. In each occupied bin $2^a lt.eq M_s < 2^(a + 1)$, $a gt.eq 0$, choose the finest partition that occurs in that bin. List the chosen partitions in order from fine to coarse as $cal(P)_0 \, dots.h \, cal(P)_(ell - 1)$, with crossing sets $B_i$ and sizes $M_i$. Append $cal(P)_ell = { V }$, $B_ell = diameter$, $M_ell = 0$.
  The distinct parts of these partitions, together with all singletons, form a laminar family containing $V$. Give each proper set its smallest proper containing set as parent. The children of every nonsingleton partition that set, so this is a hierarchy. Every induced graph at a node is $q$-edge-connected: this was proved for the partition parts, the root is $r$-tree-packable, and singleton conditions are vacuous. Take the response $Y$ from (4.4) for this hierarchy.
  Consider a transition $cal(P)_j$ to $cal(P)_(j + 1)$. If a part $A in cal(P)_j$ changes, the part of $cal(P)_(j + 1)$ containing it is its immediate parent in the hierarchy. Indeed, earlier selected partitions are finer and later ones are coarser, so none supplies a distinct set strictly between these two. Adding singleton leaves creates no such set.
  An edge of $B_j \\ B_(j + 1)$ has endpoints in two changing parts of $cal(P)_j$ with the same parent. It belongs to the $O \( A \)$ set of each of those parts; see Figure 1. The total full boundary size of all changing parts is at most $2 M_j$, since they belong to the single partition $cal(P)_j$. For the unmarked changing parts,
  $ sum_A \| O \( A \) \| lt.eq 1 / q sum_A \| P \( A \) \| lt.eq frac(2 M_j, q) . $
  For the marked changing parts, (4.5) gives
  $ \| { e in O \( A \) : R_Y \( e \) > r^(- 1 \/ 2) } #scale(x: 120%, y: 120%)[\|] lt.eq r^(- 1 \/ 4) \| O \( A \) \| . $
  Their total bad-edge count is therefore at most $2 M_j r^(- 1 \/ 4)$. These counts may cover an edge more than once, which only enlarges the upper bound. Consequently at most
  $ 2 \( r^(- 1 \/ 4) + 1 \/ q \) M_j $
  of the disappearing edges are bad.
  There is only one representative per occupied dyadic bin, so its bin exponents strictly decrease. For every $i < ell$,
  $ sum_(j = i)^(ell - 1) M_j < 4 M_i . quad "(4.7)" $ <eq:dyadic-tail>
  For example, if $2^a lt.eq M_i < 2^(a + 1)$, the successive terms are bounded by $2^(a + 1) \, 2^a \, 2^(a - 1) \, dots.h$. Every edge of $B_i$ disappears at exactly one later transition. Its bad-edge count is thus at most
  $ 8 \( r^(- 1 \/ 4) + 1 \/ q \) M_i . $
  For an arbitrary $s$ with $M_s > 0$, the chosen representative in its bin is finer, so $B_s subset.eq B_i$ and $M_i < 2 M_s$. The bad-edge count in $B_s$ is at most
  $ 16 \( r^(- 1 \/ 4) + 1 \/ q \) M_s lt.eq 40 r^(- 1 \/ 4) M_s $
  for all sufficiently large $r$. If $M_s = 0$, the assertion is immediate. This proves (4.6) simultaneously for every threshold. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((6.35, 6.25), [Selected threshold partitions: fine to coarse])
  content((1.1, 5.78), [$P_0$])
  content((2.85, 5.78), [$dots.h$])
  content((4.6, 5.78), [$P_i$])
  content((7, 5.78), [$P_{i+1}$])
  content((9, 5.78), [$dots.h$])
  content((11.05, 5.78), [$\{V\}$])
  line((1.1, 5.78), (2.85, 5.78), stroke: (thickness: 0.55pt))
  line((2.85, 5.78), (4.6, 5.78), stroke: (thickness: 0.55pt))
  line((4.6, 5.78), (7, 5.78), stroke: (thickness: 0.55pt))
  line((7, 5.78), (9, 5.78), stroke: (thickness: 0.55pt))
  line((9, 5.78), (11.05, 5.78), stroke: (thickness: 0.55pt))
  line((1.2, 5.12), (2, 5.12), stroke: (paint: rgb("#595959"), thickness: 0.65pt, dash: "dashed"))
  content((2.1, 5.12), [parts of $P_i$], anchor: "west")
  line((7.15, 5.12), (7.95, 5.12), stroke: (paint: rgb("#000000"), thickness: 0.8pt))
  content((8.05, 5.12), [parts of $P_{i+1}$], anchor: "west")
  rect((0.25, 1.4), (6.15, 4.65), stroke: (paint: rgb("#000000"), thickness: 0.8pt))
  rect((6.55, 1.4), (12.45, 4.65), stroke: (paint: rgb("#000000"), thickness: 0.8pt))
  content((3.2, 4.33), [$C=A^*=(A')^*$])
  content((9.5, 4.33), [$D$])
  rect((0.65, 1.85), (2.95, 3.98), stroke: (paint: rgb("#595959"), thickness: 0.65pt, dash: "dashed"))
  rect((3.45, 1.85), (5.75, 3.98), stroke: (paint: rgb("#595959"), thickness: 0.65pt, dash: "dashed"))
  rect((6.95, 1.85), (9.25, 3.98), stroke: (paint: rgb("#595959"), thickness: 0.65pt, dash: "dashed"))
  rect((9.75, 1.85), (12.05, 3.98), stroke: (paint: rgb("#595959"), thickness: 0.65pt, dash: "dashed"))
  content((1.8, 3.65), [$A$])
  content((4.6, 3.65), [$A'$])
  content((8.1, 3.65), [$D_1$])
  content((10.9, 3.65), [$D_2$])
  circle((1.2, 2.48), radius: 0.05, fill: rgb("#000000"))
  circle((1.45, 3.1), radius: 0.05, fill: rgb("#000000"))
  circle((2.25, 2.8), radius: 0.05, fill: rgb("#000000"))
  circle((4.15, 2.8), radius: 0.05, fill: rgb("#000000"))
  circle((4.95, 3.1), radius: 0.05, fill: rgb("#000000"))
  circle((5.1, 2.35), radius: 0.05, fill: rgb("#000000"))
  circle((7.6, 2.35), radius: 0.05, fill: rgb("#000000"))
  circle((7.7, 3.1), radius: 0.05, fill: rgb("#000000"))
  circle((8.6, 2.75), radius: 0.05, fill: rgb("#000000"))
  circle((10.35, 2.5), radius: 0.05, fill: rgb("#000000"))
  circle((10.6, 3.1), radius: 0.05, fill: rgb("#000000"))
  circle((11.4, 2.8), radius: 0.05, fill: rgb("#000000"))
  line((2.25, 2.8), (4.15, 2.8), stroke: (paint: rgb("#255780"), thickness: 1.3pt))
  content((3.2, 2.8), [$e$])
  line((5.1, 2.35), (7.6, 2.35), stroke: (paint: rgb("#000000"), thickness: 0.7pt))
  content((6.35, 2.35), [$f$])
  content((6.35, 0.86), [$e in B_i without B_{i+1}, e in O(A) O(A')$])
  content((6.35, 0.3), [$O(A)=E_H(A,C without A), f in B_{i+1} subset.eq B_i$])
})],
  caption: [Figure 1: At a selected transition $cal(P)_i arrow.r cal(P)_(i + 1)$, the parts $A \, A'$ merge into their immediate parent $C$. The edge $e$ leaves the crossing set and belongs to both $O \( A \)$ and $O \( A' \)$, whereas $f$ remains a crossing edge. Only representative vertices and edges are shown. ],
) <fig:hierarchy>

=== 4.3 A consistent matrix from a fixed-point limit <a-consistent-matrix-from-a-fixed-point-limit>

#proof[
  The response supplied by Lemma 9 need not vary continuously with $X$. We interpolate only finitely many responses at a time.
  For each positive integer $p$, cover $cal(K)$ by finitely many relative open balls of radius $1 \/ p$, with centers $C_(p \, 1) \, dots.h \, C_(p \, N_p) in cal(K)$. At each center choose a response $Y_(p \, j)$. Define continuous weights
  $ phi.alt_(p \, j) \( Z \) = frac(max { 0 \, p^(- 1) - parallel Z - C_(p \, j) parallel }, sum_(h = 1)^(N_p) max { 0 \, p^(- 1) - parallel Z - C_(p \, h) parallel }) #h(2em) \( Z in cal(K) \) . $
  The denominator is positive by the open cover. The map
  $ Phi_p \( Z \) = sum_(j = 1)^(N_p) phi.alt_(p \, j) \( Z \) Y_(p \, j) $
  is a continuous self-map of the compact convex set $cal(K)$. Theorem 46 gives $X_p = Phi_p \( X_p \)$. Pass to a subsequence along which $X_p arrow.r X in cal(K)$.
  Choose
  $ 3 r^(- 1 \/ 2) < s < 4 r^(- 1 \/ 2) $
  distinct from every $R_X \( e \)$, $e in E \( H \)$. This is possible because the graph is finite. If $phi.alt_(p \, j) \( X_p \) > 0$, then
  $ parallel C_(p \, j) - X parallel < p^(- 1) + parallel X_p - X parallel arrow.r 0 $
  uniformly over these centers. The resistance of each edge is continuous on $cal(K)$. Since all resistances at $X$ avoid $s$, for all sufficiently large $p$ every contributing center has exactly the same threshold graph, packing partition, and crossing set as $X$.
  Write $B = B_s \( X \)$, $M = \| B \|$, and $delta = C_0 r^(- 1 \/ 4)$. If $M = 0$, connectedness of $H$ implies that its partition is ${ V }$, and the conclusion already follows. Otherwise, for large $p$, each contributing $Y_(p \, j)$ has at most $delta M$ bad edges in this same set $B$. Summing their bad indicators with weights $phi.alt_(p \, j) \( X_p \)$ shows that at most $2 delta M$ edges receive bad weight greater than one half.
  For every other edge $e in B$, at least half the total weight is on matrices satisfying
  $ Y_(p \, j) succ.curly.eq r^(1 \/ 2) b_e b_e^(sans(T)) \, $
  by Lemma 2. All remaining matrices are positive semidefinite. Hence their convex combination satisfies
  $ X_p succ.curly.eq 1 / 2 r^(1 \/ 2) b_e b_e^(sans(T)) \, #h(2em) R_(X_p) \( e \) lt.eq 2 r^(- 1 \/ 2) . $
  Thus at least $N = ceil.l \( 1 - 2 delta \) M ceil.r$ edges satisfy this closed inequality. The condition that at least $N$ edges of the finite set $B$ obey it is closed: it is a finite union, over $N$-element subsets of $B$, of finite intersections of closed conditions. The same count therefore holds at the limit $X$. Since $2 r^(- 1 \/ 2) < s$, these edges belong to $F_s \( X \)$.
  Suppose $cal(P)_s \( X \)$ has $d > 1$ parts. The original $r$ packed trees in $H$ give $M gt.eq r \( d - 1 \)$. Choose the absolute threshold on $r$ so that $2 C_0 r^(- 1 \/ 4) < u$. Then
  $ \| E_(F_s \( X \)) \( cal(P)_s \( X \) \) \| gt.eq \( 1 - 2 C_0 r^(- 1 \/ 4) \) M > q \( d - 1 \) \, $
  contradicting Lemma 5(iii). The partition is therefore ${ V }$, so $F_s \( X \)$ is $q$-tree-packable. Every one of its edges has resistance at most $s < 4 r^(- 1 \/ 2)$, and $X in cal(K)$ gives (4.2). ◻
]

#prodef([Remark 4.3.])[
  For a fixed graph, the finite-cover scale needed to stabilize the chosen threshold can be arbitrarily small. This does not affect the absolute cutoff on $r$. The latter comes only from the hierarchy estimate and the numerical inequalities in the proof. The construction makes no claim about its computational cost.
] <rem:uniform-extraction>

== 5 A vector representation that certifies tree packings <sec:auxiliary>

The next representation gives a matrix inequality sufficient for all the partition inequalities in Theorem 4. Its construction uses strictly positive edge weights, which preserve every subset rank. The normalization uses the log-determinant variational method behind radial isotropic position #cite(label("Barthe1998")) Section 2.2. Here the target vector of edge weights is the average of the edge-set indicator vectors of the given disjoint trees. We give the approximate positive-weight form that keeps every subset rank unchanged.

#thm([Lemma 5.1.])[
  (Isotropic representation preserving ranks).  #emph[Let $B$ be the union of $q gt.eq 1$ edge-disjoint spanning trees on an $n$-vertex set, where $n gt.eq 2$. For every $rho > 0$ there are vectors $z_e in bb(R)^(n - 1)$, indexed by the individual edges of $B$, such that 
$ sum_(e in B) z_e z_e^(sans(T)) = I_(n - 1) \, #h(2em) parallel z_e parallel^2 lt.eq frac(1 + rho, q) . quad "(5.1)" $ <eq:auxiliary-isotropy>

 Moreover, there are an invertible linear map $M : upright(bold(1))^perp arrow.r bb(R)^(n - 1)$ and positive numbers $s_e$ such that $z_e = s_e M b_e$. Consequently the incidence vectors and the $z_e$ have the same rank on every subset of edges.]
] <lem:auxiliary-representation>

#proof[
  Choose orthonormal coordinates on $upright(bold(1))^perp$ and write $b_e$ for the incidence columns in these coordinates. Denote the given trees by $T_1 \, dots.h \, T_q$. For $a in bb(R)^(E \( B \))$, set
  $ N \( a \) = sum_(e in B) exp \( a_e \) b_e b_e^(sans(T)) \, #h(2em) h \( a \) = log det N \( a \) - 1 / q sum_(e in B) a_e . $
  Every $N \( a \)$ is positive definite: the columns of $T_1$ are a basis and all its weights are positive. Thus $h$ is a smooth, everywhere finite function.
  Let $c_t > 0$ be the square of the determinant of the basis of columns indexed by $T_t$. Cauchy–Binet, followed by the arithmetic–geometric mean inequality, gives
  $ det N \( a \) & gt.eq sum_(t = 1)^q c_t exp (sum_(e in T_t) a_e)\
 & gt.eq q (product_(t = 1)^q c_t)^(1 \/ q) exp (1 / q sum_(e in B) a_e) . $
  Here the last exponent uses the fact that the $T_t$ partition $E \( B \)$. In particular,
  $ h \( a \) gt.eq L := log q + 1 / q sum_(t = 1)^q log c_t . $
  For $gamma > 0$, the function $h \( a \) + gamma parallel a parallel^2$ is continuous and coercive, hence has a minimizer $a^gamma in bb(R)^(E \( B \))$. Comparison with $a = 0$ shows that, with $K = h \( 0 \) - L gt.eq 0$,
  $ gamma parallel a^gamma parallel^2 lt.eq K \, #h(2em) parallel nabla h \( a^gamma \) parallel = 2 gamma parallel a^gamma parallel lt.eq 2 sqrt(gamma K) . $
  The stationarity equation supplies the equality in the second formula. Thus one may choose a finite $a = a^gamma$ for which every coordinate of $nabla h \( a \)$ has absolute value at most $rho \/ q$. This remains valid when $K = 0$, since the displayed gradient bound is then zero.
  The determinant derivative formula yields
  $ frac(partial h, partial a_e) = exp \( a_e \) b_e^(sans(T)) N \( a \)^(- 1) b_e - 1 / q . $
  Define $z_e = exp \( a_e \/ 2 \) N \( a \)^(- 1 \/ 2) b_e$. Their outer products sum exactly to the identity, and the gradient bound gives their asserted norm bound. The common map $N \( a \)^(- 1 \/ 2)$ is invertible and every $exp \( a_e \/ 2 \)$ is positive. These operations preserve all subset ranks, including the dependencies among parallel edges. ◻
]

#thm([Lemma 5.2.])[
  (Projected trace and packing).  #emph[With the vectors in Lemma 11, suppose $A subset.eq E \( B \)$ and $c > 0$ satisfy 
$ sum_(e in A) z_e z_e^(sans(T)) succ.curly.eq c I_(n - 1) . $

 Then $\( V \, A \)$ contains at least $floor.l c q \/ \( 1 + rho \) floor.r$ edge-disjoint spanning trees.]
] <lem:projected-trace-packing>

#proof[
  Fix a partition $cal(P) = { V_1 \, dots.h \, V_d }$ into nonempty parts. Let $W$ be the span of the $z_e$ indexed by all edges of $B$ whose endpoints lie in one part. The corresponding incidence vectors lie in the direct sum of the zero-sum spaces on the parts. The representation therefore gives
  $ dim W lt.eq sum_(j = 1)^d \( \| V_j \| - 1 \) = n - d . $
  Let $P$ be the orthogonal projection onto $W^perp$, so that $"tr" P gt.eq d - 1$. Taking the trace after multiplication by $P$ preserves the stated positive-semidefinite inequality: indeed, $"tr" \( P Q \) gt.eq 0$ for positive-semidefinite $P \, Q$. Writing $E_A \( cal(P) \)$ for the edges of $A$ crossing the partition, we obtain
  $ c \( d - 1 \) & lt.eq c "tr" P lt.eq "tr" (P sum_(e in A) z_e z_e^(sans(T)))\
 & = sum_(e in E_A \( cal(P) \)) parallel P z_e parallel^2 lt.eq frac(1 + rho, q) \| E_A \( cal(P) \) \| . $
  The within-part terms vanish by the choice of $P$. Every partition therefore has at least $floor.l c q \/ \( 1 + rho \) floor.r \( d - 1 \)$ crossing edges. Theorem 4 completes the proof; if the floor is zero, the conclusion is immediate. ◻
]

== 6 One sparsification step <sec:sparsification>

We first derive the exact consequence of the Marcus–Spielman–Srivastava random-vector theorem #cite(label("MSS")) Theorem 1.4 needed here. The use of deterministic padding permits singular covariance matrices and keeps both halves under simultaneous control.

#thm([Lemma 6.1.])[
  (Two-sided splitting).  #emph[Let $w_e in bb(R)^D$ be finitely many vectors, let $Sigma = sum_e w_e w_e^(sans(T)) prec.curly.eq 2 I_D$, and suppose that $parallel w_e parallel^2 lt.eq epsilon.alt$ for every $e$, where $epsilon.alt > 0$. There is a subset $A$ of the indices for which 
$ 1 / 2 Sigma - tau I_D prec.curly.eq sum_(e in A) w_e w_e^(sans(T)) prec.curly.eq 1 / 2 Sigma + tau I_D \, #h(2em) tau = 2 sqrt(epsilon.alt) + epsilon.alt . quad "(6.1)" $ <eq:two-sided-split>

]
] <lemma:two-system-split>

#proof[
  Independently for each $e$, let $v_e in bb(R)^(2 D)$ equal $\( w_e \, 0 \)$ or $\( 0 \, w_e \)$, each with probability $1 \/ 2$. Then
  $ M := sum_e bb(E) \[ v_e v_e^(sans(T)) \] = "diag" \( Sigma \/ 2 \, Sigma \/ 2 \) prec.curly.eq I_(2 D) \, #h(2em) bb(E) parallel v_e parallel^2 = parallel w_e parallel^2 lt.eq epsilon.alt . $
  To make the covariance exactly isotropic, diagonalize the positive-semidefinite matrix $I_(2 D) - M$. For each positive eigenvalue $lambda$ with unit eigenvector $f$, put $m_lambda = ceil.l lambda \/ epsilon.alt ceil.r$ and introduce $m_lambda$ deterministic vectors equal to $sqrt(lambda \/ m_lambda) thin f$. There are finitely many such vectors; each has squared norm at most $epsilon.alt$, and their outer products sum to $I_(2 D) - M$. Deterministic vectors have singleton support and are independent of all other vectors. Consequently Theorem 15 applies to the enlarged family.
  In its successful outcome, let $A$ be the indices assigned to the first block, and set $S_A = sum_(e in A) w_e w_e^(sans(T))$. Subtracting the fixed padding matrix from the theorem’s conclusion gives
  $ "diag" \( S_A \, Sigma - S_A \) prec.curly.eq M + #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(epsilon.alt) \)^2 - 1 #scale(x: 120%, y: 120%)[\)] I_(2 D) = M + tau I_(2 D) . $
  The first block gives the upper bound in (6.1); the second block gives its lower bound. ◻
]

#thm([Proposition 6.2.])[
  (Packing-preserving sparsification).  #emph[There is an absolute integer $r_(upright("step"))$ such that the following holds for every integer $r gt.eq r_(upright("step"))$. If $H$ has at least two vertices and contains $r$ edge-disjoint spanning trees, set 
$ u = r^(- 1 \/ 16) \, #h(2em) q = floor.l \( 1 - u \) r floor.r \, #h(2em) epsilon.alt = 6 r^(- 1 \/ 2) \, #h(2em) tau = 2 sqrt(epsilon.alt) + epsilon.alt . $

 Then $H$ has a spanning subgraph $H'$ containing at least 
$ r' = ⌊frac(\( 1 - 4 u \) r, 2)⌋ quad "(6.2)" $ <eq:step-packing-count>

 edge-disjoint spanning trees, such that every nonempty proper $S subset V \( H \)$ satisfies 
$ \| delta_(H') \( S \) \| lt.eq (1 / 2 + 3 tau) \| delta_H \( S \) \| . quad "(6.3)" $ <eq:step-cut-bound>

 The cutoff may be chosen so that, in addition, 
$ 5 / 16 lt.eq r' / r lt.eq 1 / 2 \, #h(2em) frac(1 / 2 + 3 tau, r' \/ r) lt.eq 1 + 15 u . quad "(6.4)" $ <eq:step-ratio-bound>

]
] <prop:step>

#proof[
  Write $n = \| V \( H \) \|$. Choose the cutoff large enough for Theorem 8, and also require $r gt.eq 16^16$, so $u lt.eq 1 \/ 16$. The extraction theorem supplies a positive definite matrix $X$ with
  $ X succ.curly.eq L_H \, #h(2em) upright(bold(1))_S^(sans(T)) X upright(bold(1))_S lt.eq 3 upright(bold(1))_S^(sans(T)) L_H upright(bold(1))_S quad \( diameter eq.not S eq.not V \) \, $
  and $q$ edge-disjoint spanning trees all of whose edges satisfy $b_e^(sans(T)) X^(- 1) b_e lt.eq 4 r^(- 1 \/ 2)$. Let $B$ be precisely the union of these trees. Apply Lemma 11 to $B$ with $rho = u$, and put
  $ a_e = X^(- 1 \/ 2) b_e \, #h(2em) w_e = \( a_e \, z_e \) \, #h(2em) Sigma = sum_(e in B) w_e w_e^(sans(T)) . $
  The covariance includes cross blocks:
  $ Sigma = mat(delim: "(", X^(- 1 \/ 2) L_B X^(- 1 \/ 2), sum_(e in B) a_e z_e^(sans(T)); sum_(e in B) z_e a_e^(sans(T)), I_(n - 1)) . $
  They need not vanish. Nevertheless, for any vectors $x \, y$ in the two coordinate spaces,
  $ \( x \, y \)^(sans(T)) Sigma \( x \, y \) & = sum_(e in B) #scale(x: 120%, y: 120%)[\(] chevron.l x \, a_e chevron.r + chevron.l y \, z_e chevron.r #scale(x: 120%, y: 120%)[\)]^2\
 & lt.eq 2 x^(sans(T)) X^(- 1 \/ 2) L_B X^(- 1 \/ 2) x + 2 parallel y parallel^2\
 & lt.eq 2 \( parallel x parallel^2 + parallel y parallel^2 \) \, $
  because $L_B prec.curly.eq L_H prec.curly.eq X$. Hence $0 prec.curly.eq Sigma prec.curly.eq 2 I$ without any invertibility assumption on $Sigma$.
  Since $q gt.eq \( 1 - u \) r - 1 gt.eq r \/ 2$, and $r gt.eq 4$,
  $ frac(1 + u, q) lt.eq frac(17, 8 r) lt.eq 2 r^(- 1 \/ 2) . $
  Thus every $w_e$ has squared norm at most $4 r^(- 1 \/ 2) + \( 1 + u \) \/ q lt.eq epsilon.alt$. Choose the subset $A subset.eq E \( B \)$ supplied by Lemma 13. The two principal blocks of the #emph[same] inequality (6.1) give
  $ sum_(e in A) z_e z_e^(sans(T)) succ.curly.eq \( 1 \/ 2 - tau \) I_(n - 1) \, #h(2em) X^(- 1 \/ 2) L_A X^(- 1 \/ 2) prec.curly.eq 1 / 2 X^(- 1 \/ 2) L_B X^(- 1 \/ 2) + tau I_n . quad "(6.5)" $ <eq:same-subset-two-constraints>
  Congruence by $X^(1 \/ 2)$ in the second inequality yields
  $ L_A prec.curly.eq 1 / 2 L_B + tau X prec.curly.eq 1 / 2 L_H + tau X . $
  Testing on $upright(bold(1))_S$ proves (6.3) for $H' = \( V \, A \)$, simultaneously for all cuts.
  For the packing assertion, write the errors in terms of $u$:
  $ epsilon.alt = 6 u^8 \, #h(2em) tau = 2 sqrt(6) thin u^4 + 6 u^8 lt.eq u \/ 2 quad \( 0 < u lt.eq 1 \/ 16 \) . $
  For example, dividing by $u$ and using $sqrt(6) < 3$ bounds the left ratio by $6 \( 16^(- 3) + 16^(- 7) \) < 1 \/ 2$. In particular $c = 1 \/ 2 - tau > 0$, so the first inequality in (6.5) and Lemma 12 give at least $floor.l \( 1 \/ 2 - tau \) q \/ \( 1 + u \) floor.r$ trees. The rounding margin is explicit:
  $ & \( 1 - 2 tau \) #scale(x: 120%, y: 120%)[\(] \( 1 - u \) r - 1 #scale(x: 120%, y: 120%)[\)] - \( 1 + u \) \( 1 - 4 u \) r\
 & quad gt.eq \( 1 - u \) #scale(x: 120%, y: 120%)[\(] \( 1 - u \) r - 1 #scale(x: 120%, y: 120%)[\)] - \( 1 + u \) \( 1 - 4 u \) r\
 & quad = r \( u + 5 u^2 \) - \( 1 - u \) gt.eq 0 \, $
  where $r u = r^(15 \/ 16) gt.eq 1$. Consequently
  $ frac(\( 1 \/ 2 - tau \) q, 1 + u) gt.eq frac(\( 1 - 4 u \) r, 2) . $
  Taking floors proves (6.2).
  Finally, the floor in that formula and $1 \/ r lt.eq u$ give
  $ r' / r gt.eq 1 / 2 - 2 u - 1 / r gt.eq 1 / 2 - 3 u gt.eq 5 / 16 \, #h(2em) r' / r lt.eq 1 / 2 . $
  Using $tau lt.eq u \/ 2$ once more, we obtain
  $ frac(1 / 2 + 3 tau, r' \/ r) lt.eq frac(1 + 3 u, 1 - 6 u) = 1 + frac(9 u, 1 - 6 u) lt.eq 1 + 15 u \, $
  which proves (6.4). ◻
]

== 7 Iteration and the thin spanning tree <sec:iteration>

We now turn the sparsification step into a uniform bound. The estimate keeps track of the tree-packing parameter rather than the number of rounds. The bounded product of losses uses the summable-error principle in the spectral-halving argument of Harvey and Olver #cite(label("HarveyOlver2014")) Appendix F, Claims F.3–F.4.

#proof[
  Choose an absolute integer $r_(*)$ at least the cutoff in Proposition 14. For every $r gt.eq r_(*)$, that proposition supplies a positive integer $r'$ satisfying
  $ 5 / 16 lt.eq r' / r lt.eq 1 / 2 \, #h(2em) frac(1 \/ 2 + 3 tau, r' \/ r) lt.eq 1 + 15 r^(- 1 \/ 16) . $
  These are exactly the estimates in (6.4).
  First let $H_0$ be any graph on at least two vertices with $r_0 gt.eq 1$ packed spanning trees. As long as $r_i gt.eq r_(*)$, apply Proposition 14 to obtain a subgraph $H_(i + 1)$ with at least
  $ r_(i + 1) = ⌊frac(\( 1 - 4 r_i^(- 1 \/ 16) \) r_i, 2)⌋ $
  packed spanning trees. Stop at the first $j$ with $r_j < r_(*)$. This happens after finitely many steps because $r_(i + 1) lt.eq r_i \/ 2$. Every $r_i$ is positive.
  If $j gt.eq 1$, reading the halving inequality backwards gives
  $ r_i gt.eq 2^(j - 1 - i) r_(j - 1) gt.eq 2^(j - 1 - i) r_(*) #h(2em) \( 0 lt.eq i < j \) . $
  Consequently
  $ sum_(i = 0)^(j - 1) r_i^(- 1 \/ 16) lt.eq frac(r_(*)^(- 1 \/ 16), 1 - 2^(- 1 \/ 16)) . $
  Set
  $ C_(upright("it")) = exp (frac(15 r_(*)^(- 1 \/ 16), 1 - 2^(- 1 \/ 16))) gt.eq 1 . quad "(7.1)" $ <eq:constant-C2>
  For every cut $S$, multiplication of the step inequalities and (6.4) gives
  $ \| delta_(H_j) \( S \) \| & lt.eq r_j / r_0 product_(i = 0)^(j - 1) \( 1 + 15 r_i^(- 1 \/ 16) \) \| delta_(H_0) \( S \) \|\
 & lt.eq C_(upright("it")) r_j / r_0 \| delta_(H_0) \( S \) \| . $
  For $j = 0$ the same inequality holds with an empty product. All these estimates concern the same sequence of subgraphs and hold for every cut simultaneously.
  Since $r_j gt.eq 1$, the final graph $H_j$ is connected. Any spanning tree $T$ of $H_j$ satisfies
  $ \| delta_T \( S \) \| lt.eq frac(C_(upright("it")) r_(*), r_0) \| delta_(H_0) \( S \) \| #h(2em) \( diameter eq.not S subset.neq V \) . quad "(7.2)" $ <eq:packing-thinness>
  This includes $r_0 < r_(*)$: there are then zero rounds, and any spanning tree works because $C_(upright("it")) r_(*) \/ r_0 gt.eq 1$.
  Finally take $H_0 = G$. If $k gt.eq 2$, summing the cut lower bounds over a partition into $d gt.eq 2$ parts shows that
  $ \| E_G \( cal(P) \) \| gt.eq frac(k d, 2) gt.eq floor.l k \/ 2 floor.r \( d - 1 \) . $
  Theorem 4 supplies $floor.l k \/ 2 floor.r$ packed trees. If $k = 1$, connectedness supplies one tree. Thus in all cases we may choose
  $ r_0 = max { 1 \, floor.l k \/ 2 floor.r } gt.eq k \/ 3 . $
  Substitution in (7.2) proves the theorem with the universal constant
  $ C = 3 C_(upright("it")) r_(*) . $
  ◻
]

== 8 The isotropic random-vector theorem <sec:mss>

This appendix proves the precise form of the Marcus–Spielman–Srivastava theorem used in Section 6. The proof proceeds through expected characteristic polynomials, an elementary interlacing argument, and a barrier estimate. In particular, the barrier estimate below is proved directly from partial fractions; no representation theorem for bivariate stable polynomials is required.

#thm([Theorem 8.1.])[
  (Marcus–Spielman–Srivastava, #cite(label("MSS")) Theorem 1.4).  #emph[Let $epsilon.alt > 0$, and let $v_1 \, dots.h \, v_m$ be independent random vectors with finite support in $bb(C)^d$. If 
$ sum_(i = 1)^m bb(E) \[ v_i v_i^(*) \] = I_d \, #h(2em) bb(E) parallel v_i parallel^2 lt.eq epsilon.alt quad \( 1 lt.eq i lt.eq m \) \, quad "(8.1)" $ <eq:mss-hypotheses>

 then 
$ bb(P) {∥sum_(i = 1)^m v_i v_i^(*)∥ lt.eq \( 1 + sqrt(epsilon.alt) \)^2} > 0 . quad "(8.2)" $ <eq:mss-conclusion>

 Here $*$ denotes conjugate transpose and the norm is the operator norm. In particular, some outcome satisfies the corresponding positive-semidefinite upper bound. Real vectors are a special case.]
] <thm:mss>

The case $d = 0$ is immediate, so the proof below assumes $d gt.eq 1$. We will use polynomial factorization, elementary compactness, and standard finite-dimensional linear algebra. The polynomial and analytic lemmas needed beyond those facts are proved below.

=== 8.1 Polynomial limits and stability <polynomial-limits-and-stability>

Write $bb(H) = { z in bb(C) : "Im" z > 0 }$. A nonzero polynomial $p$ in several variables is #emph[stable] if it does not vanish when all its arguments lie in $bb(H)$. It is #emph[real stable] if, in addition, its coefficients are real. A nonzero real univariate polynomial is stable exactly when all its roots are real: nonreal roots of a real polynomial occur in conjugate pairs.

#thm([Lemma 8.2.])[
  (Limits of univariate polynomials).  #emph[Suppose nonzero univariate polynomials $f_nu$ have uniformly bounded degrees and converge coefficientwise to a nonzero polynomial $f$. If all $f_nu$ have no zeros in $bb(H)$, neither does $f$. If all $f_nu$ are real-rooted, so is $f$. For monic real-rooted polynomials of a fixed degree, their ordered roots depend continuously on their coefficients.]
] <lem:mss-polynomial-limits>

#proof[
  For the first assertion choose $a in bb(H)$ with $f \( a \) eq.not 0$. Pass to a subsequence on which the degree is constant, and enumerate its roots $lambda_(nu \, 1) \, dots.h \, lambda_(nu \, e)$ with multiplicity. By compactness of the complex plane together with the point at infinity, a further subsequence makes every root converge, allowing infinite limits. Every finite limit lies outside $bb(H)$. In the factorization
  $ frac(f_nu \( z \), f_nu \( a \)) = product_(k = 1)^e frac(z - lambda_(nu \, k), a - lambda_(nu \, k)) \, $
  a root tending to infinity contributes a factor tending to $1$, and a root tending to a finite $lambda_k$ contributes $\( z - lambda_k \) \/ \( a - lambda_k \)$. The limiting identity factors $f \( z \) \/ f \( a \)$ with all its roots outside $bb(H)$. For real-rooted $f_nu$, the same proof uses the extended real line; all finite limiting roots are then real.
  For the last assertion, a bounded set of monic coefficient vectors has bounded roots. Indeed a root of $z^d + sum_(k < d) a_k z^k$ has absolute value at most $1 + max_k \| a_k \|$, as is seen by summing a geometric series when the opposite strict inequality holds. Any convergent subsequence of ordered root tuples factors the limiting polynomial. Its limiting tuple must therefore be the unique ordered root tuple of that polynomial. This proves continuity. ◻
]

#thm([Lemma 8.3.])[
  (Elementary stability operations).  #emph[The following assertions hold.]
  + #emph[If $A_1 \, dots.h \, A_m$ are Hermitian positive-semidefinite matrices and $C$ is Hermitian, then 
$ det (x I + C + sum_(i = 1)^m z_i A_i) $

 is real stable in $x \, z_1 \, dots.h \, z_m$. If $sum_i A_i$ is positive definite, then $det \( sum_i z_i A_i \)$ is also real stable.]
  + #emph[If $p$ is real stable, then $\( 1 - partial_i \) p$ is real stable.]
  + #emph[A nonzero univariate polynomial obtained by setting all but one variable of a real stable polynomial to real constants is real-rooted.]
] <lem:mss-stability>

#proof[
  For the first assertion, when all variables are in $bb(H)$, the imaginary part of the matrix is
  $ \( "Im" x \) I + sum_i \( "Im" z_i \) A_i succ 0 . $
  Such a matrix is nonsingular: a nonzero kernel vector would have a strictly positive imaginary part in its quadratic form, a contradiction. The same argument applies to the second determinant because $sum_i A_i succ 0$. For real arguments the matrices are Hermitian and their determinants are real; consequently the polynomial coefficients are real.
  For the second assertion, fix all arguments of $p$ in $bb(H)$, and regard $p$ as a polynomial in argument $i$ alone. This slice is nonzero, and its roots $alpha_k$ have nonpositive imaginary parts. If it is nonconstant, factorization gives
  $ frac(partial_i p, p) = sum_k frac(1, z_i - alpha_k) \, #h(2em) "Im" frac(partial_i p, p) < 0 . quad "(8.3)" $ <eq:mss-log-derivative-upper>
  If the slice is constant, the quotient is zero. In either case it cannot equal $1$, so $\( 1 - partial_i \) p$ is nonzero at this point. The operation preserves real coefficients.
  For the last assertion, replace each fixed real constant $a$ by $a + upright(i) eta$, $eta > 0$. The resulting univariate polynomials have no zeros in $bb(H)$ and converge coefficientwise to the stated nonzero real polynomial. Apply Lemma 16. ◻
]

=== 8.2 Expected characteristic polynomials <expected-characteristic-polynomials>

For positive-semidefinite Hermitian $d$-by-$d$ matrices $A_1 \, dots.h \, A_m$, define

$ mu \[ A_1 \, dots.h \, A_m \] \( x \) = (product_(i = 1)^m \( 1 - partial_(z_i) \)) det (x I_d + sum_(i = 1)^m z_i A_i)\|_(z_1 = dots.h.c = z_m = 0) . quad "(8.4)" $ <eq:mss-mixed-polynomial>

#thm([Lemma 8.4.])[
  (The expectation identity and real roots).  #emph[The polynomial in (8.4) is monic of degree $d$ and real-rooted. If $v_1 \, dots.h \, v_m$ are independent finitely supported random vectors and $A_i = bb(E) \[ v_i v_i^(*) \]$, then 
$ bb(E) det (x I_d - sum_(i = 1)^m v_i v_i^(*)) = mu \[ A_1 \, dots.h \, A_m \] \( x \) . quad "(8.5)" $ <eq:mss-expectation-identity>

]
] <lem:mss-expectation>

#proof[
  The determinant in (8.4) is stable by Lemma 17; applying all the operators preserves stability. Specializing all $z_i$ to zero leaves a nonzero real-rooted polynomial. To see directly both that it is nonzero and that it is monic of degree $d$, the coefficient of $x^d$ in the determinant is $1$, independent of the $z_i$, and every term involving at least one $z_i$ has smaller $x$-degree. The operations leave that leading coefficient unchanged. The specialization can be performed all at once by substituting $z_i = upright(i) eta$ and using Lemma 16.
  For the identity, let $M$ be any square matrix, let $v$ be a random vector, and put $A = bb(E) \[ v v^(*) \]$. The rank-one determinant identity and the derivative formula for the determinant give
  $ bb(E) det \( M - v v^(*) \) & = det M - "tr" \( "adj" \( M \) A \)\
 & = \( 1 - partial_z \) det \( M + z A \)\|_(z = 0) . $
  Here $"adj" \( M \)$ is the adjugate. These identities hold also for singular $M$: they are polynomial identities in its entries, or follow directly by multilinearity of the determinant in its columns. Apply this formula conditionally to $v_m$, then $v_(m - 1)$, and so forth. Independence keeps each covariance $A_i$ unchanged under conditioning. Finite sums, differentiation, and the specializations commute, giving (8.5). ◻
]

=== 8.3 Interlacing and the choice of an outcome <interlacing-and-the-choice-of-an-outcome>

For a monic real-rooted degree-$d$ polynomial $f$, write its roots as $lambda_1 \( f \) lt.eq dots.h.c lt.eq lambda_d \( f \)$, counting multiplicity. A finite collection of such polynomials has a #emph[common interlacing] if there are real numbers $c_1 lt.eq dots.h.c lt.eq c_(d - 1)$ such that

$ lambda_k \( f \) lt.eq c_k lt.eq lambda_(k + 1) \( f \) quad \( 1 lt.eq k < d \) $

for every polynomial in the collection.

#thm([Lemma 8.5.])[
  (An elementary interlacing criterion).  #emph[If every convex combination of finitely many monic degree-$d$ polynomials is real-rooted, they have a common interlacing. Consequently, for any probability weights on this collection, some polynomial of positive weight has largest root at most the largest root of the weighted average.]
] <lem:mss-common-interlacing>

#proof[
  First consider two members $p \, q$ and $r_t = \( 1 - t \) p + t q$, $0 lt.eq t lt.eq 1$. Fix a real $x$ that is not a root of either $p$ or $q$, and let $N \( t \)$ count the roots of $r_t$ strictly below $x$, with multiplicity. By ordered-root continuity, $N$ is locally constant wherever $r_t \( x \) eq.not 0$. The affine function $r_t \( x \)$ vanishes at most once. If it vanishes at $t_0 in \( 0 \, 1 \)$, then $b = q \( x \) - p \( x \) eq.not 0$.
  We claim that $x$ is a simple root of $r_(t_0)$. Otherwise let its multiplicity be $ell gt.eq 2$ and write
  $ r_(t_0) \( x + w \) = a w^ell + O \( w^(ell + 1) \) \, #h(2em) a eq.not 0 . $
  For $h$ tending to zero with fixed sign $sigma in { - 1 \, 1 }$,
  $ \| h \|^(- 1) r_(t_0 + h) #scale(x: 120%, y: 120%)[\(] x + \| h \|^(1 \/ ell) z #scale(x: 120%, y: 120%)[\)] arrow.r a z^ell + sigma b $
  coefficientwise. Every polynomial on the left is real-rooted; hence so is its nonzero limit by Lemma 16. For $ell = 2$, choose the sign so that $sigma b \/ a > 0$, obtaining two nonreal roots. For $ell gt.eq 3$, the equation $z^ell = - sigma b \/ a eq.not 0$ has nonreal roots for either sign. This contradiction proves the claim.
  Thus $N$ can change by at most one, at that single simple crossing. It follows that $\| N \( 0 \) - N \( 1 \) \| lt.eq 1$. If $lambda_k \( p \) > lambda_(k + 1) \( q \)$ for some $k < d$, one can choose $x$ strictly between these roots and avoiding all endpoint roots. Then $N \( 0 \) lt.eq k - 1$ and $N \( 1 \) gt.eq k + 1$, a contradiction. Applying this reasoning to every pair gives
  $ lambda_k \( p_i \) lt.eq lambda_(k + 1) \( p_j \) quad upright("for all ") i \, j upright(" and ") k < d . $
  Therefore $c_k = max_i lambda_k \( p_i \)$ is a common interlacing. This proof includes repeated roots because all interlacing inequalities are weak.
  For the last assertion discard zero-weight polynomials and denote the weighted average by $P$, with largest root $rho$. If $d = 1$, $rho$ is the weighted average of the individual roots, which proves the assertion. Otherwise put $c = c_(d - 1)$. Every $p_i \( c \) lt.eq 0$, since its first $d - 1$ roots are at most $c$ and its last root is at least $c$. Thus $P \( c \) lt.eq 0$, and, since $P$ is monic, $rho gt.eq c$. For each $x > rho$, $P \( x \) > 0$, so at least one $p_i \( x \) > 0$. Its first $d - 1$ roots are below $x$; positivity therefore implies $lambda_d \( p_i \) < x$. Taking the minimum over the finite collection and letting $x arrow.b rho$ proves $min_i lambda_d \( p_i \) lt.eq rho$. ◻
]

#thm([Lemma 8.6.])[
  (Selection from independent supports).  #emph[For independent finitely supported vectors $v_1 \, dots.h \, v_m$, some outcome of positive probability has largest eigenvalue of $sum_i v_i v_i^(*)$ at most the largest root of $mu \[ bb(E) v_1 v_1^(*) \, dots.h \, bb(E) v_m v_m^(*) \]$.]
] <lem:mss-selection>

#proof[
  Delete zero-probability support points. For a fixed choice of the first $k$ vectors, consider the expected characteristic polynomial over the remaining vectors. It is monic of degree $d$ and real-rooted by Lemma 18, treating the first $k$ vectors as deterministic. Its children are the conditional polynomials formed by fixing one further vector to each of its possible values.
  Every convex combination of these children is again real-rooted: it is the expected characteristic polynomial for the same family, with the next vector assigned the probabilities of that convex combination. Lemma 19 therefore lets us choose a positive-probability child whose largest root does not increase. Repeating for $k = 0 \, dots.h \, m - 1$ yields a complete outcome. The probability of that outcome is a product of finitely many positive support probabilities, so is positive. At the leaf, the polynomial is the characteristic polynomial of $sum_i v_i v_i^(*)$ and its largest root is the largest eigenvalue. ◻
]

=== 8.4 Barrier functions: a direct proof <barrier-functions-a-direct-proof>

For a real stable polynomial $p$, let

$ "Ab"_p = { z in bb(R)^m : p \( z + s \) > 0 upright(" for every ") s in \[ 0 \, oo \)^m } . $

Such a point is said to be #emph[above the roots]. At a point of this set define

$ Phi_p^i \( z \) = frac(partial_i p \( z \), p \( z \)) . $

The set $"Ab"_p$ is closed under adding a vector with nonnegative coordinates. The derivatives below are well defined locally because $p$ is positive at all the points under discussion.

#thm([Lemma 8.7.])[
  (Positive partial fractions).  #emph[Let $p$ be real stable, $z in "Ab"_p$, and let $i \, j$ be coordinate indices. As a rational function of $t$, 
$ Phi_p^i \( z + t e_j \) = c + sum_(ell = 1)^s frac(c_ell, t - lambda_ell) \, #h(2em) c gt.eq 0 \, quad c_ell > 0 \, quad lambda_ell < 0 \, quad "(8.6)" $ <eq:mss-positive-partial-fractions>

 where the sum may be empty. In particular, for $t gt.eq 0$ this function is nonnegative, nonincreasing, and convex.]
] <lem:mss-partial-fractions>

#proof[
  Set $h \( t \) = p \( z + t e_j \)$ and $a \( t \) = partial_i p \( z + t e_j \)$. The polynomial $h$ is real-rooted by Lemma 17, and is nonzero since $h \( 0 \) > 0$. It is positive on $\[ 0 \, oo \)$, so every root is strictly negative. Thus the real rational function $R = a \/ h$ has only negative real poles, after cancelling common factors.
  We next show that $"Im" R \( t \) lt.eq 0$ for $t in bb(H)$. In (8.3), use the point with argument $z_j + t$ in coordinate $j$ and argument $z_k + upright(i) eta$ in every other coordinate. All coordinates have positive imaginary parts, and the logarithmic derivative in direction $i$ has nonpositive imaginary part. Let $eta arrow.b 0$. Since $h \( t \) eq.not 0$ for $t in bb(H)$, the quotient converges to $R \( t \)$ and proves the desired inequality.
  Also $R \( t \) gt.eq 0$ for real $t gt.eq 0$. Indeed $g \( s \) = p \( z + t e_j + s e_i \)$ is a nonzero real-rooted polynomial, positive for $s gt.eq 0$. Factoring it with its negative real roots $beta_k$ gives
  $ R \( t \) = frac(g' \( 0 \), g \( 0 \)) = sum_k frac(1, - beta_k) gt.eq 0 \; $
  the empty sum covers a constant $g$.
  It remains to classify this rational function, which can be done directly. At a pole $lambda$ of order $b gt.eq 1$, let its highest principal part be $a_0 \( t - lambda \)^(- b)$, with $a_0 eq.not 0$ real. At $t = lambda + r exp \( upright(i) theta \)$, as $r arrow.b 0$, the leading imaginary part is $- a_0 r^(- b) sin \( b theta \)$. For $b gt.eq 2$ this has both signs for $0 < theta < pi$, contradicting $"Im" R lt.eq 0$. Hence every pole is simple, and the same inequality for $b = 1$ forces its residue to be positive.
  Subtract these simple principal parts. The remainder is a real polynomial. If its degree were at least two, its leading term along large rays $t = r exp \( upright(i) theta \)$ would again have imaginary parts of both signs; the subtracted fractions are $O \( 1 \/ r \)$ and cannot affect this conclusion. Thus the remainder has degree at most one, and a linear remainder must have nonpositive slope. The inequality $R \( t \) gt.eq 0$ for all real $t gt.eq 0$ rules out a negative slope and forces its constant term to be nonnegative. This proves (8.6).
  Finally, direct differentiation on $t gt.eq 0$ gives
  $ R' \( t \) = - sum_ell frac(c_ell, \( t - lambda_ell \)^2) lt.eq 0 \, #h(2em) R'' \( t \) = 2 sum_ell frac(c_ell, \( t - lambda_ell \)^3) gt.eq 0 . $
  Together with $R \( t \) gt.eq 0$, these are the asserted properties. ◻
]

#thm([Lemma 8.8.])[
  (One barrier shift).  #emph[Let $p$ be real stable, let $z in "Ab"_p$, and suppose $delta > 0$ satisfies 
$ Phi_p^j \( z \) + 1 / delta lt.eq 1 . quad "(8.7)" $ <eq:mss-shift-hypothesis>

 For $q = \( 1 - partial_j \) p$ and $w = z + delta e_j$, one has $w in "Ab"_q$ and 
$ Phi_q^i \( w \) lt.eq Phi_p^i \( z \) #h(2em) upright("for every ") i . quad "(8.8)" $ <eq:mss-shift-conclusion>

]
] <lem:mss-barrier-shift>

#proof[
  The polynomial $q$ is real stable by Lemma 17. Applying the monotonicity in Lemma 21 successively in each coordinate, for every vector $s gt.eq 0$ we have
  $ Phi_p^j \( z + s \) lt.eq Phi_p^j \( z \) lt.eq 1 - 1 \/ delta < 1 . $
  It follows that $q \( z + s \) = p \( z + s \) \( 1 - Phi_p^j \( z + s \) \) > 0$. Thus $z$, and therefore also $w$, belongs to $"Ab"_q$.
  Fix $i$ and put $f \( t \) = Phi_p^i \( z + t e_j \)$. Commuting the mixed derivatives of $log p$ in a neighborhood of $w$ gives
  $ Phi_q^i \( w \) = f \( delta \) - frac(f' \( delta \), 1 - Phi_p^j \( w \)) . $
  By monotonicity, the denominator is at least $1 \/ delta$, and $f' \( delta \) lt.eq 0$. By convexity, $f \( 0 \) gt.eq f \( delta \) - delta f' \( delta \)$; this also follows by integrating the nondecreasing derivative on $\[ 0 \, delta \]$. Therefore
  $ Phi_q^i \( w \) lt.eq f \( delta \) - delta f' \( delta \) lt.eq f \( 0 \) = Phi_p^i \( z \) \, $
  as required. ◻
]

=== 8.5 The largest-root bound and conclusion <the-largest-root-bound-and-conclusion>

#thm([Lemma 8.9.])[
  (Largest root of the mixed polynomial).  #emph[If $A_i succ.curly.eq 0$, $sum_i A_i = I_d$, and $"tr" A_i lt.eq epsilon.alt$ for every $i$, where $epsilon.alt > 0$, then the largest root of $mu \[ A_1 \, dots.h \, A_m \]$ is at most $\( 1 + sqrt(epsilon.alt) \)^2$.]
] <lem:mss-root-bound>

#proof[
  Let
  $ p_0 \( y \) = det (sum_(i = 1)^m y_i A_i) \, #h(2em) p_j = \( 1 - partial_(y_j) \) p_(j - 1) quad \( 1 lt.eq j lt.eq m \) . $
  The first polynomial is real stable by Lemma 17, since $sum_i A_i = I_d$. Moreover,
  $ mu \[ A_1 \, dots.h \, A_m \] \( x \) = p_m \( x \, dots.h \, x \) . quad "(8.9)" $ <eq:mss-diagonal-identity>
  To check this identity, substitute $y_i = x + z_i$ before applying the operators. Then $sum_i y_i A_i = x I_d + sum_i z_i A_i$, $partial_(y_i)$ acts as $partial_(z_i)$, and setting every $z_i = 0$ is exactly (8.4).
  Set
  $ t = epsilon.alt + sqrt(epsilon.alt) \, #h(2em) delta = 1 + sqrt(epsilon.alt) \, #h(2em) phi = epsilon.alt / t = 1 - 1 / delta . $
  At $z^(\( 0 \)) = t upright(bold(1))$, the matrix in $p_0$ is $t I_d$. Adding nonnegative coordinates adds a positive-semidefinite matrix, so $z^(\( 0 \)) in "Ab"_(p_0)$. Differentiating the determinant gives, for every $i$,
  $ Phi_(p_0)^i \( z^(\( 0 \)) \) = "tr" \( \( t I_d \)^(- 1) A_i \) lt.eq epsilon.alt / t = phi . $
  Inductively define $z^(\( j \)) = t upright(bold(1)) + delta \( e_1 + dots.h.c + e_j \)$. Suppose $z^(\( j - 1 \)) in "Ab"_(p_(j - 1))$ and all its barriers are at most $phi$. Because $phi + 1 \/ delta = 1$, Lemma 22 applies in direction $j$ and yields $z^(\( j \)) in "Ab"_(p_j)$, with all its barriers still at most $phi$. This proves the induction for every $j$.
  At the end, $z^(\( m \)) = \( t + delta \) upright(bold(1))$ is above the roots of $p_m$. By (8.9), the mixed polynomial is positive for every real $x gt.eq t + delta$. It is real-rooted by Lemma 18; hence its largest root is at most
  $ t + delta = epsilon.alt + 2 sqrt(epsilon.alt) + 1 = \( 1 + sqrt(epsilon.alt) \)^2 . $
  ◻
]

#proof[
  Put $A_i = bb(E) \[ v_i v_i^(*) \]$. These matrices are Hermitian positive semidefinite, and (8.1) says that $sum_i A_i = I_d$ and $"tr" A_i = bb(E) parallel v_i parallel^2 lt.eq epsilon.alt$. Lemma 23 bounds the largest root of their mixed polynomial by $\( 1 + sqrt(epsilon.alt) \)^2$. Lemma 20 then supplies an outcome of positive probability whose largest eigenvalue obeys the same bound. The matrix $sum_i v_i v_i^(*)$ is positive semidefinite, so this largest eigenvalue is its operator norm. This proves (8.2). ◻
]

== 9 Proof of the polynomial hierarchy bound <app:hierarchy-proof>

We prove Theorem 7 by the dual and geometric method of Anari and Oveis Gharan #cite(label("AOG")). Lemma 24 reduces the matrix bound to an inequality for binary embeddings. Proposition 30 captures the relevant boundary sums in geometric families of balls; Propositions 31 and 33 bound their total radii by graph length. Section 9.5 then chooses the parameters.

In this appendix, $X$ denotes a vertex embedding, with columns $X_v$, so $X b_e = X_u - X_v$ for an oriented edge $e = u v$. We index hierarchy nodes by $t$, write $V \( t \)$ for the corresponding vertex set, and write $t^(*)$ for the parent of a nonroot node. Thus $P \( t \) = delta_G \( V \( t \) \)$ and $O \( t \) = E_G \( V \( t \) \, V \( t^(*) \) \\ V \( t \) \)$.

=== 9.1 The dual reduction for a hierarchy <app:hierarchy-dual>

This section proves the matrix-to-embedding reduction needed for the hierarchy estimate. The marked nodes may be any subset of the nonroot nodes. In fact, the only hierarchical property used in this reduction is that an edge belongs to at most two of the sets $O \( t \)$.

Let $G = \( V \, E \)$ be a connected loopless multigraph, with $n = \| V \| gt.eq 2$ and $m = \| E \|$. Fix an orientation of every edge, write $b_e$ for its incidence column, and put

$ B = \[ b_e \]_(e in E) \, #h(2em) L_G = B B^(sans(T)) \, #h(2em) cal(C) = { S : diameter eq.not S subset.neq V } \, #h(2em) d_S = \| delta_G \( S \) \| . $

Thus $d_S = upright(bold(1))_S^(sans(T)) L_G upright(bold(1))_S > 0$ for $S in cal(C)$. Let $cal(M)$ be the set of marked nodes, and assume that $O \( t \) eq.not diameter$ for $t in cal(M)$. Define the value of the shortcut program by an infimum:

$ p_(*) = inf_(D succ 0\
upright(bold(1))_S^(sans(T)) D upright(bold(1))_S lt.eq d_S med \( S in cal(C) \)) med max_(t in cal(M)) frac(1, \| O \( t \) \|) sum_(e in O \( t \)) b_e^(sans(T)) D^(- 1) b_e . quad "(9.1)" $ <hd:primal>

Here and throughout this section, $D succ 0$ means positive definite on the full space $bb(R)^V$. No constraint for $S = V$ is imposed. When $cal(M) = diameter$, set the objective and $p_(*)$ equal to zero.

For a binary matrix $X in { 0 \, 1 }^(h times V)$, let

$ cal(E) \( X \) = sum_(e in E) parallel X b_e parallel_2^2 . $

A matrix $U in bb(R)^(E times h)$ will be called #emph[row semiorthogonal] if $U U^(sans(T)) = I_m$; its row indexed by $e$ is denoted by $u_e^(sans(T))$. Thus the vectors $u_e in bb(R)^h$ are orthonormal, and this convention requires $h gt.eq m$. The dimension $h$ is otherwise arbitrary. Zero rows can always be added to $X$.

#thm([Lemma 9.1.])[
  (Dual reduction).  #emph[With the preceding notation, set 
$ Q_(*) = sup_(h gt.eq m \, med X in { 0 \, 1 }^(h times V) \, med cal(E) \( X \) > 0\
U in bb(R)^(E times h) \, med U U^(sans(T)) = I_m) frac(sum_(t in cal(M)) frac(1, \| O \( t \) \|) (sum_(e in O \( t \)) chevron.l u_e \, X b_e chevron.r)^2, cal(E) \( X \)) . quad "(9.2)" $ <hd:ratio>

 Then 
$ p_(*) lt.eq Q_(*) lt.eq 2 p_(*) . quad "(9.3)" $ <hd:comparison>

 Consequently, if every ratio in (9.2) is at most $K$, then for every $eta > 0$ there is a full positive definite matrix $D$ satisfying all the cut constraints in (9.1) and all the marked-node average-resistance bounds with right side $K + eta$.]
] <lem:hierarchy-dual>

#proof[
  The assertion for an empty marked set follows by taking a sufficiently small positive multiple of the identity, so assume $cal(M) eq.not diameter$. We give the finite-dimensional duality argument as well as the matrix and embedding steps.
  ===== 9.1.1 Separation in finite dimension. <separation-in-finite-dimension.>
  We use the following elementary geometric fact: if $cal(U)$ is a nonempty open convex subset of a Euclidean space and $a in.not cal(U)$, there is a nonzero vector $v$ such that $chevron.l v \, x - a chevron.r gt.eq 0$ for every $x in cal(U)$. Here is a proof. Choose $y in cal(U)$ and put $a_j = a + \( a - y \) \/ j$. None of the points $a_j$ belongs to $K = overline(cal(U))$. Otherwise $a$, being a strict convex combination of $y in cal(U)$ and $a_j in K$, would belong to $cal(U)$: an open ball about $y$, convexly combined with points of $cal(U)$ approaching $a_j$, gives an open ball about $a$ in $cal(U)$. Choose a nearest point $z_j in K$ to $a_j$. Such a point exists by minimizing distance on a sufficiently large closed ball. Convexity and differentiation of squared distance along the segment from $z_j$ to any $x in K$ give
  $ chevron.l z_j - a_j \, x - z_j chevron.r gt.eq 0 . $
  Hence, for $v_j = \( z_j - a_j \) \/ parallel z_j - a_j parallel_2$, $chevron.l v_j \, x - a_j chevron.r gt.eq parallel z_j - a_j parallel_2 gt.eq 0$. A convergent subsequence of the unit vectors $v_j$ has a unit limit $v$, which has the stated property since $a_j arrow.r a$.
  ===== 9.1.2 Strong duality for this program. <strong-duality-for-this-program.>
  Put
  $ A_t = frac(1, \| O \( t \) \|) sum_(e in O \( t \)) b_e b_e^(sans(T)) \, #h(2em) f_t \( D \) = "tr" \( A_t D^(- 1) \) \, #h(2em) g_S \( D \) = upright(bold(1))_S^(sans(T)) D upright(bold(1))_S - d_S . $
  Each $f_t$ is convex on $D succ 0$. Indeed, completing the square gives
  $ b^(sans(T)) D^(- 1) b = sup_(x in bb(R)^V) #scale(x: 120%, y: 120%)[\(] 2 b^(sans(T)) x - x^(sans(T)) D x #scale(x: 120%, y: 120%)[\)] \, $
  a supremum of affine functions of $D$. The functions $g_S$ are affine. Choose
  $ 0 < epsilon_0 < min_(S in cal(C)) frac(d_S, \| S \|) \, #h(2em) D_0 = epsilon_0 I . $
  Then all cut constraints are strict at $D_0$. In particular $0 lt.eq p_(*) < oo$.
  Consider the open convex set of vectors $\( a \, b \, s \)$ for which there are $D succ 0$ and $r in bb(R)$ such that
  $ f_t \( D \) - r < a_t quad \( t in cal(M) \) \, #h(2em) g_S \( D \) < b_S quad \( S in cal(C) \) \, #h(2em) r < s . $
  The point $\( 0 \, 0 \, p_(*) \)$ is outside this set, since membership would give a feasible $D$ with every $f_t \( D \) < p_(*)$. The separation fact just proved therefore supplies nonzero coefficients $\( lambda \, y \, alpha \)$ such that
  $ lambda dot.op a + y dot.op b + alpha s gt.eq alpha p_(*) $
  throughout the set. Each coefficient is nonnegative, because any one coordinate of a point in the set can be increased arbitrarily. Moreover $alpha > 0$. To see this, choose $r_0 > max_t f_t \( D_0 \)$; there is then a point of the set with all the $a_t$ and $b_S$ negative. If $alpha = 0$, this would contradict the separation inequality and the nonzero, nonnegative vector $\( lambda \, y \)$. Normalize $alpha = 1$ and take limits down to the displayed strict inequalities. For every $D succ 0$ and every $r in bb(R)$ this gives
  $ sum_t lambda_t f_t \( D \) + sum_S y_S g_S \( D \) + (1 - sum_t lambda_t) r gt.eq p_(*) . $
  Since $r$ is unrestricted, $sum_t lambda_t = 1$.
  For any nonnegative $lambda$ with this sum and any $y gt.eq 0$, weak duality gives the reverse bound: at a feasible $D$, the weighted objective plus the weighted constraint residuals is at most $max_t f_t \( D \)$. Consequently, writing
  $ A \( lambda \) = sum_t lambda_t A_t \, #h(2em) Z \( y \) = sum_(S in cal(C)) y_S upright(bold(1))_S upright(bold(1))_S^(sans(T)) \, #h(2em) d \( y \) = sum_(S in cal(C)) y_S d_S \, $
  we have proved
  $ p_(*) = sup_(lambda gt.eq 0 \, med sum_t lambda_t = 1\
y gt.eq 0) inf_(D succ 0) {"tr" \( A \( lambda \) D^(- 1) \) + "tr" \( Z \( y \) D \) - d \( y \)} . quad "(9.4)" $ <hd:lagrange>
  This argument neither assumes attainment of the primal infimum nor requires a uniform positive lower bound on the eigenvalues of its feasible matrices.
  ===== 9.1.3 The matrix infimum, including singular matrices. <the-matrix-infimum-including-singular-matrices.>
  For any symmetric positive semidefinite $A \, Z$, we claim that
  $ inf_(D succ 0) { "tr" \( A D^(- 1) \) + "tr" \( Z D \) #scale(x: 120%, y: 120%)[}] = 2 "tr" #scale(x: 120%, y: 120%)[\(] \( Z^(1 \/ 2) A Z^(1 \/ 2) \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] . quad "(9.5)" $ <hd:matrix-inf>
  First suppose $A \, Z succ 0$, and set $H = Z^(1 \/ 2) D Z^(1 \/ 2)$ and $C = Z^(1 \/ 2) A Z^(1 \/ 2)$. The difference between the left-hand objective and $2 "tr" \( C^(1 \/ 2) \)$ equals
  $ "tr" \( C H^(- 1) \) + "tr" \( H \) - 2 "tr" \( C^(1 \/ 2) \) = parallel H^(- 1 \/ 2) C^(1 \/ 2) - H^(1 \/ 2) parallel_(upright(F))^2 gt.eq 0 . $
  It is zero when $H = C^(1 \/ 2)$, proving the identity in this case. For general $A \, Z succ.curly.eq 0$, replace them temporarily by $A_epsilon = A + epsilon I$ and $Z_epsilon = Z + epsilon I$. The positive definite identity, applied at any fixed $D$, and then continuity of positive semidefinite square roots give the lower bound in (9.5) as $epsilon arrow.b 0$. Conversely, the unperturbed objective is at most the perturbed objective at every $D$, so its infimum is at most the known perturbed infimum. Letting $epsilon arrow.b 0$ gives the upper bound. Continuity here also follows directly from the spectral theorem: along a convergent sequence of positive semidefinite matrices their square roots are bounded, and every convergent subsequence of these square roots has the unique positive semidefinite square root of the limit as its limit. These perturbations prove an auxiliary matrix identity; they do not change the allowed dual multipliers.
  For fixed $lambda \, y$, abbreviate the trace of the square root in (9.5) by $N \( lambda \, y \)$. If $y eq.not 0$, then $d \( y \) > 0$. Scaling $y$ by $s gt.eq 0$ changes the dual value to $2 sqrt(s) thin N \( lambda \, y \) - s thin d \( y \)$, whose supremum over $s gt.eq 0$ is $N \( lambda \, y \)^2 \/ d \( y \)$. The case $y = 0$ contributes zero. Thus (9.4) becomes
  $ p_(*) = sup_(lambda gt.eq 0 \, med sum_t lambda_t = 1\
y gt.eq 0 \, med y eq.not 0) frac(N \( lambda \, y \)^2, d \( y \)) . quad "(9.6)" $ <hd:homogeneous>
  ===== 9.1.4 From weighted cuts to binary coordinates. <from-weighted-cuts-to-binary-coordinates.>
  Let $W = W \( lambda \)$ be the diagonal $E times E$ matrix with entries
  $ w_e = (sum_(t in cal(M) : med e in O \( t \)) frac(lambda_t, \| O \( t \) \|))^(1 \/ 2) . quad "(9.7)" $ <hd:weights>
  Then $A \( lambda \) = B W^2 B^(sans(T))$. If a matrix $Y$ has rows $sqrt(y_S) thin upright(bold(1))_S^(sans(T))$, then $Y^(sans(T)) Y = Z \( y \)$. The matrices $Z \( y \)^(1 \/ 2) A \( lambda \) Z \( y \)^(1 \/ 2)$ and $W B^(sans(T)) Z \( y \) B W$ have the same nonzero eigenvalues: they are the two products $T T^(sans(T))$ and $T^(sans(T)) T$ with $T = Z \( y \)^(1 \/ 2) B W$. It follows that
  $ N \( lambda \, y \) = parallel Y B W parallel_(*) \, #h(2em) d \( y \) = sum_(e in E) parallel Y b_e parallel_2^2 \, $
  where $parallel M parallel_(*)$ denotes the sum of the singular values of $M$.
  For fixed $lambda$, the ratio in (9.6) is continuous in $y gt.eq 0$, $y eq.not 0$. Approximate $y$ by nonzero nonnegative rational vectors. For rational $y$, choose a positive integer $q$ with every $q y_S$ integral and form a binary matrix $X$ by repeating the row $upright(bold(1))_S^(sans(T))$ exactly $q y_S$ times. Then $X^(sans(T)) X = q Z \( y \)$, and both the squared numerator and the denominator in the ratio acquire the same factor $q$. Conversely, any binary $X$ gives integral cut multiplicities after its constant rows are discarded. Constant rows contribute zero to $X B$, so they have no effect on the ratio. Adding zero rows permits $h gt.eq m$. These observations prove the exact identity
  $ p_(*) = sup_(h gt.eq m \, med X in { 0 \, 1 }^(h times V) \, med cal(E) \( X \) > 0\
lambda gt.eq 0 \, med sum_t lambda_t = 1) frac(parallel X B W \( lambda \) parallel_(*)^2, cal(E) \( X \)) . quad "(9.8)" $ <hd:binary-nuclear>
  The limiting argument takes a supremum over all finite dimensions; it asserts no exact finite binary representation for irrational cut weights.
  ===== 9.1.5 Orthonormal edge vectors and the factor two. <orthonormal-edge-vectors-and-the-factor-two.>
  For any $h times m$ matrix $M$ with $h gt.eq m$, singular-value decomposition gives
  $ parallel M parallel_(*) = max_(U U^(sans(T)) = I_m) "tr" \( U M \) . quad "(9.9)" $ <hd:polar>
  Indeed, write $M = P Sigma V^(sans(T))$ with $P^(sans(T)) P = I_m$, $V$ orthogonal, and $Sigma$ diagonal nonnegative; zero singular values can be included by completing the columns of $P$. For any admissible $U$, each diagonal entry of $V^(sans(T)) U P$ is at most one, giving the upper bound $"tr" \( U M \) lt.eq "tr" \( Sigma \)$. The choice $U = V P^(sans(T))$ attains it.
  Write $a_e = chevron.l u_e \, X b_e chevron.r$. Individual rows of $U$ can be multiplied by $- 1$ while preserving $U U^(sans(T)) = I_m$. Consequently, when taking either the supremum in (9.2) or the supremum of the squared trace in (9.9), we may restrict to $a_e gt.eq 0$ for all $e$: replacing $a_e$ by $\| a_e \|$ cannot decrease either expression. Equation (9.8) therefore says
  $ p_(*) = sup_(X \, U \, lambda) frac((sum_e w_e a_e)^2, cal(E) \( X \)) \, #h(2em) a_e gt.eq 0 \, quad "(9.10)" $ <hd:weighted-rows>
  with the other conditions on $X \, U \, lambda$ as above.
  Every edge belongs to at most two parent boundaries $O \( t \)$: if its endpoints have lowest common ancestor $s$, only the two children of $s$ containing its respective endpoints can have that edge in their parent boundary. Restricting to marked nodes preserves this property. Hence, on putting
  $ v_e = sum_(t in cal(M) : med e in O \( t \)) sqrt(lambda_t \/ \| O \( t \) \|) \, $
  the elementary inequalities between the Euclidean norm and the sum of at most two nonnegative numbers give $w_e lt.eq v_e lt.eq sqrt(2) thin w_e$. Because $a_e gt.eq 0$,
  $ (sum_e w_e a_e)^2 lt.eq (sum_e v_e a_e)^2 lt.eq 2 (sum_e w_e a_e)^2 . quad "(9.11)" $ <hd:overlap>
  For fixed $X \, U$, let
  $ c_t = 1 / sqrt(\| O \( t \) \|) sum_(e in O \( t \)) a_e gt.eq 0 . $
  Then $sum_e v_e a_e = sum_t sqrt(lambda_t) thin c_t$. Cauchy–Schwarz, with equality at $lambda_t = c_t^2 \/ sum_s c_s^2$ when the denominator is nonzero, shows that
  $ max_(lambda gt.eq 0 \, med sum_t lambda_t = 1) (sum_e v_e a_e)^2 = sum_t c_t^2 . $
  The identity is also valid when all $c_t$ vanish. Taking suprema in (9.11) and using (9.10) proves $p_(*) lt.eq Q_(*) lt.eq 2 p_(*)$. Finally, if $Q_(*) lt.eq K$, the defining property of the finite infimum $p_(*)$ supplies a feasible $D succ 0$ whose maximum marked average is less than $p_(*) + eta lt.eq K + eta$. ◻
]

===== 9.1.6 Dimension and orientation conventions. <dimension-and-orientation-conventions.>

The ratio does not depend on the chosen edge orientations, since a reversed $b_e$ can be accompanied by a reversed $u_e$. Our use of arbitrarily large $h$ also covers the other usual rectangular semiorthogonal convention. If $h < m$ and an $m times h$ matrix has orthonormal columns, complete its columns to an $m times m$ orthogonal matrix and append $m - h$ zero rows to $X$. Every edge inner product and the denominator are preserved. More generally, any matrix with $U U^(sans(T)) prec.curly.eq I_m$ can be enlarged to the row semiorthogonal matrix

$ #scale(x: 120%, y: 120%)[\[] thin U quad \( I_m - U U^(sans(T)) \)^(1 \/ 2) thin #scale(x: 120%, y: 120%)[\]] $

by appending $m$ zero rows to $X$, again preserving the ratio.

=== 9.2 From the dual numerator to bags of balls <hb:section>

We give the geometric construction with explicit losses. No boundary ratio or connectivity assumption is used in this construction; those assumptions enter the subsequent charging estimates. Throughout this subsection, $cal(T)$ is a hierarchy of a finite graph $G = \( V \, E \)$, $X_v in { 0 \, 1 }^d$, and $U : bb(R)^d arrow.r bb(R)^E$ is a linear contraction. For an oriented edge $e = u v$, put

$ X_e = X_u - X_v \, #h(2em) a_e = chevron.l u_e \, X_e chevron.r \, #h(2em) d_e = parallel X_e parallel_2^2 = parallel X_e parallel_1 . $

Here $u_e^(sans(T))$ is row $e$ of $U$. We assume $a_e gt.eq 0$; multiplying individual rows by signs preserves contraction and replaces each $a_e$ by $\| a_e \|$, which can only increase every squared boundary sum under consideration. In particular $a_e^2 lt.eq d_e$. An edge is counted with its multiplicity and occurs in at most two sets $O \( t \)$.

#prodef([Definition 9.2.])[
  (Balls, bags, and geometric sequences).  Set $Q = \[ 0 \, 1 \]^d$ and
  $ B_Q \( x \, r \) = { y in Q : parallel y - x parallel_1 < r } #h(2em) \( r > 0 \) . $
  A #emph[bag] is a nonempty collection of pairwise disjoint such balls, all of the same radius and with centers among the $X_v$. Its type is $\( delta \)$ when that radius is $delta$, and its type is $\( delta \, Delta \)$ when, in addition, all distances between its centers are at most $Delta$. Its size $\| upright("Bag") \|$ is its number of balls. For $beta > 1$, a bag of type $\( delta \, Delta \)$ is #emph[$beta$-compact] if
  $ \| upright("Bag") \| gt.eq 2 \, #h(2em) beta Delta lt.eq delta \| upright("Bag") \| . $
  The midpoint of two centers belongs to $Q$, so disjoint radius-$delta$ balls have centers at distance at least $2 delta$. Hence a compact bag has $Delta gt.eq 2 delta$.
  A bag of radius $delta$ is #emph[$eta$-assigned to $t$] if
  $ \| upright("Bag")_t \| gt.eq eta \| O \( t \) \| \, $
  and every ball has a center $X_u$ with $u in V \( t \)$ and an edge $u v in O \( t \)$ such that $d_(u v) < delta$. A #emph[family] of bags is nonempty, and all balls in all its bags are mutually disjoint. A compact family has type $\( delta \, Delta \)$ when its bags have that common type. An assigned family has type $\( delta \, T \)$ when its bags are assigned to distinct nodes in $T$ and have radius $delta$.
  For $0 < lambda < 1$, a sequence of compact families of types $\( delta_i \, Delta_i \)$ is #emph[$lambda$-geometric] if $Delta_(i + 1) < lambda delta_i$ for all successive families. A sequence of assigned families of types $\( delta_i \, T_i \)$ is $lambda$-geometric if $delta_(i + 1) < lambda delta_i$ and the sets $T_i$ are pairwise disjoint. Its #emph[mass] is
  $ sans(M) = sum_i delta_i sum_(upright("Bag") in cal(F)_i) \| upright("Bag") \| . $
] <hb:definitions>

==== 9.2.1 Spectral packing <hb:spectral-subsection>

We first prove the geometric estimate underlying the construction of bags. It is the spectral packing statement of #cite(label("AOG")) Lemma 6.4; the argument below gives a logarithmic bound and chooses the radius explicitly. Here a Euclidean ball of #emph[squared radius] $r$ means

$ cal(B)_2 \( y \, r \) = { z : parallel z - y parallel_2^2 lt.eq r } . $

In particular, two such closed balls are disjoint when their centers are at distance strictly greater than $2 sqrt(r)$.

#thm([Lemma 9.3.])[
  (Spectral packing).  #emph[Let $F$ be a nonempty set of oriented edges of a finite multigraph with edge set $E$, and put $m = \| F \|$. For points $Y_v in bb(R)^E$, write $Y_e = Y_u - Y_v$ when $e = \( u \, v \)$, and denote the $e$-coordinate of $Y_e$ by $Y_(e \, e)$. Suppose that $a > 0$ and 
$ Upsilon := (1 / m sum_(e in F) Y_(e \, e))^2 > 0 \, #h(2em) Upsilon gt.eq a / m sum_(e in F) parallel Y_e parallel_2^2 . quad "(9.12)" $ <hb:spectral-assumption>

 Then $a lt.eq 1$, and there are $b gt.eq 2$ pairwise disjoint Euclidean balls of one positive squared radius $r$, centered at images of endpoints of edges in $F$, such that 
$ b gt.eq frac(a m, 16) \, #h(2em) b r gt.eq frac(9 m Upsilon, 512 #scale(x: 120%, y: 120%)[\(] 5 + log_2 \( 1 \/ a \) #scale(x: 120%, y: 120%)[\)]^2) . quad "(9.13)" $ <hb:spectral-logarithmic>

 Consequently, for every $0 < epsilon < 1 \/ 3$, the choice 
$ C_1 \( epsilon \) = 1024 / epsilon^2 quad "(9.14)" $ <hb:spectral-constant>

 gives 
$ b gt.eq frac(a \| F \|, C_1 \( epsilon \)) \, #h(2em) b r gt.eq frac(a^epsilon Upsilon \| F \|, C_1 \( epsilon \)) . quad "(9.15)" $ <hb:spectral-conclusion>

]
] <hb:spectral-packing>

#proof[
  The scalar Cauchy–Schwarz inequality gives
  $ Upsilon lt.eq 1 / m sum_(e in F) Y_(e \, e)^2 lt.eq 1 / m sum_(e in F) parallel Y_e parallel_2^2 . $
  The last quantity is positive, so the assumption implies $a lt.eq 1$.
  #emph[The matrix estimate.] Let $P_F : bb(R)^E arrow.r bb(R)^F$ be coordinate restriction, and form the $m$-by-$m$ matrix $A$ whose column indexed by $e in F$ is $P_F Y_e$. Set $tau = m sqrt(Upsilon)$. The singular values $sigma_1 gt.eq dots.h.c gt.eq sigma_m gt.eq 0$ of $A$ satisfy
  $ sum_(i = 1)^m sigma_i gt.eq \| "tr" A \| = tau \, #h(2em) sum_(i = 1)^m sigma_i^2 = parallel A parallel_F^2 lt.eq frac(tau^2, a m) . quad "(9.16)" $ <hb:spectral-matrix-bounds>
  Indeed, writing a singular value decomposition as $A = sum_i sigma_i u_i v_i^(sans(T))$, the trace is $sum_i sigma_i chevron.l u_i \, v_i chevron.r$, whose absolute value is at most $sum_i sigma_i$. The Frobenius norm identity follows from orthonormality, and its upper bound follows from (9.12) and the fact that coordinate restriction does not increase a vector’s norm.
  We will also use the following rank approximation inequality: for $0 lt.eq k lt.eq m$ and any matrix $C$ of rank at most $k$,
  $ parallel A - C parallel_F^2 gt.eq sum_(i = k + 1)^m sigma_i^2 . quad "(9.17)" $ <hb:spectral-rank-bound>
  For completeness, let $Q$ be orthogonal projection onto the column space of $C$. Since $\( I - Q \) C = 0$, orthogonal projection and the singular value decomposition give
  $ parallel A - C parallel_F^2 gt.eq parallel \( I - Q \) A parallel_F^2 = sum_(i = 1)^m sigma_i^2 #scale(x: 120%, y: 120%)[\(] 1 - parallel Q u_i parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  The numbers $w_i = parallel Q u_i parallel_2^2$ lie in $\[ 0 \, 1 \]$, and $sum_i w_i = "rank" Q lt.eq k$. Because the $sigma_i^2$ are nonincreasing, $sum_i sigma_i^2 w_i lt.eq sum_(i = 1)^k sigma_i^2$: moving available weight from a later index to an earlier index never decreases this weighted sum, and its maximum therefore puts weight one on the first $k$ indices. This proves (9.17), including $k = 0$.
  #emph[Selecting a singular-value tail.] Define
  $ p_0 = ⌊frac(a m, 16)⌋ + 1 \, #h(2em) T_p = sum_(i = p)^m sigma_i^2 quad \( 1 lt.eq p lt.eq m \) . $
  We have $1 lt.eq p_0 lt.eq m$. By (9.16),
  $ sum_(i < p_0) sigma_i lt.eq sqrt(\( p_0 - 1 \) sum_i sigma_i^2) lt.eq tau / 4 . $
  The sum is zero when $p_0 = 1$, so this also covers arbitrarily small $a m$. It follows that
  $ sum_(i = p_0)^m sigma_i gt.eq frac(3 tau, 4) . quad "(9.18)" $ <hb:spectral-surviving-sum>
  Partition the integer interval $\[ p_0 \, m \]$ into the nonempty blocks
  $ I_j = { 2^j p_0 \, dots.h \, min \( 2^(j + 1) p_0 - 1 \, m \) } \, #h(2em) 0 lt.eq j < L \, $
  where
  $ L = 1 + ⌊log_2 m / p_0⌋ lt.eq 5 + log_2 \( 1 \/ a \) . $
  For the first index $p = 2^j p_0$ of a block, its cardinality is at most $p$. Cauchy–Schwarz therefore gives
  $ sum_(i in I_j) sigma_i lt.eq sqrt(p T_p) . $
  Summing this inequality and using (9.18), one of these first indices $p$ satisfies
  $ p gt.eq p_0 > frac(a m, 16) \, #h(2em) p T_p gt.eq frac(9 tau^2, 16 L^2) > 0 . quad "(9.19)" $ <hb:spectral-large-tail>
  #emph[Selecting the balls at an explicit radius.] Fix the positive number
  $ r = frac(T_p, 32 m) . quad "(9.20)" $ <hb:spectral-radius>
  Scan the endpoint images of edges in $F$, keeping a point precisely when its distance from every previously kept point is greater than $2 sqrt(r)$. This finite procedure produces centers $Y_(w_1) \, dots.h \, Y_(w_b)$ for pairwise disjoint closed balls of squared radius $r$. Its maximality also ensures that each endpoint image $Y_v$ lies within distance $2 sqrt(r)$ of one of the centers; choose such a center and call its vertex $c \( v \)$.
  If $b lt.eq p$, define a matrix $C$ by
  $ C_e = P_F #scale(x: 120%, y: 120%)[\(] Y_(c \( u \)) - Y_(c \( v \)) #scale(x: 120%, y: 120%)[\)] #h(2em) \( e = \( u \, v \) in F \) . $
  Every column of $C$ belongs to the span of $P_F \( Y_(w_j) - Y_(w_1) \)$, $2 lt.eq j lt.eq b$, so $"rank" C lt.eq b - 1 lt.eq p - 1$. On the other hand,
  $ parallel A - C parallel_F^2 & lt.eq sum_(e = \( u \, v \) in F) parallel \( Y_u - Y_(c \( u \)) \) - \( Y_v - Y_(c \( v \)) \) #scale(x: 120%, y: 120%)[parallel]_2^2\
 & lt.eq sum_(e = \( u \, v \) in F) 2 #scale(x: 120%, y: 120%)[\(] parallel Y_u - Y_(c \( u \)) parallel_2^2 + parallel Y_v - Y_(c \( v \)) parallel_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq 16 m r = T_p / 2 . $
  This contradicts (9.17) with $k = p - 1$, which bounds the same quantity below by $T_p > 0$. Thus $b gt.eq p + 1 gt.eq 2$. Combining (9.19) and (9.20) yields
  $ b > frac(a m, 16) \, #h(2em) b r gt.eq frac(p T_p, 32 m) gt.eq frac(9 m Upsilon, 512 L^2) . $
  The bound on $L$ proves (9.13).
  #emph[Conversion to the power bound.] Put $t = log \( 1 \/ a \) gt.eq 0$. Since $log 2 gt.eq 1 \/ 2$, $5 + log_2 \( 1 \/ a \) lt.eq 5 + 2 t$. The elementary maximum of $t e^(- epsilon t \/ 2)$ is $2 \/ \( e epsilon \) lt.eq 1 \/ epsilon$, and $5 lt.eq 5 \/ \( 3 epsilon \)$ for $0 < epsilon < 1 \/ 3$. Consequently,
  $ #scale(x: 120%, y: 120%)[\(] 5 + log_2 \( 1 \/ a \) #scale(x: 120%, y: 120%)[\)] e^(- epsilon t \/ 2) lt.eq 5 + 2 / epsilon < 4 / epsilon . $
  Squaring and substituting in (9.13) gives
  $ b r gt.eq frac(9 epsilon^2, 8192) a^epsilon m Upsilon gt.eq epsilon^2 / 1024 a^epsilon m Upsilon . $
  Finally $C_1 \( epsilon \) gt.eq 16$, so the count estimate in (9.15) follows as well. ◻
]

The positivity assumption on $Upsilon$ is needed when one asks for many distinct centers. If $Upsilon = 0$, (9.12) forces $Y_e = 0$ for every $e in F$, and all endpoint images may coincide. Such a set contributes zero to the squared sums for which this lemma is used and can be discarded.

==== 9.2.2 Homogeneity and the two constructions <homogeneity-and-the-two-constructions>

#prodef([Definition 9.4.])[
  (Bad nodes and homogeneous subsets).  For $0 < alpha lt.eq 1$, a nonroot node $t$ with $O \( t \) eq.not diameter$ is #emph[$alpha$-bad] if
  $ (frac(sum_(e in O \( t \)) a_e, \| O \( t \) \|))^2 gt.eq frac(alpha, \| O \( t \) \|) sum_(e in O \( t \)) d_e . $
  Only nodes with a positive boundary sum need be retained. A set of edges is #emph[$c$-homogeneous] if its $a_e^2$ are positive and any two of them have ratio less than $c$, and the same holds for its $d_e$. A subset $O' \( t \) subset.eq O \( t \)$ is #emph[$gamma$-dominating] if
  $ (sum_(e in O' \( t \)) a_e)^2 gt.eq gamma (sum_(e in O \( t \)) a_e)^2 . $
] <hb:bad>

#thm([Lemma 9.5.])[
  (Two elementary truncations).  #emph[Define 
$ J = 1 + ⌈log_2 \( 256 \/ alpha^2 \)⌉ \, #h(2em) gamma = frac(1, 4 J^4) . $

 Every $alpha$-bad node with a positive boundary sum admits a $2$-homogeneous, $gamma$-dominating subset $O' \( t \)$.]
] <hb:bucketing>

#proof[
  Fix the node, let $m = \| O \( t \) \|$, and let expectations be uniform on $O \( t \)$. Writing $mu = bb(E) a_e > 0$, badness says $bb(E) d_e lt.eq mu^2 \/ alpha$. Discard edges for which $a_e < mu \/ 4$ or $d_e > 16 mu^2 \/ alpha^2$. The first class contributes at most $mu \/ 4$ to $bb(E) a_e$. For the second class, Markov’s inequality gives probability at most $alpha \/ 16$, and therefore Cauchy–Schwarz and $a_e^2 lt.eq d_e$ give
  $ bb(E) #scale(x: 120%, y: 120%)[\[] a_e upright(bold(1))_({ d_e > 16 mu^2 \/ alpha^2 }) #scale(x: 120%, y: 120%)[\]] lt.eq sqrt(bb(E) a_e^2 thin bb(P) { d_e > 16 mu^2 \/ alpha^2 }) lt.eq mu \/ 4 . $
  The remaining edges contribute at least $m mu \/ 2$ to the boundary sum. On those edges both $a_e^2$ and $d_e$ lie in $\[ mu^2 \/ 16 \, 16 mu^2 \/ alpha^2 \]$. Divide this interval into half-open dyadic intervals, with an extra last interval if needed. There are at most $J$ choices for each quantity and at most $J^2$ pairs of choices. Some pair contains edges whose $a_e$ sum is at least $m mu \/ \( 2 J^2 \)$. Its edges are $2$-homogeneous, and squaring this last estimate gives the asserted dominance. ◻
]

#thm([Lemma 9.6.])[
  (One homogeneous family).  #emph[Let $T$ be a nonempty set of $alpha$-bad nodes with positive boundary sums, and let $0 < gamma lt.eq 1$. Suppose that $O' \( t \)$ is $gamma$-dominating for each $t in T$ and that $F = union.big_(t in T) O' \( t \)$ is $4$-homogeneous. Write 
$ s = frac(alpha gamma, 32) \, #h(2em) c_1 = min_(e in F) a_e^2 \, #h(2em) S' = sum_(t in T) frac(1, \| O \( t \) \|) (sum_(e in O' \( t \)) a_e)^2 . $

 For $beta > 1$ and $0 < epsilon.alt < 1 \/ 3$, put $C = C_1 \( epsilon.alt \) = 1024 epsilon.alt^(- 2)$. If 
$ s^epsilon.alt lt.eq frac(1, 48 beta C) \, quad "(9.21)" $ <hb:smallness>

 there is either a family of $beta$-compact bags or a family of $s^(1 + 2 epsilon.alt)$-assigned bags, assigned to a subset of $T$, whose mass is at least 
$ frac(s^epsilon.alt, 192 beta C) thin S' . quad "(9.22)" $ <hb:one-mass>

 Its radius, and also its diameter parameter in the compact case, belong to $\[ s c_1 \, 12 c_1 \/ s \]$.]
] <hb:homogeneous-bags>

#proof[
  Set $m_t = \| O \( t \) \|$, $m'_t = \| O' \( t \) \|$, $N = sum_(t in T) m_t$, $N' = \| F \|$, and $c_2 = max_(e in F) d_e$. The sets $O' \( t \)$ are nonempty. Homogeneity, dominance, and badness imply, for each $t$,
  $ 4 c_1 \( m'_t \)^2 gt.eq (sum_(O' \( t \)) a_e)^2 gt.eq gamma (sum_(O \( t \)) a_e)^2 gt.eq alpha gamma m_t sum_(O \( t \)) d_e gt.eq frac(alpha gamma, 4) thin m_t m'_t c_2 . $
  Cancel $m'_t$ and sum. Since $sum_t m'_t lt.eq 2 N'$, we obtain
  $ c_1 N' gt.eq s N c_2 . quad "(9.23)" $ <hb:density>
  Also $N gt.eq N'$ and $c_1 lt.eq c_2$, since $a_e^2 lt.eq d_e$. Consequently
  $ s lt.eq tilde(alpha) := s N \/ N' lt.eq c_1 \/ c_2 lt.eq 1 . $
  Let $Y_v = U X_v$. The row-$e$ coordinate of $Y_u - Y_v$ is $a_e$. Moreover $parallel Y_u - Y_v parallel_2^2 lt.eq d_e$, so
  $ \( bb(E)_(e in F) a_e \)^2 gt.eq c_1 gt.eq accent(alpha c, ̃)_2 gt.eq tilde(alpha) bb(E)_(e in F) parallel Y_e parallel_2^2 . $
  Lemma 26 yields $b$ disjoint Euclidean balls with squared radius $r$ and centers at endpoint images $Y_v$, with
  $ b gt.eq accent(alpha N, ̃)' \/ C \, #h(2em) b r gt.eq tilde(alpha)^epsilon.alt c_1 N' \/ C . $
  Their center distances squared are at least $4 r$. Contraction and the binary-coordinate identity therefore give $parallel X_u - X_v parallel_1 gt.eq 4 r$ for distinct selected centers. Thus the corresponding $Q$-balls of radius $r$ are disjoint. Shrink their common radius to $delta$ so that
  $ b delta = w := tilde(alpha)^epsilon.alt c_1 N' \/ C . quad "(9.24)" $ <hb:normalized-mass>
  Call this family of $b$ small balls $cal(A)$. There are at most $2 N'$ distinct endpoint centers. It follows that
  $ frac(s^epsilon.alt c_1, 2 C) lt.eq delta lt.eq c_1 tilde(alpha)^(epsilon.alt - 1) lt.eq c_1 \/ s . $
  As $epsilon.alt < 1 \/ 2$, condition (9.21) implies $s^(1 - epsilon.alt) lt.eq s^epsilon.alt lt.eq 1 \/ \( 2 C \)$; hence
  $ s c_1 lt.eq delta lt.eq c_1 \/ s . quad "(9.25)" $ <hb:radius-range>
  Finally, homogeneity and the multiplicity bound show
  $ S' lt.eq 4 c_1 sum_t frac(\( m'_t \)^2, m_t) lt.eq 8 c_1 N' lt.eq 8 C s^(- epsilon.alt) w . quad "(9.26)" $ <hb:numerator-mass>
  Let $V' \( t \)$ consist of the endpoints of $O' \( t \)$ that lie in $V \( t \)$, and let $V' = union.big_t V' \( t \)$. Define $D = max { delta \, 2 c_2 }$. Choose a maximal disjoint collection $cal(B)$ of radius-$D$ balls centered at $X_u$ for $u in V'$. Every such center is within $2 D$ of a chosen center: otherwise its ball could be added. Each center of a small ball is an endpoint of an edge of $F$, so it is within $c_2$ of a point of $V'$, and hence within $3 D$ of a chosen center.
  If $\| cal(B) \| < w \/ \( 12 beta D \)$, assign every small ball to its closest chosen center, breaking ties consistently. The balls assigned to one center have center diameter at most $6 D$. Keep a resulting bag precisely when it contains at least $6 beta D \/ delta$ balls. The discarded bags contain fewer than $\| cal(B) \| 6 beta D \/ delta < b \/ 2$ balls. Each retained bag is $beta$-compact of type $\( delta \, 6 D \)$; the numerical threshold is larger than $2$ because $D gt.eq delta$ and $beta > 1$. Their balls are still mutually disjoint and their mass is at least $w \/ 2$, which implies (9.22).
  In the other case, $\| cal(B) \| gt.eq w \/ \( 12 beta D \)$, assign each ball of $cal(B)$ to one node $t$ for which its center belongs to $V' \( t \)$. Keep the bag assigned to $t$ when
  $ \| upright("Bag")_t \| gt.eq frac(\| cal(B) \| m_t, 2 N) . $
  Discarding the other bags loses fewer than $\| cal(B) \| \/ 2$ balls. For each retained ball its center is in $V \( t \)$ and some edge of $O' \( t \)$ has length at most $c_2 < D$. Furthermore
  $ frac(\| upright("Bag")_t \|, m_t) gt.eq frac(w, 24 beta D N) . quad "(9.27)" $ <hb:assignment-size>
  If $D = delta$, the right side is $b \/ \( 24 beta N \)$, at least $s \/ \( 24 beta C \)$ by the bound on $b$. If $D = 2 c_2$, it is at least $s^(1 + epsilon.alt) \/ \( 48 beta C \)$ by (9.23) and (9.24). In either case (9.21) makes it at least $s^(1 + 2 epsilon.alt)$. These bags are therefore assigned as asserted. Their mass is at least $D \| cal(B) \| \/ 2 gt.eq w \/ \( 24 beta \)$; (9.26) gives (9.22).
  In both cases (9.23) gives $c_2 lt.eq c_1 \/ s$ and therefore $D lt.eq 2 c_1 \/ s$. Together with (9.25), this places all radii, and the compact diameter $6 D$, in $\[ s c_1 \, 12 c_1 \/ s \]$. ◻
]

==== 9.2.3 Selecting separated scales <selecting-separated-scales>

#thm([Proposition 9.7.])[
  (Geometric bag extraction).  #emph[Let $T$ be a nonempty finite set of $alpha$-bad nodes with positive boundary sums, where $0 < alpha lt.eq 1$. Define 
$ J & = 1 + ceil.l log_2 \( 256 \/ alpha^2 \) ceil.r \, & C_2 \( alpha \) & = 128 J^4 \, & s & = alpha \/ C_2 \( alpha \) \,\
L & = 2 + ceil.l log_2 \( 1 \/ s \) ceil.r \, & H & = 1 + ceil.l log_2 \( 24 \/ \( lambda s^2 \) \) ceil.r \, & C_1 \( epsilon.alt \) & = 1024 epsilon.alt^(- 2) . $

 Suppose $beta > 1$, $0 < epsilon.alt < 1 \/ 3$, $0 < lambda < 1$, and $s^epsilon.alt lt.eq \( 48 beta C_1 \( epsilon.alt \) \)^(- 1)$. There is a $lambda$-geometric sequence of families, consisting either entirely of $beta$-compact bags or entirely of $s^(1 + 2 epsilon.alt)$-assigned bags assigned to distinct nodes of $T$, whose mass satisfies 
$ sans(M) gt.eq frac(s^epsilon.alt, 384 beta C_1 \( epsilon.alt \) C_2 \( alpha \) L H) sum_(t in T) frac(1, \| O \( t \) \|) (sum_(e in O \( t \)) a_e)^2 . quad "(9.28)" $ <hb:extraction-bound>

 In particular, all losses are functions of $alpha \, epsilon.alt \, beta$ and $lambda$, independent of the number of vertices and hierarchy depth.]
] <prop:hierarchy-bags>

#proof[
  Lemma 28 gives $2$-homogeneous subsets $O' \( t \)$ with $gamma = 1 \/ \( 4 J^4 \) = 32 \/ C_2 \( alpha \)$. Define
  $ A_t = min_(e in O' \( t \)) a_e^2 \, #h(2em) B_t = min_(e in O' \( t \)) d_e \, #h(2em) s_t = frac(\( sum_(O' \( t \)) a_e \)^2, \| O \( t \) \|) . $
  All are positive. For $m = \| O \( t \) \|$ and $m' = \| O' \( t \) \|$, the same pointwise argument used above, now with $2$-homogeneity, gives
  $ 2 A_t \( m' \)^2 gt.eq gamma (sum_(O \( t \)) a_e)^2 gt.eq alpha gamma m m' B_t . $
  Consequently
  $ 1 lt.eq B_t \/ A_t lt.eq 2 \/ \( alpha gamma \) = 1 \/ \( 16 s \) . quad "(9.29)" $ <hb:local-scale-ratio>
  Partition the nodes according to the two integers $n = floor.l log_2 A_t floor.r$ and $m = floor.l log_2 B_t floor.r$. For each fixed $n$, (9.29) allows at most $L$ values of $m$. Retain the value $m \( n \)$ maximizing the sum of the $s_t$ over that group, and call the resulting node set $T_n$. Summing over $n$ yields
  $ sum_n sum_(t in T_n) s_t gt.eq 1 / L sum_(t in T) s_t gt.eq frac(1, C_2 \( alpha \) L) sum_(t in T) frac(\( sum_(O \( t \)) a_e \)^2, \| O \( t \) \|) . quad "(9.30)" $ <hb:retained-sum>
  The last inequality uses $gamma gt.eq 1 \/ C_2 \( alpha \)$.
  The union of the $O' \( t \)$ over $T_n$ is $4$-homogeneous: its $a_e^2$ lie in $\[ 2^n \, 2^(n + 2) \)$ and its $d_e$ in $\[ 2^(m \( n \)) \, 2^(m \( n \) + 2) \)$. Apply Lemma 29 to every nonempty $T_n$. Let $cal(F)_n$ be the resulting family. Its radius is at least $s 2^n$ and at most $24 thin 2^n \/ s$; the latter upper bound also holds for its compact diameter parameter. Its mass is at least $s^epsilon.alt sum_(t in T_n) s_t \/ \( 192 beta C_1 \( epsilon.alt \) \)$.
  Partition these families by their integer $n$ modulo $H$ and by whether they are compact or assigned. One of the $2 H$ resulting classes has at least $1 \/ \( 2 H \)$ of their total mass. Order that class by decreasing $n$. If $n'$ follows $n$, then $n' lt.eq n - H$, and the definition of $H$ implies
  $ frac(24 thin 2^(n'), s) lt.eq frac(24 thin 2^(n - H), s) < lambda s 2^n . $
  This verifies the geometric condition, including the stronger diameter condition for compact families. Assigned nodes are distinct across the sequence because the original $T_n$ are disjoint and each construction uses only a subset of its own $T_n$. Finally combine its $1 \/ \( 2 H \)$ mass share with (9.30) and the mass guarantee for each $cal(F)_n$. This is exactly (9.28). ◻
]

=== 9.3 Charging compact bags <hc:section>

We prove the compact-bag estimate, including its geometric charging step. The argument follows the construction underlying #cite(label("AOG")) Proposition 7.1 and Section 7.1; the proof below includes the boundary conventions, the positive-part accounting, and the invariants needed when the scale changes.

#thm([Proposition 9.8.])[
  (Compact-bag charging).  #emph[Let $G = \( V \, E \)$ be a finite $k$-edge-connected multigraph, and let $X_v in Q = \[ 0 \, 1 \]^h$ for $v in V$. Suppose $\( cal(F)_i \)$ is a finite or countable $lambda$-geometric sequence of nonempty families of $beta$-compact bags, of respective types $\( delta_i \, Delta_i \)$, where $0 < lambda lt.eq 1 \/ 12$ and $beta gt.eq 36$. Thus all balls in $cal(F)_i$ are mutually disjoint ordinary balls $B_Q \( X_v \, delta_i \)$, every bag $D in cal(F)_i$ has at least two balls and center diameter at most $Delta_i$, and 
$ beta Delta_i lt.eq \| D \| delta_i \, #h(2em) Delta_(i + 1) lt.eq lambda delta_i . $

 Then 
$ k / 4 sum_i delta_i sum_(D in cal(F)_i) \| D \| lt.eq sum_(e in E) parallel X_e parallel_1 \, #h(2em) X_({ u \, v }) = X_u - X_v . quad "(9.31)" $ <hc:conclusion>

]
] <prop:hierarchy-compact>

An ordinary ball is $B_Q \( x \, r \) = { y in Q : parallel y - x parallel_1 < r }$, including its center. A hollowed ball is the strict shell

$ B_Q \( x \; a \, b \) = { y in Q : a < parallel y - x parallel_1 < b } \, #h(2em) 0 lt.eq a < b . $

We call $b - a$ its width. For numerical formulas an ordinary ball of radius $b$ has inner radius $a = 0$ and width $b$; it remains an ordinary ball, rather than a shell punctured at its center. A shell of zero width is discarded.

#thm([Lemma 9.9.])[
  (Length bound for disjoint hollowed balls).  #emph[Let $G = \( V \, E \)$ be a finite $k$-edge-connected multigraph, where $k > 0$, and let $X_v in Q = \[ 0 \, 1 \]^h$ for $v in V$. Let $cal(Z)$ be a finite collection of pairwise disjoint ordinary or hollowed balls in $Q$. For each $H in cal(Z)$, write $x_H \, a_H \, b_H$ for its center and numerical inner and outer radii. Suppose there are vertices $u_H \, v_H in V$ such that 
$ parallel X_(u_H) - x_H parallel_1 lt.eq a_H \, #h(2em) parallel X_(v_H) - x_H parallel_1 gt.eq b_H . quad "(9.32)" $ <hc:witness>

 Then 
$ k sum_(H in cal(Z)) \( b_H - a_H \) lt.eq sum_({ u \, v } in E) parallel X_u - X_v parallel_1 . quad "(9.33)" $ <hc:length-bound>

]
] <hc:length>

#proof[
  For $H in cal(Z)$, clamp the radial distance to its radial interval:
  $ f_H \( y \) = min { b_H \, max { a_H \, parallel y - x_H parallel_1 } } . $
  For every $a_H < t < b_H$, the set $S_(H \, t) = { v : parallel X_v - x_H parallel_1 < t }$ is nonempty and proper, by (9.32). Its edge boundary therefore has at least $k$ edges, with multiplicity. Integrating this finite step function gives
  $ k \( b_H - a_H \) lt.eq integral_(a_H)^(b_H) \| E \( S_(H \, t) \, V \\ S_(H \, t) \) \| thin d t = sum_({ u \, v } in E) \| f_H \( X_u \) - f_H \( X_v \) \| . quad "(9.34)" $ <hc:cut-integral>
  Indeed, the contribution of an edge to the integral is exactly the length of the interval of thresholds lying between its two endpoint distances, intersected with $\( a_H \, b_H \)$.
  Fix an edge $e = { u \, v }$, put $L_e = parallel X_u - X_v parallel_1$, and let $gamma \( s \) = \( 1 - s \) X_u + s X_v$, $0 lt.eq s lt.eq 1$. The segment lies in the convex set $Q$. Every $g_H = f_H compose gamma$ is a continuous, finitely piecewise affine function: each coordinate in its defining norm is an absolute value of an affine function, and clamping adds only finitely many breakpoints. The reverse triangle inequality and the fact that clamping does not increase distances show that $g_H$ is $L_e$-Lipschitz.
  Take a common finite subdivision $0 = s_0 < dots.h.c < s_m = 1$ on which all the $g_H$ are affine. If $g_H$ is nonconstant on one of these intervals, its value in the interval’s interior lies strictly between $a_H$ and $b_H$. The corresponding points of $gamma$ belong to $H$. Pairwise disjointness permits at most one such nonconstant function on each interval. Hence
  $ sum_(H in cal(Z)) \| g_H \( 1 \) - g_H \( 0 \) \| & lt.eq sum_(j = 1)^m sum_(H in cal(Z)) \| g_H \( s_j \) - g_H \( s_(j - 1) \) \|\
 & lt.eq sum_(j = 1)^m L_e \( s_j - s_(j - 1) \) = L_e . $
  This also handles a segment lying along a shell boundary: its clamped radial function is constant there. Summing (9.34) over $H$ and then applying the last bound to each edge proves (9.33). ◻
]

#proof[
  It suffices to prove the claim for each finite initial sequence $cal(F)_1 \, dots.h \, cal(F)_q$. For this proof only, set $Delta_(q + 1) = 0$. Each family is finite because its positive-radius balls are disjoint and their centers are drawn from the finite set ${ X_v : v in V }$.
  We first record the scale inequalities. Two disjoint balls of radius $delta_i$, with centers $z \, z' in Q$, satisfy $parallel z - z' parallel_1 gt.eq 2 delta_i$: otherwise their midpoint, which belongs to $Q$, would lie in both balls. A compact bag contains two such balls. Consequently
  $ 2 delta_i lt.eq Delta_i \, #h(2em) 6 Delta_(i + 1) lt.eq delta_i / 2 \, #h(2em) \| D \| delta_i gt.eq beta Delta_i quad \( D in cal(F)_i \) . quad "(9.35)" $ <hc:scales>
  ===== 9.3.1 The invariant and the order of processing. <the-invariant-and-the-order-of-processing.>
  We construct a finite collection $cal(Z)$, initially empty, and process the families in the order $1 \, dots.h \, q$. During phase $i$, call an original ball inserted from $cal(F)_i$ #emph[fresh]. Every other live object is called #emph[old], including any shell produced by splitting an old object during this phase. A fresh ball is kept intact until the phase ends. Write $\[ s \]_(+) = max { s \, 0 }$. Assign capacities
  $ p_i \( H \) = cases(delim: "{", delta_i - 6 Delta_(i + 1) \, & H upright(" is fresh") \,, ""_(+) \, & H upright(" is old") \,) #h(2em) P_i \( cal(Z) \) = sum_(H in cal(Z)) p_i \( H \) \, quad "(9.36)" $ <hc:capacity>
  where $w \( H \)$ denotes width. All capacities are nonnegative and at most the object’s width. At every step we maintain:
  + the live objects are pairwise disjoint;
  + their centers are embedded vertices, and every live object has the two witnesses in (9.32);
  + $ P_i \( cal(Z) \) gt.eq 1 / 4 sum_(D upright(" already processed")) \| D \| delta \( D \) \, quad "(9.37)" $ <hc:potential-invariant>
    where $delta \( D \)$ is the radius of the balls of $D$.
  These assertions hold initially. We verify them for each operation and for each change of phase.
  ===== 9.3.2 Processing a bag with an interior ball. <processing-a-bag-with-an-interior-ball.>
  For an unprocessed ball $B_Q \( z \, delta_i \)$ and a live object $H$ with center $x$ and numerical radii $a \, b$, say that the ball is #emph[interior to $H$] if
  $ a + delta_i + Delta_i lt.eq parallel z - x parallel_1 lt.eq b - delta_i - Delta_i . quad "(9.38)" $ <hc:interior>
  An interior ball is contained in $H$, by the triangle inequality. It is nonempty, so disjointness of $cal(Z)$ makes its containing object unique. Moreover, this object cannot be fresh: an unprocessed ball and a fresh ball belong to the same family, whose balls are disjoint.
  While some unprocessed bag has an interior ball, choose such a bag $D = { B_Q \( z_j \, delta_i \) : 1 lt.eq j lt.eq n }$. Let $H$ be the old object containing an interior ball of $D$, and set
  $ L = min_j parallel z_j - x parallel_1 \, #h(2em) R = max_j parallel z_j - x parallel_1 . $
  The function $z mapsto parallel z - x parallel_1$ is 1-Lipschitz. The diameter bound on the centers, applied first to the interior center and then to the extremal pair, gives
  $ a + delta_i lt.eq L lt.eq R lt.eq b - delta_i \, #h(2em) R - L lt.eq Delta_i . quad "(9.39)" $ <hc:radial-span>
  Thus every ball of $D$ lies in $H$. Replace $H$ by the two old shells
  $ H_(-) = B_Q \( x \; a \, L - delta_i \) \, #h(2em) H_(+) = B_Q \( x \; R + delta_i \, b \) \, quad "(9.40)" $ <hc:split>
  discarding any zero-width shell, and insert all $n$ balls of $D$ as fresh balls. Mark $D$ processed.
  Here are the geometric invariant checks. The shells in (9.40) are subsets of $H$ and are disjoint from each other. For $y in B_Q \( z_j \, delta_i \)$, strictness of the ordinary ball gives
  $ L - delta_i < parallel y - x parallel_1 < R + delta_i . $
  It therefore lies in neither shell. The inserted balls are mutually disjoint by the family assumption; all replacements are subsets of $H$, so they also avoid every other live object. For $H_(-)$, an old inner witness remains an inner witness, and a center achieving $L$ is an outer witness. For $H_(+)$, a center achieving $R$ is an inner witness, and an old outer witness remains an outer witness. Every inserted ordinary ball has its own center as inner witness and the center of another ball of $D$ as outer witness; their distance is at least $2 delta_i$. All centers of new objects are either $x$ or a $z_j$, hence are embedded vertices. This proves (i) and (ii), and also proves that fresh objects have not been altered.
  For the potential calculation, write $w = b - a$ and $t = \[ w - 6 Delta_i \]_(+)$, the old capacity being replaced. The new ordinary balls have total capacity $n \( delta_i - 6 Delta_(i + 1) \) gt.eq n delta_i \/ 2$. If $t = 0$, they alone pay the new requirement $n delta_i \/ 4$, and no previous capacity is lost. If $t > 0$, then $t = w - 6 Delta_i$. The widths of the two shells sum to $w - \( R - L \) - 2 delta_i$, including zero-width shells formally, so
  $ & p_i \( H_(-) \) + p_i \( H_(+) \) + n \( delta_i - 6 Delta_(i + 1) \)\
 & #h(2em) gt.eq w - \( R - L \) - 2 delta_i - 12 Delta_i + frac(n delta_i, 2)\
 & #h(2em) gt.eq t + frac(n delta_i, 2) - 8 Delta_i gt.eq t + frac(n delta_i, 4) . quad "(9.41)" $ <hc:split-capacity>
  The first bound uses $\[ s \]_(+) gt.eq s$, also when a shell is discarded. The second uses $R - L lt.eq Delta_i$ and $2 delta_i lt.eq Delta_i$. The last uses $n delta_i gt.eq beta Delta_i$ and $beta gt.eq 36 gt.eq 32$. Unchanged objects keep their capacities. Thus (iii) also survives, with the new bag included on its right-hand side. Each such operation processes one new bag, so the loop ends after finitely many steps.
  ===== 9.3.3 Inserting the remaining bags and changing scale. <inserting-the-remaining-bags-and-changing-scale.>
  At the end of the loop, let $cal(R)_i$ be the unprocessed bags. None of their balls satisfies (9.38) for any live object. Set $s_i = 2 delta_i + Delta_i$. Retain every fresh ball. For each old object with numerical radii $a \, b$, replace it by
  $ H^(upright("sh")) = B_Q \( x \; a + s_i \, b - s_i \) quad upright("if ") b - a > 2 s_i \, quad "(9.42)" $ <hc:shrink>
  and otherwise discard it. Insert every ball of every bag in $cal(R)_i$, and mark those bags processed. We now regard all surviving objects as old objects at the beginning of phase $i + 1$. After phase $q$, this is just a final accounting state with $Delta_(q + 1) = 0$ and capacity equal to width.
  Shrinking preserves pairwise disjointness among old objects and preserves their witnesses: increasing the inner radius and decreasing the outer radius only weakens the witness conditions. A remaining ball $B_Q \( z \, delta_i \)$ is disjoint from each retained fresh ball, because both belong to $cal(F)_i$. For an old object, failure of (9.38) says that at least one of
  $ parallel z - x parallel_1 < a + delta_i + Delta_i \, #h(2em) parallel z - x parallel_1 > b - delta_i - Delta_i $
  holds. In the first case every point of $B_Q \( z \, delta_i \)$ has radial distance less than $a + s_i$; in the second every such point has radial distance greater than $b - s_i$. In either case this ball avoids $H^(upright("sh"))$. All newly inserted balls are mutually disjoint by the family assumption, and their witnesses are again their own centers and another center in the same bag. This verifies (i) and (ii) after the transition, including the center condition.
  It remains to verify (iii) across the change in its definition of capacity. A retained fresh ball has capacity $delta_i - 6 Delta_(i + 1)$ both before and after the transition. For a surviving old object, the new capacity is $\[ w - 2 s_i - 6 Delta_(i + 1) \]_(+)$. By (9.35),
  $ 2 s_i + 6 Delta_(i + 1) = 2 Delta_i + 4 delta_i + 6 Delta_(i + 1) lt.eq 2 Delta_i + 9 / 2 delta_i lt.eq 17 / 4 Delta_i lt.eq 6 Delta_i . quad "(9.43)" $ <hc:reserve>
  Thus its new capacity is at least $\[ w - 6 Delta_i \]_(+)$, its old capacity. If an old object is discarded, then $w lt.eq 2 s_i lt.eq 4 Delta_i$, so its old capacity was zero. Finally, every ball inserted from $cal(R)_i$ contributes $delta_i - 6 Delta_(i + 1) gt.eq delta_i \/ 2$ in the new state. These capacities pay at least $\| D \| delta_i \/ 4$ for each newly processed bag $D$. No previous capacity decreases, so (9.37) holds at the start of the next phase.
  After phase $q$, every bag in the chosen initial sequence has been processed and the capacity of each live object equals its width. The final collection $cal(Z)_(upright("fin"))$ is disjoint and has both witnesses for every object. The potential invariant and Lemma 32 give
  $ 1 / 4 sum_(i = 1)^q delta_i sum_(D in cal(F)_i) \| D \| lt.eq sum_(H in cal(Z)_(upright("fin"))) w \( H \) lt.eq 1 / k sum_(e in E) parallel X_e parallel_1 . $
  For a countable sequence, its nonnegative sum is the supremum of these finite initial sums. Taking that supremum proves (9.31). ◻
]

=== 9.4 Charging assigned bags <sec:hierarchy-assigned>

The second charging argument uses the hierarchy to allow geometric overlap: two overlapping shells will charge edges in disjoint induced subgraphs. We give the labeling, construction, and accounting explicitly, following the assigned-bag argument of Anari and Oveis Gharan #cite(label("AOG")) Proposition 7.2 and Section 7.2.

#thm([Proposition 9.10.])[
  (Assigned-bag charging).  #emph[Let $X : V arrow.r { 0 \, 1 }^d$, and let $cal(T)$ be a locally $k$-connected hierarchy of $G$, with selected nonroot nodes $T$ satisfying $\| O \( t \) \| gt.eq k lambda \| P \( t \) \|$ for $t in T$. Suppose $cal(F)_1 \, dots.h \, cal(F)_m$ is a $lambda$-geometric sequence of families of $\( 24 C_3 \/ k \)$-assigned bags, of types $\( delta_i \, T_i \)$, with $T_i subset.eq T$. If 
$ C_4 gt.eq 3 \, #h(2em) lambda lt.eq frac(1, 6 C_4) \, #h(2em) C_3 gt.eq 2 #scale(x: 120%, y: 120%)[\(] \( C_4 + 1 \) + 4 \( C_4 + 2 \)^2 #scale(x: 120%, y: 120%)[\)] \, $

 then 
$ sum_({ u \, v } in E) parallel X_u - X_v parallel_1 med gt.eq med k / 8 frac(C_4, 12 C_3) sum_(i = 1)^m delta_i sum_(t in T_i) \| "Bag"_t \| . quad "(9.44)" $ <ha:assigned-bound>

 In particular, one may take $C_4 = 3$, $C_3 = 10^4$ and $lambda lt.eq 1 \/ 18$.]
] <prop:hierarchy-assigned>

The proof first discards noninsertable balls while retaining at least half the total mass. It then constructs a valid labeled collection whose total width is at least $C_4 \/ \( 12 C_3 \)$ times the retained mass. Lemma 37 converts that width to graph length at rate $k \/ 4$.

==== 9.4.1 Labels, routing domains, and preprocessing <ha:preprocessing>

Write $cal(F)_i$ for the family of bags at scale $delta_i$ and $cal(B)_i = union.big_(t in T_i) "Bag"_t$ for its balls. The balls in $cal(B)_i$ are pairwise disjoint, whereas balls at different scales need not be disjoint. Throughout this proof all geometric sets are restricted to the continuous cube $Q = \[ 0 \, 1 \]^d$. We abbreviate the common notation $B_Q$ to $B$ in this proof; in particular,

$ B \( x \, r \) = { y in Q : parallel x - y parallel_1 < r } \, #h(2em) B \( x \, a bar.v.double b \) = { y in Q : a < parallel x - y parallel_1 < b } quad \( 0 lt.eq a < b \) . $

An ordinary ball includes its center; a hollow ball has strict inner and outer boundaries. Its width is $b - a$, and the width of $B \( x \, r \)$ is $r$. When a statement uses inner and outer radii for an ordinary ball, they mean $0$ and $r$. The sets $B \( x \, r \)$ and $B \( x \, 0 bar.v.double r \)$ differ only at $x$; we keep this distinction when testing membership. In particular, every test below for an endpoint in an input ball includes endpoints mapped to its center. All centers used in the construction are centers of input balls, hence belong to ${ 0 \, 1 }^d$: new hollow balls inherit an existing center. Consequently, for each such center $x$, the map $y mapsto parallel x - y parallel_1$ is affine on $Q$. Intersections here mean intersections in the continuous cube, not merely intersections on the finite set $X \( V \)$.

#thm([Lemma 9.11.])[
  (Edge-disjoint paths from cut bounds).  #emph[If every cut separating distinct vertices $u \, v$ of an undirected multigraph has at least $q$ edges, where $q$ is a positive integer, then the graph has $q$ pairwise edge-disjoint $u$–$v$ paths.]
] <ha:edge-paths>

#proof[
  Give each edge an arbitrary orientation and maintain an integral antisymmetric flow whose value on an oriented edge is in ${ - 1 \, 0 \, 1 }$. Start with zero flow. A directed traversal of an edge is available when its signed flow in that direction is less than $1$. As long as the current flow value is less than $q$, augment by one along an available directed $u$–$v$ path if one exists. The edge bounds and flow conservation at all other vertices remain valid, and the value increases by one. If no such path exists, let $S$ be the vertices reachable from $u$ by available traversals. Then $v in.not S$, and every edge leaving $S$ has signed outward flow $1$. Summing flow conservation over $S$ says that the current flow value equals the number of those edges, at least $q$, a contradiction. Thus the procedure reaches value $q$ after $q$ augmentations. An integral flow of positive value contains a directed positive-flow $u$–$v$ path: otherwise the vertices reachable on positive-flow edges would have no positive outward flow, contradicting their positive net flow. Extract such a path and subtract one on its edges. Repeating extracts $q$ paths. Each used edge had flow $1$ in its traversal direction and then has flow zero, so the extracted paths are edge-disjoint. Parallel edges are separate edges throughout the argument. ◻
]

Let $cal(T) \[ t \]$ denote the set of hierarchy nodes in the subtree rooted at $t$, including $t$. Its leaves are identified with $V \( t \)$. Recall that

$ P \( t \) = E \( V \( t \) \, V \\ V \( t \) \) \, #h(2em) O \( t \) = E \( V \( t \) \, V \( t^(*) \) \\ V \( t \) \) . $

A ball record consists of its geometric ball and its labels; two records may have the same geometric set. Its owner $t \( B \)$ is a hierarchy node. A nonavoiding record will route in $G \[ V \( t \( B \) \) \]$. An avoiding record also has a label $t_d \( B \)$, a strict descendant of $t \( B \)$, and will route in $G \[ V \( t \( B \) \) \\ V \( t_d \( B \) \) \]$. In either case a further label $t_P \( B \)$ is a set of strict descendants of $t \( B \)$. Define the #emph[conflict domain] and its leaf set by

$ C \( B \) & = cal(T) \[ t \( B \) \] \\ union.big_(s in t_P \( B \)) cal(T) \[ s \] &  & upright("if ") B upright(" is nonavoiding") \,\
C \( B \) & = cal(T) \[ t \( B \) \] \\ (cal(T) \[ t_d \( B \) \] union union.big_(s in t_P \( B \)) cal(T) \[ s \]) &  & upright("if ") B upright(" is avoiding") \,\
L \( B \) & = C \( B \) ∩ V . $

Thus $C \( B \)$ is a connected set of hierarchy nodes containing its root $t \( B \)$. The set $L \( B \)$, rather than the geometric points of $B$, specifies the graph vertices available for charging.

#prodef([Definition 9.12.])[
  (Valid labeling).  A collection $Z$ of labeled ordinary and hollow balls is valid if the following four conditions hold for every record $B$ with center $x$ and radii $a < b$.
  + The labels and conflict domain have the form just described; in particular $t \( B \) in C \( B \)$.
  + For $s in t_P \( B \)$ and ${ v \, w } in P \( s \)$,
    $ parallel x - X_v parallel_1 gt.eq b \, #h(2em) parallel x - X_w parallel_1 gt.eq b . $
  + There is $u in L \( B \)$ with $parallel x - X_u parallel_1 lt.eq a$ and at least $k \/ 4$ pairwise edge-disjoint paths starting at $u$ and ending at vertices of distance at least $b$ from $x$. The paths lie in $G \[ V \( t \( B \) \) \]$ if $B$ is nonavoiding, and in $G \[ V \( t \( B \) \) \\ V \( t_d \( B \) \) \]$ if it is avoiding.
  + Distinct records whose geometric balls intersect have disjoint conflict domains.
] <ha:valid-labeling>

The paths in Definition 9.12 may initially visit predecessor subtrees; condition Definition 9.12 will allow their relevant prefixes to avoid all of them. Also, the shape of the domains gives the useful equivalence

$ C \( B \) ∩ C \( B' \) eq.not diameter quad arrow.l.r.double quad t \( B \) in C \( B' \) med upright("or") med t \( B' \) in C \( B \) . quad "(9.45)" $ <ha:domain-root-test>

Indeed, a common node lies below both roots. The roots are therefore comparable, and the path from the higher root to that common node contains the lower root and stays in the higher root’s domain. The converse follows since each root belongs to its own domain.

===== 9.4.1.1 Predecessors and insertability. <predecessors-and-insertability.>

For $t in T_i$ define

$ "Pred" \( t \) = { s : med s upright(" is a strict descendant of ") t \, med s in T_j upright(" for some ") j < i } . $

For $B = B \( X_u \, delta_i \) in "Bag"_t$, say that $B$ is #emph[noninsertable by $s$] if $s in "Pred" \( t \)$ and an endpoint $w$ of an edge of $P \( s \)$ satisfies $parallel X_u - X_w parallel_1 < delta_i$. A ball is #emph[insertable] if no predecessor makes it noninsertable. Every insertable input ball is labeled nonavoiding, with

$ t \( B \) = t \, #h(2em) t_P \( B \) = "Pred" \( t \) . $

Its center vertex $u$ belongs to $L \( B \)$. To verify this, use the assigned-bag property to choose an edge ${ u \, v } in O \( t \)$ with $v in.not V \( t \)$. If $u in V \( s \)$ for a predecessor $s$ of $t$, then ${ u \, v } in P \( s \)$. Its endpoint $u$ is in the center-inclusive ball $B$, contrary to insertability. This argument also covers distinct graph vertices having the same image under $X$.

#thm([Lemma 9.13.])[
  (Cost of one predecessor).  #emph[Suppose $delta_(i + 1) lt.eq lambda delta_i$ with $lambda lt.eq 1 \/ 2$, $\| O \( t \) \| gt.eq k lambda \| P \( t \) \|$ for the selected hierarchy nodes, and each bag is at least $C_3 \/ k$-assigned. For $s in T_ell$, 
$ sum_i delta_i \| { B in cal(B)_i : B upright(" is noninsertable by ") s } \| lt.eq 4 / C_3 delta_ell \| "Bag"_s \| . $

]
] <ha:pruning>

#proof[
  The set being counted is empty for $i lt.eq ell$. For each $i > ell$, assign to every counted ball one endpoint of an edge in $P \( s \)$ that lies in that ball. Pairwise disjointness of the center-inclusive balls in $cal(B)_i$ makes this assignment injective on endpoint vertices. There are at most $2 \| P \( s \) \|$ such vertices, even when edges are parallel or several vertices have the same image. Thus the left-hand side is at most
  $ 2 \| P \( s \) \| sum_(i > ell) delta_i & lt.eq frac(2 lambda, 1 - lambda) \| P \( s \) \| delta_ell\
 & lt.eq 4 lambda \| P \( s \) \| delta_ell lt.eq 4 / k \| O \( s \) \| delta_ell lt.eq 4 / C_3 \| "Bag"_s \| delta_ell . $
  The last inequality is precisely the assigned-bag cardinality bound. ◻
]

#thm([Lemma 9.14.])[
  (Charging a valid labeled collection).  #emph[Every finite collection $Z$ with a valid labeling satisfies 
$ k / 4 sum_(B in Z) "width" \( B \) lt.eq sum_({ v \, w } in E) parallel X_v - X_w parallel_1 . $

]
] <ha:labeled-energy>

#proof[
  Realize each graph edge $e = { v \, w }$ by one fixed straight segment from $X_v$ to $X_w$ in $Q$, of length $ell_e = parallel X_v - X_w parallel_1$. Different parallel edges are distinct resources even if their segments coincide geometrically. Concatenating these segments realizes a graph path as a continuous curve.
  Fix a record $B$ with center $x$ and radii $a < b$. Take the paths in Definition 9.12, and stop each at its first vertex $z$ satisfying $parallel x - X_z parallel_1 gt.eq b$. Every vertex in each resulting graph path belongs to $L \( B \)$. Avoidance of $V \( t_d \( B \) \)$ already follows from Definition 9.12. To check avoidance of $V \( s \)$ for $s in t_P \( B \)$, suppose the path first enters $V \( s \)$ along ${ v \, w } in P \( s \)$. The start vertex is outside $V \( s \)$, so this entering edge exists. Its preceding endpoint $v$ occurs before the stopping vertex and therefore has $parallel x - X_v parallel_1 < b$. This contradicts Definition 9.12. In particular, both graph endpoints of every edge of the stopped path are in $L \( B \)$, including the edge containing its geometric exit point.
  On each of the resulting continuous curves, keep the portion between the last point at radius $a$ preceding its first point at radius $b$ and that first point at radius $b$. Those points exist by continuity. The retained curve, apart from its endpoints, is in the open shell $a < parallel x - y parallel_1 < b$. The function $y mapsto parallel x - y parallel_1$ is $1$-Lipschitz, so its length is at least $b - a$. This also applies to an ordinary ball by taking $a = 0$; removing its center changes no charged length. Charge each retained portion to its underlying graph edge. The paths for one record are edge-disjoint, so this record charges no portion of a graph edge twice.
  Now fix a graph edge $e = { v \, w }$. If two distinct records charge portions of $e$, the preceding paragraph gives $v \, w in L \( B \) ∩ L \( B' \)$, so their conflict domains meet. Condition Definition 9.12 forces their geometric balls to be disjoint. Hence their charged open portions of the fixed segment of $e$ are disjoint. Summing over all records charges $e$ at most $ell_e$. This reasoning uses edge portions, not the whole length of every edge on a witness path. It also handles zero-length edges, which contribute no charge. Each record receives at least $\( k \/ 4 \) \( b - a \)$, and summing the edge budgets proves the claim. ◻
]

#thm([Lemma 9.15.])[
  (Arrangement of insertable bags).  #emph[Let $cal(T)$ be a locally $k$-connected hierarchy, with selected nonroot nodes $T$ satisfying $\| O \( t \) \| gt.eq k lambda \| P \( t \) \|$ for $t in T$. Let $cal(F)_i$ be a $lambda$-geometric sequence of families of $12 C_3 \/ k$-assigned bags of type $\( delta_i \, T_i \)$, where the $T_i subset.eq T$ are pairwise disjoint. Suppose all input balls are insertable and 
$ C_4 gt.eq 3 \, #h(2em) lambda lt.eq frac(1, 6 C_4) \, #h(2em) C_3 gt.eq 2 #scale(x: 120%, y: 120%)[\(] \( C_4 + 1 \) + 4 \( C_4 + 2 \)^2 #scale(x: 120%, y: 120%)[\)] . $

 Then there is a finite valid collection $Z$ of labeled ordinary and hollow balls, with centers inherited from the input balls, such that 
$ sum_(B in Z) "width" \( B \) gt.eq frac(C_4, 12 C_3) sum_i delta_i sum_(t in T_i) \| "Bag"_t \| . quad "(9.46)" $ <ha:arrangement-width>

]
] <ha:insertable-arrangement>

The next parts prove Lemma 38. First we show that it suffices for the assigned-bag proposition.

#proof[
  #emph[Reduction of Proposition 33 to Lemma 38.] Let $M = sum_i delta_i sum_(t in T_i) \| "Bag"_t \|$ be the original total radius. A ball can be noninsertable by several predecessors; summing Lemma 36 over all selected nodes therefore bounds the total radius $N$ of noninsertable balls from above, without needing a unique predecessor charge:
  $ N lt.eq 4 / C_3 M lt.eq 1 / 4 M . quad "(9.47)" $ <ha:preprocess-mass>
  Here the original $24 C_3 \/ k$ assignment implies the weaker assignment needed in that lemma, and the displayed condition on $C_3$ implies $C_3 gt.eq 16$.
  Delete all noninsertable balls. If a bag retains at least half its original balls, keep the remaining bag; otherwise delete the bag and its node from the corresponding $T_i$. A kept bag is $12 C_3 \/ k$-assigned. In a deleted bag more than half the original balls were noninsertable, so its entire radius is at most twice its noninsertable radius. The same upper bound holds for the radius removed from a kept bag. The resulting sequence consequently has total radius
  $ M' gt.eq M - 2 N gt.eq M \/ 2 . $
  Discard empty families, retaining the remaining scales in their original order. The sequence retains disjointness at each scale and the geometric scale condition. Deleting selected nodes can only remove predecessors, so all surviving balls are still insertable after recomputing their labels. The hypotheses of Lemma 38 therefore hold. Combining that lemma with Lemma 37 gives
  $ sum_({ v \, w } in E) parallel X_v - X_w parallel_1 gt.eq k / 4 frac(C_4, 12 C_3) M' gt.eq k / 8 frac(C_4, 12 C_3) M \, $
  as required. ◻
]

#thm([Lemma 9.16.])[
  (Validity of an insertable input ball).  #emph[An insertable ball $B = B \( X_u \, delta_i \) in "Bag"_t$ with the input labels above satisfies Definition 9.12–Definition 9.12.]
] <ha:input-valid>

#proof[
  The definition gives Definition 9.12, and insertability says exactly that every endpoint in Definition 9.12 has distance at least $delta_i$ from $X_u$. We have already proved that $u in L \( B \)$. Every selected node is nonroot, so $\| O \( t \) \| gt.eq k$ by the cut bound in its parent’s induced graph. Moreover, $\| "Bag"_t \| gt.eq 12 C_3 \| O \( t \) \| \/ k gt.eq 12 C_3 > 1$. Choose another ball in the bag, with center vertex $w in V \( t \)$. Disjointness of the two open balls gives $X_w in.not B$, so $parallel X_u - X_w parallel_1 gt.eq delta_i$. Since $G \[ V \( t \) \]$ is $k$-edge-connected, Lemma 34 supplies $k$ pairwise edge-disjoint $u$–$w$ paths in this induced graph. These witness Definition 9.12, with inner radius zero, and in fact give the stronger count $k$ in place of $k \/ 4$. ◻
]

==== 9.4.2 The order and invariants of the construction <ha:order>

We now prove Lemma 38. Thus every remaining bag is $\( 12 C_3 \/ k \)$-assigned and every input ball is insertable. There are finitely many nonempty families; put $delta_(m + 1) = 0$ for the final accounting step. The evolving collection $Z$ consists of labeled records: different records may have the same geometric support. It starts empty. Phase $ell$ handles $cal(F)_ell$, processing its bags in increasing depth of their nodes in $cal(T)$. For equal depths choose any order.

For a candidate $A = B \( X_u \, delta_ell \) in "Bag"_t$ and a current record $B in Z$ with center $x$ and numerical inner and outer radii $r_1 < r_2$, say that $A$ is #emph[interior to $B$] if

$ C \( A \) ∩ C \( B \) eq.not diameter \, #h(2em) r_1 + C_3 delta_ell < parallel X_u - x parallel_1 < r_2 - C_3 delta_ell . quad "(9.48)" $ <ha:interior>

A ball interior to some record is an interior ball; every other candidate is a border ball. In particular, an interior ball is contained in $B$, by the triangle inequality and $C_3 > 1$.

The operations specified below maintain the following invariants. Each intermediate collection has a valid labeling. An original ball from $cal(F)_ell$ that is inserted during phase $ell$ is unchanged for the rest of that phase. All restrictions of an existing record are concentric radial restrictions and retain its labels. Any additional record created while processing $"Bag"_t$ lies inside a replaced record $B$, has conflict domain contained in $C \( B \)$, and has owner either $t \( B \)$ or $t$. In the latter case its owner is $t$ and it is nonavoiding. The only new avoiding records retain owner $t \( B \)$ and avoid $t$. The construction below verifies the required labeling conditions for each operation, so these invariants are inductive requirements, not extra hypotheses on the input.

#thm([Lemma 9.17.])[
  (Ancestor relation).  #emph[While $"Bag"_t in cal(F)_ell$ is being processed, if a candidate $A in "Bag"_t$ and a current record $B$ have intersecting conflict domains, then $t \( B \)$ is a weak ancestor of $t$, and $t in C \( B \)$.]
] <ha:ancestor>

#proof[
  Two rooted connected subtrees which intersect have comparable roots. Every current owner belongs either to an earlier family or to a bag already reached in this phase. An owner in $T_ell$ cannot be a proper descendant of $t$, by the depth order. Suppose an owner $s in T_i$, $i < ell$, were a proper descendant of $t$. Then $s in "Pred" \( t \) = t_P \( A \)$. The whole subtree of $s$, and hence $C \( B \)$, would be disjoint from $C \( A \)$. This is a contradiction. The roots are therefore ordered with $t \( B \)$ above $t$. Connectedness of $C \( B \)$ shows that the path from its root to any common node passes through $t$, proving $t in C \( B \)$. ◻
]

#thm([Lemma 9.18.])[
  (Unique interior record).  #emph[Under the preceding hypotheses, suppose $C \( A \) ∩ C \( B \) eq.not diameter$. If another current record $D eq.not B$ intersects $B$, then $C \( A \) ∩ C \( D \) = diameter$. Consequently a candidate is interior to at most one current record.]
] <ha:unique-interior>

#proof[
  If both conflict intersections were nonempty, Lemma 40 would give $t in C \( B \) ∩ C \( D \)$. This violates condition Definition 9.12 for the intersecting records $B \, D$. If $A$ were interior to both, the two records would intersect on the nonempty support of $A$, giving the same contradiction. ◻
]

#thm([Lemma 9.19.])[
  (Inheritance of separation).  #emph[Suppose $B \, D$ satisfy condition Definition 9.12. If a new record $B'$ has support contained in $B$ and $C \( B' \) subset.eq C \( B \)$, then $B' \, D$ also satisfy that condition. A concentric radial restriction of $B$ retaining all its labels also retains conditions Definition 9.12–Definition 9.12, if it has positive width.]
] <ha:heredity>

#proof[
  An intersection of $B'$ with $D$ is also an intersection of $B$ with $D$, and its conflict intersection is a subset of $C \( B \) ∩ C \( D \)$. For a concentric restriction, predecessor endpoints remain outside the smaller outer radius. The old inner witness still has distance at most the new inner radius, and the old crossing paths also cross the restricted radial interval. The labels and their induced vertex domains are unchanged. ◻
]

#thm([Lemma 9.20.])[
  (Border balls stay border balls).  #emph[During the processing of this phase, a candidate which is a border ball never becomes interior. In particular every border ball retained for the end of a bag’s processing remains a border ball at the end of the phase.]
] <ha:border-monotone>

#proof[
  Consider any single operation before the final phase transition. A newly inserted original ball has radius $delta_ell$ and cannot contain a candidate with the two radial margins in (9.48), since $C_3 > 1$. Every other new record is a concentric radial restriction of an old record, with a subset of its conflict domain. If a candidate satisfies (9.48) for that new record, it therefore satisfies it for the old record as well. Unchanged records create no new interiors. Iterating this observation proves the claim. ◻
]

==== 9.4.3 Carving the interior balls <ha:carving>

Write $\[ z \]_(+) = max { z \, 0 }$ and set

$ theta = frac(C_4, 6 C_3) . $

The assumptions on the constants imply

$ C_3 - 1 & gt.eq 2 #scale(x: 120%, y: 120%)[\(] C_4 + 4 \( C_4 + 2 \)^2 #scale(x: 120%, y: 120%)[\)] \,\
7 / 8 \( C_3 - 1 \) & gt.eq C_4 + 4 \, #h(2em) C_3 gt.eq 2 C_4 \( C_4 + 2 \) \, #h(2em) theta lt.eq frac(1, 12 \( C_4 + 2 \)) lt.eq 1 / 60 . quad "(9.49)" $ <ha:constant-consequences>

For example, the first inequality follows by subtracting $1$ from $C_3 gt.eq 2 \( C_4 + 1 \) + 8 \( C_4 + 2 \)^2$; this same lower bound gives the remaining inequalities for $C_4 gt.eq 3$.

During phase $ell$, assign a nonnegative potential to each record $A$ in the current arrangement, with center $x$ and numerical inner and outer radii $a < b$:

$ "tok"_ell \( A \) = cases(delim: "{", delta_ell - C_4 delta_(ell + 1) \, & A upright(" is an original ball of the current family ") cal(F)_ell \,, ""_(+) \, & A upright(" is nonavoiding and is not such an original ball") \,, ""_(+) \/ #scale(x: 120%, y: 120%)[\(] 2 \( C_4 + 2 \) #scale(x: 120%, y: 120%)[\)] \, & A upright(" is avoiding") .) quad "(9.50)" $ <ha:potential>

Here and below, membership in a family refers to one of its original balls, with its original record, rather than to a newly created shell that happens to have the same support. The first line satisfies

$ delta_ell - C_4 delta_(ell + 1) gt.eq 5 / 6 delta_ell . quad "(9.51)" $ <ha:fresh-potential>

Every potential is at most the width of its record. An empty shell, including a proposed shell whose outer radius is at most its inner radius, is discarded and contributes zero.

We describe the processing of a fixed bag $"Bag"_t$ in phase $ell$. Put $delta = delta_ell$. Initially partition its balls into the interior balls $"Int"_t$ and the border balls $"Bor"_t$. The sets contain only balls still awaiting treatment. Repeatedly perform one of the three operations below while

$ \| "Int"_t \| gt.eq 1 / 2 \| "Bag"_t \| . quad "(9.52)" $ <ha:interior-loop>

After an operation, remove the balls explicitly treated by it from $"Int"_t$, and transfer every remaining ball that has ceased to be interior to $"Bor"_t$. Lemma 43 ensures that this transfer is permanent. A ball removed in one of the three operations is counted as treated even in the third operation, where a pair of new shells pays for it without inserting that ball.

The subscript $s$ denotes the state after $s$ operations for this bag; the subscript $oo$ denotes the final state. In particular, set

$ n_(t \, s) = \| "Bag"_t \| - \| "Bor"_(t \, s) \| - \| "Int"_(t \, s) \| . $

Moving a ball from the interior set to the border set does not change $n_(t \, s)$. Treating $m$ balls increases it by exactly $m$.

#thm([Lemma 9.21.])[
  (Potential preserved during interior processing).  #emph[Suppose phase $ell$ starts with a valid arrangement whose potentials can pay each earlier node $v in T_i$, $i < ell$, at least $\( theta \/ 2 \) \| "Bag"_v \| delta_i$. Interior processing preserves validity and these allocations. At every intermediate state it also pays each completed node $v in T_ell$ at least $theta n_(v \, oo) delta_ell$, and the node currently being processed at least $theta n_(t \, s) delta_ell$. Each bag finishes with $\| "Int"_(t \, oo) \| < \| "Bag"_t \| \/ 2$.]
] <ha:construction>

#proof[
  We maintain actual allocations of the potentials, so that an operation must preserve all amounts already allocated. If an old record $B$ is removed, it suffices to set aside at least $"tok"_ell \( B \)$ from its replacements: those funds can then be distributed exactly as the old potential was. Any additional funds assigned to $t$ increase its allocation. Untouched records retain their allocations.
  Shrinking a record about its existing center and retaining its labels preserves all its individual validity conditions. Indeed, its old inner witness remains inside the new inner radius, its old crossing paths still cross the smaller radial interval, and all excluded boundary endpoints remain beyond the new outer radius. Pairwise validity is inherited by Lemma 42. These observations apply to every residual shell below. Original current-family balls are never carved: their width is $delta$, whereas a record containing an interior ball must have width greater than $2 C_3 delta$.
  ===== 9.4.3.1 #strong[Operation 1: carving an avoiding shell.] <operation-1-carving-an-avoiding-shell.>
  If some $A = B \( X_u \, delta \) in "Int"_t$ lies in an avoiding shell $B = B \( x \, r_1 bar.v.double r_2 \)$, put $q = parallel X_u - x parallel_1$ and replace $B$ by
  $ B_1 = B \( x \, r_1 bar.v.double q - delta \) \, #h(2em) B_2 = B \( x \, q + delta bar.v.double r_2 \) \, $
  both with the labels of $B$. Insert the original ball $A$, with its original labels, and treat it. The two residual shells are disjoint from $A$. The original ball satisfies its individual validity conditions, and Lemma 41 shows that its labels are compatible with every other existing record. This proves validity of the new arrangement.
  Write $R = r_2 - r_1$. Since $R > 2 C_3 delta$, the old potential is $\( R - C_4 delta \) \/ \( 2 \( C_4 + 2 \) \)$. Give $B$ all the potentials of $B_1 \, B_2$ and $delta \/ 2$ from $A$. Positive parts can only increase the following lower bound:
  $ "tok"_ell \( B_1 \) + "tok"_ell \( B_2 \) + delta / 2 & gt.eq frac(R - 2 delta - 2 C_4 delta, 2 \( C_4 + 2 \)) + delta / 2\
 & = frac(R - C_4 delta, 2 \( C_4 + 2 \)) = "tok"_ell \( B \) . $
  The remaining potential of $A$ is at least
  $ delta - C_4 delta_(ell + 1) - delta / 2 gt.eq delta / 3 gt.eq theta delta . $
  Give it to $t$. Thus treating this one ball preserves every old allocation and increases the allocation to $t$ by the required amount.
  ===== 9.4.3.2 #strong[The common setup for operations 2 and 3.] <the-common-setup-for-operations-2-and-3.>
  Suppose no ball of $"Int"_t$ is interior to an avoiding shell. Write $t^(*)$ for the parent of $t$. If enough interior centers lie near a short radial interval, inserting their balls will pay for the width removed from the old record. When the interval is long compared with their total radius, we instead create two overlapping central shells with crossing paths in $G \[ V \( t \) \]$ and $G \[ V \( t^(*) \) \\ V \( t \) \]$, respectively. Local connectivity supplies the first set of paths; the decomposition below supplies the second. Define
  $ H = G \[ V \( t^(*) \) \\ V \( t \) \] \, #h(2em) O' \( t \) = { { u \, v } in O \( t \) : parallel X_u - X_v parallel_1 < delta } . $
  Partition $V \( H \)$ into sets $S_1 \, dots.h \, S_j$ whose induced graphs are $k \/ 4$-edge-connected, by repeatedly splitting a part along a cut of size less than $k \/ 4$ until no such cut remains. Singleton parts are allowed. There are $j - 1$ splits, and each edge between final parts is counted at precisely the split that first separates its endpoints. Consequently
  $ sum_(i = 1)^j \| partial_H S_i \| < k / 2 \( j - 1 \) quad \( j > 1 \) \, $
  and the sum is zero when $j = 1$. Each $S_i$ is a nonempty proper subset of $V \( t^(*) \)$, so the $k$-edge-connectivity of $G \[ V \( t^(*) \) \]$ gives
  $ j k & lt.eq sum_(i = 1)^j \| partial_(G \[ V \( t^(*) \) \]) S_i \|\
 & = \| O \( t \) \| + sum_(i = 1)^j \| partial_H S_i \| lt.eq \| O \( t \) \| + k / 2 \( j - 1 \) . $
  In particular,
  $ j lt.eq frac(2 \| O \( t \) \|, k) . quad "(9.53)" $ <ha:component-count>
  This proves the decomposition estimate directly, including when $H$ is disconnected and without assuming that $k \/ 4$ is an integer.
  Let $U$ be the centers, identified with vertices, of the balls still in $"Int"_t$, and set
  $ U_i & = { u in U : { u \, v } in O' \( t \) upright(" for some ") v in S_i } \,\
V_i & = { v in S_i : { u \, v } in O' \( t \) upright(" for some ") u in U } . $
  The definition of an assigned bag ensures $union.big_i U_i = U$. By the loop condition and the $12 C_3 \/ k$ assignment bound,
  $ \| U \| gt.eq 1 / 2 \| "Bag"_t \| gt.eq frac(6 C_3 \| O \( t \) \|, k) . $
  Choose $i$ with $\| U_i \|$ maximal. Even if the sets $U_i$ overlap, their union bound and (9.53) imply
  $ \| U_i \| gt.eq frac(\| U \|, j) gt.eq 3 C_3 . quad "(9.54)" $ <ha:many-neighbors>
  Choose a nonavoiding record $B$ with center $x$ and numerical radii $r_1 < r_2$, containing in its interior a ball with center $u_0 in U_i$. Such a record exists because every ball still under consideration is interior and operation 1 is unavailable. Write $rho \( z \) = parallel X_z - x parallel_1$ and put
  $ a = max { r_1 \, min_(v in V_i) rho \( v \) } \, #h(2em) b = min { r_2 \, max_(v in V_i) rho \( v \) } \, #h(2em) L = b - a . quad "(9.55)" $ <ha:radial-endpoints>
  The neighbor of $u_0$ in $V_i$ has radius strictly between $r_1 + \( C_3 - 1 \) delta$ and $r_2 - \( C_3 - 1 \) delta$. In particular $a lt.eq b$. Define
  $ cal(A) = { B \( X_u \, delta \) in "Int"_t : a - delta < rho \( u \) < b + delta } \, #h(2em) U_(cal(A)) = { u : B \( X_u \, delta \) in cal(A) } \, #h(2em) m = \| cal(A) \| . $
  The set $cal(A)$ is nonempty, since it contains the ball centered at $u_0$.
  Every ball $A in cal(A)$ is in the interior of $B$. To check this carefully, the radial inequalities defining $cal(A)$ imply that $A$ meets the support of $B$: its center is less than $delta$ in radial distance from $\[ r_1 \, r_2 \]$. This assertion also holds for supports restricted to the cube. To decrease radius, move towards the binary center $x$; to increase it, move towards the opposite cube vertex. Along either segment, the change of radius equals the distance moved. Since $B$ is nonempty, one can therefore reach a point of $B$ within distance strictly less than $delta$. All balls of $"Bag"_t$ have the same labels, so $C \( A \)$ intersects $C \( B \)$. Also $A$ is interior to some existing record $B'$. If $B' eq.not B$, then $B$ meets $B'$ at a point of $A$, since the interior margin implies $A subset.eq B'$. Lemma 41 contradicts $C \( A \) ∩ C \( B \) eq.not diameter$. Therefore $B' = B$, as claimed.
  We need one more radial estimate:
  $ U_i subset.eq.not U_(cal(A)) quad arrow.r.double quad L gt.eq \( C_3 - 1 \) delta . quad "(9.56)" $ <ha:radial-range>
  If every $v in V_i$ had $r_1 < rho \( v \) < r_2$, then all their radii would lie in $\[ a \, b \]$. Each $u in U_i$ has a neighbor $v in V_i$ with $\| rho \( u \) - rho \( v \) \| < delta$, so it would lie in $U_(cal(A))$. Hence the premise of (9.56) supplies some $v in V_i$ with $rho \( v \) gt.eq r_2$ or $rho \( v \) lt.eq r_1$. Let $w in V_i$ be a neighbor of the chosen interior center $u_0$. If $rho \( v \) gt.eq r_2$, then $b = r_2$, while
  $ a lt.eq rho \( w \) < rho \( u_0 \) + delta < r_2 - \( C_3 - 1 \) delta . $
  If $rho \( v \) lt.eq r_1$, then $a = r_1$, while
  $ b gt.eq rho \( w \) > rho \( u_0 \) - delta > r_1 + \( C_3 - 1 \) delta . $
  These prove both cases of (9.56).
  ===== 9.4.3.3 #strong[Operation 2: a dense group in the radial interval.] <operation-2-a-dense-group-in-the-radial-interval.>
  Suppose $m delta > 3 L$. Replace $B$ by
  $ B_1 = B \( x \, r_1 bar.v.double a - 2 delta \) \, #h(2em) B_2 = B \( x \, b + 2 delta bar.v.double r_2 \) \, $
  with its labels, and insert all $m$ original balls of $cal(A)$, with their original labels. Treat these $m$ balls. Their supports are disjoint from $B_1 \, B_2$ because their centers have radii strictly between $a - delta$ and $b + delta$. They are pairwise disjoint as members of the same family. We proved that each lies in the interior of $B$, so Lemma 41 makes each compatible with every old record other than $B$. Their individual conditions follow from insertability. Residual shells inherit validity, proving that the whole replacement is valid.
  The number treated is large. If $U_i subset.eq U_(cal(A))$, then (9.54) gives $m gt.eq 3 C_3$. Otherwise, (9.56) and $m delta > 3 L$ give
  $ m gt.eq 3 \( C_3 - 1 \) . quad "(9.57)" $ <ha:dense-count>
  Allocate to $B$ all the potential of $B_1 \, B_2$ and three quarters of the potential of each newly inserted ball. Writing $R = r_2 - r_1$, the old potential is $R - C_4 delta$; it is positive because $B$ contains an interior ball. Even if a residual shell is empty, its potential is at least its formal width minus $C_4 delta$. Therefore
  $ & "tok"_ell \( B_1 \) + "tok"_ell \( B_2 \) + 3 / 4 sum_(A in cal(A)) "tok"_ell \( A \)\
 & quad gt.eq R - L - 4 delta - 2 C_4 delta + 5 / 8 m delta\
 & quad gt.eq "tok"_ell \( B \) - \( C_4 + 4 \) delta + 7 / 24 m delta\
 & quad gt.eq "tok"_ell \( B \) - \( C_4 + 4 \) delta + 7 / 8 \( C_3 - 1 \) delta\
 & quad gt.eq "tok"_ell \( B \) . $
  The successive estimates use (9.51), $L < m delta \/ 3$, (9.57), and (9.49). Each inserted ball retains at least $\( 1 \/ 4 \) \( 5 \/ 6 \) delta = 5 delta \/ 24 gt.eq theta delta$ to give to $t$. Thus this operation supplies at least $theta m delta$ new credit.
  ===== 9.4.3.4 #strong[Operation 3: a sparse group in the radial interval.] <operation-3-a-sparse-group-in-the-radial-interval.>
  Suppose $m delta lt.eq 3 L$. We first record that
  $ L gt.eq \( C_3 - 1 \) delta . quad "(9.58)" $ <ha:sparse-width>
  If $U_i subset.eq.not U_(cal(A))$ this follows from (9.56); otherwise $L gt.eq m delta \/ 3 gt.eq \| U_i \| delta \/ 3 gt.eq C_3 delta$. In particular, all the central shells defined next have positive width.
  Replace $B$ by the two residual shells
  $ B_1 = B \( x \, r_1 bar.v.double a \) \, #h(2em) B_2 = B \( x \, b bar.v.double r_2 \) \, $
  with its labels. Insert two additional shells
  $ B_3 = B \( x \, a + delta bar.v.double b - delta \) \, #h(2em) B_4 = B \( x \, a bar.v.double b \) . $
  The shell $B_3$ is nonavoiding and $B_4$ is avoiding. Give them labels
  $ & t \( thin dot.op thin \) & t_d \( thin dot.op thin \) & t_P \( thin dot.op thin \)\
B_3 & t & upright("none") & { v in t_P \( B \) : v upright(" is a proper descendant of ") t }\
B_4 & t \( B \) & t & t_P \( B \) . quad "(9.59)" $ <ha:central-labels>
  Treat all the balls of $cal(A)$, removing them from $"Int"_t$ without inserting them.
  We verify every new labeling condition. Lemma 40 implies that $t \( B \)$ is a weak ancestor of $t$ and that $t in C \( B \)$. In fact $t \( B \) eq.not t$. An original ball with owner $t$ cannot meet an unprocessed ball of the same family, since that family is disjoint. A synthetic shell with owner $t$ could only have been created by an earlier occurrence of this operation while processing this very bag: the sets $T_i$ are disjoint, and new nonavoiding owners are assigned only to the node being processed. At that earlier occurrence every remaining interior ball meeting the new central shell was in its expanded radial interval and was treated. Subsequent changes only restrict that shell, and Lemma 43 prohibits the return of a border ball to the interior set. Hence neither that shell nor any of its residual pieces can now contain an unprocessed interior ball. This proves $t \( B \) eq.not t$. Thus $t$ is a proper descendant of $t \( B \)$, as required for $B_4$ to be avoiding.
  Using $cal(T) \[ t \]$ for the subtree rooted at $t$, the labels give
  $ C \( B_3 \) = C \( B \) ∩ cal(T) \[ t \] \, #h(2em) C \( B_4 \) = C \( B \) \\ cal(T) \[ t \] . quad "(9.60)" $ <ha:conflict-partition>
  Indeed, no member of $t_P \( B \)$ is a weak ancestor of $t$, since $t in C \( B \)$; every remaining excluded subtree either lies below $t$ or is disjoint from its subtree. Both new conflict domains have the prescribed connected form and are subsets of $C \( B \)$. All four shells are subsets of $B$. The pairwise validity with old records follows from Lemma 42; the residual shells are disjoint from the central shells, and (9.60) proves validity of the overlapping pair $B_3 \, B_4$. Finally, both new excluded-node sets are subsets of $t_P \( B \)$ and both new outer radii are at most $r_2$. Thus the excluded-boundary-endpoint condition is preserved.
  It remains to prove the crossing-path condition, which does not follow merely from shrinking the geometric support when labels change. Choose vertices $v_1 \, v_2 in V_i$ minimizing and maximizing $rho$, and choose their respective neighbors $u_1 \, u_2 in U_i$ along edges of $O' \( t \)$. Clipping in (9.55) gives
  $ rho \( v_1 \) lt.eq a \, quad rho \( v_2 \) gt.eq b \, #h(2em) rho \( u_1 \) < a + delta \, quad rho \( u_2 \) > b - delta . quad "(9.61)" $ <ha:radial-witnesses>
  By (9.58), $a + delta < b lt.eq r_2$. Hence $rho \( u_1 \) < r_2$ and $rho \( v_1 \) < r_2$; these strict inequalities will exclude membership in the forbidden subtrees.
  For $B_3$, the $k$-edge-connectivity of $G \[ V \( t \) \]$ and Lemma 34 supply $k$ edge-disjoint $u_1$–$u_2$ paths. The radial inequalities show that each crosses $B_3$. To see that the initial vertex is in $C \( B_3 \)$, fix $z in t_P \( B_3 \)$. If $u_1 in V \( z \)$, the edge ${ u_1 \, v_1 } in O' \( t \)$ would belong to $P \( z \)$ because $z$ is below $t$ and $v_1 in.not V \( t \)$. This contradicts the endpoint condition of $B$, since $z in t_P \( B \)$ but $rho \( u_1 \) < r_2$. Thus $u_1$ avoids every excluded subtree and lies in $C \( B_3 \)$. These paths and this initial vertex prove the required crossing condition for $B_3$.
  For $B_4$, every cut separating $v_1$ from $v_2$ in $G \[ S_i \]$ has at least $ceil.l k \/ 4 ceil.r$ edges. Lemma 34 therefore supplies at least $k \/ 4$ edge-disjoint $v_1$–$v_2$ paths. Since $t \( B \)$ is a proper ancestor of $t$, $V \( t^(*) \) subset.eq V \( t \( B \) \)$. The paths therefore lie in $V \( t \( B \) \) \\ V \( t \)$ and cross $B_4$. Fix $z in t_P \( B_4 \)$. The edge ${ u_1 \, v_1 }$ cannot belong to $P \( z \)$ because $rho \( v_1 \) < r_2$. If $v_1 in V \( z \)$, it follows that $u_1 in V \( z \)$ also. A hierarchy set containing both $u_1 in V \( t \)$ and $v_1 in.not V \( t \)$ must be a proper ancestor of $t$, by laminarity. This would make $z$ a weak ancestor of $t$, contrary to $t in C \( B \)$. Hence $v_1$ lies in none of the excluded subtrees; also $v_1 in.not V \( t \)$, so $v_1 in C \( B_4 \)$. This verifies the crossing condition for $B_4$ and completes the proof of validity.
  For later use, every still-unprocessed interior ball is disjoint from $B_3$ and $B_4$: its center is outside the expanded interval $\( a - delta \, b + delta \)$. Such a ball can remain interior to $B_1$ or $B_2$, which is harmless. This establishes the property of new central shells used above to prove that $t \( B \)$ is a proper ancestor.
  We now distribute the new potentials. The shell $B_3$, although created in the current phase, is not an original current-family ball; it uses the second line of (9.50). Give $B$ all the potential of $B_1 \, B_2 \, B_3$ and $\( 2 C_4 + 2 \) delta$ from $B_4$. The sum of the three formal nonavoiding widths is $R - 2 delta$, where $R = r_2 - r_1$. Consequently
  $ sum_(j = 1)^3 "tok"_ell \( B_j \) + \( 2 C_4 + 2 \) delta & gt.eq R - 2 delta - 3 C_4 delta + \( 2 C_4 + 2 \) delta\
 & = R - C_4 delta = "tok"_ell \( B \) . $
  The following estimate proves both that $B_4$ has the amount just promised and that it can additionally pay for all $m$ treated balls:
  $ "tok"_ell \( B_4 \) - \( 2 C_4 + 2 \) delta & = frac(L - C_4 delta - 4 \( C_4 + 1 \) \( C_4 + 2 \) delta, 2 \( C_4 + 2 \))\
 & gt.eq frac(L - { C_4 + 4 \( C_4 + 2 \)^2 } delta, 2 \( C_4 + 2 \))\
 & gt.eq frac(L - \( C_3 - 1 \) delta \/ 2, 2 \( C_4 + 2 \))\
 & gt.eq frac(L, 4 \( C_4 + 2 \)) gt.eq frac(m delta, 12 \( C_4 + 2 \)) gt.eq theta m delta . $
  The first equality is valid because (9.58) makes $L - C_4 delta$ positive. The other steps use $C_4 + 1 lt.eq C_4 + 2$, (9.49), (9.58), the case assumption $m delta lt.eq 3 L$, and $C_3 gt.eq 2 C_4 \( C_4 + 2 \)$, respectively. Give the remaining amount to $t$. This completes the allocation for operation 3.
  Each operation treats at least one interior ball, preserves all old allocations, and gives $t$ at least $theta delta$ for each ball it treats. Border transfers change neither this count nor any allocation. Induction on the number of operations proves the stated bound for $t$, and induction on the bags already processed in the phase proves the bounds for the other current-phase nodes. The loop terminates after at most $\| "Bag"_t \|$ operations; its negated stopping condition gives the asserted strict half-bag bound. This proves the lemma. The first phase starts with an empty arrangement and no old allocations; the transfer of these allocations between phases is verified in the next subsection. ◻
]

==== 9.4.4 Completing a phase <ha:postprocess>

We complete the induction in Lemma 44 by handling the border balls. At the end of processing the bags of $cal(F)_ell$, let $"Bor"_t$ and $"Int"_t$ be the unprocessed border and interior balls left by its loop. The loop stops with $\| "Int"_t \| < \| "Bag"_t \| \/ 2$. It is enough to give each $t in T_ell$ an additional

$ frac(C_4, 6 C_3) \| "Bor"_t \| delta_ell $

tokens. Together with the credit already obtained during its loop, this gives at least

$ frac(C_4, 6 C_3) \( \| "Bag"_t \| - \| "Int"_t \| \) delta_ell med gt.eq med frac(C_4, 12 C_3) \| "Bag"_t \| delta_ell . quad "(9.62)" $ <ha:phase-target>

Write $Z$ for the collection just before this last step, $p \( B \) = "tok"_ell \( B \)$, and let $q \( B \)$ be the token value of the same unchanged record at the beginning of phase $ell + 1$. Thus for an original ball inserted in the current phase both $p \( B \)$ and $q \( B \)$ equal $delta_ell - C_4 delta_(ell + 1)$. For all other nonavoiding records the threshold in the positive part decreases from $C_4 delta_ell$ to $C_4 delta_(ell + 1)$; for avoiding records the same formula is divided by $2 \( C_4 + 2 \)$. In particular $q \( B \) gt.eq p \( B \)$. Set

$ b = sum_(t in T_ell) \| "Bor"_t \| \, #h(2em) e = sum_(B in Z) \( q \( B \) - p \( B \) \) . $

If $b = 0$ there is no border credit to supply, and the phase is complete. If $e gt.eq \( C_4 \/ \( 6 C_3 \) \) b delta_ell$, retain $Z$ and distribute these extra tokens among the current nodes in proportion to $\| "Bor"_t \|$. Every node obtains the required additional amount, and all earlier credits remain available.

It remains to handle

$ e < frac(C_4, 6 C_3) b delta_ell . quad "(9.63)" $ <ha:small-excess>

Leave current-phase original balls unchanged. Replace every other record $B$, with center $x$ and numerical radii $r_1 < r_2$, by the concentric restriction

$ S \( B \) = B #scale(x: 120%, y: 120%)[\(] x \, r_1 + \( C_3 + 1 \) delta_ell med bar.v.double med r_2 - \( C_3 + 1 \) delta_ell #scale(x: 120%, y: 120%)[\)] \, $

discarding it if the displayed interval has nonpositive width. Use the same labels on each surviving restriction, and assign a discarded record token value zero. Finally insert all balls of $union.big_(t in T_ell) "Bor"_t$ with their original labels.

Here is a direct verification of separation, including the role of conflict domains. For a border ball $A = B \( X_u \, delta_ell \)$, consider an old record $B$ whose conflict domain meets $C \( A \)$. Lemma 43 says that $A$ is still border, so

$ parallel X_u - x parallel_1 lt.eq r_1 + C_3 delta_ell quad upright("or") quad parallel X_u - x parallel_1 gt.eq r_2 - C_3 delta_ell . $

In the first case every point of $A$ has distance strictly less than the new inner radius; in the second it has distance strictly greater than the new outer radius. Thus $A$ does not meet $S \( B \)$. If the conflict domains are disjoint no geometric separation is needed. The original balls in the current family are pairwise disjoint, so no conflict arises either with an unchanged current-phase ball or with another newly inserted border ball. The other validity conditions follow from Lemmas 39 and 42. Hence the new collection is valid.

#thm([Lemma 9.22.])[
  (The cost of shrinking).  #emph[Under (9.63), the total token deficit created by the restrictions satisfies 
$ sans(D) := sum_(B in Z) #scale(x: 120%, y: 120%)[\(] p \( B \) - q \( S \( B \) \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 2 b delta_ell . $

 Every summand defining $sans(D)$ is nonnegative.]
] <ha:shrink-cost>

#proof[
  For unchanged original balls both the deficit and $q \( B \) - p \( B \)$ are zero. For any other record the decrease of width is $2 \( C_3 + 1 \) delta_ell$, unless the record disappears entirely. This exceeds the decrease of the threshold, so the deficit is nonnegative. We prove, record by record,
  $ q \( B \) - p \( B \) gt.eq frac(C_4, 3 C_3) #scale(x: 120%, y: 120%)[\(] p \( B \) - q \( S \( B \) \) #scale(x: 120%, y: 120%)[\)] . quad "(9.64)" $ <ha:shrink-comparison>
  If $p \( B \) = 0$, its deficit is zero and the inequality is immediate. Otherwise, first take a nonavoiding record of width $w$. Since $w > C_4 delta_ell$ and $delta_(ell + 1) lt.eq delta_ell \/ 3$,
  $ q \( B \) - p \( B \) = C_4 \( delta_ell - delta_(ell + 1) \) gt.eq 2 / 3 C_4 delta_ell . $
  Using the positive-part formula, whether or not the restriction survives,
  $ p \( B \) - q \( S \( B \) \) lt.eq 2 \( C_3 + 1 \) delta_ell - C_4 \( delta_ell - delta_(ell + 1) \) lt.eq 2 C_3 delta_ell \, $
  where the last step uses $C_4 gt.eq 3$. These two bounds imply (9.64). For avoiding records both sides of these estimates have the common factor $1 \/ \( 2 \( C_4 + 2 \) \)$, giving exactly the same conclusion. Summing (9.64) and then using (9.63) gives $sans(D) lt.eq \( 3 C_3 \/ C_4 \) e lt.eq b delta_ell \/ 2$. ◻
]

Each newly inserted border ball has $delta_ell - C_4 delta_(ell + 1)$ tokens. Reserve at most $delta_ell \/ 2$ of these to cover the deficits of the old records. Lemma 45 guarantees enough in the resulting pool: if $sans(D) > 0$, distribute the pool in proportion to the individual deficits, stopping once each is paid; if $sans(D) = 0$, no transfer is needed. Send the tokens of $S \( B \)$ together with this payment back to the old record $B$, and redistribute its former credits by induction. Each border ball still has at least

$ delta_ell - C_4 delta_(ell + 1) - 1 / 2 delta_ell gt.eq 1 / 3 delta_ell gt.eq frac(C_4, 6 C_3) delta_ell $

tokens for its own node. The first inequality uses $C_4 lambda lt.eq 1 \/ 6$; the second follows from the stated lower bound on $C_3$. This supplies precisely the missing border credit.

Both phase-transition cases preserve all previous credits and give (9.62) to every node of the current family. Starting with $Z = diameter$ and applying the interior construction and the phase transition for $ell = 1 \, dots.h \, m$ therefore yields

$ frac(C_4, 12 C_3) sum_(i = 1)^m delta_i sum_(t in T_i) \| "Bag"_t \| lt.eq sum_(B in Z) "tok"_(m + 1) \( B \) lt.eq sum_(B in Z) "width" \( B \) . $

This proves Lemma 38, completing the proof of Proposition 33 by the reduction above. If a countable geometric sequence is used, apply the finite statement to every initial segment and take the increasing limit of its nonnegative right-hand mass; no limiting arrangement is required.

=== 9.5 The parameter choice and the shortcut matrix <hp:endpoint>

#proof[
  All cut constraints in this proof are for nonempty proper subsets of the vertex set. If the marked set $cal(M)$ is empty, a sufficiently small positive multiple of the identity is a shortcut, so suppose it is nonempty. Write $q$ for the connectivity parameter of the theorem. We may require $q$ to exceed an absolute cutoff, which will be increased finitely many times below.
  Fix an arbitrary binary embedding $X : V arrow.r { 0 \, 1 }^d$ and an arbitrary row semiorthogonal matrix $U in bb(R)^(E times d)$ as in Lemma 24, and suppose that
  $ cal(E) = sum_(e in E) parallel X b_e parallel_2^2 > 0 . $
  The map $U$ is a contraction. By changing its row signs, we may assume
  $ a_e = chevron.l u_e \, X b_e chevron.r gt.eq 0 #h(2em) \( e in E \) . $
  This can only increase the numerator to be bounded. Put $d_e = parallel X b_e parallel_2^2 = parallel X b_e parallel_1$ and, for $t in cal(M)$, set
  $ N_t = frac(1, \| O \( t \) \|) (sum_(e in O \( t \)) a_e)^2 . $
  Choose
  $ alpha = q^(- 4 \/ 5) \, #h(2em) epsilon.alt = 1 / 10 \, #h(2em) beta = 36 \, #h(2em) rho = frac(1, 2 q^2) \, #h(2em) C_4 = 3 \, #h(2em) C_3 = 10^4 . quad "(9.65)" $ <hp:parameters>
  Let $T subset.eq cal(M)$ consist of the $alpha$-bad nodes with positive numerator, in the sense of Definition 27. Each node outside $T$ either has zero numerator or satisfies $N_t < alpha sum_(e in O \( t \)) d_e$. Since each edge lies in at most two parent boundaries,
  $ sum_(t in cal(M) \\ T) N_t lt.eq 2 alpha cal(E) . quad "(9.66)" $ <hp:good>
  If $T$ is empty, this already bounds the entire numerator. Otherwise we apply Proposition 30 to $T$, with its geometric ratio $lambda$ set equal to $rho$ and its small parameter $s$ given by
  $ J & = 1 + ⌈log_2 \( 256 \/ alpha^2 \)⌉ \, & C_2 & = 128 J^4 \, & s & = alpha \/ C_2 \,\
L & = 2 + ceil.l log_2 \( 1 \/ s \) ceil.r \, & H & = 1 + ceil.l log_2 \( 24 \/ \( rho s^2 \) \) ceil.r \, & C_1 & = 1024 epsilon.alt^(- 2) . quad "(9.67)" $ <hp:small-parameters>
  These quantities depend on $q$ alone. In particular, for absolute constants $c_2 \, c_5$ and all sufficiently large $q$,
  $ C_2 lt.eq c_2 \( 1 + log q \)^4 \, #h(2em) L \, H lt.eq c_5 \( 1 + log q \) . quad "(9.68)" $ <hp:log-growth>
  For example, the first inequality follows immediately from $log_2 \( 256 \/ alpha^2 \) = 8 + \( 8 \/ 5 \) log_2 q$; the other two follow by taking logarithms of $s = q^(- 4 \/ 5) \/ C_2$ and $rho = 1 \/ \( 2 q^2 \)$.
  The smallness condition in Proposition 30 holds eventually because $s^epsilon.alt lt.eq q^(- 2 \/ 25) arrow.r 0$, whereas $48 beta C_1$ is an absolute constant. The assignment strength it provides also satisfies
  $ s^(1 + 2 epsilon.alt) = q^(- 24 \/ 25) / C_2^(6 \/ 5) gt.eq frac(24 C_3, q) quad "(9.69)" $ <hp:assignment-strength>
  for all sufficiently large absolute $q$. Indeed, after multiplication by $q$, its left side is $q^(1 \/ 25) \/ C_2^(6 \/ 5)$, which tends to infinity by (9.68).
  The proposition therefore yields a $rho$-geometric sequence, either of $36$-compact families or of families that are at least $\( 24 C_3 \/ q \)$-assigned. Let its mass be $sans(M)$. Its guarantee is
  $ sans(M) gt.eq frac(s^epsilon.alt, 384 beta C_1 C_2 L H) sum_(t in T) N_t . quad "(9.70)" $ <hp:captured-numerator>
  In the assigned case, a stronger assignment implies the required weaker assignment because the cardinality condition is a lower bound. The selected nodes are a subset of the original marked nodes, so
  $ \| O \( t \) \| gt.eq 1 / q \| P \( t \) \| gt.eq q rho \| P \( t \) \| . $
  Thus the hierarchy satisfies the hypothesis of Proposition 33 with $k = q$ and $lambda = rho$. The constants in (9.65) obey its numerical restrictions, and $rho lt.eq 1 \/ 18$ for all sufficiently large $q$. In the compact case, Proposition 31 applies, since $rho lt.eq 1 \/ 12$. Both cases give the uniform lower bound
  $ cal(E) gt.eq kappa q sans(M) \, #h(2em) kappa = frac(C_4, 96 C_3) = 1 / 320000 . quad "(9.71)" $ <hp:charged-energy>
  The energy is the same in the dual and charging estimates, since each coordinate of $X b_e$ is $0$, $1$, or $- 1$.
  Combining (9.70) and (9.71) proves
  $ frac(sum_(t in T) N_t, cal(E)) lt.eq frac(384 beta C_1 C_2 L H, kappa q s^epsilon.alt) lt.eq c_6 q^(- 23 \/ 25) \( 1 + log q \)^7 quad "(9.72)" $ <hp:bad>
  for an absolute $c_6$. To check the final exponent, substitute $s^epsilon.alt = q^(- 2 \/ 25) C_2^(- 1 \/ 10)$ and use (9.68); the logarithmic power before rounding up is $4 \( 11 \/ 10 \) + 2 = 32 \/ 5 < 7$.
  Equations (9.66) and (9.72), including the case $T$ is empty, yield the uniform bound
  $ frac(sum_(t in cal(M)) N_t, cal(E)) lt.eq 2 q^(- 4 \/ 5) + c_6 q^(- 23 \/ 25) \( 1 + log q \)^7 = o \( q^(- 31 \/ 40) \) . quad "(9.73)" $ <hp:dual-final>
  Every constant in this estimate is absolute, and the embedding and semiorthogonal matrix were arbitrary. Hence the same upper bound holds for the supremum $Q_(*)$ of Lemma 24. Increase the absolute integer cutoff $q_H$ so that the right side of (9.73) is at most $q^(- 31 \/ 40) \/ 2$ for $q gt.eq q_H$, as well as so that all previous numerical conditions hold. Applying that lemma with $K = q^(- 31 \/ 40) \/ 2$ and $eta = q^(- 31 \/ 40) \/ 2$ supplies a feasible full positive definite $D$ whose every marked average is less than $q^(- 31 \/ 40)$. This proves the theorem. In particular, selecting a feasible matrix from the infimum uses only strict slack; no assertion of attainment is needed. ◻
]

== 10 A finite-dimensional fixed-point theorem <sec:fixedpoint>

We prove the finite-dimensional fixed-point theorem of Brouwer #cite(label("Brouwer")) used in the extraction step, including its combinatorial ingredient.

#thm([Theorem 10.1.])[
  (Finite-dimensional fixed point).  #emph[Let $K$ be a nonempty compact convex subset of a finite-dimensional real vector space. Every continuous map $F : K arrow.r K$ has a fixed point.]
] <thm:fixedpoint>

=== 10.1 Triangulations with arbitrarily small mesh <triangulations-with-arbitrarily-small-mesh>

A $d$-simplex is the convex hull of $d + 1$ affinely independent points; its faces are the convex hulls of subsets of its vertices. A finite triangulation of a $d$-simplex consists of finitely many $d$-simplices and all their faces, covering the original simplex, such that two members intersect in a common face or not at all. Its #emph[mesh] is the largest diameter of its members. We first construct such triangulations with mesh tending to zero.

Let $S$ have vertices $a_0 \, dots.h \, a_d$. For every nonempty vertex set $A$, write $b_A = \| A \|^(- 1) sum_(a in A) a$. The barycentric subdivision of $S$ has one simplex

$ "conv" { b_(A_0) \, dots.h \, b_(A_d) } \, #h(2em) A_k = { a_(pi \( 0 \)) \, dots.h \, a_(pi \( k \)) } \, $

for each permutation $pi$ of ${ 0 \, dots.h \, d }$, together with all faces of these simplices. The displayed barycenters are affinely independent: their coordinate columns in the ordered vertices of $S$ form an invertible triangular matrix.

Here is a direct verification of the covering and intersection properties. Write $x = sum_i lambda_i a_i$, where $lambda_i gt.eq 0$ and $sum_i lambda_i = 1$, and order the coordinates so that $lambda_(pi \( 0 \)) gt.eq dots.h.c gt.eq lambda_(pi \( d \))$. With $lambda_(pi \( d + 1 \)) := 0$, put

$ t_k = \( k + 1 \) \( lambda_(pi \( k \)) - lambda_(pi \( k + 1 \)) \) . $

Then

$ t_k gt.eq 0 \, quad sum_(k = 0)^d t_k = 1 \, quad x = sum_(k = 0)^d t_k b_(A_k) . $

Conversely, a convex combination of these barycenters has coordinates in that order. Whenever $t_k > 0$, the prefix $A_k$ is the set of vertices whose coordinates are at least the corresponding positive coordinate level. Thus the barycenters with positive coefficients are determined by $x$, independently of how tied coordinates are ordered. Two subdivision simplices consequently intersect exactly in the convex hull of their common vertices. Their faces inherit the same property. On any face of $S$, coordinates outside that face are zero, so this construction restricts exactly to the barycentric subdivision of that face. Subdividing each member of a triangulation therefore gives another finite triangulation: the constructions agree on shared faces, and simplices in different original members can intersect only there.

For nested nonempty vertex sets $A subset.neq B$,

$ b_B = frac(\| A \|, \| B \|) b_A + (1 - frac(\| A \|, \| B \|)) b_(B \\ A) \, #h(2em) parallel b_B - b_A parallel lt.eq frac(d, d + 1) "diam" \( S \) . $

The diameter of a convex hull is at most the largest distance between its vertices, by the triangle inequality applied to convex combinations. Every new simplex thus has diameter at most $d \/ \( d + 1 \)$ times that of its parent. For $d gt.eq 1$, iterating gives mesh tending to zero. The case $d = 0$ is immediate.

=== 10.2 Sperner’s counting argument <sperners-counting-argument>

Write

$ Delta_d = { x in bb(R)^(d + 1) : x_i gt.eq 0 med \( 0 lt.eq i lt.eq d \) \, quad sum_(i = 0)^d x_i = 1 } . $

A triangulation restricts to a triangulation of each face of $Delta_d$: intersecting a small simplex with a coordinate hyperplane $x_i = 0$ selects precisely its vertices on that hyperplane, since all coordinates are nonnegative. The intersections of full dimension cover the face: their union is closed, while the remaining finitely many lower-dimensional simplices cannot cover any relatively open subset of the face. Every smaller member is a face of a full-dimensional one, by the common-face property applied at a relative interior point of the smaller member.

#thm([Lemma 10.2.])[
  (Sperner #cite(label("Sperner1928"))).  #emph[Label every vertex $v$ of a finite triangulation of $Delta_d$ by an integer $ell \( v \) in { 0 \, dots.h \, d }$, with $v_(ell \( v \)) > 0$. The number of $d$-simplices whose vertex labels are $0 \, dots.h \, d$, each occurring once, is odd.]
] <lemma:sperner>

#proof[
  For $d gt.eq 1$, we use the following elementary incidence fact. A small $\( d - 1 \)$-face belongs to two small $d$-simplices if it is not contained in the boundary, and to one if it is. To see this, choose a point in its relative interior. Any simplex containing that point contains the entire face, by the common-face intersection property. Finiteness allows a sufficiently small ball in the affine hull of $Delta_d$, centered at the point, to avoid all other simplices. Shrinking the ball further, each incident $d$-simplex occupies exactly one half of this ball, on one side of the face’s affine hyperplane: the point lies on none of its other facets. Disjoint interiors permit at most one simplex on either side, and the covering property supplies all sides belonging to $Delta_d$. A boundary $\( d - 1 \)$-face lies in exactly one original facet, so precisely one side belongs to $Delta_d$. Indeed, a coordinate vanishing at a relative interior point vanishes on the whole face, and two distinct original facets intersect in dimension at most $d - 2$.
  Induct on $d$. For $d = 0$, there is one vertex, labeled zero. For $d gt.eq 1$, call a small $\( d - 1 \)$-face #emph[special] if its labels are exactly $0 \, dots.h \, d - 1$. Count incidences between small $d$-simplices and their special faces. A simplex with all $d + 1$ labels contributes one incidence. A simplex containing $0 \, dots.h \, d - 1$ but not $d$ has exactly one repeated label and contributes two, by deleting either vertex with that label. Every other simplex contributes zero. Modulo two, the incidence count is therefore the number asserted to be odd.
  By the incidence fact, the same count modulo two is the number of special faces on the boundary. Such a face cannot lie in $x_i = 0$ for $i < d$, since then none of its vertices could receive label $i$. Hence these are exactly the fully labeled top-dimensional simplices in the induced triangulation of $x_d = 0$. The labels there satisfy the same rule in dimension $d - 1$, and induction makes their number odd. ◻
]

=== 10.3 From a simplex to a compact convex set <from-a-simplex-to-a-compact-convex-set>

#proof[
  First let $F : Delta_d arrow.r Delta_d$ be continuous. The case $d = 0$ is immediate. In each of the successive barycentric subdivisions, a vertex fixed by $F$ already proves the claim. Otherwise label each vertex $v$ by an index $i$ for which $v_i > F_i \( v \)$. Such an index exists because the two coordinate sums are equal and $v eq.not F \( v \)$; it satisfies $v_i > 0$. Lemma 47 supplies a fully labeled simplex in each subdivision. Denote its vertex labeled $i$ by $v^(\( m \, i \))$, where $m$ is the subdivision index. By compactness, a subsequence of $v^(\( m \, 0 \))$ converges to some $x in Delta_d$. The mesh tends to zero, so all $v^(\( m \, i \))$ converge to the same $x$ along that subsequence. Continuity gives $x_i gt.eq F_i \( x \)$ for every $i$. Equality of the coordinate sums forces equality in every coordinate, proving $F \( x \) = x$. Affine coordinates give the same result for every simplex.
  Now equip the affine hull of $K$ with Euclidean coordinates. For any point $x$ in this hull, compactness gives a nearest point $P \( x \) in K$. It is unique: if distinct $p \, q in K$ both minimized the squared distance, convexity and
  $ ∥x - frac(p + q, 2)∥^2 = frac(parallel x - p parallel^2 + parallel x - q parallel^2, 2) - frac(parallel p - q parallel^2, 4) $
  would contradict minimality. If $p = P \( x \)$ and $z in K$, comparison with $p + t \( z - p \)$, followed by division by $t > 0$ and the limit $t arrow.b 0$, yields $chevron.l x - p \, z - p chevron.r lt.eq 0$. Apply this with $p = P \( x \) \, z = P \( y \) = q$, and with $q = P \( y \) \, z = p$. Adding the inequalities gives
  $ parallel p - q parallel^2 lt.eq chevron.l x - y \, p - q chevron.r lt.eq parallel x - y parallel thin parallel p - q parallel . $
  Thus $parallel P \( x \) - P \( y \) parallel lt.eq parallel x - y parallel$, so $P$ is continuous, and $P \( x \) = x$ for $x in K$.
  If the affine hull has dimension zero, $K$ is a singleton. Otherwise identify it with $bb(R)^d$, $d gt.eq 1$, and choose $M > 0$ so that $K subset.eq \[ - M \, M \]^d$. The simplex
  $ S = { x in bb(R)^d : x_j gt.eq - M med \( 1 lt.eq j lt.eq d \) \, quad sum_(j = 1)^d x_j lt.eq d M } $
  contains that cube: its vertices are $a = \( - M \, dots.h \, - M \)$ and $a + 2 d M e_j$, $1 lt.eq j lt.eq d$. The continuous map $F compose P : S arrow.r K subset.eq S$ has a fixed point $x$ by the simplex case. Its image lies in $K$, so $x in K$, $P \( x \) = x$, and $F \( x \) = x$, as required. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
