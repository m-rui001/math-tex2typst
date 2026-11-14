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

#align(center)[#text(size: 16pt, weight: "bold")[The Isoperimetric Conjecture \
for the Cubic Flat Three-Torus]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <intro:section>

The isoperimetric conjecture for the cubic flat three-torus predicts a particularly simple sequence of minimizing
  regions: balls, circular tubes about shortest closed geodesics, and slabs between parallel coordinate tori,
  followed by their complements. It is a concrete instance of the periodic isoperimetric problem,
  in which the local Euclidean geometry coexists with global topological constraints.
  We resolve this conjecture and classify every minimizing region,
  including all equality cases at the two transition volumes.

#thm([Theorem 1.1.])[
  #emph[For $V in \( 0 \, 1 \)$, put $v = min \( V \, 1 - V \)$.
    Among finite-perimeter subsets of $bb(R)^3 \/ bb(Z)^3$ of volume $V$, the minimum perimeter is
#[#set math.equation(numbering: n => "(1.1)")
 $ I_(upright("unit")) \( V \) = min {\( 36 pi \)^(1 \/ 3) v^(2 \/ 3) \, med 2 sqrt(pi v) \, med 2} . $ <intro:profile>]

 For $0 < V lt.eq 1 \/ 2$, every minimizing region is, up to an ambient isometry and a null set, one of the following:
$ upright("volume range") & upright("region")\
0 < V lt.eq 4 pi \/ 81 & upright("a ball of radius ") \( 3 V \/ \( 4 pi \) \)^(1 \/ 3)\
4 pi \/ 81 lt.eq V lt.eq 1 \/ pi & upright("a solid circular tube of radius ") sqrt(V \/ pi)\
 & upright("about a shortest closed geodesic")\
1 \/ pi lt.eq V lt.eq 1 \/ 2 & upright("a slab of width ") V upright(" between coordinate tori") . $

 Both listed types occur at each common endpoint of adjacent ranges, and there are no further equality cases.
   For $V > 1 \/ 2$, the minimizing regions are the complements of those at volume $1 - V$.
   At zero or full volume the conclusion is trivial.]
] <intro:main>

The ball–cylinder–slab prediction appears explicitly in the periodic isoperimetric problem of Hauswirth, Pérez,
  Romon, and Ros [5] Introduction and in Ros’s account of the cubic torus and cube [11] Section 1.6.
  Reflection relates the periodic problem to relative perimeter in a cube:
  the canonical regions become an eighth ball about a vertex, a quarter cylinder about an edge,
  and a region cut off by a coordinate plane. The remaining geometric difficulty is to exclude connected
  boundaries of higher genus.

Several parts of the predicted profile were known. Hadwiger proved minimality of a coordinate cut at half volume
  for the cube [4]; Barthe and Maurey recovered this result by Gaussian comparison [2] Theorem 7 and the following
  discussion. Morgan and Johnson’s sharp small-volume comparison implies that balls minimize on a compact flat
  manifold for sufficiently small volumes [7] Theorem 4.4. Acerbi, Fusco,
  and Morini proved that coordinate slabs are the only minimizers near half volume in the cubic three-torus,
  up to translations and coordinate permutations [1] Theorem 5.3.
  These small-volume and near-half-volume neighborhoods were obtained without effective bounds reaching the
  proposed transitions.

The geometric tools also have a substantial history. Coordinate reflection symmetry for orthogonal translation
  lattices is attributed to Hsiang in Ritoré’s thesis [8] Theorem 1.19.
  Ritoré and Ros developed the low-genus stability and structure results for flat three-manifolds [9,10].
  Hauswirth, Pérez, Romon, and Ros established the connectedness,
  genus and curvature–area estimates used here and the differential comparison method for the isoperimetric
  profile [5]. The coordinate graph property after reflection is Ritoré’s observation,
  recorded with its stability proof by Ros [11] Proposition 2.3.

Milman obtained effective ranges for the canonical phases,
  including the cubic spherical range up to volume fraction $0.120582 dots.h$ [6] Theorem 1.2.
  He also made explicit the reduction of the profile conjecture to $4 pi \/ 81$ and $1 \/ pi$,
  using the method of Hauswirth, Pérez, Romon, and Ros [6] Theorem 1.3 and Section 4.3.
  This reduction classifies all minimizers inside the smooth branches once the endpoint profile values are known;
  additional co-minimizers at the transitions still have to be excluded.
  We establish those endpoint exclusions directly.

The main new ingredient is a quantitative use of nested planar sections at the cylinder–slab transition.
  Milman’s base-profile comparison identifies the lack of nesting among planar minimizers as an obstruction to
  sharpness [6] Corollary 2.8 and the surrounding discussion.
  Here the planar isoperimetric inequality alone leaves a deficit in the central curvature range.
  A calibration of the complementary corner in the bottom section controls both edge extents;
  nesting then forces a definite length excess in intermediate strip sections.
  A Jensen estimate and the section flux identity turn that excess into a strict bound for the total area.
  The other configurations are excluded by scalar inequalities,
  and explicit outward arithmetic bounds complete the remaining one-variable estimate.

Section 2 reduces the classification to $V_1 = 4 pi \/ 81$ and $V_2 = 1 \/ pi$.
  Reflection and volume-constrained stability place any nonstandard minimizer in a coordinate-monotone position in
  a unit cube, with one of the two vertex patterns of Section 3.
  Section 4 derives the flux, projection, and coarea identities for planar sections.
  Section 5 uses them to exclude the four-vertex pattern at both volumes and the three-vertex pattern at $V_1$.
  Section 6 improves the planar lower bound for the remaining three-vertex pattern at $V_2$.
  Section 7 assembles the endpoint exclusions with the two-volume reduction and restores the unit-torus
  normalization. Appendix 8 proves the scalar inequality used to exclude the four-vertex pattern,
  and Appendix 9 certifies the remaining one-variable bounds.
  The reproducible exact calculations are included with the source.

== 2 Classical inputs and the two-volume reduction <pre:section>

We work on

$ T = bb(R)^3 \/ \( 2 bb(Z)^3 \) \, wide V \( E \) = frac(\| E \|, 8) \, wide A \( E \) = frac(\| partial E \|, 8) . $

Here and below perimeter is understood in the finite-perimeter sense;
  a minimizer is represented by its regular region. The map from the unit torus to $T$ doubles lengths.
  Consequently $V$ is the original volume fraction, whereas $A$ is one half of the original perimeter.
  The outward unit normal is $N$, and $h = k_1 + k_2$ is the sum of the principal curvatures in the metric of $T$,
  positive on a ball. It is not divided by eight.

Standard compactness and regularity for isoperimetric regions imply existence at every $0 < V < 1$,
  with smooth embedded boundary of constant mean curvature. In a flat metric this boundary is real analytic:
  its local CMC graph equation is analytic elliptic, so [3] Theorem 1.1 applies.
  The second variation is nonnegative on all volume-preserving variations.
  We use the following classical structural theorem in precisely its unrestricted, identity-group case.

#thm([Theorem 2.1.])[
  (Classical flat-manifold structure).  #emph[Let $E$ be an isoperimetric region in a complete orientable flat
    three-manifold, with closed boundary $Sigma$. Either $Sigma$ is a union of parallel planar surfaces,
    or $Sigma$ is connected. In the connected case:]
  + #emph[genus zero gives a round sphere;]
  + #emph[genus one gives a flat quotient of a plane or a circular cylinder;]
  + #emph[the genus is at most four;]
  + #emph[in genus two or three, $H^2 \| Sigma \| lt.eq 2 pi$, where $H = h \/ 2$; in genus four, $H = 0$.]
] <pre:structure>

These statements are Theorems 5 and 7 of Hauswirth–Pérez–Romon–Ros [5], applied with the identity symmetry group.
  In particular the orientation-preserving hypothesis of their Theorem 7 is satisfied.
  Their genus-one assertion builds on the stability results of Ritoré–Ros [9,10].
  Existence and regularity in the compact torus setting are recorded in [5] Theorem 3.
  We call a minimizing boundary #emph[standard] if it is planar, spherical, or a circular-cylinder quotient.
  Every nonstandard minimizing boundary is therefore connected of genus $g gt.eq 2$ and satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ h^2 A lt.eq pi . $ <pre:curvature>]

Indeed $h^2 A = H^2 \| Sigma \| \/ 2$, and the genus-four case has $h = 0$.

=== 2.1 The standard competitors <the-standard-competitors>

For $0 lt.eq V lt.eq 1$, set $v = min \( V \, 1 - V \)$ and

#[#set math.equation(numbering: n => "(2.2)")
 $ F \( V \) = min {\( 9 pi \/ 2 \)^(1 \/ 3) v^(2 \/ 3) \, med sqrt(pi v) \, med 1} \, wide V_1 =
   frac(4 pi, 81) \, quad V_2 = 1 / pi . $ <pre:envelope>]

The first, second, and third expressions are the respective minima on $0 lt.eq v lt.eq V_1$, $V_1 lt.eq v lt.eq
  V_2$, and $V_2 lt.eq v lt.eq 1 \/ 2$.

#thm([Lemma 2.2.])[
  #emph[The function $F$ is attained by standard competitors.
    Every standard minimizing boundary has $A gt.eq F \( V \)$; equality gives exactly the balls,
    shortest-geodesic tubes, and coordinate slabs in Theorem 1, including the indicated ties and complements.]
] <pre:standard>

#proof[
  A sphere in $T$ lifts to an embedded sphere in $bb(R)^3$.
    Its distinct lattice translates have disjoint interiors: equal-radius spheres with intersecting interiors
    would have intersecting boundaries. Thus it bounds an embedded ball on one side. For its radius $R$,
  $ W = frac(pi R^3, 6) \, wide A = frac(pi R^2, 2) = \( 9 pi \/ 2 \)^(1 \/ 3) W^(2 \/ 3) \, $
  where $W$ denotes the ball-side volume. Since $W gt.eq v$, this area is at least the first expression in (2.2).
  For a compact circular-cylinder quotient, the stabilizer of its lifted axis contains a nonzero axial lattice
    translation. Its primitive core therefore has length $2 k$, with $k = \| m \| gt.eq
    1$ for a primitive nonzero $m in bb(Z)^3$. Embeddedness gives a solid tube on one side, with
  $ W = frac(k pi R^2, 4) \, wide A = frac(k pi R, 2) = sqrt(pi k W) gt.eq sqrt(pi v) . $
  This comparison concerns the area of the given tube and does not require a shortest tube of the possibly larger
    volume $W$ to embed. If such a boundary minimizes, $A = I \( V \) lt.eq F \( V \)$,
    where $I$ is the isoperimetric profile. Equality throughout forces $k = 1$, $W = v$,
    and $v$ in the closed cylindrical branch. The corresponding sphere comparison similarly forces $W =
    v$ and the spherical branch.
  A connected closed planar surface has a primitive integral normal $m$ and physical area $4 \| m \|$.
    Disjoint planar surfaces must be parallel, and a single such torus does not separate $T$.
    At least two are required to bound a region. Their total normalized area is therefore at least one,
    with equality only for two tori with $\| m \| = 1$. Their intervening regions are exactly coordinate slabs.
  Finally the branches in (2.2) are realized by an embedded ball, a shortest tube, and a coordinate slab,
    respectively. At the last volume of its branch the ball radius is $2 \/ 3$;
    the largest tube radius in its branch is $2 \/ pi$. Both are less than the transverse injectivity radius one.
    The branch intersections are exactly $V_1 \, V_2$. Complements give the remaining volumes.
    This proves both attainment and the asserted equality classification. ◻
]

=== 2.2 Upper supports for the profile <upper-supports-for-the-profile>

#thm([Lemma 2.3.])[
  #emph[The profile $I : \[ 0 \, 1 \] arrow.r \[ 0 \, oo \)$ is continuous, concave, and satisfies $I \( V \) =
    I \( 1 - V \)$. If a minimizer at $V in \( 0 \, 1 \)$ has sum curvature $h$,
    there is a smooth local upper support $C$ for $I$ at $V$ such that $C' \( V \) = h$ and $C'' \( V \) lt.eq 0$.
    If its boundary is connected of genus $g$, then at contact
#[#set math.equation(numbering: n => "(2.3)")
 $ C^2 C'' = - h^2 C + pi \( 1 - g \) . $ <pre:parallel>]

 Every such contact curvature is nonnegative for $V < 1 \/ 2$ and nonpositive for $V > 1 \/ 2$.]
] <pre:supports>

#proof[
  Compactness of finite-perimeter sets gives lower semicontinuity of $I$.
    A local volume-changing smooth variation of a minimizer gives upper semicontinuity at every interior volume.
    Since $0 lt.eq I lt.eq F$, continuity also holds at the endpoints. Complementation gives the symmetry.
  Let $K = k_1 k_2$ be the intrinsic Gauss curvature of $Sigma$.
    Let $a \( tau \)$ and $w \( tau \)$ be normalized area and volume under outward normal parallel displacement
    by $tau$. At $tau = 0$,
  $ w' = A \, wide a' = h A \, wide w'' = h A \, wide a'' = 1 / 8 integral_Sigma 2 K thin d S . $
  Small parallels are embedded and $w' > 0$; expressing their area as a function $C \( w \)$ provides the upper
    support. The chain rule gives
  $ C' = h \, wide C^2 C'' = 1 / 8 integral_Sigma 2 K thin d S - h^2 A . $
  For connected $Sigma$, Gauss–Bonnet gives (2.3). For an arbitrary boundary,
  $ 1 / 8 integral_Sigma \( 2 K - h^2 \) thin d S = - 1 / 8 integral_Sigma \( k_1^2 + k_2^2 \) thin d S lt.eq 0 \, $
  so $C'' lt.eq 0$. These are the parallel-variation formulas of [5] Section 3, with the stated normalization.
  For completeness, this contact property implies concavity without differentiability of $I$.
    Suppose $I \( c \) < L \( c \)$ for a chord $L$ on $\[ a \, b \]$ and $a < c < b$.
    Choose $epsilon > 0$ sufficiently small that $I \( c \) < L \( c \) + epsilon \( c - a \) \( c - b \)$.
    The minimum of
  $ I \( x \) - L \( x \) - epsilon \( x - a \) \( x - b \) $
  is negative and occurs at an interior point $x_0$. Adding this minimum to the strictly convex quadratic produces
    a function $q lt.eq I$ with equality at $x_0$. Any local upper support there satisfies $C'' \( x_0 \) gt.eq
    q'' = 2 epsilon$, a contradiction.
  For a concave function, the slope of a smooth upper support lies between its one-sided derivatives:
    $I'_(+) \( V \) lt.eq h lt.eq I'_(-) \( V \)$. The secant joining the equal values at $V$ and $1 -
    V$ has slope zero. Concavity therefore gives the asserted signs on either side of $1 \/ 2$.
    No curvature conclusion at exactly $1 \/ 2$ is needed at this stage. ◻
]

#thm([Proposition 2.4.])[
  (Two-volume reduction).  #emph[If every minimizer at $V_1$ and $V_2$ is standard, then $I =
    F$ on $\[ 0 \, 1 \]$, and every minimizer is one of the standard regions of Lemma 3.]
] <pre:reduction>

#proof[
  The assumption, existence, and Lemma 3 give $I = F$ at $V_1 \, V_2$, and hence also at $1 - V_2 \, 1 - V_1$.
    On each open interval between consecutive points in
  $ 0 \, med V_1 \, med V_2 \, med 1 - V_2 \, med 1 - V_1 \, med 1 \, $
  the function $F$ is smooth and
  #[#set math.equation(numbering: n => "(2.4)")
   $ F'' + frac(\( F' \)^2, F) gt.eq 0 . $ <pre:branch-ode>]
  This follows directly for its power-law and constant branches.
  If $I - F$ had a negative minimum on one of the closed intervals, it would occur in its interior.
    A minimizer there must be nonstandard by Lemma 3. For its upper support, $C = I < F$, $C' = F'$,
    and $C'' gt.eq F''$ at contact. Hence
  $ C'' + frac(\( C' \)^2, C) gt.eq F'' + frac(\( F' \)^2, F) gt.eq 0 \, $
  whereas (2.3) makes the left-hand side $pi \( 1 - g \) \/ C^2 < 0$. Thus $I = F$ throughout.
  Now consider any nonstandard minimizer at an interior point of one of the smooth intervals.
    Its support touches $F = I$ from above, so $C' = F'$ and $C'' gt.eq F''$,
    giving the same contradiction with $C = F$. The partition points are covered by the hypothesis and
    complementation. In particular $1 \/ 2$ belongs to the smooth constant interval, so it is included.
    Lemma 3 completes the equality classification. ◻
]

The profile comparison and the classification inside each smooth branch are Milman’s Theorem 1.3 and
  Propositions 4.4–4.6 [6], based on the differential method of Hauswirth–Pérez–Romon–Ros.
  The endpoint hypothesis here additionally excludes nonstandard co-minimizers at the transitions.
  Establishing that hypothesis is the task of the remaining geometric argument.

== 3 Reflection symmetry and the two vertex patterns <geo:section>

Throughout this section $Sigma = partial E$ is a nonstandard minimizing boundary in $T$.
  In particular it is connected, nonplanar, real analytic, and of genus at least two.
  We first prove that the original region has coordinate reflection symmetry,
  then use stability to restrict its possible vertex patterns.

#thm([Lemma 3.1.])[
  #emph[After translating the coordinate origins, the original region $E$ is invariant under reflection in each of
    the six coordinate tori $x_i = 0 \, 1$.]
] <geo:reflection>

#proof[
  Fix a coordinate. Let $H_a$ be the half-torus between $x_i = a$ and $x_i = a + 1$.
    The occupied volume in $H_a$ is continuous in $a$, and its value at $a +
    1$ is the complementary half of the total occupied volume. Thus some $H_a$ bisects the occupied volume.
  Reflecting each half separately across its two end tori gives two competitors of the original volume.
    Their characteristic-function traces agree across each reflecting seam,
    so the reflection adds no seam perimeter, even if the cutting torus is tangent to the original surface.
    The intersection of the nonplanar analytic surface with either cutting torus has zero surface area:
    positive area would force an analytic open planar piece and hence a planar connected surface.
    The average perimeter of the two competitors is therefore the original minimum.
    Each competitor is minimizing and consequently has smooth analytic boundary.
  Each open half has both positive occupied volume and positive vacant volume,
    so it contains an open patch of the original boundary. A reflected competitor shares such a patch.
    This patch cannot be planar, and Theorem 2 makes the competitor’s boundary connected.
    Two connected closed embedded analytic surfaces sharing an open patch coincide everywhere.
    To see that local coincidence is closed, at a limit point choose analytic graph charts over their common
    limiting tangent plane. Their graph functions agree on a nonempty open set,
    and hence on the connected chart by the identity theorem.
    Connectedness then propagates equality across the whole surface.
  The occupied sides also agree. Their outward normals agree on the unchanged patch;
    the relative sign of the normal fields is constant on the connected common boundary.
    Equivalently, equality of their oriented boundary distributions makes the difference of the characteristic
    functions constant on the connected torus, and agreement on the retained half makes that constant zero.
    This reasoning does not require $h eq.not 0$. The original region, not merely a chosen competitor,
    is therefore reflection invariant. Repeat in the other two coordinates.
    Translations of their origins preserve the symmetries already obtained. ◻
]

We may now work in $Q = \[ 0 \, 1 \]^3$. Normalized area and volume in $T$ are exactly relative perimeter and
  ordinary volume in $Q$. The outward normal transforms equivariantly under each reflection.
  In particular $N_i = 0$ on the face $x_i = 0$ or $1$: the surface meets a face orthogonally.

#thm([Lemma 3.2.])[
  (Strict coordinate monotonicity).  #emph[After possibly reversing individual coordinates in $Q$,
#[#set math.equation(numbering: n => "(3.1)")
 $ N_i > 0 wide upright("on ") Sigma upright(" whenever ") 0 < x_i < 1 . $ <geo:strict-normal>]

 Consequently $E ∩ Q$ is a down-set for the coordinatewise order.]
] <geo:normals>

#proof[
  On the entire torus surface, $u = N_i$ satisfies the Jacobi equation
  $ L u = 0 \, wide L = Delta_Sigma + \| upright("II") \|^2 \, $
  because axial translations preserve mean curvature. It is odd under the corresponding reflection.
    If it vanished identically, the complete axial circle field would be tangent to $Sigma$;
    its flow would preserve $Sigma$. The quotient by this free circle action is a closed connected curve,
    making $Sigma$ a torus, contrary to its genus.
  We spell out the constrained nodal-domain argument. The stability form is
  $ cal(Q) \( f \, f \) = integral_Sigma #scale(x: 120%, y: 120%)[\(] \| nabla f \|^2 - \| upright("II") \|^2 f^2
    #scale(x: 120%, y: 120%)[\)] thin d S gt.eq 0 quad upright("if ") integral_Sigma f thin d S = 0 . $
  The restriction $u_D$ to a nodal domain $D$, extended by zero,
    belongs to $H^1 \( Sigma \)$ and satisfies $cal(Q) \( u_D \, u_D \) = 0$.
    This follows by testing $L u = 0$ with the restriction, or first truncating the signed values at distance
    $epsilon$ from zero and passing to the limit. Restrictions to distinct nodal domains are orthogonal for
    $cal(Q)$. If there were at least three nodal domains, a nonzero combination $f$ of two restrictions could be
    chosen with zero mean. It would have $cal(Q) \( f \, f \) = 0$.
    Polarizing the stability inequality against all mean-zero tests gives $L f = c$ weakly for a constant $c$.
    On the unused nodal domain $f = 0$, so $c = 0$. Local elliptic regularity first bootstraps this weak solution
    to a smooth one. The Jacobi coefficients are analytic because $Sigma$ is,
    so analytic elliptic regularity [3] Theorem 1.1 and the identity theorem force $f = 0$ everywhere,
    a contradiction. Thus $u$ has at most two nodal domains.
  It vanishes on the two reflection tori. An additional zero in either open half would force both signs locally:
    a one-signed Jacobi solution cannot have an interior zero by the strong minimum principle and unique
    continuation. Reflection would give both signs in the other half, hence at least four nodal domains.
    Different signs on different pieces of a half give the same contradiction.
    Therefore the sign is strict and fixed on each half. Reverse coordinates to obtain (3.1).
  An increasing coordinate segment meets $Sigma$, when it meets it in its interior,
    transversely and only from the occupied to the vacant side. It cannot cross twice.
    Following coordinate segments proves the down-set assertion, also on the faces by continuity. ◻
]

This is the graph observation of Ritoré, presented with its stability proof in Ros [11] Proposition 2.3.
  The explicit argument above will also control the exceptional slicing levels.

#thm([Proposition 3.3.])[
  (Vertex patterns).  #emph[No vertex of $Q$ lies on $Sigma$.
    Up to taking the complementary region and reversing all coordinates, and up to coordinate permutations,
    the only possible vertex sets for a nonstandard minimizer are
#[#set math.equation(numbering: n => "(3.2)")
 $ { 000 \, 100 \, 010 } \, wide { 000 \, 100 \, 010 \, 001 } . $ <geo:two-patterns>]

 The four-vertex pattern may be placed on the smaller-volume side.
   No such assertion is yet made for the three-vertex pattern.]
] <geo:patterns>

#proof[
  At a vertex, equivariance under all three reflections would force all components of a boundary normal to vanish.
    Thus each vertex lies strictly on one side. The occupied vertices form a nonempty proper order ideal,
    containing $000$ and excluding $111$. Complementation followed by $x mapsto \( 1 \, 1 \, 1 \) -
    x$ preserves the down-set property and replaces the number of occupied vertices by its complement to eight.
    We may therefore assume at most four occupied vertices.
  For one occupied vertex, the three opposite faces are strictly vacant.
    Indeed a point on such a face in the closure of the region would, by monotonicity,
    put its nearest axial vertex in the closure as well. Compactness gives a gap from those faces.
    Reflect about the occupied corner to lift the region into a box centered there.
    Every radial ray starts inside and crosses the boundary exactly once, transversely:
    at a boundary point $x eq.not 0$, $sum_i x_i N_i > 0$, with signs interpreted by reflection.
    The radial function is smooth by the implicit function theorem. The boundary is a sphere.
  For two occupied vertices, they form an edge, say in the $x$-direction.
    The entire corresponding axial circle is occupied, with a neighborhood,
    and the other two opposite faces are separated from the region by gaps.
    In the cover $S_x^1 times bb(R)^2$, radial rays in the transverse plane about this circle cross once and
    transversely, since $y N_y + z N_z > 0$ at the boundary. A smooth radial function over $S^1 times
    S^1$ parametrizes the boundary, which has genus one. Both cases are excluded.
  Three occupied vertices necessarily give the first pattern in (3.2).
    Four occupied vertices either give the second pattern or form an entire face.
    In the latter case that whole face is strictly occupied and the opposite face strictly vacant.
    The strict normal signs give a graph between them, separated from both end faces.
    Reflection produces two disjoint graphs over the transverse torus, contradicting connectedness of $Sigma$.
  Finally the four-vertex pattern is carried to itself by complementation and reversal of all coordinates.
    It may thus be assigned to the smaller-volume side. Reducing the vertex count alone would not establish the
    analogous assertion for the three-vertex pattern; its occupied-side choice will follow from the flux identity. ◻
]

#figure(
  [#grid(
    columns: (0.43fr, 0.43fr,),
    column-gutter: 14%,
    [
      (130,112) (25,20)(1,0)60 (25,20)(1,1)20 (85,20)(1,1)20 (45,40)(1,0)60 (25,75)(1,0)60 (25,75)(1,1)20
        (85,75)(1,1)20 (45,95)(1,0)60 (25,20)(0,1)55 (85,20)(0,1)55 (45,40)(0,1)55 (105,40)(0,1)55
      (25,20) (25,20) (85,20) (85,20)
      (45,40) (45,40) (105,40) (105,40)
      (25,75) (25,75) (85,75) (85,75)
      (45,95) (45,95) (105,95) (105,95) (25,20) (85,20) (45,40) (25,12)(0,0)\[t\]$000$ (85,12)(0,0)\[t\]$100$
        (37,44)(0,0)\[r\]$010$ =4 (25,75) (17,77)(0,0)\[r\]$001$
      Three occupied vertices
    ],
    [
      (130,112) (25,20)(1,0)60 (25,20)(1,1)20 (85,20)(1,1)20 (45,40)(1,0)60 (25,75)(1,0)60 (25,75)(1,1)20
        (85,75)(1,1)20 (45,95)(1,0)60 (25,20)(0,1)55 (85,20)(0,1)55 (45,40)(0,1)55 (105,40)(0,1)55
      (25,20) (25,20) (85,20) (85,20)
      (45,40) (45,40) (105,40) (105,40)
      (25,75) (25,75) (85,75) (85,75)
      (45,95) (45,95) (105,95) (105,95) (25,20) (85,20) (45,40) (25,12)(0,0)\[t\]$000$ (85,12)(0,0)\[t\]$100$
        (37,44)(0,0)\[r\]$010$ =4 (25,75) (17,77)(0,0)\[r\]$001$
      Four occupied vertices
    ],
  )],
  caption: [Figure 1: The two patterns in Proposition 8. Solid vertices are occupied and open vertices are vacant. Only the cube edges are drawn; the boundary surface is not depicted. ],
) <geo:pattern-figure>

== 4 Identities for planar sections <slice:section>

Coordinate monotonicity lets us describe the boundary through planar sections.
  The identities below convert their perimeters and area changes into bounds on the total boundary area at the two
  transition volumes.

Choose an axial direction $z$ in the reflected cube $Q$, and write

$ E_z = { \( x \, y \) in \[ 0 \, 1 \]^2 : \( x \, y \, z \) in E } \, wide v \( z \) = \| E_z \| \, quad s =
  v \( 0 \) \, quad r = v \( 1 \) . $

Let $p \( z \)$ be the relative perimeter of $E_z$ in the square.
  In slice integrals, $partial E_z$ denotes the separating curve ${ \( x \, y \)
  in \[ 0 \, 1 \]^2 : \( x \, y \, z \) in Sigma }$, including its endpoints;
  portions of the square boundary are not counted. The surface coarea Jacobian for the height function is

$ alpha = \| nabla_Sigma z \| = sqrt(1 - N_z^2) . $

Its mean square over the surface patch will be denoted by

$ b_z = 1 / A integral_(Sigma ∩ Q) \( 1 - N_z^2 \) thin d S . $

All section identities at interior heights are initially understood at regular levels.

#thm([Lemma 4.1.])[
  (Regular levels and area coordinates).  #emph[There are only finitely many exceptional axial heights.
    The function $v$ is continuous, nonincreasing, absolutely continuous, and smooth off those heights.
    The end levels are regular, with a regular collar whenever nonempty.
    For every nonnegative measurable function $gamma$,
#[#set math.equation(numbering: n => "(4.1)")
 $ integral_0^1 gamma \( v \( z \) \) \( - v' \( z \) \) thin d z =
   integral_r^s gamma \( w \) thin d w . $ <slice:substitution>]

]
] <slice:regularity>

#proof[
  A critical point of the height on $Sigma$ has $N = plus.minus e_z$.
    By (3.1), both $x \, y$ then belong to ${ 0 \, 1 }$. Such a point lies on an axial edge,
    which is transverse to the surface. These intersections are isolated and,
    by compactness and the exclusion of vertices, finite.
  The boundary faces of the square introduce no further exceptional heights.
    On $x = c$, $c in { 0 \, 1 }$, one has $N_x = 0$; a tangent to the face intersection is $e_x times
    N = \( 0 \, - N_z \, N_y \)$. Its height derivative can vanish only if $N_y = 0$, forcing $y = 0$ or $1$,
    and hence an already-counted axial edge. Interchanging $x \, y$ treats the other faces.
    Equivalently, reflect in these two coordinates and take sections in a transverse two-torus.
  At the end faces $N_z = 0$, so the height restricted to the reflected surface is regular there.
    Compactness supplies a regular collar; an empty end section has an empty collar.
    At any interior height the intersection with $Sigma$ is a union of regular curve pieces and finitely many
    critical points, of zero planar area. Any jump of the nested section areas would be supported on that boundary
    intersection. Thus $v$ is continuous. On intervals of regular levels it is smooth by smooth transport of the
    compact section curves.
  Monotonicity makes $D v$ a finite measure. Its singular part can be supported only on the finite set of
    exceptional heights. Continuity rules out atoms, and therefore this singular part is zero.
    This proves absolute continuity without first assuming integrability of $1 \/ alpha$.
  For (4.1), push forward the measure $\( - v' \( z \) \) thin d z$ under $v$.
    For $r < a < b < s$, the inverse image of $\( a \, b \)$ is an interval, up to endpoint plateaus,
    and absolute continuity gives it measure $b - a$. A level set has zero measure for this pushforward:
    on any plateau $v' = 0$ almost everywhere. The pushforward is therefore Lebesgue measure on $\( r \, s \)$.
    The assertion follows first for interval indicators and then for all nonnegative measurable $gamma$.
    No regularity of the inverse of $v$ is required. ◻
]

#thm([Lemma 4.2.])[
  (Flux and coarea).  #emph[With the preceding notation,
#[#set math.equation(numbering: n => "(4.2)")
 $ integral_(partial E_z) alpha thin d ell & = b_z A + h \( v \( z \) - V \) \,\
p \( 0 \) & = b_z A + h \( s - V \) \, & p \( 1 \) & = b_z A + h \( r - V \) \,\
s - r & = integral_(Sigma ∩ Q) N_z thin d S lt.eq A sqrt(1 - b_z) \,\
- v' \( z \) & = integral_(partial E_z) N_z / alpha thin d ell \, & A & = integral_0^1 integral_(partial E_z) 1 /
  alpha thin d ell thin d z . $ <slice:flux>]

 Moreover $b_x + b_y + b_z = 2$, and $b_i < 1$ in every direction.]
] <slice:identities>

#proof[
  Apply first variation to $X = eta \( z \) e_z$, where $eta in C_c^oo \( 0 \, 1 \)$.
    Orthogonality to the cube faces eliminates the boundary term;
    the same computation may be made after reflection. The outward/sum-curvature convention and the divergence
    theorem give
  $ integral_(Sigma ∩ Q) eta' \( z \) \( 1 - N_z^2 \) thin d S = h integral_(Sigma ∩ Q) eta \( z \) N_z thin d S =
    h integral_0^1 eta' \( z \) v \( z \) thin d z . $
  Coarea converts the first integral to $integral eta' \( z \) integral_(partial E_z) alpha thin d ell thin d z$.
    Consequently $integral_(partial E_z) alpha thin d ell - h v \( z \)$ is constant.
    Averaging over the unit height interval identifies it as $b_z A - h V$.
    Continuity on regular intervals gives the identity at every regular level.
    At each end, $alpha = 1$, and the regular collar gives the two endpoint formulas in (4.2).
  The divergence theorem for $e_z$ gives $integral_(Sigma ∩ Q) N_z thin d S = s - r$.
    Since $integral N_z^2 thin d S = A \( 1 - b_z \)$, Cauchy–Schwarz yields (4.2).
  At a regular height, the outward planar normal velocity of the slice curve is $- N_z \/ alpha$.
    The area-variation formula gives the first identity in (4.2).
    Coarea on the surface gives the second; the finite critical-point set has surface area zero,
    so no term is lost there. These integrals remain valid if their integrands become unbounded as an exceptional
    height is approached.
  Finally $sum_i \( 1 - N_i^2 \) = 2$ pointwise, giving the sum of the $b_i$.
    The strict sign of $N_i$ on a nonempty interior patch gives $integral N_i^2 > 0$, hence $b_i < 1$. ◻
]

== 5 The first endpoint exclusions <slice:early-exclusions>

We now apply the section identities to the two vertex patterns in Proposition 8.
  The four-vertex pattern is excluded at both transition volumes by the same estimate.
  The three-vertex pattern is excluded at the first transition; at the second,
  the identities give the parameters needed for the nesting argument.

=== 5.1 The four-vertex pattern <the-four-vertex-pattern>

#thm([Proposition 5.1.])[
  #emph[A nonstandard minimizer at either $V_1 = 4 pi \/ 81$ or $V_2 =
    1 \/ pi$ cannot have the occupied vertex pattern ${ 000 \, 100 \, 010 \, 001 }$.]
] <slice:four-vertex>

#proof[
  The complement of this pattern becomes the same pattern after reversing all three coordinates.
    We may therefore choose the smaller-volume side, so that $V in { V_1 \, V_2 }$ and $h gt.eq 0$. Put
  $ a = sqrt(pi V) \, wide x = h A . $
  The standard competitors and the curvature estimate (2.1) give
  #[#set math.equation(numbering: n => "(5.1)")
   $ 0 < A lt.eq a lt.eq 1 \, wide 0 lt.eq x lt.eq sqrt(pi A) lt.eq sqrt(pi) . $ <slice:four-parameters>]
  Since $b_x + b_y + b_z = 2$, choose a slicing direction, denoted by $z$, for which $b = b_z gt.eq 2 \/ 3$,
    and write $d = sqrt(1 - b)$. The strict positivity of $N_z$ in the interior implies $b < 1$, so
  $ 0 < d lt.eq 1 / sqrt(3) . $
  The top section is a corner region, separated from the two opposite edges of its square.
    The bottom section has a complement of the same kind at the opposite corner.
    Reflecting either corner region in its two adjacent edges gives a planar region of four times its area and
    four times its relative perimeter. The planar isoperimetric inequality therefore gives
  $ p \( 1 \) gt.eq sqrt(pi r) \, wide p \( 0 \) gt.eq sqrt(pi \( 1 - s \)) . $
  Monotonicity gives $r lt.eq V$. Define $w in \[ 0 \, 1 \]$ by $sqrt(pi r) = a w$.
    The endpoint flux identities (4.2) and the projection estimate (4.2) now imply
  #[#set math.equation(numbering: n => "(5.2)")
   $ a w & lt.eq A b - frac(h a^2, pi) \( 1 - w^2 \) \,\
sqrt(pi \( 1 - s \)) & lt.eq A b - frac(h a^2, pi) \( 1 - w^2 \) + x d \,\
s & lt.eq frac(a^2 w^2, pi) + A d . $ <slice:four-endpoint-inequalities>]
  Indeed, $p \( 0 \) = p \( 1 \) + h \( s - r \)$, and $s - r lt.eq A d$.
  Dividing the first inequality in (5.2) by $a$ and using $A lt.eq a$ and $h a gt.eq x$ yields
  $ f \( w \) := w + x / pi \( 1 - w^2 \) lt.eq b . $
  Since $f \( 1 \) = 1 > b$, continuity gives $tau in \[ w \, 1 \)$ with
  #[#set math.equation(numbering: n => "(5.3)")
   $ tau + x / pi \( 1 - tau^2 \) = 1 - d^2 \, wide x = frac(pi \( 1 - tau - d^2 \), 1 - tau^2) . $ <slice:four-root>]
  In particular $tau lt.eq 1 - d^2$. No monotonicity of $f$ is required.
    The function $E \( q \) = A b - h a^2 \( 1 - q^2 \) \/ pi$ is nondecreasing for $q gt.eq 0$, and
  $ E \( tau \) = A tau + frac(h \( A^2 - a^2 \), pi) \( 1 - tau^2 \) lt.eq a tau . $
  Consequently (5.2) gives
  $ sqrt(pi \( 1 - s \)) lt.eq a tau + x d \, wide s lt.eq frac(a^2 tau^2, pi) + A d . $
  Both sides of the first inequality are nonnegative. Squaring it, combining the two inequalities, and using $A \,
    a lt.eq 1$, we obtain the necessary condition
  #[#set math.equation(numbering: n => "(5.4)")
   $ 1 lt.eq R \( tau \, d \) := d + frac(tau^2 + \( tau + x d \)^2, pi) . $ <slice:four-contradiction>]
  The scalar inequality in Lemma 21 contradicts (5.4); its hypotheses follow from (5.1) and (5.3),
    together with $0 < d lt.eq 1 \/ sqrt(3)$. This excludes the four-vertex pattern at both transition volumes. ◻
]

=== 5.2 The three-vertex pattern <the-three-vertex-pattern>

Consider the pattern ${ 000 \, 100 \, 010 }$, with $z$ the missing axial direction.
  At this stage the occupied side may a priori be either side of the original minimizer.
  The top square is vacant, and is separated from the region by a nonempty collar, so $v \( z \) = p \( z \) =
  0$ near $z = 1$. The flux constant in (4.2) is therefore zero: $b_z A = h V$.
  The bottom section has a corner complement and $0 < s < 1$. Its planar perimeter bound and (4.2) give

#[#set math.equation(numbering: n => "(5.5)")
 $ integral alpha thin d ell = h v \( z \) \, wide p \( 0 \) = h s gt.eq sqrt(pi \( 1 - s \)) \, wide s^2 lt.eq
   A \( A - h V \) . $ <slice:three-flux>]

The first identity holds at every regular slicing level. In particular $h > 0$,
  since the bottom complement has positive area. Profile concavity and complement symmetry give nonpositive
  outward curvature on the larger-volume side. Thus this pattern necessarily labels the smaller-volume side,
  and $V$ equals the endpoint volume under consideration.

#thm([Proposition 5.2.])[
  #emph[A nonstandard minimizer at $V_1 = 4 pi \/ 81$ cannot have the three-vertex pattern.]
] <slice:three-first>

#proof[
  Set $a = sqrt(pi V_1) = 2 pi \/ 9$ and $x = h A$. As before, $A lt.eq a$ and $0 lt.eq x lt.eq M := sqrt(pi a) =
    pi sqrt(2) \/ 3 < pi$. Since $V_1 = a^2 \/ pi gt.eq A^2 \/ pi$, (5.5) gives
  $ s^2 lt.eq A^2 - x V_1 lt.eq A^2 \( 1 - x \/ pi \) \, wide s lt.eq A sqrt(1 - x \/ pi) . $
  Combining this with $pi \( 1 - s \) lt.eq h^2 s^2$ yields
  #[#set math.equation(numbering: n => "(5.6)")
   $ 1 lt.eq a sqrt(1 - x \/ pi) + x^2 / pi \( 1 - x \/ pi \) . $ <slice:three-first-scalar>]
  The first summand decreases in $x$. The second, denoted by $g \( x \)$, has derivative $g' \( x \) =
    x \( 2 pi - 3 x \) \/ pi^2 gt.eq 0$ on $\[ 0 \, M \]$, since $M < 2 pi \/ 3$.
    For $0 lt.eq x lt.eq 1$, the right side of (5.6) is at most
  $ a + g \( 1 \) < 44 / 63 + 2 / 9 = 58 / 63 < 1 . $
  Here $\( pi - 1 \) \/ pi^2 < 2 \/ 9$ because $\( p - 1 \) \/ p^2$ decreases for $p > 2$ and $pi > 3$.
    For $1 lt.eq x lt.eq M$, it is at most
  $ a sqrt(1 - 1 \/ pi) + g \( M \) & = a (sqrt(1 - 1 \/ pi) + 1 - sqrt(2) / 3)\
 & < 44 / 63 (5 / 6 + 8 / 15) = 902 / 945 < 1 . $
  The strict bounds $sqrt(1 - 1 \/ pi) < 5 \/ 6$ and $sqrt(2) > 7 \/ 5$ follow by squaring, using $pi < 22 \/ 7$.
    Both intervals contradict (5.6). ◻
]

#thm([Proposition 5.3.])[
  #emph[Suppose that a nonstandard minimizer at $V_2 = 1 \/ pi$ has the three-vertex pattern.
    Then $A lt.eq 1$, the identities (5.5) hold, and
#[#set math.equation(numbering: n => "(5.7)")
 $ sqrt(pi \( 1 - s \)) / s lt.eq h lt.eq pi \( 1 - s^2 \) \, wide 0.535 < s < 0.89 \, wide 0.64 lt.eq h lt.eq
   2.25 \, wide s gt.eq t \( h \) \, $ <slice:three-parameters>]

 where
#[#set math.equation(numbering: n => "(5.8)")
 $ t = t \( h \) := frac(2, 1 + sqrt(1 + 4 h^2 \/ pi)) \, wide h^2 t^2 = pi \( 1 - t \) . $ <slice:t-definition>]

]
] <slice:three-second-parameters>

#proof[
  The slab competitor gives $A lt.eq 1$. The lower bound on $h$ in (5.7) follows from the bottom perimeter
    inequality in (5.5). Its projection inequality gives
  $ h lt.eq pi (A - s^2 / A) lt.eq pi \( 1 - s^2 \) \, $
  since $A - s^2 \/ A$ is increasing for $A > 0$. Solving $h^2 s^2 + pi s - pi gt.eq 0$ for $s > 0$ gives $s gt.eq
    t \( h \)$.
  Combining the two bounds on $h$, and dividing by $1 - s > 0$, gives
  $ Phi \( s \) := s^2 \( 1 - s \) \( 1 + s \)^2 gt.eq 1 / pi . $
  Its derivative is $Phi' \( s \) = s \( 1 + s \) \( 2 + s - 5 s^2 \)$,
    so $Phi$ increases up to $s_(*) = \( 1 + sqrt(41) \) \/ 10$ and decreases thereafter.
    The points $107 \/ 200$ and $89 \/ 100$ lie on the respective sides of $s_(*)$. Exact arithmetic gives
  $ 22 / 7 Phi \( 107 \/ 200 \) = 1103875107423 / 1120000000000 < 1 \, wide 22 / 7 Phi \( 89 \/ 100 \) =
    4890924423 / 5000000000 < 1 . $
  Since $pi < 22 \/ 7$, unimodality implies $107 \/ 200 < s < 89 \/ 100$.
    Finally, $sqrt(pi \( 1 - s \)) \/ s$ decreases with $s$, and hence
  $ h > sqrt(3300 / 7921) > 16 / 25 \, wide h < 22 / 7 (1 - (107 / 200)^2) = 314061 / 140000 < 9 / 4 . $
  For the first strict comparison, $pi > 3$ was used; its last step follows from $3300 \/
    7921 - \( 16 \/ 25 \)^2 = 34724 \/ 4950625 > 0$. These strict bounds imply the closed curvature interval
    stated in (5.7). ◻
]

== 6 Slice nesting at the cylinder–slab transition <nest:section>

We consider the three-vertex pattern at volume $V = 1 \/ pi$, under the contradictory assumption $A lt.eq 1$.
  The slicing direction is the missing axis, so that the top slices are empty.
  Proposition 13 gives $0.64 lt.eq h lt.eq 2.25$ and $s gt.eq t = t \( h \)$,
  where (5.8) defines $t$ by $h^2 t^2 = pi \( 1 - t \)$. In particular, $h > 0$ and $0 < t < 1$.
  We use the flux identity

$ integral_(partial E_z) alpha thin d ell = h v \( z \) \, wide p \( 0 \) = h s \, $

from (5.5), and the coarea identities (4.2). All perimeters in this Section are relative to the unit square.
  All terminating decimals denote exact rational numbers.

The argument first gives a lower bound depending only on $h$ and $s$.
  It then improves that bound on an interval of slice areas by retaining the fact that every slice is contained in
  the bottom slice. This is especially useful when a slice changes from a strip to the complement of a corner region.

=== 6.1 An integrated flux inequality <an-integrated-flux-inequality>

Fix $lambda = 0.98$. Subtracting $lambda$ times the flux from the surface-area coarea density gives $1 \/ alpha -
  lambda alpha$, whereas the decrease of slice area has density $sqrt(1 - alpha^2) \/ alpha$.
  At a constant value $0 < alpha < 1$, their ratio is $g \( alpha \)$, where

$ g \( X \) = frac(1 - lambda X^2, sqrt(1 - X^2)) \, wide 0 lt.eq X < 1 . $

The flux determines only the arclength mean $h v \/ p$ of $alpha$, not its pointwise values.
  The next lemma uses convexity to obtain a whole-slice comparison from this mean.
  To make that comparison compatible with perimeter lower bounds, we use a non-increasing minorant of $g$:
  replacing $p$ by a smaller quantity increases the argument $h v \/ p$ and does not increase the resulting lower bound.

Set

#[#set math.equation(numbering: n => "(6.1)")
 $ D = sqrt(48) / 7 \, wide ell = 0.28 \,\
G \( X \) = g \( X_0 \) \, wide X_0 = min { X \, D } \, quad X gt.eq 0 . $ <nest:weight>]

Direct differentiation gives

#[#set math.equation(numbering: n => "(6.2)")
 $ - frac(d, d r) g \( sqrt(r) \) = frac(0.48 - 0.49 r, \( 1 - r \)^(3 \/ 2)) \, wide 0 lt.eq
   r < 1 . $ <nest:weight-derivative>]

Thus $g$ decreases up to $D$, increases thereafter, and $g \( D \) = 7 \/ 25 = ell$.
  Consequently $G$ is non-increasing, takes values in $\[ ell \, 1 \]$, and satisfies $G \( X \) lt.eq
  g \( X \)$ for $0 lt.eq X < 1$. Its definition for $X gt.eq
  1$ also covers perimeter lower bounds for which the substituted argument exceeds one.

#thm([Lemma 6.1.])[
  (Integrated flux).  #emph[At every nonempty regular slice, with area $v$ and perimeter $p$,
#[#set math.equation(numbering: n => "(6.3)")
 $ integral_(partial E_z) frac(d ell, alpha) - lambda h v gt.eq
   G \( h v \/ p \) integral_(partial E_z) sqrt(1 - alpha^2) / alpha thin d ell . $ <nest:jensen>]

 If a nonnegative measurable function $gamma$ satisfies $G \( h v \( z \) \/ p \( z \) \) gt.eq
   gamma \( v \( z \) \)$ at the nonempty regular levels, then
#[#set math.equation(numbering: n => "(6.4)")
 $ A gt.eq frac(lambda h, pi) + integral_0^s gamma \( v \) thin d v . $ <nest:area-coordinate>]

]
] <nest:integrated-flux>

#proof[
  For fixed $J in \[ 0 \, 1 \]$, let
  $ f_J \( X \) = 1 / X - lambda X - J sqrt(1 - X^2) / X \, wide 0 < X lt.eq 1 . $
  On $\( 0 \, 1 \)$,
  $ X^3 f''_J \( X \) = 2 - J frac(2 - 3 X^2, \( 1 - X^2 \)^(3 \/ 2)) gt.eq 0 . $
  Indeed, the function $\( 2 - 3 r \) \/ \( 1 - r \)^(3 \/ 2)$ decreases from $2$ to $0$ on $\[ 0 \, 2 \/ 3 \]$,
    its derivative being $- 3 r \/ \[ 2 \( 1 - r \)^(5 \/ 2) \]$; it is nonpositive on $\[ 2 \/ 3 \, 1 \)$.
    Convexity extends to the continuous endpoint value at $X = 1$.
  Use normalized arclength on the slice curve as a probability measure.
    The flux identity says that the mean of $alpha$ is $m = h v \/ p in \( 0 \, 1 \]$. Take $J = G \( m \)$.
    For $m < 1$,
  $ f_J \( m \) = sqrt(1 - m^2) / m #scale(x: 120%, y: 120%)[\(] g \( m \) -
    G \( m \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 \; $
  for $m = 1$, $f_J \( 1 \) = 1 - lambda > 0$. Jensen’s inequality now yields $integral f_J \( alpha \) thin d ell
    gt.eq 0$, which is (6.3).
  Down-set position gives $N_z gt.eq 0$, hence $sqrt(1 - alpha^2) = N_z$.
    The coarea identities therefore turn (6.3) into
  $ A - lambda h V gt.eq integral_0^1 G \( h v \( z \) \/ p \( z \) \) thin \( - v' \( z \) \) thin d z gt.eq
    integral_0^1 gamma \( v \( z \) \) thin \( - v' \( z \) \) thin d z . $
  The integrands are set to zero at empty or exceptional levels.
    Lemma 9, with $r = 0$, identifies the last integral with $integral_0^s gamma \( v \) thin d v$.
    Since $V = 1 \/ pi$, this proves (6.4). ◻
]

#thm([Lemma 6.2.])[
  (Planar patterns and the baseline bound).  #emph[Every nonempty regular slice satisfies
#[#set math.equation(numbering: n => "(6.5)")
 $ p gt.eq p_(*) \( v \) := min { sqrt(pi v) \, med 1 \, med sqrt(pi \( 1 - v \)) } . $ <nest:planar-bound>]

 Put $a_0 = 1 \/ pi$, $b_0 = 1 - 1 \/ pi$, and define
#[#set math.equation(numbering: n => "(6.6)")
 $ B \( h \) = frac(lambda h, pi) + integral_0^(t \( h \)) G #h(-0.16667em) (frac(h v, p_(*) \( v \))) thin d v -
   1 . $ <nest:baseline>]

 At $v = 0$ the argument in the integrand is understood by its limit. Then
#[#set math.equation(numbering: n => "(6.7)")
 $ A - 1 gt.eq B \( h \) + ell \( s - t \) . $ <nest:baseline-slack>]

]
] <nest:planar-patterns>

#proof[
  The far vertex $\( 1 \, 1 \)$ is absent even from the bottom slice and hence from every slice.
    A nonempty regular slice has, by monotonicity, one, two adjacent, or three occupied square vertices.
    In the first case the slice is confined to the occupied corner.
    Reflection across its two adjacent sides gives a bounded planar set of area $4 v$ and perimeter $4 p$;
    the Euclidean isoperimetric inequality gives $p^2 gt.eq pi v$.
    In the three-vertex case the same argument applies to the opposite-corner complement and gives $p^2 gt.eq
    pi \( 1 - v \)$.
  In the two-vertex case, after interchanging the square coordinates if necessary,
    the occupied vertices form the bottom edge. This entire edge is occupied and the opposite edge is vacant.
    Each vertical segment crosses the separating curve exactly once:
    monotonicity gives uniqueness, and the strict normal inequality gives a transverse crossing.
    The implicit function theorem, also in the reflected endpoint neighborhoods,
    writes the curve as a single decreasing graph $y = f \( x \)$ for $0 lt.eq x lt.eq 1$.
    Its length is at least $1$. These arguments establish (6.5), including both strip orientations.
  Since $G$ is non-increasing, (6.5) implies $G \( h v \/ p \) gt.eq G \( h v \/ p_(*) \( v \) \)$.
    Apply Lemma 14 and use $s gt.eq t$ and $G gt.eq ell$ on the remaining interval $\[ t \, s \]$ to obtain (6.7). ◻
]

The scalar estimates in Appendix 9 show that $B \( h \)$ suffices outside $\[ 1.02 \, 1.62 \]$ but is negative at
  $h = 1.46$. The slack $s - t$ contributes $ell \( s - t \)$ directly.
  When this slack is small, the bottom complement constrains both edge extents;
  nesting then bounds each strip’s smaller endpoint and forces a length excess.
  We quantify these two gains and minimize their sum over the slack.

=== 6.2 The bottom slice controls both strip orientations <the-bottom-slice-controls-both-strip-orientations>

In the remainder of the geometric improvement assume $1.02 lt.eq h lt.eq 1.62$.
  Let $L_x \, L_y$ be the extents of the bottom complement along the sides $y = 1 \, x = 1$, respectively.
  They are measured from its corner $\( 1 \, 1 \)$ and need not be equal.
  Figure 2 shows how each extent constrains the endpoint of a contained strip in the corresponding orientation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  merge-path({line((1.8, 5), (5, 5), (5, 1.4)); bezier((5, 1.4), (2.55, 3.05), (3.8, 1.4), (2.8, 2.15)); bezier((2.55, 3.05), (1.8, 5), (2.35, 3.9), (1.8, 4.15))}, close: true, fill: rgb("#e0e0e0"), stroke: none)
  merge-path({line((0, 0), (5, 0), (5, 0.9)); bezier((5, 0.9), (0, 3.15), (3.25, 0.9), (1.9, 3.15))}, close: true, fill: rgb("#e0e0ff"), stroke: none)
  rect((0, 0), (5, 5), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"))
  bezier((1.8, 5), (2.55, 3.05), (1.8, 4.15), (2.35, 3.9), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  bezier((2.55, 3.05), (5, 1.4), (2.8, 2.15), (3.8, 1.4), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  bezier((0, 3.15), (5, 0.9), (1.9, 3.15), (3.25, 0.9), stroke: (paint: rgb("#000099"), thickness: 0.8pt, cap: "round", join: "round"))
  line((1.8, 5.3), (5, 5.3), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((3.4, 5.3), [$L_x$], anchor: "south", padding: 0.1176cm)
  line((5.35, 1.4), (5.35, 5), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((5.35, 3.2), [$L_y$], anchor: "west", padding: 0.1176cm)
  line((0, 1.4), (5, 1.4), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  content((0, 1.4), [$1-L_y$], anchor: "east", padding: 0.1176cm)
  circle((5, 1.4), radius: 0.045, fill: black, stroke: none)
  circle((5, 0.9), radius: 0.045, fill: rgb("#000099"), stroke: none)
  line((5, 0.9), (5.9, 0.55), stroke: (paint: rgb("#000099"), thickness: 0.4pt, cap: "round", join: "round"))
  content((5.9, 0.55), [#text(fill: rgb("#000099"))[$f(1)$]], anchor: "west", padding: 0.1176cm)
  content((3.95, 4), [$[0,1]^2 without E_0$])
  content((1.45, 0.95), [#text(fill: rgb("#000099"))[$E_z$]])
  content((1.2, 4.1), [$E_0$])
  content((1.2, 2.875), [#text(fill: rgb("#000099"))[$y=f(x)$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [$0$], anchor: "north-east", padding: 0.1176cm)
  content((5, 0), [$1$], anchor: "north", padding: 0.1176cm)
  content((0, 5), [$1$], anchor: "east", padding: 0.1176cm)
  content((2.6, -0.15), [$x$], anchor: "north", padding: 0.1176cm)
  content((-0.15, 3.1), [$y$], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 2: Nesting constrains a strip through the bottom complement. The shaded strip $E_z = { \( x \, y \) : 0 lt.eq y lt.eq f \( x \) }$ lies in $E_0$, so its smaller endpoint satisfies $f \( 1 \) lt.eq 1 - L_y$. Interchanging $x$ and $y$ gives the bound using $L_x$ for the other strip orientation. The curves and the unequal extents are schematic; no convexity or circular shape is assumed. ],
) <nest:containment-figure>

#thm([Lemma 6.3.])[
  (Bottom calibration and nesting).  #emph[Each $L in { L_x \, L_y }$ satisfies
#[#set math.equation(numbering: n => "(6.8)")
 $ h s gt.eq frac(1 - s, L) + frac(pi L, 4) . $ <nest:extent-bound>]

 Consequently, a strip slice, written as a decreasing subgraph across either square coordinate,
   has smaller endpoint at most
#[#set math.equation(numbering: n => "(6.9)")
 $ e & = 1 - 2 / pi (h s - sqrt(h^2 s^2 - pi \( 1 - s \)))\
 & lt.eq 1 - frac(2 h t, pi) + Q Y \, wide Y = sqrt(s - t) \, wide Q = 2 /
   pi sqrt(pi + 2 h^2 t) . $ <nest:endpoint-bound>]

]
] <nest:bottom-calibration>

#proof[
  Use coordinates $\( xi \, eta \)$ measured from the complement’s corner,
    so that its monotone separating curve runs from $\( 0 \, L_y \)$ to $\( L_x \, 0 \)$ with $d xi gt.eq 0$,
    $d eta lt.eq 0$. For $L = L_y$, the vector
  $ (eta / L \, - sqrt(1 - eta^2 / L^2)) $
  has unit length. Pairing it with the tangent differential and integrating gives
  $ h s & gt.eq 1 / L integral eta thin d xi - integral sqrt(1 - eta^2 \/ L^2) thin d eta\
 & = frac(1 - s, L) + integral_0^L sqrt(1 - eta^2 \/ L^2) thin d eta = frac(1 - s, L) + frac(pi L, 4) . $
  The first integral is the complement area. This calculation uses only monotonicity of the curve,
    and so requires no convexity. Exchanging $xi$ and $eta$ proves the same estimate for $L_x$.
    Both extents are positive, because the complement has positive area.
  Solving the quadratic inequality (6.8) gives, for each extent,
  $ L gt.eq 2 / pi (h s - sqrt(h^2 s^2 - pi \( 1 - s \))) . $
  The discriminant is nonnegative by $h s gt.eq sqrt(pi \( 1 - s \))$.
    A strip $y = f \( x \)$ is contained in the bottom slice, so its smaller endpoint satisfies $f \( 1 \) lt.eq
    1 - L_y lt.eq e$. For a strip $x = f \( y \)$ the same argument uses $L_x$.
    Thus one common bound controls both orientations without imposing a symmetry on the two extents.
  Finally, write $s = t + Y^2$ and use $h^2 t^2 = pi \( 1 - t \)$ to obtain
  $ h^2 s^2 - pi \( 1 - s \) = \( pi + 2 h^2 t \) Y^2 + h^2 Y^4 . $
  Its square root is at most $sqrt(pi + 2 h^2 t) thin Y + h Y^2$.
    Substituting this upper bound in $e$ cancels the term $h Y^2$ coming from $h s$, and proves (6.9). ◻
]

We seek this excess on an interval $\[ u - delta \, u \]$ within the middle branch of $p_(*)$;
  the choice of $u$ also keeps $h v lt.eq 0.96 < D$. With $Q \, Y$ as in (6.9), set

#[#set math.equation(numbering: n => "(6.10)")
 $ u = min { b_0 \, 0.96 \/ h } \, wide P = u - 1 + frac(2 h t, pi) \,\
d_m = 0.21 \, wide c = 2.7 \, wide delta = min { d_m \, \( P - Q Y \)_(+) } \, $ <nest:gain-parameters>]

where $x_(+) = max { x \, 0 }$. Here $P - Q Y$ is a lower bound for the gap between $u$ and the smaller strip
  endpoint, and $delta$ is its positive part capped at $d_m$.

#thm([Lemma 6.4.])[
  (Placement and the three slice types).  #emph[On $1.02 lt.eq h lt.eq 1.62$ one has
#[#set math.equation(numbering: n => "(6.11)")
 $ u - d_m gt.eq 1033 / 2700 > 0.38 > a_0 \, wide u lt.eq b_0 \, wide u < t lt.eq s \, wide h u lt.eq
   0.96 . $ <nest:interval-placement>]

 Define
#[#set math.equation(numbering: n => "(6.12)")
 $ H \( q \) = min {q^2 \, frac(pi \( 1 - q \), c d_m)} \, wide 0 lt.eq q lt.eq 1 . $ <nest:shape-function>]

 If $delta > 0$, put $q = \( v - u + delta \) \/ delta$ for $u - delta lt.eq v lt.eq u$.
   Every regular slice in this area interval satisfies
#[#set math.equation(numbering: n => "(6.13)")
 $ p^2 gt.eq 1 + c delta^2 H \( q \) . $ <nest:improved-perimeter>]

]
] <nest:shape-gain>

#proof[
  The definition of $u$ gives $u gt.eq 0.96 \/ 1.62 = 16 \/ 27$, $u lt.eq b_0$, and $h u lt.eq 0.96$.
    Hence the first assertion follows from $16 \/ 27 - 0.21 = 1033 \/ 2700$, using $pi > 3$. Moreover,
  $ h^2 u^2 lt.eq 0.96^2 < 1 lt.eq pi \( 1 - u \) . $
  The function $x mapsto h^2 x^2 + pi x - pi$ is strictly increasing for $x gt.eq 0$ and vanishes at $t$,
    so $u < t$. This proves (6.11); in particular $\[ u - delta \, u \] subset \[ a_0 \, b_0 \] ∩ \[ 0 \, s \]$,
    where $p_(*) = 1$. For the remaining assertion assume $delta > 0$. The definition of $delta$ and (6.9) then give
  #[#set math.equation(numbering: n => "(6.14)")
   $ e lt.eq u - P + Q Y lt.eq u - delta . $ <nest:strip-endpoint>]
  We verify (6.13) separately for all three slice types of Lemma 15.
  #emph[Occupied corner.] Here $p^2 gt.eq pi v$. Since $v > 0.38$ and $pi > 3$,
  $ p^2 - 1 > 0.14 > c d_m^2 = 0.11907 gt.eq c delta^2 H \( q \) . $
  In the last step we used $H \( q \) lt.eq q^2 lt.eq 1$.
  #emph[Opposite-corner complement.] Here $p^2 gt.eq pi \( 1 - v \)$, and $v = u - delta + delta q$ gives
  $ p^2 - 1 & gt.eq pi \( b_0 - v \) gt.eq pi delta \( 1 - q \)\
 & gt.eq c delta^2 frac(pi \( 1 - q \), c d_m) gt.eq c delta^2 H \( q \) . $
  This includes the endpoint $q = 1$, $u = b_0$, where $H \( 1 \) = 0$.
  #emph[Strip.] Write the strip as $y = f \( x \)$, interchanging the two square coordinates if required.
    Its smooth decreasing graph has $f \( 1 \) lt.eq e$ by Lemma 16. Integration by parts and (6.14) give
  $ integral_0^1 x \| d f \| = integral_0^1 f \( x \) thin d x - f \( 1 \) = v - f \( 1 \) gt.eq v - u + delta = :
    j = delta q . $
  Set $k = 2.5 j lt.eq 2.5 d_m = 0.525$. Pair the graph tangent $\( d x \, \| d f \| \)$ with the unit vector
    $\( sqrt(1 - k^2 x^2) \, k x \)$ to obtain
  #[#set math.equation(numbering: n => "(6.15)")
   $ p gt.eq k j + integral_0^1 sqrt(1 - k^2 x^2) thin d x . $ <nest:strip-calibration>]
  For $0 lt.eq w lt.eq 0.525^2$,
  $ sqrt(1 - w) gt.eq 1 - w / 2 - w^2 / 5 . $
  Indeed the right side is positive and its square minus $1 -
    w$ is $w^2 \( - 3 \/ 20 + w \/ 5 + w^2 \/ 25 \) lt.eq 0$;
    the expression in parentheses is increasing and is negative at $w = 0.525^2$. It follows from (6.15) that
  $ p & gt.eq 1 + (35 / 24 - frac(25 j^2, 16)) j^2\
 & gt.eq 1 + 26677 / 19200 j^2 gt.eq 1 + 1.35 j^2 . $
  Squaring gives $p^2 gt.eq 1 + 2.7 j^2 gt.eq 1 + c delta^2 H \( q \)$.
    This establishes the same estimate for every slice type, even if the type or strip orientation changes within
    the area interval. Exceptional levels are not needed in this argument and have zero measure after the
    substitution in Lemma 14. ◻
]

=== 6.3 From perimeter improvement to an area gain <from-perimeter-improvement-to-an-area-gain>

The perimeter improvement has size proportional to $delta^2$ on an interval of slice areas of width $delta$.
  We will show that it adds an explicit positive multiple of $delta^3$ to the total area bound.
  The derivative estimate below converts the improvement of $p$ into an improvement of $G \( h v \/ p \)$;
  the moments of $H$ then average that improvement over the interval.
  Together with the already obtained term $ell \( s - t \)$,
  this will leave a one-variable minimization over the unknown bottom area $s$.

#thm([Lemma 6.5.])[
  (Derivative estimate).  #emph[For $0 lt.eq X lt.eq 0.96$,
#[#set math.equation(numbering: n => "(6.16)")
 $ frac(0.48 - 0.49 X^2, \( 1 - X^2 \)^(3 \/ 2)) gt.eq 0.91 X . $ <nest:derivative-inequality>]

]
] <nest:derivative-bound>

#proof[
  The assertion is immediate at $X = 0$. For $X > 0$, divide the left side by $X$ and write the result as
  $ frac(N \( X \), D_1 \( X \)) \, wide N \( X \) = 0.49 - frac(0.01, 1 - X^2) \, wide D_1 \( X \) =
    X sqrt(1 - X^2) . $
  The numerator decreases; the denominator is at most $1 \/ 2$ everywhere and decreases for $X gt.eq
    1 \/ sqrt(2)$. The following rational bounds therefore suffice:
  $ upright("interval for ") X & N \( X \) upright(" lower bound") & D_1 \( X \) upright(" upper bound")\
\[ 0 \, 0.84 \] & 0.456 & 0.50\
\[ 0.84 \, 0.89 \] & 0.44 & 0.46\
\[ 0.89 \, 0.94 \] & 0.40 & 0.41\
\[ 0.94 \, 0.96 \] & 0.36 & 0.33 $
  For clarity, each entry is certified by arithmetic on rational numbers.
    If $b$ is the right endpoint and $n$ the numerator bound, the four values of $\( 0.49 - n \) \( 1 - b^2 \) -
    0.01$ are respectively $0.0000096$, $0.000395$, $0.000476$, $0.000192$, all positive.
    For the last three rows the values of $D_1 \( a \)^2$ at the left endpoints are $0.20772864$, $0.16467759$,
    $0.10285104$, smaller than $0.46^2$, $0.41^2$, $0.33^2$ respectively.
    Finally each numerator lower bound exceeds $0.91$ times the denominator upper bound;
    the respective differences are $0.001$, $0.0214$, $0.0269$, $0.0597$. ◻
]

Define the moments and a perimeter bound associated with $H$ by

#[#set math.equation(numbering: n => "(6.17)")
 $ M = integral_0^1 H \( q \) thin d q \, wide q_m = frac(integral_0^1 q H \( q \) thin d q, M) \, wide p_2 = 1 +
   c d_m^2 max_(\[ 0 \, 1 \]) H . $ <nest:shape-moments>]

#thm([Lemma 6.6.])[
  (Uniform coefficient).  #emph[The constants in (6.17) satisfy
#[#set math.equation(numbering: n => "(6.18)")
 $ M > 0.2659 \, wide q_m > 0.697 \, wide p_2 < 1.09 . $ <nest:moment-bounds>]

 For $1.02 lt.eq h lt.eq 1.62$,
#[#set math.equation(numbering: n => "(6.19)")
 $ frac(0.91 c M, p_2^(3 \/ 2)) #scale(x: 120%, y: 120%)[\[] h \( u - \( 1 - q_m \) d_m \)
   #scale(x: 120%, y: 120%)[\]]^3 gt.eq C_0 \( h \) \, $ <nest:coefficient-inequality>]

 where
#[#set math.equation(numbering: n => "(6.20)")
 $ C_0 \( h \) = min { 0.134 h^3 \, 0.36 } . $ <nest:gain-coefficient>]

]
] <nest:coefficient-bound>

#proof[
  The two branches of $H$ meet once, at
  $ theta = frac(2, 1 + sqrt(1 + 4 c d_m \/ pi)) \, wide c d_m theta^2 = pi \( 1 - theta \) . $
  Thus $H \( q \) = q^2$ up to $theta$ and $H \( q \) = pi \( 1 - q \) \/ \( c d_m \)$ thereafter,
    with maximum $theta^2$. Integration, followed by the identity $pi \/ \( c d_m \) =
    theta^2 \/ \( 1 - theta \)$, gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ M & = theta^3 / 3 + frac(pi \( 1 - theta \)^2, 2 c d_m) = frac(theta^2 \( 3 - theta \), 6) \,\
integral_0^1 q H \( q \) thin d q & = theta^4 / 4 + frac(pi \( 1 - theta \)^2 \( 1 + 2 theta \), 6 c d_m) \,\
q_m & = frac(2 + 2 theta - theta^2, 2 \( 3 - theta \)) \, wide p_2 = 1 + c d_m^2 theta^2 . $ <nest:exact-moments>]
  Only $3.14 < pi < 22 \/ 7$ is needed to bound these expressions.
    The function $0.567 x^2 - pi \( 1 - x \)$ increases on $\[ 0 \, 1 \]$, and
  $ 0.567 \( 32 \/ 37 \)^2 - 3.14 \( 5 \/ 37 \) & = - 73 / 342250 < 0 \,\
0.567 \( 13 \/ 15 \)^2 - \( 22 \/ 7 \) \( 2 \/ 15 \) & = 3587 / 525000 > 0 . $
  It follows that $32 \/ 37 < theta < 13 \/ 15$. Both $theta^2 \( 3 - theta \) \/
    6$ and $\( 2 + 2 theta - theta^2 \) \/ \( 2 \( 3 - theta \) \)$ increase on $\( 0 \, 1 \)$; for the latter,
    the derivative is $\( theta - 2 \) \( theta - 4 \) \/ \( 2 \( 3 - theta \)^2 \) > 0$. Consequently
  $ M > 40448 / 151959 > 0.2659 \, wide q_m > 2041 / 2923 > 0.697 \, wide p_2 < 2723587 / 2500000 < 1.09 . $
  This proves (6.18).
  Here are explicit rational margins for the remaining coefficient. Put $beta_0 = 0.303 d_m = 0.06363$.
    The bounds just proved imply
  $ frac(0.91 c M, p_2^(3 \/ 2)) > frac(0.91 dot.op 2.7 dot.op 0.2659, 1.09^(3 \/ 2)) > 0.574 . $
  The last inequality follows by squaring positive quantities, since
  $ \( 0.91 dot.op 2.7 dot.op 0.2659 \)^2 - 0.574^2 thin 1.09^3 = 14121304169 / 10^14 > 0 . $
  Also $\( 1 - q_m \) d_m < beta_0$. If $u = b_0$, then $u - beta_0 > 1 - 1 \/ 3.14 - 0.06363 > 0.617$, and
  $ 0.574 \( 0.617 \)^3 = 0.134824054862 > 0.134 . $
  Hence the left side of (6.19) exceeds $0.134 h^3$. If $u = 0.96 \/ h$, then
  $ h \( u - beta_0 \) gt.eq 0.96 - 1.62 beta_0 = 0.8569194 > 0.856 \, wide 0.574 \( 0.856 \)^3 =
    0.360025437184 > 0.36 . $
  Both branches therefore dominate $C_0 \( h \)$, including their common endpoint and the switch in the definition
    of $C_0$. ◻
]

#thm([Proposition 6.7.])[
  (The nesting area bound).  #emph[For the three-vertex configuration at $V = 1 \/ pi$ with $A lt.eq 1$,
$ A - 1 gt.eq B \( h \) wide \( 0.64 lt.eq h lt.eq 2.25 \) . $

 On $1.02 lt.eq h lt.eq 1.62$ define
#[#set math.equation(numbering: n => "(6.22)")
 $ S \( h \) = inf_(y gt.eq 0) {ell y^2 + C_0 \( h \) min { d_m \, \( P - Q y \)_(+) }^(thin 3)} .
   $ <nest:gain-definition>]

 Then
#[#set math.equation(numbering: n => "(6.23)")
 $ A - 1 gt.eq B \( h \) + S \( h \) . $ <nest:area-gain>]

]
] <nest:area-bound>

#proof[
  The first assertion follows from (6.7). For the second, first suppose $delta >
    0$ and restrict to the area interval $\[ u - delta \, u \]$ of Lemma 17. Put $K = c delta^2 H \( q \)$.
    Since $p gt.eq sqrt(1 + K)$ and $G$ is non-increasing,
  $ G \( h v \/ p \) gt.eq G #h(-0.16667em) (frac(h v, sqrt(1 + K))) . $
  On this interval the baseline uses $p_(*) = 1$, and $h v lt.eq h u lt.eq 0.96 < D$.
    Thus the whole squared-argument interval $\[ \( h v \)^2 \/ \( 1 + K \) \, \( h v \)^2 \]$ lies in the
    differentiable branch of $G$. By (6.2) and Lemma 18,
  #[#set math.equation(numbering: n => "(6.24)")
   $ G #h(-0.16667em) (frac(h v, sqrt(1 + K))) - G \( h v \) & gt.eq
     integral_(\( h v \)^2 \/ \( 1 + K \))^(\( h v \)^2) 0.91 sqrt(r) thin d r\
 & gt.eq frac(0.91 \( h v \)^3 K, \( 1 + K \)^(3 \/ 2)) gt.eq
   frac(0.91 \( h v \)^3 c delta^2 H \( q \), p_2^(3 \/ 2)) . $ <nest:pointwise-gain>]
  The second inequality bounds $sqrt(r)$ below by its value at the left endpoint, and the last uses $1 + K lt.eq p_2$.
  Changing variables $v = u - delta + delta q$ supplies a further factor $delta$.
    Jensen’s inequality for the convex function $v^3$ on $v gt.eq 0$, with probability density $H \/ M$, gives
  $ integral_0^1 \( u - delta + delta q \)^3 H \( q \) thin d q & gt.eq
    M #scale(x: 120%, y: 120%)[\(] u - \( 1 - q_m \) delta #scale(x: 120%, y: 120%)[\)]^3\
 & gt.eq M #scale(x: 120%, y: 120%)[\(] u - \( 1 - q_m \) d_m #scale(x: 120%, y: 120%)[\)]^3 . $
  All bases are positive by (6.11). Integrating (6.24) and applying Lemma 19 therefore gives an additional area
    contribution at least $C_0 delta^3$ beyond the baseline. If $delta = 0$,
    that conclusion holds trivially with zero gain; no variable $q$ is then introduced.
  Together with the baseline contribution from $\[ t \, s \]$, this proves
  $ A - 1 gt.eq B \( h \) + ell \( s - t \) + C_0 min { d_m \, \( P - Q sqrt(s - t) \)_(+) }^(thin 3) . $
  Taking the infimum over all $y gt.eq 0$ weakens this inequality and yields (6.23). ◻
]

Lemma 26 in Appendix 9 gives an explicit formula for the scalar infimum $S$.

== 7 Completion of the proof <completion:section>

#proof[
  By Proposition 5, it suffices to exclude nonstandard minimizers at $V_1 \,
    V_2$ in the normalized period-two torus. Proposition 8 leaves the three-vertex and four-vertex patterns.
    Proposition 11 excludes the four-vertex pattern at both volumes,
    and Proposition 12 excludes the three-vertex pattern at $V_1$.
  Suppose the latter pattern occurs at $V_2$. Its occupied-side choice and Proposition 13 give $h
    in \[ .64 \, 2.25 \]$ with $A lt.eq 1$. Proposition 20 gives
  $ A - 1 gt.eq
    cases(delim: "{", B \( h \) + S \( h \) \, & 1.02 lt.eq h lt.eq 1.62 \,, B \( h \) \, & upright("otherwise") .) $
  Proposition 22 makes the right-hand side strictly positive throughout the required interval,
    contradicting $A lt.eq 1$.
  The two-volume reduction and Lemma 3 now give all volumes and all equality cases.
    Returning to the unit torus multiplies normalized area by two and divides lengths by two.
    This yields (1.1) and the radii and widths stated in the theorem. ◻
]

== 8 An elementary estimate for the four-vertex pattern <num:elementary-estimates>

The endpoint flux and projection identities reduce the four-vertex configuration to the following inequality.
  Its variables are scalars; no geometric assumptions beyond their displayed bounds are needed.

#thm([Lemma 8.1.])[
  #emph[Suppose
$ 0 < d lt.eq 1 / sqrt(3) \, wide 0 lt.eq x lt.eq sqrt(pi) \, wide 0 lt.eq tau < 1 \,\
tau + x / pi \( 1 - tau^2 \) = 1 - d^2 . $

 Then
$ d + frac(tau^2 + \( tau + x d \)^2, pi) < 1 . $

]
] <num:four-vertex-scalar>

#proof[
  Write $R \( tau \, d \)$ for the expression to be bounded, with $x = pi \( 1 - tau - d^2 \) \/ \( 1 - tau^2 \)$.
    In particular $tau lt.eq 1 - d^2$. Let $f \( q \) = q + x \( 1 - q^2 \) \/ pi$.
    Suppose for contradiction that $R \( tau \, d \) gt.eq 1$.
    All terminating decimals below denote exact rational numbers;
    the elementary bounds $157 \/ 50 < pi < 22 \/ 7$ suffice.
  First, $tau > 1 \/ 10$. Otherwise the increasing function $q + \( 1 - q^2 \) \/
    sqrt(pi)$ on $\[ 0 \, 1 \/ 10 \]$ would give
  $ 2 / 3 lt.eq f \( tau \) lt.eq 1 / 10 + frac(99, 100 sqrt(pi)) < 2 / 3 . $
  For the last inequality, square the positive terms and use $\( 99 \/ 100 \)^2 \/ \( 157 \/ 50 \) < \( 17 \/ 30 \)^2$.
  #emph[The range $1 \/ 10 < tau lt.eq 3 \/ 10$.] Hold $tau$ fixed and increase $d$ to $1 \/ sqrt(3)$,
    redefining $x$ by the formula above. Along this comparison $x$ decreases and remains nonnegative, because $1 -
    tau - d^2 gt.eq 1 - 3 \/ 10 - 1 \/ 3 > 0$. Thus $x lt.eq sqrt(pi)$ remains valid. Direct differentiation gives
  $ frac(partial R, partial d) = 1 + frac(2 \( tau + x d \) \( 1 - tau - 3 d^2 \), 1 - tau^2) . $
  If the numerator’s last factor is nonnegative this derivative is at least one.
    Otherwise use $1 - tau - 3 d^2 gt.eq - tau$, $1 - tau^2 gt.eq 91 \/ 100$, and
  $ tau + x d lt.eq 3 / 10 + sqrt(pi / 3) < 3 / 10 + 41 / 40 = 53 / 40 $
  to obtain
  $ frac(partial R, partial d) > 1 - frac(2 \( 3 \/ 10 \) \( 53 \/ 40 \), 91 \/ 100) = 23 / 182 > 0 . $
  It remains to bound $R \( tau \, 1 \/ sqrt(3) \)$. Set
  $ J \( tau \) = tau + frac(pi \( 2 \/ 3 - tau \), sqrt(3) \( 1 - tau^2 \)) . $
  On $0 lt.eq tau lt.eq 3 \/ 10$,
  $ & 1 + tau^2 - 4 / 3 tau - 4 / 5 \( 1 - tau^2 \)^2\
 & #h(1cm)  = 1 / 5 - 4 / 3 tau + 13 / 5 tau^2 - 4 / 5 tau^4 gt.eq 1 / 5 - 4 / 3 tau + 316 / 125 tau^2 > 0 . $
  The last quadratic has positive leading coefficient and discriminant $- 1376 \/ 5625$. Hence
  $ J' \( tau \) = 1 - pi / sqrt(3) frac(1 + tau^2 - 4 tau \/ 3, \( 1 - tau^2 \)^2) < 1 - 4 / 5 9 / 5 = - 11 / 25 \, $
  where $pi \/ sqrt(3) > 9 \/ 5$ follows by squaring. Also
  $ J \( 3 \/ 10 \) = 3 / 10 + frac(110 pi, 273 sqrt(3)) > 3 / 10 + 66 / 91 > 1 . $
  Thus $J > 1$ throughout this range and $\( J^2 + tau^2 \)' < - 22 \/ 25 + 3 \/ 5 < 0$.
    For an exact endpoint bound, use $1 \/ sqrt(3) < 26 \/ 45$ to get
  $ J \( 1 \/ 10 \) < 1 / 10 + 22 / 7 26 / 45 170 / 297 = 19381 / 17010 < 57 / 50 . $
  It follows that
  $ R \( tau \, d \) lt.eq R \( 1 \/ 10 \, 1 \/ sqrt(3) \) < 26 / 45 +
    frac(1 \/ 100 + \( 57 \/ 50 \)^2, 157 \/ 50) = 35143 / 35325 < 1 . $
  #emph[The range $3 \/ 10 lt.eq tau < 1$.] Put $U = sqrt(1 - tau)$ and $Z = d \/ U$.
    The inequality $d^2 lt.eq 1 - tau$ gives $0 lt.eq Z lt.eq 1$, while $0 < U lt.eq sqrt(7 \/ 10)$.
    The formula for $x$ becomes $x = pi \( 1 - Z^2 \) \/ \( 1 + tau \)$,
    and the contradictory assumption $R \( tau \, d \) gt.eq 1$ becomes
  #[#set math.equation(numbering: n => "(8.1)")
   $ frac(1 - 2 tau^2 \/ pi, sqrt(1 - tau)) lt.eq Z + frac(2 tau, 1 + tau) Z \( 1 - Z^2 \) +
     frac(pi U, \( 1 + tau \)^2) Z^2 \( 1 - Z^2 \)^2 . $ <slice:four-rescaled>]
  The derivative of the left side is
  $ frac(1 \/ 2 + \( 3 tau^2 - 4 tau \) \/ pi, \( 1 - tau \)^(3 \/ 2)) > 0 \, $
  because $3 tau^2 - 4 tau gt.eq - 4 \/ 3$ and $pi > 8 \/ 3$.
    Using $sqrt(7 \/ 10) < 837 \/ 1000$, its value at $3 \/ 10$ exceeds
  $ 148000 / 131409 > 9 / 8 = 1.125 . $
  To bound the right side, put $c_(*) = 2 pi \/ \( 3 sqrt(3) \)$. We claim that
  #[#set math.equation(numbering: n => "(8.2)")
   $ frac(2 tau, 1 + tau) + frac(2 pi U, 3 sqrt(3) \( 1 + tau \)^2) < 111 / 100 . $ <slice:four-coefficient>]
  Multiplication by $\( 1 + tau \)^2 = \( 2 - U^2 \)^2$ shows that this is equivalent to positivity of
  $ 11 / 25 - c_(*) U + 39 / 25 U^2 - 89 / 100 U^4 gt.eq 11 / 25 - c_(*) U + 937 / 1000 U^2 . $
  The last quadratic is positive for every real $U$: its leading coefficient is positive and its discriminant satisfies
  $ c_(*)^2 - 4 11 / 25 937 / 1000 < 1936 / 1323 - 10307 / 6250 = - 1536161 / 8268750 < 0 . $
  This proves (8.2). Since $0 lt.eq Z \( 1 - Z^2 \) lt.eq 2 \/ \( 3 sqrt(3) \)$, the right side of (8.1) is at most
  $ Z + 111 / 100 Z \( 1 - Z^2 \) . $
  Its maximum on $\[ 0 \, 1 \]$ is
  $ 211 / 150 sqrt(211 / 333) < 9 / 8 \, $
  as follows by squaring from
  $ 81 / 64 - 9393931 / 7492500 = 1420229 / 119880000 > 0 . $
  This contradicts (8.1) and completes both ranges. The case $x = 0$ was included:
    then $tau = 1 - d^2 in \[ 2 \/ 3 \, 1 \)$, in the second range. ◻
]

== 9 Certification of the scalar inequalities <num:section>

We retain the definitions of $G$, $B$, and $S$ in (6.1), (6.6), and (6.22).
  All terminating decimals in this appendix denote exact rational numbers.
  In particular, the tabulated bounds below are rational inequalities.

#thm([Proposition 9.1.])[
  #emph[The following strict inequalities hold:
$ B \( h \) & > 0 &  & upright("for ") h in \[ .64 \, 1.02 \] union \[ 1.62 \, 2.25 \] \,\
B \( h \) + S \( h \) & > 0 &  & upright("for ") h in \[ 1.02 \, 1.62 \] . $

]
] <num:scalar-positive>

Finite knot bounds imply positivity on the whole curvature interval through upper second derivative bounds that
  also control changes of formula. The proof has three parts:
  a useful integral representation, those derivative bounds, and finite rational certificates for interpolation.

=== 9.1 Layer cake and the baseline curvature bound <layer-cake-and-the-baseline-curvature-bound>

Let $rho$ be the inverse of the increasing function $r mapsto r \/ sqrt(pi \( 1 - r \))$ on $\[ 0 \, 1 \)$.
  Explicitly, with $sigma = pi \/ 4$,

#[#set math.equation(numbering: n => "(9.1)")
 $ rho \( k \) = sqrt(pi) thin k sqrt(1 + sigma k^2) - pi / 2 k^2 \, wide k gt.eq 0 . $ <num:rho>]

Thus $t = rho \( 1 \/ h \)$. On $\[ 0 \, D \]$ put $W \( X \) = - G' \( X \)$. From

#[#set math.equation(numbering: n => "(9.2)")
 $ G \( X \) = lambda sqrt(1 - X^2) + frac(1 - lambda, sqrt(1 - X^2)) \, wide W \( X \) =
   frac(X \( .96 - .98 X^2 \), \( 1 - X^2 \)^(3 \/ 2)) \, $ <num:weight-density>]

we have $W gt.eq 0$ and $integral_0^D W = 1 - ell = .72$.

#thm([Lemma 9.2.])[
  #emph[For $.64 lt.eq h lt.eq 2.25$,
#[#set math.equation(numbering: n => "(9.3)")
 $ B \( h \) + 1 = frac(lambda h, pi) + ell t + integral_0^D W \( X \) min {pi \( X \/ h \)^2 \, med X \/ h \, med
   rho \( X \/ h \)} thin d X . $ <num:layer-cake-formula>]

 On an interval $\[ a \, b \] subset \[ .64 \, 2.25 \]$, the function $B \( h \) - h^2 \/ a^2$ is concave.]
] <num:layer-cake>

#proof[
  The reciprocal of the planar profile gives the increasing function
  $ q_h \( v \) := frac(h v, p_(*) \( v \)) = max {h sqrt(v \/ pi) \, med h v \, frac(h v, sqrt(pi \( 1 - v \)))} . $
  For $0 lt.eq X lt.eq D < 1$, its sublevel set in $\[ 0 \, t \]$ has length
  $ min { pi \( X \/ h \)^2 \, X \/ h \, rho \( X \/ h \) } . $
  Indeed these are the three separate sublevel restrictions; the additional restriction $v lt.eq
    t$ is redundant since $rho \( X \/ h \) < rho \( 1 \/ h \) = t$.
    As a function of $k = X \/ h$, the selected branches are $pi k^2$ for $k lt.eq a_0$, $k$ for $a_0 lt.eq
    k lt.eq b_0$, and $rho \( k \)$ for $k gt.eq b_0$. This is also obtained by inverting the three successive
    pieces of $p_(*)$. The identity
  $ G \( q \) = ell + integral_0^D W \( X \) upright(bold(1))_({ q lt.eq X }) thin d X wide \( q gt.eq 0 \) $
  and Tonelli’s theorem now prove (9.3).
  The function inverted to obtain $rho$ has positive first and second derivatives.
    Hence $rho$ is increasing and concave, with $rho \( 0 \) = 0$, and $k rho' \( k \) lt.eq rho \( k \) lt.eq 1$.
    Consequently
  $ frac(d^2, d h^2) rho \( X \/ h \) = frac(k^2 rho'' \( k \) + 2 k rho' \( k \), h^2) lt.eq 2 / h^2 . $
  The same bound holds for $t = rho \( 1 \/ h \)$. On the #emph[selected] quadratic piece, $k lt.eq a_0$, so
  $ frac(d^2, d h^2) \( pi k^2 \) = frac(6 pi k^2, h^2) lt.eq frac(6, pi h^2) < 2 / h^2 . $
  On the selected linear piece the second derivative is $2 k \/ h^2 < 2 \/ h^2$, since $k lt.eq b_0 < 1$.
  These bounds concern only the pieces that are actually selected.
    For each fixed $X > 0$, as $h$ increases they occur in the order $rho \( X \/ h \)$, $X \/ h$,
    $pi \( X \/ h \)^2$. At the first change, $rho' \( b_0 \) = 2 \/ \( pi + 1 \) < 1$,
    so the first derivative decreases. At the second it changes from $- a_0 \/ h$ to $- 2 a_0 \/ h$,
    again decreasing. There is thus no positive atom in the distributional second derivative.
    The case $X = 0$ is the constant zero function. Each integrand, and also $t$,
    becomes concave on $\[ a \, b \]$ after subtracting $h^2 \/ a^2$.
    Their nonnegative weights in (9.3) sum to $ell + .72 = 1$. The remaining term is affine, proving the assertion. ◻
]

=== 9.2 The upper second derivative bound for the gain <the-upper-second-derivative-bound-for-the-gain>

We say that a function has upper second derivative bound $K$ on an interval if subtracting $K h^2 \/
  2$ makes it concave there. This convention includes changes of formula and does not require twice differentiability.

#thm([Lemma 9.3.])[
  #emph[The function $S$ has upper second derivative bound $.4$ on $\[ 1.02 \, 1.62 \]$.]
] <num:s-second>

#proof[
  Fix $y gt.eq 0$, and write
  $ F_y \( h \) = ell y^2 + C_0 \( h \) f \( w \( h \) \) \, wide f \( w \) = min { d_m \, w_(+) }^3 \, quad w =
    u - 1 + R - Q y \, quad R = 2 h t \/ pi . $
  Then $S = inf_(y gt.eq 0) F_y$. Differentiation of $h^2 t^2 = pi \( 1 - t \)$ gives
  #[#set math.equation(numbering: n => "(9.4)")
   $ R' = frac(2 t^2, pi \( 2 - t \)) \, quad R'' lt.eq 0 \, wide Q = 2 / sqrt(pi) \( 1 + 4 h^2 \/ pi \)^(1 \/ 4) \,\
Q' / Q = frac(2 h, pi + 4 h^2) \, wide Q'' / Q = frac(2 pi - 4 h^2, \( pi + 4 h^2 \)^2) . $ <num:r-q-derivatives>]
  In particular, $0 < Q' \/ Q lt.eq 1 \/ \( 2 h \)$ and $Q'' \/ Q gt.eq - 1 \/ \( 4 h^2 \)$.
  Here are rational bounds sufficient for the argument. The inequalities $3.14 < pi < 22 \/
    7$ and the equation for $t$ imply
  $ .64 < t < .8 \, wide t \( 1.62 \) < .65 . $
  For example these follow by substituting the proposed endpoints into $h^2 t^2 - pi \( 1 - t \)$,
    which is strictly increasing in $t$. Since $t$ decreases and $R$ increases, they yield
  $ .19 < 1792 / 9350 < R' < 160 / 471 < .34 \, wide R lt.eq R \( 1.62 \) < 1053 / 1570 < .671 . $
  On a piece where $0 < w < d_m$, it follows that
  $ 0 lt.eq Q y < P lt.eq b_0 - 1 + R < .36 . $
  The switch in $u = min { b_0 \, .96 \/ h }$ occurs at $h_c = .96 \/ b_0 > 1.4$. On its constant piece,
  $ w' > .19 - frac(.36, 2 \( 1.02 \)) > 0 \, wide w'' lt.eq frac(.36, 4 \( 1.02 \)^2) < .8 . $
  On its reciprocal piece,
  $ w' > - .96 / 1.4^2 + .19 - frac(.36, 2 \( 1.4 \)) > - .50 \, wide w'' lt.eq 1.92 / 1.4^3 +
    frac(.36, 4 \( 1.4 \)^2) < .8 . $
  On both pieces $w' lt.eq R' < .34$. Also, on every smooth piece,
  $ 0 < C_0 lt.eq .36 \, wide 0 lt.eq C'_0 lt.eq 1.08 \, wide 0 lt.eq C''_0 lt.eq 2.16 \; $
  these follow directly from $C_0 = min { .134 h^3 \, .36 }$ and $h lt.eq 1.62$.
    Thus on an active cubic piece the product rule gives
  $ \( C_0 w^3 \)'' & = C''_0 w^3 + 6 C'_0 w^2 w' + 6 C_0 w \( w' \)^2 + 3 C_0 w^2 w''\
 & lt.eq 2.16 d_m^3 + 6 \( 1.08 \) d_m^2 \( .34 \) + 6 \( .36 \) d_m \( .50 \)^2 + 3 \( .36 \) d_m^2 \( .8 \)\
 & = .26866728 < .4 . $
  On $w < 0$ the added term is zero; on $w > d_m$ its second derivative is at most $2.16 d_m^3 < .4$.
  For completeness, all possible simultaneous changes of formula preserve this bound.
    The only jumps in $w'$ and $C'_0$ are nonpositive, coming respectively from the minima defining $u$ and $C_0$.
    At a point with $0 < w < d_m$ the jump in $F'_y$ is
  $ w^3 Delta C'_0 + 3 C_0 w^2 Delta w' lt.eq 0 . $
  At $w = 0$, both $f$ and its derivative vanish, so the derivatives match even at a simultaneous switch.
    At $w = d_m$, the one-sided derivatives of $f \( w \( h \) \)$ are
  $ 3 d_m^2 max { w'_(-) \, 0 } quad upright("from the left") \, wide 3 d_m^2 min { w'_(+) \, 0 } quad
    upright("from the right") . $
  Their difference is nonpositive; a simultaneous switch of $C_0$ adds $d_m^3 Delta C'_0 lt.eq 0$.
    These formulas include tangencies. On a capped piece only the nonpositive jump of $C'_0$ remains.
    For fixed $y$ these functions are algebraic on each branch,
    so the threshold points are finite unless a threshold holds identically on a piece;
    an identical threshold has the matching derivatives just described.
    It follows that $F_y - .2 h^2$ is concave on the full interval. Finally,
  $ S \( h \) - .2 h^2 = inf_(y gt.eq 0) #scale(x: 120%, y: 120%)[\(] F_y \( h \) - .2 h^2
    #scale(x: 120%, y: 120%)[\)] $
  is concave: the pointwise infimum of concave functions is concave,
    as is seen either from its defining inequality or its hypograph.
    The infimum is finite, since $F_y gt.eq 0$ and $F_0 lt.eq C_0 d_m^3$.
    This also handles changes of the minimizing value of $y$. ◻
]

=== 9.3 Reduction of the knot values to arithmetic <reduction-of-the-knot-values-to-arithmetic>

Only the factor $rho \( X \/ h \)$ in (9.3) will require polynomial approximation.
  Set $L = \( D \/ h - b_0 \)_(+)$. If $L > 0$, replace $rho$ on $\[ b_0 \, D \/ h \]$ by its cubic Taylor
  polynomial about $k_(*) = \( b_0 + D \/ h \) \/ 2$, without changing either branch endpoint.
  Denote the resulting value of $B$ by $tilde(B)$. If $L = 0$, put $tilde(B) = B$.

#thm([Lemma 9.4.])[
  #emph[For $.64 lt.eq h lt.eq 2.25$,
#[#set math.equation(numbering: n => "(9.5)")
 $ B \( h \) gt.eq tilde(B) \( h \) - .008 \( D \/ h - b_0 \)_(+)^4 . $ <num:taylor-bound>]

]
] <num:taylor-error>

#proof[
  Differentiating (9.1) gives
  $ rho''' \( k \) = frac(3 sqrt(pi) thin sigma, \( 1 + sigma k^2 \)^(5 \/ 2)) \, wide rho'''' \( k \) = -
    frac(15 sqrt(pi) thin sigma^2 k, \( 1 + sigma k^2 \)^(7 \/ 2)) . $
  The magnitude of the latter expression decreases when $6 sigma k^2 gt.eq 1$, in particular for $k gt.eq b_0$.
    Since $.68 < b_0 < .69$ and $3.14 < pi < 22 \/ 7$,
  $ \| rho'''' \( b_0 \) \| <
    frac(15 sqrt(22 \/ 7) \( 11 \/ 14 \)^2 \( .69 \), \( 1 + \( 3.14 \/ 4 \) \( .68 \)^2 \)^(7 \/ 2)) < 4 . $
  The final inequality follows by squaring positive quantities and cross-multiplying rational numbers.
    The midpoint Taylor remainder is therefore at most $4 \( L \/ 2 \)^4 \/ 24$ in absolute value.
    Multiplying by the total weight $.72$ bounds its contribution to the integral by $.0075 L^4 lt.eq .008 L^4$. ◻
]

Here are explicit moment formulas to evaluate $tilde(B)$. For $0 lt.eq z lt.eq D$, define

$ L_n \( z \) = integral_0^z X^n / sqrt(1 - X^2) thin d X \, wide J_j \( z \) = integral_0^z X^j W \( X \) thin d X . $

Writing $beta_z = sqrt(1 - z^2)$, integration by parts gives

#[#set math.equation(numbering: n => "(9.6)")
 $ L_0 \( z \) = arcsin z \, wide L_1 \( z \) = 1 - beta_z \,\
L_n \( z \) = frac(\( n - 1 \) L_(n - 2) \( z \) - z^(n - 1) beta_z, n) wide \( n gt.eq 2 \) . $ <num:moments-l>]

#[#set math.equation(numbering: n => "(9.7)")
 $ J_j \( z \) = lambda L_(j + 1) \( z \) - \( 1 - lambda \)
   (z^j / beta_z - upright(bold(1))_({ j = 0 }) - j L_(j - 1) \( z \)) \, $ <num:moments-j>]

where the term $j L_(j - 1)$ is omitted for $j = 0$. Only $0 lt.eq j lt.eq 3$ and $0 lt.eq n lt.eq 4$ are needed.
  To check (9.7), use (9.2) and differentiate $X^j \/ sqrt(1 - X^2)$; the indicator is its boundary term at zero.

Put $x = h a_0$ and $y = min { D \, h b_0 }$. Throughout the stated range, $0 < x lt.eq y lt.eq D$ and $x < D$.
  If the Taylor polynomial is $sum_(j = 0)^3 c_j k^j$, the evaluation formula is

#[#set math.equation(numbering: n => "(9.8)")
 $ tilde(B) = frac(lambda h, pi) + ell t - 1 + pi / h^2 J_2 \( x \) + frac(J_1 \( y \) - J_1 \( x \), h) +
   sum_(j = 0)^3 c_j / h^j #scale(x: 120%, y: 120%)[\(] J_j \( D \) -
   J_j \( y \) #scale(x: 120%, y: 120%)[\)] . $ <num:evaluation-b>]

The sum is omitted when $y = D$. Otherwise, put $r_j = rho^(\( j \)) \( k_(*) \) \/ j !$. Explicitly,

$ r_0 & = sqrt(pi) thin k_(*) sqrt(1 + sigma k_(*)^2) - pi k_(*)^2 \/ 2 \,\
r_1 & = frac(sqrt(pi) \( 1 + 2 sigma k_(*)^2 \), sqrt(1 + sigma k_(*)^2)) - pi k_(*) \,\
r_2 & = 1 /
  2 (frac(sqrt(pi) thin sigma k_(*) \( 3 + 2 sigma k_(*)^2 \), \( 1 + sigma k_(*)^2 \)^(3 \/ 2)) - pi) \, &
  r_3 & = frac(sqrt(pi) thin sigma, 2 \( 1 + sigma k_(*)^2 \)^(5 \/ 2)) \,\
c_0 & = r_0 - k_(*) r_1 + k_(*)^2 r_2 - k_(*)^3 r_3 \, & c_1 & = r_1 - 2 k_(*) r_2 + 3 k_(*)^2 r_3 \,\
c_2 & = r_2 - 3 k_(*) r_3 \, & c_3 & = r_3 . $

The gain $S$ also has an evaluation formula using only arithmetic and square roots.

#thm([Lemma 9.5.])[
  (Evaluation of the capped gain).  #emph[On $1.02 lt.eq h lt.eq 1.62$, $P \, Q \, C_0$ are positive. With
#[#set math.equation(numbering: n => "(9.9)")
 $ q_(*) = frac(2 P, 1 + sqrt(1 + 6 C_0 Q^2 P \/ ell)) \, $ <nest:s-critical-point>]

 one has, including every cap and zero case,
#[#set math.equation(numbering: n => "(9.10)")
 $ S \( h \) = min {C_0 d_m^3 \, ell (frac(P - q_(*), Q))^2 + C_0 q_(*)^3} . $ <nest:s-explicit>]

]
] <nest:s-formula>

#proof[
  Positivity of $Q \, C_0$ is immediate. To see that $P > 0$ uniformly, note that $t \( h \)$ decreases,
    so $h t \( h \) = sqrt(pi \( 1 - t \( h \) \))$ increases.
    At $h = 1$ the equation for $t$ gives $t \( 1 \) > 3 \/ 4$, since $9 \/ 16 - pi \/ 4 < 0$.
    Using $h gt.eq 1$, $u gt.eq 16 \/ 27$, and $pi < 22 \/ 7$, we get
  $ P > 16 / 27 - 1 + 21 / 44 = 83 / 1188 > 0 . $
  For a fixed $h$, write $w = P - Q y$, so $w lt.eq P$. Define the uncapped polynomial objective on $\[ 0 \, P \]$ by
  $ F \( w \) = frac(ell \( P - w \)^2, Q^2) + C_0 w^3 . $
  It agrees with the original objective on the feasible uncapped interval $\[ 0 \, min { P \, d_m } \]$.
    The polynomial is strictly convex on $\[ 0 \, P \]$, with $F' \( 0 \) < 0 < F' \( P \)$,
    and its unique critical point lies in $\( 0 \, P \)$. Solving $3 C_0 Q^2 w^2 =
    2 ell \( P - w \)$ gives exactly $w = q_(*)$ in (9.9).
  The branch $w lt.eq 0$ has minimum $ell P^2 \/ Q^2 = F \( 0 \)$, which is greater than $F \( q_(*) \)$.
    If $P gt.eq d_m$, the capped branch $d_m lt.eq w lt.eq P$ has minimum $C_0 d_m^3$, attained at $w = P$.
    When $q_(*) lt.eq d_m$ both candidates in (9.10) are consequently sufficient.
    When $q_(*) > d_m$, the minimum of $F$ on $\[ 0 \, d_m \]$ is $F \( d_m \)$, which is at least $C_0 d_m^3$;
    moreover $F \( q_(*) \) gt.eq C_0 q_(*)^3 > C_0 d_m^3$. Thus the capped value still wins in the displayed
    formula even though $q_(*)$ is infeasible. Finally, if $P < d_m$, the cap is never reached,
    but its displayed value is greater than $C_0 P^3 = F \( P \) gt.eq
    F \( q_(*) \)$ and hence cannot alter the minimum. The equalities $P = d_m$ and $q_(*) =
    d_m$ are included in these comparisons. This proves the formula in all cases. ◻
]

=== 9.4 An explicit outward arithmetic prescription <num:arithmetic>

We specify the arithmetic behind the table so that each entry can be verified with integer operations.
  The input enclosure for $pi$ is

#[#set math.equation(numbering: n => "(9.11)")
 $ pi_(-) := 3.14159265358979 < pi < 3.14159265358980 = : pi_(+) . $ <num:pi-interval>]

Here is a rational verification of that enclosure. Set

$ A_N \( z \) = sum_(j = 0)^N frac(\( - 1 \)^j z^(2 j + 1), 2 j + 1) \, wide e_N \( z \) =
  frac(z^(2 N + 3), 2 N + 3) . $

For odd $N$ and $0 < z < 1$, the alternating series gives $A_N \( z \) < arctan z < A_N \( z \) + e_N \( z \)$.
  Machin’s identity $pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$ follows by the tangent addition
  formula, with the angle in $\( 0 \, pi \/ 2 \)$. Thus the following entirely rational comparisons prove (9.11):

$ pi_(-) & < 16 A_31 \( 1 \/ 5 \) - 4 #scale(x: 120%, y: 120%)[\(] A_9 \( 1 \/ 239 \) +
  e_9 \( 1 \/ 239 \) #scale(x: 120%, y: 120%)[\)] \,\
16 #scale(x: 120%, y: 120%)[\(] A_31 \( 1 \/ 5 \) + e_31 \( 1 \/ 5 \) #scale(x: 120%, y: 120%)[\)] -
  4 A_9 \( 1 \/ 239 \) & < pi_(+) . $

The arcsine in (9.6) can likewise be enclosed without a transcendental evaluation. Define

$ m \( z \) = z / sqrt(2 + 2 sqrt(1 - z^2)) \, wide j_z = m \( m \( z \) \) \, wide T \( j \) =
  sum_(n = 0)^10 frac(binom(2 n, n), 4^n \( 2 n + 1 \)) j^(2 n + 1) . $

Twice applying the half-angle identity gives $arcsin z = 4 arcsin j_z$.
  The function $m$ is increasing on $\[ 0 \, D \]$, and $j_D^2 = \( 1 - 2 \/ sqrt(7) \) \/ 2 < 1 \/ 8 < .36^2$,
  so $j_z < .36$. The positive arcsine-series coefficients are at most one. Hence

#[#set math.equation(numbering: n => "(9.12)")
 $ 4 T \( j_z \) lt.eq arcsin z lt.eq 4 T \( j_z \) + frac(4 j_z^23, 1 - j_z^2) . $ <num:arcsine-enclosure>]

For a precise common rounding rule, take $N = 10^40$ and represent an interval by integer endpoints
  $\[ a \, b \]_N = \[ a \/ N \, b \/ N \]$. Enclose each rational input $r$ by
  $\[ floor.l N r floor.r \, ceil.l N r ceil.r \]_N$. Addition and negation are exact at this scale.
  For multiplication use

$ \[ a \, b \]_N \[ c \, d \]_N subset.eq
  [⌊frac(min { a c \, a d \, b c \, b d }, N)⌋ \, ⌈frac(max { a c \, a d \, b c \, b d }, N)⌉]_N . $

For $0 < a lt.eq b$, reciprocal is enclosed by $\[ floor.l N^2 \/ b floor.r \, ceil.l N^2 \/ a ceil.r \]_N$;
  negative intervals are treated by negation. Division is multiplication by this reciprocal.
  For $0 lt.eq a lt.eq b$, square root is enclosed by

$ \[ floor.l sqrt(a N) floor.r \, ceil.l sqrt(b N) ceil.r \]_N \, $

whose endpoints are found by integer-square comparisons. The zeroth power is $\[ N \, N \]_N$.
  An odd nonnegative integer power takes its extrema at the endpoints;
  an even positive power has lower endpoint zero if the interval contains zero,
  and otherwise the smaller endpoint power. Divide those integer powers by $N^(n - 1)$ and round outward.
  For minimum and maximum, apply the same operation separately to the two lower and the two upper endpoints.
  Each rule encloses every possible value of its operation, also when its inputs are dependent.
  Induction therefore proves the enclosure property for any expression formed by these rules.

Apply these rules to (9.8) in the following order: $pi$, $a_0 \, b_0 \, D \, t \, x \, y$;
  then $j_z$ and (9.12) for $z = x \, y \, D$; then the recurrences (9.6)–(9.7); then $k_(*) \, r_j \,
  c_j$ if $h b_0 < D$; and finally (9.8). Integer powers are evaluated by the endpoint rule just given,
  and half-integer powers as integer powers times a square root.
  Evaluate (9.10) from $t \, u \, P \, Q \, C_0 \, q_(*)$ in that order, enclosing minima coordinatewise.
  No tabulated knot is a branch tie $h b_0 = D$, so that branch choice is determined by disjoint intervals.
  In (9.12) retain the lower endpoint of $4 T$ and the upper endpoint of $4 T + 4 j_z^23 \/ \( 1 - j_z^2 \)$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$h$
], table.cell(rowspan: 1, colspan: 1)[$b_h$
], table.cell(rowspan: 1, colspan: 1)[$s_h$
], table.cell(rowspan: 1, colspan: 1)[$h$
], table.cell(rowspan: 1, colspan: 1)[$b_h$
], table.cell(rowspan: 1, colspan: 1)[$s_h$
]),
  table.cell(rowspan: 1, colspan: 1)[.64
], table.cell(rowspan: 1, colspan: 1)[1744
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[1.30
], table.cell(rowspan: 1, colspan: 1)[-196
], table.cell(rowspan: 1, colspan: 1)[271
],
  table.cell(rowspan: 1, colspan: 1)[.74
], table.cell(rowspan: 1, colspan: 1)[1200
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[1.34
], table.cell(rowspan: 1, colspan: 1)[-211
], table.cell(rowspan: 1, colspan: 1)[297
],
  table.cell(rowspan: 1, colspan: 1)[.84
], table.cell(rowspan: 1, colspan: 1)[735
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[1.38
], table.cell(rowspan: 1, colspan: 1)[-226
], table.cell(rowspan: 1, colspan: 1)[325
],
  table.cell(rowspan: 1, colspan: 1)[.92
], table.cell(rowspan: 1, colspan: 1)[432
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[1.42
], table.cell(rowspan: 1, colspan: 1)[-247
], table.cell(rowspan: 1, colspan: 1)[332
],
  table.cell(rowspan: 1, colspan: 1)[.98
], table.cell(rowspan: 1, colspan: 1)[247
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[1.46
], table.cell(rowspan: 1, colspan: 1)[-275
], table.cell(rowspan: 1, colspan: 1)[332
],
  table.cell(rowspan: 1, colspan: 1)[1.02
], table.cell(rowspan: 1, colspan: 1)[144
], table.cell(rowspan: 1, colspan: 1)[76
], table.cell(rowspan: 1, colspan: 1)[1.50
], table.cell(rowspan: 1, colspan: 1)[-260
], table.cell(rowspan: 1, colspan: 1)[318
],
  table.cell(rowspan: 1, colspan: 1)[1.06
], table.cell(rowspan: 1, colspan: 1)[57
], table.cell(rowspan: 1, colspan: 1)[98
], table.cell(rowspan: 1, colspan: 1)[1.54
], table.cell(rowspan: 1, colspan: 1)[-193
], table.cell(rowspan: 1, colspan: 1)[293
],
  table.cell(rowspan: 1, colspan: 1)[1.10
], table.cell(rowspan: 1, colspan: 1)[-15
], table.cell(rowspan: 1, colspan: 1)[123
], table.cell(rowspan: 1, colspan: 1)[1.58
], table.cell(rowspan: 1, colspan: 1)[-76
], table.cell(rowspan: 1, colspan: 1)[271
],
  table.cell(rowspan: 1, colspan: 1)[1.14
], table.cell(rowspan: 1, colspan: 1)[-74
], table.cell(rowspan: 1, colspan: 1)[151
], table.cell(rowspan: 1, colspan: 1)[1.62
], table.cell(rowspan: 1, colspan: 1)[86
], table.cell(rowspan: 1, colspan: 1)[251
],
  table.cell(rowspan: 1, colspan: 1)[1.18
], table.cell(rowspan: 1, colspan: 1)[-119
], table.cell(rowspan: 1, colspan: 1)[182
], table.cell(rowspan: 1, colspan: 1)[1.70
], table.cell(rowspan: 1, colspan: 1)[536
], table.cell(rowspan: 1, colspan: 1)[–
],
  table.cell(rowspan: 1, colspan: 1)[1.22
], table.cell(rowspan: 1, colspan: 1)[-153
], table.cell(rowspan: 1, colspan: 1)[215
], table.cell(rowspan: 1, colspan: 1)[1.90
], table.cell(rowspan: 1, colspan: 1)[2275
], table.cell(rowspan: 1, colspan: 1)[–
],
  table.cell(rowspan: 1, colspan: 1)[1.26
], table.cell(rowspan: 1, colspan: 1)[-178
], table.cell(rowspan: 1, colspan: 1)[247
], table.cell(rowspan: 1, colspan: 1)[2.25
], table.cell(rowspan: 1, colspan: 1)[6853
], table.cell(rowspan: 1, colspan: 1)[–
],
)
]],
  caption: [Table 1: Rational lower bounds: $10^5 tilde(B) \( h \) > b_h$ and $10^5 S \( h \) > s_h$. A dash means that $S$ is not used. ],
)

Substitution by this prescription gives Table 1. For additional checkable rounding slack, the resulting enclosures obey

#[#set math.equation(numbering: n => "(9.13)")
 $ 1.10 & < 10^5 tilde(B) \( h \) - b_h < 1.95 &  & upright("at all 24 knots") \,\
1.00 & < 10^5 S \( h \) - s_h < 1.66 &  & upright("at all 16 applicable knots") . $ <num:table-slack>]

These inequalities include the arcsine-series tail and every arithmetic rounding.
  They are deliberately coarser than the enclosures. For example at the particularly small combined value $h =
  1.46$ they give, more explicitly,

$ - 273.170 < 10^5 tilde(B) \( 1.46 \) < - 273.169 \, wide 10^5 S \( 1.46 \) = 333.396 . $

The latter equality follows from the cap term in (9.10); here the Taylor error is zero.

=== 9.5 Certification between every pair of knots <certification-between-every-pair-of-knots>

If $f$ has upper second derivative bound $K$ on $\[ a \, b \]$, concavity of $f - K h^2 \/ 2$ implies

#[#set math.equation(numbering: n => "(9.14)")
 $ f \( h \) gt.eq frac(b - h, b - a) f \( a \) + frac(h - a, b - a) f \( b \) - K /
   2 \( h - a \) \( b - h \) gt.eq min { f \( a \) \, f \( b \) } - frac(K \( b - a \)^2, 8) . $ <num:chord>]

By Lemmas 23 and 24, use $K = 2 \/ a^2$ for an exterior interval and $K = 2.4$ for an interior interval:
  indeed $2 \/ \( 1.02 \)^2 + .4 < 2.4$.

To make the final comparisons rational as well, set

$ D_(+) = .989743318611 \, wide b_(-) = 1 - 1 \/ pi_(-) \, wide E \( h \) = .008 max { D_(+) \/ h - b_(-) \, 0 }^4 . $

The integer comparison $49 D_(+)^2 > 48$ shows $D < D_(+)$,
  so $E \( h \)$ is an upper bound for the error in (9.5). List the 24 knots of Table 1 in increasing order.
  For consecutive knots $a \, b$ set $chi = 1$ if $\[ a \, b \] subset \[ 1.02 \, 1.62 \]$, and $chi =
  0$ otherwise. Then a rational uniform lower bound from (9.14) is

#[#set math.equation(numbering: n => "(9.15)")
 $ M_(a \, b) = min_(h in { a \, b }) {frac(b_h + chi s_h, 10^5) - E \( h \)} - frac(K \( b - a \)^2, 8) \, wide
   K = cases(delim: "{", 2.4 \, & chi = 1 \,, 2 \/ a^2 \, & chi = 0 .) $ <num:gap-formula>]

Here $s_h$ is omitted when $chi = 0$, including at the shared endpoints $1.02$ and $1.62$.
  Every entry in Table 2 is verified directly from (9.15) by rational cross-multiplication.
  Thus it requires no integral or transcendental evaluation in addition to Table 1.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, right, left, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\[ a \, b \]$
], table.cell(rowspan: 1, colspan: 1)[$10^6 M_(a \, b) gt.eq$
], table.cell(rowspan: 1, colspan: 1)[$\[ a \, b \]$
], table.cell(rowspan: 1, colspan: 1)[$10^6 M_(a \, b) gt.eq$
]),
  table.cell(rowspan: 1, colspan: 1)[$\[ .64 \, .74 \]$
], table.cell(rowspan: 1, colspan: 1)[4416
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.26 \, 1.30 \]$
], table.cell(rowspan: 1, colspan: 1)[209
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .74 \, .84 \]$
], table.cell(rowspan: 1, colspan: 1)[2298
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.30 \, 1.34 \]$
], table.cell(rowspan: 1, colspan: 1)[269
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .84 \, .92 \]$
], table.cell(rowspan: 1, colspan: 1)[1859
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.34 \, 1.38 \]$
], table.cell(rowspan: 1, colspan: 1)[379
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .92 \, .98 \]$
], table.cell(rowspan: 1, colspan: 1)[1313
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.38 \, 1.42 \]$
], table.cell(rowspan: 1, colspan: 1)[369
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .98 \, 1.02 \]$
], table.cell(rowspan: 1, colspan: 1)[967
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.42 \, 1.46 \]$
], table.cell(rowspan: 1, colspan: 1)[90
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 1.02 \, 1.06 \]$
], table.cell(rowspan: 1, colspan: 1)[1037
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.46 \, 1.50 \]$
], table.cell(rowspan: 1, colspan: 1)[90
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 1.06 \, 1.10 \]$
], table.cell(rowspan: 1, colspan: 1)[581
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.50 \, 1.54 \]$
], table.cell(rowspan: 1, colspan: 1)[100
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 1.10 \, 1.14 \]$
], table.cell(rowspan: 1, colspan: 1)[280
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.54 \, 1.58 \]$
], table.cell(rowspan: 1, colspan: 1)[520
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 1.14 \, 1.18 \]$
], table.cell(rowspan: 1, colspan: 1)[145
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.58 \, 1.62 \]$
], table.cell(rowspan: 1, colspan: 1)[1470
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 1.18 \, 1.22 \]$
], table.cell(rowspan: 1, colspan: 1)[137
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.62 \, 1.70 \]$
], table.cell(rowspan: 1, colspan: 1)[250
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 1.22 \, 1.26 \]$
], table.cell(rowspan: 1, colspan: 1)[137
], table.cell(rowspan: 1, colspan: 1)[$\[ 1.70 \, 1.90 \]$
], table.cell(rowspan: 1, colspan: 1)[1899
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$\[ 1.90 \, 2.25 \]$
], table.cell(rowspan: 1, colspan: 1)[14266
],
)
]],
  caption: [Table 2: All 23 interpolation intervals. The last column of each pair is an integer lower bound for $10^6 M_(a \, b)$. ],
)

#proof[
  Apply (9.14) with the corrected knot lower bounds in (9.15).
    Table 2 gives a strictly positive lower bound on every interval, and those intervals cover the stated ranges,
    including all endpoints. The smallest certified uniform margin is $9 \/ 100000$,
    on $\[ 1.42 \, 1.46 \]$ and $\[ 1.46 \, 1.50 \]$. In particular,
    the corrected lower bound at $1.46$ is exactly $.00057$ and the interior interpolation loss is $.00048$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[E.~Acerbi, N.~Fusco, and M.~Morini, #emph[Minimality via second variation for a nonlocal
  isoperimetric problem], Comm. Math. Phys. #strong[322] (2013), no.~2, 515--557.
  #link("https://doi.org/10.1007/s00220-013-1733-y")[doi:10.1007/s00220-013-1733-y].]
#bibitem([2])[F.~Barthe and B.~Maurey, #emph[Some remarks on isoperimetry of Gaussian type], Ann. Inst. H.
  Poincaré Probab. Statist. #strong[36] (2000), no.~4, 419--434.
  #link("https://www.numdam.org/item/AIHPB_2000__36_4_419_0/")[Published article].]
#bibitem([3])[S.~Blatt, #emph[On the analyticity of solutions to non-linear elliptic partial differential
  equations], arXiv:2009.08762v2 (2024). #link("https://arxiv.org/abs/2009.08762v2")[arXiv:2009.08762v2].]
#bibitem([4])[H.~Hadwiger, #emph[Gitterperiodische Punktmengen und Isoperimetrie], Monatsh. Math.
  #strong[76] (1972), 410--418. #link("https://doi.org/10.1007/BF01297304")[doi:10.1007/BF01297304].]
#bibitem([5])[L.~Hauswirth, J.~Pérez, P.~Romon, and A.~Ros, #emph[The periodic isoperimetric problem], Trans.
  Amer. Math. Soc. #strong[356] (2004), no.~5, 2025--2047.
  #link("https://doi.org/10.1090/S0002-9947-03-03362-2")[doi:10.1090/S0002-9947-03-03362-2].]
#bibitem([6])[E.~Milman, #emph[Isoperimetric inequalities on slabs with applications to cubes and Gaussian slabs],
  Comm. Pure Appl. Math. #strong[79] (2026), no.~4, 1012--1072.
  #link("https://doi.org/10.1002/cpa.70020")[doi:10.1002/cpa.70020].]
#bibitem([7])[F.~Morgan and D.~L.~Johnson, #emph[Some sharp isoperimetric theorems for Riemannian manifolds],
  Indiana Univ. Math. J. #strong[49] (2000), no.~3, 1017--1041.
  #link("https://www.lehigh.edu/~dlj0/papers/morgan-johnson.pdf")[Author manuscript].]
#bibitem([8])[M.~Ritoré, #emph[Superficies con curvatura media constante], revised Ph.D.
  thesis, Universidad de Granada, 1994. #link("https://www.ugr.es/~ritore/preprints/tesis.pdf")[Thesis PDF].]
#bibitem([9])[M.~Ritoré and A.~Ros, #emph[Stable constant mean curvature tori and the isoperimetric problem in
  three space forms], Comment. Math. Helv. #strong[67] (1992), no.~2, 293--305.
  #link("https://doi.org/10.1007/BF02566501")[doi:10.1007/BF02566501].]
#bibitem([10])[M.~Ritoré and A.~Ros, #emph[The spaces of index one minimal surfaces and stable constant mean
  curvature surfaces embedded in flat three manifolds], Trans. Amer. Math. Soc.
  #strong[348] (1996), no.~1, 391--410.
  #link("https://doi.org/10.1090/S0002-9947-96-01496-1")[doi:10.1090/S0002-9947-96-01496-1].]
#bibitem([11])[A.~Ros, #emph[The isoperimetric problem], in #emph[Global Theory of Minimal Surfaces],
  D.~Hoffman (ed.), Clay Math. Proc., vol.~2, American Mathematical Society, Providence, RI, 2005, pp.~175--209.
  #link("https://www.claymath.org/wp-content/uploads/2022/03/cmip02.pdf")[Publisher-hosted volume].]
