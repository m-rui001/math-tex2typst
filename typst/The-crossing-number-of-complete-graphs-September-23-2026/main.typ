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

#align(center)[#text(size: 16pt, weight: "bold")[The-crossing-number-of-complete-graphs-September-23-2026]]
#align(center)[]
#align(center)[]

== 1 Introduction <introduction>

An ordinary plane drawing places the vertices of a finite simple graph at distinct points and represents its edges by simple continuous arcs whose interiors avoid the vertices. Edge interiors meet at finitely many proper double crossings, with no tangencies, overlaps, or triple crossings. Write $c \( D \)$ for the number of crossing points of a drawing $D$, counting every crossing when two edges meet repeatedly. The ordinary crossing number is

$ "cr" \( G \) = min_D c \( D \) . $

There is no restriction on vertex positions or edge routes. The complete graph $K_n$ has one edge for each pair of its $n$ vertices.

Other crossing parameters count each intersecting edge pair once, or count only pairs that cross an odd number of times. These objectives differ from counting every crossing point, and restrictions on adjacent-edge crossings affect them differently #cite(label("PachToth2000")) #cite(label("FulekEtAl2012")). We use the ordinary point-count convention throughout.

An explicit drawing gives an upper bound on the crossing number; the Harary–Hill problem asks whether any drawing can improve on a particular classical construction. Harary and Hill #cite(label("HararyHill1963")) Section 3 described Hill’s construction and stated the conjectured complete-graph formula. They credited Guy’s 1960 note #cite(label("Guy1960")) with the first published upper bound, while noting several independent discoveries. The distinction between curved-edge and straight-line drawings was already explicit in their formulation.

The lower bound has developed through exact small cases, asymptotic estimates, and the analysis of restricted drawing classes. Pan and Richter’s computer-assisted proof gave $"cr" \( K_11 \) = 100$ and hence $"cr" \( K_12 \) = 150$ #cite(label("PanRichter2007")). Aichholzer subsequently reported a computer-assisted proof of $"cr" \( K_13 \) = 225$, implying $"cr" \( K_14 \) = 315$ #cite(label("Aichholzer2021")). For general orders, de Klerk, Maharry, Pasechnik, Richter, and Salazar used semidefinite methods to obtain an asymptotic ratio of at least $0.83$ to the conjectured value #cite(label("deKlerkEtAl2006")). Balogh, Lidický, and Salazar later proved that this ratio has limit greater than $0.98559895$ #cite(label("BaloghLidickySalazar2019")) Theorem 1. Their use of Razborov’s flag algebras #cite(label("Razborov2007")) constrains how small rotation systems, which record the cyclic orders of edges at vertices, can occur together in a large drawing.

A two-page drawing places all vertices on a line and each edge in one of the two half-planes it bounds. Two-page constructions also attain Hill’s upper bound; their exact optimum was proved by Ábrego, Aichholzer, Fernández-Merchant, Ramos, and Salazar using a topological extension of geometric edge counts #cite(label("AbregoEtAl2013")). Their subsequent shellability criterion fixes a region and an ordered vertex set. After deleting the selected vertices outside any consecutive subsequence of at least two vertices, its two end vertices must lie on the boundary of the region containing the fixed one. A shelling of at least $n \/ 2$ vertices suffices for the conjectured lower bound. It unifies two-page drawings with cylindrical drawings, whose vertices lie on two concentric circles that no edge crosses, and $x$-bounded drawings, whose edges stay between the vertical lines through their endpoints #cite(label("AbregoEtAl2014Shellable")). Streltsova and Wagner proved the bound for vertices in general position on the sphere joined by shortest geodesic arcs #cite(label("StreltsovaWagner2025")) Theorem 4. These results establish the lower bound under constraints on the drawing. Hebbar and Mangam also claimed both the complete-graph and complete-bipartite formulas, using crossing counts for a succession of constructed drawings #cite(label("HebbarMangam2018")) Theorems 1–3. Counting crossings in prescribed drawings gives upper bounds; establishing the minimum over all drawings also requires a lower-bound argument. We prove the following formula for unrestricted ordinary drawings.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 3$, 
$ "cr" \( K_n \) = Z \( n \) := 1 / 4 ⌊n / 2⌋ ⌊frac(n - 1, 2)⌋ ⌊frac(n - 2, 2)⌋ ⌊frac(n - 3, 2)⌋ . $

]
] <thm:main>

Thus Theorem 1 resolves the Harary–Hill conjecture positively. The cases $n = 1 \, 2$ have crossing-free drawings and the same floor product is zero. In parity-specific form the value is

#[#set math.equation(numbering: n => "(1.1)")
 $ Z \( 2 s + 1 \) = binom(s, 2)^(#h(-0.16667em) 2) \, #h(2em) Z \( 2 s \) = frac(s \( s - 1 \)^2 \( s - 2 \), 4) . $ <eq:parity>]

Our lower bound uses algebraic information about a drawing rather than a restriction on its edge routes. Tutte developed an algebraic theory of crossing numbers #cite(label("Tutte1970")). Woodall’s cyclic-order graphs use the orders of incident edges, and distances between those orders, to bound crossings in complete-bipartite drawings #cite(label("Woodall1993")) Sections 2–3. Here signed intersections retain the orientation of each crossing. Together with the local orders, they enter a corrected bilinear pairing that vanishes on pairs of cycles. Polynomial interpolation then turns this identity into a crossing lower bound.

For the odd case $n = 2 s + 1$, choose a distinct real label for each vertex. We use polynomials in four variables, representing the endpoints of two edges. Each polynomial is symmetric in the endpoints of either edge and has degree at most $s - 2$ in each variable. This space has dimension $Z \( 2 s + 1 \)$. Evaluate its members at every ordered pair of independent edges with a nonzero signed crossing count. The central task is to show that these evaluations determine the polynomial.

The accompanying bipartite paper develops an odd-node order detector #cite(label("BipartiteCompanion")) Section 4. Here an even-node detector, built from the classical Lagrange weights #cite(label("BerrutTrefethen2004")) Sections 2–3, recovers local information at each vertex from the cycle identity. It forces a polynomial in the kernel of the evaluation map to vanish whenever endpoints of different edges coincide. The resulting difference factors can be divided out while preserving both the kernel and the endpoint symmetries. Repetition would lower the degree indefinitely, so the kernel is zero.

A second application of the cycle identity, now multiplied by the product of all six endpoint differences, shows that the evaluation image is totally isotropic: every two image vectors pair to zero in a nondegenerate symmetric diagonal form. The standard orthogonal-complement dimension formula bounds this image by half the number of its coordinates. Each supported unordered edge pair requires a crossing, yielding the odd lower bound. Vertex deletion gives the even case. The needed geometry and algebra are proved locally; the detector works for every order of arbitrary distinct real nodes.

The lower bound does not depend on the bipartite crossing-number formula. Section 2 establishes the geometric identity; Sections 3 and 4 prove the lower bound; Section 5 gives the matching construction. Appendix 6 supplies the reduction from continuous arcs.

== 2 Signed intersections of cycles <sec:cycles>

Our first goal is an identity relating interior crossings to the circular orders of edges at vertices. We will apply it to polynomially weighted cycles in Section 4.

By Lemma 11, a minimum drawing can be chosen polygonal, straight near every vertex and crossing, and without crossings between adjacent edges. We call such a drawing #emph[normalized]. Independent edges may still cross more than once.

Fix one orientation of each edge of a finite simple graph drawn in this way. Its real edge space has those oriented edges as a basis. Reversing an orientation negates the edge vector. For $K_n$ we write $\[ i p \]$ for the edge from $i$ to $p$, so $\[ p i \] = - \[ i p \]$ and $\[ i i \] = 0$. The boundary map is $partial \[ i p \] = upright(bold(e))_p - upright(bold(e))_i$, with the vertex symbols as a basis. A #emph[cycle] is a chain in $ker partial$.

Let $I \( e \, f \)$ be the sum of the signs of the interior crossings of two distinct oriented basis edges. The sign is positive when their ordered tangent directions give the positive orientation of the plane. Set $I \( e \, e \) = 0$. At each vertex $w$, choose a gap in the circular order of the outward spokes and list the incident edges counterclockwise from it. Put

$ T_w \( e \, f \) = cases(delim: "{", 1 \, & e upright(" precedes ") f \,, - 1 \, & f upright(" precedes ") e \,, 0 \, & e = f \,) #h(2em) sigma_(w e) = cases(delim: "{", 1 \, & e upright(" points out of ") w \,, - 1 \, & e upright(" points into ") w .) $

Define a bilinear form by its values on basis edges:

#[#set math.equation(numbering: n => "(2.1)")
 $ J \( e \, f \) = I \( e \, f \) + 1 / 2 sum_(w upright(" an endpoint")\
upright("of both ") e \, f) sigma_(w e) sigma_(w f) T_w \( e \, f \) . $ <eq:J>]

It is skew-symmetric. The orientation signs in Equation (2.1) make its bilinear extension consistent with reversing either edge.

#thm([Lemma 2.1.])[
  (Cycle pairing).  #emph[For any two cycles $z \, z'$, one has $J \( z \, z' \) = 0$.]
] <lem:cycles>

#proof[
  The following argument also appears in the companion paper #cite(label("BipartiteCompanion")) Lemma 3.1; it applies to every finite simple graph. The kernel of the boundary map is spanned by signed simple graph cycles. Indeed, choose a spanning forest, subtract the fundamental cycle associated with each nonforest edge with its appropriate coefficient, and obtain a cycle supported on a forest. Stripping leaves shows that the remaining chain is zero. It therefore suffices to treat two oriented simple graph cycles.
  We will replace the first cycle by a closed polygonal walk $gamma$ and the second by two closed polygonal walks $eta_(+) \, eta_(-)$. The average of the signed intersection counts of $gamma$ with these two walks will be $J \( z \, z' \)$: crossings outside small vertex disks contribute $I$, while the averaged contributions inside them give the correction in Equation (2.1). Each total intersection count is zero, as we prove at the end of the argument.
  #emph[The local contribution.] Consider two oriented chords $C \, E$ of a round disk, with four distinct boundary endpoints. Give a chord’s start coefficient $- 1$ and its end coefficient $+ 1$, denoted by $epsilon.alt_C$ and $epsilon.alt_E$. If $T \( u \, v \)$ compares boundary points from a counterclockwise cut away from the endpoints, their signed intersection is
  #[#set math.equation(numbering: n => "(2.2)")
   $ I \( C \, E \) = 1 / 2 sum_(u in partial C) sum_(v in partial E) epsilon.alt_C \( u \) epsilon.alt_E \( v \) T \( u \, v \) . $ <eq:chord>]
  Moving the cut past one endpoint changes the right side by a multiple of the other chord’s total endpoint coefficient, which is zero. Cutting just before the start of $C$, the expression becomes minus the sum of $epsilon.alt_E$ on the open counterclockwise boundary arc from the start to the end of $C$. This arc is on the right of the directed chord. The expression is zero for nonalternating endpoints, and is $+ 1$ for $E$ crossing from right to left, or $- 1$ for the reverse. These are exactly the intersection signs. Figure 1 shows this convention and the shared-spoke averaging used below.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.85, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((-0.85, 0), (0.85, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.85pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((0, -0.85), (0, 0.85), stroke: (paint: rgb("#cc6600"), thickness: 0.85pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  content((0.57, 0), [#text(size: 9pt)[$C$]], anchor: "north-west", padding: 0.1176cm)
  content((0, 0.62), [#text(size: 9pt)[$E$]], anchor: "south-west", padding: 0.1176cm)
  content((0, -1.17), [#text(size: 9pt)[$(C,E):#h(0.3333em) +1$]])
  arc((2.554, 0.4875), start: 145deg, stop: 35deg, radius: 0.85, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.25, 0.85), (3.25, 1.55), stroke: (paint: rgb("#0000a6"), thickness: 0.85pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((3.48, 0.8185), (3.48, 1.55), stroke: (paint: rgb("#cc6600"), thickness: 0.85pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  circle((3.25, 0.85), radius: 0.05997, fill: rgb("#0000a6"), stroke: none)
  circle((3.48, 0.8185), radius: 0.05997, fill: rgb("#cc6600"), stroke: none)
  content((3.25, -0.02), [#text(size: 9pt)[$T=-1$]])
  content((3.25, -0.45), [#text(size: 9pt)[right shift]])
  content((3.25, 1.63), [#text(size: 9pt)[same spoke]], anchor: "south", padding: 0.1176cm)
  arc((5.804, 0.4875), start: 145deg, stop: 35deg, radius: 0.85, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((6.5, 0.85), (6.5, 1.55), stroke: (paint: rgb("#0000a6"), thickness: 0.85pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((6.27, 0.8185), (6.27, 1.55), stroke: (paint: rgb("#cc6600"), thickness: 0.85pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  circle((6.5, 0.85), radius: 0.05997, fill: rgb("#0000a6"), stroke: none)
  circle((6.27, 0.8185), radius: 0.05997, fill: rgb("#cc6600"), stroke: none)
  content((6.5, -0.02), [#text(size: 9pt)[$T=+1$]])
  content((6.5, -0.45), [#text(size: 9pt)[left shift]])
  content((6.5, 1.63), [#text(size: 9pt)[same spoke]], anchor: "south", padding: 0.1176cm)
  content((4.875, -1.17), [#text(size: 9pt)[average: $frac(1, 2) (-1+1)=0$]])
})],
    caption: [Figure 1: The local signs in the cycle pairing. Left: a chord directed to the right followed by one directed upward gives a positive crossing. Right: alternative right and left displacements of the second track at a shared spoke give opposite comparisons in counterclockwise boundary order. The two displacements are alternative perturbations whose counts are averaged. ],
  ) <fig:local-pairing>
  #emph[Separating shared tracks.] Choose disjoint small round vertex disks meeting only the straight spokes. In each vertex disk replace the first cycle’s passage by the chord from its incoming to its outgoing boundary point. Outside these disks retain its edge tracks, obtaining a closed polygonal walk $gamma$.
  Construct two versions $eta_(+) \, eta_(-)$ of the second cycle. Outside the vertex disks, displace each track slightly left or right, respectively, relative to its fixed basis-edge orientation. In the vertex disks join its displaced endpoints by chords. Here are the local details needed when the cycles share edges. Place additional disjoint small round disks at crossings and nonstraight bends, meeting only their incident straight pieces. Shift each straight stretch between disks to a parallel one. Across a crossing disk continue along the shifted line: it avoids its own original line and crosses the other original strand once, with the same sign. At a bend the shifted ends lie on the same side of the original bent track. For a left shift they lie clockwise of its incoming outward ray and counterclockwise of its outgoing ray. Join them by a polygonal path in that component of the bend disk; use the other component for a right shift.
  The distinct truncated stretches between disks are compact and disjoint. Finiteness therefore permits a common sufficiently small shift introducing no additional intersections. The vertex cuts and comparisons between distinct spokes remain unchanged. At seams the shifted and original endpoints are distinct; chord interiors stay inside their disks, and the intended crossings remain strictly inside crossing disks. These local replacements join to closed polygonal walks $eta_(+) \, eta_(-)$. Every intersection between $gamma$ and either walk is transverse and lies away from their corners; unnecessary straight subdivision points can be removed.
  In either version the signed intersection count outside the vertex disks, counting by traversals, is
  $ sum_(e \, f) z_e z'_f I \( e \, f \) . $
  This remains true for shared tracks: a shifted edge avoids its own copy, and crossings of different edges give the two ordered contributions when both cycles use both edges.
  In a common vertex disk the first chord’s endpoint coefficient on spoke $e$ is $sigma_(w e) z_e$: an incoming traversal starts the chord and an outgoing traversal ends it. The second chord has coefficient $sigma_(w f) z'_f$. For distinct spokes, the comparison sign in Equation (2.2) is $T_w \( e \, f \)$ for both shifts. For a shared spoke the two shifted endpoints are on opposite sides of its original endpoint, so their comparison signs average to zero. The average vertex contribution is therefore
  $ 1 / 2 sum_(e \, f upright(" incident with ") w) z_e z'_f sigma_(w e) sigma_(w f) T_w \( e \, f \) . $
  Opposite cycle traversals change the coefficients, not this averaging. In particular, for opposite traversals of a shared edge, the same coefficient multiplies both opposite shared-spoke comparisons, whose average remains zero.
  #emph[Total signed intersection.] Two closed polygonal walks in the plane that meet transversely away from their corners have total signed intersection zero, with intersections counted by traversals. To see this without a simplicity assumption, cone every oriented segment $\[ u \, v \]$ of the first walk to a common point $o$, forming the oriented triangle $\[ o \, u \, v \]$. Choose $o$ outside the finitely many lines that cause degeneracy, a cone segment to pass through a corner of the second walk, or nontransverse intersections. Each triangle boundary has total signed intersection zero: along the closed second walk, entrances and exits have opposite signs. In the sum of the triangle boundaries the extra cone sides cancel, leaving the first walk. This proves the assertion.
  Apply it to $\( gamma \, eta_(+) \)$ and $\( gamma \, eta_(-) \)$ and average. The exterior and vertex contributions just computed sum to $J \( z \, z' \)$, proving the lemma. ◻
]

== 3 An even-node order detector <sec:interpolation>

The cycle identity retains the order of the spokes at each vertex. We next show that this order, combined with interpolation weights, detects a polynomial from its pairings with a prescribed test space. The prescribed order need not agree with the numerical order of the nodes.

For nonnegative integers $a \, b$, let $cal(P)_(a \, b)$ be the real polynomials in $u \, v$ of degrees at most $a \, b$ separately.

#thm([Lemma 3.1.])[
  (Interpolation weights).  #emph[For distinct real nodes $u_1 \, dots.h \, u_N$, put $G \( t \) = product_(p = 1)^N \( t - u_p \)$. Then 
$ sum_(p = 1)^N frac(A \( u_p \), G' \( u_p \)) = 0 #h(2em) upright("if ") deg A lt.eq N - 2 . $

]
] <lem:weights>

#proof[
  The Lagrange formula
  $ A \( t \) = sum_p A \( u_p \) frac(G \( t \), \( t - u_p \) G' \( u_p \)) $
  holds for $deg A lt.eq N - 1$: both sides have degree at most $N - 1$ and agree at all $N$ nodes. Comparing coefficients of $t^(N - 1)$ gives the assertion. ◻
]

The next lemma is an even-node counterpart of the two-triangle interpolation used in #cite(label("BipartiteCompanion")) Section 4. Its two degree rectangles exchange roles in the induction.

#thm([Lemma 3.2.])[
  (Two-triangle interpolation).  #emph[Let $s gt.eq 2$ and let $u_1 \, dots.h \, u_(2 s)$ be distinct real numbers. Set 
$ L_s = { \( p \, q \) : 1 lt.eq q < p lt.eq s } #h(0.27778em) union #h(0.27778em) { \( p \, q \) : s < p < q lt.eq 2 s } . $

 Evaluation at $\( u_p \, u_q \)$, $\( p \, q \) in L_s$, is an isomorphism from each of $cal(P)_(s - 1 \, s - 2)$ and $cal(P)_(s - 2 \, s - 1)$ onto $bb(R)^(L_s)$.]
] <lem:triangles>

#proof[
  Both spaces and the target have dimension $s \( s - 1 \)$, so it suffices to prove injectivity, simultaneously for the two spaces. For $s = 2$, the two points have distinct first coordinates and distinct second coordinates. They determine an affine polynomial in either one variable.
  For larger $s$, let $P in cal(P)_(s - 1 \, s - 2)$ vanish on the pattern. Each of the rows $p = s \, s + 1$ contains $s - 1$ points. Thus the polynomials $P \( u_s \, v \)$ and $P \( u_(s + 1) \, v \)$, of degree at most $s - 2$, vanish identically. It follows that
  $ P \( u \, v \) = \( u - u_s \) \( u - u_(s + 1) \) R \( u \, v \) \, #h(2em) R in cal(P)_(s - 3 \, s - 2) . $
  Remove those two indices from the node list. The remaining two triangles are the pattern $L_(s - 1)$; the removed factors are nonzero on it. The induction hypothesis for the second degree rectangle gives $R = 0$.
  For $P in cal(P)_(s - 2 \, s - 1)$, use instead the columns $q = 1 \, 2 s$, each with $s - 1$ points. Factoring $\( v - u_1 \) \( v - u_(2 s) \)$ leaves a polynomial in $cal(P)_(s - 2 \, s - 3)$ on $L_(s - 1)$, zero by the first degree rectangle in the induction hypothesis. This proves both assertions. ◻
]

Figure 2 illustrates the row elimination for $s = 4$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.23, -2.53), (3.91, -1.61), fill: rgb("#fff0e0"), stroke: none)
  line((0.46, -3.68), (0.46, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.92, -3.68), (0.92, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((1.38, -3.68), (1.38, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((1.84, -3.68), (1.84, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((2.3, -3.68), (2.3, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((2.76, -3.68), (2.76, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((3.22, -3.68), (3.22, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((3.68, -3.68), (3.68, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -3.68), (3.68, -3.68), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -3.22), (3.68, -3.22), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -2.76), (3.68, -2.76), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -2.3), (3.68, -2.3), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -1.84), (3.68, -1.84), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -1.38), (3.68, -1.38), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -0.92), (3.68, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.46, -0.46), (3.68, -0.46), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((0.23, -0.138), (4.094, -0.138), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.094, -0.138), [#text(size: 9pt)[$q$]], anchor: "west", padding: 0.1176cm)
  line((0.138, -0.23), (0.138, -4.094), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.138, -4.094), [#text(size: 9pt)[$p$]], anchor: "north", padding: 0.1176cm)
  content((0.46, -0.138), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -0.46), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  content((0.92, -0.138), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -0.92), [#text(size: 9pt)[$2$]], anchor: "east", padding: 0.1176cm)
  content((1.38, -0.138), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -1.38), [#text(size: 9pt)[$3$]], anchor: "east", padding: 0.1176cm)
  content((1.84, -0.138), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -1.84), [#text(size: 9pt)[$4$]], anchor: "east", padding: 0.1176cm)
  content((2.3, -0.138), [#text(size: 9pt)[$5$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -2.3), [#text(size: 9pt)[$5$]], anchor: "east", padding: 0.1176cm)
  content((2.76, -0.138), [#text(size: 9pt)[$6$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -2.76), [#text(size: 9pt)[$6$]], anchor: "east", padding: 0.1176cm)
  content((3.22, -0.138), [#text(size: 9pt)[$7$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -3.22), [#text(size: 9pt)[$7$]], anchor: "east", padding: 0.1176cm)
  content((3.68, -0.138), [#text(size: 9pt)[$8$]], anchor: "south", padding: 0.1176cm)
  content((0.138, -3.68), [#text(size: 9pt)[$8$]], anchor: "east", padding: 0.1176cm)
  circle((0.46, -0.92), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((0.46, -1.38), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((0.92, -1.38), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((3.22, -2.76), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((3.68, -2.76), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((3.68, -3.22), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((0.46, -1.84), radius: 0.07408, fill: rgb("#d96d00"), stroke: none)
  circle((0.92, -1.84), radius: 0.07408, fill: rgb("#d96d00"), stroke: none)
  circle((1.38, -1.84), radius: 0.07408, fill: rgb("#d96d00"), stroke: none)
  circle((2.76, -2.3), radius: 0.07408, fill: rgb("#d96d00"), stroke: none)
  circle((3.22, -2.3), radius: 0.07408, fill: rgb("#d96d00"), stroke: none)
  circle((3.68, -2.3), radius: 0.07408, fill: rgb("#d96d00"), stroke: none)
  content((2.07, -4.6), [#text(size: 9pt)[$L_4, P in cal(P)_(3,2)$]])
  line((4.6, -2.07), (6.762, -2.07), stroke: (thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.681, -1.15), [#text(size: 9pt)[factor out#linebreak()$(u-u_4)(u-u_5)$]])
  content((5.681, -2.99), [#text(size: 9pt)[delete nodes#linebreak()$4,5$]])
  line((7.96, -3.22), (7.96, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((8.42, -3.22), (8.42, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((8.88, -3.22), (8.88, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((9.34, -3.22), (9.34, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((9.8, -3.22), (9.8, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((10.26, -3.22), (10.26, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.96, -3.22), (10.26, -3.22), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.96, -2.76), (10.26, -2.76), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.96, -2.3), (10.26, -2.3), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.96, -1.84), (10.26, -1.84), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.96, -1.38), (10.26, -1.38), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.96, -0.92), (10.26, -0.92), stroke: (paint: rgb("#e3e3e3"), thickness: 0.4pt, miter-limit: 10))
  line((7.73, -0.598), (10.67, -0.598), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.67, -0.598), [#text(size: 9pt)[$q$]], anchor: "west", padding: 0.1176cm)
  line((7.638, -0.69), (7.638, -3.634), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.638, -3.634), [#text(size: 9pt)[$p$]], anchor: "north", padding: 0.1176cm)
  content((7.96, -0.598), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((7.638, -0.92), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  content((8.42, -0.598), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((7.638, -1.38), [#text(size: 9pt)[$2$]], anchor: "east", padding: 0.1176cm)
  content((8.88, -0.598), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  content((7.638, -1.84), [#text(size: 9pt)[$3$]], anchor: "east", padding: 0.1176cm)
  content((9.34, -0.598), [#text(size: 9pt)[$6$]], anchor: "south", padding: 0.1176cm)
  content((7.638, -2.3), [#text(size: 9pt)[$6$]], anchor: "east", padding: 0.1176cm)
  content((9.8, -0.598), [#text(size: 9pt)[$7$]], anchor: "south", padding: 0.1176cm)
  content((7.638, -2.76), [#text(size: 9pt)[$7$]], anchor: "east", padding: 0.1176cm)
  content((10.26, -0.598), [#text(size: 9pt)[$8$]], anchor: "south", padding: 0.1176cm)
  content((7.638, -3.22), [#text(size: 9pt)[$8$]], anchor: "east", padding: 0.1176cm)
  circle((7.96, -1.38), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((7.96, -1.84), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((8.42, -1.84), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((9.8, -2.3), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((10.26, -2.3), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  circle((10.26, -2.76), radius: 0.07408, fill: rgb("#0000a6"), stroke: none)
  content((9.11, -4.6), [#text(size: 9pt)[$L_3, R in cal(P)_(1,2)$]])
})],
  caption: [Figure 2: The two-triangle interpolation pattern for eight nodes. The axes record indices, not the numerical sizes of the nodes. Each highlighted row has three points, so a polynomial $P in cal(P)_(3 \, 2)$ vanishing on $L_4$ vanishes identically on both rows. Dividing by $\( u - u_4 \) \( u - u_5 \)$ gives $R in cal(P)_(1 \, 2)$, the swapped degree rectangle for six nodes. After deleting indices $4 \, 5$, the remaining points form $L_3$; the right panel retains their original labels. ],
) <fig:interpolation>

Fix any linear order of the $2 s$ nodes, and write

$ S \( p \, q \) = cases(delim: "{", 1 / 2 \, & p upright(" precedes ") q \,, - 1 / 2 \, & q upright(" precedes ") p \,, 0 \, & p = q .) $

Using the polynomial $G$ from Lemma 3, define

#[#set math.equation(numbering: n => "(3.1)")
 $ M \( A \, B \) = sum_(p \, q) S \( p \, q \) frac(u_p - u_q, G' \( u_p \) G' \( u_q \)) A \( u_p \, u_q \) B \( u_p \, u_q \) . $ <eq:M>]

#thm([Lemma 3.3.])[
  (Order detection).  #emph[The pairing $M$ on $cal(P)_(s - 1 \, s - 2) times cal(P)_(s - 2 \, s - 1)$ is nonsingular. Consequently, 
#[#set math.equation(numbering: n => "(3.2)")
 $ A in cal(P)_(s - 2 \, s - 2) \, quad M \( A \, B \) = 0 med upright("for every ") B in cal(P)_(s - 1 \, s - 1) quad arrow.r.double quad A = 0 . $ <eq:detector>]

]
] <lem:detector>

#proof[
  Let $A in cal(P)_(s - 1 \, s - 2)$ and $B in cal(P)_(s - 2 \, s - 1)$. The product $\( u - v \) A \( u \, v \) B \( u \, v \)$ has degree at most $2 s - 2$ in each variable. Consequently, replacing $S \( p \, q \)$ by $S \( p \, q \) + r_p + c_q$ leaves $M \( A \, B \)$ unchanged: the added $r_p$ terms vanish after the weighted sum in $q$, by Lemma 3, and the $c_q$ terms vanish after the weighted sum in $p$. Diagonal entries have no effect because $u_p - u_q = 0$ there.
  Relabel the nodes in their prescribed order; their numerical values remain arbitrary distinct real numbers. Off the diagonal, $S \( p \, q \) = 1 / 2 - upright(bold(1))_({ q < p })$. We may therefore replace $S$ in the pairing by
  $ K \( p \, q \) = cases(delim: "{", - 1 \, & 1 lt.eq q < p lt.eq s \,, 1 \, & s < p < q lt.eq 2 s \,, 0 \, & upright("otherwise") .) $
  Indeed, off the diagonal this is $S \( p \, q \) - 1 / 2 + upright(bold(1))_({ p > s })$, an allowed change by a row term and a constant. Hence
  $ M \( A \, B \) = sum_(\( p \, q \) in L_s) K \( p \, q \) frac(u_p - u_q, G' \( u_p \) G' \( u_q \)) A \( u_p \, u_q \) B \( u_p \, u_q \) . $
  Every displayed weight is nonzero. Lemma 4 identifies each of the two polynomial spaces with $bb(R)^(L_s)$ by evaluation. In these two coordinate systems the pairing is diagonal with nonzero entries, so it is nonsingular.
  For the consequence, the smaller space for $A$ is contained in the first nonsingular space, while the given test space for $B$ contains the second one. Nonsingularity forces $A = 0$. ◻
]

== 4 The lower bound <sec:lower>

Assume first that $n = 2 s + 1 gt.eq 5$. Fix a normalized minimum drawing, label its vertices $1 \, dots.h \, n$, and form $J$ as in Equation (2.1). Choose distinct real labels $t_1 \, dots.h \, t_n$ and set

$ F \( t \) = product_(i = 1)^n \( t - t_i \) \, #h(2em) w_i = frac(1, F' \( t_i \)) . $

#thm([Lemma 4.1.])[
  (Polynomial cycle tests).  #emph[For every polynomial $H \( x \, u \, y \, v \)$ of degree at most $n - 2$ separately in each variable, 
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(i \, p \, k \, q) J \( \[ i p \] \, \[ k q \] \) w_i w_p w_k w_q H \( t_i \, t_p \, t_k \, t_q \) = 0 . $ <eq:test>]

]
] <lem:tests>

#proof[
  For exponents $a \, b lt.eq n - 2$, the chain
  $ z_(a \, b) = sum_(i \, p) w_i w_p t_i^a t_p^b \[ i p \] $
  has boundary
  $ (sum_i w_i t_i^a) sum_p w_p t_p^b upright(bold(e))_p - (sum_p w_p t_p^b) sum_i w_i t_i^a upright(bold(e))_i = 0 $
  by Lemma 3. For a monomial $H = x^a u^b y^c v^h$, Equation (4.1) is $J \( z_(a \, b) \, z_(c \, h) \) = 0$, by Lemma 2. Linearity gives the result. ◻
]

Let $cal(T)$ be the set of #emph[ordered pairs of undirected edges] that have no common endpoint and have nonzero signed crossing count $J$. This condition does not depend on the chosen edge orientations. Each coordinate records an edge pair, which may cross repeatedly. Each unordered supported pair requires at least one crossing, so

#[#set math.equation(numbering: n => "(4.2)")
 $ c \( D \) gt.eq frac(\| cal(T) \|, 2) . $ <eq:support>]

Let $cal(S)$ be the space of polynomials $P \( x \, u \, y \, v \)$ with degree at most $s - 2$ separately in each variable, symmetric within $\( x \, u \)$ and within $\( y \, v \)$. Symmetry under exchanging the two pairs is #emph[not] imposed. A symmetric polynomial in one pair has a basis indexed by exponent pairs $0 lt.eq a lt.eq b lt.eq s - 2$. Hence

#[#set math.equation(numbering: n => "(4.3)")
 $ dim cal(S) = binom(s, 2)^(#h(-0.16667em) 2) . $ <eq:dim>]

The evaluation map

$ E : cal(S) arrow.r bb(R)^(cal(T)) \, #h(2em) E \( P \)_(\( { i \, p } \, { k \, q } \)) = P \( t_i \, t_p \, t_k \, t_q \) $

is well-defined by the two within-pair symmetries. We will first prove that these evaluations determine every polynomial in $cal(S)$. We will then use the cycle identity a second time to show that their image has dimension at most half the number of coordinates.

#thm([Lemma 4.2.])[
  (Injectivity).  #emph[The map $E$ is injective.]
] <lem:injectivity>

#proof[
  Suppose $E \( P \) = 0$. We first force vanishing at a shared endpoint, then use the resulting polynomial factors to descend in degree.
  #emph[Localizing at a shared endpoint.] In Lemma 6 use
  #[#set math.equation(numbering: n => "(4.4)")
   $ H = P \( x \, u \, y \, v \) \( u - v \) \( u - y \) \( v - x \) U \( x \) V \( y \) B \( u \, v \) \, $ <eq:localtest>]
  where $deg U \, deg V lt.eq s$ and $B in cal(P)_(s - 1 \, s - 1)$. The three-factor weight has separate degrees $\( 1 \, 2 \, 1 \, 2 \)$; the total degrees are therefore at most $2 s - 1 = n - 2$.
  Independent-edge terms vanish either by $E \( P \) = 0$ or by their zero $J$. The weight kills the coincidences $p = q$, $p = k$, and $q = i$; loops already have zero edge vector. Only $i = k$ survives, with $p \, q$ distinct from $i$ and from each other. Since adjacent edges do not cross and both orientations point out of $i$,
  $ J \( \[ i p \] \, \[ i q \] \) = 1 / 2 T_i \( i p \, i q \) = : S_i \( p \, q \) . $
  Set $S_i \( p \, p \) = 0$ and $F_i \( t \) = product_(p eq.not i) \( t - t_p \)$. For $p eq.not i$, $\( t_p - t_i \) w_p = 1 \/ F'_i \( t_p \)$, so Equation (4.1) becomes
  #[#set math.equation(numbering: n => "(4.5)")
   $ 0 = sum_i w_i^2 U \( t_i \) V \( t_i \) sum_(p eq.not i\
q eq.not i) S_i \( p \, q \) frac(t_p - t_q, F'_i \( t_p \) F'_i \( t_q \)) P \( t_i \, t_p \, t_i \, t_q \) B \( t_p \, t_q \) . $ <eq:local>]
  For each fixed $B$, products $U \( t \) V \( t \)$ span all polynomials of degree at most $2 s = n - 1$: split each monomial’s exponent into two parts of size at most $s$. Their linear combinations interpolate arbitrary values on the $n$ nodes. Since $w_i eq.not 0$, the inner sum in Equation (4.5) vanishes separately for every $i$ and every $B$. More explicitly, for fixed $B$, linearity allows $U V$ to be replaced by the Lagrange polynomial that is one at $t_i$ and zero at all other nodes. For each $i$, the inner sum is the order pairing on the $2 s$ nodes different from $t_i$. Its first polynomial, $P \( t_i \, u \, t_i \, v \)$, belongs to $cal(P)_(s - 2 \, s - 2)$. Lemma 5 gives
  $ P \( t_i \, u \, t_i \, v \) = 0 quad upright("as a polynomial in ") u \, v \, quad upright("for every ") i . $
  #emph[Dividing the collision factors.] The polynomial $P \( x \, u \, x \, v \)$ has degree at most $2 s - 4 < n$ in $x$. Applying the univariate root bound to each coefficient in $u \, v$ shows that it is identically zero. Hence $x - y$ divides $P$. The two within-pair symmetries imply divisibility also by $x - v$, $u - y$, and $u - v$. Each difference is prime: quotienting the polynomial ring by that factor identifies its two variables and leaves a polynomial ring, which has no zero divisors. The four factors are pairwise nonassociate, so their individual divisibility implies divisibility by their product
  #[#set math.equation(numbering: n => "(4.6)")
   $ C = \( x - y \) \( x - v \) \( u - y \) \( u - v \) . $ <eq:C>]
  We have proved that $C$ divides every polynomial in the kernel. For a nonzero polynomial, this already forces every separate degree to be at least two. If the kernel contains a nonzero polynomial, choose $P$ of minimum degree in $x$ and write $P = C R$ with $R eq.not 0$. The product $C$ is invariant under each within-pair swap; applying either swap and cancelling $C$ shows that $R$ has the same two symmetries. Its degree in each variable is two less than that of $P$, so $R in cal(S)$. Moreover, $C$ is nonzero at every evaluated independent-edge pair, so $E \( R \) = 0$. This contradicts the minimal choice of $P$. ◻
]

#thm([Proposition 4.3.])[
  (Odd lower bound).  #emph[Every normalized minimum drawing of $K_(2 s + 1)$, $s gt.eq 2$, has at least $binom(s, 2)^2$ crossings.]
] <prop:odd>

#proof[
  Define the full difference product
  $ Delta = \( x - u \) \( y - v \) \( x - y \) \( x - v \) \( u - y \) \( u - v \) . $
  For $P \, Q in cal(S)$, the polynomial $P Q Delta$ has separate degrees at most $2 \( s - 2 \) + 3 = 2 s - 1$, so Lemma 6 applies. Its only nonzero terms come from $cal(T)$: every common endpoint kills $Delta$.
  Fix representative orientations for the edges. For each ordered pair in $cal(T)$, its four choices of endpoint orientations give equal contributions. Reversing either edge changes the signs of both $J$ and $Delta$, while leaving $P \, Q$ and the node-weight product unchanged. After division by four,
  $ sum_(alpha in cal(T)) a_alpha E \( P \)_alpha E \( Q \)_alpha = 0 \, quad a_(\( { i \, p } \, { k \, q } \)) = J \( \[ i p \] \, \[ k q \] \) w_i w_p w_k w_q Delta \( t_i \, t_p \, t_k \, t_q \) . $
  Every $a_alpha$ is nonzero, so this is a nondegenerate #emph[symmetric diagonal] form on $bb(R)^(cal(T))$. In particular it is not the skew form $J$. Exchanging the two whole edges gives a different coordinate with opposite coefficient, a block $"diag" \( a \, - a \)$; this does not destroy nondegeneracy.
  The image $W = E \( cal(S) \)$ is contained in its orthogonal complement. To justify the dimension count, let $V = bb(R)^(cal(T))$. The nondegenerate form identifies $V$ with its dual. Restricting a linear functional on $V$ to $W$ is onto $W^(*)$, since any basis of $W$ extends to a basis of $V$. The resulting map $V arrow.r W^(*)$ has kernel $W^perp$; hence $dim W^perp = \| cal(T) \| - dim W$, and therefore $2 dim W lt.eq \| cal(T) \|$. By Lemma 7 and Equations (4.2) and (4.3),
  $ c \( D \) gt.eq frac(\| cal(T) \|, 2) gt.eq dim W = binom(s, 2)^(#h(-0.16667em) 2) . $
  Cancellation of signs at repeated crossings can only remove coordinates from $cal(T)$, and so cannot invalidate this inequality. ◻
]

#thm([Corollary 4.4.])[
  #emph[For every $n gt.eq 3$, $"cr" \( K_n \) gt.eq Z \( n \)$.]
] <cor:lower>

#proof[
  Proposition 8 proves the odd cases $n gt.eq 5$. For $n = 2 s > 4$, delete each vertex in turn from a normalized minimum drawing. Every crossing involves four distinct vertices, so survives exactly $n - 4$ deletions. Each remaining drawing of $K_(n - 1)$, whether minimum or not, has at least $binom(s - 1, 2)^2$ crossings. Thus
  $ \( n - 4 \) c \( D \) gt.eq n binom(s - 1, 2)^(#h(-0.16667em) 2) \, #h(2em) c \( D \) gt.eq frac(s \( s - 1 \)^2 \( s - 2 \), 4) . $
  For $n = 3 \, 4$, nonnegativity gives the claimed zero lower bound. ◻
]

== 5 A matching two-page drawing <sec:upper>

We use the endpoint-sum construction presented by de Klerk, Pasechnik, and Salazar #cite(label("DPSBookPreprint")) Section 5.1, which builds on the book drawings of Blažek and Koman #cite(label("BlazekKoman1964")) and of Damiani, D’Antona, and Salemi #cite(label("DamianiEtAl1994")). Its two-page case attains the classical upper bound. The vertices lie on a line, called the #emph[spine], and each edge lies in one of its two half-planes. We count the crossings directly, including the parity issue in the cyclic enumeration.

Place the vertices with labels $0 \, dots.h \, n - 1$ at positions $\( a_0 \, 0 \) \, dots.h \, \( a_(n - 1) \, 0 \)$, where $a_0 < dots.h.c < a_(n - 1)$. Put $m = floor.l n \/ 2 floor.r$. Color the residues $0 \, dots.h \, m - 1$ with one color and $m \, dots.h \, n - 1$ with another. An edge $i j$ uses the color of $i + j med \( mod med n \)$. Draw first-color edges as semicircles above the spine and second-color edges as semicircles below it, in both cases with their endpoints as the diameter endpoints.

Two edges in different half-planes have disjoint interiors. In one half-plane, two semicircles cross exactly when their four endpoints alternate along the spine, and then they cross once. Indeed, the semicircle with endpoints $a < b$ satisfies

$ y^2 = \( x - a \) \( b - x \) . $

The difference of the two right-hand sides is affine in $x$. For four distinct endpoints, at the ends of the overlap of the diameter intervals its signs are opposite for alternating endpoints and agree for nested intervals; disjoint intervals have no overlap. This also shows that arcs sharing an endpoint meet only there. Every interior intersection is transverse: two circles with centers on the spine can be tangent only at a point of the spine.

Choose the positions generically to exclude triple interior crossings. For completeness, choose each $a_i$ successively in a prescribed open interval, with these intervals pairwise disjoint and ordered from left to right. A triple interior crossing would involve six distinct endpoints, since edges sharing an endpoint have no other intersection. When the last of these endpoints is placed, its partner $a$ and a possible intersection $\( x \, y \)$, $y eq.not 0$, of the other two semicircles are already fixed. If $x = a$, no such semicircle exists. Otherwise the unknown endpoint $b$ must satisfy

$ b = x + frac(y^2, x - a) \, $

which excludes at most one position for $b$. There are only finitely many choices to exclude. Thus the resulting drawing is admissible, and its crossings are precisely the same-color pairs with alternating endpoints. This alternation depends only on the cyclic order of the labels $0 \, dots.h \, n - 1$, which we use in the count below.

Figure 3 shows the construction for $n = 7$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.64, 3.036), [#text(size: 9pt)[First page: $i+j (mod 7) in \{0,1,2\}$]])
  line((-0.1584, 0), (5.438, 0), stroke: (paint: rgb("#b9b9b9"), thickness: 0.35pt, miter-limit: 10))
  arc((0, 0), start: 180deg, stop: 0deg, radius: 0.682, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((1.769, 0), start: 180deg, stop: 0deg, radius: 1.276, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((1.769, 0), start: 180deg, stop: 0deg, radius: 1.756, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((2.253, 0), start: 180deg, stop: 0deg, radius: 0.3212, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((2.253, 0), start: 180deg, stop: 0deg, radius: 1.034, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((2.253, 0), start: 180deg, stop: 0deg, radius: 1.514, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((2.895, 0), start: 180deg, stop: 0deg, radius: 0.7128, stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  arc((0, 0), start: 180deg, stop: 0deg, radius: 0.8844, stroke: (paint: rgb("#0000a6"), thickness: 1.15pt, miter-limit: 10))
  arc((1.364, 0), start: 180deg, stop: 0deg, radius: 1.958, stroke: (paint: rgb("#0000a6"), thickness: 1.15pt, miter-limit: 10))
  circle((0, 0), radius: 0.05468, fill: black, stroke: none)
  content((0, -0.1058), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  circle((1.364, 0), radius: 0.05468, fill: black, stroke: none)
  content((1.364, -0.1058), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  circle((1.769, 0), radius: 0.05468, fill: black, stroke: none)
  content((1.769, -0.1058), [#text(size: 9pt)[$2$]], anchor: "north", padding: 0.1176cm)
  circle((2.253, 0), radius: 0.05468, fill: black, stroke: none)
  content((2.253, -0.1058), [#text(size: 9pt)[$3$]], anchor: "north", padding: 0.1176cm)
  circle((2.895, 0), radius: 0.05468, fill: black, stroke: none)
  content((2.895, -0.1058), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  circle((4.321, 0), radius: 0.05468, fill: black, stroke: none)
  content((4.321, -0.1058), [#text(size: 9pt)[$5$]], anchor: "north", padding: 0.1176cm)
  circle((5.28, 0), radius: 0.05468, fill: black, stroke: none)
  content((5.28, -0.1058), [#text(size: 9pt)[$6$]], anchor: "north", padding: 0.1176cm)
  content((2.64, -0.88), [#text(size: 9pt)[$2$ crossings]])
  content((9.79, 3.036), [#text(size: 9pt)[Second page: $i+j (mod 7) in \{3,4,5,6\}$]])
  line((6.992, 0), (12.59, 0), stroke: (paint: rgb("#b9b9b9"), thickness: 0.35pt, miter-limit: 10))
  arc((7.15, 0), start: 180deg, stop: 0deg, radius: 1.126, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((7.15, 0), start: 180deg, stop: 0deg, radius: 1.448, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((7.15, 0), start: 180deg, stop: 0deg, radius: 2.16, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((7.15, 0), start: 180deg, stop: 0deg, radius: 2.64, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((8.514, 0), start: 180deg, stop: 0deg, radius: 0.2024, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((8.514, 0), start: 180deg, stop: 0deg, radius: 0.4444, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((8.514, 0), start: 180deg, stop: 0deg, radius: 0.7656, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((8.514, 0), start: 180deg, stop: 0deg, radius: 1.478, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((8.919, 0), start: 180deg, stop: 0deg, radius: 0.242, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((8.919, 0), start: 180deg, stop: 0deg, radius: 0.5632, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((10.05, 0), start: 180deg, stop: 0deg, radius: 1.192, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  arc((11.47, 0), start: 180deg, stop: 0deg, radius: 0.4796, stroke: (paint: rgb("#cc6600"), thickness: 0.55pt, miter-limit: 10))
  circle((7.15, 0), radius: 0.05468, fill: black, stroke: none)
  content((7.15, -0.1058), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  circle((8.514, 0), radius: 0.05468, fill: black, stroke: none)
  content((8.514, -0.1058), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  circle((8.919, 0), radius: 0.05468, fill: black, stroke: none)
  content((8.919, -0.1058), [#text(size: 9pt)[$2$]], anchor: "north", padding: 0.1176cm)
  circle((9.403, 0), radius: 0.05468, fill: black, stroke: none)
  content((9.403, -0.1058), [#text(size: 9pt)[$3$]], anchor: "north", padding: 0.1176cm)
  circle((10.05, 0), radius: 0.05468, fill: black, stroke: none)
  content((10.05, -0.1058), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  circle((11.47, 0), radius: 0.05468, fill: black, stroke: none)
  content((11.47, -0.1058), [#text(size: 9pt)[$5$]], anchor: "north", padding: 0.1176cm)
  circle((12.43, 0), radius: 0.05468, fill: black, stroke: none)
  content((12.43, -0.1058), [#text(size: 9pt)[$6$]], anchor: "north", padding: 0.1176cm)
  content((9.79, -0.88), [#text(size: 9pt)[$7$ crossings]])
})],
  caption: [Figure 3: The two-page construction for $K_7$. The pages are displayed separately on the same labeled spine; reflect the second panel below the spine to assemble the drawing. Page membership is determined by the endpoint sum modulo $7$. The highlighted first-page edges $02$ and $16$ cross because $0 < 1 < 2 < 6$. The displayed semicircles have $2$ and $7$ distinct crossings. ],
) <fig:two-page>

#thm([Proposition 5.1.])[
  #emph[This drawing has exactly $Z \( n \)$ crossings for every $n gt.eq 3$.]
] <prop:upper>

#proof[
  Each four-set of vertices has one alternating edge pair, its diagonals. Count cyclic tuples starting at a label $a$, with successive positive integer gaps $g_1 \, g_2 \, g_3 \, g_4$ summing to $n$. The four vertices are
  $ a \, quad a + g_1 \, quad a + g_1 + g_2 \, quad a + g_1 + g_2 + g_3 med \( mod med n \) . $
  Each four-set occurs four times, once for each starting vertex. The diagonal endpoint-sum residues are
  $ r = 2 a + g_1 + g_2 \, #h(2em) r + k \, #h(2em) k = g_1 + g_3 . $
  For $2 lt.eq k lt.eq n - 2$, put $ell = min \( k \, n - k \)$, and let $R_k$ be the residues $r$ for which $r \, r + k$ have the same color. Shifting by $ell lt.eq m$ changes color on $ell$ residues from each block, so
  $ \| R_k \| = n - 2 ell . $
  For each $k$ there are $\( k - 1 \) \( n - k - 1 \)$ gap choices: choose $1 lt.eq g_1 lt.eq k - 1$ and $1 lt.eq g_2 lt.eq n - k - 1$; the other gaps are determined.
  We claim that, including all $a$, the number of same-color tuples for this $k$ is
  #[#set math.equation(numbering: n => "(5.1)")
   $ \( k - 1 \) \( n - k - 1 \) \| R_k \| . $ <eq:gapcount>]
  For odd $n$, multiplication by two permutes the residues, so each fixed gap choice already contributes $\| R_k \|$. For even $n = 2 m$, as $a$ varies, $r = 2 a + g_1 + g_2$ visits each residue in the parity class of $g_1 + g_2$ twice. We must check that this restriction still gives Equation (5.1) after summing over the gap choices. There are three cases. If $m$ is odd, $R_k$ is invariant under adding $m$, which switches parity, so its parity classes have equal sizes. If $m \, k$ are both even, $R_k$ consists of two cyclic intervals of even length $m - ell$, and again has equal parity counts. Finally, if $m$ is even and $k$ odd, the $k - 1$ choices for $g_1$, for each fixed $g_2$, give both parities of $g_1 + g_2$ equally often. Averaging their doubled parity-class counts proves Equation (5.1) in this case too.
  Dividing the total by four, and pairing $k$ with $n - k$, gives
  $ c \( D \) & = 1 / 4 sum_(k = 2)^(n - 2) \( k - 1 \) \( n - k - 1 \) #scale(x: 120%, y: 120%)[\(] n - 2 min \( k \, n - k \) #scale(x: 120%, y: 120%)[\)]\
 & = 1 / 2 sum_(k = 1)^m \( k - 1 \) \( n - k - 1 \) \( n - 2 k \) . $
  The added $k = 1$ term is zero, as is the possible central term $k = n \/ 2$. Set
  $ B_k = k \( k - 1 \) \( n - k - 1 \) \( n - k - 2 \) . $
  A direct subtraction gives
  $ B_k - B_(k - 1) = 2 \( k - 1 \) \( n - k - 1 \) \( n - 2 k \) . $
  Since $B_0 = 0$, the crossing count is $c \( D \) = B_m \/ 4$. For $n = 2 m + 1$ this is $m^2 \( m - 1 \)^2 \/ 4$; for $n = 2 m$ it is $m \( m - 1 \)^2 \( m - 2 \) \/ 4$. These are $Z \( n \)$, including the zero values at $n = 3 \, 4$. ◻
]

Corollary 9 and Proposition 10 complete the proof of Theorem 1.

== 6 Normalization of continuous-arc drawings <sec:normalization>

The following reduction, also used in #cite(label("BipartiteCompanion")) Appendix A, ensures that the lower bound applies to ordinary crossing number. Removing adjacent-edge crossings is a standard reduction in this setting #cite(label("FulekEtAl2012")); the proof below includes the details for continuous arcs.

#thm([Lemma 6.1.])[
  #emph[For every finite simple graph, a minimum ordinary drawing can be chosen polygonal, straight near every vertex and crossing, and without crossings between edges having a common endpoint.]
] <lem:normalization>

#proof[
  Drawings with finitely many crossings exist, so their crossing counts have a least nonnegative integer value, attained by a drawing. Start with such a minimum drawing, and call its vertices and crossings #emph[marks]. Parameterize every edge injectively on $\[ 0 \, 1 \]$. On each edge choose pairwise disjoint relative parameter neighborhoods, with disjoint closures, of its marked parameters, one-sided at its endpoints.
  Choose pairwise disjoint small closed round disks centered at the marks. They can be made so small that every visit of an edge to a disk lies in the corresponding parameter neighborhood, and nonincident edges avoid it. Indeed, the image of the compact parameter set outside that neighborhood avoids the mark, so has positive distance from it; if the mark is not on the edge, use the entire compact edge. There are finitely many such conditions.
  For an interior mark, remove the edge passage from its first to its last visit to the closed disk, including all intermediate excursions. At an initial vertex remove through the last visit; at a terminal vertex remove from the first visit. These intervals are disjoint along each edge. The retained middle pieces are finitely many pairwise disjoint compact arcs with distinct boundary endpoints and interiors outside all closed disks. This step does not require finitely many visits to a circle.
  Choose pairwise disjoint open neighborhoods of the middle pieces. At a boundary endpoint take a short radial spur out of its disk. The spur tip can be joined to a nearby interior point of the original middle piece within the chosen neighborhood and the open exterior of all disks: a sufficiently small exterior collar sector at that endpoint contains both points, and radial paths with a short concentric arc join them. Do this at both ends and use the middle piece between the selected interior points.
  A compact path in an open subset of the plane has a polygonal replacement there with the same endpoints: cover its image by small balls inside the open set, subdivide its parameter interval so that each subarc lies in one ball, and use chords in those balls. Apply this between the spur tips and append the spurs. Subdivide the finite union of segments at intersections and endpoints, also splitting and identifying collinear overlaps. A simple path in the resulting finite embedded graph gives a simple polygonal replacement. The disjoint neighborhoods ensure that the different exterior pieces do not meet.
  In each crossing disk join its respective endpoint pairs by straight chords. Their four boundary endpoints are distinct, so the chords have at most one crossing, transverse if present. In each vertex disk use straight spokes to its center; distinct boundary endpoints give distinct rays, so the spokes meet only at the vertex. Reassembling in the original edge order gives simple edges: an edge uses at most one strand in each disk, and all exterior pieces are disjoint. Every crossing lies in an old crossing disk, with at most one there. The result is polygonal and has no greater crossing count; hence it is minimum.
  Suppose two edges $v u \, v w$ cross. Around one such crossing take a small disk containing only their straight crossing strands. Exchange the prefixes from $v$ up to that disk and join them to the original suffixes by disjoint chords. The new pairing is nonalternating. We obtain two walks with the required endpoints and with that crossing removed; outside the disk the two old tracks are used exactly once in total.
  Subdivide at bends and remaining intersections, and erase closed subwalks between repeated subdivision vertices until both walks are simple. At an old crossing of these two edges, either its two tracks belong to different new walks, in which case each retained passage remains straight, or both belong to one walk. Only in the latter case can loop erasure make a turn, and neither the other walk nor a third edge is present at that point. A crossing with a third edge lies on a track visited at most once by the two walks together, so any retained passage there also remains straight. No new intersection, overlap, or improper contact is introduced; all interiors still avoid graph vertices. This gives an admissible drawing with fewer crossings, a contradiction. Thus the polygonal minimum has no adjacent-edge crossings. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
