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

#align(center)[#text(size: 16pt, weight: "bold")[A linear cycle-and-edge decomposition of every graph]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

How efficiently can the edges of a graph be partitioned into cycles? Single edges must also be allowed: a forest contains no cycle. The Erdős–Gallai cycle decomposition conjecture asserts that this necessary allowance suffices for a universal linear bound. Here and throughout, a cycle is simple and has length at least three.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C > 0$ such that, for every finite simple undirected graph $G$ with $n$ vertices, $E \( G \)$ has a partition into at most $C n$ parts, each of which is the edge set of a cycle or consists of a single edge.]
] <thm:main>

The parts in this theorem may share vertices. They share no edges, and every edge of $G$ occurs in exactly one part. Isolated vertices need not be covered, and the empty partition is permitted when $E \( G \) = diameter$.

The conjecture appears in the 1966 paper of Erdős, Goodman and Pósa #cite(label("EGP1966")) Section 5, which explicitly distinguishes unrestricted covers from edge-disjoint covers and records an $O \( n log n \)$ upper bound. Conlon, Fox and Sudakov #cite(label("CFS2014")) improved the general bound to $O \( n log log n \)$ in 2014. Bucić and Montgomery #cite(label("BM2024")) subsequently proved the bound $O \( n log^(*) n \)$; their paper appeared in journal form in 2024. Here $log^(*) n$ is the number of logarithm iterations needed to reach at most one. 1 establishes the conjectured linear bound. Its order is optimal, since a tree on $n$ vertices requires $n - 1$ single-edge parts. More sharply, complete bipartite examples require $\( 3 \/ 2 - o \( 1 \) \) n$ parts; see #cite(label("BM2024")) Section 6 for this lower bound and its history.

Linear bounds were already known for important classes. Conlon, Fox and Sudakov #cite(label("CFS2014")) Theorems 1.3 and 1.4 proved them with high probability for binomial random graphs, and deterministically for graphs of linear minimum degree. Korándi, Krivelevich and Sudakov #cite(label("KKS2015")) obtained asymptotically sharp counts over a broad range of random-graph probabilities. For every fixed $alpha \, delta > 0$, Girão, Granet, Kühn and Osthus #cite(label("GGKO2021")) Theorem 1.10(iii) proved that sufficiently large graphs of minimum degree at least $alpha n$ admit at most $\( 3 \/ 2 + delta \) n$ cycles and edges. Akbari, Aloni, Beikmohammadi and Clow #cite(label("AABC2025")) Theorem 1.3 proved the bound $n - 1$ for graphs of positive order and maximum degree at most four. The general problem allows both sparse regions and vertices of widely differing degrees.

The edge-disjoint requirement is essential to the problem. If cycles and edges may overlap, Pyber #cite(label("Pyber1985")) proved that $n - 1$ parts suffice to cover every graph of positive order. Akbari, Aloni, Beikmohammadi and Clow #cite(label("AABC2025")) Theorem 1.7 improved this covering bound to $n - 2$ for graphs containing a cycle. A cover of that kind does not supply a partition: deleting repeated edges may break its cycles into many paths. Our construction keeps a separate assignment for every original edge throughout.

1 also yields two cycle-only consequences. Here a graph is #emph[Eulerian] if all its degrees are even; connectivity is not required.

#thm([Corollary 1.2.])[
  #emph[Every finite simple undirected Eulerian graph on $n$ vertices has an edge partition into at most $C n$ cycles, with $C$ from 1.]
  #emph[For every fixed $delta \, p > 0$, there exist $epsilon > 0$ and an integer $n_0 gt.eq 1$ such that every finite simple undirected Eulerian graph $G$ on $n gt.eq n_0$ vertices has an edge partition into at most $Delta \( G \) \/ 2 + delta n$ cycles, provided that every partition $V \( G \) = A dot(union) B$ with $\| A \| \, \| B \| gt.eq epsilon n$ satisfies 
$ e_G \( A \, B \) gt.eq p \| A \| \| B \| . $

 Here $Delta \( G \)$ denotes the maximum degree, and $e_G \( A \, B \)$ is the number of edges joining $A$ to $B$.]
] <cor:eulerian-cycles>

Any edge partition of $G$ into cycles needs at least $Delta \( G \) \/ 2$ cycles, since a cycle uses at most two edges incident with a given vertex. The second assertion attains this lower bound up to an arbitrarily small linear error under the stated large-cut condition.

#proof[
  For the first claim, let the partition from 1 have $r$ cycle parts and $s$ single-edge parts, with $r + s lt.eq C n$. The graph formed by the latter edges has even degrees, since deleting cycles preserves degree parity. Repeatedly removing a cycle preserves this property and ends with no edges: every even graph with an edge contains a cycle. This uses at most $s$ cycles, for a total of at most $r + s lt.eq C n$. The equivalence of this $O \( n \)$ Eulerian cycle bound with the Erdős–Gallai conjecture is recorded in #cite(label("GGKO2021")) Section 1.1.
  The partition-cut condition in the second claim is exactly the weakly-$\( epsilon \, p \)$-quasirandom condition of #cite(label("GGKO2021")) Section 1.2. Their Proposition 6.3 proves that Conjecture 1.14, the stated bound with these quantifiers, is equivalent to their Erdős–Gallai Conjecture 1.4, supplied by 1. ◻
]

Our argument builds on the expansion, hypergraph matching and path-closing methods of Bucić and Montgomery #cite(label("BM2024")), with earlier reservoir and sparse-cut methods of Conlon, Fox and Sudakov #cite(label("CFS2014")). We use Lovász’s path-and-cycle decomposition theorem #cite(label("Lovasz1968")) and the Aharoni–Haxell matching theorem #cite(label("AH2000")), in the precise forms stated below. The additional mechanism is an induction that saves vertices across different scales while reserving enough edges to lift cycles from the smaller graphs. A decomposition that repeatedly pays a cost proportional to the full graph order can accumulate a factor from the number of scales. Here the work over a suitable prefix is charged to one expanding layer, and pair identifications save a fixed fraction of that layer’s order. The savings pay for the work outside the recursive calls.

=== Outline of the proof <outline-of-the-proof>

All logarithms below are to base two. A graph has cut expansion $h$ when every cut has at least $h$ times the size of its smaller side in crossing edges. We split the graph at successively smaller scales $D_j = n^(\( 0.95 \)^j)$. At scale $D$, a small collection of long cycles is removed, and the remaining edges are assigned to boxes of order at most $D^1.02$. Their vertex sets may overlap, but the total order increases by only a factor $1 + O \( 1 \/ log D \)$. Within each box, we extract vertex-disjoint pieces with cut expansion $D^0.90$. Each residual box graph has average degree at most $D^0.95$, so the construction continues at the next scale.

Processing every expanding piece at every scale would accumulate too much cost. Instead, we choose a layer whose total piece order pays for an entire prefix, including a fixed number of further scales. The pieces of this layer have two roles. First, an expanding graph can be partitioned into linearly many completed parts and residual graphs whose total order is an arbitrarily small fraction of its own order (10). Second, part of its edge set can be reserved for routing without destroying that conclusion. The sparse graphs passed to the next scale retain their full box vertex sets; the small-residue graphs produced when pieces are processed are eventually handled by induction.

We describe the nonterminal case; the terminal cases are treated separately in 7. After the fixed gap in scales, the unprocessed edges are sparse and live on very small descendant boxes. We gather those boxes into batches. Within each earlier box $Y$, all but $O \( lr(|Y|) \/ log D \)$ vertices have small degree in the union of that box’s batch graphs. We pair these vertices in sufficiently large intersections between a batch and a selected expanding piece, and identify each pair. Edges between a folding set and vertices having too many neighbors in that set are first partitioned into paths; reserved routes close the trimmed remnants into cycles at linear cost. The remaining graph can then be simplified after pair identification by setting aside only linearly many edges as single-edge parts (Lemma 6.1, Lemma 6.2).

The quotient graphs have fewer vertices, so induction partitions their edges into cycles and single edges. Each quotient edge retains one original representative. At a paired vertex, the representatives of a quotient cycle may enter through one member of the pair and leave through the other. We join these two members by a path in the reserved expanding piece. The routing lemma chooses these paths edge-disjointly, with interiors that avoid the representative endpoints and are pairwise disjoint within each cycle (7). Consequently each quotient cycle lifts to one simple cycle. The degree bound is imposed on the union of the batch graphs within each earlier box, so the routing load does not grow with the number of batches.

In this case, write $S$ for the total order of the selected layer. All work outside the recursive calls costs $O \( S + n \/ log D \)$ parts. The quotient orders sum to at most $n - S \/ 3 + O \( n \/ log D \)$, and the small-residue graphs have total order at most $S \/ 100$. In the resulting cost estimate, choosing $C$ sufficiently large makes the coefficient of $S$ nonpositive. To absorb the remaining $O \( C n \/ log D \)$ overhead, we prove the stronger inductive bound $C phi.alt \( n \) n$, where

$ phi.alt \( n \) = max {1 / 2 \, thin 1 - 1 / sqrt(log n)} quad \( n > 1 \) \, #h(2em) phi.alt \( 1 \) = 1 / 2 . $

The quotient graphs have order at most $D^0.30$. Their smaller value of $phi.alt$ supplies a gain of order $1 \/ sqrt(log D)$, which dominates the $O \( 1 \/ log D \)$ overlap cost. All recursive graphs are strictly smaller, and all scale requirements are fixed before the final constant $C$ is chosen.

Section 2 fixes the graph conventions and the two external theorem inputs. Sections 3 and 4 establish the routing and small-residue tools. Section 5 constructs the scale layers, Section 6 combines folding with those tools, and Section 7 completes the induction.

== 2 Conventions and preliminary results <sec:preliminaries>

=== 2.1 Graphs, partitions and scales <graphs-partitions-and-scales>

Unless explicitly stated otherwise, graphs are finite, simple and undirected. A path is simple and has at least one edge. The #emph[order] of a graph is its number of vertices, including any isolated vertices that have been retained. Temporary quotients formed by identifying vertices may have loops or parallel edges; these are removed before any decomposition theorem is applied.

An indexed family of subgraphs partitions a graph when their assigned edge sets are pairwise disjoint and have the required union. Each subgraph carries only its assigned edges, rather than all edges induced by its vertex set. Different indices may have overlapping, or even equal, vertex sets. Order sums count those indices separately. Whenever edges from different members are combined, we specify the assignment and account for the edges that remain.

For disjoint vertex sets $A \, B$, write $E_H \( A \, B \)$ for the set of edges of $H$ between them and $e_H \( A \, B \) = \| E_H \( A \, B \) \|$. Write $partial_H U$ for the edge boundary of $U subset.eq V \( H \)$. An $r$-vertex graph $H$ has #emph[cut expansion at least $h$] if

#[#set math.equation(numbering: n => "(2.1)")
 $ \| partial_H U \| gt.eq h min { \| U \| \, r - \| U \| } #h(2em) upright("for every ") U subset.eq V \( H \) . $ <eq:cut-expansion>]

If $r gt.eq 2$, singleton cuts show that its minimum degree is at least $h$, and consequently $r gt.eq h + 1$.

All logarithms denoted by $log$ are to base two; $ln$ denotes the natural logarithm. Scales $D$ are real, and decimal exponents denote exact rational numbers. Inequalities comparing integer orders with real bounds have their literal meaning. Asymptotic notation always refers to the scale tending to infinity. Once the explicitly fixed parameters of a lemma have been chosen, its implicit constants and lower scale threshold are uniform over the graphs and orders allowed by that lemma. In the final induction the finite list of parameters is fixed first, a common lower cutoff $D_(*)$ is fixed next, and only then is $C$ chosen.

=== 2.2 A path decomposition with controlled endpoints <a-path-decomposition-with-controlled-endpoints>

We use the following form of Lovász’s decomposition theorem. Disjointness in its original statement means edge-disjointness #cite(label("Lovasz1968")) Theorem 1; see also #cite(label("BM2024")) Theorem 21.

#thm([Theorem 2.1.])[
  (Lovász).  #emph[The edges of a finite simple graph on $n$ vertices can be partitioned into at most $⌊n \/ 2⌋$ paths and cycles.]
] <thm:lovasz>

The following consequence is recorded in #cite(label("BM2024")) Corollary 22. We include the deduction because endpoint multiplicities are used in two different constructions.

#thm([Corollary 2.2.])[
  #emph[Every finite simple graph on $n$ vertices has an edge partition into paths such that each vertex is an endpoint of at most two paths. In particular, the partition has at most $n$ paths.]
] <cor:endpoint-paths>

#proof[
  For $n = 0$ there is nothing to prove. Otherwise add a vertex $v_0$ and join it to precisely the even-degree vertices of the original graph, including the isolated vertices. Every old vertex now has odd degree. In a path-and-cycle partition its number of path-endpoint occurrences must therefore be odd and positive.
  Apply 3 to the augmented graph, and let $p$ be the number of path parts. The old vertices force $2 p gt.eq n$, whereas the theorem gives
  $ ⌈n \/ 2⌉ lt.eq p lt.eq upright("number of parts") lt.eq ⌊\( n + 1 \) \/ 2⌋ = ⌈n \/ 2⌉ . $
  Thus every part is a path. Each old vertex is an endpoint exactly once: an old vertex with at least three endpoint occurrences, together with the other old vertices, would force at least $n + 2$ occurrences, although $2 p lt.eq n + 1$.
  Delete $v_0$ from these paths and discard any edgeless remnants. Every old vertex is incident to at most one deleted edge, so it gains at most one new endpoint occurrence. The remaining paths partition the original edge set and have endpoint load at most two. Each positive-length path contributes two endpoint occurrences, proving the final count. ◻
]

=== 2.3 Disjoint representatives for hypergraphs <disjoint-representatives-for-hypergraphs>

A hypergraph here is a finite family of nonempty subsets of a finite ground set. A matching is a subfamily of pairwise disjoint edges. We use the following sufficient condition, from the hypergraph Hall theorem of Aharoni and Haxell #cite(label("AH2000")), in the bounded-rank form stated in #cite(label("BM2024")) Theorem 6.

#thm([Theorem 2.3.])[
  (Aharoni–Haxell).  #emph[Let $s$ be a positive integer and let $\( cal(H)_i \)_(i in J)$ be a finite indexed family of hypergraphs on a common ground set. Suppose every edge is nonempty and has size at most $s$. If, for every nonempty $I subset.eq J$, the union $union.big_(i in I) cal(H)_i$ has a matching of size strictly greater than $s \( \| I \| - 1 \)$, then there are edges $E_i in cal(H)_i$, one for each $i in J$, that are pairwise disjoint.]
] <thm:aharoni-haxell>

One may pass from the uniform-size version to this statement by padding each edge occurrence with private fresh vertices. Every matching before padding remains a matching after padding, and disjoint representatives after padding have disjoint original projections. The hypergraphs need not be distinct, and equal edges in different indexed hypergraphs cause no difficulty.

=== 2.4 Elementary probabilistic estimates <elementary-probabilistic-estimates>

We use linearity of expectation, Markov’s inequality, the union bound, and the following binomial estimates. They are stated explicitly to fix constants for the sampling arguments.

#thm([Lemma 2.4.])[
  #emph[If $X$ is binomial with mean $mu$, then 
$ Pr \( X lt.eq mu \/ 2 \) lt.eq e^(- mu \/ 8) \, #h(2em) Pr \( X gt.eq 2 mu \) lt.eq e^(- mu \/ 3) . $

]
] <lem:chernoff>

#proof[
  For $X$ a sum of independent Bernoulli variables, $bb(E) e^(t X) lt.eq exp \( mu \( e^t - 1 \) \)$. Apply Markov’s inequality with $t = - ln 2$ for the lower tail and $t = ln 2$ for the upper tail. The resulting exponents are $- mu \( 1 - ln 2 \) \/ 2$ and $- mu \( 2 ln 2 - 1 \)$, respectively. They are at most $- mu \/ 8$ and $- mu \/ 3$. ◻
]

== 3 Routing with team constraints <sec:routing>

A demand specifies two distinct vertices to be joined. Demands are indexed, so several demands may specify the same pair. Besides edge-disjointness of all routes, we will need internal vertex-disjointness for specified groups of routes. The following lemma supplies both requirements. Its proof uses the hypergraph formulation and expansion-to-connectivity method of Bucić and Montgomery #cite(label("BM2024")) Proposition 8 and Lemma 9. The vertex tokens introduced in the proof impose a separate internal-disjointness constraint for each team; different teams compete only for graph edges.

#thm([Lemma 3.1.])[
  (Routing).  #emph[Let $P$ be a graph of order $r gt.eq 2$ with cut expansion $h > 0$, and put 
#[#set math.equation(numbering: n => "(3.1)")
 $ g = ⌈8 \( r \/ h \) log \( 2 r \)⌉ \, #h(2em) ell = 2 g #scale(x: 120%, y: 120%)[\(] 1 + ⌈log r⌉ #scale(x: 120%, y: 120%)[\)] . $ <eq:routing-radii>]

 Let $cal(D)$ be a finite set of demands, where demand $p$ has distinct endvertices $x_p \, y_p in V \( P \)$. Suppose that each vertex occurs as an endvertex in at most $k$ demands, where $k gt.eq 1$. Partition $cal(D)$ into teams of size at most $b$, where $b gt.eq 1$, and give each demand a set $Z_p subset.eq V \( P \)$ of at most $z$ vertices, where $z gt.eq 0$. If 
#[#set math.equation(numbering: n => "(3.2)")
 $ h gt.eq 64 #scale(x: 120%, y: 120%)[\(] ell^2 \( k + b \) + z #scale(x: 120%, y: 120%)[\)] \, $ <eq:routing-condition>]

 then there are simple $x_p$–$y_p$ paths $Q_p$ in $P$, one for each $p in cal(D)$, with the following properties:]
  + #emph[each $Q_p$ has length at most $ell$ and no internal vertex in $Z_p$;]
  + #emph[the paths $Q_p$ are pairwise edge-disjoint;]
  + #emph[the internal vertex sets of paths in the same team are pairwise disjoint.]
  #emph[The sets $Z_p$ may contain $x_p$ or $y_p$: their restrictions concern only internal vertices. If a route must also avoid another demand’s endvertices internally, those vertices may be included in its set $Z_p$.]
] <lem:routing>

#proof[
  There is nothing to prove when $cal(D)$ is empty. Suppose it is nonempty, and write $c \( p \)$ for the team of demand $p$.
  ===== 3.1 A hypergraph obstruction. <a-hypergraph-obstruction.>
  Take a resource set that is the tagged disjoint union of $E \( P \)$ and the tokens $\( v \, c \)$, where $v in V \( P \)$ and $c$ is a team. For each demand $p$, form a hypergraph $cal(H)_p$ on this resource set. Its hyperedges correspond to all simple $x_p$–$y_p$ paths of length at most $ell$ whose internal vertices avoid $Z_p$. A candidate path contributes its graph edges and the token $\( v \, c \( p \) \)$ for each of its internal vertices. A path of length $t gt.eq 1$ therefore contributes $2 t - 1 lt.eq 2 ell$ resources. In particular all hyperedges are nonempty, and all the hypergraphs are finite. A choice of pairwise disjoint representatives from the $cal(H)_p$ gives exactly the three required properties.
  We verify the sufficient condition of 5 with $s = 2 ell$. Suppose, for a contradiction, that it fails for a nonempty $I subset.eq cal(D)$. Let $cal(M)$ be a maximum matching in $union.big_(p in I) cal(H)_p$. Then $lr(|cal(M)|) lt.eq 2 ell \( lr(||) I - 1 \)$. Let $F subset.eq E \( P \)$ be the graph-edge resources used by $cal(M)$, and put
  $ Y_c = { v in V \( P \) : \( v \, c \) upright(" is used by ") cal(M) } . $
  Each matching member uses at most $ell$ graph edges and at most $ell$ tokens, so
  #[#set math.equation(numbering: n => "(3.3)")
   $ lr(||) F lt.eq 2 ell^2 lr(||) I \, #h(2em) sum_c lr(|Y_c|) lt.eq 2 ell^2 lr(||) I . $ <eq:routing-obstruction-budgets>]
  These estimates allow several matching members to come from one demand; no restriction on their demand indices is being imposed.
  For each team let $m_c = lr(|{ p in I : c \( p \) = c }|) lt.eq b$. Thus
  $ sum_(p in I) lr(|Y_(c \( p \))|) = sum_c m_c lr(|Y_c|) lt.eq 2 b ell^2 lr(||) I . $
  Consequently the set $I_1 = { p in I : lr(|Y_(c \( p \))|) lt.eq 4 b ell^2 }$ has size at least $lr(||) I \/ 2$. Choose an inclusion-maximal set $I_2 subset.eq I_1$ whose endpoint pairs are pairwise vertex-disjoint. Every demand in $I_1$ meets one of these selected pairs. The two vertices of any selected pair occur in at most $2 k$ demands in total, so
  #[#set math.equation(numbering: n => "(3.4)")
   $ lr(|I_2|) gt.eq frac(lr(|I_1|), 2 k) gt.eq frac(lr(||) I, 4 k) . $ <eq:routing-pair-count>]
  We will also use the global endpoint count
  #[#set math.equation(numbering: n => "(3.5)")
   $ 2 lr(||) I lt.eq k r . $ <eq:routing-endpoint-count>]
  ===== 3.2 A small ball for each selected demand. <a-small-ball-for-each-selected-demand.>
  For $p in I_2$, define
  $ W_p = \( Z_p union Y_(c \( p \)) \) \\ { x_p \, y_p } \, #h(2em) P_p = \( P - F \) - W_p . $
  Here the first deletion removes edges and the second removes vertices. Both endpoints remain in $P_p$. By (3.2),
  #[#set math.equation(numbering: n => "(3.6)")
   $ lr(|W_p|) lt.eq z + 4 b ell^2 lt.eq 4 #scale(x: 120%, y: 120%)[\(] z + \( k + b \) ell^2 #scale(x: 120%, y: 120%)[\)] lt.eq h \/ 16 lt.eq h \/ 4 . $ <eq:routing-forbidden-budget>]
  Set $T = ell \/ 2 = g \( 1 + ⌈log r⌉ \)$, an integer. If the balls of radius $T$ about both $x_p$ and $y_p$ in $P_p$ had size greater than $r \/ 2$, they would intersect. Joining their paths to an intersection vertex gives an $x_p$–$y_p$ walk of length at most $2 T = ell$; deleting closed subwalks gives a simple path of no greater length. It uses no edge of $F$ and no vertex of $W_p$. Its internal vertices are also different from $x_p \, y_p$, and hence avoid both $Z_p$ and $Y_(c \( p \))$. Its hyperedge in $cal(H)_p$ is therefore disjoint from $cal(M)$, contrary to maximality of that matching.
  For every $p in I_2$ we may consequently choose an endpoint $s_p$ whose radius-$T$ ball in $P_p$ has size at most $r \/ 2$. Let $S = { s_p : p in I_2 }$. These roots are distinct because the selected endpoint pairs are disjoint. Each root retains its demand label: write $p \( s \)$ for the unique $p in I_2$ with $s = s_p$. In particular,
  #[#set math.equation(numbering: n => "(3.7)")
   $ lr(|{ v : "dist"_(P_(p \( s \))) \( s \, v \) lt.eq T }|) lt.eq r \/ 2 #h(2em) \( s in S \) . $ <eq:routing-small-root-balls>]
  ===== 3.3 Growth with different forbidden sets. <growth-with-different-forbidden-sets.>
  The deleted-edge budget may be too large to grow a ball from one root. We first grow unions of balls, retaining each root’s graph, and then alternate halving the root set with further growth until one root remains. For a nonempty $A subset.eq S$ and an integer $t gt.eq 0$, put
  $ B_t \( A \) = union.big_(s in A) { v in V \( P_(p \( s \)) \) : "dist"_(P_(p \( s \))) \( s \, v \) lt.eq t } . $
  These are unions of balls in their respective graphs; the forbidden set is kept with its root throughout. We claim that
  #[#set math.equation(numbering: n => "(3.8)")
   $ lr(|B_(t + 1) \( A \)|) gt.eq (1 + frac(h, 2 r)) lr(|B_t \( A \)|) $ <eq:routing-union-growth>]
  whenever
  #[#set math.equation(numbering: n => "(3.9)")
   $ 0 < lr(|B_t \( A \)|) lt.eq r \/ 2 \, #h(2em) lr(||) F lt.eq h lr(|B_t \( A \)|) \/ 4 . $ <eq:routing-growth-threshold>]
  To prove this, let $B = B_t \( A \)$ and assign to each $v in B$ one root $s \( v \) in A$ that reaches $v$ within $t$ steps in $P_(p \( s \( v \) \))$. Consider a boundary edge $v w$ of $B$, with $v in B$ and $w in.not B$. It extends this particular root’s path whenever $v w in.not F$ and $w in.not W_(p \( s \( v \) \))$. In that event $w in B_(t + 1) \( A \) \\ B$. Because $P$ is simple, at most $lr(|W_(p \( s \( v \) \))|) lt.eq h \/ 4$ boundary edges at $v$ fail the latter condition. Cut expansion and (3.9) therefore leave at least
  $ h lr(||) B - \( h \/ 4 \) lr(||) B - lr(||) F gt.eq \( h \/ 2 \) lr(||) B $
  usable boundary edges. Each new vertex receives at most $r$ such edges. Thus at least $h lr(||) B \/ \( 2 r \)$ new vertices are reached, proving (3.8).
  It follows that, for every integer $t gt.eq 0$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ lr(|B_t \( A \)|) gt.eq 1 med upright(" and ") quad lr(||) F lt.eq h lr(|B_t \( A \)|) \/ 4 quad arrow.r.double quad lr(|B_(t + g) \( A \)|) > r \/ 2 . $ <eq:routing-growth-block>]
  Indeed, the conclusion is immediate by monotonicity if the starting union already has size greater than $r \/ 2$. Otherwise, if it still had size at most $r \/ 2$ after $g$ more steps, all intervening unions would have size at most $r \/ 2$, while their monotonicity would preserve the edge-deletion threshold. We could apply (3.8) at all $g$ steps. Singleton cuts in the simple graph $P$ give $0 < h lt.eq r - 1 < r$, and the elementary inequality $log \( 1 + h \/ \( 2 r \) \) gt.eq h \/ \( 4 r \)$ then yields
  $ lr(|B_(t + g) \( A \)|) gt.eq (1 + frac(h, 2 r))^g lr(|B_t \( A \)|) gt.eq 2^(g h \/ \( 4 r \)) gt.eq \( 2 r \)^2 > r \/ 2 \, $
  a contradiction. This also verifies the growth time with the ceiling in the definition of $g$.
  ===== 3.4 Restarting after halving the roots. <restarting-after-halving-the-roots.>
  Initially $B_0 \( S \) = S$. By (3.3), (3.4), and (3.2),
  $ lr(||) F lt.eq 2 ell^2 lr(||) I lt.eq 8 k ell^2 lr(||) S lt.eq h lr(||) S \/ 4 . $
  The growth block (3.10) gives $lr(|B_g \( S \)|) > r \/ 2$.
  Suppose now that a nonempty root set $A$ has $lr(|B_t \( A \)|) > r \/ 2$ and $lr(||) A gt.eq 2$. Partition $A$ into two nonempty sets whose sizes differ by at most one. Their radius-$t$ ball unions together cover $B_t \( A \)$, so one of them, say $A'$, satisfies
  $ lr(|A'|) lt.eq ⌈lr(||) A \/ 2⌉ \, #h(2em) lr(|B_t \( A' \)|) > r \/ 4 . $
  The original matching has a bound independent of the number of retained roots: by (3.3), (3.5), and (3.2),
  #[#set math.equation(numbering: n => "(3.11)")
   $ lr(||) F lt.eq 2 ell^2 lr(||) I lt.eq ell^2 k r lt.eq h r \/ 64 < h lr(|B_t \( A' \)|) \/ 4 . $ <eq:routing-restart-budget>]
  Thus another growth block gives $lr(|B_(t + g) \( A' \)|) > r \/ 2$.
  Start with $A = S$ at radius $g$ and repeat this operation until only one root remains. After $j$ halvings the number of roots is at most $⌈lr(||) S \/ 2^j⌉$; this follows inductively from rounding each half upward. Hence at most $⌈log lr(||) S⌉$ halvings are needed, including zero if $lr(||) S = 1$. At termination a single root has a ball larger than $r \/ 2$ at an integer radius at most
  $ g #scale(x: 120%, y: 120%)[\(] 1 + ⌈log lr(||) S⌉ #scale(x: 120%, y: 120%)[\)] lt.eq g #scale(x: 120%, y: 120%)[\(] 1 + ⌈log r⌉ #scale(x: 120%, y: 120%)[\)] = T . $
  This contradicts (3.7) and monotonicity of that root’s balls.
  There is therefore no set $I$ for which the matching condition fails. Applying 5 gives disjoint hypergraph representatives, and their paths prove the lemma. ◻
]

For later estimates, the exact radii also give the useful uniform bound

#[#set math.equation(numbering: n => "(3.12)")
 $ ell lt.eq 108 \( r \/ h \) \( log r \)^2 = O #scale(x: 120%, y: 120%)[\(] \( r \/ h \) \( log r \)^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:routing-length-bound>]

Indeed, $h < r$ and $r gt.eq 2$ imply $g lt.eq 9 \( r \/ h \) log \( 2 r \)$, $log \( 2 r \) lt.eq 2 log r$, and $1 + ⌈log r⌉ lt.eq 3 log r$.

== 4 Expansion in small reservoirs <sec:residue>

We next process a graph containing a spanning expanding subgraph. Reserving vertices and edges to connect and close paths is already central to the cycle decomposition argument of Conlon, Fox and Sudakov #cite(label("CFS2014")) Section 3. Our aim here is to leave residual graphs with arbitrarily small total vertex order, so that their recursive cost can be paid by the later folding savings. At a scale $D$, put

$ sigma = D^0.90 \, #h(2em) tau = D^0.74 . $

Throughout this section the order $r$ lies in $sigma lt.eq r lt.eq D^1.02$. All assertions for sufficiently large $D$ are uniform over the graphs and orders in this range. Their thresholds may depend on the fixed positive constants in the statements.

=== 4.1 Splitting the expanding edges <splitting-the-expanding-edges>

#thm([Lemma 4.1.])[
  (Edge splitting).  #emph[Fix $c > 0$ and a positive integer $l$. For all sufficiently large $D$, if an $r$-vertex graph $P$ has cut expansion at least $h_0 gt.eq c D^0.90$ and $D^0.90 lt.eq r lt.eq D^1.02$, then its edge set can be partitioned into $l$ spanning subgraphs, each with cut expansion at least $h_0 \/ \( 2 l \)$.]
] <lem:edge-split>

#proof[
  Assign each edge independently and uniformly to one of $l$ classes. Fix a cut whose smaller side has size $u gt.eq 1$, and let $e$ be its number of edges in $P$. In any fixed class its size is binomial with mean $e \/ l gt.eq h_0 u \/ l$. By 6, the probability that this class has fewer than $h_0 u \/ \( 2 l \)$ cut edges is at most
  $ exp #scale(x: 120%, y: 120%)[\(] - h_0 u \/ \( 8 l \) #scale(x: 120%, y: 120%)[\)] . $
  There are at most $2 binom(r, u) lt.eq 2 r^u$ choices of a cut with smaller side of size $u$. Thus the probability of any failure is at most
  $ 2 l sum_(u = 1)^(⌊r \/ 2⌋) #scale(x: 120%, y: 120%)[\(] r exp \( - h_0 \/ \( 8 l \) \) #scale(x: 120%, y: 120%)[\)]^u = o \( 1 \) . $
  Indeed, $h_0 gt.eq c D^0.90$ while $log r lt.eq 1.02 log D$, so the base of this geometric sum tends to zero uniformly. A successful assignment gives the required edge partition. Each class is taken on the full vertex set of $P$. ◻
]

=== 4.2 Expansion after vertex sampling <expansion-after-vertex-sampling>

The issue is to control every sampled cut without a union bound over all vertex subsets. Bucić and Montgomery establish connectivity by short paths through a random vertex set, using successive exposures and well-expanding subsets #cite(label("BM2024")) Section 4. In the polynomial cut-expansion range used here, we instead fix a small family of neighborhood unions and show that it approximates every possible failing sampled cut.

#thm([Lemma 4.2.])[
  (Vertex sampling).  #emph[Fix $c' > 0$ and $p in \( 0 \, 1 \)$. Let $P$ have order $D^0.90 lt.eq r lt.eq D^1.02$ and cut expansion at least $h = c' D^0.90$. Select each vertex independently with probability $p$ to form $V'$. With probability $1 - o \( 1 \)$ as $D arrow.r oo$, all of the following hold: 
#[#set math.equation(numbering: n => "(4.1)")
 $ \| V' \| lt.eq 2 p r \, #h(2em) \| N_P \( v \) ∩ V' \| gt.eq p h \/ 2 quad \( v in V \( P \) \) \,\
P \[ V' \] upright(" has cut expansion at least ") tau = D^0.74 . $ <eq:residue-sampling-properties>]

 The error term is uniform over the stated graphs and orders, with $c'$ and $p$ fixed.]
] <lem:vertex-sampling>

#proof[
  The minimum degree of $P$ is at least $h$. The order bound and all the sampled-degree bounds fail with total probability at most
  #[#set math.equation(numbering: n => "(4.2)")
   $ exp \( - p r \/ 3 \) + r exp \( - p h \/ 8 \) = o \( 1 \) $ <eq:residue-size-degree-error>]
  by 6. We prove the expansion assertion by first controlling a deterministic family of cuts and then approximating any hypothetical failing sampled cut by a member of that family.
  ===== 4.2.1 A deterministic witness family. <a-deterministic-witness-family.>
  In a failing sampled cut, the sampled-degree bound forces most vertices on the smaller side to have many neighbors on that side. A small selection from that side can hit their neighborhoods while exposing few vertices across the cut; this is why we enumerate unions of a small number of original neighborhoods. Set
  $ M = C_p log r \, #h(2em) C_p = 16 \/ p \, #h(2em) s = ⌈4 r M \/ h⌉ . $
  For sufficiently large $D$, we have $M \/ h < 1$ and $s lt.eq r$. Before sampling $V'$, form the family
  $ cal(U) = {med union.big_(v in S) N_P \( v \) : S subset.eq V \( P \) \, med \| S \| lt.eq s med} . $
  Its members are unions of open neighborhoods in the original graph, and its size satisfies
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| cal(U) \| lt.eq sum_(t = 0)^s binom(r, t) lt.eq \( s + 1 \) r^s = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] O \( \( 1 + r M \/ h \) log r \) #scale(x: 120%, y: 120%)[\)] . $ <eq:residue-witness-count>]
  Repeated neighborhood unions only decrease this count.
  We claim that, with probability $1 - o \( 1 \)$, simultaneously for every $U in cal(U)$ satisfying $min { \| U \| \, r - \| U \| } gt.eq p h \/ 8$, one has
  #[#set math.equation(numbering: n => "(4.4)")
   $ e_P \( U ∩ V' \, V' \\ U \) gt.eq p^2 / 4 \| partial_P U \| . $ <eq:residue-witness-cut>]
  Fix such a $U$, and put $e = \| partial_P U \|$. Expansion gives $e gt.eq p h^2 \/ 8$. Partition its cut edges into at most $2 r$ matchings: greedily color the cut edges, observing that an edge has fewer than $2 r$ other edges incident with its endpoints. Fix one such coloring for each cut before sampling. The matching classes of size less than $e \/ \( 4 r \)$ contain fewer than $e \/ 2$ edges in total. In a remaining matching of size $m$, the indicators that both endpoints of an edge belong to $V'$ are independent, since its edges have disjoint endpoints. Its retained size is therefore binomial with mean $p^2 m$. The probability of retaining fewer than $p^2 m \/ 2$ edges is at most
  $ exp \( - p^2 m \/ 8 \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - p^2 e \/ \( 32 r \) #scale(x: 120%, y: 120%)[\)] lt.eq exp #scale(x: 120%, y: 120%)[\(] - p^3 h^2 \/ \( 256 r \) #scale(x: 120%, y: 120%)[\)] . $
  When none of these matching events fails, the large classes retain at least $\( p^2 \/ 2 \) \( e \/ 2 \) = p^2 e \/ 4$ edges. Independence between different matching classes or between different cuts is unnecessary: a union bound bounds the probability of any failure of (4.4) by
  #[#set math.equation(numbering: n => "(4.5)")
   $ 2 r \| cal(U) \| exp #scale(x: 120%, y: 120%)[\(] - p^3 h^2 \/ \( 256 r \) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <eq:residue-witness-error>]
  To verify this uniformly, the scale restrictions give
  $ h^2 / r gt.eq \( c' \)^2 D^0.78 \, #h(2em) r / h lt.eq \( c' \)^(- 1) D^0.12 \, #h(2em) M = O_p \( log D \) . $
  Consequently the positive term in the exponent coming from (4.3) is $O_(p \, c') \( D^0.12 \( log D \)^2 \)$, while the negative term in (4.5) has magnitude at least a fixed positive multiple of $D^0.78$.
  ===== 4.2.2 Approximating a failing cut. <approximating-a-failing-cut.>
  Fix an outcome satisfying the size and degree bounds and all of (4.4). Suppose, for a contradiction, that some $A subset.eq V'$ satisfies
  #[#set math.equation(numbering: n => "(4.6)")
   $ 0 < a = \| A \| lt.eq \| V' \| \/ 2 \, #h(2em) e_P \( A \, V' \\ A \) < tau a . $ <eq:residue-bad-cut>]
  We may assume $D$ is large enough that $tau < p h \/ 4$. If $a lt.eq p h \/ 4$, every vertex of $A$ has more than $p h \/ 4$ neighbors in $V' \\ A$, because its sampled degree is at least $p h \/ 2$ and it has at most $a - 1$ neighbors in $A$. This contradicts (4.6). Thus
  #[#set math.equation(numbering: n => "(4.7)")
   $ a > p h \/ 4 . $ <eq:residue-bad-cut-size>]
  Let
  $ A_(upright("good")) = { v in A : \| N_P \( v \) ∩ A \| gt.eq p h \/ 4 } . $
  Each vertex in $A \\ A_(upright("good"))$ has more than $p h \/ 4$ neighbors across the sampled cut. Hence
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| A \\ A_(upright("good")) \| lt.eq frac(4 tau a, p h) . $ <eq:residue-exceptional-vertices>]
  We now make a separate auxiliary random choice solely to prove the existence of a suitable set $S subset.eq A$. Include each vertex of $A$ independently with probability $q = M \/ h$. For every $v in A_(upright("good"))$, the probability that $S$ misses all its neighbors in $A$ is at most
  $ \( 1 - q \)^(p h \/ 4) lt.eq exp \( - p M \/ 4 \) . $
  Thus the probability of any required miss is at most $r exp \( - p M \/ 4 \) lt.eq r^(- 3) < 1 \/ 4$. Here the chosen value of $C_p$ is more than sufficient, since all logarithms are base two. Also $bb(E) \| S \| = a M \/ h$. If $T \( S \)$ denotes the number of vertices of $V' \\ A$ with a neighbor in $S$, then a union bound for each such vertex gives
  $ bb(E) T \( S \) lt.eq M / h sum_(v in V' \\ A) \| N_P \( v \) ∩ A \| = M / h e_P \( A \, V' \\ A \) < frac(tau M a, h) . $
  Markov’s inequality shows that each of the events $\| S \| > 4 a M \/ h$ and $T \( S \) > 4 tau M a \/ h$ has probability at most $1 \/ 4$. The sum of these three failure probabilities is less than one. We can therefore choose $S$ satisfying all three desired properties:
  #[#set math.equation(numbering: n => "(4.9)")
   $ \| S \| lt.eq 4 a M \/ h \, #h(2em) T \( S \) lt.eq 4 tau M a \/ h \,\
S ∩ N_P \( v \) eq.not diameter quad \( v in A_(upright("good")) \) . $ <eq:residue-hitting-set>]
  The auxiliary choice is made after $V'$ and $A$ have been fixed; the uniform event (4.4) was already established for every possible resulting neighborhood union.
  Put $U = union.big_(v in S) N_P \( v \)$. Since $\| S \| lt.eq 4 a M \/ h lt.eq 4 r M \/ h$, we have $U in cal(U)$. The vertices of $A$ absent from $U$ are all exceptional in (4.8), and the vertices of $U ∩ V'$ outside $A$ are counted by $T \( S \)$. Consequently
  #[#set math.equation(numbering: n => "(4.10)")
   $ delta := \| \( U ∩ V' \) triangle.stroked.t A \| lt.eq frac(4 tau a, p h) + frac(4 tau M a, h) = O_p #h(-0.16667em) (frac(tau M a, h)) = o \( a \) . $ <eq:residue-cut-approximation>]
  In the last step we used $tau M \/ h = O_(p \, c') \( D^(- 0.16) log D \) = o \( 1 \)$. Both sides of the cut in the #emph[original] graph are large:
  $ \| U \| gt.eq \| A \| - delta = a - delta \, #h(2em) r - \| U \| gt.eq \| V' \\ U \| gt.eq \| V' \\ A \| - delta gt.eq a - delta . $
  For sufficiently large $D$, these are at least $a \/ 2 > p h \/ 8$. Applying (4.4) and the expansion of $P$ therefore gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ e_P \( U ∩ V' \, V' \\ U \) gt.eq frac(p^2 h a, 8) . $ <eq:residue-approximating-cut-lower>]
  On the other hand, changing the side of one vertex changes the size of a cut in a simple $r$-vertex graph by at most $r - 1$. Changing the $delta$ vertices in (4.10) yields
  $ e_P \( U ∩ V' \, V' \\ U \) lt.eq e_P \( A \, V' \\ A \) + r delta < tau a + r delta . $
  The ratio of this upper bound to $h a$ is at most
  #[#set math.equation(numbering: n => "(4.12)")
   $ tau / h + O_p #h(-0.16667em) (frac(tau M r, h^2)) = O_(p \, c') \( D^(- 0.16) \) + O_(p \, c') \( D^(- 0.04) log D \) = o \( 1 \) \, $ <eq:residue-cut-perturbation>]
  contradicting (4.11). Thus no cut (4.6) exists. Together with (4.2) and (4.5), this proves the lemma.
  All uses of $o \( 1 \)$ above occur after $p$ and $c'$ have been fixed. In particular, an arbitrarily small fixed positive sampling probability changes the cutoff but does not change any of the strict exponent inequalities. ◻
]

=== 4.3 Closing paths through three reservoirs <closing-paths-through-three-reservoirs>

Bucić and Montgomery use three vertex classes and reserved connecting subgraphs to close paths through a class avoided by the original path #cite(label("BM2024")) Section 2.2 and Lemma 23. We use three disjoint reservoirs of arbitrarily small fixed relative order. Every edge has both endpoints outside at least one of them. After reserving the connecting edges, we can therefore assign each remaining edge to such a complement, partition that graph into paths, and close the paths through its reservoir. The preceding sampling lemma supplies the internal expansion needed for these routes. Unused reserved edges between a reservoir and its complement are taken singly, leaving only unused reserved edges inside reservoirs for recursion.

#thm([Lemma 4.3.])[
  (Small residue).  #emph[Fix $eta > 0$ and $c > 0$. For all sufficiently large $D$, let $G$ be an $r$-vertex graph with $D^0.90 lt.eq r lt.eq D^1.02$ containing a spanning subgraph of cut expansion at least $c D^0.90$. Then $E \( G \)$ has a partition into at most $9 r$ completed parts, each a simple cycle or a single edge, and the edge sets of at most three residual simple graphs. The residual graphs have pairwise disjoint vertex sets contained in $V \( G \)$, their total order is at most $eta r$, and each has order strictly less than $r$.]
] <lem:small-residue>

#proof[
  Write $c_0 = min { c \, 1 }$, and fix
  $ p = min { eta \/ 12 \, 1 \/ 12 } \, #h(2em) h = \( c_0 \/ 6 \) sigma . $
  In particular, $3 p < 1$, $6 p lt.eq eta$, and $2 p < 1$. By 8, the edges of the given spanning expanding subgraph can be partitioned into three spanning subgraphs $P_1 \, P_2 \, P_3$, each of cut expansion at least $h$.
  ===== 4.3.1 Disjoint reservoirs and bounded representative loads. <disjoint-reservoirs-and-bounded-representative-loads.>
  Label the vertices independently, using each label $i in { 1 \, 2 \, 3 }$ with probability $p$ and a fourth label with probability $1 - 3 p$. Let $V_i$ be the vertices with label $i$. These three sets are pairwise disjoint, and each marginal $V_i$ is a Bernoulli-$p$ sample for the fixed graph $P_i$. By 9 and a union bound over the three marginal failure probabilities, we can choose the labels so that, for each $i$,
  #[#set math.equation(numbering: n => "(4.13)")
   $ \| V_i \| lt.eq 2 p r \, #h(2em) \| N_(P_i) \( v \) ∩ V_i \| gt.eq p h \/ 2 quad \( v in V \( G \) \) \,\
P_i \[ V_i \] upright(" has cut expansion at least ") tau . $ <eq:residue-three-reservoirs>]
  Independence between these three success events is not required. The neighbor assertion makes $V_i$ nonempty and gives every vertex of $V_i$ a neighbor in $V_i$, so $\| V_i \| gt.eq 2$.
  For each $i$, reserve all edges $E_i^(upright("in")) = E \( P_i \[ V_i \] \)$. Also reserve two edges from each $v in V \( G \) \\ V_i$ to two distinct representatives in $V_i$. The representatives can be chosen so that at most
  #[#set math.equation(numbering: n => "(4.14)")
   $ k_0 = ⌈8 r \/ \( p h \)⌉ $ <eq:residue-representative-capacity>]
  of these edges are incident with any one vertex of $V_i$. Indeed, process the two choices for every outside vertex in turn. At any point fewer than $2 r$ edges have been chosen, so the number of representatives already at capacity $k_0$ is at most $2 r \/ k_0 lt.eq p h \/ 4$. There are at least $p h \/ 2$ potential representatives for the next choice by (4.13). Excluding the saturated ones and, for the second choice at a vertex, its first representative, leaves at least $p h \/ 4 - 1 > 0$ choices for sufficiently large $D$. This greedy procedure proves the claim. Denote the selected outside-to-representative edges by $E_i^(upright("out"))$.
  For a fixed $i$, the internal and outside reservations are disjoint. Reservations for different values of $i$ also have disjoint edge sets, because they belong to the edge-disjoint graphs $P_i$. Let
  $ E_(upright("res")) = union.big_(i = 1)^3 \( E_i^(upright("in")) union E_i^(upright("out")) \) $
  be the entire reserved edge set.
  ===== 4.3.2 The complementary path partitions. <the-complementary-path-partitions.>
  Every edge in $E \( G \) \\ E_(upright("res"))$ has both endpoints outside at least one $V_i$, since its two endpoints meet at most two of the three disjoint reservoirs. Assign each such edge to one such index $i$, choosing just one index if several are available. This gives edge-disjoint graphs $G_i$ on $V \( G \) \\ V_i$ whose edge sets partition all nonreserved edges. By 4, each $G_i$ has a partition into positive-length simple paths, with each vertex an endpoint at most twice. Since each path has two endpoint occurrences, its path family $cal(P)_i$ has size at most $\| V \( G \) \\ V_i \| lt.eq r$. An empty edge set contributes no paths.
  For each endpoint occurrence of $v$ in $cal(P)_i$, assign one of its two reserved edges in $E_i^(upright("out"))$, using different edges for different occurrences. This is possible by the endpoint load bound. For a path $Q in cal(P)_i$ with distinct endpoints $x \, y$, let $x' \, y' in V_i$ be their assigned representatives. When $x' eq.not y'$, issue one demand between them in $P_i \[ V_i \]$. When $x' = y'$, no routing demand is necessary. Every demand-end occurrence uses a different reserved edge at its representative. Hence the total demand load at each vertex of $V_i$ is at most $k_0$.
  ===== 4.3.3 Routing and simple cycles. <routing-and-simple-cycles.>
  Apply 7 separately in each $P_i \[ V_i \]$, with expansion parameter $tau$, endpoint load $k = k_0$, singleton teams ($b = 1$), and no forbidden vertices ($z = 0$). We check its numerical hypothesis using the actual order $r_i = \| V_i \|$. This graph has order at least two and cut expansion at least $tau$, and therefore $tau lt.eq r_i - 1$. The value $ell_i$ in 7 satisfies
  $ ell_i = O #h(-0.16667em) (r / tau \( log r \)^2) \, #h(2em) k_0 = O_(p \, c) #h(-0.16667em) (r / h) . $
  Here the ceiling in (4.14) is absorbed because $r \/ h gt.eq 6$. Consequently
  #[#set math.equation(numbering: n => "(4.15)")
   $ ell_i^2 \( k_0 + 1 \) & = O_(p \, c) #h(-0.16667em) (frac(r^3, tau^2 h) \( log r \)^4)\
 & = O_(p \, c) \( D^0.68 \( log D \)^4 \) = o \( D^0.74 \) = o \( tau \) . $ <eq:residue-routing-margin>]
  Thus (3.2) holds for all sufficiently large $D$. The lemma supplies pairwise edge-disjoint simple routing paths for all the distinct-representative demands in this reservoir. All their edges are in the reserved set $E_i^(upright("in"))$.
  For $Q$ as above with $x' eq.not y'$, join its endpoints by the edge $x x'$, the routing path from $x'$ to $y'$, and the edge $y' y$. Every new internal vertex lies in $V_i$, while $Q$ is entirely outside $V_i$. The resulting closed walk is therefore a simple cycle. When $x' = y'$, the two reserved edges themselves form a simple two-edge connection from $x$ to $y$ through that representative, and again close $Q$ to a simple cycle. Its two reserved edges are distinct because $x eq.not y$. In this case even a one-edge path $Q$ produces a triangle; with different representatives the resulting cycle has at least four edges. Thus every completed cycle has length at least three.
  The cycles are edge-disjoint. Their original path edges partition the nonreserved edges; each assigned representative edge is used once; and the routing paths are edge-disjoint within each $P_i \[ V_i \]$. These three types of edges are disjoint by reservation. The reservations in different $P_i$ are also edge-disjoint, regardless of vertex overlaps among different cycles.
  ===== 4.3.4 Counting and the exact remaining edge sets. <counting-and-the-exact-remaining-edge-sets.>
  We have produced at most $sum_i \| cal(P)_i \| lt.eq 3 r$ cycles. Take every unused edge in $union.big_i E_i^(upright("out"))$ as a single-edge part, using at most
  $ sum_(i = 1)^3 2 \| V \( G \) \\ V_i \| lt.eq 6 r $
  further parts. The number of completed parts is therefore at most $9 r$.
  For each $i$, let $H_i$ be the graph on $V_i$ consisting of exactly the unused edges of $E_i^(upright("in"))$. These are the only remaining edges: every nonreserved edge was placed in a path, every reserved outside edge was used in a cycle or taken singly, and every reserved internal edge was used by a routing path or placed in $H_i$. In particular, $H_i$ is not defined by taking all remaining edges of the original induced graph $G \[ V_i \]$; nonreserved edges, including ones with both endpoints in a reservoir, were already assigned to the appropriate complementary graphs. This accounts for every original edge exactly once.
  The graphs $H_i$ are simple, have the pairwise disjoint vertex sets $V_i$, and satisfy
  #[#set math.equation(numbering: n => "(4.16)")
   $ sum_(i = 1)^3 \| V \( H_i \) \| = sum_(i = 1)^3 \| V_i \| lt.eq 6 p r lt.eq eta r \, #h(2em) \| V \( H_i \) \| lt.eq 2 p r lt.eq r \/ 6 < r . $ <eq:residue-final-order>]
  Isolated vertices may be retained; a residual graph with no edges may alternatively be omitted. The only parameters fixed before increasing $D$ were $eta \, c$ and the constants determined from them. This completes the proof. ◻
]

== 5 Splitting at a scale <sec:splitting>

The first operation below splits the graph into small boxes, allowing a small amount of vertex overlap. The second operation extracts expanding pieces on disjoint vertex sets within each box. Only edges leave when a piece is extracted: the residual graph retains every box vertex. Thus every earlier piece vertex still occurs in a descendant box when the operations are iterated. The overlapping split and its inverse-logarithmic order potential adapt the expander splitting argument of Bucić and Montgomery #cite(label("BM2024")) Lemma 14. Here we stop at a prescribed scale and obtain a total box order of $N \( 1 + O \( 1 \/ log D \) \)$, which will be charged in the final induction.

#thm([Lemma 5.1.])[
  (Splitting at a scale).  #emph[There are absolute constants $D_(upright("sp"))$ and $C_0$ such that, for every real $D gt.eq D_(upright("sp"))$, every graph $G$ on a nonempty vertex set of order $N$ and with average degree at most $D$ admits the following two successive operations. One may take $C_0 = 2$.]
  + #emph[ Remove a family $cal(C)$ of edge-disjoint cycles, each of length at least $D^1.01$, where 
#[#set math.equation(numbering: n => "(5.1)")
 $ lr(|cal(C)|) lt.eq frac(N, 2 D^0.01) . $ <eq:scale-cycle-cost>]

 Partition the remaining edges into graphs $G_Y$ on an indexed family $cal(Y)$ of vertex sets, called boxes. These satisfy 
#[#set math.equation(numbering: n => "(5.2)")
 $ union.big_(Y in cal(Y)) Y = V \( G \) \, #h(2em) 1 lt.eq lr(||) Y lt.eq D^1.02 \,\
sum_(Y in cal(Y)) lr(||) Y lt.eq (1 + frac(C_0, log D)) N . $ <eq:scale-box-order>]

 The graphs $G_Y$ contain only their assigned edges; their vertex sets may overlap.]
  + #emph[ Put $sigma = D^0.90$. For each box $Y$, partition $E \( G_Y \)$ into the edge sets of a family $cal(R)_Y$ of graphs $R$ and a graph $H_Y$. The vertex sets of the graphs in $cal(R)_Y$ are pairwise disjoint subsets of $Y$. Each $R$ has cut expansion at least $sigma$ and order 
#[#set math.equation(numbering: n => "(5.3)")
 $ sigma lt.eq lr(|V \( R \)|) lt.eq D^1.02 . $ <eq:scale-piece-order>]

 The residual graph $H_Y$ is taken on all of $Y$, including isolated vertices, and satisfies 
#[#set math.equation(numbering: n => "(5.4)")
 $ frac(2 lr(|E \( H_Y \)|), lr(||) Y) lt.eq D^0.95 . $ <eq:scale-residual-degree>]

]
  #emph[Thus the cycles in $cal(C)$, the pieces $R$, and the residual graphs $H_Y$ together partition $E \( G \)$.]
] <lem:scale-split>

We first give the elementary long-cycle argument used to find the overlapping splits. It is the depth-first-search and bypass argument of Bucić and Montgomery #cite(label("BM2024")) Lemma 25, with constants suited to the present scale cutoff. Related depth-first-search balance arguments appear in Ben-Eliezer, Krivelevich and Sudakov #cite(label("BKS2012")) Lemma 2.3; Krivelevich #cite(label("Krivelevich2019")) Theorem 1 gives a stronger general criterion for long cycles from local expansion. For a vertex set $U$ in a graph $H$, write $N_H \( U \) = union.big_(v in U) N_H \( v \)$; its external neighbor set is $N_H \( U \) \\ U$.

#thm([Lemma 5.2.])[
  (Vertex expansion gives a long cycle).  #emph[Fix $epsilon = 1 \/ 32$. For every sufficiently large integer $u$, put $alpha = epsilon \/ log^2 u$. If a graph $H$ of order $u$ satisfies 
#[#set math.equation(numbering: n => "(5.5)")
 $ lr(|N_H \( U \) \\ U|) gt.eq alpha lr(||) U #h(2em) (0 < lr(||) U lt.eq u / 2) \, $ <eq:split-vertex-expansion>]

 then $H$ contains a simple cycle of length greater than 
#[#set math.equation(numbering: n => "(5.6)")
 $ q \( u \) = frac(alpha^2 u, 100) = frac(epsilon^2 u, 100 log^4 u) . $ <eq:split-long-cycle-length>]

]
] <lem:split-vertex-expansion>

#proof[
  The expansion condition implies that $H$ is connected: in a disconnected graph some component has order between $1$ and $u \/ 2$ and has no external neighbors.
  Run a depth first search. Its state consists of the unexplored vertices, a stack whose vertices in stack order form a simple path, and the finished vertices. Initially the stack consists of one vertex, all other vertices are unexplored, and none are finished. If the top vertex of the stack has an unexplored neighbor, push such a neighbor onto the stack. Otherwise pop the top vertex and mark it finished. At all times there are no edges between finished and unexplored vertices: when a vertex is finished it has no unexplored neighbor, and the unexplored set subsequently only shrinks. Connectivity ensures that the stack cannot become empty while an unexplored vertex remains, so this search finishes all vertices.
  The number of unexplored vertices minus the number of finished vertices starts at $u - 1$, ends at $- u$, and decreases by exactly one at every push or pop. Consequently there is a state at which these two numbers are exactly equal, say to $t$. Let $P$ be the stack path at that state, and let $L = lr(|V \( P \)|) = u - 2 t$. If $t gt.eq u \/ 3$, then $0 < t lt.eq u \/ 2$, and all external neighbors of the unexplored set lie on $P$. Applying (5.5) gives $L gt.eq alpha t gt.eq alpha u \/ 3$. If $t < u \/ 3$, then $L > u \/ 3 gt.eq alpha u \/ 3$, since $alpha lt.eq 1$ for the values of $u$ under consideration. Thus in either case
  #[#set math.equation(numbering: n => "(5.7)")
   $ L gt.eq frac(alpha u, 3) . $ <eq:split-stack-order>]
  Write $q = q \( u \)$ and $j = ⌊⌋ q$. We may assume $q gt.eq 1$, since $u \/ log^4 u$ tends to infinity. In particular $j gt.eq 1$, and
  $ j + 1 lt.eq 2 q = frac(alpha^2 u, 50) lt.eq frac(alpha u, 6) lt.eq L / 2 . $
  Partition $P$ into three consecutive vertex segments $X \, J \, Z$, with $lr(||) J = j$, distributing the other $L - j$ vertices as evenly as possible between $X$ and $Z$. Both outer segments have order at least
  $ ⌊frac(L - j, 2)⌋ gt.eq frac(L - j - 1, 2) gt.eq L / 4 . $
  These inequalities include the integer rounding needed to make the three segments nonempty.
  Suppose first that $H - J$ has a path from $X$ to $Z$. Choose one of minimum length among all such paths, with endpoints $x in X$ and $z in Z$. A shortest path is simple. Its interior contains no vertex of $X$ or $Z$, because encountering either set internally would give a shorter path between the two sets. It also avoids $J$. Since $X \, J \, Z$ partition $V \( P \)$, the chosen path meets $P$ only at $x \, z$. Its union with the $x$–$z$ subpath of $P$ is therefore a simple cycle. That subpath contains all $j$ vertices of $J$ and has at least $j + 1$ edges; the new path has at least one edge. The cycle consequently has at least $j + 2 gt.eq 3$ edges, and its length is greater than $q$.
  It remains to show that such a path must exist. Otherwise $X$ and $Z$, each connected by its segment of $P$, lie in distinct components of $H - J$. Separate the component containing $X$ from the union of all other components, which contains $Z$, and let $A$ be the smaller of these two sets. Then
  $ L / 4 lt.eq lr(||) A lt.eq frac(u - j, 2) lt.eq u / 2 \, #h(2em) N_H \( A \) \\ A subset.eq J . $
  Expansion and (5.7) imply
  $ j gt.eq alpha lr(||) A gt.eq frac(alpha L, 4) gt.eq frac(alpha^2 u, 12) > frac(alpha^2 u, 100) = q \, $
  contrary to $j = ⌊⌋ q$. This proves the lemma. ◻
]

#proof[
  We prove the two operations in order. All lower bounds imposed on $D$ in this proof are absolute and hold simultaneously for every $D gt.eq D_(upright("sp"))$ after one choice of $D_(upright("sp"))$.
  ===== 5.1 Removing long cycles. <removing-long-cycles.>
  Choose a maximal family $cal(C)$ of edge-disjoint cycles in $G$ whose lengths are at least $D^1.01$. Since $lr(|E \( G \)|) lt.eq N D \/ 2$, we have
  $ lr(|cal(C)|) D^1.01 lt.eq lr(|E \( G \)|) lt.eq frac(N D, 2) \, $
  which proves (5.1). Integral cycle lengths are compared with the real threshold as stated, equivalently with $⌈D^1.01⌉$. Delete these cycle edges and retain the entire vertex set. By maximality the remaining graph has no cycle of length at least $D^1.01$. Every graph subsequently formed in the first operation is a subgraph of this remainder, so it inherits this prohibition.
  ===== 5.2 A sparse external neighborhood. <a-sparse-external-neighborhood.>
  Put $T = D^1.02$ and $epsilon = 1 \/ 32$. We claim that every current graph $H$ of order $u > T$ has a nonempty vertex set $U$ such that
  #[#set math.equation(numbering: n => "(5.8)")
   $ lr(||) U lt.eq u / 2 \, #h(2em) lr(|N_H \( U \) \\ U|) < frac(epsilon lr(||) U, log^2 u) . $ <eq:split-sparse-neighborhood>]
  Otherwise 12 supplies a cycle longer than $q \( u \)$ as defined in (5.6). To obtain a contradiction uniformly for every $u > T$, including $u$ arbitrarily large relative to $D$, observe that $x \/ log^4 x$ is increasing for $ln x > 4$, as follows by differentiating. Moreover,
  #[#set math.equation(numbering: n => "(5.9)")
   $ frac(q \( T \), D^1.01) = frac(epsilon^2, 100 \( 1.02 \)^4) frac(D^0.01, \( log D \)^4) arrow.r oo #h(2em) \( D arrow.r oo \) . $ <eq:split-uniform-margin>]
  Choose $D_(upright("sp"))$ large enough that $T$ is in the range of 12, that $T > e^4$, and that $q \( T \) > D^1.01$. Then $q \( u \) > D^1.01$ for every $u > T$, contradicting the inherited cycle prohibition. This proves (5.8).
  ===== 5.3 The overlapping split and its edge assignment. <the-overlapping-split-and-its-edge-assignment.>
  For such a set $U$, put $B = N_H \( U \) \\ U$ and form two children on vertex sets
  $ V_1 = U union B \, #h(2em) V_2 = V \( H \) \\ U . $
  Assign to the first child every edge of $H$ with both endpoints in $V_1$, and assign to the second child every other edge of $H$. Every edge incident with $U$ has both endpoints in $U union B$. Consequently every edge assigned to the second child has both endpoints in $V_2$. This is an edge partition into two simple subgraphs; in particular, edges with both endpoints in the overlap $B$ are assigned only to the first child. The child vertex sets cover the parent and have intersection exactly $B$. All vertices of each specified child set are retained, even when isolated in its assigned graph.
  Writing $s = lr(||) U$, $b = lr(||) B$, $u_1 = s + b$ and $u_2 = u - s$, we have $1 lt.eq s lt.eq u \/ 2$ and $b < epsilon s \/ log^2 u$. For sufficiently large $D$, therefore,
  #[#set math.equation(numbering: n => "(5.10)")
   $ 1 lt.eq u_1 lt.eq frac(3 u, 4) \, #h(2em) 1 lt.eq u_2 < u \,\
u_1 + u_2 = u + b lt.eq u + frac(epsilon u_1, log^2 u) . $ <eq:split-child-orders>]
  Indeed $epsilon \/ log^2 u lt.eq 1 \/ 2$ gives $u_1 < \( 3 \/ 2 \) s lt.eq 3 u \/ 4$, and $u_2 < u$ follows from $s gt.eq 1$. Repeat this split whenever the current order exceeds $T$. Both child orders are positive integers strictly smaller than their parent order, so the resulting binary splitting tree is finite. Its leaves give the graphs $G_Y$ on boxes of order at most $T$. The child cover property gives $union.big_Y Y = V \( G \)$, and the edge assignments at each split show that the leaf graphs partition exactly the edges left after the cycle removal.
  ===== 5.4 Controlling the sum of box orders. <controlling-the-sum-of-box-orders.>
  The sum of child orders can exceed the parent order by $b$. The following potential pays for this overlap. For every real $x gt.eq 1$ define
  #[#set math.equation(numbering: n => "(5.11)")
   $ f \( x \) = 1 + frac(1, log \( T \/ 2 \)) - frac(1, log \( max { x \, T \/ 2 } \)) . $ <eq:split-potential>]
  For $T gt.eq 4$, this is nondecreasing and
  #[#set math.equation(numbering: n => "(5.12)")
   $ 1 lt.eq f \( x \) lt.eq 1 + frac(1, log \( T \/ 2 \)) lt.eq 2 . $ <eq:split-potential-range>]
  At a split of a graph of order $u > T$, put $M = max { u_1 \, T \/ 2 }$. By (5.10) and $u > T$, we have $M lt.eq 3 u \/ 4$. Both logarithms below are positive, and
  #[#set math.equation(numbering: n => "(5.13)")
   $ f \( u \) - f \( u_1 \) & = frac(1, log M) - frac(1, log u)\
 & = frac(log \( u \/ M \), log M thin log u) gt.eq frac(log \( 4 \/ 3 \), log^2 u) . $ <eq:split-potential-decrement>]
  Monotonicity also gives $f \( u_2 \) lt.eq f \( u \)$. Hence, using (5.10),
  #[#set math.equation(numbering: n => "(5.14)")
   $ u_1 f \( u_1 \) + u_2 f \( u_2 \) & lt.eq \( u_1 + u_2 \) f \( u \) - frac(u_1 log \( 4 \/ 3 \), log^2 u)\
 & lt.eq u f \( u \) + frac(u_1, log^2 u) #scale(x: 120%, y: 120%)[\(] epsilon f \( u \) - log \( 4 \/ 3 \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq u f \( u \) . $ <eq:split-potential-subadditivity>]
  For the last step, (5.12) gives $epsilon f \( u \) lt.eq 1 \/ 16 < log \( 4 \/ 3 \)$. Repeatedly applying (5.14) in the finite splitting tree, and using $f gt.eq 1$ on its leaves, proves
  $ sum_(Y in cal(Y)) lr(||) Y lt.eq sum_(Y in cal(Y)) lr(||) Y f \( lr(||) Y \) lt.eq N f \( N \) lt.eq N (1 + frac(1, log \( T \/ 2 \))) . $
  This argument also applies if $N lt.eq T$, when the tree has just its root. Since $T = D^1.02$ and $D gt.eq 4$,
  $ frac(1, log \( T \/ 2 \)) = frac(1, 1.02 log D - 1) lt.eq frac(2, log D) . $
  This proves (5.2) with $C_0 = 2$ and finishes operation Lemma 5.1.
  ===== 5.5 Extracting pieces of cut expansion $sigma$. <extracting-pieces-of-cut-expansion-sigma.>
  This repeated removal of sparse cuts follows the small-side charging method used by Conlon, Fox and Sudakov #cite(label("CFS2014")) Lemma 3.1. We give the accounting for the precise cut expansion and residual average degree required here. Fix a box $Y$, write $y = lr(||) Y$, and start with its assigned graph $G_Y$. Whenever a current graph on a vertex set $A$ of order at least two fails to have cut expansion $sigma = D^0.90$, choose a partition $A = A_1 dot(union) A_2$ into nonempty sets such that its cut has fewer than $sigma min { lr(|A_1|) \, lr(|A_2|) }$ edges. Put those cut edges into the residual graph $H_Y$, and continue separately with the edges internal to each of $A_1 \, A_2$. Both child orders strictly decrease, so this procedure terminates. Its terminal vertex sets partition $Y$. The nonsingleton terminal graphs form $cal(R)_Y$; by the stopping rule each has cut expansion at least $sigma$. If such a graph has order $r$, its singleton cuts show that its minimum degree is at least $sigma$. Simplicity then gives $r - 1 gt.eq sigma$, and in particular (5.3). Terminal singletons carry no edges and are omitted from $cal(R)_Y$.
  To bound the edges put into $H_Y$, at each split charge their number equally to the vertices in a smaller side, choosing either side in case of equality. Each charged vertex receives less than $sigma$ at that split. Whenever a given vertex is charged, the current set containing it decreases in size by a factor of at least two; any intervening splits can only decrease its size further. If the vertex is charged $k$ times, after its last charge its set has order at most $y \/ 2^k$ and at least one. Thus $k lt.eq log y$.
  All residual cut edges are distinct, because each subsequent split uses only edges internal to a previous child. Summing the charges therefore gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ lr(|E \( H_Y \)|) lt.eq sigma y log y . $ <eq:split-cut-charge>]
  Every edge not set aside ends in exactly one terminal graph, and singleton terminal graphs contain no edges. Thus $H_Y$ and the graphs in $cal(R)_Y$ partition $E \( G_Y \)$ exactly. Define $V \( H_Y \) = Y$, retaining also the vertices of all terminal graphs. For $y = 1$ the residual has no edges. For every $1 lt.eq y lt.eq D^1.02$, (5.15) yields
  $ frac(2 lr(|E \( H_Y \)|), y) lt.eq 2 sigma log y lt.eq 2.04 D^0.90 log D lt.eq D^0.95 \, $
  where the last inequality holds for all sufficiently large $D$. This proves operation (5.2) and the lemma. ◻
]

In particular, when the two operations are repeated on the residual graphs, the boxes descending from any fixed box continue to cover every vertex of that box. This follows from the cover property of each overlapping split and the fact that $H_Y$ always has vertex set $Y$, irrespective of which incident edges were removed as cycles or expanding pieces.

== 6 Pair folding and resolving batches <sec:folding>

Identifying pairs of vertices reduces the order of the graph to which induction will be applied. After setting aside loops and all but one edge in each parallel class, each quotient edge has a unique original representative. A quotient cycle may enter a pair at one member and leave through the other; a reserved path joins them. To obtain a simple cycle, the interiors of these paths must avoid all representative endpoints and be pairwise disjoint within that cycle.

The first lemma bounds the number of edges set aside in this cleanup. A degree bound at the paired vertices alone is insufficient: for positive integers $a$ and $m$ with $m$ even, pairing the $m$-vertex side of $K_(m \, a)$ forces $a m \/ 2$ edges to be set aside, although each paired vertex has degree $a$. The lemma therefore also bounds the number of neighbors in each folding set at every vertex, including vertices outside those sets.

#thm([Lemma 6.1.])[
  (Pair folding).  #emph[Let $J$ be a finite simple graph and let $X_1 \, dots.h \, X_t$ be pairwise disjoint subsets of its vertex set. Suppose that $a gt.eq 1$, that $m_i = lr(|X_i|) gt.eq max { 8 \, a^2 }$ for every $i$, and that 
#[#set math.equation(numbering: n => "(6.1)")
 $ d_J \( x \) & lt.eq a &  & upright("for every ") x in union.big_i X_i \,\
d_i \( v \) := lr(|N_J \( v \) ∩ X_i|) & lt.eq a &  & upright("for every ") v in V \( J \) upright(" and every ") i . $ <eq:fold-degree>]

 There are pairings within the $X_i$, each leaving exactly $m_i med mod med 2$ vertices unpaired, and a set $E_(upright("err")) subset.eq E \( J \)$ with 
$ lr(|E_(upright("err"))|) lt.eq 2 sum_i m_i \, $

 such that identifying each pair in $J - E_(upright("err"))$ gives a simple graph $Q$. Every edge of $Q$ has exactly one retained original edge as its representative. Retaining all quotient vertices, including isolated ones, we have 
#[#set math.equation(numbering: n => "(6.2)")
 $ lr(|V \( Q \)|) = lr(|V \( J \)|) - sum_i ⌊m_i \/ 2⌋ . $ <eq:fold-order>]

 The assertion also holds when the family of folding sets is empty.]
] <lem:pair-folding>

#proof[
  Choose a uniform perfect pairing when $m_i$ is even. When $m_i$ is odd, adjoin a dummy vertex, choose a uniform perfect pairing on the $m_i + 1$ vertices, and delete the dummy vertex and its incident pairing edge, leaving its original partner unpaired. Each pairing with one unpaired original vertex has exactly one extension of this kind, so the resulting distribution is uniform. Make the choices for different $i$ independently.
  For distinct specified vertices $u \, v$ of a set of order $m$, symmetry of the partner of $u$ gives the following exact probabilities. For two prescribed disjoint pairs, conditioning on the first pair leaves a uniform perfect pairing on the remaining vertices, including the dummy when present. Thus
  #[#set math.equation(numbering: n => "(6.3)")
   $ & m upright(" even") & m upright(" odd")\
Pr \( { u \, v } upright(" is a pair") \) & frac(1, m - 1) & 1 / m\
Pr \( upright("two prescribed disjoint pairs occur") \) & frac(1, \( m - 1 \) \( m - 3 \)) & frac(1, m \( m - 2 \)) $ <eq:fold-probabilities>]
  In particular the even-column expressions are valid upper bounds for both parities.
  Let $pi$ send each vertex to its fiber after the identifications. Every fiber has size one or two. Before removing any edges, let $Z$ count the original edges that become loops, plus the unordered pairs of distinct original edges that become the same nonloop edge. We bound $bb(E) Z$ by classifying all possible errors.
  ===== 6.1 Loops and collisions with a common original endpoint. <loops-and-collisions-with-a-common-original-endpoint.>
  An original edge becomes a loop precisely when its endpoints form a pair in some $X_i$. There are at most $a m_i \/ 2$ original edges inside $X_i$, so its expected loop contribution is at most $a m_i \/ \( 2 \( m_i - 1 \) \)$.
  Two distinct edges sharing an original endpoint have the form $v u \, v w$ with $u eq.not w$. If they become the same nonloop edge, then $pi \( u \) = pi \( w \) eq.not pi \( v \)$, so $u \, w$ must be paired in some $X_i$. No other identification is possible: identifying all three original vertices would require a fiber of size at least three. Consequently the contribution charged to $X_i$ is at most
  $ frac(1, m_i - 1) sum_(v in V \( J \)) binom(d_i \( v \), 2) lt.eq frac(a \( a - 1 \) m_i, 2 \( m_i - 1 \)) . $
  Here $binom(d, 2) lt.eq \( a - 1 \) d \/ 2$ for every integer $0 lt.eq d lt.eq a$, and
  $ sum_(v in V \( J \)) d_i \( v \) = sum_(x in X_i) d_J \( x \) lt.eq a m_i . $
  The equality counts both incidences of every internal edge on both sides. Combining the loop and common-endpoint bounds, the expectation is at most
  #[#set math.equation(numbering: n => "(6.4)")
   $ sum_i frac(a^2 m_i, 2 \( m_i - 1 \)) lt.eq 4 / 7 sum_i a^2 \, $ <eq:fold-first-errors>]
  since $m_i gt.eq 8$.
  ===== 6.2 Collisions with four distinct original endpoints. <collisions-with-four-distinct-original-endpoints.>
  Write the two edges as $u v$ and $x y$, with four different vertices. For them to become the same nonloop edge, the two fibers must be either ${ u \, x } \, { v \, y }$ or ${ u \, y } \, { v \, x }$. All four vertices therefore belong to folding sets: a singleton fiber cannot contain two distinct original endpoints. If the two paired fibers lie in one $X_i$, then both original edges are internal to $X_i$. Writing $e_i = lr(|E \( J \[ X_i \] \)|)$, there are at most $binom(e_i, 2) lt.eq e_i^2 \/ 2$ possible vertex-disjoint edge pairs, and the two possible pairing patterns give probability at most $2 \/ \( \( m_i - 1 \) \( m_i - 3 \) \)$. As $e_i lt.eq a m_i \/ 2$, their total contribution is at most
  #[#set math.equation(numbering: n => "(6.5)")
   $ sum_i frac(a^2 m_i^2, 4 \( m_i - 1 \) \( m_i - 3 \)) lt.eq 16 / 35 sum_i a^2 . $ <eq:fold-internal-errors>]
  For the last inequality use $m_i \/ \( m_i - 1 \) lt.eq 8 \/ 7$ and $m_i \/ \( m_i - 3 \) lt.eq 8 \/ 5$.
  If the two paired fibers instead lie in different sets $X_i \, X_j$, then both original edges run between those sets. There is just one possible pairing pattern, since each pair must remain within its own set. Put $e_(i j) = e_J \( X_i \, X_j \)$; there are at most $binom(e_(i j), 2) lt.eq e_(i j)^2 \/ 2$ vertex-disjoint edge pairs. Independence between the two pairings and (6.3) bound this contribution by
  #[#set math.equation(numbering: n => "(6.6)")
   $ sum_(i < j) frac(e_(i j)^2, 2 \( m_i - 1 \) \( m_j - 1 \)) & lt.eq 32 / 49 sum_(i < j) frac(e_(i j)^2, m_i m_j) lt.eq 16 / 49 sum_i a^2 . $ <eq:fold-cross-errors>]
  Indeed, for each fixed $i$,
  $ sum_(j eq.not i) frac(e_(i j)^2, m_i m_j) lt.eq a / m_i sum_(j eq.not i) e_(i j) lt.eq a^2 : $
  the first inequality uses $e_(i j) lt.eq a m_j$, and the second follows from the total degree bound on $X_i$. Summing over $i$ counts each unordered pair of sets twice. The preceding cases exhaust distinct original edges, which either have one common endpoint or have four distinct endpoints in a simple graph.
  Equations (6.4)–(6.6) give
  $ bb(E) Z lt.eq (4 / 7 + 16 / 35 + 16 / 49) sum_i a^2 = 332 / 245 sum_i a^2 lt.eq 332 / 245 sum_i m_i < 2 sum_i m_i $
  when $t > 0$. Some choice of pairings has no greater error count than its expectation. For this choice delete each original loop edge and, in each nonloop parallel class of size $s$, delete all but one original edge. The latter requires $s - 1 lt.eq binom(s, 2)$ deletions, so the number of deleted edges is at most $Z$. The remaining graph is simple after identification, and the retained representative in each class is unique. Deletions do not remove vertices, giving (6.2). If $t = 0$, use the identity map and delete no edges. ◻
]

The next lemma resolves all batches within a single earlier box. Its hypotheses keep the degree bound global over those batches. Different batches may contain the same vertex and may pair that vertex differently; their original edge sets are disjoint.

#thm([Lemma 6.2.])[
  (Batch resolution).  #emph[For every sufficiently large real $D$, set 
$ a = D^0.01 \, #h(2em) L_0 = D^0.03 \, #h(2em) B_0 = D^0.30 \, #h(2em) sigma = D^0.90 . $

 Let $Y$ be a finite vertex set. Let $cal(W)$ be a finite indexed family of subsets $W subset.eq Y$, with $lr(||) W lt.eq B_0$, and let $J_W$ be a simple graph on $W$ for each index. Suppose these graphs have pairwise disjoint edge sets, and let $F = F \( Y \)$ be their union, taken on $Y$.]
  #emph[Let $cal(R)$ be a family of simple graphs on pairwise disjoint vertex subsets of $Y$. Suppose that each $R in cal(R)$ has order $sigma lt.eq r_R lt.eq D^1.02$, that $E \( R \) ∩ E \( F \) = diameter$, and that its edges are partitioned into two spanning graphs $P_R \, T_R$, both of cut expansion at least $sigma \/ 4$. Call $P_R$ the router.]
  #emph[For some pairs $\( W \, R \)$ let an active set $X_(W \, R) subset.eq W ∩ V \( R \)$ be specified, satisfying 
#[#set math.equation(numbering: n => "(6.7)")
 $ lr(|X_(W \, R)|) gt.eq L_0 \, #h(2em) d_F \( x \) lt.eq a quad \( x in X_(W \, R) \) . $ <eq:batch-active-hypotheses>]

 Sums over $\( W \, R \)$ below include only active sets, and write $Sigma_Y = sum_(W \, R) lr(|X_(W \, R)|)$.]
  #emph[There are finite simple quotient graphs $Q_W$, with all quotient vertices retained, whose orders satisfy 
#[#set math.equation(numbering: n => "(6.8)")
 $ q_W & = lr(||) W - sum_(R : thin \( W \, R \) upright(" active")) ⌊lr(|X_(W \, R)|) \/ 2⌋\
 & lt.eq lr(||) W - 1 / 3 sum_(R : thin \( W \, R \) upright(" active")) lr(|X_(W \, R)|) lt.eq B_0 \,\
sum_W q_W & lt.eq sum_W lr(||) W - 1 / 3 Sigma_Y . $ <eq:batch-quotient-order>]

 For every choice of cycle-and-edge partitions of these $Q_W$, having $t_W$ parts, there are sets $U_R subset.eq E \( P_R \)$ and a cycle-and-edge partition of 
$ E \( F \) dot(union) dot(union.big)_(R in cal(R)) U_R $

 with at most 
#[#set math.equation(numbering: n => "(6.9)")
 $ sum_W t_W + 8 Sigma_Y $ <eq:batch-parts>]

 parts. The graphs $R' = R - U_R$, kept on $V \( R \)$, contain the untouched spanning graphs $T_R$, so each still has a spanning subgraph of cut expansion at least $sigma \/ 4$. The completed parts and these remaining graphs together partition $E \( F \) dot(union) dot(union.big)_(R in cal(R)) E \( R \)$. All thresholds in this lemma are absolute.]
] <lem:batch-resolution>

#proof[
  We first choose the quotient graphs and prepare some paths to be closed. No router edges are used until all quotient partitions have also been specified.
  ===== 6.3 Removing edges to heavy neighbors. <removing-edges-to-heavy-neighbors.>
  The path trimming below is the elementary operation used by Conlon, Fox and Sudakov #cite(label("CFS2014")) Lemma 6.3: decompose a bipartite graph into paths and remove terminal edges so that the remaining endpoints lie on one prescribed side. We keep the endpoint loads under the single degree bound on the union of all batches. Fix a batch $W$. Its active sets are pairwise disjoint because the pieces $R$ have disjoint vertex sets. For an active set $X = X_(W \, R)$ put
  $ H_X = { v in W : lr(|N_(J_W) \( v \) ∩ X|) > a } \, #h(2em) E_X = E_(J_W) \( X \, H_X \) . $
  Every vertex in any active set has degree at most $a$ in $J_W$, since $J_W subset.eq F$. Thus $H_X$ is disjoint from every active set in this batch, including $X$. If $H_X$ is nonempty, counting edges gives
  $ a lr(|H_X|) < lr(|E_X|) lt.eq sum_(x in X) d_(J_W) \( x \) lt.eq a lr(||) X \; $
  in all cases $lr(|H_X|) lt.eq lr(||) X$. The sets $E_X$ for different active $X$ are disjoint. In fact each of their edges has one endpoint in its specified active set and its other endpoint outside every active set, so it cannot belong to the set specified by a different active set.
  Apply 4 to the bipartite graph with parts $X \, H_X$ and edge set $E_X$. It gives at most $lr(||) X + lr(|H_X|) lt.eq 2 lr(||) X$ positive-length simple paths, since their total number of endpoint occurrences is at most $2 \( lr(||) X + lr(|H_X|) \)$. From each path delete its terminal edge at each endpoint belonging to $H_X$, counting those deleted edges singly. At most two distinct edges are deleted. A one-edge path has only one endpoint in $H_X$, and if both endpoints lie in $H_X$, the path has at least two edges, with distinct terminal edges.
  Ignore any remnant with no edges. Every other remnant is a simple path with both endpoints in $X$: this follows directly by removing the $H_X$ endpoints from the alternating bipartite path. Its length is even and at least two, so its endpoints are distinct. For each such remnant $L$ record a demand between its endpoints in $P_R$, forbid internally the set $V \( L \) ∩ V \( R \)$, and give this demand its own team. Once this demand is routed, its remnant will form one cycle. Each original path therefore accounts for at most two single edges and one cycle, for a total of at most $6 lr(||) X$ parts. We do not require an endpoint-load-two bound for the trimmed paths; their endpoint loads will be bounded using their incident original edges in the global load argument below.
  ===== 6.4 Choosing the quotients. <choosing-the-quotients.>
  Remove all the sets $E_X$ from $J_W$ and call the resulting graph $J_W^0$, retaining the vertex set $W$. Each active vertex still has degree at most $a$. For each active $X$ and every $v in W$, either $v$ was in $H_X$, in which case all its edges into $X$ were removed, or it originally had at most $a$ neighbors in $X$. Hence $lr(|N_(J_W^0) \( v \) ∩ X|) lt.eq a$ in both cases. For large $D$ we have $L_0 gt.eq max { 8 \, a^2 }$. Apply 13 to $J_W^0$ and its active sets. Count its error edges singly in their original form and call the simple resulting quotient $Q_W$. Denote its quotient map by $pi_W$; each edge $e$ of $Q_W$ has a unique retained original representative $hat(e)$. The number of these single-edge parts is at most $2 sum_R lr(|X_(W \, R)|)$.
  Every identified pair removes exactly one vertex. Since $⌊m \/ 2⌋ gt.eq m \/ 3$ for every integer $m gt.eq 2$, the exact order formula from 13 yields (6.8), and summing yields (6.8). This construction of all $Q_W$ is independent of their subsequent partitions.
  ===== 6.5 The switch demands of a quotient cycle. <the-switch-demands-of-a-quotient-cycle.>
  Now fix arbitrary cycle-and-edge partitions of all the $Q_W$. Restore each single-edge part as its unique original representative. For a cycle $C$ in $Q_W$, list its distinct vertices in cyclic order as $z_1 \, dots.h \, z_s$, where $s gt.eq 3$, and write $e_j = z_j z_(j + 1)$, with indices interpreted cyclically. At $z_j$ let $u_j$ be the endpoint of $hat(e)_(j - 1)$ in the fiber $pi_W^(- 1) \( z_j \)$, and let $v_j$ be the endpoint of $hat(e)_j$ in that fiber. If $u_j = v_j$, the two edges join without any added path. Otherwise that fiber is a folded pair ${ u_j \, v_j }$ in one active set $X_(W \, R)$; record a demand from $u_j$ to $v_j$ in $P_R$.
  For every demand from this cycle forbid internally
  $ Z_C ∩ V \( R \) \, #h(2em) Z_C = union.big_(j = 1)^s V \( hat(e)_j \) . $
  Thus every original endpoint on the entire cycle, including the endpoints of all its other switches, is forbidden internally. The demands belonging to this cycle and this router form one team. Teams for different cycles, including cycles from different batch indices, are distinct. The single-demand teams recorded during the heavy-neighbor work are also distinct from these teams. Figure 1 shows the switch construction. The next two steps verify that all these requested paths can be chosen simultaneously and that the resulting closed walks are simple.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 1.584), (1.144, -0.176), stroke: (thickness: 0.9pt, miter-limit: 10))
  line((1.144, -0.176), (-1.144, -0.176), stroke: (thickness: 0.9pt, miter-limit: 10))
  line((-1.144, -0.176), (0, 1.584), stroke: (thickness: 0.9pt, miter-limit: 10))
  content((0.572, 0.704), [$e_1$], anchor: "west", padding: 0.1176cm)
  content((0, -0.176), [$e_2$], anchor: "north", padding: 0.1176cm)
  content((-0.572, 0.704), [$e_3$], anchor: "east", padding: 0.1176cm)
  circle((0, 1.584), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((0, 1.619), [$z_1$], anchor: "south")
  circle((1.144, -0.176), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((1.179, -0.176), [$z_2$], anchor: "west")
  circle((-1.144, -0.176), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((-1.179, -0.176), [$z_3$], anchor: "east")
  content((0, -0.968), [a quotient cycle])
  line((1.584, 0.704), (2.816, 0.704), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((2.2, 0.704), [lift], anchor: "south", padding: 0.1176cm)
  line((4.928, 1.584), (5.72, 0.352), stroke: (thickness: 0.9pt, miter-limit: 10))
  content((5.324, 0.968), [$hat(e)_1$], anchor: "west", padding: 0.1176cm)
  line((5.192, -0.264), (3.608, -0.264), stroke: (thickness: 0.9pt, miter-limit: 10))
  content((4.4, -0.264), [$hat(e)_2$], anchor: "north", padding: 0.1176cm)
  line((3.08, 0.352), (3.872, 1.584), stroke: (thickness: 0.9pt, miter-limit: 10))
  content((3.476, 0.968), [$hat(e)_3$], anchor: "east", padding: 0.1176cm)
  line((3.872, 1.584), (4.4, 2.024), (4.928, 1.584), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10))
  line((5.72, 0.352), (5.72, -0.22), (5.192, -0.264), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10))
  line((3.608, -0.264), (3.08, -0.22), (3.08, 0.352), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10))
  circle((4.4, 2.024), radius: 0.07982, fill: rgb("#0000a6"), stroke: none)
  circle((5.72, -0.22), radius: 0.07982, fill: rgb("#0000a6"), stroke: none)
  circle((3.08, -0.22), radius: 0.07982, fill: rgb("#0000a6"), stroke: none)
  circle((3.872, 1.584), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((3.847, 1.609), [$u_1$], anchor: "south-east")
  circle((4.928, 1.584), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((4.953, 1.609), [$v_1$], anchor: "south-west")
  circle((5.72, 0.352), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((5.755, 0.352), [$u_2$], anchor: "west")
  circle((5.192, -0.264), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((5.217, -0.2889), [$v_2$], anchor: "north-west")
  circle((3.608, -0.264), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((3.583, -0.2889), [$u_3$], anchor: "north-east")
  circle((3.08, 0.352), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((3.045, 0.352), [$v_3$], anchor: "east")
  content((4.4, -0.968), [original edges and switch paths])
})],
    caption: [Figure 1: Lifting a quotient cycle, schematically. The fiber at $z_j$ contains $u_j \, v_j$; when they differ, a reserved path (blue) joins them. The black edges are the unique original representatives of the quotient edges. Every path interior avoids all black-edge endpoints, and the interiors are pairwise disjoint for this cycle. Each blue path is drawn with one internal vertex only for illustration; its actual length may differ. A visit with $u_j = v_j$ requires no path. ],
  ) <fig:cycle-lifting>
  ===== 6.6 The load bound over all batches. <the-load-bound-over-all-batches.>
  Fix one piece $R$. Gather every demand for $P_R$ from all batches and both constructions. Each endpoint is in an active set, hence has degree at most $a$ in the one graph $F \( Y \)$. To bound its total demand load, associate each occurrence of an endpoint $x$ with an incident edge of $F \( Y \)$ as follows:
  - For the demand closing a remnant $L$, use the terminal edge of $L$ at $x$.
  - At a switch $u_j eq.not v_j$, associate the occurrence of $u_j$ with $hat(e)_(j - 1)$ and that of $v_j$ with $hat(e)_j$.
  At a fixed vertex these associated incident edges are distinct. For the first construction this follows from the edge-disjoint path partition and from the disjointness of the designated edge sets. For the second construction a quotient edge belongs to exactly one part, has exactly one original representative, and its incidence at a given original vertex can be used only at the unique visit to its quotient fiber in that cycle. The cycles are simple, and a switch uses different original vertices for its two incidences. The two constructions use disjoint edges because all designated edges were removed before folding. Finally, edges from different batches are distinct by hypothesis, regardless of overlap of their vertex sets or differences in their pairings. This proves the injection into incident edges of $F \( Y \)$ and hence
  #[#set math.equation(numbering: n => "(6.10)")
   $ upright("number of demand-end occurrences at ") x lt.eq d_(F \( Y \)) \( x \) lt.eq a . $ <eq:batch-global-load>]
  Vertices that are never endpoints have load zero.
  ===== 6.7 Supplying all the connections. <supplying-all-the-connections.>
  A team from a cycle $C$ has at most $s lt.eq q_W lt.eq B_0$ demands, and $lr(|Z_C|) lt.eq 2 s lt.eq 2 B_0$. A heavy-neighbor remnant has at most $lr(||) W lt.eq B_0$ vertices; its team has size one. Thus in 7 we may use
  $ r = r_R \, #h(2em) h = sigma \/ 4 \, #h(2em) k = a \, #h(2em) b = B_0 \, #h(2em) z = 2 B_0 . $
  With that lemma’s definitions of $g$ and $ell$, the range $sigma lt.eq r_R lt.eq D^1.02$ gives, uniformly in $R$,
  $ ell = O \( D^0.12 log^2 D \) \, #h(2em) ell^2 \( a + B_0 \) + 2 B_0 = O \( D^0.54 log^4 D \) = o \( D^0.90 \) . $
  For all sufficiently large $D$ this is at most $sigma \/ 256 = h \/ 64$, which is exactly enough for (3.2). Apply the routing lemma once to this full collection in $P_R$; if the collection is empty, use no edges. The paths supplied are pairwise edge-disjoint over all teams and all batches for this $R$, and their internal vertex sets are pairwise disjoint within each team. Do this for every piece $R$. The constants are absolute, and do not depend on the number of batches or demands.
  ===== 6.8 Simplicity of the completed cycles. <simplicity-of-the-completed-cycles.>
  For a heavy-neighbor remnant $L$, its supplied path is simple and has distinct endpoints equal to those of $L$. Its internal vertices avoid $V \( L \)$: the forbidden set contains $V \( L \) ∩ V \( R \)$, and all supplied path vertices lie in $V \( R \)$. The union is therefore a simple cycle. It has at least two remnant edges and at least one supplying edge, so its length is at least three.
  For a quotient cycle $C$, the fibers of $z_1 \, dots.h \, z_s$ are mutually disjoint. At a visit with $u_j = v_j$, its original representative edges use one vertex. At a switch, they use the two different vertices of that fiber and the supplied simple path joins them. Thus before adding path interiors, the vertices at different visits are distinct. Every supplying path interior avoids $Z_C$, which includes all these original vertices. Two supplying paths for this cycle in the same router have disjoint interiors by their common team; paths in different routers lie in the disjoint vertex sets of different pieces $R$. Consequently interiors of any two switches are disjoint, and none contains an endpoint of another switch or any other original vertex used by the cycle. Traversing the representatives and these connections in cyclic order therefore visits no vertex twice, except the start when closing the cycle.
  An unused twin deserves explicit mention. If a visited fiber is a pair but $u_j = v_j$, its other vertex need not belong to $Z_C$ and may occur inside a supplying path. It is absent from all original representative edges of this cycle, since those edges use distinct fibers. If it is used internally, no second supplying path of this cycle can use it: the team condition excludes this in its router, and the other routers have disjoint vertex sets. This therefore creates no repeated vertex. The same reasoning covers vertices in fibers not visited by the cycle.
  The resulting cycle contains its $s$ distinct original representative edges and possibly additional edges, so its length is at least $s gt.eq 3$. A quotient cycle with no switches is already a simple cycle of original edges. Each quotient part thus yields exactly one permitted part.
  ===== 6.9 Edge accounting and cost. <edge-accounting-and-cost.>
  For each batch, its original edges have exactly four destinations:
  + designated edges trimmed from paths are single-edge parts;
  + designated edges in positive-length remnants occur in their closed cycles;
  + folding error edges are single-edge parts, taken before identification;
  + retained edges have unique representatives in $Q_W$ and occur once in the restored quotient parts.
  These classes partition $E \( J_W \)$. Empty remnants leave no unaccounted edge, and the deletion rule for parallel classes retains exactly one representative for each quotient edge. Since the $J_W$ have disjoint edge sets, every edge of $F$ occurs once in this list over all batches.
  Let $U_R$ be the set of edges used by all supplying paths in $P_R$. Each is used once by the routing lemma. These edges are disjoint from $E \( F \)$ by hypothesis, and different routers have disjoint edge sets. Thus all completed parts form an edge partition of the edge set in the statement. The heavy-neighbor work contributes at most $6 Sigma_Y$ parts, folding errors at most $2 Sigma_Y$, and the quotient partitions contribute exactly $sum_W t_W$. Adding a supplying path changes no part count. This proves (6.9).
  No edge of $T_R$ was used: $U_R subset.eq E \( P_R \)$ and $E \( P_R \)$ is disjoint from $E \( T_R \)$. Therefore $R' = R - U_R$ contains the entire spanning graph $T_R$ on its original vertex set. The edges of $R'$ are precisely the edges of this assigned piece not already used in a completed part. This proves both the remaining expansion assertion and the final edge partition. ◻
]

== 7 The induction <sec:induction>

The preceding lemmas will be applied on a succession of scales. We first select a prefix whose total piece order is controlled by one of its layers. A fixed window beyond that layer makes the surviving edges suitable for batching and folding.

Fix the absolute parameters

#[#set math.equation(numbering: n => "(7.1)")
 $ theta = 0.95 \, #h(2em) K = 200 \, #h(2em) P_0 = 4 \( K + 1 \) \, #h(2em) eta = frac(1, 100 P_0) . $ <eq:induction-parameters>]

In particular,

#[#set math.equation(numbering: n => "(7.2)")
 $ 1.02 theta^K < 0.001 \, #h(2em) theta^(K + 1) < 0.001 \, $ <eq:scale-window>]

since $theta^K lt.eq e^(- 10)$.

#thm([Lemma 7.1.])[
  (Selection of a prefix).  #emph[Let $\( S_j \)_(j gt.eq 0)$ be a nonnegative, finitely supported sequence which is not identically zero. There is an index $i$ with $S_i > 0$ such that 
#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(j = 0)^(i + K) S_j lt.eq P_0 S_i . $ <eq:prefix-charge>]

]
] <lem:prefix-choice>

#proof[
  Start at the first positive term and maintain $sum_(j = 0)^i S_j lt.eq 2 \( K + 1 \) S_i$. If (7.3) fails, the sum of the next $K$ terms is greater than $2 \( K + 1 \) S_i$. Their largest value $M$ is therefore greater than $2 S_i$. Move to an index $i'$ in that window with $S_(i') = M$. Then
  $ sum_(j = 0)^(i') S_j lt.eq 2 \( K + 1 \) S_i + K M < \( 2 K + 1 \) M lt.eq 2 \( K + 1 \) S_(i') . $
  The invariant persists. Each move increases the index and lands at a positive term. Finite support therefore forces the procedure to stop, at which point (7.3) holds. ◻
]

For real $x gt.eq 1$, define the nondecreasing function

#[#set math.equation(numbering: n => "(7.4)")
 $ phi.alt \( 1 \) = 1 / 2 \, #h(2em) phi.alt \( x \) = max {1 / 2 \, 1 - 1 / sqrt(log x)} quad \( x > 1 \) . $ <eq:induction-potential>]

The small improvement over a linear bound will absorb the overlap introduced when boxes are split.

#thm([Proposition 7.2.])[
  #emph[There is an absolute constant $C$ such that every finite simple graph on $n gt.eq 1$ vertices has an edge partition into at most $C phi.alt \( n \) n$ simple cycles and single edges.]
] <prop:induction-bound>

#proof[
  We use strong induction on $n$. The lower scale cutoff $D_(*)$ is an absolute constant, chosen to satisfy the uniform requirements below. Only after fixing it will we choose $C$. All auxiliary constants introduced before that final choice are independent of $C$ and remain valid if the cutoff is increased.
  Edgeless graphs have the empty partition. For $1 lt.eq n < D_(*)$, using every edge singly proves the assertion when $C gt.eq D_(*)$, since $phi.alt \( n \) gt.eq 1 \/ 2$. Now let $n gt.eq D_(*)$, assume the assertion for every smaller positive order, and put
  $ D_j = n^(theta^j) \, #h(2em) m = min { j gt.eq 0 : D_j < D_(*) } . $
  Take $D_(*) > 2$. Then $m$ is finite and positive, and the scales $D_0 \, dots.h \, D_(m - 1)$ all satisfy the cutoff.
  ===== 7.1 Prospective layers. <prospective-layers.>
  Starting with the given graph $G$, perform both operations of 11 at each successive scale $D_0 \, dots.h \, D_(m - 1)$. The inputs at stage $j$ have average degree at most $D_j$: this holds initially because $overline(d) \( G \) lt.eq n - 1 < D_0$, and the residual graph in each new box has average degree at most $D_j^0.95 = D_(j + 1)$.
  Let $cal(Y)_j$ be the indexed family of level-$j$ boxes and $cal(R)_j$ the indexed family of pieces removed inside them. The residual graph passed to the next stage retains the entire vertex set of its box, including isolated vertices. Every box has a unique indexed parent, and its vertex set is contained in its parent’s vertex set. Descendants of any box cover that box’s vertex set. Distinct indices are retained even when their vertex sets overlap or coincide.
  These operations define prospective layers: we will subsequently keep only a prefix of them. At the end of every prefix, the long cycles removed so far, the pieces removed so far, and the remaining input graphs partition $E \( G \)$. In particular, discarding the prospective operations beyond a chosen prefix means retaining their input graphs, with all their assigned edges, at that prefix’s boundary.
  Write
  $ N_(- 1) = n \, #h(2em) N_j = sum_(Y in cal(Y)_j) \| Y \| \, #h(2em) S_j = sum_(R in cal(R)_j) \| V \( R \) \| \, $
  and set $S_j = 0$ for $j gt.eq m$. Increase the absolute constant $C_0$ in 11 if necessary so that $C_0 gt.eq 1$, and put $C_2 = 40 C_0$. For $0 lt.eq j < m$,
  $ sum_(l = 0)^j frac(1, log D_l) = frac(1, log D_j) sum_(t = 0)^j theta^t lt.eq frac(20, log D_j) . $
  Provided $log D_(*) gt.eq C_2$, the product of the order increases is consequently bounded by
  #[#set math.equation(numbering: n => "(7.5)")
   $ n lt.eq N_j lt.eq n product_(l = 0)^j (1 + frac(C_0, log D_l)) lt.eq n (1 + frac(C_2, log D_j)) lt.eq 2 n . $ <eq:layer-order>]
  Here we used $1 + x lt.eq e^x$ and $e^x lt.eq 1 + 2 x$ for $0 lt.eq x lt.eq 1 \/ 2$. The lower bound follows from preservation of the vertex cover at every split. The same product calculation, using the relevant subproduct, shows that the orders of all level-$j$ descendants of a box of order $y$ sum to at most $\( 1 + C_2 \/ log D_j \) y$. Their union still covers its full vertex set.
  We also require $D^(- 0.01) lt.eq 1 \/ log D$ for every $D gt.eq D_(*)$. If $cal(L)_j$ is the family of long cycles removed through level $j$, then
  #[#set math.equation(numbering: n => "(7.6)")
   $ \| cal(L)_j \| lt.eq sum_(l = 0)^j frac(N_(l - 1), 2 D_l^0.01) lt.eq n sum_(l = 0)^j frac(1, log D_l) lt.eq frac(20 n, log D_j) . $ <eq:prefix-cycle-cost>]
  These bounds have no dependence on the number of layers. Piece disjointness within each box gives $S_j lt.eq N_j lt.eq 2 n$.
  ===== 7.2 Terminal cases. <terminal-cases.>
  If every $S_j$ vanishes, keep all prospective stages. Use the long cycles and take the remaining edges singly. The remaining graphs, on the level-$\( m - 1 \)$ boxes, have average degree at most $D_m < D_(*)$, so their total number of edges is at most $N_(m - 1) D_m \/ 2 < D_(*) n$. By (7.6), the total cost is at most $\( 20 + D_(*) \) n$.
  Otherwise choose $i$ by 15. If $i + K gt.eq m - 1$, again keep every stage. Retain all long cycles as completed parts and take every edge of the final boundary graphs singly, at cost at most $\( 20 + D_(*) \) n$ as above. The zero extension of $\( S_j \)$ ensures that $sum_(j = 0)^(m - 1) S_j lt.eq P_0 S_i$. Apply 10 to each piece at its own scale, with $c = 1$ and the fixed $eta$. This completes at most $9 P_0 S_i$ parts and leaves graphs of total order at most
  $ eta P_0 S_i = S_i / 100 lt.eq n / 50 < n / 4 . $
  Each individual residual graph has order at most $eta r < n$, where $r$ is the order of its parent piece: the piece’s vertex set is a subset of $V \( G \)$, so $r lt.eq n$, and $eta < 1$. Apply the induction hypothesis to each nonempty residual graph; their total additional cost is at most $C n \/ 4$, using $phi.alt lt.eq 1$.
  Both terminal cases are therefore covered by the bound
  $ T \( D_(*) \) n + frac(C n, 4) \, #h(2em) T \( D_(*) \) = 20 + D_(*) + 18 P_0 . $
  For $C gt.eq 4 T \( D_(*) \)$, this is at most $C n \/ 2 lt.eq C phi.alt \( n \) n$. This choice also covers the base cases.
  ===== 7.3 A prefix with a scale gap. <a-prefix-with-a-scale-gap.>
  It remains to consider $i + K < m - 1$. Keep the stages through $t = i + K$, and put
  #[#set math.equation(numbering: n => "(7.7)")
   $ D = D_i \, #h(2em) w = log D \, #h(2em) H = C_2 theta^(- K) \,\
B_0 = D^0.30 \, #h(2em) a = D^0.01 \, #h(2em) L_0 = D^0.03 \, #h(2em) sigma = D^0.90 . $ <eq:batch-parameters>]
  Since $log D_t = theta^K w$, (7.5) and (7.6) imply
  #[#set math.equation(numbering: n => "(7.8)")
   $ N_t lt.eq \( 1 + H \/ w \) n \, #h(2em) \| cal(L)_t \| lt.eq H n \/ w . $ <eq:gap-global-bounds>]
  The latter uses $C_2 gt.eq 40 > 20$.
  Fix a level-$i$ box $Y$, of order $y lt.eq D^1.02$. Let $T_Y$ be the sum of the orders of its level-$t$ descendants. Each such descendant carries its remaining graph after stage $t$; it has order at most $D^(1.02 theta^K) < D^0.001$ and that graph has average degree at most $D^(theta^(K + 1))$. Moreover,
  #[#set math.equation(numbering: n => "(7.9)")
   $ y lt.eq T_Y lt.eq \( 1 + H \/ w \) y lt.eq 2 y . $ <eq:descendant-order>]
  For the last inequality, note that $H \/ w = C_2 \/ log D_t lt.eq 1$.
  Let $F \( Y \)$ be the graph on $Y$ whose edges are exactly the remaining edges in these descendants. Their assigned edge sets are disjoint, so $F \( Y \)$ is simple and
  #[#set math.equation(numbering: n => "(7.10)")
   $ 2 \| E \( F \( Y \) \) \| lt.eq T_Y D^(theta^(K + 1)) lt.eq 2 y D^(theta^(K + 1)) . $ <eq:descendant-degree>]
  Each descendant has fewer than $L_0$ vertices, so we first group descendants to make larger folding sets possible. The number of batches will bound the loss when an intersection of a batch with a selected piece contains fewer than $L_0$ vertices of degree at most $a$ in $F \( Y \)$. The batch order cap $B_0$ keeps quotient cycles within the routing team bound.
  Partition the indexed descendants into batches whose sums of orders are at most $B_0$. This can be done with at most $1 + 4 y \/ B_0$ batches: require the cutoff to ensure $D^0.001 lt.eq B_0 \/ 2$, fill a batch until the next descendant would exceed $B_0$, and then start a new one. Every batch except possibly the last has order sum greater than $B_0 \/ 2$, so their number is at most $1 + 2 T_Y \/ B_0$.
  For each batch let $W$ be the union of its vertex sets, and let $J_W$ contain exactly its remaining assigned edges. The batch index is retained in this notation. Denote the family by $cal(W) \( Y \)$. Thus the $J_W$ partition $E \( F \( Y \) \)$, the sets $W$ cover $Y$, and
  #[#set math.equation(numbering: n => "(7.11)")
   $ \| W \| lt.eq B_0 \, #h(2em) sum_(W in cal(W) \( Y \)) \| W \| lt.eq T_Y \, #h(2em) sum_(Y in cal(Y)_i) sum_(W in cal(W) \( Y \)) \| W \| lt.eq N_t . $ <eq:batch-orders>]
  The order sums used in forming batches include all descendant multiplicities; passing to a union within a batch can only decrease them.
  Since each level-$t$ box has a unique indexed level-$i$ ancestor, the batch edge sets over all $Y$ partition the boundary remainder. Thus, at the boundary of the committed prefix, the assigned edge sets give the disjoint union
  #[#set math.equation(numbering: n => "(7.12)")
   $ E \( G \) = dot(union.big)_(L in cal(L)_t) E \( L \) #h(0.27778em) dot(union) #h(0.27778em) dot(union.big)_(j = 0)^t med dot(union.big)_(R in cal(R)_j) E \( R \) #h(0.27778em) dot(union) #h(0.27778em) dot(union.big)_(Y in cal(Y)_i) med dot(union.big)_(W in cal(W) \( Y \)) E \( J_W \) . $ <eq:global-edge-ledger>]
  ===== 7.4 Active sets and multiplicities. <active-sets-and-multiplicities.>
  Call a vertex of $Y$ good if its degree in $F \( Y \)$ is at most $a$. By (7.10) and (7.2), the number of other vertices is at most
  $ 2 y D^(theta^(K + 1) - 0.01) lt.eq 2 y D^(- 0.009) lt.eq y \/ w \, $
  where the final inequality is another uniform large-scale requirement. For each $W in cal(W) \( Y \)$ and each level-$i$ piece $R$ belonging to $Y$, consider all good vertices of $W ∩ V \( R \)$. If their number is at least $L_0$, retain this set as $X_(W \, R)$ and call it active; otherwise skip it. Active sets in a fixed batch are disjoint, because the pieces in $Y$ have disjoint vertex sets.
  There are at most $y \/ sigma$ such pieces. Consequently the total size of all skipped sets in $Y$, counting occurrences in different batches separately, is at most
  #[#set math.equation(numbering: n => "(7.13)")
   $ L_0 \( 1 + 4 y \/ B_0 \) y \/ sigma & lt.eq y #scale(x: 120%, y: 120%)[\(] D^(- 0.87) + 4 D^(- 0.15) #scale(x: 120%, y: 120%)[\)] lt.eq y \/ w . $ <eq:skipped-occurrences>]
  Here the exponent $- 0.15$ uses $y lt.eq D^1.02$, and the last inequality is imposed for all scales above the cutoff.
  Let $s \( Y \)$ be the sum of the orders of the level-$i$ pieces in $Y$, and define
  $ Sigma_Y = sum_(W in cal(W) \( Y \) \, med R upright(" in ") Y\
X_(W \, R) upright(" active")) \| X_(W \, R) \| \, #h(2em) Sigma = sum_(Y in cal(Y)_i) Sigma_Y . $
  Every good piece vertex occurs in at least one batch, since the batches cover $Y$. Choose one such occurrence per vertex. At most $y \/ w$ piece vertices are not good, and at most $y \/ w$ of the chosen occurrences can lie in skipped sets by (7.13). Hence $Sigma_Y gt.eq s \( Y \) - 2 y \/ w$.
  For the upper bound, let $u_Y \( v \) gt.eq 1$ be the number of batches in $Y$ containing $v$. Then
  $ sum_(v in Y) #scale(x: 120%, y: 120%)[\(] u_Y \( v \) - 1 #scale(x: 120%, y: 120%)[\)] = sum_(W in cal(W) \( Y \)) \| W \| - y . $
  Since the pieces in $Y$ are vertex-disjoint, their excess occurrences are bounded by this full excess. Thus $Sigma_Y lt.eq s \( Y \) + sum_W \| W \| - y$. Summing the two bounds, using $N_i lt.eq 2 n$, $N_i gt.eq n$, and (7.8)–(7.11), gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ S_i - frac(4 n, w) lt.eq Sigma lt.eq S_i + N_t - N_i lt.eq S_i + frac(H n, w) . $ <eq:active-order>]
  This counts a nongood vertex only once per indexed box in the lower bound; no bound on its number of batch occurrences is needed. Overlaps between different boxes are already included in both $S_i$ and $N_i$.
  ===== 7.5 Resolving the batches and the pieces. <resolving-the-batches-and-the-pieces.>
  In every level-$i$ piece $R$, apply 8 with two classes to partition its assigned edges into spanning graphs $P_R$ and $T_R$, each with cut expansion at least $sigma \/ 4$. Reserve $P_R$ as a router and leave $T_R$ untouched during the batch work.
  All hypotheses of 14 now hold in each $Y$. The $J_W$ have order at most $B_0$ and disjoint assigned edges; their union is $F \( Y \)$. The pieces have orders between $sigma$ and $D^1.02$, disjoint vertex sets within $Y$, and edges disjoint from $F \( Y \)$. Every vertex of an active $X_(W \, R)$ has degree at most $a$ in the whole $F \( Y \)$, and its active set has order at least $L_0$. In particular the degree bound is shared across all batches, as required by that lemma.
  The lemma produces simple quotient graphs $Q_W$, with orders
  #[#set math.equation(numbering: n => "(7.15)")
   $ q_W = \| W \| - sum_(R : X_(W \, R) upright(" active")) ⌊\| X_(W \, R) \| \/ 2⌋ lt.eq \| W \| - 1 / 3 sum_(R : X_(W \, R) upright(" active")) \| X_(W \, R) \| . $ <eq:individual-quotient-order>]
  Every batch has positive order and pair identifications leave at least one vertex, so $1 lt.eq q_W lt.eq B_0$. Also $B_0 = D^0.30 lt.eq n^0.30 < n$. Apply the induction hypothesis to these quotients, retaining isolated quotient vertices in their order counts. The batch lemma lifts all the resulting quotient parts simultaneously. In each $Y$, the additional number of completed parts is at most $8 Sigma_Y$, and the remaining graph on every $R$ still contains $T_R$. In particular, lifting a quotient cycle produces one simple cycle and has no additional part charge.
  Apply 10, with the fixed $eta$, to the remaining graph of every level-$i$ piece using $c = 1 \/ 4$. Apply it to every other piece of the committed prefix at its own scale using $c = 1$. The total number of parts supplied by these applications is at most $9 P_0 S_i$. If $cal(H)$ is their family of residual graphs, then
  #[#set math.equation(numbering: n => "(7.16)")
   $ sum_(H' in cal(H)) \| V \( H' \) \| lt.eq eta sum_(j = 0)^t S_j lt.eq eta P_0 S_i . $ <eq:piece-residual-order>]
  Every nonempty member has order at most $eta r < n$, for the same reason as in the terminal case. Induction applies to all of them.
  Within each $Y$, 14 resolves exactly the batch category in (7.12) together with the router edges it consumes. Every consumed router edge comes from exactly one level-$i$ piece and is used once. The piece lemmas are applied only after those edges have been removed, and partition all remaining piece edges into completed parts and the members of $cal(H)$. Distinct indexed boxes have disjoint assigned edge sets even when their vertex sets overlap. Thus the only unresolved original edges after lifting the quotient partitions are precisely the assigned edges of $cal(H)$, each appearing once. Recursively partitioning them completes an edge partition of $G$.
  ===== 7.6 Order savings and the final estimate. <order-savings-and-the-final-estimate.>
  Define the absolute constants
  $ A_1 = H + 4 / 3 \, #h(2em) A_2 = max { 9 P_0 + 8 \, thin 9 H } . $
  By (7.15), (7.11), and (7.14),
  #[#set math.equation(numbering: n => "(7.17)")
   $ sum_(Y \, W) q_W lt.eq N_t - Sigma / 3 lt.eq n - S_i / 3 + frac(A_1 n, w) . $ <eq:total-quotient-order>]
  The parts completed apart from the quotient partitions and the recursive work on $cal(H)$ number at most
  #[#set math.equation(numbering: n => "(7.18)")
   $ \| cal(L)_t \| + 8 Sigma + 9 P_0 S_i & lt.eq \( 9 P_0 + 8 \) S_i + 9 H n \/ w\
 & lt.eq A_2 \( S_i + n \/ w \) . $ <eq:nonrecursive-cost>]
  Monotonicity of $phi.alt$, $q_W lt.eq B_0$, and (7.16) therefore bound the complete partition size by
  #[#set math.equation(numbering: n => "(7.19)")
   $ A_2 \( S_i + n \/ w \) + C eta P_0 S_i + C phi.alt \( B_0 \) (n - S_i / 3 + frac(A_1 n, w)) . $ <eq:inductive-cost>]
  The coefficient of $S_i$ in this expression is at most
  $ A_2 + C / 100 - C / 6 = A_2 - frac(47 C, 300) lt.eq 0 #h(2em) upright("if ") C gt.eq 7 A_2 . $
  It remains to pay for the order-overlap term. Set $delta = 1 \/ sqrt(0.30) - 1 > 0$. For $w gt.eq 40 \/ 3$, both $phi.alt \( n \)$ and $phi.alt \( B_0 \)$ take their nonconstant values, and $log n gt.eq w$ gives
  #[#set math.equation(numbering: n => "(7.20)")
   $ phi.alt \( n \) - phi.alt \( B_0 \) = 1 / sqrt(0.30 w) - 1 / sqrt(log n) gt.eq delta / sqrt(w) . $ <eq:potential-gain>]
  For $C gt.eq 7 A_2$, the remaining overhead in (7.19), beyond $C phi.alt \( B_0 \) n$, is at most $C \( A_1 + 1 \) n \/ w$. It is absorbed by (7.20) whenever
  #[#set math.equation(numbering: n => "(7.21)")
   $ log D_(*) gt.eq (frac(A_1 + 1, delta))^2 . $ <eq:cutoff-absorption>]
  No choice made here requires the total quotient order in (7.17) to be at most $n$; the potential gain pays for its possible excess.
  We finally specify the order of constant choices. The parameters in (7.1), the scale-split constant $C_0 gt.eq 1$, and hence $C_2 \, H \, A_1 \, A_2 \, delta$, are already absolute and fixed. Choose $D_(*)$ large enough for Lemma 5.1, Lemma 6.2, for 8 with two classes at expansion $D^0.90$, and for 10 with the fixed $eta$ and $c in { 1 \, 1 \/ 4 }$. Also impose $log D_(*) gt.eq max { C_2 \, 40 \/ 3 }$, (7.21), and, for every $D gt.eq D_(*)$,
  $ D^(- 0.01) lt.eq frac(1, log D) \, #h(2em) D^0.001 lt.eq 1 / 2 D^0.30 \,\
2 D^(- 0.009) lt.eq frac(1, log D) \, #h(2em) D^(- 0.87) + 4 D^(- 0.15) lt.eq frac(1, log D) . $
  These are uniform eventual inequalities between fixed powers and logarithms. Such a cutoff exists independently of $C$. After fixing it, choose
  $ C gt.eq max { 7 A_2 \, thin 4 T \( D_(*) \) } . $
  The base and terminal cases then hold, and (7.19)–(7.20) give at most $C phi.alt \( n \) n$ parts in the remaining case. This closes the strong induction. ◻
]

Since $phi.alt \( n \) lt.eq 1$, 16 proves 1 for positive order. The zero-vertex graph has the empty partition, completing all cases.


#bibliography("refs.bib", style: "ieee", title: [References])
