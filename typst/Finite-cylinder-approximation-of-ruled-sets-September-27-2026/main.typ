#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Finite cylinder approximation of ruled sets]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 The finite approximation problem <b:introduction>

A cylinder in $bb(R)^3$ is a set $B + bb(R) u$, where $u$ is a Euclidean unit vector and $B subset u^perp$ is measurable with finite area. Its cost is $\| B \|$; the cost of a finite family is the sum of these areas, counted with multiplicity. A continuously varying family of segments suggests a way to choose economical directions. Turning it into finitely many cylinders is a separate problem: simply freezing a direction on each small label patch can open gaps or create an area loss that does not vanish with the mesh.

The motivation comes from cylinder coverings of convex bodies. If $K subset bb(R)^3$ is a compact convex set with nonempty interior, write $A_min \( K \) = min_(\| u \| = 1) \| pi_(u^perp) K \|$ for its smallest orthogonal projection area. Bezdek records a question attributed to Bang asking whether every finite cylinder cover costs at least $A_min \( K \) \/ 2$, together with a two-cylinder equality example for the regular tetrahedron #cite(label("Bezdek2009")) Problem 3.1. Bezdek and Litvak prove the universal lower bound $A_min \( K \) \/ 3$ in dimension three as a consequence of their stronger directionwise normalized inequality #cite(label("BL2009")) Theorem 3.1. A useful way to search for inexpensive covers is to perturb the lines in a simple configuration, compare the added label area with the saving in perpendicular projection, and only then make the family finite. This paper supplies that last step with its exact hypotheses and area factor.

=== 1.1 Segments, tiles, and their Euclidean cost <segments-tiles-and-their-euclidean-cost>

We use an axial coordinate $s in bb(R)$ and transverse coordinates $p = \( p_1 \, p_2 \) in bb(R)^2$. For a compact set $D subset bb(R)^2$, a continuous field $V$ defined near $D$, and $L > 0$, set

#[#set math.equation(numbering: n => "(1.1)")
 $ E \( D \, V \, L \) = { \( s \, p + s V \( p \) \) : p in D \, med \| s \| lt.eq L } . $ <b:ruled-set>]

The label $p$ is the intercept at $s = 0$ and $\( 1 \, V \( p \) \)$ is the segment direction. A measurable tile $T subset bb(R)^2$ and a constant velocity $g in bb(R)^2$ determine

$ cal(C) \( T \, g \) = { \( s \, xi \) : s in bb(R) \, med xi in T + s g } . $

At each height its section is a translate of $T$, rather than a deformed copy. These are the cylinders used in our finite covers.

For a fixed $h > 0$, allow the physical coordinate map

$ F_h \( s \, xi \) = \( s \, xi_1 \, h xi_2 \) \, #h(2em) J_h \( g \) = \( 1 + g_1^2 + h^2 g_2^2 \)^(- 1 \/ 2) . $

When $h = 1$ the coordinates are orthonormal. Throughout, a velocity’s components in $J_h$ refer to these original coordinates, even when the tile is rotated.

#thm([Proposition 1.1.])[
  (Perpendicular base area).  #emph[Let $h > 0$, let $T subset bb(R)^2$ be bounded and measurable, and let $g in bb(R)^2$. The image $F_h \( cal(C) \( T \, g \) \)$ is a cylinder whose perpendicular base has area $h \| T \| J_h \( g \)$. A compact nondegenerate parallelogram tile has a compact nondegenerate parallelogram base. An open tile gives an open base. The formula is unchanged after a Euclidean isometry.]
] <b:projection>

#proof[
  The intercept tile $F_h \( { 0 } times T \)$ has physical area $h \| T \|$ and lies in the plane with unit normal $\( 1 \, 0 \, 0 \)$. Its cylinder direction is $v = \( 1 \, g_1 \, h g_2 \)$. Orthogonal projection onto $v^perp$ has constant area Jacobian $\| \( 1 \, 0 \, 0 \) dot.op v \/ \| v \| \| = J_h \( g \)$ on the intercept plane: this follows by projecting an orthonormal pair and taking the area of its parallelogram. A point and its projection differ by a multiple of $v$, so the projected tile sweeps precisely the same cylinder. The projection is an invertible linear map between the two planes because the first component of $v$ is nonzero. It preserves compactness, openness, and nondegeneracy as asserted. Isometries preserve perpendicular area and the cylinder property. ◻
]

Thus the prospective cost of the physical family $F_h \( E \( D \, V \, L \) \)$ is $h integral_D J_h \( V \( p \) \) thin d p$. The following theorem realizes this upper bound to arbitrary accuracy with square intercept tiles.

#thm([Theorem 1.2.])[
  (Finite approximation by square tiles).  #emph[Let $D subset bb(R)^2$ be compact, let $V$ be $C^1$ on an open neighborhood of $D$, and let $L \, h > 0$. Suppose that 
#[#set math.equation(numbering: n => "(1.2)")
 $ "tr" D V \( p \) = 0 \, #h(2em) - L^(- 2) < det D V \( p \) lt.eq 0 quad \( p in D \) . $ <b:main-condition>]

 For every $epsilon > 0$, there are finitely many compact nondegenerate square tiles $T_i subset bb(R)^2$, with possibly different orientations, and velocities $g_i in bb(R)^2$ such that 
#[#set math.equation(numbering: n => "(1.3)")
 $ E \( D \, V \, L \) subset union.big_i cal(C) \( T_i \, g_i \) \, #h(2em) sum_i \| T_i \| J_h \( g_i \) lt.eq integral_D J_h \( V \( p \) \) thin d p + epsilon . $ <b:main-cover>]

 Under $F_h$, the perpendicular bases are compact nondegenerate parallelograms and have total area $h sum_i \| T_i \| J_h \( g_i \)$. No condition on the area of $partial D$ or smallness of $parallel D V parallel$ is required.]
] <b:approximation>

To obtain a prescribed error in physical base area, use that error divided by $h$ as $epsilon$ in (1.3). The construction includes compact label sets of area zero or with positive-area boundary. The velocities $g_i$ are chosen from local affine approximations to $V$; they need not equal the original field at the tile centers.

The eigenvalues in (1.2) are $lambda_p \, - lambda_p$, where $lambda_p = sqrt(- det D V \( p \))$ and $0 lt.eq L lambda_p < 1$. Thus opposite nonzero real eigenvalues are allowed up to the strict length bound. When $lambda_p = 0$, Cayley–Hamilton gives $\( D V \( p \) \)^2 = 0$. In particular, a field with square-zero differential everywhere on $D$ satisfies the theorem for every fixed $L > 0$, with no bound on its shear coefficient. The two types may occur in the same field: for

$ V \( p_1 \, p_2 \) = \( p_2 \, p_1^3 \/ 3 \) \, #h(2em) D V \( p \) = mat(delim: "(", 0, 1; p_1^2, 0) \, $

the theorem applies on any compact subset of $\| p_1 \| < L^(- 1)$. The differential is square-zero on $p_1 = 0$ and hyperbolic elsewhere.

=== 1.2 Why fixed squares suffice <why-fixed-squares-suffice>

For an affine field with derivative $A$, label differences at height $s$ are transformed by $I + s A$. A trace-zero planar matrix has an orthonormal basis in which its diagonal vanishes. In those coordinates, write $A = mat(delim: "(", 0, b; c, 0)$. The unit-grid centers then move to

$ \( i + s b j \, thin s c i + j \) \, #h(2em) \( i \, j \) in bb(Z)^2 . $

The squares themselves keep their sides and their area. They still cover the entire plane whenever $0 lt.eq s^2 b c < 1$, even if an individual coefficient $s b$ or $s c$ is large. A direct rounded fixed-point argument proves this covering in Section 2. When one coefficient is zero, the motion simply slides the rows or columns.

The bounded-parameter square covering is related to Stein’s notched-square construction in Kolountzakis’s formulation #cite(label("Kolountzakis1998")) Theorem 7. The full positive-product range also follows from the signed-function identity in the same paper #cite(label("Kolountzakis1998")) Section 2.3, equations (17)–(20). We give an elementary proof, including the zero-product cases and all square boundaries. Its integer iteration is a finite-chain instance of Tarski’s monotone fixed-point principle #cite(label("Tarski1955")) Theorem 1. These comparisons concern the affine covering; the finite nonlinear construction and its area estimate are proved here.

Section 3 passes to a $C^1$ field. On each coarse square meeting $D$, we freeze an affine approximation and use a much finer square grid in its orthonormal coordinates. The infinite affine cover contains every actual nonlinear target. The inverse of $I + s A$ then shows that only centers in a thin collar of the coarse square are needed, uniformly over the allowed heights. The fine-grid spacing and the Taylor error both make that collar thinner than the coarse side length by a factor tending to zero. Its extra tile area is therefore negligible. Summing the sampled weights over the coarse squares gives the integral over a shrinking outer neighborhood of $D$, which converges to the integral over $D$ without a boundary-regularity assumption.

Section 4 develops a different construction with open intercept cells bounded by hyperbolas. Their long arms absorb expansion in one eigendirection and contraction in the other at small relative area cost. This method packs the interior and requires a label set with area-zero boundary; logarithmic dilation gives a finite-stopping variant of the same construction. These alternatives are not needed for Theorem 2. Section 5 discusses physical rescaling, the role of the spectral bound, and the use of a finite approximation within a later parameter limit.

== 2 Square coverings for affine motion <b:linear-coverings>

We first cover the whole transverse plane for a frozen affine velocity field. The squares keep their side lengths and orientations; only their centers move. An inverse estimate will then locate the centers needed near a compact set of labels. Neither step requires a smallness bound on the individual shear coefficients.

#thm([Lemma 2.1.])[
  (A deformed square grid).  #emph[Let $alpha \, beta in bb(R)$ satisfy $0 lt.eq alpha beta < 1$. The closed unit squares with centers 
$ \( i + alpha j \, thin beta i + j \) \, #h(2em) \( i \, j \) in bb(Z)^2 \, $

 cover $bb(R)^2$.]
] <b:lattice>

#proof[
  Write $R \( t \) = floor.l t + 1 \/ 2 floor.r$. For a target $u = \( u_1 \, u_2 \)$, it suffices to find integers satisfying
  $ i = R \( u_1 - alpha j \) \, #h(2em) j = R \( u_2 - beta i \) . $
  Consider $F \( i \) = R \( u_1 - alpha R \( u_2 - beta i \) \)$. If $alpha beta > 0$, the two multiplications either both preserve or both reverse order, so $F$ is nondecreasing. If either coefficient is zero, $F$ is constant and hence still nondecreasing. Moreover,
  $ F \( i \) = alpha beta i + O \( 1 \) #h(2em) \( \| i \| arrow.r oo \) . $
  Since $alpha beta < 1$, there are integers $i_(-) < i_(+)$ with $F \( i_(-) \) gt.eq i_(-)$ and $F \( i_(+) \) lt.eq i_(+)$. Monotonicity makes the finite integer interval between them invariant. Iteration from $i_(-)$ is nondecreasing and bounded, so it reaches a fixed point. Setting $j = R \( u_2 - beta i \)$ gives the required pair. Each coordinate error is at most $1 \/ 2$, including equality at the square boundaries. ◻
]

This iteration is a finite-chain instance of Tarski’s monotone fixed-point principle #cite(label("Tarski1955")) Theorem 1. The positive-product covering also follows from the signed tiling identity of Kolountzakis #cite(label("Kolountzakis1998")) Section 2.3, equations (17)–(20). After taking its parameters to be $\| alpha \| \, \| beta \|$ and reflecting one coordinate when necessary, that identity gives the lattice sum of a unit-square indicator minus a rectangle indicator as $1$ almost everywhere. The rectangle contribution is nonnegative, so the squares cover almost everywhere. Their closed, locally finite union then covers every point. When both parameters have absolute value below one, Stein’s notched-square construction already supplies this covering #cite(label("Kolountzakis1998")) Theorem 7 and equations (13)–(14). The direct proof above includes the zero-product cases as well.

#thm([Lemma 2.2.])[
  (An orthogonal zero-diagonal basis).  #emph[Let $A$ be a real $2 times 2$ matrix with $"tr" A = 0$. There is an orthonormal basis in which 
$ A = mat(delim: "(", 0, b; c, 0) \, #h(2em) b c = - det A . $

]
] <b:zero-diagonal>

#proof[
  For a unit vector $e$, let $e^perp$ be its counterclockwise quarter-turn and put $q \( e \) = e^(sans(T)) A e$. The trace identity gives $q \( e \) + q \( e^perp \) = 0$. Continuity on the quarter-circle between these vectors supplies a unit vector with $q \( e \) = 0$. Then $q \( e^perp \) = 0$ also. The determinant gives the formula for the product of the off-diagonal entries. ◻
]

#thm([Lemma 2.3.])[
  (Affine square covering and center control).  #emph[Let $L > 0$ and let $A$ be a real $2 times 2$ matrix satisfying 
$ "tr" A = 0 \, #h(2em) - L^(- 2) < det A lt.eq 0 . $

 Fix $p_0 \, v_0 in bb(R)^2$ and write $W \( p \) = v_0 + A \( p - p_0 \)$. There is an orthonormal basis $e_1 \, e_2$ such that, for every $tau > 0$, the lattice 
$ Lambda = p_0 + tau bb(Z) e_1 + tau bb(Z) e_2 $

 and its closed squares 
$ T_l = l + \[ - tau \/ 2 \, tau \/ 2 \] e_1 + \[ - tau \/ 2 \, tau \/ 2 \] e_2 #h(2em) \( l in Lambda \) $

 satisfy 
$ bb(R)^2 = union.big_(l in Lambda) #scale(x: 120%, y: 120%)[\(] T_l + s W \( l \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( \| s \| lt.eq L \) . $

 If $x$ belongs to the translated tile indexed by $l$, then $\| x - l - s W \( l \) \| lt.eq tau$. Furthermore, 
#[#set math.equation(numbering: n => "(2.1)")
 $ parallel \( I + s A \)^(- 1) parallel lt.eq frac(1 + L parallel A parallel, 1 + L^2 det A) #h(2em) \( \| s \| lt.eq L \) \, $ <b:affine-inverse>]

 where the norm is the Euclidean operator norm.]
] <b:affine-cover>

#proof[
  Choose the basis from Lemma 4. After subtracting $p_0 + s v_0$ and using this basis in units of $tau$, the centers are
  $ \( i + s b j \, thin s c i + j \) . $
  Their two parameters have product $s^2 b c = - s^2 det A in \[ 0 \, 1 \)$, so Lemma 3 applies. The distance from a point of a square to its center is at most $tau \/ sqrt(2)$, giving the stated bound. Cayley–Hamilton and $"tr" A = 0$ give
  $ A^2 = - \( det A \) I \, #h(2em) \( I + s A \)^(- 1) = frac(I - s A, 1 + s^2 det A) . $
  The denominator is at least $1 + L^2 det A > 0$, which proves (2.1). ◻
]

Figure 1 shows the case of equal positive off-diagonal parameters. In the affine covering, the tiles keep their area even though the center map has determinant $1 + s^2 det A lt.eq 1$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-5.605, -5.605), (-4.655, -4.655), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-5.13, -5.13), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-5.272, -4.655), (-4.322, -3.705), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.797, -4.18), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-4.94, -3.705), (-3.99, -2.755), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.465, -3.23), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-4.607, -2.755), (-3.657, -1.805), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.132, -2.28), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-4.275, -1.805), (-3.325, -0.855), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.8, -1.33), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.943, -0.855), (-2.992, 0.095), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.467, -0.38), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.61, 0.095), (-2.66, 1.045), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.135, 0.57), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.277, 1.045), (-2.328, 1.995), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.803, 1.52), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.945, 1.995), (-1.995, 2.945), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.47, 2.47), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-4.655, -5.272), (-3.705, -4.322), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.18, -4.797), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-4.322, -4.322), (-3.372, -3.372), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.847, -3.847), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.99, -3.372), (-3.04, -2.422), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.515, -2.897), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.657, -2.422), (-2.708, -1.472), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.183, -1.947), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.325, -1.472), (-2.375, -0.5225), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.85, -0.9975), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.992, -0.5225), (-2.042, 0.4275), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.517, -0.0475), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.66, 0.4275), (-1.71, 1.377), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.185, 0.9025), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.328, 1.377), (-1.377, 2.328), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.852, 1.852), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.995, 2.328), (-1.045, 3.277), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.52, 2.803), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.705, -4.94), (-2.755, -3.99), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-3.23, -4.465), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.372, -3.99), (-2.422, -3.04), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.897, -3.515), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-3.04, -3.04), (-2.09, -2.09), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.565, -2.565), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.708, -2.09), (-1.758, -1.14), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.232, -1.615), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.375, -1.14), (-1.425, -0.19), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.9, -0.665), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.042, -0.19), (-1.092, 0.76), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.567, 0.285), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.71, 0.76), (-0.76, 1.71), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.235, 1.235), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.377, 1.71), (-0.4275, 2.66), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.9025, 2.185), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.045, 2.66), (-0.095, 3.61), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.57, 3.135), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.755, -4.607), (-1.805, -3.657), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.28, -4.132), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.422, -3.657), (-1.472, -2.708), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.947, -3.183), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-2.09, -2.708), (-1.14, -1.758), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.615, -2.232), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.758, -1.758), (-0.8075, -0.8075), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.282, -1.282), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.425, -0.8075), (-0.475, 0.1425), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.95, -0.3325), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.092, 0.1425), (-0.1425, 1.092), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.6175, 0.6175), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.76, 1.092), (0.19, 2.042), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.285, 1.567), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.4275, 2.042), (0.5225, 2.992), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.0475, 2.517), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.095, 2.992), (0.855, 3.943), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.38, 3.467), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.805, -4.275), (-0.855, -3.325), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.33, -3.8), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.472, -3.325), (-0.5225, -2.375), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.9975, -2.85), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-1.14, -2.375), (-0.19, -1.425), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.665, -1.9), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.8075, -1.425), (0.1425, -0.475), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.3325, -0.95), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.475, -0.475), (0.475, 0.475), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.1425, 0.475), (0.8075, 1.425), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.3325, 0.95), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.19, 1.425), (1.14, 2.375), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.665, 1.9), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.5225, 2.375), (1.472, 3.325), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.9975, 2.85), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.855, 3.325), (1.805, 4.275), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.33, 3.8), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.855, -3.943), (0.095, -2.992), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.38, -3.467), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.5225, -2.992), (0.4275, -2.042), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.0475, -2.517), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.19, -2.042), (0.76, -1.092), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.285, -1.567), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.1425, -1.092), (1.092, -0.1425), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.6175, -0.6175), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.475, -0.1425), (1.425, 0.8075), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.95, 0.3325), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.8075, 0.8075), (1.758, 1.758), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.282, 1.282), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.14, 1.758), (2.09, 2.708), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.615, 2.232), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.472, 2.708), (2.422, 3.657), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.947, 3.183), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.805, 3.657), (2.755, 4.607), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.28, 4.132), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.095, -3.61), (1.045, -2.66), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.57, -3.135), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.4275, -2.66), (1.377, -1.71), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.9025, -2.185), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((0.76, -1.71), (1.71, -0.76), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.235, -1.235), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.092, -0.76), (2.042, 0.19), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.567, -0.285), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.425, 0.19), (2.375, 1.14), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.9, 0.665), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.758, 1.14), (2.708, 2.09), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.232, 1.615), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.09, 2.09), (3.04, 3.04), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.565, 2.565), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.422, 3.04), (3.372, 3.99), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.897, 3.515), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.755, 3.99), (3.705, 4.94), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.23, 4.465), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.045, -3.277), (1.995, -2.328), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.52, -2.803), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.377, -2.328), (2.328, -1.377), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.852, -1.852), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.71, -1.377), (2.66, -0.4275), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.185, -0.9025), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.042, -0.4275), (2.992, 0.5225), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.517, 0.0475), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.375, 0.5225), (3.325, 1.472), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.85, 0.9975), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.708, 1.472), (3.657, 2.422), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.183, 1.947), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((3.04, 2.422), (3.99, 3.372), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.515, 2.897), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((3.372, 3.372), (4.322, 4.322), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.847, 3.847), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((3.705, 4.322), (4.655, 5.272), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.18, 4.797), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((1.995, -2.945), (2.945, -1.995), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.47, -2.47), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.328, -1.995), (3.277, -1.045), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((2.803, -1.52), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.66, -1.045), (3.61, -0.095), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.135, -0.57), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((2.992, -0.095), (3.943, 0.855), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.467, 0.38), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((3.325, 0.855), (4.275, 1.805), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.8, 1.33), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((3.657, 1.805), (4.607, 2.755), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.132, 2.28), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((3.99, 2.755), (4.94, 3.705), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.465, 3.23), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((4.322, 3.705), (5.272, 4.655), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.797, 4.18), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((4.655, 4.655), (5.605, 5.605), stroke: (paint: rgb("#8c8cff"), thickness: 0.4pt, miter-limit: 10))
  circle((5.13, 5.13), radius: 0.0285, fill: rgb("#0000bf"), stroke: none)
  rect((-0.475, -0.475), (0.475, 0.475), fill: rgb("#ccccff"), stroke: none)
  rect((-0.475, -0.475), (0.475, 0.475), stroke: (paint: rgb("#0000d9"), thickness: 1.1pt, miter-limit: 10))
  circle((0, 0), radius: 0.03325, fill: rgb("#0000d9"), stroke: none)
  rect((-1.9, -1.9), (1.9, 1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.375, 0.76), [#box(width: 7.235cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); Centers: $(i+"aj","ai"+j)$, $(i,j) in bb(Z)^2$.#linebreak() Squares: side length $1$, with fixed horizontal and vertical sides.])], anchor: "west")
  content((2.375, -0.76), [#box(width: 7.235cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); Here $a=0.35$. The squares overlap, but leave no gaps.])], anchor: "west")
})],
  caption: [Figure 1: A bounded window in the lattice covering of Lemma 3, with the square at the origin highlighted. The squares keep their original shape and orientation as their centers move. The affine construction uses an orthonormal basis for each frozen differential. Its finite approximation retains fine-grid centers only near the corresponding coarse label square. ],
) <b:figure-lattice>

The square-zero case has a particularly simple interpretation. If $A eq.not 0$ and $A^2 = 0$, then $"im" A = ker A$ is a line. Choose $e_1$ along that line. In an orthonormal basis the map is $\( x \, y \) mapsto \( d y \, 0 \)$ for some $d in bb(R)$. After removing the common translation, row $j$ of the square lattice moves horizontally by $s d tau j$. Its vertical interval stays fixed, and the horizontal intervals in each row still cover the line. Thus the squares cover for every $s in bb(R)$ and every $d$, as illustrated in Figure 2. For $A = 0$ this is the ordinary square grid. This explains directly why no bound on the shear is needed in the square-zero case.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.7, -1.02), (-1.02, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.36, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((-1.02, -1.02), (-0.34, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.68, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((-0.34, -1.02), (0.34, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((0, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((0.34, -1.02), (1.02, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.68, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((1.02, -1.02), (1.7, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.36, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((-1.7, -0.34), (-1.02, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.36, 0), radius: 0.04939, fill: black, stroke: none)
  rect((-1.02, -0.34), (-0.34, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.68, 0), radius: 0.04939, fill: black, stroke: none)
  rect((-0.34, -0.34), (0.34, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.04939, fill: black, stroke: none)
  rect((0.34, -0.34), (1.02, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.68, 0), radius: 0.04939, fill: black, stroke: none)
  rect((1.02, -0.34), (1.7, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.36, 0), radius: 0.04939, fill: black, stroke: none)
  rect((-1.7, 0.34), (-1.02, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.36, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((-1.02, 0.34), (-0.34, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.68, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((-0.34, 0.34), (0.34, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((0.34, 0.34), (1.02, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((0.68, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((1.02, 0.34), (1.7, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((1.36, 0.68), radius: 0.04939, fill: black, stroke: none)
  content((0, -1.36), [$s=0$])
  rect((3.366, -1.02), (4.046, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((3.706, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((4.046, -1.02), (4.726, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.386, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((4.726, -1.02), (5.406, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((5.066, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((5.406, -1.02), (6.086, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((5.746, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((6.086, -1.02), (6.766, -0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((6.426, -0.68), radius: 0.04939, fill: black, stroke: none)
  rect((3.74, -0.34), (4.42, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.08, 0), radius: 0.04939, fill: black, stroke: none)
  rect((4.42, -0.34), (5.1, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.76, 0), radius: 0.04939, fill: black, stroke: none)
  rect((5.1, -0.34), (5.78, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((5.44, 0), radius: 0.04939, fill: black, stroke: none)
  rect((5.78, -0.34), (6.46, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((6.12, 0), radius: 0.04939, fill: black, stroke: none)
  rect((6.46, -0.34), (7.14, 0.34), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((6.8, 0), radius: 0.04939, fill: black, stroke: none)
  rect((4.114, 0.34), (4.794, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((4.454, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((4.794, 0.34), (5.474, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((5.134, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((5.474, 0.34), (6.154, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((5.814, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((6.154, 0.34), (6.834, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((6.494, 0.68), radius: 0.04939, fill: black, stroke: none)
  rect((6.834, 0.34), (7.514, 1.02), stroke: (paint: rgb("#5959ff"), thickness: 0.4pt, miter-limit: 10))
  circle((7.174, 0.68), radius: 0.04939, fill: black, stroke: none)
  line((7.276, 0.68), (7.65, 0.68), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((7.276, -0.68), (6.902, -0.68), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((5.44, -1.36), [$"sd"=0.55$])
})],
  caption: [Figure 2: Sliding rows with $tau = 1$, after removing the common translation. The tiles remain squares while row $j$ moves horizontally by $s d j$. Each drawing shows a finite portion of a grid extending infinitely in both directions. No gaps arise between the closed rows. ],
) <b:figure-rows>

== 3 From affine coverings to a finite family <b:finite-proof>

We prove Theorem 2. On each coarse label square, freeze the field to its affine approximation and use a much finer square lattice. The affine covering captures the actual nonlinear target point; its inverse estimate shows that only a thin collar of extra centers is needed. We then estimate the cost one coarse square at a time. Overlaps between different coarse squares are counted with multiplicity.

#proof[
  If $D = diameter$, take the empty collection. Otherwise fix $L \, h > 0$ as in the theorem. Compactness and the strict determinant bound give
  $ sigma = min_(p in D) #scale(x: 120%, y: 120%)[\(] 1 + L^2 det D V \( p \) #scale(x: 120%, y: 120%)[\)] > 0 . $
  Choose $a > 0$ so that the compact neighborhood $D_a = { p : "dist" \( p \, D \) lt.eq a }$ is contained in the domain of $V$. Let $M$ bound $parallel D V parallel$ on $D_a$, and let $omega \( r \)$ be the supremum of $parallel D V \( x \) - D V \( y \) parallel$ over $x \, y in D_a$ with $\| x - y \| lt.eq r$. Then $omega \( r \) arrow.r 0$ as $r arrow.b 0$. Set
  $ C = frac(1 + L M, sigma) . $
  By (2.1), this bounds the inverse of every frozen map $I + s D V \( p \)$ for $p in D$ and $\| s \| lt.eq L$, including labels where the derivative is square-zero or zero.
  ===== 3.1 The coarse squares and their affine fields. <the-coarse-squares-and-their-affine-fields.>
  Take all closed squares $S$ of side $delta$ in a fixed square grid that meet $D$, and choose $b_S in S ∩ D$. There are finitely many such squares. For all sufficiently small $delta$ they lie in $D_a$. Put
  $ A_S = D V \( b_S \) \, #h(2em) V_S \( p \) = V \( b_S \) + A_S \( p - b_S \) . $
  The spectral hypotheses are used at $b_S in D$ only; no such conditions are needed on the surrounding neighborhood. Integrating $D V$ along the segment from $b_S$ to $p in S$ gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ \| V \( p \) - V_S \( p \) \| lt.eq eta_delta delta \, #h(2em) eta_delta = sqrt(2) thin omega \( sqrt(2) delta \) arrow.r 0 . $ <b:finite-taylor>]
  ===== 3.2 A finite list valid for every height. <a-finite-list-valid-for-every-height.>
  For each $S$, apply Lemma 5 to $V_S$ with fine spacing $tau = delta^2$. At a fine-grid center $l$ use its closed square $T_l$ and the velocity $V_S \( l \)$. These are the affine velocities; they need not equal $V \( l \)$. The infinite list covers each transverse plane for every $\| s \| lt.eq L$.
  Fix $p in D ∩ S$ and $\| s \| lt.eq L$. Apply that covering to the actual target $p + s V \( p \)$, obtaining a center $l$ with
  $ \| p + s V \( p \) - l - s V_S \( l \) \| lt.eq tau . $
  Since $V_S \( l \) - V_S \( p \) = A_S \( l - p \)$, (3.1) gives
  $ \| \( I + s A_S \) \( l - p \) \| lt.eq tau + L eta_delta delta . $
  The uniform inverse bound therefore yields
  #[#set math.equation(numbering: n => "(3.2)")
   $ \| l - p \| lt.eq R_delta \, #h(2em) R_delta = C \( tau + L eta_delta delta \) = o \( delta \) . $ <b:finite-retention>]
  Retain all centers whose distance from the whole coarse square $S$ is at most $R_delta$. This is a finite list independent of $p$ and $s$. The preceding argument proves that its cylinders cover every segment with label in $D ∩ S$.
  ===== 3.3 Cost of the retained squares. <cost-of-the-retained-squares.>
  Within the lattice belonging to $S$, the retained squares have disjoint interiors. Their union at height zero lies within distance $R_delta + tau$ of $S$. Enclosing this neighborhood in a square enlarged along the original coordinate axes gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(l med upright("retained")) \| T_l \| lt.eq \( delta + 2 R_delta + 2 tau \)^2 = delta^2 \( 1 + o \( 1 \) \) . $ <b:finite-area>]
  Every retained center satisfies $\| l - b_S \| lt.eq sqrt(2) delta + R_delta = O \( delta \)$, so
  $ V_S \( l \) = V \( b_S \) + O \( delta \) \, #h(2em) J_h \( V_S \( l \) \) = J_h \( V \( b_S \) \) + O \( delta \) . $
  Here $h$ is fixed and all velocities lie in a bounded set. The components in $J_h$ remain those of the original label coordinates, regardless of the orientation of the fine squares. Combining this estimate with (3.3), the weighted cost from $S$ is at most
  #[#set math.equation(numbering: n => "(3.4)")
   $ delta^2 J_h \( V \( b_S \) \) + o \( delta^2 \) . $ <b:finite-square-cost>]
  The errors are uniform in $S$. They depend on the fixed field, $L \, h \, sigma$, and the common modulus $omega$, but not on a continuous choice of orthonormal bases. In particular, changes between hyperbolic, square-zero and zero derivatives cause no loss in these bounds.
  ===== 3.4 Summing over an arbitrary compact label set. <summing-over-an-arbitrary-compact-label-set.>
  There are $O \( delta^(- 2) \)$ coarse squares, so the errors in (3.4) sum to $o \( 1 \)$. Let $U_delta$ be their union. Then
  $ D subset U_delta subset D_(sqrt(2) delta) . $
  The compact outer neighborhoods decrease to $D$ as their radius decreases to zero. Continuity from above of Lebesgue measure gives $\| U_delta \\ D \| arrow.r 0$, with no assumption on $\| partial D \|$. Uniform continuity of $J_h compose V$ on $D_a$ and the disjoint interiors of the coarse squares imply
  $ sum_S delta^2 J_h \( V \( b_S \) \) = integral_(U_delta) J_h \( V \( p \) \) thin d p + o \( 1 \) arrow.r integral_D J_h \( V \( p \) \) thin d p . $
  Summing (3.4) thus gives the desired weighted bound for sufficiently small $delta$. This includes $\| D \| = 0$, when the total weighted cost tends to zero. The finitely many lists together cover $E \( D \, V \, L \)$ at every height. Finally, Proposition 1 gives compact nondegenerate parallelogram perpendicular bases under $F_h$ and their exact physical areas $h \| T_l \| J_h \( V_S \( l \) \)$. ◻
]

The physical area formula is unchanged by a Euclidean isometry. For example, for any fixed $a in bb(R)$, the map

$ \( s \, xi \) mapsto \( xi_1 \, s \, h \( a - xi_2 \) \) $

is $F_h$ followed by a coordinate permutation, a reflection and a translation, so it gives the same perpendicular areas.

#prodef([Remark 3.1.])[
  (The smooth error estimate).  If $V$ has bounded second derivatives on the fixed neighborhood, the Taylor remainder is $O \( delta^2 \)$ and the retained collar has width $O \( delta^2 \)$. The weight varies by $O \( delta \)$ on each coarse square. The constructed weighted cost is consequently at most
  $ integral_(U_delta) J_h \( V \( p \) \) thin d p + O \( delta \) lt.eq integral_D J_h \( V \( p \) \) thin d p + \| U_delta \\ D \| + O \( delta \) . $
  For an arbitrary compact $D$, the excess measure tends to zero, but the argument assigns no rate to that convergence.
] <b:smooth-rate>

== 4 Product cells and logarithmic packing <b:product-section>

There is another way to exploit opposite eigenvalues. Expansion in one coordinate is accompanied by contraction in the other, so their product provides a useful bound for an intercept patch. A cell with a long, thin arm in each coordinate direction can absorb these changes at arbitrarily small relative area cost. We prove this using open cylinder bases and interior packing. This method requires the boundary of the parameter set to have area zero.

#thm([Theorem 4.1.])[
  (Approximation by product cells).  #emph[Let $h \, M > 0$, let $D subset bb(R)^2$ be compact with $\| partial D \| = 0$, and let $V$ be $C^1$ on an open neighborhood of $D$. Suppose that $D V \( p \)$ has eigenvalues $lambda_p \, - lambda_p$, where $0 < M lambda_p < 1$ for every $p in D$. For every $e > 0$, the set 
$ cal(S)_h \( D \, V \, M \) = { \( x \, p_1 + x V_1 \( p \) \, h \( p_2 + x V_2 \( p \) \) \) : p in D \, med \| x \| lt.eq M } $

 has a finite cylinder cover with bounded open measurable perpendicular bases whose total area is at most 
$ h integral_D J_h \( V \( p \) \) thin d p + e \, #h(2em) J_h \( w \) = \( 1 + w_1^2 + h^2 w_2^2 \)^(- 1 \/ 2) . $

]
] <b:product>

In the notation of Section 1, $cal(S)_h \( D \, V \, M \) = F_h \( E \( D \, V \, M \) \)$.

We first calculate the cell geometry. The same calculation also explains its logarithmic parametrization, which will be used below with a different stopping rule for the packing.

#thm([Lemma 4.2.])[
  (Cell area and dilation).  #emph[For $A > 0$ and $0 < B lt.eq A^2$, the set 
$ H \( A \, B \) = { \( u_1 \, u_2 \) : \| u_1 \| \, \| u_2 \| lt.eq A \, med \| u_1 u_2 \| lt.eq B } $

 has area $4 B \( 1 + log \( A^2 \/ B \) \)$. Strict inequalities give the same area. For $0 < tau < 1$ and $gamma gt.eq 0$, define 
$ Q_tau & = { s : \| s_1 \| \, \| s_2 \| lt.eq 1 \, med \| s_1 s_2 \| lt.eq tau } \,\
P_(tau \, gamma) & = { s : \| s_1 \| \, \| s_2 \| < 3 \, med \| s_1 s_2 \| < \( 1 + gamma \) tau } . $

 If $\( 1 + gamma \) tau < 1$, then 
#[#set math.equation(numbering: n => "(4.1)")
 $ frac(\| P_(tau \, gamma) \|, \| Q_tau \|) = R \( tau \, gamma \) := frac(\( 1 + gamma \) \[ 1 + log \( 9 \/ \( \( 1 + gamma \) tau \) \) \], 1 + log \( 1 \/ tau \)) . $ <b:cell-ratio>]

 For $m > 1$, put 
$ S_m = H \( m \, 1 \) \, #h(2em) S'_(m \, gamma) = { u : \| u_1 \| \, \| u_2 \| < 3 m \, med \| u_1 u_2 \| < 1 + gamma } . $

 With $tau = m^(- 2)$, one has the exact identities 
#[#set math.equation(numbering: n => "(4.2)")
 $ S_m = m Q_tau \, #h(2em) S'_(m \, gamma) = m P_(tau \, gamma) . $ <b:cell-dilation>]

]
] <b:cell-geometry>

#proof[
  The area in the first quadrant is
  $ integral_0^(B \/ A) A thin d u_1 + integral_(B \/ A)^A B / u_1 thin d u_1 = B + B log \( A^2 \/ B \) . $
  The boundaries have area zero, so replacing weak inequalities by strict ones leaves the result unchanged. Formula (4.1) follows by applying this identity to $H \( 1 \, tau \)$ and $H \( 3 \, \( 1 + gamma \) tau \)$. Substitution $u = m s$ proves (4.2). ◻
]

Given $eta > 0$, there are two useful orders for obtaining $R \( tau \, gamma \) < 1 + eta$. One can first choose $0 < gamma < eta$ and then take $tau$ small, because $R \( tau \, gamma \) arrow.r 1 + gamma$ as $tau arrow.b 0$. Alternatively, first take $m$ large so that $R \( m^(- 2) \, 0 \) < 1 + eta$, and then take $gamma > 0$ small. In either case the spatial scale is chosen only after the shape and padding. These choices make the open intercept patch almost as cheap as the closed parameter cell.

#thm([Lemma 4.3.])[
  (One cell and its cylinder).  #emph[Assume the hypotheses of Theorem 7, with $D$ nonempty. For each $p in D$, let $L_p$ have unit eigenvectors for $lambda_p \, - lambda_p$ as its columns. Fix $eta > 0$, $0 < tau < 1$, and $gamma > 0$ such that $\( 1 + gamma \) tau < 1$ and $R \( tau \, gamma \) lt.eq 1 + eta$. There is $rho_0 > 0$ such that, whenever $0 < rho < rho_0$ and 
$ G = p + rho L_p Q_tau subset D \, $

 the open cylinder with axis direction $\( 1 \, V_1 \( p \) \, h V_2 \( p \) \)$ and parameter intercept patch 
$ U_(p \, rho) = p + rho L_p P_(tau \, gamma) $

 covers all segments labeled by $G$ in $cal(S)_h \( D \, V \, M \)$. Its perpendicular base has area at most 
#[#set math.equation(numbering: n => "(4.3)")
 $ h \( 1 + eta \)^2 integral_G J_h \( V \( q \) \) thin d q . $ <b:product-local-cost>]

 Here a parameter intercept $u$ denotes the physical point $\( 0 \, u_1 \, h u_2 \)$.]
] <b:product-local>

#proof[
  There are constants $beta > 0$ and $N < oo$ such that $\| det L_p \| gt.eq beta$ and $parallel L_p^(- 1) parallel lt.eq N$ for all $p in D$, independently of the choices of unit eigenvectors. Otherwise a convergent subsequence of centers and unit eigenvectors would give parallel limiting eigenvectors. The continuous positive function $lambda_p = sqrt(- det D V \( p \))$ has a positive minimum on $D$, so those limiting vectors would belong to distinct eigenspaces of the same matrix. This is impossible. Also $parallel L_p parallel lt.eq sqrt(2)$.
  Choose $a > 0$ so that the compact set $D_a = { q : "dist" \( q \, D \) lt.eq a }$ lies in the domain of $V$. Let $omega$ be a modulus of continuity for $D V$ on $D_a$. If $q = p + rho L_p s$, $s in Q_tau$, and $2 rho < a$, the entire segment from $p$ to $q$ lies in $D_a$, and Taylor’s integral formula gives
  $ \| V \( q \) - V \( p \) - D V \( p \) \( q - p \) \| lt.eq 2 rho thin omega \( 2 rho \) . $
  The line through a point labeled by $q \, x$, parallel to the chosen axis, meets the intercept plane at parameter
  #[#set math.equation(numbering: n => "(4.4)")
   $ q + x \( V \( q \) - V \( p \) \) = p + rho L_p #scale(x: 120%, y: 120%)[\(] \( \( 1 + x lambda_p \) s_1 \, \( 1 - x lambda_p \) s_2 \) + E #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| E \| lt.eq 2 M N omega \( 2 rho \) . $ <b:product-taylor>]
  For the linear part $u$ inside the parentheses, the spectral hypothesis and $\| x \| lt.eq M$ give $\| u_i \| lt.eq 2$ and
  $ \| u_1 u_2 \| = \| \( 1 - x^2 lambda_p^2 \) s_1 s_2 \| lt.eq tau . $
  Write $epsilon.alt_rho = 2 M N omega \( 2 rho \)$. When $epsilon.alt_rho < min { 1 \/ 2 \, gamma tau \/ 5 }$, one has
  $ \| u_i + E_i \| < 3 \, #h(2em) \| \( u_1 + E_1 \) \( u_2 + E_2 \) \| lt.eq tau + 4 epsilon.alt_rho + epsilon.alt_rho^2 < \( 1 + gamma \) tau . $
  Thus all the intercepts lie in $U_(p \, rho)$, uniformly in the center and the segment parameter.
  Set $j \( p \) = J_h \( V \( p \) \)$. By Proposition 1, the perpendicular base obtained from this intercept patch has area
  $ h j \( p \) \| U_(p \, rho) \| = h j \( p \) R \( tau \, gamma \) \| G \| lt.eq h \( 1 + eta \) j \( p \) \| G \| . $
  The function $j$ is positive and uniformly continuous on $D$. After reducing $rho_0$, it satisfies $j \( p \) lt.eq \( 1 + eta \) j \( q \)$ for $q in G$; this proves (4.3). The projection from the physical intercept plane onto the perpendicular plane is an invertible linear map, since the axis has nonzero first coordinate. The base is therefore bounded and open, as asserted. No continuous choice of eigenvectors is needed. ◻
]

We have constructed a cylinder for each sufficiently small cell, with cost controlled by the integral on that cell. To sum these estimates, we place disjoint cells in the interior and then cover the omitted labels separately.

#proof[
  For $D = diameter$ use no cylinders. Otherwise choose $eta > 0$ so that
  $ h \[ \( 1 + eta \)^2 - 1 \] integral_D J_h \( V \) < e \/ 2 \, $
  and choose $gamma$, then $tau$, then $rho_0$ as above. In any bounded open remainder $O subset "int" D$ of positive area, take a sufficiently fine square grid of side $ell$ whose closed squares contained in $O$ account for at least $\| O \| \/ 2$. Such grids exist at arbitrarily fine scales: every point of $O$ belongs to a contained grid square once its diameter is smaller than the point’s distance to the complement, and bounded convergence gives the area assertion. There are only finitely many retained squares.
  At the center $p$ of each square put $rho = ell \/ 8 < rho_0$. Since $\| L_p s \| lt.eq \| s_1 \| + \| s_2 \| lt.eq 2$ for $s in Q_tau$, the cell $G = p + rho L_p Q_tau$ lies in the disk of radius $ell \/ 4$ about $p$, hence strictly inside the square. Its area is at least $beta \| Q_tau \| ell^2 \/ 64$. The cells are disjoint. Remove their finite compact union and repeat in the open remainder. Each round removes at least the fraction
  $ c = beta \| Q_tau \| \/ 128 > 0 $
  of the remaining area. Consequently the area remaining after $n$ rounds is at most $\( 1 - c \)^n \| D \|$. There are at most countably many selected cells, and they cover the interior except for a null set. Disjointness and (4.3) bound the total cost of their open cylinders by $h \( 1 + eta \)^2 integral_D J_h \( V \)$.
  Let $R$ be the labels in $D$ not contained in these cells. It includes any uncovered boundary points, and $\| R \| = 0$ because $\| partial D \| = 0$. Cover $R$ by countably many open squares with sum of areas less than $sigma$, where $sigma > 0$ will be chosen below, and with uniformly small side lengths. The latter restriction is available by subdividing an outer-measure cover and slightly enlarging the resulting squares within the area allowance. Discard squares not meeting $R$. In each remaining square of side $s$, choose $p in R$. If $K$ bounds $parallel D V parallel$ on the compact neighborhood $D_a$ from the preceding proof, then for every $q in R$ in that square and $\| x \| lt.eq M$,
  $ \| q + x \( V \( q \) - V \( p \) \) - p \| lt.eq \( 1 + M K \) sqrt(2) thin s \, $
  provided $sqrt(2) s < a$. Indeed the segment joining $p$ to $q$ stays in $D_a$, so the derivative bound applies even when the domain of $V$ is not convex. An open intercept disk about $p$ of radius $2 \( 1 + M K \) sqrt(2) s$ covers all these intercepts. Its associated perpendicular base costs at most
  $ C_0 s^2 \, #h(2em) C_0 = 8 pi h \( 1 + M K \)^2 \, $
  because $J_h \( V \( p \) \) lt.eq 1$. Choose $C_0 sigma < e \/ 2$.
  All the resulting cylinders are open and together cover the compact set $cal(S)_h \( D \, V \, M \)$. A finite subcover has no larger total cost, proving the claimed bound. If $\| D \| = 0$, use only the residual disk construction; its cost can be arbitrarily small. ◻
]

=== 4.1 Logarithmic cells and finite stopping <b:logarithmic-section>

The dilation in Lemma 8 permits a second choice of shape parameters and a finite stopping rule. We state the resulting formulation explicitly because it will be useful when a smooth field is multiplied by a small tilt parameter.

#thm([Corollary 4.4.])[
  (Approximation by logarithmic cells).  #emph[Let $X \, k > 0$, let $U subset bb(R)^2$ be compact with $\| partial U \| = 0$, and let $v$ be $C^2$ on an open rectangle containing $U$. Suppose that, for every $p in U$, 
$ "tr" D v \( p \) = 0 \, #h(2em) det D v \( p \) < 0 \, #h(2em) k X sqrt(- det D v \( p \)) < 1 . $

 In orthonormal coordinates $\( x \, p \) in bb(R) times bb(R)^2$, the set 
$ { \( x \, p + x k v \( p \) \) : p in U \, med \| x \| lt.eq X } $

 has, for every $e > 0$, a finite cylinder cover with bounded open measurable perpendicular bases and total base area at most 
$ integral_U \( 1 + k^2 \| v \( p \) \|^2 \)^(- 1 \/ 2) thin d p + e . $

]
] <b:logarithmic>

#proof[
  Set $V = k v$, $h = 1$ and $M = X$ in Theorem 7. The eigenvalues of $D V \( p \)$ are $plus.minus k sqrt(- det D v \( p \))$, so that theorem gives the stated conclusion. We record the logarithmic parametrization and its finite stopping rule.
  Put $j \( p \) = \( 1 + k^2 \| v \( p \) \|^2 \)^(- 1 \/ 2)$ and choose $eta > 0$ with $\[ \( 1 + eta \)^2 - 1 \] integral_U j < e \/ 2$. As after Lemma 8, choose $m > 1$ and then $gamma > 0$ with $R \( m^(- 2) \, gamma \) < 1 + eta$ and $\( 1 + gamma \) m^(- 2) < 1$. For the unit-eigenvector matrix $L_p$, the cells
  $ G = p + t L_p S_m \, #h(2em) U_(p \, t) = p + t L_p S'_(m \, gamma) $
  are exactly the product cell and its open patch under $tau = m^(- 2)$ and $rho = m t$. Lemma 9 therefore supplies an open cylinder with axis parallel to $\( 1 \, k v \( p \) \)$ and cost at most $\( 1 + eta \)^2 integral_G j$ whenever $G subset U$ and $t$ is sufficiently small, uniformly in $p$.
  For fixed $m$, Taylor’s theorem bounds the error in the label-plane intercept by $O_m \( t^2 \)$, uniformly in $p$ and $\| x \| lt.eq X$. After applying $t^(- 1) L_p^(- 1)$, this is $O_m \( t \)$. The corresponding linear image of $S_m$ has coordinate bounds $2 m$ and absolute product bound $1$, so this error fits the strict margins $3 m$ and $1 + gamma$ once $t$ is small. These estimates use a fixed compact rectangle containing $U$ in its interior and contained in the domain of $v$.
  Use the preceding square packing with $t = ell \/ \( 8 m \)$. Each round removes at least the fraction $beta \| S_m \| \/ \( 128 m^2 \) = beta \| Q_(m^(- 2)) \| \/ 128 > 0$ of the open remainder. Stop after finitely many rounds when its area is below $alpha$. Because $\| partial U \| = 0$, the entire residual label set $R subset U$ then has area below $alpha$; the finitely many cell cylinders cost at most $\( 1 + eta \)^2 integral_U j$.
  Cover $R$ by countably many open squares whose areas sum to less than $2 alpha$. If $K_v$ bounds $D v$ on the fixed rectangle, the residual-disk construction in the preceding proof costs less than $16 pi \( 1 + X k K_v \)^2 alpha$. Choose $alpha > 0$ to make this less than $e \/ 2$. The cylinders form an open cover of the compact swept set, so a finite subcover proves the bound. For $\| U \| = 0$, use only the residual disks; for $U = diameter$, use no cylinders. ◻
]

The two endings preserve different finite constructions: logarithmic packing stops with finitely many cells and a small-area residual, whereas product packing first exhausts the interior up to a null set. Both finish with residual disks and compactness. The resulting bases are bounded and open, and the cell bases need not be convex. The field, physical scale and axial interval are fixed before any shape, mesh or finite-subcover choices are made.

== 5 Scope, physical coordinates, and applications <b:comparison>

Theorem 2 uses a spectral bound, rather than a small operator norm. For example,

$ A = mat(delim: "(", 0, 2; 1 \/ 8, 0) $

has eigenvalues $plus.minus 1 \/ 2$ and Euclidean operator norm $2$. Its linear field satisfies the theorem with $L = 1$: one off-diagonal coefficient is large, but their product is below one. A square-zero matrix can have arbitrarily large norm and still satisfies the theorem for every fixed segment length. In either case the inverse bound in Section 2 is finite for the fixed field and length; no uniform number of cylinders is asserted as the spectral margin tends to zero or the derivative norm grows.

Physical rescaling must be kept separate from rotating a tile. The map $T_h = "diag" \( 1 \, h \)$ conjugates a derivative to $T_h A T_h^(- 1)$ and thus preserves its trace, determinant, eigenvalues and square-zero property. It need not preserve the ordinary operator norm. The weight in Proposition 1 is always $h J_h \( g \)$, with $g$ expressed in the original label coordinates. This gives the same physical cost whether the tile was selected in the original axes or in a locally chosen orthonormal basis.

The square construction handles arbitrary compact label sets by integration over outer neighborhoods. The product and logarithmic constructions instead use label domains with area-zero boundary so that almost all label area can be packed by interior cells. Their remaining labels are covered by inexpensive open cylinders. Those cell bases are bounded and open and need not be convex; the principal construction produces compact parallelogram perpendicular bases. All costs count multiplicity, including overlaps between different coarse patches or between cell and residual cylinders.

Finally, the field, physical scale, and axial interval are fixed before the tolerance and mesh choices. In an application with a singular endpoint, first restrict to a compact label set contained in the field’s differentiability domain. The omitted segments, including the endpoint itself, require a separate cover. Once the integral cost plus that extra cost has a strict saving, the finite approximation error can be chosen within the remaining gap. No mesh uniform over the later parameter limit is needed.


#bibliography("refs.bib", style: "ieee", title: [References])
