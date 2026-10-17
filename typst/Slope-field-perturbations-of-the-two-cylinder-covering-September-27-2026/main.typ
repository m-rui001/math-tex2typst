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

#align(center)[#text(size: 16pt, weight: "bold")[Slope-field perturbations of the two-cylinder covering]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <c:introduction>

The usual two-cylinder covering of a regular tetrahedron is balanced at a natural threshold: its total base area is half the tetrahedron’s smallest orthogonal projection area. We ask how the axes can vary across the two families so as to reduce this cost without leaving a gap. The answer involves two competing effects. Tilting decreases the perpendicular area of an intercept patch, but neighboring lines then need a larger patch to keep covering the tetrahedron. We construct fields for which the first decrease exceeds the second increase.

A cylinder in $bb(R)^3$ is $B + bb(R) u$, where $u$ is a unit vector and $B subset u^perp$ is measurable with finite planar area $\| B \|$. For a convex body $K$, define

$ A_min \( K \) = min_(\| u \| = 1) \| pi_(u^perp) K \| . $

Cylinder covering problems have an antecedent in plank coverings. A plank is the region between two parallel hyperplanes, and its width is the distance between them. Bang’s plank theorem states that the total width of a finite plank cover of a convex body is at least the body’s minimum width; Bezdek and Litvak study the corresponding question for cylinders #cite(label("BL2009")) Introduction. The half-area question asks whether every finite cylinder cover of $K$ has $sum_i \| B_i \| gt.eq A_min \( K \) \/ 2$. Bezdek records this question, and the regular tetrahedron’s equality example, as due to Bang #cite(label("Bezdek2009")) Problem 3.1; the same attribution appears in Bezdek and Litvak #cite(label("BL2009")).

There is a stronger directionwise formulation. For a finite family $cal(C) = \( B_i + bb(R) u_i \)_i$, its relative cost is

$ cal(R) \( cal(C) \; K \) = sum_i frac(\| B_i \|, \| pi_(u_i^perp) K \|) . $

For finite cylinder covers, Bezdek and Litvak proved $cal(R) gt.eq 1 \/ 3$ for arbitrary three-dimensional convex bodies and $cal(R) gt.eq 1$ for ellipsoids #cite(label("BL2009")) Theorem 3.1. Bezdek and Khan’s #emph[1-Codimensional Cylinder Covering Conjecture] proposes $cal(R) gt.eq 1 \/ 2$ in dimension three #cite(label("BK2016")) Definition 3 and Conjecture 4.13. Since each denominator is at least $A_min \( K \)$,

#[#set math.equation(numbering: n => "(1)")
 $ cal(R) \( cal(C) \; K \) lt.eq frac(sum_i \| B_i \|, A_min \( K \)) . $ <c:relative-comparison>]

Thus that conjecture implies the half-area bound. The latter question is also recorded in Verreault’s survey #cite(label("Verreault2026")) Question 4.14.

#thm([Theorem 1.1.])[
  #emph[Every regular tetrahedron $K subset bb(R)^3$ of positive edge length admits a finite cylinder cover with compact parallelogram perpendicular bases such that 
$ sum_i \| B_i \| < 1 / 2 A_min \( K \) \, #h(2em) sum_i frac(\| B_i \|, \| pi_(u_i^perp) K \|) < 1 / 2 . $

 It also admits finite covers with bounded open measurable bases satisfying both inequalities.]
] <c:main>

The directionwise conclusion extends to all tetrahedra. The reason is the affine invariance of relative cylinder cost, noted by Bezdek and Litvak #cite(label("BL2009")) Section 3.

#thm([Corollary 1.2.])[
  #emph[Every nondegenerate tetrahedron $T subset bb(R)^3$ admits a finite cylinder cover $cal(C)$ with compact parallelogram perpendicular bases and $cal(R) \( cal(C) \; T \) < 1 \/ 2$. The same conclusion holds with bounded open measurable bases.]
] <c:affine-tetrahedra>

#proof[
  Translations preserve all the areas in the relative cost, so consider an invertible linear map $A$. For a unit vector $u$, put $v = A u \/ \| A u \|$ and define the linear map between perpendicular planes
  $ Q_u = pi_(v^perp) A \|_(u^perp) : u^perp arrow.r v^perp . $
  It is invertible: if $Q_u p = 0$, then $A p$ is parallel to $A u$, so $p$ is parallel to $u$ and belongs to $u^perp$, hence is zero. The image of $B + bb(R) u$ has perpendicular base $Q_u B$, and $pi_(v^perp) \( A K \) = Q_u \( pi_(u^perp) K \)$. The same positive planar Jacobian therefore multiplies the numerator and denominator of $\| B \| \/ \| pi_(u^perp) K \|$. Thus the relative cost is unchanged, and the stated base classes are preserved. Every nondegenerate tetrahedron is an invertible affine image of a regular one, so Theorem 1 proves the corollary. ◻
]

Together with the lower bound of Bezdek and Litvak, this places the infimum relative cost of a finite cylinder cover of any nondegenerate tetrahedron in $\[ 1 \/ 3 \, 1 \/ 2 \)$. The absolute half-area inequality in Theorem 1 concerns regular tetrahedra; the affine argument preserves each directionwise ratio.

The absolute inequality follows already from the rational field in Section 2; (1) gives the relative inequality for that same cover. The subsequent constructions explain two further ways to preserve the overlap. They have different local geometry and different behavior at the apex, even though they lead to the same strict comparison.

Here is the common construction. A point $p = \( p_1 \, p_2 \)$ in a planar label set specifies a segment

$ #scale(x: 120%, y: 120%)[\(] s \, p_1 + s V_1 \( p \) \, h \( p_2 + s V_2 \( p \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| s \| lt.eq L \, $

where $h > 0$ is a fixed physical scale and $V \( p \)$ is its slope. Freezing that slope on an intercept patch of parameter area $A$ gives perpendicular area

$ frac(h A, sqrt(1 + V_1 \( p \)^2 + h^2 V_2 \( p \)^2)) . $

The scalar product of the unit normals of the intercept plane ${ x = 0 }$ and the plane perpendicular to $\( 1 \, V_1 \( p \) \, h V_2 \( p \) \)$ gives this projection factor. It suggests an integral cost for a continuously varying family, but does not by itself produce a finite cover. The companion article #emph[Finite cylinder approximation of ruled sets] #cite(label("RuledApproximation2026")) Theorem 1.2 provides a finite square-tile realization for a compact label set $D$ and a field $V$ that is $C^1$ on a neighborhood of $D$ and satisfies $"tr" D V = 0$ and $- L^(- 2) < det D V lt.eq 0$. This one construction includes opposite nonzero real eigenvalues within the strict length bound and square-zero differentials with unrestricted shear. Its weights use the original velocity coordinates, and physical base area includes the factor $h$. To obtain a prescribed physical area error $e$, we use weighted tolerance $e \/ h$ in the theorem. We check the relevant conditions only after fixing the field’s regularization or cutoff.

The rational field is derived from a stream function constant on the two walls of a wedge. A positive denominator makes it smooth at the apex, while wall tangency makes the tilted straight-line maps preserve the wedge. The labels assigned to a point by the two complementary families move in opposite directions to first order. A quartic enlargement of the label domains leaves a nonnegative square as their second-order overlap surplus. Its area costs less than the projection gain. We prove coverage both by comparing two failed inverse labels and, independently, by locating monotone height thresholds.

The singular power field changes the radial homogeneity. Its derivative is hyperbolic away from the apex; a cutoff is chosen so that the differential remains small while two tip cylinders cost less than the quadratic gain. At the limiting exponent, this field becomes the angular field with square-zero differential. That endpoint is handled without a small-shear estimate. It cannot be defined at its apex by continuity. We remove the apex before applying the companion theorem and then cover the omitted angular segments by a finite velocity net.

Section 2 supplies the first complete construction, including the strict cost comparison and its finite realization. Section 3 gives the independent threshold proof. Section 4 relates two coordinate forms of the rational field and applies the distinct logarithmic-cell and product-cell approximation theorems. Sections 5 and 6 develop the singular and square-zero constructions. The reference area is first computed by projecting entering faces. Appendix 7 gives two further explanations, through the second moments of a normal frame and the derivative of translated overlap volume.

== 2 A rational field and two choices of padding <c:rat-rational>

The equality configuration for the regular tetrahedron uses two edge-parallel cylinders. We tilt their axes by a smooth field and slightly enlarge their parameter domains. The enlargement must be large enough to preserve coverage but small enough to be paid for by the decrease in perpendicular projection area. The construction below makes this comparison explicit.

Put $h = 1 \/ sqrt(2)$ and use the regular edge-one tetrahedron

#[#set math.equation(numbering: n => "(2)")
 $ K_1 = { \( x \, y \, h t \) : - 1 / 2 lt.eq t lt.eq 1 / 2 \, med \| x \| lt.eq \( 1 / 2 + t \) \/ 2 \, med \| y \| lt.eq \( 1 / 2 - t \) \/ 2 } . $ <c:rat-tetrahedron>]

Throughout this section write $K = K_1$. Its minimum orthogonal projection area is $h \/ 2$. We verify this using Cauchy’s projection formula for polytopes, obtained by taking support functions in the projection-body representation #cite(label("Martini1991")) equation (1), p. 83, and Section 3. Its volume is $h \/ 6$, by integration of the rectangular horizontal sections, and its diameter is one. For a unit vector $u$, let $d_i$ be the derivatives in direction $u$ of its four affine barycentric coordinates. Projecting the entering faces of the tetrahedron gives

$ \| pi_(u^perp) K \| = 3 "vol" \( K \) sum_(d_i > 0) d_i . $

Indeed the inward normal component on the face opposite vertex $v_i$ is $d_i$ times that face’s altitude; the projected entering faces partition the shadow except along projected edges. Write $s = sum_(d_i > 0) d_i$. Since $sum_i d_i = 0$ and $u = sum_i d_i v_i$, the vector $u \/ s$ is a difference of two convex combinations of the vertices. The diameter bound gives $s gt.eq 1$. An edge direction has barycentric derivatives $1 \, - 1 \, 0 \, 0$, proving $A_min \( K \) = h \/ 2$.

The equality cover can now be specified explicitly. In the label plane with coordinates $\( Y \, T \)$, put

$ D_0 = { \( Y \, T \) : 0 lt.eq T lt.eq 1 / 2 \, 2 \| Y \| lt.eq 1 / 2 - T } . $

The triangle ${ \( 0 \, Y \, h T \) : \( Y \, T \) in D_0 }$, swept parallel to the $x$-axis, covers the portion $t gt.eq 0$. The reflected triangle ${ \( X \, 0 \, - h R \) : \( X \, R \) in D_0 }$, swept parallel to the $y$-axis, covers $t lt.eq 0$. Each is already perpendicular to its axis and has area $h integral_0^(1 \/ 2) \( 1 \/ 2 - T \) thin d T = h \/ 8$, so the total cost is $h \/ 4$. This is the tetrahedral equality configuration attributed to Bang in Bezdek’s account #cite(label("Bezdek2009")) Section 3.

In the label plane with coordinates $\( Y \, T \)$, write $r = 1 / 2 - T$ and set

$ cal(W) = { \( Y \, T \) : r gt.eq 2 \| Y \| } . $

The polynomial $Y^2 - r^2 \/ 4$ vanishes on both wedge walls. Dividing it by $r$ produces a potential homogeneous of degree one in $\( Y \, r \)$, whose gradient depends only on the ratio $Y \/ r$ away from the apex. Replacing that denominator by $r + d$ smooths the common apex while retaining the wall values. Fix $d > 0$ and, on $r > - d$, define

#[#set math.equation(numbering: n => "(3)")
 $ psi \( Y \, T \) & = frac(Y^2 - r^2 \/ 4, 4 \( r + d \)) \, & W_d = \( a \, b \) & = \( - psi_T \, psi_Y \) \,\
a \( Y \, T \) & = - frac(Y^2, 4 \( r + d \)^2) - frac(r \( r + 2 d \), 16 \( r + d \)^2) \, & b \( Y \, T \) & = frac(Y, 2 \( r + d \)) . $ <c:rat-potential>]

The standard stream-function form makes the divergence zero and the constant value of $psi$ on either wedge wall makes the field tangent to that wall. We use the straight-line maps $p mapsto p + epsilon.alt x W_d \( p \)$, not a flow of $W_d$. The exact derivative identities needed later are

#[#set math.equation(numbering: n => "(4)")
 $ "tr" D W_d = 0 \, #h(2em) det D W_d = - frac(d^2, 16 \( r + d \)^4) . $ <c:rat-spectrum>]

For example, the $Y Y \, Y r \, r r$ derivatives of $psi$ are $1 \/ \[ 2 \( r + d \) \]$, $- Y \/ \[ 2 \( r + d \)^2 \]$, and $\( Y^2 \/ 2 - d^2 \/ 8 \) \/ \( r + d \)^3$. Their determinant is the one displayed; replacing $r$ by $1 / 2 - T$ preserves it.

At the dividing level $T = 0$, put

#[#set math.equation(numbering: n => "(5)")
 $ alpha & = frac(1, 1 + 2 d) \, & c \( Y \) & = c_0 + c_2 Y^2 = - a \( Y \, 0 \) \,\
c_0 & = frac(\( 1 \/ 2 \) \( 1 \/ 2 + 2 d \), 16 \( 1 \/ 2 + d \)^2) \, & c_2 & = frac(1, 4 \( 1 \/ 2 + d \)^2) \, & P \( Y \) & = alpha c \( Y \) Y^2 . $ <c:rat-ceiling-polynomial>]

Thus $b \( Y \, 0 \) = alpha Y$. For a positive tilt $epsilon.alt$ and a positive padding $q = q \( epsilon.alt \)$, use the compact label domain

#[#set math.equation(numbering: n => "(6)")
 $ D_(epsilon.alt \, q) = { \( Y \, T \) in cal(W) : T gt.eq - 1 / 4 \, med T gt.eq - epsilon.alt^2 P \( Y \) - q } . $ <c:rat-domain>]

Figure 1 shows how this domain extends $D_0$ while retaining the wedge walls.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.3, 0), (1.3, 0), (0, 2.6), close: true, fill: rgb("#e0e0ff"), stroke: none)
  line((-1.768, 0), (1.768, 0), (1.768, -0.5188), (1.723, -0.4895), (1.678, -0.4619), (1.634, -0.436), (1.589, -0.4117), (1.544, -0.3889), (1.499, -0.3676), (1.455, -0.3476), (1.41, -0.329), (1.365, -0.3116), (1.32, -0.2954), (1.276, -0.2804), (1.231, -0.2664), (1.186, -0.2534), (1.141, -0.2414), (1.097, -0.2302), (1.052, -0.2199), (1.007, -0.2105), (0.9623, -0.2017), (0.9176, -0.1937), (0.8728, -0.1863), (0.8281, -0.1796), (0.7833, -0.1734), (0.7385, -0.1678), (0.6938, -0.1627), (0.649, -0.1581), (0.6043, -0.1539), (0.5595, -0.1502), (0.5147, -0.1468), (0.47, -0.1438), (0.4252, -0.1411), (0.3805, -0.1388), (0.3357, -0.1368), (0.2909, -0.135), (0.2462, -0.1336), (0.2014, -0.1324), (0.1567, -0.1314), (0.1119, -0.1307), (0.06714, -0.1303), (0.02238, -0.13), (-0.02238, -0.13), (-0.06714, -0.1303), (-0.1119, -0.1307), (-0.1567, -0.1314), (-0.2014, -0.1324), (-0.2462, -0.1336), (-0.2909, -0.135), (-0.3357, -0.1368), (-0.3805, -0.1388), (-0.4252, -0.1411), (-0.47, -0.1438), (-0.5147, -0.1468), (-0.5595, -0.1502), (-0.6043, -0.1539), (-0.649, -0.1581), (-0.6938, -0.1627), (-0.7385, -0.1678), (-0.7833, -0.1734), (-0.8281, -0.1796), (-0.8728, -0.1863), (-0.9176, -0.1937), (-0.9623, -0.2017), (-1.007, -0.2105), (-1.052, -0.2199), (-1.097, -0.2302), (-1.141, -0.2414), (-1.186, -0.2534), (-1.231, -0.2664), (-1.276, -0.2804), (-1.32, -0.2954), (-1.365, -0.3116), (-1.41, -0.329), (-1.455, -0.3476), (-1.499, -0.3676), (-1.544, -0.3889), (-1.589, -0.4117), (-1.634, -0.436), (-1.678, -0.4619), (-1.723, -0.4895), (-1.768, -0.5188), close: true, fill: rgb("#ffe0e0"), stroke: none)
  line((-1.768, -0.5188), (-1.723, -0.4895), (-1.678, -0.4619), (-1.634, -0.436), (-1.589, -0.4117), (-1.544, -0.3889), (-1.499, -0.3676), (-1.455, -0.3476), (-1.41, -0.329), (-1.365, -0.3116), (-1.32, -0.2954), (-1.276, -0.2804), (-1.231, -0.2664), (-1.186, -0.2534), (-1.141, -0.2414), (-1.097, -0.2302), (-1.052, -0.2199), (-1.007, -0.2105), (-0.9623, -0.2017), (-0.9176, -0.1937), (-0.8728, -0.1863), (-0.8281, -0.1796), (-0.7833, -0.1734), (-0.7385, -0.1678), (-0.6938, -0.1627), (-0.649, -0.1581), (-0.6043, -0.1539), (-0.5595, -0.1502), (-0.5147, -0.1468), (-0.47, -0.1438), (-0.4252, -0.1411), (-0.3805, -0.1388), (-0.3357, -0.1368), (-0.2909, -0.135), (-0.2462, -0.1336), (-0.2014, -0.1324), (-0.1567, -0.1314), (-0.1119, -0.1307), (-0.06714, -0.1303), (-0.02238, -0.13), (0.02238, -0.13), (0.06714, -0.1303), (0.1119, -0.1307), (0.1567, -0.1314), (0.2014, -0.1324), (0.2462, -0.1336), (0.2909, -0.135), (0.3357, -0.1368), (0.3805, -0.1388), (0.4252, -0.1411), (0.47, -0.1438), (0.5147, -0.1468), (0.5595, -0.1502), (0.6043, -0.1539), (0.649, -0.1581), (0.6938, -0.1627), (0.7385, -0.1678), (0.7833, -0.1734), (0.8281, -0.1796), (0.8728, -0.1863), (0.9176, -0.1937), (0.9623, -0.2017), (1.007, -0.2105), (1.052, -0.2199), (1.097, -0.2302), (1.141, -0.2414), (1.186, -0.2534), (1.231, -0.2664), (1.276, -0.2804), (1.32, -0.2954), (1.365, -0.3116), (1.41, -0.329), (1.455, -0.3476), (1.499, -0.3676), (1.544, -0.3889), (1.589, -0.4117), (1.634, -0.436), (1.678, -0.4619), (1.723, -0.4895), (1.768, -0.5188), stroke: (paint: rgb("#bf0000"), thickness: 0.8pt, miter-limit: 10))
  line((-1.768, -0.936), (0, 2.6), (1.768, -0.936), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.3, 0), (1.3, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, -0.936), (0, 3.12), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0, 3.12), [$T$], anchor: "south", padding: 0.1176cm)
  line((-2.08, 0), (2.184, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2.184, 0), [$Y$], anchor: "west", padding: 0.1176cm)
  content((-1.404, 0), [$T=0$], anchor: "north-east", padding: 0.1176cm)
  content((-0.494, 0.832), [$D_0$])
  content((0, 2.6), [apex], anchor: "south-east", padding: 0.1176cm)
  line((0.936, 0), (0.936, -0.1976), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((1.872, -0.572), [added strip], anchor: "west", padding: 0.1176cm)
  line((1.82, -0.52), (1.3, -0.208), stroke: (thickness: 0.4pt, miter-limit: 10))
})],
  caption: [Figure 1: Schematic intercept domain for the first family. The blue triangle is the unperturbed domain $D_0$; the red strip extends it below $T = 0$. The padded lower boundary ends at the unchanged wedge walls. Its actual equation is $T = - epsilon.alt^2 P \( Y \) - q$; the padding is exaggerated here, and the walls continue below the displayed portion. ],
) <c:fig-equality>

The two swept sets are

#[#set math.equation(numbering: n => "(7)")
 $ S_(+) & = { \( x \, Y + epsilon.alt x a \( Y \, T \) \, h \( T + epsilon.alt x b \( Y \, T \) \) \) : \( Y \, T \) in D_(epsilon.alt \, q) \, med \| x \| lt.eq 1 / 2 } \,\
S_(-) & = { \( X - epsilon.alt y a \( X \, R \) \, y \, - h \( R - epsilon.alt y b \( X \, R \) \) \) : \( X \, R \) in D_(epsilon.alt \, q) \, med \| y \| lt.eq 1 / 2 } . $ <c:rat-sweeps>]

For one family, the weighted parameter area is

#[#set math.equation(numbering: n => "(8)")
 $ C_d \( epsilon.alt \, q \) = h integral_(D_(epsilon.alt \, q)) frac(d Y thin d T, sqrt(1 + epsilon.alt^2 \( a^2 + h^2 b^2 \))) . $ <c:rat-weighted-cost>]

This is the quantity in the finite-approximation theorem: the factor $h$ comes from the label plane’s physical scale, and the square-root factor from its orthogonal projection perpendicular to the local line direction.

#thm([Proposition 2.1.])[
  #emph[Fix $d > 0$ and a positive function $q \( epsilon.alt \)$ such that $q \( epsilon.alt \) = O \( epsilon.alt^2 \)$ and $epsilon.alt^3 = o \( q \( epsilon.alt \) \)$ as $epsilon.alt arrow.b 0$. For all sufficiently small $epsilon.alt > 0$, 
$ K subset S_(+) union S_(-) . $

 Moreover, with 
$ D_0 = cal(W) ∩ { T gt.eq 0 } \, quad J_d = integral_(- 1 \/ 4)^(1 \/ 4) P \( Y \) thin d Y \, quad I_d = 1 / 2 integral_(D_0) \( a^2 + h^2 b^2 \) thin d Y thin d T \, $

 one has 
#[#set math.equation(numbering: n => "(9)")
 $ frac(C_d \( epsilon.alt \, q \), h) = 1 / 8 + epsilon.alt^2 \( J_d - I_d \) + q / 2 + O \( epsilon.alt^4 \) . $ <c:rat-cost-expansion>]

 The remainder constant may depend on $d$ and on a fixed bound for $q \/ epsilon.alt^2$. The coverage threshold may also depend on the rate at which $epsilon.alt^3 \/ q$ tends to zero. Finally, 
#[#set math.equation(numbering: n => "(10)")
 $ lim_(d arrow.b 0) J_d = 16 / 15360 \, #h(2em) lim_(d arrow.b 0) I_d = 17 / 15360 . $ <c:rat-coefficient-limits>]

]
] <c:rat-rational-proposition>

We first establish coverage, including the wedge walls. We then compare the area added to the label domain with the area saved by tilting the axes. Keeping $d$ fixed throughout these two arguments is essential: the limiting field at $d = 0$ is used only to evaluate coefficient limits.

=== 2.1 Inverting the tilted maps <c:rat-inverse>

We first obtain inverse labels anywhere in the wedge; the next subsection tests their lower-boundary inequalities. For fixed $d$, both $W_d$ and $D W_d$ are bounded on the entire wedge. For $\| x \| lt.eq 1 / 2$, consider

$ F_x \( Y \, T \) = \( Y \, T \) + epsilon.alt x W_d \( Y \, T \) . $

We claim that $F_x$ maps $cal(W)$ onto itself for all sufficiently small $epsilon.alt$, uniformly in $x$. The same statement holds with $- epsilon.alt$.

The wall functions $r \/ 2 plus.minus Y$ change by $epsilon.alt x \( - b \/ 2 plus.minus a \)$. Each latter expression vanishes on the corresponding wall and has bounded $Y$-derivative. Moving horizontally from that wall gives

$ \| - b \/ 2 plus.minus a \| lt.eq C_d \( r \/ 2 plus.minus Y \) quad upright("on ") cal(W) . $

For small $epsilon.alt$, therefore, each wall function retains its sign and vanishes precisely on the same wall. The interior maps into the interior and the boundary into the boundary. Also

$ det D F_x = 1 + epsilon.alt^2 x^2 det D W_d > 0 $

uniformly on the wedge, so the image of its interior is open by the inverse function theorem. The image of the closed wedge is closed: a convergent sequence of images has bounded preimages because the displacement is bounded, and hence has a convergent subsequence of preimages in the wedge. Boundary points cannot map to the interior. Consequently the interior image is also closed relative to the connected wedge interior. It is nonempty, so it is the whole interior; closedness supplies the boundary. This proves the claim.

=== 2.2 Why the two families leave no gap <c:rat-overlap>

For $\( x \, y \, h t \) in K$, both $\( y \, t \)$ and $\( x \, - t \)$ lie in $cal(W)$. The preceding surjectivity supplies wedge labels satisfying

$ y & = Y + epsilon.alt x a \( Y \, T \) \, & t & = T + epsilon.alt x b \( Y \, T \) \,\
x & = X - epsilon.alt y a \( X \, R \) \, & - t & = R - epsilon.alt y b \( X \, R \) . $

If either label belongs to $D_(epsilon.alt \, q)$, the point is covered. Suppose both labels fail. Since $P$ and $q$ are nonnegative, this forces $T \, R < 0$. Boundedness of $W_d$ first gives $\| t \| \, \| T \| \, \| R \| = O \( epsilon.alt \)$ and $Y = y + O \( epsilon.alt \)$, $X = x + O \( epsilon.alt \)$. All remainders below are uniform over $K$. Since $b \( Y \, 0 \) = alpha Y$,

$ T = t - epsilon.alt alpha x y + O \( epsilon.alt^2 \) \, #h(2em) R = - t + epsilon.alt alpha x y + O \( epsilon.alt^2 \) . $

Their sum is $O \( epsilon.alt^2 \)$ and both are negative, so separately $T \, R = O \( epsilon.alt^2 \)$. The smooth formulas now give

$ Y & = y + epsilon.alt x c \( y \) + O \( epsilon.alt^2 \) \, & X & = x - epsilon.alt y c \( x \) + O \( epsilon.alt^2 \) \,\
b \( Y \, T \) & = alpha y + epsilon.alt alpha x c \( y \) + O \( epsilon.alt^2 \) \, & b \( X \, R \) & = alpha x - epsilon.alt alpha y c \( x \) + O \( epsilon.alt^2 \) . $

Thus

#[#set math.equation(numbering: n => "(11)")
 $ T + R = - epsilon.alt^2 alpha #scale(x: 120%, y: 120%)[\(] x^2 c \( y \) + y^2 c \( x \) #scale(x: 120%, y: 120%)[\)] + O \( epsilon.alt^3 \) . $ <c:rat-inverse-sum>]

The choice of $P$ is explained by the exact identity

#[#set math.equation(numbering: n => "(12)")
 $ P \( x \) + P \( y \) - alpha #scale(x: 120%, y: 120%)[\(] x^2 c \( y \) + y^2 c \( x \) #scale(x: 120%, y: 120%)[\)] = alpha c_2 \( x^2 - y^2 \)^2 gt.eq 0 . $ <c:rat-square-surplus>]

Replacing $x \, y$ by $X \, Y$ in $P$ changes it by $O \( epsilon.alt \)$. Equation (11) therefore gives

$ T + R gt.eq - epsilon.alt^2 \( P \( X \) + P \( Y \) \) - C epsilon.alt^3 . $

The cutoff at $- 1 \/ 4$ cannot fail when $T \, R = O \( epsilon.alt^2 \)$. Failure of both remaining domain inequalities would give instead

$ T + R < - epsilon.alt^2 \( P \( X \) + P \( Y \) \) - 2 q . $

This contradicts $epsilon.alt^3 = o \( q \)$. The two families therefore cover all of $K$, including the boundary points handled by the inverse maps.

=== 2.3 The area comparison and finite choices <c:rat-area>

We now prove the cost assertions in Proposition 3. The unperturbed label domain $D_0$ has area $1 \/ 8$. For $\| Y \| lt.eq 1 \/ 4$, the added interval below $T = 0$ has length exactly $epsilon.alt^2 P \( Y \) + q$ for small $epsilon.alt$. Outside that interval of $Y$-values, both the width and depth of the added portion are $O \( epsilon.alt^2 \)$, because $q = O \( epsilon.alt^2 \)$ and $P$ is bounded on $\| Y \| lt.eq 3 \/ 8$. Hence

$ \| D_(epsilon.alt \, q) \| = 1 / 8 + epsilon.alt^2 J_d + q / 2 + O \( epsilon.alt^4 \) . $

The field is bounded on these domains. Taylor expansion of the integrand in (8) has uniform remainder $O \( epsilon.alt^4 \)$, and replacing the domain of its quadratic term by $D_0$ changes that term by $O \( epsilon.alt^4 \)$. This proves (9) with its stated remainder.

For the coefficient comparison we may now let $d arrow.b 0$. On $T = 0$ one has $P \( Y \) arrow.r \( 1 \/ 16 + Y^2 \) Y^2$, giving

$ J_d arrow.r integral_(- 1 \/ 4)^(1 \/ 4) \( Y^2 \/ 16 + Y^4 \) thin d Y = 1 / 960 . $

On $D_0$, write $z = Y \/ r$ away from the apex. Then $\| z \| lt.eq 1 \/ 2$, $a arrow.r - \( 1 \/ 16 + z^2 \/ 4 \)$ and $b arrow.r z \/ 2$. The fields are uniformly bounded there for $d > 0$, so bounded convergence and $d Y thin d T = r thin d z thin d r$ yield

$ I_d arrow.r 1 / 2 integral_0^(1 \/ 2) r thin d r integral_(- 1 \/ 2)^(1 \/ 2) [(1 / 16 + z^2 / 4)^2 + 1 / 2 (z / 2)^2] d z = 17 / 15360 . $

This completes the proof of Proposition 3.

There are two useful parameter schedules. First choose $d > 0$ with $Delta_d = I_d - J_d > 0$. For #emph[vanishing padding], take $q = epsilon.alt^(5 \/ 2)$; then

$ C_d \( epsilon.alt \, epsilon.alt^(5 \/ 2) \) \/ h = 1 / 8 - Delta_d epsilon.alt^2 + o \( epsilon.alt^2 \) < 1 / 8 $

for all sufficiently small positive $epsilon.alt$. For #emph[fixed quadratic padding], choose $eta > 0$ with $eta \/ 2 < Delta_d$, keep it fixed, and take $q = eta epsilon.alt^2$. In this case the sharper expression is

$ C_d \( epsilon.alt \, eta epsilon.alt^2 \) \/ h = 1 / 8 - \( Delta_d - eta \/ 2 \) epsilon.alt^2 + O \( epsilon.alt^4 \) < 1 / 8 . $

The parameter order is respectively $d \, epsilon.alt$ or $d \, eta \, epsilon.alt$.

For either schedule, fix such a positive $epsilon.alt$. The label domain is compact, and the field is smooth on a neighborhood of it. The eigenvalues of $D \( plus.minus epsilon.alt W_d \)$ are

$ plus.minus frac(epsilon.alt d, 4 \( r + d \)^2) . $

Since $d$ was fixed first, their magnitudes times the axial half-length $1 \/ 2$ are strictly below one when $epsilon.alt$ is small. Apply Theorem 1.2 of #cite(label("RuledApproximation2026")) with $V = + epsilon.alt W_d$ for $S_(+)$, and with $V = - epsilon.alt W_d$ followed by the isometry $\( x \, y \, z \) mapsto \( y \, x \, - z \)$ for $S_(-)$. Each application gives finitely many cylinders with cost at most $C_d \( epsilon.alt \, q \) + e$. Choose the sum of the two errors less than $h \/ 4 - 2 C_d \( epsilon.alt \, q \) > 0$. Together the finite covers cover $K$ and have total cost less than $h \/ 4 = A_min \( K \) \/ 2$. The approximation theorem gives compact parallelogram bases. Enlarging them slightly in their own perpendicular planes also gives bounded open parallelogram bases, with the total added area chosen smaller than the remaining strict slack. No mesh uniform in $epsilon.alt$ is needed. Similarity scales every base area and the minimum projection area by the same factor, proving Theorem 1 for every positive edge length.

== 3 A threshold proof for fixed quadratic padding <c:rat-threshold>

The preceding overlap proof assumes that both labels fail and then compares their heights. For fixed quadratic padding there is a second way to locate the overlap: give an explicit sufficient height for each family. This also explains why the same quartic polynomial appears in both constructions.

Fix $d \, eta > 0$ and take $q = eta epsilon.alt^2$ in (6). For $\| x \| \, \| y \| lt.eq 1 \/ 2$, put

#[#set math.equation(numbering: n => "(13)")
 $ Theta_x \( y \) = epsilon.alt alpha x y + epsilon.alt^2 #scale(x: 120%, y: 120%)[\(] alpha x^2 c \( y \) - P \( y \) #scale(x: 120%, y: 120%)[\)] . $ <c:rat-threshold-function>]

We prove the following sufficient condition for the first family:

#[#set math.equation(numbering: n => "(14)")
 $ \( y \, t \) in cal(W) \, quad - 1 / 2 lt.eq t lt.eq 1 / 2 \, quad t gt.eq Theta_x \( y \) quad arrow.r.double quad \( y \, t \) = F_x \( Y \, T \) upright(" for some ") \( Y \, T \) in D_(epsilon.alt \, q) . $ <c:rat-threshold-inclusion>]

All bounds below are uniform in the displayed variables, with $d \, eta$ fixed.

On the rectangle $cal(R) = \[ - 1 \, 1 \] times \[ - 1 \, 1 / 2 + d \/ 2 \]$ the field is smooth and has a finite Lipschitz constant $L_d$. For small $epsilon.alt$, the map

$ \( Y \, T \) mapsto \( y \, t \) - epsilon.alt x W_d \( Y \, T \) $

is a contraction of $cal(R)$ into itself for $\| y \| lt.eq 1 \/ 2$, $- 1 \/ 2 lt.eq t lt.eq 1 \/ 2$. Indeed the target rectangle has positive margins inside $cal(R)$, the field is bounded there, and $epsilon.alt L_d \/ 2 < 1$. The inverse label therefore exists and is unique in $cal(R)$. The inverse preserves the wedge directly. Indeed,

$ - b \/ 2 + a & = - \( r \/ 2 + Y \) frac(2 Y + 2 d + r, 8 \( r + d \)^2) \,\
- b \/ 2 - a & = \( r \/ 2 - Y \) frac(- 2 Y + 2 d + r, 8 \( r + d \)^2) . $

The displayed coefficients are bounded on $cal(R)$. The target wall functions $\( 1 \/ 2 - t \) \/ 2 plus.minus y$ are therefore the corresponding label wall functions $r \/ 2 plus.minus Y$ multiplied by positive factors when $epsilon.alt$ is small. Nonnegativity of the target wall functions implies nonnegativity of the label wall functions, including equality on either wall. Thus this inversion argument does not require the surjectivity proof in Section 2.1.

For fixed $x \, y$, the inverse height $T$ increases strictly with $t$. In fact if the target heights differ by $Delta t > 0$, and $p \, p'$ are their inverse labels, then

$ \| \( p' - p \) - \( 0 \, Delta t \) \| lt.eq frac(epsilon.alt L_d, 2) \| p' - p \| lt.eq frac(epsilon.alt L_d \/ 2, 1 - epsilon.alt L_d \/ 2) thin Delta t . $

The last coefficient is less than one for small $epsilon.alt$. At $t = Theta_x \( y \)$, the inverse equations first give $Y = y + O \( epsilon.alt \)$ and $T = O \( epsilon.alt \)$. Using $b \( y \, 0 \) = alpha y$ improves the latter bound to $T = O \( epsilon.alt^2 \)$. Consequently

$ Y = y + epsilon.alt x c \( y \) + O \( epsilon.alt^2 \) \, #h(2em) b \( Y \, T \) = alpha y + epsilon.alt alpha x c \( y \) + O \( epsilon.alt^2 \) \, $

and substitution in the height equation gives

$ T = - epsilon.alt^2 P \( y \) + O \( epsilon.alt^3 \) = - epsilon.alt^2 P \( Y \) + O \( epsilon.alt^3 \) . $

The rectangle inversion also applies at the threshold if $\( y \, Theta_x \( y \) \)$ lies outside the wedge. Boundedness of the field on $cal(R)$ gives $Y = y + O \( epsilon.alt \)$ uniformly over the entire target height interval, not only at the threshold. Thus changing from the threshold label to any of these labels changes $P \( Y \)$ by $O \( epsilon.alt \)$. Combining this bound with monotonicity gives, for all $t gt.eq Theta_x \( y \)$ under consideration,

$ T gt.eq - epsilon.alt^2 P \( Y \) - C epsilon.alt^3 gt.eq - epsilon.alt^2 P \( Y \) - eta epsilon.alt^2 \, #h(2em) T gt.eq - 1 / 4 $

when $epsilon.alt$ is sufficiently small. The inverse label is in the wedge, proving (14).

Applying the same argument with $x$ replaced by $- y$ gives a sufficient condition $- t gt.eq Theta_(- y) \( x \)$ for the second family. But

$ Theta_x \( y \) + Theta_(- y) \( x \) = - epsilon.alt^2 alpha c_2 \( x^2 - y^2 \)^2 lt.eq 0 . $

At least one of those two conditions holds for every point of $K$. This proves coverage again. The fixed positive $eta$ absorbs the uniform cubic inverse error; the area calculation in Section 2.3 then shows how small $eta$ must be chosen before fixing $epsilon.alt$.

== 4 Two coordinate forms and two finite realization methods <c:rational-dictionary>

The rational construction already gives a finite cover with a strict area saving. We now express the same geometry in fully orthonormal coordinates and compare two other ways to obtain its finite cylinders. The coordinate change tracks the slope, quartic padding, and perpendicular area together. In these coordinates the logarithmic-cell theorem gives bounded open bases; in the centered coordinates the product-cell theorem does so under a weaker smoothness assumption. All three methods approximate the same weighted integral cost to arbitrary additive accuracy, but their hypotheses and base shapes differ.

Put $c_(*) = 1 \/ sqrt(2)$ and

#[#set math.equation(numbering: n => "(15)")
 $ K_0 = { \( x_0 \, y_0 \, z_0 \) : 0 lt.eq z_0 lt.eq 2 \, \| y_0 \| lt.eq c_(*) z_0 \, med \| x_0 \| lt.eq c_(*) \( 2 - z_0 \) } . $ <c:uncentered-tetrahedron>]

It is a regular tetrahedron of edge $2 sqrt(2)$. For a fixed $d_0 > 0$, define on $s > - d_0$

#[#set math.equation(numbering: n => "(16)")
 $ g \( s \) & = frac(1 + d_0, s + d_0) \,\
v_1 \( u \, s \) & = c_(*)^2 s g \( s \) + 1 / 2 \( c_(*)^2 s^2 - u^2 \) g' \( s \) \, & v_2 \( u \, s \) & = u g \( s \) . $ <c:uncentered-field>]

This is the stream-function field associated with $g \( s \) \( u^2 - c_(*)^2 s^2 \) \/ 2$. In particular it is tangent to $u = plus.minus c_(*) s$. Let

#[#set math.equation(numbering: n => "(17)")
 $ A_0 & = c_(*)^2 (1 - frac(1, 2 \( 1 + d_0 \))) \, & B_0 & = frac(1, 2 \( 1 + d_0 \)) \,\
a_0 \( u \) & = A_0 u^2 + B_0 u^4 = u^2 v_1 \( u \, 1 \) \,\
U_k & = { \( u \, s \) : 0 lt.eq s lt.eq 3 \/ 2 \, \| u \| lt.eq c_(*) s \, s lt.eq 1 + k^2 \( a_0 \( u \) + eta_0 \) } \, $ <c:uncentered-polynomial>]

where $eta_0 > 0$ will be fixed before the tilt $k > 0$. For $\| r \| lt.eq 2 c_(*)$, write $F_r \( p \) = p + r k v \( p \)$. The two swept sets are

#[#set math.equation(numbering: n => "(18)")
 $ E_1 & = { \( x_0 \, y_0 \, z_0 \) : \| x_0 \| lt.eq 2 c_(*) \, \( y_0 \, z_0 \) in F_(x_0) \( U_k \) } \,\
E_2 & = { \( x_0 \, y_0 \, z_0 \) : \| y_0 \| lt.eq 2 c_(*) \, \( x_0 \, 2 - z_0 \) in F_(- y_0) \( U_k \) } . $ <c:uncentered-sweeps>]

#thm([Proposition 4.1.])[
  #emph[Let $ell = 1 \/ \( 2 sqrt(2) \)$ and define the Euclidean similarity 
$ Phi \( x_0 \, y_0 \, z_0 \) = \( - ell x_0 \, ell y_0 \, ell \( 1 - z_0 \) \) . $

 Then $Phi K_0 = K_1$, and the two sets in (18) are carried exactly to the two sets in (7) with 
#[#set math.equation(numbering: n => "(19)")
 $ d = d_0 \/ 2 \, #h(2em) epsilon.alt = 4 \( 1 + d_0 \) k \, #h(2em) q = eta_0 k^2 \/ 2 . $ <c:rational-parameter-dictionary>]

 In particular $q = eta epsilon.alt^2$ where $eta = eta_0 \/ \[ 32 \( 1 + d_0 \)^2 \]$. All perpendicular areas are multiplied by $1 \/ 8$.]
] <c:rational-coordinate-identity>

#proof[
  Write $\( Y \, T \) = \( ell u \, \( 1 - s \) \/ 2 \)$, so $r = s \/ 2$. Substitution into (3) gives
  #[#set math.equation(numbering: n => "(20)")
   $ v_1 \( u \, s \) = - 4 \( 1 + d_0 \) a \( Y \, T \) \, #h(2em) v_2 \( u \, s \) = 2 sqrt(2) \( 1 + d_0 \) b \( Y \, T \) . $ <c:rational-field-dictionary>]
  At $s = 1$, these identities and $alpha = \( 1 + d_0 \)^(- 1)$ give
  $ P \( ell u \) = frac(a_0 \( u \), 32 \( 1 + d_0 \)^2) . $
  Consequently the last inequality defining $U_k$ is exactly $T gt.eq - epsilon.alt^2 P \( Y \) - q$, and $s lt.eq 3 \/ 2$ is $T gt.eq - 1 \/ 4$. The wedge inequalities correspond as well. For the first family, $x = - ell x_0$ converts its two coordinate equations into $y = Y + epsilon.alt x a \( Y \, T \)$ and $t = T + epsilon.alt x b \( Y \, T \)$. For the second, take $\( X \, R \) = \( - ell u \, \( 1 - s \) \/ 2 \)$ and use that $a$ is even and $b$ is odd in the first coordinate. This gives precisely the second equation in (7). The bounds on the free coordinate become $\| x \| \, \| y \| lt.eq 1 \/ 2$. Finally, $Phi$ is an isometry followed by dilation by $ell$; it multiplies every perpendicular area by $ell^2 = 1 \/ 8$. ◻
]

The monotone thresholds in Section 3 therefore give, in these coordinates, the sufficient condition

#[#set math.equation(numbering: n => "(21)")
 $ z_(*) lt.eq 1 + k r u + k^2 #scale(x: 120%, y: 120%)[\(] a_0 \( u \) - r^2 v_1 \( u \, 1 \) #scale(x: 120%, y: 120%)[\)] quad arrow.r.double quad \( u \, z_(*) \) in F_r \( U_k \) \, $ <c:uncentered-threshold>]

provided $0 lt.eq z_(*) lt.eq 2$ and $\| u \| lt.eq c_(*) z_(*)$. The two right-hand thresholds sum to $2 + k^2 B_0 \( x_0^2 - y_0^2 \)^2 gt.eq 2$. Thus the exact transformation preserves both the bounded contraction argument and the nonnegative overlap surplus, including the wedge walls.

=== 4.1 Logarithmic-cell realization of the fixed-padding cover <logarithmic-cell-realization-of-the-fixed-padding-cover>

For the field (16), direct differentiation gives

#[#set math.equation(numbering: n => "(22)")
 $ "tr" D v = 0 \, #h(2em) det D v = - c_(*)^2 (frac(\( 1 + d_0 \) d_0, \( s + d_0 \)^2))^2 < 0 . $ <c:uncentered-spectrum>]

The determinant simplification uses $g g'' \/ 2 = \( g' \)^2$. For fixed $d_0$, the field is $C^2$ on an open rectangle containing $U_k$ for every sufficiently small $k$. The boundary of $U_k$ has area zero, since it lies in finitely many lines and a polynomial graph. The strict spectral condition $2 c_(*) k sqrt(- det D v) < 1$ also holds there for small $k$. These are exactly the hypotheses of Corollary 4.4 of #cite(label("RuledApproximation2026")). It supplies finite covers of each set in (18) with bounded open measurable bases, at cost arbitrarily close from above to

#[#set math.equation(numbering: n => "(23)")
 $ J_k = integral_(U_k) \( 1 + k^2 \| v \( u \, s \) \|^2 \)^(- 1 \/ 2) thin d u thin d s . $ <c:logarithmic-cost>]

The second application uses $- v$ and an isometry.

The exact cost comparison can also be checked in these coordinates. Put $U_0 = { 0 lt.eq s lt.eq 1 \, \| u \| lt.eq c_(*) s }$, of area $c_(*)$. The same strip calculation as in Section 2.3 gives

#[#set math.equation(numbering: n => "(24)")
 $ J_k = c_(*) + k^2 {integral_(- c_(*))^(c_(*)) \( a_0 \( u \) + eta_0 \) thin d u - 1 / 2 integral_(U_0) \| v \|^2} + O \( k^4 \) . $ <c:uncentered-cost>]

For fixed $d_0 \, eta_0$, the added horizontal and vertical extensions are $O \( k^2 \)$; their product is the fourth-order boundary remainder. Letting $d_0 arrow.b 0$ only in the coefficient integrals, and setting $u = s b$, gives

$ 1 / 2 integral_(U_0) \| v \|^2 & arrow.r 1 / 4 integral_(- c_(*))^(c_(*)) [frac(\( c_(*)^2 + b^2 \)^2, 4) + b^2] d b = c_(*)^3 / 6 + frac(7 c_(*)^5, 30) \,\
integral_(- c_(*))^(c_(*)) a_0 \( u \) thin d u & arrow.r frac(8 c_(*)^5, 15) . $

Bounded convergence is valid because $\| u \| lt.eq c_(*) s$ bounds the fields uniformly for $0 < d_0 < 1$. The first limit exceeds the second by $c_(*)^3 \/ 60 > 0$. Choose $d_0 > 0$ such that the actual difference

$ Delta \( d_0 \) = 1 / 2 integral_(U_0) \| v \|^2 - integral_(- c_(*))^(c_(*)) a_0 \( u \) thin d u $

is positive. Then choose $0 < eta_0 < Delta \( d_0 \) \/ \( 2 c_(*) \)$, and finally $k$ small. Formula (24) gives $J_k < c_(*)$. Only then choose the two finite errors with sum less than $2 \( c_(*) - J_k \)$. The resulting finite open-base cover has cost below $2 c_(*) = A_min \( K_0 \) \/ 2$.

The $C^2$ rectangle and strict spectral inequality give the open-base conclusion directly in the orthonormal $\( u \, s \)$ coordinates. The scaling identity gives $C_d \( epsilon.alt \, q \) = J_k \/ 8$, in agreement with Proposition 4.

=== 4.2 Product-cell realization of the centered cover <product-cell-realization-of-the-centered-cover>

For $q = epsilon.alt^(5 \/ 2)$, use the original centered label set $D_(epsilon.alt \, q)$ and the two slopes $V = plus.minus epsilon.alt W_d$. The set is compact with area-zero boundary, $V$ is $C^1$ on an open neighborhood, and $D V$ has eigenvalues $plus.minus epsilon.alt d \/ \[ 4 \( r + d \)^2 \]$. With $M = 1 \/ 2$ and $h = 1 \/ sqrt(2)$, the strict condition $0 < M lambda < 1$ follows after fixing $d > 0$ and taking $epsilon.alt$ sufficiently small. Therefore Theorem 4.1 of #cite(label("RuledApproximation2026")) gives each family a finite cover with bounded open measurable bases and cost at most $C_d \( epsilon.alt \, epsilon.alt^(5 \/ 2) \) + e$.

The product-cell proof chooses its padding, product threshold, and local scale in that order, exhausts the interior by disjoint cells, and covers the remaining null set before taking a finite open subcover. These approximation choices occur after the present geometric parameters are fixed. By (9), choose $d$ with $I_d > J_d$, then $epsilon.alt$ so that $C_d < h \/ 8$, and finally the two errors with sum below $h \/ 4 - 2 C_d$. This gives the asserted open-base cover without altering either the fractional padding or the weighted physical metric. The compact parallelogram construction in Section 2.3 remains an independent finite realization of the same swept sets.

== 5 A singular power-law field <c:sing-fields>

The rational field smooths the common tip before tilting the lines. We now keep a power-law singularity in the derivative and remove a small tip region instead. Two triangular-base cylinders cover the removed regions; their cost is smaller than the quadratic saving from the tilted families. The exponent of the power law makes both requirements compatible. We give the construction at edge length two, where the cone walls have slopes $plus.minus 1$, and then state its exact edge-one form.

We use the regular tetrahedron of edge length $2$,

$ K_2 = { \( x \, y \, sqrt(2) thin t \) : 0 lt.eq t lt.eq 1 \, med \| x \| lt.eq 1 - t \, med \| y \| lt.eq t } . $

The physical metric in these coordinates is $d x^2 + d y^2 + 2 thin d t^2$. The minimum projection area is $A_min \( K_2 \) = 4 A_min \( K_1 \) = sqrt(2)$, since these regular tetrahedra are related by a similarity of ratio two. Appendix 7 gives two independent proofs of this normalization.

#thm([Theorem 5.1.])[
  #emph[For every 
$ 1 < p < \( sqrt(51) - 5 \) \/ 2 \, #h(2em) 1 < gamma < 1 \/ \( 2 - p \) \, $

 all sufficiently small positive $c$ determine a finite cylinder cover of the regular edge-$2$ tetrahedron $K_2$ above with total perpendicular base area less than $sqrt(2) \/ 2$. The cover consists of two finite families with compact parallelogram bases and two cylinders with compact triangular bases. Before the arbitrarily small errors needed for the two finite approximations, the area bound is 
$ sqrt(2) / 2 + 2 sqrt(2) thin kappa_p c^2 + o \( c^2 \) \, #h(2em) kappa_p = frac(\( 1 \/ 2 \)^4 \( 2 p^2 + 10 p - 13 \), 30 p) < 0 . $

 The asymptotic statement fixes $p$ and $gamma$ first. Each finite approximation is chosen after the positive value of $c$ is fixed.]
] <c:sing-theorem>

Put $a = 1 \/ 2$. The two cylinders obtained by splitting at $t = a$, with axes parallel to the $x$- and $y$-axes respectively, have total base area $2 sqrt(2) thin a^2 = sqrt(2) \/ 2$. We perturb those directions.

=== 5.1 The field and the cutoff <the-field-and-the-cutoff>

Fix parameters in the order

#[#set math.equation(numbering: n => "(25)")
 $ 1 < p < frac(sqrt(51) - 5, 2) \, #h(2em) 1 < gamma < frac(1, 2 - p) \, #h(2em) d = c^gamma quad \( c > 0 \) . $ <c:sing-parameters>]

The upper bound on $p$ makes the quadratic area coefficient negative. The bounds on $gamma$ make the derivative of the tilted field uniformly small while keeping the tip area $o \( c^2 \)$. Only $c$ will tend to zero. To obtain a field tangent to the cone walls $b = plus.minus r$, take a stream function that vanishes on both walls. Multiplying $b^2 - r^2$ by $r^(p - 2)$ makes the stream function homogeneous of degree $p$, so the resulting field has degree $p - 1$. The normalization below also gives $Q \( b \, a \) = b$, which will cancel the first-order overlap terms. For $r > 0$, define

#[#set math.equation(numbering: n => "(26)")
 $ psi \( b \, r \) & = 1 / 2 \( r \/ a \)^(p - 2) \( b^2 - r^2 \) \, & V = \( P \, Q \) & = \( - partial_r psi \, partial_b psi \) \,\
P \( b \, r \) & = a / 2 \( r \/ a \)^(p - 1) [p + \( 2 - p \) \( b \/ r \)^2] \, & Q \( b \, r \) & = \( r \/ a \)^(p - 2) b . $ <c:sing-field>]

At the dividing level let

#[#set math.equation(numbering: n => "(27)")
 $ P_a \( b \) = P \( b \, a \) = frac(a p, 2) + frac(2 - p, 2 a) b^2 \, #h(2em) delta \( b \) = b^2 P_a \( b \) . $ <c:sing-ceiling-polynomial>]

Thus $delta gt.eq 0$, $Q \( b \, a \) = b$, and $Q = plus.minus P$ on $b = plus.minus r$. Our compact label domain is

#[#set math.equation(numbering: n => "(28)")
 $ D_c = { \( b \, r \) : d lt.eq r lt.eq 2 \, med \| b \| lt.eq r \, med r lt.eq a + c^2 delta \( b \) + c^(5 \/ 2) } . $ <c:sing-domain>]

The field is smooth on $r > 0$, and direct differentiation gives

#[#set math.equation(numbering: n => "(29)")
 $ "tr" D V = 0 \, #h(2em) det D V = \( r \/ a \)^(2 p - 4) frac(p - 1, 2) [\( 2 - p \) \( b \/ r \)^2 - p] < 0 quad \( \| b \| lt.eq r \) . $ <c:sing-hyperbolicity>]

Indeed the determinant equals $det D^2 psi$; the bracket is at most $2 - 2 p < 0$. On this cone, $parallel D V \( b \, r \) parallel lt.eq C r^(p - 2)$, with $C$ depending only on the fixed parameters. Consequently

#[#set math.equation(numbering: n => "(30)")
 $ c sup_(D_c) parallel D V parallel lt.eq C c d^(p - 2) = C c^(1 - gamma \( 2 - p \)) arrow.r 0 \, #h(2em) d^2 = o \( c^2 \) . $ <c:sing-cutoff-estimates>]

Thus, for sufficiently small $c$, both $c D V$ and $- c D V$ have eigenvalues $lambda \, - lambda$ with $0 < lambda < 1$ at every label. Although no derivative bound is asserted at $r = 0$, each fixed $D_c$ has a neighborhood on which the field is smooth.

Write $s = 1 - t$. Consider the two sets of segments

#[#set math.equation(numbering: n => "(31)")
 $ E_c^(-) & = { \( x \, y \, sqrt(2) thin t \) : \| x \| lt.eq 1 \, med \( y \, t \) = \( b \, r \) + c x V \( b \, r \) \, med \( b \, r \) in D_c } \,\
E_c^(+) & = { \( x \, y \, sqrt(2) thin t \) : \| y \| lt.eq 1 \, med \( x \, s \) = \( b \, r \) - c y V \( b \, r \) \, med \( b \, r \) in D_c } . $ <c:sing-families>]

We apply Theorem 1.2 of #cite(label("RuledApproximation2026")) with $h = sqrt(2)$ and $L = 1$ to the first family with field $c V$. Interchanging $x \, y$ and reflecting and translating the physical height gives the second family with field $- c V$. Thus, for each fixed sufficiently small $c$ and any $e > 0$, each family has a finite cylinder cover with compact parallelogram bases and total base area at most

#[#set math.equation(numbering: n => "(32)")
 $ J \( c \) + e \, #h(2em) J \( c \) = sqrt(2) integral_(D_c) frac(d b thin d r, sqrt(1 + c^2 \( P^2 + 2 Q^2 \))) . $ <c:sing-cost-integral>]

The factor $2$ multiplying $Q^2$ records the physical height scale.

These two applications use the companion’s single square-tile construction. For the fixed compact cutoff domain $D_c$, the fields $plus.minus c V$ are $C^1$ on a neighborhood. Equations (29) and (30) give $"tr" D \( plus.minus c V \) = 0$ and $- 1 < det D \( plus.minus c V \) < 0$ for sufficiently small $c$, which is the theorem’s condition for $L = 1$. The tile orientations may vary, but their weights use the velocities in the original $\( b \, r \)$ coordinates, giving (32) with the physical factor $sqrt(2)$. No condition on the area of $partial D_c$ or smallness of the operator norm is required by the theorem. The separate cylinders introduced next cover the omitted tips.

We add an $x$-parallel cylinder with triangular base ${ \( 0 \, y \, sqrt(2) thin t \) : 0 lt.eq t lt.eq 2 d \, med \| y \| lt.eq t }$, and the analogous $y$-parallel cylinder at the upper end, obtained by projecting ${ 0 lt.eq s lt.eq 2 d \, med \| x \| lt.eq s }$ to the plane $y = 0$. Each base has area

#[#set math.equation(numbering: n => "(33)")
 $ sqrt(2) integral_0^(2 d) 2 r thin d r = sqrt(2) \( 2 d \)^2 . $ <c:sing-tip-cost>]

=== 5.2 Inversion, including the cone boundary <inversion-including-the-cone-boundary>

All estimates below are uniform over the points under consideration, with $p$ and $gamma$ fixed. Suppose

$ 2 d lt.eq T lt.eq 1 \, #h(2em) \| B \| lt.eq T \, #h(2em) \| k_0 \| lt.eq c . $

We first solve

#[#set math.equation(numbering: n => "(34)")
 $ \( B \, T \) = \( b \, r \) + k_0 V \( b \, r \) $ <c:sing-inverse>]

without imposing the last inequality of (28). In the closed Euclidean ball of radius $T \/ 4$ about $\( B \, T \)$, one has $3 T \/ 4 lt.eq r lt.eq 5 T \/ 4$ and $\| b \| \/ r lt.eq 5 \/ 3$. Formula (26) gives bounds $\| V \| lt.eq C T^(p - 1)$ and $parallel D V parallel lt.eq C T^(p - 2)$ throughout the ball. The map

$ \( b \, r \) mapsto \( B \, T \) - k_0 V \( b \, r \) $

maps this ball into itself and is a contraction for all sufficiently small $c$, since $c T^(p - 2) lt.eq c \( 2 d \)^(p - 2) = o \( 1 \)$. Its fixed point satisfies $d lt.eq r lt.eq 2$.

To prove that this fixed point lies in the cone, use the exact identities

#[#set math.equation(numbering: n => "(35)")
 $ Q \( b \, r \) plus.minus P \( b \, r \) = frac(r plus.minus b, 2) \( r \/ a \)^(p - 2) [\( 2 - p \) b \/ r plus.minus p] . $ <c:sing-wall-factorization>]

Equation (34) consequently gives

$ T plus.minus B = \( r plus.minus b \) \( 1 + theta_plus.minus \) \, #h(2em) \| theta_plus.minus \| lt.eq C c r^(p - 2) = o \( 1 \) . $

The factors $1 + theta_plus.minus$ are positive. Since $T plus.minus B gt.eq 0$, we obtain $r plus.minus b gt.eq 0$. This also handles equality on either wall: no boundary point is lost in passing to inverse labels.

=== 5.3 The two families overlap sufficiently <the-two-families-overlap-sufficiently>

Take a point of $K_2$ outside the two tip regions, so that $t \, s gt.eq 2 d$. Apply (34) to $\( B \, T \) = \( y \, t \)$ with $k_0 = c x$, and to $\( B \, T \) = \( x \, s \)$ with $k_0 = - c y$. Let the resulting labels be $\( b_(-) \, r_(-) \)$ and $\( b_(+) \, r_(+) \)$. They already satisfy $d lt.eq r_plus.minus lt.eq 2$ and $\| b_plus.minus \| lt.eq r_plus.minus$. It remains to show that one label satisfies its ceiling in (28).

Suppose both ceilings fail. Since $delta gt.eq 0$, this implies $r_(-) \, r_(+) > a$. The inverse equations give

#[#set math.equation(numbering: n => "(36)")
 $ b_(-) & = y - c x P \( b_(-) \, r_(-) \) \, & b_(+) & = x + c y P \( b_(+) \, r_(+) \) \,\
r_(-) + r_(+) & = 1 + c [y Q \( b_(+) \, r_(+) \) - x Q \( b_(-) \, r_(-) \)] . $ <c:sing-inverse-sum>]

All labels now lie in a fixed compact region with $r gt.eq a$, on which the field and its derivatives are bounded. The last equation first gives $r_(-) + r_(+) = 1 + O \( c \)$. Because both summands exceed $a = 1 \/ 2$, each is $a + O \( c \)$. The first two equations also give $b_(-) = y + O \( c \)$ and $b_(+) = x + O \( c \)$. Using $Q \( b \, a \) = b$, the bracket in the last equation is therefore $y x - x y + O \( c \) = O \( c \)$. This improves the sum to $1 + O \( c^2 \)$ and each height to $a + O \( c^2 \)$.

Refining the first two equations and again using $Q \( b \, a \) = b$, we obtain

$ b_(-) = y - c x P_a \( y \) + O \( c^2 \) \, #h(2em) b_(+) = x + c y P_a \( x \) + O \( c^2 \) \, #h(2em) Q \( b_plus.minus \, r_plus.minus \) = b_plus.minus + O \( c^2 \) . $

Substitution into (36) yields

#[#set math.equation(numbering: n => "(37)")
 $ r_(-) + r_(+) = 1 + c^2 [x^2 P_a \( y \) + y^2 P_a \( x \)] + O \( c^3 \) . $ <c:sing-overlap-expansion>]

On the other hand, failure of both ceilings gives

$ r_(-) + r_(+) > 1 + c^2 [delta \( b_(-) \) + delta \( b_(+) \)] + 2 c^(5 \/ 2) . $

Here $delta \( b_(-) \) + delta \( b_(+) \) = delta \( y \) + delta \( x \) + O \( c \)$, and

$ delta \( y \) + delta \( x \) - x^2 P_a \( y \) - y^2 P_a \( x \) & = \( x^2 - y^2 \) [P_a \( x \) - P_a \( y \)]\
 & = frac(2 - p, 2 a) \( x^2 - y^2 \)^2 gt.eq 0 . $

Comparison with (37) would force $2 c^(5 \/ 2) lt.eq C c^3$, which is impossible for sufficiently small $c$. Thus every middle-region point belongs to $E_c^(-) union E_c^(+)$. Together with the two closed tip cylinders, the two families cover all of $K_2$.

=== 5.4 The exact quadratic saving <the-exact-quadratic-saving>

Let

$ H = { \( b \, r \) : 0 < r lt.eq a \, med \| b \| lt.eq r } \, #h(2em) \| H \| = a^2 . $

The deletion of $r < d$ removes area $d^2 = o \( c^2 \)$. The area added above $r = a$ is

$ c^2 integral_(- a)^a delta \( b \) thin d b + o \( c^2 \) . $

Indeed, for $\| b \| lt.eq a$ its thickness is exactly $c^2 delta \( b \) + c^(5 \/ 2)$. Since $\| b \| lt.eq r lt.eq 2$ and $delta$ is bounded there, the remaining portion has $a < \| b \| lt.eq a + O \( c^2 \)$ and thickness $O \( c^2 \)$, hence area $O \( c^4 \)$. The field is uniformly bounded on $\| b \| lt.eq r lt.eq 2$ because $p > 1$. Taylor expansion of the integrand in (32) therefore has uniform remainder $O \( c^4 \)$. Also $\| D_c triangle.stroked.t H \| arrow.r 0$, so the bounded quadratic coefficient may be integrated over $H$. Including one tip cylinder, we conclude that

#[#set math.equation(numbering: n => "(38)")
 $ frac(J \( c \), sqrt(2)) + 4 d^2 = a^2 + c^2 kappa_p + o \( c^2 \) \, #h(2em) kappa_p = integral_(- a)^a delta \( b \) thin d b - 1 / 2 integral_H \( P^2 + 2 Q^2 \) thin d b thin d r . $ <c:sing-area-expansion>]

Both terms admit elementary evaluations. The first is

$ integral_(- a)^a delta \( b \) thin d b = a^4 (p / 3 + frac(2 - p, 5)) = frac(2 a^4 \( p + 3 \), 15) . $

For the second, put $eta = b \/ r$. Then

$ P = a / 2 \( r \/ a \)^(p - 1) \[ p + \( 2 - p \) eta^2 \] \, #h(2em) Q = a \( r \/ a \)^(p - 1) eta \, #h(2em) d b thin d r = r thin d eta thin d r . $

It follows that

$ 1 / 2 integral_H \( P^2 + 2 Q^2 \) thin d b thin d r & = frac(a^4, 4 p) integral_(- 1)^1 {1 / 4 \[ p + \( 2 - p \) eta^2 \]^2 + 2 eta^2} thin d eta\
 & = frac(a^4 \( 2 p^2 + 2 p + 13 \), 30 p) . $

Thus the exact coefficient is

#[#set math.equation(numbering: n => "(39)")
 $ #box(stroke: black, inset: 3pt, [$ kappa_p = frac(a^4 \( 2 p^2 + 10 p - 13 \), 30 p) < 0 . $]) $ <c:sing-coefficient>]

The range of $p$ in (25) is precisely the range above $1$ on which this expression is negative. At $p = 1$ its continuous extension is $- a^4 \/ 30$; the construction itself uses $p > 1$ to retain strict hyperbolicity.

===== 5.4.1 Completion with finitely many cylinders. <completion-with-finitely-many-cylinders.>

We can now finish the proof of Theorem 5. First fix $p$ in the stated range and then $gamma$ in (25). Choose a positive $c$ small enough for the derivative bounds, all coverage statements, and

$ 2 J \( c \) + 8 sqrt(2) thin d^2 = sqrt(2) / 2 + 2 sqrt(2) thin kappa_p c^2 + o \( c^2 \) < sqrt(2) / 2 . $

Call the strict difference $Delta > 0$. Only after fixing this $c$ do we apply Theorem 1.2 of #cite(label("RuledApproximation2026")) to each family, choosing its additive error less than $Delta \/ 4$. Those two finite covers and the two triangular tip cylinders give an actual finite cover of $K_2$ whose total base area is strictly less than $A_min \( K_2 \) \/ 2$. The main bases are compact parallelograms. No uniform choice of their meshes as $c arrow.r 0$ is needed.

=== 5.5 Edge-one normalization and alternative cutoffs <c:sing-edge-one>

The edge-one form allows a direct comparison with the rational field. First we transport the whole construction by a similarity; then we explain which cutoff and padding may be changed without changing its quadratic saving. The similarity halves physical lengths while leaving the height label unchanged:

$ \( x \, y \, sqrt(2) thin t \) mapsto \( y \/ 2 \, x \/ 2 \, t \/ sqrt(2) \) \, #h(2em) \( w \, l \) = \( b \/ 2 \, r \) \, #h(2em) k = 4 c . $

Put $h = 1 \/ sqrt(2)$ and define

$ hat(V)_1 \( w \, l \) = 1 / 4 P \( 2 w \, l \) \, #h(2em) hat(V)_2 \( w \, l \) = 1 / 2 Q \( 2 w \, l \) \, #h(2em) f \( w \) = w^2 hat(V)_1 \( w \, 1 \/ 2 \) . $

Equivalently, $hat(V) = \( - partial_l H_(*) \, partial_w H_(*) \)$ for $H_(*) \( w \, l \) = 2^(p - 3) \( w^2 l^(p - 2) - l^p \/ 4 \)$. The two segment families transform exactly, and

$ k^2 \( hat(V)_1^2 + h^2 hat(V)_2^2 \) = c^2 \( P^2 + 2 Q^2 \) \, #h(2em) c^2 delta \( 2 w \) = k^2 f \( w \) . $

With $S = "diag" \( 1 \/ 2 \, 1 \)$, the derivative identity is

$ hat(V) = 1 / 2 S V compose S^(- 1) \, #h(2em) 1 / 2 k D hat(V) = c S \( D V \) S^(- 1) . $

Thus the scaled eigenvalues for axial half-length $L = 1 \/ 2$ agree with those of $c D V$. Under the fixed physical rescaling, the derivative is likewise similar to $plus.minus k D hat(V)$. This is a spectral statement; the nonorthogonal matrix $S$ does not preserve the ordinary operator norm. No operator-norm transfer is needed by the square-tile theorem. The already constructed physical cylinder cover also transports by the Euclidean similarity above.

Physical areas scale by $1 \/ 4$. Therefore the per-family quadratic coefficient after dividing physical area by $h$ is $kappa_p \/ 32$; the positive saving in that normalization is

$ - kappa_p / 32 = frac(13 - 10 p - 2 p^2, 15360 p) . $

For this exact similarity the cutoff becomes $4^(- gamma) k^gamma$ and the ceiling padding becomes $k^(5 \/ 2) \/ 32$.

The estimates also permit independent choices of these two auxiliaries. Indeed, the preceding inverse, overlap, and area proofs hold with a positive cutoff $rho \( c \)$ and padding $q \( c \) > 0$ whenever

#[#set math.equation(numbering: n => "(40)")
 $ rho \( c \) = o \( c \) \, #h(2em) c rho \( c \)^(p - 2) arrow.r 0 \, #h(2em) q \( c \) = o \( c^2 \) \, #h(2em) c^3 = o \( q \( c \) \) . $ <c:sing-cutoff-flexibility>]

The contraction and wall-sign estimates use only the second condition; the deleted label area and two tip areas use the first. The overlap contradiction compares $2 q \( c \)$ with $O \( c^3 \)$, and the coefficient is unchanged because $q \( c \) = o \( c^2 \)$. On the retained set $r lt.eq 2$, the ceiling forces $r lt.eq 1 \/ 2 + O \( c^2 \)$. Replacing its upper bound $2$ by $1$ therefore leaves the label set unchanged for sufficiently small $c$.

We can now state the edge-one variant with its own cutoff. Choose $1 < beta < 1 \/ \( 2 - p \)$ and put $sigma = k^beta$. The field and padding polynomial are explicitly

#[#set math.equation(numbering: n => "(41)")
 $ hat(V)_1 \( w \, l \) & = 1 / 4 \( 2 l \)^(p - 1) \[ \( 2 - p \) \( w \/ l \)^2 + p \/ 4 \] \,\
hat(V)_2 \( w \, l \) & = 1 / 2 \( 2 l \)^(p - 1) \( w \/ l \) \, #h(2em) f \( w \) = w^2 \[ \( 2 - p \) w^2 + p \/ 16 \] . $ <c:sing-edge-one-field>]

The image tetrahedron is

$ tilde(K)_1 = { \( x \, y \, h s \) : 0 lt.eq s lt.eq 1 \, med \| x \| lt.eq s \/ 2 \, med \| y \| lt.eq \( 1 - s \) \/ 2 } . $

It is the translate $K_1 + \( 0 \, 0 \, h \/ 2 \)$ of the centered tetrahedron in (2). Its two segment families are

$ \( x \, s \) = \( w \, l \) + k y hat(V) \( w \, l \) \, quad \| y \| lt.eq 1 \/ 2 \, #h(2em) \( y \, 1 - s \) = \( w \, l \) - k x hat(V) \( w \, l \) \, quad \| x \| lt.eq 1 \/ 2 \, $

with labels

$ D_k = { sigma lt.eq l lt.eq 1 \, med \| w \| lt.eq l \/ 2 \, med l lt.eq 1 \/ 2 + k^2 f \( w \) + k^(5 \/ 2) } . $

Under $c = k \/ 4$, these new choices pull back to $rho \( c \) = \( 4 c \)^beta$ and $q \( c \) = \( 4 c \)^(5 \/ 2)$, which satisfy (40). Thus coverage follows from the full preceding proof, including its closed inversions and two tip cylinders. The scaled eigenvalue bound is now $O \( k sigma^(p - 2) \) = o \( 1 \)$, so Theorem 1.2 of #cite(label("RuledApproximation2026")) applies with $L = 1 \/ 2$. For every positive error $e$, each finite family costs at most $I \( k \) + e$, where

#[#set math.equation(numbering: n => "(42)")
 $ I \( k \) = h integral_(D_k) \( 1 + k^2 \( hat(V)_1^2 + h^2 hat(V)_2^2 \) \)^(- 1 \/ 2) thin d w thin d l . $ <c:sing-edge-one-cost>]

There are exactly two additional tip cylinders, each of area $2 h sigma^2$.

The coefficient has the following direct edge-one evaluation. On $D_0 = { 0 lt.eq l lt.eq 1 \/ 2 \, med \| w \| lt.eq l \/ 2 }$, put

$ A \( p \) = integral_(- 1 \/ 4)^(1 \/ 4) f \( w \) thin d w = frac(2 - p, 2560) + p / 1536 \, #h(2em) G \( p \) = 1 / 2 integral_(D_0) \( hat(V)_1^2 + h^2 hat(V)_2^2 \) thin d w thin d l . $

Substituting $R = w \/ l$ gives

#[#set math.equation(numbering: n => "(43)")
 $ G \( p \) & = frac(1, 16 p) {frac(\( 2 - p \)^2 \/ 80 + p \( 2 - p \) \/ 24 + p^2 \/ 16, 16) + 1 / 96} \,\
A \( p \) - G \( p \) & = frac(2 p^2 + 10 p - 13, 15360 p) . $ <c:sing-edge-one-coefficient>]

Here $integral_0^(1 \/ 2) l \( 2 l \)^(2 p - 2) thin d l = 1 \/ \( 8 p \)$ and the second and fourth moments on $\[ - 1 \/ 2 \, 1 \/ 2 \]$ are $1 \/ 12$ and $1 \/ 80$. In particular $A \( 1 \) = 16 \/ 15360$ and $G \( 1 \) = 17 \/ 15360$ are continuous coefficient limits. They coincide with the rational limits of $J_d$ and $I_d$ in (10). We still fix $p > 1$, then $beta$, then a positive $k$, and finally the two finite errors. This gives $2 I \( k \) + 4 h sigma^2 < h \/ 4$ before those errors. The minimum projection area of $tilde(K)_1$ is $h \/ 2$ by the similarity above.

At the endpoint $p = 1$, writing $theta = b \/ r$, the original edge-two field in (26) becomes

$ P \( b \, r \) = frac(1 + theta^2, 4) \, #h(2em) Q \( b \, r \) = theta / 2 . $

These formulas depend only on the angle of the label. The cutoff requirements (40) would now demand both $rho \( c \) = o \( c \)$ and $c \/ rho \( c \) arrow.r 0$, which are incompatible. The next section fixes a truncated label set, applies the square-zero case of the same finite-approximation theorem, and covers the apex segments by a finite velocity net. The field agrees with the endpoint above; the padding and the treatment of the apex are chosen anew.

== 6 Angular fields with square-zero differential <c:nil-section>

We now use the limiting field from the end of Section 5.5, which is constant along each ray of its triangular label domain. Its differential generates a shear, so the square-zero case of the finite approximation theorem applies away from the apex. We prove closed coverage by two such sweeps, compute their cost, and then cover the omitted apex segments by a finite net.

Return to the edge-two tetrahedron $K_2$ of Section 5, using the normalized height $z$ in place of $t$ and setting $h = sqrt(2)$:

#[#set math.equation(numbering: n => "(44)")
 $ K_2 = { \( x \, y \, h z \) : 0 lt.eq z lt.eq 1 \, med \| x \| lt.eq 1 - z \, med \| y \| lt.eq z } \, #h(2em) h = sqrt(2) . $ <c:nil-tetrahedron>]

Its minimum projection area is $h$, as established by similarity in Section 5. Thus $\( x \, y \, z \)$ are normalized coordinates: their Euclidean metric is $d x^2 + d y^2 + 2 thin d z^2$. The physical similarity

#[#set math.equation(numbering: n => "(45)")
 $ \( x \, y \, h z \) mapsto (x / 2 \, y / 2 \, frac(1 \/ 2 - z, sqrt(2))) $ <c:nil-similarity>]

has ratio $1 \/ 2$ and takes $K_2$ to the centered edge-one tetrahedron $K_1$: writing $t = 1 \/ 2 - z$, its image satisfies $\| X \| lt.eq \( 1 \/ 2 + t \) \/ 2$, $\| Y \| lt.eq \( 1 \/ 2 - t \) \/ 2$, and has physical height $t \/ sqrt(2)$. Both perpendicular base areas and projection areas are divided by four. We retain the present scale throughout this section.

=== 6.1 Choosing the angular field <choosing-the-angular-field>

Write a nonzero label in the upper half-plane as $b = \( p t \, t \)$, where $t > 0$. For a field of the form $G \( b \) = \( v \( p \) \, w \( p \) \)$, differentiation gives

$ D G \( b \) = 1 / t vec(v' \( p \), w' \( p \)) mat(delim: "(", 1, - p) . $

Thus $v' \( p \) = p w' \( p \)$ makes $\( D G \)^2 = 0$: the row in this product annihilates its column. We also want the velocity tangent to the boundary rays $p = plus.minus 1$, which requires $v \( p \) = p w \( p \)$ there. Fix $c = 1 \/ 2$ and choose $w \( p \) = c p$. Integrating the differential relation with these endpoint conditions determines $v$. We also define $a$ by

#[#set math.equation(numbering: n => "(46)")
 $ v \( p \) = c / 2 \( 1 + p^2 \) \, #h(2em) w \( p \) = c p \, #h(2em) a \( p \) = c^2 p^2 v \( p \) . $ <c:nil-angular-functions>]

The last function specifies the quadratic overlap we will allow. For $0 < k < 1$, put

$ H \( p \) = c + k^2 a \( p \) + k^3 \, #h(2em) - 1 lt.eq p lt.eq 1 . $

The extra cubic term provides a strict margin in the coverage proof. In normalized coordinates define two sets swept out by segments:

#[#set math.equation(numbering: n => "(47)")
 $ cal(E)_(+) & = { \( s \, p t + k s v \( p \) \, t + k s w \( p \) \) : \| s \| lt.eq 1 \, med \| p \| lt.eq 1 \, med 0 lt.eq t lt.eq H \( p \) } \,\
cal(E)_(-) & = { \( p t - k s v \( p \) \, s \, 1 - t + k s w \( p \) \) : \| s \| lt.eq 1 \, med \| p \| lt.eq 1 \, med 0 lt.eq t lt.eq H \( p \) } . $ <c:nil-sweeps>]

At $k = 0$ the two sweeps cover the lower and upper halves of the tetrahedron by axis-parallel segments. For positive $k$ we must check that their varying tilts do not leave a gap between them.

#thm([Lemma 6.1.])[
  #emph[For every $0 < k < 1$, every normalized point of $K_2$ belongs to $cal(E)_(+) union cal(E)_(-)$.]
] <c:nil-sweep-cover>

#proof[
  We first record an elementary inversion including the endpoints. If $z gt.eq 0$, $d in bb(R)$ and $\| y \| lt.eq z$, the equation
  $ y = r z + d \( 1 - r^2 \) $
  has a solution $r in \[ - 1 \, 1 \]$ with $z - 2 d r gt.eq 0$. For $d > 0$, the nondecreasing part of this concave quadratic starts at $r = - 1$ with value $- z$ and reaches a value at least $z$. For $d < 0$, the nondecreasing part of the convex quadratic ends at $r = 1$ with value $z$ and starts at a value at most $- z$. For $d = 0$ the equation is linear; if also $z = 0$, then $y = 0$ and any $r$ is allowed.
  For a normalized point $\( x \, y \, z \)$ of $K_2$, apply this observation twice to obtain $r \, q in \[ - 1 \, 1 \]$ such that
  #[#set math.equation(numbering: n => "(48)")
   $ y & = r z + frac(k c x, 2) \( 1 - r^2 \) \, & t & = z - k c x r gt.eq 0 \,\
x & = q \( 1 - z \) - frac(k c y, 2) \( 1 - q^2 \) \, & t' & = 1 - z + k c y q gt.eq 0 . $ <c:nil-inversion>]
  Equivalently,
  #[#set math.equation(numbering: n => "(49)")
   $ y = r t + k x v \( r \) \, #h(2em) x = q t' - k y v \( q \) . $ <c:nil-inverse-sweeps>]
  If $t lt.eq H \( r \)$, the first sweep contains the point with axial parameter $s = x$. If $t' lt.eq H \( q \)$, the second contains it with $s = y$. In both cases $\| s \| lt.eq 1$.
  Suppose both inequalities fail. Then $t \, t' > c$, while
  $ t + t' = 1 + k c \( y q - x r \) lt.eq 1 + 2 k c . $
  Since $2 c = 1$, both $t - c$ and $t' - c$ lie between zero and $2 k c$. The bounds $\| x \| \, \| y \| lt.eq 1$ and $0 < v lt.eq c$, together with (49), now imply
  #[#set math.equation(numbering: n => "(50)")
   $ \| x - c q \| lt.eq 3 k c \, #h(2em) \| y - c r \| lt.eq 3 k c . $ <c:nil-center-error>]
  Substituting (49) into the expression for $t + t' - 1$ gives the exact identity
  #[#set math.equation(numbering: n => "(51)")
   $ \( 1 - k c r q \) \( t - c \) + \( 1 + k c r q \) \( t' - c \) = k^2 c #scale(x: 120%, y: 120%)[\(] x q v \( r \) + y r v \( q \) #scale(x: 120%, y: 120%)[\)] . $ <c:nil-overlap-identity>]
  Both coefficients on the left are positive. The assumed cutoff failures make that side strictly greater than
  $ k^2 \( a \( r \) + a \( q \) \) + #scale(x: 120%, y: 120%)[\(] 2 + c r q \( a \( q \) - a \( r \) \) #scale(x: 120%, y: 120%)[\)] k^3 gt.eq k^2 \( a \( r \) + a \( q \) \) + \( 2 - c^4 \) k^3 \, $
  since $0 lt.eq a lt.eq c^3$. On the other hand, (50) bounds the right side by
  $ k^2 c^2 #scale(x: 120%, y: 120%)[\(] q^2 v \( r \) + r^2 v \( q \) #scale(x: 120%, y: 120%)[\)] + 6 c^3 k^3 lt.eq k^2 \( a \( r \) + a \( q \) \) + 6 c^3 k^3 . $
  The last inequality follows from $\( r^2 - q^2 \) \( v \( r \) - v \( q \) \) gt.eq 0$. These bounds contradict $6 c^3 < 2 - c^4$ at $c = 1 \/ 2$. All inversions used closed intervals, so the same argument includes the faces, edges and vertices. ◻
]

=== 6.2 The cost predicted by the sweeps <the-cost-predicted-by-the-sweeps>

We have proved complete coverage by two continuous families. We next compute their limiting cost, so that a definite positive tolerance is available when making the cover finite.

For a planar tile $T$ and a constant velocity $g = \( g_1 \, g_2 \)$, write

$ cal(C) \( T \, g \) = { \( s \, xi \) : s in bb(R) \, med xi in T + s g } \, #h(2em) J_h \( g \) = \( 1 + g_1^2 + h^2 g_2^2 \)^(- 1 \/ 2) . $

The two physical maps

#[#set math.equation(numbering: n => "(52)")
 $ F_(+) \( s \, xi \) = \( s \, xi_1 \, h xi_2 \) \, #h(2em) F_(-) \( s \, xi \) = \( xi_1 \, s \, h \( 1 - xi_2 \) \) $ <c:nil-physical-maps>]

send this auxiliary cylinder to cylinders with perpendicular base area $h \| T \| J_h \( g \)$. Indeed, the transverse tile has physical area $h \| T \|$, and projection to the plane perpendicular to $\( 1 \, g_1 \, h g_2 \)$ has area factor $J_h \( g \)$. The second map differs from the first by a Euclidean isometry. A square $T$, of any orientation, therefore gives a compact convex parallelogram base.

Under these maps the two sweeps have the common auxiliary form

#[#set math.equation(numbering: n => "(53)")
 $ \( s \, \( p t \, t \) + s sigma k \( v \( p \) \, w \( p \) \) \) \, #h(2em) \| s \| \, \| p \| lt.eq 1 \, quad 0 lt.eq t lt.eq H \( p \) \, #h(2em) sigma in { 1 \, - 1 } . $ <c:nil-signed-sweep>]

The Jacobian of $\( p \, t \) mapsto \( p t \, t \)$ is $t$. The integral predicting the weighted tile cost of either sweep is consequently

#[#set math.equation(numbering: n => "(54)")
 $ I \( k \) = integral_(- 1)^1 frac(H \( p \)^2, 2) #scale(x: 120%, y: 120%)[\(] 1 + k^2 \( v \( p \)^2 + h^2 w \( p \)^2 \) #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) thin d p . $ <c:nil-integral>]

#thm([Lemma 6.2.])[
  #emph[As $k arrow.b 0$, 
$ I \( k \) = 1 / 4 - k^2 / 480 + O \( k^3 \) . $

 In particular $I \( k \) < 1 \/ 4$ for every sufficiently small positive $k$.]
] <c:nil-saving>

#proof[
  All functions of $p$ in (54) are uniformly bounded on $\[ - 1 \, 1 \]$. Expanding the two factors, uniformly on that interval, gives
  #[#set math.equation(numbering: n => "(55)")
   $ I \( k \) = c^2 + k^2 (c integral_(- 1)^1 a \( p \) thin d p - c^2 / 4 integral_(- 1)^1 \( v \( p \)^2 + h^2 w \( p \)^2 \) thin d p) + O \( k^3 \) . $ <c:nil-expansion>]
  Direct polynomial integration yields
  $ integral_(- 1)^1 a \( p \) thin d p = frac(8 c^3, 15) \, #h(2em) integral_(- 1)^1 \( v \( p \)^2 + 2 w \( p \)^2 \) thin d p = frac(34 c^2, 15) . $
  The coefficient of $k^2$ in (55) is therefore $- c^4 \/ 30 = - 1 \/ 480$, as asserted. ◻
]

=== 6.3 A finite cover, including the apex <a-finite-cover-including-the-apex>

We now realize the saving by finitely many cylinders. On the open half-plane $b_2 > 0$ define

$ G_sigma \( b \) = sigma k #scale(x: 120%, y: 120%)[\(] v \( b_1 \/ b_2 \) \, w \( b_1 \/ b_2 \) #scale(x: 120%, y: 120%)[\)] \, $

using the same polynomial formulas for $v \, w$ at every real argument. This is a smooth field, and the earlier differential computation gives

#[#set math.equation(numbering: n => "(56)")
 $ D G_sigma \( p t \, t \) = frac(sigma k c, t) vec(p, 1) mat(delim: "(", 1, - p) \, #h(2em) \( D G_sigma \)^2 = 0 . $ <c:nil-rank-one>]

At $t = 0$ every label $\( p t \, t \)$ is the origin, but its assigned velocity still depends on $p$. Thus the field has no continuous extension to the apex. That part of the family must be covered separately.

#thm([Lemma 6.3.])[
  (A finite apex net).  #emph[Fix $0 < k < 1$ and $0 < rho lt.eq 1$. For either sign $sigma$, the part of (53) with $0 lt.eq t lt.eq rho$ is covered by at most $ceil.l 2 \/ rho ceil.r + 1$ auxiliary cylinders. Their tiles are squares of side $2 \( 1 + k c \) rho$, and their total weighted tile area is at most 
#[#set math.equation(numbering: n => "(57)")
 $ 16 \( 1 + k c \)^2 rho . $ <c:nil-apex-cost>]

]
] <c:nil-apex-net>

#proof[
  Put $m = ceil.l 2 \/ rho ceil.r$ and $p_j = - 1 + 2 j \/ m$ for $0 lt.eq j lt.eq m$. Every $p in \[ - 1 \, 1 \]$ is within $rho$ of one $p_j$. Use the common tile $T_j = \[ - \( 1 + k c \) rho \, \( 1 + k c \) rho \]^2$ and velocity $g_j = sigma k \( v \( p_j \) \, w \( p_j \) \)$. Since $\| v' \| lt.eq c$ and $\| w' \| = c$ on this interval, each coordinate of
  $ \( p t \, t \) + s sigma k #scale(x: 120%, y: 120%)[\(] \( v \( p \) \, w \( p \) \) - \( v \( p_j \) \, w \( p_j \) \) #scale(x: 120%, y: 120%)[\)] $
  has absolute value at most $\( 1 + k c \) rho$ for $0 lt.eq t lt.eq rho$ and $\| s \| lt.eq 1$. The cylinders therefore cover these segments, also at $t = 0$. Finally $J_h lt.eq 1$ and $m + 1 lt.eq 2 \/ rho + 2 lt.eq 4 \/ rho$, so their weighted cost is at most $\( 4 \/ rho \) thin 4 \( 1 + k c \)^2 rho^2$. ◻
]

The remaining finite approximation uses the same square-tile theorem, Theorem 1.2 of #cite(label("RuledApproximation2026")), with $L = 1$. A square-zero planar matrix has trace and determinant zero, so it satisfies the theorem’s condition $"tr" D G = 0$ and $- 1 < det D G lt.eq 0$. For a fixed compact set $D$, a $C^1$ field $G$ on a neighborhood of $D$, fixed $h > 0$, and positive tolerance, the theorem supplies finitely many compact nondegenerate square tiles, with possibly different orientations, and velocities covering ${ \( s \, b + s G \( b \) \) : b in D \, med \| s \| lt.eq 1 }$. Their weighted cost is at most $integral_D J_h \( G \)$ plus that tolerance. The weights use the original velocity coordinates. Neither a small-shear condition nor a boundary regularity assumption is required.

#thm([Proposition 6.4.])[
  #emph[The tetrahedron $K_2$ admits a finite cylinder cover with compact convex parallelogram perpendicular bases whose total area is less than $1 / 2 min_(\| u \| = 1) \| pi_(u^perp) K_2 \|$.]
] <c:nil-finite-counterexample>

#proof[
  Choose and fix $0 < k < 1$ with $I \( k \) < c^2$, and then choose $0 < epsilon.alt < c^2 - I \( k \)$. Next fix
  $ 0 < rho < min {c \, frac(epsilon.alt, 32 \( 1 + k c \)^2)} . $
  The apex net of Lemma 8 costs less than $epsilon.alt \/ 2$ in weighted tile area, for each sign. Only now form the truncated label set
  $ D_rho = { \( p t \, t \) : - 1 lt.eq p lt.eq 1 \, med rho lt.eq t lt.eq H \( p \) } . $
  It is compact, lies in the open half-plane $b_2 > 0$, and the field $G_sigma$ is $C^1$ on that neighborhood. Equation (56) verifies its square-zero differential there, hence trace and determinant zero. We may therefore apply Theorem 1.2 of #cite(label("RuledApproximation2026")) with this fixed $D_rho$, physical factor $h = sqrt(2)$, unit axial interval, and tolerance $epsilon.alt \/ 2$. Although the derivative may become large when $rho$ is small, no hypothesis bounds it by a prescribed constant; the finite approximation is chosen after $rho$ has been fixed.
  Since the weight is independent of $t$ and of the sign,
  $ integral_(D_rho) J_h \( G_sigma \( b \) \) thin d b = integral_(- 1)^1 frac(H \( p \)^2 - rho^2, 2) #scale(x: 120%, y: 120%)[\(] 1 + k^2 \( v \( p \)^2 + h^2 w \( p \)^2 \) #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) thin d p lt.eq I \( k \) . $
  Combining the approximation with the apex net gives a finite physical cylinder cover of each entire sweep at cost at most $h \( I \( k \) + epsilon.alt \)$. All its perpendicular bases are compact convex parallelograms by (52). Lemma 6 now proves that the two lists together cover the whole tetrahedron, and their total area is at most
  $ 2 h \( I \( k \) + epsilon.alt \) < 2 h c^2 = h / 2 = 1 / 2 min_(\| u \| = 1) \| pi_(u^perp) K_2 \| . $
  The explicit apex count controls the omitted endpoint. Finiteness of the other lists is supplied at the fixed tolerance; no uniform bound on their number is needed. ◻
]

== 7 Two further projection-area identities <c:projection-appendix>

The barycentric argument in Section 2 gives the reference area needed for the covering constructions. We record two independent geometric explanations of that area: one uses the second moments of the face normals, and the other relates the projection of a simplex to its longest parallel chord.

Use the edge-two tetrahedron

$ K_2 = { \( x \, y \, h t \) : 0 lt.eq t lt.eq 1 \, med \| x \| lt.eq 1 - t \, med \| y \| lt.eq t } \, #h(2em) h = sqrt(2) . $

=== 7.1 Second moments of the face normals <second-moments-of-the-face-normals>

#thm([Lemma 7.1.])[
  #emph[For the regular tetrahedron $K_2$ just defined, $A_min \( K_2 \) = sqrt(2)$.]
] <c:normal-frame>

#proof[
  The facet-area form of the polytope projection formula #cite(label("Martini1991")) equation (1), p. 83, and Section 3 can be seen directly here. The outward unit face normals are
  $ n_1 \, n_2 = \( 0 \, plus.minus sqrt(2) \, - 1 \) \/ sqrt(3) \, #h(2em) n_3 \, n_4 = \( plus.minus sqrt(2) \, 0 \, 1 \) \/ sqrt(3) . $
  Each face has area $sqrt(3)$, and for a unit vector $u$ the front faces project onto the projection of $K_2$ with disjoint interiors, apart from sets of area zero. The back faces give the same area. Consequently
  #[#set math.equation(numbering: n => "(58)")
   $ \| pi_(u^perp) K_2 \| = sqrt(3) / 2 sum_(i = 1)^4 \| u dot.op n_i \| . $ <c:sing-normal-projection>]
  Since $sum_i n_i = 0$ and $sum_i n_i n_i^(sans(T)) = 4 / 3 I_3$, the numbers $a_i = u dot.op n_i$ sum to zero and have squared sum $4 \/ 3$. If $S$ is the sum of their positive parts, then the negative parts have absolute sum $S$, so $4 \/ 3 = sum_i a_i^2 lt.eq 2 S^2$. Equation (58) is therefore at least $sqrt(2)$, with equality for $u = \( 1 \, 0 \, 0 \)$. Thus $A_min \( K_2 \) = sqrt(2)$. ◻
]

=== 7.2 Projection area from overlap volumes <projection-area-from-overlap-volumes>

The same comparison area can be obtained from an identity for every nondegenerate tetrahedron. The simplex chord–projection identity is attributed to Martini and Weissbach in #cite(label("Heinrich2014")) p. 8268. The following proof differentiates the volume of a translated intersection.

#thm([Lemma 7.2.])[
  #emph[Let $T subset bb(R)^3$ be a nondegenerate tetrahedron, let $u$ be a Euclidean unit vector, and let $L_u$ be the length of a longest chord of $T$ parallel to $u$. Then 
#[#set math.equation(numbering: n => "(59)")
 $ \| pi_(u^perp) T \| = frac(3 "vol" \( T \), L_u) . $ <c:nil-chord-projection>]

 In particular, $min_(\| u \| = 1) \| pi_(u^perp) K_2 \| = h$.]
] <c:nil-projection>

#proof[
  Let $lambda_1 \, dots.h \, lambda_4$ be the affine barycentric coordinates of $T$, and put $Delta_i = lambda_i \( x + u \) - lambda_i \( x \)$. These differences are independent of $x$ and sum to zero. They do not all vanish, since barycentric coordinates distinguish points. Consequently
  $ M = sum_(i = 1)^4 max \( 0 \, - Delta_i \) > 0 . $
  For $e gt.eq 0$, the conditions $x in T$ and $x + e u in T$ are equivalent to $lambda_i \( x \) gt.eq e max \( 0 \, - Delta_i \)$ for every $i$. The lower bounds use total barycentric mass $e M$. The intersection $T ∩ \( T - e u \)$ is therefore nonempty exactly when $e lt.eq M^(- 1)$; for $e < M^(- 1)$ it is a translate of a homothetic copy of $T$ of ratio $1 - e M$. This proves $L_u = M^(- 1)$ and
  #[#set math.equation(numbering: n => "(60)")
   $ "vol" \( T ∩ \( T - e u \) \) = \( 1 - e M \)^3 "vol" \( T \) \, #h(2em) 0 lt.eq e < M^(- 1) . $ <c:nil-overlap-volume>]
  Let $ell \( q \)$ be the length of the fiber of $T$ above $q in pi_(u^perp) T$. Fubini’s theorem gives
  $ "vol" \( T ∩ \( T - e u \) \) = integral_(pi_(u^perp) T) \( ell \( q \) - e \)_(+) thin d q . $
  Every point in the interior of the projection has a fiber of positive length. Indeed, homothetic copies of $T$ about an interior point, with ratios increasing to one, lie in the interior of $T$, and their projections exhaust the interior of its projection. The boundary of the projection polygon has area zero. The difference quotient of $\( ell - e \)_(+)$ at $e = 0$ lies between $- 1$ and zero, and tends to $- 1$ wherever $ell > 0$. Dominated convergence thus makes the right derivative of the last integral equal to $- \| pi_(u^perp) T \|$. Differentiating (60) proves (59).
  The horizontal sections of $K_2$ give
  $ "vol" \( K_2 \) = h integral_0^1 4 z \( 1 - z \) thin d z = frac(2 h, 3) . $
  Its vertices $\( plus.minus 1 \, 0 \, 0 \)$ and $\( 0 \, plus.minus 1 \, h \)$ are pairwise at distance two. The distance between two convex combinations of the vertices is at most the largest vertex distance, by the triangle inequality. Hence its diameter is two. Every $L_u$ is at most two, and an edge direction attains two. The identity just proved therefore gives the minimum projection area $h$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
