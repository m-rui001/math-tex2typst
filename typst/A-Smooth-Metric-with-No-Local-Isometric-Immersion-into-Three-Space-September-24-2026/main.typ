#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A-Smooth-Metric-with-No-Local-Isometric-Immersion-into-Three-Space-September-24-2026]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

The local isometric realization problem asks whether a Riemannian surface $\( Sigma \, g \)$ can, near each point, be realized as a smooth surface in Euclidean three-space. In local coordinates this means finding a smooth map $F$ with

$ chevron.l partial_i F \, partial_j F chevron.r = g_(i j) \, #h(2em) i \, j in { 1 \, 2 } . $

Positive definiteness of $g$ then forces $"rank" d F = 2$. The unrestricted smooth question is part of Yau’s discussion of isometric embedding #cite(label("Yau2000")) p. 236 and is formulated explicitly in Ghomi’s survey #cite(label("Ghomi2019")) Section 1.5, Problem 1.9. We give a negative answer to this local three-dimensional problem.

#emph[Theorem A 1].  There is a $C^oo$ positive definite Riemannian metric $g$ on $\( - 1 \, 1 \)^2$ such that no open neighborhood $U$ of the origin admits a $C^oo$ isometric immersion

$ F : \( U \, g \) arrow.r bb(R)^3 . $

In particular, no such neighborhood admits a smooth isometric embedding.

A smooth isometric immersion is an embedding after restriction to a sufficiently small neighborhood of any point. Thus the two local formulations have the same existence content. No completeness or topological assumption is involved in Theorem A. The metric can moreover be chosen to have the same full Taylor jet at the origin as the Euclidean metric; see 10. Thus smooth local realizability is not determined by that jet.

=== Curvature and regularity <curvature-and-regularity>

The analytic local problem is settled by the classical Janet–Cartan theorem #cite(label("Janet1926")) #cite(label("Cartan1927")). For smooth metrics, nonzero Gaussian curvature leads to elliptic or hyperbolic equations and smooth local existence; zeros of curvature introduce degeneracy and changes of type. Lin’s foundational work treated nonnegative curvature and a clean change of sign with finite differentiability estimates #cite(label("Lin1985")) #cite(label("Lin1986")). Here a clean change of sign means $K \( p \) = 0$ and $d K \( p \) eq.not 0$. Smooth local existence under this condition was established by Nakamura and Maeda #cite(label("NakamuraMaeda1989")); see also the regularity comparison in #cite(label("NY2008")) p. 320. More complicated zero sets have been treated under finite-order and geometric restrictions, including transverse curves and cusps #cite(label("HanKhuri2010")) Theorem 1.1#cite(label("Lin2015")) Theorem 1.1.

The regularity distinction is essential. Existence at every finite differentiability order, on neighborhoods allowed to shrink with that order, does not by itself give one smooth map on a fixed neighborhood. At the other end of the scale, Nash–Kuiper flexibility gives $C^1$ local isometric realizations in three-space #cite(label("Nash1954")) #cite(label("Kuiper1955")). That regularity does not impose the second-order compatibility used for smooth immersions. Pogorelov constructed a $C^(2 \, 1)$ metric with no local $C^2$ realization #cite(label("Pogorelov1971")) paragraph 7. The published refinement by Nadirashvili and Yuan achieves $K gt.eq 0$ with the same input and output regularities #cite(label("NY2008")) Theorem 1.1. In Theorem A, positive definiteness refers to the metric, not its curvature: the construction uses both signs of curvature. It does not settle the smooth local-realizability problem under either sign restriction $K gt.eq 0$ or $K lt.eq 0$.

An earlier preprint of Nadirashvili and Yuan #cite(label("NY2002")) Theorem 1.1 states a stronger counterexample: a smooth metric with $K lt.eq 0$ and no $C^3$ isometric embedding on any neighborhood of the distinguished point. Their later published paper, however, explicitly leaves the arbitrary smooth-metric question open #cite(label("NY2008")) p. 320, as does the subsequent discussion in #cite(label("HanKhuri2010")) p. 650. The earlier preprint and these later accounts therefore give different statuses for the unrestricted smooth question. We leave this discrepancy unresolved. We do not use the preprint’s nonsolvability assertion; the construction below supplies its own analytic obstruction.

=== Ideas and proof structure <ideas-and-proof-structure>

The proof has two tasks: obstruct a scalar height on an entire fixed square, and construct a metric for which any local immersion would produce such a height on one of those squares. The scalar equation is the Darboux equation. It follows from the Gauss equation because the component of an immersion in a fixed ambient direction has covariant Hessian equal to a scalar multiple of the second fundamental form. We use only this necessary condition for an immersion. The patch argument excludes heights with gradient norm below one, a nonzero diagonal entry of the covariant Hessian, and a mixed entry small relative to that diagonal entry.

Two earlier approaches supply important parts of this strategy. The geometric construction uses the boundary-saddle argument of Nadirashvili and Yuan #cite(label("NY2002")) Section 2, Step 3: a negatively curved disk cannot be a graph whose second fundamental form vanishes along its entire boundary. On the analytic side, Khuri’s counterexamples for general Monge–Ampère equations use high-frequency integral testing #cite(label("Khuri2007Counterexamples")). His work on the Darboux equation develops solution-dependent flow coordinates and a prescribed-curvature construction, while leaving open the construction of the required nonsolvable curvature profile #cite(label("Khuri2009")) Theorem 1 and the following discussion. The distinction matters here: the Darboux coefficients come from one metric, so a nonsolvable general Monge–Ampère equation does not by itself give an isometric-immersion obstruction. We perturb the metric itself and estimate the resulting Darboux forcing.

For the model curvature used here, the main analytic ingredient is a uniform regularity estimate for Darboux heights on a #emph[cap]: a region with three edges in positive curvature and a fourth, artificial edge that may cut through negative curvature. Starting from fixed low-order bounds, the estimate gives all-orders bounds on compact subsets whenever the metric has such bounds there. No high-order data are imposed on the artificial edge. Differentiating the equation produces a transverse drift proportional to the curvature derivative. A directed multiplier uses this drift together with a small tangential term, needed where the transverse curvature derivative vanishes. A weighted elliptic estimate controls the remaining positive-curvature region. This is 3.

Two caps supply uniformly smooth data on opposite sides of a small negative-curvature slab. Hyperbolic propagation carries these data to the two edges of a thin, oscillating metric perturbation. A finite Taylor comparison for the unperturbed metric isolates the change in the height’s transverse derivative caused by the perturbation. Choose the strip width to be a small parameter times the inverse oscillation frequency. The forced oscillatory moment is linear in that parameter, while the leading competing spatial terms are quadratic and the smooth endpoint data contribute a negligible high-frequency moment. Fixing that parameter sufficiently small and then increasing the frequency excludes density, in any nonempty open set, of metrics admitting a height in a fixed bounded class. Baire category then removes those bounds and gives 2, the obstruction on a whole square.

The geometric step explains why that squarewise obstruction suffices. For each orientation in a fixed finite net, place shrinking obstructed patches approaching every boundary point of a disk with negative curvature inside and zero curvature on its boundary. The boundary-saddle argument finds a point where any hypothetical graph immersion has a nonzero rank-one second fundamental form. A height in the fixed ambient normal direction at that point has zero differential there. In a frame aligned with the Hessian’s kernel, its mixed entry vanishes and its transverse diagonal entry is nonzero. A nearby orientation from the net preserves the required strict inequalities on a sufficiently small full patch. Finally, let such disks and their surrounding patches accumulate at the origin, with amplitudes small enough to preserve smoothness and the Euclidean Taylor jet there.

2 formulates the scalar height equation and the whole-patch obstruction. 3 proves the cap estimate, and 4 combines it with the pulse and category argument. 5 constructs one smooth metric and completes the geometric contradiction.

=== Conventions <conventions>

All metrics and functions are real and smooth unless another regularity is specified. Coordinate derivatives are ordinary partial derivatives; $nabla_g^2 z$ is the covariant Hessian. For a family of functions, a uniform bound on all derivatives means a separate finite bound for each derivative order, independent of the member of the family. Constants may depend on a fixed model patch and on the derivative order. No estimate below is asserted uniformly as the curvature amplitude of a patch tends to zero.

== 2 The model patch and the height equation <sec:model>

The first task is to obstruct scalar height functions on a whole closed square. We fix a curvature profile with a negative center and a positive exterior, then specify the equation and inequalities that the final geometric argument will force on one such square.

Fix a smooth even function $h : bb(R) arrow.r bb(R)$ such that

#[#set math.equation(numbering: n => "(2.1)")
 $ h = 1 quad upright("on ") \[ - 1 \/ 2 \, 1 \/ 2 \] \, #h(2em) h' lt.eq 0 quad upright("on ") \[ 0 \, oo \) \,\
h > 0 quad upright("on ") \( - 1 \, 1 \) \, #h(2em) h < 0 quad upright("for ") lr(||) y > 1 \,\
h \( 1 \) = 0 \, #h(2em) h' \( 1 \) < 0 . $ <eq:h>]

For example, let $rho$ be a nonnegative smooth function supported in $\[ 1 \/ 2 \, 2 \]$, positive on $\( 1 \/ 2 \, 3 \/ 2 \)$, and put

$ h \( y \) = 1 - frac(integral_0^(lr(||) y) rho \( v \) thin upright(d) v, integral_0^1 rho \( v \) thin upright(d) v) . $

This function has all the required properties.

Write $S = \[ - 3 \, 3 \]^2$, with coordinates $x \, y$, and fix a positive constant $kappa$. Let $g_0$ be a smooth positive metric on a neighborhood of $S$ with curvature

#[#set math.equation(numbering: n => "(2.2)")
 $ K_(g_0) \( x \, y \) = kappa #scale(x: 120%, y: 120%)[\(] x^2 - h \( y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:model-curvature>]

We will construct such background metrics in 5. Perturbations are smooth symmetric tensors supported in

$ cal(P) = \[ - 1 \/ 10 \, 1 \/ 10 \]^2 . $

Let $cal(U)$ be the open set of these perturbations for which the resulting metric $g$ is positive and

#[#set math.equation(numbering: n => "(2.3)")
 $ K_g < - kappa \/ 2 #h(2em) upright("on ") \[ - 1 \/ 5 \, 1 \/ 5 \]^2 . $ <eq:negative-box>]

We regard $cal(U)$ as a set of metrics with its $C^oo$ topology. It contains $g_0$: on this smaller square, $h = 1$ and $x^2 lt.eq 1 \/ 25$. Outside $cal(P)$, every metric in $cal(U)$ still has curvature (2.2).

For a function $z$, write

#[#set math.equation(numbering: n => "(2.4)")
 $ H_(i j) = z_(i j) - Gamma_(i j)^r z_r \, #h(2em) E = det \( g \) \( 1 - lr(|d z|)_g^2 \) . $ <eq:height-notation>]

Here $K = K_g$, $Gamma_(i j)^r$ are the Christoffel symbols of $g$, and repeated indices are summed. Wherever $H_(y y) eq.not 0$, put $q = H_(x y) \/ H_(y y)$. An #emph[admissible height] for $g$ is a function $z$, smooth on a neighborhood of the closed square $S$, satisfying throughout $S$

#[#set math.equation(numbering: n => "(2.5)")
 $ H_(x x) H_(y y) - H_(x y)^2 = K E \, #h(2em) E > 0 \, #h(2em) H_(y y) eq.not 0 \, #h(2em) lr(||) q lt.eq 1 \/ 100 . $ <eq:admissible>]

The scalar equation here is the Darboux equation; compare #cite(label("Khuri2009")) Equation (1) and Appendix. We recall the necessary geometric identity directly.

#thm([Lemma 2.1.])[
  (Height equation).  #emph[Let $F$ be a smooth isometric immersion of a surface into $bb(R)^3$, let $e$ be a fixed ambient unit vector, and set $z = chevron.l F \, e chevron.r$. Then 
$ det \( nabla_g^2 z \) = K det \( g \) \( 1 - lr(|d z|)_g^2 \) . $

 If $e$ is normal to the immersed surface at a point $b$, then $d z \( b \) = 0$ and $nabla_g^2 z \( b \) = upright("II") \( b \)$, with the choice of unit normal equal to $e$ at $b$.]
] <lem:height>

#proof[
  With $n$ the chosen unit normal and $nu = chevron.l n \, e chevron.r$, the Gauss formula gives $nabla_g^2 z = nu upright("II")$. The tangential and normal decomposition of $e$ gives $lr(|d z|)_g^2 + nu^2 = 1$. The Gauss equation $det upright("II") = K det g$ now proves the identity, and the final statement follows from $nu \( b \) = 1$. ◻
]

Only this necessary equation for a height is used. We do not need the converse reconstruction of an immersion from a Darboux solution.

#thm([Proposition 2.2.])[
  (Patch obstruction).  #emph[The metrics in $cal(U)$ admitting no admissible height form a residual subset of $cal(U)$. In particular, for every $C^oo$ neighborhood of $g_0$ in $cal(U)$, there is a metric in that neighborhood with no admissible height.]
] <prop:patch>

The whole-square requirement is essential. Every curvature zero in $S$ of a metric in $cal(U)$ is a clean change of sign. Indeed, $K < 0$ on $cal(P)$; outside it, $K_x = 2 kappa x$, and a zero with $x = 0$ has $y = plus.minus 1$, where $K_y eq.not 0$. Thus the pointwise local-existence results recalled in the introduction are compatible with this proposition: they do not supply one height satisfying (2.5) throughout $S$.

We prove 2 in 4, after establishing estimates on the two caps. 1 shows the model geometry.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.904, -1.904), (1.904, 1.904), fill: rgb("#f2f2ff"), stroke: none)
  merge-path({bezier((0, 1.512), (1.142, 0.672), (0.896, 1.512), (1.142, 1.064)); line((1.142, 0.672), (1.142, -0.672)); bezier((1.142, -0.672), (0, -1.512), (1.142, -1.064), (0.896, -1.512)); bezier((0, -1.512), (-1.142, -0.672), (-0.896, -1.512), (-1.142, -1.064)); line((-1.142, -0.672), (-1.142, 0.672)); bezier((-1.142, 0.672), (0, 1.512), (-1.142, 1.064), (-0.896, 1.512))}, close: false, fill: rgb("#ffe8d1"), stroke: none)
  bezier((0, 1.512), (1.142, 0.672), (0.896, 1.512), (1.142, 1.064), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((1.142, 0.672), (1.142, -0.672), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((1.142, -0.672), (0, -1.512), (1.142, -1.064), (0.896, -1.512), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((0, -1.512), (-1.142, -0.672), (-0.896, -1.512), (-1.142, -1.064), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.142, -0.672), (-1.142, 0.672), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-1.142, 0.672), (0, 1.512), (-1.142, 1.064), (-0.896, 1.512), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-1.904, -1.904), (1.904, 1.904), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((-2.094, 0), (2.139, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((2.139, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$x$]]], anchor: "west", padding: 0.1176cm)
  line((0, -2.094), (0, 2.139), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((0, 2.139), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$y$]]], anchor: "south", padding: 0.1176cm)
  rect((-0.28, -0.28), (0.28, 0.28), fill: rgb("#ffffff"), stroke: none)
  rect((-0.28, -0.28), (0.28, 0.28), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.0224, 0.0112), [#text(size: 9pt)[$cal(P)$]])
  content((0, 0.8512), [#text(size: 9pt)[$K<0$]])
  content((1.434, 1.59), [#text(size: 9pt)[$K>0$]])
  content((1.008, -1.288), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$K=0$]]])])
})],
  caption: [Figure 1: The model patch, schematically and not to scale. The curvature zero set lies outside the perturbation box $cal(P)$. The positive exterior permits estimates on lower and upper caps whose free artificial edges may cut through the negative region. The lower-cap integration region is shown in 2. ],
) <fig:geometry>

== 3 Uniform regularity on caps <sec:caps>

The purpose of this section is to turn low-order control of an admissible height into all-orders control wherever the metric has all-orders control in a lower or upper cap. The edge facing the center is artificial: no high-order boundary data will be imposed there.

Throughout this section we consider families of metrics $g in cal(U)$ and admissible heights $z$. Assume fixed uniform bounds

#[#set math.equation(numbering: n => "(3.1)")
 $ ∥∥ g_(C^8 \( S \)) + ∥∥ z_(C^8 \( S \)) lt.eq M \, #h(2em) g gt.eq c I \, #h(2em) lr(|H_(y y)|) gt.eq c \, #h(2em) E gt.eq c \, $ <eq:low-bounds>]

where $M < oo$ and $c > 0$. Constants in this section may depend on these bounds, on $kappa \, h$, and on the derivative order.

Set

#[#set math.equation(numbering: n => "(3.2)")
 $ D = partial_x - q partial_y \, #h(2em) G = E / H_(y y)^2 \, #h(2em) a = K G . $ <eq:DGa>]

Use flow coordinates $t \, s$ defined by

#[#set math.equation(numbering: n => "(3.3)")
 $ x = t \, #h(2em) y_t \( t \, s \) = - q \( t \, y \( t \, s \) \) \, #h(2em) y \( 0 \, s \) = s . $ <eq:flow>]

They exist on $\[ - 2 \, 2 \]^2$, have image in the interior of $S$, and satisfy

#[#set math.equation(numbering: n => "(3.4)")
 $ lr(|y \( t \, s \) - s|) lt.eq 1 \/ 50 \, #h(2em) D = partial_t \, #h(2em) 0 < c_0 lt.eq s_y lt.eq C_0 . $ <eq:flow-bounds>]

Indeed the first estimate follows from $lr(||) q lt.eq 1 \/ 100$. Differentiating the flow gives

$ y_s = exp (- integral_0^t q_y \( r \, y \( r \, s \) \) thin upright(d) r) > 0 . $

The low bounds give uniform bounds for the derivatives of the chart and its inverse through the orders used below, in particular through order three. Denote this chart by $Phi_z \( t \, s \) = \( t \, y \( t \, s \) \)$.

#thm([Proposition 3.1.])[
  (Cap regularity).  #emph[Fix $- 1 \/ 4 < b_(*) lt.eq 0$, and assume (3.1). Suppose that, for every compact rectangle 
$ R subset.double \( - 2 \, 2 \) times \( - 2 \, b_(*) \) \, $

 the ordinary coordinate derivatives of $g$ of every order have uniform bounds on $Phi_z \( R \)$. Then the ordinary coordinate derivatives of $z$ of every order also have uniform bounds on $Phi_z \( R \)$. The corresponding assertion holds for the upper cap $\( - 2 \, 2 \) times \( - b_(*) \, 2 \)$.]
] <prop:cap>

Here and below a rectangle has sides parallel to the $t \, s$ axes. Its image may depend on the solution, but all margins in coordinate labels are chosen independently of the member of the family. More precisely, if $R subset.double R'$ are two such rectangles, the uniform bounds for the chart and its inverse give a fixed radius of ordinary coordinate balls around points of $Phi_z \( R \)$ that stay inside $Phi_z \( R' \)$. We can therefore apply local Sobolev estimates with uniform constants in the original coordinates. No high derivatives of the chart are needed for this step.

=== 3.1 The differentiated equation <the-differentiated-equation>

At the induction step we estimate $u = partial_y^l z$ first; the Darboux equation then recovers derivatives with more $x$ indices. We differentiate in the original coordinates before passing to the flow chart, whose high derivatives are not yet controlled. Solving the Darboux equation for $z_(x x)$ gives

#[#set math.equation(numbering: n => "(3.5)")
 $ z_(x x) = P \( x \, y \, z_i \, z_(x y) \, z_(y y) \) = Gamma_(x x)^r z_r + frac(H_(x y)^2 + K E, H_(y y)) . $ <eq:P>]

The metric and its derivatives are prescribed arguments of $P$. In particular,

#[#set math.equation(numbering: n => "(3.6)")
 $ P_(z_(x y)) = 2 q \, #h(2em) P_(z_(y y)) = - q^2 - a \, #h(2em) P_(z_i) = Gamma_(D D)^i + O \( K \) . $ <eq:P-partials>]

The notation $Gamma_(D D)^i$ contracts the two lower Christoffel indices against $D$, without differentiating $D$. The last identity follows more explicitly from

$ P_(z_i) = Gamma_(D D)^i + K (E_(z_i) / H_(y y) + frac(E Gamma_(y y)^i, H_(y y)^2)) . $

All coefficients in an $O \( K \)$ term in this section are uniformly bounded under (3.1).

#thm([Lemma 3.2.])[
  (Curvature drift).  #emph[The quantities in (3.2) satisfy 
#[#set math.equation(numbering: n => "(3.7)")
 $ D q - P_(z_x) q - P_(z_y) = K_y G + O \( K \) . $ <eq:drift>]

]
] <lem:drift>

#proof[
  Put $Y = partial_y$. The definitions and the Darboux equation give
  $ H \( Y \, D \) = 0 \, #h(2em) H \( D \, D \) = K E \/ H_(y y) \, #h(2em) H \( D \, partial_x \) = K E \/ H_(y y) . $
  Thus $H \( D \, dot.op \) = O \( K \)$ on bounded coordinate vectors. The commutation formula for a covariant Hessian gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ \( nabla_D H \) \( Y \, D \) = \( nabla_Y H \) \( D \, D \) + O \( K \) \, $ <eq:hessian-commutation>]
  because in dimension two the curvature tensor is a bounded tensor multiple of $K$, and the commutator contracts it against $d z$.
  Differentiate $H \( Y \, D \) = 0$. The term containing $nabla_D Y$ is $O \( K \)$, and $nabla_D D = Gamma_(D D)^i partial_i - \( D q \) Y$. Hence the left side of (3.8) equals
  $ H_(y y) \( D q - q Gamma_(D D)^x - Gamma_(D D)^y \) + O \( K \) . $
  On the right, differentiating $H \( D \, D \) = K E \/ H_(y y)$ gives $K_y E \/ H_(y y) + O \( K \)$; the two connection terms are $O \( K \)$. Division by $H_(y y)$, followed by (3.6), proves (3.7). ◻
]

#thm([Lemma 3.3.])[
  (High derivative equation).  #emph[Let $l gt.eq 8$. Suppose that the ordinary derivatives of $z$ through order $l$ have uniform $L^2$ bounds on images of compact rectangles in the lower cap, and that the metric satisfies the hypothesis of 3. Then $u = partial_y^l z$, re-expressed in flow coordinates, satisfies 
#[#set math.equation(numbering: n => "(3.9)")
 $ u_(t t) + A u_(s s) + B u_t + C u_s = R_l \, $ <eq:linear-cap>]

 where $R_l$ is uniformly bounded in $L^2$ on smaller compact rectangles, and 
#[#set math.equation(numbering: n => "(3.10)")
 $ A = G_1 K \, #h(2em) G_1 = G s_y^2 \, #h(2em) B = - P_(z_x) - 2 l q_y \,\
C = \( l + 1 \) A_s + O_l \( A \) . $ <eq:linear-coefficients>]

 The function $G_1$ has positive lower and upper bounds and bounded first derivatives. The coefficients $A \, A_t \, A_s \, B \, B_s \, C$ are uniformly bounded.]
] <lem:high-equation>

#proof[
  The inductive $L^2$ bounds give supremum bounds through order $l - 2$ on smaller sets by the local two-dimensional Sobolev inequality on the ordinary coordinate balls described above.
  Differentiate (3.5) $l$ times in the original $y$ coordinate. In addition to the direct linearization, the terms containing derivatives of $z$ of order $l + 1$ are
  $ l #scale(x: 120%, y: 120%)[\(] 2 q_y u_x - \( q^2 + a \)_y u_y #scale(x: 120%, y: 120%)[\)] . $
  These arise when a second-jet argument receives $l - 1$ differentiations and the remaining single derivative is placed elsewhere. The coefficient derivatives are total derivatives, including the explicit metric dependence of $P$.
  Every remaining differentiated solution factor has order at most $l$. A factor of order at least $l - 1$ consumes at least $l - 3$ of the $l$ differentiations. There cannot be two such factors, since $2 \( l - 3 \) > l$ for $l gt.eq 8$. Thus all but at most one factor use the supremum bounds through order $l - 2$; the remaining factor uses its $L^2$ bound. Metric derivatives are bounded by hypothesis, and inverse powers of $H_(y y)$ are bounded by (3.1). The remainder is consequently bounded in $L^2$.
  Using
  $ D^2 = partial_x^2 - 2 q partial_(x y) + q^2 partial_y^2 - \( D q \) partial_y $
  and $partial_x = D + q partial_y$, the differentiated equation becomes
  #[#set math.equation(numbering: n => "(3.11)")
   $ [D^2 + a partial_y^2 + B D + #scale(x: 120%, y: 120%)[\(] D q - P_(z_x) q - P_(z_y) + l a_y #scale(x: 120%, y: 120%)[\)] partial_y] u = R_l . $ <eq:pre-flow>]
  Now $D = partial_t$, $partial_y = s_y partial_s$, and $partial_y^2 = s_y^2 partial_s^2 + s_(y y) partial_s$. By 4, the transverse coefficient is
  $ C = a s_(y y) + s_y \( K_y G + l a_y + O \( K \) \) = \( l + 1 \) G s_y K_y + O_l \( K \) . $
  Since
  $ A_s = G s_y K_y + K \( G s_y^2 \)_s \, $
  this is (3.10). The factor $l + 1$ has two sources: the commutation identity contributes one copy of $G s_y K_y$, and the term $l a_y$ contributes $l$ copies. Every other transverse term contains $K$ times a bounded factor. All asserted low coefficient bounds follow from (3.1) and the flow bounds. ◻
]

=== 3.2 A weighted gradient estimate <a-weighted-gradient-estimate>

The differentiated equation reduces the cap induction to a gain of one derivative. Its principal part changes type, so an elliptic estimate alone is insufficient. We combine a directed multiplier near and inside the negative region with a weighted elliptic estimate on its complement.

#thm([Lemma 3.4.])[
  (The free cap edge).  #emph[Retain the model geometry and flow coordinates fixed above. Let $l gt.eq 8$, and let the coefficients satisfy (3.10) with the uniform bounds in 5. For every $R_0 subset.double \( - 2 \, 2 \) times \( - 2 \, b_(*) \)$, there is a larger compact rectangle $R_1$ in that cap and a constant $C_(R_0 \, l)$ such that every smooth solution of 
$ u_(t t) + A u_(s s) + B u_t + C u_s = f $

 on a neighborhood of $R_1$ satisfies 
#[#set math.equation(numbering: n => "(3.12)")
 $ ∥\( u_t \, u_s \)∥_(L^2 \( R_0 \)) lt.eq C_(R_0 \, l) #scale(x: 120%, y: 120%)[\(] ∥∥ u_(L^2 \( R_1 \)) + ∥∥ f_(L^2 \( R_1 \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:gradient-bound>]

 The constants are uniform over the families under consideration.]
] <lem:gradient>

#proof[
  Choose $b < b_(*)$ above the upper edge of $R_0$. Integrations will take place below $s = b$, with their other three edges sufficiently far out that cutoff derivatives lie in
  $ 3 \/ 2 < lr(||) t < 2 quad upright("or") quad - 2 < s < - 3 \/ 2 . $
  Both regions have uniformly positive curvature. At the lateral edges, $t^2 - h \( y \) gt.eq t^2 - 1 > 0$. At the lower edge, (3.4) gives $y < - 1$, so $h \( y \) < 0$. There is room for nested cutoffs there and for a compact rectangle $R_1$ containing every integration set, including its upper edge.
  Set $d = b - s$ and $p = 8$. We choose the directed weight to vanish like $d^p$ at the artificial edge; it remains positive on $R_0$. Differentiating such a weight costs a factor $d^(- 1)$, so the two estimates will meet at $K = c_1 d$, for a small constant $c_1 > 0$ chosen below. The directed multiplier controls $K lt.eq c_1 d$, where its positive-curvature error is $O \( K \/ d \)$. On $K gt.eq c_1 d$, an elliptic estimate controls the stronger weight $d^(p - 1)$, which pays for the weight and cutoff derivatives. 2 shows the integration geometry.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-2.7, -2.4), (2.7, 0), fill: rgb("#f0f0ff"), stroke: none)
  merge-path({line((-1.512, 0), (-1.512, -0.42)); bezier((-1.512, -0.42), (0, -1.536), (-1.512, -0.996), (-0.7695, -1.536)); bezier((0, -1.536), (1.512, -0.42), (0.7695, -1.536), (1.512, -0.996)); line((1.512, -0.42), (1.512, 0))}, close: true, fill: rgb("#ffe3c7"), stroke: none)
  line((-1.512, 0), (-1.512, -0.42), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-1.512, -0.42), (0, -1.536), (-1.512, -0.996), (-0.7695, -1.536), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((0, -1.536), (1.512, -0.42), (0.7695, -1.536), (1.512, -0.996), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((1.512, -0.42), (1.512, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-2.7, 0), (-2.7, -2.4), (2.7, -2.4), (2.7, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((-2.7, 0), (2.7, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((0, 0.2469), [#text(size: 9pt)[artificial edge $s=b$]], anchor: "south", padding: 0.1176cm)
  content((-0.27, -0.576), [#text(size: 9pt)[$K<0$]])
  content((0, -1.98), [#text(size: 9pt)[$K>0$]])
  content((-1.552, -1.02), [#text(size: 9pt)[$K=0$]], anchor: "east", padding: 0.1176cm)
  line((0.891, -0.048), (0.891, -0.984), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((0.972, -0.696), [#text(size: 9pt)[$d$]], anchor: "west", padding: 0.1176cm)
  line((3.308, -2.16), (3.308, -0.78), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((3.308, -0.78), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$s$]]], anchor: "south", padding: 0.1176cm)
  line((2.97, -1.86), (4.117, -1.86), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((4.117, -1.86), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$t$]]], anchor: "west", padding: 0.1176cm)
  content((0, -3), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[three edges in positive curvature]]])
})],
    caption: [Figure 2: A lower-cap integration region in flow coordinates, schematically and not to scale. The lateral and bottom edges are chosen in positive curvature. The artificial edge $s = b$ may cross the negative region; no high-order data are prescribed there. The distance $d = b - s$ enters the vanishing weight. The actual curvature zero set depends on the solution through the flow coordinates; only its position relative to the three elliptic edges and the artificial edge is illustrated. ],
  ) <fig:cap>
  #emph[The directed multiplier.] The transverse multiplier uses the favorable curvature drift. We add a small $t$-directed part to obtain positivity at those zeros of curvature where $K_y = 0$: there the $x^2$ term in the model curvature must supply the estimate. Put
  #[#set math.equation(numbering: n => "(3.13)")
   $ I \( t \, s \) = integral_0^t B \( r \, s \) thin upright(d) r \,\
W = d^p e^(- lambda s + I \( t \, s \)) \, #h(2em) m = - W \, #h(2em) n = epsilon.alt t W \, #h(2em) H_0 = lambda + p \/ d . $ <eq:weights>]
  Here $epsilon.alt > 0$ will be small and $lambda > 0$ large. The factor $e^I$ gives $m_t = B m$, canceling the corresponding mixed term in the identity below. Also $m_s \/ W = H_0 - I_s$, with $I_s$ uniformly bounded.
  Testing against $m u_s + n u_t$ and integrating by parts gives the interior quadratic form
  #[#set math.equation(numbering: n => "(3.14)")
   $ T u_t^2 + S_0 u_s^2 + J u_t u_s \, #h(2em) {T = \( m_s - n_t \) \/ 2 + B n \,\
S_0 = - \( A m \)_s \/ 2 + \( A n \)_t \/ 2 + C m \,\
J = - m_t + B m - \( A n \)_s + C n . $ <eq:quadratic>]
  The symbol $S_0$ denotes this coefficient, not the model square. Substituting (3.13) gives, for large $lambda$,
  #[#set math.equation(numbering: n => "(3.15)")
   $ T \/ W & gt.eq H_0 \/ 4 \,\
S_0 \/ W & = - \( l + 1 \/ 2 \) A_s + epsilon.alt t A_t \/ 2 - H_0 A \/ 2 + O_l \( A \) \,\
lr(||) J \/ W & lt.eq C_l epsilon.alt \( 1 + H_0 lr(||) A \) . $ <eq:quadratic-bounds>]
  #emph[Positivity near and inside the negative region.] There are choices of these constants and $c_1 \, c_2 > 0$ such that
  #[#set math.equation(numbering: n => "(3.16)")
   $ T u_t^2 + S_0 u_s^2 + J u_t u_s gt.eq c_2 W \( u_t^2 + u_s^2 \) #h(2em) upright("where ") K lt.eq c_1 d . $ <eq:coercive>]
  We verify the choices in detail.
  For $lr(||) K$ sufficiently small, (2.3) excludes $cal(P)$, so the prescribed curvature formula applies. In the lower cap $y lt.eq 1 \/ 50$. The plateau and monotonicity in (2.1) imply $K_y lt.eq 0$ there. Also
  #[#set math.equation(numbering: n => "(3.17)")
   $ A_s = G_1 K_y \/ s_y + O \( A \) \, #h(2em) A_t = G_1 \( 2 kappa t - q K_y \) + O \( A \) . $ <eq:A-derivatives>]
  Thus the first two terms in the second line of (3.15), up to $O_l \( A \)$, equal
  $ G_1 [- (frac(l + 1 \/ 2, s_y) + frac(epsilon.alt t q, 2)) K_y + epsilon.alt kappa t^2] . $
  For small fixed $epsilon.alt > 0$ this is bounded below by a positive constant times $- K_y + epsilon.alt t^2$. To make its uniform positivity independent of the flow chart, consider the fixed physical zero set
  $ cal(Z) = { \( x \, y \) in \[ - 2 \, 2 \] times \[ - 101 \/ 50 \, 1 \/ 50 \] : x^2 = h \( y \) } . $
  It is compact and contains every curvature zero in the lower cap. If $x = 0$ on $cal(Z)$, then $y = - 1$, where $K_y < 0$; at every other point $x^2 > 0$. Thus $- K_y + epsilon.alt x^2$ has a positive minimum on $cal(Z)$. The uniform bounds for $G_1 \, s_y \, q$ transfer this minimum to the geometric contribution on a common neighborhood of $K = 0$.
  The cross-term loss after absorbing part of $T u_t^2$ is bounded by
  #[#set math.equation(numbering: n => "(3.18)")
   $ frac(J^2, T W) lt.eq C'_l epsilon.alt^2 (H_0^(- 1) + H_0 A^2) . $ <eq:cross-loss>]
  On $K lt.eq 0$, the term $- H_0 A \/ 2 = H_0 lr(||) A \/ 2$ is favorable. Since $lr(||) A$ is bounded, choose $epsilon.alt$ small enough to absorb the second term of (3.18) into a small fraction of $H_0 lr(||) A$. Increase $lambda$ to absorb the $O_l \( A \)$ terms and the $H_0^(- 1)$ loss. Away from a neighborhood of the zero set on the negative side, the same increase of $lambda$ makes $H_0 lr(||) A$ dominate all bounded adverse terms.
  Fix these $epsilon.alt \, lambda$. On $0 < K lt.eq c_1 d$, since $d$ is bounded above,
  $ H_0 A lt.eq C c_1 \( lambda d_max + p \) . $
  Choose $c_1$ so small that this region lies in the preceding neighborhood of the zero set, and that the adverse $H_0 A$ term and remaining errors use only a fraction of its positive lower bound. This proves (3.16). The order of choices is $epsilon.alt$, then $lambda$, then $c_1$.
  #emph[The auxiliary elliptic estimate.] On the remaining region we claim
  #[#set math.equation(numbering: n => "(3.19)")
   $ integral.double_({ K gt.eq c_1 d }) d^(p - 1) \( u_t^2 + u_s^2 \) thin upright(d) t thin upright(d) s lt.eq C #scale(x: 120%, y: 120%)[\(] ∥∥ u_(L^2 \( R_1 \))^2 + ∥∥ f_(L^2 \( R_1 \))^2 #scale(x: 120%, y: 120%)[\)] \, $ <eq:aux-elliptic>]
  on any of the supports needed for the directed multiplier. To prove it, choose a cutoff $chi$ farther out at the three elliptic edges, equal to one on those supports. Let $phi.alt$ be a smooth cutoff equal to zero on $\( - oo \, c_1 \/ 2 \]$ and one on $\[ c_1 \, oo \)$, and test the equation against $- v u$, where
  $ v = d^(p - 2) chi^2 phi.alt \( K \/ d \)^2 . $
  On $v > 0$, $A gt.eq c' d$. In the transition region of $phi.alt$, $K = O \( d \)$, and hence derivatives of $K \/ d$ are $O \( d^(- 1) \)$. It follows that
  $ lr(|v_t|) + lr(|v_s|) lt.eq C sqrt(v) thin d^(\( p - 2 \) \/ 2) \( 1 + d^(- 1) \) . $
  The squared cutoffs make this inequality valid also at their zeros.
  Integration by parts produces the positive term $integral.double v \( u_t^2 + A u_s^2 \)$ and the error
  $ integral.double u #scale(x: 120%, y: 120%)[\[] \( v_t - v B \) u_t + \( \( A v \)_s - v C \) u_s #scale(x: 120%, y: 120%)[\]] . $
  On $v > 0$, the coefficient bounds and $A gt.eq c' d$ give
  $ frac(\( v_t - v B \)^2, v) + frac(\( \( A v \)_s - v C \)^2, A v) lt.eq C \( 1 + d^(p - 5) \) . $
  Young’s inequality absorbs half of the positive term; the remaining cost is at most $C integral.double \( 1 + d^(p - 5) \) u^2$. Since $p = 8$, this is bounded by $C ∥∥ u_2^2$. The source term is at most $C ∥∥ f_2 ∥∥ u_2$. We conclude that
  $ integral.double v \( u_t^2 + A u_s^2 \) lt.eq C \( ∥∥ u_2^2 + ∥∥ f_2^2 \) . $
  Where $chi = phi.alt = 1$, $v = d^(p - 2) gt.tilde d^(p - 1)$ and $v A gt.tilde d^(p - 1)$, proving (3.19). This estimate permits ellipticity to degenerate linearly as $s$ approaches $b$.
  #emph[Combining the estimates.] Multiply $m \, n$ by one nonnegative cutoff toward the other three edges, equal to one on $R_0$ and on the nonelliptic portion of the integration region. Its derivative terms lie in fixed positive curvature; decreasing $c_1$, if needed, puts those supports in the region controlled by (3.19). The coefficients in (3.14) and the cutoff errors are $O \( d^(p - 1) \)$, since $W asymp d^p$ and $H_0 = O \( 1 + d^(- 1) \)$. Thus (3.19) controls all adverse terms outside (3.16).
  On the coercive region the source $f \( m u_s + n u_t \)$ is absorbed by Young’s inequality, at a cost $C ∥∥ f_2^2$. On the complementary region use (3.19) and $W^2 \/ d^(p - 1) = O \( d^(p + 1) \)$ to obtain the same bound together with $C ∥∥ u_2^2$. Combining the coercive part with the elliptic estimate on its complement, we obtain
  $ integral.double_(R_0) W \( u_t^2 + u_s^2 \) lt.eq C \( ∥∥ u_(L^2 \( R_1 \))^2 + ∥∥ f_(L^2 \( R_1 \))^2 \) . $
  The weight is bounded below on $R_0$, so this proves (3.12).
  All integrations at the artificial edge can first be made below $s = b - eta$ and then continued to $eta = 0$. For each individual smooth solution, the boundary terms vanish because $W$ and $v$ vanish to positive order. The edge $b$ is strictly inside the smooth domain. No uniform bound on its high derivatives is needed to obtain these identities; the uniform estimates involve only the interior $L^2$ norms just displayed. ◻
]

=== 3.3 Completion of the cap induction <completion-of-the-cap-induction>

#proof[
  We prove uniform $L^2$ bounds for ordinary derivatives of $z$ through order $l$, on images of all compact rectangles in the cap. The case $l = 8$ follows from (3.1). Assume the assertion at some $l gt.eq 8$. Apply Lemma 3.3, Lemma 3.4 with $f = R_l$. The required bounds for $u \, R_l$ on the larger compact rectangle are supplied by the induction hypothesis. Measures in the two coordinate systems are uniformly comparable.
  The resulting gradient bound controls
  $ partial_y^(l + 1) z = s_y u_s \, #h(2em) partial_x partial_y^l z = u_t + q s_y u_s . $
  To recover $partial_x^k partial_y^(l + 1 - k) z$ for $k gt.eq 2$, apply $partial_x^(k - 2) partial_y^(l + 1 - k)$ to (3.5). The two top terms on the right are
  $ P_(z_(x y)) partial_x^(k - 1) partial_y^(l + 2 - k) z quad upright("and") quad P_(z_(y y)) partial_x^(k - 2) partial_y^(l + 3 - k) z . $
  They have fewer $x$ indices. All remaining solution factors have order at most $l$ and obey the same Sobolev product bounds as in 5. Increasing $k$ therefore gives every derivative of order $l + 1$.
  This closes the induction. For each fixed derivative order, local Sobolev estimates on slightly larger compact rectangles convert the $L^2$ bounds into the asserted supremum bounds. The final rectangle is arbitrary and fixed; only the constants and intermediate margins depend on the derivative order. Reflection $y mapsto - y$, using the evenness of $h$, proves the upper-cap assertion. ◻
]

== 4 The oscillatory pulse and the patch obstruction <sec:pulse>

We now prove 2 by a category argument. Assuming density of a class of metrics admitting uniformly bounded heights, we perturb a fixed metric inside a thin strip. Cap regularity and hyperbolic propagation give smooth tangential data at both strip edges for every corresponding height. A Taylor comparison for the fixed metric isolates the change in the transverse derivative caused by the perturbation. Its oscillatory moment is incompatible with smooth data at both edges.

=== 4.1 A bounded solution class <a-bounded-solution-class>

The vector space of smooth symmetric tensors supported in $cal(P)$ is a closed subspace of a smooth-function Fréchet space. Its open subset $cal(U)$ is therefore a Baire space. For $M in bb(N)$, consider metrics admitting an admissible height with

#[#set math.equation(numbering: n => "(4.1)")
 $ ∥∥ z_(C^8 \( S \)) lt.eq M \, #h(2em) M^(- 1) lt.eq lr(|H_(y y)|) lt.eq M \, #h(2em) E gt.eq M^(- 1) . $ <eq:class-bounds>]

Put

#[#set math.equation(numbering: n => "(4.2)")
 $ v_(*) = sqrt(kappa \/ 2) thin M^(- 3 \/ 2) \, #h(2em) L = 100 \( 1 + v_(*)^(- 1) \) . $ <eq:speed-constants>]

For each rational $q_0$, let $cal(A)_(M \, q_0)$ be the subclass in which such a height also satisfies

#[#set math.equation(numbering: n => "(4.3)")
 $ lr(|q \( 0 \, 0 \) - q_0|) < frac(1, 100 L) . $ <eq:q-class>]

These countably many classes cover every metric with an admissible height. Indeed smoothness and the strict inequalities on the compact square supply some $M$, after which rational approximation supplies $q_0$. We will show that each class is nowhere dense.

Suppose, to the contrary, that the closure of one class contains a nonempty open set $cal(O) subset cal(U)$. Fix $g_(*) in cal(O)$. All test metrics below lie in $cal(O)$ and converge to $g_(*)$ in $C^8$. Metrics from the class can be chosen arbitrarily close to each test metric in the smooth topology. We may consequently use uniform low bounds for the metric, its inverse, and the first derivatives of $q$. Since $lr(||) q lt.eq 1 \/ 100$, a nonempty class satisfies $lr(|q_0|) < 1 \/ 20$.

Introduce linear coordinates

#[#set math.equation(numbering: n => "(4.4)")
 $ xi = x \, #h(2em) theta = y + q_0 x . $ <eq:shear>]

On a sufficiently small fixed neighborhood of the center, the preceding low bounds imply

#[#set math.equation(numbering: n => "(4.5)")
 $ lr(|q - q_0|) lt.eq frac(1, 10 L) \, #h(2em) sqrt(- a) gt.eq v_(*) . $ <eq:central-bounds>]

The second inequality follows from (2.3) and (4.1). In these coordinates,

#[#set math.equation(numbering: n => "(4.6)")
 $ H_(theta theta) = H_(y y) \, #h(2em) H_(xi theta) = \( q - q_0 \) H_(y y) \,\
H_(xi xi) = d_0 H_(y y) \, #h(2em) d_0 = \( q - q_0 \)^2 + a . $ <eq:sheared-hessian>]

Because $\( 10 L \)^(- 1) lt.eq v_(*) \/ 1000$, $d_0 < 0$ is separated from zero. Solving the height equation in the other direction gives

#[#set math.equation(numbering: n => "(4.7)")
 $ z_(theta theta) = Q_g \( xi \, theta \, z_i \, z_(xi xi) \, z_(theta xi) \) = Gamma_(theta theta)^i z_i + frac(H_(theta xi)^2 + \( K det g \) \( 1 - lr(|d z|)_g^2 \), H_(xi xi)) . $ <eq:Q>]

Its second-jet partial derivatives, at a solution, are

#[#set math.equation(numbering: n => "(4.8)")
 $ P_1 = Q_(z_(theta xi)) = frac(2 \( q - q_0 \), d_0) \, #h(2em) S_1 = Q_(z_(xi xi)) = - 1 / d_0 > 0 . $ <eq:hyperbolic-coefficients>]

They have bounded first derivatives; $S_1$ has a positive lower bound. The following convenient speed bound follows from (4.5):

#[#set math.equation(numbering: n => "(4.9)")
 $ lr(|P_1|) + sqrt(S_1) lt.eq 4 \/ v_(*) < L \/ 4 . $ <eq:speed-bound>]

Choose $r > 0$ small enough that the slab

#[#set math.equation(numbering: n => "(4.10)")
 $ - r lt.eq theta lt.eq r \, #h(2em) lr(|xi|) lt.eq L r $ <eq:slab>]

and fixed margins lie in the preceding neighborhood and inside $cal(P)$. We also require $r < 1 \/ 2$. Along a flow line from (3.3), $D theta = q_0 - q$, whereas $theta = s$ when $t = 0$. The global bound $lr(||) q lt.eq 1 \/ 100$ keeps these flow segments in that neighborhood after a further shrinking of $r$. Thus throughout the slab

#[#set math.equation(numbering: n => "(4.11)")
 $ lr(|s - theta|) lt.eq r \/ 4 . $ <eq:s-theta>]

In fact the bound $r \/ 10$ follows from its $t$-length at most $L r$.

=== 4.2 The test metrics and smooth data at the pulse edges <the-test-metrics-and-smooth-data-at-the-pulse-edges>

Choose a nonzero real $chi_0 in C_c^oo \( \( - L r \/ 8 \, L r \/ 8 \) \)$ and a nonnegative $phi.alt_0 in C_c^oo \( \( - 1 \, 1 \) \)$ with $integral phi.alt_0 > 0$. For small fixed $delta > 0$ and integers $tau arrow.r oo$, the test metrics are

#[#set math.equation(numbering: n => "(4.12)")
 $ tilde(g)_tau = g_(*) + tau^(- N) chi_0 \( xi \) phi.alt_0 \( tau theta \/ delta \) cos \( tau xi \) thin upright(d) theta^2 . $ <eq:pulse>]

Choose the fixed integer $N > 10$ larger than every derivative order in one basic neighborhood of $g_(*)$ contained in $cal(O)$. For each fixed $delta$, the test metrics then belong to $cal(O)$ for all sufficiently large $tau$. Only finitely many seminorms are involved in this assertion.

By the closure assumption choose $g_tau in cal(A)_(M \, q_0)$ such that

#[#set math.equation(numbering: n => "(4.13)")
 $ ∥g_tau - tilde(g)_tau∥_(C^tau \( S \)) lt.eq tau^(- tau) \, $ <eq:approximation>]

and choose a corresponding height $z_tau$ with (4.1) and (4.3). We suppress its subscript when deriving estimates. All comparisons using finitely many low derivatives hold uniformly for large $tau$. Their limiting constants can be chosen independently of the fixed small $delta$, since $N > 10$.

Away from the pulse rectangle

$ lr(|theta|) lt.eq delta \/ tau \, #h(2em) lr(|xi|) lt.eq L r \/ 8 \, $

the metrics have uniform bounds at every fixed derivative order. By (4.11), every point of that rectangle has $lr(||) s < r \/ 2$ for large $tau$, in every solution’s flow chart. Consequently the image of every compact rectangle in $\( - 2 \, 2 \) times \( - 2 \, - r \/ 2 \)$, or in $\( - 2 \, 2 \) times \( r \/ 2 \, 2 \)$, misses the pulse support. On all such images, $g_tau$ differs from the fixed metric $g_(*)$ only by the approximation error (4.13). This verifies the metric hypothesis of 3 throughout both caps, with $b_(*) = - r \/ 2$. The proposition gives bounds for every derivative of $z$ on the two cuts

#[#set math.equation(numbering: n => "(4.14)")
 $ theta = plus.minus r \, #h(2em) lr(|xi|) lt.eq L r . $ <eq:cap-cuts>]

These cuts lie in compact subsets of the respective flow-coordinate caps, uniformly over the solutions. 3 shows the cuts and the pulse inside the negative-curvature slab.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-2, -1.512), (2, 1.512), fill: rgb("#fff5eb"), stroke: none)
  rect((-2, -1.512), (2, 1.512), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((-2, -1.512), (2, -1.512), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((-2, 1.512), (2, 1.512), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((-2, -1.512), (-1.15, -0.1456), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((2, -1.512), (1.15, -0.1456), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-2, 1.512), (-1.15, 0.1456), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((2, 1.512), (1.15, 0.1456), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((-0.475, -0.1456), (0.475, 0.1456), fill: rgb("#ffc68c"), stroke: none)
  rect((-0.475, -0.1456), (0.475, 0.1456), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-2.25, 0), (2.35, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((2.35, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$xi$]]], anchor: "west", padding: 0.1176cm)
  line((0, -1.904), (0, 1.96), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((0, 1.96), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$theta$]]], anchor: "south", padding: 0.1176cm)
  content((-2.087, -1.512), [#text(size: 9pt)[$-r$]], anchor: "east", padding: 0.1176cm)
  content((-2.087, 1.512), [#text(size: 9pt)[$r$]], anchor: "east", padding: 0.1176cm)
  content((0, 1.176), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[upper data]]])])
  content((0, -1.176), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[lower data]]])])
  line((1.125, 0.3136), (0.425, 0.0896), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.9, 0.392), [#text(size: 9pt)[pulse]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 3: The hyperbolic slab, schematically and not to scale. Cap regularity gives smooth data on the two cuts $theta = plus.minus r$. The dashed lines indicate the shrinking spatial intervals used to propagate those data toward both pulse edges. The pulse is supported in $lr(|theta|) < delta \/ tau$ and oscillates in $xi$. The entire slab lies in negative curvature. ],
) <fig:pulse>

#thm([Lemma 4.1.])[
  (Propagation to the pulse).  #emph[At $theta = plus.minus delta \/ tau$, on $lr(|xi|) lt.eq L r \/ 2$, the functions $z \, z_theta$ have uniform bounds for every tangential derivative.]
] <lem:propagation>

#proof[
  We record the energy argument, which will also be used on the pulse. If $v$ satisfies
  $ v_(theta theta) - P_1 v_(theta xi) - S_1 v_(xi xi) = b^theta v_theta + b^xi v_xi + R \, $
  with the above coefficient bounds and bounded $b^i$, use the energy density and flux
  $ e = frac(v_theta^2 + S_1 v_xi^2, 2) \, #h(2em) j = frac(P_1 v_theta^2, 2) + S_1 v_xi v_theta . $
  One has $lr(||) j lt.eq \( lr(|P_1|) + sqrt(S_1) \) e$. Integrate on intervals whose endpoints move inward at speed $L \/ 4$. Multiplication by $v_theta$ and integration by parts, with the nonpositive boundary loss discarded, gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ cal(E)' \( theta \) lt.eq C cal(E) \( theta \) + sqrt(2 cal(E) \( theta \)) thin ∥∥ R_(L^2) \, #h(2em) cal(E) \( theta \) = integral e thin upright(d) xi . $ <eq:energy>]
  Thus $sqrt(cal(E))$ is controlled by its initial value and the time integral of $∥∥ R_2$, with a Gronwall factor. One can justify division at zero energy by first using $sqrt(cal(E) + eta)$ and then letting $eta arrow.b 0$.
  Apply this estimate to $v = partial_xi^j z$, $j gt.eq 8$, obtained by differentiating (4.7). The top second-jet terms give the principal coefficients in (4.8). If a second-jet argument receives $j - 1$ differentiations, it gives $v_xi$ or $v_theta$; put these terms, together with the direct first-jet linearization, into $b^i partial_i v$. Their coefficients use only bounded low derivatives. Put $V = \( z_xi \, z_theta \)$. Every remaining solution factor is a spatial derivative of $V$ of order at most $j - 1$, already controlled by the induction. A factor of order $j - 1$ requires at least $j - 2$ of the differentiations, since a second-jet argument is already one spatial derivative of $V$. There cannot be two such factors, because $2 \( j - 2 \) > j$. Bound that factor in $L^2$, if it occurs. All other factors have order at most $j - 2$, so the one-dimensional Sobolev inequality and the available $H^(j - 1)$ bound for $V$ control them in supremum norm. This gives the $L^2$ bound for the remainder in (4.15). The same moving interval is used at every derivative order; its length has a fixed positive lower bound, so the one-dimensional Sobolev constants are uniform.
  The initial first-jet bounds through spatial order seven follow from the $C^8$ class bound. For each larger order, the initial energy on the cut $theta = - r$ is bounded by the cap estimate. The metric derivatives are bounded on $- r lt.eq theta lt.eq - delta \/ tau$, so (4.15) closes the spatial induction there. The intervals start as $\[ - L r \, L r \]$ and lose at most $L r \/ 4$ at each end, leaving room for Sobolev estimates on $lr(|xi|) lt.eq L r \/ 2$. Reverse time and start at $theta = r$ to obtain the same bounds at the upper pulse edge. ◻
]

=== 4.3 A comparison across the thin strip <a-comparison-across-the-thin-strip>

On $lr(|xi|) lt.eq L r \/ 2$, construct a smooth comparison $z^0$ on $- delta \/ tau lt.eq theta lt.eq delta \/ tau$ with the same data $\( z \, z_theta \)$ at $theta = - delta \/ tau$, satisfying (4.7) for the fixed metric $g_(*)$ up to $O \( tau^(- N) \)$. For this purpose take the time Taylor polynomial of degree $N + 1$ at the initial edge. Recursively determine its higher coefficients from (4.7), using $g_(*)$. At step $k$, for $0 lt.eq k lt.eq N - 1$, differentiating the right side $k$ times determines the time derivative of order $k + 2$ from those through order $k + 1$ and their spatial derivatives. This is possible because $Q_g$ contains no second time derivative. The denominator at the initial data stays separated from zero by metric closeness and (4.6). The coefficients and each fixed spatial derivative are uniformly bounded by 7. The denominator remains nonzero on the short strip. The recurrence makes the residual and its first $N - 1$ time derivatives vanish at the initial edge. Taylor’s formula on a strip of length $2 delta \/ tau$ gives the claimed $O \( tau^(- N) \)$ bound for fixed $delta$. In particular, $z_theta^0$ at the final edge has bounds for all fixed spatial derivatives.

Put $w = z - z^0$. Move $Q_(g_(*)) \( z \) - Q_(g_(*)) \( z^0 \)$ to the linearized side, using mean partial derivatives along the segments between their argument vectors $\( z_i \, z_(xi xi) \, z_(theta xi) \)$. This yields

#[#set math.equation(numbering: n => "(4.16)")
 $ w_(theta theta) - P_2 w_(theta xi) - S_2 w_(xi xi) + beta^i partial_i w = Q_(g_tau) \( z \) - Q_(g_(*)) \( z \) + O \( tau^(- N) \) \, $ <eq:w-equation>]

with zero Cauchy data at the lower edge. Here $S_2 > 0$ has a uniform lower bound; the coefficients are bounded and $P_2 \, S_2$ have bounded first derivatives. To see the positivity, the $C^8$ bound keeps the actual argument vector close throughout the strip to its initial value. The same is true of the polynomial, by its coefficient bounds. The argument vectors agree at the initial edge, because the Cauchy data agree. At this common value, $Q_(g_(*) \, z_(xi xi)) > 0$ by metric closeness and (4.8). Continuity keeps it positive on all the intervening segments, on which the denominator also remains separated from zero. It is not necessary that those segments consist of solutions.

A fixed speed bound larger than the one in (4.9) therefore applies to (4.16). The limiting bounds for the zeroth-order coefficient values and the positive lower bound for $S_2$ are independent of the fixed small $delta$.

=== 4.4 The curvature forcing and its moment <the-curvature-forcing-and-its-moment>

In the linear coordinates $xi \, theta$, the curvature tensor formula gives

#[#set math.equation(numbering: n => "(4.17)")
 $ K det g = partial_(xi theta) g_(xi theta) - frac(partial_xi^2 g_(theta theta) + partial_theta^2 g_(xi xi), 2) + cal(L) \( g \, partial g \) \, $ <eq:curvature-density>]

where $cal(L)$ is smooth for positive metric matrices. Since (4.12) changes only $g_(theta theta)$, its principal contribution is $- 1 / 2 partial_xi^2$ of the scalar pulse. Consequently the right side of (4.16) equals

#[#set math.equation(numbering: n => "(4.18)")
 $ tau^(2 - N) D_tau chi_0 \( xi \) phi.alt_0 \( tau theta \/ delta \) cos \( tau xi \) + o \( tau^(2 - N) \) \, #h(2em) D_tau = frac(1 - lr(|d z|)_(g_(*))^2, 2 H_(xi xi) \( g_(*) \, z \)) . $ <eq:forcing>]

The error is uniform in space and time as $tau arrow.r oo$ for each fixed $delta$. Metric changes involving at most one derivative are $O_delta \( tau^(1 - N) \)$; the approximation (4.13) and the Taylor residual are smaller.

There are constants $c_D \, C_D > 0$, independent of fixed small $delta$, such that for all large $tau$

$ c_D lt.eq lr(|D_tau|) lt.eq C_D \, $

and $D_tau$ has one sign throughout the strip used. Indeed the numerator is bounded below by the $E$ bound, uniform metric bounds, and metric closeness. The denominator has the sign opposite to $H_(y y)$, by $d_0 < 0$, and stays nonzero when $g_tau$ is replaced by $g_(*)$. The sign of $H_(y y)$ is constant on the connected square. Upper and lower bounds follow from the same low estimates.

Apply the zero-data estimate (4.15) to (4.16), shrinking intervals from $\[ - L r \/ 2 \, L r \/ 2 \]$ at a fixed sufficiently large speed. They contain $"supp" chi_0$ throughout the strip for large $tau$. Its source has $L^2$ size $O \( tau^(2 - N) \)$, so

#[#set math.equation(numbering: n => "(4.19)")
 $ ∥partial w∥_(L^2) lt.eq \( C_2 + o \( 1 \) \) delta tau^(1 - N) $ <eq:short-energy>]

uniformly in strip time. Here $C_2$ can be chosen independently of small fixed $delta$: the strip length is $2 delta \/ tau$, and every Gronwall factor tends to one for fixed $delta$. Finite coefficient derivative bounds depending on that $delta$ are therefore harmless.

Integrate (4.16) against $psi_tau \( xi \) = chi_0 \( xi \) cos \( tau xi \)$ over space and strip time. The $w_(theta theta)$ term is

$ integral psi_tau \( xi \) w_theta \( xi \, delta \/ tau \) thin upright(d) xi \, $

because the initial data vanish. Both $z_theta$ and $z_theta^0$ at the final edge have uniform spatial bounds of every fixed order. Repeated integration by parts therefore makes this term $o \( tau^(1 - N) \)$.

For each other second-order term, integrate one spatial derivative by parts. The derivative of $psi_tau$ costs $O \( tau \)$. By (4.19) and the strip length, the total absolute cost is at most

#[#set math.equation(numbering: n => "(4.20)")
 $ \( C_3 + o \( 1 \) \) delta^2 tau^(1 - N) . $ <eq:moment-error>]

The constant $C_3$ is independent of small fixed $delta$; terms with a derivative on a coefficient and the first-order terms have an additional factor $tau^(- 1)$ for fixed $delta$. The spatial test is compactly supported, so there is no spatial boundary contribution.

In contrast, (4.18) paired with $psi_tau$ has absolute integral at least

#[#set math.equation(numbering: n => "(4.21)")
 $ \( c_3 + o \( 1 \) \) delta tau^(1 - N) \, #h(2em) c_3 > 0 \, $ <eq:moment-lower>]

with $c_3$ independent of small fixed $delta$. This follows from the constant sign and lower bound of $D_tau$, the nonnegativity and positive integral of $phi.alt_0$, and

$ integral chi_0 \( xi \)^2 cos^2 \( tau xi \) thin upright(d) xi arrow.r 1 / 2 integral chi_0 \( xi \)^2 thin upright(d) xi > 0 . $

No convergence of $D_tau$ is needed.

Choose $delta > 0$ so small that $C_3 delta < c_3 \/ 2$, and then let $tau arrow.r oo$. Equations (4.20) and (4.21) contradict (4.16). The order of choices is summarized in 1. In particular, no convergence in every smooth seminorm was required of the test metrics, and no convergence or common sign across different $tau$ was required of $D_tau$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[Quantities fixed
], table.cell(rowspan: 1, colspan: 1)[Dependence permitted
]),
  table.cell(rowspan: 1, colspan: 1)[First
], table.cell(rowspan: 1, colspan: 1)[Class, neighborhood, $g_(*)$, slab, cutoffs, $N$
], table.cell(rowspan: 1, colspan: 1)[Fixes leading constants $C_2 \, C_3 \, c_3$, independent of sufficiently small fixed $delta$.
],
  table.cell(rowspan: 1, colspan: 1)[Second
], table.cell(rowspan: 1, colspan: 1)[$delta > 0$, with $C_3 delta < c_3 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[Subsidiary derivative bounds may depend on this fixed $delta$.
],
  table.cell(rowspan: 1, colspan: 1)[Last
], table.cell(rowspan: 1, colspan: 1)[Integers $tau arrow.r oo$
], table.cell(rowspan: 1, colspan: 1)[Thresholds and little-oh errors may depend on $delta$; the leading constants do not.
],
)
]],
  caption: [Table 1: Parameter order in the pulse contradiction. Every derivative order has its own bound; no single bound for all orders is asserted. ],
)

We have proved that every $cal(A)_(M \, q_0)$ is nowhere dense. Their countable union contains every metric admitting an admissible height. Baire’s theorem now proves 2.

== 5 Assembly of a smooth metric germ <sec:assembly>

We now turn the whole-patch obstruction into one metric germ. There are two levels of accumulation: obstructed patches approach every boundary point of each negative disk, and the disks approach the origin. Summable bounds in each derivative order will preserve smoothness at both levels. We first recall the elementary prescribed-curvature construction used in #cite(label("Khuri2009")) p. 453.

#thm([Lemma 5.1.])[
  (Prescribing small curvature).  #emph[Let $K_0 in C^oo \( \( - 1 \, 1 \)^2 \)$ with $∥K_0∥_oo lt.eq 10^(- 3)$. There is a smooth positive metric 
$ macron(g) = thin upright(d) X^2 + f \( X \, Y \)^2 thin upright(d) Y^2 $

 whose curvature is $K_0$. Its eigenvalues have positive uniform lower and upper bounds.]
] <lem:prescribe>

#proof[
  Solve the ordinary differential equation with parameter $Y$,
  #[#set math.equation(numbering: n => "(5.1)")
   $ f_(X X) = - K_0 f \, #h(2em) f \( 0 \, Y \) = 1 \, #h(2em) f_X \( 0 \, Y \) = 0 . $ <eq:prescribe-ode>]
  Smooth parameter dependence gives smoothness. On any segment joining $0$ to $X$, let $F$ be the supremum of $lr(||) f$. The integral equation gives
  $ sup lr(|f - 1|) lt.eq 10^(- 3) F \, #h(2em) F lt.eq 1 + 10^(- 3) F . $
  Thus $f$ stays uniformly close to one and, in particular, strictly positive. Computing the Christoffel symbols of $thin upright(d) X^2 + f^2 thin upright(d) Y^2$ gives $K_(macron(g)) = - f_(X X) \/ f$. This formula holds also when $f$ depends on $Y$. Equation (5.1) proves the assertion. ◻
]

=== 5.1 Placement and smooth summation <placement-and-smooth-summation>

Use the fixed coordinates $X \, Y$ on $\( - 1 \, 1 \)^2$. Let $cal(D)_j$, $j gt.eq 1$, be the round disks with centers $\( 2^(- j) \, 0 \)$ and radii $2^(- j - 4)$. They have disjoint closures and disjoint slightly larger neighborhoods whose closures avoid the origin, and converge to the origin without containing it.

Choose a finite set of rotations whose first-axis lines form an angular net of mesh less than $1 \/ 1000$. Place countably many affine patch maps

$ Phi_n \( x \, y \) = c_n + lambda_n R_n \( x \, y \) \, #h(2em) lambda_n > 0 \, $

where $R_n$ belongs to this finite set, with the following properties:

+ the images of $\[ - 4 \, 4 \]^2$ have disjoint closures and lie outside all the closed disks;
+ for every $j$, every $b in partial cal(D)_j$, and every rotation in the net, a sequence of full patches with that rotation converges to $b$, with diameters tending to zero.

To obtain this placement, use disjoint thin annuli outside each $cal(D)_j$, within its larger neighborhood, converging to its boundary. In each annulus choose finitely many distinct centers so that those assigned each rotation form a successively finer angular net on the circle. Their number is finite, so all square sizes can be chosen small enough to give disjoint closed patches inside that annulus. This proves both properties. 4 separates the two levels of the construction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.2, 0), (4.1, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((4.1, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$X$]]], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  content((0, -0.1411), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  circle((3.2, 0), radius: 0.2, fill: rgb("#ffe8d1"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.2, 0.3528), [#text(size: 9pt)[$cal(D)_1$]], anchor: "south", padding: 0.1176cm)
  circle((1.6, 0), radius: 0.1, fill: rgb("#ffe8d1"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.6, 0.3528), [#text(size: 9pt)[$cal(D)_2$]], anchor: "south", padding: 0.1176cm)
  circle((0.8, 0), radius: 0.05, fill: rgb("#ffe8d1"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.8, 0.3528), [#text(size: 9pt)[$cal(D)_3$]], anchor: "south", padding: 0.1176cm)
  circle((0.4, 0), radius: 0.025, fill: black, stroke: none)
  circle((0.2, 0), radius: 0.0125, fill: black, stroke: none)
  line((2.6, -0.5), (0.6, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((2, -1.05), [#text(size: 9pt)[\(a\) Disks approaching the origin]])
  circle((7.1, 0.18), radius: 0.67, fill: rgb("#ffe8d1"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((7.1, 0.18), radius: 0.9, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((7.1, 0.18), radius: 1.23, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((7.976, 0.3073), (8.042, 0.3733), fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((8.357, 0.3014), (8.427, 0.4227), (8.305, 0.4927), (8.235, 0.3714), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((7.681, 0.842), (7.738, 0.875), (7.705, 0.9321), (7.648, 0.8991), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((7.833, 1.068), (7.973, 1.208), fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((7.112, 1.058), (7.145, 1.115), (7.088, 1.148), (7.055, 1.091), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((7.074, 1.334), (7.196, 1.404), (7.126, 1.526), (7.004, 1.456), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((6.483, 0.8466), (6.547, 0.8637), (6.53, 0.9275), (6.466, 0.9104), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((6.346, 1.052), (6.382, 1.187), (6.247, 1.223), (6.211, 1.088), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((6.191, 0.2936), (6.238, 0.3403), (6.191, 0.3869), (6.144, 0.3403), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((5.819, 0.3113), (5.955, 0.3476), (5.918, 0.4828), (5.783, 0.4466), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((6.324, -0.3219), (6.341, -0.2582), (6.277, -0.2411), (6.26, -0.3048), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((6.017, -0.544), (6.116, -0.445), (6.017, -0.346), (5.918, -0.445), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((6.751, -0.7203), (6.817, -0.6543), fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((6.647, -1.09), (6.768, -1.02), (6.698, -0.899), (6.577, -0.969), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((7.428, -0.7324), (7.461, -0.6753), (7.404, -0.6423), (7.371, -0.6994), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((7.458, -1.065), (7.598, -0.9246), fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((7.887, -0.3266), (7.944, -0.2936), (7.911, -0.2364), (7.854, -0.2694), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((8.208, -0.5406), (8.278, -0.4194), (8.157, -0.3494), (8.087, -0.4706), close: true, fill: rgb("#ebebff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((7.1, 0.18), [#text(size: 9pt)[$cal(D)_j$]])
  content((7.1, -1.37), [#text(size: 9pt)[\(b\) Patches approaching a disk]])
})],
  caption: [Figure 4: The two accumulation levels, schematically and not to scale. The disks in (a) are disjoint and avoid the origin. In (b), disjoint full patches occupy successive annuli outside one disk. Only a few patches and annuli are shown. Patch orientations are independent of their positions around the disk; the actual construction approaches every boundary point in every direction of a fixed finite rotation net. ],
) <fig:accumulation>

Now prescribe $K_0$. In each $cal(D)_j$ choose a smooth negative bump, strictly negative throughout the disk and flat on its boundary. In each patch choose a smooth bump supported in $Phi_n \( \( - 4 \, 4 \)^2 \)$, equal on a neighborhood of $Phi_n \( \[ - 3 \, 3 \]^2 \)$ to

#[#set math.equation(numbering: n => "(5.2)")
 $ K_0 \( Phi_n \( x \, y \) \) = kappa_n \( x^2 - h \( y \) \) \, #h(2em) kappa_n > 0 . $ <eq:patch-K0>]

The amplitudes of all disk and patch bumps can be chosen so that their sum is smooth and $∥K_0∥_oo lt.eq 10^(- 3)$. Here is a precise choice. Enumerate the unscaled, globally smooth bump profiles, extended by zero, as $k_n$. Choose positive numbers $epsilon.alt_n$ such that

$ ∥epsilon.alt_n k_n∥_(C^m) lt.eq 10^(- 3) 2^(- n) #h(2em) \( 0 lt.eq m lt.eq n \) . $

There are only finitely many restrictions at stage $n$. For each fixed $m$, the resulting series of derivatives has a uniformly summable tail. Its sum is $C^oo$, including on all accumulation sets. Disjointness of the supports preserves the strict negativity inside each disk and the exact profiles (5.2). Every summand is flat at each disk-boundary point at which its support can accumulate, so

$ K_0 = 0 #h(2em) upright("on ") partial cal(D)_j $

for every $j$.

Apply 8 to obtain $macron(g)$. For each patch, the actual pullback $g_(0 \, n) = Phi_n^(*) macron(g)$ has curvature

$ K_(g_(0 \, n)) = K_(macron(g)) compose Phi_n = kappa_n \( x^2 - h \( y \) \) . $

Indeed, in coefficient matrices, $g_(0 \, n) = lambda_n^2 R_n^T \( macron(g) compose Phi_n \) R_n$; curvature is a scalar under pullback. This is a background metric of the kind required in 2.

By 2, choose a smooth tensor perturbation $eta_n$ supported in the model box $cal(P)$ such that $g_(0 \, n) + eta_n$ admits no admissible height. Push $eta_n$ to the original coordinates and extend by zero, obtaining $hat(eta)_n$. The extension is smooth because its support is strictly inside the full patch. In matrix notation the pushforward is

$ hat(eta)_n = lambda_n^(- 2) R_n \( eta_n compose Phi_n^(- 1) \) R_n^T . $

Consequently, for each ordinary derivative order $m$,

$ ∥D^m hat(eta)_n∥_oo lt.eq C_m lambda_n^(- m - 2) ∥D^m eta_n∥_oo \, $

where $C_m$ accounts only for the fixed-dimensional component norms and rotation. The perturbation may be chosen arbitrarily small in every prescribed finite collection of seminorms, so these fixed scaling costs can be paid separately on each patch. Require

#[#set math.equation(numbering: n => "(5.3)")
 $ ∥hat(eta)_n∥_(C^m) lt.eq epsilon.alt thin 2^(- n) #h(2em) \( 0 lt.eq m lt.eq n \) \, $ <eq:tensor-sum>]

where $epsilon.alt > 0$ is smaller than half a uniform lower eigenvalue bound for $macron(g)$. The metric

#[#set math.equation(numbering: n => "(5.4)")
 $ g = macron(g) + sum_(n = 1)^oo hat(eta)_n $ <eq:final-metric>]

is therefore smooth and positive. It retains the chosen patch obstruction on every patch: all the other tensor perturbations vanish there. Every tensor perturbation and all its derivatives vanish on each closed disk. Uniform convergence of the derivative series in (5.3) consequently preserves the background metric jets on those disks and their boundaries. Thus

#[#set math.equation(numbering: n => "(5.5)")
 $ K_g < 0 upright(" in ") cal(D)_j \, #h(2em) K_g = 0 upright(" on ") partial cal(D)_j . $ <eq:disk-curvature>]

This construction imposes no lower bound on the individual $kappa_n$, $lambda_n$, or admissible Hessian separations.

=== 5.2 The boundary obstruction <the-boundary-obstruction>

The following graph observation is also used in the geometric construction of #cite(label("NY2002")) Section 2, Step 3. We include its short proof.

#thm([Lemma 5.2.])[
  (A negatively curved disk).  #emph[Suppose a smooth metric on a neighborhood of a closed disk has negative curvature in the disk and zero curvature on its boundary. If an isometric immersion of this neighborhood is a graph over a plane, its second fundamental form is nonzero at some boundary point. At that point it has rank one.]
] <lem:disk>

#proof[
  Let $u$ be the graph function and let $Omega$ be the planar projection of the disk. This is a bounded domain with connected smooth boundary, and $u$ is smooth on a neighborhood of $overline(Omega)$. Suppose the second fundamental form vanishes at every boundary point. The graph formula
  $ upright("II")_(i j) = u_(i j) / sqrt(1 + lr(|D u|)^2) $
  then gives $D^2 u = 0$ along $partial Omega$. Differentiation along this connected curve shows that $D u$ is a fixed vector $a$ there. Hence $u = a dot.op x + c$ on the boundary for a constant $c$.
  The function $v = u - a dot.op x - c$ is zero on $partial Omega$ and has
  $ det D^2 v = det D^2 u < 0 #h(2em) upright("in ") Omega . $
  It cannot vanish identically. If it is nonzero, compactness gives either a positive interior maximum or a negative interior minimum. Its Hessian is semidefinite there, with nonnegative determinant, a contradiction. Thus the second fundamental form is nonzero at some boundary point. The Gauss equation and zero boundary curvature make its determinant zero, so its rank is one. ◻
]

#proof[
  Use the metric (5.4). Suppose that a neighborhood of the origin admits a smooth isometric immersion $F$ into $bb(R)^3$. Projection onto the tangent plane at $F \( 0 \)$ is a local diffeomorphism. After restricting the domain, the immersion is a graph and the projection is a diffeomorphism onto a planar open set. Choose $j$ so large that $overline(cal(D)_j)$ lies in this restricted domain. By (5.5) and 9, there is $b in partial cal(D)_j$ where $upright("II")$ is nonzero and has rank one.
  Let $e$ be the fixed unit normal at $F \( b \)$, and set $z = chevron.l F \, e chevron.r$. By 1, the covariant Hessian $H$ is nonzero and rank one at $b$, while $d z \( b \) = 0$. In particular $1 - lr(|d z|)_g^2 > 0$ nearby.
  Regard $H \( b \)$ as a symmetric form in the fixed $X \, Y$ parameter plane. Choose a rotation in our finite net whose first-axis line makes angle less than $1 \/ 1000$ with its kernel. In that rotated parameter frame, a rank-one form has
  $ H_(y y) \( b \) eq.not 0 \, #h(2em) lr(|H_(x y) \( b \) \/ H_(y y) \( b \)|) = lr(|tan alpha|) < 1 \/ 100 \, $
  where $alpha$ is the angular error. Continuity gives the same strict inequalities in a neighborhood of $b$.
  There are full patches of this orientation converging to $b$. One such patch lies wholly in that neighborhood and in the domain of $F$. Its common dilation of the two axes multiplies all Hessian entries by the same positive factor, leaving their ratio unchanged. In model coordinates the pulled-back height is therefore smooth on a neighborhood of $S$, has $E > 0$, $H_(y y) eq.not 0$, and $lr(||) q lt.eq 1 \/ 100$ throughout $S$. It satisfies the Darboux equation by 1. It is an admissible height for a metric chosen to have none, contradicting 2.
  Thus no neighborhood of the origin admits the asserted smooth isometric immersion. The open square with the smooth positive metric $g$ is the required Riemannian surface. ◻
]

#thm([Corollary 5.3.])[
  (Euclidean Taylor jet).  #emph[The metric in Theorem A can be chosen so that, in the coordinates $X \, Y$, 
$ partial^alpha \( g_(i j) - delta_(i j) \) \( 0 \) = 0 #h(2em) upright("for every multi-index ") alpha in bb(N)_0^2 upright(" and ") i \, j in { 1 \, 2 } . $

 Thus smooth local isometric realizability is not determined by the full Taylor jet of the metric at the base point.]
] <cor:flat-jet>

#proof[
  Every individual curvature bump and every tensor $hat(eta)_n$ vanishes on a neighborhood of the origin. The uniform convergence of each derivative series therefore gives
  $ partial^alpha K_0 \( 0 \) = 0 \, #h(2em) partial^alpha #scale(x: 180%, y: 180%)[\(] sum_n hat(eta)_n #scale(x: 180%, y: 180%)[\)] \( 0 \) = 0 $
  for every multi-index $alpha$. It remains to check the background metric $macron(g) = thin upright(d) X^2 + f^2 thin upright(d) Y^2$. The initial conditions in (5.1) give $partial_X^a partial_Y^b \( f - 1 \) \( 0 \) = 0$ for $a = 0 \, 1$ and every $b gt.eq 0$. For $a gt.eq 2$, the same equation yields
  $ partial_X^a partial_Y^b \( f - 1 \) \( 0 \) = - partial_X^(a - 2) partial_Y^b \( K_0 f \) \( 0 \) = 0 \, $
  since every term in the Leibniz expansion contains a derivative of $K_0$ at the origin. Hence $f - 1$, and therefore $macron(g)_(i j) - delta_(i j)$, has zero derivatives of every order there. Adding the tensor series preserves this property. The Euclidean metric itself admits an isometric immersion into $bb(R)^3$, whereas the constructed metric does not on any neighborhood of the origin. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
