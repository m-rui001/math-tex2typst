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

#align(center)[#text(size: 16pt, weight: "bold")[Balanced counterexamples to Ryser's conjecture at prime orders]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

A vertex cover of a finite hypergraph $H$ is a set of vertices meeting every edge.
  Its minimum possible size is the #emph[covering number] $tau \( H \)$.
  The #emph[matching number] $nu \( H \)$ is the maximum number of pairwise disjoint edges.
  For an integer $r gt.eq 2$, an $r$-partite $r$-uniform hypergraph has disjoint vertex parts $V_1 \, dots.h \,
  V_r$, and each edge contains exactly one vertex from each part.
  Here #emph[balance] refers to equal sizes of the vertex parts.
  Ryser’s covering conjecture proposes that every such hypergraph satisfies

#[#set math.equation(numbering: n => "(1)")
 $ tau \( H \) lt.eq \( r - 1 \) nu \( H \) . $ <eq:ryser>]

A hypergraph with at least one edge is #emph[intersecting] if every two distinct edges meet.
  In this case $nu \( H \) = 1$, and the proposed bound is $r - 1$.
  A cover may use vertices from any of the parts, so making each individual part large does not by itself obstruct
  a small cover.

For $r = 2$, inequality (1) is Kőnig’s matching theorem for bipartite graphs.
  Henderson’s 1971 thesis contains an equivalent formulation of the general
  conjecture #cite(label("Henderson1971")); Best and Wanless #cite(label("BestWanless2018")) discuss its
  attribution to Ryser and separate it from his Latin-square transversal conjecture.
  Aharoni proved the full tripartite case #cite(label("Aharoni2001")).
  In the intersecting case, Gyárfás proved the conjecture through rank four and Tuza proved rank five;
  see Király and Tóthmérész #cite(label("KiralyTothmeresz2017")) for the historical account.
  For #emph[linear] intersecting hypergraphs, in which every two distinct edges meet in exactly one vertex,
  Francetić, Herke, McKay, and Wanless established the conjecture through rank
  nine #cite(label("FranceticHerkeMcKayWanless2017")). For each of $r = 4 \, 5$,
  Haxell and Scott proved a bound $tau \( H \) lt.eq \( r - epsilon_r \)
  nu \( H \)$ with a positive constant $epsilon_r$ #cite(label("HaxellScott2012")).
  More recently, White proved $tau \( H \) lt.eq 6$ for four-partite four-uniform hypergraphs with $nu \( H \) =
  2$ #cite(label("White2026")). These results concern the covering inequality itself.
  Lovász proposed the stronger assertion that, in every $r$-partite $r$-uniform hypergraph with at least one edge,
  deleting $r - 1$ vertices can reduce the matching number.
  Clow, Haxell, and Mohar disproved that assertion at $r = 3$ #cite(label("ClowHaxellMohar2025")); Abiad, Garbe,
  Povill, and Spiegel subsequently gave an infinite family at $r = 3$ and examples at $r =
  4$ #cite(label("AbiadGarbePovillSpiegel2025")). Those examples do not contradict (1).

Finite planes explain why the bound $r - 1$ is natural. In the affine plane $bb(F)_q^2$,
  make one part for each of the $q + 1$ directions, with one vertex for each line of that direction.
  An affine point determines an edge consisting of the labels of the lines through it.
  Two such edges meet at the label of their joining line. Each parallel class is a cover of size $q$,
  and fewer than $q$ lines cannot cover $q^2$ points. Thus this hypergraph is intersecting and has covering number
  $q$. It is the usual truncated-projective-plane example, expressed through affine duality.

Abu-Khazneh, Barát, Pokrovskiy, and Szabó exploit the rigidity of minimum covers in a truncated plane and add a
  new part and exceptional edges. For every prime power $q gt.eq 3$,
  their construction yields an intersecting $\( q + 2 \)$-partite $\( q + 2 \)$-uniform hypergraph with covering
  number $q + 1$ #cite(label("AbuKhaznehBaratPokrovskiySzabo2019")) Theorem 1.2, Lemma 1.3, Corollary 1.4.
  Haxell and Scott use affine planes to construct intersecting $r$-partite $r$-uniform hypergraphs with covering
  number at least $r - 4$ for every sufficiently large $r$, and at least $r -
  3$ when $r$ is even #cite(label("HaxellScott2017")) Theorem 6.

Equal part sizes alone do not force a large covering number:
  Francetić, Herke, McKay, and Wanless constructed a linear intersecting 13-partite hypergraph with 13 nonisolated
  vertices in each part, and reported that its covering number is nine by
  computation #cite(label("FranceticHerkeMcKayWanless2017")) Section 3.1.
  Here we modify the affine-plane example while keeping $q + 1$ parts, one for each direction.
  The modification raises both the covering number and each part size to $q + 1$.

#thm([Theorem 1.1.])[
  #emph[There exists $q_0$ such that, for every prime $q gt.eq q_0$,
    there is a finite intersecting $\( q + 1 \)$-partite $\( q + 1 \)$-uniform hypergraph $H$ with
$ \| V_1 \| = dots.h.c = \| V_(q + 1) \| = q + 1 \, wide tau \( H \) = q + 1 . $

 Every vertex belongs to an edge.]
] <thm:main>

Since $nu \( H \) = 1$, this gives counterexamples to (1).
  The value $tau \( H \) = r$, where $r = q + 1$, is the largest possible for an intersecting $r$-uniform
  hypergraph, since any edge is a cover. The nonisolated vertices in each part also form a cover,
  so a hypergraph with $tau \( H \) = r$ must have at least $r$ such vertices in every part.
  Our construction attains this minimum simultaneously in all parts.

The argument produces an example for each prime beyond one fixed threshold; that threshold is not numerical.
  The companion article #cite(label("OpenAIExtension2026")) Theorem 1.1 treats a different range of field orders:
  for every sufficiently large prime $s equiv 2 med \( mod med 3 \)$, it gives counterexamples of order $q =
  s^n$ for every sufficiently large odd $n$, with the threshold for $n$ depending on $s$.
  Its theorem does not assert balance. The proof here is independent of that construction.

=== 1.1 Monochromatic tree covers <monochromatic-tree-covers>

An $r$-edge-coloring assigns one of $r$ colors to each edge of a graph.
  A monochromatic tree cover is a family of monochromatic trees whose vertex sets cover the graph;
  overlaps and singleton trees are allowed. Gyárfás’s tree-cover conjecture asks for at most $r -
  1$ such trees in every $r$-edge-colored complete graph #cite(label("Milicevic2017")) Conjecture 1.
  Erdős, Gyárfás, and Pyber record the equivalence of this covering formulation with the intersecting case of
  Ryser’s conjecture #cite(label("ErdosGyarfasPyber1991")) Section 3, after Theorem 2.
  The standard transfer gives the following consequence of Theorem 1.

#thm([Corollary 1.2.])[
  #emph[For every sufficiently large prime $q$, there is a finite complete graph with a
    $\( q + 1 \)$-edge-coloring whose vertices require exactly $q + 1$ monochromatic trees to cover.
    The same minimum holds for connected monochromatic subgraphs.]
] <cor:tree-cover>

#proof[
  Put $r = q + 1$ and take the hypergraph $H$ from Theorem 1. Use its edges as the vertices of a complete graph.
    Color a pair $e f$ by any index $i$ for which $e$ and $f$ have the same vertex in part $V_i$;
    intersection guarantees such an index. Along a path of color $i$, this vertex of $V_i$ is constant.
    Thus each connected monochromatic subgraph corresponds to a hypergraph vertex lying in all the hyperedges
    represented by its vertices; for a singleton choose any vertex of the corresponding hyperedge.
    A cover by $t$ such subgraphs would give a vertex cover of $H$ of size at most $t$, so $t gt.eq tau \( H \) =
    r$. Conversely, the $r$ monochromatic stars centered at any fixed graph vertex cover the complete graph,
    allowing singleton stars for unused colors. ◻
]

=== 1.2 Balance, intersection, and the cover obstruction <balance-intersection-and-the-cover-obstruction>

The affine-plane example starts with $q$ blocks in each parallel class.
  We replace those line partitions by partitions with $q + 1$ blocks, keeping one vertex part for each direction.
  In a given direction, merge two parallel lines into one block,
  and split two other parallel lines into two blocks each. The count becomes

$ \( q - 4 \) + 1 + 4 = q + 1 . $

Each split line keeps just four designated points. Writing them in a cyclic order as $u_0 \, u_1 \, u_2 \, u_3$,
  its blocks are the opposite pairs ${ u_0 \, u_2 }$ and ${ u_1 \, u_3 }$.
  All points outside the chosen split lines are retained as well.
  The choices ensure that designated points lie on no other chosen split line,
  so these rules really give partitions of one common set of retained points.
  The blocks label vertices and the retained points label edges.

The splitting operation creates the first difficulty: two points on a split line may now have different labels in
  that direction. We arrange four merged pairs in four distinct other directions so that each consecutive pair
  $u_(i - 1) \, u_i$ lies in a common merged block. These are exactly the pairs separated by the opposite-pair
  partition. Thus every pair of retained points still shares a block somewhere,
  and the resulting hypergraph remains intersecting. Figure 1 shows the rule;
  Section 2 states its precise incidence and compatibility requirements.

The harder difficulty is to rule out a cover using labels from several parts.
  Temporarily remove all split lines and one constituent of each merged pair.
  On the surviving #emph[core], every remaining block is represented by a single ordinary line.
  Hence a cover with at most $q$ labels gives a cover of the core by at most $q$ lines.
  We prove that almost all those lines belong to one #emph[projective pencil]:
  they pass through one affine point, or are all parallel if the common projective point is at infinity.

Every relevant line also retains a positive proportion of its points.
  This occupancy forces a hypothetical cover to select every nonsplit member of its pencil.
  Only a small budget of labels remains for the four-point sets on split lines through the pencil’s center.
  Compatibility handles the parallel case and pencils containing at most two split lines.
  For larger pencils, a separate incidence count shows that the remaining budget is insufficient.
  The deterministic result in Section 2 makes these requirements explicit before we construct data satisfying them.

=== 1.3 Producing the geometric data <producing-the-geometric-data>

The probabilistic argument has to preserve its estimates through several choices.
  First sample two independent constituent lines in each direction.
  They generate many candidate four-point tuples on different split lines.
  An incompatibility graph records choices that cannot coexist.
  There are two slots per direction, each carrying the candidates for one split line.
  Choosing one candidate in every slot without an incompatible pair is an #emph[independent transversal] of this graph.

Section 4 bounds the sizes and degrees of this graph, including the exceptional pairs that can have large common
  neighborhoods. Section 5 then constructs a random independent transversal while maintaining line occupancy.
  The procedure first makes random choices and adds thinning to equalize one-step survival;
  it completes the last slots using the local lemma. Partial random selection followed by local-lemma completion
  also appears in the locally sparse transversal argument of Loh and Sudakov #cite(label("LohSudakov2007"))
  Section 4. Here we need an additional quantitative output:
  prescribing the choices in $s$ slots, jointly with successful return,
  has probability at most $\( K_(*) \/ q \)^s$ for a fixed constant $K_(*)$.
  This bound controls later incidence counts without assuming that selected tuples are independent.

The core estimate in Section 3 is designed for the law of these selected lines.
  Under uniform deletion of a fixed number of lines per direction,
  with probability tending to one every small core cover also covers almost all of the whole plane.
  The key counting lemma bounds forbidden profile classes by $exp \( - Omega \( q log q \) \)$.
  After the preliminary density and occupancy restrictions are imposed,
  this saving pays for both the possible covers and the $exp \( O \( q \) \)$ change of measure introduced by
  selection; the resulting almost-cover conclusion holds with probability tending to one under the changed law.
  Random line constructions and the counting of small covers through collinear subsets have precedents in Erdős
  and Lovász #cite(label("ErdosLovasz1975")) Section 4; Kahn subsequently developed the random-line approach
  further #cite(label("Kahn1992")). The profile argument here supplies the change-of-measure control needed for
  our selection law. We then apply the prime-plane stability theorem of Szőnyi and
  Weiner #cite(label("SzonyiWeiner2012")), also stated by Héger and Nagy #cite(label("HegerNagy2017")),
  to turn an almost-cover into a large pencil. This is the step that requires $q$ to be prime.

Finally, Section 6 combines the prescribed-choice bound with the original independent constituent offsets.
  It counts repeated generator directions and the additional incidences that a small local cover would require.
  Section 7 intersects the resulting successful events and applies the deterministic construction.
  Appendix 8 supplies three elementary estimates in a form independent of the construction;
  these are also the precise inputs used by the companion article.

===== 1.3.1 Conventions. <conventions.>

All logarithms are natural. An event holds with high probability if its probability tends to one along the orders
  under discussion. Constants in $O \( dot.op \)$ may depend on parameters fixed before $q$ varies.
  Every auxiliary constant is fixed independently of $q$; the final threshold may depend on those constants.

== 2 From modified line partitions to a hypergraph <sec:deterministic-construction>

The geometric data needed for the theorem have two jobs: preserve the intersection of point-edges after lines are
  split, and rule out every cover using at most $q$ block labels.
  We formulate both requirements here and prove that they suffice.
  The later probabilistic sections will produce the data; all arguments in this section are deterministic and work
  over any finite field.

Let $q gt.eq 4$ be a prime power, let $A = bb(F)_q^2$, and let $cal(G)$ be the set of its $q + 1$ directions.
  For $g in cal(G)$, write $cal(L)_g$ for the $q$ affine lines of direction $g$, and put $cal(L) =
  union.big_g cal(L)_g$. The affine line of direction $g$ through $p in A$ is denoted by $p + g$.
  We also use the projective completion $"PG" \( 2 \, q \)$.
  Thus a common projective point of affine lines means either an ordinary point of concurrence or the point at
  infinity of a parallel class.

=== 2.1 Merged pairs and four-point split lines <merged-pairs-and-four-point-split-lines>

For every direction $g$, choose two distinct lines $M_g^0 \, M_g^1 in cal(L)_g$.
  Call their union the merged pair in direction $g$, and call either of its lines a constituent. Write

$ cal(M) = { M_g^s : g in cal(G) \, med s in { 0 \, 1 } } . $

If $S in cal(L)_g \\ cal(M)$, define a simple graph on the points of $S$:
  two distinct points are adjacent if they are the two intersections of $S$ with $M_d^0 \,
  M_d^1$ for some $d eq.not g$. Several directions may give the same adjacency; its multiplicity is irrelevant.

A tuple in direction $g$ consists of four distinct directions $d_0 \, d_1 \, d_2 \,
  d_3 in cal(G) \\ { g }$ and four bits $sigma_0 \, sigma_1 \, sigma_2 \, sigma_3 in { 0 \, 1 }$.
  Indices on the tuple are read modulo $4$. Define

#[#set math.equation(numbering: n => "(2)")
 $ u_i = M_(d_i)^(sigma_i) ∩ M_(d_(i + 1))^(1 - sigma_(i + 1)) . $ <eq:det-tuple-points>]

The intersections exist uniquely because consecutive generator directions are different.
  Call the tuple valid if the following conditions hold:

+ Its four points are distinct and lie on one line $S in cal(L)_g \\ cal(M)$.
+ Neither ${ u_0 \, u_2 }$ nor ${ u_1 \, u_3 }$ is an adjacency on $S$.
+ Every point of $S \\ { u_0 \, u_1 \, u_2 \, u_3 }$ is adjacent to at most one of $u_0 \, u_1 \, u_2 \, u_3$.

We call $S$ its split line and write $F_S = { u_0 \, u_1 \, u_2 \, u_3 }$.
  Each consecutive pair ${ u_(i - 1) \, u_i }$ is adjacent:
  the two points lie on the two different constituents of direction $d_i$.
  Consequently the two opposite pairs partition $F_S$, and every pair crossing that partition shares a merged pair.

Figure 1 records the partition and the shared merged blocks.
  The conditions on opposite pairs and external points will also control covers centered at a point of $S$.

We need two split lines in every direction. Index these requirements by slots $\( g \, s \)$,
  where $g in cal(G)$ and $s in { 1 \, 2 }$, and choose a valid tuple in each slot.
  Write $S_g^s$ for its split line. The choices are #emph[compatible] if the following conditions hold for any two
  different slots:

+ Neither chosen split line contains a designated point of the other tuple.
+ The two sets of generator directions have intersection of size at most one.
+ If the slots have the same target direction, no merged pair contains at least two designated points of one tuple
  and at least one designated point of the other.

The first condition makes all chosen split lines distinct and makes their designated point sets pairwise disjoint.
  In particular, there are exactly two split lines in each direction, both different from its two constituents.
  The second condition will be relevant to constructing such data;
  the deterministic implication below uses the first and third conditions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.2, 1.1), [#text(size: 9pt)[original class:]], anchor: "east", padding: 0.1176cm)
  content((1.3, 1.1), [#box(width: 2.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$q-4$ other lines]]])])
  content((4.1, 1.1), [#box(width: 2.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$M_g^0,#h(0.3333em) M_g^1$]]])])
  content((6.9, 1.1), [#box(width: 2.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S_g^1,#h(0.3333em) S_g^2$]]])])
  content((-0.2, 0), [#text(size: 9pt)[new blocks:]], anchor: "east", padding: 0.1176cm)
  content((1.3, 0), [#box(width: 2.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$q-4$ blocks]]])])
  content((4.1, 0), [#box(width: 2.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$1$ merged block]]])])
  content((6.9, 0), [#box(width: 2.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$4$ pair blocks]]])])
  line((1.3, 0.8344), (1.3, 0.2656), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.1, 0.7854), (4.1, 0.2656), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((6.9, 0.7854), (6.9, 0.2656), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})
  #cetz.canvas({
  import cetz.draw: *
  line((-0.57, 0), (6.27, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((6.27, 0), [#text(size: 9pt)[$S$]], anchor: "west", padding: 0.1176cm)
  content((0, -0.1764), [#text(size: 9pt)[$u_0$]], anchor: "north", padding: 0.1176cm)
  content((1.9, -0.1764), [#text(size: 9pt)[$u_1$]], anchor: "north", padding: 0.1176cm)
  content((3.8, -0.1764), [#text(size: 9pt)[$u_2$]], anchor: "north", padding: 0.1176cm)
  content((5.7, -0.1764), [#text(size: 9pt)[$u_3$]], anchor: "north", padding: 0.1176cm)
  bezier((0, 0), (1.9, 0), (0.524, -0.524), (1.376, -0.524), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.95, -0.393), [#text(size: 9pt)[$d_1$]], anchor: "north", padding: 0.1176cm)
  bezier((1.9, 0), (3.8, 0), (2.424, -0.524), (3.276, -0.524), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.85, -0.393), [#text(size: 9pt)[$d_2$]], anchor: "north", padding: 0.1176cm)
  bezier((3.8, 0), (5.7, 0), (4.324, -0.524), (5.176, -0.524), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.75, -0.393), [#text(size: 9pt)[$d_3$]], anchor: "north", padding: 0.1176cm)
  bezier((5.7, 0), (0, 0), (3.879, 1.275), (1.821, 1.275), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.85, 0.9563), [#text(size: 9pt)[$d_0$]], anchor: "south", padding: 0.1176cm)
  circle((0, 0), radius: 0.08819, fill: rgb("#0000b2"), stroke: none)
  circle((3.8, 0), radius: 0.08819, fill: rgb("#0000b2"), stroke: none)
  circle((1.9, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf0000"), thickness: 0.8pt, miter-limit: 10))
  circle((5.7, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (paint: rgb("#bf0000"), thickness: 0.8pt, miter-limit: 10))
})],
  caption: [Figure 1: The merge and split operation gives $q + 1$ blocks per direction. Below, the four points on one split line form two opposite-pair blocks, shown by filled and open points. An arc labelled $d_i$ means that its endpoints lie on different constituents of the merged pair in direction $d_i$, and hence share its block label. The arcs record this relation; they are not affine lines. The diagram is schematic. ],
) <fig:cycle>

Let $cal(S)$ be the set of chosen split lines, and define

#[#set math.equation(numbering: n => "(3)")
 $ D & = cal(S) union { M_g^1 : g in cal(G) } \,\
R_0 & = A \\ union.big_(ell in D) ell \, wide R = A \\ union.big_(S in cal(S)) S \,\
X & = R union union.big_(S in cal(S)) F_S . $ <eq:det-core>]

There are exactly three lines of $D$ in each direction. Compatibility gives

#[#set math.equation(numbering: n => "(4)")
 $ S ∩ X = F_S wide \( S in cal(S) \) . $ <eq:det-split-intersection>]

Indeed, $R$ contains no point of $S$, and no other designated point set meets $S$.

The inclusion $R_0 subset.eq R$ gives two retained sets with different purposes.
  On $R_0$, one constituent of each merged block has disappeared, so a block cover becomes an ordinary line cover.
  The larger set $R$ supplies points on the removed constituents when we later force a cover to choose their
  merged blocks. The four-point sets supply the final obstruction.

The following three properties express exactly what these sets must do. Fix $0 < rho < 1$ and an integer $B gt.eq 0$.

*Occupancy.* At most $B$ constituent lines pass through any affine point.
  Every $ell in cal(L) \\ D$ satisfies $\| ell ∩ R_0 \| gt.eq rho q$,
  and every $M_g^1$ satisfies $\| M_g^1 ∩ R \| gt.eq rho q$.
*Concentration of core covers.* If $C subset.eq cal(L) \\ D$, $\| C \| lt.eq q$, and the lines of $C$ cover $R_0$,
  then at least $\( 1 - rho \/ 4 \) q$ lines of $C$ pass through a common projective point.
*The local condition.* For $p in A$, define
  $ cal(S) \( p \) = { S in cal(S) : p in S } \, wide b \( p \) = \| cal(S) \( p \) \| \, wide F \( p \) =
    union.big_(S in cal(S) \( p \)) F_S \, $
  and
  #[#set math.equation(numbering: n => "(5)")
   $ Z \( p \) = F \( p \) ∩ union.big_(d in cal(G) \, med s in { 0 \, 1 }\
p in M_d^s) M_d^(1 - s) . $ <eq:det-partner-set>]
  Whenever $b \( p \) gt.eq 3$, the set $F \( p \)$ cannot be covered by $Z \( p \)$ and at most $b \( p \) -
    1$ additional sets of the following types: sets of at most two points;
    affine lines outside $cal(S) \( p \) union cal(M)$; and merged pairs $M_d^0 union M_d^1$,
    with no merged pair used more than once.

All these are properties of a specified finite configuration.
  In particular, none asserts that such a configuration exists.

#thm([Proposition 2.1.])[
  (Deterministic reduction).  #emph[Let $q gt.eq 4$ be a prime power.
    Suppose a compatible collection of valid tuples in $bb(F)_q^2$ satisfies occupancy,
    concentration of core covers, and the local condition with parameters $0 < rho < 1$ and $B gt.eq 0$. If
#[#set math.equation(numbering: n => "(6)")
 $ rho q > 2 \( 1 + B \) \, $ <eq:det-size-condition>]

 then there is an intersecting $\( q + 1 \)$-partite $\( q + 1 \)$-uniform hypergraph with exactly $q +
   1$ nonisolated vertices in each part and cover number $q + 1$. Its edges are in bijection with the set $X$ in (3).]
] <prop:deterministic-reduction>

=== 2.2 Partitions and intersecting edges <partitions-and-intersecting-edges>

We prove Proposition 3 in three stages: construct the balanced partitions, reduce a small cover to one pencil,
  and test the designated points against its remaining budget.

For each $g in cal(G)$, partition $X$ into these blocks:

- $ell ∩ X$ for every regular line $ell in cal(L)_g$, where “regular” excludes the two split lines and the two
  constituents in that direction;
- $\( M_g^0 union M_g^1 \) ∩ X$;
- ${ u_0 \, u_2 }$ and ${ u_1 \, u_3 }$ for each of its two split lines, using that line’s tuple ordering.

Distinct lines of $cal(L)_g$ are disjoint and partition $A$, so (4) proves that these blocks partition $X$.
  There are $\( q - 4 \) + 1 + 4 = q + 1$ of them. The split blocks have two points.
  Every regular block is nonempty by the lower bound on $\| ell ∩ R_0 \|$,
  and the merged block is nonempty by the same lower bound for $M_g^0$.

Let $V_g$ consist of distinct labels for these blocks; choose disjoint label sets for different directions.
  A point $x in X$ defines an edge $e_x$ containing, for each $g$, the unique label of the block containing $x$.
  Thus every edge contains exactly one vertex from each of the $q + 1$ parts.
  Every label occurs in an edge because its block is nonempty.

For different $x \, y in X$, let $ell$ be their joining line and let $g$ be its direction.
  If $ell$ is not a split line, then $x \, y$ are in the same regular or merged block of $V_g$.
  If $ell$ is a split line, both points are designated by (4).
  They either belong to the same opposite-pair block or form consecutive positions in its four-cycle.
  In the latter case they share the merged block of the corresponding generator direction.
  Hence $e_x ∩ e_y eq.not diameter$.

Repeated edges would not affect the cover argument, but they do not occur here.
  If $e_x = e_y$ for different $x \, y$, then in every direction $h$ different from the direction of their joining
  line they lie on different $h$-lines. Their only possible common block in $V_h$ is therefore the merged block.
  The point $x$ would lie on a constituent in each of these $q$ directions, contradicting $B < q$,
  which follows from (6). Thus $x mapsto e_x$ is injective.

Selecting labels covers all edges if and only if the corresponding blocks cover $X$.
  We will show that at least $q + 1$ blocks are needed. The reverse bound follows because all labels in any one
  part cover every edge.

=== 2.3 Forcing the nonsplit members of a pencil <forcing-the-nonsplit-members-of-a-pencil>

We have obtained an intersecting hypergraph with the required part sizes and no isolated vertices.
  Its covering number is the minimum number of blocks covering $X$.
  We now use $R_0$ to locate any hypothetical small cover, then use occupancy on $R_0$ and $R$ to force its
  nonsplit blocks.

Suppose that a collection $cal(B)$ of at most $q$ labels covers $X$. A split block misses $R_0$.
  On $R_0$, a merged block is exactly $M_g^0 ∩ R_0$, because $M_g^1 in D$.
  Associate to each selected regular block its line and to each selected merged block the line $M_g^0$.
  These representative lines are distinct, belong to $cal(L) \\ D$, and cover $R_0$.
  Concentration of core covers provides a projective point $P$ lying on at least $\( 1 - rho \/ 4 \)
  q$ selected representatives. Write $t$ for the number of selected labels that do not have a representative
  through $P$, including all selected split labels. Then

#[#set math.equation(numbering: n => "(7)")
 $ t lt.eq rho q \/ 4 . $ <eq:det-outside-pencil>]

We treat separately a parallel pencil and a pencil through an affine point.

===== 2.3.1 A point at infinity. <a-point-at-infinity.>

Suppose $P$ is the point at infinity of direction $g$. Every one of the $q -
  3$ lines of $cal(L)_g \\ D$ must be a selected representative.
  Otherwise an omitted such line has at least $rho q$ points in $R_0$,
  none covered by the parallel representatives through $P$,
  while all remaining representatives cover at most $t$ of them. Split blocks cover none of $R_0$, and $t < rho q$.

The corresponding $q - 3$ selected blocks cover none of the eight designated points on the two split lines of
  direction $g$. An additional regular block covers at most one point on each of those lines,
  and a split block has size two. A merged pair of direction $g$ misses both split lines.
  A merged pair of any other direction has at most two designated points on each split line;
  if it had at least three altogether, it would have at least two on one and at least one on the other,
  contrary to the third compatibility condition. Thus every additional block covers at most two of these eight
  points. At most three labels remain in the cover budget, so a cover is impossible.

===== 2.3.2 An affine point. <an-affine-point.>

Now let $P = p in A$. We first show that for each direction $g$ such that $p + g$ is not a split line,
  the selected labels must include its regular block or, when $p + g$ is a constituent, its merged block.

If $ell = p + g in.not D$ and its block is omitted, selected representatives through $p$ cover at most the point
  $p$ on $ell$. All other representatives cover at most another $t$ points there. This contradicts

$ \| ell ∩ R_0 \| gt.eq rho q > 1 + rho q \/ 4 gt.eq 1 + t . $

The strict inequality follows from (6).

The only remaining nonsplit case is $ell = p + g = M_g^1$. Suppose its merged block is omitted.
  A selected regular block represented through $p$ meets $ell$ only possibly at $p$.
  A selected merged block represented through $p$ consists of a constituent $M_d^0$ through $p$ and its partner
  $M_d^1$. The former meets $ell$ at $p$, and the latter contributes at most one additional point.
  None of these lines equals $ell$, because its own merged block was omitted.
  There are at most $B$ such partners, by the constituent multiplicity bound at $p$.
  Hence all selected blocks represented through $p$ cover at most $1 + B$ points on $ell$.
  Every other selected block covers at most two points on $ell$:
  regular lines meet it in at most one, merged pairs in at most two, and split blocks have size two.
  Occupancy on $R$ now gives the contradiction

$ rho q lt.eq \| ell ∩ R \| lt.eq 1 + B + 2 t lt.eq 1 + B + rho q \/ 2 < rho q . $

This proves the claimed necessity of the block in every nonsplit direction.

Put $b = b \( p \)$. The split lines through $p$ have distinct directions,
  because distinct parallel lines do not meet. The claim therefore requires $q + 1 - b$ distinct labels,
  leaving room for at most $b - 1$ more. It remains to check the designated points on those split lines.

=== 2.4 The remaining designated points <the-remaining-designated-points>

For an affine center $p$, the nonsplit directions have forced $q + 1 - b$ labels, where $b = b \( p \)$.
  The possible cover therefore has at most $b - 1$ labels left.
  The following cases show that the designated points on its $b$ split lines cannot be covered within that budget.

If $b = 0$, the required $q + 1$ labels already exceed the budget.
  If $b = 1$, write $S$ for the unique split line through $p$.
  Exactly $q$ labels are required, so no additional label is available.
  On $F_S$ their blocks can cover only $p$ itself, when $p in F_S$, and points adjacent to $p$ on $S$:
  regular lines through $p$ supply only $p$, and a merged pair through $p$ supplies only its partner intersection.
  If $p = u_i$ is designated, its opposite point $u_(i + 2)$ is not adjacent to it and is missed.
  If $p in.not F_S$, validity allows at most one designated point adjacent to $p$. In either case $F_S$ is not covered.

Suppose now that $b gt.eq 2$. Compatibility implies that $p$ is not designated on any split line through it:
  otherwise that point would lie on a second chosen split line.
  The designated sets on these lines are pairwise disjoint, so $\| F \( p \) \| = 4 b$.
  A required regular block through $p$ meets any such split line only at $p$ and therefore misses its designated
  points. A required merged block has one constituent through $p$ and can cover designated points only with its
  partner. Thus the required blocks cover a subset of $Z \( p \)$.

For each $S in cal(S) \( p \)$, every point in $Z \( p \) ∩
  F_S$ is adjacent to the external point $p$ in the graph on $S$.
  Validity gives $\| Z \( p \) ∩ F_S \| lt.eq 1$, and consequently

#[#set math.equation(numbering: n => "(8)")
 $ \| Z \( p \) \| lt.eq b . $ <eq:det-partner-count>]

If $b = 2$, at most one additional block is available. A regular line meets the two split lines in at most two
  points, a merged pair in at most four, and a split block has two points.
  Hence this extra block together with $Z \( p \)$ covers at most $4 + 2 < 8 = \| F \( p \) \|$ points.

Finally, let $b gt.eq 3$. Each of the at most $b - 1$ additional labels is represented on $F \( p \)$ by one of
  the sets allowed in the local condition: a split block has two points,
  a regular line is outside $cal(S) \( p \) union cal(M)$, and a merged block is contained in its merged pair.
  No merged pair is repeated because it has only one label.
  The local condition therefore rules out covering $F \( p \)$.
  This is the last possible case, completing the proof of Proposition 3.

#prodef([Remark 2.2.])[
  For the multiplicity bound $B = ceil.l log q ceil.r$ used in the probabilistic construction,
    it is enough to require explicitly $q gt.eq 4$ and $rho q > 2 \( 1 + ceil.l log q ceil.r \)$.
    Every fixed $rho > 0$ satisfies this inequality for all sufficiently large $q$.
    Primality is not used in the deterministic reduction; any restriction to prime orders must come from
    establishing the finite configuration properties.
]

== 3 Deletion lines and concentration of core covers <sec:deletion>

The deterministic construction asks for rigidity of line covers of the core $R_0$.
  We establish that rigidity in two steps. First, after a fixed number of lines in each direction are deleted,
  with probability tending to one every cover of the surviving set by at most $q$ other lines also covers almost
  all of the plane. Second, over a prime field, the Szőnyi–Weiner stability theorem puts almost all lines of such
  an almost-cover in one pencil.

The deletion law matters. Our eventual split lines come from a constrained selection, so their law is not uniform.
  We prove the first step for any law whose probability at each deletion set is at most $exp \( K q \)$ times its
  uniform probability, with $K$ fixed. A qualitative estimate for uniform deletion would not suffice under this
  change of measure.

Throughout this section, $q$ tends to infinity through prime powers and $A = bb(F)_q^2$.
  Let $cal(L)$ be its $q \( q + 1 \)$ affine lines. Primality will be required only for the final application of
  projective stability. Fix an integer $k gt.eq 1$. For $q gt.eq k$,
  let $sans(U)_(q \, k)$ be the uniform law on sets $D subset.eq
  cal(L)$ containing exactly $k$ lines in each direction. Define

$ R_D = A \\ union.big_(ell in D) ell \, wide i_D \( x \) = \| { ell in D : x in ell } \| . $

For probability measures on a countable set, total variation distance is one half of the sum of the absolute
  coordinate differences.

#thm([Theorem 3.1.])[
  (Robust deletion estimates).  #emph[Fix $k gt.eq 1$ and $K gt.eq 0$.
    For each $q$, let $sans(Q)_q$ be a probability law on the same sets as $sans(U)_(q \, k)$ such that
$ sans(Q)_q \( D \) lt.eq e^(K q) sans(U)_(q \, k) \( D \) quad upright("for every ") D . $

 Then the following assertions hold as $q arrow.r oo$.]
  + #emph[The empirical probability measure $q^(- 2) sum_(x in A) delta_(i_D \( x \))$ converges in probability,
    in total variation, to the Poisson distribution with mean $k$.]
  + #emph[Write $mu = e^(- k)$. For every fixed $lambda \, eta > 0$,
    the probability that at least $eta q$ lines $ell in cal(L) \\ D$ satisfy
$ lr(|frac(\| ell ∩ R_D \|, q) - mu|) gt.eq lambda $

 tends to zero.]
  + #emph[For every fixed $delta > 0$, the probability that there is a set $C subset.eq cal(L) \\ D$ with $\| C \|
    lt.eq q$ which covers $R_D$ and leaves at least $delta q^2$ points of $A$ uncovered tends to zero.]
] <thm:deletion>

Part (iii) is the cover statement needed for the construction. The first two parts provide its input:
  the surviving density and the occupancy of all but a sublinear number of lines.
  We prove them in that order using one counting principle.

For a proposed witness $C$ of size $m$, expose the lines of $D$ and $C$ in a carefully chosen random order.
  For a positive proportion of orders, their point-multiplicity profiles will force more than $m$ exposures at
  which the next line has atypical occupancy. In the counting experiment,
  where $D$ and $C$ are themselves sampled, each such step has conditional probability $O \( q^(- 1) \)$.
  The first $m$ savings pay for the at most $q^m exp \( O \( q \) \)$ witnesses;
  the remaining positive proportion of steps pays for $e^(K q)$.
  Erdős and Lovász #cite(label("ErdosLovasz1975")) Section 4 count small covers by their collinear subsets in a
  random-line construction; Kahn #cite(label("Kahn1992")) subsequently strengthened the random-line result.
  The profile count below provides the uniform change-of-measure control used here.

=== 3.1 Profiles and incidence identities <profiles-and-incidence-identities>

Consider disjoint sets $D \, C$ with $D$ as above and $m = \| C \| lt.eq q$.
  Put $j_C \( x \) = \| { ell in C : x in ell } \|$ and define the plane profile and the profile of a line $ell in
  D union C$ by

$ P_(i j)^(\( q \)) = q^(- 2) \| { x in A : i_D \( x \) = i \, med j_C \( x \) = j } \| \, wide X_(i j)^ell =
  q^(- 1) \| { x in ell : i_D \( x \) = i \, med j_C \( x \) = j } \| . $

All indices in these arrays are nonnegative integers. A coordinate with a negative index is understood to be zero.

The mean of $i + j$ in the plane is $\( k \( q + 1 \) + m \) \/ q$. On any one of the listed lines it is at most

$ 1 + frac(k \( q + 1 \) + m - 1, q) \, $

because every other distinct line meets it in at most one point.
  Thus all these arrays belong to the space $cal(P)$ of probability arrays on $bb(Z)_(gt.eq 0)^2$ whose mean of
  $i + j$ is at most $M = 2 k + 4$. Give $cal(P)$ the topology of coordinatewise convergence.

This space is compact and metrizable. Indeed the mass outside ${ i + j lt.eq B }$ is at most $M \/ \( B + 1 \)$,
  uniformly over the space. A diagonal subsequence of any sequence therefore has total mass one,
  and its mean bound follows from Fatou’s lemma. The same tail estimate shows that coordinatewise convergence in
  $cal(P)$ implies convergence in total variation. In particular every bounded sum of selected coordinates,
  such as $x mapsto sum_j x_(0 j)$, is continuous.

From any sequence of pairs $\( D \, C \)$, we may consequently extract a subsequence such that

#[#set math.equation(numbering: n => "(9)")
 $ m / q arrow.r c \, quad P^(\( q \)) arrow.r P \, quad nu_D^(\( q \)) := 1 /
   q sum_(ell in D) delta_(X^ell) arrow.r.double nu_D \, quad nu_C^(\( q \)) := 1 /
   q sum_(ell in C) delta_(X^ell) arrow.r.double nu_C . $ <eq:profile-limits>]

The last two limits are weak limits of finite measures on $cal(P)$. Their masses are $k$ and $c$.
  The measure $nu_D$ is supported on profiles with $x_(0 j) = 0$, and $nu_C$ on profiles with $x_(i 0) = 0$;
  these restrictions are closed. For each fixed $i \, j$, counting incidences before taking the limit gives

#[#set math.equation(numbering: n => "(10)")
 $ integral x_(i j) thin d nu_D \( x \) = i P_(i j) \, wide integral x_(i j) thin d nu_C \( x \) =
   j P_(i j) . $ <eq:profile-incidences>]

Summing these identities by Tonelli’s theorem yields

#[#set math.equation(numbering: n => "(11)")
 $ sum_(i \, j) i P_(i j) = k \, wide sum_(i \, j) j P_(i j) = c . $ <eq:profile-means>]

This argument is necessary: convergence in total variation alone would not justify passage to these unbounded
  first moments.

The next distinction identifies exactly which line profiles can create an atypical exposure.
  If a line of type $D$ sampled the surrounding plane without bias,
  its own contribution would merely add one to the first multiplicity coordinate.
  The analogous shift for a $C$-line is in the second coordinate.

Relative to the limiting plane profile $P$, call a profile of type $D$ #emph[invisible] if $x_(i j) =
  P_(i - 1 \, j)$ for every $i \, j$, and a profile of type $C$ invisible if $x_(i j) =
  P_(i \, j - 1)$ for every $i \, j$. A profile which is not invisible is called visible.
  The terminology refers only to the following exposure test.

#thm([Lemma 3.2.])[
  (Counting by profile detection).  #emph[For each $q$, let $cal(A)_q$ be a deterministic class of pairs
    $\( D \, C \)$ as above. Assume there is $a > 0$ such that every pair in every class has either $m =
    0$ or $m gt.eq a q$. Suppose every subsequential limit (9), along objects in the classes with $q arrow.r oo$,
    satisfies
#[#set math.equation(numbering: n => "(12)")
 $ nu_D \( D upright("-visible profiles") \) + nu_C \( C upright("-visible profiles") \) > c . $ <eq:visible-excess>]

 There is $b > 0$ such that, for all sufficiently large $q$,
$ sans(U)_(q \, k) { D : upright("some ") C upright(" has ") \( D \, C \) in cal(A)_q } lt.eq exp \( - b q log q \) . $

 The constants may depend on $k \, a$ and the sequence of classes.]
] <lem:profile-counting>

#proof[
  We first keep $\( D \, C \)$ fixed and show that a positive proportion of its exposure orders produce more than
    $m$ marked steps. We then sample $D$ and $C$ independently and show that so many marks are rare.
    Comparing the two experiments will pay for all possible witness sets $C$.
  ===== 3.1.1 Exposure of a fixed pair. <exposure-of-a-fixed-pair.>
  First fix one deterministic object $\( D \, C \)$ and randomize only its exposure order.
    Order $D$ and $C$ independently and uniformly, and set $n_D = k \( q + 1 \)$ and $gamma = sqrt(2)$.
    With equal exposure rates, limiting point-survival probabilities would depend only on $i + j$.
    The irrational exponent makes $i + gamma j$ distinct for distinct pairs $\( i \, j \)$,
    allowing the exposure test to distinguish both coordinates.
    Assign the successive $D$-steps the parameters $d \/ n_D$ for $d = n_D \, n_D - 1 \, dots.h \, 1$,
    and the successive $C$-steps the parameters $\( a' \/ m \)^(1 \/ gamma)$ for $a' = m \, m - 1 \, dots.h \, 1$.
    Omit the second list if $m = 0$. Interleave the lists in decreasing parameter order,
    breaking ties deterministically. At a step with parameter $z$,
    the fractions of lines of the two types still unexposed, including the current line of its type,
    differ from $z$ and $z^gamma$ by at most $O \( 1 \/ n_D \)$ and $O \( 1 \/ m \)$, respectively.
  Let $U$ be the points on none of the previously exposed lines.
    For fixed thresholds $eta_0 \, epsilon.alt > 0$, mark a step if $z > eta_0$ and its line $ell$ satisfies
  #[#set math.equation(numbering: n => "(13)")
   $ lr(|frac(\| ell ∩ U \|, q) - frac(\| U \|, q^2)|) > epsilon.alt . $ <eq:mark>]
  Write $N$ for the number of marks. We relate its expectation to the profiles and then count marked exposure sequences.
  ===== 3.1.2 Detecting the visible profiles. <detecting-the-visible-profiles.>
  For a limit (9), put
  $ u \( z \) = sum_(i \, j) P_(i j) z^(i + gamma j) \, wide f_D \( x \, z \) =
    sum_(i gt.eq 1 \, j gt.eq 0) x_(i j) z^(i - 1 + gamma j) \, wide f_C \( x \, z \) =
    sum_(i gt.eq 0 \, j gt.eq 1) x_(i j) z^(i + gamma \( j - 1 \)) . $
  These functions are continuous jointly in the displayed variables for $0 < z lt.eq
    1$ on the relevant profile spaces. Conditional on a particular line $ell$ occupying a specified step of its
    type, the expectation of $\| U \| \/ q^2$ is $u \( z \) +
    o \( 1 \)$ and that of $\| ell ∩ U \| \/ q$ is $f_T \( X^ell \, z \) + o \( 1 \)$,
    uniformly for $z > eta_0$ and for all target lines of type $T$.
    To verify this, at a $D$-step with $d$ remaining $D$-lines and $a'$ remaining $C$-lines,
    a point on $ell$ of multiplicities $i \, j$ is uncovered with probability
  $ frac(\( d - 1 \)_(i - 1), \( n_D - 1 \)_(i - 1)) frac(\( a' \)_j, \( m \)_j) . $
  Here $\( t \)_r = t \( t - 1 \) dots.h.c \( t - r + 1 \)$, and the second factor is one if $j = 0$; when $m =
    0$ only $j = 0$ occurs. Off $ell$, the first factor is $\( d - 1 \)_i \/ \( n_D - 1 \)_i$.
    The analogous formulas at $C$-steps shift $j$ instead. For bounded $i +
    j$ these expressions have the claimed uniform power approximations.
    The uniform profile mean bound controls the remaining tails,
    and the target line itself occupies only $1 \/ q$ of the plane.
    We may retain only a subsequence with $m = 0$, or one with $m gt.eq a q$,
    so every denominator in the relevant bounded-multiplicity approximation tends to infinity.
  Both normalized uncovered counts have conditional variance $O \( 1 \/ q \)$.
    Indeed the previously exposed lines form uniform subsets of specified sizes with the target excluded.
    Exchanging a selected and an unselected line changes either normalized count by at most $2 \/ q$:
    on the target each other line meets at most one point, and in the plane each line has $q$ points.
    The transposition coupling for sampling without replacement gives Doob martingale increments at most $2 \/
    q$ in $O \( q \)$ exposures, proving the variance estimate.
    This establishes concentration conditional on each target, uniformly in the target and its step.
  For a visible profile $x$ of type $T$, the functions $f_T \( x \, z \)$ and $u \( z \)$ agree only on a set of
    Lebesgue measure zero in $\( 0 \, 1 \)$. For proof, put $z = e^(- s)$.
    Their difference is an analytic generalized Dirichlet series on $"Re" s > 0$,
    with absolutely summable coefficients and exponents $i + gamma j$.
    These exponents are distinct and locally finite. If the difference vanishes identically and some coefficient
    is nonzero, choose its least exponent, divide by the corresponding exponential, and let $s arrow.r + oo$.
    Dominated convergence gives a nonzero limit, a contradiction.
    Thus identity of the functions is exactly invisibility. The zero set of a nonzero analytic function on the
    real interval is discrete there and hence null.
  At a fixed step the target is uniform among lines of its type.
    The uniform parameter grids converge to the probability densities $1$ for $D$ and $gamma
    z^(gamma - 1)$ for $C$. Weak convergence of the products of these grids and the empirical profile measures,
    followed by the open-set lower bound and the conditional concentration just proved, gives
  #[#set math.equation(numbering: n => "(14)")
   $ liminf frac(bb(E) N, q) med gt.eq med & integral.double
     upright(bold(1))_({ eta_0 < z < 1 \, med \| f_D \( x \, z \) - u \( z \) \| > 3 epsilon.alt }) thin d
     nu_D \( x \) thin d z\
 & +
   integral.double upright(bold(1))_({ eta_0 < z < 1 \, med \| f_C \( x \, z \) - u \( z \) \| > 3 epsilon.alt })
   thin d nu_C \( x \) thin gamma z^(gamma - 1) thin d z . $ <eq:marks-limit>]
  The right side increases to the visible mass sum when the thresholds decrease to zero.
  The limiting test now has a uniform consequence. The strict excess in (12) need not have been quantified in the
    lemma’s hypothesis; compactness supplies the margin needed for counting.
    There are fixed $eta_0 \, epsilon.alt \, xi > 0$ such that every sufficiently large object in the classes satisfies
  #[#set math.equation(numbering: n => "(15)")
   $ bb(E) N gt.eq m + xi q . $ <eq:marks-margin>]
  Otherwise take both thresholds and the proposed margin equal to $1 \/ t$,
    choose violating objects with $q_t arrow.r oo$, and pass to a subsequential profile limit.
    For any fixed positive thresholds, their mark count is eventually no larger than the count at thresholds $1 \/
    t$. Its limiting upper expectation divided by $q_t$ is therefore at most $c$.
    Equation (14), followed by decreasing the fixed thresholds to zero, contradicts (12).
    This proves the uniform margin without assuming a quantitative excess in advance.
    Since $N lt.eq n_D + m$, (15) implies
  #[#set math.equation(numbering: n => "(16)")
   $ bb(P) { N gt.eq m + xi q \/ 2 } gt.eq frac(xi q, 2 n_D) . $ <eq:marks-positive-probability>]
  The probability in this display is only over orderings of the fixed object,
    and its lower bound is a positive constant for large $q$.
  ===== 3.1.3 Counting the marked exposures. <counting-the-marked-exposures.>
  We have proved that every fixed forbidden pair has a positive probability of producing more than $m$ marks.
    We now use a different experiment to count how often any pair can produce that many marks.
    Sample $D$ from $sans(U)_(q \, k)$, sample $C$ independently as a uniform $m$-subset of $cal(L)$,
    and use the same random orderings. This experiment is #emph[not] conditioned on $D ∩ C = diameter$.
    Disjointness will enter only when we apply (16) to an object in $cal(A)_q$.
  At a $D$-step with $z > eta_0$, conditional on all past exposures,
    the probability of any particular next line is $O \( q^(- 2) \)$.
    To see this, sample a uniform ordering of direction tokens, with $k$ copies of each direction,
    and choose its offsets uniformly without replacement when a token recurs.
    A direction has conditional probability at most $k \/ \( eta_0 n_D \)$,
    and any line in that direction then has probability at most $1 \/ \( q - k \)$ for large $q$.
    Past $C$-exposures do not change this law. At a $C$-step the same bound follows from uniform sampling without
    replacement from $q \( q + 1 \)$ lines.
  At this point $U$ is fixed by the exposed history. Lemma 18 gives, for this arbitrary set,
  #[#set math.equation(numbering: n => "(17)")
   $ sum_(ell in cal(L)) (\| ell ∩ U \| - frac(\| U \|, q))^2 = q \| U \| - frac(\| U \|^2, q) lt.eq q^3 /
     4 . $ <eq:affine-variance>]
  It follows that at most $q \/ \( 4 epsilon.alt^2 \)$ lines can cause a mark.
    Thus every step has conditional mark probability at most $B \/ q$, for a fixed $B$;
    steps below the parameter threshold have mark probability zero.
    Multiplying these conditional bounds over any specified collection of steps and taking a subset union bound
    over $O \( q \)$ steps gives
  #[#set math.equation(numbering: n => "(18)")
   $ bb(P) { N gt.eq m + xi q \/ 2 } lt.eq exp \( O \( q \) \) q^(- m - xi q \/ 2) . $ <eq:many-marks-upper>]
  This uses no independence between marks.
  ===== 3.1.4 Paying for all witnesses. <paying-for-all-witnesses.>
  By (16), the probability that the sampled pair belongs to $cal(A)_q$ is at most a constant times the right side
    of (18). Passing from a random $C$ to the existence of a witness $C$ costs at most
  $ binom(q \( q + 1 \), m) lt.eq q^m exp \( O \( q \) \) \, wide 0 lt.eq m lt.eq q . $
  For $m > 0$, this follows from $binom(n, m) lt.eq \( e n \/ m \)^m$ and $m log \( q \/ m \) = O \( q \)$; $m =
    0$ is immediate. The $q^m$ factors cancel. Summing over the at most $q +
    1$ possible values of $m$ leaves $exp \( - xi q log q \/ 2 + O \( q \) \)$, which proves the lemma. ◻
]

=== 3.2 The three deletion estimates <the-three-deletion-estimates>

#proof[
  Multiplication of the bound in Lemma 6 by $e^(K q)$ still gives a probability tending to zero.
    We will use this observation for three classes of witnesses.
  ===== 3.2.1 The multiplicity law. <the-multiplicity-law.>
  For part (i), fix a positive total variation tolerance and take $m =
    0$ and the class where the $D$-multiplicity profile violates that tolerance from Poisson$\( k \)$.
    In a subsequential limit $j = 0$ throughout. If all $D$-mass is invisible, (10) gives
  $ i P_(i 0) = k P_(i - 1 \, 0) quad \( i gt.eq 1 \) . $
  Normalization then forces $P_(i 0) = e^(- k) k^i \/ i !$, contrary to the fixed tolerance,
    which persists by total variation convergence. Thus some positive $D$-mass is visible,
    and the counting lemma applies with $c = 0$. This proves part (i).
  Fix now the particular sequence of dominated laws in the theorem.
    By part (i), we may choose a deterministic sequence $epsilon.alt_q$ decreasing to zero sufficiently slowly
    that, with probability tending to one, the empirical $D$-multiplicity law lies within $epsilon.alt_q$ of
    Poisson$\( k \)$. Such a sequence follows by choosing successive thresholds $1 \/
    t$ after their failure probabilities have become small. These restrictions define deterministic classes of
    outcomes; they do not condition the independent counting experiment in the lemma.
  ===== 3.2.2 Line occupancy. <line-occupancy.>
  For part (ii), it suffices to take $0 < eta < 1$. If at least $eta q$ non-$D$ lines have the stated deviation,
    at least $m = floor.l eta q \/ 2 floor.r$ have deviations of one common sign.
    Treat the two signs separately, and let $C$ be any such $m$-set.
    Include the Poisson-closeness restriction just chosen in the class of pairs.
    In every subsequential limit, the $i$-marginal of $P$ is Poisson$\( k \)$, so
  $ sum_j P_(0 j) = mu . $
  Every limiting $C$-profile has $sum_j x_(0 j) gt.eq mu + lambda$, or every one has $sum_j x_(0 j) lt.eq mu -
    lambda$, according to the sign. These are closed conditions on the compact profile space.
    Consequently all $C$-mass is visible: an invisible $C$-profile has this row sum equal to $sum_j P_(0 j) = mu$.
  If all $D$-mass were invisible, the incidence identities would give
  #[#set math.equation(numbering: n => "(19)")
   $ P_(i j) = frac(k^i, i !) P_(0 j) . $ <eq:poisson-factorization>]
  By Tonelli’s theorem and (11), this would imply
  $ integral sum_j x_(0 j) thin d nu_C \( x \) = sum_j j P_(0 j) = e^(- k) sum_(i \, j) j P_(i j) = mu c . $
  But the common sign deviation bounds this integral above by $\( mu - lambda \) c$ or below by $\( mu + lambda \)
    c$, and $c = eta \/ 2 > 0$. This is a contradiction. There is therefore also positive visible $D$-mass,
    giving the strict excess required by the counting lemma. Its bound, the domination factor,
    and the vanishing failure probability of the Poisson restriction prove part (ii).
  ===== 3.2.3 A core cover almost covers the plane. <a-core-cover-almost-covers-the-plane.>
  We have obtained the density and line occupancy needed to analyze a cover.
    The occupancy estimates and the budget of $q$ lines force the $i =
    0$ row of its limiting profile to be supported on $j = 1$.
    If the cover still misses a positive proportion of the plane, additional deletion profiles must then be visible.
  A second diagonal choice, using parts (i) and (ii), provides deterministic thresholds tending to zero such that,
    with probability tending to one, the Poisson restriction holds and all but $o \( q \)$ non-$D$ lines have $\|
    ell ∩ R_D \| \/ q = mu + o \( 1 \)$, with the errors uniform among the nonexceptional lines.
    More explicitly, one may choose $t = t \( q \) arrow.r oo$ slowly so that the number of lines with deviation
    at least $1 \/ t$ is smaller than $q \/ t$, except with probability tending to zero.
  Fix $delta > 0$ and consider witnesses for failure of part (iii) subject to these deterministic restrictions.
    Covering $R_D$ by $m$ lines implies
  $ m / q gt.eq frac(\| R_D \|, q^2) = mu + o \( 1 \) \, $
  so the lower bound on positive $m \/ q$ required by the counting lemma holds.
    In a limit, almost every $C$-profile satisfies $sum_j x_(0 j) = mu$,
    because at most $o \( q \)$ members of $C$ can be among the exceptional lines.
    Covering gives $P_00 = 0$, and $c lt.eq 1$. Hence
  $ c mu = integral sum_j x_(0 j) thin d nu_C = sum_j j P_(0 j) gt.eq sum_j P_(0 j) = mu . $
  It follows that $c = 1$, $P_01 = mu$, and $P_(0 j) = 0$ for $j eq.not 1$.
    Moreover (10) gives $integral x_01 thin d nu_C = P_01 = mu$.
    Since $x_01 lt.eq sum_j x_(0 j) = mu$ almost everywhere and $nu_C$ has mass one, $x_01 =
    mu$ almost everywhere. Every such profile is visible, because an invisible $C$-profile would have $x_01 = P_00 = 0$.
  All $D$-mass cannot be invisible either. Otherwise (19) and the preceding description of the $i =
    0$ row would force $P$ to be supported on $j = 1$. This contradicts $sum_i P_(i 0) gt.eq delta$,
    the limiting fraction of points uncovered by $C$. Thus the visible mass is strictly greater than $c$ again.
    The counting lemma applies, and adding back the vanishing probabilities of the deterministic restrictions
    proves part (iii). ◻
]

=== 3.3 From almost covering the plane to a pencil <from-almost-covering-the-plane-to-a-pencil>

The deletion theorem leaves only a geometric question: how can at most $q$ lines cover all but a small proportion
  of an affine plane? An earlier stability lemma of Erdős and Lovász #cite(label("ErdosLovasz1975")) Section 4,
  proof of Theorem 10, part II forces almost all of a set of $q$ projective points onto one line when it has
  sufficiently few disjoint lines. Over prime fields, Szőnyi and Weiner allow a sufficiently small constant
  multiple of $q^2$ disjoint lines. This is the scale needed after our deletion estimate.

The external geometric input is the stability theorem of Szőnyi and Weiner #cite(label("SzonyiWeiner2012"))
  Theorem 4, also reproduced by Héger and Nagy #cite(label("HegerNagy2017")) Result 3.6.
  If $q$ is prime and $B subset.eq upright("PG") \( 2 \, q \)$ has

$ \| B \| lt.eq 3 / 2 \( q + 1 \) - beta \, wide Delta < 2 / 9 \( beta + 1 \)^2 \, $

where $beta > 0$ and $Delta$ counts the projective lines disjoint from $B$,
  then some projective line contains at least $q - 2 Delta \/ \( q + 1 \)$ points of $B$.
  We use only the following consequence, with explicit constants to fix its quantifiers.

#thm([Lemma 3.3.])[
  (Prime-plane stability for affine line covers).  #emph[Let $zeta > 0$ and put $delta_zeta = min { zeta \/ 4 \,
    1 \/ 100 }$. If $q$ is prime and $q gt.eq max { 100 \, 4 \/ zeta }$,
    then any set of at most $q$ distinct affine lines missing fewer than $delta_zeta
    q^2$ affine points has at least $\( 1 - zeta \) q$ members through a common projective point.
    A point at infinity means that these members are parallel.]
] <lem:prime-stability>

#proof[
  We must account for the points at infinity before applying the projective statement.
    Let $h < delta_zeta q^2$ be the number of missed affine points and $d$ the number of represented directions.
    Extending the lines projectively leaves exactly $q + 1 - d$ uncovered points at infinity.
    Under projective duality the line set becomes a point set $B$ of size at most $q$, with
  $ Delta = h + q + 1 - d lt.eq h + q + 1 $
  skew projective lines. Set $beta = floor.l q \/ 3 floor.r$.
    Then $\| B \| lt.eq q lt.eq 3 \( q + 1 \) \/ 2 - beta$, and
  $ Delta lt.eq h + q + 1 < delta_zeta q^2 + q + 1 lt.eq 0.0201 q^2 < frac(2 q^2, 81) < 2 / 9 \( beta + 1 \)^2 . $
  Thus the stability theorem applies. Dualizing its conclusion gives at least
  $ q - frac(2 Delta, q + 1) gt.eq q - frac(2 h, q + 1) - 2 > q - 2 delta_zeta q - 2 gt.eq \( 1 - zeta \) q $
  concurrent lines. The last inequality uses $2 delta_zeta lt.eq zeta \/ 2$ and $2 lt.eq zeta q \/ 2$. ◻
]

#thm([Corollary 3.4.])[
  (Concentration of core covers).  #emph[Assume the laws of Theorem 5,
    and let $q$ tend to infinity through primes. For each fixed $zeta > 0$, with probability tending to one,
    every set $C subset.eq cal(L) \\ D$ of at most $q$ lines covering $R_D$ has at least $\( 1 - zeta \)
    q$ members through a common projective point.]
] <cor:core-pencil>

#proof[
  Apply Theorem 5(iii) with $delta = delta_zeta$, followed by Lemma 7. ◻
]

== 4 Random merged pairs and their candidate graph <sec:candidates>

The construction in Section 2 calls for two compatible split lines in every direction.
  We begin by supplying many valid choices for each of these lines. We also record which choices conflict:
  besides having large sets of candidates, we need their conflict graph to have controlled degrees and,
  apart from a small specified set, controlled codegrees.

Throughout this section, $M_g^0$ and $M_g^1$ are sampled independently and uniformly from $cal(L)_g$,
  independently for different directions $g$. This sampling law allows the two constituents in a direction to
  coincide. In that case they create no adjacency between distinct points on a target line.
  With this convention the tuple validity tests of Section 2 apply throughout the sampling space and agree with
  the original tests whenever every constituent pair is distinct.
  We impose distinctness only after obtaining the estimates below.

A #emph[successful tuple] in direction $g$ is a choice of four distinct generators $d_0 \, d_1 \, d_2 \,
  d_3 eq.not g$ and bits $sigma_0 \, dots.h \, sigma_3$ such that

$ u_i = M_(d_i)^(sigma_i) ∩ M_(d_(i + 1))^(1 - sigma_(i + 1)) \, wide i in bb(Z) \/ 4 bb(Z) \, $

are four distinct points on one $g$-line. Thus success concerns only alignment and distinctness.
  A valid tuple must also pass the additional tests in Section 2:
  its target line is not a constituent, neither opposite pair is adjacent,
  and no external point on the target line is adjacent to two designated positions.

For each line supporting valid tuples, retain one of them by a fixed deterministic rule.
  Let $Q_g$ be the resulting set of tuples in direction $g$.
  In particular, distinct members of $Q_g$ have distinct target lines.
  Each of the two slots $\( g \, 1 \) \, \( g \, 2 \)$ carries a copy of $Q_g$.
  These copies form the vertices of a graph: two vertices in different slots are joined exactly when their tuples
  fail a compatibility condition from Section 2; vertices in the same slot are not joined.
  Choosing one vertex from each slot with no edges among the chosen vertices is therefore precisely a compatible
  choice of the required tuples. For a vertex $v$, write $L_v$ for its line, $F_v$ for its four designated points,
  $Gamma_v$ for its generator set, and $N \( v \)$ for its graph neighborhood.

#thm([Proposition 4.1.])[
  #emph[There are constants $c_(*) > 0$ and $C_(*) < oo$ such that, with probability $1 - o \( 1 \)$,
    the following assertions hold simultaneously, with $beta = 1 \/ 8$ and $c_0 = 1 \/ 5$:]
  + #emph[$c_(*) q lt.eq \| Q_g \| lt.eq q$ for every direction $g$.]
  + #emph[Every vertex has degree at most $C_(*) q$, and has at most $q^beta$ neighbors in each slot.]
  + #emph[For every $v$ there is a set $J \( v \)$ of at most $q^beta$ vertices such that $\| N \( v \) ∩
    N \( w \) \| lt.eq q^beta$ for $w in.not J \( v \)$. Every member of $J \( v \)$ is adjacent to $v$ or is in
    its slot.]
  + #emph[At most $ceil.l log q ceil.r$ constituents pass through any affine point, counting multiplicity.
    Every line other than one of the $M_g^1$ has at least $c_0 q$ points outside $union.big_g M_g^1$.]
  #emph[Consequently the event that these assertions hold and that $M_g^0 eq.not
    M_g^1$ for every $g$ has probability $e^(- 1) + o \( 1 \)$.]
] <prop:candidate-graph>

The proof has two counting stages. First we count successful tuples and show that, after the validity tests,
  they occupy linearly many distinct lines. We then bound incidences among tuples, their designated points,
  and test lines; these estimates will give the graph bounds.
  A moment argument supplies the uniform tail estimates at both stages.
  All counts refer to the independent sampling law above, without conditioning on a later selection of compatible
  split lines.

=== 4.1 A moment argument for small patterns <a-moment-argument-for-small-patterns>

When discussing exposure of the random choices, we call a direction a #emph[colour];
  its variable is the pair of random offsets specifying its two constituents.
  A labelled pattern tests a bounded number of these variables.
  Although different patterns may share colours, their counts can be controlled if the same expectation bound
  holds after any bounded exposure. The next lemma states the two forms we need.
  Constants may depend on the fixed moment order and on the number of exposed colours,
  but not on $q$ or on the values exposed.

#thm([Lemma 4.2.])[
  #emph[Let $Z = sum_a I_a$ count labelled patterns in independent colour variables,
    where $I_a$ is the indicator of pattern $a$. For each label $a$,
    let $C_a$ be its deterministic set of tested colours, of uniformly bounded size,
    so that $I_a$ is measurable in those variables. A bounded set $K_0$ of colours may already have fixed values;
    all overlap tests below concern the supports $C_a \\ K_0$.]
  + #emph[If, after fixing any further bounded set of colours,
    the conditional expected total is $O \( 1 \)$ uniformly, then $bb(E) Z^s =
    O_s \( 1 \)$ for every fixed positive integer $s$.]
  + #emph[Suppose instead that the conditional expected total is $O \( q \)$,
    and the conditional expected count of patterns using any of the further exposed colours is $O \( 1 \)$.
    Overlap here excludes the initially fixed colours. Then
$ bb(E) \| Z - bb(E) Z \|^(2 s) = O_s \( q^s \) . $

 All expectations are conditional on the initially fixed colours, if any.]
] <lem:pattern-moments>

#proof[
  For (i), expand $Z^s$ as a sum over ordered sequences of $s$ patterns.
    After exposing all colours used by a prefix, the conditional expected number of choices for the next pattern
    is $O_s \( 1 \)$, uniformly in the values already seen. Summing one entry at a time proves the bound.
  For (ii), work in the initially conditioned law and put $p_a = bb(E) I_a$.
    Expand the $2 s$th centered moment as products of $I_a - p_a$.
    In each sequence, form the graph whose entries are adjacent when their supports outside $K_0$ share a colour.
    A term with an isolated entry vanishes, because its centered factor is independent of all the other factors.
    Every remaining sequence can be reordered so that each connected component grows from its first entry,
    with every later entry sharing a colour with an earlier one.
    Each component has at least two entries, so at most $s$ entries start components.
  To sum these terms in absolute value, bound each factor by $I_a + p_a$.
    Given a prefix and its exposed values, an unrestricted next entry costs $O_s \( q \)$,
    whereas an entry required to share a colour with the prefix costs $O_s \( 1 \)$.
    The sums of $p_a$ obey the same bounds: for each fixed set of earlier colour labels,
    average the uniform conditional bounds over its possible values.
    Induction over the remaining entries therefore gives $O_s \( q^s \)$ for each permitted ordering and component
    pattern. There are only a bounded number of these, depending on $s$. ◻
]

We use part (i) for counts whose expectations remain bounded and part (ii) for counts of order $q$ that must
  concentrate about their means. Fix

$ theta = 1 \/ 100 . $

By taking a sufficiently large fixed moment in (i), the probability that such a count exceeds $q^theta$ is smaller
  than any prescribed inverse power of $q$. Part (ii) gives probability $O_s \( q^(- s) \)$ for a deviation by a
  fixed positive multiple of $q$. Both conclusions can consequently be imposed over polynomially many tests.

We now verify the basic conditional counts for tuples. Fix a bounded exposed colour set $K$.
  If a tuple has $j$ generators in $K$, let $f$ count its positions whose two incident generators are both
  exposed. The cyclic arrangement of the four generators gives

$ j & 0 & 1 & 2 & 3 & 4\
f_max & 0 & 0 & 1 & 2 & 4 . $

Every other position uses fresh offset variables, disjoint from those used by the other nonfixed positions.
  Such a position is uniform in the plane or on a fixed constituent whose direction differs from the target.
  In either case its coordinate specifying a target parallel line is uniform,
  independently of those of the other nonfixed positions.

For a fixed target direction, alignment therefore has probability at most $q^(- 3)$ when $f = 0$,
  and at most $q^(- \( 4 - f \))$ when $f gt.eq 1$. There are $O_K \( q^(4 - j) \)$ generator and bit assignments.
  Summing over $j$ shows that the conditional expected number of successful tuples in a fixed direction is
  $O_K \( q \)$, and that the count using an exposed generator is $O_K \( 1 \)$.
  If the target line itself is prescribed, every nonfixed position must lie on that line.
  We can then use $q^(- \( 4 - f \))$ also when $f = 0$, giving conditional total $O_K \( 1 \)$ on the prescribed line.

When all generators are exposed, we must also keep the distinctness requirement in the definition of success.
  Four distinct fixed positions can succeed in at most one target direction.
  We use this observation whenever we sum fully exposed tuples over targets;
  otherwise such a sum would introduce a spurious factor of $q$.

=== 4.2 Many distinct valid lines <many-distinct-valid-lines>

There are two obstacles to obtaining large sets $Q_g$: several successful tuples may lie on the same line,
  and some successful tuples may fail validity. We first control the concentration on individual lines,
  then count the validity failures.

Let $H_g$ be the number of ordered successful tuples in direction $g$.
  Before alignment is imposed, the four positions of a tuple are independent uniform affine points:
  each uses two offsets of different generators, and all eight offsets are used once.
  There are $16 \( q \)_4$ prescriptions, where $\( q \)_4 = q \( q - 1 \) \( q - 2 \) \( q - 3 \)$, so

$ bb(E) H_g = \( 16 + o \( 1 \) \) q . $

Let $Y_g$ be the sum over $g$-lines of the square of the number of successful tuples on that line.
  Equivalently, $Y_g$ counts ordered pairs of successful tuples with a common target line.
  After bounded colour exposure, choose the first tuple at expected cost $O \( q \)$;
  exposing its colours then makes its target line specified, so the second tuple costs $O \( 1 \)$.
  If the pair is required to use an already exposed colour, start with a tuple having that overlap,
  at cost $O \( 1 \)$, and again count the second on its specified line at cost $O \( 1 \)$.

These are exactly the conditional total and overlap bounds in Lemma 10(ii), for both $H_g$ and $Y_g$;
  in particular, $bb(E) Y_g = O \( q \)$. Its tail estimate and a union bound give, with probability $1 -
  o \( 1 \)$ simultaneously for every $g$,

#[#set math.equation(numbering: n => "(20)")
 $ H_g gt.eq 8 q \, wide Y_g lt.eq C_1 q $ <eq:tuple-counts>]

for an absolute constant $C_1$.

We next show that only $O \( q^theta \)$ successful tuples in each direction fail the extra validity tests,
  with probability $1 - o \( 1 \)$ uniformly over directions.
  For each failure, count the tuple together with a bounded witness of that failure; overcounting is harmless.
  In each of the three cases below the conditional expected witness count is $O \( 1 \)$ after any bounded further
  colour exposure. Lemma 10(i) then supplies the required tail bound.

===== 4.2.1 A constituent target line. <a-constituent-target-line.>

First fix the two offsets of $g$. The target must be one of the two specified constituent lines,
  and the prescribed-line estimate gives conditional total $O \( 1 \)$.

===== 4.2.2 An opposite adjacency. <an-opposite-adjacency.>

A witness consists of an extra colour and an orientation pairing two opposite positions.
  This colour is neither the target nor a generator: a generator pairs consecutive positions.
  If the witness colour is fresh, first expose a successful tuple, at expected cost $O \( q \)$.
  The choices for the witness then cost $O \( q \) q^(- 2) = O \( q^(- 1) \)$, giving total $O \( 1 \)$.

If the witness colour is already exposed, distinguish whether a tuple generator also overlaps the exposure.
  With such an overlap the basic tuple count is $O \( 1 \)$.
  With all tuple generators fresh, enumerate the target line instead.
  The exposed witness forces two exact positions on that line, and the other two positions must lie on it.
  For fixed labels and line this costs at most $q^(- 6)$, against $O \( q^5 \)$ choices of line and tuple labels.
  This case also has conditional total $O \( 1 \)$.

===== 4.2.3 An external point adjacent to two positions. <an-external-point-adjacent-to-two-positions.>

Here the witness consists of two distinct extra colours, their orientations,
  and their common external point $w$ on the target line. Tuple generators cannot witness this condition.
  If both witness colours are fresh, expose a successful tuple first.
  There are then $O \( q^2 \)$ colour choices and $q$ choices for $w$, each with probability at most $q^(- 4)$.
  Their total cost is $O \( q^(- 1) \)$, against the $O \( q \)$ cost of the tuple.

If a witness colour is exposed, first specify that colour and its orientation.
  For a tuple overlapping the exposure, the tuple costs $O \( 1 \)$,
  and $w$ is forced after the tuple’s offsets are exposed. The other witness costs $O \( 1 \)$ if it is exposed
  and $O \( q^(- 1) \)$ if it is fresh. If instead all tuple generators are fresh, enumerate the target line:
  the exposed witness prescribes $w$ and one exact tuple position.
  For fixed labels and line the tuple costs at most $q^(- 5)$, against $O \( q^5 \)$ choices.
  The remaining witness still costs at most $O \( 1 \)$.

These witnesses exhaust the extra validity failures. Subtracting their counts from $H_g$ in (20) leaves linearly
  many valid tuples. Cauchy–Schwarz, together with $Y_g lt.eq C_1 q$,
  shows that these tuples occupy at least $c_(*) q$ distinct lines.
  Retaining one tuple on each such line gives $\| Q_g \| gt.eq c_(*) q$; the upper bound $\| Q_g \| lt.eq
  q$ follows from the number of lines in a parallel class. This proves Proposition 9(i).

=== 4.3 Incidence estimates for candidates <incidence-estimates-for-candidates>

We have obtained enough candidates in every direction. To control their conflicts,
  we now count tuples with prescribed point and line incidences.
  All counts in this subsection include every successful tuple before retention.
  They therefore bound the corresponding retained counts, and their two slot copies change the bounds by at most a
  factor of two.

The following assertions hold simultaneously with probability $1 - o \( 1 \)$:

+ For a fixed target $g$ and any line $ell$, at most $q^theta$ successful tuples designate a point on $ell$.
+ For any nonconstituent line $ell$, at most $C_2 q$ successful tuples, over all targets, designate a point on $ell$.
+ For any two distinct specified generators, at most $q^theta$ successful tuples, over all targets, use both.
+ Each of the following counts, over all targets, is at most $q^theta$:
  tuples designating a specified point $y$; tuples whose line passes through $y$ and which designate a point on a
  specified line $K$ not containing $y$; and tuples having two different designated positions on two specified
  distinct nonconstituent lines, one on each.

Assertions (a) and (b) control point-on-line conflicts within a slot and over all slots, respectively.
  Assertion (c) controls conflicts from shared generators. The more constrained incidences in (d) will control
  common neighborhoods. To obtain simultaneous bounds, we verify the conditional counts required by the moment
  lemma for each assertion.

For (a), a tuple with no exposed generator has probability at most $4 q^(- 4)$:
  alignment costs $q^(- 3)$, and a designated hit on the fixed line costs a further $q^(- 1)$.
  This remains true whether the hit forces the target line or one point on it.
  Tuples overlapping the exposure have conditional total $O \( 1 \)$ by the basic fixed-target bound.
  Thus the bounded-total estimate of Lemma 10(i) applies.

For (b), let $h$ be the direction of $ell$ and first condition on the offsets of $h$ avoiding $ell$,
  as required for $ell$ to be a nonconstituent. Target direction $h$ itself is covered by (a).
  For the other targets, let $j$ count generators in a bounded exposed set that includes $h$.
  When $j = 0$, the expected total is $O \( q \)$. When $j = 1$,
  there are $O \( q^4 \)$ assignments including the target, and the hit probability is at most $4 q^(- 4)$.
  To see the additional factor needed here, condition on the common target-line coordinate.
  A fresh position hits $ell$ with probability $q^(- 1)$, while a position on an exposed constituent can hit $ell$
  for at most one common coordinate, since that constituent is not $ell$.

For $j = 2 \, 3$, the crude success probabilities $q^(- 3) \, q^(- 2)$ suffice against $O \( q^3 \) \,
  O \( q^2 \)$ assignments. For $j = 4$, the distinct fixed positions allow at most one target.
  Hence all overlap counts are $O \( 1 \)$. Tuples using $h$ satisfy the bounded-total estimate of Lemma 10(i).
  Those not using $h$ satisfy its centered estimate under the initial conditioning on $h$,
  with mean $O \( q \)$ uniformly. This proves (b), including a union bound over test lines and the possible fixed
  offsets of $h$.

For (c), initially condition on the two specified generators.
  The across-target estimates for $j gt.eq 2$ in the preceding paragraph did not use the requirement of a hit on
  $ell$. They therefore give conditional total $O \( 1 \)$ after any bounded further exposure,
  as required by Lemma 10(i).

For either of the first two tests in (d), choosing the target direction prescribes the target line and one exact
  position on it. With $j = 0$ the probability per assignment is at most $4 q^(- 5)$, and with $j =
  1$ it is $O \( q^(- 4) \)$. In the latter case, even when the exact position is constrained to an exposed
  constituent, specifying it costs at least $q^(- 1)$; each of the other three positions must lie on the
  prescribed target line. The across-target bounds for $j gt.eq 2$ suffice as before.

For the last test in (d), condition on the offsets in the direction or directions of the two test lines,
  avoiding those lines. For a target different from these directions,
  requiring two different positions to meet the two lines costs two further factors $q^(- 1)$ when $j = 0$,
  and at least one further factor when $j = 1$. Use the crude success bounds when $j gt.eq 2$.
  If the target equals a test direction, its line must be the specified test line;
  the prescribed-line estimate then suffices. Thus every test in (d) has conditional total $O \( 1 \)$.

There are only polynomially many tests in (a)–(d). Arbitrarily high fixed moments and a union bound prove the
  assertions. All estimates made after initial conditioning are uniform in the allowed fixed offsets,
  so averaging over those offsets preserves the bounds.

=== 4.4 Degrees, codegrees, and initial occupancy <degrees-codegrees-and-initial-occupancy>

We now translate the incidence estimates into the graph assertions of Proposition 9.
  For the first compatibility condition, the two ways a conflict can occur are represented by

$ B_v = { w : L_w ∩ F_v eq.not diameter } \, wide E_v = { w : F_w ∩ L_v eq.not diameter } . $

The one-per-line retention rule gives $\| B_v \| = O \( q \)$ and at most four members of $B_v$ in any slot.
  Since a valid tuple’s line $L_v$ is not a constituent, (b) gives $\| E_v \| = O \( q \)$;
  (a) gives at most $q^theta$ members of $E_v$ in any slot.

The other compatibility conditions contribute fewer conflicts.
  Two shared generators give $O \( q^theta \)$ vertices by (c).
  For the condition on slots with the same target direction, every merged pair witnessing a conflict meets $F_v$.
  Once the constituent multiplicity estimate below holds, there are at most $4 ceil.l log q ceil.r$ such pairs.
  Assertion (a), applied to their constituents in the other slot of this direction,
  bounds the candidates they meet. These conflicts contribute $O \( q^theta ceil.l log q ceil.r \)$ vertices.
  Together the three types give the required degree bounds.

For codegrees, the exceptional set has a direct geometric description.
  Define $J \( v \)$ to consist of vertices on the same line as $v$ or sharing a designated point with $v$.
  The retention rule and the first test in (d) give $\| J \( v \) \| = O \( 1 + q^theta \)$.
  Every member is either in $v$’s slot or adjacent to $v$, as asserted in part (iii).

Fix $w in.not J \( v \)$. Then $L_v \, L_w$ are distinct and $F_v \, F_w$ are disjoint.
  We first bound common neighbors arising from the first compatibility condition,
  by considering the four intersections of their $B$ and $E$ sets.
  A member of $B_v ∩ B_w$ has a line joining a point of $F_v$ to a point of $F_w$.
  There are only a bounded number of such lines, hence a bounded number of candidate vertices by retention.

For $B_v ∩ E_w$, choose $y in F_v$ on the candidate line. If $y in.not L_w$, the point-line test in (d) applies.
  If $y in L_w$, the candidate line is either $L_w$, or its designated point on $L_w$ must be $y$.
  The one-per-line rule and the point test in (d) handle these two possibilities.
  The same argument bounds $E_v ∩ B_w$. Finally, a member of $E_v ∩
  E_w$ either has two different designated positions on $L_v \, L_w$, or designates their intersection.
  The last or first test in (d), respectively, applies.

The remaining conflict types add at most $O \( q^theta ceil.l log q ceil.r \)$ to these common-neighbor bounds,
  by the bounds already used for degrees. Since $theta < beta = 1 \/ 8$, the exceptional-set size,
  codegree bounds, and within-slot degree bounds are all at most $q^beta$ for sufficiently large $q$.
  This proves parts (ii) and (iii), subject only to the multiplicity estimate we now establish along with the rest
  of part (iv).

The number of constituents through a fixed affine point has distribution $"Bin" \( 2 \( q + 1 \) \, 1 \/ q \)$,
  counting multiplicity. Its tail at $ceil.l log q ceil.r$ is $q^(- omega \( 1 \))$,
  so a union bound over the $q^2$ affine points proves the multiplicity estimate.

For the uncovered-point estimate, fix a line $ell$ of direction $h$.
  The $q$ lines $M_g^1$ with $g eq.not h$ hit $ell$ at independent uniform points.
  If $U_ell$ counts points missed by these hits, then

$ bb(E) U_ell = q \( 1 - 1 \/ q \)^q . $

Changing one hit changes $U_ell$ by at most one. Apply Lemma 20 to these $q$ independent trials with $L = 1$,
  and then Lemma 19 to their exposure martingale. Since $\( 1 - 1 \/ q \)^q arrow.r e^(- 1) > 1 \/ 5$,
  there is a fixed $delta > 0$ such that $bb(E) U_ell - q \/ 5 gt.eq delta q$ for all sufficiently large $q$.
  Taking deviation $u = delta q$, a fixed positive multiple of $q$,
  gives probability $exp \( - Omega \( q \) \)$ that $U_ell < q \/ 5$.
  If $ell eq.not M_h^1$, the remaining parallel line $M_h^1$ does not meet it.
  A union bound over all lines therefore proves the uncovered-point assertion in (iv).

All failure probabilities above sum to $o \( 1 \)$ in the independent sampling model.
  Independently across directions, the probability that each constituent pair is distinct is

$ \( 1 - 1 \/ q \)^(q + 1) = e^(- 1) + o \( 1 \) . $

Intersecting this event with the event of probability $1 -
  o \( 1 \)$ just proved gives the final assertion of Proposition 9.

== 5 Selecting split lines <sec:selection>

The candidate graph supplies many choices in each slot; we must now choose one vertex from every slot without
  creating a conflict. We need two further properties of this choice.
  First, an event prescribing the chosen vertices in several slots must have small probability.
  Such an event is called a #emph[cylinder], and its bound will allow us to count exceptional pencil
  configurations. Second, the chosen split lines must leave a positive proportion of the initially available
  points on every affine line.

We prove these properties together in a graph statement whose bounds are uniform over all inputs satisfying the
  hypotheses. The cylinder bound includes the event that the procedure succeeds;
  we do not condition the individual choices on eventual success.

#thm([Proposition 5.1.])[
  (Selection with bounded cylinder probabilities).  #emph[Fix constants $c_(*) \, C_(*) > 0$ and $0 < c_0 lt.eq
    1$, and put $beta = 1 \/ 8$. For each sufficiently large integer $q$,
    let a finite graph have its vertex set partitioned into $n = 2 \( q + 1 \)$ slots $Q_i$,
    with no edge within a slot. Write $N \( v \)$ for the neighborhood of a vertex. Suppose that
#[#set math.equation(numbering: n => "(21)")
 $ c_(*) q lt.eq \| Q_i \| lt.eq q \, & wide \| N \( v \) \| lt.eq C_(*) q \, wide \| N \( v \) ∩ Q_i \| lt.eq
   q^beta \,\
\| J \( v \) \| lt.eq q^beta \, & wide \| N \( v \) ∩ N \( w \) \| lt.eq q^beta quad \( w in.not J \( v \) \) \,
  $ <sel:graph-bounds>]

 where every $w in J \( v \)$ is either adjacent to $v$ or in its slot.
   There are constants $K_(*) \, rho > 0$, depending only on $c_(*) \, C_(*) \, c_0$,
   and a random procedure which either fails or returns an independent transversal $\( V_i \)_(i in I_0)$,
   where $I_0$ is the set of slots and $V_i in Q_i$. If $cal(A)$ denotes its event of returning a transversal, then
#[#set math.equation(numbering: n => "(22)")
 $ bb(P) \( cal(A) \) = 1 - o \( 1 \) . $ <sel:success>]

 For any $s$ distinct slots $i_1 \, dots.h \, i_s$ and any prescribed vertices $v_j in Q_(i_j)$,
#[#set math.equation(numbering: n => "(23)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(A) \, V_(i_j) = v_j med \( 1 lt.eq j lt.eq s \)
   #scale(x: 120%, y: 120%)[\)] lt.eq \( K_(*) \/ q \)^s . $ <sel:cylinder>]

]
  #emph[Suppose also that the slots are indexed by $\( g \, k \)$,
    with two slots for each direction $g$ of an affine plane of order $q$.
    Associate to each vertex in slot $\( g \, k \)$ a line of direction $g$, injectively within that slot.
    For every affine line $ell$, let $T_ell subset.eq ell$ be a fixed set of at least $c_0 q$ points.
    From $T_ell$ remove every point on a selected line different from $ell$,
    and call the remaining set $T_ell^(upright("fin"))$. Then the same procedure satisfies
#[#set math.equation(numbering: n => "(24)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(A) \, min_ell \| T_ell^(upright("fin")) \| < rho q
   #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <sel:occupancy-conclusion>]

 The errors in (22) and (24) are uniform in all the stated input data.
   By the injectivity within a slot, (23) also holds for prescribed candidate lines.]
] <sel:selection>

The selection has two stages. In the main stage we repeatedly choose a slot and a vertex, delete conflicts,
  and thin the remaining choices so that every vertex has the same survival probability.
  Domain sizes then decrease at a common rate. Remaining degrees decrease faster,
  because the chosen slot also disappears. We show that this difference leaves a sparse enough graph to complete
  the last slots by the local lemma. Partial random selection followed by local-lemma completion also appears in
  Loh and Sudakov #cite(label("LohSudakov2007")) Section 4.
  Here we additionally track occupancy on each affine line and prove a cylinder bound for the complete returned
  transversal.

The main technical issue is concentration of the remaining degrees.
  A choice in $J \( v \)$ can delete many neighbors of $v$, but it also kills $v$ or removes its slot.
  We will use this implication to stop tracking $v$ after such a choice,
  without losing any degree estimate needed for a subsequent step.

=== 5.1 The main selection process <the-main-selection-process>

We first specify the main stage, including the events on which it aborts.
  Choose the constants $P_(*) \, s_min \, B_(*) \, rho \, a$ in the displayed order,
  and define the $q$-dependent parameters $alpha \, h_0 \, t_max$ alongside them:

#[#set math.equation(numbering: n => "(25)")
 $ P_(*) & = 4 C_(*) \/ c_(*) + 4 \, & alpha & = P_(*) \/ q \, & s_min & = exp \( - 6 P_(*) \) \,\
B_(*) & = 2 \/ \( s_min c_(*) \) \, & rho & = c_0 exp \( - 6 B_(*) \) \/ 4 \,\
0 < a & < min { 1 \, rho \/ 2 \, c_(*) \/ \( 100 \( C_(*) + 1 \) \) } \, & h_0 & =
  ceil.l a q ceil.r \, & t_max & = n - h_0 . $ <sel:constants-one>]

All subsequent assertions concern sufficiently large $q$.
  The main stage runs for at most $t_max$ steps, leaving $h_0$ slots if it reaches completion.
  At time $t$, before the next step, let $I \( t \)$ be the remaining slots, $h \( t \) = n - t$,
  and $Q_i \( t \)$ their domains of vertices still alive. Put

#[#set math.equation(numbering: n => "(26)")
 $ L_i \( t \) = \| Q_i \( t \) \| \, wide s \( t \) = \( 1 - alpha \)^t \, wide b \( t \) =
   s \( t \) h \( t \) \/ n . $ <sel:scales>]

Initially all slots and vertices are present. The factors $s \( t \)$ and $b \( t \)$ will be the respective
  scales for domain sizes and remaining degrees. Throughout $0 lt.eq t lt.eq t_max$,

#[#set math.equation(numbering: n => "(27)")
 $ s_min lt.eq s \( t \) lt.eq 1 \, wide s_min a \/ 3 lt.eq b \( t \) lt.eq 1 . $ <sel:scale-lower>]

Indeed $n lt.eq 3 q$, $h \( t \) gt.eq a q$, and $log \( 1 - P_(*) \/ q \) gt.eq - 2 P_(*) \/ q$ for large $q$.

Each main step begins with two checks. First, abort if some remaining domain satisfies

#[#set math.equation(numbering: n => "(28)")
 $ L_i \( t \) < s \( t \) c_(*) q \/ 2 . $ <sel:size-barrier>]

For every alive vertex $v$ in a remaining slot define

#[#set math.equation(numbering: n => "(29)")
 $ D_v \( t \) = sum_(i in I \( t \)) \| N \( v \) ∩ Q_i \( t \) \| \, wide r_v \( t \) =
   frac(1, h \( t \)) sum_(i in I \( t \)) frac(\| N \( v \) ∩ Q_i \( t \) \|, L_i \( t \)) . $ <sel:degree-hazard>]

Here $r_v \( t \)$ is the probability that a uniform choice from a uniformly chosen remaining slot is adjacent to
  $v$. The second check aborts if any such $r_v \( t \) > alpha$.

If both checks pass, choose a uniform slot $G in I \( t \)$ and then a uniform vertex $W in Q_G \( t \)$.
  Record $W$ as the choice for $G$ and delete all its neighbors.
  For every vertex $u$ alive before this step and not adjacent to $W$, independently delete it with probability

#[#set math.equation(numbering: n => "(30)")
 $ lambda_u = frac(alpha - r_u \( t \), 1 - r_u \( t \)) . $ <sel:thinning-rate>]

Compute all rates before choosing $G \, W$. The pre-step checks ensure $0 lt.eq lambda_u lt.eq alpha < 1$.
  For the estimates below, perform this thinning hypothetically in slot $G$ as well:
  the recorded choice $W$ is retained regardless of its hypothetical deletion. Finally remove slot $G$.
  Thus, before slot removal, every previously alive vertex has the same conditional survival probability:

#[#set math.equation(numbering: n => "(31)")
 $ \( 1 - r_u \( t \) \) \( 1 - lambda_u \) = 1 - alpha . $ <sel:equal-survival>]

A final check takes place after the step. Count the thinning deletions in each domain present at its start and in
  each set $N \( v \) ∩ union.big_(i in I \( t \)) Q_i \( t \)$ then counted by a $D_v \( t \)$.
  Abort if any such count exceeds $q^beta$, including hypothetical thinning in $G$.
  This check limits the size of the increments used in the concentration argument.

The probability of a post-step abort is small uniformly over all histories that pass the pre-step checks.
  Conditional on such a history and on $G \, W$, each tested count is a sum of independent Bernoulli variables
  with total mean at most $mu_(*) = P_(*) max { 1 \, C_(*) }$. For such a sum $Z$ and any integer $k gt.eq 1$,

#[#set math.equation(numbering: n => "(32)")
 $ bb(P) \( Z gt.eq k \) lt.eq bb(E) binom(Z, k) lt.eq mu_(*)^k \/ k ! lt.eq \( e mu_(*) \/ k \)^k .
   $ <sel:bernoulli-tail>]

The middle inequality follows by expanding the factorial moment and bounding the sum of products of $k$ distinct
  success probabilities by $mu_(*)^k \/ k !$. With $k = floor.l q^beta floor.r + 1$, the final bound,
  denoted $epsilon_q$, is smaller than $q^(- m)$ for every fixed $m$ once $q$ is sufficiently large.
  There are $O \( q^2 \)$ tested sets per step and at most $3 q$ steps.
  Thus any post-step abort has probability $O \( q^3 epsilon_q \) = o \( 1 \)$.

=== 5.2 Concentration with stopping and censoring <concentration-with-stopping-and-censoring>

We now show that the main stage reaches the last $h_0$ slots with large domains and small remaining degrees.
  Let $cal(F)_t$ be the original history just before the next random slot and vertex are chosen.
  All conditional expectations in this subsection use this filtration; in particular,
  the next slot is still uniform among the remaining slots.

We use auxiliary processes that agree with the quantities of interest until they are stopped.
  Stopping means holding the last value fixed. A pre-step abort produces no increment.
  A performed step contributes its specified increment before any post-step stop.
  When a large decrement is censored below, only the auxiliary update is replaced;
  the actual selection procedure is unchanged.

The concentration tool is Lemma 19, the appendix form of the Azuma–Hoeffding estimate #cite(label("Azuma1967")).
  For an adapted process $X_t$ with $\| X_(t + 1) - X_t \| lt.eq L$ for $0 lt.eq t < T$, put $d_t =
  bb(E) \[ X_(t + 1) - X_t divides cal(F)_t \]$. Its fixed-time conclusion is

#[#set math.equation(numbering: n => "(33)")
 $ bb(P) (lr(|X_t - X_0 - sum_(j < t) d_j|) gt.eq u) lt.eq
   2 exp (- frac(u^2, 8 T L^2)) wide \( t lt.eq T \) . $ <sel:azuma>]

The stopped auxiliary processes satisfy the same increment hypothesis.
  For domain sizes we will bound the absolute accumulated drift; for degrees an upper bound suffices,
  and for occupancy we will use a lower bound.

===== 5.2.1 Domain sizes. <domain-sizes.>

For each initial slot $i$, begin an auxiliary process at $L_i \( 0 \)$ and track $L_i \( t \) \/
  s \( t \)$ while the slot remains present. In a performed step,
  let $L_i^(+)$ be its size after conflicts and thinning but before removing $G$.
  This definition includes the hypothetical update when $G = i$. Equal survival in (31) gives

#[#set math.equation(numbering: n => "(34)")
 $ bb(E) \[ L_i^(+) divides cal(F)_t \] = \( 1 - alpha \) L_i \( t \) . $ <sel:size-expectation>]

If this domain’s thinning count exceeds $q^beta$, replace the numerator $L_i^(+)$ by $L_i \( t \)$,
  update the auxiliary value to $L_i \( t \) \/ s \( t + 1 \)$, and then stop it.
  Otherwise update to the true value $L_i^(+) \/ s \( t + 1 \)$ and stop after this update if $G =
  i$ or if the whole process aborts. Until such a stop, the auxiliary process agrees with $L_i \( t \) \/ s \( t \)$.

The replacement changes the conditional expectation of the numerator by at most $q epsilon_q$.
  Consequently the conditional drift of this rescaled track has absolute value at most $q epsilon_q \/ s_min$.
  Its increments are $O \( q^beta \)$: there are at most $q^beta$ conflict deletions in a slot by (21),
  and at most $q^beta$ thinning deletions on a step without replacement.
  The scaling change contributes only $O \( 1 \)$, by (27).
  On a replaced step the scaling change is the only contribution.

===== 5.2.2 Remaining degrees. <remaining-degrees.>

For each initial vertex $v$, begin at $D_v \( 0 \)$ and track $D_v \( t \) \/
  b \( t \)$ while $v$ is alive and its slot remains present.
  The faster scale $b \( t \)$ accounts for the removal of the chosen slot.
  To verify the required drift, let $tilde(D)_v$ be the true updated neighbor count after a performed step,
  including removal of $G$, whether or not $v$ itself survives.
  For each currently counted neighbor $u$, its probability of surviving before slot removal is $1 - alpha$.
  If $u$’s own slot is chosen, it cannot conflict with $W$, because there are no within-slot edges. Therefore

$ bb(P) \( u upright(" survives before removal and its slot is ") G divides cal(F)_t \) = \( 1 - lambda_u \) \/
  h \( t \) gt.eq \( 1 - alpha \) \/ h \( t \) . $

Subtracting this slot-removal probability from $1 - alpha$ and summing over the currently counted neighbors gives

#[#set math.equation(numbering: n => "(35)")
 $ bb(E) \[ tilde(D)_v divides cal(F)_t \] lt.eq \( 1 - alpha \) \( 1 - 1 \/ h \( t \) \) D_v \( t \) =
   frac(b \( t + 1 \), b \( t \)) D_v \( t \) . $ <sel:degree-drift>]

We next bound the increments. When $W in.not J \( v \)$, conflicts remove at most $q^beta$ counted neighbors by
  (21), and slot removal costs at most $q^beta$ by (21). If instead $W in J \( v \)$,
  or if the thinning count in the current neighbor set exceeds $q^beta$, censor the auxiliary update:
  replace $tilde(D)_v$ by $D_v \( t \)$, update to $D_v \( t \) \/ b \( t + 1 \)$, and then stop the track.
  In every other case update to $tilde(D)_v \/ b \( t + 1 \)$, and then stop if $v$ has died,
  its slot has been removed, or the whole process has aborted.

The exceptional choice has conditional probability at most

#[#set math.equation(numbering: n => "(36)")
 $ bb(P) \( W in J \( v \) divides cal(F)_t \) lt.eq frac(\| J \( v \) \|, h \( t \) min_i L_i \( t \)) lt.eq
   frac(2 q^beta, a s_min c_(*) q^2) = O \( q^(beta - 2) \) . $ <sel:exception-probability>]

Since $D_v \( t \) lt.eq C_(*) q$, censoring increases the numerator’s conditional expectation by at most
  $O \( q^(beta - 1) \) + C_(*) q epsilon_q$. By (35) and (27),
  the rescaled track thus has conditional drift at most $O \( q^(beta - 1) \)$.
  Its increments have absolute value $O \( q^beta \)$. Without replacement the raw decrement is at most $3
  q^beta$; with replacement it is zero. The relative change of $b \( t \)$ is $O \( 1 \/ q \)$,
  uniformly because $h \( t \) gt.eq a q$, so its scaling contribution is again $O \( 1 \)$.

This is the point at which we use the location of the exceptional set $J \( v \)$, not just its size.
  If $W in J \( v \)$, then $W$ is adjacent to $v$ or belongs to its slot.
  After this step $v$ is therefore dead or its slot has been removed.
  A track stopped for this reason can never be needed at a later barrier check.

===== 5.2.3 Simultaneous estimates and absence of aborts. <simultaneous-estimates-and-absence-of-aborts.>

The domain and degree processes now have the bounded increments and drift estimates needed for (33).
  Apply that fixed-time bound with deviation $q^(4 \/ 5) \/ 2$ separately to each track and each time.
  There are $O \( q^2 \)$ tracks and $O \( q \)$ times. The individual exceptional probability is at most

$ 2 exp { - Omega \( q^(8 \/ 5 - 1 - 2 beta) \) } = 2 exp { - Omega \( q^(7 \/ 20) \) } . $

The total absolute drift of a domain-size track is $o \( 1 \)$ and the total upper drift of a degree track is
  $O \( q^beta \)$. It follows, by a union bound and by $s \( t \) \, b \( t \) lt.eq 1$,
  that with probability $1 - o \( 1 \)$,

#[#set math.equation(numbering: n => "(37)")
 $ \| L_i \( t \) - s \( t \) L_i \( 0 \) \| lt.eq q^(4 \/ 5) \, wide D_v \( t \) lt.eq b \( t \) D_v \( 0 \) +
   q^(4 \/ 5) $ <sel:concentration>]

at every time when the auxiliary values still agree with the true rescaled quantities.

We can now rule out aborts. Exclude the post-step abort event,
  whose probability was already bounded by $o \( 1 \)$. At a putative first pre-step abort,
  every remaining slot and every alive vertex still has a track agreeing with its true rescaled quantity.
  A previous thinning censorship would have caused a post-step abort,
  and a previous exceptional choice would have killed the vertex or removed its slot.
  Thus (37) applies at this abort check itself. Its first inequality rules out (28) for large $q$. The second gives

#[#set math.equation(numbering: n => "(38)")
 $ r_v \( t \) lt.eq
   frac(s \( t \) \( h \( t \) \/ n \) C_(*) q + q^(4 \/ 5), h \( t \) \( s \( t \) c_(*) q - q^(4 \/ 5) \)) =
   frac(C_(*), c_(*) n) + o \( q^(- 1) \) < P_(*) \/ q . $ <sel:hazard-barrier>]

The error is uniform for $s \( t \) gt.eq s_min$ and $h \( t \) gt.eq a q$. Thus no pre-step abort occurs on this event.

To prepare the completion, make one final check at $t = t_max$.
  Abort unless the remaining minimum domain size $L_min$ and maximum degree $Delta$ satisfy

#[#set math.equation(numbering: n => "(39)")
 $ L_min gt.eq s \( t_max \) c_(*) q \/ 2 \, wide Delta \/ L_min lt.eq 1 \/ 8 . $ <sel:tail-check>]

The same estimates imply

$ Delta / L_min lt.eq h_0 / n C_(*) / c_(*) + o \( 1 \) arrow.r frac(a C_(*), 2 c_(*)) < 1 / 8 . $

Therefore the main process reaches and passes its final check with probability $1 - o \( 1 \)$,
  uniformly in its input graph.

=== 5.3 Keeping points on every line <keeping-points-on-every-line>

The preceding estimates control the available vertices. We next control the points left on affine lines,
  under the additional geometric hypotheses of Proposition 11.
  Fix a line $ell$, start with $T_ell$, and remove its intersections with the main selected lines other than
  $ell$. Write $T \( t \)$ for the number of points still present. Each step decreases $T \( t \)$ by at most one.

Consider a slot whose direction differs from that of $ell$.
  Conditional on the current history, at most $T \( t \)$ candidate lines in that slot meet a remaining point:
  each such line is determined by its intersection with $ell$,
  and the assignment of lines within a slot is injective. A line in the same direction as $ell$ makes no deletion
  under our convention. The size barrier therefore gives

#[#set math.equation(numbering: n => "(40)")
 $ bb(P) \( T \( t + 1 \) = T \( t \) - 1 divides cal(F)_t \) lt.eq frac(B_(*) T \( t \), q) \, wide
   bb(E) \[ T \( t + 1 \) divides cal(F)_t \] gt.eq \( 1 - B_(*) \/ q \) T \( t \) . $ <sel:occupancy-drift>]

Track $T \( t \) \/ \( 1 - B_(*) \/ q \)^t$, freezing on an abort and including a performed step’s increment
  before a post-step freeze. For $t lt.eq 3 q$ its denominator is at least $e^(- 6 B_(*))$.
  Its conditional drift is nonnegative, and its increments have bounded absolute value independently of $q$:
  the raw size changes by at most one and $T \( t \) lt.eq q$ controls the change of scale.

Apply the lower-tail consequence of (33) to these stopped processes and take a union bound over the
  $q \( q + 1 \)$ affine lines. The probability that the main stage completes while some line has final main size below

#[#set math.equation(numbering: n => "(41)")
 $ c_0 e^(- 6 B_(*)) q \/ 2 = 2 rho q $ <sel:occupancy-main>]

is $o \( 1 \)$. Any completion on the remaining $h_0$ slots removes at most $h_0$ further points from any one
  line. By $a < rho \/ 2$ and $h_0 = ceil.l a q ceil.r$, the terminal sizes are at least $rho q$ for large $q$.
  Thus the required occupancy estimate will hold for every successful tail completion on these histories.

=== 5.4 Completing the last slots <completing-the-last-slots>

After (39), the remaining graph is sparse enough for the Lovász local lemma.
  We need both an independent transversal and a bound on prescribed choices under the law used to choose it.
  The following conditional form supplies both, using the local-lemma argument of Erdős and
  Lovász #cite(label("ErdosLovasz1975")) Section 2.

#thm([Lemma 5.2.])[
  (Tail conditioning).  #emph[Let a graph be partitioned into slots of sizes $L_i$, with no within-slot edges.
    Let $L_min = min_i L_i$ and let its maximum degree be $Delta$.
    If $L_min gt.eq 3$ and $Delta \/ L_min lt.eq 1 \/ 8$, independent uniform choices from the slots have positive
    probability of being an independent transversal. Under the law conditioned on that event,
    a cylinder prescribing values in a set $J$ of $s$ slots has probability at most
#[#set math.equation(numbering: n => "(42)")
 $ e^(s \/ 2) product_(i in J) L_i^(- 1) . $ <sel:tail-cylinder-bound>]

 An impossible prescription has probability zero.]
] <sel:tail-cylinder>

#proof[
  For every edge $e = u v$ between slots $i \, j$, let $B_e$ be the event that those two endpoints are chosen and
    put $x_e = 2 \/ \( L_i L_j \)$. Two events are neighbors when their edges use a common slot.
    Each $B_e$ is jointly independent of all events outside its neighborhood. For each slot $i$,
  $ sum_(e upright(" using ") i) x_e lt.eq sum_(u in Q_i) frac(2 deg \( u \), L_i L_min) lt.eq
    frac(2 Delta, L_min) lt.eq 1 / 4 . $
  Thus a dependency neighborhood has total $x$-weight at most $1 \/ 2$. Since $x_e < 1 \/ 2$,
  $ bb(P) \( B_e \) = x_e \/ 2 lt.eq x_e product_(f tilde.op e) \( 1 - x_f \) \, $
  using $product \( 1 - x_f \) gt.eq 1 - sum x_f gt.eq 1 \/ 2$.
  We record the conditioning argument, since it also controls cylinders.
    Induction on the size of an avoidance set $S$ of other events gives positive avoidance probability and
  #[#set math.equation(numbering: n => "(43)")
   $ bb(P) \( B_e divides ⋂_(f in S) B_f^c \) lt.eq x_e . $ <sel:lll-induction>]
  Partition $S$ into nonneighbors $T$ and neighbors $U$ of $e$.
    If $U$ is empty, joint independence gives the assertion. Otherwise the induction hypothesis,
    used successively on the events of $U$, gives
  $ bb(P) (⋂_(f in U) B_f^c thin mid(bar.v) thin ⋂_(f in T) B_f^c) gt.eq product_(f in U) \( 1 - x_f \) . $
  Every conditioning set in this product has smaller size than $S$.
    The numerator after conditioning only on avoidance of $T$ is at most $bb(P) \( B_e \)$, by joint independence.
    Dividing by the displayed lower bound, and using $bb(P) \( B_e \) lt.eq
    x_e product_(f tilde.op e) \( 1 - x_f \)$, proves (43). Positivity at each size follows by successively
    avoiding its events and applying the preceding-size bound.
    Thus the induction establishes the probability bound and positivity together.
  Now fix a possible cylinder $C$ on slots $J$. Divide the bad events into those disjoint from $J$ and those using
    $J$. Avoiding the former leaves $bb(P) \( C \) = product_(i in J) L_i^(- 1)$ unchanged,
    since those events involve only other slots. By (43), avoiding the latter increases the upper bound by at most
    their product of $\( 1 - x_e \)^(- 1)$. Consequently
  $ bb(P) \( C divides upright("no bad event") \) lt.eq bb(P) \( C \)
    product_(e upright(" using ") J) \( 1 - x_e \)^(- 1) lt.eq
    bb(P) \( C \) exp (2 sum_(e upright(" using ") J) x_e) lt.eq e^(s \/ 2) bb(P) \( C \) . $
  Here $- log \( 1 - x \) lt.eq 2 x$ for $0 lt.eq x lt.eq 1 \/
    2$ and the incident weight per slot is at most $1 \/ 4$. Counting an event twice in the sum over prescribed
    slots only increases the upper bound. ◻
]

For every history passing (39), choose the tail according to the conditioned law in Lemma 12.
  Its hypotheses hold for large $q$, since the check also gives $L_min gt.eq s_min c_(*) q \/ 2 gt.eq 3$.
  The tail choices are mutually compatible, and the earlier neighbor deletions make them compatible with every
  main choice. There is no further failure. We have proved (22); the occupancy estimate,
  which allowed any successful completion of the last $h_0$ slots, also proves (24).

=== 5.5 Cylinder probabilities for the whole selection <cylinder-probabilities-for-the-whole-selection>

The remaining claim is (23). We must bound the probability of prescribed choices jointly with success,
  without conditioning a main choice on the later success of the procedure.
  For this purpose, realize the random slot order by sampling a uniform permutation $pi$ of all slots at the
  outset and using its first $n - h_0$ entries. Choose $pi$ independently of all randomness for vertex choices and
  thinning. This is the same process as before: the rates and abort decisions use no unexposed part of $pi$,
  and its next entry is uniform among the remaining slots in the original filtration.

Only now, for the cylinder calculation, condition on the entire permutation.
  This divides the prescribed slots deterministically into $s_(upright(m))$ main slots and $s_(upright(t))$ tail
  slots, with $s_(upright(m)) + s_(upright(t)) = s$. At any prescribed main slot reached before abort,
  the vertex is still uniform in its current domain when $pi$ is fixed.
  The pre-step size barrier therefore bounds the probability of its prescribed value by

$ frac(2, s_min c_(*) q) . $

Multiplication of these conditional upper bounds at the specified main steps bounds the probability of reaching
  and satisfying them all. An intervening abort only lowers that probability.
  Given any completed history passing the tail check, Lemma 12 bounds the tail prescription by

$ (frac(2 e^(1 \/ 2), s_min c_(*) q))^(s_(upright(t))) . $

Taking conditional expectations backwards from the tail and then through the prescribed main steps gives

$ bb(P) \( cal(A) \, upright(" all prescriptions") divides pi \) lt.eq
  (frac(2, s_min c_(*) q))^(s_(upright(m))) (frac(2 e^(1 \/ 2), s_min c_(*) q))^(s_(upright(t))) . $

Average over $pi$ and take

#[#set math.equation(numbering: n => "(44)")
 $ K_(*) = max { 1 \, 2 e^(1 \/ 2) \/ \( s_min c_(*) \) } . $ <sel:cylinder-constant>]

This proves (23) and completes Proposition 11. The two uses of the slot order are distinct:
  all drift estimates were taken in the original filtration, where the next slot remained uniform.
  Fixing the full permutation was used only to multiply the cylinder bounds.
  No drift identity was asserted or used under that conditioning.

=== 5.6 Application to the deletion lines <sec:selection-application>

We now apply the graph result to the geometric construction.
  Proposition 9 supplies the domain and degree bounds, the codegree bound,
  and the exceptional sets required by Proposition 11. Its retained candidates are injective in their lines within
  each slot, and an independent transversal is a compatible collection of split tuples.
  For the occupancy statement, take

$ T_ell =
  cases(delim: "{", ell \, & ell in { M_g^1 : g in cal(G) } \,, ell \\ union.big_g M_g^1 \, & upright("otherwise") .) $

The same graph proposition gives $\| T_ell \| gt.eq c_0 q$.
  Recall from (3) that $R_0$ avoids the deletion lines, whereas $R$ avoids only the selected split lines.
  If $ell$ is neither a selected split line nor one of the $M_g^1$, its final tracked set is exactly $ell ∩ R_0$.
  For $ell = M_g^1$, the final set is $ell ∩ R$, because a constituent cannot be a candidate split line.
  Hence (24) gives the line occupancy required by the deterministic construction.

To describe the resulting deletion-line law, include the constituent sampling in the experiment.
  Sample the two offsets in each direction independently and with replacement, as in Section 4.
  Abort if the data fail the candidate graph conditions or if any constituent pair coincides;
  otherwise run the selection procedure. Write $cal(A)$ for the event that this entire experiment returns a
  collection. By Proposition 9 and (22), there is a fixed $a_0 > 0$ such that

#[#set math.equation(numbering: n => "(45)")
 $ bb(P) \( cal(A) \) gt.eq a_0 $ <sel:unconditional-success>]

for all sufficiently large $q$. For every fixed offset outcome $M$,

#[#set math.equation(numbering: n => "(46)")
 $ bb(P) \( cal(A) \, upright(" prescribed choices in ") s upright(" slots") divides M \)
   lt.eq \( K_(*) \/ q \)^s . $ <sel:conditional-offset-cylinder>]

These prescriptions may be chosen as functions of $M$, but are fixed once $M$ is fixed.
  If the initial check fails for that offset outcome, the left side is zero.
  This estimate lets us compare the law of the returned deletion set with a uniform law without changing the
  initial offset distribution.

#thm([Corollary 5.3.])[
  (Domination of the deletion-line law).  #emph[Let $D$ consist of the selected split lines and the lines $M_g^1$
    in the preceding experiment. Conditional on $cal(A)$, the law of $D$ is dominated pointwise by
    $exp \( O \( q \) \)$ times the uniform law on sets containing three distinct lines in each direction.]
] <sel:deletion-domination>

#proof[
  Fix such an unordered deletion set $D_0$. For each direction there are six assignments of its three lines to
    $M_g^1$, split slot 1, and split slot 2. For a fixed assignment in all directions,
    the initial probability of the prescribed $M_g^1$ values is $q^(- \( q + 1 \))$.
    Conditional on the full offset data, the probability of all prescribed split lines jointly with $cal(A)$ is at
    most $\( K_(*) \/ q \)^(2 \( q + 1 \))$, by (46). Averaging over the unconstrained offsets $M_g^0$ and summing
    over all role assignments gives
  $ bb(P) \( cal(A) \, D = D_0 \) lt.eq (frac(6 K_(*)^2, q^3))^(q + 1) . $
  The uniform law $U$ assigns $D_0$ probability $binom(q, 3)^(- \( q + 1 \))$. Dividing also by (45), we obtain
  #[#set math.equation(numbering: n => "(47)")
   $ frac(bb(P) \( D = D_0 divides cal(A) \), U \( D_0 \)) lt.eq
     a_0^(- 1) [K_(*)^2 \( 1 - 1 \/ q \) \( 1 - 2 \/ q \)]^(q + 1) lt.eq a_0^(- 1) K_(*)^(2 \( q + 1 \)) =
     exp \( O \( q \) \) . $ <sel:deletion-ratio>]
  All probabilities before this final conditioning use the original independent offset law;
    the event $cal(A)$ enforces the candidate graph conditions and constituent distinctness. ◻
]

== 6 Excluding small covers at affine pencils <sec:pencils>

The deterministic reduction leaves a specific obstruction at an affine point $p$.
  If $b$ selected split lines pass through $p$, a hypothetical cover has already spent $q + 1 -
  b$ of its labels on the other directions. Only $b - 1$ labels remain to cover the $4 b$ designated points,
  beyond those covered by partner lines of constituents through $p$.
  For $b gt.eq 3$, the local condition in Section 2 excludes precisely this possibility.
  We prove that the selection procedure returns a collection violating this condition with probability $o \( 1 \)$.

The input from selection is an upper bound for prescribed choices, conditional on fixed offsets.
  We first apply that bound and then average geometric events under the original independent offset law.
  In particular, successful return remains part of the event being estimated;
  we do not condition the offset law on successful return.

Throughout this section the offsets $M_d^0 \, M_d^1$ have the independent,
  with-replacement law used in the construction. Let $cal(A)$ be the event that the selection procedure returns a
  compatible collection. The conditional estimate (46), obtained from Proposition 11,
  says that for any fixed offset configuration $M$ and any $s$ prescribed tuple choices in distinct slots,

#[#set math.equation(numbering: n => "(48)")
 $ bb(P) \( cal(A) upright(" and these choices") divides M \) lt.eq \( K \/ q \)^s \, $ <eq:pencil-cylinder>]

where $K$ is the fixed constant in that estimate. The prescriptions may depend on $M$,
  provided they are fixed once $M$ is fixed. An unavailable tuple has probability zero,
  so they may range over all generator and bit labels. On $cal(A)$, $M_d^0 eq.not M_d^1$ for every direction $d$,
  no selected split line is a constituent, and constituent multiplicity at every point is at most $B =
  ceil.l log q ceil.r$.

#thm([Proposition 6.1.])[
  #emph[In the independent offset experiment with the selection procedure above,
$ bb(P) #scale(x: 120%, y: 120%)[\(] cal(A) upright(" and the local condition fails at some ") p in A
  #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $

 Here the local condition, required whenever $b \( p \) gt.eq 3$,
   is the prohibition on covers of $F \( p \)$ by $Z \( p \)$ and at most $b \( p \) -
   1$ additional sets stated in Section 2.]
] <prop:pencil-local>

The estimate at a fixed point must save three powers of $q$, since we will sum over $q^2$ affine points.
  We obtain those savings from two sources: repeated generator directions and additional incidences forced by a
  cover. Three generator reuses already cost $O \( q^(- 3) \)$.
  With zero, one, or two reuses, we will extract respectively three, two, or one further incidence costs.
  The resulting bound at a fixed point is $O \( B^3 \/ q^3 \)$,
  apart from the separately controlled event of a large pencil.

=== 6.1 Generator reuse in a selected pencil <generator-reuse-in-a-selected-pencil>

Fix $p in A$. Write $b$ for the number of selected split lines through $p$.
  Compatibility implies that their target directions are distinct and, when $b gt.eq 2$,
  that their $4 b$ designated points are distinct and different from $p$.
  Let $Gamma$ be the union of their generator directions and let $t_d$ be the number of tuples using $d in Gamma$.
  Define the reuse count

$ kappa = 4 b - \| Gamma \| = sum_(d in Gamma) \( t_d - 1 \) . $

Thus $kappa$ counts generator occurrences after their first use.
  Compatibility says that two tuples share at most one generator.

We first remove large pencils, so the later enumeration only has to handle $3 lt.eq b lt.eq B$.
  The number of selected lines through any point is at most $B$ except on an event of probability $o \( 1 \)$,
  jointly with $cal(A)$. Indeed, for a specified slot there is at most one retained candidate on the line of its
  direction through $p$. Conditional on $M$, the cylinder estimate and a union bound give

$ bb(P) \( cal(A) \, med b \( p \) gt.eq B divides M \) lt.eq binom(2 \( q + 1 \), B) \( K \/ q \)^B lt.eq (C / B)^B . $

The last expression, multiplied by $q^2$, tends to zero.

#thm([Lemma 6.2.])[
  #emph[For a fixed affine point $p$, with $kappa$ the reuse count of the selected tuples through $p$,
$ bb(P) \( cal(A) \, med b \( p \) gt.eq 2 \, med kappa gt.eq 3 \) = O \( q^(- 3) \) . $

]
] <lem:pencil-reuse>

#proof[
  We extract a bounded collection of tuples witnessing three reuses,
    then sum its selection and offset probabilities. Form a graph whose vertices are the tuples and join two
    vertices when their tuples share a generator. If the number of vertices minus the number of connected
    components is at least three, this graph contains connected pieces with a total of three noninitial vertices
    and at most six vertices altogether. To see this, allocate three units among the quantities $\| C \| -
    1$ for its components, and in each used component grow a connected set with one more vertex than its
    allocation. Order each piece from a root so that every subsequent vertex has a generator already used in the piece.
  If the number of vertices minus the number of components is at most two, then $kappa gt.eq
    3$ can occur only in a component of three vertices, with a different generator on each of the three pairwise
    overlaps. Two components of size two contribute at most two reuses.
    In a component of size three, one generator common to all three contributes exactly two reuses and precludes
    any additional overlap. Otherwise three reuses require the three distinct pairwise overlaps.
    In an ordering of this triangle, the second tuple has one old generator and the third has two.
  In either case the witness has bounded size. To bound the probability that one is selected,
    we bound the expected number of selected witnesses. A prescription specifies its slots (and hence its target
    directions), its generator directions, and its bits. For a length-$l$ prescription $pi$,
    let $T_pi$ be the offset event that its tuple lines pass through $p$ and that its positions are distinct and
    external to $p$. By conditioning on $M$ first, its contribution is at most
  #[#set math.equation(numbering: n => "(49)")
   $ \( K \/ q \)^l bb(P)_M \( T_pi \) . $ <eq:pencil-weight>]
  Here $bb(P)_M$ is the unconditioned independent offset law.
    Only after obtaining this bound do we relax restrictions such as distinctness of slots in the sum of its right side.
  We now estimate the sum of (49) by processing the witness in the order just chosen.
    Expose all offsets of a tuple’s generators when that tuple is processed.
    Call a generator old if its direction has already been exposed.
    There are a bounded number of exposed directions in a witness.
    If the next tuple has $j$ old generators, there are $O \( q^(4 - j) \)$ choices for its generator and bit
    labels. A position with two old adjacent generators is fixed;
    all other positions are independent and uniform either in the plane or on an exposed constituent.
    Their coordinates identifying a line of the target direction are independent uniform elements of $bb(F)_q$.
    The maximum number $f$ of fixed positions for $j = 0 \, 1 \, 2 \, 3 \, 4$ is respectively $0 \, 0 \, 1 \, 2 \, 4$.
  If no position is fixed, there are $O \( q \)$ target directions and the alignment probability with the
    prescribed line $p + g$ is $q^(- 4)$. If a position is fixed,
    it must be external to $p$ and therefore determines $g$; the other $4 - f$ positions cost $q^(- \( 4 - f \))$.
    Including the two slot choices and one factor $K \/ q$ from (49), the conditional extension bounds are
  #[#set math.equation(numbering: n => "(50)")
   $ j & 0 & 1 & 2 & 3 & 4\
upright("extension bound") & O \( 1 \) & O \( q^(- 1) \) & O \( q^(- 2) \) & O \( q^(- 2) \) & O \( q^(- 1) \) .
  $ <eq:pencil-extension>]
  For $j = 2$ both possibilities $f = 0$ and $f = 1$ give $O \( q^(- 2) \)$.
    The estimates are uniform in previously exposed offsets. An impossible fixed-position configuration
    contributes zero.
  Each of the three noninitial steps in the first type of witness saves at least $q^(- 1)$.
    The triangle saves $q^(- 1)$ and $q^(- 2)$ at its second and third steps.
    Summing the finitely many witness-order types and iterating (50) proves the lemma. No bound on $b$ was needed. ◻
]

=== 6.2 The aligned law for at most two reuses <the-aligned-law-for-at-most-two-reuses>

Lemma 15 handles all pencils with at least three reuses, regardless of their size.
  After also removing the large-pencil event, it remains to consider $3 lt.eq b lt.eq B$ and $kappa in { 0 \, 1 \,
  2 }$. We first describe the offset law for a prescribed list whose tuple points lie on lines through $p$.
  This law will supply the independent variables and prescribed projections used in the remaining incidence estimates.

We enumerate ordered lists of $b$ prescribed tuples through $p$.
  A pattern of equality among their $4 b$ generator entries with $kappa$ reuses has $4 b -
  kappa$ generator classes. There are only $b^(O \( 1 \))$ such patterns:
  choose the at most two entries that repeat a previous class and their earlier representatives.
  We retain only patterns compatible with at most one common generator per tuple pair.

For a fixed pattern there are at most

#[#set math.equation(numbering: n => "(51)")
 $ \( q + 1 \)^(5 b - kappa) $ <eq:pencil-directions>]

assignments of target and generator directions: there are $b$ target entries and $4 b - kappa$ generator classes.
  Call an assignment #emph[eligible] if its targets are distinct,
  its distinct generator classes have distinct directions, and no tuple has its own target as a generator.
  Bits and slot choices contribute a factor $16^b 2^b = 32^b$.

For these patterns we may process the tuples as roots and children,
  each child sharing exactly one generator with an earlier root and having its other three generators new.
  With one reuse there is one linked pair. With two reuses there are two disjoint linked pairs,
  a chain of three tuples, or one generator direction shared by three tuples.
  For a chain take the middle tuple as root; for a direction shared by three tuples take any of the three as root.
  Other tuples are roots. This processing order depends only on the equality pattern,
  not on the direction assignment or offsets.

Write $g_i$ for the target direction of tuple $i$ and put $L_i = p + g_i$.
  We call the list #emph[aligned] if all four positions of each tuple $i$ lie on $L_i$.
  This event imposes neither distinctness of the positions nor any other validity condition.
  For every eligible direction assignment,

#[#set math.equation(numbering: n => "(52)")
 $ bb(P)_M \( upright("alignment") \) = q^(- 4 b) . $ <eq:pencil-alignment>]

Conditional only on alignment, the offsets and positions can be generated as follows;
  we refer to this distribution as the #emph[aligned law].

+ At a root, choose four independent uniform points of $L_i$ and set the generator offsets to the prescribed lines
  through their endpoints.
+ At a child, the two positions involving its shared generator are the intersections of that generator’s already
  fixed constituents with $L_i$. Choose the other two positions independently and uniformly on $L_i$,
  and set the new generator offsets accordingly.
+ All offsets in directions outside $Gamma$ retain their original independent law.

For a root, before alignment its four positions are independent uniform plane points, giving the factor $q^(- 4)$.
  At a child, the two positions on the shared generator’s constituents each involve one fresh offset.
  Each lands at its required intersection with probability $1 \/ q$.
  The other two positions are independent uniform plane points, each costing $1 \/ q$ to lie on $L_i$.
  These use disjoint fresh offset variables. The factor $q^(- 4)$ is independent of the earlier values,
  so later alignment does not bias an earlier generation. This proves both (52) and the stated law.
  A target of one tuple may equal a generator of another; that does not affect this argument.

The aligned law deliberately leaves the remaining geometric restrictions as events to be tested.
  Call a list #emph[admissible] if it is aligned, all its positions are distinct and external to $p$,
  none of its $L_i$ is a constituent, and the constituent multiplicity is at most $B$ at every point.
  Every list selected on $cal(A)$ through $p$, with $b gt.eq 3$, satisfies these necessary conditions.

To express a violation of the local condition for a prescribed list,
  let $F$ be the union of its designated points and define $Z \( p \)$ by (5), with $F$ in place of $F \( p \)$;
  throughout these counts $Z \( p \)$ refers to this prescribed list.
  A #emph[bad cover] of this list covers $F$ by $Z \( p \)$ and at most $b - 1$ additional sets:
  sets of at most two points, affine lines outside ${ L_1 \, dots.h \, L_b } union cal(M)$, or merged pairs,
  with no merged pair used more than once. An admissible bad cover means that both this cover and the preceding
  admissibility conditions occur. In the following estimates we bound a bad cover jointly with admissibility,
  rather than conditioning the point variables on it.

For a used direction $d in Gamma$, its $2 t_d$ prescribed endpoint indices will be called its #emph[purposeful
  endpoints]. Neither constituent of $d$ passes through $p$ on an admissible list.
  Indeed, it contains a purposeful point external to $p$ on a target line through $p$,
  and its direction differs from that target. Consequently the set $Z \( p \)$ of points already covered by
  partner lines uses only directions outside $Gamma$; we call this precoverage.

=== 6.3 Additional incidence costs for zero or one reuse <additional-incidence-costs-for-zero-or-one-reuse>

For zero or one reuse, we can estimate each eligible direction assignment separately.
  Even after allowing the purposeful endpoints covered by used merged pairs, a cover by $b -
  1$ additional sets must create further incidences. We will extract $3 -
  kappa$ of these incidence conditions whose variable dependencies permit successive integration.

#thm([Lemma 6.3.])[
  #emph[Fix $p in A$, $3 lt.eq b lt.eq B$, an equality pattern with $kappa = 0$ or $1$,
    an eligible direction assignment, and the bits. Under the aligned law,
    the probability of an admissible bad cover is at most
$ b^(O \( 1 \)) \( 2 B \/ q \)^(3 - kappa) . $

 The polynomial exponent and implicit constant are absolute.]
] <lem:pencil-small-reuse>

#proof[
  When $kappa = 0$, all $4 b$ positions are independent uniform points of their target lines.
    When $kappa = 1$, two positions of the child are projections of two parent positions along the shared
    generator direction. Call these two child indices dependent.
    All nondependent positions are independent uniform points of their target lines,
    and each has at most one dependent image. We fix the offsets in unused directions,
    restricting to configurations whose unused constituent multiplicity is at most $B$ everywhere.
    These offsets are independent of the point variables under the aligned law.
    Configurations violating this multiplicity bound contribute no admissible occurrence.
  We first turn a cover into incidence conditions. Given an admissible bad cover,
    assign each of the $4 b$ positions to precoverage or to one of at most $b - 1$ additional covering sets.
    Mark certain assigned indices as #emph[surplus], according to the following rule:
  - Mark every position assigned to precoverage.
  - For an ordinary line or an unused merged pair with at least three assigned positions,
    retain two assigned indices as anchors and mark all others. A set of size at most two needs no marks.
  - For a used merged pair of direction $d$ with $n'$ assigned positions, mark $max { 0 \, n' -
    2 t_d }$ nonpurposeful indices. There are enough such indices because there are only $2 t_d$ purposeful endpoints.
  Every additional set retains at most two unmarked indices,
    except that a used merged pair may retain an additional $2 \( t_d - 1 \)$.
    Each used pair is allowed at most once. Thus the number of surplus indices is at least
  $ 4 b - 2 \( b - 1 \) - 2 sum_(d in Gamma) \( t_d - 1 \) = 2 b + 2 - 2 kappa . $
  Discard any dependent indices from the surplus and denote the remainder by $I$. Then
  #[#set math.equation(numbering: n => "(53)")
   $ \| I \| gt.eq 2 b + 2 quad \( kappa = 0 \) \, wide \| I \| gt.eq 2 b -
     2 quad \( kappa = 1 \) . $ <eq:pencil-surplus>]
  For each $v in I$, its covering assignment gives an incidence condition on its independent point variable $x_v$,
    using at most two anchor variables:
  + In precoverage, $x_v$ lies on a partner of an unused constituent through $p$.
  + On an ordinary line, $x_v$ lies on the line through its two stored anchors, which are distinct points.
  + On an unused merged pair, choose one stored anchor whose underlying variable is not $x_v$.
    Then $x_v$ lies on either constituent of some unused merged pair containing that anchor.
  + On a used merged pair, $x_v$ lies on the line of that generator direction through one of its purposeful
    endpoints. Choose an endpoint on the constituent actually covering $x_v$.
  In every case the candidate line containing $x_v$ differs from its own target line.
    Replace a dependent anchor by its underlying parent variable when recording these dependencies.
  No condition needs its own variable as an anchor. Only the case $kappa = 1$ requires explanation.
    For an ordinary line, $x_v$ and its dependent image lie on a shared-generator constituent,
    which is forbidden as an ordinary covering line. For an unused pair,
    the two stored anchors are different from the surplus index, and at most one can be its dependent image;
    choose the other. For a used pair, the surplus index is nonpurposeful for that generator.
    If its chosen endpoint were its dependent image, the line joining the two distinct points would have the
    shared generator direction. The surplus index would then itself be purposeful for that direction, a contradiction.
  The surplus count alone does not allow us to multiply incidence probabilities:
    one condition may depend on another condition’s variable.
    We therefore extract a collection with acyclic dependencies.
    Draw a directed edge from $v in I$ to each underlying anchor variable that also belongs to $I$.
    This directed graph has no loops and outdegree at most two.
    It has an acyclic induced set of size at least $ceil.l \| I \| \/ 3 ceil.r$:
    process the vertices in any order, assigning each one of three colours not used by its already processed
    outneighbors. A monochromatic directed cycle is impossible,
    since its last processed vertex has an earlier outneighbor on the cycle.
    Each colour class is therefore acyclic. By (53) and $b gt.eq 3$, we can retain exactly $3 -
    kappa$ incidence conditions inducing an acyclic graph.
  Only the retained conditions now need to be counted. There are $b^(O \( 1 \))$ possible specifications of their
    indices, condition types, anchor indices, and, when needed, used-generator direction,
    because at most three conditions remain. In case (c) the unused direction is left unspecified.
    Thus we take a union over these specifications without enumerating the full cover.
    By the extraction, it suffices to include specifications with no self-dependency and with an acyclic
    dependency graph.
  Fix such a specification and all independent variables outside its retained indices.
    The acyclic graph gives an integration order: integrate the remaining independent uniform variables by
    successively removing a vertex of indegree zero. No other remaining condition depends on the variable removed.
    With the other variables fixed, its condition is either impossible or asks for membership in at most $2
    B$ lines different from its target line. In case (a) there are at most $B$ relevant constituents through $p$;
    in case (c) the fixed anchor belongs to at most $B$ unused constituents,
    giving at most $2 B$ candidate constituents of the corresponding pairs. Cases (b) and (d) give one line.
    Each candidate line meets the target line in at most one point.
    The conditional probability is therefore at most $2 B \/ q$ at every removal.
  For this integration we retain only the indicated incidence conditions, their line exclusions,
    and the distinctness of any two ordinary-line anchors needed to define their line.
    We discard other cover, distinctness, and admissibility conditions.
    Their role was to extract a specification with no self-dependency;
    retaining them as conditioning would change the law of the variables being integrated.
    The specified event costs at most $\( 2 B \/ q \)^(3 - kappa)$.
    Sum over the polynomially many specifications and average over the fixed unused offsets. ◻
]

=== 6.4 One additional incidence when there are two reuses <one-additional-incidence-when-there-are-two-reuses>

Two reuses already contribute two powers of $q^(- 1)$ in the final prescription count.
  It remains to gain one further power from the bad cover. Here we average over direction assignments as well as
  aligned positions. Each incidence estimate will reveal a direction after the geometric data prescribing its
  required value are known.

#thm([Lemma 6.4.])[
  #emph[Fix $p in A$, $3 lt.eq b lt.eq B$, an equality pattern with $kappa = 2$, and the bits.
    Summed over eligible direction assignments, the probabilities of alignment and an admissible bad cover are at most
$ \( q + 1 \)^(5 b - 2) q^(- 4 b) thin O \( b^3 \/ q \) \, wide 3 lt.eq b lt.eq B . $

]
] <lem:pencil-two-reuses>

#proof[
  For the direction count, regard each target and each generator equality class as one #emph[token];
    there are $5 b - 2$ tokens. We first estimate the mean probability of bad geometry over assignments in which
    all tokens receive distinct directions. Equivalently, assign them by a uniform injection into $cal(G)$.
    At the end we bound the remaining eligible assignments, in which a target direction equals a generator
    direction of another tuple. Under the aligned law an admissible bad cover requires at least one of the
    following four events:
  + An unused direction has one constituent through $p$ and the other through a designated point.
  + A used merged pair meets a point of a tuple not using that generator.
  + Three designated points lie on a line different from every target line and from every constituent of a used
    direction.
  + Three noncollinear designated points lie in one unused merged pair.
  Indeed, if (i) fails there is no precoverage. If (ii) fails,
    a used pair covers only its $2 t_d$ purposeful endpoints.
    Ordinary allowed lines cover at most two points when (iii) fails.
    If an unused pair covers three points, they either witness (iv) or are collinear.
    In the latter case two lie on one constituent, so their common line is that unused constituent.
    By admissibility it is not a target line, and it cannot be a constituent of a used direction;
    thus it witnesses (iii). Without these events the additional $b - 1$ sets cover at most
  $ 2 \( b - 1 \) + 2 kappa = 2 b + 2 < 4 b $
  points, a contradiction.
  Conditionally on directions and designated points, unused offsets are independent.
    Event (i) has probability $O \( b \/ q \)$: for a specified point, direction, and orientation,
    the two offsets have prescribed values and cost $q^(- 2)$, and there are $O \( b q \)$ choices.
    Event (iv) costs $O \( b^3 \/ q^2 \)$: choose the three noncollinear points and two that lie on one
    constituent. Their joining line determines the direction and one offset;
    the parallel line through the third point determines the other offset.
    If that direction is unused this costs $q^(- 2)$, with two possible offset orientations.
  The remaining events (ii) and (iii) involve used constituents and may involve projected positions.
    Their estimates use the randomness of the direction assignment.
    To keep the relevant conditional laws explicit, use the following sequential version of the injection average.
    Process roots and children in the order already chosen. First reveal a tuple’s target token,
    then generate its fresh positions and any prescribed projections,
    and finally reveal its new generator tokens and set their offsets. This has the aligned law:
    positions use the present target and any previously fixed shared constituents,
    but not the values of the new generator directions. In particular,
    a projected position need not be an independent uniform point.
    When the tested line is fixed before that position’s tuple is processed,
    its incidence is tested at the reveal of the tuple’s target token;
    the opposite timing is handled below by revealing the later generator token.
    The alignment factor $q^(- 4 b)$ is the same for every injection.
    At every stage unrevealed tokens are uniformly assigned without replacement among unused directions.
    In particular a specific required value determined before a token is revealed costs at most
  #[#set math.equation(numbering: n => "(54)")
   $ \( q + 1 - 5 b \)^(- 1) = O \( q^(- 1) \) . $ <eq:pencil-token>]
  Consider (ii) for a specified used constituent and a specified point of a tuple not using that generator.
    If the constituent was fixed before that tuple is processed,
    a fresh position hits it with probability $1 \/ q$. A dependent position is the projection of an already fixed
    shared constituent onto the new target line. To hit the tested constituent,
    the target line must pass through the intersection of the two fixed constituents.
    An intersection at $p$ cannot produce an admissible external point.
    Any other intersection prescribes a target direction and costs $O \( q^(- 1) \)$ by (54).
  In the opposite timing, the tested point is known before the first tuple using the tested direction is
    processed. The purposeful endpoint defining the tested constituent is generated before that new generator
    token is revealed. Admissibility makes the endpoint different from the earlier point.
    Their joining direction is therefore prescribed at the reveal of the generator token,
    again costing $O \( q^(- 1) \)$. Summing over $O \( b^2 \)$ choices bounds (ii),
    jointly with the indicated admissibility conditions, by $O \( b^2 \/ q \)$.
  For (iii), the three distinct points come from three distinct tuples:
    two on one target line would force the triple line to be that target.
    The points in the first two processed tuples determine a line $h$.
    At the last tuple, a fresh position hits $h$ with probability at most $1 \/ q$,
    keeping the necessary exclusion $h eq.not L_i$. If the last position is a projection along a shared
    constituent $h_s$, the event requires $h eq.not h_s$. Parallel lines give no incidence.
    Otherwise their intersection must differ from $p$ and prescribes the new target direction,
    giving $O \( q^(- 1) \)$ by (54). Summing over triples gives $O \( b^3 \/ q \)$.
    Every constraint in this argument is determined before the random value used to enforce it is revealed.
    Other conditions are discarded in taking these upper bounds.
  Combining the four events, the mean bad-geometry probability over injective token assignments is
    $O \( b^3 \/ q \)$. Multiplying by the common alignment probability $q^(- 4 b)$ and by the number of
    injections gives the required contribution from these assignments.
    The only eligible noninjective assignments have an equality between a target token and a generator token.
    There are at most
  $ b \( 4 b - 2 \) \( q + 1 \)^(5 b - 3) $
  such assignments, by selecting one cross-equality and ignoring remaining restrictions.
    For each eligible assignment the alignment probability is still exactly $q^(- 4 b)$;
    use the trivial upper bound one for subsequent bad geometry. Their total is absorbed by the claimed bound. ◻
]

=== 6.5 Summing over all selected pencils <summing-over-all-selected-pencils>

We now combine the selection estimate with the geometric estimates to prove Proposition 14.
  The former costs one factor $K \/ q$ per selected tuple; the latter supplies the alignment probability and the
  additional incidence costs. For fixed $p \, b \, kappa$ with $3 lt.eq b lt.eq B$ and $kappa lt.eq 2$,
  count ordered prescriptions that occur as selections on $cal(A)$ and have an admissible bad cover using the
  precoverage defined by that list. An actual violation with exactly these parameters yields all $b !$ orders of
  its selected tuples. The count need not require that there are no further selected lines through $p$:
  dropping that restriction only increases it.

For each prescription, condition on $M$ first to obtain the factor $\( K \/ q \)^b$ from (48).
  All necessary geometric tests then depend only on the independent offset model and that prescription.
  The patterns, slots, bits, direction assignments, and alignment contribute, after division by $b !$, at most

#[#set math.equation(numbering: n => "(55)")
 $ frac(b^(O \( 1 \)), b !) thin 32^b \( q + 1 \)^(5 b - kappa) \( K \/ q \)^b q^(- 4 b) lt.eq
   frac(b^(O \( 1 \)) C^b, b !) q^(- kappa) . $ <eq:pencil-common-factor>]

Here $C$ and the polynomial exponent are independent of $b$ and $q$; we use $b lt.eq ceil.l log q ceil.r$.
  For $kappa = 0 \, 1$, multiply by the additional factor from Lemma 16.
  For $kappa = 2$, Lemma 17 provides the factor $O \( b^3 \/ q \)$ after summing direction assignments.
  Hence the total probability at $p$ for these values of $b \, kappa$ is

$ O \( B^3 \/ q^3 \) \, $

because $sum_(b gt.eq 3) b^a C^b \/ b ! < oo$ for every fixed $a \, C$.
  Lemma 15 adds $O \( q^(- 3) \)$ for all cases with $kappa gt.eq 3$.
  Summing over the $q^2$ affine points gives $O \( B^3 \/ q \) = o \( 1 \)$.
  The earlier large-$b$ estimate is also $o \( 1 \)$. This proves Proposition 14:
  a violation of the local condition occurs with probability $o \( 1 \)$,
  jointly with successful return of the selection procedure.

== 7 Completion of the construction <sec:assembly>

We now put the three probability estimates on the same experiment.
  The candidate graph and selection procedure give compatible tuples and line occupancy;
  deletion domination gives the core-cover condition; the local incidence estimate gives the last condition of
  Proposition 3.

#proof[
  Fix the candidate constants $c_(*) \, C_(*)$ from Proposition 9, set $c_0 = 1 \/ 5$,
    and fix all the selection constants in the order given in (25)–(25).
    In particular, $K_(*)$ and $rho > 0$ do not depend on $q$.
    Choose independent constituent offsets as in Section 4. By Proposition 9,
    the event that all its bounds hold and every constituent pair is distinct has probability $e^(- 1) +
    o \( 1 \)$. Return failure outside that event. For an outcome in it,
    apply Proposition 11 to the two slots for each direction.
    All its graph hypotheses hold with the fixed constants $c_(*) \, C_(*) \, c_0 = 1 \/ 5$.
    Its independent transversal is exactly a compatible collection of valid tuples.
    The probability of returning such a collection, denoted by $cal(A)$, is bounded below by a positive constant,
    uniformly for all sufficiently large $q$.
  Section 5.6 verifies that (24) supplies the $R_0$ and $R$ line-occupancy bounds in Proposition 3.
    Thus those bounds fail jointly with $cal(A)$ with probability $o \( 1 \)$.
    The constituent multiplicity bound is already included in the initial event.
  By Corollary 13, the law of the three deletion lines per direction, conditional on $cal(A)$,
    is bounded pointwise by $exp \( K_0 q \)$ times the uniform law for a fixed constant $K_0$.
    Apply Corollary 8 with $k = 3$ and $zeta = rho \/ 4$. For prime $q$,
    concentration of all possible core covers therefore fails with conditional probability $o \( 1 \)$,
    and hence also with joint probability $o \( 1 \)$.
  Finally, the uniform conditional cylinder bound for selection is (46).
    It applies even to prescriptions that are not available in a given candidate graph, whose probability is zero.
    Together with compatibility and the constituent multiplicity cap,
    it supplies all hypotheses of Proposition 14. The local condition thus fails jointly with $cal(A)$ with
    probability $o \( 1 \)$.
  Subtracting these three failure probabilities from $bb(P) \( cal(A) \)$ leaves positive probability for all
    sufficiently large primes. The constants do not depend on the prime.
    Increase the threshold so that $q gt.eq 4$ and $rho q > 2 \( 1 + ceil.l log q ceil.r \)$.
    The resulting finite configuration satisfies every hypothesis of Proposition 3, with $B =
    ceil.l log q ceil.r$. That proposition gives the asserted hypergraph, including exactly $q +
    1$ nonisolated vertices in each part and $tau \( H \) = q + 1$. ◻
]

== 8 Elementary incidence and concentration estimates <sec:elementary>

The statements in this appendix do not depend on the construction.
  The incidence identity holds over every finite field and for every set of points,
  including a set obtained from earlier random choices. The two probability estimates apply to a specified
  filtration or to independent trials; their applications must still supply the relevant stopping rules and union
  bounds.

#thm([Lemma 8.1.])[
  (Affine second moment).  #emph[Let $q$ be a prime power, let $U subset.eq bb(F)_q^2$,
    and let $cal(L)$ be the set of all affine lines. Then
$ sum_(ell in cal(L)) \| U ∩ ell \| & = \( q + 1 \) \| U \| \,\
sum_(ell in cal(L)) \| U ∩ ell \|^2 & = \| U \|^2 + q \| U \| \,\
sum_(ell in cal(L)) (\| U ∩ ell \| - frac(\| U \|, q))^2 & = q \| U \| - frac(\| U \|^2, q) lt.eq q^3 / 4 . $

 For each direction $d$, define
$ V_d = 1 / q sum_(ell parallel d) (\| U ∩ ell \| - frac(\| U \|, q))^2 . $

 Then $sum_d V_d = \| U \| - \| U \|^2 \/ q^2 lt.eq \| U \| lt.eq q^2$.]
] <lem:affine-second-moment>

#proof[
  Every point lies on $q + 1$ affine lines, proving the first identity.
    Every ordered pair of distinct points lies on exactly one line; the $\| U \|$ equal pairs each lie on $q +
    1$ lines. Thus the second sum is $\| U \| \( \| U \| - 1 \) + \( q + 1 \) \| U \|$.
    Expanding the square and using $\| cal(L) \| = q \( q + 1 \)$ gives the third identity.
    Its upper bound follows by maximizing $q x - x^2 \/ q$ for $0 lt.eq x lt.eq q^2$,
    whose maximum is $q^3 \/ 4$ at $x = q^2 \/ 2$. Finally, the parallel classes partition $cal(L)$,
    so division by $q$ gives the directional identity. ◻
]

The next estimate is the bounded-increment exponential-moment argument of Azuma #cite(label("Azuma1967")),
  stated for a process with a predictable drift. We retain a constant that accommodates centering each increment.

#thm([Lemma 8.2.])[
  (Bounded-drift concentration).  #emph[Let $\( X_t \)_(t = 0)^T$ be a real process adapted to a filtration
    $\( cal(F)_t \)_(t = 0)^T$, where $T gt.eq 1$ is an integer.
    Suppose $L > 0$ and $\| X_(t + 1) - X_t \| lt.eq L$ almost surely for $0 lt.eq t < T$.
    Put $d_t = bb(E) \[ X_(t + 1) - X_t divides cal(F)_t \]$.
    For every $u > 0$ and each fixed integer $0 lt.eq t lt.eq T$,
$ bb(P) (lr(|X_t - X_0 - sum_(j < t) d_j|) gt.eq u) lt.eq 2 exp (- frac(u^2, 8 T L^2)) . $

]
] <lem:bounded-drift-concentration>

#proof[
  Set $Z_j = X_(j + 1) - X_j - d_j$. Then $bb(E) \[ Z_j divides cal(F)_j \] = 0$ and $\| Z_j \| lt.eq 2 L$.
    For any real $theta$, convexity on $\[ - 2 L \, 2 L \]$ bounds $e^(theta Z_j)$ by the linear interpolation of
    its endpoint values. Taking conditional expectations gives
  $ bb(E) \[ e^(theta Z_j) divides cal(F)_j \] lt.eq cosh \( 2 L theta \) lt.eq exp \( 2 L^2 theta^2 \) . $
  The last inequality follows, for example, by integrating $\( log cosh x \)' = tanh x lt.eq x$ for $x gt.eq
    0$ and using evenness. Successive conditional expectations therefore give $bb(E)
    exp \( theta sum_(j < t) Z_j \) lt.eq exp \( 2 T L^2 theta^2 \)$.
    For $theta > 0$, Markov’s inequality bounds the upper tail at $u$ by $exp \( - theta u + 2 T L^2 theta^2 \)$.
    Choosing $theta = u \/ \( 4 T L^2 \)$ gives $exp \( - u^2 \/ \( 8 T L^2 \) \)$.
    Apply the same argument to $- Z_j$ and add the two tails.
    This proves a bound at each fixed time; no maximum over times is being taken. ◻
]

#thm([Lemma 8.3.])[
  (Independent-trial jumps).  #emph[Let $Y$ be an integrable real function of independent trials $xi_1 \,
    dots.h \, xi_T$. Suppose changing only trial $i$ changes $Y$ by at most $c_i$, where $c_i gt.eq 0$.
    The Doob martingale obtained by revealing these trials in order has its $i$th increment bounded in absolute
    value by $c_i$, and its conditional variance bounded by $c_i^2$.
    In particular, if $T gt.eq 1$ and $c_i lt.eq L$ for a constant $L > 0$, then for every $u > 0$,
$ bb(P) \( \| Y - bb(E) Y \| gt.eq u \) lt.eq 2 exp (- frac(u^2, 8 T L^2)) . $

]
] <lem:independent-trial-jumps>

#proof[
  Fix the values of the first $i - 1$ trials. For a possible value $z$ of trial $i$,
    average $Y$ over the independent future trials to obtain $f_i \( z \)$.
    Coupling the same future trials for two values $z \, z'$ gives $\| f_i \( z \) - f_i \( z' \) \| lt.eq c_i$.
    Independence ensures that this is the conditional future law for both values.
    Thus the range of $f_i$ has length at most $c_i$. Its deviation from its mean over trial $i$ is bounded in
    absolute value by $c_i$; this deviation is exactly the $i$th Doob increment.
    Its conditional second moment, and hence its conditional variance, is at most $c_i^2$.
    The martingale starts at $bb(E) Y$, ends at $Y$, and has zero conditional drift. Apply Lemma 19 at time $T$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
