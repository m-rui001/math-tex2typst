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

#align(center)[#text(size: 16pt, weight: "bold")[Bounded scalar curvature and smooth extension \
of four-dimensional Ricci flow]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A Ricci flow is a family of Riemannian metrics satisfying $partial_t g = - 2 "Ric" \( g \)$. Its scalar curvature $R = "tr"_g "Ric"$ controls the infinitesimal change of volume, whereas its full curvature tensor controls smooth continuation. The scalar-curvature extension problem asks whether a uniform scalar bound prevents a finite-time singularity. We prove its positive resolution on closed manifolds in real dimension four.

#thm([Theorem 1.1.])[
  (Smooth extension).  #emph[Let $M$ be a closed connected smooth four-manifold, let $0 < T < oo$, and let $g \( t \)$, $0 lt.eq t < T$, be a smooth Ricci flow with smooth initial metric. If 
$ sup_(M times \[ 0 \, T \)) \| R \( g \( t \) \) \| < oo \, $

 then there are $epsilon > 0$ and a smooth Ricci flow $tilde(g) \( t \)$ on $M$, $0 lt.eq t < T + epsilon$, such that $tilde(g) \( t \) = g \( t \)$ for every $t < T$.]
] <thm:extension>

The same conclusion holds without connectedness. The closed manifold $M$ has finitely many connected components, each a closed smooth four-manifold. The restricted flows satisfy the hypotheses of Theorem 1 at the common time $T$, so each extends to $T + epsilon_j$ for some $epsilon_j > 0$. Taking $epsilon = min_j epsilon_j$ and combining these flows gives the required extension on $M$.

#thm([Corollary 1.2.])[
  #emph[If a Ricci flow on a closed smooth four-manifold has finite maximal smooth existence time $T$, then 
$ limsup_(t arrow.t T) max_(x in M) R \( g \( t \) \) \( x \) = + oo . $

]
] <cor:scalar-blowup>

#proof[
  The equation $\( partial_t - Delta \) R = 2 \| "Ric" \|^2$ and the maximum principle give a scalar lower bound on a finite time interval. A finite upper limit in the assertion would therefore give a uniform absolute bound near $T$, and smoothness supplies the bound on the remaining compact time interval. The componentwise extension just described contradicts maximality. ◻
]

=== 1.1 The extension problem and its geometric obstruction <the-extension-problem-and-its-geometric-obstruction>

Hamilton introduced Ricci flow and established its short-time existence on closed manifolds #cite(label("Hamilton1982")). A compact flow continues while its full curvature remains bounded. Šešum showed that a uniform bound for the Ricci tensor also suffices #cite(label("Sesum2005")). A scalar bound is weaker: in a possible curvature blowup, the scalar curvature may vanish after rescaling while the full curvature stays nonzero. The limiting geometry can therefore be Ricci-flat without being flat.

Bamler and Zhang developed heat-kernel and curvature estimates under scalar bounds, including the four-dimensional energy and compactness theory #cite(label("BamlerZhangI")) #cite(label("BamlerZhangII")). Their work also gives smooth extension when $H_2 \( M \; bb(F) \) = 0$ for every field $bb(F)$ #cite(label("BamlerZhangI")) arXiv version, Corollary 1.10. Simon constructed continuation from the limiting space by an orbifold Ricci flow #cite(label("SimonExtension")). Bamler’s convergence theory gives smooth convergence away from a set of codimension at least four #cite(label("BamlerConvergence")); four-dimensional convergence under spatial scalar-integrability hypotheses is also studied by Liu and Simon #cite(label("LiuSimon")). These compactness conclusions permit concentrated curvature and orbifold points. The assertion here is smooth continuation of the given flow on its original manifold. The scalar extension problem and its known special cases are discussed in #cite(label("LiLiSurvey")) Section 2. Finite-time scalar blowup was established for closed Kähler–Ricci flows by Zhang #cite(label("Zhang2010Kahler")) and for compact Ricci flows with a global Type I bound, $sup_M \| "Rm" \( g \( t \) \) \| lt.eq C \/ \( T - t \)$, by Enders, Müller and Topping #cite(label("EndersMuellerTopping2011")). More recently, Buzano and Di Matteo proved scalar blowup at local Type I singular points without a global Type I assumption #cite(label("BuzanoDiMatteo2026")) Definition 1.4 and Theorem 1.1. Here “local Type I” means $0 < limsup_(t arrow.t T) \( T - t \) r_("Rm") \( p \, t \)^(- 2) < oo$, where $r_("Rm")$ is their parabolic curvature scale at the point $p$. That result addresses a specified blowup regime; the argument below allows unrestricted rates at the hypothetical concentration points.

The spatial degeneration analysis has its origins in the theory of Einstein metrics. Anderson’s compactness theorem produces orbifold limits with smooth convergence on their regular parts #cite(label("Anderson1989")) Theorem C. Bando’s bubbling analysis, including its correction, organizes Ricci-flat bubbles and quantitative necks #cite(label("Bando1990")) #cite(label("BandoCorrection1990")); the work of Bando, Kasue and Nakajima develops coordinates at infinity under curvature decay and volume-growth hypotheses #cite(label("BandoKasueNakajima1989")). Cheeger and Tian’s curvature-energy estimates provide a further important part of this Einstein four-manifold theory #cite(label("CheegerTian2006")). Our slices need not be Einstein. We prove the required geometric statements below using the scalar-bound estimates and retaining the Ricci forcing in the neck argument.

At a hypothetical concentration point, successive spatial rescalings produce a finite tree of Ricci-flat pieces. A vertex represents a nonflat limit; its singular points may contain smaller vertices. The outermost nonflat vertex has a distinguished length scale $a \( t \)$. The central problem is to rule out contraction of this outermost scale while allowing arbitrarily smaller descendants.

=== 1.2 The static functional and the flow estimates <the-static-functional-and-the-flow-estimates>

Retain the true metric from the cluster through an annular collar of radius $b = N a$, with $N$ large and fixed, and attach an asymptotically locally Euclidean end. On that end write the metric in Euclidean quotient coordinates. The renormalized Einstein–Hilbert functional is

$ E \( g \) = lim_(D arrow.r oo) [integral_({ r < D }) R \( g \) thin d mu_g - integral_({ r = D }) \( partial_j g_(i j) - partial_i g_(j j) \) n_i thin d S_delta] . $

The boundary subtraction cancels the scalar curvature’s linear divergence term. The functional scales by the square of the length unit, and its first variation pairs the metric velocity with $1 / 2 R g - "Ric"$.

The companion article #cite(label("StaticTrees")) proves a sequential inequality $E = o \( M \)$ on each fixed limiting tree, where $M$ is its weighted, dimensionless Ricci error. Section 2 records the complete input, including the end weights, derivative orders and matching quotient groups. Our task is both to verify those hypotheses for metrics obtained from the flow and to compare their functional variation with actual spacetime Ricci energy.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.1cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[outermost piece#linebreak()scale $a$]]])])
  content((-2.6, -1.65), [#box(width: 2.1cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[descendant#linebreak()$a e^(-2L_1)$]]])])
  content((2.6, -1.65), [#box(width: 2.1cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[descendant#linebreak()$a e^(-2L_2)$]]])])
  content((-2.6, -3.2), [#box(width: 2.1cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[further descendant#linebreak()$a e^(-2L_1-2L_3)$]]])])
  line((-0.5121, -0.325), (-2.088, -1.325), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((-1.3, -0.825), [#text(size: 9pt)[$L_1$]], anchor: "south-east", padding: 0.1176cm)
  line((0.5121, -0.325), (2.088, -1.325), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((1.3, -0.825), [#text(size: 9pt)[$L_2$]], anchor: "south-west", padding: 0.1176cm)
  line((-2.6, -1.975), (-2.6, -2.875), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((-2.6, -2.425), [#text(size: 9pt)[$L_3$]], anchor: "west", padding: 0.1176cm)
  line((0, 0.325), (0, 0.9), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  line((-1.5, 0.9), (1.5, 0.9), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10))
  content((1.65, 0.9), [#text(fill: rgb("#a65300"))[#text(size: 9pt)[fixed collar#linebreak()$b="Na"$]]], anchor: "west", padding: 0.1176cm)
  line((0, 0.9), (0, 1.7), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((0, 1.7), [#text(size: 9pt)[attached ALE end]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The outermost scale $a$, its smaller descendants, and the material collar at radius $b = N a$. An edge of logarithmic length $L$ changes the length unit by $e^(- 2 L)$. The collar extension preserves the inner geometry and supplies an ALE end. Incidence and scale are schematic. ],
) <fig:scales>

Two flow estimates are decisive. The divergence constraint on Ricci removes the critical radial harmonic mode on a nearly flat annulus. This improves annular decay enough that the loss outside the collar is small compared with the energy inside the root. The exterior is then constructed as an analytic function of the metric on one fixed material collar. Longer exterior coordinates enter only an error estimate. Consequently the extension can be differentiated on time patches without choosing a smoothly varying bubble tree. The collar construction uses the classical compatibility between metric strains and linearized curvature, together with Korn control modulo rigid motions #cite(label("Khavkine2017")) #cite(label("CiarletCiarlet2005")). The scale-specific estimates, filled-space inverse and dependence on the fixed collar are proved in Section 5.

=== 1.3 Proof structure <proof-structure>

Section 3 establishes the scale estimates, genuine orbifold limits and finite trees needed here. It defines a continuous outermost scale and selects buffered time intervals on which that scale changes by a fixed factor. After parabolic normalization, the interval has fixed duration and its root length $a$ tends to zero.

Section 4 controls Ricci on exterior annuli and on the root’s compact and joining regions. A time maximal function converts root spacetime energy into the single-time weighted error required by the static theorem. Section 5 constructs the collar-dependent exterior and proves an error bound independent of its length.

Section 6 applies the static theorem separately to arbitrary sequences of active time patches. If $K^2$ denotes the root spacetime Ricci energy divided by $a^4$, the positive functional variation and its static smallness imply

$ c K^2 lt.eq o \( 1 \) \( K + 1 \)^2 . $

Hence $K arrow.r 0$, without assuming it was bounded. Dense sets of material points then preserve distances at scale $a$ between the two endpoints. The resulting pointed isometry preserves the curvature-radius maximum defining the outermost scale. This contradicts its prescribed factor change. The absence of concentration gives a smooth terminal metric and continuation on $M$.

=== 1.4 Conventions <conventions>

We use $Delta = "tr" nabla^2$. A tensor norm at scale $r$ includes $r^j$ on its $j$th spatial derivative, while leaving its pointwise magnitude unchanged. Tensor magnitudes use the current metric unless specified otherwise. Quotient-chart components are Cartesian components on the Euclidean cover; all constructions are equivariant and descend to the quotient.

Constants may depend on a fixed finite differentiation order. After extraction they may also depend on a fixed finite tree. Uniformity in a sequence index, a length, or the collar factor $N$ is stated where needed. A sequential little-oh is taken after fixing the parameters in its statement.

== 2 The static input and its normalization <sec:static-input>

We record the precise input from the companion article #cite(label("StaticTrees")) Theorem 2.2. Its constants and small exponents belong to one fixed limiting tree. No uniform exponent across different trees is needed. The elementary functional identities are included here to fix the normalizations used in the flow calculation. The remaining static proof, including path selection and the augmented elliptic construction, is supplied by the complete companion.

=== 2.1 The geometric data and the functional <ell:setup>

Let $cal(T)$ be a finite rooted tree of four-dimensional Ricci-flat spaces $\( V_v \, h_v \)$. A vertex has one exterior end and one punctured end for each child. Every end has Cartesian coordinates on a Euclidean annulus modulo a finite subgroup of $O \( 4 \)$ acting freely on $S^3$. The group on a joined end is nontrivial. The two groups on an edge are identified; a fixed orthogonal identification is included in the charts. Put $tau = log r$ on an exterior end and $tau = - log r$ at a puncture. In these charts, in vertex units,

#[#set math.equation(numbering: n => "(2.1)")
 $ h_v = delta + O \( e^(- mu tau) \) $ <ell:end-decay>]

on joined ends, with derivatives at scale, for some $mu > 0$. On the unjoined exterior end of the root we require instead $h_v - delta = O \( r^(- q) \)$, where $q > 1$. All remaining parts are smooth compact manifolds with the indicated boundary collars. Bounds through order $20$ suffice in the data below.

For an edge $e$ from $p$ to $c$, truncate both end coordinates at $tau = L_e$ and identify the boundary collars by

#[#set math.equation(numbering: n => "(2.2)")
 $ x_p = e^(- 2 L_e) x_c \, #h(2em) a_c = a_p e^(- 2 L_e) \, #h(2em) a_(upright("root")) = 1 . $ <ell:scales>]

Thus the metric tensor in vertex units is multiplied by $a_v^2$ in physical units. The physical radius $rho = a_v r$ agrees in both charts, and $tau_p + tau_c = 2 L_e$. Gluing just the boundary faces, with their compatible smooth collars, gives the same manifold.

Consider a sequence of metrics $g$ for which every $L_e arrow.r oo$, which converges to $h_v$ on each compact subset of every open vertex. Assume the same end estimates as in Equation (2.1) on each joining half, and the stated root estimate, with uniform finite derivative bounds. On a compact core put $rho = a_v$. Suppose $M arrow.r 0$ and

#[#set math.equation(numbering: n => "(2.3)")
 $ \| rho^2 "Ric" \( g \) \|_j lt.eq C M cases(delim: "{", e^(- mu tau) \, & upright("on joined half-ends") \,, r^(- q) \, & upright("on the root exterior end") \,, 1 \, & upright("on vertex cores") \,) #h(2em) j = 10 . $ <eq:tree-ricci-error>]

Here the tensor magnitude is physical, and the subscript includes covariant derivatives multiplied by the corresponding powers of $rho$. The metric bounds convert these to coordinate estimates. Decreasing $mu$ or $q$, while retaining $mu > 0$ and $q > 1$, is allowed.

Define, in physical root units,

#[#set math.equation(numbering: n => "(2.4)")
 $ E \( g \) = lim_(D arrow.r oo) {integral_(r < D) R \( g \) thin d mu_g - integral_(r = D) \( partial_j g_(i j) - partial_i g_(j j) \) n_i thin d S_delta} . $ <eq:energy-functional>]

All chart integrals are quotient integrals. The two terms inside the braces need not converge separately.

The boundary subtraction is the mass term in the renormalized Einstein–Hilbert expression discussed by Deruelle and Ozuch #cite(label("DeruelleOzuch2025")) Definition 4.2, Remark 4.3, and Proposition 4.4. Their ALE version of Perelman’s functional also minimizes over an auxiliary potential; the functional $E$ here is the unminimized scalar-curvature-minus-flux expression.

#thm([Lemma 2.1.])[
  (Renormalization and first variation).  #emph[The functional in Equation (2.4) is defined on the preceding metrics. For a variation with the same root decay, 
#[#set math.equation(numbering: n => "(2.5)")
 $ D E_g \( dot(g) \) = integral ⟨1 / 2 R \( g \) g - "Ric" \( g \) \, dot(g)⟩_g thin d mu_g . $ <ell:first-variation>]

 It is invariant under diffeomorphisms isotopic to the identity whose root displacement, including scaled derivatives throughout the isotopy, is $O \( r^(1 - q') \)$ for some $q' > 1$. A global length scaling by $s$, accompanied by a coordinate dilation at infinity restoring the leading tensor $delta$, multiplies $E$ by $s^2$. Under Equation (2.3), $\| E \( g \) \| lt.eq C M$.]
] <ell:functional>

#proof[
  Write $g = delta + p$ on the root end. The scalar-curvature density is
  $ R \( g \) sqrt(det g) = partial_i \( partial_j p_(i j) - partial_i p_(j j) \) + O \( \| p \| \| partial^2 p \| + \| partial p \|^2 \) . $
  The last expression is $O \( r^(- 2 q - 2) \)$ and its radial integral is bounded by $C integral_(r_0)^oo r^(1 - 2 q) thin d r$. This proves convergence. The linear boundary term in the variation of scalar curvature cancels the variation of the subtracted integral. Every remaining boundary product is $O \( D^(2 - 2 q) \)$; it tends to zero. Integration by parts therefore gives Equation (2.5). For a Lie derivative, the contracted Bianchi identity makes the interior divergence vanish. The remaining boundary term vanishes with the stated displacement decay. Integration along the isotopy gives invariance. Changing variables under a dilation in Equation (2.4) gives the scaling law.
  Differentiate this law at $s = 1$. Choose the compensating dilation to be the identity inside a fixed outer root region. Its metric variation equals $2 g$ on the interior and decays like $r^(- q)$ on the root tail. Its pairing with Ricci on the root is integrable by $q > 1$. On a punctured half the interior estimate costs
  $ C M a_p^2 integral_(tau_0)^(L_e) e^(- \( 2 + mu \) tau) thin d tau lt.eq C M a_p^2 . $
  On a child exterior half the corresponding quantity is
  $ C M a_c^2 integral_(tau_0)^(L_e) e^(\( 2 - mu \) tau) thin d tau lt.eq C M a_p^2 \( 1 + L_e \) e^(- min \( 2 + mu \, 4 \) L_e) \, $
  with a harmless change of constant for the fixed lower endpoint. The finite sum of core contributions is bounded as well, since $a_v lt.eq 1$. Equation (2.5) now gives $2 \| E \( g \) \| lt.eq C M$. In particular $E = 0$ when $"Ric" = 0$. ◻
]

#thm([Theorem 2.2.])[
  (Static tree inequality #cite(label("StaticTrees")) Theorem 2.2).  #emph[For the fixed tree and the sequences just specified, 
#[#set math.equation(numbering: n => "(2.6)")
 $ E \( g \) = o \( M \) . $ <ell:little-oh>]

 For $M = 0$ the assertion means $E \( g \) = 0$.]
] <thm:tree-inequality>

The companion proof constructs a finite-dimensional analytic family with complex length parameters. It does not assume that Einstein deformations are unobstructed, or that the given metrics or the coefficients of a fixed core metric are spatially analytic.

The theorem is applied in Proposition 28. There we verify every hypothesis after extracting a fixed tree from an arbitrary sequence of active times and material collars. The root exterior has decay exponent greater than one because it is replaced by the extension of Section 5; the true joining necks retain their own positive decay exponent.

== 3 Small-scale geometry and the outermost scale <sec:geometry>

Throughout this section, $\( M^4 \, g \( t \) \)$, $0 lt.eq t < T$, is the closed Ricci flow under consideration and $\| R \| lt.eq C_R$. Constants may depend on this flow, $T$, and a specified finite differentiation order. They are independent of the small scales subsequently chosen. For a tensor $A$, write $\| A \|_(k \, r) = sum_(j = 0)^k r^j \| nabla^j A \|$; on coordinate annuli the analogous notation uses Cartesian derivatives. We first establish the geometric input needed in the later analytic argument. The bounded-scalar-curvature estimates in #cite(label("BamlerZhangI")) #cite(label("BamlerZhangII")) give background for these estimates; the scale selection, tree organization, and motion assertions needed here are included below.

#prodef([Definition 3.1.])[
  (Spatial curvature radius).  Fix a small cap $l_0 > 0$. At a material point $x in M$ set
  $ l \( x \, t \) = sup { 0 < r lt.eq l_0 : sup_(B_t \( x \, r \)) \| "Rm" \| lt.eq r^(- 2) } . $
  The definition uses the whole spatial ball, not just curvature at its center. The function $l$ is positive and continuous before $T$, and $\| l \( x \, t \) - l \( y \, t \) \| lt.eq d_t \( x \, y \)$. Indeed a ball of radius $r - d_t \( x \, y \)$ at $y$ is contained in the radius-$r$ ball at $x$, and its allowed curvature bound is larger. Continuity in time follows by compactness and smooth dependence of the metric, using radii slightly smaller or larger than the supremum.
] <geom:radius>

#thm([Theorem 3.2.])[
  (Scale estimates and degeneration).  #emph[For a sufficiently small cap and all sufficiently late times, the following conclusions hold.]
  #emph[#emph[Scale and energy bounds.] One has 
#[#set math.equation(numbering: n => "(3.1)")
 $ c r^4 lt.eq "Vol"_t B_t \( x \, r \) & lt.eq C r^4 \, & integral_M \| "Rm" \|^2 thin d mu_t & lt.eq C \,\
\| nabla^k "Rm" \| \( x \, t \) & lt.eq C_k l \( x \, t \)^(- 2 - k) \, & \| nabla^k "Ric" \| \( x \, t \) & lt.eq C_k l \( x \, t \)^(- 1 - k) . $ <geom:volume-energy>]

 Here $0 < r lt.eq l_0$ and each fixed $k$ is allowed. The set ${ l < r }$ is covered by a uniformly bounded number of balls of radius $C r$. Distances converge uniformly to a compact metric quotient $Z$ of the material manifold. Away from finitely many concentration points the metric convergence is smooth.]
  #emph[#emph[Small-scale limits and genuine singularities.] At arbitrary sequences of centers and length scales $h_i arrow.r 0$, with times tending to $T$, a subsequence of the rescaled slices converges to a complete noncollapsed Ricci-flat orbifold, smoothly away from finitely many genuine orbifold points. Each such point has a nontrivial finite group acting freely on $S^3$. A nonflat limit has a single Euclidean quotient end with nontrivial group. A flat limit is a global Euclidean quotient and has at most one exceptional point.]
  #emph[#emph[Finite trees.] Within each concentrating cluster, maximal inequivalent nonflat limits form a finite rooted tree with a unique outermost entry. The joining regions have the quantitative charts of Lemma 7 below.]
] <thm:degeneration>

Sections 3.1–3.2 prove the scale and energy estimates and convergence of distances. Sections 3.3–3.4 establish the small-scale limits and identify their exceptional points as genuine quotient singularities. Section 3.5 completes terminal regular convergence and constructs the finite trees. The remaining subsections use these conclusions to compare the outermost scale in time.

=== 3.1 Heat localization and two-sided persistence of the spatial radius <geom:local-estimates>

The spatial curvature radius does not by itself control a time cylinder. Our first goal is to obtain that control in both time directions, and then to improve the Ricci bound by one power of the spatial radius. We give the heat estimates first so that the curvature-radius argument does not assume curvature-dependent cutoff bounds. Set $n = 4$ for the applications, retaining $n$ temporarily in the heat formulas. If $u = \( 4 pi tau \)^(- n \/ 2) e^(- f)$ is a positive unit-mass conjugate heat density, $partial_tau = - partial_t$ and $partial_tau u = Delta u - R u$, put

$ v = { tau \( 2 Delta f - \| nabla f \|^2 + R \) + f - n } u . $

A direct computation gives

#[#set math.equation(numbering: n => "(3.2)")
 $ \( partial_tau - Delta + R \) v = - 2 tau \| "Ric" + nabla^2 f - g \/ \( 2 tau \) \|^2 u . $ <geom:entropy-identity>]

For completeness, after factoring out $u$ the operator is $D = partial_tau - Delta + 2 nabla f dot.op nabla$. The identities used are

$ f_tau & = Delta f - \| nabla f \|^2 + R - n \/ \( 2 tau \) \,\
D Delta f & = - 2 \| nabla^2 f \|^2 - 2 "Ric" \( nabla f \, nabla f \) + Delta R - 2 "Ric" : nabla^2 f \,\
D \| nabla f \|^2 & = 2 nabla f dot.op nabla R - 2 \| nabla^2 f \|^2 - 4 "Ric" \( nabla f \, nabla f \) \,\
D R & = - 2 Delta R - 2 \| "Ric" \|^2 + 2 nabla f dot.op nabla R . $

The metric term in $partial_tau Delta f$ is $- 2 "Ric" : nabla^2 f$; the contracted Bianchi identity cancels the first-derivative terms. Substitution gives Equation (3.2), including its time direction. This is Perelman’s entropy calculation #cite(label("PerelmanEntropy")) Proposition 9.1.

Consequently $integral v thin d mu_t$ is nondecreasing in forward time. At time zero it has a lower bound uniform for $0 < tau lt.eq T + 1$: writing $phi.alt = sqrt(u)$ and $integral phi.alt^2 = 1$, its expression is

$ tau integral \( 4 \| nabla phi.alt \|^2 + R phi.alt^2 \) - integral phi.alt^2 log phi.alt^2 - n / 2 log \( 4 pi tau \) - n . $

Jensen’s inequality followed by the Sobolev inequality of the fixed initial metric gives this bound, including as $tau arrow.b 0$ by optimizing the coefficient of $parallel nabla phi.alt parallel_2^2$. Solve the conjugate equation backwards from an arbitrary smooth positive terminal density. Monotonicity then gives the same logarithmic Sobolev inequality at every time for $0 < tau lt.eq 1$. Positive approximation allows Lipschitz or nonnegative test functions.

Here are two consequences with their normalizations. If a small ball has arbitrarily small ratio $"Vol" \( B_r \) \/ r^n$, choose a dyadic descendant whose inner half has a definite fraction of its volume and whose ratio is still small. Such a descendant exists: otherwise successive ratios decrease geometrically to zero, contradicting the Euclidean ratio at a smooth center. A tent function supported in this descendant, equal to one on its inner half, has normalized Dirichlet energy $O \( r^(- 2) \)$. Jensen gives $integral phi.alt^2 log phi.alt^2 gt.eq - log "Vol" \( B_r \)$. The logarithmic Sobolev inequality with $tau = r^2$ therefore gives a uniform positive lower volume ratio. Also $integral phi.alt^2 log phi.alt^2 gt.eq - 2 log parallel phi.alt parallel_1$ for $parallel phi.alt parallel_2 = 1$. Optimization in $tau$, using $tau = 1$ when necessary, gives

#[#set math.equation(numbering: n => "(3.3)")
 $ parallel phi.alt parallel_2^(2 + 4 \/ n) lt.eq C \( parallel nabla phi.alt parallel_2^2 + parallel phi.alt parallel_2^2 \) parallel phi.alt parallel_1^(4 \/ n) . $ <geom:nash>]

For both forward ordinary heat and backwards conjugate heat, the $L^1$ norm is bounded by its initial norm times $e^(C h)$, and the derivative of the squared $L^2$ norm in the diffusion direction is at most $- 2 parallel nabla u parallel_2^2 + C parallel u parallel_2^2$. This uses only $partial_t d mu_t = - R thin d mu_t$. Equation (3.3) and integration of the resulting scalar differential inequality give $parallel P_h parallel_(1 arrow.r 2) lt.eq C h^(- n \/ 4)$ for $h lt.eq 1$. Duality with the conjugate equation and composition at the midpoint give the heat kernel bound $K lt.eq C h^(- n \/ 2)$.

For a conjugate kernel with terminal pole $p$, Equation (3.2) also gives $v lt.eq 0$; compare #cite(label("PerelmanEntropy")) Corollaries 9.3–9.4. One may verify the terminal sign without a uniform curvature bound near $T$. Fix the terminal time first, when the flow is smooth, and a positive forward heat test $zeta$. Integration by parts gives

$ integral v zeta = partial_tau (tau integral \( f - n \/ 2 \) zeta u) - 2 tau integral u Delta zeta . $

The kernel upper bound bounds the integral in parentheses from below after division by $tau$. For its upper bound, apply Jensen relative to $\( 4 pi tau \)^(- n \/ 2) e^(- d_(*)^2 \/ \( 4 tau \))$, where $d_(*)^2$ is a smooth function agreeing with squared terminal distance near $p$ and has $p$ as its unique zero. Its mass tends to $1$, and the heat equation, tested against $d_(*)^2 zeta$, gives $tau^(- 1) integral d_(*)^2 zeta u arrow.r 2 n zeta \( p \)$. Hence $limsup integral \( f - n \/ 2 \) zeta u lt.eq 0$. Along a sequence approaching zero the displayed derivative has nonpositive liminf. At this fixed smooth terminal time, $2 tau integral u Delta zeta arrow.r 0$, so the same is true of $integral v zeta$. Equation (3.2) makes $integral v zeta$ nonincreasing in $tau$; hence it is nonpositive at every earlier time. Arbitrary positive forward heat tests now give $v lt.eq 0$. Equivalently,

$ 2 tau f_tau + tau \| nabla f \|^2 - tau R + f lt.eq 0 . $

Integration along the constant material path at $p$ gives $f \( p \, tau \) lt.eq C tau$. The initial term in this integration can also be obtained from the preceding second moment: some point within $O \( sqrt(tau) \)$ of $p$ has bounded $f$; moving from that point to $p$ over a time interval of size $tau$ costs $O \( sqrt(tau) \)$ in the inequality for $sqrt(tau) f$, by completing the gradient square. Letting the starting time tend to zero removes this cost. Thus

#[#set math.equation(numbering: n => "(3.4)")
 $ K \( p \, t \; p \, s \) gt.eq c \( t - s \)^(- n \/ 2) . $ <geom:kernel-diagonal>]

For a forward heat solution $\| U \| lt.eq 1$ over elapsed time $h lt.eq 1$, the cancellation in the Bochner formula gives

$ \( partial_t - Delta \) \| nabla U \|^2 = - 2 \| nabla^2 U \|^2 \, #h(2em) \| nabla U \| lt.eq C h^(- 1 \/ 2) . $

The gradient bound follows by applying the maximum principle to $h \| nabla U \|^2 + C U^2$. To obtain a time derivative bound observe $\( partial_t - Delta \) Delta U = 2 "Ric" : nabla^2 U$ and $\( partial_t - Delta \) R = 2 \| "Ric" \|^2$. For either sign, apply the maximum principle to $Q = h^2 \( plus.minus Delta U + A \| nabla U \|^2 - A R \)$, with fixed large $A$. The negative terms $- 2 A h^2 \( \| nabla^2 U \|^2 + \| "Ric" \|^2 \)$ absorb $2 h^2 "Ric" : nabla^2 U$. The remaining negative Hessian square absorbs $2 h \| Delta U \|$; the already proved gradient bound controls the other elapsed-time terms. At a positive maximum with $Q gt.eq C h$ the resulting upper bound is $C - c Q^2 \/ h^2$, which rules out a first crossing of a sufficiently large multiple of $h$. Therefore

#[#set math.equation(numbering: n => "(3.5)")
 $ \| nabla U \| lt.eq C h^(- 1 \/ 2) \, #h(2em) \| partial_t U \| = \| Delta U \| lt.eq C \/ h . $ <geom:heat-derivatives>]

Take a forward kernel from $\( x \, t - r^2 \)$ and multiply it by $r^n$. On a short slab about $t$ it is bounded, has value at least $c$ at $\( x \, t \)$, has spatial gradient $C \/ r$, time derivative $C \/ r^2$, and integral at most $C r^n$. It is therefore bounded below on a ball of radius $c r$ at time $t$, proving the upper volume bound. Each connected component of a fixed positive superlevel has diameter $O \( r \)$: a connecting path of greater diameter contains arbitrarily many disjoint balls of radius $c' r$, where the function is bounded below; lower volume bounds and the integral estimate bound their number. The same function, using its time derivative bound and slightly nested levels, proves

#[#set math.equation(numbering: n => "(3.6)")
 $ B_(t_1) \( x \, c r \) subset B_(t_2) \( x \, C r \) quad upright("if ") \| t_1 - t_2 \| lt.eq c' r^2 \, $ <geom:rough-ball-transfer>]

in either time direction. Indeed every initial radial path in the smaller ball remains in a positive superlevel at the second time, so its endpoint remains in the same component as $x$.

In particular, for small $l$ there is a nonnegative Lipschitz cutoff on $\[ t - c l^2 \, t \]$, bounded by a fixed constant, with

#[#set math.equation(numbering: n => "(3.7)")
 $ \| nabla chi \| lt.eq C \/ l \, quad c \/ l^2 lt.eq partial_s chi lt.eq C \/ l^2 med upright(" on ") { chi > 0 } \, quad chi \( x \, s \) gt.eq c \, quad "supp" chi subset B_t \( x \, l \) . $ <geom:heat-cutoff>]

Choose the kernel radius to be a small fixed fraction of $l$, subtract a suitable level, add $C' \( s - t \) \/ r^2$, and take the positive part. Keep the final superlevel component containing $x$. Choosing $C'$ larger than the kernel time-derivative constant makes the positive domains monotone in $s$, so extension by zero outside this component is legitimate. The component diameter bound puts its support in $B_t \( x \, l \)$. All constants are independent of the cap $l_0$.

We now bootstrap, rather than assume, the time control needed to use a spatial curvature radius. Fix a tensor-index convention and bootstrap

#[#set math.equation(numbering: n => "(3.8)")
 $ \| partial_t "Rm" \| + C_n \| "Ric" \| \| "Rm" \| lt.eq A l^(- 3) . $ <geom:bootstrap>]

The left side controls the time derivative of the curvature norm. Assume Equation (3.8) at preceding times, set $l = l \( x \, t \)$, and use Equation (3.7). At time $t$, $max chi^2 \| "Rm" \| lt.eq C l^(- 2)$. Choose $B > C$. If this maximum had been larger than $B l^(- 2)$, take its last crossing down to that value, and let $y$ be a maximizing point at the crossing. Put $chi_y = chi \( y \, s \) > 0$. The maximum and the cutoff gradient bound give, for $d_s \( y \, z \) lt.eq c chi_y l$,

$ chi \( z \, s \) gt.eq chi_y \/ 2 \, #h(2em) \| "Rm" \| \( z \, s \) lt.eq 4 B \/ \( chi_y^2 l^2 \) . $

Thus, taking $c_B lt.eq min \( c \, \( 4 B \)^(- 1 \/ 2) \)$,

#[#set math.equation(numbering: n => "(3.9)")
 $ l \( y \, s \) gt.eq c_B chi_y l . $ <geom:no-circularity>]

This inference uses no curvature derivative estimate. At the crossing the positive cutoff contribution to $partial_s \( chi^2 \| "Rm" \| \)$ is at least $c B \/ \( chi_y l^4 \)$, whereas its possible negative curvature contribution is at most $C_B A \/ \( chi_y l^3 \)$ by the bootstrap. Choosing $A l_0$ sufficiently small makes the derivative strictly positive. The upper one-sided derivative of the spatial maximum cannot then permit the crossing. Approximation of the positive-part cutoff, or the corresponding one-sided maximum argument on its positive set, gives the same conclusion. Consequently curvature is bounded by $C l^(- 2)$ on a definite smaller backward parabolic ball at $\( x \, t \)$. Its moving spatial balls are contained in the positive cutoff region by $chi \( x \, s \) gt.eq c$ and the gradient bound.

On this parabolic ball the usual differentiated curvature argument can now be applied without circularity. The connection variation is

$ partial_t Gamma_(i j)^k = - g^(k m) \( nabla_i "Ric"_(j m) + nabla_j "Ric"_(i m) - nabla_m "Ric"_(i j) \) . $

Skew differentiation, the second Bianchi identity, and commuting derivatives give the heat equation for $"Rm"$ and its differentiated equations, with products $nabla^i "Rm" * nabla^(k - i) "Rm"$. At unit scale, after bounds through order $k - 1$, the quantity $\( D + \| nabla^(k - 1) "Rm" \|^2 \) \| nabla^k "Rm" \|^2$, with large fixed $D$, satisfies a differential inequality bounded above by a constant minus a positive multiple of its square. Cauchy’s inequality absorbs the cross-gradient terms. Cutoffs on smaller parabolic balls, whose distance and Laplacian bounds now follow from the curvature bound, prove the derivative estimate inductively; distance cutoffs are interpreted by shortened radial barriers at cut points. This is the local derivative argument of #cite(label("Shi1989")).

The coordinate estimates used here have a uniform radius. Normalize a smaller controlled curvature ball by the length $l$. On a fixed ball in these units, sectional curvature is bounded above and below, and every sufficiently small contained ball has volume at least $c r^4$. The local injectivity estimate of Cheeger–Gromov–Taylor #cite(label("CheegerGromovTaylor1982")) Theorem 4.3 therefore gives a positive uniform injectivity radius on a further smaller ball. To check its local hypotheses, reserve a fixed outer ball within the curvature bound and choose all comparison radii below its conjugate-radius bound. The upper sectional bound supplies that bound; the lower sectional bound controls the volume of the pulled-back tangent ball in the theorem’s loop estimate, while the lower ball-volume bound controls its denominator. Closedness supplies compactness of the smaller closed balls. No curvature bound outside this controlled region is used. Returning to original units gives normal radius $c l$. Differentiating radial Jacobi equations then gives the higher coordinate bounds from the covariant curvature bounds.

At this stage the crude estimates $\| nabla^k "Ric" \| lt.eq C_k l^(- 2 - k)$ follow by contraction from the curvature estimates. These already suffice, after dilation to unit scale, to integrate the metric and connection equations in a fixed initial normal chart for a time of order $l^2$. Consequently the chart coefficients and all needed derivatives stay uniformly controlled, and smooth spacetime cutoffs with the usual scaled bounds are available before the improved Ricci estimate is proved.

The lower-index Ricci tensor satisfies

#[#set math.equation(numbering: n => "(3.10)")
 $ partial_t "Ric" = Delta "Ric" + 2 "Rm" \( "Ric" \) - 2 "Ric"^2 \, #h(2em) "Rm" \( g \) = "Ric" . $ <geom:ricci-equation>]

Test the scalar equation against a scaled smooth spacetime cutoff on the smaller parabolic ball. Such cutoffs are now available in the controlled coordinates. Integration by parts, $\| R \| lt.eq C_R$, and volume $O \( l^4 \)$ over time $O \( l^2 \)$ give

#[#set math.equation(numbering: n => "(3.11)")
 $ integral_(t - c l^2)^t integral_(B_s \( x \, c l \)) \| "Ric" \|^2 thin d mu_s thin d s lt.eq C l^4 . $ <geom:scalar-energy>]

For example, derivatives of the cutoff cost $l^(- 2)$, so its scalar terms cost $l^(- 2) l^4 l^2 = l^4$; time integration also includes the bounded $R^2$ measure term. Rescaling lengths by $l^(- 1)$ makes the squared spacetime Ricci norm $O \( l^2 \)$. Equation (3.10) is a homogeneous linear tensor heat equation once its bounded coefficients are fixed. Interior energy estimates followed by local Sobolev iteration and differentiated interior estimates give $\| nabla^k "Ric" \| lt.eq C_k l^(- 1 - k)$ in original units. This is the local scalar-to-Ricci improvement of #cite(label("BamlerZhangI")) arXiv version, Lemma 6.1; the preceding argument has verified its bounded-curvature cylinder and cutoff inputs from the spatial radius. The uniform coefficients used in these interior estimates are precisely those obtained from the crude curvature bounds above; the improved Ricci estimates are their conclusion.

Curvature variation now bounds the left side of Equation (3.8) by $A_0 l^(- 3)$, with $A_0$ independent of $A \, l_0$. Choose $A > A_0$, and then $l_0$ small enough for the crossing argument and for the bootstrap to hold on a fixed initial compact time interval. A first-failure argument proves it for all later times. This proves Equation (3.1). For forward persistence, use the same heat function with a negative drift, so that $- C \/ l^2 lt.eq partial_s chi lt.eq - c \/ l^2$ on its positive set and its support stays in the initial radius-$l$ ball. At the first upward crossing of $max chi^2 \| "Rm" \| = B l^(- 2)$, the cutoff gradient again gives $l \( y \, s \) gt.eq c_B chi_y l$. The negative cutoff contribution is at most $- c B \/ \( chi_y l^4 \)$ while the curvature contribution is at most $C_B A \/ \( chi_y l^3 \)$. Their sum is negative for the chosen cap, contradicting the crossing. The cutoff is positive near the initial center throughout a fixed shorter time slab, proving the forward bounded-curvature neighborhood. We have proved both directions of spatial-scale persistence and the derivative bounds in Equation (3.1); the two-sided volume bounds were established by heat localization. The remaining global input for compactness is the slice energy bound.

=== 3.2 Energy, small bad sets, and volume comparison <geom:energy-comparison>

The local estimates now give definite curvature energy at each concentration scale. To bound how many such regions can occur, we first control the total slice energy and then derive a summable volume-comparison error. The latter will distinguish genuine quotient singularities from smooth points in a limit. Choose $C_0$ so $1 lt.eq R + C_0 lt.eq C$. Completing the gradient square in the quotient evolution, as in Simon’s integral-curvature argument #cite(label("SimonIntegral2020")) Section 3, equation (3.2) and Theorems 3.5–3.6, gives

$ \( partial_t - Delta \) frac(\| "Ric" \|^2, R + C_0) lt.eq C \| "Rm" \| \| "Ric" \|^2 - c \| "Ric" \|^4 . $

If $F = integral \| "Ric" \|^2 \/ \( R + C_0 \)$, the volume derivative and Young’s inequality imply

$ F' lt.eq C integral \| "Rm" \|^2 - c' integral \| "Ric" \|^4 + C F . $

In four dimensions the Chern–Gauss–Bonnet formula #cite(label("Chern1944")) in the full-tensor normalization of #cite(label("SimonIntegral2020")) Equation (3.6) gives $integral \| "Rm" \|^2 lt.eq C + 4 integral \| "Ric" \|^2 lt.eq C + C F$. No orientability assumption is needed: for a nonorientable $M$ apply the identity to its orientation double cover with the pulled-back flow and divide the integral identity by two. Dropping the negative quartic term and applying Gronwall bounds $F$ and then the slice curvature energy, proving Equation (3.1).

There is a fixed energy $e_0 > 0$ associated to a point-picked curvature ball. Indeed maximize curvature times squared distance to the boundary of a slightly larger ball. At the maximizing point, curvature $Q$ is bounded by $C Q$ on a ball of radius $c Q^(- 1 \/ 2)$. The spatial derivative estimate makes curvature at least $Q \/ 2$ on a smaller ball; lower volume then gives $integral \| "Rm" \|^2 gt.eq e_0$. If $l \( x \) < r$, curvature reaches at least $r^(- 2)$ within distance $r$ of $x$ by the definition of $l$. The preceding point selection therefore produces an energy ball inside $B \( x \, C r \)$. A maximal disjoint collection of these larger radius-$C r$ balls has at most $C \/ e_0$ members by the slice energy bound; enlarging them covers ${ l < r }$. Thus

#[#set math.equation(numbering: n => "(3.12)")
 $ "Vol"_t { l < r } lt.eq C r^4 . $ <geom:bad-volume>]

On $B \( x \, h \) ∩ { l gt.eq h }$, the cubic Ricci integral is at most $C h^(- 3) h^4$. On $2^(- j - 1) h lt.eq l < 2^(- j) h$ it is at most $C \( 2^(- j) h \)^(- 3) \( 2^(- j) h \)^4$. Summing gives

#[#set math.equation(numbering: n => "(3.13)")
 $ integral_(B_t \( x \, h \)) \| "Ric" \|^3 thin d mu_t lt.eq C h . $ <geom:ricci-L3>]

Distances have a uniform terminal limit. For $\| t - s \| lt.eq c r^2$, cover the bad set at the first time by the bounded family of radius-$C r$ balls, omitting from a minimizing path its visits to slightly enlarged balls. Replace first-to-last visits when a ball is revisited. There are uniformly many replacement endpoints, with total replacement cost $O \( r \)$ at the other time by Equation (3.6). On the remaining path the curvature scale is $gt.eq c r$ throughout the interval by forward and backward persistence. Its length changes by a factor at most $1 + C r$ since $\| "Ric" \| lt.eq C \/ r$. Comparing also in reverse gives

$ \| d_t \( x \, y \) - d_s \( x \, y \) \| lt.eq C r \( 1 + d_s \( x \, y \) + d_t \( x \, y \) \) . $

First compare with a fixed late time to bound diameter, then take $r$ a sufficiently large constant times $sqrt(\| t - s \|)$. This proves uniform convergence to a pseudodistance $d_T$ on $M$ and defines its compact metric quotient $Z$. For scalar-bound distance distortion and terminal metric convergence, see also #cite(label("BamlerZhangII")) Theorem 1.1 and Corollary 1.2. Volume forms at two times differ by factors $e^(plus.minus C_R \| t - s \|)$.

We will need a comparison estimate stronger than mere volume bounds. In polar coordinates about a smooth point, before the cut radius, let $P$ be the polar Jacobian and $m = \( partial_r log P - 3 \/ r \)_(+)$. The Riccati inequality gives, on ${ m > 0 }$,

$ m' + 2 m \/ r + m^2 \/ 3 lt.eq \| "Ric" \| . $

Since $P' = \( m + 3 \/ r \) P$ there,

$ \( m^5 P \)' lt.eq 5 \| "Ric" \| m^4 P - 7 m^5 P \/ r - \( 2 \/ 3 \) m^6 P . $

Integrate to cuts and use Young’s inequality on the first term. The boundary contributions have the correct sign, with $m = 0$ at entrance into a positivity interval. Setting $P = 0$ after cuts gives

#[#set math.equation(numbering: n => "(3.14)")
 $ integral_(B \( x \, h \)) m^6 lt.eq C integral_(B \( x \, h \)) \| "Ric" \|^3 lt.eq C h . $ <geom:polar-defect>]

Furthermore $\( P \/ r^3 \)' lt.eq m P \/ r^3$. Integrating between comparable radii yields

#[#set math.equation(numbering: n => "(3.15)")
 $ frac("Vol" B \( x \, h \), h^4) lt.eq frac("Vol" B \( x \, h \/ 2 \), \( h \/ 2 \)^4) + C h^(1 \/ 2) . $ <geom:almost-bishop>]

To see the exponent, the error is bounded by $C h^(- 3) integral m lt.eq C h^(- 3) \( C h \)^(1 \/ 6) \( C h^4 \)^(5 \/ 6) = C h^(1 \/ 2)$. The same argument holds for any fixed comparable pair of radii. Errors sum to $C h^(1 \/ 2)$ over all dyadic descendants. Polar integration including the nonpositive cut measure also gives weakly

#[#set math.equation(numbering: n => "(3.16)")
 $ Delta \( d^2 \/ 2 \) lt.eq 4 + d m . $ <geom:radial-laplacian>]

The scale, energy, and bad-set bounds of Theorem 6 are now established, as is uniform convergence of distances. We next identify the geometry on every shrinking spatial scale; smooth terminal convergence away from a fixed finite set will then follow by persistence.

=== 3.3 Slice limits, quotient cones, and quantitative necks <geom:slice-limits>

We next turn these estimates into a description of every small-scale slice limit. The essential conclusions are smooth Ricci-flat convergence off a finite set and quantitative quotient coordinates on the intervening annuli. Puncture removal and the nontriviality of the quotient groups will be established after those coordinates are available. This is the part of the argument corresponding to classical Einstein orbifold compactness and bubbling #cite(label("Anderson1989")) #cite(label("Bando1990")) #cite(label("BandoCorrection1990")); the estimates below include the Ricci error present in the flowing slices. Consider $h_i^(- 2) g \( t_i \)$, based at arbitrary $x_i$, where $h_i arrow.r 0$ and $t_i arrow.t T$. Two-sided volume bounds uniformly bound the number of disjoint radius-$rho$ balls in any bounded ball, giving pointed subsequential compactness as length spaces. Completeness follows by exhausting with successively larger balls. The cover of ${ l < rho h_i }$ has uniformly bounded cardinality. Letting $rho arrow.b 0$ diagonally identifies a finite exceptional set $S$, with $l \/ h_i$ bounded below on its regular compact complement. The coordinate and derivative bounds give smooth convergence there. In the rescaled metrics,

$ \| nabla^k "Ric" \| lt.eq C_k h_i \( l \/ h_i \)^(- 1 - k) arrow.r 0 $

on these compacts, so the limit is Ricci-flat.

Smooth convergence includes embeddings of relatively compact regular subregions. Take finitely many normal charts with margins and extract their transition maps together with their metrics. The local inverse identifications differ smoothly by quantities tending to zero. In convex limiting balls combine them by a smooth partition and the unique local squared-distance barycenter. The resulting map is locally invertible on smaller charts, covers the desired region by the chart margins, and is injective: two points whose images converge to the same point have distance tending to zero, hence lie in one chart where injectivity holds. Construct on a larger compact region before restricting. This supplies actual embeddings for the later gluing.

There is no volume mass at $S$, since its $rho$-neighborhood has volume $O \( rho^4 \)$. Volume is therefore regular Riemannian volume, and balls have converging volumes. Indeed at almost every regular point away from the center, the last regular segment of a minimizing path gives $\| nabla d \| = 1$. Distance levels consequently have zero four-dimensional measure. The regular limit has finite curvature energy by lower semicontinuity on compact exhaustions. In $h_i^(- 1)$ length units, Equation (3.13) gives a cubic Ricci integral $O \( h_i^2 \)$ on each fixed ball. Thus the normalized polar defect vanishes, and Equations (3.15) and (3.16) give exact Bishop monotonicity and $Delta \( d^2 \/ 2 \) lt.eq 4$ weakly on the regular part of the limit.

The finite exceptional set cannot separate positive-volume regular components. Fix a regular initial point and a small regular endpoint ball $U$ in a supposed other component, both a positive distance from $S$. All approximating minimizing segments between them must enter $N_rho \( S \)$; otherwise a subsequential limit of such bounded segments would connect the two components in the regular complement. Their passage through $N_(C rho) \( S \)$ has length at least $c rho$, at radii in a fixed compact subinterval of $\( 0 \, oo \)$. The polar inequality gives, for a passage radius $s$ and endpoint radius $r$,

$ P \( r \) lt.eq C P \( s \) + C integral_s^r m \( u \) P \( u \) thin d u . $

Integrating over passage times, endpoint radii, and angles, and using Fubini on these bounded ranges, gives

#[#set math.equation(numbering: n => "(3.17)")
 $ c rho "Vol" \( U \) lt.eq C ("Vol" \( N_(C rho) \( S \) \) + integral m) . $ <geom:nonseparation>]

Cuts only decrease the polar integrals. First take the sequence limit, eliminating $integral m$, and then let $rho arrow.b 0$. The right side is $O \( rho^4 \)$, a contradiction. This argument also applies to iterated tangent and end limits: a diagonal choice ensures that the original physical radii still tend to zero.

Write $d$ for distance from a puncture, or from a fixed point when studying infinity. At a puncture, finite energy makes the curvature energy on annuli ${ r \/ 4 < d < 4 r }$ tend to zero as $r arrow.b 0$; at infinity the same holds as $r arrow.r oo$. First, point-picking and the fixed energy $e_0$ rule out unbounded $r^2 \| "Rm" \|$ on a smaller annulus. The inherited local estimates then give $r^3 \| nabla "Rm" \| lt.eq C$ with further fixed boundary margins. If $r^2 \| "Rm" \| gt.eq epsilon > 0$ at a point of this middle annulus, curvature remains at least $epsilon \/ \( 2 r^2 \)$ on a ball of radius $c epsilon r$ contained in the wider annulus. For each fixed $epsilon$, lower volume bounds give energy at least $c epsilon^6$ on that ball, contradicting the vanishing annular energy. Thus the scaled curvature tends to zero. Interior stationary estimates, or interpolation with the inherited higher bounds, give the same conclusion for every fixed number of scaled derivatives. Tangent and end limits have flat regular annuli and only the dilation center as a possible incomplete point. Their ball volumes are exactly $v r^4$: the monotone ratio has a limit at the relevant end, and dilation freezes that limit at every fixed radius.

Put $u = d^2 \/ 2$. The nonnegative distribution $4 - Delta u$ pairs to zero with every compactly supported radial test by this volume formula and $\| nabla d \| = 1$. Dominate an arbitrary nonnegative test by a radial test on a larger compact annulus to see that the defect vanishes. Elliptic regularity makes $u$ smooth and $Delta u = 4$. Bochner’s formula and $\| nabla u \|^2 = 2 u$ give $\| nabla^2 u \|^2 = 4$; since its trace is $4$, equality in Cauchy’s inequality gives $nabla^2 u = g$. Its gradient curves produce the cone metric $d r^2 + r^2 g_L$. Flatness makes $L$ a compact spherical manifold and nonseparation makes it connected. Thus $L = S^3 \/ Gamma$ for a finite orthogonal group acting freely. Two-sided volumes bound $\| Gamma \|$. All fixed-ratio annuli sufficiently far along the original end are therefore arbitrarily close, with derivatives and radial distances, to round quotient annuli. Enlarged overlapping annuli identify the groups.

#thm([Lemma 3.3.])[
  (Curvature and chart improvement on necks).  #emph[Suppose annular regions have inner and outer radii $r_(-) lt.double r_(+)$ and every escaping intermediate annulus converges smoothly to a round flat quotient annulus. Assume for some $sigma > 0$ and all needed finite orders that 
$ r^2 \| "Ric" \|_(k + 2 \, r) lt.eq C #scale(x: 120%, y: 120%)[\(] \( r \/ r_(+) \)^sigma + \( r_(-) \/ r \)^sigma #scale(x: 120%, y: 120%)[\)] . $

 Fix $0 < mu < min \( 1 \, sigma \)$. After removing fixed-factor boundary collars, for this fixed exponent, 
#[#set math.equation(numbering: n => "(3.18)")
 $ r^2 \| "Rm" \|_(k \, r) lt.eq C #scale(x: 120%, y: 120%)[\(] \( r \/ r_(+) \)^mu + \( r_(-) \/ r \)^mu #scale(x: 120%, y: 120%)[\)] . $ <eq:neck-decay>]

 A single equivariant coordinate system on a shortened neck gives the same bound for $g - delta$, with scaled derivatives. Infinite half-necks are allowed. One may also use slowly varying coefficients on the boundary terms, when the forcing and boundary data obey their corresponding bounds.]
] <geom:neck>

#proof[
  First choose the permitted fixed-factor boundary collars. For a fixed finite derivative order, a fixed widened annular ratio, and a small cone-chart tolerance, there are a fixed $K$ and a late index such that all widened annuli with central radii in $\[ K r_(-) \, r_(+) \/ K \]$ have these smooth bounds. Otherwise choose increasingly late violating annuli with radii in $\[ j r_(-) \, r_(+) \/ j \]$, $j arrow.r oo$. Both boundary ratios escape, contradicting the assumed smooth convergence of the whole annulus. Enlarge $K$ by a fixed factor to retain boundary margins. The shortened boundaries $r'_(-) = K r_(-)$ and $r'_(+) = r_(+) \/ K$ therefore have uniformly bounded scaled curvature and the required derivatives. For either exponent $beta = mu \, sigma$, their weights satisfy
  $ \( r \/ r'_(+) \)^beta + \( r'_(-) \/ r \)^beta = K^beta #scale(x: 120%, y: 120%)[\(] \( r \/ r_(+) \)^beta + \( r_(-) \/ r \)^beta #scale(x: 120%, y: 120%)[\)] . $
  It is enough to prove the estimate on this shortened neck: these fixed multipliers preserve both the forcing hypothesis and the claimed conclusion. Relabel its boundary radii as $r_(-) \, r_(+)$ below.
  Write $w_mu \( r \) = \( r \/ r_(+) \)^mu + \( r_(-) \/ r \)^mu$. If the bound fails, choose approximate maximizing points of $r^2 \| "Rm" \| \/ w_mu \( r \)$ with ratios $Q_i arrow.r oo$, and call their radii $s_i$. Both boundaries escape after dilation by $s_i^(- 1)$: near either boundary the weight is bounded below and scaled curvature is bounded. Put $A_i = s_i^2 \| "Rm" \| \( s_i \)$. Intermediate annular flatness gives $A_i arrow.r 0$. Divide the rescaled curvature by $A_i$. The maximum property and
  $ frac(w_mu \( r s_i \), w_mu \( s_i \)) lt.eq max \( r^mu \, r^(- mu) \) $
  give the divided tensor the bound $C r^(- 2) max \( r^mu \, r^(- mu) \)$. The second Bianchi identity and commutation give $Delta "Rm" = "Rm" * "Rm" + nabla^2 "Ric" *$. The divided quadratic term vanishes. The divided forcing vanishes on fixed annuli since $w_sigma \( s_i \) \/ A_i lt.eq C \/ Q_i$. Interior elliptic estimates thus give a nonzero limiting Cartesian tensor $H$ on the flat punctured cover, componentwise harmonic and satisfying the uncontracted differential Bianchi identity.
  Spherical harmonics have radial powers $j$ and $- j - 2$, $j = 0 \, 1 \, dots.h$. The two bounds with $mu < 1$ leave only $H = r^(- 2) C$ with a constant Cartesian tensor $C$. Bianchi becomes
  $ x_i C_(j k a b) + x_j C_(k i a b) + x_k C_(i j a b) = 0 #h(2em) upright("for every ") x in bb(R)^4 . $
  For fixed $a \, b$ it says $x and C_(dot.op dot.op a b) = 0$ for every covector $x$, forcing that two-form to vanish. This contradicts the normalization. Derivatives follow by interior elliptic estimates. For an infinite end use a remote artificial boundary and pass to its limit. Slowly varying boundary coefficients obey the same ratio estimate after decreasing $mu$ to absorb their change on fixed logarithmic intervals; the same divided forcing argument applies.
  Here are the gauge and gluing details. On a fixed lifted round annulus, with a larger annulus retained for margins, let $S \( V \) = D V + \( D V \)^t$ and $K \( p \)$ be linearized curvature at $delta$. For $k gt.eq 5$ there is a bounded linear extraction $E : H^k \( "Sym"^2 \) arrow.r H^(k + 1) \( T \)$, modulo Killing fields, with
  #[#set math.equation(numbering: n => "(3.19)")
   $ E \( S V \) = V \, #h(2em) parallel \( 1 - S E \) p parallel_(H^k) lt.eq C parallel K \( p \) parallel_(H^(k - 2)) . $ <geom:linear-gauge>]
  Indeed regard the linearized connection $C_(i j)^a = 1 / 2 \( partial_i p_(j a) + partial_j p_(i a) - partial_a p_(i j) \)$ as a one-form in $i$, for each $a \, j$. Its curl is $K \( p \)$. The Neumann gradient projection writes it as $d U_j^a$ plus an $H^(k - 1)$ error controlled by $K \( p \)$ in $H^(k - 2)$. Symmetry in $i \, j$ makes the curl of $U_j^a d x^j$ controlled; a second projection writes $U^a = d V^a$ plus a controlled error. Thus $C \( p - S V \)$ is controlled, and $partial_i q_(j a) = C \( q \)_(i j)^a + C \( q \)_(i a)^j$ controls $D q$. Absorb the remaining constant symmetric matrix by an affine field.
  For clarity, the projection estimate is the div/curl estimate with zero normal component. Integration by parts makes the boundary second fundamental form an order-zero term and gives coercivity modulo $L^2$. Compactness removes this term because a closed remainder is a gradient on the simply connected annulus and the Neumann projection makes it orthogonal to gradients. Higher estimates follow by tangential differentiation in flattened boundary charts, recovering normal derivatives from div and curl. Fix averages and Killing ambiguity, or project onto the range of $S$, to obtain the stated left inverse at all needed orders. Averaging over $Gamma$ preserves the estimates and gives equivariance.
  For $g = delta + p$ small in $H^k$, solve $V = E p - E \( \( D V \)^t D V \)$ by contraction. Sobolev multiplication is bounded since $k > 4 \/ 2 + 1$. Put $q = p - S V - \( D V \)^t D V$, so $E q = 0$, and $f = \( "Id" + V \)^(*) delta$. Since $f$ is flat, the difference of the nonlinear curvature remainders of $g$ and $f$ has $H^(k - 2)$ norm at most $C parallel p parallel_(H^k) parallel q parallel_(H^k)$. Equation (3.19) and absorption give
  $ parallel q parallel_(H^k) lt.eq C parallel "Rm" \( g \) parallel_(H^(k - 2)) . $
  Changing coordinates by $"Id" + V$ gives the local metric estimate. Higher finite orders and Sobolev embedding give all required scaled differentiability bounds.
  Choose geometric radius steps and charts on much wider annuli whose images contain whole distance bands with margins. On consecutive overlaps, the transition satisfies
  $ \( D Psi \)^t D Psi - I = O \( epsilon_j \) \, #h(2em) D^2 Psi = O \( epsilon_j \/ r_j \) \, #h(2em) epsilon_j = C w_mu \( r_j \) . $
  The second estimate follows from the Christoffel transformation law. Integration gives $Psi = P_j x + b_j + O_(k \, r_j) \( epsilon_j r_j \)$ for an affine isometry. Comparing both charts in a larger converging cone chart, or using nested bands in both directions, identifies their fundamental groups. Average $P_j$ over this exact deck isomorphism and take its polar factor to obtain an exact orthogonal intertwiner within the same error. Project the translation to the invariant subspace; it is zero when $Gamma$ is nontrivial and free.
  Align consecutive charts by these rigid motions. For the trivial group, radial positioning bounds translation increments by $o \( r_j \)$. Toward a puncture their sum converges; subtract its limit. At infinity sum outward from an initial chart, giving $o \( r_j \)$ relative displacement by geometric summation. Rotations do not affect radial position. Interpolate the remaining errors on shorter overlaps; derivatives of the interpolation cutoff cost $r_j^(- m)$ and preserve the scaled $O \( epsilon_j \)$ bounds. Local invertibility follows from smallness. For global injectivity, equal images have comparable radii and hence lie in one common wide annular chart. There the glued map is $C^1$ close to the identity: close points are separated by derivative bounds and points a fixed fraction of a radius apart by the $C^0$ bound. Radial margins ensure coverage of the shortened neck. ◻
]

=== 3.4 Removal of punctures and intrinsic singular points <geom:puncture-removal>

The neck estimate supplies coordinates in which a puncture has a continuous metric completion. We now improve that completion to a smooth metric on its local cover, and then prove that every actual concentration point has a nontrivial quotient group. This second assertion is needed both for organizing trees and for tracking them by their distances. At a limit puncture Lemma 7, with zero Ricci forcing, gives on the cover

#[#set math.equation(numbering: n => "(3.20)")
 $ \| D^k \( g - delta \) \| lt.eq C_k r^(mu - k) \, #h(2em) mu > 0 . $ <geom:puncture-decay>]

Choose $0 < alpha < min \( mu \, 1 \)$ and fill $g \( 0 \) = delta$. Points separated by a distance comparable to their radii are controlled by the zeroth-order bound; closer points by the first-derivative bound along their segment. Thus $g$ and $A^(i j) = sqrt(det g) thin g^(i j)$ are $C^(0 \, alpha)$, and after scaling $B_R$ to $B_1$, $parallel A \( R dot.op \) - I parallel_(C^(0 \, alpha)) = O \( R^mu \)$.

Solve

$ partial_i \( A^(i j) partial_j y^a \) = 0 quad upright("in ") B_R \, #h(2em) y^a = x^a quad upright("on ") partial B_R . $

Coercivity gives the unique variational solution. For $w = y - x$,

$ partial_i \( A^(i j) partial_j w^a \) = - partial_i \( A^(i a) - delta^(i a) \) \, #h(2em) w^a \|_(partial B_R) = 0 . $

After rescaling to $B_1$, the forcing vector has $C^(0 \, alpha)$ norm $O \( R^mu \)$. The weak-solution gradient estimate #cite(label("GilbargTrudinger2001")) Theorem 8.16 and Corollary 8.35 gives $parallel D y - I parallel_oo = O \( R^mu \)$ and $y in C^(1 \, alpha)$. This estimate also follows by absorbing the small coefficient perturbation in the constant-coefficient divergence estimate. Thus $y$ is a coordinate diffeomorphism for small $R$. Uniqueness makes it equivariant, and $y \( 0 \)$ is $Gamma$-fixed, so recentering is permitted. Put $B = D y \( 0 \)$, and then make a constant linear normalization. Since $y \( x \) - y \( 0 \) - B x = O \( r^(1 + alpha) \)$, rescaled interior estimates after subtracting the affine part give $D^k y = O \( r^(1 + alpha - k) \)$ for $k gt.eq 2$. The forcing from that affine part has the stronger coefficient exponent $mu > alpha$. The inverse coordinates obey the same estimates. Consequently the harmonic-coordinate metric satisfies

#[#set math.equation(numbering: n => "(3.21)")
 $ G - G \( 0 \) = O \( r^alpha \) \, quad D G = O \( r^(alpha - 1) \) \, quad D^2 G = O \( r^(alpha - 2) \) . $ <geom:harmonic-decay>]

Thus $G in W^(2 \, p)$ across zero for all $p < 4 \/ \( 2 - alpha \)$; take $p_0 = 2 + alpha \/ 2 > 2$. There is no distributional point defect: integration by parts across $partial B_rho$ has first-derivative boundary terms $O \( rho^3 \)$ and second-derivative terms involving $D G$ of size $O \( rho^(2 + alpha) \)$. Both tend to zero. The harmonic-coordinate Einstein equation holds almost everywhere:

#[#set math.equation(numbering: n => "(3.22)")
 $ G^(a b) partial_a partial_b G_(i j) = Q_(i j) \( G^(- 1) \, D G \, D G \) . $ <geom:weak-einstein>]

Here $Q$ is quadratic in $D G$ with smooth coefficients in $G^(- 1)$; this is the Lanczos harmonic-coordinate formula, as recorded in #cite(label("DeTurckKazdan1981")) Lemma 4.1, equation (4.3). For $2 < p < 4$, Sobolev gives $D G in L^(4 p \/ \( 4 - p \))$, so elliptic regularity improves the exponent by

#[#set math.equation(numbering: n => "(3.23)")
 $ p_(k + 1) = frac(2 p_k, 4 - p_k) > p_k \, #h(2em) 1 / p_k = 1 / 2 - 2^k (1 / 2 - 1 / p_0) . $ <geom:bootstrap-exponents>]

After finitely many steps one can take $p > 4$. If a step reaches exactly $4$, the local embedding $W^(1 \, 4) subset L^q$ for every finite $q$ permits the next exponent above $4$.

This gain does not assume the stronger regularity in advance. On a sufficiently small ball the continuous leading coefficients are uniformly close to a constant positive matrix. Localize $G$; its equation has right side in the higher $L^q$ since the cutoff terms contain only $G \, D G$. The constant-coefficient $W^(2 \, q)$ inverse and a Neumann series for the small coefficient perturbation give a $W^(2 \, q)$ solution. Uniqueness in the previously available $W^(2 \, p)$ class identifies it with the localized metric. Alternatively, the global Dirichlet regularity theorem #cite(label("ChiarenzaFrascaLongo1993")) Theorem 4.2 gives this upgrade for the localized metric components, which have zero boundary trace. Keep the continuous leading coefficients equal to $G^(- 1)$ near the support of the cutoff and extend them to a constant positive matrix outside a larger compact set. A convex interpolation preserves ellipticity and gives bounded uniformly continuous, hence vanishing-mean-oscillation, coefficients. Once $p > 4$, $G in C^(1 \, beta)$. Equation (3.22), Schauder estimates, and differentiation give smoothness. This proves the orbifold filling in changed equivariant coordinates without an assumption about Einstein deformation integrability.

A concentration point cannot have trivial group. If it did, its smooth filling would have almost-Euclidean volume ratios on sufficiently small balls. Smooth convergence on surrounding annuli, negligible tip volume, and Equation (3.15) propagate these lower ratios to every smaller scale in the approximations: the total error below original radius $h$ is $O \( h^(1 \/ 2) \)$. Concentration and point-picking give, at a much smaller scale, a complete nonflat Ricci-flat limit with a regular nonflat region. Point-picked centers are $o \( h \)$ from the smoothly filled center. Inclusions between their radius-$h$ balls and the filled-center balls of radii $h plus.minus o \( h \)$ transfer the same lower starting ratios. Let the initial ratio approach the Euclidean one, choosing the approximating index after each outer radius; the summable comparison error tends to zero in physical units. Every fixed ball of the smaller limit has at least Euclidean volume ratio. At a regular center Bishop comparison gives the opposite bound. Equality, by the radial Laplacian and Hessian argument, forces a smooth flat cone from that center, a contradiction. Thus each exceptional point is a genuine intrinsic singularity with nontrivial group; in particular a metrically regular point of a limit cannot conceal a further curvature concentration. The same argument shows the end group of a nonflat complete limit is nontrivial: a trivial end gives Euclidean asymptotic volume ratio, which is independent of the chosen center.

A complete flat limit here is a global Euclidean quotient with at most one tip. Develop the universal cover of its regular locus. The faithful free linear local holonomy at a puncture ensures that its local fundamental group injects into that of the regular locus: the composition of the inclusion with flat holonomy is the faithful linear action of its quotient group. Hence its lifts contain full punctured Euclidean balls. Fill their centers. The resulting flat manifold is complete: a finite-length path projects to a convergent path downstairs and eventually remains in one lifted local ball. Adding isolated points preserves simple connectivity in dimension four. Its development is therefore all of Euclidean space. The deck group is finite. For any prescribed finite number of distinct deck transformations, lifts of a regular expanding ball and their transforms occupy that many sheets in a comparably enlarged Euclidean ball. Every downstairs point has a lift within comparable radius by path lifting; paths detour isolated tips with arbitrarily small excess using their connected links. Arbitrarily many sheets would force the downstairs Euclidean growth ratio to zero, contrary to noncollapse. A finite Euclidean isometry group fixes its barycenter and is orthogonal after translation. Since singularities are isolated, its only possible singular point is the origin. This finishes the small-scale orbifold, genuine-tip, and end assertions of Theorem 6. We can now use the intrinsic singular points to identify the vertices and edges of a finite tree.

=== 3.5 Finite bubble trees and the definition of the root scale <geom:trees-root>

We have shown that a flat limit has at most one genuine tip. This excludes two separated concentrations without a larger nonflat ancestor. Together with the slice energy bound it will produce a finite tree and identify its outermost member by a continuous maximum. The terminal space $Z$ has only finitely many concentration points. Fix a sequence $t_i arrow.t T$ and write $pi : M arrow.r Z$ for the terminal quotient. For each sufficiently large integer $m$, let $E_(i \, m) = pi \( { l \( dot.op \, t_i \) lt.eq 2^(- m) } \)$. Extract their Hausdorff limits $F_m$ diagonally in the compact space $Z$, allowing an empty limit if the sets eventually become empty. They are nested compact sets. The bad-set cover and uniform convergence of distances show that each $F_m$ is covered by at most $N$ balls of radius $C 2^(- m)$, where $N \, C$ are independent of $m$. Consequently $S = ⋂_m F_m$ has at most $N$ points: $N + 1$ distinct points would violate such a cover for large $m$.

Let $K subset Z \\ S$ be compact. Nested compactness gives an $m$ with $K ∩ F_m = diameter$ and a fixed neighborhood of $K$ disjoint from $F_m$. For all sufficiently large $i$, every material point mapping to a slightly smaller neighborhood has $l \( dot.op \, t_i \) > r = 2^(- m)$. Crucially, $r$ is now fixed. Choose one such $i$ with $T - t_i < c r^2$. Forward spatial persistence on these radius-$r$ balls controls the entire remaining interval $\[ t_i \, T \)$, and a finite ball cover gives fixed material charts, bounded derivatives, and smooth terminal convergence over $K$. Local injectivity gives a single sheet. Thus the possible exceptional set is fixed and finite throughout late time; this conclusion does not infer uniformity from shrinking time windows. It completes the terminal-convergence assertion of Theorem 6.

If the exceptional set is empty, finitely many such charts bound curvature globally. Their derivative estimates, metric evolution, and compactness give a smooth limiting metric on the original manifold at $T$. The DeTurck formulation, with $W^a = g^(i j) \( Gamma_(i j)^a \( g \) - Gamma_(i j)^a \( g_(upright("fixed")) \) \)$, has principal part $g^(i j) partial_i partial_j g$ after adding $cal(L)_W g$. Short-time quasilinear parabolic existence and pullback by $- W$ continue the flow on the same manifold. The smooth limit and evolution equation give matching derivatives at $T$; compare #cite(label("Hamilton1982")) Theorem 14.1 for the curvature continuation criterion. Hence only the case of a genuine concentration point needs further work. Fix a small neighborhood $cal(U)$ in the material manifold, pulled back from a $d_T$-ball, whose regular boundary isolates one such point. Its punctured regular annuli have finite limiting curvature energy.

For a sequence $t_i arrow.t T$, call two nonflat small-scale limits in this cluster #emph[equivalent] if their scales have ratio bounded above and below and their centers remain a bounded distance apart in either scale. Pass to subsequences so all scale and separation comparisons converge in the extended sense. Each nonflat limit contains a regular ball with a uniformly positive energy. Indeed its orbifold filling and end decay make its maximum curvature finite and attained. Dilate so that maximum equals $1$. The complete stationary curvature equation gives a universal derivative bound: the differentiated-curvature product used above, now stationary, satisfies $- Delta Q lt.eq C - c Q^2$ for $Q = \( D + \| "Rm" \|^2 \) \| nabla "Rm" \|^2$. Its maximum is controlled, using decay at infinity and lifted maximum tests at quotient points. Thus a definite ball around a curvature maximum has curvature bounded below. Noncollapse, upper volume bounds, and the uniformly finite number of tips allow removal of small tip neighborhoods without exhausting that ball; some smaller regular ball remains with definite curvature and volume. Its energy is at least a fixed $e_1 > 0$.

Such regular energy balls belonging to inequivalent entries are disjoint in the original slices for large $i$. Separated centers give disjoint balls directly. If one scale is much smaller and its center remains bounded on a larger scale, it cannot meet a fixed regular ball there: smooth regular convergence bounds its curvature radius from below proportionally to the larger scale. The smaller entry must approach a tip. Therefore the total energy bounds the number of inequivalent entries by $C \/ e_1$.

Construct a maximal list by adjoining, whenever possible on a further subsequence, a nonflat limit inequivalent to those already listed. Previous convergences and comparisons persist after subsequence extraction. The energy bound forces this process to terminate, including against tests on further subsequences. The list is nonempty by high-curvature point-picking. If two entries are separated by a distance much greater than both scales, their separation-scale limit has two genuine tips. It cannot be flat, since a flat limit has at most one tip. It is consequently a new nonflat ancestor unless it is already in the list. Comparable scales at bounded distance are equivalent; at separated scales and bounded larger-scale distance the smaller entry approaches a tip of the larger one. These observations define an ancestor order on the finite list and show that it has a unique maximal entry. Applying the same argument to entries at each tip gives a unique outermost child in that branch, and every tip has a child by concentration and point-picking. This is the finite rooted tree.

Every intermediate limit between consecutive entries is flat, since a nonflat one would enlarge the maximal list. The child becomes its cone tip, and the same conclusion holds between the root and arbitrarily slowly vanishing outer radii. On these flat annuli $l gt.eq c r$, so Equation (3.1) gives $r^2 \| "Ric" \|_(k \, r) lt.eq C r$ in physical units. Lemma 7 therefore supplies the finite necks and positive decay exponents. This completes the tree assertion of Theorem 6.

These convergences identify actual slice regions with the core/neck domains of Section 2. Use compact regular embeddings on truncated vertices and the single annular coordinates on each joining region. Dividing physical coordinates by the corresponding vertex scale gives its end coordinates. If the parent and child scales are $A$ and $A e^(- 2 L)$, their end variables satisfy

$ tau_p = log \( A \/ r \) \, #h(2em) tau_c = log \( r \/ \( A e^(- 2 L) \) \) \, #h(2em) tau_p + tau_c = 2 L . $

On the parent half $tau_p lt.eq L$, $e^(- mu tau_p) + e^(- mu tau_c) lt.eq 2 e^(- mu tau_p)$; the child half has the analogous bound. Thus the two-sided neck estimate supplies exactly the one-sided half-end weights used there. Fixed initial end collars are absorbed by enlarging constants.

On fixed overlaps the annular charts converge, after a subsequence, with all required derivatives; they prescribe end charts for the limiting vertices by diagonal extraction. Adjust the regular embeddings by the small resulting overlap differences. Regular convergence covers each vertex except holes about its tips; annular convergence covers the intervening distances to its children, and at a leaf a bounded rescaled core is entirely regular. The same construction passes through a fixed compact root collar if the exterior is later replaced. It is a sequential construction: there is no assertion that one tree or one family of identifications is smooth in time. It gives only a positive joining exponent. The stronger exponent greater than one on the unjoined exterior will be supplied by Theorem 21 before Theorem 4 is applied.

#thm([Proposition 3.4.])[
  (A continuous outermost scale).  #emph[There is a fixed small $c_(*) > 0$ such that the following definition detects the unique outermost entry. Choose a bounded continuous $psi : \[ 0 \, 1 \] arrow.r \[ 0 \, oo \)$, zero on $\[ 0 \, c_(*) \]$ and strictly positive on $\[ 2 c_(*) \, 1 \]$, and set 
#[#set math.equation(numbering: n => "(3.24)")
 $ a \( t \) = sup_(y in cal(U)) l \( y \, t \) psi #scale(x: 120%, y: 120%)[\(] l \( y \, t \)^2 \| "Rm" \| \( y \, t \) #scale(x: 120%, y: 120%)[\)] . $ <geom:root-definition>]

 After shrinking $cal(U)$, this supremum is attained in its interior for every late time; it is positive and continuous, and $a \( t \) arrow.r 0$. For every sequence of late times, scale $a \( t \)$ and any maximizing point represent the outermost nonflat entry. Every other nonflat entry has scale bounded by a constant times $a \( t \)$. The constants may be fixed after extracting the sequential tree.]
] <prop:root-scale>

#proof[
  The normalized regular energy balls just constructed provide uniform detection. In the normalization $max \| "Rm" \| = 1$, the derivative bound keeps $\| "Rm" \| gt.eq 1 \/ 2$ on a ball of fixed radius. Removing small neighborhoods of the uniformly bounded number of tips leaves a point a fixed positive distance from every tip, by the volume bounds. Its curvature radius is bounded below: a sufficiently small fixed ball is regular and $\| "Rm" \| lt.eq 1$ there. It is bounded above by the nonzero curvature at its center. Hence at this point $l^2 \| "Rm" \| gt.eq 2 c_(*)$ for a fixed small $c_(*)$, and $l$ is comparable to the vertex scale. This assertion transfers to approximating slices. Here curvature radius in a limit is stopped by its exceptional points: a ball containing such a point has unbounded approximating curvature. On compact regular balls, smooth convergence verifies the opposite inequality in the radius definition.
  On the punctured terminal neighborhood the quantity $l^2 \| "Rm" \|$ tends uniformly below $c_(*) \/ 2$ toward the puncture. Otherwise regular points approaching it with $l^2 \| "Rm" \| gt.eq c_(*) \/ 2$ yield disjoint definite-energy balls, using curvature derivatives and noncollapse. Their radii are at most a constant times distance to the puncture, since concentration stops the curvature radius. Taking the terminal limit first keeps these balls regular; their definite energies contradict finite energy arbitrarily near the puncture. Shrink $cal(U)$ within this region. On every compact subset of its punctured terminal regular part, $l^2 \| "Rm" \| < c_(*)$ eventually. In particular the integrand in Equation (3.24) vanishes near its boundary. It is continuous on a fixed compact interior set, so its maximum is attained and depends continuously on time. Detection proves positivity. Every sequence of maximizing points converges to the concentration point and has $l arrow.r 0$; hence $a \( t \) arrow.r 0$.
  At a maximizer, $l gt.eq a \/ parallel psi parallel_oo$ and $l^2 \| "Rm" \| > c_(*)$. Its $l$-scale limit is therefore nonflat. If $l \/ a arrow.r oo$, detection at another regular point of that same limit would give a value of $l psi$ bounded below by a positive multiple of $l$, contradicting the definition of $a$. Thus $l asymp a$ at maximizers. Conversely detection on any listed nonflat limit bounds its scale by $C a$. The maximal list contains the maximizing $a$-scale limit, and its unique outer ancestor cannot have larger order than $a$. It is consequently the same entry. This is precisely the outermost scale; a deepest bubble or the largest curvature may occur at a much smaller scale. ◻
]

=== 3.6 Motion on short intervals <motion-on-short-intervals>

The scale just defined must be compared at different times on the same material manifold. We first use the genuine quotient tips to control curvature radii along minimizing segments, then construct dense sets of material points whose distance changes are small.

#thm([Lemma 3.5.])[
  (Curvature radius along minimizing segments).  #emph[For any minimizing segment $gamma : \[ 0 \, D \] arrow.r M$ at a late time, parametrized by arclength, 
$ l \( gamma \( s \) \, t \) gt.eq c min \( l_0 \, s \, D - s \) \, #h(2em) 0 < s < D . $

 Consequently, whenever $d_t \( x \, y \) lt.eq C h$ with $h$ small, its upper and lower time derivatives satisfy 
#[#set math.equation(numbering: n => "(3.25)")
 $ \| partial_t d_t \( x \, y \) \| lt.eq C' (1 + log^(+) \( h \/ l \( x \, t \) \) + log^(+) \( h \/ l \( y \, t \) \)) . $ <geom:distance-log>]

 Time derivatives can be interpreted almost everywhere or by barriers.]
] <geom:geodesic-radius>

#proof[
  If the bound fails, choose minimizing segments and interior points $z_i = gamma_i \( s_i \)$ such that, with
  $ r_i = l \( z_i \, t_i \) \, #h(2em) L_i = min \( l_0 \, s_i \, D_i - s_i \) \, #h(2em) r_i \/ L_i arrow.r 0 \, $
  the scale $h_i = sqrt(r_i L_i)$ satisfies $h_i arrow.r 0$, $r_i \/ h_i arrow.r 0$, and $h_i lt.eq L_i$. Restrict to the centered subsegments of length $2 h_i$ and rescale by $h_i^(- 1)$. Their limits are minimizing segments with endpoints at distance one on both sides of the basepoint. Since $l \( z_i \, t_i \) \/ h_i arrow.r 0$, that basepoint is a genuine exceptional point of the slice limit. Its tangent cone has link $S^3 \/ Gamma$ with $Gamma$ nontrivial and free. This link has diameter strictly less than $pi$: if two orbits were distance $pi$ apart, every translate of one representative would have to be the antipode of the other, forcing its orbit to be a singleton, contrary to freeness. Blowing up the limiting segment at this point therefore gives a minimizing segment through the cone vertex with positive length on each side. Joining nearby points by the shorter cone chord contradicts minimality.
  For the derivative bound use first variation $\| partial_t d \| lt.eq integral_gamma \| "Ric" \| thin d s$ and Equation (3.1). Near $x$ the spatial Lipschitz property also gives $l \( gamma \( s \) \) gt.eq l \( x \) - s$. Combining this with the interior bound gives $l \( gamma \( s \) \) gt.eq c \( l \( x \) + s \)$ on the first half of the segment, up to the harmless cap, and the analogous expression on the other half. Integration of their reciprocals gives Equation (3.25). ◻
]

#thm([Lemma 3.6.])[
  (Uniform short motion).  #emph[Let $h_i arrow.r 0$ and let $J_i$ be time intervals of length $delta_i = o \( h_i \)$ tending to $T$. Distances initially of order $O \( h_i \)$ change by $o \( h_i \)$ throughout $J_i$. If a material point has $l gt.eq c h_i$ at one time, it has $l gt.eq c' h_i$ throughout (after extraction for a sequential assertion). Regular compact charts at this scale persist, and their scaled metric coefficients, with any fixed finite number of scaled derivatives, change by $O \( delta_i \/ h_i \)$ in fixed material coordinates.]
] <geom:slow-motion>

#proof[
  Put $q_i = delta_i \/ h_i arrow.r 0$ and, on material points, define
  $ I_i \( x \) = integral_(J_i) log^(+) \( h_i \/ l \( x \, t \) \) thin d t . $
  The distribution formula and Equation (3.12) give
  $ integral_M log^(+) \( h_i \/ l \) thin d mu_t = integral_0^oo "Vol"_t { l < h_i e^(- v) } thin d v lt.eq C h_i^4 . $
  Volume forms are comparable across $J_i$, so Fubini gives $integral I_i lt.eq C delta_i h_i^4$. Discard material points with $I_i > h_i sqrt(q_i)$. Their volume at every time is at most $C h_i^4 sqrt(q_i)$. Lower ball volumes therefore make the retained set $O \( h_i q_i^(1 \/ 8) \)$-dense simultaneously at all times. For two retained endpoints in a bounded rescaled distance range, Equation (3.25) integrates to
  $ \| d_t \( x \, y \) - d_s \( x \, y \) \| lt.eq C \( delta_i + h_i sqrt(q_i) \) = o \( h_i \) . $
  A first-crossing argument keeps initially bounded distance ranges bounded. Its reverse version prevents initially remote retained points from entering a fixed bounded range.
  Choose finite increasingly dense labeled nets of retained material points on bounded balls. Their pairwise distance matrices remain unchanged in the limit, uniformly in time. Every temporal subsequence thus has the same pointed metric limit under these labels. Exceptional points in all such limits are intrinsic genuine singularities, and each metrically regular compact set has smooth regular convergence, by the exclusion of trivial-group concentration.
  Now take a material point regular at one time, but whose minimum $l \/ h_i$ over $J_i$ supposedly tends to zero. By reversing time direction in the distance comparison if needed, stop at its first crossing of $l \/ h_i = eta_i$, where $eta_i arrow.b 0$ is chosen above that attained minimum and sufficiently slowly that $q_i log \( 1 \/ eta_i \) arrow.r 0$. Until the stopping time its integrated endpoint logarithm is at most $delta_i log \( 1 \/ eta_i \) = o \( h_i \)$. Its distances to retained anchors therefore stay unchanged to $o \( h_i \)$. At the crossing it is a singular point in the common pointed limit with the same anchor distance vector as its initially regular point, a contradiction. This proves the asserted uniform positive lower radius.
  After taking a subsequence, the other alternative for a tracked point is $sup_(J_i) l \/ h_i arrow.r 0$. Such a point initially near a good anchor must stay near the same singular point. Choose a large anchor radius different from the finitely many singular-point radii in the common limit. Escape to that sphere would give a singular point there by subsequential extraction, which is impossible. In the resulting bounded ball choose finitely many good labels whose distance vectors distinguish the singular points. At arbitrary intermediate times, the persistently bad point’s vector is uniformly close to one of these finitely many distinct vectors; otherwise take a contradicting temporal subsequence. Its vector is continuous in time, so it stays close to the same vector throughout. Increasing the finite anchor nets identifies all its limiting positions with the same tip.
  These alternatives prove tracking for every point: any sequence violating it has either a uniformly regular time subsequence, handled by the first argument, or a persistently bad subsequence, handled by the second. Two tracked points can be placed in a common bounded good-anchor range, so their distance changes by $o \( h_i \)$. Finally, on persisting regular charts, $\| nabla^k "Ric" \| lt.eq C_k h_i^(- 1 - k)$. Integrating the metric and connection evolution in the fixed initial chart gives $O \( delta_i \/ h_i \)$ change of the scaled metric and its derivatives. The coordinate conversion is an induction on derivative order, using the already controlled lower-order connection terms. ◻
]

#thm([Lemma 3.7.])[
  (Time required for a fixed scale change).  #emph[Fix $u > 0$. Let $s_i < t_i < T$ tend to $T$, where $t_i$ is the first time after $s_i$ for which $\| log \( a \( t_i \) \/ a \( s_i \) \) \| = u$. Then 
$ frac(t_i - s_i, a \( s_i \)^2) arrow.r oo . $

]
] <geom:scale-change-time>

#proof[
  Otherwise a subsequence of these intervals has duration $O \( a^2 \)$, where $a = a \( s_i \)$. Rescale lengths by $a$. Their duration is $o \( a \)$ in physical units, so Lemma 10 freezes the pointed root metric and its regular curvature in the limit. The radius in the definition of $a$ converges on regular parts to the radius computed in that limit with its tips as stops. For the lower bound use smooth convergence on a slightly smaller admissible ball, whose curvature threshold has a strict margin. For the upper bound a ball exceeding the limiting radius either contains a curvature violation on a regular compact set or encounters a genuine concentration tip; in either case it is inadmissible in the approximations.
  Maximizers at both times are regular on this scale by Proposition 8. They remain in a common bounded root range: a nonflat patch at the first time persists at the other, and uniqueness makes all comparable nonflat scales the same tree entry. Thus the rescaled supremum in Equation (3.24) is computed on regular compact regions in one common pointed limit and has the same value at both times. A fixed-factor change is impossible. ◻
]

#thm([Proposition 3.8.])[
  (Buffered scale-change intervals).  #emph[If a concentration point exists, there are parabolically rescaled intervals $I = \[ - theta \, 1 + theta \]$, for one fixed $theta > 0$, with physical squared length units $d_i arrow.r 0$, such that the root scale throughout $I$ is comparable to a number $a_i arrow.r 0$ and changes by a fixed factor between $0$ and $1$. Put $epsilon.alt_i = sqrt(d_i)$. In these units 
$ \| R \| lt.eq C epsilon.alt_i^2 \, #h(2em) \| "Ric" \|_(k \, r) lt.eq C_k epsilon.alt_i \/ r $

 at regularity scales $r$ in a bounded range. For $a_i lt.double r lt.tilde 1$ the cluster has flat quotient annular limits with nontrivial group. At any fixed time, allowable root centers differ by $O \( a_i \)$.]
] <prop:buffered-intervals>

#proof[
  Fix $u > 0$ and choose successive late times $t_j$ at which $log a$ first changes by $u$ in absolute value from its value at $t_(j - 1)$. Positivity, continuity, and $a \( t \) arrow.r 0$ ensure infinitely many such times with $t_j arrow.t T$. Put $d_j = t_(j + 1) - t_j$ and $a_j = a \( t_j \)$. Lemma 11 gives $d_j \/ a_j^2 arrow.r oo$. Also $a_j gt.eq a_0 e^(- u j)$, so eventually
  $ d_j gt.eq c e^(- 2 u j) . $
  Choose $0 < theta < min \( 1 \, e^(- 2 u) \)$. Arbitrarily late indices satisfy $d_(j - 1) \, d_(j + 1) gt.eq theta d_j$. Otherwise every sufficiently late index has a neighbor smaller by a factor $theta$. Starting so late that its duration is smaller than all durations in the finite excluded initial segment, follow such neighbors. This chain cannot enter that initial segment and cannot reverse direction: reversal would return to the immediately preceding, strictly larger term. It must run rightward forever. It then gives $d_(j + k) lt.eq theta^k d_j$, contradicting the displayed exponential lower bound because $theta < e^(- 2 u)$.
  Use these central steps as the unit time interval. Their neighboring steps provide buffers of size $theta$. The first-change definition makes $a \( t \)$ comparable to $a_j$ on the central step and both buffers, with constants at most fixed powers of $e^u$. In length units $sqrt(d_j)$ its value is $a_i = a_j \/ sqrt(d_j) arrow.r 0$. The central endpoint factor is $e^u$ or $e^(- u)$; pass to a subsequence if its sign matters. The curvature estimates rescale to the claimed bounds since $\| R_(upright("new")) \| = d_j \| R \|$ and $\| "Ric" \|_(k \, r \, upright("new")) lt.eq C_k sqrt(d_j) \/ r$. Intermediate annuli are flat by maximality of the bubble list. Their tip is genuine, so their quotient group is nontrivial. The center bound follows because all maximizing points represent the unique outermost entry. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1), [#text(size: 9pt)[physical time]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (2, 0), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  line((2, 0), (9, 0), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((9, 0), (11, 0), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  line((11, 0), (11.7, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((11.7, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.1), (0, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2, -0.1), (2, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9, -0.1), (9, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((11, -0.1), (11, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0.13), [#text(size: 9pt)[$t_(j_i)- theta d_i$]], anchor: "south", padding: 0.1176cm)
  content((2, 0.13), [#text(size: 9pt)[$t_(j_i)$]], anchor: "south", padding: 0.1176cm)
  content((9, 0.13), [#text(size: 9pt)[$t_(j_i+1)$]], anchor: "south", padding: 0.1176cm)
  content((11, 0.13), [#text(size: 9pt)[$t_(j_i+1)+ theta d_i$]], anchor: "south", padding: 0.1176cm)
  content((1, -0.13), [#text(fill: rgb("#a65300"))[#text(size: 9pt)[$theta d_i$]]], anchor: "north", padding: 0.1176cm)
  content((5.5, -0.13), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$d_i$]]], anchor: "north", padding: 0.1176cm)
  content((10, -0.13), [#text(fill: rgb("#a65300"))[#text(size: 9pt)[$theta d_i$]]], anchor: "north", padding: 0.1176cm)
  line((5.5, -0.65), (5.5, -1.55), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.712, -1.1), [#text(size: 9pt)[$s=(t-t_(j_i))"/"d_i$]], anchor: "west", padding: 0.1176cm)
  content((0, -1.55), [#text(size: 9pt)[interval units]], anchor: "west", padding: 0.1176cm)
  line((0, -2), (2, -2), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  line((2, -2), (9, -2), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((9, -2), (11, -2), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  line((11, -2), (11.7, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((11.7, -2), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  line((0, -2.1), (0, -1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2, -2.1), (2, -1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9, -2.1), (9, -1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((11, -2.1), (11, -1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -2.13), [#text(size: 9pt)[$- theta$]], anchor: "north", padding: 0.1176cm)
  content((2, -2.13), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((9, -2.13), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((11, -2.13), [#text(size: 9pt)[$1+ theta$]], anchor: "north", padding: 0.1176cm)
  content((5.5, -3.05), [#text(size: 9pt)[$g_i(s)=d_i^(-1)g(t_(j_i)+d_i s), epsilon_i= sqrt(d_i) , a_i= frac(a(t_(j_i)), epsilon_i) arrow.r.long 0$]])
})],
  caption: [Figure 2: Parabolic normalization of a selected buffered interval. Write $j = j_i$ for the selected indices and $d_i = t_(j_i + 1) - t_(j_i)$. The neighboring intervals each have duration at least $theta d_i$; only the shortened buffers are drawn. The root scale is comparable to $a_i$ throughout the normalized interval, and its values at $0$ and $1$ differ by the fixed factor $e^u$ or $e^(- u)$. The diagram is schematic and does not assert monotonicity of the root scale. ],
) <fig:buffered-intervals>

#thm([Corollary 3.9.])[
  (Motion in interval units).  #emph[On the intervals of Proposition 12, geometry at length $h lt.tilde 1$ moves negligibly over windows $Delta t$ satisfying $epsilon.alt_i Delta t \/ h arrow.r 0$. Regular chart coefficients change by $O \( epsilon.alt_i Delta t \/ h \)$ with every fixed number of scaled derivatives. At $h asymp a_i$, old and new centers are $O \( a_i \)$ apart; at $a_i lt.double h lt.tilde 1$ they are $o \( h \)$ apart.]
] <geom:rescaled-motion>

#proof[
  The corresponding physical duration divided by physical length is $d_i Delta t \/ \( sqrt(d_i) h \) = epsilon.alt_i Delta t \/ h$, so Lemma 10 applies. At root scale a nonflat regular patch persists, and uniqueness identifies the corresponding entry at both times, giving bounded center displacement. At larger intermediate scale the root is the intrinsic cone tip and its location persists by the bad-point tracking argument. Another concentration at distance comparable to $h$ in the same shrinking terminal cluster would give two tips at their separation scale, hence a nonflat ancestor larger than the outermost entry, a contradiction. This proves the $o \( h \)$ displacement. ◻
]

#thm([Proposition 3.10.])[
  (Uniform exterior geometry).  #emph[Fix a sufficiently high finite derivative order $k_(upright("geo"))$ and numbers $0 < mu < sigma < 1$. There are fixed constants $N_(upright("geom")) \, C \, c_(upright("geom")) > 0$ and outer radii $R_i^(upright("out")) arrow.r oo$ in interval units, with $epsilon.alt_i R_i^(upright("out")) arrow.r 0$, with the following property. At every time in the buffered interval the exterior region admits one equivariant coordinate system whose annuli satisfy 
#[#set math.equation(numbering: n => "(3.26)")
 $ r^2 \| "Rm" \|_(k_(upright("geo")) \, r) + \| g - delta \|_(k_(upright("geo")) \, r) lt.eq C Theta_i \( r \) \, #h(2em) Theta_i \( r \) = \( a_i \/ r \)^mu + delta_i r^mu \, #h(2em) delta_i = \( R_i^(upright("out")) \)^(- mu) arrow.r 0 $ <geom:uniform-exterior>]

 for $N_(upright("geom")) a_i lt.eq r lt.eq c_(upright("geom")) R_i^(upright("out"))$. The charts cover whole shortened distance bands with boundary margins; their nontrivial quotient group is fixed after subsequence extraction. Moreover $epsilon.alt_i = o \( delta_i \)$. The constant $C$ is uniform in time and radius and is unchanged when the lower bound is restricted to $N a_i$ for any larger fixed $N$.]
] <geom:exterior-geometry>

#proof[
  Choose actual outer radii $R_i^(upright("out")) arrow.r oo$ in interval units with $epsilon.alt_i R_i^(upright("out")) arrow.r 0$, slowing their growth if necessary. For arbitrary choices $t_i in I$ and $r_i \/ a_i arrow.r oo$ with $epsilon.alt_i r_i arrow.r 0$, the maximal-tree and root-detection arguments force the annular limit to be a flat quotient cone. Otherwise a nonflat limit at scale $r_i$ would, by detection on a regular patch, give $a_i gt.eq c r_i$. This sequential assertion implies that, for any fixed small cone-chart tolerance, one fixed $N_(upright("geom"))$ makes all widened annuli $N_(upright("geom")) a_i lt.eq r lt.eq R_i^(upright("out"))$ sufficiently close to flat, uniformly in $t in I$ for large $i$. Failure would choose $N_i arrow.r oo$ and violating times and radii, contradicting the same assertion.
  On these annuli $l gt.eq c r$, and hence
  $ r^2 \| "Ric" \|_(k_(upright("geo")) + 2 \, r) lt.eq C epsilon.alt_i r lt.eq C epsilon.alt_i R_i^(upright("out")) \( r \/ R_i^(upright("out")) \)^sigma . $
  Apply the ordinary two-boundary proof of Lemma 7 with $r_(-) = N_(upright("geom")) a_i$, $r_(+) = R_i^(upright("out"))$, and the fixed exponent $mu$. Its constant is uniform in time: a violation chooses maximizing pairs $\( t_i \, r_i \)$; both boundary radii escape under normalization, the annular metric tends to the flat cone, and the divided Ricci forcing is at most $C \/ Q_i$. The harmonic-tensor and Bianchi contradiction uses only $mu < 1$ and the flat cover, independently of an extracted nonflat tree. This proves Equation (3.26) on shortened annuli, with all required derivatives. Fixed boundary factors are included in $N_(upright("geom"))$ and $c_(upright("geom"))$. Since $epsilon.alt_i R_i^(upright("out")) arrow.r 0$ and $mu < 1$, one has $delta_i \/ epsilon.alt_i arrow.r oo$. Fixed wider collars merely enlarge $N_(upright("geom"))$ and $C$ once. These geometric choices are fixed before the later analytical collar parameter $N$ is chosen. Increasing $N gt.eq N_(upright("geom"))$ only restricts this existing estimate to $r gt.eq N a_i$ and preserves its constant; it does not reconstruct the neck estimate with a new constant depending on $N$. At scale one the regular charts persist through the entire buffered interval by Corollary 13; their quotient group is therefore fixed after subsequence extraction. Widened overlapping annuli identify that group and preserve the distance-band margins in the chart construction at each time. This proves the exterior estimate uniformly in all times and radii. Only the joining-end exponents of individual extracted trees elsewhere in the argument may be decreased after extraction. ◻
]

== 4 Concentration estimates for the Ricci equation <sec:parabolic>

We work on the sequence of buffered, parabolically rescaled intervals supplied by Proposition 12. Write

$ I = \[ - theta \, 1 + theta \] \, #h(2em) epsilon.alt = sqrt(d) arrow.r 0 . $

All distances, curvatures, and time variables in this Section refer to these units. The number $a arrow.r 0$ is constant on each interval and comparable to the outermost scale at every time. Sequence indices will usually be suppressed. Choose a center $x_t$ of the isolated cluster and a nonnegative $eta in C_c^oo \( "int" I \)$ with $inf_(\[ 0 \, 1 \]) eta > 0$. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ G = eta "Ric" \, #h(2em) K^2 = a^(- 4) integral_I integral_(B_t \( x_t \, N_1 a \)) \| G \|^2 thin d mu_(g_t) thin d t . $ <eq:root-energy>]

The fixed large number $N_1$ will be chosen after the annular parameters below. All constants may depend on $eta$.

These integrals can use measurable choices of exact maximizing centers in Proposition 8. Indeed their nonempty compact sets, in a fixed closed neighborhood contained in $cal(U)$, are upper semicontinuous in time. To obtain a selection, successively choose the first member of a finite ordered cover by closed balls of mesh tending to zero that meets the previously retained compact set, and intersect with that ball. The resulting compact sets are nested, have diameter tending to zero, and have a unique common point. Intersection tests with fixed compact sets are measurable, so the limiting point is measurable. All estimates below hold for every such choice.

=== 4.1 Geometric inputs and local estimates <para:inputs>

We specify the consequences of Section 3 that enter the argument. They are sequential statements: they apply to arbitrary choices of times, radii, and windows after passage to a subsequence.

+ If $h$ is bounded above and $epsilon.alt Delta t \/ h arrow.r 0$, the geometry at length $h$ moves negligibly on a window of duration $Delta t$. On regular charts with $l gt.eq c h$, its coefficients in fixed material coordinates change by $O \( epsilon.alt Delta t \/ h \)$, with any fixed number of spatial derivatives measured at scale $h$.
+ For $h asymp a$ on these windows, the old and new centers have distance $O \( a \)$. For $a \/ h arrow.r 0$, they have distance $o \( h \)$. For the latter assertion the old cone tip persists as an intrinsic singularity. If a concentration representing it were separated from the current center by a definite fraction of $h$, the limit at their separation scale would have two distinct genuine exceptional points. The tree construction would then give a nonflat ancestor larger than $a$, contrary to Proposition 8. The cluster itself is fixed by convergence of the original distances to the isolated point of $Z$.
+ For sufficiently large fixed $C$ and every fixed $C' > 0$, distance annuli with $C a lt.eq r lt.eq C'$ admit the quotient charts of Equation (3.26), with error, through any prescribed finite order, bounded by a constant times
  #[#set math.equation(numbering: n => "(4.2)")
   $ Theta \( r \) = \( a \/ r \)^mu + delta_i r^mu \, #h(2em) delta_i arrow.r 0 \, #h(2em) epsilon.alt = o \( delta_i \) . $ <para:theta>]
  We decrease $mu$ when necessary and assume $0 < mu < 1$. The charts cover whole shortened distance annuli, their radial positioning has arbitrarily small relative error when $C$ is sufficiently large, and their finite deck groups are nontrivial.

The quantitative estimate in Item (iii) is Equation (3.26), with the prescribed finite derivative order fixed in advance and a fixed positive exterior exponent and constants uniform in time and radius. It covers every fixed upper radius $C'$ for late sequence indices, since $R_i^(upright("out")) arrow.r oo$. Whole-band coverage and radial positioning are part of the quotient-chart construction there. Positioning is only required with small relative error, not at the rate $Theta$.

For a tensor $U$, write

$ \| U \|_(j \, r) = sum_(k = 0)^j r^k \| nabla^k U \| . $

In material coordinates the lower-index Ricci equation and its constraint are

#[#set math.equation(numbering: n => "(4.3)")
 $ \( partial_t - Delta_g \) "Ric"_(i j) & = 2 R_(i k j l) "Ric"^(k l) - 2 "Ric"_i zws^k "Ric"_(k j) \,\
\( partial_t - Delta_g \) G_(i j) & = 2 R_(i k j l) G^(k l) - 2 "Ric"_i zws^k G_(k j) + eta' "Ric"_(i j) \,\
nabla^i #scale(x: 120%, y: 120%)[\(] G_(i j) - 1 / 2 g_(i j) "tr"_g G #scale(x: 120%, y: 120%)[\)] & = 0 . $ <para:ricci-equation>]

The last identity uses that $eta$ is spatially constant. On a regular patch of radius $r$, use time $tau = \( t - t_0 \) \/ r^2$ and tensor components whose size records the original $I$-unit magnitude. More precisely, for the spatial chart $Phi_r$ set

$ g_r = r^(- 2) Phi_r^(*) g \, #h(2em) G_r = r^(- 2) Phi_r^(*) G \, #h(2em) "Ric"_r = r^(- 2) Phi_r^(*) "Ric" . $

Thus $\| G_r \|_(g_r) = \| G \|_g compose Phi_r$; the symbol $"Ric"_r$ records the original magnitude and is $r^(- 2) "Ric" \( g_r \)$. We suppress these pullbacks in norm estimates. Equation (3.1) gives

#[#set math.equation(numbering: n => "(4.4)")
 $ \| "Ric" \|_(j \, r) lt.eq C_j epsilon.alt \/ r \, #h(2em) \| r^2 eta' "Ric" \|_(j \, r) lt.eq C_j epsilon.alt r . $ <para:source-scale>]

In particular the cutoff source requires no division by $eta$.

#thm([Lemma 4.1.])[
  (Local smoothing with time $L^p$ input).  #emph[Consider a linear system on a regular parabolic patch, normalized to spatial radius and temporal duration of order one, with scalar uniformly elliptic principal part. Suppose its spatial coefficient derivatives through a sufficiently high fixed order are bounded. For nested cylinders $Q' subset.double Q$ whose evaluation times have a positive past margin, a solution $U$ with source $F$ satisfies, for $1 < p lt.eq 2$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ sup_(Q') sum_(k = 0)^j \| D^k U \| lt.eq C [(frac(1, \| J \|) integral_J parallel U \( dot.op \, tau \) parallel_(L^2 \( Omega \))^p thin d tau)^(1 \/ p) + (frac(1, \| J \|) integral_J parallel F \( dot.op \, tau \) parallel_(H^(j + 3) \( Omega \))^p thin d tau)^(1 \/ p)] \, $ <para:local-mixed>]

 after enlarging $Omega times J$ inside $Q$ if necessary. The first input can instead be the normalized spacetime $L^p$ norm of $U$. Constants depend on the coefficient bounds and margins. Corresponding time $L^p$ estimates over longer windows follow by integrating sliding cylinders of unit duration.]
] <para:local-smoothing>

#proof[
  We give the energy argument, including the change of time exponent. With a spatial cutoff $zeta$ and a time cutoff that vanishes on the past boundary, multiply the equation by $zeta^2 U$ and integrate in space. Uniform ellipticity, integration by parts, and Young’s inequality give, on two nested cylinders,
  $ sup_tau parallel zeta U \( tau \) parallel_2^2 + integral parallel zeta D U parallel_2^2 thin d tau lt.eq C_m integral_Q \| U \|^2 + C (integral_J parallel F \( tau \) parallel_2 thin d tau)^2 . $
  Here $C_m$ is bounded by a fixed power of the inverse spatial and temporal margins. For the source, pair its time $L^1$ norm with the left-hand time supremum and absorb half the latter; no time $L^2$ bound on $F$ is used. First-order and zeroth-order coefficients produce terms bounded by a small multiple of the gradient energy plus $C integral \| U \|^2$.
  Differentiate spatially. The top commutator term has the form $D a thin D^(k + 1) U$, paired with $D^k U$, and is absorbed into gradient energy. All remaining commutators contain derivatives of $U$ of order at most $k$ with bounded coefficients. Applying the preceding estimate successively on smaller cylinders controls $sup_tau parallel U parallel_(H^m)$ and $parallel U parallel_(L_tau^2 H^(m + 1))$ by $parallel U parallel_(L^2 \( Q \)) + parallel F parallel_(L_tau^1 H^m)$. At each step the spacetime norm of the next derivative was supplied by the previous gradient energy. Taking $m = j + 3$ and using the four-dimensional Sobolev embedding $H^(j + 3) arrow.r.hook C^j$ proves the assertion with time exponent two for $U$ and exponent one for $F$.
  For completeness, let $X \( rho \)$ denote the resulting spatial and temporal supremum on a member of a nested family of cylinders. For $rho < sigma$, interpolate the time $L^2$ spatial $L^2$ norm against the larger supremum to obtain
  $ X \( rho \) lt.eq C \( sigma - rho \)^(- M) X \( sigma \)^(1 - p \/ 2) parallel U parallel_(L_tau^p L_x^2)^(p \/ 2) + C \( sigma - rho \)^(- M) parallel F parallel_(L_tau^p H_x^(j + 3)) . $
  Normalized and unnormalized time norms are comparable on these fixed cylinders. Young’s inequality makes the first right-hand term at most $kappa X \( sigma \) + C_kappa \( sigma - rho \)^(- M') parallel U parallel_(L_tau^p L_x^2)$. Take margins proportional to $2^(- n)$ and $kappa < 2^(- M' - 1)$. Iteration sums a convergent geometric series; the terminal term tends to zero since the smooth solution has finite supremum on the enclosing compact cylinder. This proves Equation (4.5). Interpolating $parallel U parallel_(L^2 \( Q \))$ against the larger spacetime supremum in exactly this displayed Young inequality, with $parallel U parallel_(L^p \( Q \))$ in place of the mixed norm, proves the spacetime variant. Finally integrate the $p$th power of the local estimate over the evaluation time. Fubini’s theorem bounds the integral of the sliding averages by a constant times the input integral on the enlarged window. ◻
]

=== 4.2 The spherical projection and the missing radial mode <para:radial-subsection>

Lift a quotient annulus to its Euclidean cover and record tensor components in a Cartesian frame. Let $P$ subtract the componentwise spherical average at every radius. This operation preserves equivariance and commutes with the componentwise flat heat operator.

#thm([Lemma 4.2.])[
  (A radial inequality for the oscillation).  #emph[Suppose $P Z = Z$, $Z$ is compactly supported in time, and $E = \( partial_tau - Delta_delta \) Z$. For $1 < p lt.eq 2$, set 
$ z \( s \) = ∥thin parallel Z \( s \, dot.op \, tau \) parallel_(L^2 \( S^3 \)) thin∥_(L_tau^p) . $

 With either ordinary or constant-normalized time measure, 
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(L) z := - z'' - 3 / s z' + 3 / s^2 z lt.eq ∥thin parallel E \( s \, dot.op \, tau \) parallel_(L^2 \( S^3 \)) thin∥_(L_tau^p) . $ <para:radial-inequality>]

 For $p = 2$ the same conclusion holds for a Hilbert direct sum of fields in different charts or time windows with the same radial variable. The homogeneous comparison powers are $s$ and $s^(- 3)$.]
] <para:radial-lemma>

#proof[
  Put $w \( s \, tau \) = parallel Z \( s \, dot.op \, tau \) parallel_2$. Where $w > 0$, pair the equation with $Z \/ w$. Convexity of the Hilbert norm gives $chevron.l Z \, Z_(s s) chevron.r \/ w lt.eq w_(s s)$, and the zero spherical mean gives $parallel nabla_(S^3) Z parallel_2^2 gt.eq 3 parallel Z parallel_2^2$. Consequently
  $ w_tau - w_(s s) - 3 s^(- 1) w_s + 3 s^(- 2) w lt.eq parallel E parallel_2 . $
  Multiply by $w^(p - 1)$ and integrate in time. The time term vanishes by compact support. If $z = \( integral w^p \)^(1 \/ p)$, then
  $ integral w^(p - 1) w_s = z^(p - 1) z' \, #h(2em) integral w^(p - 1) w_(s s) lt.eq z^(p - 1) z'' . $
  For the second inequality, differentiate the first identity and use $\| z' \|^2 lt.eq z^(2 - p) integral w^(p - 2) w_s^2$, which is Cauchy’s inequality. Hölder’s inequality bounds the integrated source by $z^(p - 1) parallel parallel E parallel_2 parallel_p$. Division proves Equation (4.6). At zeros, work on a finite time interval containing the support and replace each norm by its square plus a positive constant under a square root. The regularized time boundary values agree, so their derivative integral still vanishes. Perform the calculation and let the constant tend to zero on compact subannuli; the norm and spectral-gap regularization errors tend to zero there. The resulting inequalities hold distributionally. The direct-sum assertion uses the same Hilbert norm computation. Finally
  $ cal(L) \( s^beta \) = \[ 3 - beta \( beta + 2 \) \] s^(beta - 2) \, $
  whose two zero exponents are $1$ and $- 3$. ◻
]

#thm([Lemma 4.3.])[
  (Control of the spherical mean derivatives).  #emph[Let $T$ be a spatially constant multiple of $"Ric"$ on an annulus whose metric has scaled $C^(j + 1)$ distance at most $e$ from $delta$. On a fixed-width shell of radius $s$ in its Cartesian coordinates, 
#[#set math.equation(numbering: n => "(4.7)")
 $ sum_(k = 1)^j s^k \| nabla^k T \| lt.eq C_j (sum_(k = 1)^j s^k sup \| D^k P T \| + e sup \| T \|_(j \, s)) \, $ <para:mean-derivatives>]

 where the suprema on the right use a fixed enlargement of the shell.]
] <para:mean-lemma>

#proof[
  Take the flat trace reversal $S = T - 1 / 2 delta "tr"_delta T$ and write $S = overline(S) \( s \) + P S$. Comparing the true divergence constraint with flat divergence gives
  $ partial_i S_(i j) = cal(E)_j \, #h(2em) s^(k + 1) \| D^k cal(E) \| lt.eq C_j e thin sup \| T \|_(k + 1 \, s) quad \( 0 lt.eq k < j \) . $
  This follows directly by expanding $g^(i j) - delta^(i j)$, $Gamma \( g \)$, and the difference between the two trace reversals; each term contains either a metric error times $D T$ or a metric derivative times $T$. For every unit radial vector $n$, the equation at $x = s n$ reads
  $ overline(S)'_(i j) \( s \) n_i = cal(E)_j \( s n \) - partial_i \( P S \)_(i j) \( s n \) . $
  Taking $n$ to be each coordinate unit vector bounds every entry of $overline(S)'$. Radially differentiating this identity at fixed $n$ bounds the successive derivatives of $overline(S)$ by the displayed error derivatives and derivatives of $P S$. Cartesian derivatives of a radial matrix are combinations of these radial derivatives with powers of $s^(- 1)$, so the scaled bounds follow. In dimension four the trace-reversal map is an involution, since $"tr"_delta S = - "tr"_delta T$; it is therefore invertible. Conversion from Cartesian to covariant derivatives adds only the stated metric-error terms. ◻
]

The two Lemmas explain why a degree-zero critical mode cannot obstruct the estimates. Although $s^(- 2) A$ is componentwise harmonic for a constant symmetric matrix $A$, its flat trace-reversed divergence is

$ - 2 s^(- 3) #scale(x: 120%, y: 120%)[\(] A - 1 / 2 delta "tr"_delta A #scale(x: 120%, y: 120%)[\)] n . $

It vanishes for every $n$ only if $A = 0$. Spatially constant tensors can survive, but have no positive spatial derivatives; their values will be fixed by an outer boundary estimate. The trace-reversal calculation is closely related to the improvement of ALE metric decay in the proof of Deruelle–Kröncke’s Theorem 2.7 in the arXiv version #cite(label("DeruelleKroncke2021")). Their field is a stationary metric perturbation in a chosen gauge. Here the contracted Bianchi identity constrains the evolving Ricci tensor itself, and the two lemmas provide the quantitative derivative bounds needed below.

=== 4.3 The exterior estimate <para:exterior-subsection>

We apply the missing-mode argument on successive annuli. The goal is decay faster than the dimensional $r^(- 2)$ rate for the part of Ricci controlled by the root energy. The spatially constant part is instead controlled from a fixed outer annulus; separating these two contributions prevents a loss proportional to the number of shells. Take dyadic radii based on $a$, and define

$ cal(A)_t \( r \) = { y : r \/ 2 lt.eq d_t \( x_t \, y \) lt.eq 2 r } \, quad A \( r \) = ∥sup_(cal(A)_t \( r \)) \| G \|∥_(L^2 \( I \)) \, quad V \( r \) = ∥sup_(cal(A)_t \( r \)) sum_(j = 1)^m r^j \| nabla^j G \|∥_(L^2 \( I \)) . $

Here $m$ is a fixed sufficiently high order, for example $60$. We may replace widths by fixed neighboring dyadic widths; a star will indicate a maximum over a fixed number of such neighbors.

#thm([Proposition 4.4.])[
  (Exterior concentration bound).  #emph[There are fixed $N_0 gt.double 1$, $r_0 > 0$, and $0 < alpha < min \( mu \, 1 \)$, and a choice of $N_1$ in Equation (4.1), such that 
#[#set math.equation(numbering: n => "(4.8)")
 $ V \( r \) & lt.eq C [\( a \/ r \)^(2 + alpha) K + tilde(delta)_i #scale(x: 120%, y: 120%)[\(] \( a \/ r \)^alpha + r^alpha #scale(x: 120%, y: 120%)[\)]] \,\
A \( r \) & lt.eq C [\( a \/ r \)^(2 + alpha) K + tilde(delta)_i] $ <para:exterior-v>]

 for $N_0 a lt.eq r lt.eq r_0$, where $tilde(delta)_i arrow.r 0$ and $tilde(delta)_i gt.eq epsilon.alt$. The constants are independent of $i$ and $r$.]
] <prop:exterior-ricci>

#proof[
  #emph[Fixed charts and operator errors.] Fix a large dyadic $H$, to be chosen first, and then a large $T_0$. Around an intermediate radius $r$ use annuli $1 \/ \( c H \) lt.eq s lt.eq c H$ in $r$-units and time windows of length $T_0 r^2$, where $c$ is a fixed ample constant. Keep each annular chart fixed in material points. The motion bound at the smallest comparable radius is
  $ C epsilon.alt T_0 H r lt.eq C_(H \, T_0) Theta \( r \) \, $
  by $mu < 1$ and $epsilon.alt = o \( delta_i \)$. Thus the metric error through all required spatial orders is $C_(H \, T_0) Theta \( r \)$ throughout the window. The center and distance comparisons in Section 4.1 ensure coverage of the same shortened distance annuli at each time. Uniform coverage follows by the sequential criterion, first increasing $N_0$ after $H \, T_0$ and then taking late indices. Choose $r_0$ small enough that the enlarged windows near $"supp" eta$ remain in $I$.
  Let $cal(R) \( r \)$ be the dyadic radii in $\[ r \/ \( c' H \) \, c' H r \]$, for another fixed ample $c'$. Applying Lemma 15 on bounded-width regular patches and integrating sliding windows bounds true-field derivatives through any prescribed fixed order by
  #[#set math.equation(numbering: n => "(4.9)")
   $ C_(H \, T_0) (max_(rho in cal(R) \( r \)) A \( rho \) + epsilon.alt r) quad upright("in ") L^2 \( I \) . $ <para:true-field-bound>]
  Regions disjoint from the time support contribute zero.
  #emph[Projection and the time cutoff.] Cover $"supp" eta$ by smaller windows and choose smooth cutoffs $chi_ell$ equal to one there, supported on the respective larger windows, with uniformly bounded overlap and $\| partial_t chi_ell \| lt.eq C \/ \( T_0 r^2 \)$. Their smaller windows have an additional time margin of order $r^2$. In the Hilbert direct sum of Lemma 16, use $Z_ell = chi_ell P G$ in each chart. Time norms can be measured in $I$-time: its constant factor relative to $r^2$-time multiplies both sides of the radial inequality. Let $cal(B)_r$ be the dimensionless zeroth-order operator obtained from the first two terms of Equation (4.3):
  $ cal(B)_r U = 2 "Rm" \( g_r \) \( U \) - 2 "Ric" \( g_r \) compose U . $
  Its coefficients and scaled spatial derivatives are bounded by $C_(H \, T_0) Theta \( r \)$ on the annulus. With the explicit rescaled notation above, the flat-equation forcing is the sum of
  $ chi_ell P #scale(x: 120%, y: 120%)[\[] \( Delta_(g_r) - Delta_delta \) G_r + cal(B)_r G_r + r^2 eta' "Ric"_r #scale(x: 120%, y: 120%)[\]] quad upright("and") quad \( partial_tau chi_ell \) P G_r \, $
  where the first operator difference includes the connection terms appropriate to tensor components. Equation (4.9) and flatness bound the norm of the first part, uniformly for $H^(- 1) lt.eq s lt.eq H$, by $C_(H \, T_0) \( Theta \( r \) max_(cal(R) \( r \)) A + epsilon.alt r \)$. For the second part use the angular Poincaré estimate at its #emph[own] radius:
  $ parallel P G \( s \) parallel_(L^2 \( S^3 \)) lt.eq C s r sup \| nabla G \| + C_(H \, T_0) Theta \( r \) sup \| G \| . $
  Bounded overlap is independent of $T_0$. The cutoff contribution therefore has the separate bound
  #[#set math.equation(numbering: n => "(4.10)")
   $ C_H / T_0 max_(rho in cal(R) \( r \)) V \( rho \) + C_(H \, T_0) Theta \( r \) max_(rho in cal(R) \( r \)) A \( rho \) . $ <para:time-cutoff-term>]
  The leading coefficient $C_H \/ T_0$ contains no chart-persistence constant. In particular it does not multiply the uncontrolled spherical mean of $G$.
  At $s = H^(- 1)$ and $s = H$ the same angular inequality gives boundary values at most $C V_(*) \( r \/ H \)$ and $C V_(*) \( H r \)$, respectively, plus $C_(H \, T_0) Theta max A$. The first constant $C$ is independent of $H \, T_0$, since each angular derivative is normalized by the boundary’s own radius. Let $E_0$ denote the sum of the forcing bounds just obtained. The nonnegative comparison function
  $ C V_(*) \( r \/ H \) H^(- 3) s^(- 3) + C V_(*) \( H r \) H^(- 1) s + 1 / 3 H^2 E_0 $
  dominates the boundary data after adding the boundary metric errors to $E_0$, and its $cal(L)$ is at least $E_0$ on $\[ H^(- 1) \, H \]$. The one-dimensional maximum principle, valid also for the weak inequality, bounds $z$ by this function. On any fixed middle annulus this gives the two leading terms with factors $H^(- 3)$ and $H^(- 1)$; all inhomogeneous constants may depend on $H$.
  Apply flat local smoothing on fixed-width middle patches. The extra past margin ensures that each entire unit-size smoothing cylinder lies where $chi_ell equiv 1$. Thus the equation differentiated in that cylinder contains only the true operator errors and the $eta'$ source; it contains no $chi'_ell P G$ term. Integrating $z^2$ against $s^3 thin d s$ on a slightly larger fixed middle annulus supplies its spacetime input. Integrate the resulting local estimates over the smaller time windows and sum their squares. The time margins and spatial margins here are of unit order, so the leading constants are independent of $H \, T_0$. Higher derivatives of the forcing are bounded by Equation (4.9) at higher fixed orders. Finally Lemma 17 supplies the positive derivatives of the spherical mean. We have proved
  #[#set math.equation(numbering: n => "(4.11)")
   $ V \( r \) lt.eq  & C #scale(x: 120%, y: 120%)[\[] H^(- 3) V_(*) \( r \/ H \) + H^(- 1) V_(*) \( H r \) #scale(x: 120%, y: 120%)[\]] + C_H / T_0 max_(rho in cal(R) \( r \)) V \( rho \)\
 & + C_(H \, T_0) [Theta \( r \) max_(rho in cal(R) \( r \)) A \( rho \) + epsilon.alt r] . $ <para:exterior-recurrence>]
  It is used only when its enlarged widths stay in the prescribed range.
  #emph[Magnitude and boundary estimates.] At each time join a point on a shell of radius $rho$ to the next outgoing shell by a path of length $C rho$, and join points within that shell at the same cost. Connected quotient annuli and whole-band coverage provide these paths. Integrating the covariant derivative of $G$ along the paths, or the derivative of its norm, gives a pointwise-in-time telescoping bound. Minkowski’s inequality gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ A \( r \) lt.eq C sum_(rho upright(" dyadic")\
r lt.eq rho lt.eq r_0) V \( rho \) + C epsilon.alt . $ <para:magnitude-sum>]
  A fixed number of neighbors below $r$ may be included to accommodate the chosen widths. The outer boundary annuli have $A + V lt.eq C_(H \, r_0) epsilon.alt$ by Equation (4.4). The inner boundary annuli have radii comparable to $a$ with fixed, possibly large, factors. Choose $N_1$ to include all enlarged regular patches there at their respective times; this uses the $O \( a \)$ center-motion bound. Local smoothing, followed by integration of sliding windows, yields
  #[#set math.equation(numbering: n => "(4.13)")
   $ A \( r \) + V \( r \) lt.eq C #scale(x: 120%, y: 120%)[\[] \( a \/ r \)^2 K + epsilon.alt r #scale(x: 120%, y: 120%)[\]] quad upright("on the inner boundary range") . $ <para:inner-boundary>]
  The factor $r^(- 2)$ is the square root of normalized four-dimensional volume. Time integration cancels the sliding-window time average, so it introduces no additional negative power of $r$.
  #emph[Closing the recurrence, in the required order.] Fix $0 < alpha < min \( mu \, 1 \)$, and take $tilde(delta)_i gt.eq epsilon.alt$ positive and tending to zero sufficiently slowly. Put
  $ W_K \( r \) = \( a \/ r \)^(2 + alpha) K \, quad W_0 \( r \) = tilde(delta)_i #scale(x: 120%, y: 120%)[\[] \( a \/ r \)^alpha + r^alpha #scale(x: 120%, y: 120%)[\]] \, quad M = max_r frac(V \( r \), W_K \( r \) + W_0 \( r \)) . $
  For each index this maximum over finitely many radii is finite. The geometric series in Equation (4.12) imply
  #[#set math.equation(numbering: n => "(4.14)")
   $ A \( r \) lt.eq C M #scale(x: 120%, y: 120%)[\[] W_K \( r \) + tilde(delta)_i #scale(x: 120%, y: 120%)[\]] + C epsilon.alt . $ <para:sum-weight>]
  Indeed the three sums involve the powers $- 2 - alpha$, $- alpha$, and $alpha$, and are bounded respectively by their initial value, a constant, and a constant. Thus no number-of-shells factor occurs.
  For each power $r^beta$ in $W_K + W_0$, $- 2 - alpha lt.eq beta lt.eq alpha$. The two leading terms in Equation (4.11), divided by this weight, are bounded by
  $ C #scale(x: 120%, y: 120%)[\(] H^(- 3 - beta) + H^(- 1 + beta) #scale(x: 120%, y: 120%)[\)] M lt.eq C' H^(- 1 + alpha) M . $
  Fixed neighboring widths change only $C'$. Choose $H$ so this is at most $M \/ 8$. For this fixed $H$ there is a finite constant $L_H$ with $max_(cal(R) \( r \)) W \/ W \( r \) lt.eq L_H$; choose $T_0$ so $\( C_H \/ T_0 \) L_H lt.eq 1 \/ 8$.
  For the metric terms in Equation (4.14), uniform smallness of $Theta$ controls the $W_K$ part. For the constant $tilde(delta)_i$ part use the sharper inequality
  #[#set math.equation(numbering: n => "(4.15)")
   $ frac(Theta \( r \), \( a \/ r \)^alpha + r^alpha) lt.eq \( a \/ r \)^(mu - alpha) + delta_i r^(mu - alpha) . $ <para:metric-ratio>]
  Now increase $N_0$ to make the first term uniformly small on all needed enlarged radii. With $r_0$ already chosen for the buffers, fix $N_1$ large enough for Equation (4.13). Finally take the sequence index sufficiently late to make the second term small and ensure the stated chart coverage. This absorbs the metric contribution into at most $M \/ 4$. Thus the smallness choices are made in the order $H$, $T_0$, $N_0$, and the late sequence index; all constants may depend on the parameters already fixed. The remaining source is bounded relative to $W_0$ because $epsilon.alt r lt.eq tilde(delta)_i r^alpha$ for $r < 1$. The two boundary ranges have bounded ratios by Equation (4.13) and the outer $O \( epsilon.alt \)$ bound. Their constants may depend on the fixed parameters. Consequently $M lt.eq C + M \/ 2$. This proves Equation (4.8), and Equation (4.14) proves Equation (4.8). ◻
]

=== 4.4 The maximal function controlling the root <para:maximal-subsection>

Fix a sufficiently large $D_0$ and consider the tree pieces inside $B_t \( x_t \, D_0 a \)$. Choose an ample fixed $D_1 > D_0$, enlarging it to include the short-time comparison patches. Extend functions of time by zero outside $I$, fix $1 < p < 2$, and set

#[#set math.equation(numbering: n => "(4.16)")
 $ f \( t \) = a^(- 2) parallel G \( dot.op \, t \) parallel_(L^2 \( B_t \( x_t \, D_1 a \) \)) \, #h(2em) H_(*) \( t \) = #scale(x: 120%, y: 120%)[\(] cal(M) \( f^p \) \( t \) #scale(x: 120%, y: 120%)[\)]^(1 \/ p) \, $ <para:maximal-definition>]

where $cal(M)$ is the centered Hardy–Littlewood maximal operator on the time line #cite(label("HardyLittlewood1930")). We include its exact boundedness argument at the exponent needed below.

#thm([Lemma 4.5.])[
  #emph[For every fixed $D_1$, 
#[#set math.equation(numbering: n => "(4.17)")
 $ parallel H_(*) parallel_(L^2 \( bb(R) \)) lt.eq C_(D_1 \, p) \( K + o_i \( 1 \) \) . $ <eq:maximal-ricci>]

]
] <para:maximal-lemma>

#proof[
  The energy ball bounds the corresponding part of $parallel f parallel_2$ by $K$. Its complement in the larger ball uses finitely many dyadic shells, with number and radius factors depending only on $D_1 \, N_1$. Volume upper bounds and Proposition 18 bound each shell’s contribution by
  $ C \( r \/ a \)^2 A \( r \) lt.eq C \( a \/ r \)^alpha K + C \( r \/ a \)^2 tilde(delta)_i . $
  Hence $parallel f parallel_2 lt.eq C_(D_1) \( K + o_i \( 1 \) \)$.
  We recall the maximal estimate at the exact exponent needed here. The interval covering argument chooses disjoint witnessing intervals whose triples cover a compact subset of a maximal level set. It gives $\| { cal(M) v > lambda } \| lt.eq C parallel v parallel_1 \/ lambda$. Apply this to $v upright(bold(1))_({ v > lambda \/ 2 })$, since the discarded part has every average at most $lambda \/ 2$. For $q > 1$, integrating the distribution function then gives
  $ parallel cal(M) v parallel_q^q & lt.eq C q integral_0^oo lambda^(q - 2) integral_({ v > lambda \/ 2 }) v \( t \) thin d t thin d lambda\
 & lt.eq C_q integral_(bb(R)) v^q . $
  Take $v = f^p$ and $q = 2 \/ p > 1$. Thus $parallel H_(*) parallel_2 lt.eq C_p parallel f parallel_2$, proving the claim. ◻
]

=== 4.5 A weighted estimate at a single time <para:interior-subsection>

The exterior estimate controls the collar error in time-integrated norms. The static input also needs a bound at a single time on every smaller descendant and joining neck. The maximal function just defined provides the time control; we now obtain the additional exponential weight along a deep neck.

#thm([Proposition 4.6.])[
  (Interior estimate with a neck weight).  #emph[Take any sequence of times with $eta \( t \) eq.not 0$ and extract a tree as in Theorem 6. On its true compact and half-neck pieces in $B_t \( x_t \, D_0 a \)$, let $r$ be the physical length of the local regular patch, in $I$-units. For every fixed required derivative order $j$ there are $C \, nu > 0$ such that 
#[#set math.equation(numbering: n => "(4.18)")
 $ \( r \/ a \)^2 \| G \|_(j \, r) \( t \) lt.eq C #scale(x: 120%, y: 120%)[\(] H_(*) \( t \) + epsilon.alt #scale(x: 120%, y: 120%)[\)] e^(- nu D) . $ <eq:interior-weighted>]

 Here $D = 0$ on compact pieces, including truncated outer compact regions. On a joining neck $D$, up to bounded shifts, is the minimum of the logarithmic distances from the two ends. It is the half-neck coordinate used in Section 2. Constants may depend on the extracted tree, and the exponent may be decreased.]
] <prop:interior-ricci>

#proof[
  For a regular patch of radius $r lt.tilde a$, apply Lemma 15 over a past window of length $c r^2$. The patch lies in the larger ball defining $f$ at its respective times, by Section 4.1; shorten its fixed size if needed. Its normalized spatial $L^2$ input, after multiplying the field by $\( r \/ a \)^2$, is bounded by $C f$. The centered maximal average at the specified time controls its time $L^p$ average. The source is bounded by $C epsilon.alt r \( r \/ a \)^2 lt.eq C epsilon.alt$ for late indices. We obtain Equation (4.18) without its exponential factor. This proves the compact case and every bounded-depth neck case.
  It remains to gain decay as $D arrow.r oo$. On such a neck $r lt.eq C a e^(- D)$. Choose $lambda > 0$ sufficiently small and put
  #[#set math.equation(numbering: n => "(4.19)")
   $ h = e^(- 4 lambda D) \, #h(2em) B = e^(lambda D) . $ <para:neck-window>]
  Use the annulus $h lt.eq s lt.eq B$ in $r$-units, with fixed-factor enlargements, and a time window of length $C B^2 r^2$ centered at the specified time. By Equation (3.18), the initial spatial error through every required order is bounded by $C e^(- mu \( 1 - 4 lambda \) D)$. The worst motion error occurs at the innermost radius and is at most
  $ C epsilon.alt B^2 r \/ h lt.eq C epsilon.alt a e^(- \( 1 - 6 lambda \) D) . $
  Choose $lambda$ so small that $min { mu \( 1 - 4 lambda \) \, 1 - 6 lambda \, 3 - 3 lambda } > 3 lambda$. After decreasing an exponent, the fixed material coordinates therefore satisfy a uniform scaled error bound
  #[#set math.equation(numbering: n => "(4.20)")
   $ e_D = C e^(- delta D) \, #h(2em) delta > 3 lambda . $ <para:deep-metric-error>]
  Regular flat annular limits make the local persistence constants uniform across these shells. The entire window stays in $I$, since $B r lt.eq C a e^(- \( 1 - lambda \) D)$, and the enlarged spatial patches remain in the $D_1 a$ ball by the same motion comparisons.
  Write $T_1 = \( r \/ a \)^2 G$ in components recording unscaled magnitude, and $Q = H_(*) \( t \) + epsilon.alt$. For every shell of radius $s$, its normalized spatial $L^2$ input obeys
  #[#set math.equation(numbering: n => "(4.21)")
   $ \( r \/ a \)^2 \( s r \)^(- 2) parallel G \( dot.op \, u \) parallel_(L^2 \( B_u \( x_u \, D_1 a \) \)) = s^(- 2) f \( u \) . $ <para:interior-normalization>]
  Integrate the local estimate on sliding windows of length $c s^2 r^2$ inside the larger window. Fubini’s theorem cancels their time normalization, and the remaining centered window average is bounded by $H_(*) \( t \)$. Thus, for any fixed high order $J$, both the time $L^p$ average over a window $J'$ of length comparable to $B^2 r^2$ and the value at time $t$ satisfy
  #[#set math.equation(numbering: n => "(4.22)")
   $ (frac(1, \| J' \|) integral_(J') sup_(upright("shell ") s) \| T_1 \|_(J \, s)^p thin d u)^(1 \/ p) lt.eq C Q s^(- 2) \, #h(2em) sup_(upright("shell ") s) \| T_1 \|_(J \, s) \( t \) lt.eq C Q s^(- 2) . $ <para:rough-neck>]
  Here derivatives in $\| T_1 \|_(J \, s)$ are in $r$-coordinates, so they represent physical scale $s r$. To verify the source estimate used in these applications, its size in shell parabolic units is
  $ C epsilon.alt \( r \/ a \)^2 s r . $
  After division by $Q s^(- 2)$ this is at most $C \( r^3 \/ a^2 \) s^3 lt.eq C a e^(- \( 3 - 3 lambda \) D)$. It is absorbed in Equation (4.20), after decreasing $delta$. This also proves the forcing estimate at all fixed spatial derivative orders.
  Take a time cutoff $chi$ supported in the large window, equal to one on an ample middle window, with $\| partial_tau chi \| lt.eq C B^(- 2)$ in $r^2$-time. Apply Lemma 16 to $Z = chi P T_1$, using time measure normalized by a constant times $B^2$. The metric and curvature operator errors cost $C Q e^(- delta D) s^(- 4)$: there are two inverse shell radii from the operator and $Q s^(- 2)$ from Equation (4.22). The cutoff costs $C Q B^(- 2) s^(- 2)$. Therefore
  $ cal(L) z lt.eq C Q #scale(x: 120%, y: 120%)[\(] e^(- delta D) s^(- 4) + B^(- 2) s^(- 2) #scale(x: 120%, y: 120%)[\)] \, quad z \( h \) lt.eq C Q h^(- 2) \, quad z \( B \) lt.eq C Q B^(- 2) . $
  The four terms in the following barrier have explicit roles:
  #[#set math.equation(numbering: n => "(4.23)")
   $ z \( s \) lt.eq C Q (h s^(- 3) + B^(- 3) s + B^(- 2) + e^(- delta D) s^(- 2)) . $ <para:interior-barrier>]
  The first two are $cal(L)$-harmonic and dominate the inner and outer data. The last two supply the forcing, since $cal(L) \( B^(- 2) \) = 3 B^(- 2) s^(- 2)$ and $cal(L) \( e^(- delta D) s^(- 2) \) = 3 e^(- delta D) s^(- 4)$. The maximum principle proves Equation (4.23).
  We next pass from the long time average to the one specified time. For $1 lt.eq s lt.eq B \/ 4$, choose a parabolic patch of temporal size $c s^2$ where $chi = 1$. Restricting a normalized $L^p$ time norm from duration $C B^2$ to this patch costs exactly the bound
  #[#set math.equation(numbering: n => "(4.24)")
   $ C \( B \/ s \)^(2 \/ p) . $ <para:time-average-loss>]
  Angular $L^2$ controls angular $L^p$ because $p lt.eq 2$. Integrating Equation (4.23) over a fixed-width radial shell therefore supplies the normalized spacetime $L^p$ input for the flat local estimate in Lemma 15. The operator errors and their spatial derivatives are controlled by Equation (4.22). Lemma 17 then restores the positive derivatives of the mean, with additional error $C Q e^(- delta D) s^(- 2)$, already bounded by the expression below. Since $B^(- 3) s lt.eq B^(- 2)$ on this range, the result is
  #[#set math.equation(numbering: n => "(4.25)")
   $ sup_(upright("shell ") s) sum_(k = 1)^j s^k \| D^k T_1 \| \( t \) lt.eq C Q \( B \/ s \)^(2 \/ p) (h s^(- 3) + B^(- 2) + e^(- delta D) s^(- 2)) . $ <para:single-time-derivative>]
  Covariant derivatives obey the same bound after the metric-error terms are included. The factor in Equation (4.24) has been retained in every term.
  At radius $B \/ 4$, Equation (4.22) bounds the value of $T_1 \( t \)$ by $C Q B^(- 2)$. Integrate the Cartesian first derivative along each radial ray down to radius one. A scaled first derivative at radius $s$ contributes its bound times $d s \/ s$; thus
  $ \| T_1 \|_(j \, 1) \( t \) & lt.eq C Q [B^(- 2) + B^(2 \/ p) integral_1^(B \/ 4) (h s^(- 3 - 2 \/ p) + B^(- 2) s^(- 2 \/ p) + e^(- delta D) s^(- 2 - 2 \/ p)) frac(d s, s)]\
 & lt.eq C Q [B^(- 2) + B^(2 \/ p) h + B^(- 2 + 2 \/ p) + B^(2 \/ p) e^(- delta D)] . $
  Higher derivatives at radius one are already covered by Equation (4.25). The four decay exponents in $D$ are respectively
  $ 2 lambda \, #h(2em) \( 4 - 2 \/ p \) lambda \, #h(2em) \( 2 - 2 \/ p \) lambda \, #h(2em) delta - \( 2 \/ p \) lambda . $
  They are positive because $1 < p < 2$ and $delta > 3 lambda$. Choose $nu$ smaller than their minimum. This proves Equation (4.18). ◻
]

There is also an uncut qualitative estimate on these true pieces:

#[#set math.equation(numbering: n => "(4.26)")
 $ r^2 \| "Ric" \|_(j \, r) lt.eq C epsilon.alt r lt.eq o_i \( 1 \) e^(- nu D) \, $ <para:uncut-weight>]

with $nu$ decreased below one, using $r lt.eq C a e^(- D)$ on deep necks and $r lt.eq C a$ on compact pieces. Equation (4.18) supplies the stronger estimate relative to the energy and cutoff. In the root units used in Section 2, its precise form is

$ eta thin r^2 \| "Ric" \|_(j \, r) lt.eq C a^2 \( H_(*) + epsilon.alt \) e^(- nu D) . $

Together with Equation (4.17), this is the interface used for the functional estimate in Section 6.

== 5 An exterior extension determined by a fixed collar <sec:collar>

A nearly flat exterior can carry a Ricci-flat field whose size is much larger than its Ricci tensor. Cutting the metric off directly to the Euclidean metric would lose this distinction. We construct an extension which retains the field detected by a fixed collar. The extension is an analytic function of that collar metric. The longer exterior is used only to estimate the error of this function; neither its coordinates nor any comparison gauge will have to vary differentiably in time.

=== 5.1 Norms and the extension statement <collar:statement>

All lengths in this Section are in collar units. Let $Gamma subset O \( 4 \)$ be a nontrivial finite group acting freely on $S^3$, and put

$ C_1 = { 1 lt.eq \| x \| lt.eq 2 } \/ Gamma \, #h(2em) cal(E) = { \| x \| gt.eq 1 } \/ Gamma . $

Calculations are made with equivariant Cartesian components on the Euclidean cover. For a fixed-ratio shell $Omega_r$, use the norm

#[#set math.equation(numbering: n => "(5.1)")
 $ parallel v parallel_(H^s \( r \))^2 = sum_(j = 0)^s r^(2 j - 4) integral_(tilde(Omega)_r) \| partial^j v \|^2 thin d x \, #h(2em) \| v \|_(C^s \, r) = sum_(j = 0)^s r^j sup_(tilde(Omega)_r) \| partial^j v \| . $ <collar:scaled-norms>]

Here $tilde(Omega)_r$ is the lifted shell. Thus derivatives, but not the sizes of tensor components, are rescaled. In particular, $parallel cal(K) \( v \) parallel_(H^(s - 2) \( r \))$ is bounded by $C r^(- 2) parallel v parallel_(H^s \( r \))$. Equivalent fixed enlargements of the shells will be used without changing notation. At a boundary they are one-sided annuli of a fixed positive relative width. Define

$ parallel v parallel_(H_beta^s \( cal(E) \)) = sup_(r in { 1 \, 2 \, 4 \, dots.h }) r^beta parallel v parallel_(H^s \( r \)) . $

On filled Euclidean space the corresponding norm also includes an ordinary Sobolev norm on the ball of radius two. These conventions give constants independent of $Gamma$: all estimates are on the fixed cover and finite-group averaging has norm at most one. Every relation $rho asymp r$ below ranges over a fixed finite number of neighboring dyadic shells. Its comparison width is chosen once to include the initial shells affected by the collar correction and is independent of the outer radius $R$.

Fix $k = 30$ and $1 < q < 2$. Let $R$ be a large dyadic radius; $R$ in this Section does not denote scalar curvature. Suppose a metric $g$, expressed in these coordinates on $1 lt.eq \| x \| lt.eq 4 R$, satisfies

#[#set math.equation(numbering: n => "(5.2)")
 $ \| g - delta \|_(C^(k + 2) \, r) lt.eq theta_r \, #h(2em) sum_(1 lt.eq r lt.eq R) theta_r lt.eq sigma \, #h(2em) theta_r gt.eq parallel g - delta parallel_(H^k \( C_1 \)) r^(- q) . $ <collar:metric-smallness>]

The weights are positive and comparable on neighboring shells, with fixed comparison constants; the hypotheses include the fixed enlargements needed below. A fixed multiplicative constant in the last inequality can be incorporated into the weights. Set

#[#set math.equation(numbering: n => "(5.3)")
 $ m_1 =  & sup_(C_1) \| "Ric" \( g \) \| + sum_(1 lt.eq r lt.eq R) sup_(Omega_r^(+)) (theta_r \| "Ric" \( g \) \| + sum_(j = 1)^(k - 2) r^j \| nabla_g^j "Ric" \( g \) \|) + theta_R / R^2 \, $ <eq:collar-residual>]

where $Omega_r^(+)$ denotes the specified ample enlargement. Curvature norms on the right are intrinsic; since the metrics are uniformly close to $delta$, changing to Cartesian component magnitudes costs only a fixed factor.

#thm([Theorem 5.1.])[
  (Collar extension).  #emph[There are $sigma_(*) > 0$, $R_(*) < oo$, and $C < oo$, depending only on $q \, k$, the fixed shell choices, and the weight comparison constants, with the following property. If $sigma lt.eq sigma_(*)$ and $R gt.eq R_(*)$, there is a metric $macron(h)$ on $cal(E)$ such that 
#[#set math.equation(numbering: n => "(5.4)")
 $ parallel macron(h) - delta parallel_(H_q^k) & lt.eq C parallel g - delta parallel_(H^k \( C_1 \)) \,\
parallel g - macron(h) parallel_(H^k \( C_1 \)) + parallel "Ric" \( macron(h) \) parallel_(H_(q + 2)^(k - 2)) & lt.eq C m_1 . $ <eq:collar-extension>]

 The map $g \|_(C_1) mapsto macron(h) - delta$ is real analytic on a fixed neighborhood of zero in collar $H^k$, and its first derivative into $H_q^k$ has uniformly bounded operator norm. It is independent of $R$, the weights, and the choice of an exterior realizing the collar data. There is also such an analytic extension $hat(h)$, equal to $g$ near the inner boundary, for which 
$ parallel hat(h) - delta parallel_(H_q^k) lt.eq C parallel g - delta parallel_(H^k \( C_1 \)) \, #h(2em) parallel "Ric" \( hat(h) \) parallel_(H_(q + 2)^(k - 2)) lt.eq C m_1 \, $

 and whose first derivative has the same bound.]
] <thm:collar-extension>

The last term in Equation (5.3) cannot simply be discarded. A regular vacuum curvature field on a finite annulus is detected at its outer boundary even when its Ricci tensor vanishes. The term $theta_R \/ R^2$ retains this information.

=== 5.2 Two local linear estimates <collar:local-linear>

The flat compatibility used here is the Saint-Venant relation between metric strain and linearized curvature. Its place in the Calabi complex is described in #cite(label("Khavkine2017")) Section 2.2. The relation between compatibility, potentials and Korn’s inequality is also developed in #cite(label("CiarletCiarlet2005")) in dimension three. We give the required four-dimensional, equivariant estimates with their actual derivative orders and kernel below.

Write $S v$ and $cal(K) \( v \)$ for the flat linearizations of Ricci and Riemann curvature. With plus-contraction divergence, set $B v = partial^i v_(i j) - 1 / 2 partial_j "tr"_delta v$. Directly differentiating the coordinate formulas for curvature gives

#[#set math.equation(numbering: n => "(5.5)")
 $ S v = - 1 / 2 Delta v + 1 / 2 cal(L)_(\( B v \)^sharp) delta \, #h(2em) B S v = 0 \, #h(2em) Delta cal(K) \( v \) = cal(T) \( partial^2 S v \) . $ <collar:flat-identities>]

Here $cal(T)$ is a fixed linear combination of components, independent of the annulus. These identities hold distributionally at the Sobolev orders used below. Also $S cal(L)_V delta = cal(K) \( cal(L)_V delta \) = 0$.

#thm([Lemma 5.2.])[
  (Local potential and Korn estimates).  #emph[On a fixed smooth Euclidean annulus, ball, or fixed-width annular overlap in dimension four, there is a bounded linear extraction $v mapsto P v in H^(k + 1)$ with 
#[#set math.equation(numbering: n => "(5.6)")
 $ parallel v - cal(L)_(P v) delta parallel_(H^k) lt.eq C parallel cal(K) \( v \) parallel_(H^(k - 2)) \, #h(2em) parallel P v parallel_(H^(k + 1)) lt.eq C parallel v parallel_(H^k) . $ <collar:local-potential>]

 For vector fields on these domains, 
#[#set math.equation(numbering: n => "(5.7)")
 $ inf_(W in frak(e) \( 4 \)) parallel V - W parallel_(H^(k + 1)) lt.eq C parallel cal(L)_V delta parallel_(H^k) \, $ <collar:korn>]

 where $frak(e) \( 4 \) = { x mapsto A x + b : A^t = - A }$. All choices can be linear, normalized modulo this rigid-motion space, and equivariant. After dilation, the right side of the first inequality in Equation (5.6) is multiplied by $r^2$, and vector norms in both inequalities are divided by $r$.]
] <collar:potential>

#proof[
  We give the potential construction to specify its order and its kernel. On any of the stated domains, which are simply connected, the Neumann gradient projection of a one-form $alpha$ writes $alpha = d v + w$, where $"div" w = 0$, $w \( nu \) = 0$, and
  $ parallel w parallel_(H^(s + 1)) lt.eq C parallel d alpha parallel_(H^s) . $
  The constant in $v$ is fixed by its mean. To recall why there is no additional term, the div–curl integration-by-parts identity first gives this inequality with an $L^2$ remainder; its boundary term is of order zero. Compactness removes that remainder on the orthogonal complement of the kernel. A kernel element is closed, hence exact on the stated domain, and its divergence and normal conditions make its potential a constant Neumann harmonic function. The kernel is therefore zero. Differentiation in smooth boundary charts, followed by recovery of normal derivatives from divergence and curl, gives the displayed estimate in every fixed integer order. This also makes the projection bounded and linear.
  For a symmetric tensor $v$, form its linearized connection
  $ C_(i j)^a \( v \) = 1 / 2 \( partial_i v_(a j) + partial_j v_(a i) - partial_a v_(i j) \) . $
  For fixed $a \, j$, its curl in the index $i$ is a component of $cal(K) \( v \)$. Apply the gradient projection with $s = k - 2$ to obtain $C_(i j)^a = partial_i w_j^a + e_(i j)^a$, with $parallel e parallel_(H^(k - 1)) lt.eq C parallel cal(K) \( v \) parallel_(H^(k - 2))$. Symmetry of $C_(i j)^a$ in $i \, j$ bounds the curl of $w_j^a$ in $H^(k - 1)$ by the same quantity. A second projection, now with $s = k - 1$, writes $w_j^a = partial_j V^a + e' ""_j^a$, with $parallel e' parallel_(H^k) lt.eq C parallel cal(K) \( v \) parallel_(H^(k - 2))$. Consequently $C \( v \) - D^2 V$ has that bound in $H^(k - 1)$. Since $C \( cal(L)_V delta \) = D^2 V$ and $partial_i v_(a j) = C_(i j)^a \( v \) + C_(i a)^j \( v \)$, the derivative of $v - cal(L)_V delta$ has that bound in $H^(k - 1)$. Poincare’s inequality controls the tensor modulo a constant symmetric matrix. Add the affine vector field with half this matrix as its derivative. The result proves the first inequality in Equation (5.6). Each projection has a bounded linear normalization, and the construction also gives its second inequality.
  For Equation (5.7), if $e_(i j) = partial_i V_j + partial_j V_i$, the identity
  $ 2 partial_i partial_j V_a = partial_i e_(j a) + partial_j e_(i a) - partial_a e_(i j) $
  controls second and higher derivatives. Poincare’s inequality then controls $V$ modulo an affine map, and the symmetric part of that affine map is controlled by $e$. Its remaining ambiguity is precisely $frak(e) \( 4 \)$. Projecting onto that finite dimensional space fixes it linearly. Averaging all constructions over $Gamma$ preserves the inequalities. Dilation proves the scaled assertions. ◻
]

#thm([Lemma 5.3.])[
  (Newton estimates used below).  #emph[Let $G \( x \) = c_4 \| x \|^(- 2)$ be the fundamental solution for the chosen sign of the Euclidean Laplacian. For $0 < q < 2$, its Newton operator is bounded 
$ Delta^(- 1) : H_(q + 2)^(k - 2) \( bb(R)^4 \) arrow.r H_q^k \( bb(R)^4 \) . $

 For $1 < q < 2$, if $h in H_(q + 3)^(k - 3) \( bb(R)^4 \)$ and $integral_(bb(R)^4) h = 0$ componentwise, then 
#[#set math.equation(numbering: n => "(5.8)")
 $ parallel Delta^(- 1) h parallel_(H_(q + 1)^(k - 1)) lt.eq C parallel h parallel_(H_(q + 3)^(k - 3)) . $ <collar:zero-mass-newton>]

 Finally, on an annulus or ball of outer radius comparable to $R$, if $Delta W = H$, boundary strips control $W$ in scaled $H^(k - 2)$ by $b_0$, and $c_r = r^2 parallel H parallel_(H^(k - 4) \( r \))$, then 
#[#set math.equation(numbering: n => "(5.9)")
 $ sup_r parallel W parallel_(H^(k - 2) \( r \)) lt.eq C (b_0 + sum_r c_r) . $ <collar:green-sum>]

 The constant is independent of the number of shells. A filled ball has no inner boundary term; its innermost shell is replaced by a fixed ball.]
] <collar:newton>

#proof[
  These are elementary weighted Newton estimates; compare the weighted elliptic theory and Newton-kernel argument of #cite(label("Bartnik1986")) Theorem 1.7. We prove them for the shell-supremum norms used here, including the zero-mass improvement. Sobolev embedding on unit shells bounds a source in the first assertion by $D \( 1 + \| y \| \)^(- q - 2)$. At $\| x \| = rho gt.eq 2$, split the integral into $\| y \| < rho \/ 2$, $rho \/ 2 lt.eq \| y \| lt.eq 2 rho$, and $\| y \| > 2 rho$. The first part is bounded by $C D rho^(- 2) integral_0^rho \( 1 + s \)^(1 - q) thin d s lt.eq C D rho^(- q)$; the middle part uses $integral_(\| z \| lt.eq 3 rho) \| z \|^(- 2) thin d z lt.eq C rho^2$; and the last part is bounded by $C D integral_(2 rho)^oo s^(- q - 1) thin d s$. This proves the required size bound. The scaled interior estimate for $Delta u = f$,
  $ parallel u parallel_(H^s \( r \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel u parallel_(L^oo \( Omega_r^(+) \)) + r^2 parallel f parallel_(H^(s - 2) \( Omega_r^(+) \)) #scale(x: 120%, y: 120%)[\)] \, $
  gives all the stated Sobolev orders. The ball near the origin is handled by the same local estimate. These local estimates follow by a cutoff and the Fourier multiplier for $Delta$, or by the usual interior energy estimate and its derivatives.
  For the second assertion $h$ is integrable because $q > 1$, and zero integral permits the identity
  $ \( G * h \) \( x \) = integral_(bb(R)^4) \( G \( x - y \) - G \( x \) \) h \( y \) thin d y . $
  On $\| y \| < rho \/ 2$ the kernel difference is at most $C rho^(- 3) \| y \|$, so this part is bounded by
  $ C D rho^(- 3) integral_0^rho s^4 \( 1 + s \)^(- q - 3) thin d s lt.eq C D rho^(- q - 1) . $
  On the remaining region, the integral of $G \( x - y \) h \( y \)$ is bounded as in the first assertion, now by $C D rho^(- q - 1)$. The subtracted term there is bounded by $C rho^(- 2) integral_(\| y \| gt.eq rho \/ 2) \| h \( y \) \| thin d y lt.eq C D rho^(- q - 1)$. Local elliptic estimates give Equation (5.8).
  For the last assertion, the Dirichlet Green function in a Euclidean domain has absolute value at most $C \| x - y \|^(- 2)$, as follows by subtracting its boundary harmonic correction from the fundamental solution and applying the maximum principle. One shell of forcing with supremum at most $C c_r r^(- 2)$ contributes at most $C c_r$ at every point: if $x$ is near that shell, integrate the kernel over a ball of radius $C r$; if it is far away, use the separation and the shell volume. Sobolev embedding supplies the forcing supremum, since $k - 4 > 2$. Componentwise maximum principle and addition of the shell contributions bound $parallel W parallel_oo$ by $C \( b_0 + sum c_r \)$. The displayed local elliptic estimate gives the higher norms on interior shells. The given boundary strips supply the remaining norms. This proof also applies by weak approximation at the stated Sobolev regularity. ◻
]

=== 5.3 A filled-space generalized inverse and the analytic map <collar:analytic-map>

Let

$ cal(X) = H_q^k \( cal(E) \; "Sym"^2 \) \, #h(2em) cal(Y) = H^k \( C_1 \; "Sym"^2 \) times H_(q + 2)^(k - 2) \( cal(E) \; "Sym"^2 \) \, #h(2em) A v = \( v \|_(C_1) \, S v \) . $

The pair $\( g \|_(C_1) - delta \, 0 \)$ need not lie in the range of $A$: prescribed collar data need not admit a linearized Ricci-flat extension. We first solve a projected nonlinear equation. The supplied metric on the finite annulus will then control the residual left by the projection.

We construct a bounded linear $L : cal(Y) arrow.r cal(X)$ such that

#[#set math.equation(numbering: n => "(5.10)")
 $ A L A = A . $ <collar:generalized-inverse>]

Fix a bounded linear extension $E$ from collar $H^k$ to $H^k \( B_2 \)$, equal to its input on the entire collar. Such an extension is obtained by reflection across the inner smooth boundary in finitely many boundary charts, with the usual finite linear combination of reflections matching derivatives through order $k$, followed by a partition of unity and an interior cutoff. Average it over $Gamma$. Fix also a radial cutoff $chi$ equal to one near radius one and zero before radius two. For $d = \( v_1 \, f \)$, define

#[#set math.equation(numbering: n => "(5.11)")
 $ f^(\#) = cases(delim: "{", S \( E v_1 \) \, & \| x \| < 1 \,, chi S v_1 + \( 1 - chi \) f \, & 1 lt.eq \| x \| lt.eq 2 \,, f \, & \| x \| > 2 .) #h(2em) u = Delta^(- 1) \( - 2 f^(\#) \) . $ <collar:filled-source>]

The source lies in filled $H_(q + 2)^(k - 2)$, with norm at most $C parallel d parallel_(cal(Y))$; Lemma 23 gives $parallel u parallel_(H_q^k) lt.eq C parallel d parallel_(cal(Y))$. Apply Lemma 22 to $v_1 - u \|_(C_1)$, extend its extracted vector linearly to the exterior, and cut that vector off outside a fixed annulus. Write the resulting vector as $V_d$, and set

$ L d = u \|_(cal(E)) + cal(L)_(V_d) delta . $

This operator is bounded. Its collar residual satisfies

#[#set math.equation(numbering: n => "(5.12)")
 $ parallel v_1 - \( L d \) \|_(C_1) parallel_(H^k) lt.eq C parallel cal(K) \( v_1 - u \) parallel_(H^(k - 2) \( C_1 \)) \, #h(2em) S \( L d \) = S u . $ <collar:L-residual>]

To prove Equation (5.10), take $d = A v$ and fill $v$ itself by the same extension $E \( v \|_(C_1) \)$, obtaining $V$ on all of $bb(R)^4$. The construction gives $f^(\#) = S V$ everywhere, including the interpolation region. Equation (5.5) gives $B f^(\#) = 0$. Thus $B u = 0$: either commute the constant coefficient derivative with the Newton integral in distributions, or observe that $B u$ is an entire harmonic field decaying at infinity and apply the mean-value property. Consequently $S u = f^(\#)$. The last identity in Equation (5.5) shows that $cal(K) \( V - u \)$ is harmonic on the whole space. It decays at infinity and hence vanishes by the same mean-value argument. The local extraction in Equation (5.12) is now exact. We obtain $\( L d \) \|_(C_1) = v \|_(C_1)$ and $S \( L d \) = S v$, which proves Equation (5.10). Filling the hole is essential here: a decaying harmonic field on the punctured exterior need not vanish.

Put $Q = L A$. Equation (5.10) implies

$ Q^2 = Q \, #h(2em) A Q = A . $

In particular $cal(X)_0 = "im" Q$ is a closed Banach subspace. For small $h in cal(X)_0$, define

$ Phi \( h \) = Q L #scale(x: 120%, y: 120%)[\(] h \|_(C_1) \, "Ric" \( delta + h \) #scale(x: 120%, y: 120%)[\)] . $

This map is analytic. Indeed the inverse metric is given by its convergent Neumann series, and the coordinate expression for Ricci is a sum of inverse-metric multiples of $D^2 h$ and products of $D h$. On every rescaled shell, $H^(k - 2)$ is a multiplication algebra; inserting weights gives an analytic map $H_q^k arrow.r H_(q + 2)^(k - 2)$. Its differential at zero is $S$. For $h in cal(X)_0$,

$ D Phi \( 0 \) h = Q L A h = Q^2 h = h . $

The analytic inverse function theorem on this Banach space therefore solves

#[#set math.equation(numbering: n => "(5.13)")
 $ Phi \( macron(h) - delta \) = Q L \( g \|_(C_1) - delta \, 0 \) $ <collar:analytic-equation>]

in a fixed neighborhood. It yields the first estimate in Equation (5.4) and the asserted bounded first derivative. Everything in this definition is fixed by the collar, $q$, and the choices of linear operators.

It remains to estimate the error. Set

#[#set math.equation(numbering: n => "(5.14)")
 $ d_1 = \( p_1 \, f \) = \( g \|_(C_1) - macron(h) \|_(C_1) \, - "Ric" \( macron(h) \) \) \, #h(2em) e = parallel d_1 parallel_(cal(Y)) . $ <collar:error-data>]

Equation (5.13) says $Q L d_1 = 0$. Applying $A$, and using $A Q = A$, gives

#[#set math.equation(numbering: n => "(5.15)")
 $ A L d_1 = 0 . $ <collar:annihilated-data>]

No identity $L A L = L$ is needed. We will show that $d_1 - A L d_1$ is small, and then use Equation (5.15).

=== 5.4 A comparison gauge on the long finite annulus <collar:comparison-gauge>

The analytic extension has already been defined from the collar alone. To estimate its error, we are free to compare it with the supplied metric in a separate gauge on the longer annulus. The construction below must retain constants independent of that annulus’s length, even when its coordinate rotations accumulate. We first construct a linear projection which removes coordinate strain without a constant depending on $R$. For tensors on $1 lt.eq \| x \| lt.eq R$, there are linear operators $P_0$ and $cal(D) z = cal(L)_(P_0 z) delta$, with $P_0 z = 0$ on all of $C_1$, such that

#[#set math.equation(numbering: n => "(5.16)")
 $ parallel z - cal(D) z parallel_(H^k \( r \)) lt.eq C (r^2 max_(rho asymp r) parallel cal(K) \( z \) parallel_(H^(k - 2) \( rho \)) + upright(bold(1))_(r lt.eq C_0) parallel z parallel_(H^k \( C_1 \))) . $ <collar:long-projection>]

Here and below $C_0$ is a fixed width, not a growing end length.

Here is the construction. Take a sequence of roomy dyadic annuli $Omega_j$ and smaller neighboring overlaps with fixed relative widths. Lemma 22 supplies local vectors $v_j$ with

$ r_j^(- 1) parallel v_j parallel_(H^(k + 1) \( r_j \)) lt.eq C parallel z parallel_(H^k \( r_j \)) \, quad parallel z - cal(L)_(v_j) delta parallel_(H^k \( r_j \)) lt.eq e_j \, quad e_j = C r_j^2 parallel cal(K) \( z \) parallel_(H^(k - 2) \( Omega_j \)) . $

On each overlap, Equation (5.7) writes

$ v_(j + 1) - v_j = A_j x + w_j \, #h(2em) r_j^(- 1) parallel w_j parallel_(H^(k + 1)) lt.eq C \( e_j + e_(j + 1) \) \, $

where $A_j$ is skew and commutes with $Gamma$. There is no equivariant translation: a nonzero invariant vector would be fixed by each nonidentity group element, contrary to its free action on the sphere. The rigid projection can be chosen orthogonal, so its coefficient also obeys

$ \| A_j \| lt.eq C #scale(x: 120%, y: 120%)[\(] parallel z parallel_(H^k \( Omega_j \)) + parallel z parallel_(H^k \( Omega_(j + 1) \)) #scale(x: 120%, y: 120%)[\)] . $

Choose $B_(j + 1) = B_j - A_j$, and write $W_j = v_j + B_j x$. Then $W_(j + 1) - W_j = w_j$ on the overlap. With a radial partition $sum_j psi_j = 1$, let $W = sum_j psi_j W_j$. The part of its strain coming from partition derivatives is

$ sum_j #scale(x: 120%, y: 120%)[\(] d psi_j ⊗ W_j^flat + W_j^flat ⊗ d psi_j #scale(x: 120%, y: 120%)[\)] . $

On a shell subtract any one active $W_i$ inside this sum; $sum d psi_j = 0$ cancels it exactly. Only differences of neighboring $W_j$’s remain, whose norms are controlled by the nearby $e_j$’s. Thus the residual estimate in Equation (5.16) holds for $W$ without its collar term. In particular a cumulative rotation $B_j$ never appears in a residual bound.

Normalize the global rigid ambiguity by projecting $W \|_(C_1)$ off the rigid space. By Equation (5.7), its remaining collar norm is bounded by $C parallel z parallel_(H^k \( C_1 \))$ plus the nearby curvature residuals. Subtract a fixed bounded extension of this entire collar vector, supported in $r lt.eq C_0$ and equal to it on all of $C_1$. The resulting vector is $P_0 z$; this proves Equation (5.16). If $z = cal(L)_V delta$ with $V = 0$ on $C_1$, both terms on the right vanish. Thus $cal(D) z = z$ on such strains. Moreover $P_0 z - V$ is a Euclidean Killing field vanishing on a whole collar, so it is zero. Since every $cal(D) z$ is itself such a strain, $cal(D)^2 = cal(D)$.

For the nonlinear step, define

$ n \( z \) = sup_(r lt.eq R) theta_r^(- 1) parallel z parallel_(H^k \( r \)) . $

The preceding construction gives more information than Equation (5.16). Namely the local potentials have size $C r theta_r n \( z \)$, successive correcting rotations differ by $C theta_r n \( z \)$, and the first correcting rotation has size $C theta_1 n \( z \)$. Consequently $cal(D)$ is bounded for $n$, independently of $R$. Radially interpolate the correcting rotations, with value zero on $C_1$, to write linearly

#[#set math.equation(numbering: n => "(5.17)")
 $ P_0 z = J \( x \) x + U \( x \) \, #h(2em) J \( x \)^t = - J \( x \) \, #h(2em) J gamma = gamma J quad \( gamma in Gamma \) \, $ <collar:rotation-decomposition>]

where $J = U = 0$ on $C_1$, and

#[#set math.equation(numbering: n => "(5.18)")
 $ sup \| J \| lt.eq C sigma n \( z \) \, #h(2em) sum_(d = 1)^(k + 1) parallel r^d partial^d J parallel_(L^oo \( Omega_r \)) + r^(- 1) parallel U parallel_(H^(k + 1) \( r \)) lt.eq C theta_r n \( z \) . $ <collar:rotation-bounds>]

To see these bounds explicitly, before the collar correction use $J = sum psi_j B_j$ and $U = sum psi_j v_j$. For a derivative of $J$, subtract a neighboring $B_i$ using the differentiated partition identity. The resulting coefficient is bounded by a fixed sum of $\| B_j - B_i \|$, hence by $C theta_r n \( z \)$. The undifferentiated bound is the telescoping sum $sum theta_r n \( z \)$. The collar subtraction and a cutoff of $J$ there change these estimates only on finitely many comparable shells. Bounds for arbitrarily many fixed derivatives of $J$ follow from the smooth fixed partition. This justifies the supremum version used in Equation (5.18).

For $z in "im" cal(D)$, define

#[#set math.equation(numbering: n => "(5.19)")
 $ F_z \( x \) = e^(J \( x \)) \( x + U \( x \) \) . $ <collar:orthogonal-map>]

Fix a sufficiently large but fixed ball $n \( z \) lt.eq M_0$. If $sigma$ is small in terms of $M_0$, the map is the identity on $C_1$, is equivariant, and is a coordinate map into $1 lt.eq \| x \| lt.eq 4 R$. Indeed Sobolev embedding and Equation (5.18) give $parallel D F_z - "Id" parallel_oo lt.eq C M_0 sigma$ and $\| F_z \( x \) - x \| lt.eq C M_0 sigma \| x \|$. Extend it by the identity to the inner ball. The derivative bound on this convex ball of radius $R$ proves injectivity by integrating along segments. Its image cannot enter the unit ball from the exterior, since it already fixes that ball; the upper radius is less than $4 R$. This also verifies the boundary and domain margins needed for composition.

The use of an orthogonal exponential in Equation (5.19) gives

#[#set math.equation(numbering: n => "(5.20)")
 $ F_z^(*) g - macron(h) = g - macron(h) + z + cal(E) \( z \) \, #h(2em) cal(E) \( 0 \) = 0 \, #h(2em) n \( cal(E) \( z \) - cal(E) \( z' \) \) lt.eq C sigma n \( z - z' \) $ <collar:nonlinear-gauge-error>]

on this fixed ball. We verify the relative error bound. Write $O = e^J$ and $Omega_i = O^(- 1) partial_i O$. Then

$ O^(- 1) partial_i F_z = e_i + partial_i U + Omega_i \( x + U \) \, #h(2em) Omega_i = partial_i J + O \( \| J \| thin \| partial_i J \| \) . $

The undifferentiated $O$ cancels exactly from the Euclidean pullback. Its linear metric term is the symmetric derivative of $U + J x$: the extra undifferentiated $J$ in $D \( J x \)$ has zero symmetric part. The remaining products have a shell factor $theta_r$ and a second factor bounded by $C sigma$. The same statement for differences follows from linearity of $J \, U$, the integral formula for a difference of matrix exponentials, and Sobolev multiplication on rescaled shells. For the part involving $g - delta$, the maps and their differences have relative $H^(k + 1)$ size at most $C sigma$ and $C sigma n \( z - z' \)$. The mean-value formula for $\( g - delta \) compose F_z - \( g - delta \) compose F_(z')$, together with the $C^(k + 2)$ bound in Equation (5.2), gives the factor $C theta_r sigma n \( z - z' \)$. Differentiating the pullback formula through order $k$ produces products with the same bound; the highest derivative of a map occurs linearly and is controlled in $L^2$, while the other factors are controlled by Sobolev multiplication. Neighboring-shell comparability covers the displaced points. This proves Equation (5.20). In particular an undifferentiated accumulated rotation produces no Euclidean metric error of size $\| J \|^2$ on a remote shell.

Equation (5.2) and the first estimate for $macron(h)$ imply $n \( g - macron(h) \) lt.eq C$. The equation

$ z = - cal(D) \( g - macron(h) \) - cal(D) cal(E) \( z \) $

is a contraction on a sufficiently large fixed $n$-ball in $"im" cal(D)$, once $sigma$ is small. For its solution set $F = F_z$ and $p = F^(*) g - macron(h)$. Then $cal(D) p = 0$, $p \|_(C_1) = p_1$, and Equation (5.16) gives

#[#set math.equation(numbering: n => "(5.21)")
 $ parallel F^(*) g - delta parallel_(H^k \( r \)) lt.eq C theta_r \, #h(2em) Y := sup_(r lt.eq R) r^(- 2) parallel p parallel_(H^k \( r \)) lt.eq C \( e + X \) \, quad X := sup_(r lt.eq R) parallel cal(K) \( p \) parallel_(H^(k - 2) \( r \)) . $ <collar:gauge-bound>]

This gauge is only a comparison device for the present estimate. It is not used to define the analytic map in Equation (5.13).

=== 5.5 Curvature control and the compatibility residual <collar:residual-proof>

The comparison gauge controls metric differences by linearized curvature. We now estimate that curvature and use the filled-space inverse again to bound the incompatibility of the collar and Ricci data. Filling the inner ball is what removes an otherwise uncontrolled inner boundary term. Put $T = "Ric" \( F^(*) g \)$. The coordinate Ricci formula and Equation (5.21) imply

#[#set math.equation(numbering: n => "(5.22)")
 $ S p = T - "Ric" \( macron(h) \) + E_2 = T + f + E_2 \, #h(2em) parallel E_2 parallel_(H^(k - 2) \( r \)) lt.eq C theta_r Y . $ <collar:quadratic-error>]

Indeed, writing $"Ric" \( delta + v \) = S v + N \( v \)$, its nonlinear terms satisfy on a shell

$ parallel N \( v \) - N \( w \) parallel_(H^(k - 2) \( r \)) lt.eq C r^(- 2) \( parallel v parallel_(H^k \( r \)) + parallel w parallel_(H^k \( r \)) \) parallel v - w parallel_(H^k \( r \)) . $

Both first factors are $O \( theta_r \)$; the last factor is at most $r^2 Y$. On the collar the sharper bound $parallel E_2 parallel_(H^(k - 2) \( C_1 \)) lt.eq C sigma e$ holds because $p = p_1$ there.

We will repeatedly use the consequence of Equation (5.3)

#[#set math.equation(numbering: n => "(5.23)")
 $ parallel T parallel_(H^(k - 2) \( C_1 \)) + sum_(r lt.eq R) sum_(j = 1)^(k - 2) parallel r^j partial^j T parallel_(H^0 \( r \)) lt.eq C m_1 . $ <collar:positive-ricci-derivatives>]

Here no sum of unweighted zeroth-order exterior values is being claimed. For completeness, covariant derivatives commute with pullback. The first derivative of $F$ is bounded, so the intrinsic terms $F^(*) \( nabla_g^j "Ric" \( g \) \)$ are bounded by the suprema in Equation (5.3) on the enlarged shells. To pass from these tensors to Cartesian derivatives, expand iteratively $partial T = nabla_(F^(*) g) T + Gamma \( F^(*) g \) * T$. A term involving no positive covariant derivative of $T$ contains a metric derivative and hence a factor $theta_r$; the other terms are bounded by the positive covariant derivatives already present in the data. Products through order $k - 2$ are controlled in scaled $L^2$ by the $H^k$ bound for $F^(*) g$. This proves the shell sum. On $C_1$, the unweighted zeroth-order term is supplied separately in Equation (5.3). Smooth approximation of $F$ on the roomy shells proves the identities first for smooth maps and then in these finite Sobolev orders; their bounds require no uncontrolled higher derivatives of $F$.

Apply the last identity in Equation (5.5) to $p$. Its forcing satisfies

#[#set math.equation(numbering: n => "(5.24)")
 $ sum_(r lt.eq R) r^2 parallel cal(T) \( partial^2 S p \) parallel_(H^(k - 4) \( r \)) lt.eq C \( m_1 + e + sigma Y \) . $ <collar:first-forcing>]

The contribution of $T$ is controlled by Equation (5.23); the contribution of $f$ is at most $C e sum r^(- q - 2)$; and that of $E_2$ is at most $C Y sum theta_r$. The inner boundary strips have $cal(K) \( p \)$-norm at most $C e$, because $p = p_1$ on the collar. Outer boundary strips have norm at most $C theta_R \/ R^2$ by Equation (5.21) and the lower bound for $theta_R$ in Equation (5.2). Lemma 23 therefore yields

$ X lt.eq C \( m_1 + e + sigma Y \) . $

Together with Equation (5.21), and then absorption of $C sigma \( X + Y \)$, this gives

#[#set math.equation(numbering: n => "(5.25)")
 $ X + Y lt.eq C \( m_1 + e \) . $ <collar:first-absorption>]

The two derivatives of $S p$ are essential: a constant Ricci component is killed, so it does not accumulate once per shell.

We now run the fixed linear construction $L$ on the data $d_1 = \( p_1 \, f \)$ from Equation (5.14). In particular $f^(\#)$ and $u$ always mean precisely the filled source and Newton potential in Equation (5.11). Let $D_0 = m_1 + sigma e$. We claim

#[#set math.equation(numbering: n => "(5.26)")
 $ parallel B f^(\#) parallel_(H_(q + 3)^(k - 3) \( bb(R)^4 \)) lt.eq C D_0 \, #h(2em) integral_(bb(R)^4) B f^(\#) thin d x = 0 . $ <collar:bianchi-source>]

Inside radius one, $B f^(\#) = B S \( E p_1 \) = 0$. On $C_1$, Equation (5.22) and Equation (5.23) give

$ parallel S p_1 - f parallel_(H^(k - 2) \( C_1 \)) lt.eq C \( m_1 + sigma e \) = C D_0 . $

Thus derivatives of the fixed blending cutoff cost at most $C D_0$. On the exterior, the contracted Bianchi identity for $macron(h)$ gives $B_(macron(h)) f = 0$. Comparing it with flat $B$ yields terms of the form $\( macron(h)^(- 1) - delta^(- 1) \) partial f$ and $partial macron(h) * f$, including the corresponding trace terms. Their weighted $H_(q + 3)^(k - 3)$ norm is at most $C sigma e$ by Sobolev multiplication. This proves the first assertion. For the second, integrate the divergence expression for each component of $B f^(\#)$ over a ball. Its boundary flux is at most $C e rho^3 rho^(- q - 2) = C e rho^(1 - q)$, which tends to zero because $q > 1$. Integrability follows from the first assertion. There is no inner boundary in this computation.

Commutation with the Newton operator and Equation (5.8) now give

$ B u = Delta^(- 1) \( - 2 B f^(\#) \) \, #h(2em) parallel B u parallel_(H_(q + 1)^(k - 1)) lt.eq C D_0 . $

If desired, the commutation identity follows by comparing the two distributional solutions: their difference is entire harmonic and decays, hence is zero. By Equation (5.5), $S u - f^(\#) = 1 / 2 cal(L)_(\( B u \)^sharp) delta$. On the collar $f^(\#) - f = chi \( S p_1 - f \)$, while outside it $f^(\#) = f$. Hence

#[#set math.equation(numbering: n => "(5.27)")
 $ parallel S u - f parallel_(H_(q + 2)^(k - 2) \( cal(E) \)) lt.eq C D_0 . $ <collar:ricci-compatibility>]

To control the other component of the residual, fill $p$ by $E p_1$ in the unit ball, obtaining $P$ on the full ball of radius $R$. Consider $W = cal(K) \( P - u \)$. On the filled inner ball, $S P - f^(\#) = 0$; on the collar, $S P - f^(\#) = \( 1 - chi \) \( S p_1 - f \)$. Therefore $S \( P - u \)$ on this whole fixed ball is bounded in $H^(k - 2)$ by $C D_0$. Farther out it is

$ S \( P - u \) = T + E_2 + \( f - S u \) . $

The shell sum of the forcing $Delta W = cal(T) \( partial^2 S \( P - u \) \)$ is consequently bounded by

$ C #scale(x: 120%, y: 120%)[\(] m_1 + sigma Y + D_0 #scale(x: 120%, y: 120%)[\)] lt.eq C \( m_1 + sigma e \) \, $

where Equation (5.25) was used in the last step. The filled ball contributes one ordinary fixed-scale term to this sum. At its only boundary, near radius $R$,

#[#set math.equation(numbering: n => "(5.28)")
 $ parallel W parallel_(H^(k - 2) \( R \)) lt.eq C (theta_R / R^2 + e R^(- q - 2)) lt.eq C \( m_1 + e R^(- q - 2) \) . $ <collar:outer-curvature>]

Here $parallel u parallel_(H_q^k) lt.eq C e$ follows from the bounded linear construction of $L$, and $cal(K) \( p \)$ is controlled on the outer strip by Equation (5.21). The filled-ball version of Equation (5.9), followed by the fixed-scale interior estimate around $C_1$, gives

#[#set math.equation(numbering: n => "(5.29)")
 $ parallel cal(K) \( p_1 - u \) parallel_(H^(k - 2) \( C_1 \)) lt.eq C #scale(x: 120%, y: 120%)[\(] m_1 + \( sigma + R^(- q - 2) \) e #scale(x: 120%, y: 120%)[\)] . $ <collar:collar-curvature-residual>]

There is no inner boundary term proportional to $e$; that is the purpose of using the same inward extension a second time.

Equations (5.12), (5.27), and (5.29) imply

$ parallel d_1 - A L d_1 parallel_(cal(Y)) lt.eq C #scale(x: 120%, y: 120%)[\(] m_1 + \( sigma + R^(- q - 2) \) e #scale(x: 120%, y: 120%)[\)] . $

Since $A L d_1 = 0$, first choosing $sigma_(*)$ small and then $R_(*)$ large makes the coefficient of $e$ at most one half. Thus $e lt.eq C m_1$, proving the second estimate in Equation (5.4). All absorptions have constants independent of the exterior length.

Finally choose a fixed smooth radial $zeta$, equal to one near radius one and zero near radius two, and define

$ hat(h) = macron(h) + zeta \( g - macron(h) \) quad upright("on ") C_1 \, #h(2em) hat(h) = macron(h) quad upright("for ") \| x \| gt.eq 2 . $

It is a positive metric for the same smallness choice. The coordinate Ricci formula and bounded cutoff derivatives give

$ parallel "Ric" \( hat(h) \) parallel_(H^(k - 2) \( C_1 \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel "Ric" \( macron(h) \) parallel_(H^(k - 2) \( C_1 \)) + parallel g - macron(h) parallel_(H^k \( C_1 \)) #scale(x: 120%, y: 120%)[\)] lt.eq C m_1 . $

Outside the collar the estimate is already proved. The interpolation is linear in the collar input and $macron(h)$, so analyticity and the bounded derivative persist. This completes the proof of Theorem 21.

#prodef([Remark 5.4.])[
  (Scaling and the time-dependent interface).  If the physical collar radius is $b$, write the normalized metric as $g_b = b^(- 2) Phi_b^(*) g$, where $Phi_b \( x \) = b x$ in the chosen coordinates. Covariant Ricci components of $g_b$ are $b^2$ times the physical Cartesian components; intrinsic Ricci magnitudes and their scaled derivatives consequently gain the same $b^2$ factor. The residual term in physical units is $b^(- 2) theta_R \/ R^2 = theta_R \/ \( R b \)^2$. For a differentiable family on a fixed material collar, the bounded derivative of the analytic extension gives
  $ \| partial_t hat(g) \|_(0 \, r) lt.eq C B_1 \( t \) r^(- q) \, #h(2em) \| "Ric" \( hat(g) \) \|_(0 \, r) lt.eq C b^(- 2) m \( t \) r^(- q - 2) \, $
  when the collar velocity is bounded by $B_1 \( t \)$ in the required fixed $H^k$ norm and $m \( t \)$ bounds Equation (5.3) in collar units. The physical volume factor is $b^4$, so the tail pairing of these two tensors is bounded by $C b^2 m \( t \) B_1 \( t \) integral_1^oo r^(1 - 2 q) thin d r$, which is finite precisely for $q > 1$. No derivative of the comparison map $F$, the far exterior coordinates, the weights, or $R$ occurs. All constructions use only the finite orders specified above. For $k = 30$, scaled Sobolev embedding in dimension four gives $C^27$ metric bounds and $C^25$ Ricci bounds from $H^30$ and $H^28$, respectively. These supply the finite $C^20$ metric and $C^10$ Ricci bounds used in Section 2.
] <collar:scaling-interface>

== 6 Functional change and the contradiction <sec:contradiction>

We apply the preceding results to the buffered intervals of Proposition 12. The interval is $I = \[ - theta \, 1 + theta \]$ in its rescaled time coordinate. The central interval $\[ 0 \, 1 \]$ has original duration $d_i arrow.r 0$, whereas the full buffered interval has original duration $\( 1 + 2 theta \) d_i$. Put $epsilon.alt_i = sqrt(d_i)$. We suppress the index $i$ when no limit is being taken. Thus $\| R \| lt.eq C epsilon.alt_i^2$, the reference root length $a = a_i$ tends to zero, and the root scale defined in Proposition 8 is comparable to $a$ throughout $I$. Its values at $0$ and $1$ differ by a fixed factor. The centers $x_t$, cutoff $eta$, and energy $K$ are those of Equation (4.1); in particular

#[#set math.equation(numbering: n => "(6.1)")
 $ a^4 K^2 = integral_I eta \( t \)^2 integral_(B_t \( x_t \, N_1 a \)) \| "Ric" \|^2 thin d mu_(g \( t \)) thin d t \, #h(2em) min_(\[ 0 \, 1 \]) eta > 0 . $ <final:energy-recall>]

The maximal function $H_(*)$ may use a larger fixed ball than the one in Equation (6.1), as permitted in Equation (4.17).

First fix the small collar tolerance. The estimates below hold for every sufficiently large fixed dyadic number $N gt.double N_1$, with $b = N a$. All limits $i arrow.r oo$ are taken with $N$ fixed. The constants multiplying $N^(- 2 alpha) K^2$ will be independent of large $N$; constants multiplying a quantity denoted $o_i \( 1 \)$ may depend on $N$. At the final absorption step we choose one such $N$ large enough to absorb that explicit loss, then take the sequence limit. No subsequent limit in $N$ is needed.

=== 6.1 Material collars and time patches <material-collars-and-time-patches>

#thm([Lemma 6.1.])[
  (Position of a controlled material collar).  #emph[Choose sufficiently small $sigma_0 > 0$ and sufficiently large fixed $N$. At a time near $"supp" eta$, choose an exterior annular chart at scale $b$ with domain, in collar units, ${ 1 \/ 8 < \| x \| < 16 } \/ Gamma$, retaining slightly larger boundary margins when necessary. Keep its map into the material manifold and its group fixed. For all sufficiently late $i$, throughout any interval on which its metric stays within $sigma_0$ of the flat metric through the required fixed derivative order, the following assertions hold. Every closed shortened collar lies at distance comparable to $b$ from the current center $x_t$; its middle bands cover the corresponding shortened distance annuli. The component on the designated inner side of a middle sphere contains $B_t \( x_t \, N_1 a \)$ and is contained in $B_t \( x_t \, C b \)$, with fixed constants.]
] <final:collar-position>

#proof[
  The initial chart has these properties by the exterior annular convergence in Proposition 18. In particular, a middle sphere separates: every path from a sufficiently small ball to outside a sufficiently large comparable ball crosses the chart’s radial band and hence the sphere. Its two sides belong to different components. A connected two-sided embedded closed hypersurface in a connected manifold has at most two complementary components: every component reaches a tubular neighborhood of the hypersurface, and each of its two connected sides meets only one component. Thus the designated inner component is unambiguous and is fixed as a material subset while the chart is kept fixed.
  We justify the uniform positional assertion; closeness of the metric in a chart alone would not imply it. If the assertion failed for arbitrarily small tolerances and arbitrarily large $N$, choose a countersequence with $sigma_0 arrow.r 0$, $N arrow.r oo$, and indices as late as necessary for each choice. The chart lies in the material neighborhood of the same isolated point of the limiting space $Z$. At scale $b$, based at an interior chart point, Theorem 6 gives a complete flat quotient limit: a nonflat limit at this scale, which is much larger than $a$, would contradict the outermost-scale property in Proposition 8. On each compact subannulus the controlled chart supplies curvature bounds on balls with a definite margin. Indeed a path leaving the chart must first traverse that margin in its controlled metric. Smooth compactness therefore extracts the chart maps locally into the regular part of the flat limit; metric and connection transformation formulas give convergence of the maps and a limiting local flat isometry.
  The groups can be fixed after passage to a subsequence. Their orders are bounded by noncollapse, there are finitely many abstract groups of bounded order, and their orthogonal representations have convergent subsequences. Close orthogonal representations of a fixed finite group are conjugate: averaging an approximate intertwiner over the group makes it an exact invertible intertwiner, and its polar factor is orthogonal and still intertwines. The source group is nontrivial and acts freely on the sphere. The target flat limit is a global Euclidean quotient with at most one exceptional point, by Theorem 6. Lift the local isometry to Euclidean covers of regular annuli. It is the restriction of a rigid motion $x mapsto A x + c$, since its differential is parallel. Equivariance conjugates the source group into the target group. Its translation part fixes $c$ under that nontrivial free spherical action, so $c = 0$ after centering the target quotient. In particular the target group is nontrivial and the image is a complete centered open annulus.
  There is no multiplicity in that image. Otherwise two distinct interior source points would approach one target point. In the approximations they could then be joined by a path of length $o \( b \)$. A path contained in the chart cannot do this by its controlled metric, and a path leaving it costs a fixed positive multiple of $b$ before reaching the boundary. Both alternatives are impossible. The target tip is represented by points $z_i$ with $l \( z_i \) \/ b_i arrow.r 0$. It must lie at distance $o \( b_i \)$ from the current cluster center. Otherwise, on a subsequence, put $h_i = d_t \( z_i \, x_t \) gt.eq c b_i$; the case $h_i \/ b_i arrow.r oo$ is allowed. The chart’s material points approach the same point of $Z$ by their initial positioning and uniform convergence of the original distances. The same holds for $z_i$, which is within $O \( b_i \)$ of an interior chart point, and for $x_t$. Thus the original length corresponding to $h_i$ tends to zero. At this separation scale,
  $ frac(l \( z_i \), h_i) arrow.r 0 \, #h(2em) frac(l \( x_t \), h_i) lt.eq C a_i / h_i lt.eq frac(C, c N_i) arrow.r 0 . $
  Here the maximizing-center detection in Proposition 8 gives $l \( x_t \) asymp a_i$; this placement countersequence has $N_i arrow.r oo$. The separation-scale limit has two genuine tips at distance one. It is therefore nonflat, since a flat limit has at most one tip. Its scale satisfies $h_i \/ a_i gt.eq c N_i arrow.r oo$, contradicting the outermost-scale property in Proposition 8.
  These facts imply coverage in the approximations. A point whose limit belongs to the interior image has distance $o \( b \)$ from an image point with a fixed chart margin; a path realizing that distance cannot leave the image, so the point itself lies in it. Boundary positions follow by approaching the boundary from interior points and using the controlled lengths. Consequently all shortened radial bands have their claimed position and coverage, to any prescribed fixed accuracy. Crossing such bands shows that the geometric inward component contains the small ball and is contained in the larger $C b$ ball. To identify it with the designated material component, fix a regular material point $p$ at positive $d_T$-distance from this isolated cluster. At the chart’s initial time $p$ belongs to the outward component. Uniform convergence of original distances keeps $p$ outside the current $C b$ ball at every time under consideration. Thus it still belongs to the geometric outward component. The embedded sphere and its two complementary material components were kept fixed, so the other component remains the designated inward one. This contradicts the countersequence and proves the lemma with fixed choices of tolerance and $N$, followed by sufficiently late indices. ◻
]

At any individual time in such a patch, complete exterior coordinates can be chosen to agree with the fixed chart on $C_1 = { 1 lt.eq \| x \| lt.eq 2 } \/ Gamma$. Here and below an outward fixed rescaling of the chosen middle collar is harmless. To see the agreement, take the single neck coordinates from Equation (3.18) out to a sufficiently small fixed radius $r_(*) < r_0$ in interval units. On the roomy overlap their transition with the fixed chart has metric distortion $O \( sigma_0 + N^(- mu) \)$ and controlled connection difference. Lifting the overlap, integration of the connection transformation makes this transition close to a rigid equivariant map, through all needed orders. Its linear part can be adjusted to be orthogonal by polar factorization. The group and whole-band identifications are those proved in Lemma 25. After that rigid alignment the maps are close to identity, so a radial cutoff interpolation on a shorter overlap has invertible derivative and patches the coordinate systems. This is precisely the overlap construction of the neck charts, now performed only in a regular fixed-width band. Decreasing $mu > 0$ if needed, the shell weights in Theorem 21 can consequently be chosen as

#[#set math.equation(numbering: n => "(6.2)")
 $ theta_r lt.eq C #scale(x: 120%, y: 120%)[\[] \( sigma_0 + N^(- mu) \) r^(- mu) + delta_i \( r b \)^mu #scale(x: 120%, y: 120%)[\]] \, #h(2em) 1 lt.eq r lt.eq 4 R \, #h(2em) R b asymp r_(*) . $ <final:collar-weights>]

They include the collar norm times $r^(- q)$ after decreasing $mu < q$. The dyadic sum of their first term is small with the fixed choices; the second sum tends to zero because $R b asymp r_(*)$. These coordinates outside $C_1$ are used only to estimate the error. They are not differentiated in time.

Let $B_1 \( t \)$ be an upper bound for $\| "Ric" \|_(k + 4 \, b)$ on a fixed ample band of true distance radii $\[ c' b \, C' b \]$ around $x_t$, in interval units. Suprema over all admissible center choices can be used to make this bound independent of a choice of chart. It is measurable and locally bounded for every $i$. Define an increasing absolutely continuous time coordinate by

#[#set math.equation(numbering: n => "(6.3)")
 $ u \( t \) = integral_(t_(*))^t \( 1 + B_1 \( s \) \) thin d s . $ <final:time-coordinate>]

Start each chart with a tolerance strictly better than $sigma_0$, as is possible by first taking $N$ large. As long as the chart remains within $sigma_0$, Lemma 25 places its entire closed domain in the band defining $B_1$. The flow equation $partial_t g = - 2 "Ric"$, together with conversion between covariant and coordinate derivatives in that controlled chart, then gives

$ parallel g \( t \) - g \( s \) parallel_(C^(k + 3) \( upright("fixed collar") \)) lt.eq C integral_s^t B_1 \( v \) thin d v . $

A first-exit argument proves validity for a fixed sufficiently small $u$-width. This holds in both time directions, using the absolute value of the integral.

On an interval with room around $"supp" eta$, choose regularly spaced centers in the $u$ coordinate, subordinate smooth nonnegative bumps of that fixed width, and normalize their sum. Pulling them back gives an absolutely continuous partition ${ chi_j }$ with

#[#set math.equation(numbering: n => "(6.4)")
 $ sum_j chi_j = 1 quad upright("near ") "supp" eta \, #h(2em) sum_j \| chi'_j \( t \) \| lt.eq C \( 1 + B_1 \( t \) \) quad upright("a.e.") $ <final:partition>]

Its overlap is bounded by a fixed number. For each $i$ it is finite on the compact interval in use; no bound on the number of members uniform in $i$ is asserted or needed.

On patch $j$, retain the true metric on the material inner component and apply Theorem 21 in its fixed collar. Interpolate as in that theorem. Denote the resulting metric on the fixed manifold with one end by $hat(g)_j \( t \)$, and its functional in interval length units by $E_j \( t \)$, using Equation (2.4). Different patches are allowed to have different extensions and different functional values.

=== 6.2 The lower bound for functional variation <the-lower-bound-for-functional-variation>

#thm([Lemma 6.2.])[
  (The time-integrated collar error).  #emph[The residual in Equation (5.3) for every active patch is bounded by a common nonnegative function $m \( t \)$ such that 
#[#set math.equation(numbering: n => "(6.5)")
 $ sup_("supp" eta) m = o_i \( 1 \) \, #h(2em) b^(- 2) parallel eta m parallel_(L^2 \( I \)) + parallel eta B_1 parallel_(L^2 \( I \)) lt.eq C #scale(x: 120%, y: 120%)[\[] \( a \/ b \)^(2 + alpha) K + rho_i #scale(x: 120%, y: 120%)[\]] \, quad rho_i arrow.r 0 . $ <eq:collar-time-bound>]

 The leading constant is independent of large $N$; $rho_i$ may depend on fixed $N$.]
] <final:collar-bound>

#proof[
  Use the wider true bands in every supremum in the residual. In collar units the uncut regularity estimate Equation (3.1) bounds Ricci and its scaled derivatives on the shell of radius $r$ by $C epsilon.alt_i b \/ r$. The dyadic sum of $r^(- 1)$ is bounded, the zero-order terms carry the summable weights $theta_r$, and $theta_R \/ R^2 arrow.r 0$. Thus $m = o_i \( 1 \)$ uniformly. This argument uses the uncut estimate and is valid even where $eta$ is small.
  For the integrated assertion multiply the residual by $eta$ and convert a collar-unit Ricci magnitude to interval units by $b^(- 2)$. Writing $rho = b r$ for a shell’s interval radius, its positive-order terms are bounded in time $L^2$ by $V \( rho \)$ from Proposition 18; its zero-order term is bounded by $theta_r A \( rho \)$. The initial collar term is $A \( b \)$ up to fixed-width changes. Consequently it suffices to sum
  $ A \( b \) + sum_r #scale(x: 120%, y: 120%)[\[] V \( b r \) + theta_r A \( b r \) #scale(x: 120%, y: 120%)[\]] + C frac(theta_R, \( R b \)^2) . $
  The leading energy terms sum to $C \( a \/ b \)^(2 + alpha) K$. The errors in $V$ are summable in both directions:
  $ sum_(b r in \[ c b \, C r_(*) \]) #scale(x: 120%, y: 120%)[\[] \( a \/ \( b r \) \)^alpha + \( b r \)^alpha #scale(x: 120%, y: 120%)[\]] lt.eq C #scale(x: 120%, y: 120%)[\[] \( a \/ b \)^alpha + r_(*)^alpha #scale(x: 120%, y: 120%)[\]] . $
  The errors in $A$ are summed only with $theta_r$, whose sum is uniformly bounded. In particular no constant error is multiplied by the number of shells. Finally $theta_R \/ \( R b \)^2 arrow.r 0$, because $R b asymp r_(*) > 0$ and Equation (6.2) makes $theta_R arrow.r 0$. The same bounds for the fixed ample band give the assertion for $B_1$. Minkowski’s inequality proves Equation (6.5). ◻
]

#thm([Proposition 6.3.])[
  (Positive variation supplied by the true core).  #emph[For the preceding extensions and partition, 
#[#set math.equation(numbering: n => "(6.6)")
 $ sum_j integral_I eta^2 chi_j E'_j thin d t gt.eq 2 a^4 K^2 - a^4 #scale(x: 120%, y: 120%)[\[] C N^(- 2 alpha) K^2 + o_i \( 1 \) \( K + 1 \)^2 #scale(x: 120%, y: 120%)[\]] . $ <eq:variation-lower>]

]
] <final:variation>

#proof[
  The analytic collar map and its bounded derivative make $E_j$ differentiable on its patch. The available fixed Sobolev orders give all spatial derivatives required by the first-variation formula in Equation (2.5). On the retained true part,
  $ ⟨1 / 2 R g - "Ric" \, partial_t g⟩ = 2 \| "Ric" \|^2 - R^2 . $
  That part contains $B_t \( x_t \, N_1 a \)$ by Lemma 25, and its volume is at most $C b^4$. The scalar-square loss integrated in time is therefore at most $C epsilon.alt_i^4 b^4 = o_i \( a^4 \)$ for fixed $N$.
  On the interpolated collar and attached end, use collar radius $r gt.eq 1$. Equation (5.4), Sobolev embedding, and the derivative bound for the extension map imply
  $ \| "Ric" \( hat(g)_j \) \| lt.eq C b^(- 2) m \( t \) r^(- 2 - q) \, #h(2em) \| partial_t hat(g)_j \|_(hat(g)_j) lt.eq C B_1 \( t \) r^(- q) \, #h(2em) d mu_(hat(g)_j) lt.eq C b^4 r^3 thin d r thin d omega . $
  There is no extra power of $b$ in the second estimate: normalizing the collar metric multiplies its covariant tensor by $b^(- 2)$, whereas pulling back the original covariant Ricci tensor contributes $b^2$ relative to its interval-unit magnitude. The two factors cancel. Since $\| R \| lt.eq 2 \| "Ric" \|$ in dimension four, the absolute value of the tail contribution to $E'_j$ is bounded by
  #[#set math.equation(numbering: n => "(6.7)")
   $ C b^2 m \( t \) B_1 \( t \) integral_1^oo r^(1 - 2 q) thin d r lt.eq C b^2 m \( t \) B_1 \( t \) . $ <final:tail-variation>]
  This is the specific use of $q > 1$ in the time-variation estimate. Summing against $chi_j$ costs no multiplicity, since $sum_j chi_j = 1$. By Equation (6.5) and Cauchy–Schwarz the integrated tail loss is at most
  $ C b^2 parallel eta m parallel_2 parallel eta B_1 parallel_2 lt.eq C b^4 #scale(x: 120%, y: 120%)[\[] \( a \/ b \)^(2 + alpha) K + rho_i #scale(x: 120%, y: 120%)[\]]^2 . $
  Its leading factor is exactly
  #[#set math.equation(numbering: n => "(6.8)")
   $ b^4 \( a \/ b \)^(4 + 2 alpha) = a^4 N^(- 2 alpha) . $ <final:tail-scaling>]
  For fixed $N$ the remaining terms are $o_i \( a^4 \) \( K + 1 \)^2$. The positive core term sums to at least $2 a^4 K^2$ by Equation (6.1). This proves the proposition. ◻
]

=== 6.3 Applying the static inequality to every time patch <applying-the-static-inequality-to-every-time-patch>

The lower variation bound is expressed in terms of the true root energy. We now obtain the opposing upper bound. The only required uniformity is over the ratios of functional value to weighted Ricci error: a new fixed tree may be extracted from each proposed failure of that uniformity.

#thm([Proposition 6.4.])[
  (Uniform functional smallness).  #emph[For fixed $N$ there are numbers $zeta_i arrow.r 0$ such that, at every time in every active patch, 
#[#set math.equation(numbering: n => "(6.9)")
 $ \| eta \( t \) E_j \( t \) \| lt.eq zeta_i a^4 #scale(x: 120%, y: 120%)[\[] H_(*) \( t \) + 1 + a^(- 2) eta \( t \) m \( t \) #scale(x: 120%, y: 120%)[\]] . $ <eq:functional-littleoh>]

 Here $H_(*)$ uses a fixed enlargement depending on $N$.]
] <final:functional-smallness>

#proof[
  We first verify exactly which static hypotheses hold after an arbitrary choice of indices, times $t_i$ with $eta \( t_i \) > 0$, and active patches $j_i$. Rescale their extensions by the length $a_i$. Theorem 6 and Proposition 8 extract one finite rooted tree, with the outermost nonflat entry represented at unit scale. Every smaller concentration is contained inside the collar: if a concentration escaped to distance much greater than $a$, the distance-scale limit with the root would have two genuine tips and hence a larger nonflat entry. For large fixed $N$, the replacement collar and all its overlaps are uniformly regular and leave a detecting nonflat root patch in the retained body.
  For clarity, the hypotheses of Theorem 4 are supplied as follows. The original compact pieces and joining regions have the sequential identifications from Theorem 6. On an edge with parent scale $A$ and child scale $A e^(- 2 L)$, put
  $ tau_p = log \( A \/ rho \) \, #h(2em) tau_c = log \( rho \/ \( A e^(- 2 L) \) \) \, #h(2em) tau_p + tau_c = 2 L . $
  The physical radius is $rho = A e^(- tau_p)$ on the parent half. On the child half, $tau_c lt.eq L$, so $rho = A e^(- 2 L + tau_c) lt.eq A e^(- tau_c)$. Every parent scale is bounded by a fixed multiple of $a$. Consequently $rho lt.eq C_N a e^(- D)$ on both halves, where $D = min \( tau_p \, tau_c \)$ up to fixed end-coordinate offsets. Equation (3.18) bounds the metric error by a constant times $e^(- mu tau_p) + e^(- mu tau_c)$. On the parent half $tau_p lt.eq L$ this is at most $2 e^(- mu tau_p)$, and on the child half it is at most $2 e^(- mu tau_c)$. Thus these are exactly the one-sided half-neck weights of the static theorem, with a possibly smaller fixed positive exponent. The joined groups are nontrivial and are identified by those same annular charts.
  On the new root exterior, Equation (5.4) gives uniform $O \( r^(- q) \)$ control with $1 < q < 2$ and sufficiently many scaled derivatives. Expressing it in root units changes its constant by a factor depending on $N$, which is fixed. Local Sobolev compactness extracts convergence through the finite differentiability order needed by the static theorem. The limit is Ricci-flat on the attached portion because $m \( t_i \) arrow.r 0$. Local harmonic coordinates and elliptic regularity make this Ricci-flat limit smooth on its regular part; the weighted finite-order bounds are retained in the original end coordinates. The collar embeddings themselves extract on smaller regular overlaps: metric and connection bounds control their transitions with the interior convergence charts. Adjusting the latter by these limiting transitions identifies the two limits on the overlaps. Hence the substitution changes only a regular portion and the unjoined end of the root vertex. It does not alter a joining end or remove the retained nonflat patch. This gives one fixed limiting Ricci-flat root with the required decay $q > 1$, while every other vertex is the one furnished by the true slice convergence. A fixed tree is obtained only on this extracted sequence; no tree through time is being chosen.
  Let $M_i$ be a bound for the weighted, scale-neutralized Ricci error in Equation (2.3) on this sequence. Choose its internal weight exponent smaller than both the half-neck metric exponent and the exponent in Equation (4.18). We can take $M_i arrow.r 0$ without using $eta$. Indeed on a true piece of physical radius $rho$ in interval units the uncut bound is
  $ rho^2 \| "Ric" \|_(j \, rho) lt.eq C epsilon.alt_i rho . $
  On compact pieces $rho lt.eq C_N a$. At logarithmic depth $D$ in a joining neck one has $rho lt.eq C_N a e^(- D)$, so multiplication by a sufficiently small positive exponential weight still leaves a quantity tending to zero. The substituted region contributes at most $C_N m \( t_i \)$ with the required root-end decay. These statements also hold for all derivatives required in the definition of $M_i$.
  Independently, Equation (4.18) supplies the stronger bound relative to the energy:
  #[#set math.equation(numbering: n => "(6.10)")
   $ eta \( t_i \) M_i lt.eq C_(upright("ext")) a_i^2 #scale(x: 120%, y: 120%)[\[] H_(*) \( t_i \) + epsilon.alt_i #scale(x: 120%, y: 120%)[\]] + C_(upright("ext")) eta \( t_i \) m \( t_i \) . $ <final:weighted-error>]
  Here the constant may depend on this extraction and on fixed $N$. To check the power of $a$, multiply that equation’s $\( rho \/ a \)^2 \| eta "Ric" \|_(j \, rho)$ by $a^2$; the result is the scale-neutralized tensor $rho^2 \| eta "Ric" \|_(j \, rho)$ required in Equation (2.3). Compact retained regions are handled by shorter regular patches, and the energy ball for $H_(*)$ is enlarged once to contain their short-time comparisons. On the collar and new end the error is $C_(upright("ext")) eta m$ by Equation (5.4). This proves Equation (6.10) for the same $M_i$ obtained as the maximum of these weighted errors. Its uncut smallness and its cutoff energy bound are separate assertions; neither was obtained by division by $eta$.
  Write $E_i^(upright("root"))$ for the functional in root units. Theorem 4 now gives $\| E_i^(upright("root")) \| = o \( M_i \)$ on this extraction, and the scaling law of Equation (2.4) gives $E_(j_i) \( t_i \) = a_i^2 E_i^(upright("root"))$. If $M_i = 0$, the zero-error scaling argument in that theorem gives $E_i^(upright("root")) = 0$ directly. Otherwise, using Equation (6.10) and $epsilon.alt_i lt.eq 1$,
  #[#set math.equation(numbering: n => "(6.11)")
   $ frac(\| eta \( t_i \) E_(j_i) \( t_i \) \|, a_i^4 \[ H_(*) \( t_i \) + 1 + a_i^(- 2) eta \( t_i \) m \( t_i \) \]) lt.eq C_(upright("ext")) frac(\| E_i^(upright("root")) \|, M_i) arrow.r 0 . $ <final:ratio-test>]
  If Equation (6.9) failed uniformly, its nonnegative ratio would be bounded below by some fixed number along a sequence of active patches and times. Times with $eta = 0$ have zero numerator, so that sequence has $eta > 0$. The extraction just performed yields Equation (6.11) on a subsequence, a contradiction. The extraction-dependent constant is fixed on that subsequence and multiplies a quantity tending to zero. This proves the uniform assertion without a uniform tree, a uniform analytic family, or a uniform power-law exponent. ◻
]

#thm([Corollary 6.5.])[
  #emph[Along the buffered intervals, $K_i arrow.r 0$.]
] <final:energy-vanishes>

#proof[
  Each product $eta^2 chi_j$ has compact support in the patch where $E_j$ is defined. Integration by parts there gives
  $ sum_j integral_I eta^2 chi_j E'_j thin d t = - sum_j integral_I \( 2 eta eta' chi_j + eta^2 chi'_j \) E_j thin d t . $
  Absolute continuity of the partition is sufficient for this identity. No values of different $E_j$ are equated at a switch. By Equations (6.4) and (6.9), the absolute value is at most
  #[#set math.equation(numbering: n => "(6.12)")
   $ C zeta_i a^4 integral_I \[ H_(*) + 1 + a^(- 2) eta m \] thin \[ \| eta' \| + eta \( 1 + B_1 \) \] thin d t . $ <final:ibp-bound>]
  For fixed $N$, Equations (4.17) and (6.5) show
  $ parallel H_(*) + 1 + a^(- 2) eta m parallel_2 lt.eq C_N \( K + 1 \) \, #h(2em) parallel \| eta' \| + eta \( 1 + B_1 \) parallel_2 lt.eq C_N \( K + 1 \) . $
  For the first inequality use $a^(- 2) = N^2 b^(- 2)$; fixed powers of $N$ are allowed here. Cauchy–Schwarz in Equation (6.12) therefore bounds it by $o_i \( a^4 \) \( K + 1 \)^2$.
  Choose and now fix $N$ so large that the leading constant in Equation (6.6) satisfies $C N^(- 2 alpha) < 1$. Combining the upper and lower bounds and then taking late indices gives
  $ K_i^2 lt.eq gamma_i \( K_i + 1 \)^2 \, #h(2em) gamma_i arrow.r 0 . $
  This also proves boundedness if it was not known previously: $K_i \/ \( K_i + 1 \) lt.eq sqrt(gamma_i)$, and, for $sqrt(gamma_i) < 1$, one has $K_i lt.eq sqrt(gamma_i) \/ \( 1 - sqrt(gamma_i) \) arrow.r 0$. ◻
]

=== 6.4 Small energy fixes the pointed root geometry <small-energy-fixes-the-pointed-root-geometry>

The vanishing energy is an integral statement. To contradict the prescribed change of scale, it remains to translate it into distance preservation on a single dense set of material points and then into preservation of the curvature-radius maximum.

#thm([Lemma 6.6.])[
  (A common time-dependent Ricci bound).  #emph[On a slightly smaller material neighborhood of the isolated cluster, for $0 lt.eq t lt.eq 1$, 
#[#set math.equation(numbering: n => "(6.13)")
 $ \| "Ric" \| \( y \, t \) lt.eq Q_(*) \( t \) #scale(x: 120%, y: 120%)[\[] 1 + \( a \/ l \( y \, t \) \)^2 #scale(x: 120%, y: 120%)[\]] \, #h(2em) parallel Q_(*) parallel_(L^2 \( \[ 0 \, 1 \] \)) arrow.r 0 . $ <eq:final-ricci-bound>]

]
] <final:ricci-envelope>

#proof[
  Inside a fixed large multiple of $a$, use the ordinary local parabolic estimate underlying Proposition 20 on a patch of scale a small fixed multiple of $min \( a \, l \( y \, t \) \)$. The enlarged energy balls contain these patches and their prior windows by the short-motion comparison. Since $eta$ is bounded below on $\[ 0 \, 1 \]$, the estimate and Equation (4.17) give an envelope bounded by $C \( H_(*) + epsilon.alt_i \)$ times $1 + \( a \/ l \)^2$. Its time $L^2$ norm tends to zero by Corollary 29.
  On the exterior annular range, an envelope for the magnitude on all shells is obtained from a fixed outer shell and the sum of the positive first derivative suprema on the intervening dyadic shells. Indeed integrate $nabla "Ric"$ along the radial coordinate curves, using parallel transport for tensor norms. The controlled neck charts give length $O \( r \)$ on each shell, so each shell costs its scaled first derivative supremum. Norms on a fixed shell vary by the same bound along its angular paths. Dividing the estimates for $G = eta "Ric"$ by the fixed positive lower bound of $eta$ is legitimate on this interval. Minkowski’s inequality and Proposition 18 bound the time $L^2$ norm of that envelope by
  $ C [K + tilde(delta)_i + tilde(delta)_i sum_(r in \[ N_0 a \, r_0 \]) #scale(x: 120%, y: 120%)[\(] \( a \/ r \)^alpha + r^alpha #scale(x: 120%, y: 120%)[\)]] arrow.r 0 . $
  The outer-shell value tends to zero by the uncut Ricci improvement and its regular geometry. Only the positive-derivative errors are summed over all shells; the constant error in their zero-order estimate is not summed.
  Outside this range but within the smaller isolated neighborhood, $l$ is bounded below in interval units. Otherwise choose a sequence with $l arrow.r 0$ there. If its images remain in a compact regular part of the original limiting space, smooth convergence is a contradiction. If they approach the isolated point, their distance from the cluster is bounded below in interval units and is much larger than $a$. At that distance scale the vanishing curvature radius and the root give two genuine tips, forcing a nonflat entry larger than $a$. The same argument applies when that distance tends to infinity in interval units but tends to zero originally, by rescaling with the distance itself. Proposition 8 excludes this alternative. Equation (3.1) thus bounds Ricci in the remaining region by $C epsilon.alt_i$. Adding these three envelopes proves the lemma. ◻
]

#thm([Lemma 6.7.])[
  (Good material points).  #emph[There is a single set of material points $cal(G)_i$, independent of time, whose complement has volume $o \( a_i^4 \)$, which is $o \( a_i \)$-dense at every $t in \[ 0 \, 1 \]$ in a smaller neighborhood of the cluster. For points $x \, y in cal(G)_i$ in that neighborhood whose distance at either endpoint is at most $C a_i$, 
#[#set math.equation(numbering: n => "(6.14)")
 $ \| d_1 \( x \, y \) - d_0 \( x \, y \) \| = o \( a_i \) \, $ <final:good-distance>]

 uniformly for each fixed $C$.]
] <final:good-points>

#proof[
  Take nested material neighborhoods compactly contained in the region of Equation (6.13). Uniform convergence of the original distances to $d_T$ gives a fixed positive original distance between the smaller neighborhood and the complement of the larger one. Thus any minimizing segment of interval length $O \( a \)$ with endpoints in the smaller neighborhood remains in the region where that equation applies.
  For such a segment $gamma : \[ 0 \, L \] arrow.r M$ parametrized by arclength, the geodesic curvature-radius estimate of Lemma 9 and spatial $1$-Lipschitzness of $l$ imply, on its first half,
  $ l \( gamma \( s \) \) gt.eq max { l \( x \) - s \, c s } gt.eq c' #scale(x: 120%, y: 120%)[\(] l \( x \) + s #scale(x: 120%, y: 120%)[\)] . $
  The fixed cap in that geodesic estimate is irrelevant at these vanishing original lengths. The second half has the analogous bound from $y$. Integration gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ integral_gamma l^(- 2) thin d s lt.eq C #scale(x: 120%, y: 120%)[\(] l \( x \, t \)^(- 1) + l \( y \, t \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <final:geodesic-integral>]
  The length variation formula under Ricci flow, applied to minimizing segments in both time directions, therefore yields, almost everywhere while $d_t \( x \, y \) lt.eq C a$,
  #[#set math.equation(numbering: n => "(6.16)")
   $ a^(- 1) \| partial_t d_t \( x \, y \) \| lt.eq C_C Q_(*) \( t \) #scale(x: 120%, y: 120%)[\[] 1 + a \/ l \( x \, t \) + a \/ l \( y \, t \) #scale(x: 120%, y: 120%)[\]] . $ <final:distance-derivative>]
  One may equivalently first use upper and lower one-sided length variations; for each fixed smooth flow the distance is locally Lipschitz in time, so these imply the almost-everywhere inequality.
  The scale-sublevel covering in Theorem 6 gives $"Vol"_t { l < s } lt.eq C s^4$ at these scales. Decomposing ${ l < a }$ into the sets $2^(- k - 1) a lt.eq l < 2^(- k) a$ proves
  #[#set math.equation(numbering: n => "(6.17)")
   $ integral_({ l < a }) a / l thin d mu_(g \( t \)) lt.eq sum_(k = 0)^oo 2^(k + 1) C \( 2^(- k) a \)^4 lt.eq C a^4 . $ <final:endpoint-integral>]
  Fix the material measure $d mu_0 = d mu_(g \( 0 \))$. Since $partial_t d mu_g = - R thin d mu_g$ and $\| R \| lt.eq C epsilon.alt_i^2$, all these time-slice measures are uniformly comparable with $d mu_0$. Put $q_i = parallel Q_(*) parallel_(L^1 \( \[ 0 \, 1 \] \)) arrow.r 0$ and define
  $ F_i \( x \) = integral_0^1 Q_(*) \( t \) frac(a, l \( x \, t \)) upright(bold(1))_({ l \( x \, t \) < a }) thin d t . $
  Fubini and Equation (6.17) give $integral F_i thin d mu_0 lt.eq C a^4 q_i$. For $q_i > 0$, discard the material set $cal(B)_i = { F_i > sqrt(q_i) }$. Then
  $ mu_0 \( cal(B)_i \) lt.eq C a^4 sqrt(q_i) \, #h(2em) integral_0^1 Q_(*) \( t \) \( 1 + a \/ l \( x \, t \) \) thin d t lt.eq 2 q_i + sqrt(q_i) quad \( x in.not cal(B)_i \) . $
  If $q_i = 0$, take the good set to be the whole manifold, up to a null set, and the same conclusions hold. The lower ball-volume bound $"Vol"_t B_t \( x \, r \) gt.eq c r^4$ shows that every ball of radius $C' a q_i^(1 \/ 8)$ in the smaller neighborhood meets the good set when $C'$ is large enough. Indeed such a ball has greater volume than the entire bad set, uniformly in time. Taking the complement of $cal(B)_i$ for $cal(G)_i$ proves simultaneous $o \( a \)$ density.
  For good endpoints, the time integral of the right side of Equation (6.16) is $o \( 1 \)$ with a constant depending only on a fixed distance range. If the initial distance is at most $C a$, apply that inequality up to the first time it reaches $\( C + 1 \) a$. Its integrated variation is smaller than $a \/ 2$ for late indices, so such a first crossing cannot occur. The same argument backwards in time treats a pair initially specified at $t = 1$. This proves Equation (6.14), and also prevents points outside a larger bounded scaled ball from entering a smaller one during the comparison. ◻
]

#thm([Proposition 6.8.])[
  (The root maximum cannot change).  #emph[Let $frak(a)_i \( t \)$ denote the root scale of Proposition 8, computed in interval units. Then 
$ a_i^(- 1) \| frak(a)_i \( 1 \) - frak(a)_i \( 0 \) #scale(x: 120%, y: 120%)[\|] arrow.r 0 . $

]
] <final:root-fixed>

#proof[
  Choose a good material anchor within $o \( a \)$ of a maximizing point at time $0$. Extract pointed limits at the two endpoints with length unit $a$. Lemma 31 identifies these limits isometrically. Here is the metric argument in detail. On a fixed bounded ball choose a finite increasingly dense net of good material labels at time $0$. Their distance matrices at time $1$ differ by $o \( 1 \)$ in scaled units. The same is true of nets chosen at time $1$, and the first-crossing argument keeps every such label in a bounded ball at the other time. Apply compactness to their union and then diagonalize in the radius and the net mesh. The limiting correspondence preserves all pairwise distances and is dense and onto; completing it gives a pointed isometry. All bounded balls used here lie near the same isolated point of $Z$ in original units.
  Every exceptional point of either limit is a genuine nontrivial orbifold point by Theorem 6, so the regular part is determined by the metric space itself. The isometry is smooth there and preserves its Riemannian metric: in a sufficiently small regular convex neighborhood, squared distances to suitable nearby points give smooth coordinates with independent differentials; the distance-preserving map has the corresponding smooth coordinate expressions, as does its inverse. Smooth convergence on these regular regions is available at both endpoints. In particular the initial nonflat root patch persists in the other endpoint limit.
  We next check that the curvature radius itself, rather than only the distance metric, is preserved. For a regular point $z$ of the common nonflat limit $X$ define its stopped radius by
  #[#set math.equation(numbering: n => "(6.18)")
   $ lambda_X \( z \) = sup { r > 0 : #h(0.27778em) & B_X \( z \, r \) upright(" contains no exceptional point")\
 & upright("and ") \| "Rm"_X \| lt.eq r^(- 2) upright(" on ") B_X \( z \, r \) } . $ <final:stopped-radius>]
  It is finite: a regular point of nonzero curvature exists at finite distance, so sufficiently large balls fail the curvature test. For any regular convergent sequence $z_i arrow.r z$ at either endpoint,
  #[#set math.equation(numbering: n => "(6.19)")
   $ l \( z_i \, t \) \/ a_i arrow.r lambda_X \( z \) . $ <final:radius-convergence>]
  For the lower bound, take $r < s < lambda_X \( z \)$ with $s$ admissible. The closed $r$-ball has compact regular geometry, and its curvature test has the strict margin $r^2 \| "Rm"_X \| lt.eq \( r \/ s \)^2 < 1$. Smooth convergence and convergence of distances imply admissibility of every slightly smaller $r$-ball in the approximations. Let $r arrow.t lambda_X \( z \)$. For the upper bound, take $r > lambda_X \( z \)$ and then an intermediate radius between them. If its ball meets an exceptional point, genuine concentration approaches that point in the approximations and violates the $r$-curvature test. If it does not, its inadmissibility gives a regular point whose curvature strictly exceeds $r^(- 2)$; this violation persists under smooth convergence. Thus the $r$-ball is eventually inadmissible. The original fixed cap for $l$, divided by the original length corresponding to $a_i$, tends to infinity, so it imposes no further restriction here. This proves Equation (6.19), including possible equality cases at the limiting threshold.
  The defining maximum is
  $ frac(frak(a)_i \( t \), a_i) = max_(y in cal(U)) frac(l \( y \, t \), a_i) psi #scale(x: 120%, y: 120%)[\(] l \( y \, t \)^2 \| "Rm" \| \( y \, t \) #scale(x: 120%, y: 120%)[\)] . $
  At a maximizer, $l \/ a_i$ is bounded below by a positive constant, because $frak(a)_i \( t \) \/ a_i$ is bounded below and $psi$ is bounded. It is also bounded above by the detection and outermost-scale property of Proposition 8. Maximizers at time $1$ stay at bounded scaled distance from the common anchor. Indeed the persistent nonflat root patch supplies a nonflat entry of scale comparable to $a_i$ at that time; if a maximizing nonflat entry escaped from it, their distance-scale limit would have two genuine tips and produce an entry larger than the outermost scale. The same bounded-range statement at time $0$ follows from the choice of the anchor.
  Consequently maximizers at either endpoint have subsequences converging to regular points of $X$. At any such point, Equation (6.19), smooth curvature convergence, and continuity of $psi$ show that their values tend to
  $ lambda_X \( z \) thin psi #scale(x: 120%, y: 120%)[\(] lambda_X \( z \)^2 \| "Rm"_X \| \( z \) #scale(x: 120%, y: 120%)[\)] . $
  That same regular point can be approximated in the other endpoint sequence, giving the same limit value there. A subsequence realizing any proposed strict difference between the two maxima is therefore impossible: its maximizing point at the larger end provides a competing point at the smaller end. Applying this in both directions proves the proposition. ◻
]

=== 6.5 Smooth continuation on the original manifold <smooth-continuation-on-the-original-manifold>

Proposition 32 contradicts the definite factor change of the comparable positive root scales at the endpoints of the intervals in Proposition 12. Hence a scalar-bounded flow cannot have a concentration point. Theorem 6 then gives a uniform full-curvature bound up to the original finite time $T$.

For completeness, this yields the precise extension required in Theorem 1. Curvature differentiation on a closed manifold gives bounds for every covariant derivative of curvature on any interval $\[ t_0 \, T \)$ with $t_0 > 0$. Bounded Ricci curvature and $partial_t g = - 2 "Ric"$ first make $g \( t \)$ uniformly equivalent to $g \( t_0 \)$. Integrating the connection variation and its successive derivatives, or working in the resulting fixed controlled charts, then gives uniform bounds and convergence for all coordinate derivatives of $g \( t \)$. Thus $g \( t \)$ converges smoothly to a positive definite smooth metric $g_T$ on the original manifold $M$. Short-time existence from $g_T$ follows from the Ricci–DeTurck equation on this same closed smooth manifold, followed by its diffeomorphism pullback. The flow equation determines all time derivatives from the spatial derivatives, so the old and new solutions join smoothly at $T$. Retaining the given flow for $t < T$ and this solution for $t gt.eq T$ gives a smooth Ricci flow $tilde(g)$ on $M times \[ 0 \, T + epsilon \)$, for some $epsilon > 0$, with $tilde(g) \( t \) = g \( t \)$ for every $t < T$. The argument uses arbitrary smooth initial data in real dimension four; no change of manifold or orbifold continuation is involved.


#bibliography("refs.bib", style: "ieee", title: [References])
