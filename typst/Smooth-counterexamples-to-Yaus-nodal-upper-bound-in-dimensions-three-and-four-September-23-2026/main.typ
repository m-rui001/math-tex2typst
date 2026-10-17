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

#align(center)[#text(size: 16pt, weight: "bold")[Smooth counterexamples to Yau's nodal upper bound \
in dimensions three and four]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

==== 1 Introduction <sec:introduction>

Let $\( M \, g \)$ be a closed connected smooth Riemannian manifold of dimension $d$. We write $- Delta_g u = lambda u$ for a nonzero real Laplace eigenfunction with $lambda > 0$, and $Z_u = { x in M : u \( x \) = 0 }$ for its nodal set. Yau’s nodal conjecture in the smooth category predicts constants $c_g \, C_g > 0$, depending on this one metric, such that

#[#set math.equation(numbering: n => "(1)")
 $ c_g sqrt(lambda) lt.eq cal(H)_g^(d - 1) \( Z_u \) lt.eq C_g sqrt(lambda) $ <eq:intro-yau>]

for every such eigenfunction. The distinction between a fixed metric and a metric chosen anew at each eigenvalue is essential. The lower and upper inequalities are also logically separate. This paper disproves the upper inequality in two low-dimensional smooth settings.

#thm([Theorem 1.])[
  #emph[Let $g_(*)$ be the round metric on $bb(S)^3$. Every neighborhood of $g_(*)$ in the $C^oo$ topology contains a smooth Riemannian metric $g_oo$ for which there are nonzero smooth real functions $u_j$ and positive numbers $lambda_j$ satisfying 
$ - Delta_(g_oo) u_j = lambda_j u_j \, #h(2em) lambda_j arrow.r oo \, #h(2em) frac(cal(H)_(g_oo)^2 \( Z_(u_j) \), sqrt(lambda_j)) arrow.r oo . $

]
] <thm:main>

#thm([Theorem 2.])[
  #emph[There are a smooth Riemannian metric $g_oo$ on $S^2 times bb(T)^2$, nonzero smooth real functions $u_j$, and positive numbers $lambda_j arrow.r oo$ such that 
$ - Delta_(g_oo) u_j = lambda_j u_j \, #h(2em) frac(cal(H)_(g_oo)^3 \( Z_(u_j) \), sqrt(lambda_j)) arrow.r oo . $

]
] <thm:four>

Theorem 1 gives a negative resolution of the upper-bound part of the smooth nodal conjecture already in dimension three, with metrics arbitrarily close to the round sphere. Theorem 2 provides a distinct four-dimensional topology and metric realization. Neither theorem asserts a power-law excess, and neither contradicts the lower-bound part of (1). In dimensions at least five, a separate companion constructs fixed-metric counterexamples with a fixed positive power-law excess [17] Theorem 1.1 and Corollary 5.6.

======= 1.1 Context. <context.>

Yau formulated the nodal measure problem for Laplace eigenfunctions on closed manifolds [25]. Donnelly and Fefferman established both sharp estimates for real-analytic metrics [5] Theorem 1.2. For smooth metrics, Hardt and Simon obtained a general non-polynomial upper estimate [11] Section 5. Logunov later proved a polynomial upper estimate in dimensions at least three [14], as well as the sharp lower estimate [15] Theorem 1.1. The gap between polynomial growth and the conjectured square-root upper bound is where the examples here lie.

The smooth surface case has a separate quantitative history. Brüning proved the sharp square-root lower estimate [2] Satz 2. Donnelly and Fefferman obtained the upper estimate $C_g lambda^(3 \/ 4)$ [6], and Logunov and Malinnikova improved its exponent to $3 \/ 4 - beta$ for a universal $beta in \( 0 \, 1 \/ 4 \)$ [16]. Under intermediate regularity hypotheses, Hezari proved bounds for Gevrey metrics and a specified quasianalytic class [12] preprint version, Theorems 1.1 and 1.2; these are not statements for arbitrary smooth metrics.

Metric flexibility has also been used to prescribe nodal geometry. On a closed manifold of dimension at least three, Enciso and Peralta-Salas realized any smooth connected closed orientable separating hypersurface as the nodal set of a first nonconstant eigenfunction by choosing the metric [8] preprint version, Theorem 1.1. Their work with Steinerberger prescribes any smooth connected closed separating hypersurface in the same dimensions, within each conformal class and with fixed total volume, up to an ambient diffeomorphism arbitrarily close to the identity in $C^0$ [9] preprint version, Theorem 1.1. On a fixed round sphere or flat torus, high-energy eigenfunctions can have nodal components of prescribed complicated topology [10]. Krauz has prescribed individual nodal configurations on the sphere by metric choice [13]. These results address nodal topology, including at high frequencies on fixed analytic metrics. The distinction in Theorems 1 and 2 is the unbounded normalized nodal measure along a sequence of eigenfunctions for one fixed smooth metric.

======= 1.2 Two constructions and their common logic. <two-constructions-and-their-common-logic.>

Each branch starts from a background metric with explicit high-frequency eigenfunctions and a region left unchanged by all local corrections. A smooth logarithmic envelope is corrugated in transverse directions so that its integrated gradient becomes arbitrarily large without losing the strict Hessian inequality needed for localized complex waves. Finite phase and transport jets give quasimodes with arbitrarily small weighted residual. This construction is related to complex-phase WKB quasimodes [4] Section 3; the weighted finite-order estimates required here are proved in the wave sections. A Gaussian superposition makes the real value and first derivative jointly nonvanishing and supplies many strict opposite-sign tests along short coordinate segments. These tests form a lower semicontinuous score bounded by the nodal Hausdorff measure, even when the zero set is not assumed regular. Random-wave studies of typical nodal volume provide a related probabilistic backdrop [19,24]; the argument here selects one wave with a large stable sign score and proves its realization under a metric change, rather than importing a random-wave nodal-volume formula.

The obstacle is to replace each quasimode by an exact eigenfunction of an #emph[ordinary] Laplace–Beltrami operator while retaining every sign. In the three-sphere branch, a scalar conductivity and independent density first correct the equation. Division by a positive solution of a semilinear elliptic equation makes them satisfy the three-dimensional metric determinant identity in the active region; a transverse tensor change repairs the remaining defect in a clean annulus. In the $S^2 times bb(T)^2$ branch, a conformal scalar correction has coercive linearization $Delta_h - 2 lambda$, and a change tangent to the level sets enforces the four-dimensional determinant identity. These are separate exactification arguments, not a dimension-independent realization lemma.

Figure 1 isolates the two dimension-specific repairs. The first converts a scalar conductivity and density into a metric; the second uses a conformal correction before repairing a rank-three tangent bundle. In both rows, the last tensor change annihilates the gradient of the chosen eigenfunction and therefore leaves its corrected equation unchanged.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[three-sphere#linebreak()quasimode]]])])
  content((2.955, 0), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[scalar weighted#linebreak()correction]]])])
  content((5.91, 0), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[positive factor#linebreak()and division]]])])
  content((8.865, 0), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[two-plane#linebreak()repair]]])])
  content((11.82, 0), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[exact metric#linebreak()eigenpair]]])])
  content((0, -1.7), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$S^2 times bb(T)^2$#linebreak()quasimode]]])])
  content((2.955, -1.7), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[tensor weighted#linebreak()correction]]])])
  content((5.91, -1.7), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[conformal#linebreak()factor]]])])
  content((8.865, -1.7), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[three-plane#linebreak()repair]]])])
  content((11.82, -1.7), [#box(width: 2.735cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[exact metric#linebreak()eigenpair]]])])
  line((1.368, 0), (1.588, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((4.323, 0), (4.543, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((7.278, 0), (7.498, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((10.23, 0), (10.45, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((1.368, -1.7), (1.588, -1.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((4.323, -1.7), (4.543, -1.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((7.278, -1.7), (7.498, -1.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((10.23, -1.7), (10.45, -1.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
})],
  caption: [Figure 1: Two routes from localized quasimodes to exact eigenfunctions of ordinary metrics. The repairs preserve the strict sign tests used later to pass to one fixed limiting metric. ],
) <fig:two-repairs>

Finally, a perturbation preserving the selected eigenfunction makes its eigenvalue simple. A strict lower bound for the sign score then persists for all metrics in a neighborhood. Nested metric neighborhoods retain each previous witness while inserting the next one, and converge to the single smooth metric required by each theorem. The large-frequency thresholds may depend on each fixed envelope; no uniform spectral gap is required. Uhlenbeck’s generic simplicity theorem [23] is context for this spectral step, not a substitute for the selected-mode-preserving perturbations proved here.

Taking the product of the three-sphere metric with any fixed closed Riemannian manifold and pulling back its eigenfunctions gives further qualitative failures in higher dimensions. This elementary extension does not assert a power-law excess in dimensions three or four.

Together with the surface theorem [18] Theorem 1.1, Theorem 1 and this product observation give the exact universal dimension threshold: among dimensions $d gt.eq 2$, the upper inequality in (1), with a metric-dependent constant uniform over all nonzero real eigenfunctions of positive eigenvalue, holds for every closed connected smooth Riemannian manifold precisely when $d = 2$. For each $d gt.eq 3$, there is one fixed smooth metric with a violating sequence.

======= 1.3 Organization and conventions. <organization-and-conventions.>

The three-sphere proof first constructs amplifiable profiles in Section 2, waves and signs in Section 3, an exact ordinary metric in Section 4, and a fixed-metric limit in Sections 5–6. The $S^2 times bb(T)^2$ proof then develops its own envelopes in Section 7, waves in Section 8, sign score in Section 9, metric correction in Section 10, and spectral limit in Section 11. Throughout, gradients and divergences carry the displayed metric unless stated otherwise. Hausdorff measure is taken for the Riemannian distance, with a fixed standard normalization. All finite derivative and residual orders are chosen before sending the frequency to infinity.

== The three-sphere construction <the-three-sphere-construction>

==== 2 Profiles with large mean gradient <sec:profiles>

A smooth real function $phi.alt$ will determine the amplitude envelope $e^(n phi.alt)$ at frequency $n$ for the waves in Section 3. Their construction requires a strict Hessian inequality, whereas their eventual nodal-area lower bound grows with the integrated gradient of $phi.alt$. We show that these two requirements are compatible: a local perturbation can increase the gradient integral arbitrarily while preserving the Hessian condition and changing $phi.alt$ arbitrarily little in $C^0$. We then apply this construction on $bb(S)^3$, preserving a prescribed radial profile outside one coordinate cube.

Throughout this section, gradients, Hessians, and norms are computed using a fixed smooth Riemannian metric $g$ on a three-dimensional manifold. Write

$ a_phi.alt = "grad"_g phi.alt \, #h(2em) L_phi.alt = \( 1 + \| a_phi.alt \|^2 \)^(1 \/ 2) \, #h(2em) H_phi.alt = "Hess"_g phi.alt . $

#prodef([Definition 3.])[
  (Strict and full profiles).  A smooth function $phi.alt$ is #emph[strict] at a point if there exists a real vector $b$ at that point such that
  #[#set math.equation(numbering: n => "(2)")
   $ b perp a_phi.alt \, #h(2em) \| b \| = L_phi.alt \, #h(2em) H_phi.alt \( a_phi.alt \, a_phi.alt \) + H_phi.alt \( b \, b \) > 0 . $ <eq:profile-strict>]
  It is #emph[full] at that point if the last inequality holds for every $b$ satisfying the first two conditions.
] <def:strict-profile>

For a symmetric form $H$ and a unit vector $v perp a$, it is convenient to set

$ cal(T) \( H \, a \; v \) = H \( a \, a \) + \( 1 + \| a \|^2 \) H \( v \, v \) . $

Fullness on a compact set where $a_phi.alt$ does not vanish gives a positive minimum of $cal(T) \( H_phi.alt \, a_phi.alt \; v \)$ over the transverse unit-circle bundle. That minimum is allowed to depend on the profile.

The main construction in this section is local.

#thm([Proposition 4.])[
  (Amplification of the mean gradient).  #emph[Let $Omega$ be a coordinate cube with compact closure in a smooth three-dimensional Riemannian manifold. Suppose that $phi.alt$ is smooth on a neighborhood of $overline(Omega)$, is strict there, and satisfies $a_phi.alt eq.not 0$ there. Given $T > 0$ and $epsilon > 0$, there is a smooth function $hat(phi.alt)$ on the same neighborhood such that 
$ "supp" \( hat(phi.alt) - phi.alt \) subset.double Omega \, #h(2em) parallel hat(phi.alt) - phi.alt parallel_(C^0 \( Omega \)) < epsilon \, #h(2em) integral_Omega \| a_(hat(phi.alt)) \| thin thin upright(d) V_g > T . $

 The function $hat(phi.alt)$ is strict and has nonvanishing gradient on $overline(Omega)$.]
  #emph[More precisely, there is a constant $eta > 0$, determined only by the fixed periodic functions chosen below, such that one finite cycle of the construction multiplies $integral_Omega \| a_phi.alt \| thin thin upright(d) V_g$ by at least $1 + eta$. The cycle can have arbitrarily small $C^0$ size. Its patch sizes and frequency thresholds may depend on the entire incoming profile and metric.]
] <prop:profile-amplification>

The cycle has two parts. A first perturbation makes the profile full on a fixed positive fraction of its gradient mass while changing the gradient arbitrarily little. A radial perturbation in the two transverse variables then increases the gradient on a fixed fraction of that region. The radial perturbation preserves strictness, allowing the cycle to be repeated.

===== 2.1 Localization and periodic averaging <localization-and-periodic-averaging>

We use two elementary facts in both parts of the construction.

#thm([Lemma 5.])[
  (Disjoint patches and averaging).  #emph[Let $U$ be an open subset of a relatively compact coordinate cube, and let $mu$ be a finite measure given by a positive smooth density.]
  + #emph[Given an open neighborhood of each point of $U$, one can choose finitely many coordinate cubes $P_j$, with disjoint interiors and closures contained in those neighborhoods and in $U$, and functions $0 lt.eq chi_j lt.eq 1$ in $C_c^oo \( P_j \)$, such that $chi_j = 1$ on open cores $C_j subset.double P_j$ and 
$ mu #scale(x: 180%, y: 180%)[\(] union.big_j C_j #scale(x: 180%, y: 180%)[\)] gt.eq 1 / 2 mu \( U \) . $

 In particular, the supports of the $chi_j$ are pairwise disjoint.]
  + #emph[Suppose that $y$ is a smooth submersion to $bb(R)^q$, with $q = 1$ or $2$, on a neighborhood of $overline(P)$, and that $C subset.double P$ is measurable. Let $E subset bb(R)^q$ be periodic with respect to a full lattice, have boundary of measure zero in a period cell, and occupy a fraction $p$ of that cell. Then 
$ lim_(N arrow.r oo) mu { x in C : N y \( x \) in E } = p thin mu \( C \) . $

]
] <lem:profile-localization>

#proof[
  For the first assertion, choose a compact subset of $U$ carrying more than three quarters of its mass. A finite subcover of the prescribed neighborhoods has a Lebesgue number on this compact set. A sufficiently fine coordinate grid therefore gives finitely many cubes, each with closure in one of the prescribed neighborhoods and in $U$, whose union contains that compact set except for grid faces. The faces have zero mass. Shrinking the cores inside these cubes loses arbitrarily little mass, and smooth cutoffs supported in the cubes can be chosen to equal one on the cores.
  For the second assertion, submersion coordinates and a finite partition of unity express the pushforward of $mu \|_C$ under $y$ as an integrable density on $bb(R)^q$. Thus it suffices to average the bounded periodic function $upright(bold(1))_E \( N dot.op \)$ against an $L^1$ function. For the indicator of a rectangle, the assertion follows by tiling with period cells and estimating the cells meeting the rectangle’s boundary. Approximation of an $L^1$ function by finite linear combinations of rectangle indicators proves the claim. The boundary assumption on $E$ ensures that its cell average is well defined and unchanged by choices on its boundary. ◻
]

We fix a smooth function $h$ of period one such that

$ h'' \( t \) = 2 cos \( 2 pi t \) . $

For example, $h \( t \) = - \( 2 pi^2 \)^(- 1) cos \( 2 pi t \)$. The periodic set

$ E_h = { t : h'' \( t \) > 1 } $

has fraction $p_h = 1 \/ 3$ in each period.

===== 2.2 Preparing a full region <preparing-a-full-region>

#thm([Lemma 6.])[
  (Preparation).  #emph[Under the hypotheses of Proposition 4, let $0 < epsilon.alt_p lt.eq 1 \/ 3$ and $epsilon > 0$. There is a smooth strict function $psi$, with nonvanishing gradient on $overline(Omega)$, such that 
$ "supp" \( psi - phi.alt \) subset.double Omega \, #h(2em) parallel psi - phi.alt parallel_(C^0 \( Omega \)) < epsilon \, #h(2em) \| a_psi - a_phi.alt \| lt.eq epsilon.alt_p \| a_phi.alt \| quad upright("on ") overline(Omega) . $

 Its full region $U subset Omega$ satisfies 
#[#set math.equation(numbering: n => "(3)")
 $ integral_U \| a_psi \| thin thin upright(d) V_g gt.eq p_h / 8 integral_Omega \| a_psi \| thin thin upright(d) V_g . $ <eq:prepared-mass>]

 The change $psi - phi.alt$ can, in addition, be made arbitrarily small in $C^1$.]
] <lem:profile-preparation>

#proof[
  Put $a = a_phi.alt$. At each point, choose a strict unit direction $v perp a$. Because $a$ does not vanish, the flow-box construction gives a local first integral $s$, with $thin upright(d) s \( a \) = 0$, whose differential at the point is any prescribed nonzero covector annihilating $a$. Prescribe it also to annihilate $v$. On a sufficiently small neighborhood, the line
  $ a^perp ∩ ker thin upright(d) s $
  continues to be strict, with a positive margin on a smaller compact neighborhood. The differential $thin upright(d) s$ remains nonzero there.
  Apply Lemma 5 to these neighborhoods with $thin upright(d) mu = \| a \| thin thin upright(d) V_g$. It gives finitely many cubes and cutoff-one cores capturing at least half the mass. We first describe the perturbation on one cube, suppressing its index. Let $chi$ be its cutoff. For a constant $C > 0$ to be fixed before $N$, set
  $ psi_N = phi.alt + C N^(- 2) chi h \( N s \) . $
  Direct differentiation gives, uniformly on the patch,
  $ a_(psi_N) & = a + C / N chi h' \( N s \) "grad" s + C / N^2 h \( N s \) "grad" chi \,\
H_(psi_N) & = H_phi.alt + C chi h'' \( N s \) thin thin upright(d) s ⊗ thin upright(d) s + O \( N^(- 1) \) . $
  All constants in this proof may depend on the fixed patch data, including $C$, but not on $N$.
  For large $N$, choose a unit vector $v_N$ on the line
  $ a_(psi_N)^perp ∩ ker thin upright(d) s . $
  This line tends uniformly to the old strict line. The added leading Hessian has zero value on $v_N$, while $thin upright(d) s \( a_(psi_N) \) = O \( N^(- 1) \)$. Its value on the new gradient is therefore $O \( N^(- 2) \)$, even on the portions where $h''$ is negative. The remaining Hessian error is $O \( N^(- 1) \)$. The old strict margin consequently preserves strictness for all sufficiently large $N$.
  We choose $C$ to obtain fullness on the cutoff-one core where $N s in E_h$. For the old gradient, consider the symmetric form on $a^perp$
  $ B = \( 1 + \| a \|^2 \) H_phi.alt \|_(a^perp) + H_phi.alt \( a \, a \) "Id" . $
  In an orthonormal basis $\( v \, w \)$ with $thin upright(d) s \( v \) = 0$ and $w = "grad" s \/ \| thin upright(d) s \|$, its $v v$ entry is bounded below by some $m > 0$. All its entries are bounded on the patch. Adding
  $ C \( 1 + \| a \|^2 \) \| thin upright(d) s \|^2 thin w ⊗ w $
  makes $B$ uniformly positive definite when $C$ is sufficiently large. Indeed, if $\| B_(v w) \| lt.eq M$ and $B_(w w) gt.eq - M$, it is enough to make the new $w w$ entry exceed $M^2 \/ m + m$; the Schur complement is then positive. The factor $\( 1 + \| a \|^2 \) \| thin upright(d) s \|^2$ has a positive patch minimum, so a finite $C$ suffices. On the specified core $chi = 1$ and $h'' > 1$, so the actual leading addition is at least this large. Changing the gradient by $O \( N^(- 1) \)$ and adding the Hessian remainder preserves its positive minimum for large $N$. Thus $psi_N$ is full there.
  Perform these perturbations on the finite disjoint patches, with their chosen constants $C$, using a common sufficiently large $N$. The changes are arbitrarily small in $C^1$, preserve nonvanishing, and have compact support in $Omega$. Lemma 5 shows that the union $G_N$ of the cutoff-one regions with $N s in E_h$ satisfies
  $ integral_(G_N) \| a \| thin thin upright(d) V_g gt.eq p_h / 4 integral_Omega \| a \| thin thin upright(d) V_g $
  for sufficiently large $N$. Choose $N$ still larger so that the stated pointwise relative gradient bound holds. With $cal(M) \( zeta \) = integral_Omega \| a_zeta \| thin thin upright(d) V_g$, the full region therefore has mass at least
  $ \( 1 - epsilon.alt_p \) p_h / 4 cal(M) \( phi.alt \) gt.eq frac(p_h \( 1 - epsilon.alt_p \), 4 \( 1 + epsilon.alt_p \)) cal(M) \( psi_N \) gt.eq p_h / 8 cal(M) \( psi_N \) . $
  Fullness is open where the gradient is nonzero, so this gives the asserted open full region. The $C^0$ bound and any additional prescribed $C^1$ smallness follow by increasing $N$ once more. ◻
]

===== 2.3 Radial corrugation in two transverse variables <radial-corrugation-in-two-transverse-variables>

Fix numbers

$ 0 < r_0 < r_1 < r_2 < R < 1 / 4 $

and a smooth nonnegative function $f'$ supported in $\( r_0 \, R \)$, with $f' gt.eq c_1 > 0$ on $\( r_1 \, r_2 \)$. Define $f \( s \) = integral_0^s f' \( t \) thin thin upright(d) t$. On every disk of radius $R$ centered at a point of $bb(Z)^2$, define $F$ by the radial function $f$; extend it by the constant $f \( R \)$ off these disks. The result is a smooth $bb(Z)^2$-periodic function, constant near the disk centers and boundaries. Its annular set

$ E_F = union.big_(k in bb(Z)^2) { y : r_1 < \| y - k \| < r_2 } $

has a fixed positive fraction $p_F = pi \( r_2^2 - r_1^2 \)$ in a period cell.

#thm([Lemma 7.])[
  (Transverse radial corrugation).  #emph[There are constants $delta > 0$ and $g_0 > 0$, depending only on the fixed function $F$, with the following property. Let $psi$ be full with nonvanishing gradient on a neighborhood of the closure of a relatively compact coordinate patch $P$. Suppose that $y = \( y_1 \, y_2 \)$ is a smooth submersion there, with 
$ thin upright(d) y \( a_psi \) = 0 \, #h(2em) upright("both nonzero singular values of ") thin upright(d) y upright(" in ") \[ 1 \/ 2 \, 2 \] . $

 Let $A > 0$ be constant and satisfy $1 \/ 2 lt.eq A \/ \| a_psi \| lt.eq 2$, and let $0 lt.eq chi lt.eq 1$ belong to $C_c^oo \( P \)$. Set 
$ Phi_N = psi + frac(delta A, N) chi F \( N y \) . $

 For every sufficiently large integer $N$, the function $Phi_N$ is strict and has nonvanishing gradient on $overline(P)$. Moreover, $parallel Phi_N - psi parallel_(C^0 \( P \)) arrow.r 0$. Given any $epsilon.alt_r > 0$, all sufficiently large $N$ satisfy 
#[#set math.equation(numbering: n => "(4)")
 $ \| a_(Phi_N) \| & gt.eq \( 1 - epsilon.alt_r \) \| a_psi \| &  & upright("on ") overline(P) \,\
\| a_(Phi_N) \| & gt.eq \( 1 + g_0 - epsilon.alt_r \) \| a_psi \| &  & upright("where ") chi = 1 upright(" and ") N y in E_F . $ <eq:radial-no-loss>]

 The frequency thresholds may depend on all the fixed patch data and on $epsilon.alt_r$; the constants $delta \, g_0$ do not.]
] <lem:radial-corrugation>

#proof[
  Put $a = a_psi$ and $a_N = a_(Phi_N)$. When $N y$ lies in a periodic disk, let $d_R \, d_T$ be the radial and angular unit-coefficient combinations of $thin upright(d) y_1 \, thin upright(d) y_2$. The singular-value hypothesis gives
  $ 1 / 2 lt.eq \| d_R \| \, \| d_T \| lt.eq 2 . $
  These covectors need not be orthogonal in the metric. Outside the disks, set the leading derivatives $f' \, f'' \, f' \/ s$ to zero. There, or in the constant central portions of the disks, choose any orthonormal coefficient pair when such notation is needed. Set $f' \/ s = 0$ at the center. Since $f$ is constant near the center, this agrees with its smooth continuation.
  The exact gradient formula and the Hessian expansion are
  #[#set math.equation(numbering: n => "(5)")
   $ a_N & = a + q thin d_R^sharp + e_N \,\
q & = delta A chi f' \, #h(2em) e_N = frac(delta A, N) F \( N y \) "grad" chi \, $ <eq:radial-gradient>]
  #[#set math.equation(numbering: n => "(6)")
   $ H_(Phi_N) = H_psi + N delta A chi [f'' d_R^2 + f' / s d_T^2] + E_N \, $ <eq:radial-hessian>]
  with
  #[#set math.equation(numbering: n => "(7)")
   $ \| E_N \| lt.eq C_P (\( chi + \| thin upright(d) chi \| \) f' + N^(- 1)) . $ <eq:radial-remainder>]
  Here and below $C_P$ denotes a finite constant depending on the fixed patch data, independent of $N$. To check the remainder, its terms are
  $ & delta A chi sum_i F_i \( N y \) "Hess" y_i \,\
 & delta A (thin upright(d) chi ⊗ sum_i F_i \( N y \) thin upright(d) y_i + sum_i F_i \( N y \) thin upright(d) y_i ⊗ thin upright(d) chi) \,\
 & frac(delta A, N) F \( N y \) "Hess" chi . $
  Since $\| \( F_1 \, F_2 \) \| = f'$, these give Equation (7). In the constant portions of $F$, its value contributes only to $e_N$ and to the last displayed term.
  We first control the leading Hessian trace in (6). The leading increment in (5) is perpendicular to $a$, so
  $ \| a_N \| gt.eq \| a \| - \| e_N \| . $
  Thus $a_N$ is nonzero for large $N$. Choose a vector $b_N$ satisfying
  $ b_N perp a_N \, #h(2em) d_R \( b_N \) = 0 \, #h(2em) \| b_N \| = L_N := \( 1 + \| a_N \|^2 \)^(1 \/ 2) . $
  The two linear constraints have a nonzero common solution in dimension three. They imply
  $ chevron.l a \, b_N chevron.r = - chevron.l e_N \, b_N chevron.r . $
  Because $\| a \|$ has a positive patch minimum, the component of $b_N \/ L_N$ along $a$ tends uniformly to zero. The kernel of $thin upright(d) y$ is precisely the line spanned by $a$. Its singular-value lower bound and the identity $d_R \( b_N \) = 0$ consequently give, for all sufficiently large $N$,
  $ \| d_T \( b_N \) \| = \| thin upright(d) y \( b_N \) \| gt.eq 1 / 4 L_N . $
  Also $A lt.eq 3 L_N$ for large $N$, and
  $ \| d_R \( a_N \) \| lt.eq 4 delta A chi f' + 2 \| e_N \| . $
  With $K = parallel f'' parallel_oo$ and $B_N = f'' d_R^2 + \( f' \/ s \) d_T^2$, it follows that
  $ B_N \( a_N \, a_N \) + B_N \( b_N \, b_N \) & gt.eq 1 / 16 L_N^2 f' / s - K \| d_R \( a_N \) \|^2\
 & gt.eq 1 / 16 L_N^2 f' / s - 288 K delta^2 L_N^2 \( f' \)^2 - 8 K \| e_N \|^2 . $
  The estimate uses $\( x + y \)^2 lt.eq 2 x^2 + 2 y^2$; in particular, its final error is $O_P \( N^(- 2) \)$. Write $S_0 = sup_s s f' \( s \) > 0$. Choose once and for all
  $ 0 < delta^2 lt.eq frac(1, 9216 K S_0) . $
  Then $\( f' \)^2 lt.eq S_0 f' \/ s$ gives
  #[#set math.equation(numbering: n => "(8)")
   $ N delta A chi #scale(x: 120%, y: 120%)[\[] B_N \( a_N \, a_N \) + B_N \( b_N \, b_N \) #scale(x: 120%, y: 120%)[\]] gt.eq N delta A chi L_N^2 / 32 f' / s - C_P N^(- 1) . $ <eq:radial-leading-trace>]
  All constants used to choose $delta$ depend only on $F$ and the numerical singular-value bounds.
  We next control the transition where the favorable leading term can be small. A nonnegative smooth cutoff satisfies
  $ \| thin upright(d) chi \| lt.eq C_P sqrt(chi) . $
  Indeed, extend it by zero in the coordinate chart. If its Euclidean Hessian is bounded by $M > 0$, the Taylor inequality at $x - M^(- 1) D chi \( x \)$ gives $\| D chi \( x \) \|^2 lt.eq 2 M chi \( x \)$; metric equivalence gives the stated bound. Consequently, with $t = chi f'$, Equations (5) and (7) imply
  #[#set math.equation(numbering: n => "(9)")
   $ \| a_N - a \| lt.eq C_P \( t + N^(- 1) \) \, #h(2em) \| E_N \| lt.eq C_P \( t + sqrt(t) + N^(- 1) \) . $ <eq:radial-small-product>]
  Let $m > 0$ be the minimum of the full trace $cal(T) \( H_psi \, a \; v \)$ over the transverse unit circles on $overline(P)$. Project $b_N \/ L_N$ onto $a^perp$ and normalize; for large $N$ this gives a unit vector $v_N perp a$ differing from $b_N \/ L_N$ by $O_P \( N^(- 1) \)$. Using also $\| L_N - L_psi \| lt.eq \| a_N - a \|$, the base Hessian trace is at least
  $ H_psi \( a_N \, a_N \) + H_psi \( b_N \, b_N \) gt.eq m - C_P \( t + N^(- 1) \) . $
  The vectors $a_N \, b_N$ are uniformly bounded for this fixed patch, so the trace of the remainder in (9) is bounded in absolute value by $C_P \( t + sqrt(t) + N^(- 1) \)$. Choose $t_0 > 0$ sufficiently small that these terms involving $t$ and $sqrt(t)$ total less than $m \/ 4$ when $t lt.eq t_0$. For sufficiently large $N$, Equation (8) now gives a strictly positive total trace throughout $t lt.eq t_0$.
  On the complementary region $t gt.eq t_0$, one has $s lt.eq R$, and the positive term in (8) is at least
  $ frac(N delta A t_0, 32 R) . $
  It tends to infinity and dominates the bounded base and remainder traces. This proves strictness for all sufficiently large $N$. In this argument $t_0$ and the frequency threshold can depend on the full margin $m$ and all patch derivatives. The choice of $delta$ is already fixed. In particular, the region $t arrow.r 0$ requires no lower bound for the product $N t$.
  Finally, exact orthogonality in the leading gradient gives
  $ \| a + q d_R^sharp \|^2 = \| a \|^2 + q^2 \| d_R \|^2 . $
  The uniform error $e_N = O_P \( N^(- 1) \)$ proves (4). Where $chi = 1$ and $N y in E_F$, the bounds $A gt.eq \| a \| \/ 2$ and $\| d_R \| gt.eq 1 \/ 2$ give
  $ \| a + q d_R^sharp \| gt.eq \| a \| sqrt(1 + frac(delta^2 c_1^2, 16)) . $
  Set
  $ g_0 = sqrt(1 + frac(delta^2 c_1^2, 16)) - 1 > 0 . $
  Decreasing the fixed $delta$ if necessary, assume $g_0 lt.eq 1$. The positive minimum of $\| a \|$ allows $\| e_N \| lt.eq epsilon.alt_r \| a \|$ for large $N$, proving (4). The $C^0$ convergence follows directly from the factor $N^(- 1)$ in the definition of $Phi_N$. ◻
]

===== 2.4 A fixed gain and finite iteration <a-fixed-gain-and-finite-iteration>

#proof[
  Keep the periodic functions and the constants from Lemma 7 fixed. Define
  $ theta = frac(p_h p_F, 64) \, #h(2em) t_(*) = theta g_0 \, #h(2em) eta = t_(*) / 4 > 0 . $
  We prove the cycle statement, allowing any prescribed positive $C^0$ budget for that cycle.
  Apply Lemma 6 with $epsilon.alt_p lt.eq min \( 1 \/ 3 \, t_(*) \/ 16 \)$ and half the $C^0$ budget. Write $psi$ for the resulting profile and $U$ for its full region. The preparation, including its frequency, is now held fixed. On a sufficiently small neighborhood of each point of $U$, the flow-box construction gives two first integrals $y_1 \, y_2$ of $a_psi$. Their differentials can be prescribed to form an orthonormal basis of $a_psi^perp$ at the center; after shrinking, the nonzero singular values of $thin upright(d) y$ lie in $\[ 1 \/ 2 \, 2 \]$. One can also choose a constant $A$ on that patch with $1 \/ 2 lt.eq A \/ \| a_psi \| lt.eq 2$.
  Apply Lemma 5 in $U$ with density $\| a_psi \| thin thin upright(d) V_g$. Its radial patch cores capture at least half the full-region mass. In view of Equation (3), their total mass is at least $\( p_h \/ 16 \) cal(M) \( psi \)$. For all sufficiently large common radial frequencies $N$, periodic averaging gives a set of cutoff-one annular points of mass at least
  $ frac(p_h p_F, 32) cal(M) \( psi \) gt.eq theta cal(M) \( psi \) . $
  Use Lemma 7 on these disjoint patches. Increase $N$ to obtain strictness, nonvanishing, the remaining half of the $C^0$ budget, and relative errors
  $ epsilon.alt_r lt.eq t_(*) / 8 \, #h(2em) epsilon.alt_r lt.eq g_0 / 2 . $
  Call the resulting profile $hat(psi)$. On the selected annular set the gradient multiplier is at least $1 + g_0 \/ 2$; everywhere else it is at least $1 - epsilon.alt_r$. Therefore
  $ cal(M) \( hat(psi) \) & gt.eq (1 - epsilon.alt_r + frac(theta g_0, 2)) cal(M) \( psi \)\
 & gt.eq (1 + frac(3 t_(*), 8)) cal(M) \( psi \)\
 & gt.eq (1 - t_(*) / 16) (1 + frac(3 t_(*), 8)) cal(M) \( phi.alt \)\
 & gt.eq \( 1 + eta \) cal(M) \( phi.alt \) . $
  The last inequality uses $0 < t_(*) lt.eq 1$. This establishes a gain independent of the incoming profile and of the full-region patch sizes. The latter are fixed only after preparation; their finite bounds determine how large the radial frequency must be.
  Since $cal(M) \( phi.alt \) > 0$, finitely many cycles raise it above $T$. Divide $epsilon$ among those cycles. Each cycle has compact support in $Omega$ and preserves strictness and nonvanishing on $overline(Omega)$. Their finite union of supports is compactly contained in $Omega$, and their total $C^0$ change is less than $epsilon$. All functions produced are smooth. This completes the proof of Proposition 4. ◻
]

===== 2.5 Profiles on the round sphere <profiles-on-the-round-sphere>

We record the global profiles used below, including the behavior at their critical points. On the unit sphere $bb(S)^3 subset bb(R)^4$, let $g_(*)$ be the round metric and set

$ r = \( x_1^2 + x_2^2 \)^(1 \/ 2) . $

Fix a coordinate cube $Omega$ whose closure lies in $1 \/ 20 < r < 1 \/ 8$, and fix its coordinate Lebesgue measure $thin upright(d) x$.

#thm([Proposition 8.])[
  (Spherical profiles).  #emph[There is a $C^2$ neighborhood $cal(U)$ of $g_(*)$ such that the following holds. For every smooth $g in cal(U)$, every $1 \/ 5 lt.eq t lt.eq 3 \/ 10$, and every $T \, epsilon > 0$, there is a smooth real function $phi.alt$ on $bb(S)^3$ with 
$ phi.alt_0 = log t + r^2 - t^2 \, #h(2em) "supp" \( phi.alt - phi.alt_0 \) subset.double Omega \, #h(2em) parallel phi.alt - phi.alt_0 parallel_(C^0) < epsilon \, $

 such that]
  + #emph[$phi.alt$ is strict on $r lt.eq 3 \/ 10$;]
  + #emph[its critical points in this region are exactly $r = 0$, and at each such point $H_phi.alt$ is positive on a two-plane;]
  + #emph[$phi.alt > log r$ for $0 < r < t$, while $phi.alt < log r$ for $t < r lt.eq 1$;]
  + #emph[$integral_Omega \| a_phi.alt \| thin thin upright(d) V_g > T$.]
  #emph[The metric-coordinate comparison constants on $Omega$, including the Lipschitz constants of its two-coordinate projections for the ambient Riemannian distance, can be chosen uniformly for $g in cal(U)$. In particular, 
#[#set math.equation(numbering: n => "(10)")
 $ integral_Omega L_phi.alt thin thin upright(d) x gt.eq c integral_Omega \| a_phi.alt \| thin thin upright(d) V_g $ <eq:profile-coordinate-mass>]

 with one constant $c > 0$ for this neighborhood. Each constructed profile is fixed before a wave frequency is chosen.]
] <prop:spherical-profiles>

#proof[
  The function $phi.alt_0$ is smooth on the sphere. Its round Hessian is
  #[#set math.equation(numbering: n => "(11)")
   $ "Hess"_(g_(*)) phi.alt_0 = 2 \( thin upright(d) x_1^2 + thin upright(d) x_2^2 \) - 2 r^2 g_(*) . $ <eq:round-profile-hessian>]
  The eigenvalues of $thin upright(d) x_1^2 + thin upright(d) x_2^2$ on the tangent three-plane are $1$, $1 - r^2$, and $0$: its two nonzero eigenvalues are those of the Gram matrix $"Id"_2 - \( x_1 \, x_2 \)^T \( x_1 \, x_2 \)$. The Hessian eigenvalues in (11) are consequently
  $ 2 - 2 r^2 \, #h(2em) 2 - 4 r^2 \, #h(2em) - 2 r^2 . $
  On $r lt.eq 3 \/ 10$, the first two exceed $1$, and the third exceeds $- 1 \/ 2$. These inequalities persist uniformly in a sufficiently small $C^2$ neighborhood $cal(U)$ of the round metric. The derivatives of $phi.alt_0$ do not depend on $t$, so the same neighborhood works for all the stated $t$.
  For such a metric, intersect a positive two-plane of $H_(phi.alt_0)$ with $a_(phi.alt_0)^perp$ and choose a unit vector $v$ in the intersection. Then
  $ cal(T) \( H_(phi.alt_0) \, a_(phi.alt_0) \; v \) gt.eq - 1 / 2 \| a_(phi.alt_0) \|^2 + 1 + \| a_(phi.alt_0) \|^2 > 0 . $
  Thus $phi.alt_0$ is strict throughout $r lt.eq 3 \/ 10$. Also
  $ \| "grad"_(g_(*)) \( r^2 \) \|^2 = 4 r^2 \( 1 - r^2 \) . $
  Vanishing of a differential is independent of the metric, so $phi.alt_0$ has nonvanishing gradient for $0 < r < 1$, in particular on a neighborhood of $overline(Omega)$.
  For the envelope comparison, put
  $ j_t \( r \) = log t + r^2 - t^2 - log r . $
  One has $j_t \( t \) = 0$ and $j'_t \( r \) = 2 r - r^(- 1)$. Hence $j_t \( r \) > 0$ for $0 < r < t$. On $t < r lt.eq 1$, the only possible interior critical point is a minimum, while $j_t \( 1 \) = log t + 1 - t^2 < 0$ for the stated range of $t$; thus $j_t < 0$ there. Compactness gives a positive lower bound for $j_t$ on $overline(Omega)$, uniform over $t in \[ 1 \/ 5 \, 3 \/ 10 \]$.
  Apply Proposition 4 to $phi.alt_0$ on $Omega$, using a $C^0$ tolerance smaller than both $epsilon$ and half this positive lower bound. Extend the perturbation by zero on the sphere. It yields the desired integral, preserves the envelope inequalities, and preserves strictness and nonvanishing in $Omega$. Outside $Omega$ the profile is unchanged, so it is strict throughout $r lt.eq 3 \/ 10$ and has no critical points there except $r = 0$.
  At $r = 0$, the perturbation vanishes on a neighborhood and $thin upright(d) phi.alt_0 = 0$. The connection term in the Hessian therefore vanishes, and for every incoming metric
  $ H_phi.alt = 2 \( thin upright(d) x_1^2 + thin upright(d) x_2^2 \) #h(2em) upright("at ") r = 0 . $
  This form is positive semidefinite of rank two. It is positive on a two-plane, and every two-plane contains a direction on which it is strictly positive. This last observation will allow transverse phase directions to be chosen even at critical points.
  Finally, shrink $cal(U)$ if necessary so that the metric and coordinate norms, and the coordinate volume densities on $overline(Omega)$, are uniformly comparable. Since $L_phi.alt gt.eq \| a_phi.alt \|$, the uniform upper bound for $thin upright(d) V_g \/ thin upright(d) x$ proves (10). Each coordinate function on $overline(Omega)$ extends smoothly to the sphere using a cutoff in its chart. The extensions have uniformly bounded gradients for $g in cal(U)$, so their two-coordinate projections have uniform Lipschitz constants for the ambient Riemannian distance. ◻
]

==== 3 Finite complex waves and robust nodal-area witnesses <sec:waves>

This section converts a fixed strict profile into a real approximate eigenfunction. Its weighted residual can be made smaller than any prescribed inverse power of the frequency, while its value and gradient cannot vanish together. The same function has a nodal-area witness whose constant is independent of the size and derivatives of the profile. Proposition 14 collects these three conclusions for one realization.

===== 3.1 Setting and the critical-point hypothesis <setting-and-the-critical-point-hypothesis>

Fix the coordinate cube $Omega$ and the smooth coordinate extensions used in Proposition 8. Choose a sufficiently small metric neighborhood $cal(G)$ of the round metric inside $cal(U)$. The coordinate and Riemannian norms on $overline(Omega)$ are uniformly equivalent for $g in cal(G)$, and the two-coordinate projections have the uniform Lipschitz bounds for the ambient Riemannian distance established there. We fix this neighborhood and these coordinates for the rest of the argument.

In this section the incoming metric $g in cal(G)$ is smooth and equals $g_(*)$ for $r gt.eq R_0$. Fix radii

$ 1 / 5 lt.eq R_0 < t < t_1 < t_2 < 3 / 10 . $

The fixed smooth profile $phi.alt$ equals

$ phi.alt_0 = log t + r^2 - t^2 $

off a compact subset of $Omega$, has no critical point in $overline(Omega)$, and satisfies

#[#set math.equation(numbering: n => "(12)")
 $ phi.alt > log r quad \( 0 < r lt.eq R_0 \) . $ <eq:wave-envelope-margin>]

Put $a = "grad"_g phi.alt$ and $L = \( 1 + \| a \|_g^2 \)^(1 \/ 2)$. On $K_1 = { r lt.eq t_1 }$ we impose the following pointwise hypotheses:

+ At a noncritical point there is a vector $b$ such that
  #[#set math.equation(numbering: n => "(13)")
   $ b perp a \, #h(2em) \| b \|_g = L \, #h(2em) "Hess"_g phi.alt \( a \, a \) + "Hess"_g phi.alt \( b \, b \) > 0 . $ <eq:wave-strict-hypothesis>]
+ At a critical point, $"Hess"_g phi.alt$ is positive definite on some two-dimensional subspace of the tangent space.

The second hypothesis is stronger than the existential inequality at $a = 0$. It is available for the profiles used here: all their critical points in $K_1$ lie on $r = 0$, where the perturbations vanish and

$ "Hess"_g phi.alt = 2 \( d x_1^2 + d x_2^2 \) . $

Here $d phi.alt = 0$, so this Hessian identity is independent of the connection. The form is positive semidefinite of rank two. At every other point outside the perturbations with $r < 1$, $d \( r^2 \) eq.not 0$. Thus the conclusions of Proposition 8 supply exactly the hypotheses above.

All profile data, the incoming metric, and the radii are fixed before the integer $n$ is chosen. Constants in phase estimates may depend on these fixed data and on finitely many requested derivative orders. The constants in the final sign and area estimates will depend only on the fixed coordinate and metric bounds.

===== 3.2 Complex Hessians below the profile <complex-hessians-below-the-profile>

Complex tangent vectors and symmetric forms are paired bilinearly in the phase equations. Transpose therefore means ordinary transpose, without complex conjugation.

#thm([Lemma 9.])[
  (Admissible phase Hessians).  #emph[Let $H$ be a real symmetric form on a three-dimensional Euclidean space, and let $z = a + i b$, where $a \, b$ are real, $a perp b$, and $\| b \|^2 = 1 + \| a \|^2$. If $a eq.not 0$ and $H \( a \, a \) + H \( b \, b \) > 0$, there is a complex symmetric form $Q$ such that 
#[#set math.equation(numbering: n => "(14)")
 $ Q z = 0 \, #h(2em) Re Q < H . $ <eq:phase-hessian-conditions>]

 If $a = 0$, the same conclusion follows from $H \( b \, b \) > 0$. Moreover, a choice satisfying (14) continues with locally bounded coefficients and a positive real-part gap under small changes of $H \, z$ with $z dot.op z = - 1$.]
] <lem:phase-hessian>

#proof[
  Write $Q = U + i D$ with $U \, D$ real symmetric. The equation $Q z = 0$ is equivalent to
  $ D b = U a \, #h(2em) D a = - U b . $
  For $a eq.not 0$, these prescribed columns of a symmetric $D$ are compatible exactly when $U \( a \, a \) + U \( b \, b \) = 0$. To see sufficiency explicitly, write $a = A e_1$, $b = B e_2$ in an orthonormal frame. Prescribe
  $ D e_1 = - B / A U e_2 \, #h(2em) D e_2 = A / B U e_1 . $
  Their overlapping off-diagonal entries agree precisely when $A^2 U_11 + B^2 U_22 = 0$; symmetry prescribes the remaining entries in the first two rows, and $D_33$ is free. Taking
  $ alpha = frac(H \( a \, a \) + H \( b \, b \), \| a \|^2 + \| b \|^2) > 0 \, #h(2em) U = H - alpha "Id" $
  therefore proves the assertion.
  If $a = 0$, then $\| b \| = 1$. Set $U = 0$ on $bb(R) b$ and $U = - M "Id"$ on $b^perp$, with no mixed entries, and take $D = 0$. In a frame starting with $b$, the first diagonal entry of $H - U$ is $H \( b \, b \) > 0$. Increasing $M$ makes its transverse Schur complement positive definite. Hence $H - U > 0$ and $Q b = 0$.
  For the continuation assertion, start with $Q z = 0$ and $z dot.op z = - 1$. For nearby $z'$ with $z' dot.op z' = - 1$, define
  $ P \( z' \) = "Id" + z' \( z' \)^T \, #h(2em) Q' = P \( z' \)^T Q P \( z' \) . $
  Then $P \( z' \) z' = 0$, so $Q'$ is symmetric and annihilates $z'$. At $z' = z$ one has $Q P \( z \) = P \( z \) Q = Q$, and hence $Q' = Q$. Although $P \( z' \)$ is singular, these identities suffice: continuity preserves the strict inequality $H' - Re Q' > 0$ for nearby $H' \, z'$. No division by $\| a \|$ is involved in this continuation. ◻
]

For each $p in K_1$, choose a unit vector $nu$ with $a \( p \) = \| a \( p \) \| nu$; at a critical point any unit $nu$ is allowed. There are two linearly independent vectors $b_0 \, b_1 in nu^perp$, both of length $L \( p \)$, for which the strict inequality in (13) holds. At a noncritical point, the good directions form a nonempty open subset of the transverse circle. At a critical point, every two-plane intersects the positive two-plane of the Hessian in a nonzero positive direction. Again the good set in the circle of $nu^perp$ is nonempty and open.

These choices have uniform bounds for the fixed profile, including near its critical points. Indeed, consider the compact set

$ cal(K) = { \( p \, nu \) : p in K_1 \, med \| nu \|_g = 1 \, med a \( p \) = \| a \( p \) \|_g nu } . $

Use finitely many smooth local orthonormal frames. Near each datum in $cal(K)$, project and normalize the two chosen directions in the nearby planes $nu^perp$. Independence and strictness persist on a sufficiently small neighborhood. Lemma 9 continues the two Hessians there. It also handles a third vector with slightly shifted real part. A finite covering of $cal(K)$ consequently gives numbers $delta_0 \, kappa \, eta > 0$ and bounded choices for the following three data, for every $0 lt.eq delta lt.eq delta_0$:

#[#set math.equation(numbering: n => "(15)")
 $ z_0 & = a + i b_0 \, #h(2em) z_1 = a + i b_1 \,\
z_2 & = a + delta nu + i b'_0 \, #h(2em) b'_0 = frac(\( 1 + \| a + delta nu \|_g^2 \)^(1 \/ 2), L \( p \)) b_0 . $ <eq:three-phase-data>]

The independent imaginary directions $b_0 \, b_1$ will control derivatives in $nu^perp$ in a real superposition. The shift $delta nu$ will separate its value from its derivative in the $nu$ direction. Lemma 12 proves the resulting real-jet estimate. The associated Hessians satisfy

#[#set math.equation(numbering: n => "(16)")
 $ Q_ell z_ell = 0 \, #h(2em) Re Q_ell lt.eq "Hess"_g phi.alt \( p \) - 4 kappa g \( p \) \, #h(2em) ell = 0 \, 1 \, 2 \, $ <eq:uniform-phase-gap>]

and the sine of the angle between $b_0 \, b_1$ is at least $eta$. All three vectors have bilinear square $- 1$. No globally continuous selection of the choices on $cal(K)$ is required. The finite-cover construction bounds each selected choice and its continuation uniformly; these bounds, $kappa$, and $eta$ may depend on the fixed profile.

===== 3.3 A finite Taylor construction <a-finite-taylor-construction>

We use a finite Taylor form of the complex-phase WKB construction; compare [4] Section 3. The explicit truncation keeps track of the weighted residual and derivative orders required later.

We first record the elementary algebra behind the formal equations. Let $D_z = z dot.op partial$ for a nonzero $z in bb(C)^3$, and let $cal(P)_d$ denote the complex homogeneous polynomials of degree $d$. Then

#[#set math.equation(numbering: n => "(17)")
 $ D_z : cal(P)_(d + 1) arrow.r cal(P)_d quad upright("is onto") . $ <eq:polynomial-surjectivity>]

For an explicit right inverse, put

$ ell_z \( x \) = frac(overline(z) dot.op x, sum_i \| z_i \|^2) \, #h(2em) pi_z x = x - ell_z \( x \) z \, #h(2em) \( cal(I)_z f \) \( x \) = ell_z \( x \) integral_0^1 f #scale(x: 120%, y: 120%)[\(] pi_z x + s ell_z \( x \) z #scale(x: 120%, y: 120%)[\)] thin d s . $

The integral is an integral of polynomial coefficients; its arguments are evaluated in the polynomial’s complex extension. Since $D_z ell_z = 1$ and $D_z \( pi_z x \) = 0$, differentiating the polynomial antiderivative gives $D_z cal(I)_z f = f$. The output is homogeneous of degree $d + 1$. For each fixed degree, its coefficients are bounded on every compact set of nonzero $z$. This proves both surjectivity and the local uniformity needed below.

#thm([Lemma 10.])[
  (Localized finite-order waves).  #emph[For every pair of nonnegative integers $m \, D$, there are common normal coordinate balls about the points of $K_1$ and three waves at every center $p in K_1$, for all sufficiently large integers $n$, with the following properties. Each wave is a smooth complex function on the sphere supported in $r < t_2$ and has the form 
#[#set math.equation(numbering: n => "(18)")
 $ Z = zeta e^(n S) V \, #h(2em) V = sum_(j = 0)^J n^(- j) V_j \, $ <eq:finite-wave-form>]

 in its center’s normal coordinates. Here $S \, V_j$ are complex polynomials and $zeta$ is a smooth cutoff equal to one on a common smaller ball. With $delta = n^(- 1 \/ 2)$, the three phases have initial data 
$ S \( p \) = phi.alt \( p \) \, #h(2em) "grad" S \( p \) = z_ell \, #h(2em) "Hess" S \( p \) = Q_ell \, $

 as in (15)–(16). Their amplitudes satisfy $V_0 \( p \) = 1$ and $V_j \( p \) = 0$ for $j > 0$. On their supports, 
#[#set math.equation(numbering: n => "(19)")
 $ Re S \( x \) - phi.alt \( x \) lt.eq n^(- 1 \/ 2) "dist"_g \( p \, x \) - c "dist"_g \( p \, x \)^2 \, $ <eq:wave-localization>]

 with a common $c > 0$. Setting $Lambda_n = n \( n + 2 \)$, one has 
#[#set math.equation(numbering: n => "(20)")
 $ \| nabla^j \( Delta_g + Lambda_n \) Z \( x \) #scale(x: 120%, y: 120%)[\|]_g lt.eq C n^(- D) e^(n phi.alt \( x \)) \, #h(2em) 0 lt.eq j lt.eq m . $ <eq:wave-individual-residual>]

 For any further fixed finite collection of derivative orders, the construction can also be required to satisfy 
#[#set math.equation(numbering: n => "(21)")
 $ \| nabla^j Z \( x \) \|_g lt.eq C_j n^j e^(n phi.alt \( x \)) $ <eq:wave-individual-derivatives>]

 at those orders. All the constants, polynomial degrees, and ball radii are fixed before $n$; they may depend on $g \, phi.alt \, m \, D$ and the further derivative orders.]
] <lem:finite-waves>

#proof[
  Use normal coordinates based on the local orthonormal frames above. The fixed smooth metric has uniform coordinate derivative bounds of every specified finite order on a common ball. Put $z = z_ell$ and $Q = Q_ell$. The quadratic initial Taylor polynomial is
  $ S_(lt.eq 2) \( x \) = phi.alt \( p \) + z dot.op x + 1 / 2 x^T Q x . $
  The eikonal error $E = 1 + g^(i j) S_i S_j$ has zero constant term because $z dot.op z = - 1$, and zero linear term because the metric’s first derivatives vanish at the normal-coordinate origin and $Q z = 0$.
  Choose integers
  $ J = D + m + 1 \, #h(2em) K = 2 D + 3 m + 6 \, #h(2em) N_j = K + J - j \, #h(2em) L_S = K + J + 1 . $
  Construct $S$ through degree $L_S$ by cancelling the eikonal coefficients through degree $L_S - 1$. At degree $d gt.eq 2$, the new homogeneous term $S_(d + 1)$ enters only as $2 D_z S_(d + 1)$; all other terms are already known. Equation (17) therefore solves each successive equation, preserving the given quadratic data. The resulting actual smooth eikonal error satisfies
  $ E = O \( \| x \|^(L_S) \) . $
  Here and below these are Taylor-vanishing statements for the actual smooth metric coefficients, not only identities between formal symbols.
  Define
  $ T = 2 "grad" S dot.op nabla + Delta_g S + 2 \, $
  where the last two terms act by multiplication. Construct $V_j$ through degree $N_j$, with the prescribed constant terms, successively for $j = 0 \, dots.h \, J$. Cancel, through degree $N_j - 1$, the coefficients of
  $ R_0 = T V_0 \, #h(2em) R_j = T V_j + Delta_g V_(j - 1) quad \( j gt.eq 1 \) . $
  At degree $d$ the new term of $V_j$ again enters as $2 D_z V_(j \, d + 1)$, so the same right inverse applies. This finite schedule supplies all forcing terms: the largest phase degree needed is $N_0 + 1 = L_S$, and for $j gt.eq 1$ the coefficient of $Delta_g V_(j - 1)$ of degree $d lt.eq N_j - 1$ needs $V_(j - 1)$ only through degree $d + 2 lt.eq N_j + 1 = N_(j - 1)$. Consequently
  $ R_j = O \( \| x \|^(N_j) \) = O \( \| x \|^K \) . $
  Every operation uses finitely many metric coefficients and bounded right inverses on the compact family of phase data. Thus all the constructed coefficients have uniform bounds for these fixed orders, including as $delta = n^(- 1 \/ 2)$ tends to zero.
  The Taylor expansion of $Re S - phi.alt$ has linear part either zero or $delta nu dot.op x$. Equation (16) and a common bound on third derivatives give, after decreasing the common ball,
  $ Re S \( x \) - phi.alt \( x \) lt.eq delta \| x \| - kappa \| x \|^2 . $
  Normal-coordinate radius equals $"dist"_g \( p \, x \)$ on this ball, proving (19). Choose a radial cutoff supported in this ball, equal to one on a common smaller ball, and make the support small enough to lie in $r < t_2$ for every center.
  Before applying the cutoff, direct differentiation gives
  #[#set math.equation(numbering: n => "(22)")
   $ \( Delta_g + Lambda_n \) \( e^(n S) V \) = e^(n S) (n^2 E V + sum_(j = 0)^J n^(1 - j) R_j + n^(- J) Delta_g V_J) . $ <eq:finite-wave-residual-expansion>]
  For any fixed $q gt.eq 0$,
  #[#set math.equation(numbering: n => "(23)")
   $ sup_(r gt.eq 0) r^q e^(sqrt(n) r - c n r^2) lt.eq C_(q \, c) n^(- q \/ 2) \; $ <eq:gaussian-envelope-moment>]
  this follows by substituting $s = sqrt(n) r$. Taylor’s Theorem bounds the derivatives of a remainder vanishing to order $K$ by $C \| x \|^(K - j)$ through order $j lt.eq m$. Differentiating the exponential at most $m$ times costs at most $C n^m$. Thus the terms in (22) involving Taylor remainders, after at most $m$ derivatives and then division by $e^(n phi.alt)$, are bounded by
  $ C n^(2 + m - \( K - m \) \/ 2) = C n^(- D - 1) . $
  The last amplitude term is bounded by $C n^(m - J) = C n^(- D - 1)$. On the support of a derivative of the cutoff, the distance from the center has a fixed positive lower bound. For large $n$, Equation (19) then gives a fixed negative gap between $Re S$ and $phi.alt$, so all cutoff errors are exponentially small relative to $e^(n phi.alt)$. This proves (20). Direct differentiation and (23) with $q = 0$ prove (21). Additional fixed derivative orders only require additional finite coefficient bounds. ◻
]

The local waves are now available with any prescribed finite accuracy. We next combine them into one real function. The combination must have both a nonvanishing value–gradient pair and many strict sign changes. We first define the sign functional that will measure the latter property; its geometric and continuity properties do not depend on the wave construction.

===== 3.4 A sign functional bounded by nodal area <a-sign-functional-bounded-by-nodal-area>

Subdivide $Omega$, up to its faces, into a finite collection $cal(P)$ of open Euclidean cubes $P$ so fine that numbers $ell_P$ can be chosen with

#[#set math.equation(numbering: n => "(24)")
 $ ell_P \/ 2 lt.eq L \( x \) lt.eq ell_P #h(2em) \( x in P \) . $ <eq:sign-partition-scale>]

For example, use maxima of $L$ on the closed cubes of a sufficiently fine regular subdivision; positivity and uniform continuity of $L$ ensure (24). Fix a sufficiently small $epsilon.alt > 0$ using only the common coordinate and metric bounds, as specified below, and set $d_P = epsilon.alt \/ \( n ell_P \)$. For a continuous real function $f$ on the sphere define

#[#set math.equation(numbering: n => "(25)")
 $ cal(F)_n \( f \) = sum_(P in cal(P)) sum_(i = 1)^3 d_P^(- 1) integral_({ x in P : x + d_P e_i in P }) upright(bold(1))_({ f \( x \) f \( x + d_P e_i \) < 0 }) thin d x . $ <eq:sign-functional>]

All shifts and integrals in this formula use the fixed coordinates on $Omega$. The profile, subdivision, and $n$ are held fixed when the functional is applied to other functions or metrics.

#thm([Proposition 11.])[
  (Persistence and area comparison for sign tests).  #emph[ The functional $cal(F)_n$ is lower semicontinuous for uniform convergence of real functions. It is unchanged by multiplication by a nonzero real constant or by an everywhere positive continuous function. There is a constant $C_(upright("area"))$, depending only on the fixed coordinates and metric neighborhood, such that for every continuous real $f$ and every $h in cal(G)$, 
#[#set math.equation(numbering: n => "(26)")
 $ cal(F)_n \( f \) lt.eq C_(upright("area")) cal(H)_h^2 \( { f = 0 } \) . $ <eq:sign-area-bound>]

 In particular $C_(upright("area"))$ is independent of $phi.alt \, cal(P)$, and $n$. There is also a constant $C_(upright("sign"))$ with the same independence such that 
#[#set math.equation(numbering: n => "(27)")
 $ 0 lt.eq cal(F)_n \( f \) lt.eq C_(upright("sign")) n integral_Omega L \( x \) thin d x . $ <eq:sign-deterministic-upper>]

]
] <prop:sign-functional>

#proof[
  If $f_j arrow.r f$ uniformly, every strict opposite-sign test for $f$ eventually remains a strict opposite-sign test for $f_j$. Fatou’s Lemma, applied to each integral in the finite sum, proves lower semicontinuity. The two invariances follow directly from the sign of the product at its endpoints.
  For the area estimate fix a cube $P$, a direction $i$, and write its coordinate in that direction as $t$. Slice at levels $t = s + k d_P$, where $0 lt.eq s < d_P$ and $k in bb(Z)$. For two consecutive levels inside $P$, each transverse point with opposite endpoint signs has an interior zero in the intervening open slab. Hence the set of such transverse points is contained in the coordinate projection of the zeros in that slab. By the uniform Lipschitz projection bound, its two-dimensional Lebesgue measure is at most a common constant times the $h$-Hausdorff measure of those zeros. These sets are measurable: the zeros in an open slab are a countable union of compact sets, and so are their continuous projections. For fixed $s$ the slabs are disjoint. Summing over $k$, integrating over $0 lt.eq s < d_P$, and dividing by $d_P$ gives
  $ d_P^(- 1) integral_({ x in P : x + d_P e_i in P }) upright(bold(1))_({ f \( x \) f \( x + d_P e_i \) < 0 }) thin d x lt.eq C cal(H)_h^2 \( { f = 0 } ∩ P \) . $
  This remains valid if the measure on the right is infinite. The open cubes are disjoint, so summing over them and over three directions proves (26). No regularity of the zero set has been used.
  Finally, bounding each indicator by one gives
  $ cal(F)_n \( f \) lt.eq frac(3 n, epsilon.alt) sum_P ell_P \| P \| lt.eq frac(6 n, epsilon.alt) integral_Omega L \( x \) thin d x \, $
  by (24). ◻
]

===== 3.5 A random superposition with a nonvanishing real jet <a-random-superposition-with-a-nonvanishing-real-jet>

Choose a set of centers in $K_1$ of cardinality $O \( n^3 \)$ so that every point of $K_1$ is within distance $1 \/ n$ of a center. Such a set is obtained by taking a maximal $1 \/ n$-separated subset and using the uniform lower volume bound for sufficiently small metric balls. At each center take the three waves of Lemma 10. Assign independent complex coefficients $gamma_Z$ whose real and imaginary parts are independent standard real Gaussians, and put

#[#set math.equation(numbering: n => "(28)")
 $ U_n = w_n + sum_Z Re \( gamma_Z Z \) \, #h(2em) w_n = Re \( x_1 + i x_2 \)^n \, #h(2em) W_n = e^(n phi.alt) + r^n . $ <eq:wave-weight>]

The weight $W_n$ is positive and is $C^1$ for $n gt.eq 2$; we do not require it to be smooth at $r = 0$ for odd $n$.

The function $w_n$ is the restriction of a homogeneous harmonic polynomial of degree $n$ on $bb(R)^4$. The Euclidean Laplacian in polar coordinates therefore gives $\( Delta_(g_(*)) + Lambda_n \) w_n = 0$. For each fixed $j$, its derivatives are bounded by $C_j n^j r^(n - j)$ for large $n$, up to harmless lower-degree derivative terms with the same bound on the sphere. Away from $r = 0$, the loss of a fixed power of $r$ is bounded. Near $r = 0$, choose a fixed small neighborhood on which $r e^(- phi.alt) < 1$ uniformly; then

$ r^(n - j) e^(- n phi.alt) = \( r e^(- phi.alt) \)^(n - j) e^(- j phi.alt) $

is bounded and is exponentially small there for fixed $j$. These observations prove

#[#set math.equation(numbering: n => "(29)")
 $ \| nabla^j w_n \|_g lt.eq C_j n^j W_n \, #h(2em) \| nabla W_n \|_g lt.eq C n W_n . $ <eq:background-weight-bounds>]

Furthermore, $\( Delta_g + Lambda_n \) w_n$ is supported in $r lt.eq R_0$. Equation (12) gives $max_(r lt.eq R_0) r e^(- phi.alt) < 1$, so the same argument bounds any fixed number of its derivatives by any prescribed inverse power of $n$ times $e^(n phi.alt)$, for all sufficiently large $n$.

#thm([Lemma 12.])[
  (Uniform exponent in real-jet noncancellation).  #emph[Fix any nonnegative integers $m_(*) \, D_(*)$. Construct the waves with those residual requirements and with all derivative bounds needed through order $max \( m_(*) \, 2 \)$. There is a fixed exponent $B = 110$, independent of the profile and these orders, such that with probability tending to one as $n arrow.r oo$, 
#[#set math.equation(numbering: n => "(30)")
 $ \| U_n \| + n^(- 1) \| nabla U_n \|_g gt.eq n^(- B) W_n quad upright("everywhere on the sphere") \, $ <eq:wave-jet-lower>]

 and simultaneously 
#[#set math.equation(numbering: n => "(31)")
 $ \| nabla^j U_n \|_g & lt.eq C_j n^(j + 4) W_n \,\
\| nabla^j \( Delta_g + Lambda_n \) U_n \|_g & lt.eq C n^(4 - D_(*)) W_n \, #h(2em) 0 lt.eq j lt.eq m_(*) . $ <eq:wave-global-estimates>]

 The constants and the rate of convergence of the probability may depend on the fixed metric, profile, and orders, but not on $n$.]
] <lem:wave-noncancellation>

#proof[
  Let $G_n^(upright("coef"))$ be the event that every coefficient has magnitude at most $n$. There are $O \( n^3 \)$ coefficients, so Gaussian tails imply $Pr \( \( G_n^(upright("coef")) \)^c \) arrow.r 0$. On this event, summing the individual wave estimates costs at most a factor $C n^4$. Together with (29) and the background residual estimate, this proves (31). In finitely many smooth local orthonormal frames, the normalized real four-component jet
  $ cal(J)_n = frac(\( U_n \, n^(- 1) nabla U_n \), W_n) $
  has Lipschitz constant at most $C n^6$ on $G_n^(upright("coef"))$. Indeed, its derivative involves only $U_n \, nabla U_n \, nabla^2 U_n$, $W_n^(- 1) nabla W_n$, and bounded derivatives of the frames; the preceding estimates even give $C n^5$.
  First consider points where $r^n > n^6 e^(n phi.alt)$. The ambient rotation field $R = x_1 partial_(x_2) - x_2 partial_(x_1)$ is tangent to the sphere and has uniformly bounded $g$-length. Writing $x_1 + i x_2 = r e^(i theta)$,
  $ w_n = r^n cos \( n theta \) \, #h(2em) R w_n = - n r^n sin \( n theta \) . $
  Consequently $\| w_n \| + n^(- 1) \| nabla w_n \|_g gt.eq c r^n$. The wave jet on $G_n^(upright("coef"))$ is bounded by $C n^4 e^(n phi.alt)$, so domination proves (30) in this region for large $n$.
  The remaining closed set
  $ E_n = { r^n lt.eq n^6 e^(n phi.alt) } $
  lies in $K_1$ for large $n$. Indeed $phi.alt = phi.alt_0$ when $r gt.eq t_1$, and $phi.alt_0 - log r$ has a strictly negative maximum on that compact region. Fix $x in E_n$ and take a center $p$ at distance at most $1 \/ n$. The three associated cutoffs are one at $x$. Their fixed Taylor bounds and constant terms imply
  $ V \( x \) = 1 + O \( n^(- 1) \) \, #h(2em) frac(nabla Z \( x \), n Z \( x \)) = z_ell + O \( n^(- 1) \) \, #h(2em) frac(\| Z \( x \) \|, W_n \( x \)) gt.eq c n^(- 6) \, $
  in a common orthonormal frame, with the initial vectors at $p$ identified with that frame up to an $O \( n^(- 1) \)$ change. For the last estimate, Taylor’s Theorem gives $n \| Re S \( x \) - phi.alt \( x \) \| lt.eq C$ at distance $1 \/ n$, and $W_n \( x \) lt.eq \( 1 + n^6 \) e^(n phi.alt \( x \))$.
  After factoring a complex phase and a positive modulus from each column, the covariance supplied just by these three independent coefficients is described, up to $O \( n^(- 1) \)$ column errors, by the real and imaginary parts of
  $ \( 1 \, a + i b_0 \) \, #h(2em) \( 1 \, a + i b_1 \) \, #h(2em) \( 1 \, a + delta nu + i b'_0 \) \, #h(2em) delta = n^(- 1 \/ 2) . $
  The resulting real $4$ by $6$ matrix has least singular value at least $c delta$. To check this, test its transpose on $\( s \, v \) in bb(R) times bb(R)^3$. The two transverse imaginary columns control the component of $v$ in $nu^perp$, using the positive angle bound and $L gt.eq 1$. Subtracting the first and third real-column evaluations gives $delta chevron.l v \, nu chevron.r$. The first real column then controls $s$, since $a = \| a \| nu$ and $\| a \|$ is bounded for the fixed profile. Thus $\| \( s \, v \) \|$ is bounded by $C delta^(- 1)$ times the transpose evaluation norm. The $O \( n^(- 1) \)$ errors preserve this estimate for large $n$.
  Multiplication of a complex coefficient by a unit complex number preserves its Gaussian law. Moreover, each factored modulus is at least $c n^(- 6)$. Therefore every unit real linear functional of $cal(J)_n \( x \)$ has standard deviation at least $c n^(- 13 \/ 2)$. Adding the other independent waves cannot decrease covariance. The deterministic jet of $w_n$ changes only the mean. The Gaussian density in four real dimensions is consequently at most $C n^26$, and hence at most $C n^28$. In particular,
  $ Pr { \| cal(J)_n \( x \) \| lt.eq 2 n^(- B) } lt.eq C n^(28 - 4 B) \, #h(2em) x in E_n . $
  In each of the finitely many frame charts take a net of $E_n$ with points in $E_n$ and mesh at most $n^(- B - 10)$. Metric packing bounds its total cardinality by $C n^(3 \( B + 10 \))$. A union bound makes the probability of a small jet at any net point at most
  $ C n^(28 - 4 B + 3 \( B + 10 \)) = C n^(58 - B) . $
  For $B = 110$ this tends to zero. On $G_n^(upright("coef"))$ the Lipschitz error from a net point to a general point is $O \( n^(- B - 4) \)$, so the jet norm is at least $n^(- B)$ throughout $E_n$ on the resulting event. Its Euclidean norm is bounded above by $\( \| U_n \| + n^(- 1) \| nabla U_n \|_g \) \/ W_n$. This proves the desired lower bound everywhere. The polynomial powers used in this argument do not depend on the number of fixed Taylor or transport orders: increasing those orders changes only constants, radii, and thresholds. ◻
]

===== 3.6 Expected size of the sign witness <expected-size-of-the-sign-witness>

#thm([Lemma 13.])[
  (Profile-independent sign gain).  #emph[With a fixed sufficiently small $epsilon.alt > 0$ as above, there is a constant $c_(upright("sign")) > 0$, independent of the fixed profile and of the wave accuracy orders, such that for all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(32)")
 $ bb(E) cal(F)_n \( U_n \) gt.eq c_(upright("sign")) n integral_Omega L \( x \) thin d x . $ <eq:sign-expectation-lower>]

 The threshold for $n$ may depend on the entire fixed construction.]
] <lem:wave-sign-expectation>

#proof[
  Write the random part of $U_n$ as $X_n$ and let
  $ sigma_n \( x \)^2 = bb(E) X_n \( x \)^2 = sum_Z \| Z \( x \) \|^2 . $
  The wave at a center within distance $1 \/ n$ shows that
  #[#set math.equation(numbering: n => "(33)")
   $ sigma_n \( x \) gt.eq c e^(n phi.alt \( x \)) \, #h(2em) x in overline(Omega) \, $ <eq:sign-variance-lower>]
  with a fixed-stage constant $c > 0$. Since $min_(overline(Omega)) \( phi.alt - log r \) > 0$, the standardized mean $w_n \( x \) \/ sigma_n \( x \)$ tends uniformly to zero on $overline(Omega)$.
  Fix $P$ and $x in P$ such that all three points $y_i = x + d_P e_i$ lie in $P$. Use the same near-center set for every axis: retain the waves whose centers have distance at most $n^(- 1 \/ 4)$ from $x$. A center outside this set has distance at least $1 / 2 n^(- 1 \/ 4)$ from every $y_i$, because $"dist"_g \( x \, y_i \) lt.eq C d_P lt.eq C epsilon.alt \/ n$. Equation (19) therefore bounds all these far waves, at $x$ and all $y_i$, by the respective $e^(n phi.alt)$ factors times $C exp \( - c sqrt(n) \)$ for large $n$. After summing $O \( n^3 \)$ waves, their squared sums are still negligible relative to the lower variances in (33). Their covariance contributions are negligible by Cauchy–Schwarz as well.
  For every retained wave, the cutoff is one at both endpoints, and uniform Taylor estimates give
  $ V \( x \) = 1 + o \( 1 \) \, #h(2em) Re d S \( x \) = d phi.alt \( x \) + o \( 1 \) \, #h(2em) \| beta_Z \|_g = L \( x \) + o \( 1 \) \, quad beta_Z = Im d S \( x \) . $
  The same estimates hold in the small segments between the endpoints. Indeed their distances from the center are $O \( n^(- 1 \/ 4) \)$, the phase and amplitude derivatives have fixed bounds, and the shifted initial real gradient differs by only $n^(- 1 \/ 2) nu$. Every error here is uniform in centers, $P \, x$, and $i$ for the fixed profile and orders. Taylor expansion over a segment of length $d_P$ yields
  #[#set math.equation(numbering: n => "(34)")
   $ frac(Z \( y_i \), Z \( x \)) = alpha_i e^(i theta_(Z i)) \( 1 + o \( 1 \) \) \, #h(2em) alpha_i = e^(n d_P partial_i phi.alt \( x \)) \, quad theta_(Z i) = n d_P beta_Z \( e_i \) . $ <eq:sign-wave-ratio>]
  For example, the phase Taylor remainder after multiplication by $n$ is $O \( n d_P^2 \) = O \( n^(- 1) \)$. The real factor $alpha_i$ is common to all retained waves for the given axis. It and its reciprocal are bounded by a constant independent of the profile, since $n d_P \| partial_i phi.alt \( x \) \| lt.eq C epsilon.alt$.
  The covariance of $X_n \( x \)$ and $X_n \( y_i \)$ is
  $ sum_Z Re #scale(x: 120%, y: 120%)[\(] overline(Z \( x \)) Z \( y_i \) #scale(x: 120%, y: 120%)[\)] . $
  Discarding the negligible far terms and using (34) in both this numerator and the variance at $y_i$ proves that their correlation satisfies
  #[#set math.equation(numbering: n => "(35)")
   $ rho_i = sum_(Z upright(" near")) omega_Z cos theta_(Z i) + o \( 1 \) \, #h(2em) omega_Z = frac(\| Z \( x \) \|^2, sum_(Z' upright(" near")) \| Z' \( x \) \|^2) . $ <eq:sign-common-weights>]
  The same nonnegative weights, summing to one, apply to all three axes: the common positive factor $alpha_i$ cancels on standardizing.
  Choose constants $c_0 \, C_0 > 0$ for the fixed equivalence of coordinate and metric covector norms, so that
  $ c_0 \| beta \|_g^2 lt.eq sum_(i = 1)^3 beta \( e_i \)^2 lt.eq C_0 \| beta \|_g^2 $
  on $overline(Omega)$ for all the incoming metrics under consideration. Choose $epsilon.alt$ so small that $2 epsilon.alt sqrt(C_0) lt.eq 1$. By (24) and $L gt.eq 1$, for large $n$ every retained wave satisfies
  #[#set math.equation(numbering: n => "(36)")
   $ \| theta_(Z i) \| lt.eq 1 \, #h(2em) sum_(i = 1)^3 theta_(Z i)^2 gt.eq frac(c_0 epsilon.alt^2, 16) . $ <eq:sign-angular-gap>]
  For the lower estimate it suffices to use $\| beta_Z \|_g gt.eq L \/ 2$ and $ell_P lt.eq 2 L$. These deliberately loose constants emphasize their independence from the profile.
  Since $1 - cos s gt.eq s^2 \/ 4$ for $\| s \| lt.eq 1$, averaging Equation (36) with the common weights gives, for all sufficiently large $n$,
  $ sum_(i = 1)^3 \( 1 - rho_i \) gt.eq frac(c_0 epsilon.alt^2, 128) . $
  Also every $rho_i gt.eq cos \( 1 \) + o \( 1 \) > 0$. Consequently at least one axis has its correlation in a fixed compact subinterval of $\( - 1 \, 1 \)$, bounded away from $1$ by $c_0 epsilon.alt^2 \/ 384$. This reasoning still applies if a single carrier direction accounts for nearly all the variance.
  For completeness, the required opposite-sign probability bound can be read directly from bivariate Gaussian densities. If the correlation belongs to a fixed compact subinterval of $\( - 1 \, 1 \)$ and the two standardized means have absolute value at most $1 \/ 4$, that density has a positive common minimum on the rectangle $\[ 1 \, 2 \] times \[ - 2 \, - 1 \]$. Its integral gives a fixed positive probability of opposite signs. The standardized means here tend uniformly to zero, so there is $p_0 > 0$, depending only on the fixed angular gap, such that
  $ sum_(i = 1)^3 Pr { U_n \( x \) U_n \( x + d_P e_i \) < 0 } gt.eq p_0 $
  whenever all three shifts stay in $P$, for sufficiently large $n$. No measurable choice of a preferred axis is needed in this inequality.
  The subdivision is finite and fixed before $n$. Thus, for large $n$, the subset of each $P$ on which all three shifts remain in $P$ has volume at least $\| P \| \/ 2$. Integrating the last probability estimate and using Tonelli’s Theorem yields
  $ bb(E) cal(F)_n \( U_n \) gt.eq frac(p_0 n, 2 epsilon.alt) sum_P ell_P \| P \| gt.eq frac(p_0 n, 2 epsilon.alt) integral_Omega L \( x \) thin d x . $
  This proves Lemma 13 with a profile-independent constant. All limits used to reach its threshold were taken with the profile and finite accuracy orders fixed. ◻
]

#thm([Proposition 14.])[
  (Simultaneous wave realization).  #emph[ Under the hypotheses of this section, fix arbitrary nonnegative integers $m_(*) \, D_(*)$. For every sufficiently large integer $n$ there is a smooth real $U_n$ satisfying (30) and (31), with $B = 110$, and 
#[#set math.equation(numbering: n => "(37)")
 $ cal(F)_n \( U_n \) gt.eq c_(upright("wave")) n integral_Omega L \( x \) thin d x \, $ <eq:wave-sign-lower>]

 where $c_(upright("wave")) > 0$ depends only on the fixed coordinates and metric neighborhood. Moreover, 
#[#set math.equation(numbering: n => "(38)")
 $ U_n = w_n quad upright("and") quad g = g_(*) #h(2em) upright("on ") { r gt.eq t_2 } . $ <eq:wave-clean-exterior>]

 The thresholds and constants in the differential estimates may depend on the fixed profile and accuracy orders; $B$ and $c_(upright("wave"))$ do not. The sign functional is finite, fixed, and has all the persistence and area-comparison properties of Proposition 11.]
] <prop:wave-superposition>

#proof[
  Let $G_n$ be the simultaneous event of Lemma 12, and put $A_n = n integral_Omega L \( x \) thin d x$. By Proposition 11 and Lemma 13,
  $ 0 lt.eq cal(F)_n \( U_n \) lt.eq C_(upright("sign")) A_n \, #h(2em) bb(E) cal(F)_n \( U_n \) gt.eq c_(upright("sign")) A_n \, #h(2em) Pr \( G_n^c \) arrow.r 0 . $
  It follows without an independence assumption that
  $ bb(E) #scale(x: 120%, y: 120%)[\[] cal(F)_n \( U_n \) upright(bold(1))_(G_n) #scale(x: 120%, y: 120%)[\]] gt.eq #scale(x: 120%, y: 120%)[\(] c_(upright("sign")) - C_(upright("sign")) Pr \( G_n^c \) #scale(x: 120%, y: 120%)[\)] A_n gt.eq 1 / 2 c_(upright("sign")) A_n $
  for all sufficiently large $n$. Some realization in $G_n$ therefore has $cal(F)_n \( U_n \) gt.eq \( c_(upright("sign")) \/ 4 \) A_n$. Select such a realization and set $c_(upright("wave")) = c_(upright("sign")) \/ 4$. All waves are supported in $r < t_2$, and $g$ is round for $r gt.eq R_0$. Since $R_0 < t_2$, Equation (38) follows. ◻
]

#prodef([Remark 15.])[
  (Order of choices).  The profile is constructed first and is used here only after it has been fixed. Next one specifies the finite residual and derivative orders required downstream. The phase and amplitude degrees and their common support radii are then fixed on the compact family with $0 lt.eq delta lt.eq delta_0$. Finally $n$ is chosen so that $delta = n^(- 1 \/ 2)$ and all preceding thresholds hold. Neither a small Hessian gap nor a poorly conditioned pair of transverse directions changes the exponent $B$; it only enlarges these thresholds. The sign constant comes from (36), which uses $L \/ ell_P$ and the fixed norm equivalence, not those profile-dependent phase constants. This distinction is what permits the gradient integral to be made arbitrarily large before choosing the frequency.
] <rem:wave-parameter-order>

==== 4 Exactification in dimension three <sec:exactification>

This section converts the approximate eigenfunctions of Proposition 14 into exact eigenfunctions of nearby ordinary Riemannian metrics. The conversion preserves all pointwise signs and leaves a prescribed outer region unchanged. We first correct the equation using a scalar conductivity and a scalar density. A positive change of the dependent variable then enforces the relation between these two quantities that a three-dimensional metric requires. A correction in a clean annulus permits this change of dependent variable to be cut off.

Throughout this section, $g$ is fixed while the integer $n$ tends to infinity, and $Lambda = Lambda_n = n \( n + 2 \)$. Norms are taken with respect to fixed smooth reference norms; replacing them by the norms of $g$ changes only constants. Covariant derivatives and pointwise contractions in the formulas below use $g$, unless another metric is displayed. All constants may depend on this fixed metric and on the finite derivative orders under consideration, but not on $n$.

===== 4.1 A scalar correction with weighted estimates <a-scalar-correction-with-weighted-estimates>

#thm([Lemma 16.])[
  (Scalar correction).  #emph[Let $\( M \, g \)$ be a fixed closed smooth Riemannian manifold. Fix an integer $B gt.eq 1$, and let $h gt.eq 0$ and $D_(*) > 0$ be integers. Suppose that, for all sufficiently large integers $n$, a real smooth function $U = U_n$ and a positive continuous function $W = W_n$ satisfy 
#[#set math.equation(numbering: n => "(39)")
 $ \| U \| + n^(- 1) \| nabla U \| & gt.eq n^(- B) W \,\
\| nabla^j U \| & lt.eq C_j n^(j + 4) W \, & \| nabla^j cal(R) \| & lt.eq C_j n^(4 - D_(*)) W quad \( 0 lt.eq j lt.eq h + 2 \) \, $ <eq:exact-jet-hypothesis>]

 where $cal(R) = \( Delta_g + Lambda \) U$ and the constants $C_j$ are independent of $n$. Define 
#[#set math.equation(numbering: n => "(40)")
 $ cal(D) & = n^2 U^2 + \| nabla U \|^2 \, #h(2em) b = 1 - frac(cal(R) U, cal(D)) \,\
s & = 1 - Lambda^(- 1) [frac(cal(R) n^2 U, cal(D)) - "div"_g (cal(R) / cal(D) nabla U)] . $ <eq:exact-scalar-correction>]

 Then $b \, s$ are smooth, and, with $Delta_b f = "div"_g \( b nabla f \)$, 
#[#set math.equation(numbering: n => "(41)")
 $ Delta_b U + Lambda s U = 0 . $ <eq:exact-weighted-equation>]

 They equal one on every open set where $cal(R) = 0$. Moreover, if 
$ E = 2 B + 20 \, #h(2em) Q_h = \( E + 1 \) \( h + 2 \) + 10 \, $

 then 
#[#set math.equation(numbering: n => "(42)")
 $ parallel b - 1 parallel_(C^h) + parallel s - 1 parallel_(C^h) lt.eq C_h n^(- D_(*) + Q_h) . $ <eq:exact-quotient-bound>]

 In particular, for any prescribed integer $P_1 gt.eq 1$, choosing $D_(*) gt.eq P_1 + Q_h + 2$ makes the left side at most $n^(- P_1)$ for all sufficiently large $n$. In this case $b$ and $s$ are positive for all sufficiently large $n$.]
] <lem:exact-quotients>

#proof[
  The lower bound in (39) gives
  #[#set math.equation(numbering: n => "(43)")
   $ cal(D) gt.eq 1 / 2 n^(2 - 2 B) W^2 > 0 . $ <eq:exact-denominator-lower>]
  Thus the formulas in (40) define smooth functions, regardless of the regularity of $W$. Put $f = cal(R) \/ cal(D)$. The product rule gives
  $ Delta_b U + Lambda s U & = Delta_g U - U "div"_g \( f nabla U \) - f \| nabla U \|^2 + Lambda U - n^2 f U^2 + U "div"_g \( f nabla U \)\
 & = cal(R) - f cal(D) = 0 . $
  The assertion on the set where the residual vanishes follows from the same formulas.
  We give a quantitative derivative estimate to make clear why an exponentially small weight causes no loss. For $0 lt.eq j lt.eq h + 1$, the product rule and (39) yield
  $ \| nabla^j cal(D) \| lt.eq C_j n^(j + 10) W^2 . $
  For $j gt.eq 1$, each term in a derivative of $cal(D)^(- 1)$ is a constant multiple of
  $ cal(D)^(- p - 1) \( nabla^(a_1) cal(D) \) dots.h.c \( nabla^(a_p) cal(D) \) \, #h(2em) a_i gt.eq 1 \, quad a_1 + dots.h.c + a_p = j \, $
  with the appropriate tensor contractions. By (43), its norm is bounded by
  $ C_j n^(j + 10 p + \( 2 B - 2 \) \( p + 1 \)) W^(- 2) = C_j n^(j + \( 2 B + 8 \) p + 2 B - 2) W^(- 2) . $
  The same conclusion for $j = 0$ follows directly from (43). Since $p lt.eq j$, we may use the convenient weaker bound
  #[#set math.equation(numbering: n => "(44)")
   $ \| nabla^j \( cal(D)^(- 1) \) \| lt.eq C_j n^(E \( j + 1 \)) W^(- 2) #h(2em) \( 0 lt.eq j lt.eq h + 1 \) . $ <eq:exact-inverse-derivatives>]
  A derivative of $b - 1$ consists of a derivative of $cal(R)$, a derivative of $U$, and a derivative of $cal(D)^(- 1)$. The first two factors contribute one power of $W$ each and the last contributes $W^(- 2)$. For $j lt.eq h$, the resulting bound is at most
  $ C_j n^(- D_(*) + 8 + j + E \( j + 1 \)) . $
  The term $Lambda^(- 1) cal(R) n^2 U \/ cal(D)$ has the same bound, because $n^2 \/ Lambda lt.eq 1$. Finally, a derivative of order $j$ of $Lambda^(- 1) "div"_g \( \( cal(R) \/ cal(D) \) nabla U \)$ uses derivatives of $cal(R)$ through order $j + 1$ and of $U$ through order $j + 2$. Applying (44), and using $Lambda^(- 1) lt.eq n^(- 2)$, bounds it by
  $ C_j n^(- D_(*) + E \( j + 2 \) + j + 8) . $
  Both displayed exponents are bounded above by $- D_(*) + Q_h$. This proves (42). At no point have we differentiated $W$; its powers cancel in every differentiated quotient. The final conclusions follow by taking $n$ large enough to absorb the fixed constant and to make the $C^0$ error smaller than $1 \/ 2$. ◻
]

===== 4.2 A positive change of the dependent variable <a-positive-change-of-the-dependent-variable>

The corrected coefficients $b \, s$ may vary independently, whereas the conductivity and density of an ordinary metric satisfy a determinant relation. In dimension three the relation takes the following form.

#thm([Lemma 17.])[
  (Metric conductivity).  #emph[Let $\( M \, g \)$ be a smooth three-dimensional Riemannian manifold and let $A$ be a smooth positive $g$-self-adjoint endomorphism of $T M$. Put $d = det A$, with determinant taken in any $g$-orthonormal frame, and define 
#[#set math.equation(numbering: n => "(45)")
 $ g_A \( X \, Y \) = g \( d A^(- 1) X \, Y \) . $ <eq:exact-metric-realization>]

 Then $g_A$ is a smooth Riemannian metric and 
#[#set math.equation(numbering: n => "(46)")
 $ thin upright(d) V_(g_A) = d thin thin upright(d) V_g \, #h(2em) Delta_(g_A) f = d^(- 1) "div"_g \( A nabla f \) . $ <eq:exact-metric-operator>]

]
] <lem:metric-conductivity>

#proof[
  In a $g$-orthonormal frame the metric endomorphism is $C = d A^(- 1)$. It is positive and symmetric, and in dimension three
  $ det C = frac(d^3, det A) = d^2 . $
  Thus its positive relative volume density is $d$, and its inverse endomorphism is $C^(- 1) = A \/ d$. The energy identity is consequently
  $ integral_M g_A \( nabla_(g_A) f \, nabla_(g_A) h \) thin thin upright(d) V_(g_A) = integral_M g \( A nabla f \, nabla h \) thin thin upright(d) V_g $
  for compactly supported smooth $f \, h$. Integration by parts proves the operator identity in (46). ◻
]

To see which equation the positive factor must satisfy, suppose that $b \, s > 0$ and $U$ satisfy (41). For any positive smooth function $v$, define

$ q_v = b v^2 \, #h(2em) d_v = s v^2 + Lambda^(- 1) v Delta_b v . $

The product rule gives

#[#set math.equation(numbering: n => "(47)")
 $ q_v nabla \( U \/ v \) & = b \( v nabla U - U nabla v \) \,\
"div"_g #scale(x: 120%, y: 120%)[\(] q_v nabla \( U \/ v \) #scale(x: 120%, y: 120%)[\)] + Lambda d_v \( U \/ v \) & = 0 . $ <eq:exact-division-identity>]

Indeed, the divergence of the displayed flux is $v Delta_b U - U Delta_b v = - Lambda d_v \( U \/ v \)$. To realize this equation by the scalar conductivity $q_v "Id"$, we impose $d_v = q_v^3$. After division by $v > 0$, this condition is

$ - Delta_b v + Lambda b^3 v^5 - Lambda s v = 0 . $

The next lemma solves this equation with $v$ close to one. The solution need not equal one in the prescribed exterior; the annular correction below will allow us to cut it off there.

#thm([Lemma 18.])[
  (A positive conjugating factor).  #emph[Let $\( M \, g \)$ be a fixed closed smooth three-dimensional Riemannian manifold. Given integers $k_2 gt.eq 0$ and $P_2 gt.eq 1$, choose an even integer $l gt.eq 4$ with $l > k_2 + 3 \/ 2$, and set 
$ k_1 = l \, #h(2em) P_1 = P_2 + 8 . $

 Suppose that smooth functions $b = b_n$ and $s = s_n$ satisfy 
#[#set math.equation(numbering: n => "(48)")
 $ parallel b - 1 parallel_(C^(k_1)) + parallel s - 1 parallel_(C^(k_1)) lt.eq n^(- P_1) . $ <eq:exact-coefficient-smallness>]

 For all sufficiently large $n$, there is a positive smooth function $v = v_n$ solving 
#[#set math.equation(numbering: n => "(49)")
 $ - Delta_b v + Lambda b^3 v^5 - Lambda s v = 0 $ <eq:exact-semilinear>]

 and satisfying 
#[#set math.equation(numbering: n => "(50)")
 $ parallel v - 1 parallel_(C^(k_2)) lt.eq n^(- P_2) . $ <eq:exact-factor-bound>]

 The required threshold for $n$ may depend on the fixed manifold and the displayed finite orders.]
] <lem:exact-positive-factor>

#proof[
  Let $H^a = H^a \( M \, g \)$ denote the usual $L^2$ Sobolev spaces. On the fixed manifold, the inverse
  $ L_Lambda^(- 1) = \( - Delta_g + 4 Lambda \)^(- 1) : H^(l - 2) arrow.r H^l $
  has norm bounded independently of $Lambda gt.eq 1$. Indeed, if $mu gt.eq 0$ is an eigenvalue of $- Delta_g$, the multiplier for this map in the spectral Sobolev norms is
  $ frac(1 + mu, mu + 4 Lambda) lt.eq 1 . $
  The spectral and chart Sobolev norms are equivalent with constants depending on $g$ and $l$, not on $Lambda$. This equivalence follows from the compact-manifold elliptic estimate and the spectral theorem; see [7] Theorems 15.7 and 16.1.
  Write $v = 1 + h$. Equation (49) becomes
  #[#set math.equation(numbering: n => "(51)")
   $ L_Lambda h = "div"_g \( \( b - 1 \) nabla h \) - Lambda #scale(x: 120%, y: 120%)[\(] b^3 \( 1 + h \)^5 - s \( 1 + h \) - 4 h #scale(x: 120%, y: 120%)[\)] . $ <eq:exact-fixed-point-equation>]
  Let $T_n \( h \)$ be the result of applying $L_Lambda^(- 1)$ to the right side. The polynomial in parentheses has constant term $b^3 - s$ and linear coefficient
  $ 5 b^3 - s - 4 = 5 \( b^3 - 1 \) - \( s - 1 \) . $
  Its remaining terms have degree at least two in $h$.
  Sobolev multiplication and (48) therefore imply, on the closed $H^l$ ball of radius $delta lt.eq 1$,
  $ parallel T_n \( 0 \) parallel_(H^l) & lt.eq C Lambda n^(- P_1) \,\
parallel T_n \( h \) - T_n \( tilde(h) \) parallel_(H^l) & lt.eq C Lambda \( n^(- P_1) + delta \) parallel h - tilde(h) parallel_(H^l) . $
  Here the divergence term is bounded from $H^l$ to $H^(l - 2)$ by $C parallel b - 1 parallel_(C^l)$; the harmless factor $Lambda gt.eq 1$ allows it to be included in the displayed estimate. The multiplication and embedding statements used here hold in dimension three because $l gt.eq 4$ and $l > k_2 + 3 \/ 2$; see [20] Section 1, Exercise 6, and Proposition 3.3.
  Set $Q = P_2 + 4$ and $delta = n^(- Q)$. Since $P_1 = Q + 4$ and $Lambda lt.eq 3 n^2$ for $n gt.eq 1$,
  $ parallel T_n \( 0 \) parallel_(H^l) lt.eq C n^(- Q - 2) \, #h(2em) "Lip" \( T_n \) lt.eq C n^2 \( n^(- P_1) + n^(- Q) \) = o \( 1 \) . $
  For all sufficiently large $n$, the map preserves this closed ball and is a contraction there. Its fixed point satisfies $parallel h parallel_(H^l) lt.eq n^(- Q)$. Sobolev embedding then gives $parallel h parallel_(C^(k_2)) lt.eq C n^(- Q) lt.eq n^(- P_2)$, and also $parallel h parallel_(C^0) < 1 \/ 2$, so $v = 1 + h$ is positive.
  The coefficients $b \, s$ are smooth and $b$ is uniformly positive for large $n$. The polynomial right side of $Delta_b v = Lambda b^3 v^5 - Lambda s v$ lies initially in $H^l$. Elliptic regularity raises the regularity of $v$ to $H^(l + 2)$; iteration gives $v in C^oo$. Only smoothness, not a bound uniform in $n$ on every derivative at once, is needed in this bootstrap; see [7] Theorems 15.1 and 15.7. ◻
]

===== 4.3 Localization and annular determinant repair <localization-and-annular-determinant-repair>

#thm([Proposition 19.])[
  (Exactification with an unchanged exterior).  #emph[Let $g$ be a fixed smooth metric on $bb(S)^3$, and fix $0 < t_2 < t_3 < 1$. Assume that $g = g_(*)$ on ${ r gt.eq t_2 }$, where $g_(*)$ is the unit round metric and $r = \( x_1^2 + x_2^2 \)^(1 \/ 2)$. Fix an integer $B gt.eq 1$.]
  #emph[For every pair of integers $k gt.eq 0$, $P gt.eq 1$, there exist finite integers $m_(*) \, D_(*)$, depending only on $k \, P \, B$, with the following property. Suppose that, for all sufficiently large integers $n$, there are real smooth functions $U_n$ and positive continuous functions $W_n$ such that 
#[#set math.equation(numbering: n => "(52)")
 $ \| U_n \| + n^(- 1) \| nabla U_n \| gt.eq n^(- B) W_n \,\
\| nabla^j U_n \| lt.eq C_j n^(j + 4) W_n \, #h(2em) \| nabla^j \( \( Delta_g + Lambda_n \) U_n \) \| lt.eq C_j n^(4 - D_(*)) W_n quad \( 0 lt.eq j lt.eq m_(*) \) \,\
U_n = w_n = Re \( x_1 + i x_2 \)^n quad upright("on ") { r gt.eq t_2 } \, $ <eq:exact-proposition-lower>]

 where all $C_j$ are independent of $n$. Then, for all sufficiently large $n$, there are a smooth Riemannian metric $hat(g)_n$ and a positive smooth function $tilde(v)_n$ on $bb(S)^3$ such that, with $u_n = U_n \/ tilde(v)_n$, 
#[#set math.equation(numbering: n => "(53)")
 $ \( Delta_(hat(g)_n) + Lambda_n \) u_n = 0 \, #h(2em) parallel hat(g)_n - g parallel_(C^k) lt.eq n^(- P) \,\
hat(g)_n = g_(*) \, quad tilde(v)_n = 1 \, quad u_n = w_n quad upright("on ") { r gt.eq t_3 } . $ <eq:exact-final-equation>]

 In particular $u_n$ is nonzero and has exactly the same pointwise signs and zero set as $U_n$. The threshold for $n$ may depend on the fixed input data and on the constants in (52).]
] <prop:exactification>

#proof[
  We specify the finite orders before taking $n$ large. Choose
  #[#set math.equation(numbering: n => "(54)")
   $ k_2 = k + 2 \, #h(2em) P_2 = P + k + 10 \,\
l gt.eq 4 upright(" even") \, quad l > k_2 + 3 \/ 2 \, #h(2em) k_1 = l \, quad P_1 = P_2 + 8 \,\
m_(*) = k_1 + 2 \, #h(2em) D_(*) gt.eq P_1 + \( 2 B + 21 \) \( k_1 + 2 \) + 12 . $ <eq:exact-parameter-budget>]
  These choices depend only on $k \, P \, B$. We suppress the subscript $n$ in the construction.
  Apply Lemma 16 with $h = k_1$ to obtain positive smooth coefficients $b \, s$ satisfying (41) and (48). Since $g$ is round and $U = w_n$ on ${ r gt.eq t_2 }$, their residual vanishes there, and $b = s = 1$ there. Apply Lemma 18 to obtain a positive smooth solution $v$ of (49) satisfying (50).
  Choose numbers $t_2 < a < b_0 < t_3$, and fix a smooth cutoff $chi$ with $0 lt.eq chi lt.eq 1$, which is one on ${ r lt.eq a }$ and zero on ${ r gt.eq b_0 }$. Such a cutoff is smooth on the sphere because it is constant near $r = 0$. Set
  #[#set math.equation(numbering: n => "(55)")
   $ tilde(v) & = 1 + chi \( v - 1 \) \, #h(2em) u = U \/ tilde(v) \,\
q & = b tilde(v)^2 \, #h(2em) d = s tilde(v)^2 + Lambda^(- 1) tilde(v) Delta_b tilde(v) . $ <eq:exact-conjugation>]
  For all sufficiently large $n$, $tilde(v)$ is positive and $parallel tilde(v) - 1 parallel_(C^(k + 2)) lt.eq C n^(- P_2)$. Applying the division identity (47) with $v = tilde(v)$ gives
  #[#set math.equation(numbering: n => "(56)")
   $ "div"_g \( q nabla u \) + Lambda d u = 0 . $ <eq:exact-conjugated-equation>]
  The coefficient estimates and the two extra derivatives included in $k_2 = k + 2$ give
  #[#set math.equation(numbering: n => "(57)")
   $ parallel q - 1 parallel_(C^k) + parallel d - 1 parallel_(C^k) lt.eq C n^(- P_2) . $ <eq:exact-density-estimates>]
  For the term $Delta_b tilde(v)$, one uses $Delta_b tilde(v) = b Delta_g tilde(v) + g \( nabla b \, nabla tilde(v) \)$, so the required derivatives of $b$ are available because $k_1 gt.eq k + 1$. In particular $q \, d > 0$ for large $n$.
  On the open set ${ r < a }$, the cutoff is identically one, and (49) gives
  $ d = s v^2 + Lambda^(- 1) v Delta_b v = b^3 v^6 = q^3 . $
  Where $r gt.eq b_0$, we have $tilde(v) = 1$ and $b = s = 1$, so $q = d = 1$. Consequently the defect $d - q^3$ is supported in the compact annulus ${ a lt.eq r lt.eq b_0 }$, strictly inside ${ t_2 < r < t_3 }$. Without this defect, the choice $A = q "Id"$ would already have the required determinant $d$. We correct that determinant on the two-plane perpendicular to $nabla u$.
  We first justify that this plane and its derivatives are controlled throughout the transition annulus. The round gradient of $w_n$ satisfies
  #[#set math.equation(numbering: n => "(58)")
   $ \| nabla w_n \|_(g_(*))^2 = n^2 \( r^(2 n - 2) - w_n^2 \) gt.eq n^2 r^(2 n - 2) \( 1 - r^2 \) . $ <eq:exact-annular-gradient>]
  To verify the equality, the ambient Euclidean gradient has squared norm $n^2 r^(2 n - 2)$, while its normal component on the unit sphere is $n w_n$, by homogeneity. Since $U = w_n$ here and $tilde(v)$ is close to one in $C^1$,
  $ \| nabla u \| gt.eq tilde(v)^(- 1) n r^(n - 1) sqrt(1 - r^2) - tilde(v)^(- 2) r^n \| nabla tilde(v) \| gt.eq c n r^n > 0 quad \( t_2 < r < t_3 \) $
  for large $n$.
  For the derivative estimates, write locally $x_1 + i x_2 = r e^(i theta)$ and set
  $ alpha_n = frac(cos \( n theta \), r) nabla r - sin \( n theta \) nabla theta . $
  The displayed expression is globally defined on the annulus: the trigonometric functions are single-valued and $thin upright(d) theta = \( - x_2 thin upright(d) x_1 + x_1 thin upright(d) x_2 \) \/ r^2$ is a smooth one-form there. On the fixed annulus,
  $ \| alpha_n \|^2 = r^(- 2) - cos^2 \( n theta \) gt.eq t_3^(- 2) - 1 > 0 \, #h(2em) \| nabla^j alpha_n \| lt.eq C_j n^j . $
  Moreover
  $ nabla u = n r^n t_n \, #h(2em) t_n = tilde(v)^(- 1) alpha_n - n^(- 1) cos \( n theta \) tilde(v)^(- 2) nabla tilde(v) . $
  It follows that $\| t_n \| gt.eq c > 0$ and $\| nabla^j t_n \| lt.eq C_j n^j$ for $0 lt.eq j lt.eq k$. The orthogonal projection
  $ P_perp = "Id" - frac(t_n ⊗ t_n^flat, \| t_n \|^2) $
  is therefore smooth and satisfies
  #[#set math.equation(numbering: n => "(59)")
   $ \| nabla^j P_perp \| lt.eq C_j n^j #h(2em) \( 0 lt.eq j lt.eq k \) . $ <eq:exact-projection-estimates>]
  Here $t_n^flat = g \( t_n \, dot.op \)$, so $\( t_n ⊗ t_n^flat \) X = g \( t_n \, X \) t_n$. To obtain (59), differentiate the quotient defining $P_perp$; its denominator is uniformly bounded away from zero, and the total derivative order of the numerator factors in every term is at most $j$. This estimate shows explicitly that only $k$ powers of $n$ are lost in the required projection norms.
  Define a positive symmetric endomorphism by
  #[#set math.equation(numbering: n => "(60)")
   $ A = q ["Id" + (sqrt(d \/ q^3) - 1) P_perp] quad upright("on ") { t_2 < r < t_3 } \, #h(2em) A = q "Id" quad upright("elsewhere") . $ <eq:exact-annular-conductivity>]
  The coefficient of $P_perp$ vanishes on neighborhoods of both boundary components of this annulus, because $d = q^3$ there. Thus the two formulas agree on open collars and define a globally smooth endomorphism. Its eigenvalue along $nabla u$ is $q$, and its two transverse eigenvalues are both $q sqrt(d \/ q^3)$. Hence, throughout the annulus,
  $ A nabla u = q nabla u \, #h(2em) det A = d . $
  These identities also hold outside it, where $A = q "Id"$ and $d = q^3$.
  By (57), smooth composition gives $parallel sqrt(d \/ q^3) - 1 parallel_(C^k) lt.eq C n^(- P_2)$. The product rule and (59) consequently give
  $ parallel A - "Id" parallel_(C^k) lt.eq C n^(k - P_2) = C n^(- P - 10) . $
  Define $hat(g) = g_A$ by (45). The map $\( d \, A \) mapsto d A^(- 1)$ is smooth near $\( 1 \, "Id" \)$, so (57) and this last estimate imply
  $ parallel hat(g) - g parallel_(C^k) lt.eq C n^(- P - 10) lt.eq n^(- P) $
  for all sufficiently large $n$. Combining Lemma 17 with (56) proves $Delta_(hat(g)) u = - Lambda u$. On ${ r gt.eq t_3 }$, $A = "Id"$, $tilde(v) = 1$, and $U = w_n$, which proves (53). The lower bound (52) excludes $U equiv 0$, and division by the positive function $tilde(v)$ preserves all pointwise signs and zeros. ◻
]

#prodef([Remark 20.])[
  The wave weight $W_n = e^(n phi.alt) + r^n$ satisfies the positivity and continuity hypotheses of Proposition 19. The orders in (54) are chosen before the finite phase and amplitude orders needed for the wave construction, and all these choices precede the final choice of $n$. Increasing the threshold for $n$ then absorbs every constant depending on the fixed profile or those finite orders. Consequently the conclusion gives arbitrary closeness in any prescribed finite collection of smooth norms.
  Hence the sign bound (37) survives with the same constant, while the unchanged exterior in (53) leaves room for the spectral perturbation of the next section.
]

==== 5 Simplicity with the eigenfunction fixed <sec:pinning>

The exactification procedure leaves an annulus on which both the metric and the eigenfunction have their original round form. This annulus lets us make the selected eigenvalue simple while preserving the selected function exactly. Localized trace-free metric variations also occur in Uhlenbeck’s genericity argument [23] Section 4, Example 2. Here the additional requirement that the variation annihilate the selected gradient preserves the chosen eigenfunction exactly. We begin with the finite-dimensional point needed for this argument.

#thm([Lemma 21.])[
  (A space of symmetric forms).  #emph[Let $V$ be a finite-dimensional real vector space and let $cal(L) subset "Sym"^2 \( V^(*) \)$ be a linear subspace. Suppose that, for each $v eq.not 0$, some $B in cal(L)$ satisfies $B \( v \, v \) eq.not 0$. Then $cal(L)$ contains a nondegenerate form.]
] <lem:nondegenerate-pencil>

#proof[
  Choose $A in cal(L)$ of maximal rank $r$ and suppose that $ker A eq.not 0$. There is an $r$-dimensional subspace $W$ on which $A$ is nondegenerate. Fix $0 eq.not v in ker A$ and choose $B in cal(L)$ with $B \( v \, v \) eq.not 0$. Since $A \( v \, dot.op \) = 0$, in a basis of $W xor bb(R) v$ we have
  $ det #scale(x: 120%, y: 120%)[\(] \( A + t B \) \|_(W xor bb(R) v) #scale(x: 120%, y: 120%)[\)] = t B \( v \, v \) det \( A \|_W \) + O \( t^2 \) . $
  This determinant is nonzero for all sufficiently small nonzero $t$. Thus $A + t B$ has rank at least $r + 1$, a contradiction. The same argument covers $r = 0$, with the empty determinant equal to one. ◻
]

#thm([Proposition 22.])[
  (Simplicity with the eigenfunction fixed).  #emph[Let $h$ be a smooth metric on $bb(S)^3$ and let $u$ be a nonzero real smooth function satisfying 
$ - Delta_h u = Lambda_n u \, #h(2em) Lambda_n = n \( n + 2 \) \, #h(2em) n gt.eq 2 . $

 Suppose that, on an annulus $cal(A) = { a < r < b }$ with $0 < a < b < 1$, one has $h = g_(*)$ and $u = w_n$. In every $C^oo$ neighborhood of $h$ there is a smooth metric $h'$ such that $h' - h$ is supported compactly in $cal(A)$, 
$ d V_(h') = d V_h \, #h(2em) - Delta_(h') u = Lambda_n u \, $

 and $Lambda_n$ is a simple eigenvalue of $- Delta_(h')$.]
] <prop:pinned-simplicity>

#proof[
  All gradients and inner products in this proof use $h$. On the round annulus, projection of the Euclidean gradient of the homogeneous harmonic polynomial $w_n$ onto the tangent space of the sphere gives
  #[#set math.equation(numbering: n => "(61)")
   $ \| nabla u \|^2 = n^2 #scale(x: 120%, y: 120%)[\(] r^(2 n - 2) - w_n^2 #scale(x: 120%, y: 120%)[\)] gt.eq n^2 r^(2 n - 2) \( 1 - r^2 \) > 0 . $ <eq:pinning-gradient>]
  Consequently the orthogonal projection $P$ onto $\( nabla u \)^perp$ is smooth on $cal(A)$. Let
  $ E = ker \( - Delta_h - Lambda_n \) \, #h(2em) E_0 = {v in E : integral_(bb(S)^3) v u thin d V_h = 0} . $
  These are finite-dimensional real spaces by the compact elliptic spectral theorem. If $E_0 = 0$, there is nothing to prove.
  We first show that
  #[#set math.equation(numbering: n => "(62)")
   $ v in E_0 \\ { 0 } quad arrow.r.double quad P nabla v equiv.not 0 med upright("on ") cal(A) . $ <eq:transverse-nonvanishing>]
  Suppose otherwise. Then $d v$ is a scalar multiple of $d u$ throughout $cal(A)$. Locally write $x_1 + i x_2 = r e^(i theta)$, so that $u = r^n cos \( n theta \)$. The covectors $d r$ and $d u$ are independent wherever $sin \( n theta \) eq.not 0$. Such points occur in every annulus under consideration. Near one of them, extend $\( u \, r \)$ to a coordinate system $\( u \, r \, z \)$ and restrict to a coordinate product box. Since $d v$ annihilates the tangent spaces to the level sets of $u$, its $r$ and $z$ coordinate derivatives vanish there. Thus $v = F \( u \)$ on this box for a smooth function $F$ of one variable. The chain rule and the eigenfunction equations give
  #[#set math.equation(numbering: n => "(63)")
   $ n^2 F'' \( u \) #scale(x: 120%, y: 120%)[\(] r^(2 n - 2) - u^2 #scale(x: 120%, y: 120%)[\)] + Lambda_n #scale(x: 120%, y: 120%)[\(] F \( u \) - u F' \( u \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:pinning-F-equation>]
  Differentiating in the coordinate $r$, with $u$ and $z$ fixed, yields
  $ 2 n^2 \( n - 1 \) r^(2 n - 3) F'' \( u \) = 0 . $
  The coefficient is positive because $n gt.eq 2$ and $r > 0$. Therefore $F'' = 0$ on the interval in question. Equation (63) then forces the constant term of $F$ to vanish, so $v = c u$ on this box for some real $c$. Unique continuation implies $v = c u$ throughout the connected sphere. Precisely, $v - c u$ solves a second-order elliptic equation with smooth real positive-definite principal coefficients and smooth lower-order coefficients; it vanishes on a nonempty open set. The unique continuation Theorem of Aronszajn [1] pp. 235–236 applies in these coordinates and on the connected manifold. Orthogonality to $u$ now forces $v = 0$, proving (62).
  Let $cal(K)$ be the real vector space of smooth symmetric endomorphisms of $T bb(S)^3$ supported compactly in $cal(A)$ and satisfying
  $ K nabla u = 0 \, #h(2em) "tr" K = 0 . $
  Each $K in cal(K)$ defines a symmetric form on $E_0$ by
  #[#set math.equation(numbering: n => "(64)")
   $ M \( K \) \( v \, z \) = integral_(bb(S)^3) chevron.l K nabla v \, nabla z chevron.r thin d V_h . $ <eq:pinning-form>]
  For $v in E_0 \\ { 0 }$, put $p = P nabla v$ on $cal(A)$. By (62), choose a nonnegative smooth bump function $chi$ with compact support in $cal(A)$ such that $integral chi \| p \|^4 thin d V_h > 0$. Define, on the annulus and then by zero,
  $ K = chi (p ⊗ p^flat - frac(\| p \|^2, 2) P) . $
  Here $\( p ⊗ p^flat \) X = chevron.l p \, X chevron.r p$. Since $P$ has rank two and $p perp nabla u$, this tensor belongs to $cal(K)$. Moreover,
  $ M \( K \) \( v \, v \) = 1 / 2 integral_(cal(A)) chi \| p \|^4 thin d V_h > 0 . $
  The image $M \( cal(K) \)$ is a linear subspace of the symmetric forms on $E_0$. Lemma 21 therefore gives one $K in cal(K)$ for which $M \( K \)$ is nondegenerate on $E_0$.
  For real $tau$, put
  $ A_tau = e^(tau K) \, #h(2em) h_tau \( X \, Y \) = h \( A_tau^(- 1) X \, Y \) . $
  The endomorphism $A_tau$ is positive definite, $det A_tau = e^(tau "tr" K) = 1$, and $A_tau nabla u = nabla u$. It follows directly that
  $ d V_(h_tau) = d V_h \, #h(2em) Delta_(h_tau) f = "div"_h \( A_tau nabla f \) \, #h(2em) - Delta_(h_tau) u = Lambda_n u . $
  Also $h_tau = h$ off the compact support of $K$, and $h_tau arrow.r h$ smoothly as $tau arrow.r 0$.
  We claim that $Lambda_n$ is simple for every sufficiently small nonzero $tau$. If this fails, there are nonzero $tau_j arrow.r 0$ and real functions $z_j$ such that
  $ - Delta_(h_(tau_j)) z_j = Lambda_n z_j \, #h(2em) integral z_j u thin d V_h = 0 \, #h(2em) integral z_j^2 thin d V_h = 1 . $
  The unchanged volume and uniform positivity of $A_(tau_j)$ give
  $ integral chevron.l A_(tau_j) nabla z_j \, nabla z_j chevron.r thin d V_h = Lambda_n \, $
  so the sequence is bounded in $H^1$. By Rellich compactness, a subsequence converges strongly in $L^2$ and weakly in $H^1$ to $z$. Passing to the weak eigenfunction equation shows $z in E_0$; normalization gives $parallel z parallel_(L^2 \( h \)) = 1$. For each $v in E_0$, the equations for $z_j$ and $v$, tested against each other, imply
  $ integral ⟨frac(A_(tau_j) - "Id", tau_j) nabla z_j \, nabla v⟩ thin d V_h = 0 . $
  The tensor quotient converges uniformly to $K$, so weak $H^1$ convergence gives $M \( K \) \( z \, v \) = 0$ for every $v in E_0$. Nondegeneracy of $M \( K \)$ contradicts $parallel z parallel_(L^2 \( h \)) = 1$. Choosing any sufficiently small nonzero $tau$ now completes the proof. ◻
]

==== 6 Persistence and one fixed smooth metric <sec:persistence>

The lower bound from the wave construction is expressed by a finite sum of sign-test integrals. Simplicity makes a strict lower bound for this functional persist when the metric changes. We give the continuity and limiting arguments explicitly, including the topology in which the limit is taken.

#thm([Lemma 23.])[
  (Continuity near a simple eigenvalue).  #emph[Let $M$ be a closed smooth manifold, let $h_0$ be a smooth Riemannian metric, and suppose that $lambda_0 > 0$ is a simple eigenvalue of $- Delta_(h_0)$ with real eigenfunction $u_0$ normalized by $parallel u_0 parallel_(L^2 \( h_0 \)) = 1$. For every open interval $I$ containing $lambda_0$, there is a $C^oo$ neighborhood $cal(U)$ of $h_0$ and, for every $h in cal(U)$, a simple eigenvalue $lambda \( h \) in I$ with a normalized real eigenfunction $u \( h \)$. One can choose the signs so that 
$ lambda \( h \) arrow.r lambda_0 \, #h(2em) u \( h \) arrow.r u_0 quad upright("in ") C^oo \( M \) quad upright("as ") h arrow.r h_0 . $

 In particular, if $cal(F)$ is lower semicontinuous on $C^0 \( M \)$, invariant under nonzero real rescaling, and $cal(F) \( u_0 \) > T$, then $cal(U)$ can be made small enough that $cal(F) \( u \( h \) \) > T$ for all $h in cal(U)$.]
] <lem:simple-eigenpair-continuity>

#proof[
  List the eigenvalues with multiplicity as $0 = mu_0 \( h \) lt.eq mu_1 \( h \) lt.eq dots.h.c$, and let $k$ be the index for which $mu_k \( h_0 \) = lambda_0$. The energy and mass forms are
  $ Q_h \( f \) = integral_M \| nabla_h f \|_h^2 thin d V_h \, #h(2em) N_h \( f \) = integral_M f^2 thin d V_h . $
  Uniform convergence of the metrics and their inverse tensors implies that, for some $epsilon \( h \) arrow.r 0$,
  $ \( 1 - epsilon \) Q_(h_0) lt.eq Q_h lt.eq \( 1 + epsilon \) Q_(h_0) \, #h(2em) \( 1 - epsilon \) N_(h_0) lt.eq N_h lt.eq \( 1 + epsilon \) N_(h_0) . $
  The variational min–max characterization [3] Section 7.2 therefore gives $mu_j \( h \) arrow.r mu_j \( h_0 \)$ for every fixed index $j$. Choose a smaller interval $J$ with closure in $I$ that contains the selected eigenvalue and no other eigenvalue of $h_0$. Applying this convergence at the indices $k - 1 \, k \, k + 1$ shows that, for $h$ close to $h_0$, precisely one eigenvalue counted with multiplicity lies in $J$. It is $mu_k \( h \)$ and it is simple.
  For completeness, uniform convergence of the eigenfunctions follows without differentiating a spectral projection. Let $h_j arrow.r h_0$ smoothly and let $u_j$ be real eigenfunctions at this index, normalized in $L^2 \( h_j \)$. Their eigenvalues stay bounded. Energy gives an $H^1 \( h_0 \)$ bound. For every nonnegative integer $s$, the usual global elliptic estimate for the fixed operator $Delta_(h_0)$ [7] Theorem 15.7 is
  $ parallel f parallel_(H^(s + 2)) lt.eq C_s #scale(x: 120%, y: 120%)[\(] parallel Delta_(h_0) f parallel_(H^s) + parallel f parallel_(L^2) #scale(x: 120%, y: 120%)[\)] . $
  Smooth convergence implies that $Delta_(h_j) - Delta_(h_0) : H^(s + 2) arrow.r H^s$ has operator norm tending to zero. Absorbing this difference yields the same estimate with $Delta_(h_j)$ and a constant independent of large $j$. The eigenfunction equation then bounds the $u_j$ in every Sobolev space. Rellich compactness and Sobolev embedding give subsequential convergence in every $C^m$ to a smooth eigenfunction of $h_0$ at the selected eigenvalue. The limiting $L^2 \( h_0 \)$ norm is one because the volume densities converge uniformly. Simplicity identifies this limit as $u_0$ or $- u_0$. Choosing the sign by $integral_M u_j u_0 thin d V_(h_0) > 0$ excludes the second alternative. That integral is nonzero for all sufficiently nearby metrics: otherwise a sequence on which it vanished would give a normalized limit orthogonal to $u_0$. Thus every subsequence has the same limit, which proves the claimed continuity. Finally, lower semicontinuity implies $liminf cal(F) \( u_j \) gt.eq cal(F) \( u_0 \) > T$. The smooth metric topology is metrizable, so the sequential conclusion is exactly the asserted neighborhood statement. ◻
]

We now assemble the preceding constructions into the form needed for iteration. Fix a sufficiently small $C^2$ neighborhood $cal(V)$ of $g_(*)$ in the smooth metrics on $bb(S)^3$ so that all uniform comparisons and the initial-profile construction above apply. In particular there is one constant $C_(upright("area")) > 0$ such that every sign functional furnished by the wave construction satisfies

#[#set math.equation(numbering: n => "(65)")
 $ cal(F) \( f \) lt.eq C_(upright("area")) thin cal(H)_h^2 \( { f = 0 } \) \, #h(2em) h in cal(V) \, quad f in C^0 \( bb(S)^3 \) . $ <eq:uniform-certificate-area>]

The constant is independent of the profile, its finite subdivision, and its frequency; this is Proposition 11. Each such $cal(F)$ is lower semicontinuous for uniform convergence and is invariant under multiplication by any nowhere-zero positive function, as well as by any nonzero real constant.

#thm([Proposition 24.])[
  (One construction step).  #emph[Suppose that $g in cal(V)$ agrees with $g_(*)$ on $r gt.eq R_0$, where 
$ 1 / 5 lt.eq R_0 < R_1 lt.eq 3 / 10 . $

 Let $cal(N)$ be any $C^oo$ neighborhood of $g$, let $A > 0$, and let $N gt.eq 2$ be an integer. There are an integer $n gt.eq N$, a metric $g' in cal(N) ∩ cal(V)$ agreeing with $g_(*)$ on $r gt.eq R_1$, and a nonzero real smooth function $u$ such that $- Delta_(g') u = Lambda_n u$ and $Lambda_n$ is simple. Moreover, there is an open neighborhood $cal(W)$ of $g'$ in $cal(V)$ such that every $h in cal(W)$ has an exact real eigenfunction $u_h$ with eigenvalue $lambda_h$ satisfying 
#[#set math.equation(numbering: n => "(66)")
 $ Lambda_n - 1 < lambda_h < Lambda_n + 1 \, #h(2em) frac(cal(H)_h^2 \( { u_h = 0 } \), sqrt(lambda_h)) > A . $ <eq:one-step-open-witness>]

 This neighborhood is obtained by retaining one fixed sign functional and one fixed strict numerical threshold.]
] <prop:one-step>

#proof[
  Choose a smaller neighborhood $cal(N)_1$ of $g$ contained in $cal(N) ∩ cal(V)$. Such a neighborhood contains a condition $parallel h - g parallel_(C^k) < epsilon.alt$ for some finite $k$ and $epsilon.alt > 0$. Choose intermediate radii as in the wave and exactification constructions, leaving a nonempty annulus between their outermost modified radius $t_3$ and $R_1$.
  Proposition 8 gives a fixed smooth profile $phi.alt$ with
  $ J := integral_Omega L_phi.alt thin d x > 4 C_(upright("area")) A \/ c_(upright("wave")) . $
  Here and below the coordinate measure on the fixed cube is used; its comparison with $d V_g$ is uniform for $g in cal(V)$. The wave realization in Proposition 14 supplies, for all sufficiently large integers $n$, a real function $U$ and a sign functional $cal(F)$ with
  $ cal(F) \( U \) gt.eq c_(upright("wave")) n J \, $
  where $c_(upright("wave")) > 0$ is independent of the chosen profile. The required finite derivative orders and residual powers can be specified in advance. By Proposition 19, choose these orders so that, after increasing $n$, there is an exact eigenpair $\( hat(g) \, u \)$ at $Lambda_n$, with $hat(g) in cal(N)_1$, $u = U \/ tilde(v)$ for a smooth function $tilde(v) > 0$, and $hat(g) = g_(*)$, $u = w_n$ for $r gt.eq t_3 < R_1$. In particular $cal(F) \( u \) = cal(F) \( U \)$. All accuracy choices are finite; the profile and these choices are fixed before $n$ is increased.
  Take $n gt.eq N$ sufficiently large for these conclusions. Since $n gt.eq 2$,
  #[#set math.equation(numbering: n => "(67)")
   $ cal(F) \( u \) > 2 C_(upright("area")) A \( n + 1 \) . $ <eq:one-step-sign-threshold>]
  Apply Proposition 22 in an annulus $t_3 < r < t_4 < R_1$, with an arbitrarily small smooth change. It gives $g' in cal(N)_1$ with the same exact eigenfunction $u$ and simple eigenvalue $Lambda_n$. The sign bound is unchanged and $g' = g_(*)$ on $r gt.eq R_1$.
  Now freeze $cal(F)$, including its subdivision and all its coordinate shifts, and set $T = C_(upright("area")) A \( n + 1 \)$. Lemma 23 gives an open neighborhood $cal(W) subset cal(V)$ of $g'$ on which a normalized real eigenfunction $u_h$ has eigenvalue in $\( Lambda_n - 1 \, Lambda_n + 1 \)$ and satisfies $cal(F) \( u_h \) > T$. The normalization does not affect the sign functional. By (65),
  $ cal(H)_h^2 \( { u_h = 0 } \) > A \( n + 1 \) . $
  Finally $Lambda_n + 1 = \( n + 1 \)^2$, so $sqrt(lambda_h) < n + 1$, proving (66). ◻
]

#proof[
  Let $cal(O)$ be any prescribed $C^oo$ neighborhood of the round metric. We will retain all the open witness requirements from Proposition 24 inside $cal(O)$.
  Work in the vector space $cal(T) = C^oo \( bb(S)^3 \; "Sym"^2 T^(*) bb(S)^3 \)$ of smooth symmetric covariant tensors. Fix increasing $C^m$ norms using the round metric and its connection, and put
  #[#set math.equation(numbering: n => "(68)")
   $ d \( T \, S \) = sum_(m = 0)^oo 2^(- m - 1) min { 1 \, parallel T - S parallel_(C^m) } . $ <eq:complete-tensor-metric>]
  This is a complete translation-invariant metric inducing the smooth topology. Indeed a $d$-Cauchy sequence is Cauchy in every $C^m$ norm, and the compatible $C^m$ limits define one smooth tensor. Conversely convergence in every such norm implies convergence in $d$ by splitting the series into a finite sum and a uniformly small tail. The same splitting shows that every $d$-neighborhood contains a neighborhood specified by finitely many seminorm bounds, hence, since our norms are increasing, by one sufficiently small $C^k$ bound. This explains why the finite-order closeness supplied by the construction suffices for the iteration.
  The set $cal(V)$ is open in $cal(T)$ and consists entirely of positive-definite tensors. Set $g_0 = g_(*)$ and choose $rho_0 > 0$ such that the closed $d$-ball $B_0 = overline(B)_d \( g_0 \, rho_0 \)$ lies in $cal(V) ∩ cal(O)$. Let
  $ R_j = 3 / 10 - 1 / 10 thin 2^(- j) \, #h(2em) j gt.eq 0 \, $
  so $R_0 = 1 \/ 5$ and $R_j$ increases strictly to $3 \/ 10$. We inductively construct smooth metrics $g_j$, integers $n_j$, open witness neighborhoods $cal(W)_j$, and closed balls $B_j = overline(B)_d \( g_j \, rho_j \)$ with
  $ & g_j = g_(*) quad upright("on ") r gt.eq R_j \, #h(2em) n_j > n_(j - 1) \, #h(2em) n_j gt.eq j + 2 \,\
 & 0 < rho_j < 2^(- j) \, #h(2em) B_j subset B_d \( g_(j - 1) \, rho_(j - 1) \) ∩ cal(W)_j . $
  For $j = 1$ the condition involving $n_0$ is omitted. At step $j$, apply Proposition 24 to $g_(j - 1)$, the pair $\( R_(j - 1) \, R_j \)$, the open ball $B_d \( g_(j - 1) \, rho_(j - 1) \)$, the target $A = j$, and a frequency lower bound larger than $n_(j - 1)$ and at least $j + 2$. This supplies $g_j$ in that ball and its open witness neighborhood $cal(W)_j$. Choose $rho_j > 0$ small enough for the displayed containments and size bound. This is possible because the center belongs to both open sets. At each stage only the constructed center is required to have a round exterior; the other tensors in $B_j$ need not have one.
  The balls are nested and their diameters tend to zero. Their centers form a $d$-Cauchy sequence, so completeness gives a smooth limiting tensor $g_oo$. Because each $B_j$ is closed and contains every later center, $g_oo in B_j$ for all $j gt.eq 0$. In particular $g_oo in cal(O) ∩ cal(V)$ is a smooth Riemannian metric and belongs to every $cal(W)_j$. Each $cal(W)_j$ retains its own fixed sign functional and threshold; no uniform spectral gap or common eigenfunction tolerance is used.
  For this one metric, the witness in $cal(W)_j$ is an exact nonzero real eigenfunction $u_j$ with
  $ - Delta_(g_oo) u_j = lambda_j u_j \, #h(2em) Lambda_(n_j) - 1 < lambda_j < Lambda_(n_j) + 1 \, #h(2em) frac(cal(H)_(g_oo)^2 \( { u_j = 0 } \), sqrt(lambda_j)) > j . $
  The integers $n_j$ increase to infinity; the displayed intervals are pairwise disjoint and ordered, since $Lambda_(n + 1) - Lambda_n = 2 n + 3 > 2$. Hence $lambda_j arrow.r oo$, while the nodal-area ratios tend to infinity. The sphere is closed, connected, and three-dimensional, so these are the required eigenfunctions of one fixed admissible metric. ◻
]

== The $S^2 times bb(T)^2$ construction <the-s2timesmathbb-t2-construction>

The following sections prove Theorem 2 by a separate envelope and ordinary-metric realization. The sign-score and spectral-persistence principles have the same roles as above, but the dimensional determinant relation and its correction are proved afresh.

==== 7 Background modes and strict envelopes <sec:envelopes>

Let

$ M = S^2 times bb(T)^2 \, #h(2em) g_0 = d p^2 + sin^2 p thin d theta^2 + d z^2 + d z'^2 \, $

where the sphere has radius one and both circles have length $2 pi$. Fix a coordinate cube $P$ whose closure lies in $0 < p < pi \/ 2$, and a smaller coordinate cube $D subset.double P$. Throughout the proof, integration against $d x$ in this chart means coordinate Lebesgue measure.

#thm([Lemma 25.])[
  (Background modes).  #emph[For every integer $k gt.eq 1$, set 
$ Lambda_k = 2 k^2 + k \, #h(2em) u_k^0 = sin^k p cos \( k phi.alt \) \, #h(2em) phi.alt = theta + z . $

 Then $u_k^0$ is a smooth real eigenfunction on $M$ with $\( Delta_(g_0) + Lambda_k \) u_k^0 = 0$. Set $f_0 = log sin p$ on a neighborhood of $overline(P)$. There is a constant $c > 0$, independent of $k$, such that 
#[#set math.equation(numbering: n => "(69)")
 $ \| d u_k^0 \|_(g_0) gt.eq c k e^(k f_0) quad upright("on ") overline(P) . $ <env:background-gradient>]

]
] <env:background-mode>

#proof[
  In Cartesian coordinates on the sphere, $u_k^0$ is the real part of $\( X_1 + i X_2 \)^k e^(i k z)$. The polynomial $\( X_1 + i X_2 \)^k$ is homogeneous and harmonic, so its restriction to the unit sphere has eigenvalue $k \( k + 1 \)$; the $z$ factor contributes $k^2$. This proves smoothness and the eigenfunction equation. The covectors $d f_0$ and $d phi.alt$ are orthogonal, with squared norms $cot^2 p$ and $csc^2 p + 1$. Hence
  #[#set math.equation(numbering: n => "(70)")
   $ \| d u_k^0 \|_(g_0)^2 & = k^2 e^(2 k f_0) #scale(x: 120%, y: 120%)[\(] cot^2 p cos^2 \( k phi.alt \) + \( csc^2 p + 1 \) sin^2 \( k phi.alt \) #scale(x: 120%, y: 120%)[\)]\
 & = k^2 #scale(x: 120%, y: 120%)[\(] sin^(2 k) p + sin^(2 k - 2) p - 2 \( u_k^0 \)^2 #scale(x: 120%, y: 120%)[\)] . $ <env:background-gradient-identity>]
  The first line gives (69), since both coefficients have positive lower bounds on $overline(P)$. ◻
]

For a smooth function $f$ and a smooth metric $h$, write

$ a = nabla_h f \, #h(2em) H = nabla_h^2 f \, #h(2em) B = sqrt(2 + \| a \|_h^2) . $

We call $f$ a #emph[strict envelope] for $h$ on a set if $a eq.not 0$ there and

#[#set math.equation(numbering: n => "(71)")
 $ H \( a \, a \) + \( 2 + \| a \|_h^2 \) max_(\| e \|_h = 1\
d f \( e \) = 0) H \( e \, e \) > 0 . $ <env:condition>]

The maximum exists because the transverse unit sphere is compact. The condition is open in the second derivatives of $f$ and the first derivatives of $h$, as long as $d f eq.not 0$.

The function $f_0$ is a strict envelope for $g_0$ on $overline(P)$. Indeed, with $e_theta = \( sin p \)^(- 1) partial_theta$,

$ a_0 = cot p thin partial_p \, #h(2em) H_0 \( partial_p \, partial_p \) = - csc^2 p \, #h(2em) H_0 \( e_theta \, e_theta \) = cot^2 p \, $

and the expression in (71), tested with $e_theta$, is

$ - cot^2 p thin csc^2 p + \( 2 + cot^2 p \) cot^2 p = cot^2 p > 0 . $

Fix a smooth-topology open neighborhood $cal(U)$ of $g_0$, sufficiently small in $C^1$ that $f_0$ remains strict for every $h in cal(U)$ on $overline(P)$. Also arrange uniform comparison of these metrics with $g_0$ on $M$ and, for one fixed $K gt.eq 1$,

#[#set math.equation(numbering: n => "(72)")
 $ K^(- 1) I lt.eq \( h_(i j) \( x \) \) lt.eq K I quad \( x in overline(P) \, med h in cal(U) \) . $ <env:metric-comparison>]

The finite-stage backgrounds used below satisfy the additional condition that $h - g_0$ has compact support in $P$.

===== 7.1 Amplifying the gradient <amplifying-the-gradient>

We reserve one direction for the old gradient and one transverse direction for the maximizing Hessian test in (71). Corrugation in the remaining two directions supplies a large positive tangential Hessian that compensates for its negative radial Hessian. When this tangential term does not dominate, the reserved transverse direction retains the original strictness.

#thm([Lemma 26.])[
  (Uniform amplification).  #emph[There is $d_(*) > 0$, depending only on the comparison constant $K$ and fixed auxiliary functions, with the following property. Suppose $h$ is smooth, satisfies (72) near $overline(D)$, and $f$ is a strict envelope for $h$ on a neighborhood of $overline(D)$. For every $b > 0$ there is a smooth strict envelope $tilde(f)$ such that 
#[#set math.equation(numbering: n => "(73)")
 $ "supp" \( tilde(f) - f \) subset.double D \, #h(2em) parallel tilde(f) - f parallel_(L^oo) < b \,\
integral_D \| nabla_h tilde(f) \|_h thin d x gt.eq \( 1 + d_(*) \) integral_D \| nabla_h f \|_h thin d x . $ <env:amplification-smallness>]

 Consequently the gradient integral can be made arbitrarily large by a perturbation compactly supported in $D$, with any prescribed positive total sup-norm budget. No derivative bound on the resulting envelope is asserted.]
] <env:amplify>

#proof[
  Fix $0 < r_0 < r_1 < R < 1 \/ 2$ and a nonzero nonnegative function $s in C_c^oo \( \( r_0 \, r_1 \) \)$. In the disk of radius $R$ about each point of $bb(Z)^2$, define
  $ q \( r \) = - integral_r^R s \( t \) thin d t \, $
  and set $q = 0$ off the disks. The resulting function on $bb(R)^2$ is smooth and $bb(Z)^2$-periodic: it is a negative constant near each disk center and zero near each disk boundary. Where its derivatives are nonzero, let $n \, t$ be the radial and tangential Euclidean unit vectors. Then
  #[#set math.equation(numbering: n => "(74)")
   $ D q = s thin n^flat \, #h(2em) D^2 q = s' thin n^flat ⊗ n^flat + s / r thin t^flat ⊗ t^flat . $ <env:radial-bowl>]
  Outside those annuli all derivatives in (74) vanish. Fix also $0 lt.eq chi in C_c^oo \( \( - 1 \, 1 \)^4 \)$, equal to one on a smaller concentric box. Nonnegativity and bounded second derivatives give
  #[#set math.equation(numbering: n => "(75)")
   $ \| s' \| lt.eq C sqrt(s) \, #h(2em) \| D chi \| lt.eq C sqrt(chi) . $ <env:bump-estimates>]
  For example, for a nonnegative one-variable function $v$ with $parallel v'' parallel_oo lt.eq L$, Taylor’s inequality at displacement $- v' \/ L$ gives $\| v' \|^2 lt.eq 2 L v$; applying this along lines proves the second estimate as well. Let
  $ K_q = sup s \( s' \)_(-) \, #h(2em) \( s' \)_(-) = max { - s' \, 0 } \, $
  and fix once and for all $0 < delta lt.eq 1$ so small that
  #[#set math.equation(numbering: n => "(76)")
   $ 2 K_q delta^2 lt.eq frac(1, 8 R) . $ <env:fixed-delta>]
  This choice is independent of $f$, $h$, and all subsequent amplifications.
  ======= 7.1.1 The perturbation and its errors. <the-perturbation-and-its-errors.>
  Subdivide $D$ into finitely many congruent coordinate cubes $C$ of side $L$. At the center $x_C$ of each cube choose constant linear coordinates $y$ centered at $x_C$ such that $h \( x_C \) = I$,
  $ a \( x_C \) = A_C e_1 \, $
  and $e_2$ realizes the transverse maximum in (71) at $x_C$. Complete these to an $h \( x_C \)$-orthonormal frame. By (72), one fixed $c > 0$ ensures that the $y$-box $\| y_j \| < eta$, with $eta = c L$, lies strictly inside $C$; its coordinate volume is a fixed positive fraction of $\| C \|$, uniformly over all cells. These frames need not vary continuously between cells.
  Put $epsilon.alt = eta^3$ and, in this box, add
  #[#set math.equation(numbering: n => "(77)")
   $ v_C \( y \) = delta A_C epsilon.alt thin chi \( y \/ eta \) q #scale(x: 120%, y: 120%)[\(] \( y_3 \, y_4 \) \/ epsilon.alt #scale(x: 120%, y: 120%)[\)] . $ <env:corrugation>]
  Extend $v_C$ by zero and set $tilde(f) = f + sum_C v_C$. The sum is finite, its terms have disjoint supports, and its support is compact in $D$. All constants in the error estimates that follow may depend on the current fixed $f \, h$, but not on the cell or its fineness. In particular, $A_C$ has a positive lower bound and a finite upper bound. For brevity write $A = A_C$ in a given cell. Uniformly there, $h = I + O \( eta \)$ and
  #[#set math.equation(numbering: n => "(78)")
   $ d tilde(f) & = A #scale(x: 120%, y: 120%)[\(] e_1^flat + delta chi s thin n^flat + O \( eta \) #scale(x: 120%, y: 120%)[\)] \,\
a_(*) := nabla_h tilde(f) & = A #scale(x: 120%, y: 120%)[\(] e_1 + delta chi s thin n + O \( eta \) #scale(x: 120%, y: 120%)[\)] \,\
H_(*) := nabla_h^2 tilde(f) & = H + delta A \( Q + cal(E) \) \, #h(2em) Q = chi / epsilon.alt D^2 q . $ <env:gradient-expansion>]
  Here $chi$ and $q$ are evaluated at their arguments in (77); $n \, t$ lie in the $\( y_3 \, y_4 \)$-plane. The differential of the cutoff term is $O \( epsilon.alt \/ eta \)$. Two differentiations of (77), including the connection term in the Hessian, give
  #[#set math.equation(numbering: n => "(79)")
   $ \| cal(E) \| lt.eq C (frac(sqrt(chi) thin s, eta) + epsilon.alt / eta^2 + chi s + epsilon.alt / eta) . $ <env:error-raw>]
  The second term includes the constant central part of the negative bowl. In particular it cannot be omitted when $D q = 0$.
  Define nonnegative quantities, equal to zero off the radial annuli,
  $ T = frac(chi s, epsilon.alt) \, #h(2em) N = frac(chi \( s' \)_(-), epsilon.alt) . $
  The following estimates hold uniformly, including at the cutoff and annulus boundaries:
  #[#set math.equation(numbering: n => "(80)")
   $ \| cal(E) \| + eta^2 N & lt.eq C eta^(1 \/ 2) \( 1 + T \) \,\
N \( chi s \)^2 & lt.eq parallel s' parallel_oo epsilon.alt T^2 \, #h(2em) N \( chi s \)^2 lt.eq K_q T . $ <env:error-uniform>]
  Indeed,
  $ frac(sqrt(chi) thin s, eta) = eta^(1 \/ 2) sqrt(s T) lt.eq C eta^(1 \/ 2) sqrt(T) \, #h(2em) eta^2 N lt.eq C eta^(1 \/ 2) sqrt(chi T) \, $
  while the other terms in (79) are $eta \, eta^3 T \, eta^2$. Finally, $N \( chi s \)^2 = T chi^2 s \( s' \)_(-)$, which proves both estimates in (80). Equation (78) also gives $d tilde(f) \( e_1 \) = A \( 1 + O \( eta \) \)$; thus the new gradient never vanishes once the cells are sufficiently small.
  ======= 7.1.2 Strictness when $T$ is large. <strictness-when-t-is-large.>
  At a point with $T > 0$, take the #emph[exactly] transverse vector
  #[#set math.equation(numbering: n => "(81)")
   $ v = t - frac(d tilde(f) \( t \), d tilde(f) \( e_1 \)) e_1 \, #h(2em) e = frac(v, \| v \|_h) . $ <env:angular-test>]
  Since $n^flat \( t \) = 0$, this is $t + O \( eta \) e_1$ before normalization. Its radial component is exactly zero, and normalization in the variable metric is scalar multiplication. Hence
  $ Q \( e \, e \) = frac(T, r \| v \|_h^2) gt.eq frac(T, 2 R) $
  for all sufficiently small cells. By (78), the radial component of $a_(*) \/ A$ is $delta chi s + O \( eta \)$. Discarding the nonnegative tangential part of $Q$ and using (80) gives
  #[#set math.equation(numbering: n => "(82)")
   $ Q \( a_(*) \, a_(*) \) & gt.eq - A^2 #scale(x: 120%, y: 120%)[\(] 2 delta^2 N \( chi s \)^2 + C eta^2 N #scale(x: 120%, y: 120%)[\)]\
 & gt.eq - A^2 #scale(x: 120%, y: 120%)[\(] 2 delta^2 K_q T + C eta^2 N #scale(x: 120%, y: 120%)[\)] . $ <env:gradient-fast-lower>]
  Also $\| a_(*) \|_h^2 gt.eq A^2 \/ 2$. For $T gt.eq 1$, (80) therefore bounds the contribution of $delta A \( Q + cal(E) \)$ to the strictness expression from below by
  $ delta A^3 (frac(1, 4 R) - 2 K_q delta^2 - C eta^(1 \/ 2)) T . $
  Here and below the constant $C$ may change with the current envelope; the positive lower bound on $A$ absorbs the factors $1 + A^(- 2)$ from the error terms. By (76), sufficiently small $eta$ makes this at least $delta A^3 T \/ \( 16 R \)$. The contribution of the old Hessian $H$ is bounded below by $- C_H$ uniformly in the cell and its point. Choose a finite threshold
  $ T_0 > max {1 \, frac(32 R C_H, delta min_(overline(D)) \| a \|_h^3)} . $
  Then (71) holds at every point where $T gt.eq T_0$, once the subdivision is sufficiently fine. Only $T_0$ and this fineness threshold depend on the current Hessian and gradient bounds.
  ======= 7.1.3 Strictness when $T$ is bounded. <strictness-when-t-is-bounded.>
  For $0 lt.eq T lt.eq T_0$, the radial coefficient $N$ may still be large. We use the reserved transverse direction and bound the negative contribution to $Q \( a_(*) \, a_(*) \)$ separately. Set
  #[#set math.equation(numbering: n => "(83)")
   $ v = e_2 - frac(d tilde(f) \( e_2 \), d tilde(f) \( e_1 \)) e_1 \, #h(2em) e = frac(v, \| v \|_h) . $ <env:old-test>]
  This vector is exactly transverse, is $e_2 + O \( eta \)$ after normalization, and has no fast-plane component. Consequently $Q \( e \, e \) = 0$ exactly. Moreover $chi s = epsilon.alt T arrow.r 0$ uniformly in this regime, so $a_(*) = A e_1 + o \( 1 \)$. Equations (82) and (80), using the stronger bounded-$T$ estimate before replacing it by $K_q T$, give
  $ Q \( a_(*) \, a_(*) \) gt.eq - A^2 #scale(x: 120%, y: 120%)[\(] 2 delta^2 parallel s' parallel_oo epsilon.alt T_0^2 + C eta^2 N #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  Also $cal(E) = o \( 1 \)$ uniformly by (80). The old-Hessian contribution, tested with (83), converges uniformly to its value at the cell center, where $e_2$ was chosen to maximize it. Those center values have a common positive lower bound, by strictness of $f$ on $overline(D)$. Thus the full expression is positive for sufficiently small $eta$. The two regimes cover every point of the perturbation; outside its support the original envelope is unchanged.
  ======= 7.1.4 A fixed gain and a small value change. <a-fixed-gain-and-a-small-value-change.>
  In every cell, (78) implies
  #[#set math.equation(numbering: n => "(84)")
   $ frac(\| a_(*) \|_h, A) = sqrt(1 + delta^2 chi^2 s^2) + O \( eta \) \, #h(2em) frac(\| a \|_h, A) = 1 + O \( eta \) . $ <env:norm-gain>]
  Choose $s_0 > 0$ such that the set $s gt.eq s_0$ has positive area in one fast-variable period. Since $epsilon.alt \/ eta = eta^2 arrow.r 0$, periodicity shows that a fixed fraction $beta > 0$ of each whole cell has both $chi = 1$ and $s gt.eq s_0$. The constant $beta$ depends only on the fixed cutoffs and metric comparison: the central cutoff box contains many fast periods, and the linear coordinate Jacobians and box-to-cell volume ratios have uniform bounds. Set
  $ gamma = sqrt(1 + delta^2 s_0^2) - 1 > 0 . $
  Integrating (84) on a cell yields
  $ integral_C \| a_(*) \|_h thin d x gt.eq integral_C \| a \|_h thin d x + A \( beta gamma - C eta \) \| C \| . $
  For sufficiently small $eta$, the last term is at least $A beta gamma \| C \| \/ 2$, while $integral_C \| a \|_h thin d x lt.eq 2 A \| C \|$. Thus (73) follows with $d_(*) = beta gamma \/ 4$, independently of the current strictness margin and derivative bounds.
  Finally, disjointness of the supports gives
  $ parallel tilde(f) - f parallel_oo lt.eq delta #scale(x: 120%, y: 120%)[\(] max_C A_C #scale(x: 120%, y: 120%)[\)] epsilon.alt parallel q parallel_oo \, $
  which tends to zero with the cell size. This proves the one-step assertion with any budget $b$. For any desired finite integral, a finite number of gains by $1 + d_(*)$ suffices. Assign these finitely many steps portions of the total sup-norm budget and choose each subdivision after fixing its current envelope. Their supports form a finite union compactly contained in $D$. Strictness and nonvanishing hold after every step. This is a finite construction of a smooth envelope, with no limit of envelopes required. ◻
]

===== 7.2 Separated envelope and background regions <separated-envelope-and-background-regions>

#thm([Lemma 27.])[
  (Gaps and arbitrary growth).  #emph[Fix $h in cal(U)$ with $"supp" \( h - g_0 \) subset.double P$. There are nested open coordinate boxes 
$ overline(D) union "supp" \( h - g_0 \) subset U_0 subset.double U_1 subset.double U_2 subset.double U_3 subset.double U_4 subset.double P . $

 For every $L_(*) > 0$ there is a smooth strict envelope $f$ for $h$ on a neighborhood of $overline(P)$, and a number $sigma > 0$, such that 
#[#set math.equation(numbering: n => "(85)")
 $ f > f_0 + sigma quad upright("on ") overline(U)_0 \, #h(2em) f < f_0 - sigma quad upright("on ") overline(P) \\ U_1 \,\
integral_D sqrt(2 + \| nabla_h f \|_h^2) thin d x > L_(*) . $ <env:gap-inequalities>]

 The envelope and all these patches are fixed before the frequency $k$ is chosen.]
] <env:gaps>

#proof[
  The indicated compact set lies inside the coordinate cube $P$, so nested coordinate boxes with these strict inclusions exist. Choose $zeta in C_c^oo \( U_1 \)$ equal to one on a neighborhood of $overline(U)_0$. For a sufficiently small fixed $tau > 0$,
  $ f^(\( 1 \)) = f_0 + tau \( 2 zeta - 1 \) $
  is still strict on a neighborhood of $overline(P)$, by the $C^2$-openness of (71). Its gaps relative to $f_0$ are exactly $tau$ on $overline(U)_0$ and $- tau$ outside $U_1$. Apply Lemma 26 finitely many times in $D$, with total sup-norm change less than $tau \/ 4$, to make $integral_D \| nabla_h f \|_h thin d x > L_(*)$. The resulting $f$ is unchanged outside a compact subset of $D$ and remains strict everywhere in question. Taking $sigma = tau \/ 2$ gives (85); the inequality $B gt.eq \| nabla_h f \|_h$ gives (85). ◻
]

==== 8 Finite-order waves and real noncancellation <sec:four-waves>

Fix the metric $h$, the envelope $f$, and the nested sets supplied by Lemma 27. We construct real quasimodes with arbitrarily small weighted residual and a quantitative lower bound on their value and first derivative taken together. This lower bound will allow the metric correction to divide locally by either the function or its squared gradient norm. All constants in this section may depend on the fixed data and on the finite accuracy requested below, but the displayed powers in the derivative and noncancellation bounds will not. Differentiation and distances refer to the fixed coordinates on $P$, unless a metric is specified.

===== 8.1 The localized packets <the-localized-packets>

At each $y in overline(U)_3$, choose three linearly independent vectors $b_j \( y \) in a \( y \)^perp$, $1 lt.eq j lt.eq 3$, such that

#[#set math.equation(numbering: n => "(86)")
 $ \| b_j \( y \) \|_h = B \( y \) \, #h(2em) H_y \( a \, a \) + H_y \( b_j \, b_j \) > 0 . $ <wave:transverse>]

Such triples exist: the strict envelope condition gives a nonempty open subset of the sphere of radius $B \( y \)$ in the three-dimensional space $a \( y \)^perp$, and every such open subset contains three linearly independent vectors. Each triple extends smoothly to a neighborhood, by projection into $a^perp$ and normalization. A finite cover of $overline(U)_3$ therefore allows the choices in (86) to have uniform positive strictness margins and uniformly positive Gram determinants. We choose one available triple at each center. No regularity of this choice as a function of the center is required. Write $b_j^flat = h_y \( b_j \, dot.op \)$ and

$ c_(y j) = frac(H_y \( a \, a \) + H_y \( b_j \, b_j \), \| a \( y \) \|_h^2 + \| b_j \( y \) \|_h^2) . $

These numbers have a positive lower bound and a finite upper bound.

#thm([Proposition 28.])[
  (Finite-order packets).  #emph[For any integers $ell \, J gt.eq 0$, and all sufficiently large integers $k$, there are packets indexed by 
$ Y_k = \( k^(- 1) bb(Z)^4 \) ∩ U_3 \, #h(2em) y in Y_k \, quad 1 lt.eq j lt.eq 3 \, $

 of the form 
#[#set math.equation(numbering: n => "(87)")
 $ p_(y j \, k) \( x \) = e^(k Phi_(y j) \( x \)) A_(y j \, k) \( x \) xi \( x - y \) . $ <wave:packet-form>]

 Here $xi$ is a smooth cutoff supported in a fixed small ball, equal to one in a smaller ball; all translated supporting balls lie in $P$. The phases are complex polynomials in $x - y$, and the amplitudes are polynomials of fixed finite degree in $x - y$ and $k^(- 1)$. Their coefficients are uniformly bounded over the centers and indices. They satisfy 
#[#set math.equation(numbering: n => "(88)")
 $ Phi_(y j) \( y \) & = f \( y \) \, & d Phi_(y j) \( y \) & = d f \( y \) + i b_j^flat \,\
Re "Hess"_h Phi_(y j) \( y \) & = H_y - c_(y j) h_y \, & A_(y j \, k) \( y \) & = 1 . $ <wave:packet-jets>]

 On each supporting ball, for positive constants $c \, C$, 
#[#set math.equation(numbering: n => "(89)")
 $ - C \| x - y \|^2 lt.eq Re Phi_(y j) \( x \) - f \( x \) lt.eq - c \| x - y \|^2 \, #h(2em) A_(y j \, k) \( x \) = 1 + O \( \| x - y \| + k^(- 1) \) . $ <wave:gaussian-bounds>]

 The amplitude and each of its fixed-order derivatives are uniformly bounded. For every fixed multi-index $alpha$, 
#[#set math.equation(numbering: n => "(90)")
 $ \| partial^alpha p_(y j \, k) \( x \) \| lt.eq C_alpha k^(\| alpha \|) e^(k f \( x \) - c k \| x - y \|^2) \, $ <wave:packet-derivatives>]

 after decreasing $c$ if necessary, and 
#[#set math.equation(numbering: n => "(91)")
 $ sup_(x in P) e^(- k f \( x \)) sum_(\| alpha \| lt.eq ell) \| partial^alpha \( Delta_h + Lambda_k \) p_(y j \, k) \( x \) \| lt.eq C_(ell \, J) k^(- J) . $ <wave:packet-residual>]

 The radii, coefficients, constants, and frequency threshold are fixed before $k$ varies.]
] <wave:packets>

#proof[
  We give a finite Taylor construction using the complex-phase WKB method; compare [4] Section 3. Fix a center and an index and temporarily suppress them. The eikonal equation is
  #[#set math.equation(numbering: n => "(92)")
   $ chevron.l d Phi \, d Phi chevron.r_h = - 2 \, $ <wave:eikonal>]
  with the complex bilinear extension of the metric pairing. Its constant term holds because $a perp b$ and $\| b \|_h^2 = 2 + \| a \|_h^2$. The degree-one condition is
  $ \( "Hess"_h Phi \)_y \( a + i b \, dot.op \) = 0 . $
  To prescribe the real Hessian, put $U = H_y - c_(y j) h_y$. A real symmetric form $V$ must then satisfy
  #[#set math.equation(numbering: n => "(93)")
   $ V \( b \, dot.op \) = U \( a \, dot.op \) \, #h(2em) V \( a \, dot.op \) = - U \( b \, dot.op \) . $ <wave:hessian-compatibility>]
  The two rows of a symmetric form have precisely one compatibility condition, namely $U \( a \, a \) + U \( b \, b \) = 0$. Our choice of $c_(y j)$ gives this identity. Define the remaining block of $V$ on ${ a \, b }^perp$ to be zero. Since $a \, b$ are orthogonal with lengths bounded above and away from zero, this constructs $V$ with uniformly bounded coefficients. Thus $U + i V$ is the required covariant Hessian; the connection converts it to the ordinary quadratic Taylor coefficients of $Phi$.
  For completeness, the higher homogeneous equations are also explicitly soluble. In coordinates write $v = a + i b$ and $D_v = v dot.op partial$. For a complex homogeneous polynomial $F_q$ of degree $q$, choose a complex linear function $zeta$ with $D_v zeta = 1$. For example,
  $ zeta \( z \) = frac(sum_i overline(v_i) z_i, sum_i \| v_i \|^2) . $
  Then
  #[#set math.equation(numbering: n => "(94)")
   $ cal(R)_q F_q = sum_(r = 0)^q frac(\( - 1 \)^r zeta^(r + 1), \( r + 1 \) !) D_v^r F_q \, #h(2em) D_v cal(R)_q F_q = F_q . $ <wave:jet-inverse>]
  The identity follows by telescoping after differentiation. This is a right inverse from degree $q$ to degree $q + 1$, with bounded norm for each fixed degree, uniformly in our data. For $q gt.eq 2$, the degree-$q$ eikonal equation contains the new degree-$\( q + 1 \)$ phase coefficient only as $2 D_v$ applied to it. All other coefficients in that equation have already been determined. Hence we can match (92) through any prescribed finite Taylor degree.
  The transport operator for the eigenvalue $Lambda_k = 2 k^2 + k$ is
  $ cal(T) = 2 "grad"_h Phi dot.op partial + Delta_h Phi + 1 . $
  Indeed, without the cutoff,
  #[#set math.equation(numbering: n => "(95)")
   $ e^(- k Phi) \( Delta_h + Lambda_k \) \( e^(k Phi) A_k \) = k^2 E A_k + k cal(T) A_k + Delta_h A_k \, #h(2em) E = chevron.l d Phi \, d Phi chevron.r_h + 2 . $ <wave:transport-identity>]
  Here is one finite choice of all the truncation orders. Set
  $ M = J + ell + 1 \, #h(2em) d = 2 J + 3 ell + 6 \, #h(2em) n_m = d + 2 \( M - m \) med \( 0 lt.eq m lt.eq M \) \, #h(2em) N = n_0 + 1 . $
  Construct $Phi$ of degree $N$ so that $E$ vanishes to order $N$ at the center. With this phase fixed, successively construct polynomials $A^(\( m \))$ of degree $n_m$, with $A^(\( 0 \)) \( y \) = 1$ and $A^(\( m \)) \( y \) = 0$ for $m gt.eq 1$, satisfying
  #[#set math.equation(numbering: n => "(96)")
   $ cal(T) A^(\( 0 \)) & = O \( \| x - y \|^(n_0) \) \,\
cal(T) A^(\( m \)) + Delta_h A^(\( m - 1 \)) & = O \( \| x - y \|^(n_m) \) #h(2em) \( 1 lt.eq m lt.eq M \) . $ <wave:finite-transports>]
  To see that this is possible, solve the homogeneous equations of degrees $q = 0 \, dots.h \, n_m - 1$ in order. The new coefficient of $A^(\( m \))$ has degree $q + 1$ and enters as $2 D_v$ applied to it, so (94) applies. The source $Delta_h A^(\( m - 1 \))$ uses coefficients of the preceding amplitude of degree at most $q + 2 lt.eq n_m + 1 < n_(m - 1)$. Those coefficients have already been retained. The tapering degrees thus ensure that no later truncation changes an earlier equation. Only finitely many jets of the smooth coefficients of $h$ are used. This argument is algebraic and makes no convergence assertion about an infinite formal series.
  Set $A_k = sum_(m = 0)^M k^(- m) A^(\( m \))$. All its fixed-order derivatives are bounded uniformly for $k gt.eq 1$, and it has the stated value and first-order estimate at the center. Every Taylor remainder in (96) vanishes to order at least $d$, and the eikonal remainder vanishes to still higher order. Uniform bounds for their differentiated remainders follow from ordinary smooth Taylor estimates and the finite bounded constructions above.
  The function $Re Phi - f$ has zero value and differential at the center. Its ordinary Hessian there is $- c_(y j) h_y$: the connection terms cancel because its differential is zero. Uniform Taylor bounds therefore give (89) after choosing a sufficiently small common radius. They also give the expansion, used below,
  #[#set math.equation(numbering: n => "(97)")
   $ d \( Re Phi_(y j) - f \) \( x \) = - c_(y j) h_y \( x - y \, dot.op \) + O \( \| x - y \|^2 \) . $ <wave:phase-expansion>]
  Choose $xi$ within this radius. Differentiating its product with the exponential and amplitude proves (90).
  Finally, for $q gt.eq 0$ the elementary Gaussian bound
  $ sup_(r gt.eq 0) r^q e^(- c k r^2) lt.eq C_q k^(- q \/ 2) $
  converts Taylor vanishing into powers of $k^(- 1)$. Through $ell$ derivatives, the terms in (95) that contain matched errors are bounded in the $e^(k f)$ scale by
  $ C k^(2 + ell - \( d - ell \) \/ 2) lt.eq C k^(- J - 1) . $
  The last uncancelled term is $k^(- M) Delta_h A^(\( M \))$; its corresponding bound is $C k^(ell - M) = C k^(- J - 1)$. Derivatives of $xi$ are supported at a fixed positive distance from the center and contribute an exponentially small remainder. This proves (91). Increasing the finite Taylor orders changes constants and radii, but introduces no new power of $k$ in (90). ◻
]

===== 8.2 A real Gaussian superposition <a-real-gaussian-superposition>

Fix a smooth function $omega$, compactly supported in $U_2$ and equal to one near $overline(U)_1$. For independent standard real Gaussian variables $G_(y j) \, G'_(y j)$ define

#[#set math.equation(numbering: n => "(98)")
 $ u = u_k^0 + omega Re sum_(y in Y_k) sum_(j = 1)^3 \( G_(y j) + i G'_(y j) \) p_(y j \, k) \, #h(2em) W = e^(k f) + e^(k f_0) quad upright("on ") P . $ <wave:random>]

The added term extends smoothly by zero to $M$. There are $O \( k^4 \)$ real Gaussian coefficients, and their coefficient event

$ cal(E)_k = { thin \| G_(y j) \| lt.eq k \, med \| G'_(y j) \| lt.eq k upright(" for all ") y \, j thin } $

satisfies $bb(P) \( cal(E)_k^c \) lt.eq C k^4 e^(- k^2 \/ 2)$.

#thm([Lemma 29.])[
  (Weighted residual bounds).  #emph[For any predetermined integers $ell \, J gt.eq 0$, choose the packets of Proposition 28 with derivative order $ell$ and residual power $J + 6$. On $cal(E)_k$, the function in (98) equals $u_k^0$ outside a compact subset of $U_2$, its residual $R = \( Delta_h + Lambda_k \) u$ is compactly supported in $U_2$, and 
#[#set math.equation(numbering: n => "(99)")
 $ sup_P W^(- 1) \| partial^alpha u \| & lt.eq C_alpha k^(\| alpha \| + 5) &  & upright("for every fixed ") alpha \,\
sup_P W^(- 1) sum_(\| alpha \| lt.eq ell) \| partial^alpha R \| & lt.eq C_(ell \, J) k^(- J) . $ <wave:u-derivatives>]

 In particular, the exponents in (99) are independent of $ell \, J$.]
] <wave:residual>

#proof[
  Summing (90) over $O \( k^4 \)$ packets and using the coefficient bound $k$ proves (99), including the fixed cutoff and the elementary bounds for $u_k^0$. The summed packet residual in (99) costs at most five powers of $k$.
  There are two other residual terms. The background residual is
  $ \( Delta_h + Lambda_k \) u_k^0 = \( Delta_h - Delta_(g_0) \) u_k^0 \, $
  supported in $"supp" \( h - g_0 \) subset U_0$. Each fixed-order derivative is bounded by a fixed power of $k$ times $e^(k f_0)$. The first gap of Lemma 27, $f > f_0 + sigma$ on $overline(U)_0$, makes this exponentially small relative to $W$. The commutator terms $\[ Delta_h \, omega \] p_(y j \, k)$ and their derivatives are supported outside $U_1$. There the opposite gap $f < f_0 - sigma$ makes their polynomial bounds times $e^(k f)$ exponentially small relative to $W$. These are all the residual terms. Their supports, and the exact background equation off $U_0$, prove the support assertion. ◻
]

===== 8.3 Five real directions prevent cancellation <five-real-directions-prevent-cancellation>

The correction in the next sections needs a real function whose value and gradient do not vanish together, with a quantitative lower bound in the scale $W$. Three transverse phase directions and one displaced packet supply the five independent real directions needed in dimension four.

#thm([Lemma 30.])[
  (Real noncancellation).  #emph[For every fixed choice of the preceding finite accuracy orders, the event 
#[#set math.equation(numbering: n => "(100)")
 $ cal(G)_k = cal(E)_k ∩ {thin \| \( u \( x \) \, k^(- 1) d u \( x \) \) \| gt.eq k^(- 200) W \( x \) upright(" for every ") x in overline(U)_2 thin} $ <wave:good-event>]

 has probability tending to one as $k arrow.r oo$. The norm in this formula is the Euclidean norm on the value and four coordinate derivatives. The power $200$ is independent of the requested accuracy.]
] <wave:noncancellation>

#proof[
  Put $cal(V)_k = W^(- 1) \( u \, k^(- 1) d u \)$. First consider a point where
  #[#set math.equation(numbering: n => "(101)")
   $ e^(k f \( x \)) < k^(- 8) W \( x \) . $ <wave:low-regime>]
  On $cal(E)_k$ the random contribution to the unscaled value and normalized gradient is at most $C k^5 e^(k f \( x \)) lt.eq C k^(- 3) W \( x \)$. The background gradient bound in Lemma 25 gives
  $ \| \( u_k^0 \, k^(- 1) d u_k^0 \) \| gt.eq c e^(k f_0 \( x \)) gt.eq c \( 1 - k^(- 8) \) W \( x \) . $
  Thus $\| cal(V)_k \( x \) \|$ is bounded below by a fixed positive number throughout this regime, for all large $k$.
  It remains to estimate small-ball probabilities at a fixed point $x in overline(U)_2$ with
  #[#set math.equation(numbering: n => "(102)")
   $ e^(k f \( x \)) gt.eq k^(- 8) W \( x \) . $ <wave:high-regime>]
  The gap $f < f_0 - sigma$ outside $U_1$ implies that, for large $k$, such a point lies where $omega = 1$ on a neighborhood. Thus no derivative of $omega$ enters this calculation. Choose a grid center $y$ within $C k^(- 1)$ of $x$, and another center $y'$ within $C k^(- 1)$ of
  $ x + k^(- 1 \/ 2) nu \, #h(2em) nu = frac(a \( x \), \| a \( x \) \|_h) \, $
  viewing the tangent vector in the fixed coordinates. The compact inclusion $overline(U)_2 subset U_3$ ensures that both centers belong to $Y_k$. They are distinct for all large $k$. The cutoff $xi$ is one at $x$ for each selected packet.
  For the three packets at $y$ and the packet with index $1$ at $y'$, the positive numbers
  $ beta_(z j) = e^(- k f \( x \)) \| p_(z j \, k) \( x \) \| #h(2em) \( z = y upright(" or ") y' \) $
  are bounded above and away from zero. This follows from both sides of (89), since $\| x - z \| = O \( k^(- 1 \/ 2) \)$, and from $A_(z j \, k) \( x \) = 1 + O \( k^(- 1 \/ 2) \)$.
  At this fixed evaluation point, rotate the two Gaussian coordinates of each selected packet by the argument of $p_(z j \, k) \( x \)$. This is a fixed orthogonal change of its two real coordinates, preserving their independent standard Gaussian distribution. After factoring out $beta_(z j)$, the two columns of the evaluation map in the $e^(k f \( x \))$ scale are, up to changing the sign of the second coordinate,
  #[#set math.equation(numbering: n => "(103)")
   $ vec(1, d Re Phi_(z j) \( x \) + k^(- 1) Re \( A_(z j \, k)^(- 1) d A_(z j \, k) \) \( x \)) \, #h(2em) vec(0, d Im Phi_(z j) \( x \) + k^(- 1) Im \( A_(z j \, k)^(- 1) d A_(z j \, k) \) \( x \)) . $ <wave:real-columns>]
  The rotation is held fixed in computing these derivatives. The logarithmic amplitude derivatives appearing here are uniformly bounded at the selected points.
  Select the first column for the packet $\( y \, 1 \)$, the second columns for $\( y \, 1 \) \, \( y \, 2 \) \, \( y \, 3 \)$, and the first column for $\( y' \, 1 \)$. These are five independent real Gaussian coordinates: the first two come from the same orthogonally rotated Gaussian pair, and the other three come from different pairs. The near-center columns have the forms
  $ \( 1 \, d f \( x \) + O \( k^(- 1) \) \) \, #h(2em) \( 0 \, b_j^flat \( y \) + O \( k^(- 1) \) \) quad \( 1 lt.eq j lt.eq 3 \) . $
  For the displaced first column, (97) gives
  $ d Re Phi_(y' 1) \( x \) - d f \( x \) & = - c_(y' 1) h_(y') \( x - y' \, dot.op \) + O \( k^(- 1) \)\
 & = k^(- 1 \/ 2) c_(y' 1) h_x \( nu \, dot.op \) + O \( k^(- 1) \) . $
  Subtracting the near first column from this column leaves zero in the value component. Multiplying the resulting column by $k^(1 \/ 2)$ leaves the derivative covector $c_(y' 1) h_x \( nu \, dot.op \) + O \( k^(- 1 \/ 2) \)$. The other three derivative covectors are uniformly independent in $a \( y \)^perp$. Since $\| x - y \| = O \( k^(- 1) \)$, they remain uniformly independent together with $h_x \( nu \, dot.op \)$. This comparison uses smoothness of $a \, h$, and does not compare the triples chosen at different centers. The determinant of these five amplitude-factored columns is therefore at least $c k^(- 1 \/ 2)$ in absolute value. Restoring the four bounded positive packet amplitudes, with the amplitude of $\( y \, 1 \)$ used twice, preserves this lower bound.
  Changing the normalization from $e^(k f \( x \))$ to $W \( x \)$ multiplies each of the five columns by $e^(k f \( x \)) \/ W \( x \) gt.eq k^(- 8)$. Their determinant in the $W$ scale is consequently at least $c k^(- 40 - 1 \/ 2)$. Condition on all the unused rotated Gaussian coordinates. The selected five are still independent standard real Gaussians; the conditioned coordinates and the deterministic background give an arbitrary translation. Change of variables in their bounded Gaussian density now yields, unconditionally as well,
  #[#set math.equation(numbering: n => "(104)")
   $ bb(P) { thin \| cal(V)_k \( x \) \| < r thin } lt.eq C k^41 r^5 #h(2em) \( r > 0 \) $ <wave:small-ball>]
  at every point in (102). This estimate has not conditioned on the coefficient event $cal(E)_k$.
  Take a net of mesh at most $k^(- 208)$ in the compact coordinate set $overline(U)_2$. It has $O \( k^832 \)$ points. At its high-regime points apply (104) with $r = 2 k^(- 200)$. The probability of any such small value is at most
  $ C k^(832 + 41 - 1000) = C k^(- 127) . $
  At its low-regime points the preceding deterministic bound applies on $cal(E)_k$. Thus, outside an event of probability tending to zero, all net values have norm at least $2 k^(- 200)$ and $cal(E)_k$ holds.
  To pass from the net to the whole set, note that
  $ W^(- 1) \| partial^alpha W \| lt.eq C_alpha k^(\| alpha \|) \, #h(2em) \| d log W \| lt.eq C k . $
  Together with (99) through order two, these give $parallel d cal(V)_k parallel lt.eq C k^6$ on $cal(E)_k$. The net interpolation error is at most $C k^(6 - 208) = C k^(- 202)$, which is smaller than $k^(- 200)$ for all large $k$. This proves (100), even when a point and its chosen net point belong to different regimes. Intersecting the coefficient and net events used only a union bound, so no assertion about a truncated Gaussian density is needed. ◻
]

==== 9 Stable sign data and nodal measure <sec:signs>

Fix the data of Lemma 27, and recall that $B = sqrt(2 + \| nabla_h f \|_h^2)$. We select one of the real quasimodes from Section 8 with many strict opposite-sign tests along short coordinate segments. The score bounds nodal measure from below, and every fixed strict lower bound for it survives sufficiently small uniform perturbations of the function. All limits in this section hold with the data and requested packet accuracy fixed. The positive constants in the score and measure bounds, however, depend only on the fixed chart and metric comparability throughout $cal(U)$.

#prodef([Definition 31.])[
  (Sign score).  Subdivide $D$, up to its grid boundaries, into finitely many disjoint open coordinate cubes $Q$, fine enough that numbers $B_Q > 0$ satisfy
  $ B_Q lt.eq B \( x \) lt.eq 2 B_Q #h(2em) \( x in Q \) . $
  Choose $c_0 > 0$ as in Lemma 33 below and put
  $ ell_Q = frac(c_0, k B_Q) \, #h(2em) Q^(-) = { x in Q : "dist"_oo \( x \, partial Q \) > ell_Q } \, #h(2em) T_k = sum_Q ell_Q^(- 1) \| Q \| . $
  For a real continuous function $psi$ on $M$, define
  #[#set math.equation(numbering: n => "(105)")
   $ cal(S) \( psi \) = sum_Q ell_Q^(- 1) integral_(Q^(-)) sum_(i = 1)^4 upright(bold(1))_({ psi \( x \) psi \( x + ell_Q d_i \) < 0 }) thin d x \, $ <score:formula>]
  where $d_i$ are the four coordinate unit vectors and $\| Q \|$ denotes coordinate volume. The subdivision and $k$ are part of the score’s definition and remain fixed when $psi$ varies.
] <score:definition>

In particular, $0 lt.eq cal(S) \( psi \) lt.eq 4 T_k$. If $psi_n arrow.r psi$ uniformly, every strictly negative endpoint product for $psi$ is eventually negative for $psi_n$. Fatou’s Lemma gives

#[#set math.equation(numbering: n => "(106)")
 $ cal(S) \( psi \) lt.eq liminf_(n arrow.r oo) cal(S) \( psi_n \) . $ <score:lsc>]

Multiplication by a positive continuous function, or by a nonzero real constant, preserves every endpoint-sign comparison and hence the score.

#thm([Lemma 32.])[
  (The score bounds nodal measure).  #emph[There is $c_(upright(H)) > 0$, independent of the subdivision, $k$, and the envelope, such that, for every $g in cal(U)$ and every real $psi in C \( M \)$, 
#[#set math.equation(numbering: n => "(107)")
 $ cal(H)_g^3 \( { psi = 0 } \) gt.eq c_(upright(H)) cal(S) \( psi \) . $ <score:hausdorff>]

]
] <score:measure>

#proof[
  Write $Z = { psi = 0 }$ and, for fixed $Q \, i$, let $E_(Q i)$ be the set indicated in the integrand of (105). This is a Borel set. The full segment from $x$ to $x + ell_Q d_i$ lies in $Q$ when $x in Q^(-)$. The Intermediate Value Theorem therefore gives, in coordinate space,
  $ E_(Q i) subset \( Z ∩ Q \) - \[ 0 \, ell_Q \] d_i . $
  Cover $Z ∩ Q$ by countably many Euclidean balls of radii $r_j < delta$. The backward sweep of each ball is a cylinder with rounded ends whose four-dimensional volume is at most $C \( ell_Q r_j^3 + r_j^4 \)$. Countable subadditivity yields
  $ \| E_(Q i) \| lt.eq C \( ell_Q + delta \) sum_j r_j^3 . $
  If the coordinate Hausdorff three-measure of $Z ∩ Q$ is finite, take the infimum over such covers and then let $delta arrow.b 0$. The definition of Hausdorff measure, with the harmless dimensional factor converting diameters to ball radii, gives
  #[#set math.equation(numbering: n => "(108)")
   $ ell_Q^(- 1) \| E_(Q i) \| lt.eq C cal(H)_(upright("Eucl"))^3 \( Z ∩ Q \) . $ <score:sweep>]
  If this Hausdorff measure is infinite, the same inequality is immediate. This proof uses only measurable covering cylinders and does not require any regularity of $Z$.
  To compare the two Hausdorff measures, multiply each coordinate function by a smooth cutoff equal to one near $overline(D)$ and compactly supported in $P$, and extend by zero to $M$. The resulting smooth map $F : M arrow.r bb(R)^4$ agrees with the coordinate map near $overline(D)$. Uniform metric comparability bounds $\| d F \|_g$ by a fixed constant. Integrating along curves shows that $F$ is globally Lipschitz for the Riemannian distance of every $g in cal(U)$. Thus
  $ cal(H)_(upright("Eucl"))^3 \( Z ∩ Q \) lt.eq C cal(H)_g^3 \( Z ∩ Q \) . $
  Sum (108) over the four directions and the disjoint open cubes. The sets $Z ∩ Q$ are disjoint Borel sets, so their Hausdorff measures sum to at most $cal(H)_g^3 \( Z \)$. This proves (107), including the case of infinite measure. ◻
]

#thm([Lemma 33.])[
  (Expected score).  #emph[One can choose $c_0 > 0$ and $c_(upright(E)) > 0$, using only uniform metric comparability, such that the Gaussian superposition (98) satisfies, for all sufficiently large integers $k$, 
#[#set math.equation(numbering: n => "(109)")
 $ bb(E) cal(S) \( u \) gt.eq c_(upright(E)) T_k . $ <score:expected>]

 The threshold for $k$ may depend on all fixed data, including the envelope and the packet accuracy, whereas $c_0 \, c_(upright(E))$ do not.]
] <score:expectation>

#proof[
  On $D$ the macroscopic cutoff is one. Normalize the random part by $e^(k f \( x \))$ and write
  $ v_(y j) \( x \) = e^(- k f \( x \)) p_(y j \, k) \( x \) \, #h(2em) X \( x \) = "Re" sum_(y \, j) \( G_(y j) + i G'_(y j) \) v_(y j) \( x \) . $
  The two Gaussian coefficients of each packet are independent, so
  #[#set math.equation(numbering: n => "(110)")
   $ "Var" X \( x \) = sum_(y \, j) \| v_(y j) \( x \) \|^2 \, #h(2em) "Cov" \( X \( x \) \, X \( x' \) \) = sum_(y \, j) "Re" #scale(x: 120%, y: 120%)[\(] v_(y j) \( x \) overline(v_(y j) \( x' \)) #scale(x: 120%, y: 120%)[\)] . $ <score:covariance>]
  The nearest grid center is at distance $O \( k^(- 1) \)$ from $x$ and lies in $U_3$. The two-sided quadratic phase bounds and the amplitude estimate in Proposition 28 show that its normalized packet has absolute value bounded below by a positive constant. Hence $"Var" X \( x \) gt.eq c > 0$, uniformly on $D$ for the fixed data.
  Fix $x in Q^(-)$ and put $x_i = x + ell_Q d_i$. Call a packet near if $\| y - x \| lt.eq k^(- 2 \/ 5)$. For all other packets, both $x$ and $x_i$ are at distance at least $1 / 2 k^(- 2 \/ 5)$ from the center for large $k$. The Gaussian decay and the $O \( k^4 \)$ packet count bound their total contributions to the variances and covariances by $C k^4 e^(- c k^(1 \/ 5))$. These are negligible even relative to the positive variance lower bound.
  For near packets the cutoff is one at both endpoints. Put $beta_(y j) = b_j^flat \( y \)$. Along the segment,
  $ d \( Phi_(y j) - f \) = i beta_(y j) + O \( k^(- 2 \/ 5) \) . $
  The packet amplitudes are $1 + O \( \| x - y \| + k^(- 1) \)$, so their endpoint ratios tend uniformly to one. Since $k ell_Q = c_0 \/ B_Q$ is bounded, integration of the preceding differential identity gives
  #[#set math.equation(numbering: n => "(111)")
   $ v_(y j) \( x_i \) = v_(y j) \( x \) (exp #h(-0.16667em) (frac(i c_0 beta_(y j) \( d_i \), B_Q)) + o \( 1 \)) . $ <score:endpoints>]
  Every error here is uniform over the indicated points and packets for the fixed data; smooth dependence of $b_j \( y \)$ on the center is not needed.
  Let $S_0 = sum_(upright("near")) \| v_(y j) \( x \) \|^2$. The nearest packet gives $S_0 gt.eq c$, while (111) and the tail estimate show that the two endpoint variances are $S_0 \( 1 + o \( 1 \) \)$. Thus their centered Gaussian correlation is
  #[#set math.equation(numbering: n => "(112)")
   $ cal(R)_i = sum_(upright("near")) frac(\| v_(y j) \( x \) \|^2, S_0) cos #h(-0.16667em) (frac(c_0 beta_(y j) \( d_i \), B_Q)) + o \( 1 \) . $ <score:correlation>]
  Uniform metric comparability, $\| b_j \( y \) \|_h = B \( y \)$, and continuity of the fixed $B$ give constants $a_0 \, a_1 > 0$, independent of the envelope, with
  $ a_0 B_Q lt.eq \| beta_(y j) \|_(upright("Eucl")) lt.eq a_1 B_Q #h(2em) upright("for every near packet and all sufficiently large ") k . $
  Indeed $B \( x \) in \[ B_Q \, 2 B_Q \]$, and $B \( y \) \/ B \( x \) arrow.r 1$ uniformly when $\| y - x \| lt.eq k^(- 2 \/ 5)$. Choose $c_0 a_1 lt.eq 1$. The elementary inequality $1 - cos s gt.eq s^2 \/ 4$ for $\| s \| lt.eq 1$ implies
  $ sum_(i = 1)^4 (1 - cos frac(c_0 beta_(y j) \( d_i \), B_Q)) gt.eq frac(c_0^2 \| beta_(y j) \|_(upright("Eucl"))^2, 4 B_Q^2) gt.eq kappa > 0 \, $
  where $kappa$ is independent of the envelope. The weights in (112) are the same for all four coordinate directions. Weighted averaging therefore gives $sum_i \( 1 - cal(R)_i \) gt.eq kappa \/ 2$, so for at least one $i$, $cal(R)_i lt.eq 1 - kappa \/ 8$. This bound uses the length of each carrier covector, not the Gram determinant of the triple chosen at its center; hence $kappa$ is uniform over the amplified envelopes.
  For centered Gaussian variables with positive variances and correlation $r in \[ - 1 \, 1 \]$, the probability of opposite signs is $arccos \( r \) \/ pi$. To see this, express the variables as projections of a standard planar Gaussian onto unit vectors with angle $arccos r$ and use rotation invariance; the degenerate endpoints follow directly. Therefore
  $ sum_(i = 1)^4 bb(P) { X \( x \) X \( x_i \) < 0 } gt.eq q_0 > 0 $
  with $q_0$ independent of the envelope.
  The normalized deterministic mean is $m \( x \) = e^(k \( f_0 \( x \) - f \( x \) \)) cos \( k phi.alt \( x \) \)$, with $\| m \( x \) \| lt.eq e^(- k sigma)$ on $D$ by Lemma 27. For a centered one-dimensional Gaussian of standard deviation $s > 0$, adding a mean $m$ changes its sign with probability at most $bb(P) { \| X \| lt.eq \| m \| } lt.eq C \| m \| \/ s$. The variance lower bounds at both endpoints consequently change each opposite-sign probability by $o \( 1 \)$, uniformly in $x$. Thus
  $ sum_(i = 1)^4 bb(P) { u \( x \) u \( x_i \) < 0 } gt.eq q_0 \/ 2 $
  for large $k$. Tonelli’s Theorem and $\| Q^(-) \| \/ \| Q \| arrow.r 1$ for the fixed finite subdivision now prove (109) with, for example, $c_(upright(E)) = q_0 \/ 4$. ◻
]

#thm([Proposition 34.])[
  (A simultaneous good realization).  #emph[For every predetermined pair of finite orders $ell \, J gt.eq 0$, all sufficiently large integers $k$ admit a choice of the real Gaussian coefficients for which the smooth real function $u$ satisfies 
#[#set math.equation(numbering: n => "(113)")
 $ & u = u_k^0 quad upright("outside a compact subset of ") U_2 \, #h(2em) "supp" R subset.double U_2 \, #h(2em) R = \( Delta_h + Lambda_k \) u \,\
 & sup_P W^(- 1) sum_(\| alpha \| lt.eq ell) \| partial^alpha R \| lt.eq C_(ell \, J) k^(- J) \,\
 & W^(- 1) \| partial^alpha u \| lt.eq C_alpha k^(\| alpha \| + 5) quad upright("on ") P upright(" for every fixed multi-index ") alpha \,\
 & \| \( u \, k^(- 1) d u \) \| gt.eq k^(- 200) W quad upright("on ") overline(U)_2 \,\
 & cal(S) \( u \) gt.eq c_(upright(s)) k integral_D B \( x \) thin d x . $ <score:support>]

 Here $c_(upright(s)) > 0$ is independent of the envelope and the accuracy orders. The constants $C_(ell \, J) \, C_alpha$ and the frequency threshold may depend on these fixed data, but the polynomial exponents in these bounds do not increase with the residual accuracy.]
] <score:good>

#proof[
  Choose the packet accuracy in Lemma 29 to give (113). Let $G_k$ be the event in Lemma 30: all coefficients have absolute value at most $k$, and the stated noncancellation bound holds. Its probability tends to one, and its coefficient bound gives the support, residual, and derivative conclusions above. By Lemma 33 and the deterministic upper bound $cal(S) lt.eq 4 T_k$,
  $ bb(E) #scale(x: 120%, y: 120%)[\[] cal(S) \( u \) upright(bold(1))_(G_k) #scale(x: 120%, y: 120%)[\]] gt.eq #scale(x: 120%, y: 120%)[\(] c_(upright(E)) - 4 bb(P) \( G_k^c \) #scale(x: 120%, y: 120%)[\)] T_k gt.eq c_(upright(E)) / 2 T_k $
  for all large $k$. Hence there is a realization in $G_k$ with $cal(S) \( u \) gt.eq c_(upright(E)) T_k \/ 4$. This conclusion uses no independence between the score and $G_k$. Finally,
  $ T_k = k / c_0 sum_Q B_Q \| Q \| gt.eq frac(k, 2 c_0) integral_D B \( x \) thin d x \, $
  so (113) holds with $c_(upright(s)) = c_(upright(E)) \/ \( 8 c_0 \)$. ◻
]

==== 10 Realization by an ordinary metric <sec:correction>

We now turn a sufficiently accurate real quasimode into an exact eigenfunction of an ordinary four-dimensional metric. The construction preserves signs and retains a region on which both the metric and the eigenfunction are the explicit background ones. In this section all $C^r$ norms are taken in fixed finite coordinate charts. Constants may depend on the fixed background and patches, but not on $k$.

#thm([Lemma 35.])[
  (Ordinary-metric realization).  #emph[Fix the background $M \, g_0 \, P \, u_k^0 \, Lambda_k$ of Lemma 25, patches $U_2 subset.double U_3 subset.double U_4 subset.double P$, a smooth metric $h$ such that $h - g_0$ has compact support in $U_2$, and a fixed smooth function $f$ on a neighborhood of $overline(P)$. Put 
$ W = e^(k f) + e^(k f_0) . $

 For every integer $p gt.eq 0$ and every $L > 0$, there are finite integers $ell \, J$ with the following property. Suppose smooth real functions $u = u_k$, for arbitrarily large integers $k$, satisfy 
#[#set math.equation(numbering: n => "(C1)")
 $ & "supp" \( u - u_k^0 \) subset.double U_2 \, #h(2em) "supp" R subset.double U_2 \, #h(2em) R = \( Delta_h + Lambda_k \) u \,\
 & W^(- 1) \| partial^alpha u \| lt.eq C_alpha k^(\| alpha \| + 5) quad upright("on ") P \, quad \| alpha \| lt.eq ell + 1 \,\
 & #scale(x: 120%, y: 120%)[\(] u^2 + k^(- 2) \| d u \|_(upright("Euc"))^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) gt.eq k^(- 200) W quad upright("on ") overline(U)_2 \,\
 & W^(- 1) \| partial^alpha R \| lt.eq C_R k^(- J) quad upright("on ") P \, quad \| alpha \| lt.eq ell . $ <corr:support>]

 The constants in these estimates are independent of $k$; the supports in (C1) need not be independent of $k$. For all sufficiently large such $k$, there are a smooth ordinary metric $g_(*)$ and a smooth positive function $b_(*)$ on $M$ such that 
$ parallel g_(*) - h parallel_(C^p) = O \( k^(- L) \) \, #h(2em) t = b_(*) u \, #h(2em) \( Delta_(g_(*)) + Lambda_k \) t = 0 . $

 Moreover, $g_(*) - g_0$ and $t - u_k^0$ have compact support in $U_4$. In particular, the zero set and every strict sign comparison of $u$ are preserved.]
] <corr:realization>

The preceding sections supply all the hypotheses of Lemma 35. Its proof below does not use the strict envelope inequality; that inequality was needed to construct the quasimode. The essential geometric input here is the clean collar $U_4 \\ overline(U)_2$, where $h = g_0$, $u = u_k^0$, and the background gradient has a quantitative lower bound.

===== 10.1 Exact correction with an independent density <exact-correction-with-an-independent-density>

We first allow the principal tensor and divergence density to vary independently. The scalar $theta.alt$ below is a density increment; the symbol $d$ continues to denote differentiation.

#thm([Lemma 36.])[
  (Weighted correction).  #emph[Under (C1)–(C1), there are a smooth symmetric contravariant tensor $F$ and a smooth scalar $theta.alt$, both compactly supported in $U_2$, such that 
#[#set math.equation(numbering: n => "(114)")
 $ "div"_h #scale(x: 120%, y: 120%)[\(] \( h^(- 1) + F \) thin d u #scale(x: 120%, y: 120%)[\)] + Lambda_k \( 1 + theta.alt \) u = 0 . $ <corr:weighted-equation>]

 For each integer $0 lt.eq r lt.eq ell - 1$, their estimates through order $r$ use only derivatives of $u$ through order $r + 2$ and of $R$ through order $r + 1$. A fixed finite exponent $E_r$, independent of $J$, satisfies 
#[#set math.equation(numbering: n => "(115)")
 $ parallel F parallel_(C^r) + parallel theta.alt parallel_(C^r) lt.eq C_r k^(E_r - J) \; #h(2em) E_r = 1000 \( r + 2 \) quad upright("is sufficient") . $ <corr:weighted-estimate>]

]
] <corr:weighted>

#proof[
  Choose a fixed smooth function $gamma_0 : bb(R) arrow.r \[ 0 \, 1 \]$, equal to one on $\[ - 1 \/ 4 \, 1 \/ 4 \]$ and supported in $\( - 1 \/ 2 \, 1 \/ 2 \)$, and set on $U_2$
  $ gamma = gamma_0 \( k^200 u \/ W \) . $
  On the support of $gamma$, (C1) gives $\| d u \|_h gt.eq c k^(- 199) W$. Wherever $1 - gamma eq.not 0$, $\| u \| gt.eq 1 / 4 k^(- 200) W$. Define on $U_2$
  #[#set math.equation(numbering: n => "(116)")
   $ F & = - u gamma R \| d u \|_h^(- 2) h^(- 1) \,\
theta.alt & = Lambda_k^(- 1) (- \( 1 - gamma \) R / u + "div"_h #scale(x: 120%, y: 120%)[\(] gamma R \| d u \|_h^(- 2) "grad"_h u #scale(x: 120%, y: 120%)[\)]) . $ <corr:F>]
  Each quotient is used only where its denominator is nonzero. Extend the cutoff quotient by zero on the unused part of its domain. This is smooth: near a zero of $d u$, the first cutoff is identically zero, and near a zero of $u$, the second cutoff is identically zero. The support condition on $R$ then permits smooth extension of both corrections by zero to $M$, including the divergence term.
  Put $q = gamma R \| d u \|_h^(- 2)$. The product rule gives the exact identities
  $ "div"_h \( F d u \) & = - gamma R - u "div"_h \( q "grad"_h u \) \,\
Lambda_k theta.alt u & = - \( 1 - gamma \) R + u "div"_h \( q "grad"_h u \) . $
  Adding these identities to the definition of $R$ proves (114), also at the zeros of $u$, by smoothness.
  For the estimates, use normalized quantities
  $ a_0 = u \/ W \, #h(2em) beta = d u \/ W \, #h(2em) r_0 = R \/ W . $
  All exponentially varying factors cancel from the formulas:
  #[#set math.equation(numbering: n => "(117)")
   $ F & = - a_0 gamma r_0 \| beta \|_h^(- 2) h^(- 1) \,\
q "grad"_h u & = gamma r_0 \| beta \|_h^(- 2) beta^(sharp_h) \, #h(2em) \( 1 - gamma \) R \/ u = \( 1 - gamma \) r_0 \/ a_0 . $ <corr:normalized-F>]
  Since $f \, f_0$ are fixed, differentiation of their exponentials and the reciprocal of their positive sum gives
  $ \| partial^j W \| lt.eq C_j k^j W \, #h(2em) \| partial^j \( W^(- 1) \) \| lt.eq C_j k^j W^(- 1) . $
  Consequently, for every required order $j$,
  #[#set math.equation(numbering: n => "(118)")
   $ \| partial^j a_0 \| lt.eq C_j k^(j + 5) \, #h(2em) \| partial^j beta \| lt.eq C_j k^(j + 6) \, #h(2em) \| partial^j r_0 \| lt.eq C_j k^(j - J) . $ <corr:normalized-bounds>]
  Here and below a bound on $partial^j$ means the bound for every multi-index of that length. The chain and quotient rules give, on the respective cutoff domains,
  $ \| partial^j gamma \| & lt.eq C_j k^(206 j) \, quad j gt.eq 1 \,\
\| partial^j \( a_0^(- 1) \) \| & lt.eq C_j k^(200 + 206 j) \,\
\| partial^j \( \| beta \|_h^(- 2) \) \| & lt.eq C_j k^(398 + 411 j) . $
  For example, $\| beta \|_h^2 gt.eq c k^(- 398)$ on the first domain, and $\| partial^j \( \| beta \|_h^2 \) \| lt.eq C_j k^(j + 12)$. Each term in its differentiated reciprocal has at most $j$ differentiated factors, which proves the last displayed bound. These deliberately generous powers also bound derivatives at cutoff interfaces. Substitution into (117)–(117), with one extra derivative for the divergence in (116), proves (115). In particular, the loss depends only on the requested derivative order and the fixed exponent in (C1), and does not grow when $J$ is increased. ◻
]

Take the residual accuracy high enough that $F$ and $theta.alt$ are small. Then $h^(- 1) + F$ is positive definite and $1 + theta.alt > 0$. Define an ordinary metric $h_1$, a positive weight $w$, a real function $v$, and a potential $V_0$ by

#[#set math.equation(numbering: n => "(119)")
 $ h_1^(- 1) & = frac(h^(- 1) + F, 1 + theta.alt) \, & w & = \( 1 + theta.alt \) frac(d upright("vol")_h, d upright("vol")_(h_1)) \,\
v & = w^(1 \/ 2) u \, & V_0 & = frac(Delta_(h_1) \( w^(1 \/ 2) \), w^(1 \/ 2)) . $ <corr:conjugation-data>]

The quotient of volume elements means the quotient of their positive densities. Dividing (114) by its density yields

$ Delta_(h_1) u + chevron.l d log w \, d u chevron.r_(h_1) + Lambda_k u = 0 . $

If $s_0 = w^(1 \/ 2)$, the product rule cancels the first-order term:

$ Delta_(h_1) \( s_0 u \) = s_0 Delta_(h_1) u + 2 chevron.l d s_0 \, d u chevron.r_(h_1) + u Delta_(h_1) s_0 = \( V_0 - Lambda_k \) s_0 u . $

Thus

#[#set math.equation(numbering: n => "(120)")
 $ Delta_(h_1) v = \( V_0 - Lambda_k \) v . $ <corr:potential-equation>]

The quantities $h_1 - h \, w - 1 \, V_0$ have compact support in $U_2$, and $v = u_k^0$ outside a compact subset of $U_2$. For any fixed integer $m$, smooth matrix inversion, the determinant formula for volume, and two differentiations in $V_0$ give

#[#set math.equation(numbering: n => "(121)")
 $ parallel h_1 - h parallel_(C^(m + 2)) + parallel w - 1 parallel_(C^(m + 2)) + parallel V_0 parallel_(C^m) lt.eq C_m #scale(x: 120%, y: 120%)[\(] parallel F parallel_(C^(m + 2)) + parallel theta.alt parallel_(C^(m + 2)) #scale(x: 120%, y: 120%)[\)] \, $ <corr:potential-estimate>]

whenever the right-hand side is sufficiently small.

===== 10.2 A conformal equation with a coercive linearization <a-conformal-equation-with-a-coercive-linearization>

For a positive function $Z$, the four-dimensional conformal transformation $g = Z^2 h_1$, $t = v \/ Z$, gives

#[#set math.equation(numbering: n => "(122)")
 $ Delta_g t = Z^(- 4) "div"_(h_1) #scale(x: 120%, y: 120%)[\(] Z^2 "grad"_(h_1) \( v \/ Z \) #scale(x: 120%, y: 120%)[\)] = Z^(- 4) #scale(x: 120%, y: 120%)[\(] Z Delta_(h_1) v - v Delta_(h_1) Z #scale(x: 120%, y: 120%)[\)] . $ <corr:conformal-identity>]

Together with (120), this shows that the equation

#[#set math.equation(numbering: n => "(123)")
 $ Delta_(h_1) Z = V_0 Z + Lambda_k \( Z^3 - Z \) $ <corr:Z-equation>]

is sufficient for $\( Delta_g + Lambda_k \) t = 0$.

#thm([Lemma 37.])[
  (The conformal factor).  #emph[Fix the smooth metric $h$ on the closed four-manifold $M$, and an even integer $s > 2$. There are $delta > 0$ and $C_s$, depending only on $h \, s$ and the fixed Sobolev norms, with the following property. If $h_1 \, V_0$ are smooth, 
$ parallel h_1 - h parallel_(C^s) + parallel V_0 parallel_(H^s) lt.eq delta \, #h(2em) Lambda gt.eq 1 \, $

 then 
$ Delta_(h_1) Z = V_0 Z + Lambda \( Z^3 - Z \) $

 has a smooth positive solution satisfying 
#[#set math.equation(numbering: n => "(124)")
 $ parallel Z - 1 parallel_(H^s) lt.eq C_s Lambda^(- 1) parallel V_0 parallel_(H^s) . $ <corr:Z-smallness>]

]
] <corr:conformal>

#proof[
  Use the real Sobolev spaces of the fixed metric $h$. The standard elliptic spectral and Sobolev theorems give the eigenbasis for $- Delta_h$, the equivalence of the usual even-order Sobolev norms with the norms defined by powers of $1 - Delta_h$, and the algebra property of $H^s$ for $s > 2$ [21,22]. If $mu gt.eq 0$ is a spectral value of $- Delta_h$, the inverse of $L_Lambda = Delta_h - 2 Lambda$ has multiplier $- 1 \/ \( mu + 2 Lambda \)$. In the spectral Sobolev norms, therefore,
  #[#set math.equation(numbering: n => "(125)")
   $ parallel L_Lambda^(- 1) parallel_(H^s arrow.r H^s) & lt.eq \( 2 Lambda \)^(- 1) \,\
parallel L_Lambda^(- 1) parallel_(H^(s - 2) arrow.r H^s) & lt.eq sup_(mu gt.eq 0) frac(1 + mu, mu + 2 Lambda) lt.eq 1 . $ <corr:mass-inverse-one>]
  Changing to the fixed coordinate Sobolev norms costs constants independent of $Lambda$.
  Writing $Z = 1 + Y$, the required fixed-point equation is
  #[#set math.equation(numbering: n => "(126)")
   $ Y = L_Lambda^(- 1) [\( Delta_h - Delta_(h_1) \) Y + V_0 \( 1 + Y \) + Lambda \( 3 Y^2 + Y^3 \)] . $ <corr:fixed-point>]
  The coefficient formula for a Laplacian and the usual integer-order product rule show
  $ parallel Delta_h - Delta_(h_1) parallel_(H^s arrow.r H^(s - 2)) lt.eq C_s parallel h_1 - h parallel_(C^s) . $
  Estimate this term using (125). Estimate the remaining terms using the algebra property and (125). On the closed $H^s$-ball of radius $r$, the Lipschitz constant of the right side of (126) is at most
  $ C_s parallel h_1 - h parallel_(C^s) + C_s Lambda^(- 1) parallel V_0 parallel_(H^s) + C_s \( r + r^2 \) . $
  Choose a fixed small $r$ so that the last term is at most $1 \/ 4$ and Sobolev embedding makes $1 + Y gt.eq 1 \/ 2$ on this ball. Next choose $delta$ so that the displayed Lipschitz constant is at most $1 \/ 2$ and the image of zero has norm at most $r \/ 2$. The map is then a contraction of the ball into itself. Its fixed point obeys
  $ parallel Y parallel_(H^s) lt.eq 1 / 2 parallel Y parallel_(H^s) + C_s Lambda^(- 1) parallel V_0 parallel_(H^s) \, $
  which proves (124). Finally the equation for $Z$, the smoothness of its coefficients, and elliptic regularity bootstrap $Z$ from $H^s$ to $H^(s + 2)$, and then to all higher orders. The resulting real smooth solution remains positive. ◻
]

The factor $Lambda$ in the nonlinear term is canceled by the first inverse bound, while the second inverse bound handles the change of the principal coefficients. These are estimates for the negative operator $Delta_h - 2 Lambda$; no high-energy nonresonance assumption is involved.

===== 10.3 Localization and exact determinant compatibility <localization-and-exact-determinant-compatibility>

The global factor $Z$ need not equal one outside $P$. We localize it, keeping the resulting equation exact by recording its density. Choose a fixed $chi in C_c^oo \( U_4 \; \[ 0 \, 1 \] \)$ equal to one on a neighborhood of $overline(U)_3$, and set

#[#set math.equation(numbering: n => "(127)")
 $ hat(Z) = 1 + chi \( Z - 1 \) \, #h(2em) t = v / hat(Z) \, #h(2em) rho = hat(Z)^2 (1 - V_0 / Lambda_k) + frac(hat(Z) Delta_(h_1) hat(Z), Lambda_k) . $ <corr:localized-data>]

For sufficiently small $Z - 1$ and $V_0$, both $hat(Z)$ and $rho$ are positive. Direct differentiation gives

#[#set math.equation(numbering: n => "(128)")
 $ "div"_(h_1) \( hat(Z)^2 h_1^(- 1) d t \) = hat(Z) Delta_(h_1) v - v Delta_(h_1) hat(Z) = - Lambda_k rho t . $ <corr:localized-flux>]

Where $chi$ is identically one, (123) implies $rho = hat(Z)^4$. Outside $"supp" chi$, the same equality holds because $V_0 = 0$ and $hat(Z) = 1$. Thus

#[#set math.equation(numbering: n => "(129)")
 $ "supp" \( rho - hat(Z)^4 \) subset.double cal(C) := U_4 \\ overline(U)_2 . $ <corr:defect-support>]

On this entire collar $h_1 = g_0$ and $v = u_k^0$.

#thm([Lemma 38.])[
  (Determinant repair on the collar).  #emph[For the data (127), suppose that $hat(Z) - 1$ is sufficiently small in $C^1$ and $rho > 0$. Then an ordinary smooth metric $g_(*)$, equal to $g_0$ outside a compact subset of $U_4$, satisfies $\( Delta_(g_(*)) + Lambda_k \) t = 0$. More quantitatively, if for some $N > 0$, 
#[#set math.equation(numbering: n => "(130)")
 $ parallel h_1 - h parallel_(C^p) + parallel V_0 parallel_(C^p) = O \( k^(- N) \) \, #h(2em) parallel Z - 1 parallel_(C^(p + 2)) = O \( k^(- N - 2) \) \, $ <corr:collar-input-estimate>]

 then 
#[#set math.equation(numbering: n => "(131)")
 $ parallel g_(*) - h parallel_(C^p) = O \( k^(- N) + k^(p - N - 2) \) . $ <corr:final-metric-estimate>]

]
] <corr:localization>

#proof[
  Put $phi.alt = theta + z$. Since $u_k^0 = e^(k f_0) cos \( k phi.alt \)$, the normalized covector on $cal(C)$ is exactly
  #[#set math.equation(numbering: n => "(132)")
   $ alpha := frac(d t, k e^(k f_0)) = hat(Z)^(- 1) #scale(x: 120%, y: 120%)[\(] cos \( k phi.alt \) thin d f_0 - sin \( k phi.alt \) thin d phi.alt #scale(x: 120%, y: 120%)[\)] - k^(- 1) cos \( k phi.alt \) hat(Z)^(- 2) d hat(Z) . $ <corr:normalized-collar-covector>]
  On $overline(U)_4$, the background covectors $d f_0$ and $d phi.alt$ are orthogonal in $g_0$, with lengths bounded below. It follows that $\| alpha \|_(h_1) gt.eq c > 0$ for all sufficiently large $k$. In particular,
  #[#set math.equation(numbering: n => "(133)")
   $ \| d t \|_(h_1) gt.eq c k e^(k f_0) quad upright("on ") cal(C) . $ <corr:clean-gradient>]
  Let
  $ Pi = I - frac(alpha^(sharp_(h_1)) ⊗ alpha, \| alpha \|_(h_1)^2) $
  be the $h_1$-orthogonal projection of the tangent bundle onto $ker d t$ on $cal(C)$. It has rank three and annihilates $"grad"_(h_1) t$.
  Define the positive scalar
  $ c_(*) = (rho^2 / hat(Z)^8)^(1 \/ 3) . $
  By (129), $c_(*) - 1$ has compact support in $cal(C)$. Consequently $\( c_(*) - 1 \) Pi$ extends smoothly by zero to $M$. Define a positive symmetric contravariant tensor and an ordinary metric by
  #[#set math.equation(numbering: n => "(134)")
   $ A' = hat(Z)^2 #scale(x: 120%, y: 120%)[\(] I + \( c_(*) - 1 \) Pi #scale(x: 120%, y: 120%)[\)] h_1^(- 1) \, #h(2em) g_(*)^(- 1) = rho^(- 1) A' . $ <corr:determinant-tensor>]
  Here the product containing $Pi$ always means this smooth zero extension. In the normal direction to $ker d t$, the endomorphism $A' h_1$ has eigenvalue $hat(Z)^2$; in the three tangent directions its eigenvalue is $hat(Z)^2 c_(*)$. Hence
  #[#set math.equation(numbering: n => "(135)")
   $ A' d t = hat(Z)^2 h_1^(- 1) d t \, #h(2em) det \( A' h_1 \) = hat(Z)^8 c_(*)^3 = rho^2 . $ <corr:flux-and-determinant>]
  Off the collar the same identities follow from $c_(*) = 1$ and $rho = hat(Z)^4$. Dimension four now gives
  $ det \( g_(*)^(- 1) h_1 \) = rho^(- 4) det \( A' h_1 \) = rho^(- 2) \, #h(2em) d upright("vol")_(g_(*)) = rho thin d upright("vol")_(h_1) . $
  It follows from (128) and (135) that
  $ Delta_(g_(*)) t = rho^(- 1) "div"_(h_1) \( A' d t \) = - Lambda_k t . $
  All changes are compactly supported in $U_4$.
  It remains to verify the estimates without losing an exponential factor from $d t$. Under (130), $hat(Z) gt.eq 1 \/ 2$ and its derivatives through order $p + 2$ are bounded independently of $k$. Formula (132) gives
  $ \| partial^j alpha \| lt.eq C_j k^j \, #h(2em) \| partial^j Pi \| lt.eq C_j k^j \, #h(2em) 0 lt.eq j lt.eq p . $
  The second estimate follows from the first, the fixed positive lower bound on $\| alpha \|$, and the quotient rule. These powers are independent of the accuracy requested in the residual. On the region where $chi equiv 1$, use $rho = Z^4$. In the transition region use (127) with the fixed coefficients $h_1 = g_0$, $V_0 = 0$, and outside $"supp" chi$ use $rho = 1$. Since $Lambda_k$ is comparable to $k^2$, (130) therefore gives
  $ parallel rho - 1 parallel_(C^p) + parallel c_(*) - 1 parallel_(C^p) = O \( k^(- N - 2) \) . $
  The product rule therefore yields
  $ parallel \( c_(*) - 1 \) Pi parallel_(C^p) = O \( k^(p - N - 2) \) . $
  For the covariant metric, use the exact inverse supplied by $Pi^2 = Pi$:
  $ g_(*) = rho hat(Z)^(- 2) h_1 #scale(x: 120%, y: 120%)[\(] I + \( c_(*)^(- 1) - 1 \) Pi #scale(x: 120%, y: 120%)[\)] . $
  The scalar $c_(*)^(- 1) - 1$, like $c_(*) - 1$, has $C^p$ norm $O \( k^(- N - 2) \)$. The product rule in this formula, together with $parallel h_1 - h parallel_(C^p) = O \( k^(- N) \)$, proves (131) for every $N > 0$, including when its second term grows with $k$. ◻
]

===== 10.4 The finite order of choices <the-finite-order-of-choices>

#proof[
  Here is one explicit order of choices. Given $p \, L$, choose an even integer $s > p + 4$, and set
  $ N = ceil.l L ceil.r + p + 4 \, #h(2em) r = s + 2 \, #h(2em) ell = s + 3 \,\
J = E_(s + 2) + N \, #h(2em) E_(s + 2) = 1000 \( s + 4 \) . $
  Lemma 36 uses $u$ through order $s + 4 = ell + 1$ and $R$ through order $ell$, and gives
  $ parallel F parallel_(C^(s + 2)) + parallel theta.alt parallel_(C^(s + 2)) = O \( k^(- N) \) . $
  Equation (121) then gives
  $ parallel h_1 - h parallel_(C^(s + 2)) + parallel w - 1 parallel_(C^(s + 2)) + parallel V_0 parallel_(H^s) = O \( k^(- N) \) . $
  For large $k$, Lemma 37 applies with $Lambda = Lambda_k$. Its estimate and the embedding $H^s arrow.r.hook C^(p + 2)$, valid because $s > p + 4$ in dimension four, give
  $ parallel Z - 1 parallel_(C^(p + 2)) lt.eq C parallel Z - 1 parallel_(H^s) = O \( k^(- N - 2) \) . $
  The hypotheses of Lemma 38 now hold. Since $N gt.eq L + p + 4$, its conclusion implies $parallel g_(*) - h parallel_(C^p) = O \( k^(- L) \)$. The eigenfunction is exactly
  $ t = w^(1 \/ 2) / hat(Z) thin u \, $
  with a smooth positive multiplier equal to one off a compact subset of $U_4$. This proves every assertion.
  All derivative orders and powers have been fixed before the wave construction is asked to provide (C1)–(C1). The constants and the eventual lower threshold for $k$ may depend on that finite construction. Increasing its Taylor orders changes those constants, but neither the fixed noncancellation exponent nor the polynomial losses above. Thus only finitely many accuracy requirements are used at each realization step. ◻
]

==== 11 Simplicity, persistence, and one fixed metric <sec:spectral>

The preceding construction produces an exact eigenfunction with a large sign score. We first make its eigenvalue simple while preserving that function exactly. The freedom required for this step is supplied by the three directions tangent to its level sets in an untouched part of $P$.

#thm([Lemma 39.])[
  (Simplicity preserving an eigenfunction).  #emph[Let $g$ be a smooth metric on $M$, and suppose 
$ - Delta_g t = Lambda_k t \, #h(2em) k gt.eq 1 \, $

 
$ g = g_0 \, quad t = u_k^0 quad upright("outside a compact subset of ") P . $

 In every smooth-topology neighborhood of $g$ there is a smooth metric $tilde(g)$ for which $Lambda_k$ is simple, with the same eigenfunction $t$. Moreover, $tilde(g) - g$ has compact support in $P$, and $d "vol"_(tilde(g)) = d "vol"_g$.]
] <spec:simple>

#proof[
  We shall use only perturbations in open subsets of $P$ where the metric and eigenfunction still agree with the background. Such a region remains after any finite number of compactly supported changes.
  First, the squared gradient norm of the background varies along its level sets. More precisely, on every nonempty open subset of $P$ there is a smaller open subset on which $d t$ and $d \| d t \|_(g_0)^2$ are independent when $t = u_k^0$. Indeed, writing $phi.alt = theta + z$, Equation (70) gives
  $ \| d u_k^0 \|_(g_0)^2 = k^2 #scale(x: 120%, y: 120%)[\(] H_k \( p \) - 2 \( u_k^0 \)^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) H_k \( p \) = sin^(2 k) p + sin^(2 k - 2) p . $
  The first summand in $H_k$ has strictly positive derivative on $0 < p < pi \/ 2$; the second is increasing for $k > 1$ and constant for $k = 1$. Thus $H'_k \( p \) > 0$ for every $k gt.eq 1$. Wherever $sin \( k phi.alt \) eq.not 0$, the covectors $d u_k^0$ and $d p$ are independent, so
  $ d \| d u_k^0 \|_(g_0)^2 and d u_k^0 = k^2 H'_k \( p \) thin d p and d u_k^0 eq.not 0 . $
  The excluded set has empty interior.
  Let $E = ker \( - Delta_g - Lambda_k \)$ have dimension $m > 1$, and choose a real $t_2 in E$ independent of $t$. Take an open background region $V subset.double P$ on which $d t$ and $d \| d t \|_g^2$ are independent. We claim that the tangential component of $"grad"_g t_2$ along a level set of $t$ is nonzero somewhere in $V$. Otherwise $d t_2$ vanishes on $ker d t$ throughout $V$. Since $d t eq.not 0$, submersion coordinates on a smaller product neighborhood give $t_2 = F \( t \)$ for a smooth one-variable function $F$. The two eigenfunction equations imply
  #[#set math.equation(numbering: n => "(136)")
   $ F'' \( t \) \| d t \|_g^2 = Lambda_k #scale(x: 120%, y: 120%)[\(] t F' \( t \) - F \( t \) #scale(x: 120%, y: 120%)[\)] . $ <spec:local-dependence>]
  On a still smaller neighborhood there is a smooth vector field $X$ with $X t = 0$ and $X \( \| d t \|_g^2 \) eq.not 0$. Differentiating (136) along $X$ gives $F'' \( t \) = 0$ there. The image of this neighborhood under the submersion $t$ contains an open interval; hence $F \( r \) = a r + b$ on that interval. Substitution into (136), using $Lambda_k > 0$, forces $b = 0$. Consequently $t_2 - a t$ vanishes on a nonempty open set. Weak unique continuation for smooth scalar elliptic equations on a connected manifold, a consequence of Aronszajn’s Theorem [1] pp. 235–236, makes it identically zero. The hypotheses apply because the metric is smooth and positive and the zeroth-order coefficient $Lambda_k$ is smooth. This contradicts the choice of $t_2$ and proves the claim.
  On a small neighborhood of a point supplied by the claim, let $Pi$ be the $g$-orthogonal projection onto $ker d t$ and put $z = Pi "grad"_g t_2$. Choose a nonzero nonnegative smooth bump $chi$ supported in that neighborhood, with $z eq.not 0$ on its support. Extend by zero the endomorphism
  #[#set math.equation(numbering: n => "(137)")
   $ J = chi (z ⊗ z^(flat_g) - frac(\| z \|_g^2, 3) Pi) . $ <spec:tangential-variation>]
  It is smooth, $g$-self-adjoint, trace free, and annihilates $"grad"_g t$. Here the factor $1 \/ 3$ uses $"rank" Pi = 3$. Moreover,
  #[#set math.equation(numbering: n => "(138)")
   $ frak(b)_J \( t_2 \, t_2 \) := integral_M g \( J "grad"_g t_2 \, "grad"_g t_2 \) thin d "vol"_g = 2 / 3 integral_M chi \| z \|_g^4 thin d "vol"_g > 0 . $ <spec:positive-variation>]
  For real $s$ define an ordinary metric by
  #[#set math.equation(numbering: n => "(139)")
   $ g_s^(- 1) = exp \( s J \) g^(- 1) . $ <spec:metric-path>]
  Self-adjointness makes this a positive symmetric cometric. Since $det exp \( s J \) = exp \( s "tr" J \) = 1$, its volume density equals that of $g$. Since $J "grad"_g t = 0$, it also satisfies $g_s^(- 1) d t = g^(- 1) d t$. The divergence formula for the Laplacian therefore gives
  $ - Delta_(g_s) t = Lambda_k t quad upright("for every ") s . $
  Thus both volume and the flux of $d t$ are preserved exactly.
  We show that the multiplicity at $Lambda_k$ is less than $m$ for all sufficiently small nonzero $s$. Suppose instead that $s_n arrow.r 0$, $s_n eq.not 0$, and that there are $m$ real orthonormal eigenfunctions $e_(1 \, n) \, dots.h \, e_(m \, n)$ of $g_(s_n)$ at $Lambda_k$. All norms and orthogonality may be taken with the same volume density. Smooth convergence of the metrics, elliptic estimates, and a diagonal compactness argument give a subsequence such that $e_(a \, n) arrow.r e_a$ smoothly for $1 lt.eq a lt.eq m$. To spell out the uniform estimate used here, for every fixed integer $r gt.eq 0$, comparison with the limiting operator and absorption of its small coefficient difference give
  $ parallel v parallel_(H^(r + 2)) lt.eq C_r #scale(x: 120%, y: 120%)[\(] parallel Delta_(g_(s_n)) v parallel_(H^r) + parallel v parallel_(L^2) #scale(x: 120%, y: 120%)[\)] $
  for all sufficiently large $n$. Iteration at the fixed eigenvalue gives uniform Sobolev bounds of every order; compact Sobolev embeddings give the asserted convergence. The limits form an orthonormal basis of $E$.
  For $v in E$, the weak equation for $e_(a \, n)$ with metric $g_(s_n)$ and the weak equation for $v$ with metric $g$ have the same right-hand side. Subtracting and dividing by $s_n$ yields
  $ integral_M g (frac(exp \( s_n J \) - I, s_n) "grad"_g e_(a \, n) \, "grad"_g v) thin d "vol"_g = 0 . $
  Taking the limit shows $frak(b)_J \( e_a \, v \) = 0$ for all $a$ and all $v in E$. Since the $e_a$ span $E$, this contradicts (138). This proves the strict decrease.
  The eigenfunction $t$ survives every decrease, so the multiplicity is always at least one. At most $m - 1$ repetitions make it one. At each repetition the parameter can be taken arbitrarily small in the smooth topology. For example, choose a finite $C^r$ tolerance contained in the prescribed neighborhood and allocate to these finitely many changes a total tolerance smaller than it. Their supports form a finite union of compact subsets of $P$, leaving another background region whenever one is needed. Volume and $t$ are preserved throughout. This proves all the assertions. ◻
]

Fix a constant $c_(upright(H)) > 0$ such that the comparison in Lemma 32 reads

#[#set math.equation(numbering: n => "(140)")
 $ cal(H)_g^3 \( { v = 0 } \) gt.eq c_(upright(H)) cal(S) \( v \) \, #h(2em) g in cal(U) \, $ <spec:score-comparison>]

for every continuous real $v$ and every sign score used in the construction. Its uniformity follows from the fixed metric comparability on $cal(U)$. When considering persistence, the cubes and displacements defining $cal(S)$ are held fixed.

#thm([Lemma 40.])[
  (Open persistence of a fixed score).  #emph[Suppose $g in cal(U)$ has a simple positive eigenvalue $lambda$ with real eigenfunction $t$, and, for a fixed sign score and $N > 0$, 
$ lambda > N \, #h(2em) c_(upright(H)) cal(S) \( t \) > N sqrt(lambda) . $

 There is a smooth-topology neighborhood $cal(V) subset cal(U)$ of $g$ such that every $g' in cal(V)$ has a simple eigenvalue $lambda' > N$ with a real eigenfunction $t'$ satisfying 
$ c_(upright(H)) cal(S) \( t' \) > N sqrt(lambda') . $

 In particular its nodal-measure ratio exceeds $N$.]
] <spec:persistence>

#proof[
  Choose a number $T$ and an open interval $I$ containing $lambda$ such that
  $ N sqrt(lambda) < T < c_(upright(H)) cal(S) \( t \) \, #h(2em) I subset #scale(x: 120%, y: 120%)[\(] N \, \( T \/ N \)^2 #scale(x: 120%, y: 120%)[\)] . $
  These choices are possible by the two strict inequalities in the hypothesis. Normalize $t$ in $L^2 \( g \)$; scalar invariance leaves its score unchanged. The functional $cal(F) = c_(upright(H)) cal(S)$ is lower semicontinuous for uniform convergence and invariant under nonzero real rescaling by (106) and the paragraph following it. Apply Lemma 23 to this functional, the threshold $T$, and the interval $I$, and intersect its neighborhood with $cal(U)$. For every metric $g'$ in the resulting neighborhood, the selected simple eigenpair satisfies
  $ lambda' in I \, #h(2em) c_(upright(H)) cal(S) \( t' \) > T > N sqrt(lambda') . $
  In particular $lambda' > N$, and (140) gives the nodal-measure conclusion. ◻
]

#thm([Proposition 41.])[
  (An arbitrarily close step).  #emph[Let $h in cal(U)$ and suppose $h - g_0$ has compact support in $P$. For every smooth-topology neighborhood $cal(O)$ of $h$, every $N > 0$, and every integer $k_min$, there are an integer $k gt.eq k_min$, a metric $tilde(h) in cal(O) ∩ cal(U)$, and a real eigenfunction $t$ such that 
$ - Delta_(tilde(h)) t = Lambda_k t \, #h(2em) Lambda_k > N \, #h(2em) c_(upright(H)) cal(S) \( t \) > N sqrt(Lambda_k) $

 for a sign score $cal(S)$, and $Lambda_k$ is simple. Both $tilde(h) - g_0$ and $t - u_k^0$ have compact support in $P$. The inequalities persist in a neighborhood of $tilde(h)$ in the sense of Lemma 40.]
] <spec:one-step>

#proof[
  First choose a finite $C^r$ neighborhood of $h$ contained in $cal(O) ∩ cal(U)$, reserving part of its tolerance for Lemma 39. Let $c_(upright(s)) > 0$ be the constant, independent of the amplified envelope, in the conclusion of Proposition 34. By Lemma 27, choose the nested patches and an envelope with the required gaps and with
  $ c_(upright(H)) c_(upright(s)) integral_D B \( x \) thin d x > 2 sqrt(3) thin N . $
  For these fixed data, Lemma 35 specifies finite residual derivative orders and accuracy powers that suffice for the reserved $C^r$ tolerance. Construct the packets to those orders and use Proposition 34, for arbitrarily large integers $k$, to obtain a real $u$ satisfying the residual and noncancellation hypotheses as well as
  $ cal(S) \( u \) gt.eq c_(upright(s)) k integral_D B \( x \) thin d x . $
  Choose $k gt.eq k_min$ with $Lambda_k > N$ above all these thresholds and those required by the correction. All order choices precede this choice of $k$. Lemma 35 gives an ordinary metric $g_(*)$ within the reserved tolerance and an exact $Lambda_k$ eigenfunction $t$, a positive smooth multiple of $u$, with the stated background identities outside a compact subset of $P$. Positive-factor invariance gives $cal(S) \( t \) = cal(S) \( u \)$. Since $sqrt(Lambda_k) = sqrt(2 k^2 + k) lt.eq sqrt(3) thin k$ for $k gt.eq 1$,
  $ c_(upright(H)) cal(S) \( t \) > 2 N sqrt(Lambda_k) . $
  Lemma 39 then makes $Lambda_k$ simple by an arbitrarily small change preserving $t$. Take this change within the remaining tolerance. All support conditions are preserved, and Lemma 40 supplies the last claim. ◻
]

#proof[
  Let $cal(X) = C^oo \( M \; "Sym"^2 T^(*) M \)$, the real Fréchet space of smooth symmetric covariant two-tensors. Fix $C^r$ seminorms defined using $g_0$ and the complete translation-invariant metric
  $ d_(cal(X)) \( a \, b \) = sum_(r = 0)^oo 2^(- r - 1) min { 1 \, parallel a - b parallel_(C^r) } . $
  It induces the smooth topology. Completeness follows because a Cauchy sequence converges in every $C^r$ norm and the limits agree under the natural inclusions. The positive metrics form an open subset of $cal(X)$, and $cal(U)$ is open in this ambient space.
  Take any sequence $N_j arrow.r oo$, with $N_j > 0$. Starting from $g_0$, apply Proposition 41 with threshold $N_1$ to choose a first center $h_1$ and its persistence neighborhood $cal(V)_1 subset cal(U)$. Choose a closed $d_(cal(X))$-ball $cal(B)_1$ of positive radius centered at $h_1$, contained in $cal(V)_1$, and of diameter at most $2^(- 1)$. Inductively, suppose $h_(j - 1)$ and $cal(B)_(j - 1)$ have been chosen. Its interior is a neighborhood of $h_(j - 1)$. Proposition 41, with threshold $N_j$, therefore gives a center
  $ h_j in "int" cal(B)_(j - 1) $
  whose difference from $g_0$ has compact support in $P$, together with a persistence neighborhood $cal(V)_j$. Choose a positive-radius closed ball centered at $h_j$ such that
  $ cal(B)_j subset "int" cal(B)_(j - 1) ∩ cal(V)_j ∩ cal(U) \, #h(2em) "diam" cal(B)_j lt.eq 2^(- j) . $
  This is possible because the set on the right is open and contains $h_j$. Every open neighborhood in the smooth topology contains a neighborhood specified by finitely many seminorms, exactly the closeness provided by Proposition 41.
  These are nested nonempty closed sets with diameters tending to zero in the complete space $cal(X)$. Their centers are Cauchy, and their limit $g_oo$ belongs to every $cal(B)_j$. In particular $g_oo in cal(U)$, so it is a smooth positive Riemannian metric on the fixed closed connected four-manifold $M = S^2 times bb(T)^2$. For each $j$, membership in $cal(V)_j$ supplies an exact nonzero real eigenfunction $u_j$ of this same metric, with eigenvalue $lambda_j$ satisfying
  $ lambda_j > N_j \, #h(2em) frac(cal(H)_(g_oo)^3 \( { u_j = 0 } \), sqrt(lambda_j)) gt.eq frac(c_(upright(H)) cal(S)_j \( u_j \), sqrt(lambda_j)) > N_j . $
  Here $cal(S)_j$ is the fixed score from the $j$th step. Both quantities therefore tend to infinity. Compact support in $P$ was needed only for the finite-stage centers; it is not a hypothesis on the limit used in this conclusion. Likewise the final eigenvalues may move from the intermediate values $Lambda_k$: persistence gives the exact eigenpairs and the two strict inequalities at the single limiting metric. This proves the stated refutation. ◻
]

#heading(level: 1)[References]
#bibitem([1])[N.~Aronszajn, #emph[A unique continuation theorem for solutions of elliptic partial differential equations or inequalities of second order], J. Math. Pures Appl. (9) #strong[36] (1957), 235--249. #link("https://sites.math.washington.edu/~blwilson/Nodal/Aronszajn.pdf")[Original article].]
#bibitem([2])[J.~Brüning, #emph[Über Knoten von Eigenfunktionen des Laplace--Beltrami-Operators], Math. Z. #strong[158] (1978), 15--21. #link("https://doi.org/10.1007/BF01214561")[doi:10.1007/BF01214561].]
#bibitem([3])[Y.~Canzani, #emph[Notes for Analysis on Manifolds via the Laplacian], Math 253, Harvard University, Fall 2013. #link("https://canzani.web.unc.edu/wp-content/uploads/sites/12623/2016/08/Laplacian.pdf")[Author's notes].]
#bibitem([4])[N.~Dencker, J.~Sjöstrand, and M.~Zworski, #emph[Pseudospectra of semiclassical (pseudo-) differential operators], Comm. Pure Appl. Math. #strong[57] (2004), no.~3, 384--415. #link("https://doi.org/10.1002/cpa.20004")[doi:10.1002/cpa.20004]. Author preprint: #link("https://arxiv.org/abs/math/0301242v1")[arXiv:math/0301242v1].]
#bibitem([5])[H.~Donnelly and C.~Fefferman, #emph[Nodal sets of eigenfunctions on Riemannian manifolds], Invent. Math. #strong[93] (1988), 161--183. #link("https://doi.org/10.1007/BF01393691")[doi:10.1007/BF01393691].]
#bibitem([6])[H.~Donnelly and C.~Fefferman, #emph[Nodal sets for eigenfunctions of the Laplacian on surfaces], J. Amer. Math. Soc. #strong[3] (1990), no.~2, 333--353. #link("https://doi.org/10.1090/S0894-0347-1990-1035413-2")[doi:10.1090/S0894-0347-1990-1035413-2].]
#bibitem([7])[S.~Dyatlov, #emph[Lecture notes for 18.155: distributions, elliptic regularity, and applications to PDEs], Massachusetts Institute of Technology, September 28, 2026. #link("https://math.mit.edu/~dyatlov/18.155/155-notes.pdf")[Author's notes].]
#bibitem([8])[A.~Enciso and D.~Peralta-Salas, #emph[Eigenfunctions with prescribed nodal sets], J. Differential Geom. #strong[101] (2015), no.~2, 197--211. #link("https://doi.org/10.4310/jdg/1442364650")[doi:10.4310/jdg/1442364650]. Author preprint: #link("https://arxiv.org/abs/1404.1039v1")[arXiv:1404.1039v1].]
#bibitem([9])[A.~Enciso, D.~Peralta-Salas, and S.~Steinerberger, #emph[Prescribing the nodal set of the first eigenfunction in each conformal class], Int. Math. Res. Not. IMRN #strong[2017], no.~11, 3322--3349. #link("https://doi.org/10.1093/imrn/rnw126")[doi:10.1093/imrn/rnw126]. Author preprint: #link("https://arxiv.org/abs/1503.05105v1")[arXiv:1503.05105v1].]
#bibitem([10])[A.~Enciso, D.~Peralta-Salas, and F.~Torres de Lizaur, #emph[High-energy eigenfunctions of the Laplacian on the torus and the sphere with nodal sets of complicated topology], in #emph[Nonlinear Partial Differential Equations for Future Applications], Springer Proceedings in Mathematics & Statistics, vol.~346, Springer, Singapore, 2021, 245--261. #link("https://doi.org/10.1007/978-981-33-4822-6_7")[doi:10.1007/978-981-33-4822-6\_7].]
#bibitem([11])[R.~Hardt and L.~Simon, #emph[Nodal sets for solutions of elliptic equations], J. Differential Geom. #strong[30] (1989), no.~2, 505--522. #link("https://doi.org/10.4310/jdg/1214443599")[doi:10.4310/jdg/1214443599].]
#bibitem([12])[H.~Hezari, #emph[Upper bounds on the size of nodal sets for Gevrey and quasianalytic Riemannian manifolds], Commun. Math. Phys. #strong[404] (2023), 1341--1359. #link("https://doi.org/10.1007/s00220-023-04853-z")[doi:10.1007/s00220-023-04853-z]. Author preprint: #link("https://arxiv.org/abs/2205.00398v1")[arXiv:2205.00398v1].]
#bibitem([13])[Y.~Krauz, #emph[Constructing Riemannian metrics with prescribed nodal sets for Laplacian eigenfunctions], Int. Math. Res. Not. IMRN #strong[2025], no.~24, rnaf362. #link("https://doi.org/10.1093/imrn/rnaf362")[doi:10.1093/imrn/rnaf362].]
#bibitem([14])[A.~Logunov, #emph[Nodal sets of Laplace eigenfunctions: polynomial upper estimates of the Hausdorff measure], Ann. of Math. (2) #strong[187] (2018), no.~1, 221--239. #link("https://doi.org/10.4007/annals.2018.187.1.4")[doi:10.4007/annals.2018.187.1.4].]
#bibitem([15])[A.~Logunov, #emph[Nodal sets of Laplace eigenfunctions: proof of Nadirashvili's conjecture and of the lower bound in Yau's conjecture], Ann. of Math. (2) #strong[187] (2018), no.~1, 241--262. #link("https://doi.org/10.4007/annals.2018.187.1.5")[doi:10.4007/annals.2018.187.1.5].]
#bibitem([16])[A.~Logunov and E.~Malinnikova, #emph[Nodal sets of Laplace eigenfunctions: estimates of the Hausdorff measure in dimensions two and three], in #emph[50 Years with Hardy Spaces], Operator Theory: Advances and Applications, vol.~261, Birkhäuser, Cham, 2018, 333--344. #link("https://doi.org/10.1007/978-3-319-59078-3_17")[doi:10.1007/978-3-319-59078-3\_17].]
#bibitem([17])[OpenAI, #emph[Power-law violations of Yau's nodal upper bound], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Power-law-violations-of-Yaus-nodal-upper-bound-September-23-2026/paper.pdf")[OAI:Power-law-violations-of-Yaus-nodal-upper-bound-September-23-2026], 2026.]
#bibitem([18])[OpenAI, #emph[Sharp nodal length on smooth surfaces], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Sharp-nodal-length-on-smooth-surfaces-September-23-2026/paper.pdf")[OAI:Sharp-nodal-length-on-smooth-surfaces-September-23-2026], 2026.]
#bibitem([19])[Z.~Rudnick and I.~Wigman, #emph[On the volume of nodal sets for eigenfunctions of the Laplacian on the torus], Ann. Henri Poincaré #strong[9] (2008), no.~1, 109--130. #link("https://doi.org/10.1007/s00023-007-0352-6")[doi:10.1007/s00023-007-0352-6].]
#bibitem([20])[M.~E.~Taylor, #emph[Sobolev Spaces], Chapter~4, author-hosted typescript, undated. #link("https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/chap4.pdf")[Author's chapter].]
#bibitem([21])[M.~E.~Taylor, #emph[Partial Differential Equations I: Basic Theory], second edition, Applied Mathematical Sciences, vol.~115, Springer, New York, 2011. #link("https://doi.org/10.1007/978-1-4419-7055-8")[doi:10.1007/978-1-4419-7055-8].]
#bibitem([22])[M.~E.~Taylor, #emph[Short Course on Pseudodifferential Operators], lecture notes for the MSRI course, Fall 2008, with later revisions. #link("https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2022/05/psidolect.pdf")[Author's notes].]
#bibitem([23])[K.~Uhlenbeck, #emph[Generic properties of eigenfunctions], Amer. J. Math. #strong[98] (1976), no.~4, 1059--1078. #link("https://doi.org/10.2307/2374041")[doi:10.2307/2374041].]
#bibitem([24])[I.~Wigman, #emph[On the distribution of the nodal sets of random spherical harmonics], J. Math. Phys. #strong[50] (2009), no.~1, 013521, 44~pp. #link("https://doi.org/10.1063/1.3056589")[doi:10.1063/1.3056589].]
#bibitem([25])[S.-T.~Yau, #emph[Problem section], in #emph[Seminar on Differential Geometry] (S.-T.~Yau, ed.), Annals of Mathematics Studies #strong[102], Princeton University Press, Princeton, NJ, 1982, 669--706. #link("https://doi.org/10.1515/9781400881918-035")[doi:10.1515/9781400881918-035].]


