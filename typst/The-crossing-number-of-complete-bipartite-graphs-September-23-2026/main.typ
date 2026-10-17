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

#align(center)[#text(size: 16pt, weight: "bold")[The crossing number of complete bipartite graphs]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a finite graph $G$, a plane drawing places its vertices at distinct points and represents each edge by a simple continuous arc whose interior avoids the vertices. A meeting of two edge interiors is a proper crossing if some open neighborhood of the point has a homeomorphism onto an open disk taking the point to its center and the two local edge traces onto its horizontal and vertical diameters. We require that edge interiors meet at finitely many proper crossings, with no triple crossings, tangencies, or common subarcs. The number $c \( D \)$ of a drawing $D$ counts crossing points: if two edges cross several times, each crossing is counted. The ordinary crossing number is

$ "cr" \( G \) = min_D c \( D \) . $

There are no restrictions on vertex positions or on edge routes.

Let $K_(m \, n)$ be the complete bipartite graph with vertex classes ${ a_1 \, dots.h \, a_m }$ and ${ b_1 \, dots.h \, b_n }$. Put

#[#set math.equation(numbering: n => "(1.1)")
 $ d_r = ⌊r / 2⌋ ⌊frac(r - 1, 2)⌋ = binom(floor.l r \/ 2 floor.r, 2) + binom(ceil.l r \/ 2 ceil.r, 2) . $ <eq:dr>]

#thm([Theorem 1.1.])[
  #emph[For all positive integers $m \, n$, 
$ "cr" \( K_(m \, n) \) = d_m d_n . $

]
] <thm:main>

The distinction between crossing points, crossing pairs, and parity-based crossing counts is important; we use the ordinary point-count convention throughout #cite(label("PachToth2000")) #cite(label("FulekEtAl2012")).

Turán described the problem’s origin in rail connections between kilns and storage yards at a brick factory near Budapest in 1944 #cite(label("Turan1977")) pp. 8–9. Zarankiewicz supplied the balanced-axis construction, but the published argument for its optimality contained a gap #cite(label("Zarankiewicz1955")) #cite(label("Turan1977")) #cite(label("ErdosGuy1973")). Kleitman established the exact formula when one vertex class has at most six vertices #cite(label("Kleitman1970")). His permutation argument already used the local cyclic orders of incident edges to bound crossings between two stars #cite(label("Kleitman1970")) Section 8, equation (17). Woodall developed this approach through cyclic-order graphs and verified the cases $K_(7 \, 7)$ and $K_(7 \, 9)$ by computation #cite(label("Woodall1993")). The rotation constraints later supported semidefinite lower bounds #cite(label("deKlerkEtAl2006")) #cite(label("deKlerkPasechnikSchrijver2007")), refined for fixed part sizes by Brosch and Polak #cite(label("BroschPolak2024")). For balanced graphs, Balogh, Lidický, Norin, Pfender, Salazar, and Spiro obtained

$ "cr" \( K_(n \, n) \) gt.eq 0.9118 thin d_n^2 + o \( n^4 \) $

using Razborov’s flag-algebra method #cite(label("Razborov2007")) #cite(label("BaloghEtAl2023")). Hebbar and Mangam have also published claims of both the complete-graph and complete-bipartite formulas #cite(label("HebbarMangam2018")). Theorem 1 resolves the Zarankiewicz crossing-number conjecture positively through the self-contained argument below.

Tutte developed an algebraic approach to crossing numbers #cite(label("Tutte1970")). Our proof combines signed intersections of edge interiors with a contribution determined by the incident-edge order at a common endpoint. The resulting cycle pairing separates the topological information from the algebraic estimates.

The proof separates the geometry of a drawing from two linear-algebraic statements. In Section 2, we prove that subspaces $U_i \, V_i$ of an $N$-dimensional real vector space satisfying $U_i ∩ V_i = 0$ obey

#[#set math.equation(numbering: n => "(1.2)")
 $ sum_(i \, j = 1)^m dim \( U_i ∩ V_j \) lt.eq ⌊m^2 / 4⌋ N . $ <eq:intro-subspaces>]

The argument uses interpolation with subspace constraints at finitely many nodes and counts the zeros of polynomial minors. Related determinant multiplicity arguments control sums of intersection dimensions in the theory of subspace designs #cite(label("GuruswamiKopparty2016")). Here the degree filtration is adapted to arbitrary subspaces $U_i$; diagonal disjointness bounds the rank at the interpolation nodes. Applied to graphs of linear maps, the resulting inequality gives a lower bound on the sum of the ranks of differences $X_i - Y_j$ of square matrices, provided every diagonal difference $X_i - Y_i$ is invertible. Both formulations are independent of graph drawings.

In Section 4, for odd $n = 2 s + 1 gt.eq 3$, we construct a linear map from $n$-by-$n$ matrices to $s^2$-by-$s^2$ matrices. It annihilates row-plus-column terms and diagonal entries and sends each individual matrix entry to a matrix of rank at most one. For a linear order $prec$ on ${ 1 \, dots.h \, n }$, let $S_prec$ be half its comparison-sign matrix: its $\( p \, q \)$ entry is $1 / 2$ if $p prec q$, $- 1 / 2$ if $q prec p$, and $0$ if $p = q$. The map sends every $S_prec$ to an invertible matrix. The construction uses the classical barycentric weights for Lagrange interpolation #cite(label("BerrutTrefethen2004")) Sections 2–3 and bivariate monomial evaluations; its invertibility reduces to interpolation on two complementary triangles of an evaluation grid.

To connect these statements, normalize a minimum drawing $D$ so its edges are polygonal and adjacent edges do not cross. Orient edges from the first vertex class to the second. At each vertex, read the counterclockwise spoke order from a chosen gap. Form a matrix $J$ indexed by these edges. Its entry for two distinct edges is their signed crossing count, plus half their comparison sign in the incident order if they share an endpoint; diagonal entries are zero. The block $J^(i k)$ compares the edges incident with $a_i$ to those incident with $a_k$. The vanishing of algebraic intersections of closed plane curves makes these blocks additive modulo row-plus-column terms (Section 3). Applying the linear map produces the family $X_i - Y_j$: diagonal blocks have full rank, and off-diagonal ranks are bounded by the corresponding crossing counts. Corollary 4 bounds the ordered sum of off-diagonal ranks below by $2 d_m d_n$. The corresponding sum of crossing counts counts each crossing twice, so the rank sum is at most $2 c \( D \)$. This gives $c \( D \) gt.eq d_m d_n$. Section 5 completes the proof: deleting vertices gives the even case, and the classical balanced-axis drawing gives the matching upper bound.

Every ingredient of the lower-bound argument is proved below. For completeness, Appendix 6 supplies the drawing reductions for the continuous-arc definition used here.

== 2 A subspace intersection inequality <sec:subspaces>

The algebraic estimate behind the lower bound concerns arbitrary pairs of subspaces. The only hypothesis is that each subspace is disjoint from its designated partner. Polynomial determinants have also been used to control sums of intersection dimensions in subspace designs #cite(label("GuruswamiKopparty2016")). Here the degree filtration is adapted to the arbitrary family $U_i$, and all details are proved below.

#thm([Lemma 2.1.])[
  (Subspace intersection bound).  #emph[Let $W$ be a real vector space of dimension $N$, and let $U_1 \, dots.h \, U_m \, V_1 \, dots.h \, V_m$ be subspaces of $W$, where $m gt.eq 1$. If $U_i ∩ V_i = { 0 }$ for every $i$, then 
#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(i \, j = 1)^m dim \( U_i ∩ V_j \) lt.eq ⌊m^2 / 4⌋ N . $ <eq:subspace-bound>]

]
] <lem:subspace>

#proof[
  We encode the subspaces by polynomial evaluation constraints. Evaluating away from the constraint nodes gives a filtration of evaluation spaces. At each node, disjointness bounds the evaluated rank. The resulting rank deficiency gives a lower bound on a polynomial minor’s vanishing order. Comparing these orders with the minor’s degree, then summing over the filtration, will give the bound.
  Choose distinct real numbers $t_1 \, dots.h \, t_m$. For a subspace $Z subset.eq W$ and an integer $h gt.eq 0$, define
  $ cal(P)_h \( Z \) = { P in Z \[ xi \] : deg P lt.eq h \, med P \( t_i \) in U_i upright(" for every ") i } \, #h(2em) cal(P)_(- 1) \( Z \) = { 0 } . $
  Here $Z \[ xi \]$ denotes polynomials whose coefficients belong to $Z$. Write $E_h \( Z \; t \) = { P \( t \) : P in cal(P)_h \( Z \) }$ and put
  $ k_h \( Z \) = dim cal(P)_h \( Z \) - dim cal(P)_(h - 1) \( Z \) \, #h(2em) k_(- 1) \( Z \) = 0 . $
  #emph[Evaluation away from the nodes.] For $t in.not { t_1 \, dots.h \, t_m }$, the kernel of evaluation at $t$ is
  $ ker #scale(x: 120%, y: 120%)[\(] cal(P)_h \( Z \) arrow.r Z \, med P mapsto P \( t \) #scale(x: 120%, y: 120%)[\)] = \( xi - t \) cal(P)_(h - 1) \( Z \) . $
  Indeed, division by $xi - t$ preserves the coefficient space $Z$, and it preserves each constraint at $t_i$ because $t_i - t eq.not 0$. The converse inclusion follows by multiplication. Therefore
  #[#set math.equation(numbering: n => "(2.2)")
   $ dim E_h \( Z \; t \) = k_h \( Z \) #h(2em) \( t in.not { t_1 \, dots.h \, t_m } \) . $ <eq:filtration-evaluation>]
  Also, evaluation at all $m$ nodes is an isomorphism
  $ cal(P)_(m - 1) \( Z \) arrow.r xor.big_(i = 1)^m \( U_i ∩ Z \) . $
  Its inverse sends $\( z_1 \, dots.h \, z_m \)$ to the polynomial $sum_i L_i \( xi \) z_i$, where $L_i \( xi \) = product_(k eq.not i) \( xi - t_k \) \/ \( t_i - t_k \)$. Uniqueness follows because a scalar polynomial of degree at most $m - 1$ with $m$ distinct roots vanishes, applied in coordinates of $Z$. Consequently
  #[#set math.equation(numbering: n => "(2.3)")
   $ sum_(h = 0)^(m - 1) k_h \( Z \) = dim cal(P)_(m - 1) \( Z \) = sum_(i = 1)^m dim \( U_i ∩ Z \) . $ <eq:filtration-sum>]
  #emph[Polynomial minors of controlled degree.] Fix $t_(*)$ outside the nodes. The spaces $E_h \( W \; t_(*) \)$ are nested, so
  $ ell_h = k_h \( W \) - k_(h - 1) \( W \) gt.eq 0 #h(2em) \( 0 lt.eq h lt.eq m - 1 \) . $
  At stage $h$, choose $ell_h$ polynomials from $cal(P)_h \( W \)$ whose values at $t_(*)$ extend the previously chosen values to a basis of $E_h \( W \; t_(*) \)$. In fixed coordinates of $W$, let $M_h \( xi \)$ be the matrix of all polynomial columns chosen through stage $h$. It has $r_h = k_h \( W \)$ columns, independent at $t_(*)$, and hence has an $r_h$-row square minor $Delta_h \( xi \)$ with $Delta_h \( t_(*) \) eq.not 0$. Each column introduced at stage $e$ has degree at most $e$. Expanding the determinant thus gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ deg Delta_h lt.eq sum_(e = 0)^h e ell_e . $ <eq:minor-degree>]
  If $r_h = 0$, use the empty determinant $Delta_h = 1$.
  #emph[Rank loss at the nodes.] For each $j$ we claim that
  #[#set math.equation(numbering: n => "(2.5)")
   $ dim E_h \( W \; t_j \) lt.eq k_h \( W \) - k_h \( V_j \) . $ <eq:node-rank>]
  Let $pi_j : W arrow.r W \/ V_j$ be the quotient map. At every non-node $t$, the kernel of $pi_j$ on $E_h \( W \; t \)$ contains $E_h \( V_j \; t \)$. Equation (2.2) gives
  $ dim pi_j \( E_h \( W \; t \) \) lt.eq k_h \( W \) - k_h \( V_j \) . $
  To pass to $t_j$, take a fixed basis of the polynomial space $cal(P)_h \( W \)$, evaluate its members at the variable $xi$, and project their columns by $pi_j$. In fixed coordinates this is a polynomial matrix. Every minor larger than the displayed rank bound vanishes at every non-node, an infinite set, and so is the zero polynomial. Its rank at $t_j$ obeys the same bound. But $E_h \( W \; t_j \) subset.eq U_j$, and $pi_j$ is injective on $U_j$ because $U_j ∩ V_j = { 0 }$. This proves (2.5).
  The chosen columns of $M_h \( t_j \)$ lie in $E_h \( W \; t_j \)$, and restricting to the rows of a minor cannot increase rank. The square submatrix defining $Delta_h$ therefore has rank deficiency at least $k_h \( V_j \)$ at $t_j$. A square polynomial matrix with deficiency at least $q$ at $t_j$ has determinant divisible by $\( xi - t_j \)^q$: choose $q$ independent vectors in its kernel at $t_j$, extend them to a constant invertible column change, and observe that the corresponding $q$ transformed columns vanish at $t_j$. Each contributes the factor $xi - t_j$, while the column change rescales the determinant by a nonzero constant. Applying this observation separately at the distinct nodes shows that
  $ product_(j = 1)^m \( xi - t_j \)^(k_h \( V_j \)) quad upright("divides ") Delta_h \( xi \) . $
  For $r_h = 0$, all $k_h \( V_j \)$ are zero by (2.2), so this assertion also holds for the empty determinant. Since $Delta_h$ is not the zero polynomial, (2.4) now yields
  #[#set math.equation(numbering: n => "(2.6)")
   $ sum_(j = 1)^m k_h \( V_j \) lt.eq sum_(e = 0)^h e ell_e . $ <eq:multiplicity-budget>]
  #emph[Summing the degree bounds.] Sum (2.6) over $h = 0 \, dots.h \, m - 1$ and apply (2.3) with $Z = V_j$. The result is
  $ sum_(i \, j = 1)^m dim \( U_i ∩ V_j \) & lt.eq sum_(h = 0)^(m - 1) sum_(e = 0)^h e ell_e = sum_(e = 0)^(m - 1) e \( m - e \) ell_e\
 & lt.eq ⌊m^2 / 4⌋ sum_(e = 0)^(m - 1) ell_e lt.eq ⌊m^2 / 4⌋ N . $
  The last step uses $sum_e ell_e = k_(m - 1) \( W \) = dim E_(m - 1) \( W \; t_(*) \) lt.eq N$. ◻
]

#prodef([Remark 2.2.])[
  The constant in Lemma 2 is sharp. Write $W = P xor Q$ and divide the indices into groups of sizes $a = floor.l m \/ 2 floor.r$ and $b = ceil.l m \/ 2 ceil.r$. Set $\( U_i \, V_i \) = \( P \, Q \)$ in the first group and $\( U_i \, V_i \) = \( Q \, P \)$ in the second. Only pairs from different groups contribute, and their total is $a b \( dim P + dim Q \) = floor.l m^2 \/ 4 floor.r N$.
]

The form needed for crossing counts follows by taking graphs of linear maps. Their intersections identify with kernels of matrix differences, so the upper bound on intersection dimensions becomes a lower bound on ranks.

#thm([Corollary 2.3.])[
  (Rank sum for differences).  #emph[Let $X_1 \, dots.h \, X_m \, Y_1 \, dots.h \, Y_m$ be real $d times d$ matrices. If $X_i - Y_i$ is invertible for every $i$, then 
#[#set math.equation(numbering: n => "(2.7)")
 $ sum_(1 lt.eq i \, j lt.eq m\
i eq.not j) "rank" \( X_i - Y_j \) gt.eq 2 d_m d \, #h(2em) d_m = ⌊m / 2⌋ ⌊frac(m - 1, 2)⌋ . $ <eq:rank-sum>]

 The sum is over ordered pairs of distinct indices.]
] <cor:rank-sum>

#proof[
  In $W = bb(R)^d xor bb(R)^d$, let
  $ U_i = { \( v \, X_i v \) : v in bb(R)^d } \, #h(2em) V_j = { \( v \, Y_j v \) : v in bb(R)^d } . $
  The map $v mapsto \( v \, X_i v \)$ identifies $ker \( X_i - Y_j \)$ with $U_i ∩ V_j$. Thus
  $ dim \( U_i ∩ V_j \) = d - "rank" \( X_i - Y_j \) \, #h(2em) U_i ∩ V_i = { 0 } . $
  Lemma 2, with $N = 2 d$, gives
  $ sum_(i \, j = 1)^m "rank" \( X_i - Y_j \) gt.eq (m^2 - 2 ⌊m^2 / 4⌋) d . $
  The $m$ diagonal terms each equal $d$. Removing them gives (2.7), because
  $ m^2 - m - 2 ⌊m^2 / 4⌋ = cases(delim: "{", 2 r \( r - 1 \) \, & m = 2 r \,, 2 r^2 \, & m = 2 r + 1 \,) = 2 d_m . $
  ◻
]

== 3 Signed intersections and cycle relations <sec:intersections>

Signed intersections of cycles impose relations on the crossing data between stars. We derive the block relation needed to apply the rank-sum inequality.

Fix a minimum drawing $D$ of $K_(m \, n)$. By Lemma 9, proved in Appendix 6, we may take its edges to be polygonal, straight in a neighborhood of every crossing and vertex, with no crossings between edges having a common endpoint. Independent edges may still cross several times. Orient the edge $i p$ from $a_i$ to $b_p$.

For oriented edges $e \, f$, let $I \( e \, f \)$ be the sum of the signs of their interior crossings. A crossing is positive when the ordered directions of $e$ and $f$ give the positive orientation of the plane. Set $I \( e \, e \) = 0$. At a vertex $v$, choose a gap between consecutive outward spokes and list the incident edges counterclockwise from that gap. Define

$ T_v \( e \, f \) = cases(delim: "{", 1 \, & e upright(" precedes ") f \,, - 1 \, & f upright(" precedes ") e \,, 0 \, & e = f \,) #h(2em) sigma_(v e) = cases(delim: "{", 1 \, & e upright(" is oriented out of ") v \,, - 1 \, & e upright(" is oriented into ") v .) $

The matrix indexed by the edges that we use is

#[#set math.equation(numbering: n => "(3.1)")
 $ J \( e \, f \) = I \( e \, f \) + 1 / 2 sum_(v upright(" an endpoint")\
upright("of both ") e \, f) sigma_(v e) sigma_(v f) T_v \( e \, f \) \, #h(2em) J^(i k) \( p \, q \) = J \( i p \, k q \) . $ <eq:signed-J>]

Thus $J^(i k)$ is an $n times n$ block. The half-order term records the local contribution of a common endpoint to an intersection of cycles. The next lemma identifies precisely that contribution.

#thm([Lemma 3.1.])[
  (Cycle pairing).  #emph[Let $z \, y in bb(R)^(E \( K_(m \, n) \))$ be the signed edge vectors of two oriented simple graph cycles: an entry is $1$ or $- 1$ according as the traversal agrees or disagrees with the fixed edge orientation, and is $0$ on an unused edge. Then 
#[#set math.equation(numbering: n => "(3.2)")
 $ z^(sans(T)) J y = 0 . $ <eq:cycle-pairing>]

 The cycles may share vertices and edges, and may traverse a shared edge in opposite directions.]
] <lem:cycle-pairing>

#proof[
  We first establish the local formula that explains the factor $1 \/ 2$. Let $C$ and $E$ be oriented chords of a round disk, with four distinct boundary endpoints. Give each chord’s start coefficient $- 1$ and its end coefficient $+ 1$; write these coefficients as $epsilon.alt_C \( u \)$ and $epsilon.alt_E \( w \)$. For a cut in the boundary away from the endpoints, let $T \( u \, w \)$ be $1$ if $u$ precedes $w$ counterclockwise from the cut, and $- 1$ otherwise. Their signed intersection is
  #[#set math.equation(numbering: n => "(3.3)")
   $ I \( C \, E \) = 1 / 2 sum_(u in partial C) sum_(w in partial E) epsilon.alt_C \( u \) epsilon.alt_E \( w \) T \( u \, w \) . $ <eq:chord-formula>]
  Moving the cut past one endpoint changes the right-hand side by a multiple of the sum of the other chord’s endpoint coefficients, which is zero. We may therefore cut just before the start of $C$. The right-hand side then becomes
  $ - sum_(w upright(" on the open counterclockwise arc")\
upright("from the start to the end of ") C) epsilon.alt_E \( w \) . $
  That boundary arc is on the right of the directed chord $C$. The sum is zero for nonalternating endpoints; for alternating endpoints it is $+ 1$ when $E$ runs from right to left across $C$, and $- 1$ in the reverse case. These are exactly the signed intersection values.
  Figure 1 illustrates the local signs and the averaging at a shared spoke used below.
  #figure(
    [#grid(
    columns: (0.47fr, 0.5fr,),
    column-gutter: 3%,
    [
      #cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.208, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((-1.208, 0), (1.208, 0), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -1.208), (0, 1.208), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  circle((-1.208, 0), radius: 0.05292, fill: black, stroke: none)
  circle((1.208, 0), radius: 0.05292, fill: black, stroke: none)
  circle((0, -1.208), radius: 0.05292, fill: black, stroke: none)
  circle((0, 1.208), radius: 0.05292, fill: black, stroke: none)
  content((-1.208, 0), [$-1$], anchor: "east", padding: 0.1176cm)
  content((1.208, 0), [$+1$], anchor: "west", padding: 0.1176cm)
  content((0, -1.208), [$-1$], anchor: "north", padding: 0.1176cm)
  content((0, 1.208), [$+1$], anchor: "south", padding: 0.1176cm)
  content((0, -2.016), [Transverse chords:#linebreak()signed intersection $+1$.])
})
    ],
    [
      #cetz.canvas({
  import cetz.draw: *
  arc((0.6656, -1.427), start: -65deg, stop: 65deg, radius: 1.575, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (1.575, 0), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.084, 0.252), (1.555, 0.252), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((0.084, -0.252), (1.555, -0.252), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b25a00"))))
  circle((1.575, 0), radius: 0.05292, fill: black, stroke: none)
  circle((1.555, 0.252), radius: 0.05292, fill: rgb("#0000a6"), stroke: none)
  circle((1.555, -0.252), radius: 0.05292, fill: rgb("#b25a00"), stroke: none)
  content((0, 0), [$v$], anchor: "east", padding: 0.1176cm)
  content((0.5985, 0.252), [#text(fill: rgb("#0000a6"))[left shift]], anchor: "south", padding: 0.1176cm)
  content((0.5985, -0.252), [#text(fill: rgb("#b25a00"))[right shift]], anchor: "north", padding: 0.1176cm)
  content((1.575, 0.42), [$T=+1$], anchor: "west", padding: 0.1176cm)
  content((1.575, -0.42), [$T=-1$], anchor: "west", padding: 0.1176cm)
  content((1.05, -2.016), [A shared outgoing spoke:#linebreak()the two order signs average to $0$.])
})
    ],
  )],
    caption: [Figure 1: The local terms in the signed-intersection identity. The coefficient of a chord’s start is $- 1$ and that of its end is $+ 1$. For a common spoke, the opposite displacements are considered in separate drawings; the chosen cut is away from all three nearby endpoints. ],
  ) <fig:chord-pairing>
  Choose small pairwise disjoint round vertex disks meeting the drawing only in its straight spokes. Replace the passage of the first cycle through each of its vertex disks by the chord joining its incoming and outgoing boundary points. Outside these disks, keep its original edge tracks. This gives a closed polygonal walk $gamma$; its drawing may have self-intersections.
  For the second cycle construct two closed polygonal walks $eta_(+)$ and $eta_(-)$ by shifting its edge tracks a small distance to the left and to the right, respectively, relative to the #emph[fixed graph-edge orientation]. In each vertex disk join the shifted boundary endpoints by a chord. Here is an explicit construction of the tracks outside the vertex disks. Place further pairwise disjoint small disks at crossings and nonstraight bends, each meeting only the straight pieces incident with its center. Shift each straight stretch between disks parallel to itself. In a crossing disk continue along the shifted line: it avoids its own original line and meets the other original line once, with the same crossing sign. In a bend disk the two shifted ends lie in the same component of the disk minus the original bent arc, and can be joined there by a polygonal arc. Indeed, for the left shift, the incoming boundary ray moves clockwise and the outgoing ray counterclockwise; both displaced ends are in the sector on the left of the oriented bend. The right shift uses the other sector. All remaining distinct truncated straight stretches are compact and disjoint, so sufficiently small shifts introduce no additional intersections. Finiteness permits one choice of shift size for the entire construction. At vertex-circle seams the two walks’ boundary endpoints are distinct and chord interiors lie in the open disk; at crossing disks the intended intersections remain strictly interior. Together with the avoidance inside bend disks, this excludes contacts at seams and corners.
  Consequently, in each version the signed intersections with $gamma$ outside the vertex disks sum to
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(e \, f) z_e y_f I \( e \, f \) = z^(sans(T)) I y . $ <eq:exterior-intersections>]
  This also describes shared tracks: a shifted edge avoids its own unshifted copy. If both cycles use both edges of an original crossing, the intersections of each shifted track with the other unshifted track give the two ordered-edge contributions in the displayed sum. Their signs include the traversal coefficients $z_e y_f$.
  Consider a vertex disk used by both cycles. The endpoint coefficient of its first chord on spoke $e$ is $sigma_(v e) z_e$: an incoming traversal starts the chord and an outgoing traversal ends it. The second chord’s corresponding coefficient is $sigma_(v f) y_f$. All endpoints belonging to the two different chords are distinct after either shift. Choose the shifts small enough that the original boundary cut stays in its chosen gap. For different spokes $e \, f$, the comparison sign of their endpoints is $T_v \( e \, f \)$ in both versions. For the same spoke, the two shifted endpoints lie on opposite sides of the unshifted endpoint in the boundary order. Their comparison signs therefore average to zero, as required by $T_v \( e \, e \) = 0$. Applying (3.3) and averaging, the contribution of this disk is
  $ 1 / 2 sum_(e \, f upright(" incident with ") v) z_e y_f sigma_(v e) sigma_(v f) T_v \( e \, f \) . $
  This cancellation for a shared spoke is unaffected by opposite cycle traversals: they change the endpoint coefficients, while the two order signs remain opposite.
  It remains to show that the total signed intersection of each pair $\( gamma \, eta_plus.minus \)$ is zero. More generally, let two closed polygonal walks meet transversely away from their corners, counting intersections by their segment traversals. Cone every oriented segment $\[ u \, w \]$ of the first walk to a point $o$, using the oriented triangle $\[ o \, u \, w \]$. Choose $o$ outside the finitely many lines that would make a triangle degenerate or a cone segment pass through a corner of the second walk; also avoid its segment lines. The added cone segments meet the second walk transversely away from corners. Each triangle boundary has total signed intersection zero with the second walk: every entrance into the triangle is paired, along that closed walk, with an exit, and the two have opposite signs. On summing triangle boundaries, the extra oriented cone segments cancel in pairs, leaving exactly the first walk. Its total signed intersection with the second is therefore zero. The argument counts traversals and does not require either walk to be simple. The constructed pairs satisfy these transversality conditions; any unnecessary straight subdivision points can be removed.
  Finally, average the zero total for $eta_(+)$ and $eta_(-)$. The exterior contribution is (3.4), and the vertex-disk contributions are exactly the local terms of (3.1). Their sum is $z^(sans(T)) J y$, proving (3.2). ◻
]

We now extract the matrix relation needed below. Let

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(L) = { H in bb(R)^(n times n) : H \( p \, q \) = r_p + c_q upright(" for some ") r \, c in bb(R)^n #scale(x: 120%, y: 120%)[}] . $ <eq:additive-space>]

#thm([Lemma 3.2.])[
  (Additive block relation).  #emph[For every $1 lt.eq i \, k lt.eq m$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ J^(i k) - J^(i 1) - J^(1 k) + J^11 in cal(L) . $ <eq:additive-relation>]

]
] <lem:additive>

#proof[
  Write the matrix on the left as $H$. Fix row indices $p \, p'$ and column indices $q \, q'$. If $i eq.not 1$, $k eq.not 1$, $p eq.not p'$, and $q eq.not q'$, use the four-cycle vector $z$ with entries $+ 1$ on $i p \, 1 p'$ and $- 1$ on $i p' \, 1 p$, and the four-cycle vector $y$ with entries $+ 1$ on $k q \, 1 q'$ and $- 1$ on $k q' \, 1 q$. Expanding Lemma 5 gives
  $ 0 = z^(sans(T)) J y = H \( p \, q \) - H \( p \, q' \) - H \( p' \, q \) + H \( p' \, q' \) . $
  If any of those index differences is trivial, the same rectangular difference vanishes directly. Thus all rectangular differences of $H$ vanish. For any fixed $p_0 \, q_0$ this says
  $ H \( p \, q \) = H \( p \, q_0 \) + H \( p_0 \, q \) - H \( p_0 \, q_0 \) \, $
  which is the required row-plus-column form. ◻
]

== 4 Detecting spoke orders by matrices of full rank <sec:detector>

Suppose throughout this section that $n = 2 s + 1$, where $s gt.eq 1$, and put $d = s^2 = d_n$. We construct one linear map on $n times n$ matrices that annihilates the additive ambiguity in Lemma 6 and every diagonal matrix, sends each individual off-diagonal entry to a matrix of rank one, and sends every matrix recording half the signs of a linear spoke order to an invertible $d times d$ matrix. The last property rests on the following interpolation pattern.

#thm([Lemma 4.1.])[
  (Two-triangle interpolation).  #emph[For any pairwise distinct real numbers $x_1 \, dots.h \, x_(2 s + 1)$, set 
#[#set math.equation(numbering: n => "(4.1)")
 $ Q_s = { \( p \, q \) : 1 lt.eq q < p lt.eq s + 1 } union { \( p \, q \) : s + 1 < p < q lt.eq 2 s + 1 } . $ <eq:triangular-pattern>]

 The values at $\( x_p \, x_q \)$ for $\( p \, q \) in Q_s$ determine uniquely a polynomial of degree at most $s - 1$ in each variable. Equivalently, the $s^2$ vectors 
$ h_(p q) = \( x_p^a x_q^b \)_(0 lt.eq a \, b < s) \, #h(2em) \( p \, q \) in Q_s \, $

 form a basis of $bb(R)^(s^2)$, with the coordinates taken in any fixed order.]
] <lem:triangular-basis>

Figure 2 shows the pattern $Q_s$ and the two eliminations in the inductive proof.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.215, -0.645), (1.505, -1.935), fill: rgb("#f2f2ff"), stroke: none)
  rect((2.365, -1.935), (3.225, -2.795), fill: rgb("#fff5eb"), stroke: none)
  line((0.215, -1.72), (1.505, -1.72), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.43, -0.645), (0.43, -1.505), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.1505, -0.43), [$1$], anchor: "east", padding: 0.1176cm)
  content((0.43, -0.1505), [$1$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -0.43), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  content((0.1505, -0.86), [$2$], anchor: "east", padding: 0.1176cm)
  content((0.86, -0.1505), [$2$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -0.86), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  content((0.1505, -1.29), [$3$], anchor: "east", padding: 0.1176cm)
  content((1.29, -0.1505), [$3$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -1.29), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  content((0.1505, -1.72), [$4$], anchor: "east", padding: 0.1176cm)
  content((1.72, -0.1505), [$4$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -1.72), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  content((0.1505, -2.15), [$5$], anchor: "east", padding: 0.1176cm)
  content((2.15, -0.1505), [$5$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -2.15), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  content((0.1505, -2.58), [$6$], anchor: "east", padding: 0.1176cm)
  content((2.58, -0.1505), [$6$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -2.58), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  content((0.1505, -3.01), [$7$], anchor: "east", padding: 0.1176cm)
  content((3.01, -0.1505), [$7$], anchor: "south", padding: 0.1176cm)
  circle((0.43, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.86, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.29, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((1.72, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.15, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((2.58, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((3.01, -3.01), radius: 0.03528, fill: rgb("#d3d3d3"), stroke: none)
  circle((0.43, -0.86), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((0.43, -1.29), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((0.86, -1.29), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((0.43, -1.72), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((0.86, -1.72), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((1.29, -1.72), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((2.58, -2.15), radius: 0.09172, fill: rgb("#cc6600"), stroke: none)
  circle((3.01, -2.15), radius: 0.09172, fill: rgb("#cc6600"), stroke: none)
  circle((3.01, -2.58), radius: 0.09172, fill: rgb("#cc6600"), stroke: none)
  content((-0.5375, -1.72), [$p$])
  content((1.72, 0.4945), [$q$])
  content((3.87, -1.032), [$q<p lt.eq 4$:#linebreak()first remove row $p=4$,#linebreak()then column $q=1$.], anchor: "west", padding: 0.1176cm)
  content((3.87, -2.322), [Remaining triangles:#linebreak()swap the two coordinate roles#linebreak()and exchange the surviving groups.], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The evaluation pattern $Q_s$ for $s = 3$, with $n = 7$ and $s^2 = 9$ selected pairs. Removing row $p = s + 1$ and then column $q = 1$ leaves the pattern for $s - 1$ after swapping coordinates and relabeling the two groups. The gray points are unselected pairs. ],
) <fig:triangular-grid>

#proof[
  The polynomial space has dimension $s^2$, and
  $ \| Q_s \| = frac(s \( s + 1 \), 2) + frac(s \( s - 1 \), 2) = s^2 . $
  It therefore suffices to show that a polynomial $P \( u \, v \)$ of degree at most $s - 1$ in each variable, vanishing at all these points, is zero. We prove this by induction on $s$. For $s = 1$, $P$ is constant and vanishes at the single point indexed by $\( 2 \, 1 \)$.
  Let $s > 1$. The first triangle contains the $s$ points $\( x_(s + 1) \, x_q \)$ for $1 lt.eq q lt.eq s$. The polynomial $P \( x_(s + 1) \, v \)$ has degree at most $s - 1$ and $s$ distinct roots, so it vanishes identically. Division in the variable $u$ gives
  $ P \( u \, v \) = \( u - x_(s + 1) \) P_1 \( u \, v \) \, #h(2em) deg_u P_1 lt.eq s - 2 \, quad deg_v P_1 lt.eq s - 1 . $
  For $p = 2 \, dots.h \, s$, the remaining points $\( x_p \, x_1 \)$ give $P_1 \( x_p \, x_1 \) = 0$, since $x_p eq.not x_(s + 1)$. Thus $P_1 \( u \, x_1 \)$, of degree at most $s - 2$, has $s - 1$ distinct roots and vanishes identically. Factoring in the second variable, we obtain
  #[#set math.equation(numbering: n => "(4.2)")
   $ P \( u \, v \) = \( u - x_(s + 1) \) \( v - x_1 \) R \( u \, v \) \, #h(2em) deg_u R \, deg_v R lt.eq s - 2 . $ <eq:triangle-factorization>]
  At every point in the two remaining triangles the displayed factors are nonzero. Hence
  $ R \( x_p \, x_q \) = 0 quad upright("if ") 2 lt.eq q < p lt.eq s quad upright("or if ") s + 2 lt.eq p < q lt.eq 2 s + 1 . $
  Define a tuple of $2 s - 1$ distinct nodes and a polynomial by
  $ \( y_1 \, dots.h \, y_(2 s - 1) \) = \( x_(s + 2) \, dots.h \, x_(2 s + 1) \, x_2 \, dots.h \, x_s \) \, #h(2em) S \( u \, v \) = R \( v \, u \) . $
  The lower triangle $q < p lt.eq s$ for the $y$-tuple becomes the remaining upper triangle for the $x$-tuple after the coordinate swap. The upper triangle $s < p < q lt.eq 2 s - 1$ becomes the remaining lower triangle. Consequently $S$ vanishes at every point of the pattern $Q_(s - 1)$ for the $y$-tuple. The induction hypothesis gives $S = 0$, hence $R = 0$ and $P = 0$. This proves injectivity of the square evaluation map and thus both assertions. ◻
]

#thm([Lemma 4.2.])[
  (Rank detector).  #emph[Fix any pairwise distinct real numbers $x_1 \, dots.h \, x_n$, where $n = 2 s + 1$ and $d = s^2$. There is a linear map $Phi : bb(R)^(n times n) arrow.r bb(R)^(d times d)$ with the following properties.]
  + #emph[$Phi$ annihilates every additive matrix $H \( p \, q \) = r_p + c_q$ and every diagonal matrix.]
  + #emph[For the coordinate matrix $E_(p q)$, the matrix $Phi \( E_(p q) \)$ has rank one if $p eq.not q$, and is zero if $p = q$.]
  + #emph[For every strict linear order $prec$ on ${ 1 \, dots.h \, n }$, the matrix $Phi \( S_prec \)$ is invertible, where 
$ S_prec \( p \, q \) = cases(delim: "{", 1 / 2 \, & p prec q \,, - 1 / 2 \, & q prec p \,, 0 \, & p = q .) $

]
  #emph[The same map has these properties for all orders simultaneously.]
] <lem:detector>

#proof[
  Set
  #[#set math.equation(numbering: n => "(4.3)")
   $ F \( t \) = product_(p = 1)^n \( t - x_p \) \, #h(2em) h_(p q) = \( x_p^a x_q^b \)_(0 lt.eq a \, b < s) \,\
B_(p q) = frac(x_p - x_q, F' \( x_p \) F' \( x_q \)) h_(p q) h_(p q)^(sans(T)) \, #h(2em) Phi \( H \) = sum_(p \, q = 1)^n H \( p \, q \) B_(p q) . $ <eq:detector-definition>]
  The factors $1 \/ F' \( x_p \)$ are the classical barycentric weights for Lagrange interpolation #cite(label("BerrutTrefethen2004")) Section 3, equation (3.2). All denominators are nonzero because the nodes are distinct. The constant coordinate of $h_(p q)$ is $1$, so $B_(p q)$ has rank one when $p eq.not q$, while $B_(p p) = 0$. This proves (ii) and the annihilation of diagonal matrices. Rank subadditivity also gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ "rank" Phi \( H \) lt.eq \| { \( p \, q \) : p eq.not q \, med H \( p \, q \) eq.not 0 } #scale(x: 120%, y: 120%)[\|] . $ <eq:detector-support-bound>]
  For the additive matrices, we use the elementary identity
  #[#set math.equation(numbering: n => "(4.5)")
   $ sum_(p = 1)^n frac(A \( x_p \), F' \( x_p \)) = 0 #h(2em) upright("if ") deg A lt.eq n - 2 . $ <eq:lagrange-vanishing>]
  Indeed, the polynomials $F \( t \) \/ \( \( t - x_p \) F' \( x_p \) \)$ have degree $n - 1$ and take the coordinate values $1$ at $x_p$ and $0$ at every other node. Subtracting their linear combination with coefficients $A \( x_p \)$ from $A$ gives a polynomial of degree at most $n - 1$ with $n$ distinct roots, so
  $ A \( t \) = sum_(p = 1)^n A \( x_p \) frac(F \( t \), \( t - x_p \) F' \( x_p \)) . $
  Comparison of the coefficients of $t^(n - 1)$ proves (4.5).
  The entry of $B_(p q)$ indexed by $\( a \, b \)$ and $\( a' \, b' \)$ is
  $ frac(\( x_p - x_q \) x_p^(a + a') x_q^(b + b'), F' \( x_p \) F' \( x_q \)) . $
  Its numerator has degree at most $2 s - 1 = n - 2$ in either variable separately. Applying (4.5) with the other variable fixed proves
  $ sum_(q = 1)^n B_(p q) = 0 quad upright("for every ") p \, #h(2em) sum_(p = 1)^n B_(p q) = 0 quad upright("for every ") q . $
  It follows that $Phi \( \( r_p + c_q \)_(p \, q) \) = 0$, completing (i).
  It remains to prove (iii). First take the natural order and write $S = S_prec$. Let $H \( p \, q \) = upright(bold(1))_(q < p)$ and let $upright(bold(1))$ denote the all-ones column vector. Then
  $ S = 1 / 2 upright(bold(1)) upright(bold(1))^(sans(T)) - H - 1 / 2 I_n \, #h(2em) Phi \( S \) = - Phi \( H \) . $
  Subtract $1$ from each row of $H$ indexed by $p > s + 1$, obtaining $H'$. The difference $H - H'$ is additive, so $Phi \( H' \) = Phi \( H \)$. Apart from diagonal entries, which $Phi$ annihilates, the support of $H'$ is exactly $Q_s$: its value is $+ 1$ on the first triangle of (4.1) and $- 1$ on the second.
  List the pairs in $Q_s$ in any order, and let $A_Q$ be the square matrix with columns $h_(p q)$ in that order. By Lemma 7, $A_Q$ is invertible. Equation (4.3) now gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ Phi \( S \) = - A_Q D_Q A_Q^(sans(T)) \, #h(2em) D_Q = "diag" (H' \( p \, q \) frac(x_p - x_q, F' \( x_p \) F' \( x_q \)))_(\( p \, q \) in Q_s) . $ <eq:detector-factorization>]
  Every diagonal entry of $D_Q$ is nonzero, so $Phi \( S \)$ is invertible.
  Finally let $pi \( 1 \) prec dots.h.c prec pi \( n \)$ be an arbitrary order. Relabel the indices and use the tuple $\( x_(pi \( 1 \)) \, dots.h \, x_(pi \( n \)) \)$ in the argument just given. The relabeled evaluation vector at $\( r \, q \)$ is $h_(pi \( r \) \, pi \( q \))$, so this only reindexes the sum defining $Phi \( S_prec \)$; the polynomial $F$ and the fixed map $Phi$ are unchanged. The relabeled nodes are distinct, so Lemma 7 applies again. Thus every order has invertible image under the original map. ◻
]

== 5 The crossing-number formula <sec:formula>

We now combine the preceding results to prove Theorem 1.

=== 5.1 The upper bound <the-upper-bound>

We recall the classical axis construction; see Woodall #cite(label("Woodall1993")) p. 658. Place the vertices $a_i$ on the vertical axis, divided as evenly as possible between its positive and negative rays. Place the vertices $b_p$ on the horizontal axis in the same way, and join every required pair by a straight segment. All positions are distinct and nonzero. An edge interior is contained in one open quadrant.

In a quadrant whose bounding rays contain $u$ first-class and $v$ second-class vertices, each choice of two vertices on each ray forms a convex quadrilateral. Exactly its diagonals cross, so the contribution is $binom(u, 2) binom(v, 2)$. Summing over the quadrants and using (1.1) gives exactly $d_m d_n$ crossings, provided no three segments concur in their interiors.

The positions can be chosen to ensure this condition. Three segments concurrent in their interiors must have six distinct endpoints, since segments with a common endpoint do not cross elsewhere. Their concurrence is a proper polynomial condition on their axis intercepts: keeping two segments fixed and varying an intercept of the third avoids their intersection. There are only finitely many triples, and the product of their nonzero defining polynomials cannot vanish on the open set of permitted positions. Thus an admissible drawing achieves the stated count. In particular,

#[#set math.equation(numbering: n => "(5.1)")
 $ "cr" \( K_(m \, n) \) lt.eq d_m d_n . $ <eq:upper>]

If $m lt.eq 2$ or $n lt.eq 2$, this already proves equality by nonnegativity.

=== 5.2 The lower bound for odd $n$ <the-lower-bound-for-odd-n>

Assume $m gt.eq 3$ and $n = 2 s + 1 gt.eq 3$, and put $d = s^2 = d_n$. Choose a minimum drawing $D$ normalized as in Lemma 9. In particular, no two edges with a common endpoint cross. Form the blocks $J^(i k)$ of its signed-intersection matrix. Use the map $Phi$ from Lemma 8, with any one tuple of distinct nodes, and set

$ R_(i k) = Phi \( J^(i k) \) \, #h(2em) X_i = R_(i 1) \, #h(2em) Y_k = R_11 - R_(1 k) . $

Lemma 6 and the annihilation property of $Phi$ imply

#[#set math.equation(numbering: n => "(5.2)")
 $ R_(i k) = X_i - Y_k . $ <eq:rank-family>]

Thus the matrices have the difference form required by Corollary 4. We next check its invertibility hypothesis on diagonal blocks and bound the other block ranks by crossings.

All edges in the star at $a_i$ are oriented outward and do not cross one another. Consequently $J^(i i)$ is exactly half the sign matrix of the linear spoke order at $a_i$. Lemma 8 gives

#[#set math.equation(numbering: n => "(5.3)")
 $ "rank" R_(i i) = d #h(2em) \( 1 lt.eq i lt.eq m \) . $ <eq:diagonal-ranks>]

For $i eq.not k$, let $c_(i k)$ be the number of crossing points between edges incident with $a_i$ and edges incident with $a_k$. The entries $J^(i k) \( p \, p \)$ may contain a local term at $b_p$, but $Phi$ annihilates all diagonal entries: the factor $x_p - x_q$ in (4.3) makes $B_(p p) = 0$. If $p eq.not q$, the two edges $i p \, k q$ have no common endpoint, so $J^(i k) \( p \, q \) = I \( i p \, k q \)$. Each nonzero such entry requires at least one crossing and contributes to $R_(i k)$ a matrix of rank at most one. Rank subadditivity yields

#[#set math.equation(numbering: n => "(5.4)")
 $ "rank" R_(i k) lt.eq c_(i k) #h(2em) \( i eq.not k \) . $ <eq:crossing-rank>]

This estimate counts crossing points correctly even when a pair of edges crosses repeatedly: cancellation in the signed sum can only reduce the number of nonzero contributions.

Corollary 4, applied to (5.2)–(5.3), now gives

$ 2 d_m d lt.eq sum_(i eq.not k) "rank" R_(i k) lt.eq sum_(i eq.not k) c_(i k) = 2 c \( D \) . $

The last equality holds because each crossing belongs to exactly two ordered pairs of distinct first-class stars. Thus $"cr" \( K_(m \, n) \) gt.eq d_m d_n$ for odd $n gt.eq 3$.

=== 5.3 The even case <the-even-case>

We use the vertex-deletion count appearing in Kleitman #cite(label("Kleitman1970")) Section 3, equations (6)–(7) and Woodall #cite(label("Woodall1993")) Theorem 1 and Corollary 1.1. Let $n > 2$ be even, and start again with a normalized minimum drawing $D$. Delete each of its $n$ second-class vertices in turn. Each remaining $K_(m \, n - 1)$ drawing has at least $d_m d_(n - 1)$ crossings by the odd case. Since the two edges at any crossing have distinct second-class endpoints, that crossing remains in exactly $n - 2$ of the deleted-vertex drawings. Therefore

$ \( n - 2 \) c \( D \) gt.eq n d_m d_(n - 1) = \( n - 2 \) d_m d_n \, $

where the last identity follows directly from (1.1) for even $n$. Division by $n - 2$ and the upper bound (5.1) prove equality. Together with the zero-factor cases, this completes Theorem 1. 0◻

== 6 Normalization of continuous-arc drawings <sec:normalization>

This appendix supplies the drawing reduction used in Section 3. The argument applies to any finite simple graph and counts every crossing point separately. The removal of adjacent-edge crossings is a standard ordinary-crossing reduction #cite(label("FulekEtAl2012")); we include the continuous-arc details.

#thm([Lemma 6.1.])[
  (Drawing normalization).  #emph[An admissible continuous-arc drawing of a finite simple graph can be replaced by a polygonal drawing with no more crossing points, with edges straight near every vertex and crossing, and with no crossings between edges sharing an endpoint. In particular, a drawing attaining the ordinary crossing number can be chosen to have these properties.]
] <lem:normalization>

#proof[
  #emph[Isolating the marked passages.] Call the vertices and crossing points of the given drawing its #emph[marks]. There are finitely many. Parameterize each edge injectively by $gamma_e : \[ 0 \, 1 \] arrow.r bb(R)^2$. On each edge, choose pairwise disjoint parameter neighborhoods of its marked parameters, with disjoint closures, using one-sided neighborhoods at $0$ and $1$. For a mark $w$ on that edge, the image of the compact parameter set outside its chosen neighborhood avoids $w$, and hence has positive distance from $w$. If $w$ is not on the edge, the entire compact edge image has positive distance from $w$. Since all these conditions are finite, we may choose pairwise disjoint closed round disks $D_w$, centered at the marks, so that every visit of an edge to $D_w$ is in its prescribed parameter neighborhood, and nonincident edges avoid $D_w$ altogether.
  For an interior mark on $e$, remove the parameter interval from the first to the last visit to $D_w$. This removes the intervening excursions too. At the starting endpoint remove the interval through the last visit to its disk; at the terminal endpoint remove the interval from the first visit to its disk. These removed intervals are disjoint along each edge. The retained middle pieces are compact arcs with endpoints on disk boundaries and interiors in
  $ Omega = bb(R)^2 \\ union.big_w D_w . $
  They are pairwise disjoint, with distinct endpoints: every possible intersection in the original drawing was a mark and has been removed. This construction uses the first and last visits to each #emph[closed] disk, which exist by compactness. It does not require an arc to cross a round disk boundary only finitely many times.
  #emph[Replacing the exterior pieces.] The finitely many disjoint compact middle pieces admit pairwise disjoint open neighborhoods $U_P$. For a boundary endpoint $x$ of one piece $P$, take a short straight spur from $x$ radially outward from its disk. Its interior lies in $U_P ∩ Omega$. The spur tip can be connected to a nearby interior point of $P$ in that same open set. To see this directly, a sufficiently small exterior collar at $x$ lies in $U_P$ and meets no other disk. In polar coordinates about the disk center, choose the collar to have radius in $\( r \, r + delta \)$ and angle in a small open interval about the angle of $x$, where $r$ is the disk radius. It contains both the spur tip and all sufficiently nearby interior points of $P$. Radial paths and a short concentric arc connect those points inside the collar. Do this at both ends of $P$ and use the original middle subarc between the selected interior points. The resulting connection between the two spur tips lies in $U_P ∩ Omega$.
  Any continuous path with compact image in an open subset of the plane can be replaced, with the same endpoints, by a polygonal path in that open set: cover its image by small balls in the set, subdivide its parameter interval so each subarc lies in one such ball, and join successive subdivision points by straight segments there. Apply this to the connection just obtained, then attach the two spurs. If the result has loops, subdivide the finite union of its segments at all segment endpoints and intersections; for collinear overlaps, also subdivide at the overlap endpoints and identify coincident pieces. This is a finite embedded graph. A simple graph path between the original boundary endpoints is a simple polygonal arc, still in $U_P$ with its interior in $Omega$. Carry out this construction for every $P$. Their disjoint neighborhoods ensure that no resulting exterior pieces meet.
  #emph[Filling the disks.] In a crossing disk join each of its two pairs of boundary endpoints by a straight chord. The four endpoints are distinct. The chords can therefore meet at most once, and any meeting is an interior transverse crossing: a line cannot contain four distinct points of a circle. In a vertex disk choose a new vertex point in its interior off the finitely many lines through pairs of its boundary endpoints, and join all the endpoints to it by straight spokes. These spokes meet only at the vertex. The new vertex points in different disks are distinct.
  Assemble the spokes, chords, and exterior polygonal pieces in their original edge order. Each resulting edge is simple: the exterior pieces are disjoint, the disks are disjoint, and an edge uses at most one chord or spoke in any one disk. Its interior avoids all vertices. Every inter-edge crossing lies in an original crossing disk, with at most one crossing in that disk and no third edge there. Thus the result is admissible, polygonal, and has no more crossings than the given drawing. It is straight near every vertex and every crossing.
  #emph[Removing adjacent-edge crossings.] Suppose two polygonal edges $e = v u$ and $f = v w$ sharing $v$ cross at $x$. As the graph is simple, $u eq.not w$. Choose a small round disk about $x$ that meets only the two straight crossing strands and contains no other mark or bend. Swap the portions of $e$ and $f$ from $v$ up to this disk, then connect the swapped prefixes to the original suffixes. Inside the disk this pairs adjacent boundary endpoints, so two disjoint chords make the reconnections. The result is a walk from $v$ to $u$ and a walk from $v$ to $w$. The crossing at $x$ has disappeared. Outside the disk every old open track is assigned exactly once in total to the two new walks.
  The walks may have self-intersections. Subdivide their tracks at all remaining intersections and bends, and repeatedly delete the closed subwalk between two occurrences of the same subdivision vertex. Each deletion shortens a finite walk, so it yields a simple polygonal path between the required endpoints. We check that this operation preserves admissibility. At an old crossing of $e$ and $f$ distinct from $x$, either the two straight-through tracks belong to different new walks, or both belong to one walk. In the first case each walk visits that point only once; loop deletion either removes its passage or retains its original straight-through passage. In the second case loop deletion may create a turn at that point, but neither the other walk nor a third edge is present there. Likewise, a crossing with any third edge occurs on a track visited at most once by the two walks together, and any retained passage is straight-through. These observations cover every possible meeting: the original drawing had no triple crossings and no common subarcs. The tracks avoid graph vertices in their interiors, and each walk visits its initial and terminal graph vertices only at its ends. Hence the simplified paths are admissible edges, with no new crossing or improper meeting.
  The crossing at $x$ has been removed and none has been added. Repeat this operation while an adjacent-edge crossing remains. The nonnegative integer crossing count decreases at every step, so the process terminates. Remaining crossings are still locally straight; any new turn occurs away from all other edges. The straight spokes at vertices are merely reassigned among the two incident edges. Small disjoint vertex, crossing, and bend disks can be chosen afresh afterwards. This proves all asserted properties. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
