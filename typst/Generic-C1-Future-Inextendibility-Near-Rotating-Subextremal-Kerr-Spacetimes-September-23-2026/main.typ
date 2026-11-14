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

#align(center)[#text(size: 16pt, weight: "bold")[Generic $C^1$ Future Inextendibility \
Near Rotating Subextremal Kerr Spacetimes]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Einstein vacuum equations determine spacetime from initial geometry only as long as the evolution remains a
  Cauchy development. Fourès-Bruhat proved local existence and geometric uniqueness
  #cite(label("ChoquetBruhat1952")); Choquet-Bruhat and Geroch established a maximal globally hyperbolic
  development, unique up to an isometry preserving the initial data #cite(label("ChoquetBruhatGeroch1969")).
  An extension beyond that development need not be determined by the same data.
  Strong cosmic censorship asks whether such extensions are excluded for generic initial data in an appropriate
  regularity class. Penrose’s discussion of the strong formulation relates this question to global hyperbolicity
  and to the infinite blueshift at an inner horizon #cite(label("Penrose1979")) Section 12.3.2.

Kerr’s rotating vacuum solutions #cite(label("Kerr1963")) make this question particularly sharp.
  Their subextremal interiors contain Cauchy horizons, so the exact solutions admit continuations beyond their
  maximal Cauchy developments #cite(label("Carter1968")). The conjectural mechanism is instability under
  perturbation. Here we prove a local, Baire-generic $C^1$ form of future strong cosmic censorship near each fixed
  rotating subextremal Kerr bridge. The data are smooth, complete,
  two-ended vacuum data with no symmetry condition. Genericity is measured in a weighted smooth topology;
  the neighborhood requires smallness of only its tenth seminorm.
  The precise theorem and the definition of a future timelike exit appear in Section 2.
  The neighborhood depends on the Kerr center, and the conclusion concerns every such exit of the full maximal
  globally hyperbolic development, allowing nonvacuum ambient metrics.

=== 1.1 Why extension regularity matters <why-extension-regularity-matters>

The physical analyses of Poisson and Israel #cite(label("PoissonIsrael1990")) and Ori #cite(label("Ori1991"))
  #cite(label("Ori1992")) describe how blueshift can produce mass inflation and a weak tidal singularity at an
  inner horizon. Rigorous nonlinear work in the spherically symmetric Einstein–Maxwell–scalar-field model
  established that continuous extendibility can coexist with instability of curvature and mass
  #cite(label("Dafermos2003")) #cite(label("Dafermos2005")).
  In that model, Luk and Oh proved a generic $C^2$ inextendibility theorem for admissible complete two-ended
  asymptotically flat data, combining exterior lower bounds with an interior instability argument
  #cite(label("LukOh2019I")) #cite(label("LukOh2019II")). Building on their work,
  Sbierski #cite(label("Sbierski2022")) Theorem 4.31 proved future locally Lipschitz inextendibility for generic
  sufficiently small spherically symmetric perturbations of two-ended subextremal Reissner–Nordström data in the
  same matter model, allowing extensions that do not preserve spherical symmetry.
  The matter model, spherical symmetry and topology in those results are part of their statements.

For the vacuum equations without symmetry, Luk #cite(label("Luk2018")) constructed stable local weak null
  singularities from singular characteristic data: in the constructed coordinates the metric extends continuously
  while its Christoffel symbols fail to be locally square integrable.
  Dafermos and Luk #cite(label("DafermosLuk2025")) prove persistence of a continuously extendible Cauchy-horizon
  portion from suitable Cauchy data already inside a black hole.
  Hintz #cite(label("Hintz2026")) Theorem 13.1 proves nonlinear exterior stability throughout the subextremal
  range for small data with specified finite asymptotic power–log expansions and a faster decaying remainder.
  Combined with the interior theorem of Dafermos and Luk, this gives $C^0$ Cauchy-horizon stability for that data
  class. Its asymptotic assumptions differ from the symbol-bounded tails allowed in our weighted phase space.

Gurriaran #cite(label("Gurriaran2026")) Theorem 4.5.1 obtains locally Lipschitz inextendibility near timelike
  infinity from interior spacelike data with prescribed nonlinear Price asymptotics and a nonvanishing
  nonaxisymmetric leading curvature amplitude. Luk and Sbierski #cite(label("LukSbierski2026")) Theorem 1.2 obtain
  continuous extendibility and locally Lipschitz inextendibility across a specified Cauchy-horizon portion from
  characteristic event-horizon data satisfying quantitative upper and lower radiation bounds.
  These results explain the interior instability mechanisms and the importance of the incoming radiation.
  The theorem here addresses a different data question: a residual subset of a neighborhood of complete vacuum
  Cauchy data, without assuming a radiation lower bound, and with every future exit covered.

A $C^1$ metric has continuous connection coefficients but need not have bounded classical curvature.
  Curvature growth alone therefore does not obstruct a $C^1$ extension; our argument uses parallel transport.
  Sbierski’s holonomy method #cite(label("Sbierski2022")) supplies a direct geometric precedent;
  his later criterion #cite(label("Sbierski2026")) Theorem 3.14 excludes locally Lipschitz extensions across the
  specified weak-null boundary under stable signed integrated-curvature blowup and the specified geometric
  hypotheses. Our proof constructs finite loops for which the transport bound forced by a $C^1$ extension fails.
  It proves the required quantitative estimates within the complete Cauchy evolution.

=== 1.2 The foundation and the two-sign construction <the-foundation-and-the-two-sign-construction>

The companion #cite(label("Foundation")) supplies the complete near-Kerr background evolution,
  exterior constraint inverse, and constrained linear packet construction.
  We state the particular geometric and linear conclusions in Sections 3 and 4, including their data hypotheses,
  derivative orders and parameter dependence. The proofs below use those intermediate results;
  the companion’s final $C^2$ inextendibility conclusion is not a prerequisite.

The companion #cite(label("KerrWeakConnection")) Theorem 1.2 excludes continuous nondegenerate future extensions
  with locally square-integrable connection for a local residual set near each fixed rotating subextremal Kerr
  bridge. That stronger inextendibility conclusion builds on the intermediate packet, constraint,
  and geometric results developed here, together with its own nonlinear comparison and averaging over families of
  loops. The present paper proves the pointwise transport obstruction at $C^1$ regularity;
  the square-integrable-connection theorem is not an input to its proof.

The constraint step belongs to the development of localized vacuum deformations initiated by Corvino,
  Corvino–Schoen and Chruściel–Delay #cite(label("Corvino2000")) #cite(label("CorvinoSchoen2006"))
  #cite(label("ChruscielDelay2003")). Here an inner ball must remain exactly unchanged while a decaying exterior
  correction is retained. This makes the early evolution identical and leaves room for a late experiment.
  Complex Gaussian beams and their superpositions allow an oscillatory packet to cross real caustics
  #cite(label("Ralston1982")) #cite(label("Tanushev2008")) #cite(label("LiuRunborgTanushev2013")).
  The present construction returns that packet to the original initial surface and controls the Einstein
  wave-gauge constraints, matching of normal jets and an interval whose length grows with the observation depth;
  those estimates are proved in the companion and in Section 4.

The analytic difficulty is that a packet capable of producing the needed signal need not dominate its own
  nonlinear comparison error. We prepare two exact vacuum perturbations with opposite linear parts,
  using the same constraint inverse and the same background gauge. Their pure-packet quadratic forcing agrees.
  Subtracting the two evolution equations cancels that forcing and gives an estimate for the difference of the two
  errors. When the curvature observations are then subtracted,
  the background term cancels and the remaining quadratic curvature terms are small enough to control.
  One of the two observations must therefore be large. Section 5 establishes the signed cancellation at the entry
  cylinder, and Section 6 propagates it through the interior.
  The energy estimate keeps one common growth rate at every fixed derivative order and on every intermediate time
  interval; this is what allows the subtraction to preserve its gain even when an individual error exceeds the
  linear packet.

=== 1.3 From one future exit to one finite contradiction <from-one-future-exit-to-one-finite-contradiction>

The logical starting point is a hypothetical future $C^1$ exit.
  In a regular extension chart, bounded connection coefficients give a linear bound for the holonomy of loops of
  small developed length. Here developed length means the length of the loop’s velocity measured in a frame
  transported along that same loop. Section 3 shows that one bound holds along an open family of finite-duration
  timelike geodesics. These requirements form countably many closed tests on the initial data.
  It is enough to destroy each test by an arbitrarily small perturbation in any prescribed finite seminorm.

The comparison development is an auxiliary Cauchy development that contains the entire initial bridge and an
  interior region described by two increasing optical coordinates.
  Its two branch regimes have one coordinate tending to infinity and the other to a finite limit;
  in the corner regime both coordinates diverge. These are coordinate limits,
  with no boundary points adjoined to the perturbed spacetime.
  A passing test supplies a geodesic approaching one of the two noncorner branches of the comparison development.
  The reason is geometric: the geodesic flow preserves canonical volume on transverse sections of the unit mass
  shell, while corner tracks eventually occupy strips of arbitrarily small such volume.
  An open family of initial seeds cannot consist entirely of corner tracks.
  This argument does not impose a bound on curvature along the selected observer.

At a late finite point of that branch, the signed packet construction produces the curvature separation just
  described. Section 7 attaches both experiments to developments of the entire corrected initial surface,
  retaining their asymptotic tails. It also chooses nearby observing seeds that reach the prescribed observation
  point. The comparison solves the perturbed unit mass shell for an absolute canonical momentum;
  it avoids dividing an error by the vanishing optical lapse.

Finally, Section 8 rescales a null frame adapted to that observer.
  Exact null identities control the potentially growing connection entries.
  The resulting loop family has exceptionally short developed length and controlled finite derivatives of its
  holonomy with respect to loop size. A finite interpolation formula extracts the quadratic holonomy coefficient,
  which is curvature. The assumed linear transport bound makes this coefficient smaller than the signed signal.
  The relevant scales can already be seen here. At optical depth $T$,
  the lapse satisfies $a_p asymp e^(- kappa T)$ for a fixed $kappa > 0$.
  We choose packet amplitude $A_T = e^(- 7 kappa T \/ 8)$ and loop parameter $h_T = e^(- kappa T \/ 16)$.
  The signed construction gives a scaled curvature component larger than $A_T$,
  whereas the transport test and finite interpolation would give the bound

$ e^(o \( T \)) \( a_p \/ h_T + h_T^16 \) = e^(o \( T \)) #scale(x: 120%, y: 120%)[\(]
  O \( e^(- 15 kappa T \/ 16) \) + e^(- kappa T) #scale(x: 120%, y: 120%)[\)] = o \( A_T \) . $

The factor $e^(o \( T \))$ represents losses smaller than every fixed positive exponential rate,
  at the finite derivative orders in use. This strict separation is the finite contradiction that destroys the
  test. Section 9 then applies the Baire theorem and checks the order of all choices.
  Figure 1 records this route through the proof.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.973cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Any future $C^1$ exit#linebreak()an open family of observers#linebreak()has bounded short-loop transport#linebreak() Section~3]]])])
  content((5.4, 0), [#box(width: 4.973cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[A noncorner observer#linebreak()canonical phase volume#linebreak()excludes an all-corner family#linebreak() Section~3]]])])
  content((10.8, 0), [#box(width: 4.973cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Paired exact perturbations#linebreak()opposite linear packets;#linebreak()one common propagation rate#linebreak() Sections~5--6]]])])
  line((2.487, 0), (2.913, 0), stroke: (paint: rgb("#404040"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#404040"))))
  line((7.887, 0), (8.313, 0), stroke: (paint: rgb("#404040"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#404040"))))
  content((0, -3.35), [#box(width: 4.973cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Baire genericity#linebreak()every closed test is destroyed#linebreak()in every data neighborhood#linebreak() Section~9]]])])
  content((5.4, -3.35), [#box(width: 4.973cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[A short-loop contradiction#linebreak()finite holonomy jets recover#linebreak()the scaled curvature coefficient#linebreak() Section~8]]])])
  content((10.8, -3.35), [#box(width: 4.973cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[One large signed signal#linebreak()the background cancels;#linebreak()the odd error and quadratic#linebreak()curvature terms are controlled#linebreak() Sections~7--8]]])])
  line((10.8, -1.25), (10.8, -2.1), stroke: (paint: rgb("#404040"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#404040"))))
  line((8.313, -3.35), (7.887, -3.35), stroke: (paint: rgb("#404040"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#404040"))))
  line((2.913, -3.35), (2.487, -3.35), stroke: (paint: rgb("#404040"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#404040"))))
})],
  caption: [Figure 1: The route from a possible future exit to a finite contradiction. Each experiment is attached to the full development of its complete corrected datum. The noncorner branch locates an observation; the final contradiction concerns parallel transport in the full development. ],
) <fig:proof-map-signed-tests>

== 2 The constraint space and the theorem <sec:phase>

We use Lorentzian signature $\( - + + + \)$. Fix $M > 0$ and $0 < frak(a) < M$,
  where $frak(a)$ denotes the Kerr rotation parameter. The letter $a$ will later denote a double-null metric
  coefficient, unrelated to this parameter.

Let $\( Sigma \, h_(*) \, K_(*) \)$, $Sigma tilde.eq bb(R) times bb(S)^2$,
  be the complete signed Killing-time-zero Kerr bridge through the bifurcation sphere,
  with the future-normal convention of #cite(label("Foundation"))  and .
  Fix its identification with $Sigma$, asymptotically Cartesian charts on both ends,
  and a smooth function $rho gt.eq 1$ equal to the end radius outside a compact set.
  Write $nabla_(*)$ and $\| dot.op \|_(*)$ for the reference connection and tensor norm.

#prodef([Definition 2.1.])[
  (Weighted constraint space).  For smooth symmetric two-tensors $f \, j$ set
  #[#set math.equation(numbering: n => "(2.1)")
   $ p_m \( f \, j \) = sum_(i = 0)^m {sup_Sigma rho^(1 + i) \| nabla_(*)^i f \|_(*) +
     sup_Sigma rho^(2 + i) \| nabla_(*)^i j \|_(*)} \, wide m = 0 \, 1 \, dots.h . $ <phase:seminorms>]
  Let $cal(D)$ consist of smooth pairs $d = \( h \, K \)$ such that $h$ is positive definite and complete,
    every $p_m \( h - h_(*) \, K - K_(*) \)$ is finite, and
  #[#set math.equation(numbering: n => "(2.2)")
   $ R \( h \) + \( "tr"_h K \)^2 - \| K \|_h^2 = 0 \, wide "div"_h K - upright(d) \( "tr"_h K \) =
     0 . $ <phase:constraints>]
  The topology on $cal(D)$ is the relative topology of the seminorms (2.1). For $epsilon > 0$ let
  $ cal(U)_epsilon = { d in cal(D) : p_10 \( d - d_(*) \) < epsilon } \, wide d_(*) = \( h_(*) \, K_(*) \) . $
] <phase:space>

These are differentiated $O \( r^(- 1) \)$ and $O \( r^(- 2) \)$ end conditions.
  There is no parity, fixed leading coefficient, fixed charge, or symmetry restriction.
  In particular, we do not require every possible asymptotic charge integral to exist for every allowed tail.
  We use representatives in the fixed spatial gauge, rather than a quotient by diffeomorphisms.

The choice of equivalent end charts, weights and reference geometry does not change the topology.
  More precisely, suppose the radii are comparable, the transition Jacobian and its inverse are symbols of order
  zero, and the transformed reference geometry has the same asymptotic class.
  The tensor chain rule and the formula for changing connections bound each seminorm in one choice by a finite sum
  of seminorms in the other, in both directions. To retain the Cartesian convention,
  the leading Euclidean metric is preserved up to the allowed metric-weight error.
  A smooth reidentification carrying both the data and the reference center therefore gives a homeomorphism.
  This assertion does not identify seminorms under arbitrary data-dependent gauge transformations.

For $d in cal(D)$, let $cal(M)_d$ denote its full smooth maximal globally hyperbolic vacuum development,
  with the prescribed time orientation. We use smooth Cauchy existence, propagation of the wave-gauge constraints,
  geometric uniqueness, and compact-subset Cauchy stability in their usual smooth-data form;
  the required local estimates are part of the Cauchy framework in #cite(label("Foundation")).
  The defining embedding property of the maximal development is #cite(label("Sbierski2016")) Definitions 2.1–2.2
  and Theorems 2.6–2.8. An application of that property below will always be preceded by a proof that the attached
  spacetime has the #emph[entire] initial manifold as a Cauchy surface.

#prodef([Definition 2.2.])[
  (Future $C^1$ extension).  A future $C^1$ extension of $cal(M)_d$ is a smooth,
    time-orientation-preserving isometric embedding $iota : cal(M)_d arrow.r
    tilde(cal(M))$ onto a proper open subset of a connected, time-oriented smooth four-manifold with nondegenerate
    $C^1$ Lorentzian metric $tilde(g)$, together with a future-directed timelike $C^1$ curve $c : \[ 0 \, 1 \]
    arrow.r tilde(cal(M))$ such that
  $ c \( \[ 0 \, 1 \) \) subset iota \( cal(M)_d \) \, wide c \( 1 \) in partial iota \( cal(M)_d \) . $
  Neither the vacuum equations nor global hyperbolicity are imposed on the ambient spacetime.
] <phase:extension>

#thm([Theorem 2.3.])[
  #emph[For each fixed $M > 0$ and $0 < frak(a) < M$, there is $epsilon_0 =
    epsilon_0 \( M \, frak(a) \) > 0$ such that $cal(U)_(epsilon_0)$ contains a dense $G_delta$ subset $cal(G)$
    for which every $cal(M)_d$, $d in cal(G)$, has no future $C^1$ extension in the sense of Definition 2.]
] <phase:main>

The open neighborhood and the residual subset in this statement are different sets.
  The theorem does not assert that inextendibility is open,
  or that every datum in $cal(U)_(epsilon_0)$ has the conclusion.
  Its constants need not be uniform as $frak(a) arrow.r 0$ or $frak(a) arrow.r M$.
  All later choices of the base neighborhood use only the smallness of $p_10$;
  higher seminorms are finite but need not be uniformly small.
  Appendix 10 constructs nearby data with trivial spatial data isometry group and explains how nearby Kerr centers
  fit into the same phase space. These observations are separate from the genericity argument.

#thm([Lemma 2.4.])[
  (Baire property).  #emph[The space $cal(D)$ is completely metrizable,
    and every $cal(U)_epsilon$ is a nonempty Baire space. At any point,
    finite seminorm balls form a neighborhood base: every neighborhood contains a set of the form
$ { d' in cal(D) : p_m \( d' - d \) < r } $

 for some finite $m gt.eq 10$ and $r > 0$.]
] <phase:baire>

#proof[
  The vector space $cal(E)$ of tensor pairs with every seminorm (2.1) finite is complete for the usual metric
    built from the countable increasing seminorms. Indeed, a Cauchy sequence converges smoothly on compact sets,
    and its weighted uniform derivative limits agree with the derivatives of that local smooth limit.
    Passing the uniform Cauchy bounds to the limit gives convergence in each $p_m$.
  For any $h = h_(*) + f$ with $h > 0$ and $p_0 \( f \, 0 \) < oo$,
    the asymptotic decay makes $h$ uniformly comparable with $h_(*)$ on the ends.
    Positivity on the remaining compact set gives the same comparison there. Thus $h$ is complete.
    The same positive lower comparison bound shows that positivity is open in $cal(E)$.
    Consequently the completeness requirement in Definition 1 is automatic on this positive open set.
  The constraint map is continuous there into the space of smooth scalar and one-form fields with the local smooth
    topology. Its zero locus is relatively closed. An open subset of a completely metrizable space is completely
    metrizable, as is a closed subset of it. This proves the assertion for $cal(D)$,
    and then for its open subsets $cal(U)_epsilon$. They contain $d_(*)$.
    Finally the seminorms increase with $m$, so finitely many seminorm inequalities are implied by one
    sufficiently high-order inequality with sufficiently small radius. ◻
]

=== 2.1 Mass normalization <phase:scaling>

The constant rescaling $g mapsto M^(- 2) g$, written in dimensionless bridge coordinates,
  sends the initial data to $\( M^(- 2) h \, M^(- 1) K \)$.
  It gives a homeomorphism between the corresponding weighted constraint spaces,
  sends the reference parameters to $\( 1 \, frak(a) \/ M \)$, and preserves both maximality and Definition 2.
  We henceforth take $M = 1$ and fix $0 < frak(a) < 1$. Proving the theorem in this normalization proves it for
  every fixed original center.

Choose $epsilon_0$ small enough for the background statements in Section 4, and write $cal(U) = cal(U)_(epsilon_0)$.

== 3 Closed transport tests and selection of a branch <test:section>

We translate a future $C^1$ exit into a transport bound shared by an open set of finite-duration geodesics.
  Each such bound defines a closed set of data, indexed by a basic open seed set and one integer.
  These tests concern the full development and are independent of the Kerr parameters.
  We then show that every passing test supplies a geodesic approaching a noncorner branch,
  where the later perturbation will be placed. For this selection we combine the comparison development of
  #cite(label("Foundation")) with conservation of canonical phase-space volume.
  No curvature bound along the selected observer is needed.

=== 3.1 Seeds, positive norms, and the passing sets <seeds-positive-norms-and-the-passing-sets>

A seed $w in T Sigma$ includes its base point. For $d = \( h \, K \)$ let $n$ be the future unit normal to the
  initial hypersurface in $cal(M)_d$, and define

#[#set math.equation(numbering: n => "(3.1)")
 $ U_d \( w \) = sqrt(1 + h \( w \, w \)) thin n + w \, wide gamma_(d \, w) : \[ 0 \, T_d \( w \) \) arrow.r
   cal(M)_d . $ <test:seed>]

Here $gamma_(d \, w)$ is the maximal future unit timelike geodesic with this initial velocity,
  and $T_d \( w \) in \( 0 \, oo \]$ is its maximal proper duration in the #emph[full] maximal globally hyperbolic
  development. On $bb(R) n xor T Sigma$ put

#[#set math.equation(numbering: n => "(3.2)")
 $ k_(d \, w) \( 0 \) \( s n + X \, t n + Y \) = s t + h \( X \, Y \) \, wide
   nabla_(dot(gamma)_(d \, w)) k_(d \, w) = 0 . $ <test:positive-metric>]

Thus $k_(d \, w) \( tau \)$ is positive definite even though the spacetime metric is Lorentzian.
  All operator norms below are induced by this positive inner product.

For a piecewise smooth loop $ell : \[ 0 \, 1 \] arrow.r cal(M)_d$ based at $p = gamma_(d \, w) \( tau \)$,
  parallel transport $k_(d \, w) \( tau \)$ along $ell$ and call the resulting positive inner products
  $k_ell \( s \)$. Define the developed length and based transport operator by

#[#set math.equation(numbering: n => "(3.3)")
 $ L \( ell \) = integral_0^1 \| dot(ell) \( s \) \|_(k_ell \( s \)) thin d s \, wide P_ell : T_p cal(M)_d arrow.r
   T_p cal(M)_d . $ <test:developed-length>]

If $F \( s \)$ is the parallel frame along $ell$ starting from a $k_(d \, w) \( tau \)$-orthonormal frame,
  and $dot(ell) = F z$, then $L \( ell \) = integral_0^1 \| z \( s \) \| thin d s$.
  The metric at the end of the loop need not equal its initial value;
  Equation (3.3) uses the transported metric at each parameter value.

#thm([Lemma 3.1.])[
  (Comparison with the observer’s positive metric).  #emph[Let $U = dot(gamma)_(d \, w)$ and set $r_U = g_d +
    2 U^flat ⊗ U^flat$. This positive metric is parallel along $gamma_(d \, w)$ and satisfies
#[#set math.equation(numbering: n => "(3.4)")
 $ c \( w \)^(- 1) k_(d \, w) lt.eq r_U lt.eq c \( w \) k_(d \, w) \, wide c \( w \) =
   #scale(x: 120%, y: 120%)[\(] sqrt(1 + h \( w \, w \)) + sqrt(h \( w \, w \)) #scale(x: 120%, y: 120%)[\)]^2 .
   $ <test:observer-norm-bound>]

 In particular the comparison is uniform when the initial data and seeds range in a sufficiently small
   neighborhood of a fixed pair.]
] <test:observer-comparison>

#proof[
  Both $g_d$ and $U$ are parallel, so $r_U$ is parallel. At the initial point choose an $h$-orthonormal spatial
    frame with first vector along $w$, if $w eq.not 0$, and write $s = h \( w \, w \)$ and $alpha = sqrt(1 + s)$.
    In the normal and first spatial directions, the matrix of $r_U$ relative to $k_(d \, w) \( 0 \)$ is
  $ mat(delim: "(", 1 + 2 s, - 2 alpha sqrt(s); - 2 alpha sqrt(s), 1 + 2 s) . $
  Its eigenvalues are $\( alpha + sqrt(s) \)^2$ and $\( alpha - sqrt(s) \)^2$, which are reciprocal.
    The other two eigenvalues are one. This also covers $s = 0$, and parallel transport preserves the inequalities. ◻
]

Fix a countable basis $cal(O)$ of nonempty relatively compact open subsets of the six-dimensional manifold $T
  Sigma$. The test below asks for one transport constant at every positive time on every geodesic in a basis set.
  In an extension this uniformity will come from a compact earlier geodesic tube together with one regular chart
  near the exit.

#prodef([Definition 3.2.])[
  (Passing test).  For $O in cal(O)$ and $B in bb(N)$, $B gt.eq 1$,
    the set $cal(A) \( O \, B \) subset cal(U)$ consists of the data such that, for every $w in O$,
    one has $T_d \( w \) lt.eq B$ and, for every $0 < tau < T_d \( w \)$ and every piecewise smooth loop $ell$
    based at $gamma_(d \, w) \( tau \)$ whose entire image is contained in $I_(cal(M)_d)^(+) \( Sigma \)$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ L \( ell \) < B^(- 1) quad arrow.r.double quad
     lr(bar.v.double P_ell - "Id" bar.v.double)_(k_(d \, w) \( tau \)) lt.eq B L \( ell \) . $ <test:inequality>]
] <test:definition>

#thm([Lemma 3.3.])[
  (Closedness).  #emph[Each $cal(A) \( O \, B \)$ is relatively closed in $cal(U)$.]
] <test:closed>

#proof[
  We show that every failure persists in a neighborhood of the datum.
    If $T_d \( w \) > B$ for one $w in O$, choose $B < b < T_d \( w \)$.
    The geodesic segment $gamma_(d \, w) \( \[ 0 \, b \] \)$ is a compact witness.
    Otherwise, failure is witnessed by one $w in O$, one $0 < tau < T_d \( w \)$,
    and one loop with the two strict inequalities
  $ L \( ell \) < B^(- 1) \, wide lr(bar.v.double P_ell - "Id" bar.v.double)_(k_(d \, w) \( tau \)) > B L \( ell \) . $
  Smooth compact-subset vacuum Cauchy stability and geometric uniqueness apply to these witnesses:
    the data are smooth positive vacuum constraint data, and convergence in all $p_m$ implies smooth convergence
    on every compact part of $Sigma$. This is precisely the compact-subset Cauchy statement used in
    #cite(label("Foundation")) proof of . To specify its use,
    enlarge the compact witness by finitely many local evolution neighborhoods and their causal shadows on the
    Cauchy hypersurface. The shadows of a compact subset of a globally hyperbolic spacetime on a Cauchy
    hypersurface are compact. Finite local Cauchy stability, followed by geometric uniqueness on the overlaps,
    therefore gives embeddings of a neighborhood of the witness into the nearby developments on which the metrics
    converge smoothly. Only finitely many finite orders are needed for any fixed witness.
  For a loop witness also include compact timelike arcs from $Sigma$ to finitely many neighborhoods covering its
    image. Such neighborhoods exist because the original image is compact and contained in $I^(+) \( Sigma \)$.
    After a small change of data those arcs remain timelike; their final short segments can be varied within the
    neighborhoods. Consequently the nearby loop images are still contained in $I^(+) \( Sigma \)$.
  The initial velocity in Equation (3.1), the geodesic on the chosen compact time interval,
    and parallel transport all vary continuously, by smooth ODE dependence in these common neighborhoods.
    For the loop, use a local diffeomorphism converging smoothly to the identity to move its base to the nearby
    geodesic at the same proper time; its support can be chosen in one of the preceding neighborhoods.
    Lengths and transport matrices then converge, so both strict inequalities persist.
    The duration witness similarly persists beyond $B$. Thus the complement is open.
    No continuity assertion for $T_d \( w \)$ at a maximal endpoint is used. ◻
]

=== 3.2 Covering future exits <covering-future-exits>

The next three lemmas convert a single extension exit into a uniform test on an open family of initial seeds.
  Causal homotopy forces these geodesics to have finite duration in the full development,
  while a small-developed-length bootstrap supplies the common transport bound.

#thm([Lemma 3.4.])[
  (Intrinsic diamond under a causal homotopy).  #emph[Let $P$ be a smooth globally hyperbolic open subspacetime of
    a Hausdorff manifold $tilde(M)$ carrying a continuous Lorentzian metric.
    Let $H : \[ 0 \, 1 \]^2 arrow.r tilde(M)$ be continuous, with $H \( lambda \, 0 \) =
    p$ and $H \( lambda \, 1 \) = q$ for fixed $p \, q in P$.
    Suppose every $H \( lambda \, dot.op \)$ is future causal.
    If the path for $lambda = 0$ lies in $P$, then all the paths lie in $P$.]
] <test:diamond>

#proof[
  Let $E$ be the set of parameters whose whole paths are in $P$.
    Compactness of $\[ 0 \, 1 \]$ and openness of $P$ imply that $E$ is open.
    For $lambda in E$ the path lies in the intrinsic diamond $D = J_P^(+) \( p \) ∩ J_P^(-) \( q \)$,
    which is compact by global hyperbolicity. Its image in $tilde(M)$ is compact and hence closed because the
    ambient manifold is Hausdorff. If $lambda_j in E$ and $lambda_j arrow.r lambda$,
    continuity of $H$ puts every $H \( lambda \, s \)$ in that same closed image of $D$, so $lambda in E$.
    Thus $E$ is nonempty, open, and closed in the connected interval.
    This argument does not assume ambient causal convexity or any ambient geodesic uniqueness. ◻
]

#thm([Lemma 3.5.])[
  (Interior endpoints of timelike geodesics).  #emph[A maximal timelike geodesic in a smooth spacetime has no
    endpoint there as an unparametrized causal curve. Its maximal past continuation from a point in
    $I^(+) \( Sigma \)$ therefore crosses a Cauchy hypersurface $Sigma$.]
] <test:interior-endpoint>

#proof[
  Suppose a unit geodesic has a position limit at an endpoint in the spacetime.
    Choose a precompact temporal coordinate chart $\( t \, x \)$ about the limit.
    On a sufficiently late tail, the causal slopes $V = \( 1 \, d x \/ d t \)$ are uniformly bounded.
    With $dot(t) = d t \/ d tau > 0$, the geodesic equation reads
  #[#set math.equation(numbering: n => "(3.6)")
   $ frac(d, d t) log dot(t) = - Gamma_(alpha beta)^0 V^alpha V^beta \, wide frac(d V^i, d t) = -
     Gamma_(alpha beta)^i V^alpha V^beta + Gamma_(alpha beta)^0 V^alpha V^beta V^i . $ <test:time-geodesic>]
  The right sides are bounded on the finite chart-time tail.
    Hence $dot(t)$ is bounded above and below by positive constants and has a limit; $V$ also has a limit.
    The remaining proper time is finite, and the limiting position and unit timelike tangent give smooth ODE
    continuation. This contradicts maximality. The same proof applies at the past end.
    Complete a maximal past geodesic by any future inextendible timelike continuation.
    Cauchyness gives a crossing of $Sigma$, and achronality places that crossing to the past of a point in
    $I^(+) \( Sigma \)$. ◻
]

#thm([Lemma 3.6.])[
  (Arbitrary loops of small developed length).  #emph[Consider a family of base points in regular coordinate
    charts for a $C^1$ Lorentzian metric. Suppose the Christoffel symbols are bounded by one constant,
    each base point has coordinate distance at least $rho > 0$ from its chart boundary,
    and the coordinate matrices of the prescribed positive orthonormal frames and their inverses have norm at most
    $K$. There are $l_(*) > 0$ and $C_(*) < oo$, depending only on these constants,
    such that every piecewise smooth loop based at any of these points with developed length $L <
    l_(*)$ remains in its selected chart and satisfies
#[#set math.equation(numbering: n => "(3.7)")
 $ lr(bar.v.double P_ell - "Id" bar.v.double)_k lt.eq C_(*) L . $ <test:local-loop-bound>]

 The loop may be specified in any open subspacetime of the chart’s ambient manifold;
   no initial assumption of coordinate smallness is required.]
] <test:loop-bootstrap>

#proof[
  This is the bounded-connection parallel-transport argument underlying #cite(label("Sbierski2022")) Lemma 2.13,
    with a first-exit bootstrap to handle a loop specified only by its developed length.
    Related comparisons with coordinate length, including the small-developed-length case,
    appear in #cite(label("Sbierski2024")) Lemma 4.2 and Corollary 4.12.
    Continue the initial frame $F_0$ parallel along the loop, and write $dot(ell) = F z$.
    Up to the first departure from the selected chart, the coordinate parallel-transport equation implies,
    for a fixed constant $C$ including the dimension-dependent matrix factors,
  $ \| dot(F) \| lt.eq C lr(bar.v.double F bar.v.double)^2 \| z \| \, wide \| dot(ell) \| lt.eq
    lr(bar.v.double F bar.v.double) \| z \| . $
  Use accumulated developed length $s = integral \| z \|$ as the parameter on nonconstant pieces,
    or equivalently integrate these inequalities without reparametrizing.
    Comparison with $f' = C f^2$, $f \( 0 \) = K$, gives $lr(bar.v.double F bar.v.double) lt.eq
    K \/ \( 1 - C K s \) lt.eq 2 K$ for $s lt.eq \( 2 C K \)^(- 1)$.
    Thus coordinate displacement is at most $2 K s$. Choose
  $ l_(*) < min { \( 2 C K \)^(- 1) \, rho \/ \( 4 K \) } . $
  A first chart exit at developed length less than $l_(*)$ would have displacement at least $rho$ and at most
    $rho \/ 2$, a contradiction. The estimates consequently hold on the entire loop.
    They give $lr(bar.v.double F \( 1 \) - F_0 bar.v.double) lt.eq 4 C K^2 L$.
    Since the loop returns to its base point, its transport matrix in the initial orthonormal frame is $F_0^(- 1)
    F \( 1 \)$. Multiplication by the uniformly bounded inverse proves Equation (3.7), for example with $C_(*) =
    4 C K^3$. Piecewise smooth parametrizations cause no change in these integral estimates. ◻
]

#thm([Proposition 3.7.])[
  (Coverage of future $C^1$ exits).  #emph[If $cal(M)_d$, $d in cal(U)$,
    admits a future $C^1$ extension in the stated sense, then $d in cal(A) \( O \, B \)$ for some $O in
    cal(O)$ and some integer $B gt.eq 1$.]
] <test:exit-cover>

#proof[
  Identify $cal(M)_d$ with its open image in the extension. Let $c$ be the timelike curve reaching its boundary.
    Its tail has no interior future endpoint, since an interior limit and the given ambient boundary limit would
    coincide in the Hausdorff extension. Extending the interior part maximally to the past and using the Cauchy
    property, we find that a sufficiently late part lies in $I_(cal(M)_d)^(+) \( Sigma \)$.
  #emph[A uniformly timelike straight segment reaching the boundary.] We first obtain a straight timelike segment
    that stays inside $cal(M)_d$ until its final point. The construction also covers an exiting curve whose
    timelike margin tends to zero at its endpoint. Take a precompact ambient chart $\( t \, x \)$ containing the
    endpoint and a tail of $c$, with $d t$ temporal and $partial_t$ future timelike.
    In chart time the tail is $\( t \, x \( t \) \)$, $t lt.eq t_f$.
    On a smaller compact coordinate box, causal slopes $v = d x \/ d t$ are bounded,
    and there is $c_0 > 0$ such that $tilde(g) \( \( 1 \, v \) \, partial_t \) lt.eq - c_0$ for all these slopes.
    The metric is Lipschitz there. Replace the curve’s time coordinate by
  $ tilde(t) \( t \) = t - epsilon.alt_1 \( e^(H \( t_f - t \)) - 1 \) \, wide epsilon.alt_1 > 0 . $
  Put $Delta = t - tilde(t)$ and $eta = tilde(t)' - 1 = epsilon.alt_1 H e^(H \( t_f - t \))$.
    Then $0 lt.eq Delta lt.eq eta \/ H$. The change of the quadratic form from the displacement is bounded by $C
    Delta \( 1 + eta \)^2$, whereas the addition of $eta partial_t$ contributes at most $- 2 c_0 eta$;
    its quadratic contribution is nonpositive. Choose $H$ large and then $epsilon.alt_1$ small enough that $eta
    lt.eq 1$. The new velocity is uniformly future timelike, with quadratic form at most $-
    c_0 epsilon.alt_1 H$ after increasing $H$ if necessary. The new curve has the same final point and begins
    inside $I^(+) \( Sigma \)$, since its initial displacement can be made arbitrarily small.
  After reparametrization by its new chart time, take a sufficiently fine polygonal interpolation with the same
    endpoints. It remains uniformly future timelike. Indeed, on a short subinterval the velocities lie in a
    bounded convex cone of future timelike vectors with a fixed smaller margin for one frozen metric;
    averaging preserves that cone, and continuity of the metric preserves a smaller margin on the interpolating
    segment. A finite subdivision suffices. Follow this polygon to its first exit from $cal(M)_d$ and let $z$ be
    that exit. The straight piece immediately before $z$ has constant spatial slope $v_(*)$,
    is interior before $z$, and is uniformly timelike up to $z$.
  #emph[An open family of intrinsic geodesics has finite full duration.] Choose $l > 0$ small and set $t_0 =
    t \( z \) - l$, $t_1 = t \( z \) + l$ so that the last length-$l$ part of the straight piece is in the chart.
    Start intrinsic unit timelike geodesics at $t = t_0$ with position within $l^2$ of that piece and spatial
    slope within $l$ of $v_(*)$, restricting to a nonempty open subset of states inside
    $I_(cal(M)_d)^(+) \( Sigma \)$. All these states form a six-dimensional open family.
    The Christoffel symbols of the ambient $C^1$ metric are continuous and bounded.
    While an intrinsic geodesic remains in the box, Equation (3.6) therefore bounds its spatial acceleration by a
    constant $C_0$, uniformly over the family. On the interval of chart-time length $2 l$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| V^i - v_(*)^i \| lt.eq \( 1 + 2 C_0 \) l \, wide \| x \( t \) - x_(*) \( t \) \| lt.eq C_1 l^2 \,
     $ <test:near-straight>]
  where $x_(*)$ is the straight line extended through the box.
    Choose a compact box about that line with a fixed positive margin and shrink $l$ first.
    These estimates, by a first-exit argument, prevent chart departure before $t_1$.
    They also keep all slopes in a common uniformly timelike neighborhood of $v_(*)$.
    Unit normalization gives uniform positive upper and lower bounds for $d t \/ d tau$.
  If one such geodesic remains in $cal(M)_d$ through $t_1$, Equation (3.8) places its point at $t =
    t \( z \)$ within $C_1 l^2$ of $z$. Add to its spatial path a smooth bump supported in $\( t_0 \, t_1 \)$ that
    moves this point to $z$ and leaves the endpoints fixed. A rescaled fixed bump has height $O \( l^2 \)$ and
    derivative $O \( l \)$. Multiplying the bump by $lambda in \[ 0 \, 1 \]$ gives a fixed-endpoint homotopy
    through future timelike curves inside the ambient box. Lemma 8,
    applied to the globally hyperbolic spacetime $cal(M)_d$, forces the final path to remain inside it,
    although it passes through $z in.not cal(M)_d$. This is impossible.
  Thus every member of the family has maximal intrinsic chart-time strictly less than, or equal to, $t_1$.
    The preceding bounds imply finite remaining proper time and limits of position and unit tangent in the ambient
    box. The position limit lies outside $cal(M)_d$: otherwise the smooth intrinsic geodesic equation would
    continue it. This is its maximal endpoint in the #emph[full] $cal(M)_d$.
    Any intrinsic continuation would have an interior position whose image is the already determined ambient
    boundary limit, a contradiction. No geodesic equation has been solved outside $cal(M)_d$,
    and no uniqueness assertion for the merely continuous ambient Christoffel symbols has been made.
  Continue one of the starting states backwards in $cal(M)_d$.
    Lemma 9 and its location in $I^(+) \( Sigma \)$ give a transverse crossing of $Sigma$.
    Smooth geodesic flow through this fixed compact earlier segment maps an open neighborhood in $T
    Sigma$ diffeomorphically onto an open part of the above starting-state family.
    Shrink it to a relatively compact open set with closure mapped into that family.
    Its earlier geodesic tube has compact closure and uniformly bounded proper duration.
    The final chart interval has uniformly bounded proper duration as well.
    Hence there is $B_0 < oo$ such that $T_d \( w \) lt.eq B_0$ for every seed in this smaller neighborhood.
  #emph[One transport constant for all base points and all short loops.] Initial frames orthonormal for
    Equation (3.2) and their inverses are uniformly bounded on the compact seed closure.
    On the compact earlier tube, a finite cover by regular charts and the parallel-transport ODE give uniform
    bounds for their continued matrices and inverses. On the final part use the ambient chart:
    bounded Christoffel symbols and bounded chart-time slopes on an interval of length $2
    l$ give the same bounds by the linear parallel-transport equation and its inverse equation.
    All final base points stay in a compact coordinate box strictly inside this chart,
    even as they approach the boundary of the image of $cal(M)_d$.
    A finite chart cover of the earlier compact tube, with smaller chart cores,
    provides a common positive chart margin there as well. Lemma 10 now supplies one $l_(*) > 0$ and one $C_(*) <
    oo$ for every base point on every geodesic in the seed neighborhood.
    In particular it applies to every loop required in Definition 6.
  Choose an integer $B gt.eq max { 1 \, B_0 \, C_(*) \, l_(*)^(- 1) }$ and a basis set $O in
    cal(O)$ inside this neighborhood. The strict premise $L < B^(- 1)$ implies $L < l_(*)$,
    so all the requirements for $d in cal(A) \( O \, B \)$ hold. ◻
]

=== 3.3 Comparison runout and the corner estimates <comparison-runout-and-the-corner-estimates>

The next input concerns the fixed arbitrary subextremal center.
  Its smallness threshold is chosen once, before the seed set, the passing constant, or any later perturbation order.

#thm([Proposition 3.8.])[
  (Comparison development and first runout).  #emph[After decreasing the defining $p_10$ radius of $cal(U)$,
    each $d in cal(U)$ has a smooth globally hyperbolic vacuum comparison development $cal(P)_d$ containing the
    whole bridge $Sigma$ as a Cauchy hypersurface and embedded openly and isometrically in $cal(M)_d$.
    It contains a spacelike cylinder $cal(S)$ and its full future product wedge,
    with coordinates $t = \( u + v \) \/ 2 gt.eq 0$, $x = \( v - u \) \/ 2 in bb(R)$, $theta in bb(S)^2$, in which
#[#set math.equation(numbering: n => "(3.9)")
 $ g & = - 2 a thin d u thin d v + gamma_(A B) \( d theta^A - b^A d u \) \( d theta^B - b^B d u \) \,\
a & = q cal(A) \, wide q = q_0 e^(- kappa \( u + v \)) \, wide q_0 \, kappa > 0 . $ <test:wedge>]

 The coefficients $cal(A)^(plus.minus 1)$ and $gamma^(plus.minus 1)$ are uniformly bounded,
   with $gamma$ uniformly comparable to a fixed round sphere metric.
   Every seed with $T_d \( w \) < oo$ crosses $cal(S)$ before its first runout from $cal(P)_d$,
   and that first runout has exactly one of the following coordinate limits:
#[#set math.equation(numbering: n => "(3.10)")
 $ upright("first branch:") & u arrow.r u_(*) < oo \, & v arrow.r + oo \,\
upright("second branch:") & v arrow.r v_(*) < oo \, & u arrow.r + oo \,\
upright("corner:") & u arrow.r + oo \, & v arrow.r + oo . $ <test:runout>]

 These alternatives describe limiting coordinate regimes; they do not adjoin boundary points or identify
   $cal(P)_d$ with $cal(M)_d$.]
] <test:comparison>

#proof[
  The comparison construction is #cite(label("Foundation"));
    the absence of finite exterior runout and the first-runout classification are respectively and of that
    companion. Their hypotheses are exactly the ones imposed here:
    a fixed rotating subextremal center, the complete signed two-ended bridge,
    smooth vacuum data with finite weighted symbol seminorms, and smallness only in $p_10$.
    The weighted seminorms and asymptotic powers agree with those of our phase space;
    equivalent reference atlases can be accommodated by reducing the radius.
    There is no requirement that asymptotic charges be fixed, that a curvature bound hold,
    or that an extension exist. The cylinder and wedge are furnished by the source’s finite bridge evolution,
    two exterior evolutions, and full-cylinder interior continuation.
  To make explicit how the cited classification is used, let $tau_P$ be the supremum of the times for which the
    initial connected geodesic segment stays in $cal(P)_d$. Then $tau_P lt.eq T_d \( w \) < oo$.
    Viewed in $cal(P)_d$, this is a maximal future geodesic segment.
    The cited exterior completeness proposition rules out its avoiding $cal(S)$.
    Both $u$ and $v$ strictly increase on a future timelike wedge track.
    If they had finite limits, its position would remain in a compact regular coordinate range;
    the temporal-chart argument of Lemma 9 would give geodesic continuation there.
    Hence one or both limits are infinite, exactly as in Equation (3.10).
    If $tau_P < T_d \( w \)$, its endpoint is an ordinary point of $cal(M)_d$,
    although it is not a point of this wedge. The conclusion does not change in that case. ◻
]

For the corner argument we record the low geometric estimates from #cite(label("Foundation"))  and  by their
  content. Put $L_0 = partial_u + b^A partial_(theta^A)$ and $L_1 = partial_v$, and write $y_0 = u$, $y_1 = v$.
  For angular vectors define $chi_i = 1 / 2 cal(L)_(L_i) gamma$, $ell_i = L_i log a$,
  and the angular one-forms $xi_i$ by

#[#set math.equation(numbering: n => "(3.11)")
 $ xi_0 + xi_1 = d_theta log a \, wide xi_0 - xi_1 = - a^(- 1) gamma \( partial_v b \, dot.op \) . $ <test:torsion-def>]

They obey $\| xi_i \|_gamma lt.eq C$, and there are nonnegative $g_i in L^1 \( bb(R) \)$ with

#[#set math.equation(numbering: n => "(3.12)")
 $ \| chi_i \|_gamma + \| ell_i + kappa \| lt.eq C \( q + g_i \( y_i \) \) \,
   wide \| b \|_(upright("round")) lt.eq C \( q + g_0 \( u \) \) . $ <test:corner-low>]

These are the source’s interior low estimates on the actual full wedge,
  with no higher smallness or curvature assumption. Koszul’s formula gives, for an angular vector $E$ and $j eq.not i$,

#[#set math.equation(numbering: n => "(3.13)")
 $ nabla_(L_i) L_i = ell_i L_i \, wide nabla_E L_i = chi_i \( E \)^sharp + xi_i \( E \) L_i \, wide
   nabla_(L_j) L_i = a xi_j^sharp . $ <test:null-connections>]

In particular these identities use the shift in $L_0$ rather than identifying $L_0$ with $partial_u$.

The variables $Y_i = e^(- kappa y_i)$ tend to zero when the corresponding optical coordinate diverges.
  We will follow corner tracks to the null sections $u = j$:
  their remaining optical coordinate $Y_1$ tends to zero, while the next estimate bounds their momenta conjugate
  to the coordinates on those sections. Conservation of canonical volume will exclude an open family of corner seeds.

#thm([Lemma 3.9.])[
  (Bounds on each individual wedge track).  #emph[For a future unit timelike geodesic beginning at a fixed point
    of the wedge, set $Y_i = e^(- kappa y_i)$ and $Xi = dot(theta) - b dot(u)$.
    On its remaining wedge track each $\| dot(Y)_i \|$ is bounded above and below by positive constants,
    and $\| Xi \|_gamma$ is bounded. The constants may depend on its initial unit tangent.
    In particular every corner track has one finite bound for both $dot(Y)_i$ and $Xi$ throughout a sufficiently
    late tail.]
] <test:corner-bounds>

#proof[
  This is the part of the corner-ratio lemma #cite(label("Foundation")) that we need;
    we include its estimate to display the dependence on the individual track. Write
  $ U = dot(y)_0 L_0 + dot(y)_1 L_1 + Xi \, wide p_i = - g \( U \, L_i \) = a dot(y)_j > 0 quad \( j = 1 - i \) . $
  The future unit condition and Equation (3.13) give
  #[#set math.equation(numbering: n => "(3.14)")
   $ 1 + \| Xi \|_gamma^2 & = 2 a dot(y)_0 dot(y)_1 \,\
dot(p)_i / p_i & = ell_i dot(y)_i + \( xi_i - xi_j \) \( Xi \) -
  frac(chi_i \( Xi \, Xi \), p_i) . $ <test:normalization>]
  For example, the last equation follows by differentiating $- g \( U \, L_i \)$, using $nabla_U U =
    0$ and the three terms in $nabla_U L_i$ from Equation (3.13).
    Since $\| Xi \|_gamma^2 \/ p_i lt.eq 2 dot(y)_i$, it follows that
  #[#set math.equation(numbering: n => "(3.15)")
   $ lr(|frac(d, d tau) log \( e^(kappa y_i) p_i \)|) lt.eq C \( q + g_i \( y_i \) \) dot(y)_i +
     C \| Xi \|_gamma \, wide e^(kappa y_i) p_i = q_0 / kappa cal(A) \| dot(Y)_j \| . $ <test:logarithmic-variation>]
  The positive functions $Y_i$ decrease. On every initial part of the remaining track, Equation (3.14) implies
  $ integral \| Xi \|_gamma thin d tau lt.eq
    C (integral \| dot(Y)_0 \| thin d tau integral \| dot(Y)_1 \| thin d tau)^(1 \/ 2) lt.eq
    C sqrt(Y_0^(upright("in")) Y_1^(upright("in"))) . $
  Moreover,
  $ integral q dot(y)_i thin d tau lt.eq q_0 / kappa Y_0^(upright("in")) Y_1^(upright("in")) \, wide
    integral g_i \( y_i \) dot(y)_i thin d tau lt.eq integral_(y_i^(upright("in")))^oo g_i \( s \) thin d s . $
  Thus the logarithmic variation in Equation (3.15) is bounded independently of the terminal point of this track
    portion. Boundedness of $cal(A)^(plus.minus 1)$ gives positive upper and lower bounds for each $\|
    dot(Y)_i \|$, proportional to its initial value. Finally
  $ 1 + \| Xi \|_gamma^2 = frac(2 q_0 cal(A), kappa^2) \| dot(Y)_0 \| thin \| dot(Y)_1 \| $
  bounds the screen velocity. These constants depend on the two initial $Y$-speeds;
    no bound uniform over all unit timelike tangents has been asserted. ◻
]

=== 3.4 Null sections and exclusion of corner seeds <null-sections-and-exclusion-of-corner-seeds>

#thm([Proposition 3.10.])[
  (Corner seeds have measure zero).  #emph[For a fixed $d in cal(U)$,
    the seeds whose first runout from $cal(P)_d$ is a corner are contained in a set of measure zero for every
    smooth positive measure on $T Sigma$.]
] <test:corner-null>

#proof[
  Use $Y_i = e^(- kappa y_i)$ as above, and consider the interior null sections
  $ cal(N)_j = { u = j \, med u + v > 0 } \, wide j = 1 \, 2 \, dots.h . $
  Every corner track hits all sufficiently large $cal(N)_j$ transversely before first runout.
    The tangential covariant momenta on these sections are
  #[#set math.equation(numbering: n => "(3.16)")
   $ pi_(Y_1) = - frac(a dot(Y)_0, kappa^2 Y_0 Y_1) = - frac(q_0 cal(A), kappa^2) dot(Y)_0 \, wide P_A =
     gamma_(A B) Xi^B . $ <test:section-momenta>]
  The shift contributes to the $Y_0$ covector component, but not to $pi_(Y_1)$,
    because $partial_(Y_1)$ is a multiple of $L_1$. Lemma 13 and the uniform sphere-metric comparison show that,
    along each corner track, these momenta satisfy one finite bound on its entire sufficiently late tail.
    Also $Y_1 arrow.r 0$ along that tail.
  Here is the exact volume statement used to transfer these bounds.
    On $T^(*) cal(P)_d$ take the canonical symplectic form $omega = d pi_alpha and d x^alpha$,
    with the corresponding Hamiltonian-flow sign convention, and set $cal(H) = 1 / 2 g^(- 1) \( pi \, pi \)$.
    Restrict to the future unit mass shell $cal(H) = - 1 / 2$. Above a fixed $cal(N)_j$ the six variables
  $ \( Y_1 \, theta^1 \, theta^2 \, pi_(Y_1) \, P_1 \, P_2 \) $
  give coordinates on the transverse section of this shell.
    To check the missing momentum explicitly, let $tilde(a) = a \/ \( kappa^2 Y_0 Y_1 \) > 0$ and $tilde(b) = -
    b \/ \( kappa Y_0 \)$. Then
  $ g = - 2 tilde(a) thin d Y_0 d Y_1 +
    gamma_(A B) \( d theta^A - tilde(b)^A d Y_0 \) \( d theta^B - tilde(b)^B d Y_0 \) \, $
  and the shell equation is
  #[#set math.equation(numbering: n => "(3.17)")
   $ - tilde(a)^(- 1) \( pi_(Y_0) + tilde(b)^A P_A \) pi_(Y_1) + 1 / 2 gamma^(A B) P_A P_B = - 1 /
     2 . $ <test:mass-shell-solve>]
  Future timelikeness gives $dot(Y)_0 < 0$ and hence $pi_(Y_1) = - tilde(a) dot(Y)_0 > 0$.
    Thus Equation (3.17) determines $pi_(Y_0)$ uniquely. Pulling back $omega$ to this section, where $d Y_0 = 0$,
    gives the nondegenerate form
  #[#set math.equation(numbering: n => "(3.18)")
   $ omega_j = d pi_(Y_1) and d Y_1 + sum_(A = 1)^2 d P_A and d theta^A . $ <test:section-form>]
  Its absolute symplectic volume is ordinary canonical coordinate volume; there is no factor involving $a$ or $Y_0$.
  Let $D_j subset T Sigma$ consist of seeds whose initial connected track in $cal(P)_d$ hits $cal(N)_j$ at a
    finite time. This is open: a given compact geodesic segment stays in the open comparison spacetime,
    and its transverse hit persists by smooth flow dependence and the implicit function theorem.
    The hitting map $F_j : D_j arrow.r { cal(H) = - 1 / 2 } \|_(cal(N)_j)$ is smooth. It is injective.
    A wedge trajectory has strictly decreasing $Y_0$ and so hits that section at most once;
    a maximal trajectory in the globally hyperbolic $cal(P)_d$ meets its Cauchy hypersurface $Sigma$ once.
    If two hitting states were equal, uniqueness of the smooth Hamiltonian flow would therefore give the same
    initial seed.
  On the shell above $Sigma$, restriction of $omega$ is the canonical form on $T^(*) Sigma$.
    Indeed the tangential initial covector is $pi \|_(T Sigma) = h \( w \, dot.op \)$,
    so the map from seeds is a smooth fiberwise isomorphism onto $T^(*) Sigma$.
    Denote the pullback of its positive canonical volume by $mu$; this is a smooth positive measure on $T Sigma$.
  The hitting map preserves the section symplectic forms and hence their volumes,
    including its variable hitting time. In detail, Hamiltonian flow preserves $omega$,
    and its generating vector $X_(cal(H))$ belongs to the kernel of $omega$ restricted to the energy shell,
    since its contraction is, up to sign, $d cal(H)$. For a hitting time $tau \( w \)$,
  $ d F_j \( V \) = d Phi_(tau \( w \)) \( V \) + X_(cal(H)) \( F_j \( w \) \) thin d tau \( V \) . $
  All terms involving $d tau$ therefore vanish when evaluated by $omega$ on shell-tangent vectors.
    This proves preservation of the section forms. Their nondegeneracy also shows that $F_j$ is a local
    diffeomorphism. Its injectivity makes it a diffeomorphism onto its open image,
    so volume comparison for measurable subsets follows from change of variables, without any multiplicity factor.
  Fix a smooth round norm on angular covectors. For $r > 0$ and an integer $N gt.eq 1$,
    the region on the target section defined by
  $ 0 < Y_1 < r \, wide \| pi_(Y_1) \| lt.eq N \, wide \| P \|_(upright("round")) lt.eq N $
  has canonical volume at most $C_N r$, uniformly in $j$. A finite angular coordinate cover with precompact chart
    cores proves this directly from Equation (3.18); covector norms and coordinate components are uniformly
    comparable on each core. Restricting to the actual wedge $u +
    v > 0$ or to the future shell only reduces that volume. Let $S_(j \, r \, N)$ be its inverse image under
    $F_j$, including only the finite hits in $D_j$. These are measurable and satisfy
  #[#set math.equation(numbering: n => "(3.19)")
   $ mu \( S_(j \, r \, N) \) lt.eq C_N r . $ <test:strip-volume>]
  Fatou’s inequality applied to their indicator functions gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ mu #h(-0.16667em) (liminf_(j arrow.r oo) S_(j \, r \, N)) lt.eq
     liminf_(j arrow.r oo) mu \( S_(j \, r \, N) \) lt.eq C_N r . $ <test:fatou>]
  This use of Fatou does not require $mu \( T Sigma \)$ to be finite.
  Every corner seed is contained in
  #[#set math.equation(numbering: n => "(3.21)")
   $ union.big_(N = 1)^oo med ⋂_(s = 1)^oo liminf_(j arrow.r oo) S_(j \, 1 \/ s \, N) . $ <test:countable-corner-cover>]
  Indeed first choose one integer $N$ larger than the eventual momentum bound of its track.
    For each $s$ all sufficiently late hits then have $Y_1 < 1 \/ s$ and that same momentum bound.
    For a fixed $N$ the intersection in Equation (3.21) has measure at most $C_N \/ s$ for every $s$,
    and is therefore null. The countable union is null. All smooth positive measures on $T
    Sigma$ have the same null sets, proving the assertion. In particular no uniform momentum bound over the family
    of corner seeds has been inserted into the proof. ◻
]

#thm([Corollary 3.11.])[
  (A branch seed for every passing test).  #emph[If $d in cal(A) \( O \, B \)$,
    then there is $w in O$ whose first runout from $cal(P)_d$ is one of the two branches in Equation (3.10).
    After exchanging the optical labels and preparing the angular coordinates as in #cite(label("Foundation")),
    the branch can be written $u arrow.r u_(*) < oo$, $v arrow.r oo$. The seed is still the same initial seed in $O$.]
] <test:branch-seed>

#proof[
  The passing test gives finite full-development duration for every $w in O$,
    so Proposition 12 applies to all of them. The nonempty open set $O$ has positive $mu$-measure and cannot be
    contained in the null set of Proposition 14. Choose a noncorner seed.
    The source’s exchange lemma changes the coordinate preparation on the same cylinder and product spacetime and
    retains its estimates; it changes neither the geodesic nor its initial seed. ◻
]

The selected branch supplies an observer for the finite perturbation argument.
  At this stage the only bounds imposed on its full future track are the lifetime and transport bounds in
  Definition 6; no curvature bound or regular ambient endpoint of this observer is required.

The remaining task can now be stated precisely. For every passing datum $d in cal(A) \( O \, B \)$,
  finite $m gt.eq 10$, and $r > 0$, we must construct $d' in cal(U)$ such that

#[#set math.equation(numbering: n => "(3.22)")
 $ p_m \( d' - d \) < r \, wide d' in.not cal(A) \( O \, B \) . $ <test:density-target>]

By Lemma 7, this makes each test closed with empty relative interior.
  The Baire property and Proposition 11 then exclude future extensions on the countable intersection of their open
  dense complements. Sections 4–8 construct $d'$ by a finite experiment near a late point of the selected branch;
  Section 9 completes this assembly.

== 4 The all-spin background and the constrained linear packet <sec:background>

Fix $d in cal(U)$ and let $g$ be its smooth vacuum metric on the comparison development of Proposition 12,
  at the normalized center $0 < frak(a) < 1$. Given the branch selected in Section 3,
  our objective is to construct two versions of one linear perturbation:
  an oscillatory tensor near a late branch point and an exterior beam whose data lie on the original bridge.
  Their full spacetime jets must agree to prescribed finite accuracy at the entry cylinder.
  The next section will turn the two signs of these approximate fields into exact vacuum data.

We first record the background estimates imported from #cite(label("Foundation")),
  then locate the branch observation and the rays returning its entry data to the bridge.
  Only then do we introduce the normalized tensor slots used in the wave equation and construct the packet.
  The comparison construction fixes its inner profile depth $q_0$ before the exterior computing cuts and the
  $p_10$ radius. We retain those choices throughout; the return-ray proof below recalls the depth condition that
  ensures escape. All these background choices are independent of the finite packet parameters.

#prodef([Definition 4.1.])[
  (Fixed-order subexponential bounds).  The notation $Q_T lt.eq e^(o \( T \))$ means that, for every $sigma > 0$,
    $Q_T lt.eq C_sigma e^(sigma T)$ for all sufficiently large $T$.
    The constants may depend on $d$, the fixed coordinate domains,
    and every fixed derivative and formal expansion order. A positive quantity has two-sided subexponential size
    if this holds for the quantity and its reciprocal. A finite product or sum of such bounds,
    including a factor polynomial in $T$, is again subexponential.
    No uniformity over unbounded derivative orders is intended.
] <bg:subexponential>

=== 4.1 Profiles, entry data, and the full double-null wedge <profiles-entry-data-and-the-full-double-null-wedge>

Write the interior metric and optical variables as

#[#set math.equation(numbering: n => "(4.1)")
 $ t = \( u + v \) \/ 2 gt.eq 0 \, wide x = \( v - u \) \/ 2 \, wide cal(S) = { t = 0 } \,\
g = - 2 a thin d u thin d v + gamma_(A B) \( d theta^A - b^A d u \) \( d theta^B - b^B d u \) \, wide a =
  q cal(A) \, quad q = q_0 e^(- 2 kappa t) \,\
L_0 = partial_u + b^A partial_A \, wide L_1 = partial_v . $ <bg:wedge>]

The constants $q_0 \, kappa > 0$ depend on the fixed center;
  the optical coefficient $a$ is distinct from the Kerr rotation $frak(a)$.
  Use a fixed finite smooth sphere atlas. If $y_0 = u$, $y_1 = v$, $B_0 = b$, and $B_1 = 0$, put

#[#set math.equation(numbering: n => "(4.2)")
 $ frak(L)_i = partial_(y_i) + cal(L)_(B_i) \, wide chi_i = 1 / 2 frak(L)_i gamma \, wide tau_i =
   "tr"_gamma chi_i \, wide ell_i = L_i log a \,\
xi_0 + xi_1 = d_theta log a \, wide xi_0 - xi_1 = - a^(- 1) gamma \( partial_v b \, dot.op \) \, wide beta_i =
  "div"_gamma chi_i - d_theta tau_i . $ <bg:null-fields>]

Angular Sobolev norms are taken in that atlas; the controlled angular metrics give equivalent geometric norms.
  Ordinary derivatives $D$ mean coordinate derivatives of the displayed arrays.

#thm([Proposition 4.2.])[
  (All-spin geometric interface).  #emph[There is a choice of $epsilon.alt > 0$,
    depending only on the fixed Kerr center and the fixed preparation,
    such that every $p_10 \( d - d_(*) \) < epsilon.alt$ in the stated smooth symbol class has the following
    properties.]
  + #emph[The cylinder $cal(S)$ in Proposition 12 has a smooth vacuum development on the full product wedge
    $\[ 0 \, oo \)_t times bb(R)_x times bb(S)^2$ in Equation (4.1).
    The quantities $cal(A)^(plus.minus 1) \, gamma^(plus.minus 1)$ are uniformly bounded in angular $H^6$,
    and $xi_i \, a^(- 1) partial_v b$ in angular $H^5$. There are nonnegative functions $g_i \( y_i \)$ with
    summable unit-cell suprema such that, in the indicated low angular norms,
#[#set math.equation(numbering: n => "(4.3)")
 $ parallel chi_i \, ell_i + kappa parallel_(H^4) lt.eq C \( q + g_i \( y_i \) \) \, wide
   parallel b parallel_(H^5) lt.eq C \( q + g_0 \( u \) \) . $ <bg:envelopes>]

]
  + #emph[The following quantities are uniformly bounded, and tend to zero when $t \, \| u \| \, \| v \| arrow.r oo$:
#[#set math.equation(numbering: n => "(4.4)")
 $ parallel b parallel_(H^5) + sum_i parallel chi_i \, ell_i + kappa parallel_(H^4) \,\
sum_(k = 0)^1
  (parallel partial_(y_k) b parallel_(H^2) + sum_i parallel partial_(y_k) chi_i \, partial_(y_k) ell_i
  parallel_(H^2)) \,\
sum_(k = 0)^1
  (parallel partial_(y_k) gamma parallel_(H^4) + parallel partial_(y_k) log a + kappa parallel_(H^4)) .
  $ <bg:low-limits>]

 In particular $D log a \, D gamma \, b \, D b$ are uniformly bounded.]
  + #emph[For each fixed $U in bb(R)$, $C > 0$, and finite order, all ordinary derivatives of
#[#set math.equation(numbering: n => "(4.5)")
 $ gamma^(plus.minus 1) \, quad log cal(A) \, quad b \, quad a^(- 1) partial_v b $ <bg:high-arrays>]

 are bounded by $e^(o \( T \))$ on
#[#set math.equation(numbering: n => "(4.6)")
 $ t gt.eq 0 \, wide y_d lt.eq U \, wide y_l lt.eq C T \, wide { d \, l } = { 0 \, 1 } . $ <bg:truncation>]

 This includes every restriction and coordinate-path subsegment.
   Every fixed derivative of $a$, $sqrt(a)$, or $partial_v b$ retains, respectively, the factor $a$, $sqrt(a)$, or $a$.]
  + #emph[Either branch can be put in the convention $v arrow.r oo$, $u arrow.r u_(*) < oo$.
    Exchanging the optical labels and preparing the angular coordinates anew preserves all these conclusions on
    the same product spacetime and initial cylinder.]
  #emph[Only $p_10$ is required small; no higher seminorm, radiation coefficient,
    or curvature measured by a timelike observer is required small or bounded.]
] <bg:geometry>

#proof[
  #emph[Exterior evolution and cylinder data.] The exterior input is the simultaneous closure in
    #cite(label("Foundation")). It applies to both computing cylinders from the $p_10$ input,
    with variable asymptotic parameters and arbitrary finite higher symbol seminorms.
    The higher estimates are #cite(label("Foundation")). We describe the entry hypotheses so that the subsequent
    interior citations have a precise common domain of applicability.
  For nearby physical Kerr parameters the exact profiles in #cite(label("Foundation")) are smooth in
    $\( q \, theta \)$ and the parameters, with $cal(A) \, gamma$ and their inverses smooth at $q = 0$. They satisfy
  $ b = O \( q \) \, quad chi_i \, ell_i + kappa \, beta_i = O \( q \) \, wide xi_i \, K_gamma \,
    "curl"_gamma xi_i = O \( 1 \) \, $
  after each fixed angular or parameter derivative; here $K_gamma$ is the Gaussian curvature of the angular
    metric. The common $kappa$ is obtained by rescaling the exact optical variables by $kappa_(-) \/ kappa$,
    where $kappa_(-)$ is the positive absolute inner surface gravity of the current physical profile.
  The moving preparation uses integrated Killing and rotation phases,
    whose derivatives are the instantaneous frozen frequencies.
    Its Jacobian errors contain positive parameter derivatives with bounded coefficients,
    without an elapsed-time factor. This is #cite(label("Foundation")).
    The single physical profile on the wedge depends only on $u$;
    a frozen differentiated profile means differentiation at fixed parameters followed by evaluation at this
    profile. The additional parameter defect is consequently confined to the $u$ direction.
    After decreasing $epsilon.alt$, the cylinder differences from these frozen profiles have arbitrarily small
    sums of unit-$x$-cell suprema in exactly the following norms:
  #[#set math.equation(numbering: n => "(4.7)")
   $ cal(A) \, log cal(A) \, gamma \, b \, chi_i \, ell_i \, xi_i & H^6 upright(" in angle")\
gamma & H^7 upright(" in angle")\
partial_x \( chi_i \, ell_i \, xi_i \, b \) \|_(cal(S)) & H^2 upright(" in angle") . $ <bg:entry-orders>]
  The unit-cell sum of the first profile derivative is small as well.
    Every fixed higher entry norm on $\| x \| lt.eq C T$ is subexponential.
    These are the full assumptions and conclusions of #cite(label("Foundation")).
    Its trace estimate uses mixed spacetime metric derivatives through order eight and one additional time
    derivative outside the trapping region, supplied by there.
    The entry supports lie between the horizons, separated from that trapping region.
    On the bounded middle the finite bridge evolution supplies the same derivative budget.
    Thus the trace step does not require a small high-order norm beyond the stated $p_10$ input.
  #emph[Interior continuation and derivative bounds.] , , and of #cite(label("Foundation")) apply to precisely
    these profiles and entry norms. They give Equations (4.3)–(4.6).
    In particular the second line of Equation (4.4) includes the pure longitudinal derivatives $frak(L)_i
    chi_i$ and $L_i ell_i$; one has not inferred them by differentiating an uncontrolled limit.
    first uses finite-diamond high estimates, where $a$ is bounded below, to continue and exhaust the full wedge.
    Only after that exhaustion does it use the tails of the summable low envelopes to prove the expanding-domain
    subexponential estimate. This order avoids assuming a global tail estimate to prove existence of the region
    carrying that tail. The factor assertions follow by differentiating $a = q cal(A)$ and $partial_v b =
    a gamma^(- 1) \( xi_1 - xi_0 \)$.
  #emph[The other branch convention.] Finally #cite(label("Foundation")) negates the prepared $x$ on $cal(S)$ and
    transports the newly prepared angles along the new shift-free direction.
    At each finite point this is a finite smooth sphere flow with a smooth inverse.
    The entry proof and finite-diamond estimates are reapplied in that gauge and exhausted.
    No uniform bound on an otherwise unestimated long angular coordinate change is used.
    These are estimates in the newly prepared coordinates on the same comparison spacetime. ◻
]

=== 4.2 An arbitrary branch observer <an-arbitrary-branch-observer>

The selected branch determines the observation point and its optical scale.
  The following argument uses only the low geometric estimates; in particular,
  selecting the observer requires no curvature assumption.

#thm([Lemma 4.3.])[
  (Branch normalization without a curvature hypothesis).  #emph[Let a future unit timelike geodesic approach a
    branch $v arrow.r oo$, $u arrow.r u_(*) < oo$, in the comparison wedge. With proper time denoted by $tau$, put
$ p = a dot(v) \, wide Xi = dot(theta) - b dot(u) \, wide P = gamma Xi . $

 Then $p asymp 1$, and $P$, $Xi$, and $dot(u)$ stay bounded on a late segment. The angular position has a limit.
   At the point $p_T$ with $v = T$ one has
#[#set math.equation(numbering: n => "(4.8)")
 $ a_p := a \( p_T \) asymp e^(- kappa T) \, wide dot(v) \( p_T \) asymp e^(kappa T) . $ <bg:branch-scales>]

]
] <bg:branch>

#proof[
  This is the observer-independent calculation in #cite(label("Foundation")). Unit normalization gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ 1 + \| Xi \|_gamma^2 = 2 a dot(u) dot(v) = 2 p dot(u) . $ <bg:unit-branch>]
  For the unit tangent $U$, differentiating $p = - g \( U \, L_0 \)$ and using the geodesic equation gives the
    exact identity
  $ dot(p) / p = ell_0 dot(u) + \( xi_0 - xi_1 \) \( Xi \) - frac(chi_0 \( Xi \, Xi \), p) . $
  The null connection identities in Equation (3.13) therefore imply $\| accent(log p, ̇) \| lt.eq
    C \( dot(u) + \| Xi \|_gamma \)$, using $\| Xi \|^2 \/ p lt.eq 2 dot(u)$ from Equation (4.9). Moreover
  $ integral \| Xi \|_gamma thin d tau lt.eq sqrt(2) (integral d u)^(1 \/ 2) (integral a thin d v)^(1 \/ 2) < oo . $
  Indeed $u$ has finite increasing variation and $a lt.eq C e^(- kappa v)$ on the bounded-$u$ segment.
    Integration therefore bounds $p$ above and below by positive constants.
    Since $b$ is bounded, this also proves finite angular length and an angular limit.
  Work near that limit in a sphere chart and introduce canonical momenta $pi_u = - p - b dot.op P$.
    The unit shell solved with $v$ as time has Hamiltonian
  #[#set math.equation(numbering: n => "(4.10)")
   $ - pi_v = frac(a \( 1 + \| P \|_(gamma^(- 1))^2 \), 2 p) \, wide frac(d u, d v) =
     frac(a \( 1 + \| P \|_(gamma^(- 1))^2 \), 2 p^2) . $ <bg:branch-hamiltonian>]
  At fixed canonical $\( pi_u \, P \)$, $partial_theta p = - \( partial_theta b \) dot.op P$.
    Bounded first derivatives of $log a \, gamma \, b$ in Hamilton’s equation for $P$ consequently give
  $ lr(|frac(d P, d v)|) lt.eq C \( p + \| P \| \) frac(d u, d v) . $
  Gronwall in the finite variation variable $u$ bounds $P$. Equation (4.9) bounds $Xi$ and $dot(u)$.
    Finally Equation (4.1) yields Equation (4.8). This argument uses only first metric derivatives and the unit
    shell, and no curvature bound along the geodesic. ◻
]

=== 4.3 The exterior geometry of the launch patch <the-exterior-geometry-of-the-launch-patch>

#thm([Proposition 4.4.])[
  (Entry timing, escape, and flow estimates).  #emph[On either prepared end use regular exterior time $t_e$,
    co-moving coordinates $y$, and lab coordinates $z = y + C_e \( t_e \)$, with fixed $sup \| C'_e \| lt.eq
    s_(*) < 1 \/ 10$, after decreasing $epsilon.alt$ if needed.
    The relevant slice $t_e = 0$ agrees with the original bridge sufficiently far out.
    There is a preparation parameter $I$ with $0 < c_I lt.eq I' lt.eq C_I$ and $I \( t_T \) = T$.
    The launch patch near $v = x = T$ on $cal(S)$ occurs at $t_e = t_T + O \( 1 \)$, and $t_T asymp T$.
    A fixed enlargement is contained in $t_e lt.eq t_T + C_2$.
    Its selected-end portion $v < \( 1 - nu_0 \) T$ is earlier by at least $c nu_0 T -
    O \( 1 \)$ for each fixed $nu_0 > 0$.]
  #emph[The exterior metric has uniformly regular spacelike temporal levels.
    Its first and second ordinary lab derivatives are bounded on the computing region and become arbitrarily small
    at sufficiently large co-radius, uniformly in time. Every fixed mixed jet on the used time and radius ranges
    $O \( 1 + T \)$ is $e^(o \( T \))$. Entry charts have a noncharacteristic collar with controlled low jets and
    subexponential fixed higher jets; the inner exit has a strict margin deeper than the entry cylinder.]
  #emph[The null covectors $d v$ launched on a sufficiently small fixed patch at this entry escape towards the
    past to the same original end. For each fixed $beta > 0$,
    after fixing a sufficiently large radius and taking $T$ large, their bridge arrival points satisfy
#[#set math.equation(numbering: n => "(4.11)")
 $ \( 1 - beta \) t_T < \| z - z_(*) \| < \( 1 + beta \) t_T \, wide z_(*) = C_e \( t_T \) . $ <bg:arrival-shell>]

 The entry crossing is unique and transverse, and separated from other used ray portions outside a uniform collar.
   Every fixed Hamiltonian flow jet, including launch-center derivatives and the propagators on all subsegments,
   is $e^(o \( T \))$. Tensor parallel transport and its inverse are bounded.
   These assertions hold on short past and future launch enlargements through the deeper exit.]
] <bg:exterior>

#proof[
  The timing and low exterior bounds are established in #cite(label("Foundation")) , , and ;
    the escape and all-subsegment statements are there. We check why the launch geometry meets that proposition
    independently of the timelike observer. The original profile-depth choice makes the radial potential of these
    particular null rays strictly positive. For one of the nearby exact Kerr profiles,
    write $M_K$ and $frak(a)_K$ for its mass and spin length, $r_K$ for the Boyer–Lindquist radius,
    $omega = \( theta.alt \, phi \)$ for the angular variables,
    and $\| dot.op \|_(upright("rd"))$ for the unit round sphere norm. Thus
  $ Delta_K = r_K^2 - 2 M_K r_K + frak(a)_K^2 \, wide r_plus.minus = M_K plus.minus sqrt(M_K^2 - frak(a)_K^2) . $
  In aligned Kerr coordinates its optical correction $F_K$ solves
  #[#set math.equation(numbering: n => "(4.12)")
   $ 2 \( r_K^2 + frak(a)_K^2 \) partial_(r_K) F_K + Delta_K \( partial_(r_K) F_K \)^2 + \| d_omega
     F_K \|_(upright("rd"))^2 + frak(a)_K^2 sin^2 theta.alt = 0 \, wide F_K \( r_(-) \) = 0 . $ <bg:profile-eikonal>]
  The finite root is noncharacteristic. In the original comparison preparation,
    $q_0$ is chosen small enough for both angular transport conventions and for the uniform strict depth condition
  #[#set math.equation(numbering: n => "(4.13)")
   $ (\| partial_theta.alt F_K \|^2 + frak(a)_K^2 sin^2 theta.alt)_(upright("entry")) < 4 frak(a)_K^2 .
     $ <bg:profile-depth>]
  This is possible because the physical spins lie in a compact neighborhood inside $\( 0 \, 1 \)$ and
    $partial_theta.alt F_K = O \( q_0 \)$. The inner exit is fixed strictly deeper,
    with a positive margin before the inner horizon.
  On fixed radial compact sets the metric and prepared entry covectors converge in the required low orders to a
    nearby frozen subextremal Kerr metric and to $lambda_(-) d \( r_(*) + F_K + T_K \)$ in aligned variables,
    with $lambda_(-) = kappa_(-) \/ kappa > 0$. Here $T_K$ is the signed Boyer–Lindquist Killing time and the
    tortoise coordinate $r_(*)$ satisfies $d r_(*) \/ d r_K = \( r_K^2 + frak(a)_K^2 \) \/ Delta_K$.
    The integrated phase preparation used above gives this covector convergence even if accumulated azimuthal
    phases do not converge. The frozen axial momentum is zero and its radial potential,
    divided by the square of Killing energy, is
  #[#set math.equation(numbering: n => "(4.14)")
   $ \( r_K^2 + frak(a)_K^2 \)^2 -
     Delta_K (\| partial_theta.alt F_K \|^2 + frak(a)_K^2 sin^2 theta.alt)_(upright("entry")) . $ <bg:radial-potential>]
  For $r_K gt.eq r_(+)$, $Delta_K < r_K^2$ and $\( r_K^2 + frak(a)_K^2 \)^2 \/ r_K^2 gt.eq 4 frak(a)_K^2$;
    between the horizons $Delta_K < 0$. The prior depth choice Equation (4.13) therefore makes this potential
    strictly positive. Its initial past radial direction is outward,
    since the finite Hamilton–Jacobi root gives $r_K^2 + frak(a)_K^2 + Delta_K partial_(r_K) F_K > 0$.
    It crosses each fixed compact radial band, including the future event horizon in regular coordinates,
    transversely in bounded regular time. The defining entry level is strictly monotone near its crossing;
    the other used compact portions are separated from it. These are uniform launch-patch facts,
    and persist by the compact convergence just stated.
  In the far region the proof of gives a summably small connection integral on the outward-to-the-past cone.
    More precisely, there gives the far-region lab-derivative estimate:
    it controls the bad first-derivative term on each radial dyad $r asymp
    R$ by an integrated bound $O \( R^(\( e_f - \( 1 - delta_f \) A_H \) \/ 2) \)$,
    with $e_f - \( 1 - delta_f \) A_H < 0$, and the remaining term is summable.
    Here $e_f \, delta_f \, A_H$ are the fixed far-estimate exponents of that source.
    Thus the lab velocity stays close to a fixed outward unit direction and the frequency stays nondegenerate.
    Integration gives Equation (4.11); the same connection integral bounds tensor transport and its inverse.
    For the Hamiltonian first variation, only the momentum-to-position block need remain of order one at large
    radius. Rescaling its position variation by a small fixed constant makes that block small,
    and then taking the far radius large makes the other blocks small by the first and second metric derivative
    bounds. The complementary compact crossing has fixed length.
    This proves an arbitrarily small average growth rate on every subsegment.
    Higher variation equations have this same homogeneous propagator and sources involving lower jets and fixed
    high coefficient jets; induction gives the asserted subexponential bounds.
    The proof uses only the prepared launch covectors and the exterior geometry,
    so applies at the moving angular foot of any branch and after the separately prepared exchange of labels. ◻
]

=== 4.4 Normalized tensor slots and wave coefficients <normalized-tensor-slots-and-wave-coefficients>

We now prepare the tensor wave equation for the packet. In the coordinate frame,
  inverse metric coefficients grow as the optical lapse $a$ decreases.
  The following frame separates that geometric scale from the bounded coefficient arrays.
  It also identifies the constant radial connection terms that must be retained in the interior energy estimate.

For $e_A = partial_(theta^A)$ define

#[#set math.equation(numbering: n => "(4.15)")
 $ hat(e)_i = a^(- 1 \/ 2) L_i \, wide hat(e)_A = e_A \, wide Z_alpha = sqrt(a) thin hat(e)_alpha \, wide W_t =
   L_0 + L_1 \, quad W_x = L_1 - L_0 . $ <bg:frames>]

Thus $Z_i = L_i$, $Z_A = sqrt(a) thin e_A$, and the normalized metric matrix has radial null block with
  $g \( hat(e)_0 \, hat(e)_1 \) = - 1$ and angular block $gamma$.
  A relative array of a covariant two-tensor $h$ means $h \( hat(e)_alpha \, hat(e)_beta \)$.
  Derivatives of this array remain ordinary $D$ derivatives.
  For a covariant two-tensor entry $n$, let $n_i$ count its slots of index $i$, and set

#[#set math.equation(numbering: n => "(4.16)")
 $ c_n = kappa \( n_0 - n_1 \) \/ 2 \, wide \| c_n \| lt.eq kappa . $ <bg:slot-weight>]

#thm([Lemma 4.5.])[
  (Normalized coefficient arrays).  #emph[Let $V_alpha$ be the matrix of $nabla_(Z_alpha)$ on the normalized
    vector basis. These matrices are bounded, and in the bulk limit $min \( v \, - u \, t \) arrow.r oo$,
#[#set math.equation(numbering: n => "(4.17)")
 $ V_0 arrow.r D_0 = "diag" \( - kappa \/ 2 \, kappa \/ 2 \, 0 \, 0 \) \, wide V_1 arrow.r - D_0 \, wide
   V_A arrow.r 0 . $ <bg:connection-limits>]

 The differentiated connection terms contracted in the tensor operator $a square.stroked.tiny_g$,
   and every normalized entry of $a "Riem" \( g \)$, are bounded and tend to zero in this limit.
   Their fixed ordinary jets and those of the brackets of $Z$ are $e^(o \( T \))$ on Equation (4.6).
   Moreover $nabla_(L_1) L_1 = ell_1 L_1$ exactly. The undifferentiated constant connection products are retained:
   on entry $n$ the limiting radial operator is
#[#set math.equation(numbering: n => "(4.18)")
 $ & - \( L_0 + c_n \) \( L_1 - c_n \) - \( L_1 - c_n \) \( L_0 + c_n \)\
 & wide = - L_0 L_1 - L_1 L_0 + 2 c_n \( L_0 - L_1 \) + 2 c_n^2 . $ <bg:radial-conjugation>]

 It is the radial part of $e^(2 c_n x) a square.stroked.tiny_g^(upright("scal")) e^(- 2 c_n x)$.]
] <bg:coefficients>

#proof[
  The needed calculations are those of #cite(label("Foundation"));
    we display them to identify every possible unsuppressed term.
    Koszul’s formula applied to Equations (4.1) and (4.2) gives, with $j = 1 - i$,
  #[#set math.equation(numbering: n => "(4.19)")
   $ nabla_(L_i) hat(e)_i & = 1 / 2 ell_i hat(e)_i \, & nabla_(L_i) hat(e)_j & = - 1 / 2 ell_i hat(e)_j +
     sqrt(a) thin xi_i^A e_A \,\
nabla_(L_i) e_A & = \( chi_(i \, A) zws^B - partial_A B_i^B \) e_B + sqrt(a) thin xi_(i \, A) hat(e)_i \,\
nabla_(Z_A) hat(e)_i & = chi_(i \, A) zws^B e_B + 1 / 2 sqrt(a) \( xi_i - xi_j \)_A hat(e)_i \, & nabla_(Z_A)
  e_B & = sqrt(a) thin Gamma \( gamma \)_(A B)^C e_C + chi_(0 \, A B) hat(e)_1 +
  chi_(1 \, A B) hat(e)_0 . $ <bg:radial-connection>]
  For example, differentiating $L_i = sqrt(a) thin hat(e)_i$ gives $nabla_(L_i) L_i = ell_i L_i$.
    The low estimates yield Equation (4.17). The exact brackets are
  #[#set math.equation(numbering: n => "(4.20)")
   $ \[ L_0 \, L_1 \] = sqrt(a) \( xi_0 - xi_1 \)^A Z_A \,\
= 1 / 2 ell_i Z_A - \( partial_A B_i^B \) Z_B \,\
= 1 / 2 sqrt(a) #scale(x: 120%, y: 120%)[\(] \( partial_A log a \) Z_B - \( partial_B log a \) Z_A #scale(x: 120%, y: 120%)[\)] . $ <bg:brackets>]
  The radial trace of differentiated connection coefficients uses $L_0 V_1$ and $L_1 V_0$,
    and hence cross derivatives. In particular $L_1 partial_A b = partial_A partial_v b$ retains $a$.
    Longitudinal derivatives of torsion reduce by the vacuum identities
  $ frak(L)_i xi_j = beta_i + tau_i xi_i \, wide frak(L)_i xi_i = d_theta ell_i - beta_i - tau_i xi_i . $
  The remaining angular derivatives carry $sqrt(a)$. These observations and Equation (4.4) give the boundedness
    and bulk smallness of the contracted differentiated connection terms.
  Writing $V_X$ for the connection matrix along $X$, curvature obeys the exact matrix identity
  #[#set math.equation(numbering: n => "(4.21)")
   $ a R \( hat(e)_alpha \, hat(e)_beta \) = Z_alpha V_beta - Z_beta V_alpha + \[ V_alpha \, V_beta \] -
     V_(\[ Z_alpha \, Z_beta \]) . $ <bg:curvature-matrix>]
  Besides the cross derivatives just considered, its radial-angular entries contain the pure derivatives $L_i
    chi_i$ controlled by Proposition 17. Two angular directions carry a $sqrt(a)$ derivative or a product of
    matrices tending to zero. The only nonzero limiting bracket coefficient multiplies $V_A arrow.r 0$,
    while $\[ D_0 \, - D_0 \] = 0$. Angular $H^2$ embeds into $C^0$ on the controlled spheres,
    so the stated low derivative budget suffices. Differentiating these identities and using Equation (4.5) proves
    the higher-jet assertions. The covariant tensor connection has the negative vector connection on each slot;
    its constant radial actions are therefore $L_0 + c_n$ and $L_1 - c_n$.
    Expanding their mixed trace gives Equation (4.18), since $L_0 x = - 1 \/ 2$ and $L_1 x = 1 \/ 2$.
    In particular $2 c_n^2$ has not been classified as a small coefficient.
    The angular metric and rescaled torsion need not tend to a prescribed constant or be small. ◻
]

=== 4.5 A constrained packet with freely chosen amplitude <bg:linear-packet-section>

Fix a branch point $p_T$ as in Lemma 18. The construction is linear in its amplitude.
  We state it at the amplitude used in the present proof and record its general-amplitude consequence at the end
  of the section. Choose $u_2 > u_(*)$, $c_2 > 0$, and then small $c_0 >
  0$ so that $p_T$ has a fixed interior margin in the finite domain

#[#set math.equation(numbering: n => "(4.22)")
 $ cal(D)_T = {0 lt.eq t lt.eq L_T = \( T + u_(*) \) \/ 2 + c_0 \, quad u + c_0 t \/ T lt.eq u_2 \, quad v +
   c_0 t \/ T lt.eq T + c_2} . $ <bg:packet-domain>]

We use $cal(D)_T$ as the closed domain on which to state packet bounds;
  every construction is first made on a slightly enlarged domain,
  so its boundary jets come from a spacetime neighborhood. The nonlinear evolution will be retained inside the
  strict upper-time and side inequalities of the same domain.
  Its slice intervals in $x$ have lengths bounded below. Fix $u_f > u_2$ for terminal transports.
  The whole strip $- v lt.eq u lt.eq u_f$, with $v$ near $T$, is contained in Equation (4.6),
  including its moving initial foot $u = - v$.

For a symmetric covariant tensor define trace reversal by $"tr.rev."_g h = h - 1 / 2 \( "tr"_g h \) g$.
  Let $cal(P)$ be the tensor-wave operator with curvature potential obtained from the linearized wave-map reduced
  vacuum equation after trace reversal, normalized to have principal part $square.stroked.tiny_g$.
  Write $cal(C) = "div"_g$ on these trace-reversed tensors. On the Ricci-flat background,

#[#set math.equation(numbering: n => "(4.23)")
 $ cal(C) cal(P) = cal(P)_1 cal(C) \, $ <bg:linear-bianchi>]

where $cal(P)_1$ is the corresponding one-form wave operator. This is the linearized contracted Bianchi identity.
  The underlying nonlinear reduction throughout is the local wave-map equation with fixed target $g$:

#[#set math.equation(numbering: n => "(4.24)")
 $ "Ric" \( tilde(g) \)_(mu nu) + nabla_(\( mu)^(tilde(g)) Upsilon_(nu \)) & = 0 \,\
Upsilon_mu & = - tilde(g)_(mu lambda) tilde(g)^(alpha beta) #scale(x: 120%, y: 120%)[\(]
  Gamma \( tilde(g) \)_(alpha beta)^lambda - Gamma \( g \)_(alpha beta)^lambda #scale(x: 120%, y: 120%)[\)] .
  $ <bg:wave-reduction>]

This is the local wave-map reduction of #cite(label("Foundation")).
  Its target is a fixed coefficient field on each computing block.

#thm([Proposition 4.6.])[
  (Linear packet and exterior beam).  #emph[Fix any finite list of output derivative orders,
    including an exterior base buffer $N_b$. For every fixed $zeta >
    0$ and every subsequently prescribed inverse accuracy $M_1$,
    sufficiently high finite transport and Taylor orders yield a real interior tensor $h_T^p$ and a real exterior
    tensor $h_T^B$ with the following properties. Put
#[#set math.equation(numbering: n => "(4.25)")
 $ A_T = e^(- alpha T) \, wide alpha = 7 kappa \/ 8 \, wide lambda_T = e^(zeta T) . $ <bg:packet-scales>]

 The interior field has the form
#[#set math.equation(numbering: n => "(4.26)")
 $ h_T^p = A_T "tr.rev."_g "Re" (e^(i lambda_T v) sum_(j = 0)^J lambda_T^(- j) p_j) . $ <bg:packet-form>]

 Every fixed normalized coefficient jet of $p_j$ is $e^(o \( T \))$.
   The field is supported in a fixed-width neighborhood of $v = T$,
   with angular support in the transported launch patch. Its relative array
   $q_T = \( h_T^p \( hat(e)_alpha \, hat(e)_beta \) \)$ satisfies
#[#set math.equation(numbering: n => "(4.27)")
 $ parallel q_T parallel_(C^N \( cal(D)_T \)) lt.eq A_T lambda_T^N e^(o \( T \)) $ <bg:packet-size>]

 at each specified order. The tensor $p_0$ is trace-free and $p_0 \( L_0 \, dot.op \) = 0$.
   There is a purely angular $gamma$-unit vector $X$ at $p_T$ for which
#[#set math.equation(numbering: n => "(4.28)")
 $ sigma_T :=
   lr(|"Re" #scale(x: 120%, y: 120%)[\(] e^(i lambda_T T) p_0 \( X \, X \) #scale(x: 120%, y: 120%)[\)]|)
   $ <bg:polarization>]

 has two-sided subexponential size. The $a$-scaled linear wave residual and $sqrt(a)$-scaled linear gauge
   residual, in normalized slots and with all prescribed ordinary derivatives,
   are bounded by $A_T lambda_T^(- M_1) e^(o \( T \))$.]
  #emph[In regular exterior lab components,
#[#set math.equation(numbering: n => "(4.29)")
 $ parallel h_T^B parallel_(C^(N_b)) lt.eq A_T lambda_T^(N_b + 3 \/ 2) e^(o \( T \)) . $ <bg:beam-estimates>]

 Its linear wave and gauge residuals, and its difference from $h_T^p$ on the entry collar,
   have size $A_T lambda_T^(- M_1) e^(o \( T \))$ at all the prescribed finite orders.
   The latter assertion includes normal spacetime jets. On the original bridge its support lies in Equation (4.11)
   with arbitrarily thin tube margins. Increasing $M_1$ and the finite formal degrees does not increase the
   positive frequency powers in Equations (4.27) and (4.29).
   Thresholds and subexponential constants may depend on those degrees.]
] <bg:packet>

#proof[
  We extract the linear construction of #cite(label("Foundation")) , and the proof of .
    The verification below records its amplitude independence and its uniformity at the actual frequency $lambda_T$.
  #emph[Constrained transport in the interior.] Set $k_v = g^(- 1) d v = - a^(- 1) L_0$, $K_v p =
    p \( k_v \, dot.op \)$, and $cal(T) = 2 nabla_(k_v) + square.stroked.tiny_g v$.
    Since $v$ is optical, the transport and divergence equations are
  #[#set math.equation(numbering: n => "(4.30)")
   $ i cal(T) p_j + cal(P) p_(j - 1) = 0 \, wide i K_v p_j + cal(C) p_(j - 1) = 0 \, wide p_(- 1) =
     0 . $ <bg:hierarchy>]
  Multiplication of the transport by $- a \/ 2$ gives $nabla_(L_0) + 1 / 2 tau_0$.
    On a normalized entry of weight $c_n$ its same-weight constant part is $L_0 + c_n$,
    and the remaining same-weight coefficients have arbitrarily small bulk average.
    The connection formulas show that off-weight transport couples only from higher weights.
    At $u = - v$ prescribe the slots with a $0$ index using the gauge equation.
    The free angular entries vanish for $j > 0$; for $j = 0$ take a compact smooth angular and $v$ bump times a
    trace-free polarization of unit size at the foot of the ray from $p_T$.
    Initialize the negative-weight slots at $u_f$ with zero terminal values and integrate them backwards.
    The constants $c_n$ have the damping sign in these respective directions.
    The decreasing-weight triangular system therefore determines all coefficients.
  Conjugate Equation (4.23) by the oscillatory phase and compare successive powers.
    Once preceding gauge defects vanish, the next defect in Equation (4.30) obeys homogeneous one-form transport
    and has zero initial value. Hence every gauge equation holds throughout the strip.
    The terminal choices impose no further gauge condition: contraction by $k_v$ uses exactly the entries with a
    $0$ slot.
  For completeness, along each $L_0$ transport the portion outside $min \( v \, - u \, t \) >
    R$ has length bounded in terms of $R \, u_f$ only. On its complement $b$, its first angular derivatives,
    and the nonconstant diagonal coefficients become arbitrarily small.
    Their integrals are consequently $o \( T \)$. The angular flow and its inverse have subexponential first jets.
    Every higher flow variation solves the same homogeneous equation with lower-jet sources and the high
    coefficient bounds of Equation (4.6); induction gives subexponential jets,
    including derivatives of the moving foot. The favorable constant signs just noted give the identical
    conclusion for each transport coefficient. The normalized sources $a cal(P) p_(j - 1)$ and $sqrt(a) thin
    cal(C) p_(j - 1)$ have these bounds by Lemma 20. Integration over length $O \( T \)$ preserves them.
    All these equations are local in $v$ and along the angular flow, so preserve the asserted support,
    also in the terminal integrations.
  The leading tensor remains trace-free and annihilates $k_v$.
    Its screen class transports by an isometry of the positive screen metric times an area factor with logarithmic
    derivative of integral $o \( T \)$. Its norm thus has two-sided subexponential size.
    A trace-free symmetric form on this two-dimensional screen has a unit eigenvector with a diagonal value
    comparable to its norm. Represent it by a purely angular $X$.
    Adding a multiple of $L_0$ would not change $p_0 \( X \, X \)$,
    so no observer-dependent screen adjustment is required. Multiplication of every $p_j$ by one constant unit
    complex number makes the diagonal contraction real at $v = T$, proving Equation (4.28).
    Truncation of Equation (4.30) leaves only the last transport and gauge remainders.
    Taking $J$ large relative to $M_1$ and the fixed differentiated output orders proves the interior residual
    claim. Each ordinary differentiation has cost at most one positive power of $lambda_T$;
    the factors $a$ and $sqrt(a)$ already account for the normalized wave and divergence operators.
  We have obtained the interior packet, including its polarization, support, and linear residual bounds.
    It remains to realize its entry jets by an exterior field that returns to the original bridge.
  #emph[Exterior complex phases and amplitudes.] Complex Gaussian beam superposition follows the method developed
    in #cite(label("Ralston1982")) #cite(label("Tanushev2008")) #cite(label("LiuRunborgTanushev2013")).
    We retain the phase-space construction and finite matching below because they must also preserve the tensor
    gauge and give subexponential bounds on the growing time interval.
    Parameterize centers $Y$ by the three coordinates $w = \( x \, theta \)$ of the launch patch.
    Start a complex phase $phi$ with spatial value $v \( 0 \, w \) + i \| w -
    Y \|^2 \/ 2$ and choose its temporal root to agree with $d v$ at the center.
    Proposition  19 supplies the real rays and every subsegment propagator.
    Propagate finite complex phase jets along them. If $P_c \,
    Q_c$ are the position and momentum differentials of this complex gradient graph, symplecticity gives
  #[#set math.equation(numbering: n => "(4.31)")
   $ P_c^(*) Q_c - Q_c^(*) P_c = 2 i "Im" M_c \, wide "Im" \( Q_c P_c^(- 1) \) =
     P_c^(- *) \( "Im" M_c \) P_c^(- 1) > 0 \, $ <bg:complex-symplectic>]
  where $M_c$ is the initial Hessian. The initial positive imaginary part and its inverse are controlled on the
    noncharacteristic collar. The first identity bounds $P_c^(- 1)$ by the bound for $Q_c$,
    and the second bounds the inverse of the propagated imaginary Hessian by the bound for $P_c$ squared,
    times the initial inverse. Thus all these quantities are $e^(o \( T \))$,
    even when the real spatial projection has caustics. Finite Taylor composition and reversion use only smooth
    jets at real points.
  Central amplitudes transport by tensor parallel transport times the inverse square root of the density ratio
    determined by $sqrt(\| det g \|) thin k^(t_e) det P_c$, where $k =
    g^(- 1) d phi$ is evaluated at the beam center. This propagator and its inverse are subexponential on every
    subsegment; higher jets have the same homogeneous propagator and lower-jet sources.
    Impose both wave and gauge transports in a sufficiently high finite Taylor quotient.
    The conjugated Bianchi identity is their defect compatibility identity.
    Contraction $K p = p \( k \, dot.op \)$ has the explicit right inverse
  #[#set math.equation(numbering: n => "(4.32)")
   $ R_k f = l ⊗ f + f ⊗ l - f \( k \) l ⊗ l \, wide l \( k \) = 1 . $ <bg:contraction-inverse>]
  The nonzero pairing remains invertible in formal jets. This fixes the forced gauge jets and leaves the projected
    kernel jets free.
  The complex phases now remain nondegenerate through real caustics,
    and the constrained amplitude transport has identified the free kernel jets.
    We use those jets to match the interior field at entry.
  #emph[Matching the full spacetime jets.] Superpose the beams with center measure $\( lambda \/ 2 pi \)^(3 \/ 2)
    thin d Y$. On the unique entry collar the center projection is a diffeomorphism.
    Changing the center variable to its position and taking Gaussian moments produces $e^(i lambda v) sum_j
    lambda^(- j) frak(p)_j$ in integer inverse powers. At each order the new central value appears with
    coefficient one; the other terms have already been fixed at earlier orders.
    Derivatives of the new value first occur one inverse power later, because odd Gaussian moments vanish.
    For each fixed $T$, an auxiliary limit $lambda arrow.r oo$ in the differentiated linear residual identities
    shows that the coefficients $frak(p)_j$ satisfy exactly the real-phase wave and gauge transports.
    After matching orders below $j$, the remaining launch discrepancy at order $j$ is therefore in $ker K_v$.
    Choose the free central kernel value to cancel it, and extend its jets using $"Id" - R_k K$.
    This keeps the compact launch support. Transport is noncharacteristic at the entry cylinder,
    so the matched values and equations match all required normal jets as well;
    independent value and normal conditions are not being imposed on a single free datum.
  For clarity, a finite normal-jet budget can be chosen explicitly.
    If coefficients through degree $J$ must match to total order $m$ at the last level, assign $m_j = m +
    2 \( J - j \)$ derivatives to coefficient $j$. Differentiating its transverse first-order transport at most
    $m_j - 1$ times requires at most $m_j + 1$ derivatives of the preceding coefficient through the second-order
    wave forcing. These are available since $m_(j - 1) = m_j + 2$.
    Tangential derivatives of the matched values and induction on transverse multiplicity then determine all mixed
    jets. The differentiated gauge forcing is only first order in the preceding coefficient and fits the same
    budget; Bianchi compatibility adds no independent normal datum.
    Increasing the finite $J$ requests further fixed-order coefficient bounds,
    without changing the number of derivatives applied to the physical beam at the already fixed output order.
  #emph[Remainders at the actual frequency.] The matching argument has identified the coefficients and their
    normal jets. Its auxiliary-frequency limit alone does not estimate the error at the experiment’s frequency
    $lambda = lambda_T$. For that estimate we use the following finite bounds.
    At each fixed Taylor and transport degree, all coefficient jets, center-change jets,
    Gaussian Hessians and their inverses, and the pairing in Equation (4.32) cost $e^(o \( T \))$.
    A Taylor error of transverse order $d$ therefore gains $lambda_T^(- d \/ 2)
    e^(o \( T \))$ under Gaussian integration. Choose the finite degrees backwards from the last required
    differentiated residual and matching order. In the collar one may first restrict to transverse distances at
    most $lambda_T^(- 1 \/ 2 + epsilon_2)$, choosing $epsilon_2 > 0$ small for these finite orders;
    the complementary Gaussian tail is negligible. These finite remainder estimates give $A_T lambda_T^(- M_1)
    e^(o \( T \))$ at the actual diagonal frequency.
  Realize the finite jets with smooth cutoffs at tube radius $r_T = e^(- b_p T)$, where $0 < 2 b_p < zeta$.
    On the cutoff annulus, the higher Taylor terms are smaller than half the positive quadratic imaginary part for
    large $T$: their relative bound is $r_T e^(o \( T \)) arrow.r 0$,
    using the inverse-Hessian bound as well as the finite higher-jet bounds. Positivity therefore implies
  #[#set math.equation(numbering: n => "(4.33)")
   $ exp \( - lambda_T "Im" phi \) lt.eq exp [- c exp { \( zeta - 2 b_p \) T - o \( T \) }] . $ <bg:gaussian-tail>]
  Every fixed number of cutoff derivatives costs only $e^(C b_p T)$,
    and every fixed phase derivative costs a fixed power of $lambda_T$ times $e^(o \( T \))$.
    Equation (4.33) dominates all such losses and every prescribed inverse power.
    Uniqueness and separation of the entry crossing exclude additional entry traces.
    Tubes may be stopped after they pass through the strict deeper exit and, on the bridge,
    lie within arbitrarily thin margins of Equation (4.11).
  Finally absolute integration over the fixed three-dimensional center patch costs $lambda_T^(3 \/ 2)$;
    $N_b$ differentiations cost at most $lambda_T^(N_b)$ times subexponential factors.
    Each additional finite formal coefficient has subexponential fixed jets and an assigned nonpositive frequency
    power. Increasing formal accuracy therefore changes constants and the large-$T$ threshold,
    but neither positive power in the proposition. Taking real parts, undoing trace reversal,
    and multiplying by $A_T$ gives $h_T^B$ and all the claimed bounds.
    Every step up to this point is linear and homogeneous in this common factor. ◻
]

#prodef([Remark 4.7.])[
  (Order of choices and nonlinear use).  In the application all output, data, trace, constraint,
    and energy buffer orders are fixed first. One then chooses $zeta >
    0$ small enough for their finitely many positive frequency powers,
    and only then chooses the finite inverse accuracy and formal degrees.
    For example the linear scaled residual can subsequently be made at most $e^(- 4 kappa T)$ by requiring
    $alpha + M_1 zeta > 4 kappa$ and then taking $T$ large. If a nonlinear residual of Equation (4.24) is also
    evaluated on the exterior beam, Taylor’s formula adds a quadratic term bounded at base order $N_b$ by $A_T^2
    lambda_T^(2 N_b + 7) e^(o \( T \))$, allowing two extra derivatives;
    this power again depends only on the fixed base buffer. The analogous interior quadratic power is fixed by its
    base orders. The signed nonlinear estimates are proved in the following sections.
    The finite tidal observation and deep comparison conclusions of #cite(label("Foundation")),
    which use a different amplitude and an additional bounded-curvature hypothesis, are not inputs to Proposition 21.
] <bg:choices>

#thm([Corollary 4.8.])[
  (Linear construction at any exponentially small amplitude).  #emph[Fix any $alpha > 0$ and put $A_T =
    e^(- alpha T)$. With this substitution, all linear conclusions of Proposition 21 hold,
    with the same order of finite output, frequency and inverse-accuracy choices.
    The branch observer needs no bounded-curvature hypothesis.]
] <bg:amplitude-independent>

#proof[
  Every transport, beam superposition, residual and matching operation in the proof of Proposition 21 is linear
    and homogeneous in the final factor $A_T$. Coefficient estimates are independent of that factor.
    Multiplying the resulting unit-amplitude construction by $e^(- alpha T)$ proves the assertion.
    In particular, a requested bound $A_T lambda_T^(- M_1) e^(o \( T \)) lt.eq
    e^(- 4 kappa T)$ follows by choosing the finite accuracy with $alpha +
    M_1 zeta > 4 kappa$ and then taking $T$ large. ◻
]

== 5 Exact signed data and exterior entry <prep:section>

Fix $d in cal(U)$, a branch supplied by Corollary 15, and its preparation in Proposition 21.
  We use the real tensors $h_T^p$ and $h_T^B$ for the deep packet and its exterior beam realization, respectively,
  and write $q_T$ for the normalized component array of $h_T^p$. The scales are

$ A_T = e^(- alpha T) \, wide alpha = 7 kappa \/ 8 \, wide lambda_T = e^(zeta T) . $

The construction in this section takes place in ordinary,
  local wave-map gauge with target the actual background metric $g$.
  All spatial data are eventually put on the complete original bridge.
  Fix an unbounded sequence of admissible late branch levels $T$,
  with the fixed launch and angular-atlas margins used in Proposition 21, and the corresponding packets.
  Limits in this section are taken along this sequence.

Put $cal(S)_T = cal(S) ∩ cal(D)_T$, where $cal(S) = { t = 0 }$ and $cal(D)_T$ is defined in Equation (4.22).
  The constructions first use the fixed slight enlargements specified there,
  so that all entry jets are defined on a spacetime collar of $cal(S)_T$.
  For a spacetime tensor $W$ defined near this interval, let $hat(W)$ denote its components in the background
  normalized frame of Equation (4.15). Define the full entry-jet norm by

#[#set math.equation(numbering: n => "(5.1)")
 $ frak(J)_(r \, T) \( W \) =
   sum_(\| I \| lt.eq r)
   (∥D^I hat(W) \|_(cal(S)_T)∥_(L^oo) + ∥D^I hat(W) \|_(cal(S)_T)∥_(L^2 \( d x thin d "vol"_gamma \))) .
   $ <prep:entry-norm>]

The sum uses a fixed finite angular atlas and includes ordinary spacetime derivatives,
  including derivatives normal to $cal(S)$. It is not a norm of tangential jets alone.
  We also write $frak(J)_(r \, T) \( F \)$ when $F$ is already the normalized array.
  The entry interval has length $O \( T \)$ and uniformly controlled angular volume,
  so its $L^2$ part costs at most a polynomial factor relative to the corresponding uniform jet bound.

#thm([Proposition 5.1.])[
  (Signed preparation and entry).  #emph[Fix a finite data order $m gt.eq 10$, a finite entry order $r$,
    a loss $eta > 0$, and $0 < nu_0 < 1$. After fixing all the finite derivative orders needed below,
    one can choose $zeta > 0$ and then the finite formal accuracy orders in Proposition 21 so that the following
    hold for all sufficiently large parameters $T$ in the packet sequence.]
  #emph[There are smooth positive complete vacuum data $d_T^plus.minus in cal(D)$ on the whole bridge, with
#[#set math.equation(numbering: n => "(5.2)")
 $ p_m \( d_T^plus.minus - d \) arrow.r 0 . $ <prep:data-convergence>]

 In particular $d_T^plus.minus in cal(U)$ for large $T$. They agree exactly with $d$ on the other end,
   the connecting region, and a protected region containing every fixed compact subset for large $T$.
   On the selected asymptotic end the protected ball is
#[#set math.equation(numbering: n => "(5.3)")
 $ B_T = { \| z - z_(*) \| < rho_T } \, wide z_(*) = C_e \( t_T \) \, wide rho_T = \( 1 - 2 beta \) t_T \,
   $ <prep:protected-ball>]

 where $beta > 0$ is fixed sufficiently small. The data have the weight-one metric and weight-two second-form
   symbol bounds at every order. Their full correction tails are retained;
   asymptotic coefficients are allowed to change.]
  #emph[Ordinary exterior vacuum evolutions $g_T^plus.minus$, in exact wave-map gauge with the same target $g$,
    exist on the finite domains needed to reach $cal(S)_T$, with fixed overlap margins and strict future-outflow
    artificial boundaries. Set
$ H_T^plus.minus = accent(g_T^plus.minus - g, ̂) \, wide F_T^plus.minus = H_T^plus.minus minus.plus q_T quad
  upright("on the entry collar") . $

 Then
#[#set math.equation(numbering: n => "(5.4)")
 $ frak(J)_(r \, T) \( F_T^plus.minus \) lt.eq A_T^2 e^(eta T) \, wide
   frak(J)_(r \, T) \( F_T^(+) - F_T^(-) \) lt.eq A_T^3 e^(eta T) . $ <prep:entry-estimates>]

 The exact changes, packet, and errors vanish on the earlier needed entry interval $v < \( 1 - nu_0 \) T$.
   In particular, $r = 61$ is permitted, with an arbitrarily small prescribed loss.
   The scaled linear deep residual can simultaneously be at most $e^(- 4 kappa T)$ through order $60$,
   or at any other finite orders fixed in advance. The same statement holds for the separately prepared exchanged
   branch.]
] <prep:signed-entry>

The proof follows the data from the bridge to the entry cylinder.
  First we correct the two constraint defects with one linear inverse.
  Then we initialize exact wave-map gauge and evolve both corrected data with the same target metric.
  Once the linear residuals are below the cubic scale, the leading discrepancy at each step is quadratic in the
  beam and has the same value for the two signs; subtracting the discrepancies leaves a cubic bound.
  The final exterior energy estimate must preserve both orders,
  so its growth rate is made arbitrarily small by keeping the change away from the bounded-radius region until a
  late time.

The exterior geometry and linear beam estimates are those of Proposition 19 and Proposition 21.
  The underlying source assertions are #cite(label("Foundation")) , , and .
  The signed constraint correction and exterior comparison are proved below,
  with their common linear inverse and common propagation rate made explicit.

=== 5.1 A common support-preserving constraint solve <a-common-support-preserving-constraint-solve>

Localized constraint deformation has a substantial history #cite(label("Corvino2000"))
  #cite(label("CorvinoSchoen2006")) #cite(label("ChruscielDelay2003")) #cite(label("CarlottoSchoen2016")).
  The inverse used here preserves an inner ball and allows a decaying exterior tail,
  so asymptotic coefficients may change. Its construction in the companion uses support-preserving divergence
  primitives of Bogovskii type; their support and derivative gain are treated in
  #cite(label("CostabelMcIntosh2010")). The following signed estimate additionally requires that both corrections
  use the very same linear inverse.

For tensors in Cartesian components on $bb(R)^3$, put

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel f parallel_(H_ell^j) = parallel f parallel_(H^j \( B_2 \)) +
   sup_(R gt.eq 1) R^ell parallel f \( R thin dot.op \) parallel_(H^j \( 1 < \| y' \| < 2 \)) \, wide X^s =
   H_1^(s + 2) xor H_2^(s + 1) \, quad Y^s = H_4^s . $ <prep:weighted-spaces>]

The two components of $X^s$ are symmetric metric and second-form tensors;
  the components of $Y^s$ are a scalar and a covector. Let $Phi$ be the constraint map in Equation (2.2).
  Its Euclidean linearization is

#[#set math.equation(numbering: n => "(5.6)")
 $ P_(upright("flat")) \( q \, p \) = #scale(x: 120%, y: 120%)[\(] partial_i partial_j q_(i j) - Delta q_(i i) \,
   thin partial_j p_(i j) - partial_i p_(j j) #scale(x: 120%, y: 120%)[\)] . $ <prep:flat-linearization>]

We use the following precise property of #cite(label("Foundation")).
  One linear operator $cal(K) : Y^s arrow.r X^s$, bounded for every integer $s gt.eq 3$, satisfies

#[#set math.equation(numbering: n => "(5.7)")
 $ "supp" z subset { \| y' \| gt.eq 1 } quad arrow.r.double quad P_(upright("flat")) cal(K) z = z \, wide
   "supp" cal(K) z subset { \| y' \| gt.eq 1 } . $ <prep:right-inverse>]

It is defined on all of $Y^s$, not just this support subspace.
  Its conjugates under rotations and positive argument dilations are smooth in operator norm $Y^s arrow.r X^s$.
  These properties concern the flat constraints and have no Kerr parameter restriction.
  The construction in that lemma allows a decaying tail and imposes no moment condition on the original source.

Here is the nonlinear and signed consequence in the form we need.

#thm([Lemma 5.2.])[
  (Signed correction with one inverse).  #emph[Let $s gt.eq 3$.
    Let $D_plus.minus = \( delta + a_plus.minus \, b_plus.minus \)$ be smooth positive data on $bb(R)^3$ with
    symbol orders $- 1 \, - 2$ at every order, and suppose
$ parallel D_plus.minus - \( delta \, 0 \) parallel_(X^s) lt.eq epsilon_s . $

 Suppose the smooth compact sources $phi.alt_plus.minus$ are supported in ${ \| y' \| gt.eq
   1 }$ and equal $Phi \( D_plus.minus \)$ there. For sufficiently small $epsilon_s$ and $b_2 :=
   max_plus.minus parallel phi.alt_plus.minus parallel_(Y^s)$ there are corrections $v_plus.minus$ supported in
   ${ \| y' \| gt.eq 1 }$ such that
$ Phi \( D_plus.minus + v_plus.minus \) = 0 quad \( \| y' \| gt.eq 1 \) \, wide
  parallel v_plus.minus parallel_(X^s) lt.eq C_s b_2 . $

 They are obtained with the same $cal(K)$ and satisfy
#[#set math.equation(numbering: n => "(5.8)")
 $ parallel v_(+) - v_(-) parallel_(X^s) lt.eq
   C_s (parallel phi.alt_(+) - phi.alt_(-) parallel_(Y^s) + parallel D_(+) - D_(-) parallel_(X^s) b_2) .
   $ <prep:abstract-odd-correction>]

 Each correction is smooth across the unit sphere and has symbol bounds of orders $- 1 \, -
   2$ at every derivative order. Only the stated base norms have to be small.
   No vacuum equation is required for $D_plus.minus$ in the artificial interior $\| y' \| < 1$.]
] <prep:constraint-pair>

#proof[
  Write
  $ N_D \( v \) = Phi \( D + v \) - Phi \( D \) - P_(upright("flat")) v . $
  The subtraction is essential: $P_(upright("flat"))$ sends a general $X^s$ element to quantities of weight three,
    and we do not assert that the full constraint map has values in $Y^s$ on an arbitrary $X^s$ neighborhood.
    After its flat linear terms cancel, the scalar remainder has the product types
  $ a thin partial^2 a \, quad \( partial a \)^2 \, quad b^2 \, $
  and the momentum remainder has types
  $ a thin partial b \, quad \( partial a \) b \, $
  with smooth bounded inverse-metric coefficients. Here factors may be from the background or the correction,
    and at least one is a correction factor. The weight budgets are $1 + 3 = 4$ and $2 + 2 = 4$.
    Unit-ball and rescaled-annulus Sobolev multiplication, valid for $s gt.eq 3$, therefore gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ parallel N_D \( v \) - N_D \( w \) parallel_(Y^s) & lt.eq
     C_s \( parallel D - \( delta \, 0 \) parallel_(X^s) + b \) parallel v - w parallel_(X^s) \,\
parallel N_(D_(+)) \( v \) - N_(D_(-)) \( v \) parallel_(Y^s) & lt.eq C_s parallel D_(+) -
  D_(-) parallel_(X^s) parallel v parallel_(X^s) \, $ <prep:contraction-estimate>]
  when $parallel v parallel_(X^s) \, parallel w parallel_(X^s) lt.eq b$.
    For the second inequality, integrate the mixed second differential of $Phi$ along the segments in the datum
    and correction variables. The expression vanishes at $v = 0$,
    and the same displayed weight budgets bound this differential.
    Differentiation of the inverse-metric coefficients preserves these estimates on a uniformly positive small ball.
  For both signs solve
  #[#set math.equation(numbering: n => "(5.10)")
   $ z_plus.minus = - phi.alt_plus.minus - N_(D_plus.minus) \( cal(K) z_plus.minus \) \, wide v_plus.minus =
     cal(K) z_plus.minus . $ <prep:shared-fixed-point>]
  On the common ball $parallel z parallel_(Y^s) lt.eq 2 b_2$,
    the first inequality has Lipschitz constant at most $1 \/ 2$ after shrinking the two base sizes.
    The map preserves this ball because $N_D \( 0 \) = 0$. Starting at zero preserves exterior support by
    Equation (5.7) and locality of $N_D$. The limit consequently has that support,
    and $P_(upright("flat")) v_plus.minus = z_plus.minus$ proves the claimed exterior constraint equation.
    Subtract the two fixed-point equations, apply Equation (5.9) at $v_(-)$, and absorb the $1 /
    2 parallel z_(+) - z_(-) parallel_(Y^s)$ term. Boundedness of $cal(K)$ gives Equation (5.8).
  We include the all-order argument from the proof of #cite(label("Foundation")) to specify that it regularizes
    these same fixed points. Let $U_theta.alt \, V_theta.alt$ be the actions on $X^s \,
    Y^s$ of a rotation and a positive argument dilation near the identity;
    rotations also act on tensor components. For either sign put
  $ cal(K)_theta.alt = U_theta.alt cal(K) V_theta.alt^(- 1) \, quad phi.alt_theta.alt = V_theta.alt phi.alt \,
    quad N_theta.alt \( w \) = V_theta.alt N_D \( U_theta.alt^(- 1) w \) . $
  The first family is norm-smooth by the cited inverse lemma.
    The all-order symbol bounds of $D$ and smooth compact support of $phi.alt$ make the other displayed
    expressions smooth in their parameters. In the explicit weighted products for $N_theta.alt$,
    parameter differentiation differentiates background coefficients or the explicit component and scale factors;
    it does not require more unknown derivatives than the two metric and one second-form derivatives allowed by $X^s$.
  On the full space $X^s$ consider
  #[#set math.equation(numbering: n => "(5.11)")
   $ w + cal(K)_theta.alt phi.alt_theta.alt + cal(K)_theta.alt N_theta.alt \( w \) = 0 . $ <prep:regularity-equation>]
  Its derivative in $w$ has the form $"Id" + cal(K)_theta.alt D
    N_theta.alt \( w \)$ and is invertible by a Neumann series on a common small ball.
    The implicit-function theorem gives a smooth local solution.
    The already constructed $U_theta.alt v$ satisfies the same equation algebraically.
    Choose $b_2$ small enough that $v$ lies in a smaller ball;
    uniform boundedness of $U_theta.alt$ places all these transforms in the common uniqueness ball.
    Thus uniqueness identifies their orbit with the smooth implicit-function branch.
    This argument does not assume norm continuity of the unknown orbit.
    It uses the all-input definition of $cal(K)$, because dilation moves the support boundary.
  Distributional differentiation of the orbit now gives every iterate of rotations $Omega_(i j) = y'_i partial_j -
    y'_j partial_i$ and the dilation $E = y' dot.op partial$ in $X^s$.
    Constant component rotations contribute only removable zeroth-order matrices. Since
  $ \| y' \|^2 partial_i = y'_i E + sum_j y'_j Omega_(j i) \, $
  these derivatives span the scaled coordinate derivatives on every exterior annulus and on a neighborhood of $\|
    y' \| = 1$. Scaled Sobolev embedding proves smoothness there and all differentiated symbol bounds.
    Inside the sphere the correction is zero. Hence it is smooth across the sphere as well.
    Higher bounds may depend on the finite experiment; their smallness has never been required.
    Finally, the small base norm preserves positive definiteness. ◻
]

=== 5.2 From beam seeds to whole-bridge data <from-beam-seeds-to-whole-bridge-data>

Use the regular exterior coordinates of Proposition 19, with $z = y + C_e \( t_e \)$, $I \( t_T \) = T$,
  and $0 < c_I lt.eq I' lt.eq C_I$. Thus $t_T asymp T$. The background drift $s_(*) := sup \| C'_e \|$ is small;
  choose the fixed localization parameter $beta$ so that $1 - 2 beta - s_(*) > 0$.
  The beam return-shell estimate, with a slightly smaller tolerance if needed,
  places the induced beam seed strictly outside the ball in Equation (5.3). All beam tubes have this margin.
  At $t_e = 0$ this far portion of the partial exterior slice is the original bridge.

For $- 1 lt.eq tau lt.eq 1$, induce metric and second form from $g + tau h_T^B$.
  Away from the beam support retain $d$. On the selected far end introduce

#[#set math.equation(numbering: n => "(5.12)")
 $ y' = \( z - z_(*) \) \/ rho_T \, wide tilde(h) \( y' \) = h \( z_(*) + rho_T y' \) \, wide tilde(K) \( y' \) =
   rho_T K \( z_(*) + rho_T y' \) . $ <prep:rescaling>]

These are rescaled component functions, with the second expression for the second form including the displayed
  factor. Directly in the constraint formulas, both components of $Phi$ acquire the factor $rho_T^2$.
  Choose fixed radii $s_(*) \/ \( 1 - 2 beta \) < r_0 < r_1 < 1$.
  Since $\| z_(*) \| lt.eq s_(*) t_T + O \( 1 \)$, the triangle inequality gives $\| z \| asymp rho_T \|
  y' \|$ for $\| y' \| gt.eq r_0$; a bounded initial offset of $C_e$ is harmless for large $T$.
  The symbol assumptions on $d$ give, at every fixed order $j$,

$ \| partial_(y')^j \( tilde(h) - delta \) \| lt.eq C_j rho_T^(- 1) \| y' \|^(- 1 - j) \,
  wide \| partial_(y')^j tilde(K) \| lt.eq C_j rho_T^(- 1) \| y' \|^(- 2 - j) . $

Cut these background deviations off to zero between radii $r_0$ and $r_1$.
  Leave them unchanged for $\| y' \| gt.eq r_1$, and add the scaled beam seed,
  whose support is a fixed annulus strictly outside the unit sphere.
  Denote the resulting artificial data by $D \( tau \)$ and set $D_plus.minus = D \( plus.minus 1 \)$.

The artificial data need not be vacuum inside the unit ball. Outside it, $D \( 0 \)$ is the original vacuum datum.
  Consequently the exterior constraint defect of $D \( tau \)$, extended by zero to the inside,
  is smooth and compactly supported: the beam vanishes on an open collar of the sphere and outside its far shell.
  Let $phi.alt_plus.minus$ be these extended defects.

Fix a small preliminary loss $epsilon.alt > 0$ and a base solve order $s$ large enough for the later finite
  requirements. The linear beam estimates and finite-jet induction of hypersurface data imply

#[#set math.equation(numbering: n => "(5.13)")
 $ parallel D_plus.minus - \( delta \, 0 \) parallel_(X^s) & lt.eq C_s rho_T^(- 1) + A_T e^(epsilon.alt T) \,\
parallel D_(+) - D_(-) parallel_(X^s) & lt.eq A_T e^(epsilon.alt T) \,\
parallel phi.alt_plus.minus parallel_(Y^s) & lt.eq A_T^2 e^(epsilon.alt T) \, wide parallel phi.alt_(+) -
  phi.alt_(-) parallel_(Y^s) lt.eq A_T^3 e^(epsilon.alt T) . $ <prep:seed-and-defects>]

Here and below constants are absorbed by taking $T$ larger.
  We justify the defect estimates, including their derivative requirement.
  For a metric on a spacelike hypersurface, Gauss–Codazzi expresses the scalar and momentum constraints as the
  normal components of its Einstein tensor. Linearizing at the vacuum background,
  the linear coefficient of the defect is therefore a linear combination of the linear reduced-wave residual and
  one derivative of the linear wave-gauge defect, with smooth background coefficients.
  An $s$-jet constraint bound thus requires gauge-defect jets through $s + 1$,
  in addition to the corresponding reduced-equation jets. This extra derivative is included before $zeta$ is chosen.

More explicitly, Taylor expansion of this smooth finite-jet map on the seed annulus gives

$ phi.alt \( tau \) = tau ell_T + tau^2 Q_T + tau^3 R_T \( tau \) \, $

where the linear term satisfies $parallel ell_T parallel_(Y^s) lt.eq A_T lambda_T^(- M_1) e^(o \( T \))$,
  including polynomial rescaling factors, and

$ parallel Q_T parallel_(Y^s) lt.eq A_T^2 lambda_T^(P_s) e^(o \( T \)) \, wide
  sup_(\| tau \| lt.eq 1) parallel R_T \( tau \) parallel_(Y^s) lt.eq A_T^3 lambda_T^(P'_s) e^(o \( T \)) . $

The finite positive powers depend only on base jet orders. The quadratic term is identical at the two signs.
  Taking $zeta$ small for these powers and subsequently $M_1$ large enough to make the linear term smaller than
  the cubic scale proves Equation (5.13). This also accounts for the nonlinear dependence of the second form on
  the induced lapse and normal; it is not an assumption that the induced data depend linearly on the sign.

Lemma 25 applies for large $T$. Using its same $cal(K)$ for both signs yields

#[#set math.equation(numbering: n => "(5.14)")
 $ parallel v_plus.minus parallel_(X^s) lt.eq C_s A_T^2 e^(epsilon.alt T) \, wide parallel v_(+) -
   v_(-) parallel_(X^s) lt.eq C_s A_T^3 e^(2 epsilon.alt T) . $ <prep:correction-sizes>]

Undo Equation (5.12) outside the ball, retain the actual datum $d$ inside, and keep $d$ on the rest of the bridge.
  Smoothness and vanishing of $v_plus.minus$ on the inner side make this a smooth gluing.
  The resulting $d_T^plus.minus$ satisfy the constraints everywhere.
  The physical interior is the original vacuum datum; the artificial nonvacuum interior used by the solver has
  been discarded and is never evolved.

For $s gt.eq m + 3$, scaled Sobolev embedding bounds all required weighted pointwise derivatives.
  The cost of unscaling either correction component is at most $C_m rho_T$:
  for the metric the factors are $rho_T^(1 + i) rho_T^(- i)$,
  and for the second form they are $rho_T^(2 + i) rho_T^(- 1 - i)$.
  Translation has bounded comparison constants on the exterior region. Thus

#[#set math.equation(numbering: n => "(5.15)")
 $ p_m \( d_T^plus.minus - d \) lt.eq
   "poly" \( T \) (A_T lambda_T^(m + 5 \/ 2) e^(o \( T \)) + A_T^2 e^(epsilon.alt T)) . $ <prep:physical-data-bound>]

The extra seed derivative is the derivative entering the second form. Taking $zeta$ small makes this tend to zero.
  In particular the metrics remain uniformly comparable to the complete original metric,
  proving positivity and completeness. The all-order symbol bounds supplied by Lemma 25 give membership in
  $cal(D)$. Finally

$ B #scale(x: 120%, y: 120%)[\(] 0 \, \( 1 - 2 beta - s_(*) \) t_T -
  O \( 1 \) #scale(x: 120%, y: 120%)[\)] subset B_T \; $

the protected physical region contains all fixed compact shadows used in the finite bridge construction.
  No outer cutoff is applied to the correction; its allowed tail is part of $d_T^plus.minus$.

=== 5.3 Exact finite gauge jets <exact-finite-gauge-jets>

Initialize the ordinary reduced equations on the partial exterior slice $t_e = 0$ using these physical data.
  Its bounded bent portion is in the development of unchanged data.
  Prescribe the lapse and shift to equal those of $g plus.minus
  h_T^B$ and use the corrected induced metric and second form.
  This fixes the full metric values and all first spatial derivatives.
  The formula for the second form fixes the first temporal derivatives of the spatial metric entries.
  The remaining first temporal derivatives are determined by

#[#set math.equation(numbering: n => "(5.16)")
 $ Upsilon_mu \( tilde(g) \) = - tilde(g)_(mu lambda) tilde(g)^(alpha beta) #scale(x: 120%, y: 120%)[\(]
   Gamma \( tilde(g) \)_(alpha beta)^lambda - Gamma \( g \)_(alpha beta)^lambda #scale(x: 120%, y: 120%)[\)] =
   0 . $ <prep:wave-gauge>]

For clarity, in coordinates with initial surface $t_e = 0$, put $x_nu = partial_(t_e) tilde(g)_(0 nu)$.
  After the spatial temporal derivatives have been fixed, the lowered contracted Christoffel expression is

$ tilde(g)^(alpha beta) (partial_alpha tilde(g)_(beta nu) - 1 / 2 partial_nu tilde(g)_(alpha beta)) . $

Its coefficient on $x_0$ in the $nu = 0$ equation is $tilde(g)^00 \/ 2$; the $x_i$ contributions there cancel.
  The $nu = i$ equations have coefficient $tilde(g)^00$ on $x_i$.
  Since the temporal slices are uniformly spacelike, $tilde(g)^00$ is uniformly separated from zero.
  This proves the required smooth, uniformly invertible algebraic gauge solve.

Every higher initial temporal jet is recovered from the reduced equation by solving for $partial_(t_e)^2
  tilde(g)_(mu nu)$, whose coefficient is again the nonzero $tilde(g)^00$, and then differentiating.
  Consequently, for each fixed finite order, the complete initial spacetime jet is a smooth finite-jet function of
  the corrected data and the prescribed lapse and shift. Its Taylor coefficients have the fixed-order bounds of
  the exterior background. Comparing it to the jets of $g + tau h_T^B$,
  the linear discrepancy is controlled by the linear gauge defect and reduced residual and their finitely many
  derivatives. The quadratic discrepancy is even in $tau$. A correction contributes linearly with a coefficient
  smooth in $tau h_T^B$; the change of this coefficient between signs costs another $A_T e^(epsilon.alt T)$.
  Using Equation (5.14), the product of that coefficient change and a quadratic correction is cubic.
  Higher Taylor terms have at least this order. Thus, writing the exterior tensor errors as

$ frak(f)_T^plus.minus = g_T^plus.minus - g minus.plus h_T^B \, $

their initial full finite jets obey

#[#set math.equation(numbering: n => "(5.17)")
 $ parallel frak(f)_T^plus.minus parallel_(upright("init")) lt.eq A_T^2 e^(c epsilon.alt T) \, wide
   parallel frak(f)_T^(+) - frak(f)_T^(-) parallel_(upright("init")) lt.eq
   A_T^3 e^(c epsilon.alt T) . $ <prep:initial-gauge-errors>]

The norms here can be any of the fixed ordinary jet or local slice Sobolev norms on the finite computing domain;
  its polynomial volume cost is included. This argument applies to the recursively recovered normal jets as well
  as the first jet. On the protected side the data, lapse, shift,
  and all gauge Cauchy jets agree exactly with the background.

The solutions so initialized are vacuum wherever they exist.
  For the reduction $"Ric" \( tilde(g) \) + nabla_(\( mu)^(tilde(g)) Upsilon_(nu \)) = 0$,
  contracted Bianchi gives a homogeneous linear wave equation for $Upsilon$.
  Its initial value is zero by Equation (5.16). The normal Einstein constraints of the exact physical data then
  give its zero normal derivative (the tangential derivatives of its zero initial value already vanish).
  Wave uniqueness propagates $Upsilon = 0$, hence $"Ric" \( tilde(g) \) = 0$.
  This uses the physical exterior and the unchanged physical inner data only.

=== 5.4 Late support and the ordinary exterior rate <prep:exterior-rate-section>

Work up to $t_e = t_T + C_2$ on the regular domain of #cite(label("Foundation")),
  with its deeper inner future exit and the outer cutoff

#[#set math.equation(numbering: n => "(5.18)")
 $ \| y \| < R_(upright("out")) \( t_e \) \, wide R_(upright("out")) \( t_e \) = C_(upright("out")) \( 1 + T \) +
   V_(upright("out")) \( t_T + C_2 - t_e \) . $ <prep:outer-cut>]

The constants include the required spatial and time collars,
  and $V_(upright("out"))$ exceeds the uniform radial causal-speed bound.
  Thus the outer face has strict future-outflow sign. The domain is only a computing restriction;
  the initial datum outside it is the same full $d_T^plus.minus$, including its tail.

We first quantify support. Suppose a causal path from the changed initial support first reaches fixed large
  co-radius $R$ at time $tau lt.eq t_T$. Before that hit, its lab speed is at most $1 + delta_R$,
  where $delta_R arrow.r 0$ as $R arrow.r oo$, also in a small comparison bootstrap.
  Its initial point is outside $B_T$; its hit point has the form $C_e \( tau \) + O \( R \)$.
  The triangle inequality and the drift bound give

#[#set math.equation(numbering: n => "(5.19)")
 $ \( 1 - 2 beta \) t_T & lt.eq \( 1 + delta_R \) tau + s_(*) \( t_T - tau \) + O \( R \) \,\
t_T - tau & lt.eq frac(2 beta + delta_R, 1 + delta_R - s_(*)) thin t_T + O_R \( 1 \) . $ <prep:first-hit>]

For any prescribed $theta > 0$, first take $R$ large and then $beta$ small so that the last bound is at most
  $theta T + O_R \( 1 \)$. Only the inner exclusion radius occurs;
  no bound on the outer support radius of the correction is used.
  The beam and its residuals have the same late compact-radius support by the return ray bounds and tube margins
  in Proposition 21.

These estimates also give exact early entry agreement. At the selected end, $I' lt.eq C_I$ implies that

$ v < \( 1 - nu_0 \) T quad arrow.r.double quad t_e lt.eq t_T - \( nu_0 \/ C_I \) T + O \( 1 \) . $

Take $theta < nu_0 \/ \( 2 C_I \)$ and then $T$ large. Finite propagation and local reduced uniqueness from the
  exactly equal initial gauge jets show that the exact change vanishes on this entry interval.
  The entry is at bounded co-radius. The bounded middle and unselected pieces of its required interval lie in the
  unchanged finite dependence region. The deeper inner face is future outflow,
  so it supplies no incoming path through the other end. This proves early agreement on the whole required entry
  interval.

For the size estimate, use lab components and write the ordinary reduced equation for a change $H$ as

#[#set math.equation(numbering: n => "(5.20)")
 $ cal(R)_e \( H \)_n = \( cal(L)_e H \)_n + B^(mu nu) \( H \) partial_mu partial_nu H_n +
   cal(Q)_n \( H \, partial H \) \, wide B \( H \) = \( g + H \)^(- 1) - g^(- 1) . $ <prep:exterior-equation>]

A fixed background trace reversal can equivalently be included in $cal(L)_e$.
  The smooth nonlinear terms start at degree two, with total field derivative order at most two.
  Indeed the connection difference is a contraction of $\( g + H \)^(- 1) nabla^g H$;
  the reduction leaves inverse-metric second derivatives, first-derivative products,
  and algebraic background curvature terms. All required background coefficient jets cost $e^(o \( T \))$ on the
  regular domain. At fixed orders the pure beam source therefore obeys

#[#set math.equation(numbering: n => "(5.21)")
 $ parallel cal(R)_e \( plus.minus h_T^B \) parallel_(H_(upright("mix"))^j) lt.eq
   e^(o \( T \)) (A_T lambda_T^(- M_1) + A_T^2 lambda_T^(P_j)) \, $ <prep:beam-nonlinear-residual>]

including polynomial volume factors. The positive $P_j$ are fixed by the comparison orders,
  not the later formal accuracy.

Choose a high finite exterior energy order $k_e$. Commute by mixed lab derivatives and let
  $E_j^plus.minus \( t_e \)$, $0 lt.eq j lt.eq k_e$, be the square root of the sum of ordinary scalar-stress
  fluxes of the order-$j$ components of $frak(f)_T^plus.minus$ in the actual metric $g_T^plus.minus$.
  Use the future slice normal as multiplier and a fixed small positive mass $mu$ in the energy.
  Uniform regular geometry makes these fluxes equivalent to

$ sum_(\| I \| = j) integral
  (\| partial_(t_e) partial^I frak(f)_T^plus.minus \|^2 + \| nabla_z partial^I frak(f)_T^plus.minus \|^2 + mu^2 \|
  partial^I frak(f)_T^plus.minus \|^2) d z . $

Bootstrap all these square-root energies by $e^(- alpha T)$.
  The beam base jets are exponentially small for sufficiently small $zeta$.
  Sobolev embedding then preserves temporal nondegeneracy and both outflow margins.
  The slices admit uniformly bounded local Sobolev extension and chart constants;
  the large outer radius causes at most polynomial volume factors.

The exact perturbed principal operator is retained after every commutation.
  Every remaining nonlinear error term has another packet or error factor,
  total field derivative order at most $j + 2$, and at most $j + 1$ derivatives on an error factor.
  Put the highest error derivative in $L^2$. Other error derivatives have order at most $\( j + 2 \) \/
  2$ and are controlled in supremum by the higher fixed bootstrap energies.
  Taking $k_e gt.eq 16$ suffices for these product placements at its top order.
  A packet factor has the fixed base bounds of Proposition 21.
  Thus these terms contribute exponentially small coefficients times the through-$j$ error energies.
  There is no optical lapse loss in this regular exterior calculation.

For the linear terms, the stress deformation and highest principal commutators use first lab metric derivatives;
  first- and zeroth-order tensor-wave terms use at most second derivatives.
  These are bounded globally and tend uniformly to zero at large co-radius by Proposition 19.
  Choose $mu$ small first, then $R$ large: the same-level square-root rate is as small as prescribed outside
  radius $R$. Inside it, that rate is bounded by a constant $C_(k_e \, mu)$ independent of the chosen $R$.
  Further coefficient hits multiply strictly lower error levels, with coefficients $e^(o \( T \))$.
  All artificial boundary fluxes have the favorable sign.

Equation (5.19) shows that the support sees the possibly large rate only for $theta T + O_R \( 1 \)$ time.
  There is therefore a nonnegative common majorant $r_e$ for both signs and for the background linear problem such
  that, for every desired $epsilon.alt_e > 0$, the choices can give

#[#set math.equation(numbering: n => "(5.22)")
 $ \( E_j^plus.minus \)' & lt.eq r_e E_j^plus.minus + b_T \( t_e \) sum_(ell < j) E_ell^plus.minus + S_j \,\
cal(R)_e^(upright("int")) \( t \) & := integral_0^t r_e \( s \) thin d s \, wide
  cal(R)_e^(upright("int")) \( t_T + C_2 \) lt.eq epsilon.alt_e T \, wide
  integral_0^(t_T + C_2) b_T \( s \) thin d s = e^(o \( T \)) . $ <prep:exterior-rate>]

Here $S_j$ is bounded by Equation (5.21). Indeed the integral of the same-level rate is bounded by the small far
  rate times $O \( T \)$ plus $C_(k_e \, mu) \( theta T + O_R \( 1 \) \)$ and an exponentially small bootstrap
  contribution. Choosing these quantities in this order proves the second line.
  Enlarging $R$ does not enlarge the compact rate constant.

To see explicitly the effect of higher coefficients, conjugate the finite energy vector by
  $e^(- cal(R)_e^(upright("int")) \( t \))$. Its homogeneous couplings are strictly lower triangular.
  The time-ordered expansion terminates after $k_e$ strict drops;
  on every subinterval $\[ s \, t \]$ its norm is bounded by

$ C_(k_e) sum_(j = 0)^(k_e) (1 + integral_s^t b_T \( tau \) thin d tau)^j = e^(o \( T \)) . $

Thus the original propagator costs at most
  $e^(cal(R)_e^(upright("int")) \( t \) - cal(R)_e^(upright("int")) \( s \) + o \( T \))$.
  Equation (5.17) and Duhamel’s formula give, with an arbitrarily small final loss $epsilon.alt_i > 0$,

#[#set math.equation(numbering: n => "(5.23)")
 $ max_(j lt.eq k_e) E_j^plus.minus \( t_e \) lt.eq A_T^2 e^(epsilon.alt_i T)
   wide \( 0 lt.eq t_e lt.eq t_T + C_2 \) . $ <prep:individual-exterior>]

This improves the bootstrap if $epsilon.alt_i < alpha$. Ordinary reduced-wave continuation therefore covers the
  finite domain. For each fixed $T$ its coefficients are nondegenerate; inside the strict margins,
  one restarts the local Cauchy problem and restricts by dependence.
  The high base energy bounds prevent finite-time breakdown.
  Higher smooth norms propagate separately by the differentiated linear estimates and require no simultaneous
  smallness. Exact gauge propagation, proved above, makes these finite evolutions vacuum.

=== 5.5 The odd exterior estimate and the order of choices <the-odd-exterior-estimate-and-the-order-of-choices>

Subtract the two error equations, with the same background $cal(L)_e$ on the left.
  The quadratic part of the nonlinear expression in Equation (5.20), evaluated at $h_T^B$ and $- h_T^B$,
  cancels exactly. The remaining pure-beam terms are cubic.
  Every other nonlinear term contains an error and at least one packet or further error factor.
  At an order $j$ at least a two-derivative and Sobolev buffer below $k_e$, Equation (5.23) consequently gives

#[#set math.equation(numbering: n => "(5.24)")
 $ parallel cal(L)_e \( frak(f)_T^(+) - frak(f)_T^(-) \) parallel_(H_(upright("mix"))^j) lt.eq
   e^(c epsilon.alt_i T + o \( T \)) \( A_T^3 + A_T^4 \) + A_T lambda_T^(- M_1) e^(o \( T \)) .
   $ <prep:odd-exterior-source>]

In particular, terms such as a metric error times a second error derivative use the two extra known individual
  derivatives. No new quasilinear closure is needed for this lower-order equation.
  Its support is inherited from the two actual solutions and the beams, so the same late-support rate applies.
  The initial odd jets are cubic by Equation (5.17). Applying the background version of Equation (5.22) therefore
  proves a cubic odd bound, with any prescribed small loss, in all the required lower energy orders.

Transform the resulting full jets to the fixed background optical coordinates on the entry collar and take their
  restriction to $cal(S)_T$. The transition and normalized frame jets have subexponential fixed-order bounds.
  Slice Sobolev embedding with two spare spatial derivatives gives the required uniform jets;
  the spacetime collar supplies the normal jets. The polynomial entry volume is absorbed as well.
  The full finite-jet matching of $h_T^B$ to $h_T^p$ in Proposition 21 adds only the linear inverse-accuracy
  error. This proves Equation (5.4). The gauge condition is tensorial with its fixed target $g$ and remains exact
  after this coordinate change. Exact early agreement was proved before the energy estimate.
  These are the actual entry jets used in the interior Cauchy problem.

We finish by making the finite choices unambiguous. Given $m \, r$, one may take

$ k_e gt.eq max { 16 \, r + 10 } \, wide s gt.eq max { m + 3 \, k_e + 8 } \, $

and then fix a single still larger finite beam base order covering the hypersurface map, the constraint solve,
  the normal-jet recursion, products, and traces. Request the linear gauge-defect bound with one derivative more
  than each constraint-defect order; all these are finite requirements fixed at this stage.
  If another later finite residual order, such as the interior order $60$, is needed, include it now.
  Fix the small preliminary losses so that their finite sum, including those in the odd comparison,
  is below $eta$. Choose the mass, far-rate tolerance, radius threshold,
  and shell tolerance so that both the exterior rate bound and the given $nu_0$ are respected.

Only now choose $zeta > 0$ sufficiently small for every positive frequency power at these base orders and for
  $\( m + 5 \/ 2 \) zeta < alpha$. Next choose $M_1$ and the finite hierarchy, beam,
  and matching degrees large enough that the linear residuals are below the cubic scale at all these orders.
  For example, $M_1 zeta > 4 kappa$ makes $A_T lambda_T^(- M_1) e^(o \( T \)) lt.eq
  e^(- 4 kappa T)$ for large $T$. The linear construction permits this increase without increasing the already
  fixed positive base powers. Finally take $T$ large so that the remaining fixed-order $e^(o \( T \))$ factors fit
  the reserved losses and all contractions and bootstraps apply. This proves Proposition 24.
  The all-order smoothness of each resulting datum is separate from these finite smallness choices;
  no one value of $zeta$ is required to give convergence at every derivative order simultaneously.

#thm([Corollary 5.3.])[
  (Signed exterior preparation at a general amplitude).  #emph[Fix any $alpha > 0$.
    Replace the amplitude in this section by $A_T = e^(- alpha T)$ and use Corollary 23.
    For every fixed data order $m$, entry order $r$, loss $eta > 0$ and late-support fraction $0 < nu_0 < 1$,
    the conclusions of Proposition 24 hold after choosing the frequency exponent sufficiently small and the
    inverse accuracy sufficiently large. This assertion ends at the entry cylinder.]
] <prep:amplitude-independent-exterior>

#proof[
  The rescaled constraint solve and its odd difference estimates use only $A_T lambda_T^P arrow.r
    0$ at finitely many fixed positive powers. Choose the internal losses smaller than both the prescribed $eta$
    and a sufficiently small fixed fraction of $alpha$. The exterior bootstrap then improves because $A_T^2
    e^(eta_(upright("int")) T) = o \( A_T \)$. Its common integrated rate in Equation (5.22) can be made
    arbitrarily small independently of $alpha$, by the same far-radius and first-arrival choices.
    The finite triangular propagator preserves that rate and the odd cubic gain.
    Choose $zeta$ so that every fixed positive frequency loss $P
    zeta$ fits its allocated part of the internal loss budget and is smaller than $alpha$.
    After fixing a positive margin $delta$ within that budget, choose the finite inverse accuracy $M_1$ so that
  $ alpha + M_1 zeta > max { 3 alpha \, 4 kappa } + delta . $
  Then $A_T lambda_T^(- M_1) e^(o \( T \))$ is smaller than both the cubic amplitude scale and $e^(- 4 kappa T)$.
    These choices complete the proof, with all-order smoothness obtained from the same single base-order
    constraint solve. No interior comparison estimate is used in this corollary. ◻
]

== 6 Signed nonlinear propagation through the interior <energy:section>

We propagate the signed entry data of Proposition 24 with the amplitude required for the holonomy experiment.
  The individual errors need not remain smaller than the linear packet.
  The useful cancellation occurs in the difference of those errors.
  This distinction requires both a sufficiently sharp energy rate and its preservation on every intermediate time
  interval.

Fix the background, branch, and prepared optical coordinates of Section 4. Write

$ W_t = L_0 + L_1 = partial_t + b^A partial_A \, wide W_x = L_1 - L_0 = partial_x - b^A partial_A \, wide Z_A =
  sqrt(a) thin partial_A . $

The normalized slots are $hat(e)_i = a^(- 1 \/ 2) L_i$ and $hat(e)_A = partial_A$ in the fixed angular atlas.
  A tensor and its array of components in these slots will be distinguished when necessary;
  all norms below apply to these component functions. The notation $D$ always denotes ordinary derivatives in the
  fixed optical and angular coordinates. Thus the commutation order does not add tensor slots or change their null
  weights. On a time slice, $C_(upright("mix"))^r$ and $H_(upright("mix"))^r$ include all mixed spacetime
  derivatives through order $r$, with the latter taken in $L^2 \( d x thin d "vol"_gamma \)$.

Use the fixed margins $u_2 > u_(*)$, $c_2 > 0$, and sufficiently small $c_0 > 0$ of Equation (4.22).
  The retained evolution has strict time and side inequalities, while its entry face is included: put

#[#set math.equation(numbering: n => "(6.1)")
 $ L = L_T & = frac(T + u_(*), 2) + c_0 \,\
Omega_T & = {0 lt.eq t < L \, quad u + frac(c_0 t, T) < u_2 \, quad v + frac(c_0 t, T) < T + c_2} . $ <energy:domain>]

The slice intervals in $x$ have a positive lower length bound,
  and $p_T$ lies within fixed smaller margins for large $T$.
  Initial construction on a slightly enlarged domain is understood. Set

$ A = A_T = e^(- alpha T) \, wide alpha = frac(7 kappa, 8) \, wide lambda = lambda_T = e^(zeta T) . $

The relative array of the linear packet is denoted by $q_T$.

#thm([Proposition 6.1.])[
  (Signed interior experiment).  #emph[Fix $0 < delta < kappa \/ 32$ and the prescribed finite data seminorm.
    Use Proposition 21 and Proposition 24 with sufficiently high fixed orders,
    sufficiently small losses and late support parameter, and sufficiently accurate linear residuals.
    For sufficiently small fixed $zeta > 0$ and sufficiently large $T$,
    the two entry data have smooth vacuum evolutions $g_T^plus.minus$ on the strict domain (6.1),
    in wave-map gauge with target $g$. Let $H_T^plus.minus$ be the relative arrays of $g_T^plus.minus - g$, and put
$ F_T^plus.minus = H_T^plus.minus minus.plus q_T \, wide F_T^(upright("odd")) = F_T^(+) - F_T^(-) . $

 Then
#[#set math.equation(numbering: n => "(6.2)")
 $ lr(bar.v.double F_T^plus.minus bar.v.double)_(C_(upright("mix"))^30 \( Omega_T \)) & lt.eq
   e^(\( kappa - 2 alpha + delta \) T) \,\
lr(bar.v.double F_T^(upright("odd")) bar.v.double)_(C_(upright("mix"))^2 \( Omega_T \)) & lt.eq
  e^(\( kappa - 3 alpha + delta \) T) + e^(\( 2 kappa - 4 alpha + delta \) T) . $ <energy:conclusion>]

 The exact changes and all three error fields have support in $v gt.eq \( 1 - nu_0 \) T - o \( 1 \)$.
   The time slices remain spacelike and the two moving side faces remain strict future exits.
   Moreover, for some $c > 0$,
#[#set math.equation(numbering: n => "(6.3)")
 $ lr(bar.v.double H_T^plus.minus bar.v.double)_(C_(upright("mix"))^30) lt.eq e^(- \( kappa \/ 2 + c \) T) \, wide
   e^(o \( T \))
   (lr(bar.v.double F_T^(upright("odd")) bar.v.double)_(C_(upright("mix"))^2) + sum_plus.minus lr(bar.v.double
   H_T^plus.minus bar.v.double)_(C_(upright("mix"))^2)^2) = o \( A_T \) . $ <energy:small-relative>]

 Here every subexponential factor is at a fixed finite order.
   No higher seminorm of the fixed smooth background is required to be small.]
] <energy:signed-experiment>

The coefficient input is precisely Lemma 20, obtained from the uniform low estimates, pure longitudinal jets,
  and expanding region estimates in #cite(label("Foundation")) , , , , . We prove the nonlinear transfer below.

The first estimate in Equation (6.3) will let us choose a nearby observing geodesic and control its boosted frame.
  The second will separate the two curvature observations: the odd error and the quadratic metric error are both
  smaller than the packet amplitude. An individual error need not have that property.

Here is the quantitative reason for the proof’s organization.
  We will construct a nonnegative energy rate $r_T$, common to both signs and the background linear equation, with

$ cal(R)_T \( t \) = integral_0^t r_T \( s \) thin d s \, wide cal(R)_T \( L \) lt.eq \( kappa + eta \) T \, $

where $eta > 0$ is arbitrarily small. The individual error starts at quadratic size and grows by
  $e^(cal(R)_T \( t \))$, up to allocated small losses. Subtracting the signed equations cancels the pure-packet
  quadratic term. Besides the pure cubic packet term, the remaining products contain a packet and an error,
  or two errors. Since $cal(R)_T gt.eq 0$, their combined bound has sizes $A^3 e^(cal(R)_T \( t \))$ and $A^4
  e^(2 cal(R)_T \( t \))$. The propagator from an intermediate time $s$ to $t$ must retain
  $e^(cal(R)_T \( t \) - cal(R)_T \( s \))$; this preserves those one and two growth factors after integration.
  A terminal bound applied anew to every source would lose the gain.

We first isolate the constant tensor-slot weights in the reduced operator.
  They yield the limiting square-root energy rate $2 kappa$ over an interval of length $T \/ 2 + O \( 1 \)$,
  independently of the ordinary commutation order. Lower-order couplings then contribute only a subexponential
  factor. After closing the individual evolution, we estimate the odd forcing with the zeroth-order terms of
  higher commuted energies. These control its ordinary derivatives without another division by $sqrt(a)$.

=== 6.1 Relative arrays and the exact principal operator <relative-arrays-and-the-exact-principal-operator>

Let $H$ be a small symmetric array, and let $h \[ H \]$ be the covariant tensor with that array in the normalized
  slots. Define $g_H = g + h \[ H \]$, and write

$ G_(a b) = g \( hat(e)_a \, hat(e)_b \) = mat(delim: "(", 0, - 1, 0; - 1, 0, 0; 0, 0, gamma_(A B)) \, wide
  Q \( H \) = G + H . $

Both $G$ and its inverse are bounded. Set $Z_a = sqrt(a) thin hat(e)_a = J_a zws^mu partial_mu$; explicitly,

$ J_0 zws^mu partial_mu = L_0 \, wide J_1 zws^mu partial_mu = L_1 \, wide J_A zws^mu partial_mu =
  sqrt(a) thin partial_A . $

The exact identity

#[#set math.equation(numbering: n => "(6.4)")
 $ a g_H^(mu nu) = Q \( H \)^(a b) J_a zws^mu J_b zws^nu $ <energy:inverse-relative>]

shows which coefficients may be differentiated without creating an inverse lapse.
  For example, a coefficient of two angular derivatives contains $a$,
  and a mixed radial–angular coefficient in this frame contains $sqrt(a)$.
  Coordinate shift contributions are contained in the bounded $J_0$.
  Smooth inversion of $Q \( H \)$ introduces no negative power of $a$.

For clarity, this assertion concerns the local hyperbolic reduction.
  With $nabla = nabla^g$, the connection difference is exactly

#[#set math.equation(numbering: n => "(6.5)")
 $ C^lambda zws_(mu nu) = 1 /
   2
   g_H^(lambda rho) \( nabla_mu h \[ H \]_(nu rho) + nabla_nu h \[ H \]_(mu rho) - nabla_rho h \[ H \]_(mu
   nu) \) . $ <energy:connection-difference>]

If $V_a$ is the background connection matrix along $Z_a$,
  then the normalized array of $sqrt(a) thin nabla_(hat(e)_a) h \[ H \]$ is

$ cal(D)_a H = Z_a H - V_a^(sans(T)) H - H V_a . $

Thus the normalized connection difference along $Z_a$ is a smooth contraction of $Q \( H \)^(- 1)$ and $cal(D) H$.
  A second covariant derivative, multiplied by $a$, is a combination of $Z_a Z_b H$, $Z_a H$, and $H$;
  differentiating the factor $a^(- 1 \/ 2)$ produces $Z_a log a$, not an inverse lapse.
  The differentiated connection matrices and the curvature appear with the scaled factors specified in Lemma 20.
  Their uncontracted fixed jets, when needed in nonlinear terms, have subexponential bounds. In particular,

$ D^I a = a thin e^(o \( T \)) \, wide D^I sqrt(a) = sqrt(a) thin e^(o \( T \)) \, wide D^I partial_v b =
  a thin e^(o \( T \)) $

at every fixed order. These identities also apply to the brackets and frame coefficients appearing in the
  preceding calculation.

The Ricci difference formula obtained from (6.5), after subtracting the wave-map gauge derivative,
  consists of the scalar wave principal term, products of first covariant derivatives,
  and algebraic background-curvature contractions. Normalize its overall constant so that its principal term is $a
  g_H^(mu nu) D_mu D_nu H$, and denote the resulting array by $frak(R) \( H \)$.
  This is an equivalent reduced equation. Its linearization at zero is denoted by $cal(L)$.
  It follows from the displayed identities that

#[#set math.equation(numbering: n => "(6.6)")
 $ frak(R) \( H \)_n = \( cal(L) H \)_n + B^(mu nu) \( H \) D_mu D_nu H_n + cal(Q)_n \( H \, D H \) \, wide
   B^(mu nu) \( H \) = a \( g_H^(mu nu) - g^(mu nu) \) . $ <energy:reduced-structure>]

Here $B \( 0 \) = 0$, and $cal(Q)$ vanishes to second order at $\( H \, D H \) = 0$.
  More explicitly, it is a finite sum of contractions of smooth functions of $H$ with background arrays and field
  factors whose total ordinary derivative count is at most two and which contain at least two field factors.
  The smooth undifferentiated-field factors can equivalently be treated by their integral Taylor formula.
  All fixed derivatives of these coefficient functions are bounded by $e^(o \( T \))$ on a fixed small ball of
  relative arrays. Background trace reversal, if used to identify the linear operator,
  is covariantly parallel and does not change this scalar principal part.

The packet bounds and (6.6) give, for every fixed comparison order $j$,

#[#set math.equation(numbering: n => "(6.7)")
 $ lr(bar.v.double frak(R) \( plus.minus q_T \) bar.v.double)_(H_(upright("mix"))^j) lt.eq
   e^(o \( T \)) \( A lambda^(- M_1) + A^2 lambda^(P_j) \) lt.eq A^2 e^(eta T) . $ <energy:packet-residual>]

The fixed integer $P_j$ depends on the base derivative order, not on the subsequently chosen formal accuracy.
  We will also require $lr(bar.v.double cal(L) q_T bar.v.double)_(H_(upright("mix"))^60) lt.eq e^(- 4 kappa T)$.
  Polynomial slice-volume factors are included in $e^(o \( T \))$.
  The number $eta > 0$ can be prescribed as small as necessary by the order of choices at the end of the proof.

For one sign, abbreviate $q = plus.minus q_T$, $F = F_T^plus.minus$, and $g' = g_(q + F)$.
  Subtraction gives the exact equation

#[#set math.equation(numbering: n => "(6.8)")
 $ cal(L) F + B^(mu nu) \( q + F \) D_mu D_nu F =  & - frak(R) \( q \) -
   #scale(x: 120%, y: 120%)[\(] B^(mu nu) \( q + F \) - B^(mu nu) \( q \) #scale(x: 120%, y: 120%)[\)] D_mu D_nu q\
 & - #scale(x: 120%, y: 120%)[\(] cal(Q) \( q + F \, D q + D F \) -
   cal(Q) \( q \, D q \) #scale(x: 120%, y: 120%)[\)] . $ <energy:exact-principal>]

After $j$ ordinary differentiations we retain the exact principal operator $a g' ""^(mu nu) D_mu
  D_nu$ on each $D^I F_n$. Every other perturbative product contains an error factor and at least one further
  packet or error factor, has total field-derivative count at most $j + 2$,
  and has no error factor with more than $j + 1$ derivatives.
  Indeed, the unique placement with $j + 2$ derivatives on an error and no differentiated coefficient is precisely
  the retained principal term. Every principal commutator has a coefficient hit.
  The other terms in (6.8) have either a second derivative on the known packet or at most first derivatives on the
  displayed error factors before commutation. This argument also covers derivatives of the smooth coefficient
  functions by the chain rule.

=== 6.2 Constant slot weights and positive fluxes <constant-slot-weights-and-positive-fluxes>

For a covariant two-tensor entry $n$, let $n_i$ count its radial $i$-slots and set

$ c_n = kappa / 2 \( n_0 - n_1 \) \, wide \| c_n \| lt.eq kappa . $

The limiting vector connection matrices in Lemma 20 give covariant slot actions $+ c_n$ along $L_0$ and $-
  c_n$ along $L_1$. Since $L_0 x = - 1 \/ 2$ and $L_1 x = 1 \/ 2$,

#[#set math.equation(numbering: n => "(6.9)")
 $ e^(2 c_n x) L_0 e^(- 2 c_n x) = L_0 + c_n \, wide e^(2 c_n x) L_1 e^(- 2 c_n x) = L_1 - c_n . $ <energy:factor-two>]

Consequently the constant radial tensor operator is

$ - \( L_0 + c_n \) \( L_1 - c_n \) - \( L_1 - c_n \) \( L_0 + c_n \) \, $

the radial part of

#[#set math.equation(numbering: n => "(6.10)")
 $ cal(C)_(n \, g') f := e^(2 c_n x) a square.stroked.tiny_(g')^(upright("scal")) \( e^(- 2 c_n x) f \) .
   $ <energy:conjugation>]

The factor two in (6.9) is fixed by the definitions of $t \, x$.

For the background metric, the difference between $cal(L)$ and these diagonal operators is a matrix of first- and
  zeroth-order terms on $L_i f_m \, Z_A f_m \, f_m$. Its coefficients are bounded and tend to zero in
  $min \( t \, v \, - u \) arrow.r oo$. This assertion includes the contracted differentiated connection terms and
  $a "Riem" \( g \)$; only the constant diagonal connection products have been retained.
  It is exactly the coefficient conclusion of Lemma 20. Replacing $g$ by $g'$ in (6.10) and passing to scalar
  divergence form add perturbative first- and zeroth-order terms of the type already counted. For example,

$ sqrt(\| det g' \|) = sqrt(\| det g \|) thin lr(|frac(det Q \( q + F \), det G)|)^(1 \/ 2) \, $

so its new logarithmic derivatives depend smoothly on relative arrays and their first derivatives.
  Together with (6.4), this verifies that divergence form does not introduce an extra inverse lapse.

Fix a small positive mass parameter $epsilon_(upright(m))$. For an entry $f = D^I F_n$, put

$ tilde(f) = e^(- 2 c_n x) f \, wide mu^2 = frac(epsilon_(upright(m))^2, 2 a) \, wide X_n = e^(4 c_n x) W_t . $

Use the massive scalar stress tensor of $tilde(f)$ for $g'$ and multiplier $X_n$.
  At $g' = g$, its positive time-slice flux is exactly

#[#set math.equation(numbering: n => "(6.11)")
 $ 1 / 2 integral {\| W_t f \|^2 + \| \( W_x - 2 c_n \) f \|^2 + 2 a gamma^(A B) partial_A f thin partial_B f +
   epsilon_(upright(m))^2 \| f \|^2} d x thin d "vol"_gamma . $ <energy:flux>]

Indeed $W_t$ is normal to the slice and $g \( W_t \, W_t \) = - 2 a$; $W_x$ is its orthogonal radial tangent,
  with squared length $2 a$. Also $W_t x = Z_A x = 0$ and $W_x x = 1$.
  Substitution in the stress tensor gives (6.11), including the conjugated radial derivative.
  For a small relative change the exact flux is uniformly equivalent to (6.11).
  This is a finite-dimensional comparison of $g' \/ a$ in the basis $W_t \, W_x \, Z_A$,
  whose coefficient matrix is a small change of a uniformly nondegenerate matrix.
  It proves simultaneously that the slices are spacelike and $W_t$ is future timelike.

Localize in a finite angular atlas, using cutoffs whose squared sum is bounded below.
  Let $cal(E)_j$ be the sum of the exact fluxes at commutation order exactly $j$, over entries, multiindices,
  and charts, and let $E_j = sqrt(cal(E)_j)$. Lower orders will be included explicitly when needed. The mass terms imply

#[#set math.equation(numbering: n => "(6.12)")
 $ lr(bar.v.double F \( t \) bar.v.double)_(C_(upright("mix"))^r) lt.eq
   C_(r \, epsilon_(upright(m))) sum_(j = 0)^(r + 2) E_j \( t \) . $ <energy:mass-sobolev>]

To see this also for temporal derivatives, fix any mixed derivative $D^I F$ of order at most $r$.
  Its three-dimensional spatial $H^2$ norm is controlled by the mass terms of the mixed energies through $r + 2$.
  The embedding $H^2 subset L^oo$ applies on each angular chart and radial interval.
  Uniformity in the interval length follows by using overlapping intervals of a fixed length and, at endpoints,
  the fixed positive minimum slice length. Low equivalence of $gamma$ to a fixed angular metric makes the
  constants uniform. No angular lapse conversion occurs in (6.12).

Use individual commutation levels $0 lt.eq j lt.eq 60$, with bootstrap

#[#set math.equation(numbering: n => "(6.13)")
 $ E_j \( t \) lt.eq e^(- 5 kappa T \/ 8) . $ <energy:bootstrap>]

The entry proposition, taken through full mixed order 61, starts this bootstrap with $E_j \( 0 \) lt.eq
  A^2 e^(eta T)$. Its pointwise estimates give the same slice estimates after the polynomial volume loss.
  If initial normal jets are instead recovered recursively, the noncharacteristic reduced equation at $t =
  0$ gives precisely these jets from sufficiently high Cauchy data: the entry lapse is uniformly nondegenerate.
  All requisite orders are fixed before $zeta$.

The bootstrap and (6.12) give small relative arrays and first derivatives, including the packet.
  Cone comparison in $W_t \, W_x \, Z_A$ therefore gives, on future causal vectors parametrized by $t$,

#[#set math.equation(numbering: n => "(6.14)")
 $ frac(d u, d t) \, med frac(d v, d t) gt.eq - C e^(- 5 kappa T \/ 8 + o \( T \)) . $ <energy:cone>]

For completeness, the background causal inequality in this basis is $- 2 \( V t \)^2 + 2 \( V x \)^2 +
  gamma \( V_theta \, V_theta \) lt.eq 0$, with $V_theta$ the scaled screen component.
  A small relative metric change preserves bounded ratios of all components to $V t > 0$ and gives $\| V x \| \/ V
  t lt.eq 1 + C \| H \|$, which is (6.14). Thus each tilted side function in (6.1) has strictly positive future
  derivative for large $T$. There is no incoming boundary datum on those faces.
  Finite propagation, starting from exact early agreement, yields

#[#set math.equation(numbering: n => "(6.15)")
 $ "supp" H_T^plus.minus union "supp" F_T^plus.minus subset { v gt.eq \( 1 - nu_0 \) T - omega_T } \, wide
   omega_T = C e^(- 5 kappa T \/ 8 + o \( T \)) T = o \( 1 \) . $ <energy:known-support>]

The packet is supported in a fixed-width neighborhood of $v = T$.

=== 6.3 All commutator placements <all-commutator-placements>

We separate background commutators from perturbative products.
  The second-coordinate part of the scaled background scalar wave is

#[#set math.equation(numbering: n => "(6.16)")
 $ - 2 partial_u partial_v - 2 b^A partial_A partial_v + a gamma^(A B) partial_A partial_B .
   $ <energy:background-principal>]

The $partial_u partial_v$ coefficient is constant. For $\| I \| = j$,
  a term with exactly one derivative on the shift has form

$ \( D b^A \) L_1 #scale(x: 120%, y: 120%)[\(] partial_A D^(I') F_n #scale(x: 120%, y: 120%)[\)] \,
  wide \| I' \| = j - 1 . $

The parenthesized field has ordinary order $j$, and its remaining derivative is radial.
  It is controlled by $E_j$ with coefficient $C_j \| D b \|$, with no angular loss.
  If $ell gt.eq 2$ derivatives hit the shift, the same parenthesized field has order $j - ell + 1 lt.eq j - 1$,
  so this term belongs to a strictly lower energy level and its coefficient may cost $e^(o \( T \))$.

For the angular principal term, a single coefficient derivative has the exact factorization

$ D \( a gamma^(A B) \) = a #scale(x: 120%, y: 120%)[\(] \( D log a \) gamma^(A B) +
  D gamma^(A B) #scale(x: 120%, y: 120%)[\)] . $

Put one angular derivative inside the order-$j$ commuted field and write the other as $a^(- 1 \/ 2) Z_A$.
  The resulting coefficient is $sqrt(a)$ times a bounded low array.
  It tends to zero in the bulk even though $D log a$ need not tend to zero.
  With $ell gt.eq 2$ coefficient hits, the field is at level $j - ell +
  1 < j$ and the coefficient is $sqrt(a) thin e^(o \( T \))$.

Write every background first-order term in the directions $L_0 \, L_1 \, Z_A$.
  A hit on its displayed coefficient leaves an energy derivative of a field of order at most $j - 1$;
  a hit on a zeroth-order coefficient leaves a lower mass norm.
  A hit on the $b$ inside $L_0$ can also leave $\( D b \) partial_A D^(j - 1) F$,
  an order-$j$ mass placement with small bulk coefficient. Derivatives of the $sqrt(a)$ inside $Z_A$ retain that
  factor and lower the remaining commuted field. The same reasoning covers angular localizations and chart
  changes: $\[ b^A partial_A partial_v \, chi \]$ has a $b$ factor and a radial derivative,
  whereas $\[ a gamma^(A B) partial_A partial_B \, chi \]$ has an $a$ factor.
  Differentiated transition matrices act only on angular slots and preserve $c_n$.
  Terms involving the radial bracket retain $partial_v b = a thin O \( 1 \)$,
  so their scaled angular coefficient is $a^(- 1 \/ 2) partial_v b = O \( sqrt(a) \)$.
  Consequently all same-level background remainders have bounded coefficients, arbitrarily small in the bulk,
  while coefficients of strictly lower levels have subexponential bounds.

For perturbative products a rougher estimate suffices, but it must be used only once.
  From (6.11), the bounded shift and the mass term,

#[#set math.equation(numbering: n => "(6.17)")
 $ lr(bar.v.double D^(j + 1) F bar.v.double)_(L^2) lt.eq C_(j \, epsilon_(upright(m))) e^(o \( T \)) sup_(Omega_T)
   a^(- 1 \/ 2) sum_(ell lt.eq j) E_ell lt.eq e^(kappa T \/ 2 + o \( T \)) sum_(ell lt.eq j) E_ell .
   $ <energy:one-angular-loss>]

Indeed $partial_A = a^(- 1 \/ 2) Z_A$, while $partial_u$ and $partial_v$ are bounded combinations of $L_i$ and
  angular derivatives. The subtraction of $2 c_n f$ in the radial energy is paid for by its fixed mass constant.
  Finally $a^(- 1 \/ 2) lt.eq C e^(kappa L) = e^(kappa T \/ 2 + O \( 1 \))$.

Place an error factor with the largest error derivative count in $L^2$ in each product following (6.8).
  If there is another error factor, every such remaining factor has order at most $\( j + 2 \) \/ 2 lt.eq 31$.
  Its supremum is controlled by the mass energies through order 33, by (6.12), and costs $C e^(- 5 kappa T \/ 8)$.
  Undifferentiated additional error factors satisfy the same bound.
  If instead the additional factors are packets, their derivatives are bounded pointwise by $A lambda^P
  e^(o \( T \))$ for a fixed $P$, even when a packet has more derivatives than the selected error.
  Thus the sole possible conversion (6.17) gives the coefficient

#[#set math.equation(numbering: n => "(6.18)")
 $ e^(kappa T \/ 2 + o \( T \)) #scale(x: 120%, y: 120%)[\(] e^(- 5 kappa T \/ 8) +
   A lambda^P #scale(x: 120%, y: 120%)[\)] = e^(- kappa T \/ 8 + o \( T \)) +
   e^(\( - 3 kappa \/ 8 + P zeta \) T + o \( T \)) = o \( 1 \) . $ <energy:nonlinear-small-rate>]

This bounds the perturbative source by a small coefficient times $sum_(ell lt.eq j) E_ell$.
  There are never two angular conversions: the other differentiated errors were estimated by their higher mass
  norms, and the retained principal term was the only error placement with order $j + 2$.
  The deformation of the actual metric in the stress identity requires only first relative jets;
  the scaled connection calculation above gives the same small coefficients.

We also record the source pairing, since it rules out a different spurious exponential factor.
  If $cal(C)_(n \, g') f = S_n$, then the source in the equation for $tilde(f)$ is $a^(- 1) e^(- 2 c_n x) S_n$.
  Since $W_t x = 0$, its pairing with $X_n tilde(f)$ is

$ \( a^(- 1) e^(- 2 c_n x) S_n \) \( e^(4 c_n x) e^(- 2 c_n x) W_t f \) = a^(- 1) S_n W_t f . $

The spacetime volume element in $\( t \, x \, theta \)$ is $2 a sqrt(det gamma) thin \( 1 + O \( \| H \| \) \)
  thin d t thin d x thin d theta$. It cancels the remaining $a^(- 1)$.
  Hence the contribution to the squared energy is at most

#[#set math.equation(numbering: n => "(6.19)")
 $ C lr(bar.v.double S_n bar.v.double)_(L^2) E_j . $ <energy:source-pairing>]

An off-diagonal source involving entry $m$ is first estimated in its original variables $f_m \, L_i f_m \,
  Z_A f_m$, with its own flux. The displayed cancellation occurs entirely in entry $n$;
  no ratio $e^(2 \( c_n - c_m \) x)$ occurs.

=== 6.4 A common rate on every intermediate interval <a-common-rate-on-every-intermediate-interval>

The stress tensor and its divergence, for any metric $g'$, are

$ T_(mu nu) \[ tilde(f) \] & = partial_mu tilde(f) thin partial_nu tilde(f) - 1 /
  2 g'_(mu nu) #scale(x: 120%, y: 120%)[\(] g' ""^(- 1) \( d tilde(f) \, d tilde(f) \) +
  mu^2 tilde(f)^2 #scale(x: 120%, y: 120%)[\)] \,\
nabla_(g')^mu T_(mu nu) & = \( square.stroked.tiny_(g') tilde(f) - mu^2 tilde(f) \) partial_nu tilde(f) - 1 /
  2 partial_nu mu^2 thin tilde(f)^2 . $

Integrate its current with multiplier $X_n$ between two time slices.
  The strict exiting side faces have nonnegative outward energy flux and may be discarded.
  To determine the coefficient of the energy itself, first use a fixed angular metric $gamma \( theta \)$,
  set $b = 0$, and take $a = a_0 e^(- 2 kappa t)$. The angular coordinate coefficients of $gamma$ need not be
  constant. The conjugated scalar equation is

$ 1 / 2 #scale(x: 120%, y: 120%)[\(] - f_(t t) + \( partial_x - 2 c_n \)^2 f #scale(x: 120%, y: 120%)[\)] +
  a Delta_gamma f = S_n . $

Set $P = f_t$ and $V = \( partial_x - 2 c_n \) f$. Differentiating (6.11) and integrating the radial and angular
  second derivatives gives

#[#set math.equation(numbering: n => "(6.20)")
 $ frac(d, d t) cal(E) \[ f \] =
   integral (- 4 c_n P V - 2 kappa a \| d_theta f \|_(gamma^(- 1))^2 + epsilon_(upright(m))^2 f P - 2 S_n P) d x
   thin d "vol"_gamma $ <energy:model-identity>]

up to the favorable boundary flux. For the radial cross term,
  the two expressions $P \( partial_x - 2 c_n \) V$ and $V \( partial_x - 2 c_n \) P$, after integration by parts,
  leave $- 4 c_n P V$. Differentiating the angular coefficient gives $a_t \| d_theta f \|^2 = -
  2 kappa a \| d_theta f \|^2$, and the mass term gives $epsilon_(upright(m))^2 f P$.
  This also verifies the cancellation between the variable-mass derivative and the mass part of the metric
  deformation in the stress formulation.

The angular term is nonpositive, while

$ 4 \| c_n P V \| lt.eq 2 \| c_n \| \( \| P \|^2 + \| V \|^2 \) \, wide epsilon_(upright(m))^2 \| f P \| lt.eq
  epsilon_(upright(m)) / 2 \( epsilon_(upright(m))^2 \| f \|^2 + \| P \|^2 \) . $

Thus the nonsource rate for the squared energy is at most $4 kappa + epsilon_(upright(m))$,
  and that for its square root is at most $2 kappa + epsilon_(upright(m)) \/ 2$.
  There is no commutation-order factor in this constant, since $c_n$ is the weight of the original two slots for
  every $D^I F_n$.

We justify taking this model as the bulk limit without assuming that $gamma$ converges to a prescribed angular
  metric. Put $Y = \( W_t \, W_x \, Z_A \)$ and $hat(Q)_(a b) = g' \( Y_a \, Y_b \) \/ a$.
  The deformation tensor, derivative of $e^(4 c_n x)$, and derivative of $mu^2$,
  after dividing their contractions by the energy density, are smooth algebraic functions of $hat(Q)$,
  its first relative derivatives, the brackets of $Y$, and the bounded background low arrays.
  The required background limits are

#[#set math.equation(numbering: n => "(6.21)")
 $ W_t log a = - 2 kappa + o \( 1 \) \, wide W_t gamma = o \( 1 \) \,\
= - 2 \( partial_v b \)^A partial_A = o \( 1 \) Z_A \, wide \[ W_t \, Z_A \] = - kappa Z_A + o \( 1 \) Z_B . $ <energy:deformation-limits>]

For the third identity use $partial_v b = a thin O \( 1 \)$; for the last use $W_t log a$ and $partial_A b =
  o \( 1 \)$. The radial metric block therefore has limiting deformation $- 2 kappa$ times itself,
  the angular block has zero limiting deformation, and mixed deformations tend to zero in relative units.
  Angular spatial derivatives remain in divergence form and require boundedness only.
  These statements give exactly (6.20) in the limit. The changes in $hat(Q)$ and its relevant first derivatives
  are exponentially small by the bootstrap. Fixing $epsilon_(upright(m))$ first permits every remaining bulk term,
  including the bounded first- and zeroth-order linear source coefficients,
  to be made arbitrarily small relative to the positive flux. The background linear equation enjoys the same estimates.

Here is an explicit common rate construction. Fix a desired small $eta > 0$.
  Choose $epsilon_(upright(m))$, then a bulk threshold $B_0$,
  so that all same-level square-root rates at the finitely many used orders are at most $2 kappa +
  eta_0$ on $min \( t \, v \, - u \) gt.eq B_0$, where $eta_0$ is as small as needed.
  Their rates elsewhere are bounded by a constant $C_0$. These constants apply simultaneously to both actual
  metrics and the background operator; enlarge $T$ to absorb (6.18).
  On the support (6.15), a point outside the bulk can occur only at times in

$ J_T = \[ 0 \, B_0 \] med union med [frac(\( 1 - nu_0 \) T - omega_T - B_0, 2) \, L] . $

Indeed $v gt.eq B_0$ for large $T$, and $- u = v - 2 t$. In particular $\| J_T \| lt.eq nu_0 T \/ 2 +
  O \( B_0 + 1 \)$. Choose $nu_0$ after $C_0$, sufficiently small, and set for example

#[#set math.equation(numbering: n => "(6.22)")
 $ r_T \( t \) = 2 kappa + eta_0 + C_0 upright(bold(1))_(J_T) \( t \) \, wide cal(R)_T \( t \) =
   integral_0^t r_T \( s \) thin d s . $ <energy:common-rate>]

Increasing $C_0$ if necessary and making the preceding choices strict gives

#[#set math.equation(numbering: n => "(6.23)")
 $ cal(R)_T \( L \) lt.eq \( kappa + eta \) T . $ <energy:rate-integral>]

It is a single nonnegative pointwise majorant for both individual equations and the background linear equation at
  every used order, not a terminal estimate chosen separately at each level.

Combining the source and commutator bounds yields, in integrated form or almost everywhere after regularization,

#[#set math.equation(numbering: n => "(6.24)")
 $ E'_j lt.eq r_T E_j + sum_(ell < j) a_(j ell) \( t \) E_ell + S_j \( t \) \, wide a_(j ell) gt.eq 0 \, wide
   integral_0^L a_(j ell) \( t \) thin d t lt.eq e^(o \( T \)) . $ <energy:hierarchy>]

At a zero of an energy this follows by first using $\( cal(E)_j + epsilon.alt^2 \)^(1 \/ 2)$ and then letting
  $epsilon.alt arrow.b 0$. Same-level couplings among entries and multiindices were summed within $cal(E)_j$.
  The remaining matrix in (6.24) strictly lowers the ordinary commutation order.

#thm([Lemma 6.2.])[
  (Finite Volterra propagator).  #emph[For levels $0 \, dots.h \, K$ satisfying (6.24), with fixed $K$,
    there is a subexponential $P_T$, uniform for all $0 lt.eq s lt.eq t lt.eq L$, such that
#[#set math.equation(numbering: n => "(6.25)")
 $ sum_(j lt.eq K) E_j \( t \) lt.eq P_T {e^(cal(R)_T \( t \) - cal(R)_T \( s \)) sum_(j lt.eq K) E_j \( s \) +
   integral_s^t e^(cal(R)_T \( t \) - cal(R)_T \( tau \)) sum_(j lt.eq K) S_j \( tau \) thin d tau} .
   $ <energy:propagator>]

]
] <energy:volterra>

#proof[
  Let $upright(bold(A)) \( t \) = \( a_(j ell) \( t \) \)$, with zero diagonal and entries zero unless $ell < j$.
    Conjugate the inequalities by $e^(- cal(R)_T \( t \))$ and use comparison with the nonnegative linear system.
    Its time-ordered propagator is the finite sum
  $ upright(bold(U)) \( t \, s \) = "Id" + sum_(m = 1)^K integral_(s < tau_m < dots.h.c < tau_1 < t)
    upright(bold(A)) \( tau_1 \) dots.h.c upright(bold(A)) \( tau_m \) thin d tau_m dots.h.c d tau_1 . $
  Every product of $K + 1$ such matrices is zero: a nonzero entry would require $K + 1$ strict descents among $K +
    1$ levels. This does not require that the matrices at different times commute.
    If $B_T = integral_0^L lr(bar.v.double upright(bold(A)) \( tau \) bar.v.double) thin d tau$,
    then $lr(bar.v.double upright(bold(U)) \( t \, s \) bar.v.double) lt.eq sum_(m = 0)^K B_T^m \/ m !$.
    The right side is $e^(o \( T \))$, since $K$ is fixed and $B_T = e^(o \( T \))$;
    for any desired exponential tolerance use that tolerance divided by $K + 1$ in each coefficient bound.
    Variation of constants and removal of the common conjugation give (6.25).
    The bound used the whole-interval $B_T$, and is therefore uniform in both endpoints. ◻
]

=== 6.5 Individual closure and vacuum continuation <individual-closure-and-vacuum-continuation>

Apply Lemma 28 with $K = 60$, the entry bounds, and $S_j lt.eq A^2 e^(eta T)$ from (6.7).
  By reducing preliminary losses, and absorbing the finite triangular factor and $L = O \( T \)$, we obtain

#[#set math.equation(numbering: n => "(6.26)")
 $ sum_(j lt.eq 60) E_j \( t \) lt.eq A^2 e^(cal(R)_T \( t \) + eta_1 T) \, wide 0 lt.eq t lt.eq L \,
   $ <energy:individual-time>]

where $eta_1 > 0$ can be made arbitrarily small along with the tolerance in (6.23).
  This is an estimate at every time. Its terminal exponent is $- 2 alpha + kappa + eta + eta_1 = - 3 kappa \/ 4 +
  eta + eta_1$, strictly smaller than $- 5 kappa \/ 8$ when $eta + eta_1 < kappa \/ 8$.
  It improves (6.13), and (6.12) gives the individual $C_(upright("mix"))^30$ estimate after allocating the losses
  within $delta$.

For each fixed $T$, the lapse has a positive minimum on the finite closed comparison region.
  The bounded mixed energy norms therefore give the ordinary local Cauchy norms needed for continuation;
  their equivalence constants need not be uniform in $T$. The temporal principal coefficient stays nonzero,
  the relative metric stays Lorentzian, and the strict side margins persist by (6.14).
  Local restarts are made on the enlarged slice intervals and restricted by domain of dependence.
  One can extend the reduced-equation slice fields smoothly across an artificial side for this purpose;
  no constraints on that auxiliary extension are needed outside the retained dependence domain.
  A finite maximal continuation time would contradict these bounds and the local noncharacteristic existence
  theorem. Higher smooth orders persist by differentiating on this fixed regular slab,
  where the known low norms control the principal coefficients and each higher finite norm satisfies a finite
  linear energy bound. This is the local continuation argument used in #cite(label("Foundation"))  and .

Finally the exact reduced solutions are vacuum. In the convention $"Ric" \( g' \) +
  nabla_(\( mu)^(g') Upsilon_(nu \)) = 0$, the contracted Bianchi identity gives a homogeneous linear wave
  equation for the gauge covector $Upsilon$. Its initial value vanishes by the exact entry gauge.
  Its tangential derivatives then vanish. In an orthonormal frame with unit normal $N$,
  the mixed normal Einstein constraints give $nabla_N Upsilon_A = 0$,
  and the normal-normal constraint gives $nabla_N Upsilon_N = 0$:
  substituting the reduced equation in $"Ein" \( g' \) \( N \, dot.op \) =
  0$ leaves these components with nonzero factors. Thus both gauge Cauchy data vanish.
  Homogeneous wave uniqueness on the outflow dependence domain proves $Upsilon = 0$ and $"Ric" \( g' \) = 0$.

=== 6.6 Odd forcing with higher mass buffers <odd-forcing-with-higher-mass-buffers>

Both individual solutions now exist with (6.26). Their difference is a known field,
  so its support is already given by (6.15). Writing its equation with the background operator does not change
  that support.

Set $cal(N) \( H \) = frak(R) \( H \) - cal(L) H$. At the level of the finite jet variables in (6.6),
  Taylor’s formula gives

$ cal(N) \( H \) = cal(B)_2 \( H \, H \) + cal(N)_(gt.eq 3) \( H \) \, $

where $cal(B)_2$ is a bilinear differential expression of total derivative count at most two,
  and the integral remainder has at least three field factors with the same total derivative count.
  The coefficient functions have the previously established fixed-jet bounds. Subtracting the two exact equations gives

#[#set math.equation(numbering: n => "(6.27)")
 $ cal(L) F_T^(upright("odd")) = - 2 cal(L) q_T - cal(N) \( q_T + F_T^(+) \) +
   cal(N) \( - q_T + F_T^(-) \) . $ <energy:odd-equation>]

The pure packet quadratic terms cancel because $cal(B)_2 \( q_T \, q_T \) = cal(B)_2 \( - q_T \, - q_T \)$.
  All remaining quadratic terms contain either a packet and an error or two errors.
  In the cubic remainder the pure packet term has size $A^3$,
  and every other term contains an error and is bounded by one of these two quadratic types times a small field
  factor. This uses smallness of the total relative fields,
  not an assumption that an individual error is smaller than the packet.

Estimate (6.27) through mixed order 10. The highest derivative in its source has order 12.
  It is controlled in unweighted $L^2$ by the mass term at individual level 12,
  rather than by the degenerate angular derivative term at level 11.
  All needed supremum factors can, even without optimizing their placement,
  be controlled by individual mass energies through level 14. These levels lie strictly below 60.
  The ordinary product rule, applied on each slice to the finite jet expression, therefore gives

#[#set math.equation(numbering: n => "(6.28)")
 $ lr(bar.v.double cal(L) F_T^(upright("odd")) \( t \) bar.v.double)_(H_(upright("mix"))^10) lt.eq
   e^(eta_2 T + o \( T \)) (A^3 e^(cal(R)_T \( t \)) + A^4 e^(2 cal(R)_T \( t \))) . $ <energy:odd-source>]

Here $eta_2$ is a fixed finite sum of the preliminary losses and fixed positive frequency powers times $zeta$,
  hence can be made arbitrarily small. Specifically the packet–error products use $A lambda^P dot.op A^2
  e^(cal(R)_T \( t \) + eta_1 T)$, the error–error products use $A^4 e^(2 cal(R)_T \( t \) + 2 eta_1 T)$,
  and $A^3 lambda^P lt.eq A^3 lambda^P e^(cal(R)_T \( t \))$.
  The negligible $2 cal(L) q_T$ is absorbed because its exponent $- 4 kappa$ is strictly below $- 3 alpha$.
  Higher Taylor factors are absorbed by the already proved relative smallness and the same product estimates.
  No use of (6.17) occurs in this argument.

The initial odd energy through level 10 is at most $A^3 e^(eta T)$ by Proposition 24.
  Apply the background version of (6.24) with the same $r_T$ and use Lemma 28.
  This is legitimate on the known support of the field in (6.27);
  the background side fluxes also have the favorable sign. Monotonicity of $cal(R)_T$ gives, for every $t lt.eq L$,

#[#set math.equation(numbering: n => "(6.29)")
 $ integral_0^t e^(cal(R)_T \( t \) - cal(R)_T \( s \)) A^3 e^(cal(R)_T \( s \)) thin d s & =
   t A^3 e^(cal(R)_T \( t \)) \,\
integral_0^t e^(cal(R)_T \( t \) - cal(R)_T \( s \)) A^4 e^(2 cal(R)_T \( s \)) thin d s & lt.eq
  t A^4 e^(2 cal(R)_T \( t \)) . $ <energy:duhamel-one>]

Thus the odd norm has only one or two final growth factors, respectively.
  Applying (6.12) at order two, and absorbing the fixed triangular and polynomial factors,
  proves the second line of (6.2). The preserved intermediate-time difference $cal(R)_T \( t \) -
  cal(R)_T \( s \)$ is essential in these two integrals.

=== 6.7 Finite choices and strict margins <finite-choices-and-strict-margins>

We finish by specifying the quantifier order. First fix individual order 60, odd order 10,
  the desired order 30 for the metric, the finite data seminorm, and all entry, exterior, constraint, gauge,
  and restriction buffers needed for them. Fix $delta < kappa \/ 32$.
  Allocate smaller losses so that their finite sum, including twice the tolerance in (6.23) for the second odd
  term, is below $delta$. Choose the mass parameter, the bulk threshold, and then $nu_0$ as in (6.22);
  the preparation proposition supplies early agreement for that $nu_0$.
  Choose its exterior losses within the same allocation. The finitely many positive frequency powers are now
  fixed. Take $zeta > 0$ sufficiently small for these powers and for (6.18).
  Only afterwards increase the finite formal transport and inverse-accuracy orders until all linear residual
  bounds used above hold. At every resulting fixed order, increase $T$ to absorb constants and subexponential
  factors. No simultaneous estimate over an increasing derivative order is used.

The three error exponents in (6.2) are

$ - frac(3 kappa, 4) + delta \, wide - frac(13 kappa, 8) + delta \, wide - frac(3 kappa, 2) + delta . $

The individual exponent improves the bootstrap by more than $3 kappa \/ 32$.
  The packet’s fixed $C^30$ exponent can be chosen at most $- 7 kappa \/ 8 + kappa \/ 32$; hence,
  after absorbing a fixed sum of constants, both total changes are bounded, for example,
  by $e^(- 11 kappa T \/ 16)$. This proves the first assertion of (6.3) with $c =
  3 kappa \/ 16$ after a further increase of $T$. Dividing the two odd bounds by $A$ gives exponents at most $-
  3 kappa \/ 4 + delta$ and $- 5 kappa \/ 8 + delta$. Squaring the total-change bound and dividing by $A$ gives
  exponent at most $- kappa \/ 2$. All are strictly negative,
  and remain so after multiplication by any fixed-order $e^(o \( T \))$. This proves (6.3) and Proposition 27.

== 7 Attachment to the full development and the observing geodesic <attach:section>

Fix the background datum $d$ and the branch seed $w$ of Corollary 15.
  Use the separately prepared branch coordinates in which $v arrow.r oo$ and $u arrow.r
  u_(*) < oo$ along $gamma_w$. Write $p_T = gamma_w ∩ { v = T }$,
  and denote the two complete corrected data of Proposition 24 by $d_T^plus.minus$.
  The exact interior metrics of Proposition 27 are denoted by $g_T^plus.minus$.
  This section places their finite observations in the corresponding full maximal globally hyperbolic developments
  and supplies observing seeds in the original open seed set.

After the fixed derivative orders and the small losses have been chosen as in Proposition 27,
  there are $c > 0$ and constants independent of $T$ such that

#[#set math.equation(numbering: n => "(7.1)")
 $ lr(bar.v.double H_T^plus.minus bar.v.double)_(C_(upright("norm"))^30) lt.eq epsilon_T \, wide epsilon_T =
   C exp #scale(x: 120%, y: 120%)[\(] - \( kappa \/ 2 + c \) T #scale(x: 120%, y: 120%)[\)] .
   $ <attach:relative-smallness>]

Here the norm means ordinary derivatives of the normalized metric arrays.
  Indeed, the packet has exponent $- 7 kappa \/ 8$ before its allocated frequency loss,
  while the largest individual error has exponent $- 3 kappa \/
  4$ before the allocated rate and finite-jet losses. These losses can be chosen strictly smaller than the gap to
  $- kappa \/ 2$. A further fixed-order factor $e^(o \( T \))$ can always be absorbed after decreasing $c$.
  In particular $T epsilon_T arrow.r 0$ and $epsilon_T \/ sqrt(a \( p_T \)) arrow.r 0$.

=== 7.1 A Cauchy development of the entire corrected datum <attach:whole-bridge-section>

We join three vacuum regions: a lower development containing the complete bridge and a past collar,
  the selected late exterior evolution, and the finite deep evolution.
  The lower region must retain every initial spatial radius, including the corrected exterior tail.
  Every discarded face above it must be a future exit, so that a past causal curve from the experiment can reach
  the lower region. These are the two geometric requirements behind the attachment.

The finite bridge lemma supplies the lower region, the delayed exterior partial slices,
  and enlarged fixed matching bands #cite(label("Foundation")).
  The comparison-development proof supplies their fixed-time wave-map identifications and product collars
  #cite(label("Foundation")); the packet-attachment proof supplies the strict future cuts and the order of the
  joins #cite(label("Foundation")). We first identify the actual solutions on these collars.
  We then choose the retained regions and prove that the complete bridge is Cauchy before invoking maximality.
  The verification below uses the present signed estimates, whose amplitude differs from the one in that source.

#thm([Proposition 7.1.])[
  (Whole-bridge attachment).  #emph[For all sufficiently large finite $T$,
    there is a smooth time-oriented vacuum development $cal(N)_T^plus.minus$ of the entire datum $d_T^plus.minus$
    with $Sigma$ as a Cauchy hypersurface. It contains the constructed finite observation,
    restricted within its construction margins, and an optical-coordinate box about $p_T$,
    of fixed sufficiently small coordinate radii independent of $T$, in $I_(cal(N)_T^plus.minus)^(+) \( Sigma \)$.
    It admits a time-orientation-preserving open isometric embedding into $cal(M)_(d_T^plus.minus)$ that preserves
    the initial-data embedding. The full physical constraint-correction tail is part of its initial data.]
] <attach:development>

#proof[
  Fix one sign. Perform each identification on enlarged solution regions;
    the retained regions will be chosen after these identifications.
  #emph[The full lower block.] The data converge to $d$ in $p_10$, are smooth, and solve the vacuum constraints.
    Hence the finite bridge lemma applies with the same fixed depths, time bands, and past collar.
    Its future artificial faces are strictly future-exiting for causal curves.
    At bounded radius its bounds are finite-time Cauchy bounds on compact causal shadows;
    on the ends they are uniformly local symbol bounds, with bounded causal coordinate speeds.
    Its smallness hypothesis is precisely the fixed $p_10$ hypothesis, and no smallness at all smooth orders is needed.
  Let $t_T$ be the exterior launch time, let $C_e$ be the exterior center, and let $s_(*) = sup \| C'_e \| < 1 -
    2 beta$. The protected ball from Proposition 24 contains the fixed-origin ball of radius
  #[#set math.equation(numbering: n => "(7.2)")
   $ \( 1 - 2 beta \) t_T - \| C_e \( t_T \) \| gt.eq \( 1 - 2 beta - s_(*) \) t_T - \| C_e \( 0 \) \| arrow.r
     oo . $ <attach:protected-radius>]
  Thus every fixed compact causal shadow used in the lower joins has unchanged data for large $T$.
    Domain of dependence identifies the bounded central pieces,
    the bent compact part of the selected partial slice, and the required pieces on the unselected end with the
    background ones. On the horizontal far part of the selected partial slice $t_e = 0$, however,
    the lower development carries the actual datum $d_T^plus.minus$, including its entire tail.
    This is also the initial datum of the selected exterior evolution.
    Equality with the old datum is asserted only in the protected regions.
  #emph[The fixed-time exterior identification.] Choose the fixed matching time $t_a >
    0$ and an enlarged band around it supplied by the comparison-development construction.
    Both the lower block and the selected exterior solution evolve the same geometric data on the partial slice.
    Solve the identifying wave map $Psi$ from the exterior solution to the lower solution with the slice
    identification as its value and the matching future unit normal as its normal derivative.
    The background identification may be used as the reference coordinate map.
    On the fixed slab from $t_e = 0$ through the matching band, the map remains a diffeomorphism on the smaller region.
  Here is the quantitative input for this last assertion. The source construction gives metric $H^10$ and
    second-form $H^9$ control on compact shadows and the corresponding uniformly local end control.
    The differentiated wave-map equation at map order ten uses Christoffel derivatives through nine.
    In a bootstrap with bounded low map derivatives and inverse Jacobian,
    tame product and composition estimates bound its current-order coefficient by the uniformly bounded low metric
    and map norms. The known higher coefficient derivatives through the stated finite orders multiply lower map
    derivatives; their norms are controlled by the same fixed-time package.
    Thus the energy of the difference from the background map obeys an inequality of the form
  #[#set math.equation(numbering: n => "(7.3)")
   $ E_10 \( s \) lt.eq C eta_T + C integral_0^s E_10 \( sigma \) thin d sigma \, wide 0 lt.eq s lt.eq t_a +
     delta_a \, wide eta_T arrow.r 0 \, $ <attach:map-estimate>]
  where $C$ and $delta_a > 0$ do not depend on the growing outer cutoff.
    On the ends the estimate is taken as a supremum of energies in uniformly local charts,
    so its coefficient does not grow with their number or total volume.
    Uniqueness identifies the maps on chart overlaps. Fixed-time Gronwall, Sobolev embedding,
    and the strict spatial and deeper margins give the required $C^1$ diffeomorphism control.
    To see global injectivity on the used region, compose with the inverse background identification.
    The resulting map $hat(Psi)$ is uniformly close to the identity in both $C^0$ and $C^1$.
    Two points with the same image must therefore be close in the reference bounded-geometry metric.
    They lie in one enlarged convex chart, where integration of $D hat(Psi) = "Id" +
    o \( 1 \)$ along their joining segment rules out a collision.
    The inverse function theorem supplies the smooth inverse on the image.
    We also obtain at least $H^9$ control after straightening the joining collar.
    This is exactly the finite-order map estimate in the cited comparison-development proof.
    Late high-order bounds of size $e^(o \( T \))$ are not used as its top Gronwall coefficient.
  Write $g_E \, g_L$ for the exterior and lower metrics. Set $h =
    Psi^(*) g_L$ and now hold this smooth metric fixed as the target.
    The wave-map identity is $"tr"_(g_E) \( Gamma \( g_E \) - Gamma \( h \) \) = 0$.
    Thus $g_E$ and $h$ are vacuum metrics in the same target-$h$ reduced system.
    Slice and future-normal matching give equal initial metric values and tangential derivatives.
    Equality of the second fundamental forms fixes their normal spatial-metric derivatives.
    More explicitly, let $B_(mu nu) = partial_0 \( g_E - h \)_(mu nu)$ on the slice, so $B_(i j) = 0$.
    Lowering the relative gauge vector with the common initial metric gives
  $ cal(C)_i = h^00 B_(0 i) \, wide cal(C)_0 = 1 / 2 h^00 B_00 . $
  Since $cal(C) = 0$ and $h^00 eq.not 0$, the remaining normal derivatives agree as well.
    The two metrics have identical full first reduced jets. Smooth local uniqueness,
    with the strict outflow boundaries of the enlarged domain,
    proves that the map is an isometry throughout the used matching band.
    This uniqueness argument is for each fixed $T$; its higher smooth norms do not enter the preceding uniform map
    estimate. The small coordinate straightening can be cut off farther back inside the available margin.
    The compact joins use the unchanged background identification.
  #emph[Entry into the deep domain.] The selected exterior exists through $t_T + C_2$,
    with a shrinking outer cutoff and strict deeper exit boundaries, by Proposition 24.
    The used interval of $cal(S) = { t = 0 }$ and its collar lie inside these margins:
    its selected late endpoint has bounded co-radius and exterior time $t_e = t_T + O \( 1 \)$,
    whereas its middle and unselected parts are supplied by the unchanged lower pieces.
    The spacelike conormal of this entry surface retains its strict sign under the low-order comparison.
    The deep evolution uses exactly the induced spacetime jets furnished by this exterior and the same target-$g$
    wave-map gauge. Consequently local reduced uniqueness identifies their actual entry collars.
    An approximate packet match alone would not suffice for this step.
  The three metrics now agree under actual collar isometries.
    It remains to choose which portions to keep and to show that a past causal curve from any retained future
    point reaches the complete lower block.
  #emph[Retained domains and their endpoints.] Let $r = \| y \|$ be the selected-end co-radius.
    Beyond the fixed join only the used exterior region is retained,
    with outer radius $R_(upright("out")) \( t_e \)$ and terminal time $t_(upright("end"))$.
    The speed chosen in Proposition 24 satisfies
  #[#set math.equation(numbering: n => "(7.4)")
   $ frac(d, d t_e) #scale(x: 120%, y: 120%)[\(] r - R_(upright("out")) \( t_e \) #scale(x: 120%, y: 120%)[\)]
     gt.eq V_(upright("out")) - V_max > 0 $ <attach:outer-sign>]
  on future causal curves near the active outer cut. The retained selected-end set near the matching face is
  #[#set math.equation(numbering: n => "(7.5)")
   $ { t_e < t_(upright("end")) } ∩ #scale(x: 120%, y: 120%)[\(] { t_e < t_a } med union med
     { r < R_(upright("out")) \( t_e \) } #scale(x: 120%, y: 120%)[\)] \, $ <attach:union>]
  with the lower entry-surface cut imposed where active. The first member of the union contains all radii.
    In particular no physical initial tail is replaced by background data beyond the computing cutoff.
    Figure 2 depicts this local condition.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (6.325, 0.945), fill: rgb("#e8e8ff"), stroke: none)
  line((0, 0.945), (4.772, 0.945), (3.565, 2.835), (0, 2.835), close: true, fill: rgb("#e8e8ff"), stroke: none)
  rect((0.1725, 0.738), (4.37, 1.152), fill: rgb("#ffe8d1"), stroke: none)
  line((0, -0.108), (6.785, -0.108), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.785, -0.108), [#text(size: 9pt)[$r$]], anchor: "west", padding: 0.1176cm)
  line((-0.138, 0), (-0.138, 3.195), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.138, 3.195), [#text(size: 9pt)[$t_e$]], anchor: "south", padding: 0.1176cm)
  line((0, 0.945), (6.325, 0.945), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.138, 0.945), [#text(size: 9pt)[$t_a$]], anchor: "east", padding: 0.1176cm)
  line((0, 0.945), (4.772, 0.945), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((4.772, 0.945), (3.565, 2.835), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((1.897, 2.16), [#text(size: 9pt)[retained future end#linebreak()$r<R_( upright("out") )(t_e)$]])
  content((5.52, 2.34), [#text(size: 9pt)[omitted]])
  content((4.255, 1.755), [#text(size: 9pt)[$R_( upright("out") )$]], anchor: "west", angle: -63deg, padding: 0.1176cm)
  content((2.875, 0.36), [#text(size: 9pt)[full lower end: every radius]])
  content((0.253, 1.413), [#text(size: 9pt)[matching collar]], anchor: "west", padding: 0.1176cm)
  line((1.092, 1.359), (1.092, 1.116), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.335, 1.62), (3.105, 0.54), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.335, 1.305), [#text(size: 9pt)[past]], anchor: "west", padding: 0.1176cm)
  line((5.923, 0.36), (6.612, 0.36), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
})],
    caption: [Figure 2: The local exterior condition in Equation (7.5). The lower part extends to all radii; only the added future part has an outer cut. The dashed outer edge is omitted. The matching segment has a genuine collar. Terminal and entry-surface cuts, imposed separately, are suppressed in this schematic. ],
  ) <attach:union-figure>
  For a past curve initially in the added future part, $f = r -
    R_(upright("out"))$ is nonincreasing as long as that cut is active.
    It therefore keeps the strictly negative gap it had at its starting point until reaching $t_e = t_a$.
    It reaches an actual matching collar there, then the unrestricted lower block.
    A curve already in $t_e < t_a$ stays in that union member.
    In particular $\( t_e \, f \) = \( t_a \, 0 \)$ cannot be a past endpoint from the added part.
    The unmatched part of the $t_a$ face is a future exit and is omitted.
  For clarity, the retained deep domain has strict future inequalities
  #[#set math.equation(numbering: n => "(7.6)")
   $ t & < L_T := frac(T + u_(*), 2) + c_0 \, wide t > 0 \,\
F_0 := u + frac(c_0 t, T) & < u_2 \, wide F_1 := v + frac(c_0 t, T) < T + c_2 \, $ <attach:deep-domain>]
  where $u_2 > u_(*)$ and $c_2 > 0$ are fixed, and $c_0 > 0$ was chosen small relative to these margins.
    The lower face $t = 0$ is attached. Relative cone control from Equation (7.1) keeps $t$ temporal and gives,
    for future causal vectors normalized by $d t = 1$,
  #[#set math.equation(numbering: n => "(7.7)")
   $ d u \, d v gt.eq - C epsilon_T \, wide d F_i gt.eq c_0 / T - C epsilon_T > 0 . $ <attach:deep-sign>]
  Indeed, after division of the causal inequality by $a$, the null components are $d u \,
    d v$ and the angular velocity is $\( d theta - b thin d u \) \/ sqrt(a)$.
    On the section $d u + d v = 2$, the background cone is a bounded set and has $d u \, d v gt.eq 0$;
    a small relative perturbation enlarges these lower bounds by at most $C epsilon_T$.
    This also bounds the angular velocity on that section.
  If a past curve starts at $q$ inside this domain, then along it $F_i lt.eq F_i \( q \)$.
    Thus its gaps from both omitted sides stay strictly positive, rather than merely nonnegative.
    At a limiting point on $t = 0$ these same gaps put it strictly inside the used entry interval.
    This interval and its collar were chosen strictly inside the exterior interval available through $t_T + C_2$,
    including its outer and deeper margins. Such a limit is therefore in the actual identified collar.
    It cannot be an entry/side or entry/outer-cut corner. The terminal time inequality has the same
    past-preservation property. The other active temporal and inner cuts in the lower matches have the source
    construction’s strict future-exit signs.
  At an intersection of cuts, the retained prescription is a finite union or intersection of these past-preserved
    strict sublevels. For a union, one retains the member occupied by the curve until it enters an unrestricted
    lower member. For an intersection, every active gap is preserved.
    This locates any finite past endpoint in an ordinary retained chart, an actual matching collar,
    or the full lower block. No continuation across an omitted face is used.
    For each fixed $T$ the added coordinate ranges are finite and the metric is smooth and nondegenerate on the
    enlarged ranges. A causal curve parametrized by the relevant temporal coordinate has bounded coordinate speeds
    there, hence a limit at a finite endpoint. The gap argument just given places this limit in a retained chart,
    where causal continuation is possible. In the lower end pieces,
    the fixed-time speed bound rules out escape to spatial infinity.
  #emph[The gluing topology and the Cauchy property.] Straighten each matching collar as a product with the
    matching hypersurface. Retain the lower side from the lower solution and the upper side from the added
    solution, with only one copy of the matching face. The interiors of these pieces are disjoint.
    Remove unused future faces and their edges before taking the quotient;
    the matching faces are then closed relative to their respective retained pieces.
    The identifications are homeomorphisms on those closed faces and isometries on their collars.
    A finite gluing of this kind is Hausdorff: saturating a closed subset adds its closed image in each matching
    face, so the quotient map is closed; its fibres are finite,
    and distinct fibres can be separated in the Hausdorff pieces and then by saturated neighborhoods.
    The product collars give the smooth charts across the faces.
    At intersecting joining prescriptions first join the two lower charts, then cross $cal(S)$;
    the uniqueness identifications agree on the overlap. Thus there is no duplicate open continuation of a single
    face. Second countability follows from the finitely many countable atlases.
  Every past-inextendible causal curve starting above $Sigma$ now reaches the lower block and the complete bridge:
    it cannot stop at an omitted face, at a finite interior endpoint, or at infinity in bounded time.
    The joining faces are spacelike and have a fixed crossing orientation,
    so the finitely many joining layers cannot be revisited indefinitely.
    The lower block has the Cauchy control of the finite bridge lemma.
    A curve in the short past collar reaches $Sigma$ to the future by that same lemma.
    No causal curve crosses $Sigma$ twice, by lower-block Cauchyness and the one-way signs of the subsequent
    joining faces. Hence every inextendible causal curve meets $Sigma$ exactly once.
    The glued metric is smooth vacuum and induces exactly $\( h_T^plus.minus \, K_T^plus.minus \)$ on this full
    hypersurface. It is therefore a globally hyperbolic development in the sense of #cite(label("Sbierski2016"))
    Definition 2.1. The maximal-development theorem #cite(label("Sbierski2016")) Definition 2.2 and Theorem 2.8
    gives the claimed initial-data-preserving isometric embedding into $cal(M)_(d_T^plus.minus)$;
    an embedding of equal-dimensional manifolds is open. At $p_T$, the gap from the time top is at least $c_0$,
    and the two side gaps are at least $u_2 - u_(*) - c_0 \/ 2 - O \( T^(- 1) \)$ and $c_2 - c_0 \/ 2 -
    O \( T^(- 1) \)$. These are fixed positive numbers. The derivatives of the cut functions in $\( u \, v \)$ are
    uniformly bounded. A fixed sufficiently small coordinate box therefore lies inside the retained deep domain
    for every large $T$. It has positive time above the spacelike entry, so it lies in $I^(+) \( Sigma \)$. ◻
]

#prodef([Remark 7.2.])[
  (Geometric hypotheses of the attachment).  The proof of Proposition 29 uses the smallness of the interior change
    only to keep the time levels spacelike and the two tilted side functions strictly increasing on future causal
    vectors. Thus the same attachment proof applies to a finite vacuum experiment with exactly matched entry
    Cauchy jets, complete corrected data and the stated protected region,
    provided it has these temporal and strict future-outflow inequalities and the fixed matching margins.
    The finite-time exterior identification still requires the low-order closeness used in Equation (7.3).
    The stronger estimate $H = o \( sqrt(a) \)$ is first used in the adaptive observer construction below;
    it is not a geometric gluing hypothesis.
] <attach:geometric-contract>

=== 7.2 The absolute canonical momentum on the unit shell <the-absolute-canonical-momentum-on-the-unit-shell>

We will prescribe the perturbed observer at its terminal point and solve backwards.
  First we construct its geodesic vector field with $v$ as time and estimate its difference from the background
  field. Lemma 18 applies without any assumption on parallel-frame curvature.
  With $U = dot(gamma)_w$, its conclusions are

#[#set math.equation(numbering: n => "(7.8)")
 $ Xi = dot(theta) - b dot(u) \, wide p = a dot(v) asymp 1 \, wide P_A = gamma_(A B) Xi^B \,
   wide \| P \| + \| Xi \| + \| dot(u) \| lt.eq C \, wide a \( p_T \) asymp e^(- kappa T) . $ <attach:branch-variables>]

The angular path has a limit. In canonical cotangent coordinates $pi = pi_u thin d u + z thin d v +
  P_A thin d theta^A$, where $z = pi_v$, the sign of the shifted momentum is

#[#set math.equation(numbering: n => "(7.9)")
 $ p = - \( pi_u + b^A P_A \) . $ <attach:shifted-momentum>]

The background unit shell and its $v$-time Hamiltonian are

#[#set math.equation(numbering: n => "(7.10)")
 $ 2 p z + a \( 1 + gamma^(A B) P_A P_B \) = 0 \, wide cal(H)_0 = - z_0 =
   frac(a \( 1 + gamma^(A B) P_A P_B \), 2 p) . $ <attach:background-shell>]

The phase variables for this Hamiltonian are $Y = \( u \, theta \, pi_u \, P \)$; $v$ is the time variable.

Along the background track $z_0 = O \( a \)$, whereas its perturbation may be larger than $a$.
  We therefore estimate $z = pi_v$ itself, rather than $z \/ a$.
  The next two lemmas put the background track in a fixed state tube and construct a future-pointing perturbed
  root there. Their output is a $v$-time vector field whose absolute difference from the background is at most
  $epsilon_T e^(o \( T \))$; this is the error that will be integrated when returning the observer to the initial
  surface.

#thm([Lemma 7.3.])[
  (A fixed canonical tube).  #emph[There are a fixed late $v_0$ and a fixed bounded open canonical state set
    $cal(K)$ such that the late track stays a fixed positive distance from $partial cal(K)$,
    its positions lie in one angular coordinate chart, and $p \( v \, Y \) gt.eq p_(*) > 0$ for every $v gt.eq
    v_0$ and $Y in cal(K)$. On a slightly enlarged such set, the background canonical vector field $V_0$ has
#[#set math.equation(numbering: n => "(7.11)")
 $ \| V_0 \( v \, Y \) \| + \| D_Y V_0 \( v \, Y \) \| lt.eq C e^(- kappa v) e^(o \( v \)) = : Lambda \( v \) \,
   wide integral_(v_0)^oo Lambda \( v \) thin d v < oo . $ <attach:integrable-rate>]

 The expression $e^(o \( v \))$ here uses the current endpoint $v$, not the terminal experiment parameter $T$.]
] <attach:canonical-tube>

#proof[
  The state momenta and $u$ are bounded by Equation (7.8) and Equation (7.9).
    Choose $v_0$ so that the angular track is in an inner subchart about its limit,
    with a fixed coordinate margin. The bounded first derivatives of $b$ in Proposition 17 imply,
    on a fixed bounded momentum range and at the same $v$,
  $ \| p \( Y \) - p \( Y_0 \( v \) \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] \| u - u_0 \( v \) \| + \| theta -
    theta_0 \( v \) \| + \| pi_u - pi_(u \, 0) \( v \) \| + \| P - P_0 \( v \) \| #scale(x: 120%, y: 120%)[\)] \, $
  with $C$ independent of $v$. Choose $r_0 > 0$ smaller than the angular margin and than $inf
    p \( Y_0 \( v \) \) \/ \( 2 C \)$. On every radius-$r_0$ neighborhood of $Y_0 \( v \)$,
    the momentum $p$ then stays uniformly positive. This is a pointwise tube choice and entails no multiplication
    of $C$ by the length of the late interval.
  Twice differentiating the Hamiltonian in Equation (7.10) uses a fixed finite number of ordinary background jets
    and bounded inverse powers of $p$. Every derivative of $a$ retains $a$,
    and all remaining fixed jets cost $e^(o \( v \))$ on a bounded $u$ interval by Proposition 17.
    Thus both the Hamiltonian vector field and its first state derivative retain $a asymp e^(- kappa v)$,
    which proves Equation (7.11) on these constant-radius neighborhoods.
    In particular $Y_0 \( v \)$ has a limit $Y_oo$. Increase $v_0$ until $\| Y_0 \( v \) -
    Y_oo \| < r_0 \/ 8$ throughout the tail. A fixed ball $cal(K)$ of radius $r_0 \/
    4$ about $Y_oo$ then contains the track with margin $r_0 \/ 8$,
    and even its radius-$r_0 \/ 2$ enlargement lies in the already controlled radius-$r_0$ neighborhood of
    $Y_0 \( v \)$ for every $v$. This gives a state domain independent of both $v$ and $T$. ◻
]

Near the finite experiment set

#[#set math.equation(numbering: n => "(7.12)")
 $ S_T^plus.minus = g^(- 1) g_T^plus.minus \, wide I_T^plus.minus = \( S_T^plus.minus \)^(- 1 \/ 2) .
   $ <attach:isometry>]

The inverse square root is the real analytic branch at the identity, defined by its convergent power series.
  Since $S_T^plus.minus$ is $g$-self-adjoint, so is $I_T^plus.minus$, and the two commute. Consequently

$ g_T^plus.minus \( I_T^plus.minus V \, I_T^plus.minus W \) =
  g \( S_T^plus.minus I_T^plus.minus V \, I_T^plus.minus W \) = g \( V \, W \) . $

It is future-preserving by continuity from the identity. In a background normalized orthonormal angular frame,
  the background Gram matrix is constant. Differentiating the power series and using Equation (7.1) therefore
  gives, at the fixed orders used below,

#[#set math.equation(numbering: n => "(7.13)")
 $ lr(bar.v.double I_T^plus.minus - "Id" bar.v.double)_(C_(upright("norm"))^30) +
   lr(bar.v.double \( g_T^plus.minus \)^(- 1) - g^(- 1) bar.v.double)_(C_(upright("norm"))^30) lt.eq
   epsilon_T e^(o \( T \)) . $ <attach:isometry-bound>]

The inverse-metric norm refers to coefficients in the normalized vector basis,
  rather than coordinate inverse components. We decrease $c$ if needed to absorb these fixed-order factors when
  using Equation (7.13) as a terminal bound.

#thm([Lemma 7.4.])[
  (The absolute future root).  #emph[On the fixed canonical tube of Lemma 31,
    intersected with the actual deep domain, the new unit shell has a simple root $z =
    z_T^plus.minus \( v \, Y \)$ close to $z_0 \( v \, Y \)$, with
#[#set math.equation(numbering: n => "(7.14)")
 $ lr(bar.v.double z_T^plus.minus - z_0 bar.v.double)_(C_Y^2) lt.eq epsilon_T^(upright("sh")) \, wide
   epsilon_T^(upright("sh")) = epsilon_T e^(o \( T \)) . $ <attach:root-bound>]

 The associated canonical vector field satisfies $\| V_T^plus.minus - V_0 \| lt.eq C epsilon_T^(upright("sh"))$.
   On this root $d v \/ d tau > 0$. The estimates concern $pi_v$ itself.]
] <attach:absolute-shell>

#proof[
  Put $g' = g_T^plus.minus$. Choose a background angular orthonormal frame $e_A$ in the fixed chart and write
    $P_(\( A \)) = pi \( e_A \)$. Let $Q^(alpha beta)$ be the symmetric coefficients of $g' ""^(- 1) -
    g^(- 1)$ in the vector basis $\( a^(- 1 \/ 2) L_0 \, a^(- 1 \/ 2) L_1 \, e_A \)$.
    They and the required ordinary jets are $O \( epsilon_T e^(o \( T \)) \)$.
    Multiplication of the new shell by $a$ gives the exact equation
  #[#set math.equation(numbering: n => "(7.15)")
   $ cal(F)_T \( v \, Y \, z \) = 2 p z + a \( 1 + gamma^(A B) P_A P_B \) + Delta_T \( v \, Y \, z \) = 0 \, wide
     Delta_T = a \( g' ""^(- 1) - g^(- 1) \) \( pi \, pi \) . $ <attach:multiplied-shell>]
  Keeping all powers of $a$, its last term is the polynomial
  #[#set math.equation(numbering: n => "(7.16)")
   $ Delta_T =  & Q^00 p^2 - 2 Q^01 p z + Q^11 z^2 - 2 sqrt(a) thin Q^(0 A) p P_(\( A \)) +
     2 sqrt(a) thin Q^(1 A) z P_(\( A \))\
 & #h(32mm)  + a Q^(A B) P_(\( A \)) P_(\( B \)) . $ <attach:shell-polynomial>]
  This follows from $pi \( L_0 \) = - p$ and $pi \( L_1 \) = z$.
    It displays the coefficients of sizes $epsilon_T$, $sqrt(a) thin epsilon_T$,
    and $a epsilon_T$ before their fixed-order losses. In particular the coefficient of $z^2$ is allowed to be nonzero.
  On bounded $\( Y \, z \)$ sets, ordinary and state differentiation of this polynomial gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ \| partial_v^(j_0) D_Y^(j_1) partial_z^(j_2) Delta_T \| lt.eq
     C_j epsilon_T e^(o \( T \)) quad \( j_0 + j_1 + j_2 lt.eq 3 \) . $ <attach:polynomial-jets>]
  A derivative of $sqrt(a)$ or $a$ retains that factor; a derivative of $p$ uses $b$ and its ordinary derivatives;
    the angular orthonormalization uses only fixed-order background jets.
    Thus frame differentiation introduces no additional inverse power of $a$.
    The two null covector factors have already been cancelled by the external $a$ in Equation (7.15).
  Fix a bounded $z$ interval containing $z_0$ with a fixed margin. For large $T$, Equation (7.17) implies
  #[#set math.equation(numbering: n => "(7.18)")
   $ partial_z cal(F)_T = 2 p + partial_z Delta_T gt.eq p_(*) > 0 . $ <attach:simple-root>]
  The values at $z_0 plus.minus C epsilon_T^(upright("sh"))$ have opposite signs for $C$ large,
    so there is a unique root in this neighborhood. Implicit differentiation,
    using the denominator in Equation (7.18), proves Equation (7.14);
    any finite background jet factors in the resulting products are absorbed in the displayed $e^(o \( T \))$.
    The reduced Hamiltonian is $cal(H)_T^plus.minus = - z_T^plus.minus$,
    which gives the asserted vector-field bound. This reasoning does not claim that $z_T^plus.minus -
    z_0$ is small relative to $a$.
  To check both the parametrization and its time orientation,
    let $cal(H)_(upright("aff")) = \( g' ""^(- 1) \( pi \, pi \) + 1 \) \/ 2$ be the affine geodesic Hamiltonian.
    Since $a$ is independent of $z$,
  #[#set math.equation(numbering: n => "(7.19)")
   $ partial_z cal(F)_T = 2 a thin partial_z cal(H)_(upright("aff")) =
     2 a thin frac(d v, d tau) . $ <attach:future-root>]
  Equation (7.18) is therefore exactly the positive-$v$ branch condition.
    For the time orientation, the function $t = \( u + v \) \/
    2$ remains temporal under the small relative metric perturbation.
    At fixed position and angular momentum, $partial_(pi_u) p = - 1$, so the other momentum derivative gives
  $ 4 a frac(d t, d tau) = partial_(pi_u) cal(F)_T + partial_z cal(F)_T = 2 p - 2 z + partial_(pi_u) Delta_T +
    partial_z Delta_T gt.eq 2 p_(*) - C epsilon_T^(upright("sh")) > 0 . $
  Here $z_0 lt.eq 0$, $\| z - z_0 \| lt.eq epsilon_T^(upright("sh"))$,
    and Equation (7.17) controls both error derivatives. Thus the root is future pointing using only absolute root
    closeness. The other canonical equations, divided by $d v \/ d tau$, are those of $-
    z_T^plus.minus$ by implicit differentiation of the shell.
    This remains true in the presence of the quadratic term in $z$. ◻
]

=== 7.3 Returning the observer to the initial surface <returning-the-observer-to-the-initial-surface>

The shell construction controls the geodesic vector field on a fixed state tube.
  We now choose the terminal unit tangent by the isometry $I_T^plus.minus$,
  follow that state backwards within the actual attached domain,
  and compare the resulting observer frame with the test norm.

#thm([Proposition 7.5.])[
  (Adaptive observer and test-frame comparison).  #emph[At $p_T$ put $U_T^plus.minus = I_T^plus.minus U$.
    There are seeds $w_T^plus.minus arrow.r w$ on $Sigma$ whose future unit geodesics in $cal(M)_(d_T^plus.minus)$
    reach $p_T$ with tangent $U_T^plus.minus$, at finite positive proper times strictly before their full-MGHD
    future durations. In particular $w_T^plus.minus$ belong to the original open seed set for all sufficiently
    large $T$.]
  #emph[Choose an angular orthonormal frame $e_A$ near $p_T$,
    including the packet polarization direction at the center, and set
#[#set math.equation(numbering: n => "(7.20)")
 $ E_0^plus.minus = I_T^plus.minus L_0 \, wide E_1^plus.minus = a^(- 1) I_T^plus.minus L_1 \, wide
   E_A^plus.minus = I_T^plus.minus e_A . $ <attach:adapted-frame>]

 At $p_T$ the Euclidean norm of components in this frame and the parallel positive test norm
   $k_(d_T^plus.minus \, w_T^plus.minus)$ are uniformly equivalent, with constants independent of $T$.
   Their induced operator norms are uniformly equivalent as well.]
] <attach:observer>

#proof[
  #emph[Terminal state.] The normalized components of $U$ at $p_T$ are
  $ sqrt(a_p) thin dot(u) \, wide p \/ sqrt(a_p) \, wide Xi^(\( A \)) \, wide a_p = a \( p_T \) \, $
  and hence have size $O \( a_p^(- 1 \/ 2) \)$. The new covector is $pi' =
    g_T^plus.minus \( I_T^plus.minus U \, dot.op \) = g \( U \, \( I_T^plus.minus \)^(- 1) dot.op \)$.
    Equation (7.13) and the coordinate identities $partial_u = sqrt(a) thin hat(e)_0 -
    b^A partial_A$ and $partial_v = sqrt(a) thin hat(e)_1$ give
  #[#set math.equation(numbering: n => "(7.21)")
   $ \| Y_T^plus.minus \( T \) - Y_0 \( T \) \| lt.eq C epsilon_T \/ sqrt(a_p) = o \( 1 \) \, wide \| pi'_v -
     pi_v \| lt.eq C epsilon_T \, wide d v \( U_T^plus.minus \) =
     frac(p + O \( epsilon_T \), a_p) > 0 . $ <attach:terminal-state>]
  The terminal positions agree exactly, and the angular coordinate and orthonormal bases have bounded conversion
    matrices. The new covector satisfies the exact unit shell.
    It lies in the fixed bounded root interval and in the fixed state tube,
    so uniqueness in Lemma 32 places it on that lemma’s future root.
    The loss $a_p^(- 1 \/ 2)$ in the first estimate of Equation (7.21) is paid once, at this terminal conversion.
  #emph[Backward comparison on the actual domain.] Increase the fixed $v_0$ if necessary so that
    $\( v_0 + inf u \) \/ 2$ has a positive margin above zero.
    Choose the state tube with a smaller concentric tube around the background track,
    leaving a fixed boundary margin. For $v_0 lt.eq v lt.eq T$ the background spacetime track has the uniform gaps
  #[#set math.equation(numbering: n => "(7.22)")
   $ u_2 - u \( v \) - frac(c_0 t \( v \), T) & gt.eq u_2 - u_(*) - c_0 \/ 2 - O \( T^(- 1) \) \,\
T + c_2 - v - frac(c_0 t \( v \), T) & gt.eq c_2 - c_0 \/ 2 - O \( T^(- 1) \) \,\
L_T - t \( v \) & gt.eq c_0 \, wide t \( v \) gt.eq t \( v_0 \) > 0 . $ <attach:track-margins>]
  Here $u$ and $v$ increase along the background future timelike track.
    All four right-hand margins are positive after the original choice of $c_0$ and for large $T$.
  Solve backward from the terminal state only as long as the solution lies both in the fixed state tube and in the
    actual domain of Equation (7.6), stopping no later than $v_0$.
    On any such provisional interval split the field difference as
  $ V_T^plus.minus \( v \, Y_T^plus.minus \) - V_0 \( v \, Y_0 \) =
    #scale(x: 120%, y: 120%)[\(] V_T^plus.minus \( v \, Y_T^plus.minus \) -
    V_0 \( v \, Y_T^plus.minus \) #scale(x: 120%, y: 120%)[\)] +
    #scale(x: 120%, y: 120%)[\(] V_0 \( v \, Y_T^plus.minus \) - V_0 \( v \, Y_0 \) #scale(x: 120%, y: 120%)[\)] . $
  The first term is bounded by $C epsilon_T^(upright("sh"))$ and the second by $Lambda \( v \) \| Y_T^plus.minus -
    Y_0 \|$. Only the background Lipschitz constant is integrated.
    Backward Gronwall gives, uniformly in the provisional stopping point,
  #[#set math.equation(numbering: n => "(7.23)")
   $ sup_(v lt.eq s lt.eq T) \| Y_T^plus.minus \( s \) - Y_0 \( s \) \| lt.eq
     exp #h(-0.16667em) (integral_(v_0)^oo Lambda \( s \) thin d s) C
     (epsilon_T / sqrt(a_p) + T epsilon_T^(upright("sh"))) = : delta_T arrow.r 0 . $ <attach:backward-error>]
  For large $T$, this is smaller than half every state-tube margin and every spacetime margin in Equation (7.22).
    It therefore excludes a first stop at the state boundary, either tilted side, the top time cut, or $t = 0$.
    At a finite remaining interior endpoint the smooth finite-$T$ canonical ODE continues inside its actual
    domain. Thus the solution reaches $v = v_0$. The argument has not extended a perturbed vector field beyond the
    constructed spacetime to justify its own estimate.
  #emph[Return through the earlier compact segment.] From the fixed section $v =
    v_0$ to $Sigma$ the background observer runs along a fixed compact segment.
    Choose a compact flow neighborhood with strict margins in the entry and lower matching collars;
    the crossings of $cal(S)$ and $Sigma$ are transverse, since the tangent is timelike and both hypersurfaces are
    spacelike. For large $T$ its bounded-$v$ deep portion lies below $\( 1 - nu_0 \) T$,
    and all its lower causal shadows lie in the protected ball of Equation (7.2).
    Exact earlier entry agreement from Proposition 24, the support conclusion of Proposition 27,
    and the attachment therefore identify this entire neighborhood with the background one.
    Finite-time smooth geodesic flow dependence carries the convergent states at $v_0$ through these collars to
    seeds $w_T^plus.minus arrow.r w$. This compact observer segment is distinct from the packet’s moving entry
    foot near $v = T$.
  The constructed path is a future unit geodesic of the attached vacuum metric.
    Equation (7.19) also gives $d tau \/ d v = 2 a \/ partial_z cal(F)_T$ on its late portion,
    so every finite experiment has finite proper duration. Its earlier portion has finite duration by smooth
    compact flow dependence. At $p_T$ there is an open observation neighborhood in the attached spacetime,
    so local geodesic continuation extends it for a positive further proper time.
    Proposition 29 embeds this path and its continuation into the full MGHD.
    Its observation time is therefore strictly below the full-MGHD endpoint.
    Openness of the original seed set gives membership of $w_T^plus.minus$ for large $T$.
  #emph[Comparison with the norm in the test.] The frame in Equation (7.20) has the fixed Lorentz Gram matrix
  $ g_T^plus.minus \( E_0^plus.minus \, E_1^plus.minus \) = - 1 \, wide
    g_T^plus.minus \( E_A^plus.minus \, E_B^plus.minus \) = delta_(A B) \, $
  with all other entries zero. By isometry, the components of $U_T^plus.minus$ in it are precisely
    $\( dot(u) \, p \, Xi^(\( A \)) \)$, bounded by Equation (7.8).
    They belong to a compact subset of the unit future timelike hyperboloid. It follows that the positive form
  $ r_(U_T^plus.minus) = g_T^plus.minus + 2 g_T^plus.minus \( dot.op \, U_T^plus.minus \) ⊗
    g_T^plus.minus \( dot.op \, U_T^plus.minus \) $
  is uniformly equivalent at $p_T$ to the Euclidean component form:
    it is positive definite for every unit timelike vector, and its largest and smallest eigenvalues vary
    continuously on this compact set. Both this form and the test form are parallel along the observing geodesic.
    At $Sigma$ their comparison is uniform because $d_T^plus.minus arrow.r d$ and $w_T^plus.minus arrow.r w$;
    equivalently use Lemma 5. Parallel transport preserves the comparison constants.
    This proves the norm assertion and, by applying it to a vector and its image,
    the induced operator-norm assertion. A smooth $e_A$ with the stipulated central direction and fixed jets of
    cost $e^(o \( T \))$ is obtained by Gram–Schmidt in the angular chart followed by a constant orthogonal rotation. ◻
]

== 8 Signed curvature separation and small loops <holo:section>

Fix a datum $d$, a noncorner branch seed $w$, and a finite data order $m gt.eq 10$.
  We use the signed experiments of Proposition 27 and their attachment and observers in Propositions 29 and 33.
  The observation point is $p_T$, with $v \( p_T \) = T$ and

$ a_p = a \( p_T \) asymp e^(- kappa T) \, wide A_T = e^(- 7 kappa T \/ 8) \, wide lambda_T = e^(zeta T) . $

All estimates below concern a coordinate box of fixed positive size about $p_T$,
  contained with strict margins in the attached future development.
  On this box $a \/ a_p$ and $a_p \/ a$ are bounded. A member of a fixed finite angular atlas contains a smaller
  such box; its constants can be maximized over the atlas. All derivatives denoted by $D$ are ordinary coordinate
  derivatives in this box.

Let $k_T^plus.minus = g_T^plus.minus - g$ be the physical metric differences,
  and let $h_T^(upright(p))$ be the physical linear packet.
  Their arrays in the background normalized frame are respectively $H_T^plus.minus$ and $q_T$.
  Thus the arrays of $k_T^plus.minus minus.plus h_T^(upright(p))$ are $F_T^plus.minus$,
  and $F_T^(upright("odd")) = F_T^(+) - F_T^(-)$. This distinguishes a tensor from its relative array whenever
  slots are evaluated. The estimates already proved imply, for some $c > 0$,

#[#set math.equation(numbering: n => "(8.1)")
 $ parallel H_T^plus.minus parallel_(C^30) & lt.eq e^(- \( kappa \/ 2 + c \) T) \,\
e^(o \( T \)) #scale(x: 120%, y: 120%)[\(] parallel F_T^(upright("odd")) parallel_(C^2) +
  parallel H_T^(+) parallel_(C^2)^2 + parallel H_T^(-) parallel_(C^2)^2 #scale(x: 120%, y: 120%)[\)] & =
  o \( A_T \) . $ <holo:relative-small>]

Here and below $e^(o \( T \))$ refers to the fixed finite orders in use. These two estimates have different roles.
  The bound $H_T^plus.minus = o \( sqrt(a) \)$ implied by Equation (8.1) controls the connection after passing to
  the observer frame, just as it controlled the terminal state conversion in Section 7.
  Equation (8.1) makes the odd error and the quadratic curvature remainder smaller than the linear amplitude
  $A_T$. It follows from Equation (6.3), including its fixed-order subexponential factors.
  The individual errors $F_T^plus.minus$ need not be smaller than the packet.

Choose a smooth $gamma$-orthonormal angular frame $e_2 \, e_3$, with $e_2 \( p_T \) = X_T$,
  the polarization direction in Proposition 21. Gram–Schmidt in the fixed atlas and a constant orthogonal rotation
  give ordinary jets of size $e^(o \( T \))$. Put $hat(e)_i = a^(- 1 \/ 2) L_i$ for $i = 0 \, 1$ and $hat(e)_A =
  e_A$ for $A = 2 \, 3$. Its Lorentz Gram matrix $eta$ is constant:
  $eta_01 = eta_10 = - 1$, $eta_22 = eta_33 = 1$, and the other entries vanish.
  Re-express $H_T^plus.minus \, q_T \, F_T^plus.minus$ in this angular frame, retaining their notation.
  The frame change and its inverse have subexponential fixed jets, so Equations (8.1)–(8.1) remain valid,
  with $c$ decreased if necessary. Define

#[#set math.equation(numbering: n => "(8.2)")
 $ I_T^plus.minus = \( g^(- 1) g_T^plus.minus \)^(- 1 \/ 2) \, wide E_0^plus.minus = I_T^plus.minus L_0 \, quad
   E_1^plus.minus = a^(- 1) I_T^plus.minus L_1 \, quad E_A^plus.minus = I_T^plus.minus e_A . $ <holo:frames>]

The inverse square root is the analytic branch at the identity.
  It is an isometry from $g$ to $g_T^plus.minus$, so these frames also have Gram matrix $eta$.
  By Proposition 33, their Euclidean component norms at $p_T$ are uniformly comparable to the positive test norm
  for the adaptive seeds $w_T^plus.minus arrow.r w$.

=== 8.1 Separation of a scaled curvature component <separation-of-a-scaled-curvature-component>

We first take the difference of the two scaled curvature observations,
  then read the selected observation from finite jets of a family of loops.
  The geometric input is Proposition 21, whose proof requires no bound on the observer’s background curvature.

#thm([Lemma 8.1.])[
  (Smooth scaled curvature dependence).  #emph[At $p_T$ define
#[#set math.equation(numbering: n => "(8.3)")
 $ C_T^plus.minus =
   a_p^2 "Riem" \( g_T^plus.minus \) \( E_1^plus.minus \, E_2^plus.minus \, E_1^plus.minus \, E_2^plus.minus \) .
   $ <holo:scaled-curvature>]

 There is a smooth function $cal(C)_T$ of the relative metric array and its ordinary jets through order two such
   that $C_T^plus.minus = cal(C)_T \( H_T^plus.minus \)$. On a fixed small neighborhood of the zero relative array
   its first two derivatives have norm at most $e^(o \( T \))$. Consequently
#[#set math.equation(numbering: n => "(8.4)")
 $ C_T^(+) - C_T^(-) = 2 D cal(C)_T \( 0 \) \[ q_T \] + o \( A_T \) . $ <holo:signed-taylor>]

]
] <holo:curvature-functional>

#proof[
  We give the scaling calculation behind the assertion. Set $Z_alpha = sqrt(a) thin hat(e)_alpha$,
    and let $V_alpha$ be the matrices of $nabla_(Z_alpha)^g$ on the $hat(e)$ frame.
    The coefficient estimates of Lemma 20 bound $V$, the coefficients of $\[ Z_alpha \, Z_beta \]$ in $Z$,
    their required ordinary jets, and the normalized entries of $a "Riem" \( g \)$ by $e^(o \( T \))$.
    Relative derivatives of $a$ have the same bound. These are the coefficient inputs in #cite(label("Foundation")).
  For an arbitrary small relative change $H$, write $M = eta +
    H$ and let $k$ be the physical tensor with relative array $H$.
    The connection difference $K = nabla^(g + k) - nabla^g$ satisfies
  $
    2 \( g + k \) \( K \( V \, W \) \, Y \) = \( nabla_V^g k \) \( W \, Y \) + \( nabla_W^g k \) \( V \, Y \) - \(
    nabla_Y^g k \) \( V \, W \) . $
  On normalized slots, multiplication by $sqrt(a)$ replaces each derivative on the right by a $Z$ derivative.
    More explicitly, put
  $ cal(D)_alpha H_(beta delta) = Z_alpha H_(beta delta) - \( V_alpha \)^rho zws_beta
    H_(rho delta) - \( V_alpha \)^rho zws_delta H_(beta rho) . $
  The array $W$ of $sqrt(a) K$ is therefore
  #[#set math.equation(numbering: n => "(8.5)")
   $ W^mu zws_(alpha beta) = 1 / 2 \( M^(- 1) \)^(mu delta) #scale(x: 120%, y: 120%)[\(] cal(D)_alpha
     H_(beta delta) + cal(D)_beta H_(alpha delta) - cal(D)_delta H_(alpha beta) #scale(x: 120%, y: 120%)[\)] .
     $ <holo:connection-difference>]
  Thus $V + W$ is the connection of $g + k$, differentiated along $Z$ and expressed in the unchanged normalized
    frame. If $\[ Z_alpha \, Z_beta \] = b^rho zws_(alpha beta) Z_rho$, its curvature matrix is
  #[#set math.equation(numbering: n => "(8.6)")
   $ R^(g + k) \( Z_alpha \, Z_beta \) = Z_alpha \( V_beta + W_beta \) -
     Z_beta \( V_alpha + W_alpha \) + \[ V_alpha + W_alpha \, V_beta + W_beta \] -
     b^rho zws_(alpha beta) \( V_rho + W_rho \) . $ <holo:scaled-curvature-formula>]
  Its entries are smooth functions of $H \, D H \, D^2 H$ with subexponential coefficients, since $Z_i =
    L_i$ and $Z_A = sqrt(a) e_A$ have such coordinate jets. Contracting with $M$ gives every normalized covariant
    entry of $a "Riem" \( g + k \)$. The isometry $I \( H \)$ is likewise an analytic function of $eta^(- 1) H$;
    hence including its four slots preserves these bounds.
  At $p_T$, Equation (8.3) equals $a_p$ times the curvature on slots $I \( H \) hat(e)_1 \, I \( H \) e_2 \,
    I \( H \) hat(e)_1 \, I \( H \) e_2$. Equations (8.5) and (8.6) therefore prove the claimed jet dependence and
    derivative bounds. This controls the scaled background coefficients;
    it does not assert bounded curvature in the boosted observer frame.
  Taylor’s formula at zero, applied separately to the two signs, gives
  $ C_T^(+) - C_T^(-) = 2 D cal(C)_T \( 0 \) \[ q_T \] + D cal(C)_T \( 0 \) \[ F_T^(upright("odd")) \] +
    cal(E)_T \, wide \| cal(E)_T \| lt.eq
    e^(o \( T \)) \( parallel H_T^(+) parallel_(C^2)^2 + parallel H_T^(-) parallel_(C^2)^2 \) . $
  Equation (8.1) proves Equation (8.4). The common term $cal(C)_T \( 0 \)$ has canceled exactly. ◻
]

#thm([Proposition 8.2.])[
  (Signed signal).  #emph[For every sufficiently large $T$, at least one sign satisfies $\| C_T^plus.minus \| > A_T$.]
] <holo:signal>

#proof[
  We compute the linear term in Equation (8.4). Up to the curvature sign convention,
    the principal second derivative part of the variation on the physical slots $L_1 \, X_T \, L_1 \, X_T$ is
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] nabla_1 nabla_1 h_(X X) + nabla_X nabla_X h_11 -
    2 nabla_1 nabla_X h_(1 X) #scale(x: 120%, y: 120%)[\)] . $
  The packet from Proposition 21 is
  $ h_T^(upright(p)) = A_T "tr.rev."_g "Re" (e^(i lambda_T v) sum_(j = 0)^N lambda_T^(- j) p_j) . $
  The finite $N$ has already been fixed. Each amplitude has fixed ordinary normalized jets of size
    $e^(o \( T \))$; $p_0$ is trace-free and annihilates $L_0$.
    Since $d v \( L_1 \) = 1$ and $d v \( X_T \) = 0$, only the two phase derivatives on the $X
    X$ entry contribute order $A_T lambda_T^2$. The leading trace reversal has no effect.
    All terms with a derivative on an amplitude or connection, all $j gt.eq 1$ terms,
    and the variation of the four isometry slots on the scaled background curvature have at most order $A_T
    lambda_T e^(o \( T \))$. The last assertion also follows directly from Equation (8.6):
    differentiation of $I \( H \)$ is algebraic and so creates no phase derivative. We obtain
  #[#set math.equation(numbering: n => "(8.7)")
   $ D cal(C)_T \( 0 \) \[ q_T \] = plus.minus 1 / 2 A_T lambda_T^2 "Re" #scale(x: 120%, y: 120%)[\(]
     e^(i lambda_T T) p_0 \( X_T \, X_T \) #scale(x: 120%, y: 120%)[\)] +
     O \( A_T lambda_T e^(o \( T \)) \) . $ <holo:linear-signal>]
  The choice of direction and constant complex phase in Proposition 21 makes the real contraction here equal to a
    positive $sigma_T$ with $sigma_T$ and $sigma_T^(- 1)$ of size $e^(o \( T \))$.
    The source construction’s observer-orthogonal screen representative differs from the angular $X_T$ by a
    multiple of $L_0$; its contraction with $p_0$ is identical because $p_0 \( L_0 \, dot.op \) = 0$.
    Thus the polarization input precedes, and does not use, the bounded-curvature hypothesis in the tidal
    application of #cite(label("Foundation")). Since $lambda_T = e^(zeta T)$ with fixed $zeta > 0$,
  $ frac(A_T lambda_T e^(o \( T \)), A_T lambda_T^2 sigma_T) = e^(- zeta T + o \( T \)) arrow.r 0 \, wide
    lambda_T^2 sigma_T arrow.r oo . $
  Equation (8.4) now gives $\| C_T^(+) - C_T^(-) \| > 2 A_T$ for large $T$,
    proving the claim by the triangle inequality. ◻
]

=== 8.2 Connection bounds in the observer frame <connection-bounds-in-the-observer-frame>

The loop estimates will be used to recover a quadratic holonomy coefficient from finitely many small values.
  If its eighteenth parameter derivative is controlled, interpolation gives an upper bound of size
  $e^(o \( T \)) \( a_p \/ h + h^16 \)$. We will take $h = e^(- kappa T \/ 16)$:
  both terms are then $o \( A_T \)$, since $a_p asymp e^(- kappa T)$ and $A_T = e^(- 14 kappa T \/ 16)$.
  This is the reason for controlling eighteen holonomy derivatives;
  the twenty connection derivatives below leave the needed ODE buffer.
  We first show that the large boost in the observer frame does not spoil those bounds.

Fix a sign given by Proposition 35, and abbreviate its metric, isometry, and frame by $g'$, $I$, and $E$. Set

#[#set math.equation(numbering: n => "(8.8)")
 $ f_alpha = a_p E_alpha \, wide nabla_(f_alpha)^(g') E_beta = G^mu zws_(alpha beta) E_mu . $ <holo:loop-frame>]

The number $a_p$ is held constant on the box.

#thm([Lemma 8.3.])[
  (Connection and bracket jets).  #emph[The coordinate components of $f_alpha$,
    the arrays $G^mu zws_(alpha beta)$, and the coefficients $B^mu
    zws_(alpha beta)$ of $\[ f_alpha \, f_beta \]$ in the $f$ frame have ordinary jets through order twenty
    bounded by $e^(o \( T \))$.]
] <holo:boosted-control>

#proof[
  Write $tilde(e)_alpha = I hat(e)_alpha$ and let $tilde(V)^mu zws_(alpha beta)$ be defined by
  $ nabla_(sqrt(a) thin tilde(e)_alpha)^(g') tilde(e)_beta = tilde(V)^mu zws_(alpha beta) tilde(e)_mu . $
  Equation (8.5), the change of frame formula, and Equation (8.1) give
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel tilde(V) - V parallel_(C^20) + parallel I - "Id" parallel_(C^21) lt.eq
     e^(- \( kappa \/ 2 + c_1 \) T) $ <holo:perturbed-connection-small>]
  for some $c_1 > 0$, with $I - "Id"$ expressed in normalized entries.
    Indeed the change of frame formula uses $I \, I^(- 1) \, Z I$ and the matrices $V + W$;
    every difference has a factor $H$ or $D H$. Twenty derivatives use at most twenty-one metric derivatives;
    the thirty-derivative input leaves a buffer. Multiplication by any fixed collection of background
    $e^(o \( T \))$ factors only reduces $c$ to a smaller positive $c_1$.
  Put
  $ s_0 = 1 / 2 \, wide s_1 = - 1 / 2 \, wide s_2 = s_3 = 0 \, wide E_alpha = a^(s_alpha) tilde(e)_alpha . $
  The full conversion formula is
  #[#set math.equation(numbering: n => "(8.10)")
   $ G^mu zws_(alpha beta) = a_p / a a^(1 \/ 2 + s_alpha + s_beta - s_mu) tilde(V)^mu zws_(alpha beta) +
     s_beta \( f_alpha log a \) delta_beta^mu . $ <holo:boost-conversion>]
  There are precisely seven triples with negative exponent in the first term.
    The following table lists them all; $A = 2 \, 3$ in each of its last three rows.
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\( alpha \, beta \, mu \)$
], table.cell(rowspan: 1, colspan: 1)[exponent
], table.cell(rowspan: 1, colspan: 1)[number
], table.cell(rowspan: 1, colspan: 1)[reason for control
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[exact null metric compatibility
],
  table.cell(rowspan: 1, colspan: 1)[$\( A \, 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[exact null metric compatibility
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 1 \, A \)$
], table.cell(rowspan: 1, colspan: 1)[$- 1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[background null geodesic identity
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, A \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[background angular orthogonality
],
)
]
  For completeness, $s_alpha + s_beta$ belongs to ${ - 1 \, - 1 \/ 2 \, 0 \, 1 \/ 2 \, 1 }$.
    If $mu = 1$ the exponent is $1 + s_alpha + s_beta gt.eq 0$.
    If $mu$ is angular it is negative only when $alpha = beta = 1$.
    If $mu = 0$ it equals $s_alpha + s_beta$, negative only for $\( 1 \, 1 \) \, \( 1 \, A \) \, \( A \, 1 \)$.
    This proves exhaustiveness.
  Nullness gives, for every $alpha$,
  $ 0 = 1 / 2 sqrt(a) thin tilde(e)_alpha g' \( tilde(e)_1 \, tilde(e)_1 \) =
    g' \( nabla_(sqrt(a) tilde(e)_alpha)^(g') tilde(e)_1 \, tilde(e)_1 \) = - tilde(V)^0 zws_(alpha 1) . $
  Thus the first three individual entries vanish identically for the perturbed metric,
    together with every derivative. In the other four entries only the background vanishes.
    In fact $L_1 = partial_v$ in the optical metric satisfies $nabla_(L_1)^g L_1 = \( L_1 log a \) L_1$,
    so $V^A zws_11 = 0$. Differentiating $g \( hat(e)_1 \, e_A \) = 0$ along $L_1$ then gives $V^0 zws_(1 A) = 0$.
    These are identities throughout the box, hence their ordinary derivatives also vanish.
    Equation (8.9) therefore bounds all four remaining perturbed entries.
    Their worst multiplier is $a^(- 1 \/ 2)$, leaving
  $ a^(- 1 \/ 2) e^(- \( kappa \/ 2 + c_1 \) T) = O \( e^(- c_1 T) \) $
  on this box. Derivatives of the boost factors retain these powers, because $D^j a^r =
    a^r e^(o \( T \))$ at every fixed order. Thus all twenty derivatives of the seven entries are controlled.
  We also verify the coordinate bounds used in the diagonal term of Equation (8.10).
    A normalized radial basis vector has coordinate size $a^(- 1 \/ 2) e^(o \( T \))$,
    whereas an angular one has size $e^(o \( T \))$. For a term with input label $alpha$ and normalized output
    label $rho$, the largest coordinate multiplier is $a_p a^(s_alpha - 1 \/ 2)$ if $rho$ is radial,
    and $a_p a^(s_alpha)$ if it is angular. As $a asymp a_p$,
    their worst powers are respectively $a^0$ and $a^(1 \/ 2)$, both attained when $alpha = 1$.
    Consequently the coordinates of $f$ and their twenty derivatives are $e^(o \( T \))$.
    The same holds for $f_alpha log a$ by the relative derivative bounds for $a$.
    The nonnegative exponents in Equation (8.10) are now controlled as well.
  Finally, torsion-freeness and constancy of $a_p$ give the exact identity
  #[#set math.equation(numbering: n => "(8.11)")
   $ \[ f_alpha \, f_beta \] = \( G^mu zws_(alpha beta) - G^mu zws_(beta alpha) \) f_mu . $ <holo:bracket>]
  There is no factor $a_p^(- 1)$. This proves the bracket jet bounds without estimating the inverse coordinate
    matrix of $f$. ◻
]

=== 8.3 The parameter-dependent flow and its developed length <the-parameter-dependent-flow-and-its-developed-length>

Set

#[#set math.equation(numbering: n => "(8.12)")
 $ h_T = e^(- kappa T \/ 16) . $ <holo:h-choice>]

For $0 lt.eq h lt.eq 17 h_T$, let

#[#set math.equation(numbering: n => "(8.13)")
 $ Psi_h \( s \, t \) = "Fl"_(h \( s f_1 + t f_2 \))^1 \( p_T \) \,
   wide \( s \, t \) in \[ 0 \, 1 \]^2 . $ <holo:surface>]

The vector field in this expression depends on the parameters $s \, t \, h$,
  and $"Fl"^1$ is its actual time-one flow. Let $ell_h$ be the image of the positively oriented square boundary,
  based at $\( 0 \, 0 \)$, and let $cal(H)_T \( h \)$ be its parallel transport matrix in $E \( p_T \)$.
  Write $cal(L)_T \( h \)$ for its length in the positive metric obtained by continuing the test’s parallel metric
  along the loop from $p_T$.

#thm([Lemma 8.4.])[
  (Loop estimates).  #emph[For sufficiently large $T$, every loop in Equation (8.13) is defined inside the
    attached future observation box. There is $Q_T = e^(o \( T \))$ such that
#[#set math.equation(numbering: n => "(8.14)")
 $ cal(L)_T \( h \) lt.eq a_p h Q_T \, wide sup_(0 lt.eq h lt.eq 17 h_T) parallel cal(H)_T^(\( 18 \)) \( h \)
   parallel lt.eq Q_T . $ <holo:loop-estimates>]

 Moreover,
#[#set math.equation(numbering: n => "(8.15)")
 $ cal(H)_T \( 0 \) = "Id" \, wide 1 / 2 cal(H)''_T \( 0 \) =
   plus.minus a_p^2 R^(g') \( E_1 \, E_2 \) \( p_T \) $ <holo:second-coefficient>]

 as endomorphism matrices in the based frame.]
] <holo:loops>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((8.02, 4.25), [#text(size: 9pt)[$ Phi ( sigma , theta ) = "Fl"^1_( sigma f_1+ theta f_2)(p_T), f_i=a_"pE"_i$]])
  content((2.28, 3.55), [#text(size: 9pt)[Parameter square]])
  content((12.52, 3.55), [#text(size: 9pt)[Image surface \(schematic\)]])
  rect((0.8, 0.3), (3.5, 3), fill: rgb("#f7f7f7"), stroke: none)
  line((1.7, 0.3), (1.7, 3), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  line((2.6, 0.3), (2.6, 3), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  line((0.8, 1.2), (3.5, 1.2), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  line((0.8, 2.1), (3.5, 2.1), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  line((0.8, 0.3), (3.5, 0.3), (3.5, 3), (0.8, 3), close: true, stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10))
  line((0.8, 0.3), (2.32, 0.3), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  line((3.5, 0.3), (3.5, 1.82), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  line((3.5, 3), (1.98, 3), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  line((0.8, 3), (0.8, 1.48), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  circle((0.8, 0.3), radius: 0.05644, fill: black, stroke: none)
  content((0.8, 0.3), [#text(size: 9pt)[$(0,0)$]], anchor: "north-east", padding: 0.1176cm)
  content((3.5, 0.3), [#text(size: 9pt)[$(h,0)$]], anchor: "north-west", padding: 0.1176cm)
  content((3.5, 3), [#text(size: 9pt)[$(h,h)$]], anchor: "south-west", padding: 0.1176cm)
  content((0.8, 3), [#text(size: 9pt)[$(0,h)$]], anchor: "south-east", padding: 0.1176cm)
  content((2.15, 1.65), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$[0,h]^2$]]])])
  line((4.63, 1.77), (8.65, 1.77), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2117cm, fill: black)))
  content((6.64, 1.558), [#box(width: 4.085cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[time-one flow of#linebreak()the field#linebreak()$sigma f_1+ theta f_2$]]])], anchor: "north")
  merge-path({bezier((9.72, 0.37), (14.4, 0.65), (11.15, 0.8), (12.85, 0.1)); bezier((14.4, 0.65), (14.67, 2.85), (14.13, 1.31), (15.18, 2.03)); bezier((14.67, 2.85), (10.17, 3), (13.28, 3.27), (11.75, 2.53))}, close: true, fill: rgb("#f7f7f7"), stroke: none)
  bezier((11.23, 0.56), (11.64, 2.84), (11.02, 1.25), (11.88, 2.24), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  bezier((12.84, 0.4), (13.17, 3.01), (12.58, 1.3), (13.51, 2.24), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  bezier((9.72, 1.2), (14.45, 1.38), (11.2, 1.72), (13.01, 0.84), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  bezier((10.09, 2.12), (14.83, 2.11), (11.68, 2.52), (13.09, 1.71), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10))
  bezier((9.72, 0.37), (14.4, 0.65), (11.15, 0.8), (12.85, 0.1), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  bezier((14.4, 0.65), (14.67, 2.85), (14.13, 1.31), (15.18, 2.03), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  bezier((14.67, 2.85), (10.17, 3), (13.28, 3.27), (11.75, 2.53), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  bezier((10.17, 3), (9.72, 0.37), (10.62, 2.15), (9.37, 1.32), stroke: (paint: rgb("#262626"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#262626"))))
  circle((9.72, 0.37), radius: 0.0635, fill: black, stroke: none)
  content((10.26, 0.37), [#text(size: 9pt)[$p_T= Phi (0,0)$]], anchor: "north", padding: 0.1764cm)
  content((12.28, 1.72), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Phi ([0,h]^2)$]]])])
  content((12.51, -0.24), [#text(size: 9pt)[$ell_h= Phi ( partial [0,h]^2)$]], anchor: "north", padding: 0.1176cm)
  content((8.02, -1.26), [#text(size: 9pt)[$ frac(1, 2) cal(H)_T''(0) = plus.minus a_p^2R^(g')(E_1,E_2)(p_T), cal(L)_T(h) lt.eq a_"phQ"_T, Q_T=e^(o(T))$.]])
})],
  caption: [Figure 3: The loop surface of Equation (8.13), written on $\[ 0 \, h \]^2$ rather than the unit square. Each image point is the time-one flow of the single vector field $sigma f_1 + theta.alt f_2$ from $p_T$; the oriented boundary gives the based loop. The drawing is schematic, with $a_p$ constant on the observation box. Lemma 37 gives the quadratic holonomy coefficient (up to the stated sign convention) and the developed length in the transported test metric. ],
) <fig:parameter-flow-loop>

#proof[
  Finite products and sums of subexponential bounds remain subexponential;
    $Q_T$ may be increased finitely many times below. Use $r in \[ 0 \, 1 \]$ as the flow variable.
    With $c^alpha = h \( s delta_1^alpha + t delta_2^alpha \)$, the flow solves
  #[#set math.equation(numbering: n => "(8.16)")
   $ partial_r Psi = c^alpha f_alpha \( Psi \) \, wide Psi \( 0 \) = p_T . $ <holo:flow-ode>]
  Its coordinate speed and its position-Lipschitz coefficient are bounded by $h Q_T$.
    Since $17 h_T Q_T arrow.r 0$, the speed bound keeps the flow in the fixed strict box for the entire interval
    $\[ 0 \, 1 \]$; local existence and continuation give the stated time-one flow.
  Coordinate parameter derivatives are also controlled. A derivative of total order $n gt.eq
    1$ in $\( h \, s \, t \)$ satisfies a linear equation whose coefficient on its order-$n$ unknown is $c^alpha D
    f_alpha \( Psi \)$, of size $h Q_T$. Its other terms are finite products of derivatives of $f$ through order
    $n$, lower derivatives of $Psi$, and derivatives of the polynomial $c$.
    The initial derivatives vanish because $p_T$ is parameter independent.
    Induction through $n = 19$, using $exp \( O \( h Q_T \) \) lt.eq 2$ for large $T$,
    bounds each such derivative by $e^(o \( T \))$. This uses at most nineteen coordinate derivatives of $f$.
  The coordinate bounds alone do not give the desired physical length.
    To keep the factor $a_p$, consider the $s$ variation in the $f$ frame. Define $J_s \( r \)$ by the linear system
  #[#set math.equation(numbering: n => "(8.17)")
   $ frac(d J_s^gamma, d r) = h delta_1^gamma + c^alpha J_s^beta B^gamma zws_(beta alpha) \( Psi \( r \) \) \,
     wide J_s \( 0 \) = 0 . $ <holo:variation>]
  Then $J_s^beta f_beta \( Psi \)$ equals $partial_s Psi$: differentiating this vector using Equation (8.17) and
    the definition of the bracket cancels the frame derivative terms and gives exactly the coordinate variation
    equation of Equation (8.16), with the same zero initial value. Uniqueness proves the equality.
    This construction never estimates an inverse coordinate frame.
    The equation for $J_t$ has direct source $h delta_2^gamma$ and zero initial value.
    In particular these are inhomogeneous equations for the parameter-dependent flow;
    their homogeneous matrix has size $h Q_T$. Integration gives
  #[#set math.equation(numbering: n => "(8.18)")
   $ \| J_s \| + \| J_t \| lt.eq h Q_T . $ <holo:variation-bound>]
  Differentiate Equation (8.17) directly in $h$, including at $h = 0$.
    At derivative order $n$, the coefficient on $partial_h^n J$ is still $c^alpha B_(beta alpha) \( Psi \)$.
    Every other term contains a lower $h$ derivative of $J$, already bounded coordinate derivatives of $Psi$,
    and derivatives of $B$ of order at most $n$. The direct source has first derivative $delta_i$ and all higher
    derivatives zero. Thus induction gives
  $ sup_(r \, s \, t \, h) \| partial_h^n J_s \| + \| partial_h^n J_t \| lt.eq e^(o \( T \)) \, wide 1 lt.eq
    n lt.eq 18 . $
  No division by $h$ is used. The twenty-derivative bounds for $f \, B \,
    G$ allow the nineteen coordinate variation derivatives and the eighteen transport derivatives with a spare
    derivative.
  Parametrize each oriented boundary edge by $z in \[ 0 \, 1 \]$.
    Its tangent has the form $J^alpha f_alpha$, where $J$ is one of $plus.minus J_s$,
    $plus.minus J_t$ evaluated at $r = 1$ and at that edge. Parallel transport in the moving $E$ frame solves
  #[#set math.equation(numbering: n => "(8.19)")
   $ frac(d P, d z) = - cal(G) \( z \, h \) P \, wide cal(G)^mu zws_beta \( z \, h \) =
     G^mu zws_(alpha beta) \( Psi_h \) J^alpha . $ <holo:transport>]
  The undifferentiated coefficient is $O \( h Q_T \)$ by Equation (8.18);
    its first eighteen $h$ derivatives have size $e^(o \( T \))$.
    Fundamental matrices and their inverses are bounded by $exp \( O \( h Q_T \) \)$ on each edge.
    Differentiating Equation (8.19) $n$ times yields the same homogeneous coefficient on $partial_h^n P$ and source
  $ - sum_(j = 1)^n binom(n, j) \( partial_h^j cal(G) \) \( partial_h^(n - j) P \) . $
  Induction through $n = 18$, followed by multiplication of the four edge matrices,
    gives the derivative bound in Equation (8.14).
  At any point on the boundary the tangent has $E$-components $a_p J$.
    If $P$ denotes accumulated parallel transport from the base,
    its norm in the loop-parallel positive metric is its base norm after applying $P^(- 1)$,
    hence at most $C a_p \| P^(- 1) J \| lt.eq a_p h Q_T$ by the uniform base comparison and Equation (8.18).
    Summing the four unit edge intervals proves the length estimate in the actual test metric.
  Finally consider the two-parameter surface $Phi \( sigma \, theta.alt \) =
    "Fl"_(sigma f_1 + theta.alt f_2)^1 \( p_T \)$. Our loops are its boundaries of $\[ 0 \, h \]^2$.
    For each fixed $T$, pull back the connection and choose a smooth frame equal to $E \( p_T \)$ at the origin
    whose connection one-form vanishes there. Such a frame is obtained by prescribing its first derivative at the
    origin; no uniform estimate on that auxiliary choice is used.
    Its connection one-form is $O \( \| sigma \| + \| theta.alt \| \)$.
    Therefore ordered products of two edge integrals have order at least $h^4$,
    while Stokes’ formula gives the order-$h^2$ term as minus the curvature at the origin.
    The differential of $Phi$ there sends the coordinate vectors to $f_1 \( p_T \) \, f_2 \( p_T \)$.
    This proves Equation (8.15), with the sign accounting for orientation and curvature convention.
    The uniform derivative bound was proved separately in the original frame. ◻
]

=== 8.4 An exact eighteen-node formula <an-exact-eighteen-node-formula>

#thm([Lemma 8.5.])[
  (Extraction of the quadratic coefficient).  #emph[Let $F : \[ 0 \, 17 h \] arrow.r V$ be $C^18$,
    where $V$ is a finite-dimensional normed vector space and $h > 0$. Put
$ S_1 = sum_(r = 1)^17 1 / r \, wide S_2 = sum_(r = 1)^17 1 / r^2 \, wide c_0 = frac(S_1^2 - S_2, 2) \, wide c_j =
  frac(\( - 1 \)^j, j) binom(17, j) (S_1 - 1 / j) quad \( 1 lt.eq j lt.eq 17 \) . $

 Then the following identity holds with Bochner integrals in $V$:
#[#set math.equation(numbering: n => "(8.20)")
 $ frac(F'' \( 0 \), 2) = h^(- 2) sum_(j = 0)^17 c_j F \( j h \) -
   frac(h^(- 2), 17 !) sum_(j = 0)^17 c_j integral_0^(j h) \( j h - t \)^17 F^(\( 18 \)) \( t \) thin d t .
   $ <holo:exact-interpolation>]

 In particular, if $F \( 0 \) = 0$, $parallel F \( j h \) parallel lt.eq b j h$,
   and $sup parallel F^(\( 18 \)) parallel lt.eq M$, then
#[#set math.equation(numbering: n => "(8.21)")
 $ ∥frac(F'' \( 0 \), 2)∥ lt.eq K_1 b / h + K_2 M h^16 \, wide K_1 = sum_(j = 1)^17 \| c_j \| j \, quad K_2 =
   frac(1, 18 !) sum_(j = 1)^17 \| c_j \| j^18 . $ <holo:interpolation-bound>]

 Both constants are finite and independent of $F \, h \, T$.]
] <holo:interpolation>

#proof[
  Let $L_j \( x \) = product_(0 lt.eq r lt.eq 17 \, med r eq.not j) \( x - r \) \/ \( j - r \)$.
    The coefficient of $x^2$ in $L_0$ is $sum_(1 lt.eq r < s lt.eq 17) \( r s \)^(- 1) = c_0$.
    For $j gt.eq 1$, $L_j$ has a factor $x$, $L'_j \( 0 \) = \( - 1 \)^(j - 1) binom(17, j) \/ j$,
    and the logarithmic derivative at zero of its remaining product is $- S_1 + 1 \/ j$.
    The coefficient of $x^2$ is therefore $c_j$ as displayed. Lagrange interpolation gives the exact moment identities
  $ sum_(j = 0)^17 c_j j^k = cases(delim: "{", 1 \, & k = 2 \,, 0 \, & 0 lt.eq k lt.eq 17 \, k eq.not 2 .) $
  Apply these identities to the Taylor polynomial $sum_(k = 0)^17 F^(\( k \)) \( 0 \) t^k \/ k !$,
    evaluated at $t = j h$. Taylor’s integral remainder gives Equation (8.20).
    Bounding each remainder by $M \( j h \)^18 \/ 18 !$ gives Equation (8.21). ◻
]

#thm([Proposition 8.6.])[
  (Finite small-loop violation).  #emph[Fix a passing test $cal(A) \( O \, B \)$,
    a datum $d in cal(A) \( O \, B \)$, and a branch seed $w in O$ as in Corollary 15.
    For every finite $m gt.eq 10$ the signed experiments can be chosen with $p_m \( d_T^plus.minus - d \) arrow.r
    0$ such that, for every sufficiently large $T$, at least one of $d_T^(+)$ and $d_T^(-)$ does not belong to
    $cal(A) \( O \, B \)$.]
] <holo:violation>

#proof[
  Choose the sign in Proposition 35. Its adaptive seed $w_T$ is in $O$ for large $T$ and reaches $p_T$ in the full
    MGHD at a finite positive proper time, by Proposition 33.
    The loops in Lemma 37 lie entirely in $I^(+) \( Sigma \)$ of that development by Proposition 29.
    Their lengths tend to zero uniformly for $0 lt.eq h lt.eq 17 h_T$,
    so they satisfy the strict cutoff $cal(L)_T \( h \) < B^(- 1)$.
  Suppose the selected datum still belongs to $cal(A) \( O \, B \)$.
    Its loop inequality in Definition 6, the uniform frame comparison, and Equation (8.14) then give
  $ parallel cal(H)_T \( j h_T \) - "Id" parallel lt.eq a_p j h_T e^(o \( T \)) \, wide 0 lt.eq j lt.eq 17 . $
  The fixed constants, including $B$, have been included in $e^(o \( T \))$.
    Apply Lemma 38 with $F = cal(H)_T - "Id"$, $b = a_p e^(o \( T \))$, and $M = e^(o \( T \))$. Equation (8.15) gives
  #[#set math.equation(numbering: n => "(8.22)")
   $ parallel a_p^2 R^(g') \( E_1 \, E_2 \) \( p_T \) parallel & lt.eq e^(o \( T \)) \( a_p \/ h_T + h_T^16 \)\
 & lt.eq e^(o \( T \)) \( e^(- 15 kappa T \/ 16) + e^(- kappa T) \) = o \( A_T \) . $ <holo:curvature-upper>]
  Indeed $A_T = e^(- 14 kappa T \/ 16)$, so the two ratios have exponents $- kappa T \/ 16 + o \( T \)$ and $-
    kappa T \/ 8 + o \( T \)$, respectively. Both are strict, independent of the fixed interpolation constants.
  Because the Lorentz Gram matrix of $E$ is the constant matrix $eta$,
    the sectional component $a_p^2 "Riem" \( g' \) \( E_1 \, E_2 \, E_1 \, E_2 \)$ is a fixed matrix contraction
    of the endomorphism in Equation (8.22). It is therefore $o \( A_T \)$,
    contradicting $\| C_T^plus.minus \| > A_T$. The chosen sign fails the test.
    The convergence in the prescribed finite seminorm and membership in the admissible data neighborhood are those
    of the signed construction; hence both data can be placed in any prescribed relative neighborhood of $d$. ◻
]

== 9 Completion of the genericity argument <sec:completion>

We first collect the quantifiers in the finite experiment.
  This is necessary because a smooth neighborhood controls a prescribed finite number of derivatives,
  whereas the packet construction can demand arbitrarily high finite accuracy.

=== 9.1 Finite choices in one experiment <completion:destruction>

Fix a passing test $cal(A) \( O \, B \)$, a datum $d in cal(A) \( O \, B \)$, and a finite data order $m gt.eq
  10$. We explain why the choices in Proposition 39 can be made in an order that achieves Equation (3.22).

By Corollary 15, choose $w in O$ whose first future runout from the comparison development is a branch.
  Prepare the labels so that $v arrow.r oo$ and $u arrow.r u_(*) < oo$,
  using the independently prepared exchanged gauge for the other branch.
  Fix the strict observation-domain and collar margins about its late points.

The estimates of Sections 6–8 provide the three strict comparisons consumed by the experiment:

#[#set math.equation(numbering: n => "(9.1)")
 $ parallel H_T^plus.minus parallel_(C^30) & = o \( sqrt(a_p) \) \,\
e^(o \( T \))
  (parallel F_T^(upright("odd")) parallel_(C^2) + sum_plus.minus parallel H_T^plus.minus parallel_(C^2)^2) & =
  o \( A_T \) \,\
e^(o \( T \)) \( a_p \/ h_T + h_T^16 \) & = o \( A_T \) \, wide h_T = e^(- kappa T \/ 16) . $ <completion:margins>]

Here $a_p asymp e^(- kappa T)$ and $A_T = e^(- 7 kappa T \/ 8)$.
  The first comparison permits the adaptive observer to return to a nearby initial seed and controls the
  connection in its frame. The second preserves the signed curvature signal,
  and the third contradicts that signal if the selected datum still passes the transport test.
  All subexponential factors refer to fixed finite orders.

Fix first the data order $m$ and all the finite output and buffer orders used in Propositions 24–39.
  These include the interior energy, ordinary supremum, odd-source, constraint, exterior,
  trace and normal-gauge-jet orders that supply the metric and loop estimates in Equation (9.1).
  Choose a total exponential loss smaller than $kappa \/ 32$ and allocate it among the finitely many estimates of
  Propositions 24 and 27. As specified there, next fix the bulk thresholds, small auxiliary mass,
  late-support fraction, exterior radius and protected-ball tolerance.
  Their order makes the small exterior growth and the required early agreement hold simultaneously.

Now choose $zeta > 0$ sufficiently small that every positive frequency power at those fixed output orders fits its
  allocated loss. Only after this choice increase the finite transport,
  Taylor and matching degrees to obtain the required inverse accuracy.
  For example, $A_T lambda_T^(- J) e^(o \( T \)) lt.eq e^(- 4 kappa T)$ follows for large $T$ from a fixed choice
  with $7 kappa \/ 8 + J zeta > 4 kappa$. Proposition 21 ensures that increasing this accuracy does not increase
  the positive frequency powers at the chosen output orders.
  The additional coefficient orders and constants remain finite;
  their subexponential bounds are used after the formal degrees are fixed.
  Finally take $T$ sufficiently large for all these estimates, the prescribed $p_m$ proximity,
  and membership $w_T^plus.minus in O$.

Proposition 24 supplies the two exact complete constraint data with their entire corrected exterior tails,
  and Proposition 27 supplies their finite vacuum evolutions and signed estimates.
  Proposition 29 places the observation neighborhoods in the full developments $cal(M)_(d_T^plus.minus)$;
  Proposition 33 gives the nearby observing seeds and the uniform comparison with the test norms.
  For at least one sign, Proposition 39 then produces a finite loop violating the same $cal(A) \( O \, B \)$ test.
  Its base lies at a positive proper time before the geodesic’s full-development endpoint,
  and the loop lies in the future of the complete initial surface.
  Since $p_m \( d_T^plus.minus - d \) arrow.r 0$ for both signs, this proves the remaining density assertion.

#proof[
  Work first at the fixed normalized center of Section 2.1.
    Lemma 7 makes each passing set $cal(A) \( O \, B \)$ relatively closed in $cal(U)$.
  It has empty relative interior. Indeed, given $d in cal(A) \( O \, B \)$ and any relative neighborhood $V$ of
    $d$ in $cal(U)$, Lemma 4 gives a sufficiently small finite $p_m$ ball contained in $V$.
    The strict $p_10$ inequality defining $cal(U)$ has positive slack at $d$,
    so the radius can be chosen to preserve it. Proposition 39 then gives a datum in that ball outside
    $cal(A) \( O \, B \)$.
  There are countably many basic seed sets $O$ and integers $B$. Consequently
  $ cal(G) = ⋂_(O upright(" in the chosen basis")\
B in bb(N) \, med B gt.eq 1) #scale(x: 120%, y: 120%)[\(] cal(U) \\ cal(A) \( O \, B \) #scale(x: 120%, y: 120%)[\)] $
  is a dense $G_delta$ in the nonempty Baire space $cal(U)$.
    By Proposition 11, every datum admitting a future $C^1$ extension in Definition 2 belongs to at least one
    passing set. No datum of $cal(G)$ therefore admits such an extension.
    In particular the conclusion concerns the full maximal development and every future exit in the definition,
    without any vacuum assumption on the ambient extension. The rescaling in Section 2.1 proves the result for
    arbitrary fixed $M > 0$. ◻
]

== 10 Spatial isometries and nearby Kerr centers <phase:symmetry>

Return to the arbitrary fixed center $M > 0$, $0 < frak(a) <
  M$ and its datum $d_(*) = \( h_(*) \, K_(*) \)$ on $Sigma$.
  In this appendix $cal(D)$ is the corresponding weighted constraint space of Definition 1,
  before the mass normalization.

The neighborhood is nonsymmetric in the sense that no symmetry is imposed on its data;
  it necessarily contains the symmetric center. It also contains data with trivial spatial isometry group.
  We give the elementary construction to distinguish this assertion from any claim about spacetime Killing fields.

#thm([Lemma 10.1.])[
  #emph[Every neighborhood of $d_(*)$ in $cal(D)$ contains complete vacuum data whose spatial data isometry group
    is trivial.]
] <phase:trivial-isometries>

#proof[
  The reference slice is maximal: its second-form trace vanishes.
    For example, simultaneous reversal of Killing time and azimuth preserves the spatial data convention while
    reversing this scalar, which is axisymmetric. A compactly supported small spacelike normal graph in the smooth
    Kerr spacetime gives exact vacuum constraint data, identical to $d_(*)$ off a compact set.
    The first variation of its second-form trace is an operator with principal part $plus.minus Delta_(h_(*))$,
    plus smooth lower-order terms.
  Choose a small normal-coordinate ball and graph height $f_ell \( z \) = ell^2 f_0 \( z \/ ell \)$.
    After rescaling to the fixed coordinate ball, the linearized trace converges smoothly, as $ell arrow.r 0$,
    to $plus.minus Delta_(bb(R)^3) f_0$. One can choose $f_0$ compactly supported so that this last function has a
    unique strict positive global maximum, with nondegenerate Hessian of simple spectrum,
    and with nonzero third derivative in each of the three Hessian eigendirections. Here is a direct choice.
    Start with a negative Gaussian whose three axis scales are distinct and sufficiently close;
    its Laplacian has a unique strict maximum at the origin and a negative Hessian with simple eigenvalues.
    Cut it off sufficiently far away, where all its derivatives are small,
    and add arbitrarily small cutoff fifth powers in the coordinate directions.
    The Laplacian of each fifth power has a nonzero cubic derivative in its own direction.
    The strict maximum and simple Hessian persist.
  First take $ell$ small. Then take the actual normal-graph amplitude small enough that its trace,
    divided by that amplitude, has the same properties. All statements concern the induced metric,
    whose rescaled coefficients and derivatives converge to the Euclidean ones on the patch.
    Outside the patch the trace is zero, below the selected positive maximum.
  A data isometry must fix the unique maximum. Its differential preserves the Hessian,
    hence each one-dimensional eigenspace. The nonzero odd third derivatives exclude each possible sign flip,
    so its differential at the fixed point is the identity. An isometry of a connected Riemannian manifold is
    determined by its value and differential at one point, and is therefore the identity.
    The graph is unchanged outside a compact set and remains complete.
    Making its amplitude tend to zero gives convergence in every prescribed finite set of seminorms. ◻
]

These examples are hypersurfaces in Kerr and do not remove its spacetime Killing fields.
  The perturbations used to prove Theorem 3 are the separate signed construction of Sections 5–8.

Nearby Kerr parameters are also allowed. Identify the bridges near the waist using a signed square root of $r -
  r_(+) \( M \, frak(a) \)$. The pole in the Boyer–Lindquist $d
  r^2$ coefficient then becomes a smooth positive radial metric coefficient.
  The angular velocity of the azimuthal shift is smooth in $r \, theta$ and constant on the horizon sphere;
  dividing its metric Lie derivative by the signed lapse gives a smooth second form across the waist.
  The end formulas have parameter-smooth symbol estimates with fixed Euclidean leading metric.
  Thus these identifications place nearby Kerr centers in the same phase space.

#bibliography("refs.bib", style: "ieee", title: [References])
