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

#align(center)[#text(size: 16pt, weight: "bold")[A Charged Reduction of the Spacetime Penrose Inequality in Spatial Dimensions at Least Four]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Penrose inequality relates the total mass of an asymptotically flat initial-data set to the area required to enclose its black-hole boundary. Penrose proposed this relation as a consequence of gravitational collapse and cosmic censorship #cite(label("Penrose1973")). In three dimensions, Huisken and Ilmanen proved the Riemannian inequality for a connected outermost minimal component by inverse mean curvature flow, and Bray treated total horizon area with multiple components by conformal deformation #cite(label("HuiskenIlmanen2001")) #cite(label("Bray2001")). Bray and Lee extended the numerical Riemannian inequality to spatial dimensions below eight #cite(label("BrayLee2009")). The spacetime problem retains the second fundamental form and the invariant ADM mass, and the charged problem must also account for the conserved electric flux. These distinctions affect both the numerical inequality and the equality statement.

This article proves a reduction from the neutral spacetime inequality to the purely electric inequality in every spatial dimension $n gt.eq 4$. The neutral input is stated in full in Theorem 4. It is used only at its stated stronger-decay, future-trapped, positive-area, future-timelike scope. We use this companion result without independently reproving the unrestricted neutral spacetime Penrose conjecture. Using this input, Theorems 5 and 7 establish the numerical bound and connected nonextremal rigidity statement formulated below.

The numerical theorem permits disconnected boundary, with a future or past trapping sign chosen independently on each component. It first establishes that the ADM vector is future timelike; write $m$ for its invariant mass. The area is an infimum over #emph[full enclosing cuts]. Every component of a cut, including its contact with the given boundary, is counted, and no smooth minimizer is assumed. If $Q$ is the signed charge and $X_A$ is the $\( n - 2 \)$nd power of the corresponding area radius, the sharp assertion is

#[#set math.equation(numbering: n => "(1.1)")
 $ m gt.eq \| Q \| \, #h(2em) X_A lt.eq m + sqrt(m^2 - Q^2) . $ <intro:bound>]

On the outer branch $X_A > \| Q \|$, the second inequality is equivalent to $m gt.eq \( X_A + Q^2 \/ X_A \) \/ 2$; for $0 < X_A lt.eq \| Q \|$, the stated conclusion reduces to the mass-charge bound. This distinction is necessary when the enclosing boundary has several components. In spatial dimension three, Khuri, Weinstein and Yamada proved the corresponding upper area-radius bound for strongly asymptotically flat Riemannian data with possibly disconnected outermost minimal boundary, source-free electric and magnetic fields, and the charged scalar-curvature bound #cite(label("KhuriWeinsteinYamada2017")) Theorem 1.1 and Corollary 1.2. The present reduction treats nonzero second fundamental form and spatial dimensions $n gt.eq 4$.

For a connected nonextremal future horizon satisfying the outermost and area-minimizing conditions below, equality determines all the original fields as a global slice of a Reissner–Nordström–Tangherlini exterior. The argument retains the singular minimizing frontiers that can occur from spatial dimension eight onward, and the equality analysis takes place on the original data throughout.

The proof has four main ingredients. First, a charge-preserving end preparation reduces weakly asymptotically flat data with arbitrary timelike ADM vector to strict data with a static end. A filled scalar system then produces a metric which dominates the original metric and has charged scalar-curvature control on a suitable height region. Its local regularity rests on a special rank-one elliptic structure: after freezing the gradient direction, the derivative in that direction satisfies a divergence-form equation even when the remaining scalar coefficient is merely measurable. This yields the required gradient estimates in every dimension.

Second, a bounded divergence-flux equation converts electric charge into a controlled decrement of ADM energy. Its conformal factor has a lower barrier, so the loss of enclosing area is explicit. A compact pure-trace second fundamental form makes a smooth regular height cut strictly future trapped. Applying the exact neutral input and optimizing one parameter proves (1.1). The construction permits sources in the artificial filling; the curvature estimate is used only on the original source-free exterior.

Third, equality is studied by varying the original data. A measure multiplier for the full area envelope produces a lapse and shift, together with a positive normal-normal measure in the lapse Hessian. Atomic minimizing sheets are eliminated by a jump identity. Non-atomic sheets carry positive Jacobi fields; a capacity and tangent-cone argument controls their singular ends, and a one-dimensional BV argument removes diffuse multiplier mass on zero-lapse sheets. This is the part of the proof which retains the singular sets allowed in high dimension.

Finally, closed-form electromagnetic variations produce a global electric potential. Conservation of volume along electric flow lines forces alignment of the electric field and shift. A cutoff argument proves staticity across possible interior zeros of the Killing norm; those zeros are then excluded. A transformation to vacuum static data allows conformal doubling and a direct treatment of the compactified point. The resulting global base recovers the original spacelike embedding, its future normal, and the signed normalized electric field. Classical static uniqueness arguments motivate this final stage #cite(label("BuntingMasoodulAlam1987")) #cite(label("GibbonsIdaShiromizu2002")). Higher-dimensional static charged uniqueness was developed by Gibbons, Ida and Shiromizu #cite(label("GibbonsIdaShiromizu2002ChargedPRD")); the present equality argument must first obtain staticity and then recover the original slice.

The neutral companion paper #cite(label("NeutralV6S74")) and the three-dimensional charged companion paper #cite(label("ChargedV6S818")) supply methodological precedents. Only the displayed numerical neutral theorem is taken as a premise. We reproduce and justify the auxiliary constructions needed for the present dimension, field degree, regularity, and boundary conventions.

== 2 Data, conventions, and the precise conclusions <sec:statements>

Throughout the paper $n gt.eq 4$, $k = n - 1$, and

#[#set math.equation(numbering: n => "(2.1)")
 $ omega = "Area" \( bb(S)^k \, sigma_k \) \, #h(2em) c_n = sqrt(frac(k \( k - 1 \), 2)) . $ <eq:dimension-constants>]

The symmetrization of a covariant two-tensor includes a factor $1 \/ 2$. We use $Delta = "div" nabla$, whose principal symbol is negative. All boundary normals in expansions point into the exterior, toward its distinguished end.

=== 2.1 Initial data and electromagnetic normalization <initial-data-and-electromagnetic-normalization>

#prodef([Definition 2.1.])[
  (Admissible purely electric exterior).  Let $Omega$ be a connected oriented smooth $n$-manifold with nonempty compact smooth boundary $S$. The metric $g$, symmetric covariant two-tensor $K$, and vector field $E$ are smooth up to $S$. The metric space $\( Omega \, g \)$, including $S$, is complete. Outside a compact set there is exactly one coordinate end
  $ Omega \\ C tilde.eq { x in bb(R)^n : \| x \| > R_0 } . $
  In particular the remaining topology is compact; there are no additional ends. Put $tau = "tr"_g K$ and define
  #[#set math.equation(numbering: n => "(2.2)")
   $ 2 mu_m & = R_g + tau^2 - \| K \|_g^2 - k \( k - 1 \) \| E \|_g^2 \,\
\( J_m \)_i & = nabla^j \( K_(i j) - tau g_(i j) \) . $ <eq:matter-constraints>]
  We require
  #[#set math.equation(numbering: n => "(2.3)")
   $ mu_m gt.eq \| J_m \|_g \, #h(2em) "div"_g E = 0 \, #h(2em) mu_m \, med \| J_m \|_g in L^1 \( Omega \, upright(d) V_g \) . $ <eq:charged-dec>]
  For some $q > \( n - 2 \) \/ 2$, with $rho = \| x \|$, assume
  #[#set math.equation(numbering: n => "(2.4)")
   $ g_(i j) - delta_(i j) = O_2 \( rho^(- q) \) \, #h(2em) K_(i j) = O_1 \( rho^(- 1 - q) \) \, #h(2em) E^i = O_1 \( rho^(- k) \) . $ <eq:weak-asymptotics>]
  Here $O_j \( rho^(- a) \)$ bounds every coordinate derivative of order $ell lt.eq j$ by $C_ell rho^(- a - ell)$; it places no restriction on higher derivatives beyond smoothness. The following finite limits are assumed to exist:
  #[#set math.equation(numbering: n => "(2.5)")
   $ cal(E)_(upright("ADM")) & = frac(1, 2 k omega) lim_(R arrow.r oo) integral_(rho = R) \( partial_j g_(i j) - partial_i g_(j j) \) \( n_delta \)^i thin upright(d) A_delta \,\
\( upright(bold(P))_(upright("ADM")) \)_i & = frac(1, k omega) lim_(R arrow.r oo) integral_(rho = R) \( K_(i j) - tau g_(i j) \) \( n_delta \)^j thin upright(d) A_delta \,\
Q & = 1 / omega lim_(R arrow.r oo) integral_(rho = R) g \( E \, nu_R \) thin upright(d) A_g . $ <eq:adm-energy>]
  The ADM fluxes use Euclidean coordinate normals and area, whereas the charge flux uses $g$. No timelikeness assumption is imposed on the ADM vector. On each connected component $S_a$ choose a fixed sign $epsilon.alt_a in { 1 \, - 1 }$ and require
  #[#set math.equation(numbering: n => "(2.6)")
   $ H_(S_a) + epsilon.alt_a "tr"_(S_a) K lt.eq 0 \, #h(2em) H_(S_a) = "div"_(S_a) nu . $ <eq:mixed-trapping>]
  No condition is placed on the other expansion. The signs need not agree between components.
] <def:data>

The electric field in Definition 1 is normalized. Its decay makes $\| E \|^2$ integrable, so the total constraint energy

#[#set math.equation(numbering: n => "(2.7)")
 $ mu = mu_m + c_n^2 \| E \|^2 = 1 / 2 \( R_g + tau^2 - \| K \|^2 \) \, #h(2em) J = J_m \, $ <eq:total-constraints>]

is integrable as well. The closed flux form

#[#set math.equation(numbering: n => "(2.8)")
 $ alpha = i_E upright(d) V_g $ <eq:electric-flux-form>]

is convenient when changing metrics. No source-free extension of $alpha$ across $S$ is assumed.

#prodef([Definition 2.2.])[
  (Spacetime conventions).  A Lorentz metric $G$ has signature $\( - \, + \, dots.h \, + \)$. Its electromagnetic two-form $cal(F)$ is normalized by
  #[#set math.equation(numbering: n => "(2.9)")
   $ "Ric"_G - R_G / 2 G = 2 (cal(F)_(a c) cal(F)_b zws^c - 1 / 4 cal(F)_(c d) cal(F)^(c d) G_(a b)) + T_m \, #h(2em) upright(d) cal(F) = upright(d) \( *_G cal(F) \) = 0 . $ <eq:einstein-maxwell>]
  For a spacelike embedding $iota$ with future unit normal $N$, the induced conventions are
  #[#set math.equation(numbering: n => "(2.10)")
   $ K \( U \, V \) = G \( nabla_U N \, V \) \, #h(2em) E^flat = c_n^(- 1) iota^(*) \( i_N cal(F) \) \, #h(2em) iota^(*) cal(F) = 0 . $ <eq:induced-data>]
  The induced orientation is $iota^(*) \( i_N upright(d) V_G \)$, and $T_m \( N \, N \) = mu_m$, with momentum constraint $J_m$ as in (2.2). Thus the last condition in (2.10) is the purely electric condition on the initial slice. In dimensions above three, $E$ is not the unrescaled Faraday contraction.
] <def:normalization>

=== 2.2 Full enclosing cuts <full-enclosing-cuts>

#prodef([Definition 2.3.])[
  (Full cut and enclosing area).  A full enclosing cut is $Gamma = partial D$, the entire intrinsic manifold boundary of a connected smooth codimension-zero submanifold-with-boundary $D subset Omega$ which is closed in $Omega$, has manifold interior in $"int" Omega$, and contains the whole sufficiently distant coordinate end. The cut is compact, smooth, embedded and two-sided. Every component and every portion coincident with $S$ is counted. In particular $D = Omega$ contributes the cut $S$. Orient each component toward the end and set
  #[#set math.equation(numbering: n => "(2.11)")
   $ a = A_min = inf_Gamma "Area"_g \( Gamma \) \, #h(2em) r_A = \( a \/ omega \)^(1 \/ k) \, #h(2em) X_A = r_A^(k - 1) . $ <eq:enclosing-area>]
  The infimum refers to the original metric $g$. Neither its positivity nor the existence of a smooth minimizer is part of this definition.
] <def:full-cut>

Stokes’ theorem for the region between a full cut and a large coordinate sphere gives

#[#set math.equation(numbering: n => "(2.12)")
 $ integral_Gamma alpha = omega Q . $ <eq:full-cut-flux>]

Component fluxes may have either sign. The adjective “full” is essential: replacing $partial D$ by an empty relative frontier would discard the obstacle and change the problem.

=== 2.3 The precise neutral input <the-precise-neutral-input>

We record exactly the numerical result used below. Its stronger asymptotic assumptions, sign convention and strict timelikeness are retained at each application.

#thm([Theorem 2.4.])[
  (Neutral numerical input).  #emph[Let $d gt.eq 3$ and let $\( U^d \, h \, L \)$ be a connected oriented smooth initial-data exterior with nonempty compact smooth boundary $T$, complete with $T$ included, with compact complement of exactly one Euclidean coordinate end. Write 
$ 2 mu = R_h + \( "tr"_h L \)^2 - \| L \|_h^2 \, #h(2em) J = "div"_h \( L - \( "tr"_h L \) h \) . $

 Suppose $mu gt.eq \| J \|_h$, $mu \, \| J \|_h in L^1$, and for some 
$ frac(d - 2, 2) < q_0 < d - 2 $

 assume 
$ h - delta = O_6 \( r^(- q_0) \) \, #h(2em) L = O_5 \( r^(- 1 - q_0) \) . $

 Assume that the ADM limits exist, with energy factor $\[ 2 \( d - 1 \) omega_(d - 1) \]^(- 1)$ and momentum factor $\[ \( d - 1 \) omega_(d - 1) \]^(- 1)$ applied to the Euclidean fluxes in (2.5)–(2.5), with $g \, K \, tau$ replaced by $h \, L \, "tr"_h L$. Assume $cal(E)_(upright("ADM")) > \| upright(bold(P))_(upright("ADM")) \|$, and suppose every component of $T$ satisfies 
$ H_T + "tr"_T L lt.eq 0 $

 with normal toward the end. Let $A_(*) > 0$ be the infimum of the areas of full cuts in the sense of Definition 3, now in $\( U \, h \)$, with all components and contact with $T$ counted. Then 
#[#set math.equation(numbering: n => "(2.13)")
 $ sqrt(cal(E)_(upright("ADM"))^2 - \| upright(bold(P))_(upright("ADM")) \|^2) gt.eq 1 / 2 (A_(*) / omega_(d - 1))^(\( d - 2 \) \/ \( d - 1 \)) . $ <eq:neutral-input>]

 No minimizing cut is required to be smooth or attained. No spin, symmetry, maximality, vacuum or stationary-development hypothesis is imposed.]
] <thm:neutral-input>

Theorem 4 is the numerical part of the neutral companion result #cite(label("NeutralV6S74")) Definitions 1.1–1.2 and Theorem 1.3. It is an input to this paper. Its charged extension, its weak-decay extension, its mixed-sign extension, the exclusion of a null endpoint, and every elliptic construction below are proved here. No auxiliary lemma from either companion paper is implicitly included in this input. In particular, the three-dimensional charged theorem #cite(label("ChargedV6S818")) is not used as a premise.

=== 2.4 Numerical theorem and original-data equality <numerical-theorem-and-original-data-equality>

#thm([Theorem 2.5.])[
  (Purely electric spacetime Penrose inequality).  #emph[Assume Theorem 4. For every exterior in Definition 1, with full enclosing area as in Definition 3, 
#[#set math.equation(numbering: n => "(2.14)")
 $ 0 < a lt.eq "Area"_g \( S \) \, #h(2em) cal(E)_(upright("ADM")) > \| upright(bold(P))_(upright("ADM")) \| . $ <eq:numerical-conclusions>]

 Consequently the invariant mass 
$ m = sqrt(cal(E)_(upright("ADM"))^2 - \| upright(bold(P))_(upright("ADM")) \|^2) $

 is well defined and positive, and 
#[#set math.equation(numbering: n => "(2.15)")
 $ m gt.eq \| Q \| \, #h(2em) X_A lt.eq m + sqrt(m^2 - Q^2) . $ <eq:charged-bound>]

 Equivalently, the mass-charge bound applies when $0 < X_A lt.eq \| Q \|$, whereas 
#[#set math.equation(numbering: n => "(2.16)")
 $ m gt.eq 1 / 2 (X_A + Q^2 / X_A) #h(2em) upright("when ") X_A > \| Q \| . $ <eq:polynomial-branch>]

 For $Q = 0$ this is $m gt.eq X_A \/ 2$.]
] <thm:numerical>

#prodef([Definition 2.6.])[
  (Connected horizon class).  An exterior in Definition 1 is in the connected horizon class if $S$ is connected,
  #[#set math.equation(numbering: n => "(2.17)")
   $ H_S + "tr"_S K = 0 \, #h(2em) "Area"_g \( Gamma \) gt.eq A := "Area"_g \( S \) > 0 quad upright("for every full cut ") Gamma \, $ <eq:horizon-hypotheses>]
  and there is no smooth compact embedded two-sided full enclosing hypersurface entirely in $"int" Omega$, possibly disconnected, whose future outward expansion is nonpositive everywhere. No strictly positive stability eigenvalue, spherical topology, simple connectivity or stationary development is assumed.
] <def:rigidity-class>

For $M > \| q_0 \|$, put

#[#set math.equation(numbering: n => "(2.18)")
 $ f_(M \, q_0) \( r \) & = 1 - frac(2 M, r^(n - 2)) + q_0^2 / r^(2 n - 4) \,\
G_(M \, q_0) & = - f_(M \, q_0) upright(d) t^2 + f_(M \, q_0)^(- 1) upright(d) r^2 + r^2 sigma_k \,\
cal(F)_(M \, q_0) & = c_n q_0 r^(- k) upright(d) t and upright(d) r \,\
r_(+) \( M \, q_0 \) & = (M + sqrt(M^2 - q_0^2))^(1 \/ \( n - 2 \)) . $ <eq:rnt-model>]

The static coordinates describe $r > r_(+)$. The future horizon is understood in the regular ingoing or Kruskal extension, with orientation

$ upright(d) V_G = r^k upright(d) t and upright(d) r and upright(d) A_(sigma_k) . $

On a static slice the normalized field is $E = q_0 r^(- k) sqrt(f_(M \, q_0)) thin partial_r$.

#thm([Theorem 2.7.])[
  (Original-data rigidity).  #emph[Assume Theorem 4. Let the original data lie in the connected horizon class, suppose $m > \| Q \|$, and assume equality on the outer branch: 
#[#set math.equation(numbering: n => "(2.19)")
 $ (A / omega)^(\( n - 2 \) \/ \( n - 1 \)) = m + sqrt(m^2 - Q^2) . $ <eq:rigidity-equality>]

 Then the entire original $\( Omega \, g \, K \, E \)$, including $S$, is induced by a global smooth orientation-preserving spacelike embedding into one Reissner–Nordström–Tangherlini exterior (2.18) with parameters $\( m \, Q \)$ and its regular future-horizon extension. The embedding induces precisely the conventions in Definition 2; in particular its induced magnetic two-form vanishes. Moreover $mu_m = J_m = 0$ throughout $Omega$.]
  #emph[The image lies in the domain of outer communication together with the corresponding future horizon. The boundary maps either to a full smooth section of that horizon, meeting each generator once, or to the bifurcation sphere. The embedding and its future unit normal extend smoothly to $S$, and the distinguished end approaches the corresponding spatial infinity. No assertion is made behind $S$, in the extremal case, or for disconnected equality boundaries.]
] <thm:rigidity>

#thm([Theorem 2.8.])[
  (Converse and sharp examples).  #emph[Let $M > \| q_0 \|$ and let a smooth spacelike exterior hypersurface of (2.18) have boundary a full section of the corresponding future horizon or its bifurcation sphere. Suppose its induced normalized initial data satisfy all the hypotheses of Definitions 1 and 6, including the vanishing induced magnetic two-form, and suppose its actual invariant ADM mass and signed electric flux are $M$ and $q_0$. Then 
#[#set math.equation(numbering: n => "(2.20)")
 $ A_min = "Area"_g \( S \) = omega (M + sqrt(M^2 - q_0^2))^(\( n - 1 \) \/ \( n - 2 \)) \, $ <eq:converse-area>]

 and equality holds in Theorem 5. For every $n gt.eq 4$ and every $M > \| q_0 \|$, static examples and admissible examples with nonzero second fundamental form exist.]
] <thm:converse>

#prodef([Remark 2.9.])[
  (Purely electric slices).  The numerical theorem allows arbitrary ADM momentum. The equality classification includes precisely the model slices satisfying its field constraints. A generic boosted slice of a charged spacetime has a nonzero induced magnetic two-form. The examples in Theorem 8 therefore use compact radial time perturbations of a static slice; their purely electric character is checked directly.
]

=== 2.5 Organization and order of implication <organization-and-order-of-implication>

The proof proceeds in the following order. The exact neutral premise is Theorem 4.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[Result used by the next stage
], table.cell(rowspan: 1, colspan: 1)[Sections
]),
  table.cell(rowspan: 1, colspan: 1)[Numerical deformation
], table.cell(rowspan: 1, colspan: 1)[Positive area and timelike ADM vector; charged bound of Theorem 5
], table.cell(rowspan: 1, colspan: 1)[Section 3–6
],
  table.cell(rowspan: 1, colspan: 1)[Original-data variation
], table.cell(rowspan: 1, colspan: 1)[Lapse, shift and potential; elimination of the interior area multiplier
], table.cell(rowspan: 1, colspan: 1)[7–8
],
  table.cell(rowspan: 1, colspan: 1)[Static reduction
], table.cell(rowspan: 1, colspan: 1)[Positive Killing norm and a complete vacuum static base with regular boundary
], table.cell(rowspan: 1, colspan: 1)[9
],
  table.cell(rowspan: 1, colspan: 1)[Vacuum uniqueness
], table.cell(rowspan: 1, colspan: 1)[Global round identification; zero-mass rigidity uses the completed numerical theorem
], table.cell(rowspan: 1, colspan: 1)[10
],
  table.cell(rowspan: 1, colspan: 1)[Original-data recovery
], table.cell(rowspan: 1, colspan: 1)[Theorem 7 and the sharp examples of Theorem 8
], table.cell(rowspan: 1, colspan: 1)[11
],
)
]

The stationary fields are constructed without assuming a stationary development. The proof of zero-mass rigidity for the doubled vacuum metric uses only the numerical theorem already established at that point, so this later use introduces no circular dependence on Theorem 7.

== 3 Area positivity and preparation of the asymptotic end <prep:section>

This section makes the reductions needed before the scalar construction. The reductions preserve the electric flux form and the prescribed trapping sign on each original boundary component. They do not require a filling, a preferred slice, or a timelike ADM vector at the outset. The conclusion about the original ADM vector will follow only after the estimate for prepared data has been proved in Proposition 40. Throughout this section, $k = n - 1$, $omega = "Area" \( S^k \)$, and $c_n^2 = k \( k - 1 \) \/ 2$. Set

$ mu = 1 / 2 #scale(x: 120%, y: 120%)[\(] R_g + \( "tr"_g K \)^2 - \| K \|_g^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) J = "div"_g \( K - \( "tr"_g K \) g \) \, #h(2em) alpha = i_E "vol"_g . $

Thus $upright(d) alpha = 0$ on the original exterior. A smooth positive radius function, denoted by $r$, is fixed on the entire exterior and agrees with the coordinate radius outside a compact set. Constants on the compact part may depend on this extension.

=== 3.1 The full-cut convention and positive area <the-full-cut-convention-and-positive-area>

#thm([Lemma 3.1.])[
  (A bounded flux form).  #emph[Under the topological, completeness, and asymptotic hypotheses of Definition 1, the full-cut infimum satisfies 
$ 0 < a lt.eq "Area"_g \( S \) . $

 This assertion does not use the constraint inequalities or an assumed minimizing hypersurface.]
] <prep:positive-area>

#proof[
  Choose a small boundary disk in one component of $S$. A smooth embedded arc beginning transversely at that disk can be continued into the coordinate end and then along a straight coordinate ray. By shrinking a tubular neighborhood, obtain a proper embedded tube
  $ \[ 0 \, oo \) times B_delta^(n - 1) arrow.r Omega $
  whose initial face lies in the chosen boundary disk. The transverse coordinates have fixed small coordinate width sufficiently far along the ray. Choose a nonnegative function $zeta in C_c^oo \( B_delta^(n - 1) \)$ with integral one. The form
  $ zeta \( z \) thin upright(d) z^1 and dots.h.c and upright(d) z^(n - 1) $
  on the tube is closed. Extend it by zero across the lateral boundary; call the resulting smooth closed form $beta$. Its comass is bounded: on the compact part this follows from smoothness, and on the end from asymptotic Euclidean comparability and the fixed transverse width. Orient the initial disk so that $integral_S beta = 1$.
  Every full cut $Gamma$ is homologous to $S$ with the orientation toward the end. This can be seen by truncating both exteriors at one distant coordinate sphere and applying Stokes to their difference; portions of $S$ shared by the two boundaries cancel with their full multiplicity. Equivalently, integration over the compact difference of the two codimension-zero sets gives the same identity. Thus
  $ 1 = integral_Gamma beta lt.eq parallel beta parallel_(upright("comass") \, oo) "Area"_g \( Gamma \) . $
  Taking the infimum proves the lower bound. The admissible choice $Gamma = S$ gives the upper bound. In particular, this argument uses the entire intrinsic boundary and never replaces it by an empty relative frontier. ◻
]

The same Stokes comparison, applied to $alpha$, shows that every full cut has signed flux $omega Q$. No sign condition is imposed on the flux of an individual component. Fixing $alpha$ in all the following constructions therefore fixes both the signed total charge and all original boundary-component fluxes.

=== 3.2 Conformal changes and a conditional endpoint reduction <conformal-changes-and-a-conditional-endpoint-reduction>

We will also need a limited auxiliary magnetic class. Let $D_m$ be a smooth closed two-form of compact support, normalized by dividing the spatial Faraday form by $c_n$. Keep both $alpha$ and $D_m$ fixed when changing the metric. For $\| v \|_g lt.eq 1$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ I_g \( v \) = c_n^2 #scale(x: 120%, y: 120%)[\(] \| E \|_g^2 + \| D_m \|_g^2 + 2 D_m \( v \, E \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) mu_m + J_m \( v \) = mu + J \( v \) - I_g \( v \) . $ <prep:electromagnetic-cost>]

Here the norm of a two-form is the exterior-algebra norm. Completing a square gives

#[#set math.equation(numbering: n => "(3.2)")
 $ I_g \( v \) = c_n^2 #scale(x: 120%, y: 120%)[\(] \| D_m + v^flat and E^flat \|_g^2 + \| E \|_g^2 - \| v and E \|_g^2 #scale(x: 120%, y: 120%)[\)] gt.eq c_n^2 #scale(x: 120%, y: 120%)[\(] \| E \|_g^2 - \| v and E \|_g^2 #scale(x: 120%, y: 120%)[\)] . $ <prep:electromagnetic-square>]

In the purely electric case this is exactly the data convention in Definition 2. The auxiliary class will be used only for already future-timelike data with strict trapping and a strict charged margin. No magnetic endpoint theorem is being assumed.

#thm([Lemma 3.2.])[
  (Conformal constraint and expansion formulas).  #emph[Let $s$ be smooth and set $g_s = e^(2 s) g$, $K_s = e^s K$. If $v$ is a $g$-unit-ball vector, let $v_s = e^(- s) v$. Then 
#[#set math.equation(numbering: n => "(3.3)")
 $ e^(2 s) #scale(x: 120%, y: 120%)[\(] mu_s + J_s \( v_s \) #scale(x: 120%, y: 120%)[\)] & = mu + J \( v \) - k Delta_g s - frac(k \( n - 2 \), 2) \| upright(d) s \|_g^2 + k K \( nabla s \, v \) \,\
e^s #scale(x: 120%, y: 120%)[\(] H_s + epsilon.alt_a "tr"_(S_a \, g_s) K_s #scale(x: 120%, y: 120%)[\)] & = H + epsilon.alt_a "tr"_(S_a \, g) K + k partial_nu s . $ <prep:conformal-constraint>]

 The second formula holds for either fixed sign $epsilon.alt_a$. With $alpha$ fixed, $E_s = e^(- n s) E$, so in the purely electric case 
#[#set math.equation(numbering: n => "(3.4)")
 $ e^(2 s) I_(g_s) \( v_s \) = c_n^2 e^(- 2 \( n - 2 \) s) \| E \|_g^2 . $ <prep:electric-conformal-cost>]

 In particular, this cost does not increase if $s gt.eq 0$.]
] <prep:conformal>

#proof[
  The scalar-curvature and hypersurface conformal laws give
  $ e^(2 s) R_(g_s) = R_g - 2 k Delta_g s - k \( n - 2 \) \| upright(d) s \|_g^2 \, #h(2em) e^s H_s = H + k partial_nu s . $
  Also $"tr"_(g_s) K_s = e^(- s) "tr"_g K$. If $Pi = K - \( "tr"_g K \) g$, then $Pi_s = e^s Pi$. Contracting the connection difference
  $ \( nabla^s - nabla \)^l zws_(i j) = s_i delta_j^l + s_j delta_i^l - s^l g_(i j) $
  gives $J_s = e^(- s) \( J + k K \( nabla s \, dot.op \) \)$. These identities prove (3.3)–(3.3). Finally, $"vol"_(g_s) = e^(n s) "vol"_g$ and $i_(E_s) "vol"_(g_s) = alpha$, proving the assertion about $E_s$ and its norm. ◻
]

For $s = 2 log U \/ \( n - 2 \)$, the new bulk term in (3.3) is exactly

#[#set math.equation(numbering: n => "(3.5)")
 $ frac(2 k, \( n - 2 \) U) #scale(x: 120%, y: 120%)[\(] - Delta_g U + K \( nabla U \, v \) #scale(x: 120%, y: 120%)[\)] . $ <prep:U-constraint>]

This form of the identity will be used for the end repairs.

#thm([Lemma 3.3.])[
  (Increasing the ADM energy).  #emph[For purely electric data with the weak asymptotic hypotheses, choose $0 < beta < min { 1 \, q }$. There is a smooth positive function $phi.alt_0$, constant on a compact set containing $S$, such that 
$ phi.alt_0 = r^(2 - n) \( 1 - r^(- beta) \) quad upright("far out") \, #h(2em) - Delta_g phi.alt_0 gt.eq \| K \|_g \| upright(d) phi.alt_0 \|_g . $

 For each $t gt.eq 0$, the change 
$ U_t = 1 + t phi.alt_0 \, #h(2em) g_t = U_t^(4 \/ \( n - 2 \)) g \, #h(2em) K_t = U_t^(2 \/ \( n - 2 \)) K $

 with fixed $alpha$ preserves all numerical hypotheses, all prescribed trapping signs, and the signed charge. It satisfies 
#[#set math.equation(numbering: n => "(3.6)")
 $ cal(E)_(upright("ADM")) \( g_t \, K_t \) = cal(E)_(upright("ADM")) \( g \, K \) + 2 t \, #h(2em) upright(bold(P))_(upright("ADM")) \( g_t \, K_t \) = upright(bold(P))_(upright("ADM")) \( g \, K \) \, #h(2em) a \( g_t \) gt.eq a \( g \) . $ <prep:end-increase-charges>]

 If the input has stronger asymptotic derivative bounds, those same derivative bounds are preserved. In particular, the lemma applies with $E = 0$ to the strong-tail neutral data used in Theorem 4.]
] <prep:end-increase>

#proof[
  For $f \( r \) = r^(2 - n) \( 1 - r^(- beta) \)$, asymptotic differentiation gives
  $ - Delta_g f = beta \( n - 2 + beta \) r^(- n - beta) + O \( r^(- n - q) \) \, #h(2em) \| K \|_g \| upright(d) f \|_g = O \( r^(- n - q) \) . $
  Thus the desired strict inequality holds on a sufficiently distant coordinate region. On that region $- f' > 0$. Multiply $- f'$ by a smooth nondecreasing cutoff that changes from zero to one, entirely in this valid region, and integrate from infinity. If $chi$ is the cutoff, the resulting radial function satisfies
  $ - Delta_g phi.alt_0 - \| K \|_g \| upright(d) phi.alt_0 \|_g = chi #scale(x: 120%, y: 120%)[\(] - Delta_g f - \| K \|_g \| upright(d) f \|_g #scale(x: 120%, y: 120%)[\)] + chi' \( - f' \) \| upright(d) r \|_g^2 gt.eq 0 . $
  It is positive and constant on the remaining core. Equations (3.5) and (3.4) preserve charged DEC; the expansion is only rescaled on $S$. The asymptotic constraints remain integrable, since the new Laplacian term is $O \( r^(- n - beta) \)$, the drift term is $O \( r^(- n - q) \)$, and the gradient-square term is integrable. All other end bounds persist.
  The leading change of the metric is $4 t r^(2 - n) delta \/ \( n - 2 \)$, which has ADM energy $2 t$ in the stated normalization. The change in the momentum integrand has sphere integral $O \( r^(- q) \)$, and hence zero limit. Charge is unchanged because its flux form is unchanged. Finally $U_t gt.eq 1$, so every full-cut area increases. ◻
]

#prodef([Remark 3.4.])[
  (Order of the endpoint argument).  Suppose the numerical estimate has first been proved for all future-timelike purely electric data, without assuming the conclusion for other data. If an original data set had $cal(E)_(upright("ADM")) lt.eq \| upright(bold(P))_(upright("ADM")) \|$, apply that estimate to Lemma 12 with
  $ t > t_(*) := frac(\| upright(bold(P))_(upright("ADM")) \| - cal(E)_(upright("ADM")), 2) . $
  The invariant mass tends to zero as $t arrow.b t_(*)$, whereas the neutral part of the numerical estimate gives the fixed positive lower bound $X_A \/ 2$. This contradiction excludes the endpoint. Thus the following preparation needs to treat future-timelike data only; the remark is a conditional reduction, not an invocation of the neutral input on null data.
] <prep:endpoint-order>

=== 3.3 Compact inverses for the linear cutoff errors <compact-inverses-for-the-linear-cutoff-errors>

#thm([Lemma 3.5.])[
  (Compact inverses with the required moments).  #emph[Fix nested compact subannuli inside ${ 1 < \| z \| < 4 }$, with sufficiently many intermediate subannuli to allow two support enlargements, and fix $1 < p < oo$. For smooth sources supported in the innermost subannulus there are linear constructions with the following properties.]
  + #emph[If $f$ has zero constant and affine moments, there is a compactly supported symmetric tensor $H$ in the outer subannulus satisfying 
$ partial_i partial_j H_(i j) = f \, #h(2em) parallel H parallel_(W^(3 \, p)) lt.eq C parallel f parallel_(W^(1 \, p)) . $

]
  + #emph[If the vector source $F$ has zero moments against all Euclidean translations and rotations, there is a compactly supported symmetric tensor $B$ in the outer subannulus satisfying 
$ partial_j B_(i j) = F_i \, #h(2em) parallel B parallel_(W^(2 \, p)) lt.eq C parallel F parallel_(W^(1 \, p)) . $

]
  #emph[All supports and constants are fixed independently of the sources. There are fixed smooth moment projections $Pi_(upright("aff"))$ and $Pi_(upright("Kill"))$ onto compactly supported bumps such that the preceding inverses apply to $f - Pi_(upright("aff")) f$ and $F - Pi_(upright("Kill")) F$. The norms of these projections are bounded by the sums of the absolute values of the corresponding moments. In particular, when $p > n$, the two corrections have controlled $C^(2 \, gamma)$ and $C^(1 \, gamma)$ norms, where $gamma = 1 - n \/ p > 0$.]
] <prep:compact-inverses>

#proof[
  We first describe a compact scalar divergence inverse. On a ball a regularized Bogovskii operator, with a fixed $rho in C_c^oo$ of integral one, is given by
  $ \( cal(B)_rho h \) \( x \) = integral h \( y \) \( x - y \) integral_1^oo rho \( y + t \( x - y \) \) t^(n - 1) thin upright(d) t thin upright(d) y . $
  It has divergence $h - rho integral h$ and gains one Sobolev derivative; see #cite(label("CostabelMcIntosh2010")). Its support is contained in the convex hull of the supports of $h$ and $rho$. The derivative bounds needed here also follow directly from the first-derivative estimate and
  $ partial_j cal(B)_rho h = cal(B)_rho \( partial_j h \) + cal(B)_(partial_j rho) h \, $
  first for compactly supported smooth $h$. The kernel estimate does not require the new kernel $partial_j rho$ to have integral one.
  To work in a connected annulus, cover the prescribed source support by finitely many balls compactly contained in a larger subannulus, adding balls along paths so that the intersection graph is connected. Choose a partition of unity and a spanning tree of that graph. In each parent–child overlap fix a unit-integral smooth bump. Transfer the integral of a child source to its parent using that bump, beginning at the leaves. This writes a source of total integral zero as a sum of mean-zero sources on the balls. The transfer coefficients are bounded by the original source norm. Summing the ball operators gives an operator $cal(B)$ with
  #[#set math.equation(numbering: n => "(3.7)")
   $ "div" cal(B) h = h \, #h(2em) parallel cal(B) h parallel_(W^(j + 1 \, p)) lt.eq C_j parallel h parallel_(W^(j \, p)) \, #h(2em) j = 0 \, 1 \, 2 \, $ <prep:bogovskii-bounds>]
  and support in a fixed larger compact subset of the annulus.
  For (i), set $u = cal(B) f$. Its component means vanish, since compact support and integration by parts give
  $ integral u_i = - integral z_i partial_j u_j = - integral z_i f = 0 . $
  Apply $cal(B)$ to each $u_i$ to obtain $T_(i j)$ with $partial_j T_(i j) = u_i$. The symmetric part $H = \( T + T^(sans(T)) \) \/ 2$ has the same double divergence as $T$. Two applications of (3.7) give its $W^(3 \, p)$ bound.
  For (ii), translation moments first give a row primitive $B^0$ with $partial_j B_(i j)^0 = F_i$ and a $W^(2 \, p)$ bound. Write $A_(i j) = \( B_(i j)^0 - B_(j i)^0 \) \/ 2$. Rotation moments imply
  $ 2 integral A_(i j) = - integral \( z_j F_i - z_i F_j \) = 0 . $
  Solve $partial_l D_(i j l) = - A_(i j)$ using (3.7), choosing $D_(i j l) = - D_(j i l)$. Thus $D$ has a $W^(3 \, p)$ bound. Define
  $ C_(i j) = partial_l \( D_(i j l) - D_(i l j) - D_(j l i) \) . $
  Then
  $ C_(i j) - C_(j i) = - 2 A_(i j) \, #h(2em) partial_j C_(i j) = 0 . $
  For the divergence identity the first two terms cancel after exchanging $j \, l$, and the third vanishes by antisymmetry in those indices. Consequently $B = B^0 + C$ is symmetric, has the required divergence, and has a $W^(2 \, p)$ bound. None of these differentiations enlarges support.
  For completeness, the moment bumps can be fixed without a choice depending on the source. Let $eta$ be a smooth nonnegative function supported in the innermost subannulus and positive on a ball. For the affine basis $phi_a in { 1 \, z_1 \, dots.h \, z_n }$, the matrix $G_(a b) = integral eta phi_a phi_b$ is positive definite. The functions $eta sum_b \( G^(- 1) \)_(a b) phi_b$ are dual moment bumps. For vector sources use instead a basis of Euclidean Killing fields and its Gram matrix for the $eta$-weighted Euclidean inner product. A nonzero affine function or Killing field cannot vanish on a ball, so both Gram matrices are invertible. These projections have all the asserted norm and support bounds. Sobolev embedding finishes the proof. ◻
]

=== 3.4 A strict conformal direction with weak asymptotic data <a-strict-conformal-direction-with-weak-asymptotic-data>

#thm([Lemma 3.6.])[
  (The decaying Neumann problem and strictification).  #emph[Assume $g - delta = O_2 \( r^(- q) \)$ with $q > \( n - 2 \) \/ 2$, and let $0 < beta < min { 1 \, q }$. Let $B gt.eq 0$ be smooth, with $B gt.eq \| K \|_g$ and $B = O_1 \( r^(- 1 - q) \)$. It is permissible instead that $B$ be compactly supported. There is a unique smooth positive decaying solution 
#[#set math.equation(numbering: n => "(3.8)")
 $ - Delta_g phi.alt = B sqrt(\| upright(d) phi.alt \|_g^2 + r^(- 2 k)) + r^(- n - beta) \, #h(2em) partial_nu phi.alt = - 1 med upright("on ") S \, #h(2em) phi.alt arrow.r 0 med upright("at infinity") . $ <prep:neumann-equation>]

 It satisfies 
#[#set math.equation(numbering: n => "(3.9)")
 $ phi.alt = O_2 \( r^(2 - n) \) \, #h(2em) frac(- Delta_g phi.alt, r^(- n - beta)) arrow.r 1 \, #h(2em) lim_(R arrow.r oo) integral_(S_R) partial_(nu_R) phi.alt thin upright(d) A_g upright(" exists and is strictly negative") . $ <prep:neumann-asymptotics>]

 If $B$ is compactly supported and the metric end has all-order $r^(2 - n)$ bounds, then $phi.alt = O_l \( r^(2 - n) \)$ for every $l$.]
  #emph[For purely electric data satisfying charged DEC and the specified weak trapping inequalities, the change 
$ g_delta = e^(2 delta phi.alt) g \, #h(2em) K_delta = e^(delta phi.alt) K \, #h(2em) alpha_delta = alpha $

 has, for every sufficiently small $delta > 0$, a charged margin $mu_(m \, delta) - \| J_(m \, delta) \| gt.eq c delta r^(- n - beta)$ and strict trapping for every prescribed sign. It changes the ADM energy by $O \( delta \)$, leaves momentum and charge unchanged, and changes the metric by a uniform factor tending to one. It does not decrease any full-cut area. The same conclusion holds for a fixed compactly supported $D_m$ if there is already a positive charged margin on its support.]
] <prep:strictification>

#proof[
  Write $a_0 = r^(- k)$ and $rho_0 = r^(- n - beta)$. Truncate at a distant coordinate sphere $S_R$, and continue in $lambda in \[ 0 \, 1 \]$ the problem
  $ - Delta_g phi.alt_R = lambda B sqrt(\| upright(d) phi.alt_R \|_g^2 + a_0^2) + rho_0 \, #h(2em) partial_nu phi.alt_R = - 1 upright(" on ") S \, #h(2em) phi.alt_R = 0 upright(" on ") S_R . $
  The inner Neumann and outer Dirichlet faces are disjoint. The Poisson problem at $lambda = 0$ has a unique smooth solution. The linearization at any solution is
  $ - Delta_g h - lambda B frac(chevron.l upright(d) phi.alt_R \, upright(d) h chevron.r_g, sqrt(\| upright(d) phi.alt_R \|_g^2 + a_0^2)) \, #h(2em) partial_nu h = 0 \, quad h \|_(S_R) = 0 . $
  Its drift is bounded by $B$; the maximum principle and boundary Hopf lemma give a trivial kernel. Fredholm theory for this scalar mixed boundary problem, or continuation from the mixed Laplacian, then gives invertibility. We use the usual scalar local and boundary estimates in this argument; see #cite(label("GilbargTrudinger2001")). There is no meeting edge between Dirichlet and Neumann conditions.
  Every solution is nonnegative. An interior negative minimum contradicts the positive right side, and a minimum on $S$ contradicts the inward derivative $- 1$. Given a supremum bound, local and boundary $W^(2 \, p)$ estimates, interpolation, and the at-most-linear gradient growth of the equation give uniform $W^(2 \, p)$ bounds on a fixed truncation. More explicitly, for $p > n$,
  $ parallel phi.alt_R parallel_(W^(2 \, p)) lt.eq C_R \( 1 + parallel upright(d) phi.alt_R parallel_(L^p) + parallel phi.alt_R parallel_(L^p) \) lt.eq 1 / 2 parallel phi.alt_R parallel_(W^(2 \, p)) + C'_R \( 1 + parallel phi.alt_R parallel_oo \) . $
  The resulting $C^(1 \, gamma)$ bound makes the right side $C^(0 \, gamma)$, and Schauder estimates and differentiation give smooth bounds. Positivity of $a_0$ makes the square root a smooth function of the gradient on every compact set.
  We next obtain the required supremum bounds. A normalized blow-up on a fixed truncation, if those bounds failed, would give a nonzero nonnegative solution $v$ of
  $ - Delta_g v = lambda B \| upright(d) v \| \, #h(2em) partial_nu v = 0 \, #h(2em) v \|_(S_R) = 0 . $
  The preceding estimates apply to the normalized solutions as well. The limiting equation is homogeneous with bounded drift: where $upright(d) v eq.not 0$ use $lambda B nabla v \/ \| upright(d) v \|$, and set the drift to zero elsewhere. The maximum principle and Hopf lemma exclude such a $v$. This closes the continuation on every fixed truncation.
  For uniformity as $R arrow.r oo$, use $f_0 \( r \) = r^(2 - n) \( 1 - r^(- beta) \)$ on a sufficiently distant fixed region. As in Lemma 12,
  $ - Delta_g f_0 - B \| upright(d) f_0 \| gt.eq c_0 rho_0 \, #h(2em) B a_0 = O \( r^(- n - q) \) lt.eq C_0 rho_0 . $
  For $A$ larger than a fixed constant and chosen also to dominate the values on a fixed inner sphere $S_(R_0)$, $A f_0$ is a supersolution, because
  $ lambda B sqrt(A^2 \| upright(d) f_0 \|^2 + a_0^2) + rho_0 lt.eq A B \| upright(d) f_0 \| + B a_0 + rho_0 lt.eq - Delta_g \( A f_0 \) . $
  Subtraction of the two equations produces a bounded-drift inequality, so comparison is valid without a gradient monotonicity assumption. The outer Dirichlet inequality is automatic. It follows that
  #[#set math.equation(numbering: n => "(3.10)")
   $ 0 lt.eq phi.alt_R \( x \) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + sup_(S_(R_0)) phi.alt_R #scale(x: 120%, y: 120%)[\)] r^(2 - n) \, #h(2em) R_0 lt.eq r lt.eq R \, $ <prep:neumann-tail-comparison>]
  with $C$ independent of $R$ and $lambda$.
  If the suprema on an exhaustion were unbounded, divide by those suprema. Estimate (3.10) forces their unit maxima into a fixed compact set and bounds their tails by a fixed multiple of $r^(2 - n)$. Local estimates, including the fixed inner Neumann charts, yield a nonzero decaying limit solving the same homogeneous bounded-drift equation with zero Neumann data on $S$. Its positive maximum is attained either in the interior or on $S$; the strong maximum principle and Hopf lemma exclude both alternatives. This proves a uniform supremum bound. Exhaustion and local compactness now produce a smooth solution of (3.8). It is strictly positive by the same minimum argument. The difference of two decaying solutions solves a homogeneous equation with bounded drift and zero Neumann data, giving uniqueness.
  To check the asymptotic derivatives using only the weak hypotheses, rescale on fixed end annuli by $phi.alt_R^(*) \( z \) = R^(n - 2) phi.alt \( R z \)$ and $g_R \( z \) = g \( R z \)$. The equation becomes
  $ - Delta_(g_R) phi.alt_R^(*) = R B \( R z \) sqrt(\| upright(d) phi.alt_R^(*) \|_(g_R)^2 + \| z \|^(- 2 k)) + R^(- beta) \| z \|^(- n - beta) . $
  Its solutions have uniformly bounded suprema by (3.10). The two controlled derivatives of $g$ give uniformly Lipschitz first-order coefficients and uniformly Hölder principal coefficients on these rescaled annuli. $W^(2 \, p)$ estimates followed by $C^(1 \, gamma)$ and Schauder estimates therefore give uniform second-derivative bounds. This proves $phi.alt = O_2 \( r^(2 - n) \)$ without a bound on a third metric derivative. If all end derivatives of $g$ are controlled and $B = 0$ there, the same argument differentiates repeatedly. The equation and these bounds also give
  $ B sqrt(\| upright(d) phi.alt \|^2 + r^(- 2 k)) = O \( r^(- n - q) \) \, $
  which proves the ratio limit in (3.9). The source is integrable. The divergence theorem, remembering that the outward domain normal on $S$ is $- nu$, gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ integral_(S_R) partial_(nu_R) phi.alt thin upright(d) A_g = - "Area"_g \( S \) - integral_(Omega ∩ { r lt.eq R }) #scale(x: 120%, y: 120%)[\(] B sqrt(\| upright(d) phi.alt \|^2 + r^(- 2 k)) + rho_0 #scale(x: 120%, y: 120%)[\)] thin upright(d) V_g . $ <prep:neumann-flux>]
  The flux thus has a finite negative limit. Its difference from the Euclidean derivative flux is $O \( R^(- q) \)$.
  For the final strictification, apply (3.3) with $s = delta phi.alt$. The new linear bulk term obeys
  $ k delta #scale(x: 120%, y: 120%)[\(] - Delta_g phi.alt + K \( nabla phi.alt \, v \) #scale(x: 120%, y: 120%)[\)] gt.eq k delta rho_0 . $
  Moreover
  $ \| upright(d) phi.alt \|^2 \/ rho_0 = O \( r^(2 - n + beta) \) $
  is globally bounded. Thus for sufficiently small $delta$ the quadratic term costs at most $k delta rho_0 \/ 2$. In the purely electric case the conformal electromagnetic cost decreases. On a fixed magnetic support any existing positive margin absorbs the small change in (3.1); outside that support the purely electric argument applies. This proves a positive multiple of $delta rho_0$ as a charged margin. On every original boundary component, exactly,
  $ H_delta + epsilon.alt_a "tr"_(S_a \, g_delta) K_delta = e^(- delta phi.alt) #scale(x: 120%, y: 120%)[\(] H + epsilon.alt_a "tr"_(S_a \, g) K - k delta #scale(x: 120%, y: 120%)[\)] < 0 . $
  The energy change is
  #[#set math.equation(numbering: n => "(3.12)")
   $ cal(E)_(upright("ADM")) \( g_delta \, K_delta \) - cal(E)_(upright("ADM")) \( g \, K \) = - delta / omega lim_(R arrow.r oo) integral_(S_R) partial_(nu_R) phi.alt thin upright(d) A_g . $ <prep:strictification-energy>]
  Terms quadratic in the decaying conformal factor have vanishing ADM flux. The momentum change again has zero limit, since its integrand has one extra factor $phi.alt = O \( r^(2 - n) \)$. Charge is fixed by $alpha$. Finally $phi.alt$ is positive and bounded, giving both the area monotonicity and the uniform relative metric convergence. On a prepared end $K = B = 0$, and the scalar conformal formula with $- Delta phi.alt = rho_0$ also proves the asserted prepared scalar decay $O \( r^(- n - beta) \)$. ◻
]

#thm([Corollary 3.7.])[
  (Strict direction for compact variations).  #emph[On the original weakly asymptotically flat exterior, choose a smooth majorant $B gt.eq \| K \|$ equal to $C r^(- 1 - q)$ far out and apply Lemma 15. Consider the tangent direction 
$ \( g' \, K' \, alpha' \, D'_m \) = \( 2 phi.alt g \, phi.alt K \, 0 \, 0 \) $

 at purely electric data, transporting $v$ by the metric square root. On an active ray $mu_m + J_m \( v \) = 0$, the derivative $frak(C)' = 2 \( mu_m + J_m \( v \) \)'$ satisfies 
#[#set math.equation(numbering: n => "(3.13)")
 $ frak(C)' = 2 k #scale(x: 120%, y: 120%)[\(] - Delta phi.alt + K \( nabla phi.alt \, v \) #scale(x: 120%, y: 120%)[\)] + 4 \( n - 2 \) c_n^2 phi.alt \| E \|^2 gt.eq 2 k rho_0 \, #h(2em) frak(C)' \/ rho_0 arrow.r 2 k . $ <prep:strict-ray-derivative>]

 At a marginal boundary $theta'_(+) = - k$. The energy derivative is finite, the momentum derivative is zero, and $phi.alt = O_2 \( r^(2 - n) \)$.]
] <prep:strict-direction>

#proof[
  A smooth radial majorant on the end can be patched to a sufficiently large smooth function on the core; it need not reproduce higher derivatives of $K$. Differentiate (3.3) and (3.4). The derivative of the overall factor $e^(- 2 delta phi.alt)$ multiplies the active value zero. The drift term is $O \( r^(- n - q) \)$, and the electric term divided by $rho_0$ tends to zero. The assertions now follow from (3.9), (3.3), and (3.12). ◻
]

=== 3.5 Matching a neutral vacuum end and moving it to rest <matching-a-neutral-vacuum-end-and-moving-it-to-rest>

We state the reduction in a form that includes the small magnetic variations needed later. The purely electric case requires no strict margin in the original data.

#thm([Proposition 3.8.])[
  (Preparation at rest).  #emph[Suppose the original data have a future-timelike ADM vector, and set $m = \( cal(E)_(upright("ADM"))^2 - \| upright(bold(P))_(upright("ADM")) \|^2 \)^(1 \/ 2) > 0$. Choose once and for all 
$ frac(n - 2, 2) < q < n - 2 \, #h(2em) 0 < beta < min { 1 \, q } \, $

 weakening the original decay exponent if necessary. There is a sequence of smooth data on the same exterior, with the same electric flux form and charge, satisfying 
#[#set math.equation(numbering: n => "(3.14)")
 $ & K_j upright(" is compactly supported") \, #h(2em) g_j - delta = O_l \( r^(2 - n) \) quad upright("for every ") l \,\
 & R_(g_j) = O \( r^(- n - beta) \) \, #h(2em) mu_(m \, j) - \| J_(m \, j) \|_(g_j) gt.eq c_j r^(- n - beta) \, #h(2em) H_j + epsilon.alt_a "tr"_(S_a \, g_j) K_j < 0 \, $ <prep:prepared-properties>]

 where $c_j > 0$. Its momentum vanishes and 
#[#set math.equation(numbering: n => "(3.15)")
 $ cal(E)_(upright("ADM")) \( g_j \, K_j \) arrow.r m \, #h(2em) liminf_(j arrow.r oo) a \( g_j \) gt.eq a \( g \) . $ <prep:prepared-limits>]

 The same conclusion holds with a fixed compactly supported closed $D_m$, provided the original data are already future-timelike, have strict trapping, and satisfy a strict charged margin $mu_m - \| J_m \| gt.eq c r^(- n - beta)$ for some $c > 0$. The constants and support radii in (3.14) need not be uniform in $j$.]
] <prep:rest-preparation>

#proof[
  The proof has four stages. The last, a small strictification, is supplied by Lemma 15. We first construct data with nonnegative charged margin, compactly supported second tensor, and energy approaching $m$.
  ===== 3.5.1 The matching vacuum plane. <the-matching-vacuum-plane.>
  In isotropic coordinates $\( b \, y \)$, the Schwarzschild–Tangherlini metric of mass $m$ has spatial factor $\( 1 + m \| y \|^(2 - n) \/ 2 \)^(4 \/ \( n - 2 \))$. Its leading spacetime perturbation from Minkowski space is
  $ 2 m \| y \|^(2 - n) (upright(d) b^2 + frac(\| upright(d) y \|^2, n - 2)) \, $
  with remainders of squared order and their derivatives. After rotating the original end coordinates, choose $v in \[ 0 \, 1 \)$ and $gamma = \( 1 - v^2 \)^(- 1 \/ 2)$ so that the desired ADM vector is $\( gamma m \, gamma m v \, 0 \, dots.h \, 0 \)$. Put
  $ b = gamma \( T + v x^1 \) \, #h(2em) y^1 = gamma \( x^1 + v T \) \, #h(2em) y^perp = x^perp \, $
  and take the plane $T = 0$ with the future normal. Its induced metric has leading spatial perturbation
  $ h_(i j)^(upright("pl")) = frac(2 m, n - 2) \| y \|^(2 - n) #scale(x: 120%, y: 120%)[\(] delta_(i j) + k \( gamma^2 - 1 \) delta_(i 1) delta_(j 1) #scale(x: 120%, y: 120%)[\)] . $
  Direct differentiation gives the leading energy flux vector $2 k m gamma^2 x_i \| y \|^(- n)$. With the convention $K = G \( nabla N \, dot.op \)$, the linear expression
  $ 2 K_(i j) = partial_T g_(i j) - partial_i g_(0 j) - partial_j g_(0 i) $
  gives first momentum row $k m gamma^2 v x_i \| y \|^(- n)$; the transverse fluxes integrate to zero by reflection. The identity
  $ 1 / omega integral_(S^(n - 1)) \| A theta \|^(- n) thin upright(d) A_theta = frac(1, det A) \, #h(2em) A = "diag" \( gamma \, 1 \, dots.h \, 1 \) \, $
  follows by computing the volume of the ellipsoid $\| A x \| lt.eq 1$ in polar coordinates. Hence the plane has exactly the specified energy and momentum with the problem’s ADM normalizations. This is a neutral vacuum model; the electric form will subsequently be retained on the underlying exterior, not induced from a charged boosted slice.
  ===== 3.5.2 Cutoff errors and their moments. <cutoff-errors-and-their-moments.>
  Let $L arrow.r oo$ and work on $1 < \| z \| < 4$, $x = L z$. Use a fixed cutoff, constant near both boundary spheres, to interpolate the components $g \( L z \)$ and $L K \( L z \)$ to the matching plane. The flat linear constraint operators on a metric perturbation $h$ and a tensor $p$ are
  $ cal(L) h = partial_i partial_j h_(i j) - Delta "tr"_delta h \, #h(2em) \( cal(M) p \)_i = partial_j \( p_(i j) - \( "tr"_delta p \) delta_(i j) \) . $
  Relative to the cutoff interpolation of the scaled physical sources $\( 2 mu \, J \)$, the new sources are the flat cutoff commutators plus a $C^0$ remainder $O \( L^(- 2 q) \)$. The scalar commutator consists of $\( D chi \) \( D h \)$ and $\( D^2 chi \) h$; its $W^(1 \, p)$ norm is $O \( L^(- q) \)$ using only the given $C^2$ bounds on $g$. The vector commutator is $\( D chi \) \( p - \( "tr" p \) delta \)$ and has the same $W^(1 \, p)$ bound using only the given $C^1$ bounds on $K$. We do not differentiate the nonlinear remainder or the physical constraint sources.
  All affine scalar moments and Killing vector moments of these commutators are $o \( L^(2 - n) \)$. Here is the reason that no center-of-mass or angular-momentum limit is required. In physical coordinates the difference between a flat linear source and its physical source is $O \( r^(- 2 q - 2) \)$, which is integrable. The physical sources are integrable by hypothesis, and the matching vacuum end has integrable linear sources for the same reason. For any such integrable source $F$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ integral_(r < 4 L) r \| F \| thin upright(d) x = o \( L \) . $ <prep:first-moment-oL>]
  Indeed split at a fixed radius, divide by $L$, and then make the integrable tail small. Green’s formula for $cal(L)$ against an affine function and for $cal(M)$ against a Killing field therefore bounds the corresponding linear boundary fluxes by $o \( L \)$. For constant scalar and translation tests, the difference of boundary fluxes tends to zero by the matched ADM vector. The difference between the physical and flat momentum boundary integrands has integral $O \( r^(n - 2 - 2 q) \) = o \( 1 \)$, so the same matching applies to $cal(M)$. Integrating a commutator against a test leaves these boundary terms minus a cutoff-weighted source integral. For a degree-one test the latter, divided by $L$, tends to zero by (3.16); for a constant test it tends to zero by integrability. Rescaling $upright(d) x = L^n upright(d) z$ and the second-order source by $L^2$ proves the claimed $o \( L^(2 - n) \)$ moments.
  Apply Lemma 14 to cancel the commutators after their moment projections have been removed. Invert the full trace reversal $h mapsto h - \( "tr" h \) delta$ and $p mapsto p - \( "tr" p \) delta$ after constructing the two symmetric primitives. This changes no norm or support conclusion. Taking $p > n$, the resulting corrections have scaled $C^2 \, C^1$ norms $O \( L^(- q) \)$. They are smooth and supported strictly inside the transition annulus. The remaining moment bumps are $o \( L^(2 - n) \)$ in these fixed-scale norms. Nonlinear constraint errors are still $O \( L^(- 2 q) \)$; comparison of the original and interpolated unit balls incurs the same order. In physical coordinates the charged DEC deficit on this annulus is consequently
  #[#set math.equation(numbering: n => "(3.17)")
   $ o \( L^(- n) \) . $ <prep:annular-deficit>]
  The retained electric field contributes at most $O \( L^(- 2 k) \)$, also $o \( L^(- n) \)$. For the auxiliary magnetic class its compact support is inside the untouched core once $L$ is large. Positive definiteness follows from the small scaled metric correction. Only the two weak asymptotic derivative bounds were used in this construction.
  ===== 3.5.3 Bending and a conformal repair. <bending-and-a-conformal-repair.>
  Beyond the gluing annulus, use $y$ as spatial parameters on the neutral vacuum model. The plane is $b = v y^1$. Multiply this function by a cutoff that decreases slowly as a function of $log \( \| y \| \/ L \)$, and that is zero after a fixed sufficiently long interval in that variable. Its derivative can be chosen so small, in terms of the fixed $v < 1$, that the Euclidean slope stays strictly below one. For large $L$ the graph is then spacelike in the exact vacuum model as well. It joins the matching plane to the static slice $b = 0$ within a fixed scaled annulus. The resulting induced metric is uniformly Euclidean-comparable there, with
  $ \| D g \| + \| K \| lt.eq C \/ r . $
  The constants may depend on the original timelike vector; no uniformity as that vector tends to null is required. The graph is exactly vacuum, so its only charged deficit is the cost of the retained electric form.
  We repair both deficits by (3.5). Choose numbers $delta_L arrow.b 0$ dominating the coefficient in (3.17). Choose next $epsilon_L arrow.b 0$ so slowly that
  $ delta_L \/ epsilon_L arrow.r 0 \, #h(2em) L^(2 - n) \/ epsilon_L arrow.r 0 . $
  On the fixed scaled radial interval containing the transitions, let $s = \| y \| \/ L$ and construct a nonnegative smooth function $z_L$ that starts at zero and satisfies
  $ z'_L = C_0 z_L + chi_(*) \, $
  where $chi_(*)$ is a fixed nonnegative bump equal to one over the possible annular deficits. Start its support strictly before those deficits. The constant $C_0$ is chosen using the uniform radial ellipticity and the bounds on $D g \, K$. If $F'_L = - z_L$, then on this interval
  $ - Delta_g #scale(x: 120%, y: 120%)[\(] F_L \( \| y \| \/ L \) #scale(x: 120%, y: 120%)[\)] - \| K \| thin \| upright(d) \( F_L \( \| y \| \/ L \) \) \| gt.eq c L^(- 2) chi_(*) . $
  The same inequality is nonnegative on the initial ramp; it follows directly by separating the $z'_L$ coefficient, bounded below by radial ellipticity, from terms bounded by a constant times $z_L$.
  On the static part put
  $ A_L \( s \) = 1 + frac(m, 2 \( L s \)^(n - 2)) . $
  Continue $z_L$ smoothly so that the radial Laplace flux $P_L \( s \) = s^k A_L \( s \)^2 z_L \( s \)$ is increasing, has derivative bounded below by a positive multiple of $s^(- k)$ on the continuation, and satisfies $P'_L \( s \) = s^(- k)$ sufficiently far out. This can be done by blending positive derivatives after the end of the preceding interval. All profiles and their fixed-order derivatives remain uniformly bounded on compact scaled intervals. Set
  $ F_L \( s \) = integral_s^oo z_L \( sigma \) thin upright(d) sigma \, #h(2em) U_L = 1 + epsilon_L L^(2 - n) F_L \( \| y \| \/ L \) . $
  Thus $F_L > 0$, is constant before the repair region, and has a tail $a_L s^(2 - n) + O \( s^(2 - 2 k) \)$ with uniformly bounded $a_L > 0$. On the static end the exact radial Laplacian formula is
  $ - Delta_g U_L = epsilon_L L^(- n) A_L \( s \)^(- 2 n \/ \( n - 2 \)) s^(- k) P'_L \( s \) gt.eq c epsilon_L L^(- n) s^(- 2 k) . $
  It pays for the retained electric cost $C \( L s \)^(- 2 k)$ by the second condition on $epsilon_L$. The repair on the transition pays for (3.17) by the first condition. Uniform comparability of $U_L$ to one allows the fixed constants in (3.5) to be included in these choices.
  In the untouched core $U_L$ is constant. Purely electric DEC is preserved there for every $U_L gt.eq 1$. In the auxiliary magnetic class, the original positive margin on the fixed magnetic support absorbs the $o \( 1 \)$ change of the electromagnetic cost. Outside that support the purely electric argument applies. The trapping inequalities are preserved on the original boundary, since there $U_L$ is constant. The repaired data now have compactly supported $K$ and an all-order static conformal end. Their final ADM energy, computed in the static $y$ coordinates, is
  $ m + 2 epsilon_L a_L = m + o \( 1 \) \, $
  and their momentum is zero. The scalar curvature on the static end is $O \( r^(- 2 k) \)$. The electric form remains exactly $alpha$ throughout.
  ===== 3.5.4 Comparison of the enclosing areas. <comparison-of-the-enclosing-areas.>
  Here no minimizing hypersurface is selected. In the original $x$ coordinates the repaired metric has a fixed positive Euclidean lower bound throughout the modified end. Choose a sufficiently small fixed $c > 0$ and a radial diffeomorphism $Psi_L$ that is the identity for $r lt.eq sqrt(L)$, whose radial derivative decreases smoothly to $c$ by $r = 2 sqrt(L)$, and whose radial function is $c r + O \( sqrt(L) \)$ thereafter. It is the identity on the compact part and preserves orientation. Up to radius $L$, the original and repaired metrics agree apart from the nondecreasing conformal factor; the asymptotic Euclidean errors on $r gt.eq sqrt(L)$ are $o \( 1 \)$, and both radial and tangential derivatives of $Psi_L$ are at most one. On $r gt.eq L$ those derivatives are at most $c + O \( L^(- 1 \/ 2) \)$. Choosing $c$ using the fixed lower bound of the repaired metric therefore gives the global quadratic-form comparison
  #[#set math.equation(numbering: n => "(3.18)")
   $ Psi_L^(*) g lt.eq \( 1 + o \( 1 \) \) g_L^(upright("rep")) . $ <prep:area-metric-comparison>]
  The pullback evaluates $g$ only at radii tending to infinity in this last region, so its own Euclidean comparison error also tends to zero. The map $Psi_L$ carries full cuts bijectively to full cuts, fixing the original boundary. Restricting (3.18) to each tangent $k$-plane and taking the infimum gives
  $ a \( g_L^(upright("rep")) \) gt.eq \( 1 - o \( 1 \) \) a \( g \) . $
  This argument applies to disconnected cuts and coincident boundary portions, and is independent of any regularity or attainment of the infimum.
  Finally apply Lemma 15 with a compact drift majorizing the now compactly supported tensor. For each fixed $L$, take the strictification parameter positive and sufficiently small that the additional energy change and the uniform relative metric change are less than $L^(- 1)$. This order of choices is allowed even if the constants of that lemma depend on $L$. A diagonal sequence gives (3.14)–(3.15). The strictification keeps $K$ compactly supported, preserves $alpha$, and makes all prescribed signs strict simultaneously. Since $m > 0$, the final energies are positive for all sufficiently large members of the sequence. ◻
]

=== 3.6 Flux forms on a later filling and the final reduction <flux-forms-on-a-later-filling-and-the-final-reduction>

#thm([Lemma 3.9.])[
  (Extension with sources confined to the filling).  #emph[Suppose a compact filling and inner collars are later attached to the original boundary, with no constraint imposed behind that boundary. The smooth electric flux form $alpha$ extends smoothly across the boundary, agrees with the original form throughout $Omega$, and can be made zero beyond a fixed inner collar. Its exterior derivative is supported strictly on the filling side. In a family obtained by lengthening product necks beyond fixed collars, the extension has uniform fixed-order bounds on those collars and is zero on the additional long portions.]
] <prep:source-extension>

#proof[
  In collar coordinates with $s gt.eq 0$ on the original side, write $alpha = a \( s \) + upright(d) s and b \( s \)$, where $a \( s \)$ and $b \( s \)$ are tangential forms. Closedness says $upright(d)_S a \( s \) = 0$ and $partial_s a \( s \) = upright(d)_S b \( s \)$. Extend the smooth family $b \( s \)$ across zero and define on the interior collar
  $ a \( s \) = a \( 0 \) + integral_0^s upright(d)_S b \( t \) thin upright(d) t . $
  This gives a closed smooth extension across $S$, with exactly the original jets. Multiply it by a cutoff on the interior side that is one on a smaller collar and zero before the end of the fixed collar, then extend by zero farther into the filling. The derivative of the result is supported where that cutoff changes, a positive collar distance behind $S$. The same fixed extension and cutoff work before every added neck, proving uniformity. A globally closed extension is neither asserted nor needed; for nonzero total charge it would in general contradict Stokes on a one-ended filling. ◻
]

#thm([Proposition 3.10.])[
  (Reduction of the numerical theorem).  #emph[Assume that for every prepared data set in (3.14), with positive energy and zero momentum, the construction of Proposition 40 establishes, for every $0 < s < 1$, 
#[#set math.equation(numbering: n => "(3.19)")
 $ cal(E)_(upright("ADM")) gt.eq s \| Q \| + frac(1 - s^2, 2) (a / omega)^(\( k - 1 \) \/ k) . $ <prep:prepared-bound-hypothesis>]

 Then Theorem 5 follows for the original purely electric data. The same inequality with invariant mass in place of energy holds on the strict, future-timelike auxiliary magnetic class described above.]
] <prep:prepared-reduction>

#proof[
  First fix a future-timelike original data set and a number $s in \( 0 \, 1 \)$. Apply Proposition 17. The prepared energies converge to its invariant mass and are eventually positive; charges are identical and the full-cut infima have the stated lower limit. Passing to the limit in (3.19) gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ m gt.eq s \| Q \| + frac(1 - s^2, 2) X_A \, #h(2em) 0 < s < 1 . $ <prep:invariant-one-parameter>]
  Only after this timelike result has been established do we apply Remark 13; Lemma 10 supplies its strictly positive lower bound. It proves $cal(E)_(upright("ADM")) > \| upright(bold(P))_(upright("ADM")) \|$ for every original purely electric data set, including the initially possible past or null cases. Thus (3.20) applies to all of them.
  Letting $s arrow.t 1$ gives $m gt.eq \| Q \|$. If $X_A > \| Q \|$, the maximum of the right side of (3.20) is attained at $s = \| Q \| \/ X_A$ when $Q eq.not 0$, and by $s arrow.b 0$ when $Q = 0$; its value is $\( X_A + Q^2 \/ X_A \) \/ 2$. If $X_A lt.eq \| Q \|$, the endpoint $s arrow.t 1$ gives precisely the required branch. These alternatives are equivalent to $X_A lt.eq m + sqrt(m^2 - Q^2)$ together with $m gt.eq \| Q \|$. The argument does not assert the polynomial inequality on the unprescribed branch. For the auxiliary magnetic class the preparation already assumes strictness and timelikeness; the first limiting argument proves its required extension without making a magnetic endpoint claim. ◻
]

== 4 The filled scalar system and its a priori bounds <alg:section>

This section constructs the background on which the scalar deformation is solved, proves its curvature identity, and obtains bounds for every smooth solution in the continuation family. The argument uses no energy condition inside the filling. In particular, different trapping signs at different boundary components cause no incompatibility there. Existence and higher regularity of solutions are proved in the next section; none of those conclusions is used in the estimates below.

Fix prepared exterior data as in the preceding section. The properties used here are the following: $K$ has compact support; in the distinguished end $g_(i j) - delta_(i j) = O_j \( r^(2 - n) \)$ for every fixed $j$; $R_g = O \( r^(- n - beta) \)$ for a fixed $beta > 0$; the charged energy margin is strict and bounded below by a positive multiple of $r^(- n - beta)$; and $H + epsilon.alt_a "tr"_(S_a) K < 0$ on each component $S_a$. Set $k = n - 1 gt.eq 3$. All tensors, contractions, derivatives, and divergences in this section, unless explicitly distinguished, use the background metric $g$.

=== 4.1 Filling and parameter conventions <filling-and-parameter-conventions>

#thm([Lemma 4.1.])[
  (A filling with long product collars).  #emph[For each sufficiently large integer $N$ the exterior has a smooth oriented extension $\( cal(M)_N \, g \, K \)$ without boundary, with the same single end, having the following properties.]
  + #emph[A fixed collar through every $S_a$, followed on its inner side by a fixed transition to a product, has $H + epsilon.alt_a "tr"_(upright("tan")) K < 0$ on its cross-sections, with the normal pointing toward the original exterior.]
  + #emph[Behind that transition is a product cylinder of length $L_N = C_0 + C_1 N$, with $K = - epsilon.alt_a L_0 g$ there. The cylinders terminate at fixed collars of a compact filling; $K$ on the rest of that filling may be arbitrary.]
  + #emph[There are coordinate patches of a fixed size with uniform metric ellipticity and uniform bounds for each fixed number of derivatives of $g$ and $K$. At most $C \( 1 + N \)$ such patches cover the added region and the original compact core. Its volume is at most $C \( 1 + N \)$.]
  #emph[Here $L_0 \, C_0 \, C_1$ can be chosen in advance, with $L_0$ arbitrarily large. The constants in (iii) are independent of $N$.]
] <alg:filling>

#proof[
  Cut the original exterior at a large coordinate sphere. A second copy of the resulting compact manifold, with its orientation reversed and its spherical boundary capped by a ball, provides a compact filling of the entire boundary $S$. This construction does not require the individual components of $S$ to bound separately. Smoothly extend the original metric and tensor a short distance behind $S$. Strictness of each expansion persists on a sufficiently short collar. In its continuation, interpolate the metric to a fixed product metric. During that interpolation add $- epsilon.alt_a L g$ to $K$, with a nonnegative cutoff that becomes one before the original strict collar is left. Choose $L$ sufficiently large to dominate the bounded mean curvatures of all intermediate leaves and the remaining tangential trace. One can then interpolate $K$ to $- epsilon.alt_a L_0 g$ while preserving the strict inequality. This only uses a fixed transition with bounded geometry.
  Insert the product cylinder between this transition and the corresponding boundary collar of the compact filling. Prescribe the same pure trace on the latter collar, and extend $K$ smoothly and arbitrarily farther into the filling. In particular, the prescriptions for opposite signs are made on disjoint collars, and are not imposed on the common interior of the filling. There is no energy-condition requirement in that interior. The fixed pieces have finite uniform atlases; translates of finitely many product charts cover the cylinders. This proves the last assertion and the volume bound. Increasing $C_0 \, C_1$ later to accommodate a prescribed ramp does not change these local bounds. ◻
]

Extend $r$ to a smooth positive function, uniformly comparable to one on the enlarged core and unchanged sufficiently far out. This can be done using the fixed collars and by making it constant on the added products. Consequently every fixed negative power of $r$ is bounded above uniformly in $N$, and bounded below on the enlarged core and any fixed additional end annulus.

Fix $0 < epsilon < 1$ and a smooth nonincreasing function $theta.alt : bb(R) arrow.r \[ 0 \, 1 \]$, equal to one on $\( - oo \, 0 \]$ and to zero on $\[ 1 \, oo \)$. The order of choices is: prepared data and the fixed geometric pieces, then $epsilon$, the exponents and small constants below, then $N$, and finally the outer truncation radius. Increasing that radius will never change $N$ or any of the constants in its equations. We require

#[#set math.equation(numbering: n => "(4.1)")
 $ N gt.eq N_0 > max { k \, 2 \/ epsilon } \, #h(2em) ell = e^(- N epsilon) \, #h(2em) eta = ell^(3 \/ 2) \,\
p \( t \) = N theta.alt \( N t \) \, #h(2em) l \( t \) = exp (integral_0^t p \( s \) thin upright(d) s) . $ <alg:profiles>]

Thus $0 lt.eq p lt.eq N$, $l' = p l$, $l \( t \) = e^(N t)$ for $t lt.eq 0$, and $l \( t \) lt.eq e$ for all $t$. When $t gt.eq - epsilon$ one also has $l gt.eq ell$. On $\[ - epsilon \, - epsilon + 1 \/ N \]$, $ell lt.eq l lt.eq e ell$.

The notation $cal(P)_N$ denotes a positive quantity bounded by $C \( 1 + N \)^m$, where $C \, m$ depend only on the fixed choices just described, not on the solution or the truncation radius. The polynomial may increase from one occurrence to the next. Thus an $exp \( cal(P)_N \)$ bound means $exp \( C \( 1 + N \)^m \)$, rather than a constant with unrestricted dependence on $N$. Constants for later fixed-$N$ Schauder estimates need not have this restriction.

=== 4.2 Implicit variables and the curvature identity <implicit-variables-and-the-curvature-identity>

For smooth functions $f \, Z$, define $t$ implicitly and then all other quantities by

#[#set math.equation(numbering: n => "(4.2)")
 $ Z = t + frac(1, 2 k) log D \, #h(2em) D = 1 + l \( t \)^2 \| nabla f \|^2 \, #h(2em) w = l D^(- 1 \/ 2) nabla f \, #h(2em) a_w = \| w \| \, #h(2em) v = \| w \|^2 \,\
d = D^(- 1) = 1 - v \, #h(2em) chi = frac(k d, k + p v) \, #h(2em) A_d = g^(- 1) - w ⊗ w \, #h(2em) A_chi = g^(- 1) - frac(k + p, k + p v) w ⊗ w \,\
u = e^(\( k - 1 \) t) l sqrt(D) \, #h(2em) h = eta f \, #h(2em) H^f = l D^(- 1 \/ 2) nabla^2 f \, #h(2em) F = A_chi^(i j) \( K_(i j) + H_(i j)^f \) \,\
V = u A_chi #scale(x: 120%, y: 120%)[\(] k thin upright(d) Z + K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) macron(g) = g + l^2 upright(d) f ⊗ upright(d) f \, #h(2em) hat(g) = e^(2 t) macron(g) . $ <alg:definitions>]

Here a positive contravariant tensor acts on covectors to give vectors, and $\| xi \|_A^2 = A^(i j) xi_i xi_j$. In a $g$-orthonormal frame with last direction $e = nabla f \/ \| nabla f \|$, the eigenvalues of $A_d$ are $\( 1 \, dots.h \, 1 \, d \)$ and those of $A_chi$ are $\( 1 \, dots.h \, 1 \, chi \)$. In particular,

#[#set math.equation(numbering: n => "(4.3)")
 $ frac(k, k + N) A_d lt.eq A_chi lt.eq A_d lt.eq g^(- 1) \, #h(2em) 0 < chi lt.eq d lt.eq 1 . $ <alg:tensor-comparison>]

For fixed $sigma = \| nabla f \|$, the derivative with respect to $t$ of the right side of the first equation in (4.2) is $1 + p v \/ k gt.eq 1$. Its limits as $t arrow.r plus.minus oo$ are $plus.minus oo$. The equation therefore defines a unique smooth $t$ for every $\( Z \, upright(d) f \)$, including $upright(d) f = 0$. Differentiating spatially gives the useful identity

#[#set math.equation(numbering: n => "(4.4)")
 $ k thin upright(d) Z = \( k + p v \) thin upright(d) t + H^f \( w \, dot.op \) . $ <alg:implicit-differential>]

For the next calculation, put $B = K + H^f$ and use the preceding frame to write its transverse, mixed, and axial blocks as $T \, M \, j$. Thus $T = B \|_(e^perp)$, $M = B \( e \, dot.op \) \|_(e^perp)$, $j = B \( e \, e \)$, and $"tr" T = F - chi j$. Write $upright(d) t = y + x e^flat$ and $T^0 = T - \( "tr" T \) g \|_(e^perp) \/ k$, and set $s_p = p + \( k - 1 \) \/ 2$.

#thm([Proposition 4.2.])[
  (Exact curvature identity).  #emph[Let $g$ be any smooth Riemannian metric and $K$ any smooth symmetric tensor. With $tau = "tr"_g K$, $2 mu = R_g + tau^2 - \| K \|^2$, and $J = "div" \( K - tau g \)$, the definitions above give 
#[#set math.equation(numbering: n => "(4.5)")
 $ 1 / 2 e^(2 t) R_(hat(g)) = mu + J \( w \) + cal(T) + w \( F \) - F tau - u^(- 1) "div" V \, $ <alg:scalar-identity>]

 where 
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + s_p a_w y \|^2 - frac(\( k - 1 \)^2, 4) v \| y \|^2 + k s_p \( \| y \|^2 + d x^2 \)\
 & - frac(k - 1, 2 k) \( F - chi j \)^2 + chi j^2 - chi F j + F^2 + 2 s_p chi j a_w x . $ <alg:remainder>]

 The right side is smooth also at zero slope; the choice of $e$ there is irrelevant. No constraint inequality, flatness assumption, or restriction on $p'$ is used in this identity.]
] <alg:curvature-proposition>

#proof[
  We supply a tensorial derivation to retain all background-curvature terms. For symmetric tensors set $sans(B) \( A \, B \) = chevron.l A \, B chevron.r - \( "tr" A \) \( "tr" B \)$ and $P_A = A - \( "tr" A \) g$. When such a tensor acts as an endomorphism, its first index is raised with $g$. Consider on $bb(R)_z times cal(M)_N$ the stationary Lorentz metric
  $ upright(bold(g)) = - l^2 \( upright(d) z - upright(d) f \)^2 + macron(g) . $
  The metric induced on $z = upright("constant")$ is $g$. Its lapse is $U = l sqrt(D)$ and its shift is $U w = l^2 nabla f$. With the future-normal second-form convention of the theorem, its second form is
  #[#set math.equation(numbering: n => "(4.7)")
   $ b = - U^(- 1) "sym" nabla \( U w \)^flat = - H^f - p \( upright(d) t ⊗ w^flat + w^flat ⊗ upright(d) t \) . $ <alg:auxiliary-second-form>]
  Let $upright(bold(n)) = U^(- 1) partial_z - w$. Contracted Gauss and the normal Ricci equation give, respectively,
  $ upright(bold(R)) = R_g + \( "tr" b \)^2 - \| b \|^2 - 2 upright(bold(R i c)) \( upright(bold(n)) \, upright(bold(n)) \) \, #h(2em) upright(bold(R i c)) \( upright(bold(n)) \, upright(bold(n)) \) = - upright(bold(n)) \( "tr" b \) - \| b \|^2 + U^(- 1) Delta U . $
  Because the coefficients are stationary, $upright(bold(n)) \( "tr" b \) = - w \( "tr" b \)$ and $"div" \( U w \) = - U "tr" b$. Substitution proves
  #[#set math.equation(numbering: n => "(4.8)")
   $ upright(bold(R)) = R_g + sans(B) \( b \, b \) - 2 U^(- 1) "div" #scale(x: 120%, y: 120%)[\(] nabla U + \( "tr" b \) U w #scale(x: 120%, y: 120%)[\)] . $ <alg:stationary-scalar>]
  Alternatively, the coordinate $z - f$ displays $upright(bold(g))$ as a static warped product, so that $upright(bold(R)) = R_(macron(g)) - 2 l^(- 1) Delta_(macron(g)) l$. Since $upright(d) V_(macron(g)) = sqrt(D) thin upright(d) V_g$ and $macron(g)^(- 1) = A_d$,
  $ l^(- 1) Delta_(macron(g)) l = U^(- 1) "div" #scale(x: 120%, y: 120%)[\(] \( U \/ l \) A_d upright(d) l #scale(x: 120%, y: 120%)[\)] \, #h(2em) nabla U - \( U \/ l \) A_d upright(d) l = - U #scale(x: 120%, y: 120%)[\(] b \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)]^sharp . $
  The last equality follows by differentiating $U = l sqrt(D)$ and using (4.7); its components include all derivatives of $l$. Subtracting the two scalar formulas gives
  $ 1 / 2 R_(macron(g)) = 1 / 2 R_g + 1 / 2 sans(B) \( b \, b \) + U^(- 1) "div" \( U P_b w \) . $
  Put $Q = K - b$. The product rule and $"sym" nabla \( U w \)^flat = - U b$ imply
  $ J \( w \) - U^(- 1) "div" \( U P_K w \) = sans(B) \( K \, b \) . $
  Expanding $sans(B) \( Q \, Q \)$ therefore yields
  #[#set math.equation(numbering: n => "(4.9)")
   $ 1 / 2 R_(macron(g)) = mu + J \( w \) + 1 / 2 sans(B) \( Q \, Q \) - U^(- 1) "div" \( U P_Q w \) . $ <alg:graph-scalar>]
  The conformal scalar law, with dimension $n = k + 1$, subtracts $k Delta_(macron(g)) t + k \( k - 1 \) \| upright(d) t \|_(A_d)^2 \/ 2$ from $R_(macron(g)) \/ 2$. Moreover,
  $ Delta_(macron(g)) t = U^(- 1) "div" \( U A_d upright(d) t \) - p \| upright(d) t \|_(A_d)^2 \, #h(2em) u = e^(\( k - 1 \) t) U . $
  Changing the divergence weight from $U$ to $u$ in (4.9) consequently gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ 1 / 2 e^(2 t) R_(hat(g)) =  & mu + J \( w \) + 1 / 2 sans(B) \( Q \, Q \) + \( k - 1 \) P_Q \( w \, nabla t \) + k s_p \| upright(d) t \|_(A_d)^2\
 & - u^(- 1) "div" #scale(x: 120%, y: 120%)[\(] u \( P_Q w + k A_d upright(d) t \) #scale(x: 120%, y: 120%)[\)] . $ <alg:invariant-remainder>]
  Equation (4.4), or its transverse and axial components, gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ u \( P_Q w + k A_d upright(d) t \) = V - u F w \, #h(2em) u^(- 1) "div" \( u w \) = F + \( 1 - chi \) j - tau + 2 s_p a_w x . $ <alg:flux-identities>]
  For completeness, the transverse and axial components of $P_Q w + k A_d upright(d) t$ are $a_w M + \( k + p v \) y$ and $- a_w "tr" T + k d x$, respectively; those of $V \/ u - F w$ are exactly the same. The second equality follows by taking the trace of (4.7) and then differentiating the weight $e^(\( k - 1 \) t)$.
  It remains to expand the algebraic terms. The blocks of $Q$ are $T$, $M + p a_w y$, and $j + 2 p a_w x$. Thus
  $ 1 / 2 sans(B) \( Q \, Q \) = 1 / 2 \| T^0 \|^2 - frac(k - 1, 2 k) \( "tr" T \)^2 + \| M + p a_w y \|^2 - \( "tr" T \) \( j + 2 p a_w x \) \, $
  and $P_Q \( w \, nabla t \) = a_w \( M + p a_w y \) dot.op y - a_w \( "tr" T \) x$. Insert these formulas and (4.11) into (4.10), and use $"tr" T = F - chi j$. The mixed transverse terms complete to $\| M + s_p a_w y \|^2 - \( k - 1 \)^2 v \| y \|^2 \/ 4$; the remaining terms are precisely (4.6). This proves (4.5). Formula (4.10) and (4.11) also express $cal(T)$ by smooth tensorial operations, proving the assertion at zero slope. ◻
]

=== 4.3 Coercivity with polynomial losses <coercivity-with-polynomial-losses>

#thm([Lemma 4.3.])[
  (Coercivity).  #emph[For $0 lt.eq p lt.eq N$, $0 lt.eq v < 1$, the remainder is nonnegative and 
#[#set math.equation(numbering: n => "(4.12)")
 $ \| T \|^2 + \| M \|^2 + d j^2 + F^2 + \| upright(d) t \|_(A_d)^2 lt.eq C_k \( 1 + N \)^2 cal(T) . $ <alg:coercivity>]

 At $upright(d) t = 0$, if $E_0 = \| T^0 \|^2 + \| M \|^2 + chi j^2 + F^2$, then 
#[#set math.equation(numbering: n => "(4.13)")
 $ 1 / 2 E_0 lt.eq cal(T) lt.eq (1 + frac(1, 2 k)) E_0 . $ <alg:stationary-coercivity>]

 In addition, without any $N$ loss, 
#[#set math.equation(numbering: n => "(4.14)")
 $ cal(T) gt.eq frac(k^2 - 1, 4) \| upright(d) t \|_(A_d)^2 . $ <alg:gradient-coercivity>]

]
] <alg:coercivity-lemma>

#proof[
  Completing first the $x$ square and then the $F$ square gives the exact formula
  #[#set math.equation(numbering: n => "(4.15)")
   $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + s_p a_w y \|^2 + (k s_p - frac(\( k - 1 \)^2, 4) v) \| y \|^2\
 & + k s_p d (x + frac(chi a_w, k d) j)^2 + frac(k + 1, 2 k) (F - frac(chi, k + 1) j)^2 + frac(chi thin \[ k \( k + 2 \) + v \], 2 \( k + 1 \) \( k + p v \)) j^2 . $ <alg:completed-squares>]
  Indeed the last coefficient, before simplification, is
  $ chi - frac(k chi^2, 2 \( k + 1 \)) - frac(s_p chi^2 v, k d) = chi frac(k - frac(k^2, 2 \( k + 1 \)) d - frac(k - 1, 2) v, k + p v) \, $
  and the numerator in the final fraction equals $\[ k \( k + 2 \) + v \] \/ \[ 2 \( k + 1 \) \]$.
  The coefficient of $\| y \|^2$ is at least $\( k^2 - 1 \) \/ 4 + k p$. The coefficient of $j^2$, divided by $d$, is at least $c_k \( 1 + N \)^(- 2)$. In the variables $X = sqrt(d) thin x$ and $J_0 = sqrt(d) thin j$, the $x$ square is $k s_p \( X + a_w J_0 \/ \( k + p v \) \)^2$; its shear coefficient is bounded by $1 \/ k$. The shear from the $F$ square has coefficient $chi \/ \( \( k + 1 \) sqrt(d) \) lt.eq 1 \/ \( k + 1 \)$. These observations control $X^2 \, J_0^2 \, F^2$ with at most $C_k \( 1 + N \)^2$ loss. Recovering $M$ costs at most $C_k \( 1 + N \)$, since $s_p^2 \/ \( k s_p - \( k - 1 \)^2 v \/ 4 \) lt.eq C_k \( 1 + N \)$. Finally $\| T \|^2 = \| T^0 \|^2 + \( F - chi j \)^2 \/ k$. This proves (4.12).
  When $upright(d) t = 0$, the $F \, j$ part is
  $ frac(k + 1, 2 k) F^2 - chi / k F j + (chi - frac(k - 1, 2 k) chi^2) j^2 . $
  Put $z = sqrt(chi) thin j$ and bound the mixed term by $\( F^2 + z^2 \) \/ \( 2 k \)$. Since $0 < chi lt.eq 1$, the claimed lower and upper bounds follow, together with the separate $T^0 \, M$ terms.
  For the sharper gradient bound, minimize over $M \, F \, j$, keeping $x \, y$ fixed. The transverse coefficient remaining is $k s_p - \( k - 1 \)^2 v \/ 4 gt.eq \( k^2 - 1 \) \/ 4$. Put
  $ B_v = frac(k \( k + 2 \) + v, 2 \( k + 1 \)) \, #h(2em) D_v = k - frac(k^2, 2 \( k + 1 \)) d . $
  The axial coefficient divided by $d$ is
  $ C \( p \, v \) = frac(k s_p B_v, D_v + p v) . $
  As $D_v - frac(k - 1, 2) v = B_v$, one has $partial_p C = k B_v^2 \/ \( D_v + p v \)^2 > 0$. At $p = 0$ the inequality $C \( 0 \, v \) gt.eq \( k^2 - 1 \) \/ 4$ is equivalent to $D_v gt.eq k v$, which follows from $D_v - k v = \( k - k^2 \/ \( 2 \( k + 1 \) \) \) d gt.eq 0$. This proves (4.14). ◻
]

=== 4.4 The equations, their homotopy, and the height estimate <the-equations-their-homotopy-and-the-height-estimate>

Choose once and for all

#[#set math.equation(numbering: n => "(4.16)")
 $ n / 4 < b_1 < min { n - 2 \, n \/ 2 } \, #h(2em) rho_0 = r^(- n - beta) \, #h(2em) rho_1 = r^(- 2 b_1) \, #h(2em) rho = c_(*) rho_0 > 0 . $ <alg:weights>]

The interval for $b_1$ is nonempty for $n gt.eq 4$. Choose $c_(*)$ so small that $2 rho$ is below the prepared charged energy margin on the original exterior. In particular, $rho$ has a positive lower bound independent of $N$ on the enlarged core and fixed additional annuli. The exponent restrictions give $b_1 < k - 1$, $2 b_1 < n$, and $rho_1^2 in L^1$ on the end. All integrals of $rho_0$, $rho_0^2$, and $rho_1^2$ are $O \( 1 + N \)$.

Write $cal(M)_(N \, R)$ for the filled manifold truncated at $r = R$. It has only this outer boundary. The system to be solved is

#[#set math.equation(numbering: n => "(4.17)")
 $ F = h = eta f \, #h(2em) "div" V = u Xi \, #h(2em) f = Z = 0 quad upright("on ") r = R \,\
Xi = delta_0 #scale(x: 120%, y: 120%)[\(] cal(T) + eta a_w \| nabla f \| #scale(x: 120%, y: 120%)[\)] + rho - m_0 C_N \( rho_0 + v rho_1 \) \, #h(2em) m_0 = theta.alt #scale(x: 120%, y: 120%)[\(] N \( t + epsilon \) #scale(x: 120%, y: 120%)[\)] . $ <alg:system>]

The constant $delta_0 > 0$ is fixed sufficiently small independently of $N$; the floor lemma below specifies the choice. The penalty $C_N$ is then chosen polynomially large. It is fixed before the truncation radius.

There are two parts of the continuation. First replace $K$ by $s K$, $0 lt.eq s lt.eq 1$, everywhere in $F \, V \, cal(T)$, leaving the displayed source otherwise unchanged. At $s = 0$ the trace equation implies $f = 0$. In the second part retain $K = f = 0$ and replace $Xi$ by $lambda Xi$, $0 lt.eq lambda lt.eq 1$. At $lambda = 0$ the sole solution is $Z = 0$. We will prove uniform a priori estimates on the part of this family where $min t gt.eq - epsilon$; the floor lemma excludes equality.

#thm([Lemma 4.4.])[
  (Height and outer boundary gradient).  #emph[Every smooth solution of the trace equation in the first homotopy part satisfies, with constants independent of $N \, R \, s$, 
#[#set math.equation(numbering: n => "(4.18)")
 $ \| h \| lt.eq C_h \, #h(2em) \| h \| lt.eq C #scale(x: 120%, y: 120%)[\(] r^(- b_1) - R^(- b_1) #scale(x: 120%, y: 120%)[\)] quad \( r_0 lt.eq r lt.eq R \) \, #h(2em) \| upright(d) h \| lt.eq C R^(- b_1 - 1) quad \( r = R \) \, $ <alg:height-bounds>]

 provided $R gt.eq 2 r_0$, where $r_0$ is fixed and $K = 0$ on $r gt.eq r_0$. For $R gt.eq R_min \( N \)$ these estimates imply $t > - epsilon$ on the outer sphere, without a prior assumption on the interior floor. The same assertions hold in the second homotopy part, where $h = 0$.]
] <alg:trace-height>

#proof[
  In terms of $h$ the trace equation reads
  #[#set math.equation(numbering: n => "(4.19)")
   $ frac(A_chi^(i j) nabla_i nabla_j h, sqrt(\( eta \/ l \)^2 + \| upright(d) h \|^2)) + "tr"_(A_chi) \( s K \) = h . $ <alg:height-equation>]
  At a positive maximum, the first term is nonpositive and the second is bounded by $n sup \| K \|$; a negative minimum is treated with the opposite sign. The supremum of $\| K \|$ on the filling is uniform in $N$. Taking $C_h > n sup \| K \|$ proves the first assertion. The same argument with $K = 0$ proves $h = 0$ on the last homotopy part.
  Let $B_R = C \( r^(- b_1) - R^(- b_1) \)$. At a contact with $h - B_R$, the axis of $A_chi$ is the radial-gradient direction, so that
  $ "tr"_(A_chi) nabla^2 B_R = C b_1 r^(- b_1 - 2) #scale(x: 120%, y: 120%)[\(] \( b_1 + 1 \) chi - k + O \( r^(2 - n) \) #scale(x: 120%, y: 120%)[\)] < 0 . $
  The error is uniform for $0 < chi lt.eq 1$; choose $r_0$ large enough using $b_1 < k - 1$. Choose $C$ so that $B_R gt.eq C_h$ on $r = r_0$ for every $R gt.eq 2 r_0$. At a positive interior maximum of $h - B_R$, the Hessian term in (4.19) would be negative while $h > B_R gt.eq 0$, a contradiction. The lower barrier is $- B_R$. Their one-sided boundary derivatives give the last estimate in (4.18); tangential derivatives there vanish.
  On $r = R$, $Z = 0$ and $l lt.eq e$. Hence
  $ t = - frac(1, 2 k) log \( 1 + l^2 \| upright(d) f \|^2 \) gt.eq - frac(1, 2 k) log #scale(x: 120%, y: 120%)[\(] 1 + C eta^(- 2) R^(- 2 b_1 - 2) #scale(x: 120%, y: 120%)[\)] . $
  For example, in addition to $R gt.eq 2 r_0$, require $C eta^(- 2) R^(- 2 b_1 - 2) < e^(k epsilon) - 1$. This gives $t > - epsilon \/ 2$ on the outer sphere and defines a permissible $R_min \( N \)$. ◻
]

=== 4.5 Exclusion of the floor <exclusion-of-the-floor>

Define, for a symmetric tensor $B$,

$ cal(S) \( B \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] \( "tr"_(A_d) B \)^2 - \| B \|_(A_d ⊗ A_d)^2 #scale(x: 120%, y: 120%)[\)] . $

#thm([Lemma 4.5.])[
  (The stationary algebraic comparison).  #emph[There are constants $c_1 > 0$ and $C_k > 0$, independent of $N$, such that at any point where $upright(d) t = 0$, 
#[#set math.equation(numbering: n => "(4.20)")
 $ cal(T) - cal(S) \( H^f \) gt.eq c_1 cal(T) - C_k \( 1 + N \)^2 #scale(x: 120%, y: 120%)[\(] v F^2 + \| K \|^2 #scale(x: 120%, y: 120%)[\)] . $ <alg:floor-quadratic>]

 The same constants apply with $K$ replaced by $s K$, $0 lt.eq s lt.eq 1$.]
] <alg:floor-algebra>

#proof[
  First put $B = H^f + K$. Its blocks give
  $ cal(S) \( B \) = frac(k - 1, 2 k) \( F - chi j \)^2 - 1 / 2 \| T^0 \|^2 + d j \( F - chi j \) - d \| M \|^2 . $
  Subtracting this expression from (4.6) at $upright(d) t = 0$ yields
  #[#set math.equation(numbering: n => "(4.21)")
   $ cal(T) - cal(S) \( B \) =  & \| T^0 \|^2 + \( 1 + d \) \| M \|^2 + F^2 \/ k\
 & + (frac(k - 2, k) chi - d) F j + (chi \( 1 + d \) - frac(k - 1, k) chi^2) j^2 . $ <alg:floor-subtraction>]
  The last coefficient is at least $chi$, while the absolute value of the mixed coefficient is at most $d$. Fix a small dimension-dependent $delta_k > 0$. If $\( 1 + p \) v gt.eq delta_k$, Young’s inequality in the variables $F \, sqrt(chi) j$, together with
  $ d^2 / chi = frac(d \( k + p v \), k) lt.eq 1 + N \/ k \, #h(2em) v^(- 1) lt.eq \( 1 + N \) \/ delta_k \, $
  gives $cal(T) - cal(S) \( B \) gt.eq 1 / 2 E_0 - C_k \( 1 + N \)^2 v F^2$. If $\( 1 + p \) v < delta_k$, both $d$ and $chi$ differ from one by at most $C_k delta_k$. The quadratic form in (4.21) then differs, by at most $C_k delta_k \( \| M \|^2 + F^2 + j^2 \)$, from
  $ \| T^0 \|^2 + 2 \| M \|^2 + \( F - j \)^2 \/ k + j^2 . $
  The least eigenvalue of the last $F \, j$ form is at least $1 \/ \( k + 2 \)$. Choose $delta_k$ small enough to preserve half this lower bound. Combining the cases proves a fixed positive $E_0$ lower bound with the stated error.
  Finally, polarization of $cal(S)$ and $d^2 \/ chi lt.eq 1 + N \/ k$ give
  $ \| cal(S) \( B \) - cal(S) \( H^f \) \| lt.eq C_k sqrt(1 + N) sqrt(E_0) \| K \| + C_k \| K \|^2 . $
  Apply Young’s inequality, using half the positive $E_0$ lower bound, and then (4.13). This proves the result. All steps are unchanged on replacing $K$ by $s K$. ◻
]

#thm([Lemma 4.6.])[
  (Floor exclusion).  #emph[There is a choice $0 < delta_0 < min { c_1 \, 1 } \/ 2$ and a polynomial $C_N$ such that, for $R gt.eq R_min \( N \)$, no smooth solution in either part of the homotopy has $min t = - epsilon$.]
] <alg:floor>

#proof[
  Lemma 23 excludes a boundary minimum at this value. At an interior minimum $upright(d) t = 0$, $nabla^2 t gt.eq 0$. View $macron(g)$ as the metric of the graph $z = f \( x \)$ in the Riemannian warped product $g + l^2 upright(d) z^2$. At this point its second form is $H^f$. The ambient scalar curvature is $R_g - 2 p Delta t$. With vertical unit vector $e_z = l^(- 1) partial_z$ the graph unit normal is $sqrt(d) thin e_z - a_w e$, and the ambient normal Ricci curvature equals
  $ v "Ric"_g \( e \, e \) - v p nabla^2 t \( e \, e \) - d p Delta t . $
  The Gauss and conformal formulas therefore give the exact equality
  #[#set math.equation(numbering: n => "(4.22)")
   $ 1 / 2 e^(2 t) R_(hat(g)) = 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) - v p "tr"_(e^perp) nabla^2 t - k "tr"_(A_d) nabla^2 t . $ <alg:floor-gauss>]
  The last two terms are nonpositive. Compare this upper bound with (4.5), use $F = h$ and $w \( F \) = eta a_w \| nabla f \|$, and apply Lemma 24. It follows that
  #[#set math.equation(numbering: n => "(4.23)")
   $ u^(- 1) "div" V gt.eq c_1 cal(T) + eta a_w \| nabla f \| - P_N \( rho_0 + v rho_1 \) $ <alg:floor-divergence>]
  for some polynomial $P_N$ independent of $R$ and the homotopy parameter. Here are all the error estimates used in this conclusion. The difference $mu - R_g \/ 2 = \( tau^2 - \| K \|^2 \) \/ 2$, $J \( w \)$, and $F tau$ is uniformly bounded on the enlarged core and vanishes on the end, so is bounded by $C rho_0$. On the end $\| "Ric"_g \| = O \( r^(- n) \) lt.eq C rho_1$ because $2 b_1 < n$. The height barrier gives $v F^2 lt.eq C v rho_1$ there; on the core its bound is absorbed by $C rho_0$. The same bounds hold for $s K$, including its momentum density.
  At $t = - epsilon$, $m_0 = 1$. Choose $delta_0$ as in the statement, and then take, for instance, $C_N gt.eq P_N + c_(*) + 1$. Subtracting the right side of (4.17) from (4.23) gives a strictly positive quantity, contradicting that equation. This choice is polynomial in $N$.
  In the last homotopy part, the height comparison gives $K = f = 0$, $t = Z$, $w = 0$, and $cal(T) = k s_p \| upright(d) t \|^2$. At a floor minimum the left side is $k Delta t gt.eq 0$, whereas for $lambda > 0$ the right side is $lambda \( rho - C_N rho_0 \) < 0$. For $lambda = 0$ the equation is $"div" \( k u \( t \) nabla t \) = 0$ with zero boundary data. Testing by $t$ gives $nabla t = 0$, hence $t = 0$. This finishes the homotopy check. ◻
]

=== 4.6 High levels and graph Sobolev estimates <high-levels-and-graph-sobolev-estimates>

#thm([Proposition 4.7.])[
  (Distortion bound).  #emph[With the choices above, every smooth homotopy solution on $cal(M)_(N \, R)$ with $min t > - epsilon$ satisfies 
#[#set math.equation(numbering: n => "(4.24)")
 $ - epsilon < t lt.eq Z lt.eq cal(P)_N \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| f \| + \| nabla f \| lt.eq exp \( cal(P)_N \) . $ <alg:distortion>]

 The constants are independent of $R gt.eq R_min \( N \)$ and of the homotopy parameter.]
] <alg:distortion-proposition>

#proof[
  We give the full high-level argument for the first homotopy part and write $K$ for $s K$ throughout it. Put $q_D = sqrt(D)$ and $a \( t \) = e^(\( k - 1 \) t) l$, so that
  #[#set math.equation(numbering: n => "(4.25)")
   $ u = a \( t \) q_D = l e^(k Z - t) \, #h(2em) eta a_w \| nabla f \| = eta / l \( q_D - q_D^(- 1) \) \, #h(2em) q_D = e^(k \( Z - t \)) . $ <alg:highlevel-factors>]
  The penalty can be nonzero only on $- epsilon < t < - epsilon + 1 \/ N$; its absolute size is at most $cal(P)_N$. Equations (4.1) and (4.25) show that a positive threshold $Z_0 = cal(P)_N$ can be chosen such that on $Z > Z_0$
  #[#set math.equation(numbering: n => "(4.26)")
   $ Xi gt.eq delta_0 cal(T) + rho + 1 / 2 delta_0 eta a_w \| nabla f \| . $ <alg:highlevel-sign>]
  For example, on the penalty band it suffices to make $\( eta \/ e \) \( e^(k Z) - 1 \)$ larger than $2 C_N sup \( rho_0 + rho_1 \) \/ delta_0$; the logarithm of this requirement is bounded by $C \( 1 + N \) + C log \( 1 + C_N \)$. Off the penalty band the assertion is immediate.
  Let $zeta$ be smooth, nondecreasing, zero up to $Z_0$, and one above $Z_0 + 1$, with bounded derivative. Testing the divergence equation by $zeta \( Z \)$ is legitimate since $Z = 0$ at the outer boundary. Writing $A = A_chi$ and $B_K = K \( w \, dot.op \)$, we obtain
  $ integral zeta \( Z \) u Xi thin upright(d) V_g = - integral zeta' \( Z \) u #scale(x: 120%, y: 120%)[\(] k \| upright(d) Z \|_A^2 + chevron.l upright(d) Z \, B_K chevron.r_A #scale(x: 120%, y: 120%)[\)] thin upright(d) V_g lt.eq C integral_({ Z_0 < Z < Z_0 + 1 } ∩ "supp" K) u \| K \|^2 thin upright(d) V_g . $
  On the last set $u lt.eq e exp \( k \( Z_0 + 1 \) + epsilon \)$. The support has volume $O \( 1 + N \)$. Using (4.26) proves
  #[#set math.equation(numbering: n => "(4.27)")
   $ integral_({ Z > Z_0 + 1 }) u #scale(x: 120%, y: 120%)[\(] rho + eta a_w \| nabla f \| + cal(T) #scale(x: 120%, y: 120%)[\)] thin upright(d) V_g lt.eq exp \( cal(P)_N \) . $ <alg:highlevel-integral>]
  Let $cal(K)_N$ be the enlarged core and a fixed additional annulus containing $"supp" K$ in its interior. On this set $rho gt.eq c > 0$, uniformly. Since $l gt.eq ell gt.eq eta$ and $q_D gt.eq 1$,
  $ u #scale(x: 120%, y: 120%)[\(] rho + eta a_w \| nabla f \| #scale(x: 120%, y: 120%)[\)] = q_D e^(\( k - 1 \) t) #scale(x: 120%, y: 120%)[\(] l rho + eta \( q_D - q_D^(- 1) \) #scale(x: 120%, y: 120%)[\)] gt.eq c' eta e^(\( k - 1 \) t) q_D^2 . $
  For any fixed $0 < alpha lt.eq k - 1$, $t gt.eq - epsilon$ implies $e^(alpha Z) q_D = e^(alpha t) q_D^(1 + alpha \/ k) lt.eq C e^(\( k - 1 \) t) q_D^2$. On the complementary level set $Z lt.eq Z_0 + 1$, $q_D lt.eq exp \( k \( Z_0 + 1 + epsilon \) \)$. Thus (4.27) and the core volume bound give, in particular, the fixed-exponent seed
  #[#set math.equation(numbering: n => "(4.28)")
   $ integral_(cal(K)_N) e^Z sqrt(D) thin upright(d) V_g lt.eq exp \( cal(P)_N \) . $ <alg:seed-integral>]
  We chose $alpha = 1$; this exponent does not deteriorate as $N$ grows.
  We next prove the local Sobolev inequality needed to turn (4.28) into a supremum estimate. Use the graph of $f$ in the ordinary product $\( cal(M)_N times bb(R) \, g + upright(d) z^2 \)$. Over a base patch its measure and inverse metric are
  $ upright(d) V_Gamma = S_f thin upright(d) V_g \, #h(2em) S_f = sqrt(1 + \| nabla f \|^2) \, #h(2em) A_Gamma = g^(- 1) - \( 1 - S_f^(- 2) \) e ⊗ e . $
  Both $upright(d) V_Gamma$ and $A_Gamma$ are comparable to $upright(d) mu_D = sqrt(D) thin upright(d) V_g$ and $A_chi$, respectively, with $exp \( cal(P)_N \)$ factors. In fact
  $ min { 1 \, l } lt.eq q_D \/ S_f lt.eq max { 1 \, l } \, #h(2em) S_f^(- 2) / chi = frac(1 + l^2 \| nabla f \|^2, 1 + \| nabla f \|^2) frac(k + p v, k) . $
  The second ratio lies between $ell^2$ and $e^2 \( 1 + N \/ k \)$.
  The scalar mean curvature of this graph in the product is
  $ H_Gamma = frac(q_D, l S_f) ("tr" \( T - K \|_(e^perp) \) + S_f^(- 2) \( j - K \( e \, e \) \)) . $
  The coefficients satisfy
  $ frac(q_D, l S_f) lt.eq max { 1 \, l^(- 1) } \, #h(2em) frac(q_D, l S_f) S_f^(- 2) / sqrt(d) = frac(q_D^2, l S_f^3) lt.eq max { l \, l^(- 1) } . $
  Consequently (4.12) gives
  #[#set math.equation(numbering: n => "(4.29)")
   $ \| H_Gamma \| lt.eq exp \( cal(P)_N \) \( 1 + sqrt(cal(T)) \) . $ <alg:graph-mean-curvature>]
  Notice that this uses only $sqrt(d) thin j$ and the transverse Hessian block, not an unweighted bound for the whole Hessian.
  For clarity concerning the ambient geometry in this step, each of the finitely many fixed base models used in Lemma 20 can be extended beyond the patch to a closed smooth manifold. Choose a smooth Euclidean isometric embedding of that fixed manifold #cite(label("Nash1956")), and take its product with the line. The bound on its second fundamental form is fixed; it is the same on all translated copies along a cylinder. Its contribution to the Euclidean mean curvature vector of the graph is at most $n$ times that bound, because the horizontal projection of a graph unit vector has length at most one. Thus (4.29) holds also for the Euclidean mean curvature vector. A compactly supported base test lifts to a compactly supported graph test for each individual smooth $f$.
  The Michael–Simon inequality #cite(label("MichaelSimon1973")), applied to $\| phi \|^(2 \( n - 1 \) \/ \( n - 2 \))$ and followed by Hölder’s inequality, therefore gives
  #[#set math.equation(numbering: n => "(4.30)")
   $ parallel phi parallel_(L^(2 n \/ \( n - 2 \)) \( upright(d) mu_D \))^2 lt.eq exp \( cal(P)_N \) integral #scale(x: 120%, y: 120%)[\(] \| upright(d) phi \|_(A_chi)^2 + \( 1 + cal(T) \) phi^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) mu_D $ <alg:graph-sobolev>]
  for compactly supported tests in each patch. The Euclidean theorem has no slope or graph-area hypothesis. The comparisons just established check precisely the metric and mean-curvature terms used here.
  It remains to supply a compatible energy estimate. Globally $Xi gt.eq delta_0 cal(T) - cal(P)_N$. Also
  $ upright(d) log a = \( k - 1 + p \) upright(d) t \, #h(2em) \| upright(d) log a \|_(A_chi) lt.eq cal(P)_N sqrt(cal(T)) $
  by (4.12). Test the divergence equation by $psi^2 e^(2 s Z) \/ a$, where $psi$ is a compactly supported base cutoff. The weight $a$ cancels from $u = a sqrt(D)$. After moving the positive principal term to the left, this gives
  $ & integral psi^2 e^(2 s Z) \( delta_0 cal(T) + 2 k s \| upright(d) Z \|_A^2 \) thin upright(d) mu_D\
 & quad lt.eq cal(P)_N integral psi^2 e^(2 s Z) thin upright(d) mu_D + integral e^(2 s Z) psi^2 chevron.l upright(d) log a \, k upright(d) Z + B_K chevron.r_A thin upright(d) mu_D\
 & #h(2em) - 2 s integral e^(2 s Z) psi^2 chevron.l upright(d) Z \, B_K chevron.r_A thin upright(d) mu_D - 2 integral e^(2 s Z) psi chevron.l upright(d) psi \, k upright(d) Z + B_K chevron.r_A thin upright(d) mu_D . $
  The logarithmic-weight terms cost at most $delta_0 psi^2 cal(T) \/ 2 + cal(P)_N psi^2 \( \| upright(d) Z \|_A^2 + \| K \|^2 \)$ by Young’s inequality. The term multiplied by $s$ costs a fixed fraction of $k s psi^2 \| upright(d) Z \|_A^2$ plus $C s psi^2 \| K \|^2$. The cutoff terms cost another such fraction plus $C \( 1 + s^(- 1) \) \| upright(d) psi \|_g^2 + C psi^2 \| K \|^2$. It follows, on choosing a polynomial $s_(*) \( N \)$ sufficiently large, that for every $s gt.eq s_(*) \( N \)$,
  #[#set math.equation(numbering: n => "(4.31)")
   $ integral psi^2 e^(2 s Z) \( cal(T) + s \| upright(d) Z \|_(A_chi)^2 \) thin upright(d) mu_D lt.eq cal(P)_N \( 1 + s \) integral e^(2 s Z) \( psi^2 + \| upright(d) psi \|_g^2 \) thin upright(d) mu_D . $ <alg:weighted-energy>]
  All absorption thresholds are polynomial in $N$. No derivative of $A_chi$ is estimated in this test.
  Set $W = e^Z$, $kappa_(*) = n \/ \( n - 2 \)$, and $p_0 = 2 s_(*) \( N \) > 1$. Insert $phi = psi e^(s Z)$ into (4.30) and use (4.31). For two nested base patches whose gap is $b in \( 0 \, 1 \]$, the resulting estimate, with $p = 2 s gt.eq p_0$, is
  #[#set math.equation(numbering: n => "(4.32)")
   $ parallel W parallel_(L^(p kappa_(*)) \( upright("inner") \, upright(d) mu_D \)) lt.eq #scale(x: 120%, y: 120%)[\[] exp \( cal(P)_N \) \( 1 + p \)^3 b^(- 2) #scale(x: 120%, y: 120%)[\]]^(1 \/ p) parallel W parallel_(L^p \( upright("outer") \, upright(d) mu_D \)) . $ <alg:moser-step>]
  Iteration with $p_i = p_0 kappa_(*)^i$ and gaps proportional to $b 2^(- i)$ is legitimate: both $sum_i 1 \/ p_i$ and $sum_i i \/ p_i$ converge. It gives
  #[#set math.equation(numbering: n => "(4.33)")
   $ sup_(upright("inner")) W lt.eq A_N b^(- C_n) parallel W parallel_(L^(p_0) \( upright("outer") \, upright(d) mu_D \)) \, #h(2em) A_N lt.eq exp \( cal(P)_N \) . $ <alg:moser-sup>]
  We record explicitly why starting at the polynomially large $p_0$ does not spoil the bound obtained from (4.28). Let $J_(*) gt.eq 1$ bound that integral and take increasing patches with successive gaps $b_j = b_(*) 2^(- j - 1)$, all inside a fixed larger patch. If $m_j = log max { 1 \, sup W }$ on patch $j$, interpolation gives
  $ parallel W parallel_(p_0) lt.eq \( sup W \)^(1 - 1 \/ p_0) J_(*)^(1 \/ p_0) \, #h(2em) m_j lt.eq a + c j + \( 1 - 1 \/ p_0 \) m_(j + 1) \, $
  where $a = log A_N + \( log J_(*) \) \/ p_0 + C_n log \( 2 \/ b_(*) \)$ and $c = C_n log 2$ can be increased to be positive. The supremum on the largest compact patch is finite for each individual smooth solution. Iterating the recurrence and letting its length tend to infinity thus gives
  $ m_0 lt.eq p_0 a + c \( p_0^2 - p_0 \) lt.eq cal(P)_N . $
  This last estimate is polynomial even though $1 - 1 \/ p_0$ tends to one. The patches covering $cal(K)_N$ have uniform sizes and geometry, so the conclusion is uniform on that whole set.
  Outside $cal(K)_N$ one has $K = 0$ on a neighborhood. A larger interior maximum of $Z$ above $Z_0$ would have $"div" V = k u "tr"_(A_chi) nabla^2 Z lt.eq 0$, contrary to (4.26); the outer boundary has $Z = 0$. This proves the global upper bound for $Z$ in the first homotopy part. In the last part $K = f = 0$, $t = Z$, and the same high-maximum argument applies whenever $lambda > 0$. At $lambda = 0$ the solution is zero, as already proved.
  Finally $t lt.eq Z$ follows from the implicit relation, $q_D = e^(k \( Z - t \)) lt.eq exp \( cal(P)_N \)$ follows from the floor, and $\| nabla f \| lt.eq q_D \/ l lt.eq q_D \/ ell$. Lemma 23 gives $\| f \| lt.eq C_h \/ eta$. These are the remaining assertions of (4.24). ◻
]

The estimates in this section are statements about every smooth solution, uniformly in the outer truncation, and are therefore available before continuation or exhaustion. Their parameter order is essential: $delta_0$ is fixed first, $C_N$ is a polynomial penalty, and the distortion bounds are exponential in a polynomial. The subsequent existence proof may use unrestricted constants at a fixed $N$, while the later mass estimate will use only the polynomial losses proved here.

== 5 The coupled elliptic construction and its limiting geometry <pde:section>

We now solve the system of Section 4. Its preceding estimates control the unknowns and their first derivatives, but the trace operator has a coefficient whose modulus of continuity is not initially controlled. We prove the particular gradient estimate needed for that operator. This estimate, a scalar potential argument for the second equation, and continuation give smooth solutions. We then establish the end behavior, mass cost, and height barriers that keep the region requiring charged curvature control on the original exterior. No charged solvability theorem is used.

The prepared data, dimension, and $epsilon > 0$ are fixed first, and $N$ is subsequently chosen sufficiently large. We use (4.2) and (4.17), including

$ k = n - 1 \, #h(2em) ell = e^(- N epsilon) \, #h(2em) eta = ell^(3 \/ 2) \, #h(2em) h = eta f . $

The notation $cal(P)_N$ denotes a possibly changing polynomial in $1 + N$, with coefficients depending on the fixed data, dimension, and $epsilon$. Local elliptic constants may depend arbitrarily on fixed $N$. They are not used as uniform constants in the limit $N arrow.r oo$.

=== 5.1 A gradient estimate without a coefficient modulus <a-gradient-estimate-without-a-coefficient-modulus>

#thm([Lemma 5.1.])[
  (The special scalar gradient estimate).  #emph[Let $g$ be a smooth uniformly positive metric on a coordinate ball, or on a smooth coordinate half-ball with a distinguished boundary face, with bounded smooth coordinate geometry. Suppose an individually smooth function $z$ satisfies 
#[#set math.equation(numbering: n => "(5.1)")
 $ (g^(- 1) - \( 1 - chi \) e_z ⊗ e_z) : nabla^2 z = G \, #h(2em) e_z = frac(nabla z, \| nabla z \|_g) \, #h(2em) c lt.eq chi lt.eq 1 \, $ <pde:special-equation>]

 where $c > 0$, $\| nabla z \|_g lt.eq M$, and $\| G \| lt.eq C$. The axis at a gradient zero may be chosen arbitrarily. The coefficient $chi$ may be measurable, with no assumed modulus of continuity. In the half-ball case assume a constant value of $z$ on the distinguished face.]
  #emph[There are $alpha in \( 0 \, 1 \)$ and uniform local $C^alpha$ bounds for $nabla z$, in the interior or up to that face. On smaller balls or half-balls one also has 
#[#set math.equation(numbering: n => "(5.2)")
 $ integral_(B_r) \| nabla^2 z \|_g^2 thin upright(d) V_g lt.eq C_1 r^(n - 2 + 2 alpha) \, #h(2em) 0 < r < r_1 . $ <pde:hessian-morrey>]

 Constants depend on $n \, c \, M \, C$, the coordinate geometry and localization, but not on the modulus of $chi$ or higher derivatives of the individual solution.]
] <pde:special-gradient>

#proof[
  We give the boundary reduction and both improvement arguments.
  ===== 5.1.1 A local Hessian estimate. <a-local-hessian-estimate.>
  Normalize the metric to the identity at a ball center and restrict to a sufficiently small ball. The coordinate principal matrix $a$ then satisfies
  $ \| I - a \|_(upright(F)) lt.eq 1 - c \/ 2 \, $
  where the norm is Frobenius; connection terms are lower-order terms. The full-space operator $D^2 Delta^(- 1)$, with the Frobenius Hessian norm, has $L^2$ norm one by Fourier transformation. Its boundedness on nearby $L^s$ spaces and interpolation give $s_0 > 2$ for which its norm times $1 - c \/ 2$ is less than one. Absorbing the perturbation from the Laplacian and localizing therefore gives, for $s = 2 \, s_0$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel D^2 Y parallel_(L^s \( B_r \)) lt.eq C_s (parallel a : D^2 Y parallel_(L^s \( B_(2 r) \)) + r^(- 2) parallel Y parallel_(L^s \( B_(2 r) \))) . $ <pde:cordes-local>]
  The cutoff commutator contains $r^(- 1) D Y$ and $r^(- 2) Y$. The interpolation estimate $parallel D Y parallel_s lt.eq delta r parallel D^2 Y parallel_s + C_delta r^(- 1) parallel Y parallel_s$, and absorption on nested balls, remove the former. This argument uses only measurable principal coefficients. The Laplacian estimates are the classical singular-integral bounds #cite(label("CalderonZygmund1952")) #cite(label("GilbargTrudinger2001")).
  ===== 5.1.2 Reflection and its flux correction. <reflection-and-its-flux-correction.>
  Subtract the constant face value. In Gaussian coordinates write
  $ g = upright(d) t^2 + h_(a b) \( y \, t \) thin upright(d) y^a upright(d) y^b \, #h(2em) t gt.eq 0 . $
  Extend $z$ oddly, $h$ and $chi$ evenly, and $G$ oddly across $t = 0$. For $R = "diag" \( I \, - 1 \)$, the reflected gradient and Hessian are $- R nabla z$ and $- R^T \( nabla^2 z \) R$, while the principal matrix is $R a R$. Thus the equation holds almost everywhere. Tangential derivatives of the face value vanish, so the extension is individually $C^1$ and $W^(2 \, s)$ for finite $s$. The reflected metric is Lipschitz and smooth on each side, sufficient for (5.3).
  There is one boundary contribution when differentiating the gradient norm. Put
  $ p_z = nabla z \, quad U_z = \| p_z \|_g^2 \/ 2 \, quad A = g^(- 1) - \( 1 - chi \) e_z ⊗ e_z \, quad cal(F) = \( nabla^2 z - \( Delta_g z \) g \) nabla z . $
  The equation and the contracted Hessian identity give
  #[#set math.equation(numbering: n => "(5.4)")
   $ A thin upright(d) U_z - G p_z & = cal(F) \,\
"div"_g cal(F) & = \| nabla^2 z \|_g^2 - \( Delta_g z \)^2 + "Ric"_g \( p_z \, p_z \) $ <pde:gradient-flux>]
  on each smooth side. Neither formula differentiates $chi$. Let $q = z_t \( y \, 0 \)$, $upright("II")_(a b) = 1 / 2 partial_t h_(a b) \( y \, 0 \)$, $H = "tr"_h upright("II")$, and $J = sqrt(det h)$. Constant face data give $\( nabla^2 z \)_(a b) = q upright("II")_(a b)$. Thus the normal traces of $cal(F)$ are $- H q^2$ and $+ H q^2$. The coordinate divergence of $J cal(F)$ has the plane density $- 2 J \( y \, 0 \) H q^2 delta_({ t = 0 })$. It is canceled by
  #[#set math.equation(numbering: n => "(5.5)")
   $ cal(C) = 2 J \( y \, 0 \) H \( y \) q \( y \)^2 thin upright(bold(1))_({ t > 0 }) partial_t . $ <pde:face-correction>]
  This vector has only a normal component. Its divergence differentiates only in $t$, and requires no tangential derivative of $q$. For each localized ball, extend the face density $2 J \( y \, 0 \) H \( y \) q \( y \)^2$ by zero in the tangential variables outside the portion of the face lying in that ball. Since $cal(C)$ has only a normal component, this localization creates no additional distributional divergence and its bound uses only the gradient bound on that face portion.
  Normalize $\| p_z \|_g lt.eq 1$ and set $s = 1 - \| p_z \|_g^2$. The corrected flux is
  $ J A thin D s + B = - 2 \( J cal(F) + cal(C) \) \, #h(2em) B = 2 J G p_z - 4 J \( y \, 0 \) H q^2 upright(bold(1))_({ t > 0 }) partial_t . $
  Convexity gives
  $ \( Delta_g z \)^2 = #scale(x: 120%, y: 120%)[\(] \( 1 - chi \) nabla^2 z \( e_z \, e_z \) + G #scale(x: 120%, y: 120%)[\)]^2 lt.eq \( 1 - chi \) \| nabla^2 z \|_g^2 + G^2 \/ chi . $
  Consequently, in distributions,
  #[#set math.equation(numbering: n => "(5.6)")
   $ "div" \( J A thin D s + B \) lt.eq - 2 c J \| nabla^2 z \|_g^2 + 2 J #scale(x: 120%, y: 120%)[\(] G^2 \/ c + \| "Ric"_g \| \| p_z \|_g^2 #scale(x: 120%, y: 120%)[\)] . $ <pde:deficit-inequality>]
  In an interior chart take $cal(C) = 0$. Radius-$r$ rescaling multiplies face curvature by $r$, smooth-side curvature by $r^2$, and the forcing by $r \/ M_1$ if gradients are divided by $M_1$. Thus the additional bounded flux is small under the stated small-error rescaling. The construction also applies to balls centered near the reflected face.
  ===== 5.1.3 Gradient drop or affine entry. <gradient-drop-or-affine-entry.>
  Fix $r_(*) in \( 0 \, 1 \/ 32 \)$ and $b_0 > 0$. There exist $k_(*) in \( r_(*) \, 1 \)$ and a small error threshold such that a normalized solution on $B_1$, with $\| nabla z \|_g lt.eq 1$, satisfies either
  #[#set math.equation(numbering: n => "(5.7)")
   $ & sup_(B_(r_(*))) \| nabla z \|_g lt.eq k_(*) \,\
 & parallel z - L parallel_(L^oo \( B_(r_(*)) \)) lt.eq b_0 r_(*) \, #h(2em) 1 / 2 lt.eq \| D L \| lt.eq 2 $ <pde:gradient-drop>]
  for some affine $L$. Small errors comprise forcing, metric and connection errors, smooth-side curvature, and reflected-face curvature. Both $k_(*)$ and the threshold may depend on $b_0$.
  Otherwise choose errors tending to zero, with the gradient supremum on $B_(r_(*))$ tending to one and without affine entry. Normalize $z_j \( 0 \) = 0$. Equation (5.3) gives uniform local $W^(2 \, 2)$ bounds and hence uniform local $L^2$ bounds on $D s_j$, where $s_j = 1 - \| nabla z_j \|_(g_j)^2$. Equation (5.6) reads
  $ "div" \( a_j D s_j + B_j \) lt.eq - kappa \| D^2 z_j \|^2 + epsilon.alt_j \, #h(2em) parallel B_j parallel_oo + epsilon.alt_j arrow.r 0 $
  with uniform ellipticity and $kappa > 0$. Weak Harnack, after discarding the Hessian term, gives $s_j arrow.r 0$ in measure on $B_(1 \/ 2)$, since $inf_(B_(r_(*))) s_j arrow.r 0$.
  For completeness, convergence of $D s_j$ needs a separate test. With a cutoff $zeta$ supported in $B_(1 \/ 2)$, test the inequality by $zeta^2 \( b - s_j \)_(+)$, $0 < b < 1$. Ellipticity and Young give
  #[#set math.equation(numbering: n => "(5.8)")
   $ integral_({ s_j < b }) zeta^2 \| D s_j \|^2 lt.eq C #scale(x: 240%, y: 240%)[\(] & b^2 integral \| D zeta \|^2 + integral zeta^2 \| B_j \|^2\
 & + b integral zeta \| D zeta \| \| B_j \| + epsilon.alt_j b integral zeta^2 #scale(x: 240%, y: 240%)[\)] . $ <pde:lower-truncation>]
  Its limsup on a smaller compact ball is at most $C b^2$. On ${ s_j gt.eq b }$, measure convergence and the uniform $L^2$ gradient bound make the $L^1$ norm of $D s_j$ tend to zero. On ${ s_j < b }$, the limsup is at most $C b$. Sending $b$ to zero gives local $L^1$ convergence of $D s_j$. A fixed cutoff in the full deficit inequality now yields $D^2 z_j arrow.r 0$ in $L^2 \( B_(1 \/ 3) \)$. Poincaré makes the gradients converge to a constant vector, of length one because $s_j arrow.r 0$. Uniform Lipschitz control gives uniform convergence on smaller balls to the corresponding affine function, a contradiction. Here and below we use the usual inhomogeneous weak Harnack and scalar divergence estimates #cite(label("GilbargTrudinger2001")).
  ===== 5.1.4 Improvement near a nonzero affine function. <improvement-near-a-nonzero-affine-function.>
  There are $alpha_2 > 0$, $lambda in \( 0 \, 1 \/ 8 \)$, and sufficiently small $b_0 \, delta' > 0$ with this property: if
  $ parallel z - L parallel_(L^oo \( B_1 \)) lt.eq b lt.eq b_0 \, #h(2em) 1 / 4 lt.eq \| D L \| lt.eq 4 \, $
  the gradient is uniformly bounded, and metric, connection and forcing errors are at most $b delta'$, then an affine $L'$ satisfies
  #[#set math.equation(numbering: n => "(5.9)")
   $ parallel z - L' parallel_(L^oo \( B_lambda \)) lt.eq b lambda^(1 + alpha_2) \, #h(2em) \| D L' - D L \| lt.eq C b . $ <pde:affine-improvement>]
  Indeed $Y = \( z - L \) \/ b$ has bounded supremum and bounded local $W^(2 \, s_0)$ norm by (5.3). The normalized connection term is small because it uses the original gradient bound before division by $b$. As $b_0 \, delta' arrow.r 0$, $D z - D L = b D Y arrow.r 0$ locally in measure. Freeze only the axis at $e_0 = D L \/ \| D L \|$, leaving $chi$ measurable. Bounded coefficient differences converging in measure, and the $L^(s_0)$ Hessian bound, give
  #[#set math.equation(numbering: n => "(5.10)")
   $ parallel Delta_(e_0^perp) Y + chi partial_(e_0)^2 Y parallel_(L^2 \( B_(3 \/ 4) \)) arrow.r 0 . $ <pde:axis-residual>]
  The Dirichlet Laplace inverse on the convex ball $B_(3 \/ 4)$ has $parallel D^2 v parallel_2 lt.eq parallel Delta v parallel_2$, by integration by parts. Thus the frozen operator has a zero-Dirichlet inverse in $W^(2 \, 2)$ by a contraction of norm at most $1 - c$. Subtract the resulting small correction to obtain $Y_0$, uniformly bounded in $W^(2 \, 2)$, with
  $ Delta_(e_0^perp) Y_0 + chi partial_(e_0)^2 Y_0 = 0 . $
  The derivative $zeta_0 = partial_(e_0) Y_0 in W^(1 \, 2)$ satisfies
  #[#set math.equation(numbering: n => "(5.11)")
   $ "div" [\( I - e_0 ⊗ e_0 + chi e_0 ⊗ e_0 \) D zeta_0] = 0 $ <pde:frozen-derivative>]
  in distributions. Differentiation acts on the $L^2$ flux $chi partial_(e_0) zeta_0$; no classical derivative of $chi$ is being asserted. Uniform scalar divergence estimates give $zeta_0 in C^(alpha_1)$ for some $alpha_1 in \( 0 \, 1 \)$. Caccioppoli after subtraction of a local value gives
  $ integral_(B_r) \| D zeta_0 \|^2 lt.eq C r^(n - 2 + 2 alpha_1) . $
  The source in $Delta Y_0 = \( 1 - chi \) partial_(e_0) zeta_0$ therefore has $L^1$ mass at most $C r^(n - 1 + alpha_1)$. The gradient of its localized Newton potential is $C^(alpha_1)$: for points separated by $a$, near annuli of radius $R lt.eq a$ contribute $C R^(alpha_1)$, and the far-field gradient difference contributes $C a R^(alpha_1 - 1)$ for $R gt.eq a$. Both dyadic sums converge. Subtracting this potential leaves a harmonic function on a smaller ball. All first derivatives of $Y_0$ thus have a uniform Hölder bound.
  The unfrozen $Y$ has a uniform interior Hölder modulus by the scalar Krylov–Safonov estimate with bounded forcing #cite(label("GilbargTrudinger2001")) Section 9.8; see also #cite(label("Mooney2019")) for the homogeneous mechanism. The $L^2$-small correction $Y - Y_0$ is consequently small uniformly on a smaller ball, using the uniform moduli of both terms. Taylor approximation of $Y_0$, first choosing $0 < alpha_2 < alpha_1$ and small $lambda$, and then $b_0 \, delta'$, proves (5.9).
  ===== 5.1.5 Iteration and Hessian growth. <iteration-and-hessian-growth.>
  At each center begin with a fixed gradient normalization and sufficiently small radius for both error thresholds. On each gradient drop reduce the radius by $r_(*)$ and the normalization by $k_(*)$. Since $r_(*) \/ k_(*) < 1$, normalized forcing stays small; geometric errors also decrease. If affine entry never occurs, the approximation by a constant has order $r^(1 + alpha_d)$, where $alpha_d = log k_(*) \/ log r_(*) > 0$.
  After affine entry rescale its smaller ball to unit size and keep the same gradient normalization. Iterate (5.9) at radii $lambda^i$, with errors $b_i = b_0 lambda^(i alpha_2)$. Only constants, not affine functions, are subtracted when rescaling the structural equation, so its axis remains that of the actual gradient. Forcing and geometric errors decrease like $lambda^i$, faster than $b_i$. The slope increments $C b_i$ are summable; small $b_0$ keeps slopes in $\[ 1 \/ 4 \, 4 \]$. Combining the two regimes gives uniform affine approximation of order $r^(1 + alpha)$, also across the entry scale, for $alpha lt.eq min \( alpha_d \, alpha_2 \)$. The affine Campanato criterion gives the gradient Hölder estimate. The same iteration applies in corrected reflected charts.
  Finally subtract the first affine jet in (5.3). Its remainder is $O \( r^(1 + alpha) \)$, and the forcing and connection terms are bounded. The squared $s = 2$ estimate gives
  $ integral_(B_r) \| D^2 z \|^2 lt.eq C \( r^n + r^(n - 2 + 2 alpha) \) \, $
  which implies (5.2), with equivalent covariant norms and the same argument on half-balls. ◻
]

=== 5.2 The second equation and coupled regularity <the-second-equation-and-coupled-regularity>

#thm([Lemma 5.2.])[
  (A bounded solution with natural gradient growth).  #emph[On a ball suppose a bounded, individually smooth function $Z$ solves 
$ - "div" \( A thin D Z \) = "div" B + F \, $

 where $A$ is symmetric, bounded and uniformly elliptic, $B$ is bounded, and 
$ \| F \| lt.eq a_0 \| D Z \|^2 + mu \, #h(2em) mu \( B_r \( x \) \) lt.eq C_0 r^(n - 2 + alpha_0) $

 for some $alpha_0 in \( 0 \, 1 \)$, uniformly at the relevant centers. Here $mu$ can be a nonnegative measure; in the application its density is individually bounded. Then $Z$ has a uniform local Hölder modulus. The same conclusion holds up to a constant Dirichlet face if the equation can be reflected with bounded coefficients, bounded divergence flux, and the same source growth.]
] <pde:natural-growth>

#proof[
  Choose a fixed large $L$ and set $Q_plus.minus = e^(plus.minus L Z)$. The distributional chain rule gives
  $ - "div" \( A thin D Q_plus.minus \) =  & "div" \( plus.minus L e^(plus.minus L Z) B \)\
 & + e^(plus.minus L Z) #scale(x: 120%, y: 120%)[\(] plus.minus L F - L^2 A thin D Z dot.op D Z - L^2 B dot.op D Z #scale(x: 120%, y: 120%)[\)] . $
  If the lower ellipticity bound is $lambda_0$, choose $L > 2 a_0 \/ lambda_0$. Young’s inequality absorbs the bounded-flux cross term into the remaining negative gradient square. The boundedness of $Z$ gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ - "div" \( A thin D Q_plus.minus \) lt.eq "div" B_plus.minus + C \( upright(d) x + mu \) \, #h(2em) parallel B_plus.minus parallel_oo lt.eq C . $ <pde:exponential-subsolutions>]
  The matrix on the left is the same for both signs.
  On $B_r$, let $w_plus.minus$ be the zero-Dirichlet potential of the right side of (5.12). Scalar Dirichlet Green estimates for bounded measurable uniformly elliptic coefficients give
  #[#set math.equation(numbering: n => "(5.13)")
   $ parallel w_plus.minus parallel_oo lt.eq C \( r + r^(alpha_0) \) . $ <pde:green-potential>]
  Here is the dependence on the source hypotheses. The bound $cal(G) \( x \, y \) lt.eq C \| x - y \|^(2 - n)$ and dyadic annuli give $C r^(alpha_0)$ for the measure source. The exterior-pole gradient energy bound $integral_({ \| x - y \| > rho }) \| D_y cal(G) \( x \, y \) \|^2 lt.eq C rho^(2 - n)$ gives $L^1$ gradient mass $C rho$ on an annulus of scale $rho$. Summing gives $C r$ for bounded divergence data. These scalar Green bounds hold in every $n gt.eq 3$; see #cite(label("KangKim2010")) Corollary 4.1 and Theorem 3.6. One can first use the individually bounded densities here and then pass to their uniform growth bounds.
  Put $epsilon.alt_r = C \( r + r^(alpha_0) \)$, and define
  $ U_plus.minus = sup_(B_r) Q_plus.minus + epsilon.alt_r - Q_plus.minus + w_plus.minus . $
  They are nonnegative supersolutions. Let $M = sup_(B_r) Z$ and $m = inf_(B_r) Z$. On at least half of an intermediate ball either $Z lt.eq \( M + m \) \/ 2$ or $Z gt.eq \( M + m \) \/ 2$. In the first case the uncorrected plus deficit is bounded below by a fixed multiple of $M - m$; in the second case the minus deficit is. The multiplicative constant is positive because $Z$ is bounded. Weak Harnack for the corresponding $U_plus.minus$ therefore lowers the supremum, or raises the infimum, on $B_(r \/ 4)$, up to $C epsilon.alt_r$. Thus
  $ "osc"_(B_(r \/ 4)) Z lt.eq \( 1 - c_0 \) "osc"_(B_r) Z + C \( r + r^(alpha_0) \) . $
  Iteration gives a Hölder modulus. The same proof applies after the stated reflection. ◻
]

#thm([Lemma 5.3.])[
  (Estimates for smooth fixed points above the floor).  #emph[Fix $N$ and a sufficiently distant truncation of $cal(M)_N$. Every smooth solution of the system (4.17), or of its specified homotopy, satisfying $t > - epsilon$, has local smooth bounds depending on fixed $N$ and the background geometry. The bounds hold up to the outer zero-Dirichlet face and are uniform as that face tends to infinity, on fixed compact sets and uniformly sized end patches.]
] <pde:coupled-estimates>

#proof[
  Lemma 25 and Proposition 26 give
  $ - epsilon < t lt.eq Z lt.eq cal(P)_N \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| f \| + \| D f \| lt.eq e^(cal(P)_N) . $
  At fixed $N$, the eigenvalue $chi = k d \/ \( k + p v \)$ is consequently bounded away from zero. The normalized trace equation is
  #[#set math.equation(numbering: n => "(5.14)")
   $ A_chi : nabla^2 f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] eta f - "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] . $ <pde:normalized-trace>]
  Its right side is bounded. Lemma 27 therefore bounds $D f$ in $C^alpha$, including at the outer face, and gives (5.2) for $f$.
  Write the other equation in the form of Lemma 28, with
  $ A = k u A_chi \, #h(2em) B = u A_chi K \( w \, dot.op \) . $
  The sign of the scalar source is immaterial for its absolute bound. The implicit relation for $t$ gives
  $ \| D t \| lt.eq C_N \( 1 + \| D Z \| + \| D^2 f \| \) . $
  The explicit quadratic formula for $cal(T)$ then bounds the absolute scalar source by
  $ C_N \( 1 + \| D Z \|^2 \) + C_N \| D^2 f \|^2 . $
  All lower-order fluxes are bounded. The Hessian estimate supplies
  $ integral_(B_r) \| D^2 f \|^2 lt.eq C_N r^(n - 2 + 2 alpha) \; $
  we may decrease the exponent when applying Lemma 28. This proves a uniform Hölder modulus for $Z$.
  At the outer face extend $Z$ oddly and the divergence matrix by $A^(-) = R A^(+) R$. Extend the total flux by $- R$, and the scalar source oddly. The normal flux is continuous, so its distributional divergence has no plane mass. Boundedness and the source-growth estimates are preserved. This justifies the use of the boundary case of Lemma 28.
  The coefficients and right side of (5.14) are now Hölder, since they are smooth functions of $Z \, D f$ on the bounded parameter range. Interior and Dirichlet Schauder estimates give $f$ through second derivatives. Expanding the divergence equation for $Z$, its principal matrix is Hölder and its remaining source is bounded by $C_N \( 1 + \| D Z \|^2 \)$. For finite $s > n$, use the local interpolation inequality
  #[#set math.equation(numbering: n => "(5.15)")
   $ parallel D Z parallel_(L^(2 s) \( Q \))^2 lt.eq C thin "osc"_(Q') Z thin parallel D^2 Z parallel_(L^s \( Q' \)) + C_(Q \, Q') \( "osc"_(Q') Z \)^2 $ <pde:quadratic-interpolation>]
  on concentric ball or half-ball patches $Q subset.double Q'$. It follows by scaled derivative interpolation after subtraction of a constant. The already proved Hölder estimate makes its Hessian coefficient uniformly small on sufficiently small fixed patches. Local nondivergence $W^(2 \, s)$ estimates therefore absorb the quadratic term. The leading estimate constants stay bounded as patches shrink, since the principal matrices have a uniform Hölder modulus. Lower-order constants may depend on the selected scale. Use bounded overlap of patch enlargements and the supremum of their local Hessian norms to carry out the absorption; these norms are individually finite on every truncation. This proves $W^(2 \, s)$ bounds for $Z$.
  Schauder estimates and differentiation now bootstrap both functions. At each differentiation the $f$ equation is solved first with the known regularity of $Z$, and then the expanded $Z$ equation gains the next derivative. These are the usual local and Dirichlet elliptic estimates #cite(label("GilbargTrudinger2001")). All charts, including uniformly sized end charts and outer boundary charts, have controlled geometry. Hence the constants on fixed compact sets do not depend on the truncation radius. ◻
]

=== 5.3 Solving the trace equation and the coupled system <solving-the-trace-equation-and-the-coupled-system>

#thm([Lemma 5.4.])[
  (The trace equation for an arbitrary trial scalar).  #emph[On a fixed smooth truncation, fix $Z in C^(1 \, alpha)$ with zero outer trace. The trace equation $F = eta f$, with zero outer Dirichlet value for $f$, has a unique solution in $C^(3 \, alpha)$. The solution depends continuously on the trial $Z$ and on the tensor homotopy. On bounded sets of trials these solutions have bounded $C^(3 \, alpha)$ norms. No floor condition on the trial is needed.]
] <pde:trial-trace>

#proof[
  For any prescribed $Z \, D f$, the defining relation for $t$ is strictly increasing in $t$, so the coefficients are smooth functions of these variables. Continue the normalized equation (5.14) from $Delta f = f$, by straight interpolation of the two operators. Its height coefficient is strictly negative when all terms are placed on the left. At a positive maximum the gradient vanishes, $A_chi = I$, and the maximum test gives $f lt.eq parallel "tr" K parallel_oo \/ eta$; the analogous bound holds at a minimum. The same height bound works throughout the interpolation.
  We supply the gradient bound, since ellipticity must not be assumed before it. Put $sigma = \| D f \|$. For bounded trial $Z$, as $sigma arrow.r oo$, the implicit relation has $t < 0$ and hence $l = e^(N t)$, so
  $ t = - frac(log sigma, k + N) + O \( 1 \) \, #h(2em) d asymp sigma^(- 2 k \/ \( k + N \)) . $
  For $N > k$ this gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ chi gt.eq frac(c_N, 1 + sigma) \, #h(2em) sqrt(D) / l lt.eq C_N \( 1 + sigma \) . $ <pde:trial-growth>]
  The constants are uniform on a bounded set of trials. Compact $sigma$ ranges are included by positivity and continuity. The normalized right side, using the height bound, is at most $C_N \( 1 + sigma \)$ in absolute value. Straight operator interpolation has the same properties: its axial eigenvalue is at least $chi$.
  Choose a short distance interval $\[ 0 \, s_0 \]$ and a modulus
  $ psi \( 0 \) = 0 \, #h(2em) psi'' = - K_0 \( psi' \)^2 \, #h(2em) psi' > 0 . $
  Choose $K_0$ large first, then $s_0$ sufficiently small for the distance geometry and so that $psi' gt.eq 1$ can hold throughout. Finally choose the initial slope sufficiently large that $psi \( s_0 \)$ exceeds twice the height bound. This is possible from
  $ psi \( s \) = K_0^(- 1) log \( 1 + K_0 psi' \( 0 \) s \) . $
  On a boundary collar, $plus.minus psi \( "dist" \( dot.op \, partial \) \)$ are upper and lower barriers. The negative axial term $chi psi''$, by (5.16), has size at least a fixed multiple of $K_0 psi'$, and dominates the linear-growth right side and the bounded second derivatives of the distance.
  For the interior estimate consider a positive maximum of
  $ f \( x \) - f \( y \) - psi \( "dist" \( x \, y \) \) $
  with distance less than $s_0$, using the smooth ambient metric extension across the outer boundary. Contacts at a boundary endpoint are excluded by the preceding barriers; contacts at distance $s_0$ are excluded by the height bound. At an interior contact the two gradients are parallel along the short minimizing geodesic and have length $sigma = psi'$. Parallel transverse endpoint variations bound the difference of the transverse Hessian traces by $C "dist" \( x \, y \) sigma$. The separate axial variations give
  $ nabla^2 f_x \( e \, e \) lt.eq psi'' \, #h(2em) - nabla^2 f_y \( e \, e \) lt.eq psi'' . $
  Thus the difference of the two operators is at most
  $ C s_0 sigma + \( chi_x + chi_y \) psi'' lt.eq C s_0 sigma - c_N K_0 sigma . $
  For large $K_0$ this contradicts the absolute linear-growth bound for the difference of their right sides. The same argument with $x \, y$ exchanged proves the Lipschitz bound. It is valid throughout the operator interpolation.
  The gradient bound gives uniform ellipticity. Apply Lemma 27, then Schauder to obtain $C^(2 \, beta)$ for some $beta > 0$. These bounds make $D f$ Lipschitz, so the original $C^(1 \, alpha)$ trial and the smooth coefficient functions give $C^alpha$ coefficients; Schauder then yields $C^(2 \, alpha)$ and, by one differentiation, $C^(3 \, alpha)$. The Dirichlet linearization has a strictly negative zero-order term. The maximum principle and the usual elliptic Fredholm alternative therefore make it invertible. The same maximum principle, applied to the linear equation for the difference, gives uniqueness. Continuation is open by this invertibility and closed by the uniform estimates. The implicit-function theorem and uniqueness also give continuous dependence in the stated spaces. ◻
]

#thm([Proposition 5.5.])[
  (A filled solution).  #emph[For fixed prepared data and $epsilon > 0$, all sufficiently large $N$ admit a smooth solution of (4.17) on the entire one-ended filled manifold $cal(M)_N$, with 
$ t > - epsilon \, #h(2em) t lt.eq Z lt.eq cal(P)_N \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| f \| + \| nabla f \| lt.eq e^(cal(P)_N) . $

 The functions $f$ and all their derivatives decay exponentially on the end, with constants depending on fixed $N$. Moreover 
#[#set math.equation(numbering: n => "(5.17)")
 $ t \, Z = O_j \( r^(2 - n) \) quad upright("for every ") j \, #h(2em) Delta_g t = O \( r^(- n - beta) \) . $ <pde:end-decay>]

 The uniform height bound and the radial height estimate of Lemma 23 hold on the limiting solution.]
] <pde:filled-solve>

#proof[
  First truncate at a coordinate sphere of radius $R$, with $R gt.eq R_min \( N \)$ as in the floor estimate. For a trial $Z in C^(1 \, alpha)$ with zero outer trace solve the trace equation by Lemma 30. Freeze this pair in the divergence equation, except for the gradient of the new $Z$ in its principal flux. The resulting linear Dirichlet solve defines a map $T$ into $C^(2 \, alpha)$. Indeed its principal coefficients are $C^(1 \, alpha)$, its drift flux is $C^(1 \, alpha)$, and its scalar source is $C^alpha$. Thus $T$ is a continuous compact map on $C^(1 \, alpha)$. Fixed points bootstrap to smoothness.
  Use the homotopy described with (4.17), in reverse order: first take $K = 0$ and scale the full scalar source from zero to one, then scale $K$ from zero to its specified value with the full source. When $K = 0$, uniqueness of the trace equation gives $f = 0$ for every trial. At zero scalar scaling the map is identically zero.
  For a homotopy parameter $lambda$, write $f_lambda \[ Z \]$ for the trace solve. Apply degree on the relatively open moving domain
  $ {\( lambda \, Z \) : min t \[ Z \, D f_lambda \[ Z \] \] > - epsilon \, quad parallel Z parallel_(C^(1 \, alpha)) < M_(N \, R)} . $
  The dependence is continuous by Lemma 30. Choose $M_(N \, R)$ larger than the fixed-point bound supplied by Lemma 29. There is no norm-boundary fixed point. There is no floor-boundary fixed point by the floor exclusion, including its outer-sphere estimate and final $K = f = 0$ stage. The a priori estimates also hold with a non-strict floor inequality when taking a closure, before that exclusion is applied. The map has relatively compact image on the bounded trial closure. Leray–Schauder degree for a bounded relatively open subset of the product with the parameter interval therefore applies #cite(label("LeraySchauder1934")) Sections 12–13. Its degree at the initial zero map is one, by excision around $Z = 0$; it stays one throughout the homotopy. This gives a smooth solution above the floor on each sufficiently large truncation.
  Lemma 29 gives smooth local compactness uniform in $R$. To retain the boundary condition at infinity, we establish uniform end estimates before exhausting. On the end $K = 0$, and (5.14) becomes
  $ A_chi : nabla^2 f = frac(eta sqrt(D), l) f \, #h(2em) frac(eta sqrt(D), l) gt.eq eta \/ e . $
  For fixed $N$, sufficiently small $kappa_N > 0$, and a sufficiently large fixed inner radius, the functions $C_N e^(- kappa_N \( r - r_0 \))$ are barriers for both signs of $f$. The positive zeroth-order coefficient dominates their radial second derivatives; enlarge $r_0$ to control the radial Hessian error. They dominate at the inner sphere and at the outer zero boundary. Consequently $f$ decays exponentially, uniformly in $R$. Local and outer-face estimates give the same decay for every derivative. The implicit relation then gives exponentially small $t - Z$, with all derivatives.
  Up to exponentially decaying errors, the end equation is
  #[#set math.equation(numbering: n => "(5.18)")
   $ k Delta_g Z + k #scale(x: 120%, y: 120%)[\[] \( k - 1 \) + p \( Z \) - delta_0 s_(p \( Z \)) #scale(x: 120%, y: 120%)[\]] \| d Z \|_g^2 = rho - theta.alt \( N \( Z + epsilon \) \) C_N rho_0 \, #h(2em) s_p = p + \( k - 1 \) \/ 2 . $ <pde:end-equation>]
  Set $a_N \( z \) = \( k - 1 \) + p \( z \) - delta_0 s_(p \( z \))$, and choose $Phi_N \( 0 \) = 0$, $Phi'_N \( 0 \) = 1$, with $Phi''_N \/ Phi'_N = a_N$. On the bounded range of $Z$, $Phi'_N$ has positive lower and upper bounds depending on fixed $N$. Thus (5.18) implies
  $ Delta_g Phi_N \( Z \) = O_N \( r^(- n - beta) \) + O_N \( e^(- kappa_N r) \) . $
  Comparison with multiples of $r^(2 - n) \( 1 - r^(- beta \/ 2) \)$, on each truncation, gives $Phi_N \( Z \) = O_N \( r^(2 - n) \)$, hence $Z = O_N \( r^(2 - n) \)$. These barriers have the required signed Laplacian for large $r$; their $r^(- n - beta \/ 2)$ term dominates both the source and the asymptotically flat metric errors.
  Scaled Poisson $W^(2 \, s)$ estimates first give weighted first-derivative Hölder bounds; the source is a smooth function of $Z$, the radius weights and exponentially small terms. Scaled Schauder and differentiation then give $Z = O_j \( r^(2 - n) \)$ for every $j$. The same follows for $t$. Its Laplacian has the improved bound in (5.17), since $\| d Z \|^2 = O \( r^(2 - 2 n) \)$ and $beta < 1$. Exhaustion now supplies the asserted solution with zero limit at infinity. If the limit touched $- epsilon$, that point would be an interior minimum, and the identical floor calculation of Lemma 25 would exclude it. All height bounds pass to the limit. ◻
]

=== 5.4 Mass, height separation, and the charged region <mass-height-separation-and-the-charged-region>

#thm([Proposition 5.6.])[
  (The mass cost of the filled construction).  #emph[Let $hat(g) = e^(2 t) \( g + l^2 d f^2 \)$ be obtained from Proposition 31, and let $E_(*)$ be the ADM energy of the prepared metric $g$. Then 
#[#set math.equation(numbering: n => "(5.19)")
 $ frak(F) := lim_(r arrow.r oo) integral_(S_r) g \( V \, nu \) thin upright(d) A_g = integral_(cal(M)_N) u Xi thin upright(d) V_g \, #h(2em) cal(E)_(upright("ADM")) \( hat(g) \) = E_(*) - frac(frak(F), k omega) . $ <pde:mass-flux>]

 For fixed $epsilon$, 
#[#set math.equation(numbering: n => "(5.20)")
 $ frak(F) gt.eq - cal(P)_N \( ell + ell^2 \/ eta \) = - cal(P)_N \( ell + ell^(1 \/ 2) \) = - o_N \( 1 \) . $ <pde:mass-error>]

 The metric $g_b = e^(2 epsilon) hat(g)$, written in its dilated asymptotic coordinates, consequently has 
#[#set math.equation(numbering: n => "(5.21)")
 $ cal(E)_(upright("ADM")) \( g_b \) lt.eq e^(\( n - 2 \) epsilon) \( E_(*) + o_N \( 1 \) \) . $ <pde:base-mass>]

 It has all-order metric decay $O_j \( r^(2 - n) \)$, a finite ADM energy, and scalar curvature $O \( r^(- n - beta) \)$.]
] <pde:mass-cost>

#proof[
  All terms in $u Xi$ are integrable. On the end this follows from the exponential decay of $f$, $cal(T) = O \( r^(2 - 2 n) \)$, and the integrable radius weight $rho_0 = r^(- n - beta)$; on the filled compact part it is ordinary smooth integrability. The divergence theorem on the manifold without an inner boundary proves the flux limit in (5.19). At infinity $V = k nabla t + o \( r^(1 - n) \)$ in the flux sense, since $u = 1 + O_N \( r^(2 - n) \)$ and all graph terms decay exponentially. The metric perturbation $2 t delta_(i j)$ contributes $- 2 k thin partial_i t$ to the Euclidean ADM integrand. The normalization $1 \/ \( 2 k omega \)$ therefore gives the second identity in (5.19); all mixed error fluxes vanish.
  Only the penalty band can contribute negatively to the integral. There $m_0 eq.not 0$ implies $- epsilon < t < - epsilon + 1 \/ N$, and hence $ell lt.eq l lt.eq e ell$ for sufficiently large $N$. Writing $sigma = \| nabla f \|_g$, the definitions give
  #[#set math.equation(numbering: n => "(5.22)")
   $ u lt.eq C \( ell + ell^2 sigma \) \, #h(2em) u v lt.eq C ell^2 sigma \, #h(2em) u a_w sigma gt.eq c ell^2 sigma^2 . $ <pde:penalty-band>]
  For example the last expression equals $e^(\( k - 1 \) t) l^2 sigma^2$ exactly. The negative penalty is bounded by
  $ C cal(P)_N ell rho_0 + C cal(P)_N ell^2 sigma \( rho_0 + rho_1 \) . $
  Absorb its second term into the positive $delta_0 eta u a_w sigma$, using (5.22). The remaining negative part is bounded by
  $ C cal(P)_N ell rho_0 + C cal(P)_N ell^2 / eta \( rho_0 + rho_1 \)^2 . $
  The integrals of $rho_0 \, rho_0^2 \, rho_1^2$ grow at most polynomially in $N$: the core volume is $O \( 1 + N \)$, and on the end $4 b_1 > n$. This proves (5.20). Notice that no fixed-$N$ Schauder constant enters this estimate.
  A constant metric dilation by $e^(2 epsilon)$, followed by the corresponding coordinate dilation, multiplies ADM energy by $e^(\( n - 2 \) epsilon)$, proving (5.21). All-order metric decay follows from Proposition 31 and the prepared end. The conformal scalar law, the prepared scalar tail, and $Delta_g t = O \( r^(- n - beta) \)$ give the stated scalar decay. ◻
]

#thm([Proposition 5.7.])[
  (Separation of the original boundary by height).  #emph[There are $b_2 > 0$ and $N_2$, depending on the fixed prepared data and $epsilon$, such that the solutions of Proposition 31 satisfy, for $N gt.eq N_2$, 
$ h < - b_2 quad upright("on every plus component of ") S \, #h(2em) h > b_2 quad upright("on every minus component of ") S . $

 The constants are independent of $N$. For every fixed $b > 0$, the portion of the original exterior on which $\| h \| gt.eq b$ is contained in a fixed compact set, independent of $N$.]
] <pde:height-separation>

#proof[
  The last assertion follows immediately from the uniform height tail in Lemma 23. We prove the first assertion by a trace supersolution on each long product and its prescribed collars. Only the trace equation is used in this comparison, so no sign condition in the distant cap is needed.
  Treat a plus component. Choose a small fixed $delta > 0$ below the strict negative leaf-expansion margin on the prescribed collars. On the middle of its long product use height $- delta$. There $K = - L_0 g$, with $L_0$ the fixed large number used when constructing the filling. Towards the original boundary let the slope increase from zero to a small positive fixed value $a$. It can be chosen as a smoothly truncated exponential: start with size of order $eta$, increase exponentially, and stop smoothly at $a$, with
  $ \| \( upright("slope") \)' \| lt.eq C \( upright("slope") + eta \) . $
  Its length is $O \( 1 + \| log eta \| \) = O \( 1 + N \)$, and its total height increase is as small as desired by choosing $a$ small. The initial smoothing from slope zero has the same displayed bound.
  For a height test $H$, the Hessian multiplier in the trace equation is
  $ 1 / sqrt(\( eta \/ l \)^2 + \| d H \|^2) . $
  Thus the axial Hessian contribution along this ramp is uniformly bounded, since $l lt.eq e$ and
  $ frac(upright("slope") + eta, sqrt(\( eta \/ l \)^2 + upright("slope")^2)) lt.eq C . $
  The transverse contribution of the product metric is zero. The trace of $- L_0 g$ is at most $- k L_0$. Taking $L_0$ large compared with the fixed ramp bound makes the ramp a strict supersolution while its height is at least $- delta$. This choice is part of the fixed filling geometry, before $N$.
  Continue at small positive slope through the fixed transitions to $S$, keeping the height there below $- delta \/ 2$. Then, on a fixed strict trapped collar on the original side, increase the slope smoothly until the height exceeds the uniform coarse height bound. All these slopes are bounded below by $a > 0$; the slopes and their derivatives on this fixed portion are fixed finite numbers. At a contact with the solution, $eta \/ l lt.eq ell^(1 \/ 2)$, and the axial eigenvalue satisfies
  $ chi lt.eq d = frac(\( eta \/ l \)^2, \( eta \/ l \)^2 + \| d H \|^2) . $
  Consequently the trace operator on the test converges uniformly, on that fixed portion, to the expansion of its coordinate leaf, $H_(upright("leaf")) + "tr"_(upright("leaf")) K$. It is strictly negative by construction. The error from the axial second derivative tends to zero as $N arrow.r oo$. With the original choice of $delta$, this trace is below the test height, including while the height increases to dominate the coarse bound.
  On the side of the long product facing the cap, mirror the ramp and continue farther into product geometry at fixed slope, with height increasing until it also dominates the coarse bound. This adds only a fixed amount of length after the $O \( N \)$ ramp. It closes the comparison region without assuming anything about the values of $h$ in the cap, even when opposite-sign products join there.
  The test therefore dominates $h$ on both ends of the comparison region and is a strict supersolution within it. At a positive interior maximum of $h - H$, the two gradients agree. The implicit $t$, $l$, and $A_chi$ consequently agree when evaluating the test with the actual $Z$, while the Hessian of $h - H$ is nonpositive. The trace equation would give $h lt.eq F \( H \) < H$, a contradiction. Thus $h lt.eq H < - delta \/ 2$ on $S$. For a minus component apply the same argument to $- h \, - K$: $D \, t \, l \, chi$ are unchanged under the reversal, and the trace equation reverses sign. Taking the minimum over finitely many components gives $b_2$. These barriers concern the final system; the homotopy stages need not satisfy this comparison. ◻
]

#thm([Proposition 5.8.])[
  (The charged low-height region).  #emph[Choose $b_3 > 0$ sufficiently small relative to $b_2$ and the strict prepared matter margin. For every sufficiently large $N$, put 
$ macron(g) = g + l^2 d f^2 \, #h(2em) g_b = e^(2 \( t + epsilon \)) macron(g) . $

 On the original exterior $g_b gt.eq g$ as quadratic forms, and 
$ \| d h \|_(macron(g)) lt.eq eta \/ l lt.eq ell^(1 \/ 2) . $

 If $alpha = iota_E d V_g$ is the retained electric flux form, then on the original region ${ \| h \| lt.eq b_3 }$, 
#[#set math.equation(numbering: n => "(5.23)")
 $ R_(g_b) / 2 gt.eq c_n^2 \| alpha \|_(g_b)^2 . $ <pde:charged-curvature>]

 There is $c_(*) > 0$, independent of $N$, such that on the original band $b_3 \/ 4 lt.eq \| h \| lt.eq b_3$, 
#[#set math.equation(numbering: n => "(5.24)")
 $ e^(2 \( t + epsilon \)) R_(g_b) / 2 gt.eq I_g \( w \) + c_(*) + \( 1 - delta_0 \) cal(T) . $ <pde:retained-band>]

 The band lies in a fixed compact portion of the original exterior. Here $I_g \( w \)$ is the electromagnetic expression defined with the prepared data; it also permits the compactly supported magnetic form used in the strict numerical extension.]
] <pde:charged-region>

#proof[
  The strict margin and the choice of $rho$ in (4.17) give $mu_m - \| J_m \| - rho > 0$. Since $tau$ is compactly supported, we may choose $b_3 < b_2$, independent of $N$, so that
  $ mu_m - \| J_m \| - rho - b_3 \| tau \| gt.eq 1 / 2 \( mu_m - \| J_m \| - rho \) > 0 $
  everywhere on the original exterior. The scalar identity (4.5), the two equations, and $w \( F \) = eta a_w \| nabla f \|$ give
  $ e^(2 t) R_(hat(g)) / 2 =  & mu + J \( w \) - rho - h tau + \( 1 - delta_0 \) cal(T)\
 & + \( 1 - delta_0 \) eta a_w \| nabla f \| + m_0 C_N \( rho_0 + v rho_1 \) . $
  The DEC in the retained electromagnetic variables implies $mu + J \( w \) gt.eq I_g \( w \) + mu_m - \| J_m \|$. All displayed terms on the second line are nonnegative. This proves a positive matter remainder and the retained $\( 1 - delta_0 \) cal(T)$ throughout the low region. On the stated band its lower bound is uniform: by Proposition 33 the band is contained in a fixed compact set. This proves (5.24), since $R_(g_b) = e^(- 2 epsilon) R_(hat(g))$.
  The inverse of $macron(g)$ is $A_d$. Hence
  $ \| d h \|_(macron(g))^2 = eta^2 d \| nabla f \|_g^2 = \( eta \/ l \)^2 v lt.eq \( eta \/ l \)^2 . $
  For the $\( n - 1 \)$-form $alpha = iota_E d V_g$, the volume factor $sqrt(D)$ gives the exact norm identity
  #[#set math.equation(numbering: n => "(5.25)")
   $ \| alpha \|_(macron(g))^2 = d \| E \|_g^2 + chevron.l w \, E chevron.r_g^2 = \| E \|_g^2 - \| w and E \|_g^2 . $ <pde:flux-form-norm>]
  The electromagnetic square completion gives $I_g \( w \) gt.eq c_n^2 \| alpha \|_(macron(g))^2$. Set $z = t + epsilon > 0$. Scalar curvature scales by $e^(- 2 z)$ in the preceding inequality, whereas the squared norm of an $\( n - 1 \)$-form scales by $e^(- 2 k z)$. Since $k gt.eq 1$,
  $ R_(g_b) / 2 gt.eq c_n^2 e^(- 2 z) \| alpha \|_(macron(g))^2 gt.eq c_n^2 e^(- 2 k z) \| alpha \|_(macron(g))^2 = c_n^2 \| alpha \|_(g_b)^2 . $
  Finally $e^(2 z) gt.eq 1$ and $macron(g) gt.eq g$, proving metric dominance. ◻
]

== 6 Conversion of electric flux into an energy decrease <sec:flux-conversion>

This section completes the numerical argument. The filled scalar construction provides a metric which dominates the original metric and has the required charged scalar-curvature inequality on a region separated from the original boundary. A second scalar equation converts the signed total electric flux into a controlled decrease of ADM energy. A lower bound for its conformal factor retains a definite fraction of every full-cut area. We then construct a smooth future-trapped boundary and apply only the neutral numerical input, Theorem 4.

=== 6.1 Data supplied by the filled construction <flux:setup>

Throughout this section, $n gt.eq 4$, $k = n - 1$, $omega = "Area" \( S^k \)$, and $c_n^2 = k \( k - 1 \) \/ 2$. Initially the exterior data have been prepared as in Proposition 17 and Lemma 15. We write $g$ for their metric, $cal(E)_(*)$ for their ADM energy, and

#[#set math.equation(numbering: n => "(6.1)")
 $ a_(*) = inf_Gamma "Area"_g \( Gamma \) \, #h(2em) X_(*) = \( a_(*) \/ omega \)^(\( k - 1 \) \/ k) . $ <flux:prepared-area>]

The infimum is over the entire full cuts of this prepared exterior. In particular, $a_(*) > 0$ by Lemma 10. The prepared tensor $K$ has compact support, the metric has differentiated decay of order $2 - n$ to every fixed order, and the charged dominant-energy and prescribed componentwise trapping inequalities are strict. The optional compact magnetic form is allowed in this paragraph; it will be specified again in Corollary 41.

Fix $epsilon > 0$. For every sufficiently large approximation integer $N$, let $cal(M)_N$ be the filled one-ended manifold of Proposition 31. We also denote its background metric by $g$. It agrees with the prepared metric on the original exterior. Put

#[#set math.equation(numbering: n => "(6.2)")
 $ ell = e^(- N epsilon) \, #h(2em) eta = ell^(3 \/ 2) \, #h(2em) h = eta f \, #h(2em) z = t + epsilon \, #h(2em) macron(g) = g + l^2 thin upright(d) f^2 \, #h(2em) g_b = e^(2 z) macron(g) . $ <flux:background-metrics>]

The scalar-construction variables satisfy

#[#set math.equation(numbering: n => "(6.3)")
 $ z gt.eq 0 \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| upright(d) h \|_(macron(g)) lt.eq eta \/ l lt.eq ell^(1 \/ 2) . $ <flux:height-gradient>]

For fixed prepared data and $epsilon$, the bounds for $t$, $Z$, and $nabla f$ imply that the metric coefficients and inverse coefficients needed below have bounds of the form $exp \( cal(P)_N \)$, where $cal(P)_N$ denotes a polynomial in $1 + N$ whose coefficients may change from occurrence to occurrence. No uniform bound as $N arrow.r oo$ is claimed for the second scalar solution.

We use the following further conclusions of Propositions 32, 33, and 34. There are constants $b_2 > b_3 > 0$, independent of $N$, such that

#[#set math.equation(numbering: n => "(6.4)")
 $ \| h \| > b_2 quad upright("on ") S \, #h(2em) h arrow.r 0 quad upright("at infinity") \, $ <flux:height-separation>]

and the set ${ \| h \| gt.eq b_3 \/ 4 }$ on the original exterior is contained in a fixed compact set. We take $b_3 < b_2 \/ 2$. On

#[#set math.equation(numbering: n => "(6.5)")
 $ cal(U)_N = { x upright(" in the original exterior") : \| h \( x \) \| lt.eq b_3 } \, $ <flux:low-region>]

the retained curvature estimate is the charged one, with an additional positive margin on $b_3 \/ 4 lt.eq \| h \| lt.eq b_3$. More precisely, the scalar identity supplies there a constant $c_(*) > 0$, independent of $N$, and the nonnegative term $\( 1 - delta_0 \) cal(T)$, with $delta_0 < 1 \/ 2$. The energy estimate, in coordinates normalized for $g_b$ at infinity, is

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(E) \( g_b \) lt.eq e^(\( k - 1 \) epsilon) \( cal(E)_(*) + o_N \( 1 \) \) \, #h(2em) o_N \( 1 \) arrow.r 0 quad \( N arrow.r oo \) . $ <flux:background-energy>]

The fixed-$N$ metric $g_b$ has all-order differentiated asymptotic decay of order $2 - n$ after the constant coordinate dilation, and $R_(g_b) = O \( r^(- n - beta) \)$ for a $beta > 0$.

Let $alpha = i_E "vol"_g$ on the original exterior. Multiply it by $"sgn" Q$ when $Q eq.not 0$, and use either sign when $Q = 0$. Extend this signed form smoothly into the filling, cutting it off on fixed collars on the inside of $S$; call the extension $tilde(alpha)$. It is closed on the original exterior and need not be closed in the filling. Define

#[#set math.equation(numbering: n => "(6.7)")
 $ i_(E_b) "vol"_(g_b) = tilde(alpha) \, #h(2em) i_(E_(upright("ext"))) "vol"_g = tilde(alpha) . $ <flux:extended-fields>]

Thus the flux of $E_b$ across a large sphere is $omega \| Q \|$. Its divergence vanishes on the original exterior. The vector $E_(upright("ext"))$ is uniformly bounded on the filling and is $O \( r^(- k) \)$ on the end. Its support in the filling can be kept in the fixed collars; even an extension over the whole core would have only polynomially growing $L^p$ norms, because that core has volume $O \( 1 + N \)$.

Matrix formulas below use a $g$-orthonormal frame, or equivalently the $g$-identification of vectors and covectors. For clarity, the form norm underlying the charged estimate is

#[#set math.equation(numbering: n => "(6.8)")
 $ \| alpha \|_(macron(g))^2 = \( 1 - \| w \|_g^2 \) \| E \|_g^2 + g \( E \, w \)^2 = \| E \|_g^2 - \| w and E \|_g^2 . $ <flux:graph-form-norm>]

Indeed $macron(g)^(- 1) = A_d = g^(- 1) - w ⊗ w$ and $"vol"_(macron(g)) = sqrt(D) thin "vol"_g$. Completing the square in the magnetic two-form, when it is present, gives $I_g \( w \) gt.eq c_n^2 \| alpha \|_(macron(g))^2$. Since $z gt.eq 0$,

#[#set math.equation(numbering: n => "(6.9)")
 $ e^(2 z) \| E_b \|_(g_b)^2 = e^(- 2 \( k - 1 \) z) \| alpha \|_(macron(g))^2 lt.eq \| alpha \|_(macron(g))^2 . $ <flux:conformal-field-cost>]

Consequently the scalar-construction estimates imply $R_(g_b) \/ 2 gt.eq c_n^2 \| E_b \|_(g_b)^2$ throughout $cal(U)_N$.

#thm([Lemma 6.1.])[
  (A retained gradient term).  #emph[The quadratic expression $cal(T)$ in the filled scalar construction satisfies 
#[#set math.equation(numbering: n => "(6.10)")
 $ cal(T) gt.eq frac(k^2 - 1, 4) \| upright(d) t \|_(macron(g))^2 . $ <flux:T-gradient>]

 In particular, on the original band $b_3 \/ 4 lt.eq \| h \| lt.eq b_3$, 
#[#set math.equation(numbering: n => "(6.11)")
 $ e^(2 z) R_(g_b) \/ 2 gt.eq c_n^2 e^(2 z) \| E_b \|_(g_b)^2 + c_(*) + frac(k^2 - 1, 8) \| upright(d) t \|_(macron(g))^2 . $ <flux:background-band-curvature>]

]
] <flux:retained-gradient>

#proof[
  The inverse graph metric is $A_d$. Hence (6.10) is exactly (4.14) in the Coercivity Lemma (Lemma 22). Combining that estimate with $1 - delta_0 gt.eq 1 \/ 2$ in (5.24), the electromagnetic square completion above, and (6.9) gives (6.11). ◻
]

=== 6.2 Smooth profiles with the sharp limiting coefficient <smooth-profiles-with-the-sharp-limiting-coefficient>

#thm([Lemma 6.2.])[
  (Flux profiles).  #emph[Fix $0 < s < 1$ and set 
#[#set math.equation(numbering: n => "(6.12)")
 $ y_0 = frac(log \( 1 - s^2 \), k - 1) < 0 . $ <flux:floor>]

 For every $delta > 0$ there exist smooth functions $L > 0$ and $H_0$ on $bb(R)$ with 
#[#set math.equation(numbering: n => "(6.13)")
 $ L \( 0 \) = 1 \, #h(2em) L' gt.eq 0 \, #h(2em) H_0 = 0 upright(" on ") \( - oo \, y_0 \] \, #h(2em) "supp" H'_0 subset.double \( y_0 \, 0 \) \, #h(2em) H'_0 gt.eq 0 \,\
\| H'_0 \( y \) \| lt.eq k sqrt(\( k - 1 \) #scale(x: 120%, y: 120%)[\(] k - 1 + 2 L' \( y \) \/ L \( y \) #scale(x: 120%, y: 120%)[\)]) e^(\( k - 1 \) y) L \( y \) \,\
k s - delta < H_0 \( 0 \) lt.eq k s . $ <flux:profile-properties>]

 In particular $H_0$ is bounded. The function defined by 
#[#set math.equation(numbering: n => "(6.14)")
 $ B_0 \( 0 \) = 0 \, #h(2em) B'_0 \( y \) = e^(\( k - 1 \) y) L \( y \) $ <flux:B-definition>]

 is strictly increasing, and its range on $\[ y_0 \, oo \)$ is $\[ B_0 \( y_0 \) \, oo \)$.]
] <flux:profiles>

#proof[
  Let $a_0 = k - 1$ and $c = 1 - s^2$. On $\( y_0 \, oo \)$ consider
  #[#set math.equation(numbering: n => "(6.15)")
   $ L_(upright("opt")) \( y \)^2 = frac(1 - c e^(- a_0 y), s^2) . $ <flux:optimal-profile>]
  This is positive and increasing, and $L_(upright("opt")) \( 0 \) = 1$. Direct differentiation gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ k sqrt(a_0 \( a_0 + 2 L'_(upright("opt")) \/ L_(upright("opt")) \)) e^(a_0 y) L_(upright("opt")) = frac(k a_0, s) e^(a_0 y) . $ <flux:optimal-derivative>]
  Its integral from $y_0$ to zero is $k s$.
  Here is a positive smooth replacement at the lower endpoint. Take a small $sigma > 0$ and a smooth nondecreasing cutoff $chi_sigma$ which is zero below $y_0 + sigma \/ 3$ and one above $y_0 + 2 sigma \/ 3$. For $y lt.eq b_sigma := y_0 + sigma$ define
  #[#set math.equation(numbering: n => "(6.17)")
   $ L \( y \) = L_(upright("opt")) \( b_sigma \) - integral_y^(b_sigma) chi_sigma \( v \) L'_(upright("opt")) \( v \) thin upright(d) v \, $ <flux:profile-smoothing>]
  where the integrand is zero below $y_0 + sigma \/ 3$. For $y gt.eq b_sigma$ use $L = L_(upright("opt"))$. The definitions agree with all derivatives near $b_sigma$. The lower constant value is positive, since it is at least $L_(upright("opt")) \( y_0 + sigma \/ 3 \)$. Thus $L$ is smooth, positive and nondecreasing on the whole line, and still has $L \( 0 \) = 1$.
  Choose $0 lt.eq zeta_sigma lt.eq 1$ smooth with compact support in $\( y_0 + sigma \, - sigma \)$, tending pointwise to one on $\( y_0 \, 0 \)$ as $sigma arrow.b 0$, and put
  #[#set math.equation(numbering: n => "(6.18)")
   $ H'_0 \( y \) = zeta_sigma \( y \) frac(k a_0, s) e^(a_0 y) \, #h(2em) H_0 \( y \) = integral_(- oo)^y H'_0 \( v \) thin upright(d) v . $ <flux:H-construction>]
  On the support of $H'_0$ the function $L$ is exactly $L_(upright("opt"))$, so (6.13) follows from (6.16). Elsewhere its left side is zero. Dominated convergence gives $H_0 \( 0 \) arrow.r k s$ from below, proving (6.13) after decreasing $sigma$. Finally, $B'_0 > 0$ and, for $y gt.eq 0$, $L \( y \) gt.eq 1$, so
  #[#set math.equation(numbering: n => "(6.19)")
   $ B_0 \( y \) gt.eq frac(e^(\( k - 1 \) y) - 1, k - 1) . $ <flux:B-growth>]
  This proves the range assertion. ◻
]

=== 6.3 The bounded-flux equation on the filled manifold <the-bounded-flux-equation-on-the-filled-manifold>

#thm([Proposition 6.3.])[
  (Filled flux conversion).  #emph[Fix the prepared data, $epsilon$, $s$, and one smooth profile from Lemma 36. For each sufficiently large fixed $N$ there is a smooth function $y$ on $cal(M)_N$ such that 
#[#set math.equation(numbering: n => "(6.20)")
 $ k Delta_(g_b) B_0 \( y \) = "div"_(g_b) \( H_0 \( y \) E_b \) \, #h(2em) y arrow.r 0 quad upright("at infinity") . $ <flux:conversion-equation>]

 It satisfies 
#[#set math.equation(numbering: n => "(6.21)")
 $ y gt.eq y_0 \, #h(2em) y lt.eq cal(P)_N \, #h(2em) y = O_j \( r^(2 - n) \) quad upright("for every fixed ") j \, $ <flux:y-bounds>]

 where constants in the last estimates may depend on $N$ and on the fixed profile. Moreover $B_0 \( y \)$ is harmonic sufficiently far out, and 
#[#set math.equation(numbering: n => "(6.22)")
 $ lim_(R arrow.r oo) integral_(S_R) partial_(nu_b) y thin upright(d) A_(g_b) = frac(H_0 \( 0 \), k) thin omega \| Q \| . $ <flux:y-flux>]

]
] <flux:conversion-solve>

#proof[
  We give the estimates on expanding smooth coordinate-sphere truncations of $cal(M)_N$, with zero outer Dirichlet value. There is no inner boundary.
  ===== 6.3.1 A background Sobolev inequality. <a-background-sobolev-inequality.>
  The background filled metric has uniformly controlled local geometry. Its core is covered by at most $C \( 1 + N \)$ coordinate patches of fixed size and bounded overlap; the product necks account for the number of patches. The overlap graph is connected to a fixed annulus in the unchanged asymptotic end by chains of length at most $C \( 1 + N \)$. For a compactly supported smooth function $v$, radial integration from infinity and Cauchy–Schwarz give, on this fixed annulus $A$,
  #[#set math.equation(numbering: n => "(6.23)")
   $ parallel v parallel_(L^2 \( A \, g \))^2 lt.eq C integral_(upright("end")) \| upright(d) v \|_g^2 thin "vol"_g . $ <flux:anchor-annulus>]
  For example, the radial weight in this estimate is finite because $integral_R^oo r^(1 - n) thin upright(d) r < oo$. Local Poincaré inequalities control the oscillation about each patch mean. On overlapping patches the difference of the two means is controlled by the gradient energy on their union. Summing along the chains to $A$, then summing over the patches, therefore gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ parallel v parallel_(L^2 \( upright("core") \, g \))^2 lt.eq C \( 1 + N \)^C integral_(cal(M)_N) \| upright(d) v \|_g^2 thin "vol"_g . $ <flux:core-poincare>]
  Combine this with the local Sobolev inequalities on the patches and the ordinary Euclidean Sobolev inequality on the end, using a cutoff across $A$. With $p_(*) = 2 n \/ \( n - 2 \)$, this proves
  #[#set math.equation(numbering: n => "(6.25)")
   $ parallel v parallel_(L^(p_(*)) \( g \))^2 lt.eq S_N integral_(cal(M)_N) \| upright(d) v \|_g^2 thin "vol"_g \, #h(2em) S_N lt.eq exp \( cal(P)_N \) . $ <flux:background-Sobolev>]
  The polynomial bound implicit above would suffice. The weaker displayed bound is convenient for combining constants. Functions with zero trace on a truncation can be extended by zero, so the same constant works for all outer radii. The local Sobolev and Poincaré inequalities used here are the usual uniformly elliptic coordinate versions; see #cite(label("GilbargTrudinger2001")) Chapters 7–8.
  ===== 6.3.2 The exact divergence matrix. <the-exact-divergence-matrix.>
  Set $Y = B_0 \( y \)$ and $Y_0 = B_0 \( y_0 \) < 0$. Define
  #[#set math.equation(numbering: n => "(6.26)")
   $ frak(h) \( Y \) = H_0 \( B_0^(- 1) \( Y \) \) quad \( Y gt.eq Y_0 \) \, #h(2em) frak(h) \( Y \) = 0 quad \( Y < Y_0 \) . $ <flux:bounded-coefficient>]
  This is smooth and bounded on the whole real line. It is identically zero near and below $Y_0$, and constant for all sufficiently large $Y$; all its nonzero derivatives have compact support. The ratio of volume forms and the inverse metric are
  #[#set math.equation(numbering: n => "(6.27)")
   $ J_b = "vol"_(g_b) / "vol"_g = e^(n z) sqrt(D) \, #h(2em) g_b^(- 1) = e^(- 2 z) A_d . $ <flux:volume-and-inverse>]
  Consequently the equation in the fixed background measure is exactly
  #[#set math.equation(numbering: n => "(6.28)")
   $ k "div"_g \( A nabla_g Y \) = "div"_g \( frak(h) \( Y \) E_(upright("ext")) \) \, #h(2em) A = e^(\( n - 2 \) z) sqrt(D) thin A_d . $ <flux:background-equation>]
  Here $J_b E_b = E_(upright("ext"))$ follows directly from (6.7). In particular no graph-volume factor remains in the right-hand flux.
  The transverse eigenvalues of $A$ are $e^(\( n - 2 \) z) sqrt(D)$ and its axial eigenvalue is $e^(\( n - 2 \) z) \/ sqrt(D)$. The filled-solve estimates therefore give
  #[#set math.equation(numbering: n => "(6.29)")
   $ lambda_N thin "id" lt.eq A lt.eq Lambda_N thin "id" \, #h(2em) lambda_N^(- 1) + Lambda_N lt.eq exp \( cal(P)_N \) . $ <flux:ellipticity>]
  If $F_Y = frak(h) \( Y \) E_(upright("ext"))$, its $L^2 \( g \)$ and $L^(2 n) \( g \)$ norms have polynomial bounds in $1 + N$, uniformly in $Y$ and in the truncation radius. Indeed $frak(h)$ is bounded, the core extension was just described, and the end integral of $r^(- p k)$ is finite for $p = 2 \, 2 n$.
  ===== 6.3.3 Energy and the level estimate. <energy-and-the-level-estimate.>
  The same estimates apply to the homotopy which multiplies the right-hand side of (6.28) by a number in $\[ 0 \, 1 \]$. Testing by $Y$ gives
  #[#set math.equation(numbering: n => "(6.30)")
   $ k lambda_N parallel upright(d) Y parallel_2^2 lt.eq parallel F_Y parallel_2 parallel upright(d) Y parallel_2 \, #h(2em) parallel Y parallel_(p_(*)) lt.eq exp \( cal(P)_N \) . $ <flux:energy-bound>]
  For $s_1 > 0$, put $u_(s_1) = \( Y - s_1 \)_(+)$ and $A_(s_1) = { Y > s_1 }$. Testing by $u_(s_1)$, applying Hölder with exponent $2 n$, and then using (6.25), yields
  #[#set math.equation(numbering: n => "(6.31)")
   $ parallel u_(s_1) parallel_(p_(*)) lt.eq C_N \| A_(s_1) \|^(1 \/ 2 - 1 \/ \( 2 n \)) \, #h(2em) C_N lt.eq exp \( cal(P)_N \) . $ <flux:level-norm>]
  Thus, for $t_1 > s_1$,
  #[#set math.equation(numbering: n => "(6.32)")
   $ \| A_(t_1) \| lt.eq (frac(C_N, t_1 - s_1))^(p_(*)) \| A_(s_1) \|^theta.alt \, #h(2em) theta.alt = frac(n - 1, n - 2) > 1 . $ <flux:level-recursion>]
  This also holds for the negative levels of $Y$.
  For completeness, start at level one, whose superlevel measure is at most $exp \( cal(P)_N \)$ by (6.30), and set $s_j = 1 + d_(*) \( 1 - 2^(- j) \)$. The recursion has the form $M_(j + 1) lt.eq C_N^(p_(*)) d_(*)^(- p_(*)) 2^(p_(*) \( j + 1 \)) M_j^theta.alt$. Choosing $d_(*)$ to be a fixed sufficiently large multiple of $C_N M_0^(\( theta.alt - 1 \) \/ p_(*))$ makes $M_j$ tend to zero geometrically after a further fixed exponential rescaling in $j$. All the constants and the starting measure are bounded by $exp \( cal(P)_N \)$, so this choice has the same bound. Therefore
  #[#set math.equation(numbering: n => "(6.33)")
   $ parallel Y parallel_oo lt.eq exp \( cal(P)_N \) $ <flux:Y-supremum>]
  uniformly in the radius and in the homotopy parameter.
  ===== 6.3.4 Existence on a truncation and exhaustion. <existence-on-a-truncation-and-exhaustion.>
  Fix $N$ and an outer radius. For a continuous trial function $Y$ of zero boundary value, freeze $frak(h) \( Y \) E_(upright("ext"))$ and solve the linear Dirichlet equation (6.28). On this fixed smooth domain its coefficients are smooth and uniformly elliptic. Linear divergence-form $W^(1 \, p)$ estimates with any fixed $p > n$ show that this solution operator is continuous and compact into continuous functions of zero boundary value. Fixed points of its homotopy with the zero map satisfy (6.33). Leray–Schauder degree on a larger ball therefore gives a fixed point, since the degree at the zero map is one; see #cite(label("LeraySchauder1934")) Sections 12–17.
  For such a solution the bounded divergence data first give local Hölder estimates. Then $frak(h) \( Y \) E_(upright("ext"))$ is Hölder continuous, divergence Schauder estimates give $C^(1 \, alpha)$ regularity, and successive differentiation gives smoothness. These estimates, with the supremum bound, are uniform on each fixed compact subset as the outer radius tends to infinity. The standard interior and Dirichlet estimates used at this step apply to smooth uniformly elliptic scalar operators on fixed charts; see #cite(label("GilbargTrudinger2001")) Chapters 6 and 8. A diagonal subsequence thus gives a smooth solution on $cal(M)_N$, preserving the energy and supremum bounds.
  ===== 6.3.5 The floor and inversion. <the-floor-and-inversion.>
  On a truncation, test (6.28) by $\( Y_0 - Y \)_(+)$. Its support is a region on which $frak(h) \( Y \) = 0$. Ellipticity gives zero gradient for this test function, and its outer boundary trace is zero because $Y_0 < 0$. Hence $Y gt.eq Y_0$. This passes to the limit. Lemma 36 now defines $y = B_0^(- 1) \( Y \)$ everywhere. The inverse is smooth at $Y_0$ as well, since $B'_0 \( y_0 \) > 0$. Inequality (6.19) and (6.33) give $y lt.eq cal(P)_N$, while the floor is $y gt.eq y_0$.
  ===== 6.3.6 The end and the total flux. <the-end-and-the-total-flux.>
  On the end $"div"_(g_b) E_b = 0$, so the equation for $Y$ is
  #[#set math.equation(numbering: n => "(6.34)")
   $ k Delta_(g_b) Y = frak(h)' \( Y \) E_b \( Y \) . $ <flux:exterior-drift>]
  The drift coefficient is $O \( r^(- k) \)$, with fixed-$N$ bounds. Choose $0 < beta' < min \( 1 \, n - 2 \)$. After increasing the fixed inner radius, positive multiples of $r^(2 - n) \( 1 - r^(- beta') \)$ are supersolutions of the absolute drift comparison problem: their leading negative Laplacian term has order $r^(- n - beta')$, and dominates the metric-error and first-order terms. Comparison with both signs, using the uniform bound on the fixed inner sphere and zero data at the truncation sphere, gives $Y = O \( r^(2 - n) \)$ uniformly during exhaustion. Scaled elliptic estimates for (6.34) then give the first two differentiated orders, and the same is true for $y$.
  Since $"supp" H'_0 subset.double \( y_0 \, 0 \)$ and $y arrow.r 0$, one has $H_0 \( y \) = H_0 \( 0 \)$ identically sufficiently far out. There $Y$ is harmonic for $g_b$. The all-order metric estimates for $g_b$ and scaled harmonic estimates yield $Y \, y = O_j \( r^(2 - n) \)$ for every fixed $j$. Integrating (6.20) on the whole filled truncation now gives, for every sufficiently large radius,
  #[#set math.equation(numbering: n => "(6.35)")
   $ k integral_(S_R) partial_(nu_b) Y thin upright(d) A_(g_b) = H_0 \( 0 \) integral_(S_R) g_b \( E_b \, nu_b \) thin upright(d) A_(g_b) = H_0 \( 0 \) omega \| Q \| . $ <flux:Y-flux>]
  There is no omitted inner flux. Because $B'_0 \( 0 \) = 1$ and $B'_0 \( y \) - 1 = O \( y \)$, replacing $upright(d) Y$ by $upright(d) y$ in this integral has an error $O \( R^(2 - n) \)$. This proves (6.22). ◻
]

=== 6.4 Curvature, mass, and a smooth trapped boundary <curvature-mass-and-a-smooth-trapped-boundary>

#thm([Lemma 6.4.])[
  (The uncharged metric).  #emph[Let $y$ be supplied by Proposition 37 and set 
#[#set math.equation(numbering: n => "(6.36)")
 $ gamma = e^(2 y) g_b = e^(2 \( z + y \)) macron(g) . $ <flux:gamma>]

 Then $R_gamma gt.eq 0$ on $cal(U)_N$ and 
#[#set math.equation(numbering: n => "(6.37)")
 $ gamma gt.eq e^(2 y_0) g . $ <flux:metric-dominance>]

 Its ADM energy is 
#[#set math.equation(numbering: n => "(6.38)")
 $ cal(E) \( gamma \) = cal(E) \( g_b \) - frac(H_0 \( 0 \), k) \| Q \| . $ <flux:mass-decrease>]

 On the band $b_3 \/ 4 lt.eq \| h \| lt.eq b_3$ in the original exterior, 
#[#set math.equation(numbering: n => "(6.39)")
 $ e^(2 \( z + y \)) R_gamma \/ 2 gt.eq c_(*) + frac(k^2 - 1, 8) \| upright(d) t \|_(macron(g))^2 + upright(bold(1))_({ y gt.eq 0 }) frac(k \( k - 1 \), 2) \| upright(d) y \|_(macron(g))^2 . $ <flux:gamma-band-curvature>]

]
] <flux:uncharged-metric>

#proof[
  Where the extended flux form is closed, expand the equation as
  #[#set math.equation(numbering: n => "(6.40)")
   $ k Delta_(g_b) y = H'_0 / B'_0 E_b \( y \) - k (k - 1 + L' / L) \| upright(d) y \|_(g_b)^2 . $ <flux:expanded-y-equation>]
  The conformal scalar formula gives
  #[#set math.equation(numbering: n => "(6.41)")
   $ e^(2 y) R_gamma \/ 2 & = R_(g_b) \/ 2 - k Delta_(g_b) y - frac(k \( k - 1 \), 2) \| upright(d) y \|_(g_b)^2\
 & gt.eq c_n^2 \| E_b \|_(g_b)^2 - frac(H'_0, e^(\( k - 1 \) y) L) E_b \( y \) + k (frac(k - 1, 2) + L' / L) \| upright(d) y \|_(g_b)^2 . $ <flux:curvature-quadratic>]
  The last expression is nonnegative: the square of its mixed coefficient is at most
  #[#set math.equation(numbering: n => "(6.42)")
   $ 4 frac(k \( k - 1 \), 2) thin k (frac(k - 1, 2) + L' / L) = k^2 \( k - 1 \) (k - 1 + 2 L' / L) \, $ <flux:discriminant-check>]
  exactly by (6.13). Completing the square in $E_b$ proves the assertion on $cal(U)_N$. The positive terms beyond the electric term in (6.11) have not been used in this completion. If $y gt.eq 0$, then $H'_0 = 0$ and $L' gt.eq 0$, so the entire additional term $k \( k - 1 \) \| upright(d) y \|_(g_b)^2 \/ 2$ can also be retained. Multiplication by $e^(2 z)$ proves (6.39). The metric comparison follows from $z gt.eq 0$, $y gt.eq y_0$, and $macron(g) gt.eq g$.
  In coordinates normalized for $g_b$, the conformal ADM calculation is
  #[#set math.equation(numbering: n => "(6.43)")
   $ cal(E) \( e^(2 y) g_b \) - cal(E) \( g_b \) = - 1 / omega lim_(R arrow.r oo) integral_(S_R) partial_(nu_b) y thin upright(d) A_(g_b) . $ <flux:conformal-energy-formula>]
  To check the normalization, the leading perturbation is $2 y delta_(i j)$; its Euclidean ADM integrand is $- 2 k partial_i y$. The normalizing factor is $1 \/ \( 2 k omega \)$. The difference between geometric and Euclidean surface fluxes, and every quadratic error, is $O \( R^(2 - n) \)$. Equation (6.22) now proves (6.38). The end scalar curvature remains integrable: outside a compact set $Y$ is harmonic, so (6.40) has no mixed term and $Delta_(g_b) y = O \( r^(2 - 2 n) \)$, while $R_(g_b) = O \( r^(- n - beta) \)$. ◻
]

#thm([Lemma 6.5.])[
  (A freely chosen late plateau).  #emph[For all sufficiently large $N$ one can choose a smooth nonnegative function $cal(H)$ of $\| h \|$, zero on $\[ 0 \, b_3 \/ 4 \]$ and equal to any prescribed finite nonnegative constant on $\[ b_3 \/ 2 \, b_3 \]$, so that the tensor 
#[#set math.equation(numbering: n => "(6.44)")
 $ K_(upright("new")) = - frak(a) thin gamma \, #h(2em) frak(a) = e^(- \( z + b \( y \) \)) cal(H) \( \| h \| \) $ <flux:new-tensor>]

 satisfies the neutral dominant energy condition on $cal(U)_N$. Here $b$ is a fixed smooth function with 
#[#set math.equation(numbering: n => "(6.45)")
 $ b = 0 upright(" on ") \( - oo \, 0 \] \, #h(2em) 0 lt.eq b' lt.eq 1 \, #h(2em) y - b \( y \) upright(" bounded on ") \[ y_0 \, oo \) . $ <flux:b-cutoff>]

 The lower bound on $N$ is independent of the prescribed plateau height.]
] <flux:trace-tensor>

#proof[
  Choose $b'$ smooth, zero up to zero and equal to one eventually, and integrate from zero. Then
  #[#set math.equation(numbering: n => "(6.46)")
   $ 0 < C_(-) lt.eq C \( y \) := e^(y - b \( y \)) lt.eq C_(+) < oo quad \( y gt.eq y_0 \) \, $ <flux:C-bounds>]
  with constants independent of $N$. For a pure-trace tensor $- frak(a) gamma$ the neutral densities are
  #[#set math.equation(numbering: n => "(6.47)")
   $ mu_(upright("new")) = R_gamma \/ 2 + frac(n k, 2) frak(a)^2 \, #h(2em) J_(upright("new")) = k thin upright(d) frak(a) . $ <flux:trace-constraints>]
  On the band, multiply the required inequality by $e^(2 \( z + y \))$. The new quadratic energy is $n k C^2 cal(H)^2 \/ 2$, while (6.3) bounds the momentum by
  #[#set math.equation(numbering: n => "(6.48)")
   $ k C (cal(H) \| upright(d) t + b' upright(d) y \|_(macron(g)) + \( eta \/ l \) \| cal(H)' \|) . $ <flux:trace-momentum-bound>]
  Set $A_t = \( k^2 - 1 \) \/ 8$ and $B_y = k \( k - 1 \) \/ 2$. Young’s inequality absorbs the first term of (6.48) into the two gradient terms in (6.39), at a cost at most $C^2 cal(H)^2 chi_k$, where
  #[#set math.equation(numbering: n => "(6.49)")
   $ chi_k = k^2 / 4 (1 / A_t + 1 / B_y) = frac(2 k^2, k^2 - 1) + frac(k, 2 \( k - 1 \)) lt.eq 3 quad \( k gt.eq 3 \) . $ <flux:dimension-slack>]
  There is no use of the $y$-gradient term where $y < 0$, because $b' = 0$ there. Where $y gt.eq 0$, that term was retained in full in the preceding lemma. Hence no curvature term is used twice. As $n k \/ 2 gt.eq 6$, the remaining coefficient
  #[#set math.equation(numbering: n => "(6.50)")
   $ d_k = frac(n k, 2) - chi_k gt.eq 3 $ <flux:positive-slack>]
  is positive in every dimension under consideration.
  It is now enough that
  #[#set math.equation(numbering: n => "(6.51)")
   $ \( eta \/ l \) \| cal(H)' \| lt.eq c' \( 1 + cal(H)^2 \) \, #h(2em) 0 < c' lt.eq min {frac(c_(*), k C_(+)) \, frac(d_k C_(-), k)} . $ <flux:transition-condition>]
  Indeed this makes the second term in (6.48) at most $c_(*) + d_k C^2 cal(H)^2$. Choose a smooth cutoff $chi_h$ which is zero on $\[ 0 \, b_3 \/ 4 \]$ and one on $\[ b_3 \/ 2 \, b_3 \]$. For the desired plateau $M < oo$, define
  #[#set math.equation(numbering: n => "(6.52)")
   $ cal(H) \( s_1 \) = tan #scale(x: 120%, y: 120%)[\(] \( arctan M \) chi_h \( s_1 \) #scale(x: 120%, y: 120%)[\)] . $ <flux:arctan-ramp>]
  Then
  #[#set math.equation(numbering: n => "(6.53)")
   $ frac(\| cal(H)' \|, 1 + cal(H)^2) lt.eq pi / 2 parallel chi'_h parallel_oo \, $ <flux:ramp-uniformity>]
  independently of $M$. Since $eta \/ l lt.eq ell^(1 \/ 2) arrow.r 0$, one sufficiently large $N$ ensures (6.51) for every finite plateau. Off the band the tensor vanishes on the required exterior and $R_gamma gt.eq 0$. Although $\| h \|$ need not be smooth at its zero set, its composition with $cal(H)$ is smooth because $cal(H)$ vanishes on a neighborhood of zero. This proves the lemma. ◻
]

Figure 1 records the height bands and the order of the remaining choices.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 6.4), [#box(width: 5.391cm, inset: 0.07056cm, stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Added region#linebreak()No energy condition imposed.#linebreak()$tilde( alpha )$ supported in fixed inner collars.]])], anchor: "north-west")
  content((6.25, 6.4), [#box(width: 9.191cm, inset: 0.07056cm, stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Original exterior#linebreak()$tilde( alpha )$ is closed. On $S$: $|h|>b_2>2b_3$.#linebreak()At the distinguished end: $h arrow.r.long 0$.]])], anchor: "north-west")
  content((0, 4.78), [#text(size: 9pt)[Both scalar solves take place on the filled manifold $cal(M)_N$.]], anchor: "west", padding: 0.07056cm)
  line((5, 3.88), (15.45, 3.88), stroke: (paint: rgb("#595959"), thickness: 0.5pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((15.5, 3.88), [#text(size: 9pt)[$|h|$]], anchor: "west", padding: 0.07056cm)
  line((5, 3.79), (5, 3.97), stroke: (paint: rgb("#595959"), thickness: 0.5pt, cap: "round", join: "round"))
  content((5, 4.02), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.07056cm)
  line((7.25, 3.79), (7.25, 3.97), stroke: (paint: rgb("#595959"), thickness: 0.5pt, cap: "round", join: "round"))
  content((7.25, 4.02), [#text(size: 9pt)[$b_3"/"4$]], anchor: "south", padding: 0.07056cm)
  line((9.5, 3.79), (9.5, 3.97), stroke: (paint: rgb("#595959"), thickness: 0.5pt, cap: "round", join: "round"))
  content((9.5, 4.02), [#text(size: 9pt)[$b_3"/"2$]], anchor: "south", padding: 0.07056cm)
  line((11.4, 3.79), (11.4, 3.97), stroke: (paint: rgb("#595959"), thickness: 0.5pt, cap: "round", join: "round"))
  content((11.4, 4.02), [#text(size: 9pt)[$c_h$]], anchor: "south", padding: 0.07056cm)
  line((14, 3.79), (14, 3.97), stroke: (paint: rgb("#595959"), thickness: 0.5pt, cap: "round", join: "round"))
  content((14, 4.02), [#text(size: 9pt)[$b_3$]], anchor: "south", padding: 0.07056cm)
  line((11.4, 0.43), (11.4, 3.8), stroke: (paint: rgb("#1c4068"), thickness: 0.7pt, cap: "round", join: "round", dash: "densely-dashed"))
  content((0, 3.25), [#text(size: 9pt)[Charged estimate on $cal(U)_N$]], anchor: "west", padding: 0.07056cm)
  rect((5, 2.98), (14, 3.52), fill: rgb("#ebebeb"), stroke: (paint: rgb("#737373"), thickness: 0.45pt, cap: "round", join: "round"))
  content((9.5, 3.25), [#text(size: 9pt)[$R_(g_b)"/"2 gt.eq c_n^2|E_b|_(g_b)^2$]])
  content((0, 2.45), [#text(size: 9pt)[Additional positive margin]], anchor: "west", padding: 0.07056cm)
  rect((7.25, 2.18), (14, 2.72), fill: rgb("#ebeef1"), stroke: (paint: rgb("#1c4068"), thickness: 0.6pt, cap: "round", join: "round"))
  content((10.62, 2.45), [#text(size: 9pt)[$b_3"/"4 lt.eq |h| lt.eq b_3$]])
  content((0, 1.65), [#text(size: 9pt)[Trace profile $cal(H) (|h|)$]], anchor: "west", padding: 0.07056cm)
  rect((5, 1.38), (7.25, 1.92), fill: rgb("#ebebeb"), stroke: (paint: rgb("#737373"), thickness: 0.45pt, cap: "round", join: "round"))
  rect((7.25, 1.38), (9.5, 1.92), fill: rgb("#dbdbdb"), stroke: (paint: rgb("#737373"), thickness: 0.45pt, cap: "round", join: "round"))
  rect((9.5, 1.38), (14, 1.92), fill: rgb("#c7c7c7"), stroke: (paint: rgb("#737373"), thickness: 0.45pt, cap: "round", join: "round"))
  content((6.125, 1.65), [#text(size: 9pt)[$0$]])
  content((8.375, 1.65), [#text(size: 9pt)[transition]])
  content((11.75, 1.65), [#text(size: 9pt)[plateau $M$]])
  content((0, 0.85), [#text(size: 9pt)[Heights in the retained $cal(D)_N$]], anchor: "west", padding: 0.07056cm)
  rect((5, 0.58), (11.4, 1.12), fill: rgb("#ebeef1"), stroke: (paint: rgb("#1c4068"), thickness: 0.6pt, cap: "round", join: "round"))
  content((8.2, 0.85), [#text(size: 9pt)[$0 lt.eq |h| lt.eq c_h$]])
  content((0, 0.05), [#box(width: 15.99cm, inset: 0.07056cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[$ cal(D)_N= overline( "component" "of" \{|h|<c_h\} "containing" "the" "far" "end" ) , b_3"/"2<c_h<b_3.$#linebreak() $ "supp" (K_( upright("new") )|_( cal(D)_N)) subset \{x in cal(D)_N:b_3"/"4 lt.eq |h(x)| lt.eq c_h\}.$]])], anchor: "north-west")
})],
  caption: [Figure 1: Height bands and the late neutral cut. The bars refer only to the original exterior and encode height, not distance or the topology of level sets. The end component $cal(D)_N$ stays outside the filling; every component of its boundary is retained. After the two scalar solves and the regular choice of $c_h$, the finite plateau $M$ is chosen to make that boundary strictly future trapped, without changing $N$ or either solution. See (6.4)–(6.5), Lemma 39, and (6.55). ],
) <flux:fig-height-bands>

#thm([Proposition 6.6.])[
  (Prepared numerical bound).  #emph[For the prepared data, for every $0 < s < 1$, 
#[#set math.equation(numbering: n => "(6.54)")
 $ cal(E)_(*) gt.eq s \| Q \| + frac(1 - s^2, 2) X_(*) . $ <flux:prepared-inequality>]

 The conclusion also holds for prepared data carrying a smooth compactly supported closed magnetic two-form, with the charged energy convention used in the filled scalar construction.]
] <flux:prepared-bound>

#proof[
  Keep $s$, a smooth profile, and $epsilon$ fixed. Take $N$ sufficiently large for all preceding constructions. Sard’s theorem gives a regular value $c_h in \( b_3 \/ 2 \, b_3 \)$ of $\| h \|$. Let $cal(D)_N$ be the closure of the component of ${ \| h \| < c_h }$ containing the entire far end. By (6.4), this component cannot cross $S$ into the filling. Its entire boundary is a compact smooth embedded two-sided hypersurface in the original interior. It is nonempty: a path in the original connected exterior from the far end to $S$ must cross the chosen level. All boundary components are retained.
  The mean curvature of this fixed compact boundary in $gamma$ is finite. We may now choose the plateau $M$ in Lemma 39 so large that, with normal toward the end,
  #[#set math.equation(numbering: n => "(6.55)")
   $ H_(partial cal(D)_N) + "tr"_(partial cal(D)_N) K_(upright("new")) = H_(partial cal(D)_N) - k frak(a) < 0 quad upright("on every component") . $ <flux:strict-new-boundary>]
  This late choice does not require repeating either scalar solve or increasing $N$, by (6.53). Restricted to $cal(D)_N$, the new tensor has compact support, since $h arrow.r 0$ and $cal(H)$ vanishes near zero.
  We check the neutral input’s hypotheses explicitly. The exterior $cal(D)_N$ is connected and oriented, smooth up to its nonempty compact boundary, and has exactly the original coordinate end with compact complement. It is complete with boundary included: it is closed in the original complete exterior, and (6.37) bounds its metric below by a positive constant times $g$. The metric is smooth and has all-order differentiated decay of order $2 - n$ in normalized end coordinates. Thus the metric and tensor satisfy the stronger falloffs in Theorem 4, with any exponent strictly between $\( n - 2 \) \/ 2$ and $n - 2$. The neutral DEC follows from Lemma 39; its matter densities are integrable because the tensor is compactly supported and the scalar curvature is integrable at infinity. The ADM momentum is zero. The ADM energy exists and is given by (6.38). Finally the new boundary is strictly future outer trapped by (6.55).
  Every full cut of $cal(D)_N$, regarded as a subset of the original exterior, is also a full cut there. This includes any portions coincident with $partial cal(D)_N$, and counts every component. Therefore its full-cut infimum $a_N$ satisfies
  #[#set math.equation(numbering: n => "(6.56)")
   $ a_N gt.eq e^(k y_0) a_(*) > 0 . $ <flux:area-retention>]
  Indeed the metric comparison acts on all $k$ tangent directions, and the class of available cuts has only been restricted. No minimizing boundary is assumed to be smooth or to exist.
  It remains to verify the timelike energy hypothesis of the neutral input for these auxiliary data. Write $e_N = cal(E) \( gamma \)$. If $e_N > 0$, their zero momentum makes that hypothesis immediate. If $e_N lt.eq 0$, apply the conformal end increase of Lemma 12, taking its positive function $phi.alt$ constant on a core containing the boundary and the new tensor’s support. For $U = 1 + lambda phi.alt$, transform the data by
  #[#set math.equation(numbering: n => "(6.57)")
   $ gamma_lambda = U^(4 \/ \( n - 2 \)) gamma \, #h(2em) K_lambda = U^(2 \/ \( n - 2 \)) K_(upright("new")) . $ <flux:neutral-end-increase>]
  The neutral DEC and trapping signs persist, the stronger asymptotic derivatives persist, momentum remains zero, and full-cut areas do not decrease. Its energy is $e_N + 2 lambda$. For every arbitrarily small $e > 0$ choose $lambda = \( e - e_N \) \/ 2 gt.eq 0$. These data satisfy all hypotheses of Theorem 4, which would give
  #[#set math.equation(numbering: n => "(6.58)")
   $ e gt.eq 1 / 2 \( a_N \/ omega \)^(\( k - 1 \) \/ k) gt.eq 1 / 2 e^(\( k - 1 \) y_0) X_(*) > 0 . $ <flux:nonpositive-contradiction>]
  Letting $e arrow.b 0$ is a contradiction. Thus $e_N > 0$, and the same neutral input applied directly gives
  #[#set math.equation(numbering: n => "(6.59)")
   $ e^(\( k - 1 \) epsilon) \( cal(E)_(*) + o_N \( 1 \) \) - frac(H_0 \( 0 \), k) \| Q \| gt.eq 1 / 2 e^(\( k - 1 \) y_0) X_(*) = frac(1 - s^2, 2) X_(*) . $ <flux:prelimit-bound>]
  The parameter order is as follows. For the fixed prepared data, fix $s in \( 0 \, 1 \)$, a profile tolerance, and $epsilon > 0$ first. Complete the two scalar solves and the regular cut for each sufficiently large $N$; the tensor plateau is chosen last for that $N$. Now let $N arrow.r oo$ in (6.59), then let $epsilon arrow.b 0$, and then let the profile tolerance decrease to zero. Equations (6.13) and (6.12) give (6.54). Only fixed-parameter estimates were required in the second scalar solve. The electromagnetic input used in this proof was precisely (6.8) and its lower bound by $I_g \( w \)$, which also holds for the indicated compact magnetic form. ◻
]

=== 6.5 Return to the original data and optimize <return-to-the-original-data-and-optimize>

#thm([Corollary 6.7.])[
  (Strict compact-magnetic numerical extension).  #emph[Let the original exterior satisfy the numerical geometric and asymptotic hypotheses, and let $D_m$ be an arbitrary smooth compactly supported closed two-form. With $alpha = i_E "vol"_g$ closed, use the electromagnetic convention 
#[#set math.equation(numbering: n => "(6.60)")
 $ I_g \( v \) = c_n^2 #scale(x: 120%, y: 120%)[\(] \| E \|_g^2 + \| D_m \|_g^2 + 2 D_m \( v \, E \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) mu_m + J_m \( v \) = mu + J \( v \) - I_g \( v \) . $ <flux:magnetic-convention>]

 Assume also that $mu_m \, \| J_m \|_g$ are integrable and that the ADM and charge flux limits exist with the stated normalizations. Assume the ADM vector is future timelike, the fixed componentwise trapping inequalities are strict, and for some $c > 0$ and $0 < beta < min \( 1 \, q \)$, 
#[#set math.equation(numbering: n => "(6.61)")
 $ mu_m - \| J_m \|_g gt.eq c r^(- n - beta) . $ <flux:strict-magnetic-margin>]

 Then, with the original full-cut infimum $a$ and the original normalized electric charge $Q$, 
#[#set math.equation(numbering: n => "(6.62)")
 $ m gt.eq s \| Q \| + frac(1 - s^2, 2) X_A quad \( 0 < s < 1 \) . $ <flux:magnetic-s-family>]

 Equivalently, $m gt.eq \| Q \|$, and when $X_A > \| Q \|$ one also has $m gt.eq \( X_A + Q^2 \/ X_A \) \/ 2$. No magnetic equality classification or non-timelike extension is asserted here.]
] <flux:magnetic-extension>

#proof[
  Apply the rest preparation and strict preparation in Proposition 17 and Lemma 15, retaining the two closed forms. The magnetic support stays in the compact original region. There the strictly positive margin absorbs the arbitrarily small rescaling errors. The gluing and bending annuli can be taken outside that support, so on those annuli and on the end the electric estimates are unchanged. This yields prepared data with charge $Q$, energies $cal(E)_(* \, j) arrow.r m$, and full-cut infima $a_(* \, j) gt.eq \( 1 - o_j \( 1 \) \) a$. For each fixed $s$, apply Proposition 40 and then pass to this limit. The right side is increasing in the area variable, so the lower comparison of infima is sufficient. This proves (6.62). The elementary optimization is given in Proposition 19. The argument does not require the component electric fluxes to have one sign. ◻
]

#proof[
  #emph[Completion of Theorem 5.] Proposition 40 establishes (3.19) for every prepared data set with positive energy and zero momentum, and every fixed $s in \( 0 \, 1 \)$. The Reduction of the Numerical Theorem (Proposition 19) therefore proves Theorem 5, including positivity of the full enclosing area, strict future timelikeness of the original ADM vector, and the stated branch distinction. The endpoint limits in $s$ are taken after the fixed-$s$ inequality is established, so no profile estimate uniform at $s = 0$ or $s = 1$ is required. ◻
]

== 7 The original-data variational identity <var:section>

We now assume the connected-horizon hypotheses of Definition 6 and equality in Theorem 5, with $m > \| Q \|$. All objects in this section belong to the original exterior $\( Omega \, g \, K \, E \)$. In particular, no equality statement about one of the auxiliary metrics is used. We first differentiate the full enclosing-area infimum, then separate the active constraint inequalities from a direction that would improve equality. The resulting multipliers are initially measures. Their regularity and the elimination of their possible singular area sheets are separate steps. Decrease the asymptotic exponent, if necessary, so that $\( n - 2 \) \/ 2 < q < n - 2$; this retains every original hypothesis.

Write $A = "Area"_g \( S \)$, $k = n - 1$, and

#[#set math.equation(numbering: n => "(7.1)")
 $ r_h = \( A \/ omega \)^(1 \/ k) \, #h(2em) b^0 = cal(E)_(upright("ADM")) / m \, #h(2em) b^i = - frac(\( upright(bold(P))_(upright("ADM")) \)_i, m) \, #h(2em) c = frac(k - 1, r_h) (1 - Q^2 / r_h^(2 \( k - 1 \))) > 0 . $ <var:constants>]

The vector $b$ is fixed when taking variations. Set $cal(B) = b^0 cal(E)_(upright("ADM")) + sum_i b^i \( upright(bold(P))_(upright("ADM")) \)_i$. Thus $m' = cal(B)'$ at the original data. On the outer, nonextremal area branch, differentiation at fixed $Q$ gives

#[#set math.equation(numbering: n => "(7.2)")
 $ frac(upright(d), upright(d) A) 1 / 2 (r_h^(k - 1) + Q^2 r_h^(- \( k - 1 \))) = frac(c, 2 k omega) . $ <var:area-coefficient>]

The strictly positive coefficient in this formula will be essential.

Throughout the variations, an electric field is represented by the closed flux form $alpha = i_E "vol"_g$. We also allow a closed, compactly supported two-form $D_m$, initially zero, representing the spatial Faraday form divided by $c_n$. For these extended data put

#[#set math.equation(numbering: n => "(7.3)")
 $ mu_m & = 1 / 2 \( R_g + tau^2 - \| K \|^2 \) - c_n^2 \( \| E \|^2 + \| D_m \|^2 \) \,\
J_m & = "div" \( K - tau g \) - 2 c_n^2 D_m \( thin dot.op thin \, E \) . $ <var:magnetic-constraints>]

Only the strictly feasible numerical extension of Corollary 41 will be applied to data with $D_m eq.not 0$. No magnetic equality theorem is assumed. Compactly supported closed variations of either form, including tests supported up to $S$, do not change $Q$, by Stokes’ theorem on a truncation.

=== 7.1 The full area envelope <the-full-area-envelope>

Choose a compact smooth filling $O$ behind $S$, with a smooth extension of the metric, and denote the resulting boundary-free manifold by $cal(M)$. The filling is used only to define perimeter competitors; no constraint inequality is required there. A filled competitor is a bounded finite-perimeter set $F subset cal(M)$ containing $O$ up to null sets. Its perimeter counts the part coinciding with $partial O = S$.

#thm([Proposition 7.1.])[
  (Area envelope and regular patches).  #emph[The least perimeter of filled competitors equals the full smooth-cut infimum $a$. The family $cal(F)_(*)$ of minimizing filled sets, considered modulo null sets, is compact in local $L^1$, and all its members are supported in a common compact set. Their exterior end components have the full-boundary convention of Definition 3.]
  #emph[Each minimizing frontier is smooth and minimal at its free regular points. Its possible singular set has Hausdorff dimension at most $n - 8$. All contact points with $S$ are regular of class $C^(1 \, gamma)$ for some $gamma > 0$, and their graph representations belong to $W^(2 \, p)$ for every finite $p$. At an interior regular point of one frontier, any other minimizing frontier through the point coincides with it locally. On a smaller neighborhood the minimizing frontiers that meet that neighborhood are disjoint single graphs, with uniform smooth interior estimates.]
  #emph[For a differentiable metric path with $g'_0 = h$, the right derivative of its enclosing-area infimum is 
#[#set math.equation(numbering: n => "(7.4)")
 $ a'_(+) \( h \) = min_(F in cal(F)_(*)) a'_F \( h \) \, #h(2em) a'_F \( h \) = 1 / 2 integral_(partial^(*) F) "tr"_(T partial^(*) F) h thin upright(d) A_g . $ <var:envelope-derivative>]

 Here and below $partial^(*) F$ is used for integration, while “frontier” means the support of its perimeter measure.]
] <var:area-envelope>

#proof[
  Large coordinate spheres have positive mean curvature, uniformly for the finite-dimensional metric paths considered below. On the region outside one such sphere, the outward unit normal to their foliation has positive divergence. Applying the divergence theorem to the portion of a filled competitor outside that sphere shows that clipping off that portion cannot increase perimeter, and strictly decreases it if the discarded portion has positive volume. The argument holds for almost every cutting radius by finite-perimeter slicing. Choose two fixed radii, both outside the compact core. Clipping at the smaller radius gives a common compact truncation, strictly inside the larger one, for minimization and for all sufficiently small parameters of each path. BV compactness and lower semicontinuity now give a minimizer; see #cite(label("AmbrosioFuscoPallara2000")).
  A smooth full cut bounds a filled competitor with exactly the same area, including its contact portions. Conversely, first push $O$ and an arbitrary filled competitor slightly outward by a smooth ambient diffeomorphism supported in a collar of $S$. The pushed competitor contains a neighborhood of the original $O$, and its perimeter tends to the original perimeter. Strict approximation of finite-perimeter sets by smooth domains can therefore be carried out while retaining that neighborhood. It is supported inside a fixed compact truncation. Retain the exterior component containing the end, filling any bounded exterior components of the smoothed set. This only removes boundary components. Its entire smooth intrinsic boundary is a full cut. Passing through these two approximations proves equality of the infima. The same removal observation shows that a minimizing frontier cannot leave a removable bounded complementary open component: a nonempty such component has positive perimeter, whose removal would improve the minimum. The usual indecomposable-component decomposition gives the same conclusion for finite-perimeter representatives #cite(label("AmbrosioFuscoPallara2000")).
  Here is the local estimate needed at the obstacle. For a local competitor $G$, replace it by $G union O$. Submodularity gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ P \( G union O \) lt.eq P \( G \) + P \( O \) - P \( G ∩ O \) . $ <var:obstacle-submodularity>]
  Extend the smooth outward normal of $O$ to a smooth vector field of norm at most one near its boundary. Its divergence is bounded. The calibration inequality for this field gives $P \( O \) - P \( G ∩ O \) lt.eq C \| O \\ G \|$ for changes in a sufficiently small coordinate neighborhood. Since $F$ minimizes among sets containing $O$, it follows that
  #[#set math.equation(numbering: n => "(7.6)")
   $ P \( F \; B \) lt.eq P \( G \; B \) + C \| F triangle.stroked.t G \| $ <var:quasiminimizing>]
  whenever $F triangle.stroked.t G$ is compactly contained in the small ball $B$. This is an unconstrained perimeter almost-minimizing estimate. In coordinates the Riemannian area integrand is the ellipsoidal integrand associated with $cal(A) = \( det g \) g^(- 1)$, which is smooth and uniformly elliptic. The error in (7.6) is $O \( r^n \)$ and therefore is bounded by $C_gamma r^(n - 1 + gamma)$ for any fixed $0 < gamma < 1$ on sufficiently small balls. The almost-minimizer results in #cite(label("Simmons2022")) Propositions 4.5–4.7 and Theorems 1.1, 9.5, 10.2–10.3 apply. They give density and perimeter bounds, local compactness, regularity off a set of dimension at most $n - 8$, and convergence as single $C^1$ graphs near free regular limit points. On free patches, the uniform local $C^(1 \, gamma \/ 4)$ graph bounds and the smooth minimal-graph equation upgrade this to smooth convergence on smaller patches by interior elliptic estimates. Tangent sets are perimeter-minimizing cones. The minimal-boundary formulation and dimension reduction are also described in #cite(label("SimonGMT2014")) Chapter 7, Section 5.
  At a contact point a tangent filled cone contains the tangent half-space of $O$. The corresponding minimizing hypercone is therefore supported on one side of its boundary plane, and is that plane. One way to see the last assertion is to integrate the signed coordinate-height equation on its stationary spherical link; the height has one sign and its spherical Laplacian is a negative constant times itself. The singular set can be removed in this integration by its dimension and the perimeter bounds. Equivalently one can use the half-space cone theorem in #cite(label("SimonGMT2014")) Chapter 7, Section 4, Theorem 4.5. The almost-minimizer regularity theorem now gives a $C^(1 \, beta)$ graph at contact for some $beta > 0$; one may take $beta = gamma \/ 4$. Estimate (7.6), differentiated along smooth flows, bounds its weak mean curvature. Difference quotients in the uniformly elliptic prescribed-mean-curvature graph equation give $W^(2 \, 2)$ regularity. Written in nondivergence form, that equation has Hölder coefficients and bounded right-hand side, so local $W^(2 \, p)$ estimates give all finite $p$; see #cite(label("GilbargTrudinger2001")).
  If two minimizing frontiers meet at a free regular point of one of them, their union and intersection also minimize by (7.5), with equality in the sum of the perimeters. They are ordered relative to the given regular sheet. Their tangent cones at contact are one-sided relative to its tangent plane, and hence are planes. Regularity and the strong comparison principle for the minimal graph equation imply local coincidence. Strict compactness and regular convergence then give the asserted uniform graph neighborhoods: otherwise a sequence of failing frontiers would converge strictly to a minimizer through the point, where multiplicity-one regular convergence gives precisely the missing neighborhood. The difference of two distinct ordered graphs solves a linear uniformly elliptic equation. Positive-solution Harnack and interior derivative estimates imply, on smaller patches, that its gradient is bounded by a uniform constant times its pointwise separation.
  Finally let $F_t$ minimize for $g_t$. Compactness, lower semicontinuity and comparison with a fixed $g_0$ minimizer show that every convergent subsequence at $t = 0$ converges strictly in perimeter to an element of $cal(F)_(*)$. Strict continuity for vector measures then gives convergence of the tangent-plane area measures #cite(label("AmbrosioFuscoPallara2000")). The area Taylor expansion has a uniform remainder on the resulting perimeter-bounded family. Fixed minimizers give the upper bound in (7.4); the varying minimizers give the lower bound. This also proves compactness of the minimizing family and continuity of $F mapsto a'_F \( h \)$ in its strict topology. ◻
]

=== 7.2 Strict directions and positive-measure separation <strict-directions-and-positive-measure-separation>

An active ray is a pair $\( x \, v \)$ with $\| v \|_g lt.eq 1$ and $mu_m \( x \) + J_m \( x \) \( v \) = 0$. Under a metric variation $h$, transport the unit ball by the metric square root, so $v' = - h^sharp v \/ 2$. Denote by $frak(C)'$ the variation of $2 \( mu_m + J_m \( v \) \)$ under that transport. Our test space consists of finite linear combinations of:

+ arbitrary compact smooth variations $\( h \, p \, alpha' \, D'_m \)$, including support up to $S$, with $p = K'$ and both form variations closed;
+ a metric end prototype $h = r^(2 - n) delta$, cut off toward the core;
+ second-tensor end prototypes whose Euclidean trace reversal is
  #[#set math.equation(numbering: n => "(7.7)")
   $ Pi_(i j) = r^(- k) #scale(x: 120%, y: 120%)[\(] a_i n_j^delta + a_j n_i^delta - \( a dot.op n^delta \) delta_(i j) #scale(x: 120%, y: 120%)[\)] \, #h(2em) n^delta = x \/ r \, $ <var:momentum-prototype>]
  with arbitrary constant $a in bb(R)^n$ and a cutoff toward the core;
+ the strict conformal direction $\( h \, p \) = \( 2 phi.alt g \, phi.alt K \)$, with both forms fixed.

For the last direction choose $0 < beta < min \( 1 \, q \)$, put $rho_0 = r^(- n - beta)$ with a positive smooth extension of the radial weight, and take

#[#set math.equation(numbering: n => "(7.8)")
 $ - Delta phi.alt = B sqrt(\| upright(d) phi.alt \|^2 + r^(- 2 k)) + rho_0 \, #h(2em) partial_nu phi.alt = - 1 \, #h(2em) phi.alt \( oo \) = 0 \, $ <var:strict-direction>]

where $B gt.eq \| K \|$ is smooth and has simple symbol bounds $B = O_j \( r^(- 1 - q) \)$. The strictification construction in Lemma 15 applies to this decaying drift: its radial barriers dominate the drift because $beta < q$. It gives $phi.alt > 0$, $phi.alt = O_2 \( r^(2 - n) \)$ and finite gradient flux. In particular

#[#set math.equation(numbering: n => "(7.9)")
 $ frac(- Delta phi.alt, rho_0) arrow.r 1 \, #h(2em) frak(C)'_(upright("strict")) / rho_0 > 0 upright(" on active rays") \, #h(2em) frak(C)'_(upright("strict")) / rho_0 arrow.r 2 k \, #h(2em) - theta'_(upright("strict")) = k . $ <var:strict-tail>]

Here the extra algebraic electric term is nonnegative: at a purely electric active ray the conformal derivative of $frak(C)$ is

#[#set math.equation(numbering: n => "(7.10)")
 $ - 2 k Delta phi.alt + 2 k K \( nabla phi.alt \, v \) + 4 \( k - 1 \) c_n^2 phi.alt \| E \|^2 . $ <var:conformal-active-derivative>]

The prototypes have zero flat linearized constraints on the end. For example $Pi_(i j) = r^(- n) \( a_i x_j + a_j x_i - \( a dot.op x \) delta_(i j) \)$ satisfies $partial_j Pi_(i j) = 0$ and $Pi_(i j) n^j = r^(- k) a_i$. Its momentum derivative is $a_i \/ k$; the scalar prototype has energy derivative $\( n - 2 \) \/ 2$. The background errors in the linearized constraints are $O \( r^(- n - q) \)$. Thus the prototypes span the ADM flux derivatives and their normalized active-constraint values tend to zero.

#thm([Proposition 7.2.])[
  (Multiplier identity).  #emph[There are a probability measure $pi$ on $cal(F)_(*)$, a nonnegative locally finite measure $Lambda$ on the active rays, and a nonnegative finite measure $zeta$ on $S$, such that 
#[#set math.equation(numbering: n => "(7.11)")
 $ 2 k omega cal(B)' - c integral_(cal(F)_(*)) a'_F \( h \) thin upright(d) pi \( F \) = integral frak(C)' thin upright(d) Lambda - integral_S theta'_(+) thin upright(d) zeta $ <var:separation>]

 for every compact test and every end prototype above. No surjectivity of a constraint map is required.]
] <var:multiplier-identity>

#proof[
  Consider the linear image of the test space with components
  #[#set math.equation(numbering: n => "(7.12)")
   $ (frak(C)' \/ rho_0 \, med - theta'_(+) \, med { c a'_F \( h \) - 2 k omega cal(B)' }_(F in cal(F)_(*))) . $ <var:separation-map>]
  The constraint test space is the one-point compactification of the closed active-ray set, with one artificial infinity point added even if that set is bounded. At infinity assign $2 k$ times the coefficient of the strict direction. The other two test spaces are $S$ and the compact minimizing family. The normalized functions are continuous by (7.9) and Proposition 42.
  This image does not meet the open cone of functions strictly positive on the disjoint union of the three compact test spaces. Indeed such a direction has positive strict-direction coefficient because of the infinity test. Apply that positive conformal direction exponentially to the data after making the other variations additively. On compact subsets, strict first-order positivity on the active rays implies feasibility for all sufficiently small positive parameters: rays outside a fixed neighborhood of the active set have a positive zeroth-order gap. On the end the nonconformal linear errors are $O \( r^(- n - q) \)$ and are dominated by $rho_0$. After retaining the nonnegative background through the conformal formula, the quadratic errors are bounded by $C t^2 rho_0$. The strict first-order term therefore gives $mu_m - \| J_m \| gt.eq c_t rho_0$, with $c_t > 0$. The forms remain closed; a newly created magnetic form has fixed compact support. Trapping is strict, the ADM vector remains future timelike, and completeness, decay, integrability and existence and differentiability of the fluxes are preserved. These are precisely the hypotheses of Corollary 41. The area infimum stays positive by uniform metric comparison on the compact core and the controlled tail. Equation (7.4) and strict positivity of the objective components would now violate the numerical inequality for small positive parameter.
  Hahn–Banach separation of a linear subspace from an open convex cone gives a nonzero positive functional on the continuous functions on this compact disjoint union. The Riesz representation theorem supplies the three nonnegative measures. Its objective measure has positive mass. Otherwise testing the strict direction, uniformly positive on the two constraint test spaces, would force both remaining measures to vanish as well. Normalize the objective measure to have mass one. On finite active rays divide the constraint measure by $rho_0$ to obtain $Lambda$. This measure is finite over compact subsets, including the boundary. The possible infinity atom contributes nothing on compact tests or prototypes. Rearranging the annihilation identity gives (7.11). ◻
]

=== 7.3 Normal-motion tests and the sheets selected by the multiplier <normal-motion-tests-and-the-sheets-selected-by-the-multiplier>

Let $u$ and $X$ be the scalar and vector moments of $Lambda$. Initially these are measures, using the fixed Riemannian volume-density convention; thus $u$ also denotes the scalar distribution defined by its moment measure. Positivity and the definition of the active set imply

#[#set math.equation(numbering: n => "(7.13)")
 $ u gt.eq \| X \|_g \, #h(2em) u mu_m + J_m \( X \) = 0 $ <var:moment-complementarity>]

as measure identities. In particular, electromagnetic or metric terms of the ray derivative require moments of order at most one.

#thm([Lemma 7.3.])[
  (Tangential trace on free sheets).  #emph[For $pi$-almost every minimizing frontier, $"tr"_(T partial F) K = 0$ on each of its free regular sheets. Every such frontier either equals $S$, or is wholly inside $"int" Omega$ and satisfies $H = "tr"_(T partial F) K = 0$ on its regular part.]
] <var:trace-free-sheets>

#proof[
  Fix a smooth lapse test $s$ compactly supported in the open exterior, and choose a local Gaussian Lorentzian metric inducing $g \, K$ at time zero. Its spatial metric and first normal jet are fixed, while its second normal metric jets are free. Choose a two-form whose initial electric and spatial components are $c_n E$ and zero. Its first normal derivatives can be chosen so that both Maxwell equations hold on the initial slice. In general dimension the tangential Maxwell constraints are $upright(d) D_m = 0$ and $upright(d) alpha = 0$; the remaining equations prescribe the $n \( n - 1 \) \/ 2$ magnetic and $n$ electric normal evolution components. The induced flux-form variations under normal motion with velocity $s N$ are compactly supported and closed, as follows also from Cartan’s formula applied to these initial Maxwell jets.
  Let $sans(S)$ denote the electromagnetic stress tensor with the normalization in Definition 2. It is divergence-free at the initial slice. For each $delta > 0$, prescribe there the spatial components of Einstein minus $sans(S)$ to be
  #[#set math.equation(numbering: n => "(7.14)")
   $ T_(i j)^(\( delta \)) = frac(\( J_m \)_i \( J_m \)_j, mu_m + delta) . $ <var:normal-jet-matter>]
  Spatial trace reversal of the second normal metric jets is invertible, so these are legitimate smooth jet prescriptions. The normal and mixed components remain $mu_m \, J_m$ by Gauss–Codazzi. The resulting variation has $h = 2 s K$.
  We check that $frak(C)' arrow.r 0$ uniformly on compact active test sets. The tensors in (7.14) converge spatially in $C^1$. On ${ mu_m > 0 }$ this is ordinary smooth convergence; near a zero of $mu_m$, DEC gives $\| J_m \| lt.eq mu_m$ and smoothness gives $upright(d) mu_m = nabla J_m = 0$ at that zero. The bounds
  #[#set math.equation(numbering: n => "(7.15)")
   $ \| T^(\( delta \)) \| lt.eq mu_m \, #h(2em) \| nabla T^(\( delta \)) \| lt.eq 2 \| nabla J_m \| + \| upright(d) mu_m \| $ <var:matter-jet-bounds>]
  make the convergence uniform across the zero set. At a positive-density active ray, the limiting spacetime tensor is $gamma ⊗ gamma \/ mu_m$, where $gamma \( N \) = mu_m$ and $gamma \|_(T Omega) = J_m$. It is causal and annihilates the null vector $N + v$. Parallel-transport that null vector along spatial curves. Its contraction with the causal covector is nonnegative and vanishes at the base point; differentiation at the minimum therefore shows that all relevant spatial covariant derivatives, with last argument $N + v$, vanish. Bianchi and the initial Maxwell equations then give the same limiting vanishing for the normal derivative contracted with $N \, N + v$. Changes of the first argument cost zero, and changes of the second cost zero because it remains null and $gamma$ is proportional to its metric dual. At a matter zero, both the tensor and its spatial derivatives vanish by (7.15), and the divergence equation again suffices. These observations prove the asserted uniform convergence of $frak(C)'$.
  Apply (7.11) to these tests and pass to the limit. They have no boundary or ADM variation, so
  #[#set math.equation(numbering: n => "(7.16)")
   $ integral_(cal(F)_(*)) integral_(partial^(*) F) s "tr"_(T partial^(*) F) K thin upright(d) A_g thin upright(d) pi \( F \) = 0 . $ <var:weighted-trace-zero>]
  At free regular points, Proposition 42 provides uniform noncrossing graph patches, and frontiers through a common point have the same tangent plane. Consequently the tangential trace is a single-valued continuous function on each such patch of the integrated surface measure. There is no cancellation between different tangent planes in (7.16). A countable cover and Fubini imply the first conclusion, initially almost everywhere and then everywhere on regular sheets by smoothness.
  At contact, the $W^(2 \, p)$ graph and the smooth obstacle have the same second jets almost everywhere on their coincidence set. The frontier therefore satisfies $H + "tr"_(upright("tan")) K = 0$ almost everywhere throughout the contact graph, including its free portion. Uniform ellipticity first improves its regularity and then bootstraps it to a smooth solution of the expansion equation. The strong comparison principle gives coincidence with $S$ near contact. The set of coincidence is open and closed along the connected $S$, so the whole $S$ is present. Its area is already the minimum $A$, leaving no area for another sheet. If there is no contact, the compact frontier is separated from $S$, and the stated equations hold on all its regular points. ◻
]

=== 7.4 The moment equations and their initial regularity <the-moment-equations-and-their-initial-regularity>

#thm([Proposition 7.4.])[
  (Regularity of the measure moments).  #emph[In the open exterior the moments are functions satisfying the first Killing initial data (KID) equation 
#[#set math.equation(numbering: n => "(7.17)")
 $ "sym" nabla X = - u K \, $ <var:first-kid>]

 and 
#[#set math.equation(numbering: n => "(7.18)")
 $ "Hess" u = cal(L) \( u \, X \, nabla X \) + c / 2 integral_(cal(F)_(*)) nu_F^flat ⊗ nu_F^flat thin upright(d) A_F thin upright(d) pi \( F \) . $ <var:hessian-measure>]

 The equations are distributional, and surface measures in the second equation are expressed relative to ambient volume. The operator $cal(L)$ has smooth linear coefficients. It is specifically the lower-order operator from the metric adjoint in (7.11), with the flux form fixed and the unit-ball rays transported as specified above. In particular, it is not an arbitrary operator with smooth coefficients. Locally $u$ is Lipschitz and $X$ is $C^(1 \, 1)$. The complementarity relations (7.13) hold pointwise.]
] <var:moment-regularity>

#proof[
  For a compactly supported interior variation $K' = p$, the coefficient after integration by parts is
  #[#set math.equation(numbering: n => "(7.19)")
   $ 2 #scale(x: 120%, y: 120%)[\[] u \( tau g - K \) - "sym" nabla X + \( "div" X \) g #scale(x: 120%, y: 120%)[\]] : p . $ <var:second-tensor-adjoint>]
  Its trace gives $"div" X = - u tau$, and its trace-free part then gives (7.17). For metric tests the scalar-curvature principal adjoint is $"Hess" u - \( Delta u \) g$. Connection variations in the momentum term give smooth linear expressions in $u \, X \, nabla X$; fixed-flux field terms and the ray-transport term are algebraic in those moments. The area term has coefficient $- c \( g - nu_F^flat ⊗ nu_F^flat \) \/ 2$ on this side of (7.11). Inverting trace reversal gives (7.18), with the displayed positive normal-normal measure.
  Differentiating (7.17) and commuting covariant derivatives expresses every component of $nabla^2 X$ as a smooth linear combination of $"Rm" * X$, $K * upright(d) u$ and $\( nabla K \) * u$. Taking traces gives a strongly elliptic Laplace system for $\( u \, X \)$ with smooth lower-order coefficients. Its source measure has local growth $O \( r^(n - 1) \)$, uniformly in the minimizer, by the local perimeter bound. A localized elliptic parametrix has order $- 2$ and kernel bounds $C \| x - y \|^(2 - n - j)$ for $j = 0 \, 1$. Such a potential of a measure with this growth is locally $C^gamma$ for every $0 < gamma < 1$: split the potential difference at twice the point separation, use the growth bound nearby and the first kernel derivative on successive outer annuli to get $O \( r \( 1 + \| log r \| \) \)$. Lower-order terms are included in the parametrix, and the homogeneous remainder is smooth. Thus $u \, X$ are Hölder continuous.
  The traced differentiated equation for $X$ now has the form of the divergence of a Hölder field plus a Hölder function; local elliptic estimates give $X in C^(1 \, gamma)$, after decreasing $gamma$ if needed. The lower term in (7.18) is therefore continuous. Its positive measure term implies a local lower bound for the covariant Hessian in the distributional sense. Slice this inequality in smooth flow boxes whose longitudinal curves are unit-speed geodesics. Multiplying by the smooth volume Jacobian gives the one-dimensional distributional inequality $\( u compose gamma \)'' gt.eq - C$ on almost every such curve. Continuity extends its integrated convexity inequality to every curve in a smaller box. This is local geodesic semiconvexity, which implies a local Lipschitz bound by bounding one-sided slopes on short geodesic segments with endpoints in a fixed larger ball. The differentiated equation for $X$ consequently has bounded right-hand side componentwise, so $nabla^2 X$ is locally bounded and $X in C^(1 \, 1)$. The measure inequalities now reduce to pointwise inequalities by continuity. ◻
]

For clarity about the field coefficients in this adjoint, holding $alpha = i_E "vol"_g$ fixed gives $E' = - \( "tr" h \) E \/ 2$ and hence

#[#set math.equation(numbering: n => "(7.20)")
 $ delta #scale(x: 120%, y: 120%)[\(] 2 u c_n^2 \| E \|^2 "vol"_g #scale(x: 120%, y: 120%)[\)] = u c_n^2 #scale(x: 120%, y: 120%)[\(] 2 E_i E_j - \| E \|^2 g_(i j) #scale(x: 120%, y: 120%)[\)] h^(i j) "vol"_g = - u sans(S)_(i j) h^(i j) "vol"_g . $ <var:electric-metric-adjoint>]

The ray transport contributes $- \( J_m \)_(\( i) X_(j \)) h^(i j)$. The added variation of volume in the full constraint pairing is zero by complementarity. These identities, together with the actual gravitational adjoint, will control null focusing in the next section. In particular, the singular term in (7.18) cannot be discarded by assuming regularity of a minimizing frontier.

== 8 Eliminating interior area multipliers <var:singular-multipliers>

We prove that the area multiplier obtained from separation is concentrated on the given boundary. The main issue is that an area minimizer can have a singular frontier in high dimension. Atomic transverse mass forces a regular sheet to be totally geodesic. For the remaining sheets, a common positive Jacobi field, null focusing, and a cone argument give a uniform curvature bound. A separate locality argument removes diffuse multiplier mass from sheets on which the lapse vanishes. All these arguments concern the original smooth data.

Throughout this section, $k = n - 1$, and $cal(F)_(*)$ and $pi$ are the compact family and probability measure of Proposition 42 and equation (7.11). We use the full-measure family supplied by Lemma 44, intersected with $"supp" pi$. A member of this family has frontier $S$, or has compact frontier wholly in the open exterior and satisfies

#[#set math.equation(numbering: n => "(8.1)")
 $ H_Sigma = 0 \, #h(2em) "tr"_Sigma K = 0 $ <var:zero-sheet-expansions>]

on every free regular sheet. We retain the local common-sheet, noncrossing, and graphical compactness conclusions of Proposition 42. In particular, distinct nearby sheets are disjoint graphs, and on smaller patches the tilt between them is bounded by a constant times their separation.

The moments of Proposition 45 satisfy

#[#set math.equation(numbering: n => "(8.2)")
 $ "sym" nabla X = - u K \, #h(2em) nabla^2 u = B \( u \, X \, nabla X \) + cal(M) \, #h(2em) cal(M) = c / 2 integral_(cal(F)_(*)) nu_D^flat ⊗ nu_D^flat thin d A_D thin d pi \( D \) $ <var:singular-system>]

in the open exterior. Here $c > 0$, $u$ is locally Lipschitz, $X$ is locally $C^(1 \, 1)$, and the last formula defines a tensor-valued measure relative to the smooth volume density. Its singular sets have zero sheet area. Here $B$ abbreviates the operator $cal(L)$ of Proposition 45. It is the precise lower-order metric-adjoint expression in equation (7.11), with the electric flux held fixed and the unit-ball rays transported isometrically. It has smooth coefficients and is linear in its displayed arguments. Its origin, and not merely its regularity, will be used in the focusing calculation. We also have

#[#set math.equation(numbering: n => "(8.3)")
 $ u gt.eq \| X \| \, #h(2em) mu_m gt.eq \| J_m \| \, #h(2em) u mu_m + J_m \( X \) = 0 . $ <var:singular-complementarity>]

=== 8.1 Local leaf measures and atomic sheets <local-leaf-measures-and-atomic-sheets>

Fix a free regular incidence point $\( D \, p \)$. The uniform graph conclusion of Proposition 42, after shrinking its neighborhood, provides nested open spatial boxes

$ p in W subset.double V subset.double U \, #h(2em) W = B_0 times I_0 \, $

in coordinates $\( y \, t \)$, and a larger base ball $B_1 supset overline(B_0)$, with the following property. Every minimizing frontier that meets $V$ has in $U$ a unique selected graph $t = f_F \( y \)$ over $B_1$; all portions of that frontier in $W$ belong to this graph. Its graph over $B_1$ lies in the coordinate chart, and the graphs have uniform interior smooth bounds and are mutually disjoint unless they coincide. The boxes can be chosen with this property by first taking the uniform graph neighborhood and then choosing the middle and inner boxes with positive margin from its side and top faces.

Put

$ cal(H)_V = { F in cal(F)_(*) : "frontier" \( F \) ∩ V eq.not diameter } . $

This is an open subset of the minimizing family. Indeed convergence in that compact family is strict perimeter convergence, hence its perimeter measures converge weakly. If the limit frontier meets the open set $V$, its perimeter measure is positive on a nonnegative compactly supported test in $V$, and the same holds for every sufficiently late member of the sequence. This proves openness. The uniform density bounds also give local Hausdorff convergence of the frontier supports: a putative boundary point staying a positive distance from the limit frontier would force positive volumes of both phases in a ball where the limit is constant, contradicting local $L^1$ convergence.

The graph map

$ q_V : cal(H)_V arrow.r C^oo \( B_1 \) \, #h(2em) q_V \( F \) = f_F \, $

is continuous for the topology of smooth convergence on compact subsets. To see this, apply regular multiplicity-one convergence at the limiting graph on each compact subball; the uniform graph bounds and uniqueness identify every subsequential limit. Define the finite Borel measure

$ lambda_V = \( q_V \)_(*) \( pi \|_(cal(H)_V) \) $

on the entire separable metrizable function space $C^oo \( B_1 \)$. This definition identifies coincident local graphs without requiring the image of $q_V$ to be a Borel subset of that space. We write $cal(G)$ for this leaf-parameter space and $lambda$ for $lambda_V$ when the box is fixed.

Every source contribution on $W$ is retained: a frontier meeting $W$ also meets $V$, and is therefore in $cal(H)_V$. No arbitrary neighborhood of the reference minimizer is used to truncate this measure. Distinct realized graph parameters are disjoint, so for each $y in B_1$ the map

#[#set math.equation(numbering: n => "(8.4)")
 $ ell mapsto f_ell \( y \) $ <var:injective-leaf-evaluation>]

is injective on the realized leaves. All integrals with respect to $lambda$ mean the corresponding pushforward integrals over $cal(H)_V$; the injectivity assertion concerns the realized graphs in those integrals.

#thm([Lemma 8.1.])[
  (Atomic leaves).  #emph[If $lambda \( { ell_0 } \) > 0$, the corresponding regular sheet is totally geodesic on $"graph" \( f_(ell_0) \) ∩ W$.]
] <var:atomic-leaves>

#proof[
  Fix any point of $"graph" \( f_(ell_0) \) ∩ W$ and take signed normal-distance coordinates $\( y \, s \)$ about that sheet on a smaller patch compactly contained in $W$, writing the sheet as $Sigma = { s = 0 }$. Put $m_0 = lambda \( { ell_0 } \) > 0$. The $s s$ equation in (8.2) is a one-dimensional second-derivative equation after slicing by almost every normal line. The bounded nonmeasure terms include $B$ and the coordinate connection terms. The atom at $s = 0$ has coefficient $c m_0 \/ 2$: on the reference graph the unit conormal is $d s$ and the sheet and volume Jacobians agree at $s = 0$. No other graph produces an atom there, by (8.4). Consequently $partial_s u$ has bounded one-sided traces $v^plus.minus \( y \)$ for almost every $y$, and
  #[#set math.equation(numbering: n => "(8.5)")
   $ v^(+) \( y \) - v^(-) \( y \) = c / 2 m_0 . $ <var:atomic-normal-jump>]
  The existence and boundedness of these traces can also be read directly from local semiconvexity of $u$ along the normal lines.
  We compare the tangential equations from the two sides. Let $A_s$ be the second fundamental form of the parallel sheet ${ s = upright("constant") }$, with normal $partial_s$. With $A_s \( V \, W \) = g \( nabla_V partial_s \, W \)$,
  #[#set math.equation(numbering: n => "(8.6)")
   $ \( nabla^2 u \) \|_(T Sigma_s) = nabla_(Sigma_s)^2 \( u \|_(Sigma_s) \) + A_s partial_s u . $ <var:tangential-hessian-splitting>]
  Average this identity on each of $0 < s < epsilon$ and $- epsilon < s < 0$, pairing with any smooth compactly supported tangential tensor in the $y$ variables. The intrinsic Hessian terms have the same limit: integrate twice in $y$, then use uniform convergence of $u \( y \, s \)$ to $u \( y \, 0 \)$ and smooth convergence of the parallel metrics. The $B$ terms also have the same limit, since $u \, X \, nabla X$ are continuous.
  The averaged tangential components of the sheet measure tend to zero. Indeed the conormal of a nearby graph has tangential component bounded by $C \| s \|$ relative to $Sigma$ at a point of height $s$. This is the graph-difference estimate recalled above, with the smooth change from graph coordinates to normal coordinates included. Thus in a slab of width $epsilon$ the tangential-tangential source is bounded in total variation by $C epsilon^2$ times the total sheet measure in a fixed box. Dividing by $epsilon$ still gives a quantity tending to zero. The atom on $Sigma$ itself has no tangential component.
  Subtracting the two limits in (8.6) gives $A_0 \( v^(+) - v^(-) \) = 0$ as a tensor distribution on $Sigma$. Equation (8.5) and $c m_0 > 0$ imply $A_0 = 0$. The sheet is smooth, so the conclusion holds at every point of the patch. ◻
]

#thm([Lemma 8.2.])[
  (A common Jacobi field).  #emph[Let $D$ belong to the full-measure family above, and let $Sigma$ be a connected component of its regular interior frontier. Suppose one of its graph patches is a nonatom in the support of the corresponding leaf measure. Then there is a smooth function $phi > 0$ on $Sigma$ such that 
#[#set math.equation(numbering: n => "(8.7)")
 $ L_0 phi = L_(+) phi = L_(-) phi = 0 . $ <var:three-jacobi-equations>]

 Here $L_0$, $L_(+)$, and $L_(-)$ are the outward normal linearizations of $H$, $H + "tr"_(upright("tan")) K$, and $H - "tr"_(upright("tan")) K$, respectively, at $Sigma$. All have principal part $- Delta_Sigma$, and 
#[#set math.equation(numbering: n => "(8.8)")
 $ L_0 = - Delta_Sigma - #scale(x: 120%, y: 120%)[\(] \| A_Sigma \|^2 + "Ric"_g \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] . $ <var:minimal-jacobi>]

]
] <var:common-jacobi>

#proof[
  Choose a base point $p$ in the specified patch. Since its graph parameter is a nonatom in the support of the leaf measure, choose distinct realized graphs converging smoothly on compact subpatches to the reference graph, with representatives $D_j$ in the full-measure family. Such representatives exist because every graph neighborhood has positive pushforward measure, whereas the reference fiber has measure zero. Compactness of $cal(F)_(*)$ permits passing to a subsequence with $D_j arrow.r D'$ for some minimizing filled set $D'$. We do not assert that $D' = D$ away from the selected component.
  The limiting frontier of $D'$ contains the reference graph near $p$. Indeed points on the converging graphs are frontier points of $D_j$, and uniform density and local $L^1$ convergence put their limits on the frontier of $D'$. Set
  $ C = Sigma ∩ "frontier" \( D' \) . $
  This set is nonempty and relatively closed in $Sigma$. It is also relatively open: at each of its points the reference frontier is free and regular, and the common-sheet property of Proposition 42 makes the frontier of $D'$ agree with it in a neighborhood. Connectedness gives $C = Sigma$. In particular every point of $Sigma$ is a regular point of the limiting frontier $D'$.
  Choose a nested exhaustion of $Sigma$ by connected precompact smooth domains $Omega_m$ containing $p$, with $overline(Omega_m) subset Omega_(m + 1)$; if $Sigma$ is compact, use $Sigma$ itself. Use the fixed normal of $Sigma$ and its normal exponential map on a tubular neighborhood of each compact stage. Regular multiplicity-one convergence to $D'$ gives, for sufficiently large $j$ at that stage, a unique normal height $h_j$ over $Omega_m$. A finite covering of the slightly larger compact stage by regular graph patches supplies this assertion uniformly on $overline(Omega_m)$. Uniqueness on each normal fiber makes the heights agree on overlaps and on successive exhaustion stages. Thus there is no choice of branch or monodromy in this construction.
  The heights have a strict constant sign on each connected stage. If $h_j$ vanished at a point, the common-sheet property would make its zero set relatively open as well as closed there; connectedness would force coincidence at $p$, contrary to the distinct initial graphs. Passing to a subsequence fixes the sign at $p$, and hence on every exhaustion stage. Replace $h_j$ by $- h_j$ in the linear difference equations if that sign is negative, and normalize by $h_j \( p \) > 0$. The equations $H = 0$ and $"tr"_(upright("tan")) K = 0$ are unaffected by choosing the fixed graph normal, even if a representative filled set induces the opposite orientation on its local graph. Subtract the three graph equations (8.1). The integral of the linearization along the segment between the two graphs gives linear elliptic equations for $h_j$, whose coefficients converge smoothly on compact subsets to those of $L_0 \, L_(+) \, L_(-)$. Harnack’s inequality and interior elliptic estimates applied to the first equation bound $h_j \/ h_j \( p \)$ above and below, with all derivatives, on each exhaustion stage. A diagonal subsequence converges smoothly to $phi$, with $phi \( p \) = 1$. Harnack’s inequality gives positivity. Passing to the limit in all three equations proves (8.7). The same argument applies when the approach is from the other side, since all three linearized equations are homogeneous. ◻
]

The support qualification in this lemma loses no multiplier mass. On each graph box the complement of the support of $lambda$ has zero $lambda$-measure. A countable collection of such boxes suffices for the regular incidence set, as explained below.

=== 8.2 Focusing with a measure-valued Hessian <focusing-with-a-measure-valued-hessian>

#thm([Lemma 8.3.])[
  (Weak focusing).  #emph[On a free regular sheet satisfying (8.1), define 
#[#set math.equation(numbering: n => "(8.9)")
 $ Q_(+) = u - g \( X \, nu \) \, #h(2em) Q_(-) = u + g \( X \, nu \) . $ <var:Q-definitions>]

 These functions are nonnegative and locally Lipschitz. On the open part of the sheet where $u > 0$, they satisfy the distributional inequalities 
#[#set math.equation(numbering: n => "(8.10)")
 $ L_plus.minus Q_plus.minus lt.eq - u \| A_Sigma plus.minus K_(upright("tan")) \|^2 . $ <var:weak-focusing-inequalities>]

]
] <var:weak-focusing>

#proof[
  We first identify the sign of the singular term in the stationary curvature calculation. For smooth positive $u$ and smooth $X$, set
  #[#set math.equation(numbering: n => "(8.11)")
   $ upright(bold(g)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) \, #h(2em) upright(bold(n)) = u^(- 1) \( partial_z - X \) . $ <var:local-stationary-metric>]
  The second fundamental form of a stationary slice is $b = - "sym" nabla X \/ u$, with the convention for $K$ used in the theorem. Define $sans(B) \( P \, Q \) = P : Q - \( "tr" P \) \( "tr" Q \)$. Integrating the momentum term in the gravitational constraint pairing at fixed lapse and shift gives the algebraic expression
  #[#set math.equation(numbering: n => "(8.12)")
   $ u #scale(x: 120%, y: 120%)[\(] R_g - sans(B) \( K \, K \) + 2 sans(B) \( K \, b \) #scale(x: 120%, y: 120%)[\)] & = u #scale(x: 120%, y: 120%)[\(] R_g + sans(B) \( b \, b \) - sans(B) \( K - b \, K - b \) #scale(x: 120%, y: 120%)[\)] . $ <var:stationary-action-identity>]
  At $b = K$ its first metric variation agrees with that of the stationary scalar-curvature action, up to divergences. The spatial metric coefficient of that variation is $- u upright(bold(G))_(i j)$, where $upright(bold(G))$ is the Einstein tensor of (8.11). This identity can equally be obtained by substituting $b = - "sym" nabla X \/ u$ and integrating the derivatives of a compactly supported metric variation; it uses no field equation.
  Let $sans(S)$ be the Maxwell stress of a two-form whose slice electric field is $c_n E$ and whose slice magnetic part is zero. Only these slice values are needed here. Holding the electric flux form fixed under $g' = h$ gives
  #[#set math.equation(numbering: n => "(8.13)")
   $ delta #scale(x: 120%, y: 120%)[\(] 2 u c_n^2 \| E \|^2 thin d V_g #scale(x: 120%, y: 120%)[\)] = u c_n^2 \( 2 E_i E_j - \| E \|^2 g_(i j) \) h^(i j) thin d V_g = - u sans(S)_(i j) h^(i j) thin d V_g . $ <var:fixed-flux-stress>]
  Adding the variation of the volume density in the full matter pairing does not alter the adjoint coefficient, by $u mu_m + J_m \( X \) = 0$. Transport of a unit-ball ray contributes $- \( J_m \)_(\( i) X_(j \))$, where parentheses include the factor $1 \/ 2$. It follows from the actual metric-adjoint expression in (8.2) that a Hessian source $M$ contributes
  #[#set math.equation(numbering: n => "(8.14)")
   $ u \( upright(bold(G)) - sans(S) \)_(i j) = - \( J_m \)_(\( i) X_(j \)) + #scale(x: 120%, y: 120%)[\(] \( "tr"_g M \) g - M #scale(x: 120%, y: 120%)[\)]_(i j) . $ <var:stress-trace-reversal>]
  For a positive semidefinite $M$, the last tensor is positive semidefinite: for a unit vector $v$, complete $v$ to an orthonormal basis and sum $M$ on the remaining basis vectors. In particular the sign is preserved by trace reversal in precisely this direction.
  The lower Hessian term can be read off explicitly. Write $tau_b = "tr"_g b$ and $\( b^2 \)_(i j) = b_i zws^l b_(l j)$. The spatial stationary Einstein identity is
  #[#set math.equation(numbering: n => "(8.15)")
   $ u upright(bold(G))_(i j) & = \( Delta_g u \) g_(i j) - \( nabla_g^2 u \)_(i j) + \( cal(C)_b \)_(i j) \,\
cal(C)_b & = u ["Ric"_g + tau_b b - 2 b^2 - 1 / 2 \( R_g + tau_b^2 + \| b \|^2 \) g] - cal(L)_X b + X \( tau_b \) g . $ <var:explicit-spatial-einstein>]
  At $b = K$, put $T = u sans(S) - "sym" \( J_m ⊗ X^flat \) - cal(C)_K$. Equation (8.14) then gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ B \( u \, X \, nabla X \) = frac("tr"_g T, n - 1) g - T . $ <var:explicit-lower-hessian>]
  Thus $B$ has no $d u$ term. All its coefficients are smooth fixed-data coefficients multiplying $u \, X \, nabla X$. For the mollified pair, the same identity with $b = b_epsilon.alt$ shows that $C^1$ convergence of $b_epsilon.alt$ controls every non-Hessian spatial term.
  We justify the use of this calculation at the regularity of (8.2). Fix relatively compact coordinate patches $U' subset.double U subset.double { u > 0 }$, and choose $a > 0$ with $u gt.eq a$ on $U$. All smoothing below is performed in $U$, then restricted to $U'$. Let $rho_epsilon.alt$ be a nonnegative standard mollifier, and convolve the coordinate components of $u$ and $beta = X^flat$: $u_epsilon.alt = u * rho_epsilon.alt$, $beta_epsilon.alt = beta * rho_epsilon.alt$, $X_epsilon.alt = g^(- 1) beta_epsilon.alt$. The spatial metric is not changed. In components the first equation of (8.2) reads $partial_(\( i) beta_(j \)) = Gamma_(i j)^l beta_l - u K_(i j)$. Hence the residual
  #[#set math.equation(numbering: n => "(8.17)")
   $ R_epsilon.alt := "sym" nabla beta_epsilon.alt + u_epsilon.alt K = \( Gamma beta \) * rho_epsilon.alt - Gamma beta_epsilon.alt - \( u K \) * rho_epsilon.alt + u_epsilon.alt K $ <var:KID-mollifier-residual>]
  tends to zero in $C^1 \( U' \)$. More explicitly, for a smooth coefficient $A$ and a Lipschitz function $f$,
  #[#set math.equation(numbering: n => "(8.18)")
   $ parallel \( A f \) * rho_epsilon.alt - A \( f * rho_epsilon.alt \) parallel_(C^1 \( U' \)) lt.eq C epsilon.alt #scale(x: 120%, y: 120%)[\(] parallel A parallel_(C^2 \( U \)) parallel f parallel_(L^oo \( U \)) + parallel A parallel_(C^1 \( U \)) parallel D f parallel_(L^oo \( U \)) #scale(x: 120%, y: 120%)[\)] . $ <var:C1-commutator>]
  For its derivative, differentiate the product to obtain the sum of the commutator of $D A$ with $f$ and the commutator of $A$ with $D f$. Both are bounded by the first moment of $rho_epsilon.alt$ times the displayed norms. No second derivative of $f$ is used. Since $u_epsilon.alt gt.eq a \/ 2$ and $D u_epsilon.alt$ is uniformly bounded,
  #[#set math.equation(numbering: n => "(8.19)")
   $ b_epsilon.alt := - "sym" nabla X_epsilon.alt \/ u_epsilon.alt = K - R_epsilon.alt \/ u_epsilon.alt arrow.r K quad upright("in ") C^1 \( U' \) . $ <var:b-mollifier-convergence>]
  In the Hessian equation, first express the measure-valued components relative to coordinate Lebesgue measure, dividing by the smooth positive volume density. Positivity is unchanged. Convolve this already un-trace-reversed equation. It gives
  #[#set math.equation(numbering: n => "(8.20)")
   $ nabla_g^2 u_epsilon.alt = B_epsilon.alt + cal(M)_epsilon.alt + \( Gamma thin d u \) * rho_epsilon.alt - Gamma thin d u_epsilon.alt \, #h(2em) B_epsilon.alt arrow.r B quad upright("uniformly on ") U' . $ <var:Hessian-mollifier>]
  The connection commutator is $O \( epsilon.alt \)$ in $C^0$ because $d u$ is bounded. For every $x$, $cal(M)_epsilon.alt \( x \)$ is a positive semidefinite matrix. We trace this matrix using $g \( x \)$ only after convolution. Consequently
  #[#set math.equation(numbering: n => "(8.21)")
   $ P_epsilon.alt \( x \) := \( "tr"_(g \( x \)) cal(M)_epsilon.alt \( x \) \) g \( x \) - cal(M)_epsilon.alt \( x \) gt.eq 0 $ <var:exact-PSD-reversal>]
  exactly, even if its norm diverges as $epsilon.alt arrow.b 0$. There is no product commutator involving a variable metric times an unbounded singular Hessian.
  Apply the smooth stationary calculation to $u_epsilon.alt \, X_epsilon.alt$ and $b_epsilon.alt$. Formula (8.19) controls the induced constraint densities and all the non-Hessian spatial adjoint terms uniformly. Indeed (8.15) uses only $b_epsilon.alt \, nabla b_epsilon.alt \, u_epsilon.alt \, X_epsilon.alt \, nabla X_epsilon.alt$ outside the Hessian term. Equation (8.16) shows that uniform convergence of $d u_epsilon.alt$ is unnecessary. Writing $upright(bold(T))_epsilon.alt = upright(bold(G))_epsilon.alt - sans(S)_epsilon.alt$, we obtain uniformly on $U'$
  #[#set math.equation(numbering: n => "(8.22)")
   $ upright(bold(T))_epsilon.alt \( upright(bold(n))_epsilon.alt \, upright(bold(n))_epsilon.alt \) & = mu_m + o \( 1 \) \, & upright(bold(T))_epsilon.alt \( upright(bold(n))_epsilon.alt \, dot.op \) \|_(T U') & = J_m + o \( 1 \) \,\
u_epsilon.alt \( upright(bold(T))_epsilon.alt \)_(i j) & = - \( J_m \)_(\( i) X_(j \)) + \( P_epsilon.alt \)_(i j) + o \( 1 \) . &  & $ <var:smoothed-stress-blocks>]
  To see the null sign of the bounded terms, when $mu_m > 0$, (7.13) forces $\| X \| = u$ and $J_m = - mu_m X^flat \/ u$. Their limiting block tensor is $mu_m ell ⊗ ell$, with $ell \( upright(bold(n)) \) = 1$ and $ell \( V \) = - g \( X \, V \) \/ u$. When $mu_m = 0$, all its blocks vanish. This description, or the direct formula $u mu_m \( 1 minus.plus g \( X \, nu \) \/ u \)^2$, proves nonnegativity on $upright(bold(n)) plus.minus nu$. Maxwell stress is also nonnegative on null vectors. The exact positivity of $P_epsilon.alt$ therefore gives
  #[#set math.equation(numbering: n => "(8.23)")
   $ u_epsilon.alt "Ric"_(upright(bold(g))_epsilon.alt) \( upright(bold(n))_epsilon.alt plus.minus nu \, upright(bold(n))_epsilon.alt plus.minus nu \) gt.eq - o \( 1 \) . $ <var:mollified-null-Ricci>]
  This is a one-sided estimate; it requires no uniform bound on the full spacetime curvature.
  For completeness, apply the null shape-operator equation to the outgoing null geodesics orthogonal to the fixed sheet in the smooth metric $upright(bold(g))_epsilon.alt$. Use nearby stationary slices as the parameter surfaces. At the initial slice the null velocity with $d z \/ d tau = 1$ is $u_epsilon.alt \( upright(bold(n))_epsilon.alt + nu \)$. Subtracting the stationary translation $partial_z$ leaves the spatial velocity $u_epsilon.alt nu - X_epsilon.alt$, whose normal component is $u_epsilon.alt - g \( X_epsilon.alt \, nu \)$. The Riccati equation gives the expansion derivative
  #[#set math.equation(numbering: n => "(8.24)")
   $ - u_epsilon.alt #scale(x: 120%, y: 120%)[\(] \| A_Sigma + \( b_epsilon.alt \)_(upright("tan")) \|^2 + "Ric"_(upright(bold(g))_epsilon.alt) \( upright(bold(n))_epsilon.alt + nu \, upright(bold(n))_epsilon.alt + nu \) #scale(x: 120%, y: 120%)[\)] \, $ <var:smoothed-focusing-formula>]
  up to a bounded renormalization factor times the initial expansion. Tangential transport contributes a bounded tangential velocity times the tangential derivative of that expansion. Both error terms tend to zero uniformly: $H + "tr"_Sigma K = 0$ and $b_epsilon.alt arrow.r K$ in $C^1$. The spatial expansion linearization has coefficients converging uniformly to those of $L_(+)$. Its principal part is always the fixed $- Delta_Sigma$; convergence of its action on $u_epsilon.alt - g \( X_epsilon.alt \, nu \)$ therefore holds in distributions, using uniform convergence of these functions and uniform bounds on their first derivatives. Combining (8.23)–(8.24) proves the plus inequality in (8.10). Replace the future normal by $- upright(bold(n))_epsilon.alt$, equivalently reverse stationary time and $X_epsilon.alt \, b_epsilon.alt$, to obtain the minus inequality. Since $U' subset.double { u > 0 }$ was arbitrary, this proves the stated local result. ◻
]

=== 8.3 Positive Jacobi fields at singular ends <positive-jacobi-fields-at-singular-ends>

We give the analytic details needed at singular points. Their purpose is stronger than removability of a bounded subsolution: a bounded reciprocal Jacobi field must tend to zero at every singular end.

#thm([Lemma 8.4.])[
  (Capacity and a local mean-value estimate).  #emph[Let $T$ be a multiplicity-one locally perimeter-minimizing hypersurface in a compact smooth ambient patch, of dimension $k gt.eq 3$. Its singular set has zero surface $2$-capacity. A bounded nonnegative continuous function $w$ on the regular part, satisfying $Delta_T w gt.eq - C_0$ there, extends weakly across the singular set and satisfies, for sufficiently small ambient balls centered on $"supp" T$, 
#[#set math.equation(numbering: n => "(8.25)")
 $ sup_(T ∩ B_(r \/ 2)) w lt.eq C [(r^(- k) integral_(T ∩ B_r) w^2 thin d A)^(1 \/ 2) + C_0 r^2] . $ <var:surface-submean>]

 The supremum is over regular points. Constants are uniform in a fixed compact patch, and under its sufficiently small rescalings. The assertion also holds for a function defined on one regular component and extended by zero on the other components.]
] <var:capacity-submean>

#proof[
  The singular dimension bound is $k - 7$, and local perimeter bounds give $"Area" \( T ∩ B_rho \) lt.eq C rho^k$; see #cite(label("SimonGMT2014")). If the singular set is nonempty, cover a compact part of it by balls $B_(r_i)$ with $r_i$ arbitrarily small and $sum_i r_i^(k - 2)$ arbitrarily small. Choose cutoffs equal to one on $B_(r_i)$, supported on $B_(2 r_i)$, with gradient bounded by $C \/ r_i$. The maximum of these cutoffs has Dirichlet energy at most $C sum_i r_i^(k - 2)$ and support of area tending to zero. Truncation and smooth approximation produce cutoffs $chi_j$, vanishing near the singular set and tending to one almost everywhere, with
  #[#set math.equation(numbering: n => "(8.26)")
   $ integral \| nabla_T chi_j \|^2 thin d A arrow.r 0 . $ <var:capacity-cutoffs>]
  The same construction applies on compact cone annuli and their spherical links, where the singular link dimension is at most $k - 8$.
  On the regular part, test the subsolution inequality by $eta^2 chi_j^2 w$, using smooth approximations or positive truncations if needed. Integration by parts and Young’s inequality bound the Dirichlet integral of $w$ on smaller patches by
  #[#set math.equation(numbering: n => "(8.27)")
   $ integral eta^2 chi_j^2 \| nabla_T w \|^2 lt.eq C parallel w parallel_oo^2 integral #scale(x: 120%, y: 120%)[\(] \| nabla_T eta \|^2 + eta^2 \| nabla_T chi_j \|^2 #scale(x: 120%, y: 120%)[\)] + C C_0 parallel w parallel_oo integral eta^2 . $ <var:subsolution-Caccioppoli>]
  Thus $w$ has locally square-integrable weak gradient across the singular set. In a bounded compact test, the extra terms containing $nabla chi_j$ tend to zero by Cauchy–Schwarz and (8.26). This proves the weak extension. The same proof on any union of regular components is valid, since its boundary within the support lies in the singular set.
  The Michael–Simon surface Sobolev inequality #cite(label("MichaelSimon1973")), applied in coordinate or isometrically embedded compact patches, gives for compactly supported $v$
  #[#set math.equation(numbering: n => "(8.28)")
   $ (integral \| v \|^(2 k \/ \( k - 2 \)) thin d A)^(\( k - 2 \) \/ k) lt.eq C integral #scale(x: 120%, y: 120%)[\(] \| nabla_T v \|^2 + v^2 #scale(x: 120%, y: 120%)[\)] thin d A . $ <var:surface-Sobolev>]
  The ambient embedding contributes a uniformly bounded mean-curvature term. The inequality extends to the above weak functions by the same capacity cutoffs. After scaling a ball to radius one, apply the energy estimate to successive positive powers of $w + C_0 r^2$ and nested radial cutoffs. The Sobolev exponent multiplies each power by $k \/ \( k - 2 \)$; the resulting geometric iteration gives the $L^2$-to-$L^oo$ estimate (8.25). All constants depend only on the ambient patch, dimension, and perimeter bound. Their scaled versions remain bounded as $r arrow.b 0$. ◻
]

#thm([Lemma 8.5.])[
  (A bounded cone subsolution vanishes).  #emph[Let $C subset bb(R)^(k + 1)$ be a nonflat, multiplicity-one, perimeter-minimizing boundary cone. A bounded nonnegative continuous function $z$ on its entire regular part satisfying 
#[#set math.equation(numbering: n => "(8.29)")
 $ Delta_C z gt.eq \| A_C \|^2 z $ <var:cone-subsolution-equation>]

 in distributions is identically zero. The function may be zero on some regular components.]
] <var:cone-subsolution>

#proof[
  Only $k gt.eq 7$ can occur. Let $L = C ∩ bb(S)^k$ be the link, let $s = log r$, and put $V = \| A_L \|^2$. The inequality becomes
  #[#set math.equation(numbering: n => "(8.30)")
   $ z_(s s) + \( k - 2 \) z_s + Delta_L z gt.eq V z . $ <var:log-radius-inequality>]
  We first justify testing across the singular link. On each compact axial slab, the Caccioppoli test $eta^2 chi_j^2 z$ gives local $W^(1 \, 2)$ bounds and a bound for $integral V eta^2 chi_j^2 z^2$; the axial first-order term is bounded by the same energy inequality. Passing through the capacity cutoffs of Lemma 49 proves the weak inequality across the singular set. Testing with a nonnegative function equal to one on a smaller slab also bounds $integral V z$ there. Positivity allows Fatou’s lemma for this term. The terms involving $nabla chi_j$ tend to zero by the energy bound and (8.26). These observations justify integration of (8.30) over the whole link against any nonnegative compactly supported axial test.
  In particular the bounded nonnegative function $q \( s \) = integral_L z \( s \, theta \) thin d A_L \( theta \)$ satisfies
  #[#set math.equation(numbering: n => "(8.31)")
   $ q'' + \( k - 2 \) q' gt.eq 0 $ <var:log-radius-monotonicity>]
  on the whole real line. Convolve in $s$. Each smooth bounded convolution satisfies the same inequality, so $e^(\( k - 2 \) s) q' \( s \)$ is nondecreasing for that convolution. If $q' \( s_0 \) < 0$, then for $s < s_0$ $q' \( s \) lt.eq q' \( s_0 \) e^(\( k - 2 \) \( s_0 - s \))$. Integrating backward contradicts boundedness. Thus every convolution is nondecreasing, and the original $q$ has a nondecreasing representative. If $z$ is nonzero, its forward limit $q_oo$ is strictly positive.
  Choose $w in C_c^oo \( \( 1 \, 2 \) \)$, $w gt.eq 0$, with integral one, and put $w_T \( s \) = T^(- 1) w \( s \/ T \)$. The functions
  #[#set math.equation(numbering: n => "(8.32)")
   $ overline(z)_T \( theta \) = integral_(bb(R)) w_T \( s \) z \( s \, theta \) thin d s $ <var:forward-average>]
  are bounded uniformly, and their integrals tend to $q_oo$. Take a weak-star convergent subsequence in $L^oo \( L \)$ with limit $overline(z) gt.eq 0$. For a compactly supported nonnegative regular link test $psi$, integration by parts in $s$ bounds the axial terms by $parallel z parallel_oo parallel psi parallel_(L^1 \( L \)) \( parallel w''_T parallel_1 + \( k - 2 \) parallel w'_T parallel_1 \)$, which tends to zero. Therefore
  #[#set math.equation(numbering: n => "(8.33)")
   $ Delta_L overline(z) gt.eq V overline(z) \, #h(2em) integral_L overline(z) thin d A_L = q_oo > 0 . $ <var:averaged-link-inequality>]
  Bounded subsolution regularity and the capacity argument give the needed local weak derivatives. Test this inequality by $chi_j^2 overline(z)$ and use Young’s inequality to obtain
  #[#set math.equation(numbering: n => "(8.34)")
   $ 1 / 2 integral_L chi_j^2 \| nabla_L overline(z) \|^2 + integral_L V chi_j^2 overline(z)^2 lt.eq 2 parallel overline(z) parallel_oo^2 integral_L \| nabla_L chi_j \|^2 arrow.r 0 . $ <var:link-energy-vanishing>]
  Thus $overline(z)$ is constant on every connected regular component of $L$, and a positive constant can occur only on a totally geodesic component.
  We show that a nonflat minimizing boundary cone has no such component. A connected totally geodesic regular component lies in an equator $Q tilde.equiv bb(S)^(k - 1)$. It is relatively open there; its relative boundary lies in the singular set, since at a regular boundary point the same smooth sheet continues. A closed set of Hausdorff dimension less than $\( k - 1 \) - 1$ does not disconnect $Q$: in coordinate balls one connects points by polygonal paths whose vertices are chosen outside the measure-zero exceptional sets of segments meeting that set, and then concatenates such paths. Here the singular set has dimension at most $k - 8$. It follows that this component contains $Q$ minus the singular set, and its closure contains the entire equator.
  Any other regular component lies strictly in one open hemisphere determined by $Q$. It cannot meet $Q$ at a regular point without being part of the same regular sheet. On that component the signed coordinate height $h$ is strictly of one sign and satisfies $Delta_L h = - \( k - 1 \) h$. It and its gradient are bounded. Integrate against capacity cutoffs, extended by zero on other components. The boundary terms tend to zero by Cauchy–Schwarz; hence $integral h = 0$, a contradiction. There are no other regular components. Regular points are dense in the support, and multiplicity one now says that $C$ is the plane through $Q$. The componentwise interpretation is also consistent with the decomposition of a multiplicity-one oriented minimizing boundary into minimizing regular components; see #cite(label("SimonGMT2014")) Chapter 7, Section 5, Corollary 5.11 and Remark 5.12. This contradicts nonflatness. Therefore (8.33) is impossible and $z = 0$. ◻
]

#thm([Lemma 8.6.])[
  (Reciprocal Jacobi decay).  #emph[Let $Sigma$ be a connected regular component of a compact interior minimizing frontier, and let $phi > 0$ solve (8.8). Then 
#[#set math.equation(numbering: n => "(8.35)")
 $ inf_Sigma phi > 0 \, #h(2em) phi \( x \) arrow.r + oo quad upright("as ") x in Sigma upright(" approaches the singular set") . $ <var:Jacobi-singular-behavior>]

 The second assertion is vacuous for a smooth compact component.]
] <var:reciprocal-jacobi>

#proof[
  The Ricci curvature is bounded on a compact neighborhood of the frontier; choose $C$ with $"Ric"_g \( nu \, nu \) gt.eq - C$. For $delta > 0$ put $w_delta = \( 1 - phi \/ delta \)_(+)$ on $Sigma$, and extend it by zero on other regular components. Convex truncation of the Jacobi equation gives $Delta w_delta gt.eq - C$; on ${ phi < delta }$ this follows from $- Delta phi \/ delta = \( \| A \|^2 + "Ric" \( nu \, nu \) \) phi \/ delta gt.eq - C$, and the truncation contributes a nonnegative measure. Moreover $0 lt.eq w_delta lt.eq 1$ and $w_delta arrow.r 0$ almost everywhere as $delta arrow.b 0$.
  Choose first a fixed radius $r > 0$ so small that the $C r^2$ term in (8.25), including its constant, is less than $1 \/ 4$. Cover the compact frontier by finitely many balls of radius $r \/ 2$. Dominated convergence in their radius-$r$ enlargements then permits choosing $delta > 0$ so that the integral term is less than $1 \/ 4$ in every ball. Thus $w_delta lt.eq 1 \/ 2$ on $Sigma$, and $phi gt.eq delta \/ 2$. This proves the first assertion with the required order of choices, $r$ before $delta$.
  Set $z = 1 \/ phi$ and extend it by zero to the other regular components. It is bounded and satisfies
  #[#set math.equation(numbering: n => "(8.36)")
   $ Delta_Sigma z = #scale(x: 120%, y: 120%)[\(] \| A \|^2 + "Ric"_g \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] z + 2 phi^(- 3) \| nabla_Sigma phi \|^2 gt.eq \( \| A \|^2 - C \) z . $ <var:reciprocal-inequality>]
  Fix a singular point $p$ and any sequence of scales $r_j arrow.b 0$. Pass to a subsequence along which the rescaled frontiers converge to a multiplicity-one minimizing tangent cone $C_p$. The cone is nonflat: a multiplicity-one planar tangent cone would imply regularity of the frontier at $p$. These are the standard compactness and excess-regularity conclusions for minimizing boundaries #cite(label("SimonGMT2014")).
  On compact subsets of the regular cone the convergence is smooth. The rescaled $z$ have subsequences converging locally uniformly to a bounded nonnegative function $z_0$. Here is a useful precise way to obtain this convergence. On a connected regular patch, either $z$ tends to zero at one base point, in which case Harnack for the positive Jacobi function $phi$ forces $z arrow.r 0$ on smaller patches, or $z$ stays bounded below there along a subsequence. In the latter case the same Harnack inequality and interior estimates bound $phi$ and its derivatives, giving smooth convergence of $z$. The uniform upper bound for $z$ was already established. Branches on which the zero extension is used cause no difficulty; choose the branch in each regular patch and diagonalize. Thus one obtains $z_0$ on the whole regular cone, allowing zero components. Scaling (8.36) and passing to regular patches gives $Delta_(C_p) z_0 gt.eq \| A_(C_p) \|^2 z_0$. Lemma 50 implies $z_0 = 0$.
  This regular convergence implies vanishing of the normalized $L^2$ integral of $z$ on each fixed bounded rescaled ball. To check points near the singular cone, first discard a small neighborhood of that set and of the cone vertex. Their limiting area can be made arbitrarily small. Area convergence and the uniform bound for $z$ control the discarded part, while smooth regular convergence controls its complement. The scaled version of (8.25), with source bounded by $C r_j^2 parallel z parallel_oo$, now gives uniform decay on smaller balls.
  In particular, if $x_j in Sigma$ tends to $p$, choose scales $r_j$ comparable to $d_g \( x_j \, p \)$. The preceding argument and the mean-value estimate show $z \( x_j \) arrow.r 0$; any contrary subsequence would have a tangent-cone subsequence of the type just treated. A sequence approaching the compact singular set has a subsequence tending to a particular singular point. Applying this fixed-point argument to that subsequence proves the uniform sequential assertion in (8.35). ◻
]

=== 8.4 Diffuse mass at a zero lapse and the final curvature bound <diffuse-mass-at-a-zero-lapse-and-the-final-curvature-bound>

#thm([Lemma 8.7.])[
  (No diffuse leaf mass on the zero set).  #emph[In a uniform graph box, let $lambda^(upright("na"))$ denote the nonatomic part of its leaf measure. Let 
$ cal(Z)_W = { ell : "graph" \( f_ell \) ∩ W eq.not diameter \, med u = 0 upright(" on ") "graph" \( f_ell \) ∩ W } . $

 Then 
#[#set math.equation(numbering: n => "(8.37)")
 $ lambda^(upright("na")) \( cal(Z)_W \) = 0 . $ <var:diffuse-zero-claim>]

]
] <var:diffuse-zero-mass>

#proof[
  On $W = B_0 times I_0$, the coordinate $t t$ equation in (8.2) is the following equality of measures:
  #[#set math.equation(numbering: n => "(8.38)")
   $ partial_t^2 u = b \( y \, t \) thin d y thin d t + d y integral_(cal(G)) w \( ell \, y \) upright(bold(1))_(I_0) \( f_ell \( y \) \) delta_(f_ell \( y \)) \( d t \) thin d lambda \( ell \) . $ <var:graph-disintegration>]
  Here $y in B_0$ and the left side and bounded-density term are restricted to $W$ as measures. The indicator records the restriction of the graph measure to the working $t$-interval; it is not a differentiation of a characteristic function. The density $b$ is bounded, and $0 < w_0 lt.eq w \( ell \, y \) lt.eq w_1$ for the contributing graphs. The weight is $c \/ 2$ times the squared conormal on $partial_t$, times the graph area Jacobian, divided by the volume Jacobian. All contributions on $W$ are included because their frontiers lie in $cal(H)_V$. Pairing with product tests and using the graph area formula proves the display; measure approximation then gives its linewise disintegration.
  For almost every $y$, $t mapsto u \( y \, t \)$ is Lipschitz and its derivative $v_y = partial_t u \( y \, dot.op \)$ is a one-dimensional BV function. This follows from the sliced equation, or from semiconvexity and Fubini. Write $Z_y = { t : u \( y \, t \) = 0 }$. At any point of $Z_y$ where the two one-sided precise values of $v_y$ agree, their common value is zero: a nonzero common value would contradict the nonnegative minimum of the primitive $u \( y \, dot.op \)$ at that point. The diffuse derivative of a one-dimensional BV function does not charge a fixed precise-value level. In the usual $D^a v + D^c v$ notation this locality statement is
  #[#set math.equation(numbering: n => "(8.39)")
   $ \| D^a v + D^c v \| #scale(x: 120%, y: 120%)[\(] { tilde(v) = 0 } #scale(x: 120%, y: 120%)[\)] = 0 \; $ <var:BV-level-locality>]
  it follows from the BV chain rule, or directly from the one-dimensional coarea formula; see #cite(label("AmbrosioDeLellisMaly2007")) Proposition 8, equation (16). Consequently the diffuse part of $D v_y$ gives no mass to $Z_y$. The countably many jump points do not affect that assertion.
  The bounded term $b$ is zero almost everywhere on ${ u = 0 }$. Indeed $X = 0$ there by $u gt.eq \| X \|$, and the first derivatives of $u$ and $X$ vanish almost everywhere on their respective zero sets. Thus the linear expression $B \( u \, X \, nabla X \)$ and the connection term involving $d u$ both vanish almost everywhere there. Fubini gives $b \( y \, dot.op \) = 0$ almost everywhere on $Z_y$ for almost every line.
  Finally, by (8.4) the pushforward of $w \( ell \, y \) d lambda^(upright("na")) \( ell \)$ under $ell mapsto f_ell \( y \)$ is atomless for every $y$. All line atoms of the area source in (8.38) therefore come from transverse atoms of $lambda$; there are no hidden atoms produced by the evaluation map. On almost every line, restrict the diffuse part of (8.38) to $Z_y$ and use (8.39) and the preceding vanishing of $b$. It follows that
  #[#set math.equation(numbering: n => "(8.40)")
   $ integral_(cal(G)) w \( ell \, y \) upright(bold(1))_(I_0) \( f_ell \( y \) \) upright(bold(1))_({ u \( y \, f_ell \( y \) \) = 0 }) thin d lambda^(upright("na")) \( ell \) = 0 $ <var:linewise-zero-mass>]
  for almost every $y$. The integrand is defined to be zero whenever $f_ell \( y \) in.not I_0$, so $u$ is evaluated only inside $W$. For each leaf set
  $ m_W \( ell \) = integral_(B_0) w \( ell \, y \) upright(bold(1))_(I_0) \( f_ell \( y \) \) thin d y . $
  This quantity is strictly positive whenever its graph meets $W$: that intersection projects to a nonempty open subset of $B_0$, and $w gt.eq w_0 > 0$. A uniform positive lower bound for $m_W$ over all leaves is neither asserted nor needed. Integrate (8.40) in $y$ and use Tonelli’s theorem. On $cal(Z)_W$ the result is
  $ integral_(cal(Z)_W) m_W \( ell \) thin d lambda^(upright("na")) \( ell \) = 0 . $
  Strict positivity of $m_W$ there gives $lambda^(upright("na")) \( cal(Z)_W \) = 0$, proving the claim. ◻
]

#thm([Proposition 8.8.])[
  (Elimination of the interior area multiplier).  #emph[Under the hypotheses above and the exclusion of a smooth interior enclosing frontier with zero future expansion in Definition 6, the measure $pi$ is concentrated on the given boundary: 
#[#set math.equation(numbering: n => "(8.41)")
 $ pi = delta_S \, #h(2em) integral_(cal(F)_(*)) a'_D \( h \) thin d pi \( D \) = a'_S \( h \) . $ <var:pi-boundary-only>]

 Here $delta_S$ denotes the point mass at the filled minimizer whose frontier is $S$.]
] <var:area-elimination>

#proof[
  First consider a connected regular component $Sigma$ with a nonatomic support patch. Choose the common field $phi$ of Lemma 47. The functions $Q_plus.minus$ of (8.9) are bounded on the compact frontier. By Lemma 51, $Q_plus.minus \/ phi$ tends to zero at every singular end. If one of these ratios is positive somewhere, it therefore attains a positive maximum at a regular interior point. This is also immediate when $Sigma$ is smooth and compact.
  Write $Q_plus.minus = phi v$. For an operator $L = - Delta + b dot.op nabla + d$ with $L phi = 0$, direct product differentiation gives
  #[#set math.equation(numbering: n => "(8.42)")
   $ L \( phi v \) = phi [- Delta v + \( b - 2 nabla log phi \) dot.op nabla v] . $ <var:ground-state-transform>]
  At any point where $Q_plus.minus > 0$, one has $u > 0$, so Lemma 48 applies. The weak strong maximum principle for the locally Lipschitz $v$ and the smooth coefficients in (8.42) implies that $v$ is constant at its positive maximum on the connected component of ${ Q_plus.minus > 0 }$ containing that point. This component is also closed in $Sigma$: at a regular limit point, $Q_plus.minus = v phi > 0$ by continuity. Since $Sigma$ is connected, it is all of $Sigma$. Substitution in (8.10) then gives
  #[#set math.equation(numbering: n => "(8.43)")
   $ A_Sigma plus.minus K_(upright("tan")) = 0 \, #h(2em) \| A_Sigma \| lt.eq \| K \| . $ <var:sheet-curvature-bound>]
  The weak maximum principle used here is the ordinary local elliptic one, for example #cite(label("GilbargTrudinger2001")); no maximum principle on an unresolved singular boundary is used. If neither ratio is positive anywhere, $Q_(+) = Q_(-) = 0$ on $Sigma$, hence $u = 0$ there and $X = 0$ there by domination. Lemma 52 excludes multiplier mass on this alternative in every nonatomic patch. In atomic patches Lemma 46 already gives $A = 0$.
  We make the exceptional set independent of the regular incidence point. The open inner boxes $W$ constructed above cover all free regular points of all minimizing frontiers. Their union is an open subset of the second-countable ambient manifold, so choose a countable subcover $W_i$, retaining the corresponding middle boxes $V_i$ and graph maps $q_i$ on the open families $cal(H)_(V_i)$. In particular the open sets $cal(H)_(V_i) times W_i$ cover the regular incidence set in the family-times-manifold topology.
  For each $i$ let $lambda_i = \( q_i \)_(*) \( pi \|_(cal(H)_(V_i)) \)$, let $cal(A)_i$ be its countable set of atoms, and let $cal(Z)_i = cal(Z)_(W_i)$ be the zero-leaf set from Lemma 52. These are measurable sets. For the last assertion, the condition that a graph meets $W_i$ is open in the graph topology. The condition that $u$ vanishes on its intersection with $W_i$ can be checked at a countable dense set of base points: failure gives, by continuity, an open base set on which the graph stays inside $W_i$ and $u > 0$. Thus it is a Borel condition.
  The set
  $ cal(N)_i = #scale(x: 120%, y: 120%)[\(] C^oo \( B_(1 \, i) \) \\ "supp" lambda_i #scale(x: 120%, y: 120%)[\)] union \( cal(Z)_i \\ cal(A)_i \) $
  has $lambda_i$-measure zero, since the second term has $lambda_i$-measure $lambda_i^(upright("na")) \( cal(Z)_i \) = 0$. Consequently
  $ pi #scale(x: 120%, y: 120%)[\(] { F in cal(H)_(V_i) : q_i \( F \) in cal(N)_i } #scale(x: 120%, y: 120%)[\)] = 0 . $
  Remove the countable union of these pullbacks, together with the already excluded null set in the good family. For a remaining frontier and any of its regular points $p$, choose $i$ with $p in W_i$. Its leaf is either an atom, giving $A = 0$ locally, or a nonatom in the support of $lambda_i$. In the latter case the common Jacobi argument applies on its entire connected regular component. If that component had $u = 0$ everywhere, the leaf would belong to $cal(Z)_i \\ cal(A)_i$, which was removed. Therefore the positive-ratio alternative gives $\| A \| lt.eq \| K \|$. This proves the curvature bound simultaneously at every regular point of every remaining frontier. In particular,
  #[#set math.equation(numbering: n => "(8.44)")
   $ \| A \| lt.eq sup_(cal(K)) \| K \| \, $ <var:uniform-frontier-curvature>]
  where $cal(K)$ is a common compact set containing the minimizing frontiers.
  Fix such an interior frontier and any proposed singular point. Blow it up at scales tending to zero. The tangent cone is a multiplicity-one minimizing boundary cone, with smooth convergence on its regular part. The rescaled bound (8.44) tends to zero, so every regular component of the cone is totally geodesic. The equator and height argument in Lemma 50 shows that the cone is a plane. Multiplicity-one planar tangent regularity contradicts the point being singular. The entire compact frontier is therefore smooth.
  This frontier is a genuine enclosing cut. In particular the minimizing filled set has no removable bounded open component of its complement: filling one would preserve the obstacle condition and strictly reduce its full perimeter. Its components carry the outward normals of that enclosing set, and (8.1) gives zero future expansion on every component. The assumed exclusion of a smooth interior enclosing marginal frontier rules it out. Consequently $pi$-almost every frontier is $S$. The filled set with frontier $S$ and the prescribed obstacle is unique modulo null sets, and $pi$ is a probability. This proves (8.41). ◻
]

=== 8.5 Smooth stationarity and the boundary laws <smooth-stationarity-and-the-boundary-laws>

We finish the original-data variation argument. The lapse $u$ and shift $X$ in the following proposition are the measure moments constructed above; they are unrelated to the lapse notation used locally in the filled scalar construction.

#thm([Proposition 8.9.])[
  (Stationary data supplied by equality).  #emph[ There are smooth fields $u \, X$ on $Omega$, including $S$, with $u gt.eq \| X \|$, $u > 0$ in the open exterior and 
#[#set math.equation(numbering: n => "(8.45)")
 $ "sym" nabla X = - u K \, #h(2em) u mu_m + J_m \( X \) = 0 . $ <var:smooth-kid-complementarity>]

 For any sufficiently small decrease $q_0 < q$ with $q_0 > \( n - 2 \) \/ 2$, their end behavior is 
#[#set math.equation(numbering: n => "(8.46)")
 $ \( u \, X \) = \( b^0 \, b^i \) + O_2 \( r^(- q_0) \) . $ <var:lapse-shift-end>]

 On $bb(R)_z times "int" Omega$ set 
#[#set math.equation(numbering: n => "(8.47)")
 $ upright(bold(g)) = - u^2 upright(d) z^2 + g_(i j) \( upright(d) x^i + X^i upright(d) z \) \( upright(d) x^j + X^j upright(d) z \) \, #h(2em) xi = partial_z \, #h(2em) upright(bold(F)) = c_n upright(d) z and u E^flat . $ <var:stationary-product>]

 The stationary fields satisfy Maxwell’s equations and 
#[#set math.equation(numbering: n => "(8.48)")
 $ "Ein"_(upright(bold(g))) - sans(S) = mu_m u^(- 2) xi^flat ⊗ xi^flat \, #h(2em) sans(S)_(a b) = 2 (upright(bold(F))_(a c) upright(bold(F))_b zws^c - 1 / 4 upright(bold(F))_(c d) upright(bold(F))^(c d) upright(bold(g))_(a b)) . $ <var:stationary-einstein>]

 The extra term is zero unless $xi$ is null. The original slice has future normal $N = \( partial_z - X \) \/ u$ and induces exactly $\( g \, K \, E \)$, with $upright(bold(F))$ restricting to zero on it. There is a global smooth function $p$, including up to $S$, with 
#[#set math.equation(numbering: n => "(8.49)")
 $ upright(d) p = \( k - 1 \) u E^flat \, #h(2em) p \( oo \) = 0 \, #h(2em) p = O_2 \( r^(2 - n) \) \, #h(2em) upright(d) \( i_X alpha \) = 0 . $ <var:potential-maxwell>]

]
  #emph[Let $kappa = c \/ 2 > 0$. On $S$ the boundary laws are 
#[#set math.equation(numbering: n => "(8.50)")
 $ X = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa \, #h(2em) c H = 2 L_(+)^(*) u \, $ <var:horizon-boundary-laws>]

 where $L_(+)$ is the outward normal linearization of $H + "tr"_S K$, and its adjoint uses $upright(d) A_g$. Either $u > 0$ on all of $S$, or $u = 0$ on all of $S$. The nonnegative function $W = u^2 - \| X \|^2$ tends to one at infinity, vanishes on $S$, and is strictly positive in a deleted collar of $S$. If $u > 0$ on $S$, then 
#[#set math.equation(numbering: n => "(8.51)")
 $ upright(d) W = 2 kappa X^flat quad upright("on ") S . $ <var:positive-lapse-boundary>]

 If $u = 0$ on $S$, writing $s$ for exterior distance from $S$, there are smooth fields $a_(*) \, Y_(*)$ such that 
#[#set math.equation(numbering: n => "(8.52)")
 $ u = s a_(*) \, #h(2em) X = s^2 Y_(*) \, #h(2em) a_(*) \|_S = kappa . $ <var:zero-lapse-boundary>]

 No assertion of a Lorentzian extension across the zero-lapse boundary is made at this stage.]
] <var:stationary-data>

#proof[
  #emph[Smoothness and boundary moments.] Proposition 53 removes the interior surface measure from (7.18). Together with the differentiated KID equation, the resulting equations express all second derivatives of $u \, X$ as smooth linear expressions in their first jets. Ordinary elliptic regularity makes them smooth in the open exterior. The full first-jet system is closed; along the normals of a smooth collar it is a linear ODE with smooth coefficients. Starting on an interior collar face, solve that ODE to $S$. Smooth dependence on the tangential parameters gives smooth extension of all fields and their jets. This argument also shows that a zero full first jet at one interior point would force the solution to vanish throughout the connected open exterior.
  There can still, at this point, be constraint moment measures supported on $S$. Integrate the smooth interior fields by parts in (7.11). Take $K' = 0$ and both form variations zero, and choose a metric test with value and first jet zero at $S$. The trace of its normal second derivatives in the tangential slots is arbitrary, so its scalar-curvature variation at $S$ is arbitrary. Its area and expansion variations, all integrated interior boundary terms, momentum variation and ray-transport terms at $S$ vanish. Equation (7.11) therefore kills the scalar boundary moment. Positivity and domination of the vector moment by the scalar moment kill the vector boundary moment as well. Henceforth the moments in that identity are just the smooth functions $u \, X$ times volume.
  #emph[The end constants and positive lapse.] The closed first-jet system gives, for $Y = \( u \, X \)$ in end coordinates,
  #[#set math.equation(numbering: n => "(8.53)")
   $ \| D^2 Y \| lt.eq C r^(- 1 - q) \| D Y \| + C r^(- 2 - q) \| Y \| . $ <var:end-jet-estimate>]
  Indeed curvature, $nabla K$, $K^2$, the constraints and the electric stress multiply values, whereas $K$ and metric first derivatives multiply first derivatives. These orders require only the stated $O_2 \/ O_1$ tails. Radial integration and Gronwall first give $Y = O \( r \)$ and $D Y = O \( 1 \)$: write $\| Y \( r \) \|$ as its initial value plus the radial integral of $\| D Y \|$ and use the integrability of $r^(- 1 - q)$. Equation (8.53) now gives a limit of $D Y$ on each ray with error $O \( r^(- q) \)$. The limits agree on all rays, since integration of $D^2 Y$ along a path of length $O \( r \)$ on a large sphere gives an $O \( r^(- q) \)$ difference. Denote the common linear part by $cal(A)$.
  The scalar affine part cannot be nonzero: $u gt.eq 0$ on all large spheres. Once that part is zero, $\| X \| lt.eq u$ rules out every growing vector affine part as well. Thus $cal(A) = 0$. Since $n gt.eq 4$ and $q > \( n - 2 \) \/ 2$, we have $q > 1$. Integration gives bounded $Y$, a common constant limit $Y_oo$, and initially $Y - Y_oo = O \( r^(1 - q) \)$. Reinserting boundedness in (8.53) improves the Hessian to $O \( r^(- 2 - q) \)$, and two integrations give $Y - Y_oo = O_2 \( r^(- q) \)$. The stated weaker exponent $q_0$ is therefore available.
  Apply (7.11) to the end prototypes and integrate by parts on large truncations. The interior adjoint equations and the compact boundary terms cancel. Only the constant scalar multiplying the linear scalar ADM flux, and twice the constant vector multiplying the linear momentum flux, remain. All other boundary terms vanish by (8.53), the prototype orders and the background decay. The surviving identity is
  #[#set math.equation(numbering: n => "(8.54)")
   $ 2 k omega #scale(x: 120%, y: 120%)[\(] b^0 delta cal(E)_(upright("ADM")) + b^i delta \( upright(bold(P))_(upright("ADM")) \)_i #scale(x: 120%, y: 120%)[\)] = 2 k omega #scale(x: 120%, y: 120%)[\(] u_oo delta cal(E)_(upright("ADM")) + X_oo^i delta \( upright(bold(P))_(upright("ADM")) \)_i #scale(x: 120%, y: 120%)[\)] . $ <var:prototype-normalization>]
  The prototype fluxes span all entries, proving (8.46). If $u$ vanished at an interior point, smooth nonnegativity would give $upright(d) u = 0$ there. Domination would give $X = 0$ and $nabla X = 0$ there as well, since $\| X \| lt.eq u = O \( d^2 \)$. The full-jet uniqueness noted above would contradict $u_oo = b^0 > 0$. Thus $u > 0$ in the interior.
  #emph[The stationary Einstein equation.] The stationary metric in (8.47) has second fundamental form $b = - "sym" nabla X \/ u = K$ on each slice. We recall the metric-adjoint computation, now with no interior area source. Put $cal(Q) \( A \, B \) = A : B - \( "tr" A \) \( "tr" B \)$. Integration of the momentum pairing gives
  #[#set math.equation(numbering: n => "(8.55)")
   $ u #scale(x: 120%, y: 120%)[\(] R_g - cal(Q) \( K \, K \) + 2 cal(Q) \( K \, b \) #scale(x: 120%, y: 120%)[\)] = u #scale(x: 120%, y: 120%)[\(] R_g + cal(Q) \( b \, b \) - cal(Q) \( K - b \, K - b \) #scale(x: 120%, y: 120%)[\)] . $ <var:stationary-action>]
  At $b = K$ its metric first variation equals that of the stationary scalar action, at fixed lapse and shift, up to the integrated divergence. Its spatial coefficient is $- u "Ein"_(i j)$. Equation (7.20) supplies the electromagnetic coefficient. The variation of the constraint volume factor vanishes by complementarity, and isometric transport of the active unit-ball rays adds $- \( J_m \)_(\( i) X_(j \))$. Thus
  #[#set math.equation(numbering: n => "(8.56)")
   $ u \( "Ein" - sans(S) \)_(i j) = - \( J_m \)_(\( i) X_(j \)) . $ <var:spatial-einstein-adjoint>]
  Gauss–Codazzi gives the remaining normal and mixed components as $mu_m \, J_m$. Where $mu_m = 0$, DEC gives $J_m = 0$. Where $mu_m > 0$, equality in
  $ - J_m \( X \) lt.eq \| J_m \| \| X \| lt.eq mu_m u $
  forces $\| X \| = u$ and $J_m = - mu_m X^flat \/ u$. Consequently all components combine to give (8.48), and the extra matter can occur only at $W = 0$.
  #emph[Maxwell tests and a global potential.] Test (7.11) with the metric and second tensor fixed and a compactly supported closed variation of $alpha$. The resulting identity, after dividing by the nonzero factor $4 c_n^2$, is
  #[#set math.equation(numbering: n => "(8.57)")
   $ integral_Omega u E^flat and alpha' = 0 quad upright("for every compactly supported closed ") \( n - 1 \) upright("-form ") alpha' . $ <var:electric-form-test>]
  Exact tests imply $upright(d) \( u E^flat \) = 0$. All closed tests, not only exact ones, are available. Compact-support de Rham duality on the oriented open manifold $"int" Omega$ therefore makes $u E^flat$ exact; see #cite(label("BottTu1982")). This step does not presume simple connectivity. Define $p$ by $upright(d) p = \( k - 1 \) u E^flat$. Since $u$ is bounded at infinity and $E = O_1 \( r^(- k) \)$, radial integration and integration along large spheres give one common limit of $p$ at infinity and $p - p_oo = O_2 \( r^(2 - n) \)$. Choose $p_oo = 0$. Integration in local collars extends $p$ smoothly to $S$.
  Independent closed compact two-form tests of $D_m$ give
  #[#set math.equation(numbering: n => "(8.58)")
   $ integral_Omega D'_m and i_X alpha = 0 \, #h(2em) upright("and hence") #h(2em) upright(d) \( i_X alpha \) = 0 . $ <var:magnetic-form-test>]
  The degree of $i_X alpha$ is $n - 2$, so this pairing and its differential have the required degrees in every dimension. With orientation $"vol"_(upright(bold(g))) = u upright(d) z and "vol"_g$, a direct orthonormal-frame computation gives
  #[#set math.equation(numbering: n => "(8.59)")
   $ *_(upright(bold(g))) upright(bold(F)) = - c_n #scale(x: 120%, y: 120%)[\(] alpha + upright(d) z and i_X alpha #scale(x: 120%, y: 120%)[\)] . $ <var:star-field>]
  Equations (8.57), (8.58) and $upright(d) alpha = 0$ therefore give both Maxwell equations. Contraction of $upright(bold(F))$ with $N = \( partial_z - X \) \/ u$ and pullback to a slice yields $c_n E^flat$; its spatial pullback is zero. This verifies all conventions in the claimed original-data realization.
  #emph[Boundary laws.] The outward integration normal of $Omega$ at $S$ is $- nu$. The boundary coefficient of a free second-tensor variation in (7.11) is
  #[#set math.equation(numbering: n => "(8.60)")
   $ - 2 "sym" \( X^flat ⊗ nu^flat \) + 2 X_nu g - frac(upright(d) zeta, upright(d) A_g) \( g - nu^flat ⊗ nu^flat \) . $ <var:boundary-pairing-k>]
  Interpreting this first as an equality of measures, its tangential and mixed entries show $X_(upright("tan")) = 0$ and $upright(d) zeta = 2 X_nu upright(d) A_g$. Now use compact scalar tests with $\( h \, K' \) = \( 2 s g \, s K \)$ and the forms fixed. Their constraint differential terms are $- 2 k u Delta s + 2 k K \( X \, nabla s \)$; the other terms cancel by the interior adjoint equation. Since $theta_(+) = 0$, their expansion derivative is $k partial_nu s$, while their area derivative is $k integral_S s$. Thus
  #[#set math.equation(numbering: n => "(8.61)")
   $ - k c integral_S s thin upright(d) A_g = 2 k integral_S [u partial_nu s - \( partial_nu u + K \( X \, nu \) \) s] upright(d) A_g - k integral_S partial_nu s thin upright(d) zeta . $ <var:boundary-conformal-pairing>]
  The boundary value and normal derivative of $s$ are independent. The derivative coefficient gives $u = X_nu$, and the value coefficient gives $partial_nu u + K \( X \, nu \) = c \/ 2$.
  For the last boundary identity, take Lie variations of all the data along a vector field extending arbitrary $s nu$ on $S$. Such tests are legitimate field variations on the fixed manifold: the jets may be defined by a smooth extension across $S$; no flow preserving the boundary is asserted. The active interior constraints have zero first variation by spatial transport at a minimum of their nonnegative contractions. The induced rotation of the transported unit ball contributes zero for the same reason. The area and expansion derivatives at $S$ are, respectively, $integral_S H s$ and $L_(+) s$. Hence
  $ c integral_S H s thin upright(d) A_g = 2 integral_S u L_(+) s thin upright(d) A_g \, $
  which proves $c H = 2 L_(+)^(*) u$. One-sided outer area minimality gives $H gt.eq 0$ by nonnegative outward tests. The strong minimum principle for this smooth elliptic equation and $u gt.eq 0$ on connected $S$ gives the boundary dichotomy in the proposition.
  The boundary laws give $W = 0$ on $S$. If $u > 0$ there, differentiate $W$ and use (7.17); tangential derivatives vanish and
  $ partial_nu W = 2 u #scale(x: 120%, y: 120%)[\(] partial_nu u + u K \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] = 2 kappa u . $
  This is (8.51) and implies positivity in a deleted exterior collar. If $u = 0$ on $S$, then $X = 0$ there and $partial_nu u = kappa$. All tangential derivatives of $X$ vanish at $S$; the normal-normal and mixed parts of the KID equation then give $nabla_nu X = 0$ there. Smooth division by the boundary defining function gives (8.52). In particular $W = kappa^2 s^2 + O \( s^3 \) > 0$ in a deleted collar. Finally (8.46) and $\( b^0 \)^2 - \| b \|^2 = 1$ imply $W arrow.r 1$. ◻
]

On the positive set of $W$ it will be useful to introduce

#[#set math.equation(numbering: n => "(8.62)")
 $ lambda = sqrt(W) \, #h(2em) h_s = g + W^(- 1) X^flat ⊗ X^flat \,\
C = h_s^(- 1) = g^(- 1) - u^(- 2) X ⊗ X \, #h(2em) A_s = W^(- 1) X^flat . $ <var:orbit-metric>]

The stationary metric is then $upright(bold(g)) = - lambda^2 \( upright(d) z - A_s \)^2 + h_s$. These definitions are made only where $W > 0$; the next section proves global staticity and rules out interior zeros, rather than imposing either conclusion here.

== 9 Electric transport and the complete vacuum static base <stat:section>

The stationary development supplied by the preceding section need not initially have a timelike Killing field everywhere. We first transport the electric alignment from the boundary, and then prove staticity without making any regularity assumption on the zero set of the Killing norm. The charged case is reduced to vacuum by an explicit change of potential. In the zero-charge case, a complete Riemannian circle extension excludes an additional interior zero set. No black-hole uniqueness theorem is used in this section.

Throughout this section, $k = n - 1$, $c_n^2 = k \( k - 1 \) \/ 2$, and all spatial norms, divergences, and volume forms without a subscript refer to the original metric $g$. Write $Omega^compose = Omega \\ S$. We use Proposition 54, whose hypotheses are the connected nonextremal equality hypotheses of the main theorem. In particular, it supplies smooth functions and fields $u \, X \, p$ on the original exterior, with

#[#set math.equation(numbering: n => "(9.1)")
 $ u > 0 quad upright("on ") Omega^compose \, #h(2em) u gt.eq \| X \| \, #h(2em) d p = \( k - 1 \) u E^flat \, #h(2em) d \( i_X alpha \) = 0 \, #h(2em) alpha = i_E "vol"_g . $ <stat:interface-fields>]

The potential tends to zero at infinity. On $bb(R)_z times Omega^compose$ the stationary Lorentz metric and Faraday form are

#[#set math.equation(numbering: n => "(9.2)")
 $ upright(bold(g)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) \, #h(2em) F = c_n thin d z and u E^flat . $ <stat:stationary-metric>]

The Killing field is $xi = partial_z$, and its future unit normal to a constant-$z$ slice is $upright(bold(n)) = \( partial_z - X \) \/ u$. Both Maxwell equations hold. If $upright(bold(G))$ is the Einstein tensor and $sans(S)$ the electromagnetic stress tensor with the normalization fixed in the problem, the remaining matter tensor satisfies

#[#set math.equation(numbering: n => "(9.3)")
 $ upright(bold(G)) - sans(S) = mu_m u^(- 2) xi^flat ⊗ xi^flat \, #h(2em) mu_m = 0 quad upright("where ") u > \| X \| . $ <stat:remaining-matter>]

Set

#[#set math.equation(numbering: n => "(9.4)")
 $ W = u^2 - \| X \|^2 = - upright(bold(g)) \( xi \, xi \) gt.eq 0 \, #h(2em) kappa = frac(k - 1, 2 r_h) (1 - Q^2 / r_h^(2 \( k - 1 \))) > 0 . $ <stat:W-kappa>]

The boundary conclusions of Proposition 54 are

#[#set math.equation(numbering: n => "(9.5)")
 $ X = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa quad upright("on ") S \, #h(2em) W \|_S = 0 . $ <stat:boundary-laws>]

Either $u > 0$ on all of $S$, in which case $d W = 2 kappa X^flat$ there, or $u = 0$ on all of $S$. In the latter case, in the original distance $s$ into the exterior from $S$,

#[#set math.equation(numbering: n => "(9.6)")
 $ u = s a \, #h(2em) X = s^2 Y \, #h(2em) a \|_S = kappa \, $ <stat:zero-lapse-factors>]

with smooth $a \, Y$. Thus $W > 0$ on a deleted boundary collar in either case. On the end, for a fixed

#[#set math.equation(numbering: n => "(9.7)")
 $ frac(n - 2, 2) < q_0 < min \( q \, n - 2 \) \, $ <stat:end-exponent>]

we have

#[#set math.equation(numbering: n => "(9.8)")
 $ \( u \, X \) = \( b^0 \, b \) + O_2 \( r^(- q_0) \) \, #h(2em) \( b^0 \)^2 - \| b \|_delta^2 = 1 \, #h(2em) p = O_2 \( r^(2 - n) \) . $ <stat:end-interface>]

Decreasing $q_0$ while retaining (9.7) is harmless. These are the only conclusions from the preceding section used below.

=== 9.1 Boundary alignment and electric transport <boundary-alignment-and-electric-transport>

#thm([Lemma 9.1.])[
  (Global electric alignment).  #emph[The potential $p$ is constant on $S$, and 
#[#set math.equation(numbering: n => "(9.9)")
 $ X and E = 0 quad upright("throughout ") Omega . $ <stat:alignment>]

]
] <stat:electric-alignment>

#proof[
  Suppose first that $u > 0$ on $S$. The stationary metric is smooth and nondegenerate up to the hypersurface $bb(R) times S$. Equations (9.5) imply that $xi$ is a null normal to this hypersurface: it is null, is tangent to it, and is orthogonal to all its tangent vectors. Its null second fundamental form vanishes, since its flow preserves the metric induced on the transverse sections. The null expansion equation consequently gives $"Ric"_(upright(bold(g))) \( xi \, xi \) = 0$. This assertion only uses the one-sided smooth jets on the hypersurface. The nonaffine normalization of its null generators contributes a multiple of the expansion, which is zero.
  The extra tensor in (9.3) has zero contraction with $\( xi \, xi \)$ there. Maxwell null positivity therefore gives
  $ 0 = 2 \| i_xi F \|_(upright(bold(g)))^2 . $
  A covector annihilating a null vector has nonnegative Lorentz norm, and its norm is zero precisely when it is proportional to that null vector’s metric dual. Thus $i_xi F$ annihilates the tangent space of the horizon. Since $i_xi F = c_n u E^flat$, the tangential component of $E$ on $S$ is zero. Equations (9.1) and (9.5) give $X and E = 0$ and $d p \|_(T S) = 0$. If $u = 0$ on $S$, these two assertions follow immediately from $X = 0$ and $d p = \( k - 1 \) u E^flat$. Connectedness of $S$ gives a single boundary value, denoted by $p_b$.
  The divergence-free constraint and Cartan’s formula give
  $ 0 = d \( i_X alpha \) = cal(L)_X \( i_E "vol"_g \) = i_(\[ X \, E \] + \( "div" X \) E) "vol"_g . $
  In particular,
  #[#set math.equation(numbering: n => "(9.10)")
   $ \[ X \, E \] + \( "div" X \) E = 0 \, #h(2em) cal(L)_E \( X and E \) = 0 . $ <stat:electric-bracket>]
  Alignment therefore propagates along every nonzero electric trajectory once it is known at one point of that trajectory.
  Here is the measure argument ensuring sufficiently many boundary hits. Let $Pi$ be a relatively compact regular level patch $p = p_0 eq.not 0$ in the interior. Follow $V = "sgn" \( p_0 \) E$ from this patch until its first boundary hit, with maximal time $T \( y \) in \( 0 \, oo \]$. Along each trajectory $\| p \|$ increases strictly, because
  $ d p \( E \) = \( k - 1 \) u \| E \|^2 > 0 $
  where $E eq.not 0$. All these trajectories remain in a fixed compact subset of the original exterior: outside a sufficiently large coordinate sphere, $\| p \| < \| p_0 \|$. The trajectory map $\( t \, y \) mapsto Phi_t \( y \)$ is injective for $0 < t < T \( y \)$, by uniqueness of the flow and strict monotonicity of $p$.
  Let $d frak(f)$ be the positive transverse flux measure $i_V "vol"_g$ on $Pi$, oriented appropriately. Since $"div" V = 0$, the volume element in this flow tube is $d t thin d frak(f)$. Consequently
  #[#set math.equation(numbering: n => "(9.11)")
   $ integral_Pi T \( y \) thin d frak(f) \( y \) lt.eq "Vol"_g \( K_Pi \) < oo \, $ <stat:flow-time-volume>]
  where $K_Pi$ is the fixed compact region just described. Hence $T \( y \) < oo$ for almost every $y$ in flux measure. A finite-time trajectory cannot terminate in the interior of that compact region. This follows by smoothly extending the vector field locally and using ordinary differential equation existence. Nor can it reach a zero of $E$ at a finite time, by uniqueness. It therefore hits $S$ with $E eq.not 0$.
  Equation (9.10) transports the boundary alignment back to almost every point of $Pi$. The flux density is smooth and strictly positive on this regular patch, so continuity gives alignment on the whole patch. Varying the patch proves it at every point with $p eq.not 0$ and $E eq.not 0$. If $p = 0$ and $E eq.not 0$ at an interior point, the derivative of $p$ along $E$ is nonzero there, so such a point is a limit of the preceding points. At zeros of $E$ alignment is automatic. This proves (9.9). ◻
]

=== 9.2 Killing identities and a twist estimate through zero sets <killing-identities-and-a-twist-estimate-through-zero-sets>

On the open set $cal(U) = { W > 0 }$ define

#[#set math.equation(numbering: n => "(9.12)")
 $ lambda = sqrt(W) \, #h(2em) h_s = g + W^(- 1) X^flat ⊗ X^flat \,\
C = h_s^(- 1) = g^(- 1) - u^(- 2) X ⊗ X \, #h(2em) A_s = W^(- 1) X^flat \, #h(2em) F_s = d A_s . $ <stat:orbit-quantities>]

Here $C$ is written as a contravariant tensor on the original slice; it extends smoothly and is positive semidefinite everywhere in the interior. The stationary metric is

#[#set math.equation(numbering: n => "(9.13)")
 $ upright(bold(g)) = - lambda^2 \( d z - A_s \)^2 + h_s quad upright("on ") bb(R) times cal(U) . $ <stat:orbit-splitting>]

#thm([Lemma 9.2.])[
  (Killing curvature and flux identities).  #emph[Put $D_(a b) = bold(nabla)_a xi_b$, where $bold(nabla)$ is the Lorentz connection. Then 
#[#set math.equation(numbering: n => "(9.14)")
 $ "Ric"^a zws_b xi^b = - \( k - 1 \)^2 \| E \|^2 xi^a \, $ <stat:ricci-eigenvalue>]

 and, throughout the original open exterior, 
#[#set math.equation(numbering: n => "(9.15)")
 $ u^(- 1) "div" \( u C thin d W \) = - 2 D_(a b) D^(a b) + 2 "Ric" \( xi \, xi \) . $ <stat:killing-wave>]

 The smooth antisymmetric tensor $tilde(Q)^(i j) = u \( d xi^flat \)^(i j)$ satisfies $nabla_i tilde(Q)^(i j) = 0$. On $cal(U)$ it is 
#[#set math.equation(numbering: n => "(9.16)")
 $ Q^(i j) = u W C^(i a) C^(j b) \( F_s \)_(a b) . $ <stat:twist-current>]

]
] <stat:killing-identities>

#proof[
  In spacetime dimension $k + 2$, the electromagnetic trace reversal is
  $ "Ric"_(a b) = 2 F_(a c) F_b zws^c - 1 / k \( F_(c d) F^(c d) \) upright(bold(g))_(a b) $
  apart from the matter term in (9.3), which is trace-free wherever it is nonzero. In an orthonormal frame whose timelike vector is $upright(bold(n))$, the electric magnitude is $c_n \| E \|$. The mixed Ricci eigenvalue on the plane spanned by $upright(bold(n))$ and $E$ is therefore
  $ - 2 c_n^2 (1 - 1 / k) \| E \|^2 = - \( k - 1 \)^2 \| E \|^2 . $
  Lemma 55 places $xi = u upright(bold(n)) + X$ in this plane wherever $E eq.not 0$. The additional matter tensor annihilates $xi$, since it is supported where $upright(bold(g)) \( xi \, xi \) = 0$. The same formula holds at $E = 0$. This proves (9.14), including
  #[#set math.equation(numbering: n => "(9.17)")
   $ "Ric" \( xi \, xi \) = \( k - 1 \)^2 \| E \|^2 W . $ <stat:ricci-null-contraction>]
  For a Killing field, $D$ is skew and $bold(nabla)_a \( d xi^flat \)^(a b) = - 2 "Ric"^b zws_a xi^a$. Applying the Killing wave identity to $W = - upright(bold(g)) \( xi \, xi \)$ gives (9.15): a stationary scalar has wave operator $u^(- 1) "div" \( u C thin d thin dot.op \)$ because the spatial inverse block of $upright(bold(g))$ is $C$ and $"vol"_(upright(bold(g))) = u thin d z and "vol"_g$. The spatial components of the right side of the Killing divergence identity vanish by (9.14). Antisymmetry removes the remaining Christoffel term, and hence $nabla_i tilde(Q)^(i j) = 0$. Finally,
  $ xi^flat = - W \( d z - A_s \) \, #h(2em) d xi^flat = - d W and \( d z - A_s \) + W F_s . $
  Raising both spatial indices eliminates the first summand and gives (9.16). ◻
]

#thm([Lemma 9.3.])[
  (Vanishing twist).  #emph[The two-form $F_s$ vanishes on every component of $cal(U)$. No regularity of the interior set ${ W = 0 }$ is required.]
] <stat:vanishing-twist>

#proof[
  The interior zero set $Z_0 = { W = 0 } ∩ Omega^compose$ is compact, since $W arrow.r 1$ at infinity and is positive on a deleted boundary collar. On a fixed relatively compact neighborhood of $Z_0$, both $u$ and $\| X \|$ have positive lower bounds. Put $a = \| X \|$, $e = X \/ a$, and $T = e^perp$ there. The eigenvalues of $C$ are one on $T$ and $W \/ u^2$ on $e$. Smooth nonnegativity of $W$ implies the local estimate
  #[#set math.equation(numbering: n => "(9.18)")
   $ \| d W \|^2 lt.eq C_0 W . $ <stat:glaeser>]
  For completeness, this follows by restricting to short coordinate line segments, using a bound for the Hessian, and minimizing the resulting quadratic Taylor upper bound at a point where the function is nonnegative. A finite cover gives a uniform constant on the chosen neighborhood.
  Use a slice-orthonormal frame $\( e \, e_A \)$ and complete it by the future normal $upright(bold(n))$. Since $xi = u upright(bold(n)) + a e$,
  $ D_(i upright(bold(n))) = - frac(W_i \/ 2 + a D_(i e), u) . $
  An explicit expansion of the Lorentz norm gives
  #[#set math.equation(numbering: n => "(9.19)")
   $ - 2 D_(a b) D^(a b) =  & frac(\| d W \|^2, u^2) + frac(4 a, u^2) sum_A W_A D_(A e) - frac(4 W, u^2) sum_A D_(A e)^2 - 4 sum_(A < B) D_(A B)^2 . $ <stat:D-expansion>]
  The original fields and their derivatives are bounded on this fixed neighborhood. Equations (9.18), (9.17), and (9.15) therefore imply
  #[#set math.equation(numbering: n => "(9.20)")
   $ u^(- 1) "div" \( u C thin d W \) lt.eq C_1 #scale(x: 120%, y: 120%)[\(] W + \| d_T W \| #scale(x: 120%, y: 120%)[\)] . $ <stat:W-inequality>]
  Choose a smooth compactly supported $eta$ in this neighborhood. For $delta > 0$, test (9.20) with $eta^2 \/ \( W + delta \)$. There is no singular integration here: $C \, W$ are smooth and the denominator is positive. Integration by parts gives, with $L W = u^(- 1) "div" \( u C thin d W \)$,
  $ I_delta & := integral u eta^2 frac(\| d W \|_C^2, \( W + delta \)^2) = integral frac(u eta^2 L W, W + delta) + 2 integral frac(u eta thin C \( d eta \, d W \), W + delta) \,\
\| d W \|_C^2 & = \| d_T W \|^2 + W / u^2 #scale(x: 120%, y: 120%)[\(] d W \( e \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Since $0 lt.eq C lt.eq g^(- 1)$, Young’s inequality absorbs both the cutoff term and the $\| d_T W \| \/ \( W + delta \)$ term. Explicitly, each is at most $I_delta \/ 4$ plus a constant times $integral u \( eta^2 + \| d eta \|^2 \)$. The remaining $W \/ \( W + delta \)$ term is bounded. Consequently
  #[#set math.equation(numbering: n => "(9.21)")
   $ I_delta lt.eq C_eta quad \( 0 < delta < 1 \) \, #h(2em) integral_(cal(U)) eta^2 \| d_T log W \|^2 < oo . $ <stat:log-energy>]
  Take finitely many such cutoffs equal to one near $Z_0$.
  We record the exact flux used at the zero-set cutoff. Contract (9.16) with $A_s$, and lower the remaining index using $g$. Since $C X = \( W \/ u^2 \) X$, direct substitution of $F_s = d \( W^(- 1) X^flat \)$ gives
  #[#set math.equation(numbering: n => "(9.22)")
   $ J^i = Q^(i j) \( A_s \)_j \, #h(2em) J_i^flat = 1 / u (X^j \( d X^flat \)_(i j) - \| X \|^2 \( d_T log W \)_i) . $ <stat:exact-twist-flux>]
  In particular $J$ is exactly orthogonal to $X$, and near $Z_0$
  #[#set math.equation(numbering: n => "(9.23)")
   $ \| J \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| d_T log W \| #scale(x: 120%, y: 120%)[\)] . $ <stat:twist-flux-bound>]
  Choose a smooth cutoff $chi : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$, zero on $\[ 0 \, 1 \]$ and one on $\[ 2 \, oo \)$. A zero-set cutoff $z_delta$ can be chosen to equal $chi \( W \/ delta \)$ near $Z_0$ and one outside the fixed neighborhood. Indeed place the spatial localization transition on a compact set disjoint from $Z_0$; $W$ has a positive lower bound there, so for all sufficiently small $delta$ no transition derivative remains. On the support of $d z_delta$, transversality in (9.22) yields
  #[#set math.equation(numbering: n => "(9.24)")
   $ \| J \( d z_delta \) \| lt.eq C W / delta (\| d_T log W \| + \| d_T log W \|^2) lt.eq C (1 + \| d_T log W \|^2) . $ <stat:zero-cutoff-error>]
  This is supported where $delta < W < 2 delta$. Its integral tends to zero by (9.21) and dominated convergence. In particular, an open portion of $Z_0$ causes no omitted contribution: all test fields used below vanish on a neighborhood of it.
  Next choose a distance cutoff $beta_epsilon$ at $S$, zero for $s lt.eq epsilon$ and one for $s gt.eq 2 epsilon$, with derivative bounded by $C \/ epsilon$. If $u > 0$ on $S$, the boundary laws give
  $ W asymp s \, #h(2em) e = nu_s + O \( s \) \, #h(2em) d_T W = O \( s \) \, $
  where $nu_s = nabla s$. Thus $J = O \( 1 \)$ and $J dot.op nu_s = O \( s \)$ by its exact transversality. The resulting boundary error is $O \( epsilon \)$. If $u = 0$ on $S$, write
  $ W = s^2 w \, #h(2em) w = a^2 - s^2 \| Y \|^2 > 0 $
  using (9.6). Then $A_s = Y^flat \/ w$, $F_s$, and $C$ are smooth up to $S$. Equation (9.16) gives $Q = O \( s^3 \)$ and $J = O \( s^3 \)$, so the boundary error is $O \( epsilon^3 \)$.
  It remains to make the test field decay at infinity. In the end coordinates let $A_oo$ be the constant limit of $A_s$. Choose a smooth function
  $ psi \( x \) = rho \( r \) \( A_oo \)_i x^i \, $
  where $rho$ is zero near the compact core and one far out. Its support is chosen disjoint from the boundary and zero-set cutoff regions. Set $B = A_s - d psi$ on $cal(U)$. Then $d B = F_s$ and
  #[#set math.equation(numbering: n => "(9.25)")
   $ B = O_1 \( r^(- q_0) \) \, #h(2em) Q = O \( r^(- 1 - q_0) \) . $ <stat:twist-end-decay>]
  There is no bulk term from the transition of $psi$, since $Q^(i j) nabla_i nabla_j psi = 0$ by antisymmetry. If $theta_R$ is one for $r lt.eq R$, zero for $r gt.eq 2 R$, and $\| d theta_R \| lt.eq C \/ R$, its error is bounded by
  #[#set math.equation(numbering: n => "(9.26)")
   $ lr(|integral Q^(i j) B_j partial_i theta_R|) lt.eq C R^(n - 2 - 2 q_0) arrow.r 0 . $ <stat:twist-infinity-error>]
  Test $nabla_i tilde(Q)^(i j) = 0$ with $z_delta beta_epsilon theta_R B_j$, extended by zero where necessary. This is a smooth compactly supported test in the interior. Antisymmetry gives
  #[#set math.equation(numbering: n => "(9.27)")
   $ integral z_delta beta_epsilon theta_R thin cal(T)_(upright("tw")) & = - integral Q^(i j) B_j partial_i \( z_delta beta_epsilon theta_R \) \,\
cal(T)_(upright("tw")) & := 1 / 2 Q^(i j) \( F_s \)_(i j) = frac(u W, 2) C^(i a) C^(j b) \( F_s \)_(i j) \( F_s \)_(a b) gt.eq 0 . $ <stat:twist-test>]
  The three error estimates are independent of the other cutoffs, which lie between zero and one. Take $R arrow.r oo$, $epsilon arrow.b 0$, and $delta arrow.b 0$, or use a diagonal sequence. Fatou’s lemma in (9.27) gives $integral_(cal(U)) cal(T)_(upright("tw")) = 0$; its integrability need not be assumed beforehand. Since $C$ is positive definite on $cal(U)$, $F_s = 0$ there. ◻
]

=== 9.3 The charged polynomial and the regular base attachment <the-charged-polynomial-and-the-regular-base-attachment>

#thm([Lemma 9.4.])[
  (A global polynomial when the charge is nonzero).  #emph[If $Q eq.not 0$, then $p_b eq.not 0$, $0 < \| p_b \| < 1$, and 
#[#set math.equation(numbering: n => "(9.28)")
 $ W = 1 + p^2 + d_0 p = (1 - p / p_b) \( 1 - p_b p \) \, #h(2em) d_0 = - frac(1 + p_b^2, p_b) . $ <stat:W-polynomial>]

 Moreover $p$ lies strictly between $0$ and $p_b$ in the interior, and $W > 0$ everywhere in $Omega^compose$.]
] <stat:charged-polynomial>

#proof[
  The Maxwell equation in (9.1) gives
  #[#set math.equation(numbering: n => "(9.29)")
   $ "div" \( u^(- 1) nabla p \) = 0 . $ <stat:potential-equation>]
  Its coefficients are smooth and elliptic on every compact subset of the interior. A positive maximum above both boundary and end values, or a negative minimum below them, would be attained in such a subset. The strong maximum principle therefore applies without requiring a uniform boundary bound for $u^(- 1)$. If $p_b = 0$, it would give $p = 0$ and then $E = 0$, contrary to $Q eq.not 0$. Otherwise it gives the stated strict interval for $p$.
  There is a useful flux which is smooth even at interior zeros of $W$:
  #[#set math.equation(numbering: n => "(9.30)")
   $ cal(D)^i = u \( d xi^flat \)^(i z) = 1 / u (nabla^i W + X^j \( d X^flat \)^i zws_j) . $ <stat:global-Killing-flux>]
  The Killing divergence identity and (9.14) imply
  #[#set math.equation(numbering: n => "(9.31)")
   $ "div" cal(D) = 2 u^(- 1) \| d p \|^2 \, #h(2em) cal(D) dot.op X = u^(- 1) d W \( X \) . $ <stat:global-flux-laws>]
  On $cal(U)$, Lemma 57 and (9.30) also give
  #[#set math.equation(numbering: n => "(9.32)")
   $ cal(D) = u / W C thin d W . $ <stat:positive-Killing-flux>]
  Choose $d_0$ as in (9.28), and put
  $ P = W - 1 - p^2 - d_0 p \, #h(2em) j = cal(D) - \( 2 p + d_0 \) u^(- 1) nabla p . $
  Equations (9.29) and (9.31) give $"div" j = 0$. On $cal(U)$, alignment implies $C thin d p = \( W \/ u^2 \) nabla p$; hence
  #[#set math.equation(numbering: n => "(9.33)")
   $ j = u / W C thin d P \, #h(2em) d P \( j \) gt.eq u^(- 1) \| d P \|^2 . $ <stat:polynomial-energy>]
  Indeed the axial eigenvalue of $\( u \/ W \) C$ is $1 \/ u$, and its transverse eigenvalues are $u \/ W gt.eq 1 \/ u$. This also covers points where $X = 0$. At an interior zero of $W$, $d W = 0$ and $X eq.not 0$. Alignment makes $d p$ parallel to $X$, and (9.31) gives $cal(D) dot.op d p = 0$. Thus (9.33) holds there as well, with equality in its second assertion.
  The current $j$ is bounded up to $S$. This is immediate when $u > 0$ there. In the other case $d W = O \( s \)$ and $X^j \( d X^flat \)_(i j) = O \( s^3 \)$, so the quotient in (9.30) extends smoothly by $u = s a$. The other current is $u^(- 1) nabla p = \( k - 1 \) E$, already smooth. Since $P \|_S = 0$, a distance cutoff gives a boundary error tending to zero. At infinity,
  $ P = O_2 \( r^(- q_0) \) \, #h(2em) j = O \( r^(- 1 - q_0) \) \, $
  so the cutoff error in integrating $P "div" j$ is $O \( R^(n - 2 - 2 q_0) \)$. Testing with the product of the boundary and end cutoffs used above, and using nonnegativity in (9.33), gives
  $ integral_(Omega^compose) u^(- 1) \| d P \|^2 = 0 . $
  Thus $P$ is constant, and its limit at infinity is zero. This proves the first equality in (9.28).
  Its root at $p_b$ is simple. Otherwise $W = \( p - p_b \)^2$. If $u > 0$ on $S$, this contradicts $d W = 2 kappa X^flat eq.not 0$ there. If $u = 0$ on $S$, then $d p = \( k - 1 \) u E^flat$ gives $p - p_b = O \( s^2 \)$, whereas (9.6) gives $W = kappa^2 s^2 + O \( s^3 \)$, again a contradiction. Writing $p = t p_b$ with $0 < t < 1$, the polynomial becomes
  $ W = \( 1 - t \) \( 1 - p_b^2 t \) . $
  Every intermediate value is attained by continuity between the boundary and the end. Nonnegativity implies $p_b^2 lt.eq 1$, and simplicity excludes equality. The displayed formula then makes $W$ strictly positive at every interior point. ◻
]

#thm([Lemma 9.5.])[
  (Regular attachment of the orbit base).  #emph[On each positive component adjacent to $S$, the pair $\( h_s \, lambda \)$ has a smooth nondegenerate attachment at $S$. The attached boundary metric is $g \|_(T S)$, and 
#[#set math.equation(numbering: n => "(9.34)")
 $ lambda \|_S = 0 \, #h(2em) \| d lambda \|_(h_s) \|_S = kappa . $ <stat:base-boundary-gradient>]

 If $u > 0$ on $S$, the attachment uses coordinates $\( lambda \, y \)$ in place of original coordinates $\( W \, y \)$, and 
#[#set math.equation(numbering: n => "(9.35)")
 $ X^flat = frac(1, 2 kappa) d W + W beta $ <stat:positive-boundary-one-form>]

 for a smooth one-form $beta$ in the original collar. In these attached coordinates $h_s$ is smooth and invariant, as a tensor, under $lambda mapsto - lambda$. If $u = 0$ on $S$, the original smooth structure is retained, $lambda$ is a smooth defining function, and $A_s$ is smooth up to $S$.]
] <stat:base-attachment>

#proof[
  In the positive-$u$ case, $W$ is an original boundary defining function. Equation (9.35) follows from the boundary identity $d W = 2 kappa X^flat$ and smooth division by this defining function. More explicitly, write
  $ X^flat = b \( W \, y \) d W + W beta_A \( W \, y \) d y^A \, #h(2em) b \( 0 \, y \) = frac(1, 2 kappa) . $
  Upon setting $W = lambda^2$, the metric components are
  $ \( h_s \)_(lambda lambda) & = 4 lambda^2 g_(W W) + 4 b^2 \,\
\( h_s \)_(lambda A) & = 2 lambda \( g_(W A) + b beta_A \) \,\
\( h_s \)_(A B) & = g_(A B) + lambda^2 beta_A beta_B \, $
  where every coefficient on the right is evaluated at $\( lambda^2 \, y \)$. Normal and tangential diagonal coefficients are even and the mixed coefficients are odd, which is exactly tensor invariance under reflection. At $lambda = 0$ the normal coefficient is $kappa^(- 2)$, the mixed coefficients vanish, and the tangential metric is $g \|_(T S)$.
  In the zero-$u$ case, put $v = \( a^2 - s^2 \| Y \|^2 \)^(1 \/ 2)$ in a small original collar. Then
  $ lambda = s v \, #h(2em) h_s = g + s^2 v^(- 2) Y^flat ⊗ Y^flat \, #h(2em) A_s = v^(- 2) Y^flat . $
  These expressions are smooth and nondegenerate, and $v \|_S = kappa$. They prove the remaining assertions. ◻
]

#thm([Lemma 9.6.])[
  (Local static electrovacuum equations).  #emph[On each positive component, the extra matter vanishes and the stationary splitting is locally static. Its field is 
#[#set math.equation(numbering: n => "(9.36)")
 $ F = frac(c_n, k - 1) \( d z - A_s \) and d p . $ <stat:static-F>]

 The orbit fields satisfy 
#[#set math.equation(numbering: n => "(9.37)")
 $ Delta_(h_s) lambda & = lambda^(- 1) \| d p \|_(h_s)^2 \, & "div"_(h_s) \( lambda^(- 1) nabla_(h_s) p \) & = 0 \,\
"Ric"_(h_s) - lambda^(- 1) "Hess"_(h_s) lambda & = frac(- k thin d p ⊗ d p + \| d p \|_(h_s)^2 h_s, \( k - 1 \) lambda^2) . $ <stat:static-lapse-Maxwell>]

 Equivalently, with $caron(h) = lambda^(2 \/ \( k - 1 \)) h_s$, 
#[#set math.equation(numbering: n => "(9.38)")
 $ "Ric"_(caron(h)) & = frac(k, k - 1) (d log lambda ⊗ d log lambda - lambda^(- 2) d p ⊗ d p) \,\
"div"_(caron(h)) \( lambda^(- 2) nabla_(caron(h)) p \) & = 0 . $ <stat:conformal-static-Ricci>]

]
] <stat:static-equations>

#proof[
  Where $W > 0$, equation (9.3) has no matter term. Lemma 57 makes $A_s$ locally exact, so a local coordinate $T$ has $d T = d z - A_s$ and $upright(bold(g)) = - lambda^2 d T^2 + h_s$. Alignment gives $A_s and d p = 0$, proving (9.36). In this splitting the normalized static electric covector is $d p \/ \( \( k - 1 \) lambda \)$.
  The warped-product Ricci components are
  $ "Ric"_(upright(bold(g))) \( partial_T \, partial_T \) & = lambda Delta_(h_s) lambda \,\
"Ric"_(upright(bold(g)) \, i j) & = "Ric"_(h_s \, i j) - lambda^(- 1) "Hess"_(h_s \, i j) lambda . $
  For $F_(T i) = c_n p_i \/ \( k - 1 \)$, trace reversal gives respectively $\| d p \|_(h_s)^2$ and the right side of (9.37). The spatial divergence of the raised $i T$ Maxwell component gives the second equation of (9.37). These calculations establish all constants in (9.37)– (9.37). Finally apply the conformal Ricci and Laplacian formulas with conformal logarithm $\( k - 1 \)^(- 1) log lambda$. The Hessian terms cancel and yield (9.38)– (9.38). ◻
]

#thm([Proposition 9.7.])[
  (Charged reduction to vacuum).  #emph[Suppose $Q eq.not 0$. On the complete attached orbit base define 
#[#set math.equation(numbering: n => "(9.39)")
 $ lambda_0 = frac(lambda, 1 - p_b p) \, #h(2em) h_0 = \( 1 - p_b p \)^(2 \/ \( k - 1 \)) h_s . $ <stat:explicit-vacuum-transform>]

 Then $0 < lambda_0 < 1$ in the interior and 
#[#set math.equation(numbering: n => "(9.40)")
 $ "Ric"_(h_0) = lambda_0^(- 1) "Hess"_(h_0) lambda_0 \, #h(2em) Delta_(h_0) lambda_0 = 0 . $ <stat:vacuum-equations>]

 The metric and lapse extend smoothly to the compact boundary, where 
#[#set math.equation(numbering: n => "(9.41)")
 $ lambda_0 = 0 \, #h(2em) \| d lambda_0 \|_(h_0) = kappa_0 := kappa \( 1 - p_b^2 \)^(- k \/ \( k - 1 \)) > 0 . $ <stat:vacuum-boundary-gradient>]

 The boundary is totally geodesic and $"Hess"_(h_0) lambda_0 = 0$ there. The base is complete including its boundary and has exactly the original coordinate end.]
] <stat:charged-vacuum>

#proof[
  Lemma 58 already gives $W > 0$ throughout the interior. Set
  $ a_0 = p_b + d_0 \/ 2 = frac(p_b^2 - 1, 2 p_b) eq.not 0 \, #h(2em) V_0 = 1 / 2 log frac(1 - p \/ p_b, 1 - p_b p) . $
  The logarithm is real and $V_0 arrow.r 0$ at infinity. Direct differentiation, using (9.28), gives
  #[#set math.equation(numbering: n => "(9.42)")
   $ d V_0 = a_0 frac(d p, W) \, #h(2em) d log lambda ⊗ d log lambda - W^(- 1) d p ⊗ d p = d V_0 ⊗ d V_0 . $ <stat:vacuum-target-identity>]
  The second identity follows also from $\( p + d_0 \/ 2 \)^2 - W = d_0^2 \/ 4 - 1 = a_0^2$. Equations (9.38) and (9.38) now give
  $ "Ric"_(caron(h)) = frac(k, k - 1) d V_0 ⊗ d V_0 \, #h(2em) Delta_(caron(h)) V_0 = 0 . $
  The inverse conformal formulas, with $lambda_0 = e^(V_0)$ and $h_0 = lambda_0^(- 2 \/ \( k - 1 \)) caron(h)$, prove (9.40). The polynomial factorization makes these definitions exactly (9.39). It also gives $0 < lambda_0 < 1$, since for $p = t p_b$, $0 < t < 1$,
  $ lambda_0^2 = frac(1 - t, 1 - p_b^2 t) < 1 . $
  Near the boundary the simple root in Lemma 58 makes $p$ a smooth function of $W = lambda^2$. Thus the positive factor $1 - p_b p$ is smooth in the attached coordinates of Lemma 59. Its boundary value is $1 - p_b^2 > 0$, and the normal rescaling gives (9.41). Smoothness of $h_0$ and the equation $"Hess"_(h_0) lambda_0 = lambda_0 "Ric"_(h_0)$ imply that the Hessian vanishes at the boundary. Its tangential components are the nonzero normal derivative times the boundary second fundamental form, so the boundary is totally geodesic.
  Completeness of $h_s$ including its attachment follows from $h_s gt.eq g$. Indeed a finite-length Cauchy escape has a limit in the complete original metric space. An interior limit is harmless because $W > 0$ there, and a boundary limit is contained in the regular attached collar. The same reasoning proves metric completeness, or equivalently the absence of any finite-length escape. Since
  $ 1 - p_b^2 lt.eq 1 - p_b p lt.eq 1 \, $
  $h_0$ and $h_s$ are uniformly comparable. Completeness passes to $h_0$. The attachment changes only the boundary collar’s smooth defining function, so the topological end and compact-complement properties are retained. ◻
]

=== 9.4 Zero charge and exclusion of an interior frontier <zero-charge-and-exclusion-of-an-interior-frontier>

#thm([Proposition 9.8.])[
  (Global positivity when the charge vanishes).  #emph[If $Q = 0$, then $E = 0$, $p = 0$, and $W > 0$ on all of $Omega^compose$. The attached pair $\( h_s \, lambda \)$ is a complete vacuum static pair with $0 < lambda < 1$, connected compact boundary, and boundary derivative $kappa$.]
] <stat:zero-charge-positivity>

#proof[
  The boundary value of $p$ is constant by Lemma 55. Integrate $"div" \( p E \) = d p \( E \) = \( k - 1 \) u \| E \|^2$ on the original exterior truncated at radius $R$. The boundary normal in this divergence theorem is $- nu$ on $S$. The outer term tends to zero by the decay of $p$ and $E$, and the inner flux is $- p_b omega Q = 0$. Since $u$ is bounded and $\| E \|^2$ is integrable, this gives
  $ \( k - 1 \) integral_Omega u \| E \|^2 = 0 . $
  Positivity of $u$ in the interior implies $E = 0$, and then $p = 0$ by its normalization at infinity.
  On every component of $cal(U)$, Lemmas 57 and 60 now give
  #[#set math.equation(numbering: n => "(9.43)")
   $ "Hess"_(h_s) lambda = lambda "Ric"_(h_s) \, #h(2em) Delta_(h_s) lambda = 0 \, #h(2em) "Scal"_(h_s) = 0 . $ <stat:local-vacuum>]
  Let $cal(C)$ be the positive component containing the whole sufficiently distant end. Any other positive component has compact closure in the original exterior and continuous boundary value $lambda = 0$ on its whole topological boundary, including any part on $S$. Its positive maximum would be attained in its interior, contradicting the strong maximum principle. Thus no other positive component exists, and all deleted boundary collars lie in $cal(C)$. The same compact-superlevel argument gives $0 < lambda < 1$ on $cal(C)$.
  We next exclude a finite orbit-metric distance to an interior zero. Near any such zero, $u$ and $\| X \|$ are bounded below, and Lemma 57 makes the left side of (9.22) zero. Therefore
  #[#set math.equation(numbering: n => "(9.44)")
   $ \( d_T log W \)_i = \| X \|^(- 2) X^j \( d X^flat \)_(i j) . $ <stat:zero-charge-transverse-log>]
  Its right side is bounded. Together with (9.18), this gives on $cal(C)$ near the zero
  #[#set math.equation(numbering: n => "(9.45)")
   $ \| d log W \|_(h_s)^2 = \| d_T log W \|_g^2 + frac(\( d W \( e \) \)^2, u^2 W) lt.eq C . $ <stat:zero-charge-distance>]
  Consequently a finite $h_s$-length curve cannot approach the zero: integration of (9.45) would keep $log W$ bounded on its tail.
  Attach $S$ to the base of $cal(C)$ as in Lemma 59. By (9.43), the Hessian of $lambda$ vanishes at $S$, and the boundary is totally geodesic. In Gaussian base distance $sigma$ from $S$, smoothness gives the Taylor expansions
  #[#set math.equation(numbering: n => "(9.46)")
   $ h_s & = d sigma^2 + #scale(x: 120%, y: 120%)[\(] gamma_0 + sigma^2 gamma_2 + sigma^3 R #scale(x: 120%, y: 120%)[\)]_(A B) d y^A d y^B \,\
lambda & = kappa sigma + a_3 \( y \) sigma^3 + sigma^4 R_lambda . $ <stat:bolt-base-Taylor>]
  The remainders are smooth for $sigma gt.eq 0$. The absent quadratic term in the lapse is exactly $"Hess"_(h_s) lambda \( partial_sigma \, partial_sigma \) \|_S = 0$.
  Take a circle coordinate $T$ of period $2 pi \/ kappa$, and put
  #[#set math.equation(numbering: n => "(9.47)")
   $ h_(upright("circ")) = h_s + lambda^2 d T^2 quad upright("on ") cal(C) times \( bb(R) \/ \( 2 pi \/ kappa \) bb(Z) \) . $ <stat:circle-metric>]
  Collapse this circle at $S$ by attaching a disk in the normal direction. The period is the same over the entire connected boundary because $kappa$ is constant. To check regularity, set $theta = kappa T$, use disk coordinates $\( x_1 \, x_2 \) = \( sigma cos theta \, sigma sin theta \)$, and write $alpha_D = x_1 d x_2 - x_2 d x_1$. Besides the Euclidean disk metric, the polar contribution is
  $ [(frac(lambda, kappa sigma))^2 - 1] sigma^2 d theta^2 & = [(frac(lambda, kappa sigma))^2 - 1] alpha_D^2 / sigma^2\
 & = frac(2 a_3 \( y \), kappa) alpha_D^2 + sigma B \( sigma \, y \) alpha_D^2 $
  with smooth $B$. The first term has smooth quadratic coefficients in $\( x_1 \, x_2 \)$; the remaining coefficients have differentiated order at least three. The same holds for the remainder in (9.46). The extended metric is therefore $C^(2 \, alpha)$ for every $0 < alpha < 1$. It is nondegenerate. The warped-product Ricci formulas and (9.43) give Ricci curvature zero off the attached copy of $S$, and continuity extends this identity across it. Harmonic-coordinate regularity for Einstein metrics then makes this extension smooth #cite(label("DeTurckKazdan1981")).
  The resulting manifold, denoted by $cal(M)$, is complete and has no boundary. To check completeness directly, a finite-length curve projects to a finite $h_s$-length curve, hence to a $g$-Cauchy curve because $h_s gt.eq g$. Completeness of the original metric space supplies a limit in $Omega$. An interior zero of $W$ is excluded by (9.45). At an interior point of $cal(C)$, the circle has uniformly positive size, so its coordinate is Cauchy as well. At a point of $S$, the regular disk attachment makes all limiting circle phases converge to that point of the attached zero section. Thus no finite-length escape remains, which proves completeness.
  Suppose an interior frontier of $cal(C)$ still existed. A sequence in $cal(C)$ approaching such a frontier, lifted at a fixed circle phase, escapes every compact subset of $cal(M)$. Choose a far coordinate sphere and its product with the circle,
  $ Sigma_R tilde.equiv S^(n - 1) times S^1 . $
  It is a compact connected cross-section. Its outside is the asymptotic product end, while its inside contains the escaping sequence and is noncompact. The inside is connected: excursions of a path through the outside can be replaced by paths in a thin inside collar of the connected cross-section. A compact tubular neighborhood of $Sigma_R$ therefore separates two noncompact regions. In particular $cal(M)$ has at least two ends.
  For clarity, the line needed for the splitting theorem can be constructed directly. Choose escaping sequences in the two regions and minimizing segments between them. Each segment meets the fixed compact separating cross-section, and its distances from that cross-section to both endpoints tend to infinity. Centering there and taking a subsequence gives a complete minimizing line. The smooth, complete, connected manifold $cal(M)$ has $"Ric" = 0$, so the Cheeger–Gromoll splitting theorem applies #cite(label("CheegerGromoll1971")). It gives $cal(M) tilde.equiv bb(R) times N$ with $N$ complete and connected. Since the product with a connected noncompact factor has only one end, $N$ must be compact. Such a product has at most linear volume growth.
  On the other hand, (9.8) shows that $h_s$ approaches a positive constant Euclidean metric and $lambda arrow.r 1$. The circle has fixed period. Hence the product end in (9.47) gives $"Vol"_(h_(upright("circ"))) \( B_R \) gt.eq c R^n$ for large $R$: paths to a fixed far sphere have bounded cost, and the metric on the remaining end is uniformly comparable to its Euclidean product model. This contradicts linear growth. There is no interior frontier. Since $Omega^compose$ is connected, $cal(C) = Omega^compose$ and $W > 0$ throughout.
  Now $h_s$ itself is complete up to its regular boundary by the same projection and collar argument, and (9.43) holds globally. The boundary assertions follow from Lemma 59 and the vanishing Hessian already proved. ◻
]

#thm([Proposition 9.9.])[
  (Complete vacuum reduction).  #emph[Under the stationary interface stated at the start of this section, the Killing field is timelike on the whole open exterior: $W > 0$ on $Omega^compose$. The original matter densities vanish there, $X and E = 0$, and $d A_s = 0$. The orbit pair $\( h_s \, lambda \)$ has the regular attachment in Lemma 59.]
  #emph[If $Q eq.not 0$, define $\( h_0 \, lambda_0 \)$ by (9.39); if $Q = 0$, take $\( h_0 \, lambda_0 \) = \( h_s \, lambda \)$. In either case this is a smooth vacuum static pair satisfying (9.40) on a connected orientable exterior, complete including its connected compact boundary, with compact complement of exactly one Euclidean coordinate end. Its lapse is zero at the boundary, lies strictly between zero and one in the interior, and tends to one at infinity. The inward boundary derivative is a positive constant, equal to (9.41) in the charged case and to $kappa$ in the uncharged case. The boundary is totally geodesic and $"Hess"_(h_0) lambda_0 = 0$ there. Gaussian reflection of $h_0$ with odd reflection of $lambda_0$ is at least $C^(2 \, alpha)$ for $0 < alpha < 1$.]
  #emph[After a fixed linear change of end coordinates, 
#[#set math.equation(numbering: n => "(9.48)")
 $ h_0 - delta = O_2 \( r^(- q_0) \) \, #h(2em) lambda_0 - 1 = O_2 \( r^(- q_0) \) $ <stat:vacuum-end>]

 for $q_0$ as in (9.7). No simple-connectivity claim or global primitive of $A_s$ is needed for this reduction.]
] <stat:vacuum-reduction>

#proof[
  All interior, boundary, and completeness assertions follow from Propositions 61 and 62, together with Lemmas 55 and 57. On $W > 0$, (9.3) gives $mu_m = 0$, and the matter dominant energy condition gives $J_m = 0$. Continuity gives the same conclusion up to $S$.
  In the original end coordinates, $h_s$ tends to $delta + b^flat ⊗ b^flat$, a positive constant matrix. Equations (9.8) and (9.12) give differentiated error $O_2 \( r^(- q_0) \)$. In the charged case the additional conformal factor differs from one by $O_2 \( r^(2 - n) \)$, so the same bound holds for $h_0$ and $lambda_0$. A fixed linear coordinate change normalizes the limiting matrix and preserves these decay orders.
  Finally take Gaussian normal coordinates for $h_0$ at the boundary. Total geodesicity makes the first normal derivative of its tangential metric zero. The vanishing boundary Hessian makes the second normal derivative of the lapse zero. Even metric reflection and odd lapse reflection consequently match their derivatives through order two and are $C^(2 \, alpha)$. This is the regularity required for the vacuum doubling argument in the next section. ◻
]

== 10 Vacuum doubling with a weak asymptotic tail <uniq:section>

The vacuum pair obtained in Proposition 63 has only the asymptotic derivative bounds inherited from the original data. We prove its uniqueness at that regularity. In particular, the point added in conformal doubling will initially be a $W^(2 \, s)$ point, rather than a smooth point. The nonnegative mass statement used below follows from the numerical Theorem 5, which has already been proved; no equality conclusion of that theorem is used.

#thm([Proposition 10.1.])[
  (Vacuum uniqueness).  #emph[Let $n gt.eq 4$ and let $\( B \, h_0 \, lambda_0 \)$ be a smooth oriented vacuum static exterior, complete including its connected compact boundary $S$, with a compact complement of one Euclidean coordinate end. Suppose 
#[#set math.equation(numbering: n => "(10.1)")
 $ "Hess"_(h_0) lambda_0 = lambda_0 "Ric"_(h_0) \, #h(2em) Delta_(h_0) lambda_0 = 0 \, #h(2em) lambda_0 \|_S = 0 \, #h(2em) lambda_0 arrow.r 1 \, $ <uniq:static-equations>]

 and $partial_nu lambda_0 = kappa_0 > 0$ on $S$, with $nu$ pointing toward the end. Assume, after a constant linear normalization of end coordinates, 
#[#set math.equation(numbering: n => "(10.2)")
 $ h_0 - delta = O_2 \( r^(- q_0) \) \, #h(2em) lambda_0 - 1 = O_2 \( r^(- q_0) \) \, #h(2em) frac(n - 2, 2) < q_0 < n - 2 . $ <uniq:initial-tail>]

 Then $B$ is globally the exterior of a round sphere in isotropic coordinates. For some $R > 0$, writing $rho = \| x \| gt.eq R$, 
#[#set math.equation(numbering: n => "(10.3)")
 $ h_0 = (1 + R^(n - 2) / rho^(n - 2))^(4 \/ \( n - 2 \)) delta \, #h(2em) lambda_0 = frac(1 - R^(n - 2) \/ rho^(n - 2), 1 + R^(n - 2) \/ rho^(n - 2)) . $ <uniq:schwarzschild-pair>]

 The identification extends smoothly to $S$.]
] <uniq:vacuum-uniqueness>

We first give the end and analytic ingredients needed in its proof.

#thm([Lemma 10.2.])[
  (Harmonic coordinates and the missing metric monopole).  #emph[Under the hypotheses of Proposition 64, put 
$ caron(h) = lambda_0^(2 \/ \( n - 2 \)) h_0 \, #h(2em) V_0 = log lambda_0 . $

 There are harmonic end coordinates for $caron(h)$, a number $a_0 > 0$, and $alpha > 0$ such that, for every derivative order $j$, 
#[#set math.equation(numbering: n => "(10.4)")
 $ caron(h)_(i j) = delta_(i j) + O_j \( r^(2 - n - alpha) \) \, #h(2em) V_0 = - a_0 r^(2 - n) + O_j \( r^(2 - n - alpha) \) . $ <uniq:improved-tail>]

]
] <uniq:end-expansion>

#proof[
  The maximum principle gives $0 < lambda_0 < 1$ in the interior. The conformal Ricci and Laplace formulas applied to (10.1) give
  #[#set math.equation(numbering: n => "(10.5)")
   $ "Ric"_(caron(h)) = frac(n - 1, n - 2) thin upright(d) V_0 ⊗ upright(d) V_0 \, #h(2em) Delta_(caron(h)) V_0 = 0 . $ <uniq:harmonic-ricci>]
  We may decrease $q_0$ while preserving its strict lower bound. Since $n gt.eq 4$, it is possible to take $q_0 > 1$; hence $delta_0 = 1 - q_0$ lies in $\( 2 - n \, 0 \)$. This avoids a logarithmic coordinate correction.
  Here are details of constructing coordinates at the stated derivative count. Extend the coefficients of $caron(h)$ to be Euclidean inside a large coordinate sphere, using a transition annulus. The equation for $y^i = x^i + v^i$ is
  $ Delta_delta v^i = - Delta_(caron(h)) x^i + \( Delta_delta - Delta_(caron(h)) \) v^i . $
  Use weighted scaled $C^(2 \, beta)$ norms of order $delta_0$, with a fixed $0 < beta < 1$. The Newton operator takes order $delta_0 - 2$ to order $delta_0$: splitting its integral into $\| z \| < r \/ 2$, $\| z - x \| < r \/ 2$, and the remaining exterior annuli bounds the undifferentiated potential by $C \( 1 + r \)^(delta_0)$, and local scaled Schauder estimates give its two derivatives and Hölder seminorm. Both integrals at infinity converge because $delta_0 < 0$, and $delta_0 > 2 - n$ controls the inner annuli. After choosing the cutoff radius sufficiently large, the last operator has norm less than one. The Neumann series therefore gives $v^i = O_(2 \, beta) \( r^(1 - q_0) \)$. The original $O_2$ bounds supply the scaled Hölder bounds for the first-order coefficients used here. The new coordinate derivative is $I + O \( r^(- q_0) \)$, so these are coordinates outside a larger sphere. There is a derivative-count issue in transferring a metric to these coordinates: its second derivatives use third derivatives of the coordinate correction. Differentiating the coordinate equation once, the assumed $O_2$ metric bounds control its right side in scaled $L^t$ for every finite $t$. Local estimates give $v^i$ in scaled $W^(3 \, t)$ with the corresponding decay. Thus the transformed metric first has the initial weighted $W^(2 \, t)$ bounds for any finite $t$, which is enough for the next elliptic step. No third asymptotic derivative of the original metric has been assumed.
  In these coordinates (10.5) is a uniformly elliptic system whose metric equation has principal part $- caron(h)^(a b) partial_a partial_b caron(h)_(i j) \/ 2$ and quadratic first-derivative terms. The equation for $V_0$ has the same principal coefficients. Scaled interior estimates first give $C^(2 \, beta)$ bounds and then, by differentiating the system, all higher scaled bounds; see the elliptic estimates in #cite(label("GilbargTrudinger2001")). Consequently
  $ Delta_delta \( caron(h)_(i j) - delta_(i j) \) = O_j \( r^(- 2 - 2 q_0) \) \, #h(2em) Delta_delta V_0 = O_j \( r^(- 2 - 2 q_0) \) $
  for every $j$. Cut the fields off inside a fixed sphere. Their Euclidean Laplacian sources are integrable and have a finite positive moment of every order smaller than $2 q_0 - \( n - 2 \)$. Choose
  $ 0 < alpha < min { 1 \, thin 2 q_0 - \( n - 2 \) } . $
  Subtracting the Newton kernel monopole from the potential, the inner annuli are bounded by the $alpha$ moment and the outer annuli by the displayed pointwise source bounds. Thus
  $ caron(h)_(i j) - delta_(i j) = A_(i j) r^(2 - n) + O_j \( r^(2 - n - alpha) \) \, #h(2em) V_0 = - a_0 r^(2 - n) + O_j \( r^(2 - n - alpha) \) . $
  The difference from the Newton potential is an entire decaying harmonic function and vanishes. Derivative estimates for the remainders follow by the same scaled interior estimates.
  Harmonic gauge now eliminates $A$. Its leading term is
  $ 0 = partial_j caron(h)_(i j) - 1 / 2 partial_i caron(h)_(j j) + O \( \| caron(h) - delta \| thin \| partial caron(h) \| \) = \( 2 - n \) r^(- n) (A_(i j) x^j - 1 / 2 \( "tr" A \) x_i) + o \( r^(1 - n) \) . $
  Hence $A = \( "tr" A \) I \/ 2$, and taking the trace gives $A = 0$ because $n eq.not 2$. Finally the harmonic flux of $lambda_0$ in $h_0$, with the outward domain normal $- nu$ at $S$, gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ \( n - 2 \) omega a_0 = kappa_0 "Area"_(h_0) \( S \) > 0 . $ <uniq:capacity-flux>]
  All changes between the Euclidean and metric fluxes have vanishing limit by the decay just established. ◻
]

The next lemma specifies the inverse actually required at the point of compactification. Only compact sources are used.

#thm([Lemma 10.3.])[
  (Compact-source inverse and perturbation norm).  #emph[Let $\( M \, gamma \)$ be connected, complete, without boundary, and have one Euclidean coordinate end with compact complement. Suppose $gamma$ is uniformly positive, locally $W^(2 \, s)$, and smooth off a compact set, where 
$ n / 2 < s < n \, #h(2em) p = frac(n s, n - s) > n . $

 Suppose on its end $gamma - delta = O_j \( r^(- q) \)$ for every $j$ and some $q > 0$. Fix a compact set $K$ whose interior contains all nonsmooth points, and a larger compact set $K_1$. For every $0 < b < n - 2$ there is a unique operator $P_gamma$ such that 
#[#set math.equation(numbering: n => "(10.7)")
 $ Delta_gamma P_gamma f = f \, #h(2em) parallel P_gamma f parallel_(W^(2 \, s) \( K_1 \)) + sup_(r gt.eq R) r^b sum_(j = 0)^2 r^j \| D^j P_gamma f \| lt.eq C parallel f parallel_(L^s \( K \)) $ <uniq:inverse-estimate>]

 for $f in L^s$ supported in $K$, with $P_gamma f arrow.r 0$ at infinity. The same bound holds for higher scaled derivatives on the end, with a constant depending on the derivative order.]
  #emph[Write $cal(X) = P_gamma \( L_K^s \)$, endowed with $parallel v parallel_(cal(X)) = parallel Delta_gamma v parallel_(L^s \( K \))$. If $gamma'$ agrees with $gamma$ outside $K$ and is sufficiently close in $W^(2 \, s) \( K \)$, then 
#[#set math.equation(numbering: n => "(10.8)")
 $ ∥\( Delta_(gamma') - Delta_gamma \) v - a_n^(- 1) R_(gamma') v∥_(L^s \( K \)) lt.eq C (parallel gamma' - gamma parallel_(W^(2 \, s) \( K \)) + parallel R_(gamma') parallel_(L^s \( K \))) parallel v parallel_(cal(X)) \,\
a_n = frac(4 \( n - 1 \), n - 2) . $ <uniq:operator-norm>]

 Here the curvature term is used when its support is contained in $K$.]
] <uniq:compact-inverse>

#proof[
  Sobolev embedding gives continuous coefficients, first derivatives in $L^p$, and uniform ellipticity on compact coordinate patches. In nondivergence notation $Delta_gamma = a^(i j) partial_i partial_j + B^i partial_i$, the principal coefficients are continuous and $B in L^p$. Freeze the principal coefficients on a small ball. The constant coefficient $W^(2 \, s)$ estimate absorbs their small oscillation. For the first-order term use
  $ parallel B thin D v parallel_(L^s) lt.eq parallel B parallel_(L^p) parallel D v parallel_(L^n) \, #h(2em) 1 / s = 1 / p + 1 / n . $
  Interpolation of $parallel D v parallel_(L^n)$ between the local $W^(2 \, s)$ norm and a zeroth-order norm allows absorption, with an additional zeroth-order constant. Cutoffs and a finite cover give the local $W^(2 \, s)$ estimate. These estimates are uniform for coefficients converging in $W^(2 \, s)$: their principal coefficients converge uniformly, and the $L^p$ first-order coefficients are uniformly equi-integrable. The same argument gives estimates for smooth approximations and their Dirichlet problems.
  For large $R$, direct differentiation gives
  #[#set math.equation(numbering: n => "(10.9)")
   $ Delta_gamma r^(- b) = b \( b + 2 - n \) r^(- b - 2) + O \( r^(- b - 2 - q) \) < 0 quad \( r gt.eq R \) . $ <uniq:end-barrier>]
  Solve on expanding smooth truncations with zero outer Dirichlet value, initially using smooth coefficient and source approximations. The maximum principle on the exterior region bounds the solution there by its supremum on $r = R$ times $C r^(- b)$; local estimates also bound its scaled exterior derivatives. The compact-core supremum is bounded by $C parallel f parallel_(L^s)$ uniformly in the exhaustion and approximations. Otherwise divide by that diverging supremum. The local estimates and the compact embedding of $W^(2 \, s)$ into $C^0$ give a nonzero limit harmonic on all of $M$, bounded by $C r^(- b)$ at infinity. The divergence-form strong maximum principle contradicts this limit. A maximizing point cannot escape the fixed core because of the exterior barrier. Passing first in the coefficient and source approximations on a truncation, and then through exhaustion, proves existence and (10.7). The decaying homogeneous maximum principle proves uniqueness, including for sign-changing solutions. Thus $cal(X)$ is a Banach space isometric to $L_K^s$.
  For completeness, the perturbation estimate is an estimate between these particular spaces, rather than an assertion about all weighted sources. The second-order coefficient difference is bounded in $C^0$ by $C parallel gamma' - gamma parallel_(W^(2 \, s))$. The first-order difference is bounded in $L^p$ by the same quantity, while $D v in L^p \( K \)$ by (10.7). Since $p \/ 2 > s$, their product lies in $L^s \( K \)$. Finally $R_(gamma') v in L^s$ because $v in C^0 \( K \)$. This proves (10.8). All constants are for the fixed sets and reference metric; one chooses the perturbation size only after those constants have been fixed. ◻
]

#thm([Lemma 10.4.])[
  (Conformal correction and its mass).  #emph[In Lemma 66, suppose in addition that $R_gamma = 0$ weakly, that $gamma$ has a finite ADM energy, and that $q > \( n - 2 \) \/ 2$. Choose $b$ so that 
#[#set math.equation(numbering: n => "(10.10)")
 $ frac(n - 2, 2) < b < n - 2 \, #h(2em) b + q > n - 2 . $ <uniq:mass-exponents>]

 Every sufficiently small compact $W^(2 \, s)$ perturbation $gamma'$ has a unique small correction $v in cal(X)$ for which 
$ U = 1 + v > 0 \, #h(2em) hat(gamma) = U^(4 \/ \( n - 2 \)) gamma' \, #h(2em) R_(hat(gamma)) = 0 . $

 The correction depends continuously on $gamma'$ in $W^(2 \, s)$, and differentiably along smooth one-parameter perturbations. Its energy satisfies 
#[#set math.equation(numbering: n => "(10.11)")
 $ cal(E) \( hat(gamma) \) = cal(E) \( gamma \) - frac(1, 2 \( n - 1 \) omega) integral_M R_(gamma') \( 1 + v \) thin upright(d) V_(gamma') . $ <uniq:mass-formula>]

 In particular the energies converge under compact smoothing in $W^(2 \, s)$ followed by this correction.]
] <uniq:correction-mass>

#proof[
  The conformal scalar-curvature equation is
  $ - a_n Delta_(gamma') v + R_(gamma') \( 1 + v \) = 0 . $
  Equivalently, on $cal(X)$,
  #[#set math.equation(numbering: n => "(10.12)")
   $ v = P_gamma [a_n^(- 1) R_(gamma') - \( Delta_(gamma') - Delta_gamma \) v + a_n^(- 1) R_(gamma') v] . $ <uniq:neumann-correction>]
  Curvature is a continuous map from positive $W^(2 \, s)$ metrics to $L^s$: its second-order terms have continuous coefficients, and its quadratic first-order terms are in $L^(p \/ 2) subset L^s$. Thus $R_(gamma')$ tends to zero in $L^s$. By (10.8), the operator on the right involving $v$ has norm less than $1 \/ 2$ after shrinking the metric neighborhood. Its Neumann inverse gives the solution and its stated dependence. Estimate (10.7) makes $parallel v parallel_(C^0) < 1 \/ 2$, so $U$ is positive.
  Outside $K$, $v$ is $gamma$-harmonic. The divergence theorem, valid also for the weak equation on the compact part, therefore gives the finite flux
  #[#set math.equation(numbering: n => "(10.13)")
   $ F \( v \) := lim_(r arrow.r oo) integral_(S_r) partial_(nu_gamma) v thin upright(d) A_gamma = a_n^(- 1) integral_M R_(gamma') \( 1 + v \) thin upright(d) V_(gamma') . $ <uniq:correction-flux>]
  The usual conformal ADM calculation in the fixed end chart gives
  $ cal(E) \( U^(4 \/ \( n - 2 \)) gamma' \) - cal(E) \( gamma' \) = - frac(2, \( n - 2 \) omega) F \( v \) . $
  Here the errors from $v D v$ have integral $O \( r^(n - 2 - 2 b) \)$, and those from the background metric and its first derivative have integral $O \( r^(n - 2 - q - b) \)$. Both vanish by (10.10). Also $gamma' = gamma$ at infinity, so its uncorrected ADM energy is unchanged. This proves (10.11), including existence of the corrected ADM limit. Continuity and differentiation follow from the compact integral, the operator convergence in (10.12), and $W^(2 \, s) arrow.r.hook C^0$. ◻
]

#thm([Lemma 10.5.])[
  (Smooth nonnegative mass from the numerical theorem).  #emph[Let $\( M \, gamma \)$ be a smooth connected oriented complete manifold without boundary, with one Euclidean coordinate end and compact complement, scalar curvature zero, and finite ADM energy. Assume that $gamma - delta = O_j \( r^(- q) \)$ for every integer $j gt.eq 0$, with $q > \( n - 2 \) \/ 2$. Then $cal(E) \( gamma \) gt.eq 0$.]
] <uniq:smooth-nonnegative-mass>

#proof[
  Fix a smooth point $o$. The local Dirichlet Green function for $- Delta_gamma$ in a small ball has a positive fundamental pole at $o$. Cut it off inside that ball. Its distributional Laplacian is $- delta_o$ plus a smooth compact source supported in an annulus away from $o$. Subtract the decaying solution of that compact source given by Lemma 66. The result $G$ is harmonic off $o$, tends to zero at infinity, and has the same positive pole. The maximum principle on the region between a small sphere about $o$ and a large outer sphere gives $G gt.eq 0$; the strong principle gives $G > 0$. In normal distance $d$ from $o$, the local fundamental solution estimates give, with $c > 0$,
  $ G = c thin d^(2 - n) \( 1 + o \( 1 \) \) \, #h(2em) partial_d G = \( 2 - n \) c thin d^(1 - n) \( 1 + o \( 1 \) \) \, $
  uniformly in angle. These local estimates follow by rescaling the smooth elliptic coefficients in the Green equation. At the retained end $G = O_2 \( r^(- b) \)$ for any $0 < b < n - 2$, by Lemma 66 and exterior estimates; its harmonic flux there is finite.
  For fixed $epsilon.alt > 0$, set
  $ gamma_epsilon.alt = \( 1 + epsilon.alt G \)^(4 \/ \( n - 2 \)) gamma quad upright("on ") M \\ { o } . $
  This metric is scalar flat. On a sufficiently small sphere $d = t$, the normal toward the old end is the increasing-$d$ normal, and its conformal mean curvature has the sign of
  $ H_gamma + frac(2 \( n - 1 \), n - 2) partial_d log \( 1 + epsilon.alt G \) = frac(n - 1, t) - frac(2 \( n - 1 \), t) + o \( t^(- 1) \) < 0 . $
  For this fixed $epsilon.alt$, choose such a sphere and discard its inside. The remaining manifold is a connected smooth exterior, complete including its compact boundary, with precisely the old coordinate end. Give it second tensor and electric field zero. It has zero matter constraints, a strictly future trapped boundary, and the required $O_2$ metric decay with any fixed exponent between $\( n - 2 \) \/ 2$ and $min { q \, n - 2 }$. Its energy exists: choose $b$ additionally so that $b + q > n - 2$, and use the finite harmonic flux and the ADM calculation of Lemma 67.
  The numerical Theorem 5, at $Q = 0$, applies to this exterior. In particular it proves that its energy is positive; timelikeness and a positive full-cut infimum are conclusions of that theorem, not additional assumptions here. The conformal mass formula gives
  $ cal(E) \( gamma_epsilon.alt \) = cal(E) \( gamma \) - frac(2 epsilon.alt, \( n - 2 \) omega) lim_(r arrow.r oo) integral_(S_r) partial_(nu_gamma) G thin upright(d) A_gamma arrow.r cal(E) \( gamma \) . $
  Send $epsilon.alt arrow.b 0$, choosing the small inner sphere only after each $epsilon.alt$ is fixed. This proves the assertion. The argument uses only the already established numerical theorem in dimension $n$ and imposes no spin assumption. ◻
]

#thm([Lemma 10.6.])[
  (Rigidity of the compactified zero-mass metric).  #emph[Let $\( M \, gamma \)$ be oriented and satisfy the hypotheses of Lemma 66, with $R_gamma = 0$ weakly, $cal(E) \( gamma \) = 0$, and $q > \( n - 2 \) \/ 2$. Suppose $gamma$ is smooth except at one point and possibly along a smooth compact hypersurface where it is $C^(2 \, beta)$. Then $\( M \, gamma \)$ is Euclidean space after passage to smooth harmonic coordinates.]
] <uniq:rough-zero-mass>

#proof[
  Fix $K$ containing all nonsmooth points. A finite coordinate partition, mollification, and a cutoff within $K$ give smooth positive metrics $gamma_j$ agreeing with $gamma$ off $K$ and converging in $W^(2 \, s)$ and uniformly. Positivity follows from uniform convergence and the compact lower ellipticity bound. By Lemma 67, they have positive conformal corrections $U_j arrow.r 1$. The corrected metrics are smooth by elliptic regularity, complete because the factors are uniformly bounded above and below, scalar flat, and have one retained coordinate end with decay exponent $min { q \, b } > \( n - 2 \) \/ 2$. Their energies converge to zero by (10.11) and are nonnegative by Lemma 68.
  More generally, let $H$ be an arbitrary smooth symmetric tensor compactly supported in a smooth patch of $gamma$, and set $gamma_t = gamma + t H$ for $\| t \|$ sufficiently small. Enlarge $K$ once to contain $"supp" H$, and choose its reference inverse before varying $t$. Use this same $P_gamma$, this same $K$, and (10.12) to obtain $U_t = 1 + v_t$ and scalar-flat $hat(gamma)_t$. For each fixed $t$, approximate $gamma_t$ smoothly in $W^(2 \, s)$, keeping its exterior fixed, and correct using that same reference inverse. The corrected smooth metrics converge to $hat(gamma)_t$, and their energies converge by (10.11). Consequently
  $ cal(E) \( hat(gamma)_t \) gt.eq 0 quad upright("for both signs of ") t \, #h(2em) cal(E) \( hat(gamma)_0 \) = 0 . $
  Only after taking the smoothing limit at each fixed $t$ do we differentiate this two-sided inequality at $t = 0$.
  Since $R_gamma = 0$ and $U_0 = 1$, differentiation of (10.11) gives
  #[#set math.equation(numbering: n => "(10.14)")
   $ 0 = frac(upright(d), upright(d) t)\|_0 cal(E) \( hat(gamma)_t \) = - frac(1, 2 \( n - 1 \) omega) integral_M R'_gamma \[ H \] thin upright(d) V_gamma = frac(1, 2 \( n - 1 \) omega) integral_M chevron.l "Ric"_gamma \, H chevron.r thin upright(d) V_gamma . $ <uniq:mass-derivative>]
  The last identity follows by integrating $R' \[ H \] = "div" "div" H - Delta "tr" H - chevron.l "Ric" \, H chevron.r$; the support lies in a smooth interior patch, so no boundary terms occur. Thus $"Ric"_gamma = 0$ on every smooth patch. It vanishes across the hypersurface by its $C^(2 \, beta)$ regularity as well. At the exceptional point, $D^2 gamma in L^s$ and $D gamma thin D gamma in L^(p \/ 2) subset L^s$ imply that distributional Ricci curvature has $L^s$ coefficients. There is therefore no point-supported curvature term, and $"Ric"_gamma = 0$ weakly throughout $M$.
  We detail the regularity upgrade, so that comparison geometry is applied to a smooth metric. Fix $n \/ 2 < s < n$ and $p = n s \/ \( n - s \) > n$. In an original chart the scalar Laplacian has the form $a^(i j) partial_i partial_j + B^i partial_i$, where $a$ is continuous, $D a \, B in L^p$, and $D B in L^s$. Indeed $D B$ consists of bounded coefficients times $D^2 gamma$ and quadratic $D gamma$ terms in $L^(p \/ 2) subset L^s$. Normalize $a \( x_0 \) = I$ by a constant linear change and rescale $x = x_0 + r z$. The rescaled drift $B_r \( z \) = r B \( x_0 + r z \)$ satisfies
  $ parallel a \( x_0 + r thin dot.op \) - I parallel_oo arrow.r 0 \, #h(2em) parallel B_r parallel_(L^p \( B_2 \)) = r^(1 - n \/ p) parallel B parallel_(L^p \( B_(2 r) \( x_0 \) \)) arrow.r 0 . $
  Let $G_D$ be the flat Dirichlet inverse on $B_1$. On $cal(D)_p = W^(2 \, p) \( B_1 \) ∩ W_0^(1 \, p) \( B_1 \)$ the equations for harmonic replacements $y^i = z^i + v^i$ are
  $ v^i = G_D #scale(x: 120%, y: 120%)[\[] - B_r^i + \( I - a_r \) : D^2 v^i - B_r dot.op D v^i #scale(x: 120%, y: 120%)[\]] . $
  The operator involving $v^i$ has norm at most $C_p \( parallel I - a_r parallel_oo + parallel B_r parallel_p \)$, because $parallel D v parallel_oo lt.eq C_p parallel v parallel_(W^(2 \, p))$. Choose $r$ so this norm is less than $1 \/ 2$. The Neumann series gives existence, uniqueness in $cal(D)_p$, and $parallel v^i parallel_(W^(2 \, p)) lt.eq C_p parallel B_r^i parallel_p$. A further decrease of $r$ makes $parallel D y - I parallel_oo < 1 \/ 2$. Integrating along straight segments in $B_1$ makes $y$ injective and bilipschitz, so it gives harmonic coordinates on a smaller ball.
  Approximate the metric smoothly in $W^(2 \, s)$ on the rescaled ball. Then $a_j arrow.r a$ uniformly, $B_j arrow.r B$ in $L^p$, and $D B_j arrow.r D B$ in $L^s$. The same contraction gives harmonic coordinates $y_j arrow.r y$ strongly in $W^(2 \, p)$ and $C^1$. For $w_j = partial_ell y_j$, differentiation gives
  $ a_j : D^2 w_j = - \( partial_ell a_j \) : D^2 y_j - \( partial_ell B_j \) dot.op D y_j - B_j dot.op D w_j . $
  The right side is bounded in $L^s$: its first and last products are in $L^(p \/ 2) subset L^s$, and its middle product is in $L^s$. Local frozen-coefficient estimates give uniform $W^(2 \, s)$ bounds for $w_j$ on smaller balls. Applied to differences, these estimates and the already strong $W^(2 \, p)$ convergence give strong local $W^(3 \, s)$ convergence of $y_j$ to $y$.
  The inverse chart $x = y^(- 1)$ is $C^1$ bilipschitz and $W^(2 \, p) ∩ W^(3 \, s)$. This follows by twice and three times differentiating $y \( x \) = "id"$: the second derivatives of $x$ are bounded factors times $D^2 y compose x$, and its third derivatives are bounded factors times $D^3 y compose x$ or $\( D^2 y compose x \)^2$. The latter belongs to $L^(p \/ 2) subset L^s$. The transformed metric remains $W^(2 \, s)$ for the same reason: its second derivatives contain $D^2 gamma$ and $D^3 x$ in $L^s$, and products of two factors among $D gamma$ and $D^2 x$ in $L^(p \/ 2)$. On a fixed smaller image chart the smooth transformed metrics converge strongly in $W^(2 \, s)$. Composition convergence follows by approximation of the composed functions by smooth ones and the uniform Jacobian bounds; the other factors converge in the displayed norms. Since Ricci curvature is continuous from uniformly elliptic $W^(2 \, s)$ metrics to $L^s$, the smooth Ricci transformation laws pass to this limit. Thus the weakly Ricci-flat metric satisfies, in these harmonic coordinates,
  $ a^(a b) partial_a partial_b gamma_(i j) = Q_(i j) \( gamma^(- 1) \, D gamma \) \, $
  where $Q$ is quadratic in $D gamma$ and belongs to $L^t$ with $t = p \/ 2 > s$.
  To obtain actual higher regularity from this equation, take a cutoff $eta$ supported in a small ball and put $u = eta gamma_(i j)$. It has zero trace and satisfies
  $ a : D^2 u = eta Q_(i j) + 2 a \( D eta \, D gamma_(i j) \) + \( a : D^2 eta \) gamma_(i j) = : F in L^t \, $
  using $D gamma in L^p subset L^t$ and boundedness of $gamma$. Choose the ball so that, after normalizing $a$ at its center, the oscillation is small enough for the Dirichlet Neumann inverse of $a : D^2$ at both exponents $s$ and $t$. The inverse at $t$ gives a zero-trace solution $v in W^(2 \, t)$ of $a : D^2 v = F$. Since $t > s$, both $u$ and $v$ belong to $W^(2 \, s)$; their difference has zero trace and solves the homogeneous equation. Uniqueness of the same inverse at $s$ gives $u = v$. Thus the metric actually gains $W^(2 \, t)$ regularity on the smaller ball, rather than merely satisfying a conditional higher-norm estimate.
  As long as $s < n$, the improved exponent is $t = n s \/ \[ 2 \( n - s \) \]$, so $1 \/ t = 2 \/ s - 2 \/ n$. Since $s > n \/ 2$, finitely many iterations reach an exponent greater than $n$, taking slightly smaller exponents if an endpoint is met. The metric is then $C^(1 \, beta)$, its quadratic source is $C^(0 \, beta)$, and Schauder gives $C^(2 \, beta)$ followed by smoothness. The classical harmonic-coordinate regularity theorem #cite(label("DeTurckKazdan1981")) is used only for this final smooth continuation, after the initial Sobolev steps just proved.
  The resulting smooth metric is complete and Ricci flat. Its single Euclidean end gives asymptotic volume ratio one: the compact part has finite volume and the metric error tends to zero, so distance and volume comparison with exterior Euclidean annuli gives this limit for balls about any fixed point. Bishop–Gromov comparison and its equality case #cite(label("Wei2007")) now apply. The volume ratio is nonincreasing, has limit one both at radius zero and at infinity, and hence is identically one. The equality case identifies the complete manifold with $bb(R)^n$. ◻
]

#proof[
  At $S$, (10.1) gives $"Hess" lambda_0 = 0$. Since $partial_nu lambda_0 = kappa_0 > 0$, the tangential Hessian identity shows that $S$ is totally geodesic. In Gaussian coordinates, reflect $h_0$ evenly and $lambda_0$ oddly. The vanishing first normal derivative of the tangential metric and the vanishing second normal derivative of $lambda_0$ make these extensions $C^(2 \, beta)$ for $0 < beta < 1$. The static equations hold across the seam by continuity. On the resulting two-ended double set
  #[#set math.equation(numbering: n => "(10.15)")
   $ gamma = (frac(1 + lambda_0, 2))^(4 \/ \( n - 2 \)) h_0 \, $ <uniq:double-metric>]
  where $lambda_0$ is now the odd extension. The factor is positive at every finite point and on the seam. The conformal scalar law, $R_(h_0) = 0$, and $Delta_(h_0) lambda_0 = 0$ show that $R_gamma = 0$, also across the seam.
  On the retained end,
  $ gamma = (frac(\( 1 + lambda_0 \)^2, 4 lambda_0))^(2 \/ \( n - 2 \)) caron(h) \, #h(2em) frac(\( 1 + lambda_0 \)^2, 4 lambda_0) = 1 + frac(\( 1 - lambda_0 \)^2, 4 lambda_0) . $
  Lemma 65 therefore implies a decay strictly faster than $r^(2 - n)$, with all derivatives, and zero ADM energy. On the other end, expressed using the positive lapse on its original copy,
  $ gamma = (frac(\( 1 - lambda_0 \)^2, 4 lambda_0))^(2 \/ \( n - 2 \)) caron(h) = (a_0 / 2)^(4 \/ \( n - 2 \)) r^(- 4) #scale(x: 120%, y: 120%)[\(] delta + O_j \( r^(- alpha') \) #scale(x: 120%, y: 120%)[\)] $
  for some $alpha' > 0$, decreasing it if necessary. In inverted coordinates $y = x \/ \| x \|^2$ this is a positive constant Euclidean metric plus an error satisfying
  #[#set math.equation(numbering: n => "(10.16)")
   $ \| D^j \( gamma - c delta \) \| lt.eq C_j \| y \|^(alpha' - j) \, #h(2em) c = (a_0 / 2)^(4 \/ \( n - 2 \)) > 0 . $ <uniq:point-estimate>]
  Fill $y = 0$ with that value. Take $0 < alpha' < 2$ and then fix
  #[#set math.equation(numbering: n => "(10.17)")
   $ n / 2 < s < min {n \, frac(n, 2 - alpha')} . $ <uniq:point-exponent>]
  This is a nonempty interval. Estimate (10.16) gives $W^(2 \, s)$ coefficients, since $s \( alpha' - 2 \) + n > 0$. They are continuous and positive at the point. There is no distributional derivative concentrated there: the boundary terms obtained by integrating the first derivatives over $\| y \| = epsilon.alt$ tend to zero by (10.16). Equivalently these are genuine $W^(2 \, s)$ extensions. Scalar curvature is thus $L^s$, and its vanishing off the point implies weak vanishing everywhere.
  The filled double is connected, oriented, complete, without boundary, and has just the retained coordinate end with compact complement. Completeness near the filled point follows from its uniform ellipticity; it follows at the seam from its regular positive metric. It satisfies Lemma 69, so it is Euclidean space.
  The seam is a connected compact embedded totally umbilic hypersurface in this Euclidean space. Indeed its original second fundamental form is zero, and the conformal change (10.15) adds a constant multiple of its induced metric, with nonzero coefficient because $kappa_0 > 0$. A connected Euclidean totally umbilic hypersurface with nonzero principal curvature is contained in a sphere: the Codazzi equation makes that curvature constant, and differentiation of its center $x - nu \/ kappa_(upright("Euc"))$ gives zero. Compactness makes it the whole sphere. The retained component is its unbounded side. After a translation denote the sphere radius by $R$.
  On that component $h_0 = U^(4 \/ \( n - 2 \)) delta$, with $U = 2 \/ \( 1 + lambda_0 \)$. Scalar flatness makes $U$ Euclidean harmonic, and it has boundary value two and limit one at infinity. The exterior Dirichlet maximum principle identifies it uniquely as $1 + R^(n - 2) rho^(2 - n)$. This proves (10.3). The smoothness of the identification at the seam follows either from its harmonic coordinates or from normal geodesic collars of the two smooth metrics. ◻
]

== 11 Recovery of the original data and sharp examples <rec:section>

The preceding uniqueness statement identifies the entire static base. We now use that global identification to recover the original metric, second fundamental form, and signed normalized electric field. The boundary analysis distinguishes a future horizon section from a bifurcation sphere. We then verify the converse and examples within the purely electric class.

#thm([Proposition 11.1.])[
  (Global recovery of the original exterior).  #emph[Under the connected nonextremal equality hypotheses, the original $\( Omega \, g \, K \, E \)$ admits a global orientation-preserving smooth spacelike embedding, including its boundary, into the regular future horizon extension of the Reissner–Nordström–Tangherlini exterior 
#[#set math.equation(numbering: n => "(11.1)")
 $ G_(m \, Q) = - f \( r \) thin upright(d) T^2 + f \( r \)^(- 1) thin upright(d) r^2 + r^2 sigma_k \, #h(2em) f \( r \) = 1 - frac(2 m, r^(k - 1)) + Q^2 / r^(2 k - 2) \, $ <rec:model>]

 with Faraday form 
#[#set math.equation(numbering: n => "(11.2)")
 $ F_(m \, Q) = c_n Q r^(- k) thin upright(d) T and upright(d) r \, #h(2em) c_n = sqrt(frac(k \( k - 1 \), 2)) . $ <rec:faraday>]

 It induces exactly $g \, K \, E$ with $K \( U \, V \) = G_(m \, Q) \( nabla_U N \, V \)$ and $E^flat = c_n^(- 1) iota^(*) \( i_N F_(m \, Q) \)$, and $iota^(*) F_(m \, Q) = 0$. Its boundary is a full smooth future horizon section if $u \|_S > 0$, and is the bifurcation sphere if $u \|_S = 0$. The future normal and all induced data extend smoothly to the boundary; the end approaches the corresponding spatial infinity. Moreover $mu_m = J_m = 0$ on the original exterior.]
] <rec:original-embedding>

#proof[
  We use the lapse and shift $u \, X$, the Killing norm $W = u^2 - \| X \|_g^2$, and the static base from Proposition 63 and Lemma 59. On the open exterior they satisfy
  #[#set math.equation(numbering: n => "(11.3)")
   $ lambda = sqrt(W) > 0 \, quad h_s = g + W^(- 1) X_g^flat ⊗ X_g^flat \,\
A_s = W^(- 1) X_g^flat \, quad upright(d) A_s = 0 \, #h(2em) upright(bold(g)) = - lambda^2 \( upright(d) z - A_s \)^2 + h_s . $ <rec:stationary-form>]
  The associated Faraday form is
  #[#set math.equation(numbering: n => "(11.4)")
   $ F = c_n thin upright(d) z and u E^flat = frac(c_n, k - 1) \( upright(d) z - A_s \) and upright(d) p \, #h(2em) A_s and upright(d) p = 0 . $ <rec:stationary-faraday>]
  The matter tensor already vanishes where $W > 0$, which is the whole open exterior; continuity will give its vanishing on $S$.
  If $Q eq.not 0$, write $s = p \|_S$. The explicit vacuum transformation is
  #[#set math.equation(numbering: n => "(11.5)")
   $ W = \( 1 - p \/ s \) \( 1 - s p \) \, quad 0 < \| s \| < 1 \, quad lambda_0 = frac(lambda, 1 - s p) \, quad h_0 = \( 1 - s p \)^(2 \/ \( n - 2 \)) h_s . $ <rec:inverse-vacuum-transform>]
  The map $p mapsto lambda_0^2 = \( 1 - p \/ s \) \/ \( 1 - s p \)$ has nonzero derivative on the interval between $s$ and zero. Consequently the global round identification of $\( h_0 \, lambda_0 \)$ in Proposition 64 makes $p \, lambda$, and the conformal factor relating $h_s$ to $h_0$ radial. If $Q = 0$, $E = 0$ and $\( h_s \, lambda \) = \( h_0 \, lambda_0 \)$, so the same conclusion holds. In either case the static base is globally diffeomorphic to $\[ 0 \, oo \) times bb(S)^k$, and it is simply connected. Thus the closed one-form in (11.3) has a global primitive on its open part:
  #[#set math.equation(numbering: n => "(11.6)")
   $ A_s = upright(d) Phi \, #h(2em) T = z - Phi . $ <rec:global-time>]
  The stationary metric is therefore globally static there, and the original slice $z = 0$ is the graph $T = - Phi$ over this base.
  Choose the round identification to preserve the given orientation. In outward radial distance $sigma$ the base and lapse have the form
  $ h_s = upright(d) sigma^2 + r \( sigma \)^2 sigma_k \, #h(2em) lambda = lambda \( sigma \) . $
  The normalized electric field of a static slice is radial. Maxwell closure fixes its coefficient, including its sign:
  #[#set math.equation(numbering: n => "(11.7)")
   $ E_0 = Q r^(- k) partial_sigma . $ <rec:static-electric>]
  Indeed the electric flux form on a static slice is, with the stated orientation and normalization, the restriction of the closed spacetime Maxwell flux form. A round sphere in a static slice and the sphere with the same base labels in $z = 0$ are homologous in the stationary product, by varying their time coordinate over that compact sphere. Their fluxes agree. The latter has flux $omega Q$, so radial divergence freeness gives exactly (11.7), not an unsigned coefficient. Equivalently (11.4) says
  #[#set math.equation(numbering: n => "(11.8)")
   $ frac(upright(d) p, upright(d) sigma) = \( k - 1 \) lambda Q r^(- k) . $ <rec:potential-radial>]
  For the radial null vector $lambda^(- 1) partial_T + partial_sigma$, the electric stress has zero null contraction. The warped product Ricci formula therefore gives
  $ 0 = - k / r (r'' - lambda' / lambda r') . $
  Hence $r' \/ lambda$ is constant. The end asymptotics fix this constant as one: $h_s$ is a radial conformal change of the identified vacuum base with factor tending to one, and $lambda arrow.r 1$. Thus
  #[#set math.equation(numbering: n => "(11.9)")
   $ r' = lambda > 0 . $ <rec:radial-lapse>]
  The radial scalar-curvature constraint is
  $ R_(h_s) = frac(k \( k - 1 \), r^2) \( 1 - r' ""^2 \) - frac(2 k, r) r'' \, #h(2em) 1 / 2 R_(h_s) = c_n^2 Q^2 r^(- 2 k) . $
  Writing $f = r' ""^2 = lambda^2$ and using $r$ as coordinate yields
  #[#set math.equation(numbering: n => "(11.10)")
   $ frac(upright(d), upright(d) r) { r^(k - 1) \( 1 - f \) } = \( k - 1 \) Q^2 r^(- k) \, #h(2em) f = 1 - frac(2 m_(*), r^(k - 1)) + Q^2 / r^(2 k - 2) $ <rec:radial-integration>]
  for a constant $m_(*)$. By base attachment, the boundary area is the original area $A$. Put $r_h = \( A \/ omega \)^(1 \/ k)$. The boundary lapse vanishes, so
  $ 2 m_(*) = r_h^(k - 1) + Q^2 / r_h^(k - 1) . $
  The equality hypothesis with $m > \| Q \|$ gives
  #[#set math.equation(numbering: n => "(11.11)")
   $ r_h^(k - 1) = m + sqrt(m^2 - Q^2) \, #h(2em) m_(*) = m . $ <rec:outer-radius>]
  In particular $r_h$ is the outer simple root of $f$. Since $r' = lambda > 0$, the entire open base has range $r_h < r < oo$. Equations (11.8) and (11.9) give $upright(d) p = \( k - 1 \) Q r^(- k) upright(d) r$. Substitution into (11.4) gives precisely (11.2). The metric becomes (11.1).
  The graph map $x mapsto \( T \, r \, theta.alt \) = \( - Phi \( x \) \, r \( x \) \, theta.alt \( x \) \)$ already recovers the original data on $Omega^compose$. Indeed its pullback metric is $h_s - W A_s^2 = g$. In the stationary coordinates its future unit normal is
  #[#set math.equation(numbering: n => "(11.12)")
   $ N = frac(partial_z - X, u) . $ <rec:original-normal>]
  The stationary equation $"sym" nabla X = - u K$ gives the prescribed second fundamental form with this normal. Directly contracting the first expression in (11.4) with (11.12) and restricting to $z = 0$ gives $c_n E^flat$. Its tangential restriction is zero. These identities also show why the global primitive has recovered the original slice, rather than just a static replacement.
  It remains to verify the extension in regular horizon coordinates. The boundary surface gravity from the stationary boundary law is
  #[#set math.equation(numbering: n => "(11.13)")
   $ kappa = frac(k - 1, 2 r_h) (1 - Q^2 / r_h^(2 k - 2)) = 1 / 2 f' \( r_h \) > 0 . $ <rec:surface-gravity>]
  Choose a tortoise primitive $r_(*)$ satisfying $upright(d) r_(*) \/ upright(d) r = f^(- 1)$. Near the simple outer root,
  #[#set math.equation(numbering: n => "(11.14)")
   $ r_(*) = \( 2 kappa \)^(- 1) log W + b \( W \) \, $ <rec:tortoise>]
  where $b$ is smooth. The inversion from $r$ to $W = f \( r \)$ is smooth near the root.
  Suppose first $u \|_S > 0$. In the original smooth collar $\( W \, y \)$, the boundary laws and attachment give
  #[#set math.equation(numbering: n => "(11.15)")
   $ X_g^flat = \( 2 kappa \)^(- 1) upright(d) W + W beta \, #h(2em) A_s = \( 2 kappa \)^(- 1) upright(d) log W + beta \, $ <rec:log-shift>]
  with $beta$ smooth and closed on the whole original collar. The global function $Psi = Phi - \( 2 kappa \)^(- 1) log W$ has differential $beta$ where $W > 0$. Fix $w_0 > 0$ in the collar and define
  $ Psi_(upright("ext")) \( W \, y \) = Psi \( w_0 \, y \) + integral_(w_0)^W beta \( partial_w \) \( w \, y \) thin upright(d) w . $
  This is a global smooth function up to $W = 0$ and agrees with $Psi$ for $W > 0$. Closedness of $beta$ also verifies its tangential derivatives, so no period or patching ambiguity occurs.
  The angular labels extend smoothly in the original collar as well. In the global radial coordinates already obtained, the original orbit metric has the form $h_s = A_1 \( rho \) thin upright(d) rho^2 + A_2 \( rho \) sigma_k$ with positive radial coefficients. Fixed-angle curves are therefore its normal geodesics after parametrization by $h_s$ distance. This remains true after the radial conformal change from the vacuum base. In the attached collar the map $J \( lambda \, y \) = \( - lambda \, y \)$ is a smooth isometry of $h_s$ fixing $S$. Let $pi$ be its normal geodesic projection to $S$. Uniqueness of normal geodesics gives $pi compose J = pi$. If $theta.alt_0 : S arrow.r bb(S)^k$ is the boundary angular diffeomorphism, $theta.alt_0 compose pi$ is a smooth $J$-invariant extension of the global radial labels. Those labels are consequently smooth even functions of $lambda$ with smooth tangential parameters, hence smooth functions of $W = lambda^2$ up to zero.
  On the original slice the ingoing coordinate
  $ v = T + r_(*) = - Phi + r_(*) $
  is smooth by (11.14)–(11.15). In these coordinates the metric and field are
  #[#set math.equation(numbering: n => "(11.16)")
   $ G_(m \, Q) = - f thin upright(d) v^2 + 2 thin upright(d) v thin upright(d) r + r^2 sigma_k \, #h(2em) F_(m \, Q) = c_n Q r^(- k) thin upright(d) v and upright(d) r . $ <rec:ingoing>]
  This is the regular future horizon extension. The cancellation in $T + r_(*)$ fixes the future choice. The boundary map has the form $\( v \( y \) \, r_h \, theta.alt \( y \) \)$, where $theta.alt : S arrow.r bb(S)^k$ is a diffeomorphism. It therefore meets every future horizon generator exactly once. Since $r - r_h$ is a positive constant multiple of $W$ to first order, the collar map is an immersion.
  If instead $u \|_S = 0$, in an original smooth distance coordinate $sigma_0$ the boundary factorizations are
  $ u = sigma_0 a \, #h(2em) X = sigma_0^2 Y \, #h(2em) a \|_S = kappa . $
  Consequently $lambda$ is a smooth positive defining function and $A_s = X_g^flat \/ W$ is smooth on the original collar. The same fixed-level integral construction, now applied to $A_s$ without a logarithmic subtraction, extends its global primitive $Phi$ smoothly to this collar. Hence $T = - Phi$ is smooth there. Use Kruskal coordinates
  #[#set math.equation(numbering: n => "(11.17)")
   $ sans(U) = - e^(kappa \( r_(*) - T \)) \, #h(2em) sans(V) = e^(kappa \( r_(*) + T \)) . $ <rec:kruskal>]
  Since $e^(kappa r_(*)) = lambda e^(kappa b \( lambda^2 \))$, both coordinates are smooth on the slice and vanish at $S$. Their normal derivatives are nonzero, with opposite signs. They give a smooth immersion through the bifurcation sphere; the round angular labels extend by the smooth base collar in this case.
  In both cases the induced metric of the extended immersion equals the original positive metric by continuity. The unique future unit normal consequently extends smoothly, and so do the second fundamental form and the Faraday contractions, with the identities already proved on the interior. The interior graph is injective because its base projection is a diffeomorphism. At the boundary the angular map is a diffeomorphism, and $r = r_h$ separates boundary points from interior points. The collar descriptions prove immersion there. Moreover $r$ is proper on the original closed exterior: it tends to infinity on the sole coordinate end and the remaining core is compact. The inverse image of any compact target set is therefore a closed subset of a compact $r$-sublevel set. Thus this is a proper injective immersion and hence a global embedding including $S$.
  Finally the lapse and shift have controlled constant timelike limits at the original end. In the static end coordinates the graph slope is uniformly bounded away from the null slope. More explicitly $lambda^2 \| upright(d) Phi \|_(h_s)^2 = \| X \|_g^2 \/ u^2$ tends to $\| b \|^2 \/ \( b^0 \)^2 < 1$. Integration along end rays gives $\| T \| lt.eq c r + o \( r \) + C$ for some $c < 1$, after choosing the time origin. Thus the end approaches the corresponding spatial infinity. The already vanishing matter constraints extend to $S$ by smoothness, completing the proof. ◻
]

Figure 2 summarizes the two boundary constructions and their dependence on global uniqueness.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((7.9, 8), [#text(size: 9pt)[On $Omega^ compose$: $W=u^2-|X|_g^2>0$, $lambda = sqrt(W)$.]], anchor: "south", padding: 0.1764cm)
  content((3.65, 7.53), [#text(size: 9pt)[$u|_S>0$]], anchor: "south", padding: 0.1764cm)
  content((12.15, 7.53), [#text(size: 9pt)[$u|_S=0$]], anchor: "south", padding: 0.1764cm)
  content((3.65, 6.88), [#box(width: 7.003cm, inset: 0.1764cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Original collar $(W,y)$#linebreak()$W$ is a smooth boundary defining function.]]])])
  content((12.15, 6.88), [#box(width: 7.003cm, inset: 0.1764cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Original collar $( sigma_0,y)$#linebreak()$u= sigma_0a$, $X= sigma_0^2Y$, $a|_S= kappa$.]]])])
  content((3.65, 4.91), [#box(width: 7.003cm, inset: 0.1764cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Attached base collar $( lambda ,y)$#linebreak()New smooth structure.#linebreak()$h_s$ is smooth in the attached collar.]]])])
  content((12.15, 4.91), [#box(width: 7.003cm, inset: 0.1764cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Attached base collar $( lambda ,y)$#linebreak()Original smooth structure retained.#linebreak()$A_s$ is smooth up to $S$.]]])])
  line((3.65, 5.56), (3.65, 6.355), stroke: (paint: rgb("#595959"), thickness: 0.6pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((3.65, 5.957), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W= lambda^2$]]])])
  line((12.15, 6.355), (12.15, 5.56), stroke: (paint: rgb("#595959"), thickness: 0.6pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((12.15, 5.957), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[retain the collar]]])])
  content((7.9, 2.96), [#box(width: 14.9cm, inset: 0.1764cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#f0f0f0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Both attachments: $h_s|_(T S)=g|_(T S)$, $lambda |_S=0$, $| upright(d) lambda |_(h_s)|_S= kappa >0$.#linebreak() Vacuum reduction and global uniqueness#linebreak()$A_s= upright(d) Phi$, $T=z- Phi$; the original interior slice is the graph $T=- Phi$.]]])])
  line((3.65, 4.26), (3.65, 3.79), stroke: (paint: rgb("#595959"), thickness: 0.6pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  line((12.15, 4.26), (12.15, 3.79), stroke: (paint: rgb("#595959"), thickness: 0.6pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((3.65, 0.38), [#box(width: 7.003cm, inset: 0.1764cm, stroke: (paint: rgb("#1c4068"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#eff2f4"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$v=T+r_*$ is smooth on the original slice.#linebreak()$S arrow.r.long.bar (v(y),r_h, theta (y) )$#linebreak() Full future horizon section]]])])
  content((12.15, 0.38), [#box(width: 7.003cm, inset: 0.1764cm, stroke: (paint: rgb("#1c4068"), thickness: 0.5pt, cap: "round", join: "round"), fill: rgb("#eff2f4"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$T=- Phi$ is smooth; use $( sans(U) , sans(V) , theta )$.#linebreak()$S arrow.r.long.bar (0,0, theta (y) )$#linebreak() Bifurcation sphere]]])])
  line((3.65, 2.12), (3.65, 1.13), stroke: (paint: rgb("#595959"), thickness: 0.6pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((3.65, 1.625), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[ingoing coordinates]]])])
  line((12.15, 2.12), (12.15, 1.13), stroke: (paint: rgb("#595959"), thickness: 0.6pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#595959"))))
  content((12.15, 1.625), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Kruskal coordinates]]])])
})],
  caption: [Figure 2: Boundary attachment and recovery of the original slice in the connected nonextremal equality case. For positive boundary lapse, the upper left arrow is the squaring correspondence from the attached collar to the original collar; its inverse is not smooth at the boundary. For zero boundary lapse, the original smooth structure is retained (Lemma 59). The global primitive $Phi$ enters only after the uniqueness argument, as in (11.6). The two regular spacetime extensions then recover the original $g \, K \, E$, by (11.16), (11.17), and Proposition 70. ],
) <rec:fig-boundary-recovery>

#thm([Proposition 11.2.])[
  (Converse and sharpness).  #emph[Every model slice in the stated converse class, with parameters $M > \| q_0 \|$ and actual invariant ADM mass and signed flux equal to $M \, q_0$, attains equality. For every such parameter pair and every $n gt.eq 4$, this class contains the static exterior slice and smooth compact radial time perturbations of it with $K equiv.not 0$.]
] <rec:sharpness>

#proof[
  Let
  $ r_(+)^(k - 1) = M + sqrt(M^2 - q_0^2) . $
  The degenerate metric on the future horizon is $r_(+)^2 sigma_k$ on its generator labels, independently of the position along a generator. Thus a full section, including the bifurcation sphere, has area $omega r_(+)^k$. The assumed lower bound for all full cuts, and the fact that the boundary is itself a full cut, give
  $ A_min = "Area"_g \( S \) = omega r_(+)^k . $
  Using the actual mass and signed charge specified in the converse now gives the equality formula. This argument does not identify the ADM parameters of arbitrary unqualified model slices.
  We verify the advertised examples, including their geometric hypotheses. Put
  $ f = 1 - 2 M r^(- \( k - 1 \)) + q_0^2 r^(- 2 k + 2) . $
  The static $T = 0$ slice has
  #[#set math.equation(numbering: n => "(11.18)")
   $ g = f^(- 1) upright(d) r^2 + r^2 sigma_k \, quad K = 0 \, quad E = q_0 r^(- k) sqrt(f) thin partial_r \, #h(2em) r gt.eq r_(+) . $ <rec:static-example>]
  The simple root makes the boundary a regular bifurcation sphere: in proper distance $s gt.eq 0$, $r - r_(+) = f' \( r_(+) \) s^2 \/ 4 + O \( s^4 \)$. Thus $g$ and $E$ are smooth to the boundary and complete with it included. The boundary is totally geodesic and future marginal.
  The ambient metric and field obey the stated Einstein–Maxwell normalization in every dimension. For an explicit check, their time and radial mixed Ricci eigenvalues are
  $ - 1 / 2 f'' - frac(k, 2 r) f' = - \( k - 1 \)^2 q_0^2 r^(- 2 k) \, $
  and their angular mixed eigenvalue is
  $ frac(\( k - 1 \) \( 1 - f \) - r f', r^2) = \( k - 1 \) q_0^2 r^(- 2 k) . $
  With $c_n^2 = k \( k - 1 \) \/ 2$, these are exactly $"Ric"_(a b) = 2 F_(a c) F_b zws^c - \( F_(c d) F^(c d) \/ k \) G_(a b)$. The Faraday form is closed, and its spacetime dual has constant sphere flux, hence is closed as well. Gauss–Codazzi and these Maxwell equations give $mu_m = J_m = 0$ and $"div" E = 0$ on every spacelike slice with the prescribed induced fields and vanishing induced magnetic two-form.
  For a nonstatic example choose a smooth nonconstant $tau \( r \)$ compactly supported in an interval $r_(+) + delta < r < R$, and use the graph $T = tau \( r \)$. After multiplying $tau$ by a sufficiently small constant it is spacelike, since
  #[#set math.equation(numbering: n => "(11.19)")
   $ g_tau = a \( r \) thin upright(d) r^2 + r^2 sigma_k \, #h(2em) a = f^(- 1) - f \( tau' \)^2 > 0 . $ <rec:radial-graph>]
  Near the boundary and infinity this is exactly the static slice. Its magnetic two-form vanishes identically, because
  $ iota^(*) \( upright(d) T and upright(d) r \) = tau' \( r \) thin upright(d) r and upright(d) r = 0 . $
  Its normalized electric flux is $q_0$ by Maxwell closure. For example its electric field is $q_0 r^(- k) a^(- 1 \/ 2) partial_r$, as follows by contracting the Faraday form with its future unit normal.
  The end is unchanged. Its momentum is zero, and its energy is $M$: in asymptotic Cartesian coordinates the metric perturbation is $\( f^(- 1) - 1 \) n_i n_j$, with $f^(- 1) - 1 = 2 M r^(- \( n - 2 \)) + O \( r^(- 2 \( n - 2 \)) \)$. The ADM integrand has radial component $\( n - 1 \) \( f^(- 1) - 1 \) \/ r$, giving precisely $M$ with the normalization $\[ 2 \( n - 1 \) omega \]^(- 1)$. All required asymptotic derivative bounds and integrability statements follow.
  Every full cut has area at least $omega r_(+)^k$. Indeed angular projection onto the boundary sphere has differential whose $k$-dimensional Jacobian is at most $\( r_(+) \/ r \)^k lt.eq 1$ for the metric (11.19), regardless of its positive radial coefficient. The integral of the pullback boundary volume form over an end-oriented full cut is $omega r_(+)^k$, by Stokes on the compact region between the cut and a large round sphere. This remains valid for disconnected cuts and portions on the original boundary, with their full intrinsic boundary counted. The comass bound for that pullback form proves the area lower bound. The boundary attains it.
  There is also no smooth interior full weakly future trapped cut. For clarity its exclusion can be checked directly for every spacelike radial graph above. Its outward unit normal within the slice is $a^(- 1 \/ 2) \( partial_r + tau' partial_T \)$, while its future unit spacetime normal is
  $ N = f^(- 1) / sqrt(a) thin partial_T + frac(f tau', sqrt(a)) thin partial_r . $
  The round sphere expansion is consequently
  #[#set math.equation(numbering: n => "(11.20)")
   $ theta_(+) \( r \) = frac(k, r sqrt(a)) \( 1 + f tau' \) > 0 #h(2em) \( r > r_(+) \) \, $ <rec:round-expansion>]
  because spacelikeness gives $\| f tau' \| < 1$. If an interior compact full cut were weakly future trapped, take a point where its radial coordinate is maximal. The full exterior it bounds contains every point with larger radius, so its end-oriented normal at that point is the outward radial normal. It is tangent there to its enclosing round sphere from the inside. The graph mean-curvature comparison gives $H_(upright("cut")) gt.eq H_(upright("sphere"))$ at contact, and their tangential traces of $K$ agree because the tangent planes agree. Equation (11.20) contradicts weak future trapping. This uses the full-cut condition to fix the normal also when the cut is disconnected.
  Finally choose $tau$ with $tau' \( r_0 \) = 0$ and $tau'' \( r_0 \) eq.not 0$ at some interior point. At that point the radial second fundamental form component of the graph is $K_(r r) = sqrt(f \( r_0 \)) thin tau'' \( r_0 \)$ with the stipulated future normal convention. Thus $K$ is nonzero. These examples satisfy all the connected-horizon hypotheses, have the same area, energy, momentum and signed charge as the static examples, and attain equality. ◻
]

#proof[
  #emph[Completion of Theorems 7 and 8.] Proposition 70 proves the Original-Data Rigidity Theorem 7. Proposition 71 proves the Converse and Sharp Examples Theorem 8, including the nonstatic purely electric examples. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
