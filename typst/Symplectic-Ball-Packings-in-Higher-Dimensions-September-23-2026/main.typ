#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Symplectic Ball Packings in Higher Dimensions]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <intro:section>

Symplectic ball packing asks how much of a volume-preserving embedding problem is constrained by symplectic rigidity. For $R > 0$, write

$ B^(2 n) \( R \) = {z in bb(C)^n : pi sum_(j = 1)^n \| z_j \|^2 lt.eq R} \, #h(2em) omega_0 = sum_(j = 1)^n upright(d) x_j and upright(d) y_j . $

Thus $R$ is the capacity, the Euclidean radius is $sqrt(R \/ pi)$, and $"vol" B^(2 n) \( R \) = R^n \/ n !$. We ask when finitely many such balls can be embedded symplectically into the interior of a target ball. An embedding of a closed ball is understood to be a symplectic embedding defined on an open neighborhood of it. For a finite disjoint union, the compact images of the closed balls must be pairwise disjoint.

#thm([Theorem 1.1.])[
  #emph[Let $n gt.eq 3$ and $k gt.eq 1$ be integers. For positive real numbers $R \, R_1 \, dots.h \, R_k$, there exists a symplectic embedding 
$ union.sq.big_(i = 1)^k B^(2 n) \( R_i \) arrow.r.hook "int" B^(2 n) \( R \) $

 if and only if 
#[#set math.equation(numbering: n => "(1.1)")
 $ sum_(i = 1)^k R_i^n < R^n \, #h(2em) R_i + R_j < R quad \( 1 lt.eq i < j lt.eq k \) . $ <intro:inequalities>]

]
] <intro:main>

The first inequality is the volume obstruction. The second is Gromov’s two-ball obstruction [13]; it expresses a restriction invisible to volume alone. Theorem 1 proves that these obstructions are complete in every real dimension at least six, resolving Siegel and Yao’s Conjecture A positively [23]. For one ball the pairwise condition is vacuous. The strict inequalities reflect the closed-source, open-target convention.

=== 1.1 Packing rigidity and stability <packing-rigidity-and-stability>

Gromov’s pseudoholomorphic-curve method gives the two-ball obstruction in every dimension, and further packing obstructions in dimension four [13] Section 0.3.B. McDuff and Polterovich developed the connection with algebraic geometry [17]. Explicit constructions form a complementary strand: Traynor developed symplectic packing constructions [25], and Schlenk developed planar constructions and higher-dimensional folding methods [22,21]. In real dimension four, additional obstructions remain essential, so the two inequalities in Theorem 1 do not give a criterion there.

Biran’s work [1,2] established packing stability: on a closed symplectic four-manifold with rational symplectic class, every sufficiently large number of equal balls can fill an arbitrarily large fraction of the volume. Buse and Hind extended equal-ball stability to higher-dimensional balls and projective spaces and then to all closed rational symplectic manifolds [6,7]. For unequal balls, Buse, Hind, and Opshtein proved strong packing stability on every closed symplectic four-manifold, with all capacities required to be sufficiently small [8]. These results identify regimes in which volume suffices; the question here concerns every finite collection of arbitrary capacities in a ball.

Siegel and Yao formulate this higher-dimensional question and also study stabilized packing problems [23]. Their theorems on products of four-dimensional balls with a fixed closed symplectic surface retain four-dimensional packing obstructions. Theorem 1 concerns balls themselves, with arbitrary unequal capacities and arbitrary finite numbers of components.

=== 1.2 From a mean area inequality to ball embeddings <from-a-mean-area-inequality-to-ball-embeddings>

Normalize the target capacity to one. The common construction uses a surface of positive genus as a base and a toric domain in $bb(C)^m$, where $m = n - 1$, as a fiber. The fiber is specified by a downward polytope $Delta subset bb(R)_(gt.eq 0)^m$ in the moment coordinates $p_j = pi \| z_j \|^2$: lowering any coordinate keeps a point in $Delta$. Write $H \( p \) > 0$ for the limiting total area of the base at fixed moment $p$, obtained by exhausting a punctured surface by compact bordered pieces. A ball of auxiliary capacity $r_i$, chosen strictly larger than the corresponding requested capacity, requires the area profile

$ (r_i - sum_(j = 1)^m p_j)_(+) \, #h(2em) x_(+) = max \( x \, 0 \) . $

The models contain each auxiliary simplex $sum_j p_j lt.eq r_i$ strictly away from their noncoordinate boundary faces. The volume inequality becomes positivity of the integral of the unused-area profile

$ P \( p \) = H \( p \) - sum_i (r_i - sum_j p_j)_(+) $

over $Delta$. This integral condition need not make $P$ positive at each moment, which is the obstacle to simply stacking the balls.

Section 2 overcomes that obstacle by Hamiltonian comparison. Under concavity of $P$ and positivity outside a radial core of $Delta$, Lemma 2 constructs a smooth toric function $K$ and a Hamiltonian map $q$ such that

$ \( K - P \) compose q < K . $

Coordinatewise increasing rearrangements of convex functions preserve their integrals and lead to a contraction whose fixed point gives a uniform gap. Smooth planar disk maps realize the rearrangements with errors smaller than that gap. Near each noncoordinate boundary face, the generating Hamiltonians commute with its defining moment function; this is the boundary control needed in the next step.

Section 3 converts the comparison into embeddings. A handle provides two transverse annuli and a closed one-form with a nonzero period. These allow the Hamiltonian change of fiber coordinates to be inserted into an exact symplectic deformation. The uniform gap leaves disjoint layers whose area profiles contain the requested balls. The relative Moser argument in Lemma 9 returns the packing to the original model, preserving its boundary conditions. The construction uses the limiting concave function $P$; the integrated areas of finite bordered models need only converge uniformly.

The connection between packing and Hamiltonian-group structure described in Edtmair’s abstracts [9,10] was one motivation for the commutator viewpoint in this construction. The present one-handle comparison and exact deformation are constructed locally, rather than obtained from those results.

=== 1.3 The geometric models and the three cases <the-geometric-models-and-the-three-cases>

To apply this mechanism we need models carrying nearly all the available volume over a surface with a handle. The use of a polarization to expose standard symplectic regions has precedents in Biran’s decomposition method [3] and Opshtein’s singular polarizations and ellipsoid packings [19]. Witt Nyström showed that modified deformations to the normal cone can place arbitrarily nearly all the volume of a compact Kähler manifold in a normal-bundle component [26]. Here explicit toric models over positive-genus curves supply the area profiles needed by the surface packing lemma. Section 4 develops the relative transfer statements that take compact packings from these models back to the target. Its deformation and reduction tools are Moser’s method [18], symplectic cuts [16], and their Kähler interpretation [5]; the relative and equivariant details are proved where needed.

The pairwise inequalities leave three cases, summarized in Figure 1. If every requested capacity is below $1 \/ 2$, Section 5 degenerates $bb(P)^n$ along a complete intersection of quadrics. Its curve has positive genus for every $n gt.eq 3$, and its normal model approaches the full volume of the target. Proposition 16 applies the surface packing lemma to this model.

If a requested capacity is at least $1 \/ 2$, it is the unique such capacity. Reserve a slightly larger central ball and pack the remaining balls into its exterior shell. For $n gt.eq 4$, a hyperplane degeneration followed by a curve degeneration in its base gives a positive-genus model of that shell. This is Proposition 17, also in Section 5.

In complex dimension three, the same procedure would use a plane conic, which has genus zero. Section 6 instead starts from a quadric through the blowup point and uses a further degeneration along a plane cubic with two marked points. If the reserved capacity is $a > 1 \/ 2$, set $s = 1 - a$ and $b = \( 2 - a \) \/ 3$. The resulting integrated base area is

$ H_0 \( p \) = 9 \( b - p_1 - p_2 \) - 2 \( s - p_1 - p_2 \)_(+) . $

Each marked point contributes one of the two subtracted logarithmic masses. This concave density gives the required shell volume, while exact preservation of the first circle moment $p_1$ under transport permits a lower Kähler cut. The cubic family also supplies the invariant Kähler form needed for that cut. Proposition 24 completes this last case, and Section 7 assembles the theorem.

All requested capacities remain arbitrary positive real numbers. Rational auxiliary polarizations and compact truncations are chosen with strict slack. Every transfer is defined on a neighborhood of the relevant compact set, so the construction retains embeddings of the whole closed source balls under finite composition.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.253cm, inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[All capacities $<1"/"2$#linebreak()Complete intersection#linebreak()of quadrics#linebreak()Proposition~5.2]]])])
  content((4.553, 0), [#box(width: 4.253cm, inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One capacity $gt.eq 1"/"2$, $n gt.eq 4$#linebreak()Two normal models#linebreak()Proposition~5.3]]])])
  content((9.106, 0), [#box(width: 4.253cm, inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One capacity $gt.eq 1"/"2$, $n=3$#linebreak()Cubic with two marks#linebreak()Proposition~6.7]]])])
  content((4.553, -2.705), [#box(width: 12.15cm, inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Toric models over a surface with a handle:#linebreak()limiting unused-area profile $P$: concave, positive mean,#linebreak()positive outside a radial core]]])])
  content((4.553, -4.613), [#box(width: 12.15cm, inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hamiltonian comparison $arrow.r.long$ disjoint ball layers#linebreak()Lemmas~2.1 and~3.3]]])])
  content((4.553, -6.328), [#box(width: 12.15cm, inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Symplectic transfer to the target ball or shell;#linebreak()add the central ball in the two large-ball cases]]])])
  line((0, -1.1), (0, -1.5), (0.2528, -2), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((4.553, -1.1), (4.553, -2), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((9.106, -1.1), (9.106, -1.5), (8.853, -2), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((4.553, -3.411), (4.553, -4.111), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
  line((4.553, -5.116), (4.553, -5.816), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: black)))
})],
  caption: [Figure 1: The three geometric applications feed the same comparison and surface-packing mechanism. Capacities are normalized by the target capacity. The six-dimensional transfer also uses the lower Kähler cut. The one-ball case is immediate. ],
) <fig:proof-flow>

=== 1.4 Conventions and the easy direction <conventions-and-the-easy-direction>

We use the Hamiltonian convention $iota_(X_H) omega = - upright(d) H$. On $bb(C)^m$, moment and angle coordinates are

$ p_j = pi \| z_j \|^2 \, #h(2em) theta_j = frac(arg z_j, 2 pi) \, #h(2em) omega_0 = sum_j upright(d) p_j and upright(d) theta_j . $

Moment formulas are always interpreted in the original smooth complex coordinates at a coordinate axis. A function is #emph[toric] if it depends only on the moments. Projective spaces and line bundles use Chern class units: a projective line in the unit class has area one. Projectivizations parametrize lines, and $U = c_1 \( cal(O) \( 1 \) \)$ denotes the dual tautological class. We normalize $upright(d)^c$ by $upright(d)^c log \| z \|^2 = upright(d) theta$ away from zero; consequently $upright(d) upright(d)^c log \| z \|^2$ has a unit atom at zero.

#proof[
  #emph[Necessity in Theorem 1.] The union of the finitely many compact images is contained in $"int" B^(2 n) \( sigma \)$ for some $sigma < R$. Volume preservation gives $sum_i R_i^n lt.eq sigma^n < R^n$. Gromov’s two-ball obstruction [13] Section 0.3.B, in the capacity convention of [23] Theorem 1.1, gives $R_i + R_j lt.eq sigma < R$ for every pair. ◻
]

Conjugating the source and target by the same dilation reduces sufficiency to target capacity one; the conformal factors in the two pullbacks cancel. We henceforth use this normalization. A single ball of capacity less than one embeds by inclusion. The proof for multiple balls is completed after the three geometric applications, in Section 7.

== 2 Hamiltonian comparison on a toric domain <cmp:section>

Our goal is to turn a positive mean area surplus into a strict pointwise inequality after a Hamiltonian change of fiber coordinates. The construction must also preserve the boundary moments needed by the surface deformation in Section 3.

Let

#[#set math.equation(numbering: n => "(2.1)")
 $ Delta = { p in bb(R)_(gt.eq 0)^m : b_nu dot.op p lt.eq c_nu \, med 1 lt.eq nu lt.eq N } \, #h(2em) b_nu in bb(R)_(gt.eq 0)^m \, quad c_nu > 0 \, $ <cmp:polytope>]

be compact and full dimensional, with $m gt.eq 1$. We call the nonempty faces $b_nu dot.op p = c_nu$ the #emph[outer faces]. The coordinate faces $p_j = 0$ are not outer faces. Put

$ V = { z in bb(C)^m : p \( z \) in Delta } \, #h(2em) p_j \( z \) = pi \| z_j \|^2 \, $

with its standard symplectic form $omega_V$. We freely regard functions on $Delta$ as toric functions on $V$. Smooth maps, Hamiltonians, and differential forms on these compact sets will always be defined on neighborhoods. No simplicity or rationality assumption on $Delta$ is needed.

#thm([Lemma 2.1.])[
  (Hamiltonian comparison).  #emph[Let $P : Delta arrow.r bb(R)$ be continuous and concave. Suppose that its Lebesgue mean $overline(P)$ is positive and, for some $0 < tau < 1$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ inf_(Delta \\ tau Delta) P > 0 . $ <cmp:outer-positive>]

 Then there are a smooth toric function $K$ and a Hamiltonian diffeomorphism $q : V arrow.r V$ such that 
#[#set math.equation(numbering: n => "(2.3)")
 $ \( K - P \) \( q u \) < K \( u \) #h(2em) \( u in V \) . $ <cmp:conclusion>]

 The map $q$ admits a Hamiltonian isotopy from the identity preserving $V$, whose Hamiltonians Poisson commute with $b_nu dot.op p$ near each corresponding outer face, uniformly in time.]
] <cmp:comparison>

We separate the rearrangement inequality from its symplectic realization. First we define the rearrangement operator and state the realization property needed by the proof. The fixed-point argument then produces a uniform gap; the remaining subsection proves the realization property with an arbitrarily small error and the required boundary control.

=== 2.1 Coordinate rearrangements <coordinate-rearrangements>

For a continuous convex function $f : \[ 0 \, 1 \] arrow.r bb(R)$, its increasing rearrangement with respect to Lebesgue measure at $h in \[ 0 \, 1 \]$ can be written as

#[#set math.equation(numbering: n => "(2.4)")
 $ g \( h \) = min_(0 lt.eq a lt.eq 1 - h) max { f \( a \) \, f \( a + h \) } . $ <cmp:interval-formula>]

This also defines the endpoint values $g \( 0 \) = min f$ and $g \( 1 \) = max f$.

For a continuous convex function $F$ on $Delta$, let $R_j F$ denote increasing rearrangement in $p_j$, with the other moments $y = \( p_i \)_(i eq.not j)$ fixed. The slice is $\[ 0 \, L \( y \) \]$, where

$ L \( y \) = min_(nu : b_(nu j) > 0) frac(c_nu - sum_(i eq.not j) b_(nu i) y_i, b_(nu j)) . $

At least one such bound exists by compactness of $Delta$. The function $L$ is continuous, concave, and piecewise affine on the projected polytope. Define $R_j F$ by the rescaled version of (2.4).

#thm([Lemma 2.2.])[
  #emph[Each $R_j$ maps continuous convex functions on $Delta$ to continuous convex functions. It preserves Lebesgue integrals, order, and addition of constants, and is nonexpansive in uniform norm. Its output is nondecreasing in $p_j$; moreover it preserves being nondecreasing in any other coordinate. Consequently $R = R_m dots.h.c R_1$ has coordinatewise nondecreasing output.]
] <cmp:rearrangement-properties>

#proof[
  Continuity follows from the minimum-over-intervals formula. At a slice of length tending to zero, uniform continuity of $F$ gives the same conclusion. For convexity, choose minimizing intervals of lengths $h_0 \, h_1$ on two slices. Their convex combination is an allowed interval of length $\( 1 - t \) h_0 + t h_1$ on the intermediate slice. Convexity of $F$ bounds its two endpoint values by the corresponding convex combinations, which proves convexity of the rearrangement.
  The minimum formula is nondecreasing in the interval length. If $F$ is nondecreasing in another coordinate, lowering that coordinate preserves every allowed interval, by the nonnegative coefficients in (2.1), and can only lower its endpoint values. This proves preservation of the previous monotonicity properties.
  On each slice, increasing rearrangement preserves the distribution of values, including flat sublevels, and hence the integral. Integrate this identity in the other coordinates. Order and translation invariance follow directly from the minimum formula. Applying these to $G - ∥F - G∥_oo lt.eq F lt.eq G + ∥F - G∥_oo$ proves nonexpansiveness. ◻
]

The following lemma realizes one coordinate rearrangement up to a prescribed error. Its proof, given after the proof of Lemma 2, uses smooth families of planar disk maps.

#thm([Lemma 2.3.])[
  (Lifted rearrangement).  #emph[For every continuous convex $F : Delta arrow.r bb(R)$, every coordinate $j$, and every $epsilon > 0$, there is a Hamiltonian diffeomorphism $q_j : V arrow.r V$ such that 
$ F compose q_j lt.eq R_j F + epsilon . $

 Its isotopy preserves $V$, and its Hamiltonians Poisson commute with every outer-face moment near the corresponding face.]
] <cmp:lifted>

=== 2.2 A fixed point with a uniform gap <a-fixed-point-with-a-uniform-gap>

#proof[
  The continuous convex functions on $Delta$ form a complete metric space in the uniform norm. Since $- P$ is convex, Lemma 3 implies that, for $0 < lambda < 1$, the map
  $ F mapsto R \( lambda F - P \) $
  is a contraction of this space, with constant $lambda$. Let $K_lambda$ be its fixed point. Integral preservation gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ overline(K)_lambda = - frac(overline(P), 1 - lambda) . $ <cmp:mean>]
  The function $K_lambda$ is coordinatewise nondecreasing; in particular $K_lambda \( 0 \) = min_Delta K_lambda$.
  Choose
  $ 0 < d < min {overline(P) \, thin inf_(Delta \\ tau Delta) P} . $
  We claim that, for $lambda$ sufficiently close to one,
  #[#set math.equation(numbering: n => "(2.6)")
   $ M_lambda := max_Delta K_lambda < - frac(d, 1 - lambda) . $ <cmp:negative-maximum>]
  Suppose otherwise for such a $lambda$. Then $lambda M_lambda lt.eq M_lambda + d$, and consequently $lambda K_lambda - P < M_lambda$ on the outer region. For $p in tau Delta$, write $p = tau v$ with $v in Delta$. Convexity, $K_lambda \( 0 \) lt.eq overline(K)_lambda$, and (2.5) give
  $ K_lambda \( p \) lt.eq tau M_lambda - frac(\( 1 - tau \) overline(P), 1 - lambda) lt.eq M_lambda - frac(\( 1 - tau \) \( overline(P) - d \), 1 - lambda) . $
  It follows that
  $ lambda K_lambda \( p \) - P \( p \) lt.eq M_lambda + d - frac(lambda \( 1 - tau \) \( overline(P) - d \), 1 - lambda) - min_Delta P < M_lambda $
  when $lambda$ is close enough to one. The choices here depend only on the displayed constants, so the bound is uniform on both regions. We have shown $max_Delta \( lambda K_lambda - P \) < M_lambda$, contradicting the fixed-point equation and $max R F lt.eq max F$. This proves (2.6).
  Fix such a $lambda$. Since $\( 1 - lambda \) K_lambda lt.eq - d$, order preservation and translation invariance give
  #[#set math.equation(numbering: n => "(2.7)")
   $ R \( K_lambda - P \) lt.eq R \( lambda K_lambda - P \) - d = K_lambda - d . $ <cmp:rearranged-gap>]
  Set $F_0 = K_lambda - P$ and $F_j = R_j F_(j - 1)$. All these functions are continuous and convex. Use Lemma 4 to choose $q_j$ with
  $ F_(j - 1) compose q_j lt.eq F_j + epsilon_j \, #h(2em) sum_j epsilon_j < d \/ 2 . $
  In the order $q = q_1 compose dots.h.c compose q_m$, successive substitution of these inequalities yields
  $ \( K_lambda - P \) compose q lt.eq R \( K_lambda - P \) + sum_j epsilon_j < K_lambda - d \/ 2 . $
  Each constituent isotopy preserves $V$ and preserves every outer-face moment on a sufficiently small collar. Choose common threshold collars $c_nu - epsilon.alt_nu < b_nu dot.op p lt.eq c_nu$ for the finitely many maps. Such collars are invariant because the moment is constant along each flow there. Run the isotopy for $q_m$ first, then that for $q_(m - 1)$ on its output, and continue in this order. Each stage uses one of the original generating Hamiltonians and retains its commutation with every face moment. Reparametrization makes the concatenated path smooth and preserves these commutation relations.
  Finally approximate $K_lambda$ uniformly on $Delta$ by a smooth function $K \( p \)$, defined on a neighborhood. Polynomial approximation is sufficient. An approximation error smaller than $d \/ 4$ changes the last comparison by less than $d \/ 2$, leaving $\( K - P \) compose q < K$. This proves the lemma. ◻
]

=== 2.3 Realization by Hamiltonian maps <realization-by-hamiltonian-maps>

We now prove the realization lemma used above. Related constructions prescribe planar symplectic maps by nested equal-area curves; see [20] Lemma 3.2. We need smooth parameter dependence and relative Hamiltonian control as well.

Write $D \( A \) = { z in bb(C) : pi \| z \|^2 < A }$. A smooth family of embedded closed disks means a family of smooth embeddings of the closed unit disk, smooth also in the parameters on an open neighborhood of their parameter set.

#thm([Lemma 2.4.])[
  (Nested disks).  #emph[Let $Y$ be a compact convex subset of a Euclidean space, let $0 < a_1 < dots.h.c < a_l < A$, and let 
$ E_1 \( y \) subset.double "int" E_2 \( y \) subset.double dots.h.c subset.double "int" E_l \( y \) subset.double D \( A \) #h(2em) \( y in Y \) $

 be smooth families of embedded closed disks of areas $a_1 \, dots.h \, a_l$. There is a smooth family of Hamiltonian isotopies of $D \( A \)$, supported in a common compact subset, whose endpoint maps carry each centered disk of area $a_j$ onto $E_j \( y \)$.]
] <cmp:planar-disks>

#proof[
  First construct ordinary orientation-preserving diffeomorphisms with these properties. At a fixed parameter $y_0$, a disk embedding can be shrunk within its image, straightened while small, moved through the ambient disk, and expanded to another prescribed disk. The velocity along its moving boundary extends to a vector field in a tubular neighborhood and then, by a cutoff, to a compactly supported ambient field. The resulting flow extends the disk isotopy. Apply this construction first to the outermost boundary and then to each successive boundary inside its already positioned outer disk. This gives a compactly supported diffeomorphism $phi.alt_(y_0)$, isotopic to the identity, carrying the centered disks to the prescribed ones.
  For other parameters, follow the disk boundaries along the segment $y_0 + t \( y - y_0 \)$. Their velocities extend in disjoint tubular neighborhoods of the finitely many boundaries. These extensions can be chosen smoothly in $\( t \, y \)$, by local extensions and a partition of unity. Compactness and strict nesting give uniform collars and support away from the ambient boundary. Integrating the fields produces diffeomorphisms $phi.alt_y$, with ordinary isotopies smooth in $y$, carrying all the centered disks to their prescribed images.
  Let $omega$ be the standard area form and $eta_y = phi.alt_y^(*) omega - omega$. This is a compactly supported two-form of integral zero. Compactly supported primitives can be chosen linearly, and hence smoothly in $y$. For completeness, identify the open ambient disk smoothly with $bb(R)^2$, write $eta = f \( x \, t \) thin upright(d) x and upright(d) t$, and choose a fixed compactly supported function $rho$ with $integral rho = 1$. Put
  $ g \( t \) = integral_(bb(R)) f \( x \, t \) thin upright(d) x \, quad F \( x \, t \) = integral_(- oo)^x #scale(x: 120%, y: 120%)[\(] f \( v \, t \) - rho \( v \) g \( t \) #scale(x: 120%, y: 120%)[\)] thin upright(d) v \, quad G \( t \) = integral_(- oo)^t g \( v \) thin upright(d) v . $
  Then
  $ alpha = F thin upright(d) t - rho \( x \) G \( t \) thin upright(d) x \, #h(2em) upright(d) alpha = eta . $
  The zero marginal and zero total integral give compact support, with a common support for compact families.
  For every centered disk $D_j$ of area $a_j$,
  $ integral_(D_j) eta_y = "area" E_j \( y \) - a_j = 0 . $
  Thus the restriction of $alpha_y$ to $partial D_j$ is exact. Subtract the differentials of functions extending these circle primitives into disjoint annular collars. The resulting primitive $hat(alpha)_y$ vanishes on the tangent line of each circle. Apply Moser’s method [18] to $omega + t eta_y$, $0 lt.eq t lt.eq 1$, using $hat(alpha)_y$. This path consists of positive area forms. Its vector fields are tangent to the designated circles, since $hat(alpha)_y$ vanishes on their tangents. The resulting correction $chi_y$ preserves every $D_j$ and satisfies $chi_y^(*) phi.alt_y^(*) omega = omega$. Hence $psi_y = phi.alt_y compose chi_y$ is area preserving and has the required disk images.
  It remains to provide a symplectic isotopy with this endpoint. The construction has already supplied an ordinary compactly supported isotopy $psi_(y \, t)$ from the identity to $psi_y$. For each $\( y \, t \)$, apply the same Moser correction, now without circle conditions, to
  $ omega + s \( psi_(y \, t)^(*) omega - omega \) \, #h(2em) 0 lt.eq s lt.eq 1 . $
  Use the linear primitive operator above. When $psi_(y \, t)^(*) omega = omega$, that primitive and the correction are zero and the identity, respectively. In particular, the corrections are the identity at both endpoints $t = 0 \, 1$. The corrected isotopy is therefore symplectic, has endpoint $psi_y$, and is smooth in the parameters. On a disk, a compactly supported symplectic vector field has a Hamiltonian normalized to vanish on the complementary component adjacent to the ambient boundary. These Hamiltonians depend smoothly on the parameters and are supported in a common larger compact subset of the disk. This yields the required Hamiltonian isotopies. ◻
]

#thm([Lemma 2.5.])[
  (Planar rearrangement).  #emph[Let $f_y : \[ 0 \, 1 \] arrow.r bb(R)$ be a jointly continuous family of convex functions, with $y$ in a compact convex parameter set. Let $g_y$ be their increasing rearrangements with respect to Lebesgue measure. For every $epsilon > 0$, there is a smooth family of compactly supported Hamiltonian isotopies of $D \( 1 \)$, with endpoints $psi_y$, such that 
$ f_y #scale(x: 120%, y: 120%)[\(] pi \| psi_y \( z \) \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq g_y \( pi \| z \|^2 \) + epsilon #h(2em) \( z in overline(D \( 1 \)) \) . $

 Their supports lie in a common compact subset of $D \( 1 \)$.]
] <cmp:disk-realization>

#proof[
  The minimum formula (2.4) shows that $g_y \( h \)$ is jointly continuous in $\( y \, h \)$.
  Choose a small $epsilon' > 0$ and a sufficiently fine grid $0 < h_1 < dots.h.c < h_l < 1$, including points sufficiently close to both endpoints. The open intervals
  $ I_j \( y \) = { v in \( 0 \, 1 \) : f_y \( v \) < g_y \( h_j \) + epsilon' } $
  are nested in $j$, and each has length greater than $h_j$. Indeed, the closed sublevel at $g_y \( h_j \)$ contains an interval of length $h_j$, and the strict enlargement gives extra room. Joint continuity and compactness make this room uniform for the finite grid.
  Choose increasing numbers $w_j < 1$, sufficiently close to one, so that $h_j \/ w_j$ is strictly increasing in $j$ and is smaller than the available length of $I_j \( y \)$ for every $y$. There are strictly nested closed intervals $J_j \( y \)$, of lengths $h_j \/ w_j$, contained in $I_j \( y \)$. To choose them, first choose the smallest interval and enlarge successively inside the next available open interval. The admissible centers satisfy strict affine inequalities expressing containment and nesting. Locally constant admissible centers remain admissible near a given parameter. A smooth partition of unity preserves these convex constraints, and therefore gives centers smooth on a neighborhood of the parameter set.
  In the open polar chart $\( v \, theta \) in \( 0 \, 1 \)^2$, take the rectangles
  $ J_j \( y \) times [frac(1 - w_j, 2) \, frac(1 + w_j, 2)] . $
  Their areas are $h_j$. Round the corners smoothly and adjust the width in the $v$-direction slightly to restore the area exactly. For example, superellipses of a common sufficiently large even exponent approximate all these rectangles, and their areas are corrected by one additional dilation in $v$. The strict margins ensure that the resulting smooth closed disks $E_j \( y \)$ remain nested and lie in $I_j \( y \) times \( 0 \, 1 \)$. All choices are uniform because the parameter set and grid are compact and finite.
  Apply Lemma 5 to these disks. If $v lt.eq h_j$, the image of a point of radial area $v$ lies in $E_j \( y \)$, and therefore its $f_y$-value is below $g_y \( h_j \) + epsilon'$. Use the next larger grid point and uniform continuity of $g_y$ to bound this by $g_y \( v \) + 2 epsilon'$. For $v > h_l$, use $f_y lt.eq max f_y = g_y \( 1 \)$ and choose $h_l$ close enough to one. Taking $epsilon'$ small proves the assertion. The Hamiltonians extend by zero across the ambient boundary, so the same inequality holds on the closed disk. ◻
]

#proof[
  First suppose that a slice has a smooth positive area scale $ell \( y \)$. Apply Lemma 6 to $f_y \( v \) = F \( y \, ell \( y \) v \)$. If $B_t \( y \, z \)$ generates the resulting maps on $D \( 1 \)$, then the Hamiltonian
  $ ell \( y \) B_t #scale(x: 120%, y: 120%)[\(] y \, z_j \/ sqrt(ell \( y \)) #scale(x: 120%, y: 120%)[\)] $
  on the whole fiber produces the desired scaled disk motion. The other moments remain fixed because this Hamiltonian has no dependence on their angles. Their angles may change, which does not affect a toric function.
  To treat the actual endpoint $L$, choose a small $eta > 0$ and work first on the compact convex parameter set
  $ Y_eta = { y : L \( y \) gt.eq eta } . $
  Choose a smooth function $ell$ strictly below $L$, uniformly close to it on $Y_eta$, and with $ell gt.eq eta \/ 2$. For instance, a smooth soft minimum of the finitely many affine expressions defining $L$, shifted downward by a small positive constant, has these properties when its approximation error is small. The planar construction and its Hamiltonians extend smoothly to a neighborhood of $Y_eta$.
  For $h lt.eq ell \( y \)$, any interval of length $h$ in $\[ 0 \, L \( y \) \]$ can be shifted into $\[ 0 \, ell \( y \) \]$ by a distance at most $L \( y \) - ell \( y \)$. Hence, for a uniform modulus of continuity $omega_F$,
  #[#set math.equation(numbering: n => "(2.8)")
   $ R_(\[ 0 \, ell \]) F \( h \) lt.eq R_(\[ 0 \, L \]) F \( h \) + omega_F \( L - ell \) . $ <cmp:shortened-slice>]
  For $ell < h lt.eq L$, let $\[ a \, a + h \]$ be a minimizing interval for the right-hand rearrangement. Since $a lt.eq L - h < L - ell$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ F \( y \, h \) lt.eq R_(\[ 0 \, L \]) F \( h \) + omega_F \( L - ell \) . $ <cmp:outer-strip>]
  Thus the identity map in this outer strip has the required one-sided estimate. The planar Hamiltonians vanish near their rescaled boundary, so this identity extension is smooth.
  Choose a smooth cutoff $0 lt.eq chi \( y \) lt.eq 1$, supported where $L > eta$ and equal to one where $L gt.eq 2 eta$, with its support contained in the neighborhood where the preceding choices are defined. The full lifted Hamiltonian is
  #[#set math.equation(numbering: n => "(2.10)")
   $ chi \( y \) ell \( y \) B_(chi \( y \) t) #scale(x: 120%, y: 120%)[\(] y \, z_j \/ sqrt(ell \( y \)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq t lt.eq 1 \, $ <cmp:cutoff-hamiltonian>]
  extended by zero elsewhere. At fixed $y$, it runs the scaled disk isotopy to time $chi \( y \)$. On slices of length at most $2 eta$, any slice-preserving motion incurs error at most $omega_F \( 2 eta \)$, since all slice values of $F$ have that oscillation bound. Elsewhere $chi = 1$, and (2.8)–(2.9), together with the planar estimate, apply. Choose $eta$, the scale error, and the planar error in this order to make the total error less than $epsilon$.
  All lifts are smooth at the other coordinate axes because the other moments are smooth functions of the complex variables. The cutoff removes the possible degeneracy at $L = 0$. To check the outer faces, suppose first that $b_(nu j) > 0$. Equality on that face forces $p_j = L \( y \)$. On active slices the common compact planar support satisfies
  $ p_j lt.eq \( 1 - delta \) ell \( y \) $
  for some $delta > 0$, while $ell \( y \) gt.eq eta \/ 2$. Writing $L_nu \( y \)$ for this face’s affine endpoint, its support therefore satisfies
  $ c_nu - b_nu dot.op p = b_(nu j) \( L_nu \( y \) - p_j \) gt.eq b_(nu j) delta ell \( y \) gt.eq b_(nu j) delta eta \/ 2 > 0 . $
  Thus the Hamiltonian vanishes on a genuine uniform neighborhood of that face. If $b_(nu j) = 0$, the Hamiltonian commutes with $b_nu dot.op p$ everywhere. These statements imply that the flow preserves all defining inequalities of $V$ and gives the stated face property. ◻
]

== 3 Packing over a surface with a handle <surf:section>

The comparison lemma becomes a packing construction when the base has a handle. A closed one-form with a nonzero period allows a change of fiber identification across an annulus to turn the comparison inequality into disjoint layers. We include the boundary conditions because the fibers will subsequently be truncated inside geometric models.

=== 3.1 Horizontal forms and relative primitives <horizontal-forms-and-relative-primitives>

Throughout this section, let $m gt.eq 1$ and let

$ Delta = { p in bb(R)_(gt.eq 0)^m : mu_nu \( p \) = b_nu dot.op p lt.eq c_nu \, med 1 lt.eq nu lt.eq N } \, #h(2em) b_nu in bb(R)_(gt.eq 0)^m \, quad c_nu > 0 \, $

be a full-dimensional compact polytope, and put

$ V = { u in bb(C)^m : p \( u \) in Delta } \, #h(2em) p_j \( u \) = pi \| u_j \|^2 \, #h(2em) omega_V = sum_(j = 1)^m upright(d) p_j and upright(d) theta_j . $

The faces $mu_nu = c_nu$ are called outer faces. Smooth objects on closed sets extend to neighborhoods. A #emph[toric horizontal one-form] on $Sigma times V$ annihilates vectors tangent to $V$ and has coefficients depending smoothly on the base point and on $p$. We write $upright(d)_C$ for differentiation in the base variables with $p$ fixed.

For such a form on an oriented surface,

#[#set math.equation(numbering: n => "(3.1)")
 $ \( omega_V + upright(d) Gamma \)^(m + 1) = \( m + 1 \) omega_V^m and upright(d)_C Gamma . $ <surf:toric-volume>]

Indeed, in base coordinates write $Gamma = A thin upright(d) s + B thin upright(d) t$. The only possible additional term in the top exterior power is a multiple of $omega_V^(m - 1) and upright(d)_p A and upright(d)_p B and upright(d) s and upright(d) t$. It vanishes because $upright(d)_p A \, upright(d)_p B$ are combinations of the $upright(d) p_j$: there are too many moment differentials in the displayed expression. Thus $upright(d)_C Gamma > 0$ implies symplecticity. The identity extends across the coordinate axes by smoothness.

#thm([Lemma 3.1.])[
  (Relative area primitives).  #emph[Let $Sigma$ be a compact connected oriented surface with nonempty boundary. A smooth family $eta_p$ of two-forms, supported in a fixed compact subset of $"int" \( Sigma \)$ and satisfying $integral_Sigma eta_p = 0$, admits a smooth family of one-forms $alpha_p$, supported in a fixed compact subset of $"int" \( Sigma \)$, with $upright(d)_C alpha_p = eta_p$. The choice can be made by a fixed linear operator on the two-forms.]
] <surf:primitive>

#proof[
  In a coordinate disk identified with $bb(R)^2$, write $eta = h \( x \, y \) thin upright(d) x and upright(d) y$, with $h$ compactly supported and of integral zero. Fix $rho in C_c^oo \( bb(R) \)$ of integral one, and set
  $ h_0 \( y \) & = integral_(bb(R)) h \( x \, y \) thin upright(d) x \,\
A \( x \, y \) & = integral_(- oo)^x #scale(x: 120%, y: 120%)[\(] h \( v \, y \) - rho \( v \) h_0 \( y \) #scale(x: 120%, y: 120%)[\)] thin upright(d) v \, #h(2em) B \( y \) = integral_(- oo)^y h_0 \( v \) thin upright(d) v . $
  Then $alpha = A thin upright(d) y - rho \( x \) B \( y \) thin upright(d) x$ is compactly supported and $upright(d) alpha = eta$. For forms supported in a fixed compact set its support can be fixed in advance. This is a linear operator preserving smooth parameter dependence.
  Cover the given compact support by finitely many coordinate disks and use a fixed partition of unity. From each summand subtract its integral times a fixed unit-integral bump in the same disk; the local construction treats the resulting zero-integral forms. Join these disks to one fixed disk by finitely many chains of overlapping coordinate disks in $"int" \( Sigma \)$. Unit-integral bumps in successive overlaps express the difference between each original bump and a common bump as a sum of zero-integral forms in individual disks. Apply the local operator to these differences. The coefficient of the common bump is zero because $integral_Sigma eta = 0$. All choices are fixed, proving the support and parameter assertions. ◻
]

#thm([Lemma 3.2.])[
  (Moser with outer faces).  #emph[Let $Sigma$ be a compact connected oriented surface with nonempty boundary. Let $Omega_lambda$, $0 lt.eq lambda lt.eq 1$, be a smooth family of symplectic forms on neighborhoods of $Sigma times V$, and suppose $partial_lambda Omega_lambda = upright(d) alpha_lambda$, where $alpha_lambda$ is horizontal and vanishes in a fixed collar of $partial Sigma times V$. Suppose, near each outer face and uniformly in $lambda$, that its standard Hamiltonian vector field satisfies 
$ iota_(X_(mu_nu)) Omega_lambda = - upright(d) mu_nu . $

 Then the Moser isotopy preserves $Sigma times V$ and its interior, is the identity near the base boundary, and is defined on a neighborhood of the compact region.]
] <surf:moser>

#proof[
  Solve $iota_(Y_lambda) Omega_lambda = - alpha_lambda$. Horizontality gives $alpha_lambda \( X_(mu_nu) \) = 0$, so evaluation on $X_(mu_nu)$ gives $upright(d) mu_nu \( Y_lambda \) = 0$ near that face. The field is zero in the base boundary collar. Trajectories therefore cannot cross any defining outer level in either time direction. This applies first to interior starting points and then to boundary points by continuity. All inequalities are treated simultaneously, including at nonsimple intersections of faces; no smooth-corner assumption is needed.
  The fields extend smoothly to a common neighborhood by compactness and nondegeneracy. Trajectories starting in the compact region stay there and exist throughout the parameter interval. Continuous dependence and compactness give flows on a neighborhood as well. For the flow $psi_lambda$,
  $ frac(upright(d), upright(d) lambda) psi_lambda^(*) Omega_lambda = psi_lambda^(*) #scale(x: 120%, y: 120%)[\(] upright(d) alpha_lambda + upright(d) iota_(Y_lambda) Omega_lambda #scale(x: 120%, y: 120%)[\)] = 0 . $
  The inverse flow has the same preservation properties, giving preservation of the interior. ◻
]

=== 3.2 The surface packing lemma <the-surface-packing-lemma>

#thm([Lemma 3.3.])[
  (Packing over a positive-genus base).  #emph[Let $C^o$ be an oriented surface obtained from a closed connected surface of genus at least one by removing finitely many, but at least one, points. Let $Sigma_ell subset "int" \( Sigma_(ell + 1) \)$ be an exhaustion by compact connected surfaces with smooth nonempty boundary. Suppose that, for all sufficiently large $ell$, a neighborhood of $Sigma_ell times V$ carries a form 
$ Omega_ell = omega_V + upright(d) Gamma_ell \, #h(2em) upright(d)_C Gamma_ell = kappa_ell \( p \) > 0 \, $

 where $Gamma_ell$ is toric horizontal. Assume that 
$ A_ell \( p \) := integral_(Sigma_ell) kappa_ell \( p \) arrow.r H \( p \) quad upright("uniformly on ") Delta \, $

 where $H$ is continuous and positive. The models for different $ell$ need not be compatible.]
  #emph[Let $r_1 \, dots.h \, r_k > 0$ satisfy 
$ { p gt.eq 0 : sum_j p_j lt.eq r_i } subset Delta \, #h(2em) { p gt.eq 0 : sum_j p_j lt.eq r_i } ∩ { mu_nu = c_nu } = diameter quad upright("for every ") i \, nu . $

 Suppose the function 
$ P \( p \) = H \( p \) - C_r \( p \) \, #h(2em) C_r \( p \) = sum_(i = 1)^k \( r_i - sum_j p_j \)_(+) \, $

 is concave, has positive Lebesgue mean on $Delta$, and is bounded below by a positive constant on $Delta \\ tau Delta$ for some $0 < tau < 1$. Then, for every choice $0 < r'_i < r_i$, some model contains a disjoint symplectic packing of the closed balls $B^(2 m + 2) \( r'_i \)$ in $"int" \( Sigma_ell times V \)$. Each embedding is defined on a neighborhood of its closed ball.]
] <surf:packing>

#proof[
  We carry out the construction in five steps.
  #strong[Step 1: retain the comparison gap on a finite surface.] By Lemma 2, there are a smooth toric $K$ and a Hamiltonian isotopy $q_xi$, $0 lt.eq xi lt.eq 1$, with $q_0 = upright("id")$, $q_1 = q$, preserving $V$, such that $\( K - P \) compose q < K$. Its generators commute with every $mu_nu$ near the corresponding outer face, uniformly in time after shrinking the collars. Write
  $ g = min_(v in V) #scale(x: 120%, y: 120%)[\(] K \( q^(- 1) v \) - K \( v \) + H \( p \( v \) \) - C_r \( p \( v \) \) #scale(x: 120%, y: 120%)[\)] > 0 $
  and choose $0 < epsilon < 1 / 8 min \( g \, min_Delta H \)$. Take a sufficiently large $Sigma = Sigma_ell$ so that
  #[#set math.equation(numbering: n => "(3.2)")
   $ parallel A_ell - H parallel_oo < epsilon $ <surf:area-error>]
  and $"int" \( Sigma \)$ contains an embedded torus with a disk removed. Write $Gamma_0 = Gamma_ell$, $kappa = kappa_ell$, and $Omega_0 = Omega_ell$. We use the comparison obtained from $H$; no concavity of the finite area function $A_ell - C_r$ is required.
  #strong[Step 2: place the base area on an annulus.] Inside the handle choose annuli $A subset.double A^(+) subset.double "int" \( Sigma \)$ around one essential circle, and a transverse annulus $B$ around a circle intersecting it once. There are positive coordinates $\( s \, t \)$ on $A^(+)$, with $t in bb(R) \/ bb(Z)$, and a smooth closed one-form $beta$, supported in $B$, such that
  #[#set math.equation(numbering: n => "(3.3)")
   $ beta \|_(A^(+)) = f \( t \) thin upright(d) t \, #h(2em) f gt.eq 0 \, #h(2em) integral_(bb(R) \/ bb(Z)) f \( t \) thin upright(d) t = 1 \, $ <surf:handle-form>]
  where $f$ is positive on one open interval and zero outside its closure. Use the two coordinate bands on a torus, remove a disk away from them, and take a bump form in the transverse coordinate of $B$. All choices can have collars inside the handle.
  Choose a smooth nondecreasing $S \( s \)$, zero near and below the lower end of $A$, and one near and above its upper end. Its derivative is supported in $"int" \( A \)$. The two-form
  $ chi_A = S' \( s \) thin upright(d) s and beta $
  extends by zero to $Sigma$, is nonnegative, and has integral one.
  Choose a positive area form $kappa_(upright("sm")) \( p \)$ agreeing with $kappa \( p \)$ in a thin base boundary collar, independent of $p$ on $A^(+)$, and satisfying
  #[#set math.equation(numbering: n => "(3.4)")
   $ sup_(p in Delta) integral_Sigma kappa_(upright("sm")) \( p \) < epsilon . $ <surf:small-area>]
  To do this, fix a positive area form $lambda$ on $Sigma$ and write $kappa \( p \) = a \( y \, p \) lambda$. If $zeta$ is one near the boundary and zero off a thin collar disjoint from $A^(+)$, put $kappa_(upright("sm")) = \( zeta a + \( 1 - zeta \) e \) lambda$. Uniform boundedness of $a$ allows the collar integral to be made arbitrarily small; then take $e > 0$ sufficiently small. The construction is smooth on neighborhoods and equals $e lambda$ on $A^(+)$.
  Set
  #[#set math.equation(numbering: n => "(3.5)")
   $ H_(*) \( p \) = integral_Sigma \( kappa \( p \) - kappa_(upright("sm")) \( p \) \) \, #h(2em) kappa_1 \( p \) = kappa_(upright("sm")) \( p \) + H_(*) \( p \) chi_A . $ <surf:H-star>]
  Then $H_(*) > 0$, $parallel H_(*) - H parallel_oo < 2 epsilon$, and $kappa_1 > 0$. Moreover $kappa_1 - kappa$ has zero integral and compact interior support. Lemma 7 supplies a toric horizontal $alpha$ with $upright(d)_C alpha = kappa_1 - kappa$ and compact interior base support. Initially put $tilde(Gamma)_1 = Gamma_0 + alpha$.
  Normalize the primitive on a neighborhood of $overline(A)$. Choose a one-form $gamma$ on $A^(+)$, independent of $p$, with $upright(d) gamma = e lambda$; a primitive exists on the annulus. The form
  $ delta \( p \) = tilde(Gamma)_1 - gamma - S H_(*) \( p \) beta $
  is base-closed on $A^(+)$. Let $c \( p \)$ be its period around the annulus. Since $beta$ has period one, $delta - c \( p \) beta$ has zero period, and equals $upright(d)_C F$ for a smooth function $F \( y \, p \)$ on $A^(+)$. Smooth parameter dependence follows by fixing a base point and integrating the zero-period form along paths. Choose $zeta_A in C_c^oo \( A^(+) \)$ equal to one near $overline(A)$, and define globally
  $ Gamma_1 = tilde(Gamma)_1 - c \( p \) beta - upright(d)_C \( zeta_A F \) \, $
  where the last term is extended by zero. This is horizontal and toric, agrees with $Gamma_0$ near $partial Sigma$, and satisfies
  #[#set math.equation(numbering: n => "(3.6)")
   $ upright(d)_C Gamma_1 = kappa_1 \, #h(2em) Gamma_1 \|_A = gamma + S \( s \) H_(*) \( p \) beta . $ <surf:annular-normal-form>]
  The use of $upright(d)_C$ in the normalization retains horizontality. All changes of the two-form are exact on the total space. Linear interpolation from $Gamma_0$ to $Gamma_1$ is symplectic by (3.1), because its base curvature interpolates between $kappa$ and $kappa_1$.
  #strong[Step 3: construct a positive exact path with packing layers.] Choose smooth positive toric functions $h_i$ satisfying
  #[#set math.equation(numbering: n => "(3.7)")
   $ h_i \( p \) > \( r_i - sum_j p_j \)_(+) \, #h(2em) 0 < sum_i h_i - C_r < epsilon . $ <surf:cap-smoothing>]
  For instance, use sufficiently close smooth upper approximations $1 / 2 \( x + sqrt(x^2 + eta_i^2) \)$ to $x_(+)$. Put
  $ J = K - H_(*) \, #h(2em) R_(*) \( v \) = K \( q^(- 1) v \) - J \( v \) - sum_i h_i \( p \( v \) \) . $
  Equations (3.2)–(3.7) give
  #[#set math.equation(numbering: n => "(3.8)")
   $ R_(*) \( v \) gt.eq g - 3 epsilon > 0 . $ <surf:residual-gap>]
  The gap says that a coefficient $G \( s \, v \)$ of $beta$, nondecreasing in $s$, can run from $J \( v \)$ to $K \( q^(- 1) v \)$, with increments $h_i \( p \( v \) \)$ and the positive residual $R_(*) \( v \)$. We will change fiber coordinates from the identity at the lower end of $A$ to $q$ at the upper end. After pullback these boundary values become $J$ and $K = H_(*) + J$, so both ends match $Gamma_1$ after the same global correction $J beta$. Since $J$ is independent of the base and $beta$ is closed, this correction leaves the base curvature unchanged and changes the total form by the exact form $upright(d) \( J beta \)$. The two paths below first insert the fiber change and then arrange the increments as disjoint layers.
  With the convention $iota_(X_Q) omega_V = - upright(d) Q$, write $partial_xi q_xi = X_(Q_xi) compose q_xi$. For $0 lt.eq lambda lt.eq 1$, define on $A times V$
  $ q_s^lambda = q_(lambda S \( s \)) \, #h(2em) D_lambda \( s \, t \, u \) = \( s \, t \, q_s^lambda u \) \, #h(2em) G_lambda \( s \, v \) = S \( s \) H_(*) \( q_lambda^(- 1) v \) . $
  The $s$-generator is $Q_s^lambda = lambda S' \( s \) Q_(lambda S \( s \))$, and vanishes on the end collars. This is the Hamiltonian lifting mechanism used in symplectic folding; compare [20] Section 3.1, Step 3. With our sign convention, the suspension identity is
  #[#set math.equation(numbering: n => "(3.9)")
   $ D_lambda^(*) omega_V = omega_V + upright(d) #scale(x: 120%, y: 120%)[\(] \( Q_s^lambda compose q_s^lambda \) thin upright(d) s #scale(x: 120%, y: 120%)[\)] . $ <surf:suspension>]
  On a pair $\( partial_s \, w \)$ with $w$ vertical, both added terms equal $- upright(d)_u \( Q_s^lambda compose q_s^lambda \) \( w \)$; on vertical pairs the identity follows from symplecticity of $q_s^lambda$.
  Use
  #[#set math.equation(numbering: n => "(3.10)")
   $ Omega_lambda^A = upright(d) gamma + D_lambda^(*) #scale(x: 120%, y: 120%)[\(] omega_V + upright(d) \( G_lambda beta \) #scale(x: 120%, y: 120%)[\)] $ <surf:first-path>]
  on $A times V$, retaining $omega_V + upright(d) Gamma_1$ outside. These forms glue. On the lower collar, $q_s^lambda = upright("id")$ and $G_lambda = 0$; on the upper collar, $q_s^lambda = q_lambda$ and $G_lambda compose q_lambda = H_(*)$. The suspension term is zero on both collars. Indeed, (3.10) has horizontal primitive
  $ gamma + \( Q_s^lambda compose q_s^lambda \) thin upright(d) s + \( G_lambda compose q_s^lambda \) beta $
  after subtracting $omega_V$, and this equals $Gamma_1$ on the collars. Its change therefore extends by zero as a global horizontal primitive. At $lambda = 0$ it is the form from Step 2.
  For any $t$-independent function $G \( s \, v \)$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ #scale(x: 120%, y: 120%)[\(] upright(d) gamma + omega_V + upright(d) \( G beta \) #scale(x: 120%, y: 120%)[\)]^(m + 1) = \( m + 1 \) omega_V^m and #scale(x: 120%, y: 120%)[\(] upright(d) gamma + partial_s G thin upright(d) s and beta #scale(x: 120%, y: 120%)[\)] . $ <surf:one-covector>]
  Every mixed term contains $beta$, so products of two mixed terms vanish. Since $partial_s G_lambda = S' H_(*) compose q_lambda^(- 1) gt.eq 0$, the forms (3.10) are symplectic.
  Now keep $D = D_1$ fixed. Choose successively ordered, pairwise disjoint closed subintervals $I_1 \, dots.h \, I_k \, I_(*)$ in the interior of the $s$-interval of $A$. Choose smooth nondecreasing functions $rho_i \, rho_(*)$, each zero below its interval, one above it, and constant near its endpoints. Define
  #[#set math.equation(numbering: n => "(3.12)")
   $ G_(upright(f)) \( s \, v \) = J \( v \) + sum_(i = 1)^k rho_i \( s \) h_i \( p \( v \) \) + rho_(*) \( s \) R_(*) \( v \) . $ <surf:G-final>]
  Its $s$-derivative is nonnegative. Its lower and upper values are $J$ and $K compose q^(- 1) = \( H_(*) + J \) compose q^(- 1)$. On the $i$th interval it has the toric expression
  #[#set math.equation(numbering: n => "(3.13)")
   $ G_(upright(f)) \( s \, v \) = a_i \( p \( v \) \) + rho_i \( s \) h_i \( p \( v \) \) \, #h(2em) a_i = J + sum_(j < i) h_j . $ <surf:toric-layer>]
  The possibly nontoric contribution to $partial_s G_(upright(f))$ is supported in $I_(*)$; the residual term may persist above $I_(*)$. All preceding packing layers are toric.
  Interpolate linearly, with $0 lt.eq tau lt.eq 1$, between $G_1 = S H_(*) compose q^(- 1)$ and $G_(upright(f))$: $hat(G)_tau = \( 1 - tau \) G_1 + tau G_(upright(f))$. On $A times V$ use
  $ hat(Omega)_tau = upright(d) gamma + D^(*) \( omega_V + upright(d) \( hat(G)_tau beta \) \) \, $
  and outside use $omega_V + upright(d) \( Gamma_1 + tau J beta \)$. At the lower end the inside primitive changes by $tau J beta$; at the upper end its pullback changes by the same $tau J beta$. Thus the primitives themselves glue. The $s$-derivative of $hat(G)_tau$ is nonnegative, and (3.11) proves positivity inside $A$. Outside, the primitive is toric and its base curvature is unchanged, since $upright(d)_C \( J beta \) = 0$. This second exact symplectic path ends in the form $Omega_(upright(f))$.
  #strong[Step 4: verify the relative Moser conditions.] Every variation primitive is horizontal and supported away from the base boundary: its support lies in the fixed compact interior support from Step 2 or in $A union "supp" beta$. To check the outer faces, fix $mu = mu_nu$. The comparison isotopy preserves $mu$ and intertwines $X_mu$ on a common sufficiently thin collar. This follows from ${ Q_xi \, mu } = 0$ there; points in a smaller collar stay in it because $mu$ is constant along their trajectories. Consequently $Q_s^lambda compose q_s^lambda$, $H_(*) compose q_lambda^(- 1)$, $K compose q^(- 1)$, and their indicated pullbacks are invariant under $X_mu$ there. The other functions are toric. For every global horizontal primitive $Gamma$ along the paths, we therefore have
  $ iota_(X_mu) Gamma = 0 \, #h(2em) cal(L)_(X_mu) Gamma = 0 \, #h(2em) iota_(X_mu) \( omega_V + upright(d) Gamma \) = - upright(d) mu $
  near the face. Lemma 8 applies. Reparametrize each stage to be constant near its parameter endpoints to obtain a smooth concatenated path. There is a diffeomorphism $psi$, defined on a neighborhood and preserving $Sigma times V$ and its interior, with $psi^(*) Omega_(upright(f)) = Omega_0$. The final packing will return to the original model via $psi^(- 1)$.
  #strong[Step 5: embed a closed ball in each layer.] Use the $D$-coordinates $\( s \, t \, v \)$ and the $i$th interval. On the open $t$-interval where $f > 0$, the coordinate $T$ with $upright(d) T = beta$, normalized using (3.3), runs through $\( 0 \, 1 \)$. Write
  $ upright(d) gamma = ell \( s \, T \) thin upright(d) s and upright(d) T \, #h(2em) L \( s \, T \) = integral_(s_i^(-))^s ell \( sigma \, T \) thin upright(d) sigma \, $
  where $s_i^(-)$ is the lower endpoint of $I_i$. Then $ell > 0$, $partial_s L > 0$, and $upright(d) L and upright(d) T = upright(d) gamma$. Set
  #[#set math.equation(numbering: n => "(3.14)")
   $ x = L + G_(upright(f)) - a_i = L + rho_i h_i . $ <surf:strip-coordinate>]
  At fixed $\( T \, v \)$ this is strictly increasing in $s$. The form becomes
  $ omega_V + upright(d) x and upright(d) T + upright(d) a_i and upright(d) T . $
  Set $v' = phi.alt_(a_i)^T v$, using Hamiltonian time $T$. The result is the product form $omega_V \( v' \) + upright(d) x and upright(d) T$. The sign follows directly from the convention: since $a_i$ is toric, $theta'_j = theta_j + T partial_(p_j) a_i$, and
  #[#set math.equation(numbering: n => "(3.15)")
   $ omega_V \( v' \) = omega_V \( v \) + upright(d) a_i and upright(d) T . $ <surf:product-sign>]
  The flow preserves the moments and is smooth across all axes.
  The lower value of $x$ is zero and the upper value is $L \( s_i^(+) \, T \) + h_i \( p \) > h_i \( p \)$. The chart therefore contains
  #[#set math.equation(numbering: n => "(3.16)")
   $ v' in "int" \( V \) \, #h(2em) 0 < T < 1 \, #h(2em) 0 < x < h_i \( p \( v' \) \) . $ <surf:available-strip>]
  Its inverse is smooth by $partial_s x > 0$ and the implicit function theorem, also at fiber axes.
  We use an elementary consequence of Lemma 5; related radial-area control appears in [22] Section 3.1, Lemma 3.2. For any $A > 0$ and $delta > 0$, a neighborhood of the closed planar disk of area $A$ admits an area-preserving embedding into the $\( x \, T \)$-plane such that at radial area $w = pi \| z \|^2$,
  #[#set math.equation(numbering: n => "(3.17)")
   $ 0 < x < w + delta \, #h(2em) 0 < T < 1 . $ <surf:thin-planar>]
  Take a finite increasing area grid starting below $delta \/ 4$, ending above $A$, and having mesh less than $delta \/ 4$. At each grid value $h$, choose a smooth disk of area $h$ inside $0 < x < h + delta \/ 2$, $0 < T < 1$, with the disks strictly nested. These can be rounded rectangles: take their heights strictly increasing and sufficiently close to one, and horizontal intervals strictly nested with positive left endpoints close to zero. The finite nesting margins persist after rounding and the small area corrections. Put these disks and the source concentric disks in a sufficiently large open ambient disk and apply Lemma 5. For a point of area $w$, the next larger grid value $h$ gives $x < h + delta \/ 2 < w + delta$. The last value exceeds $A$, so the map is defined beyond the closed disk used here.
  Choose $0 < delta < r_i - r'_i$ and use (3.17), with $A > r'_i$, for the last complex coordinate of $B^(2 m + 2) \( r'_i \)$. Use the first $m$ coordinates unchanged as $v'$. On the closed ball,
  $ w + sum_j p_j \( v' \) lt.eq r'_i \, #h(2em) x < w + delta < r_i - sum_j p_j \( v' \) < h_i \( p \( v' \) \) . $
  The fiber simplex is separated from the outer faces, and the planar image is compactly contained in $0 < T < 1$, $x > 0$. The upper inequality has uniform positive slack. Thus the product embedding lands compactly in (3.16) and extends to an open neighborhood of the whole closed ball. The inverse coordinate changes give a symplectic embedding into the $i$th layer for $Omega_(upright(f))$. The layers have disjoint base intervals, so their compact images are disjoint. Applying $psi^(- 1)$ from Step 4 gives the required neighborhood embeddings in the original model. ◻
]

== 4 Kähler models and symplectic transfer <geo:devices>

We next explain how compact packings in projective normal models transfer to a prescribed target form while avoiding specified divisors. The final two constructions identify the models used below and the shell in which the smaller balls will lie when one ball is large.

We use Chern class units: a projective line has area one for the Fubini–Study form representing $c_1 \( cal(O)_(bb(P)^n) \( 1 \) \)$. An ample rational polarization means an element of $"Pic" \( X \) ⊗_(bb(Z)) bb(Q)$ with an ample positive integral multiple. We use the same notation for its real Chern class, and omit pullbacks when their meaning is clear. Projective bundles parametrize lines, and

$ U = c_1 #scale(x: 120%, y: 120%)[\(] cal(O)_(bb(P) \( E \)) \( 1 \) #scale(x: 120%, y: 120%)[\)] $

is the dual tautological class. Our normalization of $upright(d)^c$ is $upright(d)^c log \| z \|^2 = upright(d) theta$, where $theta = arg z \/ \( 2 pi \)$. Thus $upright(d) upright(d)^c log \| z \|^2$ has unit mass at the origin.

=== 4.1 Moser isotopies with prescribed invariant submanifolds <moser-isotopies-with-prescribed-invariant-submanifolds>

We use Moser’s deformation method [18] Section 4, with a normal first-jet correction to preserve the specified complex submanifolds as sets.

#thm([Lemma 4.1.])[
  (Relative Kähler Moser lemma).  #emph[Let $X$ be a compact complex manifold and let $omega_0 \, omega_1$ be cohomologous Kähler forms. Let $S_1 \, dots.h \, S_e$ be pairwise disjoint closed smooth complex submanifolds. There is an isotopy $psi_t$ of $X$, starting at the identity, such that 
$ psi_1^(*) omega_1 = omega_0 \, #h(2em) psi_t \( S_j \) = S_j . $

 If a compact Lie group $G$ acts holomorphically on $X$, the forms are $G$-invariant, and every $S_j$ is $G$-invariant, the isotopy can be chosen $G$-equivariant. It then preserves every connected component of the fixed locus $X^G$, whether or not that component meets any $S_j$.]
] <geo:relative-moser>

#proof[
  Put $omega_t = \( 1 - t \) omega_0 + t omega_1$. Each $omega_t$ is Kähler. Choose a smooth real one-form $alpha$ such that $upright(d) alpha = omega_1 - omega_0$. Since $S_j$ is complex, its tangent bundle is symplectic for $omega_t$, and
  $ T X \|_(S_j) = T S_j xor N_(j \, t) \, #h(2em) N_(j \, t) = \( T S_j \)^(omega_t) . $
  These splittings depend smoothly on $t$. Along $S_j$, prescribe the first jet of a function $f_t$ by requiring
  $ f_t \|_(S_j) = 0 \, #h(2em) upright(d) f_t \|_(T S_j) = 0 \, #h(2em) upright(d) f_t \|_(N_(j \, t)) = - alpha \|_(N_(j \, t)) . $
  The direct-sum decomposition makes this a well-defined smooth covector field. It is realized by a smooth function in a fixed tubular neighborhood: evaluate the prescribed covector on the normal variable and multiply by a cutoff equal to one near the zero section. Compactness of the parameter interval permits fixed neighborhoods and cutoffs. The neighborhoods for different $S_j$ may be chosen disjoint. Adding the resulting functions produces a global smooth family $f_t$.
  Set $alpha_t = alpha + upright(d) f_t$, and solve
  $ iota_(X_t) omega_t = - alpha_t . $
  Along $S_j$, the right side annihilates $N_(j \, t)$, so $X_t$ is tangent to $S_j$. Its flow exists throughout $0 lt.eq t lt.eq 1$, because $X$ is compact, and the usual Moser calculation gives
  $ frac(upright(d), upright(d) t) \( psi_t^(*) omega_t \) = psi_t^(*) #scale(x: 120%, y: 120%)[\(] upright(d) alpha + upright(d) iota_(X_t) omega_t #scale(x: 120%, y: 120%)[\)] = 0 . $
  This proves the first assertion.
  In the equivariant case, first average $alpha$ over $G$. The normal splittings are invariant. Averaging $f_t$ therefore preserves its prescribed first jets, and makes $X_t$ invariant. The flow is equivariant. An invariant vector field is tangent to the fixed locus, and its flow, starting at the identity, preserves each fixed component. This also explains why no disjointness condition between a fixed component and the $S_j$ is needed. ◻
]

Only preservation as a set is asserted here. Equal pointwise restrictions of $omega_0 \, omega_1$ to a submanifold are unnecessary. We will apply the lemma to divisors that are to be omitted, using their complements after the isotopy.

=== 4.2 Projective degenerations <projective-degenerations>

#thm([Lemma 4.2.])[
  (Transfer from smooth components).  #emph[Let $f : cal(X) arrow.r B$ be a flat projective family over a smooth algebraic curve over $bb(C)$, with a marked point $0$, and let $cal(L)$ be a relatively ample rational polarization. Let $Y$ be a smooth projective irreducible component of $cal(X)_0$, or a union of pairwise disjoint smooth projective irreducible components. The following statements hold after replacing $B$ by a Zariski-open neighborhood of $0$; for symplectic transport we subsequently work in a small complex analytic neighborhood.]
  + #emph[For a sufficiently divisible and sufficiently large $N$, a full basis of $H^0 \( Y \, cal(L)^N \|_Y \)$ can be extended to sections defining a relative projective embedding, with additional sections whose restrictions to $Y$ vanish. Consequently one can choose a relative Kähler form whose restriction to $Y$ is the projective form from that full basis, divided by $N$. If a complex torus $\( bb(C)^(*) \)^r$ acts holomorphically on $Y$ and its action is linearized on $cal(L)^N \|_Y$, the basis may be chosen by weights, making the restricted form invariant under the compact torus $\( S^1 \)^r$.]
  + #emph[Let $K subset Y$ be compact and contained in the smooth submersion locus of $f$. For the chosen form there is, for all sufficiently small nonzero $t$, a symplectic embedding of a neighborhood of $K$ into the fiber $cal(X)_t$. If $K$ avoids a specified closed subset of $cal(X)$, the embedding can be chosen with image avoiding that subset.]
  + #emph[If a compact group acts on the family over $B$ and the total form is invariant, this transport is equivariant. In particular, for a Hamiltonian circle action, it preserves moment functions up to an additive constant on each connected transport domain. If one transported point has the same prescribed moment value in both fibers, this constant is zero.]
] <geo:projective-transfer>

#proof[
  First clear denominators in the polarization. For large divisible $N$, relative Serre vanishing gives $R^1 f_(*) \( cal(I)_Y ⊗ cal(L)^N \) = 0$; see [24] Tag 02O1, or the relative ampleness and vanishing theorem [15] Theorem 1.7.6. Apply $f_(*)$ to
  $ 0 arrow.r cal(I)_Y ⊗ cal(L)^N arrow.r cal(L)^N arrow.r i_(*) \( cal(L)^N \|_Y \) arrow.r 0 \, $
  where $i : Y arrow.r.hook cal(X)$. For a union of pairwise disjoint components, $cal(I)_Y$ is the ideal of the whole union and the section space is the direct sum of the component section spaces. The same lifting and local transport arguments apply to that union. The resulting surjection extends every section on $Y$ near $0$; here $f_(*) i_(*) \( cal(L)^N \|_Y \)$ is supported at $0$, with fiber $H^0 \( Y \, cal(L)^N \|_Y \)$. Take an affine neighborhood of $0$, so these lifts may all be represented by sections over that neighborhood. Choose lifts $s_0 \, dots.h \, s_r$ of the desired basis. Choose also sections $t_0 \, dots.h \, t_M$ of the same power which define a relative closed immersion; eventual relative very ampleness over the affine base follows from [24] Tag 01VT and properness. Express each $t_i \|_Y$ in the chosen basis, and subtract the corresponding linear combination of the $s_j$. The modified sections $t'_i$ vanish on $Y$. The span of the $s_j \, t'_i$ contains the original $t_i$, so this enlarged system still defines a relative closed immersion. On $Y$, the resulting Fubini–Study potential is precisely $N^(- 1) log sum_j \| s_j \|^2$ in a local frame. For a linearized complex torus action, choose a basis of weight vectors. Its compact torus characters preserve the standard diagonal Hermitian norm, making this expression invariant under the compact torus.
  The relative embedding into $bb(P)^(r + M + 1) times B$ supplies a closed real $\( 1 \, 1 \)$-form $Omega$, equal to the projective pullback divided by $N$, with an arbitrary positive base form added. On the smooth locus it is Kähler, and its restriction to each smooth fiber represents the designated polarization. Adding the base form changes neither fiber forms nor the horizontal lifts used below.
  In the submersion locus define a lift of a base tangent vector by requiring it to be $Omega$-orthogonal to the fiber tangent space. The fiber restriction of $Omega$ is symplectic, so the lift exists uniquely. Lift a sufficiently short path from $0$ to $t$. Compactness of $K$ gives existence of its flow for a uniform time, on a neighborhood of $K$. Since $Omega$ is closed and the contraction of the horizontal lift with $Omega$ vanishes on fiber tangent vectors, this flow preserves the fiber forms. It gives the claimed symplectic embedding. If $K$ is disjoint from a closed set, it has a neighborhood disjoint from that set; shorten the transport uniformly so that its image remains in this neighborhood.
  For the last assertion, invariance of $Omega$ and uniqueness of the horizontal lift imply equivariance. Write $Phi_t$ for the transport and $X$ for a circle generator. If $iota_X omega_t = - upright(d) mu_t$, then
  $ upright(d) \( mu_t compose Phi_t \) = - Phi_t^(*) \( iota_X omega_t \) = - iota_X omega_0 = upright(d) mu_0 . $
  The difference is constant on a connected domain, and a single normalizing point determines it. When the circle acts on the whole family, an invariant total form can be obtained by averaging. If its restriction to $Y$ was already invariant, this averaging leaves that restriction unchanged. ◻
]

#thm([Proposition 4.3.])[
  (Normal-cone transfer).  #emph[Let $T$ be a smooth projective manifold, $Z subset T$ a smooth closed submanifold of positive codimension, possibly disconnected, and $L$ an ample rational polarization. Let 
$ T' = "Bl"_Z T \, #h(2em) Y = bb(P)_Z \( upright(bold(1)) xor N_(Z \/ T) \) \, #h(2em) D_oo = bb(P)_Z \( N_(Z \/ T) \) subset Y . $

 Write $E_Z$ for the exceptional divisor on $T'$; when $Z$ is a divisor, $T' tilde.eq T$ and $E_Z$ means $Z$. Suppose $d > 0$ is rational and 
$ pi^(*) L - d E_Z quad upright("on ") T' \, #h(2em) L \|_Z + d U quad upright("on ") Y $

 are ample.]
  #emph[Let $F subset T$ be a finite union of pairwise disjoint smooth closed complex submanifolds. Assume the inverse image of $F ∩ Z$ under $Y arrow.r Z$ is also a finite union of pairwise disjoint smooth complex submanifolds; the empty union is allowed. Let $omega_T$ be any Kähler form in class $L$, and let $omega_Y$ be a Kähler form in class $L \|_Z + d U$, invariant under scalar rotation of the normal summand. Then every compact subset of 
$ Y \\ #scale(x: 120%, y: 120%)[\(] D_oo union pi_Y^(- 1) \( F ∩ Z \) #scale(x: 120%, y: 120%)[\)] $

 has a neighborhood admitting a symplectic embedding into $\( T \\ F \, omega_T \)$, with its given form $omega_Y$. In particular any compact packing there transfers with neighborhood embeddings.]
] <geo:transfer>

#proof[
  Form the deformation to the normal cone [11] Section 5.1,
  $ cal(X) = "Bl"_(Z times 0) \( T times bb(A)^1 \) arrow.r bb(A)^1 . $
  Its central fiber is the reduced union of $T'$ and $Y$. The normal bundle of $Z times 0$ in $T times bb(A)^1$ is $N_(Z \/ T) xor upright(bold(1))$, giving the displayed description of $Y$. In the convention of lines, $cal(O)_(cal(X)) \( Y \) \|_Y = cal(O)_Y \( - 1 \)$. Thus the rational polarization $cal(L) = L - d \[ Y \]$ restricts to the two classes in the statement. The components meet along the exceptional divisor of $T'$, identified in $Y$ with $D_oo$. One can check the geometry in local coordinates $\( y \, x_1 \, dots.h \, x_r \, t \)$, with $Z = { x_1 = dots.h.c = x_r = 0 }$, by blowing up the ideal $\( x_1 \, dots.h \, x_r \, t \)$. In the $t$-chart, $x_i = t v_i$; the exceptional component is $t = 0$, and the family is a submersion there. In the $x_1$-chart, write $x_i = x_1 v_i$ for $i gt.eq 2$ and $t = x_1 s$. The central fiber is the reduced crossing ${ x_1 s = 0 }$, and its double locus is ${ x_1 = s = 0 }$. The other charts are identical. They show that the total space is smooth, the family is flat, and the only nonsubmersion points of the central fiber lie at this double locus. The exceptional normal bundle and the restriction sign also follow from the tautological line in the blowup construction; see [24] Tags 01OF, 02OS, and 0807.
  Ampleness on the two components implies ampleness on the central fiber: the map from their disjoint union to that fiber is finite and surjective, and ampleness descends under such maps. Openness of relative ampleness then makes $cal(L)$ relatively ample after shrinking about zero. Apply these statements to a divisible integral multiple of $cal(L)$; precise forms are [24] Tags 0B5V and 0D2N, and ampleness on components and openness are also given by [15] Proposition 1.2.16 and Theorem 1.2.17. The nonzero fibers are canonically $T$, with polarization $L$. The total space is smooth, and the family is a submersion along $Y \\ D_oo$.
  The scalar action on $Y$ linearizes on its polarization. By Lemma 11, choose a relative projective form whose restriction $hat(omega)_Y$ is invariant. Apply Lemma 10 on $Y$ to pass from $omega_Y$ to $hat(omega)_Y$, preserving the indicated vertical submanifolds. They are scalar-invariant. Moreover $D_oo$ is a union of fixed components of scalar rotation and is automatically preserved by the equivariant isotopy, including at its intersections with the vertical submanifolds.
  The image of the given compact set is now a compact subset of the submersion locus, disjoint from the inverse image of $F$ under the natural map $cal(X) arrow.r T$. Lemma 11 transports a neighborhood into a nearby $T \\ F$, with a Kähler form $hat(omega)_T$ in class $L$. Finally apply Lemma 10 on $T$, preserving the components of $F$, to identify $hat(omega)_T$ with $omega_T$. Composing these maps proves the proposition. All maps are defined on neighborhoods of the relevant compact sets; these neighborhoods can be shrunk at each composition. ◻
]

=== 4.3 An explicit normal-bundle form <an-explicit-normal-bundle-form>

#thm([Lemma 4.4.])[
  (Equal positive normal summands).  #emph[Let $A$ be an ample line bundle on a smooth projective manifold $Z$, equipped with a Hermitian metric of Chern form $sigma > 0$. Suppose 
$ N = A^b xor dots.h.c xor A^b $

 has $ell$ summands, where $b$ is a positive integer. If $d > 0$ and $b d < 1$, the class $sigma + d U$ on $Y = bb(P)_Z \( upright(bold(1)) xor N \)$ has an invariant Kähler representative with the following affine description: 
#[#set math.equation(numbering: n => "(4.1)")
 $ omega_Y = sigma + upright(d) (sum_(j = 1)^ell p_j alpha_j) \, #h(2em) p_j gt.eq 0 \, quad sum_j p_j < d . $ <geo:bundle-form>]

 Here $alpha_j$ is the angular connection of period one on the $j$-th normal line, with curvature $- b sigma$, and the fiber coordinates have standard moments $p_j$. The expression $p_j alpha_j$ is smooth across its zero axis. For rational $d$, this also proves ampleness of the indicated rational polarization.]
  #emph[If $Z = C$ is a curve, then over a compact bordered subsurface $Sigma$ the model, truncated on any compact moment polytope strictly inside $sum p_j < d$, admits a toric horizontal primitive as in Lemma 9, with 
$ kappa \( p \) = (1 - b sum_j p_j) sigma . $

 For bordered exhaustions of $C$ minus finitely many points, the integrated areas converge uniformly on such a polytope to 
$ H \( p \) = \( deg A \) (1 - b sum_j p_j) . $

]
] <geo:bundle>

#proof[
  On the affine chart $N subset bb(P) \( upright(bold(1)) xor N \)$, let $w_1 \, dots.h \, w_ell$ be the normal coordinates, with their induced Hermitian norms. Set
  $ omega_Y = sigma + upright(d) upright(d)^c [d log (1 + sum_j lr(bar.v.double w_j bar.v.double)^2)] . $
  The expression in brackets is the local weight of the dual tautological metric, multiplied by $d$, so its curvature extends globally and represents $d U$. The moments of the normal rotations are
  #[#set math.equation(numbering: n => "(4.2)")
   $ p_j = frac(d lr(bar.v.double w_j bar.v.double)^2, 1 + sum_l lr(bar.v.double w_l bar.v.double)^2) . $ <geo:bundle-moments>]
  Keeping the phases and using radii $sqrt(p_j \/ pi)$ identifies each affine fiber with the standard open ball $sum_j p_j < d$. The inverse radial change is smooth away from the upper boundary, including all zero coordinates. Writing the metric connection in these coordinates yields (4.1). Equivalently, differentiating the potential gives $sum_j p_j alpha_j$. In a unitary local frame, $alpha_j = upright(d) theta_j + A_j$, and $p_j upright(d) theta_j$ is the standard smooth Liouville form of the complex coordinate, while $p_j A_j$ is plainly smooth.
  At any base point choose a holomorphic Chern frame whose metric has zero first derivative at that point. The form then splits into a positive vertical Fubini–Study form and the horizontal form
  $ (1 - b sum_j p_j) sigma . $
  This remains valid on the projective infinity chart, where $sum_j p_j = d$. The horizontal factor is bounded below by $1 - b d > 0$, so the extended form is Kähler. For rational $d$, a divisible integral multiple is the curvature of a positive Hermitian line bundle, which is ample by the Kodaira embedding theorem [15] §1.2.C, p. 43.
  For the curve assertion, every complex line bundle on a bordered surface is smoothly trivial. Choose unitary frames on a slightly larger bordered neighborhood of $Sigma$, so $alpha_j = upright(d) theta_j + A_j$ there. Choose a base primitive $gamma$ of $sigma$. Then
  $ omega_Y = sum_j upright(d) p_j and upright(d) theta_j + upright(d) Gamma_0 \, #h(2em) Gamma_0 = gamma + sum_j p_j A_j \, $
  where $Gamma_0$ is horizontal and toric. Its base differential is $\( 1 - b sum_j p_j \) sigma$. The assertion about integrated areas follows from $integral_Sigma sigma arrow.r integral_C sigma = deg A$. The moment coefficient is continuous and bounded on the fixed compact polytope, so convergence is uniform. ◻
]

=== 4.4 The target ball and its exterior shell <the-target-ball-and-its-exterior-shell>

The complement of a hyperplane $H_oo$ in unit projective space is the open capacity-one ball. More explicitly, in affine coordinates $w in bb(C)^n$ the Fubini–Study moments and phases are

$ p_j = frac(\| w_j \|^2, 1 + sum_l \| w_l \|^2) \, #h(2em) theta_j = frac(arg w_j, 2 pi) . $

The form is $sum_j upright(d) p_j and upright(d) theta_j$, and the map

#[#set math.equation(numbering: n => "(4.3)")
 $ w mapsto w / sqrt(pi \( 1 + sum_l \| w_l \|^2 \)) $ <geo:affine-ball>]

is a symplectomorphism onto ${ z : pi sum_j \| z_j \|^2 < 1 }$. The identity of forms is first verified where all coordinates are nonzero and then extends smoothly across the axes.

#thm([Lemma 4.5.])[
  (A blowup complement is a shell).  #emph[Let $n gt.eq 2$, let $o in bb(P)^n \\ H_oo$, and write 
$ T = "Bl"_o bb(P)^n \, #h(2em) H = pi^(*) c_1 \( cal(O)_(bb(P)^n) \( 1 \) \) . $

 Let $E$ be the exceptional divisor and use $H_oo$ also for its proper transform. For $0 < a < 1$, there is a Kähler form $omega_a$ in class $H - a E$ for which 
$ \( T \\ \( E union H_oo \) \, omega_a \) tilde.eq ({z in bb(C)^n : a < pi sum_j \| z_j \|^2 < 1} \, omega_0) . $

 The same symplectomorphism type holds for every Kähler form in this class. In addition, $A H - B E$ is ample as a rational polarization whenever $A > B > 0$ are rational.]
] <geo:shell>

#proof[
  Choose homogeneous coordinates with $o = \[ 1 : 0 : dots.h.c : 0 \]$ and $H_oo = { z_0 = 0 }$. On $bb(P)^n times bb(C)$ let the circle act by
  $ \( \[ z_0 : z' \] \, v \) mapsto \( \[ z_0 : e^(2 pi i t) z' \] \, e^(- 2 pi i t) v \) . $
  For the product of unit Fubini–Study and the standard form on $bb(C)$, its Hamiltonian is
  $ F = mu - pi \| v \|^2 \, #h(2em) mu = frac(\| z' \|^2, \| z_0 \|^2 + \| z' \|^2) . $
  The level $F = a$ is compact, regular, and the circle acts freely there. Indeed, if $v eq.not 0$ the action is free on that coordinate; if $v = 0$, then $mu = a in \( 0 \, 1 \)$, where the projective scalar action is free. Reduction therefore gives a smooth compact Kähler manifold. This is Lerman’s symplectic cut [16] Section 1.1; its Kähler interpretation is described in [5] Section 2.
  For completeness, its complex model can be identified directly. On the stable set
  $ z' eq.not 0 \, #h(2em) \( z_0 \, v \) eq.not \( 0 \, 0 \) \, $
  the holomorphic map
  $ \( \[ z_0 : z' \] \, v \) mapsto #scale(x: 120%, y: 120%)[\(] \[ z_0 : v z' \] \, \[ z' \] #scale(x: 120%, y: 120%)[\)] $
  takes values in the graph resolution of the projection from $o$, which is $"Bl"_o bb(P)^n$, and its fibers are the free complex scalar orbits. On each such orbit write the positive real scalar as $lambda$. The function
  $ frac(lambda^2 \| z' \|^2, \| z_0 \|^2 + lambda^2 \| z' \|^2) - frac(pi \| v \|^2, lambda^2) $
  is strictly increasing from a value at most zero, or from $- oo$, to the limit one. Consequently it takes the value $a$ exactly once. Each complex orbit meets the level in one circle, and the Kähler quotient has the indicated complex blowup structure.
  On the retained open region $mu > a$, choose the representative
  $ v = sqrt(\( mu - a \) \/ pi) > 0 . $
  The auxiliary complex-line form pulls back to zero on this real slice, so the original Fubini–Study form is unchanged. At $v = 0$, reduction of the level $mu = a$ gives $E tilde.eq bb(P)^(n - 1)$ with line area $a$, as is seen from its moment simplex $sum_j p_j = a$. The proper transform of $H_oo$ is retained in the open region and has unit line area. These two restrictions determine the class $H - a E$: $H \|_E = 0$ and $E \|_E = - c_1 \( cal(O)_E \( 1 \) \)$. Removing $E$ and $H_oo$, and then applying (4.3), gives precisely the stated open shell.
  For any other Kähler representative of $H - a E$, Lemma 10 gives an identification preserving the disjoint complex divisors $E \, H_oo$, and therefore their complement.
  Finally the graph model is a closed subvariety of $bb(P)^n times bb(P)^(n - 1)$. The pullbacks of the two hyperplane classes are $H$ and $H - E$, respectively, since projection from $o$ is defined by hyperplanes through $o$. The restriction of a positive rational product polarization is ample. The identity
  $ A H - B E = \( A - B \) H + B \( H - E \) $
  therefore proves the last assertion. ◻
]

== 5 Applications of curves cut out by quadrics <app:applications>

We prove the cases of Theorem 1 that can be obtained from complete intersection curves of quadrics. All capacities in this section are normalized to a target of capacity one. We use the surface packing Lemma 9 and the geometric constructions of the preceding section with their neighborhood and relative avoidance conclusions.

=== 5.1 Complete intersections and their normal models <complete-intersections-and-their-normal-models>

#thm([Lemma 5.1.])[
  #emph[Let $N gt.eq 3$, and let $F subset bb(P)^N$ be a hyperplane. There is a smooth connected curve $C$, the complete intersection of $N - 1$ quadrics, transverse to $F$. If $A = cal(O)_(bb(P)^N) \( 1 \) \|_C$, then 
#[#set math.equation(numbering: n => "(5.1)")
 $ deg A = 2^(N - 1) \, #h(2em) N_(C \/ bb(P)^N) = \( A^(⊗ 2) \)^(xor \( N - 1 \)) \, #h(2em) g \( C \) = 1 + \( N - 3 \) 2^(N - 2) . $ <app:quadric-data>]

 Writing $H$ for the hyperplane pullback and $E_C$ for the exceptional divisor of $"Bl"_C bb(P)^N$, the rational class $H - d E_C$ is ample whenever $0 < d < 1 \/ 2$. The class 
$ A + d U quad upright("on") quad bb(P)_C #scale(x: 120%, y: 120%)[\(] upright(bold(1)) xor \( A^(⊗ 2) \)^(xor \( N - 1 \)) #scale(x: 120%, y: 120%)[\)] $

 is ample for the same range of rational $d$.]
] <app:quadrics>

#proof[
  The quadratic Veronese system restricts to a generated linear system defining a closed immersion on every smooth intermediate intersection, and on its intersection with $F$. Bertini’s theorem [24] Tag 0FD6, applied successively to both, therefore gives $N - 1$ quadrics whose intersection is a smooth curve transverse to $F$. The Koszul resolution of its structure sheaf has terms that are sums of $cal(O)_(bb(P)^N) \( - 2 j \)$, $1 lt.eq j lt.eq N - 1$. The vanishings $H^i \( bb(P)^N \, cal(O) \( t \) \) = 0$ for $0 < i < N$ [24] Tag 01XT, together with the absence of global sections of these negative twists, give $H^0 \( C \, cal(O)_C \) = bb(C)$. In particular, $C$ is connected.
  The intersection class is $\( 2 H \)^(N - 1)$, so intersection with one further hyperplane gives $deg A = 2^(N - 1)$. The defining equations form a regular sequence; hence their classes identify the conormal bundle with $\( A^(- 2) \)^(xor \( N - 1 \))$. This proves the assertion about the normal bundle. Taking determinants in the tangent-normal exact sequence gives
  $ K_C = K_(bb(P)^N) \|_C ⊗ det N_(C \/ bb(P)^N) = A^(⊗ \( N - 3 \)) . $
  Consequently $2 g \( C \) - 2 = \( N - 3 \) 2^(N - 1)$, proving (5.1). These uses of Bertini, the Koszul resolution, and adjunction are in their usual smooth projective form [14]; the regular-sequence and conormal statements are also given in [24] Tags 063C and 06AA.
  The quadric equations generate $cal(I)_C \( 2 \)$, and hence give a surjection of graded sheaves of algebras
  $ cal(O)_(bb(P)^N) \[ T_1 \, dots.h \, T_(N - 1) \] arrow.r xor.big_(j gt.eq 0) cal(I)_C^j \( 2 j \) . $
  The relative Proj of the target is $"Bl"_C bb(P)^N$: twisting the degree-$j$ part of the Rees algebra by $cal(O) \( 2 j \)$ leaves its relative Proj unchanged. Thus this surjection gives a closed embedding
  $ "Bl"_C bb(P)^N arrow.r.hook bb(P)^N times bb(P)^(N - 2) . $
  The hyperplane classes of the factors pull back to $H$ and $2 H - E_C$. For rational $0 < d < 1 \/ 2$, the identity
  $ H - d E_C = \( 1 - 2 d \) H + d \( 2 H - E_C \) $
  expresses this class as the restriction of a positive rational product polarization. After clearing denominators, a Segre–Veronese embedding shows that it is ample.
  Finally, choose a positive curvature form $sigma$ for $A$. Lemma 13, with normal exponent two, gives a Kähler form in $A + d U$: its horizontal coefficient is $1 - 2 sum p_j gt.eq 1 - 2 d > 0$, also at infinity. A rational class admitting a Kähler representative is ample by the Kodaira criterion, after clearing denominators. ◻
]

Here and below an angular connection on a line bundle has period one. For an integer $m gt.eq 1$, write $t = sum_(j = 1)^m p_j$. Integration over the standard simplex gives

#[#set math.equation(numbering: n => "(5.2)")
 $ integral_({ p gt.eq 0 : t lt.eq h }) f \( t \) thin d p = frac(1, \( m - 1 \) !) integral_0^h f \( t \) t^(m - 1) thin d t \, #h(2em) integral_(bb(R)_(gt.eq 0)^m) \( r - t \)_(+) thin d p = frac(r^(m + 1), \( m + 1 \) !) . $ <app:simplex-integrals>]

For the first identity, the volume of ${ p gt.eq 0 : t lt.eq h }$ is $h^m \/ m !$, by scaling the unit simplex, whose volume is $1 \/ m !$ by iterated integration. Differentiating this volume gives the first formula, initially for continuous $f$. The second follows by taking $f \( t \) = r - t$ on $\[ 0 \, r \]$.

=== 5.2 All capacities below one half <all-capacities-below-one-half>

#thm([Proposition 5.2.])[
  #emph[Let $n gt.eq 3$, and let $rho_1 \, dots.h \, rho_k$ be positive real numbers with 
$ rho_i < 1 / 2 quad \( 1 lt.eq i lt.eq k \) \, #h(2em) sum_(i = 1)^k rho_i^n < 1 . $

 Then the closed balls of capacities $rho_i$ admit a disjoint symplectic packing into $"int" B^(2 n) \( 1 \)$, with embeddings defined on neighborhoods of the closed source balls.]
] <app:small>

#proof[
  Set $m = n - 1$. The displayed inequalities are strict and there are finitely many of them. By continuity and density of the rationals, choose rational numbers $r_i > rho_i$ such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ r_(*) := max_i r_i < 1 / 2 \, #h(2em) sum_i r_i^n < 1 . $ <app:small-slack>]
  For $0 < h < 1 \/ 2$, formula (5.2) gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ J_m \( h \) := integral_({ t lt.eq h }) 2^m \( 1 - 2 t \) thin d p = frac(2^m h^m, m !) (1 - frac(2 m h, m + 1)) arrow.r frac(1, n !) quad \( h arrow.t 1 / 2 \) . $ <app:small-volume>]
  It follows from (5.3) that we can choose rational parameters satisfying
  #[#set math.equation(numbering: n => "(5.5)")
   $ r_(*) < h < d < 1 / 2 \, #h(2em) J_m \( h \) > frac(1, n !) sum_i r_i^n . $ <app:small-truncation>]
  Indeed, choose $h$ sufficiently close to $1 \/ 2$ and then choose $d$ strictly between $h$ and $1 \/ 2$; each requirement is open.
  Apply Lemma 15 in $bb(P)^n$, with the forbidden hyperplane $H_oo$. Deform to the normal cone of the resulting curve $C$, using the class $H - d \[ Y \]$. On the two central components the polarizations are $H - d E_C$ and $A + d U$, respectively. Both are ample by that lemma, so Proposition 12 applies. On the normal component use the form of Lemma 13. Its affine part, truncated at $t lt.eq h$, is
  #[#set math.equation(numbering: n => "(5.6)")
   $ sigma + upright(d) sum_(j = 1)^m p_j alpha_j \, #h(2em) upright(d) alpha_j = - 2 sigma \, #h(2em) integral_C sigma = 2^m . $ <app:small-model>]
  The strict inequality $h < d$ supplies a neighborhood of the entire truncated region in the affine part.
  Let $C^o = C \\ \( C ∩ H_oo \)$. The removed set is finite, and $C^o$ has the positive genus calculated in (5.1). Exhaust it by compact connected smooth bordered surfaces $Sigma_ell$, with collars contained in $C^o$. For example, remove progressively smaller disjoint coordinate disks about the punctures. Each such surface has the same genus as $C$. Since $H^2 \( Sigma_ell \; bb(Z) \) = 0$, the normal line bundles admit smooth unitary frames on a slightly larger bordered surface. Write in those frames $alpha_j = upright(d) theta_j + A_j$, where $upright(d) A_j = - 2 sigma$, and choose $gamma_ell$ with $upright(d) gamma_ell = sigma$. The form (5.6) becomes
  $ omega_V + upright(d) Gamma_(0 \, ell) \, #h(2em) Gamma_(0 \, ell) = gamma_ell + sum_j p_j A_j \, #h(2em) upright(d)_C Gamma_(0 \, ell) = \( 1 - 2 t \) sigma > 0 $
  on a neighborhood of $Sigma_ell times V$, for $Delta = { p gt.eq 0 : t lt.eq h }$. The polar notation is smooth at every axis: if $z_j = x_j + i y_j$, then $p_j upright(d) theta_j = \( x_j upright(d) y_j - y_j upright(d) x_j \) \/ 2$. The integrated horizontal forms converge uniformly on $Delta$ to
  $ H_0 \( p \) = 2^m \( 1 - 2 t \) \, $
  since $integral_(Sigma_ell) sigma arrow.r integral_C sigma$ and $1 - 2 t$ is bounded there.
  We verify all the remaining hypotheses of the surface packing lemma. Each auxiliary simplex ${ t lt.eq r_i }$ lies strictly inside the outer face of $Delta$, by (5.5). The function
  $ P \( p \) = H_0 \( p \) - sum_i \( r_i - t \)_(+) $
  is continuous and concave, being affine minus a sum of convex functions. Choose $r_(*) \/ h < tau < 1$. On $Delta \\ tau Delta$ every cap vanishes, and hence
  $ P \( p \) = H_0 \( p \) gt.eq 2^m \( 1 - 2 h \) > 0 . $
  Finally, (5.2) and (5.5) give
  $ integral_Delta P thin d p = J_m \( h \) - frac(1, n !) sum_i r_i^n > 0 . $
  Thus $P$ has positive mean and meets the hypotheses of Lemma 2. All the hypotheses of Lemma 9 now hold. Since $rho_i < r_i$, that lemma provides a compact packing of the requested closed balls in the interior of a sufficiently large surface model.
  This packing lies away from the infinity locus of the normal component and from its fibers over $C ∩ H_oo$. These forbidden fibers are smooth and pairwise disjoint. Proposition 12 therefore transfers the packing into $bb(P)^n \\ H_oo$ with the standard unit Fubini–Study form; the prescribed-form conclusion uses Lemma 10 preserving $H_oo$. The usual projective moment coordinates identify this complement with $"int" B^(2 n) \( 1 \)$. All transfers are defined on neighborhoods of the compact packing. Together with $h < d$ and the capacity slack $rho_i < r_i$, this proves the asserted neighborhood statement. ◻
]

=== 5.3 A distinguished large ball in dimension at least eight <a-distinguished-large-ball-in-dimension-at-least-eight>

#thm([Proposition 5.3.])[
  #emph[Let $n gt.eq 4$, let $A gt.eq 1 \/ 2$, and let $rho_1 \, dots.h \, rho_k > 0$ satisfy 
$ A^n + sum_i rho_i^n < 1 \, #h(2em) A + rho_i < 1 quad \( 1 lt.eq i lt.eq k \) . $

 Then the closed ball of capacity $A$ and the closed balls of capacities $rho_i$ admit a disjoint symplectic packing into $"int" B^(2 n) \( 1 \)$, with embeddings on neighborhoods of all source balls.]
] <app:large>

#proof[
  The case of no remaining balls is immediate, so suppose $k gt.eq 1$. Continuity of the finitely many strict inequalities allows rational parameters $a \, r_1 \, dots.h \, r_k$ with
  #[#set math.equation(numbering: n => "(5.7)")
   $ 1 / 2 < a < 1 \, #h(2em) A < a \, #h(2em) rho_i < r_i < s := 1 - a \, #h(2em) sum_i r_i^n < 1 - a^n . $ <app:large-slack>]
  For completeness, the point $\( A \, rho_1 \, dots.h \, rho_k \)$ has a neighborhood on which the volume and pairwise inequalities remain strict. Choose $a > A$ in that neighborhood, also $a > 1 \/ 2$, and then choose the $r_i > rho_i$ within it. Rational choices exist because all increments may be taken arbitrarily small. In particular $0 < s < 1 \/ 2$.
  Lemma 14 lets us reserve the central ball of capacity $a$ and seek the remaining packing in its exterior shell, whose volume is $\( 1 - a^n \) \/ n !$. We construct surface models of this shell in two stages: first a normal line over a hyperplane, then a normal model of a curve inside that hyperplane. The second model will be embedded symplectically in the base of the first; pulling back the first normal line then gives a model over the curve.
  Put $q = n - 2$ and $r_(*) := max_i r_i$. For now take rational parameters with
  $ r_(*) < h_1 < d_1 < s \, #h(2em) r_(*) < h_2 < d_2 < 1 / 2 . $
  The construction below works for every such choice and every sufficiently large bordered piece of the curve. We will fix the parameters after computing the model’s volume.
  ===== 5.3.1 The two normal constructions. <the-two-normal-constructions.>
  Take $T = "Bl"_o bb(P)^n$, $L = H - a E$, and the two disjoint forbidden divisors $E \, H_oo$ of Lemma 14. Choose a hyperplane not containing $o$ and different from $H_oo$; its strict transform $D$ is isomorphic to $bb(P)^(n - 1)$ and is disjoint from $E$. Its normal line is $cal(O)_D \( 1 \)$, and $L \|_D = cal(O)_D \( 1 \)$. Choose it so that $F = D ∩ H_oo$ is a hyperplane in $D$.
  Deform to the normal cone of $D$ with parameter $d_1$. The strict component has class $\( 1 - d_1 \) H - a E$, which is ample: on the blowup of projective space at a point, $x H - y E$ is ample for $x > y > 0$, and here $1 - d_1 > a > 0$. This ampleness criterion is proved in Lemma 14. The other component is
  $ Y_1 = bb(P)_D \( upright(bold(1)) xor cal(O)_D \( 1 \) \) \, #h(2em) cal(O)_D \( 1 \) + d_1 U_1 . $
  Fix a unit Fubini–Study form $omega_D$ on $D$, and write $u$ for the moment of the first normal line. By Lemma 13, this class is ample and has an affine normal model
  #[#set math.equation(numbering: n => "(5.8)")
   $ omega_D + upright(d) \( u alpha_1 \) \, #h(2em) upright(d) alpha_1 = - omega_D \, #h(2em) 0 lt.eq u < d_1 . $ <app:first-model>]
  There is a neighborhood of the truncation $u lt.eq h_1$ in this model. The forbidden preimage in $Y_1$ lies over $F$; the preimage of $E$ is empty.
  Apply Lemma 15 inside the fixed base $D = bb(P)^(n - 1)$, now with $N = n - 1$ and forbidden hyperplane $F$. We obtain a curve $C$ of degree $2^q$ and genus
  $ g \( C \) = 1 + \( n - 4 \) 2^(n - 3) gt.eq 1 \, $
  with normal bundle $cal(O)_C \( 2 \)^(xor q)$. The second normal construction, with parameter $d_2$, is ample on both components by Lemma 15. Write $sigma$ for a positive curvature form of $cal(O)_C \( 1 \)$; its integral is $2^q$. Its affine normal model is
  #[#set math.equation(numbering: n => "(5.9)")
   $ omega_X = sigma + upright(d) lambda \, #h(2em) lambda = sum_(j = 2)^(n - 1) v_j alpha_j \, #h(2em) upright(d) alpha_j = - 2 sigma \, #h(2em) sum_(j = 2)^(n - 1) v_j < d_2 . $ <app:second-model>]
  Exhaust $C \\ F$ by bordered surfaces $Sigma$, as in the proof of Proposition 16. For each such $Sigma$, the truncation $sum v_j lt.eq h_2$ is a compact region away from infinity and from the finitely many forbidden fibers. Proposition 12, with its prescribed Kähler form conclusion, gives a symplectic embedding of a neighborhood of this region into $\( D \\ F \, omega_D \)$. After shrinking that neighborhood, choose an open collar enlargement $Sigma^(+)$ of $Sigma$, with compact closure in $C \\ F$ and deformation retracting onto $Sigma$. We can take the domain $X$ to be an open disk bundle over $Sigma^(+)$ with fiberwise star-shaped fibers, containing a neighborhood of the prescribed compact truncation. Denote this embedding by
  $ phi.alt : \( X \, omega_X \) arrow.r \( D \\ F \, omega_D \) . $
  All line bundles over the bordered curve pieces will be smoothly framed; the embeddings $phi.alt$ are only required to be symplectic.
  ===== 5.3.2 Lifting the base embedding and changing coordinates. <lifting-the-base-embedding-and-changing-coordinates.>
  Pull back the Hermitian normal line in (5.8), with its unitary connection, along $phi.alt$. Its angular connection has curvature $- phi.alt^(*) omega_D = - omega_X$. Let $"pr" : X arrow.r Sigma^(+)$ denote the bundle projection and $i : Sigma^(+) arrow.r X$ its zero section. The contraction of the disk fibers gives $H^2 \( X \; bb(Z) \) = H^2 \( Sigma^(+) \; bb(Z) \) = H^2 \( Sigma \; bb(Z) \) = 0$. Hence the pulled-back line and $"pr"^(*) cal(O)_C \( 1 \)$ admit a smooth unitary bundle identification. Let $alpha_(1 \, C)$ be the angular connection on the latter line, pulled back from the curve and with curvature $- sigma$. The connection
  $ alpha_(1 \, C) - lambda $
  has curvature $- sigma - upright(d) lambda = - omega_X$ too. The difference between the pulled-back connection and this reference connection is therefore a closed ordinary one-form $xi$ on $X$.
  Set $eta = i^(*) xi$, which is a closed one-form on $Sigma^(+)$. Radial contraction in the disk fibers and the homotopy formula give
  $ xi = "pr"^(*) eta + upright(d) f $
  for a smooth real function $f$ on $X$. For instance, in a unitary trivialization the contraction is $\( x \, z \) mapsto \( x \, t z \)$, and one can take $f \( x \, z \) = integral_0^1 xi_(\( x \, t z \)) \( 0 \, z \) thin d t$. A unitary gauge change removes $upright(d) f$. Thus, omitting pullback symbols, the pulled-back first connection has the precise expression
  #[#set math.equation(numbering: n => "(5.10)")
   $ alpha_(1 \, C) - sum_(j = 2)^(n - 1) v_j alpha_j + eta . $ <app:lifted-connection>]
  There is no assertion that $eta$ is exact; its periods are retained. These operations are smooth unitary operations, so they preserve the first fiber moment $u$ and require no holomorphic lift of $phi.alt$.
  The lifted form (5.8) is consequently
  #[#set math.equation(numbering: n => "(5.11)")
   $ sigma + upright(d) (u \( alpha_(1 \, C) + eta \) + \( 1 - u \) sum_(j = 2)^(n - 1) v_j alpha_j) . $ <app:lifted-form>]
  The terms $v_j alpha_j$ extend smoothly over zero: in a unitary frame, $alpha_j = upright(d) theta_j + A_j$ and $v_j upright(d) theta_j = \( x_j upright(d) y_j - y_j upright(d) x_j \) \/ 2$. Use the disk coordinates $z_1 \, z_2 \, dots.h \, z_(n - 1)$ with $u = pi \| z_1 \|^2$ and $v_j = pi \| z_j \|^2$. The actual smooth change of coordinates
  #[#set math.equation(numbering: n => "(5.12)")
   $ zeta_1 = z_1 \, #h(2em) zeta_j = sqrt(1 - pi \| z_1 \|^2) thin z_j quad \( 2 lt.eq j lt.eq n - 1 \) $ <app:moment-change>]
  is a diffeomorphism on $u < 1$, with smooth inverse there, including all coordinate axes. Its moments are
  $ p_1 = u \, #h(2em) p_j = \( 1 - u \) v_j quad \( j gt.eq 2 \) \, $
  and its angles agree with the previous ones. Write $w = sum_(j = 2)^(n - 1) p_j$. The truncations $u lt.eq h_1$ and $sum_(j = 2)^(n - 1) v_j lt.eq h_2$ become
  #[#set math.equation(numbering: n => "(5.13)")
   $ Delta = Delta \( h_1 \, h_2 \) = { p gt.eq 0 : u lt.eq h_1 \, med w + h_2 u lt.eq h_2 } . $ <app:large-polytope>]
  Writing $alpha_(1 \, C) = upright(d) theta_1 + A_1$ with $upright(d) A_1 = - sigma$, and choosing $gamma$ with $upright(d) gamma = sigma$, expression (5.11) becomes
  #[#set math.equation(numbering: n => "(5.14)")
   $ omega_V + upright(d) Gamma_0 \, #h(2em) Gamma_0 = gamma + p_1 \( A_1 + eta \) + sum_(j = 2)^(n - 1) p_j A_j \, #h(2em) upright(d)_C Gamma_0 = \( 1 - u - 2 w \) sigma . $ <app:large-surface-form>]
  This is a horizontal smooth toric primitive in precisely the coordinates used by Lemma 9. Its horizontal coefficient is bounded below on $Delta$ by
  #[#set math.equation(numbering: n => "(5.15)")
   $ 1 - u - 2 w gt.eq \( 1 - u \) \( 1 - 2 h_2 \) gt.eq \( 1 - h_1 \) \( 1 - 2 h_2 \) > 0 . $ <app:large-positive>]
  The strict truncation inequalities, the base collars, and the smooth inverse in (5.12) give the model on a neighborhood of $Sigma times V$. For each fixed choice of the truncation parameters, the constructions can be made for arbitrarily large $Sigma$. Their integrated horizontal coefficients converge uniformly to
  $ H_0 \( p \) = 2^q \( 1 - u - 2 w \) \, $
  because $integral_Sigma sigma arrow.r 2^q$ and $1 - u - 2 w$ is bounded on the fixed $Delta$.
  ===== 5.3.3 Choosing a model with enough volume. <choosing-a-model-with-enough-volume.>
  For $0 < h_2 < 1 \/ 2$, integration in the $q$ moments different from $u$ gives
  $ integral_({ w lt.eq h_2 \( 1 - u \) }) 2^q \( 1 - u - 2 w \) thin d p_2 dots.h.c d p_(n - 1) = B_q \( h_2 \) \( 1 - u \)^(q + 1) \, $
  where
  $ B_q \( h_2 \) = 2^q (frac(h_2^q, q !) - frac(2 q h_2^(q + 1), \( q + 1 \) !)) arrow.r frac(1, \( q + 1 \) !) quad \( h_2 arrow.t 1 / 2 \) . $
  Thus
  #[#set math.equation(numbering: n => "(5.16)")
   $ integral_(Delta \( h_1 \, h_2 \)) H_0 thin d p = B_q \( h_2 \) frac(1 - \( 1 - h_1 \)^n, n) arrow.r frac(1 - a^n, n !) quad #scale(x: 120%, y: 120%)[\(] h_1 arrow.t s \, med h_2 arrow.t 1 / 2 #scale(x: 120%, y: 120%)[\)] . $ <app:large-volume>]
  Now fix these parameters. By (5.7), they can be chosen rationally so that
  #[#set math.equation(numbering: n => "(5.17)")
   $ r_(*) < h_1 < d_1 < s \, #h(2em) r_(*) < h_2 < d_2 < 1 / 2 \,\
integral_(Delta \( h_1 \, h_2 \)) H_0 thin d p > frac(1, n !) sum_i r_i^n . $ <app:large-truncation>]
  Indeed, the last inequality holds for $h_1 \, h_2$ sufficiently close to their limits, where the first two lower bounds also hold; $d_1 \, d_2$ can then be inserted between the chosen truncations and their respective limits.
  ===== 5.3.4 The surface packing conditions and transfer to the shell. <the-surface-packing-conditions-and-transfer-to-the-shell.>
  The defining outer inequalities of $Delta$ have nonnegative coefficients, as required by Lemma 2. If $u + w lt.eq r_i$, then
  $ u lt.eq r_i < h_1 \, #h(2em) w + h_2 u lt.eq w + u lt.eq r_i < h_2 . $
  Thus every auxiliary simplex is contained in $Delta$ strictly away from its outer faces. The difference
  $ P \( p \) = H_0 \( p \) - sum_i \( r_i - u - w \)_(+) $
  is continuous and concave. Choose
  $ max { r_(*) \/ h_1 \, r_(*) \/ h_2 } < tau < 1 . $
  The same inequalities show that all cap supports lie in $tau Delta$, whose outer equations are $u lt.eq tau h_1$ and $w + h_2 u lt.eq tau h_2$. Outside that smaller polytope, $P = H_0$, and (5.15) gives the uniform positive lower bound $2^q \( 1 - h_1 \) \( 1 - 2 h_2 \)$. Finally, (5.2) and (5.17) give
  $ integral_Delta P thin d p = integral_Delta H_0 thin d p - frac(1, n !) sum_i r_i^n > 0 . $
  These verifications establish the hypotheses of Lemmas 2 and 9.
  The latter lemma packs the closed balls of capacities $rho_i < r_i$ in one of the sufficiently large models (5.14). Composing with the smooth coordinate identification and the lifted embedding puts this compact packing in $Y_1$, with $u < d_1$, over $D \\ F$. It avoids both infinity and the forbidden preimage, which is the smooth projective line bundle over $F$. In the first normal construction, $E$ and $H_oo$ are disjoint smooth divisors; their intersections with $D$ are respectively empty and $F$. Proposition 12 therefore transfers the compact packing to $T \\ \( E union H_oo \)$ with a Kähler form in $H - a E$. Lemma 14 identifies this complement symplectically with
  $ { z in bb(C)^n : a < pi sum_j \| z_j \|^2 < 1 } . $
  The distinguished closed ball of capacity $A < a$ occupies the central standard ball and is disjoint from this shell packing. All constructed images are compact subsets of the open target. Every embedding used above is defined on a neighborhood of the relevant compact subset; shrinking those neighborhoods under the finitely many compositions retains the neighborhood embeddings of the source balls and their disjointness. ◻
]

== 6 A distinguished large ball in real dimension six <six:section>

In complex dimension three, the hyperplane construction of Proposition 17 would use a plane conic. Its genus is zero, so it cannot supply the handle required by Lemma 9. We instead use a smooth plane cubic to construct a model for the shell outside a reserved ball. Throughout this section we use rational parameters

#[#set math.equation(numbering: n => "(6.1)")
 $ 1 / 2 < a < 1 \, #h(2em) s = 1 - a \, #h(2em) b = frac(2 - a, 3) = frac(1 + s, 3) . $ <six:parameters>]

In particular $0 < s < b$. All projective spaces and varieties in this section are complex. The notation $cal(O)_C \( j \)$, for a plane curve $C$, means the restriction of $cal(O)_(bb(P)^2) \( j \)$.

The target is the shell

$ { z in bb(C)^3 : a < pi sum_j \| z_j \|^2 < 1 } $

of Lemma 14. We first identify a quadric normal model that transfers into this shell. A lower circle cut of an auxiliary threefold realizes that model. We then construct a model over a cubic curve and transfer its compact regions into the auxiliary threefold, preserving the cutting moment.

=== 6.1 The quadric normal model <the-quadric-normal-model>

Let $T = "Bl"_o bb(P)^3$, where $o in.not H_oo$, and put $L = H - a E$. Here $H$ is the hyperplane pullback and $E$ is the exceptional divisor. Choose a smooth quadric through $o$, general with respect to $H_oo$, and let $D$ be its strict transform.

#thm([Lemma 6.1.])[
  #emph[There is an identification $D = "Bl"_(q_1 \, q_2) bb(P)^2$, for two distinct points $q_1 \, q_2$. Write $M$ for the pullback of the plane hyperplane class and $e_i$ for the exceptional divisor class over $q_i$. Under this identification, 
#[#set math.equation(numbering: n => "(6.2)")
 $ H \|_D = 2 M - e_1 - e_2 \, #h(2em) E \|_D = M - e_1 - e_2 . $ <six:quadric-classes>]

 Consequently 
#[#set math.equation(numbering: n => "(6.3)")
 $ N_(D \/ T) = cal(O)_D \( 3 M - e_1 - e_2 \) \, #h(2em) L \|_D = 3 b M - s \( e_1 + e_2 \) . $ <six:normal-class>]

 For every rational $0 < c < s$, deformation to the normal cone of $D$ has ample component classes 
$ \( 1 - 2 c \) H - \( a - c \) E quad upright("and") quad 3 b M - s \( e_1 + e_2 \) + c U $

 on its strict component and on 
#[#set math.equation(numbering: n => "(6.4)")
 $ Y = bb(P)_D #scale(x: 120%, y: 120%)[\(] upright(bold(1)) xor cal(O)_D \( 3 M - e_1 - e_2 \) #scale(x: 120%, y: 120%)[\)] \, $ <six:Y>]

 respectively. The intersections of $D$ with $E$ and $H_oo$ are disjoint smooth curves; their images in $bb(P)^2$ are a line $ell$ and a smooth conic $Q$, both through $q_1 \, q_2$.]
] <six:quadric>

#proof[
  Projection from $o$ on the quadric becomes a morphism after blowing up $o$. It contracts the strict transforms of the two ruling lines through $o$, which are disjoint curves of self-intersection $- 1$. One can see both the morphism and its inverse in the equation
  $ x_0 x_1 = x_2 x_3 \, #h(2em) o = \[ 1 : 0 : 0 : 0 \] . $
  Projection is to $\[ x_1 : x_2 : x_3 \]$; the inverse is the quadratic map
  $ \[ u : v : w \] mapsto \[ v w : u^2 : u v : u w \] \, $
  whose two simple base points are $\[ 0 : 1 : 0 \]$ and $\[ 0 : 0 : 1 \]$. Its resolution identifies $D$ with the stated two-point blowup. The inverse quadratic system gives the first equality in (6.2); the exceptional curve over $o$ is the strict transform of $u = 0$, giving the second equality. Since $\[ D \] = 2 H - E$, restriction gives (6.3).
  The strict component class is ample because
  $ a - c > 0 \, #h(2em) \( 1 - 2 c \) - \( a - c \) = s - c > 0 . $
  The restrictions of the class on $Y$ to its zero and infinity sections are $L \|_D$ and $\( L - c D \) \|_D$, and its fiber degree is $c > 0$. These conditions imply ampleness here. Indeed, subtract a sufficiently small ample class on $Y$; the two section restrictions remain ample and the fiber degree remains positive. By Hirschowitz’s invariant-cycle argument, recalled in [12] Section 2, every curve is rationally, hence numerically, equivalent to an effective cycle invariant under scalar multiplication in the normal line. Its irreducible components lie in the fixed sections or in fibers. The perturbed class is therefore nef. Adding back the small ample class proves ampleness by [15] Corollary 1.4.10.
  Finally, $E$ and $H_oo$ are disjoint, and their restrictions to a general $D$ are smooth. Their classes in (6.2) identify their plane images as the line and conic asserted. The conic is smooth for a general choice of the quadric. Their strict transforms are disjoint; equivalently, their only plane intersections are the two marked points, with distinct tangent directions there. ◻
]

The normal-cone transfer of Proposition 12 will be applied to $Y$ away from infinity and from the two vertical submanifolds over $D ∩ E$ and $D ∩ H_oo$. We next realize the required part of $Y$ by a cut of another threefold.

=== 6.2 The lower cut and its complex structure <the-lower-cut-and-its-complex-structure>

Put

$ V_0 = bb(P)_(bb(P)^2) #scale(x: 120%, y: 120%)[\(] upright(bold(1)) xor cal(O)_(bb(P)^2) \( 3 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) hat(V) = "Bl"_(\( q_1 \, 0 \) \, \( q_2 \, 0 \)) V_0 . $

The two points lie in the zero section. Write $U_1$ for the pullback of the dual tautological class on $V_0$, and $hat(E)_i$ for the point exceptional divisors. The circle rotating the $cal(O) \( 3 \)$ summand lifts to $hat(V)$.

The next lemma assumes an invariant Kähler representative. The cubic family below supplies it: Lemma 20 establishes its polarization, and the subsequent full-section construction and circle average give the required form.

#thm([Lemma 6.2.])[
  #emph[Suppose $s < d_1 < b$ and $hat(V)$ has an invariant Kähler form in the class 
#[#set math.equation(numbering: n => "(6.5)")
 $ A = 3 b M + d_1 U_1 - s \( hat(E)_1 + hat(E)_2 \) . $ <six:Vhat-class>]

 Normalize its first moment $p_1$ to be zero on the strict bottom section $D = "Bl"_(q_1 \, q_2) bb(P)^2$. For $0 < c < s$, the cut retaining $p_1 lt.eq c$ is the complex projective bundle $Y$ of (6.4), with an invariant Kähler form in class 
$ 3 b M - s \( e_1 + e_2 \) + c U . $

 Its open retained region is symplectically identified with ${ p_1 < c } subset hat(V)$, and this identification preserves the projection to $D$ on the attracting basin of the bottom section. In particular it preserves avoidance of inverse images of $ell union Q$ in the plane.]
] <six:cut>

#proof[
  The circle is Hamiltonian: $H^1 \( hat(V) \; bb(R) \) = 0$, since the projective bundle over $bb(P)^2$ has vanishing first cohomology and point blowups preserve it. Thus contraction of the invariant form with its generating vector field is exact. The bottom and upper sections are fixed. At either point before blowing up, the tangent weights are $0 \, 0 \, 1$, the first two being the plane directions. Thus on the exceptional $bb(P)^2$ the fixed loci are the projectivized base directions, a line belonging to the bottom section, and the pure vertical point. A line connecting these loci has area $s$ and weight one. Its moment difference is therefore $s$. An ordinary projective fiber has area $d_1$ and weight one at the bottom. It follows that the fixed levels are exactly
  #[#set math.equation(numbering: n => "(6.6)")
   $ 0 \, quad s \, quad d_1 . $ <six:fixed-levels>]
  The attracting basin $cal(B)$ of the bottom section for complex scalar contraction is the total space of
  $ N' = cal(O)_D \( 3 M - e_1 - e_2 \) . $
  To verify this including the exceptional directions, use base coordinates $y_1 \, y_2$ at a marked point and an original line coordinate $z$. In the blowup chart with nonzero first base direction,
  $ y_2 = y_1 v \, #h(2em) z = y_1 w . $
  The contraction acts by $w mapsto lambda w$. On the other base chart $w' = w \/ v$, so this coordinate is a fiber coordinate in $pi^(*) cal(O) \( 3 \) ⊗ cal(O)_D \( - e_1 - e_2 \)$. The charts with nonzero base direction, together with the original charts away from the marked points, give its entire total space. The omitted pure vertical direction does not contract to the bottom. This proves the description of $cal(B)$.
  We emphasize that $cal(B)$ is an attracting basin, not a moment sublevel. It contains ${ p_1 < s }$. Indeed, contraction decreases the moment strictly along every nonconstant complex orbit. Its limit exists on the projective variety and is fixed. For a point of moment less than $s$, (6.6) forces this limit to lie in the bottom section. Along a nonzero fiber of $N'$, the opposite limit is at level $s$ or $d_1$.
  Form the Kähler reduction of $hat(V) times bb(C)$ by the diagonal circle at
  #[#set math.equation(numbering: n => "(6.7)")
   $ p_1 + pi \| v \|^2 = c . $ <six:cut-equation>]
  Every point of this level lies over $cal(B)$, since its first moment is at most $c < s$. In $N' xor upright(bold(1))$, each nonzero pair $\( w \, v \)$ has a unique circle in its complex scalar orbit satisfying (6.7). At contraction the total moment tends to zero. At expansion it tends to infinity if $v eq.not 0$, and to $s$ or $d_1$ if $v = 0$; all these limits exceed $c$. Strict moment increase proves the uniqueness. The circle acts freely there because the fiber weights are one.
  The holomorphic quotient of the nonzero pairs is $bb(P)_D \( N' xor upright(bold(1)) \)$. The preceding orbit description identifies it with the reduction, with its Kähler complex structure. This is also the usual holomorphic-quotient description of Kähler cutting; see [5] Section 2. For completeness, the quotient map is holomorphic and constant on complex scalar orbits. The complex orthogonal complement of an orbit at the level identifies its complex tangent quotient with the tangent space of this projectivization. Positivity of the ambient Kähler form therefore gives precisely the asserted Kähler structure.
  The map
  $ x mapsto #scale(x: 120%, y: 120%)[\[] x \, sqrt(\( c - p_1 \( x \) \) \/ pi) thin #scale(x: 120%, y: 120%)[\]] \, #h(2em) p_1 \( x \) < c \, $
  uses a positive real additional coordinate and is symplectic: the pullback of its standard area form vanishes. It preserves the base point in $D$, although it is not in general holomorphic. The quotient class restricts on the bottom to $3 b M - s \( e_1 + e_2 \)$. Its projective fiber area is $c$, from the residual weight-one moment interval $\[ 0 \, c \]$. These two data determine the class on this projective bundle. The base-preserving description also proves the last assertion. ◻
]

=== 6.3 A cubic degeneration and the ample class on its component <a-cubic-degeneration-and-the-ample-class-on-its-component>

Choose a smooth plane cubic $C$ through $q_1 \, q_2$, general enough to meet $ell union Q$ in finitely many points and to be smooth at the marked points. Such a choice exists in the linear system of cubics through the two points. Away from the marks, products of a line vanishing at each mark but not at the test point, times an arbitrary linear form, separate values and tangent first jets. Singular vanishing at a fixed unmarked point therefore imposes three independent linear conditions; the incidence over the two-dimensional plane has smaller dimension than the section space. At each mark, vanishing of the differential is a proper linear condition, also avoided by a general member. One can also avoid the proper subspaces of cubics containing $ell$ or $Q$. The curve has genus one and $deg_C M = 3$.

Let

$ cal(Z) = "Bl"_(C times { 0 }) \( bb(P)^2 times bb(A)^1 \) . $

Its central components are the strict plane $P$ and $Z = bb(P)_C \( upright(bold(1)) xor cal(O)_C \( 3 \) \)$. Denote the dual tautological class on $Z$ by $U_2$, and put

$ cal(N) = cal(O)_(cal(Z)) \( 3 M - \[ Z \] \) . $

Since $\[ Z \] \|_Z = - U_2$ and $\[ Z \] \|_P = 3 M$, its restrictions are

#[#set math.equation(numbering: n => "(6.8)")
 $ cal(N) \|_Z = cal(O)_Z \( 3 M + U_2 \) \, #h(2em) cal(N) \|_P = upright(bold(1)) . $ <six:N-restrictions>]

Take $bb(P)_(cal(Z)) \( upright(bold(1)) xor cal(N) \)$, and blow it up along the two parameter sections obtained from the constant points $q_i$ in the zero section. More precisely, use the strict transforms in $cal(Z)$ of ${ q_i } times bb(A)^1$, followed by the zero section of this projective bundle. Let $f : cal(X) arrow.r bb(A)^1$ be the resulting family.

These two sections are disjoint and pass through the smooth submersion locus of the central fiber. Indeed, in the local normal-cone blowup of $\( x \, t \)$, with $x = 0$ defining $C$, the strict transform of the constant point is $x \/ t = 0$ in the $t$-chart. It meets $Z$ at its zero normal coordinate, away from $P ∩ Z$; its first projective coordinate is also zero. Thus the total space $cal(X)$ is smooth and its central fiber has two smooth components:

$ W = "Bl"_(\( q_1 \, 0 \, 0 \) \, \( q_2 \, 0 \, 0 \)) bb(P)_Z \( upright(bold(1)) xor cal(O)_Z \( 3 M + U_2 \) \) \, #h(2em) W' = P times bb(P)^1 . $

The double locus is the first projective bundle over the infinity section of $Z$; the two blowup centers miss it. Every nonzero fiber of $f$ is $hat(V)$. The family is flat: the smooth integral total space has local rings torsion-free over the local discrete valuation ring of the parameter curve, and such modules are flat.

For rational parameters

#[#set math.equation(numbering: n => "(6.9)")
 $ s < d_1 < d_2 < b $ <six:d-parameters>]

consider the relative rational class

#[#set math.equation(numbering: n => "(6.10)")
 $ cal(A) = 3 b M - d_2 \[ Z \] + d_1 U_1 - s \( hat(E)_1 + hat(E)_2 \) . $ <six:relative-class>]

Here $U_1$ is the dual tautological class for the first bundle in the family, and the exceptional classes now denote the family blowups. Its restrictions are

#[#set math.equation(numbering: n => "(6.11)")
 $ cal(A) \|_W = 3 b M + d_2 U_2 + d_1 U_1 - s \( hat(E)_1 + hat(E)_2 \) \, #h(2em) cal(A) \|_(W') = 3 \( b - d_2 \) M + d_1 U_1 . $ <six:component-classes>]

#thm([Lemma 6.3.])[
  #emph[Both classes in (6.11) are ample. Consequently $cal(A)$ is relatively ample near zero.]
] <six:cubic-ampleness>

#proof[
  The class on $W'$ is a positive product class. On $W$ use the two algebraic scalar factors, with the second factor lifted to the first bundle using its linearization on $U_2$. An ordinary surface fiber over $C$ is $bb(P)_(bb(P)^1) \( upright(bold(1)) xor cal(O)_(bb(P)^1) \( 1 \) \)$. Its toric diagram is
  #[#set math.equation(numbering: n => "(6.12)")
   $ cal(Q) = { p_1 \, p_2 gt.eq 0 : med p_1 lt.eq d_1 \, med p_1 + p_2 lt.eq d_2 } . $ <six:diagram>]
  The first projective fibers have size $d_1$; on their two endpoint sections the second sizes are $d_2$ and $d_2 - d_1$. This gives the four vertices
  $ \( 0 \, 0 \) \, med \( d_1 \, 0 \) \, med \( d_1 \, d_2 - d_1 \) \, med \( 0 \, d_2 \) . $
  The invariant boundary curves have positive areas $d_1 \, d_2 - d_1 \, d_1 \, d_2$.
  Over either marked point the fiber consists of the strict surface fiber and the exceptional plane. The former has the corner $\( 0 \, 0 \)$ cut by $p_1 + p_2 gt.eq s$; its five edge lengths are
  $ s \, quad d_1 - s \, quad d_2 - d_1 \, quad d_1 \, quad d_2 - s . $
  The exceptional plane has size $s$. All these numbers are positive by (6.9). The torus acts torically on both components: its tangent characters at the blown-up point are $0 \, \( 1 \, 0 \) \, \( 0 \, 1 \)$, which induce the standard toric action on the exceptional plane.
  A horizontal invariant irreducible curve must be a strict vertex section. To see the exhaustiveness of this assertion, intersect it with the generic fiber over $C$. This is a finite set preserved by the connected torus, hence fixed pointwise. The curve is therefore generically in the fixed locus, whose four horizontal components are precisely the vertex sections. Their degrees, in the order of the displayed vertices, are
  #[#set math.equation(numbering: n => "(6.13)")
   $ 9 b - 2 s \, #h(2em) 9 \( b - d_1 \) \, #h(2em) 9 \( b - d_2 \) \, #h(2em) 9 \( b - d_2 \) . $ <six:vertex-degrees>]
  Indeed $U_2$ restricts to $0$ and $- 3 M$ on its two sections. On the first of them the upper first section has $U_1 = - 3 M$, whereas on the second $cal(N)$ is trivial and both first sections have $U_1 = 0$. Only the bottom vertex section passes through the two blowup centers, losing $2 s$. All numbers in (6.13) are positive; the first is $3 + s$.
  We explain why these curve tests prove ampleness. The invariant irreducible curves just enumerated have only finitely many numerical classes. The boundary curves in the ordinary fibers vary in algebraic families with constant numerical class, and there are only two special fibers. Fix an ample class $B$ on $W$. For sufficiently small $epsilon.alt > 0$, every listed curve has nonnegative degree against $cal(A) \|_W - epsilon.alt B$. Every curve is rationally, hence numerically, equivalent to a torus-invariant effective cycle [12] Section 2. This result applies to a connected solvable group on a projective variety and does not require finitely many orbits. Its irreducible components are invariant, since a connected group cannot permute finitely many components nontrivially. Thus $cal(A) \|_W - epsilon.alt B$ is nef. The sum of a nef class and a positive ample class is ample [15] Corollary 1.4.10, proving the assertion on $W$. Finally, ampleness on the reduced central fiber is equivalent to ampleness on its components, and relative ampleness is open near that fiber. These standard projective ampleness facts apply to a sufficiently divisible integral multiple of $cal(A)$; see [14,15,24]. ◻
]

Choose a sufficiently divisible $N$ so that $N cal(A)$ is integral, relatively very ample near zero, and satisfies relative Serre vanishing for the ideal of $W$. Every section on $W$ then lifts locally in the parameter: the exact sequence with $I_W ⊗ cal(O) \( N cal(A) \)$ gives a surjection onto $H^0 \( W \, cal(O) \( N cal(A) \) \|_W \)$. Choose a full basis on $W$ diagonal by the two torus weights and lift it. Add any further sections needed for a relative embedding, subtracting their restrictions using these lifts. The added sections vanish on $W$. The induced projective form, divided by $N$, consequently restricts to the form from the chosen full diagonal basis on $W$. This restricted form is invariant under the compact two-torus, since its characters preserve the diagonal Hermitian norm.

The first circle acts on the entire family and preserves the blowup centers. Average the total form over this circle. The average is closed and Kähler on the fibers, and it leaves the prescribed restriction on $W$ unchanged. If needed, a positive form from the parameter disk makes the total form Kähler without changing any fiber restriction. In particular, the nonzero fibers acquire invariant Kähler forms in the class (6.5), as required by Lemma 19. No extension of the second torus action to the family is used.

=== 6.4 Toric coordinates and the integrated base area <toric-coordinates-and-the-integrated-base-area>

To apply Lemma 9, we need the horizontal area on the punctured cubic as a function of the two fiber moments. The full projective system records the two point blowups as forced vanishing of its coefficient sections. We will use these vanishing orders to compute the area lost when the marked points are removed.

On the affine chart of $Z$, $U_2$ is trivialized by the nonvanishing first homogeneous coordinate. Thus the two affine line coordinates $w_1 \, w_2$ both have transition bundle $cal(O)_C \( 3 \)$.

#thm([Lemma 6.4.])[
  #emph[For the above full projective system, the weight $\( k_1 \, k_2 \)$ runs over 
$ 0 lt.eq k_1 lt.eq N d_1 \, #h(2em) 0 lt.eq k_2 lt.eq N d_2 - k_1 . $

 Its coefficient space on $C$ is 
#[#set math.equation(numbering: n => "(6.14)")
 $ H^0 #h(-0.16667em) (C \, thin cal(O)_C \( \( 3 b N - 3 k_1 - 3 k_2 \) M \) #scale(x: 120%, y: 120%)[\(] - m_k q_1 - m_k q_2 #scale(x: 120%, y: 120%)[\)]) \, #h(2em) m_k = \( s N - k_1 - k_2 \)_(+) . $ <six:weight-space>]

 For sufficiently large divisible $N$, these systems after removing the indicated zeros are all basepoint-free.]
] <six:weights>

#proof[
  Expand first in the projective coordinate associated to $U_1$. A term of degree $k_1$ leaves coefficient class
  $ \( 3 b N - 3 k_1 \) M + \( N d_2 - k_1 \) U_2 . $
  Expanding this in the second projective coordinate gives precisely the range and the coefficient line in (6.14). Sections on the point blowup are exactly sections before the blowup vanishing to total order at least $s N$ at each center. In local coordinates $\( y \, w_1 \, w_2 \)$, the coefficient of $w_1^(k_1) w_2^(k_2)$ must therefore vanish in $y$ to order at least $m_k$, with no other condition.
  Writing $t = \( k_1 + k_2 \) \/ N$, the degree of the line in (6.14), divided by $N$, is
  $ 9 \( b - t \) - 2 \( s - t \)_(+) . $
  This decreases on $0 lt.eq t lt.eq d_2$, and is at least $9 \( b - d_2 \) > 0$. Its integral degrees therefore tend to infinity uniformly over the weights as $N$ increases through divisible values. On a genus-one curve every line of degree at least two is basepoint-free: for each point, the evaluation map is surjective by the vanishing of $H^1$ after subtracting that point; see [24] Tags 0E3B and 0E3C. This proves the assertion. ◻
]

#thm([Lemma 6.5.])[
  #emph[Let $Delta$ be a compact downward polytope strictly below the two upper boundaries of $cal(Q)$, and let 
$ C^compose = C \\ { q_1 \, q_2 } . $

 Over every compact bordered surface $Sigma subset C^compose$, the corresponding affine moment region has smooth product disk coordinates, including their lower axes, in which its form is 
#[#set math.equation(numbering: n => "(6.15)")
 $ Omega = omega_V + upright(d) Gamma \, #h(2em) upright(d)_C Gamma = kappa \( p \) > 0 . $ <six:surface-form>]

 Here $Gamma$ is horizontal and toric, with smooth extensions to neighborhoods of $Sigma$ and $Delta$. For an exhaustion of $C^compose$ by such surfaces, the integrated areas converge uniformly on $Delta$ to 
#[#set math.equation(numbering: n => "(6.16)")
 $ H_0 \( p \) = 9 \( b - p_1 - p_2 \) - 2 \( s - p_1 - p_2 \)_(+) . $ <six:area>]

 The same limit and uniform convergence hold after deleting any additional finite set of base points.]
] <six:toric-model>

#proof[
  #emph[Moment coordinates and the horizontal form.] In a local holomorphic frame of $M \|_C$, the projective potential on the unmarked affine chart is
  #[#set math.equation(numbering: n => "(6.17)")
   $ B \( y \, rho \) = 1 / N log (sum_k g_k \( y \) e^(k dot.op rho)) \, #h(2em) rho_j = log \| w_j \|^2 . $ <six:potential>]
  Here $g_k$ is the sum of squared absolute values of a basis of the coefficient space in (6.14), in its local frame. It is positive away from the marked points. Near a mark, with local coordinate $y = 0$, it has exactly the form
  #[#set math.equation(numbering: n => "(6.18)")
   $ g_k \( y \) = \| y \|^(2 m_k) a_k \( y \) \, #h(2em) a_k > 0 $ <six:coefficient-zero>]
  with $a_k$ smooth up to zero, by basepoint-freeness after factoring off the required zeros.
  The moments are $p = partial_rho B$. For fixed $y$, the Hessian $B_(rho rho)$ is a positive multiple of the covariance matrix of the weight vectors with positive coefficients, and is positive definite since the weights span the plane. Its gradient is a diffeomorphism onto the interior of $cal(Q)$. Indeed, for $p$ in that interior the function $B - p dot.op rho$ is proper and strictly convex: the maximum of the linear forms $\( k \/ N - p \) dot.op rho$ grows at least linearly in $\| rho \|$. It has a unique minimum, smoothly depending on $y \, p$.
  We check the axes explicitly. Put $r_j = \| w_j \|^2$ and write
  $ F \( y \, r \) = N^(- 1) log sum_k g_k \( y \) r_1^(k_1) r_2^(k_2) . $
  Then $p_j = r_j F_(r_j)$. At $r_j = 0$, $F_(r_j) > 0$, because the complete system contains weights with $k_j = 1$. The derivative of $p_j$ in another radial variable vanishes on this face. On its active variables, the logarithmic Hessian of the face system is positive definite. Thus the Jacobian of $r mapsto p$ is block triangular with invertible diagonal blocks at every lower face, including the origin. The inverse radii are smooth through those faces, and
  $ z_j = w_j sqrt(F_(r_j) \/ pi) \, #h(2em) pi \| z_j \|^2 = p_j \, $
  are smooth disk coordinates there. Compactness gives these coordinates on neighborhoods of all the prescribed truncated regions, with positive margins from the upper faces and the omitted base points.
  For fixed $p$ set
  #[#set math.equation(numbering: n => "(6.19)")
   $ G \( y \, p \) = inf_rho #scale(x: 120%, y: 120%)[\(] B \( y \, rho \) - p dot.op rho #scale(x: 120%, y: 120%)[\)] . $ <six:legendre>]
  This partial Legendre transform is the usual reduced Kähler potential; see [4] Sections 4–5. On lower faces this is interpreted using the corresponding face system. The envelope identity gives $upright(d)_y G = upright(d)_y B$ at the selected radii. Therefore the form in moment and phase coordinates is
  #[#set math.equation(numbering: n => "(6.20)")
   $ sum_(j = 1)^2 upright(d) p_j and upright(d) theta_j + upright(d) #scale(x: 120%, y: 120%)[\(] upright(d)_y^c G #scale(x: 120%, y: 120%)[\)] . $ <six:local-form>]
  The one-form $upright(d)_y^c G$ extends smoothly through the axes: it is $upright(d)_y^c F$ evaluated at the smooth inverse radii. Possible terms $p_j log p_j$ in $G$ are independent of the base and disappear upon this differentiation.
  The base form $kappa \( p \) = upright(d)_y upright(d)_y^c G$ is positive. For instance, on the open orbit put $zeta_j = log w_j$, so $rho_j = zeta_j + overline(zeta_j)$. The positive Hermitian Hessian of $B$ has blocks
  $ mat(delim: "(", B_(y macron(y)), B_(y rho); B_(rho macron(y)), B_(rho rho)) . $
  Differentiating $B_rho = p$ at fixed $p$ yields
  $ G_(y macron(y)) = B_(y macron(y)) - B_(y rho) B_(rho rho)^(- 1) B_(rho macron(y)) > 0 . $
  At an axis, restrict the original Kähler form to the coordinate complex submanifold and use the same calculation on the active variables. At the origin it is the positive restriction to the zero section.
  These base forms are global. If another frame of $M$ is $e' = h e$, put $lambda = log \| h \|^2$ and $phi.alt = arg \( h \) \/ \( 2 pi \)$. The changes are
  $ rho'_j = rho_j - 3 lambda \, quad theta'_j = theta_j - 3 phi.alt \, quad B' = B - 3 b lambda \, quad G' = G - 3 \( b - p_1 - p_2 \) lambda . $
  Since $upright(d)^c lambda = upright(d) phi.alt$, the primitive in (6.20) changes by $- 3 b thin upright(d) phi.alt$, whose exterior derivative is zero. Thus the local potentials have the transition law of the real class
  #[#set math.equation(numbering: n => "(6.21)")
   $ 3 \( b - p_1 - p_2 \) c_1 \( M \|_C \) . $ <six:curvature-class>]
  We will use this class after extending the curvature across the marked points.
  Over a bordered $Sigma$, choose a smooth frame of $M$, which is possible since $H^2 \( Sigma \; bb(Z) \) = 0$. In the resulting product disk coordinates, subtracting the standard fiber form leaves
  $ eta = kappa \( y \, p \) + sum_j upright(d) p_j and alpha_j \( y \, p \) \, $
  where the $alpha_j$ are smooth base one-forms. There are no fiber–fiber terms. Closure implies $partial_(p_j) kappa = upright(d)_C alpha_j$ and $partial_(p_i) alpha_j = partial_(p_j) alpha_i$. Choose $upright(d)_C gamma_0 = kappa \( y \, 0 \)$ and define
  $ Gamma \( y \, p \) = gamma_0 + integral_0^1 sum_j p_j alpha_j \( y \, t p \) thin upright(d) t . $
  Radial homotopy in the downward domain gives $upright(d) Gamma = eta$. All choices can be made on a slightly larger bordered surface and a slightly larger truncated polytope, proving (6.15) with the asserted neighborhood extensions.
  #emph[The two marked-point contributions to the base area.] The form (6.15) now gives the required local model. To determine its limiting integrated area, we compute the curvature concentrated at the omitted marks. Write $xi = k \/ N$ and $v \( xi \) = \( s - xi_1 - xi_2 \)_(+)$. By (6.18), for $lambda = log \| y \|^2 < 0$ the potential $B$ differs by a uniformly bounded amount from
  $ A_lambda \( rho \) = max_(xi in cal(Q) ∩ N^(- 1) bb(Z)^2) #scale(x: 120%, y: 120%)[\(] xi dot.op rho + lambda v \( xi \) #scale(x: 120%, y: 120%)[\)] . $
  The bound is uniform in $rho$ and $y$ near the mark: there are finitely many $a_k$, bounded above and below by positive constants. Take $N$ divisible enough to include the vertices of the subdivision of $cal(Q)$ by $xi_1 + xi_2 = s$. Barycentric interpolation in either cell, on which $v$ is affine, shows that for every $p in cal(Q)$ and every $rho$,
  $ A_lambda \( rho \) - p dot.op rho gt.eq lambda v \( p \) . $
  This bound is sharp. If $p_1 + p_2 lt.eq s$, take $rho = \( lambda \, lambda \)$, for which $A_lambda = lambda s$. If $p_1 + p_2 gt.eq s$, take $rho = 0$, for which $A_lambda = 0$. Taking infima and using the bounded difference proves
  #[#set math.equation(numbering: n => "(6.22)")
   $ G \( y \, p \) = \( s - p_1 - p_2 \)_(+) log \| y \|^2 + O \( 1 \) . $ <six:log-mass>]
  This argument also applies on axes and at $p_1 + p_2 = s$; indeed its bounded error is uniform in $p$.
  For each fixed $p$, subtracting the logarithmic term in (6.22) leaves a bounded subharmonic function on the punctured coordinate disk. It extends subharmonically over the mark and has no atomic curvature there: an atom would give an unbounded logarithmic singularity. With our normalization $upright(d) upright(d)^c log \| y \|^2 = delta_0$, the extended current of $G$ has an atom of mass $\( s - p_1 - p_2 \)_(+)$ at each mark. Its total mass, by (6.21), is $9 \( b - p_1 - p_2 \)$. Equivalently, compare its local potentials with smooth potentials in that real class; the difference is a global locally integrable function and its exact curvature has total integral zero. Removing the two atoms gives precisely (6.16).
  The reduced form is smooth at every other base point, so deleting finitely many further points changes none of these integrals. Along an increasing bordered exhaustion the integrated positive forms give continuous functions on the compact set $Delta$, increasing pointwise to the continuous function $H_0$. Dini’s theorem makes their convergence uniform. ◻
]

=== 6.5 Moment-preserving transfer and the packing <moment-preserving-transfer-and-the-packing>

We record the normalization issue for the first transfer out of the cubic component.

#thm([Lemma 6.6.])[
  #emph[Let $Sigma$ be a connected compact bordered surface in the unmarked base, and let $K$ be the entire compact moment region over $Sigma$ corresponding to a full-dimensional downward polytope $Delta$ as in Lemma 22, strictly below the two upper faces of $cal(Q)$. For sufficiently small nonzero parameter, symplectic parallel transport from $W$ to $hat(V)$ is defined on a neighborhood of $K$ and preserves $p_1$ exactly, when the moments on both components are zero on their first bottom sections. If $K$ avoids the inverse image of a closed subset of the plane under the family map, its image has the same avoidance for sufficiently small parameter.]
] <six:moment-transfer>

#proof[
  The region avoids the central double locus, which is the second upper face $p_1 + p_2 = d_2$, and it avoids the two point blowups. It is therefore in the submersion locus. Parallel transport for the averaged total form exists for short time on a neighborhood of this compact set by Lemma 11. The connection is invariant under the first circle, so transport $Phi$ is both symplectic and equivariant. Hence
  $ upright(d) \( p_1^(hat(V)) compose Phi \) = upright(d) p_1^W $
  there. The difference is constant on the connected region. The region includes points with first affine coordinate zero. They are fixed points on the first bottom section, away from the double locus and the blowups. The corresponding fixed component in the total space is the strict transform of the global zero section. Short equivariant transport of these points stays in that component, so both normalized moments are zero. The constant is consequently zero. Finally, the relevant inverse image is closed in the total space. A compact set disjoint from it stays disjoint under sufficiently short transport. ◻
]

#thm([Proposition 6.7.])[
  #emph[Let $R_0 \, R_1 \, dots.h \, R_k > 0$, with $R_0 gt.eq 1 \/ 2$, satisfy 
$ sum_(i = 0)^k R_i^3 < 1 \, #h(2em) R_i + R_j < 1 quad \( i eq.not j \) . $

 Then the disjoint union of their closed six-dimensional balls embeds symplectically into the open ball of capacity one, with each embedding defined on a neighborhood of its closed source.]
] <six:large>

#proof[
  If $k = 0$ the assertion is immediate. Otherwise the strict inequalities allow a rational $a > R_0$, with $1 \/ 2 < a < 1$, and auxiliary $r_i > R_i$, $1 lt.eq i lt.eq k$, such that
  #[#set math.equation(numbering: n => "(6.23)")
   $ r_i < s = 1 - a \, #h(2em) sum_(i = 1)^k r_i^3 < 1 - a^3 . $ <six:auxiliary>]
  Use the notation (6.1). The limiting moment domain is
  $ Delta_oo = { p_1 \, p_2 gt.eq 0 : med p_1 lt.eq s \, med p_1 + p_2 lt.eq b } . $
  Since $b > s$, direct integration of (6.16) gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ integral_(Delta_oo) H_0 \( p \) thin upright(d) p_1 upright(d) p_2 & = integral_0^s (9 / 2 \( b - u \)^2 - \( s - u \)^2) thin upright(d) u\
 & = 3 / 2 #scale(x: 120%, y: 120%)[\(] b^3 - \( b - s \)^3 #scale(x: 120%, y: 120%)[\)] - s^3 / 3 = s / 2 - s^2 / 2 + s^3 / 6 = frac(1 - a^3, 6) . $ <six:volume>]
  The full cap of size $r_i < s$ is supported inside this domain and has integral
  $ integral_(p_1 \, p_2 gt.eq 0) \( r_i - p_1 - p_2 \)_(+) thin upright(d) p_1 upright(d) p_2 = r_i^3 / 6 . $
  Fix $d_1$ with $s < d_1 < b$. Choose rational $h_1 \, c \, h_2 \, d_2$ with
  #[#set math.equation(numbering: n => "(6.25)")
   $ max_i r_i < h_1 < c < s < d_1 < d_2 < b \, #h(2em) s < h_2 < d_2 \, $ <six:truncation>]
  so close to $h_1 = s$ and $h_2 = b$ that on
  $ Delta = { p_1 \, p_2 gt.eq 0 : med p_1 lt.eq h_1 \, med p_1 + p_2 lt.eq h_2 } $
  the function
  $ P \( p \) = H_0 \( p \) - sum_(i = 1)^k \( r_i - p_1 - p_2 \)_(+) $
  has positive integral, and hence positive mean. Figure 2 shows the truncated and limiting domains, the cut level, and the change of slope of the limiting density.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (2.73, 0), (2.73, 2.21), (0, 4.94), close: true, fill: rgb("#ededed"), stroke: none)
  line((0, 0), (3.9, 0), (3.9, 1.733), (0, 5.633), close: true, stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0, 0), (2.73, 0), (2.73, 2.21), (0, 4.94), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 3.9), (3.9, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.38, 0), (3.38, 3.25), stroke: (thickness: 0.4pt, miter-limit: 10, dash: (3pt, 2pt, 0.4pt, 2pt)))
  content((3.38, 3.25), [#text(size: 9pt)[cut#linebreak()$p_1=c$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (6.24, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.24, 0), [#text(size: 9pt)[$p_1$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 6.24), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 6.24), [#text(size: 9pt)[$p_2$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((0, 5.633), [#text(size: 9pt)[$b$]], anchor: "east", padding: 0.1176cm)
  content((0, 4.94), [#text(size: 9pt)[$h_2$]], anchor: "east", padding: 0.1176cm)
  content((0, 3.9), [#text(size: 9pt)[$s$]], anchor: "east", padding: 0.1176cm)
  content((2.73, 0), [#text(size: 9pt)[$h_1$]], anchor: "north", padding: 0.1176cm)
  content((3.38, 0), [#text(size: 9pt)[$c$]], anchor: "north", padding: 0.1176cm)
  content((3.9, 0), [#text(size: 9pt)[$s$]], anchor: "north", padding: 0.1176cm)
  content((1.04, 1.56), [#text(size: 9pt)[$Delta$]])
  content((0.975, 4.658), [#text(size: 9pt)[$Delta_ infinity$]], anchor: "south-west", padding: 0.1176cm)
  content((0.845, 3.055), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$p_1+p_2=s$]]])], angle: -45deg)
  line((8.1, 0.5), (12.9, 0.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((12.9, 0.5), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((8.1, 0.5), (8.1, 4.49), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.1, 4.49), [#text(size: 9pt)[$H_0(t)$]], anchor: "south", padding: 0.1176cm)
  line((8.1, 3.965), (11.1, 1.76), (12.43, 0.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((11.1, 0.5), (11.1, 1.76), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((8.1, 3.965), [#text(size: 9pt)[$9b-2s$]], anchor: "east", padding: 0.1176cm)
  content((11.1, 0.5), [#text(size: 9pt)[$s$]], anchor: "north", padding: 0.1176cm)
  content((12.43, 0.5), [#text(size: 9pt)[$b$]], anchor: "north", padding: 0.1176cm)
  content((9.3, 3.083), [#text(size: 9pt)[slope $-7$]], anchor: "south-west", padding: 0.1176cm)
  content((11.6, 1.34), [#text(size: 9pt)[slope $-9$]], anchor: "west", padding: 0.1176cm)
  content((10.4, -0.6025), [#text(size: 9pt)[$t=p_1+p_2$#linebreak()$H_0(t)=9(b-t)-2(s-t)_+$]])
})],
    caption: [Figure 2: The six-dimensional packing domain and its limiting base area. The solid domain $Delta$ lies entirely below the cut $p_1 = c$. The dashed domain $Delta_oo$ is used to compute the limiting volume $\( 1 - a^3 \) \/ 6$. The dotted line marks the change of slope of $H_0$; the portion of $Delta$ below it remains in the packing domain. Each of the two marked points of the elliptic base contributes the subtracted mass $\( s - t \)_(+)$. The drawing illustrates $h_1 < c < s < h_2 < b$; the full parameter order is (6.25). ],
  ) <fig:sixdim-moment>
  Such choices are possible by (6.23), (6.24), and convergence of these domains to $Delta_oo$. The cap supports are already wholly inside every sufficiently close truncation.
  The hypotheses of Lemma 9 hold. First, $H_0$ is positive on $Delta$. As a function of $t = p_1 + p_2$, its slopes are $- 7$ for $t < s$ and $- 9$ for $t > s$, so it is concave. Each negative cap is concave as well, proving concavity of $P$. The auxiliary simplices lie strictly away from the two outer faces. Choose $tau < 1$ with $tau h_1 > max_i r_i$ and $tau h_2 > max_i r_i$. If $p in.not tau Delta$, either $p_1 > tau h_1$ or $p_1 + p_2 > tau h_2$; in either case all caps vanish. Thus $P = H_0$ there, with a uniform positive lower bound. We have used the concave limiting density $H_0$ throughout; only the model’s integrated areas are approximated by bordered pieces.
  Construct the cubic family with the chosen $d_1 \, d_2$. Remove from its base $C$ the marked points and all intersections with $ell union Q$. The remaining curve has genus one and admits connected bordered exhaustions of genus one. Lemma 22 supplies the models (6.15), with uniform limiting area $H_0$, over these exhaustions. Lemma 9 therefore embeds disjoint closed balls of capacities $R_i < r_i$, $1 lt.eq i lt.eq k$, compactly in one such model, with neighborhood embeddings. The entire chosen model has $p_1 lt.eq h_1 < c$, is away from the double locus, and avoids the inverse images of $ell union Q$ under the map to the plane.
  Transfer this compact region into a nearby fiber $hat(V)$. Lemma 23 keeps it below $p_1 < c$ and preserves the stated avoidance. Apply the cut of Lemma 19. The balls now lie in $Y$ off infinity and off the two forbidden vertical submanifolds over $D ∩ E$ and $D ∩ H_oo$. The cut form is invariant and is in exactly the polarization class of Lemma 18.
  Use Proposition 12 for the first normal-cone degeneration. The allowed relative Moser identification of Lemma 10 preserves infinity and the two disjoint forbidden vertical submanifolds. It follows that the compact packing transfers into $T \\ \( E union H_oo \)$, with a Kähler form in class $H - a E$. Lemma 14, using relative Moser for the disjoint divisors $E \, H_oo$, identifies this complement symplectically with
  $ {z in bb(C)^3 : a < pi sum_(j = 1)^3 \| z_j \|^2 < 1} . $
  Add the central closed ball of capacity $R_0 < a$. It is disjoint from all these compact shell balls, and every source lies inside the open target. Each operation was defined on a neighborhood of the relevant compact set; restricting these neighborhoods if necessary gives the required neighborhood embeddings of the closed balls. ◻
]

== 7 Completion of the packing theorem <app:completion>

#proof[
  #emph[Sufficiency in Theorem 1.] Normalize the target capacity to one as in Section 1. The case of one ball is immediate. If every requested capacity is strictly less than $1 \/ 2$, apply Proposition 16.
  Otherwise the strict pairwise inequalities imply that exactly one requested capacity, say $A$, is at least $1 \/ 2$. All the inequalities required by Proposition 17, for $n gt.eq 4$, or by Proposition 24, for $n = 3$, are precisely the assumed volume and pairwise inequalities. The applicable proposition gives the entire requested packing, with embeddings on neighborhoods of the closed sources. This proves sufficiency, and hence the theorem. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P.~Biran, #emph[Symplectic packing in dimension 4], Geom. Funct. Anal. #strong[7] (1997), 420--437. #link("https://doi.org/10.1007/s000390050014")[doi:10.1007/s000390050014].]
#bibitem([2])[P.~Biran, #emph[A stability property of symplectic packing], Invent. Math. #strong[136] (1999), 123--155. #link("https://doi.org/10.1007/s002220050306")[doi:10.1007/s002220050306].]
#bibitem([3])[P.~Biran, #emph[Lagrangian barriers and symplectic embeddings], Geom. Funct. Anal. #strong[11] (2001), no.~3, 407--464. #link("https://doi.org/10.1007/PL00001678")[doi:10.1007/PL00001678].]
#bibitem([4])[D.~Burns and V.~Guillemin, #emph[Potential functions and actions of tori on Kähler manifolds], Comm. Anal. Geom. #strong[12] (2004), no.~1--2, 281--303. #link("https://doi.org/10.4310/CAG.2004.v12.n1.a13")[doi:10.4310/CAG.2004.v12.n1.a13].]
#bibitem([5])[D.~Burns, V.~Guillemin, and E.~Lerman, #emph[Kähler cuts], Preprint, 2002. #link("https://arxiv.org/abs/math/0212062")[arXiv:math/0212062].]
#bibitem([6])[O.~Buse and R.~Hind, #emph[Symplectic embeddings of ellipsoids in dimension greater than four], Geom. Topol. #strong[15] (2011), 2091--2110. #link("https://doi.org/10.2140/gt.2011.15.2091")[doi:10.2140/gt.2011.15.2091].]
#bibitem([7])[O.~Buse and R.~Hind, #emph[Ellipsoid embeddings and symplectic packing stability], Compos. Math. #strong[149] (2013), 889--902. #link("https://doi.org/10.1112/S0010437X12000826")[doi:10.1112/S0010437X12000826].]
#bibitem([8])[O.~Buse, R.~Hind, and E.~Opshtein, #emph[Packing stability for symplectic 4-manifolds], Trans. Amer. Math. Soc. #strong[368] (2016), 8209--8222. #link("https://doi.org/10.1090/tran/6802")[doi:10.1090/tran/6802].]
#bibitem([9])[O.~Edtmair, #emph[Smooth perfectness of Hamiltonian diffeomorphism groups], Preprint, 2025. #link("https://arxiv.org/abs/2509.16327v1")[arXiv:2509.16327v1].]
#bibitem([10])[O.~Edtmair, #emph[Packing stability and the subleading asymptotics of symplectic Weyl laws], Preprint, 2025. #link("https://arxiv.org/abs/2509.15390v1")[arXiv:2509.15390v1].]
#bibitem([11])[W.~Fulton, #emph[Intersection Theory], 2nd ed., Springer-Verlag, 1998. #link("https://doi.org/10.1007/978-1-4612-1700-8")[doi:10.1007/978-1-4612-1700-8].]
#bibitem([12])[W.~Fulton, R.~MacPherson, F.~Sottile, and B.~Sturmfels, #emph[Intersection theory on spherical varieties], J. Algebraic Geom. #strong[4] (1995), no.~1, 181--193. #link("https://franksottile.github.io/research/pdf/spherical.pdf")[Author manuscript].]
#bibitem([13])[M.~Gromov, #emph[Pseudo holomorphic curves in symplectic manifolds], Invent. Math. #strong[82] (1985), 307--347. #link("https://doi.org/10.1007/BF01388806")[doi:10.1007/BF01388806].]
#bibitem([14])[R.~Hartshorne, #emph[Algebraic Geometry], Graduate Texts in Mathematics, vol.~52, Springer-Verlag, New York, 1977. #link("https://doi.org/10.1007/978-1-4757-3849-0")[doi:10.1007/978-1-4757-3849-0].]
#bibitem([15])[R.~Lazarsfeld, #emph[Positivity in Algebraic Geometry I: Classical Setting: Line Bundles and Linear Series], Ergebnisse der Mathematik und ihrer Grenzgebiete, 3.~Folge, vol.~48, Springer-Verlag, Berlin--Heidelberg, 2004. #link("https://doi.org/10.1007/978-3-642-18808-4")[doi:10.1007/978-3-642-18808-4].]
#bibitem([16])[E.~Lerman, #emph[Symplectic cuts], Math. Res. Lett. #strong[2] (1995), no.~3, 247--258. #link("https://doi.org/10.4310/MRL.1995.v2.n3.a2")[doi:10.4310/MRL.1995.v2.n3.a2].]
#bibitem([17])[D.~McDuff and L.~Polterovich, #emph[Symplectic packings and algebraic geometry], Invent. Math. #strong[115] (1994), 405--429. #link("https://doi.org/10.1007/BF01231766")[doi:10.1007/BF01231766].]
#bibitem([18])[J.~Moser, #emph[On the volume elements on a manifold], Trans. Amer. Math. Soc. #strong[120] (1965), no.~2, 286--294. #link("https://doi.org/10.1090/S0002-9947-1965-0182927-5")[doi:10.1090/S0002-9947-1965-0182927-5].]
#bibitem([19])[E.~Opshtein, #emph[Singular polarizations and ellipsoid packings], Int. Math. Res. Not. #strong[2013] (2013), no.~11, 2568--2600. #link("https://doi.org/10.1093/imrn/rns137")[doi:10.1093/imrn/rns137].]
#bibitem([20])[F.~Schlenk, #emph[On symplectic folding], Preprint, 1999. #link("https://arxiv.org/abs/math/9903086")[arXiv:math/9903086].]
#bibitem([21])[F.~Schlenk, #emph[Embedding Problems in Symplectic Geometry], de Gruyter Expositions in Mathematics, vol.~40, Walter de Gruyter, Berlin, 2005. #link("https://doi.org/10.1515/9783110199697")[doi:10.1515/9783110199697].]
#bibitem([22])[F.~Schlenk, #emph[Packing symplectic manifolds by hand], J. Symplectic Geom. #strong[3] (2005), no.~3, 313--340. #link("https://doi.org/10.4310/JSG.2005.v3.n3.a1")[doi:10.4310/JSG.2005.v3.n3.a1].]
#bibitem([23])[K.~Siegel and Y.~Yao, #emph[On symplectic packing problems in higher dimensions], Math. Ann. #strong[392] (2025), 5361--5392. #link("https://doi.org/10.1007/s00208-025-03221-7")[doi:10.1007/s00208-025-03221-7].]
#bibitem([24])[The Stacks project authors, #emph[The Stacks project], 2026. #link("https://stacks.math.columbia.edu").]
#bibitem([25])[L.~Traynor, #emph[Symplectic packing constructions], J. Differential Geom. #strong[41] (1995), no.~3, 735--751. #link("https://doi.org/10.4310/jdg/1214456483")[doi:10.4310/jdg/1214456483].]
#bibitem([26])[D.~Witt Nyström, #emph[Deformations of Kähler manifolds to normal bundles and restricted volumes of big classes], J. Differential Geom. #strong[128] (2024), no.~3, 1177--1223. #link("https://doi.org/10.4310/jdg/1729092457")[doi:10.4310/jdg/1729092457].]


