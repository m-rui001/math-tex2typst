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

#align(center)[#text(size: 16pt, weight: "bold")[Paired states and Hamiltonian cycles \
in cubic bipartite planar graphs]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

A graph is #emph[cubic] if every vertex has degree three, and #emph[bipartite] if its vertices can be divided into two classes with no edge inside either class. It is #emph[$3$-vertex-connected] if it has at least four vertices and deleting any set of at most two vertices leaves it connected. A #emph[Hamiltonian cycle] visits every vertex exactly once. We consider finite simple undirected graphs throughout the main statement.

Barnette’s conjecture, recorded by Grünbaum in the 1969 Waterloo proceedings #cite(label("Barnette1969")), asserts that every cubic bipartite polyhedral graph is Hamiltonian, where polyhedral means planar and $3$-vertex-connected. It belongs to the line of questions initiated by Tait’s conjecture for cubic polyhedral graphs, disproved by Tutte #cite(label("Tutte1946")); see #cite(label("APSW2016"), form: "prose") #cite(label("GSW2023"), form: "prose") for the history and equivalent formulations.

Several partial results explain the role of face structure. Goodey proved the case in which all faces are quadrilaterals or hexagons #cite(label("Goodey1975")). Feder and Subi allowed arbitrarily large faces in one class of a proper three-coloring of the faces, requiring only quadrilaterals and hexagons in the other two classes #cite(label("FederSubi2006")). Their argument uses proper quasi spanning trees of faces after contracting a distinguished face class. Kardoš proved the related Barnette–Goodey conjecture for cubic polyhedral graphs with faces of size at most six, without assuming bipartiteness #cite(label("Kardos2020")). More recently, Schnieders proved the faces-at-most-eight case of Barnette’s conjecture #cite(label("Schnieders2025")) Corollary 1.13. We remove the face-size restriction within the full $3$-connected bipartite class.

#thm([Theorem 1.1.])[
  #emph[Every finite simple undirected graph that is cubic, bipartite, planar, and $3$-vertex-connected has a Hamiltonian cycle.]
] <thm:main>

The difficulty is to obtain one spanning cycle. A spanning subgraph of degree two can have several cycle components, and local choices alone need not join them. We instead construct an acyclic edge set in a dual triangulation whose complement becomes one connected spanning cycle. The construction also retains a prescribed local pattern needed when the triangulation is cut into smaller pieces.

=== 1.1 The dual problem and the proof strategy <the-dual-problem-and-the-proof-strategy>

For a graph satisfying Theorem 1, the faces of its sphere dual are triangles. A bipartition of the original graph colors these triangles black and white, with opposite colors across every edge. The dual viewpoint goes back to Stein’s region-partition formulation #cite(label("Stein1971")) Theorem 2.2. In the form proved by Alt, Payne, Schmidt, and Wood #cite(label("APSW2016")) Lemma 5, Hamiltonicity corresponds to a partition of the triangulation’s vertices into two sets, each inducing a tree. Here an induced tree includes #emph[every] edge between its vertices, so connectedness alone is insufficient. Theorem 3 proves this partition with any chosen facial edge’s endpoints in one class and its third vertex in the other. The corresponding Hamiltonian cycle avoids any specified single edge, as shown in Corollary 11. This single-edge avoidance property is a known equivalent global strengthening of Barnette’s conjecture, through the work of Kelmans as explained by Hertel #cite(label("Hertel2005")) Corollary 3 and by Gorsky, Steiner, and Wiederrecht #cite(label("GSW2023")) Theorem 4.3. Corollary 12 records a further consequence through their published equivalence #cite(label("GSW2023")) Theorem 4.16: every three-edge path in a finite simple cubic $3$-vertex-connected Pfaffian bipartite graph is contained in a Hamiltonian cycle.

To explain the construction, choose one black triangle as the outer face and call its three vertices the roots. The remaining black triangles and the nonroot vertices have equal cardinality. A #emph[state] assigns each remaining black triangle one of its vertices, using every nonroot exactly once. These face–vertex incidence matchings are Tutte states, arising in Tutte’s theory of trinity #cite(label("Tutte1975")). Hine and Kálmán give a modern treatment and relate the state moves to Kauffman’s clock theorem #cite(label("HK2018")). A #emph[pair] consists of two states making distinct choices at every triangle. We prove all state properties needed here.

For a second state $s$, let $Q_s$ contain the edge opposite its chosen vertex in each remaining black triangle. We seek a pair for which $Q_s$ is a forest. When no triangle has vertices strictly on both sides, a planar density inequality and an integral flow first provide a pair. A disk count supplies the signed cycle identity used in the next step.

We analyze one finite exponential sum over pairs in two different ways. First fix $s$. If $Q_s$ has a cycle, reversing that cycle changes only the first state $r$. The disk identity shows that the two terms have opposite phases, while their real weights agree because those weights depend only on $s$. Thus all pairs with cyclic $Q_s$ cancel. To prove that the whole sum is nonzero, instead fix the undirected edge set $D$ joining the two chosen vertices in each triangle. Its components are cycles, and its pairs are exactly their independent orientations. Here reversal exchanges the two state choices along a cycle. Join each remaining black-face center to its three vertices by spokes. Positive circulations on these spokes give real weights for which the counterclockwise orientation of each cycle has the larger sum of weights. Each cycle then contributes a simple zero at parameter zero. The disk identity makes the leading phases agree for groups with the fewest cycles, and their leading magnitudes are positive. These contributions cannot cancel. Some pair with $Q_s$ a forest must remain.

A forest state has one root in each of three components. Complementary plane-tree duality turns it into a tree on the white faces, which selects one edge at every black and white face. The disk identity proves these selected edges acyclic. Their complementary dual is connected and has degree two everywhere; its two sides identify the required induced trees. Finally, a separating triangle is shared by two smaller triangulations. The prescribed facial pattern makes their partitions agree on that triangle, so the trees glue along a vertex or an edge.

Two established matching constructions help place these steps in context. The passage between incidence matchings and plane trees is related to Temperley’s correspondence and its weighted extension by Kenyon, Propp, and Wilson #cite(label("KPW2000")). Regrouping two matchings by their union cycles is familiar from the double-dimer model #cite(label("Kenyon2014")) Lemma 1. We use this regrouping together with the separate fixed-second-state cancellation and positive-circulation argument proved here; neither cited correspondence is an input to those conclusions.

The weighted sum is finite and is used for existence. The argument places no bound on the order or face lengths of the input graph; it does not assert a polynomial-time construction of the cycle.

== 2 Plane trees and the triangulation statement <sec:setup>

All embeddings are on the sphere. After choosing an outer face we work in the plane, with the point at infinity in that face. Face lengths count edge-side incidences: a bridge contributes twice to the length of its incident face. A #emph[sphere triangulation] here is connected and simple, has at least four vertices, and has a $3$-cycle as the boundary of every face. A #emph[separating triangle] is a $3$-cycle with vertices strictly on both sides. A #emph[spanning forest] is an acyclic spanning subgraph, with isolated vertices allowed. For a vertex set $U$, the induced subgraph $T \[ U \]$ contains every edge of $T$ with both endpoints in $U$. A one-vertex graph is a tree. The plane graphs used for intermediate dual constructions may have loops or parallel edges, with their usual edge-side incidences; the triangulations themselves are simple.

#thm([Lemma 2.1.])[
  #emph[Let $M$ be a connected graph embedded on the sphere. The duals of the edges complementary to a spanning tree of $M$ form a spanning tree of $M^(*)$. More generally, the duals of the edges complementary to a spanning forest of $M$ form a connected spanning subgraph of $M^(*)$.]
] <lem:duality>

#proof[
  Contract a primal spanning tree to one vertex. Contraction preserves faces and deletes the corresponding dual edges; the dual of the remaining connected plane graph is connected. The complementary dual edges number $lr(|E \( M \)|) - lr(|V \( M \)|) + 1 = lr(|F \( M \)|) - 1$, by Euler’s formula, so they form a tree. For a spanning forest, extend it to a spanning tree; its complementary dual contains the tree just described. ◻
]

#thm([Theorem 2.2.])[
  #emph[Let $T$ be a sphere triangulation whose faces are colored black and white so that each edge has one incident face of each color. For any facial triangle $t_0$ and any edge $e_0$ of $t_0$, the vertex set admits a partition into two sets, each inducing a tree, such that the endpoints of $e_0$ are in one set and the third vertex of $t_0$ is in the other.]
] <thm:partition>

We first prove Theorem 3 without separating triangles. Put $t_0$ on the outer face and exchange the face colors if necessary to make it black. Its three vertices are called the #emph[roots]. Let $k$ be the number of black faces. Counting sides of either color and applying Euler’s formula gives

#[#set math.equation(numbering: n => "(2.1)")
 $ \# { upright("white faces") } = k \, #h(2em) lr(|E \( T \)|) = 3 k \, #h(2em) lr(|V \( T \)|) = k + 2 . $ <eq:counts>]

Write $A$ for the black faces other than $t_0$, and $X$ for the nonroot vertices. Thus $lr(|A|) = lr(|X|) = k - 1$.

A #emph[state] is a bijection $r : A arrow.r X$ with $r \( t \) in V \( t \)$, where $V \( t \)$ is the vertex set of the triangle $t$. A #emph[pair] is an ordered pair of states $\( r \, s \)$ such that $r \( t \) eq.not s \( t \)$ for every $t in A$. Equivalently, a pair consists of two edge-disjoint perfect matchings in the bipartite incidence graph on $A$ and $X$. This is the planar state convention of #cite(label("HK2018"), form: "prose") Section 1, with black and white exchanged; no vertex three-coloring or clock theorem is needed below.

== 3 Two disjoint states <sec:pairs>

Our first task is to supply two distinct choices at every black face while using each nonroot vertex exactly once in each choice. The capacity-one incidence edges below enforce that the two states are disjoint.

#thm([Proposition 3.1.])[
  #emph[If $T$ has no separating triangle, then a pair of states exists.]
] <prop:pairs>

#proof[
  A degree-two spanning subgraph of the incidence graph splits into two perfect matchings by alternating its bipartite cycles. It is therefore enough to prove
  #[#set math.equation(numbering: n => "(3.1)")
   $ sum_(t in A) min #scale(x: 120%, y: 120%)[\(] 2 \, lr(|V \( t \) ∩ S|) #scale(x: 120%, y: 120%)[\)] gt.eq 2 lr(||) S #h(2em) \( S subset.eq X \) . $ <eq:flow>]
  Indeed, give capacity two to source-to-$X$ and $A$-to-sink edges, and capacity one to incidences from $X$ to $A$. For a cut placing $S subset.eq X$ on the source side, minimizing over the placement of $A$ gives capacity
  $ 2 \( lr(||) X - lr(||) S \) + sum_(t in A) min #scale(x: 120%, y: 120%)[\(] 2 \, lr(|V \( t \) ∩ S|) #scale(x: 120%, y: 120%)[\)] . $
  Thus (3.1) and integral max-flow give a flow of $2 lr(||) X = 2 lr(||) A$, and hence the required degree-two subgraph. The underlying max-flow/min-cut principle is due to #cite(label("FF1956"), form: "prose"). For completeness, the integral conclusion follows by starting with zero flow and augmenting along residual source–sink paths. Every augmentation has a positive integral bottleneck, so at most $2 lr(||) X$ augmentations are needed; if no path remains, the residual vertices reachable from the source define a cut whose capacity equals the flow value. The displayed cut bound therefore forces the full value. Every capacity-two outer edge is saturated, and each capacity-one incidence carries zero or one, giving degree two at every vertex of the incidence graph.
  Let $U = V \( T \) \\ S$; it contains the three roots. Denote by $e \( U \)$ the number of edges in $T \[ U \]$, and by $b \( U \)$ the number of actual black faces of $T$ all of whose vertices belong to $U$. Include $t_0$ in the sum in (3.1), with contribution zero. If a black triangle has $j$ vertices in $U$, its shortfall from two is $max \( 0 \, j - 1 \)$. This is its number of edges in $T \[ U \]$, minus one if $j = 3$. Since each edge has exactly one black incident face, (2.1) shows that (3.1) is equivalent to
  #[#set math.equation(numbering: n => "(3.2)")
   $ e \( U \) - b \( U \) lt.eq 2 lr(||) U - 4 . $ <eq:density>]
  Consider a connected component $K$ of $T \[ U \]$ with $p gt.eq 4$ vertices, $m$ edges, and $f$ faces, with the inherited sphere embedding. Every face has boundary length at least three. Its triangular faces are exactly the actual triangular faces of $T$ whose vertices lie in $K$. To justify the only delicate direction, a triangular component face is bounded by a $3$-cycle. As the cycle is not separating, one side is an actual face of $T$. The component has a vertex off the cycle, on the other side, so its triangular facial side must be the actual face. The converse follows because an actual face contains no vertices or edges in its interior.
  Let $b \, w$ count these black and white triangular faces of $K$. Each other face region has length $d gt.eq 4$. Let $b' \, w'$ count all original faces of $T$ in that region. Signed edge-side counting gives
  $ 3 \( b' - w' \) = sum_(j = 1)^d sigma_j \, #h(2em) sigma_j in { - 1 \, 1 } . $
  Internal sides cancel in black/white pairs. This remains true for repeated boundary edges and for regions containing other components of $T \[ U \]$. Consequently
  #[#set math.equation(numbering: n => "(3.3)")
   $ \| b' - w' \| lt.eq d - 4 . $ <eq:face-defect>]
  For $d = 4$, parity and divisibility by three force the signed sum to be zero. For $d = 5$, its absolute value is at most three. For $d gt.eq 6$, use $d \/ 3 lt.eq d - 4$.
  The regions of $K$ partition the original faces of $T$. Their total color balance therefore gives
  $ w - b = sum_(upright("nontriangular regions")) \( b' - w' \) lt.eq sum_(upright("nontriangular faces")) \( d - 4 \) . $
  It follows that
  $ 2 m = 4 f - b - w + sum_(upright("nontriangular faces")) \( d - 4 \) gt.eq 4 f - 2 b . $
  Using $p - m + f = 2$ yields
  #[#set math.equation(numbering: n => "(3.4)")
   $ m - b lt.eq 2 p - 4 . $ <eq:component>]
  The component containing the roots satisfies (3.4) also when it has three vertices: it is $t_0$, with three edges and one actual black face. Every other component satisfies the weaker bound $m - b_(upright("act")) lt.eq 2 p$, where $b_(upright("act"))$ counts its actual black faces. For $p gt.eq 4$ this follows from (3.4), and for smaller $p$ from simplicity. Summing over components proves (3.2). ◻
]

== 4 The disk identity <sec:disk>

The next identity controls both cancellation and the final forest construction. It records more than a face-color imbalance: the state bijection fixes exactly how many black faces can lie inside a directed cycle.

For adjacent vertices $v \, w$, define $delta \( v \, w \) = 1$ if the black face of their edge is on the left when the edge is traversed from $v$ to $w$, and $delta \( v \, w \) = - 1$ otherwise. Thus $delta$ is antisymmetric, and the counterclockwise sides of a bounded black face have weight one.

#thm([Lemma 4.1.])[
  (Disk identity).  #emph[Let $r$ be a state. In each $t in A$, choose one edge directed from $r \( t \)$ to another vertex of $t$. Every simple directed cycle in the chosen edges avoids the roots. Its $delta$-sum is $- 3$ if it is counterclockwise, and $3$ if it is clockwise.]
] <lem:disk>

#proof[
  Only nonroots have outgoing edges, so the cycle avoids the roots. Its bounded disk contains no root, because the roots are on the outer-face boundary. Let $h$ be the cycle length, $I$ the number of strictly interior vertices, $B \, W$ the numbers of black and white faces in the disk, and $l$ the number of boundary edges with their black face in the disk. Euler’s formula for the triangulated disk and signed side counting give, respectively,
  #[#set math.equation(numbering: n => "(4.1)")
   $ B + W = 2 I + h - 2 \, #h(2em) 3 \( B - W \) = 2 l - h . $ <eq:disk-counts>]
  The state supplies the additional identity
  #[#set math.equation(numbering: n => "(4.2)")
   $ B = I + l . $ <eq:matching-disk>]
  Every strictly interior vertex is matched to an incident black face in the disk. A boundary vertex is matched to the black face of its outgoing cycle edge, which lies inside in exactly the $l$ counted cases. Conversely every black face in the disk is matched to an interior or boundary vertex. There is no double counting: the state is a bijection and at most one chosen edge comes from each black face.
  Equations (4.1)–(4.2) imply $2 l - h = - 3$. This is the weight sum for a counterclockwise traversal. A clockwise traversal reverses the signs and has sum $3$. ◻
]

The matching condition in (4.2) is essential. The conclusion need not hold for arbitrary oriented cycles of the triangulation.

== 5 A weighted cancellation argument <sec:cancellation>

For a state $s$, let $Q_s$ be the spanning subgraph of $T$ consisting of the edge opposite $s \( t \)$ in every $t in A$. These edges are distinct, since every edge of $T$ has a unique black incident face. Figure 1(a) shows the two local edge choices.

#thm([Proposition 5.1.])[
  #emph[Whenever at least one pair exists, some pair $\( r \, s \)$ has $Q_s$ a forest.]
] <prop:forest-state>

We prove this by cancelling all cyclic $Q_s$’s from a weighted sum and then proving that the sum is nonzero. The cancellation works for arbitrary weights; we will choose them afterwards to establish nonvanishing.

For now, assign a real number $a \( t \, v \)$ to each incidence $t in A$, $v in V \( t \)$, and write

$ omega \( s \) = sum_(t in A) a \( t \, s \( t \) \) . $

For a pair, direct the edge in $t$ from $r \( t \)$ to $s \( t \)$. Every vertex of $X$ has one edge in and one out, so these edges form a union $D$ of vertex-disjoint cycles on $X$. They are distinct even as undirected edges, since each edge belongs to just one black face. Thus the cycles are simple. By Lemma 5,

#[#set math.equation(numbering: n => "(5.1)")
 $ J \( r \, s \) = 1 / 3 sum_(t in A) delta \( r \( t \) \, s \( t \) \) quad upright("is an integer") . $ <eq:J>]

For real $x$, define the finite exponential sum

#[#set math.equation(numbering: n => "(5.2)")
 $ Z \( x \) = sum_(\( r \, s \) med upright("pair")) upright(i)^(J \( r \, s \)) exp #scale(x: 120%, y: 120%)[\(] x omega \( s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:Z>]

=== 5.1 Cancellation <cancellation>

#thm([Lemma 5.2.])[
  #emph[For fixed $s$ with cyclic $Q_s$, the terms of (5.2) having second state $s$ sum to zero.]
] <lem:cancel>

#proof[
  If $s$ has no partner there is nothing to prove. Otherwise choose a simple undirected cycle in $Q_s$, using $s$ alone to make this choice. For a partner $r$, write $u \( t \)$ for the third vertex of $t$, other than $r \( t \) \, s \( t \)$, and orient the opposite edge from $r \( t \)$ to $u \( t \)$. Every vertex has outdegree at most one. The chosen cycle must be directed: its edges need distinct tails at all its vertices. In particular it contains no root.
  On the triangles supplying this cycle, replace $r \( t \)$ by $u \( t \)$, and leave all other assignments unchanged. Call the new state $tilde(r)$. This cyclically permutes the vertices assigned along the cycle, so $tilde(r)$ remains a bijection and a partner of $s$. It reverses the chosen cycle; applying it again restores $r$. Thus it is an involution without fixed points.
  On a changed triangle, the three cyclic directions give
  $ delta \( u \( t \) \, s \( t \) \) - delta \( r \( t \) \, s \( t \) \) = 2 delta \( r \( t \) \, u \( t \) \) . $
  Lemma 5, applied to the directed opposite-edge cycle, now yields
  $ J \( tilde(r) \, s \) - J \( r \, s \) = plus.minus 2 . $
  Hence $upright(i)^(J \( tilde(r) \, s \)) = - upright(i)^(J \( r \, s \))$. The exponential weights coincide because $s$ is fixed. The involution cancels all terms. ◻
]

=== 5.2 Positive spoke circulations <positive-spoke-circulations>

We now choose the incidence weights so that the two orientations of each cycle of $D$ have strictly ordered weights: the sum of $a \( t \, upright("head") \)$ is larger in the counterclockwise orientation. We establish this comparison below by replacing cycle edges with spokes. Inside each bounded black triangle place a center and join it to the three vertices by disjoint incidence spokes. Let $H_0$ be the resulting plane graph, allowing isolated vertices.

#thm([Lemma 5.3.])[
  #emph[There are real numbers $a \( t \, v \)$ on the spokes of $H_0$ such that every counterclockwise simple spoke cycle has strictly positive weight, where center-to-vertex traversal has weight $a \( t \, v \)$ and reverse traversal its negative.]
] <lem:circulation>

#proof[
  Work separately in each connected component. Prescribe signed boundary circulation one on every bounded face and the negative of their number on the unbounded face, always traversing with the face on the left. For each bounded face take a simple path in the connected plane dual to the unbounded face. Give each crossed edge an antisymmetric weight contributing one to the face being left and minus one to the face being entered. Along the path these contributions cancel at intermediate faces. Summing over bounded faces realizes the prescribed circulations. Summing face boundaries inside any counterclockwise simple cycle cancels internal sides and gives the positive number of component faces inside it. A component with no bounded face has no cycle and needs no nonzero weights. ◻
]

Fix these weights for the remainder of the proof.

=== 5.3 Nonvanishing <nonvanishing>

Group the pairs in (5.2) by their undirected edge set $D$. This uses the two-orientations-per-cycle regrouping familiar from double-dimer expansions #cite(label("Kenyon2014")) Section 3.2.1, Lemma 1. Such a set determines the edge chosen in every triangle of $A$, because every edge belongs to a unique black face. The pairs in its group are exactly the independent orientation choices on its cycles: tails give $r \( t \)$, heads give $s \( t \)$, and each choice still gives two bijections on $X$.

For a cycle $C$ of $D$, let $L_(+) \( C \)$ be the sum of $a \( t \, upright("head") \)$ along its counterclockwise orientation, and $L_(-) \( C \)$ the corresponding clockwise sum. We claim

#[#set math.equation(numbering: n => "(5.3)")
 $ L_(+) \( C \) - L_(-) \( C \) > 0 . $ <eq:positive-difference>]

For the counterclockwise traversal, replace each edge by its two-spoke route from tail through the center of its black triangle to head, as in Figure 1(b). Its spoke weight is exactly $a \( t \, upright("head") \) - a \( t \, upright("tail") \)$, so the closed spoke curve has weight $L_(+) \( C \) - L_(-) \( C \)$.

This spoke curve is simple and counterclockwise. Indeed, there is at most one edge from each black triangle in $D$. Distinct detours have disjoint interiors, and their centers are distinct; the only shared original vertices are successive vertices of the original cycle. Moreover the original edge and its detour enclose a subdisk of the black triangle excluding its third corner. Sliding the edge across that subdisk is an isotopy through simple curves. This remains true if the third corner occurs elsewhere on $C$. Performing the slides successively preserves the counterclockwise orientation. Lemma 8 therefore proves (5.3).

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (3, 0), (1.5, 2.2), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((0, 0), (3, 0), (1.5, 2.2), close: true, stroke: (paint: rgb("#8c8c8c"), thickness: 0.6pt, cap: "round", join: "round"))
  line((0, 0), (3, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", length: 0.21cm, width: 0.15cm, fill: rgb("#0000a6"))))
  line((0, 0), (1.5, 2.2), stroke: (paint: rgb("#404040"), thickness: 1.0pt, cap: "round", join: "round", dash: "dashed"), mark: (end: (symbol: ">>", length: 0.21cm, width: 0.15cm, fill: rgb("#404040"))))
  circle((0, 0), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((-0.02495, -0.02495), [$r(t)$], anchor: "north-east")
  circle((3, 0), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((3.025, -0.02495), [$s(t)$], anchor: "north-west")
  circle((1.5, 2.2), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((1.5, 2.235), [$u(t)$], anchor: "south")
  content((1.7, 0.9), [#text(size: 9pt)[$t$]])
  content((1.5, -0.85), [#text(size: 9pt)[\(a\) The two local edge choices]])
  line((6, 0), (9, 0), (7.5, 2.2), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((6, 0), (9, 0), (7.5, 0.85), close: true, fill: rgb("#e0e0ff"), stroke: none)
  line((6, 0), (9, 0), (7.5, 2.2), close: true, stroke: (paint: rgb("#8c8c8c"), thickness: 0.6pt, cap: "round", join: "round"))
  line((6, 0), (9, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.85pt, cap: "round", join: "round", dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: rgb("#0000a6"))))
  line((6, 0), (7.5, 0.85), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", length: 0.21cm, width: 0.15cm, fill: rgb("#0000a6"))))
  line((7.5, 0.85), (9, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", length: 0.21cm, width: 0.15cm, fill: rgb("#0000a6"))))
  circle((6, 0), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((5.975, -0.02495), [$v$], anchor: "north-east")
  circle((9, 0), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((9.025, -0.02495), [$w$], anchor: "north-west")
  circle((7.5, 2.2), radius: 0.06985, fill: rgb("#000000"), stroke: none)
  content((7.5, 2.235), [$z$], anchor: "south")
  circle((7.5, 0.85), radius: 0.08481, fill: rgb("#0000a6"), stroke: none)
  content((7.5, 0.8853), [$t$], anchor: "south")
  content((7.5, -0.85), [#text(size: 9pt)[\(b\) The local spoke detour]])
})],
  caption: [Figure 1: Two local constructions in a bounded black triangle. (a) A paired state gives the edge $r \( t \) arrow.r s \( t \)$ of $D$ (solid) and the edge $r \( t \) arrow.r u \( t \)$ of $Q_s$ (dashed). (b) The directed edge $v arrow.r w$ (dashed) is slid to the two-spoke route $v arrow.r t arrow.r w$ (solid), with $t$ denoting the face center. The shaded subdisk lies between the two routes and excludes the third corner $z$. ],
) <fig:local-triangle>

By Lemma 5, a counterclockwise cycle contributes $- 1$ to $J$, and a clockwise cycle contributes $1$. The whole group contribution is therefore

#[#set math.equation(numbering: n => "(5.4)")
 $ product_(C subset D) (- upright(i) exp \( x L_(+) \( C \) \) + upright(i) exp \( x L_(-) \( C \) \)) . $ <eq:group-product>]

Each factor vanishes to exactly first order at zero. If $c \( D \)$ is the number of cycles of $D$, the first nonzero Taylor coefficient of (5.4) is in degree $c \( D \)$ and equals

#[#set math.equation(numbering: n => "(5.5)")
 $ \( - upright(i) \)^(c \( D \)) product_(C subset D) #scale(x: 120%, y: 120%)[\(] L_(+) \( C \) - L_(-) \( C \) #scale(x: 120%, y: 120%)[\)] . $ <eq:leading-coefficient>]

There is at least one group. In the smallest occurring degree $c_min$, all contributing groups have phase $\( - upright(i) \)^(c_min)$ and strictly positive real magnitudes by (5.3). Groups with more cycles have no term of that degree. Thus this coefficient of $Z$ is nonzero. Lemma 7 cancels every second state with cyclic $Q_s$, so some pair has $Q_s$ a forest. This proves Proposition 6.

== 6 Recovering the two induced trees <sec:trees>

We now convert the forest state into one selected edge at every face. The prescription at $t_0$ enters through the root of a tree on the white faces. A second use of the disk identity will make the selected edges acyclic; their complementary dual cycle will establish inducedness.

Assume that $T$ has no separating triangle. By Propositions 4 and 6, choose a pair $\( r \, s \)$ with $Q_s$ a forest. Orient its edges from $r \( t \)$ to the third vertex. The outdegrees are one on $X$ and zero at the roots.

#thm([Lemma 6.1.])[
  #emph[For a pair $\( r \, s \)$ with $Q_s$ a forest, every component of $Q_s$ contains exactly one of the three roots.]
] <lem:root-components>

#proof[
  If a component has $q$ vertices and $a$ roots, its total outdegree is $q - a$, while its tree edge count is $q - 1$. Each edge contributes one to the total outdegree, so $a = 1$. This includes isolated vertices. The partner $r$ supplies the orientation and the required outdegrees. ◻
]

=== 6.1 A tree on the white faces <a-tree-on-the-white-faces>

The construction below uses a relation between matchings and plane trees, a theme of the Temperley correspondence and its weighted extension #cite(label("KPW2000")) Theorem 1. We give the triangular-state construction explicitly, including the prescribed outer edge.

Let $H$ be the sphere graph of incidence spokes from #emph[all] black centers, including $t_0$, to their vertices. This graph is connected, since every edge of $T$ can be routed through its black center. The faces of $H$ correspond to the white triangles. To see this, the spokes split each black triangle into three sectors adjoining its sides. Removing the original edges of $T$ joins each white triangle to the three sectors across its sides, and original vertices prevent further merging.

Delete the spokes $\( t \, s \( t \) \)$, $t in A$. What remains is the forest $Q_s$ with its edges subdivided by their black centers, together with the three spokes from the center of $t_0$ to the three roots. Since those roots lie in distinct components, the remainder is a spanning tree of $H$. By Lemma 2, the duals of the deleted spokes form a spanning tree on the white triangles.

Root this white-face tree at the white triangle $y_0$ across $e_0$ from $t_0$. Assign every tree edge to its endpoint farther from $y_0$. These endpoints use each white triangle except $y_0$ exactly once. A spoke $\( t \, v \)$ borders the white triangles across the two sides of $t$ incident with $v$. Thus for the deleted spoke $\( t \, s \( t \) \)$, select the edge of $t$ incident with $s \( t \)$ bordering its assigned white triangle. Finally select $e_0$.

Denote the selected set by $P$, and put $P_0 = P \\ { e_0 }$. There is exactly one selected edge at each black and at each white triangle. Selections from distinct black faces cannot coincide, so $lr(||) P = k$. Orient each edge of $P_0$ out from $s \( t \)$ in the black triangle that supplied it.

=== 6.2 Acyclicity and inducedness <acyclicity-and-inducedness>

#thm([Lemma 6.2.])[
  #emph[The selected set $P$ is a forest.]
] <lem:P-forest>

#proof[
  An undirected simple cycle in $P_0$ must be directed, since each vertex has outdegree at most one. Use $B \, W \, h \, l$ for its disk data as in Lemma 5, now with state $s$. There is an additional selected-edge count:
  #[#set math.equation(numbering: n => "(6.1)")
   $ B - W = 2 l - h . $ <eq:selection-count>]
  Count the unique selected edge of every interior face with sign $+ 1$ for black and $- 1$ for white. A selected edge whose relative interior lies inside the disk contributes one of each sign and cancels. This includes a chord with both endpoints on the boundary: both of its incident faces lie in the disk. Every boundary edge is selected, contributing $+ 1$ when its black face is inside and $- 1$ otherwise. This proves (6.1).
  But signed triangle-side counting gives $3 \( B - W \) = 2 l - h$, so (6.1) would imply $2 l - h = 0$. The cycle would therefore have $delta$-sum zero in either orientation, contrary to Lemma 5. Thus $P_0$ is a forest. Its outdegrees are one at every nonroot and zero at the roots, so the same component count used for $Q_s$ gives one root per component. The edge $e_0$ joins two different roots, hence different components. Adding it preserves acyclicity. ◻
]

Take the spanning dual subgraph formed by the edges dual to $E \( T \) \\ P$. It is connected by Lemma 2. Every face of $T$ has two unselected sides, so this dual subgraph is 2-regular. It has $2 k > 2$ vertices and is one simple cycle. Draw its edges crossing just their corresponding primal edges, once transversely, and avoiding all primal vertices.

The resulting Jordan curve labels each vertex of $T$ by the side on which it lies. An edge has same-label ends exactly when it is in $P$: an unselected edge crosses the curve once, while a selected edge has no crossing. Both labels occur. By (2.1), the forest $P$ has $\( k + 2 \) - k = 2$ components. Each has a constant label, so there is exactly one component for each label. The classes therefore induce trees. The unique same-label edge at $t_0$ is $e_0$. This proves Theorem 3 in the absence of separating triangles.

== 7 Separating triangles and the Hamiltonian cycle <sec:assembly>

The facial prescription lets us glue partitions across separating triangles. We then deduce Hamiltonicity and the edge-avoidance consequence.

#proof[
  Induct on the number of vertices, using the construction above when there is no separating triangle. Otherwise split along a separating $3$-cycle into two sphere triangulations, capping each side by a triangle on the separating cycle. Both pieces are simple, have at least four vertices, and are smaller than $T$.
  The inherited face coloring extends to each cap. Indeed, on one side let $B \, W$ count its original black and white faces. Signed side counting makes $3 \( B - W \)$ the sum of the three boundary signs, each $+ 1$ or $- 1$. Divisibility by three forces all three signs to be equal. Color the cap oppositely.
  Apply induction first to the piece containing the prescribed original face $t_0$, with its specified edge $e_0$. On that piece’s cap both tree labels occur, since a monochromatic triangle would be a cycle in an induced tree. Prescribe the same-label edge of the cap in the other piece and apply induction there. Rename the two labels to agree on the shared triangle.
  For each label the two induced trees intersect in a connected subtree: one vertex, or one edge with its endpoints. Their union is a tree. It is induced in $T$, since there are no edges between the interiors of the two sides. The original prescription is preserved, completing the induction. ◻
]

#proof[
  Let $G$ satisfy the four hypotheses and fix a sphere embedding. It has no edge cut of size one or two. For otherwise each side of such a cut would have at least three vertices: cubicity and simplicity give at least three crossing edges for a singleton and at least four for two vertices. Deleting the at most two crossing endpoints on one side would leave a nonempty remnant disconnected from the other side, contrary to $3$-vertex-connectivity.
  The sphere dual $T = G^(*)$ is simple. A dual loop or a pair of parallel dual edges would be a Jordan curve crossing one or two primal edges once, giving an edge cut of that size. Its two primal sides are nonempty, since every crossed edge has its endpoints on opposite sides. Cubicity gives each dual face a boundary walk of length three, which in a simple graph is a triangle. Euler’s formula gives $lr(|V \( T \)|) = 2 + lr(|V \( G \)|) \/ 2 gt.eq 4$. The bipartition of $G$ colors the faces of $T$ black and white with opposite colors at every edge.
  Apply Theorem 3. The edges induced by the two classes form a spanning forest. Each triangle has exactly one such edge, since neither tree class can contain all three vertices. The complementary dual edges in $G$ are connected by Lemma 2 and give degree two at every vertex. They form a single spanning cycle, which is the required Hamiltonian cycle. ◻
]

#thm([Corollary 7.1.])[
  #emph[For every graph $G$ satisfying Theorem 1 and every edge $e in E \( G \)$, there is a Hamiltonian cycle of $G$ avoiding $e$.]
] <cor:edge-avoidance>

#proof[
  In the dual triangulation choose a facial triangle containing the dual edge $e^(*)$, and prescribe $e_0 = e^(*)$ in Theorem 3. That edge belongs to one of the induced trees. The complementary dual Hamiltonian cycle constructed above therefore omits $e$. ◻
]

Recall that a graph $G$ is #emph[Pfaffian] if its edges admit an orientation for which every even cycle $C$ such that $G - V \( C \)$ has a perfect matching has an odd number of edges directed along either cyclic traversal #cite(label("GSW2023")) Section 4.

#thm([Corollary 7.2.])[
  (Prescribed paths in Pfaffian graphs).  #emph[Let $G$ be a finite simple undirected graph that is cubic, $3$-vertex-connected, Pfaffian, and bipartite. Every path on four vertices (three edges) in $G$ is contained in a Hamiltonian cycle. In other words, $G$ is $P_4$-Hamiltonian; in particular, it is Hamiltonian.]
] <cor:pfaffian-paths>

#proof[
  Gorsky, Steiner, and Wiederrecht #cite(label("GSW2023")) Theorem 4.16 proved the equivalence of Barnette’s conjecture, their condition (i), with this $P_4$-Hamiltonicity statement, their condition (v). Theorem 1 establishes condition (i), so their implication from (i) to (v) applies. Every planar graph is Pfaffian #cite(label("GSW2023")) Theorem 4.6, so the corollary includes the graphs of Theorem 1, while also allowing nonplanar graphs. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
