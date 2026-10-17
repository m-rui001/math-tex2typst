#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

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

$ sum_(i = 1)^m \| B_i \| gt.eq 1 / 2 A_min \( K \) . quad "(1.1)" $ <eq:conjectured-bound>

The cylinder question belongs to the line of covering problems that begins with Tarski’s plank problem. A #emph[plank] is the region between two parallel hyperplanes, and its width is their distance. Bang proved that a finite plank covering of a convex body has total width at least the body’s minimum width #cite(label("Bang1951")); see also #cite(label("Bezdek2009")) Theorem 2.1. Ball proved the directionwise refinement for centrally symmetric bodies: after dividing each plank’s width by the body’s width in the same normal direction, the sum is at least one #cite(label("Ball1991")) arXiv v1, Theorem 1. Thus the width cost of a plank cover has both an absolute formulation and a relative formulation adapted to the individual directions.

For cylinders in three dimensions, the two-cylinder cover of a regular tetrahedron shows that replacing widths by base areas cannot preserve the constant one. Its two axes are parallel to opposite edges, and its total base area equals half the tetrahedron’s minimum projection area. Bezdek #cite(label("Bezdek2009")) Problem 3.1 and Bezdek and Litvak #cite(label("BL2009")) arXiv v1, Introduction attribute this example and the resulting half-area question to Bang’s 1951 paper. Their formulations allow measurable bases perpendicular to the axes, as in our definition.

For a finite covering $cal(C) = \( B_i + bb(R) u_i \)_(i = 1)^m$, define the #emph[directionwise relative area] by

$ cal(R) \( cal(C) \; K \) := sum_(i = 1)^m frac(\| B_i \|, \| pi_(u_i^perp) K \|) . quad "(1.2)" $ <eq:relative-cost>

All denominators are positive because $K$ has nonempty interior. Bezdek and Litvak proved $cal(R) \( cal(C) \; K \) gt.eq 1 \/ 3$ for every finite covering in three dimensions, and the stronger bound $cal(R) \( cal(C) \; K \) gt.eq 1$ when $K$ is an ellipsoid. In their proof, the general case combines the Rogers–Shephard section–projection inequality with a volume comparison. For ellipsoids, they reduce to a ball and use a density whose integral along every interior chord is the same #cite(label("BL2009")) arXiv v1, Theorem 3.1 and its proof. These arguments leave a gap between the universal one-third lower bound and the proposed one-half threshold.

Bezdek and Khan record the directionwise assertion $cal(R) \( cal(C) \; K \) gt.eq 1 \/ 2$ under the name #emph[1-Codimensional Cylinder Covering Conjecture] #cite(label("BK2016")) arXiv v2, Definition 3 and Conjecture 4.13. It would imply (1.1), since

$ cal(R) \( cal(C) \; K \) lt.eq frac(sum_i \| B_i \|, A_min \( K \)) . quad "(1.3)" $ <eq:cost-comparison>

Verreault’s 2026 survey records the half-area question as unresolved #cite(label("Verreault2026")) Question 4.14. Our construction starts with the tetrahedral equality example itself and replaces its two axes by finitely many nearby directions. It violates both half-area bounds while retaining compact triangular bases.

We construct a counterexample with compact triangular bases. Set $H = sqrt(2)$ and

$ K = { \( x \, y \, H t \) : 0 lt.eq t lt.eq 1 \, med \| x \| lt.eq 1 - t \, med \| y \| lt.eq t } . quad "(1.4)" $ <eq:tetrahedron>

Its vertices are $\( plus.minus 1 \, 0 \, 0 \)$ and $\( 0 \, plus.minus 1 \, H \)$, so it is a regular tetrahedron of edge length $2$.

#thm([Theorem 1.1.])[
  #emph[The tetrahedron (1.4) has $A_min \( K \) = sqrt(2)$. For every $0 < epsilon lt.eq 1 \/ 2000$, it admits a covering by $m = 2 ceil.l 2 \/ epsilon^2 ceil.r$ cylinders with compact triangular perpendicular bases such that 
$ 1 / sqrt(2) sum_(i = 1)^m \| B_i \| = 1 / 2 - 13 / 6000 epsilon^2 + O \( epsilon^4 \) . quad "(1.5)" $ <eq:main-asymptotic>

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

$ eta = 1 / 1000 \, #h(2em) n = ⌈2 / epsilon^2⌉ \, #h(2em) Delta = 2 / n \, #h(2em) q_j = - 1 + j Delta quad \( 0 lt.eq j lt.eq n \) . quad "(2.1)" $ <eq:parameters>

In particular $Delta lt.eq epsilon^2$. To make adjacent tilted sectors meet, prescribe the displacement of the boundary with angular parameter $q$ by

$ phi.alt \( q \) = frac(1 - q^2, 4) #h(2em) \( - 1 lt.eq q lt.eq 1 \) . $

The endpoint values $phi.alt \( - 1 \) = phi.alt \( 1 \) = 0$ will keep the outer angular sides in the fixed planes $y = - t$ and $y = t$. For real $alpha \, beta$, the lines with direction $\( 1 \, epsilon alpha \, H epsilon beta \)$ through the points $\( 0 \, q t_0 \, H t_0 \)$, $t_0 gt.eq 0$, lie in the plane

$ y = q t + epsilon x \( alpha - q beta \) . $

Thus neighboring angular sides will lie in the same plane if both axes use the value $phi.alt \( q \)$ there. On the interval $\[ q_j \, q_(j + 1) \]$, solve the two endpoint equations $alpha_j - q beta_j = phi.alt \( q \)$. This gives

$ alpha_j = frac(1 + q_j q_(j + 1), 4) \, #h(2em) beta_j = frac(q_j + q_(j + 1), 4) #h(2em) \( 0 lt.eq j < n \) \, quad "(2.2)" $ <eq:axis-coefficients>

and hence the exact matching identities

$ alpha_j - q beta_j = frac(1 - q^2, 4) #h(2em) \( q = q_j upright(" or ") q = q_(j + 1) \) . quad "(2.3)" $ <eq:shared-boundaries>

The choice of parabola also anticipates the radial estimate. At zero tilt, the ray of slope $q$ meets the middle section at $y = q \/ 2$. The lower intercept height $t_0 = t - epsilon x beta_j$ should have first-order shift $- epsilon x y$. This suggests $beta_j tilde.eq q \/ 2$. The endpoint equations make $beta_j$ the negative secant slope of $phi.alt$, so their limiting relation is $phi.alt' \( q \) = - q \/ 2$. Together with the two endpoint conditions, this gives $phi.alt \( q \) = \( 1 - q^2 \) \/ 4$. The finite identities above, rather than this motivation, will be used in the proof.

We also enlarge each sector slightly beyond its original radial cutoff $1 \/ 2$. Define

$ d \( q \) = frac(q^2 \( 1 + q^2 \), 16) \, #h(2em) M_j = eta + max_(q_j lt.eq q lt.eq q_(j + 1)) d \( q \) \, #h(2em) T_j = 1 / 2 + epsilon^2 M_j . quad "(2.4)" $ <eq:cutoffs>

The function $d$ bounds the quadratic loss in the overlap of the two families; its role is made explicit in the coverage argument below. For later estimates, note that

$ 0 lt.eq alpha_j lt.eq 1 / 2 \, #h(2em) \| beta_j \| lt.eq 1 / 2 \, #h(2em) eta lt.eq M_j lt.eq 1 / 8 + eta . quad "(2.5)" $ <eq:coefficient-bounds>

Our intercept triangles and direction vectors are

$ P_j & = { \( 0 \, y_0 \, H t_0 \) : 0 lt.eq t_0 lt.eq T_j \, med q_j t_0 lt.eq y_0 lt.eq q_(j + 1) t_0 } \, & v_j & = \( 1 \, epsilon alpha_j \, H epsilon beta_j \) \,\
Q_j & = { \( x_0 \, 0 \, H \( 1 - s_0 \) \) : 0 lt.eq s_0 lt.eq T_j \, med q_j s_0 lt.eq x_0 lt.eq q_(j + 1) s_0 } \, & w_j & = \( - epsilon alpha_j \, 1 \, H epsilon beta_j \) . quad "(2.6)" $ <eq:first-family>

Use the $2 n$ cylinders

$ P_j + bb(R) v_j \, #h(2em) Q_j + bb(R) w_j #h(2em) \( 0 lt.eq j < n \) . $

To express them with perpendicular bases, project each intercept triangle onto the linear plane perpendicular to its direction and normalize that direction. Projection along the axis does not change the cylinder: $P + bb(R) v = pi_(v^perp) P + bb(R) v$. Moreover, it is injective on either intercept plane because the corresponding normal component of $v_j$ or $w_j$ is $1$. Thus each actual base is a compact nondegenerate triangle, with finite area.

Figure 1 shows the original covering and the angular matching after the tilt. In a fixed plane $x = X$, the neighboring sectors start at different translated vertices $V_i = \( epsilon X alpha_i \, epsilon X beta_i \)$ in $\( y \, t \)$ coordinates, but their sides at a shared value of $q$ lie on the same line. Thus the matching concerns the supporting planes of the sides; the radial extents still have to be checked.

#figure(
  [#strong[(a)] The zero-tilt geometry, $epsilon = 0$
  #cetz.canvas({
  import cetz.draw: *
  line((-5.991, 1.331), (5.991, -1.331), (3.162, 11.15), (-3.162, 8.154), close: true, fill: rgb("#f7f7f7"))
  line((-5.991, 1.331), (3.162, 11.15), stroke: (paint: rgb("#8c8c8c")))
  line((-4.576, 4.743), (1.414, 3.411), (4.576, 4.909), (-1.414, 6.24), close: true, fill: rgb("#e8e8ff"))
  line((-4.576, 4.743), (1.414, 3.411), (4.576, 4.909), (-1.414, 6.24), close: true, stroke: (paint: rgb("#737373")))
  line((-5.991, 1.331), (-3.162, 8.154), (3.162, 11.15), (5.991, -1.331), (5.991, -1.331), (-3.162, 8.154), close: true, stroke: (paint: rgb("#595959")))
  line((-5.991, 1.331), (5.991, -1.331), stroke: (paint: rgb("#0000a6")))
  line((-3.162, 8.154), (3.162, 11.15), stroke: (paint: rgb("#cc8400")))
  line((-3.731, 2.732), (3.098, 1.215), stroke: (paint: rgb("#0000a6")), mark: (end: ">"))
  line((-2.26, 4.1), (2.892, 2.955), stroke: (paint: rgb("#0000a6")), mark: (end: ">"))
  line((-1.171, 6.556), (2.37, 8.234), stroke: (paint: rgb("#cc8400")), mark: (end: ">"))
  line((-1.959, 6.052), (0.7605, 7.34), stroke: (paint: rgb("#cc8400")), mark: (end: ">"))
  content((1.597, 1.165), [#text(fill: rgb("#0000a6"))[$x$]], anchor: "north")
  content((2.33, 8.254), [#text(fill: rgb("#cc8400"))[$y$]], anchor: "south-west")
  content((0, 4.792), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$t= 12$])])
  content((-4.992, -0.4327), [$(-1,0,0)$])
  content((4.992, -2.762), [$(1,0,0)$])
  content((-4.792, 9.785), [$(0,-1,H)$])
  content((3.461, 12.68), [$(0,1,H)$])
  rect((-7.921, -3.295), (7.921, 13.31))
})
  Physical coordinates $\( x \, y \, H t \)$; $H = sqrt(2)$.
  #strong[(b)] Matching after the tilt, $x = X$
  #cetz.canvas({
  import cetz.draw: *
  line((2.242, 1.121), (2.242, 11.45), (7.409, 11.45), close: true, fill: rgb("#e0e0ff"))
  line((3.364, 3.364), (7.409, 11.45), (11.45, 11.45), close: true, fill: rgb("#fff0d4"))
  line((2.242, 1.121), (2.242, 11.45), stroke: (paint: rgb("#0000a6")))
  line((3.364, 3.364), (11.45, 11.45), stroke: (paint: rgb("#d98c00")))
  line((2.242, 1.121), (7.409, 11.45), stroke: (paint: rgb("#333333")))
  line((0, 0), (5.727, 11.45), stroke: (paint: rgb("#999999")))
  line((3.864, 7.728), (5.546, 7.728), stroke: (paint: rgb("#666666")), mark: (start: "<", end: ">"))
  content((4.705, 7.866), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$epsilon X(1-q^2)/4$])])
  line((-0.828, 0), (12.83, 0), stroke: (paint: rgb("#595959")), mark: (end: ">"))
  content((12.83, 0), [$y$], anchor: "west")
  line((0, -0.621), (0, 12.56), stroke: (paint: rgb("#595959")), mark: (end: ">"))
  content((0, 12.56), [$t$], anchor: "south")
  content((-0.1656, -0.069), [$O$], anchor: "north-east")
  circle((2.242, 1.121), radius: 0.03528, fill: black)
  circle((3.364, 3.364), radius: 0.03528, fill: black)
  content((2.084, 1.09), [$V_j$], anchor: "east")
  content((3.519, 3.298), [$V_{j+1}$], anchor: "west")
  content((3.726, 9.66), [#text(fill: rgb("#0000a6"))[$j$]])
  content((8.832, 9.66), [#text(fill: rgb("#d98c00"))[$j+1$]])
  content((0.69, 5.796), [$y="qt"$], anchor: "south-east")
  line((0.7176, 6.003), (3.243, 6.486), stroke: (paint: rgb("#999999")))
  content((6.072, -0.966), [$q=q_{j+1}$, $V_i=( epsilon X alpha_i, epsilon X beta_i)$], anchor: "north")
  rect((-1.38, -2.07), (13.8, 13.25))
})
  The common supporting line is $y = q t + epsilon X \( 1 - q^2 \) \/ 4$.],
  caption: [Figure 1: (a) At zero tilt, cylinders parallel to the two opposite edges cover the lower and upper halves of $K$. (b) In the plane $x = X$, neighboring angular sectors have distinct translated vertices $V_j$ and $V_(j + 1)$, but their sides at $q = q_(j + 1)$ lie on the same line $y = q t + epsilon X \( 1 - q^2 \) \/ 4$. The dashed line is $y = q t$, its zero-tilt position. Tilt and sector widths are exaggerated. Radial cutoffs are omitted; the colored regions end at the boundary of the displayed window. ],
)