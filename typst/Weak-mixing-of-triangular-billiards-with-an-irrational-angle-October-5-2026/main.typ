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

#align(center)[#text(size: 16pt, weight: "bold")[Weak mixing of triangular billiards \
with an irrational angle]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

Let $Q subset bb(R)^2$ be a nondegenerate Euclidean triangle.
  Its unit-speed billiard flow $Phi_t$ moves in straight lines in the interior and reflects specularly at the open
  sides. Trajectories meeting a vertex in either time direction are discarded; they form a null set.
  The invariant probability measure on position and direction is normalized Liouville measure

$ d mu \( x \, theta \) = frac(d A \( x \) thin d theta, 2 pi "Area" \( Q \)) . $

We say that the flow is #emph[weakly mixing] if its product with itself,
  $\( x \, y \) mapsto \( Phi_t x \, Phi_t y \)$, is ergodic for $mu ⊗ mu$.
  Thus every measurable set invariant under all product time maps has measure zero or one.

#thm([Theorem 1.1.])[
  #emph[The unit-speed billiard flow in every nondegenerate Euclidean triangle with at least one angle irrational
    relative to $pi$ is weakly mixing for normalized Liouville measure.]
] <thm:main>

In particular, for triangles of area one with angles $alpha \, beta \, pi - alpha - beta$,
  the conclusion holds for Lebesgue-almost every point of

$ D = { \( alpha \, beta \) in bb(R)^2 : alpha > 0 \, med beta > 0 \, med alpha + beta < pi } : $

the excluded pairs with both $alpha \/ pi$ and $beta \/ pi$ rational form a countable set.
  The irrationality assumption is sharp for the full phase space.
  In a rational triangle, side reflections generate a finite group on directions.
  A nonconstant function on the circle invariant under this finite group is then an invariant function for the
  billiard flow, so the full flow is not ergodic.

===== 1.1 Historical context. <historical-context.>

Polygonal billiards connect elementary reflection geometry with dynamics on flat surfaces.
  The unfolding construction of Zemlyakov and Katok #cite(label("ZK")) replaces reflections by straight
  continuation on a surface. For rational polygons, it produces a compact translation surface and separates the
  full phase space into invariant directional surfaces. Kerckhoff, Masur,
  and Smillie proved unique ergodicity in almost every direction #cite(label("KMS")).
  They also obtained ergodicity of the full billiard flow for a dense $G_delta$ family of polygons.
  Vorobets gave a quantitative rational-approximation criterion and explicit ergodic examples,
  including irrational right triangles #cite(label("Vorobets")).
  These results establish ergodicity under genericity or sufficiently rapid approximation assumptions rather than
  for each irrational triangle.

Chaika and Forni proved that the full billiard flow is weakly mixing for a dense $G_delta$ set of polygons with
  any fixed number of sides at least three #cite(label("CF")).
  Their argument uses the absence of common nontrivial eigenvalues for directional flows in almost every pair of
  directions on a translation surface. The Baire-category conclusion does not assert Lebesgue-almost-everywhere
  weak mixing in the space of triangle angles. For rational billiards, recent work of Arana-Herrera, Chaika,
  and Forni characterizes weak mixing in almost every direction #cite(label("ACF"));
  this is a statement on directional invariant surfaces, rather than on the full Liouville phase space considered here.

Numerical investigations have long suggested weak mixing in irrational right triangles and mixing in triangles
  with all angles irrational #cite(label("ACG")) #cite(label("CP")).
  Other computations have suggested nonergodicity in some irrational right or symmetric triangles
  #cite(label("WCP")) #cite(label("ZSBJ")). These conflicting finite-time observations underscore the difficulty
  of identifying measurable invariants from trajectories with slow statistical convergence.
  Theorem 1 treats every irrational triangle without an approximation or symmetry restriction.

===== 1.2 Analytic contribution. <analytic-contribution.>

The regularity of an eigenfunction is the central issue. Glue two oppositely oriented copies of $Q$ along their
  sides. The resulting flat double is regular across the open sides and has cone points at the vertices.
  On its unit tangent bundle, let $X$ denote differentiation along a geodesic and $Y$ differentiation in the
  perpendicular parallel direction. Locally these vector fields commute.
  Forni and Moll developed angular Fourier and Cauchy–Riemann methods in this setting #cite(label("FM"))
  Sections 3.2–3.5. Their rigidity results distinguish invariance under both horizontal directions from geodesic
  invariance under an additional horizontal Sobolev hypothesis #cite(label("FM")) Theorem 4.1 and Corollary 4.2.
  A measurable flow eigenfunction supplies only $X f = i lambda f$ at the outset;
  the missing transverse derivative cannot be assumed.

The companion manuscript #cite(label("Companion")) Sections 2–6 removes this regularity obstacle for invariant
  functions, proving ergodicity of irrational triangular billiards.
  We extend its coefficient-energy and long-average method to every real spectral parameter $lambda$.
  Summing the coefficient-energy identities over consecutive angular indices makes the terms containing $lambda$
  telescope to a single boundary term. A separate pairing with the two boundary modes produced by differentiating
  an angular Fourier tail gives the sharp bound

$ ∥X f∥_2^2 + ∥Y f∥_2^2 lt.eq lambda^2 ∥f∥_2^2 . $

Since $X f = i lambda f$, it follows that $Y f = 0$. The use of a spectral parameter in Cauchy–Riemann energy
  estimates has a related precedent in the twisted cohomological equations studied by Forni
  #cite(label("Forni2022")) Section 3. Here the argument starts with bounded measurable eigenfunctions and proves
  the needed derivative bounds. We give a self-contained proof of this analytic extension below.

===== 1.3 Proof strategy. <proof-strategy.>

Expand a bounded eigenfunction on the double in angular Fourier modes.
  Spatial smoothing away from the cone points and cutoffs near the tips first give a uniform bound on the gradient
  of each coefficient. These individual bounds do not yet give a square-summable family of gradients.
  To obtain the missing summability, take the sum of all modes above a fixed index.
  Its derivative under $X - i lambda$ consists of two endpoint terms.

We test this equation using long time averages supported on orbit segments that stay clear of the cone points.
  There are two approximation parameters. At a fixed bound on the discarded measure,
  the smoothing limit gives a bounded solution of the exact local eigenfunction equation and passes the endpoint
  pairing to it. The individual-coefficient estimate then supplies a new derivative bound independent of the
  discarded measure. A second limit passes the pairing to the original eigenfunction.
  Summing the resulting endpoint inequalities proves $Y f = 0$.
  This order of limits is what permits the initial eigenfunction to be merely measurable.

The remaining argument is geometric. On the triangle interior, $X f = i lambda f$ and $Y f =
  0$ give a plane wave with a measurable direction-dependent amplitude.
  Reflection in the two sides through an irrational vertex makes this amplitude constant.
  Reflection in the third side excludes every nonzero frequency. The standard spectral criterion then gives weak mixing.

Section 2 sets up the double and its Fourier coefficients.
  Section 3 proves the coefficient and smoothing estimates.
  Section 4 establishes transverse rigidity by the two successive limits.
  Section 5 applies side reflections and proves ergodicity of the product flow.

== 2 The double and its angular coefficients <sec:geometry>

We replace reflection by straight continuation on a flat surface.
  This allows us to study the spatial derivatives of an eigenfunction without imposing boundary conditions on the
  sides of the triangle. Throughout Sections 2–4, the triangle is fixed and nondegenerate;
  its angles need not satisfy an irrationality assumption.

Glue two closed copies of the triangle $Q$ along corresponding sides, give the copies opposite orientations,
  and remove the three vertices. The resulting connected oriented surface $M$ has a flat metric.
  Across an open side, a flat chart is obtained by reflecting one copy across that side.
  Consequently, changes between oriented flat charts are rotations followed by translations.
  The metric completion $overline(M)$ is compact; its missing points form a set $V$ of three cone points,
  with cone angles twice the corresponding angles of $Q$. This double and the coefficient framework below are also
  used in #cite(label("Companion")) Section 2.

Let $S M$ be the unit tangent bundle, let $nu$ be normalized Liouville measure,
  and denote geodesic motion by $Psi_t$. Thus, in a flat chart, $nu = d macron(A) thin d theta \/ \( 2 pi \)$,
  where $d macron(A)$ is probability area measure on $M$. We first justify using this motion as a
  measure-preserving flow defined modulo a null set.

A finite-time obstruction to a geodesic can occur only at a cone point.
  Indeed, a unit-speed path is Cauchy as its time approaches a finite endpoint,
  and its limit in $overline(M)$ permits continuation if it is regular.
  There is also no unaccounted accumulation of side crossings at a cone point.
  Lift the polar angle in a punctured cone to $bb(R)$ and develop the lifted geodesic into the plane.
  Its image is a straight line. If the path approaches the cone tip, this line ends at the origin,
  so its final segment has constant polar angle and is radial.
  Apart from trajectories along a seam, which form a null set, that segment has no side crossings.
  On an earlier compact regular segment crossings cannot accumulate:
  a flat chart at a proposed accumulation point makes both the path and each local seam straight.
  Thus every vertex hit has a finite crossing itinerary. For each fixed finite itinerary,
  unfolding makes a vertex hit the condition that a straight trajectory pass through a fixed point.
  For almost every initial position this condition selects only finitely many directions,
  so it has zero Liouville measure. Taking the countable union over itineraries, vertices,
  and both time directions proves that almost every geodesic exists for all real times.

Local geodesic motion is translation at fixed angle in flat charts and preserves Liouville measure.
  Following a regular trajectory through finitely many charts proves that every time map preserves $nu$,
  with inverse $Psi_(- t)$ modulo null sets. Folding the two sheets to $Q$,
  and folding their tangent vectors by the corresponding local isometries,
  defines a factor map to the billiard flow. It sends $nu$ to $mu$,
  since the two sheets have equal area and the angular measure is preserved by reflection.
  In particular, billiard eigenfunctions lift to geodesic-flow eigenfunctions.
  Factor identities are understood almost everywhere for each fixed time.

The composition operators $u mapsto u compose Psi_t$ form a strongly continuous unitary group on
  $L^2 \( S M \, nu \)$. To see continuity at zero, first take a continuous compactly supported function on the
  regular bundle and use pointwise continuity of regular paths and dominated convergence.
  Density then gives the assertion for every $L^2$ function.
  The same assertion for the billiard flow follows through the isometric embedding given by the factor map.

In oriented flat coordinates $x = \( x_1 \, x_2 \)$, write $v = \( cos theta \, sin theta \)$, and set

$ partial = 1 / 2 \( partial_(x_1) - i partial_(x_2) \) \, wide macron(partial) = 1 /
  2 \( partial_(x_1) + i partial_(x_2) \) . $

The horizontal derivatives in the forward and perpendicular directions are

#[#set math.equation(numbering: n => "(1)")
 $ X = e^(i theta) partial + e^(- i theta) macron(partial) \, wide Y = i e^(i theta) partial -
   i e^(- i theta) macron(partial) . $ <eq:XY>]

These vector fields are globally defined on $S M$, commute on the regular bundle,
  and are formally skew adjoint for $nu$. All distributional equations in this paper use compactly supported
  smooth tests on $M$ or $S M$. No test passes through a cone point.

We use angular Fourier coefficients, as in the flat-flow framework of Forni and Moll #cite(label("FM"))
  Sections 3.2–3.5. For $j in bb(Z)$, let $P_j$ be fiberwise Fourier projection, written in a chart as

$ P_j u = u_j \( x \) e^(i j theta) \, wide u_j \( x \) =
  integral_0^(2 pi) u \( x \, theta \) e^(- i j theta) frac(d theta, 2 pi) . $

Under an oriented change of coordinates $z' = e^(i phi.alt) z + c$, $theta' = theta + phi.alt$, so

$ u'_j = e^(- i j phi.alt) u_j \, wide \( partial u_j \)' = e^(- i \( j + 1 \) phi.alt) partial u_j \,
  wide \( accent(partial u, ‾)_j \)' = e^(- i \( j - 1 \) phi.alt) accent(partial u, ‾)_j . $

Thus a coefficient is a section of a flat unitary line bundle,
  and its two complex derivatives are coefficients of indices $j + 1$ and $j - 1$, respectively.
  Taking Fourier coefficients in (1) gives, also in distributions,

#[#set math.equation(numbering: n => "(2)")
 $ \( X u \)_j = partial u_(j - 1) + accent(partial u, ‾)_(j + 1) \, wide \( Y u \)_j = i partial u_(j - 1) -
   i accent(partial u, ‾)_(j + 1) . $ <eq:modes>]

The transition factors of the two terms in each sum agree.

We write $nabla$ for the flat spatial gradient, keeping the chart angle fixed for a field on $S M$.
  Coefficient gradients are weak gradients in the preceding unitary trivializations.
  Their norms use $d macron(A)$; bundle norms use $nu$. Whenever the horizontal derivatives are square integrable,
  Parseval and the orthogonality of the forward and perpendicular directions give

#[#set math.equation(numbering: n => "(3)")
 $ ∥nabla u∥_2^2 = ∥X u∥_2^2 + ∥Y u∥_2^2 = sum_(j in bb(Z)) ∥nabla u_j∥_2^2 . $ <eq:gradient>]

For each coefficient, pointwise algebra also gives $\| nabla u_j \|^2 =
  2 \( \| partial u_j \|^2 + \| accent(partial u, ‾)_j \|^2 \)$.
  An $L^2$ gradient always means a finite norm on the regular surface;
  it makes no assertion about traces or operator domains at a cone tip.
  Inner products are complex and linear in the first entry.

Fix a real number $lambda$, and put $A = X - i lambda$, which is again formally skew adjoint.
  If $f compose Psi_t = e^(i lambda t) f$ in $L^2$ for each $t$, then $A f = 0$ locally in distributions.
  Indeed, for a compactly supported smooth test $phi$, measure preservation gives

$ ⟨f \, phi compose Psi_(- t)⟩ = e^(i lambda t) ⟨f \, phi⟩ . $

Differentiation at zero is justified on a compact regular neighborhood of the test support and yields the claimed
  equation. Our analytic goal is the following statement, whose proof occupies the next two sections.

#thm([Proposition 2.1.])[
  (Transverse rigidity).  #emph[Let $M$ be the regular oriented double of a fixed nondegenerate Euclidean
    triangle, and let $Psi_t$ be its geodesic flow on $S M$ with normalized Liouville measure.
    Suppose $lambda in bb(R)$ and $f in L^oo \( S M \)$ satisfy
$ f compose Psi_t = e^(i lambda t) f quad upright("in ") L^2 \( S M \) quad upright("for every ") t in bb(R) . $

 Then $f$ has square-integrable horizontal weak derivatives and
$ Y f = 0 \, wide X f = i lambda f \, wide ∥nabla f∥_2^2 = lambda^2 ∥f∥_2^2 . $

]
] <prop:rigidity>

The next section first controls the gradient of each angular coefficient of a bounded local solution of $A h = 0$.
  Section 4 then obtains summability of these gradients and proves the proposition.

== 3 Localized energy and individual coefficient bounds <sec:energy>

The first estimate uses the full spatial gradient only where the eigenfunction equation fails.
  After smoothing and cutting off near the vertices, this will confine the resulting error to small cone annuli.
  The zero-frequency version of this argument appears in #cite(label("Companion")) Sections 3–4;
  the spectral correction below is needed when $lambda eq.not 0$.
  The equal complex-derivative norms and coefficient recurrences also occur in Forni and Moll’s Sobolev arguments
  #cite(label("FM")) Lemma 3.3, Corollary 4.2, and Lemma 5.1.
  Twisted complex-derivative energy identities provide a related spectral precedent in Forni’s work
  #cite(label("Forni2022")) Section 3.

#thm([Lemma 3.1.])[
  (Localized coefficient estimate).  #emph[Let $w in L^2 \( S M \)$ have compact spatial support in $M$ and be
    smooth in position with values in angular $L^2$ in every flat chart.
    Suppose $A w$ vanishes over $M \\ E$, where $E subset M$ is measurable. Define $D_j = ∥partial w_j∥_2^2$.
    Then, for every $m in bb(Z)$,
#[#set math.equation(numbering: n => "(4)")
 $ 1 / 2 D_m + D_(m + 1) lt.eq ∥A w∥_2 ∥upright(bold(1))_E nabla w∥_2 + lambda^2 / 2 ∥w_(m + 1)∥_2^2 \, wide D_j =
   1 / 4 ∥nabla w_j∥_2^2 . $ <eq:localized-energy>]

]
] <lem:energy>

#proof[
  Compact support in the regular surface permits integration by parts between the coefficient bundles.
    The local formal adjoints are $partial^(*) = - macron(partial)$ and $macron(partial)^(*) = - partial$;
    the derivatives commute in flat charts. Hence
  #[#set math.equation(numbering: n => "(5)")
   $ ∥partial w_j∥_2^2 = ∥accent(partial w, ‾)_j∥_2^2 = 1 / 4 ∥nabla w_j∥_2^2 . $ <eq:complex-energies>]
  These identities are intrinsic, since all transition factors are constant and unitary.
    In particular, no integration takes place across a cone point.
  Put $C_j = "Re" ⟨i lambda w_(j + 1) \, partial w_j⟩$. Equation (2) gives
  #[#set math.equation(numbering: n => "(6)")
   $ D_j - D_(j + 2) = "Re" ⟨\( A w \)_(j + 1) \, partial w_j - accent(partial w, ‾)_(j + 2)⟩ + C_j -
     C_(j + 1) . $ <eq:spectral-telescope>]
  For the spectral term, the sign follows from
  $ "Re" ⟨i lambda w_(j + 1) \, accent(partial w, ‾)_(j + 2)⟩ = "Re" ⟨- i lambda partial w_(j + 1) \, w_(j + 2)⟩ =
    C_(j + 1) . $
  The correction $C_j - C_(j + 1)$ couples consecutive indices,
    so a sum over one parity class would not telescope. Sum (6) over #emph[every] integer $j = m \, dots.h \, N$.
    The left side is $D_m + D_(m + 1) - D_(N + 1) - D_(N + 2)$,
    and the last two terms on the right telescope to $C_m - C_(N + 1)$. All high endpoints tend to zero:
    the coefficients of $w$ and their spatial derivatives are square summable, by the hypotheses on $w$.
    The remaining sum of pairings converges absolutely by Cauchy–Schwarz.
    Since $A w$ vanishes off the part over $E$, its absolute value is at most
  $ ∥A w∥_2
    (integral_E sum_(j gt.eq m) \| partial w_j - accent(partial w, ‾)_(j + 2) \|^2 thin d macron(A))^(1 \/ 2)
    lt.eq ∥A w∥_2 ∥upright(bold(1))_E nabla w∥_2 . $
  The last inequality uses the pointwise bound
  $ sum_(j gt.eq m) \| partial w_j - accent(partial w, ‾)_(j + 2) \|^2 lt.eq
    2 sum_(j in bb(Z)) \( \| partial w_j \|^2 + \| accent(partial w, ‾)_j \|^2 \) =
    sum_(j in bb(Z)) \| nabla w_j \|^2 . $
  Finally,
  $ \| C_m \| lt.eq \| lambda \| ∥w_(m + 1)∥_2 sqrt(D_m) lt.eq 1 / 2 D_m + lambda^2 / 2 ∥w_(m + 1)∥_2^2 \, $
  which proves (4). ◻
]

We now construct regularizations to which Lemma 3 applies.
  Write $r \( x \) = d \( x \, V \)$ in $overline(M)$, also using $r$ for its pullback to $S M$.
  Near each cone point, an embedded flat disk about $x$ has radius at least $c r \( x \)$, for a fixed $c > 0$:
  this follows by choosing uniformly sized disks on the compact circle at radius one in the model cone and
  scaling. Compactness away from the tips therefore gives a constant $K > 2$ such that,
  for all sufficiently small $epsilon > 0$, every point with $r > \( K - 2 \)
  epsilon$ has an embedded flat disk of radius $4 epsilon$. For each fixed $L > 0$, the cone area formula also gives

#[#set math.equation(numbering: n => "(7)")
 $ macron(A) { r lt.eq L epsilon } = O_L \( epsilon^2 \) . $ <eq:cone-area>]

Choose a nonnegative radial function $rho in C_c^oo \( bb(R)^2 \)$,
  supported in the unit disk and with Euclidean integral one, and set $rho_epsilon \( y \) =
  epsilon^(- 2) rho \( y \/ epsilon \)$. For $r \( x \) > K epsilon$,
  define spatial convolution at fixed parallel direction by

#[#set math.equation(numbering: n => "(8)")
 $ \( S_epsilon u \) \( x \, theta \) = integral_(bb(R)^2) rho_epsilon \( y \) u \( x - y \, theta \) thin d y
   $ <eq:smoothing-definition>]

in the embedded flat disk. Radiality makes this definition independent of its oriented chart.
  Unless a derivative is being taken, extend $S_epsilon u$ by zero to $r lt.eq K epsilon$.

#thm([Lemma 3.2.])[
  (Spatial regularization).  #emph[For every integer $ell gt.eq 0$, the preceding operators satisfy
#[#set math.equation(numbering: n => "(9)")
 $ epsilon^ell ∥nabla^ell S_epsilon u∥_(L^2 \( r > K epsilon \)) lt.eq C_ell ∥u∥_2 . $ <eq:smoothing-bounds>]

 Their derivatives here are taken before zero extension. The output is smooth in position with values in angular
   $L^2$, and $S_epsilon u arrow.r u$ in $L^2 \( S M \)$ for every fixed $u in L^2 \( S M \)$. For bounded input,
$ ∥S_epsilon u∥_oo lt.eq ∥u∥_oo \, wide epsilon^ell ∥nabla^ell S_epsilon u∥_(L^oo \( r > K epsilon \)) lt.eq
  C_ell ∥u∥_oo . $

 Convolution commutes locally with $X \, Y$, and $A$, in distributions.
   If $L > K + 4$ and $g = 0$ on $r < L epsilon$, then $S_epsilon g = 0$ on $r < \( L - 1 \) epsilon$;
   its zero extension has compact spatial support in $M$ and creates no boundary derivative.
   In particular, when also $A g in L^2$,
#[#set math.equation(numbering: n => "(10)")
 $ A \( S_epsilon g \) = S_epsilon \( A g \) $ <eq:smoothing-commutes>]

 globally on the regular bundle, with the same zero-extension convention.]
] <lem:smoothing>

#proof[
  In a common flat neighborhood of nearby centers, this is ordinary convolution with a kernel whose derivatives
    have the usual scaling. Cauchy–Schwarz bounds the squared angular $L^2$ norm of $epsilon^ell nabla^ell
    S_epsilon u$ at a center by $C_ell epsilon^(- 2)$ times the integral of $∥u \( y \, dot.op \)∥_(L_theta^2)^2$
    over its $epsilon$-disk. Parallel identification of tangent circles preserves angular measure.
    A point in such a disk satisfies $r > \( K - 1 \) epsilon$,
    and all centers which can contribute to it lie in a disk of area $O \( epsilon^2 \)$.
    Integrating the bound over centers proves (9). The same kernel estimates give the $L^oo$ bounds;
    nonnegativity and mass one give the contraction bound at order zero.
    Constant-coefficient differentiation in each chart proves local commutation and spatial smoothness.
  For a smooth compactly supported input on $S M$, the usual approximate-identity argument gives $L^2$
    convergence, including the zero extension for sufficiently small $epsilon$.
    Such inputs are dense in $L^2 \( S M \)$, so the uniform bound at order zero proves convergence for every
    fixed input.
  The function $r$ is 1-Lipschitz. If $r \( x \) < \( L - 1 \) epsilon$,
    every point sampled by its convolution disk has $r < L epsilon$, proving the support claim.
    The convolution consequently vanishes in a whole neighborhood of the boundary $r = K epsilon$,
    so zero extension produces no boundary distribution. Local commutation gives (10) there;
    on the omitted region both sides vanish, since $A g$ has no support where $g$ vanishes. ◻
]

#thm([Lemma 3.3.])[
  (Individual coefficient regularity).  #emph[Suppose $h in L^oo \( S M \)$, $∥h∥_oo lt.eq H$,
    and $\( X - i lambda \) h = 0$ locally in distributions on the regular bundle.
    Every Fourier coefficient then has a global square-integrable flat gradient, and
#[#set math.equation(numbering: n => "(11)")
 $ ∥nabla h_j∥_2 lt.eq C_lambda H wide \( j in bb(Z) \) . $ <eq:bounded-modes>]

 The constant depends only on the fixed triangle and $lambda$.]
] <lem:bounded-modes>

#proof[
  Choose a smooth spatial cutoff $chi_epsilon$, equal to zero on $r lt.eq \( K + 1 \) epsilon$,
    equal to one on $r gt.eq \( K + 2 \) epsilon$, and satisfying $0 lt.eq chi_epsilon lt.eq
    1$ and $\| nabla chi_epsilon \| lt.eq C \/ epsilon$. Its transition region $E_epsilon$ consists of three
    disjoint cone annuli for small $epsilon$. The field $w_epsilon = chi_epsilon S_epsilon h$,
    extended by zero near the tips, has compact spatial support and the smoothness required by Lemma 3.
    Local commutation and $A h = 0$ give
  $ A w_epsilon = \( X chi_epsilon \) S_epsilon h . $
  This field is supported over $E_epsilon$, whose area is $O \( epsilon^2 \)$. On those annuli Lemma 4 gives
  $ \| A w_epsilon \| + \| nabla w_epsilon \| lt.eq C H \/ epsilon . $
  Consequently, $∥A w_epsilon∥_2 lt.eq C H$ and $∥upright(bold(1))_(E_epsilon) nabla w_epsilon∥_2 lt.eq C H$.
    Also $∥\( w_epsilon \)_(j + 1)∥_2 lt.eq ∥w_epsilon∥_2 lt.eq H$.
    Equation (4) therefore bounds $∥nabla \( w_epsilon \)_j∥_2$ by $C_lambda H$, independently of $epsilon$ and $j$.
  We have $w_epsilon arrow.r h$ in $L^2$: use Lemma 4 and the shrinking area of the region where $chi_epsilon
    eq.not 1$. For each fixed $j$, choose a weakly convergent subsequence of the globally bounded coefficient
    gradients. Testing in regular charts identifies its limit as the distributional gradient of $h_j$.
    Weak lower semicontinuity proves (11). ◻
]

This estimate controls one coefficient at a time; it does not yet give summability of their energies over $j$.
  Its hypothesis is only the local equation $A h = 0$, so it will apply to weak limits without requiring a
  separate flow-invariance argument. The next section uses long orbit averages to obtain the additional identities
  needed for the sum over all coefficients.

== 4 Transverse rigidity of bounded eigenfunctions <sec:rigidity>

The coefficient estimates of Section 3 do not yet give square summability of the horizontal derivatives.
  We obtain that summability from an identity involving the two modes at the lower end of an angular Fourier tail.
  The long averages used below adapt the construction for invariant functions in #cite(label("Companion"))
  Sections 4–5; the phase in the average and the endpoint terms retain the spectral parameter throughout the argument.

#proof[
  Write $H = ∥f∥_oo$ and $A = X - i lambda$. The eigenfunction equation implies $A f =
    0$ locally in distributions. Lemma 5 therefore gives
  #[#set math.equation(numbering: n => "(12)")
   $ ∥nabla f_j∥_2 lt.eq C_lambda H wide \( j in bb(Z) \) . $ <eq:rigidity-mode-bound>]
  Here and below constants may depend on the fixed triangle,
    but not on an angular index or on the approximation parameters.
  ===== 4.1 The two boundary modes of a Fourier tail. <the-two-boundary-modes-of-a-fourier-tail.>
  Fix $m in bb(Z)$. Define the $L^2$ field and the two coefficient derivatives
  $ U = sum_(j gt.eq m) P_j f \, wide b = accent(partial f, ‾)_m \, wide a = partial f_(m - 1) \, $
  and put
  $ B = b \( x \) e^(i \( m - 1 \) theta) - a \( x \) e^(i m theta) . $
  The factors in this expression respect the coefficient transition rules,
    so $B$ is a global $L^2 \( S M \)$ field. The mode equations give
  #[#set math.equation(numbering: n => "(13)")
   $ A U = B wide upright("locally in distributions on ") S M . $ <eq:tail-equation>]
  For completeness, for $N gt.eq m + 2$ the finite tail satisfies
  $ A sum_(j = m)^N P_j f = B - \( accent(partial f, ‾)_(N + 1) \) e^(i N theta) + \( partial f_N \)
    e^(i \( N + 1 \) theta) . $
  The last two terms are bounded in $L^2$ by (12) and converge weakly to zero:
    their angular frequencies tend to infinity. Since the finite tails converge strongly to $U$ in $L^2$,
    this proves (13).
  We will prove the endpoint identity
  #[#set math.equation(numbering: n => "(14)")
   $ ⟨B \, \( P_(m - 1) + P_m \) Y f⟩ = 0 . $ <eq:endpoint-identity>]
  At this stage $Y f$ denotes a distribution; its two displayed modes are in $L^2$ by (2) and (12).
    The difficulty is that $Y f$ itself is not yet known to be an admissible test in (13).
    We construct compactly supported approximations whose error under $A$ becomes negligible in that pairing.
  ===== 4.2 Long averages away from the vertices. <long-averages-away-from-the-vertices.>
  Let $K$ be the constant in Lemma 4 and fix $L > K + 4$. For $0 < s < 1$ and sufficiently small $epsilon > 0$,
    set $T = s \/ epsilon$. Let $G_epsilon$ consist of the regular states $z$ whose entire trajectory segment ${
    Psi_t z : 0 lt.eq t lt.eq T }$ lies over ${ r > L epsilon }$. Then
  #[#set math.equation(numbering: n => "(15)")
   $ nu \( S M \\ G_epsilon \) lt.eq C \( s + epsilon^2 \) . $ <eq:bad-segments>]
  Indeed, $r$ is $1$-Lipschitz along a unit-speed geodesic.
    If a segment meets ${ r lt.eq L epsilon }$, a time mesh of spacing at most $epsilon$ detects a visit to ${ r
    lt.eq \( L + 1 \) epsilon }$. There are at most $T \/ epsilon + 2$ mesh points.
    Measure preservation and the cone-area bound $nu { r lt.eq \( L + 1 \) epsilon } lt.eq
    C epsilon^2$ prove (15). The discarded trajectories that hit a vertex form a null set.
  Define
  #[#set math.equation(numbering: n => "(16)")
   $ q_epsilon = f upright(bold(1))_(G_epsilon) \, wide g_epsilon = 1 /
     T integral_0^T e^(i lambda t) q_epsilon compose Psi_(- t) thin d t . $ <eq:segment-average>]
  The integral may be taken in $L^2$; bounded measurable representatives and Fubini give the same field.
    The phase is chosen so that replacing $q_epsilon$ by $f$ in the integrand gives $f$. Consequently,
  #[#set math.equation(numbering: n => "(17)")
   $ ∥g_epsilon∥_oo lt.eq H \, wide ∥g_epsilon - f∥_2 lt.eq C H sqrt(s + epsilon^2) \, wide ∥A g_epsilon∥_2 lt.eq
     frac(2 H, T) . $ <eq:average-bounds>]
  The first bound follows directly from (16); the second follows by integrating the $L^2$ distance $∥q_epsilon -
    f∥_2 lt.eq H nu \( G_epsilon^c \)^(1 \/ 2)$. For the third we use the distributional identity
  #[#set math.equation(numbering: n => "(18)")
   $ A g_epsilon = 1 / T #scale(x: 120%, y: 120%)[\(] q_epsilon - e^(i lambda T) q_epsilon compose
     Psi_(- T) #scale(x: 120%, y: 120%)[\)] . $ <eq:average-endpoints>]
  Here no derivative of $upright(bold(1))_(G_epsilon)$ is taken.
    To verify the identity, test against $phi in C_c^oo \( S M \)$ and change variables by the flow.
    Along every regular orbit,
  $ frac(d, d t) (e^(i lambda t) overline(phi \( Psi_t z \))) = e^(i lambda t) overline(\( A phi \) \( Psi_t z \)) . $
  Integrating this formula in $t$, and using the formal skew adjointness of $A$, proves (18).
    The test and its horizontal derivative are bounded, which also justifies Fubini in this calculation.
  Both $g_epsilon$ and $A g_epsilon$ vanish over ${ r < L epsilon }$.
    In fact, for each $0 lt.eq t lt.eq T$ the support of $q_epsilon compose Psi_(- t)$ is contained,
    up to null sets, in $Psi_t G_epsilon subset { r > L epsilon }$;
    this also applies to both endpoint terms in (18). Apply the spatial smoothing of Lemma 4 and set
  $ w_epsilon = S_epsilon g_epsilon . $
  Before its prescribed zero extension this field vanishes on ${ K epsilon < r < \( L - 1 \) epsilon }$.
    Thus the extension is smooth in position, has compact spatial support in $M$,
    and creates no boundary derivative. Local commutation with $A$ gives, globally as an $L^2$ identity,
    $A w_epsilon = S_epsilon A g_epsilon$. The smoothing estimates imply
  #[#set math.equation(numbering: n => "(19)")
   $ ∥w_epsilon∥_oo & lt.eq H \, & ∥A w_epsilon∥_2 & lt.eq frac(C H, T) \,\
∥nabla w_epsilon∥_2 & lt.eq frac(C H, epsilon) \, & ∥Y A w_epsilon∥_2 & lt.eq frac(C H, T epsilon) =
  frac(C H, s) . $ <eq:regularized-bounds>]
  All higher spatial derivatives also belong to $L^2$ for fixed $epsilon$.
    The relation $T epsilon = s$ bounds the discarded measure by $C \( s + epsilon^2 \)$ while keeping $Y A
    w_epsilon$ bounded in $L^2$ at fixed $s$. Its norm need not tend to zero:
    weak convergence suffices for pairing against the fixed tail $U$.
    We first let $epsilon$ tend to zero at fixed $s$ to obtain exact bounded local solutions.
    Only then can Lemma 5 restore coefficient estimates independent of $s$ and allow the limit $s arrow.r 0$.
  ===== 4.3 The first limit: $epsilon arrow.r 0$ at fixed $s$. <the-first-limit-varepsilonto0-at-fixed-s.>
  The last bound in (19) makes $Y A w_epsilon$ bounded in $L^2$ at fixed $s$.
    Since $A w_epsilon arrow.r 0$ in $L^2$, for each $phi in C_c^oo \( S M \)$ we have
  $ ⟨Y A w_epsilon \, phi⟩ = - ⟨A w_epsilon \, Y phi⟩ arrow.r 0 . $
  Density of these tests in $L^2 \( S M \)$ therefore yields
  #[#set math.equation(numbering: n => "(20)")
   $ Y A w_epsilon harpoon.rt 0 quad upright("in ") L^2 \( S M \) . $ <eq:weak-error>]
  We may now test (13) against $Y w_epsilon$ and commute the horizontal fields:
  #[#set math.equation(numbering: n => "(21)")
   $ ⟨B \, Y w_epsilon⟩ = - ⟨U \, A Y w_epsilon⟩ = - ⟨U \, Y A w_epsilon⟩ arrow.r 0 . $ <eq:tail-pairing>]
  This use of a test with only $L^2$ angular regularity is legitimate.
    Indeed, the finite angular Fourier sums of $Y w_epsilon$ are smooth compactly supported tests.
    They converge to $Y w_epsilon$, together with their first horizontal derivatives, in $L^2$,
    because $w_epsilon$ has square-integrable spatial derivatives of every order.
    Apply (13) first to these finite sums and then pass to the limit.
    The equality $A Y w_epsilon = Y A w_epsilon$ follows from $\[ X \, Y \] = 0$.
  To identify the left side of (21) after taking a limit, we also need coefficient-gradient bounds.
    Lemma 3, with $E = M$, and (19) give
  #[#set math.equation(numbering: n => "(22)")
   $ ∥nabla \( w_epsilon \)_j∥_2^2 lt.eq C H^2 \( s^(- 1) + lambda^2 \) wide \( j in bb(Z) \) .
     $ <eq:fixed-s-mode-bound>]
  Choose a sequence $epsilon arrow.b 0$ along which $w_epsilon$ converges weakly in $L^2$ to a field $h_s$. Then
  #[#set math.equation(numbering: n => "(23)")
   $ ∥h_s∥_oo lt.eq H \, wide A h_s = 0 upright(" locally in distributions") \, wide ∥h_s - f∥_2 lt.eq
     C H sqrt(s) . $ <eq:first-limit>]
  For the first assertion use weak closedness in $L^2$ of the convex set ${ u : \| u \| lt.eq H med
    upright("a.e.") }$; the second follows from $A w_epsilon arrow.r 0$ in $L^2$. For the third, write
  $ w_epsilon - f = S_epsilon \( g_epsilon - f \) + \( S_epsilon f - f \) $
  and use (17), uniform $L^2$ boundedness of $S_epsilon$, and $S_epsilon f arrow.r f$ in $L^2$.
  Only the coefficients with indices $m - 2 \, m - 1 \, m \, m +
    1$ contribute to the two modes $\( P_(m - 1) + P_m \) Y w_epsilon$.
    By (22), a further subsequence makes their gradients converge weakly in the corresponding global $L^2$
    coefficient spaces. Testing in regular coordinate charts identifies these limits as the gradients of the
    respective coefficients of $h_s$. Since $B$ has only modes $m - 1$ and $m$, (21) gives
  #[#set math.equation(numbering: n => "(24)")
   $ ⟨B \, \( P_(m - 1) + P_m \) Y h_s⟩ = 0 . $ <eq:first-limit-pairing>]
  ===== 4.4 The second limit: $s arrow.r 0$. <the-second-limit-sto0.>
  The bound (22) deteriorates as $s arrow.r 0$. The first limit has replaced the approximate equation for
    $w_epsilon$ by the exact local equation $A h_s = 0$, while preserving boundedness.
    Lemma 5 now gives the stronger estimate
  $ ∥nabla \( h_s \)_j∥_2 lt.eq C_lambda H wide \( j in bb(Z) \) \, $
  independently of $s$. No flow-invariance assertion for $h_s$ is needed here:
    the lemma requires only its boundedness and its local distributional equation.
  Choose any sequence $s arrow.b 0$. By (23), $h_s arrow.r f$ strongly in $L^2$.
    After passing to a subsequence, the gradients of the same four coefficients converge weakly in $L^2$;
    local distributional testing identifies their limits as those of $f$.
    Passing to the limit in (24) proves (14). The successive limits have thus removed the approximation error
    without losing the coefficient derivatives needed by the endpoint pairing.
  ===== 4.5 The sharp horizontal-energy bound. <the-sharp-horizontal-energy-bound.>
  By $A f = 0$ and the mode formulas (2),
  $ \( Y f \)_(m - 1) = - lambda f_(m - 1) - 2 i b \, wide \( Y f \)_m = lambda f_m + 2 i a . $
  Substitute these expressions into (14). With inner products linear in the first argument, the result is
  $ 2 i #scale(x: 120%, y: 120%)[\(] ∥b∥_2^2 + ∥a∥_2^2 #scale(x: 120%, y: 120%)[\)] =
    lambda #scale(x: 120%, y: 120%)[\(] ⟨b \, f_(m - 1)⟩ + ⟨a \, f_m⟩ #scale(x: 120%, y: 120%)[\)] . $
  Taking absolute values and applying Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(25)")
   $ ∥accent(partial f, ‾)_m∥_2^2 + ∥partial f_(m - 1)∥_2^2 lt.eq lambda^2 /
     4 #scale(x: 120%, y: 120%)[\(] ∥f_(m - 1)∥_2^2 + ∥f_m∥_2^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:endpoint-energy>]
  This remains valid when the left side is zero; otherwise divide the Cauchy–Schwarz inequality by its square
    root. Summing (25) over all $m in bb(Z)$ yields
  #[#set math.equation(numbering: n => "(26)")
   $ sum_(j in bb(Z)) ∥nabla f_j∥_2^2 = 2 sum_(j in bb(Z)) #scale(x: 120%, y: 120%)[\(] ∥partial
     f_j∥_2^2 + ∥accent(partial f, ‾)_j∥_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq lambda^2 ∥f∥_2^2 . $ <eq:sharp-energy>]
  In particular the horizontal derivatives of the angular partial sums converge in $L^2$;
    their limits are the weak derivatives of $f$, by local testing. Parseval and (3) therefore give
  $ ∥X f∥_2^2 + ∥Y f∥_2^2 = ∥nabla f∥_2^2 lt.eq lambda^2 ∥f∥_2^2 . $
  But $X f = i lambda f$, so the first term already equals the right side.
    It follows that $Y f = 0$ and equality holds throughout. ◻
]

== 5 Side reflections and weak mixing <sec:conclusion>

The analytic argument is complete. We now apply Proposition 2 to the lift of a billiard eigenfunction.
  Its local form will make the angle condition decisive.

#thm([Proposition 5.1.])[
  #emph[Let $Q$ be a nondegenerate Euclidean triangle with an angle irrational relative to $pi$.
    If $F in L^2 \( Q times S^1 \, mu \)$ satisfies
$ F compose Phi_t = e^(i lambda t) F quad upright("in ") L^2 wide \( t in bb(R) \) $

 for some $lambda in bb(R)$, then $F$ is constant almost everywhere. If this constant is nonzero, then $lambda = 0$.]
] <prop:eigenfunctions>

#proof[
  First suppose $F$ is bounded. Put the origin of the triangle coordinates at a vertex whose angle $alpha$
    satisfies $alpha \/ pi in.not bb(Q)$. Let $f$ be the lift of $F$ to the double,
    with its orientation chosen so that these coordinates are oriented on the first sheet.
    Proposition 2 and the eigenfunction equation give
  $ X f = i lambda f \, wide Y f = 0 \, wide upright("hence") wide nabla f = i lambda v f $
  in every oriented flat chart, where $v = \( cos theta \, sin theta \)$.
    Thus $e^(- i lambda x dot.op v) f \( x \, v \)$ has zero spatial distributional gradient.
    On a connected chart it is independent of position for almost every direction.
    One can see this by taking its angular Fourier coefficients:
    each has zero spatial distributional gradient and is therefore constant on the connected base chart.
    In the first triangle interior this gives
  #[#set math.equation(numbering: n => "(27)")
   $ F \( x \, v \) = c \( v \) e^(i lambda x dot.op v) $ <eq:plane-wave>]
  for a measurable bounded function $c$ on $S^1$.
  Consider an open side. Reflection in its supporting line is the affine map $p mapsto R p + d$,
    where $R$ is the linear orthogonal reflection and $d in bb(R)^2$.
    A crossing chart agrees with the first-sheet coordinates and assigns coordinates $x = R p +
    d$ to the point $p$ of the second sheet. The chart direction $v$ folds to the billiard direction $R v$ there.
    Since $R^T = R = R^(- 1)$, Equation (27) gives
  $ f \( x \, v \) = F \( p \, R v \) = c \( R v \) e^(i lambda \( x - d \) dot.op v) $
  on the second portion of the chart. The phase-removed function is independent of position throughout the
    connected crossing chart, so its expressions on the two open portions agree:
  #[#set math.equation(numbering: n => "(28)")
   $ c \( v \) = c \( R v \) e^(- i lambda d dot.op v) quad upright("for almost every ") v in S^1 .
     $ <eq:side-relation>]
  This comparison uses open subsets of a regular chart and requires no boundary trace for $F$.
  For the two sides through the origin, $d = 0$. Their reflections generate a rotation through $2 alpha$,
    under which $c$ is invariant. If $hat(c) \( k \)$ is its $k$-th circle Fourier coefficient,
    this gives $hat(c) \( k \) = e^(2 i k alpha) hat(c) \( k \)$.
    Irrationality of $alpha \/ pi$ forces every coefficient except $k = 0$ to vanish.
    Thus $c$ is constant almost everywhere.
  The third side has $d eq.not 0$, since its supporting line does not pass through the chosen vertex.
    If the constant $c$ is nonzero, (28) says $e^(- i lambda d dot.op v) = 1$ almost everywhere on the circle,
    and hence everywhere by continuity. The values of $d dot.op v$ fill the interval $\[ - \| d \| \, \| d \| \]$,
    so this is possible only when $lambda = 0$. Equation (27) now makes $F$ constant, proving the bounded case.
  For an arbitrary $L^2$ eigenfunction, use $tilde(F) = F \/ \( 1 + \| F \| \)$.
    The map $z mapsto z \/ \( 1 + \| z \| \)$ is bounded, injective,
    and commutes with multiplication by unit complex scalars.
    Consequently $tilde(F)$ is a bounded eigenfunction with the same frequency.
    The bounded case and injectivity give the assertion for $F$. ◻
]

We recall the standard compact-operator proof of the spectral implication needed to finish the argument; see,
  for example, #cite(label("Peterson2015")) Theorem 6.1.4. It applies to the full continuous-time flow.

#thm([Lemma 5.2.])[
  #emph[Let $\( Omega \, mu \)$ be a standard probability space and $Phi_t$ a measure-preserving flow whose
    composition operators form a strongly continuous unitary group on complex $L^2 \( mu \)$.
    If the only flow eigenfunctions are constants, then the product flow $Phi_t times Phi_t$ is ergodic for $mu ⊗ mu$.]
] <lem:spectral>

#proof[
  Write $U_t h = h compose Phi_t$. The frequency-zero hypothesis first implies ergodicity of $Phi_t$.
    If the product flow were not ergodic, there would be a nonzero invariant kernel $K in
    L^2 \( mu ⊗ mu \)$ of mean zero. Each one-variable marginal of $K$ is invariant under the single flow and thus
    constant. The zero total mean makes both marginals zero.
  Define the complex-linear Hilbert–Schmidt operator
  $ \( T h \) \( x \) = integral_Omega K \( x \, y \) h \( y \) thin d mu \( y \) . $
  The zero marginals imply $T 1 = 0$ and that its range is contained in $L_0^2 \( mu \) = { h :
    integral h thin d mu = 0 }$. Its restriction to this space is nonzero,
    since a zero integral operator has zero $L^2$ kernel. Product invariance gives $U_t T =
    T U_t$ by a change of variables in the integral. Hence $T^(*) T$, acting on $L_0^2 \( mu \)$,
    is a nonzero positive compact operator commuting with every $U_t$.
  A positive eigenvalue of $T^(*) T$ has a nonzero finite-dimensional eigenspace invariant under every $U_t$.
    Commuting unitary operators on that space have a common eigenvector $h eq.not 0$.
    The associated scalar character is continuous by strong continuity of $U_t$,
    so it has the form $e^(i lambda t)$ for some $lambda in bb(R)$.
    This gives a flow eigenfunction in $L_0^2 \( mu \)$, a contradiction. ◻
]

#proof[
  The billiard composition group is strongly continuous by the construction in Section 2.
    Proposition 6 eliminates every nonconstant eigenfunction, so Lemma 7 proves ergodicity of the product flow. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
