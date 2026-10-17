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

#align(center)[#text(size: 16pt, weight: "bold")[Ergodicity of triangular billiards \
with an irrational angle]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

A billiard trajectory in a Euclidean triangle moves at unit speed and reflects specularly at an open side: its tangential velocity is preserved and its normal velocity changes sign. The natural probability measure is normalized area in the table times uniform angular measure. Ergodicity asks whether every measurable set invariant under this flow has probability zero or one. Straight sides supply no dispersing curvature, while trajectories meeting a vertex have no prescribed continuation. The effect of repeated reflections therefore carries the essential dynamical difficulty.

Straightening reflected trajectories by unfolding connects polygonal billiards to flat geometry; the phase-space construction and null vertex-hit exception appear explicitly in Zemlyakov–Katok #cite(label("ZK")). For a rational polygon, whose angles are rational multiples of $pi$, the finite reflection group separates the full phase space into invariant directional surfaces. Kerckhoff, Masur, and Smillie proved unique ergodicity in almost every direction #cite(label("KMS")); see also the account of Masur–Tabachnikov #cite(label("MT")) Sections 3.2 and 3.5. The same work yields full-flow ergodicity for a dense $G_delta$ family of tables. Its rational-approximation and Baire-category argument does not assert ergodicity for each irrational triangle.

Vorobets gave a quantitative sufficient approximation condition and explicit ergodic examples #cite(label("Vorobets")) Definition 1.3 and Theorem 1.1. The condition requires exceptionally fast simultaneous rational approximation of the angles; his examples include irrational right triangles. More recently, Chaika and Forni proved weak mixing of the full billiard flow for a dense $G_delta$ set of $n$-gons for each fixed $n gt.eq 3$ #cite(label("CF")). These results distinguish generic or specially approximable tables from a conclusion for every triangle having an irrational angle. Numerical studies of irrational right triangles and fully irrational isosceles triangles have raised doubts about ergodicity #cite(label("WCP")) #cite(label("ZSBJ")). Their finite-time evidence does not establish a positive-measure invariant set and leaves room for very slow convergence of averages.

#thm([Theorem 1.])[
  #emph[Let $Q$ be the interior of a nondegenerate Euclidean triangle with angles $alpha \, beta \, gamma$. Suppose that at least one of 
$ alpha \/ pi \, #h(2em) beta \/ pi \, #h(2em) gamma \/ pi $

 is irrational. The unit-speed billiard flow $Phi_t$, with specular reflection at the open sides, is ergodic on $Q times S^1$ for the probability measure 
$ d mu = frac(d A thin d theta, 2 pi "Area" \( Q \)) . $

 Here trajectories hitting a vertex in either time direction are discarded. In particular, if a measurable set $A$ satisfies $mu \( Phi_t^(- 1) A triangle.stroked.t A \) = 0$ for every $t in bb(R)$, then $mu \( A \) in { 0 \, 1 }$.]
] <thm:main>

In particular, the theorem applies to every triangle for which all three angle ratios are irrational. It also includes triangles with one rational angle and two irrational angles. No genericity or Diophantine condition is imposed. The conclusion concerns the full unit-speed phase space; it is an ergodicity statement for its specified probability measure, not unique ergodicity, mixing, or a claim about each individual orbit.

For each fixed triangle in Theorem 1, the classical conclusion also gives interior and boundary quantum ergodicity for every Dirichlet or Neumann eigenbasis. For every real such eigenbasis, the number of nodal domains tends to infinity along a density-one subsequence. We state the precise spectral conclusions and verify their hypotheses in 7.

The main issue is low regularity. Forni and Moll provide an analytic framework for flat surfaces with cone points #cite(label("FM")). Their angular Fourier decomposition and Cauchy–Riemann identities relate transport invariance to a recurrence among coefficient derivatives. Under non-rational holonomy, their Theorem 4.1 proves constancy of an $L^2$ function invariant under both horizontal directions. Their Corollary 4.2 proves constancy of a geodesic-invariant function in the horizontal Sobolev space $H^(1 \, 0)$, defined by completion of a cone-adapted smooth domain with square-integrable derivatives in both horizontal directions #cite(label("FM")) Section 3.4. A bounded invariant indicator has no such regularity a priori. We work directly with bounded invariant functions, including invariant indicators. The localized energy estimate in 4 first gives an $L^2$ gradient for each angular coefficient. This is a bound on individual coefficients, not a square-summable family of gradients. The remaining step is to prove that each such gradient vanishes.

===== 1.1 Proof strategy. <proof-strategy.>

Glue two copies of the triangle along corresponding sides to form its oriented flat double, whose singular points lie at the three vertices. On its unit tangent bundle, let $X$ denote differentiation along a geodesic and $Y$ differentiation in the perpendicular parallel direction. The equation $X f = 0$ relates neighboring angular Fourier coefficients of an invariant function $f$. For each integer $m$, the sum of angular modes $m \, m + 2 \, m + 4 \, dots.h$ has an $X$-derivative consisting of just one endpoint coefficient derivative. We must show that this endpoint is zero.

We smooth only in position, away from the three cone points. Averaging over long segments that stay clear of the cones gives bounded test functions close to $f$, with a small transport derivative. Integrating the smoothed endpoint equation along these segments yields a pairing that tends to zero. The energy estimate controls the two coefficient gradients in that pairing while the smoothing scale tends to zero. The resulting weak limit satisfies the exact local transport equation. Applying the bounded-coefficient estimate again supplies a new bound independent of the remaining approximation parameter. Only then do we let the weak limits approach $f$. This second passage proves that the endpoint derivative, and hence every coefficient gradient, vanishes. No horizontal Sobolev hypothesis is imposed on $f$.

Parallel coefficients must respect the rotation acquired around a cone point. A single irrational angle eliminates all nonzero angular modes; connectedness makes the remaining mode constant. This isolates the angle hypothesis from the analytic argument.

All the analytic steps needed for this passage are proved below. Constants may depend on the fixed triangle, but not on Fourier indices or small smoothing parameters.

2 sets up the double and coefficient bundles. 3 supplies the supported smoothing identities, and 4 proves the individual-coefficient estimates. 5 carries out the two successive limits. 6 completes the holonomy argument, and 7 derives the spectral consequences.

== 2 The double and angular coefficients <sec:geometry>

We pass to a surface on which reflection becomes straight continuation. Throughout the analytic argument, the triangle is fixed and nondegenerate; no irrationality assumption is needed until 6.

Glue two closed copies of the triangle along corresponding sides, give the copies opposite orientations, and remove the three vertices. The result is a connected oriented flat surface $M$. Its completion is compact and has cone angles $2 alpha \, 2 beta \, 2 gamma$ at the finite set $V$ of removed points. Open edges are regular: continuation across an edge is described by reflecting a Euclidean chart on one copy. Transitions between oriented flat charts are rotations and translations.

Let $S M$ be its unit tangent bundle, $nu$ its normalized Liouville measure, and $Psi_t$ its geodesic flow. Folding to the original triangle sends this flow to the billiard flow. Away from edges, there are two equally weighted sheets, so the folding map sends $nu$ to $mu$. Each regular billiard segment lifts from either initial sheet, and its time map permutes the two sheet choices. The set of trajectories hitting a vertex has measure zero. Indeed, for each fixed finite sequence of crossed sides, unfolding makes a vertex hit the condition that a straight trajectory pass through a fixed point. This is a null condition in position–direction space. The countable union over side sequences, vertices, and both time directions remains null.

There is no additional obstruction from infinitely many reflections in finite time. Such an accumulation could occur only at a vertex: an open side is regular upstairs, and away from the vertices compactness gives regular neighborhoods. Near a vertex, unfold successive reflections in the wedge of its fixed positive angle. A straight line avoiding the tip sweeps at most $pi$ in polar angle, so it crosses only finitely many successive wedge sectors. A line ending at the tip likewise crosses only finitely many before reaching it. Thus the excluded set accounts for all finite-time failures of the flow. On its complement the regular geodesic flow is defined for every time. In flat charts it is translation at fixed angle and preserves area times angular measure. Its local preservation, followed along regular trajectories, proves preservation of $nu$; folding gives the same assertion for $mu$. Edge crossings introduce no singularity upstairs.

In a flat chart write $v = \( cos theta \, sin theta \)$, and set

$ partial = 1 / 2 \( partial_(x_1) - i partial_(x_2) \) \, #h(2em) macron(partial) = 1 / 2 \( partial_(x_1) + i partial_(x_2) \) \, $

#[#set math.equation(numbering: n => "(1)")
 $ X = e^(i theta) partial + e^(- i theta) macron(partial) \, #h(2em) Y = i e^(i theta) partial - i e^(- i theta) macron(partial) . $ <eq:XY>]

These are the forward and perpendicular horizontal vector fields on $S M$; they commute locally. All distributional equations below are on the regular bundle. In particular, a bounded function invariant almost everywhere under each $Psi_t$ satisfies $X f = 0$, by testing against compactly supported smooth functions. We use these equalities in $L^2$ separately for each time, and under time integrals by Fubini. We do not require a representative invariant pointwise outside one common exceptional set for all real times.

We use the angular Fourier framework for flat geodesic flows developed by Forni and Moll #cite(label("FM")) Sections 3.2–3.5, deriving the coordinate rules needed here directly. Fiberwise Fourier projection is globally defined. Locally write

$ P_j u = u_j \( x \) e^(i j theta) \, #h(2em) j in bb(Z) . $

For a change of chart $z' = e^(i phi.alt) z + c$, one has $theta' = theta + phi.alt$ and $u'_j = e^(- i j phi.alt) u_j$. Thus the coefficients are sections of flat unitary line bundles. Their local derivatives transform by

$ \( partial u_j \)' = e^(- i \( j + 1 \) phi.alt) partial u_j \, #h(2em) \( accent(partial u, ‾)_j \)' = e^(- i \( j - 1 \) phi.alt) accent(partial u, ‾)_j . $

The flat gradient of a coefficient means its weak gradient in these trivializations, tested against smooth sections compactly supported in the regular surface. An $L^2$ gradient will always mean a finite global norm on that surface. It does not specify a trace at a cone tip or membership in a completed operator domain. We use the normalized area measure for coefficient norms and $nu$ for bundle norms; Parseval then has no extra factor. Flat gradients are denoted by $nabla$. For fields having horizontal derivatives,

$ ∥nabla u∥_2^2 = ∥X u∥_2^2 + ∥Y u∥_2^2 = sum_j ∥nabla u_j∥_2^2 . $

Inner products are complex and linear in the first entry. The mode identities, also valid distributionally, are

#[#set math.equation(numbering: n => "(2)")
 $ \( X u \)_j = partial u_(j - 1) + accent(partial u, ‾)_(j + 1) \, #h(2em) \( Y u \)_j = i partial u_(j - 1) - i accent(partial u, ‾)_(j + 1) . $ <eq:modes>]

Both terms in each sum have the same unitary transition factor.

== 3 Smoothing away from vertices <sec:smoothing>

The next construction allows differentiation and integration by parts without assigning values at a cone point. Its support margin will be essential when a smoothed field is extended by zero.

Put $r \( x \) = d \( x \, V \)$ in the completed double. There is $K > 0$ such that, for all sufficiently small $epsilon > 0$, every center with $r \( x \) > K epsilon$ has an embedded flat disk of radius $4 epsilon$. Near a fixed cone point a disk of radius $c r \( x \)$ is embedded for some $c > 0$; away from the ends, compactness supplies the assertion. Also, for each fixed $L$,

#[#set math.equation(numbering: n => "(3)")
 $ "Area" { r lt.eq L epsilon } = O_L \( epsilon^2 \) . $ <eq:area>]

Choose a nonnegative smooth radial kernel of mass one in the unit disk, denoted by $rho$, and put $rho_epsilon \( y \) = epsilon^(- 2) rho \( y \/ epsilon \)$. At a center with $r > K epsilon$, define

$ \( S_epsilon u \) \( x \, theta \) = integral_(bb(R)^2) rho_epsilon \( y \) u \( x - y \, theta \) thin d y $

in an embedded flat disk, keeping the direction parallel. The formula uses ordinary Euclidean area inside that chart. Radiality makes it independent of the oriented flat chart. Call ${ r > K epsilon }$ the safe region. When a norm is taken over a base set, its inverse image in $S M$ is understood.

#thm([Lemma 2.])[
  #emph[The operators just defined have the following properties.]
  + #emph[On the safe region, $S_epsilon$ and $epsilon nabla S_epsilon$ are uniformly bounded from $L^2 \( S M \)$ to $L^2$. They commute locally with $X \, Y$, including on distributions, and $∥S_epsilon u∥_oo lt.eq ∥u∥_oo$.]
  + #emph[For every fixed $u in L^2 \( S M \)$, 
#[#set math.equation(numbering: n => "(4)")
 $ epsilon ∥Y S_epsilon u∥_(L^2 \( r > K epsilon \)) arrow.r 0 . $ <eq:small-derivative>]

 On compact regular sets, $S_epsilon u arrow.r u$ locally in $L^2$.]
  + #emph[Fix $L > K + 4$. If $g in L^2 \( S M \)$ vanishes on ${ r < L epsilon }$, then $S_epsilon g$ is supported in ${ r gt.eq \( L - 1 \) epsilon }$ and extends by zero to a field with compact spatial support in $M$. For $u in L^2 \( S M \)$, 
#[#set math.equation(numbering: n => "(5)")
 $ ⟨Y S_epsilon u \, g⟩ = - ⟨u \, Y S_epsilon g⟩ . $ <eq:adjoint>]

 The left pairing uses only safe centers. The analogous identity without $Y$ is symmetric. If $X g in L^2$ distributionally, then 
#[#set math.equation(numbering: n => "(6)")
 $ X \( S_epsilon g \) = S_epsilon \( X g \) \, #h(2em) ∥X S_epsilon g∥_2 lt.eq C ∥X g∥_2 \, $ <eq:commute>]

 with the same zero-extension convention.]
] <lem:smoothing>

#proof[
  In a flat chart containing the convolution disks, the operation is ordinary spatial convolution at fixed angle. Its kernel, and its first spatial derivative multiplied by $epsilon$, have uniformly bounded absolute integrals in either spatial variable. Parallel transport preserves angular measure. The usual kernel bound on $L^2$ therefore proves the asserted norms. Local commutation, positivity, and the $L^oo$ estimate follow from the same chart description.
  For a smooth compactly supported input, the expression in (4) tends to zero directly: for small scales its convolution remains away from the tips and its first derivatives are uniformly bounded in $L^2$. Such inputs are dense in $L^2 \( S M \)$; the uniform scaled-derivative bound proves the claim for any fixed input. The ordinary approximate-identity argument gives local convergence.
  For the third assertion, a contributing kernel pair has base points at distance at most $epsilon$. If one point is in the support of $g$, both lie strictly inside the safe region. Reversal of the short segment reverses its parallel transport and leaves the radial kernel unchanged. This gives symmetry. In a common flat chart the kernel satisfies $Y_x K_epsilon \( x - y \) = - Y_y K_epsilon \( x - y \)$, with the angles identified by parallel transport. Kernel differentiation and Fubini give (5). No derivative of $g$ is required.
  The support estimate follows from the triangle inequality for $r$. In particular, the convolution vanishes in a neighborhood of the boundary of the safe region, so its extension by zero creates no boundary derivative. Distributional local commutation proves (6); $X g$ is supported in the same closed spatial support as $g$, and the $L^2$ kernel bound gives the final inequality. ◻
]

== 4 A localized coefficient estimate <sec:energy>

The estimate below uses the full gradient only where transport invariance fails. This will confine the cost of cutting off an invariant function to small cone annuli. The square summability used in its proof belongs to the regularized test field; it will not be assumed for the original invariant function. The equal Cauchy–Riemann norms and parity recurrence also underlie Forni–Moll’s Sobolev arguments #cite(label("FM")) Lemma 3.3, Corollary 4.2, and Lemma 5.1. We prove the support-localized version needed here on compact subsets of the regular surface.

#thm([Lemma 3.])[
  #emph[Let $w in L^2 \( S M \)$ have compact spatial support in $M$, with $X w \, Y w in L^2 \( S M \)$ in the sense of distributions. If $X w$ vanishes over $M \\ E$, where $E subset M$ is measurable, then for every $j in bb(Z)$, 
#[#set math.equation(numbering: n => "(7)")
 $ ∥nabla w_j∥_2^2 lt.eq 4 ∥X w∥_2 ∥upright(bold(1))_E nabla w∥_2 . $ <eq:energy>]

]
] <lem:energy>

#proof[
  For each coefficient, integration by parts gives
  #[#set math.equation(numbering: n => "(8)")
   $ ∥partial w_j∥_2^2 = ∥accent(partial w, ‾)_j∥_2^2 = 1 / 4 ∥nabla w_j∥_2^2 . $ <eq:CR-norms>]
  Indeed, the difference of the first two squared norms is proportional to the integral of $d w_j and d overline(w_j)$. The primitive $w_j thin d overline(w_j)$ is global because its constant unitary transition factors cancel, and its support is compact in the regular surface. Stokes gives zero. Spatially smooth fields suffice initially; ordinary local Sobolev approximation gives the stated generality.
  Put $D_j = ∥partial w_j∥_2^2$. By (2) and (8),
  $ D_j - D_(j + 2) = "Re" ⟨\( X w \)_(j + 1) \, partial w_j - accent(partial w, ‾)_(j + 2)⟩ . $
  The pairing is over $E$, since its first factor vanishes elsewhere. Moreover $D_k arrow.r 0$ as $k arrow.r + oo$, because the horizontal derivatives of $w$ are square summable in their Fourier modes. Telescoping in steps of two and applying Cauchy–Schwarz gives
  $ D_j lt.eq ∥X w∥_2 (sum_(k gt.eq 0) ∥upright(bold(1))_E \( partial w_(j + 2 k) - accent(partial w, ‾)_(j + 2 k + 2) \)∥_2^2)^(1 \/ 2) . $
  Pointwise in the base variable, the sum inside is bounded by
  $ 2 sum_(ell in bb(Z)) \( \| partial w_ell \|^2 + \| accent(partial w, ‾)_ell \|^2 \) = sum_(ell in bb(Z)) \| nabla w_ell \|^2 . $
  Parseval and (8) prove (7). ◻
]

#thm([Lemma 4.])[
  #emph[On the regular double $M$ of a fixed nondegenerate triangle, suppose $h in L^oo \( S M \)$, $∥h∥_oo lt.eq H$, and $X h = 0$ locally in distributions. Then every coefficient has a global square-integrable flat gradient, and 
#[#set math.equation(numbering: n => "(9)")
 $ ∥nabla h_j∥_2 lt.eq C H #h(2em) \( j in bb(Z) \) . $ <eq:bounded-modes>]

]
] <lem:bounded-modes>

#proof[
  Take a smooth spatial cutoff $chi_epsilon$ equal to zero for $r lt.eq \( K + 1 \) epsilon$, equal to one for $r gt.eq \( K + 2 \) epsilon$, with $\| nabla chi_epsilon \| lt.eq C \/ epsilon$. For small $epsilon$, its transition regions are disjoint cone annuli. Set $w = chi_epsilon S_epsilon h$, extended by zero near the vertices. This field has compact spatial support and square-integrable horizontal derivatives. Local commutation gives
  $ X w = \( X chi_epsilon \) S_epsilon h . $
  Thus $X w$ is supported in the transition annuli $E_epsilon$, whose total area is $O \( epsilon^2 \)$. On these annuli the kernel derivative estimate and boundedness of $h$ give
  $ \| X w \| + \| nabla w \| lt.eq C H \/ epsilon . $
  Both norms on the right of (7) are at most $C H$. Hence $∥nabla w_j∥_2 lt.eq C H$, independently of $epsilon \, j$.
  For each fixed $j$, local $L^2$ convergence of $w_j$ to $h_j$ and weak compactness of its globally bounded gradients identify the weak gradient limit with $nabla h_j$, by testing in regular charts. Lower semicontinuity gives (9). This argument neither assigns traces at the cone tips nor asserts square summability over $j$. ◻
]

The hypothesis of 4 is the local distributional equation, rather than invariance under the globally defined measurable flow. This distinction will let us apply it to a weak limit in the next section without first establishing a new global invariance statement.

== 5 From flow invariance to parallel coefficients <sec:rigidity>

We now show that the individual gradients just obtained are zero. The proof uses the regularized coefficient estimate twice: first to pass a fixed-mode pairing through the smoothing limit, and then to pass it through a second approximation limit. The two limits have different uniform estimates.

#thm([Proposition 5.])[
  #emph[If $f in L^oo \( S M \)$ is invariant almost everywhere under $Psi_t$ for each $t in bb(R)$, then 
$ partial f_j = accent(partial f, ‾)_j = 0 #h(2em) \( j in bb(Z) \) $

 as distributions on the regular surface.]
] <prop:rigidity>

#proof[
  Write $H = ∥f∥_oo$. The case $H = 0$ is immediate. We know $X f = 0$, so 4 applies. Fix $m in bb(Z)$ throughout the following argument.
  #emph[The endpoint equation.] Define
  #[#set math.equation(numbering: n => "(10)")
   $ U = sum_(k gt.eq 0) P_(m + 2 k) f in L^2 \( S M \) \, #h(2em) B = e^(i \( m - 1 \) theta) accent(partial f, ‾)_m in L^2 \( S M \) . $ <eq:tail>]
  The latter expression is a global field of mode $m - 1$. The recurrence (2) implies
  #[#set math.equation(numbering: n => "(11)")
   $ X U = B $ <eq:endpoint>]
  distributionally. One precise verification uses finite tails $U_N$:
  $ X U_N = B + e^(i \( m + 2 N + 1 \) theta) partial f_(m + 2 N) . $
  The terminal fields $R_N$ are uniformly bounded in $L^2$ by 4, and their angular modes tend to infinity. For any fixed $phi in L^2 \( S M \)$,
  $ \| ⟨R_N \, phi⟩ \| lt.eq C H ∥P_(m + 2 N + 1) phi∥_2 arrow.r 0 . $
  Thus they converge weakly to zero; their norms need not tend to zero. Since $U_N arrow.r U$ in $L^2$, (11) follows. On safe disks, smoothing gives
  #[#set math.equation(numbering: n => "(12)")
   $ X Y S_epsilon U = Y S_epsilon B . $ <eq:smoothed-equation>]
  Our aim is to prove $⟨B \, P_(m - 1) Y f⟩ = 0$. The recurrence (2) gives $P_(m - 1) Y f = - 2 i B$, so that identity forces $B = 0$; the construction below obtains it without assuming $Y f in L^2$.
  #emph[Long segments with clearance.] Fix $s > 0$, put $T = s \/ epsilon$, and fix $L > K + 4$. This time scale keeps the discarded mass of order $s$, while the endpoint error will vanish as $epsilon arrow.r 0$ at fixed $s$. Let $G_epsilon$ be the set of regular states whose trajectories satisfy $r \( Psi_t z \) > L epsilon$ throughout $0 lt.eq t lt.eq T$. The distance function is $1$-Lipschitz along a unit-speed path. A time mesh of spacing at most $epsilon$, with at most $T \/ epsilon + 2$ points, detects every failure of this condition inside ${ r lt.eq \( L + 1 \) epsilon }$. Measure preservation and (3) therefore give
  #[#set math.equation(numbering: n => "(13)")
   $ nu \( S M \\ G_epsilon \) lt.eq C \( T epsilon + epsilon^2 \) = C \( s + epsilon^2 \) . $ <eq:bad-measure>]
  Null sets of singular states may be ignored.
  Set $a_epsilon = f upright(bold(1))_(G_epsilon)$ and form the negative-time average
  #[#set math.equation(numbering: n => "(14)")
   $ g_epsilon = 1 / T integral_0^T a_epsilon compose Psi_(- t) thin d t . $ <eq:average>]
  It has absolute value at most $H$. If an integrand is nonzero at $z$, then $z$ lies at time $t$ on a good segment starting at $Psi_(- t) z$. Consequently $g_epsilon = 0$ on ${ r < L epsilon }$. Invariance of $f$, Minkowski’s inequality, and (13) show that
  #[#set math.equation(numbering: n => "(15)")
   $ ∥g_epsilon - f∥_2 lt.eq C H sqrt(s + epsilon^2) \, #h(2em) ∥X g_epsilon∥_2 lt.eq frac(2 H, T) . $ <eq:average-bounds>]
  For the second assertion, finite-time averaging gives the weak identity
  $ X g_epsilon = frac(a_epsilon - a_epsilon compose Psi_(- T), T) . $
  It follows by testing (14) against a compactly supported smooth regular field, changing variables by the flow, and integrating its derivative in $t$. It does not differentiate the indicator of $G_epsilon$.
  #emph[Integrating the smoothed equation.] We justify use of the fundamental theorem in (12) along good segments, despite the absence of angular smoothing. For each fixed $epsilon$, choose a countable cover by flat charts enlarged to contain the required convolution disks. For almost every angular slice in each chart, the smoothed fields have smooth spatial representatives and their differential identity holds everywhere in position. Overlap identities have the same property; include their exceptional angular sets in this countable collection.
  During a visit to a flat chart a regular orbit has constant chart angle. If it met one of the exceptional slices, it would remain in that slice for an open time interval, which contains a rational time. For each chart and rational time the set of such initial states is null, by measure preservation. Removing their countable union makes the calculus valid along every chart visit of almost every good segment. Smooth spatial representatives agree on overlaps, so their identities can be integrated along the whole segment. This argument also handles its endpoints by regular continuation there.
  Changing variables in the pairing with (14), and using the fundamental theorem, now gives
  #[#set math.equation(numbering: n => "(16)")
   $ ⟨Y S_epsilon B \, g_epsilon⟩ = 1 / T integral_(G_epsilon) overline(f \( z \)) #scale(x: 120%, y: 120%)[\[] \( Y S_epsilon U \) \( Psi_T z \) - \( Y S_epsilon U \) \( z \) #scale(x: 120%, y: 120%)[\]] thin d nu \( z \) . $ <eq:segment-identity>]
  Both endpoints are safe. By Cauchy–Schwarz and measure preservation, the absolute value of the right side is at most
  $ frac(2 H, s) thin epsilon ∥Y S_epsilon U∥_(L^2 \( r > K epsilon \)) = o \( 1 \) #h(2em) \( epsilon arrow.r 0 \, med s upright(" fixed") \) \, $
  by (4). Here $U$ is fixed.
  Put $w_epsilon = S_epsilon g_epsilon$, with the supported extension of 2. Its adjoint identity converts (16) into
  #[#set math.equation(numbering: n => "(17)")
   $ ⟨B \, Y w_epsilon⟩ = o \( 1 \) . $ <eq:pairing-small>]
  The same lemma and (15) give
  $ ∥nabla w_epsilon∥_2 lt.eq C H \/ epsilon \, #h(2em) ∥X w_epsilon∥_2 lt.eq C H \/ T . $
  It has compact spatial support in $M$. Applying 3 with $E = M$ yields
  #[#set math.equation(numbering: n => "(18)")
   $ ∥nabla \( w_epsilon \)_j∥_2^2 lt.eq C H^2 \/ s #h(2em) \( j in bb(Z) \) . $ <eq:fixed-s-bound>]
  #emph[The first limit: fixed $s$.] Take a sequence $epsilon arrow.r 0$ and a subsequence along which $w_epsilon$ converges weakly in $L^2$ to $g^(\( s \))$. The closed convex set ${ \| u \| lt.eq H } subset L^2$ is weakly closed, so $∥g^(\( s \))∥_oo lt.eq H$. For a fixed smooth compactly supported test field $phi$, symmetry of convolution gives, for sufficiently small $epsilon$,
  $ ⟨w_epsilon - g_epsilon \, phi⟩ = ⟨g_epsilon \, S_epsilon phi - phi⟩ arrow.r 0 . $
  The uniform $L^2$ bound and density of these tests show that $g_epsilon$ has the same weak $L^2$ limit. Therefore
  #[#set math.equation(numbering: n => "(19)")
   $ X g^(\( s \)) = 0 \, #h(2em) ∥g^(\( s \)) - f∥_2 lt.eq C H sqrt(s) . $ <eq:limit-function>]
  The first equality follows either from (15) or the bound for $X w_epsilon$; the second follows by weak lower semicontinuity.
  Only coefficient derivatives at modes $m$ and $m - 2$ contribute to (17), because $B$ has mode $m - 1$. For fixed $s$, (18) allows a further subsequence on which both these gradients converge weakly in their global $L^2$ spaces. Testing in regular charts identifies the limits as the gradients of the corresponding coefficients of $g^(\( s \))$. Since $B$ is fixed in $L^2$, passing to the limit gives
  #[#set math.equation(numbering: n => "(20)")
   $ ⟨B \, P_(m - 1) Y g^(\( s \))⟩ = 0 . $ <eq:first-limit>]
  Here this projected derivative means the combination of the two coefficient derivatives in (2); no full $L^2$ bound on $Y g^(\( s \))$ is asserted.
  #emph[The second limit: $s arrow.r 0$.] We do not use the deteriorating bound (18) for this limit. Instead, $g^(\( s \))$ is bounded by $H$ and solves the exact local equation in (19), so 4 gives
  $ ∥nabla \( g^(\( s \)) \)_j∥_2 lt.eq C H \, $
  uniformly in $s$. Choose $s_n arrow.b 0$ and the limits just constructed for each $s_n$. By (19), they converge strongly to $f$ in $L^2$. Their relevant gradients are bounded in $L^2$, and every weak subsequential limit is identified locally with the corresponding gradient of $f$. Thus (20) implies
  $ ⟨B \, P_(m - 1) Y f⟩ = 0 . $
  The equation $X f = 0$ in mode $m - 1$ says $partial f_(m - 2) = - accent(partial f, ‾)_m$. By (2),
  $ P_(m - 1) Y f = - 2 i B \, #h(2em) 0 = ⟨B \, - 2 i B⟩ = 2 i ∥B∥_2^2 . $
  Hence $accent(partial f, ‾)_m = 0$. Since $m$ was arbitrary, the recurrence also gives $partial f_j = 0$ for every $j$, proving the proposition. ◻
]

== 6 Holonomy and the conclusion <sec:conclusion>

#proof[
  Relabel the vertices so that $alpha \/ pi$ is irrational. Let $A$ be a measurable invariant set as in the theorem, and lift its indicator to a bounded invariant function $f$ on $S M$. By 5, each coefficient has zero flat gradient. In every regular chart it therefore has a constant representative, and these constants match under the unitary transitions. Each coefficient is a parallel section.
  Continuation around the vertex of angle $alpha$ has holonomy rotation by $- 2 alpha$ modulo $2 pi$, as follows by developing its punctured cone of angle $2 alpha$. A parallel coefficient of mode $j$ must consequently be fixed by the phase $e^(2 i j alpha)$. If $j eq.not 0$, irrationality of $alpha \/ pi$ makes that phase different from one, so the coefficient vanishes. The zeroth coefficient is constant on the connected surface $M$. Fourier completeness shows that $f$ is constant almost everywhere. As an indicator with the same mass as $A$, it has integral zero or one. Thus $mu \( A \) in { 0 \, 1 }$. ◻
]

#prodef([Remark 6.])[
  The precise angle condition is visible in the last step. All the analytic arguments apply to the double of a fixed nondegenerate triangle. A single irrational angle is enough to eliminate every nonzero parallel mode, which is why 1 includes triangles with one rational angle as well as triangles with three irrational angles. Since the three angles sum to $pi$, exactly one irrational angle and two rational angles cannot occur. The constants in the analytic estimates are allowed to depend on the triangle.
]

== 7 Quantum ergodicity and nodal domains <sec:spectral>

The full-flow theorem has spectral consequences for each fixed triangle in its scope. The following statement keeps the boundary-condition dependence of the Cauchy data and their limiting measure explicit.

#thm([Corollary 7.])[
  #emph[Let $Q$ satisfy the hypotheses of Theorem 1, and fix either Dirichlet ($B = D$) or Neumann ($B = N$) boundary conditions. Let $\( u_j \)_(j gt.eq 1)$ be any complete orthonormal eigenbasis of $L^2 \( Q \)$ for the corresponding Laplacian, with 
$ - Delta_B u_j = lambda_j^2 u_j \, #h(2em) 0 lt.eq lambda_1 lt.eq lambda_2 lt.eq dots.h.c \, $

 where frequencies are listed with multiplicity. A set $S subset bb(N)$ has density one if $\# \( S ∩ { 1 \, dots.h \, N } \) \/ N arrow.r 1$. Then the following conclusions hold.]
  + #emph[There is a density-one set $S_(upright("int"))$ such that, for every classical order-zero pseudodifferential operator $A$ whose Schwartz kernel is compactly supported in $Q times Q$, 
$ lim_(j arrow.r oo\
j in S_(upright("int"))) chevron.l A u_j \, u_j chevron.r_(L^2 \( Q \)) = integral_(Q times S^1) sigma_0 \( A \) thin d mu . $

 Here the Euclidean metric identifies unit covectors with $Q times S^1$, and $sigma_0 \( A \)$ is restricted to them.]
  + #emph[Let $Gamma$ be the regular boundary, the union of the three open sides. For $lambda_j > 0$, let $h_j = lambda_j^(- 1)$ and define the Cauchy data on the open sides by 
$ u_j^b = cases(delim: "{", h_j thin partial_nu u_j \|_Gamma \, & B = D \,, u_j \|_Gamma \, & B = N \,) $

 where $nu$ is the outward unit normal. Write $B^(*) Gamma = { \( s \, eta \) in T^(*) Gamma : \| eta \| < 1 }$, using arc length $s$ and signed tangential covector $eta$ on each side. There is a density-one set $S_partial subset { j : lambda_j > 0 }$ such that, for every $a in C_c^oo \( T^(*) Gamma \)$ and a properly supported order-zero semiclassical quantization $A_h = "Op"_h \( a \)$, 
$ lim_(j arrow.r oo\
j in S_partial) chevron.l A_(h_j) u_j^b \, u_j^b chevron.r_(L^2 \( Gamma \)) = frac(2, pi "Area" \( Q \)) integral_(B^(*) Gamma) a \( s \, eta \) w_B \( eta \) thin d s thin d eta \, $

 where 
$ w_D \( eta \) = sqrt(1 - eta^2) \, #h(2em) w_N \( eta \) = \( 1 - eta^2 \)^(- 1 \/ 2) . $

 The Cauchy data are not further normalized to have unit boundary norm.]
  + #emph[If the eigenbasis is real-valued, there is a density-one set $S_(upright("nod"))$ such that the number of nodal domains of $u_j$, the connected components of $Q \\ { u_j = 0 }$, tends to infinity as $lambda_j arrow.r oo$ with $j in S_(upright("nod"))$.]
] <cor:quantum>

#proof[
  Place $overline(Q)$ in a sufficiently large flat torus. Its boundary is Lipschitz, with three smooth open sides and a finite codimension-two singular set; incident sides meet transversely. Thus the triangle meets the piecewise-smooth hypotheses in #cite(label("Burq")) Section 2, #cite(label("HZ")) Definition 3.1, and #cite(label("Hezari")) Definition 1.16, including the last reference’s metric-extension condition. Theorem 1 supplies the required billiard-flow ergodicity. The first conclusion is the interior quantum-ergodicity theorem of Zelditch and Zworski #cite(label("ZZ")), in the Dirichlet and Neumann formulation recalled in #cite(label("Burq")) Theorem 2 and Remark 2.1.
  For the boundary conclusion, discard the null sets of vertex hits and tangential collisions. The collision section is $B^(*) Gamma$, with invariant measure $d s thin d eta$. Boundary-flight coordinates identify the flow, up to null sets, with the suspension of its collision map under the positive free-flight time $tau$, and Liouville measure is proportional to $d s thin d eta thin d t$ for $0 lt.eq t < tau$. The roof $tau$ is positive almost everywhere and bounded by the diameter of $Q$. Hence an invariant collision set of positive measure with positive-measure complement would suspend to a nontrivial invariant flow set, contradicting Theorem 1. The collision map is therefore ergodic. Hassell–Zelditch’s boundary theorem #cite(label("HZ")) Theorem 1.1, equations (1.3)–(1.5), and Section 7 now gives the second conclusion: its prefactor is $4 \/ \( "vol" \( S^1 \) "Area" \( Q \) \) = 2 \/ \( pi "Area" \( Q \) \)$. Their inward normal instead of our outward normal changes the Dirichlet data by a sign and leaves the quadratic pairing unchanged.
  Finally, Hezari’s nodal-domain theorem for two-dimensional ergodic billiards with piecewise-smooth boundary #cite(label("Hezari")) Theorem 1.6 gives the third conclusion for real eigenfunctions. The finitely many zero-frequency terms have no effect on density. The three density-one sets may be replaced by their finite intersection when a simultaneous subsequence is desired. ◻
]

The subsequences may depend on the fixed triangle, boundary condition, and eigenbasis. Zero-density exceptional subsequences remain possible: these conclusions assert neither quantum unique ergodicity nor an equidistribution or nodal-count rate, mixing, or a spectral-statistics law.


#bibliography("refs.bib", style: "ieee", title: [References])
