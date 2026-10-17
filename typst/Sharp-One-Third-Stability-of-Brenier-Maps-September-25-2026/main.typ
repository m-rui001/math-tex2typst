#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp-One-Third-Stability-of-Brenier-Maps-September-25-2026]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

Fix an integer $d gt.eq 2$, a compact convex set $K subset bb(R)^d$ with nonempty interior, and the uniform probability measure

$ rho = frac(1_K, \| K \|) thin d x . $

For a nonempty compact set $Y subset bb(R)^d$, let $"Prob" \( Y \)$ denote the Borel probability measures supported on $Y$. The quadratic optimal transport map from $rho$ to $mu in "Prob" \( Y \)$ is denoted by $T_mu$. It minimizes

$ integral_K \| x - T \( x \) \|^2 thin d rho \( x \) quad upright("subject to ") T_(\#) rho = mu $

and is unique up to a $rho$-null set. Such maps are gradients of convex potentials, as in Brenier’s theorem #cite(label("Brenier1991")). We give direct existence and uniqueness arguments for the maps used here.

For probability measures $mu \, nu$ with compact support, write

$ W_2 \( mu \, nu \) = inf_(pi in Pi \( mu \, nu \)) (integral_(bb(R)^d times bb(R)^d) \| y - z \|^2 thin d pi \( y \, z \))^(1 \/ 2) \, $

where $Pi \( mu \, nu \)$ is the set of probability couplings. We use $W_1 \( mu \, nu \) = inf_(pi in Pi \( mu \, nu \)) integral \| y - z \| thin d pi$ only when comparing earlier bounds. Our result is the following uniform estimate.

#thm([Theorem 1.1.])[
  #emph[For every $K \, Y$ as above there is a finite constant $C \( K \, Y \)$ such that 
$ parallel T_mu - T_nu parallel_(L^2 \( rho \)) lt.eq C \( K \, Y \) thin W_2 \( mu \, nu \)^(1 \/ 3) #h(2em) #scale(x: 120%, y: 120%)[\(] mu \, nu in "Prob" \( Y \) #scale(x: 120%, y: 120%)[\)] . $

 The targets may be atomic, singular, or absolutely continuous. The exponent $1 \/ 3$ cannot be replaced by any larger exponent in general, even for $K = Y = \[ - 1 \, 1 \]^d$ and targets with exactly three atoms.]
] <main:stability>

The constant is independent of atom count, positive atom masses, site separation, and density bounds. Neither smoothness nor strict convexity of $K$ is required, and $Y$ need not be convex. An explicit admissible constant is obtained in 11.

=== 1.1 History and significance <history-and-significance>

Quantitative stability asks how strongly the representation of a target measure by its optimal map depends on the target. Earlier contributions include Ambrosio’s local one-half Hölder estimate along target curves near regular data, reported by Gigli #cite(label("Gigli2011")) Corollary 3.4, and Berman’s estimates for varying sources against a fixed target whose density is bounded below on a convex domain #cite(label("Berman2021")). Mérigot, Delalande, and Chazal used dualization to obtain target-uniform bounds from Berman’s work, with dimension-dependent exponents, and then proved a dimension-independent $W_1^(2 \/ 15)$ bound for a uniform convex source #cite(label("MerigotDelalandeChazal2020")) Corollary 2.4 and Theorem 3.1.

Potential estimates followed by convex-gradient interpolation became central to the target-uniform problem. Delalande and Mérigot proved an $L^2$-map bound of order $W_1^(1 \/ 6)$ for source densities bounded above and below on a convex domain and targets in a fixed compact set #cite(label("DelalandeMerigot2023")) Theorem 4.2. Their interpolation inequality #cite(label("DelalandeMerigot2023")) Proposition 4.1 is the antecedent of our last step; the improvement here is the linear $W_2$ estimate for potential differences. Letrouit and Mérigot extended potential stability to John domains by local-to-global variance arguments, and obtained the corresponding map estimate when the boundary is rectifiable with finite $\( d - 1 \)$-dimensional measure #cite(label("LetrouitMerigot2024")) Theorem 1.7.

Divol, Niles-Weed, and Pooladian obtained a $W_2^(1 \/ 3)$-map estimate for regular source densities and nondegenerate finite targets #cite(label("DivolNilesWeedPooladian2025")) Theorem 4.3. Its constant depends on the number of atoms, a positive lower bound for their masses, and separation and angular geometry, whereas 1 has one constant for all Borel targets, including degenerating atomic measures. At the other end of the regularity scale, Lipschitz $L^2$ stability in $W_2$ holds for uniformly positive Hölder-continuous densities on suitably regular uniformly convex domains #cite(label("CajaLopezDelgadinoKitagawa2026")) Theorem 1.1. Its constants depend on nondegeneracy and regularity conditions that exclude our atomic targets.

Cazelles, Pauwels, and Portales obtained a $W_1^(1 \/ 5)$ map bound for bounded source densities and compactly supported marginals in their analysis of Monge-map estimation #cite(label("CazellesPauwelsPortales2026")) Corollary 4.9. Han and Zhu #cite(label("HanZhu2026")) Proposition 2.7 report a sharp $W_1^(1 \/ 4)$ estimate of Mérigot #cite(label("Merigot2026")); see also #cite(label("ChewiEichingerPooladian2026")) Section 2.3. Since $W_1 lt.eq W_2$, a quarter-power estimate in $W_1$ gives at most a quarter-power estimate in $W_2$ by that comparison alone. In the fixed-cube family of 3, $W_1$ and $W_2$ have different scaling, so its $W_2^(1 \/ 3)$ obstruction is compatible with a sharp $W_1^(1 \/ 4)$ estimate.

Letrouit proved an obstruction to exponents above $1 \/ 3$ for a nonconvex source and formulated uniform square-root stability in $W_2$ for a uniform convex source as a conjecture #cite(label("Letrouit2026")) Theorem 2 and Conjecture 3. The fixed-cube three-plane construction proved in 3 disproves that conjectured exponent and every other exponent above $1 \/ 3$, even with only three target atoms. The positive bound in 1 identifies the matching uniform endpoint. Together, the two parts determine the sharp exponent within the stated uniform-source class.

=== 1.2 Sharpness and the finite-cell argument <sharpness-and-the-finite-cell-argument>

We begin in 2 with the obstruction. A maximum of three affine functions has a thin central cell between two outer cells. Tilting the middle affine function preserves its cell mass but switches source points between slopes at order-one separation. The resulting three-atom targets give the sharpness assertion. The remaining sections prove the matching upper bound.

For distinct sites $y_1 \, dots.h \, y_N$ and intercepts $c = \( c_1 \, dots.h \, c_N \)$, set

$ u_c \( x \) = max_i { x dot.op y_i + c_i } \, #h(2em) P_i \( c \) = { x in K : u_c \( x \) = x dot.op y_i + c_i } . $

The cells partition $K$ up to null sets, and $nabla u_c = y_i$ almost everywhere on cell $i$. Write $M_i \( c \) = rho \( P_i \( c \) \)$ and $B_i \( c \) = integral_(P_i \( c \)) x thin d rho \( x \)$ for its mass and first moment. 3 establishes the cell calculus and shows that the intercepts realizing prescribed positive masses depend differentiably on the sites. At a configuration with all $M_i > 0$, fix $q in bb(R)^N$ and let dots denote derivatives along $c + s q$ at $s = 0$, with the sites fixed. The central estimate, proved in 4, is

$ sum_i frac(\| dot(B)_i \|^2, M_i) lt.eq C_0 R^2 sum_i frac(\| dot(M)_i \|^2, M_i) \, #h(2em) K subset B \( 0 \, R \) \, $

with an absolute constant $C_0$. Couple the uniform laws on the cells at $c - s q$ and $c + s q$. Their midpoint law, multiplied by the geometric mean of their masses, can be dominated by the source measure on the cell at $c$. We prove this density bound by Knothe’s triangular rearrangement #cite(label("Knothe1957")); it is also a consequence of displacement concavity #cite(label("McCann1997")) Theorem 2.3. Testing with $R^2 - \| x \|^2$ and summing over the partitions controls displacement by mass changes. This produces the moment estimate with a constant that remains uniform as masses or faces become small.

In 5, we move the sites of two finite targets along an optimal target coupling while keeping the coupling masses fixed. The derivative of the cell-mass constraint is a graph-Laplacian equation, familiar from semi-discrete transport #cite(label("KitagawaMerigotThibert2019")). We test it against an intercept direction whose mass derivative is the weighted intercept velocity. The moment inequality then bounds that velocity directly in its weighted $L^2$ norm. This avoids any quantitative bound on the inverse Laplacian and yields an $L^2 \( rho \)$ potential difference of order $W_2 \( mu \, nu \)$.

Finally, 6 uses coordinate slices to bound the squared gradient difference by a constant times

$ h^(- 2) parallel u_0 - u_1 parallel_(L^2 \( rho \))^2 + h . $

The potential estimate and the choice $h = W_2 \( mu \, nu \)^(2 \/ 3)$ give the one-third exponent. Finite approximation and supporting inequalities then extend the estimate to all Borel targets. The source’s convexity enters through its convex cells and interval slices; no smoothness of its boundary is used.

=== 1.3 Conventions <conventions>

Lebesgue volume is denoted by $\| dot.op \|$, and surface measure on an affine hyperplane by $d S$. All source masses and moments are normalized by $\| K \|$. We choose fixed $R \, L gt.eq 1$ such that $K subset B \( 0 \, R \)$ and $Y subset B \( 0 \, L \)$. A finite maximum of affine functions with slopes in $B \( 0 \, L \)$ is convex and $L$-Lipschitz. Ties between distinct slopes occur on a finite union of hyperplanes and therefore have zero source measure.

== 2 Sharpness on a fixed cube <sec:sharpness>

We first prove that the exponent in 1 cannot be improved. The example uses three affine functions, with a small change in one slope reassigning source points between the central and outer cells. The following observation identifies the resulting gradients as optimal maps. It applies to the general source body $K$ of the introduction.

#thm([Lemma 2.1.])[
  (Optimality of a finite affine maximum).  #emph[Let 
$ u \( x \) = max_(1 lt.eq i lt.eq N) #scale(x: 120%, y: 120%)[\(] x dot.op y_i + c_i #scale(x: 120%, y: 120%)[\)] . $

 For $rho$-almost every $x$, all maximizing indices have the same slope. Define $T \( x \) = y_i$ for the smallest maximizing index $i$, and put $lambda = T_(\#) rho$. Then $T$ is Borel, $T = nabla u$ almost everywhere, and the transport plan $\( upright("id") \, T \)_(\#) rho$ is the unique quadratic-cost optimal plan from $rho$ to $lambda$.]
] <cells:optimality>

#proof[
  The first-index choice is Borel because its level sets are given by finitely many strict and non-strict affine inequalities. Merge repeated slopes, retaining the largest intercept for each slope, and write the resulting intercept as $c \( y \)$. Ties between distinct slopes lie in a finite union of hyperplanes. Outside this null set, the maximizing affine function remains strictly maximal in a neighborhood, so its slope is the gradient of $u$.
  For every transport plan $pi$ from $rho$ to $lambda$, the inequality $x dot.op y + c \( y \) lt.eq u \( x \)$ gives
  $ integral x dot.op y thin d pi \( x \, y \) lt.eq integral_K u thin d rho - integral c \( y \) thin d lambda \( y \) . $
  The graph plan of $T$ attains equality. Since the two marginals fix the integrals of $\| x \|^2$ and $\| y \|^2$, maximizing the displayed scalar product is equivalent to minimizing quadratic cost. Equality for any optimal plan requires it to be concentrated on pairs $\( x \, y \)$ with $x dot.op y + c \( y \) = u \( x \)$. The maximizing slope is unique for $rho$-almost every $x$, so the plan is concentrated on the graph of $T$. This proves uniqueness of the plan. ◻
]

We now specialize to the cube. The two targets below have the same atom masses, but their optimal maps differ on a much larger part of the source than their target displacement alone might suggest.

#thm([Proposition 2.2.])[
  (Optimality of the exponent).  #emph[For every fixed $d gt.eq 2$, let $K = Y = \[ - 1 \, 1 \]^d$ and $rho = 2^(- d) 1_K thin d x$. For every $alpha > 1 \/ 3$, 
$ sup_(mu \, nu in "Prob" \( Y \)\
mu eq.not nu) frac(parallel T_mu - T_nu parallel_(L^2 \( rho \)), W_2 \( mu \, nu \)^alpha) = + oo . $

 The supremum remains infinite when both targets are required to have exactly three atoms.]
] <sharpness:exponent>

#proof[
  For $0 < a < 1 \/ 2$, put $b = a \/ 2$ and define
  #[#set math.equation(numbering: n => "(2.1)")
   $ u_a \( x \) = max { - x_1 \, x_1 \, a } \, #h(2em) tilde(u)_a \( x \) = max { - x_1 \, x_1 \, a + b x_2 } . $ <sharpness:potentials>]
  Let $mu_a = \( nabla u_a \)_(\#) rho$ and $nu_a = \( nabla tilde(u)_a \)_(\#) rho$, with any fixed first-index selection on the null tie sets. Their slopes are, respectively, $- e_1 \, e_1 \, 0$ and $- e_1 \, e_1 \, b e_2$, all in the fixed set $Y$. By 2, these gradients are the unique optimal maps to their laws.
  Since $a \/ 2 lt.eq a + b x_2 lt.eq 3 a \/ 2 < 1$, the central cells are, up to null boundaries,
  $ A_a = { x in K : \| x_1 \| < a } \, #h(2em) B_a = { x in K : \| x_1 \| < a + b x_2 } . $
  Tilting the central strip preserves its mass but changes which points receive a central or an outer slope. 1 shows the symmetric difference where this reassignment occurs.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-1.08, 0), (-1.62, 2.1), (-1.08, 2.1), close: true, fill: rgb("#ccccff"), stroke: none)
  line((1.08, 0), (1.62, 2.1), (1.08, 2.1), close: true, fill: rgb("#ccccff"), stroke: none)
  line((-1.08, 0), (-1.08, -2.1), (-0.54, -2.1), close: true, fill: rgb("#ffd3a6"), stroke: none)
  line((1.08, 0), (1.08, -2.1), (0.54, -2.1), close: true, fill: rgb("#ffd3a6"), stroke: none)
  line((-2.916, 0), (3.024, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3.024, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$x_1$]]], anchor: "west", padding: 0.1176cm)
  line((0, -2.226), (0, 2.436), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0, 2.436), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$x_2$]]], anchor: "south", padding: 0.1176cm)
  rect((-2.7, -2.1), (2.7, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.08, -2.1), (-1.08, 2.1), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((1.08, -2.1), (1.08, 2.1), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((-0.54, -2.1), (-1.62, 2.1), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  line((0.54, -2.1), (1.62, 2.1), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  content((-2.106, 0.525), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$-e_1$]]])])
  content((2.106, 0.525), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$e_1$]]])])
  content((0, 0.882), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$0#h(0.3333em) arrow.r#h(0.3333em) "be"_2$]]])])
  content((-2.7, -2.1), [#text(size: 9pt)[$-1$]], anchor: "north", padding: 0.1176cm)
  content((2.7, -2.1), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  rect((-2.484, -2.898), (-2.16, -2.688), fill: rgb("#ccccff"), stroke: none)
  content((-2.052, -2.793), [#text(size: 9pt)[$B_a without A_a$]], anchor: "west", padding: 0.1176cm)
  rect((0.324, -2.898), (0.648, -2.688), fill: rgb("#ffd3a6"), stroke: none)
  content((0.756, -2.793), [#text(size: 9pt)[$A_a without B_a$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: A source-coordinate section of the cube example, drawn with $a = 2 \/ 5$ and $b = a \/ 2$. Dashed lines bound $A_a$; solid blue lines bound $B_a$. The two shaded sets have equal area, so the central mass stays fixed. On their union, source points switch between central and outer slopes. The labels show map values on the unchanged outer regions and the common central region; they are not target points plotted in the source plane. The remaining coordinates integrate out. ],
  ) <fig:sharpness-cells>
  On $A_a$, the first map is zero; on its complement it is $"sign" \( x_1 \) e_1$. The second map equals $b e_2$ on $B_a$ and $"sign" \( x_1 \) e_1$ on its complement. Under $rho$, the coordinates are independent and uniform on $\[ - 1 \, 1 \]$. On the slice $x_2 = t$, the second central interval has probability $a + b t$, and each outer interval has probability $\( 1 - a - b t \) \/ 2$. Averaging over $t$ gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ mu_a = frac(1 - a, 2) \( delta_(- e_1) + delta_(e_1) \) + a delta_0 \, #h(2em) nu_a = frac(1 - a, 2) \( delta_(- e_1) + delta_(e_1) \) + a delta_(b e_2) . $ <sharpness:targets>]
  Both targets have three distinct atoms of positive mass.
  The coupling that fixes the outer atoms and moves the central atom from $0$ to $b e_2$ has squared cost $a b^2$. Conversely, every point in the support of $mu_a$ has second coordinate zero. Every coupling $pi$ of the two targets therefore satisfies
  $ integral \| y - z \|^2 thin d pi \( y \, z \) gt.eq integral \| y_2 - z_2 \|^2 thin d pi \( y \, z \) = a b^2 . $
  Consequently,
  #[#set math.equation(numbering: n => "(2.3)")
   $ W_2 \( mu_a \, nu_a \)^2 = a b^2 . $ <sharpness:target-distance>]
  The same matching coupling costs $a b$ for $W_1$, while every coupling has cost at least $integral \| y_2 - z_2 \| thin d pi = a b$. Thus
  #[#set math.equation(numbering: n => "(2.4)")
   $ W_1 \( mu_a \, nu_a \) = a b = a^2 / 2 . $ <sharpness:w1-distance>]
  The two central intervals on the slice $x_2 = t$ are nested, and their symmetric difference has conditional probability $b \| t \|$. Thus
  $ rho \( A_a triangle.stroked.t B_a \) = 1 / 2 integral_(- 1)^1 b \| t \| thin d t = b / 2 . $
  The first coordinate of the map difference contributes the indicator of that symmetric difference, and its second coordinate contributes $b^2$ on $B_a$. Orthogonality gives the pointwise identity
  $ \| T_(mu_a) - T_(nu_a) \|^2 = 1_(A_a triangle.stroked.t B_a) + b^2 1_(B_a) quad rho upright("-almost everywhere") . $
  Since $rho \( B_a \) = a$, this proves
  #[#set math.equation(numbering: n => "(2.5)")
   $ parallel T_(mu_a) - T_(nu_a) parallel_(L^2 \( rho \))^2 = b / 2 + a b^2 . $ <sharpness:map-distance>]
  The remaining $d - 2$ coordinates integrate out, so all computations hold in every fixed dimension $d gt.eq 2$.
  Substituting $b = a \/ 2$ into (2.3) and (2.5) gives
  $ W_2 \( mu_a \, nu_a \) = a^(3 \/ 2) / 2 \, #h(2em) parallel T_(mu_a) - T_(nu_a) parallel_(L^2 \( rho \)) = sqrt(a) / 2 sqrt(1 + a^2) . $
  For every $alpha > 1 \/ 3$, their ratio is
  $ frac(parallel T_(mu_a) - T_(nu_a) parallel_(L^2 \( rho \)), W_2 \( mu_a \, nu_a \)^alpha) = 2^(alpha - 1) sqrt(1 + a^2) thin a^(\( 1 - 3 alpha \) \/ 2) arrow.r + oo #h(2em) \( a arrow.b 0 \) . $
  The source, target container, and number of atoms stay fixed, proving the proposition. ◻
]

== 3 Finite affine potentials and prescribed cell masses <sec:cells>

We return to an arbitrary compact convex body $K subset bb(R)^d$ and its uniform probability measure $rho = upright(bold(1))_K thin d x \/ \| K \|$. To compare targets by moving their sites, we need intercepts that keep prescribed cell masses fixed and depend differentiably on the sites. We first compute the derivatives of cell masses and moments, then use them to construct these intercepts.

Assume that the sites $y_1 \, dots.h \, y_N$ are distinct. For intercepts $c = \( c_1 \, dots.h \, c_N \)$, set

$ P_i & = K ∩ ⋂_(j eq.not i) { x : x dot.op \( y_i - y_j \) + c_i - c_j gt.eq 0 } \,\
M_i & = rho \( P_i \) \, & B_i & = integral_(P_i) x thin d rho \( x \) . $

These closed convex cells partition $K$ up to the null tie set. Denote the equality plane and the common face by

$ H_(i j) = { x : x dot.op \( y_i - y_j \) + c_i - c_j = 0 } \, #h(2em) F_(i j) = P_i ∩ P_j . $

All integrals over $F_(i j)$ use the $\( d - 1 \)$-dimensional measure $d S$ of $H_(i j)$, so an empty or lower-dimensional face contributes zero. Define the symmetric coefficients

#[#set math.equation(numbering: n => "(3.1)")
 $ g_(i j) = frac(1, \| K \| thin \| y_i - y_j \|) integral_(F_(i j)) 1 thin d S \, #h(2em) b_(i j) = frac(1, \| K \| thin \| y_i - y_j \|) integral_(F_(i j)) x thin d S . $ <cells:face-coefficients>]

These cells are often called Laguerre cells. Their fixed-site mass derivative has the standard face-integral and weighted graph-Laplacian form #cite(label("KitagawaMerigotThibert2019")) Theorem 1.3 and Section 5.3. We include the calculation for the joint site and moment variations needed here.

#thm([Proposition 3.1.])[
  (Cell differentials and connectivity).  #emph[On the open set of configurations with distinct sites and $M_i > 0$ for every $i$, the maps $M_i$ and $B_i$ are jointly $C^1$ in the intercepts and sites. For an intercept direction $r = \( r_i \)$ and a site direction $v = \( v_i \)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ D M_i \[ r \, v \] & = sum_(j eq.not i) #scale(x: 120%, y: 120%)[\[] g_(i j) \( r_i - r_j \) + b_(i j) dot.op \( v_i - v_j \) #scale(x: 120%, y: 120%)[\]] \,\
D B_i \[ r \, v \] & = sum_(j eq.not i) b_(i j) \( r_i - r_j \) + frac(1, \| K \|) sum_(j eq.not i) frac(1, \| y_i - y_j \|) integral_(F_(i j)) x #scale(x: 120%, y: 120%)[\(] x dot.op \( v_i - v_j \) #scale(x: 120%, y: 120%)[\)] thin d S \( x \) . $ <cells:mass-differential>]

 The graph on ${ 1 \, dots.h \, N }$ with edges $g_(i j) > 0$ is connected. Consequently, the symmetric operator 
#[#set math.equation(numbering: n => "(3.3)")
 $ \( G q \)_i = D M_i \[ q \, 0 \] = sum_(j eq.not i) g_(i j) \( q_i - q_j \) $ <cells:laplacian>]

 has kernel consisting of the constant vectors and range ${ z in bb(R)^N : sum_i z_i = 0 }$.]
] <cells:calculus>

#proof[
  We first record the geometric facts that permit differentiation for an arbitrary convex body. The boundary of a full-dimensional compact convex set has zero volume: contractions toward an interior point lie in the interior and their volumes tend to the full volume. The same argument applies within an affine subspace. Moreover, if a hyperplane $H$ meets $"int" K$, then
  $ "relint" \( K ∩ H \) = "int" K ∩ H . $
  Indeed, choose $p in "int" K ∩ H$. A relative interior point $z eq.not p$ of the section lies strictly between $p$ and a point of the section beyond $z$. A strict convex combination with the ambient interior point $p$ lies in $"int" K$. The reverse inclusion is immediate. It follows that $partial K ∩ H$ has zero $\( d - 1 \)$-dimensional measure.
  Since $M_i > 0$, cell $i$ contains an interior point of $K$ at which its affine function is strictly maximal: remove the boundary of $K$ and the finite union of tie planes from the positive-volume cell. Strictly active points for $i$ and $j$ give opposite signs of their affine difference, so $H_(i j)$ meets $"int" K$. Also, $H_(i j)$ and $H_(i k)$ cannot coincide for three distinct indices. Coincidence would make their affine differences proportional. The three affine functions would then lie on one affine line, with one a strict convex combination of the other two; that function could never be strictly maximal. Hence the intersections $H_(i j) ∩ H_(i k)$ are empty or have dimension at most $d - 2$.
  We next prove the differential formulas. For a continuous function $f : bb(R)^d arrow.r bb(R)$, write
  $ I_i^f = frac(1, \| K \|) integral_K f \( x \) product_(j eq.not i) upright(bold(1))_({ ell_(i j) \( x \) gt.eq 0 }) thin d x \, #h(2em) ell_(i j) \( x \) = x dot.op \( y_i - y_j \) + c_i - c_j . $
  Only $f = 1$ and $f \( x \) = x_k$ will be needed. Perturb $\( c \, y \)$ by $h \( r \, v \)$, with $h arrow.b 0$, and telescope the difference of the products of indicators one factor at a time. On bounded $K$, the term in which the $j$-th factor changes is supported in $\| ell_(i j) \( x \) \| lt.eq C h$, with $C$ fixed for the configuration and direction. Put $n_(i j) = \( y_i - y_j \) \/ \| y_i - y_j \|$ and use coordinates
  $ x = z + h t n_(i j) \, #h(2em) z in H_(i j) . $
  Both $z$ and $t$ can be restricted to fixed bounded sets. The factor $h$ in the volume element cancels the difference quotient. Outside
  $ \( partial K ∩ H_(i j) \) med union #h(-0.16667em) union.big_(k eq.not i \, j) \( H_(i k) ∩ H_(i j) \) \, $
  a surface-null set by the preceding geometric observations, all remaining indicators converge to their values at $z$. The changed factor converges for almost every $\( z \, t \)$ to
  $ upright(bold(1))_({ \| y_i - y_j \| t + r_i - r_j + z dot.op \( v_i - v_j \) gt.eq 0 }) - upright(bold(1))_({ t gt.eq 0 }) . $
  Its integral in $t$ is $\( r_i - r_j + z dot.op \( v_i - v_j \) \) \/ \| y_i - y_j \|$. Dominated convergence therefore gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ D I_i^f \[ r \, v \] = frac(1, \| K \|) sum_(j eq.not i) frac(1, \| y_i - y_j \|) integral_(F_(i j)) f \( z \) #scale(x: 120%, y: 120%)[\(] r_i - r_j + z dot.op \( v_i - v_j \) #scale(x: 120%, y: 120%)[\)] thin d S \( z \) . $ <cells:general-differential>]
  Applying the same argument in the opposite direction supplies the two-sided derivative. Taking $f = 1 \, x_1 \, dots.h \, x_d$ gives (3.2) and (3.2).
  For completeness, these derivatives are continuous under joint changes of sites and intercepts. Identify a nearby equality plane with the fixed $H_(i j)$ as an affine graph in the normal direction $n_(i j)$. The graph maps and their surface Jacobians converge uniformly on a common bounded integration region. The face-defining indicators converge outside the same surface-null sets used above. The remaining integrands and the positive denominators $\| y_i - y_j \|$ converge as well. Dominated convergence proves continuity of each coefficient of the differential, including those containing $z_k z_l$. Thus all coordinate partial derivatives exist and are continuous, which yields joint $C^1$ regularity. The admissible parameter set is open: the masses themselves are continuous by dominated convergence away from the original tie hyperplanes.
  To prove connectivity, fix strictly active interior points in any two cells. They may be chosen so that the first point $p$ avoids all equality planes and the second point $q$ avoids all equality planes and the affine spans of $p$ with every triple equality set. These are finitely many proper affine subsets, so they cannot cover a strictly active open region. The segment $\[ p \, q \]$ lies in $"int" K$ and meets no triple equality set. At any change of active index along it, precisely two affine functions are maximal. The other inequalities are strict, so a small relatively open disk in their equality plane belongs to the common face. That face has positive area and gives an edge of the graph. The successive active indices therefore give a graph path between the chosen cells.
  Finally, symmetry of the face coefficients gives
  $ q dot.op G q = sum_(i < j) g_(i j) \( q_i - q_j \)^2 . $
  Connectivity identifies the kernel as the constant vectors. Symmetry then identifies the range as their orthogonal complement, as claimed. ◻
]

#thm([Proposition 3.2.])[
  (Prescribed cell masses).  #emph[Fix positive weights $m_1 \, dots.h \, m_N$ with $sum_i m_i = 1$. For every configuration of distinct sites, there is a unique vector of intercepts $c$ satisfying 
#[#set math.equation(numbering: n => "(3.5)")
 $ M_i = m_i quad \( 1 lt.eq i lt.eq N \) \, #h(2em) sum_i m_i c_i = 0 . $ <cells:prescribed-masses>]

 With the weights fixed, this normalized vector is a $C^1$ function of the sites on the open set of distinct-site configurations.]
] <cells:weights>

#proof[
  The case $N = 1$ has $c_1 = 0$, so assume $N gt.eq 2$. On the normalization space $H_m = { c in bb(R)^N : sum_i m_i c_i = 0 }$, minimize the convex function
  $ cal(F)_y \( c \) = integral_K max_i \( x dot.op y_i + c_i \) thin d rho \( x \) - sum_i m_i c_i . $
  Choose $R$ with $\| x \| lt.eq R$ on $K$, and set $S = max_i \| y_i \|$. On $H_m$,
  $ cal(F)_y \( c \) gt.eq max_i c_i - R S . $
  Positivity of all the weights implies that $max_i c_i$ tends to infinity as $\| c \| arrow.r oo$ within $H_m$: an upper bound on all coordinates and the weighted mean-zero identity also bound every coordinate below. Hence $cal(F)_y$ is coercive on $H_m$ and attains its minimum.
  Distinct sites give an almost-everywhere unique maximizing index for every $c$. Differentiation of the maximum under the integral, justified by bounded difference quotients, shows
  $ nabla_c cal(F)_y = \( M_i - m_i \)_(i = 1)^N . $
  At a minimum on $H_m$, this gradient lies in $"span" { m }$. Its coordinate sum is zero because the masses and weights each sum to one. Since $sum_i m_i = 1$, the gradient must vanish. Thus a normalized solution of (3.5) exists. Conversely, every such solution is a minimizer by convexity.
  At any solution all cells have positive mass, so 4 applies. The intercept derivative of the mass residual is the restriction
  $ G : H_m arrow.r H_0 \, #h(2em) H_0 = { z in bb(R)^N : sum_i z_i = 0 } . $
  It is an isomorphism: both spaces have dimension $N - 1$, and the only constant vector in $H_m$ is zero. The finite-dimensional implicit function theorem therefore gives a locally unique $C^1$ solution as the sites vary. In particular, each solution is locally isolated for its fixed sites. If two normalized solutions existed, their segment would consist of minimizers of the convex objective, contradicting this local isolation. Global uniqueness follows, and the local $C^1$ solution branches agree wherever they overlap. This proves the claimed $C^1$ dependence on the sites. Only the invertibility of the restricted Laplacian is used here; no quantitative bound on its inverse is needed. ◻
]

== 4 A uniform estimate for cell moments <sec:moments>

We compare changes in the first moments and masses of cells when their intercepts vary and their sites remain fixed. The estimate is uniform over all configurations with positive cell masses.

#thm([Lemma 4.1.])[
  (Stationary-site moment estimate).  #emph[Fix distinct sites $y_1 \, dots.h \, y_N$ and intercepts $c_1 \, dots.h \, c_N$ whose cells have positive masses $M_i$. If $K subset { x : \| x \| lt.eq R }$, then every intercept direction $q in bb(R)^N$ satisfies 
$ sum_(i = 1)^N frac(\| D B_i \[ q \, 0 \] \|^2, M_i) lt.eq C_0 R^2 sum_(i = 1)^N frac(\| D M_i \[ q \, 0 \] \|^2, M_i) \, #h(2em) C_0 = 162 . $

]
] <moments:derivative>

The proof couples uniform laws on two opposite perturbations of each cell. Their midpoint lies in the original cell; the following lemma controls its density.

#thm([Lemma 4.2.])[
  (Midpoint coupling).  #emph[Let $U \, V subset bb(R)^d$ be compact convex sets of positive volume. There is a coupling $\( X \, Z \)$ of the uniform probability measures on $U$ and $V$ such that 
$ "Law" #h(-0.16667em) (frac(X + Z, 2)) lt.eq frac(d x, sqrt(\| U \| \| V \|)) . $

 The inequality is an inequality of measures on $bb(R)^d$.]
] <moments:midpoint>

This density bound also follows from McCann’s displacement-concavity inequality #cite(label("McCann1997")) Theorem 2.3. We give a direct proof by the conditional-quantile construction underlying Knothe’s triangular rearrangement #cite(label("Knothe1957")) #cite(label("CarlierGalichonSantambrogio2010")). The subsequent application to cell moments is developed here.

#proof[
  We parameterize the two uniform laws by successive one-dimensional quantiles on the same cube. Their diagonal derivatives have constant products. Averaging the two maps and substituting coordinates successively will give the density bound.
  We need the boundary observation from the proof of 4 for arbitrary positive-dimensional affine slices, not only hyperplanes. The same segment-extension argument shows that a relative interior point of a slice of $U$ meeting $"int" U$ is an ambient interior point: unless it equals a chosen ambient interior point in the slice, it lies strictly between that point and a farther point of the section. The contraction argument for convex boundaries, applied within the slice, then shows that its intersection with $partial U$ has zero slice volume.
  For $0 lt.eq k < d$, let
  $ p_k \( xi \) = integral_(bb(R)^(d - k)) 1_("int" U) \( xi \, eta \) thin d eta \, #h(2em) p_d = 1_("int" U) . $
  Thus $p_0 = \| U \|$. Write $D_k$ for the projection of $"int" U$ onto its first $k$ coordinates. Each $p_k$ is positive and continuous on $D_k$. For $k < d$, continuity follows by dominated convergence: at a prefix in $D_k$, the preceding boundary property makes the indicators of the fibers converge almost everywhere as the prefix varies, and boundedness of $U$ provides a common integrable bound. For $k = d$ the assertion is immediate. The fiber integrals are Borel functions on their full domains.
  Given $s = \( s_1 \, dots.h \, s_d \) in \( 0 \, 1 \)^d$, construct $X \( s \)$ recursively. For a previously constructed prefix $xi = \( X_1 \, dots.h \, X_(k - 1) \) in D_(k - 1)$, let $X_k$ be the quantile at level $s_k$ of the density
  $ t mapsto frac(p_k \( xi \, t \), p_(k - 1) \( xi \)) . $
  Fubini’s theorem shows that this density integrates to one. It is positive and continuous on the bounded open interval ${ t : \( xi \, t \) in D_k }$, and vanishes outside that interval. Its cumulative distribution function is therefore strictly increasing from zero to one there. This defines the quantile uniquely, keeps the new prefix in $D_k$, and gives
  $ partial_(s_k) X_k = frac(p_(k - 1) \( X_1 \, dots.h \, X_(k - 1) \), p_k \( X_1 \, dots.h \, X_k \)) > 0 . $
  For each fixed earlier parameter prefix, $X_k$ is $C^1$ in $s_k$. The conditional cumulative distribution functions are Borel in their arguments, so comparison at rational points shows that their quantiles are Borel. Thus the whole construction is measurable. With $s$ uniform on the cube, successive conditioning gives the uniform law on $U$. The diagonal derivatives telescope to
  $ product_(k = 1)^d partial_(s_k) X_k = \| U \| . $
  Construct $Z \( s \)$ in the same way for $V$, using the same parameters. For $H = \( X + Z \) \/ 2$, the arithmetic–geometric mean inequality yields
  $ product_(k = 1)^d partial_(s_k) H_k gt.eq sqrt((product_(k = 1)^d partial_(s_k) X_k) (product_(k = 1)^d partial_(s_k) Z_k)) = sqrt(\| U \| \| V \|) . $
  We justify substitution using only the stated regularity in each coordinate. For a nonnegative Borel function $g$ on $bb(R)^d$, fix $a = \( s_1 \, dots.h \, s_(d - 1) \)$. One-dimensional substitution in the strictly increasing $C^1$ function $s_d mapsto H_d \( a \, s_d \)$, followed by enlargement of its image interval to $bb(R)$, gives
  $ integral_0^1 g #scale(x: 120%, y: 120%)[\(] H_1 \( a \) \, dots.h \, H_(d - 1) \( a \) \, H_d \( a \, t \) #scale(x: 120%, y: 120%)[\)] partial_(s_d) H_d \( a \, t \) thin d t lt.eq integral_(bb(R)) g #scale(x: 120%, y: 120%)[\(] H_1 \( a \) \, dots.h \, H_(d - 1) \( a \) \, z #scale(x: 120%, y: 120%)[\)] thin d z . $
  Here each $H_k \( a \)$ uses only the first $k$ entries of $a$. The integral of $g$ in its last variable is again a nonnegative Borel function. The earlier derivative factors depend only on earlier parameters. Tonelli’s theorem therefore permits multiplication by their product and integration in $a$. Repeating this argument backwards gives
  $ integral_(\( 0 \, 1 \)^d) g \( H \( s \) \) product_(k = 1)^d partial_(s_k) H_k \( s \) thin d s lt.eq integral_(bb(R)^d) g \( x \) thin d x . $
  All derivative factors are Borel, as also follows from their explicit formulas above. No differentiability in earlier parameters or boundedness of the derivatives near the boundary of the cube is required. Combining the last two inequalities proves
  $ bb(E) g #h(-0.16667em) (frac(X + Z, 2)) lt.eq 1 / sqrt(\| U \| \| V \|) integral_(bb(R)^d) g \( x \) thin d x \, $
  which is the asserted measure domination. ◻
]

#proof[
  Fix the intercept direction $q$ and hold the sites fixed. For sufficiently small $s > 0$, let $P_i^(-)$ and $P_i^(+)$ be the cells at $c - s q$ and $c + s q$, respectively, and write
  $ alpha_i = rho \( P_i^(-) \) \, #h(2em) beta_i = rho \( P_i^(+) \) \, #h(2em) gamma_i = sqrt(alpha_i beta_i) . $
  These masses are positive by continuity from 4. The perturbed cells are compact convex sets of positive volume. Couple their uniform probability measures by 7, writing $X_i in P_i^(-)$, $Z_i in P_i^(+)$, and $D_i = bb(E) \| X_i - Z_i \|^2$. For each competing index $j$, the defining inequalities give
  $ X_i dot.op \( y_i - y_j \) + c_i - c_j - s \( q_i - q_j \) & gt.eq 0 \,\
Z_i dot.op \( y_i - y_j \) + c_i - c_j + s \( q_i - q_j \) & gt.eq 0 . $
  Averaging shows that $\( X_i + Z_i \) \/ 2$ satisfies the $i$-cell inequalities at $c$; convexity also places it in $K$. Its law is supported on $P_i$. Since $\| P_i^(-) \| = \| K \| alpha_i$ and $\| P_i^(+) \| = \| K \| beta_i$, the midpoint bound has exactly the normalization
  $ gamma_i "Law" #h(-0.16667em) (frac(X_i + Z_i, 2)) lt.eq frac(1_(P_i) thin d x, \| K \|) = rho \|_(P_i) . $
  Use the nonnegative function $Phi \( x \) = R^2 - \| x \|^2$ on $K$, and set $A_i^(-) = bb(E) Phi \( X_i \)$ and $A_i^(+) = bb(E) Phi \( Z_i \)$. The identity
  $ Phi #h(-0.16667em) (frac(X_i + Z_i, 2)) = frac(Phi \( X_i \) + Phi \( Z_i \), 2) + frac(\| X_i - Z_i \|^2, 4) $
  and the cellwise measure domination imply
  $ sum_i gamma_i (frac(A_i^(-) + A_i^(+), 2) + D_i / 4) lt.eq integral_K Phi thin d rho = 1 / 2 sum_i \( alpha_i A_i^(-) + beta_i A_i^(+) \) . $
  The last equality uses the partitions at the two perturbed intercepts; all three partitions have null overlaps because the sites are distinct.
  Put $delta_i = alpha_i - beta_i$ and
  $ cal(A) = sum_i gamma_i D_i \, #h(2em) cal(B) = sum_i delta_i^2 / gamma_i . $
  Subtracting the averaged endpoint terms in the preceding inequality gives
  $ cal(A) / 4 lt.eq sum_i [(frac(alpha_i + beta_i, 2) - gamma_i) frac(A_i^(-) + A_i^(+), 2) + delta_i / 4 \( A_i^(-) - A_i^(+) \)] . $
  Here $0 lt.eq A_i^plus.minus lt.eq R^2$, and
  $ frac(alpha_i + beta_i, 2) - gamma_i = frac(delta_i^2, 2 \( sqrt(alpha_i) + sqrt(beta_i) \)^2) lt.eq frac(delta_i^2, 8 gamma_i) . $
  Moreover, since $\| X_i \| \, \| Z_i \| lt.eq R$,
  $ \| A_i^(-) - A_i^(+) \| lt.eq 2 R bb(E) \| X_i - Z_i \| lt.eq 2 R sqrt(D_i) . $
  Cauchy–Schwarz therefore yields
  $ cal(A) / 4 lt.eq frac(R^2 cal(B), 8) + R / 2 sqrt(cal(A) cal(B)) . $
  Using $R / 2 sqrt(cal(A) cal(B)) lt.eq cal(A) \/ 8 + R^2 cal(B) \/ 2$ and rearranging, we obtain
  $ cal(A) lt.eq 5 R^2 cal(B) . $
  This argument includes the cases where either quantity vanishes.
  The cell-moment difference is
  $ Delta B_i := B_i \( c - s q \) - B_i \( c + s q \) = alpha_i bb(E) X_i - beta_i bb(E) Z_i \, $
  where the notation suppresses the fixed sites. Consequently,
  $ \| Delta B_i \| lt.eq R \| delta_i \| + alpha_i sqrt(D_i) . $
  For this fixed finite configuration and fixed direction $q$, continuity allows $s$ to be chosen small enough that every $alpha_i \, beta_i \, gamma_i$ lies between $M_i \/ 2$ and $2 M_i$. Set $cal(E) = sum_i delta_i^2 \/ M_i$. These comparisons give $alpha_i^2 \/ M_i lt.eq 8 gamma_i$ and $cal(B) lt.eq 2 cal(E)$. It follows that
  $ sum_i frac(\| Delta B_i \|^2, M_i) & lt.eq 2 R^2 cal(E) + 2 sum_i alpha_i^2 / M_i D_i\
 & lt.eq 2 R^2 cal(E) + 16 cal(A)\
 & lt.eq 162 R^2 cal(E) . $
  Divide by $\( 2 s \)^2$ and let $s$ decrease to zero. By 4, $Delta B_i \/ \( 2 s \) arrow.r - D B_i \[ q \, 0 \]$ and $delta_i \/ \( 2 s \) arrow.r - D M_i \[ q \, 0 \]$, which proves the claim.
  The permitted threshold for $s$ may depend on the direction and the finite configuration, including its smallest mass. Only the uniform constant $162$ remains after taking the derivative limit. Thus the estimate has no dependence on the number of cells, their masses, or the separation of the sites. ◻
]

== 5 Moving sites with fixed masses <sec:finite-stability>

We now use the moment estimate to control transport potentials along an optimal coupling of two finite targets. Intermediate sites need only remain in the enclosing ball $B \( 0 \, L \)$; they need not belong to $Y$.

#thm([Proposition 5.1.])[
  #emph[Let $mu \, nu$ be finitely supported probabilities in $B \( 0 \, L \)$. There are convex $L$-Lipschitz finite maxima $u_0 \, u_1$ of affine functions such that 
$ nabla u_0 = T_mu \, #h(2em) nabla u_1 = T_nu quad rho upright("-almost everywhere") \, $

 and 
#[#set math.equation(numbering: n => "(5.1)")
 $ parallel u_0 - u_1 parallel_(L^2 \( rho \)) lt.eq \( 1 + sqrt(C_0) \) R thin W_2 \( mu \, nu \) \, #h(2em) C_0 = 162 . $ <eq:finite-potential-bound>]

]
] <finite:potentials>

#proof[
  Choose an optimal finite coupling of the targets. After deleting zero weights and combining identical pairs, write it as
  $ pi = sum_(i = 1)^N m_i delta_(\( y_i^0 \, y_i^1 \)) \, #h(2em) m_i > 0 \, quad sum_i m_i = 1 . $
  Finite-dimensional compactness gives existence of such a coupling. Set
  $ v_i = y_i^1 - y_i^0 \, #h(2em) y_i \( t \) = \( 1 - t \) y_i^0 + t y_i^1 \, #h(2em) w = W_2 \( mu \, nu \) . $
  Then
  #[#set math.equation(numbering: n => "(5.2)")
   $ sum_i m_i \| v_i \|^2 = w^2 . $ <eq:finite-coupling-speed>]
  Optimality implies
  #[#set math.equation(numbering: n => "(5.3)")
   $ \( y_i^0 - y_j^0 \) dot.op \( y_i^1 - y_j^1 \) gt.eq 0 . $ <eq:finite-monotonicity>]
  Indeed, a negative scalar product would permit swapping equal positive portions of the masses at these two coupling pairs, decreasing their quadratic cost. For $a = y_i^0 - y_j^0$ and $b = y_i^1 - y_j^1$,
  $ \| y_i \( t \) - y_j \( t \) \|^2 = \( 1 - t \)^2 \| a \|^2 + t^2 \| b \|^2 + 2 t \( 1 - t \) a dot.op b > 0 #h(2em) \( 0 < t < 1 \) . $
  The last inequality holds because the endpoint pairs are distinct. Thus the sites are distinct at every interior time, even if some endpoint sites coincide.
  By 5, for $0 < t < 1$ there are unique intercepts $c_i \( t \)$, normalized by
  $ sum_i m_i c_i \( t \) = 0 \, $
  whose cells have masses $M_i \( t \) = m_i$. These intercepts are $C^1$ in $t$. Let $r_i = c'_i \( t \)$. In particular,
  #[#set math.equation(numbering: n => "(5.4)")
   $ sum_i m_i r_i = 0 . $ <eq:finite-zero-mean>]
  All derivatives in the next calculation are taken at this fixed interior configuration.
  Differentiate the fixed-mass constraints using 4. For every intercept direction $q$, symmetry of the mass and moment face coefficients gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_i r_i thin D M_i \[ q \, 0 \] = - sum_i v_i dot.op D B_i \[ q \, 0 \] . $ <eq:finite-duality>]
  To see the symmetry directly, the mass part of $sum_i q_i D M_i \[ r \, v \]$ is $sum_(i < j) g_(i j) \( q_i - q_j \) \( r_i - r_j \)$. Its site part is $sum_(i < j) \( q_i - q_j \) b_(i j) dot.op \( v_i - v_j \)$, which equals $sum_i v_i dot.op D B_i \[ q \, 0 \]$.
  The range statement in 4, together with (5.4), permits a choice of $q$ satisfying
  $ D M_i \[ q \, 0 \] = m_i r_i #h(2em) \( 1 lt.eq i lt.eq N \) . $
  No bound on this $q$ is needed. Put $E_r = sum_i m_i r_i^2$. Using (5.5), weighted Cauchy–Schwarz, (5.2), and 6, we obtain
  $ E_r & lt.eq (sum_i m_i \| v_i \|^2)^(1 \/ 2) (sum_i frac(\| D B_i \[ q \, 0 \] \|^2, m_i))^(1 \/ 2)\
 & lt.eq sqrt(C_0) R w (sum_i frac(\| m_i r_i \|^2, m_i))^(1 \/ 2) = sqrt(C_0) R w sqrt(E_r) . $
  Consequently
  #[#set math.equation(numbering: n => "(5.6)")
   $ (sum_i m_i \| r_i \|^2)^(1 \/ 2) lt.eq sqrt(C_0) R w . $ <eq:finite-intercept-speed>]
  This includes $E_r = 0$. If $N = 1$, the normalization gives $r_1 = 0$, and the same conclusion is immediate.
  Define
  $ u_t \( x \) = max_i { x dot.op y_i \( t \) + c_i \( t \) } . $
  On compact time intervals inside $\( 0 \, 1 \)$, this function is uniformly Lipschitz in time for $x in K$. At a strict maximum its time derivative is $x dot.op v_i + r_i$. For each fixed time, the exceptional tie set has zero source measure. Fubini therefore identifies this derivative for almost every $\( t \, x \)$. Since its active cells have masses $m_i$,
  $ parallel partial_t u_t parallel_(L^2 \( rho \)) lt.eq R (sum_i m_i \| v_i \|^2)^(1 \/ 2) + (sum_i m_i \| r_i \|^2)^(1 \/ 2) lt.eq \( 1 + sqrt(C_0) \) R w . $
  The fundamental theorem of calculus and Minkowski’s inequality imply
  #[#set math.equation(numbering: n => "(5.7)")
   $ parallel u_t - u_(t') parallel_(L^2 \( rho \)) lt.eq \( 1 + sqrt(C_0) \) R w thin \| t - t' \| #h(2em) \( 0 < t \, t' < 1 \) . $ <eq:finite-time-bound>]
  It remains to justify the endpoint maps without imposing separation of their sites. For each fixed $i$, (5.6) gives
  $ \| c'_i \( t \) \| lt.eq frac(sqrt(C_0) R w, sqrt(m_i)) . $
  Hence $c_i \( t \)$ has finite limits at $0$ and $1$. This individual estimate is used only for endpoint existence; its mass dependence does not enter (5.7). The finite maxima converge uniformly on $K$ to their endpoint maxima $u_0 \, u_1$, so that inequality extends to the endpoints.
  At either endpoint, merge repeated slopes by retaining their largest intercept. Outside a finite union of hyperplanes there is a unique maximizing slope. For any such $x$, all maximizing slopes at approaching interior times converge to this endpoint slope. Otherwise a subsequence with a fixed maximizing index would contradict the strict gap at the endpoint. The interior slope law is $sum_i m_i delta_(y_i \( t \))$, and all slopes are bounded by $L$. Bounded convergence against continuous tests shows that the endpoint slope laws are $mu$ and $nu$. By 2, these slopes are the unique optimal maps to their laws. Taking $t = 0 \, t' = 1$ in (5.7) proves the proposition. ◻
]

#prodef([Remark 5.2.])[
  (The potential estimate on the cube example).  Return to $K = Y = \[ - 1 \, 1 \]^d$ and the potentials $u_a \, tilde(u)_a$ in (2.1), where $0 < a < 1 \/ 2$ and $b = a \/ 2$. Both potentials have weighted intercept mean $a^2$, so subtracting $a^2$ realizes the normalization in 8 without changing their difference. The intermediate maximum $max { - x_1 \, x_1 \, a + s b x_2 }$ has the same three cell masses for every $s in \[ 0 \, 1 \]$, so the same constant normalizes the entire path.
  For an exact calculation, put $f = tilde(u)_a - u_a$ and $q = b \| t \|$. Integrating its square over the $x_1$ slice gives
  $ bb(E) \[ f^2 divides x_2 = t \] = cases(delim: "{", a q^2 + q^3 \/ 3 \, & t gt.eq 0 \,, a q^2 - 2 q^3 \/ 3 \, & t < 0 .) $
  For $t gt.eq 0$, this is the contribution $a q^2$ of the old central interval plus the integral of the squared linear ramp on the added portion. For $t < 0$, the overlap contributes $\( a - q \) q^2$ and the removed portion contributes $q^3 \/ 3$. Averaging over $t$ yields
  $ parallel u_a - tilde(u)_a parallel_(L^2 \( rho \))^2 = frac(a b^2, 3) - b^3 / 24 = frac(5 a^3, 64) = 5 / 16 W_2 \( mu_a \, nu_a \)^2 . $
  Thus the normalized potential distance is proportional to $W_2$, whereas (2.5) has map distance of order $W_2^(1 \/ 3)$. The next section recovers this exponent from a general interpolation inequality for convex gradients.
]

== 6 From potentials to maps <sec:gradient>

We first recover gradient control from the potential estimate. The argument is a coordinate-slice version of the convex-function interpolation inequality of Delalande and Mérigot #cite(label("DelalandeMerigot2023")) Proposition 4.1. Their inequality already applies to every convex body considered here. We give a coordinate proof with explicit constants, using only convexity and the volumes of coordinate projections.

#thm([Lemma 6.1.])[
  (Gradient interpolation).  #emph[Let $u_0 \, u_1$ be convex, $L$-Lipschitz functions on $K$, and put $f = u_0 - u_1$. For the coordinate vectors $e_j$, set 
$ A_j = \| "proj"_(e_j^perp) K #scale(x: 120%, y: 120%)[\|]_(d - 1) \, #h(2em) P_K = sum_(j = 1)^d A_j . $

 For every $h > 0$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ parallel nabla u_0 - nabla u_1 parallel_(L^2 \( rho \))^2 lt.eq frac(12 d, h^2) parallel f parallel_(L^2 \( rho \))^2 + frac(28 L^2 P_K, \| K \|) h . $ <gradient:slice-bound>]

 Only the almost everywhere coordinate derivatives are needed in this inequality.]
] <gradient:interpolation>

#proof[
  Fix $j$ and write
  $ K_(j \, h) = { x in K : x + h e_j in K } \, #h(2em) D_(j \, h) u \( x \) = frac(u \( x + h e_j \) - u \( x \), h) quad \( x in K_(j \, h) \) . $
  Almost every nonempty coordinate slice of $K$ is an interval $\[ alpha \, beta \]$ on which the restriction of each $u_i$ is convex and $L$-Lipschitz. Its derivative exists almost everywhere, is monotone, and has absolute value at most $L$. Fubini therefore gives all coordinate derivatives almost everywhere in $K$. For either function $u$, convexity gives, at points where both derivatives exist,
  $ 0 lt.eq delta_u \( x \) := D_(j \, h) u \( x \) - partial_j u \( x \) lt.eq partial_j u \( x + h e_j \) - partial_j u \( x \) lt.eq 2 L . $
  If $beta - alpha gt.eq h$, cancellation of translated integrals gives
  $ & integral_alpha^(beta - h) #scale(x: 120%, y: 120%)[\(] partial_j u \( t + h \) - partial_j u \( t \) #scale(x: 120%, y: 120%)[\)] thin d t\
 & #h(15mm)  = integral_(beta - h)^beta partial_j u \( t \) thin d t - integral_alpha^(alpha + h) partial_j u \( t \) thin d t lt.eq 2 L h . $
  The coordinates transverse to the slice have been suppressed here. If the slice length is less than $h$, its allowed portion is empty. Thus, in all cases, integrating $delta_u^2 lt.eq 2 L delta_u$ over slices and then over the orthogonal projection yields
  #[#set math.equation(numbering: n => "(6.2)")
   $ integral_(K_(j \, h)) delta_u^2 thin d rho lt.eq frac(4 L^2 h A_j, \| K \|) . $ <gradient:quotient-error>]
  The excluded portion of any slice has length at most $h$, so
  $ rho \( K \\ K_(j \, h) \) lt.eq frac(h A_j, \| K \|) . $
  There we use $\| partial_j f \| lt.eq 2 L$.
  On the allowed set, both $x$ and $x + h e_j$ belong to $K$. Translation invariance of Lebesgue measure and $\( a - b \)^2 lt.eq 2 a^2 + 2 b^2$ give
  $ integral_(K_(j \, h)) \| D_(j \, h) f \|^2 thin d rho lt.eq 4 / h^2 parallel f parallel_(L^2 \( rho \))^2 . $
  Since $partial_j f = D_(j \, h) f - delta_(u_0) + delta_(u_1)$, the inequality $\( a + b + c \)^2 lt.eq 3 \( a^2 + b^2 + c^2 \)$ and (6.2) imply
  $ integral_K \| partial_j f \|^2 thin d rho lt.eq 12 / h^2 parallel f parallel_(L^2 \( rho \))^2 + frac(\( 24 + 4 \) L^2 h A_j, \| K \|) . $
  Summing over $j$ proves (6.1). All projection measures are finite because $K$ is compact. The slice argument applies to every $h > 0$, including values larger than some or all slice lengths.
  The coordinate derivatives form the full gradient almost everywhere. Indeed, at an interior point $x$ where all partials of a convex function $u$ exist, set $p_j = partial_j u \( x \)$ and $q = parallel v parallel_1$ for a small nonzero vector $v$. The point $x + v$ is the convex combination of $x + "sign" \( v_j \) q e_j$ with weights $\| v_j \| \/ q$, omitting zero weights. The finitely many coordinate derivative limits and convexity give $u \( x + v \) - u \( x \) lt.eq p dot.op v + o \( q \)$. Apply this bound to $- v$ and use midpoint convexity to obtain the reverse bound. Since $q lt.eq sqrt(d) thin \| v \|$, the function is differentiable at $x$ with gradient $p$. The boundary of $K$ has zero volume, as proved in 4, so this applies almost everywhere to both $u_i$. ◻
]

#thm([Corollary 6.2.])[
  (Finite target stability).  #emph[Set $C_0 = 162$ and 
#[#set math.equation(numbering: n => "(6.3)")
 $ C_(*) = (12 d R^2 \( 1 + sqrt(C_0) \)^2 + frac(28 L^2 P_K, \| K \|))^(1 \/ 2) . $ <gradient:constant>]

 For any two finitely supported probabilities $mu \, nu$ on $Y$, 
$ parallel T_mu - T_nu parallel_(L^2 \( rho \)) lt.eq C_(*) W_2 \( mu \, nu \)^(1 \/ 3) . $

]
] <gradient:finite>

#proof[
  Write $w = W_2 \( mu \, nu \)$. By 8, the maps have convex, $L$-Lipschitz maximum potentials $u_0 \, u_1$ satisfying
  $ parallel u_0 - u_1 parallel_(L^2 \( rho \)) lt.eq \( 1 + sqrt(C_0) \) R w . $
  If $w > 0$, apply 10 with $h = w^(2 \/ 3)$. The resulting bound on the squared map norm is $C_(*)^2 w^(2 \/ 3)$. Taking its square root proves the claim. If $w = 0$, the potential difference has zero $L^2 \( rho \)$ norm, and sending $h$ to zero in (6.1) gives the same conclusion. ◻
]

#thm([Proposition 6.3.])[
  (Approximation and optimal maps).  #emph[For every $lambda in "Prob" \( Y \)$ there exists a unique quadratic optimal map $T_lambda$ from $rho$ to $lambda$, up to a $rho$-null set. If $F_n subset Y$ are finite $epsilon.alt_n$-nets with $epsilon.alt_n arrow.r 0$, and $Q_n : Y arrow.r F_n$ are Borel nearest-point selections, then 
$ T_(\( Q_n \)_(\#) lambda) arrow.r T_lambda quad upright("in ") L^2 \( rho \) . $

]
] <gradient:extension>

#proof[
  Compactness of $Y$ gives the finite nets. Enumerating each net and choosing the first closest point gives a Borel selection with $\| Q_n \( y \) - y \| lt.eq epsilon.alt_n$. Put $lambda_n = \( Q_n \)_(\#) lambda$, discard any zero-mass sites, and let $T_n = T_(lambda_n)$. These finite maps exist by Proposition 3.2, Lemma 2.1. The coupling induced by $y mapsto \( Q_n \( y \) \, Q_m \( y \) \)$ gives
  $ W_2 \( lambda_n \, lambda_m \) lt.eq epsilon.alt_n + epsilon.alt_m . $
  By 11, $\( T_n \)$ is Cauchy in $L^2 \( rho \)$. Let $S$ be its limit and choose a subsequence converging almost everywhere. Its limit lies in $Y$ almost everywhere because $Y$ is closed. Modifying $S$ on a null set gives a Borel map with values in $Y$. For any continuous $phi.alt : Y arrow.r bb(R)$, bounded convergence and uniform continuity give
  $ integral_K phi.alt \( S \( x \) \) thin d rho \( x \) = lim_n integral_Y phi.alt \( Q_n \( y \) \) thin d lambda \( y \) = integral_Y phi.alt \( y \) thin d lambda \( y \) . $
  Here and below a limit along the chosen subsequence is understood where needed. It follows that $S_(\#) rho = lambda$.
  To prove optimality directly, choose finite maximum potentials $u_n$ for $T_n$ and subtract a constant so that $u_n \( x_(*) \) = 0$ at a fixed $x_(*) in K$. Their slopes lie in $Y$, so they are $L$-Lipschitz and $\| u_n \| lt.eq L "diam" \( K \)$ on $K$. Arzelà–Ascoli gives a further subsequence converging uniformly on $K$ to a convex, $L$-Lipschitz function $u$. Intersect the full-measure sets on which each of the countably many finite-map supporting inequalities holds with the set on which the selected subsequence of $T_n$ converges. On this common set,
  $ u_n \( z \) gt.eq u_n \( x \) + T_n \( x \) dot.op \( z - x \) #h(2em) \( z in K \) . $
  Passing to the limit gives, simultaneously for every $z in K$,
  #[#set math.equation(numbering: n => "(6.4)")
   $ u \( z \) gt.eq u \( x \) + S \( x \) dot.op \( z - x \) quad upright("for ") rho upright("-almost every ") x . $ <gradient:limit-support>]
  Define the restricted convex conjugate
  $ u^(*) \( y \) = max_(z in K) #scale(x: 120%, y: 120%)[\(] z dot.op y - u \( z \) #scale(x: 120%, y: 120%)[\)] . $
  It is finite and continuous, and hence bounded on $Y$. The defining inequality and (6.4) give
  #[#set math.equation(numbering: n => "(6.5)")
   $ x dot.op y lt.eq u \( x \) + u^(*) \( y \) quad \( x in K \, med y in Y \) \, #h(2em) x dot.op S \( x \) = u \( x \) + u^(*) \( S \( x \) \) quad rho upright("-almost everywhere") . $ <gradient:fenchel>]
  For any competing map $V$ with $V_(\#) rho = lambda$, the integral of $u \( x \) + u^(*) \( V \( x \) \)$ is fixed by the marginals. Thus (6.5) shows that $S$ maximizes $integral_K x dot.op V \( x \) thin d rho \( x \)$. The identity
  $ integral_K \| x - V \( x \) \|^2 thin d rho \( x \) = integral_K \| x \|^2 thin d rho \( x \) + integral_Y \| y \|^2 thin d lambda \( y \) - 2 integral_K x dot.op V \( x \) thin d rho \( x \) $
  proves quadratic optimality.
  If $V$ has the same optimal cost, its nonnegative Fenchel gap $u \( x \) + u^(*) \( V \( x \) \) - x dot.op V \( x \)$ has integral zero. Equality and the definition of $u^(*)$ imply $u \( z \) gt.eq u \( x \) + V \( x \) dot.op \( z - x \)$ for every $z in K$ at almost every $x$. On almost every interior point of $K$, all coordinate partials of $u$ exist: on each coordinate interval the one-sided derivatives of a convex function are monotone, and Fubini applies. At such a point $x$, a supporting slope $p$ must satisfy
  $ p_j lt.eq lim_(t arrow.b 0) frac(u \( x + t e_j \) - u \( x \), t) \, #h(2em) p_j gt.eq lim_(t arrow.t 0) frac(u \( x + t e_j \) - u \( x \), t) . $
  Both limits equal $partial_j u \( x \)$, so the supporting slope is unique. The differentiability argument in the proof of 10 identifies it with $nabla u \( x \)$. The boundary of $K$ has zero volume by 4; hence $V = S$ almost everywhere. The same integrated inequality also proves optimality among arbitrary transport plans. Equality forces their target coordinate to be this unique supporting slope over almost every source point, so the optimal plan is the one induced by $S$.
  We have identified the $L^2$ limit as the unique map $T_lambda$. The original sequence was Cauchy, so the asserted convergence holds for the full sequence. ◻
]

#proof[
  Use the same finite nets and selections for $mu$ and $nu$, and set $mu_n = \( Q_n \)_(\#) mu$, $nu_n = \( Q_n \)_(\#) nu$. For any coupling $pi$ of $mu \, nu$, its image under $\( Q_n \, Q_n \)$ is a coupling of $mu_n \, nu_n$. The triangle inequality in $L^2 \( pi \)$ gives
  $ W_2 \( mu_n \, nu_n \) lt.eq (integral_(Y times Y) \| y - z \|^2 thin d pi \( y \, z \))^(1 \/ 2) + 2 epsilon.alt_n . $
  Taking the infimum over $pi$ yields $W_2 \( mu_n \, nu_n \) lt.eq W_2 \( mu \, nu \) + 2 epsilon.alt_n$. Apply 11 and then use the strong $L^2 \( rho \)$ convergence from 12 to conclude
  $ parallel T_mu - T_nu parallel_(L^2 \( rho \)) lt.eq C_(*) W_2 \( mu \, nu \)^(1 \/ 3) . $
  The constant in (6.3) depends only on $K$ and an enclosing radius for $Y$. In particular it is independent of atom counts, masses, site separations, or target densities. No convexity of $Y$ is required: the site interpolation used earlier stays in the ball of radius $L$, and the discretizations take their values in $Y$. The argument includes a singleton $Y$, for which all target maps coincide. The sharpness assertion was proved in 3. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
