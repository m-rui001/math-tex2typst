#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A nine-dimensional counterexample to Borsuk's covering assertion]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Borsuk’s partition problem asks whether every bounded set of positive diameter in $bb(R)^d$ can be covered by $d + 1$ subsets of strictly smaller diameter. For a bounded set $Y$ of positive diameter, write $b \( Y \)$ for the least number of such subsets needed to cover $Y$. Covers and partitions give the same number: overlaps may be removed without increasing diameters. We prove that $b \( Y \) > 10$ for a compact set in $bb(R)^9$.

Let $"Sym"_4 \( bb(R) \)$ be the space of real symmetric $4 times 4$ matrices, with Frobenius norm $parallel A parallel_F^2 = "tr" \( A^2 \)$. Its trace-one affine hyperplane is a nine-dimensional Euclidean space. For a unit vector $u in bb(R)^4$, the matrix $u u^(sans(T))$ is the orthogonal projector onto the line spanned by $u$.

#thm([Theorem 1.1.])[
  #emph[The compact set 
$ X = { u u^(sans(T)) : u in bb(R)^4 \, med parallel u parallel = 1 } subset { A in "Sym"_4 \( bb(R) \) : "tr" A = 1 } \, $

 with the Frobenius metric, has diameter $sqrt(2)$ and cannot be covered by ten subsets of diameter strictly less than $sqrt(2)$.]
] <thm:main>

Thus Borsuk’s assertion fails in dimension nine. The theorem does not determine the smallest dimension in which it fails or the exact value of $b \( X \)$. Its witness is the full compact projector image of real projective three-space. Corollary 19 extends the construction to compact counterexamples in every dimension $d gt.eq 9$.

=== History and the method <history-and-the-method>

Borsuk posed the partition question in 1933 #cite(label("Borsuk1933")). Kahn and Kalai disproved it in high dimensions #cite(label("KahnKalai1993")), using a forbidden-intersection theorem of Frankl and Wilson #cite(label("FranklWilson1981")) to force many smaller-diameter parts. Early reductions in counterexample dimension include $946$ by Nilli #cite(label("Nilli1994")), the announced bound $903$ of Grey and Weissbach #cite(label("GreyWeissbach1997")), $561$ by Raigorodskii #cite(label("Raigorodskii1997")), and $560$ by Weissbach #cite(label("Weissbach2000")).

Spherical codes led to a further series of reductions. Hinrichs obtained dimension $323$ using vectors of the Leech lattice #cite(label("Hinrichs2002")). Pikhurko reduced the bound to $321$ and credited an independent discovery by Hinrichs and Richter #cite(label("Pikhurko2002")); Hinrichs and Richter published their bound $298$ in 2003 #cite(label("HinrichsRichter2003")).

A different series of advances used strongly regular graphs. Bondarenko constructed a two-distance counterexample in dimension $65$ #cite(label("Bondarenko2014")); Jenrich and Brouwer obtained dimension $64$ #cite(label("JenrichBrouwer2014")). Grinsztajn’s public proof note gives a finite counterexample in dimension $63$ #cite(label("Grinsztajn2026")). Theorem 1 improves this dimension bound using the full compact image of projective space rather than a finite configuration.

The projector embedding itself is classical. Kalai describes the map $x mapsto x ⊗ x$ and the full rank-one positive semidefinite configuration in his account of the Kahn–Kalai construction #cite(label("Kalai2015")) Section 2.3. Conway, Hardin, and Sloane use the same projection-matrix model for Grassmannian packing and its Euclidean metric #cite(label("ConwayHardinSloane1996")) Section 5, Theorem 2. Our contribution is the covering obstruction for the projector set associated with $bb(R)^4$.

The relevant topological antecedents include Walkup’s eleven-vertex minimum for triangulations of $bb(R P)^3$ #cite(label("Walkup1970")) Theorem 3 and the projective-space vertex bounds of Arnoux and Marin #cite(label("ArnouxMarin1991")). These results cannot be applied directly to the complex here: its faces are positive coordinate supports of a map, not simplices in a triangulation of projective space. The central difficulty is to derive enough of its face structure from the map itself. We do this through an odd map on symmetric matrices, mod-two degree, and local preimage counts, and then give the finite combinatorial obstruction in full.

=== Proof overview <proof-overview>

Two projectors in $X$ are at diameter distance precisely when their underlying lines are orthogonal. A hypothetical cover by ten sets of strictly smaller diameter can be enlarged to an open cover. A smooth partition of unity then gives nonnegative functions $f_1 \, dots.h \, f_10$ on $bb(R P)^3$, with sum one, such that orthogonal lines have disjoint sets of positive coordinates. Section 2 proves this reduction for arbitrary covering sets.

We record these sets of positive coordinates in a finite simplicial complex: a set of labels is a face if all its coordinates are positive at some line. To constrain this complex, Section 3 extends the map $f$ to positive semidefinite matrices by integration, then subtracts its values on the positive and negative parts of a symmetric matrix. For the resulting odd map, the sum of the absolute output coordinates equals the sum of the absolute eigenvalues of the input matrix. Normalizing these two sums gives an odd map between spheres. In Section 4, its mod-two degree forces every maximal support to have four labels and the sum of these tetrahedral faces to be a cycle.

The main topological step is the equality argument in Section 4. At the threshold of $k \( k + 1 \) \/ 2$ labels on $bb(R P)^(k - 1)$, a maximal support with fewer than $k$ labels would give a positive-dimensional regular level set inside one affine projective chart. Applying the matrix extension on the orthogonal complement of each line gives a map on a sphere bundle over this level set. The odd degree of the original extension forces an odd preimage count for this map, whereas the chart trivialization makes the same count even through the induced map on the projective bundle. Once every maximal support has $k$ labels, the remaining odd local counts determine the coefficients of the facet cycle.

The last stage converts this topological information into a finite obstruction. The same degree argument in $bb(R)^3$ produces a rigid triangle system on six labels, described in Section 5. Each tetrahedral face of the ten-label complex forces such a system on its six-label complement. Once these systems have been derived, Section 6 follows them across adjacent tetrahedra by purely combinatorial arguments. Their compatibility restricts the cycles around edges and organizes a subset of the labels into small blocks. The blocks and the remaining labels give the final contradiction. Section 7 returns to the diameter cover.

== 2 From diameter covers to projective maps <sec:geometry>

The geometric part of the proof converts a smaller-diameter cover into a smooth map whose positive coordinates separate orthogonal lines. We first make this conversion explicit, so that the remaining obstruction can be formulated entirely on projective space.

The projection-matrix metric is the rank-one case of the standard Euclidean embedding of real Grassmannians #cite(label("ConwayHardinSloane1996")) Section 5, Theorem 2. Their chordal distance is $1 \/ sqrt(2)$ times the Frobenius distance used here. We give the short computation to fix the normalization throughout the proof.

Let $V = bb(R)^k$ have its usual inner product, with $k gt.eq 2$, and let $bb(P) \( V \)$ denote its space of one-dimensional linear subspaces. For a line $x = \[ u \]$, represented by a unit vector $u$, write $P_x = u u^(sans(T))$ for the orthogonal projector onto $x$. Let $"Sym" \( V \)$ be the space of real symmetric operators, equipped with the Frobenius inner product $chevron.l A \, B chevron.r_F = "tr" \( A B \)$, and put

$ N_k = dim "Sym" \( V \) = frac(k \( k + 1 \), 2) \, #h(2em) X_k = { P_x : x in bb(P) \( V \) } . $

#thm([Lemma 2.1.])[
  (Projector geometry).  #emph[The map $x mapsto P_x$ identifies $bb(P) \( V \)$ homeomorphically with the compact set $X_k$ in the trace-one affine subspace of $"Sym" \( V \)$. This affine subspace is Euclidean of dimension $N_k - 1$. If $u \, v$ are unit representatives of $x \, y$, then 
#[#set math.equation(numbering: n => "(2.1)")
 $ parallel P_x - P_y parallel_F^2 = 2 - 2 chevron.l u \, v chevron.r^2 . $ <eq:projector-distance>]

 Consequently $"diam" \( X_k \) = sqrt(2)$, and two projectors are at this distance exactly when their lines are orthogonal.]
] <lem:projector-geometry>

#proof[
  The formula $u u^(sans(T))$ is unchanged when $u$ is replaced by $- u$, so it gives a continuous map on projective space. Its range as an operator is exactly $x$, which proves injectivity. A continuous injection from the compact space $bb(P) \( V \)$ into a Hausdorff space is a homeomorphism onto its image. Every $P_x$ has trace one, and the trace-one hyperplane has codimension one in $"Sym" \( V \)$. Finally, $"tr" \( P_x^2 \) = "tr" \( P_y^2 \) = 1$ and $"tr" \( P_x P_y \) = chevron.l u \, v chevron.r^2$, proving (2.1). Orthogonal lines exist because $k gt.eq 2$. ◻
]

#prodef([Remark 2.2.])[
  (Euclidean coordinates).  An explicit isometry from the trace-one symmetric $4 times 4$ matrices to $bb(R)^9$ is
  #[#set math.equation(numbering: n => "(2.2)")
   $ A mapsto #scale(x: 240%, y: 240%)[\(] & frac(a_11 - a_22, sqrt(2)) \, #h(0.27778em) frac(a_11 + a_22 - 2 a_33, sqrt(6)) \, #h(0.27778em) frac(a_11 + a_22 + a_33 - 3 a_44, sqrt(12)) \,\
 & sqrt(2) a_12 \, sqrt(2) a_13 \, sqrt(2) a_14 \, sqrt(2) a_23 \, sqrt(2) a_24 \, sqrt(2) a_34 #scale(x: 240%, y: 240%)[\)] . $ <eq:euclidean-coordinates>]
  The first three coordinates use an orthonormal basis of the trace-zero diagonal matrices. The factors $sqrt(2)$ in the remaining six coordinates account for the two equal off-diagonal entries in the Frobenius norm. Thus the nine-dimensional witness will be $X_4$ with exactly its stated metric.
]

Write $\[ m \] = { 1 \, dots.h \, m }$ and $Delta^(m - 1) = { \( t_1 \, dots.h \, t_m \) : t_i gt.eq 0 \, med sum_i t_i = 1 }$.

#prodef([Definition 2.3.])[
  A smooth map $f = \( f_1 \, dots.h \, f_m \) : bb(P) \( V \) arrow.r bb(R)^m$ is #emph[admissible] if each $f_i$ is nonnegative, $sum_i f_i = 1$, and, writing $S \( x \) = { i : f_i \( x \) > 0 }$,
  #[#set math.equation(numbering: n => "(2.3)")
   $ x perp y quad arrow.r.double quad S \( x \) ∩ S \( y \) = diameter . $ <eq:admissibility>]
  Here smoothness means smoothness of the real coordinate functions on the usual smooth manifold $bb(P) \( V \)$.
] <def:admissible>

Restricting an admissible map to $bb(P) \( W \)$ for a nonzero linear subspace $W subset.eq V$ preserves admissibility. Coordinates that vanish identically on this subspace may be omitted.

#thm([Lemma 2.4.])[
  (The strict-gap reduction).  #emph[If $X_k$ is covered by at most $m$ subsets, each of diameter strictly less than $sqrt(2)$, then there is an admissible map $f : bb(P) \( V \) arrow.r bb(R)^m$.]
] <lem:cover-to-map>

#proof[
  Pad the cover by empty sets to write it as $A_1 \, dots.h \, A_m$. For every nonempty $A_i$, set $d_i = "diam" \( A_i \)$ and $epsilon_i = \( sqrt(2) - d_i \) \/ 4 > 0$, and define the relatively open set
  $ U_i = { P in X_k : "dist"_F \( P \, A_i \) < epsilon_i } . $
  Set $U_i = diameter$ if $A_i = diameter$. The sets $U_i$ cover $X_k$. For any $P \, Q in U_i$, points of $A_i$ within $epsilon_i$ of $P \, Q$ and the triangle inequality give
  $ parallel P - Q parallel_F < d_i + 2 epsilon_i = frac(d_i + sqrt(2), 2) < sqrt(2) . $
  In particular $"diam" \( U_i \) lt.eq \( d_i + sqrt(2) \) \/ 2 < sqrt(2)$.
  Pull these sets back to a finite open cover $V_i$ of $bb(P) \( V \)$. A smooth partition of unity subordinate to this cover #cite(label("Lee2013")) Theorem 2.23 gives smooth nonnegative functions $f_i$, with sum one and $f_i \( x \) > 0$ only if $x in V_i$. Empty sets receive the zero function. If $i$ belonged to both $S \( x \)$ and $S \( y \)$ for orthogonal lines $x \, y$, then $P_x \, P_y in U_i$ would be at distance $sqrt(2)$ by Lemma 2, a contradiction. ◻
]

The strict diameter inequalities are what permit the open neighborhoods and the smooth partition of unity; merely excluding individual orthogonal pairs from arbitrary color classes does not supply this reduction.

For an admissible map, define its #emph[support complex] $K$ on the label set ${ 1 \, dots.h \, m }$ by

$ I in K quad arrow.l.r.double quad I subset.eq S \( x \) med upright("for some ") x in bb(P) \( V \) . $

It is a finite simplicial complex, possibly with unused labels, and $f$ takes values in its geometric realization inside the standard simplex. No triangulation of $bb(P) \( V \)$ is assumed. The next sections derive the properties of $K$ that will rule out an admissible map when $k = 4$ and $m = 10$.

== 3 An extension to symmetric matrices <sec:extension>

Fix an admissible map $f : bb(P) \( V \) arrow.r bb(R)^m$, where $dim V = k$. We extend $f$ first to positive semidefinite operators and then to all symmetric operators. Orthogonal spectral subspaces will give disjoint sets of labels, producing an odd map between spheres.

Define the continuous degree-two homogeneous function $H : V arrow.r bb(R)^m$ by

$ H \( v \) = cases(delim: "{", parallel v parallel^2 f \( \[ v \] \) \, & v eq.not 0 \,, 0 \, & v = 0 .) $

Continuity at zero follows from $parallel H \( v \) parallel_1 = parallel v parallel^2$. For a positive semidefinite operator $Q$, let

#[#set math.equation(numbering: n => "(3.1)")
 $ E_V \( Q \) = k integral_(bb(S) \( V \)) H \( Q^(1 \/ 2) u \) thin d mu_V \( u \) \, $ <eq:extension>]

where $mu_V$ is rotation-invariant probability measure on the unit sphere. The positive square root is meant throughout. We usually write $E$ when the ambient space is clear.

#thm([Lemma 3.1.])[
  (Properties of the positive extension).  #emph[The map $E_V$ is continuous on the full positive semidefinite cone, including its singular boundary. For $t gt.eq 0$ it satisfies 
$ E_V \( t Q \) = t E_V \( Q \) \, #h(2em) E_V \( Q \)_i gt.eq 0 \, #h(2em) sum_(i = 1)^m E_V \( Q \)_i = "tr" Q . $

 Its positive coordinates are exactly the labels used on the range of $Q$: 
#[#set math.equation(numbering: n => "(3.2)")
 $ { i : E_V \( Q \)_i > 0 } = union.big_(x in bb(P) \( "ran" Q \)) S \( x \) \, $ <eq:extension-support>]

 where the right side is empty for $Q = 0$. Moreover:]
  + #emph[$E_V \( P_x \) = f \( x \)$ for every line $x$;]
  + #emph[if $Q$ is supported on a nonzero subspace $W subset.eq V$, then $E_V \( Q \) = E_W \( Q \|_W \)$, where the latter construction uses $f \|_(bb(P) \( W \))$ and the factor $dim W$;]
  + #emph[this last expression is smooth when $W$ varies smoothly with fixed dimension and $Q \|_W$ varies smoothly through positive definite operators.]
] <lem:positive-extension>

#proof[
  The positive square root depends continuously on a positive semidefinite matrix. For example, approximate the square-root function uniformly by polynomials on a compact interval containing the spectra under consideration, and apply those polynomials to the matrices. Thus the integrand in (3.1) is jointly continuous in $\( Q \, u \)$; integration over the compact sphere proves continuity of $E_V$. Its homogeneity and nonnegativity follow from the corresponding properties of $H$. Since $sum_i H \( v \)_i = parallel v parallel^2$ and $integral u u^(sans(T)) thin d mu_V \( u \) = k^(- 1) I$, we have
  $ sum_i E_V \( Q \)_i = k integral chevron.l Q u \, u chevron.r thin d mu_V \( u \) = "tr" Q . $
  Every nonzero $Q^(1 \/ 2) u$ lies in $"ran" Q$. Conversely, every line in that range is spanned by some $Q^(1 \/ 2) u$ with $parallel u parallel = 1$, because $Q^(1 \/ 2)$ is invertible on its range. If $f_i$ is positive on such a line, the $i$th integrand is positive at that $u$, and hence on a nonempty open set of the sphere. Such a set has positive measure. This proves (3.2) in both directions. For $Q = P_x$, every nonzero integrand is a scalar multiple of $f \( x \)$, and the scalars integrate to $"tr" P_x = 1$. Thus $E_V \( P_x \) = f \( x \)$.
  To prove the subspace identity, write $r = dim W$ and let $pi_W$ be orthogonal projection. The finite measure on $bb(S) \( W \)$ defined by
  $ B mapsto integral_(bb(S) \( V \)) parallel pi_W u parallel^2 thin upright(bold(1))_({ pi_W u eq.not 0 \, #h(0.27778em) pi_W u \/ parallel pi_W u parallel in B }) thin d mu_V \( u \) $
  is invariant under all orthogonal transformations of $W$. Its total mass is $integral parallel pi_W u parallel^2 thin d mu_V \( u \) = r \/ k$, so it equals $\( r \/ k \) mu_W$. Because $Q$ vanishes on $W^perp$ and $H$ is homogeneous of degree two, this gives
  $ k integral_(bb(S) \( V \)) H \( Q^(1 \/ 2) u \) thin d mu_V \( u \) = r integral_(bb(S) \( W \)) H \( \( Q \|_W \)^(1 \/ 2) w \) thin d mu_W \( w \) \, $
  as claimed.
  Finally choose, locally in the parameters, a smooth orthonormal frame $T : bb(R)^r arrow.r W$. Write $Q \|_W$ in that frame as the positive definite matrix $C$. The subspace formula becomes
  $ E_V \( Q \) = r integral_(bb(S)^(r - 1)) H \( T C^(1 \/ 2) w \) thin d mu \( w \) . $
  The matrix square root is smooth on positive definite matrices, and $T C^(1 \/ 2) w$ never vanishes. The function $H$ is smooth away from zero. Differentiating this expression over the compact sphere proves the asserted local smoothness. ◻
]

For a symmetric operator $A$, let $\| A \| = \( A^2 \)^(1 \/ 2)$ and $A_(+) = \( \| A \| + A \) \/ 2$, $A_(-) = \( \| A \| - A \) \/ 2$. These are its positive and negative parts, so $A = A_(+) - A_(-)$ and their ranges are orthogonal. Define

#[#set math.equation(numbering: n => "(3.3)")
 $ F \( A \) = E_V \( A_(+) \) - E_V \( A_(-) \) . $ <eq:signed-extension>]

#thm([Lemma 3.2.])[
  (The odd sphere map).  #emph[The map $F : "Sym" \( V \) arrow.r bb(R)^m$ is continuous, odd, and homogeneous of degree one for nonnegative scalars. It satisfies 
#[#set math.equation(numbering: n => "(3.4)")
 $ parallel F \( A \) parallel_1 = "tr" \| A \| \, #h(2em) sum_i F \( A \)_i = "tr" A . $ <eq:extension-norms>]

 More precisely, its positive and negative label sets are 
#[#set math.equation(numbering: n => "(3.5)")
 $ { i : F \( A \)_i > 0 } & = union.big_(x in bb(P) \( "ran" A_(+) \)) S \( x \) \,\
{ i : F \( A \)_i < 0 } & = union.big_(x in bb(P) \( "ran" A_(-) \)) S \( x \) . $ <eq:spectral-support>]

 If every coordinate of $F \( A \)$ is nonzero, then $A$ is nonsingular. If all coordinates of $F \( A \)$ are strictly negative, then $A$ is negative definite; the analogous statement holds with both signs reversed. The map $F$ is smooth on the open set of nonsingular symmetric operators. In particular, it restricts to a continuous odd map 
#[#set math.equation(numbering: n => "(3.6)")
 $ { A : "tr" \| A \| = 1 } arrow.r { y in bb(R)^m : parallel y parallel_1 = 1 } . $ <eq:norm-sphere-map>]

]
] <lem:signed-extension>

#proof[
  Continuity and homogeneity follow from Lemma 6 and the continuous formulas for $A_plus.minus$. Replacing $A$ by $- A$ exchanges $A_(+)$ and $A_(-)$, so $F$ is odd. Any line in $"ran" A_(+)$ is orthogonal to every line in $"ran" A_(-)$. Admissibility and (3.2) therefore imply that $E_V \( A_(+) \)$ and $E_V \( A_(-) \)$ have disjoint positive coordinates. There is no cancellation in their difference. This proves (3.5) and, by summing coordinates, (3.4).
  If $ker A$ contains a line $x$, choose $i in S \( x \)$, which is possible because $sum_i f_i \( x \) = 1$. The line $x$ is orthogonal to both spectral ranges. Thus label $i$ is absent from both unions in (3.5), so $F \( A \)_i = 0$. This proves the nonsingularity assertion. If all coordinates of $F \( A \)$ are negative, then $E_V \( A_(+) \) = 0$ by disjointness of the two positive supports. Hence $"tr" A_(+) = 0$, so $A_(+) = 0$, and nonsingularity makes $A$ negative definite. Oddness gives the positive case.
  For local smoothness, fix nonsingular $A$. In a neighborhood of $A$, the positive and negative spectral subspaces have constant dimensions and depend smoothly on the matrix. Explicitly their projections are
  $ Pi_plus.minus \( A \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] I plus.minus A \( A^2 \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] \, $
  which are smooth there because $A^2$ is positive definite. Each projection admits a local smooth orthonormal frame: project a fixed basis for its range and apply Gram–Schmidt after shrinking the neighborhood. In these frames, $A_(+)$ and $A_(-)$ restrict to positive definite operators on their respective ranges. The last assertion of Lemma 6 proves smoothness of $E_V \( A_(+) \)$ and $E_V \( A_(-) \)$, with a zero term if the corresponding range has dimension zero. This proves smoothness of $F$. ◻
]

The two norm spheres in (3.6) are not being regarded as globally smooth hypersurfaces. Radial normalization identifies them antipodally with the ordinary Euclidean spheres of dimensions $N_k - 1$ and $m - 1$. These identifications are homeomorphisms everywhere and smooth diffeomorphisms locally at nonsingular matrices and label vectors with every coordinate nonzero. Indeed, $"tr" \| A \|$ is smooth near a nonsingular $A$, while the $ell^1$ norm is a fixed linear form within each open sign orthant. Consequently ordinary sphere degree applies to (3.6) when $m = N_k$, and local differential arguments are valid at every preimage of a full-support value.

== 4 The equality case gives a simplicial cycle <sec:topology>

The symmetric-matrix extension gives more than a lower bound on the number of labels. At equality, its degree controls every maximal support of the admissible map. We prove that these supports all have the same size and that their sum is a cycle. No triangulation of projective space is assumed.

Throughout this section, homology and cohomology have coefficients in $bb(F)_2$. For a Euclidean space $V$ of dimension $k$, write

$ Sigma \( V \) = { A in "Sym" \( V \) : "tr" \| A \| = 1 } \, #h(2em) Sigma_m = { y in bb(R)^m : sum_i \| y_i \| = 1 } . $

Radial projection identifies these spaces antipodally with $S^(N_k - 1)$ and $S^(m - 1)$, respectively. We give them the smooth structures transported by these identifications. Near nonsingular operators, respectively full-support label vectors, these structures agree with their usual smooth hypersurface structures: the relevant norm functions are smooth there. Let $f : bb(P) \( V \) arrow.r Delta^(m - 1)$ be a smooth admissible map, and let $F : Sigma \( V \) arrow.r Sigma_m$ be its continuous odd extension constructed in the preceding section.

#thm([Proposition 4.1.])[
  (The number of labels).  #emph[If $k gt.eq 2$, every smooth admissible map $f : bb(P) \( bb(R)^k \) arrow.r Delta^(m - 1)$ satisfies $m gt.eq N_k$. If $m = N_k$, its extension $F$ has mod-two degree one and is surjective. In this equality case, every pair of labels is an edge of the support complex of $f$.]
] <thm:label-bound>

#proof[
  An odd map $S^n arrow.r S^d$ requires $n lt.eq d$, and an odd self-map of $S^n$ has odd degree; see #cite(label("Hatcher2002")) Proposition 2B.6 and Corollary 2B.7. Applying these facts to $F$ proves the bound and the degree assertion. A map of nonzero degree cannot omit a point of its target sphere, since the complement of a point is contractible.
  Suppose $m = N_k$ and fix distinct labels $i \, j$. Choose a vector in $Sigma_m$ with every coordinate nonzero, with precisely the $i$th and $j$th coordinates positive. At a preimage $A$ under $F$, every line in the positive spectral subspace of $A$ uses only these two labels. That subspace cannot have dimension at least two: restriction to a two-dimensional subspace would contradict the bound $N_2 = 3$ just proved. Its dimension is therefore one. The exact spectral-support property of $F$ says that this line has both labels $i \, j$ in its support, so ${ i \, j }$ is an edge. ◻
]

We will count regular preimages of maps which need not be smooth everywhere. The following local form of the degree formula explains why this causes no problem.

#thm([Lemma 4.2.])[
  (Local counting).  #emph[Let $M$ be a closed smooth $n$-manifold, possibly disconnected, and let $q : M arrow.r Y$ be continuous, with $Y$ Hausdorff. Suppose a point $y in Y$ has a neighborhood homeomorphic to an open subset of $bb(R)^n$, and that $q$ is smooth in the corresponding coordinates near $q^(- 1) \( y \)$, with invertible derivative at each point of that fiber. Then the fiber is finite, and the image of the total fundamental class of $M$ in 
$ H_n \( Y \, Y \\ { y } \) tilde.equiv bb(F)_2 $

 is $\| q^(- 1) \( y \) \|$ modulo two. In particular, if $Y$ is a connected closed $n$-manifold, this parity is the mod-two degree of $q$.]
] <lem:local-degree>

#proof[
  The inverse function theorem makes every point of the fiber isolated. The fiber is closed in compact $M$, hence finite. By excision,
  $ H_n \( M \, M \\ q^(- 1) \( y \) \) tilde.equiv xor.big_(x in q^(- 1) \( y \)) H_n \( M \, M \\ { x } \) . $
  The fundamental class has coordinate one in each summand. A local diffeomorphism sends each local generator to the generator at $y$. Naturality of relative homology now gives the assertion. This argument uses no smoothness away from the selected fiber. ◻
]

#thm([Theorem 4.3.])[
  (Supports at equality).  #emph[Let $k gt.eq 3$ and $m = N_k$. Suppose $f : bb(P) \( bb(R)^k \) arrow.r Delta^(m - 1)$ is a smooth admissible map. Its support complex $K$ has every pair of labels as an edge, every facet has $k$ vertices, and 
$ sum_(I upright(" a facet of ") K) I $

 is a simplicial cycle over $bb(F)_2$. Consequently every $\( k - 2 \)$-dimensional face lies in a positive even number of facets.]
] <thm:equality-complex>

#proof[
  The edge assertion is Proposition 8. We prove the remaining assertions by examining an arbitrary facet $I$. Set
  $ s = \| I \| \, #h(2em) J = { 1 \, dots.h \, m } \\ I \, #h(2em) a = \| J \| \, #h(2em) h = N_(k - 1) . $
  Since $I$ is a maximal support face, there is a line $x_0$ with $S \( x_0 \) = I$. Every line in $x_0^perp$ uses only labels in $J$. Proposition 8, applied in $x_0^perp$, gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ a gt.eq h \, #h(2em) s = m - a lt.eq N_k - N_(k - 1) = k . $ <eq:facet-size-upper>]
  ===== 4.1 A compact level set over one affine chart. <a-compact-level-set-over-one-affine-chart.>
  Define
  $ U_I = { x in bb(P) \( V \) : f_i \( x \) > 0 upright(" for every ") i in I } . $
  Maximality of $I$ implies $S \( x \) = I$ for all $x in U_I$. Thus the coordinate map $f_I$ takes $U_I$ smoothly to the open simplex $circle(Delta)_I$ on $I$. Moreover, $U_I$ lies in the affine projective chart
  $ bb(P) \( V \) \\ bb(P) \( x_0^perp \) \, $
  because a line orthogonal to $x_0$ cannot use any label in $I$. Choose a regular value $r in circle(Delta)_I$ of $f_I$, using Sard’s Theorem #cite(label("Lee2013")) Theorem 6.10, and put
  $ L = f_I^(- 1) \( r \) subset U_I . $
  For now $L$ is allowed to be empty. If $tilde(r)$ denotes $r$ extended by zero on $J$, then $L = f^(- 1) \( tilde(r) \)$: positivity of the coordinates of $r$ puts every such preimage in $U_I$. Hence $L$ is compact. It is a smooth manifold without boundary #cite(label("Lee2013")) Corollary 5.14 of dimension
  #[#set math.equation(numbering: n => "(4.2)")
   $ dim L = \( k - 1 \) - \( s - 1 \) = k - s = a - h . $ <eq:level-dimension>]
  If $s < k$, the level-set dimension in (4.2) is positive. We will construct a map on a sphere bundle over $L$ whose regular preimages have odd cardinality, by comparison with $F$. The affine-chart trivialization will force the induced map on the projective bundle to have degree zero when $dim L > 0$, contradicting that count. When $s = k$, the same count will determine the coefficient of $I$ in the desired cycle.
  For $x in U_I$, admissibility ensures that $f$ on $bb(P) \( x^perp \)$ uses only labels in $J$. Apply the extension construction in this $\( k - 1 \)$-dimensional space to obtain an odd map
  $ G_x : Sigma \( x^perp \) arrow.r Sigma_a . $
  The subspace-restriction and continuity properties of the extension make these maps a continuous map on the corresponding sphere bundle. Restrict that bundle to $L$ and write
  $ M = { \( x \, B \) : x in L \, med B in "Sym" \( x^perp \) \, med "tr" \| B \| = 1 } \, #h(2em) G \( x \, B \) = G_x \( B \) . $
  The bundle $x mapsto x^perp$ is trivial on the affine chart above. Indeed, choose the unit representative $u$ of $x$ having positive inner product with a fixed unit representative of $x_0$. Orthogonal projection from $x_0^perp$ onto $u^perp$ is invertible and varies smoothly with $x$; orthonormalizing its images of a fixed basis gives a smooth orthonormal trivialization. The induced trivialization of symmetric operators, followed by radial change from trace norm to a Euclidean norm, gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ M tilde.equiv L times S^(h - 1) \, #h(2em) \( x \, B \) mapsto \( x \, - B \) quad arrow.l.r quad \( x \, z \) mapsto \( x \, - z \) . $ <eq:product-sphere-bundle>]
  Equip $M$ with the smooth structure given by the Euclidean sphere bundle. The trace-norm parametrization is smooth near every definite $B$, which is all that will be needed. In particular,
  #[#set math.equation(numbering: n => "(4.4)")
   $ dim M = \( a - h \) + \( h - 1 \) = a - 1 . $ <eq:bundle-dimension>]
  ===== 4.2 Odd parity on the bundle. <odd-parity-on-the-bundle.>
  Consider the open negative orthant of $Sigma_a$, where all $J$ coordinates are strictly negative. At a preimage of this orthant, $B$ has no positive spectral subspace. It has no kernel either: the exact support property says that all $J$ labels occur on its range, leaving no label for a kernel line. Thus $B$ is negative definite on $x^perp$. Consequently $G$ is smooth on the preimage of the negative orthant. Sard’s Theorem allows us to choose a regular value $g$ in that orthant. Its preimage is finite by compactness, including the possibility of an empty preimage.
  Fix $0 < lambda < 1$ and form the full-support vector
  $ y = \( lambda r \, \( 1 - lambda \) g \) in Sigma_m \, $
  with the two coordinate blocks indexed by $I$ and $J$. We claim that $F^(- 1) \( y \)$ corresponds exactly to $G^(- 1) \( g \)$. Every $A in F^(- 1) \( y \)$ is nonsingular by the full-support property. All lines in its nonzero positive spectral subspace use only labels in $I$. That subspace must be one-dimensional: a subspace of dimension at least two intersects the hyperplane $x_0^perp$, where no label in $I$ is available. Call the resulting positive line $x$. The positive output block has every $I$ coordinate nonzero, so $S \( x \) = I$ and $x in U_I$. Since the sum of the positive coordinates of $F \( A \)$ is $lambda$, the positive eigenvalue is $lambda$. Therefore
  #[#set math.equation(numbering: n => "(4.5)")
   $ A = lambda P_x + \( 1 - lambda \) B \, #h(2em) B < 0 upright(" on ") x^perp \, quad "tr" \| B \| = 1 . $ <eq:preimage-splitting>]
  The subspace formula for the extension now gives $f_I \( x \) = r$ and $G_x \( B \) = g$. Conversely, every $\( x \, B \) in G^(- 1) \( g \)$ gives a preimage by (4.5).
  The value $y$ is regular in the local sense of Lemma 9. To see this precisely, near a preimage use $\( lambda' \, x' \, B' \)$ as coordinates for symmetric operators of signature $\( 1 \, k - 1 \)$, with $B'$ negative definite and normalized on $x' ""^perp$. The single positive eigenvalue and its line vary smoothly, so these are smooth coordinates on the trace-norm sphere near that preimage. In the target orthant, use the positive mass followed by the two normalized coordinate blocks. In these coordinates $F$ is
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( lambda' \, x' \, B' \) mapsto \( lambda' \, f_I \( x' \) \, G_(x') \( B' \) \) . $ <eq:triangular-derivative>]
  The first derivative block is the identity. The second is surjective because $r$ is regular for $f_I$. On the kernel of these two blocks, the third block is the derivative of $G \|_M$, which is surjective because $g$ is regular. Thus the full derivative is surjective, and is an isomorphism since source and target both have dimension $m - 1$. By the odd degree of $F$ and Lemma 9,
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| G^(- 1) \( g \) \| = \| F^(- 1) \( y \) \| equiv 1 med \( mod med 2 \) . $ <eq:bundle-odd-count>]
  This proves, in particular, that $L$ is nonempty.
  ===== 4.3 The double cover forces maximal supports to have size $k$. <the-double-cover-forces-maximal-supports-to-have-size-k.>
  The oddness of $G$ in the sphere variable gives a quotient map
  $ overline(G) : L times bb(R P)^(h - 1) arrow.r bb(R P)^(a - 1) . $
  Write $w in H^1 \( bb(R P)^(a - 1) \)$ and $u in H^1 \( bb(R P)^(h - 1) \)$ for the first Stiefel–Whitney classes of the real line bundles associated with their antipodal double covers. Equivariance identifies the pullback of the target sphere cover with
  $ L times S^(h - 1) arrow.r L times bb(R P)^(h - 1) . $
  Indeed, the identification sends $\( x \, z \)$ to $\( \( x \, \[ z \] \) \, G \( x \, z \) \)$ and is an isomorphism on each two-point fiber. This cover isomorphism induces an isomorphism of the associated real line bundles. Their first Stiefel–Whitney classes are natural under pullback #cite(label("HatcherVB2017")) Theorem 3.1(a). The source cover is pulled back from the second factor, so
  #[#set math.equation(numbering: n => "(4.8)")
   $ overline(G)^(*) w = "pr"_2^(*) u . $ <eq:cover-class>]
  There is no contribution from $H^1 \( L \)$ in this identity.
  Suppose $a > h$. The projective-space cohomology calculation #cite(label("Hatcher2002")) Theorem 3.19 gives
  $ u^h = 0 \, #h(2em) overline(G)^(*) \( w^(a - 1) \) = "pr"_2^(*) \( u^(a - 1) \) = 0 . $
  Both source and target of $overline(G)$ are closed manifolds of dimension $a - 1$, and $w^(a - 1)$ is the target’s top cohomology generator. Evaluation on the total fundamental class therefore gives mod-two degree zero. On the other hand, $\[ g \]$ is a regular value in local quotient coordinates, and every preimage of $\[ g \]$ has exactly one representative mapping to $g$. Its preimage count is therefore the odd number in (4.7), a contradiction. Together with (4.1), this proves $a = h$ and $s = k$ for every facet.
  ===== 4.4 The coefficients of the facet cycle. <the-coefficients-of-the-facet-cycle.>
  Now $dim L = 0$, so $L$ is a finite set. For each $x in L$, the map $G_x$ is odd between spheres of the same dimension $h - 1$. Regularity of $g$ for $G$ implies its regularity for each such fiber map. Each fiber therefore contributes an odd number to (4.7), and hence
  #[#set math.equation(numbering: n => "(4.9)")
   $ \| f^(- 1) \( tilde(r) \) \| = \| L \| equiv 1 med \( mod med 2 \) . $ <eq:facet-odd-count>]
  Every facet has $k$ vertices, so $K$ has dimension $k - 1$. Using the identification of simplicial and singular homology #cite(label("Hatcher2002")) Theorem 2.27, consider the homology class
  $ f_(*) \[ bb(P) \( V \) \] in H_(k - 1) \( \| K \| \) . $
  The interior point $tilde(r)$ of the facet $I$ has a neighborhood in $\| K \|$ contained in that facet. Passing to $H_(k - 1) \( \| K \| \, \| K \| \\ { tilde(r) } \)$ reads the coefficient of $I$ in a simplicial top cycle. By the regularity of $r$, Lemma 9 and (4.9), this coefficient is one. The same holds for every facet. Since a $\( k - 1 \)$-dimensional complex has no simplicial $k$-chains, its top homology classes are exactly its top cycles. Thus $f_(*) \[ bb(P) \( V \) \]$ is represented by the sum of all facets. Its boundary vanishes. Each codimension-one face consequently occurs in an even number of facets, and purity makes that number positive. ◻
]

== 5 Triangle systems on six labels <sec:six-labels>

We now extract the finite combinatorial consequences of the equality case. We call a face with three vertices a #emph[triangle], and a face with four vertices a #emph[tetrahedron]. These names refer to faces of the support complex, not to geometric simplices in projective space. Our eventual application is to the six labels complementary to a tetrahedral facet of the ten-label support complex.

#prodef([Definition 5.1.])[
  A #emph[six-label triangle system] on a set $C$ of cardinality six is a collection $cal(T) subset.eq binom(C, 3)$ such that
  + exactly one of $T$ and $C \\ T$ belongs to $cal(T)$ for each $T in binom(C, 3)$;
  + every pair of elements of $C$ belongs to exactly two members of $cal(T)$.
] <def:six-system>

#thm([Lemma 5.2.])[
  #emph[The triangles of the support complex of an admissible map $f : bb(R P)^2 arrow.r Delta^5$ form a six-label triangle system.]
] <lem:six-from-map>

#proof[
  By Theorem 10, the complex is pure of dimension two, has all fifteen edges, and each edge belongs to a positive even number of triangles. Two complementary triples cannot both be triangles: choose witness lines $x \, y subset bb(R)^3$ whose supports contain the respective triples. A line perpendicular to both exists and, by admissibility, could use none of the six labels.
  There are ten complementary pairs of triples, so there are at most ten triangles. Counting incidences between triangles and edges gives at least $2 dot.op 15 \/ 3 = 10$ triangles. Equality holds throughout: there is one triangle in each complementary pair, and every edge occurs twice. ◻
]

For a triangle system $cal(T)$ on $C$ and $a in C$, its #emph[link graph at $a$] has vertex set $C \\ { a }$ and an edge ${ u \, v }$ precisely when ${ a \, u \, v } in cal(T)$.

#thm([Lemma 5.3.])[
  #emph[Let $cal(T)$ be a six-label triangle system on $C$.]
  + #emph[Every vertex link is a cycle of length five.]
  + #emph[Every four-element subset of $C$ contains a triangle, but does not contain all four of its triples as triangles.]
  + #emph[If $a \, b in C$ are distinct and $R subset C \\ { a \, b }$ has cardinality three, the link graphs at $a$ and $b$, restricted to $R$, are different. In particular, no transposition of two labels preserves $cal(T)$.]
  + #emph[The triangles contained in any five-element subset of $C$ determine $cal(T)$ uniquely.]
] <lem:six-properties>

#proof[
  Every vertex of the link at $a$ has degree two, since the corresponding pair with $a$ lies in exactly two triangles. A simple graph in which every vertex has degree two is a disjoint union of cycles of length at least three. On five vertices it must therefore be a single five-cycle.
  Let $A subset C$ have four elements and choose $a in A$. A five-cycle has no independent set of size three: if three vertices were independent, the three gaps following them around the cycle would each contain another vertex, requiring at least six vertices. Thus the other three elements of $A$ contain an edge of the link at $a$, giving a triangle in $A$. If all four triples in $A$ were triangles, the link at $a$ would contain the three-cycle on $A \\ { a }$, which a five-cycle cannot contain.
  For the third assertion, write $C = { a \, b \, c \, d \, e \, f }$, where the two triangles containing ${ a \, b }$ are ${ a \, b \, c }$ and ${ a \, b \, d }$. Deleting $b$ from the five-cycle at $a$ leaves a path on ${ c \, d \, e \, f }$ with endpoints $c \, d$. Its middle edge is ${ e \, f }$, so its other two edges are one of the matchings
  $ M_1 = { { c \, e } \, { d \, f } #scale(x: 120%, y: 120%)[}] \, #h(2em) M_2 = { { c \, f } \, { d \, e } #scale(x: 120%, y: 120%)[}] . $
  Deleting $a$ from the link at $b$ gives a path with the same endpoints and middle edge. The two paths must use opposite matchings, as in Figure 1. For example, if the first uses $M_1$, the triangles ${ a \, c \, e }$ and ${ a \, d \, f }$ exclude their complementary triples ${ b \, d \, f }$ and ${ b \, c \, e }$, forcing the second path to use $M_2$.
  The symmetric difference of the two paths is the four-cycle with edges $M_1 union M_2$. Every three of its four vertices retain an edge, so the restrictions of the paths to any such triple differ. A transposition $\( a med b \)$ preserving the triangle system would make the two restricted link graphs identical, which is impossible.
  Finally, if $z$ is the omitted vertex of a five-element subset, every triple containing $z$ has its complementary triple in that subset. The complementary-triple rule therefore recovers its membership in $cal(T)$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.7, 2.2), [#text(size: 9pt)[\(a\) A complementary pair]])
  content((5.85, 2.2), [#text(size: 9pt)[\(b\) Link at $a$]])
  content((9.8, 2.2), [#text(size: 9pt)[\(c\) Link at $b$]])
  line((0, 0), (0.7, 1.25), (1.4, 0), close: true, stroke: (thickness: 0.7pt, miter-limit: 10))
  circle((0.7, 1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0.7, 1.285), [$a$], anchor: "south")
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, -0.03528), [$c$], anchor: "north")
  circle((1.4, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.4, -0.03528), [$e$], anchor: "north")
  line((2, 0), (2.7, 1.25), (3.4, 0), close: true, stroke: (paint: rgb("#737373"), thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  circle((2.7, 1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((2.7, 1.285), [$b$], anchor: "south")
  circle((2, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((2, -0.03528), [$d$], anchor: "north")
  circle((3.4, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.4, -0.03528), [$f$], anchor: "north")
  content((0.7, -0.7), [#text(size: 9pt)[present]])
  content((2.7, -0.7), [#text(size: 9pt)[absent]])
  line((5, 0), (6.7, 0), stroke: (thickness: 0.7pt, miter-limit: 10))
  line((5, 1.25), (5, 0), (6.7, 0), (6.7, 1.25), stroke: (paint: rgb("#00008c"), thickness: 1.0pt, miter-limit: 10))
  circle((5, 1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5, 1.285), [$c$], anchor: "south")
  circle((6.7, 1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6.7, 1.285), [$d$], anchor: "south")
  circle((5, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5, -0.03528), [$e$], anchor: "north")
  circle((6.7, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6.7, -0.03528), [$f$], anchor: "north")
  content((5.85, -0.7), [#text(size: 9pt)[$c-e-f-d$]])
  line((8.95, 0), (10.65, 0), stroke: (thickness: 0.7pt, miter-limit: 10))
  line((8.95, 1.25), (10.65, 0), (8.95, 0), (10.65, 1.25), stroke: (paint: rgb("#00008c"), thickness: 1.0pt, miter-limit: 10))
  circle((8.95, 1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((8.95, 1.285), [$c$], anchor: "south")
  circle((10.65, 1.25), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((10.65, 1.285), [$d$], anchor: "south")
  circle((8.95, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((8.95, -0.03528), [$e$], anchor: "north")
  circle((10.65, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((10.65, -0.03528), [$f$], anchor: "north")
  content((9.8, -0.7), [#text(size: 9pt)[$c-f-e-d$]])
})],
  caption: [Figure 1: The complementary-triple rule forces opposite matchings. Suppose the two triangles through ${ a \, b }$ are ${ a \, b \, c }$ and ${ a \, b \, d }$. The links at $a$ and $b$, restricted to ${ c \, d \, e \, f }$, share the edge ${ e \, f }$ and use opposite matchings between ${ c \, d }$ and ${ e \, f }$ (shown in blue). One of the two possible choices is drawn. The crossing in (c) is not a vertex. Panel (a) shows one complementary pair for this choice. ],
) <fig:six-label-paths>

== 6 The obstruction on ten labels <sec:ten-labels>

We prove that an admissible map $bb(R P)^3 arrow.r Delta^9$ cannot exist. Its support complex would have tetrahedral facets. Each facet forces a six-label triangle system on its complement; transporting these systems between adjacent facets will constrain the whole complex.

#thm([Lemma 6.1.])[
  #emph[Suppose $f : bb(R P)^3 arrow.r Delta^9$ is admissible, let $K$ be its support complex, and let $S$ be a tetrahedron of $K$. The triangles of $K$ contained in the six-element set $C = \[ 10 \] \\ S$ form a six-label triangle system. In particular, two tetrahedra of $K$ cannot be disjoint.]
] <lem:facet-complement>

#proof[
  Theorem 10 says that $K$ is pure of dimension three. A witness line $x$ for the facet $S$ has support exactly $S$. The restriction of $f$ to $bb(P) \( x^perp \) tilde.equiv bb(R P)^2$ uses only labels in $C$. It uses all six: otherwise the lower bound in Proposition 8, applied in dimension three, would be violated. By Lemma 12, this restriction supplies a six-label triangle system contained among the triangles of $K$ on $C$.
  There are no additional triangles on $C$. Otherwise some complementary triples $T \, C \\ T$ would both be triangles of $K$. Take witness lines for $S \, T \, C \\ T$. In $bb(R)^4$ there is a line perpendicular to all three; their supports together contain all ten labels, leaving that line no admissible label.
  If a tetrahedron $S'$ were disjoint from $S$, its four triples would all be triangles on $C$. This contradicts Lemma 13(2). ◻
]

The rest of the proof is purely combinatorial. We retain the notation $K$ and write $cal(T)_C$ for the triangle system on a facet complement $C$. By Theorem 10, each triangle of $K$ lies in a positive even number of tetrahedra.

#thm([Lemma 6.2.])[
  #emph[Every triangle of $K$ belongs to exactly two tetrahedra.]
] <lem:two-tetrahedra>

#proof[
  First observe that if two tetrahedra differ by exchanging labels $a \, b$, the same exchange carries their complementary triangle systems to one another. Their complements share five labels, on which both systems are the triangles of $K$. After the exchange these triangles remain fixed, so the systems agree everywhere by Lemma 13(4).
  Suppose three tetrahedra $T union { a }$, $T union { b }$, $T union { c }$ contain the same triangle $T$. Put $R = \[ 10 \] \\ \( T union { a \, b \, c } \)$, which has four elements. Transporting the complementary systems successively by
  $ R union { b \, c } arrow.r^(\( a med b \)) R union { a \, c } arrow.r^(\( b med c \)) R union { a \, b } arrow.r^(\( c med a \)) R union { b \, c } $
  preserves the initial system. The composite fixes $R$ and exchanges $b$ and $c$, contradicting Lemma 13(3). Thus at most two tetrahedra contain any triangle. Positive even multiplicity gives exactly two. ◻
]

For an edge $D$ of $K$, define its #emph[link graph] to have as vertices the labels $v in.not D$ for which $D union { v }$ is a triangle, and as edges the pairs ${ v \, w }$ for which $D union { v \, w }$ is a tetrahedron.

#thm([Lemma 6.3.])[
  #emph[Every connected component of an edge link is a cycle of length three or four.]
] <lem:short-links>

#proof[
  Every vertex of an edge link has degree two by Lemma 15, so each component is a simple cycle. We show that the link contains no path on five distinct vertices.
  Suppose such a path has consecutive vertices $v_0 \, v_1 \, v_2 \, v_3 \, v_4$. Let $R$ be the three labels outside $D union { v_0 \, v_1 \, v_2 \, v_3 \, v_4 }$. The four successive edges give tetrahedra $D union { v_i \, v_(i + 1) }$, whose complementary systems are transported by
  $ R union { v_2 \, v_3 \, v_4 } & arrow.r^(\( v_0 med v_2 \)) R union { v_0 \, v_3 \, v_4 } arrow.r^(\( v_1 med v_3 \)) R union { v_0 \, v_1 \, v_4 }\
 & arrow.r^(\( v_2 med v_4 \)) R union { v_0 \, v_1 \, v_2 } . $
  The composite fixes $R$ and sends $v_4$ to $v_2$. Hence for every pair ${ r \, s } subset R$, the first system contains ${ v_4 \, r \, s }$ if and only if the last contains ${ v_2 \, r \, s }$. The latter triple belongs to both complementary sets, so its membership in either system is simply its membership in $K$. The first system therefore has identical link graphs at $v_4$ and $v_2$ when restricted to $R$. This contradicts Lemma 13(3). Every cycle of length at least five contains such a path, proving the assertion. ◻
]

The short links let us describe every facet obtained by repeatedly crossing a triangular face of one fixed tetrahedron. The description will produce enough facets to contradict the complementary triangle system.

#thm([Lemma 6.4.])[
  #emph[Fix a tetrahedron $S$ of $K$. For $v in S$, let $p \( v \)$ be the unique label outside $S$ such that $\( S \\ { v } \) union { p \( v \) }$ is a tetrahedron. For each distinct value $y$ of $p$, set 
$ B_y = p^(- 1) \( y \) union { y } . $

 The sets $B_y$ are disjoint and have at least two elements. For every choice $q_y in B_y$, the set 
$ union.big_(y in p \( S \)) \( B_y \\ { q_y } \) $

 is a tetrahedron. Moreover, every tetrahedron of $K$ contains at least two elements of one of these blocks.]
] <lem:partner-blocks>

#proof[
  The partner $p \( v \)$ exists and is unique by Lemma 15, applied to $S \\ { v }$. It lies outside $S$, since the only tetrahedron on the vertices of $S$ is $S$ itself. The stated disjointness and lower size bound are immediate.
  We first prove that replacing $v$ by $a = p \( v \)$ leaves the collection of blocks unchanged. Put $S' = \( S \\ { v } \) union { a }$ and let $p'$ be its partner map. We have $p' \( a \) = v$. For $w in S \\ { v }$, put $D = S \\ { v \, w }$ and $b = p \( w \)$. The link of $D$ contains the edges
  $ { v \, w } \, #h(2em) { w \, a } \, #h(2em) { v \, b } . $
  If $a = b$, these form a three-cycle. Since every link vertex has degree two, that cycle is a whole component, and the other tetrahedron on $D union { a }$ is $D union { a \, v }$. Thus $p' \( w \) = v$. If $a eq.not b$, the displayed edges form the path $a \, w \, v \, b$ on four distinct vertices. Lemma 16 forces it to complete to a four-cycle, with the edge ${ a \, b }$. Thus $p' \( w \) = b = p \( w \)$. The two cases are illustrated in Figure 2. We have proved
  $ p' \( a \) = v \, #h(2em) p' \( w \) = cases(delim: "{", v \, & p \( w \) = a \,, p \( w \) \, & p \( w \) eq.not a .) $
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.25, 2.6), [#text(size: 9pt)[\(a\) $a=b$]])
  content((7.25, 2.6), [#text(size: 9pt)[\(b\) $a != b$]])
  line((0, 0), (2.5, 0), (1.25, 1.65), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, -0.03528), [$v$], anchor: "north")
  circle((2.5, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((2.5, -0.03528), [$w$], anchor: "north")
  circle((1.25, 1.65), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((1.25, 1.685), [$a=b$], anchor: "south")
  content((1.25, -0.8), [#text(size: 9pt)[$p'(w)=v$]])
  line((6, 1.65), (6, 0), (8.5, 0), (8.5, 1.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((8.5, 1.65), (6, 1.65), stroke: (paint: rgb("#00008c"), thickness: 1.0pt, miter-limit: 10, dash: "densely-dashed"))
  circle((6, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6, -0.03528), [$v$], anchor: "north")
  circle((8.5, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((8.5, -0.03528), [$w$], anchor: "north")
  circle((6, 1.65), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((6, 1.685), [$b$], anchor: "south")
  circle((8.5, 1.65), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((8.5, 1.685), [$a$], anchor: "south")
  content((7.25, -0.8), [#text(size: 9pt)[$p'(w)=b$]])
})],
    caption: [Figure 2: The two partner updates in the link of $D = S \\ { v \, w }$. Put $a = p \( v \)$ and $b = p \( w \)$, and replace $v$ by $a$ in the tetrahedron $S$. The new partner map is $p'$. The known edges ${ v \, w }$, ${ w \, a }$ and ${ v \, b }$ form a triangle when $a = b$. When $a eq.not b$, they form a path on four vertices; the short-link condition forces the closing edge ${ a \, b }$ (dashed). In both cases $p' \( a \) = v$, and the blocks retain their elements. ],
  ) <fig:partner-links>
  The block formerly indexed by $a$ is now indexed by $v$ and has the same elements; all other blocks are unchanged.
  The tetrahedron $S$ contains all elements of each block except its indexing partner. The same is true after any such exchange, by block invariance. To change the omitted element of a block from $q$ to $u$, replace the present element $u$ by its partner $q$. Doing this once in each block where a change is wanted realizes every possible choice of omissions. These sets have cardinality four, since $sum_y \( \| B_y \| - 1 \) = \| S \| = 4$.
  Finally, suppose a tetrahedron $T$ met each block in at most one element. In each block omit that element if present, and otherwise omit any element. The resulting tetrahedron lies in the union of the blocks and is disjoint from $T$, contrary to Lemma 14. ◻
]

#thm([Theorem 6.5.])[
  #emph[There is no admissible map $bb(R P)^3 arrow.r Delta^9$.]
] <thm:no-ten-labels>

#proof[
  Assume such a map exists and fix a tetrahedron $S$ of its support complex. Let $t$ be the number of blocks in Lemma 17, and let $R$ be the set of labels outside their union. The blocks contain $4 + t$ labels in total, so
  $ 1 lt.eq t lt.eq 4 \, #h(2em) \| R \| = 6 - t . $
  If $t = 4$, each block has size two and $S$ meets each in just one element, contradicting the last assertion of Lemma 17. Thus $t lt.eq 3$.
  There is no triangle entirely in $R$. By purity, such a triangle would extend to a tetrahedron; its one remaining vertex could not supply two vertices in a block. On the other hand, $R$ is contained in $\[ 10 \] \\ S$, where every four labels contain a triangle by Lemmas 14 and 13(2). Consequently $\| R \| lt.eq 3$, and therefore $t gt.eq 3$.
  It follows that $t = 3$, $\| R \| = 3$, and the block sizes are $3 \, 2 \, 2$, as in Figure 3.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0.35), (3, 1.8), stroke: (thickness: 0.6pt, miter-limit: 10), radius: 3pt)
  rect((3.55, 0.35), (5.55, 1.8), stroke: (thickness: 0.6pt, miter-limit: 10), radius: 3pt)
  rect((6.1, 0.35), (8.1, 1.8), stroke: (thickness: 0.6pt, miter-limit: 10), radius: 3pt)
  rect((8.8, 0.35), (11.8, 1.8), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "densely-dashed"), radius: 3pt)
  content((1.5, 2.15), [#text(size: 9pt)[$B_1$]])
  content((4.55, 2.15), [#text(size: 9pt)[$B_2$]])
  content((7.1, 2.15), [#text(size: 9pt)[$B_3$]])
  content((10.3, 2.15), [#text(size: 9pt)[$R$]])
  circle((0.5, 1.15), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((0.5, 1.115), [$u_1$], anchor: "north")
  circle((1.5, 1.15), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((1.5, 1.115), [$u_2$], anchor: "north")
  circle((2.5, 1.15), radius: 0.07982, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  content((2.5, 1.115), [$q_1$], anchor: "north")
  circle((4.05, 1.15), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((4.05, 1.115), [$v$], anchor: "north")
  circle((5.05, 1.15), radius: 0.07982, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  content((5.05, 1.115), [$q_2$], anchor: "north")
  circle((6.6, 1.15), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((6.6, 1.115), [$w$], anchor: "north")
  circle((7.6, 1.15), radius: 0.07982, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  content((7.6, 1.115), [$q_3$], anchor: "north")
  circle((9.3, 1.15), radius: 0.07982, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  content((9.3, 1.115), [$r$], anchor: "north")
  circle((10.3, 1.15), radius: 0.07982, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  content((10.3, 1.115), [$s$], anchor: "north")
  circle((11.3, 1.15), radius: 0.07982, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  content((11.3, 1.115), [$r_3$], anchor: "north")
  content((5.9, -0.2), [#text(size: 9pt)[$S=\{u_1,u_2,v,w\}, [10] without S=\{q_1,q_2,q_3,r,s,r_3\}$]])
  content((5.9, -1), [#text(size: 9pt)[$\{r,s,q_2\} subset.eq T arrow.r.double.long T=\{r,s,q_2,v\}$]])
})],
    caption: [Figure 3: The only remaining block sizes are $3 \, 2 \, 2$, with three labels in $R$ outside the blocks. Filled dots are the vertices of the fixed tetrahedron $S$; the omitted block elements are $q_1 \, q_2 \, q_3$. Every tetrahedron must contain two vertices of one block. After relabeling the two-element blocks, the final argument selects a triangle ${ r \, s \, q_2 }$ with $r \, s in R$. Its only possible tetrahedral extension is obtained by adjoining $v$, contradicting the two required extensions. ],
  ) <fig:partner-blocks>
  The complement of $S$ consists of $R$ and one omitted element from each block. Choose two distinct labels $r \, s in R$. In the triangle system on this complement, ${ r \, s }$ belongs to two distinct triangles. Their third vertices cannot be in $R$, because $R$ contains no triangle. They are therefore two distinct omitted block elements. Only one block has size three, so at least one of these triangles is ${ r \, s \, z }$ with $z$ in a block $B$ of size two.
  Every tetrahedron containing ${ r \, s \, z }$ must contain two vertices of some block. As $r \, s$ lie outside all blocks, its fourth vertex must be the other element of $B$. Thus this triangle belongs to at most one tetrahedron, contradicting Lemma 15. ◻
]

== 7 The diameter obstruction <sec:conclusion>

All ingredients now apply to the projector set in Theorem 1.

#proof[
  Lemma 2, with $k = 4$, proves compactness and identifies the trace-one affine space with Euclidean $bb(R)^9$. It also gives the exact diameter $sqrt(2)$. If ten subsets of strictly smaller diameter covered $X$, Lemma 5 would supply an admissible map $bb(R P)^3 arrow.r Delta^9$. This contradicts Theorem 18. ◻
]

The spherical geometry of this witness also gives counterexamples in all higher dimensions. We use the familiar construction of adjoining points at diameter distance; see #cite(label("HinrichsRichter2003")) Lemma 9 and #cite(label("Bondarenko2014")) proof of Corollary 1. The following Gram-matrix description adds all the new points at once.

#thm([Corollary 7.1.])[
  #emph[For every integer $d gt.eq 9$, there is a compact subset of $bb(R)^d$ of diameter $sqrt(2)$ that cannot be covered by $d + 1$ subsets of strictly smaller diameter.]
] <cor:higher-dimensions>

#proof[
  The case $d = 9$ is Theorem 1. For $d = 9 + s$ with $s gt.eq 1$, translate its projector set to
  $ Y = { P_x - 1 / 4 I : x in bb(R P)^3 } $
  in the nine-dimensional space of trace-zero symmetric matrices. Every $y in Y$ has $parallel y parallel_F^2 = 3 \/ 4$. In an orthogonal copy of $bb(R)^s$, choose vectors $v_1 \, dots.h \, v_s$ with Gram matrix
  $ \( chevron.l v_i \, v_j chevron.r \)_(i \, j = 1)^s = I_s + 1 / 4 upright(bold(1)) upright(bold(1))^(sans(T)) \, #h(2em) upright(bold(1)) = \( 1 \, dots.h \, 1 \)^(sans(T)) . $
  Such vectors exist because the displayed matrix is positive definite. They satisfy $parallel v_i parallel^2 = 5 \/ 4$ and $parallel v_i - v_j parallel^2 = 2$ for $i eq.not j$. Therefore the compact set
  $ Z = \( Y times { 0 } \) union { \( 0 \, v_i \) : 1 lt.eq i lt.eq s } subset bb(R)^9 xor bb(R)^s $
  has diameter $sqrt(2)$: each new point is at that distance from every point of $Y times { 0 }$ and from every other new point.
  A subset of $Z$ of strictly smaller diameter containing a new point can contain neither a second new point nor a point of $Y times { 0 }$. Thus a cover of $Z$ by at most $d + 1 = 10 + s$ such subsets would leave at most ten subsets to cover $Y times { 0 }$. This contradicts Theorem 1, since translation preserves diameter and the number of covering sets. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
