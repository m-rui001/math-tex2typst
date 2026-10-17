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

#align(center)[#text(size: 16pt, weight: "bold")[Finite triangular approximation of radial sweeps]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Radial sweeps and finite cylinders <sec:introduction>

A cylinder in $bb(R)^3$ is a set $B + bb(R) u$, where $u$ is a unit vector and $B subset u^perp$ is a measurable planar set of finite area. Its cost is $"area" \( B \)$. In a finite cover, the costs are added with multiplicity. For a convex body $K$, write

$ A_min \( K \) = min_(lr(bar.v.double u bar.v.double) = 1) "area" \( pi_(u^perp) K \) . $

The half-area question asks whether every finite cylinder cover of $K$ has cost at least $A_min \( K \) \/ 2$. A regular tetrahedron has a simple cover by two opposite-edge cylinders attaining this value. A second covering quantity is the directionwise normalized cost

$ sum_i frac("area" \( B_i \), "area" \( pi_(u_i^perp) K \)) \, $

which divides each base area by the shadow in its own axis direction.

These questions extend plank covering, where the cost of a covering slab is its width rather than the area of a planar base. Bezdek’s Problem 3.1 attributes the half-area question and the tetrahedral equality example to Bang #cite(label("Bezdek2009")). Bezdek and Litvak prove that the directionwise normalized cost is at least $1 \/ 3$ for every three-dimensional convex body and at least $1$ for ellipsoids #cite(label("BL2009")) Theorem 3.1. In dimension three, Bezdek and Khan’s #emph[1-Codimensional Cylinder Covering Conjecture] proposes the lower bound $1 \/ 2$ for all convex bodies #cite(label("BK2016")) Definition 3 and Conjecture 4.13. Such a normalized bound would imply the half-minimum bound, since each directional projection area is at least $A_min \( K \)$. The half-area question also appears in Verreault’s survey #cite(label("Verreault2026")) Question 4.14. Our construction lowers the tetrahedron’s two-cylinder cost strictly by varying the directions, while keeping coverage after finite approximation.

Our approximation problem begins before the cylinders are selected. Let $P$ be a two-dimensional Euclidean plane through the origin, and let $e$ be a unit normal to $P$. Choose linearly independent $a \, b in P$, an interval $J = \[ alpha \, beta \]$ with $alpha < beta$, a continuous function $R : J arrow.r \[ 0 \, oo \)$, and a continuously differentiable function $w : J arrow.r P$. With $p_0 in P$ and $L > 0$, consider the compact set

#[#set math.equation(numbering: n => "(1.1)")
 $ cal(S) = { p_0 + rho \( a + t b \) + s \( e + w \( t \) \) : t in J \, med 0 lt.eq rho lt.eq R \( t \) \, med \| s \| lt.eq L } . $ <eq:radial-sweep>]

At each $t$, the intercepts form one radial segment in $P$ and the parallel swept segments have direction $e + w \( t \)$. The direction varies with $t$, so this description is not yet a finite cylinder cover.

Put $kappa = \| det_P \( a \, b \) \|$, the area of their parallelogram. The radial parameterization has area element $kappa rho thin d rho thin d t$. Projection onto the plane perpendicular to $e + w \( t \)$ contributes the factor $\( 1 + lr(bar.v.double w \( t \) bar.v.double)^2 \)^(- 1 \/ 2)$. These two factors suggest the weighted area

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(A) = kappa integral_alpha^beta frac(R \( t \)^2, 2 sqrt(1 + lr(bar.v.double w \( t \) bar.v.double)^2)) thin d t . $ <eq:weighted-area>]

Freezing arbitrary segment directions need not preserve this cost. The following alignment condition makes the loss vanish.

#thm([Theorem 1.1.])[
  #emph[For the data in (1.1), suppose that 
$ w' \( t \) = lambda \( t \) \( a + t b \) #h(2em) \( t in J \) $

 for a continuous real function $lambda$. For any finite partition $alpha = t_0 < t_1 < dots.h.c < t_N = beta$, put $I_i = \[ t_(i - 1) \, t_i \]$ and choose arbitrary tags $c_i in I_i$. There are $N$ cylinders covering $cal(S)$, with axes parallel to $e + w \( c_i \)$ and nondegenerate compact triangular perpendicular bases. These covers can be chosen so that their total base area tends to $cal(A)$ as the mesh $delta = max_i \| I_i \|$ tends to zero, uniformly over the partitions and tags.]
  #emph[Alternatively, take each base to be the perpendicular projection of the actual compact sweep with $t in I_i$, in the same frozen direction $e + w \( c_i \)$. These $N$ cylinders cover $cal(S)$, and their total base area also tends to $cal(A)$, uniformly over the partitions and tags.]
] <thm:radial>

The hypothesis has a direct geometric meaning. To first order, a change in direction moves the intercept along its existing ray. After that displacement is absorbed into the radial coordinate, the remaining transverse displacement is quadratic in the interval length. A slightly extended triangle contains all these intercepts and adds only a vanishing total area. The radial cap $R$ may vanish, and $lambda$ may change sign or vanish.

The tetrahedral application gives the following concrete consequence.

#thm([Corollary 1.2.])[
  #emph[Every regular tetrahedron $K subset bb(R)^3$ of positive edge length has a finite cylinder cover $B_i + bb(R) u_i$, with unit axes $u_i$ and nondegenerate compact triangular bases $B_i subset u_i^perp$, such that 
$ sum_i "area" \( B_i \) < frac(A_min \( K \), 2) \, #h(2em) sum_i frac("area" \( B_i \), "area" \( pi_(u_i^perp) K \)) < 1 / 2 . $

]
] <cor:tetrahedron>

There is a useful connection with finite approximation for velocity fields having square-zero derivative. Away from the apex, write $z = rho \( a + t b \)$ with $rho > 0$ and $t in \( alpha \, beta \)$, and define $W \( z \) = w \( t \)$. This is a $C^1$ field in the open angular sector. The angular differential $D t$ annihilates $a + t b$, whereas $D W = w' \( t \) ⊗ D t$. The alignment hypothesis therefore gives $\( D W \)^2 = 0$. General finite approximation for such fields concerns a larger class of ruled sets; see the companion article #cite(label("RuledApproximation2026")) Theorem 1.2 and Section 3. Theorem 1 proves the simultaneous prescribed-tag, one-cylinder-per-interval and triangular-base guarantee directly, including the apex. Merely splitting parallelogram bases into triangles would not preserve that prescribed count and choice of axes. No approximation theorem for general velocity fields is used here.

The proof of Theorem 1 in Section 2 constructs the enclosing triangles and bounds their total excess area. The actual projected sweep contains the projection of the unperturbed radial sector, which supplies the matching lower bound. Thus different finite bases have the same limiting cost.

Section 3 proves Corollary 2 with two overlapping sweeps. A cubic enlargement of their radial caps exceeds the uniform error in selecting a segment through each point, while a negative quadratic projection cost survives finite approximation. Section 4 develops the alternative shortened-beam construction: the beam saving and the residual-strip cost cancel to first order, leaving a strict quadratic improvement. Its quantitative cost statement separates this construction from the all-triangular cover already obtained.

The appendices collect supplementary calculations and alternative finite bases. Appendix 5 gives simplex projection normalizations. Appendix 6 compares overlap margins, Appendix 7 computes explicit finite enclosures, and Appendix 8 transports the construction between physical and barycentric coordinates. These calculations retain their own formulas and geometric realizations; neither main construction requires them.

== 2 A triangle around each frozen intercept <sec:freezing>

We prove Theorem 1. The required estimate is local to one interval, but its error must be uniform over the whole partition. Set

$ M = max_J \| lambda \| \, #h(2em) A = L M \, #h(2em) B = L M \/ 2 . $

Take any finite partition $alpha = t_0 < t_1 < dots.h.c < t_N = beta$. For each interval $I = \[ t_(j - 1) \, t_j \]$, put $d_I = \| I \|$, let $m_I$ be its midpoint, and set $R_I = max_I R$. Write $delta = max_I d_I$ for the mesh. The freezing tag $c_I in I$ need not be the midpoint.

Move a point of (1.1) with $t in I$ parallel to $e + w \( c_I \)$ until it reaches $P$. Its intercept is

$ p_0 + rho \( a + t b \) + s \( w \( t \) - w \( c_I \) \) = p_0 + u a + v b \, $

where, using the derivative hypothesis,

#[#set math.equation(numbering: n => "(2.1)")
 $ u & = rho + s integral_(c_I)^t lambda \( xi \) thin d xi \,\
v - t u & = s integral_(c_I)^t lambda \( xi \) \( xi - t \) thin d xi . $ <eq:radial-coordinate>]

Consequently

#[#set math.equation(numbering: n => "(2.2)")
 $ - A d_I lt.eq u lt.eq R_I + A d_I \, #h(2em) \| v - m_I u \| lt.eq d_I / 2 \| u \| + B d_I^2 . $ <eq:old-footprint>]

The first inequality uses $\| t - c_I \| lt.eq d_I$; the second also uses $\| t - m_I \| lt.eq d_I \/ 2$. In particular, the error transverse to a ray is of order $d_I^2$, even though $u$ can move by order $d_I$ and can become negative.

To enclose both the transverse error and the negative radial collar, choose $C = 2 \( A + B \) + 1$. Define the triangle in $P$

#[#set math.equation(numbering: n => "(2.3)")
 $ T_I = {p_0 + u a + v b : - C d_I lt.eq u lt.eq R_I + A d_I \, quad \| v - m_I u \| lt.eq d_I / 2 \( u + C d_I \)} . $ <eq:triangle>]

Its width is zero at $u = - C d_I$ and is positive at $u = R_I + A d_I$. Since $R_I + \( A + C \) d_I > 0$, it is nondegenerate, including when $R_I = 0$.

The triangle contains every intercept in (2.2). The radial ranges are nested because $C > A$. For $u gt.eq 0$ the difference between the new half-width and $d_I \| u \| \/ 2$ is $C d_I^2 \/ 2 gt.eq B d_I^2$. For $- A d_I lt.eq u < 0$, that difference is

$ d_I u + C / 2 d_I^2 gt.eq (C / 2 - A) d_I^2 gt.eq B d_I^2 . $

This proves containment on both sides of the original radial tip; Figure 1 illustrates that extension.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.8775, -1.95), (-0.273, 2.08), (2.145, 2.08), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((-0.8775, -1.95), (-0.273, 2.08), (2.145, 2.08), close: true, stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((-0.4095, -0.39), (-0.117, 0), (0.195, 2.08), (1.677, 2.08), (0.117, 0), (0.0585, -0.39), close: true, fill: rgb("#ffd9b2"), stroke: none)
  line((-0.4095, -0.39), (-0.117, 0), (0.195, 2.08), (1.677, 2.08), (0.117, 0), (0.0585, -0.39), close: true, stroke: (paint: rgb("#b25a00"), thickness: 0.4pt, miter-limit: 10))
  line((-0.8775, -1.95), (0.936, 2.08), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-1.3, 0), (2.535, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.535, 0), [$v$], anchor: "west", padding: 0.1176cm)
  line((0, -2.21), (0, 2.509), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 2.509), [$u$], anchor: "south", padding: 0.1176cm)
  content((-0.884, -1.885), [$-"Cd"_I$], anchor: "east", padding: 0.1176cm)
  content((-0.442, -0.39), [$-"Ad"_I$], anchor: "east", padding: 0.1176cm)
  content((2.145, 2.08), [$R_I+"Ad"_I$], anchor: "west", padding: 0.1176cm)
  content((1.43, 0.585), [#text(fill: rgb("#0000a6"))[$T_I$]])
})],
  caption: [Figure 1: In intercept coordinates, the orange polygon bounds the frozen sweep, including the small region below $u = 0$. The enclosing blue triangle extends its tip to $u = - C d_I$; the dashed line is $v = m_I u$. The drawing is schematic; the triangle and footprint are defined by (2.3) and (2.2). ],
) <fig:triangle>

Let $v_I = e + w \( c_I \)$ and take the base $B_I = pi_(v_I^perp) T_I$. The restriction of this projection to $P$ is nonsingular: its unit normal component is $\| e dot.op v_I \| \/ lr(bar.v.double v_I bar.v.double) = 1 \/ lr(bar.v.double v_I bar.v.double) > 0$. Thus $B_I$ is again a nondegenerate compact triangle. Moreover, $T_I + bb(R) v_I = B_I + bb(R) v_I$, since a point and its orthogonal projection differ by a multiple of $v_I$. The containment already proved shows that these cylinders cover $cal(S)$.

The area factor of projection from $P$ is $1 \/ lr(bar.v.double v_I bar.v.double)$. Indeed, an orthonormal basis of $P$ projects to a parallelogram whose area is the absolute scalar product of $e$ and $v_I \/ lr(bar.v.double v_I bar.v.double)$. The coordinate change $\( u \, v \) mapsto u a + v b$ has area factor $kappa$. Integrating the width of (2.3) therefore gives the exact formula

#[#set math.equation(numbering: n => "(2.4)")
 $ "area" \( B_I \) = frac(kappa d_I thin \[ R_I + \( A + C \) d_I \]^2, 2 sqrt(1 + lr(bar.v.double w \( c_I \) bar.v.double)^2)) . $ <eq:triangle-area>]

The collar changes $d_I R_I^2 \/ 2$ by $O \( d_I^2 \)$, uniformly over $I$, because $R$ is bounded. Since $sum_I d_I^2 lt.eq delta \( beta - alpha \)$, its total contribution tends to zero with the mesh. Put $g \( t \) = \( 1 + lr(bar.v.double w \( t \) bar.v.double)^2 \)^(- 1 \/ 2)$. Uniform continuity of $R$ and $g$ then gives

$ sum_I frac(kappa d_I R_I^2 g \( c_I \), 2) arrow.r kappa / 2 integral_J R \( t \)^2 g \( t \) thin d t = cal(A) . $

Thus the triangular covers have the asserted limit for arbitrary partitions and tags. No convergence rate for the entire sum is needed or asserted for an arbitrary continuous $R$.

For the actual projected bases, let $cal(S)_I$ be the compact sweep with $t in I$, and put $B_I^(upright("act")) = pi_(v_I^perp) cal(S)_I$. Moving parallel to $v_I$ does not change this projection, so the intercept containment already proved gives $B_I^(upright("act")) subset.eq B_I$. The set $B_I^(upright("act"))$ is compact and its cylinder contains $cal(S)_I$.

A matching lower bound comes from the sector at $s = 0$:

$ E_I = { p_0 + rho \( a + t b \) : t in I \, med 0 lt.eq rho lt.eq R \( t \) } subset.eq cal(S)_I . $

In the $\( a \, b \)$ coordinates this map is $\( rho \, t \) mapsto \( rho \, rho t \)$, which is one-to-one for $rho > 0$ and has absolute Jacobian $rho$. The edge $rho = 0$ maps to a single point. Consequently $"area" \( E_I \) = kappa / 2 integral_I R \( t \)^2 thin d t$, and projection from $P$ scales this area by $g \( c_I \)$. We obtain the two-sided estimate

#[#set math.equation(numbering: n => "(2.5)")
 $ frac(kappa g \( c_I \), 2) integral_I R \( t \)^2 thin d t lt.eq "area" \( B_I^(upright("act")) \) lt.eq "area" \( B_I \) . $ <eq:actual-sweep-squeeze>]

The sum of the lower bounds tends to $cal(A)$: its difference from the integral is at most

$ kappa / 2 sup_(r \, t in J\
\| r - t \| lt.eq delta) \| g \( r \) - g \( t \) \| integral_J R \( t \)^2 thin d t \, $

which tends to zero by uniform continuity. The upper sums have the same limit, proving the actual-base assertion, including when $R$ vanishes. This shared limit does not identify the individual actual bases with their containing triangles or make their finite areas equal. The proof of Theorem 1 is complete.

== 3 Two overlapping sweeps in a tetrahedron <sec:tetrahedron>

We now choose two sweeps for which the weighted cost is strictly smaller than the half-area bound. Write physical points as $\( x \, y \, h t \)$, where $h = sqrt(2)$, and let

#[#set math.equation(numbering: n => "(3.1)")
 $ K = { \( x \, y \, h t \) : \| x \| lt.eq 1 + t \, med \| y \| lt.eq 1 - t } . $ <eq:tetrahedron>]

The inequalities imply $- 1 lt.eq t lt.eq 1$. The four vertices are $\( plus.minus 2 \, 0 \, h \)$ and $\( 0 \, plus.minus 2 \, - h \)$, and their pairwise distances are four. This is a regular tetrahedron.

=== 3.1 The reference area <the-reference-area>

For a polytope with face areas $S_j$, outward unit normals $n_j$, and a unit vector $u$, Cauchy’s projection formula takes the form

#[#set math.equation(numbering: n => "(3.2)")
 $ "area" \( pi_(u^perp) K \) = 1 / 2 sum_j S_j \| n_j dot.op u \| . $ <eq:cauchy>]

See Martini #cite(label("Martini1991")) p. 83, equation (1) for the projection-body formulation. The elementary polytope proof is to count the two endpoints of almost every line parallel to $u$: projecting all faces counts its shadow twice, whereas edges and faces parallel to $u$ contribute zero area.

Each face of (3.1) has area $4 sqrt(3)$, and its normal is one of the normalizations of $\( plus.minus 1 \, 0 \, - 1 \/ h \)$ and $\( 0 \, plus.minus 1 \, 1 \/ h \)$. For a unit vector $u = \( u_1 \, u_2 \, u_3 \)$, formula (3.2) and $\| a + b \| + \| a - b \| = 2 max \( \| a \| \, \| b \| \)$ give

$ "area" \( pi_(u^perp) K \) = 4 h (max { \| u_1 \| \, \| u_3 \| \/ h } + max { \| u_2 \| \, \| u_3 \| \/ h }) . $

If the two maxima are $X \, Y$, then $X^2 + Y^2 gt.eq u_1^2 + u_2^2$ and $X Y gt.eq u_3^2 \/ h^2$. Since $h^2 = 2$, it follows that $\( X + Y \)^2 gt.eq 1$. Equality is attained at $u = \( 1 \, 0 \, 0 \)$, so

#[#set math.equation(numbering: n => "(3.3)")
 $ A_min \( K \) = 4 h . $ <eq:min-area>]

The upper half of $K$ is covered by an $x$-parallel cylinder of base area $h$, and the lower half by a $y$-parallel cylinder of the same area. Their total cost is $2 h = A_min \( K \) \/ 2$.

=== 3.2 The perturbed segments cover the whole tetrahedron <the-perturbed-segments-cover-the-whole-tetrahedron>

For $q in \[ - 1 \, 1 \]$, define

$ G \( q \) = frac(1 + q^2, 2) \, #h(2em) H \( q \) = frac(q^2 + q^4, 2) \, #h(2em) R_epsilon \( q \) = 1 + epsilon^2 #scale(x: 120%, y: 120%)[\(] H \( q \) + 5 epsilon #scale(x: 120%, y: 120%)[\)] \, quad epsilon > 0 . $

The upper sweep is

#[#set math.equation(numbering: n => "(3.4)")
 $ U_epsilon = { \( x \, rho q - epsilon x G \( q \) \, h \( 1 - rho + epsilon x q \) \) : \| x \| lt.eq 2 \, med \| q \| lt.eq 1 \, med 0 lt.eq rho lt.eq R_epsilon \( q \) } . $ <eq:upper-sweep>]

Its intercept ray starts at $\( 0 \, 0 \, h \)$ in direction $\( 0 \, q \, - h \)$. The identity $G' \( q \) = q$ makes the derivative of its segment direction $\( 1 \, - epsilon G \( q \) \, h epsilon q \)$ equal to $- epsilon \( 0 \, q \, - h \)$, exactly the radial alignment required by Theorem 1. The constant term in $G$ gives $G \( q \) - q^2 = \( 1 - q^2 \) \/ 2$, which vanishes at both angular endpoints. This will keep the endpoint levels unchanged when we select a line through a point of $K$.

The sweep is compact. Let $cal(R) \( x \, y \, z \) = \( y \, - x \, - z \)$, an orthogonal map preserving $K$. Its image $cal(R) U_epsilon$ is the lower sweep, which can equivalently be written as

#[#set math.equation(numbering: n => "(3.5)")
 $ { \( sigma p + epsilon y G \( p \) \, y \, h \( - 1 + sigma + epsilon y p \) \) : \| y \| lt.eq 2 \, med \| p \| lt.eq 1 \, med 0 lt.eq sigma lt.eq R_epsilon \( p \) } . $ <eq:lower-sweep>]

Indeed, apply $cal(R)$ in (3.4) and replace its free coordinate $x$ by $- y$. We will show that the two sweeps overlap enough to cover $K$.

#thm([Lemma 3.1.])[
  #emph[If $F in C^1 \( \[ a \, b \] \)$, $a < b$, and $F \( a \) lt.eq z lt.eq F \( b \)$, there is $r in \[ a \, b \]$ with $F \( r \) = z$ and $F' \( r \) gt.eq 0$, using one-sided derivatives at the endpoints.]
] <lem:crossing>

#proof[
  If $F \( a \) = z$ and $F' \( a \) gt.eq 0$, use $r = a$. Otherwise $F$ is below $z$ either at $a$ or immediately to its right. Starting at such a point, take the first subsequent point where $F = z$; it exists because $F \( b \) gt.eq z$. Its left difference quotients are nonnegative, so its derivative is nonnegative. ◻
]

#thm([Proposition 3.2.])[
  #emph[For every $epsilon > 0$, the compact sets $U_epsilon$ and $cal(R) U_epsilon$ cover $K$.]
] <prop:coverage>

#proof[
  Fix $\( x \, y \, h t \) in K$. Applying Lemma 3 twice gives $q \, p in \[ - 1 \, 1 \]$ satisfying
  #[#set math.equation(numbering: n => "(3.6)")
   $ y & = \( 1 - t \) q - epsilon x \( 1 - q^2 \) \/ 2 \, & rho & = 1 - t + epsilon x q gt.eq 0 \,\
x & = \( 1 + t \) p + epsilon y \( 1 - p^2 \) \/ 2 \, & sigma & = 1 + t - epsilon y p gt.eq 0 . $ <eq:root-one>]
  In each equation the endpoint values bracket the coordinate on the left, and the derivative is precisely the indicated radial parameter. This includes zero-height slices and boundary points. Rearranging gives the segment representations (3.4) and (3.5); only their upper radial bounds remain to be checked.
  If both bounds failed, then
  #[#set math.equation(numbering: n => "(3.7)")
   $ epsilon y p + epsilon^2 \( H \( p \) + 5 epsilon \) < t < epsilon x q - epsilon^2 \( H \( q \) + 5 epsilon \) . $ <eq:joint-failure>]
  As $\| x \| \, \| y \| lt.eq 2$ and both cap corrections are nonnegative, $\| t \| lt.eq 2 epsilon$. Equations (3.6)–(3.6) then imply
  $ \| x - p \| lt.eq 3 epsilon \, #h(2em) \| y - q \| lt.eq 3 epsilon . $
  Moreover, (3.7) puts $t \/ epsilon$ between $y p$ and $x q$. Both differ from $p q$ by at most $3 epsilon$, so
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| t \/ epsilon - p q \| lt.eq 3 epsilon . $ <eq:interface-error>]
  Put $D \( r \) = \( 1 - r^2 \) \/ 2$, so $0 lt.eq D \( r \) lt.eq 1 \/ 2$ on $\[ - 1 \, 1 \]$. The root equations give the exact identity
  $ frac(x q - y p, epsilon) = 2 p q t / epsilon + y q D \( p \) + x p D \( q \) . $
  Replacing $t \/ epsilon$ by $p q$ costs at most $6 epsilon$, by (3.8). Replacing $y$ by $q$ and $x$ by $p$ costs at most $3 epsilon$ in total. Hence
  $ frac(x q - y p, epsilon) & lt.eq 2 p^2 q^2 + q^2 D \( p \) + p^2 D \( q \) + 9 epsilon\
 & = frac(p^2 + q^2, 2) + p^2 q^2 + 9 epsilon . $
  This is why the cap contains $H \( q \) = q^2 G \( q \)$: the inequality $2 p^2 q^2 lt.eq p^4 + q^4$ gives
  $ frac(p^2 + q^2, 2) + p^2 q^2 lt.eq H \( p \) + H \( q \) . $
  The two cubic cap corrections contribute $10 epsilon$ after division by $epsilon^2$, exceeding the error $9 epsilon$. Indeed, (3.7) requires $\( x q - y p \) \/ epsilon$ to be strictly greater than $H \( p \) + H \( q \) + 10 epsilon$. This contradiction proves the proposition. All estimates were uniform over the closed tetrahedron. ◻
]

=== 3.3 Finite bases and the weighted cost <finite-bases-and-the-weighted-cost>

We now hold $epsilon$ fixed. In the intercept plane $P = { x = 0 }$, the upper sweep has the data

$ p_0 = \( 0 \, 0 \, h \) \, quad e = \( 1 \, 0 \, 0 \) \, quad a = \( 0 \, 0 \, - h \) \, quad b = \( 0 \, 1 \, 0 \) \, quad L = 2 \, $

and

$ w \( q \) = \( 0 \, - epsilon G \( q \) \, h epsilon q \) \, #h(2em) w' \( q \) = - epsilon \( a + q b \) . $

Thus the hypothesis of Theorem 1 holds with $lambda = - epsilon$, $kappa = h$, and radial cap $R_epsilon$. Also

$ lr(bar.v.double e + w \( q \) bar.v.double)^2 = 1 + epsilon^2 D_0 \( q \) \, #h(2em) D_0 \( q \) = G \( q \)^2 + 2 q^2 . $

For every partition into $N$ intervals, the theorem and the orthogonal map $cal(R)$ cover $K$ by $2 N$ cylinders with nondegenerate compact triangular bases. As the mesh tends to zero, their total areas converge to

#[#set math.equation(numbering: n => "(3.9)")
 $ 2 h I \( epsilon \) \, #h(2em) I \( epsilon \) = integral_(- 1)^1 frac(R_epsilon \( q \)^2, 2 sqrt(1 + epsilon^2 D_0 \( q \))) thin d q . $ <eq:cost-integral>]

Taking actual swept projections instead gives compact bases with the same limiting total area, for any choice of freezing tags. Their finite areas may differ from those of the triangles.

=== 3.4 The saving and the final finite choice <the-saving-and-the-final-finite-choice>

It remains to put the limiting cost strictly below $2 h$. The expansion is uniform for $q in \[ - 1 \, 1 \]$:

$ frac(R_epsilon \( q \)^2, 2 sqrt(1 + epsilon^2 D_0 \( q \))) = 1 / 2 + epsilon^2 (H \( q \) - frac(D_0 \( q \), 4)) + 5 epsilon^3 + O \( epsilon^4 \) . $

Direct integration gives

$ integral_(- 1)^1 H \( q \) thin d q = 8 / 15 \, #h(2em) integral_(- 1)^1 frac(D_0 \( q \), 4) thin d q = 17 / 30 . $

Therefore

#[#set math.equation(numbering: n => "(3.10)")
 $ I \( epsilon \) = 1 - epsilon^2 / 30 + 10 epsilon^3 + O \( epsilon^4 \) < 1 $ <eq:strict-expansion>]

for all sufficiently small positive $epsilon$. The cubic cap padding that guaranteed overlap is smaller than the quadratic projection saving.

Choose one such $epsilon$ and put $Delta = 2 h \( 1 - I \( epsilon \) \) > 0$. For the triangular covers, the limit (3.9) gives a sufficiently fine finite partition, with $N$ intervals, whose cost is less than $2 h I \( epsilon \) + Delta \/ 2 < 2 h$. Proposition 4 and Theorem 1 give coverage of every point of $K$ for this same $N$. The actual swept projections also give finite covers within this gap by their convergence to the same limit.

By (3.3), the triangular cover has cost strictly below $A_min \( K \) \/ 2$. A Euclidean similarity transports it to every regular tetrahedron of positive edge length, preserving triangularity and multiplying both areas by the same factor. Finally each individual projection area is at least $A_min \( K \)$. For the axes and bases of any one of these finite covers,

$ sum_i frac("area" \( B_i \), "area" \( pi_(u_i^perp) K \)) lt.eq frac(sum_i "area" \( B_i \), A_min \( K \)) < 1 / 2 . $

This proves the two negative resolutions stated in the introduction.

Explicit polygonal alternatives with the same limiting cost are given in Appendix 7.

== 4 Shorter beams and the strip between them <beam:section>

The radial approximation theorem also permits a different coverage strategy. Instead of enlarging two sweeps until they overlap, we shorten them and cover their complement by horizontal cylinders. The shortening saves area to first order, but the strip costs exactly that first-order amount. A negative second-order term will make the total cost smaller. We first realize the beams by the triangular construction of Theorem 1, then locate the complement and compute its cost.

=== 4.1 Euclidean coordinates and the cost normalization <beam:geometry>

All notation in this section is local. We construct the cover for a regular tetrahedron of edge length $2 sqrt(2)$; similarity then gives the cover at every positive edge length, since both the covering cost and $A_min$ scale by the square of the similarity ratio. Put $beta = 1 \/ sqrt(2)$ and write

$ P \( x \, y \, t \) = \( beta x \, beta y \, t \) \, #h(2em) K = { P \( x \, y \, t \) : - 1 lt.eq t lt.eq 1 \, med \| x \| lt.eq 1 - t \, med \| y \| lt.eq 1 + t } . $

The map $P$ specifies physical Euclidean coordinates; $\( x \, y \, t \)$ are parameters, so Euclidean lengths and areas must be computed after applying $P$. The four vertices are $P \( plus.minus 2 \, 0 \, - 1 \)$ and $P \( 0 \, plus.minus 2 \, 1 \)$. This is the image of the edge-four tetrahedron in Section 3 under the Euclidean similarity $\( X \, Y \, Z \) mapsto \( beta X \, beta Y \, - beta Z \)$. Thus all six edges have length $2 sqrt(2)$, and (3.3) gives $A_min \( K \) = beta^2 \( 4 sqrt(2) \) = 2 sqrt(2)$. In the computations below we measure areas in units of $beta^2 \/ sqrt(2)$; this is a fixed cost normalization, distinct from dividing each cylinder area by the projection in its own direction:

#[#set math.equation(numbering: n => "(4.1)")
 $ A_min \( K \) = 2 sqrt(2) \, #h(2em) upright("normalized cost") = frac(upright("perpendicular base area"), beta^2 \/ sqrt(2)) . $ <beam:normalization>]

The desired threshold in normalized cost is $4$.

We will repeatedly use the following exact conversion. For a compact planar set $S subset bb(R)^2$ and $v in bb(R)^2$, the cylinder through $P \( S \, 0 \)$ in direction $\( beta v \, 1 \)$ has perpendicular base $pi_(\( beta v \, 1 \)^perp) P \( S \, 0 \)$. Its normalized cost is

#[#set math.equation(numbering: n => "(4.2)")
 $ \| S \| thin g \( v \) \, #h(2em) g \( v \) = sqrt(2) / sqrt(1 + beta^2 \| v \|^2) . $ <beam:projection-factor>]

Indeed, the horizontal area is $beta^2 \| S \|$, and orthogonal projection multiplies it by the absolute inner product of the two unit plane normals, namely $\( 1 + beta^2 \| v \|^2 \)^(- 1 \/ 2)$. Projection changes neither the cylinder nor its direction. Normalizing that direction gives a unit axis as required.

=== 4.2 Compact beams and their finite coverings <compact-beams-and-their-finite-coverings>

For $0 < a < 1 \/ 2$, define

$ R_a = 2 - a \, #h(2em) r \( p \) = \( p \, 1 - p \) \, #h(2em) v \( p \) = \( 1 \, - 1 \) + a R_a \( - p^2 \, \( 1 - p \)^2 \) \, quad 0 lt.eq p lt.eq 1 . $

With $c = \( - 1 \, - 1 \)$, set

$ H^(-) & = { P \( c + h r \( p \) + t v \( p \) \, t \) : 0 lt.eq p lt.eq 1 \, med 0 lt.eq h lt.eq R_a \, med \| t \| lt.eq 1 } \,\
H^(+) & = { P \( - x \, - y \, t \) : P \( x \, y \, t \) in H^(-) } . $

The radial length $R_a = 2 - a$ shortens each central triangle by $a$. Both beam regions are compact images of compact parameter sets. At $t = 0$ they are triangles on opposite corners of the square section $\[ - 1 \, 1 \]^2$; Figure 2 displays their central gap. The regions $H^(-)$ and $H^(+)$ are the sets to be covered, whereas each approximating cylinder will have one fixed direction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.65, -1.65), (1.073, -1.65), (-1.65, 1.073), close: true, fill: rgb("#d6d6ff"), stroke: none)
  line((1.65, 1.65), (-1.073, 1.65), (1.65, -1.073), close: true, fill: rgb("#d6d6ff"), stroke: none)
  line((-1.65, 1.073), (1.073, -1.65), (1.65, -1.65), (1.65, -1.073), (-1.073, 1.65), (-1.65, 1.65), close: true, fill: rgb("#ffe3c7"), stroke: none)
  rect((-1.65, -1.65), (1.65, 1.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.65, 1.073), (1.073, -1.65), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  line((-1.073, 1.65), (1.65, -1.073), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  content((-0.9405, -0.9405), [$H^-$])
  content((0.9405, 0.9405), [$H^+$])
  content((0, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffe3c7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$|x+y| lt.eq a$]])], angle: -45deg)
  content((0, -1.782), [$-1 lt.eq x lt.eq 1$], anchor: "north", padding: 0.1176cm)
  content((-1.93, 0), [$-1 lt.eq y lt.eq 1$], anchor: "east", angle: 90deg, padding: 0.1176cm)
  content((1.864, 1.353), [$t=0$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The beam sections at height zero, in parameter coordinates $\( x \, y \)$, drawn with $a = 0.35$. Their sloping sides satisfy $x + y = - a$ and $x + y = a$. The shaded closed band contains all points outside these two triangles. This value of $a$ illustrates the geometry only; the strict cost comparison will require smaller $a$. ],
) <beam:midsection>

#thm([Lemma 4.1.])[
  #emph[For fixed $a in \( 0 \, 1 \/ 2 \)$, partition $\[ 0 \, 1 \]$ into $k$ equal closed intervals and choose a tag $p_I$ in each interval. The two beams admit a covering by $2 k$ cylinders with nondegenerate compact triangular perpendicular bases, with axes parallel to $\( beta v \( p_I \) \, 1 \)$ and $\( - beta v \( p_I \) \, 1 \)$, respectively. Their total normalized cost converges, as $k arrow.r oo$, to 
#[#set math.equation(numbering: n => "(4.3)")
 $ C_1 = R_a^2 integral_0^1 g \( v \( p \) \) thin d p . $ <beam:C1>]

 In particular, for every $eta > 0$ a finite covering has cost at most $C_1 + eta$.]
] <beam:finite-beams>

#proof[
  We check the radial theorem in the physical horizontal plane, so its area factor includes the scaling of both horizontal coordinates. Take $e = \( 0 \, 0 \, 1 \)$, $p_0 = \( - beta \, - beta \, 0 \)$ and
  $ upright(bold(a)) = \( 0 \, beta \, 0 \) \, #h(2em) upright(bold(b)) = \( beta \, - beta \, 0 \) \, #h(2em) upright(bold(w)) \( p \) = \( beta v_1 \( p \) \, beta v_2 \( p \) \, 0 \) . $
  Then $upright(bold(a)) + p upright(bold(b)) = beta \( p \, 1 - p \, 0 \)$ and
  $ H^(-) = { p_0 + h \( upright(bold(a)) + p upright(bold(b)) \) + t \( e + upright(bold(w)) \( p \) \) : 0 lt.eq p lt.eq 1 \, med 0 lt.eq h lt.eq R_a \, med \| t \| lt.eq 1 } . $
  The hypotheses of Theorem 1 hold with constant cap $R_a$, axial bound $1$ and
  $ upright(bold(w))' \( p \) = - 2 a R_a \( upright(bold(a)) + p upright(bold(b)) \) \, #h(2em) \| det \( upright(bold(a)) \, upright(bold(b)) \) \| = beta^2 = 1 / 2 \, #h(2em) \| upright(bold(w)) \( p \) \|^2 = beta^2 \| v \( p \) \|^2 . $
  Consequently its one-beam limiting area is exactly
  #[#set math.equation(numbering: n => "(4.4)")
   $ R_a^2 / 4 integral_0^1 frac(d p, sqrt(1 + beta^2 \| v \( p \) \|^2)) . $ <beam:physical-radial-cost>]
  For completeness, the explicit triangles in that theorem have $A = 2 a R_a$, $B = a R_a$, $C = 2 \( A + B \) + 1 = 6 a R_a + 1$. If $delta = 1 \/ k$, their individual perpendicular areas are
  $ frac(delta thin \[ R_a + \( A + C \) delta \]^2, 4 sqrt(1 + beta^2 \| v \( p_I \) \|^2)) . $
  The orthogonal map $\( X \, Y \, T \) mapsto \( - X \, - Y \, T \)$ gives the $k$ cylinders for $H^(+)$ with the same areas. Adding the two costs and dividing by $beta^2 \/ sqrt(2)$ gives (4.3). ◻
]

=== 4.3 The points left between the beams <the-points-left-between-the-beams>

At $t = 0$, the missed set is the diagonal band $\| x + y \| < a$ shown in Figure 2. At other heights we enclose the missed set in a tilted band with a uniform cubic error, using the transverse coordinate $s$ and the coordinate $l$ along the diagonal:

$ s = x + y \, #h(2em) l = \( x - y \) \/ 2 \, #h(2em) f \( t \) = 2 a t - 2 a^2 t^3 . $

For a constant $M > 0$, to be chosen uniformly in the next lemma, define

#[#set math.equation(numbering: n => "(4.5)")
 $ W \( t \) & = #scale(x: 120%, y: 120%)[\(] a \( 1 - 2 t^2 \) + a^2 t^2 { 1 + \( 1 - \| t \| \)^2 + t^2 } + M a^3 #scale(x: 120%, y: 120%)[\)]_(+) \,\
G & = { P \( x \, y \, t \) in K : \| s + f \( t \) l \| lt.eq W \( t \) } \, $ <beam:width>]

where $q_(+) = max \( q \, 0 \)$.

#thm([Lemma 4.2.])[
  #emph[With $M = 25$ in (4.5), one has $K subset H^(-) union H^(+) union G$ for every $0 < a < 1 \/ 2$.]
] <beam:coverage>

#proof[
  Consider an interior point of $K$ outside both beams. Put $U = x + 1 - t > 0$ and $Y = y + 1 + t > 0$. The strictly decreasing function $U \/ p - Y \/ \( 1 - p \)$ runs from $+ oo$ to $- oo$ on $\( 0 \, 1 \)$, so there is a $p$ satisfying
  $ U / p - frac(Y, 1 - p) = - a R_a t \, #h(2em) h = U / p + a R_a t p = frac(Y, 1 - p) - a R_a t \( 1 - p \) . $
  One of these expressions makes $h > 0$ immediate, according to the sign of $t$. They give exactly $P \( x \, y \, t \) = P \( c + h r \( p \) + t v \( p \) \, t \)$. Because the point is outside $H^(-)$, necessarily $h > R_a$. Applying the same argument to $\( - x \, - y \, t \)$ gives the corresponding reflected parameters, also with radial parameter greater than $R_a$.
  For the first representation put $d = h - R_a > 0$, $q = 2 p - 1$, and $b = R_a q \/ 2$. Direct substitution gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ s & = - a - 2 a t b + d \,\
l & = t + b + d q \/ 2 - a t Q \, #h(2em) Q = R_a \/ 4 + b^2 \/ R_a . $ <beam:exact-gap>]
  The reflected representation obeys these same identities with $\( - s \, - l \)$ in place of $\( s \, l \)$. Since $\| b \| lt.eq R_a \/ 2 < 1$, the first identity and its reflected version imply $\| s \| lt.eq 3 a$, and then $0 < d lt.eq 6 a$. Moreover $\| l \| lt.eq 1$ on $K$ and $Q lt.eq R_a \/ 2 lt.eq 1$, so the second identity gives the uniform estimate
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| b - \( l - t \) \| lt.eq 4 a . $ <beam:b-error>]
  These bounds hold also for the reflected parameters. Since $R_a gt.eq 3 \/ 2$ and $\| l - t \| lt.eq 2$, they give the numerical estimate
  #[#set math.equation(numbering: n => "(4.8)")
   $ lr(|Q - frac(1 + \( l - t \)^2, 2)|) lt.eq a / 4 + frac(a b^2, 2 R_a) + frac(\| b - \( l - t \) \| thin \| b + \( l - t \) \|, 2) lt.eq (1 / 4 + 1 / 3 + 6) a < 10 a . $ <beam:uniform-constant>]
  The bound is uniform, including for points tending to the boundary.
  Combining the two equations in (4.6) leaves a favorable radial term:
  $ s + 2 a t l = - a + 2 a t^2 - 2 a^2 t^2 Q + d \( 1 + a t q \) gt.eq - a + 2 a t^2 - a^2 t^2 { 1 + \( l - t \)^2 } - 20 a^3 \, $
  since $1 + a t q > 0$. Reflection gives the complementary inequality
  $ s + 2 a t l lt.eq a - 2 a t^2 + a^2 t^2 { 1 + \( l + t \)^2 } + 20 a^3 . $
  Subtracting $2 a^2 t^3 l$ from both inequalities cancels their mixed quadratic terms, yielding
  #[#set math.equation(numbering: n => "(4.9)")
   $ \| s + f \( t \) l \| lt.eq a \( 1 - 2 t^2 \) + a^2 t^2 \( 1 + l^2 + t^2 \) + 20 a^3 . $ <beam:central-strip>]
  Finally the two coordinate bounds for $K$, applied to $x = s \/ 2 + l$ and $y = s \/ 2 - l$, give
  $ \| l \| lt.eq 1 - \| t \| + \| s \| \/ 2 lt.eq 1 - \| t \| + 3 a \/ 2 . $
  Squaring shows $l^2 lt.eq \( 1 - \| t \| \)^2 + 3 a + 9 a^2 \/ 4$. Replacing $l^2$ by $\( 1 - \| t \| \)^2$ therefore adds at most $\( 3 + 9 a \/ 4 \) a^3 < 5 a^3$. Thus $M = 25$ bounds the right side of (4.9) by the expression inside the positive part in (4.5). For such a point that expression is nonnegative, so the point lies in $G$. We have proved coverage of the interior. Both beams are compact, and $G$ is closed in the compact set $K$ because $f$ and $W$ are continuous. Their finite union is closed and hence contains the closure of the interior, namely all of $K$. ◻
]

=== 4.4 Finite horizontal cylinders for the strip <finite-horizontal-cylinders-for-the-strip>

The two beams now cover every point outside $G$. It remains to give $G$ a finite covering whose cost can be combined with the beam cost.

#thm([Lemma 4.3.])[
  #emph[Fix $M$ as in Lemma 6. For every fixed $a in \( 0 \, 1 \/ 2 \)$ and $eta > 0$, the strip $G$ has a finite covering by cylinders with compact rectangular perpendicular bases and normalized cost at most $C_2 + eta$, where 
#[#set math.equation(numbering: n => "(4.10)")
 $ C_2 = 2 sqrt(2) integral_(- 1)^1 frac(W \( t \), sqrt(1 + \( a t - a^2 t^3 \)^2)) thin d t . $ <beam:C2>]

]
] <beam:finite-strip>

#proof[
  We construct the perpendicular rectangles explicitly. Define $w \( t \) = \( 1 + f \( t \) \/ 2 \, 1 - f \( t \) \/ 2 \)$, so that $s + f \( t \) l = w \( t \) dot.op \( x \, y \)$. Partition $\[ - 1 \, 1 \]$ into finitely many closed intervals $J$, choose $t_J in J$, and put
  $ w_J = w \( t_J \) \, quad n_J = \( w_J \/ \| w_J \| \, 0 \) \, quad A_J = frac(beta, \| w_J \|) (max_(t in J) W \( t \) + 3 max_(t in J) \| w \( t \) - w_J \|) . $
  Choose a horizontal unit axis $u_J$ perpendicular to $n_J$. In its perpendicular plane take the compact rectangle
  $ B_J = { z n_J + t \( 0 \, 0 \, 1 \) : \| z \| lt.eq A_J \, med t in J } . $
  For a point of $G$ at height $t in J$, its coordinate along $n_J$ is $beta w_J dot.op \( x \, y \) \/ \| w_J \|$. Since $\| \( x \, y \) \| lt.eq 3$ on $K$, its absolute value is at most $A_J$. Thus $B_J + bb(R) u_J$ covers that point.
  The exact area of $B_J$ is $2 A_J \| J \|$. Uniform continuity of $W$ and $w$ shows, as the mesh tends to zero, that the sum of these areas tends to $integral_(- 1)^1 2 beta W \( t \) \/ \| w \( t \) \| thin d t$. Dividing by the cost unit in (4.1) and using $\| w \( t \) \| = sqrt(2) sqrt(1 + \( a t - a^2 t^3 \)^2)$ gives (4.10). The freezing error tends to zero uniformly, including at heights where $W$ vanishes. A sufficiently fine finite partition therefore proves the asserted cost bound. ◻
]

=== 4.5 The strict saving survives finite approximation <beam:cost-comparison>

#thm([Proposition 4.4.])[
  (Cost of the shortened-beam construction).  #emph[For $a in \( 0 \, 1 \/ 2 \)$, fix $M = 25$ in (4.5) and put $C \( a \) = C_1 + C_2$, with $C_1 \, C_2$ as in (4.3) and (4.10). For every $zeta > 0$, the tetrahedron $K$ has a finite cylinder cover of normalized cost at most $C \( a \) + zeta$, consisting of cylinders with nondegenerate compact triangular perpendicular bases covering $H^(-) union H^(+)$ and cylinders with horizontal axes and compact rectangular perpendicular bases covering $G$. Moreover, 
#[#set math.equation(numbering: n => "(4.11)")
 $ C \( a \) = 4 - (sqrt(2) / 2 - 19 / 30) a^2 + O \( a^3 \) #h(2em) \( a arrow.b 0 \) . $ <beam:strict-gain>]

 In particular, sufficiently small $a > 0$ permits a finite cover whose actual total base area is strictly below $A_min \( K \) \/ 2$.]
] <beam:counterexample>

#proof[
  For fixed $a$, choose the covers in Lemmas 5 and 7 with excess costs at most $zeta \/ 2$ each. Lemma 6 shows that together they cover $K$, proving the finite-cost bound. It remains to compute its limiting margin.
  We now let $a arrow.b 0$, keeping $M$ fixed. Write $S_p = p^2 + \( 1 - p \)^2$ and $T_p = p^4 + \( 1 - p \)^4$. Uniformly in $p in \[ 0 \, 1 \]$,
  $ g \( v \( p \) \) & = (1 - frac(a R_a, 2) S_p + frac(a^2 R_a^2, 4) T_p)^(- 1 \/ 2)\
 & = 1 + frac(a R_a, 4) S_p + a^2 R_a^2 (- 1 / 8 T_p + 3 / 32 S_p^2) + O \( a^3 \) . $
  The three needed integrals are $integral_0^1 S_p thin d p = 2 \/ 3$, $integral_0^1 T_p thin d p = 2 \/ 5$, and $integral_0^1 S_p^2 thin d p = 7 \/ 15$. Hence
  #[#set math.equation(numbering: n => "(4.12)")
   $ C_1 = R_a^2 + frac(a R_a^3, 6) - frac(a^2 R_a^4, 160) + O \( a^3 \) = 4 - 8 / 3 a - 11 / 10 a^2 + O \( a^3 \) . $ <beam:C1-expansion>]
  For $C_2$, its denominator is $1 + O \( a^2 \)$ and $W = O \( a \)$, so replacing the denominator by $1$ changes the result by $O \( a^3 \)$. Removing $M a^3$ inside the positive part also has that error, because the positive-part map is $1$-Lipschitz. Set $R = 1 \/ sqrt(2)$. The leading expression $a \( 1 - 2 t^2 \)$ is positive exactly on $\( - R \, R \)$. The quadratic perturbation can change its sign only where $\| 1 - 2 t^2 \| = O \( a \)$, a set of length $O \( a \)$ around the two simple zeros. On that set the integrand is $O \( a^2 \)$. It follows that
  #[#set math.equation(numbering: n => "(4.13)")
   $ C_2 & = 4 sqrt(2) integral_0^R [a \( 1 - 2 t^2 \) + a^2 t^2 { 1 + \( 1 - t \)^2 + t^2 }] d t + O \( a^3 \)\
 & = 8 / 3 a + (26 / 15 - sqrt(2) / 2) a^2 + O \( a^3 \) . $ <beam:C2-expansion>]
  Combining (4.12) and (4.13) proves (4.11). The linear terms cancel, and the quadratic coefficient is negative because $361 \/ 900 < 1 \/ 2$. Hence $C \( a \) < 4$ for all sufficiently small positive $a$.
  To obtain a strict finite cover, first fix one such $a in \( 0 \, 1 \/ 2 \)$ and set $Delta = 4 - C_1 - C_2 > 0$. Next choose the triangular beam covering of Lemma 5 and the rectangular strip covering, with excess costs each less than $Delta \/ 3$. Together they cover $K$, use unit axis directions and compact measurable perpendicular bases, and have normalized cost less than $4$. By (4.1), their actual total base area is less than $4 beta^2 \/ sqrt(2) = sqrt(2) = A_min \( K \) \/ 2$. The parameter order is thus to fix $M = 25$, then a sufficiently small positive $a$, and finally the two finite partitions. The finite errors use only a portion of the strict saving. The similarity described at the start of the section transports this triangle-and-rectangle cover to every regular tetrahedron of positive edge length. ◻
]

== 5 Projection areas and longest chords of simplices <sec:projections>

The main constructions use the direct projection calculation in Section 3. This appendix gives a more general normalization and two alternative geometric explanations of the regular tetrahedron’s minimum shadow. They also fix the Euclidean metric for the coordinate changes in Appendix 8.

The simplex chord–projection identity below is attributed to Martini and Weissbach #cite(label("MartiniWeissbach1992")) by Heinrich, who states the exact constant #cite(label("Heinrich2014")) p. 8268. Martini characterizes simplices among convex polytopes in dimension at least three by the independence of the chord–projection product from direction #cite(label("Martini1991")) Theorem 2(C). We compute the constant directly.

#thm([Proposition 5.1.])[
  (Simplex chord–projection identity).  #emph[Let $S subset bb(R)^d$, $d gt.eq 2$, be a full-dimensional simplex, and let $u in bb(R)^d$ be a unit vector. Write $V$ for its $d$-dimensional volume, $A \( u \)$ for the $\( d - 1 \)$-dimensional volume of its orthogonal projection onto $u^perp$, and $L \( u \)$ for the greatest length of a chord of $S$ parallel to $u$. Then 
$ A \( u \) L \( u \) = d V \, #h(2em) min_(lr(bar.v.double u bar.v.double) = 1) A \( u \) = frac(d V, "diam" S) . $

]
] <prop:simplex>

#proof[
  Let $lambda_0 \, dots.h \, lambda_d$ be the affine barycentric coordinates of $S$, and put $b_i = partial_u lambda_i$. They satisfy $sum_i b_i = 0$ and are not all zero, because the barycentric coordinate map is injective. Hence
  $ c = sum_i max \( 0 \, - b_i \) = sum_i max \( 0 \, b_i \) > 0 . $
  For $s gt.eq 0$, both $x$ and $x + s u$ belong to $S$ exactly when
  $ lambda_i \( x \) gt.eq s max \( 0 \, - b_i \) quad \( 0 lt.eq i lt.eq d \) \, #h(2em) sum_i lambda_i \( x \) = 1 . $
  For $0 lt.eq s < 1 \/ c$, this intersection is a translate of $\( 1 - s c \) S$; at $s = 1 \/ c$ it is one point, and above that value it is empty. In particular, $L \( u \) = 1 \/ c$.
  A fiber of $S$ parallel to $u$ contains two points separated by $s u$ if and only if its length is at least $s$. Thus, for $0 < s < L \( u \)$, the projection of $S ∩ \( S - s u \)$ is the superlevel set of the fiber length at $s$, and its $\( d - 1 \)$-volume is $A \( u \) \( 1 - s \/ L \( u \) \)^(d - 1)$. Integrating the fiber lengths gives
  $ V = A \( u \) integral_0^(L \( u \)) \( 1 - s \/ L \( u \) \)^(d - 1) thin d s = frac(A \( u \) L \( u \), d) . $
  This is the layer-cake formula, obtained directly by integrating $ell = integral_0^oo upright(bold(1))_({ s < ell }) thin d s$ on each fiber. Finally, the largest chord length over all directions is the diameter: every chord joins two points of $S$, and a pair of points realizing the diameter is itself a chord. Taking the minimum of $d V \/ L \( u \)$ proves the second formula. ◻
]

There is a short alternative proof of the same constant using the faces through which the fibers enter. If the facet opposite vertex $i$ has $\( d - 1 \)$-volume $S_i$ and altitude $h_i$, then $V = S_i h_i \/ d$ and $lr(bar.v.double nabla lambda_i bar.v.double) = 1 \/ h_i = S_i \/ \( d V \)$. The facets with $b_i > 0$ are the entering facets for direction $u$. Their projections partition the shadow apart from a null set, and facet $i$ contributes

$ S_i b_i / lr(bar.v.double nabla lambda_i bar.v.double) = d V b_i . $

Consequently $A \( u \) = d V sum_(b_i > 0) b_i = d V c = d V \/ L \( u \)$. This proof also includes directions parallel to a facet, whose contribution is zero.

For any simplex, the distance between two convex combinations of its vertices is at most the largest distance between two vertices. Hence the diameter of a regular tetrahedron is its edge length. For edge length $ell > 0$, the volume is $ell^3 \/ \( 6 sqrt(2) \)$ and the diameter is $ell$. Therefore

#[#set math.equation(numbering: n => "(5.1)")
 $ A_min = frac(ell^2, 2 sqrt(2)) \, #h(2em) A_min / 2 = frac(ell^2, 4 sqrt(2)) . $ <eq:regular-normalization>]

For example, the volume follows by taking a face of area $sqrt(3) ell^2 \/ 4$ and altitude $sqrt(2 \/ 3) ell$. A similarity of ratio $r > 0$ multiplies every perpendicular base area and $A_min$ by $r^2$, while preserving all cylinder counts and both normalized covering costs.

=== 5.1 A different reason that an edge direction minimizes the shadow <a-different-reason-that-an-edge-direction-minimizes-the-shadow>

The chord identity is not needed to locate the minimum for a regular tetrahedron. There is an independent argument based on the piecewise linear expression in Cauchy’s face formula (3.2). Indeed, some minimizing direction for any tetrahedron is parallel to an edge; for a regular tetrahedron all edge directions give the same area. To see this directly, argue as follows. The continuous positive projection-area function $A$ attains its minimum on the unit sphere. Suppose that a minimizing $u$ is perpendicular to at most one facet normal. Choose a unit $v perp u$, also perpendicular to that normal if it exists. For sufficiently small $theta > 0$, all nonzero signs in the face formula stay unchanged at

$ u_plus.minus = \( cos theta \) u plus.minus \( sin theta \) v \, $

and a zero scalar product remains zero. Consequently

$ A \( u_(+) \) + A \( u_(-) \) = 2 cos theta thin A \( u \) < 2 A \( u \) \, $

contradicting minimality. Equivalently, along this great-circle arc the area is a fixed linear form and satisfies $A'' = - A < 0$, so it cannot have a local minimum. A minimizing direction is therefore perpendicular to at least two facet normals and hence parallel to the common edge. For a regular tetrahedron, isometries permute the edges. In the edge-$2$ model

$ { \( x \, y \, sqrt(2) t \) : 0 lt.eq t lt.eq 1 \, med \| x \| lt.eq t \, med \| y \| lt.eq 1 - t } \, $

projection in the $x$-direction has area $sqrt(2) integral_0^1 2 \( 1 - t \) thin d t = sqrt(2)$. Scaling gives $ell^2 \/ \( 2 sqrt(2) \)$ for every edge direction.

===== 5.1.1 The regular normal frame. <the-regular-normal-frame.>

A further algebraic check, useful in barycentric coordinates, comes from the regular tetrahedron’s normal frame. If its outward unit normals are $n_1 \, dots.h \, n_4$, then

$ sum_i n_i = 0 \, #h(2em) sum_i n_i n_i^(sans(T)) = 4 / 3 I . $

These identities follow, for example, from the four vectors $\( 1 \, 1 \, 1 \) \, \( 1 \, - 1 \, - 1 \) \, \( - 1 \, 1 \, - 1 \) \, \( - 1 \, - 1 \, 1 \)$ after normalization. For a unit direction $u$, set $s_i = n_i dot.op u$ and let $P$ be the sum of their positive values. The negative values have absolute sum $P$, so

$ 4 / 3 = sum_i s_i^2 lt.eq 2 P^2 . $

Since a facet has area $sqrt(3) ell^2 \/ 4$, the positive-face form of Cauchy’s formula gives $A \( u \) = \( sqrt(3) ell^2 \/ 4 \) P gt.eq ell^2 \/ \( 2 sqrt(2) \)$. In the barycentric realization ${ \( a \, b \, c \, d \) in \[ 0 \, oo \)^4 : a + b + c + d = 1 }$, the Euclidean metric is the one induced from $bb(R)^4$, the edge length is $sqrt(2)$, and the same calculation reads $A \( u \) = 1 / 2 sum_i \| u_i \| gt.eq 1 \/ sqrt(2)$ for unit sum-zero vectors $u$. These equivalent frame calculations fix the metric explicitly when we change coordinates below.

== 6 Radial caps and their overlap margins <sec:cap-choices>

The overlapping construction in Section 3 used a cubic addition to a quadratic radial cap. This appendix describes other caps that preserve coverage and strict saving. A common criterion proves all of them first. The subsequent identities give alternative proofs and coordinate forms, useful when a cap is specified by its square or by a fractional power of the tilt.

Keep the tetrahedron (3.1), the functions $G \, H \, D_0$, and the upper and lower parametrizations (3.4) and (3.5). In this appendix replace their common cap by a continuous nonnegative function $R_epsilon$ on $\[ - 1 \, 1 \]$. Write

#[#set math.equation(numbering: n => "(6.1)")
 $ Q_R \( epsilon \) = integral_(- 1)^1 frac(R_epsilon \( r \)^2, 2 sqrt(1 + epsilon^2 D_0 \( r \))) thin d r . $ <eq:general-cap-cost>]

Whenever the two sweeps cover $K$, Theorem 1 gives $2 N$ triangular-base cylinders, for each $N gt.eq 1$, whose total areas converge to $2 h Q_R \( epsilon \)$ as the mesh tends to zero. The actual swept projections have the same limiting total area by Theorem 1, although their finite areas can differ from the triangular areas. The tilt is held fixed throughout the refinement.

=== 6.1 A common criterion and the exact cost <a-common-criterion-and-the-exact-cost>

#thm([Proposition 6.1.])[
  (Four radial cap choices).  #emph[For the tetrahedron and paired sweeps just described, each of the following caps gives coverage for every sufficiently small $epsilon > 0$: 
#[#set math.equation(numbering: n => "(L)")
 $ R_epsilon \( r \) & = 1 + epsilon^2 \( H \( r \) + beta \) \, &  & beta > 0 \,\
R_epsilon \( r \) & = 1 + epsilon^2 H \( r \) + c epsilon^3 \, &  & c gt.eq 9 \/ 2 \,\
R_epsilon \( r \) & = 1 + epsilon^2 H \( r \) + c epsilon^(5 \/ 2) \, &  & c > 0 \,\
R_epsilon \( r \) & = sqrt(1 + 2 epsilon^2 \( H \( r \) + beta \)) \, &  & beta > 0 . $]

 For (C), coverage in fact holds for every $epsilon > 0$. Their normalized costs have the respective expansions 
#[#set math.equation(numbering: n => "(6.2)")
 $ Q_R \( epsilon \) & = 1 + \( 2 beta - 1 \/ 30 \) epsilon^2 + O \( epsilon^4 \) \, &  & upright("(L), (S)") \,\
Q_R \( epsilon \) & = 1 - epsilon^2 \/ 30 + 2 c epsilon^3 + O \( epsilon^4 \) \, &  & upright("(C)") \,\
Q_R \( epsilon \) & = 1 - epsilon^2 \/ 30 + 2 c epsilon^(5 \/ 2) + O \( epsilon^4 \) \, &  & upright("(F)") . $ <eq:fixed-cap-cost>]

 Thus (L) and (S) give strict saving when $0 < beta < 1 \/ 60$; (C) and (F) give strict saving for every stated fixed $c$. In each case one first fixes a tilt giving coverage and strict saving, and then chooses a finite sufficiently fine partition.]
] <prop:cap-choices>

#proof[
  The root selection in Proposition 4 is independent of the cap. Suppose first that $R_epsilon \( r \) = 1 + epsilon^2 \( H \( r \) + b_epsilon \( r \) \)$, where $b_epsilon gt.eq 0$. If both caps fail, the estimates through (3.8) and the ensuing exact identity apply without change: only nonnegativity of the cap correction was used there. They give
  #[#set math.equation(numbering: n => "(6.3)")
   $ frac(x q - y p, epsilon) lt.eq H \( p \) + H \( q \) + 9 epsilon . $ <eq:cap-failure-bound>]
  The failed caps require the left side to exceed $H \( p \) + H \( q \) + b_epsilon \( p \) + b_epsilon \( q \)$. Consequently
  #[#set math.equation(numbering: n => "(6.4)")
   $ b_epsilon \( p \) + b_epsilon \( q \) gt.eq 9 epsilon quad \( p \, q in \[ - 1 \, 1 \] \) $ <eq:padding-criterion>]
  is a sufficient coverage condition. Taking $b_epsilon = beta$, $c epsilon$, or $c sqrt(epsilon)$ proves (L), (C), and (F), with the stated ranges. The strict inequality furnished by failure permits equality in (6.4).
  For (S), put $A = H + beta$. Rationalizing the square root gives the exact expression
  $ R_epsilon = 1 + epsilon^2 (A - frac(2 epsilon^2 A^2, \( sqrt(1 + 2 epsilon^2 A) + 1 \)^2)) . $
  Since $A$ is bounded and $beta > 0$, its effective padding is at least $beta \/ 2$ for all sufficiently small $epsilon$. Condition (6.4) again applies. In particular the square-root cap has not been replaced by its Taylor polynomial.
  The cost calculation is uniform in $r$. For (L) and (S), respectively,
  $ R_epsilon^2 = 1 + 2 epsilon^2 \( H + beta \) + O \( epsilon^4 \) \, #h(2em) R_epsilon^2 = 1 + 2 epsilon^2 \( H + beta \) . $
  For (C) or (F), with $gamma = 3$ or $5 \/ 2$, $R_epsilon^2 = 1 + 2 epsilon^2 H + 2 c epsilon^gamma + O \( epsilon^4 \)$. Multiply by $\( 1 + epsilon^2 D_0 \)^(- 1 \/ 2) = 1 - epsilon^2 D_0 \/ 2 + O \( epsilon^4 \)$, divide by two, and integrate. The integrals already evaluated in Section 3 give $integral \( H - D_0 \/ 4 \) = - 1 \/ 30$. This proves all three expansions. For (L) and (S) with $0 < beta < 1 \/ 60$, and for (C) and (F) with every stated $c$, the negative quadratic term dominates the higher-order terms. Fixing such a tilt and then refining the partition gives the finite saving. ◻
]

For reference, the following rational fixed margins all give strict saving. Several appear in the explicit feet and coordinate realizations of Appendices 7–8. Their exact quadratic cost coefficients are

#[
  #set par(justify: false)
#table(
  columns: 8,
  align: (center, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$beta$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 120$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 125$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 500$
], table.cell(rowspan: 1, colspan: 1)[$4 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 100$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 200$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 250$
]),
  table.cell(rowspan: 1, colspan: 1)[$2 beta - 1 \/ 30$
], table.cell(rowspan: 1, colspan: 1)[$- 1 \/ 60$
], table.cell(rowspan: 1, colspan: 1)[$- 13 \/ 750$
], table.cell(rowspan: 1, colspan: 1)[$- 11 \/ 375$
], table.cell(rowspan: 1, colspan: 1)[$- 77 \/ 3750$
], table.cell(rowspan: 1, colspan: 1)[$- 1 \/ 75$
], table.cell(rowspan: 1, colspan: 1)[$- 7 \/ 300$
], table.cell(rowspan: 1, colspan: 1)[$- 19 \/ 750$
],
)
]

The square-root choices $beta = 1 \/ 120 \, 1 \/ 125$ have the same displayed quadratic coefficients as their linear counterparts, but their caps and finite covers are different. Cubic choices $c = 5 \, 12 \, 20 \, 64$ contribute, respectively, $10 \, 24 \, 40 \, 128$ at order $epsilon^3$. Fractional choices $c = 1 \, 4 sqrt(2) \, 8 sqrt(2)$ contribute $2 \, 8 sqrt(2) \, 16 sqrt(2)$ at order $epsilon^(5 \/ 2)$. Each constant here specifies an actual cap rather than an identification based only on a leading coefficient.

=== 6.2 Alternative identities for the overlap <alternative-identities-for-the-overlap>

The coverage and saving for all four caps have now been proved. The following arguments are alternatives to the common criterion, not additional requirements. The first uses the monotonicity of $G$ in the squared angular variable; the second keeps positive weights on the radial parameters; the third avoids expanding a square-root cap.

===== 6.2.1 Fixed margins and monotone polynomials. <fixed-margins-and-monotone-polynomials.>

For the roots in (3.6)–(3.6), the segment equations are

$ y = rho q - epsilon x G \( q \) \, #h(2em) x = sigma p + epsilon y G \( p \) \, #h(2em) rho + sigma = 2 + epsilon \( x q - y p \) . $

Under joint cap failure for (L), $rho \, sigma > 1$. Put $E = rho + sigma - 2$. Since $\| rho - sigma \| lt.eq E$, substitution gives

$ E = epsilon \( sigma - rho \) p q + epsilon^2 { y q G \( p \) + x p G \( q \) } . $

All variables except the radial parameters are bounded independently of $epsilon$. Absorbing $epsilon E$ for $epsilon < 1 \/ 2$ shows $E = O \( epsilon^2 \)$. Thus $rho \, sigma = 1 + O \( epsilon^2 \)$ and $x = p + O \( epsilon \)$, $y = q + O \( epsilon \)$. A further substitution gives uniformly

$ E = epsilon^2 { q^2 G \( p \) + p^2 G \( q \) } + O \( epsilon^3 \) lt.eq epsilon^2 \( H \( p \) + H \( q \) \) + O \( epsilon^3 \) \, $

because $\( p^2 - q^2 \) \( G \( p \) - G \( q \) \) = \( p^2 - q^2 \)^2 \/ 2 gt.eq 0$. The failed caps instead give $E > epsilon^2 \( H \( p \) + H \( q \) + 2 beta \)$, a contradiction for small $epsilon$. Equivalently, one can argue by compactness without estimating the uniform cubic constant. If failure occurred along $epsilon arrow.b 0$, a subsequence would have $p arrow.r P$, $q arrow.r Q$, $x arrow.r P$, $y arrow.r Q$, and $t \/ epsilon arrow.r P Q$, by the same root equations and cap inequalities. The exact identity in the proof of Proposition 4 gives

$ lim frac(x q - y p, epsilon) = \( P^2 + Q^2 \) \/ 2 + P^2 Q^2 . $

The required lower limit $H \( P \) + H \( Q \) + 2 beta$ exceeds this by $\( P^2 - Q^2 \)^2 \/ 2 + 2 beta > 0$. This establishes the fixed-margin coverage directly, including all boundary points through the root lemma.

===== 6.2.2 Positive weighted sums and fractional margins. <positive-weighted-sums-and-fractional-margins.>

The preceding segment equations also give the exact identity

#[#set math.equation(numbering: n => "(6.5)")
 $ \( 1 + epsilon p q \) rho + \( 1 - epsilon p q \) sigma = 2 + epsilon^2 { q G \( p \) y + p G \( q \) x } . $ <eq:weighted-radial-identity>]

Under failure for (F), the inequalities $rho \, sigma > 1$ imply $x = p + O \( epsilon \)$ and $y = q + O \( epsilon \)$, uniformly. Thus its right side is at most $2 + epsilon^2 \( H \( p \) + H \( q \) \) + O \( epsilon^3 \)$. For $epsilon < 1$ both weights on the left are positive. Substituting the two failed caps makes that side strictly greater than

$ 2 + epsilon^2 \( H \( p \) + H \( q \) \) + 2 c epsilon^(5 \/ 2) + O \( epsilon^3 \) . $

The positive fractional term dominates the cubic error. This proves coverage by a weighted cancellation, without discarding the fractional term from the cost expansion.

There is a related complementary-coordinate identity. Put $T = t - epsilon x q = 1 - rho$ and $S = - t + epsilon y p = 1 - sigma$. Directly from the segment equations,

#[#set math.equation(numbering: n => "(6.6)")
 $ \( 1 + epsilon x q \) T & = t - epsilon x y - epsilon^2 x^2 G \( q \) \,\
\( 1 - epsilon y p \) S & = - t + epsilon x y - epsilon^2 y^2 G \( p \) . $ <eq:complementary-one>]

If both caps fail, then $T \, S < 0$. For $epsilon lt.eq 1 \/ 4$ the two coefficients are at least $1 \/ 2$. Adding the identities therefore gives

#[#set math.equation(numbering: n => "(6.7)")
 $ \| T \| \, \| S \| lt.eq 16 epsilon^2 . $ <eq:complementary-bound>]

This bounds each missed intercept, rather than only their sum. The segment equations give $\| x - p \| \, \| y - q \| lt.eq C epsilon$ for a uniform $C$. For cap (L), substituting the strict failures $T < - epsilon^2 \( H \( q \) + beta \)$ and $S < - epsilon^2 \( H \( p \) + beta \)$ into the sum then requires

$ x^2 G \( q \) + y^2 G \( p \) > H \( p \) + H \( q \) + 2 beta - O \( epsilon \) . $

The left side is at most $p^2 G \( q \) + q^2 G \( p \) + O \( epsilon \)$ and hence at most $H \( p \) + H \( q \) + O \( epsilon \)$, again a contradiction. Rescaling the axial coordinate by $t = k z$ and the tilt by $epsilon = k tau$, with $k = 1 \/ sqrt(2)$, turns (6.7) into the explicit physical-intercept estimate $\| T \/ k \| \, \| S \/ k \| lt.eq 16 k tau^2$.

===== 6.2.3 Squared radial parameters. <squared-radial-parameters.>

The same roots satisfy two further exact identities:

#[#set math.equation(numbering: n => "(6.8)")
 $ rho^2 = \( 1 - t \)^2 + 2 epsilon x y + epsilon^2 x^2 \, #h(2em) sigma^2 = \( 1 + t \)^2 - 2 epsilon x y + epsilon^2 y^2 . $ <eq:squared-radial-identities>]

For example, expand $\( 1 - t + epsilon x q \)^2$ and substitute $2 x y = 2 \( 1 - t \) x q + epsilon x^2 \( q^2 - 1 \)$ from the first root equation. For the square-root cap (S), joint failure requires

$ 2 \( t \/ epsilon \)^2 + x^2 + y^2 > 2 H \( p \) + 2 H \( q \) + 4 beta . $

Along any hypothetical sequence of failures approaching zero tilt, the root and cap inequalities give $x arrow.r P$, $y arrow.r Q$ and $t \/ epsilon arrow.r P Q$. The limiting right side exceeds the left by $\( P^2 - Q^2 \)^2 + 4 beta$, a contradiction. For (L), the square of its cap is at least $1 + 2 epsilon^2 \( H + beta \)$, so the same argument applies. This retains both the square-root construction and the square-identity proof for a polynomial cap.

===== 6.2.4 A larger cubic certificate. <a-larger-cubic-certificate.>

For the cubic choice $c = 12$, suppose both selected radial parameters exceed their caps. The root estimates in Proposition 4 give

$ 0 < rho - 1 \, sigma - 1 lt.eq rho + sigma - 2 = epsilon { \( x - p \) q - \( y - q \) p } lt.eq 6 epsilon^2 lt.eq 12 epsilon^2 . $

Their difference obeys the same bound. Multiplying (6.3) by $epsilon^2$ gives an error $9 epsilon^3$, which is bounded by the combined padding $24 epsilon^3$. Thus this choice also provides a cubic certificate with that larger constant. Its total limiting cost is $2 sqrt(2) \( 1 - epsilon^2 \/ 30 + 24 epsilon^3 + O \( epsilon^4 \) \)$.

=== 6.3 A quantitative complementary calculation at half height <a-quantitative-complementary-calculation-at-half-height>

An exact weighted calculation gives another explicit cubic certificate. Use coordinates $\( X \, Y \, Z \)$ with $\| X \| lt.eq 1 - Z$, $\| Y \| lt.eq Z$, and their physical realization $\( X \/ 2 \, Y \/ 2 \, Z \/ sqrt(2) \)$. For $r in \[ - 1 \, 1 \]$ define

$ alpha \( r \) = \( 1 + r^2 \) \/ 4 \, quad beta \( r \) = r \/ 2 \, quad F \( r \) = r^2 \( 1 + r^2 \) \/ 16 . $

The two line families are

$ Y & = u r + delta X alpha \( r \) \, & Z & = u + delta X beta \( r \) \,\
X & = v s - delta Y alpha \( s \) \, & 1 - Z & = v - delta Y beta \( s \) . $

The crossing lemma supplies $u \, v gt.eq 0$. Both families use the cap $R_delta \( r \) = 1 \/ 2 + delta^2 F \( r \) + 4 delta^3$. Their exact complementary identity is

#[#set math.equation(numbering: n => "(6.9)")
 $ \( u - 1 \/ 2 \) \( 1 - delta X r \) + \( v - 1 \/ 2 \) \( 1 + delta Y s \) = delta^2 { X^2 alpha \( r \) + Y^2 alpha \( s \) } . $ <eq:half-height-compensation>]

To verify it, expand $Z - delta X Y = 1 \/ 2 + \( u - 1 \/ 2 \) \( 1 - delta X r \) - delta^2 X^2 alpha \( r \)$ and its complementary equation, and add.

Suppose both caps fail and $0 < delta lt.eq 1 \/ 2$. The weights in (6.9) are at least $1 \/ 2$, since $\| X \| \, \| Y \| lt.eq 1$. Its right side is at most $delta^2$, so each positive radial excess is at most $2 delta^2$. It follows that $\| Y - r \/ 2 \| \, \| X - s \/ 2 \| lt.eq 2 delta^2 + delta \/ 2 lt.eq 3 delta \/ 2$. Therefore

$ X^2 alpha \( r \) + Y^2 alpha \( s \) lt.eq frac(s^2 alpha \( r \) + r^2 alpha \( s \), 4) + 9 / 4 delta lt.eq F \( r \) + F \( s \) + 9 / 4 delta . $

Here $\| X + s \/ 2 \| \, \| Y + r \/ 2 \| lt.eq 3 \/ 2$, $alpha lt.eq 1 \/ 2$, and the last inequality is monotonicity in $r^2 \, s^2$. Failed caps, however, make (6.9) divided by $delta^2$ exceed

$ \( 1 - delta \) \( F \( r \) + F \( s \) + 8 delta \) gt.eq F \( r \) + F \( s \) + 15 / 4 delta \, $

because $F lt.eq 1 \/ 8$. The incompatible constants $9 \/ 4$ and $15 \/ 4$ prove coverage throughout $0 < delta lt.eq 1 \/ 2$.

Replacing $4 delta^3$ by $delta^(5 \/ 2)$ gives a second useful version for all sufficiently small positive $delta$. To see the fractional cancellation directly, set $a = 1 \/ 2$, $P \( xi \) = a \/ 2 + xi^2 \/ \( 2 a \)$ and $g \( xi \) = xi^2 P \( xi \)$. The identity before (6.9) becomes

$ Z = a + delta X Y - delta^2 P \( a r \) X^2 + \( u - a \) \( 1 - delta r X \) . $

With both caps failed, $\| Y - a r \| \, \| X - a s \| = O \( delta \)$ uniformly and the positive factors are bounded away from zero. Bounded derivatives of $P \, g$ consequently give

$ Z & > a + delta X Y + delta^2 \( g \( Y \) - P \( Y \) X^2 \) + delta^(5 \/ 2) - C delta^3 \,\
Z & < a + delta X Y - delta^2 \( g \( X \) - P \( X \) Y^2 \) - delta^(5 \/ 2) + C delta^3 . $

Their incompatibility follows from the exact identity

$ g \( X \) + g \( Y \) - P \( X \) Y^2 - P \( Y \) X^2 = frac(\( X^2 - Y^2 \)^2, 2 a) gt.eq 0 . $

Thus the complementary and the positive-weight arguments both preserve fractional padding with its proper, non-fourth-order leading remainder. The affine change $x = 2 Y$, $y = 2 X$, $t = 2 Z - 1$ takes these two half-height families to the earlier canonical families with $epsilon = delta \/ 2$. The first family becomes the lower family with radial parameter $2 u$, angular parameter $r$, and free coordinate $y = 2 X$; the second becomes the upper family with radial parameter $2 v$, angular parameter $s$, and free coordinate $x = 2 Y$. The cubic and fractional caps become, respectively, $1 + epsilon^2 H + 64 epsilon^3$ and $1 + epsilon^2 H + 8 sqrt(2) epsilon^(5 \/ 2)$.

== 7 Finite enclosures and their areas <sec:finite-footprints>

Theorem 1 supplies triangular bases and the exact limiting cost for actual swept projections. This appendix records other finite choices: polygonal feet with explicit area formulas, convex trapezoids, and neighborhoods of the shortened beams’ radial sectors. Each choice keeps the same limiting cost as its sweep. Their finite areas and geometric properties can differ, so we specify the enclosure and control its area before taking a limit.

=== 7.1 One intercept identity, several enclosures <one-intercept-identity-several-enclosures>

Use a cap $R_epsilon$ and fix a positive tilt for which Appendix 6 gives coverage. Retain $h = sqrt(2)$. For a closed interval $I subset \[ - 1 \, 1 \]$ of positive length $d$, a tag $c in I$, and $M = max_I R_epsilon$, the upper-sweep point with parameters $q \, rho \, x$ has frozen intercept

#[#set math.equation(numbering: n => "(7.1)")
 $ u = rho - epsilon x \( q - c \) \, #h(2em) Y = q u + frac(epsilon x, 2) \( q - c \)^2 \, #h(2em) 0 lt.eq rho lt.eq M \, quad \| x \| lt.eq 2 . $ <eq:quadratic-foot-identity>]

The physical intercept point is $\( 0 \, Y \, h \( 1 - u \) \)$. Its area element is $h thin d Y thin d u$, and projection perpendicular to the frozen direction multiplies area by $\( 1 + epsilon^2 D_0 \( c \) \)^(- 1 \/ 2)$. The lower family is obtained by the same orthogonal map as before.

Let $m$ be the midpoint of $I$. For positive constants $A \, B$, an absolute-value footprint is

#[#set math.equation(numbering: n => "(7.2)")
 $ - A d lt.eq u lt.eq M + A d \, #h(2em) \| Y - m u \| lt.eq d / 2 \| u \| + B d^2 . $ <eq:abs-foot-family>]

For any tag, it contains (7.1) when $A gt.eq 2 epsilon$ and $B gt.eq epsilon$. For midpoint tags, the sharper sufficient conditions are $A gt.eq epsilon$ and $B gt.eq epsilon \/ 4$. Indeed $\| q - c \| lt.eq d$ for any tag and $\| q - c \| lt.eq d \/ 2$ at the midpoint; (7.1) then bounds the radial displacement by $2 epsilon \| q - c \|$ and the extra transverse displacement by $epsilon \| q - c \|^2$. The angular sector itself has width $d \| u \|$. The exact coordinate area is

#[#set math.equation(numbering: n => "(7.3)")
 $ frac(d M^2, 2) + \( A + 2 B \) M d^2 + \( A^2 + 4 A B \) d^3 . $ <eq:abs-foot-area>]

This follows by integrating $d \| u \| + 2 B d^2$ from $- A d$ to $M + A d$. The footprint is a compact polygonal set. With a negative collar it is generally nonconvex: the upper-boundary points at $u = plus.minus A d$ have a midpoint above the upper boundary at $u = 0$.

===== 7.1.1 The original cubic cap. <the-original-cubic-cap.>

For the cap $R_epsilon = 1 + epsilon^2 H + 5 epsilon^3$ used in Section 3, take $N$ equal intervals of length $d = 2 \/ N$, midpoint $c$, and $R_I = max_I R_epsilon$. The absolute-value choice $A = 2 epsilon$, $B = epsilon$ can be written

#[#set math.equation(numbering: n => "(7.4)")
 $ P_I = { \( 0 \, Y \, h \( 1 - u \) \) : - 2 epsilon d lt.eq u lt.eq R_I + 2 epsilon d \, quad Y in u I + \[ - epsilon d^2 \, epsilon d^2 \] } . $ <eq:polygonal-foot>]

The intercept identity (7.1) proves containment. Project $P_I$ perpendicular to $v_I = \( 1 \, - epsilon G \( c \) \, h epsilon c \)$ and apply $cal(R)$ to obtain the corresponding lower-family base. These $2 N$ cylinders cover the tetrahedron, and each upper base has exact area

#[#set math.equation(numbering: n => "(7.5)")
 $ h / sqrt(1 + epsilon^2 D_0 \( c \)) integral_(- 2 epsilon d)^(R_I + 2 epsilon d) \( d \| u \| + 2 epsilon d^2 \) thin d u . $ <eq:polygonal-area>]

By (7.3), this integral is $d R_I^2 \/ 2 + O_epsilon \( d^2 \)$ uniformly over the intervals. Their total cost therefore converges to (3.9). For sufficiently small fixed $epsilon$, this limit is below $2 h$, so a sufficiently fine finite partition gives a polygonal cover within the same strict area gap. These feet are generally nonconvex; the following affine choices give convex alternatives.

===== 7.1.2 Affine feet. <affine-feet.>

At a midpoint tag $c = m$ one can instead use the affine footprint

#[#set math.equation(numbering: n => "(7.6)")
 $ - A d lt.eq u lt.eq M + A d \, #h(2em) \| Y - c u \| lt.eq d / 2 u + B d^2 . $ <eq:midpoint-affine-foot>]

For containment it suffices that $A gt.eq epsilon$ and $B gt.eq 3 epsilon \/ 4$. To check this, use the other form of the exact intercept identity,

$ Y - c u = \( q - c \) rho - frac(epsilon x, 2) \( q - c \)^2 . $

Its absolute value is at most $d rho \/ 2 + epsilon d^2 \/ 4$, and $rho lt.eq u + epsilon d$. These are precisely the asserted bounds. If $B gt.eq A \/ 2$, the width is nonnegative on the entire radial interval, and the coordinate area is exactly

#[#set math.equation(numbering: n => "(7.7)")
 $ frac(d M^2, 2) + \( A + 2 B \) M d^2 + 4 A B d^3 . $ <eq:affine-foot-area>]

For $B > A \/ 2$ this is a nondegenerate compact trapezoid; for $B = A \/ 2$ it is a nondegenerate compact triangle with its vertex at $u = - A d$, provided $M + 2 A d > 0$. All cap choices here have $M > 0$. The projection is nonsingular, so it preserves convexity and polygon type.

Freezing at a left endpoint gives another affine certificate. Put $c = min I$ and $W = Y - c u$. Then

$ W = \( q - c \) u + frac(epsilon x, 2) \( q - c \)^2 . $

The footprint

#[#set math.equation(numbering: n => "(7.8)")
 $ - 2 epsilon d lt.eq u lt.eq M + 2 epsilon d \, #h(2em) - 3 epsilon d^2 lt.eq W lt.eq d u + 3 epsilon d^2 $ <eq:endpoint-affine-foot>]

contains all intercepts. For $u gt.eq 0$, the product $\( q - c \) u$ lies between $0$ and $d u$. For $u < 0$, it lies between $d u$ and $0$; the radial bound gives $\| u \| d lt.eq 2 epsilon d^2$. The error term has magnitude at most $epsilon d^2$, proving both inequalities. This compact convex trapezoid has area (7.7) with $A = 2 epsilon$, $B = 3 epsilon$.

The following choices illustrate the geometric freedom while keeping all constants in the same physical coordinate system:

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[freezing tag
], table.cell(rowspan: 1, colspan: 1)[foot
], table.cell(rowspan: 1, colspan: 1)[$\( A \, B \)$
]),
  table.cell(rowspan: 1, colspan: 1)[arbitrary
], table.cell(rowspan: 1, colspan: 1)[absolute-value
], table.cell(rowspan: 1, colspan: 1)[$\( 2 epsilon \, epsilon \)$
],
  table.cell(rowspan: 1, colspan: 1)[midpoint
], table.cell(rowspan: 1, colspan: 1)[absolute-value
], table.cell(rowspan: 1, colspan: 1)[$\( epsilon \, epsilon \)$
],
  table.cell(rowspan: 1, colspan: 1)[midpoint
], table.cell(rowspan: 1, colspan: 1)[affine trapezoid
], table.cell(rowspan: 1, colspan: 1)[$\( epsilon \, 3 epsilon \/ 4 \)$
],
  table.cell(rowspan: 1, colspan: 1)[midpoint
], table.cell(rowspan: 1, colspan: 1)[affine trapezoid
], table.cell(rowspan: 1, colspan: 1)[$\( 4 epsilon \, 4 epsilon \)$
],
  table.cell(rowspan: 1, colspan: 1)[midpoint
], table.cell(rowspan: 1, colspan: 1)[affine trapezoid
], table.cell(rowspan: 1, colspan: 1)[$\( epsilon \, epsilon \)$
],
  table.cell(rowspan: 1, colspan: 1)[midpoint
], table.cell(rowspan: 1, colspan: 1)[triangle
], table.cell(rowspan: 1, colspan: 1)[$\( 2 epsilon \, epsilon \)$
],
  table.cell(rowspan: 1, colspan: 1)[left endpoint
], table.cell(rowspan: 1, colspan: 1)[affine trapezoid
], table.cell(rowspan: 1, colspan: 1)[$\( 2 epsilon \, 3 epsilon \)$
],
)
]

For example, the midpoint trapezoid $\( epsilon \, 3 epsilon \/ 4 \)$ is contained in the absolute-value foot $\( epsilon \, epsilon \)$ for the same cap and interval. Their half-width difference is $epsilon d^2 \/ 4$ on $u gt.eq 0$ and $- d u + epsilon d^2 \/ 4$ on $u lt.eq 0$. They have the same leading area but distinct finite areas and convexity properties. The more generously padded choices $A = B = 1$ when $epsilon lt.eq 1 \/ 8$, and $A = B = sqrt(2) + 2 epsilon$, also satisfy the absolute-value certificate. They are useful when the original coordinate mesh is chosen independently of the small tilt.

In all these formulas the area is $d M^2 \/ 2 + O_epsilon \( d^2 \)$, uniformly in $I$ for fixed tilt and bounded cap. Multiplication by the physical projection factor and Riemann summation therefore give the exact total limit $2 h Q_R \( epsilon \)$. The actual swept projections have that same limit: the certificates give the upper bound, and the zero-free-coordinate sectors in Theorem 1 give the matching lower bound. This equality of limits does not identify the finite bases. For example, freezing actual sweeps at left endpoints and projecting explicit feet at midpoints need not give the same bases or the same finite cost.

=== 7.2 Two exact formulas at unit edge length <two-exact-formulas-at-unit-edge-length>

It is useful to write two of the finite enclosures in coordinates in which the tetrahedron has edge one. Let $h_1 = 1 \/ sqrt(2)$ and fix a sufficiently small $eta > 0$. For the square-root cap

$ T_eta \( s \)^2 = 1 / 4 + eta^2 (s^2 \/ 4 + s^4 + 1 \/ 960) \, #h(2em) \| s \| lt.eq 1 / 2 \, $

use the tetrahedron $\| x \| lt.eq \( 1 - t \) \/ 2$, $\| y \| lt.eq t \/ 2$ in physical coordinates $\( x \, y \, h_1 t \)$. The first line family is

$ y = s p + eta x \( 1 \/ 4 + s^2 \) \, #h(2em) t = p + 2 eta x s \, #h(2em) 0 lt.eq p lt.eq T_eta \( s \) \, $

and the second exchanges $x \, y$, $t \, 1 - t$, and changes the sign of the tilt. Under $X = 4 y$, $Y = 4 x$, $Z = 2 t - 1$ this is cap (S) with $epsilon = eta \/ 2$ and $beta = 1 \/ 120$, so the coverage proof is already complete: the first family becomes the canonical lower family with angle $2 s$ and radius $2 p$; the second becomes the upper family. For midpoint intervals of length $Delta = 1 \/ N$, midpoint $s_j$, and maximum $T_j$, the intercept triangles are

#[#set math.equation(numbering: n => "(7.9)")
 $ - eta Delta lt.eq c lt.eq T_j + eta Delta \, #h(2em) \| b - s_j c \| lt.eq Delta / 2 \( c + eta Delta \) . $ <eq:unit-triangle-foot>]

Their physical area is exactly

#[#set math.equation(numbering: n => "(7.10)")
 $ frac(h_1 Delta, 2) \( T_j + 2 eta Delta \)^2 . $ <eq:unit-triangle-area>]

For completeness, subtracting the frozen direction from a represented point gives $c = p + 2 eta x \( s - s_j \)$ and $b - s_j c = \( s - s_j \) p + eta x \( s - s_j \)^2$. Since $\| x \| lt.eq 1 \/ 2$, $\| c - p \| lt.eq eta Delta \/ 2$ and $\| b - s_j c \| lt.eq Delta \( p + eta Delta \/ 4 \) \/ 2 lt.eq Delta \( c + eta Delta \) \/ 2$. Projecting these intercept triangles gives $2 N$ triangular bases whose cylinders cover for every $N gt.eq 1$, not only after mesh refinement. Projection divides their physical intercept area by $sqrt(1 + eta^2 \( \( 1 \/ 4 + s_j^2 \)^2 + 2 s_j^2 \))$. Summing over both families gives the exact limit

$ h_1 integral_(- 1 \/ 2)^(1 \/ 2) frac(1 \/ 4 + eta^2 \( s^2 \/ 4 + s^4 + 1 \/ 960 \), sqrt(1 + eta^2 \( \( 1 \/ 4 + s^2 \)^2 + 2 s^2 \))) thin d s = h_1 (1 / 4 - eta^2 / 960 + O \( eta^4 \)) . $

This is a particular triangle formula in addition to the arbitrary-tag triangles furnished by Theorem 1.

For the half-height construction of Appendix 6, take intervals of half-length $rho = 1 \/ N$, midpoint $p_j$, and maximum cap $M_j$. Put $e = delta rho \/ 2$. In its normalized intercept coordinates define

#[#set math.equation(numbering: n => "(7.11)")
 $ D_j = { \( v \, w \) : - e lt.eq w lt.eq M_j + e \, quad \| v - p_j w \| lt.eq rho \( w + 2 e \) } . $ <eq:halfheight-trapezoid>]

Its exact coordinate area is

#[#set math.equation(numbering: n => "(7.12)")
 $ \| D_j \| = rho \( M_j^2 + 6 e M_j + 8 e^2 \) . $ <eq:halfheight-trapezoid-area>]

An actual first-family intercept has $\( v \, w \) = \( u r + sigma \( r + p_j \) \/ 2 \, u + sigma \)$ with $sigma = delta X \( r - p_j \) \/ 2$, so $\| sigma \| lt.eq e$ and $\| v - p_j w \| lt.eq rho \( u + e \/ 2 \) lt.eq rho \( w + 2 e \)$. The second-family formula has $sigma = - delta Y \( s - p_j \) \/ 2$ and gives the same bounds. The perpendicular projections of these trapezoids give $2 N$ compact convex bases whose cylinders cover the tetrahedron. The physical foot area multiplier is $h_1 \/ 2$, and its projection factor is $\( 1 + delta^2 \( alpha \( p_j \)^2 + 2 beta \( p_j \)^2 \) \)^(- 1 \/ 2)$. Consequently the cubic cap gives total area limit

$ h_1 / 2 integral_(- 1)^1 frac(R_delta \( r \)^2, sqrt(1 + delta^2 \( alpha \( r \)^2 + 2 beta \( r \)^2 \))) thin d r = h_1 / 2 (1 / 2 - delta^2 / 240 + O \( delta^3 \)) . $

The exact cubic coefficient can also be retained by (6.2). Coverage holds for $0 < delta lt.eq 1 \/ 2$; strict saving uses a sufficiently small such $delta$ before selecting $N$. The count is exactly two cylinders per interval and is not asserted to remain bounded as the tilt tends to zero.

=== 7.3 Beam bases from neighborhoods of two triangles <beam:neighborhood-alternative>

We finish with a different geometry for the beam bases of Section 4. Fix $a in \( 0 \, 1 \/ 2 \)$ and recall

$ R_a = 2 - a \, quad c = \( - 1 \, - 1 \) \, quad r \( p \) = \( p \, 1 - p \) \, quad v \( p \) = \( 1 \, - 1 \) + a R_a \( - p^2 \, \( 1 - p \)^2 \) . $

The physical map is $P \( x \, y \, t \) = \( beta x \, beta y \, t \)$ with $beta = 1 \/ sqrt(2)$, and the first beam $H^(-)$ consists of $P \( c + h r \( p \) + t v \( p \) \, t \)$ for $0 lt.eq p lt.eq 1$, $0 lt.eq h lt.eq R_a$, and $\| t \| lt.eq 1$. Its reflection in the vertical axis is the second beam. Using the projection factor $g$ from (4.2), the combined limiting normalized cost is $C_1 = R_a^2 integral_0^1 g \( v \( p \) \) thin d p$. We construct bases from neighborhoods of two triangular sectors; their finite areas differ from the triangular bases in the main proof.

Partition $\[ 0 \, 1 \]$ into $k$ closed intervals $I$ of length $delta = 1 \/ k$, and freeze the direction at each midpoint $p_I$. Sliding a point of $H^(-)$ to height zero along $\( beta v \( p_I \) \, 1 \)$ leaves the planar intercept $c + h r \( p \) + t \( v \( p \) - v \( p_I \) \)$. For $e = p - p_I$, the quadratic formula for $v$ gives the exact identity

#[#set math.equation(numbering: n => "(7.13)")
 $ v \( p \) - v \( p_I \) = - 2 a R_a e thin r \( p \) + a R_a e^2 \( 1 \, - 1 \) . $ <beam:radial-cancellation>]

The first term changes only the radial parameter $h$. Indeed, $\| 2 a R_a e t \| lt.eq delta$ and $\| a R_a e^2 t \( 1 \, - 1 \) \| lt.eq sqrt(2) delta^2 \/ 4 < delta^2$ because $a R_a < 1$ and $\| e \| lt.eq delta \/ 2$. Thus every intercept lies in $c + S_I$, where $S_I$ is the closed $delta^2$-neighborhood of

$ Q_I = { d r \( p \) : p in I \, med - delta lt.eq d lt.eq R_a + delta } . $

The set $Q_I$ consists of two triangles, with total area

$ \| Q_I \| = frac(\( R_a + delta \)^2 + delta^2, 2) thin delta . $

This follows either from their vertex determinants or from the Jacobian $\| d \|$ of $\( d \, p \) mapsto d r \( p \)$. Their perimeters are uniformly bounded. For a triangle, a radius-$rho$ neighborhood adds at most its perimeter times $rho$ plus $pi rho^2$ in area: decompose the added region into edge rectangles and vertex sectors, whose angles sum to $2 pi$. Applying this to both triangles, with $rho = delta^2$, gives

$ \| S_I \| lt.eq R_a^2 / 2 delta + O \( delta^2 \) . $

The constant is uniform over the intervals. Projecting $P \( c + S_I \, 0 \)$ onto the perpendicular plane produces a compact base whose cylinder covers the corresponding part of $H^(-)$. By (4.2), its normalized cost is $\| S_I \| g \( v \( p_I \) \)$. The unpadded sector ${ d r \( p \) : p in I \, med 0 lt.eq d lt.eq R_a }$ lies in $Q_I subset S_I$ and has area $R_a^2 delta \/ 2$. Combining this lower bound with the upper estimate gives the first beam’s total normalized cost as

$ R_a^2 / 2 sum_I delta thin g \( v \( p_I \) \) + O_a \( delta \) arrow.r C_1 / 2 . $

Since $g compose v$ is smooth on $\[ 0 \, 1 \]$, the midpoint sum differs from its integral by $O_a \( delta \)$. The orthogonal map $\( X \, Y \, T \) mapsto \( - X \, - Y \, T \)$ supplies the reflected covering at the same cost. Thus, for every positive integer $k$, these $2 k$ cylinders cover the two beams, and their total normalized cost is $C_1 + O_a \( k^(- 1) \)$. The quadratic transverse remainder in (7.13) makes the summed padding cost vanish. For the small tilts used in Proposition 8, combining sufficiently fine beam covers of this form with the strip cover of Lemma 7 gives another finite tetrahedron cover of total area below $A_min \/ 2$.

== 8 Physical coordinates and barycentric sweeps <sec:coordinate-realizations>

This appendix translates the caps and finite feet of Appendices 6–7 into other Euclidean realizations of a regular tetrahedron. Each translation must track both the physical area factor and the effective tilt: rescaling an angular parameter alone does not determine either. A single dictionary handles the scaled models. We then give a barycentric realization, where a direct overlap proof and a geometric enclosure also explain positivity of the radial parameters and coverage of boundary points.

=== 8.1 A scaled coordinate model <a-scaled-coordinate-model>

Let $b > 0$ and $H_b = sqrt(2) b$. In physical coordinates $\( x \, y \, H_b t \)$, define the regular edge-$2 b$ tetrahedron

$ K_b = { \( x \, y \, H_b t \) : 0 lt.eq t lt.eq 1 \, quad \| x \| lt.eq b t \, quad \| y \| lt.eq b \( 1 - t \) } . $

Its paired line families, with angular variable $s in \[ - b \, b \]$, are

$ & \( x \, rho s - eta x \( s^2 + b^2 \) \/ 2 \, H_b \( 1 - rho + eta x s \) \) \,\
 & \( rho s + eta y \( s^2 + b^2 \) \/ 2 \, y \, H_b \( rho + eta y s \) \) . $

Their free coordinate satisfies $\| x \| lt.eq b$ or $\| y \| lt.eq b$, and $0 lt.eq rho lt.eq T_eta \( s \)$. The transformation to the earlier physical model is

#[#set math.equation(numbering: n => "(8.1)")
 $ X = 2 x \/ b \, quad Y = 2 y \/ b \, quad Z = 2 t - 1 \, #h(2em) r = s \/ b \, quad R = 2 rho \, quad epsilon = eta b^2 . $ <eq:halfheight-dictionary>]

The canonical physical point is $\( X \, Y \, sqrt(2) Z \)$. This map is a translation followed by a Euclidean similarity of ratio $2 \/ b$. Substituting in the first displayed line gives $\( X \, R r - epsilon X G \( r \) \, 1 - R + epsilon X r \)$ in the $\( X \, Y \, Z \)$ coordinates; substitution in the second gives the lower line. This checks the two families and their radial bounds, not only the tetrahedron. The common upper bound is $R_epsilon \( r \) = 2 T_eta \( b r \)$.

For example, cap (L) and cap (S), respectively, become

#[#set math.equation(numbering: n => "(8.2)")
 $ T_eta \( s \) & = 1 / 2 + eta^2 A_(b \, beta) \( s \) \,\
T_eta \( s \) & = sqrt(1 / 4 + eta^2 A_(b \, beta) \( s \)) \,\
A_(b \, beta) \( s \) & = frac(s^4 + b^2 s^2, 4) + frac(b^4 beta, 2) . $ <eq:scaled-linear-cap>]

The exact two-family area integral in these coordinates is

#[#set math.equation(numbering: n => "(8.3)")
 $ H_b integral_(- b)^b frac(T_eta \( s \)^2, sqrt(1 + eta^2 \( \( s^2 + b^2 \)^2 \/ 4 + H_b^2 s^2 \))) thin d s = frac(b H_b, 2) Q_R \( eta b^2 \) . $ <eq:scaled-cost-identity>]

Indeed $d s = b thin d r$, $T = R \/ 2$, and the denominator becomes $sqrt(1 + epsilon^2 D_0 \( r \))$. Both sides express the same weighted cost in physical area units. The multiplier $b H_b \/ 2$ is half the minimum projection area of $K_b$. Thus the coefficient in these coordinates, relative to this reference area, is exactly $\( 2 beta - 1 \/ 30 \) eta^2 b^4$.

The following examples use tetrahedra of edge lengths one, $sqrt(2)$, and two. Keeping the physical scale and angular scale together lets each row determine both the finite bases and their cost coefficients. The parameter $tau$ denotes the tilt used in the indicated row.

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$b$
], table.cell(rowspan: 1, colspan: 1)[$eta$
], table.cell(rowspan: 1, colspan: 1)[$beta$
], table.cell(rowspan: 1, colspan: 1)[radial cap
]),
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$tau$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 120$
], table.cell(rowspan: 1, colspan: 1)[linear
],
  table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$tau \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 120$
], table.cell(rowspan: 1, colspan: 1)[linear
],
  table.cell(rowspan: 1, colspan: 1)[$1 \/ sqrt(2)$
], table.cell(rowspan: 1, colspan: 1)[$tau$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 125$
], table.cell(rowspan: 1, colspan: 1)[linear or square root
],
  table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$tau$
], table.cell(rowspan: 1, colspan: 1)[$4 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[linear
],
  table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$2 tau$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 120$
], table.cell(rowspan: 1, colspan: 1)[square root
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2 tau$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 200$
], table.cell(rowspan: 1, colspan: 1)[linear
],
)
]

For instance, the $b = 1 \/ sqrt(2)$ row has additive polynomial $\( s^4 + s^2 \/ 2 \) \/ 4 + 1 \/ 1000$ and relative quadratic coefficient $- 13 tau^2 \/ 3000$. The $b = 1 \/ 2$, $eta = tau$ row has additive polynomial $s^4 \/ 4 + s^2 \/ 16 + 1 \/ 5000$, and its limiting total area is

$ 2 H_b (1 / 8 - 77 / 480000 tau^2 + O \( tau^4 \)) . $

For $b = 1 \/ 2$, $eta = tau \/ 2$, write $c = 1 \/ 2$ and $a \( s \) = c \( 1 \/ 8 + s^2 \/ 2 \)$; the cap can equivalently be written $c + tau^2 \( c^2 s^2 a \( s \) + c^3 \/ 1920 \)$. Its limiting total area is $H_b \/ 4 - \( H_b c^4 \/ 960 \) tau^2 + O \( tau^4 \)$. The monotone-polynomial calculation in Appendix 6 applies with precisely these constants.

Under (8.1), the generously padded absolute-value footprint $A = B = sqrt(2) + 2 epsilon$ and the midpoint affine footprint $A = B = 4 epsilon$ remain explicit finite enclosures. Equations (7.3) and (7.7) compute their finite areas; the sector lower bound in Theorem 1 shows that actual swept projections have the same limiting total area. A similarity preserves that limit, the possible differences between the finite areas, convexity, and the number $2 N$ of cylinders.

===== 8.1.1 Centered coordinates. <centered-coordinates.>

For a centered tetrahedron one instead uses $\| x \| lt.eq b \( 1 + t \)$, $\| y \| lt.eq b \( 1 - t \)$ with physical height coordinate $H_b t$. The similarity $X = x \/ b$, $Y = y \/ b$, $Z = t$ has ratio $1 \/ b$. Angular substitution $r = s \/ b$ again makes the effective tilt $epsilon = eta b^2$; the radial parameter now stays unchanged. Its two-family reference cost is $2 sqrt(2) b^2$. For example, when $b = 1 \/ sqrt(2)$, cap (L) with $beta = 1 \/ 250$ becomes

$ R_eta \( s \) = 1 + eta^2 (\( s^4 + s^2 \/ 2 \) \/ 2 + 1 \/ 1000) . $

Half the total quadratic coefficient in these orthonormal coordinates is $- b \/ 120 + 2 b \/ 1000 < 0$. Fractional padding $R_eta \( s \) = 1 + eta^2 s^2 \( b^2 + s^2 \) \/ 2 + eta^(5 \/ 2)$ becomes cap (F) with $c = 4 sqrt(2)$; its limiting total cost is $2 b - b eta^2 \/ 60 + o \( eta^2 \)$. These formulas retain the factor of two between one family and the full cover.

===== 8.1.2 Nonorthonormal coordinates. <nonorthonormal-coordinates.>

One useful coordinate system has metric $d t^2 + \( d p^2 + d q^2 \) \/ 2$ and tetrahedron $\| p \| lt.eq 1 + t$, $\| q \| lt.eq 1 - t$. Sending it to the canonical physical point $\( p \, q \, sqrt(2) t \)$ is a similarity of ratio $sqrt(2)$, rather than an isometry. Its physical intercept area multiplier is $1 \/ sqrt(2)$; its limiting total cost is $sqrt(2) Q_R \( epsilon \)$, and its minimum projection area is $2 sqrt(2)$. Cubic padding $5 epsilon^3$ therefore gives

$ sqrt(2) (1 - epsilon^2 \/ 30 + 10 epsilon^3 + O \( epsilon^4 \)) \, $

as the exact limit for both the explicit feet and the actual swept projections. Fractional padding $epsilon^(5 \/ 2)$ gives $sqrt(2) \( 1 - epsilon^2 \/ 30 + 2 epsilon^(5 \/ 2) + O \( epsilon^4 \) \)$.

===== 8.1.3 An orthonormal height coordinate. <an-orthonormal-height-coordinate.>

Consider the physical tetrahedron $\| x \| lt.eq 1 - k z$, $\| y \| lt.eq 1 + k z$ in ordinary orthonormal coordinates, where $k = 1 \/ sqrt(2)$. Its canonical coordinates are $X = y$, $Y = x$, $t = k z$. For a positive physical tilt $tau$, the effective canonical tilt is $epsilon = k tau$. Write the physical radial height cap as

$ R_(upright("phys")) \( r \) = k^(- 1) + k tau^2 H \( r \) + 10 tau^3 . $

Its canonical cap is $k R_(upright("phys"))$, so $epsilon = k tau$ and $k^2 = 1 \/ 2$ give canonical cubic constant $c = 20$. Select the angular roots $q$ for the canonical upper family and $p$ for the canonical lower family as in Proposition 4. If both selected radial parameters exceed their caps, then after the coordinate substitution, (6.3) multiplied by $epsilon tau$ gives

$ tau \( y q - x p \) lt.eq k tau^2 \( H \( p \) + H \( q \) \) + 9 k^2 tau^3 . $

The two physical cubic additions supply $20 tau^3$, and $9 k^2 < 20$. This preserves the explicit cubic comparison in physical, rather than rescaled, tilt units.

=== 8.2 A barycentric realization and its boundary points <a-barycentric-realization-and-its-boundary-points>

In this subsection $k$ denotes a new positive tilt parameter, independent of the fixed conversion constant used above. It will be chosen sufficiently small.

Consider the nonnegative simplex $Delta$ in the affine Euclidean space

$ { \( a \, b \, c \, d \) in bb(R)^4 : a + b + c + d = 1 } . $

Its edge length is $sqrt(2)$. Set $s = a + b$, $q = a - b$, and $p = c - d$. The induced squared length element is $d s^2 + \( d q^2 + d p^2 \) \/ 2$. Hence

#[#set math.equation(numbering: n => "(8.4)")
 $ \( X \, Y \, Z \) = \( 2 q \, 2 p \, 2 s - 1 \) $ <eq:barycentric-dictionary>]

gives a Euclidean similarity of ratio $2 sqrt(2)$ to the canonical physical model, where the physical point is $\( X \, Y \, sqrt(2) Z \)$. The minimum projection area of $Delta$ is therefore $1 \/ sqrt(2)$.

Define, for $0 lt.eq t lt.eq 1$,

$ V \( t \) = \( t^2 \, - \( 1 - t \)^2 \) \, quad w \( t \) = 2 t - 1 \, quad F \( v \) = v^2 + 4 v^4 + 1 \/ 1000 \, quad B_k \( t \) = 1 \/ 2 + k^2 F \( w \( t \) \/ 2 \) . $

For the first sweep set

#[#set math.equation(numbering: n => "(8.5)")
 $ \( a \, b \) = S \( t \, 1 - t \) + k p V \( t \) \, quad 0 lt.eq S lt.eq B_k \( t \) \, quad \| p \| lt.eq 1 \, $ <eq:barycentric-first-sweep>]

with $c \, d$ determined by their sum and difference. For the second set

#[#set math.equation(numbering: n => "(8.6)")
 $ \( c \, d \) = T \( r \, 1 - r \) - k q V \( r \) \, quad 0 lt.eq T lt.eq B_k \( r \) \, quad \| q \| lt.eq 1 . $ <eq:barycentric-second-sweep>]

Under (8.4), the first family is the canonical lower family and the second is the upper family, with angular parameters $2 t - 1$ and $2 r - 1$, radial parameters $2 S \, 2 T$, and free coordinates $2 p \, 2 q$. Their cap is precisely $1 + k^2 \( H + 1 \/ 500 \)$. This already gives coverage for small $k$. The following direct proof explains the positive radial parameters and the closure at boundary points in the original affine simplex.

For an interior point of $Delta$, the function $a \/ t - b \/ \( 1 - t \)$ decreases continuously from $+ oo$ to $- oo$. Choose its root at level $k p$ and put

$ S = a \/ t - k p t = b \/ \( 1 - t \) + k p \( 1 - t \) . $

Multiplying the two equal expressions by $1 - t$ and $t$, respectively, and adding proves $S > 0$. Apply the analogous construction to $c \, d$ and level $- k q$ to obtain $r$ and $T > 0$. Writing $w = 2 t - 1$, $z = 2 r - 1$, the sum and difference equations are

$ 1 = S + T + k p w - k q z \, #h(2em) q = S w + k p G \( w \) \, #h(2em) p = T z - k q G \( z \) . $

If both caps fail, $S \, T > 1 \/ 2$ and boundedness first gives $S \, T = 1 \/ 2 + O \( k \)$, $w = 2 q + O \( k \)$, $z = 2 p + O \( k \)$. Substitution in the sum improves $S + T$ to $1 + O \( k^2 \)$ and therefore each radial parameter to $1 \/ 2 + O \( k^2 \)$. The remaining equations yield

$ w = 2 q - k p \( 1 + 4 q^2 \) + O \( k^2 \) \, #h(2em) z = 2 p + k q \( 1 + 4 p^2 \) + O \( k^2 \) . $

All remainders are uniform on the bounded parameter set. It follows that $S + T = 1 + k^2 \( p^2 + q^2 + 8 p^2 q^2 \) + O \( k^3 \)$. The two failed caps require $S + T > 1 + k^2 \( F \( p \) + F \( q \) \) + O \( k^3 \)$, whereas

$ F \( p \) + F \( q \) - \( p^2 + q^2 + 8 p^2 q^2 \) = 4 \( p^2 - q^2 \)^2 + 2 \/ 1000 > 0 . $

This proves coverage of the interior for sufficiently small $k$. Each sweep is a continuous image of a compact parameter domain and is therefore closed. Their union contains the closure of the interior, which is all of $Delta$. This final compactness step includes the faces and vertices without extending the fractions $a \/ t \, b \/ \( 1 - t \)$ to endpoints.

=== 8.3 The barycentric finite enclosure <the-barycentric-finite-enclosure>

Fix such a $k$ and divide $\[ 0 \, 1 \]$ into $N$ equal closed intervals of length $ell$. For a midpoint $t_0$, freeze the first-family direction and take the perpendicular projection of that interval’s compact swept set as the base. Moving along the frozen direction to the plane $p = 0$ gives the $\( a \, b \)$-coordinate intercept

$ S \( t \, 1 - t \) + k p \( V \( t \) - V \( t_0 \) \) . $

With $d = t - t_0$ one has the exact identity

#[#set math.equation(numbering: n => "(8.7)")
 $ V \( t \) - V \( t_0 \) = 2 d \( t \, 1 - t \) - d^2 \( 1 \, - 1 \) . $ <eq:barycentric-quadratic-identity>]

The intercept is therefore within coordinate distance $sqrt(2) k ell^2$ of the sector

$ { rho \( t \, 1 - t \) : t in I \, med - 2 k ell lt.eq rho lt.eq M_I + 2 k ell } \, #h(2em) M_I = max_I B_k . $

This sector is the union of two triangles meeting at the origin. The absolute Jacobian of $\( rho \, t \) mapsto rho \( t \, 1 - t \)$ is $\| rho \|$; its area is consequently $ell M_I^2 \/ 2 + O_k \( ell^2 \)$. Its two triangle perimeters are bounded independently of $I$ and $N$. Thickening a triangle by a distance $r$ adds at most its perimeter times $r$ plus $pi r^2$: cover the added region by the rectangles along its edges and the circular sectors at its vertices. Apply this separately to the two triangles with $r = sqrt(2) k ell^2$. The resulting bound for the actual compact intercept image is $ell M_I^2 \/ 2 + O_k \( ell^2 \)$. This enclosure retains the geometric thickening method; it need not equal an absolute-value polygonal foot.

The plane $p = 0$ is parametrized by $\( a \, b \, \( 1 - a - b \) \/ 2 \, \( 1 - a - b \) \/ 2 \)$. Its Gram determinant is two, so physical area is $sqrt(2)$ times its $\( a \, b \)$ coordinate area. Along a frozen line parametrized by $p$, the rates are $d s \/ d p = k w \( t_0 \)$ and $d q \/ d p = k \( t_0^2 + \( 1 - t_0 \)^2 \)$. Using the metric above, its projection cosine is

$ \[ 1 + k^2 E \( t_0 \) \]^(- 1 \/ 2) \, #h(2em) E \( t \) = 2 w \( t \)^2 + \( t^2 + \( 1 - t \)^2 \)^2 . $

There is also a matching lower estimate. Taking $p = 0$ in the first sweep includes the sector ${ S \( t \, 1 - t \) : t in I \, med 0 lt.eq S lt.eq B_k \( t \) }$ in its intercept image. Its coordinate area is $1 / 2 integral_I B_k \( t \)^2 thin d t$. Therefore the actual perpendicular base has area at least

$ frac(sqrt(2), 2 sqrt(1 + k^2 E \( t_0 \))) integral_I B_k \( t \)^2 thin d t . $

This lower bound and the preceding geometric upper bound have the same sum limit. Exchanging the coordinate pairs and changing the sign of the tilt gives the identical argument for the second family. Thus $2 N$ compact-base cylinders cover $Delta$, and their total area converges to $2 J$, where

$ J = sqrt(2) integral_0^1 frac(B_k \( t \)^2 \/ 2, sqrt(1 + k^2 E \( t \))) thin d t \, #h(2em) J \/ sqrt(2) = 1 / 8 - 11 / 3000 k^2 + O \( k^4 \) . $

For the coefficient, integrate $F \( w \( t \) \/ 2 \) \/ 2 - E \( t \) \/ 16$; the two relevant averages are $integral_0^1 F \( w \/ 2 \) = 2 \/ 15 + 1 \/ 1000$ and $integral_0^1 E = 17 \/ 15$. Equivalently the exact change of variable $r = 2 t - 1$ gives $2 J = \( sqrt(2) \/ 4 \) Q_R \( k \)$ with $beta = 1 \/ 500$. Choose $k$ small enough for coverage and $2 J < sqrt(2) \/ 4$, then take a finite sufficiently fine partition. The thickened sectors and actual swept projections need not have equal finite areas; the matching sector lower bound proves equality of their limiting costs.


#bibliography("refs.bib", style: "ieee", title: [References])
