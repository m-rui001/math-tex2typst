#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Additive hardness and unbounded configuration gaps \
in bin packing]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

An instance of bin packing is an explicitly listed collection of rational item sizes in $\( 0 \, 1 \]$,
  encoded in binary. A bin may contain any subcollection of total size at most one.
  Write $"OPT" \( I \)$ for the minimum number of bins needed to pack an instance $I$,
  and $a_i$ for the size of its $i$th item copy. We consider deterministic algorithms whose running time is
  polynomial in the length of this explicit encoding. The additive approximation question asks whether one
  algorithm and one absolute constant $C$ can guarantee at most $"OPT" \( I \) + C$ bins for every instance $I$.
  Williamson and Shmoys included this constant-additive question among the open problems in their 2011 book on
  approximation algorithms [22] Chapter 17, Problem 3.

The configuration linear program assigns nonnegative weights to feasible bin patterns and minimizes their total
  weight subject to covering the item demands. Its cutting-stock antecedents include Eisemann’s formulation and
  Gilmore and Gomory’s column-generation method [7] p. 849.
  We use the ordinary formulation in numerical size types. We will also prove the same gap for the stronger
  formulation whose patterns are subsets of the individual item copies.

=== 1.1 Configuration relaxations and integer rounding <configuration-relaxations-and-integer-rounding>

#prodef([Definition 1.1.])[
  (Configuration relaxations).  For the ordinary type formulation,
    let $cal(S)$ be the set of distinct numerical sizes and let $n_sigma$ be the multiplicity of $sigma in
    cal(S)$. Its configurations are all integer vectors
  $ cal(C) = {\( c_sigma \)_(sigma in cal(S)) in bb(Z)_(gt.eq 0)^(cal(S)) :
    sum_(sigma in cal(S)) sigma c_sigma lt.eq 1} . $
  The Gilmore–Gomory relaxation is
  #[#set math.equation(numbering: n => "(1.1)")
   $ "OPT"_(upright("LP")) = min {sum_(upright(bold(c)) in cal(C)) z_(upright(bold(c))) :
     z_(upright(bold(c))) gt.eq 0 \, quad sum_(upright(bold(c)) in cal(C)) c_sigma z_(upright(bold(c))) gt.eq
     n_sigma quad \( sigma in cal(S) \)} . $ <eq:type-configuration-lp>]
  In particular, type configurations may repeat a size; their multiplicities are limited by capacity,
    rather than by the input multiplicities.
  Give the input items distinct physical indices in a set $cal(I)$, with size $a_i$ at index $i$,
    even when some sizes coincide. An individual-copy configuration is a subset $H subset.eq
    cal(I)$ with $sum_(i in H) a_i lt.eq 1$. Writing $cal(H)$ for all such subsets, define
  #[#set math.equation(numbering: n => "(1.2)")
   $ "OPT"_(upright(L P \, i n d)) = min {sum_(H in cal(H)) y_H : y_H gt.eq 0 \, quad sum_(H in.rev i) y_H gt.eq
     1 quad \( i in cal(I) \)} . $ <eq:individual-configuration-lp>]
] <def:configuration-lp>

Both programs are lower bounds on $"OPT" \( I \)$. The distinction between patterns that may repeat a size beyond
  its input multiplicity and patterns limited by available copies is relevant to integer-rounding questions;
  see Kartak, Ripatti, Scheithauer, and Kurz [14]. Here $"OPT"_(upright("LP")) \( I \)$ always denotes the
  unrestricted numerical-type formulation in Equation (1.1).
  We prove its value and the individual-copy value separately for our instances.

The integer round-up property asks whether the integral optimum equals the fractional optimum rounded up.
  Marcotte studied this property for cutting stock and exhibited an instance for which it fails [16,17].
  Scheithauer and Terno investigated the modified bound [20,21]

#[#set math.equation(numbering: n => "(1.3)")
 $ "OPT" \( I \) lt.eq ceil.l "OPT"_(upright("LP")) \( I \) ceil.r + 1 \, $ <eq:mirup>]

now known as the #emph[Modified Integer Round-Up Conjecture].
  The algorithmic question and this structural question require separate arguments:
  Equation (1.3) concerns the existence of a packing, whereas an approximation algorithm must construct one efficiently.

=== 1.2 Results <results>

Our first result is an unconditional family of gaps for both configuration relaxations.

#thm([Theorem 1.2.])[
  (Unbounded configuration gap).  #emph[For every integer $c gt.eq 0$,
    there is a finite rational bin-packing instance $I$ and an integer $B$ such that every item size exceeds $1 \/
    6$ and
#[#set math.equation(numbering: n => "(1.4)")
 $ "OPT"_(upright("LP")) \( I \) = B \, wide "OPT" \( I \) > B + c . $ <eq:main-gap>]

 The equality for the fractional optimum also holds for the configuration LP whose patterns are subsets of the
   individual item copies.]
] <thm:unbounded-gap>

Taking $c = 1$ contradicts Equation (1.3), so Theorem 2 disproves the Modified Integer Round-Up Conjecture.
  The integral LP value in the construction makes this a gap beyond the conjectured rounding allowance,
  without any ambiguity caused by the ceiling.

The same construction yields hardness for every fixed additive allowance.

#thm([Theorem 1.3.])[
  (Constant-additive hardness).  #emph[For every fixed integer $c gt.eq 0$,
    it is NP-hard to distinguish pairs $\( I \, B \)$ such that $I$ packs into $B$ bins from pairs such that $I$
    cannot be packed into $B + c$ bins. Here $B$ is an integer supplied with the instance,
    the item sizes are rational, and every item size is strictly greater than $1 \/ 6$.]
] <thm:additive-hardness>

#thm([Corollary 1.4.])[
  #emph[A deterministic polynomial-time algorithm that always uses at most $"OPT" \( I \) +
    C$ bins for some absolute constant $C$ exists if and only if $sans(P) = sans(N P)$.]
] <cor:complexity-equiv>

Theorem 2 assumes no separation of complexity classes. Theorem 3 gives the conditional negative answer to the
  algorithmic question through Corollary 4. All constructions use sizes greater than $1 \/ 6$,
  so each feasible bin contains at most five items.

=== 1.3 Approximation bounds and related constructions <approximation-bounds-and-related-constructions>

Fernandez de la Vega and Lueker used grouping of item sizes to obtain an asymptotic approximation scheme [6]:
  for each fixed positive $epsilon$, the multiplicative ratio can be made $1 +
  epsilon$ once the optimum is sufficiently large. A fixed multiplicative excess still allows an additive error
  that grows with the optimum. Karmarkar and Karp combined grouping with approximate solution of the configuration
  LP and repeated packing of its integral part, obtaining an additive bound of order $log^2 "OPT"$ [12].
  Rothvoss combined discrepancy-based rounding with grouping and gluing of small items to improve this to order
  $log "OPT" log log "OPT"$ [19]. Hoberg and Rothvoss first assembled items into containers and then packed the
  containers into bins, obtaining order $log "OPT"$ [10]. The latter two algorithms are randomized,
  and their bounds hold relative to the configuration LP. These logarithmic upper bounds are compatible with
  Theorem 2: the constructed instances can grow very rapidly with the prescribed gap.
  We do not obtain a matching logarithmic lower bound as a function of their size.

Earlier counterexamples and rounding obstructions explain two obstacles to a larger gap.
  Caprara, Dell’Amico, Díaz-Díaz, Iori, and Rizzi encoded edge-coloring obstructions in scalar bin sizes to
  produce instances without the integer round-up property [2].
  Such graph encodings provide a related way to transfer a combinatorial obstruction into packing,
  but those examples do not establish unbounded additive gaps.
  Newman, Neiman, and Nikolov, and Eisenbrand, Pálvölgyi, and Rothvoss used discrepancy constructions to prove
  logarithmic obstructions for algorithms restricted to rounding a supplied fractional support [18,5].
  An integral packing may use other feasible configurations.
  A gap for the full configuration LP must therefore control all such packings,
  rather than only the chosen support. This is the task of our extraction argument.

The restriction to at most five items per bin does not fix the number of distinct numerical sizes.
  Goemans and Rothvoss proved exact polynomial-time solvability for a fixed number of sizes [8],
  and Koana and Kumabe have announced a fixed-parameter algorithm in that parameter [15].
  These results concern a different parameter regime. For subset-pattern formulations,
  the connection to discrepancy of permutations yields bounds depending on the number of items even when bin
  cardinality is fixed [5]; the upper bounds for set covering with ordered replacement likewise retain a
  logarithmic dependence on the number of items for fixed cardinality [4].

=== 1.4 The graph-to-packing construction <the-graph-to-packing-construction>

A vertex cover of a graph is a set of vertices containing at least one endpoint of every edge.
  We prove a quantitative reduction from this problem. For every fixed $c gt.eq 0$ and $rho > 0$,
  an explicitly represented graph with $n$ vertices and a cover target $k$ produces $5 B$ items.
  A cover of size at most $k$ gives a $B$-bin packing, while every packing into at most $B +
  c$ bins gives a cover of size at most $k + rho n$. Theorem 6 states the exact interface.
  The constants depend on $c$ and $rho$; for each fixed pair,
  the explicit list of items and their binary encodings have polynomial length in the graph input.

===== 1.4.1 Two interval families force a choice. <two-interval-families-force-a-choice.>

For a chosen positive integer $d$, the first ingredient is a pair of finite rooted trees with a quota at each
  positive depth. Each tree separately has a marking that meets every root-to-leaf path at least $d$ times while
  respecting these quotas. When the same quotas are shared between both trees, however,
  the two trees cannot both have every path marked even once.
  Depth-constrained path hitting also occurs in the tree formulation of resource minimization for fire
  containment [3]. We prove the particular two-tree property directly in Lemma 5.

For each graph vertex we represent the two trees by nested interval cells, with separate plus and minus regions.
  Cells at the same depth are well separated. A local resource of a given length can cover points in at most one
  cell at the corresponding depth; the number of such resources is its depth quota.
  If every leaf cell requires $d$ units of coverage, the competing-tree property forces almost $d$ additional,
  global resources onto one of the two sides. The plus-side allocation will determine the extracted vertex cover.
  Short test intervals for the incident edges are placed beside the plus tree.

===== 1.4.2 Five item roles encode interval coverage. <five-item-roles-encode-interval-coverage.>

An intended bin has a row item, an anchor item, a global auxiliary item, a local auxiliary item, and a flag item.
  Rows, anchors, and local auxiliaries carry graph-vertex labels. A row carries a baseline coordinate $b$.
  In one kind of bin with equal labels, the auxiliary lengths move it to a completion coordinate $h lt.eq b$,
  and the anchor supplies a deadline $z$. The bin fits precisely when $h lt.eq z$.
  Its half-open interval $\[ h \, b \)$ records the positions crossed by that move.
  Shifting $d$ deadlines from the right endpoint of a test interval to its left endpoint forces $d$ additional
  completions at or before every point in that interval. Comparing prefix counts turns this into a coverage
  requirement. The elementary identity underlying this step is illustrated in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0.15, 6.65), [#text(size: 9.5pt)[One vertex label]], anchor: "west", padding: 0.07056cm)
  content((15.35, 6.65), [#text(fill: rgb("#595959"))[#text(size: 9.5pt)[schematic; not to scale]]], anchor: "east", padding: 0.07056cm)
  content((3.725, 6.14), [#text(size: 9.5pt)[plus root cell $[0,1]$]])
  content((11.95, 6.14), [#text(size: 9.5pt)[minus root cell $[4,5]$]])
  rect((0.15, 4.05), (7.3, 5.83), fill: rgb("#fcfcfc"), stroke: (paint: rgb("#737373"), thickness: 0.6pt, miter-limit: 10))
  rect((8.55, 4.05), (15.35, 5.83), fill: rgb("#fcfcfc"), stroke: (paint: rgb("#737373"), thickness: 0.6pt, miter-limit: 10))
  content((7.925, 4.94), [#text(fill: rgb("#666666"))[#text(size: 9.5pt)[$dots.h$]]])
  rect((0.46, 4.53), (2.72, 5.58), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000059"), thickness: 0.65pt, miter-limit: 10))
  rect((0.64, 4.7), (1.83, 5.39), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000059"), thickness: 0.65pt, miter-limit: 10))
  rect((0.82, 4.85), (1.28, 5.23), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000059"), thickness: 0.65pt, miter-limit: 10))
  line((0.82, 5.04), (1.28, 5.04), stroke: (paint: rgb("#000059"), thickness: 1.5pt, miter-limit: 10))
  circle((0.82, 5.04), radius: 0.05997, fill: rgb("#000059"), stroke: none)
  circle((1.28, 5.04), radius: 0.05997, fill: rgb("#ffffff"), stroke: (paint: rgb("#000059"), thickness: 0.7pt, miter-limit: 10))
  rect((8.86, 4.53), (11.12, 5.58), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000059"), thickness: 0.65pt, miter-limit: 10))
  rect((9.04, 4.7), (10.23, 5.39), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000059"), thickness: 0.65pt, miter-limit: 10))
  rect((9.22, 4.85), (9.68, 5.23), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000059"), thickness: 0.65pt, miter-limit: 10))
  line((9.22, 5.04), (9.68, 5.04), stroke: (paint: rgb("#000059"), thickness: 1.5pt, miter-limit: 10))
  circle((9.22, 5.04), radius: 0.05997, fill: rgb("#000059"), stroke: none)
  circle((9.68, 5.04), radius: 0.05997, fill: rgb("#ffffff"), stroke: (paint: rgb("#000059"), thickness: 0.7pt, miter-limit: 10))
  content((1.59, 4.27), [#text(size: 9.5pt)[nested cells near $0$]])
  content((9.99, 4.27), [#text(size: 9.5pt)[nested cells near $4$]])
  content((11.6, 5.02), [#text(size: 9.5pt)[closed boxes: cells#linebreak()thick segments: tests]], anchor: "west", padding: 0.07056cm)
  content((5.12, 5.5), [#text(size: 9.5pt)[job tests]])
  line((3.94, 5.04), (4.3, 5.04), stroke: (paint: rgb("#733a00"), thickness: 1.5pt, miter-limit: 10))
  circle((3.94, 5.04), radius: 0.05997, fill: rgb("#733a00"), stroke: none)
  circle((4.3, 5.04), radius: 0.05997, fill: rgb("#ffffff"), stroke: (paint: rgb("#733a00"), thickness: 0.7pt, miter-limit: 10))
  line((4.89, 5.04), (5.25, 5.04), stroke: (paint: rgb("#733a00"), thickness: 1.5pt, miter-limit: 10))
  circle((4.89, 5.04), radius: 0.05997, fill: rgb("#733a00"), stroke: none)
  circle((5.25, 5.04), radius: 0.05997, fill: rgb("#ffffff"), stroke: (paint: rgb("#733a00"), thickness: 0.7pt, miter-limit: 10))
  line((5.84, 5.04), (6.2, 5.04), stroke: (paint: rgb("#733a00"), thickness: 1.5pt, miter-limit: 10))
  circle((5.84, 5.04), radius: 0.05997, fill: rgb("#733a00"), stroke: none)
  circle((6.2, 5.04), radius: 0.05997, fill: rgb("#ffffff"), stroke: (paint: rgb("#733a00"), thickness: 0.7pt, miter-limit: 10))
  content((5.12, 4.66), [#text(size: 9.5pt)[right endpoints]])
  content((5.12, 4.27), [#text(size: 9.5pt)[in $[1"/"2,9"/"16)$]])
  content((7.75, 3.67), [#text(fill: rgb("#4d4d4d"))[#text(size: 9.5pt)[Tree clusters enlarged: all nonroot cells lie in their root's first tenth.]]])
  rect((0.15, 0.05), (15.35, 3.2), fill: rgb("#fafafa"), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((0.43, 2.91), [#text(size: 9.5pt)[A row supplies coverage]], anchor: "west", padding: 0.07056cm)
  content((8.06, 2.91), [#text(size: 9.5pt)[A test creates deadline demand]], anchor: "west", padding: 0.07056cm)
  line((7.69, 0.3), (7.69, 2.83), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  content((3.88, 2.43), [#text(size: 9.5pt)[a row moves from baseline $b$ to completion $h lt.eq b$]])
  line((0.78, 1.54), (7.01, 1.54), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: ">"))
  line((1.35, 1.54), (6.4, 1.54), stroke: (paint: rgb("#000059"), thickness: 1.5pt, miter-limit: 10))
  circle((1.35, 1.54), radius: 0.07056, fill: rgb("#000059"), stroke: none)
  circle((6.4, 1.54), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#000059"), thickness: 0.8pt, miter-limit: 10))
  line((3.83, 1.42), (3.83, 1.67), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10))
  content((1.35, 1.43), [#text(size: 9.5pt)[$h$]], anchor: "north", padding: 0.07056cm)
  content((3.83, 1.4), [#text(size: 9.5pt)[$a$]], anchor: "north", padding: 0.07056cm)
  content((6.4, 1.43), [#text(size: 9.5pt)[$b$]], anchor: "north", padding: 0.07056cm)
  content((3.88, 1.95), [#text(size: 9.5pt)[coverage at $a$ exactly when $h lt.eq a<b$]])
  content((3.88, 0.63), [#text(size: 9.5pt)[equal-label deadline bin fits $arrow.l.r.double.long h lt.eq z$]])
  content((11.71, 2.43), [#text(size: 9.5pt)[move $d$ deadline copies from $r$ to $l$]])
  line((13.6, 2.02), (9.76, 2.02), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: ">"))
  content((9.76, 2.01), [#text(size: 9.5pt)[$l$]], anchor: "south", padding: 0.07056cm)
  content((13.6, 2.01), [#text(size: 9.5pt)[$r$]], anchor: "south", padding: 0.07056cm)
  line((8.4, 0.91), (14.92, 0.91), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: ">"))
  line((8.6, 0.91), (9.76, 0.91), stroke: (paint: rgb("#4d4d4d"), thickness: 1.0pt, miter-limit: 10))
  line((9.76, 1.57), (13.6, 1.57), stroke: (paint: rgb("#4d4d4d"), thickness: 1.0pt, miter-limit: 10))
  line((13.6, 0.91), (14.64, 0.91), stroke: (paint: rgb("#4d4d4d"), thickness: 1.0pt, miter-limit: 10))
  line((9.76, 0.91), (9.76, 1.57), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10, dash: "dashed"))
  line((13.6, 0.91), (13.6, 1.57), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10, dash: "dashed"))
  circle((9.76, 1.57), radius: 0.0635, fill: rgb("#4d4d4d"), stroke: none)
  circle((13.6, 1.57), radius: 0.0635, fill: rgb("#ffffff"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.7pt, miter-limit: 10))
  circle((9.76, 0.91), radius: 0.0635, fill: rgb("#ffffff"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.7pt, miter-limit: 10))
  circle((13.6, 0.91), radius: 0.0635, fill: rgb("#4d4d4d"), stroke: none)
  content((9.51, 1.57), [#text(size: 9.5pt)[$+d$]], anchor: "east", padding: 0.07056cm)
  content((9.51, 0.91), [#text(size: 9.5pt)[$0$]], anchor: "east", padding: 0.07056cm)
  content((9.76, 0.85), [#text(size: 9.5pt)[$l$]], anchor: "north", padding: 0.07056cm)
  content((13.6, 0.85), [#text(size: 9.5pt)[$r$]], anchor: "north", padding: 0.07056cm)
  content((14.91, 0.91), [#text(size: 9.5pt)[$a$]], anchor: "west", padding: 0.07056cm)
  content((11.71, 0.31), [#text(size: 9.5pt)[extra prefix count $=d thin bold(1)_(\{l lt.eq a<r\})$]])
})],
  caption: [Figure 1: Interval coverage and deadline demand at one vertex label. Only representative nested tree cells are shown; vertical extent depicts containment. Leaf and job tests are left-closed and right-open. A row with completion $h$ covers $\[ h \, b \)$, while moving $d$ deadlines from a test’s right endpoint to its left endpoint adds exactly $d$ to the deadline prefix count on that test. When row and unshifted-deadline baseline multisets agree, covering every test at least $d$ times supplies the prefix inequalities needed to match completions to deadlines. ],
) <fig:interval-mechanism>

The other kind of bin pairs a job row with an anchor called a key.
  Each graph edge has many repeated job positions at both endpoints. A job row is either short or long.
  A long row matched to a key at the same position must use either a limited resource called a permit belonging to
  the key’s edge or a resource belonging to an earlier edge.
  The numerical coordinates prevent keys from using later rows or later-edge resources.
  A key using an earlier row reduces the earlier rows available for deadline bins;
  the resulting prefix deficit forces additional coverage at the current job.
  When the plus allocation is small, this compensation forces many exact-position long matches.
  Conservation of earlier-edge resources bounds how many of those matches can avoid the current edge’s permits.
  If both endpoint plus allocations were small, too many long matches would need that edge’s permits.
  Thus every edge has a sufficiently funded endpoint.

===== 1.4.3 Arbitrary packings and the two consequences. <arbitrary-packings-and-the-two-consequences.>

All coordinates and subclass constraints are encoded in ordinary scalar sizes near $1 \/ 5$.
  An arbitrary feasible packing need not consist of the intended bins.
  Integer scores and conservation of their total leave only a bounded number of items outside four five-item
  patterns. A second score orders the vertex labels; conservation over label prefixes bounds the number of
  unequal-label matches at each vertex. Crucially, the error at a vertex is independent of the number of positions
  in its construction. These bounds allow the interval and edge arguments to apply to every packing into at most
  $B + c$ bins.

For completeness, a vertex cover chooses one of two local states at each vertex,
  funding the plus side on the cover and the minus side elsewhere.
  The cover condition ensures that all edge resources can be assigned.
  For the fractional witness, instead take the four-vertex clique and give weight one half to each local state at
  every vertex. Each state uses every labeled item at its vertex exactly once,
  and the average demands equal the global inventories. An explicit distribution over physical item copies gives
  feasible configurations of total weight $B$. The cardinality bound of five supplies the matching dual lower
  bound. This fractional mixture does not require the states to coexist as an integral packing;
  cover extraction rules out such a packing within the prescribed allowance.

Section 2 proves the competing-tree lemma. Section 3 constructs the rational item sizes and proves their pattern,
  label, and order properties. Section 4 packs the items from a vertex cover,
  and Section 5 builds the exact fractional mixture. Section 6 extracts a small cover from an arbitrary packing
  with extra bins. Finally, Section 7 applies this common reduction first to the unconditional gap and then,
  using Håstad’s satisfiability gap [9], to ordinary NP-hardness.

== 2 Two competing trees <sec:competing-trees>

In a rooted tree $T$, the depth of a vertex is its distance from the root;
  write $V_ell \( T \)$ for the set of vertices at depth $ell$.
  A #emph[marking] is a set of vertices at positive depths.
  It #emph[hits] a path if the path contains a marked vertex.
  The following construction provides two trees that each admit many hits along every path,
  but cannot both be hit when their depth quotas are shared.

Depth-constrained path hitting appears in the tree formulation of resource minimization for fire containment
  studied by Chalermsook and Chuzhoy [3] Section 2. The obstruction below uses the same disjoint-branch counting
  principle as their construction in Section 6: more disjoint branches than marks available in their depth range
  leave one branch unhit. Here the quotas vary with depth, and retaining paths according to their red or blue
  vertex counts produces separate multiple-hit markings but excludes a shared one-hit marking.
  We prove this two-tree property in full.

#thm([Lemma 2.1.])[
  (Competing trees).  #emph[For every integer $d gt.eq 1$, there are two finite rooted trees $T^(+) \, T^(-)$,
    an integer $L gt.eq 1$, and positive integer quotas $p_1 \, dots.h \, p_L$ with the following properties.]
  + #emph[All leaves of both trees have depth $L$. Each tree $T^sigma$, $sigma in { + \, - }$,
    has a marking $cal(M)^sigma$ such that
#[#set math.equation(numbering: n => "(2.1)")
 $ \| cal(M)^sigma ∩ V_ell \( T^sigma \) \| & lt.eq p_ell &  & \( 1 lt.eq ell lt.eq L \) \,\
\| cal(M)^sigma ∩ pi \| & gt.eq d &  & upright("for every root-to-leaf path ") pi upright(" in ") T^sigma .
  $ <eq:tree-separate-marking>]

]
  + #emph[For any markings $cal(A)^(+)$ and $cal(A)^(-)$ satisfying the combined bounds
#[#set math.equation(numbering: n => "(2.2)")
 $ \| cal(A)^(+) ∩ V_ell \( T^(+) \) \| + \| cal(A)^(-) ∩ V_ell \( T^(-) \) \| lt.eq
   p_ell wide \( 1 lt.eq ell lt.eq L \) \, $ <eq:tree-combined-quota>]

 at least one of the two trees has a root-to-leaf path that is not hit by its marking.]
  #emph[The trees, quotas, and separate markings are constructible by a finite deterministic procedure depending
    only on $d$.]
] <lem:competing-trees>

#proof[
  We first build one auxiliary tree $cal(T)$, with some vertices colored red or blue.
    We then obtain $T^(+)$ and $T^(-)$ by retaining suitable complete paths in two copies of $cal(T)$.
  ===== 2.1 Phases and global depths. <phases-and-global-depths.>
  Begin with a single root at depth $h_0 = 0$, and perform $2 d - 1$ phases.
    At the start of phase $a$, let the current leaves be $u_1 \, dots.h \, u_N$, all at depth $h_(a - 1)$.
    The phase will add $N$ levels, so set $h_a = h_(a - 1) + N$. Give the new global depths the quotas
  #[#set math.equation(numbering: n => "(2.3)")
   $ p_(h_(a - 1) + i) = 2^(i - 1) = M_i / 2 \, wide M_i = 2^i \, wide 1 lt.eq i lt.eq N . $ <eq:tree-phase-quotas>]
  The indices $1 \, dots.h \, N$ are local to this phase. The successive depth blocks $\( h_(a - 1) \, h_a \]$ are
    disjoint, so each positive depth receives its quota exactly once.
  For each $i$, attach to $u_i$ exactly $M_i$ paths of $i$ edges, called #emph[spines].
    They share their starting vertex $u_i$ and are otherwise vertex-disjoint.
    Color half of their endpoints red and half blue. Each such endpoint has depth $h_(a - 1) + i$.
    If $i < N$, attach to each endpoint exactly
  #[#set math.equation(numbering: n => "(2.4)")
   $ 1 + sum_(j = i + 1)^N 2^(j - 1) $ <eq:tree-continuations>]
  paths of $N - i$ edges, sharing only that endpoint. Call these paths the #emph[continuation chains].
    All vertices introduced in distinct spines or continuation chains are new,
    except for the explicitly shared starting vertices. In particular,
    constructions below different $u_i$ are disjoint. No newly introduced vertex on a continuation chain is
    colored. For $i = N$, the spine endpoint already has depth $h_a$ and no continuation is added.
  Every new leaf has depth $h_a$, and every vertex at a smaller depth has a descendant at depth $h_a$.
    This proves the equal-depth invariant for the next phase.
    After the last phase put $L = h_(2 d - 1)$ and let $cal(T)$ be the resulting tree.
    All its leaves have depth $L$, and $L gt.eq 1$.
  ===== 2.2 An obstruction to arbitrary markings. <an-obstruction-to-arbitrary-markings.>
  Fix any marking $cal(A)$ of $cal(T)$ with at most $p_ell$ marks at each depth $ell$.
    The marks may be anywhere at positive depths; there is no restriction to colored vertices.
    We construct a path from the root to depth $L$ that avoids $cal(A)$.
  Suppose that a path avoiding $cal(A)$ has reached a phase-start leaf $u_i$.
    The total number of marks anywhere in the first $i$ new levels of this phase is at most
  #[#set math.equation(numbering: n => "(2.5)")
   $ sum_(j = 1)^i p_(h_(a - 1) + j) = sum_(j = 1)^i 2^(j - 1) = 2^i - 1 = M_i - 1 . $ <eq:tree-spine-budget>]
  There are $M_i$ spines below $u_i$, disjoint after their unmarked starting vertex.
    Hitting each spine would require at least $M_i$ different marks in these levels.
    Equation (2.5) therefore leaves one spine entirely unmarked, including its endpoint.
  If $i = N$, this spine already reaches the phase boundary.
    If $i < N$, the number of marks in all the remaining new levels is at most $sum_(j = i + 1)^N 2^(j - 1)$.
    By Equation (2.4), the unmarked endpoint has one more continuation chain than this bound.
    The chains are disjoint after that endpoint, so one of them is entirely unmarked.
    Following it extends the unhit path to depth $h_a$.
  The root cannot be marked. Starting there and applying this argument through all phases gives an unhit
    root-to-leaf path in $cal(T)$. Thus no quota-respecting marking of $cal(T)$ hits every complete path.
    The argument applies to a marking fixed on the entire final tree:
    each phase uses only the marks in its own block of global depths.
  ===== 2.3 Color counts and pruning. <color-counts-and-pruning.>
  At depth $h_(a - 1) + i$, the only colored vertices introduced in phase $a$ are the endpoints of the $M_i$
    spines below $u_i$. Spines below the other phase-start leaves have their endpoints at different depths,
    and their descendants are disjoint from those below $u_i$.
    Since the depth blocks of different phases are disjoint, there are exactly $p_(h_(a - 1) + i)$ red vertices
    and the same number of blue vertices at this global depth.
  Every root-to-leaf path in $cal(T)$ encounters exactly one colored endpoint in each phase.
    It therefore contains exactly $2 d - 1$ colored vertices, at least $d$ of which have the same color.
    Let $cal(P)^(+)$ be the family of complete paths containing at least $d$ red vertices,
    and let $cal(P)^(-)$ be the analogous family for blue. These families cover all complete paths.
    They are both nonempty: at every phase-start leaf, one can choose a spine of either color and continue to the
    next phase boundary, so in particular there are paths choosing red in every phase and paths choosing blue in
    every phase.
  In separate copies of $cal(T)$, retain the union of the paths in $cal(P)^(+)$ and in $cal(P)^(-)$, respectively;
    these are $T^(+)$ and $T^(-)$. Retain every vertex and edge on each chosen path,
    including vertices with only one retained child. No edge is contracted.
    Hence all original depths are preserved. Every retained vertex lies on a chosen complete path,
    so no vertex of depth less than $L$ becomes a leaf. Conversely,
    every retained root-to-leaf path is the unique path to one of the chosen original leaves,
    and thus belongs to its specified family.
  Mark all retained red vertices in $T^(+)$ and all retained blue vertices in $T^(-)$.
    Pruning can only decrease their numbers at each depth. The preceding color counts give the quotas in
    Equation (2.1), and the definition of each retained path family gives at least $d$ marks along every path.
    All these marks have positive depth.
  ===== 2.4 Projection of a combined marking. <projection-of-a-combined-marking.>
  Suppose, for a contradiction, that markings $cal(A)^(+) \,
    cal(A)^(-)$ satisfy Equation (2.2) and hit every complete path in both trees.
    Let $phi^sigma : V \( T^sigma \) arrow.r V \( cal(T) \)$ be the map identifying each retained copy vertex with
    its original vertex, and set
  #[#set math.equation(numbering: n => "(2.6)")
   $ cal(A) = phi^(+) \( cal(A)^(+) \) union phi^(-) \( cal(A)^(-) \) . $ <eq:tree-projected-marking>]
  These maps preserve depths. Taking a union merges any marks projected onto the same original vertex,
    so for every $1 lt.eq ell lt.eq L$,
  $ \| cal(A) ∩ V_ell \( cal(T) \) \| lt.eq \| cal(A)^(+) ∩ V_ell \( T^(+) \) \| + \| cal(A)^(-) ∩
    V_ell \( T^(-) \) \| lt.eq p_ell . $
  The roots are unmarked, and thus $cal(A)$ is a valid marking of $cal(T)$.
    Every complete path in $cal(T)$ belongs to at least one of $cal(P)^(+) \, cal(P)^(-)$.
    Its retained copy is hit, so its original path contains a vertex of $cal(A)$.
    This contradicts the obstruction proved above, and establishes the combined-quota assertion.
  Every phase adds finitely many explicitly specified vertices and edges.
    There are finitely many phases, and the final pruning is determined by counting colors along the finitely many
    complete paths. This is a finite deterministic construction from $d$, as claimed. ◻
]

== 3 The reduction instance <sec:instance>

#thm([Theorem 3.1.])[
  (Graph-to-packing reduction).  #emph[Fix an integer $c gt.eq 0$ and a real constant $rho > 0$.
    There is a deterministic polynomial-time construction with the following property.
    Its input is an explicitly listed simple graph $G = \( V \, E \)$, with $V = { 1 \, dots.h \,
    n }$ and $m = \| E \| gt.eq 1$, and an integer $0 lt.eq k lt.eq n$.
    Its output is an integer $B$ and an explicit list of $5 B$ rational item sizes in $\( 1 \/ 6 \, 1 \)$ such that:]
  + #emph[if $G$ has a vertex cover of size at most $k$, the items pack into $B$ unit-capacity bins;]
  + #emph[any packing into at most $B + c$ bins yields a vertex cover of size at most $k + rho n$.]
  #emph[The running-time and output-length bounds are in ordinary binary encoding;
    their constants may depend on $c$ and $rho$.]
] <thm:reduction>

We give the construction and its elementary properties in this section.
  Propositions 11 and 13 prove the two implications of Theorem 6, respectively.
  Vertex listing is part of the input representation, so the input length is at least $n$.

=== 3.1 Parameters and interval geometry <parameters-and-interval-geometry>

The integer $P_0$ below bounds a fixed score used to enforce the bin patterns.
  The allowance $K$ will bound items lost from those patterns when $c$ extra bins are available.
  Choose, once for the fixed pair $\( c \, rho \)$,

#[#set math.equation(numbering: n => "(3.1)")
 $ P_0 = 100^11 \, wide K = 25 \( c + 1 \) \( 1 + 5 P_0 \) \,\
d in bb(N) \, wide d gt.eq max { 72 K \, 120 K \/ rho } . $ <eq:parameters>]

Apply Lemma 5 to this $d$, obtaining $T^(+) \, T^(-)$, common leaf depth $L gt.eq 1$,
  and combined depth quotas $p_1 \, dots.h \, p_L$. Put $P =
  sum_(ell = 1)^L p_ell$ and choose an integer $D_(*) gt.eq
  1$ bounding the number of children of any node in either tree. These quantities depend only on $c \, rho$. Set

$ R = 100 \( P + n K + 1 \) . $

The $R$ repetitions of each incidence will make the later edge demand larger than both the local losses $P$ and
  the global losses proportional to $n K$.

Order the graph edges as $e = 1 \, dots.h \, m$. A #emph[position] is a pair $r = \( e \, j \)$ with $1 lt.eq
  j lt.eq R$; positions are ordered lexicographically. Define

#[#set math.equation(numbering: n => "(3.2)")
 $ theta_e & = \( R + 1 \)^(e - 1) - 1 \, & H_(e \, j) & = j \( R + 1 \)^(e - 1) - 1 \,\
g & = frac(1, 16 \( R + 1 \)^m) \, & b_(\( e \, j \)) & = 1 / 2 + g H_(e \, j) \, wide beta_e =
  g theta_e . $ <eq:position-coordinates>]

Write $H_r = H_(e \, j)$ when $r = \( e \, j \)$. For each vertex $v$, let

$ cal(R)_v = { \( e \, j \) : v upright(" is an endpoint of ") e \, med 1 lt.eq j lt.eq R } . $

Each vertex label $v$ uses its own copy of the following geometry.
  The roots of $T^(+)$ and $T^(-)$ are represented by the closed side cells $\[ 0 \, 1 \]$ and $\[ 4 \, 5 \]$.
  A node at depth $ell gt.eq 1$ has a closed cell of width

$ lambda_ell = g \[ 100 \( D_(*) + 1 \) \]^(- ell) . $

Within a parent with left endpoint $a$, the cell of its $j$th child at depth $ell$ is
  $\[ a + 4 j lambda_ell \, a + \( 4 j + 1 \) lambda_ell \]$. Finally put $Delta = lambda_L \/ 10$.
  For each $r in cal(R)_v$, add the closed #emph[job cell] $\[ b_r - Delta \, b_r \]$ on the plus side.
  The #emph[test intervals] are the leaf cells of both trees and all the job cells,
  each taken left-closed and right-open. Denote their union by $cal(I)_v$.
  Embedding cells remain closed whenever their geometric intersection or containment is discussed.

#thm([Lemma 3.2.])[
  (Geometry and coordinate order).  #emph[The embedding has the following properties.]
  + #emph[Every child cell lies inside its parent. Every nonroot cell lies in the first tenth of its root cell.
    Distinct depth-$ell$ cells across the two trees have gaps at least $3 lambda_ell$.]
  + #emph[The numbers $b_r$ belong to $\[ 1 \/ 2 \, 9 \/ 16 \)$, and distinct job cells have gaps at least $g -
    Delta$. All the test intervals of one label are pairwise disjoint.]
  + #emph[For $1 lt.eq ell lt.eq L$, $Delta lt.eq lambda_ell \/ 10$ and $lambda_1 + 2 Delta < g$.
    An interval of length at most $lambda_ell + Delta$ meets at most one depth-$ell$ cell.
    If it contains a point of a leaf cell, that depth-$ell$ cell is the leaf’s ancestor.
    An interval of length at most $lambda_1 + Delta$ meets at most one job cell.]
  + #emph[For $r = \( e \, j \)$, the two independent order bounds are
#[#set math.equation(numbering: n => "(3.3)")
 $ H_(r') - H_r gt.eq theta_e + 1 quad \( r' > r \) \, wide theta_f - theta_e gt.eq H_(e \, R) +
   1 quad \( f > e \) . $ <eq:coordinate-order>]

]
] <lem:geometry>

#proof[
  The right endpoint of the last child is at most $\( 4 D_(*) + 1 \)
    lambda_ell$ beyond its parent’s left endpoint. For $ell > 1$ this is less than $lambda_(ell - 1)$,
    since $4 D_(*) + 1 < 100 \( D_(*) + 1 \)$. For $ell = 1$ it is less than $g \/ 25 < 1 \/ 10$.
    Sibling gaps are $3 lambda_ell$. Cells with different parents retain at least the gap between those parents,
    which is at least $3 lambda_(ell - 1) > 3 lambda_ell$; the two root cells are separated by $3$.
    Induction proves the first assertion, including all cousin cells, and descendants remain in their depth-one cells.
  Successive $H$ values within edge $e$ differ by $\( R + 1 \)^(e - 1)$.
    The difference from $\( e \, R \)$ to $\( e + 1 \, 1 \)$ is the same number.
    Thus the first step after a position of edge $e$ is $theta_e + 1$, proving the first bound in Equation (3.3).
    Similarly,
  $ theta_(e + 1) - theta_e = R \( R + 1 \)^(e - 1) = H_(e \, R) + 1 \, $
  and later edges only increase this difference. Also $0 lt.eq H_r lt.eq R \( R + 1 \)^(m - 1) -
    1 < \( R + 1 \)^m$, proving the range of $b_r$. Consecutive baselines differ by at least $g$,
    so job-cell gaps are at least $g - Delta$.
  The widths decrease with depth, giving $Delta lt.eq lambda_ell \/ 10$. Since $100 \( D_(*) + 1 \) gt.eq 200$,
  $ lambda_1 + 2 Delta lt.eq 6 / 5 lambda_1 lt.eq frac(3 g, 500) < g . $
  In particular $Delta < g lt.eq 1 \/ 16$. Job cells therefore lie strictly to the right of $1 \/
    10$ and strictly to the left of $1$; they meet neither tree’s nonroot cells.
    Leaf cells have common depth $L$ and positive gaps, proving disjointness of all tests.
    Finally, $lambda_ell + Delta lt.eq \( 11 \/ 10 \) lambda_ell < 3 lambda_ell$, and $lambda_1 + Delta < g -
    Delta$. These strict inequalities and the stated gaps prove the intersection bounds.
    A point of a leaf belongs to its ancestor cell at every depth,
    so the uniquely intersected cell at depth $ell$ must be that ancestor. ◻
]

The geometric separation has two uses. A local interval of length $lambda_ell$,
  even with the additional shortening $Delta$, can intersect only one tree cell at depth $ell$.
  The two coordinate-order bounds will separately control which row positions and which edge resources can be
  matched. We next realize these constraints through five-item bins.

=== 3.2 Patterns and the complete item inventory <patterns-and-the-complete-item-inventory>

Items have five roles: rows $X$, anchors $A$, global auxiliaries $U$, local auxiliaries $D$, and flags $F$.
  Their subclasses are listed in Table 1. A #emph[tuple] consists of five distinct physical item copies.
  A #emph[table tuple] has one of the displayed subclass patterns.
  Its kind is $upright(M)$ for the first three rows of Table 1 and $upright(G)$ for the last row.
  Only the roles $X \, A \, D$ carry vertex labels. A table tuple is #emph[good] when these three labels are equal.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Kind
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[$A$
], table.cell(rowspan: 1, colspan: 1)[$U$
], table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[$F$
]),
  table.cell(rowspan: 1, colspan: 1)[$upright(M)$
], table.cell(rowspan: 1, colspan: 1)[$upright(T)_(+)$
], table.cell(rowspan: 1, colspan: 1)[$upright(Z)$
], table.cell(rowspan: 1, colspan: 1)[$upright(U)_(+)$
], table.cell(rowspan: 1, colspan: 1)[$upright(D)_(upright(M))$
], table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(T))$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(M)$
], table.cell(rowspan: 1, colspan: 1)[$upright(T)_(-)$
], table.cell(rowspan: 1, colspan: 1)[$upright(Z)$
], table.cell(rowspan: 1, colspan: 1)[$upright(U)_(-)$
], table.cell(rowspan: 1, colspan: 1)[$upright(D)_(upright(M))$
], table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(T))$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(M)$
], table.cell(rowspan: 1, colspan: 1)[$upright(S)$
], table.cell(rowspan: 1, colspan: 1)[$upright(Z)$
], table.cell(rowspan: 1, colspan: 1)[$upright(U)_(+)$
], table.cell(rowspan: 1, colspan: 1)[$upright(D)_(upright(M))$
], table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(M))$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(G)$
], table.cell(rowspan: 1, colspan: 1)[$upright(S)$
], table.cell(rowspan: 1, colspan: 1)[$upright(Y)$
], table.cell(rowspan: 1, colspan: 1)[$upright(W)$
], table.cell(rowspan: 1, colspan: 1)[$upright(D)_(upright(G))$
], table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(G))$
],
)
]],
  caption: [Table 1: The four table patterns, with one subclass in each role. Equal vertex labels on $X \, A \, D$ are a separate requirement for a good tuple. ],
)

The $upright(M)$ patterns will compare a row’s completion with an anchor deadline;
  the $upright(G)$ pattern will match a job row to an anchor key.
  The inventory below gives every role the same total count and gives the three labeled roles the same count at
  each vertex. We specify every item copy and a rational coordinate $w \( i \)$;
  the actual size will be defined afterwards. The symbols $b \,
  z$ and the auxiliary lengths below are attributes of individual items.

===== 3.2.1 Rows. <rows.>

For each label $v$ and each node of either tree, #emph[including its root],
  create $d$ rows with baseline $b$ equal to the cell’s right endpoint and coordinate $w = b$.
  Their subclass is $upright(T)_(+)$ on the plus side and $upright(T)_(-)$ on the minus side.
  Add $P$ further $upright(T)_(+)$ rows with baseline $1$. Thus the tree-row counts are

#[#set math.equation(numbering: n => "(3.4)")
 $ t_(v \, +) = d \| V \( T^(+) \) \| + P \, wide t_(v \, -) = d \| V \( T^(-) \) \| \, wide t_v = t_(v \, +) +
   t_(v \, -) gt.eq P + 2 d . $ <eq:tree-row-counts>]

For each $r in cal(R)_v$, create $2 d$ rows of subclass $upright(S)$, all with baseline $b_r$.
  Of these, $d$ are #emph[short], with $w = b_r - Delta$, and $d$ are #emph[long], with $w = b_r$.
  All these rows have label $v$. An intended packing sends $d$ rows at each position to kind $upright(M)$ and the
  other $d$ to kind $upright(G)$. Put

$ J_v = d \| cal(R)_v \| = d R deg \( v \) \, $

the number of job rows assigned to each kind in such a packing.

===== 3.2.2 Anchors. <anchors.>

For label $v$, form a baseline multiset $cal(B)_v$ consisting of every tree-row baseline, including padding,
  and $d$ copies of $b_r$ for each $r in cal(R)_v$. The latter are hypothetical baselines, so $\| cal(B)_v \| =
  t_v + J_v$, rather than the total row count. For each test interval,
  replace $d$ copies of its right endpoint by its left endpoint.
  Leaf-row copies and the hypothetical job copies provide these replacements;
  the different tests use distinct designated copies. For each resulting deadline $z$,
  create a $upright(Z)$ anchor of label $v$ with $w = - z$.

Set $upright(bold(1)) { E } = 1$ when condition $E$ holds, and $0$ otherwise.
  For $a in bb(R)$, let $B_v \( a \)$ be the number of members of $cal(B)_v$ at most $a$.
  Moving an endpoint from $r$ to $l < r$ changes its prefix indicator by $upright(bold(1)) { l lt.eq a } -
  upright(bold(1)) { r lt.eq a } = upright(bold(1)) { l lt.eq a < r }$.
  Since the tests are disjoint, their deadline count satisfies exactly

#[#set math.equation(numbering: n => "(3.5)")
 $ \# { upright(Z) upright(" anchors of label ") v upright(" with ") z lt.eq a } = B_v \( a \) +
   d thin upright(bold(1)) { a in cal(I)_v } . $ <eq:deadline-prefix>]

There are also $d$ #emph[keys] of subclass $upright(Y)$ for every position $r = \( e \, j \) in cal(R)_v$,
  with label $v$ and coordinate $w = - b_r - beta_e$. Their total number is $J_v$.

===== 3.2.3 Global auxiliaries. <global-auxiliaries.>

These have no vertex label. Create $sum_v \( t_(v \, +) + J_v \)$ items of subclass $upright(U)_(+)$,
  exactly $d k$ of length $1$ and the rest of length $0$. Create $sum_v
  t_(v \, -)$ items of subclass $upright(U)_(-)$, exactly $d \( n - k \)$ of length $1$ and the rest of length
  $0$. An item of either subclass has coordinate $w = - "len" \( i \)$.
  For each edge $e$, create $d R$ #emph[permits] of subclass $upright(W)$ with $w = beta_e$,
  and $d R$ #emph[nonpermits] of that same subclass with $w = beta_e + Delta$.

===== 3.2.4 Local auxiliaries. <local-auxiliaries.>

For each label $v$, create $t_v + J_v$ items of subclass $upright(D)_(upright(M))$.
  For each $ell = 1 \, dots.h \, L$, exactly $p_ell$ of them have length $lambda_ell$; the remaining $t_v + J_v -
  P$ have length $0$. Their coordinate is $w = - "len" \( i \)$.
  Also create $J_v$ items of subclass $upright(D)_(upright(G))$, with label $v$ and coordinate $0$.

===== 3.2.5 Flags. <flags.>

Create $sum_v t_v$ items of subclass $upright(F)_(upright(T))$ and $sum_v
  J_v$ each of subclasses $upright(F)_(upright(M))$ and $upright(F)_(upright(G))$.
  They have no vertex label and coordinate $0$.

All multiplicities are nonnegative. In particular, Equation (3.4) gives $t_v + J_v - P gt.eq 2 d +
  J_v$ zero-length local items, while the $d$ root rows on each side guarantee enough global items for the
  specified length-one stocks, including when $k = 0$ or $k = n$. Define

#[#set math.equation(numbering: n => "(3.6)")
 $ B = sum_(v = 1)^n \( t_v + 2 J_v \) . $ <eq:inventory-total>]

Each role has exactly $B$ items. This is immediate for $X \, A \, D$ from their labelwise counts.
  For the other roles, use $sum_v J_v = 2 d m R$: the $upright(W)$ inventory is exactly $sum_v J_v$,
  and the stated global and flag counts each sum to $B$ as well.
  The three labeled roles have equal inventories $t_v + 2 J_v$ at every label $v$.
  All coordinates satisfy $\| w \( i \) \| lt.eq 6$: cell endpoints lie in $\[ 0 \, 5 \]$,
  lengths are at most $1$, and $0 lt.eq beta_e < 1 \/ 16$.

=== 3.3 Encoding the patterns and labels in rational sizes <encoding-the-patterns-and-labels-in-rational-sizes>

Large-base aggregation of bounded integer equations is a classical arithmetic device;
  see Anthonisse [1] Theorem 6 and Section 5. A recent use in bin-packing constructions appears in Jansen,
  Pirotton, and Tutas [11] Section 3. We give the bounded five-item version explicitly and separately control the
  defects allowed by extra bins.

The encoding has three tasks: keep every item above $1 \/ 6$, control departures from Table 1,
  and turn good-tuple feasibility into an inequality on the coordinates $w \( i \)$.
  Feasibility alone will allow some departures from the table.
  Conservation of the total scores will bound their number when at most $c$ extra bins are used.

For a collection of items, let $N_s$ denote the count of subclass $s$ and $N_r$ the count of role $r$.
  Consider the following ten homogeneous count equations: the five role equations $5 N_r - sum_s N_s = 0$,
  in the order $r = X \, A \, U \, D \, F$, followed by

#[#set math.equation(numbering: n => "(3.7)")
 $ N_(upright(T)_(+)) + N_(upright(T)_(-)) - N_(upright(F)_(upright(T))) & = 0 \,\
N_(upright(Z)) - N_(upright(F)_(upright(T))) - N_(upright(F)_(upright(M))) & = 0 \,\
N_(upright(U)_(+)) + N_(upright(U)_(-)) - N_(upright(F)_(upright(T))) - N_(upright(F)_(upright(M))) & = 0 \,\
N_(upright(D)_(upright(M))) - N_(upright(F)_(upright(T))) - N_(upright(F)_(upright(M))) & = 0 \,\
N_(upright(T)_(-)) - N_(upright(U)_(-)) & = 0 . $ <eq:pattern-count-equations>]

Here $sum_s$ is over all thirteen subclasses. Let $delta_j \( i \)$, $0 lt.eq j < 10$,
  be item $i$’s coefficient in these successive left sides, and define its integer primary score by

$ p \( i \) = sum_(j = 0)^9 100^j delta_j \( i \) . $

The coefficients depend only on the subclass. Each has absolute value at most $4$, so $\| p \( i \) \| lt.eq
  4 sum_(j = 0)^9 100^j < P_0$.

For vertex labels set $Q_v = 3^v$. The secondary score is $q \( i \) = Q_v$ for an $X$ or $D$ item of label $v$,
  $q \( i \) = - 2 Q_v$ for an $A$ item of that label, and $q \( i \) = 0$ on the other roles.
  Give item $i$ the actual size

#[#set math.equation(numbering: n => "(3.8)")
 $ a_i = 1 / 5 + gamma p \( i \) + mu q \( i \) + nu w \( i \) \,\
gamma = frac(1, 1000 P_0) \, wide mu = frac(gamma, 1000 Q_n) \, wide nu = mu / 1000 . $ <eq:item-size>]

Roles and labels specify the construction and remain available as metadata for its analysis.
  The output consists of the rational sizes of the indexed physical copies;
  the argument requires no recovery of this metadata from a size and no numerical distinctness of different kinds
  of items.

#thm([Lemma 3.3.])[
  (Scalar encoding).  #emph[Every item size belongs to $\( 1 \/ 6 \, 1 \)$,
    so every feasible bin has at most five items. For a five-item tuple,
    zero total primary score is equivalent to following Table 1.
    A feasible five-item tuple has nonpositive total primary score; if that score is zero,
    its total secondary score is nonpositive. If both totals are zero,
    feasibility is equivalent to $sum_i w \( i \) lt.eq 0$. The complete item inventory satisfies $sum_i
    p \( i \) = sum_i q \( i \) = 0$.]
] <lem:encoding>

#proof[
  On a five-item tuple, every role-equation total belongs to $\[ - 5 \, 20 \]$ and each remaining total belongs to
    $\[ - 5 \, 5 \]$. All ten are integers of absolute value less than $100$.
    If their radix-$100$ combination is zero, reducing modulo $100$ makes the first total zero:
    it is a multiple of $100$ strictly between $- 100$ and $100$.
    Divide by $100$ and repeat to obtain all ten equations. This argument applies to signed totals as well.
    The converse is immediate.
  The role equations now give exactly one item of each role.
    With flag $upright(F)_(upright(T))$, the first subclass equation forces a tree row,
    the next three force $upright(Z)$, one of $upright(U)_(+) \, upright(U)_(-)$, and $upright(D)_(upright(M))$,
    and the last equation pairs $upright(T)_(-)$ precisely with $upright(U)_(-)$.
    With flag $upright(F)_(upright(M))$, the row is $upright(S)$, the anchor and local item are $upright(Z) \,
    upright(D)_(upright(M))$, and the global item must be $upright(U)_(+)$.
    With flag $upright(F)_(upright(G))$, the remaining subclasses are forced to be $upright(S) \, upright(Y) \,
    upright(W) \, upright(D)_(upright(G))$. These are exactly the four patterns, each of which satisfies every equation.
  The perturbation of one item from $1 \/ 5$ is bounded by
  $ \| a_i - 1 \/ 5 \| lt.eq 1 / 1000 + frac(2, 10^6 P_0) + frac(6, 10^9 P_0 Q_n) < 1 / 30 . $
  Thus $a_i > 1 \/ 6$ and $a_i < 7 \/ 30 < 1$. For five items,
    the total absolute contribution below the primary scale is at most $10 Q_n mu + 30 nu$, and
  $ frac(10 Q_n mu + 30 nu, gamma) = 1 / 100 + frac(3, 100000 Q_n) < 1 \, wide frac(30 nu, mu) = 3 / 100 < 1 . $
  An integer primary total at least $1$ would therefore make the bin’s size exceed $1$.
    If the primary total is zero, the same argument at the secondary scale excludes a positive secondary total.
    When both vanish, the five copies of $1 \/ 5$ already sum to $1$, leaving exactly the asserted coordinate condition.
  Finally, the whole inventory satisfies all ten count equations.
    Every role has $B$ items; the tree-row and $upright(F)_(upright(T))$ counts both equal $sum_v t_v$;
    each of the $upright(Z)$, combined $upright(U)_(+) \, upright(U)_(-)$,
    and $upright(D)_(upright(M))$ counts equals $sum_v \( t_v + J_v \)$;
    and the $upright(T)_(-)$ and $upright(U)_(-)$ counts agree. Thus the primary total is zero.
    At each label the $X \, A \, D$ inventories are equal, so its secondary contribution is $\( 1 - 2 + 1 \)
    Q_v \( t_v + 2 J_v \) = 0$. ◻
]

===== 3.3.1 Polynomial construction. <polynomial-construction.>

For fixed $c \, rho$, the trees and all their parameters are finite constants.
  In particular $t_v = t$ is a fixed constant, while $R = O \( n + 1 \)$ and $B = n t + 4 d m R$.
  Hence all positions and all item copies can be enumerated in polynomial time in the explicit graph input.
  The denominators

#[#set math.equation(numbering: n => "(3.9)")
 $ D_(upright("geom")) & = 160 \( R + 1 \)^m \[ 100 \( D_(*) + 1 \) \]^L \,\
D_(upright("size")) & = 10^9 P_0 3^n D_(upright("geom")) $ <eq:encoding-denominators>]

are common denominators for all coordinates $w \( i \)$ and all sizes $a_i$, respectively.
  Indeed, $D_(upright("geom"))$ accommodates $g$, every $lambda_ell$, $Delta$, all nested endpoints,
  and every baseline and $beta_e$; Equation (3.8) then gives the second claim.
  Their bit lengths are $O \( n + m log \( n + 2 \) \)$, with constants depending on the fixed parameters.
  Since $0 < a_i < 1$, numerators over $D_(upright("size"))$ have the same bound.
  Integer powering, arithmetic, item enumeration, and optional fraction reduction therefore take polynomial bit
  time. The choice of $d$ and the finite tree construction are fixed for each reduction;
  $rho$ is not a real-valued runtime input.

#thm([Lemma 3.4.])[
  (Good anchors under an additive allowance).  #emph[In any packing of the constructed instance into at most $B +
    c$ bins, fewer than $K$ items lie outside five-item table tuples.
    At each vertex label $v$, at most $3 K$ anchors lie outside good tuples.
    This is a joint bound on its $upright(Z)$ and $upright(Y)$ anchors,
    and therefore applies to any subset of that label’s anchors.]
] <lem:good-anchors>

#proof[
  If the packing has $N lt.eq B + c$ bins, five-item capacity gives $N gt.eq B$.
    The number of unused five-item slots is $5 \( N - B \) lt.eq 5 c$.
    Hence there are at most $5 c$ nonfull bins and at most $25 c$ items in them.
    All full bins have nonpositive integer primary totals by Lemma 8.
    The whole primary total is zero, so the sum of the magnitudes of the negative full-bin totals is at most $25 c
    P_0$, supplied by the nonfull items. There are consequently at most $25 c P_0$ negative-primary full bins.
    The number of items outside primary-zero full bins is at most
  #[#set math.equation(numbering: n => "(3.10)")
   $ 25 c + 5 \( 25 c P_0 \) = 25 c \( 1 + 5 P_0 \) < K . $ <eq:primary-loss>]
  Those primary-zero bins are precisely the table tuples.
  In a table tuple write $v_X \, v_D \, v_A$ for its three labels.
    Its secondary score is $Q_(v_X) + Q_(v_D) - 2 Q_(v_A) lt.eq 0$.
    If $v_X > v_A$, then $Q_(v_X) gt.eq 3 Q_(v_A)$, already exceeding the negative contribution;
    the same argument applies to $v_D$. Thus
  $ v_X lt.eq v_A \, wide v_D lt.eq v_A . $
  Equality of the secondary total occurs exactly when all three labels are equal.
  Here is the exact conservation law that controls smaller-label imports.
    Fix a prefix $S = { 1 \, dots.h \, h }$ and a role $r in { X \, D }$.
    Let $O_A \( S \)$ and $O_r \( S \)$ count items of the indicated role and labels in $S$ outside table tuples.
    Let $E_r \( S \)$ count table tuples whose role-$r$ item has label in $S$ and whose anchor has label outside
    $S$. The original inventories of either role in $S$ equal $sum_(v in S) \( t_v + 2 J_v \)$.
    Every table anchor in $S$ consumes a role-$r$ item in $S$.
    Subtracting this consumption from the available role-$r$ items gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ E_r \( S \) = O_A \( S \) - O_r \( S \) lt.eq O_A \( S \) lt.eq K . $ <eq:label-prefix-conservation>]
  This identity also holds for the empty prefix.
  For anchors of label $v$, any unequal row label must be below $v$ and is counted by
    $E_X \( { 1 \, dots.h \, v - 1 } \)$. At most $K$ table anchors of label $v$ have this defect.
    At most another $K$ have a smaller local-auxiliary label.
    At most $K$ anchors of the label lie outside table tuples altogether.
    Their union has at most $3 K$ members, proving the joint assertion.
    Summing this bound over labels permits a global loss of $3 n K$. ◻
]

=== 3.4 Feasibility of good tuples <feasibility-of-good-tuples>

Lemma 9 now lets us analyze an arbitrary packing through its good tuples,
  losing at most $3 K$ anchors at each vertex. The loss is independent of the number of job positions.
  For good tuples, the remaining coordinate inequality has the following concrete meaning.

#thm([Lemma 3.5.])[
  (Completion and key inequalities).  #emph[A good tuple has zero primary and secondary totals.
    Its feasibility is therefore described exactly as follows.]
  + #emph[For kind $upright(M)$, with row baseline $b$, deadline $z$, and associated global and local items $U \,
    D$, define
#[#set math.equation(numbering: n => "(3.12)")
 $ h = b - Delta upright(bold(1)) { upright("row is short") } - "len" \( U \) -
   "len" \( D \) . $ <eq:completion-coordinate>]

 The tuple is feasible if and only if $h lt.eq z$, and $h lt.eq b$.
   For any collection of such row–auxiliary assignments and any $a in bb(R)$,
#[#set math.equation(numbering: n => "(3.13)")
 $ \# { h lt.eq a } = \# { b lt.eq a } + \# { h lt.eq a < b } . $ <eq:completion-prefix>]

 The last term counts coverage by the half-open intervals $\[ h \, b \)$.]
  + #emph[For kind $upright(G)$, let its key have position $r = \( e \, j \)$, its row have position $r'$,
    and its global item belong to edge $f$. Feasibility is equivalent to
#[#set math.equation(numbering: n => "(3.14)")
 $ b_(r') - b_r + beta_f - beta_e + Delta #scale(x: 120%, y: 120%)[\(] upright(bold(1)) { upright("nonpermit") } -
   upright(bold(1)) { upright("row is short") } #scale(x: 120%, y: 120%)[\)] lt.eq 0 . $ <eq:key-feasibility>]

 It implies both $r' lt.eq r$ and $f lt.eq e$. For an exact-position long row,
   the global item must be a permit of edge $e$ or an item of an earlier edge.
   At the exact position and edge, a short row admits either a permit or a nonpermit,
   whereas a long row admits only a permit.]
] <lem:good-feasibility>

#proof[
  The table pattern gives zero primary score; equal labels give $Q_v + Q_v - 2 Q_v = 0$. Apply Lemma 8.
    In kind $upright(M)$, the five coordinates sum to $h - z$, proving the first criterion.
    All lengths and the shortening term are nonnegative, so $h lt.eq b$.
    The events ${ b lt.eq a }$ and ${ h lt.eq a < b }$ partition ${ h lt.eq a }$, proving Equation (3.13),
    including the endpoints and the empty intervals when $h = b$.
  In kind $upright(G)$, summing the row, key, global, local,
    and flag coordinates gives exactly the left side of Equation (3.14).
    If $r' > r$, then Equation (3.3) gives a position increase at least $g \( theta_e + 1 \)$.
    Since $theta_f gt.eq 0$, the $beta$ difference is at least $- g theta_e$.
    The final perturbation is at least $- Delta$. The total is therefore at least $g - Delta > 0$,
    excluding $r' > r$ without any condition on $f$.
  Independently, if $f > e$, the $beta$ increase is at least $g \( H_(e \, R) + 1 \)$.
    Since $H_(r') gt.eq 0$ and $H_r lt.eq H_(e \, R)$, the position difference is at least $- g H_(e \, R)$.
    Again the total is at least $g - Delta > 0$, excluding $f > e$ without any condition on $r'$.
    For an exact-position long row, a same-edge nonpermit would leave the strictly positive sum $Delta$,
    proving the resource restriction. For an exact-position, same-edge tuple,
    the sum is simply
    $Delta \( upright(bold(1)) { upright("nonpermit") } - upright(bold(1)) { upright("row is short") } \)$,
    which gives the remaining assertions. ◻
]

For later geometric use, an $upright(M)$ interval with global length zero and local length $lambda_ell$ has length
  at most $lambda_ell + Delta$. With both lengths zero it is empty, except for a short $upright(S)$ row,
  whose interval is its job test interval. Thus the intersection bounds of Lemma 7 apply even when the row’s
  baseline is unrelated to the depth of its local item. Finally, a plus row has $b lt.eq 1$,
  while a minus row has $b gt.eq 4$ and is never short. Subtracting a global length at most $1$ and a local length
  at most $lambda_1 < 1 \/ 10$ leaves its completion greater than $1$.
  Consequently intervals on either side can cover test points only on that side.

== 4 Packing from a vertex cover <sec:completeness>

#thm([Proposition 4.1.])[
  #emph[If the input graph has a vertex cover of size at most $k$, the constructed items can be packed into $B$ bins.]
] <prop:completeness>

#proof[
  Enlarge the cover to a set $C subset.eq V$ of exactly $k$ vertices.
    Call vertices of $C$ #emph[selected] and the others #emph[unselected].
    We first construct the $upright(M)$ bins separately at each vertex.
    The local construction will also be useful when no common cover is specified.
  ===== 4.1 Rows and auxiliary slots. <rows-and-auxiliary-slots.>
  At label $v$, put every $upright(T)_(+)$ and $upright(T)_(-)$ row into $upright(M)$.
    At each position in $cal(R)_v$, put the $d$ long $upright(S)$ rows into $upright(M)$ if $v$ is selected,
    and the $d$ short rows otherwise. There are $t_v + J_v$ such rows,
    hence this many slots for each of $upright(Z)$ and $upright(D)_(upright(M))$.
    The roots and padding give the useful bound
  #[#set math.equation(numbering: n => "(4.1)")
   $ t_v = P + d #scale(x: 120%, y: 120%)[\(] \| V \( T^(+) \) \| + \| V \( T^(-) \) \|
     #scale(x: 120%, y: 120%)[\)] gt.eq P + 2 d . $ <eq:local-slot-bound>]
  In particular the number of zero-length $upright(D)_(upright(M))$ copies is $t_v + J_v - P gt.eq 2 d + J_v$.
  At a selected vertex, choose $d$ distinct plus-root rows and give them length-one $upright(U)_(+)$ items;
    at an unselected vertex do the same with minus-root rows and length-one $upright(U)_(-)$ items.
    Reserve $d$ zero-length $upright(D)_(upright(M))$ copies for these funded rows.
    Every other $upright(M)$ row receives a length-zero global auxiliary:
    $upright(T)_(+)$ and $upright(S)$ require $upright(U)_(+)$, and $upright(T)_(-)$ requires $upright(U)_(-)$.
    Thus label $v$ has $t_(v \, +) + J_v$ plus slots and $t_(v \, -)$ minus slots.
    Globally the requested length-one counts are exactly $d k$ and $d \( n - k \)$;
    the total slots are precisely the respective global inventories.
    Consequently all global auxiliaries of these two subclasses can be assigned as distinct physical copies,
    exhausting their length-one and length-zero stocks.
  In the tree on the unfunded side, choose the separate $d$-fold marking from Lemma 5.
    For every marked depth-$ell$ vertex, choose one of its $d$ endpoint rows and attach a
    $upright(D)_(upright(M))$ item of length $lambda_ell$. The depth quota supplies enough such items.
    These marked rows are distinct and have positive depth, so none is a funded-root row.
    If $s_v$ nodes are marked, then $s_v lt.eq P$. After these assignments and the reserved root zeros,
    there are $t_v + J_v - s_v - d$ unassigned local slots. By Equation (4.1), this is at least $P - s_v$,
    the number of unused positive local items. Put those items in distinct remaining slots,
    then fill all other slots with the remaining zeros. This uses every $upright(D)_(upright(M))$ copy.
    All additional positive lengths move their rows earlier and cannot remove any coverage already obtained.
    The same argument applies when $v$ is isolated and $J_v = 0$.
  Attach a $upright(F)_(upright(T))$ flag to every tree row and a $upright(F)_(upright(M))$ flag to every
    $upright(S)$ row used here. These requests exhaust the $upright(F)_(upright(T))$ and $upright(F)_(upright(M))$
    inventories after summing over labels. From now on keep each row, its two auxiliaries, and its flag together.
  ===== 4.2 Coverage and deadlines. <coverage-and-deadlines.>
  For each such group, let $b$ be its row baseline and let
  $ h = b - Delta upright(bold(1)) { upright("row is short") } - "len" \( U \) - "len" \( D \) $
  be its completion coordinate, as in Lemma 10. Always $h lt.eq b$.
    Each funded-root row covers $\[ 0 \, 1 \)$ or $\[ 4 \, 5 \)$ through its interval $\[ h \, b \)$.
    Hence the $d$ funded roots cover every test interval on that side $d$ times,
    including all job intervals when plus is funded. At a marked depth-$ell$ node on the other side,
    the assigned local length gives precisely its cell with the right endpoint removed.
    By nesting in Lemma 7, this interval contains the test interval of every descendant leaf.
    The $d$-fold marking covers every leaf test on that side at least $d$ times.
    Finally, at an unselected vertex each job has $d$ short rows in $upright(M)$;
    even before any auxiliary shortening they cover its interval $\[ b_r - Delta \, b_r \)$.
    Thus every test interval receives at least $d$ covering intervals in either state.
  The baseline multiset of these $upright(M)$ rows is exactly the one defining $B_v \( a \)$:
    all tree baselines and $d$ copies of $b_r$ at each job, irrespective of the choice of short or long rows.
    Recall that $cal(I)_v$ is the union of the test intervals at $v$. For every real $a$,
  #[#set math.equation(numbering: n => "(4.2)")
   $ \# { h lt.eq a } = B_v \( a \) + \# { h lt.eq a < b } gt.eq B_v \( a \) +
     d upright(bold(1)) { a in cal(I)_v } . $ <eq:complete-prefix>]
  The last expression is the exact number of deadlines at most $a$.
    Here the left-closed, right-open convention includes a shifted deadline at the left endpoint and stops
    counting the extra copy when its original baseline enters at the right endpoint.
  Sort the completions as $h_1 lt.eq dots.h.c lt.eq h_(t_v + J_v)$ and the deadlines as $z_1 lt.eq dots.h.c lt.eq
    z_(t_v + J_v)$, retaining the identity of each copy. Equation (4.2) at $a = z_j$ shows $h_j lt.eq z_j$.
    Attach the $j$th deadline anchor to the group with completion $h_j$.
    Only the $upright(Z)$ anchors are permuted; the row, global auxiliary, local auxiliary,
    and flag stay together. All the anchors have the same subclass and label $v$,
    so every resulting tuple keeps its required pattern and equal labels.
    Its deadline inequality makes it feasible by Lemma 10.
  ===== 4.3 The remaining rows and edge resources. <the-remaining-rows-and-edge-resources.>
  At each incidence position, pair its remaining $d$ rows with its $d$ keys, using the exact position and label.
    Add distinct $upright(D)_(upright(G))$ copies of that label and $upright(F)_(upright(G))$ flags.
    The remaining rows are short at a selected vertex and long at an unselected vertex.
    For a $upright(W)$ item of the exact edge, the coordinate condition in Lemma 10 reduces to
  #[#set math.equation(numbering: n => "(4.3)")
   $ Delta #scale(x: 120%, y: 120%)[\(] upright(bold(1)) { upright("nonpermit") } -
     upright(bold(1)) { upright("row is short") } #scale(x: 120%, y: 120%)[\)] lt.eq 0 . $ <eq:exact-edge-completeness>]
  Thus a long row requires a permit, whereas a short row accepts either species.
  Each endpoint of an edge has $d R$ such slots. If exactly one endpoint is unselected,
    assign all $d R$ permits to its long rows and all $d R$ nonpermits to the selected endpoint’s short rows.
    If both endpoints are selected, all $2 d R$ rows are short;
    assign the $d R$ permits and the $d R$ nonpermits to these slots in any order.
    Since $C$ is a cover, these are the only cases. In both cases every $upright(W)$ copy is used,
    and all $upright(G)$ tuples are feasible.
  At label $v$ we have made $t_v + J_v$ bins of type $upright(M)$ and $J_v$ of type $upright(G)$.
    They use every labeled row, anchor, and local auxiliary once.
    Their flag counts are $t_v$ of $upright(F)_(upright(T))$ and $J_v$ each of $upright(F)_(upright(M))$ and
    $upright(F)_(upright(G))$, and all global inventories have been exhausted.
    Every bin follows Table 1 and has equal labels, so Lemmas 8 and 10 apply to the actual encoded sizes.
    The construction is a partition of all items into $sum_v \( t_v + 2 J_v \) = B$ feasible bins. ◻
]

== 5 The fractional packing <sec:fractional>

We construct a fractional packing of value $B$ for the four-vertex instance.
  Both configuration models are those of Definition 1; all feasible configurations are allowed,
  with no restriction to the table patterns used in our witness.
  The matching lower bound will follow from the five-item capacity limit.

#thm([Proposition 5.1.])[
  #emph[For the instance constructed from the complete graph on four vertices with $k = 2$,
    using the parameters in Equation (3.1), both configuration relaxations have value $B$:
$ "OPT"_(upright(L P \, i n d)) = "OPT"_(upright("LP")) = B . $

]
] <prop:fractional>

#proof[
  For each label $v$, construct the local groups from the proof of Proposition 11 twice,
    once selected and once unselected. In the selected state,
    put short rows in $upright(G)$ and require only nonpermits of the exact edge.
    In the unselected state, put long rows there and require only permits of the exact edge.
    Equation (4.3) holds with equality in both states. The local $upright(M)$ construction and deadline matching
    did not use neighboring states. Each state therefore gives a collection of $N_v = t_v +
    2 J_v$ feasible bin templates, using every physical copy in the labeled roles $X \, A \, D$ exactly once.
    Fix these labeled assignments in both states, including the local auxiliaries and the independently sorted
    anchors. The two remaining slots in a template specify a global-auxiliary species and a flag species.
  ===== 5.1 Exact resource demands. <exact-resource-demands.>
  Table 2 lists the required counts. The two $upright(W)$ rows refer to each edge $e$ incident to $v$.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Species
], table.cell(rowspan: 1, colspan: 1)[Selected
], table.cell(rowspan: 1, colspan: 1)[Unselected
], table.cell(rowspan: 1, colspan: 1)[Half of each
]),
  table.cell(rowspan: 1, colspan: 1)[$upright(U)_(+)$, length $1$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$d \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(U)_(+)$, length $0$
], table.cell(rowspan: 1, colspan: 1)[$t_(v \, +) + J_v - d$
], table.cell(rowspan: 1, colspan: 1)[$t_(v \, +) + J_v$
], table.cell(rowspan: 1, colspan: 1)[$t_(v \, +) + J_v - d \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(U)_(-)$, length $1$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$d \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(U)_(-)$, length $0$
], table.cell(rowspan: 1, colspan: 1)[$t_(v \, -)$
], table.cell(rowspan: 1, colspan: 1)[$t_(v \, -) - d$
], table.cell(rowspan: 1, colspan: 1)[$t_(v \, -) - d \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(W)$, permit of $e$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$d R$
], table.cell(rowspan: 1, colspan: 1)[$d R \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(W)$, nonpermit of $e$
], table.cell(rowspan: 1, colspan: 1)[$d R$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$d R \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(T))$
], table.cell(rowspan: 1, colspan: 1)[$t_v$
], table.cell(rowspan: 1, colspan: 1)[$t_v$
], table.cell(rowspan: 1, colspan: 1)[$t_v$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(M))$
], table.cell(rowspan: 1, colspan: 1)[$J_v$
], table.cell(rowspan: 1, colspan: 1)[$J_v$
], table.cell(rowspan: 1, colspan: 1)[$J_v$
],
  table.cell(rowspan: 1, colspan: 1)[$upright(F)_(upright(G))$
], table.cell(rowspan: 1, colspan: 1)[$J_v$
], table.cell(rowspan: 1, colspan: 1)[$J_v$
], table.cell(rowspan: 1, colspan: 1)[$J_v$
],
)
]],
    caption: [Table 2: Pooled-item demands at one vertex in the two local states. ],
  )
  Each entire local state can in fact choose distinct pooled copies from the actual inventories.
    Both length-one pools have $2 d$ copies, while a state needs at most $d$ of either.
    Every other vertex contributes at least $d$ root slots on each side, so the zero-length stocks satisfy
  $ sum_w \( t_(w \, +) + J_w \) - 2 d & gt.eq t_(v \, +) + J_v + d \,\
sum_w t_(w \, -) - 2 d & gt.eq t_(v \, -) + d . $
  These bounds exceed the respective largest local demands.
    Each permit or nonpermit pool of an incident edge has exactly $d R$ copies, enough for its local demand,
    and each flag pool contains at least the number required at one vertex.
    All pools requested by any template are therefore nonempty.
    Different local states may reuse copies; we will now allocate their fractional uses explicitly.
  Taking half of both states at every vertex gives total demand equal to every pooled stock.
    Indeed, summing over the four vertices gives $2 d$ length-one items on each side and exactly the prescribed
    zero-length counts. Each edge has two endpoints, which together request $d R$ permits and $d R$ nonpermits.
    Each flag has the same demand in both states, so its weighted total is also its inventory.
  ===== 5.2 Columns using physical copies. <columns-using-physical-copies.>
  For a template $b$, let $i_b^X \, i_b^A \, i_b^D$ be its fixed labeled copies.
    Let $cal(U)_b$ be the set of physical copies in its required global species,
    distinguishing side and length for $upright(U)_(+) \, upright(U)_(-)$,
    and edge and permit status for $upright(W)$. Let $cal(F)_b$ be the set of copies of its required flag.
    For every pair $\( u \, f \) in cal(U)_b times cal(F)_b$, assign the individual-copy configuration
  #[#set math.equation(numbering: n => "(5.1)")
   $ H_(b \, u \, f) = { i_b^X \, i_b^A \, u \, i_b^D \, f } quad upright("weight") quad
     frac(1, 2 \| cal(U)_b \| thin \| cal(F)_b \|) . $ <eq:physical-fractional-columns>]
  Do this for every template in both states of every vertex,
    adding weights whenever the same configuration is generated more than once.
    All five physical copies in a column are distinct because their roles are disjoint.
    Copies within either requested pool have identical encoded sizes; hence every generated column is feasible.
    Coincidences of numerical sizes between different declared species do not affect their disjoint physical
    indices or this argument.
  The columns generated by one template have total weight $1 \/ 2$.
    Every labeled item occurs in one template in each of its two local states, giving total coverage $1$.
    For a global pool $cal(U)$, each requesting template contributes $1 \/ \( 2 \| cal(U) \| \)$ to each copy’s
    coverage after summing over flag choices. Its total half-weight demand equals $\| cal(U) \|$, as just proved,
    so each global copy also has coverage $1$. The same calculation, summing over global choices,
    gives coverage $1$ for each flag copy. Equation (5.1) therefore defines a feasible solution of Equation (1.2),
    with objective
  $ sum_(v = 1)^4 (N_v / 2 + N_v / 2) = B . $
  Project each individual configuration to its vector of multiplicities of equal numerical sizes,
    and sum the weights of configurations with the same vector.
    Capacity is unchanged, and summing the individual coverage equalities over copies of a given size gives its
    required multiplicity. This proves $"OPT"_(upright("LP")) lt.eq B$ for the ordinary type LP,
    including when different species have equal sizes.
  Finally, Lemma 8 gives $a_i > 1 \/ 6$ for every item. Every feasible configuration consequently has cardinality
    at most five, counting multiplicity in the type formulation.
    Giving dual weight $1 \/ 5$ to every physical item, or to every numerical size type,
    is therefore feasible for the respective covering LP. Both dual objectives equal $\| cal(I) \| \/ 5 =
    5 B \/ 5 = B$. Thus both relaxations have value exactly $B$.
  This construction uses feasible local bin configurations.
    It does not require a vertex cover of size two in the four-vertex clique,
    nor an integral packing obtained by making those local choices simultaneously.
    The integral lower bound will follow separately from Proposition 13. ◻
]

== 6 Extracting a small vertex cover <sec:soundness>

#thm([Proposition 6.1.])[
  (Soundness).  #emph[If the instance of Theorem 6 packs into at most $B + c$ bins,
    then its input graph has a vertex cover of size at most $k + rho n$.]
] <prop:soundness>

We first use deadline prefixes to force coverage at every test point.
  The competing trees then force a large global allocation on one side of each vertex.
  Repeated edge jobs turn the plus allocations into a vertex cover,
  whose size is bounded by the global item inventories.

Fix such a packing throughout this section. By Lemma 9, at most $3
  K$ anchors of any fixed label fail to belong to good tuples.
  This bound applies to every subset of that label’s anchors,
  including any chosen collection of deadlines or keys. Summing over labels gives a bound of $3 n K$ when needed.

Let $cal(M)_v$ be the set of good $upright(M)$ tuples of label $v$.
  Each has a row baseline $b$, a completion coordinate $h lt.eq b$,
  and the associated coverage interval $\[ h \, b \)$. Write $x_v^(+)$ and $x_v^(-)$ for the numbers of these
  tuples using, respectively, a length-one $upright(U)_(+)$ or $upright(U)_(-)$ item.
  Distinct tuples use distinct items, so the inventories give

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_v x_v^(+) lt.eq d k \, wide sum_v x_v^(-) lt.eq d \( n - k \) \, wide sum_v \( x_v^(+) + x_v^(-) \) lt.eq
   d n . $ <eq:sound-global-budgets>]

All interval counts below include multiplicities of tuples.

=== 6.1 Coverage and a forced side <coverage-and-a-forced-side>

For a real point $a$, define

$ A_v \( a \) = \# { M in cal(M)_v : b \( M \) lt.eq a } \, wide C_v \( a \) = \# { M in cal(M)_v :
  h \( M \) lt.eq a } \, $

and let $I_v \( a \)$ count the intervals of $cal(M)_v$ containing $a$.
  Because $h lt.eq b$, the identity $upright(bold(1)) { h lt.eq a } = upright(bold(1)) { b lt.eq a } +
  upright(bold(1)) { h lt.eq a < b }$ holds even at tied endpoints. Consequently

#[#set math.equation(numbering: n => "(6.2)")
 $ C_v \( a \) = A_v \( a \) + I_v \( a \) . $ <eq:sound-prefix-decomposition>]

The function $B_v \( a \)$ remains the original baseline prefix used to define the deadlines;
  it need not equal $A_v \( a \)$ in this packing.

#thm([Lemma 6.2.])[
  (Coverage at every test point).  #emph[For every label $v$ and every point $a$ in one of its half-open test intervals,
#[#set math.equation(numbering: n => "(6.3)")
 $ I_v \( a \) gt.eq d - 6 K . $ <eq:sound-test-coverage>]

]
] <lem:coverage>

#proof[
  There are exactly $B_v \( a \) + d$ deadlines at most $a$.
    At least $B_v \( a \) + d - 3 K$ of their anchors are good.
    Their distinct $upright(M)$ matches have $h lt.eq z lt.eq a$ by Lemma 10, giving
  #[#set math.equation(numbering: n => "(6.4)")
   $ C_v \( a \) gt.eq B_v \( a \) + d - 3 K . $ <eq:sound-completion-prefix>]
  The deadline formula uses the half-open test convention: moving $d$ copies from a right endpoint $r_0$ to a left
    endpoint $ell_0$ changes the prefix by
    $d \( upright(bold(1)) { ell_0 lt.eq a } - upright(bold(1)) { r_0 lt.eq a } \) =
    d upright(bold(1)) { ell_0 lt.eq a < r_0 }$.
  Let $N'$ be the number of positions in $cal(R)_v$ with $b_r lt.eq a$.
    There are $2 d N'$ actual $upright(S)$ rows at those positions and $d N'$ keys there.
    At least $d N' - 3 K$ of these keys have good $upright(G)$ matches.
    The row-order conclusion of Lemma 10 places all their rows in this same baseline prefix.
    Since these are distinct rows, at most
  $ 2 d N' - \( d N' - 3 K \) = d N' + 3 K $
  of the prefix’s $upright(S)$ rows can occur in good $upright(M)$ tuples.
    This inequality is valid also when $d N' - 3 K < 0$. Other uses of prefix rows only reduce the number
    available. The $upright(T)_(+) \, upright(T)_(-)$ rows contribute at most their entire original baseline
    prefix. Since $B_v \( a \)$ includes exactly $d N'$ hypothetical job baselines, we obtain
  #[#set math.equation(numbering: n => "(6.5)")
   $ A_v \( a \) lt.eq B_v \( a \) + 3 K . $ <eq:sound-baseline-prefix>]
  Subtracting Equation (6.5) from Equation (6.4) and using Equation (6.2) proves the claim. ◻
]

#thm([Lemma 6.3.])[
  (A large count on one side).  #emph[Every vertex $v$ satisfies
#[#set math.equation(numbering: n => "(6.6)")
 $ x_v^(+) gt.eq d - 6 K wide upright("or") wide x_v^(-) gt.eq d - 6 K . $ <eq:sound-side-choice>]

]
] <lem:side-choice>

#proof[
  A length-one global item can contribute coverage only on its own side.
    Indeed, a minus row has baseline at least $4$, is not short, and has completion at least $4 - 1 -
    lambda_1 > 1$. Every plus row, including each $upright(S)$ row, has baseline at most $1$,
    so its interval cannot cover a minus test point.
  Choose one interior point in each tree leaf cell. A tuple whose global and local lengths are both zero has an
    empty interval unless its row is short. In the latter case its interval is exactly its job test interval,
    which is disjoint from all leaf cells. For a tuple with global length zero and positive local length
    $lambda_ell$, the interval length is at most
  $ lambda_ell + Delta lt.eq 11 / 10 lambda_ell < 3 lambda_ell . $
  By Lemma 7, it therefore meets at most one closed depth-$ell$ cell across the two trees.
    If there is such a cell, mark its tree vertex. In particular, if the interval covers a chosen leaf point,
    that point belongs to its depth-$ell$ ancestor cell; the marked vertex is this ancestor.
    This reasoning depends on the interval’s length, regardless of the row’s baseline or depth.
  Make these marks for all global-zero, positive-local tuples of label $v$,
    merging repeated marks at the same tree vertex. At depth $ell$,
    the number of marks across both trees is at most the number of used length-$lambda_ell$ local items,
    hence at most $p_ell$. All marks are at positive depths. The retained depths in Lemma 5 ensure that every leaf
    has the ancestor used above.
  If both counts in Equation (6.6) were less than $d - 6 K$,
    Lemma 14 would force every chosen leaf point to be covered by some global-zero, positive-local tuple.
    The marks would then hit every root-to-leaf path in both trees,
    contrary to the combined-quota obstruction of Lemma 5. ◻
]

=== 6.2 Job positions and displaced rows <job-positions-and-displaced-rows>

The forced side at each vertex does not yet ensure that every graph edge is covered.
  We must connect the plus allocation to the incident jobs.
  A key may use an earlier row, so this connection requires an explicit count of displaced rows rather than an
  assumption of position-by-position matching.

For each label $v$, exclude a position $r in cal(R)_v$ if its closed job cell $\[ b_r - Delta \, b_r \]$ meets a
  coverage interval from a good $upright(M)$ tuple of that label with global length zero and positive local
  length. This definition uses closed cells; the tested coverage intervals remain half-open.
  Such a tuple’s interval has length at most $lambda_1 + Delta < g - Delta$, by Lemma 7.
  Distinct job cells have gap at least $g - Delta$, so the interval meets at most one of them.
  There are at most $P$ positive local items of label $v$. Thus at most $P$ positions are excluded in all of
  $cal(R)_v$, and each incident edge retains at least $R - P$ nonexcluded positions.

For $r in cal(R)_v$, let $L_(v \, r)$ be the number of good $upright(G)$ tuples whose key is at $r$ and whose row
  is a long row of that same position.

#thm([Lemma 6.4.])[
  (Long matches at a nonexcluded job).  #emph[Every nonexcluded position $r in cal(R)_v$ satisfies
#[#set math.equation(numbering: n => "(6.7)")
 $ L_(v \, r) gt.eq d - x_v^(+) - 9 K . $ <eq:sound-long-matches>]

]
] <lem:job-matches>

#proof[
  Test at the interior point $a = b_r - Delta \/ 2$. Since position gaps are at least $g > Delta$,
    the job baselines at most $a$ are exactly those at positions strictly earlier than $r$.
    Let $N'$ count those positions, and let $xi$ count the good tuples whose key is at $r$ and whose row is from a
    strictly earlier position.
  The good keys at earlier positions consume at least $d N' - 3 K$ distinct rows from the earlier prefix,
    by the same order argument as in Lemma 14. The $xi$ current-key matches consume an additional $xi$ rows from
    that prefix: their keys are distinct from the earlier keys, and a packing cannot use one row in two tuples.
    Among its $2 d N'$ rows, at most $d N' + 3 K - xi$ can therefore appear in good $upright(M)$ tuples.
    Including the original tree-row prefix gives the strengthened bound
  #[#set math.equation(numbering: n => "(6.8)")
   $ A_v \( a \) lt.eq B_v \( a \) + 3 K - xi . $ <eq:sound-displaced-prefix>]
  Let $u$ count the short rows of the current position $r$ used in good $upright(M)$ tuples.
    Every interval covering $a$ is accounted for as follows:
  - Tuples with global length one contribute at most $x_v^(+)$ in total,
    since minus tuples cannot reach this plus-side point.
  - A global-zero tuple with positive local length contributes nothing, since the position was not excluded.
  - With both lengths zero, a tree row or a long job row has an empty interval.
    A short row covers only its own job interval, so it can cover $a$ only at the current position.
  It follows that
  #[#set math.equation(numbering: n => "(6.9)")
   $ I_v \( a \) lt.eq x_v^(+) + u . $ <eq:sound-job-coverage-upper>]
  A current short row with global length one may be counted in both $x_v^(+)$ and $u$;
    this only enlarges the upper bound.
  Combine Equations (6.2), (6.4), (6.8), and (6.9) to obtain
  $ B_v \( a \) + d - 3 K lt.eq B_v \( a \) + 3 K - xi + x_v^(+) + u . $
  Equivalently,
  #[#set math.equation(numbering: n => "(6.10)")
   $ u - xi gt.eq d - x_v^(+) - 6 K . $ <eq:sound-xi-correction>]
  Here the same $3 K$ loss controls the entire earlier-key prefix; it is not incurred separately at its positions.
  At least $d - 3 K$ keys at $r$ are in good tuples. Exactly $xi$ of the good matches use earlier rows,
    and the row-order restriction forces every other good match to use a row at $r$.
    At most $d - u$ of the short rows there are available to these matches,
    because $u$ have already been used in good $upright(M)$ tuples.
    Any other use of a short row only lowers this availability. Hence
  $ L_(v \, r) gt.eq d - 3 K - xi - \( d - u \) = u - xi - 3 K gt.eq d - x_v^(+) - 9 K \, $
  as required. ◻
]

=== 6.3 Edge capacity and the threshold cover <edge-capacity-and-the-threshold-cover>

#thm([Lemma 6.5.])[
  (The threshold set covers every edge).  #emph[The set
$ C = { v : x_v^(+) > d \/ 8 } $

 is a vertex cover.]
] <lem:edge-cover>

#proof[
  Fix an edge index $e$, with endpoints $v_1 \, v_2$. There are exactly $2 d
    R \( e - 1 \)$ $upright(W)$ items belonging to earlier edges, counting both permits and nonpermits.
    This equals the total number of earlier-edge keys over all labels, since each edge has two endpoints.
    At least $2 d R \( e - 1 \) - 3 n K$ of those keys are in good tuples.
    By the edge-order conclusion of Lemma 10, each consumes a distinct $upright(W)$ item from the earlier-edge
    inventory. At most $3 n K$ earlier-edge items therefore remain for all other uses,
    including good matches of keys on edge $e$. This is one global loss bound,
    independent of the number of earlier edges. Uses in other tuples only reduce the remaining supply.
  In an exact-position long match to a key on edge $e$, the $upright(G)$ inequality becomes
  $ beta_f - beta_e + Delta upright(bold(1)) { upright("nonpermit") } lt.eq 0 \, $
  where $f$ is the edge of its $upright(W)$ item. Lemma 10 gives $f lt.eq e$; if $f = e$,
    the item must be a permit. Thus every match counted by $L_(v \, \( e \, j \))$ uses either one of the $d
    R$ edge-$e$ permits or an earlier-edge item. Summing over both endpoints and all positions gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ sum_(v in { v_1 \, v_2 }) sum_(j = 1)^R L_(v \, \( e \, j \)) lt.eq d R + 3 n K . $ <eq:sound-edge-capacity>]
  Suppose that both endpoints were outside $C$, so that their plus counts were at most $d \/ 8$.
    By $d gt.eq 72 K$ and Lemma 16, each nonexcluded position at either endpoint would have
  $ L_(v \, \( e \, j \)) gt.eq d - d / 8 - 9 K gt.eq frac(3 d, 4) . $
  There are at least $R - P$ such positions at each endpoint.
    Their total demand would therefore be at least $2 \( R - P \) \( 3 d \/ 4 \)$.
    Its excess over the upper bound in Equation (6.11) is strictly positive:
  $ 2 \( R - P \) frac(3 d, 4) - \( d R + 3 n K \) & = d / 2 \( R - 3 P \) - 3 n K\
 & = frac(97 d, 2) P + \( 50 d - 3 \) n K + 50 d > 0 \, $
  using $R = 100 \( P + n K + 1 \)$ and $d gt.eq 1$. This contradiction proves that every edge meets $C$. ◻
]

#thm([Lemma 6.6.])[
  (Cardinality of the extracted cover).  #emph[The set $C$ in Lemma 17 satisfies
$ \| C \| lt.eq frac(d k, d - 6 K) + frac(48 K n, d) lt.eq k + frac(60 K n, d) lt.eq k + rho n . $

]
] <lem:cover-size>

#proof[
  Let
  $ V_(+) = { v : x_v^(+) gt.eq d - 6 K } . $
  Since $d gt.eq 72 K$, we have $d - 6 K > d \/ 8$, so $V_(+) subset.eq C$. The plus-item budget in Equation (6.1) gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| V_(+) \| lt.eq frac(d k, d - 6 K) . $ <eq:sound-large-plus-count>]
  For each vertex in $V_(+)$, charge its plus count; for every other vertex, charge its minus count.
    Lemma 15 makes each of these charges at least $d - 6 K$. Exactly one side is charged at each vertex,
    even if both sides have large counts. The total charges are therefore at least $n \( d - 6 K \)$,
    while the total of all counts is at most $d n$. Every plus count outside $V_(+)$ is uncharged, so
  #[#set math.equation(numbering: n => "(6.13)")
   $ sum_(v in.not V_(+)) x_v^(+) lt.eq d n - n \( d - 6 K \) = 6 K n . $ <eq:sound-residual-plus>]
  Each vertex of $C \\ V_(+)$ contributes more than $d \/ 8$ to this sum.
    The resulting weak bound, valid also when that set is empty, is
  $ \| C \\ V_(+) \| lt.eq frac(48 K n, d) . $
  Together with Equation (6.12), this proves the first asserted inequality.
    For the second, use $k lt.eq n$ and $d gt.eq 12 K$ to bound
  $ frac(d k, d - 6 K) - k = frac(6 K k, d - 6 K) lt.eq frac(12 K n, d) . $
  The final inequality follows from $d gt.eq 120 K \/ rho$. ◻
]

#proof[
  Starting from the given packing, Lemma 17 produces the cover $C$, and Lemma 18 bounds its cardinality by $k +
    rho n$. All deductions used only the stipulated item inventories, the good-tuple properties,
    and the prescribed parameters, so they apply to every packing into at most $B + c$ bins. ◻
]

The polynomial construction in Section 3, integral completeness in Proposition 11,
  and the preceding soundness proof together establish Theorem 6.

== 7 Consequences <sec:consequences>

The reduction and fractional construction now give the unconditional configuration gap.
  We then use a satisfiability gap to obtain the algorithmic hardness result.

=== 7.1 The unconditional configuration gap <the-unconditional-configuration-gap>

#proof[
  Fix an integer $c gt.eq 0$, set $rho = 1 \/ 8$, and apply the actual construction of Theorem 6 to the
    four-vertex clique with $k = 2$. All parameters, including $d$, the trees, and $R = 100 \( P + 4 K + 1 \)$,
    are chosen as prescribed for these constants. The minimum vertex cover of this graph has size three, whereas
  #[#set math.equation(numbering: n => "(7.1)")
   $ k + rho n = 2 + 4 / 8 = 5 / 2 < 3 . $ <eq:clique-cover-contradiction>]
  Proposition 13 therefore rules out every packing into at most $B + c$ bins.
    Independently, Proposition 12 gives configuration-LP value exactly $B$,
    for both individual-copy and numerical-type configurations. This proves Equation (1.4) for every $c$. ◻
]

The structural proof uses only the four-vertex clique, the finite construction, the fractional witness,
  and the soundness bound. The PCP Theorem enters only the algorithmic hardness argument below.

=== 7.2 A vertex-cover gap with perfect completeness <a-vertex-cover-gap-with-perfect-completeness>

We use the following standard consequence of the PCP Theorem.
  For some absolute constant $eta > 0$, it is NP-hard to distinguish satisfiable formulas having exactly three
  literal slots per clause from formulas in which no assignment satisfies more than a $1 -
  eta$ fraction of the clauses. The clause list may be required to be nonempty.
  Håstad’s Theorem 6.5 [9] gives this statement with $eta = 1 \/ 16$ by taking $epsilon =
  1 \/ 16$ in its $7 \/ 8 + epsilon$ soundness bound. In particular the YES case is fully satisfiable,
  as needed for the completeness direction of our reduction.

We use a literal-slot version of the complement of the satisfiability-to-clique graph described by Karp [13]
  p. 97. Given such a formula with $M gt.eq 1$ clauses, create three vertices for its literal slots in each clause
  and join those vertices into a triangle. Also join any two slots occupied by complementary literals,
  retaining only one edge when an edge is specified more than once. The result is a simple graph with

#[#set math.equation(numbering: n => "(7.2)")
 $ n = 3 M \, wide k = 2 M = 2 n \/ 3 . $ <eq:clause-graph-parameters>]

Every vertex lies in a triangle, so the graph has no isolated vertices and at least one edge.
  The construction is polynomial in the explicit formula encoding.

An independent set selects at most one slot from any clause and never selects complementary literals.
  Setting its selected literals true and extending the assignment arbitrarily satisfies at least as many clauses
  as the cardinality of the independent set. Conversely, from any assignment choose one true slot in each
  satisfied clause. These slots form an independent set. Thus,
  writing $"MAXSAT" \( F \)$ for the largest number of simultaneously satisfiable clauses,
  $alpha \( G \)$ for the maximum independent-set size, and $tau \( G \)$ for the minimum vertex-cover size,

#[#set math.equation(numbering: n => "(7.3)")
 $ alpha \( G \) = "MAXSAT" \( F \) \, wide tau \( G \) = 3 M - "MAXSAT" \( F \) . $ <eq:clause-graph-identity>]

This argument also permits repeated literals and clauses. The minimum cover is $k$ in the satisfiable case and at least

#[#set math.equation(numbering: n => "(7.4)")
 $ \( 2 + eta \) M = k + eta / 3 n $ <eq:vertex-cover-gap>]

in the other case.

=== 7.3 Additive hardness and the complexity equivalence <additive-hardness-and-the-complexity-equivalence>

#proof[
  Fix $c gt.eq 0$ and fix $0 < rho < eta \/ 3$, for example $rho = 1 \/ 96$ with the preceding choice of $eta$.
    Apply Theorem 6 to the clause graph and target in Equation (7.2).
    The resulting rational list and integer $B$ have polynomial encoding length and are computable in polynomial
    time for these fixed $c \, rho$.
  In the satisfiable case the graph has a cover of size $k$, and Proposition 11 gives a packing into $B$ bins.
    In the other case, a packing into at most $B + c$ bins would, by Proposition 13,
    give a cover of size at most $k + rho n$. This contradicts Equation (7.4).
    All constructed sizes exceed $1 \/ 6$. The promised distinction is therefore NP-hard. ◻
]

#proof[
  Suppose such an algorithm exists, and fix a nonnegative integer $c$ at least as large as its additive constant
    $C$. On a YES instance of Theorem 3, the algorithm must return at most $"OPT" \( I \) + C lt.eq B + c$ bins.
    On a NO instance, no packing using that many bins exists.
    Counting the bins in the returned packing distinguishes the two cases in deterministic polynomial time.
    Hence $sans(P) = sans(N P)$.
  Conversely, assume $sans(P) = sans(N P)$. For an explicit rational list of $N$ items and a bound $b lt.eq N$,
    bin feasibility belongs to $sans(N P)$: a certificate assigns each item a bin index,
    and every capacity constraint can be checked with exact rational arithmetic in polynomial bit time.
    The same statement holds when some item assignments have already been fixed.
    Under the assumption these decision problems are solvable in polynomial time.
    Binary search over $0 lt.eq b lt.eq N$ finds the optimum.
    Then assign items successively, trying at most $b$ bin indices at each step and retaining one for which a
    completion remains feasible. At most $N^2$ further tests construct an optimal packing.
    The empty list is handled directly. This gives the desired algorithm with $C = 0$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J.~M. Anthonisse. A note on equivalent systems of linear Diophantine equations.
  #emph[Zeitschrift für Operations Research], 17:167--177, 1973. #link("https://ir.cwi.nl/pub/28046").]
#bibitem([2])[Alberto Caprara, Mauro Dell'Amico, José Carlos Díaz-Díaz, Manuel Iori, and Romeo Rizzi.
  Friendly bin packing instances without Integer Round-up Property.
  #emph[Mathematical Programming], 150(1):5--17, 2015. #link("https://doi.org/10.1007/s10107-014-0791-z").]
#bibitem([3])[Parinya Chalermsook and Julia Chuzhoy. Resource minimization for fire containment.
  In #emph[Proceedings of the Twenty-First Annual ACM--SIAM Symposium on Discrete Algorithms (SODA)],
  pages 1334--1349, 2010. #link("https://doi.org/10.1137/1.9781611973075.108").]
#bibitem([4])[Friedrich Eisenbrand, Naonori Kakimura, Thomas Rothvoß, and Laura Sanità.
  Set covering with ordered replacement: Additive and multiplicative gaps.
  In #emph[Integer Programming and Combinatorial Optimization (IPCO)],
  volume 6655 of #emph[Lecture Notes in Computer Science], pages 170--182. Springer, 2011.
  #link("https://doi.org/10.1007/978-3-642-20807-2_14").]
#bibitem([5])[Friedrich Eisenbrand, Dömötör Pálvölgyi, and Thomas Rothvoß.
  Bin packing via discrepancy of permutations. #emph[ACM Transactions on Algorithms], 9(3), Article 24,
  pages 1--15, 2013. #link("https://doi.org/10.1145/2483699.2483704").]
#bibitem([6])[W.~Fernandez de la Vega and George~S. Lueker.
  Bin packing can be solved within $1 + epsilon$ in linear time. #emph[Combinatorica], 1(4):349--355, 1981.
  #link("https://doi.org/10.1007/BF02579456").]
#bibitem([7])[P.~C. Gilmore and R.~E. Gomory. A linear programming approach to the cutting-stock problem.
  #emph[Operations Research], 9(6):849--859, 1961. #link("https://doi.org/10.1287/opre.9.6.849").]
#bibitem([8])[Michel~X. Goemans and Thomas Rothvoß. Polynomiality for bin packing with a constant number of item
  types. In #emph[Proceedings of the Twenty-Fifth Annual ACM--SIAM Symposium on Discrete Algorithms (SODA)],
  pages 830--839, 2014. #link("https://doi.org/10.1137/1.9781611973402.61").]
#bibitem([9])[Johan Håstad. Some optimal inapproximability results.
  #emph[Journal of the ACM], 48(4):798--859, 2001. #link("https://doi.org/10.1145/502090.502098").]
#bibitem([10])[Rebecca Hoberg and Thomas Rothvoss. A logarithmic additive integrality gap for bin packing.
  In #emph[Proceedings of the Twenty-Eighth Annual ACM--SIAM Symposium on Discrete Algorithms (SODA)],
  pages 2616--2625, 2017. #link("https://doi.org/10.1137/1.9781611974782.172").]
#bibitem([11])[Klaus Jansen, Lis Pirotton, and Malte Tutas. The support of bin packing is exponential.
  In #emph[33rd Annual European Symposium on Algorithms (ESA)],
  volume 351 of #emph[Leibniz International Proceedings in Informatics], pages 48:1--48:16, 2025.
  #link("https://doi.org/10.4230/LIPIcs.ESA.2025.48").]
#bibitem([12])[Narendra Karmarkar and Richard~M. Karp. An efficient approximation scheme for the one-dimensional
  bin-packing problem. In #emph[Proceedings of the 23rd Annual Symposium on Foundations of Computer Science
  (FOCS)], pages 312--320, 1982.
  #link("https://pagesperso.g-scop.grenoble-inp.fr/~newmana/OptApproxFall2016/Karmarker-Karp-BinPacking.pdf").]
#bibitem([13])[Richard~M. Karp. Reducibility among combinatorial problems. In Raymond~E. Miller and James~W.
  Thatcher, editors, #emph[Complexity of Computer Computations], pages 85--103. Plenum Press, 1972.
  #link("https://doi.org/10.1007/978-1-4684-2001-2_9").]
#bibitem([14])[Vadim~M. Kartak, Artem~V. Ripatti, Guntram Scheithauer, and Sascha Kurz.
  Minimal proper non-IRUP instances of the one-dimensional cutting stock problem.
  #emph[Discrete Applied Mathematics], 187:120--129, 2015. #link("https://doi.org/10.1016/j.dam.2015.02.020").]
#bibitem([15])[Tomohiro Koana and Soh Kumabe. High-Multiplicity Bin Packing is FPT. Preprint, September 15, 2026.
  #link("https://arxiv.org/abs/2609.16923v1").]
#bibitem([16])[Odile Marcotte. The cutting stock problem and integer rounding.
  #emph[Mathematical Programming], 33:82--92, 1985. #link("https://doi.org/10.1007/BF01582013").]
#bibitem([17])[Odile Marcotte. An instance of the cutting stock problem for which the rounding property does not
  hold. #emph[Operations Research Letters], 4(5):239--243, 1986. #link("https://doi.org/10.1016/0167-6377(86)90009-X").]
#bibitem([18])[Alantha Newman, Ofer Neiman, and Aleksandar Nikolov. Beck's three permutations conjecture:
  A counterexample and some consequences. In #emph[Proceedings of the 53rd Annual IEEE Symposium on Foundations of
  Computer Science (FOCS)], pages 253--262, 2012. #link("https://doi.org/10.1109/FOCS.2012.84").]
#bibitem([19])[Thomas Rothvoß. Approximating bin packing within
  $O \( log upright(O P T) dot.op log log upright(O P T) \)$ bins.
  In #emph[Proceedings of the 54th Annual IEEE Symposium on Foundations of Computer Science (FOCS)],
  pages 20--29, 2013. #link("https://doi.org/10.1109/FOCS.2013.11").]
#bibitem([20])[Guntram Scheithauer and Johannes Terno. The modified integer round-up property of the
  one-dimensional cutting stock problem. #emph[European Journal of Operational Research], 84(3):562--571, 1995.
  #link("https://doi.org/10.1016/0377-2217(95)00022-I").]
#bibitem([21])[Guntram Scheithauer and Johannes Terno. Theoretical investigations on the modified integer round-up
  property for the one-dimensional cutting stock problem. #emph[Operations Research Letters], 20(2):93--100, 1997.
  #link("https://doi.org/10.1016/S0167-6377(96)00047-8").]
#bibitem([22])[David~P. Williamson and David~B. Shmoys. #emph[The Design of Approximation Algorithms].
  Cambridge University Press, 2011. #link("https://designofapproxalgs.com/book.pdf").]
