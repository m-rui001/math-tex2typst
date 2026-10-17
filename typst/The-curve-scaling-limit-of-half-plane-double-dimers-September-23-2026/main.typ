#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 76.5pt, y: 76.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Curve Scaling Limit \
of Half-Plane Double Dimers]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Superposing two independent dimer coverings produces loops whose large-scale geometry is expected to be conformally invariant. For the square lattice, the predicted limit is the conformal loop ensemble with parameter $4$. The distinction between geometric and topological convergence is important here: knowing which punctures a loop surrounds does not control thin excursions, invisible retraced pieces, or repeated traversal of a limiting trace. We prove the curve convergence for the standard Temperleyan law in the upper half-plane, retaining every nested generation.

=== 1.1 The law and the topology <the-law-and-the-topology>

Write

$ bb(H) = { z in bb(C) : "Im" z > 0 } \, #h(2em) bb(H)_delta = bb(H) ∩ delta bb(Z)^2 . $

Edges join nearest neighbors. A dimer covering is a perfect matching. To specify its infinite-volume law, start with a simple lattice polygon in the coarse grid $\( 0 \, delta \) + 2 delta bb(Z)^2$, retain the fine-grid vertices and edges in its closure, and delete one coarse boundary vertex, called the root. Uniform matchings on these finite Temperleyan graphs converge locally as the polygons exhaust $bb(H)$ and their roots escape to infinity. We use this standard law, equivalently specified by the inverse Kasteleyn operator vanishing at infinity [4] Section 2. The coarse-grid translate puts the lower boundary on the bottom row of $bb(H)_delta$.

Take two independent matchings with this law. Almost surely their superposition consists of doubled edges and finite simple even cycles [4] opening of Section 2; see also [7] Section 5.4, Lemma 26. Delete the doubled edges and let $cal(L)_delta$ be the collection of all cycles, drawn with straight edges and regarded as unrooted, unoriented loops. Nested $upright("CLE")_4$ means an ordinary nonnested $upright("CLE")_4$, followed recursively by conditionally independent copies inside every loop. The normalization is the one in which the outermost ensemble comes from a Brownian loop soup of central charge $1$ [19].

Let $bb(D) = { w in bb(C) : \| w \| < 1 }$. We fix, throughout, the compactification

$ F : bb(H) arrow.r bb(D) \, #h(2em) F \( z \) = frac(z - i, z + i) . $

For continuous loops $gamma \, tilde(gamma) : S^1 arrow.r overline(bb(D))$, put

$ d_(upright("loop")) \( gamma \, tilde(gamma) \) = inf_phi.alt sup_(t in S^1) \| gamma \( t \) - tilde(gamma) \( phi.alt \( t \) \) \| \, $

where $phi.alt$ ranges over circle homeomorphisms of either orientation. We identify loops at zero distance; in particular a weakly monotone change of parameter, with pauses, does not change the loop. Collections omit constant loops and have finitely many members of diameter greater than any fixed positive number, with multiplicities retained. An $epsilon$-matching of two collections is a partial bijection covering every loop of diameter greater than $epsilon$ on either side, with matched loops at distance at most $epsilon$. The unmatched loops therefore all have diameter at most $epsilon$. Convergence means that such matchings exist with $epsilon arrow.b 0$. All diameters and loop distances in this definition are measured after applying $F$.

It is convenient to use a compatible metric $rho$ on collections. For a partial bijection, charge the distance of each matched pair and half the diameter of each unmatched loop; take the supremum of these charges, then the infimum over partial bijections. This defines $rho$, with the supremum of an empty family equal to zero. The triangle inequality follows by composing partial bijections: a loop whose partner becomes unmatched has half-diameter at most the sum of the two charges, since

$ \| "diam" gamma - "diam" tilde(gamma) \| lt.eq 2 d_(upright("loop")) \( gamma \, tilde(gamma) \) . $

Vanishing $rho$ identifies equal collections because there are only finitely many loops above each positive diameter. A matching of cost at most $epsilon$ leaves only loops of diameter at most $2 epsilon$ unmatched, so $rho$ induces exactly the topology specified above. We use the inherited topology on the subspace of collections whose loops are contained in the open disk. This is the target space for the theorem. The larger closed-disk space will be useful during the compactness proof, before boundary contact has been excluded.

#thm([Theorem 1.1.])[
  #emph[For the half-plane Temperleyan law specified above, the family $F \( cal(L)_delta \)$ is tight as $delta arrow.b 0$ in the loop-collection topology just defined, and 
$ F \( cal(L)_delta \) med arrow.r.double med F \( cal(L) \) \, #h(2em) delta arrow.b 0 \, $

 where $cal(L)$ is standard nested $upright("CLE")_4$ in $bb(H)$. The convergence holds along the full mesh limit and matches all macroscopic loops as curves.]
] <thm:main>

=== 1.2 History and the remaining geometric question <history-and-the-remaining-geometric-question>

Theorem 1 resolves the half-plane Temperleyan form of the double-dimer $upright("CLE")_4$ scaling-limit conjecture. Two strands of earlier work explain both its prediction and the remaining obstacle.

Exact dimer enumeration on the square lattice was developed by Kasteleyn [10] and Temperley and Fisher [20], using Pfaffian and determinant methods. Lieb [15] introduced the transfer-matrix approach. These finite algebraic descriptions provide the background for our rectangle calculation. At the continuum scale, Kenyon [11] proved convergence of appropriately normalized dimer-height fluctuations for suitable Temperleyan approximations of smooth Jordan domains to the Gaussian free field. That field limit motivates the connection with $upright("CLE")_4$, but does not by itself give convergence of loop curves: passing from a distribution-valued field to its interfaces requires additional control.

Further evidence for the interface prediction came from Kenyon and Wilson [14]. For alternating black and white boundary nodes in the half-plane, they showed that the limiting double-dimer pairing probabilities agree with those for the corresponding Gaussian-free-field contour lines. This identifies the boundary pairings, while leaving convergence of the paths open. Kenyon [12] used quaternionic weights to construct loop-homotopy observables with conformally invariant scaling limits. Dubédat [7] identified a class of these topological correlators with their nested $upright("CLE")_4$ counterparts through isomonodromic tau-functions. Basok and Chelkak [3] Corollary 1.7 recovered probabilities of cylindrical events from their lamination expansion, subject to a continuum lamination-tail estimate; Bai and Wan [2] Corollary 1.5 supplied that estimate for the nested ensemble. We use the precise half-plane formulation in Basok and Izyurov’s preprint [4] Theorem 4.2(2), Eq. (4.17). It retains all nested generations. Basok and Izyurov also prove local Gaussian fluctuations and convergence of the centered nesting field, which describe further aspects of the ensemble beyond a fixed puncture record.

The distinction needed here is between those puncture records and convergence in the curve topology. A long thin excursion may surround none of the selected points. Moreover, even equality of a limiting trace and winding number one allows a path to move backward along an arc before continuing forward. We must control both effects while retaining the number of loops and their nesting. The new estimates address these geometric questions directly.

=== 1.3 The geometric estimates and the proof <the-geometric-estimates-and-the-proof>

The new input consists of two geometric estimates in a corner-rooted Temperleyan rectangle. The first bounds the total number of disjoint traversals of a fixed-width slab, including multiple traversals by a single loop. It supplies both macroscopic loop counts and moduli of continuity after reparametrization. The second controls the signed crossing counts of arcs whose endpoints reach prescribed opposite sides of the slab; the sign records the direction of a crossing. On a shrinking transverse interval it excludes an arc’s nonzero count disagreeing with that of its whole loop, and simultaneous nonzero counts from arcs on distinct loops. After localization, this prevents cancellation of an excursion against a return path that finite-puncture data would fail to see.

Both estimates come from a transfer matrix counting dimer configurations column by column. A boundary state records which dimers cross the seam between columns. Complementing alternate occupancy bits turns such a state into a subset of transverse sites, called a particle state; the column transfer is an exterior power of a one-particle matrix. This uses Lieb’s transfer method [15], with sine modes and particle sectors corresponding to the open-boundary spectral analysis of Rasmussen and Ruelle [18] Section IV A. We derive the needed formulas in the convention appropriate to the deleted corner and prove the cap normalization explicitly, where a cap is the part of the rectangle on one side of a chosen seam. Changing particle number by a large amount gives a quadratic spectral penalty and hence traversal tightness. A two-particle insertion supported on a short interval moves two occupied sites from one matching’s state to the other’s. Its matrix coefficients are two-by-two minors of an interval projection. Modes spread across the transverse sites make these coefficients quadratic in the interval length. To turn that signed insertion into a probability bound, we prove a pointwise positivity identity, weighting nested loop portions cut off by transverse lines, so that contributions decrease geometrically down each nesting chain. This separation of a local operator estimate from a planar positivity argument is the main technical mechanism. The estimates are proved in Sections 2 and 3.

Wilson’s algorithm and the Temperley correspondence [21,17,13] transfer the estimates to bounded half-plane windows, uniformly in the mesh (Section 4). That section then proves compactness by constructing parametrizations directly from the fixed-slab estimates. The passage from crossing counts to controlled parametrizations follows the method of Aizenman and Burchard [1] Lemma 2.4 and Section 4.

Section 5 couples a subsequential path limit and its puncture records with a canonical nested $upright("CLE")_4$. It fixes each finite puncture grid before choosing a sufficiently small lattice mesh. On the resulting joint realization, a pathwise argument rules out invisible curves and identifies each visible trace. A second grid refinement then excludes backtracking along that trace. This last step recovers the traversal order that trace equality and winding number one leave undetermined.

=== 1.4 Established inputs <sec:inputs>

We state precisely the information imported from the literature. A lamination relative to a finite set of punctures records the homotopy classes of disjoint simple loops in the punctured domain, including their multiplicities. Delete every loop surrounding at most one puncture. The remaining record will be called the reduced lamination.

#thm([Theorem 1.2.])[
  (Cylindrical convergence [4] Theorem 4.2(2)).  #emph[Let $z_1 \, dots.h \, z_r$ be distinct interior points of $bb(H)$, and choose face punctures $z_j^delta arrow.r z_j$. For the two independent matchings used in Theorem 1, the reduced lamination relative to $\( z_j^delta \)_(j = 1)^r$ converges in law to the corresponding reduced lamination of nested $upright("CLE")_4$. In particular the multisets of enclosed puncture subsets, with multiplicities and with subsets of size at most one deleted, converge in law.]
] <thm:cylindrical>

The precise input is equation (4.17) of the cited theorem in the January 2, 2025 preprint version. It is uniform when the puncture tuples remain in a compact set away from collisions. We only need the weaker formulation above. For a fixed puncture set the lamination state space is countable. Convergence of its point probabilities to a probability law implies total variation convergence: first restrict to a finite set carrying nearly all limiting mass. Passing to enclosed subsets is then a measurable pushforward; we do not claim that subsets determine every homotopy class. Later refinements always fix a finite puncture configuration before taking the lattice mesh sufficiently small.

#thm([Proposition 1.3.])[
  (Standard properties of nested $upright("CLE")_4$).  #emph[After conformal transport to the disk, nested $upright("CLE")_4$ consists almost surely of pairwise disjoint simple loops contained in the open disk. There are finitely many loops of diameter greater than any positive number. Every fixed interior point is almost surely off all loop traces and is surrounded by infinitely many successive nested loops.]
] <prop:cle-facts>

The nonnested properties and the recursive construction are established in [19] Sections 2.1–2.2. In particular, every fixed interior point is surrounded almost surely; conditional iteration in the successive loop interiors gives infinitely many surrounding loops and avoidance of all traces. Children lie strictly inside their parents, so disjointness also persists across generations. Bounded-domain macroscopic finiteness for the entire nested ensemble is recorded explicitly in [3] p. 2788. We also use the classical Temperley correspondence [13] Theorem 1 and Wilson’s rooted spanning-tree algorithm [21], in the order-independent form of [17] Theorems 13 and 16. Their exact application to the finite rectangles will be stated when the localization argument is introduced.

===== 1.4.1 Conventions. <conventions.>

Transfer lengths and transverse site counts use lattice units; geometric windows and buffers use physical coordinates. Thus the transverse size is an odd integer $n = 2 p + 1$, and a transfer through $t$ columns has physical width $delta t$. Fix the checkerboard bipartition into black and white vertices. A cycle is directed by following first-matching edges from black to white and second-matching edges from white to black. All signed intersection sums use a common transverse orientation. Their sign changes when the direction of the cycle is reversed, while every event we use is invariant under that reversal. Constants may depend on fixed rectangles, windows, and positive buffers, but not on the vanishing mesh.

== 2 Transfer through a rectangle and the number of crossings <sec:transfer>

Our first geometric estimate bounds the number of times the double-dimer loops can cross a slab of fixed positive width. We prove it in a finite Temperleyan rectangle. A particle representation makes a large number of crossings expensive: changing the matching assignments at selected cap arcs forces the transfer into particle sectors with a quadratic spectral penalty. We include the boundary calculation because the deleted corner is part of the measure under consideration.

=== 2.1 Rectangles and traversals <rectangles-and-traversals>

After translation, rotation, and possibly reflection, the rectangle has vertices

$ R_delta = { \( delta x \, delta y \) : 1 lt.eq x lt.eq m \, med 1 lt.eq y lt.eq n } \\ { \( delta \, delta \) } \, #h(2em) n = 2 p + 1 \, $

where both $m$ and $n$ are odd. Nearest-neighbor edges join the remaining vertices. We consider sequences for which $delta m$ and $delta n$ converge to positive finite limits. The deleted corner is on the first column. We transfer in the horizontal direction and call it the longitudinal direction. Geometric cut locations use physical coordinates; transfer calculations divide them by $delta$ and count columns. A seam is a line between two consecutive columns. The part of the rectangle on either side of a seam is called a #emph[cap].

Two path portions are called #emph[parameter-disjoint] when their parameter interiors are disjoint; they may share endpoints. For two longitudinal cuts $u < v$, a loop that does not visit both ${ x lt.eq u }$ and ${ x gt.eq v }$ contributes zero traversals. For every other loop, follow its orientation and record its successive visits to ${ x lt.eq u }$ and ${ x gt.eq v }$, suppressing repeated visits to the same side before the other side is visited. The resulting cyclic word alternates and has even length. Its length is the number of #emph[traversals] of the slab by that loop. Sum over all loops to obtain $N \( u \, v \)$. Equivalently this is the maximal number of parameter-disjoint trips between the two cuts, in either direction. In particular any chosen family of disjoint crossing subarcs is bounded by $N \( u \, v \)$, even if those subarcs have excursions elsewhere. Every traversal crosses any intermediate seam, so

#[#set math.equation(numbering: n => "(1)")
 $ N \( u \, v \) lt.eq n . $ <eq:seam-max-crossings>]

All cuts below may be moved by one mesh step to seams.

#thm([Proposition 2.1.])[
  (Crossings in a finite rectangle).  #emph[Let the odd corner-rooted rectangles $R_delta$ converge to a fixed nondegenerate rectangle. Let $u_delta < v_delta$ be parallel cuts in either lattice direction, whose limiting coordinates are strictly inside the longitudinal sides and whose limiting separation is positive. Under two independent uniform matchings of $R_delta$, 
$ lim_(K arrow.r oo) limsup_(delta arrow.b 0) bb(P) { N \( u_delta \, v_delta \) > K } = 0 . $

 The traversals are counted over all loops, with no restriction on their portions outside the slab.]
] <prop:rectangle-crossings>

The proof will compare the ordinary partition function with modified counts obtained by changing the allowed matching assignments in the caps. We first develop the column transfer and its boundary normalization. The same calculation also gives the uniform summability of spectral states needed for the short-interval estimate in Section 3.

=== 2.2 Particles and column transfer <particles-and-column-transfer>

Take black sites in the first column to have odd row indices. A seam’s intersection with a horizontal dimer is described by an occupancy bit $b_i in { 0 \, 1 }$ in row $i$. On a seam, define its particle bit $q_i$ to be $b_i$ if the site immediately to its left is black, and $1 - b_i$ otherwise. At the initial boundary we use the checkerboard signs of a virtual column $0$ and a single occupied incoming edge at the deleted corner. This edge simply declares that corner already matched; it is not an edge of the rectangle. The initial particle set is therefore

$ alpha = { 3 \, 5 \, dots.h \, 2 p + 1 } \, $

and, because $m$ is odd, the empty final boundary has particle set

$ beta = { 2 \, 4 \, dots.h \, 2 p } . $

Both sets have size $p$.

Consider a column whose black rows are odd. At a black row the incoming and outgoing particle bits are $1 - b_i^(upright("in"))$ and $b_i^(upright("out"))$; at a white row they are $b_i^(upright("in"))$ and $1 - b_i^(upright("out"))$. An incoming or outgoing horizontal dimer leaves the particle unchanged. A vertical dimer instead moves one particle from its black endpoint to its white endpoint. Thus particles stay or hop to an adjacent row, with hops allowed only from black to white rows. Disjoint such moves determine the dimers in the column uniquely: the rows unused by horizontal dimers are paired by the hops.

Let $A$ be the $n times n$ matrix whose rows index outputs and columns index inputs:

#[#set math.equation(numbering: n => "(2)")
 $ A_(i j) = upright(bold(1))_({ i = j }) + upright(bold(1))_({ j med upright("odd") \, med \| i - j \| = 1 }) . $ <eq:one-particle-transfer>]

In the sector with $j$ particles, the transfer is $Lambda^j A$, written in the increasing-index wedge basis. This is the nonintersecting-path determinant viewpoint of Lindström and Gessel–Viennot [16,9]; in this one-column setting its positivity can be checked directly. To check its signs, an allowed bijection between source and destination rows cannot reverse their order: such a reversal would require opposite hops across the same adjacent pair, whereas only black-to-white hops are allowed. A hop also cannot pass a staying particle. Hence every surviving determinant term has positive sign and is exactly one legal collection of disjoint moves. The transfers in consecutive columns alternate between $A$ and $A^(*)$. For two independent matchings we take their tensor product.

Write $T_(b \, a)^(\( j \))$ for the transfer in sector $j$ from the seam after column $a$ to the seam after column $b$, so it contains $b - a$ column steps. The number of single matchings is

$ Z = chevron.l e_beta \, T_(m \, 0)^(\( p \)) e_alpha chevron.r \, #h(2em) Z_(upright("dd")) = Z^2 $

for the two-replica partition function. All these matrix entries count matchings with positive weights.

=== 2.3 Singular modes and the cost of changing particle number <singular-modes-and-the-cost-of-changing-particle-number>

The alternating transfers have compatible singular bases. The open-boundary sine modes belong to the transfer-matrix analysis developed by Lieb [15] and Rasmussen–Ruelle [18] Section IV A. We give the derivation with the alternating bases and odd-width zero mode needed by the cap calculation. This gives both the large-sector penalty used below and the summability needed for the short-interval estimate in the next section.

#thm([Lemma 2.2.])[
  (Spectrum and propagation).  #emph[For $n = 2 p + 1$, put 
$ u_l = "arsinh" #h(-0.16667em) (cos frac(pi l, n + 1)) \, quad 1 lt.eq l lt.eq p \, #h(2em) s = exp #h(-0.16667em) (sum_(l = 1)^p u_l) . $

 There are orthonormal one-particle bases on alternate seams in which each transfer is diagonal with entries 
$ e^(u_1) \, dots.h \, e^(u_p) \, 1 \, e^(- u_p) \, dots.h \, e^(- u_1) . $

 Every basis vector has site coordinates bounded by $C \/ sqrt(n)$, for an absolute constant $C$. Moreover, 
#[#set math.equation(numbering: n => "(3)")
 $ u_l gt.eq c frac(p + 1 - l, n) $ <eq:mode-gap>]

 for an absolute $c > 0$. If $t = b - a$ and $1 lt.eq k lt.eq p$, then 
#[#set math.equation(numbering: n => "(4)")
 $ frac(parallel T_(b \, a)^(\( p + k \)) parallel thin parallel T_(b \, a)^(\( p - k \)) parallel, s^(2 t)) lt.eq exp #h(-0.16667em) (- c frac(t k^2, n)) . $ <eq:sector-penalty>]

 Finally, assign to any subset $J$ of the one-particle modes the normalized propagation weight 
$ w_t \( J \) = s^(- t) product_(j in J) sigma_j^t \, $

 where the $sigma_j$ are the displayed singular values. For every $eta > 0$, 
#[#set math.equation(numbering: n => "(5)")
 $ sum_(J subset.eq { 1 \, dots.h \, n }) w_t \( J \) = 2 product_(l = 1)^p \( 1 + e^(- t u_l) \)^2 lt.eq C_eta \, #h(2em) t gt.eq eta n . $ <eq:all-state-sum>]

 The corresponding sum for two replicas is at most $C_eta^2$.]
] <lem:spectrum>

#proof[
  Split the site space into its odd and even rows. The hop block from odd to even rows has singular values
  $ lambda_l = 2 cos frac(pi l, 2 p + 2) \, #h(2em) 1 lt.eq l lt.eq p \, $
  and a one-dimensional kernel on the odd rows. For completeness, on the even rows its square is the tridiagonal matrix with diagonal $2$ and adjacent entries $1$; its normalized eigenvectors have coordinates proportional to $sin \( pi l r \/ \( p + 1 \) \)$, $1 lt.eq r lt.eq p$. The associated normalized odd modes are proportional to $sin \( pi l \( 2 r - 1 \) \/ \( 2 p + 2 \) \)$, $1 lt.eq r lt.eq p + 1$. Both families have coordinates bounded by $C \/ sqrt(n)$. The odd kernel vector has alternating coordinates of magnitude $1 \/ sqrt(p + 1)$.
  On the odd/even pair belonging to $lambda_l$, the matrix $A$ is
  $ mat(delim: "(", 1, 0; lambda_l, 1) . $
  Its singular values are $e^(u_l) \, e^(- u_l)$ because $lambda_l = 2 sinh u_l$. Its expanding right and left vectors are $\( a_l \, b_l \)$ and $\( b_l \, a_l \)$, respectively, where
  #[#set math.equation(numbering: n => "(6)")
   $ a_l^2 = frac(e^(u_l), 2 cosh u_l) \, #h(2em) b_l^2 = frac(e^(- u_l), 2 cosh u_l) \, #h(2em) a_l gt.eq 2^(- 1 \/ 2) . $ <eq:mode-components>]
  The contracting vectors may be taken as $\( - b_l \, a_l \)$ and $\( - a_l \, b_l \)$. These two-dimensional changes of basis preserve the site bound. Writing $A = U Sigma V^(*)$, an $A$ step sends the $V$ basis to the $U$ basis, and the next $A^(*)$ step sends the $U$ basis back to the $V$ basis, with the same positive diagonal $Sigma$.
  For $r = p + 1 - l$ we have $cos \( pi l \/ \( 2 p + 2 \) \) = sin \( pi r \/ \( 2 p + 2 \) \)$. The elementary lower bounds for sine on $\[ 0 \, pi \/ 2 \]$ and for $"arsinh"$ on $\[ 0 \, 1 \]$ give (3). The largest product in sector $p$ fills all expanding modes and equals $s$. In sector $p + k$ one additionally fills the zero mode and the $k - 1$ least contracting modes; in sector $p - k$ one removes the $k$ weakest expanding modes. Consequently the left side of (4) is exactly
  $ exp #h(-0.16667em) [- t (sum_(r = 1)^k u_(p + 1 - r) + sum_(r = 1)^(k - 1) u_(p + 1 - r))] \, $
  which proves the bound, including $k = 1$.
  Relative to the filled expanding modes, an arbitrary subset is specified by holes in expanding modes, occupied contracting modes, and the free choice of the zero mode. Summing their weights gives the product in (5). The logarithm of the full sum is bounded by $log 2 + 2 sum_(r gt.eq 1) e^(- c eta r)$, by (3). ◻
]

=== 2.4 The boundary caps <the-boundary-caps>

A spectral estimate for the middle of the rectangle is useful only if the boundary factors have the correct normalization. Let

$ L_a = T_(a \, 0)^(\( p \)) e_alpha \, #h(2em) R_b = \( T_(m \, b)^(\( p \)) \)^(*) e_beta $

be the ordinary single-replica cap vectors. The double-replica vectors are $L_a ⊗ L_a$ and $R_b ⊗ R_b$.

#thm([Lemma 2.3.])[
  (Cap normalization).  #emph[Fix $eta \, rho > 0$ and integer seams $0 lt.eq a lt.eq b lt.eq m$. If $m \/ n gt.eq rho$, $a gt.eq eta n$, and $m - b gt.eq eta n$, then 
#[#set math.equation(numbering: n => "(7)")
 $ frac(parallel L_a ⊗ L_a parallel thin parallel R_b ⊗ R_b parallel thin s^(2 \( b - a \)), Z_(upright("dd"))) lt.eq C_(eta \, rho) . $ <eq:cap-comparison>]

 In particular the bound is uniform as the two cuts vary in any fixed longitudinal interior region of a nondegenerate limiting rectangle.]
] <lem:cap-comparison>

#proof[
  The initial wedge occupies all odd sites except the corner. In the orthonormal odd-mode basis it is a sum of wedges with one hole. If $h_0$ is the coefficient for a hole in the zero mode, and $h_l$ that for a hole in paired mode $l$, then the corner coordinates of these modes give
  #[#set math.equation(numbering: n => "(8)")
   $ \| h_0 \| = 1 / sqrt(p + 1) \, #h(2em) frac(\| h_l \|^2, \| h_0 \|^2) = 2 sin^2 frac(pi l, n + 1) lt.eq 2 . $ <eq:corner-hole>]
  Every term except the zero-mode hole has an occupied zero mode, which can never reach the all-even final wedge. Thus only the zero-mode-hole term contributes to $Z$.
  Since $m$ is odd, the odd-to-even transfer in pair $l$ is
  $ a_l^2 e^(m u_l) - b_l^2 e^(- m u_l) = a_l^2 e^(m u_l) #scale(x: 120%, y: 120%)[\(] 1 - e^(- 2 \( m + 1 \) u_l) #scale(x: 120%, y: 120%)[\)] . $
  With the overall wedge signs fixed by the positive partition function, we obtain the exact formula
  #[#set math.equation(numbering: n => "(9)")
   $ Z = \| h_0 \| (product_l a_l^2) s^m product_l #scale(x: 120%, y: 120%)[\(] 1 - e^(- 2 \( m + 1 \) u_l) #scale(x: 120%, y: 120%)[\)] . $ <eq:rectangle-partition>]
  There is no cancellation between different hole terms, as all the other terms have zero output coefficient. By (3) and $m \/ n gt.eq rho$,
  #[#set math.equation(numbering: n => "(10)")
   $ 0 < c_rho lt.eq product_l #scale(x: 120%, y: 120%)[\(] 1 - e^(- 2 \( m + 1 \) u_l) #scale(x: 120%, y: 120%)[\)] lt.eq 1 . $ <eq:partition-product>]
  Indeed this product is bounded below by a fixed positive product $product_(r gt.eq 1) \( 1 - e^(- c rho r) \)$.
  We next estimate the input cap without discarding its other hole terms. Put
  $ f_l \( q \) = a_l^2 e^(2 q u_l) + b_l^2 e^(- 2 q u_l) . $
  Different hole terms remain orthogonal after propagation: in each pair the number of particles is preserved, as is the zero-mode occupancy. It follows that
  #[#set math.equation(numbering: n => "(11)")
   $ parallel L_a parallel^2 = \| h_0 \|^2 product_l f_l \( a \) (1 + sum_l frac(\| h_l \/ h_0 \|^2, f_l \( a \))) . $ <eq:left-cap-exact>]
  The product divided by $product_l a_l^2 e^(2 a u_l)$ is $product_l \( 1 + \( b_l \/ a_l \)^2 e^(- 4 a u_l) \)$, and the sum in parentheses is at most $1 + C sum_l e^(- 2 a u_l)$. Both are uniformly bounded when $a gt.eq eta n$. Therefore
  $ parallel L_a parallel lt.eq C_eta \| h_0 \| (product_l a_l) s^a . $
  The all-even final wedge has one particle in every paired mode and no zero-mode particle. The same calculation, now without hole terms, gives
  $ parallel R_b parallel^2 = product_l f_l \( m - b \) \, #h(2em) parallel R_b parallel lt.eq C_eta (product_l a_l) s^(m - b) . $
  Multiplying these bounds, inserting $s^(b - a)$, and comparing with (9)–(10) proves the single-replica comparison. Its square is (7). ◻
]

=== 2.5 Cap diagrams and modified endpoint signs <cap-diagrams-and-modified-endpoint-signs>

We now turn the spectral penalty into a geometric estimate. Superpose the two matchings inside one cap, retaining the multiplicities of its edges but forgetting which matching supplies each single edge. After doubled edges are suppressed, each component is either an interior closed loop or a simple arch joining two single seam edges. The arches are disjoint. An ordinary interior loop has two alternating matching assignments; a doubled edge has only one.

At a single seam edge, the difference of the two particle bits is $+ 1$ or $- 1$. It equals the signed crossing in the direction of the cycle obtained by directing first-matching edges from black to white and second-matching edges from white to black. Each arch has opposite particle-difference signs at its two ends. Either choice of those opposite signs determines its alternating matching assignment uniquely. These descriptions also hold for the cap at the missing corner: the virtual incoming edge occurs in both replicas and produces no open single strand.

A #emph[tear] is the following formal modification of an arch. Instead of requiring opposite endpoint signs, prescribe both signs to be $+$, or both to be $-$, with weight one for that prescription. The uncolored arch and all its edge multiplicities remain unchanged. This defines a vector of seam states even though the modified assignment need not be a pair of matchings inside the cap. A positive tear increases the first particle number by one and decreases the second by one; a negative tear has the reverse effect. Geometrically it can be regarded as a source or a sink on the arch.

Here is the coefficient rule for the resulting formal vector. Fix an uncolored cap diagram $D$ and its prescribed tears, and let $c \( D \)$ be its number of internal single loops. At a seam site with multiplicity zero or two, the two occupancy bits are forced, and hence so are the particle bits. At the single seam sites, choose endpoint signs subject to the opposite-sign rule on every unmarked arch and the prescribed equal signs on every torn arch. Let $cal(A) \( D \)$ be the set of particle-state pairs $\( Q_1 \, Q_2 \)$ obtained in this way. The diagram contributes

$ 2^(c \( D \)) sum_(\( Q_1 \, Q_2 \) in cal(A) \( D \)) e_(Q_1) ⊗ e_(Q_2) . $

Each permitted endpoint assignment is counted once. In particular, a prescribed tear replaces the two ordinary arch assignments by one new assignment; it is not applied separately to each old coloring. Summing these contributions over diagrams, marks, and their specified weights defines the marked vector.

#thm([Lemma 2.4.])[
  (Marked cap vectors).  #emph[Start with an ordinary two-replica cap vector. In each uncolored cap diagram specify a collection of eligible arches, and retain only diagrams having at most $M$ eligible arches. Sum over ordered lists of $k$ distinct eligible arches, with one positive or negative tear prescribed on each marked arch, and give every list any weight in $\[ 0 \, 1 \]$ depending only on the uncolored diagram and its marks. The resulting vector $V$ satisfies 
#[#set math.equation(numbering: n => "(12)")
 $ parallel V parallel lt.eq M^k parallel V_(upright("ordinary")) parallel . $ <eq:marked-cap-norm>]

 Moreover, when such vectors are joined by ordinary double-replica transfer, their expansion over uncolored configurations has precisely the ordinary edge multiplicities. Dividing a contraction by $Z_(upright("dd"))$ therefore gives the expectation of the ratio of modified color counts to ordinary color counts, with the prescribed mark weights. The same interpretation holds for an inserted linear operation that preserves the total seam-edge multiplicity at each site; signs of that operation are included in the modified count.]
] <lem:marked-cap>

#proof[
  Expand $parallel V parallel^2$ by pairs of uncolored cap diagrams. A nonzero gluing requires their seam multiplicities to agree. Their two arch pairings then form alternating cycles on the single seam endpoints. Every such cycle has even length. Before any modification, its opposite-sign constraints admit exactly two choices. The tear rules replace some of these constraints by fixed endpoint signs. If a cycle has a tear, those fixed signs force the signs along every remaining segment of ordinary arches, so there is at most one compatible assignment. An unmodified cycle still has its two choices. Thus the number of assignments cannot increase, although the new assignments need not be ordinary colorings. The weights of closed loops internal to either cap are unchanged. For each pair of diagrams there are at most $M^k$ lists on either side of the scalar product. Termwise comparison with the ordinary squared norm, followed by summation, proves (12).
  For the second assertion, expand the central transfers as matching configurations and glue along equal seam states. Erasing all colors leaves an ordinary double-dimer configuration: every vertex has degree two, counting a doubled edge twice, and all single cycles have even length because the lattice is bipartite. The modification only changes the allowed color contractions along those cycles. An ordinary uncolored configuration with $r$ single cycles has weight $2^r$, and the modified contraction supplies its modified color count instead. This is exactly the stated ratio after normalization. A sitewise multiplicity-preserving insertion changes no part of this uncolored gluing, so its matrix signs can be incorporated in the same expansion. ◻
]

=== 2.6 Proof of traversal tightness <proof-of-traversal-tightness>

#proof[
  We use longitudinal coordinates in columns and put $d = \( v - u \) \/ n$. Choose seams $a \, b$ at approximately the one-third and two-thirds points of $\[ u \, v \]$, so each of the three widths is at least $\( v - u \) \/ 4$. In the left cap at $a$, call an arch eligible if it reaches $x lt.eq u$; in the right cap at $b$, call it eligible if it reaches $x gt.eq v$. Every eligible arch contributes two disjoint traversals of the corresponding outer subslab. Hence the probability of more than $M$ eligible arches on either side is bounded by
  #[#set math.equation(numbering: n => "(13)")
   $ bb(P) { N \( u \, a \) gt.eq 2 M } + bb(P) { N \( b \, v \) gt.eq 2 M } . $ <eq:eligible-exception>]
  Suppose now that there are at least $2 k$ whole-slab traversals and both eligible counts are at most $M$. A loop contributing $2 r$ traversals has cyclic deep-side word $\( L R \)^r$, where $L$ and $R$ denote visits to $x lt.eq u$ and $x gt.eq v$. Distribute $k$ left/right pairs among the loops, choosing on each used loop a consecutive block of $s lt.eq r$ pairs. The selected letters alternate cyclically even across the omitted block: the last selected $R$ is followed by the first selected $L$.
  For each chosen run, take a visit to its deep region and select the cap arch containing that visit. This arch is eligible. The chosen arches are distinct, because a single cap arch cannot contain a visit to the opposite deep region and therefore cannot serve two runs separated by such a visit. Thus the selected cap arches have precisely the cyclic left/right order prescribed by the chosen words.
  Prescribe positive tears at all $k$ marks in each cap. Both seam sectors are now $\( p + k \, p - k \)$. Equal positive crossing signs describe a source on a left-cap arch and a sink on a right-cap arch. The cyclic alternation of the marks therefore permits a modified matching assignment: continue the alternating colors between successive marks, switching the endpoint rule at each mark. A touched ordinary cycle loses at most its factor two, while untouched cycles retain it. There are at most $2 k$ touched cycles, so this marking has modified-to-ordinary color ratio at least $2^(- 2 k)$.
  Sum over all choices of $k$ eligible marks in each cap. Every coefficient is nonnegative. Lemma 7, followed by Lemmas 5 and 6, bounds the normalized contraction by
  $ C M^(2 k) exp \( - c d k^2 \) . $
  Here the constant $C$ is uniform for every cut inside the original slab, since that slab stays a fixed positive distance from the longitudinal ends of the rectangle. Comparing this upper bound to the preceding pointwise lower bound and using (13) yields
  #[#set math.equation(numbering: n => "(14)")
   $ bb(P) { N \( u \, v \) gt.eq 2 k } & lt.eq bb(P) { N \( u \, a \) gt.eq 2 M } + bb(P) { N \( b \, v \) gt.eq 2 M }\
 & quad + C thin 2^(2 k) M^(2 k) e^(- c d k^2) . $ <eq:crossing-recursion>]
  Since $N \( u \, v \)$ is even and $n = 2 p + 1$, (1) implies that a nonempty event $N \( u \, v \) gt.eq 2 k$ has $k lt.eq p$. Thus every required sector lies in the range of Lemma 5.
  It remains to close the recursion without assuming any prior crossing bound. Take an integer $k gt.eq 2$, set $M = k^2$, and apply (14) to the two outer slabs. At depth $j$ the threshold parameter is
  $ k_j = k^(2^j) \, $
  there are at most $2^j$ slabs, and their widths are at least $4^(- j) \( v - u \)$. The total contribution of the explicit error terms is at most
  #[#set math.equation(numbering: n => "(15)")
   $ C sum_(j gt.eq 0) 2^j exp #h(-0.16667em) (2 k_j log 2 + 4 k_j log k_j - c d 4^(- j) k_j^2) . $ <eq:recursion-sum>]
  For all sufficiently large initial $k$, the two positive terms in the exponent are at most half the negative term, simultaneously for all $j$: indeed $k_j \/ \( 4^j log k_j \)$ has its minimum at $j = 0$ once $k$ is large. The remaining summands are bounded by $C 2^j exp \( - c' d 4^(- j) k^(2^(j + 1)) \)$; their sum tends to zero as $k arrow.r oo$.
  For a fixed lattice, stop a branch as soon as $2 k_j > n$, when its event is empty by (1). This happens after $O \( log log n \)$ levels. Up to that depth, the smallest available width is at least $c n \/ \( log n \)^C$ columns for fixed initial $k \, d > 0$. Thus all the rounded subdivisions used above are possible once the mesh is sufficiently small. No terminal probability remains, and (15) proves the proposition. Rotation or reflection puts either lattice direction in the same convention. ◻
]

== 3 A short-segment estimate <sec:short-segment>

The traversal bound gives compactness, but by itself permits a limiting curve to retrace part of its image. We now obtain a second estimate: two arcs travelling between opposite sides cannot carry incompatible signed crossings through the same short interval. The additional factor of the interval length will come from a two-particle insertion. Its matrix entries have signs, so the geometric interpretation of its contraction is an essential part of the argument.

Use physical coordinates $\( x \, y \)$ in which transfer proceeds in the $x$-direction; transfer lengths $t_(-) \, t_(+)$ below count lattice columns. For an oriented lattice path $alpha$ and a segment $I$ of a vertical seam, write $iota_I \( alpha \)$ for its algebraic intersection number with $I$, using one fixed transverse sign convention. Endpoints of $I$ are off the graph, and endpoints of the paths being tested are off the seam. The direction on every double-dimer cycle is the one determined by the two matching labels. In particular, for a whole simple cycle $g$,

#[#set math.equation(numbering: n => "(16)")
 $ iota_I \( g \) in { - 1 \, 0 \, 1 } . $ <eq:whole-loop-index>]

#thm([Proposition 3.1.])[
  (Short intervals in a rectangle).  #emph[Let $R_delta$ be corner-rooted odd lattice rectangles converging to a fixed nondegenerate rectangle, with two independent uniform dimer covers. Fix an interior longitudinal coordinate $c$, two positive numbers $rho_(-) \, rho_(+)$, and a bounded segment $J$ of the transverse line $x = c$. The two regions $x lt.eq c - rho_(-)$ and $x gt.eq c + rho_(+)$ are called the deep regions; if either is disjoint from the rectangle, the events below are empty. The segment $J$ may extend beyond the transverse sides of the rectangle.]
  #emph[For each sufficiently small $h > 0$, partition $J$ into at most $C_J \/ h$ intervals of length at most $h$, with endpoints off the graph. Use a seam converging to $x = c$ and the corresponding intervals when necessary. A tested arc is a cycle subarc, in its cycle direction, with one endpoint in each deep region. Let $B_(delta \, h)$ be the event that some partition interval $I$ satisfies at least one of the following conditions:]
  + #emph[a tested arc $alpha$ on a cycle $g$ has $iota_I \( alpha \) eq.not 0$ and $iota_I \( alpha \) eq.not iota_I \( g \)$;]
  + #emph[tested arcs on two distinct cycles both have nonzero intersection number with $I$.]
  #emph[The arcs may otherwise travel anywhere in the rectangle. Then 
#[#set math.equation(numbering: n => "(17)")
 $ lim_(h arrow.b 0) limsup_(delta arrow.b 0) bb(P) \( B_(delta \, h) \) = 0 . $ <eq:rectangle-short-limit>]

 The conclusion is unchanged by truncating intervals at a transverse side, or by placing their endpoints outside the rectangle.]
] <prop:rectangle-short>

=== 3.1 Marked caps and the analytic bound <marked-caps-and-the-analytic-bound>

If either deep region is absent, there is nothing to prove. Otherwise choose two cap seams in the interior of the rectangle, $x = a$ and $x = b$, with

$ c - rho_(-) < a < c < b < c + rho_(+) . $

They remain a positive macroscopic distance from the middle seam and from the longitudinal ends of the rectangle. In the left cap an arch is #emph[eligible] if it reaches $x lt.eq c - rho_(-)$; in the right cap it is eligible if it reaches $x gt.eq c + rho_(+)$. Here an arch is a connected nondoubled path in the cap with its two endpoints on the cap seam. Let $E_M$ be the event that each cap has at most $M$ eligible arches, where $M gt.eq 1$. Choose in each cap a fixed strictly interior line between the deep line and the cap seam. Every eligible arch makes two traversals between this shallower line and the cap seam, even when the deep line itself is a longitudinal side of the rectangle. Proposition 4 therefore gives

#[#set math.equation(numbering: n => "(18)")
 $ lim_(M arrow.r oo) limsup_(delta arrow.b 0) bb(P) \( E_M^c \) = 0 . $ <eq:cap-cutoff-tight>]

The same event $E_M$ will be used for all intervals of the partition.

For now assign each eligible arch $A$ a weight $lambda \( A \) in \[ 0 \, 1 \]$ determined only by its own uncolored cap diagram and the choice of $A$. We first compute with these weights and then choose them to make the signed contraction nonnegative. Their dependence on one cap alone allows the two marked cap vectors to be formed separately.

In each cap select one eligible arch and tear it as in Lemma 7, with weight $lambda \( A \)$. Use two plus signs at the left cap and two minus signs at the right cap. These are two #emph[sources]: their apparently different signs are due to the opposite boundary normals of the two caps. Sum over the selections, and set the marked cap vector to zero when its cap has more than $M$ eligible arches. Denote the resulting left and right vectors by $V_L$ and $V_R$. In the particle convention of the preceding section they lie in the two-replica sectors $\( p + 1 \, p - 1 \)$ and $\( p - 1 \, p + 1 \)$, respectively, where $n = 2 p + 1$ is the number of transverse sites. In cap-vector subscripts, the seams are indexed by their column numbers, as in Section 2. Lemma 7 gives

$ parallel V_L parallel lt.eq M parallel L_a ⊗ L_a parallel \, #h(2em) parallel V_R parallel lt.eq M parallel R_b ⊗ R_b parallel . $

At the middle seam let $S \( I \) subset.eq { 1 \, dots.h \, n }$ be the indices of sites in $I$. The insertion $cal(O)_I$ sums, over $i < j$ in $S \( I \)$, the operation which removes the pair $i \, j$ from the first exterior factor and creates it in the second. It vanishes unless both sites have first-replica occupancy one and second-replica occupancy zero. The resulting pair of occupancies is reversed at both sites. Thus

$ cal(O)_I : Lambda^(p + 1) bb(R)^n ⊗ Lambda^(p - 1) bb(R)^n arrow.r Lambda^(p - 1) bb(R)^n ⊗ Lambda^(p + 1) bb(R)^n . $

Its increasing-wedge sign in the site basis is

#[#set math.equation(numbering: n => "(19)")
 $ \( - 1 \)^(\# { upright("single occupations strictly between ") i upright(" and ") j }) . $ <eq:insertion-parity>]

Indeed the two exterior factors contribute their usual deletion and insertion signs; doubly occupied intervening indices contribute twice, and the other nonzero contributions are precisely the single occupations. The operation preserves total seam-edge multiplicities site by site, also on rows where the particle convention complements edge occupancy. Figure 1 shows the two cap sources and the two middle-seam sinks in a same-loop contribution.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-5.4, -1.4), (-2.7, 1.4), fill: rgb("#f5f5ff"), stroke: none)
  rect((2.7, -1.4), (5.4, 1.4), fill: rgb("#f5f5ff"), stroke: none)
  line((-2.7, -1.55), (-2.7, 1.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((2.7, -1.55), (2.7, 1.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, -1.55), (0, 1.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.9), (0, 0.9), stroke: (paint: rgb("#8c0000"), thickness: 2.0pt, miter-limit: 10))
  line((-2.7, 0.6), (2.7, 0.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((2.7, 0.6), (2.7, -0.6), (5.738, 0.6), (5.738, -0.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.7, -0.6), (-2.7, -0.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-2.7, -0.6), (-2.7, 0.6), (-5.738, -0.6), (-5.738, 0.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-4.978, 0), radius: (0.135, 0.1), fill: rgb("#ffffff"), stroke: none)
  line((-5.113, 0), (-4.843, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((4.978, 0), radius: (0.135, 0.1), fill: rgb("#ffffff"), stroke: none)
  line((4.843, 0), (5.113, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0.6), radius: (0.07425, 0.055), fill: black, stroke: none)
  circle((0, -0.6), radius: (0.07425, 0.055), fill: black, stroke: none)
  content((-2.7, 0.6), [#text(size: 9pt)[$+$]], anchor: "south-east", padding: 0.1176cm)
  content((-2.7, -0.6), [#text(size: 9pt)[$+$]], anchor: "north-east", padding: 0.1176cm)
  content((2.7, 0.6), [#text(size: 9pt)[$-$]], anchor: "south-west", padding: 0.1176cm)
  content((2.7, -0.6), [#text(size: 9pt)[$-$]], anchor: "north-west", padding: 0.1176cm)
  content((0, 0.6), [#text(size: 9pt)[$j$]], anchor: "south-west", padding: 0.1176cm)
  content((0, -0.6), [#text(size: 9pt)[$i$]], anchor: "north-west", padding: 0.1176cm)
  content((0, 0), [#text(fill: rgb("#8c0000"))[#text(size: 9pt)[$I$]]], anchor: "west", padding: 0.1176cm)
  content((-4.05, -1.15), [#text(size: 9pt)[left cap]])
  content((4.05, -1.15), [#text(size: 9pt)[right cap]])
  content((-2.7, 1.6), [#text(size: 9pt)[$a$]], anchor: "south", padding: 0.1176cm)
  content((0, 1.6), [#text(size: 9pt)[$c$]], anchor: "south", padding: 0.1176cm)
  content((2.7, 1.6), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  content((-4.793, 0.86), [#text(size: 9pt)[source]], anchor: "south", padding: 0.1176cm)
  content((4.793, 0.86), [#text(size: 9pt)[source]], anchor: "south", padding: 0.1176cm)
  line((-2.498, -1.15), (-0.2025, -1.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  line((0.2025, -1.15), (2.498, -1.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-1.35, -1.15), [#text(size: 9pt)[$t_-$]], anchor: "north", padding: 0.1176cm)
  content((1.35, -1.15), [#text(size: 9pt)[$t_+$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A same-loop contribution to the insertion. The selected cap arches carry two sources: the endpoint signs are $+ +$ at the left seam and $- -$ at the right seam. The two sinks $i \, j$ lie in the middle interval $I$. The insertion changes the permitted color assignments while preserving the uncolored loop. The positive propagation widths $t_(-)$ and $t_(+)$ control the sum over mode states. ],
) <fig:two-particle-insertion>

#thm([Lemma 3.2.])[
  (Sandwiched insertion).  #emph[Let $cal(T)_(-)$ and $cal(T)_(+)$ be the two-replica transfers from $a$ to $c$ and from $c$ to $b$, with column lengths $t_(-)$ and $t_(+)$. For the fixed positive widths above, so that $t_plus.minus gt.eq eta n$ for some $eta > 0$ and all sufficiently small meshes, 
#[#set math.equation(numbering: n => "(20)")
 $ parallel s^(- 2 \( t_(-) + t_(+) \)) cal(T)_(+) cal(O)_I cal(T)_(-) #scale(x: 120%, y: 120%)[parallel] lt.eq C (frac(\| S \( I \) \|, n))^2 . $ <eq:sandwiched-insertion>]

 Consequently, uniformly over the cap-local weights $lambda \( A \) in \[ 0 \, 1 \]$, 
#[#set math.equation(numbering: n => "(21)")
 $ frac(\| chevron.l V_R \, cal(T)_(+) cal(O)_I cal(T)_(-) V_L chevron.r #scale(x: 120%, y: 120%)[\|], Z_(upright("dd"))) lt.eq C_M (frac(\| S \( I \) \|, n))^2 . $ <eq:marked-contraction-bound>]

]
] <lem:sandwiched-insertion>

#proof[
  Use the real orthogonal singular-mode basis at the middle seam supplied by Lemma 5; it is the same for both replicas. Write its change-of-basis matrix as $Q$, and put
  $ P_I = Q^T upright(bold(1))_(S \( I \)) Q . $
  Here $upright(bold(1))_(S \( I \))$ is the diagonal orthogonal projection onto the indicated site coordinates. For a removed mode pair $R = { r \, s }$, $r < s$, and an added mode pair $T = { u \, v }$, $u < v$, the coefficient of pair deletion in the first factor and pair creation in the second is
  #[#set math.equation(numbering: n => "(22)")
   $ sum_(i < j\
i \, j in S \( I \)) det Q_({ i \, j } \, R) thin det Q_({ i \, j } \, T) = det \( P_I \)_(R \, T) . $ <eq:insertion-minor>]
  All pairs use increasing order; the equality is the two-by-two Cauchy–Binet identity. For fixed input and output occupation states, the removed pair is their set difference in the first factor and the added pair is their set difference in the second. Thus a nonzero matrix entry uses exactly one coefficient in (22), multiplied by the occupation-state sign. The delocalization bound $\| Q_(i r) \| lt.eq C \/ sqrt(n)$ gives
  $ \| \( P_I \)_(r s) \| lt.eq C^2 frac(\| S \( I \) \|, n) \, #h(2em) \| \( cal(O)_I \)_(alpha beta) \| lt.eq 2 C^4 (frac(\| S \( I \) \|, n))^2 . $
  We must also control the sum over mode states. For a two-replica mode state $mu = \( J \, K \)$, set
  $ d_plus.minus \( mu \) = w_(t_plus.minus) \( J \) w_(t_plus.minus) \( K \) \, $
  using the normalized single-replica weights of Lemma 5. Equation (5), which includes the zero mode, gives $sum_mu d_plus.minus \( mu \) lt.eq C_eta^2$, even when the sums run over all particle sectors. In the compatible singular bases the normalized transfers are diagonal, so the sandwiched matrix has entries $d_(+) \( nu \) \( cal(O)_I \)_(nu mu) d_(-) \( mu \)$. Consequently
  $ parallel s^(- 2 \( t_(-) + t_(+) \)) cal(T)_(+) cal(O)_I cal(T)_(-) #scale(x: 120%, y: 120%)[parallel] & lt.eq sum_(nu \, mu) d_(+) \( nu \) \| \( cal(O)_I \)_(nu mu) \| d_(-) \( mu \)\
 & lt.eq 2 C^4 (frac(\| S \( I \) \|, n))^2 (sum_nu d_(+) \( nu \)) (sum_mu d_(-) \( mu \)) . $
  The operator norm is bounded by the entrywise absolute sum, and the bounded state sums prove (20). The displayed bounds on $parallel V_L parallel \, parallel V_R parallel$ and the partition comparison in Lemma 6 now prove (21). ◻
]

The analytic estimate supplies a factor $\| S \( I \) \|^2$ for every permitted choice of weights. To use it for a probability, we must choose the weights so that the full signed contraction is nonnegative and detects the event we want to exclude. We now compute its contributions before making that choice.

=== 3.2 The pointwise color calculation <the-pointwise-color-calculation>

Fix an ordinary uncolored double-dimer configuration $omega$. Each nondoubled loop has two assignments of its alternating edges to the two matchings; doubled edges have only one. For each selected pair of cap arches and each sink pair $i < j$ in $S \( I \)$, count the modified color assignments satisfying the two source rules and the two insertion rules. Multiply by (19), divide by the ordinary number of assignments, and multiply by the two cap weights $lambda$. Sum over the choices, and define the result to be $X_(M \, I)^lambda \( omega \)$; set it to zero on $E_M^c$. Lemma 7 gives the exact identity

#[#set math.equation(numbering: n => "(23)")
 $ bb(E) X_(M \, I)^lambda = frac(chevron.l V_R \, cal(T)_(+) cal(O)_I cal(T)_(-) V_L chevron.r, Z_(upright("dd"))) . $ <eq:observable-contraction>]

To compute this color ratio, cut the uncolored configuration at the middle seam $x = c$. A marked loop not reaching that seam has no possible sink and contributes zero. Otherwise the selected left cap arch lies in a unique arch of the same loop in ${ x < c }$. Direct its two branches away from the source. Ordinary strands propagate these directions to the middle seam, where both branches leave the left half-plane. The induced endpoint signs are therefore $+ +$. On the right the same argument gives $- -$, because both branches leave ${ x > c }$. An unmarked middle-seam arch has one entrance and one exit, hence opposite endpoint signs.

Several choices of a remote eligible arch can lie on the same middle-seam arch. We keep them as separate marked choices, each with its own weight. Moving a source along that arch changes no intersection with $I$. Thus the color calculation below applies to each remote choice and preserves its multiplicity when we sum.

Rank the singly occupied edges along the whole middle seam, and give rank $r$ the alternating sign $sigma_r = \( - 1 \)^r$. Formula (19) becomes

#[#set math.equation(numbering: n => "(24)")
 $ - sigma_i sigma_j $ <eq:rank-insertion-sign>]

when $i \, j$ now denote the two ranks. On any one simple loop these rank signs agree with oriented intersection signs up to a common sign. To see why other loops do not affect this assertion, take two seam hits of the chosen loop. They have the same inside/outside relation to every other disjoint loop. Each such loop therefore contributes an even number of hits between them. After these even contributions are removed, the assertion is the usual alternation of entering and leaving a Jordan domain along a line.

#thm([Lemma 3.3.])[
  (One or two marked loops).  #emph[Fix one eligible mark in each cap, before multiplying their weights.]
  + #emph[If both marks lie on one loop, let $u \, v$ be the intersection numbers with $I$ of its two mark-to-mark arcs, both oriented from the left mark to the right mark. Its summed signed color ratio is $u v \/ 2$. This is nonnegative, and is at least $1 \/ 2$ when $u \, v eq.not 0$.]
  + #emph[If the marks lie on distinct loops $g \, g'$, put 
$ t_g = sum_(upright("hits of ") g upright(" in ") I) sigma_r . $

 Their summed signed color ratio is $- t_g t_(g') \/ 4$. The number $t_g$ is zero unless $g$ separates the endpoints of $I$, in which case it is $1$ or $- 1$.]
] <lem:color-contractions>

#proof[
  One can express the color rules using signs $x_r^L \, x_r^R in { - 1 \, 1 }$ on the two sides of each single middle-seam hit. An unmarked arch requires opposite signs at its ends. A marked left arch fixes both signs to $+ 1$, and a marked right arch fixes both to $- 1$. Ordinary seam gluing requires $x_r^L = x_r^R$, whereas a selected sink fixes $\( x_r^L \, x_r^R \) = \( + 1 \, - 1 \)$. On an ordinary loop these constraints leave one free binary choice; once a source is prescribed, propagation fixes every remaining sign whenever the constraints are compatible.
  At a source the two oriented strands point away from the mark; at a sink they point toward it. Continuing the assignments around a loop shows that sources and sinks must alternate. On a loop with two sources, the sink pair is therefore admissible precisely when it puts one sink on each of the two mark-to-mark arcs. It then prescribes one assignment instead of the two ordinary choices. The two arcs have opposite directions relative to any coherent orientation of the whole loop, canceling the minus sign in (24). Summing the remaining products of crossing signs yields $u v \/ 2$.
  The whole-loop intersection number, in the orientation of the first arc, is $u - v$, so (16) implies $\| u - v \| lt.eq 1$. Because $u \, v$ are integers, their product is nonnegative, and is at least one if neither vanishes.
  For two distinct marked loops there must be one sink on each. The colors of each marked loop are then fixed, replacing four ordinary choices by one. Summing (24) gives $- t_g t_(g') \/ 4$. The rank-sign observation before the lemma identifies $t_g$, up to a sign, with the whole-loop intersection number. This number vanishes exactly when the endpoints of $I$ have the same inside/outside status with respect to $g$. ◻
]

For a precise parity identity, order the endpoints $A \, B$ of $I$ in the increasing seam direction, and let $d \( g \)$ be the number of loops strictly enclosing $g$. Start rank numbering at the first hit of the whole seam, so that the region before all hits is exterior to every loop. Then

#[#set math.equation(numbering: n => "(25)")
 $ t_g = - \( - 1 \)^(d \( g \)) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ B in "Int" \( g \) }) - upright(bold(1))_({ A in "Int" \( g \) }) #scale(x: 120%, y: 120%)[\)] . $ <eq:rank-nesting-depth>]

Indeed at a hit entering $g$, the nesting parity just before the hit is $d \( g \)$, and at a hit leaving $g$ it is $d \( g \) + 1$. Since $sigma_r = \( - 1 \)^r$, summing these signed changes telescopes to (25), regardless of how often $g$ hits the seam.

The loops separating the endpoints of $I$ form at most two nested chains, one around either endpoint, with their common ancestors omitted. Order each chain from its outermost loop inward. The signs $t_g$ alternate along each chain. If both chains are nonempty, the two outermost signs are opposite. Successive members of either chain have ancestor depths differing by one. The two outermost members, when both exist, border the same common-ancestor region and have equal depths, but the endpoint differences in (25) have opposite signs. Common ancestors change both depth parities equally; other nonseparating loops do not affect the identity. Endpoints outside the rectangle are permitted in this description.

=== 3.3 Nested arches and positivity <nested-arches-and-positivity>

Only loops separating the endpoints of $I$ contribute to the different-loop sum, since the other loops have $t_g = 0$. For such a loop $g$, let

$ U_g = sum_(A upright(" eligible left arch")\
A subset g) lambda \( A \) \, #h(2em) V_g = sum_(A upright(" eligible right arch")\
A subset g) lambda \( A \) . $

These totals still depend on the weights to be chosen; empty sums are zero. The total contribution from marks on distinct loops is, by Lemma 10,

#[#set math.equation(numbering: n => "(26)")
 $ - 1 / 4 sum_(g eq.not g') U_g V_(g') t_g t_(g') . $ <eq:different-loop-sum>]

Individual summands can be negative: two loops whose positions in a chain differ by two have the same sign $t_g$. We choose the weights so that the total mark weights decrease by a factor of at least two along either nesting chain. The resulting alternating sums will control the complete expression (26).

The weights must still be determined within each cap. For an eligible arch $A$, let $b \( A \)$ count the eligible arches in that cap whose endpoints strictly span those of $A$ along its seam. Choose

#[#set math.equation(numbering: n => "(27)")
 $ lambda \( A \) = w \( A \) := \( 2 M \)^(- b \( A \)) . $ <eq:arch-weight>]

On $E_M$ every such weight belongs to $\[ q_M \, 1 \]$, where

#[#set math.equation(numbering: n => "(28)")
 $ q_M = \( 2 M \)^(- \( M - 1 \)) . $ <eq:minimum-arch-weight>]

From now on $U_g \, V_g$ use this choice, and write $X_(M \, I) = X_(M \, I)^w$. Every nonzero $U_g$ or $V_g$ is at least $q_M$, because it contains at least one eligible-arch weight. To connect the endpoint nesting chains to these cap weights, we show that every eligible arch of an inner separating loop is spanned by an eligible arch of the outer loop. That additional spanning arch supplies a factor $1 \/ \( 2 M \)$; the cutoff of $M$ arches will then give the required factor $1 \/ 2$ for the total weights.

#thm([Lemma 3.4.])[
  (Decrease of the cap weights).  #emph[On $E_M$, if a separating loop $g'$ lies inside another separating loop $g$, then 
$ U_(g') lt.eq 1 / 2 U_g \, #h(2em) V_(g') lt.eq 1 / 2 V_g . $

 In particular a zero outer weight forces all deeper weights in that cap to be zero.]
] <lem:cap-weight-decrease>

#proof[
  Consider an eligible arch $A'$ of $g'$ in one cap. Since $g$ separates the endpoints of the middle interval, it reaches the middle seam and is not contained in the cap half-plane. Its portions in that half-plane are disjoint arches. Each such arch $A$, closed by the interval between its seam endpoints, bounds a Jordan disk $D_A$. Inside the open cap half-plane, the indicator of the interior of $g$ is the parity sum of the indicators of these disks: the two sides have the same boundary there and both vanish sufficiently far away. An interior point of $A'$ therefore belongs to at least one $D_A$. The whole interior of $A'$ stays in that disk, since it cannot cross $A$ or the cap seam. Thus the endpoints of $A$ strictly span those of $A'$.
  The disk $D_A$ reaches no deeper into the cap than its boundary arch. Since $A'$ reaches the prescribed deep region, $A$ also reaches it and is eligible. Every eligible arch spanning $A$ also spans $A'$, and $A$ itself supplies one additional spanning arch. Consequently
  $ b \( A' \) gt.eq b \( A \) + 1 \, #h(2em) w \( A' \) lt.eq frac(w \( A \), 2 M) . $
  There are at most $M$ eligible inner choices. Bounding each containing outer weight by the largest outer weight gives
  $ sum_(A' subset g') w \( A' \) lt.eq 1 / 2 max_(A subset g) w \( A \) lt.eq 1 / 2 sum_(A subset g) w \( A \) . $
  This proves the assertion independently in the two caps. ◻
]

#thm([Lemma 3.5.])[
  (Two alternating chains).  #emph[Suppose a finite family consists of at most two chains, each ordered from outside inward. Give its members signs $t_g in { - 1 \, 1 }$ which alternate in either chain and have opposite outermost signs when both chains are present. Let $U_g \, V_g gt.eq 0$ decrease by a factor of at least two at each step inward. Then the expression (26) is nonnegative. If every positive $U_g$ or $V_g$ is at least $q > 0$ and there are distinct $g \, g'$ with $U_g V_(g') > 0$, the expression is at least $q^2 \/ 16$.]
] <lem:two-chain-positivity>

#proof[
  Within one chain write its indices as $1 \, dots.h \, k$. Group the terms by their outer member to obtain
  $ 1 / 4 sum_(i = 1)^(k - 1) [U_i sum_(j > i) \( - 1 \)^(j - i + 1) V_j + V_i sum_(j > i) \( - 1 \)^(j - i + 1) U_j] . $
  Each inner alternating sum is nonnegative and is at least half its first term, since successive magnitudes decrease by a factor of at least two. If a particular product $U_i V_j$ or $V_i U_j$ with $i < j$ is positive, the appropriate first term at $i + 1$ is positive as well. That group then contributes at least $q^2 \/ 8$.
  Between the two chains the sum is
  $ - 1 / 4 [(sum_(g in C_1) U_g t_g) (sum_(g in C_2) V_g t_g) + (sum_(g in C_2) U_g t_g) (sum_(g in C_1) V_g t_g)] . $
  Each weighted alternating sum is zero or has its chain’s outermost sign, and has absolute value at least half its outermost weight. The signs of the two chains are opposite, so both displayed products give nonnegative contributions after the leading minus sign. A positive product between distinct chains forces the relevant outermost weights to be at least $q$, giving a contribution of at least $q^2 \/ 16$. ◻
]

We can now finish the detection argument. Lemma 10 makes every same-loop term of $X_(M \, I)$ nonnegative. Lemmas 11 and 12 make its complete different-loop term nonnegative. Thus

#[#set math.equation(numbering: n => "(29)")
 $ X_(M \, I) gt.eq 0 . $ <eq:positive-observable>]

If condition (i) of Proposition 8 occurs, each deep endpoint of the tested arc lies in an eligible arch of its cap. Select those two arches. Moving the endpoints to the marks inside these arches changes no intersection with $I$, since the arches stay strictly on their respective sides of the middle seam. If the tested arc has intersection number $a$ and the whole loop has number $e$, the two mark-to-mark sums have product $a \( a - e \)$. Here $a eq.not 0 \, e$ and $e in { - 1 \, 0 \, 1 }$, so this product is a positive integer. The weighted same-loop term is at least $q_M^2 \/ 2$.

Suppose instead that condition (ii) occurs and no tested arc gives condition (i). Each of its two nonzero arc sums must then equal the corresponding whole-loop sum. The two loops separate the endpoints of $I$ and each has an eligible arch in each cap. In particular there is a distinct pair with $U_g V_(g') > 0$. Their full different-loop sum is at least $q_M^2 \/ 16$. We have proved the pointwise bound

#[#set math.equation(numbering: n => "(30)")
 $ X_(M \, I) gt.eq q_M^2 / 16 thin upright(bold(1))_(E_M ∩ { upright("condition (i) or (ii) holds on ") I }) . $ <eq:pointwise-detection>]

=== 3.4 Summing the short intervals <summing-the-short-intervals>

#proof[
  For a partition interval $I$, combine (21), (23), and (30) to obtain
  $ bb(P) #scale(x: 120%, y: 120%)[\(] E_M ∩ { upright("a violation on ") I } #scale(x: 120%, y: 120%)[\)] lt.eq C_M (frac(\| S \( I \) \|, n))^2 . $
  The transverse size of the limiting rectangle is positive and fixed, so an interval of length at most $h$ contains at most $C \( h \/ delta + 1 \)$ sites and $n gt.eq c \/ delta$. Consequently
  $ frac(\| S \( I \) \|, n) lt.eq C \( h + delta \) . $
  There are at most $C_J \/ h$ intervals. The union bound therefore yields
  #[#set math.equation(numbering: n => "(31)")
   $ bb(P) \( B_(delta \, h) \) lt.eq bb(P) \( E_M^c \) + C_M frac(\( h + delta \)^2, h) . $ <eq:short-union-bound>]
  For each fixed $M$, first take the upper limit as $delta arrow.b 0$ and then let $h arrow.b 0$. The remaining bound is $limsup_(delta arrow.b 0) bb(P) \( E_M^c \)$, which tends to zero as $M arrow.r oo$ by (18). This proves the stated order of limits. The argument used only the sites actually contained in an interval; endpoints outside the rectangle and intervals truncated by a transverse side cause no change. ◻
]

== 4 Localization and compactness of the curves <sec:localization>

The rectangle estimates must be transferred to the specified half-plane measure before they can control its loops. We first couple matching states in a bounded window, uniformly in the lattice mesh. This coupling does not determine connections outside the window. Nevertheless, it preserves the local directed paths needed for both estimates. We then use the traversal bound to obtain compactness in the fixed disk coordinates, retaining every nonconstant limiting loop.

=== 4.1 A uniform comparison with finite rectangles <a-uniform-comparison-with-finite-rectangles>

Write $cal(R)_(delta \, R)$ for a Temperleyan rectangle whose coarse bottom side is at height $delta$, whose other sides are within $O \( delta \)$ of $x = - R$, $x = R$, and $y = R$, and whose lower left coarse corner is deleted. Rounding the sides to the coarse grid gives odd numbers of fine-grid vertices in both directions. The precise rounding will be immaterial. Agreement of matching states on a set means agreement on every edge having at least one endpoint in that set.

#thm([Proposition 4.1.])[
  (Uniform localization).  #emph[Let $K$ be a bounded closed subset of $overline(bb(H))$ and let $epsilon > 0$. There is an $R < oo$ such that, for every sufficiently small $delta$, the two independent half-plane matchings can be coupled with two independent uniform matchings of $cal(R)_(delta \, R)$ so that both matching states agree on $K$ with probability at least $1 - epsilon$.]
] <prop:localization>

Here is the finite graph to which we apply the Temperley correspondence [13] Theorem 1. Let $G$ be the coarse rectangular grid of mesh $2 delta$, including its lower left corner $r$, and let $G^(*)$ be its plane dual, with exterior vertex $f_oo$. The fine-grid vertices are the vertices of $G$, its edge midpoints, and its bounded face centers. A midpoint is joined to the endpoints of its coarse edge and to its incident bounded face centers. Deleting $r$ gives exactly $cal(R)_(delta \, R)$; the exterior face-node is omitted from this matching graph.

A spanning tree $T$ of $G$ is directed toward $r$. Its complementary dual tree $T^(*)$ is directed toward $f_oo$. Each remaining primal vertex is matched to the midpoint of its outgoing edge in $T$. Each bounded face center is matched to the midpoint of the primal edge crossed by its outgoing edge in $T^(*)$. The corner $r$ is incident with the exterior face, so the correspondence is a bijection. All edge weights are one: uniform matchings correspond to uniform primal trees and, by complementation, to uniform dual trees. In $G^(*)$ we retain a separate edge to $f_oo$ for every primal boundary edge, including parallel edges.

Wilson’s algorithm [21,17] samples this finite dual tree by loop-erasing walks stopped on the tree already drawn, starting with $f_oo$. Each walk chooses uniformly among the four edge options at a bounded face. A proposed step crossing a primal boundary edge is absorbed at $f_oo$, and we retain that boundary edge as its physical contact. Theorems 13 and 16 of [17] permit any fixed order of starting sites. We will confine the dual paths needed near $K$ and then recover the primal directions from the cycles they determine. The following walk estimate supplies the uniform attachment probability used in that confinement.

#thm([Lemma 4.2.])[
  (Attachment near an explored branch).  #emph[Fix $1 lt.eq C_0 < oo$. There are constants $C_1 > C_0$ and $p > 0$ with the following property. Let a square-lattice walk have mesh $a_0$, start at $x$ above a horizontal killing boundary, and let $a gt.eq a_0$. Suppose an already explored nearest-neighbor path starts within distance $C_0 a$ of $x$ and runs to that boundary. The probability that the walk hits the path or the killing boundary before leaving $B \( x \, C_1 a \)$ is at least $p$. The constants are independent of the path, the mesh, and the distance of $x$ from the boundary.]
] <lem:walk-attachment>

#proof[
  Adjoin the closed lower half-plane to the explored path. The resulting connected set meets $B \( x \, C_0 a \)$ and extends outside every larger ball. It is therefore enough to give the unrestricted walk a fixed positive probability of tracing a closed circuit surrounding $B \( x \, C_0 a \)$ before leaving $B \( x \, C_1 a \)$. If such a circuit crosses the killing boundary, the killed walk has already stopped, which is also a success.
  Here is a concrete way to force an actual circuit, rather than just a near-return. At unit scale, first cross a small rectangle to the right of the inner ball horizontally. Follow a thin polygonal corridor once around the inner ball and return to cross that same rectangle vertically. The two crossings meet by planarity; the intervening part of the trace contains a closed curve of nonzero winding around the inner ball. All corridors lie in a fixed larger ball. The event can be specified by finitely many crossings with fixed positive margins. Brownian motion has positive probability of following these corridors, and the invariance principle gives a uniform lower bound when $a \/ a_0$ is large. Here the polygonal square walk has mean-zero increments with covariance $1 / 2 I$. Scalar Donsker convergence [8] Theorems 8.1.4 and 8.1.11 gives tightness of its two coordinate processes; the vector central limit theorem for disjoint increment blocks identifies their joint limit as planar Brownian motion with covariance $1 / 2 t I$. The prescribed corridor event contains a uniform open neighborhood of a continuous polygonal route with these crossings and positive margins. Its Brownian probability is positive, so the open-set Portmanteau bound yields the claimed lower bound. This comparison does not depend on the absorbing path. For bounded $a \/ a_0$, force an appropriate finite square-lattice circuit; after enlarging $C_1$, only boundedly many steps and finitely many local lattice configurations are involved. Decreasing the lower bound to cover these cases gives $p > 0$ for all scales. A separating circuit must meet the connected absorbing set, proving the assertion. ◻
]

#proof[
  We first compare one matching in $cal(R)_(delta \, R)$ with one in a larger rectangle. Choose a fixed rectangular window $W_oo$ containing $K$ and a neighborhood of it. For every coarse edge whose midpoint is incident to a fine-grid edge having an endpoint in $K$, explore the dual paths from all bounded faces incident with that coarse edge. These are the finite endpoints of its dual edge; they lie within $O \( delta \)$ of $K$ and hence in $W_oo$ for small $delta$. The explored paths determine the relevant dual edges and, through the fundamental cycles used below, the relevant primal directions. The walk has mesh $2 delta$ until it is absorbed. At the bottom we record the crossed primal edge, using the boundary-contact convention above.
  ===== 4.1.1 Nets and shrinking windows. <nets-and-shrinking-windows.>
  We explore coarse nets before finer ones. Each finer starting site will then be close to a previously drawn path to the bottom. If the net spacing is $a_j$ and the allowed excursion is $b_j$, a walk must miss order $b_j \/ a_j$ opportunities to attach before making such an excursion. We choose these scales so that the failure probabilities remain summable after counting all net sites. Put $a_j = 2^(- j)$ and $b_j = B 2^(- j \/ 2)$, where $B > 0$ is fixed. Enlarge $W_oo$ horizontally and upward by $sum_(ell > j) b_ell$ to obtain $W_j$. Thus $W_(j - 1)$ has a margin $b_j$ around $W_j$, apart from the common bottom boundary. In $W_j$ choose a dual-lattice net $N_j$ of spacing comparable to $a_j$, including sites next to the bottom. It has at most $C a_j^(- 2)$ sites and covers $W_j$ within distance $C a_j$. Run Wilson’s algorithm from these nets in increasing order, starting with $j = 0$ and skipping sites already in the tree. Stop at the unique level $J = J \( delta \)$ for which $2 delta lt.eq a_J < 4 delta$, and take every dual site in $W_J$. Its cardinality is still $O \( 4^J \)$. Thus every required site has been explored.
  Suppose all branches already drawn end on the bottom. At a late level $j$, declare an error if a new walk travels distance $b_j \/ 3$ from its start before attaching. Before this happens, the walk stays inside $W_(j - 1)$. At any intermediate location there is a site of $N_(j - 1)$ within $C a_(j - 1) = O \( a_j \)$, together with its previously drawn path to the bottom. Lemma 14 gives a uniformly positive chance of attachment before the walk leaves a ball of radius $D a_j$. Before the declared error, the walk is at least $2 b_j \/ 3$ from the other three sides of $W_(j - 1)$. Since $D a_j \/ b_j arrow.r 0$, these test balls stay within those sides for all sufficiently large $j$; they may cross the killing boundary. By the strong Markov property at successive ball exits, traveling distance $b_j \/ 3$ without attachment requires at least $c b_j \/ a_j$ failed trials. Consequently its conditional probability is at most
  #[#set math.equation(numbering: n => "(32)")
   $ C exp \( - c b_j \/ a_j \) lt.eq C exp \( - c 2^(j \/ 2) \) . $ <eq:wilson-net-tail>]
  Independence between these trials or between different walks is not needed. The conditional lower bound on attachment suffices.
  Summing over all starts at levels above $j_0$ bounds the late-level error by
  #[#set math.equation(numbering: n => "(33)")
   $ C sum_(j > j_0) 4^j exp \( - c 2^(j \/ 2) \) \, $ <eq:wilson-net-sum>]
  uniformly in $delta$. This tends to zero as $j_0 arrow.r oo$. The final all-sites level obeys the same estimate.
  ===== 4.1.2 The finitely many early walks. <the-finitely-many-early-walks.>
  Fix $j_0$ so that (33) is small. There are boundedly many starts up to that level, all in a fixed bounded window. An unrestricted square-lattice walk started at height at most $H$ obeys, in diffusive time units,
  $ bb(P) \( tau_(upright("bottom")) > T \) lt.eq frac(C \( H + delta \), sqrt(T)) \, #h(2em) bb(P) (max_(s lt.eq T) \| X_s - X_0 \| > A) lt.eq frac(C T, A^2) . $
  The first inequality is the one-dimensional hitting estimate for the lazy vertical coordinate; the second is the martingale maximal inequality. Choosing first $T$ and then $A$ makes the probability of leaving a large window before hitting the bottom arbitrarily small, uniformly for fine meshes. A Wilson walk stops no later if it first hits an earlier branch. A union bound therefore confines all early walks with arbitrarily high probability.
  Choose $R$ to contain this large window and the net windows with their allowed excursions. On the event of no early or late error, every required dual branch lies in $cal(R)_(delta \, R)$ and reaches the wired exterior through its bottom side. Use the same walk increments in $cal(R)_(delta \, R)$ and any larger exhausting rectangle. Their explorations agree exactly on this event. Adding the remaining Wilson branches does not alter paths already drawn.
  ===== 4.1.3 Primal directions. <primal-directions.>
  It remains to recover more than dual edge membership. The matching also uses the directions of primal tree edges toward the deleted corner. Let $e$ be a primal tree edge relevant to $K$. Its crossing dual edge $e^(*)$ is absent from the dual tree. Adding $e^(*)$ creates a dual fundamental cycle, which separates the two components of the primal tree with $e$ removed. The direction of $e$ is from the component not containing the root to the component containing it. The dual branches from the endpoints of $e^(*)$ determine this cycle; these were among the required explored branches.
  If the cycle avoids the wired exterior, it is contained in the bounded exploration window, and the remote corner root lies outside it. If it uses the wired exterior, all its exterior contacts are on the bottom within that same bounded window. Represent the exterior part just below the bottom, between the two contacts. The cycle cuts off a bounded pocket along that bottom interval; the remote corner root is outside the pocket. A bottom primal edge is treated identically, with one contact supplied by $e^(*)$ itself. No contact on a remote side or top can occur on the confinement event. Thus the component containing the root, and hence every required primal direction, is the same in the two rectangles. Planar duality and the Temperley correspondence now give identical matching states on $K$.
  For each fixed mesh the number of matching states on $K$ is finite. Let the comparison rectangle exhaust $bb(H)$ and take a subsequential limit of the coupled window laws. Its second marginal is the specified half-plane local limit, and the agreement bound persists. Extending this window coupling by the respective conditional laws gives the coupling of full matchings. Finally use two independent copies of the construction, with half the allotted error for each copy. This preserves independence within each pair and proves the proposition. ◻
]

=== 4.2 The two geometric consequences in the half-plane <the-two-geometric-consequences-in-the-half-plane>

We next state exactly what is preserved when the connections outside a window change. A directed loop always has the orientation fixed by the matching labels: first-matching edges go from black to white and second-matching edges from white to black. For a directed path portion $alpha$ and a transverse segment $I$, retain the notation $iota_I \( alpha \)$ for its signed intersection sum. The path endpoints are kept off the test line, and the segment endpoints off the lattice graph. A fixed line between lattice columns or rows may be used as a seam; it need not bisect the crossed edges.

#thm([Corollary 4.3.])[
  (Local traversal counts).  #emph[Fix a bounded window $K subset overline(bb(H))$ and two distinct parallel coordinate lines. For horizontal lines assume both have positive height. The maximum total number of parameter-disjoint portions of half-plane double-dimer cycles that lie in $K$ and traverse from one line to the other, in either direction, is tight as $delta arrow.b 0$.]
] <cor:local-crossings>

#proof[
  Apply Proposition 13 to a fixed neighborhood of $K$. On its agreement event, all such portions are also portions of rectangle cycles. Their connections outside $K$ may differ, but their crossing paths and their parameter-disjointness do not. Their number is therefore bounded by the rectangle traversal count of Proposition 4. Take $R$ large enough that both cuts have positive longitudinal room to the rectangle ends. For horizontal cuts this uses their positive heights; for vertical cuts it follows by increasing $R$. The coupling error is arbitrary, so the rectangle tightness gives the assertion. If an original cut contains lattice vertices, use two slightly inward seams instead: every traversal of the original slab crosses the inward seams, whose limiting separation is unchanged. ◻
]

#thm([Proposition 4.4.])[
  (Local exclusion of opposite intersection signs).  #emph[Let $u$ be either the horizontal or vertical coordinate, let $L = { u = c }$ be a test line, and let $J subset L$ be a bounded segment. If $u$ is the vertical coordinate, assume $c > 0$. Fix a bounded window $K subset overline(bb(H))$ and buffers $rho_(-) \, rho_(+) > 0$. Deterministically partition $J$ into $O \( h^(- 1) \)$ intervals of length at most $h$, with endpoints off the graph. Let $E_(delta \, h)$ be the event that, for one of these intervals $I$, one directed half-plane cycle has two portions $alpha \, beta$ contained in $K$ such that each portion has one endpoint in ${ u lt.eq c - rho_(-) }$ and the other in ${ u gt.eq c + rho_(+) }$, and 
$ iota_I \( alpha \) iota_I \( beta \) < 0 . $

 Then 
#[#set math.equation(numbering: n => "(34)")
 $ lim_(h arrow.b 0) limsup_(delta arrow.b 0) bb(P) \( E_(delta \, h) \) = 0 . $ <eq:local-opposite-limit>]

 For a vertical line $L$, the segment may reach or extend below the bottom boundary. Test lines are chosen off lattice vertices; the same estimate holds for seam perturbations of order $delta$.]
] <prop:local-opposite>

#proof[
  Fix a coupling error $epsilon > 0$ and apply Proposition 13 to a neighborhood of $K$. On its agreement event, both directed portions remain rectangle paths with exactly the same signs, because the two matching labels are preserved. There are two possibilities for their new connections. If the portions belong to distinct rectangle cycles, their two nonzero indices give the second forbidden event in Proposition 8. If they belong to the same rectangle cycle $g$, its whole-cycle index satisfies $iota_I \( g \) in { - 1 \, 0 \, 1 }$ by the Jordan curve theorem. Two opposite nonzero integers cannot both equal $iota_I \( g \)$; at least one portion therefore gives the first forbidden event of that proposition.
  The rectangle can be chosen with all required cuts longitudinally interior. For a horizontal middle line, a nonempty event already requires endpoints below it; take its lower cap between those endpoints and the middle line, at positive height. For a vertical middle line there is no corresponding restriction at the bottom: the test interval is transverse, and Proposition 8 permits its truncation at a transverse end. Rotation and reflection give the same argument in both coordinate directions and for either direction of each portion. Consequently
  $ lim_(h arrow.b 0) limsup_(delta arrow.b 0) bb(P) \( E_(delta \, h) \) lt.eq epsilon . $
  Let $epsilon arrow.b 0$. Rounding a cut by $O \( delta \)$ leaves fixed positive buffers and longitudinal room, and the rectangle bounds are uniform under this rounding. Alternatively, along any prescribed mesh sequence one may choose fixed test lines and endpoints avoiding all its lattice sites, as we shall do in Section 5. ◻
]

=== 4.3 From local traversals to compactness in the disk <from-local-traversals-to-compactness-in-the-disk>

We now use Corollary 15 to control parametrizations, not merely the number of loops. The use of crossing control and multiscale time changes to obtain compactness follows the strategy of Aizenman–Burchard [1] Lemma 2.4 and Section 4. We use the direct partition construction below, which requires only our fixed-scale traversal tightness. For a collection of parametrized loops in $overline(bb(D))$, let $N_eta$ be the largest total number of parameter-disjoint portions whose two endpoints have Euclidean distance greater than $eta$. Parameter interiors are disjoint along each individual circle; common endpoints are allowed. Disjointness is automatic between different loops. This number is invariant under reparametrization and reversal.

#thm([Lemma 4.5.])[
  (Detection of disk trips).  #emph[For every $eta > 0$, the random variables $N_eta \( F \( cal(L)_delta \) \)$ are tight as $delta arrow.b 0$.]
] <lem:disk-trips>

#proof[
  The formulas
  #[#set math.equation(numbering: n => "(35)")
   $ \| F \( z \) - 1 \| = frac(2, \| z + i \|) \, #h(2em) \| F' \( z \) \| lt.eq 2 quad \( z in overline(bb(H)) \) $ <eq:compactification-control>]
  give a fixed bounded window in which every macroscopic trip can be detected. Indeed, if two disk endpoints are more than $eta$ apart, one is more than $eta \/ 2$ from $1$. Start the portion at that endpoint, reversing it if necessary, and stop when its disk displacement first reaches $eta \/ 4$. Until then it stays at distance greater than $eta \/ 4$ from $1$, hence its inverse image lies in a bounded half-plane window depending only on $eta$. Its Euclidean endpoint displacement in the half-plane is at least $eta \/ 8$ by (35). One coordinate therefore changes by at least $eta \/ \( 8 sqrt(2) \)$.
  Choose a rectangular grid with spacing much smaller than this last quantity in a slightly larger fixed window. The portion must traverse between a pair of separated grid lines in one coordinate direction. There are only finitely many possible slabs. For a vertical displacement the two detecting horizontal lines can both be taken at positive height, even when the portion starts near the bottom. Horizontal displacement is detected by vertical lines, whose transverse range may include the bottom. Perturb the finitely many lines to seams when needed.
  Restricting parameter-disjoint trips to these detecting portions preserves disjointness. Assign each one a slab it traverses; their number is bounded by the sum of the finitely many local traversal counts in Corollary 15. This proves tightness. ◻
]

#thm([Proposition 4.6.])[
  (Preliminary compactness).  #emph[The laws of $F \( cal(L)_delta \)$ are tight in the collection space of closed-disk curves with the ensemble matching topology, with constant loops discarded. Moreover, the loops can be ordered by decreasing diameter and given measurable, orientation-preserving parametrizations whose joint laws are tight in the product of uniform path spaces. Every subsequential limit has finitely many loops above every positive diameter, and convergence retains all its nonconstant entries. At this stage limiting curves may be nonsimple, touch the boundary, or occur with multiplicity.]
] <prop:tightness>

#proof[
  We will choose measurable parametrized representatives for the joint limit in Section 5 and also prove compactness in the collection metric. The same trip bounds will give both conclusions. First, every loop of diameter greater than $eta$ contributes a trip at that scale, so its number is at most $N_eta$. For a fixed mesh these numbers, and all the trip counts, are finite: the detection argument forces each such trip to use a portion in a bounded lattice window, and the cycles use each lattice edge at most once. In fact, for $delta$ bounded away from zero and bounded above, these counts are bounded deterministically. The total length of lattice edges meeting the detecting window is uniformly bounded in that range of meshes, whereas each detecting portion has a fixed positive endpoint displacement.
  Choose the parametrization of every loop by the following single rule. Start with the image under $F$ of its usual polygonal parametrization, $gamma : \[ 0 \, 1 \] arrow.r overline(bb(D))$, rooted by a fixed measurable rule and oriented by its matching labels. At scale $r_j = 2^(- j)$, partition its parameter interval greedily: from the last partition point stop at the first displacement $r_j$, repeating until time $1$. Delete an empty final interval if necessary. The resulting partition $cal(P)_j$ has
  $ q_j := \| cal(P)_j \| lt.eq N_(r_j \/ 2) + 1 \, $
  and each piece has image diameter at most $2 r_j$. Let $w_j = 2^(- j - 1)$ and put on $\[ 0 \, 1 \]$ the probability measure
  #[#set math.equation(numbering: n => "(36)")
   $ d nu_gamma \( t \) = 1 / 2 thin d t + sum_(j gt.eq 1) w_j / q_j sum_(I in cal(P)_j) frac(upright(bold(1))_I \( t \), \| I \|) thin d t . $ <eq:partition-mass>]
  The cumulative function $theta_gamma \( t \) = nu_gamma \( \[ 0 \, t \] \)$ is a strictly increasing continuous homeomorphism. Use $tilde(gamma) = gamma compose theta_gamma^(- 1)$ as the new parametrization. Greedy stopping times, the measures in (36), and their inverses are measurable functions of the original finite polygonal paths. This rule depends only on the loop, not on any probability tolerance or trip-count bound.
  Now fix $epsilon > 0$. Lemma 17, together with the deterministic bounds for meshes bounded away from zero, lets us choose integers $A_j < oo$ such that
  #[#set math.equation(numbering: n => "(37)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] N_(2^(- j - 1)) lt.eq A_j upright(" for every ") j gt.eq 1 #scale(x: 120%, y: 120%)[\)] gt.eq 1 - epsilon $ <eq:all-trip-scales>]
  uniformly for $0 < delta lt.eq 1$. Allocate error $epsilon 2^(- j)$ at level $j$ and use a union bound. On this event, $q_j lt.eq A_j + 1$ for every loop and every $j$.
  Each interval of $cal(P)_j$ now has duration at least $w_j \/ q_j gt.eq w_j \/ \( A_j + 1 \)$. A time interval shorter than this cannot contain a full partition piece and hence meets at most two adjacent pieces. Its image has diameter at most $4 r_j$. Thus (37) gives a common modulus of continuity for every reparametrized loop. The same argument applies across the identified endpoints of the parameter circle.
  Arzelà–Ascoli now gives a compact set of parametrized representatives on the event (37). Order the loops by decreasing diameter, resolving ties by a fixed enumeration of the finite lattice polygons rescaled to mesh one, and pad a finite list by constant curves. This is measurable: there are only finitely many loops above every positive diameter, so successive largest entries exist and exhaust the list. The joint ordered representatives lie in a compact product, and the diameter counts give a uniform vanishing bound on the tails of the lists.
  For completeness, consider any sequence of lists with these bounds. Take a diagonal subsequence on which each parametrized entry converges uniformly. The limit list has only finitely many entries of diameter greater than any prescribed positive number, by using the count bound at a smaller cutoff. Discard its constant entries. At a given error scale, a fixed finite initial list contains all larger loops on both sides. Match its corresponding nonconstant entries; entries with constant limit are eventually smaller than the error scale. Uniform convergence on this finite list and the vanishing diameter tails give the required partial matching. This proves relative compactness in the ensemble topology as well as tightness of the parametrized lists. The compact closures supplied by these bounds have probability at least $1 - epsilon$, proving the proposition. ◻
]

The distinction between this proposition and the desired conclusion is essential. Traversal bounds retain every macroscopic path, but they do not by themselves exclude collapsed interiors or retracing. Proposition 16, together with the fixed-puncture law, will rule out those possibilities and identify every surviving curve in Section 5.

== 5 From puncture data to convergence of curves <sec:identification>

Proposition 18 retains every macroscopic loop in a subsequential limit, but it allows that loop to touch the boundary or retrace part of its path. We now exclude these possibilities. Theorem 2 first assigns a canonical $upright("CLE")_4$ loop to every limiting loop visible from the punctures. Proposition 16 then rules out all motion away from the assigned trace, as well as backtracking along that trace.

Throughout this section, diameters and uniform convergence are measured after applying $F$. A path in the closed disk is equivalently a path in

$ overline(bb(H))^(thin oo) := overline(bb(H)) union { oo } $

with distance $\| F \( z \) - F \( w \) \|$. Coordinate lines and intersection indices will only be used in bounded parts of the half-plane. Write $bb(T) = bb(R) \/ bb(Z)$ for the parameter circle.

=== 5.1 A joint limit and its puncture signatures <a-joint-limit-and-its-puncture-signatures>

Fix any sequence $delta_n arrow.b 0$. By Proposition 18, pass to a subsequence with convergent ordered, parametrized loop collections. On a suitable probability space their representatives satisfy

#[#set math.equation(numbering: n => "(38)")
 $ F compose gamma_(n \, j) arrow.r F compose gamma_j quad upright("uniformly on ") bb(T) $ <eq:representative-convergence>]

for every retained nonconstant entry $j$. The convergence also retains every loop above each positive diameter, with multiplicity. One may pad a finite list by constants and then discard constant limiting entries. In particular, for each $a > 0$ all loops of diameter at least $a$ lie in a finite initial portion of the lists, eventually. Indeed, choose an index whose limiting diameter is less than $a \/ 2$; its approximating diameter is eventually less than $a$, and diameter ordering gives the same bound for every later entry. We may enlarge this joint realization by further tight coordinates and take further subsequences below.

We choose the test lines before choosing the punctures. For a continuous real function on an interval, the set of its local maximum and minimum #emph[values] is countable. Indeed, each such value is the maximum or minimum on some compact interval with rational endpoints inside a corresponding extremum neighborhood. This argument includes nonstrict extrema and flat intervals. Apply it to the coordinates of all $gamma_j$ in countably many finite parameter charts. Fubini’s theorem gives deterministic countable dense families of vertical lines and positive-height horizontal lines such that, almost surely, none of their levels is a local extremal value of any $gamma_j$. We also avoid every lattice coordinate in the chosen mesh sequence. Consequently, at each visit of a limiting path to a test line, every parameter neighborhood contains points on both strict sides of that line.

On every test line fix successively finer uniform grids, with mesh tending to zero, and bounded testing ranges increasing to cover its finite part. Choose grid origins so that their endpoints avoid the graphs for every $n$. For vertical lines include the intervals meeting height zero; endpoints at nonpositive height have inside indicator zero for every discrete loop. Let

$ Q = { q_1 \, q_2 \, dots.h } subset bb(H) $

contain all interior grid endpoints and be dense in $bb(H)$, with all added points chosen off the countable union of the lattice graphs. All these choices are deterministic. For each fixed $q in Q$ and all sufficiently small meshes, $q$ lies in a unique bounded lattice face. Replacing it by that face center preserves every loop membership, and the centers converge to $q$, as required in Theorem 2. By Proposition 3, almost surely no point of $Q$ lies on a canonical $upright("CLE")_4$ trace.

For each discrete loop define

$ a_(n \, j) \( q \) = upright(bold(1)) { q upright(" lies inside ") gamma_(n \, j) } \, #h(2em) q in Q . $

Set all these indicators to zero for a padded constant entry. Adjoin these binary coordinates and the finite-puncture multiset records to the joint subsequence. The binary product is compact; the finite-puncture coordinates are tight by Theorem 2. The ambient space is the Polish product

$ C \( bb(T) \, overline(bb(D)) \)^(bb(N)) times { 0 \, 1 }^(bb(N) times bb(N)) times product_(m gt.eq 1) cal(R)_m \, $

where $cal(R)_m$ is the countable discrete space of finite reduced multiset records for $q_1 \, dots.h \, q_m$. Choose a compact restriction in each coordinate with a summable allocation of the error probability. Their product is compact, and the union bound proves joint tightness without any independence assumption. The Prokhorov and Skorokhod theorems [5] Theorems 4.1 and 3.3 therefore supply a further subsequence and a realization on one probability space such that

#[#set math.equation(numbering: n => "(39)")
 $ a_(n \, j) \( q \) = a_j \( q \) quad upright("eventually, for each fixed ") j \, q . $ <eq:signature-stability>]

The limiting path marginal is unchanged by this further extraction and realization, so the probability-one generic-line property chosen above still holds. We call ${ q in Q : a_j \( q \) = 1 }$ the #emph[signature] of the entry $j$. This definition does not assert that the signature is already realized by the winding of $gamma_j$.

#thm([Lemma 5.1.])[
  (Identification of the visible signatures).  #emph[There is a coupling with a standard nested $upright("CLE")_4$ collection $cal(C)$ such that the limiting entries whose signatures contain at least two points are in bijection with the loops of $cal(C)$, preserving all memberships in $Q$. Every other nonconstant entry has empty signature.]
] <lem:visible-signatures>

#proof[
  A loop enclosing two distinct points $q \, q'$ has disk diameter at least $\| F \( q \) - F \( q' \) \|$: its enclosed disk domain lies in the convex hull of its boundary. Thus all entries containing this pair belong to an eventually finite initial portion of the ordered lists. Their stabilized memberships in every larger finite puncture set agree with the corresponding limiting multiset record. Theorem 2, applied to the largest of any finite family of puncture sets, gives the joint law of all these records.
  These finite records determine the full collection of signatures containing at least two points. Fix a pair $q \, q'$. There are finitely many signatures containing it. Their restrictions to increasing finite subsets of $Q$ determine that finite multiset of binary sequences: one can choose consistent identifications by passing through the finitely many permutations of its entries. To combine the records without counting a signature again for each pair it contains, enumerate the unordered pairs in $Q$ and assign each full signature to its first contained pair. Its multiplicity is the one recovered from that pair’s record. This determines the entire signature multiset, which therefore has the same law as the corresponding multiset for nested $upright("CLE")_4$.
  To couple an actual collection $cal(C)$ with these records, realize standard nested $upright("CLE")_4$ on a standard Borel probability space, for example using its loop-soup construction and countably many independent copies for the nested generations. Condition that underlying randomness on its countable puncture record, using the regular conditional distribution theorem [8] Theorems 4.1.17–4.1.18, and sample the resulting conditional law at our limiting record. More explicitly, if $Y$ denotes all the already coupled paths and records, $R \( Y \)$ their limiting puncture record, and $K \( r \, d omega \)$ this conditional kernel for the canonical construction, extend the probability law by
  $ bb(P)_Y \( d y \) thin K \( R \( y \) \, d omega \) . $
  Integrating out $omega$ preserves the entire original joint law of $Y$, while integrating over $y$ gives the standard canonical law because $R \( Y \)$ has its required marginal distribution. The two puncture records agree almost surely by the defining property of the conditional kernel. This gives the required coupling without any assumption about completeness of the curve quotient.
  Every canonical loop has a nonempty open interior and therefore contains two points of $Q$. Distinct canonical loops have distinct signatures, because their interiors differ on an open set. This gives the claimed bijection for signatures of size at least two, with no duplicate visible entries.
  It remains to exclude a singleton signature. Suppose a nonconstant additional entry has signature ${ q }$ and diameter $a > 0$. Proposition 3 supplies infinitely many canonical loops around $q$. Every such loop contains another sampled point $q'$, so its corresponding discrete loop eventually contains $q$ and $q'$, whereas the additional discrete loop contains $q$ but not $q'$. Discrete loops are disjoint or nested. The canonical loop’s discrete representative must therefore enclose the additional one. Its limiting diameter is at least $a$. Applying this argument to every finite number of the infinitely many canonical loops contradicts the finiteness of the limiting collection above diameter $a \/ 2$. A nonvisible nonconstant entry consequently has empty signature. ◻
]

=== 5.2 Fixed tests followed by a slowly refining grid <fixed-tests-followed-by-a-slowly-refining-grid>

We next combine signature stabilization with the geometric estimate. The order of limits matters: no puncture convergence theorem with colliding or mesh-dependent punctures will be used.

Enumerate the test lines and their fixed bounded testing ranges, bounded windows with rational coordinate bounds, and positive rational side buffers. For each finite initial batch, Proposition 16 says that the probability of any opposite-sign violation on its grid intervals tends to zero when the grid mesh tends to zero #emph[after] the lattice-mesh upper limit. Choose a sufficiently fine grid level for the first batch, then a lattice-mesh threshold making this failure probability small. At that fixed grid level, there are only finitely many endpoint indicators for any fixed finite prefix of the loop list. Equation (39) lets us decrease the lattice-mesh threshold so that failure of their simultaneous stabilization is also small. Repeat with increasing batches and loop prefixes, using a summable sequence of error probabilities.

Passing to the resulting subsequence and applying Borel–Cantelli gives grid levels $r_n arrow.r oo$ with the following almost-sure property. For every fixed finite batch, eventually its level-$r_n$ intervals have no local opposite-sign violation, and all indicators used for each fixed finite prefix of loops agree with their stabilized signatures. The grids themselves were fixed before any of these lattice-mesh thresholds were chosen. We shall use this procedure again after identifying the traces, adding further countably many coordinates which are then known to stabilize.

Here and below, a directed #emph[subpath] means a restriction to a parameter interval; it need not be injective in the limit. For a directed bounded path $alpha$ and an oriented line interval $I = \[ u \, v \]$, with $u \, v$ off its image and the path endpoints off the line, denote its oriented intersection index by $iota_I \( alpha \)$, with the convention of Proposition 16. Orient $I$ consistently with that convention. For polygonal paths this is the signed crossing sum. In general, close $alpha$ by a path avoiding $I$ and set

$ iota_I \( alpha \) = "wind" \( alpha upright(" with its closing path") \, u \) - "wind" \( alpha upright(" with its closing path") \, v \) . $

The value does not depend on the closing path, since a closed path avoiding $I$ has equal winding about its endpoints. This definition is additive under concatenation and stable under uniform perturbations avoiding $u \, v$, with endpoints staying off the test line. For a Jordan loop it is, up to the loop’s orientation, the difference of the two inside indicators. In particular, it belongs to ${ 0 \, 1 \, - 1 }$.

The following elementary partition observation permits use of Proposition 16, despite potentially infinitely many line hits.

#thm([Lemma 5.2.])[
  (Partition into eligible portions).  #emph[Let $gamma : bb(T) arrow.r overline(bb(H))^(thin oo)$ be continuous, and let $L$ be a coordinate line whose level is not a local extremal value of the corresponding coordinate of $gamma$ at finite locations. For every bounded segment $K subset L$, there is a finite parameter partition such that every piece meeting $K$ has endpoints on opposite strict sides of $L$ and lies in a bounded window. The other pieces stay off $K$ under sufficiently small uniform perturbations. The same assertion holds while retaining a prescribed bounded subpath with opposite-side endpoints as one unsplit piece, provided that subpath is considered separately when choosing the small-oscillation partition.]
] <lem:opposite-partition>

#proof[
  Take a finite small-oscillation partition, so fine in the disk metric that pieces meeting a neighborhood of $K$ lie in a bounded window. Choose their endpoints off $L$; such parameter values are dense by the assumed absence of extremal levels. A piece touching $L$ with endpoints on the same side contains a point on the other side, again by that assumption. Split it once at this point. The two resulting pieces have opposite-side endpoints. Pieces already having opposite-side endpoints need no alteration. Each remaining piece has compact image disjoint from $K$, and hence stays disjoint under sufficiently small perturbations. Enlarging $K$ slightly at the start avoids issues at its ends. To retain a prescribed subpath, begin with its endpoints in the partition and perform this construction on the complementary parameter interval. The relevant bounded pieces have finitely many endpoints, so their strict distances from $L$ have a positive minimum. ◻
]

Thus all pieces relevant to a fixed bounded test range satisfy some fixed positive side buffers. On sufficiently close discrete approximations they satisfy the same conditions. Realized partitions do not require an uncountable extension of the probability estimate: that estimate already quantifies over #emph[all] subpaths within the fixed window and buffers. The countable families of windows and rational buffers cover every partition just constructed.

=== 5.3 Excluding invisible paths and identifying the traces <excluding-invisible-paths-and-identifying-the-traces>

Fix a nonconstant limiting entry $gamma_j$. For a bounded testing range on a selected line, apply Lemma 20. On every interval of the slowly refining grids, all nonzero indices of the resulting discrete portions have the same sign, by Proposition 16. Their sum is the whole-loop index. Consequently,

#[#set math.equation(numbering: n => "(40)")
 $ iota_I \( alpha_n \) eq.not 0 quad arrow.r.double quad a_(n \, j) \( u \) eq.not a_(n \, j) \( v \) #h(2em) \( I = \[ u \, v \] \) $ <eq:no-cancellation>]

for every retained portion $alpha_n$ of this partition. Endpoints outside $bb(H)$ are understood to have indicator zero.

There is a useful local consequence. Suppose a subpath of $gamma_j$ stays in a small finite ball and crosses a selected line from one strict side to the other. Retain that subpath in the partition. Its discrete approximation has net signed crossing $+ 1$ or $- 1$ with the entire line. Since the approximation stays in a slightly enlarged ball, that crossing is the sum of its indices on grid intervals in the enlarged ball. At least one of those indices is nonzero. Equation (40) then forces an endpoint-indicator switch on one such interval. For sufficiently fine grids all relevant intervals lie in any fixed larger ball. By the simultaneous stabilization already arranged, the same switch occurs in the limiting signature.

#thm([Lemma 5.3.])[
  (Identification of traces and degree).  #emph[There is no nonconstant entry with empty signature. Each remaining limiting path has exactly the trace of its corresponding loop of $cal(C)$ and traverses it with absolute degree one.]
] <lem:trace-identification>

#proof[
  An empty signature permits no endpoint-indicator switch at any interior grid endpoints, nor at exterior endpoints, whose indicator is zero. The local consequence above therefore excludes every finite subpath crossing a test line. Every genuine finite movement can be separated by one of the dense coordinate lines. A nonconstant path visiting infinity also has a nonconstant finite portion. Thus an empty-signature path would have to be constant, a contradiction.
  Now let $C in cal(C)$ be the canonical loop paired with $gamma_j$. In any finite open ball disjoint from $C$, the canonical inside indicator is constant. If the ball meets the real boundary, that value is zero, including at exterior points. Hence the signature allows no switch on sufficiently interior grid intervals in this ball. Any motion of $gamma_j$ in a smaller ball would give the forbidden switch just proved. A nonconstant path visiting a point off $C$ must make such a motion: even if it pauses at that point, continuity forces motion in the complementary open set when it reaches or leaves the pause. A visit to infinity similarly has finite portions off the compact curve $C$. We conclude that the trace of $gamma_j$ is contained in $C$; in particular it is finite and interior.
  Choose $q in Q$ inside $C$. It is off $C$, and its stabilized indicator is one. Uniform convergence now takes place in a bounded Euclidean neighborhood of $C$, and preserves winding about $q$. Every sufficiently late simple approximating loop has absolute winding one about $q$, so the limiting path has absolute winding one. Identifying $C$ with a circle shows that $gamma_j$ has degree $+ 1$ or $- 1$ as a map into $C$. A nonzero-degree map of the circle is surjective. Its trace is therefore all of $C$. ◻
]

This has identified the sets traced by all macroscopic loops and their multiplicities. It has not yet identified their classes in the curve metric: a degree-one traversal can move backward over a substantial arc before continuing forward. The final geometric estimate excludes precisely this behavior.

=== 5.4 The exclusion of backtracking <the-exclusion-of-backtracking>

We first make explicit a local fact about Jordan curves. No smoothness or transverse derivative is assumed.

#thm([Lemma 5.4.])[
  (A generic coordinate line sees both Jordan domains).  #emph[Let $C$ be a Jordan curve, let $p in C$, and let $L$ be a vertical or horizontal line through $p$. Suppose every open Jordan subarc around $p$ contains points on both strict sides of $L$. Then every neighborhood of $p$ along $L$ contains points in both complementary domains of $C$.]
] <lem:jordan-line>

#proof[
  By the Schoenflies theorem [6] Section 1, choose a plane homeomorphism $h$ taking the unit circle to $C$, with $h \( q \) = p$. Given $epsilon > 0$, take a small round disk $B$ centered at $q$ such that $h \( B \) subset B_epsilon \( p \)$. The images of
  $ B ∩ bb(D) quad upright("and") quad B ∩ \( bb(C) \\ overline(bb(D)) \) $
  are connected, and each has the open subarc $h \( B ∩ partial bb(D) \)$ in its closure. If one complementary domain of $C$ missed $L ∩ B_epsilon \( p \)$, its corresponding connected image would avoid $L$ and hence lie in one strict half-plane. Its closure would put that entire Jordan subarc in the corresponding closed half-plane, contrary to the hypothesis. Both complementary domains therefore meet $L ∩ B_epsilon \( p \)$. ◻
]

All fixed grid endpoints now avoid the limiting traces: interior endpoints belong to $Q$, and the traces themselves lie in $bb(H)$. Fix a finite grid, a finite prefix of retained nonconstant entries, and finitely many directed parameter intervals with rational endpoints. For each such interval whose two limiting path endpoints are strictly off its test line, uniform convergence preserves its index on every interval of the grid for all sufficiently large $n$. A parameter interval with a limiting endpoint on the line imposes no test. There are only finitely many tests, and each included pair has a positive realized distance from its line. Their simultaneous failure probability therefore tends to zero by bounded convergence.

Repeat the earlier diagonal selection with these additional index equalities. At stage $k$, choose a finer deterministic grid for the first $k$ geometric tests, then keep that grid fixed while choosing $n_k$ for the first $k$ retained entries and rational parameter intervals. The geometric violations, membership mismatches, and new index mismatches can together be given probability less than $2^(- k)$. Borel–Cantelli yields their eventual exclusion for every fixed test, entry, and rational interval whose limiting endpoints are off the line. The indices can be added only at this stage: trace identification has supplied the avoidance of grid endpoints needed for their stability. This second extraction preserves all the earlier almost-sure conclusions and again fixes each finite grid before taking the lattice mesh sufficiently small.

#thm([Lemma 5.5.])[
  (No reverse passage).  #emph[Each path $gamma_j$ is a weakly monotone once-around traversal of its canonical Jordan curve. In particular, it has zero curve distance from a simple parametrization of that curve.]
] <lem:no-backtracking>

#proof[
  Reverse the orientation if needed so that the degree is $+ 1$. Let $eta : bb(R) \/ bb(Z) arrow.r C$ be a positively oriented homeomorphism. There is a continuous lift $phi.alt : bb(R) arrow.r bb(R)$ with
  $ gamma_j \( t \) = eta \( phi.alt \( t \) med mod med 1 \) \, #h(2em) phi.alt \( t + 1 \) = phi.alt \( t \) + 1 . $
  If $phi.alt$ is not nondecreasing, choose two lift values $alpha < beta$, with $beta - alpha < 1$, that it crosses in the decreasing direction. The points $eta \( alpha med mod med 1 \)$ and $eta \( beta med mod med 1 \)$ are distinct, so one planar coordinate separates them. Select a test line $L$ strictly between those coordinate values.
  First and last hitting times extract a downward passage on $\[ s \, t \]$ from $beta$ to $alpha$ whose lift remains in $\[ alpha \, beta \]$. Since $phi.alt \( s + 1 \) = beta + 1$, necessarily $t < s + 1$. The same identity guarantees a subsequent upward passage from $alpha$ to $beta$ before time $s + 1$; extract it in the same way. Thus both passages lie in one period and have disjoint time interiors, their endpoints are on opposite sides of $L$, and both traces equal the proper Jordan subarc
  $ K = eta \( \[ alpha \, beta \] \) . $
  As paths within $K$, they are homotopic relative to endpoints to its two opposite traversals, by linear homotopy of their lifts.
  Choose a point $p in eta \( \( alpha \, beta \) \) ∩ L$. It is not a local coordinate extremum on $C$: such an intrinsic extremum would give a local extremum of the same coordinate at any time when $gamma_j$ visits it, contrary to the choice of the test line. Take a disk around $p$ meeting $C$ only in the common open subarc $eta \( \( alpha \, beta \) \)$. Lemma 22 supplies open intervals on $L$ within this disk lying in the two different Jordan domains. At every sufficiently fine grid level there are grid endpoints in both intervals. Among consecutive endpoints between them, some adjacent pair $u \, v$ has different inside indicators. Its interval $I = \[ u \, v \]$ remains in the disk, and all intersections of $C$ with $I$ lie in the common open subarc.
  The two passages have opposite nonzero indices on $I$. Indeed, the homotopies within $K$ identify their indices with opposite traversals of $K$, and the rest of the Jordan curve avoids $I$. Additivity thus identifies either index, up to sign, with the full Jordan-curve index on $I$, which is the difference of its endpoint indicators and has absolute value one.
  We may replace the four passage endpoint times by nearby rational times, perturbing inward so that the time interiors remain disjoint. Choose these perturbations so that their removed path pieces remain near the original endpoints, away from the disk just selected. Their endpoints still lie on opposite strict sides of $L$, and their indices on every interval in that disk are unchanged. Both resulting portions lie in a fixed bounded window and have fixed positive side buffers. The repeated slow-grid extraction transfers their opposite nonzero indices to the discrete loop for all sufficiently late members of the subsequence. This contradicts Proposition 16.
  Thus $phi.alt$ is nondecreasing. A nondecreasing degree-one parametrization differs from a homeomorphic parametrization only by pauses in the curve metric. Explicitly, the strictly increasing lifts
  $ phi.alt_epsilon \( t \) = frac(phi.alt \( t \) + epsilon t, 1 + epsilon) $
  converge uniformly on one period to $phi.alt$ and satisfy $phi.alt_epsilon \( t + 1 \) = phi.alt_epsilon \( t \) + 1$. Their circle homeomorphisms give zero distance to the simple parametrization $eta$. ◻
]

=== 5.5 The required collection space and the full limit <the-required-collection-space-and-the-full-limit>

Every nonconstant limiting entry is now one canonical $upright("CLE")_4$ loop as a curve, and every canonical loop occurs once. Proposition 18 controls the positive-diameter tails, so each closed-disk limit has exactly the nested $upright("CLE")_4$ law. Since the starting mesh sequence was arbitrary, the subsequence criterion gives full convergence in this ambient space.

The remaining task is to obtain compact containment in the interior collection space. The following lemma separates this topological step from the identification of the curves. Write $X$ for the closed-disk collection space with metric $rho$, and $S subset X$ for its subspace of interior collections.

#thm([Lemma 5.6.])[
  (Restriction to interior collections).  #emph[Let $mu_delta$, $0 < delta lt.eq 1$, and $mu$ be probability laws on $X$ supported on $S$. Suppose that $mu_delta arrow.r.double mu$ in $X$ as $delta arrow.b 0$, that the family $\( mu_delta \)_(0 < delta lt.eq 1)$ is uniformly tight in $X$, and that $\( mu_delta \)_(a lt.eq delta lt.eq 1)$ is uniformly tight in $S$ for every $a > 0$. Then $mu_delta arrow.r.double mu$ in $S$, and the entire family is uniformly tight in $S$.]
] <lem:interior-restriction>

#proof[
  For $m gt.eq 1$, let
  $ B_m = { cal(L) : upright("some loop in ") cal(L) upright(" has diameter at least ") 1 \/ m upright(" and meets ") partial bb(D) } . $
  Each $B_m$ is closed. To see this, along convergent partial matchings a witnessing loop must match one of the finitely many limiting loops of diameter at least $1 \/ \( 2 m \)$. Pass to a subsequence using the same limiting entry. Uniform curve convergence preserves the diameter bound and boundary contact. The space $S$ of interior loop collections is consequently
  #[#set math.equation(numbering: n => "(41)")
   $ S = ⋂_(m gt.eq 1) B_m^(thin c) . $ <eq:interior-space>]
  An open subset of $S$ is $G ∩ S$ for an ambient open set $G$. Since all the laws give $S$ probability one, the open-set Portmanteau inequality in $X$ gives the same inequality in $S$, proving the asserted weak convergence.
  Fix $epsilon > 0$ and choose an ambient compact set $K$ with $mu_delta \( K \) gt.eq 1 - epsilon \/ 2$ for every $0 < delta lt.eq 1$. For each $m$, a $mu$-distributed collection has strictly positive distance from $B_m$. Ambient weak convergence, applied to a sufficiently small closed distance sublevel set, therefore gives a radius $a_m > 0$ and a threshold $delta_m > 0$ such that
  $ mu_delta { cal(L) : "dist" \( cal(L) \, B_m \) < a_m } < epsilon thin 2^(- m - 1) \, #h(2em) 0 < delta < delta_m . $
  For $delta_m lt.eq delta lt.eq 1$, uniform tightness in $S$ supplies a compact subset of $S$ carrying probability greater than $1 - epsilon 2^(- m - 1)$ for every such law. This compact set has positive distance from the closed set $B_m$. Decreasing $a_m$ accordingly makes the displayed bound hold for every $0 < delta lt.eq 1$. Hence
  $ K ∩ ⋂_(m gt.eq 1) { cal(L) : "dist" \( cal(L) \, B_m \) gt.eq a_m } $
  is compact, lies in $S$, and has probability at least $1 - epsilon$ under every $mu_delta$. This proves uniform tightness in $S$. ◻
]

For our laws, only tightness on compact positive mesh intervals remains to be checked. On any fixed lattice the possible finite cycles form a countable set, and each cycle can occur at most once. At each positive diameter cutoff, choose finitely many such cycles to capture every loop above that cutoff with arbitrarily high probability. Make the errors summable over decreasing cutoffs. The collections of distinct fixed-lattice cycles satisfying all these restrictions form a compact subset of $S$: diagonalize membership of the possible cycles, and at any fixed cutoff match the finitely many retained cycles exactly. The unmatched tails have vanishing diameter. Thus the fixed lattice law is tight in $S$.

Moreover, $cal(L)_delta$ has exactly the law of $delta cal(L)_1$. The maps

$ T_delta = F compose \( z mapsto delta z \) compose F^(- 1) $

are jointly continuous on $\[ a \, b \] times overline(bb(D))$ for every $0 < a < b < oo$. They induce jointly continuous maps on collections as well: their common modulus of continuity controls the distances of matched loops and the diameters of unmatched loops, while a change in $delta$ changes $T_delta$ uniformly. Images of a compact restriction for $F \( cal(L)_1 \)$ under these maps are compact subsets of $S$. The laws with $delta in \[ a \, b \]$ are therefore uniformly tight in $S$.

#proof[
  #emph[Completion of the proof of Theorem 1.] We have identified every subsequential closed-disk limit as standard nested $upright("CLE")_4$, with every macroscopic loop matched and with multiplicity one, and hence obtained full ambient convergence. Proposition 18 supplies uniform ambient tightness for $0 < delta lt.eq 1$. The discrete laws and the identified limit are supported on $S$, and the preceding scaling argument gives tightness in $S$ on each compact positive mesh interval. Lemma 24 therefore gives the claimed convergence and tightness in the interior collection topology. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Aizenman and A.~Burchard, #emph[Hölder regularity and dimension bounds for random curves], Duke Mathematical Journal #strong[99] (1999), 419--453. #link("https://doi.org/10.1215/S0012-7094-99-09914-3")[doi:10.1215/S0012-7094-99-09914-3].]
#bibitem([2])[T.~Bai and Y.~Wan, #emph[On the crossing estimates for simple conformal loop ensembles], International Mathematics Research Notices #strong[2023] (2023), no.~13, 11645--11683. #link("https://doi.org/10.1093/imrn/rnac173")[doi:10.1093/imrn/rnac173]. Preprint version: #link("https://arxiv.org/abs/2106.11088v3")[arXiv:2106.11088v3].]
#bibitem([3])[M.~Basok and D.~Chelkak, #emph[Tau-functions à la Dubédat and probabilities of cylindrical events for double-dimers and CLE(4)], Journal of the European Mathematical Society #strong[23] (2021), no.~8, 2787--2832. #link("https://doi.org/10.4171/JEMS/1072")[doi:10.4171/JEMS/1072].]
#bibitem([4])[M.~Basok and K.~Izyurov, #emph[Nesting of double-dimer loops: local fluctuations and convergence to the nesting field of CLE(4)], preprint (2025), #link("https://arxiv.org/abs/2501.01574v1")[arXiv:2501.01574v1].]
#bibitem([5])[P.~Billingsley, #emph[Weak Convergence of Measures: Applications in Probability], CBMS-NSF Regional Conference Series in Applied Mathematics, vol.~5, SIAM, Philadelphia, 1971. #link("https://doi.org/10.1137/1.9781611970623")[doi:10.1137/1.9781611970623].]
#bibitem([6])[S.~S.~Cairns, #emph[An elementary proof of the Jordan--Schoenflies theorem], Proceedings of the American Mathematical Society #strong[2] (1951), no.~6, 860--867. #link("https://doi.org/10.2307/2031698")[doi:10.2307/2031698].]
#bibitem([7])[J.~Dubédat, #emph[Double dimers, conformal loop ensembles and isomonodromic deformations], Journal of the European Mathematical Society #strong[21] (2019), no.~1, 1--54. #link("https://doi.org/10.4171/JEMS/830")[doi:10.4171/JEMS/830].]
#bibitem([8])[R.~Durrett, #emph[Probability: Theory and Examples], fifth-edition author manuscript, Version~5, January~11, 2019. #link("https://sites.math.duke.edu/~rtd/PTE/PTE5_011119.pdf")[Author-hosted text].]
#bibitem([9])[I.~Gessel and G.~Viennot, #emph[Binomial determinants, paths, and hook length formulae], Advances in Mathematics #strong[58] (1985), 300--321. #link("https://doi.org/10.1016/0001-8708(85)90121-5")[doi:10.1016/0001-8708(85)90121-5].]
#bibitem([10])[P.~W.~Kasteleyn, #emph[The statistics of dimers on a lattice: I. The number of dimer arrangements on a quadratic lattice], Physica #strong[27] (1961), 1209--1225. #link("https://doi.org/10.1016/0031-8914(61)90063-5")[doi:10.1016/0031-8914(61)90063-5].]
#bibitem([11])[R.~Kenyon, #emph[Dominos and the Gaussian free field], Annals of Probability #strong[29] (2001), 1128--1137. #link("https://arxiv.org/abs/math-ph/0002027")[arXiv:math-ph/0002027].]
#bibitem([12])[R.~Kenyon, #emph[Conformal invariance of loops in the double-dimer model], Communications in Mathematical Physics #strong[326] (2014), no.~2, 477--497. #link("https://doi.org/10.1007/s00220-013-1881-0")[doi:10.1007/s00220-013-1881-0].]
#bibitem([13])[R.~W.~Kenyon, J.~G.~Propp and D.~B.~Wilson, #emph[Trees and matchings], Electronic Journal of Combinatorics #strong[7] (2000), no.~1, Research Paper~R25, 34~pp. #link("https://doi.org/10.37236/1503")[doi:10.37236/1503].]
#bibitem([14])[R.~W.~Kenyon and D.~B.~Wilson, #emph[Boundary partitions in trees and dimers], Transactions of the American Mathematical Society #strong[363] (2011), no.~3, 1325--1364. #link("https://doi.org/10.1090/S0002-9947-2010-04964-5")[doi:10.1090/S0002-9947-2010-04964-5]. Preprint version: #link("https://arxiv.org/abs/math/0608422v4")[arXiv:math/0608422v4].]
#bibitem([15])[E.~H.~Lieb, #emph[Solution of the dimer problem by the transfer matrix method], Journal of Mathematical Physics #strong[8] (1967), 2339--2341. #link("https://doi.org/10.1063/1.1705163")[doi:10.1063/1.1705163].]
#bibitem([16])[B.~Lindström, #emph[On the vector representations of induced matroids], Bulletin of the London Mathematical Society #strong[5] (1973), 85--90. #link("https://doi.org/10.1112/blms/5.1.85")[doi:10.1112/blms/5.1.85].]
#bibitem([17])[J.~G.~Propp and D.~B.~Wilson, #emph[How to get a perfectly random sample from a generic Markov chain and generate a random spanning tree of a directed graph], Journal of Algorithms #strong[27] (1998), 170--217. #link("https://doi.org/10.1006/jagm.1997.0917")[doi:10.1006/jagm.1997.0917].]
#bibitem([18])[J.~Rasmussen and P.~Ruelle, #emph[Refined conformal spectra in the dimer model], Journal of Statistical Mechanics: Theory and Experiment (2012), P10002. #link("https://doi.org/10.1088/1742-5468/2012/10/P10002")[doi:10.1088/1742-5468/2012/10/P10002].]
#bibitem([19])[S.~Sheffield and W.~Werner, #emph[Conformal loop ensembles: the Markovian characterization and the loop-soup construction], Annals of Mathematics (2) #strong[176] (2012), no.~3, 1827--1917. #link("https://doi.org/10.4007/annals.2012.176.3.8")[doi:10.4007/annals.2012.176.3.8].]
#bibitem([20])[H.~N.~V.~Temperley and M.~E.~Fisher, #emph[Dimer problem in statistical mechanics---an exact result], Philosophical Magazine #strong[6] (1961), 1061--1063. #link("https://doi.org/10.1080/14786436108243366")[doi:10.1080/14786436108243366].]
#bibitem([21])[D.~B.~Wilson, #emph[Generating random spanning trees more quickly than the cover time], in #emph[Proceedings of the Twenty-Eighth Annual ACM Symposium on Theory of Computing (STOC '96)], ACM, New York, 1996, pp.~296--303. #link("https://doi.org/10.1145/237814.237880")[doi:10.1145/237814.237880].]


