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

#align(center)[#text(size: 16pt, weight: "bold")[Finite angular cylinder covers \
below the half-area bound]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

How small can the total cross-sectional area of a finite cylinder covering of a convex body be? Here a convex body $K subset bb(R)^3$ is compact, convex, and has nonempty interior. A cylinder is a set

$ C = B + bb(R) u \, $

where $u$ is a unit vector and its base $B subset u^perp$ is measurable with finite area. All areas and projections are Euclidean. Write

$ A_min \( K \) = min_(dim E = 2) \| pi_E K \| \, $

where $pi_E$ is orthogonal projection onto the two-dimensional linear subspace $E$ and $\| dot.op \|$ denotes planar Lebesgue measure. The #emph[half-area cylinder covering conjecture] asks whether every finite covering $K subset union.big_(i = 1)^m \( B_i + bb(R) u_i \)$ satisfies

#[#set math.equation(numbering: n => "(1.1)")
 $ sum_(i = 1)^m \| B_i \| gt.eq 1 / 2 A_min \( K \) . $ <eq:conjectured-bound>]

The cylinder question belongs to the line of covering problems that begins with Tarski’s plank problem. A #emph[plank] is the region between two parallel hyperplanes, and its width is their distance. Bang proved that a finite plank covering of a convex body has total width at least the body’s minimum width #cite(label("Bang1951")); see also #cite(label("Bezdek2009")) Theorem 2.1. Ball proved the directionwise refinement for centrally symmetric bodies: after dividing each plank’s width by the body’s width in the same normal direction, the sum is at least one #cite(label("Ball1991")) arXiv v1, Theorem 1. Thus the width cost of a plank cover has both an absolute formulation and a relative formulation adapted to the individual directions.

For cylinders in three dimensions, the two-cylinder cover of a regular tetrahedron shows that replacing widths by base areas cannot preserve the constant one. Its two axes are parallel to opposite edges, and its total base area equals half the tetrahedron’s minimum projection area. Bezdek #cite(label("Bezdek2009")) Problem 3.1 and Bezdek and Litvak #cite(label("BL2009")) arXiv v1, Introduction attribute this example and the resulting half-area question to Bang’s 1951 paper. Their formulations allow measurable bases perpendicular to the axes, as in our definition.

For a finite covering $cal(C) = \( B_i + bb(R) u_i \)_(i = 1)^m$, define the #emph[directionwise relative area] by

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(R) \( cal(C) \; K \) := sum_(i = 1)^m frac(\| B_i \|, \| pi_(u_i^perp) K \|) . $ <eq:relative-cost>]

All denominators are positive because $K$ has nonempty interior. Bezdek and Litvak proved $cal(R) \( cal(C) \; K \) gt.eq 1 \/ 3$ for every finite covering in three dimensions, and the stronger bound $cal(R) \( cal(C) \; K \) gt.eq 1$ when $K$ is an ellipsoid. In their proof, the general case combines the Rogers–Shephard section–projection inequality with a volume comparison. For ellipsoids, they reduce to a ball and use a density whose integral along every interior chord is the same #cite(label("BL2009")) arXiv v1, Theorem 3.1 and its proof. These arguments leave a gap between the universal one-third lower bound and the proposed one-half threshold.

Bezdek and Khan record the directionwise assertion $cal(R) \( cal(C) \; K \) gt.eq 1 \/ 2$ under the name #emph[1-Codimensional Cylinder Covering Conjecture] #cite(label("BK2016")) arXiv v2, Definition 3 and Conjecture 4.13. It would imply (1.1), since

#[#set math.equation(numbering: n => "(1.3)")
 $ cal(R) \( cal(C) \; K \) lt.eq frac(sum_i \| B_i \|, A_min \( K \)) . $ <eq:cost-comparison>]

Verreault’s 2026 survey records the half-area question as unresolved #cite(label("Verreault2026")) Question 4.14. Our construction starts with the tetrahedral equality example itself and replaces its two axes by finitely many nearby directions. It violates both half-area bounds while retaining compact triangular bases.

We construct a counterexample with compact triangular bases. Set $H = sqrt(2)$ and

#[#set math.equation(numbering: n => "(1.4)")
 $ K = { \( x \, y \, H t \) : 0 lt.eq t lt.eq 1 \, med \| x \| lt.eq 1 - t \, med \| y \| lt.eq t } . $ <eq:tetrahedron>]

Its vertices are $\( plus.minus 1 \, 0 \, 0 \)$ and $\( 0 \, plus.minus 1 \, H \)$, so it is a regular tetrahedron of edge length $2$.

#thm([Theorem 1.1.])[
  #emph[The tetrahedron (1.4) has $A_min \( K \) = sqrt(2)$. For every $0 < epsilon lt.eq 1 \/ 2000$, it admits a covering by $m = 2 ceil.l 2 \/ epsilon^2 ceil.r$ cylinders with compact triangular perpendicular bases such that 
#[#set math.equation(numbering: n => "(1.5)")
 $ 1 / sqrt(2) sum_(i = 1)^m \| B_i \| = 1 / 2 - 13 / 6000 epsilon^2 + O \( epsilon^4 \) . $ <eq:main-asymptotic>]

 The remainder has absolute value at most $2 epsilon^4$, and the total base area is strictly less than $A_min \( K \) \/ 2$.]
] <thm:counterexample>

Every covering in the theorem is finite, although its number of cylinders increases as the tilt decreases. Similarities preserve the ratio of base area to minimum projection area, so the construction applies to every regular tetrahedron.

#thm([Corollary 1.2.])[
  #emph[Every nondegenerate tetrahedron $T subset bb(R)^3$ admits a finite cylinder covering with compact triangular perpendicular bases for which 
$ sum_(i = 1)^m frac(\| B_i \|, \| pi_(u_i^perp) T \|) < 1 / 2 . $

 Thus the 1-Codimensional Cylinder Covering Conjecture is false.]
] <cor:normalized-covering>

#proof[
  For the regular tetrahedron $K$, each denominator is at least $A_min \( K \) > 0$, so the sum is at most $sum_i \| B_i \| \/ A_min \( K \) < 1 \/ 2$ by Theorem 1 with $epsilon = 1 \/ 2000$.
  The directionwise ratios are invariant under invertible affine maps #cite(label("BL2009")) arXiv v1, Section 3. To see this directly, let $A$ be an invertible linear map and set $v = A u \/ \| A u \|$. The linear map
  $ L = pi_(v^perp) A\|_(u^perp) : u^perp arrow.r v^perp $
  is an isomorphism: $L b = 0$ implies that $A b$ is parallel to $A u$, hence $b$ is parallel to $u$, and therefore $b = 0$. The transformed cylinder has perpendicular base $L B$, and $pi_(v^perp) \( A K \) = L \( pi_(u^perp) K \)$. Both areas are multiplied by the same positive factor $\| det L \|$, so their ratio is unchanged. Translations also preserve it. Every nondegenerate tetrahedron is an affine image of $K$; the images of its covering retain the same finite count and compact nondegenerate triangular bases. ◻
]

This affine argument concerns the directionwise ratios. The conclusion of Theorem 1, which uses one minimum projection area for all directions, is asserted here for regular tetrahedra.

===== 1.1 Idea of the proof. <idea-of-the-proof.>

Bang’s equality example covers the parts $t lt.eq 1 \/ 2$ and $t gt.eq 1 \/ 2$ by cylinders parallel to the $x$- and $y$-axes, respectively. These axes are parallel to opposite edges of the tetrahedron, and each base is a triangle. We subdivide these triangles into narrow sectors and give each sector its own tilted axis. Tilting reduces the perpendicular area, but it can also open gaps between neighboring sectors and between the two families.

Two choices prevent these gaps. First, the axes adjacent to a shared sector side make the planes containing that side coincide. At a point $\( x \, y \, H t \)$ of the tetrahedron, these planes specify a finite list of $y$-coordinates beginning at $- t$ and ending at $t$. Hence some adjacent pair brackets $y$, even if the list is not ordered. This selects a sector in the first family; exchanging the roles of $x$ and $y$ does the same for the second. Second, we increase each sector’s radial extent by a quantity of order $epsilon^2$. A gap between the families could occur only near $t = 1 \/ 2$. There the radial heights of the two intercepts, measured from their respective tips, have opposite first-order shifts, $- epsilon x y$ and $+ epsilon x y$, so their sum changes only to second order. The increases can therefore be chosen small enough that their area cost is less than the quadratic gain from tilting.

Section 2 proves the projection minimum and derives the finite construction. Section 3 proves exact coverage: a first-crossing argument chooses angular sectors, and a single radial budget excludes simultaneous failure of their cutoffs. Section 4 computes the perpendicular areas. The angular mesh has size at most $epsilon^2$, which keeps the total approximation error of order $epsilon^4$ even as the number of cylinders grows.

The same mechanism permits more freedom than the first construction uses. Section 5 gives a common criterion for continuous radial profiles, squared-radius cutoffs and bounded Cartesian apertures, and compares midpoint sampling with endpoint-centred sectors. Its estimates remain uniform as the partition is refined. Section 6 then lets the radial margin tend to zero with the tilt. In the same tetrahedron $K$, its normalized cost is $1 \/ 2 - tau^2 \/ 240 + \( 25 \/ 2 \) tau^3 + O \( tau^4 \)$: one family of constructions attains the quadratic coefficient approached as the fixed margin tends to zero. Its cylinders cover for $0 < tau lt.eq 1$, whereas the explicit area bound guarantees strict saving for $0 < tau lt.eq 1 \/ 4000$. Appendix 7 gives complementary direct proofs for curved caps, and Appendix 8 collects the exact counts and formulas under other parameter and scale choices.

== 2 Geometry and the finite construction <sec:construction>

We first fix the area scale against which the covering will be measured. We then specify every triangle and every axis in the finite covering. The projection calculation is the facet-area-vector form of Cauchy’s projection formula; see #cite(label("Martini1991")) p. 83, equation (1) for its projection-body formulation. We include the face-by-face proof for this tetrahedron.

#thm([Lemma 2.1.])[
  #emph[For the tetrahedron (1.4), $A_min \( K \) = H$.]
] <lem:projection-minimum>

#proof[
  The outward face area vectors (unit normal multiplied by face area) are
  $ \( 0 \, plus.minus H \, - 1 \) \, #h(2em) \( plus.minus H \, 0 \, 1 \) . $
  Indeed, the supporting planes are $plus.minus H y - z = 0$ and $plus.minus H x + z = H$. The displayed outward normals have length $sqrt(3)$, which is the area of each equilateral face of side length $2$. For a unit vector $u$, the faces with positive scalar product against $u$ project to partition the shadow, apart from the projections of edges and parallel faces, which have area zero. They give the forward endpoints of the chords parallel to $u$. The projected area of a face with area vector $N$ is $\| N dot.op u \|$, as follows by projecting its two edge vectors and taking their cross product. The sum of the four area vectors is zero. Thus the shadow area is half the sum of their absolute scalar products with $u$, namely
  $ A \( u \) = max \( H \| u_x \| \, \| u_z \| \) + max \( H \| u_y \| \, \| u_z \| \) . $
  Put $U = max \( \| u_x \| \, \| u_z \| \/ H \)$ and $V = max \( \| u_y \| \, \| u_z \| \/ H \)$. Since $H^2 = 2$,
  $ \( U + V \)^2 gt.eq \| u_x \|^2 + \| u_y \|^2 + 2 \| u_z \|^2 \/ H^2 = 1 . $
  Here $U^2 gt.eq \| u_x \|^2$, $V^2 gt.eq \| u_y \|^2$ and $U V gt.eq \| u_z \|^2 \/ H^2$ account for the three terms separately. Hence $A \( u \) = H \( U + V \) gt.eq H$, with equality at $u = \( 1 \, 0 \, 0 \)$. ◻
]

At zero tilt, the part $t lt.eq 1 \/ 2$ is covered by an $x$-parallel cylinder and the part $t gt.eq 1 \/ 2$ by a $y$-parallel cylinder. Each perpendicular base is a triangle of area $H \/ 4$. The lower intercept triangle can be parametrized as

$ \( 0 \, q t_0 \, H t_0 \) \, #h(2em) - 1 lt.eq q lt.eq 1 \, quad 0 lt.eq t_0 lt.eq 1 \/ 2 . $

Here $q$ is a slope parameter: for $t_0 > 0$ it is the second coordinate divided by $t_0$. We call the intervals of $q$ angular sectors. The radial height $t_0$ is the third physical coordinate divided by $H$, rather than Euclidean distance from the tip. The upper intercept triangle is similarly $\( p s_0 \, 0 \, H \( 1 - s_0 \) \)$, with $- 1 lt.eq p lt.eq 1$ and $0 lt.eq s_0 lt.eq 1 \/ 2$. We now perturb a finite subdivision of these triangles.

Fix a positive tilt parameter $epsilon$, and put

#[#set math.equation(numbering: n => "(2.1)")
 $ eta = 1 / 1000 \, #h(2em) n = ⌈2 / epsilon^2⌉ \, #h(2em) Delta = 2 / n \, #h(2em) q_j = - 1 + j Delta quad \( 0 lt.eq j lt.eq n \) . $ <eq:parameters>]

In particular $Delta lt.eq epsilon^2$. To make adjacent tilted sectors meet, prescribe the displacement of the boundary with angular parameter $q$ by

$ phi.alt \( q \) = frac(1 - q^2, 4) #h(2em) \( - 1 lt.eq q lt.eq 1 \) . $

The endpoint values $phi.alt \( - 1 \) = phi.alt \( 1 \) = 0$ will keep the outer angular sides in the fixed planes $y = - t$ and $y = t$. For real $alpha \, beta$, the lines with direction $\( 1 \, epsilon alpha \, H epsilon beta \)$ through the points $\( 0 \, q t_0 \, H t_0 \)$, $t_0 gt.eq 0$, lie in the plane

$ y = q t + epsilon x \( alpha - q beta \) . $

Thus neighboring angular sides will lie in the same plane if both axes use the value $phi.alt \( q \)$ there. On the interval $\[ q_j \, q_(j + 1) \]$, solve the two endpoint equations $alpha_j - q beta_j = phi.alt \( q \)$. This gives

#[#set math.equation(numbering: n => "(2.2)")
 $ alpha_j = frac(1 + q_j q_(j + 1), 4) \, #h(2em) beta_j = frac(q_j + q_(j + 1), 4) #h(2em) \( 0 lt.eq j < n \) \, $ <eq:axis-coefficients>]

and hence the exact matching identities

#[#set math.equation(numbering: n => "(2.3)")
 $ alpha_j - q beta_j = frac(1 - q^2, 4) #h(2em) \( q = q_j upright(" or ") q = q_(j + 1) \) . $ <eq:shared-boundaries>]

The choice of parabola also anticipates the radial estimate. At zero tilt, the ray of slope $q$ meets the middle section at $y = q \/ 2$. The lower intercept height $t_0 = t - epsilon x beta_j$ should have first-order shift $- epsilon x y$. This suggests $beta_j tilde.eq q \/ 2$. The endpoint equations make $beta_j$ the negative secant slope of $phi.alt$, so their limiting relation is $phi.alt' \( q \) = - q \/ 2$. Together with the two endpoint conditions, this gives $phi.alt \( q \) = \( 1 - q^2 \) \/ 4$. The finite identities above, rather than this motivation, will be used in the proof.

We also enlarge each sector slightly beyond its original radial cutoff $1 \/ 2$. Define

#[#set math.equation(numbering: n => "(2.4)")
 $ d \( q \) = frac(q^2 \( 1 + q^2 \), 16) \, #h(2em) M_j = eta + max_(q_j lt.eq q lt.eq q_(j + 1)) d \( q \) \, #h(2em) T_j = 1 / 2 + epsilon^2 M_j . $ <eq:cutoffs>]

The function $d$ bounds the quadratic loss in the overlap of the two families; its role is made explicit in the coverage argument below. For later estimates, note that

#[#set math.equation(numbering: n => "(2.5)")
 $ 0 lt.eq alpha_j lt.eq 1 / 2 \, #h(2em) \| beta_j \| lt.eq 1 / 2 \, #h(2em) eta lt.eq M_j lt.eq 1 / 8 + eta . $ <eq:coefficient-bounds>]

Our intercept triangles and direction vectors are

#[#set math.equation(numbering: n => "(2.6)")
 $ P_j & = { \( 0 \, y_0 \, H t_0 \) : 0 lt.eq t_0 lt.eq T_j \, med q_j t_0 lt.eq y_0 lt.eq q_(j + 1) t_0 } \, & v_j & = \( 1 \, epsilon alpha_j \, H epsilon beta_j \) \,\
Q_j & = { \( x_0 \, 0 \, H \( 1 - s_0 \) \) : 0 lt.eq s_0 lt.eq T_j \, med q_j s_0 lt.eq x_0 lt.eq q_(j + 1) s_0 } \, & w_j & = \( - epsilon alpha_j \, 1 \, H epsilon beta_j \) . $ <eq:first-family>]

Use the $2 n$ cylinders

$ P_j + bb(R) v_j \, #h(2em) Q_j + bb(R) w_j #h(2em) \( 0 lt.eq j < n \) . $

To express them with perpendicular bases, project each intercept triangle onto the linear plane perpendicular to its direction and normalize that direction. Projection along the axis does not change the cylinder: $P + bb(R) v = pi_(v^perp) P + bb(R) v$. Moreover, it is injective on either intercept plane because the corresponding normal component of $v_j$ or $w_j$ is $1$. Thus each actual base is a compact nondegenerate triangle, with finite area.

Figure 1 shows the original covering and the angular matching after the tilt. In a fixed plane $x = X$, the neighboring sectors start at different translated vertices $V_i = \( epsilon X alpha_i \, epsilon X beta_i \)$ in $\( y \, t \)$ coordinates, but their sides at a shared value of $q$ lie on the same line. Thus the matching concerns the supporting planes of the sides; the radial extents still have to be checked.

#figure(
  [#grid(
    columns: (0.48fr, 0.49fr,),
    column-gutter: 3%,
    [
      #strong[(a)] The zero-tilt geometry, $epsilon = 0$
      #cetz.canvas({
  import cetz.draw: *
  line((-2.875, 0.639), (2.875, -0.639), (1.518, 5.352), (-1.518, 3.914), close: true, fill: rgb("#f7f7f7"), stroke: none)
  line((-2.875, 0.639), (1.518, 5.352), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((-2.197, 2.276), (0.6789, 1.637), (2.197, 2.356), (-0.6789, 2.995), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((-2.197, 2.276), (0.6789, 1.637), (2.197, 2.356), (-0.6789, 2.995), close: true, stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round"))
  line((-2.875, 0.639), (-1.518, 3.914), (1.518, 5.352), (2.875, -0.639), (2.875, -0.639), (-1.518, 3.914), close: true, stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"))
  line((-2.875, 0.639), (2.875, -0.639), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((-1.518, 3.914), (1.518, 5.352), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, cap: "round", join: "round"))
  line((-1.791, 1.312), (1.487, 0.5831), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  line((-1.085, 1.968), (1.388, 1.419), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  line((-0.5623, 3.147), (1.137, 3.952), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  line((-0.9401, 2.905), (0.365, 3.523), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: ">"))
  content((0.7668, 0.5591), [#text(fill: rgb("#0000a6"))[#text(size: 7pt)[$x$]]], anchor: "north", padding: 0.1176cm)
  content((1.118, 3.962), [#text(fill: rgb("#cc6600"))[#text(size: 7pt)[$y$]]], anchor: "south-west", padding: 0.1176cm)
  content((0, 2.3), [#box(inset: 0.04586cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$t= frac(1, 2)$]]])])
  content((-2.396, -0.2077), [#text(size: 7pt)[$(-1,0,0)$]])
  content((2.396, -1.326), [#text(size: 7pt)[$(1,0,0)$]])
  content((-2.3, 4.697), [#text(size: 7pt)[$(0,-1,H)$]])
  content((1.661, 6.086), [#text(size: 7pt)[$(0,1,H)$]])
  rect((-3.802, -1.582), (3.802, 6.39), stroke: none)
})
      Physical coordinates $\( x \, y \, H t \)$; $H = sqrt(2)$.
    ],
    [
      #strong[(b)] Matching after the tilt, $x = X$
      #cetz.canvas({
  import cetz.draw: *
  line((1.099, 0.5494), (1.099, 5.612), (3.63, 5.612), close: true, fill: rgb("#e0e0ff"), stroke: none)
  line((1.648, 1.648), (3.63, 5.612), (5.612, 5.612), close: true, fill: rgb("#ffe9d4"), stroke: none)
  line((1.099, 0.5494), (1.099, 5.612), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"))
  line((1.648, 1.648), (5.612, 5.612), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, cap: "round", join: "round"))
  line((1.099, 0.5494), (3.63, 5.612), stroke: (paint: rgb("#333333"), thickness: 1.2pt, cap: "round", join: "round"))
  line((0, 0), (2.806, 5.612), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((1.893, 3.787), (2.717, 3.787), stroke: (paint: rgb("#666666"), thickness: 0.4pt, cap: "round", join: "round"), mark: (start: "<", end: ">"))
  content((2.305, 3.854), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$epsilon X(1-q^2)"/"4$]]])], anchor: "south")
  line((-0.4057, 0), (6.288, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((6.288, 0), [#text(size: 7pt)[$y$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.3043), (0, 6.153), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((0, 6.153), [#text(size: 7pt)[$t$]], anchor: "south", padding: 0.1176cm)
  content((-0.08114, -0.03381), [#text(size: 7pt)[$O$]], anchor: "north-east", padding: 0.1176cm)
  circle((1.099, 0.5494), radius: 0.03528, fill: black, stroke: none)
  circle((1.648, 1.648), radius: 0.03528, fill: black, stroke: none)
  content((1.021, 0.5342), [#text(size: 7pt)[$V_j$]], anchor: "east", padding: 0.1176cm)
  content((1.724, 1.616), [#text(size: 7pt)[$V_(j+1)$]], anchor: "west", padding: 0.1176cm)
  content((1.826, 4.733), [#text(fill: rgb("#0000a6"))[#text(size: 7pt)[$j$]]])
  content((4.328, 4.733), [#text(fill: rgb("#d96d00"))[#text(size: 7pt)[$j+1$]]])
  content((0.3381, 2.84), [#text(size: 7pt)[$y="qt"$]], anchor: "south-east", padding: 0.1176cm)
  line((0.3516, 2.941), (1.589, 3.178), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"))
  content((2.975, -0.4733), [#text(size: 7pt)[$q=q_(j+1)$, $V_i=( epsilon X alpha_i, epsilon X beta_i)$]], anchor: "north", padding: 0.1176cm)
  rect((-0.6762, -1.014), (6.762, 6.491), stroke: none)
})
      The common supporting line is $y = q t + epsilon X \( 1 - q^2 \) \/ 4$.
    ],
  )],
  caption: [Figure 1: (a) At zero tilt, cylinders parallel to the two opposite edges cover the lower and upper halves of $K$. (b) In the plane $x = X$, neighboring angular sectors have distinct translated vertices $V_j$ and $V_(j + 1)$, but their sides at $q = q_(j + 1)$ lie on the same line $y = q t + epsilon X \( 1 - q^2 \) \/ 4$. The dashed line is $y = q t$, its zero-tilt position. Tilt and sector widths are exaggerated. Radial cutoffs are omitted; the colored regions end at the boundary of the displayed window. ],
) <fig:construction>

== 3 Coverage of the entire tetrahedron <sec:coverage>

The shared-boundary identity gives an angular sector in each family for every point of $K$. The remaining task is to prove that at least one of the two selected triangles has sufficient radial extent.

#thm([Proposition 3.1.])[
  #emph[For every $0 < epsilon lt.eq eta \/ 2$, the $2 n$ cylinders (2.6)–(2.6), with parameters (2.1)–(2.4), cover the closed tetrahedron $K$.]
] <prop:coverage>

#proof[
  #emph[Choosing angular sectors.] Fix $\( x \, y \, H t \) in K$ and write $s = 1 - t$. The intercept along $v_j$ is $\( 0 \, y_0 \, H t_0 \)$, where
  #[#set math.equation(numbering: n => "(3.1)")
   $ t_0 = t - epsilon x beta_j \, #h(2em) y_0 = y - epsilon x alpha_j . $ <eq:lower-intercept>]
  Consider the finite sequence
  $ F_i = q_i t + epsilon x frac(1 - q_i^2, 4) #h(2em) \( 0 lt.eq i lt.eq n \) . $
  Its endpoints are $F_0 = - t lt.eq y lt.eq t = F_n$. Choose the first index $i gt.eq 1$ for which $F_i gt.eq y$, and set $j = i - 1$. Such an index exists because $F_n gt.eq y$. If $i = 1$, then $F_j = F_0 lt.eq y$; if $i > 1$, minimality gives $F_j < y$. Thus $F_j lt.eq y lt.eq F_(j + 1)$, including when $y$ equals an extreme endpoint. Using (2.3), these inequalities are exactly
  #[#set math.equation(numbering: n => "(3.2)")
   $ q_j t_0 lt.eq y_0 lt.eq q_(j + 1) t_0 . $ <eq:lower-sector>]
  Subtracting their outer terms gives $0 lt.eq \( q_(j + 1) - q_j \) t_0 = Delta t_0$. Since $Delta > 0$, they force $t_0 gt.eq 0$. Hence the selected first-family cylinder covers the point unless $t_0 > T_j$. This argument does not assume that the sequence $F_i$ is monotone.
  For the second family, use the sequence
  $ G_i = q_i s - epsilon y frac(1 - q_i^2, 4) \, #h(2em) G_0 = - s lt.eq x lt.eq s = G_n . $
  The same first-crossing choice gives an index $k$ for which
  #[#set math.equation(numbering: n => "(3.3)")
   $ s_0 = s + epsilon y beta_k gt.eq 0 \, #h(2em) x_0 = x + epsilon y alpha_k \, #h(2em) q_k s_0 lt.eq x_0 lt.eq q_(k + 1) s_0 . $ <eq:upper-intercept>]
  This cylinder covers unless $s_0 > T_k$.
  #emph[Comparing the radial cutoffs.] It remains to show that the two selected radial cutoffs cannot both fail. Suppose both selected cylinders miss the point. Then $t_0 \, s_0 > 1 \/ 2$, and we can set
  $ q = y_0 \/ t_0 in \[ q_j \, q_(j + 1) \] \, #h(2em) p = x_0 \/ s_0 in \[ q_k \, q_(k + 1) \] . $
  Since $\| x \| + \| y \| lt.eq 1$, (2.5) gives
  $ t_0 + s_0 = 1 - epsilon x beta_j + epsilon y beta_k lt.eq 1 + epsilon \/ 2 . $
  Thus each of $t_0 \, s_0$ lies between $1 \/ 2$ and $1 \/ 2 + epsilon \/ 2$. Using $y = t_0 q + epsilon x alpha_j$ and $x = s_0 p - epsilon y alpha_k$, we obtain
  #[#set math.equation(numbering: n => "(3.4)")
   $ \| y - q \/ 2 \| lt.eq epsilon \, #h(2em) \| x - p \/ 2 \| lt.eq epsilon . $ <eq:rough-angles>]
  Since $\| beta_j - q \/ 2 \| lt.eq Delta \/ 4$ and $\| beta_k - p \/ 2 \| lt.eq Delta \/ 4$, (3.4) gives $\| beta_j - y \| \, \| beta_k - x \| lt.eq epsilon + Delta \/ 4$. Thus the intercept heights $t_0 = t - epsilon x beta_j$ and $s_0 = s + epsilon y beta_k$ have opposite first-order changes $- epsilon x y$ and $+ epsilon x y$. This cancellation is the reason for choosing $beta_j$ close to $q \/ 2$.
  To control the remaining terms exactly, write $a = t_0 - 1 \/ 2$ and $b = s_0 - 1 \/ 2$. The two radial excesses satisfy
  #[#set math.equation(numbering: n => "(3.5)")
   $ a \( 1 - epsilon x q \) + b \( 1 + epsilon y p \) & = epsilon^2 \( x^2 alpha_j + y^2 alpha_k \)\
 & quad - epsilon x \( beta_j - q \/ 2 \) + epsilon y \( beta_k - p \/ 2 \) . $ <eq:radial-budget>]
  For completeness, $a + b = - epsilon x beta_j + epsilon y beta_k$, while the intercept equations give $q a = y - epsilon x alpha_j - q \/ 2$ and $p b = x + epsilon y alpha_k - p \/ 2$. Substitute these three identities into the left side of (3.5); the two mixed terms cancel.
  For $0 < epsilon < 1$, both factors multiplying $a$ and $b$ are at least $1 - epsilon > 0$. Since $a > epsilon^2 M_j$, $b > epsilon^2 M_k$ and $\| x \| + \| y \| lt.eq 1$, dividing (3.5) by $epsilon^2$ yields
  #[#set math.equation(numbering: n => "(3.6)")
   $ 0 > \( M_j + M_k \) \( 1 - epsilon \) - frac(Delta, 4 epsilon) - \( x^2 alpha_j + y^2 alpha_k \) . $ <eq:failure-inequality>]
  We bound the last term without losing uniformity at the boundary. From (3.4) and $\| x \| \, \| y \| lt.eq 1$, $\| p \| \, \| q \| lt.eq 1$,
  $ \| x^2 - p^2 \/ 4 \| \, med \| y^2 - q^2 \/ 4 \| lt.eq 3 / 2 epsilon . $
  For a point inside its interval,
  $ lr(|alpha_j - frac(1 + q^2, 4)|) lt.eq Delta \/ 2 \, #h(2em) lr(|alpha_k - frac(1 + p^2, 4)|) lt.eq Delta \/ 2 . $
  Consequently
  $ x^2 alpha_j + y^2 alpha_k & lt.eq frac(p^2 + q^2 + 2 p^2 q^2, 16) + 3 / 2 epsilon + Delta / 4\
 & lt.eq d \( p \) + d \( q \) + 3 / 2 epsilon + Delta / 4 . $
  The second inequality explains our choice of radial enlargement:
  $ d \( p \) + d \( q \) - frac(p^2 + q^2 + 2 p^2 q^2, 16) = frac(\( p^2 - q^2 \)^2, 16) gt.eq 0 . $
  The cutoff definitions give
  $ d \( p \) + d \( q \) + 2 eta lt.eq M_j + M_k lt.eq 1 / 4 + 2 eta . $
  Using $Delta lt.eq epsilon^2$, the right side of (3.6) is therefore at least
  #[#set math.equation(numbering: n => "(3.7)")
   $ 2 eta - \( 2 + 2 eta \) epsilon - epsilon^2 / 4 . $ <eq:uniform-coverage-gap>]
  For $0 < epsilon lt.eq eta \/ 2$ this is at least $eta - 17 eta^2 \/ 16 > 0$, a contradiction. All sector and cutoff inequalities are non-strict membership conditions. The argument applies to every point of the closed tetrahedron, including its faces, edges and vertices. ◻
]

We retain the numerical estimate with a variable margin for the later construction in Section 6.

#thm([Corollary 3.2.])[
  (Quantitative coverage criterion).  #emph[Let $0 < tau < 1$ and $eta gt.eq 0$. Choose an integer $n$ with $Delta = 2 \/ n lt.eq tau^2$, put $q_j = - 1 + j Delta$, and define $alpha_j \, beta_j$ by (2.2). Use the triangles and directions (2.6)–(2.6), with $epsilon$ replaced by $tau$ and with cutoffs 
$ T_j = 1 / 2 + tau^2 (eta + max_(q_j lt.eq q lt.eq q_(j + 1)) d \( q \)) . $

 These $2 n$ cylinders cover $K$ whenever 
#[#set math.equation(numbering: n => "(3.8)")
 $ 2 eta - \( 2 + 2 eta \) tau - tau^2 / 4 gt.eq 0 . $ <eq:variable-margin-budget>]

]
] <cor:quantitative-coverage>

#proof[
  The angular first-crossing argument is unchanged. If both selected caps failed, their intercept heights would exceed $1 \/ 2$ and have sum at most $1 + tau \/ 2$. Thus the rough-angle estimates and the radial budget remain valid with the same constants, independently of $eta$. The only later use of the margin is through $d \( p \) + d \( q \) + 2 eta lt.eq M_j + M_k lt.eq 1 \/ 4 + 2 eta$. Consequently the same calculation as (3.6)–(3.7) gives $0 > 2 eta - \( 2 + 2 eta \) tau - tau^2 \/ 4$, contradicting (3.8). ◻
]

For the fixed parameters of the main construction, the coverage threshold $epsilon lt.eq 1 \/ 2000$ will also guarantee strict area saving. We now bound the area remainder explicitly, so no further choice of a smaller tilt is needed.

== 4 The strict area decrease <sec:area>

Coverage is now established. We compare the perpendicular areas of the tilted triangles with the two-triangle cost $H \/ 2$. All error estimates below are uniform over the intervals of the partition.

Let $S \( epsilon \)$ denote the sum of the areas of all $2 n$ perpendicular bases. Each intercept triangle in (2.6) and (2.6) has physical area $H Delta T_j^2 \/ 2$. Orthogonal projection between planes multiplies area by the absolute inner product of their unit normals. For either family, the factor is

$ \[ 1 + epsilon^2 \( alpha_j^2 + H^2 beta_j^2 \) \]^(- 1 \/ 2) . $

We therefore have the exact finite formula

#[#set math.equation(numbering: n => "(4.1)")
 $ frac(S \( epsilon \), H) = sum_(j = 0)^(n - 1) Delta T_j^2 \[ 1 + epsilon^2 \( alpha_j^2 + 2 beta_j^2 \) \]^(- 1 \/ 2) . $ <eq:exact-area-sum>]

#thm([Proposition 4.1.])[
  #emph[For the construction (2.1)–(2.6) and $0 < epsilon lt.eq 1$, 
$ lr(|frac(S \( epsilon \), H) - 1 / 2 - (2 eta - 1 / 240) epsilon^2|) lt.eq 2 epsilon^4 . $

]
] <prop:area-expansion>

#proof[
  Put $A_j = alpha_j^2 + 2 beta_j^2$ and
  $ f_j \( z \) = \( 1 / 2 + M_j z \)^2 \( 1 + A_j z \)^(- 1 \/ 2) . $
  The bounds (2.5) imply $0 lt.eq A_j lt.eq 1$ and $0 lt.eq M_j lt.eq 1 \/ 4$. For $0 lt.eq z lt.eq 1$, direct differentiation gives
  $ f''_j \( z \) & = frac(2 M_j^2, \( 1 + A_j z \)^(1 \/ 2)) - frac(2 A_j M_j \( 1 \/ 2 + M_j z \), \( 1 + A_j z \)^(3 \/ 2))\
 & #h(2em) + frac(3 A_j^2 \( 1 \/ 2 + M_j z \)^2, 4 \( 1 + A_j z \)^(5 \/ 2)) \, $
  so
  $ \| f''_j \( z \) \| lt.eq 1 / 8 + 3 / 8 + 27 / 64 = 59 / 64 . $
  Taylor’s theorem at $z = 0$, followed by (4.1) and $sum_j Delta = 2$, now gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ lr(|frac(S \( epsilon \), H) - 1 / 2 - epsilon^2 sum_j Delta (M_j - A_j / 8)|) lt.eq 59 / 64 epsilon^4 . $ <eq:taylor-bound>]
  In particular, the growing number of sectors causes no loss in the error bound: each remainder is weighted by its interval length.
  It remains to replace this finite sum by a polynomial integral. For $q in \[ q_j \, q_(j + 1) \]$, set
  $ A \( q \) = frac(\( 1 + q^2 \)^2, 16) + q^2 / 2 . $
  Since $\| d' \| lt.eq 3 \/ 8$ on $\[ - 1 \, 1 \]$,
  $ \| M_j - eta - d \( q \) \| lt.eq 3 / 8 Delta . $
  Also $\| alpha_j - \( 1 + q^2 \) \/ 4 \| lt.eq Delta \/ 2$ and $\| beta_j - q \/ 2 \| lt.eq Delta \/ 4$. The quantities in each of these differences have absolute value at most $1 \/ 2$, so $\| A_j - A \( q \) \| lt.eq Delta$. Therefore
  $ lr(|M_j - A_j / 8 - (eta + d \( q \) - frac(A \( q \), 8))|) lt.eq 1 / 2 Delta . $
  Integrating over all intervals shows that replacing the sum in (4.2) by $integral_(- 1)^1 \( eta + d \( q \) - A \( q \) \/ 8 \) thin d q$ costs at most $epsilon^2 Delta lt.eq epsilon^4$. Finally,
  $ integral_(- 1)^1 d \( q \) thin d q = 1 / 15 \, #h(2em) integral_(- 1)^1 A \( q \) thin d q = 17 / 30 \, $
  so this integral equals $2 eta - 1 \/ 240$. The combined error is at most $\( 59 \/ 64 + 1 \) epsilon^4 < 2 epsilon^4$, as claimed. ◻
]

#proof[
  The projection minimum is 3. The construction in 2 has exactly $2 n$ compact triangular perpendicular bases, and 4 proves that its cylinders cover $K$ for $0 < epsilon lt.eq eta \/ 2 = 1 \/ 2000$. Since $eta = 1 \/ 1000$, 6 gives
  $ frac(S \( epsilon \), H) lt.eq 1 / 2 - 13 / 6000 epsilon^2 + 2 epsilon^4 < 1 / 2 #h(2em) \( 0 < epsilon lt.eq 1 \/ 2000 \) \, $
  where the strict inequality follows from $2 epsilon^2 lt.eq 1 \/ 2 \, 000 \, 000 < 13 \/ 6000$. The same proposition gives the expansion and its stated remainder. ◻
]

The same computation also controls a margin chosen separately for each tilt. This will let us make the margin vanish without hiding its area cost.

#thm([Corollary 4.2.])[
  (Area estimate with a variable margin).  #emph[Let $0 < tau lt.eq 1$ and $0 lt.eq eta lt.eq 1 \/ 8$. Choose an integer $n$ with $Delta = 2 \/ n lt.eq tau^2$, put $q_j = - 1 + j Delta$, and use the secant coefficients (2.2) and cutoffs 
$ T_j = 1 / 2 + tau^2 (eta + max_(q_j lt.eq q lt.eq q_(j + 1)) d \( q \)) . $

 For the two families (2.6)–(2.6), with $epsilon$ replaced by $tau$, their total perpendicular base area $C$ satisfies 
#[#set math.equation(numbering: n => "(4.3)")
 $ lr(|C / H - 1 / 2 - (2 eta - 1 / 240) tau^2|) lt.eq 59 / 64 tau^4 + tau^2 Delta lt.eq 2 tau^4 . $ <eq:variable-margin-area>]

 The estimate is uniform over all these choices; it does not assume that the cylinders cover $K$.]
] <cor:variable-margin-area>

#proof[
  Here $M_j = eta + max_(\[ q_j \, q_(j + 1) \]) d lt.eq 1 \/ 4$ and $A_j lt.eq 1$, so the preceding second-derivative bound applies unchanged. It gives the Taylor error $59 tau^4 \/ 64$. In the comparison with $eta + d \( q \) - A \( q \) \/ 8$, the constant $eta$ cancels, leaving an error at most $Delta \/ 2$ at each angular point. Integration therefore costs at most $tau^2 Delta$. Neither bound requires $eta$ to be fixed as $tau$ varies. ◻
]

== 5 Other caps and angular partitions <ext:cap-section>

The triangular construction leaves two choices available: how to end a sector radially, and where to sample its direction. The same balance between radial enlargement and perpendicular projection permits curved caps, smaller fixed margins, and sectors centred at the sampling nodes. We continue to use

$ H = sqrt(2) \, #h(2em) K = { \( x \, y \, H s \) : 0 lt.eq s lt.eq 1 \, med \| x \| lt.eq 1 - s \, med \| y \| lt.eq s } \, #h(2em) d \( q \) = frac(q^2 + q^4, 16) . $

Thus $A_min \( K \) = H$. All the cylinders below are specified by an intercept set and a nonzero direction; their bases are the perpendicular projections of the intercept sets.

=== 5.1 A fixed positive margin <a-fixed-positive-margin>

The following criterion isolates what the angular construction uses. Continuity of the displaced boundaries chooses a sector, and a positive quadratic margin ensures that the two chosen radial caps cannot both fail. The partition may be nonuniform, and its number of intervals need not satisfy an upper bound.

#thm([Theorem 5.1.])[
  (Compatible boundaries and radial caps).  #emph[Let $tau > 0$ tend to zero through any set accumulating at zero. For each $tau$, choose a finite partition $- 1 = q_0 < dots.h.c < q_m = 1$, constants $alpha_j \, beta_j$, and positive continuous functions $R_j$ on $I_j = \[ q_(j - 1) \, q_j \]$. Suppose that $L \( q \) = alpha_j - q beta_j$ is continuous on $\[ - 1 \, 1 \]$ and $L \( - 1 \) = L \( 1 \) = 0$. Suppose also, uniformly for every $j$ and $q in I_j$, that 
#[#set math.equation(numbering: n => "(5.1)")
 $ beta_j & = q \/ 2 + O \( tau^2 \) \, & alpha_j & = \( 1 + q^2 \) \/ 4 + O \( tau^2 \) \,\
R_j \( q \) & = 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] d \( q \) + eta #scale(x: 120%, y: 120%)[\)] + O \( tau^4 \) \, &  & 0 < eta < 1 \/ 480 . $ <ext:coefficient-hypotheses>]

 Here $eta$ is fixed, and all error constants and their common range of validity are independent of $tau \, j \, q$. Define 
$ P_j^(-) & = { \( 0 \, q S \, H S \) : q in I_j \, med 0 lt.eq S lt.eq R_j \( q \) } \, & v_j^(-) & = \( 1 \, tau alpha_j \, H tau beta_j \) \,\
P_j^(+) & = { \( q T \, 0 \, H \( 1 - T \) \) : q in I_j \, med 0 lt.eq T lt.eq R_j \( q \) } \, & v_j^(+) & = \( - tau alpha_j \, 1 \, H tau beta_j \) . $

 For every sufficiently small admissible $tau$, the $2 m$ cylinders $P_j^(-) + bb(R) v_j^(-)$ and $P_j^(+) + bb(R) v_j^(+)$ cover the closed tetrahedron $K$. Their bases are compact, and their total area $C_tau$ satisfies 
#[#set math.equation(numbering: n => "(5.2)")
 $ C_tau / H = 1 / 2 + (2 eta - 1 / 240) tau^2 + O \( tau^4 \) . $ <ext:general-cost>]

 If each $R_j$ is constant, every base is a triangle. The threshold and error constant may depend on $eta$ and the uniform constants in the hypotheses, but not on $m$.]
] <ext:general-cap>

#proof[
  Fix $\( x \, y \, H s \) in K$. The continuous piecewise affine function $q mapsto q s + tau x L \( q \)$ has outer values $- s \, s$, which bracket $y$. Choose the first partition node after $q_0$ whose value is at least $y$. Its preceding value is at most $y$, by the initial endpoint inequality or by minimality. On the selected interval $I_j$, put
  $ S = s - tau x beta_j \, #h(2em) Y = y - tau x alpha_j . $
  The crossing inequalities say $q_(j - 1) S lt.eq Y lt.eq q_j S$, so $S gt.eq 0$. If $S = 0$, then $Y = 0$ and the selected cylinder already covers the point. Otherwise $Y = q S$ for some $q in I_j$. Applying the same argument to $p mapsto p \( 1 - s \) - tau y L \( p \)$ gives an interval $I_i$ and
  $ T = 1 - s + tau y beta_i gt.eq 0 \, #h(2em) X = x + tau y alpha_i = p T \, #h(2em) p in I_i . $
  Again $T = 0$ already gives coverage. It remains to exclude $S > R_j \( q \)$ and $T > R_i \( p \)$ simultaneously.
  Assume these failures. For sufficiently small $tau$, the fixed positive margin and the uniform cap error imply $S \, T > 1 \/ 2$. Since $S + T = 1 + tau \( y beta_i - x beta_j \) = 1 + O \( tau \)$, each equals $1 \/ 2 + O \( tau \)$. The intercept equations then give $y = q \/ 2 + O \( tau \)$ and $x = p \/ 2 + O \( tau \)$. Write $e_j = beta_j - q \/ 2$ and $e_i = beta_i - p \/ 2$. The same complementary radial balance as in the triangular construction now has explicit sampling errors:
  $ s - tau x y & = 1 / 2 + \( S - 1 / 2 \) \( 1 - tau x q \) - tau^2 x^2 alpha_j + tau x e_j \,\
1 - s + tau x y & = 1 / 2 + \( T - 1 / 2 \) \( 1 + tau y p \) - tau^2 y^2 alpha_i - tau y e_i . $
  These identities follow by substituting $y = q S + tau x alpha_j$ and $x = p T - tau y alpha_i$. Their left sides sum to one, and both factors multiplying the radial excesses are positive for small $tau$. Substitute the strict cap failures, divide by $tau^2$, and use $e_i \, e_j = O \( tau^2 \)$ to obtain
  $ 0 > d \( q \) + d \( p \) + 2 eta - x^2 alpha_j - y^2 alpha_i + O \( tau \) = 2 eta + frac(\( p^2 - q^2 \)^2, 16) + O \( tau \) . $
  The error is uniform. This is impossible for sufficiently small $tau$, proving coverage, including the boundary.
  The parametrizations of $P_j^(-)$ and $P_j^(+)$ have area Jacobians $H S$ and $H T$, respectively, and are one-to-one off their tips. Projection multiplies area in either intercept plane by $\[ 1 + tau^2 \( alpha_j^2 + 2 beta_j^2 \) \]^(- 1 \/ 2)$. Consequently
  $ C_tau / H = sum_j integral_(I_j) frac(R_j \( q \)^2, sqrt(1 + tau^2 \( alpha_j^2 + 2 beta_j^2 \))) thin d q . $
  Uniform expansion of the integrand gives
  $ 1 / 4 + tau^2 [d \( q \) + eta - 1 / 8 (frac(\( 1 + q^2 \)^2, 16) + q^2 / 2)] + O \( tau^4 \) . $
  The total angular length is two, so integration preserves the uniform fourth-order remainder regardless of the number of intervals. Finally
  $ integral_(- 1)^1 d \( q \) thin d q = 1 / 15 \, #h(2em) 1 / 8 integral_(- 1)^1 (frac(\( 1 + q^2 \)^2, 16) + q^2 / 2) d q = 17 / 240 \, $
  which proves (5.2). Each parameter domain is compact; its continuous image and perpendicular projection are compact as well. Projection is invertible between the intercept plane and the base plane, so a constant cap gives a nondegenerate triangle. ◻
]

=== 5.2 Triangular and curved apertures <ext:apertures>

For an ordinary interval $I = \[ l \, r \]$, use

#[#set math.equation(numbering: n => "(5.3)")
 $ alpha_I = frac(1 + l r, 4) \, #h(2em) beta_I = frac(l + r, 4) . $ <ext:ordinary-secants>]

The identity $alpha_I - q beta_I = \( 1 - q^2 \) \/ 4$ at both endpoints matches adjacent boundaries exactly. If the maximum interval length is at most $M tau^2$, for fixed $M$, then (5.1) holds uniformly. With $r_I = \( l + r \) \/ 2$, each of the following choices satisfies (5.1):

#[#set math.equation(numbering: n => "(5.4)")
 $ R_I \( q \) & = 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] d \( r_I \) + eta #scale(x: 120%, y: 120%)[\)] \, &  & upright("midpoint triangles") \,\
R_I \( q \) & = 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] max_(u in I) d \( u \) + eta #scale(x: 120%, y: 120%)[\)] \, &  & upright("maximum triangles") \,\
R_I \( q \) & = 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] d \( q \) + eta #scale(x: 120%, y: 120%)[\)] \, &  & upright("continuous radial caps") \,\
R_I \( q \) & = sqrt(1 / 4 + tau^2 #scale(x: 120%, y: 120%)[\(] d \( q \) + eta #scale(x: 120%, y: 120%)[\)]) \, &  & upright("squared-radius caps") . $ <ext:midpoint-cap>]

Indeed, $d$ has bounded derivative on $\[ - 1 \, 1 \]$, so replacing $d \( q \)$ by its midpoint value or its cell maximum costs $O \( tau^2 \)$ inside the parentheses. For (5.4), Taylor expansion at $1 \/ 4$ gives the required fourth-order error. Thus all four choices have the area formula (5.2). The first two give triangles; the last two give compact radial sectors.

Another choice specifies the radial enlargement through the transverse intercept. Put $D \( Y \) = Y^2 \/ 4 + Y^4$. For $b = 3 \/ 4$ or $b = 1$, retain the bounded aperture

#[#set math.equation(numbering: n => "(5.5)")
 $ 0 lt.eq S lt.eq b \, #h(2em) S lt.eq 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] D \( q S \) + eta #scale(x: 120%, y: 120%)[\)] . $ <ext:cartesian-aperture>]

For small $tau$, this is exactly $0 lt.eq S lt.eq R \( q \)$, where $R$ is continuous and satisfies (5.1). To verify this, consider $f \( S \) = S - 1 \/ 2 - tau^2 \( D \( q S \) + eta \)$ on $\[ 0 \, 1 \]$. Uniformly in $\| q \| lt.eq 1$,

$ f' \( S \) = 1 - tau^2 \( q^2 S \/ 2 + 4 q^4 S^3 \) gt.eq 1 - 9 / 2 tau^2 . $

For small $tau$, $f$ is strictly increasing, is negative at $1 \/ 2$, and is positive at $3 \/ 4$. Its unique zero $R \( q \)$ lies between these values and depends continuously on $q$. Its defining equation first gives $R \( q \) - 1 \/ 2 = O \( tau^2 \)$, and then

$ D \( q R \( q \) \) = D \( q \/ 2 \) + O \( tau^2 \) = d \( q \) + O \( tau^2 \) \, $

which proves the cap expansion. The outer bound in (5.5) is part of the definition: without it, the quartic inequality can admit a second, unbounded component.

The common conclusion is easiest to compare in the fixed tetrahedron $K$: for each fixed $0 < eta < 1 \/ 480$, every cap above has normalized total area (5.2). Its threshold is uniform over partitions whose maximum interval length is at most $M tau^2$, for a fixed $M$. For example, an equal partition with any integer $m gt.eq 2 \/ tau^2$ gives exactly $2 m$ cylinders, with the same threshold and error constant as the mesh is refined. Each cover is finite; no further limit in the number of cylinders is needed after choosing the tilt and mesh.

The squared-radius and Cartesian formulas also explain the geometry in two different ways. Appendix 7.1 compares the two radial squares, while Appendix 7.2 uses a discriminant to estimate the intercept height without locating the perturbed interface. These are alternative proofs of cases already covered by Theorem 8. Exact counts and costs for several rescaled parameter choices are collected in Appendix 8.

=== 5.3 Sampling at the endpoints <ext:endpoint-sectors>

The compatibility condition also permits directions sampled at nodes rather than along secants of each sector. Let $k > 1$ be an integer, $tau = 1 \/ k$, $n = k^2$, and $q_j = - 1 + 2 j \/ n$ for $0 lt.eq j lt.eq n$. Put $lambda_0 = - 1$, $lambda_(n + 1) = 1$, and $lambda_j = \( q_(j - 1) + q_j \) \/ 2$ for $1 lt.eq j lt.eq n$. Use the sectors $\[ lambda_j \, lambda_(j + 1) \]$ and parameters

$ beta_j = q_j \/ 2 \, #h(2em) alpha_j = \( 1 + q_j^2 \) \/ 4 \, #h(2em) R_j = 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] d \( q_j \) + 1 \/ 1000 #scale(x: 120%, y: 120%)[\)] . $

At an interior boundary, $alpha_j - alpha_(j - 1) = lambda_j \( beta_j - beta_(j - 1) \)$; at the exterior boundaries $alpha_j - lambda beta_j = 0$. Thus the piecewise affine boundary function is continuous and vanishes at both ends. Every angular point of the $j$th sector is within $tau^2$ of $q_j$, so all the hypotheses of Theorem 8 hold. There are $n + 1$ sectors, with widths $tau^2$ at the two ends and $2 tau^2$ in the interior. Consequently, for all sufficiently large $k$, this construction covers $K$ with exactly $2 \( k^2 + 1 \)$ triangular bases and normalized total area

#[#set math.equation(numbering: n => "(5.6)")
 $ frac(C_tau, A_min \( K \)) = 1 / 2 - 13 / 6000 tau^2 + O \( tau^4 \) . $ <ext:endpoint-cost>]

The half-width end sectors preserve the exact exterior boundaries. Appendix 7.3 gives a complementary radial identity that verifies their coverage directly, and Appendix 8.2 records the corresponding absolute area at edge length $sqrt(2)$.

== 6 A vanishing radial margin <sec:angular-cubic>

For a fixed positive margin, the normalized area coefficient is $2 eta - 1 \/ 240$. We now let the margin tend to zero with the tilt and obtain the coefficient $- 1 \/ 240$ in a single family of finite triangular covers. The extra radial enlargement is cubic in the tilt. Its positive cubic area term explains why coverage persists on a much wider interval than the interval on which we prove a saving.

The fixed-margin theorem, Theorem 8, cannot be applied uniformly when $eta$ tends to zero. Instead we use the explicit coverage budget in Corollary 5 and the uniform area estimate in Corollary 7. We keep the edge-two tetrahedron $K$ and the same slope coordinates.

#thm([Proposition 6.1.])[
  #emph[For every $0 < tau lt.eq 1$, the tetrahedron $K$ admits a cover by $2 ceil.l 8 \/ tau^2 ceil.r$ cylinders with compact, nondegenerate triangular perpendicular bases. Their total base area $C_tau$ satisfies 
#[#set math.equation(numbering: n => "(6.1)")
 $ lr(|C_tau / H - 1 / 2 + tau^2 / 240 - 25 / 2 tau^3|) lt.eq 2 tau^4 #h(2em) \( 0 < tau lt.eq 1 \/ 50 \) . $ <eq:angular-cubic-cost>]

 In particular, $C_tau < A_min \( K \) \/ 2$ for $0 < tau lt.eq 1 \/ 4000$, and 
$ frac(C_tau, A_min \( K \)) = 1 / 2 - tau^2 / 240 + O \( tau^3 \) #h(2em) \( tau arrow.b 0 \) . $

]
] <prop:angular-cubic>

#proof[
  Put
  $ N = ⌈8 / tau^2⌉ \, #h(2em) Delta = 2 / N lt.eq tau^2 / 4 \, #h(2em) q_j = - 1 + j Delta quad \( 0 lt.eq j lt.eq N \) . $
  Use the secant coefficients (2.2), and set
  #[#set math.equation(numbering: n => "(6.2)")
   $ d_j = max_(q_j lt.eq q lt.eq q_(j + 1)) d \( q \) \, #h(2em) T_j = 1 / 2 + tau^2 d_j + 25 / 4 tau^3 #h(2em) \( 0 lt.eq j < N \) . $ <eq:cubic-caps>]
  The intercept triangles and directions are (2.6)–(2.6), with $epsilon$ replaced by $tau$ and these cutoffs. They give exactly $2 N$ cylinders. Their intercept triangles have positive area, and the normal component of each axis is one, so their perpendicular bases are compact nondegenerate triangles as before.
  #emph[Coverage.] For $0 < tau lt.eq 1 \/ 2$, take $eta = 25 tau \/ 4$ in Corollary 5. Its sufficient budget is
  $ 2 eta - \( 2 + 2 eta \) tau - tau^2 / 4 = tau (21 / 2 - 51 / 4 tau) gt.eq 33 / 8 tau > 0 . $
  Thus the cylinders cover $K$ throughout this range.
  For $1 \/ 2 lt.eq tau lt.eq 1$, the enlarged triangles are already large enough for the first family alone. Indeed, for $\( x \, y \, H t \) in K$ the first-crossing argument selects a first-family sector with intercept height
  $ 0 lt.eq t_0 = t - tau x beta_j lt.eq t + tau / 2 \| x \| lt.eq t + tau / 2 \( 1 - t \) lt.eq 1 . $
  Its cutoff obeys $T_j gt.eq 1 \/ 2 + \( 25 \/ 4 \) tau^3 gt.eq 41 \/ 32 > 1$. The selected cylinder therefore contains the point. Both arguments use non-strict angular membership conditions, so they cover the closed body, including its boundary.
  #emph[Area.] For $0 < tau lt.eq 1 \/ 50$, the margin $eta = 25 tau \/ 4$ lies in $\[ 0 \, 1 \/ 8 \]$. Corollary 7 consequently gives
  $ lr(|C_tau / H - 1 / 2 - (25 / 2 tau - 1 / 240) tau^2|) lt.eq 2 tau^4 \, $
  which is (6.1). This application is uniform although the margin varies with the tilt. If $0 < tau lt.eq 1 \/ 4000$, then
  $ 25 / 2 tau + 2 tau^2 lt.eq 1 / 320 + frac(1, 8 \, 000 \, 000) < 1 / 240 . $
  The negative quadratic term therefore exceeds both the positive cubic term and the error, giving $C_tau < H \/ 2 = A_min \( K \) \/ 2$. ◻
]

The equivalent edge-four construction, with its full coverage interval, exact cylinder count and scaled area estimates, is recorded in Remark 10 of Appendix 8.

== 7 Alternative coverage and area calculations <ext:alternate-estimates>

The fixed-margin criterion already proves coverage for the cap choices in Section 5. The following direct calculations explain three particular features: why squared-radius caps suit a comparison of radial squares, how a Cartesian discriminant avoids locating the perturbed interface, and how node-centred sectors retain the complementary radial cancellation. They are independent explanations of those cases, rather than inputs to the main construction or the vanishing-margin argument.

=== 7.1 Squared radii <ext:squared-direct>

Let $n$ be a positive integer, put $k = 1 \/ n$, use $n^2$ equal intervals, and write their width as $Delta = 2 k^2$. Put

$ M_I = \( l + r \) \/ 2 = 2 beta_I \, #h(2em) B_I = \( 1 + l r \) \/ 2 = 2 alpha_I \, #h(2em) f \( q \) = \( q^2 + q^4 \) \/ 4 . $

The squared-radius cap (5.4), with $tau = 2 k$ and $eta = 1 \/ 960$, is $R \( q \)^2 = 1 \/ 4 + k^2 \( f \( q \) + 1 \/ 240 \)$. The elementary secant identity is exact:

#[#set math.equation(numbering: n => "(7.1)")
 $ 2 B_I - M_I^2 = 1 - Delta^2 / 4 . $ <ext:squared-identity>]

For the two angularly selected intercepts, write

$ S = s - k x M_I \, #h(2em) y = q S + k x B_I \, #h(2em) T = 1 - s + k y M_J \, #h(2em) x = p T - k y B_J . $

The crossing argument supplies $S \, T gt.eq 0$. If both radial caps fail, then $S \, T > 1 \/ 2$ and $u = s - 1 \/ 2 = O \( k \)$. Since $M_I = q + O \( k^2 \)$ and $M_J = p + O \( k^2 \)$, substitution in

$ S^2 = s^2 - 2 k x S M_I - k^2 x^2 M_I^2 \, #h(2em) T^2 = \( 1 - s \)^2 + 2 k y T M_J - k^2 y^2 M_J^2 $

and use of (7.1) give the uniform expansions

#[#set math.equation(numbering: n => "(7.2)")
 $ S^2 & = 1 / 4 + u + u^2 - 2 k x y + k^2 x^2 + O \( k^3 \) \,\
T^2 & = 1 / 4 - u + u^2 + 2 k x y + k^2 y^2 + O \( k^3 \) . $ <ext:squared-expansions>]

For example $S M_I = y - k x B_I + O \( k^2 \)$, and the second identity uses $T M_J = x + k y B_J + O \( k^2 \)$. Since $\| M_I \| \, \| M_J \| lt.eq 1$, the failures $S \, T > 1 \/ 2$ first give $\| u \| lt.eq k$. The first strict lower bound on $S^2$ then gives $u - 2 k x y gt.eq - C k^2$, and the second gives $u - 2 k x y lt.eq C k^2$, for a uniform constant $C$. Thus $u = 2 k x y + O \( k^2 \)$. Adding (7.2) now yields

$ frac(S^2 + T^2 - 1 \/ 2, k^2) = x^2 + y^2 + 8 x^2 y^2 + O \( k \) . $

On the other hand $q = 2 y + O \( k \)$ and $p = 2 x + O \( k \)$, so

$ f \( q \) + f \( p \) = x^2 + y^2 + 4 \( x^4 + y^4 \) + O \( k \) gt.eq x^2 + y^2 + 8 x^2 y^2 + O \( k \) . $

The failed caps require the previous quotient to exceed $f \( q \) + f \( p \) + 2 \/ 240$, a contradiction for small $k$.

Let $C_k$ denote the sum of the perpendicular base areas of all $2 n^2$ cylinders. The two families have equal total area, and the square in the cap makes the radial integration exact before the projection factor is expanded:

$ frac(C_k, 2 H) = sum_I integral_I frac(1 / 2 \[ 1 / 4 + k^2 \( f \( q \) + 1 \/ 240 \) \], sqrt(1 + k^2 \( B_I^2 + 2 M_I^2 \))) thin d q = 1 / 4 + k^2 (1 / 240 - 1 / 120) + O \( k^4 \) . $

The squared cap therefore supplies both the coverage comparison and the exact radial part of the area integral.

=== 7.2 A Cartesian discriminant <ext:cartesian-direct>

For an equal sector $I = \[ l \, r \]$ of width $Delta$, the coefficients (5.3) satisfy

$ beta_I^2 - alpha_I + 1 \/ 4 = Delta^2 \/ 16 . $

Suppose the angular crossing for one family has given

$ S = T - delta beta_I gt.eq 0 \, #h(2em) Y_0 = Y - delta alpha_I \, #h(2em) l S lt.eq Y_0 lt.eq r S . $

Here $\( T \, Y \, delta \) = \( s \, y \, tau x \)$ in the first family and $\( 1 - s \, x \, - tau y \)$ in the second. Because $2 beta_I$ is the sector midpoint, $\| 2 beta_I S - Y_0 \| lt.eq Delta S \/ 2$. Consequently

#[#set math.equation(numbering: n => "(7.3)")
 $ Q & := T^2 - delta Y + delta^2 \/ 4\
 & = S^2 + delta \( 2 beta_I S - Y_0 \) + delta^2 Delta^2 \/ 16 gt.eq \( S - \| delta \| Delta \/ 4 \)^2 . $ <ext:cartesian-discriminant>]

In particular $sqrt(Q) gt.eq S - \| delta \| Delta \/ 4$. Take the Cartesian cap (5.5) with $b = 1$, fixed $eta > 0$, and $Delta = O \( tau^2 \)$. Since $0 lt.eq alpha_I lt.eq 1 \/ 2$, $\| Y \| lt.eq 1$ and $\| delta \| lt.eq tau$, we have $\| Y_0 \| lt.eq 1 + tau \/ 2$. For $tau lt.eq 1$, this gives $D \( Y_0 \) lt.eq D \( 3 \/ 2 \) = 45 \/ 8$. Hence the polynomial upper bound is less than one whenever $tau^2 \( 45 \/ 8 + eta \) < 1 \/ 2$. Failure of the selected cylinder therefore implies $S > 1 \/ 2 + tau^2 \( D \( Y_0 \) + eta \)$ even if the outer bound $S lt.eq 1$ failed. Since $Y_0 = Y + O \( tau \)$ and $\| delta \| Delta = O \( tau^3 \)$, (7.3) gives

$ sqrt(Q) > 1 / 2 + tau^2 #scale(x: 120%, y: 120%)[\(] D \( Y \) + eta \/ 2 #scale(x: 120%, y: 120%)[\)] $

for sufficiently small $tau$, uniformly in both families. If both failed, squaring these positive lower bounds and discarding their nonnegative fourth-order terms would give

$ s^2 & > 1 / 4 + tau x y + tau^2 #scale(x: 120%, y: 120%)[\(] D \( y \) + eta \/ 2 - x^2 \/ 4 #scale(x: 120%, y: 120%)[\)] \,\
\( 1 - s \)^2 & > 1 / 4 - tau x y + tau^2 #scale(x: 120%, y: 120%)[\(] D \( x \) + eta \/ 2 - y^2 \/ 4 #scale(x: 120%, y: 120%)[\)] . $

The right sides are positive for small $tau$. Expanding their square roots with $sqrt(1 \/ 4 + v) = 1 \/ 2 + v - v^2 + O \( v^3 \)$ shows that their sum is

$ 1 + tau^2 #scale(x: 120%, y: 120%)[\(] D \( x \) + D \( y \) + eta - \( x^2 + y^2 \) \/ 4 - 2 x^2 y^2 #scale(x: 120%, y: 120%)[\)] + O \( tau^3 \) = 1 + tau^2 #scale(x: 120%, y: 120%)[\(] \( x^2 - y^2 \)^2 + eta #scale(x: 120%, y: 120%)[\)] + O \( tau^3 \) > 1 \, $

contradicting $s + \( 1 - s \) = 1$.

For either outer bound $b in { 3 \/ 4 \, 1 }$, the Cartesian aperture admits a direct area calculation without changing to angular variables at the boundary. In the intercept coordinates $\( Y \, S \)$, put

$ cal(D)_tau = { 0 lt.eq S lt.eq b \, med \| Y \| lt.eq S \, med S lt.eq 1 \/ 2 + tau^2 \( D \( Y \) + eta \) } \, #h(2em) cal(D)_0 = { 0 lt.eq S lt.eq 1 \/ 2 \, med \| Y \| lt.eq S } . $

For $\| Y \| lt.eq 1 \/ 2$ the added vertical length is exactly $tau^2 \( D \( Y \) + eta \)$ for small $tau$. Each remaining side region has both width and height $O \( tau^2 \)$, because $1 \/ 2 < \| Y \| lt.eq S lt.eq 1 \/ 2 + O \( tau^2 \)$ there. Thus

$ \| cal(D)_tau \| = 1 / 4 + tau^2 integral_(- 1 \/ 2)^(1 \/ 2) \( D \( Y \) + eta \) thin d Y + O \( tau^4 \) . $

Expanding the projection factor over $cal(D)_0$, and using $Y = q S$ in its quadratic coefficient, gives the one-family cost

$ 1 / 4 + tau^2 [underbrace(integral_(- 1 \/ 2)^(1 \/ 2) D \( Y \) thin d Y, 1 \/ 30) + eta - underbrace(1 / 2 integral_0^(1 \/ 2) S thin d S integral_(- 1)^1 (frac(\( 1 + q^2 \)^2, 16) + q^2 / 2) d q, 17 \/ 480)] + O \( tau^4 \) . $

Here the cost is divided by $H$ in the edge-two normalization. The replacement of $cal(D)_tau$ by $cal(D)_0$ changes the quadratic coefficient by $O \( tau^2 \)$, and the coefficient sampling error is also $O \( tau^2 \)$; both contribute only $O \( tau^4 \)$ to the area. Thus the normalized two-family cost is $1 \/ 2 + \( 2 eta - 1 \/ 240 \) tau^2 + O \( tau^4 \)$, as in (5.2). The Cartesian entries in Appendix 8 follow by substitution; the edge-one discriminant and aperture are translated there as well.

=== 7.3 A direct check for node-centred sectors <ext:endpoint-direct>

Use the node-centred sectors of Section 5.3, and write their tilt as $t = 1 \/ k$. The radial cutoff at a sample node $q$ is $1 \/ 2 + t^2 \( d \( q \) + 1 \/ 1000 \)$, and each angular point of its sector lies within $t^2$ of $q$. If the two selected sample nodes are $q \, p$, write

$ S = s - t x q \/ 2 \, quad y = q S + t x alpha \( q \) + e \, #h(2em) T = 1 - s + t y p \/ 2 \, quad x = p T - t y alpha \( p \) + e_(*) \, $

where $\| e \| lt.eq S t^2$, $\| e_(*) \| lt.eq T t^2$, and $alpha \( q \) = \( 1 + q^2 \) \/ 4$. Direct substitution gives

$ s - t x y & = 1 / 2 + \( S - 1 / 2 \) \( 1 - t q x \) - t^2 alpha \( q \) x^2 - t x e \,\
1 - s + t x y & = 1 / 2 + \( T - 1 / 2 \) \( 1 + t p y \) - t^2 alpha \( p \) y^2 + t y e_(*) . $

If both radial caps failed along a sequence $t arrow.r 0$, then $S \, T > 1 \/ 2$ and $S + T = 1 + t \( y p - x q \) \/ 2 = 1 + O \( t \)$, so $S \, T arrow.r 1 \/ 2$. Passing to a subsequence with $q arrow.r q_0$, $p arrow.r p_0$ gives $y arrow.r q_0 \/ 2$, $x arrow.r p_0 \/ 2$, while $e \/ t \, e_(*) \/ t arrow.r 0$. Adding the identities and dividing by $t^2$ would therefore imply

$ 0 gt.eq 2 / 1000 + frac(\( q_0^2 - p_0^2 \)^2, 16) > 0 . $

This complementary identity gives a second explanation for why the half-width endpoint sectors still cover the boundary.

== 8 Counts and formulas under changes of scale <ext:scaling-specializations>

The constructions in the main text use the edge-two tetrahedron $K$. A similarity of ratio $a \/ 2$ produces a regular tetrahedron of edge length $a$: it multiplies every base area and the minimum projection area by $\( a \/ 2 \)^2$, while preserving the number of cylinders and the normalized cost. This appendix records several parameter choices and their coordinate dictionaries.

=== 8.1 Secant sectors <ext:secant-specializations>

In the following table, every row uses an equal partition with $m$ intervals and hence exactly $2 m$ cylinders. The body has edge length $a$ and is obtained from $K$ by a similarity of ratio $a \/ 2$; accordingly the area is reported as $C \/ A_min$. Each statement holds for all sufficiently large indicated integers or all sufficiently small indicated positive real parameters. Every displayed remainder is fourth order in the displayed tilt parameter, uniformly over the permitted finer meshes.

#[
  #set par(justify: false)
#table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Cap
], table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$\( tau \, eta \)$
], table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[$C \/ A_min$
]),
  table.cell(rowspan: 1, colspan: 1)[Midpoint
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \/ n \, 1 \/ 1920 \)$
], table.cell(rowspan: 1, colspan: 1)[$2 n^2$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - frac(1, 80 n^2) + O \( n^(- 4) \)$
],
  table.cell(rowspan: 1, colspan: 1)[Midpoint
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$\( alpha \, 1 \/ 1000 \)$
], table.cell(rowspan: 1, colspan: 1)[$ceil.l alpha^(- 2) ceil.r$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - 13 / 6000 alpha^2 + O \( alpha^4 \)$
],
  table.cell(rowspan: 1, colspan: 1)[Midpoint
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \/ n \, 1 \/ 1000 \)$
], table.cell(rowspan: 1, colspan: 1)[$n^2$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - frac(13, 6000 n^2) + O \( n^(- 4) \)$
],
  table.cell(rowspan: 1, colspan: 1)[Continuous
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( c \, 1 \/ 1000 \)$
], table.cell(rowspan: 1, colspan: 1)[any $m gt.eq 2 \/ c^2$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - 13 / 6000 c^2 + O \( c^4 \)$
],
  table.cell(rowspan: 1, colspan: 1)[Squared radius
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \/ n \, 1 \/ 960 \)$
], table.cell(rowspan: 1, colspan: 1)[$n^2$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - frac(1, 120 n^2) + O \( n^(- 4) \)$
],
  table.cell(rowspan: 1, colspan: 1)[Maximum
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \/ \( 4 n \) \, 1 \/ 960 \)$
], table.cell(rowspan: 1, colspan: 1)[$n^2$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - frac(1, 7680 n^2) + O \( n^(- 4) \)$
],
  table.cell(rowspan: 1, colspan: 1)[Cartesian, $b = 3 \/ 4$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(2)$
], table.cell(rowspan: 1, colspan: 1)[$\( lambda \/ 2 \, 1 \/ 960 \)$
], table.cell(rowspan: 1, colspan: 1)[$ceil.l sqrt(2) \/ lambda^2 ceil.r$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - lambda^2 / 1920 + O \( lambda^4 \)$
],
  table.cell(rowspan: 1, colspan: 1)[Cartesian, $b = 1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \/ \( 2 n \) \, 1 \/ 1000 \)$
], table.cell(rowspan: 1, colspan: 1)[$n^2$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 - frac(13, 24000 n^2) + O \( n^(- 4) \)$
],
)
]

The table follows by substitution in (5.2); in each row the mesh is bounded by a fixed multiple of $tau^2$. For the continuous cap, $m = ceil.l 2 \/ c^2 ceil.r$ gives the ceiling count, whereas $c = 1 \/ n$ permits every integer $m gt.eq 2 n^2$, with the same threshold and error constant. The real-parameter midpoint row includes the reciprocal-integer construction after dilation by two. For the squared-radius row, the two families have equal area and each costs $H \[ 1 \/ 4 + \( 1 \/ 240 - 1 \/ 120 \) n^(- 2) + O \( n^(- 4) \) \]$. For the first Cartesian row, either family costs $c_0 \/ 4 - c_0 lambda^2 \/ 3840 + O \( lambda^4 \)$ with $c_0 = 1 \/ sqrt(2)$. These are genuine finite covers: the positive margin is fixed first, then a sufficiently small tilt and the specified finite mesh are chosen. No further limit in the number of cylinders is needed.

=== 8.2 Node-centred sectors at edge length $sqrt(2)$ <ext:endpoint-scaled>

For the endpoint construction of Section 5.3, write $t = 1 \/ k$. Its $2 \( k^2 + 1 \)$ cylinders retain that exact count under scaling. At edge length $sqrt(2)$, the similarity ratio is $1 \/ sqrt(2)$ and the minimum projection area is $H \/ 2 = 1 \/ sqrt(2)$. Multiplying (5.6) by this area gives total base area

#[#set math.equation(numbering: n => "(8.1)")
 $ 2 / sqrt(2) (1 / 4 - 13 / 12000 t^2 + O \( t^4 \)) . $ <ext:endpoint-scaled-cost>]

=== 8.3 The Cartesian discriminant at edge length one <ext:cartesian-edge-one>

The following dictionary translates the Cartesian argument of Appendix 7.2. In its edge-two coordinates, $\( x \, y \, H s \)$ is the point of $K$, $Y_0$ is the transverse intercept, $S$ is its radial height, and $T$ is $s$ or $1 - s$ in the respective family. The discriminant is (7.3). At edge-one scale, writing the point as $\( x_1 \, y_1 \, s \/ sqrt(2) \)$ and putting $tau = epsilon \/ 2$, the substitutions $x = 2 x_1$, $y = 2 y_1$, $eta = 1 \/ 1000$ give the equivalent obstruction $epsilon^2 \[ 4 \( x_1^2 - y_1^2 \)^2 + 1 \/ 4000 \] + O \( epsilon^3 \)$. In these coordinates, put $\( Y_1 \, delta \) = \( y_1 \, epsilon x_1 \)$ or $\( x_1 \, - epsilon y_1 \)$ in the two families. The transverse intercept is $b_1 = Y_0 \/ 2 = Y_1 - delta alpha_I \/ 2$. For $S > 0$, write $q = Y_0 \/ S$. The edge-one slope coordinate is $q_1 = b_1 \/ S = q \/ 2$, whose sector has width $d_1 = Delta \/ 2$. The same discriminant is $Q = T^2 - 2 delta Y_1 + delta^2 \/ 4$, and its bound is $sqrt(Q) gt.eq S - \| delta \| d_1 \/ 2$. Writing $F \( v \) = v^2 \/ 4 + 4 v^4$, the corresponding bounded aperture is

$ 0 lt.eq S lt.eq 1 \, #h(2em) l / 2 S lt.eq b_1 lt.eq r / 2 S \, #h(2em) S lt.eq 1 \/ 2 + epsilon^2 \( F \( b_1 \) + 1 \/ 4000 \) . $

The outer bound $S lt.eq 1$ remains part of the definition after scaling.

=== 8.4 The cubic buffer at edge length four <ext:cubic-edge-four>

#prodef([Remark 8.1.])[
  (The edge-four normalization).  The similarity
  $ \( x \, y \, H t \) mapsto \( 2 x \, 2 y \, H \( 2 t - 1 \) \) $
  sends $K$ onto the regular edge-four tetrahedron
  $ K_4 = { \( x \, y \, H z \) : - 1 lt.eq z lt.eq 1 \, quad \| x \| lt.eq 1 - z \, quad \| y \| lt.eq 1 + z } . $
  It multiplies every area by four and leaves the cylinder count unchanged. Writing $epsilon = tau \/ 2$, the same cover has $N = ceil.l 2 \/ epsilon^2 ceil.r$ sectors in each family. On a sector $I = \[ l \, r \]$, write $T_I$ for its cutoff in (6.2), and put
  $ a_I = 2 alpha_I = frac(1 + l r, 2) \, #h(2em) b_I = 2 beta_I = frac(l + r, 2) \, #h(2em) D_I = max_(q in I) frac(q^2 + q^4, 2) = 8 max_(q in I) d \( q \) . $
  The two axes are $\( 1 \, epsilon a_I \, H epsilon b_I \)$ and $\( - epsilon a_I \, 1 \, H epsilon b_I \)$. Their radial intercept coordinates are $1 + z$ and $1 - z$, with common cutoff
  $ 2 T_I = 1 + delta_I \, #h(2em) delta_I = epsilon^2 D_I + 100 epsilon^3 . $
  Thus these $2 ceil.l 2 \/ epsilon^2 ceil.r$ triangular cylinders cover $K_4$ for every $0 < epsilon lt.eq 1 \/ 2$. Since $A_min \( K_4 \) = 4 H$, their total area $S_epsilon = 4 C_(2 epsilon)$ satisfies
  $ S_epsilon = 2 sqrt(2) - sqrt(2) / 15 epsilon^2 + O \( epsilon^3 \) \, $
  and is strictly below $A_min \( K_4 \) \/ 2$ for $0 < epsilon lt.eq 1 \/ 8000$. More precisely,
  $ lr(|S_epsilon / H - 2 + epsilon^2 / 15 - 400 epsilon^3|) lt.eq 128 epsilon^4 #h(2em) \( 0 < epsilon lt.eq 1 \/ 100 \) . $
  The full coverage interval and the smaller sufficient saving interval remain distinct under this similarity.
] <rem:angular-cubic-scale>


#bibliography("refs.bib", style: "ieee", title: [References])
