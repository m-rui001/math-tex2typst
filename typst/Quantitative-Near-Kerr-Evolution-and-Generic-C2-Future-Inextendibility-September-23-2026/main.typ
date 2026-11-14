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

#align(center)[#text(size: 16pt, weight: "bold")[Quantitative Near-Kerr Evolution \
and Generic $C^2$ Future Inextendibility]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Strong cosmic censorship asks whether generic initial data determine a spacetime that cannot be continued beyond
  its maximal globally hyperbolic development. The regularity of the proposed continuation is part of the
  question. Here we consider $C^2$ future extensions of vacuum developments near the complete two-ended bridge of
  an arbitrary fixed rotating subextremal Kerr black hole. No symmetry is imposed on the perturbation.

The exact Kerr development has a smooth Cauchy horizon. Nevertheless,
  we prove that data admitting any $C^2$ future extension are meagre in a weighted smooth neighborhood of its
  bridge data. The neighborhood requires smallness at only one finite order,
  and the allowed tails need not have prescribed leading coefficients.
  The conclusion concerns the full development, not just the portion covered by an exterior or double-null
  coordinate construction.

=== 1.1 The precise statement <the-precise-statement>

Fix $M > 0$ and $0 < frak(a) < M$. Let $\( Sigma \, h_(*) \, K_(*) \)$, $Sigma tilde.eq bb(R) times bb(S)^2$,
  be the complete two-ended Kerr datum through the bifurcation sphere, with its chosen future orientation.
  Fix the connection $nabla_(*)$ and tensor norm $\| dot.op \|_(*)$ of $h_(*)$, and a smooth $rho gt.eq
  1$ agreeing with the Kerr radial coordinate outside a compact set on each end.
  For a pair of smooth symmetric covariant two-tensors, define

#[#set math.equation(numbering: n => "(1.1)")
 $ p_m \( u \, v \) =
   sum_(j = 0)^m
   [sup_Sigma rho^(1 + j) \| nabla_(*)^j u \|_(*) + sup_Sigma rho^(2 + j) \| nabla_(*)^j v \|_(*)] \, wide m =
   0 \, 1 \, 2 \, dots.h . $ <intro:seminorms>]

Let $E$ be the space on which every $p_m$ is finite. Let $cal(D) subset \( h_(*) \, K_(*) \) +
  E$ consist of the smooth vacuum data $d = \( h \, K \)$ with $h$ positive definite and complete, satisfying

#[#set math.equation(numbering: n => "(1.2)")
 $ R \( h \) + \( "tr"_h K \)^2 - \| K \|_h^2 = 0 \, wide "div"_h K - upright(d) \( "tr"_h K \) =
   0 . $ <intro:constraints>]

We give $cal(D)$ the relative topology of all the seminorms (1.1).
  In particular, no leading coefficient in either asymptotic tail is fixed.

Write $\( M_d \, g_d \)$ for the full maximal globally hyperbolic vacuum development of $d$,
  with the specified Cauchy embedding of $Sigma$. We use smooth vacuum Cauchy theory and geometric uniqueness in
  the sense of #cite(label("ChoquetBruhat1952")) #cite(label("ChoquetBruhatGeroch1969")).

#prodef([Definition 1.])[
  (Future extension).  A $C^2$ future extension of $\( M_d \, g_d \)$ is a connected time-oriented smooth
    four-manifold $tilde(M)$ with a nondegenerate $C^2$ Lorentzian metric $tilde(g)$,
    and a smooth time-orientation-preserving isometric embedding $iota : M_d arrow.r
    tilde(M)$ onto a proper open subset, such that a future-directed timelike $C^1$ curve $c : \[ 0 \, 1 \]
    arrow.r tilde(M)$ satisfies
  $ c \( \[ 0 \, 1 \) \) subset iota \( M_d \) \, wide c \( 1 \) in partial iota \( M_d \) . $
] <intro:extension>

We use signature $\( - + + + \)$. The extension need not be vacuum or globally hyperbolic outside the image.
  In particular, a regular geodesic exit is not assumed in this definition;
  it will follow locally from the extension and global hyperbolicity of the original development.

#thm([Theorem 1.1.])[
  (Local $C^2$ strong cosmic censorship).  #emph[For every fixed $M > 0$ and $0 < frak(a) < M$,
    there exists $epsilon.alt > 0$ such that the data in
$ cal(U)_epsilon.alt = { d in cal(D) : p_10 \( d - \( h_(*) \, K_(*) \) \) < epsilon.alt } $

 whose full maximal globally hyperbolic vacuum developments admit a $C^2$ future extension form a meagre subset of
   $cal(U)_epsilon.alt$. Equivalently, the future-inextendible data contain a countable intersection of relatively
   open dense subsets of $cal(U)_epsilon.alt$.]
] <thm:main>

Thus 1 resolves positively the stated local $C^2$ strong cosmic censorship problem at every strictly subextremal
  rotating Kerr bridge. It is not a global assertion for all vacuum initial data,
  nor a claim at a lower extension regularity. Constants and $epsilon.alt$ may depend on the fixed center;
  no estimate uniform as $frak(a) arrow.r 0$ or $frak(a) arrow.r M$ is claimed.
  Although all higher seminorms are finite, none beyond $p_10$ must be small.

=== 1.2 History and relation to earlier work <history-and-relation-to-earlier-work>

The Cauchy theory of Fourès-Bruhat and Choquet-Bruhat–Geroch #cite(label("ChoquetBruhat1952"))
  #cite(label("ChoquetBruhatGeroch1969")) makes the maximal globally hyperbolic development the natural spacetime
  determined by vacuum initial data. Sbierski #cite(label("Sbierski2016")) gives a modern construction with
  explicit initial-surface and embedding hypotheses. The Kerr solutions #cite(label("Kerr1963")) show why
  maximality in this class need not mean inextendibility as a Lorentzian manifold:
  their analytic continuation has inner Cauchy horizons, whose global geometry was analyzed by Carter
  #cite(label("Carter1968")). Penrose’s cosmic-censorship programme began with the visibility of singularities in
  collapse #cite(label("Penrose1969")); his later strong formulation linked Cauchy-horizon instability to global
  predictability #cite(label("Penrose1979")) Section 12.3.2.
  The regularity of an extension and the topology used to define genericity are essential parts of a precise
  formulation.

The physical blueshift and mass-inflation analyses of Poisson–Israel and Ori #cite(label("PoissonIsrael1990"))
  #cite(label("Ori1991")) #cite(label("Ori1992")) suggested that a Cauchy horizon can retain a continuous metric
  while developing a singularity in its derivatives. Dafermos #cite(label("Dafermos2003"))
  #cite(label("Dafermos2005")) established rigorous nonlinear stability and instability results for the
  spherically symmetric Einstein–Maxwell–scalar-field equations.
  In that model, Luk–Oh #cite(label("LukOh2019I")) #cite(label("LukOh2019II")) proved generic $C^2$ future
  inextendibility for admissible complete two-ended asymptotically flat data,
  combining exterior lower bounds with interior instability.
  Their data space and genericity topologies differ from those used here.
  For the vacuum equations without symmetry, Luk #cite(label("Luk2018")) constructed weak null singularities,
  and Dafermos–Luk #cite(label("DafermosLuk2017")) proved continuous extendibility across a nontrivial
  Cauchy-horizon portion under quantitative assumptions on data already inside a black hole.
  This distinction between metric continuity and higher regularity is central to the present problem.

Recent results strengthen the vacuum interior instability picture.
  Gurriaran #cite(label("Gurriaran2026")) proves curvature blow-up and locally Lipschitz inextendibility across a
  horizon portion near timelike infinity, assuming nonlinear Price-law asymptotics with a nonzero nonaxisymmetric
  leading curvature amplitude. Luk–Sbierski #cite(label("LukSbierski2026")) prove formation of a continuously
  extendible but non-Lipschitz weak null singularity from characteristic data with quantitative decay and a
  weighted lower bound on a radiative curvature mode. Sbierski’s geometric criteria #cite(label("Sbierski2022"))
  #cite(label("Sbierski2026")) explain how controlled parallel transport and robust signed curvature information
  obstruct Lipschitz extension. The Kerr interior instability results just cited concern a prescribed interior or
  horizon portion under explicit radiation hypotheses. The problem addressed here is to start with the complete
  weighted smooth bridge data and rule out every $C^2$ future exit generically.
  The finite perturbations below provide the needed curvature test violations without imposing a radiation lower
  bound on each starting datum.

===== 1.2.1 Exterior evolution. <exterior-evolution.>

The exterior estimates draw on both energy and stationary methods.
  The redshift estimate and the physical-space decay method of Dafermos–Rodnianski
  #cite(label("DafermosRodnianski2009")) #cite(label("DafermosRodnianski2010")) were followed by boundedness,
  decay, and scattering for scalar waves throughout the subextremal Kerr range
  #cite(label("DafermosRodnianskiShlapentokhRothman2016"))
  #cite(label("DafermosRodnianskiShlapentokhRothman2018")).
  For radiative spin-two fields, the Teukolsky estimates of Dafermos–Holzegel–Rodnianski
  #cite(label("DafermosHolzegelRodnianski2019")) and Shlapentokh-Rothman–Teixeira da Costa
  #cite(label("ShlapentokhRothmanTeixeiraDaCosta2023")) treat slowly rotating and full-subextremal Kerr,
  respectively. At the metric level, Häfner–Hintz–Vasy #cite(label("HafnerHintzVasy2021")) #cite(label("HHV2025"))
  establish linear stability, using stationary spectral analysis and constraint damping;
  the full-subextremal mode analysis by Andersson–Häfner–Whiting #cite(label("AnderssonHafnerWhiting2026")) is an
  important ingredient. These linear results distinguish radiative decay from the stationary Kerr and gauge modes
  that must be tracked in a nonlinear argument.

Nonlinear stability for slowly rotating Kerr was established through the geometric and wave-equation analysis of
  Klainerman, Szeftel, Giorgi, and Shen; see #cite(label("KlainermanSzeftel2021"))
  #cite(label("GiorgiKlainermanSzeftel2022")) and the constituent works cited there.
  Hintz #cite(label("Hintz2026")) establishes nonlinear exterior stability throughout the subextremal range for
  compact perturbations and a broader partially polyhomogeneous asymptotic class.
  That class has metric perturbations decaying like $r^(- 1 - epsilon.alt_0)$, with $epsilon.alt_0 > 0$,
  and a faster-decaying remainder; it does not directly include the arbitrary order-$r^(- 1)$ symbol tails
  permitted here. We therefore prove the compact and far estimates for our data class together.
  Their wave-coordinate cancellation is related to the weak-null structure identified and used by
  Lindblad–Rodnianski #cite(label("LindbladRodnianski2003")) #cite(label("LindbladRodnianski2010")).
  The use of elliptic control at selected frequencies together with frequency-localized physical-space energy
  currents also has a close methodological parallel in the full-subextremal quasilinear-wave analysis of
  Dafermos–Holzegel–Rodnianski–Taylor #cite(label("DafermosHolzegelRodnianskiTaylor2024")).
  The tensorial gauge construction and its estimates are established here for the Einstein system.

===== 1.2.2 Exact data and finite signals. <exact-data-and-finite-signals.>

Localized deformation of the constraints was developed by Corvino, Corvino–Schoen,
  and Chruściel–Delay #cite(label("Corvino2000")) #cite(label("CorvinoSchoen2006"))
  #cite(label("ChruscielDelay2003")); Carlotto–Schoen #cite(label("CarlottoSchoen2016")) proved a further conical
  localization of asymptotically flat data. Our correction fixes an inner region while allowing an asymptotic
  tail, so it can change the charges. The explicit inverse uses a localized divergence primitive in the tradition
  of Bogovskii #cite(label("Bogovskii1980")), whose support and regularity properties are treated by
  Costabel–McIntosh #cite(label("CostabelMcIntosh2010")). We prove the required inverse here because its support,
  derivative gain, and nonlinear dependence are needed in the finite experiment.
  Similarly, complex Gaussian beams and their superpositions provide the linear antecedents of the oscillatory
  construction #cite(label("Ralston1982")) #cite(label("Tanushev2008")) #cite(label("LiuRunborgTanushev2013")).
  The matching of Einstein wave-gauge data and the bounds on time intervals growing with the experiment parameter
  are proved below.

=== 1.3 From regular exits to finite observations <from-regular-exits-to-finite-observations>

The proof turns a possible extension into a finite condition that can be violated by a small vacuum perturbation.
  A $C^2$ extension supplies an open family of timelike geodesics whose proper durations and curvature components
  in parallel frames are bounded. A countable basis of initial geodesic states and integer bounds give countably
  many such tests. Each test is closed: a strict violation occurs on a compact geodesic segment and persists under
  a sufficiently small change of the data. Consequently, to prove meagreness,
  it suffices to violate the relevant test arbitrarily close to every datum admitting a regular exit.
  2 makes this reduction precise. Its decisive feature is that one large tidal measurement at a finite point
  suffices; the perturbation need not establish an asymptotic radiation law for the starting datum.

We obtain that measurement from the blueshift of a small oscillatory signal approaching an interior branch.
  In the optical coordinates used below, a branch means a limiting side where one coordinate remains finite and
  the other tends to infinity; at a corner both tend to infinity.
  These are coordinate-limit regimes of the comparison region. The main analytic work has two parts.
  First we construct a comparison development and control its geometry throughout one fixed neighborhood of Kerr
  data. Then, for a particular datum and a prescribed finite approximation order,
  we place a late signal in that geometry and realize it in the full development of nearby exact vacuum data.
  The distinction matters: the time and frequency of the experiment may depend on the chosen finite order,
  whereas the original $p_10$ neighborhood must serve all tests.

===== 1.3.1 Exterior control and the ergoregion. <exterior-control-and-the-ergoregion.>

The exterior construction combines stationary estimates in a bounded region with energy estimates on the
  asymptotically flat ends. Stationary time translation need not be timelike near all trapped rays at arbitrary
  spin. We instead separate directions in the cotangent bundle.
  3 constructs a horizon-crossing spacelike slicing for which the spatial projections of the trapped null
  covectors lie in a cone where the zero-temporal-frequency stationary symbol is elliptic.
  This directional ellipticity persists even when the base point lies in the ergoregion.
  4 uses the cone to localize the additional gauge terms and calibrate tensor transport while preserving the
  stationary modes and their time-translation chains. The stationary analysis of #cite(label("HHV2025")) and the
  normally hyperbolic propagation estimates of #cite(label("Dyatlov2016")) #cite(label("Hintz2017")) enter at the
  points specified there.

The compact estimate in 5 couples the two-derivative elliptic gain on that cone to a one-derivative propagation
  estimate, with one additional source derivative, away from the projected trapped sets.
  On the ends, the weak-null cancellations and weighted energy currents control the arbitrary symbol-bounded tails
  in (1.1). 6 closes these far estimates simultaneously with the compact estimates and the evolution of the Kerr
  parameters. The detailed far energy and source arguments are in Section 10, Section 11.
  All of these are estimates on an arbitrary finite interval of smooth existence,
  with bounds that permit continuation; a global nonlinear stability statement for this data class is not assumed.
  Once the low-order bounds close, each fixed higher derivative order has a subexponential bound with constants
  depending on the smooth datum.

===== 1.3.2 The interior and every possible exit. <the-interior-and-every-possible-exit.>

7 prepares the data entering the black hole and constructs a double-null comparison region.
  Exact Kerr optical profiles, with their two ends normalized to a common positive inner rate, organize the lapse,
  angular metric, and transport equations. The low-order estimates control the geometry;
  the higher estimates control the finite derivatives needed later by the oscillatory construction.
  8 joins this region to the exterior and proves that the entire original bridge is Cauchy.
  Geometric uniqueness therefore embeds the resulting comparison development in the full maximal development of
  the same data.

We then follow the geodesic family supplied by a putative extension.
  Exterior completeness and the causal geometry force its relevant first exit from the comparison region to occur
  at an interior branch or in the corner regime. In the corner case,
  a small change of initial geodesic state within the same open family produces runout at a noncorner branch of
  the comparison region. Thus the original closed curvature test still applies to the selected geodesic.
  This step connects the local interior coordinates to an arbitrary future extension of the full development;
  it does not require the comparison region to exhaust that development.

===== 1.3.3 A small exact vacuum perturbation with a large tidal effect. <a-small-exact-vacuum-perturbation-with-a-large-tidal-effect.>

9 constructs a high-frequency signal near a late point of the selected branch.
  The branch geodesic measures an exponentially increasing optical frequency.
  Its contraction with the oscillatory curvature therefore yields a large tidal component even when the signal is
  very small at entry. A return-ray calculation and a complex Gaussian beam carry the required finite entry
  derivatives backwards to a distant initial annulus, with controlled losses.
  The subsequent forward comparison uses ordinary local wave-map reduction with the actual background metric as target.

An approximate signal does not yet give vacuum initial data.
  The exterior solve proved in 13 and applied in 9.6 supplies an exact correction that vanishes on a protected
  inner ball and retains a decaying tail at infinity. The tail allows the asymptotic charges to change and is
  included in the complete corrected bridge. A causal estimate shows that this correction cannot alter the earlier
  entry segment on which the comparison relies. Finally, the finite Cauchy attachment in 9 places the tidal
  observation, its frame, and its geodesic back to the original initial surface in the full development of the
  corrected data. The resulting strict violation makes the corresponding extendible set nowhere dense.
  The countable union from 2 completes the proof.

Figure 1 displays the two constructions and the point at which they meet.
  The fixed background neighborhood is chosen before the test or approximation order.
  The finite derivative orders and their losses are chosen before the small frequency exponent;
  the formal accuracy and late time are then chosen to achieve the specified tolerance.
  In particular, the construction requires neither smallness of all higher seminorms nor one perturbation sequence
  converging in every seminorm at once.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.294cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One small $p_10$ neighborhood#linebreak()all higher seminorms finite]]])])
  content((0, -2.611), [#box(width: 5.294cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Background comparison#linebreak()development#linebreak()complete original bridge#linebreak()Cauchy]]])])
  content((0, -5.213), [#box(width: 5.294cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Branch seed in the original open family#linebreak()closed test bounds parallel curvature]]])])
  content((6.594, -5.213), [#box(width: 5.294cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Late finite tidal experiment#linebreak()parameters depend on a finite order]]])])
  content((6.594, -2.999), [#box(width: 5.294cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Exact corrected vacuum data#linebreak()arbitrarily close in that order]]])])
  content((6.594, -0.785), [#box(width: 5.294cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite Cauchy attachment#linebreak()observation in the new full development]]])])
  line((0, -0.5908), (0, -1.641), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -3.581), (0, -4.631), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((2.647, -5.213), (3.947, -5.213), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.594, -4.631), (6.594, -3.581), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.594, -2.417), (6.594, -1.367), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The comparison region locates a possible regular exit. The separate finite experiment violates its closed curvature test in the full development of nearby data. Neither an exhaustive description of that development nor smallness at every derivative order is needed. ],
) <fig:proof>

The intermediate results also separate the evolution problem from the regularity of a proposed extension.
  The complete comparison development, the entry and normalized double-null estimates,
  the linear beam preparation, the exterior constraint inverse,
  and the whole-data attachment can be used when the final obstruction is holonomy rather than curvature.
  For $C^1$ extensions and for continuous extensions with locally square-integrable connection,
  one must additionally control signed or averaged parallel transport.
  Those uses require their own nonlinear amplitude estimates:
  the tidal normalization in this paper does not supply the larger-amplitude comparisons needed for these weaker
  regularities.

These regularity refinements are established in #cite(label("KerrCOne")) Theorem 2.3 and
  #cite(label("KerrWeakConnection")) Theorem 1.2, respectively,
  as local residual statements near each fixed rotating subextremal Kerr bridge.

=== 1.4 Scaling and conventions <scaling-and-conventions>

It suffices to prove the theorem with $M = 1$. Under the constant rescaling $g mapsto M^(- 2) g$,
  the induced covariant data become $\( M^(- 2) h \, M^(- 1) K \)$.
  After identifying the bridge by dimensionless Kerr coordinates,
  this is a homeomorphism of the constraint spaces; the background connections agree and the tensor norms and
  radial weights change by fixed-order comparable factors. Completeness,
  vacuum maximality and the extension property are preserved.
  An original $p_10$ ball can therefore be chosen inside the inverse image of the rescaled neighborhood,
  and relative meagreness restricts to that open ball. We retain $M$ in geometric identities when doing so
  clarifies their dependence on the background.

We write $frak(a)$ for Kerr rotation when another local quantity is called $a$,
  notably a parameter derivative in exterior estimates or a null lapse coefficient in the interior.
  All spacetime and angular Sobolev norms are computed in the specified fixed charts or frames; on fixed supports,
  smooth changes give equivalent norms. Supported and extendible spaces at an outflow boundary are dual in the
  usual way. Symbol bounds on an end include all differentiated bounds,
  with an additional inverse radial power for each unscaled spatial derivative.
  A bound $e^(o \( T \))$ means that for every $sigma > 0$ the quantity is at most $C_sigma e^(sigma T)$;
  the constant may depend on the smooth datum and on a fixed derivative order.
  These conventions will always be used at fixed subextremal parameters.

== 2 Closed tests and the finite-observation reduction <sec:category>

We first separate the topological argument from the evolution estimates.
  The facts in this section are independent of the Kerr parameters.
  We include their short proofs to make precise why a finite tidal observation suffices,
  and why no regular endpoint tangent is part of the extension hypothesis.

#thm([Lemma 1.])[
  (The data topology).  #emph[The space $cal(D)$ is completely metrizable and $cal(U)_epsilon.alt$ is Baire.
    Every neighborhood of a datum contains a ball $p_m \( d' - d \) < eta$ relative to $cal(D)$,
    for some finite $m$ and $eta > 0$.]
] <cat:baire>

#proof[
  A sequence Cauchy in every $p_m$ has compatible smooth limits on compact coordinate sets.
    Passing to the pointwise limit in its weighted uniform Cauchy bounds proves convergence to that limit in every
    $p_m$, including the finiteness of each limiting seminorm. Thus $E$ is a Fréchet space.
    For example its topology is defined by the complete metric $sum_(m gt.eq 0) 2^(- m - 1) min { 1 \,
    p_m \( d - d' \) }$.
  Any positive metric in the affine space is uniformly comparable to $h_(*)$:
    this follows from the decaying difference on the ends and compactness on their complement.
    Hence it is complete, and positivity is open already in the $p_0$ topology.
    The constraint equations are closed under local smooth convergence within this positive open set.
    An open subset of a completely metrizable space is completely metrizable,
    as is a relatively closed subset thereof. Consequently $cal(D)$,
    and then its open subset $cal(U)_epsilon.alt$, are completely metrizable and Baire.
    Finally the seminorms increase with $m$, so one sufficiently small ball in the largest of finitely many orders
    lies inside any basic neighborhood. ◻
]

=== 2.1 Seeds and curvature measurements <seeds-and-curvature-measurements>

A seed $w in T Sigma$ includes its base point. For datum $d = \( h \, K \)$, its initial future unit velocity is

$ U_d \( w \) = sqrt(1 + h \( w \, w \)) thin n + w \, $

where $n$ is the future unit normal. Let $gamma_(d \, w) : \[ 0 \, T_d \( w \) \) arrow.r
  M_d$ be the maximal future geodesic with this initial velocity, parametrized by proper time.
  Along it parallel transport the positive inner product $1 xor h$ on $bb(R) n xor T Sigma$,
  and call the result $k_(d \, w)$. Set

#[#set math.equation(numbering: n => "(2.1)")
 $ Q_d \( w \, tau \) = \| "Riem" \( g_d \) \|_(k_(d \, w) \( tau \)) . $ <cat:Q>]

The curvature tensor is covariant and the norm is its positive Hilbert–Schmidt norm,
  independently of any initial orthonormal frame.

Choose a countable relatively compact open basis $cal(O)$ of $T Sigma$.
  For $O in cal(O)$ and an integer $N gt.eq 1$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ A \( O \, N \) = {d in cal(D) : T_d \( w \) lt.eq N & upright("for every ") w in O \,\
Q_d \( w \, tau \) lt.eq N & upright("for every ") w in O \, med 0 lt.eq tau < T_d \( w \)} . $ <cat:test>]

#thm([Lemma 2.])[
  (Closed tests).  #emph[Each set $A \( O \, N \)$ is closed in $cal(D)$.]
] <cat:closed-tests>

#proof[
  Every strict failure has a compact witness. If $T_d \( w \) > N$, use a geodesic segment extending beyond $N$.
    If a curvature bound fails, use a segment through a point $tau < T_d \( w \)$ with $Q_d \( w \, tau \) > N$.
    Smooth local Cauchy stability and geometric uniqueness place a neighborhood of this fixed compact segment in a
    common gauge for all sufficiently close data. For the compact segment $K$,
    its causal shadow $J^(-) \( K \) ∩ Sigma$ is compact; otherwise a limit of past causal curves to escaping
    initial points would contradict Cauchyness. Finite local Cauchy constructions therefore suffice.
    Geodesic and parallel-transport ODE stability preserve the strict witness.
    This proves openness of the complement, without asserting continuity of the maximal duration. ◻
]

#thm([Lemma 3.])[
  (Tidal contractions).  #emph[If $U = dot(gamma)_(d \, w)$, $g_d \( X \, X \) = 1$, and $g_d \( U \, X \) = 0$, then
#[#set math.equation(numbering: n => "(2.3)")
 $ \| "Riem" \( U \, X \, U \, X \) \| lt.eq \( 1 + 2 h \( w \, w \) \)^2 Q_d \( w \, tau \) . $ <cat:tidal-bound>]

 The factor is uniformly bounded for data and seeds near a fixed pair.]
] <cat:tidal>

#proof[
  In the transported Lorentz orthonormal frame write $U = alpha e_0 + v$, $X = beta e_0 + z$.
    Orthogonality and the unit conditions give $alpha^2 = 1 + \| v \|^2$, $\| z \|^2 = 1 + beta^2$,
    and $alpha beta = v dot.op z$; hence $beta^2 lt.eq \| v \|^2$.
    Therefore $\| X \|_k^2 lt.eq \| U \|_k^2 = 1 + 2 h \( w \, w \)$,
    the latter identity being constant by parallel transport. Tensor Cauchy–Schwarz proves the assertion. ◻
]

=== 2.2 From an arbitrary extension to regular exits <from-an-arbitrary-extension-to-regular-exits>

We will use an intrinsic compactness fact. It avoids imposing causal convexity on the image in an extension.

#thm([Lemma 4.])[
  (Fixed-endpoint homotopy).  #emph[Let $P$ be a globally hyperbolic open subspacetime of a Hausdorff Lorentzian
    manifold. In a continuous family of future causal paths with fixed endpoints $p \, q in P$,
    if the first path lies in $P$, then all paths lie in $P$.]
] <cat:homotopy>

#proof[
  Parametrize the family by a connected compact interval. The set of parameters for which the whole path lies in
    $P$ is open. Every such path lies in the intrinsic compact diamond $J_P^(+) \( p \) ∩ J_P^(-) \( q \)$,
    which is closed in the ambient Hausdorff manifold. Continuity makes the parameter set closed as well.
    It is therefore the whole interval. ◻
]

#thm([Proposition 1.])[
  (Regular-exit covering).  #emph[If $d in cal(U)_epsilon.alt$ admits a $C^2$ future extension,
    there exist $O in cal(O)$ and $N gt.eq 1$ such that $d in
    A \( O \, N \)$ and every seed in $O$ reaches its finite MGHD endpoint on a regular ambient geodesic arc.
    Here regular means that position and unit tangent continue to and through the endpoint.]
] <cat:regular-exit>

#proof[
  Starting from 1, identify the development with its image and write $z = c \( 1 \)$.
    The curve is future-inextendible within the development: an interior endpoint would equal $z$ by the Hausdorff
    property. Extend it maximally to the past inside the development.
    Cauchyness then puts a sufficiently late point $p = c \( s_0 \)$ to the intrinsic future of $Sigma$.
    In a small temporal chart at $z$, the local timelike relation from $p$ to $z$ gives a short timelike geodesic
    continuing past $z$. Only this local relation is needed, not a continuing unit tangent of $c$.
    For a $C^2$ metric the Christoffel symbols are $C^1$, so the geodesic flow has the usual local uniqueness and
    continuous dependence.
  Consider sufficiently close geodesic arcs with starting positions on the same temporal slice inside the image,
    and close unit directions. They remain in a common compact chart and phase-space neighborhood.
    Parametrize these arcs by chart time on a common interval $\[ t_0 \, t_1 \]$,
    with the reference arc passing through $z$ at $t_z in \( t_0 \, t_1 \)$. Each nearby arc must exit the image.
    To see this, suppose an arc $\( t \, x_gamma \( t \) \)$ stayed inside.
    Choose a fixed smooth bump $beta$, supported in $\( t_0 \, t_1 \)$, with $beta \( t_z \) = 1$. The paths
  $ #scale(x: 120%, y: 120%)[\(] t \, x_gamma \( t \) + lambda beta \( t \) \( x \( z \) - x_gamma \( t_z \) \)
    #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq lambda lt.eq 1 \, $
  form a fixed-endpoint timelike homotopy: after shrinking the arc family,
    the spatial change is uniformly small in $C^1$, and all paths stay in the chart with its uniform timelike
    margin. Under the supposition that the original arc stayed inside, both endpoints belong to the image.
    4 would then keep every path inside, although the path at $lambda = 1$ passes through $z$, a contradiction.
    Thus every nearby arc has a first exit, with position and tangent regular there.
    By geodesic uniqueness this first exit is its maximal intrinsic endpoint, regardless of possible later reentry.
  The reference arc continued backwards inside the development meets $Sigma$.
    To see that a maximal timelike geodesic cannot end at an interior position limit,
    use a precompact temporal chart $\( t \, x \)$. Causal slopes $V = \( 1 \, upright(d) x \/ upright(d) t \)$
    are bounded and the geodesic equation gives
  $ frac(upright(d), upright(d) t) log frac(upright(d) t, upright(d) tau) = - Gamma_(alpha beta)^0 V^alpha V^beta . $
  Over a finite chart-time tail this bounds the unit tangent and gives its limit, so the geodesic continues.
    Cauchyness now gives the claimed intersection. Flow dependence through that fixed earlier compact segment
    yields an open seed family whose arcs have the exits just constructed.
  Shrink the seed family to a relatively compact one. The earlier tube has uniformly bounded duration,
    parallel frames and curvature. In the extension chart, unit tangents stay in a fixed compact phase-space set.
    The parallel-transport ODE has bounded coefficients on a bounded chart-time interval,
    so its transport matrices and their inverses are bounded; curvature is continuous and bounded as well.
    Duration and the norm (2.1) are consequently uniformly bounded up to first exit.
    Choose a basis set $O$ within the seed family and an integer $N$ larger than both bounds. ◻
]

Let $B_epsilon.alt$ denote the extendible data in $cal(U)_epsilon.alt$.
  Define $cal(B) \( O \, N \)$ to consist of the data in $B_epsilon.alt ∩
  A \( O \, N \)$ for which at least one seed in $O$ has a regular exit in some extension. Then

#[#set math.equation(numbering: n => "(2.4)")
 $ B_epsilon.alt = union.big_(O in cal(O) \, thin N gt.eq 1) cal(B) \( O \, N \) \, wide
   overline(cal(B) \( O \, N \))^(thin cal(U)_epsilon.alt) subset A \( O \, N \) ∩ cal(U)_epsilon.alt . $ <cat:cover>]

The pieces $cal(B) \( O \, N \)$ themselves need not be closed.

=== 2.3 The analytic task <the-analytic-task>

#thm([Proposition 2.])[
  (Finite-observation criterion).  #emph[Suppose a single $epsilon.alt > 0$ has the following property.
    For every $O in cal(O)$, $N gt.eq 1$, $d in cal(B) \( O \, N \)$, integer $m gt.eq 10$ and $eta > 0$,
    there exist $d' in cal(U)_epsilon.alt$, $w' in O$, and $0 lt.eq tau < T_(d') \( w' \)$ such that
$ p_m \( d' - d \) < eta \, wide Q_(d') \( w' \, tau \) > N . $

 Then 1 holds for this $epsilon.alt$.]
] <cat:destruction>

#proof[
  If the relative closure of $cal(B) \( O \, N \)$ had nonempty interior, that interior would meet the piece and,
    by (2.4), be contained in $A \( O \, N \)$. At an intersection point,
    choose a finite seminorm ball within the interior, increasing the order to at least ten if necessary.
    The asserted perturbation is in that ball but fails the test, a contradiction.
    Hence each closure is nowhere dense. The countable intersection of their relatively open dense complements
    contains no extendible datum, by (2.4). ◻
]

All choices needed to fix the neighborhood in 2 will precede the choice of $O \, N \, m \, eta$.
  The exterior and interior estimates construct the background comparison region at this common smallness
  threshold. Higher constants may then depend on the fixed smooth datum.
  Only afterwards do we choose the late finite perturbation that violates the selected test.

== 3 Kerr geometry and spatial microlocal separation <sec:geometry>

The exterior construction requires a spacelike stationary slicing,
  a description of all null rays that can remain in a bounded cylinder,
  and a spatial conic neighborhood of trapping on which the stationary operator is elliptic at zero frequency.
  We establish these properties for every fixed subextremal Kerr metric.
  Although the mass has been normalized to $M = 1$ in the main argument,
  we retain $M$ in the identities below to display their parameter dependence. Throughout this section,

$ M > 0 \, wide 0 < frak(a) < M $

are fixed. Constants may depend on this pair; no assertion is uniform as $frak(a) arrow.r 0$ or $frak(a) arrow.r M$.

=== 3.1 The stationary slicing and its ends <the-stationary-slicing-and-its-ends>

At either exterior end, let $T$ be the future Boyer–Lindquist time.
  In the trapped block we continue the corresponding sign of the Killing time,
  reversing the axial coordinate when necessary. Write

#[#set math.equation(numbering: n => "(3.1)")
 $ Sigma_K = r^2 + frak(a)^2 cos^2 theta \, wide Delta = r^2 - 2 M r + frak(a)^2 = \( r - r_(+) \) \( r - r_(-) \) \,\
r_plus.minus = M plus.minus sqrt(M^2 - frak(a)^2) \, wide r'_(*) = frac(r^2 + frak(a)^2, Delta) \, wide
  kappa_plus.minus = frac(r_(+) - r_(-), 2 \( r_plus.minus^2 + frak(a)^2 \)) . $ <geo:kerr-functions>]

In particular, $r_(-) > 0$ and both numbers $kappa_plus.minus$ are positive;
  at the inner horizon we use the absolute value of the surface gravity.

The exterior computing cylinder will extend to an inner face $r = r_b$ with $r_(-) < r_b < r_(+)$.
  Its precise depth is chosen after the entry cylinder for the double-null argument and its finite margins have
  been fixed. The inner face is placed strictly deeper than that entry cylinder.

#thm([Lemma 5.])[
  (A bent spacelike time).  #emph[For any prescribed finite interval $\[ r_b \, R_1 \]$, where $R_1 > r_(+)$,
    one can choose a stationary time
#[#set math.equation(numbering: n => "(3.2)")
 $ t = T + r_(*) - G \( r \) $ <geo:time>]

 with the following properties. One has $G' = 1$ on the prescribed region, $1 lt.eq G' lt.eq
   r'_(*)$ in a subsequent exterior interpolation, and $G = r_(*)$ near infinity.
   The function $t$ is regular at the future event horizon, its level hypersurfaces are spacelike, and $r =
   r_b$ is strictly future outflow. The delay $G - r_(*)$ at each fixed depth above $r_(-)$ can be made
   arbitrarily large by moving the exterior bend outward.]
] <geo:slicing>

#proof[
  Use the regular ingoing azimuth near the horizon,
  $ d tilde(phi) = d phi + frak(a) / Delta thin d r \, $
  and return smoothly to the Boyer–Lindquist azimuth toward infinity.
    These coordinates, together with $r$ and local sphere coordinates, give stationary spatial coordinates $y$;
    near infinity we use their Boyer–Lindquist Cartesian version.
    Let $b$ denote the Kerr metric in $\( t \, y \)$. Direct substitution in the Boyer–Lindquist inverse metric gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ Sigma_K b^(- 1) \( d t \, d t \) = - 2 \( r^2 + frak(a)^2 \) G' + Delta \( G' \)^2 +
     frak(a)^2 sin^2 theta . $ <geo:time-norm>]
  For $G' = 1$, the right-hand side is
  #[#set math.equation(numbering: n => "(3.4)")
   $ - Sigma_K - 2 M r < 0 . $ <geo:time-norm-one>]
  In the exterior it is a convex quadratic in $G'$. Its value at $G' = r'_(*) = \( r^2 + frak(a)^2 \) \/ Delta$ is
  $ - frac(\( r^2 + frak(a)^2 \)^2, Delta) + frak(a)^2 sin^2 theta < 0 . $
  Both endpoint values are negative, so every indicated interpolation is spacelike.
    Near the horizon, $t$ is the regular ingoing time minus the smooth function $G$.
    Between the horizons $b^(- 1) \( d r \, d r \) = Delta \/ Sigma_K < 0$; with the chosen future orientation,
    $r$ decreases along future causal curves. This proves strict outflow at $r_b$.
  Choose the additive constant of $G$ by imposing $G = r_(*)$ after the interpolation.
    Extending the interval where $G' = 1$ changes the delay at any fixed smaller radius by the integral of
    $r'_(*) - 1$ over the added interval. Since
  $ r'_(*) - 1 = frac(2 M r, Delta) = frac(2 M, r) + O \( r^(- 2) \) \, $
  this integral tends to positive infinity as the bend moves outward.
    Thus the delay can satisfy all fixed-depth margins at once, while $G' =
    1$ continues to hold throughout the prescribed interval. ◻
]

As in (8.1), the delays place the $t = 0$ computing slices on or to the future of the bridge and separate their
  trapped-block portions by the required finite margins. The order of choices is important:
  first choose the entry depth and these margins, then choose $r_b$, and finally move the bend far enough outward.
  Lemma 5 permits this order without altering the slicing on the prescribed interval.
  After proving compactness of the trapping radii below, we take $R_1$ larger than all of them.

Near infinity $t = T$, so all components and inverse components have the ordinary stationary Kerr symbol
  expansions. In particular,

#[#set math.equation(numbering: n => "(3.5)")
 $ b - eta = O \( r^(- 1) \) \, wide b^(t i) = O \( r^(- 2) \) \, wide Gamma \( b \) = O \( r^(- 2) \) \,\
r_(*) = r + 2 M log r + O \( 1 \) \,\
b_(t t) = - 1 + frac(2 M, r) + O \( r^(- 2) \) \, wide b_(i j) = delta_(i j) + frac(2 M y_i y_j, r^3) +
  O \( r^(- 2) \) . $ <geo:end-expansions>]

Here $eta$ is the Minkowski metric, and every remainder includes its differentiated symbol bounds.
  The terms of order $r^(- 1)$ are rotation invariant. The leading term of $b_(t i)$ is a nonzero constant
  multiple of $\( upright(bold(J)) times y \)_i \/ r^3$, where $upright(bold(J)) =
  M bold(frak(a))$ and $bold(frak(a))$ is the oriented spin vector in the chosen axes.
  These assertions follow by expanding the Boyer–Lindquist metric;
  the angular expressions and their rotations are smooth on the sphere.

=== 3.2 Radial dynamics and the horizon source <radial-dynamics-and-the-horizon-source>

We now classify the null rays in a large computing cylinder.
  A future null covector means a nonzero null covector $k$ whose metric dual $k^sharp$ is future directed. Set

#[#set math.equation(numbering: n => "(3.6)")
 $ E = - k \( partial_t \) = - k \( partial_T \) \, wide L_z = k \( partial_phi \) \,\
D = k_theta^2 + (frac(L_z, sin theta) - frak(a) E sin theta)^2 \, wide P = \( r^2 + frak(a)^2 \) E -
  frak(a) L_z . $ <geo:constants>]

The angular expression is understood intrinsically at the poles:
  its expansion is the smooth round cotangent norm, minus $2 frak(a) E L_z$, plus $frak(a)^2 E^2 sin^2 theta$.
  The separated principal symbol in Boyer–Lindquist variables is

#[#set math.equation(numbering: n => "(3.7)")
 $ q_E := Sigma_K b^(- 1) \( k \, k \) = Delta k_r^2 + D - P^2 / Delta . $ <geo:separated-symbol>]

Stationarity, axial symmetry, and separation show that $E \, L_z \, D$ are constant along null rays.
  With a dot denoting the affine geodesic parameter, the corresponding equations are

#[#set math.equation(numbering: n => "(3.8)")
 $ \( Sigma_K dot(r) \)^2 & = P^2 - Delta D \,\
Sigma_K dot(T) & = frac(\( r^2 + frak(a)^2 \) P, Delta) +
  frak(a) \( L_z - frak(a) E sin^2 theta \) . $ <geo:ray-equations>]

These are Carter’s separated geodesic equations #cite(label("Carter1968")),
  in the conventions used for the characteristic-flow calculation below.

#thm([Lemma 6.])[
  (Radial alternatives).  #emph[For the fixed parameters above, future null rays in $r > r_(+)$ have $P > 0$.
    If $E lt.eq 0$, their allowed radial set has at most one simple turning point,
    and there is no photon trapping. If $E > 0$, every trapped ray is a spherical photon ray,
    with constant radius satisfying
#[#set math.equation(numbering: n => "(3.9)")
 $ F = frac(2 r Delta, r - M) \, wide D / E^2 = frac(4 r^2 Delta, \( r - M \)^2) \, wide F := P / E = r^2 +
   frak(a)^2 - frak(a) L_z / E . $ <geo:double-root>]

 The energy-normalized trapped directions form a compact set separated from $r = r_(+)$ and from infinity.
   The relevant radial critical point is a unique nondegenerate minimum.
   A simple radial turning point reverses toward the same end of its allowed interval,
   and there is no homoclinic orbit from a double radial root back to that root.]
] <geo:radial>

#proof[
  In the exterior,
  $ X = \( r^2 + frak(a)^2 \) partial_T + frak(a) partial_phi $
  is future timelike: direct evaluation gives $b \( X \, X \) = - Sigma_K Delta$.
    Since $k \( X \) = - P$, pairing with the future null vector $k^sharp$ gives $P > 0$.
  Suppose first that $E lt.eq 0$. Then $P' = 2 r E lt.eq 0$,
    while $sqrt(Delta D)$ is strictly increasing when $D > 0$. The case $D = 0$ cannot occur:
    it would force $k_theta = 0$ and $L_z = frak(a) E sin^2 theta$, and hence $P = E Sigma_K lt.eq 0$.
    Thus the inequality $P^2 gt.eq Delta D$, on its positive-$P$ branch, has at most one boundary point,
    and that point is simple. It cannot contain either a double root or a bounded allowed island.
  For $E > 0$, restrict to the interval where $F > 0$. Differentiation gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ (F / sqrt(Delta))' = N / Delta^(3 \/ 2) \, wide N = 2 r Delta - \( r - M \) F \, $ <geo:radial-derivative>]
  and
  #[#set math.equation(numbering: n => "(3.11)")
   $ N' = 2 Delta + 2 r \( r - M \) - F \, wide N'' = 6 \( r - M \) > 0 . $ <geo:radial-convexity>]
  If $F \( r_(+) \) > 0$, then $N \( r_(+) \) < 0$. The strictly convex function $N$ tends to positive infinity
    and has exactly one zero beyond $r_(+)$; its derivative at that zero is strictly positive.
    Consequently $F \/ sqrt(Delta)$ has a unique nondegenerate minimum.
    If instead $F \( r_(+) \) lt.eq 0$, let $r_0 gt.eq r_(+)$ be its first zero. Since $F' = 2 r > 0$,
  $ N \( r_0 \) = 2 r_0 Delta \( r_0 \) gt.eq 0 \, wide N' \( r_0 \) = 2 Delta \( r_0 \) + 2 r_0 \( r_0 - M \) > 0 . $
  Equation (3.11) then gives $N > 0$ wherever $F > 0$. In this second case there is no radial critical point.
  A double root of $P^2 - Delta D$ must therefore occur at the unique minimum in the first case.
    Setting $N = 0$ and $F^2 = Delta D \/ E^2$ gives (3.9). Moreover,
  #[#set math.equation(numbering: n => "(3.12)")
   $ lr(|L_z / E|) - frak(a) lt.eq sqrt(D) / E . $ <geo:impact-bound>]
  If double roots approached $r_(+)$, their identities would force
  $ L_z / E arrow.r frac(r_(+)^2 + frak(a)^2, frak(a)) > frak(a) \, wide D / E^2 arrow.r 0 \, $
  contrary to (3.12). They cannot approach infinity either:
    (3.9) makes $\| L_z \/ E \|$ quadratic in $r$ to leading order, whereas $sqrt(D) \/ E$ is only linear.
    The radial range, the two impact quantities, and the normalized angular covectors are therefore bounded.
    Smoothness of the angular expression at the poles gives compactness in the intrinsic cotangent bundle.
  Finally, the same one-minimum description classifies the allowed radial intervals.
    A simple endpoint is a reflection toward the same end of its interval.
    At a double root, $F^2 \/ Delta$ increases strictly in either radial direction away from the minimum,
    so a departing branch cannot turn back to it. There are no further radially bounded trajectories.
    Covector reversal gives the corresponding description of the past sheet. ◻
]

#thm([Lemma 7.])[
  (The outer-horizon radial source).  #emph[The outer-horizon generators are a strict radial source for the null
    ray flow parameterized by increasing regular time $t$ on spatial cosphere directions.
    More precisely, let $H$ be the horizon Killing generator, normalized by its Killing parameter, so that
$ nabla_H H = kappa_(+) H \, wide H^t > 0 . $

 There is a smooth positive degree-one frequency scale $b_1$, equal to $\| rho \|$ on $k = rho H^flat$, such that,
   for the increasing-time ray field $V$,
#[#set math.equation(numbering: n => "(3.13)")
 $ V log b_1 = - kappa_(+) / H^t quad upright("on the generators") . $ <geo:source-frequency>]

 On null directions near the generators, the degree-zero function
#[#set math.equation(numbering: n => "(3.14)")
 $ f_H = frac(E^2 + D, b_1^2) $ <geo:source-function>]

 vanishes precisely at the generators and satisfies $V f_H gt.eq
   c_H f_H$ for some $c_H > 0$ after shrinking the neighborhood.]
] <geo:horizon-source>

#proof[
  The only null tangencies to a null horizon are its generators.
    Along an affine generator, write $k^sharp = rho H$ and use a Killing-invariant normalization of $H$.
    The affine geodesic equation and $nabla_H H = kappa_(+) H$ give
  $ H \( log \| rho \| \) = - kappa_(+) . $
  Dividing by $H^t$ proves (3.13). Extend $\| rho \|$ smoothly and homogeneously to a positive frequency scale in
    a conic neighborhood. Since $E$ and $D$ are conserved,
  $ V f_H = - 2 \( V log b_1 \) f_H . $
  The coefficient is strictly positive on the generators and remains bounded below nearby.
    On the null set, $E = D = 0$ forces $L_z = k_theta = 0$; near the horizon the remaining null direction is
    exactly its generator covector. This proves the asserted zero set and the strict source inequality. ◻
]

Together, Lemmas 6 and 7 give the escape alternatives used below.
  Between the horizons $d r$ is timelike, so every future ray there moves toward the inner outflow face.
  In a sufficiently large exterior cylinder, a ray away from trapping and the generators escapes in at least one
  time direction, or approaches the generator source in backward regular time.
  An orbit approaching $r = r_(+)$ without a transverse crossing has a normalized invariant limit set tangent to
  that horizon, and hence consisting of generators. The radial alternatives exclude any additional recurrent set.

=== 3.3 Normal hyperbolicity and tangent dynamics <normal-hyperbolicity-and-tangent-dynamics>

The radial classification identifies the only exterior obstruction to escape.
  The smooth symplectic structure and normal hyperbolicity of the subextremal Kerr trapped set are established in
  #cite(label("DyatlovZworski2013")) Section II. For the estimates below we give explicit defining functions for
  its stable and unstable surfaces and verify that their exponential rates dominate every fixed-order tangent
  derivative of the trapped flow.

#thm([Lemma 8.])[
  (Transverse defining functions).  #emph[Near the energy-normalized trapped set on either temporal sheet,
    the critical radius $r_c = r_c \( L_z \/ E \)$ is smooth. There are smooth homogeneous degree-zero functions
#[#set math.equation(numbering: n => "(3.15)")
 $ z_1 & = frac(Sigma_K dot(r), E sqrt(Delta)) \,\
z_2 & = "sgn" \( r - r_c \) sqrt(frac(F \( r \)^2, Delta \( r \)) - frac(F \( r_c \)^2, Delta \( r_c \)))
  $ <geo:normal-variables>]

 whose common zero set is trapping. For the increasing-time ray field,
#[#set math.equation(numbering: n => "(3.16)")
 $ V z_2 = lambda z_1 \, wide V z_1 = lambda z_2 \, wide lambda > 0 . $ <geo:normal-system>]

 Consequently $phi_plus.minus = z_1 plus.minus z_2$ satisfy $V phi_plus.minus = plus.minus lambda phi_plus.minus$.
   Their reduced spatial symplectic bracket on either halfwave is nonzero on the trapped set.
   The transverse rates have a uniform positive lower bound on each fixed normalized trapped set.]
] <geo:normal-functions>

#proof[
  The strict minimum established in Lemma 6 and the implicit function theorem give the smooth function $r_c$.
    Set $U = F^2 \/ Delta$ and $U_c = U \( r_c \)$. Near the minimum,
  $ U \( r \) - U_c = \( r - r_c \)^2 a_0 \( r \, L_z \/ E \) \, wide a_0 > 0 $
  with $a_0$ smooth. Thus $z_2 = \( r - r_c \) sqrt(a_0)$ is smooth and $partial_r z_2 >
    0$ after restricting the neighborhood. On the null set, (3.8) gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ z_1^2 - z_2^2 = U_c - D / E^2 \, $ <geo:normal-invariant>]
  which is conserved. Since $E$ and $L_z$ are constant,
  $ V z_2 = \( partial_r z_2 \) dot(r) / dot(t) = lambda z_1 \, wide
    lambda := \( partial_r z_2 \) frac(E sqrt(Delta), Sigma_K dot(t)) . $
  On a trapped future ray $E > 0$, while $dot(t) > 0$ because the slicing is spacelike.
    Both signs reverse on the opposite sheet, so $E \/ dot(t) > 0$ on both sheets.
    Hence $lambda > 0$ there and nearby. Differentiating (3.17) gives the second equation of (3.16) where $z_1
    eq.not 0$; smoothness extends it across $z_1 = 0$. Compactness gives the positive lower bound.
  For symplectic transversality first hold $E$ fixed in the Boyer–Lindquist spatial phase space.
    Then $z_1 = sqrt(Delta) thin k_r \/ E$, and the radial contribution to ${ z_1 \, z_2 }$ is,
    up to the bracket convention,
  $ sqrt(Delta) / E thin partial_r z_2 eq.not 0 . $
  There is no axial contribution because the functions are independent of the axial coordinate,
    and no polar contribution. At fixed energy, a stationary change of time adds an exact one-form times $E$ to
    the spatial covector, while a spatial coordinate change acts by cotangent pullback.
    The reduced bracket is therefore unchanged.
  Finally pass from fixed $E$ to a temporal root $E = e \( y \, eta \)$ of the characteristic equation.
    Write $f \|_e = f \( y \, eta \, e \( y \, eta \) \)$, and use the bracket convention $H_f g = { f \, g }$.
    Implicit differentiation gives, on the characteristic set,
  #[#set math.equation(numbering: n => "(3.18)")
   $ { f \|_e \, g \|_e } = { f \, g } + frac(g_E { q_E \, f } - f_E { q_E \, g }, partial_E q_E) \, wide
     partial_E q_E = - 2 Sigma_K k^sharp \( d t \) eq.not 0 \, $ <geo:root-bracket>]
  where the symbol is expressed in the regular stationary coordinates, the brackets on the right hold $E$ fixed,
    and $partial_E$ holds their spatial covector $eta$ fixed.
    The denominator is nonzero because $d t$ is timelike. For $f = z_1$ and $g = z_2$,
    both characteristic derivatives in the numerator vanish on the invariant trapped set by (3.16).
    Thus the nonzero fixed-energy bracket survives on each halfwave.
    Since ${ phi_(+) \, phi_(-) } = plus.minus 2 { z_1 \, z_2 }$, the assertion follows. ◻
]

#thm([Lemma 9.])[
  (Polynomial growth of tangent derivatives).  #emph[Fix $E eq.not 0$.
    On a neighborhood of the null trapped set in the radial critical manifold
$ r = r_c \( L_z \/ E \) \, wide k_r = 0 \, $

 the flow of the separated fixed-frequency symbol has polynomial growth of every fixed-order tangent derivative.
   The bounds are uniform on compact invariant subsets, include variation through a sufficiently small interval of
   nearby symbol levels, and persist under positive smooth time changes with speed bounded above and away from
   zero. In particular, they hold in the regular stationary time $t$,
   on either sheet with its increasing-time orientation.]
] <geo:tangent-growth>

#proof[
  We first establish a strict angular margin on the null trapped set. There $D = P^2 \/ Delta$ and $Delta < r^2$.
    Expanding $P$ gives
  #[#set math.equation(numbering: n => "(3.19)")
   $ D + 2 frak(a) E L_z & > P^2 / r^2 + 2 frak(a) E L_z\
 & = \( r^2 + 2 frak(a)^2 \) E^2 + frac(frak(a)^2 \( frak(a) E - L_z \)^2, r^2) gt.eq \( r^2 + 2 frak(a)^2 \)
   E^2 . $ <geo:angular-margin>]
  Thus
  #[#set math.equation(numbering: n => "(3.20)")
   $ c_1 = D + 2 frak(a) E L_z - 2 frak(a)^2 E^2 > 0 . $ <geo:oscillator-coefficient>]
  Compactness makes this inequality uniform, and it persists on nearby levels. Also
  $ \| p_(bb(S)^2) \|^2 = D + 2 frak(a) E L_z - frak(a)^2 E^2 sin^2 theta > frak(a)^2 E^2 \, $
  so the angular momentum covector never vanishes.
  Use half the Hamiltonian (3.7) to normalize the separated time.
    On the radial critical manifold its angular field is $H_(D \/ 2) + omega \( L_z \) H_(L_z)$,
    where $omega$ is smooth on the relevant impact interval. The second term is an axial rotation and preserves
    $D \, L_z$. Put
  $ A = frak(a)^2 E^2 \, wide C = D + 2 frak(a) E L_z \, wide Q = C - L_z^2 - A = D - \( L_z - frak(a) E \)^2 \, $
  and let $x_1 = cos theta$. The globally smooth function $x_1$ satisfies
  #[#set math.equation(numbering: n => "(3.21)")
   $ \( x'_1 \)^2 & = \( 1 - x_1^2 \) C - L_z^2 - A \( 1 - x_1^2 \)^2 \,\
\( x'_1 \)^2 + c_1 x_1^2 + A x_1^4 & = Q \, wide x''_1 = - c_1 x_1 - 2 A x_1^3 . $ <geo:oscillator>]
  The second-order equation follows by differentiation away from the turning points and extends to them by
    smoothness. It is a confining oscillator because $c_1 > 0$.
  In particular $Q gt.eq 0$, and its squared amplitude is
  #[#set math.equation(numbering: n => "(3.22)")
   $ d_1^2 = frac(2 Q, c_1 + sqrt(c_1^2 + 4 A Q)) . $ <geo:amplitude>]
  This formula is smooth even at $Q = 0$. Substituting $x_1 = d_1 sin u$ gives the positive invariant period
  #[#set math.equation(numbering: n => "(3.23)")
   $ T_(upright("ang")) \( D \, L_z \) = integral_0^(2 pi) frac(d u, sqrt(c_1 + A d_1^2 \( 1 + sin^2 u \))) .
     $ <geo:angular-period>]
  It depends smoothly on the conserved quantities, including at the constant equatorial orbit where its value is
    $2 pi \/ sqrt(c_1)$. It also remains smooth when the orbit passes through a pole.
  Let $Phi^s$ denote this angular flow, and let $R_zeta$ be axial rotation by $zeta in bb(S)^1$.
    The circle action is free on the angular phase states under consideration.
    Away from the poles it is free on the base; at a pole a nonzero covector has trivial rotational stabilizer.
    The data $D \, L_z \, x_1 \, x'_1$ determine the angular phase state modulo this action.
    Away from the poles this follows from $x'_1 = - sin theta thin p_theta$;
    at a pole $D$ determines the nonzero covector’s norm, and rotations act transitively on covectors of that
    norm. Therefore there is a unique $alpha \( z \) in bb(S)^1$ such that
  #[#set math.equation(numbering: n => "(3.24)")
   $ Phi^(T_(upright("ang")) \( z \)) z = R_(alpha \( z \)) z . $ <geo:angular-return>]
  To justify smoothness without treating the listed invariants as coordinates,
    let $cal(U)$ be the angular phase region with nonzero covectors. Its free circle action is proper, and the map
  $ bb(S)^1 times cal(U) arrow.r cal(U) times_(cal(U) \/ bb(S)^1) cal(U) \,
    wide \( zeta \, z \) mapsto \( z \, R_zeta z \) $
  is a diffeomorphism. The smooth pair $z mapsto \( z \, Phi^(T_(upright("ang")) \( z \)) z \)$ lies in this fiber
    product by the preceding orbit classification. Its inverse gives the smooth $alpha$,
    including at poles and the equatorial limit. Invariance of $T_(upright("ang"))$ and equivariance of the flow
    under axial rotations show that $alpha$ is invariant along the flow.
  For every fixed integer $n$, it follows that
  #[#set math.equation(numbering: n => "(3.25)")
   $ Phi^s z = R_(alpha \( z \)^n) Phi^(s - n T_(upright("ang")) \( z \)) z . $ <geo:angular-iterate>]
  At each evaluation point choose $n$ so the residual time is bounded,
    and keep this integer fixed while differentiating the identity.
    On a compact invariant subset the period is bounded above and away from zero, so $\| n \| =
    O \( 1 + \| s \| \)$. Every fixed derivative of the circle power map and of $s -
    n T_(upright("ang")) \( z \)$ costs only a polynomial factor in $n$,
    while bounded-time flow derivatives are uniformly bounded.
    Hence for each fixed integer $j gt.eq 1$ there are constants $C_j \, N_j$ such that
  #[#set math.equation(numbering: n => "(3.26)")
   $ parallel D_z^j Phi^s parallel lt.eq C_j \( 1 + \| s \| \)^(N_j) . $ <geo:polynomial-tangent>]
  This argument uses the circle-valued return rotation and requires no global real-valued lift of its angle.
  For a positive time change, write
  $ t = integral_0^s tau \( Phi^u z \) thin d u \, wide 0 < c lt.eq tau lt.eq C . $
  The bounds just proved give polynomial bounds for every fixed derivative of this integral.
    Its $s$-derivative is $tau \( Phi^s z \) gt.eq c$; repeated implicit differentiation gives polynomial bounds
    for its inverse $s = s \( t \, z \)$, and $\| s \|$ is comparable to $\| t \|$.
    Composition with $Phi^s$ preserves (3.26). The time changes between separated time and a regular stationary
    Kerr time have precisely these properties on the compact trapped set;
    reverse the separated orientation on the past sheet when parameterizing by increasing $t$.
  Finally, all formulas hold on an angular neighborhood where $c_1 > 0$, allowing $D$ to vary.
    On a nearby level of (3.7), the radial critical equations are unchanged and only the allowed value of $D$ is
    shifted. The smooth embedding $r = r_c \( L_z \/ E \)$, $k_r =
    0$ transfers the estimates to every tangent jet of the restricted flow on this critical manifold. ◻
]

#thm([Proposition 3.])[
  (Normally hyperbolic trapping with escape).  #emph[For each fixed subextremal Kerr metric,
    the energy-normalized photon trap is symplectically transverse of codimension two and has smooth local stable
    and unstable surfaces. Their normal expansion and contraction rates are bounded away from zero.
    All fixed-order tangent derivatives grow subexponentially,
    so the normal rates dominate the tangent dynamics at every fixed order.
    These properties hold on a sufficiently small interval of nearby levels of the separated fixed-frequency
    symbol. A departing radial tail escapes the radial trapping neighborhood and cannot return along a homoclinic
    orbit.]
] <geo:normal-hyperbolicity>

#proof[
  The functions $phi_plus.minus$ of Lemma 8 give the two invariant surfaces; their common zero set is the trap,
    and their nonzero bracket proves symplectic transversality.
    Their differential equations give the normal exponential rates.
    Lemma 9 bounds every fixed-order tangent derivative polynomially, which proves the claimed domination.
  For nearby levels, use the symbol $q_E$ in (3.7) and the spatial field $X = H_(q_E) \/ 2$.
    Continue $z_1$ algebraically as $z_1 = sqrt(Delta) thin k_r \/ E$. On every nearby level one has the exact identity
  #[#set math.equation(numbering: n => "(3.27)")
   $ z_1^2 - z_2^2 = q_E / E^2 + U_c - D / E^2 . $ <geo:off-null-invariant>]
  The quantities $q_E \, D \, E \, L_z$ are constant for $X$, and $X r = E sqrt(Delta) thin z_1$. Therefore
  $ X z_2 = \( partial_r z_2 \) E sqrt(Delta) thin z_1 \, wide X z_1 = \( partial_r z_2 \) E sqrt(Delta) thin z_2 . $
  For the full stationary field, differentiation at fixed Boyer–Lindquist spatial covector gives $X^T = -
    partial_E q_E \/ 2$. In the regular time $t = T + r_(*) - G$, its speed is instead
  $ X^t = X^T + \( r'_(*) - G' \) X r . $
  On the trap $X r = 0$, so $E \/ X^t > 0$ there and in a sufficiently small neighborhood on both sheets.
    Dividing by $X^t$ gives the same positive $lambda$ for both equations, with increasing-time orientation.
    Thus these are invariant hypersurfaces in a full fixed-frequency neighborhood, not merely in its null level.
    Their bracket remains nonzero by continuity. The positive angular margin also persists, as proved above.
  For a trapped impact parameter, Lemma 6 gives $F \( r_(+) \) > 0$.
    Along a departing tail $L_z \/ E$ and $D \/ E^2$ remain fixed,
    and $F^2 \/ Delta$ increases strictly as $r$ moves away from $r_c$ on either side.
    Thus the departure is genuine escape, with no return to the double root. ◻
]

This is the trapping geometry used by the local normally hyperbolic microlocal estimate below
  #cite(label("Dyatlov2016")) #cite(label("Hintz2017")). The argument requires neither a pinching-dependent
  resonance expansion nor a stationary Killing field that is timelike over the whole trapping base.
  The local stable and unstable tails are the real surfaces just constructed;
  outside their neighborhood the radial alternatives permit propagation to microlocal absorption or to the
  ordinary ends. All of these trapping and horizon-source descriptions are invariant under stationary chart
  changes. They also persist, with uniform positive margins after shrinking the parameter neighborhood,
  for small changes of the exact Kerr parameters.

=== 3.4 Ellipticity after spatial projection <ellipticity-after-spatial-projection>

The remaining issue is specific to arbitrary spin. A trapping base point can lie in the ergoregion,
  so one cannot require the stationary operator to be elliptic on an entire base neighborhood.
  The spatial projection of a trapped covector nevertheless lies in an elliptic cone for the slicing of Lemma 5.

#thm([Proposition 4.])[
  (An elliptic cone containing the projected trap).  #emph[Choose $G' = 1$ throughout the photon region.
    The union of the spatial projections of both trapped null sheets is contained, with a positive margin,
    in a spatial conic neighborhood $cal(T)$ with compact base support separated from the horizon and from both
    spatial ends of the estimates. On this neighborhood,
#[#set math.equation(numbering: n => "(3.28)")
 $ b^(i j) \( y \) eta_i eta_j gt.eq c \| eta \|^2 $ <geo:conic-ellipticity>]

 for some $c > 0$ and any fixed auxiliary cotangent norm on the compact base support.
   Both temporal roots there are nonzero and have absolute values comparable to $\| eta \|$.
   One can choose nested smaller and larger conic neighborhoods with these properties,
   and the same choices work after sufficiently small changes of exact Kerr parameters and stationary charts.]
] <geo:projected-ellipticity>

#proof[
  At a trapped null covector, $dot(r) = 0$, so $dot(t) = dot(T)$. Substituting (3.9) into (3.8) gives
  #[#set math.equation(numbering: n => "(3.29)")
   $ frac(Sigma_K k^sharp \( d t \), E) = frac(\( r^2 + frak(a)^2 \) F, Delta) +
     frak(a) (L_z / E - frak(a) sin^2 theta) = Sigma_K + frac(4 M r^2, r - M) . $ <geo:trapped-time-speed>]
  Write $k = - E thin d t + eta$ in the stationary splitting.
    The zero-temporal-component lift of its spatial projection is
  $ eta^arrow.t = k + E thin d t . $
  Using nullness, (3.4), and (3.29), we obtain the exact identity
  #[#set math.equation(numbering: n => "(3.30)")
   $ Sigma_K / E^2 b^(- 1) \( eta^arrow.t \, eta^arrow.t \) & = frac(2 Sigma_K k^sharp \( d t \), E) +
     Sigma_K b^(- 1) \( d t \, d t \)\
 & = Sigma_K + frac(8 M r^2, r - M) - 2 M r > 0 . $ <geo:projected-symbol>]
  The last inequality is strict for every $r > r_(+) > M$.
  The normalized trap is compact by Lemma 6. Its spatial projection is nonzero,
    since a nonzero multiple of $d t$ is timelike and cannot be a null covector.
    Consequently (3.30) gives a positive lower bound relative to $\| eta \|^2$ on that projection.
    Covector reversal supplies the same bound on the other sheet.
    By continuity, a neighborhood in the spatial cosphere has the asserted inequality.
    Its base support may be confined to a fixed compact radial interval separated from the horizon and the spatial
    ends, and nested neighborhoods may be chosen inside this open elliptic set.
  For completeness, the temporal characteristic equation is
  #[#set math.equation(numbering: n => "(3.31)")
   $ b^(t t) E^2 - 2 b^(t i) eta_i E + b^(i j) eta_i eta_j = 0 . $ <geo:temporal-roots>]
  Here $b^(t t) < 0$, while the constant term is positive on $cal(T)$.
    The two real roots therefore have opposite signs and neither vanishes.
    Homogeneity and compactness give the comparability of their absolute values with $\| eta \|$.
    The radial description places the trap of every nearby exact Kerr metric in the same compact neighborhood,
    after shrinking the parameter range. Smooth dependence of the charts, the symbol,
    and the trapped set preserves all the strict margins. ◻
]

There is no assertion of base-space stationary ellipticity in Proposition 4.
  Elsewhere the temporal root gap is still comparable to $\| eta \|$ on each fixed compact spatial set:
  this follows from the timelikeness of $d t$ and the positive definite inverse metric induced on its slices.
  Thus spatial halfwave diagonalization remains available even where one temporal root vanishes.
  Together with strict outflow and the escape alternatives,
  this permits the full-order positive energy sign away from trapping.
  Near infinity the entire zero-frequency spatial symbol is elliptic.

#thm([Lemma 10.])[
  (Zero-energy directions at spatial fiber infinity).  #emph[The zero-temporal-energy characteristic set has no
    photon trapping away from the horizon radial set. Strictly outside the horizon,
    its spatial Hamilton flow is real principal and nonradial,
    including at a covector dual to the stationary Killing vector on the stationary limit surface.
    Consequently the extra characteristics at spatial fiber infinity in an ergoregion do not introduce a further
    stationary trapped set at bounded temporal frequency.]
] <geo:zero-energy>

#proof[
  For a future null covector with $E = 0$ and $r > r_(+)$, positivity of $P = -
    frak(a) L_z$ implies $L_z eq.not 0$ and hence $D > 0$. The radial polynomial and its derivative are
  #[#set math.equation(numbering: n => "(3.32)")
   $ R \( r \) = frak(a)^2 L_z^2 - Delta D \, wide R' \( r \) = - 2 \( r - M \) D < 0 . $ <geo:zero-energy-radial>]
  Thus there is at most one radial turn, and it is simple.
  The spatial fixed-energy Hamilton field is the projection of the full null Hamilton field.
    If its spatial base component vanishes, the full metric dual must be proportional to $partial_T$.
    Nullness then places the base point on the stationary limit surface.
    At such a point (3.32) still has a simple root, so the spatial Hamilton field is nonzero.
    It cannot be a nonzero pure fiber dilation: axial momentum $L_z eq.not 0$ is conserved,
    whereas a nonzero dilation would change it. This proves the nonradial real-principal assertion even at these
    apparently stationary covectors.
  Between the horizons, the radial component of a null ray is nonzero because $d r$ is timelike.
    At the horizon, all crossings other than the generators are transverse.
    Lemmas 6 and 7 therefore exhaust the possible non-escaping behavior.
    At bounded temporal frequency, spatial fiber infinity corresponds to normalized temporal energy zero,
    so it contributes exactly the directions just analyzed and no additional trapping. ◻
]

After the standard horizon-source propagation, with the supported reverse estimate for the transpose problem,
  these zero-energy directions use ordinary real-principal propagation.
  More generally, fixed-energy spatial propagation follows the projected null flow,
  oriented by increasing regular time or reversed for the opposite estimate.
  The ray alternatives connect the trap, the horizon radial region, the far end,
  and inner outflow without requiring a positive Killing-current norm in the ergoregion.
  Stationary affine-in-time coordinate changes preserve this description.
  These are the geometric inputs for the stationary and compact estimates in the next sections.

== 4 Stationary gauges and causal modulation <sec:stationary>

Fix one of the horizon-crossing computing cylinders constructed above,
  with stationary coordinates $\( t \, y \)$ and exact Kerr metric $b$.
  The purpose of this section is to construct a reduced equation whose stationary zero modes can be controlled by
  causal parameter feedback. We first modify the gauge at high spatial frequency,
  retaining the stationary spectral information needed at low frequency.
  We then construct the parameter families, the causal target,
  and the tested inverse that will supply the compact low-frequency estimate.
  All constructions are made separately on each end. Constants may depend on the fixed subextremal Kerr parameters
  and prescribed cylinder.

=== 4.1 The local spectral input and conventions <the-local-spectral-input-and-conventions>

We use the Laplace convention $partial_t = zeta$, with $"Re" zeta gt.eq 0$.
  Choose a smooth stationary function $phi.alt$ equal to the Kerr tortoise coordinate $r_(*)$ near infinity and
  zero on a fixed interior collar. Outgoing fields have the factor $e^(- zeta phi.alt)$. At infinity our convention is

#[#set math.equation(numbering: n => "(4.1)")
 $ H_(upright(b))^(s \, ell) = r^(- ell - 3 \/ 2) H_(upright(b))^s \( d r thin d omega \/ r \) \, $ <st:b-weights>]

where the derivatives in $H_(upright(b))^s$ are $r partial_r$ and unscaled angular derivatives.
  Interior spaces are extendible at the strict inner outflow boundary;
  their dual spaces are supported across that boundary. We denote these conventions by a bar and a dot,
  respectively. The notation $O \( r^(- j +) \)$ permits an arbitrarily small loss in the exponent,
  chosen within the relevant indicial interval.

#thm([Proposition 5.])[
  (Local spectral input).  #emph[On the fixed subextremal Kerr cylinder there are arbitrarily small, stationary,
    smooth, compactly based bundle-map modifications of harmonic gauge and of its symmetric-gradient partner with
    these properties.]
  + #emph[The stationary gauge-potential operator, obtained by applying the modified gauge to a pure Lie
    derivative, is invertible at decay strictly between the powers $1$ and $r^(- 1)$.]
  + #emph[The modified linearized reduced vacuum operator has outgoing inversion at nonzero frequency in the
    closed physical half-plane. Its bounded-frequency estimates, with a weaker compact error,
    are uniform down to zero in the weight interval $- 3 \/ 2 < ell < - 1 \/ 2$.
    Its zero-frequency realization has index zero and a seven-dimensional kernel:
    four gauge-corrected Kerr variations and three translations.]
  + #emph[In outgoing time, a polynomial mode with coefficients of order $O \( r^(- 1 +) \)$ has translation
    leading coefficient if its degree is one. There are no such modes of degree at least two.]
  #emph[For tensors one may take $s > 5 \/ 2$, with strict margin, also sufficient for gauge potentials.
    The uniform near-zero equation norm is $H_(upright(b))^(s - 1 \, ell + 2)$.
    At nonzero frequency the outgoing conditions are $ell < - 1 \/ 2$ and $s + ell > - 1 \/ 2$.]
] <st:hhv>

#proof[
  The gauge-potential assertion is #cite(label("HHV2025")) Theorem 5.1;
    the discussion following that theorem permits arbitrarily small local damping parameters.
    The bounded-frequency estimates and stationary index are #cite(label("HHV2025")) Theorem 5.2,
    and nonzero-frequency inversion and the seven-dimensional kernel are #cite(label("HHV2025")) Theorem 6.6.
    The polynomial-mode assertions are #cite(label("HHV2025")) Proposition 6.8 and Lemma 6.9.
    We verify the geometric conventions for applying these results here.
    The stationary time is horizon-regular, with outgoing time $t - phi.alt$ at infinity.
    In Boyer–Lindquist coordinates there,
  $ r_(*) = r + 2 M log r + O \( 1 \) \, quad b^(t i) = O \( r^(- 2) \) \, quad partial_y \( phi.alt - r \) =
    O \( r^(- 1) \) \, quad b^(- 1) #scale(x: 120%, y: 120%)[\(] d \( t - phi.alt \) \,
    d \( t - phi.alt \) #scale(x: 120%, y: 120%)[\)] = O \( r^(- 1) \) \, $
  with symbol derivatives. The logarithmic coefficient is independent of spin.
    Bounded smooth order-zero offsets in $phi.alt$ preserve the outgoing graphs and polynomial-mode statements.
    Stationary regular chart changes on compact slabs act by smooth component maps and bounded time shifts,
    with only polynomial losses on fixed strips.
  The inner edge may be extended to the chosen $r_b$ between the horizons.
    Between any two strict depths, $d r$ is temporal, so ordinary hyperbolic propagation applies.
    On a strip with bounded $"Re" zeta$, its high-frequency cost is polynomial:
    $"Im" zeta$ is a real tangential Fourier parameter in the radial-time Cauchy estimate,
    and the real Laplace part is a bounded lower-order weight.
    We choose the local damping sufficiently small for the finitely many strict thresholds below.
    This input concerns the local modified operator; it invokes neither nonlinear stability nor inversion after
    spatially nonlocal gauge changes. ◻
]

Normalize the reduced equation by

#[#set math.equation(numbering: n => "(4.2)")
 $ "Ric" \( g \) + \( cal(D)_g + C \) Upsilon = 0 \, wide \( cal(D)_g omega \)_(mu nu) =
   nabla_(\( mu)^g omega_(nu \)) . $ <st:reduced-normalization>]

For a target metric $B$, the differential wave-map gauge is

#[#set math.equation(numbering: n => "(4.3)")
 $ \( Upsilon_(upright("wave")) \( g \; B \) \)_mu = - g_(mu kappa) g^(alpha beta) #scale(x: 120%, y: 120%)[\(]
   Gamma \( g \)_(alpha beta)^kappa - Gamma \( B \)_(alpha beta)^kappa #scale(x: 120%, y: 120%)[\)] . $ <st:wave-gauge>]

Write $E_(upright(g))$ for the addition to this gauge and $C$ for the addition to its partner,
  including the local terms just obtained. At $g = B = b$ write

$ cal(B) = D Upsilon_(upright("wave")) \|_(b \; b) + E_(upright(g)) \, wide L = "Ric"'_b + \( cal(D)_b + C \) cal(B) . $

The notation $L \( zeta \)$ means substitution of $partial_t = zeta$.
  We write $L_(upright(h))$ for the local operator before the high-spatial-frequency changes made next.

=== 4.2 Gauge transport on the spatial elliptic cone <gauge-transport-on-the-spatial-elliptic-cone>

The geometric analysis supplies a compactly based spatial conic neighborhood $cal(T)$ of both projected trapped
  sets, disjoint from the horizons and ends of the cylinder,
  on which the zero-frequency spatial principal symbol is strictly elliptic.
  We use this cone instead of a timelike neighborhood in the spatial base.
  The two temporal characteristic roots remain separated because the $t$-slices are spacelike.

For this construction let $macron(g)$ be an exact nearby stationary Kerr metric in a chart of the same type,
  and let $B_0$ be a close stationary target. We calibrate the transport of

#[#set math.equation(numbering: n => "(4.4)")
 $ "Ric"'_(macron(g)) + \( cal(D)_(macron(g)) + C \) #scale(x: 120%, y: 120%)[\(] D
   Upsilon_(upright("wave")) \|_(macron(g) \; B_0) + E_(upright(g)) #scale(x: 120%, y: 120%)[\)] .
   $ <st:frozen-general>]

At equal metrics without additions, this is ordinary tensor parallel transport after removal of scalar
  wave-amplitude transport. Changing $B_0$ inserts only an algebraic term $K_(upright("alg"))$ in the linearized
  gauge. We use these wave-gauge identities in the following construction.

#thm([Lemma 11.])[
  (Conic gauge calibration).  #emph[The additional gauge and partner terms can be chosen as real spatial
    pseudodifferential operators $A_0 + A_1 partial_t$, with respective spatial orders $0 \, - 1$, such that:]
  + #emph[their kernels are compactly supported in both variables away from horizons and boundaries,
    and their high-frequency microsupport lies in $cal(T)$;]
  + #emph[at sufficiently high spatial frequency their transport near each trapped set is exactly compatible with
    a smooth positive homogeneous bundle metric;]
  + #emph[at the base metric the unsaturated transport and cutoff transition have imaginary subprincipal defect
    smaller than any prescribed fixed fraction of the minimum normal expansion rate;]
  + #emph[the additional temporal-acceleration coefficients have spatial order at most $-
    1$ and are small on any prescribed finite Sobolev list when the high-frequency cutoff $Lambda$ is sufficiently
    large.]
  #emph[The prescription is smooth in the stationary metric and target.
    The symbol bounds are uniform for large $Lambda$ and for a sufficiently small fixed parameter neighborhood.]
] <st:conic-gauge>

#proof[
  For a null covector $k$ define
  $ Q_k H = H \( k^sharp \, dot.op \) - 1 / 2 \( "tr"_(macron(g)) H \) k \, wide d_k e = k ⊙ e \, $
  where $⊙$ is averaged symmetric product. The map $d_k$ is injective and $Q_k$ is surjective,
    since trace reversal is invertible. Nullity gives $"im" d_k subset ker Q_k$.
    Parallel transport preserves this flag, with quotient the traceless symmetric tensors of the Euclidean screen.
    Up to a common scalar normalization the available changes are $d_k E_(upright(g)) \( k \)$ and $C \( k \) Q_k$.
  Normalize $k$ by its conserved nonzero stationary energy:
    $n = k^(sharp_(macron(g))) \/ E$ is parallel along its null geodesic.
    Choose a stationary future $macron(g)$-unit timelike field $T$ and set
  $ alpha = - macron(g) \( n \, T \) > 0 \, wide l = T / alpha - frac(n, 2 alpha^2) . $
  Thus $macron(g) \( l \, l \) = 0$ and $macron(g) \( n \, l \) = - 1$.
    In the screen ${ n \, l }^perp$ choose local orthonormal vectors $e_A$.
    Writing $nabla$ for transport along the geodesic, preservation of these inner products gives
  $ nabla n = 0 \, wide nabla l = w \, wide nabla e_A = sum_B omega_(A B) e_B + macron(g) \( w \, e_A \) n \, wide
    omega_(A B) = - omega_(B A) \, $
  where $w$ is a screen vector. In particular there is no diagonal boost term:
    conservation of $E$ has made $n$ parallel, not merely parallel up to scale.
    Give $n$ positive length $epsilon.alt$, $l$ length $epsilon.alt^(- 1)$, and the screen its ordinary metric.
    The null-rotation terms have norm $O \( epsilon.alt \)$ in this metric, whereas the screen rotation is skew.
    The construction patches without a global screen frame and gives a positive homogeneous tensor metric.
    Its non-skew transport is arbitrarily small, also on the fixed tensor power.
  Choose metric transport preserving the orthogonal flag splitting, with the same induced quotient transport.
    Its difference $A$ from the original transport maps $ker Q_k$ into $"im" d_k$ and is otherwise unrestricted.
    It is therefore realized by the available changes: for a smooth right inverse $R_k$ of $Q_k$, put $P_k = 1 -
    R_k Q_k$ and take
  $ E_(upright(g)) \( k \) = d_k^(- 1) A P_k \, wide C \( k \) = A R_k . $
  Then $d_k E_(upright(g)) \( k \) + C \( k \) Q_k = A$. Compensate also $K_(upright("alg"))$ and the local
    additions in prescribing the total transport. Smooth projections and right inverses give smooth symbols.
    The normalized-ray construction can be chosen real and invariant under simultaneous covector reversal.
    Transport before time normalization is odd of degree one, and the gauge-factor symbols are even of degree zero.
  At $b$ choose the local additions small after the flag scaling.
    Convex interpolation to compatible transport preserves the strict subprincipal margin through the
    high-frequency transition. Write the roots as $k = \( - P_plus.minus \( y \, eta \) \, eta \)$ and let
    $E_plus.minus^(upright("add"))$ be the extra value prescribed for either gauge factor on the two roots. Set
  #[#set math.equation(numbering: n => "(4.5)")
   $ A_1 = frac(E_(+)^(upright("add")) - E_(-)^(upright("add")), - i \( P_(+) - P_(-) \)) \, wide A_0 =
     E_(+)^(upright("add")) + i P_(+) A_1 . $ <st:root-interpolation>]
  Since $\| P_(+) - P_(-) \| gt.tilde \| eta \|$, these have orders $- 1 \, 0$.
    Reversal interchanges the sheets; thus $A_0$ is real-even, $A_1$ imaginary-odd, and $A_0 +
    A_1 partial_t$ is real. Extend and patch the values on each sheet before the single spatial interpolation.
    Overlap of their projections creates no conflict, including over the ergoregion.
  Use an even conic cutoff in $cal(T)$, equal to one near both projected trapped sets,
    and a cutoff $\| eta \| gt.tilde Lambda$. Quantize with compact kernel cutoffs in both variables.
    Products using both order-zero gauge factors have no remaining first derivative and do not contribute to
    transport order. Thus the common scalar cutoff really interpolates the first-order transport;
    symbol derivatives in compositions are lower order. Kernel localization preserves its homogeneous symbol.
    Outside a slightly enlarged cone, separated-support composition or integration by parts away from the spatial
    diagonal gives smoothing leakage $O \( Lambda^(- N) \)$ in every prescribed fixed seminorm,
    for every fixed $N$. The full symbols are uniformly bounded in their orders.
    Each extra coefficient of a second time derivative has a spatial gain of at least one,
    hence is small on any fixed finite Sobolev list. The mode-preserving finite-rank corrections below are
    smoothing and do not alter the calibration. Repeating the prescription at each frozen metric makes
    compatibility exact near its trap. ◻
]

=== 4.3 Stationary estimates after the conic modification <stationary-estimates-after-the-conic-modification>

We separate bounded frequency, high frequency, and the outgoing spatial transpose.
  The last is the bilinear #emph[spatial] transpose, whose outgoing exponential has the same sign as the primal
  exponential. Fix a small weight slack $0 < iota lt.double 1$ in the weighted scattering estimates below.

#thm([Proposition 6.])[
  (Stationary estimates).  #emph[For sufficiently large $Lambda$,
    the conically modified base operator has the following estimates.]
  + #emph[Bounded-frequency estimates with weaker compact errors persist uniformly as $Lambda arrow.r oo$,
    at the orders and zero-frequency weights of Proposition 5.
    The stationary index is zero, and kernel and cokernel are upper semicontinuous.
    On closed bounded bands excluding zero, the physical estimates persist without compact error,
    up to $"Re" zeta arrow.b 0$.]
  + #emph[For every fixed strip $0 lt.eq "Re" zeta lt.eq D_(*)$ and fixed admissible order,
    there are polynomial high-frequency bounds without kernel,
    with threshold independent of sufficiently large $Lambda$.
    These include the compact $H^s$ estimate from $H^(s - 1)$, for $s = 5$ or a fixed higher admissible order,
    the supported dual solution estimate of order $1 - s$, and
$ chevron.l r chevron.r^(- 1 \/ 2 - iota) \( v \, partial_y v \) in L^2 $

 for the physical transpose with a compact smooth source, with polynomial frequency cost.]
  + #emph[Zero-frequency estimates, including those for gauge potentials,
    persist uniformly for nearby exact Kerr principal metrics in smooth stationary,
    asymptotically affine charts of the prescribed type. Fixed smooth finite-dimensional supplements remove their
    kernel and cokernel locally in parameters.]
  #emph[The same-sign outgoing transpose has the a priori estimate and index stated in Lemma 12.]
] <st:stationary-estimates>

#proof[
  #emph[Bounded frequency.] The additional operator has spatial order at most one and compact elliptic
    microsupport. Let $beta$ be an order-zero elliptically supported cutoff equal to one on an enlarged
    neighborhood of that microsupport. On fixed enlarged compact sets $K'$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ parallel \( L - L_(upright(h)) \) \( zeta \) u parallel_(H^(s - 1)) lt.eq
     C Lambda^(- 1) parallel "Op" \( beta \) u parallel_(H^(s + 1)) +
     O \( Lambda^(- N) \) parallel u parallel_(H^s \( K' \)) . $ <st:elliptic-smallness>]
  Nested cutoffs and the high-frequency cutoff give this estimate,
    including arbitrary-order separated-symbol remainders. An elliptic parametrix for the operator without
    additions controls the stronger norm. The addition is already bounded $H^s arrow.r H^(s - 1)$,
    so the bounded-frequency interior graph domains agree. The same argument applies to supported dual orders,
    since reversed covectors remain elliptic, and to gauge potentials.
    It proves persistence of compact-error estimates, index, and semicontinuity.
    Smoothing subtractions of size $O \( Lambda^(- N) \)$ do not change this reasoning.
  We recall why physical homogeneous limiting-absorption states on a closed nonzero band belong to the outgoing
    class in Proposition 5. The passage from physical limiting absorption to outgoing conormality uses the
    unchanged Kerr end and the interior propagation verified above.
    The physical solution and source weights are $chevron.l y chevron.r^(- 1 \/ 2 - iota)$ and $chevron.l y
    chevron.r^(1 \/ 2 + iota)$. The incoming radial estimate gives the outgoing microlocal condition for a
    homogeneous real-frequency limit. Exterior rotation commutators are short-range because the principal $1 \/
    r$ correction is rotation invariant. Divided rotation differences, exterior propagation,
    and spatial ellipticity for unscaled derivatives and fixed-annulus errors give the same scattering estimate
    after any fixed number of rotations, with positive slack.
    Thus, for a limit $h_(upright("lim"))$ of the local operator,
    $r h_(upright("lim"))$ and its radial derivative lie in $L^2 \( r^(- 1 - 2 iota) d r thin d omega \)$ with
    those rotations.
  Divide the radial equation by its exact radial coefficient.
    Its leading factorization in tortoise coordinate is
    $\( partial_(r_(*)) - zeta \) \( partial_(r_(*)) + zeta \) \( r h_(upright("lim")) \)$;
    the remaining symbol terms are $O \( r^(- 2) \)$ with at most two angular derivatives or one radial and one
    angular derivative. Integrating the first factor from infinity, with the incoming homogeneous term excluded,
    gives $O \( r^(- 1 + iota) \)$ for the second factor by weighted Cauchy–Schwarz.
    On the imaginary axis put $w = e^(zeta r_(*)) r h_(upright("lim"))$.
    It has size $O \( r^iota \)$ and the first symbol-derivative estimate, and
  #[#set math.equation(numbering: n => "(4.7)")
   $ \( partial_(r_(*)) - 2 zeta \) partial_(r_(*)) w = O \( r^(- 2) \) #scale(x: 120%, y: 120%)[\(]
     partial_omega^(lt.eq 2) w \, partial_omega^(lt.eq 1) partial_(r_(*)) w #scale(x: 120%, y: 120%)[\)] .
     $ <st:outgoing-symbol>]
  Here is the derivative induction explicitly. Write the right side as $F = r^(- 2) \( A_2 w + A_1 w' \)$,
    with symbol-bounded angular operators $A_2 \, A_1$ of orders at most two and one.
    Initially $w = O \( r^iota \)$ and $w' = O \( r^(- 1 + iota) \)$.
    The equation first gives the raw bound $w'' = 2 zeta w' + F = O \( r^(- 1 + iota) \)$.
    It follows that $F' = O \( r^(- 3 + iota) \)$, including the term $r^(- 2) A_1 w''$.
    Differentiating the equation and excluding its nondecaying homogeneous solution gives
  $ w'' \( r_(*) \) = - integral_(r_(*))^oo e^(2 zeta \( r_(*) - s \)) F' \( s \) thin d s = O \( r^(- 2 + iota) \) . $
  In general, symbol bounds through $w^(\( j - 1 \))$ first give the raw bound $w^(\( j \)) =
    O \( r^(- j + 1 + iota) \)$. Then $F^(\( j - 1 \)) = O \( r^(- j - 1 + iota) \)$,
    including its highest derivative term, and integration of $\( partial_(r_(*)) - 2 zeta \) w^(\( j \)) =
    F^(\( j - 1 \))$ gives $w^(\( j \)) = O \( r^(- j + iota) \)$.
    The raw decay excludes the homogeneous term also when $"Re" zeta = 0$.
    Angular derivatives are included throughout, and initial slack is chosen smaller than the intended final
    slack. This gives outgoing b-regularity, and radial propagation upgrades interior regularity above threshold.
    Proposition 5 excludes the resulting homogeneous limit. In the open half-plane one may instead use its
    outgoing primal solvability and the physical index argument below.
    The microlocal smallness (4.6) now retains the closed-band estimates for $L$.
    Dual estimates follow from the open half-plane. The contour argument will use bounds up to the imaginary axis,
    not an ordinary unweighted inverse there.
  #emph[High frequency.] We apply the local outgoing normally hyperbolic estimate of #cite(label("Dyatlov2016"))
    Theorem 1, with the scalar-principal bundle formulation and positive pseudodifferential metrics of
    #cite(label("Hintz2017")) Condition (2.5), Proposition 3.12.
    Its hypotheses are a symplectically transverse codimension-two trapped set,
    smooth stable and unstable surfaces, and imaginary subprincipal transport defect strictly below half the
    minimum normal rate in a positive metric, including its transport and the half-density convention.
    The geometric defining functions $z_1 plus.minus z_2$ and Lemma 11 verify these hypotheses for each
    nonzero-energy sign with margin.
  To use the separated symbol $q_E = Sigma_K b^(- 1) \( k \, k \)$ of (3.7),
    an operator initially written with principal symbol $b^(- 1) \( k \, k \)$ can be normalized microlocally by
    symmetric sandwiching with the smooth elliptic multiplier $sqrt(Sigma_K)$.
    In half-density Weyl calculus the two first-order bracket terms in this symmetric sandwich cancel,
    so its subprincipal symbol is $Sigma_K$ times the original one.
    On the characteristic trap $H_(Sigma_K p) = Sigma_K H_p$;
    the derivative of a chosen bundle metric scales by the same factor.
    Consequently the pointwise relative transport margin is preserved.
    For a theorem stated with the supremum of the defect and the minimum normal rate,
    fix this normalization first and choose the defect sufficiently small using the positive minimum and finite
    maximum of the scaling factor on the compact trapped neighborhood.
    The gauge calibration permits arbitrarily small defect before saturation and zero defect at saturation,
    so this choice imposes no additional hypothesis.
  For $k = - E thin d t + eta$,
  $ partial_E #scale(x: 120%, y: 120%)[\(] b^(- 1) \( k \, k \) #scale(x: 120%, y: 120%)[\)] = - 2 k^sharp \( d t \) . $
  Its sign is separated on each characteristic sheet because $d t$ is timelike,
    also after rescaling at spatial fiber infinity. Orient projected propagation by increasing regular $t$,
    dividing the Hamilton field by its $t$-speed. At trapping $k^sharp \( d t \) \/ E > 0$;
    the frequency and time normalizations differ by a bounded positive factor after fixing orientations.
    The subprincipal margin is selected after these normalizations.
    More precisely, if $f$ is the positive time-change factor,
    $f_max$ its maximum on the compact microlocal neighborhood,
    and $nu_min^(upright("new")) > 0$ the minimum normal rate for the normalized flow,
    choose the arbitrarily small flag defect $delta$ so that $f_max delta < nu_min^(upright("new")) \/
    2$ with fixed surplus. Choose the local additions smaller than that surplus.
    Compatible saturated transport has zero defect, and the convex cutoff transition retains the margin.
    Merely scaling rates and defects pointwise would not suffice for this global supremum–infimum comparison.
    Scalar half-density transport is scalar wave-amplitude transport with stationary density;
    its remaining bundle transport is the calibrated one. The bounded positive real Laplace part therefore
    supplies damping on either trapped sheet. The horizon radial operator is unchanged and has positive redshift.
  The ray alternatives give strict outflow and no returns from infinity or homoclinic returns.
    Incoming propagation from infinity, ordinary real-principal propagation, radial estimates,
    and the trap estimate control the characteristic set modulo lower remainders.
    For the transpose use the opposite propagation direction.
    A fixed Killing-energy sign can encounter ergoregion rays with a different time orientation.
    They cannot be trapped, since the double-root identities with future $P > 0$ force future $E > 0$.
    They use only escape or radial propagation. At spatial fiber infinity with normalized temporal energy zero,
    the new symbols miss all nonelliptic directions and the horizon radial geometry;
    the zero-energy alternatives give ordinary nonradial propagation.
    The positive metric extends to the required microlocal neighborhood.
    This uses a local outgoing theorem, not global Kerr–de Sitter inversion or a positive Killing-current norm in
    the ergoregion.
  We check uniformity in $Lambda$. On characteristic added microsupport, $c \| zeta \| lt.eq \| eta \| lt.eq
    C \| zeta \|$. Put $h_f = \| zeta \|^(- 1)$ and $xi = h_f eta$.
    On $\| eta \| gt.eq c' \| zeta \|$, the additional terms in $h_f^2
    L$ are uniformly $O \( h_f \)$ of maximal spatial order one,
    by the ordinary $S_(1 \, 0)^j$ bounds on coefficients of orders $1 \, 0 \, - 1$ multiplying zero, one,
    and two powers of $zeta$. Outside an enlarged elliptic cone they are $O \( h_f^oo \)$ smoothing.
    Where the cutoff changes at the trap, $Lambda \/ \| zeta \|$ is bounded above and below,
    so its rescaled derivatives are uniformly bounded. Its first transport is the controlled scalar interpolation;
    symbol derivatives in gauge composition are lower order. Substitution of the bounded real Laplace part in the
    extra time-derivative factors also changes only lower orders.
    At large relative spatial frequency the added microsupport is itself elliptic,
    and the additions vanish at the radial set.
  For $\| eta \| lt.eq c' \| zeta \|$, with $c'$ sufficiently small,
    the wave symbol has size $gt.tilde \| zeta \|^2$. Write the perturbation as
  $ zeta^2 K_(- 1) + zeta K_0 + K_1 \, $
  with subscripts denoting maximal spatial orders. Relative to elliptic inversion its first term costs
    $O \( Lambda^(- 1) \)$ and the others $O \( \| zeta \|^(- 1) \)$.
    Separated localizations from this sector to the characteristic set have rapid frequency decay,
    including for fixed-rank smoothing terms. No uniform smooth semiclassical symbol at $xi = 0$ is asserted.
    These errors are absorbed after propagation with a threshold independent of large $Lambda$.
    Large positive Laplace lines also admit forward wave energy after the small acceleration correction is solved.
    This proves the polynomial strip bounds and the exterior scattering bounds.
  #emph[Nearby stationary parameters.] At zero frequency the horizon inequalities remain strict after pullback to
    nearby exact Kerr principal models. Lower-order terms vary smoothly,
    high additions remain elliptic and away from the horizon,
    and the normal operator at infinity is a positive constant-coefficient Laplacian after a constant linear
    spatial change, with unchanged indicial gaps. Add a fixed smooth finite-dimensional supplement removing the
    center’s kernel and cokernel. Primal and dual compact-error estimates, compactness,
    and equation convergence keep the supplemented problem invertible:
    otherwise a normalized contradicting sequence yields a nonzero limiting nullstate.
    This avoids demanding smallness of a changing principal operator on a fixed one-derivative graph.
    Gauge potentials obey the same argument. When high spatial regularity is needed only on a compact set,
    the b-elliptic end permits lower solution and equation derivative orders after a switch across fixed full
    elliptic annuli, with the higher source norm maintained slightly farther out. ◻
]

The transpose argument uses three realizations of the stationary operator.
  The physical equations act on the original fields through $L \( zeta \)$ and its supported spatial transpose
  $L \( zeta \)^t$. Removing the outgoing exponential gives, respectively,

$ P_(upright("out")) \( zeta \) = e^(zeta phi.alt) L \( zeta \) e^(- zeta phi.alt) \, wide P^sharp \( zeta \) =
  e^(zeta phi.alt) L \( zeta \)^t e^(- zeta phi.alt) . $

The second is a same-sign outgoing conjugation of the physical transpose. In particular,

$ P_(upright("out")) \( zeta \)^t = e^(- zeta phi.alt) L \( zeta \)^t e^(zeta phi.alt) . $

The conjugating factors are reversed when the outgoing primal is transposed.
  We first estimate $P^sharp$ near zero and then compute its index at nonzero frequency,
  using different exterior equation spaces for these two purposes.

#thm([Lemma 12.])[
  (The outgoing spatial transpose).  #emph[Fix $ell_(upright("wt")) = - 1 \/ 2 - iota$,
    with $0 < iota lt.double 1$, and a sufficiently large fixed exterior derivative order $j$.
    Let $cal(A)$ have supported interior order $- 4$ and exterior space
    $H_(upright(b))^(j \, ell_(upright("wt")))$; let $cal(S)$ have supported interior order $-
    5$ and exterior space $H_(upright(b))^(j - 1 \, ell_(upright("wt")) + 2)$. For
$ P^sharp \( zeta \) = e^(zeta phi.alt) L \( zeta \)^t e^(- zeta phi.alt) $

 there is an estimate from $cal(S)$ to $cal(A)$ with a weaker compact error, uniform near zero.
   At each fixed small nonzero $zeta$ with $"Re" zeta > 0$, the graph using instead the exterior equation space
   $H_(upright(b))^(j \, ell_(upright("wt")) + 1)$ has index zero, also after compact smooth finite-rank augmentation.]
] <st:transpose>

#proof[
  Combine the supported interior stationary dual estimate with the primal outgoing estimate cut to infinity.
    In Cartesian trivializations the difference of the conjugated transpose and comparison primal operator is
  $ O \( r^(- 2) \) partial_y + O \( r^(- 3) \) + \( zeta + zeta^2 \) O \( r^(- 2) \) . $
  The symbol bounds, notably $b^(t i) = O \( r^(- 2) \)$ and connection coefficients of that order,
    give this expression. It is small between the indicated spaces sufficiently far out and near zero.
    Switch orders across fixed full elliptic annuli beyond all compact kernels. This proves the a priori estimate.
  For the index, first the unconjugated physical primal and supported transpose have index zero for each $"Re"
    zeta > 0$. Use interior solution/equation orders $s \, s - 1$ with $s = 5$ and $1 - s \, - s$, respectively,
    and ordinary unweighted fixed-frequency graphs outside. The Fourier normal operator at infinity is a multiple
    of the flat spatial Laplacian minus $zeta^2$, hence invertible.
    At high interior spatial frequency the normalized temporal energy is zero; ordinary propagation,
    non-adverse redshift, their supported dual estimates, and strict outflow give compact-error estimates in both
    directions. The additions are lower order over ellipticity or smoothing with compact kernels.
    Thus the graph domains are locally constant in the open half-plane and both problems are Fredholm.
  On a sufficiently large forward line, wave energy and past integration give primal inversion and uniqueness
    after solving the small order-$\( - 1 \)$ normal-acceleration correction.
    Begin with natural unweighted orders, then use exterior ellipticity.
    Duality gives transpose solvability; testing against primal solutions at slightly raised compact orders gives
    its uniqueness. Continuation establishes the physical indices, which compact smooth finite-rank terms do not change.
  The comparison outgoing primal problem uses $L_(upright(h))$ with extendible interior orders and exactly the
    exterior graph proposed for the outgoing transpose. Proposition 5 gives solvability on compact smooth data,
    trivial kernel, and an estimate with compact error. Altering interior orders uses the one-order propagation
    estimate, homogeneous regularity above threshold, and annular ellipticity.
    This comparison also has index zero. Exchange its end with the physical supported transpose end in their
    direct sum, by a smooth signed exchange on an elliptic annulus outside all kernels.
    Domain and range spaces identify, and collar errors are Rellich compact.
  On the conjugated end the fixed-frequency difference is $O \( r^(- 2) \) partial_y + O \( r^(- 2) \)$.
    Its graph additionally controls $H_(upright(b))^(j + 1 \, ell_(upright("wt")) - 1)$.
    Indeed, if $V in H_(upright(b))^(j \, ell_(upright("wt")))$ and its equation $P V in
    H_(upright(b))^(j \, ell_(upright("wt")) + 1)$, write
  $ r^2 P = B_2 + r B_1 + B_0 \, $
  where $B_2$ is b-elliptic of order two and the remaining terms have order at most one,
    with uniformly bounded symbol coefficients at this fixed nonzero frequency.
    Both $r^2 P V$ and $\( r B_1 + B_0 \) V$ lie in $H_(upright(b))^(j - 1 \, ell_(upright("wt")) - 1)$;
    elliptic regularity gives the asserted extra derivative. Since $r^(- 2)
    partial_y$ is $r^(- 3)$ times a b-vector field, the first-order difference maps this improved graph regularity
    to $H_(upright(b))^(j \, ell_(upright("wt")) + 2)$. The zeroth-order difference maps the original $V$ to the
    same space. Thus the difference gains one tail weight relative to the equation space
    $H_(upright(b))^(j \, ell_(upright("wt")) + 1)$, with norm $O \( Y^(- 1) \)$ beyond radius $Y$.
    On each finite annulus ordinary graph ellipticity gives two local derivatives over the equation order,
    so Rellich compactness handles the remaining compact part.
    The other exchanged summand is a physical primal problem of index zero.
    Hence the desired outgoing transpose graph has index zero.
    All high additions remain on their original interior pieces in this argument.
  This gives an index, not automatically an inverse. If a compactly forced outgoing conjugated transpose problem
    has trivial kernel, index zero supplies its inverse. Its solution $V$ gives the physical test $v =
    e^(- zeta phi.alt) V$, exponentially decaying at infinity.
    Supported–extendible integration by parts against these tests kills the physical primal kernel,
    and physical index zero yields inversion. The stronger near-zero $cal(S)$ estimate is used on graph states
    with that extra source weight. This never identifies $P^sharp \( zeta \)$ with the transpose of the conjugated
    primal. ◻
]

=== 4.4 Stationary profiles and exact parameter families <stationary-profiles-and-exact-parameter-families>

We next retain the physical zero modes while installing the conic gauge,
  and integrate the relevant directions into exact Kerr families.
  The indicial calculation below identifies the required parameter directions at the fixed center.

#thm([Lemma 13.])[
  (Profiles and mode-preserving corrections).  #emph[There are smooth stationary tensors $H_i$ for $1 lt.eq
    i lt.eq 4$ and $J_i \, H_i^1$ for $1 lt.eq i lt.eq 3$, with stationary vector fields $V_i \, W_i$, such that
#[#set math.equation(numbering: n => "(4.8)")
 $ J_i = cal(L)_(V_i) b \, wide H_i^1 = cal(L)_(W_i) b + 2 d t ⊙ V_i^flat \,\
V_i = e_i + O \( r^(- 1) \) \, wide W_i = y_i partial_t + O \( r^(0 +) \) \,\
cal(B) H_i = cal(B) J_i = cal(B) \( t J_i + H_i^1 \) = 0 \, wide L \( 0 \) H_i = L \( 0 \) J_i = 0 \, wide
  L \( 0 \) H_i^1 = - \[ L \, t \] J_i . $ <st:profile-definition>]

 Here $e_i$ are coordinate translations near infinity and $H_i$ are gauge-corrected Kerr variations. In symbol orders,
#[#set math.equation(numbering: n => "(4.9)")
 $ H_i \, H_i^1 = r^(- 1) \( upright("smooth angular term") \) + O \( r^(- 2 +) \) \, wide J_i =
   r^(- 2) \( upright("smooth angular term") \) + O \( r^(- 3 +) \) . $ <st:profile-tails>]

 The additional high-frequency gauge can be changed by $O \( Lambda^(- N) \)$ finite-rank smoothing terms,
   for every fixed $N$, so that these identities remain exact.
   Its decaying stationary kernel then consists precisely of the seven independent $H_i \, J_i$.]
] <st:profiles>

#proof[
  For the local gauge, the starting profiles are the Kerr, translation,
    and boost profiles of #cite(label("HHV2025")) Lemmas 6.1–6.3, Proposition 6.5, and (6.6).
    We record the end estimates needed here, including the sharper translation-potential bound,
    and then preserve their identities under the conic modification.
  Begin with the local gauge of Proposition 5. Correct cut-off Kerr, translation,
    and boost generators successively with its stationary gauge-potential inverse.
    The errors requiring nondecaying correction, for Kerr and the stationary boost part, are $O \( r^(- 2) \)$.
    Shifting to a slight growth weight $O \( r^(0 +) \)$ is surjective by indicial Fredholm regularity:
    its cokernel is already zero at decay.
  The translation correction has an $O \( r^(- 3) \)$ leading error which is a constant linear combination of
    second Cartesian derivatives of degree-$\( - 1 \)$ symbol-leading coefficients.
    Each has zero spherical mean, as follows by integration over shells and surface scaling.
    Hence the decaying vector correction has an $r^(- 1)$ angular leading term without a leading logarithm.
    The identity $cal(L)_(t e_i + y_i partial_t) eta_(upright("Mink")) = 0$ and the gauge correction give $t J_i +
    H_i^1 = cal(L)_(t V_i + W_i) b$ and (4.8) for the local gauge.
    The flat-Laplacian indicial expansion gives (4.9), using $b^(t i) =
    O \( r^(- 2) \)$ in the equation for $H_i^1$. The sublinear correction vectors for Kerr and for $W_i -
    y_i partial_t$ have first derivatives $O \( r^(- 1) \)$ with symbol bounds.
    Indeed their flat symmetric gradients have that order by the tensor profile expansion.
    Differentiating and permuting indices gives second derivatives of order $r^(- 2)$;
    integrating along rays from infinity, where first derivatives vanish, gives the stated bound.
    These arguments use smooth Kerr symbols, indicial regularity at infinity,
    and compact propagation above threshold, without a restriction on spin.
  The seven stationary profiles are independent already on a sufficiently far exterior region,
    away from the trapping base. A stationary sublinear-symbol gauge preserves the $1 \/
    r$ coefficient of the stationary Killing-time norm and the leading curl of $b_(t i) thin d y_i \/ b_(t t)$.
    A stationary time displacement adds an exact form to the latter,
    and its spatial Lie derivative is lower order. The Kerr expansions therefore detect the mass and angular
    momentum vector, with fixed normalized Cartesian axes. A nonzero translation combination cannot have zero Lie
    derivative there, since it commutes with $partial_t$ and its action on the leading radial coefficient of
    $b \( partial_t \, partial_t \)$ is nonzero. Thus compact smooth functionals away from a physical trapping
    neighborhood separate the modes; no elliptic unique continuation across that neighborhood is required.
  At the base point, subtract finite-rank spatial smoothing terms from the high addition to $E_(upright(g))$ so
    that its $A_0$ part annihilates the span of $H \, J \, H^1$ and its $A_1$ part annihilates $J$.
    To be explicit, choose a compact cutoff $chi_(upright("in"))$ equal to one on all input supports.
    Let $q_alpha$ be a basis of the actual finite-dimensional span of $chi_(upright("in")) H \,
    chi_(upright("in")) J \, chi_(upright("in")) H^1$, and choose compact smooth tests $lambda_alpha$ with
    $lambda_alpha \( q_beta \) = delta_(alpha beta)$. For the high-cutoff operator $A_(0 \, Lambda)$ subtract
  $ S_0 f = sum_alpha \( A_(0 \, Lambda) q_alpha \) lambda_alpha \( chi_(upright("in")) f \) . $
  The identity $A_(0 \, Lambda) = A_(0 \, Lambda) chi_(upright("in"))$ shows that $A_(0 \, Lambda) -
    S_0$ annihilates every original profile, including when their restrictions are dependent.
    Use the same construction on the span of $chi_(upright("in")) J$ for $A_(1 \, Lambda)$.
    Each $q_alpha$ is fixed, smooth, and compactly supported.
    Consequently $A_(0 \, Lambda) q_alpha = O \( Lambda^(- N) \)$ in each fixed smooth seminorm for every fixed
    $N$, and the finite-rank kernel formula gives the same statement for $S_0$ and $S_1$ in every fixed smoothing
    norm. The constants may depend on that norm and on $N$: only the finite base list is made small by the single
    choice of $Lambda$. Hence the profile identities remain exact.
    The seven modes persist, and Proposition 6 excludes any enlargement of the decaying kernel.
    Gauge-potential invertibility persists by the same elliptic smallness.
    Index and weak compactness give the corresponding cokernel continuity towards the local-gauge limit.
    Extend these smoothing subtractions smoothly to nearby parameters. ◻
]

The decaying stationary modes are not the whole kernel when a field is allowed slight growth at infinity.
  A constant symmetric covariant two-tensor in four dimensions has ten independent coefficients.
  The next proposition realizes these constant asymptotes by additional homogeneous modes and uses them to choose
  an exact stationary reference. Their constant leading terms arise from affine coordinate changes;
  their normalization may also add decaying Kerr and gauge directions.
  They therefore do not represent ten additional physical Kerr parameters.

#thm([Proposition 7.])[
  (Exact stationary families and supplements).  #emph[For small $p = \( m \, v \) in bb(R)^4 times
    bb(R)^3$ there is a smooth family $G_p$ of exact diffeomorphic stationary Kerr metrics with $G_0 = b$,
    tangent directions $H \, cal(L)_W b$, and symbol asymptote
#[#set math.equation(numbering: n => "(4.10)")
 $ G_p - eta_v = O \( r^(- 1) \) \, wide eta_v = - \( 1 - \| v \|^2 \) d t^2 -
   2 v_i thin d y_i thin d t + \| d y \|^2 . $ <st:affine-asymptote>]

 Let $L_p \( 0 \)$ denote the stationary linear reduced operator at metric and target $G_p$.
   It has seven independent decaying modes and ten further independent stationary homogeneous metric modes with
   constant tensor asymptotes. There are no additional dimensions at any growth power strictly between $0$ and $1$.]
  #emph[There exist a fixed compact smooth seven-vector functional $ell$, smooth ten-vector functionals $ell_C^p$,
    and a smooth list $H_C \( p \)$ of the ten additional modes, satisfying
$ ell \( H \, J \) = I \, wide ell H_C \( p \) = 0 \, wide ell_C^p H_C \( p \) = I \, $

 with $ell_C^p$ annihilating the seven decaying modes. Their supports can be fixed outside a physical trapping
   neighborhood. There is a second smooth exact stationary Kerr family $overline(G)_(p \, c)$,
   $c in bb(R)^10$ small, with
#[#set math.equation(numbering: n => "(4.11)")
 $ overline(G)_(p \, 0) = G_p \, wide partial_c overline(G)_(p \, 0) = H_C \( p \) . $ <st:second-family>]

 The gauge calibration extends smoothly to both families. The frozen gauge of $overline(G)_(p \, c)$ relative to
   $G_p$ is $O \( c^2 \)$ on fixed compact sets.]
] <st:families>

#proof[
  Integrate the stationary correction flows in Lemma 13. For the velocity directions use the affine leading chart
  #[#set math.equation(numbering: n => "(4.12)")
   $ t_K = sqrt(1 - \| v \|^2) thin t + frac(v dot.op y, sqrt(1 - \| v \|^2)) \, wide y_K =
     (I + frac(v v^t, 1 - \| v \|^2))^(1 \/ 2) y . $ <st:affine-chart>]
  Pullback of the flat metric is $eta_v$. Nearby raw Kerr metrics are first expressed in smooth ingoing
    coordinates at their outer horizons, bent on a larger domain,
    and corrected to Boyer–Lindquist conventions towards infinity before restriction.
    Since the center has nonzero spin, its direction can be rotated smoothly relative to the fixed Cartesian axes.
    The correcting maps have stationary spatial components and time component equal to a nonzero constant times
    $t$ plus a spatial offset. Their vector-field derivatives retain the tight $r^(- 1)$ bounds.
    This constructs $G_p$ and (4.10). Apply the smooth calibration at $G_p$.
  The supplemented stationary and gauge-potential estimates give seven gauge-corrected decaying modes and no more.
    Physical variations are taken with the leading affine chart held fixed.
    At vector growth just above constants the correction equations are surjective, as in Lemma 13.
    Ten independent constant tensor asymptotes are obtained from pure affine gauge at infinity,
    stationary as metric variations, including a scaling of the stationary generator;
    correct them by stationary $O \( r^(0 +) \)$ vectors. The flat indicial gap,
    unchanged by the constant anisotropic chart, shows that these are exactly the ten extra dimensions below
    growth power $1$. Uniform supplemented estimates at each fixed high order and difference quotients of the
    differentiated stationary equations prove smooth parameter dependence,
    with only finitely many extra orders at each step.
  Normalize their representatives by $ell H_C \( p \) = 0$.
    For the probes, choose fixed tests separating the limiting spans on a far exterior region.
    The stationary estimates with compact error, the dimension counts,
    and equation convergence prevent any normalized nearby mode from being annihilated by all of them.
    Smooth parameter-dependent linear combinations therefore produce $ell_C^p$ with fixed supports.
    These supports will lie in the unsmoothed region of the causal construction.
    Integrating the Kerr and diffeomorphism directions that define $H_C \( p \)$ gives $overline(G)_(p \, c)$.
    Its slightly looser symbol decay after its affine asymptote is harmless.
    Continue the calibration at this family. Since its tangent satisfies the linear stationary gauge,
    its frozen gauge residual is quadratic in $c$. All horizon, slicing, trapping,
    and conic-support conditions retain strict margins after shrinking the parameter range. ◻
]

The two families will serve different parts of the finite-time argument.
  Causal modulation will control the seven decaying modes, while the ten measured coefficients $c$ select the
  instantaneous reference $overline(G)_(p \, c)$ in the sliced estimate.
  The difference from this reference, rather than the entire perturbation,
  will have the integrable low norms needed in the energy comparison.

For later energy estimates the frozen transport operator is now unambiguously

#[#set math.equation(numbering: n => "(4.13)")
 $ upright(bold(L))_(p \, c) =
   "Ric"'_(overline(G)_(p \, c)) + \( cal(D)_(overline(G)_(p \, c)) + C \( p \, c \) \)
   #scale(x: 120%, y: 120%)[\(] D Upsilon_(upright("wave")) \|_(overline(G)_(p \, c) \; G_p) +
   E_(upright(g)) \( p \, c \) #scale(x: 120%, y: 120%)[\)] . $ <st:frozen-operator>]

It does not include the derivative of $cal(D)_g$ applied to the residual gauge.
  That omitted coefficient is $O \( c^2 \)$ compactly and will be treated in the nonlinear comparison.
  The construction order has been $b$, then $G_p$, then $overline(G)_(p \, c)$.

#thm([Lemma 14.])[
  (Adjoint tails).  #emph[Let $cal(K)_p^(*)$ be the supported bilinear-spatial-transpose kernel dual to the
    decaying stationary problem. It is seven-dimensional, locally of order $dot(H)^(- 4)$,
    and conormal $O \( r^(- 2 +) \)$ at infinity. It has locally uniform weak bases with uniform symbol bounds
    sufficiently far out. If $H_0$ is a smooth extendible stationary tensor of symbol growth $O \( r^(0 +) \)$, then
#[#set math.equation(numbering: n => "(4.14)")
 $ chevron.l v \, L_p \( 0 \) H_0 chevron.r = 0 \, wide v in cal(K)_p^(*) . $ <st:adjoint-pairing>]

]
] <st:adjoint-tails>

#proof[
  Index and kernel dimension give the dimension. Apply Green’s identity to the constant-coefficient flat,
    possibly anisotropic, normal operator. Indicial regularity initially permits order-$\( - 1 \)$ fundamental
    solutions. Pairing with the ten independent constant-asymptote homogeneous modes of 7 kills their leading
    coefficients. The supported convention supplies no inner boundary contribution,
    so the remaining adjoint tail is $O \( r^(- 2 +) \)$. The uniform stationary estimates and exterior indicial
    regularity give the asserted weak bases and symbol bounds.
  For $v = O \( r^(- 2 + epsilon.alt') \)$ and $H_0 = O \( r^epsilon.alt \)$ the outer Green boundary terms are
    $O \( r^(- 1 + epsilon.alt + epsilon.alt') \)$. Choose $epsilon.alt +
    epsilon.alt' < 1$ and let the sphere tend to infinity. The inner term vanishes by supported–extendible
    duality. This proves (4.14); the extra adjoint tail power,
    rather than dual Fredholm information at one weight alone, is what permits these pairings. ◻
]

=== 4.5 The causal target and reduced evolution <st:reduction>

We now construct the time-dependent target and causal feedback that will control the stationary zero modes.
  The radius-dependent averages preserve the asymptotic symbol class; the filters control the parameter jets;
  and the compensator restores the desired stationary linearization.
  After proving their defect bounds, we solve the reduced evolution and verify propagation of the vacuum
  constraints. Write $p \( t \) = \( m \( t \) \, v \( t \) \)$, let $a \( t \) = p' \( t \)$,
  and let $lambda' \( t \) = v \( t \)$. Extend $p$ and $lambda$ by zero for $t lt.eq 0$.
  The co-moving coordinates are $\( t \, y \)$ and the laboratory coordinates are $\( t \, z \)$, where

$ z = y - lambda \( t \) . $

The symbol $a$ in this section denotes the parameter derivative, not the fixed Kerr rotation parameter.

Choose a smooth function $d \( x \) gt.eq 0$, zero on a large fixed ball containing both variables of every
  compact kernel and all probes, and equal to $\| x \|$ near infinity.
  Choose a real smooth signed kernel $k_0$ compactly supported in $\( 0 \, 1 \/ 10 \)$ with

$ integral k_0 \( sigma \) thin d sigma = 1 \, wide integral sigma k_0 \( sigma \) thin d sigma = 0 . $

For a zero-past function $f$ define its radius-dependent causal average by

#[#set math.equation(numbering: n => "(4.15)")
 $ f_s \( t \, x \) = integral k_0 \( sigma \) f \( t - sigma d \( x \) \) thin d sigma . $ <st:averaging>]

The implicit equation

#[#set math.equation(numbering: n => "(4.16)")
 $ x = z + lambda_s \( t \, x \) $ <st:implicit-position>]

is a contraction for sufficiently small $sup \| v \|$. It gives $x = y$ in the unsmoothed region,
  and $1 + \| x \|$ is comparable to $1 + \| y \|$.

Define the target by evaluating the family coefficients in the formal coframe

#[#set math.equation(numbering: n => "(4.17)")
 $ B = G_(p_s \( t \, x \)) \( x \) quad upright("in the coframe ") \( d t \, d z + v_s \( t \, x \) thin d t \) .
   $ <st:causal-target>]

The zero first moment has a useful exact consequence. If $p$ is constant and $lambda$ is affine, with $lambda' =
  v$, throughout the interval from the earliest sampled time to the current time $t$, then $p_s = p \( t \)$,
  $lambda_s = lambda \( t \)$, and $x = y$. On a region where these identities hold,
  $B$ is exactly $G_p$ in the co-moving chart, expressed in the laboratory chart by the coframe $d y = d z +
  v thin d t$. Thus the construction changes an exact stationary metric only where the parameter history changes;
  the following defect estimates quantify that change.

For the evolving metric $g$, set

#[#set math.equation(numbering: n => "(4.18)")
 $ h = g - B \, wide u = partial_t h_(upright("co")) \, wide D = partial_(t \, upright("lab")) -
   v_s dot.op partial_z \, wide psi = D h_(upright("lab")) . $ <st:unknowns>]

Subscripts specify the coordinate components and derivatives.

Fix a smooth startup cutoff $chi_(upright("st"))$, zero near zero and one after time one. The feedback is

#[#set math.equation(numbering: n => "(4.19)")
 $ c & = ell_C^p h_(upright("co")) \,\
a & = F \( partial_t \) \( chi_(upright("st")) ell h_(upright("co")) \) \, wide F = "diag" \( F_m I_4 \, F_v I_3 \) \,\
F_m \( zeta \) & = frac(sigma_0, \( 1 + zeta \)^P) \, wide F_v \( zeta \) =
  frac(2 sigma_0 zeta + sigma_0^2, \( 1 + zeta \)^P) . $ <st:feedback>]

Here $P gt.eq 5$ is a fixed integer, increased below to dominate a fixed finite list of frequency losses,
  and $sigma_0 > 0$ is sufficiently small. Both filters are retarded.

#thm([Lemma 15.])[
  (Filter regularity).  #emph[For each $j gt.eq 0$, the $j$th derivative of $a$ is controlled by derivatives of
    its input through order $max \( 0 \, j - P + 1 \)$ in polynomially weighted $L_t^2$ and $L_t^oo$,
    also on finite intervals. For $j gt.eq 1$ one may first differentiate the input and use $ell u$,
    with the resulting startup term charged to initial data.]
] <st:filter>

#proof[
  Put $d_n = max \( 0 \, n - P + 1 \)$ and let $q$ be the smooth zero-past input.
    Let $G_0 = delta_0$ and, for $j gt.eq 1$, let
  $ G_j \( t \) = upright(bold(1))_(t gt.eq 0) thin e^(- t) frac(t^(j - 1), \( j - 1 \) !) . $
  Write $K_F$ for the diagonal convolution kernel of $F$. Its mass/spin kernel is $sigma_0 G_P$,
    and its velocity kernel is
  $ 2 sigma_0 G_(P - 1) + \( sigma_0^2 - 2 sigma_0 \) G_P \, $
  since $zeta \( 1 + zeta \)^(- P) = \( 1 + zeta \)^(- \( P - 1 \)) - \( 1 + zeta \)^(- P)$.
    The distributional identity $partial_t G_j = G_(j - 1) - G_j$ shows that every derivative through order $P -
    1$ of these kernels is a finite measure, including its possible endpoint delta.
    All its polynomial moments are finite. Put $r_n = min { n \, P - 1 }$. Differentiating the convolution gives
  $ a^(\( n \)) = \( partial_t^(r_n) K_F \) * q^(\( d_n \)) . $
  There are no startup delta terms from $q$, since its zero extension is smooth. For $0 lt.eq u lt.eq t$,
  $ frac(\( T_0 + t \)^(alpha \/ 2), \( T_0 + t - u \)^(alpha \/ 2)) lt.eq \( 1 + u \)^(alpha \/ 2) . $
  Weighted Young’s inequality for this finite measure proves the asserted weighted bounds,
    on finite intervals by causality. For the input $q = chi_(upright("st")) ell h_(upright("co"))$,
    differentiating once uses $ell u$ and a fixed startup term.
    The primitive relation $p^(\( j \)) = a^(\( j - 1 \))$ gives no strong weight for $p$ or $lambda$. ◻
]

Use

#[#set math.equation(numbering: n => "(4.20)")
 $ Upsilon = Upsilon_(upright("wave")) \( g \; B \) + E_(upright(g)) \( p \, c \) h + Theta $ <st:full-gauge>]

in (4.2), with partner $C \( p \, c \)$. The spatial additions act in the co-moving chart.
  To define the compensator, contract the profile indices and put

#[#set math.equation(numbering: n => "(4.21)")
 $ Y = H m_s + J lambda_s + H^1 v_s + 2 \( V - e \)^flat ⊙ d_x lambda_s . $ <st:compensator>]

On the unsmoothed region, containing all kernels with a buffer, set $Theta = cal(B) Y$,
  with the base coefficients of $cal(B)$. Outside, compute the same local expression in independent coordinates
  $\( t \, x \)$, then evaluate at the implicit $x$ and pull its components into the formal coframe of (4.17).
  The definitions coincide where $d = 0$.

#thm([Lemma 16.])[
  (Joint linearization and column bounds).  #emph[Linearizing the joint reduced equation at zero parameters and
    $g = b$ gives
#[#set math.equation(numbering: n => "(4.22)")
 $ L h + Q \( partial_t \) a . $ <st:joint-linearization>]

 For
$ K_d \( y \, zeta \) = integral k_0 \( sigma \) e^(- zeta sigma d \( y \)) thin d sigma $

 the seven columns of $Q$ are
#[#set math.equation(numbering: n => "(4.23)")
 $ Y_m & = H K_d \,\
Y_v & = \( J + zeta H^1 \) K_d + 2 \( V - e \)^flat ⊙ d_y K_d \,\
Q \( zeta \) & = (frac(L \( zeta \) Y_m, zeta) \, frac(L \( zeta \) Y_v, zeta^2)) . $ <st:Q-definition>]

 The apparent poles are removable. On every fixed compact set,
   $Q \( partial_t \)$ has only bounded-length causal memories, including distributional derivatives,
   and its fixed spatial derivative costs are polynomial in frequency. For every fixed $N$,
#[#set math.equation(numbering: n => "(4.24)")
 $ Q \( zeta \) = O_N #scale(x: 120%, y: 120%)[\(] r_y^(- 2) \( 1 + \| zeta \| r_y \)^(- N)
   #scale(x: 120%, y: 120%)[\)] \, wide r_y = \| y \| \, quad "Re" zeta gt.eq 0 \, $ <st:Q-tail>]

 with the corresponding symbol derivatives near infinity.]
] <st:columns>

#proof[
  At zero parameters the variation of $B$ in the fixed co-moving chart,
    plus the Lie derivative along $e lambda + \( V - e \) lambda_s$, is precisely $Y$.
    The location variation supplies $lambda_s - lambda$ and the formal-coframe variation supplies $v_s - v$.
    Since $b$ is vacuum, adding this Lie derivative does not alter the linearized Ricci tensor.
    The definition of $Theta$ therefore gives (4.22), with the columns (4.23).
  The stationary identities and the chain identity (4.8) cancel the zeroth and first Taylor terms required by the
    displayed denominators. The zeroth and first moments of $k_0$ give $K_d = 1 +
    O \( \| zeta \|^2 r_y^2 \)$ at small scaled frequency. Thus both poles are removable;
    in the time domain their antiderivatives have bounded memory on bounded spatial sets.
    At large scaled frequency integrate by parts in $sigma$. Its compact support is strictly at positive delays,
    so the bound is uniform for $"Re" zeta gt.eq 0$. Together with the tight profile orders $H \, H^1 \, V - e =
    O \( r_y^(- 1) \)$ and $J = O \( r_y^(- 2) \)$, these calculations prove (4.24).
    Spatial derivatives on a fixed annulus give only fixed polynomial frequency costs. ◻
]

#thm([Lemma 17.])[
  (Nonlinear target defect).  #emph[Suppose $integral \| a \|$ and $sup \| v \|$ are sufficiently small.
    For comparable large radii $r tilde.op \| x \|$, set
$ tilde(a) \( t \, r \) = C r^(- 1) integral_(t - C r)^t \| a \( tau \) \| thin d tau \, $

 with the positive majorant enlarged as needed at comparable radii. In laboratory components,
#[#set math.equation(numbering: n => "(4.25)")
 $ Theta = O \( r^(- 1) tilde(a) \) \, wide f_B := "Ric" \( B \) + \( cal(D)_B + C \( p \, c \) \) Theta =
   O \( r^(- 2) tilde(a) \) \, wide D f_B = O \( r^(- 3) tilde(a) \) . $ <st:target-defect-orders>]

 These hold with each fixed number of scaled laboratory derivatives.
   Also $D B = O \( r^(- 1) tilde(a) \)$ with symbol derivatives.
   On fixed transition and inner sets the analogous defects use bounded-length parameter jets and vanish at exact
   freezing with affine position.]
] <st:target-defect>

#proof[
  Work first where $d \( x \) = r = \| x \|$, with the enlarged positive majorant $tilde(a) =
    C r^(- 1) integral_(t - C r)^t \| a \( tau \) \| thin d tau$.
    Assume the finite-slab bootstrap $integral \| a \|$ is small, so $r tilde(a) lt.double 1$.
    Integration by parts in the smooth positive-delay kernel, with no endpoint terms, gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ \| partial_t^j partial_x^alpha p_s \| & lt.eq C_(j \, alpha) r^(1 - j - \| alpha \|) tilde(a) \, &  & j + \|
     alpha \| gt.eq 1 \,\
\| partial_t^j partial_x^alpha J_s \| & lt.eq C_(j \, alpha) r^(1 - j - \| alpha \|) tilde(a) \, &  & j \, \|
  alpha \| gt.eq 0 \, wide J_s = partial_x lambda_s . $ <st:smoothed-jets>]
  For the second line the zero first moment removes the constant-velocity term:
    $J_s = O \( r tilde(a) \)$, while $partial_t J_s = partial_x v_s = O \( tilde(a) \)$.
    Each differentiated kernel is estimated separately by the positive majorant;
    the argument never differentiates $tilde(a)$.
  Put $S_x = \( I - J_s \)^(- 1)$. Implicit differentiation yields, in the independent variables $\( t \, x \)$,
  #[#set math.equation(numbering: n => "(4.27)")
   $ partial_(z_i) = \( S_x \)^j zws_i partial_(x_j) \, wide D := partial_(t \, upright("lab")) -
     v_s dot.op partial_z = partial_t \|_x \, wide \[ D \, partial_(z_i) \] = \( partial_(z_i) v_s^j \)
     partial_(z_j) . $ <st:target-frame>]
  Thus $S_x - I = O \( r tilde(a) \)$, $D S_x = O \( tilde(a) \)$, and $partial_x S_x = O \( tilde(a) \)$,
    with one inverse radius for each further ordinary derivative.
    Products of acceleration averages obey the same bounds since $r tilde(a) lt.double 1$.
  ===== 4.5.1 The metric defect. <the-metric-defect.>
  The formal coframe substitution cancels the affine flat asymptote exactly:
    substituting $d y = d z + v thin d t$ in $eta_v$ gives $eta$. Hence in lab components
  $ B = eta + frak(h) \( p_s \, x \) \, wide partial_x^alpha partial_p^beta frak(h) = O \( r^(- 1 - \| alpha \|) \) . $
  Here $frak(h)$ is the smooth family of lab-component metric remainders.
    At a point freeze $p_s \, v_s$, and use the constant-parameter affine-worldline Kerr metric with position $x$.
    Its first and second lab derivatives differ from those of $B$ by $O \( r^(- 1) tilde(a) \)$ and
    $O \( r^(- 2) tilde(a) \)$, respectively. Indeed the second derivative expansion consists of
  $ frak(h)_(x x) C C \, quad frak(h)_x partial C \, quad frak(h)_(x p) C partial p_s \, quad
    frak(h)_(p p) \( partial p_s \)^2 \, quad frak(h)_p partial^2 p_s \, $
  with both mixed terms understood, where $C$ is $S_x$ or $v_s S_x$.
    The coordinate-coefficient difference is $O \( r tilde(a) \)$, $partial C = O \( tilde(a) \)$,
    and $partial^2 p_s = O \( r^(- 1) tilde(a) \)$. These give the claimed orders.
    The frozen metric is vacuum, so smooth expansion of Ricci gives $"Ric" \( B \) = O \( r^(- 2) tilde(a) \)$.
  For the additional $D$ derivative, $D B = O \( r^(- 1) tilde(a) \)$ with two further lab symbol derivatives by
    (4.26). For any two lab coordinate derivatives, the exact commutator identity is
  $ D partial_alpha partial_beta B =  & partial_alpha partial_beta \( D B \) + \( partial_alpha v_s^j \) partial_j
    partial_beta B + \( partial_beta v_s^j \) partial_alpha partial_j B\
 & + \( partial_alpha partial_beta v_s^j \) partial_j B . $
  Here $partial v_s = O \( tilde(a) \)$, $partial^2 v_s = O \( r^(- 1) tilde(a) \)$, $partial B =
    O \( r^(- 2) \)$, and $partial^2 B = O \( r^(- 3) \)$. Every displayed term is therefore
    $O \( r^(- 3) tilde(a) \)$. Differentiating the coefficients in Ricci adds only terms of that order or
    smaller. Thus $D "Ric" \( B \) = O \( r^(- 3) tilde(a) \)$.
  ===== 4.5.2 The compensator and its derivative. <the-compensator-and-its-derivative.>
  At infinity the gauge is local; write it as $cal(B) = beta^mu \( x \) partial_mu + beta_0 \( x \)$,
    and put $U_i = V_i - e_i$. The identities
  $ cal(B) H = cal(B) J = 0 \, wide cal(B) H^1 = - \[ cal(B) \, t \] J \, wide partial_t lambda_s = v_s $
  reduce $cal(B) Y$ to sums of
  $ \[ cal(B) \, m_s \] H \, wide beta^i J thin partial_(x_i) lambda_s + \[ cal(B) \, v_s \] H^1 \, wide
    cal(B) \( 2 U^flat ⊙ d_x lambda_s \) . $
  In particular no undifferentiated position or velocity remains.
    The profile orders $H \, H^1 \, U = O \( r^(- 1) \)$, $J =
    O \( r^(- 2) \)$ and (4.26) bound each expression by $O \( r^(- 1) tilde(a) \)$.
    A $D = partial_t \|_x$ hit on a memory gains one inverse radius; for example it sends $partial_x lambda_s =
    O \( r tilde(a) \)$ to $partial_x v_s = O \( tilde(a) \)$.
    The implicit-coordinate and coframe changes contribute only $S_x \, v_s$ and their controlled derivatives.
    A derivative on a coframe coefficient produces $r^(- 1) tilde(a)^2 lt.tilde r^(- 2)
    tilde(a)$ at the $Theta$ level and $r^(- 2) tilde(a)^2 lt.tilde r^(- 3)
    tilde(a)$ after one further derivative. Together with (4.27), this proves
  $ Theta = O \( r^(- 1) tilde(a) \) \, quad partial Theta \, D Theta = O \( r^(- 2) tilde(a) \) \, quad
    D partial Theta = O \( r^(- 3) tilde(a) \) . $
  Christoffel terms in $cal(D)_B Theta$ have smaller orders, and $C$ vanishes here. We obtain the required defect bounds
  #[#set math.equation(numbering: n => "(4.28)")
   $ Theta = O \( r^(- 1) tilde(a) \) \, wide f_B := "Ric" \( B \) + \( cal(D)_B + C \) Theta =
     O \( r^(- 2) tilde(a) \) \, wide D f_B = O \( r^(- 3) tilde(a) \) . $ <st:full-defect-identity>]
  The calculation allows every fixed number of scaled lab derivatives, with constants depending on that number.
    Each use may enlarge the comparable averaging interval. At the far-current application,
    lab-time derivatives are taken before the outgoing commutations;
    their coefficients contain only smoothed parameters. No unsmoothed acceleration is created by the calculation above.
  On the fixed transition annulus $d$ may vanish, so an inverse-$d$ estimate is neither needed nor asserted.
    There the defect is a smooth function of finitely many parameter jets and bounded-length memories.
    In the unsmoothed region it also contains the fixed compact pseudodifferential operations.
    The exact identities above make it vanish whenever the relevant accelerations vanish.
    The filter lemma supplies every fixed required jet list, and the compact estimates treat these transition
    terms with fixed-radius constants. ◻
]

The target, feedback, and compensator now have the spatial decay and finite-jet control needed by the evolution.
  We next show that their retarded dependence closes the local Cauchy problem and that vacuum initialization gives
  the vacuum equation throughout the resulting slab.

For this local construction, the base wave-pair norm is

$ cal(E)_10 \( t \) = parallel h_(upright("co")) \( t \) parallel_(H_(upright("uloc"))^10) +
  parallel partial_t h_(upright("co")) \( t \) parallel_(H_(upright("uloc"))^9) . $

Here the uniformly local norms use a fixed buffered region containing all compact kernels and regular end charts
  of fixed size. The contraction norm is the wave-pair norm one order lower, $H_(upright("uloc"))^9 times
  H_(upright("uloc"))^8$. These are sufficient fixed orders, not a minimal regularity assertion.

#thm([Proposition 8.])[
  (Local evolution and vacuum initialization).  #emph[The reduced equation (4.2), (4.20),
    with retarded feedback (4.19), has smooth local evolution for smooth initial wave data small in $cal(E)_10$.
    It continues on finite time intervals while $cal(E)_10$ remains bounded,
    the parameters stay in their chosen small range, the normalized acceleration and implicit-coordinate inverses
    stay uniformly controlled, and the spacelike and strict outflow margins remain positive.
    Smooth higher orders propagate on bounded time intervals; these higher seminorms need only be finite.
    For smooth vacuum constraint data, the initial lapse and shift derivatives can be chosen so that $Upsilon$ and
    its first normal derivative vanish initially. The resulting evolution is vacuum.]
] <st:local-evolution>

#proof[
  After pointwise normalization of the wave principal coefficient,
    the extra normal-acceleration coefficient has compact interior spatial order at most $- 1$.
    Choose it small on a low norm and on the finite base Sobolev list needed for iteration.
    Its identity-plus-correction inverse then extends to every smooth order by the derivative gain and Sobolev
    multiplication. The identity-minus-inverse error gains one spatial derivative;
    apply it to $partial_y^2 h$ and $partial_y partial_t h$. The solved equation therefore retains its
    differential strictly hyperbolic principal part, and every nonlocal correction is at most first order on the
    wave jets, with tame bounds.
  The compact kernels are bounded in a high spatial wave-pair energy and are Lipschitz one energy order lower on
    bounded sets. Metric multiplication inside their negative-order gains uses ordinary spatial Sobolev
    multiplication. Before spatial commutation, the equation contains at most $partial_t
    c$ from the parameter-dependent additions, a projection of the two available wave jets rather than a new
    unsolved acceleration. At any fixed base iteration order choose $P$ with surplus so that spatial
    differentiation of bounded-radius histories uses only available projection jets.
    The implicit-position inverses use $I - partial_x lambda_s$ uniformly close to the identity,
    and the filters are stable zero-past Volterra variables, equivalently a finite system of retarded ordinary
    differential equations.
  On a short slab integrate the high-energy estimate and the one-order-lower contraction estimate,
    using suprema of earlier wave energies for the history terms.
    Work on regions containing the compact kernels with buffers and use uniformly local wave estimates outside.
    The inner boundary has strictly exiting flux. Conic localization preserves the spatial mapping properties and
    the time-local or retarded dependence. Both variables of every compact spatial kernel stay within the buffered
    interaction region, away from the outflow boundaries. This does not assert metric finite propagation inside
    that region; later geometric attachment uses ordinary local wave-map equations.
    At higher orders, spatial commutation through source order $s -
    1$ uses at most $a^(\( s + 3 \))$ in targets and compensators.
    The filter gain charges these to at most $s - 1$ total-order projection jets when $P gt.eq 5$.
    Successive normal solves and wave-energy induction, or smooth regularization with these tame estimates,
    propagate smoothness without demanding smallness of the negative-order coefficient on every high Sobolev
    space. Outside the compact interaction region, evolution for fixed histories is local.
    Annular rescaling, together with the fact that sufficiently distant memories sample times before startup,
    propagates all symbol orders on bounded time slabs.
  For constraint data, imposing $Upsilon = 0$ determines the initial lapse and shift derivatives by the same small
    normal coefficient solve. The normal Einstein constraints in the reduced equation then imply $partial_t
    Upsilon = 0$ initially. The contracted Bianchi identity gives a homogeneous wave system for $Upsilon$;
    the compact terms from $C$ have the same lower-order type.
    Uniqueness yields $Upsilon = 0$ and $"Ric" \( g \) = 0$. The startup cutoff on feedback ensures that the
    initial wave jets through the finite base budget are determined by the corresponding geometric data orders.
    None of these arguments requires stationary time to be timelike on the kernel supports. ◻
]

=== 4.6 Augmented inversion and retarded tests <augmented-inversion-and-retarded-tests>

The unaugmented operator has stationary modes. The feedback removes their obstruction without assuming a uniform
  unaugmented inverse at zero. For a large radius $R$, choose a smooth scaled cutoff $chi_R \( y \)$,
  equal to one for $r_y lt.eq R$ and zero for $r_y gt.eq 2 R$, and define

#[#set math.equation(numbering: n => "(4.29)")
 $ M_R \( zeta \) = L \( zeta \) + chi_R Q \( zeta \) F \( zeta \) ell . $ <st:augmented-operator>]

We first identify the zero-frequency coupling.

#thm([Lemma 18.])[
  (Zero-frequency coupling).  #emph[For sufficiently large $Lambda$, the map
$ Q \( 0 \)^t : cal(K)_0^(*) arrow.r bb(C)^7 $

 has full rank.]
] <st:zero-coupling>

#proof[
  Expand the columns in outgoing time $t_(*) = t - phi.alt$,
    equivalently multiplying the profiles by $e^(zeta phi.alt)$.
    In pairing their Taylor coefficients with $cal(K)_0^(*)$, discard terms $L \( 0 \) H_0$ with $H_0 =
    O \( r_y^(0 +) \)$ by Lemma 14. This operation is essential for the coefficient class of the eventual
    polynomial mode. For a Kerr column the discarded coefficient includes $phi.alt H$.
    For a translation column, the constant and linear coefficients of the conjugated profile are $J$ and $Z_1 =
    H^1 + phi.alt J = O \( r^(- 1 +) \)$; its quadratic coefficient includes $phi.alt H^1 + phi.alt^2 J \/ 2$,
    together with the averaging and coordinate profile terms.
    The latter coefficients are $O \( r^(0 +) \)$ and contribute only exact stationary terms $L \( 0 \)
    H_0$ at the order under consideration. They are discarded in the adjoint pairing,
    not retained as constant coefficients of a polynomial to which Proposition 5 is applied.
    The residuals at the relevant orders are exactly the equation errors of
  #[#set math.equation(numbering: n => "(4.30)")
   $ t_(*) H \, wide 1 / 2 t_(*)^2 J + t_(*) \( H^1 + phi.alt J \) . $ <st:polynomial-tests>]
  These errors are stationary and $O \( r_y^(- 3 +) \)$. To see the extra decay,
    the outgoing linear Taylor coefficient on the end is a constant multiple of $partial_r + 1 \/ r$,
    modulo $O \( r^(- 1) \) partial_y + O \( r^(- 2) \)$, and annihilates the leading $r^(- 1)$ power.
    The outgoing quadratic coefficient is $O \( r^(- 1) \)$ or better.
    These are the flat and Kerr asymptotic computations using precisely the orders of $b$, $phi.alt$,
    and the profiles established above.
  At the local-gauge limit, if the resulting seven-dimensional coupling were singular,
    a nonzero combination of these residuals would pair to zero with the entire adjoint kernel.
    The improved $O \( r_y^(- 3 +) \)$ residual could then be solved away in a decaying $O \( r_y^(- 1 +) \)$
    space. Add only this decaying stationary solution to the corresponding combination in (4.30).
    Every coefficient of the resulting outgoing-time polynomial then lies in the decaying class of Proposition 5;
    none of the discarded $O \( r^(0 +) \)$ coefficients occurs in it.
    If its quadratic coefficient were nonzero, (4.30) would give a forbidden degree-two outgoing polynomial mode.
    Otherwise a nonzero linear combination of the four Kerr directions would give a degree-one mode with
    nontranslation leading coefficient. Both contradict Proposition 5.
    It is essential here to discard exact stationary terms before invoking solvability for the improved residual.
  The added gauge preserves all identities used in these Taylor expansions.
    Uniform stationary compactness and the $O \( r_y^(- 2 +) \)$ adjoint tails give continuity of this finite
    coupling towards the local-gauge limit. Thus its rank persists for sufficiently large $Lambda$. ◻
]

#thm([Proposition 9.])[
  (Retarded stationary tests).  #emph[Fix a compact test support and a finite number of required angular
    derivatives. There are a sufficiently high fixed test Sobolev order $q_(*)$ and a finite polynomial degree
    $N_(*)$ with the following property. Choose the filter order $P$ sufficiently large and $sigma_0 >
    0$ sufficiently small, then take $Lambda \, R$ sufficiently large in the order specified below.
    For $0 < "Re" zeta lt.eq D_(*)$ on that strip and a compactly supported test $f$ of order $q_(*)$,
    the spatial transpose equation
$ M_R \( zeta \)^t v_(*) = f $

 has a solution satisfying
#[#set math.equation(numbering: n => "(4.31)")
 $ parallel v_(*) parallel_(dot(H)^(- 4) \( K \)) & lt.eq C R^(3 iota) chevron.l zeta chevron.r^(N_(*)) parallel f
   parallel_(H^(q_(*))) \,\
parallel \( v_(*) \, r_y \( partial_(r_y) + zeta \) v_(*) \) parallel_(L_omega^2) & lt.eq
  C r_y^(- 1 + iota) R^(3 iota) chevron.l zeta chevron.r^(N_(*)) parallel f parallel_(H^(q_(*)))
  wide \( r_y gt.double 1 \) . $ <st:test-compact>]

 Here $K$ is any prescribed fixed compact reach, and the second bound includes the prescribed angular derivatives.
   The bounds are uniform down to $"Re" zeta arrow.b 0$ on a fixed strip reaching a forward Laplace line.
   The slack $iota > 0$ can be arbitrarily small without making $N_(*)$ diverge.
   The associated tested operators are retarded.]
] <st:retarded-tests>

#proof[
  We give the zero, intermediate, and high frequency arguments separately.
  #emph[Near zero.] Put
  $ delta_f = F \( zeta \)^t Q \( zeta \)^t chi_R v_(*) \, wide L \( zeta \)^t v_(*) = f - ell^t delta_f . $
  Use the spaces $cal(A) \, cal(S)$ of Lemma 12, and supplement their compact-error estimate by a compact
    measurement $Pi$ that separates $cal(K)_0^(*)$. It controls both $e^(zeta phi.alt)
    v_(*)$ and $delta_f$ with the extra forcing $ell^t delta_f$ placed on the left.
    Indeed in a normalized contradicting sequence, the limiting stationary equation paired with $H \,
    J$ gives $delta_f = 0$, because $ell \( H \, J \) = I$. The measurement $Pi$ then kills its remaining
    stationary kernel element.
  Choose $v_0 in cal(K)_0^(*)$ matching $Pi \( e^(zeta phi.alt) v_(*) \)$.
    Its conjugated equation residual is $O \( \| zeta \| \) \| v_0 \|$ in $cal(S)$,
    by the adjoint $r_y^(- 2 +)$ tail with smaller slack and the stationary end bounds;
    here $\| v_0 \|$ denotes its finite-dimensional coefficient size. The supplemented estimate gives
  #[#set math.equation(numbering: n => "(4.32)")
   $ parallel e^(zeta phi.alt) v_(*) - v_0 parallel_(cal(A)) + \| delta_f \| lt.eq
     C #scale(x: 120%, y: 120%)[\(] parallel f parallel_(H^(q_(*))) + \| zeta \| \| v_0 \|
     #scale(x: 120%, y: 120%)[\)] . $ <st:near-zero-comparison>]
  By the column bounds, pairing the physical difference $e^(- zeta phi.alt) \( e^(zeta phi.alt) v_(*) - v_0 \)$
    against $chi_R Q$ costs at most
  $ C_iota min \( R \, \| zeta \|^(- 1) \)^(2 iota) #scale(x: 120%, y: 120%)[\(] parallel f
    parallel_(H^(q_(*))) + \| zeta \| \| v_0 \| #scale(x: 120%, y: 120%)[\)] . $
  On normalized $v_0$, the pairing of $e^(- zeta phi.alt) v_0$ with $chi_R
    Q \( zeta \)$ converges uniformly to $Q \( 0 \)^t v_0$ as $R arrow.r oo$ and $zeta arrow.r 0$.
    Lemma 18 and nonsingularity of $F \( 0 \)$ therefore absorb the $O \( \| zeta \|^(1 - 2 iota) \) \|
    v_0 \|$ term after choosing $R$ large and a sufficiently small fixed zero-frequency neighborhood.
    This gives the claimed compact bound and trivial augmented transpose kernel there.
    Lemma 12 supplies index zero and the return to physical inversion.
    Its stronger near-zero source estimate is applied only to these graph states,
    whose forcing is compactly supported. At infinity b-Sobolev regularity for $e^(zeta phi.alt)
    v_(*)$ gives (4.31) in this regime, using $r_y \( 1 - phi.alt' \) = O \( 1 \)$.
  #emph[Closed nonzero bands.] Use the estimates for $L^t$ first with the full column $Q$,
    whose tail rapidly decreases, and then treat the removed tail $\( 1 - chi_R \) Q$ as small.
    Spatial integration by parts reduces the full finite-dimensional condition to
  #[#set math.equation(numbering: n => "(4.33)")
   $ I + \[ I_H \, I_J + zeta thin ell H^1 \] thin "diag" \( F_m \/ zeta \, F_v \/ zeta^2 \) . $ <st:filter-matrix>]
  Here $\[ I_H \, I_J \]$ is the identity divided into its four and three mode columns.
    Formula (4.33) uses $d = 0$ on the probe supports and the exact stationary and chain identities.
  This matrix is invertible in the closed right half-plane for sufficiently small $sigma_0$.
    It is a perturbation of the identity when $\| zeta \| \/ sigma_0$ is large.
    When $w = zeta \/ sigma_0$ stays bounded, multiply its four Kerr columns by $w$ and its three translation
    columns by $w^2$. The limiting diagonal blocks are $1 + w$ and $\( 1 + w \)^2$,
    which have no zeros for $"Re" w gt.eq 0$. The zero-frequency neighborhood has already been handled;
    these two regimes cover the remaining closed bounded bands. Taking $R$ large absorbs the omitted tail.
  #emph[High frequency and radiation.] The polynomial transpose losses from Proposition 6,
    the polynomial column bounds on compact sets, and their rapid tail decrease are absorbed by taking $P$ large.
    Away from zero, $L^t v_(*)$ is supported in a fixed compact set.
    At the end we obtain the radiation estimate as follows. Commute rotations in Cartesian components,
    with cutoff in an elliptic annulus. Their order-two coefficient errors are $O \( r_y^(- 2) \)$ by rotation
    invariance of the mass correction. The scattering estimate and exterior spatial ellipticity control these
    unscaled derivatives and fixed-annulus errors with polynomial cost.
    For $w_(*) = r_y v_(*)$ this gives, with the requisite rotations,
  $ \( w_(*) \, partial_(r_y) w_(*) \) in L^2 \( r_y^(- 1 - 2 iota) d r_y thin d omega \) $
  with the asserted right side. In tortoise coordinate the source-free radial equation is
  #[#set math.equation(numbering: n => "(4.34)")
   $ \( partial_(r_(*)) - zeta \) \( partial_(r_(*)) + zeta \) w_(*) =
     O \( r_y^(- 2) \) chevron.l zeta chevron.r^2 O #scale(x: 120%, y: 120%)[\(] partial_omega^(lt.eq 2) w_(*) \,
     partial_omega^(lt.eq 1) partial_(r_(*)) w_(*) #scale(x: 120%, y: 120%)[\)] . $ <st:transpose-radial>]
  This follows by dividing by the radial second-derivative coefficient in Boyer–Lindquist Kerr.
    For positive real part, integrate the first factor from infinity;
    Cauchy–Schwarz with the scattering weight costs $O \( r_y^(- 1 + iota) \)$.
    To see the exact radial gain, if $w_(*) = r_y v_(*)$, the scattering weight gives
  $ integral_r^oo rho^(- 2) \| w_(*) \| thin d rho lt.eq
    (integral_r^oo rho^(- 1 - 2 iota) \| w_(*) \|^2 thin d rho)^(1 \/ 2)
    (integral_r^oo rho^(- 3 + 2 iota) thin d rho)^(1 \/ 2) lt.tilde r^(- 1 + iota) . $
  The same estimate holds for the finitely many angular and radial jets on the right side of (4.34).
    The first integration has a kernel bounded by one; the second costs only a constant proportional to $1 \/
    iota$. Reducing $iota$ changes constants but not the polynomial frequency degree,
    because all differential orders were fixed beforehand. Integrate the second factor outwards.
    Returning to the ordinary good derivative uses $r'_(*) = 1 + O \( r_y^(- 1) \)$.
    This proves (4.31), with all compact modifications interior to the computation.
  #emph[Choice of constants and causality.] First fix the finite testing and differentiation orders and their
    polynomial losses. Choose $P$ and then $sigma_0$. A forward energy line can be fixed uniformly before
    finalizing $Lambda \, R$: the acceleration coefficients are small, the compact symbols are uniformly bounded,
    and $Q$ acting on the filtered parameters is a bounded energy forcing by its memory estimates.
    The high and near-zero thresholds are uniform for sufficiently large $Lambda$.
    Enlarge $Lambda$ for the intervening band, and then take $R$ sufficiently large.
    This is an augmented argument using column identities, rank, and transpose graphs;
    it does not require persistence of unaugmented inversion uniformly to zero.
  On the open strip, the physical graph domains are fixed locally in $zeta$:
    the end is parameter elliptic and compact first-order changes are bounded on the graph.
    The inverse is analytic there. Starting on the forward line,
    wave and Volterra uniqueness identify the tested inverse as causal.
    Contour displacement within the strip, using (4.31)–(4.31),
    gives the retarded tested operators down to the boundary of the physical half-plane. ◻
]

#prodef([Remark 1.])[
  (Fixed base choices and higher regularity).  The choice of $Lambda$ requires smallness on a finite base Sobolev
    list, not on all orders simultaneously. Once the negative-order acceleration correction is invertible at a low
    order, its derivative gain yields estimates at every fixed higher order, with order-dependent constants.
    The saturated transport calibration is exact and independent of the energy order.
    For nearby $p$, the seven-dimensional kernel is reconstructed using the invertible gauge-potential problem:
    four physical variations and three translations give the lower bound,
    while stationary compactness gives the matching upper bound.
    Preservation of the base translation chains is needed for the base columns and coupling,
    not asserted as an unchanged chain at every nearby parameter.
  Finally the worst filter order is $1 - P$, so $a^(\( s + 3 \))$ uses at most $max \( 0 \, s + 4 - P \) lt.eq s -
    1$ projection derivatives when $P gt.eq 5$. This count is uniform in $s$.
    Thus the fixed base construction does not introduce a requirement of smallness at arbitrarily high data
    orders. The subsequent energy argument can use the order-dependent stationary constants when proving smooth
    higher bounds for each fixed datum.
] <st:order-quantifiers>

== 5 Compact estimates and smooth propagation <sec:compact>

We next pass from the stationary estimates to finite-time estimates for the nonlinear reduced equation.
  The essential new point is directional: the stationary operator is elliptic on the spatial cone containing the
  projected trapped covectors, not necessarily over their entire spatial base.
  We therefore retain a full-order bulk estimate for first jets outside that cone.
  Combined with a conic elliptic correction, this gives the same integrable static defect that is needed in the
  nonlinear energy comparison. The interaction of elliptic and integrated wave estimates has a methodological
  parallel in Dafermos–Holzegel–Rodnianski–Taylor #cite(label("DafermosHolzegelRodnianskiTaylor2024"));
  the conic estimates for the reduced Einstein system used here are established in this section.

Throughout this section the solution is smooth on an arbitrary finite bootstrap slab $\[ 0 \, T \]$.
  No constant in an estimate below depends on $T$. We use the modulation, targets, reduced equation,
  stationary family and causal filters constructed in the preceding section.
  In particular, $u = partial_t h_(upright("co"))$, $psi$ is the differentiated field in laboratory components,
  $p' = a$, $c = ell_C^p h_(upright("co"))$, and $macron(g) =
  overline(G)_(p \, c)$ is the instantaneous stationary reference.
  All compact pseudodifferential operators act spatially at the current time and have kernel support strictly
  inside the computing cylinder.

=== 5.1 Finite-slab norms and their hierarchy <finite-slab-norms-and-their-hierarchy>

For a Banach space $X$, write

$ parallel V parallel_(L_alpha^nu X) = parallel chevron.l t chevron.r^(alpha \/ 2) V
  parallel_(L^nu \( \[ 0 \, T \] \; X \)) . $

We may replace $chevron.l t chevron.r$ by $tau = T_0 + t$.
  Here $T_0$ is fixed after all spatial radii, and differences on a fixed initial interval are charged to the
  input. The three levels are

#[#set math.equation(numbering: n => "(5.1)")
 $ U & U_l & s & A_i\
h_(upright("co")) & h_(upright("lab")) & 10 & 0\
h_(upright("co")) & h_(upright("lab")) & 9 & A_H\
u & psi & 8 & A\
A_H = 1 - eta_(*) \, wide A = 1.36 \, wide A_S = 1.06 . $ <co2:levels>]

where $eta_(*) > 0$ is sufficiently small. In particular $2 A_H > A$.

Fix a compact physical neighborhood of trapping, disjoint from the horizon, the inner face,
  the spatial end and all coefficient probes. Also choose a scalar spatial operator

#[#set math.equation(numbering: n => "(5.2)")
 $ B_(upright("nt")) = 1 - Psi_(upright("tr")) $ <co2:directional-cutoff>]

such that $Psi_(upright("tr"))$ has compact interior kernel support and microsupport in the stationary-elliptic
  cone $cal(T)$. At high frequency $B_(upright("nt"))$ vanishes in a neighborhood of the projections of
  #emph[both] temporal trapped sets, with a margin valid for nearby frozen parameters.
  Slightly nested versions will be used without changing notation.
  The distinction between this directional cutoff and the physical trapping neighborhood is important.

For every level in (5.1), the compact budget $sans(K)_R$ includes on fixed enlarged compact sets

#[#set math.equation(numbering: n => "(5.3)")
 $ partial_t^b U in L_(A_i)^oo H^(s - b) ∩ L_(A_i)^2 H^(s - b - 1 \/ 2) \, wide 0 lt.eq b lt.eq
   s . $ <co2:compact-norms>]

It includes full order $L_(A_i)^2 H^(s - b)$ outside the physical trapping neighborhood, and additionally

#[#set math.equation(numbering: n => "(5.4)")
 $ B_(upright("nt")) partial_t^b U in L_(A_i)^2 H^(s - b) \, wide b = 0 \, 1 \, $ <co2:directional-norms>]

on fixed compact reaches. Full endpoint order is always retained.
  We do #emph[not] require (5.4) for all higher time jets in the physical trapping neighborhood.

All compact norm sums use a finite collection of nested reaches and cutoffs.
  The collection contains the kernel and probe supports, the error supports in the estimates below,
  and the fixed starting overlaps with the far region. It may be enlarged after the far starting radius $R_0$ is
  chosen, but is fixed before the upper matching radius $R$.
  Define $sans(K)_R$ as the sum of the listed norms on this collection, with fixed positive coefficients,
  together with the differential-end norms described next. Constants on a fixed reach may depend on it,
  but not on $R$. The first-jet norms extend to a nonincreasing upper cutoff equal to one through $3
  R$ and zero after $4 R$. In the differential exterior region they are the energy, bulk and Hardy norms of

$ tilde(r) thin partial_y^mu U \, wide \| mu \| lt.eq s - 1 \, $

with bulk weight $tilde(r)^(- 1 - delta)$ and time weight $tau^(A_i)$ in the radial-round measure;
  $tilde(r)$ is the radius of the constant affine asymptote of $macron(g)$, and $delta > 0$ is arbitrarily small.
  We will construct the corresponding positive energy below.
  Mixed norms on other bounded annuli up to the matching radius may be added with sufficiently small positive
  $R$-dependent normalizations. Their unnormalized estimates are used only in products or in the choice of $T_0$,
  never as uniform linearly contracting controls. Those normalizations are fixed after $R$ and before the
  bootstrap and data smallness. This convention avoids asserting radius-independent equivalence of all unscaled
  mixed norms through the upper shell.

We use a far budget $sans(F)$ beginning at a fixed large radius $R_0$, chosen before $R$.
  Its complete definition and estimate are given in the next section; the following components suffice here.
  In emitter coordinates

$ t = q + r \, wide z = - lambda \( q \) + r n \, wide \| n \| = 1 \, $

let $T_l = partial_(t \, upright("lab"))$, $X = T_l + n dot.op partial_z$, and $Z = \( r X \, Omega_(q \, r) \)$,
  with $Omega_(q \, r)$ the sphere rotations. The good bulk norms of $\( 1 \, Z \) Z^I T_l^b U_l$, for $\| I \| +
  b lt.eq s - 1$ at each level, in $d t thin d r thin d omega \/ r$, have squared weight

#[#set math.equation(numbering: n => "(5.5)")
 $ W_i = r^(p_i - A_i) \( t + 10 r \)^(A_i) \,
   wide \( p_0 \, p_H \, p_P \) = \( 0.64 \, 1 - eta_(*) \/ 6 \, 1.62 \) . $ <co2:far-weights>]

The bad first-derivative norms of $r partial Z^I T_l^b U_l$ have the weights of (10.1); on $t gt.eq
  C r$ the low orders needed in the sliced estimate are bounded below by $r^(- 0.03) chevron.l t chevron.r^(A_i)$.
  On this timelike region we also use

#[#set math.equation(numbering: n => "(5.6)")
 $ \| h_(upright("lab")) \| lt.tilde sans(N) r^(- 1 + 0.01) \( t \/ r \)^(- A_H \/ 2) \,
   wide \| partial h_(upright("lab")) \| lt.tilde sans(N) r^(- 1 + 0.03) t^(- A_H \/ 2) . $ <co2:far-pointwise>]

The relevant co-moving and emitter radii are uniformly comparable.

Set $sans(S)_a = parallel a parallel_(L_A^2)$. Since $A > 1$,
  this controls $integral \| a \|$ and hence the change of $p$.
  Filtered feedback from the $u$ budget controls the required positive acceleration derivatives in $L_A^2$,
  and then their finite list of endpoint norms. The total bootstrap size $sans(N)$ includes $sans(K)_R \,
  sans(F) \, sans(S)_a$ and a static budget. To define it, put $k_(upright("stat")) = g_(upright("co")) -
  overline(G)_(p \, c)$ and let $K$ run over the fixed compact reaches,
  with $K_(upright("off"))$ the fixed sets outside the physical trapping neighborhood. Sum the quantities

$ sum_(b = 0)^8 parallel partial_t^b k_(upright("stat")) parallel_(L_(A_S)^2 H^(8 - b) \( K \)) +
  sum_(b = 0)^8 parallel partial_t^(b + 1) k_(upright("stat"))
  parallel_(L_(A_S)^2 H^(8 - b) \( K_(upright("off")) \)) . $

These are assumed finite-slab budgets at this stage; the sliced estimate will bound them.
  All reaches are fixed before $R$. Write $e_(upright("in"))$ for the input through the base orders.
  Constants denoted $C_(upright("fix"))$ may depend on all scales fixed before the final data smallness,
  but never on the lifespan. These are the norm conventions of (5.3), with the additional directional control (5.4).

The role of the directional control is particularly concrete in the sliced stationary equation.
  On each fixed compact reach its source will have spatial order six in all directions and order seven after
  $B_(upright("nt"))$. An order-$- 2$ inverse on the complementary elliptic cone supplies an $H^8$ correction;
  subtracting it leaves an $H^7$ source for the ordinary one-order stationary estimate.
  This recovers an $H^8$ static residual whose $L_(A_S)^2$ bound, with $A_S > 1$,
  makes its low coefficient norms integrable in time. The argument in 12 uses only the directional first jets
  specified above. The low-frequency estimate, proved first, has a different role:
  it makes lower compact errors and the linear parameter forcing small enough to absorb in the final compact
  energy estimate.

=== 5.2 The compact low estimate <the-compact-low-estimate>

Choose a sufficiently large fixed $N_(-)$ and let $sans(l)$ be the sum, on the compact reaches used below,
  of the $L_(A_H)^2 H^(- N_(-))$ norms of $h_(upright("co")) \,
  partial_t h_(upright("co"))$ and the $L_A^2 H^(- N_(-))$ norms of $u \, partial_t u$.
  Enlarging $N_(-)$ merely weakens this norm.

#thm([Proposition 10.])[
  (Low-frequency transfer).  #emph[Under the simultaneous finite-slab budgets above,
    there is $kappa_0 > 0$ such that, after choosing $R$ and then $T_0$ sufficiently large,
#[#set math.equation(numbering: n => "(5.7)")
 $ sans(l) lt.eq C R^(- kappa_0) \( sans(K)_R + sans(F) \) +
   C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) . $ <co2:low-bound>]

 The exponent can be fixed before enlarging any prior compact reach.
   Such enlargements change constants but not the available radius gain.]
] <co2:low-transfer>

#proof[
  Apply the augmented retarded operator $M_R \( partial_t \)$ to $chi_R U$; for $U =
    u$ differentiate the reduced equation first. The first variation at the base is exactly $L h +
    Q \( partial_t \) a$. After this linear part is removed, the compact forcing other than $\[ L \, chi_R \]
    U$ and startup terms has norm $C_(upright("fix")) sans(N)^2$ in $L_(A_i)^2 overline(H)^4$;
    the bar means extendibility at the outflow boundary. We spell out why the arbitrary-spin localization does not
    alter this fact. A varying coefficient on a field jet costs $p \, c \, h$, their derivatives,
    or their bounded memories, and never an uncontrolled position $lambda$.
    At zero field the exact affine-position freezing identity removes the target defect;
    its nonlinear remainder therefore contains a strong acceleration factor.
    After one time derivative a changed coefficient on an undifferentiated-in-time field jet contains $u \,
    dot(c)$, or an acceleration jet. A product of two weak factors also suffices, since $2 A_H > A$.
    There are at most two ordinary differentiations before the four spatial source derivatives.
    These products lie strictly below the half-loss bulk orders in (5.3).
    The compact kernels preserve the stated orders, and their distant bounded reaches use the compact-far overlap
    norms. Startup terms and filtered startup tails are bounded by finite-time stability in terms of
    $e_(upright("in"))$.
  Commuting $tau^(A_i \/ 2)$ through bounded memories and the stable convolution filter costs $C_R
    T_0^(- 1)$ times the matched budgets, together with initial data terms. Apply also the causal smoothing filter
  $ (frac(c_(*), c_(*) + partial_t))^(M_(*)) \, $
  where $M_(*)$ exceeds the fixed polynomial test losses, including those of a once differentiated output.
    For the shell forcing, the integration by parts gives the leading Wronskian
  #[#set math.equation(numbering: n => "(5.8)")
   $ integral chi'_R b^(r r) \( v_(*) partial_r U_(*) - U_(*) partial_r v_(*) \) r^2 thin d r thin d omega \, wide
     r = r_y . $ <co2:wronskian>]
  Here $v_(*)$ is the transpose test and $U_(*)$ is the weighted temporal transform.
    Replacing both radial derivatives by $partial_r + zeta$ leaves the Wronskian unchanged.
    Angular, density and short-range terms have no worse orders by the Boyer–Lindquist asymptotics;
    compact additions produce no shell term. The transpose radiation estimates and Plancherel thus bound (5.8) by
    $C c_(*)^(N') R^(4 iota)$ times the shell norm of
  $ \( 1 \, Omega_(upright("co")) \, r_y \( partial_(r_y) + partial_t \) \) U $
  in $L^2 \( chevron.l t chevron.r^(A_i) d t thin d r_y thin d omega \/ r_y \)$,
    up to the plateau errors already listed.
  This shell norm is bounded by
  #[#set math.equation(numbering: n => "(5.9)")
   $ C R^(- \( p_i - A_i \) \/ 2) sans(F) + C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) . $ <co2:low-shell>]
  Indeed $y = r n + lambda \( t \) - lambda \( q \)$, so the two good-direction systems differ by small parameter
    coefficients times full first derivatives. The component transformation uses $v \( t \)$,
    and the difference between $u$ and the transform of $psi$ is $O \( v_s - v \) partial h_(upright("lab")) +
    O \( a \) h_(upright("lab"))$. On this fixed shell the coefficient differences,
    also after the required differentiation, have bounded-memory strong weighted bounds.
    Bad derivatives therefore occur only in products, with allowable $R$-dependent constants.
  All tested multipliers are causal: identification on a forward Laplace line and strip displacement apply
    separately to the two test kernels produced by the Wronskian rearrangement.
    We can consequently stop forcing at $T$ when estimating earlier outputs without paying final-time data.
    Initial jumps are absorbed by the smoothing filter. Taking duals of sufficiently high-order compact test
    bounds gives the negative spatial norm defining $sans(l)$.
    Removing the auxiliary filter costs $C c_(*)^(- 1)$ times adjacent local time-jet budgets and startup
    transients. Choose
  $ c_(*) = R^(kappa') \, wide kappa' N' + 4 iota < 1 / 2 min_i \( p_i - A_i \) \, $
  and then take $T_0$ sufficiently large after $R$. All $p_i - A_i$ are positive, so this gives (5.7).
    The powers arise only from the fixed test loss and far weights, not from constants on compact reaches.
    Interpolation is consequently available at every order strictly below the corresponding bulk order.
    No full-order bulk estimate on a base-space stationary-timelike trapping region was used. ◻
]

=== 5.3 Frozen time-local energies <frozen-time-local-energies>

We now construct the energy supplying the compact budget. The construction has two separate roles:
  a compatible frozen transport gives a half-order loss at trapping,
  while strict sign away from both trapped sheets gives the extra directional first-jet estimate.
  Subsequently we will compare the actual equation with this frozen energy;
  we will not assume that the actual evolving metric has a stationary trapped set.

#thm([Proposition 11.])[
  (Frozen energy).  #emph[Fix a smooth nearby stationary parameter pair $\( p \, c \)$ and an integer $s gt.eq 8$.
    The frozen operator $upright(bold(L))_(p \, c)$ admits a positive time-local first-jet energy,
    uniformly for nearby parameters, with full endpoint orders $H^s xor H^(s - 1)$.
    On each fixed interior reach its favorable derivative controls
#[#set math.equation(numbering: n => "(5.10)")
 $ parallel cal(Y) parallel_(H^(s - 3 \/ 2))^2 + parallel B_(upright("nt")) cal(Y) parallel_(H^(s - 1))^2 -
   C_s parallel cal(Y) parallel_(H^(s - 2) \( upright("enlarged") \))^2 \, wide
   cal(Y) = \( chevron.l D_y chevron.r U \, D_t U \) \, quad D_t = - i partial_t . $ <co2:frozen-dissipation>]

 It also controls full mixed physical-nontrapping orders after equation recovery.
   At the inner and outer differential regions the energy is an ordinary wave current with strict bulk sign and an
   exiting inner flux. All remaining compact derivative errors have total field order at most $s - 1$.
   The compact additions to the differential currents have strictly interior spatial kernel support.]
] <co2:stationary-energy>

#proof[
  We first construct dissipation near trapping and the horizon,
    and extend it through the compact propagation region. We then join these forms to literal differential
    currents near the boundaries. Finally we recover the original first jets and record how the energy changes
    with the stationary parameters.
  ===== 5.3.1 First-jet reduction. <first-jet-reduction.>
  With $\( p \, c \)$ fixed, the time-acceleration coefficient is an invertible multiplication operator plus a
    compact interior operator of spatial order $- 1$, small at a base order.
    Its inverse is multiplication plus negative order at every smooth order,
    by the spatial parametrix and derivative gain. After solving this coefficient and making the elliptic
    first-jet rescaling in (5.10), the evolution has two smooth blocks with separated scalar real principal roots.
    Separation follows from spacelike slicing, not from timelikeness of the stationary Killing vector.
    An eigenbasis conjugation, followed by the order-by-order off-diagonal equations dividing only by the root
    gap, diagonalizes to any required lower order on compact interior supports.
  Write $m_s = 2 s - 2$ for the order of the jet quadratic form.
    On each block its diagonal principal form, expressed on $U$ polarizations,
    is a positive homogeneous Hermitian form times the wave action
  $ \| det macron(g) \|^(1 \/ 2) \| macron(g)^(t alpha) k_alpha \| \, $
  of total order $2 s$. Its diagonal energy derivative is ray transport of the extra Hermitian form,
    including the nonscalar amplitude transport. The scalar geometric-optics divergence is absorbed by wave action
    and spatial pushforward. Equivalently, this is the symmetrized derivative formula in stationary half-density
    coordinates for the first-jet system.
  Here is the operative compact estimate that this construction will establish.
    Let $K$ lie inside a fixed buffered interior reach $K'$, and let $cal(Y)$ be a smooth first-jet test field
    supported in $K'$. Write its normalized first-jet equation as $partial_t cal(Y) = cal(G)_(p \, c) cal(Y) +
    cal(F)$, where $cal(F)$ is the full residual, and denote the constructed positive quadratic form by
    $cal(E)_s = chevron.l cal(A)_s cal(Y) \, cal(Y) chevron.r$.
    The operator $cal(A)_s$ has order $m_s$, and $cal(E)_s asymp parallel cal(Y)
    parallel_(H^(s - 1))^2$ on these supports. For fixed $\( p \, c \)$ the estimate is
  #[#set math.equation(numbering: n => "(5.11)")
   $ frac(d, d t) cal(E)_s & + c_s parallel cal(Y) parallel_(H^(s - 3 \/ 2) \( K \))^2 +
     c_s parallel B_(upright("nt")) cal(Y) parallel_(H^(s - 1) \( K \))^2\
 & lt.eq C_s parallel cal(Y) parallel_(H^(s - 2) \( K' \))^2 + 2 "Re" chevron.l cal(A)_s cal(Y) \,
   cal(F) chevron.r . $ <co2:compact-energy-form>]
  No support preservation by the normal-coefficient inverse is assumed: $cal(F)$ includes the entire residual.
    This formula describes the buffered compact part; the differential end currents below retain their own bulk
    norms and boundary flux. Higher mixed time jets are subsequently recovered from the equation and the
    corresponding source jets.
  ===== 5.3.2 The half-order loss at trapping. <the-half-order-loss-at-trapping.>
  Use the compatible fiber metric constructed in the calibrated stationary family. Multiply it by
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| k \( partial_t \) \|^(2 s - 1) b_C \, wide b_C = exp #scale(x: 120%, y: 120%)[\(] -
     C \( phi_(+)^2 - phi_(-)^2 \) #scale(x: 120%, y: 120%)[\)] \, wide phi_plus.minus =
     z_1 plus.minus z_2 . $ <co2:trap-weight>]
  Here $C > 0$ is a scalar constant, unrelated to the gauge operator.
    The normal variables for the exact Kerr reference satisfy $V phi_plus.minus =
    plus.minus lambda phi_plus.minus$, with $lambda > 0$. Exact transport compatibility therefore gives a negative
    principal derivative of relative size $2 C lambda \( phi_(+)^2 + phi_(-)^2 \)$.
    Gauge cutoffs below saturation contribute only fixed lower errors.
    This applies to both roots, including where the spatial base intersects the ergoregion.
  The order immediately below this vanishing principal derivative needs care.
    In a stationary half-density Weyl chart on a diagonalized block, start the energy with $e_(m_s) =
    b_C e_(m_s)^0$ and take its next symbol to be $b_C$ times a $C$-independent choice.
    Since the order-one evolution has real scalar principal symbol $p_(upright("hw"))$,
    its even second Weyl bracket cancels in the degree-$\( m_s - 1 \)$ derivative.
    Only first derivatives of $b_C$ can enter from $e_(m_s)$.
    A stationary frame change adds to the next symbol terms linear in $d b_C$, with $C$-independent coefficients.
    In this frame the next symbol has the form
  #[#set math.equation(numbering: n => "(5.13)")
   $ e'_(m_s - 1) = b_C r_0 + sum_alpha \( partial_alpha b_C \) r_alpha \, $ <co2:frame-subprincipal>]
  where the normalized symbols $r_0 \, r_alpha$ are independent of $C$. On the trapped set,
  $ d b_C = 0 \, wide H_(p_(upright("hw"))) \( d b_C \) = 0 \, $
  the second identity following because $H_(p_(upright("hw"))) b_C$ vanishes quadratically.
    More explicitly, for $V = H_(p_(upright("hw")))$, $V \( partial_j b_C \) =
    partial_j \( V b_C \) - \( partial_j V^k \) partial_k b_C$; both terms vanish there.
    Thus the critical derivative on trapping is bounded independently of $C$ relative to the unweighted scales.
    Off-diagonal errors are handled by the preceding diagonalization, chosen before $C$.
  Factor $C$ from the principal dissipation. On a normalized symbol patch let $g$ be the positive Hermitian square
    root of $2 lambda b_C e_(m_s)^0$ and set $G_plus.minus = "Op"^(upright(w)) \( g phi_plus.minus \)$,
    chosen self-adjoint. Both factors have order $m_s \/ 2$ and use the same matrix weight.
    Their squares have principal sum $2 lambda b_C e_(m_s)^0 \( phi_(+)^2 + phi_(-)^2 \)$.
    Their degree-$\( m_s - 1 \)$ square errors vanish at trapping:
    at the zero of a scalar $phi$, the first derivatives of $g phi$ are $g$ times scalar derivatives.
    For a smooth test section $z$, the elementary inequality
  #[#set math.equation(numbering: n => "(5.14)")
   $ parallel G_(+) z parallel^2 + parallel G_(-) z parallel^2 gt.eq
     plus.minus chevron.l i \[ G_(+) \, G_(-) \] z \, z chevron.r $ <co2:trap-uncertainty>]
  follows from the nonnegativity of $parallel \( G_(+) minus.plus i G_(-) \) z parallel^2$.
    On trapping the commutator has, up to the fixed sign convention, symbol $g^2 { phi_(+) \,
    phi_(-) }$ of order $m_s - 1$. The bracket is nonzero with uniform normalized size,
    and $g^2$ on trapping is positive and independent of $C$.
  Retain a fixed fraction of the original $C$-scaled squares and apply (5.14) to the rest,
    choosing the sign on each patch. The resulting positive order-$\( m_s - 1 \)$ form dominates the
    $C$-independent critical derivative once $C$ is large. Fix $C$ first and then shrink the neighborhood on which
    that form is strict. Outside it, the retained squares supply strict principal sign.
    Operator-square partitions and stationary frame changes have on trapping only the critical errors just
    controlled. Spatial Gårding leaves order $m_s - 2$, with constants now allowed to depend on the fixed $C$.
    Consequently the bulk controls $U$ in $H^(s - 1 \/ 2)$ and $U_t$ in $H^(s - 3 \/ 2)$ modulo total field order
    $s - 1$, while the endpoint orders stay full. This argument uses symplectic transversality and exact
    compatible transport, not stationary ellipticity over a base annulus.
  ===== 5.3.3 The horizon and compact propagation region. <the-horizon-and-compact-propagation-region.>
  At the horizon radial set take action times $b_1^(2 s - 1)$ and a positive tensor metric adapted to the
    horizon-generator null flag. In generator parameter, parallel transport scales the null line at rate $-
    kappa_(+)$, the opposite quotient at rate $kappa_(+)$, and rotates the screen quotient.
    Flag scaling makes bounded null rotations arbitrarily small.
    The rank-two amplitude norm consequently grows at most at rate $2 kappa_(+) + epsilon.alt'$.
    The local HHV additions are chosen sufficiently small at the center;
    the additional high-frequency gauges miss the horizon, and nearby target changes are small.
    The frequency rate is $- kappa_(+)$ in the same parametrization, so
  $ \( 2 s - 1 \) kappa_(+) > 4 kappa_(+) $
  gives a strict margin, preserved for nearby parameters. Increasing $s$ only improves it.
  Use the source-neighborhood function and the escape alternatives proved earlier to extend the principal forms
    over a large fixed cylinder. The remaining compact set, outside smaller trapping and horizon neighborhoods
    where the signs have already been obtained, is covered by finitely many flow tubes.
    The ends of each central bump lie outside this remaining set:
    they are in exit regions or in collars with an already strict principal sign.
    A stable or unstable tail may end in the trapping collar; it need not reach a cylinder boundary.
    Integrating along the tube gives the required positive derivative,
    with any unfavorable endpoint bump confined to those controlled collars.
    Their existing strict signs absorb these endpoint terms after fixed weight choices;
    in the horizon collar one uses the increasing source function.
    The correction is constant near the exact trapped set, so it does not alter the preceding critical-order
    calculation. Multiplication of the metric by its decreasing exponential supplies the missing strict signs.
    Smooth exact-Kerr models and finitely many tubes make these choices uniform nearby.
    This is a separate construction on each root block; it does not use positivity of a stationary Killing current
    throughout the exterior.
  ===== 5.3.4 Literal differential currents near the boundaries. <literal-differential-currents-near-the-boundaries.>
  Outside all compact kernels, the stationary metric has a constant affine Minkowski leading model
    $\( tilde(t) \, tilde(y) \)$, with $tilde(y) = A_(upright("aff"))
    y$ and $partial_t$ parallel to $partial_(tilde(t))$. Let $tilde(r) = \|
    tilde(y) \|$ and use the wave stress-energy currents, summed on components, for
  #[#set math.equation(numbering: n => "(5.15)")
   $ chi_mu = tilde(r) thin partial_y^mu U \, quad \| mu \| lt.eq s - 1 \, wide N =
     partial_(tilde(t)) + \( f_oo - tilde(r)^(- delta) \) partial_(tilde(r)) \, quad
     0.9 < f_oo < 1 . $ <co2:outer-current>]
  The conjugated flat equation has principal part $- partial_(tilde(t))^2 + partial_(tilde(r))^2 +
    tilde(r)^(- 2) Delta_(bb(S)^2)$. For $f = f_oo - tilde(r)^(- delta)$, the deformation gives
  $ f' \| partial_(tilde(t) \, tilde(r)) chi_mu \|^2 + \( 2 f \/ tilde(r) - f' \) tilde(r)^(- 2) \| partial_omega
    chi_mu \|^2 $
  in $d tilde(t) thin d tilde(r) thin d omega$. Stationary metric deviations are $O \( tilde(r)^(- 1 +) \)$,
    and the first and zeroth order terms in $upright(bold(L))$ are respectively $O \( tilde(r)^(- 2 +) \)$ and
    $O \( tilde(r)^(- 3 +) \)$. After commuting, the equation recovers lower-commuted second time jets.
    The identity then controls $tilde(r)^(- 1 - delta) \| partial chi \|^2$ with errors $O \( tilde(r)^(- 4) \) \|
    chi \|^2$. Radial Hardy on each slice controls these errors and $tilde(r)^(- 3 - delta) \| chi \|^2$,
    up to a fixed compact lower-order anchor. All first derivatives are controlled,
    so the affine tilt of slices is harmless, as is a nonincreasing upper cutoff.
  The starting radius $R_c$ for these differential signs can be chosen independently of $f_oo in \( 0.9 \, 1 \)$,
    though final coercivity constants cannot: $1 - f gt.eq tilde(r)^(- delta)$ dominates the coefficient
    perturbation, while $f'$ and $2 f \/ tilde(r) - f'$ retain their bulk signs.
    The coordinates may be chosen from the stationary affine part of the exact Kerr model,
    leaving only subleading symbol differences in its radius and angles.
    At the strict spacelike inner outflow use ordinary positive wave currents with a rapidly increasing radial
    exponential weight, which supplies strict damping and the exiting boundary sign.
  ===== 5.3.5 Matching the currents to the compact forms. <matching-the-currents-to-the-compact-forms.>
  Far out, use a cutoff in the invariant impact $D \/ E^2$,
    equal to one on rays through the start of the differential region and equal to zero at large impacts;
    extend it as one inward. On its support, sufficiently far out, rays are close to radial and monotone.
    Extend the previous decreasing metric along them with strict integrable damping
    $O \( tilde(r)^(- 1 - delta) \)$. Tensor transport errors relative to the affine model are integrable along
    such rays, so this extension remains two-sided comparable to action times $\| E \|^(2 s - 1)$.
    The impact bound is fixed from $R_c$ before $f_oo$ is taken close to one:
    in that collar the stationary field is timelike, hence all relevant impacts are bounded.
    Smooth positive-metric transport first matches the negative derivative in a fixed overlap,
    and neither its comparability nor this construction depends on $f_oo$.
  Scale the differential energy by a fixed factor to make it larger than this extension on incoming rays.
    Its characteristic factors relative to stationary energy approach fixed multiples of $1 +
    f_oo$ on incoming rays and $1 - f_oo$ on outgoing rays, with all other jet comparisons uniform.
    After that scale is fixed, take $f_oo$ close enough to one and the matching radius large enough that the
    differential energy is smaller on outgoing rays. Monotone convex interpolation then has favorable derivative
    in both directions. Toward inner outflow interpolate similarly to a smaller inner energy.
    All these choices precede $R$.
  Keep differential currents literally unchanged near each boundary and add only compact interior quadratic
    kernels. Their principal cross terms vanish in the evolution eigenbasis;
    the next cross derivative symbol is imposed by an energy correction dividing by the root difference.
    In strict matching regions, scale cross entries of the differential derivative form by the products of the
    interpolation coefficients on its two blocks. This yields strict full Hermitian derivative sign there.
    Near trapping retain the diagonalization through the critical order already used.
    Spatial kernel cutoffs lie strictly in the interior and cost smoothing errors on fixed sets.
    The base differential currents may be supported only near their matching collars,
    away from trapping and nonlocal PDE kernels. Their divergence identities require no acceleration substitution
    at a boundary; that substitution is needed only for the additions on buffered interior supports.
    In particular no nonlocal sign on an outflow trace is asserted.
  ===== 5.3.6 Directional improvement and original jets. <directional-improvement-and-original-jets.>
  The strict principal sign off both projected trapped sets allows subtraction of a sufficiently small positive
    localized square for $B_(upright("nt")) cal(Y)$ at order $s - 1$.
    Its high part vanishes near both traps with a uniform parameter margin,
    so this subtraction introduces no critical symbol there. One-order composition errors off trapping are
    absorbed in the strict principal sign modulo order $m_s - 2$;
    the part smoothing near trapping costs only the fixed lower orders.
    A physical cutoff avoiding trapping has the same property,
    and the differential-only ends already have full estimates.
  The order-zero eigenbasis in the first-jet grading and its inverse remain elliptic even if one temporal root is
    zero: only their gap has been inverted. Commuting a scalar spatial cutoff through that stationary eigenbasis
    costs one order. The conic estimate on both diagonal blocks therefore gives exactly (5.10) on the original
    first jets. Very-low positive coercivity supplements, if required,
    add only fixed lower-order derivative errors. If the stationary parameters now vary,
    differentiating this prescribed family contributes at most $C_R \( \| a \| + \| dot(c) \| \)$ times the
    endpoint norm squared on $r_y lt.tilde 4 R$. Affine quantities are used algebraically on the frozen wave jets:
    their radial coefficient is $tilde(r)$, and no time coordinate factor produces a spurious $t a$ term. ◻
]

=== 5.4 Sliced control through a stationary-elliptic cone <sliced-control-through-a-stationary-elliptic-cone>

The next estimate provides the integrable low coefficient differences needed for the actual-principal comparison.
  Its acceleration estimate must have a coefficient on $sans(F)$ independent of $R_0$;
  otherwise the later compact and far estimates would form an unabsorbable linear cycle.

#thm([Proposition 12.])[
  (Sliced estimates).  #emph[On any fixed enlarged compact reach, the simultaneous budgets imply
#[#set math.equation(numbering: n => "(5.16)")
 $ sans(S)_a & lt.eq C \( R_0 \) sans(K)_R + C sans(F) +
   C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) \, &  & C upright(" independent of ") R_0 \,\
parallel g_(upright("co")) - overline(G)_(p \, c) parallel_(L_(A_S)^2 H_(upright("loc"))^8) & lt.eq
  C_(upright("loc")) \( sans(K)_R + sans(F) + sans(S)_a \) +
  C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) . $ <co2:sliced-acceleration>]

 The second estimate includes mixed jets of total order eight,
   and one extra time derivative with the same mixed order on fixed sets outside the physical trapping
   neighborhood. This extra derivative will supply the mixed time-radial trace in (7.11) when the exterior
   solution is restricted to the interior entry cylinder. Constants on these fixed reaches are independent of the
   upper radius $R$.]
] <co2:sliced>

#proof[
  We first derive the source regularity, then estimate the acceleration by adjoint pairing,
    and finally recover the static field. At sufficiently late time choose $chi_t = 1$ for $r_y lt.eq
    c_1 t$ and $chi_t = 0$ for $r_y gt.eq 2 c_1 t$, with $c_1 > 0$ small enough that its support lies in $t gt.eq
    C r_y$. The fixed earlier interval costs input. With $p = p \( t \)$ the sliced equation is
  #[#set math.equation(numbering: n => "(5.17)")
   $ L_p \( 0 \) \( chi_t h_(upright("co")) \) = chi_t \( cal(R)_h - f_B \) + \[ L_p \( 0 \) \, chi_t \]
     h_(upright("co")) . $ <co2:sliced-equation>]
  The defect $cal(R)_h$ subtracts the nonstationary reduced equation and compares all field-dependent terms with
    their stationary linearized action at $G_p$.
  ===== 5.4.1 Compact source orders. <compact-source-orders.>
  On a fixed reach the order-four estimate is
  #[#set math.equation(numbering: n => "(5.18)")
   $ parallel cal(R)_h parallel_(L_A^2 overline(H)^4) + parallel f_B -
     Q \( 0 \) a parallel_(L_A^2 overline(H)^4) lt.eq C_(upright("loc")) sans(K)_R +
     C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) . $ <co2:compact-defect>]
  The same source has order six globally, and order seven after $B_(upright("nt"))$.
    To verify the last, potentially limiting assertion, subtract first at the frozen target $G_p$ and frozen
    additions $E_(upright(g)) \( p \, 0 \) \, C \( p \, 0 \)$, then linearize in the field.
    The linear time-deletion terms have order at most two and at least one time derivative.
    Changed coefficients cost $h \, c$, their jets, or acceleration jets and bounded memories, including $B -
    G_p$. True derivatives of the family and its projections minus frozen derivatives have the same allocation.
    Ricci and wave-gauge terms are quasilinear of order two, with smooth undifferentiated coefficients.
    The extra gauges use order-zero or lower spatial kernels and at most one time derivative apiece.
    Thus at most two ordinary field differentiations precede the spatial source norm, including within compositions.
  On the target, the first variation is $Q \( partial_t \) a$ with bounded-length memory.
    Its difference from $Q \( 0 \) a$ starts with $a'$, controlled by the $u$ feedback and startup.
    The nonlinear difference contains a strong factor by exact freezing.
    A sufficiently large fixed filter order $P$ supplies every fixed spatial order here.
    The coefficient probes are smooth and physically nontrapped, so their full-order bounds are available.
  Order six is below the global half-loss bulk orders: use strong order eight for $u$, weak order nine for $h$,
    and $2 A_H > A$. At source order seven the only limiting factors are
  $ partial_y^2 h \, wide partial_y u \, wide partial_t u . $
  They have bulk regularity $H^6.5$ globally and $H^7$ after $B_(upright("nt"))$.
    Their coefficient factors are undifferentiated and have endpoint $H^9$.
    For a purely spatial second derivative of $h$, its coefficient difference also has a weak or strong weighted
    small factor: the exact stationary linear part has already been subtracted.
    We perform this calculation in the reduced equation #emph[before] inverting its acceleration coefficient.
    Hence an unsmoothed second field derivative has only undifferentiated metric or target coefficients.
    A second-ordinary-derivative placement from an added order-zero gauge instead carries a time-differentiating
    kernel of spatial order at most $- 1$; differentiating that kernel in a parameter does not change this spatial
    order. All other connections and inverse-coefficient derivatives distribute at most first derivatives on
    individual field factors. In particular, the argument never commutes a first-field-derivative coefficient past
    an unsmoothed second derivative.
  The needed cutoff estimate in three dimensions is
  #[#set math.equation(numbering: n => "(5.19)")
   $ parallel \[ B_(upright("nt")) \, f \] v parallel_(H^7) lt.eq
     C parallel f parallel_(H^9) parallel v parallel_(H^6.5) . $ <co2:cutoff-commutator>]
  It holds also for matrix-valued $f$, since $B_(upright("nt"))$ is scalar.
    For completeness, in a compact symbol chart Fourier transform the symbol difference $b \( x \, eta + ell \) -
    b \( x \, eta \)$ in $x$. It decays rapidly in the dual $x$ variable and is bounded there by a symbol seminorm
    times $min \( 1 \, \| ell \| \/ chevron.l eta chevron.r \)$.
    After the input Sobolev weight is removed, the output multiplier is bounded by
  $ chevron.l eta + ell chevron.r^7 chevron.l eta chevron.r^(- 6.5)
    min \( 1 \, \| ell \| \/ chevron.l eta chevron.r \) lt.eq C chevron.l ell chevron.r^7 . $
  Indeed, for $\| ell \| lt.eq \| eta \| \/ 2$ it is at most $C \| ell \| chevron.l eta chevron.r^(- 1 \/ 2)$;
    on the complementary region use $chevron.l eta + ell chevron.r lt.eq C chevron.l ell chevron.r$.
    The smooth $x$-frequency convolution adds only a fixed polynomial weight.
    The weighted Fourier $L^1$ norm of $f$ is bounded by $parallel f parallel_(H^9)$ because $9 - 7 > 3 \/ 2$.
    Young’s inequality proves (5.19); smoothing remainders are harmless.
    Commuting the scalar cutoff through a fixed smooth order-zero matrix kernel similarly gains one order;
    negative-order kernels have additional room. Slightly enlarged supports therefore allow the cutoff to be
    placed on the limiting factor in each composition. Spatially constant time-dependent coefficients multiply
    this argument; no time-dependent cutoff commutator is involved. This proves the asserted directional source gain.
  ===== 5.4.2 Far source orders. <far-source-orders.>
  Put $h_l = h_(upright("lab"))$ and, on the cut,
  $ Delta_a = C integral_(t - C' r_y)^t \| a \( sigma \) \| thin d sigma lt.tilde sans(S)_a t^(- A \/ 2)
    r_y^(1 \/ 2) . $
  In addition to spatially constant leading combinations of $T_l psi$ and $partial_z psi$,
    the far sliced defect is bounded by
  #[#set math.equation(numbering: n => "(5.20)")
   $ & \( r_y^(- 1) + Delta_a \) \| partial psi \| + r_y^(- 2) \| psi \|\
 & quad + Delta_a #scale(x: 120%, y: 120%)[\(] \| partial_y^2 h_l \| + r_y^(- 1) \| partial h_l \| +
   r_y^(- 2) \| h_l \| #scale(x: 120%, y: 120%)[\)]\
 & quad + \| h_l \| \| partial^2 h_l \| + \| partial h_l \|^2 + r_y^(- 1) \| h_l \| \| partial h_l \| +
   r_y^(- 2) \| h_l \|^2 . $ <co2:sliced-far-source>]
  This proves the stated source bounds. To check its applicability,
    freeze the affine worldline at the current slice. Stationary time deletion then uses $T_l =
    v \( t \) partial_y$, whereas the actual field satisfies $T_l h_l = psi + v_s partial_y h_l$.
    The frozen co/lab basis change is spatially constant. Comparing in the actual lab equation avoids unsmoothed
    $v'$ terms. The first-moment cancellation gives $x - y = O \( r_y Delta_a \)$,
    and the target jets of order $b lt.eq 2$ differ from frozen jets by $O \( Delta_a r_y^(- 1 - b) \)$.
    The affine flat leading term cancels exactly; the Kerr corrections,
    coefficient derivatives and nonlinear wave-gauge terms give (5.20).
    The cutoff commutator contributes $O \( r_y^(- 1) \| partial_y h_l \| + r_y^(- 2) \| h_l \| \)$ on $r_y
    tilde.op c_1 t$.
  ===== 5.4.3 Acceleration pairing. <acceleration-pairing.>
  Pair (5.17) with the stationary adjoint kernel $cal(K)_p^(*)$.
    The stationary operator term vanishes, and its pairing with $Q \( 0 \)$ has full rank.
    Fix a sufficiently large $Y$ before $R_0$. Replacing $chi_t f_B$ by $Q \( 0 \) a$ on $r_y lt.eq
    Y$ costs the compact comparison above. Beyond $Y$ it costs $C Y^(- 1 + epsilon.alt_1) sans(S)_a$,
    which is absorbed by the choice of $Y$: the adjoint kernels are $O \( r_y^(- 2 + epsilon.alt_1) \)$,
    $chi_t f_B = O \( r_y^(- 2) chi_t tilde(a) \)$, and enlarged averaging over comparable radii is uniformly
    bounded in the strong weighted norm on the cut. Choose $0 < epsilon.alt_1 < zeta_1 < 0.13$, with $zeta_1$ small.
  For leading terms beyond $C R_0$, write $T_l = X - n dot.op
    partial_z$ and integrate the remaining spatial derivative once on the time slice, as in 36.
    The test coefficient is $O \( r_y^(- 2 + epsilon.alt_1) \)$ and gains an inverse radius upon differentiation.
    This includes derivatives of the cutoffs and $n$, since the emitter-coordinate first derivatives require only
    bounded velocities. It therefore suffices to control
  $ parallel r^(zeta_1) t^(A \/ 2) \( r X psi \, psi \) parallel_(L^2 \( d t thin d r thin d omega \/ r \)) lt.eq
    C sans(F) . $
  Here $C$ is independent of $R_0$, precisely because $p_P - A = 0.26$.
  For the other far terms $S'$ in (5.20), use directly the norm of $r_y^(1 + zeta_1) t^(A \/ 2)
    S'$ in this measure. The bad norm of $r_y partial psi$ loses at most $0.015$ powers of radius,
    compensated by $r_y^(- 1) + Delta_a$. Using tangential $r^(- 1) Z$, $X$, and $T_l h_l = psi +
    v_s partial_y h_l$, with $v_s$ small, gives
  $ \| partial_y^2 h_l \| lt.tilde \| partial psi \| + r_y^(- 1) \| Z^(lt.eq 1) psi \| +
    r_y^(- 2) \| Z^(lt.eq 2) h_l \| . $
  The differentiated coordinate coefficients are $O \( r_y^(- 1) \)$, including $partial v_s$.
    In weak terms use $t^(A \/ 2) Delta_a lt.tilde sans(S)_a r_y^(1 \/ 2)$.
    For quadratic terms combine (5.6) with weak bulk norms of $h_l \, r_y partial^(1 \, 2) h_l$,
    losing at most $0.015$ powers. For example the extra radius factor for $h_l partial^2 h_l$ is bounded by
  $ C sans(N) r_y^(zeta_1 + 0.015 - 1 + 0.01 + \( A - A_H \) \/ 2) \, $
  a negative power. The cutoff commutator has the required extra inverse radius.
    This proves (5.16); dependence on $R_0$ occurs only in the fixed compact and starting regions.
  ===== 5.4.4 The conic elliptic correction. <the-conic-elliptic-correction.>
  Apply stationary Fredholm regularity at growth power $gamma = 0.96$ to $chi_t h_(upright("co")) -
    H_C \( p \) c$, with the seven decaying-mode measurements and the ten constant-asymptote measurements from the
    preceding section.
    The remaining measurement costs $C_(upright("loc")) \( sans(S)_a + sans(K)_R + e_(upright("in")) \)$:
    only $ell h_(upright("co"))$ remains, controlled because $F \( 0 \)$ is invertible and
    $\( F \( zeta \) - F \( 0 \) \) \/ zeta$ is stable on $partial_t \( chi_(upright("st")) ell h_(upright("co")) \)$.
  At infinity the source needs only $r_y^(2 - gamma) t^(A_S \/ 2)
    S'$ in $L^2 \( d t thin d r_y thin d omega \/ r_y \)$, with equation derivative order zero.
    The direct bounds just proved supply it, including $chi_t f_B$ by strong averaging.
    Even the unsubtracted leading terms fit, since
  $ 1 - gamma + 0.015 < \( A - A_S \) \/ 2 . $
  On a fixed enlarged compact reach let $f$ denote the full sliced source.
    We have established $f in H^6$ and $B_(upright("nt")) f in H^7$, with the claimed time-weighted norms.
    Choose a properly supported order-$- 2$ parametrix $cal(Q)_p$ for $L_p \( 0 \)$ on an enlarged microsupport of
    $Psi_(upright("tr"))$, so that
  $ L_p \( 0 \) cal(Q)_p Psi_(upright("tr")) = Psi_(upright("tr")) + cal(R)_p \, $
  where $cal(R)_p$ is smoothing to any prescribed finite order.
    Include the compact pseudodifferential lower terms in the full symbol construction;
    finite-rank terms and off-cone leakage are smoothing. The correction $cal(Q)_p Psi_(upright("tr"))
    f$ is $H^8$, and its fixed coefficient measurements have the same bound.
    Subtracting it leaves the $H^7$ source $B_(upright("nt")) f - cal(R)_p f$.
    The ordinary stationary estimate with its one-order gain now gives $H^8$ for the remainder.
  The stationary application therefore uses two spatial regularity regimes:
    source order six with the additional $B_(upright("nt"))$ order seven on the fixed compact reaches,
    and only the weighted source order zero specified above near infinity.
    Switch between them across a fixed exterior annulus where the #emph[full] spatial symbol is elliptic,
    retaining a margin of high source regularity through the switch.
    The stationary propagation and radial estimates inside, and $b$-ellipticity with the same indicial gap
    outside, are exactly the variable-order observation in 6.
    Lowering far derivative orders introduces no new kernel ambiguity.
    This argument needs conic ellipticity near projected trapping and ordinary ellipticity far out;
    it does not assume ellipticity on an entire trapping base annulus.
  Finally, replacing $G_p + H_C \( p \) c$ by $overline(G)_(p \, c)$ costs quadratic $c$ terms;
    replacing $B$ by $G_p$ costs bounded acceleration memories.
    Mixed jets with a time derivative are obtained directly from $u$, not by differentiating the parametrix:
    they use order seven globally and full order eight outside physical trapping.
    Positive derivatives of the reference and projections use strong parameter and field jets through order nine
    for $c$. At order nine the leading term is $ell_C^p partial_t^8 u$ at the physically nontrapped probes;
    the highest strong order is needed only in bulk. This proves (5.16) and its extra-time-derivative assertion. ◻
]

=== 5.5 Comparison with the actual principal part <comparison-with-the-actual-principal-part>

The frozen energy alone does not estimate the nonlinear equation.
  Its principal wave coefficients must be replaced by the actual ones without losing a derivative.
  The sliced estimate makes the lower coefficient differences integrable;
  the differential principal difference is instead absorbed algebraically into the energy.

#thm([Proposition 13.])[
  (Actual-principal comparison).  #emph[For each level $\( U \, s \, A_i \)$ in (5.1),
    let $d_M^(alpha beta)$ be the change from $macron(g)$ to $g$ of the differential order-two wave coefficient in
    stationary normalization. On fixed compact reaches the reduced equation has the form
#[#set math.equation(numbering: n => "(5.21)")
 $ upright(bold(L))_(p \( t \) \, c \( t \)) U + d_M^(alpha beta) partial_(alpha beta) U = S_i^(upright("lin")) +
   S_i^(upright("err")) \, wide S_i^(upright("lin")) = plus.minus Q \( partial_t \) b_i \, wide b_i = a \, a \,
   a' \, $ <co2:source-ledger>]

 up to common normalizations, where
#[#set math.equation(numbering: n => "(5.22)")
 $ S_i^(upright("err")) in L_(A_i)^1 H^(s - 1) + L_(A_i)^2 H^(s - 1 \/ 2) \, wide
   parallel S_i^(upright("err")) parallel lt.eq C_(upright("fix")) sans(N)^2 +
   C_(upright("fix")) e_(upright("in")) . $ <co2:error-source-space>]

 On larger bounded differential annuli only $L_(A_i)^2 H^(s - 1)$ is required.
   There is an actual-principal correction of the frozen energy whose additional integrated derivative errors are
   bounded in squared estimates by $C_(upright("fix")) sans(N)^3$, up to input terms.
   The frozen half-loss bulk and directional improvement remain on the left side of that estimate.]
] <co2:actual-comparison>

#proof[
  We compare the frozen and evolving equations, retaining the actual principal coefficients and checking every
    source derivative count.
  ===== 5.5.1 Integrable low differences. <integrable-low-differences.>
  Acceleration and $dot(c)$ have strong $A$-weighted bulk and endpoint bounds at the required differentiated
    orders; $c$ has weak $A_H$ bounds and unweighted high bounds.
    In detail, derivatives of $c$ of orders one through nine use the full strong $u$ jets at the probes.
    The unweighted top $h$ control also supplies $c^(\( 10 \))$,
    but no strong weighted estimate for this jet is used. The mixed recovery below differentiates the $h$ equation
    at most eight times and the differentiated $u$ equation at most six times;
    its parameter placements require at most $c^(\( 9 \))$. Derivatives of $p$ use the fixed smooth filter and
    startup bounds. On compact sets $B - G_p$ and true derivatives minus affine-position frozen derivatives are
    bounded strong acceleration memories, with no position growth. Put
  #[#set math.equation(numbering: n => "(5.23)")
   $ xi = macron(g) - G_p \, wide k_h = h_(upright("co")) - xi \, wide X_0 = B + xi . $ <co2:recentered-fields>]
  The reference increment $xi = O \( c \)$ has fixed smooth spatial orders.
    By Proposition 12, $k_h$ and $g_(upright("co")) - macron(g)$ have integrable low norms of size
    $C_(upright("fix")) sans(N)$, apart from initial terms. Indeed $A_S >
    1$ and Cauchy–Schwarz turn their weighted $L^2$ mixed order-eight bounds into $L_t^1$ bounds.
    These control spatial Lipschitz norms and the first true time derivative of low principal differences.
    Likewise $\| a \| + \| dot(c) \|$ and the true-minus-frozen reference derivatives are integrable.
    High placements are controlled by their ordinary field and coefficient budgets,
    not by an asserted integrable high norm. On larger bounded annuli the full physical-nontrapping and far
    overlap controls suffice with $R$-dependent constants in products, including the strong comparison of $u$ and $psi$.
  ===== 5.5.2 The nonlinear source ledger. <the-nonlinear-source-ledger.>
  For $U = h_(upright("co"))$, subtract the reduced expression at $g = B$, namely $f_B$.
    Treat target, gauge additions and compensator as fixed coefficients and inputs,
    also within kernel applications. Taylor-expand both $X_0 + k_h$ and $X_0 - xi$ at the #emph[same] $X_0$.
    For the reduced differential and kernel expression $cal(D)_(upright("red"))$ the field-dependent part is
  #[#set math.equation(numbering: n => "(5.24)")
   $ cal(D)'_(upright("red")) \( X_0 \) h_(upright("co")) + "Rem"_(X_0) \( k_h \) -
     "Rem"_(X_0) \( - xi \) . $ <co2:taylor-recentering>]
  Each remainder is at least quadratic in its displayed increment and jets,
    with smooth coefficient multiplicities. This common expansion point avoids an unabsorbed high first jet
    multiplied only by a single low slowly decaying $xi$. By stationary tangency,
    the low residual gauge of $X_0$ at freezing is $O \( c^2 \)$;
    away from freezing it also has integrable acceleration memories and parameter derivatives,
    including the compensator. The linear term in (5.24) is $upright(bold(L))_(p \, c)$,
    up to the differential principal change and smooth integrable lower coefficient errors.
    In particular the omitted derivative of the wave-gauge operator acting on the gauge of $X_0$ is of this class,
    since $H_C$ solves the stationary linear gauge equation.
  The smooth $- xi$ remainder is quadratic. In the other remainder count the changed leading coefficient on
    $partial^2 k_h$ in $d_M partial^2 h_(upright("co"))$; its leftover action on $partial^2
    xi$ needs at most order-zero $h$ factors. Remaining ordinary products have at most one derivative on each
    $k_h$ factor, or a high undifferentiated field times fixed smooth reference derivatives.
    A low $k_h$ factor through order two, with a fixed Sobolev buffer, is integrable.
    Thus high first derivatives fit $L_(A_i)^1 H^(s - 1)$ using endpoints,
    and high undifferentiated factors fit the half-loss bulk-source space.
    Smooth quadratic $xi$ products use $2 A_H > A$.
  For $U = u$, differentiate the full $h$ equation. Its field derivative is at $g$,
    with the principal difference as in (5.21). Lower coefficient differences, including the residual-gauge terms,
    remain integrable at low order. A high order-two $h$ jet multiplied by $u$ or a differentiated coefficient
    drift uses unweighted $H^7.5$ bulk from the top mixed budget and a strong low endpoint.
    A high first derivative of $u$ uses an integrable low difference.
    A high differentiated $h$ factor and a low differentiated $u$ factor multiply their unweighted and strong
    $L_t^2$ budgets into $L_(A_i)^1 H^(s - 1)$. Derivatives of $B \, E_(upright(g)) \, C \,
    Theta$ relative to the zero-field expression contain strong coefficient factors.
    The spatial tame product estimates in dimension three therefore give the claimed source orders.
    The following representative borderline placements record the distinct uses of endpoints and bulk norms.
    Each low factor uses the fixed spatial multiplication buffer in its compact budget;
    integrable coefficient differences use the sliced bound. Here $K_(- 1)$ denotes a kernel of spatial order $-
    1$, and $d_1$ an undifferentiated coefficient difference.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Placement
], table.cell(rowspan: 1, colspan: 1)[Factors used
], table.cell(rowspan: 1, colspan: 1)[Source space
]),
  table.cell(rowspan: 1, colspan: 1)[High first derivative of $k_h$ times a low derivative, at the $h$ levels
], table.cell(rowspan: 1, colspan: 1)[Weighted endpoint $H^(s - 1)$ times a low $L_t^1$ factor
], table.cell(rowspan: 1, colspan: 1)[$L_(A_i)^1 H^(s - 1)$
],
  table.cell(rowspan: 1, colspan: 1)[$u thin partial^2 h$ at $s = 8$
], table.cell(rowspan: 1, colspan: 1)[Unweighted $H^7.5$ bulk for $partial^2 h$ times a strong low endpoint
], table.cell(rowspan: 1, colspan: 1)[$L_A^2 H^7.5$
],
  table.cell(rowspan: 1, colspan: 1)[$K_(- 1) \( d_1 partial^2 u \)$ at $s = 8$
], table.cell(rowspan: 1, colspan: 1)[Input in $L_A^1 H^6$:
  low integrable $d_1$ times a weighted endpoint, or unweighted high bulk $d_1$ times strong low bulk
], table.cell(rowspan: 1, colspan: 1)[$L_A^1 H^7$ after the spatial gain
],
)
]
  Opposite high/low placements and smooth coefficient multiplicities obey the same tame product estimates.
  The nonlocal terms use the spatial gain in the last row. The added operators have spatial orders zero and $- 1$;
    a time hit carries order $- 1$. They occur in compositions of at most two first-order gauge factors with
    smooth wave coefficients. Any changed coefficient on a remaining order-two field term beyond the differential
    principal change therefore has a spatial gain. For example, an order-$- 1$ kernel on $d_1 partial^2 u$,
    where $d_1$ is an undifferentiated coefficient difference,
    uses either integrable low $d_1$ and the weighted endpoint $H^(s - 2)$ norm of $partial^2 u$,
    or unweighted bulk $H^(s - 2)$ for $d_1$ and strong low bulk for $partial^2 u$.
    The output is $L_(A_i)^1 H^(s - 1)$. For $h$ split $k_h +
    xi$ and use half-loss bulk for a high coefficient multiplying a slowly varying spatially smooth factor.
    The same argument applies when the negative-order kernel precedes multiplication,
    using a fixed low Sobolev buffer, or appears on both gauge factors.
    Hits on kernel parameters use the weighted parameter derivatives already counted.
    Finally, after its linear part is removed, $f_B$ and $partial_t f_B$ contain a strong acceleration factor,
    jet or memory on $r_y lt.eq 4 R$, by exact affine-position freezing. This proves (5.22).
  ===== 5.5.3 The separate linear source. <the-separate-linear-source.>
  It must not be treated as a nonlinear error. On prior fixed sets its required $L_(A_i)^2$ spatial orders are
    bounded by $C sans(l) + C_(upright("fix")) e_(upright("in"))$ through filtered feedback, from $ell h \,
    ell h \, ell u$ respectively. Enough fixed filter gain also gives the required endpoint orders.
    The differential exterior estimate uses
  #[#set math.equation(numbering: n => "(5.25)")
   $
     (integral^(O \( R \)) tilde(r)^(1 + delta) parallel tilde(r) thin partial^(lt.eq s - 1) Q \( partial_t \) b_i
     parallel_(L_(A_i)^2 L_omega^2)^2 thin d tilde(r))^(1 \/ 2) lt.tilde C R^(delta \/ 2) sans(l) +
     C_(upright("fix")) e_(upright("in")) . $ <co2:outer-linear-source>]
  Explicitly, $Q$ and its required derivatives cost $r_y^(- 2)$ times bounded averaging of filtered jets.
    Taking $T_0 gt.double R$ makes the plateau weights comparable across those memories;
    slowly varying affine measures are uniformly comparable as well.
  ===== 5.5.4 Absorption of the principal difference. <absorption-of-the-principal-difference.>
  Use the actual wave metric in the differential currents. On fixed compact sets the principal commutator
    differences obey the tame split
  #[#set math.equation(numbering: n => "(5.26)")
   $ C parallel nabla_y d_M parallel_oo parallel partial^2 U parallel_(H^(s - 2)) +
     C parallel d_M parallel_(H^(s - 1)) parallel partial^2 U parallel_(upright("low")) . $ <co2:principal-commutator>]
  The first term is integrable low times endpoint. For a high coefficient with $h$, split $k_h + xi$ as above,
    allowing the extra half order on the smooth $partial^2 xi$ placement; with $u$,
    multiply unweighted and strong bulk norms. Derivatives of the principal-current coefficients cost current
    order times integrable low. On larger bounded annuli use full mixed bulk at $R$-dependent constants.
    The strict inner outflow remains exiting, including when a cutoff differential current by itself has no sign
    in the interior.
  On buffered compact kernel supports, the solved first-jet evolution is the complete frozen evolution plus $i
    T_(Delta P) cal(Y)$, modulo the source classes already listed.
    Here $T_(Delta P)$ is the spatial paradifferential order-one change of the differential principal symbol.
    To see this, first normalize actual and frozen equations by their differential time coefficients.
    Their inverse difference times stationary lower terms belongs to the same source classes;
    the extra stationary acceleration term has spatial gain. Inverting its normalized $I +
    P_(- 1)$ contributes only an order-$- 1$ correction on the differential principal difference.
    The non-paralow remainders cost high coefficient $H^(s - 1)$ times low $partial^(lt.eq 2) U$,
    with the smooth $xi$ placement permitted at order $s - 1 \/ 2$. These are the preceding product estimates.
    Stationary cutoff errors stay within the stationary calculation, so no nonlocal side condition is introduced.
  Conjugate the first jets by $chevron.l D_y chevron.r^(s - 1)$ on these supports and put $z =
    chevron.l D_y chevron.r^(s - 1) cal(Y)$. Write the actual differential evolution symbol as
  $ p_d = S_d "diag" \( lambda_(+) upright("Id") \, lambda_(-) upright("Id") \) S_d^(- 1) \, $
  where $S_d$ depends algebraically and smoothly on the wave coefficients.
    Let $e_plus.minus$ be the stationary diagonal principal forms for the compact addition to the base
    differential currents; they need not be positive separately.
    Correct this addition at spatial paradifferential principal order by
  #[#set math.equation(numbering: n => "(5.27)")
   $ A_d = S_d^(- *) "diag" \( e_(+) \, e_(-) \) S_d^(- 1) . $ <co2:algebraic-pullback>]
  Keep the lower stationary prescriptions. Since the roots are real scalar roots, the algebraic identity
  #[#set math.equation(numbering: n => "(5.28)")
   $ A_d p_d = p_d^(*) A_d $ <co2:principal-symmetrization>]
  cancels the order-one part of $i \( A_d P_d - P_d^(*) A_d \)$ exactly.
    The differential wave currents separately symmetrize their actual and frozen symbols,
    so the same cancellation holds for the total corrected energy.
  After this exact cancellation, only one-order symbolic accuracy is needed.
    For the symbolic calculus, see Bony #cite(label("Bony1981")) §3, Theorems 3.2–3.3;
    a quantitative formulation of the one-spatial-Lipschitz-derivative composition and adjoint bounds is
    #cite(label("AlazardBurqZuily2014")) Definition 2.1 and Theorem 2.6(ii)–(iii), $rho = 1$.
    The first-order spatial Bony composition and adjoint estimates #cite(label("Metivier2003"))
    Theorems 2.4.11–2.4.12 leave an order-zero difference from the stationary derivative.
    After the source pairings already estimated, its quadratic form is bounded by
  #[#set math.equation(numbering: n => "(5.29)")
   $ C_s #scale(x: 120%, y: 120%)[\(] parallel d_M parallel_(W^(1 \, oo)) +
     parallel partial_t d_M parallel_oo + \| a \| + \| dot(c) \| #scale(x: 120%, y: 120%)[\)] parallel z
     parallel_(L^2)^2 . $ <co2:integrable-energy-error>]
  The fixed low regularity buffer from mixed $H^8$ control supplies the spatial coefficient and
    smoothing-remainder bounds in these rules. Normalized frequency derivatives use finitely many smooth angular
    symbol seminorms, with the same low coefficient bounds; their number does not grow with the energy order.
    The algebraic pullback has one true time derivative, acting on parameter values and low variation.
    Stationary subprincipal terms and compact kernel-cutoff interactions with the paradifferential change have at
    most current order. The coefficients of $b_C$ have already been fixed.
    Smallness preserves endpoint positivity, and integration of (5.29) against $tau^(A_i)$ costs
    $C_(upright("fix")) sans(N)^3$ in squared estimates, up to input.
  Thus the corrected energy retains the frozen dissipation,
    including the $B_(upright("nt"))$ first-jet term in (5.10), with only an integrable endpoint error.
    It requires neither a trapping sign for the actual metric nor full directional estimates on higher mixed time
    jets. The scalar cutoff has not been commuted through the changing order-two wave equation,
    and every compact kernel remains inside its buffered support, away from the outflow trace. ◻
]

=== 5.6 The integrated compact estimate <the-integrated-compact-estimate>

#thm([Proposition 14.])[
  (Compact high estimate).  #emph[Under the simultaneous finite-slab budgets, for some $kappa > 0$,
#[#set math.equation(numbering: n => "(5.30)")
 $ sans(K)_R lt.eq C R^(- kappa) \( sans(F) + sans(K)_R \) +
   C_(upright("fix")) #scale(x: 120%, y: 120%)[\(] e_(upright("in")) +
   sans(N)^(3 \/ 2) + \( e_(upright("in")) sans(N) \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <co2:high-bound>]

 The acceleration and sliced static bounds enter this estimate only as coefficient smallness and nonlinear errors,
   not as additional linear forcing terms. The choices are the stationary energy parameters,
   then a sufficiently large $R$, then the plateau $T_0$, and finally the bootstrap and data smallness.]
] <co2:compact-high>

#proof[
  Apply Proposition 13 to the frozen energies at the three levels (5.1).
    Put a nonincreasing cutoff, with derivative $O \( R^(- 1) \)$, on the outer differential current.
    Its unfavorable squared flux is bounded, up to finite-time costs, by
  #[#set math.equation(numbering: n => "(5.31)")
   $ C sum_(\| mu \| lt.eq s - 1) parallel tau^(A_i \/ 2) \( 1 \, Omega \, r X \) partial_y^mu U
     parallel_(L^2 \( d t thin d r thin d omega \/ r \; thin upright("shell") \))^2 . $ <co2:high-shell-flux>]
  On a pure outgoing flat covector the flux exits strictly because $f_oo < 1$.
    After the matching currents are fixed, the affine, cutoff normal and cone changes are small for large $R$ and
    a small bootstrap. Finite-dimensional definiteness therefore bounds every unfavorable component by the good
    derivatives of $chi_mu$; differentiating its radius factor accounts for the order-zero term in (5.31).
  The square root of (5.31) is at most
  #[#set math.equation(numbering: n => "(5.32)")
   $ C R^(- kappa_b) sans(F) + C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) \, wide
     0 < kappa_b < min_i { \( p_i - A_i \) \/ 2 \, 0.98 #scale(x: 120%, y: 120%)[}] . $ <co2:high-shell-bound>]
  Indeed
  $ partial_(z_d) = - n_d T_l + r^(- 1) \( n_d r X + Omega_d \) $
  expands a spatial derivative string into $r^(- b) c \( n \) Z^I T_l^j$,
    with $j + \| I \| lt.eq \| mu \|$ and $b gt.eq \| I \|$ at the flat level.
    Order the lab time derivatives before $Z$ derivatives. Perturbed emitter and co-frame coefficients add only
    small coefficient products controlled by the fixed-annulus overlap norms.
    The $I = 0$ terms use the good-weight gain in (5.5); every $I eq.not 0$ term has an inverse radius,
    and the bad weights $gt.tilde t^(A_i) r^(- 0.04)$ then suffice.
    At the strong level the difference between $u$ and the transformed $psi$ contains strong bounded memories such
    as $v \( t \) - v_s \, a$, and at most nine derivatives of $h_(upright("lab"))$.
    At the $h$ levels any time derivative of the component change carries strong acceleration and lower fields.
    Thus full good and bad first-jet far controls through $j + \| I \| lt.eq s - 1$ suffice.
    The earlier fixed interval, allowed to depend on $R \, T_0$, costs input by finite-order Cauchy stability.
  All fixed compact lower derivative errors have total spatial or first-time order at most $s - 1$,
    strictly below the half-loss bulk. At matched time weights interpolate them by
  #[#set math.equation(numbering: n => "(5.33)")
   $ R^(- iota_0) sans(K)_R + C R^(K iota_0) sans(l) \, wide K iota_0 < kappa_0 \/ 2 \, $ <co2:lower-interpolation>]
  where $K$ is a sufficiently large fixed interpolation constant and $kappa_0$ is from Proposition 10.
    Very-low-order coercivity supplements fit the same estimate.
    After substituting (5.7), the data and quadratic pieces have only $C_(upright("fix"))$ costs.
    The linear forcing pairing from (5.25) is at most
  $ C R^(delta \/ 2) sans(l) thin sans(K)_R + C_(upright("fix")) e_(upright("in")) sans(N) . $
  Choose $0 < delta < kappa_0$ sufficiently small. The low-transfer exponent is already fixed before these
    enlarged compact reaches: their constants and the outer current’s slack power do not worsen its test loss or
    far-weight gain.
  Differentiating the time weight uses the unweighted top bulk for the extra half derivative.
    On a fixed compact set, for example,
  #[#set math.equation(numbering: n => "(5.34)")
   $ tau^(A_i - 1) parallel U parallel_(H^s)^2 lt.tilde tau^(A_i \/ 2 - 1) #scale(x: 120%, y: 120%)[\(]
     tau^(A_i \/ 2) parallel U parallel_(H^(s - 1 \/ 2)) #scale(x: 120%, y: 120%)[\)] parallel U
     parallel_(H^(s + 1 \/ 2)) . $ <co2:plateau-interpolation>]
  The analogous first-time-jet estimate shifts the spatial order by one.
    For the strong level it uses $u_t = partial_t^2 h$ in unweighted $H^7.5$ bulk.
    On farther bounded annuli the permitted radius-dependent constants and mixed top orders suffice.
    Since $A_H \, A < 2$, taking $T_0$ large after $R$ makes these coefficients as small as required.
    Integration up to arbitrary endpoints, using (5.32), (5.33) and the cubic comparison errors,
    proves (5.30) first for spatial and first-time jets, with the full mixed budget still on its right.
  It remains to recover that mixed budget. Successively solve the equations with the stationary normal coefficient
    inverse, including its order-$- 1$ addition, after $j$ time derivatives, for $0 lt.eq j lt.eq s - 2$.
    Lower time jets in the stationary homogeneous part have already been bounded;
    parameter derivatives on coefficients are products or input.
    A nonlinear term, including a principal difference on the current time jet, needs only bulk order
  $ r' = s - j - 2 - theta \, wide theta = 1 \/ 2 upright(" globally") \, quad theta =
    0 upright(" in a full-order region") \, $
  and endpoint order $s - j - 2$. Its norm is $C_(upright("fix")) sans(N)^2$ by the bootstrapped mixed estimates.
    Explicitly, if $k$ time derivatives hit an undifferentiated field coefficient on an order-two jet,
    put that coefficient in endpoint $H^(s - k)$ and the other factor in bulk $H^(r' + k)$.
    The product estimates have the margins
  $ r' gt.eq - 1 \/ 2 \, wide s - k gt.eq r' + 2 \, wide \( s - k \) + \( r' + k \) - r' = s . $
  Two first-order placements and further smooth coefficient factors have the same margin.
    Place the matched time weight on one factor and use two endpoints for endpoint output.
    Products containing $u$ use unweighted top $h$ and strong $u$;
    drifts involving $h$ alone carry strong differentiated parameters.
    Kernels preserve or improve spatial order and have at most two time derivatives before this mixed
    differentiation. The preceding parameter counts cover all cases.
    The linear source is still filtered low measurement with fixed compact costs.
  For full mixed bulk outside physical trapping, use nested smooth spatial cutoffs with margins.
    Place the cutoff on the bulk factor in products; commuting it through stationary kernels gains a full spatial
    order, more than the global half-order loss. No full $B_(upright("nt"))$-cut estimate for $j gt.eq
    2$ is needed inside the remaining physical neighborhood. Additional mixed norms on larger annuli follow at
    $R$-dependent cost and are included with the small normalizations specified at the start;
    they occur elsewhere only in products or plateau choices.
    Thus the left side becomes the full $sans(K)_R$, proving (5.30). ◻
]

=== 5.7 Higher orders after base closure <higher-orders-after-base-closure>

The next statement is used only after the compact and far estimates have been closed at the fixed base orders in
  the next section. It is important that it impose no smallness on higher data seminorms.

#thm([Proposition 15.])[
  (Subexponential smooth bounds).  #emph[Assume the global base bounds resulting from the compact-far closure.
    For every fixed $C_0 > 0$, every fixed smooth order, and every $sigma > 0$, all metric,
    coefficient and parameter norms at that order on
$ 0 lt.eq t lt.eq T' \, wide r_y lt.eq C_0 \( 1 + T' \) $

 are bounded by $C_sigma e^(sigma T')$. The constant may depend on the smooth datum, the order and $C_0$,
   but the base neighborhood and fixed filter do not. We denote these bounds by $e^(o \( T' \))$.]
] <co2:higher>

#proof[
  We use induction in derivative order, with the conic energy and its parameter counts explicit.
    The closed base estimates imply, uniformly on the slice in the low unscaled supremum norms needed below,
    through at least two field derivatives,
  #[#set math.equation(numbering: n => "(5.35)")
   $ h = o \( 1 \) \, wide g_(upright("co")) - macron(g) = o \( 1 \) \, wide c \, dot(c) \, a = o \( 1 \) \, wide
     t arrow.r oo . $ <co2:low-decay>]
  On fixed compact sets use weighted endpoints; at large radius use the far point estimates,
    including (10.8) and (10.9), with their spare rotations. They give uniform decay of low unscaled lab
    derivatives as $r arrow.r oo$, while the co transformation adds bounded velocities and differentiated
    parameters. Fixed annuli have decay in $t$. Also $B - G_p = o \( 1 \)$:
    compactly this is a bounded memory, and near infinity both leading co asymptotes are exactly the affine flat
    metric $eta_(v \( t \))$, with symbol-decaying differences and bounded differentiated frame changes.
    True low reference derivatives minus their formal frozen counterparts are $o \( 1 \)$.
    The affine changes and symbol remainders in $macron(g) - G_p$ use $c = o \( 1 \)$.
    No convergence of the coordinates is required, although $p$ does converge because $a in L^1$.
  Fix a terminal time $T'$ and work on shrinking cylinders with outer radius
  #[#set math.equation(numbering: n => "(5.36)")
   $ C_0 \( 1 + T' \) + C_1 \( T' - t \) \, $ <co2:higher-cylinder>]
  where $C_1$ is large enough for strict exit and all compact kernels have a buffer inside.
    Induct on total order, using a larger such cylinder for the previous order if needed.
    Orders through seven start the induction: bulk bounds through order eight convert to unscaled $L^2$ bounds
    with at most polynomial losses in $T'$ from the measures and radial weights on these growing balls.
    Conversion of derivatives uses lab time, $r^(- 1) Z$, bounded velocities and the available filtered
    acceleration jets. Enlarged spatial regions and backward unit slabs give order-seven endpoints;
    startup uses fixed finite-time bounds. The spare rotations in the far point estimates ensure the uniform low
    decay used in (5.35).
  At each $s gt.eq 8$, Proposition 11 is available near the limiting stationary parameters.
    Exact compatible saturation at trapping is independent of $s$, and the horizon inequality becomes stronger.
    For this one order, start at a sufficiently late time that the actual-principal correction preserves
    positivity; the preceding fixed interval has smooth symbol-tail estimates by finite-time propagation.
    Continue the differential current to the exiting boundary (5.36), with no matching-shell loss.
    Its top-order energy equivalence constants are independent of the terminal radius, since
  #[#set math.equation(numbering: n => "(5.37)")
   $ parallel tilde(r) G parallel_(L^2 \( d tilde(r) thin d omega \))^2 = \| det A_(upright("aff")) \| parallel G
     parallel_(L^2 \( d^3 y \))^2 \, $ <co2:affine-density>]
  and $f_oo < 1$ is now fixed. Lower terms from differentiating $chi_mu$ use the preceding induction.
    The parameter derivatives of $tilde(r)$ relative to $tilde(r)$, of the affine angles,
    and of the density ratio are uniformly bounded, so differentiating current coefficients incurs no
    terminal-radius factor. The frozen derivative is favorable modulo the fixed compact lower order already estimated.
  In the principal comparison use $o \( 1 \)$ instead of integrability for the low top coefficients.
    Products of finitely many lower-order norms and polynomial losses are $e^(o \( T' \))$.
    The parameter and pure target jets in spatial source order $s - 1$ have this property.
    The smoothing, implicit position map and compensator may require acceleration jets through $a^(\( s + 3 \))$,
    accounting for spatial derivatives of shifts and the two-order wave expression.
    The filter has worst differential order $1 - P$; hence these jets require at most
  #[#set math.equation(numbering: n => "(5.38)")
   $ max \( 0 \, s + 4 - P \) lt.eq s - 1 $ <co2:filter-count>]
  derivatives of $ell h$ once the #emph[single fixed] $P gt.eq 5$ is chosen.
    The larger fixed $P$ needed by the base resolvent tests only improves this count.
    Smooth probes, position integrations, exponential or bounded/reach memories cost lower products and
    polynomials. The original spatial equation uses only low $c$ jets in its kernel families.
  Solving for $partial_t^2 h$ in $H^(s - 2)$ in a commutator gives $C_s sqrt(cal(E)_s) + e^(o \( T' \))$,
    where $cal(E)_s$ is the positive first-jet energy. Besides the differential pointwise solve, the order-$-
    1$ addition uses only its preceding induction order and coefficient products.
    For example $K_(- 1) partial_t^2 h$ needs $H^(s - 3)$ on that jet and coefficient algebra orders at most $s -
    2$. Consequently, after exact absorption of the differential principal part,
    the source difference at $H^(s - 1)$ costs
  $ o \( 1 \) sqrt(cal(E)_s) + e^(o \( T' \)) . $
  Placements at orders already covered by induction give the additive term.
    Top first derivatives multiply low vanishing differences.
    Top second derivatives in coefficient commutators or lower acceleration terms have the one-order spatial gain
    and an $o \( 1 \)$ Lipschitz or coefficient difference. Interior paraproduct pullbacks and differential
    currents also use only low differences in front of top squared energy.
    The outer products are estimated in uniformly local unscaled coordinate patches of bounded overlap,
    and the affine source factor changes density as in (5.37).
    Every top placement thus has a coefficient bounded, or vanishing, independently of the terminal radius;
    high coefficients of order at most $s - 1$ multiply low arguments and belong to the additive induction bound.
    If an interior kernel or paraproduct acts on a low placement,
    the base estimates supply a fixed compact Sobolev or Hölder buffer.
    No polynomial in $T'$ multiplies the top incremental coefficient.
  It follows that $X_s = \( 1 + cal(E)_s \)^(1 \/ 2)$ satisfies on the late interval
  #[#set math.equation(numbering: n => "(5.39)")
   $ dot(X)_s lt.eq alpha_s \( t \) X_s + B_(s - 1) \( T' \) \, wide B_(s - 1) \( T' \) = e^(o \( T' \)) \,\
alpha_s \( t \) arrow.r 0 quad upright("independently of the terminal radius") . $ <co2:higher-gronwall>]
  For any prescribed $sigma > 0$, make $alpha_s lt.eq sigma \/ 3$ by a later fixed starting time,
    use the induction with a rate smaller than $sigma \/ 3$ on $B_(s - 1)$,
    and absorb the polynomial integration factor. Gronwall gives $X_s lt.eq C_sigma e^(sigma T')$.
    This proves the spatial and first-time orders.
  Recover the higher time jets successively. The normalized actual $I +
    K_(- 1)$ is uniformly invertible on spatial $L^2$ by low-order smallness.
    At $H^(s - j)$ for $partial_t^j h$, $2 lt.eq j lt.eq s$, iterate its tame negative-order gain;
    coefficient derivatives through at most
  $ max \( s - j + 1 \, 4 \) lt.eq s - 1 $
  and fixed symbol seminorms suffice. These have the induction bound.
    The right side uses $c^(\( j - 1 \))$ or lower, already recovered in earlier time counts,
    while $p$ derivatives have the filter buffer (5.38). Full mixed endpoints are therefore subexponential without
    smallness of any high Sobolev norm of the gauge or datum.
    Sobolev embedding on enlarged regions and finite products give the stated smooth bounds.
    Every estimate was on a common finite slab; no limiting inner horizon has entered the argument. ◻
]

The remaining task in the exterior analysis is to prove the far estimate and close its coupling with (5.16) and
  (5.30). The higher-order proposition will then apply to the resulting solution in the same single base neighborhood.

== 6 The far region and simultaneous closure <sec:far>

The compact estimates leave two quantities to control: radiation at large radius and the acceleration of the
  modulated Kerr parameters. We now prove the far estimate with a radius-small coefficient on both quantities,
  and then close it simultaneously with the compact and sliced estimates.
  The far equation has no conic pseudodifferential modification.
  We first verify its target symbols, differentiated weak-null structure, and initial and overlap bounds.
  The energy and product estimates in Appendices 10 and 11 then apply to this equation.
  Their role is to turn the structural bounds into a radius-small far estimate;
  the final subsection here closes its coupling to the compact region.

Throughout we work on an arbitrary smooth finite bootstrap slab.
  All constants are independent of its terminal time. The compact norm $sans(K)_R$,
  the acceleration norm $sans(S)_a = parallel a parallel_(L_A^2)$, the total bootstrap size $sans(N)$,
  and the base input size $e_(upright("in"))$ have the meanings fixed in the compact argument.
  Here $a$ in $sans(S)_a$ denotes the modulation acceleration, not the fixed Kerr rotation parameter.
  A constant $C_(upright("fix"))$ may depend on every scale chosen before the final data smallness,
  but not on the lifespan.

=== 6.1 Emitter coordinates and the three far norms <emitter-coordinates-and-the-three-far-norms>

Let $eta$ denote the Minkowski metric in the lab coordinates $\( t \, z \)$. Write

$ C_e \( q \) = - lambda \( q \) \, wide s_e = C'_e \, wide s_s = - v_s \( t \, x \) \,\
t = q + r \, wide z = C_e \( q \) + r n \, wide \| n \| = 1 \, $

and set $k = 1 - s_e dot.op n$. In this section $r$ is emitter radius;
  the small speed bound makes $k$ uniformly close to one and makes $r$, $\| x \|$,
  and the co-moving radius $\| y \|$ comparable. Put

$ T_l = partial_(t \, upright("lab")) \, wide L = T_l + n dot.op partial_z = partial_(r \| q \, n) \,\
S = r L \, wide Z = \( S \, Omega \) \, wide D = T_l + s_s dot.op partial_z \, $

where $Omega$ denotes the emitter sphere rotations. All tensor components in this section are lab components,
  and we abbreviate

$ h = h_(upright("lab")) \, wide psi = D h \, wide H^(i j) = g^(i j) - eta^(i j) . $

The covector $ell_n = \( 1 \, - n \)$ is used only for null contractions.
  Thus $H_(ell_n ell_n) = H^(i j) ell_(n \, i) ell_(n \, j)$.
  Let $Pi \( n \)$ be the projection of a covariant symmetric tensor onto its tracefree spatial screen part
  orthogonal to $n$.

The elementary derivative conversion is

#[#set math.equation(numbering: n => "(6.1)")
 $ partial_i = ell_(n \, i) T_l + r^(- 1) b_i Z = ell_(n \, i) k^(- 1) partial_q +
   r^(- 1) \( b_i - ell_(n \, i) k^(- 1) s_e^d b_d \) Z . $ <far:derivative-conversion>]

Here $b_t = 0$, while $b_d Z$ is $n_d S$ plus the corresponding tangential rotation combination.
  We always commute lab time derivatives before the $Z$ derivatives.
  Choose the starting radius $R_0$ beyond all fixed transitions and all compact kernels.
  The fixed-factor starting overlap is then physically nontrapping.
  We require, in addition, that radii as small as $c R_0^0.45$ lie in the lab differential and symbol regime;
  these smaller radii occur only in the spacelike-anchor argument below.

We use the three levels

#[#set math.equation(numbering: n => "(6.2)")
 $ i & 0 & H & P\
U_i & h & h & psi\
N_i & 9 & 8 & 7\
A_i & 0 & A_H = 1 - eta_(*) & A = 1.36\
p_i & 0.64 & 1 - eta_(*) \/ 6 & 1.62 $ <far:levels>]

with a fixed $0 < eta_(*) lt.eq 10^(- 8)$. For the far weights define

$ delta_f = eta_(*) \/ 100 \, wide nu = 10 delta_f \, wide e = 0.1 delta_f \, wide d_(*) = 200 eta_(*) . $

These quantities are distinct from the slack in the compact differential-current construction.
  With $chevron.l s chevron.r = \( 1 + s^2 \)^(1 \/ 2)$, put

#[#set math.equation(numbering: n => "(6.3)")
 $ tau_f = 1 + t \/ r \, wide mu = chevron.l q \/ r^(delta_f) chevron.r \, wide l_f = chevron.l q \/ r^nu chevron.r \,\
m_f = \( r^(- 1) + l_f^(- 1) \)^(- 1) \, wide W_i = r^(p_i - A_i) \( t + 10 r \)^(A_i) \,\
w_(H \, j) = w_H = r^(- e) mu^(A_H) \, wide w_(P \, j) = w_H l_f^(A - A_H) m_f^(- \( 7 - j \) d_(*)) \,\
w_(0 \, j) = r^(- 0.02) m_(-)^(j d_(*)) m_(+)^(- \( 9 - j \) d_(*)) . $ <far:weights>]

Here $m_(-)$ is a smooth monotone function of $- q \/ r^nu$, comparable to $1 + \( - q \/ r^nu \)_(+)$,
  constant when its argument is nonpositive, and with bounded logarithmic-symbol derivatives.
  The weight $m_(+)$ is the positive-$q$ analogue capped at $r$ by harmonic addition.

For each word $I$ in $Z$ and each $j$ with $\| I \| + j lt.eq N_i$, define $chi = Z^I \( r T_l^j U_i \)$.
  Write $G_1 chi = r^(- 1) Z chi$ and let $B_1 chi$ denote its full first derivative.
  The bulk measure will always be $d t thin d r thin d omega \/ r$.
  The preliminary far norm is the sum, over these indices and tensor components, of

#[#set math.equation(numbering: n => "(6.4)")
 $ & parallel W_i^(1 \/ 2) \( G_1 chi \, chi \/ r \) parallel_(upright("bulk")) +
   parallel w_(i \, j)^(1 \/ 2) B_1 chi parallel_(upright("bulk"))\
 & #h(8mm)  + sup_t parallel \( W_i^(1 \/ 2) G_1 chi \, w_(i \, j)^(1 \/ 2) B_1 chi \)
   parallel_(L^2 \( d r thin d omega \)) . $ <far:basic-norm>]

We complete this norm by corrected-current terms in (6.20) below and denote the result by $sans(F)$.
  The weights are those of (10.1). On $t gt.double r$ they satisfy

#[#set math.equation(numbering: n => "(6.5)")
 $ w_(i \, j) gt.tilde chevron.l t chevron.r^(A_i) r^(- 0.03) \, wide
   W_i gt.tilde t^(A_i) r^(p_i - A_i) . $ <far:timelike-weights>]

Differentiating $chi$ supplies the bad-derivative controls used in the sliced argument;
  the extra lower-order terms are controlled by the good entries.
  Thus (6.4) contains those earlier far inputs, with any necessary smaller positive radial slack.

=== 6.2 Verification of the lab equation <verification-of-the-lab-equation>

The target metric is denoted by $B$, its wave compensator by $Theta$, and its pure equation defect by $f_B$.
  Enlarge the positive acceleration majorant at comparable radii when necessary, and write

$ tilde(a) \( t \, r \) = C r^(- 1) integral_(t - C r)^t \| a \( tau \) \| thin d tau . $

The histories are zero before startup. The particular constant $C$ in this notation can be increased finitely many
  times.

#thm([Lemma 19.])[
  (Far symbol and weak-null structure).  #emph[For the arbitrary fixed subextremal Kerr family constructed above,
    the lab target satisfies
#[#set math.equation(numbering: n => "(6.6)")
 $ B - eta = O \( r^(- 1) \) \, wide D B = O \( r^(- 1) tilde(a) \) \, wide partial^d s_s =
   O \( r^(1 - d) tilde(a) \) quad \( d gt.eq 1 \) \,\
Theta = O \( r^(- 1) tilde(a) \) \, wide f_B = O \( r^(- 2) tilde(a) \) \, wide D f_B = O \( r^(- 3) tilde(a) \) \,\
wide r tilde(a) lt.tilde sans(N) tau_f^(- A \/ 2) . $ <far:target-symbols>]

 These are symbol estimates at every fixed order needed here,
   with one inverse power per additional lab derivative. Their constants may depend on the fixed family but not on
   either matching radius. The equation is
#[#set math.equation(numbering: n => "(6.7)")
 $ g^(i j) partial_(i j) h = f_h \,\
f_h =  & f_B + O \( r^(- 2) partial h + r^(- 3) h \) + Q_eta \( partial h \, partial h \)\
 & + O \( \( r^(- 1) + \| h \| \) \| partial h \|^2 \) \, $ <far:wave-structure>]

 up to fixed harmless changes in $f_B$. The first- and zeroth-order background coefficients have a relative
   $O \( tilde(a) \)$ gain under $D$. The flat linear wave-gauge contraction of $h$ is
#[#set math.equation(numbering: n => "(6.8)")
 $ O \( \( r^(- 1) + \| h \| \) partial h \) + O \( r^(- 2) h \) + O \( r^(- 1) tilde(a) \) . $ <far:flat-gauge>]

 The estimates allow smooth composition in the fields and distributed product differentiation.
   The quadratic form $Q_eta$ has the constrained weak-null polarization described below.]
] <far:structure>

#proof[
  The far background in the formal lab coframe has the form $eta + frak(h) \( p_s \( t \, x \) \, x \)$, where,
    at independent family argument,
  $ partial_p^b partial_x^alpha frak(h) = O \( \| x \|^(- 1 - \| alpha \|) \) . $
  This statement includes the coframe change and holds for every member of the chosen fixed Kerr parameter family.
    Implicit differentiation of the smoothed coordinates gives
  $ partial_z x = S_x = \( 1 - partial_x lambda_s \)^(- 1) \, wide T_l x = S_x v_s \, wide S_x - I =
    O \( r tilde(a) \) . $
  The first derivatives of $S_x$ and $v_s$ are $O \( tilde(a) \)$,
    with the corresponding differentiated symbol bounds. In particular $D x = 0$.
    Positive-delay smoothing and its signed moments imply $partial_x lambda_s = O \( r tilde(a) \)$.
    The affine flat leading term cancels exactly in lab components.
    Comparing at a point with an exact constant-parameter Kerr metric whose affine worldline agrees there gives
    the first- and second-jet errors $O \( r^(- 1) tilde(a) \)$ and $O \( r^(- 2) tilde(a) \)$.
    Commuting $D$ past a lab derivative introduces a derivative of $s_s$;
    this proves the differentiated bounds for $B$ and its defect.
  For clarity, the compensator uses the stationary profiles with orders $H_(upright("mode")) \,
    H_(upright("mode"))^1 \, V_i - e_i = O \( r^(- 1) \)$ and $J =
    O \( r^(- 2) \)$ from the stationary construction. We append the subscript here only to distinguish the mode
    profiles from $H^(i j)$. Its local gauge image consists of first-order commutators against the smoothed mass
    and velocity parameters, terms containing $J$ and $partial_x lambda_s$,
    and the gauge derivative of $\( V_i - e_i \)^flat ⊙ d_x lambda_s^i$.
    When only one derivative falls on $lambda_s$ in the last term, a derivative of the profile,
    or a zeroth-order connection coefficient, supplies the extra inverse radius.
    The chain identities cancel the free position and velocity terms.
    Thus neither an unsmoothed acceleration nor a growing free position occurs in a lab symbol coefficient.
    Filtered unsmoothed accelerations and the finitely many low jets needed here are bounded by
    $C_(upright("fix")) sans(N) chevron.l q chevron.r^(- A \/ 2)$ and vanish before startup.
    These observations prove (6.6).
  Constraint propagation gives the exact lab identity
  $ Gamma_mu \( g \) = g_(mu sigma) g^(a b) Gamma \( B \)_(a b)^sigma + Theta_mu \, $
  where $Gamma_mu \( g \)$ is the lowered wave contraction. Expanding this identity gives (6.8).
    Expanding vacuum Ricci in this gauge gives (6.7). The added nonlocal gauge terms vanish in the far region;
    only the differential wave compensator remains. The coefficients of the linear terms use first and second jets
    of $B$, their products, and compensator jets, so their claimed $D$ gain follows from (6.6) and $\[ D \, partial \]$.
  For a symmetric polarization $p$ satisfying
  #[#set math.equation(numbering: n => "(6.9)")
   $ ell_n^alpha #scale(x: 120%, y: 120%)[\(] p_(alpha beta) - 1 /
     2 eta_(alpha beta) "tr"_eta p #scale(x: 120%, y: 120%)[\)] = 0 \, $ <far:polarization-constraint>]
  the flat Christoffel identity of 10.2 says that $Q_eta \( ell_n ⊗ p \, ell_n ⊗ p \)$ is a constant multiple of
    $ell_n ⊗ ell_n \| Pi \( n \) p \|^2$; its polarized version holds as well.
    Indeed the constraint eliminates $p_(L L)$, $p_(L A)$, and the screen trace in a flat null frame.
    The linear map to the four contractions in (6.9) is surjective on $ker Pi$.
    Consequently there is a uniformly smooth projection to the constrained polarizations that leaves $Pi
    p$ fixed and changes $p$ by bounded multiples of those four contractions; this is (10.4).
    Apply the differentiated identity (6.8) to $p = T_l^(j + 1) h$ before taking this projection.
    After multiplying a first jet by $r$, every error contains a good derivative,
    a vanishing coefficient times an ordinary scaled jet, a symbol-suppressed field, or $O \( tilde(a) \)$.
    Distributed lab-time differentiations retain exactly these placements.
    This verifies the differentiable weak-null structure, not just its undifferentiated algebraic identity. ◻
]

#thm([Lemma 20.])[
  (Initial and overlap inputs).  #emph[The initial, current-correction,
    and field overlap costs at the fixed-factor starting annulus in the far energy estimates are bounded by
#[#set math.equation(numbering: n => "(6.10)")
 $ C \( R_0 \) sans(K)_R + C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) . $ <far:overlap-bound>]

 The initial input requires only the base metric $H^10$ and second-form $H^9$ bounds and their order $- 1 \, -
   2$ end-symbol bounds. It imposes no condition on leading tail coefficients and no smallness on higher
   seminorms. Pure acceleration forcing is estimated separately, including on this annulus,
   by the direct averaging estimate (11.14) in Appendix 11.]
] <far:boundary-input>

#proof[
  Initially the lapse and shift have background values and their derivatives are fixed by the gauge.
    At infinity startup has zero parameters and no kernel terms.
    The wave equation supplies mixed jets through order ten, with one inverse radius per derivative.
    The incoming weighted integrals converge because $p_0 \, p_H < 1$ for $chi \( h \)$,
    whereas $psi$ has an additional inverse power. Reduced local propagation gives finiteness of all higher symbol
    orders on bounded time intervals without making their constants small.
  On a fixed-factor overlap at $R_0$, all unscaled mixed lab jets of $U_i$ through order $N_i +
    1$ have full compact bulk and endpoint control, with squared time weight $chevron.l t chevron.r^(A_i)$.
    The component transformation from $h_(upright("co"))$ to $h_(upright("lab"))$ depends pointwise on
    $v \( t \)$. Under this transformation $psi$ equals $u$ plus terms of the forms $\( v \( t \) - v_s \) partial
    h_(upright("co"))$ and $v' h_(upright("co"))$ with smooth bounded component factors.
    Their coefficients carry the strong time weight by the fixed-interval acceleration averages and parameter jet
    bounds. Inverse-coordinate and differentiated-frame costs are bounded on this fixed overlap,
    and $partial^(lt.eq 9) h_(upright("co"))$ has at least the weak weighted bound.
    These terms therefore contribute products, not a radius-growing linear coefficient on $sans(S)_a$.
    The emitter commutations have bounded conversion coefficients there.
    The weights $W_i \, w_(i \, j)$, and the factor $1 + M_f$ defined below cost at most the indicated time
    weights, up to $R_0$-dependent constants; for $1 + M_f$ the cost is bounded.
    This proves (6.10) and verifies the boundary hypotheses of (11.21). ◻
]

=== 6.3 Point bounds and corrected energy currents <point-bounds-and-corrected-energy-currents>

We record the precise point information entering the source estimates.
  It also supplies the timelike point bounds used in the sliced comparison.
  For the following assertions, $N lt.eq C_(upright("fix"))
  sans(N)$ denotes the small factor used in product estimates, not a new independent norm.
  The finite-slab implications of 31, 32, 33, 34, and (10.12) give

#[#set math.equation(numbering: n => "(6.11)")
 $ parallel chi \( h \) parallel_(L_omega^2) & lt.tilde N r^(2 eta_(*)) tau_f^(- A_H \/ 2) &  &
   upright("through order eight") \,\
parallel chi \( h \) parallel_(L_omega^2) & lt.tilde N r^0.52 &  & upright("at order nine") \,\
parallel B_1 chi \( h \) parallel_(L_omega^2) + parallel chi \( psi \) parallel_(L_omega^2) & lt.tilde N
  r^(e \/ 2) mu^(- A_H \/ 2) &  & upright("through order seven") . $ <far:point-h>]

The first-derivative version for $psi$ holds one order lower.
  Two spare rotations give the corresponding sphere supremum bounds.
  Contract lab time jets before applying $Z$ to $H_(ell_n ell_n)$. Through order eight their angular $L^2$ bounds are

#[#set math.equation(numbering: n => "(6.12)")
 $ O \( r^(- 1) + N r^(- 1 + 2 eta_(*)) tau_f^(- A_H \/ 2) \) \, wide
   O \( r^(- 2) + N r^(- 2 + 8 eta_(*)) tau_f^(- A_H \/ 2) \) $ <far:projected-bounds>]

in general and with at least one lab time, respectively. The second bound also holds after $partial_q$ at orders
  through seven. Without a lab time, $r$ times the coefficient is $O \( 1 \)$ through order eight on $\| q \|
  lt.tilde r^0.45$. At order nine it is bounded by

#[#set math.equation(numbering: n => "(6.13)")
 $ O #scale(x: 120%, y: 120%)[\(] log r + b^(1 \/ 2) r^(- p_0 \/ 2) +
   b r^(- 1 + 8 eta_(*)) #scale(x: 120%, y: 120%)[\)] \, wide b = 1 + min \( \| q \| \, r \) \; $ <far:top-projected>]

with a lab time the bound for $r$ times the order-nine coefficient improves to $O \( r^(- 0.46) \)$.
  Finally, the lowest radiative jets satisfy

#[#set math.equation(numbering: n => "(6.14)")
 $ \| r Pi T_l h \| + \| r Pi T_l^2 h \| + \| r Pi T_l psi \| lt.tilde N . $ <far:news>]

There is a radius-uniform point in applying these implications.
  The negative-$q$ spacelike anchor is proved on an auxiliary exterior

#[#set math.equation(numbering: n => "(6.15)")
 $ \| z \| gt.eq t + c Q + C_1 integral_0^t \( \( u + Q \) Q \)^(- 1 \/ 2) thin d u \,\
0 lt.eq t lt.tilde R_f \, wide Q gt.tilde R_f^0.45 . $ <far:anchor-domain>]

Here $R_f$ is a dyadic radius. This domain has $q < 0$; zero startup histories give $lambda \( q \) =
  0$ and hence $r = \| z \|$. Its lower boundary may lie below $R_0$,
  but our choice of $R_0$ places all of it in the differential lab end.
  Hence the same equation and initial symbol bounds apply there.
  Regard the histories as fixed in this domain estimate. The pure source after up to nine Minkowski commutations
  costs $O \( sans(S)_a \| z \|^(- 3) \)$ by the same acceleration majorant.
  Thus the moving-boundary energy bootstrap of 31 uses no radius-dependent replacement by $sans(K)_R$.
  Constants acting linearly on far quantities remain bounded independently of $R_0$;
  nonlinear smallness can be imposed after the radii are fixed.
  The news estimate (6.14) follows from the emitter equations on $r T_l^j h$, $j = 0 \, 1$:
  projection kills the leading quadratic by Lemma 19. No point smallness in a deep compact region is used,
  except on the prescribed overlaps.

To describe the currents, set

$ P_g chi = k r g^(i j) partial_(i j) \( chi \/ r \) \, wide P \[ J \] chi =
  k r J^(i j) partial_(i j) \( chi \/ r \) . $

The exact flat emitter operator and the principal perturbation identity are

#[#set math.equation(numbering: n => "(6.16)")
 $ P_eta =  & - 2 partial_q partial_r +
   r^(- 2) #scale(x: 120%, y: 120%)[\[] \( 1 + s_e dot.op n \) \( S^2 - S \) - 2 \( s_e dot.op n \) \( S - 1 \)\
 & #h(40mm)  + 2 s_e^A nabla_A \( S - 1 \) + k Delta_(bb(S)^2) #scale(x: 120%, y: 120%)[\]] \,\
P \[ J \] chi =  & J_(ell_n ell_n) partial_q \( k^(- 1) partial_q chi \) +
  O #scale(x: 120%, y: 120%)[\(] \( J \/ r \) \( 1 \, Z \) partial_q chi + \( J \/ r^2 \) \( 1 \, Z \, Z^2 \) chi\
 & #h(42mm)  + \( a \( q \) \/ r \) J_(ell_n ell_n) \( 1 \, Z \) chi #scale(x: 120%, y: 120%)[\)] .
   $ <far:flat-operator>]

The $O$ notation here denotes finite sums with bounded smooth emitter-frame coefficients.
  These identities are (10.5) and (10.6); they are unchanged by the choice of Kerr spin.

Let $X_g \, macron(X)_g$ be the true future outgoing and incoming null normals, normalized by $d t = 1$,
  let $G = - g \( X_g \, macron(X)_g \)$, and let $alpha$ be the $macron(X)_g$ coefficient of $partial_q$ modulo
  $X_g$ and the screen. Define

#[#set math.equation(numbering: n => "(6.17)")
 $ d_g & = \| H_(ell_n ell_n) \| + \| H \|^2 \, wide M_f = r^0.72 mu^(- A_H) j_0 \( q \/ r \) \,\
frak(u) & = q + integral_(R_0 \/ 2)^r [rho^(delta_f - 1) + rho^(20 eta_(*) - 1) j \( \| q \| \/ rho^0.45 \)] d
  rho . $ <far:caps>]

The smooth cutoffs satisfy $j_0 = 1$ on $\[ - 1 \, 1 \]$, $j_0 = 0$ off $\[ - 2 \, 2 \]$, $j = 0$ below one,
  and $j = 1$ above two. The tight projection bounds make the caps $frak(u) = u_0$ spacelike when $R_0$ is large.

For each commuted equation the outgoing source is split as

#[#set math.equation(numbering: n => "(6.18)")
 $ P_g chi = lambda_1 L chi \/ r + f_(upright("flat")) + partial_q cal(P) + f_(upright(r)) +
   f_(upright("mix")) . $ <far:source-split>]

Here $lambda_1$ is bounded and nonnegative; it and the triangular $f_(upright("flat"))$ arise from flat dilation
  and rotation commutators. Write $f_(upright("raw"))$ for the unsplit remaining source after these flat terms.
  The correction $cal(P)$ is formed term by term in the commuted lab equation, keeping each algebraic sign.
  In the following list, $chi' = Z^(I') \( r T_l^(j') U \)$ is the commuted input field, $U in { h \, psi }$;
  a coefficient $Z^d T_l^m H$ has count $d + m$. For the smooth-acceleration terms,
  $C$ denotes the twice-null contraction of an ordered derivative of $2 eta^(i j) partial_i s_s^d$,
  the coefficient of $partial_(j d) h$ in the strong equation. There are three types:

+ A double-bad principal term $C_h partial_q \( c_0 partial_q chi' \)$ contributes $C_h c_0 partial_q
  chi'$ when the coefficient count is at most five, or at every coefficient count at level $P$.
  Here $C_h = Z^d \( T_l^m H \)_(ell_n ell_n)$ and $c_0 = c_0 \( n \, s_e \( q \) \)$ is the smooth emitter
  coefficient. The smooth-acceleration double-bad terms in the $D$ equation use the same rule with their
  coefficient in place of $C_h$.
+ A frame term $C \( partial_q c_2 \) D_Z chi' \/ r$ in that equation contributes $C c_2 D_Z chi' \/ r$,
  where $c_2 = c_2 \( n \, s_e \( q \) \)$ is smooth and bounded,
  and $D_Z$ has $Z$ order at most one and is independent of $q$.
+ Put $F_m = r Pi T_l^(m + 1) h$. Each leading strong quadratic pairing contributes
  #[#set math.equation(numbering: n => "(6.19)")
   $ cal(P)_(*) =
     Z^(b') #h(-0.16667em) [\( 1 - s_s dot.op n \) r^(- 1) ell_n ⊗ ell_n cal(C)_(m m') \( F_m \, F_(m') \)] \,
     $ <far:leading-correction>]
  where $cal(C)_(m m')$ is its actual polarized screen pairing.

The ordered expansions and these choices are given in (11.8), (11.11), and (11.17)–(11.20).
  The raw source keeps all three types unsplit for the lab-time multiplier. With their signed sum $cal(P)$, define

$ xi_(upright("curr")) = d chi + frac(G alpha, 2 k) cal(P) frac(- g \( macron(X)_g \, dot.op \), G) . $

We now complete $sans(F)$ by adding, for each equation,

#[#set math.equation(numbering: n => "(6.20)")
 $ parallel \( W_i \( 1 + M_f \) \)^(1 \/ 2) xi_(upright("curr") \, X_g) parallel_(upright("bulk")) +
   sup_(u_0) parallel W_i^(1 \/ 2) xi_(upright("curr") \, X_g)
   parallel_(L^2 \( d r thin d omega \; thin frak(u) = u_0 \)) . $ <far:corrected-norm>]

The source costs of 33 are

#[#set math.equation(numbering: n => "(6.21)")
 $ & parallel W_i^(1 \/ 2) \( cal(P) \, Z cal(P) \, r d_g partial_q cal(P) \) parallel_(upright("bulk")) +
   sup_t parallel W_i^(1 \/ 2) cal(P) parallel_(L_(r \, omega)^2)\
 & quad + parallel \( W_i \/ \( 1 + M_f \) \)^(1 \/ 2) r f_(upright(r)) parallel_(upright("bulk")) +
   parallel w_(i \, j)^(1 \/ 2) r f_(upright("raw")) parallel_(upright("bulk")) . $ <far:source-costs>]

There is also a mixed cap charge: on $t lt.tilde r$, $r tilde.op R_f$,
  a bound $parallel r f_(upright("mix")) parallel_(L_omega^2) lt.eq
  l_(R_f) \( frak(u) \) cal(T) \( t \, r \)$ is charged by

#[#set math.equation(numbering: n => "(6.22)")
 $ sum_(R_f) R_f^(\( p_i - 1 \) \/ 2) parallel l_(R_f) parallel_(L^2 \( d u_0 \)) sup_t parallel
   cal(T) \( t \, dot.op \) parallel_(L_r^2) . $ <far:mixed-charge>]

The geometric assumptions of the energy reduction follow from the point bounds already recorded:

$ X_g q = O \( d_g \) \, wide d_g lt.tilde r^(- 1) med upright("if ") \| q \| lt.eq 2 r^0.45 \, wide
  d_g lt.tilde r^(- 1 + 2 eta_(*)) med upright("otherwise") . $

Good derivatives of lab metric components, and an unrestricted first derivative when both metric slots are the
  outgoing flat vector $L = \( 1 \, n \)$, cost $O \( r^(- 2 + 0.04) \)$.
  This uses (6.11), (6.12), and smooth inverse composition.
  The bad component of $X_g - L$ is $O \( d_g \)$, and the screen is tangent to the sphere,
  so true outgoing and screen derivatives are good derivatives for these estimates.
  The exact lab gauge gives the lowered wave contraction $O \( r^(- 2) \)$.
  Thus the divergence comparison for $r^(- 2) d "vol"_g$ and the deformation bounds, including (10.21),
  have their stated inputs.

=== 6.4 The far estimate <the-far-estimate>

The point bounds and the corrections above have two distinct uses.
  The outgoing multiplier controls good derivatives and the corrected cap flux;
  the laboratory-time multiplier controls bad derivatives. Appendix 10 proves both estimates,
  with explicit source costs (6.21) and (6.22). Appendix 11 estimates those costs by the ordered commutations of
  the equation just verified.

#thm([Proposition 16.])[
  (Far estimate).  #emph[After giving the finitely many commuted energies fixed hierarchy weights,
    there is $c_1 > 0$ such that
#[#set math.equation(numbering: n => "(6.23)")
 $ sans(F) lt.eq o_(R_0) \( 1 \) \( sans(F) + sans(S)_a \) + C \( R_0 \) sans(K)_R +
   C_(upright("fix")) #scale(x: 120%, y: 120%)[\(] upright("input errors") +
   sans(N)^(1 + c_1) #scale(x: 120%, y: 120%)[\)] . $ <far:far-bound>]

 The coefficient denoted by $o_(R_0) \( 1 \)$ tends to zero as $R_0 arrow.r oo$,
   independently of the upper compact matching radius $R$. The input errors vanish with $e_(upright("in"))$,
   uniformly on bounded small bootstrap ranges.]
] <far:estimate>

#proof[
  Apply the complete source estimate, Proposition 34, to the lab equation of Lemma 19 and its $D$ derivative.
    The lemma supplies its background symbol bounds, the additional $D$ gain on the defect and linear
    coefficients, and the differentiated weak-null polarization.
    The point bounds in (6.11)–(6.14) supply the product estimates.
    Lemma 20 supplies the full mixed-order, physically nontrapping overlap and the initial symbol input.
    These are the actual inputs of the six source estimates, rather than bounds on an already global solution.
  Two features explain the choice of levels. A common principal commutator places the differentiated coefficient
    on a lower field. An extra bad laboratory-time derivative on $h$ can be replaced by $psi$ and good derivatives
    using $D h = psi$; the raw $h$ estimates therefore use the prior strong level.
    Conversely the differentiated equation is
  #[#set math.equation(numbering: n => "(6.24)")
   $ g^(i j) partial_(i j) psi = D f_h - \( D g^(i j) \) partial_(i j) h +
     2 g^(i j) \( partial_i s_s^d \) partial_(j d) h + g^(i j) \( partial_(i j) s_s^d \) partial_d h .
     $ <far:strong-equation>]
  Its seven commutations use $B^h$ indices through eight in the notation of (11.1):
    this means at most nine physical derivatives of $h$, available at level $H$.
    Its twice-null coefficient has the extra inverse radius because
  #[#set math.equation(numbering: n => "(6.25)")
   $ T_l^m psi =  & \( 1 - s_s dot.op n \) T_l^(m + 1) h + r^(- 1) s_s^d b_d Z T_l^m h\
 & + sum_(j < m) c_(j m) \( T_l^(m - j) s_s^d \) partial_d T_l^j h . $ <far:strong-projection-identity>]
  The differentiated gauge controls the first term without a stationary background offset,
    since it is a derivative of $h$ itself. The other terms carry an inverse radius or an acceleration symbol.
    The full coefficient placements and transferred angular derivatives are checked in Claims 1 and 2 of Proposition 34.
  The pure defect uses a different estimate from field products.
    After the $r^2$ source scaling it is $O \( tilde(a) \)$ for $h$ and $O \( r^(- 1) tilde(a) \)$ for $psi$.
    The averaging estimates (11.14) give squared shell powers $p_i - 1 \, p_i -
    A$ at the two $h$ levels and two additional inverse powers at level $P$.
    All are negative, as recorded in (11.15). In particular its starting-annulus cost has a small coefficient on
    $sans(S)_a$, not a growing compact coefficient. The remaining source terms are handled by the strict radial
    and time-weight margins in Claims 3–5; the leading strong weak-null term uses the third current correction above.
  Thus every correction, remainder, raw and mixed source budget has the bound (11.6).
    The size-one terms respect the finite order: level $P$ before the $h$ levels, lower total count,
    more lab times at fixed count, and then fewer dilations. The flat recurrence and its nonnegative diagonal term
    are proved in Claim 3 of Proposition 33. Its Claim 5 chooses fixed hierarchy weights before increasing $R_0$;
    the source constants on prior far energies are independent of both matching radii.
    The two corrected multiplier estimates therefore give (6.23). ◻
]

The background bound $B - eta = O \( r^(- 1) \)$ may have a nonsmall fixed constant.
  The estimates above use its radial decay and differentiated structure,
  so they do not prescribe the leading tail coefficient or select a preferred Kerr member.

=== 6.5 Closing the exterior estimates on one base neighborhood <closing-the-exterior-estimates-on-one-base-neighborhood>

The three inequalities now have the form

#[#set math.equation(numbering: n => "(6.26)")
 $ sans(K)_R & lt.eq C R^(- kappa) \( sans(F) + sans(K)_R \) +
   C_(upright("fix")) #scale(x: 120%, y: 120%)[\(] e_(upright("in")) +
   sans(N)^(3 \/ 2) + \( e_(upright("in")) sans(N) \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] \,\
sans(F) & lt.eq epsilon_0 \( R_0 \) \( sans(F) + sans(S)_a \) + C \( R_0 \) sans(K)_R +
  C_(upright("fix")) #scale(x: 120%, y: 120%)[\(] upright("input errors") +
  sans(N)^(1 + c_1) #scale(x: 120%, y: 120%)[\)] \,\
sans(S)_a & lt.eq C \( R_0 \) sans(K)_R + C_(*) sans(F) +
  C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \) \, $ <far:compact-coupling>]

where $kappa > 0$, $epsilon_0 \( R_0 \) arrow.r 0$, and, crucially, $C_(*)$ is independent of $R_0$.
  The first inequality is (5.30), the compact estimate with mixed-order recovery.
  Its acceleration and static quantities occur only as small coefficient differences or products,
  not as linear forcing. The last inequality is (5.16); its radius-uniform far coefficient is proved in Lemma 36
  by a single spatial adjoint pairing and the strict margin $p_P - A = 0.26$.
  The compact-tail defect comparison uses a cut $Y$ fixed before $R_0$.

#thm([Proposition 17.])[
  (Simultaneous closure).  #emph[For each fixed strictly subextremal center and fixed computing cylinders,
    there is a base smallness threshold depending only on the finite $p_10$ input such that the compact, far,
    static, and modulation bounds hold on every finite slab. They yield global smooth vacuum evolution on both
    computing cylinders. Every fixed higher-order bound of Proposition 15 then holds with datum- and
    order-dependent constants; those higher seminorms need only be finite.]
] <far:closure>

#proof[
  The common finite-slab norm includes the three compact levels with mixed jets, the far levels including (6.20),
    $sans(S)_a$, and the static norms of (5.16) on fixed reaches containing all compact error supports and deep
    matching regions. Include its extra nontrapped time orders and the low norm $sans(l)$ when needed.
    Filtered feedback from the strong $u$ level supplies the base parameter jets.
    The static estimate supplies the integrable coefficient difference near trapping;
    in the compact high estimate it multiplies another bootstrap factor and therefore creates no additional linear
    feedback term.
  Choose $R_0$ so large that $epsilon_0 \( R_0 \) \( 1 + C_(*) \)$ is as small as needed.
    Substituting (6.26) into (6.26) and absorbing the resulting $sans(F)$ term bounds $sans(F) +
    sans(S)_a$ by a fixed $C \( R_0 \) sans(K)_R$ plus input and superlinear errors.
    Now enlarge $R$ so that substitution in (6.26) absorbs its compact feedback.
    Finally enlarge the plateau time $T_0$ after $R$ to obtain the plateau-small terms used in that compact
    estimate. This is the order of (11.22), and it has no radius cycle.
  We spell out which earlier choices this order permits. The inner profile depth and finite Cauchy-join margins
    are fixed first. The slightly enlarged spacelike and outflow cylinders are therefore fixed before their
    stationary gauges. Measurement and gauge supports, the high spatial cutoff $Lambda$, the feedback filter,
    the small exponent in the compact low transfer, and then the outer-current slack can all be fixed
    independently of $R_0 \, R$. Their polynomial frequency degrees require only fixed differentiation,
    propagation, and testing orders. Compact stationary energy gluing to the differential end,
    and the cut $Y$ in the first sliced tail, are fixed before $R_0$ as well.
    After choosing $R_0$, prior fixed compact reaches may include its starting overlaps,
    with constants independent of $R$ and unchanged exponents.
    The original choice of $R_0$ also places the auxiliary anchor exterior (6.15) in the prescribed lab end.
    Every constant needed for a radius-uniform absorption was fixed before $R_0$;
    all other linear far costs were explicitly put on $C \( R_0 \) sans(K)_R$.
  The low norm and the second sliced norms cost only fixed linear constants times the three absorbed norms,
    plus data and superlinear errors. Thus for some $c_2 > 0$,
  #[#set math.equation(numbering: n => "(6.27)")
   $ sans(N) lt.eq C_(upright("fix")) #scale(x: 120%, y: 120%)[\(] cal(R) \( e_(upright("in")) \, sans(N) \) +
     sans(N)^(1 + c_2) #scale(x: 120%, y: 120%)[\)] \, $ <far:total-closure>]
  where $cal(R) \( e_(upright("in")) \, sans(N) \) arrow.r 0$ as $e_(upright("in")) arrow.r 0$,
    uniformly on bounded small bootstrap ranges. This notation includes the mixed positive input powers in (6.26).
    Choose a bootstrap cap so small that the superlinear term is less than one quarter of that cap,
    then choose the base input small enough that the other term is less than one quarter.
    The resulting strict improvement is uniform in the terminal time.
  For smooth finite-time solutions these norms vary continuously with the slab endpoint.
    For the cap suprema use the spacelike transversality of (6.17), as in the construction of 10.7.
    Finite-time symbol bounds and strict radial convergence margins control the tails.
    Startup and earlier bounded intervals have ordinary finite-time wave stability.
    Since $A > 1$, the acceleration bound keeps the parameters small, and the spacelike, outflow,
    and wave-coefficient continuation conditions persist. Proposition 8 now supplies causal local continuation and
    constraint propagation, hence global smooth vacuum evolution on both cylinders.
    Its finite-time tame propagation of higher smooth orders requires finiteness, not smallness, of those orders;
    no higher-order trapping energy has been invoked to reach this conclusion.
  All small initial norms used here are supplied by $p_10$ for the fixed cylinder-slice construction.
    The order-nine, eight, and seven far commutations in (6.2) carry one additional energy derivative,
    exactly matching the compact field orders ten, nine, and eight for $h \, h \, u$, respectively.
    The higher-order induction is applied only after this base closure.
    Its later datum- and order-dependent starting times and constants impose no further smallness on the common
    neighborhood. ◻
]

== 7 The two-ended double-null interior <sec:interior>

The exterior estimates supply data on the two late ends of a fixed, deep spacelike cylinder.
  Its bounded middle is supplied by finite-time evolution of the bridge.
  We construct the future double-null development of these cylinder data,
  with uniform low-order control and arbitrarily small exponential losses at every fixed higher order.
  The latter bounds will be used on finite regions whose optical length tends to infinity.
  The double-null framework follows the interior-stability method of Dafermos–Luk #cite(label("DafermosLuk2017"));
  the entry and wedge estimates required here are proved below.
  Throughout, the physical Kerr parameters lie in a sufficiently small compact neighborhood of the fixed pair $0 <
  frak(a) < M$.

The null estimates below require exact profiles with one common exponential rate and summable entry errors.
  We establish these inputs before deriving the characteristic energy estimates.
  The profile depth will be chosen before the inner computing boundaries, exterior coordinate constants,
  and data smallness thresholds. No higher-order seminorm is required to be small.

We write a bound as $e^(o \( T \))$ if, for every $delta > 0$, it is at most $C_delta e^(delta T)$ for $T gt.eq
  1$. The constant may depend on the fixed smooth datum, derivative order, and fixed domain parameters.
  No uniformity in derivative order is asserted.

=== 7.1 Gauge and exact profiles <gauge-and-exact-profiles>

Let $y_0 \, y_1$ be future-increasing optical functions and set

#[#set math.equation(numbering: n => "(7.1)")
 $ s = frac(y_0 + y_1, 2) \, wide x = frac(y_1 - y_0, 2) \, wide cal(S) = { s = 0 } \, wide q = q_0 e^(- 2 kappa s) \,\
g = - 2 a thin d y_0 d y_1 + gamma_(A B) \( d theta^A - b^A d y_0 \) \( d theta^B - b^B d y_0 \) \, wide a =
  q A . $ <in:gauge>]

Here $kappa > 0$ is fixed, for example equal to the background inner surface gravity in absolute value;
  $q_0 > 0$ will be chosen below; $A > 0$; $gamma$ is a Riemannian metric on $bb(S)^2$;
  and $b$ is a vector field on $bb(S)^2$. Angular coordinates are understood in a finite smooth atlas.
  The symbols $a \, A \, q$ in this section denote the null factor, its rescaling, and its exponential scale,
  respectively. The rate $kappa$ here is unrelated to the exterior radius-decay exponent denoted by the same letter.

For distinct $i \, j in { 0 \, 1 }$, write

$ B_0 = b \, wide B_1 = 0 \, wide L_i = partial_(y_i) + B_i \, wide cal(L)_i = partial_(y_i) + cal(L)_(B_i) . $

The last operator acts on angular tensors. Define

#[#set math.equation(numbering: n => "(7.2)")
 $ chi_i = 1 / 2 cal(L)_i gamma \, wide tau_i = "tr"_gamma chi_i \, wide ell_i = L_i log a \,\
xi_0 + xi_1 = d log a \, wide xi_0 - xi_1 = - a^(- 1) gamma thin partial_(y_1) b \,\
beta_i = "div" chi_i - d tau_i \, wide c_i^(upright("ang")) = "curl" xi_j \, wide
  Q_i = \( K \, c_i^(upright("ang")) \) \, wide mu_i = K - "div" xi_j . $ <in:variables>]

In this section $K$ is the Gaussian curvature of $gamma$.
  All angular differentials, contractions, divergences, and curls use $gamma$ unless explicitly indicated otherwise.

#thm([Lemma 21.])[
  (Exact profiles with a common rate).  #emph[For physical Kerr parameters in a sufficiently small compact
    neighborhood of the fixed subextremal parameters, there are exact profiles in the gauge (7.1),
    depending smoothly only on $\( q \, theta \)$ and the parameters and invariant under axial rotations,
    such that $A \, gamma$ and their inverses extend smoothly to $q = 0$, $b = O \( q \)$, and
#[#set math.equation(numbering: n => "(7.3)")
 $ chi_i \, med ell_i + kappa \, med beta_i = O \( q \) \, wide xi_i \, med K \, med c_i^(upright("ang")) \, med
   mu_i = O \( 1 \) . $ <in:profile-orders>]

 These estimates hold after every fixed angular or physical-parameter derivative.
   Their constants can be fixed before $q_0$ is chosen. The same statement holds with either optical direction
   chosen to have zero angular shift.]
] <in:profiles>

#proof[
  Align the spin axes smoothly in the central trapped block.
    Let $T_K$ be signed Boyer–Lindquist Killing time, and let $\( theta.alt \, phi \)$ denote the corresponding
    sphere variables. For the current exact physical parameters, put
  $ Sigma_K = r^2 + frak(a)^2 cos^2 theta.alt \, quad Delta = \( r - r_(-) \) \( r - r_(+) \) \, quad r'_(*) =
    frac(r^2 + frak(a)^2, Delta) \, quad kappa_(-) = frac(r_(+) - r_(-), 2 \( r_(-)^2 + frak(a)^2 \)) . $
  The Boyer–Lindquist metric is
  #[#set math.equation(numbering: n => "(7.4)")
   $ g_K =  & - Delta / Sigma_K \( d T_K - frak(a) sin^2 theta.alt thin d phi \)^2 + Sigma_K / Delta thin d r^2 +
     Sigma_K thin d theta.alt^2\
 & + frac(sin^2 theta.alt, Sigma_K) \( \( r^2 + frak(a)^2 \) d phi - frak(a) thin d T_K \)^2 . $ <in:BL-metric>]
  Temporal and axial conventions may be reversed simultaneously when passing between the two ends.
  Solve the axisymmetric Hamilton–Jacobi equation
  #[#set math.equation(numbering: n => "(7.5)")
   $ 2 \( r^2 + frak(a)^2 \) F_r + Delta F_r^2 + \| d_omega F \|_(upright("rd"))^2 + frak(a)^2 sin^2 theta.alt =
     0 \, wide F \( r_(-) \) = 0 \, $ <in:HJ>]
  where the norm is that of the round sphere. The finite root is noncharacteristic at the initial sphere,
    since its coefficient of $F_r$ is $2 \( r_(-)^2 + frak(a)^2 \) > 0$.
    Smooth Hamilton–Jacobi evolution therefore gives a parameter-dependent solution on a short radial interval,
    uniformly over the chosen compact parameter set. The equation is smooth on the whole sphere,
    and uniqueness preserves axisymmetry. The inverse of (7.4) gives
  $ Sigma_K g_K^(- 1) #scale(x: 120%, y: 120%)[\(] d \( r_(*) + F plus.minus T_K \) \,
    d \( r_(*) + F plus.minus T_K \) #scale(x: 120%, y: 120%)[\)] =  & Delta
    (frac(r^2 + frak(a)^2, Delta) + F_r)^2 + \| d_omega F \|_(upright("rd"))^2\
 & - frac(\( r^2 + frak(a)^2 \)^2, Delta) + frak(a)^2 sin^2 theta.alt . $
  Thus (7.5) is precisely the null equation.
  Define
  #[#set math.equation(numbering: n => "(7.6)")
   $ Q = e^(- 2 kappa_(-) \( r_(*) + F \)) \, wide s = - frac(log \( Q \/ q_0 \), 2 kappa) \, wide lambda_(-) =
     kappa_(-) / kappa \, wide x = lambda_(-) T_K . $ <in:exact-coordinates>]
  Both $s - x$ and $s + x$ increase to the future near the inner horizon.
    Indeed their sum has temporal gradient, with $s$ increasing as $r$ decreases. The parameter-smooth normalization
  $ r_(*) = - frac(1, 2 kappa_(-)) log \( r - r_(-) \) + upright("smooth") $
  shows that $Q$ is $\( r - r_(-) \)$ times a smooth strictly positive factor.
    The factor $lambda_(-)$ in both optical directions is what makes $kappa$ common to every profile.
  Corotate the sphere by $- Omega_(-) T_K$, where $Omega_(-) = frak(a) \/ \( r_(-)^2 + frak(a)^2 \)$.
    In the resulting $\( s \, x \, omega \)$ coordinates, coefficients are independent of $x$ and invariant under
    axial rotations. To see their regularity, the pairings of $partial_(T_K) +
    Omega_(-) partial_phi$ with itself and with angular vectors are $O \( Q \)$ by (7.4).
    The simple pole of the radial coefficient is canceled by $r_s \, partial_theta.alt r \|_s = O \( Q \)$,
    and $r_s \/ Q$ is smoothly nonzero. Hence the angular cross coefficients with $d s \, d x$ are $O \( Q \)$,
    while the angular metric extends smoothly and positively to $Q = 0$.
    The absolute spacetime volume divided by $Q$ is smooth and positive,
    as follows from the Boyer–Lindquist density $Sigma_K$ relative to round sphere measure.
    These are smooth sphere-tensor statements, including at the poles; here $r_(-) > 0$ is essential.
  The two-shift null decomposition consequently has shifts $O \( Q \)$ and positive null factor $Q$ times a smooth
    positive function. Eliminate the second shift by angular labels $H \( Q \, omega \)$,
    with $H \( 0 \, dot.op \) = "Id"$. After division by $Q$, their transport equation has the form $-
    kappa partial_Q$ plus a smooth sphere vector field. It yields axis-equivariant sphere diffeomorphisms and the
    one-shift gauge (7.1), with $q = Q$. Since $L_i q = - kappa q$, the definitions (7.2) imply (7.3),
    with all asserted differentiated bounds. The same construction eliminates the other shift after exchanging the
    optical directions. ◻
]

Choose $q_0$ sufficiently small for the characteristic absorptions below,
  uniformly for both angular-transport conventions. We also impose the exact-profile depth condition used when
  returning the later packet to the exterior. Since $partial_theta.alt F = O \( r - r_(-) \) =
  O \( q_0 \)$ at entry and the spin stays bounded away from zero in the fixed parameter neighborhood,
  we require the uniform strict inequality

#[#set math.equation(numbering: n => "(7.7)")
 $ (\| partial_theta.alt F \|^2 + frak(a)^2 sin^2 theta.alt)_(upright("entry")) < 4 frak(a)^2 . $ <in:profile-depth>]

This supplies a strict positive margin for the radial potential $\( r^2 + frak(a)^2 \)^2 -
  Delta \( \| partial_theta.alt F \|^2 + frak(a)^2 sin^2 theta.alt \)_(upright("entry"))$ for $r gt.eq r_(+)$,
  since $Delta < r^2$ and $\( r^2 + frak(a)^2 \)^2 \/ r^2 gt.eq 4 frak(a)^2$.
  Thus the central level $Q = q_0$ is strictly between the horizons.
  The computing radius $r_b$ is then chosen strictly deeper, with a margin before $r_(-)$;
  the exterior time bends and compact constants may be fixed afterward.
  This order depends only on exact physical profiles, not on smallness of high derivatives of the eventual datum.
  All fixed entry supports and their enlargements lie strictly between the horizons,
  hence outside the physical exterior trapping neighborhood;
  this separation persists after shrinking the parameter range.

=== 7.2 Moving coordinates and the entry estimates <moving-coordinates-and-the-entry-estimates>

The estimates on the two exterior ends and a fixed finite evolution of the middle bridge will supply the cylinder
  data. We derive their trace bounds in prepared coordinates;
  Section 8 will identify these local evolutions geometrically and attach the resulting cylinder to the complete
  bridge. Thus the entry estimate uses the exterior bounds, while the later attachment uses geometric uniqueness.

The exterior stationary references are exact Kerr metrics in stationary charts.
  On fixed spatial supports about the chosen entry depth, their aligned Boyer–Lindquist variables have the form

$ T_K = 𝜍 \( pi \) t + P_K \( pi \, y \) \, $

with $r \, omega$ smooth in $\( pi \, y \)$. Here $pi$ includes the required exterior parameters,
  including the auxiliary stationary parameters when necessary.
  The factor $𝜍$ is nonzero and has opposite signs on the two ends.
  Shrink the parameter range so that all these supports remain within the fixed depth margins.
  Denote the associated intrinsic physical parameters by $frak(p) \( pi \)$.

#thm([Lemma 22.])[
  (Preparation without growing phase errors).  #emph[For a time-dependent exterior parameter $pi \( t \)$,
    define $s$ using the instantaneous $Q$ in (7.6), use the instantaneous angular map $H$, and set
#[#set math.equation(numbering: n => "(7.8)")
 $ x = I \( t \) + lambda_(-) P_K \, wide alpha_(upright("rot")) = I_(upright("rot")) \( t \) + Omega_(-) P_K \,\
I' = lambda_(-) 𝜍 \, wide I'_(upright("rot")) = Omega_(-) 𝜍 . $ <in:phases>]

 The angular rotation is by $- alpha_(upright("rot"))$, after aligning the axes.
   The Jacobian differs from the frozen Jacobian only by terms containing positive parameter derivatives,
   with uniformly bounded coefficients at fixed low order. No factor $t pi'$ occurs.
   Near $s = 0$, the spheres of fixed $\( s \, x \)$ are uniformly controlled graphs over a stationary sphere,
   with graph times a bounded distance from $I^(- 1) \( x \)$ and uniformly nonsingular angular Jacobians.]
] <in:moving-coordinates>

#proof[
  This is the preparation in (7.8); we check its dependence on the present exact family.
    At a time $t_0$, compare with the map frozen at $pi \( t_0 \)$ and give its Killing-time and rotation products
    the constant offsets
  $ I \( t_0 \) - \( lambda_(-) 𝜍 \) \( pi \( t_0 \) \) t_0 \, wide
    I_(upright("rot")) \( t_0 \) - \( Omega_(-) 𝜍 \) \( pi \( t_0 \) \) t_0 . $
  The actual and frozen maps then agree in value. The offsets change neither the stationary nor the axisymmetric
    prepared profile. Their differentiated discrepancies contain only positive parameter jets with bounded smooth
    coefficients. Differentiating a phase gives a bounded frequency or a parameter jet,
    never the product of an elapsed time and a parameter derivative.
    Axis alignment precedes rotation, so variations of the axis also have uniformly bounded coefficients.
    The same comparison applies to the metric, with the additional residual $g_(upright("co")) - overline(G)_(p \, c)$.
  For fixed $\( s \, x \)$, first solve the $s$ equation for radius over a stationary sphere.
    It is a uniformly small graph perturbation. Along that level, the derivative of $x$ in time is $I' +
    O \( \| pi' \| \)$, bounded away from zero in absolute value.
    The graph times therefore differ from $I^(- 1) \( x \)$ by a bounded amount.
    At fixed $x$, angular differentiation of the total rotating phase costs $O \( \| pi' \| \)$, by $d x = 0$.
    The angular map is consequently a uniformly nonsingular perturbation of an aligned rotation composed with $H$.
    It is a sphere diffeomorphism; equivalently, finitely many uniform graph charts give the same estimates. ◻
]

Fix the additive phase constants by agreement with the central exact chart at zero perturbation.
  In bounded overlaps, join the auxiliary coordinates by small smooth changes;
  small vector fields suffice for the angular maps. The middle and these joins are contained in a fixed
  finite-time bridge development. The resulting surface $s = 0$ is strictly spacelike,
  with the same uniform optical transversality. Its precise attachment to the lower development uses ordinary
  geometric Cauchy uniqueness and will be made in the comparison-domain construction.

On each end define a physical parameter profile by

#[#set math.equation(numbering: n => "(7.9)")
 $ overline(frak(p)) \( y_0 \) = frak(p) #scale(x: 120%, y: 120%)[\(] pi \( I^(- 1) \( - y_0 \) \)
   #scale(x: 120%, y: 120%)[\)] \, $ <in:parameter-profile>]

and join the two prescriptions smoothly, close to the background, through a bounded interval.
  This is one angle-independent profile on the entire wedge, depending only on $y_0$.
  A hat denotes the exact Kerr value at $\( q \, theta \, overline(frak(p)) \( y_0 \) \)$,
  including for a named differentiated geometric quantity. Thus a hat means evaluation after differentiation at
  fixed physical parameters. Differentiating the resulting hatted field adds only a defect in direction $0$,
  bounded by the profile symbol constants times

$ sigma_0 \( y_0 \) = \| overline(frak(p))' \( y_0 \) \| \, wide sigma_1 = 0 . $

This use of physical parameters keeps the profile constants independent of the subsequent exterior chart and gauge
  choices.

#thm([Proposition 18.])[
  (Cylinder data and their derivative budget).  #emph[Start actual eikonal coordinates on the prepared cylinder
    with $y_0 = - x$, $y_1 = x$, and transport its prepared angular labels along $L_1$.
    For sufficiently small data in the common base neighborhood,
    the sum of unit-$x$-cell supremum norms of the differences from frozen profiles is at most an arbitrarily
    prescribed small number $e_(cal(S))$ for
#[#set math.equation(numbering: n => "(7.10)")
 $ A \, log A \, gamma \, b \, chi_i \, ell_i \, xi_i & upright("in angular ") H^6 \,\
gamma & upright("in angular ") H^7 \,\
partial_x \( chi_i \, ell_i \, xi_i \, b \) \|_(cal(S)) & upright("in angular ") H^2 . $ <in:entry-orders>]

 Here $partial_x$ is tangent to the cylinder at fixed prepared angle,
   and the comparison in the last line uses frozen differentiation.
   The sum of cell suprema of $sigma_0$ is also at most $C e_(cal(S))$.
   At each fixed higher order, these initial quantities and their parameter jets on $\| x \| lt.eq
   C T$ are bounded by $e^(o \( T \))$ for every fixed $C > 0$.]
  #emph[The low smallness depends only on the common base-order neighborhood;
    constants may depend on the already fixed $q_0$ and coordinate choices.
    Higher-order constants may depend on the individual smooth datum.]
] <in:entry>

#proof[
  We derive the entry trace from the mixed exterior estimates.
    On the fixed graph supports, Proposition 12 controls mixed derivatives of $g_(upright("co")) -
    overline(G)_(p \( t \) \, c \( t \))$ through order eight, and one further time derivative of that order,
    in local spacetime $L^2$ with squared time weight $chevron.l t chevron.r^(A_S)$, where $A_S > 1$.
    These supports are outside physical trapping. Positive parameter derivatives through order eight have
    enlarged-cell supremum bounds supplied by their through-order-nine weighted $L^2$ controls,
    again with exponent greater than one. The one-dimensional $H^1$ inequality and weighted Cauchy–Schwarz make
    their cell sums small. Bounded graph-time offsets cost the corresponding local parameter variations.
  The prepared frozen fields are the same smooth functions of intrinsic parameters and $\( q \, theta \)$ at every
    time. After the value-matching comparison of Lemma 22, replacing the instantaneous parameter by (7.9) changes
    only that parameter argument, with positive parameter jets charged when differentiated.
    In particular it does not rotate a phase by $t$ times a parameter variation.
  For a residual derivative $f = D^alpha \( g_(upright("co")) - overline(G)_(p \, c) \)$, $\| alpha \| lt.eq 7$,
    on an enlarged fixed $\( t \, r \)$ rectangle, the iterated one-dimensional Sobolev inequality gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ integral_(bb(S)^2) sup_(t \, r) \| f \|^2 thin d omega lt.eq
     C sum_(epsilon.alt \, epsilon.alt' in { 0 \, 1 }) parallel partial_t^epsilon.alt partial_r^(epsilon.alt') f
     parallel_(L^2 \( t \, r \, omega \))^2 . $ <in:trace>]
  Even the mixed time-radial term lies in the stated budget:
    it uses the full mixed order-eight estimate for the time derivative of the metric residual,
    not a ninth-order pointwise metric trace. The graph Jacobians and the bounded overlap of enlarged cells
    transfer this estimate to the prepared spheres. If $a_n$ denotes the resulting cell norm, then
  $ sum_n a_n lt.eq (sum_n chevron.l n chevron.r^(- A_S))^(1 \/ 2)
    (sum_n chevron.l n chevron.r^(A_S) a_n^2)^(1 \/ 2) . $
  The first factor is finite, and the second is small by the sliced estimate.
  The first and second initial jets of the actual optical and angular chart are smooth functions of the auxiliary
    metric through order one: solve the noncharacteristic eikonal and angular-transport equations for normal
    derivatives. At exact freezing these jets agree with the auxiliary ones.
    Further initial jets require only ordinary derivatives of these identities.
    The geometric fields in (7.10) therefore use metric derivatives through order seven:
    $A \, gamma \, b$ use order zero and the one-derivative geometric fields use order one before angular
    differentiation. The coordinate transformations through this order use parameter jets through order eight.
    Sphere Sobolev products, with spare angular suprema on low residual factors,
    and (7.11) give exactly the displayed norms. Strict optical transversality requires only low suprema after
    $q_0$ and the coordinate constants have been fixed.
  In the bounded middle and enlarged joins, finite-time spacetime estimates through order nine supply the same
    trace. Use common identified coordinates for the lower computations;
    any order loss in the identifying map is assigned to the pulled-back metric bounds in that finite-time
    matching. Smooth fixed coordinate prescriptions and small parameter-dependent changes suffice to interpolate
    the preparation there. At higher orders the identical argument uses the subexponential exterior estimates on
    expanding intervals and finite smooth constants in the middle. This proves every assertion. ◻
]

=== 7.3 The null equations and uniform low estimates <the-null-equations-and-uniform-low-estimates>

The entry estimate supplies summable errors along the initial cylinder.
  We now propagate those errors through the wedge using only the vacuum equations in (7.1),
  the exact profile orders, and the entry bounds. The sums along each optical direction will control transport
  coefficients on arbitrarily long null segments; their vanishing tails will later give the small exponential
  rates at higher orders.

With curvature convention $R \( X \, Y \) = \[ nabla_X \, nabla_Y \] - nabla_(\[ X \, Y \])$,
  the vacuum identities in this gauge are

#[#set math.equation(numbering: n => "(7.12)")
 $ L_i tau_i & = ell_i tau_i - \| chi_i \|^2 \,\
cal(L)_i xi_j & = beta_i + tau_i xi_i \,\
cal(L)_j chi_i & = a "Sym" nabla xi_j - a / 2 K gamma + a xi_j^(⊗ 2) - 1 / 2 \( tau_i chi_j + tau_j chi_i \) +
  chi_i chi_j + chi_j chi_i \,\
L_j ell_i & = a K - chi_i dot.op chi_j + tau_i tau_j + a \( 2 xi_i dot.op xi_j - \| xi_i \|^2 \) . $ <in:vacuum>]

===== 7.3.1 Derivation of the null equations. <derivation-of-the-null-equations.>

For angular vectors $E \, H$, Koszul’s formula and $\[ L_i \, L_j \] = a \( xi_i - xi_j \)^sharp$ give

#[#set math.equation(numbering: n => "(7.13)")
 $ nabla_(L_i)^g L_i & = ell_i L_i \, & nabla_E^g L_i & = chi_i \( E \)^sharp + xi_i \( E \) L_i \,\
nabla_(L_i)^g L_j & = a xi_i^sharp \, & nabla_E^g H & = nabla_E H + a^(- 1) { chi_i \( E \, H \) L_j +
  chi_j \( E \, H \) L_i } . $ <in:connection-identities>]

The same-index null Ricci contraction is $- L_i tau_i + ell_i tau_i - \| chi_i \|^2$, giving Raychaudhuri.
  Direct calculation also gives

$ g \( R \( L_i \, E \) L_j \, H \) = \( cal(L)_i chi_j - chi_j chi_i - a nabla xi_i - a xi_i^(⊗ 2) \) \( E \, H \) . $

The angular Gauss contraction is

$ K gamma + a^(- 1) { tau_i chi_j + tau_j chi_i - chi_i chi_j - chi_j chi_i } . $

Thus $"Ric"_(E H) = 0$ gives the sum of the two cross equations for $chi$. Their difference follows from

$ cal(L)_j chi_i - cal(L)_i chi_j = 1 / 2 cal(L)_(\[ L_j \, L_i \]) gamma = a thin "Sym" nabla \( xi_j - xi_i \) +
  a \( xi_j^(⊗ 2) - xi_i^(⊗ 2) \) \, $

where $d a = a \( xi_i + xi_j \)$ was used. Half the sum and difference give the cross-shape equation of (7.12).

In $"Ric"_(i E)$ the angular and null contractions are, respectively, $beta_i - chi_i xi_i + tau_i xi_i$ and $-
  cal(L)_i xi_j + chi_i xi_i$. This proves the torsion equation.
  In $"Ric"_(j i)$ the angular contraction, after use of the cross equation, is $a K - chi_i dot.op chi_j +
  tau_i tau_j$, while the remaining contraction is $a \( 2 xi_i dot.op xi_j - \| xi_i \|^2 \) - L_j ell_i$.
  This proves the lapse equation.

The corresponding differentiated angular systems have the factor structure

#[#set math.equation(numbering: n => "(7.14)")
 $ cal(L)_j beta_i & =  a / 2 \( d K + J d c_i^(upright("ang")) \) + a \( K * xi + xi * nabla xi + xi^3 \) +
   chi_i * nabla chi_j + chi_j * nabla chi_i \,\
L_i \( Q_i \, mu_i \) & =  \( \( "div" beta_i \, "curl" beta_i \) \, 0 \) + chi_i * \( K \, nabla xi \) +
  nabla chi_i * xi . $ <in:angular-system>]

Here $J d$ is the rotated angular differential and $*$ denotes the indicated smooth angular metric contractions;
  every differentiated factor type is retained. Also

#[#set math.equation(numbering: n => "(7.15)")
 $ \[ L_i \, L_j \] = a \( xi_i - xi_j \)^sharp \, wide partial_(y_1) b =
   a gamma^(- 1) \( xi_1 - xi_0 \) . $ <in:bracket-shift>]

To verify this, apply divergence minus trace differential to the cross equation.
  On $"Sym" nabla xi_j$ the second-derivative part is $1 / 2 J d thin "curl" xi_j$;
  the curvature commutators give $K * xi$. Differentiating $a$ uses $d a = a \( xi_i + xi_j \)$,
  and varying the angular connection uses $cal(L)_j gamma = 2 chi_j$.
  These give exactly the displayed remaining types. Surface curvature variation gives

#[#set math.equation(numbering: n => "(7.16)")
 $ L_i K = "div" beta_i - tau_i K . $ <in:curvature-variation>]

For a one-form $zeta$,

$ L_i "div" zeta = "div" \( cal(L)_i zeta \) - 2 chi_i^(A B) nabla_A zeta_B - \( 2 "div" chi_i - d tau_i \) dot.op
  zeta . $

Together with the torsion equation this cancels $"div" beta_i$ in $L_i mu_i$.
  Variation of the area form similarly gives $L_i "curl" xi_j = "curl" beta_i + "curl" \( tau_i xi_i \) -
  tau_i "curl" xi_j$. This proves (7.14).

Frozen hats satisfy these equations at fixed parameters. In differences,
  parameter defects in direction $i$ contain only $sigma_i$.

We first estimate the solution on finite past diamonds

$ cal(D)_(C_0 \, C_1 \, s_(*)) = { 0 lt.eq s lt.eq s_(*) \, med y_0 lt.eq C_0 \, med y_1 lt.eq C_1 } times
  bb(S)^2 \, wide C_0 + C_1 > 0 \, quad s_(*) > 0 . $

At fixed $y_j$, the past coordinate segment ends at $y_i = - y_j$ on $cal(S)$ and remains in this diamond.
  The upper null sides and upper $s$ cuts are future boundaries for the energy currents.
  All norms below are restricted to this domain. The slightly tilted enlargements used for continuation will
  retain these outgoing flux signs. Fix $0 < eta lt.double kappa$ and let $w_(i \, n) = e^(- eta \| y_i - n \|)$,
  $n in bb(Z)$. For nonnegative angular norm functions $Y \, Z$, define

#[#set math.equation(numbering: n => "(7.17)")
 $ \[ Y \]_(i \, n) & = sup_(y_j) parallel w_(i \, n) Y parallel_(L^2 \( d y_i \)) +
   sup_s parallel w_(i \, n) Y parallel_(L^2 \( d x \)) \,\
{ Z }_(i \, n) & = sup_(y_i) parallel w_(i \, n) sqrt(q) thin Z parallel_(L^2 \( d y_j \)) +
  sup_s parallel w_(i \, n) sqrt(q) thin Z parallel_(L^2 \( d x \)) +
  parallel w_(i \, n) sqrt(q) thin Z parallel_(L^2 \( d y_0 d y_1 \)) . $ <in:flux-norms>]

Every integral and supremum carries the domain restriction.
  Angular $H^k$ norms in fixed controlled charts are written $\| dot.op \|_k$.
  For actual-minus-hat differences, denoted by $delta$, set

#[#set math.equation(numbering: n => "(7.18)")
 $ Y_i = \| delta beta_i \|_5 \, wide Z_i = \| delta \( Q_i \, mu_i \) \|_5 \, wide R_i = \| delta chi_i \|_6 \,
   wide X_j = \| delta xi_j \|_6 \, wide d_i = \| delta B_i \|_6 \,\
E = sum_(i \, n) \( \[ Y_i \]_(i \, n) + { Z_i }_(i \, n) \) \, wide R = sum_(i \, n) \[ R_i \]_(i \, n) \, wide
  X = sum_(i \, n) { X_j }_(i \, n) \,\
D_b = sum_(i \, n) parallel w_(i \, n) sup_(y_j) d_i parallel_(L^2 \( d y_i \)) . $ <in:low-variables>]

The indexing of $X_j$ in the $i$ norm is deliberate: $j = 1 - i$. For the remaining low quantities put

#[#set math.equation(numbering: n => "(7.19)")
 $ p_(*) = \| delta \( gamma \, log A \) \|_6 + \| delta xi \|_5 \, wide P = sup p_(*) +
   sum_n sup e^(- 8 eta s) w_(0 \, n) p_(*) \,\
g_i \( y_i \) = sup_(y_j) #scale(x: 120%, y: 120%)[\(] \| delta \( chi_i \, ell_i \) \|_4 + \| delta B_i \|_5
  #scale(x: 120%, y: 120%)[\)] \, wide S = sum_(i \, n) sup w_(i \, n) g_i . $ <in:low-point-budgets>]

The summations over cells are unsquared. They are needed both for integrable transport coefficients and for their
  vanishing tails. The paired angular equations estimate $E$.
  The remaining budgets recover the shape and torsion fields ($R \, X$), the shift ($D_b$),
  the metric and lower torsion coefficients ($P$), and the integrable directional envelopes ($S$) of $delta
  chi_i \, delta ell_i \, delta B_i$. These recoveries are coupled:
  the proof first reduces their combined size to $E$ and the entry error, then closes the small feedback into $E$.

#thm([Proposition 19.])[
  (Uniform low characteristic estimates).  #emph[Choose $q_0$ sufficiently small in terms of the uniform profile
    constants, and then choose $e_(cal(S))$ sufficiently small.
    On every smooth finite past diamond satisfying the entry assumptions,
#[#set math.equation(numbering: n => "(7.20)")
 $ E + R + X + D_b + P + S lt.eq C \( q_0 \) e_(cal(S)) . $ <in:low-conclusion>]

 The metrics $A \, gamma$ and their inverses remain uniformly bounded and nondegenerate at the indicated low
   orders. The constants are independent of the location and size of the diamond.]
] <in:low>

#proof[
  Bootstrap the budgets small and the metrics in a uniformly nondegenerate neighborhood.
    We first derive the Hodge and transport estimates for the auxiliary budgets.
    Trace damping supplies the shape estimate needed in this group.
    We then estimate the paired angular currents and perform the simultaneous absorption.
    The calculation uses only the displayed profile and equation hypotheses.
    The actual radiative factors at low orders have size $C \( q + g_i \)$;
    nonradiative coefficients are bounded and their differences cost $C p_(*)$. An orientation change obeys
  #[#set math.equation(numbering: n => "(7.21)")
   $ w_(i \, n) lt.eq e^(2 eta s) w_(j \, - n) . $ <in:weight-switch>]
  Unit-cell convolution bounds the localized $L_x^2$ norm of $p_(*)$ by $C
    e^(10 eta s)$ times an $ell^1$ envelope of total size $P$.
    Positive powers of $q$ absorb this growth when $eta$ is small.
  The div–curl system for $xi_j$ and the trace-free divergence system for $chi_i$ give
  #[#set math.equation(numbering: n => "(7.22)")
   $ X lt.eq C \( E + sqrt(q_0) P \) \, wide R_i lt.eq C #scale(x: 120%, y: 120%)[\(] Y_i + \|
     delta \( tau_i \/ A \) \|_6 + \| delta chi_i \|_0 + q p_(*) #scale(x: 120%, y: 120%)[\)] . $ <in:low-hodge>]
  Their constants use only the low angular ellipticity and coefficient bounds.
    Coefficient differences acting on hats cost $p_(*)$, with the additional $q$ in the shape estimate.
    Integrating the shift equation in (7.15), with Cauchy–Schwarz and (7.21), yields
  #[#set math.equation(numbering: n => "(7.23)")
   $ D_b lt.eq C e_(cal(S)) + C q_0^c \( X + P \) $ <in:low-shift>]
  for a fixed $c > 0$. The cross transports for $chi_i \, ell_i$ have homogeneous coefficient $C \( q + g_j \)$
    and remaining difference source $C q \( p_(*) + g_j + sigma_j \)$.
    Their quadratic terms pair opposite radiative orientations. The lower shift estimate has source $C q p_(*)$.
    Consequently
  #[#set math.equation(numbering: n => "(7.24)")
   $ S lt.eq C e_(cal(S)) + C q_0^c \( P + S \) . $ <in:low-characteristic>]
  The metric and torsion transports, using $partial_(y_1) gamma = 2 chi_1$, $partial_(y_1) log A = ell_1 + kappa$,
    and $d log A = xi_0 + xi_1$, give
  #[#set math.equation(numbering: n => "(7.25)")
   $ P lt.eq C \( e_(cal(S)) + E + R + D_b + S \) . $ <in:low-metric>]
  The unweighted free sources integrate by the cell sums. For the localized part,
    the target-to-source ratio of $e^(- 8 eta s) w_(0 \, n)$ is bounded along either past coordinate path;
    the remaining weight change and the square root of the path length are absorbed by this exponential factor,
    proving (7.25) with the current profile constants.
  Raychaudhuri has the exact rescaled form
  #[#set math.equation(numbering: n => "(7.26)")
   $ \( L_i + kappa \) \( tau_i \/ A \) = - A^(- 1) \| chi_i \|^2 . $ <in:trace-equation>]
  The differentiated difference has source $C \( \( q + g_i \) R_i + q^2 p_(*) + q \( sigma_i + d_i \) \)$,
    and the tame transport commutators additionally cost
  $ C \( q + g_i \) \| delta \( tau_i \/ A \) \|_6 + C d_i \( g_i + q p_(*) \) . $
  The first term is absorbed in the trace damping under the small bootstrap.
    The second uses the small low envelopes and the shift budget;
    its contribution is included in the $epsilon_(upright("boot")) \( P + D_b + R \)$ term below.
    Exponential convolution in $y_i$ preserves the localized flux norms:
    a displacement $h$ changes the weight by at most $e^(eta h)$ and samples the earlier $s - h \/ 2$ slice.
    Combining this damping with (7.22) gives
  #[#set math.equation(numbering: n => "(7.27)")
   $ R lt.eq C \( E + e_(cal(S)) + S \) + C \( q_0^c + epsilon_(upright("boot")) \) \( P + D_b + R \) .
     $ <in:low-shape>]
  It remains to close the paired angular energies. Commute (7.14) through angular order five and subtract hats,
    retaining the actual principal operators. The source norms are bounded by constants times
  #[#set math.equation(numbering: n => "(7.28)")
   $ G_i =  &
     q \( X_0 + X_1 + Z_i + p_(*) + sigma_j \) + \( q + g_j \) \( Y_i + R_i \) + \( q + g_i \) \( R_j + d_j \) \,\
H_i =  & Y_i + R_i + d_i + sigma_i + q p_(*) + \( q + g_i \) \( X_0 + X_1 + Z_i \) . $ <in:paired-sources>]
  Indeed, angular principal commutators cost $q Z_i$ or $Y_i$;
    coefficient differences on hats have the stated profile gain;
    and unweighted shape products pair opposite orientations. Shift commutators use the low radiative bounds.
    Parameter defects occur only in their own direction and inherit the $q$ factor whenever the hatted field is
    radiative. This verifies the source list (7.28).
  Use squared currents with weights $w_(i \, n)^2$ on $Y_i$, flowing along $j$,
    and $w_(i \, n)^2 a \/ 2$ on $\( Q_i \, mu_i \)$, flowing along $i$.
    Angular integration by parts cancels the principal pair. The latter currents have damping because
  $ L_i log \( a w_(i \, n)^2 \) lt.eq - kappa + C \( q + g_i \) + 2 eta . $
  All future null and $s$ fluxes are positive. The squared flux is bounded by the initial norm plus
  #[#set math.equation(numbering: n => "(7.29)")
   $ C integral w_(i \, n)^2 \( Y_i G_i + q Z_i H_i \) thin d y_i thin d y_j . $ <in:paired-current>]
  Terms retaining a positive power of $q$ use slice Cauchy–Schwarz and (7.21).
    Same-orientation $g$ terms use a null flux and $integral g_i$. The remaining opposite-orientation terms obey (7.30):
  #[#set math.equation(numbering: n => "(7.30)")
   $ integral w_(i \, n)^2 Y_i g_i R_j & lt.eq C \[ Y_i \]_(i \, n) parallel w_(i \, n) g_i
     parallel_(L^2 \( d y_i \)) sum_m \[ R_j \]_(j \, m) \,\
integral q w_(i \, n)^2 Z_i g_i X_i & lt.eq C { Z_i }_(i \, n) parallel w_(i \, n) g_i parallel_(L^2 \( d y_i \))
  sum_m { X_i }_(j \, m) . $ <in:cross-flux>]
  For completeness, partition $y_j$ into unit cells. Two-dimensional Cauchy–Schwarz uses the fixed-$y_j$ flux for
    the first energy factor and the fixed-$y_i$ flux for the opposite factor; in the second line,
    the spacetime $sqrt(q) thin X_i$ norm on a cell is controlled by its $j$-localized norm.
    Partial cells and past-diamond restrictions remain inside the integrals.
    The same argument applies to $d_j$ in place of $R_j$. Summing the unsquared budgets gives
  #[#set math.equation(numbering: n => "(7.31)")
   $ E lt.eq C e_(cal(S)) + C \( q_0^c + S \) \( E + R + D_b + P + X \) . $ <in:low-energy>]
  To close the estimates, write $cal(A)_(upright("aux")) = P + R + X + D_b + S$.
    Substitute the Hodge bound for $X$, the shift and cross-transport bounds for $D_b \, S$,
    and the damped shape bound for $R$ into the metric estimate for $P$. For some fixed $c' > 0$, this gives
  $ cal(A)_(upright("aux")) lt.eq C \( E + e_(cal(S)) \) + C \( q_0^(c') + epsilon_(upright("boot")) \)
    cal(A)_(upright("aux")) . $
  Here $c'$ may be decreased to include the $sqrt(q_0)$ term in (7.22).
    Absorbing the last term yields $cal(A)_(upright("aux")) lt.eq C \( E + e_(cal(S)) \)$.
    The paired-current estimate (7.31), using the bootstrap bound for $S$, now becomes
  $ E lt.eq C e_(cal(S)) + C \( q_0^(c') + epsilon_(upright("boot")) \) \( E + e_(cal(S)) \) . $
  Choose $q_0$ first using only the profile and energy constants, then the bootstrap size,
    to absorb this feedback. Finally choose the entry size so that the resulting bounds strictly improve the
    bootstrap, including nondegeneracy. This proves (7.20). ◻
]

=== 7.4 The first pure longitudinal derivatives <the-first-pure-longitudinal-derivatives>

The low flux bounds control the cross derivatives in the null equations.
  Normalized curvature also contains pure derivatives such as $cal(L)_i chi_i$,
  which those equations do not directly bound pointwise. Differentiating the cross equations gives transport
  equations for these missing jets along the opposite direction, with no additional small data norm.

#thm([Proposition 20.])[
  (Pure jets and flank limits).  #emph[Under the assumptions of Proposition 19, the sum of unit-$y_i$-cell suprema of
#[#set math.equation(numbering: n => "(7.32)")
 $ sup_(y_j) (\| cal(L)_i chi_i - accent(cal(L)_i chi_i, ̂) \|_2 + \| L_i ell_i - accent(L_i ell_i, ̂) \|_2)
   $ <in:pure-budget>]

 is at most $C e_(cal(S))$. For $i = 0$ the same holds for $partial_(y_0) b -
   partial_(y_0)^(upright("fr")) hat(b)$ in angular $H^2$. On a full wedge obtained by exhaustion,
   $A^(plus.minus 1) \, gamma^(plus.minus 1)$ are uniformly bounded in $H^6$ and $xi_i \,
   a^(- 1) partial_(y_1) b$ in $H^5$, and
#[#set math.equation(numbering: n => "(7.33)")
 $ \| b \|_5 + sum_i \| \( chi_i \, ell_i + kappa \) \|_4 arrow.r 0 \,\
sum_(k = 0)^1
  (\| partial_(y_k) b \|_2 + sum_i \| partial_(y_k) \( chi_i \, ell_i \) \|_2 + \| partial_(y_k) gamma \|_4 + \|
  partial_(y_k) log a + kappa \|_4) arrow.r 0 $ <in:flank>]

 as $s arrow.r oo$ and $\| y_0 \| \, \| y_1 \| arrow.r oo$.
   All displayed quantities are uniformly bounded elsewhere.
   No smallness of the limiting angular metric or rescaled torsion is asserted.]
] <in:pure-jets>

#proof[
  We use the pure transport equations. Set $U_i = cal(L)_i chi_i$ and $V_i = L_i ell_i$. The identities
  #[#set math.equation(numbering: n => "(7.34)")
   $ cal(L)_i xi_j = beta_i + tau_i xi_i \, wide cal(L)_i xi_i = d ell_i - beta_i - tau_i xi_i \,\
L_i K = "div" beta_i - tau_i K \, wide \[ cal(L)_j \, cal(L)_i \] =
  cal(L)_(a \( xi_j - xi_i \)^sharp) $ <in:pure-identities>]
  reduce derivatives of torsion, curvature, and angular connections to already controlled fields.
    Differentiating the cross equations in direction $i$ gives (7.35):
  #[#set math.equation(numbering: n => "(7.35)")
   $ cal(L)_j U_i = - 1 / 2 tau_j U_i + U_i chi_j + chi_j U_i + cal(F)_i \, wide L_j V_i = - U_i dot.op chi_j +
     cal(G)_i . $ <in:pure-top>]
  Neither remainder contains a new pure jet. Differentiating $a$ retains $a$;
    a differentiated angular connection uses $chi_i$ and its angular derivatives;
    and the bracket is an angular operator with an $a$ factor.
    Differentiating unweighted shape products introduces either this factor or a cubic product containing both
    orientations. The strongest angular term is $nabla beta_i$,
    controlled in $H^2$ by the available $H^3$ bound for $beta_i$.
  After subtraction of frozen differentiated fields, the inhomogeneous sources in $H^2$ cost
  $ C { q \( p_(*) + g_i + g_j + sigma_j \) + g_i g_j } \, $
  and the homogeneous coefficient along $j$ is $C \( q + g_j \)$.
    Only a top shape jet times $chi_j$ recurs without a $q$ factor.
    The initial pure jets are obtained from the tangential derivatives in (7.10) and the known cross equations.
    Localized Gronwall along $j$, with the same orientation and cell estimates as above, proves (7.32).
  For the shift write $zeta_xi = xi_1 - xi_0$ and $C_b = a gamma^(- 1) zeta_xi = partial_(y_1) b$.
    The identity (7.36) is
  #[#set math.equation(numbering: n => "(7.36)")
   $ partial_(y_1) partial_(y_0) b =  & a { ell_0 gamma^(- 1) zeta_xi - 2 gamma^(- 1) chi_0 gamma^(- 1) zeta_xi +
     gamma^(- 1) \( 2 beta_0 + 2 tau_0 xi_0 - d ell_0 \) } - \[ b \, C_b \] . $ <in:pure-shift>]
  Every term retains $a$, and no new pure shift derivative appears on the right.
    Its difference source costs $C q \( p_(*) + g_0 \)$ in $H^2$.
    Since the profile depends only on $y_0$, differentiating its frozen pure shift in direction $1$ adds no
    parameter defect. Integration from its tangential/cross initial value proves the shift assertion.
  Summable cell suprema vanish in the corresponding infinite tails.
    Together with (7.3), the point budget therefore gives the first line of (7.33).
    The cross equations give the opposite first derivatives, while (7.32) and (7.36) give the pure ones.
    Converting Lie derivatives to coordinate derivatives uses already controlled $b \, d_theta b$. Finally,
  $ partial_(y_i) gamma = 2 chi_i - cal(L)_(B_i) gamma \, wide partial_(y_i) log a + kappa = ell_i + kappa -
    B_i dot.op d log a . $
  These identities give the remaining $H^4$ limits. The uniform metric, lapse,
    and torsion bounds follow from $P$ and smooth inversion, and $a^(- 1) partial_(y_1) b =
    gamma^(- 1) \( xi_1 - xi_0 \)$ has the asserted $H^5$ bound. ◻
]

=== 7.5 Higher estimates on finite and expanding regions <higher-estimates-on-finite-and-expanding-regions>

We next distinguish two uses of higher regularity. On a fixed finite diamond,
  arbitrary finite bounds suffice to restart the optical development.
  On expanding diamonds, the packet construction requires arbitrarily small exponential rates.
  The first estimate uses no global tails; the second is applied only after the low estimates have been exhausted
  to the full wedge.

#thm([Proposition 21.])[
  (Higher estimates).  #emph[Assume the entry bounds of Proposition 18 and the low estimates on smooth finite past
    diamonds.]
  + #emph[On every fixed finite diamond, all fixed ordinary coordinate derivatives of $gamma^(plus.minus 1) \,
    log A \, b \, a^(- 1) partial_(y_1) b$ have finite bounds depending only on the corresponding smooth initial
    norms, the low bounds, and that diamond.]
  + #emph[If the solution and its uniformly summed low estimates are defined on the full wedge, fix $U in bb(R)$,
    $C > 0$, and either labeling ${ d \, l } = { 0 \, 1 }$. On
#[#set math.equation(numbering: n => "(7.37)")
 $ s gt.eq 0 \, wide y_d lt.eq U \, wide y_l lt.eq C T \, $ <in:high-domain>]

 every fixed ordinary coordinate derivative of $gamma^(plus.minus 1) \, log A \, b \,
   a^(- 1) partial_(y_1) b$ is bounded by $e^(o \( T \))$. The same bounds hold on all restrictions and
   coordinate-path subsegments of this domain.]
  #emph[Neither conclusion requires any higher-order initial norm to be small.]
] <in:higher>

#proof[
  We derive high-order currents and recover the unweighted derivatives from their directional estimates.
    All high variables below are actual fields, not differences from profiles. Put
  $ h_i = C_0 \( q + g_i \) \, wide rho_q = sqrt(q) \, $
  where $C_0$ bounds all required low radiative norms. The functions $h_i$ are bounded and have uniformly bounded
    directional integrals. On a full wedge their tails become arbitrarily small when $s \, \| y_i \| arrow.r oo$.
  Fix an angular order $m gt.eq 5$. In the rest of the proof redefine
  #[#set math.equation(numbering: n => "(7.38)")
   $ Y_i = \| beta_i \|_m \, wide Z_i = sqrt(q) thin \| \( Q_i \, mu_i \) \|_m \, wide
     R_i = \| chi_i \|_(m + 1) \, wide z_i = \| tau_i \/ A \|_(m + 1) \,\
d_0^(*) = D = \| b \|_(m + 1) \, wide d_1^(*) = 0 \, wide P_gamma = 1 + \| gamma \|_(m + 1) \, wide
  P_i = \| xi_j \|_m \, wide P_(*) = P_gamma + P_0 + P_1 . $ <in:high-variables>]
  In particular, $Z_i$ already includes the lapse weight. The quantity $P_(*)$ controls $gamma^(- 1)$ and
    $A^(plus.minus 1)$ at the corresponding angular orders, using the low bounds and $d log A = xi_0 + xi_1$.
  ===== 7.5.1 Angular currents. <angular-currents.>
  The tame sphere Hodge estimates give
  #[#set math.equation(numbering: n => "(7.39)")
   $ R_i lt.eq C_m \( Y_i + z_i + h_i P_(*) \) \, wide \| xi_j \|_(m + 1) lt.eq
     C_m \( Z_i \/ sqrt(q) + P_(*) \) . $ <in:high-hodge>]
  These constants do not contain high coefficient norms. Indeed,
    identify trace-free tensors using smooth $gamma$-dependent bases,
    freeze coefficients in sufficiently small charts, and commute the first-order angular system.
    A highest coefficient placement costs $C_m \| gamma \|_(m + 1) parallel f parallel_(C^1)$;
    interpolation absorbs the penultimate field norm with a constant depending on $m$ and the low bounds.
    In the shape estimate its low factor is $O \( h_i \)$.
  Use the squared paired currents $Y_i^2$ in direction $j$ and $Z_i^2$ in direction $i$,
    keeping their multipliers equal. Add $z_i^2$ and $P_i^2$ in direction $i$, and $D^2 \,
    P_gamma^2$ in direction $1$. Apart from favorable damping,
    their absolute interaction costs are bounded by the following list:
  #[#set math.equation(numbering: n => "(7.40)")
   $ C_m Y_i #scale(x: 120%, y: 120%)[\[] & rho_q \( Z_0 + Z_1 + P_(*) \) + h_j \( Y_i + R_i \) +
     h_i \( R_j + d_j^(*) \) + h_i h_j P_(*) #scale(x: 120%, y: 120%)[\]] \,\
C_m Z_i #scale(x: 120%, y: 120%)[\[] & rho_q \( Y_i + R_i + d_i^(*) + P_(*) \) +
  h_i \( Z_0 + Z_1 \) #scale(x: 120%, y: 120%)[\]] \,\
C_m z_i h_i \( & z_i + R_i + d_i^(*) + h_i P_(*) \) \,\
C_m D #scale(x: 120%, y: 120%)[\[] & rho_q \( Z_0 + Z_1 + rho_q P_(*) \) + h_1 D #scale(x: 120%, y: 120%)[\]] \,\
C_m P_gamma \( & R_1 + h_1 P_gamma \) \,\
C_m P_i \( & Y_i + R_i + d_i^(*) + h_i P_(*) \) . $ <in:high-costs>]
  We derive these costs from the actual equations already displayed.
    Terms with $a$ retain $rho_q$ after pairing, by (7.39); high angular connection placements in $chi * nabla
    chi$ cost $h_i h_j P_(*)$. Shift commutators on $beta_i$ cost $h_j Y_i + h_i d_j^(*)$,
    while those on the weighted fields retain $rho_q$. Metric and area derivatives have coefficient $h_j$ on
    $Y_i^2$ and $h_i$ on $Z_i^2$. The identity $L_i log a = - kappa +
    O \( h_i \)$ supplies the favorable lapse damping. Trace and shift currents follow from (7.26) and (7.15);
    the remaining two currents follow from the metric and torsion transports.
    Thus this actual-field system uses no special values of a Kerr profile.
  ===== 7.5.2 Fixed regions. <fixed-regions.>
  On a diamond $0 lt.eq s lt.eq s_(*)$, substitute (7.39) into (7.40).
    With all current multipliers one, the resulting quadratic form is bounded by $C_m$ times their total size.
    The common weight
  #[#set math.equation(numbering: n => "(7.41)")
   $ e^(- 2 K_(upright("fin")) s) \, wide - L_i log \( e^(- 2 K_(upright("fin")) s) \) = K_(upright("fin")) \,
     wide K_(upright("fin")) > C_m \, $ <in:finite-weight>]
  absorbs the cost in both directions. Removing the weight costs only the fixed factor
    $e^(2 K_(upright("fin")) s_(*))$ on squared energies. The recovery arguments below then give finite bounds for
    every coordinate derivative. For this use extend each scalar envelope $g_i$ by zero outside the coordinate
    projection of the diamond; no spacetime field is extended.
    In particular, no tail assumption enters this fixed-region argument.
  ===== 7.5.3 The two limiting interactions. <the-two-limiting-interactions.>
  For the sharper estimate now assume the full wedge and global summable envelopes.
    When $rho_q = h_0 = h_1 = 0$, the only unsuppressed arrows in (7.40), after substitution of (7.39), are
  $ Y_i \, z_i arrow.r P_i \, wide D arrow.r P_0 \, wide Y_1 \, z_1 arrow.r P_gamma . $
  This first limiting system is not sufficient throughout (7.37):
    the coordinate $y_d$ may remain bounded while $y_l$ tends to infinity, so $h_d$ need not tend to zero there.
    We will instead give the currents flowing along $d$ a large damping on a fixed interval $- B lt.eq y_d lt.eq
    U$. Removing this part of the weight then costs a fixed factor, independent of $T$.
    To identify what the remaining currents must control, consider a second limiting system in which the
    $d$-flowing currents are strongly damped. Those currents comprise
  $ cal(D)_d = { Y_l \, Z_d \, z_d \, P_d } quad upright("and also ") { D \, P_gamma } upright(" if ") d = 1 . $
  The currents flowing along $l$ comprise
  $ cal(L)_l = { Y_d \, Z_l \, z_l \, P_l } quad upright("and also ") { D \, P_gamma } upright(" if ") l = 1 . $
  Delete products containing a variable of $cal(D)_d$ and set $rho_q = h_l = 0$, allowing $h_d$ to remain bounded.
    The only remaining arrows are
  #[#set math.equation(numbering: n => "(7.42)")
   $ z_l arrow.r Y_d \, P_l \, wide z_l arrow.r P_gamma quad upright("if ") l = 1 . $ <in:asymmetric-arrows>]
  Indeed the possible term $h_d d_l^(*)$ either vanishes or contains $D$ flowing along $d$;
    if $D$ remains in $cal(L)_l$, its cost vanishes. The retained $P_l$ source contains $Y_l$,
    which belongs to $cal(D)_d$, and the retained trace cost has factor $h_l$.
    There is consequently no unsuppressed return to $z_l$. Both limiting systems are triangular:
    their surviving interactions can be made as small as desired by rescaling the auxiliary currents.
    The actual equations retain all their terms; these two comparisons only determine the multipliers and the
    directional damping.
  Fix an arbitrarily small $delta_h > 0$. Keep multiplier one on each $Y_i \, Z_i$ pair and on $D^2$,
    multiply $z_i^2$ by $Lambda^2$ with $Lambda$ large, and multiply the $P$ currents by $epsilon.alt_P^2$ with
    $epsilon.alt_P$ small. The resulting size is
  #[#set math.equation(numbering: n => "(7.43)")
   $ cal(E)_m = sum_i \( Y_i^2 + Z_i^2 \) + D^2 + Lambda^2 sum_i z_i^2 +
     epsilon.alt_P^2 \( P_gamma^2 + P_0^2 + P_1^2 \) . $ <in:rescaled-energy>]
  In the scaled variables, the first limiting comparison has coefficients $O \( epsilon.alt_P \)$ or
    $O \( epsilon.alt_P \/ Lambda \)$, and (7.42) has coefficients $O \( h_d \/ Lambda \)$ or
    $O \( epsilon.alt_P \/ Lambda \)$. Choose the rescaling so that both limiting costs are at most $delta_h
    cal(E)_m \/ 4$ in their respective retained groups. The principal paired angular cancellation is unchanged.
    Continuity of the remaining finite quadratic forms gives a threshold $epsilon.alt_(*) >
    0$ such that the full cost is small when $rho_q \, h_0 \, h_1 lt.eq epsilon.alt_(*)$,
    and the cost involving only $cal(L)_l$ is small when $rho_q \, h_l lt.eq epsilon.alt_(*)$.
    This threshold is chosen before the large damping constant below.
  ===== 7.5.4 Directional damping on expanding regions. <directional-damping-on-expanding-regions.>
  Use the common weight
  #[#set math.equation(numbering: n => "(7.44)")
   $ frak(w) = exp { - 2 delta_h \( y_0 + y_1 \) - 2 K_0 \( y_d + B \)_(+) -
     2 K_0 min \( s \, S_0 \) } . $ <in:high-weight>]
  Choose $B \, S_0$ large, independently of $T$, so that for $s > S_0 \, y_d < - B$,
    both $h_i$ and $rho_q$ are below $epsilon.alt_(*)$. For $s > S_0 \, - B lt.eq y_d lt.eq U$, make $h_l \,
    rho_q$ small; this is possible because $y_l = 2 s - y_d gt.eq 2 S_0 - U$.
    Almost everywhere the damping in direction $k$ is
  $ - L_k log frak(w) = 2 delta_h + 2 K_0 upright(bold(1))_({ k = d \, med y_d > - B }) +
    K_0 upright(bold(1))_({ s < S_0 }) . $
  Lipschitz weights suffice. With the rescaling already fixed,
    all remaining interactions have bounded coefficients independent of $K_0 \, T \, B \, S_0$.
    In the asymmetric late region, Cauchy–Schwarz bounds the cross terms by a small multiple of $\|
    cal(L)_l \|^2$ plus a fixed large multiple of $\| cal(D)_d \|^2$.
    Take $K_0$ large enough to absorb the latter. On $s < S_0$ both directions receive the large damping,
    and in the other late region all coefficients are small. The order of choices is therefore
  $ \( Lambda \, epsilon.alt_P \) \, quad epsilon.alt_(*) \, quad \( B \, S_0 \) \, quad K_0 . $
  Increasing $K_0$ changes none of the earlier thresholds.
  The null and $s$ fluxes are bounded by the weighted initial norms.
    On (7.37), $- C T lt.eq y_d lt.eq U$ and $- U lt.eq y_l lt.eq C T$,
    so the initial interval has at most polynomial length. Moreover
  #[#set math.equation(numbering: n => "(7.45)")
   $ 1 gt.eq frak(w) gt.eq e^(- 2 delta_h \( U + C T \) - 2 K_0 \( U + B \)_(+) - 2 K_0 S_0) . $ <in:weight-range>]
  The last two losses are fixed. Initial higher norms are $e^(o \( T \))$ by Proposition 18;
    since $delta_h$ is arbitrary, removing the weight preserves $e^(o \( T \))$. In particular,
  #[#set math.equation(numbering: n => "(7.46)")
   $ sup_(y_j) parallel Y_i + d_i^(*) parallel_(L^2 \( d y_i \)) lt.eq e^(o \( T \)) . $ <in:transverse-flux>]
  For $d_0^(*)$ the current flows along $1$, so this is exactly the required transverse flux in $d y_0$.
  ===== 7.5.5 Recovery without dividing by the lapse. <recovery-without-dividing-by-the-lapse.>
  The estimate for $Z_i$ is not divided by the exponentially small $sqrt(q)$.
    Instead use the damped trace equation, with its $C_m h_i$ homogeneous coefficient integrated along $i$.
    Since that integral is uniformly bounded, integration of the damped trace equation gives
  #[#set math.equation(numbering: n => "(7.47)")
   $ z_i \( y \) lt.eq  & e^(o \( T \)) e^(- kappa \( y_i + y_j \))\
 & + C'_m integral_(- y_j)^(y_i) e^(- kappa \( y_i - y'_i \))
   h_i \( Y_i + d_i^(*) + h_i P_(*) \) \( y'_i \, y_j \) thin d y'_i . $ <in:trace-convolution>]
  The linear norm versions of the metric and torsion currents, (7.46), and this convolution yield
  #[#set math.equation(numbering: n => "(7.48)")
   $ P_(*) \( y \) lt.eq e^(o \( T \)) + C''_m sum_i integral_(- y_j)^(y_i) h_i P_(*) \( y'_i \, y_j \) thin d
     y'_i . $ <in:Volterra>]
  Cauchy–Schwarz on intervals of length $O \( T \)$ costs only a polynomial. There is a bounded common potential
  #[#set math.equation(numbering: n => "(7.49)")
   $ Phi \( y \) = C_0 sum_i integral_(- oo)^(y_i) g_i \( v \) thin d v +
     frac(C_0 q_0, kappa) \( 1 - e^(- 2 kappa s) \) \, wide partial_(y_i) Phi = h_i . $ <in:potential>]
  Multiply (7.48) by $e^(- C Phi \( y \))$ and take a supremum. Along each coordinate path,
  $ integral_(- y_j)^(y_i) h_i \( y'_i \, y_j \) e^(- C \( Phi \( y \) - Phi \( y'_i \, y_j \) \)) thin d y'_i
    lt.eq C^(- 1) . $
  Choosing $C > 4 C''_m$ absorbs the two integrals. Hence $P_(*) \, z_i lt.eq e^(o \( T \))$,
    and (7.39) makes $R_i$ integrable along $i$ at that cost.
    On fixed diamonds the same argument uses the finite flux bound from (7.41) and the zero-extended scalar
    envelopes, giving finite constants.
  The cross transports for $chi_i \, ell_i + kappa$ now give pointwise angular bounds,
    initially through $H^(m - 1)$. Their homogeneous coefficient is $h_j$;
    the terms $q P_(*)$ have the necessary spare angular derivatives,
    and the remaining terms $h_i \( R_j + d_j^(*) \) + h_i h_j P_(*)$ integrate by the bounds just obtained.
    The shift equation gives pointwise angular control through order $m$.
    Since $m$ was arbitrary, every fixed angular order is available.
  ===== 7.5.6 Longitudinal recovery. <longitudinal-recovery.>
  Induct on the number of longitudinal derivatives, retaining arbitrary fixed angular orders.
    Proposition 20 estimated the first pure derivatives at low angular order.
    To start the present induction, commute their equations (7.35) and (7.36) at each fixed angular order.
    Their inhomogeneous terms now have the angular bounds just proved,
    and their initial jets follow from the entry tangential derivatives and the cross equations.
    The top transport coefficient, including the first angular derivative of the shift, is bounded by $C_m h_j$.
    Higher angular derivatives of coefficients multiply lower angular derivatives of the pure jet.
    Induction in angular order therefore bounds the first pure shape jets,
    then the pure lapse jets through their triangular equation, and the pure shift jets.
    This starts the longitudinal induction at every fixed angular order.
  At the next level, differentiation of the cross equations gives transports for $cal(L)_i^k chi_i \,
    L_i^k ell_i$ along $j$. The only new pure jet on the right is the shape jet,
    with homogeneous coefficient $C h_j$; all other terms have lower longitudinal counts.
    This follows from (7.34): a derivative of either torsion uses the torsion equation and $d ell_i$,
    and curvature variation uses $beta_i$. Angular connection variations are expressed by $chi_i$ and its angular
    derivatives. Differentiated brackets are angular and use only previous longitudinal orders.
    Derivatives of $a$ retain its factor.
  The initial pure jets follow from the noncharacteristic initial equations,
    or equivalently from tangential $x$ derivatives and the cross equations.
    Pointwise transport Gronwall uses only $C h_j$, including the first angular derivative of the shift.
    A subsidiary angular induction assigns higher coefficient derivatives to already controlled factors.
    Integration over length $O \( T \)$ of an $e^(o \( T \))$ source is still subexponential.
    Mixed longitudinal derivatives reduce to the cross equations and the angular commutators.
  Finally recover ordinary derivatives of the shift from (7.15).
    Pure $partial_(y_0)^k b$ is integrated in $y_1$; after converting Lie derivatives to coordinate derivatives,
    its source contains the shift only at preceding longitudinal orders.
    The other derivatives are direct, and $a^(- 1) partial_(y_1) b = gamma^(- 1) \( xi_1 - xi_0 \)$ is algebraic.
    The same recovery with finite bounds proves the first assertion, and with (7.45) proves the second. ◻
]

=== 7.6 Continuation and exchange of the null labels <continuation-and-exchange-of-the-null-labels>

We now construct the full wedge. Only the fixed-region part of Proposition 21 is used for continuation.
  Once the wedge exists, its global low envelopes supply the tails required for the subexponential conclusion.

#thm([Proposition 22.])[
  (Continuation from the full cylinder).  #emph[The smooth vacuum cylinder data of Proposition 18 have a smooth
    development on the full product wedge ${ s gt.eq 0 } times bb(R)_x times bb(S)^2$ in the gauge (7.1).
    It satisfies Propositions 19, 20, and both conclusions of Proposition 21.
    With a sufficiently small past collar, $cal(S)$ is a Cauchy surface for this development.
    The construction does not identify this region with the whole maximal globally hyperbolic development.]
] <in:continuation>

#proof[
  Start with smooth vacuum Cauchy evolution near $cal(S)$ and solve the noncharacteristic optical and angular
    transport equations there. We continue by exhaustion and finite restarts.
    For a target compact subdiamond work on a slightly larger region
  $ 0 lt.eq s lt.eq s_(*) \, wide y_i lt.eq C_i - alpha s \, $
  where $alpha > 0$ is small and the constants $C_i$ leave positive slice length and a fixed margin around the
    target. The tilted sides are strictly exiting, so all previous past-cap energies retain their flux signs.
  Bootstrap the uniform low estimates. The common finite weight (7.41),
    followed by the recovery part of Proposition 21, bounds every fixed smooth norm up to a putative terminal
    time. Since $s$ is bounded here, $a = q_0 e^(- 2 kappa s) A$ has a positive lower bound;
    the lapse and spatial metrics remain uniformly nondegenerate.
  Restart from a slice before the alleged terminal time. Extend its induced metric and second fundamental form
    smoothly across the interval endpoints, preserving positivity and bounded requisite finite Sobolev norms on an
    enlarged margin. Constraints are unnecessary outside that margin.
    A reduced wave Einstein equation, initialized in wave gauge,
    has a uniform short existence time from these bounds. Solve the optical and angular transport equations with
    their inherited initial values. Their transversality and invertibility on a smaller margin also persist for a
    uniform short time. Higher smooth norms propagate separately.
  Restrict to the exiting region. Future causal vectors obey $d y_i gt.eq 0$ in this gauge,
    so data outside the margin cannot enter the region under consideration.
    Constraint and gauge propagation give vacuum there. Geometric uniqueness,
    followed by uniqueness of the optical functions and angular transport,
    identifies the restarted and previous solutions. Slightly larger diamonds supply the endpoint jets and margins
    for each restart, patchwise on the sphere. Thus no finite terminal time occurs on a compact target diamond.
  Exhaustion gives the full smooth product wedge. Increasing-domain suprema and their cell sums preserve the
    uniform low bounds and define global summable envelopes $g_i$.
    Only now use their tails in the $B \, S_0$ choices of (7.44);
    this proves the expanding subexponential bounds without circularity.
  Finally $s$ is temporal. Causality in (7.1) implies $\| d x \/ d s \| lt.eq 1$,
    and angular speeds are bounded on compact $\( s \, x \)$ ranges.
    A past causal curve from the wedge therefore reaches $cal(S)$ or has an ordinary limit where it continues;
    it cannot escape at finite decreasing $s$. Choose a local past collar of possibly varying smooth thickness in
    $x$, with sufficiently small Lipschitz slope within the local existence region.
    Future causal curves in that collar reach the cylinder before leaving it.
    The cylinder is consequently Cauchy for this development,
    which can be attached along all of $cal(S)$ by geometric Cauchy uniqueness. ◻
]

#thm([Lemma 23.])[
  (The same wedge with exchanged labels).  #emph[The two optical labels may be exchanged while retaining the same
    initial cylinder and the same product spacetime. In the corresponding one-shift angular gauge,
    all conclusions of Propositions 18–22 remain valid, with the same common $kappa$ and with a frozen physical
    profile depending only on the new $y_0$.]
] <in:label-swap>

#proof[
  Negate the prepared $x$ on $cal(S)$, including its bounded joins.
    The old optical functions exchanged have the required eikonal initial data,
    so optical uniqueness identifies them with the new pair. For the angular labels use the exact preparation that
    eliminates the new second shift. In the existing geometry, transport these labels along the old $L_0$.
    At every finite point this is a finite-duration smooth flow on a compact sphere over a finite coordinate
    interval, hence a sphere diffeomorphism with smooth inverse.
    It defines the new angular chart on the same full wedge before any uniform estimate on that flow is assumed.
  To verify the initial comparison, reverse $T_K \, phi$ simultaneously at both ends, keep $Q$, and use $- I \, -
    I_(upright("rot"))$ with the new transport map $H$ and the corresponding bounded angular joins.
    Thus the surface $s = 0$ is unchanged and its prepared $x$ is exactly negated.
    Use the reversed $I$ to define a single physical parameter profile along the new $y_0$.
    The exact profile estimates and the trace proof of Proposition 18 apply with this other frozen angular map.
    Apply the finite-diamond a priori estimates to the new fields and exhaust.
    This reestablishes all uniform low and subexponential high bounds on the same spacetime,
    without requiring an a priori uniform estimate for the long angular coordinate change. ◻
]

== 8 The comparison development and finite geodesic runout <sec:comparison>

The preceding estimates describe two exterior evolutions and a double-null interior evolution.
  We now place them in a single vacuum development containing the complete initial bridge.
  We then prove two geometric facts needed for the perturbation argument:
  a geodesic of finite future proper duration first leaves this comparison development through an interior branch
  or corner, and an open family containing a regular exiting geodesic contains a branch geodesic.
  The comparison development will be an open subspacetime of the full maximal globally hyperbolic development;
  we never assert that it exhausts that development.

Throughout the section the Kerr center is fixed, with $0 < frak(a) < M$.
  All depths, finite overlap regions, and constants are chosen for this center before the final $p_10$ smallness
  threshold. We first construct a finite Cauchy range around the bridge and use its overlap collars to attach the
  late exterior and interior pieces. We then control geodesic energy through compact and far exterior excursions,
  which rules out finite proper-time runout there. Finally,
  the interior geodesic equations distinguish branch and corner runout and let us perturb a regular corner track
  to a branch.

=== 8.1 Finite Cauchy ranges and the complete bridge <finite-cauchy-ranges-and-the-complete-bridge>

We use the signed Killing-time-zero bridge in the two-ended Boyer–Lindquist extension through the bifurcation
  sphere. Simultaneous reversal of the Killing and axial conventions allows either prescribed future orientation.
  Write $T_K$ for a continued Killing coordinate and $T_e =
  plus.minus T_K$ for the future-oriented exterior time at an end. Recall

$ Delta = r^2 - 2 M r + frak(a)^2 \, wide r'_(*) = frac(r^2 + frak(a)^2, Delta) \, wide kappa_(+) =
  frac(r_(+) - r_(-), 2 \( r_(+)^2 + frak(a)^2 \)) > 0 . $

In Cartesian coordinates at either end the reference bridge has $h_(*) - delta =
  O \( r^(- 1) \)$ and connection coefficients $O \( r^(- 2) \)$,
  with the corresponding differentiated symbol bounds. Consequently, at every fixed order,
  its covariant weighted seminorms are equivalent to the ordinary component symbol seminorms.
  On compact sets they control the usual local norms. No asymptotic coefficient of the actual datum is fixed by
  this identification.

Fix first the profile depth $q_0$ and common inner rate $kappa > 0$ from Section 7.
  The exact initial interior cylinder $cal(S)_(*) = { Q = q_0 } = { s = 0 }$ is a graph strictly above $r_(-)$.
  Choose the computing boundary $r_b$ strictly below this graph in radial value,
  with margins on both sides and $r_b > r_(-)$. The metric dual of $d s$ is past timelike;
  the future side of $cal(S)_(*)$ is its smaller-radius side.

At each end use the horizon-crossing time

#[#set math.equation(numbering: n => "(8.1)")
 $ t_e = T_e + r_(*) - G \( r \) . $ <cmp:bent-time>]

Here $G' = 1$ through the fixed interior and trapping ranges, $1 lt.eq G' lt.eq r'_(*)$ in an exterior transition,
  and $G = r_(*)$ near infinity. Ordinary ingoing angular coordinates are used at the corresponding future outer
  horizon. The temporal sign was established in the geometric construction; explicitly,

#[#set math.equation(numbering: n => "(8.2)")
 $ #scale(x: 120%, y: 120%)[\(] r^2 + frak(a)^2 cos^2 theta.alt #scale(x: 120%, y: 120%)[\)]
   g_K^(- 1) \( d t_e \, d t_e \) = - 2 \( r^2 + frak(a)^2 \) G' + Delta \( G' \)^2 +
   frak(a)^2 sin^2 theta.alt < 0 . $ <cmp:temporal-sign>]

For $G' = 1$ the right side is $- r^2 - 2 M r - frak(a)^2 cos^2 theta.alt$;
  convexity gives the sign in the exterior transition.

Moving that transition outward makes $G - r_(*)$ arbitrarily positive at each fixed inner radius,
  since the exterior integral of $r'_(*) - 1$ diverges logarithmically.
  Moreover $G - r_(*) gt.eq 0$ outside, and $\( G - r_(*) \)' = 1 - r'_(*) > 0$ between the horizons where $G' =
  1$. Thus the two partial slices $t_e = 0$ lie to the future of the bridge, or on it,
  and agree with it near their respective infinities. Their portions through the chosen depth are separated with a
  fixed margin in $T_K$, including their subsequent nonnegative-time sides before that depth.
  Choose the delay so that the bounded matching bands required at the two ends of $cal(S)_(*)$ are disjoint.

#thm([Lemma 24.])[
  (Finite bridge evolution).  #emph[Fix the depths and delayed slices just described,
    together with bounded forward matching bands on them. After enlarging these fixed regions,
    there is a finite vacuum Cauchy development of every sufficiently $p_10$-small datum on the complete bridge
    which contains the two delayed slices and the matching bands, as well as a past collar of the whole bridge.
    On the delayed slices the induced data are small at metric order $H^10$ and second-form order $H^9$ on compact
    sets, and retain the prescribed symbol bounds at the ends. The artificial future cuts are strict future exits.
    Higher fixed smooth norms are finite, without an additional smallness hypothesis.]
] <cmp:finite-range>

#proof[
  We first construct a suitable exact Kerr range. Starting at the bridge,
    cut in the future at a radius strictly smaller than $r_b$ but larger than $r_(-)$, and at $t_e =
    L$ on both ends, where the fixed number $L$ is large enough to leave all required bands and margins.
    In the trapped region impose both time inequalities. At either future outer horizon its own time coordinate is
    regular and the opposite time inequality is automatic. Every active cut is a spacelike future exit.
    We construct on a slightly larger range and restrict only afterward.
  For completeness, the causal control of this exact finite range is as follows.
    In the trapped block, $r$ increases strictly to the past. The Boyer–Lindquist cone inequality gives
  #[#set math.equation(numbering: n => "(8.3)")
   $ lr(|frac(d T_K, d r)|) lt.eq
     frac(sqrt(\( r^2 + frak(a)^2 \)^2 - Delta frak(a)^2 sin^2 theta.alt), \| Delta \|) . $ <cmp:bl-cone>]
  This follows by Cauchy–Schwarz on the positive directions tangent to an $r$ level.
    Near $r_(+)$ the right side is $\| r'_(*) \| + O \( 1 \)$, so the derivatives of both $r_(*) +
    T_K$ and $r_(*) - T_K$ are bounded above in the past-directed radial parameter.
    The positive interior Kruskal variables
  $ U_(+) = e^(kappa_(+) \( r_(*) + T_K \)) \, wide V_(+) = e^(kappa_(+) \( r_(*) - T_K \)) $
  therefore have finite nonnegative limits. Indeed each logarithm becomes monotone after subtracting a bounded
    multiple of $r$ and hence has a limit in $\[ - oo \, oo \)$.
  The angular squares in the Kerr metric control $d theta.alt$ and $sin
    theta.alt \( \( r^2 + frak(a)^2 \) d phi - frak(a) thin d T_K \)$.
    Replacing $frak(a) \/ \( r^2 + frak(a)^2 \)$ by its horizon value shows that the round speed of the corotating
    angle is $O \( \| Delta \|^(- 1 \/ 2) \)$ in the radial parameter, an integrable bound.
    Together with $U_(+) \, V_(+)$ this gives a finite point in regular outer horizon coordinates.
    To check regularity directly in the Boyer–Lindquist expression, $r -
    r_(+)$ is a signed product $U_(+) V_(+)$ times a smooth nonvanishing factor; after corotation,
    the mixed $d T_K$–angular coefficients are $O \( Delta \)$,
    and the sum of the $d T_K^2$ and $d r_(*)^2$ coefficients is $O \( Delta^2 \)$.
    Substitution therefore gives the smooth nondegenerate horizon metric, up to a smooth angular-coordinate adjustment.
  A past causal continuation at this horizon either follows its generator toward the bifurcation sphere or enters
    the corresponding exterior. There $T_e$ decreases toward its bridge value zero.
    The exterior radial causal-speed bound is $O \( r - r_(+) \)$ near the horizon and is bounded at infinity.
    A curve starting strictly outside cannot reach the horizon or spatial infinity in its bounded remaining $T_e$
    interval. Ordinary continuation at a finite interior endpoint then carries it to the bridge.
    The same argument applies in bounded interior radial ranges.
  At bounded spatial radius, the two time cuts give compact closure in regular coordinates.
    Compact subsets have compact causal shadows toward the bridge;
    far out only bounded-time propagation with bounded speed is involved.
    Adding a short open past collar gives an exact Cauchy range with all the stipulated margins.
    The boundary signs require only fixed subextremality.
  Apply finite-time vacuum Cauchy stability in wave-map coordinates on an enlargement of this range.
    For compact portions include their compact causal shadows.
    The $p_10$ bound supplies small $H^10 times H^9$ geometric data there.
    The positive wave-energy flux across a fixed uniformly spacelike bent surface,
    after commutation through order nine, controls tangential metric derivatives through ten and normal first-jet
    derivatives through nine. Thus these Cauchy orders are obtained by a spacelike flux estimate,
    without a graph-restriction loss at the highest derivative.
    Forming the induced metric and second fundamental form uses exactly those orders.
    At infinity the bent slices are the original ends; uniformly local end charts, bounded propagation speeds,
    and uniqueness on overlaps give the corresponding finite-time control there.
    All higher symbol seminorms remain finite.
  The spacelike signs persist by low-order closeness. Past curves cannot leave through the artificial future cuts.
    The smooth Cauchy temporal function on the exact globally hyperbolic development is supplied by Bernal–Sánchez
    #cite(label("BernalSanchez2005")) Theorem 1.1. On a fixed bounded-radius enlargement it remains temporal with
    a uniform margin for the perturbed metric. In the far part the exterior times are temporal,
    speeds are bounded, and the time to the bridge is bounded.
    An excursion from a fixed bounded radius can therefore travel only a fixed additional distance.
    Enlarge the compact temporal-function region beyond that distance and handle curves entirely far out in
    exterior time. The resulting coordinate-length bounds preclude an inextendible endpoint inside these bounded
    ranges. The short past collar is handled by the same bounded-geometry construction:
    every future-inextendible causal curve there crosses the bridge.
    These are all fixed finite-time choices, independent of any later entry or experiment time. ◻
]

#thm([Proposition 23.])[
  (The comparison development).  #emph[There is a single sufficiently small $p_10$ neighborhood such that,
    for each datum $d$ in it, the preceding exterior and interior solutions assemble with the finite bridge
    evolution into a smooth time-oriented vacuum development $cal(P)_d$ with the complete bridge $Sigma$ as a
    Cauchy surface. It contains an entire spacelike cylinder $cal(S) tilde.eq bb(R) times
    bb(S)^2$ carrying the entry data of Section 7, followed by its full product double-null wedge.
    There is a time-orientation-preserving open isometric embedding $cal(P)_d arrow.r.hook
    M_d$ into the full MGHD of $d$.]
] <cmp:development>

#proof[
  Evolve the two exterior problems from the geometric data on $t_e = 0$.
    Choose a fixed matching time $t_a > 1$ inside the finite range of Lemma 24.
    An enlarged band about $t_e = t_a$ reaches slightly deeper than every cylinder intersection that will be used.
    Both evolutions are vacuum on the overlapping domains.
  We describe the identification because its regularity is needed at $cal(S)$.
    Solve a wave map from the exterior evolution into the finite evolution with the initial slice identification
    and matching unit normals. On the fixed earlier slab and matching band it is close to the identity,
    with a strict deeper outflow margin and uniform control at infinity.
    Pulling the target metric back by this map gives matching initial first jets:
    the metric values agree, the second fundamental form fixes the normal evolution of the spatial components,
    and the relative wave-map condition fixes the remaining normal derivatives.
    The two metrics then solve the reduced wave equations with a common target.
    Ordinary uniqueness on the enlarged domain, with the exiting boundary signs,
    proves that the map is an isometry on the required smaller region.
  The fixed-time map has $H^10$ wave control on compact sets.
    After differentiating its equation, the Christoffel terms need derivatives through nine.
    Composing the target coefficients with the map costs their through-nine spacetime norms on enlarged sets times
    bounded composition constants under the $H^10$ bootstrap.
    This follows from Leibniz and interpolation estimates, bounded low derivatives and inverse Jacobian,
    and change of variables. Smooth background compositions cost the map difference.
    The resulting spacetime $L^2$ terms have finite-time $L^1$ bounds;
    current-order terms are treated by Gronwall. The metric order-ten estimates therefore give the required
    smallness for the map and, after straightening the finite coordinates near the actual matching face,
    at least spacetime $H^9$ closeness through the join. Cut off this small coordinate change farther back.
    Uniformly local end estimates give the same low diffeomorphism control near infinity.
    An embedding on the smaller region follows from $C^1$ closeness and the fixed margins.
    Only a fixed finite interval is involved in this gauge comparison.
  In these identified charts join the two prepared end portions of $cal(S) = { s =
    0 }$ to the central preparation within the bounded overlaps.
    Use small smooth interpolations, implemented by small vector fields for angular maps.
    The radial positions of the instantaneous $Q = q_0$ graphs stay uniformly close to the exact graph even at
    late times; the instantaneous profile comparison does not introduce an accumulated angular error in this
    assertion. In the bounded joining regions the integrated phases, with their fixed constants,
    are close as well. The timelike conormal and sphere-transversality margins persist.
  Retain the finite future piece below $cal(S)$, with both cuts $t_e lt.eq t_a$,
    and attach each late exterior piece $t_e gt.eq t_a$ below $cal(S)$.
    The deeper computing boundaries are discarded; all joins lie strictly before them.
    The agreement bands contain the necessary cylinder neighborhoods.
    We identify the same hypersurfaces in common straightened coordinates, not unequal coordinate-time levels.
    This constructs the whole cylinder with the entry estimates already proved.
    Across it, geometric Cauchy uniqueness identifies the double-null solution with matching induced data,
    using optical coordinates in local collars.
  The resulting topology retains disjoint interiors and identifies common closed matching faces,
    with the common collars providing charts. We do not retain two open future continuations of the same face.
    The faces are closed on their respective matching sides and have no extra finite accumulation points,
    since late end parameters have unbounded end times. Each identification is a homeomorphism.
    At a corner of the joining prescription, first identify the two lower charts and then cross $cal(S)$.
    These product neighborhoods give a Hausdorff smooth manifold,
    together with the original charts and the open past collar.
  It remains to check the Cauchy property for the complete bridge. In the wedge, write
  $ s = frac(y_0 + y_1, 2) \, wide x = frac(y_1 - y_0, 2) . $
  Along past causal curves $s$ decreases and $\| d x \/ d s \| lt.eq 1$;
    angular speeds are bounded on bounded coordinate ranges. Such a curve reaches $cal(S)$ or has an ordinary
    interior continuation before doing so. In a late exterior part, $t_e$ decreases with finite-time speed bounds.
    The sign of $cal(S)$ excludes a past exit there, so the curve proceeds into the finite block.
    Its remaining passage to $Sigma$ is controlled by Lemma 24.
    Curves in the past collar reach $Sigma$ to the future, and a crossing of $Sigma$ has only the prescribed
    orientation. Thus every inextendible causal curve meets $Sigma$ exactly once.
    The vacuum MGHD theorem supplies the stated open embedding, which we use henceforth as an identification. ◻
]

The construction has now placed all of our estimates inside $M_d$.
  The next objective is to locate the first departure of a finite-duration geodesic from $cal(P)_d$.
  This requires proper-time control, since bounded spacetime coefficients alone do not bound a geodesic’s boost.

=== 8.2 Compact exterior excursions <compact-exterior-excursions>

Consider one exterior end, with time $t = t_e$ and co-moving spatial coordinates $y$.
  On any fixed compact cylinder containing the matching interface, the mixed exterior estimates give a majorant

#[#set math.equation(numbering: n => "(8.4)")
 $ parallel g - overline(G)_(p \( t \) \, c \( t \)) parallel_(C^1) + \| p' \( t \) \| + \| c' \( t \) \| lt.eq
   rho_c \( t \) \, wide rho_c in L^1 \( \[ 0 \, oo \) \) . $ <cmp:compact-integrable>]

The low errors are uniformly small and the parameters remain small.
  The integrability follows by mixed Sobolev embedding and Cauchy–Schwarz with the static weight $A_S > 1$.
  Constants in (8.4) are independent of the starting time and duration of an excursion.

Let $U$ be a future unit geodesic tangent. Put $dot(t) = d t \( U \) > 0$, $V = U \/ dot(t)$,
  and use a prime for differentiation along the track with respect to $t$.
  Normalized causal velocities $V$ are bounded on fixed compact cylinders. Define

$ T_(upright("co")) = partial_t \|_y \, wide E = - g \( T_(upright("co")) \, U \) \, wide P =
  g \( Phi_(p \, c) \, U \) \, $

where $Phi_(p \, c)$ is the axial Killing field of the instantaneous exact Kerr reference.
  The deformation identity and frozen stationarity and axisymmetry yield

#[#set math.equation(numbering: n => "(8.5)")
 $ \| E' \| + \| P' \| lt.eq C rho_c \( t \) dot(t) . $ <cmp:energy-momentum>]

The time derivative of $Phi_(p \, c)$ is included in the parameter cost.

#thm([Lemma 25.])[
  (Compact excursions).  #emph[For a future unit timelike geodesic which is inextendible in $cal(P)_d$ and never
    crosses $cal(S)$, every portion $\[ t_1 \, t_2 \]$ inside a fixed sufficiently large co-moving radius satisfies
#[#set math.equation(numbering: n => "(8.6)")
 $ dot(t) \( t \) lt.eq C dot(t) \( t_1 \) \, wide t_1 lt.eq t lt.eq t_2 \, $ <cmp:compact-speed>]

 with $C$ independent of its duration and of the number of visits to the outer-horizon strip.
   If the portion starts and ends at an interface where $T_(upright("co"))$ is uniformly future timelike, then
#[#set math.equation(numbering: n => "(8.7)")
 $ E \( t_2 \) lt.eq E \( t_1 \) exp (C integral_(t_1)^(t_2) rho_c \( t \) thin d t) . $ <cmp:return-energy>]

 In particular, there is no fixed multiplicative loss at each return.]
] <cmp:compact-excursions>

#proof[
  We first control the horizon strip. Let $H$ be the future outer-horizon generator of the base metric $b$,
    normalized by its Killing parameter, so $nabla_H H = kappa_(+) H$.
    Choose a stationary axially invariant future timelike field $N_0$ there. Invariance gives
  $ b \( nabla_H N_0 \, H \) = - kappa_(+) b \( N_0 \, H \) > 0 . $
  At the horizon, $d r_K \( V \) lt.eq 0$ for normalized future causal vectors,
    with equality only on the generator; here $r_K$ denotes the reference Kerr radius.
    Multiplying $N_0$ by $e^(K_0 \( r_K - r_(+) \))$ adds
  $ 2 K_0 e^(K_0 \( r_K - r_(+) \)) d r_K \( V \) b \( N_0 \, V \) $
  to its deformation form. This is positive off the generator.
    Compactness of normalized causal directions, followed by continuity,
    gives a fixed strip and a stationary future timelike field $N_H$ on it for which
  #[#set math.equation(numbering: n => "(8.8)")
   $ \( cal(L)_(N_H) b \) \( V \, V \) > c_(*) > 0 . $ <cmp:redshift>]
  The strict sign and timelikeness persist for $g$. Hence $-
    g \( N_H \, U \) asymp dot(t)$ is nonincreasing during each visit to this strip.
  Below a smaller interior-side level, $d r_K \( U \) \/ dot(t) < - c$ all the way to $cal(S)$.
    A geodesic continuing while avoiding $cal(S)$ cannot enter this region:
    it cannot return through the level and would reach $cal(S)$ in bounded $t$.
    Outside the strip on the exterior side, stationary energy together with angular momentum controls the
    normalized velocity. Indeed in exact Kerr
  $ b
    (partial_T + frac(frak(a), r^2 + frak(a)^2) partial_phi \, partial_T + frac(frak(a), r^2 + frak(a)^2)
    partial_phi) = - frac(Delta \( r^2 + frak(a)^2 cos^2 theta.alt \), \( r^2 + frak(a)^2 \)^2) < 0 . $
  On the fixed exterior compact range the coefficients are bounded and the timelike margin is uniform,
    also at the axis. Transferring this combination to each nearby frozen chart and then perturbing gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ dot(t) lt.eq C \( \| E \| + \| P \| \) . $ <cmp:momentum-control>]
  Thus no timelike-Killing-field assumption is made inside the ergoregion.
  Set $X_1 = \| E \( t_1 \) \| + \| P \( t_1 \) \|$ and
  $ B \( t \) = X_1 + C integral_(t_1)^t rho_c \( v \) dot(t) \( v \) thin d v . $
  If the portion starts in the strip, include its initial $N_H$ energy in $X_1$.
    Outside the strip, (8.5) and (8.9) give $dot(t) lt.eq C B$.
    Within the strip, its nonincreasing $N_H$ energy bounds $dot(t)$ by the value at the initial point or latest
    strip entry. Using a fixed overlap of the two control regions and the monotonicity of $B$,
    the same bound holds there. Consequently $B' lt.eq C rho_c B$, and Gronwall proves (8.6),
    with one majorant for all strip visits.
  At the large interface $X_1 lt.eq C E \( t_1 \)$. Integrating the $E$ equation itself now gives
  $ E \( t_2 \) lt.eq E \( t_1 \) [1 + C_0 (e^(C integral_(t_1)^(t_2) rho_c) - 1)] lt.eq
    E \( t_1 \) e^(C' integral_(t_1)^(t_2) rho_c) . $
  This proves the return estimate (8.7). ◻
]

=== 8.3 Integrability along far portions <integrability-along-far-portions>

We next bound the geodesic energy between compact excursions.
  In the far lab coordinates $\( t \, z \)$ recall the emitter variables

$ t = q + r \, wide z = C_e \( q \) + r n \, wide \| n \| = 1 \, wide k = 1 - C'_e \( q \) dot.op n \, $

and the field

$ T_l = partial_t \|_z \, wide D = T_l + s_s dot.op partial_z \, wide g = B + h \, wide psi = D h . $

In this subsection $q$ is retarded time and $r$ is emitter radius; neither is an interior optical variable.
  The emitter speed is small, and $k$ is bounded above and away from zero.
  Interpolate from $T_(upright("co"))$ near the compact interface through a fixed overlap to $D$ far out,
  obtaining a uniformly future timelike field $Z_K$ outside the interface.
  Its difference from either prescribed field on the overlap, with first derivatives,
  has an integrable parameter cost. Define $E_K = - g \( Z_K \, U \) asymp dot(t)$. The deformation identity gives

#[#set math.equation(numbering: n => "(8.10)")
 $ \| \( log E_K \)' \| lt.eq C \| \( cal(L)_(Z_K) g \) \( V \, V \) \| . $ <cmp:outer-energy>]

#thm([Lemma 26.])[
  (Outer track integrability).  #emph[Along any one future unit timelike geodesic which is inextendible in
    $cal(P)_d$, eventually proceeds in this end, and never crosses $cal(S)$,
    the right side of (8.10) is integrable over all its outer portions,
    including arbitrarily many returns to the compact interface.]
] <cmp:outer-integrability>

#proof[
  We prove separately the integrability of the averaged target terms and of the field contraction.
    Besides $psi \( V \, V \)$ and the already integrable overlap errors,
    the deformation cost is bounded by $C \( \| D B \| + \| partial s_s \| \)$.
    Write $x_(upright("av"))$ for the implicit averaging position, defined by $x_(upright("av")) = z +
    lambda_s \( t \, x_(upright("av")) \)$. The target construction gives $D x_(upright("av")) = 0$,
    averaging scale $d \( x_(upright("av")) \) = \| x_(upright("av")) \|$, and delays in $\( 0 \, 1 \/ 10 \)$.
    Consequently
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| D B \| + \| partial s_s \| lt.eq frac(C, \| x_(upright("av")) \|)
     integral_(t - \| x_(upright("av")) \| \/ 10)^t \| p' \( v \) \| thin d v . $ <cmp:averaged-cost>]
  Along every late outer portion of this fixed track, $\| x_(upright("av")) \| lt.eq 2 t$ and $r lt.eq C t$,
    uniformly over repeated visits. Indeed the far lab speed is at most $1 +$ a small constant.
    At entry from bounded co-radius one has $\| z \| lt.eq O \( 1 \) + epsilon.alt' t$,
    and past sampling gives $x_(upright("av")) - z = O \( epsilon.alt' t \)$ for small drift $epsilon.alt'$.
    Starting from any fixed finite point changes only a bounded initial time interval.
    The averaging interval in (8.11) therefore lies at times comparable to $t$.
    If $cal(M)$ is the one-dimensional maximal operator, extending $p'$ by zero before startup gives the bound
  $ C chevron.l t chevron.r^(- A \/ 2) cal(M) #scale(x: 120%, y: 120%)[\(] chevron.l dot.op chevron.r^(A \/ 2) \|
    p' \| #scale(x: 120%, y: 120%)[\)] \( t \) . $
  The acceleration belongs to weighted $L_A^2$, and $A = 1.36 > 1$.
    The $L^2$ maximal inequality and Cauchy–Schwarz prove integrability.
  For the field contraction, first consider $t gt.eq C_1 r$ with $C_1$ large and fixed.
    Here even the spatial supremum of $psi$ is integrable. We include the trace argument to justify evaluation on
    a geodesic. On a radial shell $R lt.eq r lt.eq 2 R$, use $𝜚 = log r$.
    The strong bulk bounds through two angular rotations, with the comparisons $W_P gt.eq
    c R^0.26 t^A$ and $w_(P \, j) gt.eq c R^(- 0.03) t^A$, imply
  #[#set math.equation(numbering: n => "(8.12)")
   $ integral_(C_1 R)^oo t^A parallel psi parallel_(L_𝜚^2 H_omega^2)^2 thin d t & lt.eq C R^(- 0.26) sans(F)^2 \,\
integral_(C_1 R)^oo t^A parallel partial_𝜚 psi parallel_(L_𝜚^2 H_omega^2)^2 thin d t & lt.eq
  C \( R^0.03 + R^(- 0.26) \) sans(F)^2 . $ <cmp:trace-field>]
  The norms use a slightly enlarged shell, and $C_1$ is increased if necessary to put all of it in the same
    timelike region. To see the derivative count, with $S = r \( partial_t + n dot.op partial_z \)$ one has $r
    partial_(r \| t \, n) = S - r partial_q$. Good and full derivatives of $r psi$ control the two terms,
    while the field term accounts for differentiating $r$. Two rotations and one derivative lie strictly within
    the strong commutation budget.
  The Hilbert-valued multiplicative one-dimensional trace inequality and $H^2 \( bb(S)^2 \) arrow.r.hook
    L^oo \( bb(S)^2 \)$ now give
  #[#set math.equation(numbering: n => "(8.13)")
   $ integral_(C_1 R)^oo t^A sup_(R lt.eq r lt.eq 2 R \, omega) \| psi \|^2 thin d t lt.eq
     C (R^(- 0.26) + R^(- \( 0.26 - 0.03 \) \/ 2)) sans(F)^2 lt.eq C R^(- 0.115) sans(F)^2 . $ <cmp:trace-supremum>]
  The shell sum converges. Cauchy–Schwarz in time, using $A > 1$, yields
  #[#set math.equation(numbering: n => "(8.14)")
   $ integral_1^oo sup_(R_0 lt.eq r lt.eq t \/ C_1 \, omega) \| psi \( t \, r \, omega \) \| thin d t < oo .
     $ <cmp:timelike-cone-integral>]
  The radial loss $0.03$ still leaves a strictly negative trace power, which is the margin needed for the shell sum.
  On the remaining late outer portions $r asymp t$. Set $c_3 = 0.01$.
    The point estimates and differentiated gauge identity give
  #[#set math.equation(numbering: n => "(8.15)")
   $ \| psi \| & lt.eq C r^(- 1 + e \/ 2) chevron.l q \/ r^(delta_f) chevron.r^(- A_H \/ 2) \, wide \| g -
     eta \| lt.eq C r^(- 1 + c_3) \,\
\| psi \( L \, L \) \| + \| psi \( L \, e_(upright("scr")) \) \| & lt.eq C r^(- 2 + c_3) \, $ <cmp:far-point>]
  where $L = \( 1 \, n \)$, $e_(upright("scr"))$ is a spatial unit screen vector orthogonal to $n$,
    and the far exponents satisfy $nu = 10 delta_f$, $e = 0.1 delta_f$.
    We recall why the improved projections apply to $psi$. For $p =
    T_l h$ and the flat null covector $ell_n = \( 1 \, - n \)$, put
  $ cal(C)_beta \( p \) = ell_n^alpha (p_(alpha beta) - 1 / 2 eta_(alpha beta) "tr"_eta p) . $
  Since $ell_n^sharp = - L$, contraction against $L$ or a screen vector has no trace term and equals respectively
    $- p_(L L)$ or $- p_(L thin upright("scr"))$. The far gauge estimate bounds these by good derivatives,
    coefficient-suppressed full derivatives, and smaller field and target terms.
    Good derivatives cost $O \( r^(- 2 + 2 eta_(*)) \)$; a product of $h$ with a full derivative can cost
    $O \( r^(- 2 + 2 eta_(*) + e \/ 2) \)$. The fixed choice $c_3 = 0.01$ absorbs these losses,
    giving the stated $O \( r^(- 2 + c_3) \)$ bound. Passing from $T_l h$ to $psi$ uses
  $ psi = \( 1 - s_s dot.op n \) T_l h + r^(- 1) s_s^d b_d Z h \, $
  with the bounded angular/radial decomposition coefficients $b_d$ of the far construction.
    It adds only good derivatives. Thus no derivative of an unsmoothed velocity is used in this conversion.
  Write $V = \( 1 \, upright(bold(v)) \)$ on the track. Differentiating the emitter identity and using causality gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ k q' & = 1 - upright(bold(v)) dot.op n \,\
q' & gt.eq - C r^(- 1 + c_3) \,\
\| upright(bold(v)) - \( upright(bold(v)) dot.op n \) n \|^2 & lt.eq C \( \| q' \| + r^(- 1 + c_3) \) \,
  wide \| q' \| lt.eq C . $ <cmp:retarded-variation>]
  Decomposing $V - L$ into radial and screen parts, the improved contractions in (8.15) imply
  #[#set math.equation(numbering: n => "(8.17)")
   $ \| psi \( V \, V \) \| lt.eq C r^(- 2 + c_3) + C \| psi \| \( \| q' \| + r^(- 1 + c_3) \) .
     $ <cmp:field-contraction>]
  Where $\| q \| gt.eq r^nu$, the field itself is integrable, since
  $ A_H / 2 \( nu - delta_f \) - e / 2 > 0 . $
  It remains to control the $\| q' \|$ term near the cone.
  On a late time dyad $R lt.eq t lt.eq 2 R$, clip $q$ to $\[ - C_4 R^nu \, C_4 R^nu \]$,
    with $C_4$ containing all values in $\| q \| lt.eq r^nu$.
    Extend the clipped function by its upper constant during compact excursions.
    Near the interface $r$ is bounded and $q = t - r gt.double C_4 R^nu$, so this extension is continuous.
    It is uniformly Lipschitz, even for countably many accumulating excursions:
    on each outer component the derivative is bounded, and it matches the same constant on the complement.
    Its nonsaturated part has $r asymp R$. By (8.16) its total negative variation is $O \( R^(c_3) \)$,
    while its range has length $O \( R^nu \)$. Hence
  #[#set math.equation(numbering: n => "(8.18)")
   $ integral_(R lt.eq t lt.eq 2 R upright(" on outer portions")\
\| q \| lt.eq r^nu) \| q' \| thin d t lt.eq C \( R^nu + R^(c_3) \) . $ <cmp:clipped-variation>]
  Multiplying by $C R^(- 1 + e \/ 2)$ is summable over dyads, because $nu \, c_3 < 1 - e \/ 2$.
    The other two terms in (8.17) are integrable directly. Together with (8.14), (8.11),
    and the fixed-overlap estimate, this proves integrability over all outer portions of the track,
    including all returns to the compact interface. ◻
]

=== 8.4 Proper time and the first-runout alternatives <proper-time-and-the-first-runout-alternatives>

#thm([Proposition 24.])[
  (No finite exterior runout).  #emph[A future unit timelike geodesic from $Sigma$,
    inextendible as a geodesic in $cal(P)_d$, which never crosses $cal(S)$ has infinite future proper duration.]
] <cmp:completeness>

#proof[
  Such a geodesic must eventually proceed in one end with $t_e arrow.r oo$.
    In the finite piece its far excursions have bounded time and bounded speed;
    the remaining bounded-radius range, including the matching faces,
    has compact closure in enlarged regular charts. Global hyperbolicity excludes total causal imprisonment there.
    There is also no finite proper-time tangent blowup at an interior position limit:
    in a regular temporal chart the causal slopes are bounded, the tail has finite coordinate length,
    and the parallel-tangent equation
  $ frac(d U^alpha, d t) = - Gamma_(beta gamma)^alpha frac(d x^beta, d t) U^gamma $
  is a linear equation with bounded coefficients. It bounds the tangent and gives ordinary continuation.
    The future sign of an end matching face prevents return to the finite block before crossing $cal(S)$.
    At bounded $t_e$, finite propagation and the same local argument prevent runout in the late end.
    This proves $t_e arrow.r oo$.
  Extend $Z_K$ to a smooth future timelike field $X$ throughout this end,
    agreeing with $Z_K$ outside and near the compact interface.
    A partition of unity gives such an extension by convexity of future timelike cones.
    On any fixed finite track interval $\[ t_1 \, t_2 \]$ with outer endpoints, $F \( t \) =
    log \[ - g \( X \, U \) \]$ is absolutely continuous. Write the open set of times strictly inside the
    interface as $cal(O) = union.sq.big_j \( a_j \, b_j \)$. Then
  $ F \( t_2 \) - F \( t_1 \) = integral_(\[ t_1 \, t_2 \] \\ cal(O)) F' \( t \) thin d t +
    sum_j #scale(x: 120%, y: 120%)[\(] F \( b_j \) - F \( a_j \) #scale(x: 120%, y: 120%)[\)] . $
  On this finite interval the series converges absolutely, bounded by $integral \| F' \|$.
    At excursion endpoints $X = Z_K = T_(upright("co"))$, so (8.7) bounds each increment from above by $C
    integral_(a_j)^(b_j) rho_c$. On the complement, Lemma 26 bounds the absolute variation.
    The resulting upper bound for $F \( t_2 \) - F \( t_1 \)$ is independent of $t_2$ and the number of
    excursions. No deformation bound for the arbitrary continuation $X$ inside the interface has been used.
  Thus $E_K$ remains bounded on all outer portions, and (8.6) bounds $dot(t)$ on every intervening compact portion
    by its entering value. An initial or final portion remaining entirely compact uses that same supremum
    estimate. Consequently $dot(t)$ is bounded on the entire late track, and $integral d t \/ dot(t) =
    oo$ as $t arrow.r oo$. ◻
]

In the interior wedge we call the following limiting coordinate behaviors its two #emph[branches] and its #emph[corner]:

#[#set math.equation(numbering: n => "(8.19)")
 $ cal(B)_(+) : & y_0 arrow.r y_0^(*) < oo \, & y_1 arrow.r + oo \,\
cal(B)_(-) : & y_1 arrow.r y_1^(*) < oo \, & y_0 arrow.r + oo \,\
cal(K)^(+) : & y_0 arrow.r + oo \, & y_1 arrow.r + oo . $ <cmp:runout-types>]

These are runout regimes, not points adjoined to the manifold.

#thm([Corollary 1.])[
  (First-runout classification).  #emph[Let a future unit timelike geodesic from $Sigma$ have finite maximal
    future proper duration in $M_d$. Follow its initial connected portion in $cal(P)_d$ up to first runout.
    It crosses $cal(S)$, and its first runout has exactly one of the behaviors (8.19).]
] <cmp:classification>

#proof[
  The first-runout time is no later than its finite maximal time in $M_d$.
    Proposition 24 rules out a track avoiding $cal(S)$. In the wedge both $y_i$ increase strictly along future
    timelike curves. If both had finite limits, then $s \, x$ would be bounded.
    Causal slopes in regular temporal charts and compactness of the sphere would give a position endpoint;
    the parallel-tangent argument just used would give ordinary geodesic continuation.
    Thus at least one limit is infinite, giving exactly the three listed alternatives. ◻
]

First runout can precede the geodesic’s maximal time in $M_d$;
  in that case its endpoint is an ordinary point of $M_d$. This distinction will be important in the next
  argument, which uses an ambient regular chart but makes no assertion about the whole inner boundary of $M_d$.

=== 8.5 From a regular corner to a branch seed <from-a-regular-corner-to-a-branch-seed>

We recall exactly the interior bounds used here. On $y_0 + y_1 gt.eq 0$ the metric is

#[#set math.equation(numbering: n => "(8.20)")
 $ g & = - 2 a thin d y_0 d y_1 + gamma_(A B) \( d theta^A - b^A d y_0 \) \( d theta^B - b^B d y_0 \) \,\
L_0 & = partial_(y_0) + b^A partial_(theta^A) \, wide L_1 = partial_(y_1) \, wide a = q A \, wide q =
  q_0 e^(- kappa \( y_0 + y_1 \)) . $ <cmp:wedge-metric>]

Here $a$ is the positive null factor, not the Kerr rotation parameter;
  $q$ now denotes the interior exponential scale. The metric $gamma$ and its inverse are uniformly comparable with
  a fixed round metric, and $A \, A^(- 1)$ are uniformly bounded.
  Set $chi_i = 1 / 2 cal(L)_(L_i) gamma$ on angular tensors and $ell_i = L_i log a$.
  The angular one-forms $xi_i$ are characterized by

$ xi_0 + xi_1 = d_theta log a \, wide xi_0 - xi_1 = - a^(- 1) gamma thin partial_(y_1) b . $

Section 7 gives bounded $xi_i$ and nonnegative functions $g_i in L^1 \( bb(R) \)$ such that

#[#set math.equation(numbering: n => "(8.21)")
 $ \| chi_i \|_gamma + \| ell_i + kappa \| lt.eq C \( q + g_i \( y_i \) \) \,
   wide \| b \|_(upright("round")) lt.eq C \( q + g_0 \( y_0 \) \) . $ <cmp:corner-low-input>]

All angular statements below are intrinsic to the sphere. We use only these low bounds and the connection identities

#[#set math.equation(numbering: n => "(8.22)")
 $ nabla_(L_i)^g L_i & = ell_i L_i \, & nabla_E^g L_i & = chi_i \( E \)^sharp + xi_i \( E \) L_i \,\
nabla_(L_i)^g L_j & = a xi_i^sharp &  & \( i eq.not j \) \, $ <cmp:null-connections>]

for angular $E$, obtained by Koszul’s formula.

The next lemma compares the positive optical variables $Y_i = e^(- kappa y_i)$, both of which vanish at a corner.
  Near a corner, their speed ratio changes by a small multiplicative factor that is independent of the initial
  unit timelike tangent. A reciprocal change of the two null velocity components can therefore prevent the
  variables from vanishing at the same proper time. This will select a branch while preserving unit normalization.

#thm([Lemma 27.])[
  (Corner ratios).  #emph[Consider a future unit timelike geodesic starting at a fixed point of the double-null
    wedge, and put $Y_i = e^(- kappa y_i)$. Its maximal remaining wedge track has finite proper duration,
    has an angular limit, and ends in a branch or corner. Each $\|
    dot(Y)_i \|$ is comparable above and below to its positive initial value,
    and its screen velocity is bounded on that fixed track. Moreover there is
    $delta_c \( y_0^(upright("in")) \, y_1^(upright("in")) \)$, independent of the starting unit timelike tangent,
    with $delta_c arrow.r 0$ as both initial coordinates tend to $+ oo$, for which
#[#set math.equation(numbering: n => "(8.23)")
 $ e^(- 2 delta_c) frac(\| dot(Y)_0^(upright("in")) \|, \| dot(Y)_1^(upright("in")) \|) lt.eq
   frac(\| dot(Y)_0 \|, \| dot(Y)_1 \|) lt.eq
   e^(2 delta_c) frac(\| dot(Y)_0^(upright("in")) \|, \| dot(Y)_1^(upright("in")) \|) . $ <cmp:ratio-control>]

 If the track ends at the corner, then necessarily
#[#set math.equation(numbering: n => "(8.24)")
 $ e^(- 2 delta_c) frac(\| dot(Y)_0^(upright("in")) \|, \| dot(Y)_1^(upright("in")) \|) lt.eq
   Y_0^(upright("in")) / Y_1^(upright("in")) lt.eq e^(2 delta_c)
   frac(\| dot(Y)_0^(upright("in")) \|, \| dot(Y)_1^(upright("in")) \|) . $ <cmp:corner-necessary>]

 For a general fixed starting point the same conclusions hold with a finite, not necessarily small,
   logarithmic-variation constant.]
] <cmp:corner-ratios>

#proof[
  Dots denote proper-time derivatives. Decompose
  $ U = dot(y)_0 L_0 + dot(y)_1 L_1 + Xi \, wide Xi = dot(theta) - b dot(y)_0 . $
  Future timelikeness gives $dot(y)_i > 0$. For $j = 1 - i$ define the null momentum $p_i = - g \( U \, L_i \) =
    a dot(y)_j > 0$. Unit normalization and (8.22) give
  #[#set math.equation(numbering: n => "(8.25)")
   $ 1 + \| Xi \|_gamma^2 & = 2 a dot(y)_0 dot(y)_1 \,\
dot(p)_i / p_i & = ell_i dot(y)_i + \( xi_i - xi_j \) \( Xi \) -
  frac(chi_i \( Xi \, Xi \), p_i) . $ <cmp:unit-normalization>]
  Since $\| Xi \|_gamma^2 \/ p_i lt.eq 2 dot(y)_i$, we obtain
  #[#set math.equation(numbering: n => "(8.26)")
   $ lr(|frac(d, d tau) log \( e^(kappa y_i) p_i \)|) & lt.eq C \( q + g_i \( y_i \) \) dot(y)_i + C \| Xi \|_gamma \,\
e^(kappa y_i) p_i & = q_0 / kappa A \| dot(Y)_j \| . $ <cmp:log-momentum>]
  Both $Y_i$ decrease, and (8.25) becomes
  $ 1 + \| Xi \|_gamma^2 = frac(2 q_0 A, kappa^2) \| dot(Y)_0 \| thin \| dot(Y)_1 \| . $
  On any initial portion of the remaining track, Cauchy–Schwarz and monotonicity imply
  #[#set math.equation(numbering: n => "(8.27)")
   $ integral \| Xi \|_gamma thin d tau lt.eq
     C (integral \| dot(Y)_0 \| thin d tau integral \| dot(Y)_1 \| thin d tau)^(1 \/ 2) lt.eq
     C sqrt(Y_0^(upright("in")) Y_1^(upright("in"))) . $ <cmp:angular-length>]
  For each $i$ there are also the bounds
  $ integral q dot(y)_i thin d tau lt.eq q_0 / kappa Y_0^(upright("in")) Y_1^(upright("in")) \, wide
    integral g_i \( y_i \) dot(y)_i thin d tau lt.eq integral_(y_i^(upright("in")))^oo g_i \( v \) thin d v . $
  Their sum, together with (8.27) and a fixed constant factor, is a choice of $delta_c$ in (8.26).
    It is independent of the initial tangent, finite at any fixed starting point,
    and small when both initial coordinates are large.
  The logarithmic variation of each $A \| dot(Y)_i \|$ is at most $delta_c$.
    Taking their ratio cancels $A$, giving (8.23); the bounds for $A^(plus.minus 1)$ give individual speed
    comparability. The normalization then bounds $Xi$ on the fixed track.
    Also (8.21) implies $integral \| b \|_(upright("round")) dot(y)_0 thin d tau < oo$.
    Since $dot(theta) = Xi + b dot(y)_0$, the angular track has finite round length and an angular limit.
  An individual $\| dot(Y)_i \|$ has a positive lower bound, so the remaining proper duration is finite.
    Both $Y_i$ have nonnegative limits. If both were positive, the optical coordinates would be bounded;
    the speed bounds and angular limit would give ordinary continuation in a regular chart,
    contradicting maximality of the wedge track. Thus one or both limits vanish.
    In the corner case integration of (8.23), using $integral \| dot(Y)_i \| thin d tau = Y_i^(upright("in"))$,
    gives (8.24). This proves the assertions, including the finite-variation version starting at a general fixed
    point. ◻
]

#thm([Proposition 25.])[
  (A branch seed in the original open family).  #emph[Let $d$ belong to the fixed base neighborhood and let $O
    subset T Sigma$ be open. Suppose $w in O$ has finite future proper duration in $M_d$ and its endpoint is
    reached on a regular geodesic arc in a $C^2$ extension. Then some seed $w' in
    O$ first runs out of $cal(P)_d$ at one of its noncorner branches.
    The new seed need not have a regular exit in that extension.]
] <cmp:branch-seed>

#proof[
  Corollary 1 applies to the original geodesic. If its first runout is a branch, take $w' = w$.
    Suppose it is a corner. At a late point change its tangent to
  #[#set math.equation(numbering: n => "(8.28)")
   $ U_sigma = \( 1 + sigma \) dot(y)_0 L_0 + \( 1 + sigma \)^(- 1) dot(y)_1 L_1 + Xi \, wide
     sigma > 0 . $ <cmp:reciprocal-change>]
  The product of its null coefficients and its screen velocity are unchanged, so it is future unit timelike.
    Its initial $Y$-speed ratio is multiplied by $\( 1 + sigma \)^2$.
    The original corner satisfies (8.24); a corner for the changed track would satisfy the same necessary
    condition with this new ratio. The two allowable intervals are disjoint once
  #[#set math.equation(numbering: n => "(8.29)")
   $ 4 delta_c < 2 log \( 1 + sigma \) . $ <cmp:corner-exclusion>]
  For each fixed $sigma > 0$, a sufficiently late change therefore produces a branch by Lemma 27.
  It remains to make one choice of $sigma$ which returns the changed geodesic to $O$,
    uniformly as the change point approaches runout. This is a statement in regular ambient coordinates,
    not in the degenerating optical coordinates. On the fixed original tail $Xi$ is bounded.
    Writing $c = 1 + sigma$, direct calculation gives
  #[#set math.equation(numbering: n => "(8.30)")
   $ - g \( U \, U_sigma \) = 1 + \( 1 + \| Xi \|_gamma^2 \) (frac(c + c^(- 1), 2) - 1) . $ <cmp:rapidity>]
  The relative rapidity is therefore $O \( sigma \)$ uniformly late.
  Let $tau_P$ be first runout from $cal(P)_d$, and let $tau_M = T_d \( w \)$.
    If $tau_P < tau_M$, the runout state is an ordinary smooth state in $M_d$.
    If $tau_P = tau_M$, the hypothesis provides a regular geodesic state in the $C^2$ extension.
    In either case choose one precompact product temporal chart $\( t \, x \)$ around that ambient state,
    with a convex spatial coordinate ball containing a tail of the original arc.
    The original unit tangent is bounded there. Shrink the chart so that one fixed convex ball of spatial slopes
    around the reference slopes consists of future timelike slopes at every point of the chart.
  Choose fixed times $t_0 < t_1$ before the runout time such that the original segment $\[ t_0 \, t_1 \]$ has a
    compact tube contained in $cal(P)_d$. At change points $z_n$ after $t_1$ tending to runout,
    (8.30) and the bounded original tangent give an $O \( sigma \)$ change of ambient coordinate phase state.
    The geodesic vector field is $C^1$ even for a $C^2$ ambient metric.
    On a compact phase-space tube its ODE constants are uniform.
    Backward integration to $t = t_0$ therefore exists and changes the state by $O \( sigma \)$,
    with one constant independent of $n$. Its endpoint $p'_n$ lies in the fixed interior tube for sufficiently
    small $sigma$.
  We must also show that this entire backward arc lies in $cal(P)_d$.
    Write $x_0 \( t \)$ for the original spatial path and choose $chi in
    C^oo \( \[ t_0 \, t_1 \] \)$ equal to one at $t_0$ and zero near $t_1$.
    Form a reference path on the early interval by
  $ x_0 \( t \) + chi \( t \) #scale(x: 120%, y: 120%)[\(] x \( p'_n \) -
    x_0 \( t_0 \) #scale(x: 120%, y: 120%)[\)] \, $
  and then follow $x_0 \( t \)$ to $z_n$. The early part lies in the fixed compact tube,
    the rest in the original track, and the whole path is timelike for small $sigma$.
    It has exactly the endpoints of the backward-integrated geodesic.
    Both paths have slopes in the common convex timelike ball.
    Spatial linear interpolation at the same chart time is thus a timelike fixed-endpoint homotopy within the
    ambient box.
  Apply the intrinsic-diamond argument of 4 to the globally hyperbolic open subspacetime $cal(P)_d$.
    For clarity, the parameters for which the full path lies inside are open, since the path is compact.
    They are closed because such paths lie in the intrinsic compact causal diamond of their two fixed endpoints.
    Hence every path of the homotopy, including the changed arc, lies in $cal(P)_d$.
    No causal convexity in the ambient extension is required.
  The changed state at $t = t_0$ is uniformly close to the original one.
    Ordinary geodesic flow through the fixed earlier compact segment,
    including its transverse crossing of $Sigma$, then gives a seed in $O$. The choices have the following order:
    fix the ambient chart, the two early slices, their compact tube,
    and an earlier-flow neighborhood mapping into $O$; choose one sufficiently small $sigma >
    0$ for these tolerances; finally choose $z_n$ so late that (8.29) holds.
    The last choice forces a branch without changing any preceding tolerance. ◻
]

In particular, if $d in cal(B) \( O \, N \)$ is a datum in a regular-exit piece of the closed-test reduction,
  the preceding proposition provides a branch seed in the same $O$.
  Although regular exit need not persist for that seed, every duration and curvature bound of $A \( O \, N \)$
  still holds along it. The following finite-signal construction will use only this branch and those closed-test bounds.

== 9 Finite tidal observations and the category conclusion <sec:packet>

The comparison development constructed above supplies a branch along which a bounded-curvature geodesic
  experiences an exponentially large optical frequency. We now use that frequency amplification to make a finite
  tidal observation arbitrarily large by an arbitrarily small change in any prescribed finite list of data
  seminorms. The construction has three distinct objects: an approximate interior metric perturbation $h^p$,
  an approximate exterior perturbation $h^B$ transferring its entry jets to the original initial end,
  and exact vacuum data $d_T$ obtained by correcting the constraints of the exterior seed.
  A separate Cauchy attachment places the observation in the full development of $d_T$.

All wave comparisons in this section use ordinary wave-map reduction with the fixed vacuum background $g =
  g_d$ as target. They are local hyperbolic comparisons, independent of the exterior modulation gauge.
  Explicitly, for the unknown metric $tilde(g)$ we use

#[#set math.equation(numbering: n => "(9.1)")
 $ "Ric" \( tilde(g) \)_(mu nu) + nabla_(\( mu)^(tilde(g)) Upsilon_(nu \)) \( tilde(g) \; g \) & = 0 \,\
Upsilon_mu \( tilde(g) \; g \) & = - tilde(g)_(mu lambda) tilde(g)^(alpha beta) #scale(x: 120%, y: 120%)[\(]
  Gamma \( tilde(g) \)_(alpha beta)^lambda - Gamma \( g \)_(alpha beta)^lambda #scale(x: 120%, y: 120%)[\)] .
  $ <pk2:local-reduction>]

The target $g$ is a fixed smooth coefficient field in this equation.
  There are no spatially nonlocal gauge additions or modulation feedback variables in (9.1).
  Its exact wave-map Cauchy initialization and the vacuum constraints give homogeneous gauge propagation and
  ordinary finite domain of dependence.

#thm([Proposition 26.])[
  (A finite tidal observation).  #emph[Let $d in cal(U)_epsilon.alt$,
    and let $w in T Sigma$ be a seed whose future unit timelike geodesic has a noncorner branch as its first
    runout from the comparison development $cal(P)_d$. Suppose its curvature is bounded in the parallel positive
    metric up to that runout. For every integer $m gt.eq 10$, every $eta > 0$, and every $J > 0$,
    there are smooth complete vacuum data $d_T in cal(D)$ and seeds $w_T arrow.r w$,
    for arbitrarily large finite $T$, such that
$ p_m \( d_T - d \) arrow.r 0 \, $

 and the unit geodesic of $w_T$ in the full MGHD of $d_T$ has a finite point with tangent $U_T$ and a unit
   spacelike vector $X_T perp U_T$ for which
$ \| "Riem" \( g_(d_T) \) \( U_T \, X_T \, U_T \, X_T \) #scale(x: 120%, y: 120%)[\|] > J . $

 In particular $p_m \( d_T - d \) < eta$ for sufficiently large $T$,
   and the data may be required to remain in any prescribed relatively open neighborhood of $d$.]
] <pk2:finite-signal>

We prove the proposition in the following subsections. The orders of all comparison norms are fixed before
  choosing the positive frequency exponent; formal accuracy is chosen afterwards, and $T$ is chosen last.
  The notation $e^(o \( T \))$ denotes a bound by $C_sigma e^(sigma T)$ for every $sigma > 0$,
  at each fixed derivative and formal expansion order. Constants and thresholds may depend on those orders and on
  $d$. For a positive quantity, “two-sided $e^(o \( T \))$” means that the same convention applies to its
  reciprocal. No uniformity in an unbounded sequence of derivative orders is asserted.

=== 9.1 The branch state and the normalized coefficients <pk2:branch>

Arrange the double-null labels so that

$ u = y_0 \, wide v = y_1 \, wide s = frac(u + v, 2) \, wide x = frac(v - u, 2) \, wide v arrow.r oo \, quad
  u arrow.r u_(*) < oo $

on the chosen branch. The label-interchange construction proved above provides these conventions also for the
  other branch, on the same surface $cal(S) = { s = 0 }$ and the same product wedge.
  Its new angular labels are obtained by finite sphere flow at every finite point;
  their estimates are then rederived from the prepared entry data.
  Thus no uniform derivative bound for an unestimated long angular flow is used.
  Throughout the experiment these are fixed background coordinates.

Write

$ g = - 2 a thin d u thin d v + gamma_(A B) \( d theta^A - b^A d u \) \( d theta^B - b^B d u \) \, wide L_0 =
  partial_u + b^A partial_A \, quad L_1 = partial_v \, quad a = q_0 e^(- kappa \( u + v \)) A . $

Let $P_T$ be the background geodesic point with $v = T$, and let $U$ be its unit tangent. Set

$ Xi = dot(theta) - b dot(u) \, wide p = a dot(v) > 0 \, wide P = gamma Xi \, wide pi_u = - p - b dot.op P . $

The dot here denotes proper-time differentiation; $P$ is the angular covector momentum,
  whereas $P_T$ is a spacetime point.

#thm([Lemma 28.])[
  (Branch normalization).  #emph[Along the branch, $p asymp 1$, and $P$, $Xi$, and $dot(u)$ remain bounded.
    In particular, with $Y_T = dot(v) \( P_T \)$,
#[#set math.equation(numbering: n => "(9.2)")
 $ Y_T asymp e^(kappa T) . $ <pk2:blueshift>]

]
] <pk2:branch-normalization>

#proof[
  Unit normalization gives $1 + \| Xi \|_gamma^2 = 2 p dot(u)$.
    The geodesic equation used in the corner-ratio argument implies
  $ \| accent(log p, ̇) \| lt.eq C \( dot(u) + \| Xi \|_gamma \) . $
  The integral of $dot(u)$ is finite. Also, by the same normalization and Cauchy–Schwarz,
  $ integral \| Xi \|_gamma thin d tau lt.eq C (integral d u)^(1 \/ 2) (integral a thin d v)^(1 \/ 2) < oo . $
  Thus $p asymp 1$. Near the angular limit the unit-shell Hamiltonian with $v$ as time is
  #[#set math.equation(numbering: n => "(9.3)")
   $ - pi_v = frac(a \( 1 + \| P \|_(gamma^(- 1))^2 \), 2 p) \, wide frac(d u, d v) =
     frac(a \( 1 + \| P \|_(gamma^(- 1))^2 \), 2 p^2) . $ <pk2:branch-hamiltonian>]
  The low coefficient bounds give $\| d P \/ d v \| lt.eq C \( p + \| P \| \) thin d u \/ d v$.
    Since the total variation of $u$ is finite, Gronwall bounds $P$ and hence $Xi$ and $dot(u)$.
    Finally $a asymp e^(- kappa T)$ at $P_T$, proving (9.2). ◻
]

Fix $u_2 > u_(*)$, $c_2 > 0$, and $c_0 > 0$ small relative to these margins. The finite comparison domain is

#[#set math.equation(numbering: n => "(P1)")
 $ 0 lt.eq s lt.eq frac(T + u_(*), 2) + c_0 \, wide u + frac(c_0 s, T) lt.eq u_2 \, wide v + frac(c_0 s, T) lt.eq
   T + c_2 . $ <pk2:domain>]

Its slice lengths in $x$ have a positive lower bound. All constructions are first made with enlarged domains and
  margins. For auxiliary transports fix $u_f > u_2$. The strip $- v lt.eq u lt.eq u_f$,
  with $v$ in a fixed neighborhood of $T$, is contained in the expanding region of the higher double-null
  estimate, with bounded-direction endpoint $u_f$. This observation includes the moving initial foot $u = - v$.

Use normalized vector slots and derivative fields

$ hat(e)_i = a^(- 1 \/ 2) L_i \, wide hat(e)_A = partial_A \, wide Z_alpha = sqrt(a) thin hat(e)_alpha \, wide
  W_t = L_0 + L_1 \, quad W_x = L_1 - L_0 . $

Thus $Z_i = L_i$. For a covariant two-tensor entry $n$, let $n_i$ count its radial $i$-slots and put $c_n =
  kappa \( n_0 - n_1 \) \/ 2$. In the coefficient estimates below,
  $D b$ denotes the collection of first ordinary coordinate derivatives of $b$ in the fixed
  $\( u \, v \, theta \)$ charts.

#thm([Lemma 29.])[
  (Coefficient inputs for the finite comparison).  #emph[The matrices $V_alpha$ of $nabla_(Z_alpha)$ on the
    normalized vector basis are bounded. In the bulk limit $min \( v \, - u \, s \) arrow.r oo$,
$ V_0 arrow.r D_0 = "diag" \( - kappa \/ 2 \, kappa \/ 2 \, 0 \, 0 \) \, wide V_1 arrow.r - D_0 \, wide
  V_A arrow.r 0 . $

 The contracted differentiated connection matrices in $a square.stroked.tiny_g$ and every normalized entry of $a
   "Riem" \( g \)$ are bounded and small in that limit. The undifferentiated connection products in the tensor
   wave operator retain the radial diagonal constants. Moreover
$ b \, med D b \, med W_t gamma \, med W_t log a + 2 kappa arrow.r 0 $

 there, while first ordinary derivatives of $log a$ and $gamma$ are bounded.
   Every fixed ordinary derivative of the normalized arrays has size $e^(o \( T \))$ on the required domains.
   Derivatives of $a$, $sqrt(a)$, and $partial_v b$ retain, respectively, the factors $a$, $sqrt(a)$, and $a$.]
] <pk2:coefficients>

#proof[
  Write $B_0 = b$, $B_1 = 0$, and $j = 1 - i$. The complete connection formulas include
  #[#set math.equation(numbering: n => "(9.4)")
   $ nabla_(L_i) hat(e)_i & = 1 / 2 ell_i hat(e)_i \, & nabla_(L_i) hat(e)_j & = - 1 / 2 ell_i hat(e)_j +
     sqrt(a) thin xi_i^A partial_A \,\
nabla_(L_i) partial_A & = \( chi_(i \, A) zws^B - partial_A B_i^B \) partial_B + sqrt(a) thin xi_(i \, A) hat(e)_i \,\
nabla_(Z_A) hat(e)_i & = chi_(i \, A) zws^B partial_B + 1 /
  2 sqrt(a) \( xi_i - xi_j \)_A hat(e)_i \, & nabla_(Z_A) partial_B & = sqrt(a) thin Gamma_(A B)^C partial_C +
  chi_(0 \, A B) hat(e)_1 + chi_(1 \, A B) hat(e)_0 . $ <pk2:radial-connection>]
  The low estimates and pure-jet limits give the asserted limiting matrices.
    In the mixed trace the radial derivatives are cross derivatives; in particular $L_1 partial_A b =
    partial_A partial_v b$ retains $a$. For curvature use the exact matrix identity
  $ a R \( hat(e)_alpha \, hat(e)_beta \) = Z_alpha V_beta - Z_beta V_alpha + \[ V_alpha \, V_beta \] -
    V_(\[ Z_alpha \, Z_beta \]) . $
  The brackets satisfy
  $ \[ L_0 \, L_1 \] = sqrt(a) \( xi_0 - xi_1 \)^A Z_A \, wide \[ L_i \, Z_A \] = 1 /
    2 ell_i Z_A - \( partial_A B_i^B \) Z_B . $
  The new unsuppressed pure longitudinal curvature term is $L_i chi_i$, covered by the pure-jet estimate.
    Longitudinal torsion derivatives reduce to $beta_i$, $d ell_i$,
    and $tau_i xi_i$ by the double-null identities. The actual low bounds on $ell_i +
    kappa$ and $chi_i$ in angular $H^4$ give $d ell_i$ and $beta_i$ in $H^3$; the pure jets are in $H^2$,
    which embeds in $C^0$ on the spheres. Thus the required limits do not differentiate an uncontrolled moving
    profile. The factor $sqrt(a)$ in the angular connection and the limiting commutation relation do not create a
    constant curvature term. The only constant tensor-wave contribution is
  $ - \( L_0 + C \) \( L_1 - C \) - \( L_1 - C \) \( L_0 + C \) \, wide C = "diag" \( c_n \) \, $
  whose $n$th entry is the radial part of $e^(2 c_n x) a square.stroked.tiny_g^(upright("scal")) e^(- 2 c_n x)$.
    The higher double-null bounds, on the strip including $u_f$,
    give all remaining fixed derivative estimates with the stated factors. ◻
]

=== 9.2 A constrained oscillatory packet in the deep region <pk2:deep-packet>

Let $cal(P)$ be the covariant tensor wave operator with curvature potential obtained by trace reversal of the
  linearized wave-map reduced vacuum equation at $g$, and let $cal(C) = "div"_g$ on these tensors.
  Linearized Bianchi gives

$ cal(C) cal(P) = cal(P)_1 cal(C) \, $

where $cal(P)_1$ is the one-form wave operator. Put

$ k_v = g^(- 1) d v = - a^(- 1) L_0 \, wide K_v h = h \( k_v \, dot.op \) \, wide cal(T) = 2 nabla_(k_v) +
  square.stroked.tiny_g v . $

For a sufficiently large finite $L$, solve the transport and gauge hierarchy

#[#set math.equation(numbering: n => "(9.5)")
 $ i cal(T) p_j + cal(P) p_(j - 1) = 0 \, wide i K_v p_j + cal(C) p_(j - 1) = 0 \, wide p_(- 1) = 0 \,
   $ <pk2:hierarchy>]

on $- v lt.eq u lt.eq u_f$, with $v$ near $T$.

Multiplication of the first equation by $- a \/ 2$ gives connection transport along $L_0$ plus area expansion,
  with a known source supplied by $a cal(P) p_(j - 1)$. At fixed $j$,
  the unknown normalized entries of $p_j$ form triangular blocks:
  the block of weight $c_n$ has same-weight transport $L_0 + c_n$,
  with bounded additional coefficients small in the bulk, and couples only to higher-weight blocks.
  The boundary values for each $p_j$ are assigned as follows:

$ upright("entries") & c_n & upright("boundary value")\
00 & kappa & upright("gauge equation at ") u = - v\
0 A & kappa \/ 2 & upright("gauge equation at ") u = - v\
01 & 0 & upright("gauge equation at ") u = - v\
A B & 0 & upright("free angular data at ") u = - v\
1 A & - kappa \/ 2 & upright("zero at ") u = u_f\
11 & - kappa & upright("zero at ") u = u_f $

In this table $A \, B$ are angular slots. At $j = 0$ the free angular data are a compact smooth bump times an
  angular trace-free polarization of unit norm at the foot of the $v = T$ ray through $P_T$,
  multiplied by a constant unit phase to be fixed below. They vanish for $j > 0$.
  Solve the blocks in descending weight, retaining the coupled angular transport within each block.
  Nonnegative-weight blocks are integrated from $u = - v$, and negative-weight blocks from $u_f$ backwards;
  the constant diagonal part has the favorable sign in each chosen direction.

The gauge contraction uses precisely the entries with a $0$-slot,
  so the terminal choices do not prescribe extra gauge data.
  To check that the initial gauge equations persist, set $q_j = i K_v p_j + cal(C) p_(j - 1)$.
  Conjugated divergence compatibility gives

$ i cal(T)_1 q_j + cal(P)_1 q_(j - 1) = 0 \, wide q_(- 1) = 0 \, $

where $cal(T)_1$ is the corresponding one-form transport.
  Induction and the zero initial gauge jets give $q_j = 0$ throughout the strip.

All amplitudes and fixed ordinary derivatives in normalized entries have size $e^(o \( T \))$.
  The one-flank interior estimate applies to the whole strip:
  choose its bounded coordinate to be $y_0 = u lt.eq u_f$ and its other coordinate $y_1 = v lt.eq C T$,
  with any fixed $C > 1$. This includes both $u = - v$ at entry and $u = u_f$ at the terminal edge.
  The angular vector field $b$ and its first angular derivatives have arbitrarily small average outside bounded
  end portions. Differentiated angular flow and inverse flow therefore have subexponential fixed jets;
  higher coefficient derivatives enter only lower induction orders.
  The normalized sources $a cal(P) p_(j - 1)$ and the prescribed gauge components $sqrt(a) thin cal(C)
  p_(j - 1)$ obey the same bounds. Locality of each transport, including the backwards integrations,
  keeps support in the flow tube of the initial bump. The initial patch can have fixed small size in uniform
  charts on $cal(S)$, although its center may vary with $T$.
  The leading tensor is trace-free and annihilates $k_v$. Its screen polarization at $P_T$ has two-sided
  $e^(o \( T \))$ norm, since it is parallel transported times an area factor with small-average logarithmic derivative.

Choose $X perp U$ with $d v \( X \) = 0$ and $g \( X \, X \) = 1$,
  using an angular unit vector and a bounded multiple of $L_0$.
  Choose its direction so that the diagonal screen polarization has absolute value $sigma_T$,
  of two-sided $e^(o \( T \))$ size. Fix the constant phase to make that contraction fully real at $P_T$.
  Let $C_w$ bound the background unit tidal contraction on this seed;
  it is finite by its bounded parallel curvature and its fixed initial boost.
  Choose $J_(upright("amp")) > 0$ so that $2 J_(upright("amp")) > J + C_w + 2$, and set

#[#set math.equation(numbering: n => "(9.6)")
 $ lambda_p = e^(zeta T) \, wide A_T = frac(4 J_(upright("amp")), Y_T^2 lambda_p^2 sigma_T) \, wide h^p =
   A_T "tr.rev."_g "Re" (e^(i lambda_p v) sum_(j = 0)^L lambda_p^(- j) p_j) . $ <pk2:packet-amplitude>]

Here $zeta > 0$ will be chosen after all base norm orders.
  The normalized reduced-equation residual at $g + h^p$, multiplied by $a$, is

#[#set math.equation(numbering: n => "(9.7)")
 $ e^(o \( T \)) #scale(x: 120%, y: 120%)[\(] A_T lambda_p^(- M_1) +
   A_T^2 lambda_p^(P_(*)) #scale(x: 120%, y: 120%)[\)] $ <pk2:deep-residual>]

at those orders. Increasing the finite hierarchy makes $M_1$ arbitrarily large,
  whereas $P_(*)$ depends only on the fixed base orders. The linear phase and transport errors cancel
  successively, and subtracting the linearization leaves quadratic relative-field products in scaled covariant
  derivatives and smooth inverse-array coefficients, including algebraic $a "Riem" \( g \)$ terms.
  There is no inverse-lapse loss in these normalized residual arrays.

=== 9.3 The exact deep comparison and its observation <pk2:deep-comparison>

The next proposition specifies exactly how accurately the entry jets must be transferred from the original initial
  end. We first define its mixed error norms using the background fields.
  For a positive mass parameter $epsilon_0$, a normalized entry $f$ of weight $c_n$ has reference slice density

#[#set math.equation(numbering: n => "(9.8)")
 $ 1 / 2 (\| W_t f \|^2 + \| \( W_x - 2 c_n \) f \|^2 + 2 a \| d_theta f \|_gamma^2 + epsilon_0^2 \| f \|^2) d x
   thin d "vol"_gamma . $ <pk2:reference-density>]

For a normalized tensor array $F$, let $E_j \( F \; s \)$ be the square root of the sum of these integrals over
  the $s$-slice of (P1), with $f = D^alpha F_n$, over all entries $n$ and ordinary multiindices $\| alpha \| lt.eq
  j$. Angular derivatives and localization use the fixed finite sphere atlas.
  These are the through-$j$ mixed energies below; $epsilon_0$ will be fixed sufficiently small after the desired
  growth-rate tolerance.

#thm([Proposition 27.])[
  (Deep comparison).  #emph[Fix a mixed Sobolev comparison order $k gt.eq 10$.
    For every sufficiently small fixed $delta_2 > 0$, one may fix $epsilon_0 > 0$ and then $nu_0 >
    0$ sufficiently small as follows. Suppose the exact reduced-equation Cauchy jets on $s =
    0$ satisfy the vacuum constraints and wave-map gauge, agree with $g$ for $v < \( 1 - nu_0 \) T$,
    and differ from the jets of $g + h^p$ by at most
#[#set math.equation(numbering: n => "(9.9)")
 $ e^(- 7 kappa T \/ 2) quad upright("in ") H^(k + 1) times H^k \( d x thin d theta \) . $ <pk2:entry-accuracy>]

 Then these data have an exact vacuum development $g'$ on (P1), with normalized error $F = g' - g -
   h^p$ bounded in the through-$k$ mixed energies by
#[#set math.equation(numbering: n => "(P7)")
 $ C e^(\( kappa + delta_2 \) T) (e^(- 7 kappa T \/ 2) + A_T lambda_p^(- M_1) + A_T^2 lambda_p^(P_(*))) .
   $ <pk2:deep-error>]

 The conclusion holds when this bound has a fixed exponential margin below $A_T$ and the required base packet
   norms are sufficiently exponentially small. The same estimate, with fixed buffers, controls normalized $C^2$ error.]
] <pk2:deep-proposition>

#proof[
  Bootstrap the error energies by $e^(- \( 2 kappa + c' \) T)$ for a small fixed $c' > 0$.
    The relative cone change is exponentially small. Therefore the side inequalities in (P1) are strict outflow,
    since $d u \/ d s \, d v \/ d s gt.eq -$exponentially small on future causal vectors.
    Finite propagation keeps the exact change supported in $v gt.eq \( 1 - nu_0 \) T - o \( 1 \)$.
  For $f = D^j F_n$, where $D$ denotes ordinary derivatives through order $k$,
    the scalar operator retaining the diagonal drift is
  $ e^(2 c_n x) a square.stroked.tiny_(g')^(upright("scal")) \( e^(- 2 c_n x) f \) . $
  Lemma 29 gives bounded top-order residual coefficients small in the bulk,
    with $e^(o \( T \))$ coefficients only on lower commuted energies.
    The potentially unscaled angular commutator has the form
  $ \( D b \) partial_v \( partial_A D^(j - 1) F \) $
  when one derivative hits $b partial_A partial_v$. The angular derivative is inside the ordinary order-$j$ field,
    so its coefficient is the small $D b$. With two or more coefficient hits the field is at a lower energy level.
    A first hit on $a gamma^(- 1) partial_theta^2$ retains at least $sqrt(a)$ against the scaled angular
    derivative; higher hits again enter lower levels. The factor $partial_v b$ retains $a$,
    and angular partitions cost $O \( \| b \| + sqrt(a) \)$ at top order.
  After retaining the exact principal coefficients, each perturbative commutation or lower product contains an
    additional packet-small or bootstrap-small factor at an error placement.
    The highest error order $j + 1$ can lose $O \( a^(- 1 \/ 2) \) lt.eq C e^(kappa T \/ 2)$;
    further error factors through half the total order $j + 2$ are controlled by the mixed $k$-order bootstrap and
    slice Sobolev embedding. Taking $zeta$ sufficiently small leaves an exponential margin to absorb these
    factors. Smooth higher background derivatives cost only $e^(o \( T \))$.
  Apply massive scalar stress energy to $e^(- 2 c_n x) f$ with mass squared $epsilon_0^2 \/ \( 2 a \)$ and
    multiplier $e^(4 c_n x) W_t$. Up to an exponentially small relative metric change, its slice density is (9.8).
    Thus the exact-principal stress energy is uniformly equivalent to the reference mixed norm just defined.
    The limiting nonsource bulk terms are
  $ - 4 c_n W_t f \( W_x - 2 c_n \) f - 2 kappa a \| d_theta f \|_gamma^2 + epsilon_0^2 f W_t f . $
  Here $W_t x = 0$, $W_x x = 1$, $W_t log a arrow.r - 2 kappa$, and $W_t gamma arrow.r 0$.
    The brackets of $W_t$ with $W_x \, Z_A$ are small in the scaled basis except for the limiting term $-
    kappa Z_A$. All exits have favorable flux. Since $\| c_n \| lt.eq kappa$,
    fixing $epsilon_0$ small and then a bulk threshold gives square-root energy rate $2
    kappa +$arbitrarily small in the bulk, and a bounded rate elsewhere.
    The part of the support not entirely in that bulk has time length $O \( 1 \) + O \( nu_0 T \)$,
    whereas the whole interval has length $T \/ 2 + O \( 1 \)$.
    More explicitly, for a fixed bulk threshold $B$ the bulk is $min \( v \, - u \, s \) gt.eq B$.
    The support has $v > B$ for large $T$, the region $s < B$ has bounded length, and $- u < B$ implies $2 s = u +
    v > \( 1 - nu_0 \) T - B - o \( 1 \)$. Its possible remaining time length is at most $nu_0 T \/ 2 +
    O \( B + 1 \)$. A common nonnegative majorant therefore integrates to $\( kappa + delta_2 \)
    T$ after slightly reserving its strict margin.
  For clarity, if $E_j$ are the successive error norms, their inequalities have the form
  $ E'_j lt.eq r_T E_j + b_T sum_(ell < j) E_ell + S_j \, wide integral b_T lt.eq e^(o \( T \)) . $
  Factoring out $exp \( integral r_T \)$ and integrating successively in $j$ costs only a fixed polynomial in
    $integral b_T$. This is 37, and is still $e^(o \( T \))$ at every fixed $k$.
    The initial mixed jets follow from the reduced equation with the same source and subexponential costs:
    $s = 0$ is uniformly spacelike in its nondegenerate entry coordinates. This proves (P7).
  Its strict exponential improvement closes the bootstrap. Ordinary hyperbolic restarts on enlarged domains within
    the outflow margins give continuation, since for each finite $T$ all coordinates are nondegenerate.
    Homogeneous wave-constraint propagation gives vacuum. Adding fixed Sobolev buffers gives the final $C^2$
    assertion. ◻
]

#thm([Lemma 30.])[
  (Tidal size and backward state).  #emph[Under the strict parameter margins of Proposition 27,
    the point $P_T$ has a future unit tangent $U'$ and a unit spacelike $X' perp U'$ for $g'$ with
$ \| "Riem" \( g' \) \( U' \, X' \, U' \, X' \) \| > J . $

 The $g'$-geodesic with state $\( P_T \, U' \)$, traced backwards to $cal(S)$,
   has state converging to the background geodesic’s transverse entry state and stays within the available side
   margins.]
] <pk2:observation>

#proof[
  Put $H = U \/ Y_T$. In the normalized primal basis, $H$ has size $O \( sqrt(a) \)$ and $X$ has size $O \( 1 \)$,
    while $d v \( H \) = 1$ and $d v \( X \) = 0$. The phase-phase leading term in
    $"Riem" \( g' \) \( H \, X \, H \, X \)$ has absolute value
  $ 1 / 2 A_T lambda_p^2 sigma_T . $
  All other packet terms cost $e^(o \( T \)) \( A_T lambda_p + A_T^2 lambda_p^(P_(*)) \)$;
    comparison terms cost (P7) times $e^(o \( T \))$, enlarging the fixed $P_(*)$ if necessary.
    Indeed express the connection difference using first $nabla^g$ derivatives of $g' - g$,
    then use its covariant derivative, connection products, and inverse-metric products for curvature.
    Multiplication by $a$ allows both differentiated slots to use $Z = sqrt(a) thin hat(e)$ in normalized entries,
    with only subexponential conversion costs, including hits on the scaling.
    Evaluation on two $H$ and two $X$ slots cancels this curvature scaling.
    The single order-zero amplitude supplies the displayed leading term; trace reversal does not alter it,
    and the ordinary second-metric-derivative formula gives the factor $1 \/ 2$.
  All remaining terms are $o \( Y_T^(- 2) \)$ under the choices made below.
    A normalized near-identity frame isometry sends $U \, X$ to a $g'$-orthogonal future/unit and spacelike/unit
    pair $U' \, X'$, with relative frame error $O \( A_T e^(o \( T \)) \)$.
    Its curvature slot error is still $o \( Y_T^(- 2) \)$ at the $H$ scale.
    Multiplying by $Y_T^2$ and using the choice of $J_(upright("amp"))$ proves the strict tidal bound.
  For the backward state, use (9.3) on a compact $u \, theta \, pi_u \, P$ state tube around the background tail,
    with $p = - pi_u - b dot.op P$ bounded below. Its background Lipschitz cost is $a e^(o \( v \))$,
    integrable as $v arrow.r oo$. The perturbed unit shell is solved on the same branch by putting $pi_v = a z'$:
    the background equation for bounded $z'$ has derivative bounded away from zero.
    Normalized covector arguments have size $O \( a^(- 1 \/ 2) \)$,
    but the differentiated relative metric change is exponentially smaller than $a$ on this bounded-$u$ path.
    The Hamiltonian and its first state derivatives therefore change by exponentially small absolute amounts.
    The terminal errors are
  $ delta \( pi_u \, P \) = O \( A_T e^(o \( T \)) \/ sqrt(a) \) \, wide delta \( pi_v \/ a \) =
    O \( A_T e^(o \( T \)) \/ a \) . $
  The second estimate uses $partial_v = sqrt(a) thin hat(e)_1$ and also shows that the chosen future tangent lies
    on the continued root. Differentiating the shell equation in state variables costs at most the same inverse
    $a$ on normalized coefficient differences, with subexponential background factors.
    Integrating the exponentially small vector-field error over length $O \( T \)$ and applying Gronwall with the
    integrable background Lipschitz majorant proves convergence through the transverse hit of $s = 0$.
    Fixed earlier portions use ordinary compact geodesic flow.
    Uniform state and side margins keep the perturbed paths in the stated domain. ◻
]

=== 9.4 Return rays to the original initial end <pk2:return-rays>

The interior packet is useful only if its entry jets can be produced by data on the original bridge.
  We first verify the real-ray geometry needed for the exterior beam construction,
  including its dependence on the fixed spin.

Use the pertinent exterior time $t_e$, co-coordinate $y$, and lab coordinate $z = y + C_e \( t_e \)$.
  Orient the aligned Boyer–Lindquist time $T_K$ on this end so that the preparation parameter $I$ satisfies

$ I' = lambda_(-) 𝜍 > 0 \, wide 0 < c_I lt.eq I' lt.eq C_I \, wide I \( t_T \) = T . $

Then $t_T asymp T$. The launch patch near $v = x = T$ on $s = 0$ has $t_e = t_T + O \( 1 \)$.
  A fixed $C_2$ with margins covers its required initial interval by $t_e lt.eq t_T + C_2$.
  The part $v < \( 1 - nu_0 \) T$ is earlier by at least $c nu_0 T$; the bounded joins do not grow with $T$.
  The inner exterior exit lies strictly deeper than this end of $cal(S)$, with a further fixed background margin.

#thm([Proposition 28.])[
  (Backward escape and flow bounds).  #emph[The null rays launched by $d
    v$ on a sufficiently small fixed entry patch, followed towards the past, return to the original initial end.
    For every prescribed $alpha > 0$, after choosing a sufficiently large fixed radius and then taking $T$
    sufficiently large, all their arrival points satisfy
#[#set math.equation(numbering: n => "(E1)")
 $ \( 1 - alpha \) t_T < \| z - z_(*) \| < \( 1 + alpha \) t_T \, wide z_(*) = C_e \( t_T \) . $ <pk2:arrival-shell>]

 Their entry crossing is unique and transverse within the computing region,
   with separation from the entry level outside a uniform collar.
   All fixed jets of the phase-space flow on all subsegments, including launch-center derivatives,
   have bounds $e^(o \( T \))$. Tensor parallel transport has bounded norm and inverse along these rays.
   The assertions hold with short past and future launch margins, including passage through the deeper inner exit.]
] <pk2:escape>

#proof[
  On compact spatial subsets of the co cylinder, $g arrow.r G_(p_oo)$ in the required low differentiated orders.
    Indeed $p arrow.r p_oo$ follows from the integrable modulation derivative, and $p' \, c \,
    c'$ and further required low jets tend to zero by the positive-weight endpoint and feedback bounds.
    The compact $A_H$-weighted endpoint estimates control $h_(upright("co"))$,
    while the target memories have bounded length there. Higher compact and far estimates supply fixed jets of
    size $e^(o \( T \))$ for time and radius $O \( T \)$.
  The entry surface is strictly spacelike and optically transverse.
    A small uniform collar obtained by local eikonal and angular flow therefore has bounded low transition jets
    and subexponential high jets. The covectors $d v$ approach the frozen covectors
  $ lambda_(-) d \( r_(*) + F + T_K \) $
  in aligned Kerr variables. This follows from the prepared-coordinate Jacobian comparison,
    the decay of the parameter derivatives, and the noncharacteristic null root.
    Accumulated phase offsets do not affect this assertion. Here $F$ is the exact axisymmetric optical-profile
    function, not the metric comparison error.
  The frozen covector has zero angular Killing momentum. By Kerr separation its radial potential divided by
    squared Killing energy is
  #[#set math.equation(numbering: n => "(9.10)")
   $ \( r_K^2 + frak(a)^2 \)^2 -
     Delta (\| partial_theta.alt F \|^2 + frak(a)^2 sin^2 theta.alt)_(upright("init")) . $ <pk2:radial-potential>]
  The bracket is at most $frak(a)^2 + O \( q_0^2 \)$, since $F \( r_(-) \) = 0$ and the profile is smooth.
    For $r_K gt.eq r_(+)$,
  $ Delta < r_K^2 \, wide frac(\( r_K^2 + frak(a)^2 \)^2, r_K^2) gt.eq 4 frak(a)^2 . $
  For every fixed $frak(a) > 0$, choosing the original exact-profile depth sufficiently small over a small
    physical parameter range makes (9.10) strictly positive. It is also positive between the horizons,
    where $Delta < 0$, with uniform margins on compact crossings.
    This depth choice was made before the exterior constants and packet parameters.
  In the frozen chart $g^(- 1) d v$ is past-directed with Killing energy $- lambda_(-)$.
    Its radial direction is increasing, since initially
  $ Sigma_K thin d r_K \( g^(- 1) d v \) = lambda_(-) #scale(x: 120%, y: 120%)[\(] r_K^2 + frak(a)^2 +
    Delta F_r #scale(x: 120%, y: 120%)[\)] > 0 $
  by the finite Hamilton–Jacobi root. At the outer horizon its radial covector component has leading coefficient
    $lambda_(-) \( r_K^2 + frak(a)^2 \) \/ Delta$ with bounded remainder.
    The coordinate $T_K + r_(*)$ and the ingoing azimuth are regular, and the angular momentum stays bounded,
    with zero azimuthal coefficient. Thus the ray crosses the future event horizon transversely and spends bounded
    regular $t_e$-time through every fixed compact crossing. The same holds forwards from entry to the deeper
    exit. No timelike stationary Killing field is needed in an ergoregion.
  Near entry, $Q = \( r_K - r_(-) \) f$ with $f > 0$ smooth and axisymmetric.
    Separation and the strict radial potential bound give bounded $\| d theta.alt \/ d r_K \|$.
    Hence $d Q \/ d r_K$ has a positive lower bound in a sufficiently small profile neighborhood of $r_(-)$.
    Singular azimuthal winding does not differentiate $Q$; round colatitude length or smooth sphere charts give
    the same conclusion at poles. Outside this neighborhood the used compact crossing portions are separated from
    the entry level. Compact convergence of the metric and prepared level graphs therefore gives a unique
    transverse entry crossing, separated from all other used portions by a uniform collar.
    Only times $t_T + O_R \( 1 \)$ are needed until a fixed large radius $R$ is reached.
    This comparison does not require the launching azimuthal phase to converge.
  The frozen branch is asymptotically radial. The limiting co-chart is asymptotically affine in differential
    order, with small changes of axes, shear, and boost. At a sufficiently large fixed co-radius $R$,
    followed by sufficiently large $T$, the past-directed lab velocity $upright(bold(w)) =
    d z \/ d \( - t_e \)$ has length $1 + o_(R arrow.r oo) \( 1 \)$ and makes a small angle with $y \/ \| y \|$.
    There $z = z_(*) + O_R \( 1 \)$ and $t_e = t_T + O_R \( 1 \)$,
    with uniformly nondegenerate momentum and velocity normalizations on the whole launch patch.
    Small drift and shear use only the fixed base smallness, not frequency-dependent smallness.
  In the far lab region, with emitter radius $r asymp \| y \|$ and $z = C_e \( q \) + r n$, $t_e = r + q$,
    the far estimates give, uniformly in time,
  #[#set math.equation(numbering: n => "(9.11)")
   $ \| g - eta \| & lt.tilde r^(- 1 + .01) \,\
\| partial g \| & lt.tilde r^(- 2 + .01) + r^(- 1 + e \/ 2) ⟨q \/ r^(delta_f)⟩^(- A_H \/ 2) \,
  wide \| partial^2 g \| = o_(r arrow.r oo) \( 1 \) . $ <pk2:far-ray-coefficients>]
  These are ordinary lab derivatives. To obtain them, use two spare rotations in the point bounds and $partial_i =
    ell_(n \, i) T_l + r^(- 1) b_i Z$. Second derivatives expand with lab times commuted innermost;
    angular and $Z$ terms have an extra $r^(- 1)$, and the remaining low unrestricted jets are at worst a bounded
    coefficient times the displayed bad-field size. The differentiated emitter conversion coefficients remain
    bounded. The smoothed target’s differentiated symbol terms also tend to zero.
  While $upright(bold(w))$ remains close to its crossing value, $d y \/ d \( - t_e \) = upright(bold(w)) +
    s_e \( t_e \)$ lies in an outward cone, $n$ is close to $y \/ \| y \|$, and
  $ frac(d r, d \( - t_e \)) = frac(n dot.op \( upright(bold(w)) + s_e \( q \) \), 1 - n dot.op s_e \( q \)) $
  has positive lower and upper bounds. Thus $q$ decreases at a rate bounded below.
    On each large radial dyad $r tilde.op R_1$, integration in $q$ over an interval of length $O \( R_1 \)$ bounds
    the second term of (9.11) by
  $ O (R_1^(\( e - \( 1 - delta_f \) A_H \) \/ 2)) . $
  Here $A_H < 2$, and the exponent is strictly negative for the fixed far parameters.
    The first term is summable as well. The lab geodesic equation in time parameter bounds both the velocity
    derivative and logarithmic frequency-scale derivative by $C \| partial g \|$;
    spacelike temporal hyperbolicity bounds $\| upright(bold(w)) \|$.
    Choosing $R$ large makes the integrated cost small, closes the outward-cone argument,
    and keeps momentum nondegenerate until $t_e = 0$. The ray then remains in the far portion on which $t_e =
    0$ is the original bridge. Integrating its velocity proves (E1).
  Finally consider the time-dependent null Hamiltonian root in lab coordinates.
    In its first variation, the diagonal blocks and the position-to-momentum block tend to zero with radius by the
    first two derivative bounds in (9.11); the momentum-to-position block is bounded.
    On the rescaled variables $\( epsilon.alt_1 delta z \, delta pi_(upright("sp")) \)$,
    choose $epsilon.alt_1 > 0$ small first and then a sufficiently large fixed radius.
    The rate is then arbitrarily small on the far portion. The complement has time length $O_R \( 1 \)$.
    This gives subexponential all-subsegment propagators. Higher jet induction has the same homogeneous propagator
    and sources made from lower jets and the available subexponential coefficient derivatives.
    It also covers derivatives in the launch-center parameters.
    The integrated connection bound gives bounded tensor parallel transport and inverse. ◻
]

=== 9.5 Constrained complex beams and matching <pk2:beams>

We now transfer the interior packet to the bridge using complex Gaussian beams.
  Their complex phases provide transverse localization through real caustics,
  while superpositions recover oscillatory Cauchy data #cite(label("Ralston1982")) #cite(label("Tanushev2008"))
  #cite(label("LiuRunborgTanushev2013")). We retain the phase-space and matching calculations because we also need
  bounds on growing time intervals and Einstein wave-gauge compatibility.

#thm([Proposition 29.])[
  (Exterior beam approximation).  #emph[For every fixed base-order buffer $N_b$,
    every prescribed inverse accuracy $M_1$, and sufficiently high finite phase and amplitude orders,
    there is a real exterior perturbation $h^B$ such that
#[#set math.equation(numbering: n => "(E2)")
 $ parallel h^B parallel_(C^(N_b)) & lt.eq A_T lambda_p^(N_b + 3 \/ 2) e^(o \( T \)) \,\
upright("reduced-wave and gauge residuals") & lt.eq e^(o \( T \)) (A_T lambda_p^(- M_1) + A_T^2 lambda_p^(P_0)) \,
  wide P_0 = 2 N_b + 7 \, $ <pk2:beam-estimates>]

 after enlarging $N_b$ for the required trace and derivative buffers.
   Its jets match those of $h^p$ at $cal(S)$ with linear error $A_T lambda_p^(- M_1) e^(o \( T \))$.
   The positive exponent $P_0$ depends only on the base orders, not on later formal accuracy.
   On the original initial slice its support lies in (E1), up to arbitrarily thin tube margins.]
] <pk2:beam-proposition>

#proof[
  The construction has four stages. We first propagate complex phase jets and the central tensor amplitude along
    the return rays. We then impose the wave-gauge equations on every finite jet.
    At each inverse frequency order, Gaussian superposition leaves a new central amplitude subject to the gauge
    equation. Choosing its free part to match the interior coefficient makes the real transport hierarchy
    determine the matching normal jets. Finally we choose finite Taylor orders and cutoffs to obtain the required
    residual bounds.
  ===== 9.5.1 Phase and central amplitude transport. <phase-and-central-amplitude-transport.>
  Using the ray, subsegment, and collar bounds just established,
    parameterize centers $Y$ by a fixed patch of the entry slice.
    With spatial entry coordinates $w_s = \( x \, theta \)$, start the phase at
  $ v \( 0 \, w_s \) + i / 2 \| w_s - Y \|^2 \, $
  choosing its temporal root to agree with $d v$ at the center.
    Evolve the phase jets along the real rays in lab time by the complex gradient-graph construction.
    Transverse projection from the entry slice gives a positive imaginary Hessian on the lab slice;
    its spacetime null direction is the ray direction. For the position and momentum differential blocks $P_c \,
    Q_c$, the preserved symplectic identity is
  $ P_c^(*) Q_c - Q_c^(*) P_c = 2 i "Im" M_c \, $
  where $M_c$ is the initial complex Hessian. The all-subsegment bounds imply $P_c^(- 1) =
    e^(o \( T \))$ in bound. The propagated Hessian has positive imaginary part with inverse bounded by
    $e^(o \( T \))$. Taylor composition and reversion use only finite smooth jets at real positions,
    so no spatial analyticity is required.
  The central amplitude propagator is tensor parallel transport times the inverse square root of the density ratio
    formed from
  $ sqrt(\| det g \|) thin k^(t_e) det P_c \, wide k = g^(- 1) d phi . $
  It and its inverse have subexponential all-subsegment bounds.
    Higher transport jets have the same homogeneous propagator with lower-jet subexponential sources.
  ===== 9.5.2 Compatibility of the wave and gauge jets. <compatibility-of-the-wave-and-gauge-jets.>
  Impose both wave transports and gauge equations in the finite Taylor quotient,
    taking the eikonal orders sufficiently high. For a complex phase $phi$ set
  $ frak(h) = g^(- 1) \( d phi \, d phi \) \, quad cal(P)_lambda = cal(P) + i lambda cal(T) - lambda^2 frak(h) \,
    quad cal(C)_lambda = cal(C) + i lambda K \, quad cal(P)_(1 \, lambda) = cal(P)_1 + i lambda cal(T)_1 -
    lambda^2 frak(h) . $
  Here $K$ contracts by $g^(- 1) d phi$ and $cal(T) \, cal(T)_1$ are the tensor and one-form transports.
    Conjugation gives the exact identity $cal(C)_lambda cal(P)_lambda = cal(P)_(1 \, lambda) cal(C)_lambda$.
    In the finite jet quotient where all required eikonal jets vanish, put
  $ W_j = i cal(T) r_(j \, Y) + cal(P) r_(j - 1 \, Y) \, wide q_j = i K r_(j \, Y) + cal(C) r_(j - 1 \, Y) \, wide
    r_(- 1 \, Y) = 0 . $
  The coefficient of $lambda^(2 - j)$ is
  #[#set math.equation(numbering: n => "(9.12)")
   $ i K W_j + cal(C) W_(j - 1) = i cal(T)_1 q_j + cal(P)_1 q_(j - 1) \, wide W_(- 1) = q_(- 1) =
     0 . $ <pk2:beam-defect-identity>]
  The extra phase degrees eliminate every differentiated $frak(h)$ term in these quotients.
    Once lower defects vanish, solving $W_j = 0$ makes $q_j$ satisfy homogeneous one-form transport.
    At launch the contraction by $k$ has the right inverse
  $ f mapsto l ⊗ f + f ⊗ l - f \( k \) l ⊗ l \, wide l \( k \) = 1 . $
  The nonzero pairing is inverted also in formal jets. This fixes the forced gauge components while leaving free
    projected kernel jets for matching.
  ===== 9.5.3 Triangular matching at the entry slice. <triangular-matching-at-the-entry-slice.>
  Integrate the beams with measure $\( lambda_p \/ 2 pi \)^(3 \/ 2) d Y$.
    In a short entry collar, center positions project diffeomorphically,
    with the stated low and subexponential high bounds. At a center,
    the phase difference from $v$ starts quadratically and has positive imaginary Hessian.
    Changing the center variable to its position on the current entry slice and evaluating Gaussian moments gives
    an expansion
  $ e^(i lambda_p v) sum_j lambda_p^(- j) frak(p)_j $
  in integer inverse powers. On the launch surface, set $a_j \( Y \) = r_(j \, Y) \( 0 \, Y \)$.
    The initial phase and normalization give, after removing $e^(i lambda_p v)$,
  $ (frac(lambda_p, 2 pi))^(3 \/ 2) integral e^(- lambda_p \| w_s - Y \|^2 \/ 2) r_(j \, Y) \( 0 \, w_s \) thin d
    Y = a_j \( w_s \) + O \( lambda_p^(- 1) \) e^(o \( T \)) . $
  This holds in each required fixed finite spatial norm once sufficient jets have been supplied;
    tube cutoffs contribute only Gaussian-small errors. The integrand includes the chosen off-center amplitude
    jets. At order $j$, the integrated coefficient is therefore the new central value $a_j$ plus terms already
    fixed by earlier jets. Derivatives of that new central amplitude first enter one inverse power later,
    since odd Gaussian moments vanish. For each fixed $T$, let an auxiliary frequency tend to infinity in the
    differentiated wave and gauge residuals, after supplying sufficiently many finite jets.
    Comparison of coefficients shows that the integrated coefficients satisfy both real-phase hierarchies;
    still unmatched higher jets can be completed subject to their gauge conditions without changing a fixed
    coefficient. Once lower coefficients match $p_i$, $i < j$, their transports match in the collar,
    including their normal derivatives. The forced gauge terms at order $j$ therefore agree,
    so the remaining discrepancy lies in the contraction kernel on the initial slice.
    The free central value cancels it. Extend that kernel value in spatial jets by applying $"Id" -
    R_k K$ to constant-component choices, where $R_k$ is the displayed right inverse.
    These local projected extensions preserve bump support and subexponential bounds.
    The real-phase transport is noncharacteristic at the entry slice.
    Once its sources and the new coefficient value agree, it fixes the same normal derivatives on both sides.
    Thus matching the free central value matches the whole collar and both required Cauchy jets;
    these are not two independent conditions on that value. This closes the constrained triangular induction.
  ===== 9.5.4 Finite orders, localization, and residuals. <finite-orders-localization-and-residuals.>
  All expansions are finite. For last amplitude index $L$, desired spatial degree $D$,
    and a buffer $k_0$ for the required mixed-time jets, it suffices to choose
  $ N_j = D + 2 k_0 + 2 \( L - j \) + 2 \, wide 0 lt.eq j lt.eq L \, $
  after enlarging $D \, k_0$ for the finite Gaussian coefficient calculations.
    The phase is supplied through at least $N_0 + 2$ and farther for the required differentiated eikonal
    remainders. A wave source uses two jets of the preceding amplitude, a gauge source one;
    this backwards choice therefore supplies every needed source and matching jet.
    No bound uniform in $L$ is required. Realize the lab Taylor beams with smooth cutoffs in tubes of radius
    $e^(- b_p T)$, where $0 < b_p < zeta \/ 2$. They may be stopped smoothly after leaving the computing domain
    through its strict inner exit. A residual Taylor power $d$ gains $lambda_p^(- d \/ 2)
    e^(o \( T \))$ under Gaussian localization. Tube-cutoff errors are Gaussian-small,
    and each fixed differentiation loses only a fixed positive power.
    The last transport remainder improves with its finite hierarchy order.
    For differentiated integral remainders in the collar, first restrict to $\| w_s -
    w_(upright("center")) \( s \) \| lt.tilde lambda_p^(- 1 \/ 2 + epsilon.alt_2)$,
    with $epsilon.alt_2 > 0$ small for the specified finite order; the complement is Gaussian-small.
    The Taylor remainder uses just the supplied smooth subexponential jets.
  There are no other entry crossings by Proposition 28, and the far escape is disjoint from the prepared surfaces.
    Each new undifferentiated formal jet costs only $e^(o \( T \))$, irrespective of the chosen finite degree.
    Absolute center integration costs $lambda_p^(3 \/ 2)$, giving the first bound in (E2).
    Nonlinear differences cost at worst the square of that base bound with two extra derivatives, giving $P_0 =
    2 N_b + 7$ in (E2). Increasing formal accuracy adds only finitely many Taylor and transport coefficients,
    each with subexponential fixed jets and its assigned nonpositive frequency power.
    At a fixed base derivative order it does not increase the differentiation loss $lambda_p^(N_b)$ or the
    integration loss $lambda_p^(3 \/ 2)$. The same observation in the interior hierarchy fixes $P_(*)$ from its
    comparison orders before $M_1$ is increased. Constants and the eventual threshold for $T$ may increase with
    formal accuracy. Take real parts, undo trace reversal, and multiply by $A_T$ to obtain $h^B$.
    Enlarged domains through $t_T + O \( 1 \)$ and radius $C \( 1 + T \)$ contain all tubes and their buffers.
    At $t_e = 0$ the tubes lie in the shell (E1), where the slice is the original bridge.
    Gauss–Codazzi and the differentiated wave and gauge residuals show that its induced data,
    set equal to $d$ elsewhere, have a compactly supported constraint defect with the residual bound (E2). ◻
]

=== 9.6 Exact constraints outside a protected ball <pk2:constraints>

The beam seed is only approximately constrained. The following precise correction result permits exact vacuum data
  without fixing the asymptotic charges or disturbing a large interior region.

For a tensor in Cartesian components define

$ parallel f parallel_(H_i^j) = parallel f parallel_(H^j \( B_2 \)) +
  sup_(L gt.eq 1) L^i parallel f \( L thin dot.op \) parallel_(H^j \( 1 < \| dot.op \| < 2 \)) \, wide X^s =
  H_1^(s + 2) xor H_2^(s + 1) . $

Let $Phi$ denote the vacuum scalar and momentum constraint map.

#thm([Proposition 30.])[
  (Protected exterior correction).  #emph[Fix an integer $s gt.eq 3$.
    Suppose $d_B = \( delta + a_B \, b_B \)$ are smooth data on $bb(R)^3$, the metric is positive,
    and all derivatives of $a_B \, b_B$ have symbol orders $- 1 \, - 2$, respectively.
    Suppose a smooth compact source $phi.alt$, supported in ${ \| y' \| gt.eq 1 }$,
    agrees with $Phi \( d_B \)$ there. If
$ parallel a_B parallel_(H_1^(s + 2)) + parallel b_B parallel_(H_2^(s + 1)) + parallel phi.alt parallel_(H_4^s) $

 is sufficiently small, there is a smooth correction $v_c$ supported in ${ \| y' \| gt.eq 1 }$ such that
$ Phi \( d_B + v_c \) = 0 quad upright("there") \, wide parallel v_c parallel_(X^s) lt.eq
  C_s parallel phi.alt parallel_(H_4^s) . $

 The correction is smooth across the support boundary, preserves positivity,
   and satisfies symbol bounds at every order. There is no higher-order smallness assumption and no condition on
   the artificial interior defect. No moment condition is imposed on $phi.alt$;
   the correction may have a noncompact tail changing the asymptotic coefficients.]
] <pk2:correction-theorem>

#proof[
  Apply 35 with $Y^s = H_4^s$ and $X^s = H_1^(s + 2) xor H_2^(s + 1)$.
    Its right inverse fixes the unit inner ball and permits the stated asymptotic tail.
    Its single-base-order nonlinear solve proves both the estimate and higher smoothness without additional
    smallness assumptions. ◻
]

Apply this proposition with

#[#set math.equation(numbering: n => "(9.13)")
 $ rho_T = \( 1 - 2 alpha \) t_T \, wide y' = frac(z - z_(*), rho_T) . $ <pk2:rescaling>]

Write the unperturbed datum on this end as $d = \( h \, K \)$.
  This rescaling keeps the Cartesian metric component functions and multiplies the second-form component functions
  by $rho_T$:

#[#set math.equation(numbering: n => "(9.14)")
 $ tilde(h) \( y' \) = h \( z_(*) + rho_T y' \) \, wide tilde(K) \( y' \) =
   rho_T K \( z_(*) + rho_T y' \) . $ <pk:constraint-rescaling>]

Both constraint components then scale homogeneously by $rho_T^2$.
  Small fixed drift and small $alpha$ give $\| z \| asymp rho_T \| y' \|$ for $\| y' \| gt.eq 1 \/ 2$.
  More explicitly, the original symbol bounds imply, for every fixed derivative order $j$,

#[#set math.equation(numbering: n => "(9.15)")
 $ \| partial_(y')^j \( tilde(h) - delta \) \| lt.eq C_j rho_T^(- 1) \| y' \|^(- 1 - j) \,
   wide \| partial_(y')^j tilde(K) \| lt.eq C_j rho_T^(- 1) \| y' \|^(- 2 - j) . $ <pk:constraint-background>]

The unperturbed scaled pair therefore has $X^s$ size $O_s \( rho_T^(- 1) \)$.
  Cut these perturbations off smoothly to flat data between $\| y' \| = 3 \/ 4$ and $1 \/ 2$;
  no constraint condition is needed on this artificial interior.

By (E1), the scaled beam seed lies strictly outside the unit ball.
  Its size at the chosen solve order tends to zero after $zeta$ is made sufficiently small,
  with only polynomial rescaling costs. The exterior constraint defect, extended by zero,
  is smooth and compactly supported because the seed vanishes near the unit sphere and the remaining data there
  are exactly vacuum. Its norm has the residual bound in (E2),
  with polynomial factors included in $e^(o \( T \))$. Thus every hypothesis of Proposition 30 holds for large $T$.

Undo the scaling and retain $d$ on the protected interior and the rest of the bridge.
  The correction is smooth and identically zero on the protected side.
  The resulting data $d_T$ are smooth, vacuum, positive, and complete;
  outside a compact set their metric is uniformly comparable to the original complete metric.
  They belong to $cal(D)$ at every order, agree with $d$ on $\| z - z_(*) \| < rho_T$ and off the selected end,
  and may change the permitted asymptotic coefficients. Here the Cartesian symbol norms on the end are equivalent,
  at every fixed order, to the fixed-background covariant norms defining $cal(D)$.

For the prescribed $m gt.eq 10$, choose $s gt.eq m + 3$, increasing it also for the comparison and trace buffers.
  Scaled annular Sobolev embedding and unscaling give

#[#set math.equation(numbering: n => "(9.16)")
 $ p_m \( d_T - d \) lt.eq
   e^(o \( T \)) (A_T lambda_p^(m + 5 \/ 2) + A_T lambda_p^(- M_1) + A_T^2 lambda_p^(P_0)) . $ <pk2:data-approximation>]

One extra beam derivative accounts for the second form. To see the unscaling cost for the correction,
  write its scaled components as $\( q_c \, p_c \)$. Its physical components are $q_c \( y' \)$ and $rho_T^(- 1)
  p_c \( y' \)$. Thus a derivative of order $j$, multiplied by the respective physical weights $\|
  z \|^(1 + j)$ and $\| z \|^(2 + j)$, costs at most $C rho_T$ times the corresponding scaled weighted bound in
  both cases. These polynomial factors are harmless. No compact-support assertion about the final exact change at
  infinity is used.

=== 9.7 Ordinary exterior comparison and causal protection <pk2:exterior-comparison>

The corrected data are now exact vacuum data. We next show that their ordinary wave-map evolution supplies the
  entry jets in (9.9). Give $d_T$ to the partial exterior problem on $t_e = 0$.
  Its bent compact portion lies in the dependence region of unchanged data for large $T$.
  Choose the initial lapse and shift as for $g + h^B$, and determine the normal metric derivatives from the actual
  corrected second form and the exact wave-map condition. Spacelikeness makes this algebraic system invertible.
  The resulting metric and first jets differ from $g + h^B$ by the residual bound in (E2),
  by the correction and gauge-defect estimates, and agree exactly with $g$ in the protected region.

Take the exterior comparison through $t_e = t_T + C_2$, with the fixed deeper inner exit and shrinking outer cutoff

#[#set math.equation(numbering: n => "(9.17)")
 $ \| y \| < R_T \( t_e \) \, wide R_T \( t_e \) = C_(upright("out")) \( 1 + T \) +
   V_(upright("out")) \( t_T + C_2 - t_e \) \, $ <pk2:outer-cutoff>]

where $C_(upright("out"))$ includes all needed spatial buffers and $V_(upright("out"))$ exceeds the radial
  causal-speed bound.

#thm([Proposition 31.])[
  (Exterior transfer with exact early agreement).  #emph[For any prescribed small $delta_3 > 0$,
    the localization parameters and far threshold can be chosen so that the exact ordinary wave-map solution
    exists on this finite exterior domain and its error from $g + h^B$, in the required fixed mixed norms, is bounded by
#[#set math.equation(numbering: n => "(E3)")
 $ C e^(delta_3 T) (A_T lambda_p^(- M_1) + A_T^2 lambda_p^(P_0)) . $ <pk2:exterior-error>]

 It is exactly $g$ on the earlier needed compact-in-radius region up to $t_T - alpha' T$,
   where $alpha' > 0$ can be prescribed sufficiently small. In particular, with the choices below,
   its entry jets agree exactly with $g$ for $v < \( 1 - nu_0 \) T$ and otherwise meet (9.9).]
] <pk2:exterior-proposition>

#proof[
  We first prove the exact support assertion; the correction’s tail need not be compact.
    Write $s_(*) = sup \| C'_e \| < 1$, fixed by the base smallness.
    Suppose a causal path from the changed initial support first reaches a fixed sufficiently large co-radius $R$
    at time $tau lt.eq t_T$. Before this hit its lab speed is at most $1 + delta_R$, where $delta_R arrow.r
    0$ as $R arrow.r oo$, also in the exponentially small comparison bootstrap.
    Its initial point is outside the radius $rho_T$ about $z_(*)$, and its hit point is $C_e \( tau \) +
    O \( R \)$. Thus
  #[#set math.equation(numbering: n => "(9.18)")
   $ \( 1 - 2 alpha \) t_T lt.eq \( 1 + delta_R \) tau + s_(*) \( t_T - tau \) + O \( R \) . $ <pk2:first-hit>]
  Equivalently,
  #[#set math.equation(numbering: n => "(9.19)")
   $ t_T - tau lt.eq frac(2 alpha + delta_R, 1 + delta_R - s_(*)) thin t_T + O_R \( 1 \) . $ <pk2:late-first-hit>]
  Since $t_T asymp T$, a fixed large $R$ and a fixed small $alpha$ make the right side less than any prescribed
    small multiple of $T$ for large $T$. Only the inner exclusion radius of the change enters this estimate;
    its outer extent is irrelevant. The beam supports obey the same conclusion by their real centers and
    exponentially thin tube margins.
  Moreover $I \( t_T \) = T$ and $I' lt.eq C_I$ show that the selected entry points with $v < \( 1 - nu_0 \) T$ have
  $ t_e lt.eq t_T - nu_0 / C_I T + O \( 1 \) . $
  Choose $alpha' < nu_0 \/ \( 2 C_I \)$ and make the first-hit allowance smaller still.
    Ordinary local wave-map uniqueness, from exactly equal metric and gauge Cauchy jets,
    proves exact equality on that earlier entry interval. On $s = 0$, the interval of (P1) is $- u_2 lt.eq v lt.eq
    T + c_2$; its negative part is fixed, and its middle and unselected-end portions are protected by finite-time
    domain of dependence. The deeper inner face is future outflow,
    so no past influence can enter from the deep block. There is consequently no additional dependence on an
    unexamined route through the other end.
  For the error estimate use the actual-principal ordinary scalar stress energies on component errors,
    with lab mixed commutations and a small fixed positive mass.
    The future slice normal is a uniformly timelike multiplier,
    and both artificial boundaries have strict outflow fluxes.
    The first- and second-order lab background derivatives that determine the top linear rate are globally bounded
    and tend uniformly to zero far out. Indeed the linear tensor-wave lower terms are connections,
    their derivatives, and curvature, while leading principal commutations use first coefficient derivatives.
    Fix the mass small first, then choose $R$ large: the square-root top rate on the far support is arbitrarily
    small. On its complement that rate is bounded independently of $R$ and $T$.
    Higher background hits multiply lower commuted error norms, with subexponential coefficients.
  The non-small-rate part of the support has time length at most $alpha' T + O \( 1 \)$ by (9.19).
    The lower-jet triangular estimate used in the deep comparison costs just an $e^(o \( T \))$ factor.
    Retaining the exact principal coefficients, quasilinear remainders have an exponentially small packet or
    bootstrap factor against each remaining error placement, plus the source in (E2).
    Ordinary Sobolev product estimates on the uniform annuli and inner charts apply without an inverse lapse loss.
    Initial mixed jets follow from the equation on uniformly spacelike slices.
    Taking the far rate and $alpha'$ sufficiently small therefore gives (E3).
  The parameter inequalities below strictly improve the exponentially small bootstrap.
    Ordinary continuation preserves the two boundary margins; exact wave-constraint propagation yields vacuum.
    Transform the resulting entry jets to the fixed background wedge coordinates.
    The transition and trace costs, with fixed buffers, are only $e^(o \( T \))$.
    The wave-map condition with target $g$ is tensorial and exact.
    Beam matching adds the linear inverse-accuracy bound from Proposition 29.
    The choices below make the total smaller than (9.9); the already proved protected-region statement supplies
    its exact early part. All estimates allow fixed small enlargements for the final gluing. ◻
]

=== 9.8 The order of the parameter choices <pk2:choices>

We verify simultaneously the comparison margins and approximation in the prescribed data topology.
  First fix the finite data order $m$, the correction order $s gt.eq m + 3$,
  the interior and exterior comparison orders, and every Sobolev, normal-jet, and trace buffer.
  Fix $N_b$ large enough for these requirements and then fix $P_(*) \, P_0$ for the quadratic residuals.
  None of these choices depends on formal accuracy.

Choose $delta_2 \, delta_3 > 0$ small relative to $kappa$.
  The deep mass, bulk threshold, and $nu_0$ supply the rate in (P7);
  the far radius and localization parameters $alpha \, alpha'$ supply (E3) and the exact early agreement.
  The far radius may be enlarged later for (E1): the compact top rate is uniformly bounded independently of it.
  These choices use fixed base bounds and qualitative tails,
  with thresholds allowed to depend on the smooth background datum.

Next take $zeta > 0$ small enough for every positive loss in the chosen base norms,
  retaining more than $kappa T \/ 2$ of exponential absorption for the perturbative deep products, and satisfying

#[#set math.equation(numbering: n => "(9.20)")
 $ delta_3 + \( P_0 - 4 \) zeta & < kappa \/ 2 \, & delta_2 + 2 zeta & < kappa \/ 2 \,\
delta_2 + \( P_(*) - 2 \) zeta & < kappa \, & \( m + 1 / 2 \) zeta & < kappa . $ <pk2:positive-choices>]

Choose $0 < b_p < zeta \/ 2$. Only now choose $M_1$ so large that

#[#set math.equation(numbering: n => "(9.21)")
 $ \( M_1 + 2 \) zeta > 3 / 2 kappa + delta_3 \, wide M_1 zeta > kappa + delta_2 \, $ <pk2:inverse-choices>]

and take sufficiently large finite transport, phase-Taylor, and matching orders to achieve this accuracy.
  Finally take $T$ large depending on all choices. Every subexponential factor can be assigned a share of the
  strict margins.

By (9.6) and (9.2), $A_T = exp \( \( - 2 kappa - 2 zeta \) T + o \( T \) \)$ with two-sided size.
  The linear and quadratic exponents in the exterior error are

$ - 2 kappa - \( M_1 + 2 \) zeta + delta_3 \, wide - 4 kappa + \( P_0 - 4 \) zeta + delta_3 . $

Both are strictly below $- 7 kappa \/ 2$ by (9.20)–(9.21).
  After division by $A_T$, the three terms of the deep error have exponent bounds

$ - 1 / 2 kappa + delta_2 + 2 zeta \, wide kappa + delta_2 - M_1 zeta \, wide - kappa +
  delta_2 + \( P_(*) - 2 \) zeta \, $

all strictly negative. This proves the entry condition and both comparison improvements,
  and makes the observation errors $o \( Y_T^(- 2) \)$. The direct beam contribution to the data seminorm has exponent

$ - 2 kappa + \( m + 1 / 2 \) zeta < 0 \; $

the two correction contributions in (9.16) also tend to zero.
  Thus $p_m \( d_T - d \) arrow.r 0$ for this prescribed finite $m$.
  Smooth membership of every $d_T$ was already obtained from the correction theorem;
  no single frequency exponent has to give convergence at all orders.

=== 9.9 Attachment to the whole corrected bridge <pk2:attachment>

The finite exterior and deep solutions have now been constructed with exact constraints, matching jets,
  and strict margins. It remains to identify their observation with a point of the full MGHD of the whole
  corrected datum. We attach these finite solutions to a lower development containing every radius of the
  corrected bridge, then use the outflow cuts to prove that the bridge remains Cauchy.

#thm([Proposition 32.])[
  (Full-bridge Cauchy attachment).  #emph[For sufficiently large finite $T$,
    the exact data $d_T$ have a smooth globally hyperbolic vacuum development containing the entire initial bridge
    and the finite observation from Lemma 30. Its adaptive backward geodesic reaches $Sigma$ with a seed $w_T
    arrow.r w$. The development embeds openly in the full MGHD of $d_T$,
    retaining the entire constraint-correction tail on $Sigma$.]
] <pk2:attachment-proposition>

#proof[
  The corrected data are complete and converge in $p_10$. They agree with $d$ off the selected end and inside the
    protected ball. The center satisfies $\| z_(*) \| lt.eq s_(*) t_T + O \( 1 \)$, with $s_(*) < 1 - 2 alpha$,
    so that this ball contains the fixed-origin ball of radius
  $ \( 1 - 2 alpha - s_(*) \) t_T - O \( 1 \) arrow.r oo . $
  Every fixed compact causal shadow used in the early bridge construction is therefore unchanged for large $T$.
  Construct the full finite lower bridge development for $d_T$,
    including all initial spatial radii and a past collar, by the finite-range Cauchy argument already proved.
    The bounded central joins, the unselected end, and the bent compact part of the selected $t_e =
    0$ slice agree with the original finite solution by domain of dependence.
    Near infinity the selected horizontal slice is the original initial surface carrying the actual corrected
    data, including their tail.
  Attach the selected ordinary wave-map exterior comparison through an enlarged band about the fixed time $t_a$,
    only inside (9.17) and before its terminal time. Use the finite wave-map uniqueness and straightening from the
    comparison development construction, with the same new data on both sides.
    Fixed-time bounds and strict deeper outflow and spatial margins give the identification,
    uniformly through the finite outer cutoff. The straightening agrees on the used band and is cut off inside its
    margin; on bounded central portions it is the original identification because those solutions remain unchanged
    until much later.
  To see why the entire initial bridge is retained, put $f \( t_e \, y \) = \| y \| -
    R_T \( t_e \)$ and let $t_(upright("end"))$ denote the comparison terminal time. Locally the selected-end union is
  #[#set math.equation(numbering: n => "(9.22)")
   $ { t_e < t_(upright("end")) } ∩ #scale(x: 120%, y: 120%)[\(] { t_e < t_a } union { f < 0 }
     #scale(x: 120%, y: 120%)[\)] \, $ <pk2:partial-union>]
  with the lower $cal(S)$ cut imposed where active. The lower set $t_e < t_a$ includes every spatial radius;
    only the added future block is truncated. On future causal curves,
  $ frac(d f, d t_e) = frac(d \| y \|, d t_e) + V_(upright("out")) gt.eq V_(upright("out")) - V_(upright("max")) > 0 . $
  Thus the strict sublevels, their union, and their intersection in (9.22) are preserved to the past.
    A past curve in the added block retains $f < 0$ until it crosses $t_a$,
    then enters the unrestricted lower block. It cannot end at the omitted corner $t_e = t_a$, $f = 0$.
    Unmatched future faces are omitted; the original bridge is not truncated or replaced by the old datum outside
    the computing cutoff.
  The used portion of $cal(S)$ and a matching collar lie within the available margins.
    Its large positive endpoint has $t_e lt.eq t_T + O \( 1 \)$ and bounded co-radius,
    while the middle and unselected portions are unchanged. The fixed background surface is still spacelike for
    the new metric. Its exact comparison jets and wave-map gauge agree with the deep Cauchy data.
    In the common background collar, identify the deep vacuum solution across it,
    retaining only the strict interior of (P1).
  More explicitly its active future cuts are
  $ s < s_(upright("max")) \, wide F_0 = u + c_0 s \/ T < u_2 \, wide F_1 = v + c_0 s \/ T < T + c_2 \, wide
    s_(upright("max")) = \( T + u_(*) \) \/ 2 + c_0 . $
  If $epsilon_T$ is the exponentially small relative cone error, then $d u \/ d s \, d v \/ d s gt.eq -
    C epsilon_T$ and hence
  $ frac(d F_i, d s) gt.eq c_0 \/ T - C epsilon_T > 0 . $
  The signal point has $v = T$, $u = u_T < u_(*)$, with terminal margin at least $c_0$ and strict side margins by
    the choice of $c_0$. Past causal paths therefore reach $s = 0$ strictly inside the attached interval.
    For each finite $T$ all relevant coordinate ranges are bounded and the metric is nondegenerate,
    so ordinary continuation handles interior endpoints.
  Omit every unused future face and edge from the lower pieces.
    Their retained neighborhoods at intersections of cuts are finite unions and intersections of the same
    past-preserved strict sublevels; such corners cannot be past endpoints from the interior.
    Use the identified collars to make the product gluing of the comparison development,
    with no duplicate open continuations. This yields a smooth Hausdorff vacuum manifold.
    Every past-inextendible causal curve from the experiment reaches the entry slice and then the complete
    corrected bridge. Lower pieces have the finite Cauchy control already proved;
    bounded speeds exclude escape to infinity in bounded time.
    The past collar supplies the other direction of the Cauchy property.
    Thus $Sigma$ is Cauchy, and the maximal-development theorem embeds this development into the full MGHD of $d_T$.
  Finally the fixed earlier compact segment of the background geodesic,
    through its transverse entry and back to $Sigma$, lies with a neighborhood in the unchanged region for large
    $T$. The backward entry states from Lemma 30 continue through this fixed tube to seeds $w_T arrow.r
    w$ by ordinary geodesic flow dependence. This proves both the attachment and the seed assertion. ◻
]

=== 9.10 Completion of the finite observation and genericity <pk2:conclusion>

#proof[
  Fix $m$, $eta$, and $J$. If a relatively open neighborhood $cal(V)$ of $d$ is also prescribed,
    choose a finite order $m_(cal(V))$ and $eta_(cal(V)) > 0$ such that the relative ball
    $p_(m_(cal(V))) \( d' - d \) < eta_(cal(V))$ lies in $cal(V)$.
    Replace the construction order by $hat(m) = max \( m \, m_(cal(V)) \, 10 \)$ and its tolerance by $hat(eta) =
    min \( eta \, eta_(cal(V)) \)$; without a prescribed neighborhood use $hat(m) = m$ and $hat(eta) = eta$.
    Make all choices in Subsection 9.8 at this enlarged finite order.
    The constrained beam correction gives smooth complete exact vacuum data $d_T$ satisfying (9.16).
    The ordinary exterior comparison supplies the exact entry jets required by the deep comparison.
    Lemma 30 gives the strict finite tidal observation and convergent backward entry states.
    Proposition 32 places the point, its frame, and its geodesic back to $Sigma$ in the full MGHD of $d_T$,
    with $w_T arrow.r w$. Convergence in $p_(hat(m))$ attains both the original tolerance and the prescribed
    neighborhood for sufficiently large finite $T$. The frequency exponent may depend on this enlarged order;
    no convergence in all seminorms for one fixed construction is asserted. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Use the single base neighborhood constructed in the preceding
    sections. Fix $O \, N$, $d in cal(B) \( O \, N \)$, a finite $m gt.eq 10$, and a tolerance $eta > 0$.
    The first-runout and corner-to-branch arguments give a seed $w in O$ with a noncorner first runout.
    The closed test $A \( O \, N \)$ supplies its bounded parallel curvature,
    whether or not this new branch seed itself has a regular exit.
  Choose a neighborhood of $\( d \, w \)$ on which the bounded-seed tidal comparison has a common constant $C_1$:
  $ \| "Riem" \( U' \, X' \, U' \, X' \) \| lt.eq C_1 Q_(d') \( w' \, tau \) quad
    upright("for ") g_(d') \( X' \, X' \) = 1 \, quad g_(d') \( X' \, U' \) = 0 . $
  Indeed parallel transport back to the initial frame gives the explicit factor $\( 1 + 2 h' \( w' \, w' \) \)^2$,
    uniformly bounded near $\( d \, w \)$. Choose $J > C_1 N$ before constructing the late experiment.
    Apply Proposition 26 with tolerance smaller than
  $ min {eta \, epsilon.alt - p_10 #scale(x: 120%, y: 120%)[\(] d - \( h_(*) \, K_(*) \)
    #scale(x: 120%, y: 120%)[\)]} . $
  The second quantity is positive. For large finite $T$, one has $w_T in O$, $d_T in cal(U)_epsilon.alt$,
    $p_m \( d_T - d \) < eta$, and, at the finite point in its full MGHD,
  $ Q_(d_T) \( w_T \, tau_T \) gt.eq C_1^(- 1) \| "Riem" \( g_(d_T) \) \( U_T \, X_T \, U_T \, X_T \) \| > N . $
  This is exactly the destruction of the closed test required in Section 2.
    Each relative closure of $cal(B) \( O \, N \)$ is therefore nowhere dense.
    Their countable union covers the future-extendible data, proving the stated meagreness and the
    open-dense-intersection assertion.
  We recall why the same $epsilon.alt$ serves all these tests.
    The physical profile range and depth, computing depths, ray and horizon margins are fixed first at the given
    mass and spin. Next come the cylinder gauges, measuring radii, compact/far absorption scales,
    fixed overlap times and regions, and the base-order continuation thresholds for the exterior, entry,
    and double-null constructions. All resulting base input conditions on the two ends, bent slices,
    and finite joins follow from one sufficiently small $p_10$ threshold.
    Higher smooth estimates for a particular $d$ have datum- and order-dependent constants,
    but arbitrarily small exponential rates obtained by later-time or larger-radius choices,
    without higher-order data smallness. The seed family, $N$, the finite $m$, branch location, comparison orders,
    frequency, formal accuracy, and late time affect only this finite experiment.
    They do not alter the base neighborhood. All spin gaps and constants need be positive only for the fixed $0 <
    frak(a) < M$, as required. ◻
]

== 10 Far-region geometry and energy estimates <fe:section>

We prove the energy estimate used in 6 for a smooth finite slab $0 lt.eq t lt.eq t_(upright("end"))$.
  The structural inputs are the lab equation and differentiated gauge in Lemma 19,
  and the initial and starting-annulus bounds in Lemma 20. We derive the point estimates needed for the
  coefficients, then prove the two multiplier estimates conditional on explicit source budgets.
  Appendix 11 supplies those budgets; the simultaneous exterior closure is proved in Proposition 17.
  The radial weighted currents follow the method of Dafermos–Rodnianski #cite(label("DafermosRodnianski2010"))
  Sections 3–4, adapted here to the moving emitter coordinates and the coupled source estimates.

Throughout, smallness of the finite-slab norms is a bootstrap hypothesis;
  their finiteness follows from finite-time smooth existence and symbol decay.
  Constants on superlinear terms may depend on all fixed scales.
  Linear constants acting #emph[on other far quantities] in absorption or finite hierarchies are independent of
  both large matching radii. Take $R_0$ beyond all spatial kernels and the transition where target smoothing
  reaches its prescribed far form. Comparable smoothed radii use the same positive acceleration majorant
  $tilde(a)$ on a slightly enlarged sampling interval at that scale.

=== 10.1 Emitter coordinates and the three energy levels <fe:coordinates>

For the calculations in both far appendices we abbreviate $T_l \, C_e \, s_e \, ell_n \, delta_f \, tau_f \,
  l_f \, m_f \, M_f$ by $T \, C \, s \, ell \, delta \, tau \, l \, m \, M$, respectively, and write $X \,
  macron(X)$ for $X_g \, macron(X)_g$. These are the same coordinates, fields and weights as in 6.

In the lab chart put

$ C \( q \) = - lambda \( q \) \, quad s \( q \) = C' \( q \) \, quad t = q + r \, quad z = C \( q \) + r n \,
  quad \| n \| = 1 \, quad k = 1 - s \( q \) dot.op n . $

These are smooth coordinates for large emitter radius $r$, by the small speed and the implicit function theorem;
  the radii $\| x \| \, \| y \|$ of the reduction are comparable to $r$ (the position differences on time
  intervals of length $O \( r \)$ are small times $r$; use also the contraction defining $x$). Work with

$ T = partial_(t \, upright("lab")) \, quad L = partial_(r \| q \, n) = T + n dot.op partial_z \, quad
  Z = \( S = r L \, Omega \) \, quad s_s = - v_s \, quad D = T + s_s dot.op partial_z \, $

where $Omega$ are the spherical rotations at fixed $q \, r$.
  Angular differentiations below can equivalently use finite smooth frames.
  Components of tensor fields in all the far wave differentiations are #emph[lab] components.
  Write $H^(i j) = g^(i j) - eta^(i j)$, $ell_i = \( 1 \, - n \)$,
  and subscript $ell ell$ for contraction of upper indices with this pair.
  The lab null contravariant vector corresponding to $- eta^(i j) ell_j$ is $L$. Derivatives have the identities

$ partial_i = ell_i T + r^(- 1) b_i Z = ell_i k^(- 1) partial_q + r^(- 1) \( b_i - ell_i k^(- 1) s^d b_d \) Z \; $

$b_t = 0$, $b_d Z = n_d S +$ a tangential spherical derivative for spatial indices.
  In particular the $q$-derivative of the second good-frame coefficient (before $r^(- 1)$) is proportional to
  $ell_i$ and of size $O \( \| a \( q \) \| \)$. All filtered unsmoothed acceleration jets needed below are
  bounded and decay with at least $chevron.l q chevron.r^(- A \/ 2)$ on positive times,
  by the compact budgets and (5.16), and are zero at negative times. The enlarged average has

$ r tilde(a) lt.tilde sans(N) \( 1 + t \/ r \)^(- A \/ 2) $

by $L^1$ for $t lt.tilde r$ and weighted Cauchy–Schwarz for $t gt.double r$.
  Here and in low point estimates $sans(N)$ can include the data norm,
  and fixed compact-reaching constants multiplying small quantities are allowed when such bounds are used
  #emph[nonlinearly]. Derivatives of $s_s$ of positive order $d$ are $O \( r^(1 - d) tilde(a) \)$ in the lab
  chart; $B - eta$ has symbol size $O \( r^(- 1) \)$ there in all the spacetime derivatives.
  With ordered commutations ($T^j$ first, then $Z^I$) these retain their respective bounds ($T$ a lab derivative,
  $Z$ scaled first order); arbitrary re-expansions differentiating emitter frame factors need not gain powers for
  additional $T$’s. For example $T^m n = O \( 1 \/ r \)$ for finite $m gt.eq 1$, with $Z$-derivatives allowed.

Use three levels labeled $0 \, H \, P$. Their unscaled fields $U_i$, number of commutations $N_i$,
  time exponents $A_i$, and outgoing powers $p_i$ are

$ i & U_i & N_i & A_i & p_i\
0 & h & 9 & 0 & .64\
H & h & 8 & 1 - eta_(*) & 1 - eta_(*) \/ 6\
P & psi = D h & 7 & A = 1.36 & 1.62 . $

Here $eta_(*) > 0$ is sufficiently small, say at most $10^(- 8)$.
  Put $delta = eta_(*) \/ 100 \, med nu = 10 delta \, med e = .1 delta \, med d_(*) = 200 eta_(*)$.
  The strict margins serve different purposes and will be kept throughout:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Margin
], table.cell(rowspan: 1, colspan: 1)[Use
]),
  table.cell(rowspan: 1, colspan: 1)[$p_0 \, p_H < 1$
], table.cell(rowspan: 1, colspan: 1)[Initial energy for arbitrary $r^(- 1)$ metric tails
],
  table.cell(rowspan: 1, colspan: 1)[$p_i > A_i$, $p_i + .1 A_i < 2$
], table.cell(rowspan: 1, colspan: 1)[Positive outgoing bulk and Hardy control
],
  table.cell(rowspan: 1, colspan: 1)[$A > 1$
], table.cell(rowspan: 1, colspan: 1)[Time integrability of the acceleration
],
  table.cell(rowspan: 1, colspan: 1)[$2 A_H > A$
], table.cell(rowspan: 1, colspan: 1)[Weak-field products in the strong equation
],
  table.cell(rowspan: 1, colspan: 1)[$p_P - A = .26$
], table.cell(rowspan: 1, colspan: 1)[Radius-uniform pairing with adjoint zero modes
],
)
]

Take

$ mu = chevron.l q \/ r^delta chevron.r \, quad l = chevron.l q \/ r^nu chevron.r \, quad
  m = \( r^(- 1) + l^(- 1) \)^(- 1) \, quad W_i = r^(p_i - A_i) \( t + 10 r \)^(A_i) . $

Use time-energy weights, for commutations with $j$ lab times,

$ w_H & = r^(- e) mu^(A_H) \,\
w_(P \, j) & = w_H l^(A - A_H) m^(- \( 7 - j \) d_(*)) \,\
w_(0 \, j) & = r^(- .02) thin m_(-)^(j d_(*)) m_(+)^(- \( 9 - j \) d_(*)) . $

Here $m_(-)$ is a smooth positive monotone weight in $- q \/
  r^nu$ comparable to $1 + \( - q \/ r^nu \)_(+)$ (constant on the nonpositive half-line,
  bounded logarithmic-symbol derivatives); $m_(+)$ is the analogous weight in $q \/ r^nu$,
  capped smoothly by harmonic addition at $r$ as for $m$. The comparability in this text always allows fixed
  constants. Put $tau = 1 + t \/ r$. Thus $W_i asymp r^(p_i) tau^(A_i)$; $W_i \/ w_(i \, j) lt.double r^(2 - .3)$,
  and in particular $w_(P \, j) gt.tilde chevron.l t chevron.r^A r^(- .025) \, med
  w_H gt.tilde chevron.l t chevron.r^(A_H) r^(- e - delta A_H)$ for $t gt.double r$.

Our scalar wave unknowns (componentwise) are

$ chi = Z^I \( r T^j U_i \) \, wide n_(*) = \| I \| + j lt.eq N_i . $

We write $B_1 chi$ for its full first derivatives (size comparable to $\| partial_q chi \| +
  r^(- 1) \| Z chi \|$), and $G_1 chi = r^(- 1) Z chi$. In formulas indicating bounds,
  lists of fields/derivatives denote their Euclidean size, with sums over finite components or lower commutations
  as specified. The main measured quantities, before specifying a current correction, are

#[#set math.equation(numbering: n => "(10.1)")
 $ L^2 \( d t thin d r thin d omega \/ r \) : & W_i^(1 \/ 2) \( G_1 chi \, chi \/ r \) \, quad
   w_(i \, j)^(1 \/ 2) B_1 chi \,\
L_t^oo L^2 \( d r thin d omega \) : & W_i^(1 \/ 2) G_1 chi \, quad w_(i \, j)^(1 \/ 2) B_1 chi $ <fe:F1>]

on $r gt.eq R_0$. Here $d omega$ is round measure of $n$.
  In particular the #emph[flat] good derivatives are included.
  The total size $sans(F)$ sums these and the extra current norms below;
  quantities on a starting overlap annulus a fixed factor farther in, when needed in estimates,
  can instead use $C \( R_0 \) sans(K)_R + C_(upright("fix")) \( e_(upright("in")) + sans(N)^2 \)$,
  by the co/lab comparisons on bounded annuli. Indeed changing $u$ to $psi$ costs only field-derivative products
  with strong coefficient differences such as $v \( t \) - v_s$ there.
  No supremum of characteristic flux in this overlap is required from compact estimates.
  All a priori integrations are for smooth solutions with finite symbol decay on bounded intervals;
  or one first truncates at infinity where this decay gives the limiting estimates.
  The time-zero energies have the stated orders by the initial symbol controls ($T^j$ costs at least $r^(- j)$ on
  undifferentiated initial jets, startup flat). For $h$, even with no lab-time commutation, $p_i < 1$;
  for $D h$ the extra decay easily gives finiteness. Constants on the input may depend on fixed scales.

=== 10.2 The wave-gauge constraint and weak-null structure <fe:weak-null>

The weak-null organization of the Einstein equations in wave coordinates is due to Lindblad–Rodnianski
  #cite(label("LindbladRodnianski2003")) Sections 3–5; see also #cite(label("LindbladRodnianski2010")).
  The component calculation below records the precise polarization and weighted source structure required here.

The lab gauge identity on the end gives an improved differentiated constraint.
  With $Gamma_mu \( g \) = g^(a b) Gamma \( g \)_(mu \; a b)$ (semicolon here separates the lowered first
  Christoffel index), it is

$ Gamma_mu \( g \) = g_(mu sigma) g^(a b) Gamma \( B \)_(a b)^sigma + Theta_mu . $

In particular its size is $O \( r^(- 2) \)$. Subtracting the first derivatives of $B$,
  the flat linear gauge of $h$ costs terms with smooth coefficients of sizes

#[#set math.equation(numbering: n => "(10.2)")
 $ O \( \( r^(- 1) + \| h \| \) partial h \) + O \( r^(- 2) h \) + Theta . $ <fe:F2>]

These are structural product bounds: the first coefficient is smooth vanishing in $B - eta \, h$;
  linear-size fixed coefficients obey lab symbol differentiation,
  including the enlarged-average bounds for $Theta$; differentiation in $h$ obeys the chain rule.
  Also the reduced wave equation has the form

$ g^(i j) partial_(i j) h = f_h \; $

its pure-background term is of symbol size $O \( r^(- 2) tilde(a) \)$,
  with $D$ derivative $O \( r^(- 3) tilde(a) \)$, and the remaining terms have sizes/structure

#[#set math.equation(numbering: n => "(10.3)")
 $ O \( r^(- 2) partial h + r^(- 3) h \) + Q_eta \( partial h \, partial h \) +
   O \( \( r^(- 1) + \| h \| \) \| partial h \|^2 \) . $ <fe:F3>]

Here smooth bounded multiplicative coefficients, lab symbol background coefficients as above,
  and smooth functions of $h$ are understood in the $O$’s. $Q_eta$ is a constant flat quadratic polynomial.
  On replacing $partial_i h$ by $ell_i p$ with $ell^mu \( p_(mu nu) - 1 / 2 eta_(mu nu) upright("tr")_eta p \) =
  0$, it is a constant multiple of

$ ell ⊗ ell med \| Pi \( n \) p \|^2 \, $

where $Pi$ takes the two-dimensional tracefree tangential part on the spatial screen.
  Thus errors of this replacement with $p = T h$ use either a good derivative or a factor of the gauge error
  (10.2). To check the structure, write Ricci as $- 1 / 2 g^(a b) partial_(a b) g_(mu nu) +
  partial_(\( nu) Gamma_(mu \)) \( g \)$ plus the products

$ \( partial_a g^(a b) \) Gamma \( g \)_(b \; mu nu) - \( partial_(\( nu) g^(a b) \) partial_a g_(mu \) b) +
  Gamma_(a d)^a Gamma_(mu nu)^d - Gamma_(nu d)^a Gamma_(a mu)^d . $

Substitute the gauge identity. Pure terms at $h = 0$ are Ricci of the target plus differentiated compensator
  terms. In the flat product evaluation the first two displayed products cancel on $ell p$ as above.
  Writing the Christoffel matrices at fixed $mu$ as $\( ell_mu p^sharp + p_mu^sharp ⊗ ell - ell^sharp ⊗ p_mu \) \/
  2$, the last two products then give $\( \( upright("tr") thin p \)^2 \/ 8 - upright("tr") \( p^2 \) \/ 4 \)
  ell_mu ell_nu$, as asserted by the constrained-component relation in the flat null frame.
  This calculation also works polarized. One can differentiate in lab coordinates first and project afterwards,
  or retain (10.2) as an exact error identity; when differentiating projected formulas each lab differentiation
  hitting the frame has a factor $O \( 1 \/ r \)$ with bounded emitter jets.
  Here the tangent $p^sharp$ notation uses flat raising. For completeness,
  rotate the screen so that $n = \( 1 \, 0 \, 0 \)$ and use $eta = "diag" \( - 1 \, 1 \, 1 \, 1 \)$,
  $ell = \( 1 \, - 1 \, 0 \, 0 \)$. The four gauge relations are solved by the six-parameter matrix

$ p = mat(delim: "(", a, b, c, d; b, - a - 2 b, - c, - d; c, - c, e, f; d, - d, f, - e) . $

Consequently $"tr"_eta p = - 2 \( a + b \)$, $"tr" \( \( eta^(- 1) p \)^2 \) = 2 \( a + b \)^2 + 2 \( e^2 + f^2 \)$, and

$ 1 / 8 \( "tr"_eta p \)^2 - 1 / 4 "tr" \( \( eta^(- 1) p \)^2 \) = - 1 / 2 \( e^2 + f^2 \) = - 1 / 4 \| Pi p \|^2 . $

Polarization gives the same identity with $\| Pi p \|^2$ replaced by the screen pairing of two constrained
  tensors. Thus the quadratic restriction and the projection cancellation remain valid when the two factors carry
  different ordered commutations.

We will also use the corresponding projection onto the constrained plane. Define

#[#set math.equation(numbering: n => "(10.4)")
 $ cal(G)_n p & = ell^mu \( p_(mu nu) - eta_(mu nu) "tr"_eta p \/ 2 \) \, & breve(p) & = p - J_n cal(G)_n p \,\
cal(G)_n J_n & = "Id" \, & Pi J_n & = 0 . $ <fe:gauge-projection>]

The matrix calculation shows that $cal(G)_n$ has rank four and that every screen polarization occurs in its
  kernel. Its restriction to $ker Pi$ is therefore surjective;
  taking the Euclidean right inverse on this restriction gives a smooth bounded $J_n$.
  Consequently $cal(G)_n breve(p) = 0$ and $Pi breve(p) = Pi p$.
  The four gauge errors measure exactly the $L L$, $L$–screen, and screen-trace components.

=== 10.3 The scalar emitter operator <fe:emitter-operator>

For a scalar, the emitter operator is

$ P_g chi := k r g^(i j) partial_(i j) \( chi \/ r \) \, wide P_eta chi = - 2 partial_q partial_r chi +
  r^(- 2) cal(A)_s chi \, $

#[#set math.equation(numbering: n => "(10.5)")
 $ cal(A)_s = \( 1 + s dot.op n \) \( S^2 - S \) - 2 \( s dot.op n \) \( S - 1 \) + 2 s^A nabla_A \( S - 1 \) +
   k Delta_(bb(S)^2) . $ <fe:F4>]

Here is a direct computation that also records the absence of acceleration terms in the flat operator.
  Put $sigma = s dot.op n$ and let $gamma$ be the round screen metric. The nonzero covariant entries are

$ eta_(q q) = - 1 + \| s \|^2 \, quad eta_(q r) = - k \, quad eta_(q A) = r s_A \, quad eta_(A B) = r^2 gamma_(A B) . $

Their inverse and density are

$ eta^(q r) = - k^(- 1) \, quad eta^(r r) = \( 1 + sigma \) \/ k \, quad eta^(r A) = s^A \/ \( k r \) \, quad
  eta^(A B) = r^(- 2) gamma^(A B) \, quad sqrt(\| det eta \|) = k r^2 sqrt(det gamma) \, $

with $eta^(q q) = eta^(q A) = 0$. In the divergence formula the only coefficient differentiated in $q$ is $k r^2
  eta^(q r) = - r^2$, which is independent of $q$. Using $nabla_A s^A = - 2 sigma$ and $nabla_A k = - s_A$ gives

$ P_eta chi = - 2 chi_(q r) + \( 1 + sigma \) chi_(r r) - frac(2 sigma, r) chi_r + frac(2 sigma, r^2) chi +
  frac(2 s^A, r) nabla_A chi_r - frac(2 s^A, r^2) nabla_A chi + k / r^2 Delta_gamma chi . $

Replacing $r partial_r$ by $S$ proves (10.5). More generally for an upper-index coefficient $J^(i j)$,
  the additional expression $P \[ J \] chi = k r J^(i j) partial_(i j) \( chi \/ r \)$ consists of

#[#set math.equation(numbering: n => "(10.6)")
 $ J_(ell ell) partial_q \( k^(- 1) partial_q chi \) +
   O
   (J / r \( 1 \, Z \) partial_q chi + J / r^2 \( 1 \, Z \, Z^2 \) chi + frac(a \( q \), r) J_(ell ell) \( 1 \,
   Z \) chi) \, $ <fe:F5>]

where the other coefficients are smooth bounded functions of $n \, s \( q \)$.
  This follows from the derivative formula above (including differentiating $1 \/ r$);
  a derivative of a good-frame coefficient in $q$ has the extra $ell$ contraction.
  The term with $a \( q \)$ allows contractions of its components.
  These identities apply #emph[after] lab times have been commuted.

=== 10.4 Spacelike anchors and point estimates <fe:anchors>

The following estimates are implications of the finite-time bootstrap norms, (10.2), and (10.3);
  they do not assume the uniform estimate that will close the bootstrap.

The starting scale can and will always be taken so large that even the inner band radii of the following auxiliary
  construction (a fixed constant times $Q gt.tilde R_0^.45$) are in the lab symbol regime beyond all spatial
  kernels and all fixed smoothing transitions. No comparison with compact estimates at radii of this size is used
  as input for the spacelike observation.

#thm([Lemma 31.])[
  (Spacelike anchors).  #emph[For $r asymp R_f \, med q lt.eq - R_f^theta \/ 10$, $theta = .45$,
    the center is zero. On a band $- q asymp Q$, we have
#[#set math.equation(numbering: n => "(10.7)")
 $ parallel Z^I \( r T^j h \) parallel_(L_omega^2)
   lt.tilde \( e_(upright("in")) + sans(S)_a \) \( r \/ Q \)^(1 \/ 2) quad \( \| I \| + j lt.eq 9 \) \, $ <fe:F6>]

 allowing fixed input constants; the constant here on $sans(S)_a$ is uniform far out.
   Also the ordinary unweighted $L_z^2$ energy on such a band at fixed $t$ of Minkowski commutations through nine
   is $lt.tilde \( e_(upright("in")) + sans(S)_a \) Q^(- 1 \/ 2)$.]
] <fe:spacelike-anchors>

#proof[
  These anchors will be proved without a characteristic commutator estimate. Up to time $lt.tilde R_f$ work outside
  $ \| z \| gt.eq t + c Q + C_1 integral_0^t \( \( u + Q \) Q \)^(- 1 \/ 2) d u $
  with $c$ a sufficiently small fixed band constant, $C_1$ large fixed.
    Indeed its ratio to $Q$ is bounded by $C sqrt(R_f) Q^(- 3 \/ 2) lt.tilde R_f^(\( 1 - 3 theta \) \/ 2) =
    R_f^(- .175)$, so the correction is $o \( Q \)$ uniformly on the band.
    Bootstrap unweighted slice energies of $h$ after rotations, boosts,
    translations and the flat dilation through order nine by a large constant times
    $\( e_(upright("in")) + sans(S)_a \) Q^(- 1 \/ 2)$. The initial norm involves at most ten derivatives of $h$
    and at most nine derivatives of its initial normal jet, all controlled by the small initial seminorm.
    The squared integral of the leading $r^(- 2)$ first jet outside $r asymp Q$ is $O \( Q^(- 1) \)$,
    which gives the claimed initial energy. Radial integration to infinity gives the commuted fields in
    $L_omega^2$ of size $O \( \| z \|^(- 1 \/ 2) \)$ times the energy, and sphere sup with two spare rotations.
    The boundary moves at least as fast outwards as the outgoing light speeds including bootstrap errors.
    The lab time multiplier for the true principal is uniformly timelike and controls full unweighted first
    derivatives. Here are the energy error details. Commuting the principal leaves,
    besides constant linear multiples of lower flat wave terms (eliminate recursively),
    terms $cal(Z)^b H^(i j) partial^2 cal(Z)^d h$, $b + d lt.eq 9 \, d < 9$, for the Minkowski list $cal(Z)$,
    including index mixing by commutators with derivatives. The first factor is bounded on the sphere by $C \/ \|
    z \| + C_(upright("boot")) \( e_(upright("in")) + sans(S)_a \) \( Q \| z \| \)^(- 1 \/ 2)$; if high,
    use only $L_omega^2$ on it, placing two extra rotations on the low second factor.
    Smooth composition has the same placements. One derivative of the second factor costs at most $C \/
    Q$ times one dilation/boost/rotation commutation and lower terms (apply to first derivatives).
    Derivative-of-principal energy errors and the differentiated quadratic first-jet terms of (10.3) obey the same
    product bounds, using the derivative placement with $1 \/ Q$ on a coefficient.
    Linear lower terms with symbol-decaying coefficients do also, by energy/Hardy or the commuted field bound.
    For instance a coefficient $O \( \| z \|^(- 3) \)$ times a high field costs $C \( t + Q \)^(- 2)$ times the
    energy at that order. The time integrals of all multiplier losses just described are $o \( 1 \)$,
    including $O \( sqrt(R_f) Q^(- 3 \/ 2) \)$. The pure defect commutations cost $C sans(S)_a \|
    z \|^(- 3)$ pointwise and $lt.tilde sans(S)_a Q^(- 1 \/ 2)$ in $L_t^1 L_z^2$.
    This proves the auxiliary bootstrap by the ordinary domain energy inequality.
    At a spacelike evaluation band, $Z$ and its iterates can be expanded with bounded coefficients in these
    commutations ($r \( T + partial_(\| z \|) \)$ uses the sum of a boost and dilation);
    the corresponding first-jet statements include $O \( 1 \/ r \)$ coefficient derivatives.
    This gives (10.7), uniformly also if the lifespan truncates the band. ◻
]

In low point estimates on products below we abbreviate a constant times small bootstrap size by $N$.
  This can include fixed input and fixed compact-to-far point constants.
  When (10.7) is used on a #emph[linear] energy error we keep its specified independent bounds instead.
  Endowing point bounds with $L_omega^2$ means they hold on each sphere.

#thm([Lemma 32.])[
  (Radial point estimates).  #emph[The finite-time norms (10.1) imply
#[#set math.equation(numbering: n => "(10.8)")
 $ parallel chi \( h \) parallel_(L_omega^2) lt.tilde N r^(2 eta_(*)) tau^(- A_H \/ 2) & \( n_(*) lt.eq 8 \) \,\
parallel chi \( h \) parallel_(L_omega^2) lt.tilde N r^.52 & \( n_(*) lt.eq 9 \) \,\
parallel B_1 chi \( h \) parallel_(L_omega^2) lt.tilde N r^(e \/ 2) mu^(- A_H \/ 2) & \( n_(*) lt.eq 7 \) . $ <fe:F7>]

]
] <fe:point-estimates>

#proof[
  For $t lt.tilde r$ integrate to an anchor with $r' asymp r$ large enough compared with $t$, using (10.7);
    the integral of $w_H^(- 1)$ costs $lt.tilde r^(e + delta A_H + 1 - A_H)$.
    For $t gt.double r$ integrate inward to the fixed starting annulus,
    using a compact weighted endpoint anchor there (an average suffices).
    The top time weight is everywhere at least a constant times $r^(- .021)$.
    For the last estimate take a radial unit trace using the endpoint bad derivatives also at the next order,
    and (if undifferentiated terms occur) the first bound divided by $r$.
    In detail, $Z \, partial_q$ commute and $partial_q \( r T^j h \) = k r T^(j + 1) h +
    r^(- 1) s^d b_d Z \( r T^j h \) + O \( r^(- 1) \) r T^j h$.
    Thus $partial_q^2$ in this trace expands into first derivatives of the next and lower fields with bounded
    coefficients and possible $r^(- 1)$ times fields through order eight.
    The harmless field terms satisfy the required weights, and first derivatives against $w_H$ have a comparable
    weight throughout the interval. Angular and $r \| q$ derivatives are simpler.
    This proves (10.8); the compact overlap or one-sided traces suffice near a radial cutoff.
    The same convention of two spare rotations gives angular sup versions. In particular for $n_(*) lt.eq 7$,
  #[#set math.equation(numbering: n => "(10.9)")
   $ parallel chi \( psi \) parallel_(L_omega^2) lt.tilde N r^(e \/ 2) mu^(- A_H \/ 2) . $ <fe:F8>]
  Use $D = \( 1 - s_s dot.op n \) T + r^(- 1) s_s^d b_d Z$,
    with lab-time commutators of $s_s$ taken #emph[before] expansion, and (10.8);
    $r Z^I T^j$ or $Z^I r T^j$ field lists are equivalent. All first-derivative versions at one lower order follow
    too, up to harmless $O \( 1 \/ r \)$ lower terms. ◻
]

=== 10.5 Improved null projections <fe:projections>

#thm([Lemma 33.])[
  (Differentiated null projection).  #emph[In any bound with a $T^j$ on an upper-index tensor,
    contract with $ell ell$ #emph[after] those derivatives and then apply the indicated $Z$’s to the full contraction.
#[#set math.equation(numbering: n => "(10.10)")
 $ parallel Z^I H_(ell ell) parallel_(L_omega^2) lt.tilde r^(- 1) +
   N r^(- 1 + 2 eta_(*)) tau^(- A_H \/ 2) & \( \| I \| lt.eq 8 \) \,\
parallel Z^I \( T^j H \)_(ell ell) parallel_(L_omega^2) lt.tilde r^(- 2) +
  N r^(- 2 + 8 eta_(*)) tau^(- A_H \/ 2) & \( j gt.eq 1 \, med \| I \| + j lt.eq 8 \) \,\
parallel partial_q Z^I \( T^j H \)_(ell ell) parallel_(L_omega^2) lt.tilde r^(- 2) +
  N r^(- 2 + 8 eta_(*)) tau^(- A_H \/ 2) & \( \| I \| + j lt.eq 7 \) . $ <fe:F9>]

]
] <fe:null-projection>

#proof[
  The first estimate follows by smooth inversion of $B + h$, the symbol bound on $B - eta$,
    and (10.8) through order eight. For the last two, (10.2) after ordered differentiation controls the bad
    derivative of $h_(L L)$, the $L$–screen components, and the spherical trace of $h$:
    (10.8) bounds each good derivative by
  $ C N r^(- 2 + 2 eta_(*)) tau^(- A_H \/ 2) \, $
  and products such as $H thin partial h$ satisfy the bound as well (lab differentiations may be distributed
    before projecting; the highest differentiated $partial h$ is of total order at most eight and its bad part can
    use a $T$-field). This is just solving the flat gauge on the $ell$ gradient using (10.2) and (10.4),
    using $r^(- 1) b Z$ for the omitted part, or using $k^(- 1) partial_q$ for the bad derivative.
    Derivatives of bounded metric compositions have at most one high sphere factor;
    inverse contraction differs from the negated flat-raised covariant perturbation by a smooth quadratic.
    $Theta$ costs at most $C tilde(a) \/ r$ with ordered derivatives allowed.
    The $r^(- 2)$ term at this precision is for the stationary background contribution,
    not a claimed $tau$-decay of all of $H$. ◻
]

#thm([Lemma 34.])[
  (Tight cone projection and top-order control).  #emph[Set $b = 1 + min \( \| q \| \, r \)$. Then
#[#set math.equation(numbering: n => "(10.11)")
 $ r parallel Z^I H_(ell ell) parallel_(L_omega^2) & lt.tilde
   1 &  & \( \| I \| lt.eq 8 \, med \| q \| lt.eq 10 r^theta \) \,\
r parallel Z^I \( T^j H \)_(ell ell) parallel_(L_omega^2) & lt.tilde
  r^(- .46) &  & \( j gt.eq 1 \, med \| I \| + j lt.eq 9 \) \,\
r parallel Z^9 H_(ell ell) parallel_(L_omega^2) & lt.tilde log r + b^(1 \/ 2) r^(- p_0 \/ 2) +
  b r^(- 1 + 8 eta_(*)) . $ <fe:F10>]

 Constants here can be bounded independently of $R_0$ by choosing smallness of the nonlinear quantities after the
   radii; equivalently retain background plus $O \( C_(upright("fix")) sans(N) \)$ in them.]
] <fe:tight-projection>

#proof[
  The second follows exactly as in (10.10), using the rough $r^.52$ order-nine field bound.
    For the others it suffices to prove corresponding covariant $h_(L L)$ estimates:
    smooth quadratic inverse errors at order nine after multiplication by $r$ are even $O \( r^(- .46) \)$.
  #emph[The constrained radial integral.] Keep $t \, n$ fixed and integrate the equation for the bad derivative of
    $Z^d \( r h_(L L) \)$ from negative $q$ toward the cone. At fixed $t$ this adds a flat good derivative,
    since the integration differentiates by $partial_q - partial_r$.
    By (10.2) the terms to be integrated have the following sphere sizes,
    after distributing $Z$’s through order $d$: flat $G_1 chi \( h \) \, chi \( h \) \/ r$;
    products of $B_1 chi \( h \) \, chi \( h \) \/ r$ with factors from the order $r^(- 1)$ background
    perturbation or $r^(- 1) chi \( h \)$, with further bounded metric compositions allowed;
    and $O \( tilde(a) \)$. Here all $chi$’s need only spatial-emitter commutations (no lab times);
    this follows using $partial_i = \( ell_i \/ k \) partial_q +$ good and $Z$ on the full constrained combinations.
  #emph[Negative-$q$ anchor bands.] When $t asymp r$, start at $- q asymp r$;
    radii during integration stay comparable up to a target in $t asymp r$.
    In the spacelike bands $- q asymp Q gt.tilde r^theta$, for $d lt.eq
    8$ the integral of good terms costs $C N \( Q \/ r \)^(1 \/ 2)$ bandwise by (10.7).
    Products there are summable as well: a bad derivative in these products through that order is bounded using
    the extra Minkowski commutation with loss $C \/ Q$, giving e.g. $O \( N \/ Q \)$ for the quadratic band cost.
    For $d = 9$, use the unweighted spacelike-band slice energy for a highest first derivative,
    giving $O \( N \)$ per band; undifferentiated order-nine fields use (10.7),
    and in products with a high field the bad derivative now costs $1 \/ Q$ only on a low factor.
  #emph[Near the cone.] Up through $\| q \| lt.tilde r^theta$ the remaining integral of $G_1 chi$ costs $lt.tilde
    N r^(\( theta - p_i \) \/ 2)$ at the corresponding $H \, 0$ time-slice orders.
    For $d = 9$, $chi_9 \/ r$ with nine $Z$’s uses the $W_H$-controlled $G_1 chi_8$ on this slice.
    Products with high $B_1 chi_9$ use $L_(q \, omega)^2$ size $lt.tilde N
    r^.011$ on comparable radii and gain the factor $r^(- 1 + 2 eta_(*))$;
    products with $chi_9 \/ r$ and low $B_1 chi$ can use the same $G_1 chi_8$ bound and (10.8) on the low factor.
    All lower undifferentiated terms alone cost at most $C N r^(- 1 + 2 eta_(*))$ per unit length.
    These estimates give tightness for $d lt.eq 8$, at most logarithmic loss for nine.
  #emph[Longer intervals and timelike evaluation.] For evaluation up to length $b gt.tilde
    r^theta$ they cost at most the two additional terms of the last bound,
    using time-slice Cauchy–Schwarz with length $b$. Targets with $t lt.double r$ need only (10.7).
    If $t gt.double r$, start instead by a length-$asymp r$ local average of $Z^9 \( r h_(L L) \)$ on comparable
    radii (use the $G_1 chi_8$ time-slice norm), then integrate the same estimates over this length.
    This proves (10.11). ◻
]

=== 10.6 A uniform bound for the lowest radiative jets <fe:news>

#thm([Lemma 35.])[
  (Uniform news bound).  #emph[On every finite smooth bootstrap interval, the Cartesian lab-time derivatives satisfy
#[#set math.equation(numbering: n => "(10.12)")
 $ \| r Pi T h \| + \| r Pi T^2 h \| + \| r Pi T psi \| lt.tilde N . $ <fe:F11>]

 The constant uses only the previously stated low bootstrap, initial, and compact overlap controls.]
]

#proof[
  Put $chi_j = r T^j h$, $j = 0 \, 1$, and $cal(Y)_j = Pi k^(- 1) partial_q chi_j$.
    The projection $Pi$ depends on $n$ only; $k$ depends on $q \, n$ only.
    Thus projection of the two leading terms of the scalar emitter operator is exactly
  #[#set math.equation(numbering: n => "(10.13)")
   $ - 2 Pi partial_q partial_r chi_j +
     H_(ell ell) Pi partial_q \( k^(- 1) partial_q chi_j \) = \( - 2 k partial_r + H_(ell ell) partial_q \)
     cal(Y)_j . $ <fe:news-principal>]
  We show that every remaining term is bounded by $C N r^(- 2 + .04)$.
    This calculation uses only low commutations, so it precedes and supplies the undifferentiated supremum used in
    the high-order products of 11.
  Choose a temporary fixed $epsilon > 0$ larger than the finitely many $eta_(*) \,
    e$ losses in the following bounds, with $3 epsilon < .04$.
    The sphere estimates in (10.8), with two spare rotations, give
  $ \| Z^(lt.eq 2) chi_j \| + \| Z^(lt.eq 1) partial_q chi_j \| + \| partial_q^2 chi_0 \| lt.tilde N r^epsilon \,
    wide j = 0 \, 1 . $
  For the last term, use $partial_q \( r T^j h \) = k r T^(j + 1) h + s^d b_d Z \( T^j h \)$, differentiate once,
    and commute $partial_q$ through $Z$. This leaves first derivatives of the next and lower fields,
    $r^(- 1)$ times good derivatives, and $a \( q \) partial_q chi_0$.
    The largest field count in the displayed point estimates, including the two rotations, is at most $j + 2 +
    2 lt.eq 5$; the unit trace for a bad derivative uses one further order, still below the weak cap $N_H = 8$. Also
  $ \| H \| lt.tilde r^(- 1) + N r^(- 1 + epsilon) \, wide \| H_(ell ell) \| lt.tilde r^(- 1 + epsilon) \,
    wide \| a \( q \) \| lt.tilde N . $
  The angular term $r^(- 2) Pi cal(A)_s chi_j$ is therefore $O \( N r^(- 2 + epsilon) \)$.
    The three remainder types in (10.6) have bounds
  $ frac(\| H \|, r) \| \( 1 \, Z \) partial_q chi_j \| \, quad
    frac(\| H \|, r^2) \| \( 1 \, Z \, Z^2 \) chi_j \| \, quad
    frac(\| a \( q \) H_(ell ell) \|, r) \| \( 1 \, Z \) chi_j \| lt.tilde N r^(- 2 + 2 epsilon) . $
  In particular no uncontrolled radial power accompanies the acceleration. One also has
  $ r \| a \( q \) H_(ell ell) \| lt.tilde 1 \, $
  by (10.11) near the cone and the decay of $a \( q \)$ away from it.
  For $j = 1$, commuting the Cartesian derivative $T$ through the physical wave operator introduces $-
    P \[ T H \] chi_0$. The full coefficient obeys $T H = O \( r^(- 2) \) + O \( N r^(- 1 + epsilon) \)$,
    whereas (10.10) gives
  $ \( T H \)_(ell ell) = O \( r^(- 2) \) + O \( N r^(- 2 + epsilon) \) . $
  Thus its two-bad part, $\( T H \)_(ell ell) partial_q \( k^(- 1) partial_q chi_0 \)$,
    is $O \( N r^(- 2 + 2 epsilon) \)$. The mixed part has the additional $r^(- 1)$ in (10.6);
    its good and acceleration parts are smaller. It is the improved double contraction,
    rather than an improved bound on every component of $T H$, that is needed.
  For the quadratic source, polarize the constant Cartesian polynomial before projecting.
    In particular $T Q_eta \( partial h \, partial h \) = 2 Q_eta \( partial T h \, partial h \)$.
    For $h_i = T^i h$, $i = 0 \, 1$, write
  $ partial_alpha h_i = ell_alpha breve(p)_i + E_(alpha i) \, wide
    ell^mu #scale(x: 120%, y: 120%)[\(] \( breve(p)_i \)_(mu nu) - 1 /
    2 eta_(mu nu) "tr"_eta breve(p)_i #scale(x: 120%, y: 120%)[\)] = 0 \, wide Pi breve(p)_i = Pi T^(i + 1) h . $
  Take $breve(p)_i$ from (10.4) with $p = T^(i + 1) h$. The good derivative terms and (10.2),
    differentiated once in Cartesian lab time when $i = 1$, give $\| E_i \| lt.tilde N r^(- 2 + 2 epsilon)$.
    For example the differentiated gauge error contains $\( T h \) partial h$,
    of size $O \( N^2 r^(- 2 + 2 epsilon) \)$, and not a term of order $r^(- 1)$.
    The constrained–constrained polarization is a multiple of $ell ⊗ ell$ and is annihilated by $Pi$.
    Every other quadratic term has one $E_i$ and one full first jet of size $O \( N r^(- 1 + epsilon) \)$;
    after the physical-source factor $r$, it is $O \( N^2 r^(- 2 + 3 epsilon) \)$.
    Differentiating an already expanded frame instead gives $T ell = O \( r^(- 1) \)$ and the same suppression.
    The vanishing-coefficient quadratic terms in (10.3), including their single $T$ derivative,
    also satisfy this bound. The linear lower terms are $O \( N r^(- 2 + epsilon) \)$,
    and the pure defect costs $r^(- 1) tilde(a) lt.tilde N r^(- 2)$. We have proved
  #[#set math.equation(numbering: n => "(10.14)")
   $ \| \( - 2 k partial_r + H_(ell ell) partial_q \) cal(Y)_j \| lt.tilde N r^(- 2 + .04) . $ <fe:news-transport>]
  At fixed $n$, this transport direction has strictly decreasing lab time, with $d r \/ d sigma = - 2 k < -
    c$ and $d t \/ d r = 1 - H_(ell ell) \/ \( 2 k \) = 1 + O \( r^(- 1 + 2 eta_(*)) \)$.
    Its backward integral curve reaches $t = 0$ or the fixed-radius starting region and stays within the current
    finite lifespan. Since $integral_(R_0)^oo r^(- 2 + .04) thin d r < oo$,
    the initial symbol bounds and compact low point bounds control $cal(Y)_j$ by $C N$.
    The displayed identity for $partial_q chi_j$ converts this to the first two terms of (10.12),
    the additional term being good. Finally differentiate $psi = \( 1 - s_s dot.op n \) T h +
    r^(- 1) s_s^d b_d Z h$ once in lab time, taking the lab derivative before expanding the frame.
    It gives $r Pi T psi = \( 1 - s_s dot.op n \) r Pi T^2 h$ plus good-frame and $tilde(a)$ terms bounded by the
    same low estimates. This proves the last term of (10.12). ◻
]

=== 10.7 True null directions, spacelike caps, and corrected currents <fe:currents>

We now construct the energy currents and specify the source norms that they require.
  Let $X \, macron(X)$ in this calculation denote the #emph[true] outward/inward future null normals to the
  emitter spheres, normalized by $d t = 1$, and $G = - g \( X \, macron(X) \) > 0$.
  These are algebraic smooth functions of $g \, n$ near flat, with components in the lab chart,
  independent of $s \( q \)$ given those arguments. They are $O \( r^(- 1) + \| h \| \)$ away from the
  corresponding flat normals. With $z_X = n dot.op X^z$, one has $X q = \( 1 - z_X \) \/ k$,
  bounded in size by a constant times

$ d_g = \| H_(ell ell) \| + \| H \|^2 . $

Indeed the linearization of the radial speed on the outgoing root costs just the $L L$ covariant variation.
  Also $X r = 1 - X q$. The estimates above imply $d_g lt.tilde r^(- 1)$ for $\| q \| lt.eq 2 r^theta$,
  $d_g lt.tilde r^(- 1 + 2 eta_(*))$ elsewhere. Thus we can use global spacelike caps $frak(u) = u$, where for example

$ frak(u) = q + integral_(R_0 \/ 2)^r \[ rho^(delta - 1) + rho^(20 eta_(*) - 1) j \( \| q \| \/ rho^theta \) \]
  thin d rho \, $

with $j = 1$ above 2 and zero below 1, a smooth transition.
  One has $partial_q frak(u) = 1 + o \( 1 \)$, $X frak(u) > 0 \, med macron(X) frak(u) > c_0 > 0$ for $R_0$ large,
  and $\| frak(u) - q \| lt.tilde r^delta + \| q \|^(20 eta_(*) \/ theta)$.
  The induced changes between $r^delta + \| q \|$ and $r^delta + \| u \|$ are comparable.
  No angular component of $d frak(u)$ on the spheres occurs. Fix

$ M = r^.72 mu^(- A_H) j_0 \( q \/ r \) \, wide K = 1 + r^(- 1) integral_q^oo M \( q' \, r \) thin d q' \, $

with $j_0$ nonnegative, one on $\[ - 1 \, 1 \]$, zero outside $\[ - 2 \, 2 \]$, smooth.
  Then $K = 1 + o \( 1 \)$, $r \| X K \| = o \( 1 \)$, $- r macron(X) K gt.tilde M - o \( 1 \)$.
  Indeed the integral costs $o \( r \)$ with the same bounds after $r partial_(r \| q)$, and $M X q = o \( 1 \)$.

For each equation a specified scalar current correction $cal(P)$ will be used (possibly zero), with

$ partial_q = alpha macron(X) + upright("a combination of ") X \, med e_A \, quad c = frac(G alpha, 2 k) \, wide
  theta.alt = - g \( macron(X) \, dot.op \) \/ G \, wide xi = d chi + c cal(P) theta.alt . $

Here $e_A$ is a $g$-orthonormal screen, the indicated coefficients are bounded,
  and $alpha = \( z_X - s dot.op n \) \/ \( z_X - z_(macron(X)) \)$. Complete the definition of $sans(F)$ by including

#[#set math.equation(numbering: n => "(10.15)")
 $ parallel \( W_i \( 1 + M \) \)^(1 \/ 2) xi_X parallel_(L^2 \( d t thin d r thin d omega \/ r \)) +
   sup_u parallel W_i^(1 \/ 2) xi_X parallel_(L^2 \( d r thin d omega \; med frak(u) = u \)) $ <fe:F12>]

out to the current time. Only the directional component, not $M^(1 \/ 2)$ times the uncorrected good frame,
  is required with the extra $M$.

Use the notation $parallel dot.op parallel_(upright(b))$ here just for $L^2 \( d t thin d r thin d omega \/ r \)$.
  The source splitting in the outgoing multiplier may be written

#[#set math.equation(numbering: n => "(10.16)")
 $ P_g chi = lambda_1 L chi \/ r + f_(upright("flat")) + partial_q cal(P) + f_(upright(r)) + f_(upright("mix")) \,
   $ <fe:F13>]

where $lambda_1 gt.eq 0$ is bounded and the flat triangular terms are specified below.
  In the lab-time multiplier we keep the whole raw source $f_(upright("raw"))$ (after the first two terms).
  The budgets to estimate for each level are

#[#set math.equation(numbering: n => "(10.17)")
 $ & parallel W_i^(1 \/ 2) \( cal(P) \, Z cal(P) \, r d_g thin partial_q cal(P) \) parallel_(upright(b)) +
   sup_t parallel W_i^(1 \/ 2) cal(P) parallel_(L_(r \, omega)^2) \,\
 & parallel \( W_i \/ \( 1 + M \) \)^(1 \/ 2) r f_(upright(r)) parallel_(upright(b)) +
   parallel w_(i \, j)^(1 \/ 2) r f_(upright("raw")) parallel_(upright(b)) . $ <fe:F14>]

For $f_(upright("mix"))$, supported where $t lt.tilde r$,
  an alternative charge on each dyadic shell $r asymp R_f$ is as follows. Suppose

$ parallel r f_(upright("mix")) parallel_(L_omega^2) lt.eq l_(R_f) \( frak(u) \) thin cal(T) \( t \, r \) \, wide
  sup_t parallel cal(T) \( t \, dot.op \) parallel_(L_r^2) lt.eq E_(upright("infield")) . $

The corresponding mixed budget is

#[#set math.equation(numbering: n => "(10.18)")
 $ sum_(R_f) R_f^(\( p_i - 1 \) \/ 2) parallel l_(R_f) parallel_(L^2 \( d u \)) E_(upright("infield")) .
   $ <fs:mixed-charge>]

To see the shell power, pair the source with $W_i xi_X$ using measure comparable to $d t thin d r thin d omega$.
  Cauchy–Schwarz on each outgoing cap and then in $u$ gives

$ C R_f^(p_i \/ 2 - 1) sup_u parallel W_i^(1 \/ 2) xi_X parallel_(L^2 \( frak(u) = u \)) parallel l_(R_f)
  parallel_(L^2 \( d u \)) (integral_(t lt.tilde R_f) #h(-0.16667em) #h(-0.16667em) integral cal(T) \( t \, r \)^2
  thin d r thin d t)^(1 \/ 2) . $

The last factor is at most $C R_f^(1 \/ 2) E_(upright("infield"))$, producing exactly the stated charge.
  Positive sums of such charges are allowed.

#thm([Proposition 33.])[
  (Far energy reduction).  #emph[Assume that each equation has the splitting (10.16), and that its correction,
    raw, remainder, and mixed budgets satisfy, in the triangular order specified below, bounds of the form
#[#set math.equation(numbering: n => "(10.19)")
 $ o_(R_0 arrow.r oo) \( 1 \) \( sans(F) + sans(S)_a \) + C sum_(upright("prior")) sans(F)_(upright("prior")) +
   C \( R_0 \) sans(K)_R + C_(upright("fix")) \( e_(upright("in")) + sans(N)^(1 + c_1) \) $ <fe:source-hypothesis>]

 for fixed $c_1 > 0$. Assume also that the corrections have initial weighted energy and averaged starting-annulus
   costs bounded by the initial and overlap terms in (10.19); the annular norm is the compact weighted $L^2$ norm.
   Then the two energy multipliers give
#[#set math.equation(numbering: n => "(10.20)")
 $ sans(F) med lt.eq med o \( 1 \) \( sans(F) + sans(S)_a \) + C \( R_0 \) sans(K)_R +
   C_(upright("fix")) \( e_(upright("in")) + sans(N)^(1 + c_2) \) $ <fe:far-conclusion>]

 (with $c_2 > 0$, allowing analogous small input bootstrap errors).
   It suffices also to take tunably small uniform coefficients on $sans(F)$ in this argument.
   A convenient prior order for linear terms is: level $P$ before the $h$ hierarchies,
   within a level lower total orders first, more lab times first at fixed total order, and then fewer $S$’s first.
   Small radius gains and perturbative nonlinear effects may cross this order.
   Norms aggregated at equal indices are treated together.]
] <fe:energy-reduction>

#proof[
  #strong[Claim 1: the corrected divergence identity.] Use volume $r^(- 2) d upright("vol")_g$,
    comparable to $d t thin d r thin d omega$; prime on a divergence indicates this density.
    The normalized equation for $upright("div")' \( d chi \)^sharp$ differs from $P_g chi \/
    k$ by a first-order coefficient $O \( r^(- 2) \)$ (contracted Christoffels) and a potential of size
  $ O \( r^(- 2) \) thin O #scale(x: 120%, y: 120%)[\(] \| s \( q \) \| + \| H \| +
    r \| a \( q \) H_(ell ell) \| #scale(x: 120%, y: 120%)[\)] . $
  The latter follows from (10.5), (10.6) on a constant and is small times $r^(- 2)$, by (10.10),
    (10.11) and the acceleration decay. Write $Q \( xi \) = xi ⊗ xi - g^(- 1) \( xi \, xi \) g \/ 2$.
    For a multiplier $Y$ the primed divergence identity has deformation part
  $ g \( nabla_(xi^sharp) Y \, xi^sharp \) - 1 / 2 upright("div")' Y thin g^(- 1) \( xi \, xi \) $
  and other terms $xi_Y thin upright("div")' xi^sharp + d xi \( xi^sharp \, Y \)$.
    Use $Y = W_i K X$ and factor out its scalar weight. To calculate the correction, write $F = c cal(P)$.
    Since $theta.alt^sharp = - macron(X) \/ G$, we have
  $ xi^sharp = - xi_(macron(X)) / G X - xi_X / G macron(X) + xi_(upright("scr"))^sharp \, wide theta.alt \( X \) =
    1 \, quad theta.alt \( xi^sharp \) = - xi_(macron(X)) \/ G . $
  The differentiated-$F$ contribution from divergence is $- G^(- 1) xi_X macron(X) F$.
    In the curl contribution the term $- G^(- 1) xi_(macron(X)) X F$ from $d F \( xi^sharp \)$ cancels $-
    d F \( X \) theta.alt \( xi^sharp \)$ exactly. The sum is therefore
  $ - 2 G^(- 1) xi_X macron(X) F + nabla_(upright("scr")) F dot.op xi_(upright("scr")) . $
  Since $2 c \/ G = alpha \/ k$, this cancels the indicated source component with its exact sign.
    When the derivative falls on $theta.alt$, the divergence term is proportional to $xi_X$,
    while in $F thin d theta.alt \( xi^sharp \, X \)$ the $xi_(macron(X))$ part of $xi^sharp$ vanishes by $d
    theta.alt \( X \, X \) = 0$. Thus no remaining correction term from divergence or curl involves
    $xi_(macron(X))$. They are bounded, without the weight, by
  $ C r^(- 1) #scale(x: 120%, y: 120%)[\[] \|
    xi_X \| \( \( 1 + sqrt(M) \) \| cal(P) \| + \| Z cal(P) \| + r d_g \| partial_q cal(P) \| \) + \|
    xi_(upright("scr")) \| \( \| cal(P) \| + \| Z cal(P) \| \) #scale(x: 120%, y: 120%)[\]] . $
  To check coefficients, first derivatives in a good true direction of $g \, n \, X \,
    macron(X)$ in lab components cost $O \( 1 \/ r \)$; first unrestricted derivatives cost
    $O \( \( 1 + sqrt(M) \) \/ r \)$, by (10.8) and the frame formulas.
    The same estimates apply to $theta.alt$, in particular to $d theta.alt \( e_A \, X \)$ and $d
    theta.alt \( macron(X) \, X \)$, respectively. Screen derivatives of $c$ cost $O \( 1 \/ r \)$;
    for $macron(X) c$ the extra dependence on $s \( q \)$ uses $alpha \/
    k = \( 1 + \( z_X - 1 \) \/ k \) \/ \( z_X - z_(macron(X)) \)$, hence $r \| a \( q \) \| d_g lt.tilde 1$.
    Also $partial_q - alpha macron(X)$ differentiates $cal(P)$ by true good directions, giving the $r d_g$ allowance.
  The outgoing deformation has a lower bound of a positive constant times
  #[#set math.equation(numbering: n => "(10.21)")
   $ W_i / r #scale(x: 120%, y: 120%)[\(] \( 1 + M \) \| xi_X \|^2 + \| xi_(upright("scr")) \|^2
     #scale(x: 120%, y: 120%)[\)] $ <fe:F16>]
  up to small errors in the joint estimates. For details, the derivative of $W_i K$ alone gives
  $ - G^(- 1) macron(X) \( W_i K \) \| xi_X \|^2 - 1 / 2 X \( W_i K \) \| xi_(upright("scr")) \|^2 . $
  Here $- r macron(X) W_i \/ W_i$ is positive with fixed margin (each $p_i > A_i$),
    and $r X W_i \/ W_i < 2$ with fixed margin. The following frame estimates check the remaining deformation:
  $ & g \( X \, nabla_Y X \) = 0 \,\
 & g \( e_B \, nabla_(e_A) X \) = delta_(A B) \/ r + O \( r^(- 2 + .04) \) \,\
 & g \( e_B \, nabla_X X \) \, med g \( macron(X) \, nabla_X X \) = O \( r^(- 2 + .04) \) \,\
 & upright("tr")_(upright("scr")) nabla X - 2 X r \/ r = O \( r^(- 2 + .04) \) . $
  Indeed differentiation of the algebraic normals in $X$ gains $X g = O \( r^(- 2 + .04) \)$, $X n =
    O \( r^(- 2 + .04) \)$; spherical differentiation gives the ordinary flat expansion,
    and Christoffels with the displayed slots use good derivatives or the improved first derivative of $g_(L L)$
    from (10.10), to the precision indicated. The other components of $nabla X$,
    after subtracting the flat emitter ones of order $1 \/ r$, cost $O \( r^(- 2 + .04) \) +
    O \( N sqrt(1 + M) \/ r \)$. Any non-small flat off-expansion components relevant to cross terms between
    $xi_X \, xi_(upright("scr"))$ or to $xi_X^2$ here cost only $O \( \| s \| \/ r \)$ (for the flat $L$,
    incoming variation of $n$ is $O \( \| s \| \/ r \)$). Consequently the potentially two-bad square vanishes
    exactly by nullity, mixed terms involving the bad derivative have coefficients $O \( r^(- 2 + .04) \)$,
    and the screen expansion supplies the missing positive $W_i K \| xi_(upright("scr")) \|^2 \/ r$.
    For example the square of a mixed coefficient, relative to the two positive bulk weights,
    is bounded by $r^(- 2 + .08) W_i \/ w_(i \, j) lt.tilde r^(- .22)$.
    We absorb mixed bad terms using $W_i \/ w_(i \, j) lt.double r^1.7$;
    other cross terms use smallness and (10.21). Here $xi_(macron(X)) = macron(X) chi$.
  The favorable volume sign is positive with the future energy convention (time endpoint energy is subtracted at
    positive divergence). Integrate on slabs cut off either just by a time endpoint or also by an outgoing cap.
    All future endpoint stresses in this argument are nonnegative as energies.
    At a time endpoint the outgoing one controls $W_i$ times $\| xi_X \|^2 + \| xi_(upright("scr")) \|^2$;
    at $frak(u) = u$ it controls $W_i \| xi_X \|^2 thin d r thin d omega$.
    To verify the latter with its measure, $d frak(u)$ has no screen component, so a future normal is
  $ - nabla frak(u) = frac(macron(X) frak(u), G) X + frac(X frak(u), G) macron(X) . $
  The flux density after the coarea Jacobian is, up to the uniformly comparable primed volume factor,
  $ frac(W_i K, partial_q frak(u))
    (frac(macron(X) frak(u), G) \| xi_X \|^2 + frac(X frak(u), 2) \| xi_(upright("scr")) \|^2) thin d r thin d omega . $
  Here $partial_q frak(u) asymp 1$, $macron(X) frak(u) gt.eq c_0$ and $X frak(u) > 0$.
    This proves the uniform lower bound required in (10.15), even when $X frak(u)$ tends to zero at infinity.
    The starting radial flux costs are estimated by averaging the lower radius in $\[ R_0 \/ 2 \, R_0 \]$ and
    using the stated compact comparisons. The Hardy control of $chi \/ r$ in (10.1) follows within this argument:
    $upright("div")' X = O \( r^(- 2 + .04) \)$, so integrate $upright("div")' \( W_i X \| chi \|^2 \/ r^2 \)$,
    using the #emph[negative] strict leading derivative of $W_i \/ r^2$;
    only past/radial anchors are charged and $X chi = xi_X - c cal(P)$.
    In detail, $X log \( W_i \/ r^2 \) lt.eq - epsilon.alt_i \/ r$ for some fixed $epsilon.alt_i > 0$, and hence
  $ "div"' \( W_i X \| chi \|^2 \/ r^2 \) lt.eq - epsilon.alt_i / 2 frac(W_i \| chi \|^2, r^3) +
    frac(2 W_i, r^2) chi X chi . $
  Young’s inequality bounds the last term by half the displayed negative bulk plus $C_i W_i \| X chi \|^2 \/ r$.
    Future boundary terms of this scalar current are nonnegative with the energy convention,
    so the bulk $W_i^(1 \/ 2) chi \/ r$ norm is bounded by the good bulk, the correction budget,
    and the past and radial anchors. Conversion from true corrected good derivatives to the flat $G_1$ in bulk and
    at time endpoints similarly charges (10.17) and a small amount of bad energy ($d_g^2 W_i lt.double
    w_(i \, j)$); it is not needed on outgoing caps. The pointwise comparison behind this step is
  $ \| G_1 chi \| lt.eq C \( \| xi_X \| + \| xi_(upright("scr")) \| + \| cal(P) \| \) + C d_g \| B_1 chi \| . $
  The screen bases span the same emitter sphere. The coefficient of the incoming derivative in the difference
    between $L$ and $X$ is $O \( d_g \)$; all other difference coefficients are $O \( \| H \| \)$.
    Since $d_g^2 W_i \/ w_(i \, j) lt.tilde r^(- .3 + 4 eta_(*))$,
    the last term is small in both the spacetime and the time-endpoint norms.
    The correction terms at time endpoints use the supremum in (10.17).
    The first-order and potential differences from $P_g \/ k$ listed above are absorbable by these estimates.
    Also $xi_X lambda_1 L chi \/ \( k r \)$ has good sign up to such conversions (its $cal(P)$ part costs (10.17),
    not claimed small by sign). The remaining wave source terms use exactly (10.17), (10.21) and the mixed entry.
  #strong[Claim 2: the lab-time multiplier controls the bad derivatives.] For the lab-time multiplier $w T$, $w =
    w_(i \, j)$, use the uncorrected $Q \( d chi \)$. Its endpoint energy controls the full bad-weight cap on time
    slices. In the deformation, the two-bad coefficient from $cal(L)_T g$ is improved by (10.10);
    bad-good mixed errors from metric/density differentiation are absorbable since $w \/
    W_i$ has a strict negative radial power and $r \| partial g \| lt.tilde r^(- 1) +
    N r^(e \/ 2) mu^(- A_H \/ 2)$ at the required first order.
    More explicitly $w_H \/ W_H lt.tilde r^(- e - \( p_H - A_H \))$,
    and the gaps at the other two levels are larger. The weight-derivative part is
  $ - G^(- 1) \( X w \) Q \( d chi \) \( macron(X) \, T \) - G^(- 1) \( macron(X) w \) Q \( d chi \) \( X \, T \) . $
  We have $r X w \/ w < - e \/ 2$: differentiate explicitly, using the tight $X q =
    O \( 1 \/ r \)$ near $\| q \| lt.tilde r^theta$ and the looser bound elsewhere.
    Possible adverse log derivatives from $m^(- d)$ or $m_(+)^(- d)$ in the radial powers are at most $9 d_(*)
    nu$; top $m_(-)$ is favorable at fixed $q < 0$. Thus we gain the two-bad bulk with a fixed margin.
    Adverse $macron(X) w$ at top is at most $C w \/ r$ by $q$-monotonicity;
    at strong level it is at most $C w \( \( r^delta + \| q \| \)^(- 1) + r^(- 1) \) lt.double W_P \/ r$.
    At weak level the same absorption into $W_H \/ r$ holds except $0 lt.eq q lt.eq r^.3$; indeed $1 -
    p_H < .3 \( 1 - A_H \)$. Here and in this multiplier conversions charging (10.17) are understood.
  On the exceptional weak-weight range use $G_1 chi = r^(- 1) Z chi$,
    where the undivided $Z chi$ is a field of total order at most nine.
    At $r asymp R_f$, uniformly from $q = - R_f^theta$ to $R_f^.3$ at fixed $t asymp R_f$,
    (10.7) and the top $w_(0 \, j)$-endpoint give the squared sphere bound
  $ parallel Z chi parallel_(L_omega^2)^2 lt.tilde \( e_(upright("in")) + sans(S)_a \)^2 R_f^(1 - theta) +
    sans(F)^2 R_f^(theta + .021) . $
  On the shell the bad exceptional integral for the flat good derivatives therefore costs at most
  $ C \( e_(upright("in")) + sans(S)_a + sans(F) \)^2 R_f^(- 1 + .3 + max \( 1 - theta \, theta + .021 \)) . $
  The true-minus-flat derivative contribution is absorbed directly by $w_H$ bulk with the extra $d_g^2$.
    The exponent is explicitly $- 1 + .3 + max \( .55 \, .471 \) = - .15$.
    Thus these shell costs are summable with radius gain, explaining why no extra positive-$q$ weighted bad flux
    is required at the weak level. All raw wave sources in this multiplier now use (10.17);
    the signed leading term in (10.16) just uses the flat good/bad weight gap here.
  #strong[Claim 3: the flat commutators are triangular.] To specify the flat terms,
    commute $Z$ after lab differentiations, eliminating $P_g$ at lower orders;
    separate the $P \[ H \]$ commutations, including any scalar commutator multiples of it,
    into the nonflat sources below. The flat recurrence is $P_eta S = \( S + 1 \) P_eta + r^(- 2) cal(A)_s$;
    rotation commutator errors are $r^(- 2) O \( s \) \( 1 \, Z \, Z^2 \)$.
    Thus each $S$ count contributes $+ \( 1 + s dot.op n \) L chi \/
    r$ from the pure $S^2$ leading term on the right, giving $lambda_1$ in (10.16).
    Terms where extra rotations differentiate its $s$-dependent coefficient can instead be counted as $O \( s \)$.
    All remaining size-one terms in $f_(upright("flat"))$ cost, after multiplication by $r$,
    good derivatives/field-over-radius of lower orders or of the same order with fewer $S$’s, with unchanged $j$;
    feedback terms at this precision have $O \( s \)$ coefficients.
    In particular a pure $r^(- 2) chi$ term at the same order from a commuted $S$ uses $r^(- 1) chi =
    L chi_(upright("prior"))$. This proves their triangular acceptability.
  #strong[Claim 4: the boundary costs use the stated inputs.] In this argument entries involving the outer cap
    supremum need only be estimated beyond $R_0$. In the averaging annulus of the initial radial cutoff all field
    bulk/time-slice controls can instead use the compact estimates with constants depending on $R_0$,
    which have full mixed orders there. For instance every common principal commutator puts order at most $N_i +
    1$ on the differentiated field (one lower commutation count before the two wave derivatives);
    in the $D$-equation an additional order-two term on $h$ uses at most nine derivatives but carries either a
    parameter acceleration coefficient or a strong field derivative.
    Thus field source/current products there can use ordinary time-weighted Sobolev estimates off trapping,
    not an outgoing cap input on the overlap. On linear pure-defect forcing involving acceleration alone one keeps
    the direct far $tilde(a)$ bound with its same radius gain on $sans(S)_a$,
    #emph[not] a large overlap coefficient times $sans(S)_a$. The required direct source estimate is proved in 11.
    The surface cutoffs themselves can be selected by averaging against the full time annular bounds,
    irrespective of the outer cap used. Divergence integrations at infinity can also first take a sequence of
    radial truncations at each bounded time range; ordinary high symbol decay there suffices on the raw jets (with
    $p_H < 1$, and an extra decay power for the strong field),
    and the displayed cap/bulk bounds on the specific corrections, or their bounded-time symbol estimates,
    suffice for correction fluxes.
  #strong[Claim 5: finite hierarchical absorption.] Add the two multiplier estimates with fixed coercive relative
    factors, use Hardy and the true-to-flat conversions, and take separate suprema over the endpoints.
    Enumerate the finitely many blocks in the stated prior order as $1 \, dots.h \,
    J$ and let $E_k$ denote their full norms. After Young’s inequality each block has an estimate of the form
  $ E_k^2 lt.eq epsilon.alt \( R_0 \) sum_(l = 1)^J E_l^2 + C sum_(l < k) E_l^2 + B^2 \, $
  where $B$ is the nonhierarchical right-hand budget in (10.19);
    the same argument applies to tunably small uniform errors.
    All size-one constants $C$ and the number $J$ are independent of the two large matching radii.
    Choose fixed positive weights $a_k$ decreasing so rapidly that $C sum_(k > l) a_k lt.eq
    a_l \/ 4$ for every $l$. Summing $a_k E_k^2$ absorbs every prior-order term.
    Only after these weights have been chosen do we enlarge $R_0$ so that $epsilon.alt \( R_0 \) sum_k a_k lt.eq
    1 / 4 min_k a_k$. The resulting weighted norm is equivalent to the finite sum defining $sans(F)$,
    with constants independent of the matching radii, and its square root gives (10.20).
    Small multiples of any same-time right hand budgets in the bootstrap can be kept on the right before combining
    all levels. Compact boundary/source squares costing $C \( R_0 \)
    sans(K)_R^2$ are harmless with these conventions. The source hypotheses are verified in 11, yielding (11.7).
    This proves the stated energy reduction. ◻
]

== 11 Far-source estimates and uniform coupling <fs:section>

We verify all source and current-correction hypotheses of 33 for the lab equation of Lemma 19 and its
  differentiated $D$ equation, on an arbitrary smooth finite slab.
  In particular the background coefficients have the stated symbol and $D$ gains,
  the exact lab gauge gives the differentiated weak-null polarization,
  and Lemma 20 supplies the initial and overlap bounds. The quantities from 10,
  including the news estimate (10.12), are consequences of the same small bootstrap used here.
  They are not assumptions about an already global evolution.
  We write $N$ for a fixed multiple of the total bootstrap size, allowing also the input size in this coefficient.
  The three target levels are $\( U_i \, N_i \) = \( h \, 9 \) \, \( h \, 8 \) \, \( psi \, 7 \)$ for $i = 0 \,
  H \, P$ respectively. The coefficients, source splittings and current corrections below are always expressed in
  Cartesian laboratory components before conversion to the emitter frame.

The source budgets are (10.17) and the mixed charge (10.18),
  with the bulk measure $parallel dot.op parallel_(upright(b)) =
  L^2 \( d t thin d r thin d omega \/ r \)$ from 10.7. For each equation,
  $cal(P)$ is the sum of its corrections with their actual signs.
  The mixed charge uses only the corrected $xi_X$ cap in (10.15);
  it requires no $M$-weighted bound on an arbitrary uncorrected good derivative.

=== 11.1 Ordered derivatives and weight comparisons <ordered-derivatives-and-weight-comparisons>

For a target level $i$ and $\| I \| + j lt.eq N_i$, write $chi_(I j)^i =
  Z^I \( r T^j U_i \)$ for the corresponding unknown of 10.1.
  Positive sums over spatial-emitter words up to length $b$, with #emph[fixed] lab-time count $j$, will be used;
  define lists, or sizes of lists, by

#[#set math.equation(numbering: n => "(11.1)")
 $ V_(b j)^U & = \| Z^(lt.eq b) T^j U \| \, & G_(b j)^U & = V_(b + 1 \, j)^U \,\
B_(b j)^U & = G_(b j)^U + r V_(b \, j + 1)^U \, &  & wide U = h \, psi . $ <fs:lists>]

A superscript can equally be the level used. These letters with derivative indices do not denote the target or its
  velocity. In bulk $W_i^(1 \/ 2) G_(b j)^i \, med w_(i \, j)^(1 \/ 2)
  B_(b j)^i$ are controlled by (10.1) with spatial counts $lt.eq b$.
  In uses of the time-slice cap, $B_(b j)^i$ is bounded by $C sum_(\| I \| lt.eq b) \| B_1 chi_(I j) \|$ plus $C
  V_(b j)^i$; we will charge the latter separately there. Similar statements hold for $G$ with $G_1$.
  These facts follow by commuting $Z$ at fixed $partial_q$, using the first derivative formulas.
  Point entries on spheres, in $L_omega^2$, include

#[#set math.equation(numbering: n => "(11.2)")
 $ V_(b j)^h lt.tilde N r^(- 1 + 2 eta_(*)) tau^(- A_H \/ 2) & \( b + j lt.eq 8 \) \,\
V_(b j)^h lt.tilde N r^(- .48) & \( b + j lt.eq 9 \) \,\
B_(b j)^h \, med r V_(b j)^psi lt.tilde N w_H^(- 1 \/ 2) & \( b + j lt.eq 7 \) \,\
B_(b j)^psi lt.tilde N w_H^(- 1 \/ 2) & \( b + j lt.eq 6 \) . $ <fs:G1>]

Use (10.8), (10.9) (including expanding one more lab $T$ before the $Z$’s for the last bound).
  Two additional rotations give sup versions. In particular low $G^h$ has the bound of the first line,
  and low bad entries of either field have size $lt.tilde N sqrt(1 + M)$.

Some comparisons used below, for large $r$, are

#[#set math.equation(numbering: n => "(11.3)")
 $ W_i / w_(k \, j) & lt.tilde r^(p_i + .021) tau^(A_i - A_k) \, & w_(i \, j) & lt.tilde W_i \,\
w_(P \, j) / w_H & lt.tilde l^(A - A_H) \, & w_H / w_(P \, j) & lt.tilde l^(- \( A - A_H \) + 7 d_(*)) \,\
w_(0 \, j) / w_H & lt.tilde r^(- .018) mu^(- A_H) . $ <fs:G2>]

Write $m_(upright("cone"))$ for the weight $m = \( r^(- 1) + l^(- 1) \)^(- 1)$ of 10,
  to distinguish it from derivative counts denoted by $m$ below.
  For $i = 0 \, P$, $sqrt(w_(i \, j) \/ w_(i \, j')) lt.tilde m_(upright("cone"))^(9 d_(*) \/ 2)$, and for $j' =
  j + 1$ the bound is $C m_(upright("cone"))^(- d_(*) \/ 2)$.
  Indeed $q gt.eq - r$, $m_(-) m_(+) asymp m_(upright("cone"))$.
  On $\| q \| lt.eq C r^nu$ weights within each level are equivalent in $j$, and $w_(P \, j) asymp w_H$.
  Outside $\| q \| lt.eq r^nu$,

$ w_H^(- 1 \/ 2) lt.tilde r^(\( e - \( nu - delta \) A_H \) \/ 2) l^(- A_H \/ 2) . $

We use without further comment $r tilde(a) lt.tilde N tau^(- A \/ 2)$,
  $\| a \( q \) \| lt.tilde N chevron.l q chevron.r^(- A \/ 2)$ as coefficient bounds.
  When $\| q \| gt.tilde r^theta$, $theta = .45$, both $m_(upright("cone"))^(- d_(*) \/ 2)$ and
  $l^(\( - \( A - A_H \) + 7 d_(*) \) \/ 2)$ gain more than $r^(- 3 eta_(*))$.

Two useful bad-commutation comparisons, with $c_0$ any bounded smooth coefficient of $n \, s \( q \)$, are

#[#set math.equation(numbering: n => "(11.4)")
 $ \| partial_q \( c_0 partial_q chi_(I j)^i \) \| lt.tilde & B_(b \, j + 1)^i +
   r^(- 1) B_(b + 1 \, j)^i + \| a \( q \) \| B_(b j)^i \, wide b = \| I \| \,\
B_(b \, j + 1)^h lt.tilde & B_(b j)^psi + r^(- 1) sum_(i' lt.eq j \, med b' + i' lt.eq b + j + 1) B_(b' i')^h .
  $ <fs:G3>]

Indeed $partial_q \( r T^j U \) = k r T^(j + 1) U + s^d b_d Z T^j U$ and $Z$ commutes with $partial_q$.
  For the second line express

#[#set math.equation(numbering: n => "(11.5)")
 $ T^(j + 1) h = \( 1 - s_s dot.op n \)^(- 1) #scale(x: 180%, y: 180%)[\(] & T^j psi - r^(- 1) s_s^d b_d Z T^j h\
 & - sum_(i' < j) c_(i' j) thin \( T^(j - i') s_s^d \) partial_d T^(i') h #scale(x: 180%, y: 180%)[\)] \, $ <fs:G4>]

and likewise for $T^(j + 2) h$, using the smoothing bounds.
  For example $Z^(lt.eq b) s_s^d b_d Z T^(j + 1) h$ from the latter identity after multiplication by $r$ costs $C
  r^(- 1) B_(b + 1 \, j)^h$ (here derivatives distribute on the expression).
  Extra $Z$’s on all bounded coefficients cost at most constants. Constants $c_(i' j)$ are combinatorial.

=== 11.2 The complete source catalogue <the-complete-source-catalogue>

#thm([Proposition 34.])[
  (Complete far-source estimate).  #emph[For each commuted equation on such a finite slab,
    the sum of its budgets (10.17), together with its mixed charges (10.18), is bounded, for some fixed $c_1 > 0$, by
#[#set math.equation(numbering: n => "(11.6)")
 $ o_(R_0 arrow.r oo) \( 1 \) \( sans(F) + sans(S)_a \) + C sum_(upright("prior")) sans(F)_(upright("prior")) +
   C \( R_0 \) sans(K)_R + C_(upright("fix")) \( e_(upright("in")) + sans(N)^(1 + c_1) \) . $ <fs:F15>]

 The finite prior order is: level $P$ before the two $h$ hierarchies; within each level lower total order first,
   then more laboratory times at equal total order, then fewer dilations $S$. Equal-index norms are aggregated.
   The constants on prior far quantities are independent of both matching radii.
   Small radial gains and nonlinear bootstrap products may cross this order.
   After fixed finite hierarchical weighting, 33 therefore gives, for some $c_2 > 0$,
#[#set math.equation(numbering: n => "(11.7)")
 $ sans(F) lt.eq o_(R_0 arrow.r oo) \( 1 \) \( sans(F) + sans(S)_a \) + C \( R_0 \) sans(K)_R +
   C_(upright("fix")) \( e_(upright("in")) + sans(N)^(1 + c_2) \) . $ <fs:F>]

 The initial and starting-annulus correction costs satisfy the same bound.
   In particular the pure acceleration defect on the starting annulus has its direct small radial coefficient on
   $sans(S)_a$.]
] <fs:source-estimate>

The following ledger identifies the origin and destination of every term.
  The numbered claims retain the coefficient placements, corrections, and endpoint estimates needed for each row.

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Source
], table.cell(rowspan: 1, colspan: 1)[Derivative placement
], table.cell(rowspan: 1, colspan: 1)[Outgoing treatment
], table.cell(rowspan: 1, colspan: 1)[Raw and boundary checks
]),
  table.cell(rowspan: 1, colspan: 1)[Principal commutators
], table.cell(rowspan: 1, colspan: 1)[Coefficient counts $lt.eq 5$, $gt.eq 6$; exceptional count $9$
], table.cell(rowspan: 1, colspan: 1)[Currents, direct gain, or mixed caps according to the placement
], table.cell(rowspan: 1, colspan: 1)[(11.4)–(11.9); Claim 1
],
  table.cell(rowspan: 1, colspan: 1)[Additional $D$ commutators
], table.cell(rowspan: 1, colspan: 1)[Seven target counts; $B^h$ through eight
], table.cell(rowspan: 1, colspan: 1)[Projected gain and acceleration currents
], table.cell(rowspan: 1, colspan: 1)[(11.11); Claim 2
],
  table.cell(rowspan: 1, colspan: 1)[Pure background defect
], table.cell(rowspan: 1, colspan: 1)[Symbol derivatives at every base level
], table.cell(rowspan: 1, colspan: 1)[Direct averaging gain, also on the starting annulus
], table.cell(rowspan: 1, colspan: 1)[(11.15); Claim 3
],
  table.cell(rowspan: 1, colspan: 1)[Linear and suppressed products
], table.cell(rowspan: 1, colspan: 1)[Nine counts for $h$;
  eight $h$ counts or seven mixed counts for the strong equation
], table.cell(rowspan: 1, colspan: 1)[Radial suppression in both bulk weights
], table.cell(rowspan: 1, colspan: 1)[(11.16); Claim 3
],
  table.cell(rowspan: 1, colspan: 1)[Leading screen quadratic
], table.cell(rowspan: 1, colspan: 1)[$h$ levels through $N_i$; strong correction through eight $B^h$ counts
], table.cell(rowspan: 1, colspan: 1)[Mixed cap for $h$; current (11.20) for $psi$
], table.cell(rowspan: 1, colspan: 1)[(11.17)–(11.20); Claims 4–5
],
  table.cell(rowspan: 1, colspan: 1)[Correction boundaries
], table.cell(rowspan: 1, colspan: 1)[Same time weights; strong products use $2 A_H > A$
], table.cell(rowspan: 1, colspan: 1)[Sum signed corrections before forming $xi$
], table.cell(rowspan: 1, colspan: 1)[Initial symbols and off-trap overlap; Claim 6
],
)
]

#proof[
  We verify the catalogue in six claims. Coefficients denoted by $N$ are bootstrap/input factors,
    so $N sans(F)$ is nonlinear. The pure background symbol bound $B - eta =
    O \( r^(- 1) \)$ has no such smallness factor. All wave equations and laboratory derivatives are taken before
    the emitter decomposition.
  #strong[Claim 1: common principal commutators.] We first derive the common source forms,
    then estimate their raw and outgoing budgets separately. The distinction is necessary because the outgoing
    correction avoids one bad derivative, whereas the raw budget uses the derivative hierarchy directly.
  #emph[Source forms and sphere placements.] After the flat recurrence in Claim 3 of the proof of Proposition 33,
    every such term is as in (10.6) applied at lower indices $ell = \( b' \, j' \)$, with coefficients
  $ C_h = Z^d \( T^m H \)_(ell_(upright("null")) ell_(upright("null"))) \, wide J_h = Z^(lt.eq d) T^m H . $
  Here $ell_(upright("null")) = \( 1 \, - n \)$ (the same $ell$ as in (10.6));
    the contraction is inside the $Z$’s. A length written as an exponent allows any word of that length.
    The indices, for a target total order $n_(*)$ and time count $j$, have
  $ j' = j - m \, wide n' + b_0 lt.eq n_(*) \, quad n' < n_(*) \, wide n' = b' + j' \, quad b_0 = d + m . $
  More explicitly the bad term has the form
  #[#set math.equation(numbering: n => "(11.8)")
   $ C_h partial_q \( c_0 partial_q chi_ell \) $ <fs:G5>]
  where $c_0$ is as in (11.4), and spatial counts on $chi_ell$ can be smaller. The other terms, multiplied by $r$, cost
  #[#set math.equation(numbering: n => "(11.9)")
   $ C \| J_h \| \( B_(b' + 1 \, j')^i + G_(b' + 1 \, j')^i \) + C r \| a \( q \) C_h \| thin G_(b' j')^i . $ <fs:G6>]
  These are bounds term by term, allowing sums and bounded coefficients.
    Indeed lab commutation first gives $P \[ T^m H \]$ on $r T^(j') U$ if $m gt.eq 1$.
    In the $Z$ commutations use $P_g = P_eta + P \[ H \]$; differences from the flat recurrence differentiate
    (10.6) by Leibniz (including a scalar multiple from each dilation recurrence),
    with highest second derivatives on the field cancelling. In particular there is no differentiation of the
    projector #emph[outside] the full differentiated contraction in (11.8);
    differentiations of $k^(- 1)$ by $Z$ stay inside $partial_q$.
    The mixed and spatial second derivatives and all lower terms obey (11.9).
    The $a \( q \)$ terms there only differentiate $s$-dependent frame factors, with the double contraction of (10.6).
  Products in these formulas and their estimates below use sphere $L_omega^2$ on a coefficient if it is high,
    moving two extra rotations to a low companion; otherwise we use coefficient sup with spare rotations.
    For $J_h \, C_h$ one may use the latter when $b_0 lt.eq 5$; when $b_0 gt.eq 6$ there is room since $n' +
    3 lt.eq n_(*)$. The composition sphere bounds follow by the ordinary chain rule with at most one highest
    factor not in sup. Write $L_h$ for the bound of $r \| C_h \|$ with the indicated placement.
    For $b_0 lt.eq 8$ (without increasing a high index) it is $O \( 1 + N r^(2 eta_(*)) \)$,
    tight $O \( 1 \)$ on $\| q \| lt.eq 10 r^theta$, and $O \( r^(- 1 + 8 eta_(*)) \)$ if $m gt.eq 1$;
    these use (10.10), (10.11), with smallness taken after any fixed bootstrap constants.
    For $b_0 = 9$ use the sphere bounds of (10.11) exactly. Now (11.9) costs an acceptable amount in both raw bulk
    weights of (10.17), even ignoring the $1 + M$ denominator.
    Indeed $J_h$ costs $r^(- 1 + 2 eta_(*))$ to order eight or $r^(- .48)$ at nine (then the target is level 0).
    Use (11.3). Also $L_h \| a \( q \) \| lt.tilde N$ by the tightness and decay split, except possibly at nine;
    there use $G_(b' j')^H$ with $W_H$ on the low field, so $\( W_0 \/ W_H \)^(1 \/ 2)$ and $a \( q \)$ decay give
    the same sufficiency by (10.11).
  #emph[The raw time-multiplier budget.] Estimate (11.8) without splitting,
    namely $L_h$ times the first line of (11.4) with target square weight $w_(i \, j)$.
    For $m gt.eq 1$ it is small by (10.10), (10.11) and (11.3), including the $j$-transfer.
    It remains to treat $m = 0$. At levels $P \, 0$, except $b_0 = 9$,
    the $B_(b' \, j + 1)$ term costs prior norms: $L_h m_(upright("cone"))^(- d_(*) \/ 2)$ is bounded by tightness
    and the outer $m_(upright("cone"))$-gain. The other two terms are small by $1 \/ r$ and $a \( q \)$.
  At level $H$ instead use both lines of (11.4); $B_(b' j)^psi$ has total order at most seven,
    and $L_h \( w_H \/ w_(P \, j) \)^(1 \/ 2) lt.tilde 1$. Angular placements respect this order,
    and level $P$ is prior.
  The exceptional coefficient count $b_0 = 9$ occurs only at level 0 and has a low input. Use the same conversion:
    (11.3) gives $L_h \( w_(0 \, j) \/ w_(P \, j) \)^(1 \/ 2) lt.tilde 1$,
    since the logarithm of (10.11) is offset at small $\| q \|$,
    and the term $\( 1 + min \( \| q \| \, r \) \)^(1 \/ 2) r^(- p_0 \/ 2)$ is offset too (use $mu^(- A_H \/ 2)
    l^(\( - \( A - A_H \) + 7 d_(*) \) \/ 2)$ at large $\| q \|$).
    Similarly $L_h \| a \( q \) \| \( w_(0 \, j) \/ w_H \)^(1 \/ 2) lt.tilde N$; the $r^(- 1)$ terms are small directly.
  #emph[The outgoing budget with a current correction.] If $b_0 lt.eq 5$, or if the target is level $P$,
    use the correction
  $ cal(P) = C_h c_0 partial_q chi_ell $
  for (11.8), with its actual sign/factor. Corrections for different terms are always summed.
    The remainder differentiates $C_h$ by $partial_q$, so the bound after multiplying by $r$ uses (10.10),
    cost $r^(- 1 + 8 eta_(*))$, against $B_1$ in the field; this is small in (10.17) by (11.3).
    For the correction norms $C_h \, Z C_h$ cost at most $O \( r^(- 1 + 2 eta_(*)) \)$,
    and when $Z$ hits the field $n' + 1 lt.eq n_(*)$. In the term $r d_g partial_q cal(P)$ one has $r d_g lt.tilde
    r^(2 eta_(*))$ and uses (11.4). Thus all its bulk costs are small too;
    its time cap uses $B_1 chi_ell$ alone and is small. Sphere placements for $b_0 lt.eq 5$ take $partial_q C_h \,
    Z C_h$ with two extra rotations, allowed in (10.10).
  #emph[The outgoing budget with a high coefficient.] It remains to treat $b_0 gt.eq 6$ at levels $0 \, H$,
    without a current correction. If $m gt.eq 1$, the same raw bound as before,
    now using $W_i \/ w_(i \, j')$ or $W_i \/ w_(i \, j' + 1)$, works with strict gain by (10.10), (10.11).
  If $m = 0$, use (11.4) in full, including the two extra rotations on the low input.
    The terms with $r^(- 1)$ have strict gain by (11.3). Thus it suffices to bound $L_h$ times cap/bulk
    derivatives $B_1$ of low $psi$ fields, and $L_h \| a \( q \) \|$ times $B_1$ of low $h$ fields.
    Indeed the $V$ pieces in the cap comparison above can instead use (10.1) bulk with $W_P \, W_H$ respectively,
    by (10.11) (as for (11.9), and $L_h \( W_i \/ W_P \)^(1 \/ 2) lt.double 1$).
    All low orders used here fit even with two extra rotations.
  On the timelike region $t gt.double r$, the bad bulk weights of levels $P \,
    H$ suffice for the $B_1$ costs with gain: use $w_(P \, j) gt.tilde t^A r^(- .025)$,
    $W_i asymp r^(p_i - A_i) t^(A_i)$, and $w_H gt.tilde t^(A_H) r^(- e - delta A_H)$ with $\|
    a \( q \) \|$ decaying; the extreme $b_0 = 9$ only occurs for $W_0$.
  On the remaining region $t lt.tilde r$, $r asymp R_f$, use the mixed entry with $l_(R_f)$ equal to the bounds in
    (10.10), (10.11) for $L_h \( w_(P \, j)^(- 1 \/ 2) + \| a \( q \) \| w_H^(- 1 \/ 2) \)$,
    supremized at fixed $frak(u)$ on the shell. Weights and power thresholds may use $R_f$ in place of $r$,
    with fixed comparable constants.
  #emph[Counts six through eight.] The squared integral of this kernel is $O \( R_f^(.013 eta_(*)) \)$. Indeed
  $ w_(P \, j)^(- 1) lt.tilde r^e mu^(- A_H) l^(- \( A - A_H \) + 7 d_(*)) \, $
  whose integral is $O \( r^(e + delta A_H + nu \( 1 - A_H \)) \)$ because $A - 7 d_(*) > 1$.
    The margin needed for the mixed shell charge is
  #[#set math.equation(numbering: n => "(11.10)")
   $ e + delta A_H + nu \( 1 - A_H \) = .011 eta_(*) + .09 eta_(*)^2 < .013 eta_(*) < 1 -
     p_H . $ <fs:principal-shell-margin>]
  On $\| q \| gt.tilde r^theta$, the tail integral has enough additional power gain to offset $L_h^2$;
    the decay of $a \( q \)$ handles its entry as well. Supremizing uses only comparability of $r^delta + \|
    q \|$ and $r^delta + \| frak(u) \|$, so the small-$q$ acceleration bound may be broadened to a band
    $O \( R_f^delta \)$. This proves summability for $b_0 lt.eq 8$.
  #emph[Count nine.] Only weight $W_0$ occurs. The squared extra term $\( 1 + min \( \| q \| \, r \) \)
    r^(- p_0)$ in $L_h^2$, including the mixed shell factor squared, contributes at most
  $ C R_f^(- 1)
    integral_(\| frak(u) \| lt.tilde R_f) \( R_f^delta + \| frak(u) \| \) \( w_(P \, j)^(- 1) + \| a \( q \) \|^2
    w_H^(- 1) \)_sup thin d u . $
  Split the $w_P^(- 1)$ part at $\| frak(u) \| = R_f^nu$. It is bounded by the sum of
  $ R_f^(- 1 + e + delta A_H + nu \( 2 - A_H \)) \, wide
    R_f^(1 - A + 7 d_(*) + e + delta A_H + nu \( A - A_H - 7 d_(*) \)) . $
  Both exponents are less than $- 1 \/ 4$ for the fixed range of $eta_(*)$.
    For the acceleration part, use $\| a \| lt.eq C N$ on the broadened band $\| frak(u) \| lt.eq
    C R_f^delta$ and $\| a \( q \) \|^2 lt.eq C N^2 \| frak(u) \|^(- A)$ outside it.
    Its powers are bounded by $R_f^(- 1 + e + 2 delta)$ and $R_f^(- 1 + e + delta \( 2 - A \))$.
    The integral is therefore $O \( R_f^(- c_1) \)$ for a fixed $c_1 > 0$;
    logarithms and $R_f^(8 eta_(*))$ losses in the ninth-order coefficient leave a strict summable margin.
    This accounts for every common principal commutator in both multipliers.
  #strong[Claim 2: the additional strong-equation terms.] Before treating $f_h \, D f_h$,
    the additional strong equation commutators arise already at order zero:
  #[#set math.equation(numbering: n => "(11.11)")
   $ g^(i j) partial_(i j) psi & = D f_h - \( D g^(i j) \) partial_(i j) h\
 & quad + 2 g^(i j) \( partial_i s_s^d \) partial_(j d) h + g^(i j) \( partial_(i j) s_s^d \) partial_d h . $ <fs:G7>]
  In (10.6) on the second term, $J$ (full) and $C$ (double contraction) after ordered differentiations through
    $b + m lt.eq 7$ satisfy in sphere $L^2$
  $ \| J \| lt.tilde N r^(- 1 + 8 eta_(*)) tau^(- A_H \/ 2) \,
    wide \| C \| lt.tilde N r^(- 2 + 8 eta_(*)) tau^(- A_H \/ 2) . $
  Indeed $D B = O \( r^(- 1) tilde(a) \)$ with symbol bounds (freezing makes this derivative zero), $D h = psi$.
    The improved estimate on the double contraction of $psi$ uses $T^m D T^0
    h$ via the same formula as (11.5) but solved for $T^m psi$,
    and the projected estimate on $T^(m + 1) h$ in the proof of (10.10), i.e.
    without a stationary background term since this is $h$ itself; $Theta$ there costs $O \( r^(- 1) tilde(a) \)$.
    Quadratic inverse errors use (11.2). The full $r$-gain on the projected coefficient therefore applies even
    through all the commutations of (11.11). After multiplying by $r$, the bad,
    mixed/good and $a \( q \)$ terms of (10.6) now cost an acceptable amount directly in both raw weights:
    use (11.4) on $h$ through total order eight for $B$, weighted by $w_H$; (11.3) works because $A < 2 A_H$.
    For $a \( q \)$ times good entries use $W_H$. If the coefficient is high use the two rotations instead on a
    low input ($b + m gt.eq 6$ suffices). Likewise the piece $2 H^(i j) partial_i
    s_s^d$ in the third term of (11.11) costs $O \( N r^(- 2 + 2 eta_(*)) tau^(- A \/ 2) \)$ in #emph[all]
    components through these coefficient orders, hence works directly.
    The last term of (11.11), after the $r^2$ source scaling,
    costs $C tilde(a) thin B^h$ with bounded coefficient products and likewise works.
  Here the derivative accounting is explicit. If $c = b + m$ derivatives hit $D g$ and $n'$ hit $h$, then $c +
    n' lt.eq 7$. The two physical derivatives on $h$ require a $B^h$ index of at most $n' + 1 lt.eq 8$,
    available at level $H$. For $c lt.eq 5$ two additional rotations on the coefficient stay within its
    order-seven estimate. For $c gt.eq 6$, place it in $L_omega^2$;
    the input including the two transferred rotations has $B$ count at most $7 - c + 1 + 2 lt.eq 4$.
    For example, comparison of the $J$ or $r C$ bound with the high $w_H$-weighted bad norm gives the squared factor
  $ C N^2 r^(p_P - 2 + 16 eta_(*) + e) tau^(A - 2 A_H) . $
  The radial exponent is $- .38 + 16.001 eta_(*) < 0$ and $A - 2 A_H = - .64 + 2 eta_(*) < 0$.
    These are strict gains before using the $1 + M$ denominator.
  For the smooth $Y = 2 eta^(i j) partial_i s_s^d$ coefficient of $partial_(j d) h$, $J =
    Z^b T^m Y$ is $O \( r^(- m) tilde(a) \)$; $partial_q C$ for its differentiated contraction as before costs an
    extra $r^(- 1)$, since $partial_q \, Z$ commute and no derivative of the fixed-$n$ projector occurs.
    Here $n'$ in (11.8), (11.9) for the input $h$ can equal $n_(*) lt.eq 7$.
    In the time multiplier use (11.4) in full for (11.8): the $psi$ term costs $C r^(1 - m) tilde(a)
    thin \( w_(P \, j) \/ w_(P \, j - m) \)^(1 \/ 2) lt.tilde C N$ times its weighted bad entry,
    admissible even at the same order. The $a \( q \)$ terms on $B^h \,
    G^h$ use $\( w_(P \, j) \/ w_H \)^(1 \/ 2) lt.tilde l^(\( A - A_H \) \/ 2)$ and acceleration decay.
    All $1 \/ r$-suppressed terms work directly by (11.3), as do the ordinary mixed/good terms of (11.9).
    In the outgoing multiplier use current correction $C c_0 partial_q chi_ell^h$ as for (11.8).
    Its (10.17) costs all use (11.3) and $w_H$, with up to order eight by (11.4), $r d_g lt.tilde r^(2 eta_(*))$;
    the bulk source remainder costs $r \| partial_q C \| lt.tilde tilde(a)$ times $B_1$.
    The ordinary mixed/good terms are small too.
  One further correction here deals with the explicit $a \( q \)$ term of (10.6) (not the one inside (11.8)).
    More precisely, with $d_i Z = \( b_i - ell_i s^d b_d \/ k \) Z$ in the first derivative formula, it comes from
  $ - Y_(ell_(upright("null")) ell_(upright("null"))) thin partial_q \( s^d \/ k \) thin b_d Z \( chi \/ r \) $
  in $P \[ Y \] chi$, and the corresponding ordered differentiations (lab times on $Y$ and the input taken before
    (10.6)). It thus has the form $C thin \( partial_q c_2 \) thin D_Z chi_ell \/ r$, with sign included in $D_Z$,
    an operator of order at most one in $Z$ with smooth sphere coefficients independent of $q$;
    $c_2$ smooth bounded in $n \, s \( q \)$. Use correction $C c_2 D_Z chi_ell \/ r$.
    The two remainders, multiplied by $r$, cost $C' tilde(a)$ times $B^h \, G^h$ entries through order eight,
    all suppressed by (11.3). For the bulk correction budget even after $Z$ it uses $G^h$ through order eight with
    the same coefficient bound; $r d_g partial_q$ additionally costs $O \( r^(2 eta_(*)) tilde(a) \)$ against
    $G^h$ and $O \( r^(- 1 + 2 eta_(*)) tilde(a) \)$ against $B^h$ (differentiate the formula,
    including $\| partial_q c_2 \| lt.tilde \| a \( q \) \|$). These meet (10.17).
    For its time-slice budget use $G_1 chi_ell$ with $W_H$; any undifferentiated $chi_ell \/
    r$ term uses (11.2) directly with $tilde(a)$, giving summability in $L^2 \( d r \)$ even with $W_P^(1 \/ 2)$.
    This proves sufficiency for (11.11) except $D f_h$.
  #strong[Claim 3: background, linear, and suppressed products.] We finish with the semilinear sources, i.e.
    linear combinations (from the flat recurrence, thus with constant scalars out front) of
  #[#set math.equation(numbering: n => "(11.12)")
   $ Z^(c_3) \( k r T^j f_h \) \, wide Z^(c_3) \( k r T^j D f_h \) \, wide c_3 + j lt.eq n_(*) . $ <fs:G8>]
  All product estimates allow indices #emph[up to] the indicated ones.
    The estimates for $r$ times these expressions thus concern $r^2$-scaled physical sources.
    Unless specifying a different treatment, a \"both weights\" bulk estimate below uses $w_(i \, j)^(1 \/ 2)$ and
    $\( W_i \/ \( 1 + M \) \)^(1 \/ 2)$ of (10.17); for suppressed products it suffices simply to use $W_i^(1 \/ 2)$.
  For the pure background source, the $r^2$ scaling leaves $tilde(a)$ at levels $0 \,
    H$ and $r^(- 1) tilde(a)$ at level $P$; the latter gain comes from the $D$ derivative of the defect.
    We estimate these terms directly, including on the starting annulus.
    On a shell $r asymp R_f$, an enlarged positive majorant is
  #[#set math.equation(numbering: n => "(11.13)")
   $ A_(R_f) \( t \) = C_1 / R_f integral_(t - C_2 R_f)^t \| a \( u \) \| thin d u \, wide a \( u \) =
     0 quad \( u < 0 \) . $ <fs:acceleration-average>]
  Since $A > 1$, Cauchy–Schwarz gives $parallel a parallel_(L^1) lt.eq C_A sans(S)_a$.
    The averaging kernel has $L^2$ norm $O \( R_f^(- 1 \/ 2) \)$, hence the first estimate below.
    For $t gt.eq 2 C_2 R_f$, the time weight is comparable throughout the averaging interval;
    the bounded $L^1$ norm of the kernel gives the second:
  #[#set math.equation(numbering: n => "(11.14)")
   $ parallel A_(R_f) parallel_(L_t^2) lt.eq C R_f^(- 1 \/ 2) sans(S)_a \, wide
     parallel chevron.l t chevron.r^(A \/ 2) A_(R_f) parallel_(L^2 \( t gt.eq 2 C_2 R_f \)) lt.eq
     C sans(S)_a . $ <fs:average-bounds>]
  The fixed intermediate time band is included in the early estimate. As $A_i lt.eq A$, the late contribution satisfies
  $ R_f^(p_i - A_i) parallel chevron.l t chevron.r^(A_i \/ 2) A_(R_f) parallel_(L^2 \( t gt.eq C R_f \))^2 lt.eq
    C R_f^(p_i - A) sans(S)_a^2 . $
  The squared early/late shell exponents are $p_i - 1 \, p_i - A$ for $i = 0 \, H$,
    with two further inverse powers for $i = P$:
  #[#set math.equation(numbering: n => "(11.15)")
   $ i & upright("early") & upright("late")\
0 & - .36 & - .72\
H & - eta_(*) \/ 6 & - .36 - eta_(*) \/ 6\
P & - 1.38 & - 1.74 $ <fs:defect-shell-margins>]
  and their dyadic sums tend to zero with $R_0$. This calculation also applies on $\[ R_0 \/ 2 \, R_0 \]$:
    the pure defect is estimated directly there, without a growing compact coefficient on $sans(S)_a$.
  For the terms of linear jet size $O \( r^(- 2) partial h + r^(- 3) h \)$,
    after multiplication by $r^2$ one uses $r^(- 1) B_(b j')^h$,
    times bounded smooth coefficients with their distributed differentiations.
    The $h$-jet factors in those coefficients cost at most $C$ in $L_omega^2$ even through order nine;
    in a product with a high such factor, transfer two rotations to the bulk field for the angular placement.
    More precisely one needs this transfer only at high coefficient orders (say seven and up);
    all its counts then fit the same level. Using $w_(i \, j')^(1 \/ 2) B_(b j')^i$ from (10.1),
    (11.3) supplies strict radial gain. The leading stationary coefficient constants have symbol bounds
    independent of the matching radii. In $D f_h$ these terms give the same estimate for $psi$ in place of $h$,
    and terms with $r^(- 1) B_(b j')^h$ accompanied additionally by $tilde(a)$ or a factor $V^psi$ (with
    distributed indices). For the latter estimates use level $H$ on $h$, (11.2) on the extra factors,
    and (11.3) with $A < 2 A_H$. In particular $mu gt.tilde tau$.
    The orders here sum to at most seven; a high extra factor can be put in sphere $L^2$ with its stated decay,
    using spare rotations on the others. To justify this differentiation description one can take $D$ before the
    lab $T^j$, still in Cartesian lab formulas before frame and scale expansions.
    Linear jet coefficients before smooth field composition consist of background first jets (and gauge
    coefficients of first-jet size) at order $O \( r^(- 2) \)$, second or first-product jets at $O \( r^(- 3) \)$.
    On these $D$ gains $O \( tilde(a) \)$ relative to the indicated bounds:
    $D B = O \( r^(- 1) tilde(a) \)$ with symbols by $D x = 0$ and the parameter/formal-frame differentiation of
    the order $- 1$ residual from flat in lab components. Commuting lab derivatives costs $partial s_s =
    O \( tilde(a) \)$ with symbol bounds; the compensator and its derivatives have the stated stronger bounds from
    the reduction. Smooth $h$-coefficients instead differentiate by $D h = psi$.
    This applies directly in the Ricci and gauge substitution formulas giving (10.3);
    it does not require $D r$ for the emitter radius to vanish.
  Here are reusable quadratic product placements. The last term of (10.3) has vanishing coefficient $cal(H) =
    O \( r^(- 1) + \| h \| \)$ in front of two first jets. After the scaling and differentiations for $h$,
    this costs products bounded by
  #[#set math.equation(numbering: n => "(11.16)")
   $ \| Z^b T^m cal(H) \| thin B_(b_1 i_1)^h B_(b_2 i_2)^h \,\
b + m + b_1 + i_1 + b_2 + i_2 lt.eq n_(*) . $ <fs:G9>]
  with harmless additional smooth sphere coefficients, sums, and analogous metric compositions.
    Use $r^(- 1 + 2 eta_(*))$ on the coefficient through order eight, $r^(- .48)$ at nine, in sphere $L^2$.
    This also bounds the corresponding rates in sup with two spare rotations.
    If $b + m lt.eq 6$ take that sup with the better rate, and otherwise put both $B$ factors in sphere sup using
    two more rotations on each. Put a lower-order $B$ in point control (11.2),
    the other in bulk $w_(i \, i_k)^(1 \/ 2)$ of its occurrence (here $i = H \, 0$ is the level,
    $i_k$ the relevant time count). There is enough room, since the lower-order factor needs order at most four
    before the rotations and a coefficient consuming at least seven leaves both factors low.
    By (11.3), (11.2), (11.16) fits both weights with strict radial slack also in the order-nine coefficient case.
  For strong estimates a similar sufficient suppressed product is (11.16) with total count at most eight and
    target $W_P^(1 \/ 2)$; we now put the high $B^h$ in $w_H^(1 \/ 2)$ and the lower one in point with $N
    w_H^(- 1 \/ 2) lt.tilde N r^(e \/ 2) tau^(- A_H \/ 2)$. The $tau$ loss of (11.3) is covered.
    Coefficients through this total order cost at most $C r^(- 1 + 2 eta_(*))$.
    The placements work also with plain $O \( r^(- 1 + 3 eta_(*)) \)$ bounded coefficients,
    or with one $B^h$ replaced by $B^psi$ if the total count on the two inputs is at most seven (measure a high
    $B^psi$ in its own level; point $B^psi$ through its stated orders in (11.2)).
    Thus $T^j D$ on the vanishing-coefficient terms works simply counting $D$ as up to one extra lab first
    derivative on the metric/field factors; differentiated $s_s$ coefficients are bounded.
    Additional unscaled spatial lab derivatives can always be distributed before switching to $Z \, T$ counts,
    using $partial_d = ell_d T + r^(- 1) b_d Z$ on lab jets with $T$ still commuting through other lab
    derivatives. Smooth bounded field compositions with explicit $r^(- 1)$ suppression and the analogous symbol
    bounds work by the same allocations.
  Two explicit comparisons record the restrictive suppressed products.
    At strong level a coefficient $O \( r^(- 1 + 3 eta_(*)) \)$, a high $B^h$ measured with $w_H$,
    and a low $N w_H^(- 1 \/ 2)$ give
  $ W_P r^(- 2 + 6 eta_(*)) w_H^(- 2) lt.tilde r^(p_P - 2 + 6 eta_(*) + 2 e) tau^(A - 2 A_H) \, $
  whose radial exponent is $- .38 + 6.002 eta_(*) < 0$. At coefficient count nine only level $0$ occurs;
    its squared comparison is bounded by $r^(p_0 + .021 - .96 + e) = r^(- .299 + e)$.
    For coefficient count at least seven the two input counts sum to at most two,
    so both inputs admit two additional rotations. For a lower coefficient the smaller input has count at most
    four before those rotations. The mixed strong product has total count seven,
    and its lower input needs at most five counts after the rotations, within the order-six point bound for $B^psi$.
  #strong[Claim 4: the leading weak-null source and its corrections.] We treat $Q_eta$ separately.
    First take $T^j$ on it, for either equation, giving the polarization sum.
    Set $h_i = T^i h \, med p_i^flat = T^(i + 1) h$ (here this decorated letter denotes just the symmetric tensor,
    not a radial power), and set
  $ F_i = r Pi T^(i + 1) h \, wide hat(F)_i = r Pi T^(i + 1) psi . $
  For each polarization pair, use (10.4) to write $partial_alpha h_i = ell_alpha breve(p)_i +
    E_(alpha i)$ with $cal(G)_n breve(p)_i = 0$ and $Pi breve(p)_i = Pi p_i^flat$.
    The error $r E_(alpha i)$ is made of $b Z h_i$ good terms and $r$ times the differentiated gauge error (10.2)
    with bounded sphere coefficients. Here the lab differentiations in (10.2) are taken before the bad/flat-good
    decomposition. Expand each quadratic polarization sequentially,
    so each remainder need use just one such error and as its partner a full $partial h_l$ or a projected $ell
    breve(p)_l$, estimated without any substitution of gauge errors into that partner. This gives
  #[#set math.equation(numbering: n => "(11.17)")
   $ T^j Q_eta = r^(- 2) ell ⊗ ell sum_(i + l = j) cal(C)_(i l) \( F_i \, F_l \) + upright("Err")_j \, $ <fs:G10>]
  where the pairings include constants. One may use ambient spatial tensor components for the screen,
    the Euclidean pairing being smooth. After $Z^(c_3)$ the $r^2$-scaled error terms have placements (11.16) or
    explicit $O \( r^(- 1) \)$ suppressions of that type, $tilde(a) thin B^h$, or
  #[#set math.equation(numbering: n => "(11.18)")
   $ G_(b_1 i_1)^h thin B_(b_2 i_2)^h \, wide b_1 + i_1 + b_2 + i_2 lt.eq n_(*) . $ <fs:G11>]
  Smooth bounded compositions are allowed on suppressed terms.
    These assertions follow from (10.2), including $r Theta = O \( tilde(a) \)$.
    Terms with $tilde(a)$ fit directly by (11.3). For (11.18) at levels $H \, 0$,
    if the good input is lower order use its point $C N r^(- 1 + 2 eta_(*))
    tau^(- A_H \/ 2)$ and measure the bad input in $w_(i \, i_2)$.
    If the good input is higher order measure it in $W_i$, the low bad one in point $C N w_H^(- 1 \/ 2)$;
    this works in both weights since $w_H^(- 1) lt.tilde 1 + M$, and $w_(i \, j) w_H^(- 1) lt.tilde W_i$.
  In $T^j D Q_eta$ the commutator terms $\( T^m s_s^d \) partial_d T^(j - m) Q_eta \, med m gt.eq 1$,
    already have the suppressed strong placement via $T^m s_s^d = O \( tilde(a) \)$ with $Z$-bounds.
    Consider thus $D$ on (11.17) before the $Z^(c_3)$ distribution.
    When it differentiates $upright("Err")_j$ the suppressed terms are still suppressed,
    now at total orders up to eight; expressions involving the gauge have the same differentiable product
    structure, with $O \( 1 \/ r \)$ when a sphere projector is differentiated by $D$.
    The good factor underlying (11.18), if hit by $D$, now costs $C r^(- 1) B_(b_1 + 1 \, i_1)^h$:
    indeed $D = \( 1 - s_s dot.op n \) k^(- 1) partial_q + r^(- 1) d
    Z$ with bounded coefficients under spatial-emitter differentiation,
    and $partial_q$ commutes with $Z$ before expanding on $h_i$.
    Differentiation of scale factors costs a relative $O \( 1 \/ r \)$ too.
    Thus the remaining unsuppressed placements are (11.18) with total count up to eight (one extra derivative can
    now be on the bad input). If good is low the previous point placement and $w_H$ on the bad input suffice even
    with $W_P$ since $2 A_H > A$. If good is high, use $W_H$ and the low bad point bound; the relevant comparisons are
  $ \( W_P \/ W_H \) w_H^(- 1) lt.tilde 1 + M \, wide \( w_(P \, j) \/ W_H \) w_H^(- 1) lt.tilde 1 . $
  The first uses $p_P - p_H + e < .72$ within $\| q \| lt.eq r$; outside, use $mu gt.tilde r^(1 - delta) tau$.
    The second follows from (11.3). Low placements here have at most four derivatives before the two spare
    rotations. This proves acceptability of all the remainders of (11.17).
  Consider the outgoing budget of the first term of (11.17) for $i_(upright("lev")) = H \, 0$.
    On $t gt.double r$ ordinary high-low placement on differentiated $F_i \,
    F_l$ suffices with $B^(i_(upright("lev")))$ for the high one, low $w_H^(- 1 \/ 2)$ in point for the other:
  $ \( W_(i_(upright("lev"))) \/ w_(i_(upright("lev")) \, i') \) w_H^(- 1) lt.tilde 1
    wide \( t gt.double r \, med i' med upright(i n med t h a t med l e v e l) \) . $
  On the remaining $t lt.tilde r$ use the mixed entry. A high differentiated $F_i$ is controlled by the
    corresponding $B_1 chi$’s of $h$ and the $V_(b i)^h$ term in the cap comparison.
    The latter term can instead be charged as a high good input in bulk paired with low point $N w_H^(- 1 \/ 2)$,
    as in (11.18). The $B_1$’s have time cap with square weight $w_(i_(upright("lev")) \, i)$.
    Thus the mixed kernel is bounded by
  $ C N sup \( w_(i_(upright("lev")) \, i) w_H \)^(- 1 \/ 2)
    quad \( upright("sup at fixed ") frak(u) upright(" in the shell") \) $
  on $\| u \| lt.tilde R_f$. Its squared integral for $i_(upright("lev")) = H$ costs $C N^2 R_f^(2 e + delta)$.
    For $i_(upright("lev")) = 0$ use $w_(0 \, i)^(- 1) lt.tilde R_f^.021$,
    giving cost at most $C N^2 R_f^(.021 + e + delta A_H + 1 - A_H)$.
    Here $r^delta + \| u \|$ is comparable to $r^delta + \| q \|$,
    and the low point placement including angular sup has the orders of (11.2).
    Both costs give shell summability with the indicated $p_(i_(upright("lev")))$.
  The squared mixed-shell exponents just obtained are
  #[#set math.equation(numbering: n => "(11.19)")
   $ p_H - 1 + 2 e + delta & = \( - 1 \/ 6 + .012 \) eta_(*) < 0 \,\
p_0 - 1 + .021 + e + delta A_H + 1 - A_H & = - .339 + 1.011 eta_(*) - .01 eta_(*)^2 < 0 .
  $ <fs:quadratic-shell-margins>]
  Their strict signs justify summing the norm charges themselves over dyadic shells.
  In the strong outgoing budget for the first term of $D$ applied to (11.17),
    use the correction (one for each term with its actual $cal(C)_(i l)$)
  #[#set math.equation(numbering: n => "(11.20)")
   $ cal(P)_(*) =
     Z^(c_3) #h(-0.16667em) [\( 1 - s_s dot.op n \) r^(- 1) ell ⊗ ell thin cal(C)_(i l) \( F_i \, F_l \)] . $ <fs:G12>]
  Indeed $k D = \( 1 - s_s dot.op n \) partial_q + r^(- 1) d' Z$, $k$ here being the one in (11.12);
    $partial_q$ commutes with $Z$. The outgoing remainder after multiplying by $r$ costs $C tilde(a) sum \|
    Z^(lt.eq c_3) \( F_i F_l \) \| + C r^(- 1) sum \| Z^(lt.eq c_3 + 1) \( F_i F_l \) \|$ with product derivatives
    allowed individually in the sums. This uses $partial_q \( 1 - s_s dot.op n \) =
    O \( tilde(a) \)$ with spatial-emitter derivatives. These are suppressed products through total order eight.
    In the bulk correction costs of (10.17), all terms have at least $r^(- 1)$ in front of differentiated products
    of $F_i \, F_l$, up to the factor $r d_g lt.tilde r^(2 eta_(*))$.
    Here $Z^b F_i$ uses $B_(b i)^h$, and $partial_q Z^b F_i$ uses $B_(b \, i + 1)^h$ by commuting then expanding
    on $T^(i + 1) h$. Thus the total input count never exceeds eight in these $B$ indices either;
    the $r^(- 1 + 2 eta_(*))$ suppressed estimate with $W_P^(1 \/ 2)$ proves sufficiency.
    At a time-slice cap the count in (11.20) itself is at most seven;
    make the same high-low comparisons with $w_H$ on the high $B_1 chi$’s.
    A $V^h$ term missing from their cap control is bounded by (11.2) directly;
    after the weights and low point factor this term has sphere $L^2$ bounded by $C N^2
    r^(p_P \/ 2 - 2 + 3 eta_(*))$ with favorable $tau$ factor, summable in $L^2 \( d r \)$.
  #strong[Claim 5: raw leading products on the finite slab.] It remains to verify the raw time-multiplier budgets
    of the leading terms. At $H \, 0$ they use, after $r^2$ scaling, products $F_i F_l$ with $i + l = j$;
    at level $P$, $F_i hat(F)_l$ with $i + l = j$, modulo suppressed terms,
    all still differentiated by $Z$ to order $c_3$. Indeed $D F_i = hat(F)_i + O \( r^(- 1) \) B_(0 \, i)^h +
    O \( tilde(a) \) sum_(m lt.eq i) B_(0 \, m)^h$ as a differentiable product bound under $Z$,
    by commuting $D$ with lab times before expanding its spatial-frame coefficients.
    On $\| q \| > r^nu$, normal high-low placement works without using (10.12):
    $w_(i_(upright("lev")) \, j) \/ w_(i_(upright("lev")) \, j') lt.tilde l^(9 d_(*))$ in a level,
    and $w_(P \, j) \/ w_H lt.tilde l^(A - A_H)$ for a high $F$ in the strong product.
    The low $w_H^(- 1 \/ 2)$ point factors offset both ratios by (11.2), (11.3).
    High factors use their corresponding $B$ in weighted bulk.
  Outside the near band the squared coefficient needed for the within-level transfer is at most $l^(9 d_(*))
    w_H^(- 1)$; for a high $h$ input in the strong product it is at most $l^(A - A_H) w_H^(- 1)$.
    They are bounded because
  $ e - \( nu - delta \) A_H & = - .089 eta_(*) + .09 eta_(*)^2 < 0 \,\
9 d_(*) - A_H & = - 1 + 1801 eta_(*) < 0 \, wide A - 2 A_H = - .64 + 2 eta_(*) < 0 . $
  On $\| q \| lt.eq r^nu$, a uniform bound on the undifferentiated news,
    rather than radial losses in every low differentiated supremum, closes the raw product estimate.
    First replace $F_i$ by $T^i F_0$ and $hat(F)_l$ by $T^l hat(F)_0$.
    Since $T^m \( r Pi \) = O \( 1 \)$ for $m gt.eq 1$, with $Z$ derivatives allowed,
    each replacement error has $r^(- 1)$ size relative to $B^h$ or $B^psi$ at the allowed indices.
    The remaining raw jet still contains a lab $T$ derivative.
    Products with these errors have the suppressed estimates already proved, for both $h$ and $psi$ inputs.
  Tile the near region in $\( q \, rho \, n \)$, with $rho = log r$,
    using small fixed coordinate boxes and a fixed enlargement of bounded overlap. The measure identity is
  #[#set math.equation(numbering: n => "(11.21)")
   $ t = q + e^rho \, wide frac(d t thin d r, r) = d q thin d rho . $ <fs:tile-measure>]
  On the enlarged boxes, $\| q \| lt.tilde r^nu$, the operators $T \,
    Z$ have uniformly bounded smooth coefficients through the required orders, and the weights are comparable.
    Within each level all time counts have equivalent weights there; also $w_(P \, j) asymp w_H$.
    Angular coordinates change the measure by a uniformly bounded factor.
  Ordinary derivatives of $F_0$ through order $n_(*)$ are controlled in the required weighted $L^2$ norm by
    $B_(b i)^h$ with $b + i lt.eq n_(*)$; the same statement holds for $hat(F)_0$ and $B^psi$ through the strong
    target order. To verify this count, commute $partial_q$ through $Z$,
    expand it on $T^(i + 1) h$ successively as $k T + r^(- 1) s^d b_d Z$, and retain the initial lab time.
    Sphere rotations span the angular derivatives. High $h$ factors use their own level in an $h$-only product and
    level $H$ in the strong product.
  Write $partial^a$ for the array of ordinary tile derivatives of order $a$.
    For $a + b = m > 0$, Hölder and Gagliardo–Nirenberg interpolation on an enlarged tile give
  $ parallel partial^a f thin partial^b g parallel_2 lt.eq parallel partial^a f parallel_(2 m \/ a) parallel
    partial^b g parallel_(2 m \/ b) lt.eq C N #scale(x: 120%, y: 120%)[\(] parallel f parallel_(H^m) +
    parallel g parallel_(H^m) #scale(x: 120%, y: 120%)[\)] \, wide parallel f parallel_oo +
    parallel g parallel_oo lt.eq C N . $
  An order-zero factor uses the $L^oo$ endpoint; the last inequality is weighted arithmetic–geometric mean.
    Insert cutoffs on the enlarged tiles for inhomogeneous norms.
    The needed supremum bound for $f \, g in { F_0 \, hat(F)_0 }$ is precisely (10.12).
    Local weight comparability, not a uniform bound on $mu$ over the whole near region,
    permits squaring and summing this estimate.
  The same argument applies up to the current time endpoint.
    For large $R_0$ the initial slice does not meet this band.
    If the upper endpoint meets a tile, it is the uniformly smooth graph $rho = log \( t_(upright("end")) - q \)$,
    with the domain below. Extend across it by a finite linear combination of values at negative multiples of the
    signed graph-height, matching normal derivatives through order $n_(*) - 1$.
    Change of variables gives uniform $H^(n_(*))$ and supremum bounds from enlarged interior boxes,
    and reflected weights remain comparable. Choose the fixed tile sizes small enough that,
    for boxes meeting $r gt.eq R_0$, the required enlargements and reflected points never extend inward beyond the
    fixed-factor overlap below $R_0$; near-cutoff boxes may equivalently use compact overlap controls.
    Source integrals with an additional cap truncation can be bounded on the full time slab.
    Summing with bounded overlap proves the near-region raw budgets,
    with only the stated compact-overlap and bootstrap-product costs.
  #strong[Claim 6: initial and starting-annulus costs.] All corrections are added before forming $xi$ for each
    equation; the bounds concern (10.1) for uncorrected fields, already part of the total norm.
    On fixed starting overlap annuli their extra current and boundary costs satisfy the same compact convention:
    (11.8) corrections use a first derivative of a lower commuted field with bounded coefficients (weighted at the
    same time level, with acceleration decay where strong and weak inputs couple);
    in (11.11) smooth-acceleration corrections the coefficient carries $tilde(a)$.
    The products in (11.20) on such annuli cost quadratically by weak fields with $2 A_H > A$.
    One can use the off-trap compact controls and sphere Sobolev placements there.
    Time-zero costs use the same cap estimates or directly the input symbol bounds.
    All patch/annulus constants on nonlinear terms are allowed fixed before smallness.
    This verifies (11.6) and therefore (11.7), with every positive-radius-gain term summable and the prior linear
    costs taken with independent far constants as specified there. ◻
]

=== 11.3 Simultaneous exterior closure <simultaneous-exterior-closure>

The compact, far, and acceleration estimates concern the same finite smooth slab.
  Write $K = sans(K)_R$, $F = sans(F)$, and $a_(*) = sans(S)_a$,
  and collect the fixed data and superlinear remainders in $E$. The three estimates 14, (11.7), and (5.16) have the form

#[#set math.equation(numbering: n => "(11.22)")
 $ K & lt.eq epsilon_R \( K + F \) + E \,\
F & lt.eq epsilon_0 \( F + a_(*) \) + B_0 K + E \,\
a_(*) & lt.eq D_0 K + C_0 F + E . $ <fs:coupled-inequalities>]

Here $epsilon_0$ becomes small by increasing $R_0$, whereas $epsilon_R$ is made small later by the compact
  matching radius and plateau choices. To choose them in this order, we need $C_0$ to stay bounded as $R_0$ grows.
  The next lemma proves exactly that fact and the compatible treatment of the pure acceleration defect.

#thm([Lemma 36.])[
  (Radius-uniform coupling).  #emph[The coefficient of $sans(F)$ in (5.16) may be taken independent of $R_0$.
    The comparison of the background defect $f_B$ with $Q \( 0 \)
    a$ may be split at a radius $Y$ fixed before $R_0$: its compact part costs $C \( Y \)
    sans(K)_R$ and fixed data/nonlinear terms, and its tail costs $C Y^(- 1 + epsilon.alt) sans(S)_a$,
    with any sufficiently small fixed $epsilon.alt > 0$. Conversely, the pure far defect,
    including the starting annulus, has an $o_(R_0 arrow.r oo) \( 1 \)$ coefficient on $sans(S)_a$ in (11.7).]
] <fs:uniform-coupling>

#proof[
  On a fixed $t$ slice the emitter coordinates satisfy
  $ y = C \( t - r \) - C \( t \) + r n \, wide partial_r y = n - s \( q \) \, wide partial_A y = r partial_A n . $
  It follows that
  #[#set math.equation(numbering: n => "(11.23)")
   $ d^3 y = k r^2 thin d r thin d omega \, wide partial_(y_i) r = n_i / k \,\
partial_(y_i) n_j = 1 / r (delta_(i j) - frac(\( n_j - s_j \) n_i, k)) \, wide "div"_y n = 2 /
  r . $ <fs:slice-jacobian>]
  All comparison constants depend only on the fixed small speed bound.
    Indeed $\( 1 - parallel s parallel_oo \) r lt.eq r_y lt.eq \( 1 + parallel s parallel_oo \) r$.
    These first derivatives contain no acceleration. In particular one must perform the single spatial integration
    by parts below in $d^3 y$ before comparing it to the emitter measure.
  Let $v_p$ be any adjoint zero mode in the fixed normalization of (5.16).
    Its uniform symbol bounds are $\| v_p \| lt.eq C r_y^(- 2 + epsilon.alt)$ and $\| partial_y v_p \| lt.eq
    C r_y^(- 3 + epsilon.alt)$. The leading linear source pairing has the form
  $ I \( t \) = integral chi_t chi_(>) v_(p \( t \)) #scale(x: 120%, y: 120%)[\[] A \( p \( t \) \) T psi +
    B^d \( p \( t \) \) partial_(y_d) psi #scale(x: 120%, y: 120%)[\]] thin d^3 y . $
  The coefficient matrices and the laboratory/component transformation are spatially constant on this slice.
    The outer cutoff $chi_(>)$ can be chosen so its emitter support begins at $r gt.eq c R_0$;
    a fixed-factor intermediate annulus is charged to $C \( R_0 \) sans(K)_R$.
    Write $T psi = L psi - n^d partial_(y_d) psi$. Then
  $ I \( t \) = integral chi_t chi_(>) v_p A L psi thin d^3 y -
    integral partial_(y_d) #scale(x: 120%, y: 120%)[\(] chi_t chi_(>) v_p \( B^d - A n^d \)
    #scale(x: 120%, y: 120%)[\)] psi thin d^3 y . $
  Derivatives of either cutoff cost $C \/ r_y$ on its support. Equation (11.23) and the adjoint symbol bounds give
  $ \| I \( t \) \| lt.eq C integral_(r gt.eq c R_0) r^epsilon.alt #scale(x: 120%, y: 120%)[\(] \| r L psi \| + \|
    psi \| #scale(x: 120%, y: 120%)[\)] thin frac(d r thin d omega, r) . $
  Choose $epsilon.alt < zeta < \( p_P - A \) \/ 2 = .13$. Cauchy–Schwarz contributes
  $ (integral_(c R_0)^oo r^(- 2 \( zeta - epsilon.alt \)) frac(d r, r))^(1 \/ 2) =
    frac(\( c R_0 \)^(- \( zeta - epsilon.alt \)), sqrt(2 \( zeta - epsilon.alt \))) . $
  This is uniformly bounded as $R_0$ grows. Since $W_P = r^(p_P - A) \( t + 10 r \)^A$ and (10.1) controls both
    $psi = \( r psi \) \/ r$ and $r L psi = L \( r psi \) - psi$, we obtain
  $ parallel chevron.l t chevron.r^(A \/ 2) I parallel_(L_t^2) lt.eq C sans(F) \, $
  with $C$ independent of $R_0$. Bounded initial times are included in the fixed finite-time input.
    No integration by parts in time, nor any differentiation of $p \( t \)$, has been used.
  Choose $Y$ beyond the fixed compact operator supports and the transition where target smoothing reaches its
    prescribed far form. The compact defect comparison on $r_y lt.eq 2 Y$ is given independently by (5.18).
    On its complement it is enough to bound the two terms separately:
  $ \| f_B \| + \| Q \( 0 \) a \| lt.eq C r_y^(- 2) #scale(x: 120%, y: 120%)[\(] tilde(a) + \| a \( t \) \|
    #scale(x: 120%, y: 120%)[\)] . $
  Use the majorant $A_rho$ from (11.13). On the cutoff $chi_t$,
    $t$ is a sufficiently large fixed multiple of $rho$, so (11.14) gives $parallel chevron.l t chevron.r^(A \/ 2)
    A_rho upright(bold(1))_({ t gt.eq 2 C_2 rho }) parallel_(L_t^2) lt.eq C sans(S)_a$, uniformly in $rho$.
    Pairing with $v_p$, converting $d^3 y$, and using Minkowski yields
  $ C sans(S)_a integral_Y^oo rho^(- 2 + epsilon.alt) thin d rho lt.eq C_epsilon.alt Y^(- 1 + epsilon.alt) sans(S)_a . $
  The omitted $\( 1 - chi_t \) Q \( 0 \) a$ tail obeys the same bound directly.
    Thus $Y$ is fixed before $R_0$ without producing a $C \( R_0 \) sans(S)_a$ term.
    Finally the direct shell estimates for the pure defect in the proof of 34 also apply to the single shell
    $\[ R_0 \/ 2 \, R_0 \]$. They prove the last assertion. All convolution bounds remain valid up to an arbitrary
    finite lifespan by extending $a$ by zero after the endpoint;
    causality leaves the values inside the slab unchanged. ◻
]

#thm([Corollary 2.])[
  (Global exterior estimates from the base neighborhood).  #emph[There is a neighborhood specified solely by
    sufficiently small $p_10$ difference from the Kerr bridge such that the two reduced computing-cylinder
    evolutions are global and smooth. They obey (5.7), (5.16), (5.16), Proposition 14 and (11.7),
    with arbitrarily small total base bounds after the neighborhood is sufficiently shrunk.
    The higher smooth norms on growing cylinders have the subexponential bounds of 15;
    their constants may depend on the fixed smooth datum and the order.
    No smallness of those higher initial norms is required.]
] <fs:closure>

#proof[
  Proposition 17 proves the simultaneous absorption and continuation from these estimates.
    Its bootstrap cap can be chosen arbitrarily small before the $p_10$ neighborhood is shrunk.
    This gives the asserted small base bounds on both cylinders.
    The higher-order conclusion is then Proposition 15, whose induction uses finite higher initial seminorms
    without shrinking the common base neighborhood. ◻
]

== 12 A triangular comparison with one common rate <app:triangular>

#thm([Lemma 37.])[
  (A finite triangular system with one common rate).  #emph[Fix an integer $k gt.eq 0$ and $C_0 > 0$.
    For each $T gt.eq 1$, let $0 < L_T lt.eq C_0 \( 1 + T \)$ and let $E_0 \, dots.h \,
    E_k$ be nonnegative absolutely continuous functions on $\[ 0 \, L_T \]$.
    Suppose nonnegative integrable functions $r_T \, b_T \, S_0 \, dots.h \, S_k$ satisfy, almost everywhere,
$ E'_j lt.eq r_T E_j + b_T sum_(ell < j) E_ell + S_j \, wide 0 lt.eq j lt.eq k . $

 Put $R_T \( t \) = integral_0^t r_T$, $B_T \( t \) = integral_0^t b_T$, and $cal(Q)_k \( B \) =
   sum_(q = 0)^k \( \( k + 1 \) B \)^q \/ q !$. Then
$ max_(j lt.eq k) E_j \( t \) lt.eq e^(R_T \( t \)) cal(Q)_k \( B_T \( t \) \)
  (max_(j lt.eq k) E_j \( 0 \) + integral_0^t e^(- R_T \( s \)) max_(j lt.eq k) S_j \( s \) thin d s) . $

 In particular, if $B_T \( L_T \) lt.eq e^(o \( T \))$, the polynomial factor is $e^(o \( T \))$ for this fixed
   $k$. A bound $b_T \( t \) lt.eq e^(o \( T \))$ uniform for $0 lt.eq t lt.eq
   L_T$ implies this integrated bound because $L_T = O \( T \)$.]
] <pk:triangular-comparison>

#proof[
  Set $tilde(E)_j = e^(- R_T) E_j$. Their differential inequalities have no diagonal term.
    Let $A$ be the strictly lower-triangular matrix with entries $A_(j ell) = 1$ for $ell < j$.
    Comparison with this positive linear system gives propagator $exp \( \( B_T \( t \) - B_T \( s \) \) A \)$.
    Since $A^(k + 1) = 0$ and $parallel A parallel_(ell^oo arrow.r ell^oo) lt.eq k + 1$,
    its norm is at most $cal(Q)_k \( B_T \( t \) \)$. Variation of constants proves the displayed estimate.
    Only finitely many nested lower-order integrations occur; there is one factor $e^(R_T \( t \))$. ◻
]

== 13 Vacuum constraint correction outside a protected ball <pk:constraints>

Localized deformation of the vacuum constraints was developed by Corvino, Corvino–Schoen,
  and Chruściel–Delay #cite(label("Corvino2000")) #cite(label("CorvinoSchoen2006"))
  #cite(label("ChruscielDelay2003")); conical localization was established by Carlotto–Schoen
  #cite(label("CarlottoSchoen2016")). We require a correction that fixes an inner ball and allows a decaying tail.
  The explicit inverse below provides this support property with full derivative gain.
  A nonlinear solve at one small base norm then gives smooth exact constraints,
  even when higher data norms are large. Section 9.6 applies the result to the rescaled beam seed.

We use the vacuum constraint map

$ Phi \( g \, k \) = #scale(x: 120%, y: 120%)[\(] R_g + \( "tr"_g k \)^2 - \| k \|_g^2 \, thin nabla^j k_(i j) -
  nabla_i "tr"_g k #scale(x: 120%, y: 120%)[\)] . $

===== 13.1 The exterior correction problem. <the-exterior-correction-problem.>

For a nonnegative integer $m$ and a decay exponent $j$, put

#[#set math.equation(numbering: n => "(13.1)")
 $ parallel v parallel_(H_j^m) = parallel v parallel_(H^m \( B_2 \)) +
   sup_(L gt.eq 1) L^j parallel v \( L thin dot.op \) parallel_(H^m \( { 1 < \| y \| < 2 } \)) .
   $ <pk:constraint-spaces>]

Componentwise versions of these norms are used for tensors. For an integer $s gt.eq 3$, let

$ Y^s = H_4^s \( bb(R)^3 \; bb(R) xor T^(*) bb(R)^3 \) \, wide X^s =
  H_1^(s + 2) \( bb(R)^3 \; "Sym"^2 \) xor H_2^(s + 1) \( bb(R)^3 \; "Sym"^2 \) . $

The Euclidean linearization of $Phi$, denoted only in this subsection by $P$, is

#[#set math.equation(numbering: n => "(13.2)")
 $ P \( q \, p \) = #scale(x: 120%, y: 120%)[\(] partial_i partial_j q_(i j) - Delta q_(i i) \,
   thin partial_j p_(i j) - partial_i p_(j j) #scale(x: 120%, y: 120%)[\)] . $ <pk:constraint-P>]

#thm([Proposition 35.])[
  (Exact correction outside a protected ball).  #emph[Fix an integer $s gt.eq 3$.
    There are constants $epsilon.alt_s \, C_s > 0$ with the following property.
    Let $d_B = \( delta + a_B \, b_B \)$ be smooth metric and second fundamental form data on $bb(R)^3$,
    with $delta + a_B$ positive definite and, for every multi-index $alpha$,
$ \| partial^alpha a_B \( y \) \| lt.eq C_alpha chevron.l y chevron.r^(- 1 - \| alpha \|) \,
  wide \| partial^alpha b_B \( y \) \| lt.eq C_alpha chevron.l y chevron.r^(- 2 - \| alpha \|) . $

 Let $phi.alt$ be a smooth compactly supported scalar/covector pair such that
$ "supp" phi.alt subset { \| y \| gt.eq 1 } \, wide Phi \( d_B \) = phi.alt quad upright("on ") \| y \| gt.eq 1 . $

 Define the two base sizes
$ beta_s = parallel a_B parallel_(H_1^(s + 2)) + parallel b_B parallel_(H_2^(s + 1)) \, wide eta_s =
  parallel phi.alt parallel_(Y^s) . $

 If $beta_s + eta_s < epsilon.alt_s$, there is a smooth tensor pair $v_c = \( q_c \, p_c \)$ such that
$ "supp" v_c subset { \| y \| gt.eq 1 } \, wide Phi \( d_B + v_c \) = 0 quad upright("on ") \| y \| gt.eq 1 \,
  wide parallel v_c parallel_(X^s) lt.eq C_s eta_s . $

 The corrected metric remains positive definite. The correction is smooth across $\| y \| =
   1$ and satisfies symbol bounds of metric weight one and second fundamental form weight two at every order.
   No smallness is required of these higher bounds. No moment condition is imposed on $phi.alt$,
   and the correction need not be compactly supported; its tail may change the asymptotic charges.
   No constraint equation is asserted for the artificially supplied datum on $\| y \| < 1$.]
] <pk:constraint-nonlinear>

The proof first constructs an exterior right inverse with full derivative gain.
  Its definition on all inputs, not only supported ones, will permit smoothness to be proved by rotations and
  dilations at the same base order.

#thm([Lemma 38.])[
  (Exterior right inverse for the flat constraints).  #emph[There is a linear operator $cal(K)$,
    defined on every $Y^s$ and bounded $Y^s arrow.r X^s$ for each integer $s gt.eq 3$, such that
#[#set math.equation(numbering: n => "(13.3)")
 $ "supp" z subset { \| y \| gt.eq 1 } quad arrow.r.double quad P cal(K) z = z \, wide
   "supp" cal(K) z subset { \| y \| gt.eq 1 } . $ <pk:constraint-right-inverse>]

 The same construction is used at all orders. Its conjugates by rotations and positive dilations of the argument
   are smooth in the operator norm from $Y^s$ to $X^s$.]
] <pk:constraint-linear>

#proof[
  We construct the inverse in three steps. Newton potentials solve the flat constraints and supply the permitted
    tail. Cutting them off on the inner ball creates a compact error whose Euclidean Killing moments vanish
    automatically. An annulus-supported primitive removes that error without changing the tail.
    Only this compact error has moment conditions; the original source is unrestricted.
  ===== 13.2 The Newton tail and its cutoff error. <the-newton-tail-and-its-cutoff-error.>
  First construct an inverse without a support restriction. For $z = \( f \, F \)$, let
  $ - 2 Delta u = f \, wide Delta W_i = F_i $
  be the Newton potentials, and set
  #[#set math.equation(numbering: n => "(13.4)")
   $ q_(0 \, i j) = u delta_(i j) \, wide p_(0 \, i j) = partial_i W_j + partial_j W_i - 1 /
     2 delta_(i j) partial_k W_k . $ <pk:constraint-Newton>]
  Then the scalar component of $P \( q_0 \, p_0 \)$ is $- 2 Delta u$.
    Also $p_(0 \, j j) = 1 / 2 partial_j W_j$, so the gradient terms in the momentum component cancel and that
    component is $Delta W_i$. Hence $P \( q_0 \, p_0 \) = z$.
  Scaled Sobolev embedding gives $\| z \( y \) \| lt.eq C_s chevron.l y chevron.r^(- 4) parallel z
    parallel_(Y^s)$. Splitting the Newton integral into a neighborhood of the origin, a neighborhood of $y$,
    and their complement yields
  $ \| u \( y \) \| + \| W \( y \) \| lt.eq C_s chevron.l y chevron.r^(- 1) parallel z parallel_(Y^s) . $
  For completeness, on $\| v \| < \| y \| \/ 2$ the Newton kernel is $O \( \| y \|^(- 1) \)$ and the source has
    bounded total integral; on $\| v - y \| < \| y \| \/ 2$, its integral against the source is
    $O \( \| y \|^(- 2) \)$; the remaining region has the same or a smaller bound.
    Local estimates on a fixed ball handle bounded $y$. On an annulus of radius $L$,
    the rescaled right-hand side of the potential equation has $H^s$ norm
    $O \( L^(- 2) parallel z parallel_(Y^s) \)$. Interior elliptic estimates on a finite cover by slightly larger
    rescaled balls therefore give
  $ parallel u \( L thin dot.op \) parallel_(H^(s + 2)) + parallel W \( L thin dot.op \) parallel_(H^(s + 2))
    lt.eq C_s L^(- 1) parallel z parallel_(Y^s) . $
  One physical derivative of $W$ introduces an additional factor $L^(- 1)$. Consequently
  #[#set math.equation(numbering: n => "(13.5)")
   $ parallel \( q_0 \, p_0 \) parallel_(X^s) lt.eq C_s parallel z parallel_(Y^s) . $ <pk:constraint-Newton-bound>]
  Choose a smooth radial $chi$ which is zero on $\| y \| lt.eq 1.2$ and one on $\| y \| gt.eq 1.8$. With
  $ G = P #scale(x: 120%, y: 120%)[\(] \( chi - 1 \) \( q_0 \, p_0 \) #scale(x: 120%, y: 120%)[\)] $
  we have $P \( chi \( q_0 \, p_0 \) \) = z + G$. The pair $\( chi - 1 \) \( q_0 \, p_0 \)$ defining $G$ is
    compactly supported. Integration by parts against affine functions and Euclidean Killing fields gives
  #[#set math.equation(numbering: n => "(13.6)")
   $ integral G_(upright("sc")) = 0 \, quad integral y_a G_(upright("sc")) = 0 \, quad
     integral G_(upright("vec") \, a) = 0 \, quad
     integral \( y_a G_(upright("vec") \, b) - y_b G_(upright("vec") \, a) \) = 0 . $ <pk:constraint-moments>]
  Indeed two derivatives annihilate an affine scalar; one derivative annihilates a translation,
    while pairing the divergence of a symmetric tensor with a rotation gives zero.
    If $z$ is supported in ${ \| y \| gt.eq 1 }$, then $G = - z = 0$ in $\| y \| < 1$, and $G =
    0$ in $\| y \| > 1.8$. It is therefore supported in
  $ A = { 1 lt.eq \| y \| lt.eq 2 } . $
  We next give a compactly supported primitive for every pair on $A$ satisfying (13.6).
  #emph[A divergence primitive on the annulus.] We use a capwise version of Bogovskii’s divergence primitive
    #cite(label("Bogovskii1980")), whose support and regularity properties are treated by Costabel–McIntosh
    #cite(label("CostabelMcIntosh2010")). The finite mass transfers below adapt the construction to the annulus.
    Fix a unit-mass bump $zeta_0$ supported strictly inside $A$.
    There is a linear operator $cal(D)$, bounded from $H^m$ to $H^(m + 1)$ on inputs localized to a fixed compact
    set for each integer $m gt.eq 0$, such that, for every scalar $e$ supported in $A$,
  #[#set math.equation(numbering: n => "(13.7)")
   $ partial_i \( cal(D) e \)_i = e - zeta_0 integral e \, wide "supp" cal(D) e subset A . $ <pk:constraint-divergence>]
  Here is the construction and the derivative estimate.
  Cover $A$ by sufficiently narrow angular caps and take smooth compactly supported cutoffs $psi_a$ whose sum is
    one on $A$. They can be chosen so that their sum is a fixed cutoff $eta$ equal to one on $A$,
    with support in $1 \/ 2 < \| y \| < 3$. For each cap choose a unit-mass bump $zeta_a$ near radius $3 \/
    2$ in its central direction. Make the cap and bump small enough that
  $ b dot.op hat(v) > 1 \, wide \| b \| < 2 $
  whenever $v in A ∩ "supp" psi_a$ and $b in "supp" zeta_a$.
    Every point on the segment from $v$ to $b$ then has projection at least one on $hat(v)$,
    and lies in the radius-two ball by convexity. The whole segment is thus contained in $A$.
  For a smooth compactly supported scalar $e$, define
  #[#set math.equation(numbering: n => "(13.8)")
   $ \( cal(D)_zeta e \) \( x \) = integral e \( v \) \( x - v \) integral_1^oo zeta #scale(x: 120%, y: 120%)[\(]
     v + t \( x - v \) #scale(x: 120%, y: 120%)[\)] t^2 thin thin upright(d) t thin thin upright(d) v .
     $ <pk:constraint-Bogovskii>]
  Its support is contained in the union of the segments joining $"supp" e$ to $"supp" zeta$:
    if the integrand is nonzero, then $x = \( 1 - t^(- 1) \) v + t^(- 1) b$ for some $b in "supp" zeta$.
    Testing against a gradient and changing variables $b = v + t \( x - v \)$ gives
  $ integral cal(D)_zeta e dot.op nabla phi = integral e \( v \) integral zeta \( b \)
    #scale(x: 120%, y: 120%)[\(] phi \( b \) - phi \( v \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) b
    thin thin upright(d) v . $
  In this calculation, the substitution $tau = t^(- 1)$ reduces the inner integral to the integral of the
    derivative of $phi \( v + tau \( b - v \) \)$ for $0 lt.eq tau lt.eq 1$.
    It follows that $"div" cal(D)_zeta e = e - zeta integral e$.
  The bumps may be chosen as translates of one small bump. Join their centers to that of $zeta_0$ along paths at
    radius $3 \/ 2$, and choose the common bump small enough that every translated support remains inside the open
    annulus. If $gamma_a$ is such a path from the center of $zeta_a$ to the center of $zeta_0$, then
  $ V_a \( x \) = integral_0^1 gamma'_a \( tau \) zeta_(upright("base")) \( x - gamma_a \( tau \) \) thin thin
    upright(d) tau $
  is smooth, compactly supported in the open annulus, and satisfies $"div" V_a = zeta_a - zeta_0$. Define
  $ cal(D) e = sum_a cal(D)_(zeta_a) \( psi_a e \) + sum_a V_a integral psi_a e . $
  For annulus-supported $e$ this proves (13.7). The same formula defines $cal(D)$ on arbitrary inputs after the
    fixed localization by the $psi_a$. Its values are always supported in a fixed compact set,
    although exactness and annulus support are only needed and asserted on the indicated inputs.
  To prove the one-derivative bound, write $r = \| x - v \|$ and $omega = \( x - v \) \/ r$. The kernel in (13.8) is
  $ omega r^(- 2) integral_r^oo zeta \( v + tau omega \) tau^2 thin thin upright(d) tau =
    omega r^(- 2) a \( v \, omega \) + E \( x \, v \) \, wide a \( v \, omega \) =
    integral_0^oo zeta \( v + tau omega \) tau^2 thin thin upright(d) tau . $
  On fixed compact sets $a$ is smooth, and
  $ E \( x \, v \) = - \( x - v \) integral_0^1 zeta #scale(x: 120%, y: 120%)[\(] v +
    t \( x - v \) #scale(x: 120%, y: 120%)[\)] t^2 thin thin upright(d) t . $
  This remainder is jointly smooth on fixed compact sets, with bounds controlled by smooth seminorms of the bump.
    The leading kernel has degree $- 2$ in $x - v$. Its distributional $x$ derivative is a bounded multiplication
    term plus a principal-value kernel of degree $- 3$, whose angular mean is zero.
    To see the cancellation, integrate the ordinary derivative over a concentric annulus:
    the two boundary fluxes agree by degree $- 2$ homogeneity, so the coefficient of the radial logarithm is zero.
    Expansion of its smooth angular dependence in spherical harmonics writes it as a summable series of mean-zero
    angular convolution kernels acting on the input multiplied by smooth coefficient functions of $v$.
    These coefficient functions have rapidly decreasing bounds in the harmonic degree.
    The classical $L^2$ estimate for a truncated homogeneous mean-zero singular integral,
    with norm controlled by finitely many angular seminorms, therefore bounds the differentiated kernel on $L^2$.
    The undifferentiated weak singularity is integrable, and the portions away from the diagonal are smooth on
    bounded sets. This proves
  $ parallel cal(D) e parallel_(H^1) lt.eq C parallel e parallel_(L^2) $
  for the fixed localization.
  Higher orders follow without loss by simultaneous translations. For the unlocalized formula,
  $ partial_j cal(D)_zeta e = cal(D)_zeta \( partial_j e \) + cal(D)_(partial_j zeta) e . $
  The same kernel estimate applies to derivatives of the bump, without a unit-mass requirement.
    Iterating this identity and differentiating the fixed cutoffs and finite-rank terms gives
  #[#set math.equation(numbering: n => "(13.9)")
   $ parallel cal(D) e parallel_(H^(m + 1)) lt.eq C_m parallel e parallel_(H^m) quad \( m gt.eq 0 \)
     $ <pk:constraint-divergence-bound>]
  for the localized operator. Approximation extends the formula and its support assertions from smooth inputs to
    supported Sobolev inputs.
  #emph[Symmetric divergence and the scalar primitive.] Let $F'$ be supported in $A$,
    with zero translation and rotation moments. Set
  $ T_(i j) = \( cal(D) F'_i \)_j . $
  Then $partial_j T_(i j) = F'_i$, and integration by parts gives
  $ integral \( T_(i j) - T_(j i) \) = integral \( y_i F'_j - y_j F'_i \) = 0 . $
  Define
  #[#set math.equation(numbering: n => "(13.10)")
   $ D_(i j k) = #scale(x: 120%, y: 120%)[\(] cal(D) \( T_(i j) - T_(j i) \) #scale(x: 120%, y: 120%)[\)]_k \,
     wide H_(i j k) = 1 / 2 \( D_(i j k) - D_(j k i) + D_(k i j) \) \, wide S_(i j) = T_(i j) -
     partial_k H_(i j k) . $ <pk:constraint-symmetric-divergence>]
  Since $D_(i j k) = - D_(j i k)$, direct expansion gives
  $ H_(i j k) = - H_(i k j) \, wide H_(i j k) - H_(j i k) = D_(i j k) . $
  Thus $S$ is symmetric, and
  $ partial_j S_(i j) = F'_i - partial_j partial_k H_(i j k) = F'_i . $
  All tensors remain supported in $A$. The two applications of $cal(D)$ and the one derivative in (13.10) show
    that this symmetric divergence primitive maps $H^m$ to $H^(m + 1)$. The inverse trace reversal
  $ p_(i j) = S_(i j) - 1 / 2 delta_(i j) S_(k k) $
  satisfies $p_(i j) - delta_(i j) p_(k k) = S_(i j)$, and is the desired momentum primitive.
  Now let $f'$ be supported in $A$, with zero constant and linear moments. Put $Y = cal(D) f'$. Then
  $ partial_i Y_i = f' \, wide integral Y_a = - integral y_a f' = 0 . $
  Set
  $ M_(a b) = integral \( y_a Y_b - y_b Y_a \) \, wide C_(a b) = - 1 / 2 M_(a b) \, wide hat(Y)_i = Y_i +
    partial_j \( C_(i j) zeta_0 \) . $
  The skew-symmetry of $C$ implies
  $ partial_i hat(Y)_i = f' \, wide integral hat(Y)_i = 0 . $
  Moreover,
  $ integral #scale(x: 120%, y: 120%)[\(] y_a partial_j \( C_(b j) zeta_0 \) -
    y_b partial_j \( C_(a j) zeta_0 \) #scale(x: 120%, y: 120%)[\)] = 2 C_(a b) \, $
  so every rotation moment of $hat(Y)$ vanishes. Apply the symmetric divergence primitive to $hat(Y)$,
    obtaining $S$ with $partial_j S_(i j) = hat(Y)_i$, and put $q_(i j) = S_(i j) - 1 / 2 delta_(i j) S_(k k)$. Then
  $ partial_i partial_j q_(i j) - Delta q_(i i) = partial_i partial_j S_(i j) = f' . $
  This gains two derivatives and preserves support in $A$.
  Together these constructions give an operator $cal(B)$ satisfying
  #[#set math.equation(numbering: n => "(13.11)")
   $ P cal(B) \( f' \, F' \) = \( f' \, F' \) \, wide parallel cal(B) \( f' \, F' \)
     parallel_(H^(s + 2) xor H^(s + 1)) lt.eq C_s parallel \( f' \, F' \) parallel_(H^s xor H^s)
     $ <pk:constraint-compact-primitive>]
  on the supported moment-free pairs, with output supported in $A$.
    They also define a bounded operator on arbitrary compact inputs:
    use the fixed localization in every occurrence of $cal(D)$, and symmetrize the final tensors.
    On moment-free annulus-supported inputs this final symmetrization changes nothing.
    Off that subspace no exactness is asserted or required.
  We may now set
  #[#set math.equation(numbering: n => "(13.12)")
   $ cal(K) z = chi \( q_0 \, p_0 \) - cal(B) G . $ <pk:constraint-K>]
  The estimates already proved give its boundedness on all $Y^s$.
    For exterior-supported inputs, both the support assertion and $P cal(K) z =
    z$ follow from (13.11) and $P \( chi \( q_0 \, p_0 \) \) = z + G$.
  Finally, all the operators have smooth conjugates under the stated group actions.
    For the argument dilation $\( T_lambda e \) \( y \) = e \( lambda y \)$, substitution in (13.8) gives
  #[#set math.equation(numbering: n => "(13.13)")
   $ T_lambda cal(D)_zeta T_lambda^(- 1) = lambda cal(D)_(zeta_lambda) \, wide zeta_lambda \( y \) =
     lambda^3 zeta \( lambda y \) . $ <pk:constraint-conjugation>]
  The transformed cutoffs, path fields, and moment functionals likewise depend smoothly on $lambda$.
    Rotations transform the bumps and cutoffs smoothly and multiply tensor components by rotation matrices.
    The kernel bounds above are controlled by finitely many smooth seminorms on fixed compact sets,
    so Taylor’s formula for these parameter-dependent coefficients proves smoothness in the operator norm with the
    full derivative gain. Newton inversion conjugates by the factor $lambda^2$,
    and its first derivative by the corresponding factor $lambda$; it is equivariant under rotations.
    Composition in (13.12) proves the final assertion. ◻
]

#proof[
  The same fixed point will supply both the base estimate and the all-order regularity.
  ===== 13.3 A contraction at one base order. <a-contraction-at-one-base-order.>
  Use the operator $cal(K)$ from 38. Define
  #[#set math.equation(numbering: n => "(13.14)")
   $ N \( q \, p \) = Phi \( d_B + \( q \, p \) \) - Phi \( d_B \) - P \( q \, p \) . $ <pk:constraint-nonlinearity>]
  For small $beta_s$ and on a sufficiently small $X^s$ ball this is a smooth map to $Y^s$.
    We record the weights and derivatives to justify this assertion.
    Metric perturbations have weight one, their first and second derivatives have weights two and three,
    and second fundamental form perturbations and their first derivatives have weights two and three.
    After subtraction of $P$, the scalar terms are linear combinations,
    with smooth bounded inverse-metric factors, of terms with the budgets
  $ a thin partial^2 a : med 1 + 3 = 4 \, wide \( partial a \)^2 : med 2 + 2 = 4 \, wide b^2 : med 2 + 2 = 4 . $
  The corresponding momentum budgets are
  $ a thin partial b : med 1 + 3 = 4 \, wide \( partial a \) b : med 2 + 2 = 4 . $
  Here $a \, b$ may be background or correction factors, with the background-only terms canceled in (13.14).
    In particular, a coefficient in front of a highest derivative differs from its Euclidean value by a weight-one
    factor. Applying the Sobolev product estimates on the unit ball and on the rescaled annuli, using $s gt.eq 3$,
    yields
  #[#set math.equation(numbering: n => "(13.15)")
   $ parallel N \( v \) - N \( w \) parallel_(Y^s) lt.eq C_s \( beta_s + R \) parallel v - w parallel_(X^s) \,
     wide parallel v parallel_(X^s) \, parallel w parallel_(X^s) lt.eq R . $ <pk:constraint-Lipschitz>]
  The same products after differentiation with respect to $v$ prove smoothness.
    Inverse-metric factors are smooth because the metrics in this ball remain uniformly positive.
    Notice that the assertion concerns $N$; the uncanceled Euclidean leading terms of $P$ have weight three on a
    general element of $X^s$.
  Let $C_(cal(K) \, s)$ be the norm of $cal(K) : Y^s arrow.r X^s$.
    For sufficiently small $beta_s \, eta_s$, the equation
  #[#set math.equation(numbering: n => "(13.16)")
   $ z_c = - phi.alt - N \( cal(K) z_c \) $ <pk:constraint-fixed-point>]
  is a contraction on $parallel z_c parallel_(Y^s) lt.eq 2 eta_s$.
    Indeed take $R = 2 C_(cal(K) \, s) eta_s$ in (13.15) and require $C_s C_(cal(K) \, s) \( beta_s + R \) < 1 \/
    2$. Starting the iteration at zero preserves support in ${ \| y \| gt.eq 1 }$:
    $phi.alt$ has that support, 38 gives it for every correction, and $N \( v \) =
    0$ pointwise wherever $v$ vanishes on an open set. The limit therefore has the same support.
    With $v_c = cal(K) z_c$,
  #[#set math.equation(numbering: n => "(13.17)")
   $ parallel v_c parallel_(X^s) lt.eq 2 C_(cal(K) \, s) eta_s \, wide Phi \( d_B + v_c \) = 0 quad
     upright("on ") \| y \| gt.eq 1 . $ <pk:constraint-correction-bound>]
  The equation holds there because $P v_c = z_c$ and $Phi \( d_B \) = phi.alt$ there. On the inner side $v_c = 0$.
  ===== 13.4 Higher smoothness from rotations and dilations. <higher-smoothness-from-rotations-and-dilations.>
  It remains to establish smoothness at every order, without imposing smallness of all high Sobolev norms.
    We do this at the single base order $s$. Let $U_g$ and $V_g$ be the actions of a rotation and a positive
    argument dilation on tensor pairs and on scalar/covector pairs respectively.
    Rotations act on components as well as arguments; dilations here act on the argument alone.
    These actions are uniformly bounded on $X^s \, Y^s$ for $g$ near the identity. Set
  $ cal(K)_g = U_g cal(K) V_g^(- 1) \, wide phi.alt_g = V_g phi.alt \, wide N_g \( w \) = V_g N \( U_g^(- 1) w \) . $
  The operator family $cal(K)_g$ is norm-smooth by 38. All background coefficients have the assumed smooth symbol
    bounds, and the source is smooth and compactly supported. Thus $g mapsto phi.alt_g$ is smooth in $Y^s$.
    Writing $N_g$ using the weighted products displayed above shows that it is jointly smooth in $g \, w$:
    parameter derivatives fall on the smooth background coefficients or introduce the explicit scale and component
    factors in a transformed derivative. They do not differentiate the unknown $w$ beyond the derivatives already
    allowed in $X^s$.
  Consider the equation on the full space $X^s$,
  #[#set math.equation(numbering: n => "(13.18)")
   $ w + cal(K)_g phi.alt_g + cal(K)_g N_g \( w \) = 0 . $ <pk:constraint-parameter-equation>]
  At $g$ equal to the identity its solution is $v_c$. The derivative in $w$ is $"Id" + cal(K)_g D N_g \( w \)$,
    whose inverse is a convergent Neumann series on a sufficiently small common ball by (13.15).
    The implicit function theorem therefore gives a smooth solution of (13.18) in the group parameters.
  We specify the uniqueness argument because argument dilations move the support boundary.
    First choose a fixed small ball on which the contraction estimates, and their nearby transformed versions,
    hold. Taking the defect sufficiently small puts $v_c$ strictly inside a smaller ball.
    The uniform boundedness of $U_g$ then puts every $U_g v_c$, for $g$ near the identity,
    in the common contraction ball. It satisfies (13.18) by conjugation.
    Uniqueness in that ball identifies it with the smooth implicit-function branch.
    This uses the all-input definition of $cal(K)$, so no fixed support subspace has to be invariant under
    dilation. Nor does it presuppose norm continuity of the group orbit of the unknown solution.
  Distributional differentiation of this smooth orbit shows that all iterated rotations $Omega_(i j) =
    y_i partial_j - y_j partial_i$ and dilations $E = y dot.op nabla$, applied to $v_c$, lie in $X^s$.
    The rotation of tensor components contributes only constant zeroth-order matrices,
    which may be subtracted in identifying these derivatives.
    On every rescaled exterior annulus these fields span the scaled coordinate derivatives.
    More explicitly, with $r = \| y \|$,
  $ r^2 partial_i = y_i E + sum_j y_j Omega_(j i) . $
  Their iterates therefore control every scaled spatial derivative.
    The same identity is nondegenerate on a neighborhood of $\| y \| = 1$.
    It follows that the correction is smooth across its support boundary as well as on the exterior,
    and has symbol bounds of all orders with metric weight one and second fundamental form weight two.
    These higher constants may depend on the higher symbol bounds of $d_B$ and on the smooth source $phi.alt$;
    their smallness is not required. The small base norm also keeps the corrected metric positive definite. ◻
]

===== 13.5 Application to the beam seed. <application-to-the-beam-seed.>

The rescaling, artificial interior extension, and verification of the source hypotheses are carried out in
  Section 9.6, using (9.14)–(9.15). That application retains the complete correction tail and proves approximation
  in any prescribed finite list of the original data seminorms.
  Higher symbol bounds ensure smooth membership of each corrected datum;
  they need not be uniformly small or give convergence at all orders for one fixed frequency exponent.

#bibliography("refs.bib", style: "ieee", title: [References])
