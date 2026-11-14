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

#align(center)[#text(size: 16pt, weight: "bold")[The Penrose inequality for maximal \
asymptotically hyperbolic initial data]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction and statement of the result <sec:hypotheses>

The Penrose inequality relates the mass of an initial-data set to the area needed to enclose a trapped region.
  Penrose’s original argument #cite(label("Penrose1973")) connects such a bound with gravitational collapse and
  the expected behavior of black holes. In the asymptotically flat Riemannian case,
  Huisken and Ilmanen proved the connected-horizon inequality by weak inverse mean curvature flow
  #cite(label("HI2001")), and Bray proved the inequality for the total area of a possibly disconnected horizon
  #cite(label("Bray2001")). Bray and Lee extended the Riemannian result to dimensions below eight
  #cite(label("BrayLee2009")).

For negative cosmological constant the natural comparison metric is Schwarzschild–anti-de Sitter.
  Its horizon of area $4 pi a^2$ has mass $\( a + a^3 \) \/ 2$ when the cosmological constant is $- 3$.
  The additional cubic term is accompanied by a different asymptotic mass:
  the four fluxes at spherical conformal infinity form a Lorentz covector #cite(label("CH2003")).
  For asymptotically hyperbolic graphs, Dahl, Gicquaud, and Sakovich established mass identities and Penrose-type
  bounds #cite(label("DGS2013")); de Lima and Girão proved the sharp bound for a class of balanced graphs whose
  horizons are star-shaped and mean convex in the reference slice #cite(label("deLimaGirao2016")).
  Directly passing to infinity along inverse mean curvature flow has a distinct obstruction in this setting
  #cite(label("Neves2010")).

Here we prove the global maximal asymptotically hyperbolic Penrose inequality in the class specified below.
  Thus the corresponding maximal formulation of the Penrose conjecture is resolved positively,
  with arbitrary compact topology and without an outermostness assumption on the original boundary.
  The area in the statement is the minimum #emph[enclosing] area, not necessarily the area of that boundary.
  The proof does not require a spacetime development or an additional null-expansion condition.
  We make no assertion about nonmaximal initial data or equality rigidity.

=== 1.1 Geometry, decay, and mass <geometry-decay-and-mass>

Let $\( Omega \, g \)$ be a smooth connected orientable three-manifold with nonempty compact smooth boundary $S$.
  The metric space obtained by including $S$ is complete. There is one end,
  with coordinates $\( r \, omega \) in \( r_0 \, oo \) times bb(S)^2$ outside a compact region. Write

#[#set math.equation(numbering: n => "(1.1)")
 $ b = frac(#h(-0.16667em) upright(d) r^2, 1 + r^2) + r^2 sigma \, wide eta = "arsinh" r \, wide V_0 =
   sqrt(1 + r^2) \, wide V_i = r omega_i quad \( 1 lt.eq i lt.eq 3 \) \, $ <eq:background>]

where $sigma$ is the unit round metric and $omega_i$ are the coordinate functions of the unit sphere.
  The Laplacian is $Delta = "div" nabla$; mean curvature is the sum of the principal curvatures.

Fix $0 < alpha < 1$ and $3 \/ 2 < tau < 3$. On the end, a tensor belongs to $C_tau^(k \, alpha)$ if its
  $b$-covariant derivatives through order $k$ are $O \( e^(- tau eta) \)$,
  and its order-$k$ local Hölder seminorms on uniform $b$-unit coordinate balls have the same weight.
  Equivalently, the $C^(k \, alpha)$ norms of its components in uniform background charts,
  multiplied by $e^(tau eta)$ at the chart centers, are bounded. This convention is a tensor-norm convention.
  It does not mean Euclidean coordinate-component decay. On compact subsets, including the finite boundary,
  all fields below are smooth.

Let $K$ be a smooth symmetric covariant two-tensor on $Omega$, smooth up to $S$, and assume

#[#set math.equation(numbering: n => "(1.2)")
 $ g - b in C_tau^(2 \, alpha) \, wide K in C_tau^(1 \, alpha) . $ <eq:decay>]

For $e = g - b$, define the mass fluxes in the chosen chart by

#[#set math.equation(numbering: n => "(1.3)")
 $ p_mu \( g \) & = frac(1, 16 pi) lim_(R arrow.r oo) integral_({ r = R }) bb(U) \( V_mu \, e \) \( nu_b \)
   #h(-0.16667em) upright(d) A_b \, &  & 0 lt.eq mu lt.eq 3 \,\
bb(U) \( V \, e \) & = V \( "div"_b e - #h(-0.16667em) upright(d) "tr"_b e \) + \( "tr"_b e \) #h(-0.16667em)
  upright(d) V - e \( nabla_b V \, dot.op \) . $ <eq:ah-mass>]

Here $\( "div"_b e \)_i = nabla_b^j e_(j i)$, and $nu_b$ points toward increasing $r$.
  Every operator and measure in this definition uses $b$. We require the four limits to exist and be finite.
  When the covector is future timelike, its invariant mass is

#[#set math.equation(numbering: n => "(1.4)")
 $ m_(upright("AH")) \( g \) = sqrt(p_0 \( g \)^2 - p_1 \( g \)^2 - p_2 \( g \)^2 - p_3 \( g \)^2) \, wide
   p_0 \( g \) > sqrt(p_1 \( g \)^2 + p_2 \( g \)^2 + p_3 \( g \)^2) . $ <eq:invariant-mass>]

The spatial entries in this covector are metric mass charges; they are not ADM momentum or angular momentum.

=== 1.2 Constraints, boundary, and enclosing area <constraints-boundary-and-enclosing-area>

We use units $G = c = 1$ and cosmological constant $Lambda = - 3$.
  Maximality and the noncosmological constraint densities are

#[#set math.equation(numbering: n => "(1.5)")
 $ "tr"_g K = 0 \, wide 16 pi mu = R_g + 6 - \| K \|_g^2 \, wide 8 pi J_i = nabla_g^j K_(i j) . $ <eq:constraints>]

Assume the dominant energy condition and weighted integrability

#[#set math.equation(numbering: n => "(1.6)")
 $ mu gt.eq \| J \|_g \, wide integral_(upright("end")) V_0 #scale(x: 120%, y: 120%)[\(] mu + \| J \|_g + \|
   K \|_g^2 #scale(x: 120%, y: 120%)[\)] #h(-0.16667em) upright(d) V_g < oo . $ <eq:dec-integrability>]

In particular $R_g + 6 gt.eq 0$ and its $V_0$-weighted integral is finite.

On each component of $S$, choose the unit normal $nu$ pointing into $Omega$, toward the designated exterior. Set

#[#set math.equation(numbering: n => "(1.7)")
 $ H = "div"_S nu \, wide "tr"_S K = \( g^(i j) - nu^i nu^j \) K_(i j) \, wide theta_(+) = H +
   "tr"_S K . $ <eq:future-trapping>]

We assume only $theta_(+) lt.eq 0$ on every component, with this same future orientation.
  For comparison with a spacetime convention, the sign is $K \( X \, Y \) =
  overline(g) \( overline(nabla)_X n_(upright("future")) \, Y \)$. There is no assumption on the inward null expansion.

#prodef([Definition 1.1.])[
  (Minimum enclosing area).  An admissible end-side domain is a connected smooth codimension-zero
    submanifold-with-boundary $D subset Omega$, closed as a subset of $Omega$, such that
  $ "int" D subset "int" Omega quad upright("and") quad { r > R } subset D quad upright("for some ") R . $
  Its entire intrinsic manifold boundary $partial D$ must be compact, smooth, embedded, and two-sided,
    with any portions coinciding with $S$ included. Define
  #[#set math.equation(numbering: n => "(1.8)")
   $ A_min \( S \; g \) = inf_D "Area"_g \( partial D \) . $ <eq:minimum-area>]
  In particular $D = Omega$ is admissible and contributes $partial D = S$.
    An empty relative frontier is not an admissible replacement for this intrinsic boundary.
] <def:minimum-area>

Neither the number nor the genus of the boundary components is restricted.
  No trapping condition is imposed on the competitors in Definition 1.

#thm([Theorem 1.2.])[
  (Global maximal AH Penrose inequality).  #emph[Under (1.2)–(1.7), the completeness, one-end,
    and smoothness assumptions above, and the future-timelike condition (1.4), one has
#[#set math.equation(numbering: n => "(1.9)")
 $ m_(upright("AH")) \( g \) gt.eq 1 / 2 #scale(x: 120%, y: 120%)[\(] r_A + r_A^3 #scale(x: 120%, y: 120%)[\)] \,
   wide r_A = sqrt(frac(A_min \( S \; g \), 4 pi)) . $ <eq:main-inequality>]

 The coefficient is sharp: equality holds for every positive-mass time-symmetric Schwarzschild–anti-de Sitter
   exterior bounded by its minimal horizon.]
] <thm:main>

The proof establishes a time-component statement for Riemannian data which is useful independently and which does
  not require a causal condition on their mass covector.

#thm([Theorem 1.3.])[
  (Time-symmetric time-component inequality).  #emph[Let $\( Omega \, g \)$ have the smoothness, topology,
    completeness, and end structure above. Suppose $g - b in C_tau^(2 \, alpha)$, $3 \/ 2 < tau < 3$,
    the four fluxes (1.3) are finite, and
$ R_g gt.eq - 6 \, wide H_g \( S \) lt.eq 0 \, wide integral_(upright("end")) V_0 \( R_g + 6 \) #h(-0.16667em)
  upright(d) V_g < oo . $

 In every such fixed end chart,
#[#set math.equation(numbering: n => "(1.10)")
 $ p_0 \( g \) gt.eq 1 / 2 \( a + a^3 \) \, wide a = sqrt(A_min \( S \; g \) \/ \( 4 pi \)) . $ <eq:ts-inequality>]

]
] <thm:ts>

=== 1.3 Structure and new ingredients <structure-and-new-ingredients>

The first deformation solves a finite-height graph problem together with a positive lapse and a conformal factor.
  It changes maximal data into Riemannian AH data with scalar curvature at least $-
  6$ and a free minimal boundary. Its mass cost tends to zero.
  The conformal factor can contract area, so pointwise comparison alone is insufficient.
  A volume penalty and a finite-time weak-flow argument recover the enclosing-area comparison.
  A continuous choice of inner flux, based on all possible perimeter-minimizer contact sets,
  removes contact with the original weakly trapped boundary.

For Theorem 3, a nonlinear electrostatic potential produces a divergence-free stress.
  Its algebraic constraint encodes the cubic term $a^3 \/ 2$ in the mass budget of an AF attachment.
  A second graph construction on a compact interior joined to that attachment yields an AF comparison exterior to
  which the ordinary Riemannian Penrose inequality applies.
  We prove the coupled transmission estimates and continuation needed for this construction.
  Where a trace cutoff can spoil the scalar-curvature sign,
  blowup gives uniformly controlled metric neighborhoods; additional obstacles then put these regions strictly
  inside a free minimizing enclosure.

The area comparison uses weak inverse mean curvature flow only over a fixed interval of relative areas.
  Its curvature estimate depends on a scalar lower bound and fixed topology, and accommodates disconnected leaves.
  It therefore has a role different from taking an asymptotic limit of hyperbolic Hawking mass.

The numerical argument can be seen before entering these constructions.
  In the positive-area time-symmetric case, fix a metric after the preliminary approximation and write
  $A_min \( S \; g \) = 4 pi a^2$. Let $E_0$ denote the comparison enclosure of the auxiliary caps alone and $E$
  the enclosure that also contains the regions where scalar curvature may be negative.
  Given small positive tolerances $epsilon_m \, epsilon_A$, the attachment and comparison constructions,
  followed by area transfer, give

$ m_o & lt.eq p_0 \( g \) - a^3 \/ 2 + epsilon_m \, & m_(upright("AF")) \( h' \) & lt.eq m_o + epsilon_m \,\
"Area"_(h') \( partial E \) & gt.eq "Area"_(h') \( partial E_0 \) gt.eq \( 1 - epsilon_A \) 4 pi a^2 . $

(Propositions 30, 38, and 19). The AF Penrose inequality applies to the exterior of $E$ and yields

$ p_0 \( g \) gt.eq a^3 / 2 + a / 2 sqrt(1 - epsilon_A) - 2 epsilon_m . $

Thus the attachment supplies the cubic term and the AF inequality the linear term.
  The errors tend to zero through successive finite choices; no convergence of the comparison metrics is required.
  Theorem 20 then transfers the time-symmetric bound to maximal data.
  The original mass covector is put in a rest chart before any deformation, so its time component is the invariant mass.

Sections 3 and 4 develop the shared identities and area comparison. Section 5 reduces Theorem 2 to Theorem 3.
  Sections 6–9 construct the AF comparison for the latter. Section 10 assembles the inequalities and checks sharpness.

== 2 Preliminaries <sec:preliminaries>

=== 2.1 Compact cores and auxiliary caps <compact-cores-and-auxiliary-caps>

#thm([Lemma 2.1.])[
  #emph[The sufficiently large coordinate spheres bound connected compact truncations of $Omega$.
    Each component of $S$ can be capped on its other side to produce a smooth complete connected one-ended
    manifold $X$ without boundary, with the orientation extending that of $Omega$.
    Let $O$ denote the compact cap set, including its boundary.
    For competitors containing $O$, perimeter depends only on the metric on $Omega$ and its boundary trace.]
] <lem:compact-core>

#proof[
  The end metric is uniformly comparable to $b$ sufficiently far out. Radial infinity escapes compact subsets:
    otherwise a sequence tending to radial infinity would accumulate in a compact coordinate neighborhood,
    while pairwise disjoint background balls of a fixed small radius about a subsequence would have uniformly
    positive metric volumes and lie in a fixed compact neighborhood. This is impossible.
    A large coordinate sphere separates the product end from an inner side.
    If the latter were noncompact, a smooth compact exhaustion would yield an end separated from the given product
    end. One may choose this exhaustion with finitely many complement components at each stage,
    since its smooth compact frontier has finitely many components.
    Nested extraction then contradicts the one-end assumption. The inner side is therefore compact.
    Paths between its points can be pushed back across the product end, so the truncations can be taken connected.
  Every component of $S$ is a closed orientable surface and bounds a handlebody.
    Orient each handlebody and glue by a map reversing the induced boundary orientations.
    The collars then extend the orientation of $Omega$ across each seam. Extend the metric smoothly across $S$.
    The added region is compact; completeness at infinity is unchanged.
    For a set containing $O$ up to a null set, its characteristic function is constant almost everywhere in the
    cap interiors. Its perimeter therefore uses no metric values there. ◻
]

We use the ordinary perimeter of a finite-perimeter set in the capped manifold.
  In particular it is not a relative perimeter that discards the original boundary.

#thm([Lemma 2.2.])[
  #emph[Every admissible cut from Definition 1 determines a precompact finite-perimeter enclosure of $O$ whose
    perimeter is at most the area of that cut. Conversely, a precompact enclosure of $O$ with smooth free boundary
    in $"int" Omega$ and connected exterior gives an admissible cut with the same area.
    If this enclosure is outward minimizing, its boundary realizes the minimum enclosing area of its own closed
    exterior.]
] <lem:cut-enclosure>

#proof[
  For an admissible $D$, complement its manifold interior in $X$.
    The result contains $O$ and is precompact because $D$ contains the whole sufficiently distant end.
    Local boundary coordinates show that its perimeter is bounded by the entire intrinsic area of $partial D$,
    including any portions on $S$. This also follows by smoothing corners and passing to the perimeter lower
    limit. For the converse, take the closed exterior of the smooth enclosure.
    It is connected, has the required end, and has precisely the stated intrinsic boundary.
    Any admissible cut of this new exterior, complemented in $X$, encloses the original enclosure;
    outward minimization gives the final claim. ◻
]

The compactness, lower semicontinuity, coarea, slicing, reduced-boundary structure,
  and union/intersection inequalities for finite-perimeter sets will be used below.
  These are local facts and hold in smooth Riemannian coordinate charts;
  see #cite(label("Maggi2012"), form: "prose") Chapters 12–18.
  They also give compactness and lower semicontinuity for a uniformly convergent family of uniformly positive
  continuous metrics on a fixed compact set, by comparison with smooth metrics.
  A free locally perimeter-minimizing boundary is smooth in ambient dimension three;
  one may use the smooth-ambient regularity theorem in #cite(label("Simon2014"), form: "prose") Chapter 7,
  Section 5, Theorem 5.8, followed by elliptic bootstrapping.
  We invoke this regularity only after excluding contact with every obstacle and outer truncation.

=== 2.2 Mass covariance and small metric changes <mass-covariance-and-small-metric-changes>

#thm([Proposition 2.3.])[
  #emph[Suppose $g - b in C_tau^(2 \, alpha)$, $tau > 3 \/ 2$, and $integral V_0 \| R_g +
    6 \| #h(-0.16667em) upright(d) V_g < oo$ on the end. The fluxes (1.3) transform as a Lorentz covector under
    hyperbolic isometries of the asymptotic chart. Such chart changes preserve the weighted decay and
    integrability hypotheses used here. Consequently a future-timelike original covector admits a chart with
    $p_0 = m_(upright("AH"))$ and $p_1 = p_2 = p_3 = 0$.]
] <prop:mass-covariance>

#proof[
  The potentials in (1.1) are the ambient coordinate functions of the future unit hyperboloid.
    Hyperbolic isometries act on their span by Lorentz transformations.
    The flux integrand is tensorial in $b$, linear in $V$, and natural under these isometries.
    It remains to justify replacing the transformed integration surfaces by the original large coordinate spheres.
    The static identity $nabla_b^2 V = V b$ gives
  $ "div"_b bb(U) \( V \, e \) = V thin D R_b \( e \) . $
  The difference between $D R_b \( e \)$ and $R_g + 6$ is bounded by a constant times
  $ \| e \|_b^2 + \| nabla_b e \|_b^2 + \| e \|_b \| nabla_b^2 e \|_b . $
  Its $V_0$-weighted integral over $r > D$ is $O \( D^(3 - 2 tau) \)$,
    since $#h(-0.16667em) upright(d) V_b$ is comparable to $r #h(-0.16667em) upright(d) r #h(-0.16667em)
    upright(d) A_sigma$. Also $\| V_i \| lt.eq V_0$. Thus the divergence is absolutely integrable on the end for
    each potential. The divergence theorem on regions between the two families of spheres makes their flux
    difference tend to zero. This is the covariance mechanism of #cite(label("CH2003"), form: "prose") Proposition
    2.2, Theorem 2.3, and Section 3 in the normalization (1.3).
  A fixed hyperbolic isometry changes distance from the chosen origin by a bounded amount.
    The exponential weights and $V_0$ are therefore comparable before and after the change,
    and uniform background balls are carried to uniform background balls.
    The rest-chart assertion is the elementary Lorentz normal form of a future-timelike covector. ◻
]

The boundary sign and the enclosing-area definition are intrinsic.
  We will apply Proposition 6 to the original data before constructing any comparison metric.
  No assertion that intermediate covectors remain timelike is required.

If $\( 1 - epsilon \) g lt.eq tilde(g) lt.eq \( 1 + epsilon \) g$ as quadratic forms,
  then for every two-surface its area changes by factors between $1 - epsilon$ and $1 + epsilon$.
  Taking infima over the same admissible domains gives the same comparison for $A_min$.
  This observation will be used when passing through the preliminary conformal approximation and the later corner
  smoothing.

=== 2.3 The AF comparison theorem <the-af-comparison-theorem>

For an AF metric $h$ in a Euclidean end chart $y$, our normalization is

#[#set math.equation(numbering: n => "(2.1)")
 $ m_(upright("AF")) \( h \) = frac(1, 16 pi) lim_(R arrow.r oo)
   integral_(\| y \| = R) \( partial_j h_(i j) - partial_i h_(j j) \) n^i #h(-0.16667em) upright(d)
   A_(upright("Eucl")) . $ <eq:adm-mass>]

#thm([Theorem 2.4.])[
  (AF Riemannian Penrose inequality).  #emph[Let $\( Y \, h \)$ be a complete connected one-ended
    three-dimensional AF manifold with smooth compact outer-minimizing minimal boundary.
    Assume $R_h gt.eq 0$, $h - delta = O_2 \( \| y \|^(- beta) \)$ for some $beta > 1 \/ 2$, and $R_h =
    O \( \| y \|^(- q) \)$ for some $q > 3$. If the total boundary area is $A$, then
#[#set math.equation(numbering: n => "(2.2)")
 $ m_(upright("AF")) \( h \) gt.eq sqrt(A \/ \( 16 pi \)) . $ <eq:af-penrose>]

 Disconnected boundary is allowed.]
] <thm:af-penrose>

This is the dimension-three case of the published #cite(label("BrayLee2009"), form: "prose") Theorem 1.4;
  its asymptotic definition is on page 82 and its boundary convention on page 83. Only the inequality is used.
  The smoothness, scalar sign, and outer-minimization required here will be established for the AF comparison
  exterior, rather than assumed for either original AH metric.

=== 2.4 Local scalar elliptic estimates <local-scalar-elliptic-estimates>

We specify the standard local analytic inputs, separating them from the coupled transmission estimates proved in
  Section 8.

#thm([Proposition 2.5.])[
  (Scalar local estimates).  #emph[On fixed coordinate balls in dimension three the following estimates hold,
    with constants depending on the indicated ellipticity, coefficient, and geometry bounds.]
  + #emph[Bounded measurable uniformly elliptic divergence matrices admit local subsolution bounds,
    weak Harnack estimates for nonnegative supersolutions, and inhomogeneous Harnack and Hölder estimates for
    nonnegative solutions. Bounded divergence drifts multiplying the unknown, vector forcing in $L^q$, $q > 3$,
    and scalar forcing in $L^p$, $p > 3 \/ 2$, are permitted in the corresponding estimates.]
  + #emph[For Laplace equations with uniformly positive Lipschitz metric coefficients in interior or flattened
    smooth boundary charts, divergence forcing in $L^q$ gives local $W^(1 \, q)$ estimates.
    Scalar forcing in $L^2$ can be included for $3 < q < 6$. The same statements hold with local zero Dirichlet
    data or natural Neumann data, with the divergence forcing included in the conormal current.
    A boundary datum in $L^(p_1)$, $p_1 > 2$, permits a choice $3 < q < 3 p_1 \/ 2$ sufficiently close to $3$.]
  + #emph[Smooth-coefficient scalar Dirichlet and conormal problems have the usual Schauder estimates,
    including divergence-form $C^(1 \, gamma)$ estimates when the uniformly elliptic coefficients and vector
    forcing are $C^gamma$, with boundary data of the corresponding regularity.
    These estimates are used only after their coefficient hypotheses have been obtained.]
  + #emph[For a bounded measurable symmetric uniformly elliptic matrix $a$ on a ball,
    its positive Dirichlet Green kernel is bounded above by $C \| z - z' \|^(- 1)$, and below by $c \| z -
    z' \|^(- 1)$ when the pole and the nearby evaluation point lie in a fixed smaller ball.]
] <prop:elliptic-inputs>

The local boundedness, Harnack, and Hölder estimates are the scalar divergence theory of
  #cite(label("Serrin1964"), form: "prose") and #cite(label("GT2001"), form: "prose") Chapter 8.
  The Laplace divergence estimates are the local Calderón–Zygmund estimates, with smooth-boundary localization;
  see #cite(label("Stein1970"), form: "prose") #cite(label("GT2001"), form: "prose").
  For natural Neumann data, an explicit estimate is given by #cite(label("ChoiKim2013"), form: "prose") Appendix,
  proof of Lemma 6.1, (6.2), p. 19 of arXiv v3 on bounded $C^1$ localizations.
  Our Lipschitz metric coefficients are VMO. A cutoff retains the full conormal current and the larger-patch
  $W^(1 \, 2)$ norm. In dimension three the scalar and boundary forcing exponents are $3 q \/ \( q + 3 \)$ and $2
  q \/ 3$, respectively, so approximation permits $3 < q < min { 6 \, 3 p_1 \/ 2 }$ for the data in part (ii).
  For the boundary exponent in part (ii), the trace embedding of $W^(1 \, q')$ into $L^(2 q \/ \( 2 q - 3 \))$ on
  a two-dimensional face allows pairing with $L^(p_1)$ whenever $q < 3 p_1 \/ 2$.
  Scalar $L^2$ forcing belongs locally to $W^(- 1 \, q)$ when $q < 6$.
  Part (iv) is the local Green comparison of #cite(label("LSW1963"), form: "prose") Theorem 7.1 and the discussion
  on pp. 66–67.

Natural homogeneous flux permits even reflection in a flattened boundary chart, with the full current reflected.
  Smooth prescribed flux errors can be placed in a bounded smooth vector field.
  Fermi-coordinate metric matrices reflected at a smooth face are Lipschitz.
  Constant Dirichlet data for a scalar height permit odd reflection after subtraction of that constant.
  We spell out each reflection where it is needed; none of these scalar statements is a general nonlinear
  transmission theorem.

For the electrostatic equation we also use an exact degenerate gradient regularity statement. Suppose

$ A \( z \, 0 \) = 0 \, wide lambda \| xi \| I lt.eq A_xi \( z \, xi \) lt.eq C \| xi \| I \,
  wide \| A \( z \, xi \) - A \( z' \, xi \) \| lt.eq C \| z - z' \| thin \| xi \|^2 \, $

with symmetric $A_xi$, continuous dependence, and smooth dependence on $xi eq.not 0$.
  Then a bounded weak $W^(1 \, 3)$ solution of $partial_i A^i \( z \, #h(-0.16667em) upright(d) u \) =
  0$ is locally $C^(1 \, gamma)$ for some $gamma > 0$, with uniform estimates from the structural constants and a
  local energy bound. Indeed $A_xi \( z \, 0 \) = 0$ extends continuously,
  and integration along a radial segment gives $\| A \( z \, xi \) \| lt.eq C \| xi \|^2$.
  The assumptions of #cite(label("AraujoZhang2020"), form: "prose") Theorem 1.1,
  (1.5)–(1.8) therefore hold with $n = p = 3$, zero forcing in $L^oo$, and spatial Hölder exponent $sigma =
  1 \/ 2$. We use only an exponent $0 < gamma < min { alpha_m \, 1 \/ 4 }$,
  where $alpha_m > 0$ is a constant-coefficient gradient exponent for the same structural constants.
  No optimal exponent or endpoint estimate is required. If these inequalities initially hold only on a known
  bounded gradient range, the constitutive law must first be extended with the same structure;
  that extension is constructed in Section 6.

All global invertibility, weighted end estimates, seam regularity, continuation,
  and uniform large-parameter conclusions used later are proved below.
  The local estimates in this subsection supply only their explicitly stated scalar ingredients.

== 3 Static graph identities and differential estimates <sec:graph-calculus>

This Section proves the differential identities used in both constructions.
  They are identities on a Riemannian base; no spacetime satisfying field equations is assumed.
  In particular, the reference tensor in this Section may be either the given maximal tensor or the synthetic
  tensor constructed later.

The curvature, current, and boundary identities give the scalar, mass,
  and boundary inequalities in both deformations. The maximum estimate controls finite slopes without
  differentiating the trace cutoff; the energy and Newton-current estimates supply the seam-continuity argument in
  Section 8.

Let $\( U \, g \)$ be a smooth three-dimensional Riemannian manifold.
  Unless a metric is displayed, covariant derivatives, norms, contractions, volume forms,
  and divergences in this Section use $g$. For a symmetric covariant tensor $C$,
  the notation $C p$ means the vector obtained by contracting with $p$ and raising the remaining index with $g$.
  For a positive smooth function $N$ and a smooth function $f$, define $s > 0$ and $p$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ p = s^2 nabla f \, wide s^2 + \| #h(-0.16667em) upright(d) f \|^2 s^4 = N^2 \, wide v = p / N \, wide W = N /
   s \, wide macron(g) = g + s^2 #h(-0.16667em) upright(d) f ⊗ #h(-0.16667em) upright(d) f .
   $ <eq:calculus-constitutive>]

The positive root is unique, and it depends smoothly on $\( N \, #h(-0.16667em) upright(d) f \)$,
  including at $#h(-0.16667em) upright(d) f = 0$, because

#[#set math.equation(numbering: n => "(3.2)")
 $ s^2 = frac(2 N^2, 1 + sqrt(1 + 4 N^2 \| #h(-0.16667em) upright(d) f \|^2)) . $ <eq:calculus-positive-root>]

We use $d = s \/ N = sqrt(1 - \| v \|^2)$ for a scalar in $\( 0 \, 1 \]$;
  differentials are written $#h(-0.16667em) upright(d)$. Direct rank-one inversion and the determinant formula give

#[#set math.equation(numbering: n => "(3.3)")
 $ macron(g)^(- 1) = g^(- 1) - v ⊗ v \, wide #h(-0.16667em) upright(d) V_(macron(g)) =
   W thin #h(-0.16667em) upright(d) V_g . $ <eq:calculus-volume-inverse>]

For a further positive function $w$ put

#[#set math.equation(numbering: n => "(3.4)")
 $ x = s w \, wide h = x macron(g) \, wide A = N s macron(g)^(- 1) \, wide pi = N^(- 1) "sym" nabla p^flat \,
   $ <eq:calculus-conformal-definitions>]

where $"sym"$ is the half-sum. The tensor $pi$ throughout this Section is the graph second fundamental form,
  not the electrostatic stress introduced in Section 6. The elementary identities

#[#set math.equation(numbering: n => "(3.5)")
 $ p dot.op #h(-0.16667em) upright(d) f = W^2 - 1 \, wide A \( #h(-0.16667em) upright(d) f \,
   #h(-0.16667em) upright(d) f \) = W - W^(- 1) lt.eq p dot.op #h(-0.16667em) upright(d) f \, wide 0 < A lt.eq
   N^2 g^(- 1) $ <eq:calculus-energy-algebra>]

will also be used in the penalty estimates.

=== 3.1 Curvature and the conserved current <curvature-and-the-conserved-current>

#thm([Lemma 3.1.])[
  (Static graph curvature).  #emph[Suppose that $"div"_g p = T N$, where $T$ is a smooth scalar function.
    Then $"tr"_g pi = T$ and
#[#set math.equation(numbering: n => "(3.6)")
 $ macron(nabla) log s & = nabla log N - pi \( v \) \,\
R_(macron(g)) & = R_g + T^2 - \| pi \|^2 - 2 \( "div"_g pi - #h(-0.16667em) upright(d) T \) dot.op v .
  $ <eq:calculus-lapse-differential>]

 More generally, let $cal(K)$ be any smooth symmetric covariant tensor, and define
#[#set math.equation(numbering: n => "(3.7)")
 $ kappa = "tr"_g cal(K) \, wide ell = T - kappa \, wide lambda = pi - cal(K) \, wide C = lambda - ell g \,
   $ <eq:calculus-trace-definitions>]

 and
#[#set math.equation(numbering: n => "(3.8)")
 $ cal(D) \( v \) = R_g + kappa^2 - \| cal(K) \|^2 - 2 \( "div"_g cal(K) - #h(-0.16667em) upright(d) kappa \)
   dot.op v . $ <eq:calculus-dominant-expression>]

 Then
#[#set math.equation(numbering: n => "(3.9)")
 $ R_(macron(g)) = cal(D) \( v \) + \| lambda \|^2 - ell^2 - 2 /
   N "div"_g \( C p \) . $ <eq:calculus-completed-curvature>]

]
] <lem:graph-curvature>

#proof[
  The trace assertion follows immediately from the definition of $pi$.
    To prove the first identity without any geometric interpretation, set $a = #h(-0.16667em) upright(d) log s$.
    Since $p^flat = s^2 #h(-0.16667em) upright(d) f$,
  $ nabla_i p_j = N pi_(i j) + a_i p_j - a_j p_i . $
  Differentiating $s^2 = N^2 - \| p \|^2$ and substituting this formula gives
  $ N^2 a_i - \( a dot.op p \) p_i = N nabla_i N - N pi_(i j) p^j . $
  Division by $N^2$ and Equation (3.3) give Equation (3.6), as an equality of vectors.
  For the curvature identity consider, solely for this computation, the Lorentzian metric
  $ tilde(g) = - s^2 #h(-0.16667em) upright(d) t^2 + macron(g) $
  on $bb(R) times U$. The graph $t = f$ has induced metric $g$.
    If $X^(upright("tan")) = X + #h(-0.16667em) upright(d) f \( X \) partial_t$,
    its future unit normal is $n = \( partial_t + p^(upright("tan")) \) \/ N$.
    Thus $partial_t = N n - p^(upright("tan"))$. The tangential part of the Killing equation for $partial_t$ is $N
    tilde(g) \( tilde(nabla)_(X^(upright("tan"))) n \, Y^(upright("tan")) \) = "sym" nabla p^flat \( X \, Y \)$.
    Its second fundamental form, with the sign convention specified after (1.7), is therefore $pi$.
  Write $tilde(G)$ for the Einstein tensor and $n_0 = s^(- 1) partial_t$ for the normal to a static slice.
    The contracted Gauss and Codazzi identities with timelike unit normal and second form
    $tilde(g) \( accent(nabla n, ̃) \, dot.op \)$ read
  $ 2 tilde(G) \( n \, n \) = R_g + T^2 - \| pi \|^2 \, wide
    tilde(G) \( n \, X^(upright("tan")) \) = \( "div"_g pi - #h(-0.16667em) upright(d) T \) \( X \) . $
  The static slices have zero second form. Applying these same contractions to a static slice gives
    $tilde(G) \( n_0 \, n_0 \) = R_(macron(g)) \/ 2$ and $tilde(G) \( n_0 \, X \) = 0$ for spatial $X$.
    The static time component of $n$ is $N \/ s$, whereas that of $partial_t \/ N$ is $s \/ N$. Consequently
  $ 1 / 2 R_(macron(g)) = tilde(G) \( n \, partial_t \/ N \) = tilde(G) \( n \, n \) -
    tilde(G) \( n \, v^(upright("tan")) \) \, $
  which proves Equation (3.6) with the claimed sign of the momentum term.
  For completeness, the completion of the square uses symmetry to give
  $ 1 / N "div"_g \( C p \) = \( "div"_g lambda - #h(-0.16667em) upright(d) ell \) dot.op v + lambda : pi - ell T . $
  Also $2 ell T - ell^2 = T^2 - kappa^2$ and $\| lambda \|^2 - 2 lambda : pi = \| cal(K) \|^2 - \| pi \|^2$.
    Substituting these two equalities in the right side of Equation (3.9) recovers Equation (3.6) term by term. ◻
]

#thm([Lemma 3.2.])[
  (Graph current and conformal curvature).  #emph[Under the hypotheses and notation of Lemma 9, set
#[#set math.equation(numbering: n => "(3.10)")
 $ B = nabla N - \( cal(K) + ell g \) p \, wide "div"_g B = Phi \, wide -
   "div"_g \( A #h(-0.16667em) upright(d) w \) = Psi \, wide Q = B +
   A #h(-0.16667em) upright(d) w . $ <eq:calculus-general-system>]

 Then
#[#set math.equation(numbering: n => "(3.11)")
 $ Q & = N accent(nabla x, ‾) + x C p - \( x - 1 \) B \,\
"div"_g Q & = Phi - Psi \,\
N Delta_(macron(g)) x + x "div"_g \( C p \) & = x Phi - Psi \,\
x R_h & = cal(D) \( v \) + \| lambda \|^2 - ell^2 - frac(2 Phi, N) + frac(2 Psi, N x) + 3 /
  2 \| #h(-0.16667em) upright(d) log x \|_(macron(g))^2 . $ <eq:calculus-general-current>]

 In particular, the following two specializations hold.]
  #emph[#emph[The maximal AH system.] If $"tr"_g K = 0$ and
#[#set math.equation(numbering: n => "(3.12)")
 $ "div"_g p = 0 \, quad B = nabla N - K p \, quad "div"_g B = 3 N + Sigma \, quad -
   "div"_g \( A #h(-0.16667em) upright(d) w \) = 3 N + Sigma x + P \, $ <eq:calculus-ah-system>]

 then, writing $D = R_g + 6 - \| K \|^2 - 2 "div"_g K dot.op v$, one has
#[#set math.equation(numbering: n => "(3.13)")
 $ Q & = N accent(nabla x, ‾) + x \( pi - K \) p - \( x - 1 \) B \,\
"div"_g Q & = - \( x - 1 \) Sigma - P \,\
(Delta_(macron(g)) - 3 + N^(- 1) "div"_g \( \( pi - K \) p \)) x & = - 3 - P \/ N \,\
x^2 \( R_h + 6 \) & = x #scale(x: 120%, y: 120%)[\(] D + \| pi - K \|^2 #scale(x: 120%, y: 120%)[\)] +
  frac(3, 2 x) \| #h(-0.16667em) upright(d) x \|_(macron(g))^2 + 6 \( x - 1 \)^2 +
  frac(2 P, N) . $ <eq:calculus-ah-current>]

 For the constraint densities in (1.5), $D = 16 pi \( mu - J dot.op v \) gt.eq 0$ under the dominant energy condition.]
  #emph[#emph[The compact trace system.] Let $0 lt.eq u_(*) lt.eq 1$ be constant and take $cal(K) = u_(*) K$,
    $kappa = u_(*) "tr"_g K$, $ell = T - kappa$. If
#[#set math.equation(numbering: n => "(3.14)")
 $ "div"_g p & = T N \, & B & = nabla N - \( u_(*) K + ell g \) p \,\
"div"_g B & = Sigma_(+) + Sigma_(-) \, & - "div"_g \( A #h(-0.16667em) upright(d) w \) & = Sigma_(+) x + P \,
  $ <eq:calculus-compact-system>]

 then
#[#set math.equation(numbering: n => "(3.15)")
 $ Q & = N accent(nabla x, ‾) + x \( lambda - ell g \) p - \( x - 1 \) B \,\
"div"_g Q & = - \( x - 1 \) Sigma_(+) - P + Sigma_(-) \,\
x R_h & = cal(D) \( v \) + \| lambda \|^2 - ell^2 - frac(2 Sigma_(-), N) + frac(2 P, N x) + 3 /
  2 \| #h(-0.16667em) upright(d) log x \|_(macron(g))^2 . $ <eq:calculus-compact-current>]

 Here $lambda = pi - u_(*) K$. At $u_(*) = 1$ this is the scalar identity for the synthetic data.
   It also holds on the outer region with $p = T = K = ell = 0$, $Sigma_(-) = 0$, and $cal(D) = R_(g_o)$.]
] <lem:graph-current>

#proof[
  Since $w = x \/ s$, Equation (3.6) gives
  $ A #h(-0.16667em) upright(d) w = N accent(nabla x, ‾) - N x macron(nabla) log s = N accent(nabla x, ‾) -
    x nabla N + x pi p . $
  Adding $B$ proves the first formula for $Q$. Its divergence from the defining equations is $Phi - Psi$.
    To compute the divergence of its other expression, Equation (3.3) gives
  $ "div"_g \( N accent(nabla x, ‾) \) & = N Delta_(macron(g)) x +
    N macron(g)^(- 1) \( #h(-0.16667em) upright(d) log s \, #h(-0.16667em) upright(d) x \)\
 & = N Delta_(macron(g)) x + \( nabla N - pi p \) dot.op #h(-0.16667em) upright(d) x . $
  The derivative-of-$x$ terms in $"div"_g \( x C p + \( 1 - x \) B \)$ are $\( C p - B \) dot.op #h(-0.16667em)
    upright(d) x = \( pi p - nabla N \) dot.op #h(-0.16667em) upright(d) x$. They cancel exactly, leaving
  $ "div"_g Q = N Delta_(macron(g)) x + x "div"_g \( C p \) + \( 1 - x \) Phi . $
  This proves Equation (3.11). In dimension three the conformal change $h = x macron(g)$ has scalar curvature
  $ x R_h = R_(macron(g)) - 2 x^(- 1) Delta_(macron(g)) x + 3 /
    2 x^(- 2) \| #h(-0.16667em) upright(d) x \|_(macron(g))^2 . $
  Substitution of Equations (3.9) and (3.11) cancels the two occurrences of $2 N^(- 1)
    "div"_g \( C p \)$ and proves Equation (3.11). The two stated systems now follow by substituting their values
    of $T \, cal(K) \, Phi \, Psi$. In the AH case, the nondifferential cosmological terms after multiplication by
    $x$ are $6 x^2 - 12 x + 6 = 6 \( x - 1 \)^2$. Finally, $\| v \| <
    1$ and the constraint definitions give the asserted sign of $D$. ◻
]

For later use, the divergence theorem makes these current formulas into exact finite-domain flux budgets.
  Let $S$ be the inner boundary, with normal pointing into the domain, let $S_R$ have the outward normal,
  and suppose $B_n = - b_S$ and $\( A #h(-0.16667em) upright(d) w \)_n = 0$ on $S$.
  The scalar $b_S$ is a boundary datum, unrelated to the hyperbolic reference metric $b$.
  In the compact construction assume also that the two currents have matching normal flux at their common face,
  measured toward the end. Then

#[#set math.equation(numbering: n => "(3.16)")
 $ - integral_(S_R) Q_n thin #h(-0.16667em) upright(d) A =
   cases(delim: "{", integral_S b_S thin #h(-0.16667em) upright(d) A +
   integral_(U_R) #scale(x: 120%, y: 120%)[\[] \( x - 1 \) Sigma +
   P #scale(x: 120%, y: 120%)[\]] thin #h(-0.16667em) upright(d) V \, & upright("for ") upright("(3.12)") \,,
   integral_S b_S thin #h(-0.16667em) upright(d) A + integral_(U_R) #scale(x: 120%, y: 120%)[\[] \( x - 1 \)
   Sigma_(+) + P - Sigma_(-) #scale(x: 120%, y: 120%)[\]] thin #h(-0.16667em) upright(d) V \, & upright("for ")
   upright("(3.14)") .) $ <eq:calculus-flux-budget>]

Indeed, the outward normal at $S$ is $- n$, so its contribution to the outward flux is $integral_S b_S$.
  The two face contributions cancel since the base induced area forms and the directed fluxes agree.
  Conversion of the outer flux into the relevant mass difference requires the end estimates proved in the
  corresponding construction.

=== 3.2 Boundary identities <boundary-identities>

#thm([Lemma 3.3.])[
  (Constant-height boundary).  #emph[Let $cal(S)$ be a smooth two-sided hypersurface on which $f$ is constant.
    Choose a $g$-unit normal $n$, and write $H = "div"_(cal(S)) n$, $hat(z) = v dot.op n$, $y = hat(z)^2$,
    and $k_T = "tr"_(cal(S)) cal(K)$. The same directed normal is used on each side if $cal(S)$ is a gluing face. Then
#[#set math.equation(numbering: n => "(3.17)")
 $ d^2 partial_n log s & = B_n \/ N - k_T hat(z) + y H \,\
s sqrt(x) thin H_h & = N \( H - k_T hat(z) \) + B_n + \( A #h(-0.16667em) upright(d) w \)_n \/ x .
  $ <eq:calculus-boundary-lapse>]

 In particular, in the maximal AH system with $v = - z n$, $k = K \( n \, n \)$, $B_n = - b_S$,
   and $\( A #h(-0.16667em) upright(d) w \)_n = 0$,
#[#set math.equation(numbering: n => "(3.18)")
 $ s sqrt(x) thin H_h = N \( H - z k \) - b_S = N H + partial_n N . $ <eq:calculus-ah-boundary>]

 In the compact system, if $H lt.eq 0$, $k_T < 0$, $hat(z) lt.eq 0$, $B_n = - b_(*) < 0$,
   and $\( A #h(-0.16667em) upright(d) w \)_n = 0$, then $H_h < 0$.]
  #emph[Suppose, at a compact gluing face, that $N_o = s_i$, that $w$ and the normal fluxes of $B \,
    A #h(-0.16667em) upright(d) w$ agree, that $f$ is constant on the inner face, and that $p = 0$ outside.
    The induced $h$-metrics then agree. If the inner base mean curvature satisfies $H_i > \|
    k_T \|$ and the outer one is $H_o = sqrt(H_i^2 - k_T^2)$, then $H_(h \, i) gt.eq H_(h \, o)$,
    both measured toward the end.]
] <lem:graph-boundary>

#proof[
  On $cal(S)$, $p = N hat(z) n$. For tangent vectors $X \, Y$, $nabla^2 f \( X \, Y \) = f_n "II" \( X \, Y \)$;
    consequently $pi \( X \, Y \) = hat(z) "II" \( X \, Y \)$ and $pi \( n \, n \) = T - hat(z) H$.
    Taking the normal component in Equation (3.6) therefore yields
  $ d^2 partial_n log s = partial_n log N - hat(z) T + y H . $
  Since $partial_n N = B_n + N \( cal(K) \( n \, n \) + ell \) hat(z)$ and $cal(K) \( n \, n \) + ell - T = -
    k_T$, this proves Equation (3.17).
  In base normal coordinates, the tangential entries of $macron(g)$ and their first normal derivatives agree with
    those of $g$ at the face: the extra products contain at least one tangential derivative of $f$.
    The mixed entries vanish along the entire face, and the normal length factor is $W$.
    Hence $macron(n) = d n$ and $H_(macron(g)) = d H$. The mean-curvature formula for $h = x macron(g)$ gives
  $ sqrt(x) thin H_h = d \( H + partial_n log x \) . $
  Multiplication by $s = N d$, followed by Equation (3.17), gives
  $ s sqrt(x) thin H_h = N \( H - k_T hat(z) \) + B_n + N d^2 w_n \/ w . $
  The final term equals $\( A #h(-0.16667em) upright(d) w \)_n \/ x$, proving Equation (3.17).
    In the maximal case $k_T = - k$, $hat(z) = - z$, and $partial_n N = - N z k - b_S$;
    this proves Equation (3.18). The asserted strict sign in the compact case follows because $H -
    k_T hat(z) lt.eq 0$ and $B_n < 0$.
  At the gluing face the tangential graph metrics equal their base metrics, which agree, and $x_i = s_i w =
    N_o w = x_o$. The remaining inequality reduces by Equation (3.17) to
  $ N_i \( H_i - k_T hat(z) \) gt.eq s_i sqrt(H_i^2 - k_T^2) . $
  Both sides are nonnegative, and after division by $N_i$ its squared difference is
  $ \( H_i - k_T hat(z) \)^2 - \( 1 - hat(z)^2 \) \( H_i^2 - k_T^2 \) = \( k_T - H_i hat(z) \)^2 gt.eq 0 . $
  This proves the mean-curvature ordering. ◻
]

=== 3.3 A maximum estimate without differentiating the cutoff <a-maximum-estimate-without-differentiating-the-cutoff>

#thm([Lemma 3.4.])[
  (Gradient maximum estimate).  #emph[Let $N > 0 \, f \, cal(K) \, T$ be smooth and satisfy $"div"_g p =
    T N$ and $"div"_g \[ nabla N - \( cal(K) + ell g \) p \] = Phi$, with the definitions above.
    Suppose on the region in question that
#[#set math.equation(numbering: n => "(3.19)")
 $ \| "Ric"_g \| + \| cal(K) \| + \| "div"_g cal(K) - #h(-0.16667em) upright(d) "tr"_g cal(K) \| + \| T \| lt.eq
   C_0 \, wide Phi lt.eq C_0 N + Sigma \, wide Sigma gt.eq 0 . $ <eq:calculus-maximum-hypotheses>]

 At a point where $m = \| #h(-0.16667em) upright(d) f \| > 0$, set
#[#set math.equation(numbering: n => "(3.20)")
 $ l & = log m \, quad u = log N \, quad e = nabla f \/ m \, quad y = \| v \|^2 \,\
q & = frac(1 - y, 1 + y) \, quad beta = 1 + q \, quad cal(P) = g^(- 1) + \( q - 1 \) e ⊗ e \, quad G = -
  log s . $ <eq:calculus-gradient-notation>]

 Let $j$ be twice continuously differentiable with $j'' > 0$, with either sign allowed for $j'$,
   and let $eta$ be a twice continuously differentiable localization function.
   At an interior local maximum of $G + j \( f \) + eta$ with $y gt.eq 1 \/ 2$,
#[#set math.equation(numbering: n => "(3.21)")
 $ j'' q m^2 lt.eq C [1 + Sigma / N + \( 1 - y \)^2 \( j' m \)^2 + \| #h(-0.16667em) upright(d) eta \|^2 + \|
   nabla^2 eta \|] \, $ <eq:calculus-gradient-maximum>]

 where $C$ depends only on $C_0$. In particular, at that point,
#[#set math.equation(numbering: n => "(3.22)")
 $ W^2 lt.eq C / j'' [N^2 + N Sigma + \( j' \)^2 + N^2 #scale(x: 120%, y: 120%)[\(] \| #h(-0.16667em) upright(d)
   eta \|^2 + \| nabla^2 eta \| #scale(x: 120%, y: 120%)[\)]] . $ <eq:calculus-gradient-weighted>]

 No positive lower bound for $N$, no derivative bound for $T$,
   and no second derivative bound for $N$ enter these two estimates.]
  #emph[At a constant-height boundary, with the notation of Lemma 11, the exact normal derivative is
#[#set math.equation(numbering: n => "(3.23)")
 $ d^2 partial_n #scale(x: 120%, y: 120%)[\(] G + j \( f \) + eta #scale(x: 120%, y: 120%)[\)] = - B_n \/ N +
   k_T hat(z) - y H + j' hat(z) \/ N + d^2 partial_n eta . $ <eq:calculus-gradient-boundary>]

 For the maximal AH inner boundary, if $H lt.eq k$, $b_S gt.eq 0$, and $v = - z n$, this implies
#[#set math.equation(numbering: n => "(3.24)")
 $ G_n = - frac(y H + u_n, 1 - y) = frac(b_S \/ N + z k - z^2 H, 1 - z^2) gt.eq
   frac(z k, 1 + z) . $ <eq:calculus-ah-gradient-boundary>]

]
] <lem:gradient-maximum>

#proof[
  Use a $g$-orthonormal frame at the point with first vector $e$ and transverse indices $a \, b in { 2 \, 3 }$.
    Put $U_(a b) = nabla_(a b)^2 f \/ m$ and $C_T = T \/ z$, where $z = sqrt(y)$.
    Differentiation of the constitutive law gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ N m & = frac(z, 1 - y) \, wide q' = frac(#h(-0.16667em) upright(d) q,
     #h(-0.16667em) upright(d) \( l + u \)) = - frac(4 y q, \( 1 + y \)^2) \,\
cal(P) : nabla^2 f & = m C_T - beta nabla f dot.op #h(-0.16667em) upright(d) u \, wide "tr" U = C_T - q l_1 -
  beta u_1 . $ <eq:calculus-height-nondivergence>]
  Here and below $q'$ differentiates the scalar constitutive function, not a spatial coordinate.
    The derivative of the height flux with respect to $#h(-0.16667em) upright(d) f$ is $s^2 cal(P)$;
    its derivative with respect to $N$ is $s^2 \( beta \/ N \) nabla f$.
    This also proves that the nondivergence equation is smooth and elliptic through zero gradient.
  Differentiating the height equation in direction $e$, commuting the third derivatives of a scalar,
    and differentiating its norm gives
  #[#set math.equation(numbering: n => "(3.26)")
   $ cal(P) : nabla^2 l =  & "Ric" \( e \, e \) - beta u_11 - q' \( l_1 + u_1 \)^2 -
     beta #h(-0.16667em) upright(d) l dot.op #h(-0.16667em) upright(d) u + \| U \|^2 + \( 1 - q \) \|
     #h(-0.16667em) upright(d)_perp l \|^2 - q l_1^2\
 & + frac(partial_1 T, z) + C_T #scale(x: 120%, y: 120%)[\[] \( 1 - q \) l_1 -
   q u_1 #scale(x: 120%, y: 120%)[\]] . $ <eq:calculus-log-gradient-equation>]
  Here is an explicit account of the norm and coefficient terms in this calculation.
    In $m^(- 1) cal(P) : nabla^2 m$, the second derivatives of the norm contribute $q \| #h(-0.16667em)
    upright(d)_perp l \|^2 + \| U \|^2$. The contraction $m^(- 1) \( nabla_e cal(P) \) :
    nabla^2 f$ is $q' \( l_1 + u_1 \) l_1 + 2 \( q - 1 \) \| #h(-0.16667em) upright(d)_perp l \|^2$.
    Differentiating $- beta m u_1$ contributes $- beta u_11 -
    beta #h(-0.16667em) upright(d) l dot.op #h(-0.16667em) upright(d) u - q' \( l_1 + u_1 \) u_1$.
    Passing from $m$ to $l$ subtracts $cal(P) \( #h(-0.16667em) upright(d) l \, #h(-0.16667em) upright(d) l \) =
    q l_1^2 + \| #h(-0.16667em) upright(d)_perp l \|^2$. Finally, $m^(- 1) partial_1 \( m T \/ z \) = T_1 \/ z +
    C_T \[ \( 1 - q \) l_1 - q u_1 \]$. These are precisely all terms of Equation (3.26).
  Set $I = \( 1 + y \)^(- 1)$ and $J = y \/ \( 1 + y \)$. Then $G_l = J$, $G_u = - I$,
    and all four second partial derivatives of $G$ as a function of $\( l \, u \)$ equal $- q' \/ 2$.
    Since $- I \( q - 1 \) = J beta$, the Hessian terms in $u$ in $cal(P) : nabla^2 G$ reduce exactly to $-
    I Delta u$. The lapse equation, expanded using the symmetry of $cal(K) + ell g$, is
  #[#set math.equation(numbering: n => "(3.27)")
   $ Delta u = Phi \/ N + \[ "div"_g cal(K) - #h(-0.16667em) upright(d) kappa +
     #h(-0.16667em) upright(d) T \] dot.op v + \( cal(K) + ell g \) :
     pi - \| #h(-0.16667em) upright(d) u \|^2 . $ <eq:calculus-log-lapse>]
  The coefficient of $T_1$ is $J \/ z - I z = 0$. Thus no derivative of $T$ remains.
    More precisely, with $a_y = - q' \/ 2$, the resulting identity is
  #[#set math.equation(numbering: n => "(3.28)")
   $ cal(P) : nabla^2 G =  & J "Ric" \( e \, e \) - I Phi \/ N -
     I \( "div"_g cal(K) - #h(-0.16667em) upright(d) kappa \) dot.op v - I \( cal(K) + ell g \) : pi\
 & + cal(Q) + J C_T \[ \( 1 - q \) l_1 - q u_1 \] \,\
cal(Q) =  & J \| U \|^2 + a_y \| #h(-0.16667em) upright(d) l + #h(-0.16667em) upright(d) u \|^2 -
  J beta #h(-0.16667em) upright(d) l dot.op #h(-0.16667em) upright(d) u +
  J \( 1 - q \) \| #h(-0.16667em) upright(d)_perp l \|^2 - J q l_1^2 +
  I \| #h(-0.16667em) upright(d) u \|^2 . $ <eq:calculus-master-gradient>]
  In obtaining the coefficient $a_y$ of the normal square, one uses $2 J + q = 1$:
    the two contributions are $- J q'$ and $- q q' \/ 2$.
  At the specified maximum put $D_0 = j' m$. The vanishing first derivative is equivalent to
  #[#set math.equation(numbering: n => "(3.29)")
   $ J \( l_i + u_i \) = u_i - D_0 delta_(i 1) - eta_i . $ <eq:calculus-maximum-substitution>]
  First take $#h(-0.16667em) upright(d) eta = 0$ and separate $\| U \|^2 = \|
    U_(upright("tf")) \|^2 + \( "tr" U \)^2 \/ 2$. The portion of $cal(Q) + j' cal(P) :
    nabla^2 f$ independent of $C_T$ is exactly
  #[#set math.equation(numbering: n => "(3.30)")
   $ J \| U_(upright("tf")) \|^2 & +
     frac(\( 3 - 2 y \) u_1^2 - 6 \( 1 - y \) D_0 u_1 + 3 \( 1 - y \)^2 D_0^2, 2 y \( 1 + y \))\
 & + frac(2 - y, y \( 1 + y \)) \| #h(-0.16667em) upright(d)_perp u \|^2 . $ <eq:calculus-maximum-positive-form>]
  This follows by inserting $l_1 = \( I u_1 - D_0 \) \/ J$, $l_a = I u_a \/ J$, and $"tr" U =
    C_T + \[ - u_1 + \( 1 - y \) D_0 \] \/ y$ in Equation (3.28).
    The terms containing $C_T$, including the last term of Equation (3.28), are
  #[#set math.equation(numbering: n => "(3.31)")
   $ J / 2 C_T^2 + C_T \[ J \( 1 - 2 q \) l_1 - J \( beta + q \) u_1 + D_0 \] = J / 2 C_T^2 +
     q C_T \( 2 D_0 - u_1 \) . $ <eq:calculus-trace-cancellation>]
  This last simplification is the gain needed for a bounded trace target:
    $q \| D_0 \| lt.eq \( 1 - y \) \| D_0 \|$, rather than an unweighted $\| D_0 \|$.
  For $y in \[ 1 \/ 2 \, 1 \)$ the positive coefficients in Equation (3.30) are bounded below.
    Young’s inequality therefore bounds that expression below by
    $c \( \| U_(upright("tf")) \|^2 + \| #h(-0.16667em) upright(d) u \|^2 \) - C \( 1 - y \)^2 D_0^2$.
    The trace terms in Equation (3.31) have the same lower bound after reducing $c$ and adding a constant,
    because $\| C_T \| lt.eq sqrt(2) C_0$. For general $#h(-0.16667em) upright(d) eta$, use $D_0 +
    eta_1$ in the normal substitutions. The unchanged term $-
    beta D_0 u_1$ adds $beta eta_1 u_1$ relative to that substitution.
    The transverse substitutions add terms bounded by $C \( \| #h(-0.16667em) upright(d) eta \|^2 + \|
    #h(-0.16667em) upright(d) eta \| \| #h(-0.16667em) upright(d) u \| \)$,
    and the additional trace term is $- \( 1 - 2 q \) C_T eta_1$.
    Another application of Young’s inequality thus adds only $C \| #h(-0.16667em) upright(d)
    eta \|^2$ to the lower bound.
  The components of the graph second form are
  #[#set math.equation(numbering: n => "(3.32)")
   $ pi_11 = T - z "tr" U \, wide pi_(a b) = z U_(a b) \, wide pi_(1 a) =
     frac(z beta, 2) \( u_a + l_a \) . $ <eq:calculus-second-form-components>]
  Equation (3.29) also gives
  $ \| "tr" U \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| #h(-0.16667em) upright(d) u \| + \( 1 - y \) \|
    D_0 \| + \| #h(-0.16667em) upright(d) eta \| #scale(x: 120%, y: 120%)[\)] . $
  Thus the term $\( cal(K) + ell g \) : pi$ is absorbed in the same positive quadratic expression,
    with an error $C \[ 1 + \( 1 - y \)^2 D_0^2 + \| #h(-0.16667em) upright(d) eta \|^2 \]$.
    The curvature and momentum terms are bounded, and $- I Phi \/ N gt.eq - C - Sigma \/ N$.
    At a local maximum the positive definite tensor $cal(P)$ has nonpositive contraction with
    $nabla^2 \( G + j \( f \) + eta \)$. Its remaining height term is $j'' cal(P) \( #h(-0.16667em) upright(d)
    f \, #h(-0.16667em) upright(d) f \) = j'' q m^2$, and $\| cal(P) : nabla^2 eta \| lt.eq C \| nabla^2 eta \|$.
    This proves Equation (3.21).
  Multiply it by $N^2$ and use $N^2 q m^2 = J \/ \( 1 - y \)$, $J gt.eq 1 \/ 3$,
    and $N^2 \( 1 - y \)^2 \( j' m \)^2 = y \( j' \)^2$. This proves Equation (3.22) without a lapse floor.
    Lastly, negate Equation (3.17) and use $d^2 f_n = hat(z) \/ N$ to obtain Equation (3.23).
    In the AH case, $"tr" pi = 0$ also gives $d^2 partial_n log s = u_n + y H$.
    Substitution of $u_n = - z k - b_S \/ N$ and $H lt.eq k$ proves Equation (3.24). ◻
]

=== 3.4 Energy and Newton flux identities at finite slope <energy-and-newton-flux-identities-at-finite-slope>

#thm([Lemma 3.5.])[
  (Differential energy inequality).  #emph[Assume the two differential equations and the geometric coefficient
    bounds of Lemma 12. On a region suppose, in addition, that $N \,
    s$ have positive lower bounds and finite upper bounds, that $\| #h(-0.16667em) upright(d)
    f \|$ has a finite upper bound, and that $Phi \/ N$ is bounded above.
    Constants in this Lemma may depend on these finite bounds.
    With $E_i = \| nabla N \|^2 + \| nabla^2 f \|^2$ and $rho = \( 1 + y \) \/ d$, one has
#[#set math.equation(numbering: n => "(3.33)")
 $ cal(P) : nabla^2 G gt.eq c E_i - C \( 1 + \| #h(-0.16667em) upright(d) G \|^2 \) .
   $ <eq:calculus-energy-nondivergence>]

 There is a finite $k_0 > 0$, depending only on the stated bounds, such that for $Y = s^(- k_0)$,
#[#set math.equation(numbering: n => "(3.34)")
 $ "div"_g \( rho cal(P) #h(-0.16667em) upright(d) Y \) gt.eq c E_i - C . $ <eq:calculus-energy-divergence>]

 These inequalities hold also at $#h(-0.16667em) upright(d) f = 0$, and their constants use no derivatives of $T$.]
  #emph[On a region where $p = 0$, $s = N$, and $Delta N = Phi$, the corresponding inequality is $Delta Y gt.eq
    c \| nabla N \|^2 - C$. At a constant-height gluing face satisfying $N_o = s_i$ and matching flux of $B$,
    the directed inner flux $\( rho cal(P) #h(-0.16667em) upright(d) Y \)_n$ and outer flux $partial_n
    Y$ differ by a bounded amount. The bound depends only on the finite field bounds and the fixed face geometry.]
] <lem:gradient-energy>

#proof[
  At nonzero gradient write $gamma = #h(-0.16667em) upright(d) G$.
    The identity $gamma = J #h(-0.16667em) upright(d) l - I #h(-0.16667em) upright(d) u$ gives $#h(-0.16667em)
    upright(d) u = y #h(-0.16667em) upright(d) l - \( 1 + y \) gamma$.
    Inserting it into Equation (3.28) gives the exact expression
  #[#set math.equation(numbering: n => "(3.35)")
   $ cal(Q) =  & J [\| U \|^2 + \( 1 - y \) l_1^2 + \( 2 - y \) \| #h(-0.16667em) upright(d)_perp l \|^2]\
 & - frac(2 y \( 2 - y \), 1 + y) #h(-0.16667em) upright(d) l dot.op gamma +
   frac(1 + 4 y - y^2, 1 + y) \| gamma \|^2 . $ <eq:calculus-energy-positive-form>]
  On the bounded field range, $1 - y$ has a positive lower bound and
  $ J / m^2 = frac(N^2 \( 1 - y \)^2, 1 + y) \, wide \| nabla^2 f \|^2 =
    m^2 \( l_1^2 + 2 \| #h(-0.16667em) upright(d)_perp l \|^2 + \| U \|^2 \) . $
  The first line of Equation (3.35) therefore controls $\| nabla^2 f \|^2$.
    Its mixed term is at most $C y \| #h(-0.16667em) upright(d) l \| \|
    gamma \|$ and is absorbed with an error $C \| gamma \|^2$.
    Moreover, $\| #h(-0.16667em) upright(d) u \|^2 lt.eq C \( y^2 \| #h(-0.16667em) upright(d) l \|^2 + \|
    gamma \|^2 \)$, so after reducing the positive coefficient the same lower bound controls $E_i$.
  In Equation (3.28), the trace term has $\| J C_T \| lt.eq C z$.
    Its absolute value is bounded by $C sqrt(E_i)$, since $z$ is comparable to $m$ on this field range.
    Equation (3.32), or direct differentiation of $p \( N \, #h(-0.16667em) upright(d) f \)$,
    gives $\| pi \| lt.eq C sqrt(E_i)$. The remaining terms in the master identity are bounded below by a constant
    minus $C sqrt(E_i)$. Young’s inequality proves Equation (3.33).
  There is no singularity at zero slope. The expansion $G = - log N + 1 /
    2 N^2 \| #h(-0.16667em) upright(d) f \|^2 + O \( \| #h(-0.16667em) upright(d)
    f \|^4 \)$ and the lapse equation give, directly at a point with $#h(-0.16667em) upright(d) f = 0$,
  $ cal(P) : nabla^2 G = N^2 \| nabla^2 f \|^2 + \| #h(-0.16667em) upright(d) u \|^2 - Phi \/ N -
    N \( cal(K) + ell g \) : nabla^2 f . $
  This proves the same inequality there. The matrices $cal(P)$ and $rho
    cal(P)$ are smooth functions of $\( N \, #h(-0.16667em) upright(d) f \)$,
    despite their expressions in terms of $e$; for example $q - 1 = -
    2 y \/ \( 1 + y \)$ cancels the denominator in $e ⊗ e$. Their derivatives consequently satisfy $\|
    "div"_g \( rho cal(P) \) \| lt.eq C sqrt(E_i)$.
  For $Y = e^(k_0 G)$ the product rule yields
  $ "div"_g \( rho cal(P) #h(-0.16667em) upright(d) Y \) = k_0 Y #scale(x: 120%, y: 120%)[\[] rho cal(P) :
    nabla^2 G + "div"_g \( rho cal(P) \) dot.op #h(-0.16667em) upright(d) G +
    k_0 rho cal(P) \( #h(-0.16667em) upright(d) G \, #h(-0.16667em) upright(d) G \) #scale(x: 120%, y: 120%)[\]] . $
  The mixed coefficient term is bounded by $C sqrt(E_i) \| #h(-0.16667em) upright(d) G \|$.
    Absorb half the positive $E_i$ term with Young’s inequality,
    and then choose $k_0$ so the final term absorbs the resulting multiple of $\| #h(-0.16667em) upright(d)
    G \|^2$. The upper and lower bounds on $s$ bound $Y$ on this range and prove Equation (3.34).
    Outside, direct differentiation gives
  $ Delta N^(- k_0) = k_0 N^(- k_0) [\( k_0 + 1 \) \| #h(-0.16667em) upright(d) log N \|^2 - Phi \/ N] \, $
  which proves the stated outer inequality.
  On the face, $rho q = d$ and Equation (3.17) gives
  #[#set math.equation(numbering: n => "(3.36)")
   $ \( rho cal(P) #h(-0.16667em) upright(d) Y \)_n = - frac(k_0 Y B_n, s) +
     frac(k_0 Y, d) \( k_T hat(z) - y H \) \, wide \( partial_n Y \)_o = -
     frac(k_0 Y B_n, s) . $ <eq:calculus-energy-seam-flux>]
  The second term in the inner expression is bounded under the stated finite bounds; the first terms agree.
    This proves the flux assertion. ◻
]

#thm([Lemma 3.6.])[
  (Newton flux and freezing its coefficient).  #emph[In the setting of Lemma 13, let $cal(T)_f =
    nabla^2 f - \( Delta f \) g$. The exact smooth vector identity is
#[#set math.equation(numbering: n => "(3.37)")
 $ rho cal(P) nabla G = - frac(nabla N, s) + cal(T)_f (s^3 / N nabla f) + T s nabla f \, wide "div"_g cal(T)_f =
   "Ric"_g \( nabla f \, dot.op \) . $ <eq:calculus-newton>]

 The coefficient of $cal(T)_f$ is smooth at $#h(-0.16667em) upright(d) f = 0$.]
  #emph[More specifically, in a fixed smooth face chart take compatible reference fields
    $cal(V)_(*) = \( n_(*) \, a_(*) #h(-0.16667em) upright(d) t \,
    s_(*) \)$ for $cal(V) = \( N_i \, #h(-0.16667em) upright(d) f \, N_o \)$,
    where $t$ is inner signed unit normal distance, $n_(*) > 0$, and $s_(*) = s \( n_(*) \, \| a_(*) \| \)$.
    Assume the reference ranges and the actual fields lie in a fixed bounded positive lapse and finite slope
    range. Put $Y_(*) = s_(*)^(- k_0)$ and
$ c_(*) = \( k_0 Y_(*) \/ s_(*) \) \, wide frak(b)_(*) = k_0 Y_(*) s_(*)^3 / n_(*) a_(*) nabla t . $

 For the following assertion assume also that $Phi$ is bounded on each side. Modify the inner and outer energy fluxes by
#[#set math.equation(numbering: n => "(3.38)")
 $ cal(J)_i = rho cal(P) #h(-0.16667em) upright(d) Y + c_(*) B - cal(T)_f frak(b)_(*) \, wide cal(J)_o = nabla Y +
   c_(*) B . $ <eq:calculus-frozen-flux>]

 They have bounded directed flux difference across the face, and
#[#set math.equation(numbering: n => "(3.39)")
 $ \| cal(J) \| & lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| cal(V) -
   cal(V)_(*) \| sqrt(E) #scale(x: 120%, y: 120%)[\)] \,\
"div" cal(J) & gt.eq c' E - C - C delta_(cal(C)) $ <eq:calculus-frozen-flux-size>]

 in the joined weak formulation, with $E = E_i$ inside and $E = \| nabla N_o \|^2$ outside.
   The second line is understood with the smooth metric densities in coordinates,
   and $delta_(cal(C))$ is surface measure on the face. The same conclusion holds on an interior chart with an
   arbitrary constant covector reference and no face term; its metric-dependent reference coefficients are taken
   as smooth functions of position.]
] <lem:newton-flux>

#proof[
  At nonzero gradient the vector multiplying $cal(T)_f$ can be written as
  $ frac(y nabla f, d m^2) = s^3 / N nabla f \, wide frac(z T, d) e = T s nabla f . $
  For a transverse component, multiplication of the proposed identity by $d$ gives $- u_a + y l_a$ on both sides.
    For its first component, the two terms preceding $T s nabla f$ on the right side, multiplied by $d$, are
  $ - u_1 - y "tr" U = q \( y l_1 - u_1 \) - z T \, $
  by Equation (3.25). The last term adds $z T$, giving exactly the first component of the left side.
    This proves the first identity, including at zero gradient by smoothness.
    Commuting the covariant derivatives of $f$ gives $nabla^j nabla_(i j)^2 f = nabla_i Delta f +
    "Ric"_(i k) nabla^k f$, which is the second identity.
  Multiply the first identity by $k_0 Y$. In Equation (3.38),
    the coefficients of $nabla N$ and of $cal(T)_f$ then vanish at the reference state:
  $ cal(J)_i =  & (c_(*) - frac(k_0 Y, s)) nabla N + cal(T)_f (k_0 Y s^3 / N nabla f - frak(b)_(*))\
 & + c_(*) \( B - nabla N \) + k_0 Y T s nabla f . $
  The last line is bounded, since $B - nabla N = - \( cal(K) + ell g \) p$.
    The two coefficient differences in the first line are Lipschitz in the bounded field variables,
    so they are bounded by $C \| cal(V) - cal(V)_(*) \|$. On the outer side,
    $cal(J)_o = \( c_(*) - k_0 N_o^(- k_0 - 1) \) nabla N_o$, whose coefficient also vanishes at $N_o = s_(*)$.
    This proves Equation (3.39).
  The reference vector $frak(b)_(*)$ and its covariant derivative are uniformly bounded in the fixed chart.
    Equation (3.37) gives
  $ \| "div"_g \( cal(T)_f frak(b)_(*) \) \| lt.eq C \( 1 + \| nabla^2 f \| \) . $
  Adding $c_(*) B$ changes the divergence by the bounded scalar $c_(*) Phi$.
    Thus Equation (3.34) and Young’s inequality give $"div" cal(J) gt.eq c' E - C$ on each open side.
    If reference coefficients vary smoothly with the metric in an interior chart,
    their derivatives add only terms bounded by $C \( 1 + sqrt(E) \)$; these are absorbed in the same way.
  Across the face, the energy flux difference is bounded by Equation (3.36),
    and the added current has matching normal flux. The vector $frak(b)_(*)$ is normal to the face.
    Its Newton contraction there uses only
  $ cal(T)_f \( n \, n \) = - "tr"_(cal(C)) nabla^2 f = - f_n H_i \, $
  which is bounded by the constant height trace and the slope bound.
    Consequently the modified normal flux difference is bounded.
    Integration by parts on the two sides, whose face area densities agree,
    gives the surface error in Equation (3.39). ◻
]

== 4 Finite-time area transfer <sec:area-transfer>

The two deformations used below can contract a metric on a set of small weighted volume.
  The following argument shows that this contraction cannot substantially decrease the minimum enclosing area.
  Its constants use a scalar-curvature lower bound and the topology of the original exterior.
  No curvature bound for the changing metrics, and no limit of a hyperbolic Hawking mass, is needed.

=== 4.1 Caps, intrinsic boundaries, and the initial surface <caps-intrinsic-boundaries-and-the-initial-surface>

Attach a compact orientable handlebody to each component of the original boundary $S$.
  Write $O$ for the union of these caps and $X$ for the resulting connected manifold without boundary.
  This operation is topological: whenever a comparison metric is given,
  extend it smoothly across $S$ into the caps. The end is unchanged, and the extension is complete.
  The topology of $X$ and $O$ will remain fixed. In particular,

#[#set math.equation(numbering: n => "(4.1)")
 $ b_2 = dim_(bb(F)_2) H_2 \( X \\ "int" O \; bb(F)_2 \) < oo . $ <eq:flow-topology-constant>]

Finiteness follows by retracting the product end onto its inner sphere;
  what remains is a compact manifold with boundary.

We will start from a largest perimeter-minimizing enclosure $E_0$ of $O$ alone.
  In each application, the obstacle and end barriers establish that its boundary is smooth, free, minimal,
  and disjoint from $O$. Thus $O subset E_0$ and $partial O subset "int" E_0$.
  The open representative $E_0$ is precompact. Each component meets $O$,
  since an extra component could be removed with a strict decrease of perimeter.
  Bounded components of its complement can similarly be filled.
  A largest minimizer is strictly outward minimizing: a larger set with equal perimeter would also be a minimizer,
  contrary to maximality. This assertion concerns all precompact competitors,
  because the far-out barriers allow any such competitor to be trimmed into the fixed truncation used in
  constructing $E_0$.

The cap construction respects the intrinsic-boundary convention in Section 1.
  If $D$ is any admissible closed end-side domain in the original exterior,
  then $X \\ "int"_X D$ is a precompact finite-perimeter enclosure of $O$.
  Its perimeter is bounded by the area of the #emph[entire] intrinsic boundary of $D$.
  In particular, portions along $S$ are counted; for $D = Omega$ the perimeter is $\| S \|$, not zero.
  Conversely, a smooth enclosure of $O$ whose boundary is disjoint from $O$ and whose exterior is connected gives
  an admissible cut by taking the closure of its exterior. These observations also apply when the surfaces or the
  caps have several components.

#thm([Lemma 4.1.])[
  (Adjustment at the initial surface).  #emph[Let $hat(h)$ be a smooth complete metric on $X$,
    and suppose $E_0$ has the properties just described. If $"Scal"_(hat(h)) gt.eq - C_R$ on $X \\ E_0$,
    then an arbitrarily small, compactly supported smooth conformal change gives a metric $tilde(h)$ for which
#[#set math.equation(numbering: n => "(4.2)")
 $ \| partial E_0 \|_(tilde(h)) = \| partial E_0 \|_(hat(h)) \, wide H_(tilde(h)) > 0 \, wide
   integral_(partial E_0) H_(tilde(h))^2 thin #h(-0.16667em) upright(d) A_(tilde(h)) lt.eq 1 \, wide
   "Scal"_(tilde(h)) gt.eq - C_R - 1 quad upright("on ") X \\ E_0 . $ <eq:flow-initial-adjustment>]

 The set $E_0$ remains strictly outward minimizing. The size of the change may be chosen separately for every
   comparison metric.]
] <lem:flow-initial-adjustment>

#proof[
  In a two-sided signed-distance collar of $partial E_0$, let $q$ be positive on the exterior and choose $chi =
    q zeta \( q \)$, where $zeta$ is a nonnegative smooth cutoff equal to one near zero.
    Extend $chi$ by zero beyond the collar. Then $chi = 0$ and $partial_nu chi = 1$ at the initial surface,
    while $chi gt.eq 0$ outside $E_0$. Set $tilde(h) = e^(2 a chi) hat(h)$, with $a > 0$.
    The conformal mean-curvature formula gives $H_(tilde(h)) = 2 a$ on $partial E_0$.
    Consequently its area is unchanged and its squared-mean-curvature integral is $4 a^2 \| partial E_0 \|_(hat(h))$.
  Every outward competitor has its boundary outside $E_0$, where the metric has only increased,
    so strict outward minimality is preserved. Finally,
  #[#set math.equation(numbering: n => "(4.3)")
   $ "Scal"_(tilde(h)) = e^(- 2 a chi) #scale(x: 120%, y: 120%)[\(] "Scal"_(hat(h)) - 4 a Delta_(hat(h)) chi -
     2 a^2 \| #h(-0.16667em) upright(d) chi \|_(hat(h))^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:flow-conformal-scalar>]
  Choose $a$ so that $4 a parallel Delta chi parallel_oo + 2 a^2 parallel #h(-0.16667em) upright(d) chi
    parallel_oo^2 lt.eq 1$ and $4 a^2 \| partial E_0 \| lt.eq 1$.
    Further decreasing $a$ gives any prescribed $C^2$ or tensor-comparison tolerance.
    There is no need for a uniform collar width or a uniform positive lower bound for the initial area.
    This modification will be used only for the flow calculation;
    mass inequalities are applied to the original comparison metric. ◻
]

=== 4.2 Weak flow and its topology <weak-flow-and-its-topology>

We specify the weak-flow input. Theorem 3.1 of #cite(label("HI2001"), form: "prose") applies on a smooth complete
  connected boundaryless manifold possessing a proper locally Lipschitz weak subsolution with precompact initial
  set. It supplies a proper weak solution from every nonempty smooth precompact open set.
  In dimension three, Regularity 1.3, Hull Property 1.4, and Growth Lemma 1.6 give compact $C^(1 \, gamma)$ level
  boundaries for $0 < gamma lt.eq 1 \/ 2$, outward minimality, and exponential area growth from a minimizing hull.
  Smooth Start Lemma 2.4 applies when that hull is strict and its smooth boundary has $H > 0$.
  We use the $H^2$ inequality from Step 1 of the proof of Growth Formula 5.7, Equation (5.22):
  it holds for almost every pair of positive endpoints and precompact levels,
  without a connectedness or scalar-curvature-sign assumption.
  This form suffices for a distributional inequality in time.
  Our smooth initial adjustment and Smooth Start Lemma 2.4 supply its initial upper trace.
  Thus no restart from an arbitrary nonsmooth positive-time level is needed.

The end hypothesis in this existence theorem holds for all metrics used here.
  On an $upright("AH")$ end the coordinate-sphere mean curvature is $2 +
  o \( 1 \)$ and $\| #h(-0.16667em) upright(d) log r \| = 1 + o \( 1 \)$;
  on an $upright("AF")$ end the corresponding quantities are $2 \/ r + o \( r^(- 1) \)$ and $r^(- 1) +
  o \( r^(- 1) \)$. Thus $u_oo = c log r$ with $0 < c < 2$ has

#[#set math.equation(numbering: n => "(4.4)")
 $ "div"_(hat(h)) (frac(nabla u_oo, \| nabla u_oo \|)) gt.eq \| nabla u_oo \| $ <eq:flow-end-subsolution>]

beyond a sufficiently large sphere $r = R$. Use $v = max { c log \( r \/ R \) \, 0 } - 1$, extended by $-
  1$ throughout the inner region. Its negative sublevel is a nonempty smooth precompact set, bounded by $r =
  R e^(1 \/ c)$, and outside this set the displayed inequality holds smoothly.
  Extending the radial unit normal field by zero inside $r =
  R$ gives a nonnegative distributional divergence contribution at that sphere.
  The Gauss–Green inequality against outward variations proves the weak subsolution property as well.
  This subsolution is proper toward infinity. The compact metric adjustment in Lemma 15 leaves it unchanged.

For positive-time notation, extend the exterior level function $u$ by zero on the initial set and, for $t > 0$, write

#[#set math.equation(numbering: n => "(4.5)")
 $ E_t = E_0 union { u < t } \, wide N_t = partial E_t \, wide A \( t \) = \| N_t \|_(tilde(h)) =
   e^t A \( 0 \) . $ <eq:flow-levels>]

Use the open perimeter representatives of these sets. At almost every time their boundary is $C^(1 \, gamma)$,
  its weak mean curvature is $H = \| nabla u \|$, and its area measure agrees with the level measure in the coarea
  formula. Indeed, differentiability and nonvanishing gradient hold at almost every point of almost every level in
  the coarea sense; those points belong to the reduced boundary of the sublevel set.
  The equivalent statement follows directly from the BV coarea formula.
  The variational property used below is local minimality of

#[#set math.equation(numbering: n => "(4.6)")
 $ F mapsto "Per"_(tilde(h)) \( F \) - integral_F \| nabla u \|_(tilde(h)) thin #h(-0.16667em) upright(d)
   V_(tilde(h)) $ <eq:flow-variational-functional>]

under compact changes away from the initial set; differences of this expression are taken in a compact region
  containing the change.

#thm([Lemma 4.2.])[
  (A component bound on fixed topology).  #emph[At almost every positive time,
    every component of $E_t$ meets $E_0$, the open exterior of $E_t$ is connected, and
#[#set math.equation(numbering: n => "(4.7)")
 $ b_0 \( N_t \) lt.eq b_2 \, wide chi \( N_t \) lt.eq 2 b_2 \, $ <eq:flow-component-bound>]

 where $b_2$ is the fixed number in (4.1).]
] <lem:hull-components>

#proof[
  Fix a time $t$ with the stated regularity and with $"Vol" { u = t } = 0$.
    Excluding the latter exceptional times removes at most a countable set.
    Suppose a component $B$ of $E_t$ did not meet $E_0$. For almost every $0 < s < t$,
    the set $E_s ∩ B$ is compactly contained in $B$ and separated from $E_0$.
    To check this, continuity gives $u lt.eq s < t$ on its closure,
    and a neighborhood of $overline(E)_0$ belongs to $E_t$. A connected component of that neighborhood cannot meet
    $B$ without placing part of $E_0$ in $B$. The boundaries here are perimeter representatives;
    the same containment holds modulo null sets.
  Removing $E_s ∩ B$ is consequently an allowed variation in (4.6).
    If $p \( s \) = "Per"_(tilde(h)) \( E_s \; B \)$, minimality and coarea give
  #[#set math.equation(numbering: n => "(4.8)")
   $ p \( s \) lt.eq integral_(E_s ∩ B) \| nabla u \| thin #h(-0.16667em) upright(d) V =
     integral_0^s p \( ell \) thin #h(-0.16667em) upright(d) ell . $ <eq:flow-no-new-components>]
  There is no initial contribution because $B ∩ E_0 = diameter$.
    Grönwall’s inequality implies $p = 0$ almost everywhere. A finite-perimeter indicator with zero variation on
    the connected open set $B$ is constant there. Compact containment rules out the value one,
    so $E_s ∩ B$ is null for almost every $s < t$. Letting such $s$ increase to $t$ contradicts that $B$ is a
    nonempty open component of $E_t$. This proves the first assertion.
    It also shows that each such component contains an entire component of $E_0$, and hence meets $O$.
  Outward minimality excludes a bounded open component of the complement:
    filling it removes its nonempty boundary and strictly decreases perimeter.
    Because $X$ has just one product end and $E_t$ is precompact,
    only one component of the exterior can be unbounded. Its open exterior is therefore connected.
  Let $N_t^1 \, dots.h \, N_t^m$ be the boundary components.
    Choose a large compact truncation $Y subset X \\ "int" O$ containing all of them.
    For each $j$, an arc can start on $partial O$, travel in the adjacent component of $E_t$,
    cross $N_t^j$ once transversely, and then travel in the connected exterior to the outer boundary of $Y$,
    without meeting any other $N_t^k$. To construct its inner part,
    join a point just inside $N_t^j$ to $O$ in the relevant connected open component and stop at the first cap
    encountered; thus the arc stays outside the cap interiors. Small perturbations give the asserted transversality.
  These arcs define relative one-cycles in $\( Y \, partial Y \)$ whose mod-two intersection pairings with the
    closed surfaces $N_t^k$ are the separate coordinate vectors.
    Hence the classes $\[ N_t^k \]$ are linearly independent in $H_2 \( Y \; bb(F)_2 \)$.
    Extending the truncation along its product end changes no homology, so $m lt.eq b_2$.
    Each closed orientable surface has Euler characteristic at most two, which proves the second estimate.
    The arcs and the intersection pairings also make explicit why disconnected caps and arbitrary compact interior
    topology cause no difficulty. ◻
]

#thm([Lemma 4.3.])[
  (Curvature control up to a prescribed area).  #emph[Suppose the adjusted metric satisfies $"Scal"_(tilde(h))
    gt.eq - C_0$ outside $E_0$, and let $A_(*) > 0$. At almost every time for which $A \( t \) lt.eq A_(*)$,
#[#set math.equation(numbering: n => "(4.9)")
 $ J \( t \) := integral_(N_t) \| nabla u \|^2 thin #h(-0.16667em) upright(d) A_(tilde(h)) lt.eq C_H := 1 + 2 /
   3 C_0 A_(*) + 16 pi b_2 . $ <eq:flow-uniform-curvature>]

 In particular this bound is independent of $A \( 0 \)$, even if the initial areas tend to zero in a family.]
] <lem:flow-curvature>

#proof[
  Let $cal(A)_t$ denote the weak second fundamental form of $N_t$.
    For almost every pair $0 < r < t$, the cited growth formula,
    after dropping its nonnegative tangential gradient term, says
  #[#set math.equation(numbering: n => "(4.10)")
   $ J \( r \) gt.eq J \( t \) + integral_r^t integral_(N_s) #scale(x: 120%, y: 120%)[\(] 2 \| cal(A)_s \|^2 +
     2 "Ric" \( nu \, nu \) - H^2 #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) upright(d) A thin
     #h(-0.16667em) upright(d) s . $ <eq:flow-hi-growth>]
  After our adjustment, Smooth Start Lemma 2.4 identifies the weak flow with the smooth flow on an initial
    interval. Hence $J \( r \) arrow.r J \( 0 \) lt.eq 1$ as $r arrow.b 0$.
    Letting admissible Lebesgue endpoints tend to zero supplies the initial upper trace in the integrated
    inequality below. At positive times only the almost-everywhere inequality is used.
  For completeness, Gauss and Gauss–Bonnet apply to these levels with their weak curvature.
    A local $C^(1 \, gamma)$ graph with bounded weak mean curvature belongs to $W^(2 \, 2)$ by difference
    quotients in its uniformly elliptic mean-curvature equation.
    Smoothing graph representations gives smooth embeddings converging in $C^1 ∩ W^(2 \, 2)$;
    the graph formula for the second fundamental form then gives convergence of the quadratic curvature terms in
    $L^1$. Thus the smooth Gauss identity and Gauss–Bonnet pass to the limit.
    This is also the content of Lemmas 5.4–5.5 of #cite(label("HI2001"), form: "prose").
  The Gauss equation and $\| cal(A)_s \|^2 gt.eq H^2 \/ 2$ give
  #[#set math.equation(numbering: n => "(4.11)")
   $ integral_(N_s) #scale(x: 120%, y: 120%)[\(] 2 \| cal(A)_s \|^2 + 2 "Ric" \( nu \, nu \) -
     H^2 #scale(x: 120%, y: 120%)[\)] & = integral_(N_s) #scale(x: 120%, y: 120%)[\(] \| cal(A)_s \|^2 +
     "Scal"_(tilde(h)) - "Scal"_(N_s) #scale(x: 120%, y: 120%)[\)]\
 & gt.eq 1 / 2 J \( s \) - C_0 A \( s \) - 8 pi b_2 . $ <eq:flow-gauss-bound>]
  Consequently, in distributions in time, $J' + J \/ 2 lt.eq C_0 A + 8 pi b_2$,
    with initial upper value at most one. One can see this directly from (4.10) at Lebesgue endpoints:
    $J$ plus the integral of the lower bound in (4.11) has a nonincreasing representative.
    Any singular part of its derivative is nonpositive, so the integrating factor is valid. It yields
  #[#set math.equation(numbering: n => "(4.12)")
   $ J \( t \) lt.eq e^(- t \/ 2) + integral_0^t e^(\( s - t \) \/ 2) #scale(x: 120%, y: 120%)[\(] C_0 A \( s \) +
     8 pi b_2 #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) upright(d) s . $ <eq:flow-integrated-curvature>]
  Using $A \( s \) = e^(s - t) A \( t \)$ bounds the two integrals by $2 / 3 C_0 A \( t \)$ and $16 pi b_2$,
    respectively. ◻
]

=== 4.3 Projecting enclosing surfaces <projecting-enclosing-surfaces>

In the next lemma, $A_(*)$ is the original minimum enclosing area, defined using complete intrinsic boundaries.
  The comparison end may be the original $upright("AH")$ end,
  or the $upright("AF")$ extension of a fixed compact inner region.
  In the latter case $g_(upright("base"))$ denotes $g$ on the inner region and $g_o$ on the extension.
  Statements involving this base metric are interpreted separately on the two sides of the joining sphere $cal(C)$.

#thm([Lemma 4.4.])[
  (Enclosing-area projection).  #emph[Let $N$ be a compact embedded $C^1$ enclosure of $O$, disjoint from $S$,
    with connected exterior.]
  + #emph[On the original $upright("AH")$ exterior, fix a large radius $r_p$ and put
#[#set math.equation(numbering: n => "(4.13)")
 $ rho = min { 1 \, r_p^2 \/ r^2 } \, $ <eq:flow-ah-weight>]

 with $rho = 1$ on the compact part. There is $q \( r_p \) arrow.b 0$, depending only on the original end metric,
   such that
#[#set math.equation(numbering: n => "(4.14)")
 $ integral_N rho thin #h(-0.16667em) upright(d) A_g gt.eq \( 1 - q \( r_p \) \) A_(*) . $ <eq:flow-ah-projection>]

]
  + #emph[Suppose the $upright("AF")$ extension has the parallel-surface form $g_o =
    U^2 #h(-0.16667em) upright(d) t^2 + gamma_t$, where $gamma_t$ is induced on outward Euclidean parallels of a
    strictly convex embedding of $\( cal(C) \, gamma_0 \)$. Then, with $rho = 1$,
#[#set math.equation(numbering: n => "(4.15)")
 $ integral_N #h(-0.16667em) upright(d) A_(g_(upright("base"))) gt.eq A_(*) . $ <eq:flow-af-projection>]

 For a surface crossing the joining sphere, the assertion holds for the piecewise area;
   it is enough that its intersection with the joining sphere have zero two-dimensional measure.
   In particular this holds for almost every weak-flow level.]
] <lem:area-projection>

#proof[
  First take $N$ smooth and transverse to the spheres used in the construction.
    Let $D$ be its closed end-side domain. For part (i), choose a transverse sphere $r = r_1$ with $r_p \/ 2 lt.eq
    r_1 lt.eq r_p$, and replace $D$ by
  #[#set math.equation(numbering: n => "(4.16)")
   $ D' = D union { r gt.eq r_1 } . $ <eq:flow-projected-domain>]
  This domain is connected because both sets contain the entire remote end.
    Its boundary inside $r_1$ is part of $N$; the remaining boundary is a portion of the sphere $r = r_1$.
    Every point of this newly exposed sphere portion is covered by radial projection of $N ∩ { r gt.eq r_1 }$:
    the ray starts outside $D$ and eventually lies in its end, so must cross $N$.
  In the hyperbolic reference metric the radial map from radius $r$ to $r_1$ has two-dimensional Jacobian at most
    $r_1^2 \/ r^2$ on every two-plane. The original metric has uniform relative error $o \( 1 \)$ on $r gt.eq
    r_p \/ 2$. Its corresponding Jacobian is therefore at most
  #[#set math.equation(numbering: n => "(4.17)")
   $ \( 1 + o_(r_p) \( 1 \) \) r_1^2 / r^2 lt.eq \( 1 + o_(r_p) \( 1 \) \) rho . $ <eq:flow-projection-jacobian>]
  The area formula, allowing multiplicity, bounds the new sphere area by the weighted area of the discarded
    portion of $N$.
  The boundary of $D'$ has transverse corners along finitely many smooth curves.
    In local coordinates given by defining functions for the two faces,
    round each quadrant edge in a shrinking tubular neighborhood, toward the side enlarging $D'$.
    The added area tends to zero: the modification has vanishing width along a fixed compact edge,
    with bounded local slopes. The rounded end-side domain stays connected and gives an admissible cut,
    disjoint from $S$. Since the definition of $A_(*)$ uses its full intrinsic boundary,
    it follows that $A_(*) lt.eq \( 1 + o_(r_p) \( 1 \) \) integral_N rho thin #h(-0.16667em) upright(d) A_g$.
    This proves (4.14).
  For part (ii), keep the part of $D$ in the original compact inner region and attach the whole original
    $upright("AH")$ region outside $cal(C)$. The resulting end-side domain is connected.
    Indeed, every point of its inner part can be joined inside the old $D$ to infinity,
    and the initial portion of such a path reaches $cal(C)$. Its newly exposed boundary in $cal(C)$ is covered by
    projection of the old outer boundary along the parallel rays.
    This projection has two-dimensional Jacobian at most one:
    $gamma_t gt.eq gamma_0$ by strict convexity, its normal derivative is zero,
    and the positive coefficient $U^2$ creates no mixed terms.
    Rounding the resulting transverse corners as above gives admissible original cuts with area at most
    $integral_N #h(-0.16667em) upright(d) A_(g_(upright("base")))$ plus a vanishing error.
  Finally, a $C^1$ embedded enclosing surface can be approximated by smooth embeddings in $C^1$,
    within a collar disjoint from $S$, by an ambient isotopy. This preserves the end side and its connectedness.
    Choose the approximations transverse to the cutting sphere. Areas and weighted areas converge.
    In the joined case, first approximate on the two smooth sides and make the approximations transverse to
    $cal(C)$; round across a shrinking seam neighborhood. The base metric is bounded and smooth on either side at
    this fixed construction, and the surface has zero area in the seam.
    The area of its portion in that neighborhood tends to zero,
    so these local roundings contribute a vanishing area error.
    This procedure also applies when the smooth collar coordinates chosen for the comparison metric differ from
    the original side coordinates: the identifications are smooth on each closed side and preserve the joining
    surface. For almost every flow level the zero-area intersection follows by applying the level-measure
    decomposition to the fixed finite-area seam. Passing to the limit proves both assertions. ◻
]

=== 4.4 The uniform transfer criterion <the-uniform-transfer-criterion>

The following formulation isolates all requirements on the deformations.
  A reference metric may be piecewise smooth across one fixed compact joining surface, as in Lemma 18(ii).
  Its area and volume measures below are then the sums of the two side measures.

#thm([Proposition 4.5.])[
  (Uniform area transfer).  #emph[Fix the capped topology $\( X \, O \)$, a number $A_(*) > 0$,
    and a scalar lower bound $C_R gt.eq 0$. Suppose a comparison has the following properties.]
  + #emph[The smooth complete metric $hat(h)$ has one $upright("AH")$ or $upright("AF")$ end with the
    mean-curvature and radial-gradient asymptotics used in (4.4).
    The cap-only enclosure $E_0$ is a smooth precompact strictly outward-minimizing set,
    with minimal boundary disjoint from $O$, every component meeting $O$, and $"Scal"_(hat(h)) gt.eq -
    C_R$ outside $E_0$.]
  + #emph[On $X \\ O$ there are a reference metric $g_(upright("base"))$, positive functions $x \, W$,
    a metric $macron(g)$, and a weight $0 < rho lt.eq 1$, such that
#[#set math.equation(numbering: n => "(4.18)")
 $ macron(g) gt.eq g_(upright("base")) \, wide #h(-0.16667em) upright(d) V_(macron(g)) =
   W thin #h(-0.16667em) upright(d) V_(g_(upright("base"))) \, wide \( 1 - eta \) x macron(g) lt.eq
   hat(h) lt.eq \( 1 + eta \) x macron(g) . $ <eq:flow-metric-comparison>]

]
  + #emph[Every enclosing $C^1$ surface with connected exterior, as in Lemma 18, satisfies
#[#set math.equation(numbering: n => "(4.19)")
 $ integral_N rho thin #h(-0.16667em) upright(d) A_(g_(upright("base"))) gt.eq \( 1 - q \) A_(*) .
   $ <eq:flow-abstract-projection>]

 In the piecewise case this is required for surfaces having zero area in the joining surface.]
  #emph[For every $0 < epsilon < 1$ there are positive tolerances $eta_0 \, q_0 \, delta_0$ and $v_0$,
    depending only on $epsilon \, A_(*) \, C_R$ and the integer $b_2$ in (4.1), with the following consequence.
    If $eta lt.eq eta_0$, $q lt.eq q_0$, $0 < delta lt.eq delta_0$, and
#[#set math.equation(numbering: n => "(4.20)")
 $ integral_({ x < 1 - delta }) rho^(3 \/ 2) W thin #h(-0.16667em) upright(d) V_(g_(upright("base"))) < v_0 \,
   $ <eq:flow-bad-volume>]

 then
#[#set math.equation(numbering: n => "(4.21)")
 $ \| partial E_0 \|_(hat(h)) gt.eq \( 1 - epsilon \) A_(*) . $ <eq:flow-area-conclusion>]

 The tolerances are uniform over all comparisons satisfying these conditions;
   the geometry and initial area of $E_0$ may vary.]
] <prop:area-transfer>

#proof[
  Make the change from Lemma 15. It preserves the initial area and all topological properties.
    Take its size sufficiently small that the comparison (4.18) for the resulting $tilde(h)$ holds with an error
    $macron(eta) lt.eq epsilon \/ 32$, by initially requiring, for example, $eta lt.eq eta_0 = epsilon \/ 64$.
    Its scalar lower bound is $- C_0$, where $C_0 = C_R + 1$. Also take $q_0 = delta_0 = epsilon \/ 32$.
  Suppose, to the contrary, that $A \( 0 \) < \( 1 - epsilon \) A_(*)$.
    Exponential area growth gives an interval $I = \[ t_(-) \, t_(+) \]$ on which the endpoint areas are
    $\( 1 - epsilon \) A_(*)$ and $\( 1 - epsilon \/ 2 \) A_(*)$. Its length is the fixed positive number
  #[#set math.equation(numbering: n => "(4.22)")
   $ Delta_epsilon = log frac(1 - epsilon \/ 2, 1 - epsilon) . $ <eq:flow-time-window>]
  Although $t_(-)$ may tend to infinity when $A \( 0 \)$ tends to zero,
    Lemma 17 bounds $J \( t \)$ throughout $I$ by the same constant $C_H$.
  Write $cal(B) = { x < 1 - delta }$. On the good part of a level, (4.18) and $macron(g) gt.eq g_(upright("base"))$ give
  #[#set math.equation(numbering: n => "(4.23)")
   $ integral_(N_t \\ cal(B)) rho thin #h(-0.16667em) upright(d) A_(g_(upright("base"))) lt.eq
     frac(A \( t \), \( 1 - macron(eta) \) \( 1 - delta \)) . $ <eq:flow-good-area>]
  Combine this with (4.19). Since $\( 1 - macron(eta) \) \( 1 - delta \) gt.eq 1 - epsilon \/ 16$,
    for almost every $t in I$ we obtain
  #[#set math.equation(numbering: n => "(4.24)")
   $ integral_(N_t ∩ cal(B)) rho thin #h(-0.16667em) upright(d) A_(g_(upright("base"))) gt.eq \( 1 - q \) A_(*) -
     frac(\( 1 - epsilon \/ 2 \) A_(*), \( 1 - macron(eta) \) \( 1 - delta \)) gt.eq frac(epsilon A_(*), 4) = :
     c_A . $ <eq:flow-bad-area-lower>]
  The same metric comparison on the bad part therefore implies
  #[#set math.equation(numbering: n => "(4.25)")
   $ integral_(N_t ∩ cal(B)) rho x^(- 1) thin #h(-0.16667em) upright(d) A_(tilde(h)) gt.eq \( 1 - macron(eta) \)
     c_A gt.eq c_A \/ 2 . $ <eq:flow-weighted-area-lower>]
  Here is the precise weighted coarea step. Put $F = rho x^(- 1)$ and $H = \| nabla u \|_(tilde(h))$.
    For almost every level $H > 0$ at almost every point in its area measure.
    Hölder with exponents $3 \/ 2$ and $3$ gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ integral_(N_t ∩ cal(B)) F thin #h(-0.16667em) upright(d) A & =
     integral_(N_t ∩ cal(B)) (F^(3 \/ 2) / H)^(2 \/ 3) \( H^2 \)^(1 \/ 3) thin #h(-0.16667em) upright(d) A\
 & lt.eq (integral_(N_t ∩ cal(B)) F^(3 \/ 2) / H thin #h(-0.16667em) upright(d) A)^(2 \/ 3) J \( t \)^(1 \/ 3) .
   $ <eq:flow-holder-exponents>]
  Infinite integrals cause no difficulty; otherwise this identity can first be applied where $H$ is bounded away
    from zero and passed to the limit. Equations (4.9) and (4.25) yield
  #[#set math.equation(numbering: n => "(4.27)")
   $ integral_(N_t ∩ cal(B)) frac(rho^(3 \/ 2) x^(- 3 \/ 2), \| nabla u \|) thin #h(-0.16667em) upright(d)
     A_(tilde(h)) gt.eq frac(\( c_A \/ 2 \)^(3 \/ 2), sqrt(C_H)) = : c_V . $ <eq:flow-level-volume-lower>]
  Integrating over $I$ and applying Lipschitz coarea gives
  #[#set math.equation(numbering: n => "(4.28)")
   $ Delta_epsilon c_V & lt.eq integral_(cal(B) ∩ { t_(-) < u < t_(+) } ∩ { \| nabla u \| > 0 }) rho^(3 \/ 2)
     x^(- 3 \/ 2) thin #h(-0.16667em) upright(d) V_(tilde(h))\
 & lt.eq \( 1 + macron(eta) \)^(3 \/ 2) integral_(cal(B)) rho^(3 \/ 2) W thin #h(-0.16667em) upright(d)
   V_(g_(upright("base"))) . $ <eq:flow-coarea-contradiction>]
  The last inequality uses $#h(-0.16667em) upright(d) V_(tilde(h)) lt.eq \( 1 + macron(eta) \)^(3 \/ 2) x^(3 \/ 2)
    W thin #h(-0.16667em) upright(d) V_(g_(upright("base")))$.
    Thus it is enough to take $v_0 = Delta_epsilon c_V \/ 2^(3 \/ 2)$.
    Notice that no contribution from a plateau of the level function has been assumed:
    coarea integrates only where its gradient is nonzero, and the full bad-set volume is an upper bound.
    This proves the proposition. ◻
]

=== 4.5 The two applications and their parameter order <the-two-applications-and-their-parameter-order>

For the maximal $upright("AH")$ reduction, the base is the original $g$ and

#[#set math.equation(numbering: n => "(4.29)")
 $ macron(g) = g + s^2 #h(-0.16667em) upright(d) f^2 \, wide h = x macron(g) \, wide W^2 = 1 +
   s^2 \| #h(-0.16667em) upright(d) f \|_g^2 \, wide #h(-0.16667em) upright(d) V_(macron(g)) =
   W thin #h(-0.16667em) upright(d) V_g . $ <eq:flow-graph-volume>]

The curvature bound is $"Scal"_h gt.eq - 6$, and the cap-only largest hull is the enclosure used in that
  reduction. Fix the area tolerance $epsilon$, then $r_p$ so that the error in (4.14) is at most $q_0$,
  and then $delta lt.eq delta_0$. The quantitative estimates of Section 5 give, with $R_s = M^(3 \/ 10)$ and $L = M^2$,

#[#set math.equation(numbering: n => "(4.30)")
 $ integral_({ x < 1 - delta }) rho^(3 \/ 2) W thin #h(-0.16667em) upright(d) V_g lt.eq
   C (L^(- 1) + sqrt(M \/ L) + R_s^(- 1) + sqrt(M) / R_s^2) arrow.r 0 . $ <eq:flow-ah-bad-volume>]

To explain the powers, the unweighted bad volume inside $R_s$ is $O \( L^(- 1) \)$,
  and $integral \( W^2 - 1 \) thin #h(-0.16667em) upright(d) V_g lt.eq C M$;
  Cauchy–Schwarz gives the first two terms. On the tail the $upright("AH")$ volume element is comparable to $r
  thin #h(-0.16667em) upright(d) r thin #h(-0.16667em) upright(d) A_sigma$ and $rho^(3 \/ 2) = r_p^3 \/ r^3$.
  Hence $integral_(r > R_s) rho^(3 \/ 2) thin #h(-0.16667em) upright(d) V_g = O \( R_s^(- 1) \)$,
  whereas $integral_(r > R_s) rho^3 thin #h(-0.16667em) upright(d) V_g = O \( R_s^(- 4) \)$;
  another Cauchy–Schwarz inequality gives the last term. The constants here may depend on the already fixed $r_p$
  and original data. Proposition 19 therefore yields the required lower bound for the comparison boundary area.

For the compact construction with the $upright("AF")$ attachment, $g_(upright("base")) =
  g$ inside and $g_o$ outside, $macron(g) = g + s^2 #h(-0.16667em) upright(d) f^2$ inside and $macron(g) =
  g_o$ outside. Thus $W = 1$ outside, $rho = 1$, and Lemma 18 has zero projection error.
  Section 9 constructs a smooth metric $h'$ arbitrarily close to $h = x macron(g)$,
  with a uniform scalar lower bound, together with two enclosures.
  The enclosure $E$ contains the caps and all unsafe balls and is used for the $upright("AF")$ mass inequality.
  The largest cap-only minimizer $E_0$ is used for the flow. In particular

#[#set math.equation(numbering: n => "(4.31)")
 $ \| partial E \|_(h') gt.eq \| partial E_0 \|_(h') . $ <eq:flow-af-two-enclosures>]

No topological bound on the unsafe balls or on $E$ is required.

The bad set is confined to a fixed outer radius by the capacitary lower bound for $x$.
  On its designated penalized region,

#[#set math.equation(numbering: n => "(4.32)")
 $ integral_({ x < 1 - delta } ∩ upright("designated")) W thin #h(-0.16667em) upright(d) V_(g_(upright("base")))
   lt.eq C \/ L . $ <eq:flow-af-bad-volume>]

The omitted fixed exterior collar has $W = 1$, so its contribution is at most its base volume.
  The omitted inner collar has base width $O \( M^(- 4) \)$.
  Since the compact construction gives $integral_(Omega_i) W^2 thin #h(-0.16667em) upright(d) V_g lt.eq
  C \( L \) M^2$, its contribution is at most

#[#set math.equation(numbering: n => "(4.33)")
 $ O \( M^(- 2) \) (integral_(Omega_i) W^2 thin #h(-0.16667em) upright(d) V_g)^(1 \/ 2) =
   O_L \( M^(- 1) \) . $ <eq:flow-inner-collar-cost>]

Choose the exterior collar sufficiently thin and then $L$ sufficiently large, both before $M$.
  Next choose $M$ large and the remaining finite penalty parameters as in Section 7.
  Finally choose the individual corner-smoothing tolerance small enough for (4.18).
  These choices make the bad volume smaller than $v_0$. The flow-only initial adjustment does not change $\|
  partial E_0 \|_(h')$. Equations (4.21) and (4.31) give

#[#set math.equation(numbering: n => "(4.34)")
 $ \| partial E \|_(h') gt.eq \| partial E_0 \|_(h') gt.eq \( 1 - epsilon \) A_(*) . $ <eq:flow-af-area-conclusion>]

If $A_(*) = 0$ there is no area-transfer assertion to prove;
  the nonnegative mass conclusion from the $upright("AF")$ comparison supplies the needed zero-area bound.

== 5 Reduction of maximal data to a minimal boundary <sec:maximal-reduction>

The result of this section is a reduction within the asymptotically hyperbolic class.
  In particular, it requires no uniform statement about the metrics to which the time-symmetric inequality is applied.

#thm([Theorem 5.1.])[
  (Maximal reduction).  #emph[Let $F : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ be continuous and nondecreasing.
    Suppose that every smooth, complete, connected, orientable,
    one-ended asymptotically hyperbolic three-dimensional exterior with nonempty compact minimal boundary,
    scalar curvature at least $- 6$, $g - b in C_tau^(2 \, gamma)$ for some $0 < gamma < 1$ and $3 \/ 2 < tau <
    3$, the weighted scalar integrability of Section 1, and four finite mass fluxes satisfies
$ p_0 gt.eq F \( A_min \) . $

 The exponent $gamma$ may depend on the comparison metric.
   This hypothesis is to hold in every designated asymptotic chart,
   without a causal-character assumption on the mass covector.
   Then every maximal initial-data exterior of Section 1 satisfies, in each designated chart,
$ p_0 \( g \) gt.eq F #scale(x: 120%, y: 120%)[\(] A_min \( S \; g \) #scale(x: 120%, y: 120%)[\)] . $

]
] <thm:ah-reduction>

Fix the original data and chart, and put $A_(*) = A_min \( S \; g \)$.
  Extend the end radius $r$ to a smooth positive function bounded away from zero on $Omega$.
  Constants may depend on this extension and the fixed data.
  Derivatives, volume measures, and fluxes in this section use $g$, unless a different metric is indicated.
  The letter $b_S$ below denotes a scalar inner flux datum; it is unrelated to the hyperbolic reference metric $b$.

=== 5.1 The equations and the order of choices <the-equations-and-the-order-of-choices>

For $N > 0$ and $f$, define

#[#set math.equation(numbering: n => "(5.1)")
 $ s^2 + s^4 \| d f \|_g^2 = N^2 \, wide p = s^2 nabla f \, wide v = p \/ N \, wide W = N \/ s \,\
macron(g) = g + s^2 d f^2 \, wide pi = N^(- 1) "sym" nabla p^flat \, wide x = s w \, wide h = x macron(g) \, wide
  A = N s macron(g)^(- 1) . $ <eq:ah-fields>]

The first relation uniquely defines $s > 0$, smoothly also at $d f = 0$.
  The vector $p$ in this display is not a component of the mass covector.
  In particular $macron(g)^(- 1) = g^(- 1) - v ⊗ v$ and $#h(-0.16667em) upright(d) V_(macron(g)) =
  W thin #h(-0.16667em) upright(d) V_g$. We solve

#[#set math.equation(numbering: n => "(5.2)")
 $ "div"_g p = 0 \, wide B = nabla N - K p \, wide "div"_g B = 3 N + Sigma \, wide - "div"_g \( A thin d w \) =
   3 N + Sigma x + P \, $ <eq:ah-system>]

where $Sigma \, P gt.eq 0$. At the inner boundary, whose normal $nu$ points into $Omega$, prescribe

#[#set math.equation(numbering: n => "(5.3)")
 $ f = t M \, wide B dot.op nu = - t b_S \, wide \( A thin d w \) dot.op nu = 0 . $ <eq:ah-inner-data>]

Here $0 lt.eq t lt.eq 1$ is a continuation parameter. On the outer sphere $S_R = { r = R }$,
  with outward $g$-normal $nu_R$, prescribe

#[#set math.equation(numbering: n => "(5.4)")
 $ f = 0 \, wide B dot.op nu_R = partial_(nu_R) V_0 \, wide w = V_0^(- 1) . $ <eq:ah-outer-data>]

We keep $K$ fixed throughout the continuation; this preserves $H_g \( S \) lt.eq k$, where $k = K \( nu \, nu \)$.

The identities of Lemmas 9, 10, and 11 apply with $"tr"_g K = "tr"_g pi = 0$. Writing $Q = B + A thin d w$, they give

#[#set math.equation(numbering: n => "(5.5)")
 $ "div"_g Q & = - \( x - 1 \) Sigma - P \,\
Q & = N accent(nabla x, ‾) + x \( pi - K \) p - \( x - 1 \) B \,\
x^2 \( "Scal"_h + 6 \) & = x { D + \| pi - K \|_g^2 } + frac(3, 2 x) \| d x \|_(macron(g))^2 + 6 \( x - 1 \)^2 +
  frac(2 P, N) \,\
D & = 16 pi \( mu - J dot.op v \) gt.eq 0 \,\
(Delta_(macron(g)) - 3 + N^(- 1) "div"_g \( \( pi - K \) p \)) x & = - 3 - P \/ N . $ <eq:ah-current>]

The dominant energy condition and $\| v \| < 1$ give the displayed sign of $D$.
  At $S$, the height maximum principle will give $v = - z nu$, $0 lt.eq z < 1$, and the boundary formula is

#[#set math.equation(numbering: n => "(5.6)")
 $ s sqrt(x) thin H_h = N \( H_g - z k \) - t b_S . $ <eq:ah-boundary-curvature>]

Consequently a suitable small inner flux will make the obstacle boundary strictly mean concave wherever an
  enclosing minimizer could touch it.

Choose a fixed $p_1 > 2$ and an area tolerance $0 < delta < 1 \/ 4$. For a large finite height $M$, set

#[#set math.equation(numbering: n => "(5.7)")
 $ R_s = M^(3 \/ 10) \, wide T = M^(4 \/ 5) \, wide L = M^2 . $ <eq:ah-parameter-scales>]

The allowable smooth inner data form the convex class

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(B)_M = {b_S in C^oo \( S \) : 0 lt.eq b_S lt.eq B_(*) \, med
   parallel b_S parallel_(L^(p_1) \( S \, g \)) lt.eq M^(- 1 \/ \( 10 p_1 \))} . $ <eq:ah-flux-class>]

The fixed constant $B_(*)$ will be chosen using an upper lapse estimate which depends only on the norm constraint
  in (5.8), not on $B_(*)$.

Let $epsilon.alt > 0$ be chosen after $M \, L$. The unscaled volume source is a product of smooth cutoffs,
  between $0$ and $L$, which vanishes when $r gt.eq 2 R_s$, $x gt.eq 1 - delta \/ 2$, or $N lt.eq epsilon.alt$,
  and equals $L$ when

$ r lt.eq R_s \, wide x lt.eq 1 - delta \, wide N gt.eq 2 epsilon.alt . $

The smooth cutoffs are defined also for negative arguments.
  Two further sources, each bounded by a finite strength $d_(*)$, have the following support and full-strength regions:

#[#set math.equation(numbering: n => "(5.9)")
 $ & upright("vanishes if") & upright("equals ") d_(*) upright(" if")\
P_1 & f lt.eq M \/ 2 med upright("or ") w gt.eq 4 T & f gt.eq 3 M \/ 4 \, quad w lt.eq 2 T\
P_2 & N gt.eq 4 epsilon.alt med upright("or ") w gt.eq 4 T_2 & N lt.eq 3 epsilon.alt \, quad w lt.eq
  2 T_2 . $ <eq:ah-penalty-cutoffs>]

Here $T_2 = C_2 \( M \, L \) \/ epsilon.alt$, with $C_2$ fixed below before $epsilon.alt$ is chosen.
  During the continuation, multiply both the volume source and $P_1 + P_2$ by $t$;
  we continue to denote the scaled sources by $Sigma$, $P_1$, $P_2$, and $P = P_1 + P_2$.
  All strengths and heights remain finite when solving the equations.
  The limit $R arrow.r oo$ is always taken with these internal parameters fixed.

=== 5.2 Lapse estimates with only bounded drift <lapse-estimates-with-only-bounded-drift>

#thm([Lemma 5.2.])[
  #emph[For smooth solutions on sufficiently large truncations, uniformly over $0 lt.eq t lt.eq
    1$ and $b_S in cal(B)_M$,
#[#set math.equation(numbering: n => "(5.10)")
 $ N lt.eq C r \, wide N gt.eq c \( M \) epsilon.alt r \, wide frac(\| N - V_0 \|, r) lt.eq
   C \( R_s \/ r \)^(1 + kappa) quad \( r gt.eq 2 R_s \) \, $ <eq:ah-lapse-bounds>]

 where $0 < kappa < tau - 1$ is fixed and small. The upper constant uses only the $L^(p_1)$ bound of $b_S$.
   On compact sets, $N$ has uniform Hölder and $W^(1 \, q)$ bounds for some $q > 3$, depending on $M \, L$,
   but independent of $epsilon.alt \, d_(*)$ and derivatives of $b_S$.]
  #emph[The positivity and lower bound remain true at a fixed point in which the drift $Z =
    K \( v \)$ is computed using a smooth positive extension of the constitutive lapse argument,
    provided that the actual lapse equation is $"div"_g \( nabla N - Z N \) = 3 N + Sigma$ and the cutoff $N lt.eq
    epsilon.alt$ uses the actual lapse.]
] <lem:ah-lapse>

#proof[
  Only $\| Z \| lt.eq \| K \|$ is used. First consider the density equation
  #[#set math.equation(numbering: n => "(5.11)")
   $ "div"_g \( nabla H_1 - Z H_1 \) = 3 H_1 $ <eq:ah-homogeneous-lapse>]
  with the prescribed outer flux and inner outward flux $t b_S$.
    Its adjoint is $Delta_g + Z dot.op nabla - 3$, with ordinary homogeneous Neumann boundary condition.
    The maximum and boundary point principles give zero adjoint kernel.
    Scalar elliptic Fredholm theory, deforming the lower terms to those of $Delta_g - 3$,
    gives index zero and hence unique solvability of the primal problem.
    Green’s identity with the adjoint solution of a nonnegative forcing, which is nonpositive, proves $H_1 gt.eq
    0$: both prescribed outward fluxes are nonnegative, and the outer one is strictly positive.
    Local Harnack then gives strict positivity.
  We give the weighted estimate used here, including its uniformity in the outer radius.
    For $- Delta_g + 3$, scalar and divergence forcing of size $O \( r^(- j) \)$, $0 < j < 3$,
    with natural flux data in $L^(p_1) \( S \)$ and of size $O \( R^(- j) \)$ on $S_R$,
    yield an $O \( r^(- j) \)$ solution, with a constant independent of $R$.
    The natural datum includes the flux of the divergence forcing.
    To see this, construct a positive strict supersolution comparable to $r^(- j)$,
    constant on a fixed inner region. Change its logarithmic slope slowly from $0$ to $-
    j$ in a long interval of $log r$ lying sufficiently far out.
    The limiting radial indicial slopes are $- 3$ and $1$, so this retains $\( - Delta_g + 3 \) phi gt.eq c phi$.
    Add a fixed sufficiently large multiple of $R^(- j - a) r^a$, similarly continued as a constant inside,
    where $0 < a < 1$, to make its outer normal derivative nonnegative.
    The resulting barrier stays comparable to $r^(- j)$ on $r lt.eq R$.
  For divergence forcing the barrier argument is justified by normalization and compactness.
    If the asserted bound fails, divide a violating solution by the maximum of its absolute value relative to the
    barrier, and normalize locally by the barrier’s size at a maximizing point.
    The normalized forcing and boundary data tend to zero. Local Laplace $W^(1 \, q)$ estimates are available with
    $3 < q < 3 p_1 \/ 2$: the boundary $L^(p_1)$ datum belongs to the required negative trace space by the
    two-dimensional boundary Sobolev embedding. These estimates give local uniform compactness.
    The outer sphere charts have uniformly controlled geometry.
    They may be formed by flowing $nabla eta \/ \| d eta \|^2$, $eta = "arsinh" r$;
    the normal direction is orthogonal and the reflected principal metric is uniformly Lipschitz.
    Thus no high derivatives of geodesic normal coordinates are needed.
    At points escaping to infinity, subsequences of the normalized geometries converge to hyperbolic geometry,
    the relative radius to an exponential horospherical coordinate, and a nearby outer boundary to a horosphere.
    The strict supersolution and its Neumann sign persist in these limits.
    A nonzero maximum of the limiting solution divided by that supersolution contradicts the maximum or boundary
    point principle. The same argument in a fixed chart handles bounded maximizing points.
    This proves the claimed estimate.
  Apply it to $H_1 - V_0$, retaining the drift as divergence forcing.
    The background errors are $O \( r^(1 - tau) \)$, and $Z = O \( r^(- tau) \)$. It follows that
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| H_1 - V_0 \| lt.eq C r^(- kappa) . $ <eq:ah-homogeneous-asymptotic>]
  Here and below $V_0$ is extended smoothly across the compact part.
    There is one additional compactness point in this application:
    a failure with bounded maximizing points could produce a nonzero limit $H_compose gt.eq 0$,
    with bounded measurable limit drift, zero natural flux, and $H_compose = O \( r^(- kappa) \)$, solving (5.11).
    The sign follows from positivity of $H_1$ before subtracting $V_0$ and dividing by an unbounded normalizing
    constant. Regard $Z H_compose$ as divergence forcing for $- Delta_g +
    3$ and apply the preceding estimate repeatedly. This improves the decay to $O \( r^(- j') \)$ for some $2 <
    j' < 3$. To justify each improvement on the full exterior,
    solve the baseline problem on truncations with zero natural outer flux and pass to a limit;
    its difference from $H_compose$ decays in the previous weight and vanishes by the maximum principle.
    The improved decay is integrable. Testing the density equation with radial cutoffs,
    equal to one near the finite boundary, and moving the Laplacian onto the cutoffs gives $3 integral_Omega
    H_compose = 0$. All shell terms vanish since $j' > 2$. This is impossible.
    On bounded limiting truncations the same contradiction follows by integrating the zero-flux equation directly.
    This proves (5.12) with the asserted uniformity. For $b_S = 0$, Harnack,
    also by homogeneous-flux reflection at $S$, and connectedness now give $H_1 gt.eq c r$.
  The dual maximum principle compares $N$ to the homogeneous solution with the same drift and boundary data,
    giving $N lt.eq H_1 lt.eq C r$. For the lower bound divide $N$ by the homogeneous solution with the same drift
    and $b_S = 0$. If this ratio is below $c epsilon.alt \/ R_s$, with $c$ sufficiently small, then $N lt.eq
    epsilon.alt$ wherever the spatial cutoff permits $Sigma eq.not 0$. Hence $Sigma = 0$ on this sublevel.
    The ratio there solves an elliptic drift equation with no zeroth term.
    Its outward derivative is nonnegative at the inner face and strictly positive at the outer face when the ratio
    is below the threshold. The minimum and boundary point principles therefore exclude such a minimum.
    This proves the positive floor, and also excludes negative lapses when constitutive arguments have been extended.
  Finally, on $2 R_s lt.eq r lt.eq R$, subtract $V_0$ and treat $Z
    N$ as divergence forcing of size $O \( r^(1 - tau) \)$. The inner Dirichlet values have size $O \( R_s \)$,
    and the natural outer error has the corresponding decaying size.
    The weighted argument above, now with the inner Dirichlet face, gives
  $ \| N - V_0 \| lt.eq C R_s^(1 + kappa) r^(- kappa) . $
  The homogeneous contribution of the inner data is bounded by the same barriers.
    In the normalized argument the zero Dirichlet trace also excludes a limit maximum at that face.
    This proves the final estimate in (5.10). On fixed patches write the lapse equation as a metric Laplace
    equation with bounded divergence forcing $Z N$, bounded scalar forcing $3 N + Sigma$,
    and the prescribed $L^(p_1)$ boundary data. The local $W^(1 \, q)$ and Hölder estimates from Proposition 8
    prove the last assertion. ◻
]

=== 5.3 Finite slopes and uniform estimates at infinity <finite-slopes-and-uniform-estimates-at-infinity>

#thm([Lemma 5.3.])[
  #emph[The solutions satisfy $0 lt.eq f lt.eq t M$. On every fixed compact subset, including $S$,
#[#set math.equation(numbering: n => "(5.13)")
 $ s gt.eq c_(upright("loc")) \( M \, L \) epsilon.alt \, $ <eq:ah-s-floor>]

 and their height gradients have finite bounds for fixed $M \, L \, epsilon.alt$, independent of $d_(*)$, $R$,
   and derivatives of $b_S$. Moreover,
#[#set math.equation(numbering: n => "(5.14)")
 $ integral_({ f in I }) p dot.op d f & lt.eq C \| I \| \, wide
   integral_(Omega_R) \( W^2 - 1 \) thin #h(-0.16667em) upright(d) V_g lt.eq C M \,\
\| f \| & lt.eq C R_s^(- 1) \( R_s \/ r \)^(4 - xi) \,\
\| v \| + \| pi \| + \| nabla pi \| & lt.eq C \( R_s \/ r \)^(3 - xi) quad \( r gt.eq C_0 R_s \) \,
  $ <eq:ah-height-energy>]

 where $I$ is any height interval, $xi > 0$ can be fixed sufficiently small,
   and the constants in (5.14)–(5.14) are independent of $M \, L \, epsilon.alt \, d_(*)$ for large $M$.
   The end estimates include the corresponding local Hölder control and derivatives of $v$ through order two.]
] <lem:ah-graph-estimates>

#proof[
  The maximum principle for $"div"_g p = 0$ gives the height bound.
    We spell out how the differential estimate in Lemma 12 supplies all the finite bounds used here.
    At nonzero gradient write
  $ z = \| v \| \, quad y = z^2 \, quad m_f = \| d f \| \, quad q = frac(1 - y, 1 + y) \, quad beta = 1 + q \,
    quad cal(P) = g^(- 1) + \( q - 1 \) e ⊗ e \, quad e = nabla f \/ m_f . $
  The height equation is $cal(P) : nabla^2 f + beta thin d log N dot.op d f = 0$.
    At an interior maximum of $G + j \( f \) + d_0$, where $G = - log s$, $j' < 0$, $j'' > 0$, and $y gt.eq
    1 \/ 2$, that lemma gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ j'' q m_f^2 lt.eq C [1 + Sigma / N + \( 1 - y \)^2 \( j' m_f \)^2 + \| d d_0 \|^2 + \| nabla^2 d_0 \|] .
     $ <eq:ah-gradient-maximum>]
  Its hypotheses hold because the lapse equation has precisely the drift $K \( v \)$,
    the tensor $K$ and its divergence are bounded on the relevant patches, and $Sigma gt.eq 0$.
    The cancellation of the Hessian of $log N$ in that lemma requires no prior second-derivative estimate for $N$.
    Multiplying (5.15) by $N^2$ controls $\( 1 - y \)^(- 1)$, using $N m_f =
    z \/ \( 1 - y \)$ and the upper lapse bound; a positive lower lapse is not needed in this step.
  At either constant-height face let $n$ point towards increasing end direction.
    When $d f eq.not 0$, $e = - n$, and the boundary part of the same lemma gives
  $ G_n = - frac(y H_g + partial_n log N, 1 - y) . $
  At $S$, $partial_nu log N = - z k - t b_S \/ N$, so $G_nu gt.eq z k \/ \( 1 + z \)$, a uniform lower bound.
    Since $j' f_nu = - j' m_f > 0$, a maximum at this face bounds $m_f$.
    At $S_R$, $H_g$ is bounded below by a positive constant, $K = o \( 1 \)$, and $N partial_(nu_R) log N =
    K \( p \, nu_R \) + partial_(nu_R) V_0$. Taking $\| j' \|$ sufficiently small makes the outward derivative of
    $G + j \( f \)$ negative at large $y$, bounded above by $- c \/ \( 1 - y \)$.
    Thus an outer maximum is excluded, or its slope is bounded by a localization derivative.
    A sufficiently small decreasing exponential $j$ has both required derivative signs.
  On a compact truncation these arguments give a finite global slope bound.
    To make it independent of $R$ locally, set $d_0 = k_0 log chi$, $k_0 gt.eq 2$,
    where $chi$ is a smooth cutoff on a slightly larger compact region,
    constant normally near $S$ if that face is present. Equation (5.15) bounds $W chi$ at an interior maximum;
    the preceding face argument does the same at $S$. When $y < 1 \/ 2$ this bound is immediate.
    Applying the lapse floor to the weighted maximum gives (5.13).
  Since $\| p \| lt.eq N$, the flux through $S$ is bounded independently of all internal large parameters.
    Test $"div"_g p = 0$ with a clipped height whose derivative is one on $I$ and zero elsewhere.
    Its boundary oscillation is at most $\| I \|$, giving the first estimate in (5.14).
    The identity $p dot.op d f = W^2 - 1$, tested with the entire height, gives the second one.
  We next prove the initial uniform end bound $f lt.eq C \/ r$;
    it cannot be obtained from a compact-region bound depending arbitrarily on $M$.
    By Lemma 21, $N asymp r$ when $r gt.eq C R_s$, for a fixed large $C$.
    Fix a radial segment of $eta$-length at most one starting at radius $r_(*)$ there, and set $F = r_(*) f$.
    In a bounded number of uniformly controlled metric charts covering its neighborhood,
    consider the subgraph of $F$ in the product with a Euclidean line. The product vector
  $ cal(Z) = \( - p \/ r_(*) \, 1 \) $
  is bounded and divergence free. Its pairing with the upward graph normal is
  $ frac(1 + p dot.op d f, sqrt(1 + r_(*)^2 \| d f \|^2)) = W^2 / sqrt(1 + r_(*)^2 \| d f \|^2) gt.eq c > 0 \, $
  using $N \/ r_(*) asymp 1$ and the constitutive relation.
    The divergence theorem therefore makes the subgraph locally quasiminimizing for perimeter,
    with a uniform constant. Filling or emptying a product ball bounds the graph perimeter there by a constant
    times the trace area of either phase. The four-dimensional isoperimetric inequality then gives,
    for the positive volume $V \( h \)$ of either phase in a ball, $V' \( h \) gt.eq c V \( h \)^(3 \/ 4)$.
    Integration yields uniform two-sided volume density, and relative isoperimetry yields a fixed positive
    graph-area lower bound in each sufficiently small ball centered on the graph.
  If the height span of $F$ on the radial segment is $D$, choose graph points with separated heights and disjoint
    fixed-size product balls. The preceding estimate bounds the graph area in the surrounding tube and relevant
    height band below by $c D - C$. Conversely, the constitutive relation gives $sqrt(1 + r_(*)^2 \| d f \|^2)
    lt.eq C \( 1 + p dot.op d f \)$. The base tube has bounded volume and the relevant interval of $f$ has length
    at most $C \( D + 1 \) \/ r_(*)$. Equation (5.14) bounds the graph area above by $C + C \( D + 1 \) \/ r_(*)$.
    For large fixed starting radius this bounds $D$ uniformly.
    If the segment meets $S_R$, oddly reflect $f$, evenly reflect $N$,
    and reflect the metric in the orthogonal charts described in the lapse proof.
    The zero trace of $f$ makes the divergence equation valid weakly after reflection.
    The reflected height band adds only an interval of comparable length to the energy estimate.
    Thus the same estimate holds there. Summing the bounds $C \/ r_(*)$ over consecutive outward unit segments,
    up to the zero height at $S_R$, proves $f lt.eq C \/ r$.
  On far-out unit balls rescale $\( f \, N \, p \, s \)$ by
    $\( r_(*) \, r_(*)^(- 1) \, r_(*)^(- 1) \, r_(*)^(- 1) \)$, respectively.
    The equations there have $Sigma = 0$ and retain their form.
    The localized gradient estimate now gives uniform bounds for the rescaled height gradient and uniform
    ellipticity. The outer-face argument applies with its rescaled positive flux datum.
    The rescaled lapse has uniform $W^(1 \, q)$ bounds. Differentiating the divergence height equation,
    or using difference quotients, gives scalar uniformly elliptic divergence equations for its first derivatives,
    with divergence forcing in $L^q$, $q > 3$. The inhomogeneous Hölder estimate therefore bounds $d
    f$ in a Hölder norm, also at a constant-height boundary by odd reflection.
    The lapse divergence equation then gives $C^(1 \, gamma)$ control,
    followed by the nondivergence height equation and successive Schauder estimates.
    These steps use only the stated $C^(2 \, alpha)$ metric and $C^(1 \, alpha)$ tensor bounds.
    They also prove compact-set gradient Hölder estimates away from infinity without differentiating $b_S$.
  On each far-out ball, the energy estimate for a height interval of length $C \/ r_(*)$,
    together with this Hölder control, implies $z = o \( 1 \)$ uniformly as $r_(*) arrow.r oo$.
    The derivative version of (5.10) implies that $nabla log N$ tends to the hyperbolic radial direction as $r \/
    R_s arrow.r oo$. The limiting height operator is $Delta_b + 2 thin d eta dot.op d$;
    its decaying radial indicial root is $- 4$. For any sufficiently small fixed $xi > 0$,
    a positive multiple of $r^(- 4 + xi)$ is therefore a strict supersolution sufficiently far beyond $R_s$.
    Comparison with the already proved $C \/ r$ bound at a fixed multiple of $R_s$ gives the first estimate in
    (5.14). Treating the actual height equation as a linear equation on these smaller height ranges gives the
    corresponding derivative bounds by Schauder theory. Inserting them in $p = s^2 nabla f$ and $pi =
    N^(- 1) "sym" nabla p^flat$ gives the remaining assertions. ◻
]

For a fixed sufficiently large $C_0$, all sources vanish when $r gt.eq C_0 R_s$.
  Indeed the height is then below $M \/ 2$, the lapse exceeds $4 epsilon.alt$,
  and the spatial cutoff for $Sigma$ has ended. In this region

#[#set math.equation(numbering: n => "(5.16)")
 $ \( Delta_(macron(g)) - 3 - U_0 \) x = - 3 \, wide U_0 = - N^(- 1) "div"_g \( \( pi - K \) p \) \,
   wide \| U_0 \|_(C_(upright("loc"))^(0 \, gamma)) lt.eq C \( R_s \/ r \)^lambda $ <eq:ah-end-x>]

for some $lambda > 3$. For example one can take any exponent below $min \( 6 - 2 xi \, tau + 3 - xi \)$,
  by (5.14). The constants here retain the independence asserted in that lemma.

=== 5.4 Costs and enforcement of the finite penalties <costs-and-enforcement-of-the-finite-penalties>

#thm([Lemma 5.4.])[
  #emph[The parameters can be chosen in the order already specified,
    with $epsilon.alt$ sufficiently small after $M \, L$, and then $d_(*)$ sufficiently large but finite, such that
#[#set math.equation(numbering: n => "(5.17)")
 $ integral_(Omega_R) P_1 thin #h(-0.16667em) upright(d) V_g lt.eq C T \/ M \, wide
   integral_(Omega_R) P_2 thin #h(-0.16667em) upright(d) V_g =
   o_(M \, L) \( 1 \) quad \( epsilon.alt arrow.b 0 \) \, $ <eq:ah-penalty-costs>]

 uniformly in $R \, b_S$, and in the strengths. At $t = 1$, the same choices enforce
#[#set math.equation(numbering: n => "(5.18)")
 $ w \|_S gt.eq T \, wide w gt.eq T_2 quad upright("on ") { N lt.eq 2 epsilon.alt } \, wide s T_2 gt.eq 1 quad
   upright("on ") { N lt.eq 4 epsilon.alt } . $ <eq:ah-penalty-targets>]

 Consequently $x < 1 - delta$ and $r lt.eq R_s$ imply $Sigma = L$.]
] <lem:ah-penalties>

#proof[
  The lapse floor confines $N < 6 epsilon.alt$ to a compact set depending on $M$, independently of $epsilon.alt$.
    Equation (5.13) on a slightly larger compact set therefore permits a choice of $C_2 \( M \, L \)$ such that $s
    T_2 gt.eq 1$ throughout the required low-lapse region.
  For every Lipschitz test $zeta$ vanishing at $S_R$, positivity of $w$, its equation, and its zero inner flux give
  #[#set math.equation(numbering: n => "(5.19)")
   $ integral P thin zeta^2 / w thin #h(-0.16667em) upright(d) V_g lt.eq
     integral A \( d zeta \, d zeta \) thin #h(-0.16667em) upright(d) V_g . $ <eq:ah-penalty-test>]
  Indeed test with $zeta^2 \/ w$ and complete the square in $2 zeta thin d w dot.op A thin d zeta \/ w -
    zeta^2 A \( d w \, d w \) \/ w^2$. All the other terms on the right side of the $w$-equation are nonnegative.
    On the support of $P_1$, $f \/ M gt.eq 1 \/ 2$ and $w lt.eq 4 T$.
    With $zeta = f \/ M$, the algebraic inequality $A \( d f \, d f \) = W - W^(- 1) lt.eq W^2 - 1 =
    p dot.op d f$ and (5.14) prove $integral P_1 lt.eq C T \/ M$.
  For $P_2$ take a cutoff of $N \/ epsilon.alt$, equal to one below $4$ and zero above $6$.
    It vanishes near $S_R$ for large $R$. Since $A lt.eq N^2 g^(- 1)$ and $w lt.eq 4 T_2$ on this source’s support,
  #[#set math.equation(numbering: n => "(5.20)")
   $ integral P_2 lt.eq C T_2 integral_({ N < 6 epsilon.alt }) \| nabla N \|^2 thin #h(-0.16667em) upright(d)
     V_g . $ <eq:ah-low-lapse-cost>]
  Test the lapse equation with $\( 6 epsilon.alt - N \)^(+)$.
    The outward current flux at $S$ is $t b_S gt.eq 0$, so its boundary contribution has the favorable sign.
    On the sublevel set $\| K p \| lt.eq C N lt.eq C epsilon.alt$. Cauchy’s inequality then gives
  #[#set math.equation(numbering: n => "(5.21)")
   $ integral_({ N < 6 epsilon.alt }) \| nabla N \|^2 lt.eq C \( M \) epsilon.alt^2 +
     C epsilon.alt integral_({ N < 6 epsilon.alt }) Sigma . $ <eq:ah-low-lapse-energy>]
  We must show that the final integral tends uniformly to zero; boundedness of $Sigma$ alone would not suffice.
    For any potentially violating sequence, use the uniform local lapse Hölder bounds to take $N_j arrow.r
    N_0 gt.eq 0$ uniformly on the compact region containing these sublevels. After a subsequence,
  $ K p_j harpoon.rt Z_0 N_0 \, wide Sigma_j harpoon.rt^(*) Sigma_0 \, wide \| Z_0 \| lt.eq C \, quad 0 lt.eq
    Sigma_0 lt.eq L . $
  The weak limit equation is $Delta_g N_0 = "div"_g \( Z_0 N_0 \) + 3 N_0 + Sigma_0$.
    We claim $Sigma_0 = 0$ almost everywhere on ${ N_0 = 0 }$.
    Choose an interior density point of that zero set which is also a Lebesgue point of $Sigma_0$.
    In balls of radius $h arrow.b 0$, rescale $N_0$ by $h^(- 2)$.
    The rescaled fields are nonnegative and vanish at the center.
    Their divergence drift has size $O \( h \)$ and their scalar forcing is bounded.
    The inhomogeneous Harnack estimate therefore gives a uniform bound on smaller balls.
    Because the rescaled zero sets have asymptotically full measure, these functions tend to zero in local $L^1$.
    Testing the rescaled equation against compactly supported smooth functions shows that the limiting constant
    scalar forcing is zero, proving the claim. Boundary points need not be considered, since $S$ has zero volume.
  For completeness, the changing sublevel sets cause no loss:
    for every $a > 0$, uniform convergence gives ${ N_j < 6 epsilon.alt_j } subset { N_0 lt.eq a }$ eventually.
    Nonnegativity and weak convergence, using continuous cutoffs of $N_0$ that majorize this fixed sublevel, imply
  $ limsup_j integral_({ N_j < 6 epsilon.alt_j }) Sigma_j lt.eq integral_({ N_0 lt.eq 2 a }) Sigma_0 . $
  Letting $a arrow.b 0$ proves the asserted uniform convergence.
    Equations (5.20) and (5.21), with $T_2 = C_2 \/ epsilon.alt$, prove the second cost in (5.17).
    Choose $epsilon.alt = epsilon.alt \( M \)$ sufficiently small that this cost, as well as $T \/ M =
    M^(- 1 \/ 5)$, tends to zero as $M arrow.r oo$.
  Now fix $M \, L \, epsilon.alt$ and increase the finite strengths.
    The previously proved continuity of $f \, N$ supplies uniform neighborhoods of the targets $S$ and $N lt.eq
    2 epsilon.alt$ inside, respectively, the weaker triggering regions $f gt.eq 3 M \/ 4$ and $N lt.eq
    3 epsilon.alt$. The cost bounds imply that the volume in these neighborhoods where $w lt.eq 2 T$, or $w lt.eq
    2 T_2$, tends to zero as $d_(*) arrow.r oo$. For either threshold $D = T \, T_2$,
    the bounded nonnegative function $\( 2 D - w \)^(+)$ is a weak subsolution of the homogeneous divergence
    operator $"div"_g \( A thin d dot.op \)$. Its coefficients are uniformly elliptic on the relevant compact
    region for these fixed parameters, independently of the strength.
    The scalar local supremum estimate bounds its supremum on a smaller neighborhood by its $L^2$ mean on the
    larger one. At $S$, even reflection using the zero natural flux gives the same estimate.
    Choosing $d_(*)$ sufficiently large makes that supremum smaller than $D$.
    This proves (5.18), with room in the thresholds if desired.
    Finally, if $x < 1 - delta$, the second target excludes $N lt.eq 2 epsilon.alt$,
    so the volume penalty is at full strength when also $r lt.eq R_s$. ◻
]

=== 5.5 Compactness, mass, and a uniform comparison sphere <compactness-mass-and-a-uniform-comparison-sphere>

Until the existence argument below, a #emph[limit solution] means any limit along expanding truncations of smooth
  solutions at the fixed internal parameters and fixed $t$, allowing arbitrary $b_S in cal(B)_M$.
  Statements about this family are a priori statements and do not presuppose that it is nonempty.
  Pass also to a weak $L^(p_1) \( S \)$ limit of the boundary data.
  Until the selector is imposed, we use $b_S$ for this inherited datum in a limit solution:
  it need not be smooth, but its pointwise bounds, norm bound, and natural-flux identity pass to the limit.
  Its integral is the limit of the integrals of the smooth data.

#thm([Lemma 5.5.])[
  #emph[With internal parameters fixed, the fields $N \, f \, d f \,
    w$ are uniformly precompact in local uniform topology, including at $S$.
    Limit solutions have $N \, w > 0$ and are classical away from $S$. They obey
#[#set math.equation(numbering: n => "(5.22)")
 $ x - 1 = O_(upright("fixed") \, 2 \, gamma) \( r^(- 3 + xi) \) . $ <eq:ah-conformal-decay>]

 Here $xi$ is taken sufficiently small, in particular $0 < xi < min \( 3 - tau \, tau - 1 \)$.
   Their metrics $h$ satisfy the required asymptotically hyperbolic decay, all four mass fluxes are finite,
   and $V_0 \( "Scal"_h + 6 \)$ is integrable near infinity. Their time components satisfy
#[#set math.equation(numbering: n => "(5.23)")
 $ 8 pi { p_0 \( h \) - p_0 \( g \) } = t integral_S b_S thin #h(-0.16667em) upright(d) A_g +
   integral_Omega { \( x - 1 \) Sigma + P } thin #h(-0.16667em) upright(d) V_g lt.eq
   o \( 1 \) quad \( M arrow.r oo \) . $ <eq:ah-mass-budget>]

 The $o \( 1 \)$ is uniform over the allowed data, with the subsequent choices of $epsilon.alt \,
   d_(*)$ just described.]
] <lem:ah-limit-mass>

#proof[
  Only the upper bound for $w$ remains to be established. The right side of its equation is bounded on compact
    sets: $Sigma x lt.eq L$, since a nonzero $Sigma$ requires $x < 1$, and $P$ has fixed finite strength.
    By (5.10) and (5.14), a multiple of $r^(- 1)$ is a supersolution for $- "div"_g \( A thin d w \) =
    3 N$ sufficiently far beyond $R_s$. Comparison therefore bounds the end values of $w$ by
  $ C (1 + sup_({ r lt.eq C_0 R_s }) w) r^(- 1) . $
  If its compact supremum were unbounded, divide by that supremum.
    Uniform ellipticity, local divergence estimates, and convergence of $N \,
    d f$ then give a nonzero nonnegative limit satisfying the homogeneous $w$-equation,
    with zero inner flux and decaying to zero at infinity. The maximum principle excludes such a function;
    Harnack and reflection at $S$ handle a maximum at that face. Thus the compact upper bounds hold.
    Local Hölder estimates for $w$ and the already proved estimates for $N \, d f$ give the stated precompactness.
    The lapse floor and the strictly positive forcing $3 N$ in the supersolution equation imply positivity of both
    limiting fields. Scalar elliptic bootstrapping gives classical interior regularity.
  On the end, (5.16) and these upper bounds permit comparison for $x - 1$ with a multiple of $r^(- 3 + xi)$.
    For a finite truncation add $C \( r \/ R \)^(a_0)$, $0 < a_0 < 1$, to dominate its outer boundary values.
    The first term dominates the decaying forcing $U_0$, while the second vanishes on fixed sets as $R arrow.r
    oo$. The scalar zeroth coefficient is positive after increasing the fixed end radius.
    The maximum principle proves the zeroth-order bound in (5.22),
    and interior Schauder estimates prove its derivative and Hölder versions.
    These estimates are uniform over all limit solutions at the fixed parameters,
    without bounds on derivatives of $b_S$.
  Since $macron(g) - g = O_(upright("fixed") \, 2 \, gamma) \( r^(- 6 + 2 xi) \)$, the choice $xi < 3 -
    tau$ ensures that $h - b$ has the original admissible decay exponent, with a possibly smaller Hölder exponent.
    Put $phi = x - 1$. The change in each defining mass flux is, up to an error tending to zero,
    the flux of the one-form
  $ - 2 { V_mu thin d phi - phi thin d V_mu } . $
  All nonlinear conformal errors and graph terms disappear by the displayed decay. This flux has a finite limit:
    its divergence is $- 2 V_mu \( Delta_b - 3 \) phi$, and (5.16) gives absolute weighted integrability.
    Indeed $U_0 = O \( r^(- lambda) \)$, $lambda > 3$; the difference between $Delta_(macron(g))$ and $Delta_b$ on
    $phi$ is $O \( r^(- tau - 3 + xi) \) + O \( r^(- 9 + 3 xi) \)$.
    Multiplication by $V_0$ and integration against the hyperbolic volume,
    of radial size $r thin #h(-0.16667em) upright(d) r$, is integrable.
    The scalar identity (5.5), the original weighted matter and $K^2$ integrability,
    and (5.14)–(5.22) similarly prove integrability of $V_0 \( "Scal"_h + 6 \)$.
  On each limit end the lapse equation also gives
  $ \( Delta_g - 3 \) \( N - V_0 \) = O \( r^(1 - tau) \) + "div"_g \( K p \) . $
  Together with (5.10) and the end derivative estimates this yields $\| nabla \( N - V_0 \) \| =
    O_(upright("fixed")) \( r^(- kappa) \)$. Insert the second expression for $Q$ in (5.5).
    Its sphere flux differs from that of $V_0 thin d phi - phi thin d V_0$ by a quantity tending to zero.
    The $N - V_0$ terms have integrated size $O \( r^(- 1 - kappa + xi) \)$;
    the $\( pi - K \) p$ terms have integrated sizes bounded by $O \( r^(- 3 + 2 xi) \) + O \( r^(- tau + xi) \)$.
    Metric replacement errors vanish by the same decay. It follows that
  $ lim_(r arrow.r oo) integral_({ r = upright("const") }) Q dot.op nu_r thin #h(-0.16667em) upright(d) A_g = -
    8 pi { p_0 \( h \) - p_0 \( g \) } . $
  At the inner boundary the outward normal of the exterior is $- nu$, and $Q dot.op \( - nu \) = t b_S$.
    Integrating $"div"_g Q = - \( x - 1 \) Sigma - P$ proves (5.23).
    This integration remains valid for limits with only continuous fields at $S$:
    use the first expression $Q = A thin d w + B$, the weak equations and their prescribed natural fluxes on
    compact regions. The second expression is needed only at infinity, where the fields are classical.
    Finally, $\( x - 1 \) Sigma lt.eq 0$, the $L^(p_1)$ bound makes $integral_S b_S = o \( 1 \)$,
    and Lemma 23 gives $integral P = o \( 1 \)$. ◻
]

The next estimate is needed before choosing $b_S$; compact upper bounds for $w$ at fixed parameters alone would
  not give it.

#thm([Lemma 5.6.])[
  #emph[There is a fixed large $C_1$ such that, at $r_1 = C_1 R_s$, every limit solution at $t = 1$ satisfies
#[#set math.equation(numbering: n => "(5.24)")
 $ "Area"_h \( { r = r_1 } \) lt.eq C R_s^2 \, $ <eq:ah-comparison-area>]

 with $C$ independent of the internal large parameters.]
] <lem:ah-comparison-sphere>

#proof[
  On $r > r_1$ solve
  $ \( Delta_(macron(g)) - 3 - U_0 \) Y = 0 \, wide Y \|_(r = r_1) = 0 \, wide Y \/ V_0 arrow.r 1 . $
  Existence follows by solving with outer Dirichlet datum $V_0$ on larger truncations, applying positive barriers,
    and passing to a limit. Choose $xi < b_0 < min \( 1 \, tau \)$.
    Positive and negative barriers of size $C r \( r_1 \/ r \)^(b_0)$ for $Y - V_0$ work by the end estimates.
    They give $0 lt.eq Y lt.eq C r$, and the corresponding first derivative control follows from elliptic
    estimates. On an annulus from $r_1$ to a large fixed multiple of $r_1$,
    compare from below with a small positive multiple of $r_1 \( \( r \/ r_1 \)^2 - 1 \)$.
    This is a subsolution with zero inner value, and its outer value can be made smaller than that of $Y$.
    The boundary point principle and local boundary estimates therefore give, in the end direction,
  $ c r_1 lt.eq partial_n Y lt.eq C r_1 quad upright("on ") { r = r_1 } \, $
  where $n$ is the $macron(g)$-unit normal.
  For $phi = x - 1$, the operator just used satisfies $\( Delta_(macron(g)) - 3 - U_0 \) phi = U_0$.
    Green’s identity, the mass-flux calculation, and $b_0 > xi$ give
  #[#set math.equation(numbering: n => "(5.25)")
   $ integral_({ r = r_1 }) \( x - 1 \) partial_n Y thin #h(-0.16667em) upright(d) A_(macron(g)) =
     integral_({ r > r_1 }) Y U_0 thin #h(-0.16667em) upright(d) V_(macron(g)) + 8 pi { p_0 \( h \) -
     p_0 \( g \) } lt.eq C r_1^3 . $ <eq:ah-green-comparison>]
  The source integral is bounded by $C r_1^3$, since $lambda > 3$, $Y lt.eq C r$,
    and $W$ is uniformly bounded on this end region. The mass increment is bounded above by (5.23).
    Add $integral partial_n Y lt.eq C r_1^3$ to both sides of (5.25), and then use $x > 0$ and $partial_n Y gt.eq
    c r_1$. This yields $integral_({ r = r_1 }) x thin #h(-0.16667em) upright(d) A_(macron(g)) lt.eq C r_1^2$.
    Two-dimensional conformal scaling makes this integral exactly the area in (5.24). ◻
]

=== 5.6 A continuous choice of inner flux <a-continuous-choice-of-inner-flux>

#thm([Lemma 5.7.])[
  #emph[For all sufficiently large $M$, at the finite parameters chosen above,
    there is a continuous rule $frak(b)$ on the uniform topology of the fields $\( N \, f \, d f \, w \)$ on a
    fixed compact original subdomain, with values in a finite convex hull in $cal(B)_M$,
    such that every limit solution at $t = 1$ satisfies
#[#set math.equation(numbering: n => "(5.26)")
 $ frak(b) \( N \, f \, d f \, w \) > N \( H_g - z k \) $ <eq:ah-contact-majorant>]

 at every possible contact on $S$ of a perimeter-minimizing enclosure of $S$.]
] <lem:ah-contact-selector>

#proof[
  Consider all limits at $t = 1$ arising from arbitrary smooth choices $b_S in
    cal(B)_M$ on arbitrary expanding truncations. Their restrictions to each fixed compact region form a compact
    family in the uniform field topology. Precompactness follows from Lemma 24;
    closedness follows by a diagonal choice of actual truncation solutions from the defining sequences of a
    convergent sequence of limits. This definition uses no existence assertion, and the family may initially be empty.
  The fixed-parameter end estimates are uniform over this family.
    Choose a large fixed radial sphere, beyond $r_1$, so that all spheres from slightly before it to infinity are
    strictly outward mean convex in every limit metric. Adjoin smooth compact orientable handlebodies to all
    components of $S$, possible because each is a closed orientable surface.
    Choose the gluing maps to reverse the induced boundary orientations,
    so the orientation of $Omega$ extends over the caps. Let $O$ denote their union and $X$ the resulting
    one-ended smooth manifold without boundary; let $K_c$ be the compact region cut off by the chosen large
    sphere. Extend each continuous positive metric through $S$ to the cap side,
    continuously with respect to its uniform field values. For example reflect in a fixed base collar and
    interpolate to a fixed cap metric. The mixed metric entries vanish at $S$, because $f$ has constant trace.
    Perimeters of sets containing $O$ depend only on the metric outside $O$ and its boundary values.
  For each of these metrics minimize perimeter among finite-perimeter subsets of $K_c$ containing $O$ up to null
    sets. Compactness and lower semicontinuity give a minimizer.
    These facts hold for a continuous positive metric by uniform smooth approximation of the area integrands.
    The sphere at $r_1$ is an admissible comparison, so every minimizer has perimeter at most $C R_s^2$.
  Define contact points on $S$ as points in the support of a minimizer’s perimeter measure.
    The union of all such contacts equals the contact set of one minimizer.
    To prove this, minimize volume in an auxiliary fixed smooth metric among the perimeter minimizers.
    Perimeter submodularity shows that the intersection and union of any two minimizers are still minimizers.
    The volume-minimizing one, denoted $E_(-)$, is therefore contained almost everywhere in every other minimizer.
    If a contact of a second minimizer were absent from the perimeter support of $E_(-)$,
    a small ball there would have zero $E_(-)$-perimeter. Since $O$ occupies a positive part of that ball,
    the ball would be filled by $E_(-)$, and hence by the second minimizer, a contradiction.
    The contact union is consequently the closed contact set of $E_(-)$.
  These contact unions are upper semicontinuous in the uniform field topology.
    Indeed, along uniformly convergent metrics, any sequence of minimizers has an $L^1$ subsequence converging to
    a minimizer for the limit metric. At a contact point, the complement has uniform positive volume density:
    filling a chart ball is an allowed competitor, so its perimeter in the ball is bounded by a constant times its
    trace area on the sphere. Isoperimetry, applied to the complement inside the ball, gives $V^(2 \/ 3) lt.eq
    C V'$, and thus $V \( r \) gt.eq c r^3$. Constants are uniform on the compact family of positive continuous
    metrics. The cap supplies positive density for the set on the other side.
    These two density bounds persist when both the metric and the contact point converge,
    so the limit point is in the perimeter support of a limit minimizer.
  The same density bounds place all contacts in the measure-theoretic boundary.
    Up to a set of two-dimensional Hausdorff measure zero they therefore belong to the reduced boundary,
    by the finite-perimeter structure theorem. At almost every point of their intersection with the smooth surface
    $S$, the tangents are those of $S$. Since $d f$ is tangentially zero,
    the area density there is $x thin #h(-0.16667em) upright(d) A_g$. Writing $C_h$ for the contact union, we obtain
  #[#set math.equation(numbering: n => "(5.27)")
   $ integral_(C_h) x thin #h(-0.16667em) upright(d) A_g lt.eq C R_s^2 . $ <eq:ah-contact-area>]
  Set $Theta = \[ N \( H_g - z k \) \]_(+)$ on $S$. Since $H_g lt.eq k$, its positive part is bounded by $C s$.
    For example, when $k gt.eq 0$, $N \( H_g - z k \) lt.eq N k \( 1 - z \) lt.eq k s$;
    when $k < 0$ the left side is nonpositive. The upper lapse bound also gives $Theta lt.eq C$,
    with $C$ independent of the pointwise cap $B_(*)$. Fix $B_(*)$ strictly above this latter bound.
    By (5.18), $s lt.eq x \/ T$ at $S$, and hence
  #[#set math.equation(numbering: n => "(5.28)")
   $ integral_(C_h) Theta^(p_1) thin #h(-0.16667em) upright(d) A_g lt.eq
     C integral_(C_h) s thin #h(-0.16667em) upright(d) A_g lt.eq C R_s^2 \/ T =
     C M^(- 1 \/ 5) . $ <eq:ah-contact-flux-cost>]
  The admissible $p_1$-power budget in (5.8) is $M^(- 1 \/ 10)$.
    Thus for sufficiently large $M$ there is strict slack. For each field in the compact family,
    approximate its continuous nonnegative threshold on the closed set $C_h$ from above by a smooth function,
    with a small positive margin, and taper it to zero in a sufficiently small neighborhood of that set.
    Regularity of surface measure and (5.28) keep its $L^(p_1)$ norm within the budget;
    the fixed gap below $B_(*)$ keeps its pointwise values admissible.
    This constructs a datum strictly majorizing the threshold on $C_h$. When $C_h$ is empty the condition is vacuous.
  Upper semicontinuity of contacts and continuity of the threshold show that the same datum works in an open
    neighborhood of the given field in the compact limit family.
    Take a finite such cover, with associated smooth data $b_1 \, dots.h \, b_m$,
    and enlarge the neighborhoods to open subsets of the ambient uniform field space so that their intersections
    with the limit family retain this property. A continuous partition of unity,
    supplemented by the complement of the compact limit family carrying datum zero, yields $frak(b)$.
    Explicitly, distance to the complements of these finitely many open neighborhoods,
    together with distance to the compact limit family, gives nonnegative continuous weights with nonzero sum
    after a harmless subordinate refinement. Normalize and take the corresponding convex combination.
    At a field in the limit family the zero datum has weight zero,
    and every active $b_i$ is a strict majorant at all its contacts.
    Convexity preserves both constraints in (5.8). If the family is empty, use the constant zero rule.
    Only the original compact subdomain’s fields enter this rule; no trial fields on the caps are required. ◻
]

=== 5.7 Existence at fixed finite parameters <existence-at-fixed-finite-parameters>

#thm([Proposition 5.8.])[
  #emph[With the choices above, the system (5.2)–(5.4), using $b_S = frak(b) \( N \, f \, d f \, w \)$,
    has a smooth positive solution at $t = 1$ on every sufficiently large fixed truncation.
    Expanding truncations have a subsequence converging to a solution smooth up to $S$ on the whole exterior.
    It satisfies all the preceding estimates and realizes the rule $frak(b)$.]
] <prop:ah-finite-existence>

#proof[
  We describe the compact map precisely, because a frozen source need not preserve positivity of a lapse output
    away from fixed points. Fix a small Hölder exponent $gamma > 0$,
    to be decreased below the exponents in the a priori estimates,
    and use triples of $C^(1 \, gamma)$ functions on the fixed truncation.
    Choose $a > 0$ so that $2 a$ is below the fixed-point floor in Lemma 21, and a smooth function $cal(E) :
    bb(R) arrow.r \[ a \, oo \)$ equal to the identity on $\[ 2 a \, oo \)$.
  Given trial fields and $t$, first solve the linear nondivergence height equation, freezing $cal(P) \, beta \,
    d log cal(E) \( N \)$ from the trial arguments, with Dirichlet values $t M$ and zero.
    At zero trial gradient the smooth continuations are $cal(P) = g^(- 1)$ and $beta = 2$.
    The first-order coefficient acts on the new height. Next compute $v$ from this new height and the extended
    trial lapse, and set $Z = K \( v \)$. Solve the linear density equation for the raw new lapse:
  $ "div"_g \( nabla N_(upright("new")) - Z N_(upright("new")) \) = 3 N_(upright("new")) + Sigma_(upright("trial")) . $
  Use the prescribed outer current flux and inner current flux $- t frak(b)$ evaluated on the trial fields.
    The source here is frozen from the trial fields, including the raw trial lapse in its cutoff at $N lt.eq
    epsilon.alt$. The scalar multiplying the drift and the zeroth term is the raw output lapse,
    not $cal(E) \( N_(upright("new")) \)$. The adjoint argument in Lemma 21 proves unique linear solvability.
  Finally solve a linear $w$-equation whose coefficient $A$ is formed from the new height and
    $cal(E) \( N_(upright("new")) \)$. Its right side is
  $ 3 cal(E) \( N_(upright("new")) \) + Sigma_(upright("trial")) x_(upright("trial"))^(+) +
    P_(upright("trial")) \, wide x_(upright("trial"))^(+) =
    s \( cal(E) \( N_(upright("trial")) \) \, d f_(upright("trial")) \) \( w_(upright("trial")) \)^(+) . $
  It has the zero inner natural flux and the prescribed positive outer Dirichlet datum.
    The three solves are sequential, and define a continuous compact map $cal(T)_t$.
    Both frozen sources include their prescribed factor $t$. Indeed bounded sets of input fields give uniform
    ellipticity and Hölder coefficients. The height output is bounded in $C^(2 \, gamma)$,
    so the drift in the lapse step is $C^(1 \, gamma)$; its inverse estimates are uniform on bounded input
    sequences by Schauder theory, coefficient compactness in a lower exponent,
    and the zero-kernel adjoint argument. The lapse output and then the $w$ output have second-order Hölder
    bounds. The rule $frak(b)$ has values in a fixed finite convex hull of smooth functions,
    hence uniform bounds of every spatial derivative. The compact embedding of these $C^(2 \, gamma)$ bounds into
    $C^(1 \, gamma)$ proves compactness. The same estimates and uniqueness prove continuity without
    differentiating the selection rule.
  At a fixed point, the cutoff in the actual lapse variable and the bounded drift give the positive floor in
    Lemma 21. Thus every extension $cal(E)$ becomes the identity.
    The last equation and positive outer datum give $w > 0$, so the positive part also disappears.
    Every fixed point therefore satisfies the original equations and boundary data.
  All such fixed points for $0 lt.eq t lt.eq 1$ have bounded $C^(1 \, gamma)$ norms for the fixed truncation and
    fixed parameters. Here is the regularity chain underlying this assertion.
    The lapse bound, height gradient bound, and bounded sources give lapse $W^(1 \, q)$ estimates, $q > 3$,
    and Hölder estimates for the height gradient, as in Lemma 22.
    The lapse divergence equation then gives $C^(1 \, gamma')$ estimates for some $gamma' > 0$;
    its scalar-forcing portion can equivalently be estimated by the Laplace $W^(2 \, q)$ theorem.
    The selected boundary data have bounded smooth norms. The nondivergence height equation gives
    $C^(2 \, gamma')$ estimates, after decreasing $gamma'$ if necessary.
    The $w$-equation has bounded forcing, since $Sigma x lt.eq L$ and $P$ has finite strength.
    Mixed-boundary coercivity first gives an $H^1$ bound, then scalar local boundedness and Hölder estimates give
    a uniform bound and continuity. Successive Schauder estimates now give second-order Hölder bounds for all
    fields. Take the Banach exponent $gamma < gamma'$. The same bootstrap makes every fixed point smooth.
  At $t = 0$, the map is constant. The first output is $f_0 = 0$,
    so the drift in the second step is zero independently of the input.
    Its output is the unique positive solution $N_0$ of $Delta_g N_0 = 3 N_0$,
    with zero inner flux and the prescribed outer flux. The third output $w_0$ uses $cal(E) \( N_0 \) = N_0$,
    by the homogeneous lapse floor, and is the unique solution of
  $ - "div"_g \( N_0^2 nabla w_0 \) = 3 N_0 \, wide partial_nu w_0 \|_S = 0 \, wide w_0 \|_(S_R) = 1 \/ V_0 . $
  In general $w_0 eq.not 1 \/ N_0$, because the outer lapse condition is Neumann.
    Choose a ball in the Banach space containing this constant output and all homotopy fixed points.
    On its boundary $"Id" - cal(T)_t$ never vanishes, and its Leray–Schauder degree is $+ 1$ at $t = 0$.
    Homotopy invariance gives a fixed point at $t = 1$.
  Now let $R arrow.r oo$. The fixed-parameter compact estimates give a subsequential limit on every compact set,
    and a diagonal subsequence gives a global limit. It belongs to the family used to define $frak(b)$.
    Uniform convergence of $\( N \, f \, d f \, w \)$ on its defining compact domain implies convergence of the
    selected datum, in every spatial norm because its range is a finite smooth convex hull.
    Thus the limit realizes the rule, and the elliptic bootstrap is valid up to $S$ as well as in the interior. ◻
]

=== 5.8 A free minimal boundary <a-free-minimal-boundary>

Apply Proposition 27 at $t = 1$. For this smooth metric, extend through the cap side smoothly,
  and consider the perimeter minimization in Lemma 26. Equation (5.6) and the strict majorant give $H_h \( S \) <
  0$ at every possible contact. This excludes contact without any assumed regularity of the minimizing surface at
  the obstacle.

Here is the finite-perimeter argument. Near the closed contact set,
  the unit normals to sufficiently small parallel outward collars of $O$ have negative divergence.
  Off a neighborhood of that set, a thin collar is already filled up to null sets:
  there is no perimeter support on $S$, and the cap side is filled.
  Adjoin the entire collar of width $a$ to a minimizer. For almost every sufficiently small $a$,
  Gauss–Green and slicing bound the perimeter change above by the integral of that negative divergence on the
  added part. The comparison field has unit flux on the new outer leaf,
  and its flux across the removed old boundary is bounded by the area removed.
  If contact existed, the complement density proved above would give positive added volume,
  so the perimeter would strictly decrease. This is impossible.

There is likewise no contact with the outer constraint $partial K_c$.
  The outward normals to the far coordinate spheres have positive divergence,
  so cutting away the outside part of a competitor decreases perimeter whenever it removes positive volume.
  Gauss–Green and slicing make this statement valid for finite-perimeter competitors at almost every cutting
  radius. It also shows that no larger precompact competitor, unconstrained by $K_c$, can have smaller perimeter:
  first trim it by such a sphere.

All minimizing boundaries are therefore free, locally perimeter minimizing in a smooth three-dimensional metric.
  Interior codimension-one minimizing-boundary regularity gives smooth compact embedded minimal boundaries.
  Choose a largest minimizer $E$, by maximizing auxiliary volume among the minimizers in $K_c$.
  Its open representative contains $O$ compactly in its interior and is strictly outward minimizing:
  equality for an enclosure differing by positive volume would contradict volume maximality after trimming.
  Every component of $E$ meets $O$, since an unattached component could be removed with a strict perimeter saving.
  Its open exterior is connected, since filling any bounded exterior component would also save perimeter.

Write

#[#set math.equation(numbering: n => "(5.29)")
 $ A_h = "Area"_h \( partial E \) > 0 . $ <eq:ah-hull-area>]

The closed exterior $X \\ E$, with its boundary included, is smooth, connected, complete, orientable,
  and one-ended. Its orientation is the restriction of the orientation of $X$;
  the graph and conformal changes alter the metric, not this orientation.
  Its compact truncations are compact, and its end is asymptotically hyperbolic.
  It satisfies $"Scal"_h gt.eq - 6$ by (5.5), and its weighted scalar integrability and finite mass fluxes were
  verified in Lemma 24. Its minimum enclosing area is exactly $A_h$.
  Indeed any admissible end-side domain in this closed exterior, on taking the complement of its interior in $X$,
  supplies a precompact finite-perimeter enclosure of $E$. Its perimeter is bounded by the entire intrinsic
  boundary area specified in the definition, including any part coinciding with $partial E$.
  Outward minimization gives the lower bound $A_h$, and the original boundary itself gives equality.

The time-symmetric hypothesis of Theorem 20 is thus applicable to this fixed metric and gives

#[#set math.equation(numbering: n => "(5.30)")
 $ p_0 \( h \) gt.eq F \( A_h \) gt.eq 0 . $ <eq:ah-ts-application>]

No causal property of the intermediate mass covector has been used.

=== 5.9 The weighted bad-volume estimate and conclusion <the-weighted-bad-volume-estimate-and-conclusion>

Suppose first that $A_(*) > 0$, fix $0 < epsilon_(*) < 1$,
  and choose the preceding $delta$ sufficiently small for Proposition 19.
  Fix a sufficiently large projection radius $r_p$ and put

$ rho = min \( 1 \, r_p^2 \/ r^2 \) \, wide cal(D) = { x < 1 - delta } . $

By (5.23) and (5.30),

$ integral_Omega \( 1 - x \) Sigma = integral_S b_S + integral_Omega P - 8 pi { p_0 \( h \) - p_0 \( g \) } lt.eq C . $

The constant is independent of $M$. Lemma 23 makes $Sigma = L$ on $cal(D) ∩ { r lt.eq R_s }$, and $1 - x gt.eq
  delta$ there. Consequently

$ "Vol"_g \( cal(D) ∩ { r lt.eq R_s } \) lt.eq C \/ L . $

Since $W lt.eq 1 + sqrt(W^2 - 1)$, Cauchy–Schwarz and (5.14) give an inner weighted volume bound
  $C \( L^(- 1) + sqrt(M \/ L) \)$. For large $M$, $R_s > r_p$. The asymptotically hyperbolic volume element gives

$ integral_({ r > R_s }) rho^(3 \/ 2) thin #h(-0.16667em) upright(d) V_g lt.eq C \/ R_s \, wide
  integral_({ r > R_s }) rho^3 thin #h(-0.16667em) upright(d) V_g lt.eq C \/ R_s^4 \, $

where $r_p$ is fixed and absorbed into $C$. A second application of Cauchy–Schwarz yields

#[#set math.equation(numbering: n => "(5.31)")
 $ integral_(cal(D)) rho^(3 \/ 2) W thin #h(-0.16667em) upright(d) V_g lt.eq
   C (L^(- 1) + sqrt(M \/ L) + R_s^(- 1) + sqrt(M) / R_s^2) arrow.r 0 . $ <eq:ah-bad-volume>]

For the choices (5.7), all four powers tend to zero.

We check the hypotheses of the area-transfer proposition explicitly.
  The capped smooth manifold $X$ and cap set $O$ are fixed,
  so the relevant second Betti number of $X \\ "int" O$ is finite and fixed.
  The chosen $E$ is a cap-only largest minimizing enclosure, has a free smooth compact minimal boundary,
  contains $O$ compactly, is strictly outward minimizing, and each component meets $O$.
  The comparison metric is the smooth $h = x macron(g)$; here there is no seam or smoothing error.
  It obeys $macron(g) gt.eq g$, $#h(-0.16667em) upright(d) V_(macron(g)) = W thin #h(-0.16667em) upright(d) V_g$,
  and $"Scal"_h gt.eq - 6$ outside $E$. Its asymptotically hyperbolic end supplies the proper subsolution required
  in Proposition 19. Lemma 18 gives, on every relevant enclosing level with connected exterior,

$ integral rho thin #h(-0.16667em) upright(d) A_g gt.eq \( 1 - o_(r_p) \( 1 \) \) A_(*) . $

Choose $r_p$ first to make this error sufficiently small for the fixed $epsilon_(*)$, then choose $delta$,
  and finally take $M$ large. The proposition’s temporary conformal modification for starting the flow may be
  arbitrarily small at each fixed metric and leaves the initial area unchanged.
  Its uniform scalar lower bound therefore has the required fixed constant, for example $7$.
  Equation (5.31) meets the remaining smallness hypothesis. Proposition 19 gives

#[#set math.equation(numbering: n => "(5.32)")
 $ A_h gt.eq \( 1 - epsilon_(*) \) A_(*) . $ <eq:ah-area-conclusion>]

Combine (5.23), (5.30), and (5.32). For every fixed $epsilon_(*) > 0$ and arbitrarily large $M$,

$ p_0 \( g \) + o \( 1 \) gt.eq F #scale(x: 120%, y: 120%)[\(] \( 1 - epsilon_(*) \) A_(*)
  #scale(x: 120%, y: 120%)[\)] . $

First let $M arrow.r oo$, then $epsilon_(*) arrow.b 0$, using continuity of $F$.
  If $A_(*) = 0$, no area transfer is needed: $F \( A_h \) gt.eq
  F \( 0 \)$ and the mass budget give the same conclusion directly. This proves Theorem 20.

== 6 Electrostatic stress and the asymptotically flat attachment <sec:stress-extension>

Throughout this section, $\( Omega \, g \)$ is a smooth connected exterior with the topology, completeness,
  spherical end, tensor decay, and weighted scalar integrability specified in Section 1. We assume

#[#set math.equation(numbering: n => "(6.1)")
 $ R_g gt.eq - 6 \, wide H_g \( S \) lt.eq 0 \, $ <eq:stress-base-assumptions>]

and make no causal assumption on its mass covector. The normal on $S$ points into $Omega$. Fix the end chart, and put

#[#set math.equation(numbering: n => "(6.2)")
 $ A_(*) = A_min \( S \; g \) \, wide a = sqrt(A_(*) \/ \( 4 pi \)) . $ <eq:stress-area-radius>]

The objective is to construct a compact inner region and a scalar-flat $upright("AF")$ exterior whose mass is at
  most $p_0 \( g \) - a^3 \/ 2$, up to an arbitrarily small error.
  The tensor introduced for this purpose is synthetic: it is not the second fundamental form of the original data.
  We denote the electrostatic stress by $Pi$, reserving $pi$ for the graph second form in the subsequent construction.

=== 6.1 A conformal approximation of the end <a-conformal-approximation-of-the-end>

#thm([Proposition 6.1.])[
  (End approximation).  #emph[Under (6.1), there are smooth metrics $g_j$ on the same exterior such that
    $R_(g_j) > - 6$, $H_(g_j) \( S \) lt.eq 0$, $g_j arrow.r g$ locally in $C^2$, and
#[#set math.equation(numbering: n => "(6.3)")
 $ \( 1 - epsilon.alt_j \) g lt.eq g_j lt.eq \( 1 + epsilon.alt_j \) g \, quad epsilon.alt_j arrow.b 0 \, wide
   p_0 \( g_j \) arrow.r p_0 \( g \) . $ <eq:stress-density-convergence>]

 Each $g_j$ has the required weighted scalar integrability and finite mass fluxes.
   Outside a compact set, depending on $j$, it is of the form
#[#set math.equation(numbering: n => "(6.4)")
 $ g_j = phi.alt_j^4 b \, wide phi.alt_j = 1 + alpha_j \( omega \) r^(- 3) + O \( r^(- 3 - xi) \) \,
   $ <eq:stress-conformal-end>]

 where $xi > 0$ can be fixed and the remainder has the same decay after any fixed finite number of angular and
   radial-logarithmic derivatives. In particular $A_min \( S \; g_j \) arrow.r A_min \( S \; g \)$.]
] <prop:conformal-approximation>

#proof[
  Choose $j_0$ with $3 \/ 2 < j_0 < tau$, where $tau$ is the original end decay exponent.
    Extend $r$ to a smooth positive function on the compact part.
    For large $B$, let $chi_B$ be a smooth radial cutoff equal to one for $r lt.eq B$ and zero for $r gt.eq 2 B$,
    with a fixed profile in $r \/ B$. Set
  $ g_B = b + chi_B \( g - b \) $
  on the end and $g_B = g$ on the compact part. For sufficiently large $B$ this is positive definite,
    and its uniform metric charts and $C^(2 \, alpha)$ bounds can be chosen independently of $B$.
    Fix a smooth $k > 0$ equal to $r^(- 4)$ far out. We seek a small $u$ with $partial_nu u = 0$ on $S$ satisfying
  #[#set math.equation(numbering: n => "(6.5)")
   $ - 8 Delta_(g_B) u + \( R_(g_B) + 6 \) \( 1 + u \) +
     6 #scale(x: 120%, y: 120%)[\(] \( 1 + u \)^5 - \( 1 + u \) #scale(x: 120%, y: 120%)[\)] =
     chi_B \( R_g + 6 \) + delta k . $ <eq:stress-density-equation>]
  The constant-term discrepancy, excluding $delta k$, is supported in $B < r < 2
    B$ and is $O \( r^(- tau) \)$ in local $C^(0 \, alpha)$ norms.
    Consequently it tends to zero in the scalar weighted norm of weight $r^(- j_0)$.
    Also $R_(g_B) + 6 gt.eq - o \( 1 \)$ uniformly, because it equals the nonnegative $R_g + 6$ on the inner part,
    vanishes beyond $2 B$, and is $O \( B^(- tau) \)$ on the intervening annulus.
  For completeness, the linearized operator divided by eight is
  $ cal(L)_B = - Delta_(g_B) + 3 + \( R_(g_B) + 6 \) \/ 8 . $
  It has an inverse, with homogeneous Neumann condition, bounded uniformly from weighted $C^(0 \, alpha)$ to
    weighted $C^(2 \, alpha)$ at weight $j_0$ (a smaller Hölder exponent may be used).
    To prove the required supremum bound, take a positive function $beta$ constant on a large compact set,
    comparable to $r^(- j_0)$ at infinity, and let its logarithmic slope decrease slowly from zero to $-
    j_0$ as a function of $log r$. For the limiting radial operator,
  $ \( - partial_eta^2 - 2 partial_eta + 3 \) e^(- j_0 eta) = \( 3 + 2 j_0 - j_0^2 \) e^(- j_0 eta) > 0 . $
  Every intermediate slope has the same strict sign. Slow variation of the slope,
    placement of the transition sufficiently far out, and the uniformly small negative part of
    $\( R_(g_B) + 6 \) \/ 8$ therefore give $cal(L)_B beta gt.eq c beta$ with $c > 0$ independent of large $B$.
    Here $partial_nu beta = 0$ on $S$. Solve on compact truncations with zero outer Dirichlet data.
    The maximum principle, applied to positive and negative multiples of $beta$,
    bounds the solution by the weighted norm of its forcing. Uniform local interior and Neumann Schauder estimates
    give the stated second-order bound. Compactness gives a solution on $Omega$,
    and the maximum principle gives uniqueness. This proves the inverse assertion without an assumption about
    solvability on the noncompact manifold.
  The nonlinear remainder in (6.5) is $O \( u^2 \)$ and is locally Lipschitz with Lipschitz constant tending to
    zero on small weighted balls. The uniform inverse and contraction mapping therefore give $u =
    u_(B \, delta)$ tending to zero in weighted $C_(j_0)^(2 \, alpha)$ as $B arrow.r oo$ and $delta arrow.b 0$.
    Local elliptic bootstrapping makes $u$ smooth. For small parameters $1 + u > 0$,
    and the conformal scalar-curvature formula gives, for $tilde(g) = \( 1 + u \)^4 g_B$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ R_(tilde(g)) + 6 = \( 1 + u \)^(- 5) #scale(x: 120%, y: 120%)[\(] chi_B \( R_g + 6 \) +
     delta k #scale(x: 120%, y: 120%)[\)] > 0 . $ <eq:stress-density-scalar>]
  The boundary conformal formula and $partial_nu u = 0$ give $H_(tilde(g)) = \( 1 + u \)^(- 2) H_g lt.eq 0$.
    The uniform metric convergence in (6.3) follows from the weighted bound and the cutoff construction.
  We next justify the end expansion for each fixed $B \, delta$. Beyond $2 B$, $g_B = b$ and
  #[#set math.equation(numbering: n => "(6.7)")
   $ \( - Delta_b + 3 \) u = F \( u \) + delta r^(- 4) \/ 8 \, wide F \( u \) = O \( u^2 \) \, quad F' \( u \) =
     O \( u \) . $ <eq:stress-density-end-ode>]
  All fixed orders of angular derivatives of $u$ are $O \( r^(- j_0) \)$. Indeed rotations commute with $Delta_b$.
    Their difference quotients solve a linear equation with small potential $O \( u \)$,
    with smooth data on a fixed inner sphere and decaying data at infinity.
    The same $r^(- j_0)$ barriers and local weighted estimates bound these quotients.
    Induction, with the lower angular derivatives as forcing, proves the claim at every fixed order.
    Radial derivatives at the initial weighted order follow from local elliptic estimates. Since
  $ Delta_b = partial_eta^2 + 2 coth eta thin partial_eta + r^(- 2) Delta_sigma \, $
  Equation (6.7) reduces, with all these angular derivatives, to
  $ - u_(eta eta) - 2 u_eta + 3 u = O \( e^(- \( 3 + xi \) eta) \) $
  for any fixed sufficiently small $0 < xi < min { 2 j_0 - 3 \, j_0 - 1 \, 1 }$.
    Variation of constants for the two solutions $e^eta \, e^(- 3 eta)$ excludes the growing mode by the known
    decay and gives $u = c \( omega \) e^(- 3 eta) + O \( e^(- \( 3 + xi \) eta) \)$.
    The same argument after angular differentiation makes $c$ smooth;
    the equation gives all stated radial derivatives. Changing from $eta$ to $r$ gives (6.4).
  We finally check mass convergence, since convergence only in a weight less than three would not suffice.
    Write $h = b + e$ for either the original metric or one of the approximants,
    and let $bb(U)_(V_0) \( e \)$ be the one-form in the mass definition. The linearized scalar curvature is
  $ \( D R \)_b \( e \) = "div"_b "div"_b e - Delta_b "tr"_b e + 2 "tr"_b e . $
  Differentiation, using $nabla_b^2 V_0 = V_0 b$, yields the exact linear identity $"div"_b bb(U)_(V_0) \( e \) =
    V_0 \( D R \)_b \( e \)$. The difference between $R_h + 6$ and $\( D R \)_b \( e \)$ is bounded by
    $C \( \| e \| thin \| nabla_b^2 e \| + \| nabla_b e \|^2 + \| e \|^2 \)$.
    The uniform weighted second-order bound and $d V_b asymp r thin d r thin d A_sigma$ thus give
  #[#set math.equation(numbering: n => "(6.8)")
   $ 16 pi p_0 \( h \) - integral_(r = D) bb(U)_(V_0) \( h - b \) \( nu_b \) thin #h(-0.16667em) upright(d) A_b =
     integral_(r > D) V_0 \( R_h + 6 \) thin #h(-0.16667em) upright(d) V_b + O \( D^(3 - 2 j_0) \) \,
     $ <eq:stress-density-mass-tail>]
  uniformly in the approximants. The scalar integrands in (6.6) are dominated by a fixed multiple of
    $V_0 \( R_g + 6 + k \)$, which is integrable; they converge pointwise to $V_0 \( R_g + 6 \)$.
    The same divergence calculation with $V_i$, using $\| V_i \| lt.eq
    V_0$ and the corresponding derivative bounds, proves existence of all fluxes for the approximants.
    At a fixed $D$ their surface fluxes converge by local $C^2$ convergence.
    Dominated convergence in (6.8), followed by $D arrow.r oo$, proves the asserted time-component convergence.
    This is also the scalar linearization underlying the mass definition in #cite(label("CH2003"), form: "prose").
    Finally, the two-sided metric comparison compares the areas of every admissible intrinsic boundary with the
    same multiplicative factors; taking infima proves convergence of the minimum enclosing areas. ◻
]

We henceforth fix one approximating metric, write it again as $g$,
  and write $alpha$ for its smooth coefficient in (6.4). Thus $R_g + 6 > 0$ everywhere.
  All subsequent constants may depend on this fixed metric; no uniformity across the approximation is needed.

=== 6.2 The nonlinear electrostatic problem <the-nonlinear-electrostatic-problem>

For $0 lt.eq e lt.eq 1$ define

#[#set math.equation(numbering: n => "(6.9)")
 $ t \( e \) = sqrt(1 - e^(3 \/ 2)) \, wide L \( w \) = max_(0 lt.eq e lt.eq 1) { t \( e \) + w e } \, wide
   w gt.eq 0 . $ <eq:stress-legendre-law>]

Strict concavity of $t$, together with $t' \( 0 \) = 0$ and $t' \( e \) arrow.r - oo$ as $e arrow.t 1$,
  gives a unique maximizing $e = e \( w \)$, with $e \( 0 \) = 0$, $0 < e \( w \) < 1$ for $w > 0$, and

#[#set math.equation(numbering: n => "(6.10)")
 $ w = - t' \( e \) = frac(3 sqrt(e), 4 t \( e \)) \, wide L' \( w \) = e \( w \) \, wide L = t +
   w e . $ <eq:stress-constitutive-law>]

In particular $L \( \| xi \| \)$ is convex as a function of a covector $xi$.

#thm([Proposition 6.2.])[
  (Electrostatic potential, stress, and charge).  #emph[For every $M_e > 0$ there is a weak solution $u$ of
#[#set math.equation(numbering: n => "(6.11)")
 $ "div"_g E = 0 \, wide E = e \( w \) frac(nabla u, w) \, quad w = \| d u \|_g \, wide u \|_S = - M_e \, quad
   u arrow.r 0 upright(" at infinity") \, $ <eq:stress-electrostatics>]

 where $E = 0$ at $w = 0$. It satisfies $- M_e lt.eq u lt.eq 0$, $\| u \| + \| d u \|_g = O \( r^(- 1) \)$,
   and is $C^(1 \, beta)$ locally up to $S$ and in compactified coordinates $\( rho \, omega \)$ up to $rho = 0$,
   for some $beta > 0$, where $rho = e^(- eta)$. The continuous symmetric tensor
#[#set math.equation(numbering: n => "(6.12)")
 $ Pi = L \( w \) g - d u ⊗ E^flat $ <eq:stress-tensor>]

 is distributionally divergence free, is positive definite, and obeys
#[#set math.equation(numbering: n => "(6.13)")
 $ \( "tr"_g Pi \)^2 - 2 \| Pi \|_g^2 = 3 . $ <eq:stress-algebraic-identity>]

 There is a continuous nonnegative function $e_0$ on $bb(S)^2$ such that, uniformly in angle,
#[#set math.equation(numbering: n => "(6.14)")
 $ r^2 \| E \|_g arrow.r e_0 \, wide r^3 #scale(x: 120%, y: 120%)[\(] Pi \( nu \, nu \) -
   1 #scale(x: 120%, y: 120%)[\)] arrow.r - 1 / 2 e_0^(3 \/ 2) . $ <eq:stress-end-asymptotics>]

 Here $nu$ points toward increasing $r$. The charge
#[#set math.equation(numbering: n => "(6.15)")
 $ F_(M_e) = integral_(r = R) g \( E \, nu \) thin #h(-0.16667em) upright(d) A_g $ <eq:stress-charge-definition>]

 is independent of large $R$, satisfies $F_(M_e) lt.eq integral_(bb(S)^2) e_0 thin #h(-0.16667em) upright(d)
   A_sigma$, and
#[#set math.equation(numbering: n => "(6.16)")
 $ liminf_(M_e arrow.r oo) F_(M_e) gt.eq A_(*) . $ <eq:stress-charge-saturation>]

]
] <prop:electrostatic-stress>

#proof[
  We give the construction and its regularity before establishing the stress and charge assertions.
  #emph[Constitutive estimates and regularization.] For $w > 0$ put $Q \( w \) = w e' \( w \) \/ e \( w \)$.
    Logarithmic differentiation of (6.10) gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ Q \( w \)^(- 1) = 1 / 2 + frac(3 e \( w \)^(3 \/ 2), 4 \( 1 - e \( w \)^(3 \/ 2) \)) . $ <eq:stress-Q-formula>]
  Thus $0 < Q lt.eq 2$. At zero, inversion in the variable $sqrt(e)$ gives
  $ e \( w \) = 16 / 9 w^2 + O \( w^5 \) \; $
  in particular $e \( w \) \/ w^2$ extends smoothly and positively to $w = 0$. At infinity, inversion in $w^(- 2)$ gives
  #[#set math.equation(numbering: n => "(6.18)")
   $ e \( w \) = 1 - frac(3, 8 w^2) + O \( w^(- 4) \) \, wide Q \( w \) = frac(3, 4 w^2) + O \( w^(- 4) \) \, wide
     w Q' \( w \) = - frac(3, 2 w^2) + O \( w^(- 4) \) . $ <eq:stress-large-gradient-law>]
  Regularize only at zero by
  #[#set math.equation(numbering: n => "(6.19)")
   $ e_epsilon \( w \) = w frac(e \( z \), z) \, quad z = \( w^2 + epsilon^2 \)^(1 \/ 2) \, quad
     Q_epsilon \( w \) = 1 + w^2 / z^2 \( Q \( z \) - 1 \) \, quad 0 < epsilon < 1 . $ <eq:stress-regularized-law>]
  The flux $e_epsilon \( \| xi \| \) xi^sharp \/ \| xi \|$ is smooth and strictly elliptic on every finite
    gradient range, including zero. Its radial and transverse derivative eigenvalues are $e'_epsilon$ and
    $e_epsilon \/ w$, respectively. We have $0 < Q_epsilon lt.eq 2$; uniformly for sufficiently large $w$,
  #[#set math.equation(numbering: n => "(6.20)")
   $ c lt.eq w^2 Q_epsilon \( w \) lt.eq C \, wide - w^2 #scale(x: 120%, y: 120%)[\(] w Q'_epsilon \( w \) +
     Q_epsilon \( w \) #scale(x: 120%, y: 120%)[\)] gt.eq c . $ <eq:stress-uniform-Q>]
  These follow by substituting (6.18) in (6.19); the leading coefficient is $3 \/ 4 + epsilon^2$,
    bounded above and below independently of $epsilon$.
  #emph[Boundary and interior gradient bounds.] On a connected smooth truncation $Omega_R$ prescribe $u = -
    M_e$ on $S$ and $u = 0$ on $r = R$. The maximum principle gives $- M_e lt.eq u lt.eq 0$.
    At points with nonzero gradient the regularized equation is
  #[#set math.equation(numbering: n => "(6.21)")
   $ P : nabla^2 u = 0 \, wide P = g^(- 1) + \( Q_epsilon \( w \) - 1 \) n ⊗ n \, quad n =
     nabla u \/ w . $ <eq:stress-regularized-nondivergence>]
  Let $h$ be inward distance from $S$. Since $H \( S \) lt.eq 0$, smoothness gives $Delta h lt.eq
    C h$ in a fixed collar. A supersolution above the inner boundary datum is $- M_e + B \( h \)$, where
  $ B \( h \) = b_0^(- 1) log \( 1 + D h \) \, wide B'' = - b_0 \( B' \)^2 . $
  For $p = B'$ sufficiently large, (6.20) gives
  $ P : nabla^2 B = Q_epsilon \( p \) B'' + p Delta h lt.eq - c b_0 + C \/ b_0 \, $
  because $h p lt.eq 1 \/ b_0$. Choose $b_0$ first to make this negative,
    then a collar width $h_0$ so small that $\( 2 b_0 h_0 \)^(- 1)$ is above the required gradient threshold,
    and finally $D$ large so that $B \( h_0 \) > M_e$ and $B' gt.eq \( 2 b_0 h_0 \)^(- 1)$ there.
    Comparison with the constant lower barrier bounds the inward derivative on $S$,
    independently of $R$ and $epsilon$. At the outer sphere, inward distance may be replaced by $h = eta_R -
    eta$ in a uniform collar. For gradients parallel to $d eta$, asymptotic hyperbolicity and $Q_epsilon lt.eq
    2$ give $P : nabla^2 h lt.eq - 1$ for sufficiently large $R$.
    The linear lower barrier $- C h$, together with $u lt.eq 0$,
    bounds the outer derivative with $C$ depending on $M_e$ and the fixed collar width only.
  For the interior estimate use an orthonormal frame with first vector $n$, and write transverse indices as $a \,
    b$. Differentiating (6.21), commuting one derivative, and differentiating the norm of $d u$ gives
  #[#set math.equation(numbering: n => "(6.22)")
   $ P : nabla^2 log w =  & "Ric" \( n \, n \) + \( 1 - Q_epsilon \) frac(\| d_perp w \|^2, w^2) +
     frac(sum_(a \, b) u_(a b)^2, w^2)\
 & - #scale(x: 120%, y: 120%)[\(] w Q'_epsilon + Q_epsilon #scale(x: 120%, y: 120%)[\)] w_1^2 /
   w^2 . $ <eq:stress-gradient-identity>]
  To specify the cancellation, the differentiated coefficient term is $Q'_epsilon w_1^2 +
    2 \( Q_epsilon - 1 \) \| d_perp w \|^2 \/ w$; the differentiated norm contributes
    $\[ Q_epsilon sum_a u_(1 a)^2 + sum_(a \, b) u_(a b)^2 \] \/ w$ before division by $w$.
    Subtracting $P \( d w \, d w \) \/ w^2$ produces exactly (6.22).
    At a positive interior maximum of $w exp \( B_0 u \)$ we have $d_perp w = 0$ and $w_1 \/ w = - B_0 w$.
    The left side of (6.22) is nonpositive, since $P : nabla^2 u = 0$.
    The global lower Ricci bound and (6.20) make the right side at least $- C + c B_0^2$ when $w$ is large.
    A fixed sufficiently large $B_0$ excludes such a maximum.
    Combining the remaining interior maxima with the boundary estimates and the height bound gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ sup_(Omega_R) \| d u \|_g lt.eq C \( M_e \) \, $ <eq:stress-global-gradient-bound>]
  uniformly in large $R$ and $0 < epsilon < 1$.
  #emph[Existence on truncations and passage to the limit.] For fixed $R \, epsilon$,
    vary the inner Dirichlet value from zero to $- M_e$. The derivative of the divergence equation is a strictly
    elliptic divergence operator without zeroth-order term and is invertible with zero Dirichlet data by the
    maximum principle and linear elliptic theory. The bounds already proved hold on this entire path.
    On its bounded gradient range, ordinary uniformly elliptic quasilinear gradient Hölder estimates apply.
    For the boundary estimate subtract its constant value and reflect oddly in boundary normal coordinates,
    reflecting the metric as well. The reflected metric is Lipschitz;
    its mixed normal–tangential entries vanish on the face. The reflected equation is weakly valid by the zero
    trace. Equivalently, difference quotients give uniformly elliptic equations for the first derivatives with
    bounded divergence forcing. Scalar Hölder estimates followed by Schauder estimates on the original smooth side
    give closedness of the continuation. Here constants may depend on the fixed $R \, epsilon$;
    #cite(label("GT2001"), form: "prose") supplies the ordinary elliptic estimates being used.
    Thus smooth regularized solutions exist.
  A decay bound is uniform in both regularizations. On the end put $v = C \( e^(- eta) - e^(- 2 eta) \)$.
    It is positive for large $eta$, and
  $ frac(v'', - v') = frac(1 - 4 e^(- eta), 1 - 2 e^(- eta)) lt.eq 1 - e^(- eta) . $
  Also $\| d eta \|_g^2 = 1 + O \( e^(- tau eta) \)$ and $P : nabla^2 eta = 2 +
    O \( e^(- min { tau \, 2 } eta) \)$ for the radial test direction, uniformly for $0 < Q_epsilon lt.eq 2$.
    Since $tau > 1$, these inequalities imply $P : nabla^2 v lt.eq 0$ sufficiently far out, independently of $C$.
    Comparison of the nonnegative solution $- u$ with $v$, choosing $C$ on a fixed inner sphere and using $u =
    0$ on the truncating edge, gives $\| u \| lt.eq C e^(- eta)$.
  Take a subsequence with $R arrow.r oo$ and $epsilon arrow.b 0$.
    The uniform Lipschitz bound gives local uniform convergence and weak gradient convergence to a locally
    Lipschitz function with the required traces. To pass to the equation,
    let $chi$ be a compactly supported cutoff and test the regularized equation with $chi \( u_j - u \)$.
    The terms containing $d chi$ tend to zero by uniform convergence.
    Subtracting the limiting-law flux evaluated at $d u$ gives
  $ integral chi thin #scale(x: 120%, y: 120%)[\(] A \( d u_j \) -
    A \( d u \) #scale(x: 120%, y: 120%)[\)] dot.op \( d u_j - d u \) thin #h(-0.16667em) upright(d) V_g arrow.r
    0 \, wide A \( xi \) = e \( \| xi \| \) xi^sharp \/ \| xi \| . $
  Uniform convergence of the constitutive functions on bounded ranges justifies replacing the regularized flux
    here. The law $A$ is strictly monotone. On the fixed compact gradient range its monotonicity pairing has a
    positive minimum whenever the two arguments are separated by a prescribed positive distance.
    Thus $d u_j arrow.r d u$ in measure and strongly in every finite local $L^p$.
    This proves the limiting weak equation.
  #emph[Gradient regularity and compactification.] We apply the scalar $p =
    3$ gradient theorem recorded in Section 2, namely Theorem 1.1 and estimate (1.8) of
    #cite(label("AraujoZhang2020"), form: "prose"). The coordinate flux must satisfy globally
  #[#set math.equation(numbering: n => "(6.24)")
   $ lambda \| xi \| thin \| zeta \|^2 & lt.eq cal(A)_xi \( x \, xi \) \[ zeta \, zeta \] \, & \| cal(A) \| + \|
     cal(A)_xi \| thin \| xi \| & lt.eq C \| xi \|^2 \,\
\| cal(A) \( x \, xi \) - cal(A) \( y \, xi \) \| & lt.eq C \| x - y \| thin \| xi \|^2 . $ <eq:stress-p3-structure>]
  It must also be $C^1$ in $xi$ and the solution must have bounded local $W^(1 \, 3)$ energy.
    The Lipschitz spatial bound supplies a $C^(0 \, 1 \/ 2)$ modulus, so $n = p =
    3$ and zero forcing meet all the parameters of that theorem.
    Throughout this argument choose only $0 < beta < min { alpha_m \, 1 \/ 4 }$ as in Section 2;
    the decay and boundary limits below require a positive exponent, not an optimal one.
  We verify global, rather than merely bounded-gradient, structure before applying this theorem.
    On the gradient range in (6.23), $e \( w \) \/ w^2$ and $Q \( w \)$ have positive upper and lower bounds.
    Thus $e' \( w \)$ is comparable to $w$. Choose a smooth cutoff $chi =
    1$ below the known range and zero above twice a larger fixed bound, and replace $e'$ outside that range by
  $ tilde(e)' \( w \) = chi \( w \) e' \( w \) + \( 1 - chi \( w \) \) c_1 w \, wide tilde(e) \( 0 \) = 0 \, $
  where $c_1 > 0$. Then $tilde(e) = e$ on the range attained by the solution, $tilde(e)' asymp w$,
    and $tilde(e) asymp w^2$ globally. In coordinates with metric matrix $G$ the density flux is
  #[#set math.equation(numbering: n => "(6.25)")
   $ cal(A)^i \( x \, xi \) = sqrt(det G) thin frac(tilde(e) \( \| xi \|_G \), \| xi \|_G) thin G^(i j) xi_j \,
     wide \| xi \|_G = \( G^(i j) xi_i xi_j \)^(1 \/ 2) . $ <eq:stress-coordinate-flux>]
  Uniform positive metric bounds give (6.24); Lipschitz metric coefficients give the spatial bound.
    The flux is $C^1$ at zero because it is $O \( \| xi \|^2 \)$ and its derivative is $O \( \| xi \| \)$.
    Its derivative is symmetric, as is also apparent from its convex radial primitive.
    The solution has finite local cubic energy by its Lipschitz bound.
    The quoted theorem therefore proves local $C^(1 \, beta)$ regularity.
  The same argument works at $S$. In orthogonal boundary coordinates with reflection matrix $J =
    "diag" \( - 1 \, 1 \, 1 \)$, extend the metric matrix by $G \( - h \, x \) = J G \( h \, x \) J$,
    and extend $u + M_e$ oddly. The mixed metric entries vanish on the face, so this extension is Lipschitz.
    The reflected flux satisfies $cal(A)_(-) \( xi \) = J cal(A)_(+) \( J xi \)$.
    Evaluated on the odd solution, its normal component is even and its tangential components are odd.
    A test on the reflected ball consequently reduces to a test on the original half-ball with zero trace.
    Such tests are allowed: cutoff at distance $h = delta$ creates an error tending to zero since the test is
    $O \( h \)$, the flux is bounded, and the strip volume tends to zero.
    Thus the reflected weak equation satisfies all the same hypotheses, proving the asserted boundary regularity.
  To obtain gradient decay, take a uniform metric ball far out with central radius $r_(*)$, and put $s_(*) =
    C \/ r_(*)$, so that $\| u \| lt.eq s_(*)$ on a slightly larger ball.
    Apply the preceding fixed global extension to the equation for $u \/ s_(*)$; its flux is
  $ cal(A)_(s_(*)) \( x \, xi \) = s_(*)^(- 2) cal(A) \( x \, s_(*) xi \) . $
  The cubic structure constants and spatial modulus are unchanged.
    The required energy bound does not presume a bound on the normalized gradient.
    Testing with $chi^3 \( u \/ s_(*) \)$, and using coercivity and Young’s inequality, gives
  #[#set math.equation(numbering: n => "(6.26)")
   $ integral chi^3 \| d \( u \/ s_(*) \) \|^3 lt.eq C integral \| u \/ s_(*) \|^3 \| d chi \|^3 lt.eq
     C . $ <eq:stress-scaled-energy>]
  The Hölder estimate for the gradient, together with this energy bound, gives its supremum on a smaller ball:
    some point has gradient bounded by the cubic mean, and the Hölder bound controls its difference from every
    other point. Therefore $\| d u \|_g lt.eq C \/ r$.
  Now let $g_c = rho^2 g$ on the end. It extends to a positive Lipschitz metric up to $rho = 0$,
    with vanishing mixed normal–tangential entries there. In the conformal end at hand this follows directly from
  $ g_c = phi.alt^4 (d rho^2 + 1 / 4 \( 1 - rho^2 \)^2 sigma) $
  and (6.4). The estimate just obtained gives $\| d u \|_(g_c) lt.eq C$,
    and the height estimate gives the zero trace. Writing $macron(w) = \| d u \|_(g_c)$,
    the coordinate divergence equation in this metric has radial law
  #[#set math.equation(numbering: n => "(6.27)")
   $ q_rho \( macron(w) \) = rho^(- 2) e \( rho macron(w) \) = macron(w)^2 F \( rho macron(w) \) \, wide
     F \( t \) = e \( t \) \/ t^2 . $ <eq:stress-compactified-law>]
  On the known bounded range of $macron(w)$, this satisfies uniform cubic structure and Lipschitz spatial
    dependence, including at $rho = 0$. For an explicit uniform extension, set $H \( t \) = 2 F \( t \) +
    t F' \( t \) > 0$, choose a fixed cutoff equal to one below that range and zero above twice a larger bound,
    and define
  $ tilde(q)'_rho \( w \) = w #scale(x: 120%, y: 120%)[\[] chi \( w \) H \( rho w \) + \( 1 - chi \( w \) \) c_1
    #scale(x: 120%, y: 120%)[\]] \, wide tilde(q)_rho \( 0 \) = 0 . $
  It agrees with $q_rho$ on the attained range, is comparable to $w^2$, has derivative comparable to $w$,
    and has the required uniform Lipschitz dependence in position.
    Reflect $g_c$ as above, use $\| rho \|$ in this coefficient, and reflect $u$ oddly.
    The gradient bound ensures $W^(1 \, 3)$ across the face. The same zero-trace test argument proves the
    reflected weak equation. The scalar theorem now gives $C^(1 \, beta)$ in compactified coordinates.
    No theorem about degenerate boundary equations is being assumed in addition to the stated interior result.
  #emph[Stress and asymptotic coefficients.] Convexity shows that the weak solution minimizes the integral of
    $L \( \| d u \| \)$ against compactly supported Lipschitz variations:
    integrate the convex tangent inequality and use (6.11). Apply this fact to compactly supported changes of
    independent variable. For the flow of a smooth vector field $X$,
    differentiating the local energy of the transported potential gives
  $ integral #scale(x: 120%, y: 120%)[\(] L \( w \) g - d u ⊗ E^flat #scale(x: 120%, y: 120%)[\)] :
    nabla X thin #h(-0.16667em) upright(d) V_g = 0 . $
  The calculation is justified by bounded gradients on the support; no finite total energy of $L$ is needed.
    This is $"div"_g Pi = 0$ in distributions. The stress eigenvalues in the gradient and transverse directions
    are $t$ and $l = L = t + w e$, respectively, with $Pi = g$ at zero gradient.
    They are positive at every finite gradient. Moreover,
  $ \( t + 2 l \)^2 - 2 \( t^2 + 2 l^2 \) = 4 t l - t^2 = 3 t^2 + 4 t w e = 3 \( 1 - e^(3 \/ 2) \) +
    3 e^(3 \/ 2) = 3 \, $
  proving (6.13).
  Since $u$ has constant trace at conformal infinity, all its tangential derivatives in compactified coordinates
    vanish there. Its scaled gradient consequently has a continuous radial limit.
    Together with $r rho arrow.r 1 \/ 2$ and $e \( w \) = \( 16 \/ 9 \) w^2 + O \( w^5 \)$,
    this gives a continuous $e_0 gt.eq 0$ with $r^2 e \( w \) arrow.r e_0$ uniformly.
    At a point where $e_0 > 0$ the gradient direction approaches the radial direction, so $Pi \( nu \, nu \) = t +
    o \( r^(- 3) \)$. At a point where $e_0 = 0$, both $t - 1$ and $l - t = w e$ are $O \( e^(3 \/ 2) \) =
    o \( r^(- 3) \)$, and the same conclusion holds. Uniformity follows by splitting into the sets where $e_0$ is
    larger or smaller than an arbitrary fixed positive threshold.
    Since $t = 1 - e^(3 \/ 2) \/ 2 + O \( e^3 \)$, this proves (6.14), as well as $E = O \( r^(- 2) \)$ and $Pi -
    g = O \( r^(- 3) \)$ in metric norm.
  #emph[Flux saturation.] Continuous distributionally divergence-free fields have the usual flux identities on
    smooth compact domains: use smooth cutoffs approaching their boundaries and continuity in the shrinking
    collars. This proves independence in (6.15). The asymptotics and $d A_g \/ r^2 arrow.r
    d A_sigma$ give $F_(M_e) lt.eq integral e_0 thin d A_sigma$.
    Integration by parts in the electrostatic equation gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ M_e F_(M_e) = integral_Omega w e \( w \) thin #h(-0.16667em) upright(d) V_g . $ <eq:stress-energy-charge>]
  Indeed the infinity term tends to zero because $u = O \( r^(- 1) \)$, $E = O \( r^(- 2) \)$,
    and the sphere area is $O \( r^2 \)$. The inner term has the indicated sign:
    the outward normal of the exterior at $S$ is $- nu$, while $u = - M_e$ there.
    The integral is finite since $w e = O \( r^(- 3) \)$ and $d V_g asymp r thin d r thin d A_sigma$.
  Fix a large $R_0$, choose $4 \/ 3 < s_0 < 2$, and set
  #[#set math.equation(numbering: n => "(6.29)")
   $ zeta = 1 quad \( r lt.eq R_0 \) \, wide zeta = \( R_0 \/ r \)^(s_0) quad \( r > R_0 \) \, wide C_zeta =
     integral_Omega \( 1 - t \( zeta \) \) thin #h(-0.16667em) upright(d) V_g < oo . $ <eq:stress-charge-weight>]
  The last integrability follows from $1 - t \( zeta \) = O \( zeta^(3 \/ 2) \)$ and $s_0 > 4 \/ 3$.
    For every smooth function $v$ equal to $- M_e$ near $S$ and zero outside a compact set,
    each regular level $v = q$, $- M_e < q < 0$, obeys
  #[#set math.equation(numbering: n => "(6.30)")
   $ integral_(v = q) zeta thin #h(-0.16667em) upright(d) A_g gt.eq \( 1 - o_(R_0) \( 1 \) \) A_(*) .
     $ <eq:stress-weighted-level-area>]
  Here is the topological and geometric comparison for this assertion.
    Take the closure $D$ of the component of ${ v > q }$ containing the end.
    It is a connected closed end-side domain, with boundary a subset of the level;
    it misses a neighborhood of all of $S$. Choose a sphere $r = R_1$, with $R_1 in \[ R_0 \/ 2 \, R_0 \]$,
    transverse to its boundary, and adjoin to $D$ the whole region $r gt.eq R_1$.
    The union is still connected because the two domains have a common far-end region.
    Each newly exposed sphere-cap point lies on a radial ray meeting the old boundary at some $r gt.eq R_1$:
    initially the ray is outside $D$, and eventually it lies in $D$.
    Radial projection onto $r = R_1$ has upper two-dimensional Jacobian
  $ \( 1 + o_(R_0) \( 1 \) \) \( R_1 \/ r \)^2 lt.eq \( 1 + o_(R_0) \( 1 \) \) zeta \( r \) . $
  The first estimate is uniform over tangent two-planes by the asymptotic tensor bounds;
    the second uses $s_0 < 2$ and $R_1 lt.eq R_0$. The area formula bounds the new caps by the weighted old
    boundary outside the sphere. Inside, the weight is one. The transverse corners can be rounded toward the side
    enlarging this union, in shrinking tubular neighborhoods of their intersection curves;
    the added area tends to zero. The rounded exterior is connected and its full intrinsic boundary is an
    admissible cut in the definition of $A_(*)$. This proves (6.30) without any connectedness assertion about the
    level itself.
  Coarea therefore gives $integral zeta \| d v \| gt.eq M_e \( 1 - o_(R_0) \( 1 \) \) A_(*)$.
    The same holds for $u$. To justify approximation, first replace $u$ by its constant trace in a shrinking
    collar of $S$, interpolating in a collar of comparable width.
    The error in its weighted gradient integral tends to zero by the bounded gradient and constant trace.
    Next multiply by a cutoff tending to zero in $R < r < 2 R$ and set it equal to zero beyond $2 R$.
    The height and gradient decay make both the lost tail and cutoff error $O \( R^(1 - s_0) \)$, tending to zero.
    Smooth the remaining compactly supported transition while retaining the constant boundary neighborhoods.
    This gives convergence in the required weighted $W^(1 \, 1)$ norm, and coarea applies to the smooth approximants.
  Finally, the definition of $L$ gives $L \( w \) gt.eq zeta w + t \( zeta \)$, whereas $L \( w \) - 1 lt.eq
    w e \( w \)$ since $t \( e \) lt.eq 1$. Combining these facts with (6.28) yields
  #[#set math.equation(numbering: n => "(6.31)")
   $ F_(M_e) gt.eq \( 1 - o_(R_0) \( 1 \) \) A_(*) - C_zeta \/ M_e . $ <eq:stress-charge-lower-bound>]
  Let $M_e arrow.r oo$ at fixed $R_0$ and then $R_0 arrow.r oo$. This proves (6.16) and completes the proposition. ◻
]

=== 6.3 Smoothing the synthetic tensor and attaching an exterior <smoothing-the-synthetic-tensor-and-attaching-an-exterior>

#thm([Proposition 6.3.])[
  (Compact stress data and AF attachment).  #emph[Let $g$ be the fixed approximating metric above.
    For every $epsilon_0 > 0$ there are a sufficiently large coordinate sphere $cal(C)$,
    its compact connected inner region $Omega_i$, a smooth symmetric tensor $K$ on $Omega_i$,
    and a smooth scalar-flat $upright("AF")$ exterior $\( Omega_o \, g_o \)$ attached along $cal(C)$,
    with the following properties. Put $tau_K = "tr"_g K$ and $k_T = "tr"_(cal(C)) K$. Then
#[#set math.equation(numbering: n => "(6.32)")
 $ K & < 0 \, wide R_g + tau_K^2 - \| K \|_g^2 - 2 \( "div"_g K - d tau_K \) dot.op v >
   0 &  & \( \| v \|_g lt.eq 1 \) \,\
H_i & > \| k_T \| \, wide H_o = sqrt(H_i^2 - k_T^2) > 0 \,\
m_o & lt.eq p_0 \( g \) - 1 / 2 a^3 + epsilon_0 . $ <eq:stress-synthetic-DEC>]

 Here $H_i$ is the inner metric’s mean curvature on $cal(C)$,
   and $H_o$ is the outer metric’s inner-boundary mean curvature, both in the direction toward the respective end.
   The induced metrics agree. The exterior is complete with its boundary included and has one end, with $g_o -
   delta = O_k \( \| x' \|^(- 1) \)$ for every fixed $k$, where an ordinary derivative improves decay by one
   power. Projection from $Omega_o$ to $cal(C)$ along its parallel rays has upper area Jacobian at most one on
   every tangent two-plane.]
] <prop:af-attachment>

#proof[
  Choose an electrostatic height $M_e$ large enough that the preceding proposition gives
  #[#set math.equation(numbering: n => "(6.33)")
   $ chevron.l e_0 chevron.r gt.eq a^2 - o \( 1 \) \, wide chevron.l f chevron.r = \( 4 pi \)^(- 1)
     integral_(bb(S)^2) f thin #h(-0.16667em) upright(d) A_sigma \, $ <eq:stress-charge-average>]
  where the error can be arbitrarily small. On the whole exterior first define a continuous tensor $K^(\( 0 \))$ by
  #[#set math.equation(numbering: n => "(6.34)")
   $ K^(\( 0 \)) - \( "tr"_g K^(\( 0 \)) \) g = 2 Pi \, wide K^(\( 0 \)) =
     2 Pi - \( "tr"_g Pi \) g . $ <eq:stress-synthetic-tensor>]
  Its eigenvalues are $t - 2 l = - t - 2 w e < 0$ in the gradient direction and $- t < 0$ transversely.
    Directly from (6.13),
  #[#set math.equation(numbering: n => "(6.35)")
   $ \( "tr"_g K^(\( 0 \)) \)^2 - \| K^(\( 0 \)) \|_g^2 = 6 \, wide
     "div"_g #scale(x: 120%, y: 120%)[\(] K^(\( 0 \)) - \( "tr"_g K^(\( 0 \)) \) g #scale(x: 120%, y: 120%)[\)] =
     0 $ <eq:stress-synthetic-identities>]
  in distributions. For example, if $s_Pi = "tr"_g Pi$, then $"tr"_g K^(\( 0 \)) = -
    s_Pi$ and $\| K^(\( 0 \)) \|^2 = 4 \| Pi \|^2 - s_Pi^2$, giving the first identity.
  On a coordinate sphere of radius $r$, the induced metric is $phi.alt^4 r^2 sigma$,
    hence its Gauss curvature is positive for large $r$. The conformal mean-curvature formula gives
  #[#set math.equation(numbering: n => "(6.36)")
   $ H_i & = phi.alt^(- 2) (frac(2 sqrt(1 + r^2), r) + 4 sqrt(1 + r^2) thin partial_r log phi.alt)\
 & = 2 + r^(- 2) - 16 alpha r^(- 3) + o \( r^(- 3) \) . $ <eq:stress-inner-H-expansion>]
  The relation (6.34) gives exactly $"tr"_(cal(C)) K^(\( 0 \)) = - 2 Pi \( nu \, nu \)$, so (6.14) yields
  #[#set math.equation(numbering: n => "(6.37)")
   $ k_T^(\( 0 \)) = - 2 + e_0^(3 \/ 2) r^(- 3) + o \( r^(- 3) \) . $ <eq:stress-tangential-K-expansion>]
  All these remainders are uniform in angle. Consequently $H_i > \|
    k_T^(\( 0 \)) \|$ on every sufficiently large sphere, and
  #[#set math.equation(numbering: n => "(6.38)")
   $ sqrt(H_i^2 - \( k_T^(\( 0 \)) \)^2) = 2 / r + frac(- 16 alpha + e_0^(3 \/ 2), r^2) +
     o \( r^(- 2) \) . $ <eq:stress-outer-H-expansion>]
  Indeed the expression under the root is $4 r^(- 2) + \( - 64 alpha + 4 e_0^(3 \/ 2) \) r^(- 3) + o \( r^(- 3) \)$.
  We explain carefully the smoothing used after fixing such a sphere $cal(C)$.
    On the compact $Omega_i$, continuity and strict positivity give positive lower bounds for the eigenvalues of
    $Pi$, the absolute negative eigenvalues of $K^(\( 0 \))$, and $R_g + 6$.
    There are smooth tensors $Pi_h$ on $Omega_i$, up to its boundary, such that
  #[#set math.equation(numbering: n => "(6.39)")
   $ parallel Pi_h - Pi parallel_(C^0) arrow.r 0 \, wide parallel "div"_g Pi_h parallel_(C^0) arrow.r
     0 . $ <eq:stress-divergence-smoothing>]
  Here is the needed commutator proof, including the boundary.
    In an interior chart convolve the tensor components with a smooth kernel $eta_h$.
    A divergence term has form $a \( x \) partial_j T + b \( x \) T$, with smooth coefficients.
    For the principal part, integration by parts in the commutator produces $\( a \( y \) - a \( x \) \) partial
    eta_h \( x - y \)$ and a term with $\( partial a \) \( y \) eta_h \( x - y \)$.
    Together these cancel on constant $T$. After subtracting $T \( x \)$ their integral is bounded by a fixed
    constant times the modulus of continuity of $T$ on a ball of radius $O \( h \)$,
    and hence tends uniformly to zero. The lower-order terms commute up to the same type of error.
  In a boundary chart evaluate the convolution instead at $x + h c_0 n_0$,
    with $n_0$ a constant inward coordinate direction and $c_0$ large enough that the kernel stays on the original
    side. The same proof applies: $\| a \( y \) - a \( x \) \| = O \( h \)$ throughout its support,
    and the combined commutator still vanishes on a constant tensor.
    It therefore extends the uniform estimate to the boundary without extending the original stress as a
    divergence-free tensor. Take these local approximations on slightly larger charts and recombine with a smooth
    partition of unity. The extra differentiated partition terms tend to zero,
    because their limiting sum is $\( sum d chi \) Pi = 0$. This proves (6.39).
  Set $K_h = 2 Pi_h - \( "tr"_g Pi_h \) g$. Then $"div" K_h - d "tr" K_h = 2 "div" Pi_h arrow.r 0$ uniformly,
    and the algebraic part $R_g + \( "tr" K_h \)^2 - \| K_h \|^2$ tends uniformly to $R_g + 6 > 0$.
    For sufficiently small $h$, (6.32) follows uniformly for $\| v \| lt.eq 1$, as does $K_h < 0$.
    The strict gap $H_i > \| k_T^(\( 0 \)) \|$ at the now fixed sphere also persists.
    Write $K$ for this smooth tensor. The error in any integral involving $sqrt(H_i^2 - k_T^2)$ can be made
    arbitrarily small at this fixed sphere, because the square root is smooth on its positive gap.
    This order of choices is essential; we require no smoothing estimate uniform as the sphere tends to infinity.
  The positive-Gauss metric on $cal(C) tilde.eq bb(S)^2$ has a smooth strictly convex Euclidean isometric
    embedding by the smooth Weyl embedding theorem #cite(label("Nirenberg1953")).
    This is precisely the spherical positive-curvature version also stated in the introduction of
    #cite(label("ShiTam2002"), form: "prose"). Denote its outward Euclidean mean curvature by $H_E$.
    We will construct the Shi–Tam scalar-flat extension with the smooth positive prescribed boundary curvature
    $H_o = sqrt(H_i^2 - k_T^2)$. The required estimate is
  #[#set math.equation(numbering: n => "(6.40)")
   $ m_o lt.eq frac(1, 8 pi) integral_(cal(C)) \( H_E - H_o \) thin #h(-0.16667em) upright(d) A .
     $ <eq:stress-shitam-mass-bound>]
  Before proving this extension assertion, we evaluate its right side and record the exact coefficient of the
    charge term.
  Scale the induced metric on $cal(C)$ by $r^(- 2)$. Its area is $4 pi +
    O \( r^(- 3) \)$ and its Gauss curvature is $1 + O \( r^(- 3) \)$, with smooth angular control.
    For its convex Euclidean embedding choose an interior point as origin and use Gauss-map coordinates $omega$.
    Let $l \( omega \) > 0$ be the support function. Then the embedding is $l omega + nabla_sigma l$,
    its inverse shape operator is $nabla_sigma^2 l + l sigma$, and
  #[#set math.equation(numbering: n => "(6.41)")
   $ integral H_E^(upright("scaled")) thin #h(-0.16667em) upright(d) A =
     integral_(bb(S)^2) "tr"_sigma \( nabla_sigma^2 l + l sigma \) thin #h(-0.16667em) upright(d) A_sigma =
     2 integral_(bb(S)^2) l thin #h(-0.16667em) upright(d) A_sigma . $ <eq:stress-support-mean>]
  The scaled enclosed volume is $1 / 3 integral l thin d A$,
    and $d A = \( 1 + O \( r^(- 3) \) \) d A_sigma$ by the Gauss curvature estimate.
    Euclidean isoperimetry bounds this volume by $4 pi \/ 3 + O \( r^(- 3) \)$.
    Positivity of $l$ now implies $integral l thin d A_sigma lt.eq 4 pi + O \( r^(- 3) \)$. Scaling back in (6.41) gives
  #[#set math.equation(numbering: n => "(6.42)")
   $ integral_(cal(C)) H_E thin #h(-0.16667em) upright(d) A lt.eq 8 pi r +
     O \( r^(- 2) \) . $ <eq:stress-Euclidean-H-bound>]
  This uses no quantitative stability theorem for the Weyl embedding.
  Before smoothing the stress, (6.38) and $d A = phi.alt^4 r^2 d A_sigma$ give
  $ integral_(cal(C)) H_o thin #h(-0.16667em) upright(d) A = 8 pi r +
    integral_(bb(S)^2) \( - 16 alpha + e_0^(3 \/ 2) \) thin #h(-0.16667em) upright(d) A_sigma + o \( 1 \) . $
  The smoothing error in this equality can be made arbitrarily small after fixing $r$.
    Moreover, direct substitution of $g - b = \( 4 alpha r^(- 3) + O \( r^(- 3 - xi) \) \) b$ in the mass flux gives
  #[#set math.equation(numbering: n => "(6.43)")
   $ p_0 \( g \) = 8 chevron.l alpha chevron.r . $ <eq:stress-conformal-mass>]
  For clarity, if $e = f b$, the flux one-form is $- 2 \( V_0 thin d f - f thin d V_0 \)$; for $f =
    4 alpha r^(- 3)$ its radial sphere integral tends to $32 integral alpha thin d A_sigma$. Consequently (6.42) gives
  #[#set math.equation(numbering: n => "(6.44)")
   $ frac(1, 8 pi) integral_(cal(C)) \( H_E - H_o \) thin #h(-0.16667em) upright(d) A & lt.eq p_0 \( g \) - 1 /
     2 chevron.l e_0^(3 \/ 2) chevron.r + o \( 1 \)\
 & lt.eq p_0 \( g \) - 1 / 2 chevron.l e_0 chevron.r^(3 \/ 2) + o \( 1 \) lt.eq p_0 \( g \) - 1 / 2 a^3 +
   o \( 1 \) . $ <eq:stress-cubic-budget>]
  The second inequality is Jensen’s inequality. If $a = 0$, its charge term is simply nonnegative.
    In all cases first choosing $M_e$, then $r$, then the compact smoothing tolerance makes the final error
    smaller than the prescribed $epsilon_0$.
  #emph[The scalar-flat extension and its mass.] We include the extension argument to fix both the existence
    hypotheses and the normalization in (6.40). It is the quasi-spherical construction of
    #cite(label("ShiTam2002"), form: "prose") Section 2, Theorem 2.1, and Lemma 4.2.
    The input here is exactly a smooth strictly convex Euclidean sphere and a smooth positive prescribed mean
    curvature; no compact fill-in is used.
  Let $t gt.eq 0$ be Euclidean distance along the outward normals to the convex embedding.
    The parallels foliate its entire exterior. Write the Euclidean metric as $d t^2 + gamma_t$,
    and denote the Euclidean mean curvature and surface scalar curvature by $H_E \( t \)$ and $R_t$.
    Both are positive. If $lambda_1 \, lambda_2 > 0$ are the initial principal curvatures,
    then those at time $t$ are $lambda_j \/ \( 1 + t lambda_j \)$, whence
  #[#set math.equation(numbering: n => "(6.45)")
   $ frac(R_t, 2 H_E \( t \)) = frac(1, 2 t + c \( omega \)) \, wide c = lambda_1^(- 1) +
     lambda_2^(- 1) > 0 . $ <eq:stress-parallel-curvature>]
  Solve the scalar parabolic equation
  #[#set math.equation(numbering: n => "(6.46)")
   $ 2 H_E partial_t U = 2 U^2 Delta_(gamma_t) U + \( U - U^3 \) R_t \, wide U \( 0 \, dot.op \) =
     H_E \( 0 \, dot.op \) \/ H_o . $ <eq:stress-quasispherical-equation>]
  Smooth positive initial data give a local solution by strictly parabolic theory.
    The reaction term is nonpositive above one and nonnegative below one.
    The maximum principle therefore keeps $U$ between fixed positive constants.
    On every finite time interval the equation is uniformly parabolic with smooth background geometry.
    Scalar parabolic Hölder estimates for bounded solutions, followed by Schauder estimates and bootstrapping,
    give continuation for all finite times.
  For the asymptotic estimate, choose positive constants respectively above and below the entire initial range and
    one. Solve, for each of these constants as initial value,
  #[#set math.equation(numbering: n => "(6.47)")
   $ dot(z) = \( z - z^3 \) \/ \( 2 t + c_max \) \, wide c_max = max c . $ <eq:stress-parabolic-barriers>]
  By (6.45) these are respectively upper and lower barriers:
    the sign of $z - z^3$ reverses the inequality in the upper case. Since
  $ z^(- 2) - 1 = \( z \( 0 \)^(- 2) - 1 \) frac(c_max, 2 t + c_max) \, $
  comparison gives $U - 1 = O \( \( 1 + t \)^(- 1) \)$. Put $s =
    log \( 1 + t \)$ and $hat(gamma)_t = \( 1 + t \)^(- 2) gamma_t$.
    In the Gauss-map parametrization the parallel embedding is $X \( omega \) + t omega$,
    so these scaled metrics and all their derivatives have bounded geometry.
    Equation (6.46) in $s$ is uniformly parabolic. Its local Hölder and then Schauder estimates on fixed
    $s$-strips first bound all derivatives of $U$ uniformly. Next apply the linear estimates to $U -
    1$ with the actual coefficients of this solution; its equation is homogeneous,
    with a bounded smooth zeroth-order coefficient. The supremum bound just proved gives the same
    $O \( e^(- s) \)$ decay at every fixed derivative order. This proves the stated ordinary AF derivative bounds
    in the Euclidean coordinates $x' = X \( omega \) + t omega$.
  Set
  #[#set math.equation(numbering: n => "(6.48)")
   $ g_o = U^2 d t^2 + gamma_t . $ <eq:stress-af-extension-metric>]
  It has the required induced metric and inner mean curvature $H_E \/ U = H_o$.
    Its scalar curvature is, by the hypersurface Gauss and mean-variation formulas,
  #[#set math.equation(numbering: n => "(6.49)")
   $ R_(g_o) = R_t \( 1 - U^(- 2) \) + 2 H_E U^(- 3) partial_t U - 2 U^(- 1) Delta_(gamma_t) U = 0 \,
     $ <eq:stress-af-scalar-zero>]
  where the final equality is exactly (6.46). The positive bounds on $U$ and the Euclidean completeness of the
    parallel exterior give completeness with the boundary included.
    There is precisely one end, and $g_o - delta = \( U^2 - 1 \) d t^2$ has the stated decay.
  Define
  $ cal(M) \( t \) = integral_(cal(C)_t) H_E \( 1 - U^(- 1) \) thin #h(-0.16667em) upright(d) A_(gamma_t) . $
  The Euclidean identities $partial_t H_E = - \| upright("II")_E \|^2$, $partial_t d A = H_E d A$,
    and $H_E^2 - \| upright("II")_E \|^2 = R_t$, together with (6.46), give
  #[#set math.equation(numbering: n => "(6.50)")
   $ cal(M)' \( t \) & = integral_(cal(C)_t) [R_t \( 1 - U^(- 1) \) + H_E U^(- 2) partial_t U] thin #h(-0.16667em)
     upright(d) A\
 & = - 1 / 2 integral_(cal(C)_t) R_t \( U + U^(- 1) - 2 \) thin #h(-0.16667em) upright(d) A lt.eq
   0 . $ <eq:stress-shitam-monotonicity>]
  Here the integral of $Delta_(gamma_t) U$ vanishes. The asymptotic bounds show that $cal(M)$ is bounded and that
    its derivative is integrable at infinity, so it has a finite limit.
  We identify the limit with the ADM mass in the normalization (2.1).
    For the purely normal Euclidean metric error $e' = \( U^2 - 1 \) d t^2$,
    the ADM flux through the parallel surface is exactly
  $ integral_(cal(C)_t) \( "div"_delta e' - d "tr"_delta e' \) \( partial_t \) thin #h(-0.16667em) upright(d) A =
    integral_(cal(C)_t) H_E \( U^2 - 1 \) thin #h(-0.16667em) upright(d) A . $
  The normal derivatives of $U^2 - 1$ cancel, and $nabla_(partial_t) partial_t = 0$ in the Euclidean metric,
    leaving only the tangential divergence $H_E$. The scalar-curvature linearization and $R_(g_o) =
    0$ show that the divergence of this Euclidean flux is $O \( \| x' \|^(- 4) \)$.
    Its integral between a large parallel and a comparable large round sphere tends to zero;
    thus it computes the ordinary ADM mass. Finally
  $ \( U^2 - 1 \) - 2 \( 1 - U^(- 1) \) = O \( \( U - 1 \)^2 \) $
  and $H_E thin "Area" \( cal(C)_t \) = O \( t \)$, so
  #[#set math.equation(numbering: n => "(6.51)")
   $ 16 pi m_o = lim_(t arrow.r oo) integral_(cal(C)_t) H_E \( U^2 - 1 \) thin #h(-0.16667em) upright(d) A =
     2 lim_(t arrow.r oo) cal(M) \( t \) lt.eq 2 cal(M) \( 0 \) . $ <eq:stress-adm-identification>]
  As $H_E \/ U \( 0 \) = H_o$, this proves (6.40). Combining it with (6.44) gives (6.32).
  Lastly, convexity gives $gamma_t \( V \, V \) =
    gamma_0 \( \( "Id" + t upright("II")_E^sharp \) V \, \( "Id" + t upright("II")_E^sharp \) V \) gt.eq
    gamma_0 \( V \, V \)$. The metric in (6.48) has no mixed normal–tangential terms.
    Its projection along the parallels to $\( cal(C) \, gamma_0 \)$ therefore has operator norm at most one,
    and hence upper two-dimensional Jacobian at most one. This is the area comparison required in the later
    transfer argument. ◻
]

All data in Proposition 30 are now fixed before the compact graph parameters are chosen.
  On $S$ and $cal(C)$ we use the base normals directed toward the end;
  derivatives and fluxes on the two sides of $cal(C)$ use $g$ and $g_o$ respectively.
  Their boundary area forms agree. In the next section the notation $tau =
  "tr"_g K$ refers to the synthetic trace, not to the original asymptotic decay exponent.

== 7 The compact graph construction <sec:compact-construction>

Fix the compact data and the asymptotically flat attachment supplied by Proposition 30.
  Thus the connected compact inner manifold $\( Omega_i \, g \)$ has boundary $S union.sq cal(C)$,
  where $cal(C)$ is a sphere, and carries a smooth negative definite tensor $K$. Put $tau = "tr"_g K$.
  The smooth exterior $\( Omega_o \, g_o \)$ is scalar flat and asymptotically flat.
  The induced metrics on $cal(C)$ agree. All normals $n$ at $S$ and $cal(C)$ point towards the designated end;
  in particular the outward normal of $Omega_i$ at $S$ is $- n$.
  Write $k_T = "tr"_(T cal(C)) K$ on the seam and use the analogous notation on $S$. The fixed data satisfy

#[#set math.equation(numbering: n => "(7.1)")
 $ H_g \( S \) lt.eq 0 \, wide H_i > \| k_T \| \, wide H_o = sqrt(H_i^2 - k_T^2) \,\
D \( v \) := R_g + tau^2 - \| K \|^2 - 2 \( "div"_g K - #h(-0.16667em) upright(d) tau \) \( v \) > 0
  quad \( \| v \|_g lt.eq 1 \) . $ <eq:compact-base-data>]

No deformation parameter changes these base data. In this section every integral without a metric subscript uses
  the base metric on its own side. Piecewise integrals mean the sum of the two such integrals.
  Constants may depend on these fixed smooth data.

On $Omega_i$ define the fields, for $N_i > 0$, by

#[#set math.equation(numbering: n => "(7.2)")
 $ p = s^2 nabla f \, wide s^2 + \| #h(-0.16667em) upright(d) f \|^2 s^4 = N_i^2 \, wide v = p \/ N_i \,\
z = \| v \| \, quad y = z^2 \, quad d = sqrt(1 - y) \, quad W = d^(- 1) = N_i \/ s . $ <eq:compact-constitutive>]

The positive root specifies $s$ smoothly, including at $#h(-0.16667em) upright(d) f = 0$.
  On a constant-height boundary we write $hat(z) = v dot.op n$.
  On $Omega_o$ put $f = p = 0$, $s = N_o$, $W = 1$, and $macron(g) = g_o$; inside put $macron(g) = g +
  s^2 #h(-0.16667em) upright(d) f^2$. On either side set $x = s w$, $h = x macron(g)$, and $A =
  N s macron(g)^(- 1)$, with $N = N_i$ or $N_o$. Here $d$ is a scalar,
  whereas $#h(-0.16667em) upright(d)$ denotes differentiation.

For a finite height $M gt.eq 1$ and a homotopy parameter $u_(*) in \[ 0 \, 1 \]$ the equations are

#[#set math.equation(numbering: n => "(7.3)")
 $ "div"_g p & = T N_i &  & upright("on ") Omega_i \,\
B & = nabla N_i - \( u_(*) K + ell g \) p \, wide ell = T - u_(*) tau &  & upright("on ") Omega_i \,\
B & = nabla N_o \, wide Sigma_(-) = 0 &  & upright("on ") Omega_o \,\
"div" B & = Sigma_(+) + Sigma_(-) \, wide - "div" \( A #h(-0.16667em) upright(d) w \) = Sigma_(+) x +
  P &  & upright("on each side") . $ <eq:compact-system>]

We first truncate the exterior at a smooth distant coordinate sphere $cal(S)_R$. The complete boundary conditions are

#[#set math.equation(numbering: n => "(7.4)")
 $ S & f = u_(*) M \, quad B_n = - b_(*) \, quad \( A #h(-0.16667em) upright(d) w \)_n = 0 \,\
cal(C) & f = 0 \, quad N_o = s_i \, quad \( B_i \)_n = \( B_o \)_n \, quad w_i = w_o \,
  quad \( A_i #h(-0.16667em) upright(d) w_i \)_n = \( A_o #h(-0.16667em) upright(d) w_o \)_n \,\
cal(S)_R & N_o = w = 1 . $ <eq:compact-boundary>]

Here $b_(*) > 0$ is fixed throughout the homotopy. Eventually $R arrow.r oo$ with every other parameter fixed,
  and the last row becomes $N_o \, w arrow.r 1$.

We specify all cutoffs used in these equations. Let $d_S$ be a fixed smooth function,
  positive away from $S$ and equal to inward distance on a collar of $S$. Set $F = u_(*) M - f$.
  The quotient $F \/ d_S$ at $S$ is its continuous extension.
  For example, in that collar it equals $integral_0^1 partial_n F \( q \, t d_S \) thin #h(-0.16667em) upright(d)
  t$; hence it has one fewer controlled derivative than $F$ in the relevant Hölder spaces.
  Choose smooth cutoffs whose product $chi_T$ is supported where

#[#set math.equation(numbering: n => "(7.5)")
 $ F < M \/ 10 \, wide z < 1 \/ 2 \, wide F N_i sqrt(x) < M^(- 1) \, wide N_i F \/ d_S < M^(- 1) \,
   $ <eq:compact-trace-cutoff>]

and equals one if all four upper bounds hold with an additional factor $1 \/ 2$.
  The slope cutoff is a smooth function of $z^2$. The other scalar cutoffs are extended as one for sufficiently
  negative arguments. Define

#[#set math.equation(numbering: n => "(7.6)")
 $ T = u_(*) tau \( 1 - chi_T \) \, wide Sigma_(-) = - 1 / 2 N_i ell^2 zeta \( N_i \) \, wide Sigma_(+) =
   u_(*) L W eta_M chi_x \( x \) chi_N \( N \/ epsilon \) . $ <eq:compact-sources>]

The fixed smooth function $zeta$ lies in $\[ 0 \, 1 \]$, equals one for $N lt.eq delta_0$,
  and vanishes for $N gt.eq 2 delta_0$. Here $0 < delta_0 \, b_(*) \, delta < 1$, $L gt.eq 1$, $0 < epsilon < 1$;
  $chi_x = 1$ on $x lt.eq 1 - delta$ and is zero on $x gt.eq 1 - delta \/ 2$, whereas $chi_N = 0$ on $N lt.eq
  epsilon$ and is one on $N gt.eq 2 epsilon$. In particular

#[#set math.equation(numbering: n => "(7.7)")
 $ u_(*) tau lt.eq T lt.eq 0 \, quad \| ell \| lt.eq C \, quad - C N_i lt.eq Sigma_(-) lt.eq 0 \, quad
   parallel Sigma_(-) parallel_(L^1) lt.eq C delta_0 \, quad 0 lt.eq Sigma_(+) lt.eq L W . $ <eq:compact-source-size>]

The spatial cutoff $eta_M$ is chosen as follows. Let $psi_oo$ be the exterior capacitary potential,
  equal to one on $cal(C)$ and zero at infinity. Fix a large radius $R_delta$ beyond which $psi_oo < delta$.
  Such a potential and radius follow from scalar Dirichlet theory and the barriers $C \| x' \|^(- beta)$,
  $0 < beta < 1$, on the fixed asymptotically flat end. Fix an exterior collar width $a_o > 0$.
  The designated set $cal(D)_M$ consists of all of $Omega_i$ except an inner seam collar of width $2 M^(- 4)$,
  together with the exterior between collar distance $2 a_o$ and radius $R_delta$.
  Enlarge $R_delta$ if necessary to contain that collar. Take $eta_M = 1$ on a neighborhood of $cal(D)_M$,
  supported away from the seam, with inner separation at least $M^(- 4)$ and exterior separation at least $a_o$,
  and with support in a common compact region. All spatial cutoffs below have slightly nested supports of this
  kind. Thus $N_o$ is harmonic on the fixed exterior seam collar.
  The choice of $R_delta$ does not involve an unknown solution:
  the exterior equations give $N_o Delta_(g_o) x = - P lt.eq 0$, so comparison gives

#[#set math.equation(numbering: n => "(7.8)")
 $ x gt.eq 1 - psi_oo quad upright("on ") Omega_o . $ <eq:compact-capacity-comparison>]

The same comparison holds on truncations since the right side is at most one on $cal(S)_R$.
  Consequently every exterior point with $x < 1 - delta$ lies inside the fixed radius $R_delta$.

There are two further sources, $P = u_(*) \( P_1 + P_2 \)$. Put $T_1 = M^(9 \/ 10)$ and $T_2 = C_2 \/ epsilon$.
  The source $P_1$ is an adjustable finite constant $D_1$ times smooth cutoffs,
  supported inside where $f > M \/ 2$ and $w < 4 T_1$, and equal to $D_1$ where $f gt.eq 4 M \/ 5$ and $w lt.eq
  2 T_1$. The source $P_2$ is $D_2$ times smooth cutoffs on the two spatial supports just described,
  vanishes if $N gt.eq 4 epsilon$ or $w gt.eq 4 T_2$, and equals $D_2$ on a neighborhood of $cal(D)_M$ where $N
  lt.eq 3 epsilon$ and $w lt.eq 2 T_2$. The constants $C_2 \, D_1 \, D_2$ will be chosen below.
  Every equation is a smooth finite equation on the open domain $N_i \, N_o \, w > 0$.

#thm([Proposition 7.1.])[
  (Finite compact construction).  #emph[Fix base data satisfying (7.1).
    Fix $b_(*) \, delta_0 \, delta \, a_o > 0$ and $L gt.eq 1$.
    For every sufficiently large finite $M$, $C_2$ can be chosen depending on these parameters,
    and then $epsilon > 0$ can be chosen arbitrarily small and $D_1 \, D_2$ sufficiently large but finite,
    so that (7.3)–(7.4) at $u_(*) = 1$ has a positive solution on the full attached exterior.
    It is smooth on each closed side of $cal(C)$ and tends to the specified values at infinity. It satisfies
#[#set math.equation(numbering: n => "(7.9)")
 $ 0 lt.eq f lt.eq M \, wide N_i \, N_o lt.eq C \( L \) M \, wide integral_(Omega_i) W^2 lt.eq C \( L \) M^2 \,\
N_i gt.eq c epsilon \, wide s_i \, N_o gt.eq c \( M \, L \) epsilon . $ <eq:compact-bounds>]

 The constants in these bounds do not depend on $epsilon \, D_1 \, D_2$ or the outer truncation.
   Dependence on the fixed data and on the preceding parameters is suppressed.
   At fixed $M \, L \, epsilon$, the lapse and height have uniform local continuity bounds off the seam,
   including at $S$, independent of $D_1 \, D_2$. Moreover
#[#set math.equation(numbering: n => "(7.10)")
 $ w gt.eq M^(9 \/ 10) quad upright("where ") f gt.eq 9 M \/ 10 \, wide x gt.eq 1 quad
   upright("on ") cal(D)_M ∩ { N lt.eq 2 epsilon } \, $ <eq:compact-penalty-targets>]

 and
#[#set math.equation(numbering: n => "(7.11)")
 $ integral P_1 lt.eq C \( L \) M^(- 1 \/ 10) \, wide integral P_2 lt.eq omega_M \( epsilon \) \, wide
   omega_M \( epsilon \) arrow.r 0 quad \( epsilon arrow.b 0 \) . $ <eq:compact-penalty-cost>]

 The function $omega_M$ is uniform in the finite strengths and outer radius. In particular
#[#set math.equation(numbering: n => "(7.12)")
 $ integral_(cal(D)_M ∩ { x < 1 - delta }) W lt.eq C \/ L \, $ <eq:compact-bad-volume>]

 where $C$ is independent of $L \, M \, epsilon \, D_1 \, D_2$.
   On the smooth sides the metric $h = x macron(g)$ obeys the scalar and boundary identities (7.22) and (7.23)
   below. Its asymptotically flat mass satisfies
#[#set math.equation(numbering: n => "(7.13)")
 $ m_h lt.eq m_o + C \( b_(*) + delta_0 \) + C \( L \) M^(- 1 \/ 10) +
   C omega_M \( epsilon \) . $ <eq:compact-mass-budget>]

 Thus the parameter order is: fix the base data; choose $b_(*) \, delta_0$ for the mass tolerance;
   choose $delta \, a_o$ and then $L$ for the area tolerance; choose $M$ large; choose $C_2$;
   choose $epsilon$ small; choose the finite strengths; and finally let the outer radius tend to infinity.]
] <prop:compact-solutions>

We prove estimates for positive zeros in the Hölder domain used for continuation in Section 8,
  before invoking existence. Thus $f in C^(3 \, alpha') \( overline(Omega)_i \)$ and $N \,
  w in C^(2 \, alpha')$ on each closed side, for the fixed positive exponent $alpha'$ selected there.
  This is membership in the domain, not an a priori bound on its norm.
  No a priori derivative bound on a cutoff is used in the following finite estimates.

#thm([Lemma 7.2.])[
  (Lapse and slope bounds).  #emph[Every such positive zero, for $0 lt.eq u_(*) lt.eq
    1$ and sufficiently large outer radius, satisfies (7.9), with $M$ replacing the upper height bound by $u_(*)
    M$. These estimates are independent of the strengths of $P_1 \, P_2$ and of all derivatives of $T$.]
] <lem:compact-lapse>

#proof[
  The minimum principle for the height equation gives $f gt.eq 0$ because $T lt.eq 0$.
    A maximum exceeding $u_(*) M$ has $F < 0$ and $z = 0$, so every trace cutoff is fully active in its
    neighborhood and $T = 0$ there. The strong maximum principle, applied on the exceeding set,
    excludes such a maximum. Hence $0 lt.eq f lt.eq u_(*) M$.
  Let $psi_R$ be harmonic on the truncated exterior, one on $cal(C)$ and zero on $cal(S)_R$, and set $gamma_R = -
    partial_n psi_R \|_(cal(C))$. The functions $gamma_R$ have uniform positive upper and lower bounds.
    Also $psi_R$ has a uniform positive lower bound on all exterior source supports.
    To check uniformity, compare $psi_R$ from below with a fixed finite annular capacitary solution and from above
    with $psi_oo$, and apply boundary estimates and the Hopf lemma on a fixed collar.
    Green’s formula on the exterior and the divergence theorem on the inside give
  #[#set math.equation(numbering: n => "(7.14)")
   $ integral_(Omega_i) Sigma_(+) + integral_(Omega_o) psi_R Sigma_(+) + integral_(cal(C)) gamma_R s_i =
     integral_(cal(C)) gamma_R + integral_S b_(*) - integral_(Omega_i) Sigma_(-) lt.eq C . $ <eq:compact-capacity>]
  For example the seam contribution in the exterior Green formula is $- B_n - gamma_R N_o$,
    and its far contribution is $- partial_n psi_R$; the harmonic flux identity for $psi_R$ gives the displayed
    signs. The constant uses only $integral \| Sigma_(-) \| lt.eq C delta_0$. In particular $min_(cal(C)) s_i lt.eq C$.
  Testing the height equation with $f$ and using its two constant traces gives,
    since $p dot.op #h(-0.16667em) upright(d) f = W^2 - 1$,
  #[#set math.equation(numbering: n => "(7.15)")
   $ integral_(Omega_i) \( W^2 - 1 \) = - u_(*) M integral_S p_n - integral_(Omega_i) f T N_i lt.eq
     C M sup_(Omega_i) N_i . $ <eq:compact-height-energy>]
  For the lower lapse estimate freeze $Z = \( u_(*) K + ell g \) v$, which satisfies $\| Z \| lt.eq C$,
    and freeze the positive seam function $d = s_i \/ N_i lt.eq 1$.
    Solve the homogeneous density problem with current $nabla hat(N)_i - Z hat(N)_i$ inside,
    ordinary gradient outside, divergence zero, zero current flux at $S$, matching current at the seam,
    $hat(N)_o = d hat(N)_i$, and outer value one. This is an independent linear problem.
    Its scalar Fredholm assertion is proved in Lemma 37, using only frozen linear estimates,
    without the present nonlinear estimates. Its adjoint has operator $Delta + Z dot.op nabla$ inside,
    ordinary Laplacian outside, ordinary Neumann condition at $S$, continuous value at $cal(C)$,
    and $partial_n h_i = d partial_n h_o$ there. The maximum and Hopf principles give zero adjoint kernel,
    hence invertibility. Dual testing with nonpositive scalar forcing gives $hat(N) gt.eq 0$.
    Harnack and the Hopf lemma give strict positivity, also at the seam:
    a zero there would be a zero on both sides and the opposite Hopf derivative signs contradict current matching.
    The Hölder domain gives $d in C^(2 \, alpha')$ and $Z in C^(1 \, alpha')$ (in fact $Z in C^(2 \, alpha')$),
    so the independent scalar lemma applies separately to each frozen problem.
    Its inverse may depend on these coefficient norms. The uniform estimate below uses only $\| Z \| lt.eq
    C$ and $0 < d lt.eq 1$ and does not use those inverse norms.
  Put $H_(*) := sup hat(N)_i$. The homogeneous version of (7.14) implies $H_(*) gt.eq 1$,
    and exterior comparison gives $hat(N)_o lt.eq H_(*)$. We claim, uniformly in the frozen fields,
  #[#set math.equation(numbering: n => "(7.16)")
   $ inf_(Omega_i) hat(N)_i gt.eq c H_(*) . $ <eq:compact-homogeneous-harnack>]
  Here it is essential that no lower bound on $d$ is required.
    In Fermi coordinates on the two sides reflect the normalized exterior field into the inside and add it to
    $hat(N)_i \/ H_(*)$. The two coefficient matrices, including volume densities,
    agree on the face and differ by $O \( \| t \| \)$ at distance $\| t \|$ from it.
    For the positive exterior harmonic field, interior gradient estimates and Harnack on balls of radius
    comparable to $\| t \|$ give $\| t \| thin \| nabla hat(N)_o \| lt.eq C hat(N)_o$.
    Consequently the sum $U$ satisfies a uniformly elliptic divergence equation with flux correction bounded by $C
    U$ and zero natural flux on the face. Expressing that correction as a bounded vector times $U$ and reflecting
    again gives the ordinary divergence drift Harnack inequality.
    Harnack chains on the fixed inner region, together with this collar estimate and normalization by the inner
    supremum, give a uniform positive lower bound for $U$ on the seam.
    The inner trace is at least $U \/ 2$, because $hat(N)_o = d hat(N)_i lt.eq hat(N)_i$.
  To carry this trace bound uniformly into a collar, take a smooth small half-domain of radius $h$ in an inner
    chart and replace the normalized inner field by its harmonic function with the same boundary data.
    The replacement error is at most $C h$: the divergence forcing $Z hat(N)_i \/ H_(*)$ is bounded,
    and scaled zero-Dirichlet $W^(1 \, p)$ estimates with $p > 3$ give precisely that bound.
    The harmonic replacement has a fixed positive lower bound centrally up to its flat face,
    by the lower face data and nonnegative remaining data. First choose $h$ small enough and then use interior
    Harnack chains. This proves (7.16).
  The ratio $r_N = N \/ hat(N)$ is continuous across the seam.
    On a sublevel $r_N < epsilon \/ H_(*)$ we have $N < epsilon$, so $Sigma_(+) = 0$ and $Sigma_(-) lt.eq 0$.
    Dividing the density equation by $hat(N)$ gives a scalar supersolution inequality with no zeroth order term.
    At the seam its normal derivatives match with positive weights $hat(N)_i \, hat(N)_o$; the flux $-
    b_(*)$ at $S$ has the favorable sign for a minimum. The minimum and boundary point principles exclude a
    minimum below $epsilon \/ H_(*)$. Therefore $N_i gt.eq \( epsilon \/ H_(*) \) hat(N)_i gt.eq c epsilon$.
  Next suppose, with $L$ fixed, that the upper estimate fails.
    Along a sequence write $N_(*) := sup N_i$ with $N_(*) \/ M arrow.r oo$.
    The exterior maximum is bounded by $max \( N_(*) \, 1 \)$ since $Delta N_o gt.eq 0$. By (7.15),
  $ parallel Sigma_(+) \/ N_(*) parallel_(L^2 \( Omega_i \)) lt.eq C L #scale(x: 120%, y: 120%)[\(] N_(*)^(- 2) +
    M \/ N_(*) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) arrow.r 0 . $
  The normalized negative source also tends to zero, and the exterior source tends uniformly to zero.
    Equation (7.14) shows that $N_o \/ N_(*)$ has seam trace tending to zero in $L^1$.
    The normalized exterior field tends to zero on every open exterior compact set.
    Indeed it is bounded above by $N_(*)^(- 1)$ plus the positive harmonic extension, decaying at infinity,
    of its nonnegative seam trace. That extension is bounded by $psi_oo$ and tends locally to zero off the seam by
    the $L^1$ trace convergence, using a fixed annular Poisson estimate and then the decay of $psi_oo$.
  The reflected sum of the actual normalized lapses is uniformly Hölder continuous up to the seam by the preceding
    reflected-sum argument, now with scalar forcing tending to zero in $L^2$.
    Interior Laplace divergence estimates give the same compactness away from the seam and at $S$.
    After passage to a subsequence the open inner limit $V$ extends continuously to the seam using the limit of
    the sum. It is nonnegative and nonzero: an inner supremum equal to one either lies away from the seam or gives
    a sum at least one in the seam collar. With $Z$ converging weakly star,
    this limit satisfies the homogeneous density equation with natural zero flux on both inner faces.
    Here is a way to justify the latter assertion without individual inner trace compactness.
    Use inner smooth test functions with ordinary zero normal derivative at both faces,
    extended across the seam with matching values and outer support in the harmonic collar.
    Integrate the lapse derivatives onto the tests. All outer volume and trace terms vanish by the convergence
    just proved, as do the normalized sources and $b_(*)$. Thus
  $ integral_(Omega_i) #scale(x: 120%, y: 120%)[\(] V Delta phi +
    V Z_oo dot.op nabla phi #scale(x: 120%, y: 120%)[\)] = 0 quad
    upright("for every smooth ordinary Neumann test ") phi . $
  Solve the Neumann Laplace problem with divergence datum $V Z_oo$.
    Testing the difference by Neumann Poisson solutions shows that its solution differs from $V$ by a constant.
    Hence $V in H^1$ and the natural zero-flux equation holds in the usual weak sense.
    Reflection and Harnack show $V > 0$ on the whole closed inner region.
    In particular the original normalized inner fields are bounded below away from the seam; near it the sum,
    the trace inequality, and the harmonic replacement argument above give the same lower bound.
    The replacement error now has the additional vanishing scaled $L^2$ forcing term.
  We reach a contradiction by the differential estimate of Lemma 12.
    Put $G = - log s$ and maximize $G + j \( f \)$ on $Omega_i$, where $j \( f \) =
    D \( f^2 - 2 M f \)$ and $D > 0$ is fixed sufficiently large depending on $L$.
    Since $j lt.eq 0$ on the height range and $j \( 0 \) = 0$, at the maximum $s lt.eq min_(cal(C)) s lt.eq C$.
    Since $N_i gt.eq c N_(*)$ there, $y arrow.r 1$. At an interior maximum that lemma gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ j'' q \| #h(-0.16667em) upright(d) f \|^2 lt.eq C { 1 +
     Sigma_(+) \/ N_i + \( 1 - y \)^2 \( j' \| #h(-0.16667em) upright(d) f \| \)^2 } \, wide q =
     frac(1 - y, 1 + y) . $ <eq:compact-gradient-test>]
  Use $q \| #h(-0.16667em) upright(d) f \|^2 = J \/ s^2$, $J = y \/ \( 1 + y \)$, $Sigma_(+) \/ N_i lt.eq L \/ s$,
    and $\( 1 - y \)^2 \( j' \| #h(-0.16667em) upright(d) f \| \)^2 lt.eq \( j' \/ N_i \)^2 = o \( 1 \)$.
    Multiplication by $s^2$ contradicts (7.17) once $D$ exceeds a fixed multiple of $1 +
    L$ and the fixed upper bounds for $s^2$ and $s$ at this maximum.
  At a constant-height boundary, write $hat(z) = v dot.op n lt.eq 0$. Lemma 11 gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ d^2 partial_n \( G + j \( f \) \) = - B_n \/ N_i + u_(*) k_T hat(z) - y H +
     j' hat(z) \/ N_i . $ <eq:compact-boundary-gradient>]
  At $S$ this is strictly positive because $j' lt.eq 0$, $H lt.eq 0$, $k_T < 0$, and $B_n = - b_(*)$.
    That is impossible for an inward derivative at a maximum. At a seam maximum $s$ is its seam minimum.
    The positive harmonic exterior lapse on the fixed collar satisfies $B_n gt.eq - C s$ at that point:
    compare with the seam minimum times a fixed harmonic function equal to one on the seam and zero on the other
    collar boundary. Equation (7.18) is then at most $C d + \| k_T \| z - y H_i + o \( 1 \) < 0$,
    using $H_i > \| k_T \|$. That is impossible for an outward derivative at a maximum.
    This proves $N_i \, N_o lt.eq C \( L \) M$ and, by (7.15), the stated $L^2$ estimate for $W$.
  Finally keep $M \, L$ fixed and suppose $inf s_i \/ epsilon arrow.r 0$.
    Choose a fixed smooth $j$ on $\[ 0 \, M \]$ with $j'' > 0$ and $0 < j' < b_(*) \/ 2$.
    At a maximum of $G + j \( f \)$, bounded oscillation of $j$ implies $s_i \/ epsilon arrow.r 0$.
    The lapse floor gives $y arrow.r 1$. Multiply (7.17) by $s^2$:
    its left side stays positive, while its right side is bounded by $C \( s^2 + L s + \( j' \)^2 d^2 \)$ and
    tends to zero. At $S$, the first and last terms of (7.18) have sum at least $\( b_(*) - j' \) \/ N_i > 0$.
    At the seam its last term is nonpositive, and the same harmonic collar comparison makes the derivative
    strictly negative. These contradictions prove $s_i gt.eq c \( M \, L \) epsilon$.
    On the exterior, below the level $epsilon$ the positive source vanishes and the lapse is harmonic.
    Its boundary values and the minimum principle therefore give $N_o gt.eq c \( M \, L \) epsilon$ too. ◻
]

#thm([Lemma 7.3.])[
  (Finite penalty selection).  #emph[For fixed preceding parameters the sources can be selected with finite
    strengths to obtain (7.10)–(7.12) in every actual positive solution, uniformly in the outer truncation.
    Their costs obey (7.11).]
] <lem:compact-penalties>

#proof[
  All assertions in this proof concern $u_(*) = 1$. First choose $C_2 gt.eq c \( M \, L \)^(- 1)$ from Lemma 32,
    so that $s T_2 gt.eq 1$. This precedes the choice of $epsilon$.
    For a piecewise Lipschitz test $phi$ with common seam value and zero outer value,
    testing the positive $w$ equation with $phi^2 \/ w$ gives
  #[#set math.equation(numbering: n => "(7.19)")
   $ integral P phi^2 / w lt.eq integral A \( #h(-0.16667em) upright(d) phi \,
     #h(-0.16667em) upright(d) phi \) . $ <eq:compact-penalty-test>]
  Indeed the omitted term $Sigma_(+) x phi^2 \/ w$ is nonnegative,
    and completing the square in the two derivative terms gives the right side.
    Flux matching cancels the seam terms and the inner flux is zero.
  Take $phi = f \/ M$, extended by zero outside. Directly from (7.2), $A \( #h(-0.16667em) upright(d) f \,
    #h(-0.16667em) upright(d) f \) = W - W^(- 1)$. On the support of $P_1$ we have $phi > 1 \/ 2$ and $w < 4 T_1$. Thus
  $ integral P_1 lt.eq frac(16 T_1, M^2) integral_(Omega_i) W lt.eq C \( L \) M^(- 1 \/ 10) \, $
  by Cauchy–Schwarz and (7.9).
  For $P_2$ take spatial localizers equal to one on its supports and vanishing on slightly larger collars of the
    seam, multiplied by a scalar cutoff of $N \/ epsilon$ which is one below four and zero above five.
    These tests may meet $S$ and have zero seam value on each side.
    Since $A lt.eq N^2 g_(upright("base"))^(- 1)$ and $w < 4 T_2$ on the source support,
  #[#set math.equation(numbering: n => "(7.20)")
   $ integral P_2 lt.eq C_M epsilon + C_M epsilon^(- 1) integral_(cal(U) ∩ { N < 5 epsilon }) \| nabla N \|^2 .
     $ <eq:compact-low-lapse-cost>]
  The fixed localization sets $cal(U)$ stay away from the seam;
    constants here may depend on $M$ and every preceding parameter.
    Testing the lapse equation with a squared spatial cutoff times $\( 6 epsilon - N \)^(+)$ gives
  #[#set math.equation(numbering: n => "(7.21)")
   $ integral_(cal(U) ∩ { N < 5 epsilon }) \| nabla N \|^2 lt.eq C_M epsilon^2 +
     C epsilon integral_(cal(U)' ∩ { N < 6 epsilon }) Sigma_(+) . $ <eq:compact-low-lapse-energy>]
  To check the signs, on this sublevel the current correction has size at most $C N lt.eq C epsilon$,
    so Young’s inequality absorbs its gradient term and the cutoff terms cost $C_M epsilon^2$.
    The negative source can be discarded. At $S$ the outward current equals $b_(*) > 0$,
    so its contribution decreases the right side of the energy inequality.
  We next prove that the last integral tends uniformly to zero as $epsilon arrow.b 0$.
    This step does not use a positive lapse floor. If uniformity failed, take a violating sequence.
    Equations (7.15) and (7.9) bound the positive sources in $L^2$, independently of $epsilon$ and the strengths.
    The lapse equation with bounded divergence datum $Z N$ therefore gives local $W^(1 \, p)$ bounds for every
    $3 < p < 6$, also at $S$ with the fixed flux data. After passing to a subsequence,
    the lapses converge uniformly to a nonnegative function $V$ on the localization sets,
    the drifts converge weakly star, and the sources converge weakly in $L^2$. The limit equation has the form
  $ Delta V = "div" \( Z_oo V \) + g_1 . $
  The negative-source limit vanishes almost everywhere on ${ V = 0 }$ because $\| Sigma_(-) \| lt.eq C N$.
  For completeness the scalar source $g_1$ also vanishes there.
    Let $q$ be a density point of ${ V = 0 }$ and a Lebesgue point of $g_1$ and $\|
    g_1 \|^2$ in an interior chart. Rescale a ball of radius $r$ to a unit ball and divide $V$ by $r^2$.
    The resulting nonnegative functions vanish at the center.
    The inhomogeneous Harnack estimate gives a uniform bound on a smaller ball:
    the rescaled drift is $r Z_oo$, and the rescaled scalar forcing has bounded $L^2$ norm at this Lebesgue point.
    Since the zero sets occupy a fraction tending to one, the rescaled functions tend to zero in local $L^1$.
    Testing their equations against a fixed smooth bump, with derivatives transferred to that bump,
    gives $g_1 \( q \) = 0$. Thus the nonnegative positive-source limit $sigma_(+)$ vanishes almost everywhere on
    ${ V = 0 }$ as well. Boundary points do not matter for these volume integrals.
    For each $t > 0$, uniform convergence implies ${ N < 6 epsilon } subset { V lt.eq
    t }$ along the sequence eventually. Weak $L^2$ convergence,
    tested against the characteristic function of this fixed set, and then $t arrow.b 0$, show
  $ limsup integral_(cal(U)' ∩ { N < 6 epsilon }) Sigma_(+) lt.eq integral_(cal(U)' ∩ { V = 0 }) sigma_(+) = 0 . $
  Combining this with (7.20) and (7.21) proves the second cost in (7.11), uniformly in both strengths.
  Now fix such an $epsilon$. The lapse and slope bounds give uniform ellipticity, independent of strengths.
    They also give uniform continuity of $N$ and $f$ on the localization sets.
    For $N$, use the same Laplace divergence estimates, now with bounded scalar forcing;
    for $f$ the already established gradient bound suffices. Consequently each point with $f gt.eq
    9 M \/ 10$ has a neighborhood of a uniform positive radius on which $f gt.eq 4 M \/ 5$.
    It is uniformly separated from the seam unless the neighborhood ends at $S$,
    where the constant trace permits reflection. Likewise every point of $cal(D)_M ∩ { N lt.eq
    2 epsilon }$ has a uniform neighborhood within the full spatial cutoff range and with $N lt.eq 3 epsilon$.
  In either neighborhood let $T_j$ be its corresponding threshold.
    The volume of ${ w lt.eq 2 T_j }$ there is at most $D_j^(- 1) integral P_j$,
    hence tends uniformly to zero as $D_j arrow.r oo$. The function $\( 2 T_j - w \)^(+)$ is a bounded weak
    subsolution of the homogeneous scalar divergence equation with coefficient $A$.
    Its local supremum is bounded by its $L^2$ mean, with a uniform constant on these fixed neighborhoods;
    at $S$ use the homogeneous natural-flux reflection. Since its support has the preceding small volume and its
    value is at most $2 T_j$, this supremum is strictly less than $T_j$ once the strength is sufficiently large.
    This gives $w gt.eq T_1$ on the height target and $w gt.eq T_2$ on the low-lapse target.
    The latter implies $x gt.eq 1$ since $s T_2 gt.eq 1$. The choices can be made with a strict margin,
    so the weak inequalities survive limits of outer truncations.
  If $x < 1 - delta$ at a designated point, the second target now forces $N > 2 epsilon$.
    All cutoffs in $Sigma_(+)$ equal one, so $Sigma_(+) = L W$ there.
    Apply (7.14), using the positive lower bound of $psi_R$ on the common exterior support.
    This proves (7.12) with a constant independent of $L \, M \, epsilon$ and the strengths. ◻
]

#proof[
  Choose the parameters in the stated order, using Lemmas 32 and 33.
    Proposition 34, proved independently in the next section,
    now supplies a positive zero for each sufficiently large compact truncation.
    Its hypotheses are exactly the finite smooth cutoffs above, the homotopy bounds of Lemma 32,
    and the fixed exterior harmonic collar. Its continuation starts with the ordinary scalar transmission problem
    at $u_(*) = 0$; it does not assume solvability of the coupled problem.
    That proposition also supplies an expanding-truncation subsequence converging smoothly on compact subsets of
    each closed side, with $N_o \, w arrow.r 1$ at infinity. All the bounds and penalty conclusions pass to this
    limit. This is the only invocation of nonlinear existence in the present proof.
  We record the geometric conclusions precisely. Set $pi = N_i^(- 1) "sym" nabla p^flat$, $lambda = pi -
    K$ inside, and set these fields to zero outside. Lemma 10, applied at $u_(*) = 1$, gives
  #[#set math.equation(numbering: n => "(7.22)")
   $ x R_h = D \( v \) + \| lambda \|^2 - ell^2 - 2 Sigma_(-) \/ N + 2 P \/ \( N x \) + 3 /
     2 \| #h(-0.16667em) upright(d) log x \|_(macron(g))^2 . $ <eq:compact-scalar>]
  On the exterior take $D = R_(g_o) = 0$. The current $Q = B +
    A #h(-0.16667em) upright(d) w$ has matching normal flux and $"div" Q = \( 1 - x \) Sigma_(+) + Sigma_(-) - P$.
    At a constant-height face, Lemma 11 gives
  #[#set math.equation(numbering: n => "(7.23)")
   $ s sqrt(x) thin H_h = N \( H - k_T hat(z) \) + B_n + \( A #h(-0.16667em) upright(d) w \)_n \/ x .
     $ <eq:compact-mean-curvature>]
  At $S$ this is strictly negative. At $cal(C)$ the induced metrics agree, because $s_i =
    N_o$ and $w$ is continuous. The seam mean curvatures satisfy $H_(h \, i) gt.eq
    H_(h \, o)$ in the specified direction: the flux terms agree and
  $ H_i - k_T hat(z) gt.eq sqrt(1 - hat(z)^2) sqrt(H_i^2 - k_T^2) \, $
  as follows by squaring, since the difference of squares is $\( H_i hat(z) - k_T \)^2$ and both relevant sides
    are nonnegative.
  Beyond the fixed source supports, both $N_o$ and $x = N_o w$ are harmonic and tend to one.
    Radial barriers and scaled estimates give $N_o - 1 \, x - 1 =
    O_2 \( \| x' \|^(- beta) \)$ for every fixed $1 \/ 2 < beta < 1$.
    Thus $h = x g_o$ is asymptotically flat, and the flux of $Q$ equals the limiting flux of $nabla x$;
    the remaining terms have vanishing integral by $2 beta > 1$.
    The linear conformal ADM variation is $m_h - m_o = - \( 8 pi \)^(- 1) lim integral partial_n x$.
    Integration of the current equation therefore gives the exact identity
  #[#set math.equation(numbering: n => "(7.24)")
   $ 8 pi \( m_h - m_o \) = integral_S b_(*) + integral #scale(x: 120%, y: 120%)[\[] \( x - 1 \) Sigma_(+) + P -
     Sigma_(-) #scale(x: 120%, y: 120%)[\]] . $ <eq:compact-mass>]
  Since the support of $Sigma_(+)$ has $x < 1$, discarding its contribution and using the source costs proves
    (7.13). The scalar curvature decays as $O \( \| x' \|^(- 2 - 2 beta) \)$ on the end, by (7.22);
    this has integrable decay since $2 + 2 beta > 3$. ◻
]

The omitted collars have a controlled cost in the area comparison.
  Indeed $W = 1$ outside, and the inner omitted collar has volume $O \( M^(- 4) \)$. Hence

#[#set math.equation(numbering: n => "(7.25)")
 $ integral_({ x < 1 - delta }) W lt.eq C \/ L + C a_o + C \( L \) M^(- 1) . $ <eq:compact-full-bad-volume>]

This uses (7.8) outside $R_delta$ and Cauchy–Schwarz with (7.9) in the inner collar.
  It explains why $a_o$ and $L$ are chosen before $M$. Finally the possible negative scalar curvature is confined
  to the closed set defined by the weak inequalities in (7.5) and $N_i gt.eq delta_0$.
  Outside that set either $ell = 0$ or $zeta = 1$, and (7.22) is nonnegative.
  On that set the height penalty and $z lt.eq 1 \/ 2$ give $x gt.eq \( sqrt(3) \/ 2 \) delta_0 M^(9 \/ 10)$,
  so $R_h gt.eq - C delta_0^(- 1) M^(- 9 \/ 10)$ everywhere on the smooth sides.
  The geometric treatment of this exceptional set is the content of Section 9.

== 8 Regularity and continuation at the transmission surface <sec:transmission-analysis>

We prove the existence assertion needed in Section 7. Throughout this section all parameters,
  including the penalty strengths, are finite. Constants in estimates for the lapse and height state may depend on
  the fixed parameters preceding the strengths, but not on those strengths.
  Constants involving the conformal factor or higher derivatives may also depend on the strengths.
  Neither assertion requires uniform ellipticity as the internal parameters tend to their final limits.

Write $Omega_R = Omega_i union_(cal(C)) Omega_(o \, R)$, with far boundary $S_R$.
  On both sides of $cal(C)$ the normal $n$ points toward the end.
  Thus equality of the two $n$-fluxes is the condition for cancellation in Green’s formula.
  The two base metrics have the same induced metric at $cal(C)$.
  Joined Fermi charts have coordinates $\( z' \, t \)$, with $t < 0$ inside, $t > 0$ outside, and $n =
  partial_t$ at the face. Coordinate divergence currents below include the relevant volume density.
  We retain the notation $d = s \/ N$, $y = 1 - d^2$, $q = \( 1 - y \) \/ \( 1 + y \)$, $I = \( 1 + y \)^(- 1)$,
  $J = y \/ \( 1 + y \)$, and $beta = 2 \/ \( 1 + y \)$ from the graph calculus.

#thm([Proposition 8.1.])[
  (Finite-parameter transmission existence).  #emph[Fix the smooth compact base data and AF attachment of
    Section 7, with $H_i > \| k_T \|$ on $cal(C)$, $H_g \( S \) lt.eq 0$,
    and the smooth negative definite synthetic tensor $K$. Fix positive finite parameters and smooth cutoffs as in
    (7.3)–(7.5), including a source-free exterior collar of $cal(C)$ and the constant $b_(*) > 0$.
    Then on every sufficiently large smooth truncation there is a positive piecewise smooth solution of (7.3) and
    (7.4) at $u_(*) = 1$.]
  #emph[At these fixed parameters a subsequence of such solutions as $R arrow.r
    oo$ converges smoothly on each closed side on compact subsets to a positive piecewise smooth solution on the
    full joined exterior. Its end values are $N_o \, w arrow.r 1$.
    The bounds in (7.9) hold, and all compact-set derivative bounds are uniform in $R$.
    The penalty conclusions in Section 7, when the strengths have been chosen there,
    therefore hold for these solutions.]
] <prop:transmission-existence>

The proof uses the a priori estimates of Lemma 32, which were proved for positive classical zeros without assuming
  existence. The scalar linear transmission fact used in that lemma is established independently below as part of
  Lemma 37. In particular there is no appeal to Proposition 31 in proving this proposition.

=== 8.1 Energy and oscillation of the lapse and height state <energy-and-oscillation-of-the-lapse-and-height-state>

For the moment consider any positive homotopy zero in the continuation domain:
  $f in C^(3 \, alpha')$ on the closed inner side and $N \, w in C^(2 \, alpha')$ on each closed side,
  with $alpha' > 0$. No bound for these norms is assumed. The exponent $gamma$ obtained below depends only on the
  finite state bounds, so the continuation domain can subsequently be fixed with $alpha' < gamma$.
  The finite bounds in (7.9) give positive constants $c_0 \, C_0$ such that

#[#set math.equation(numbering: n => "(8.1)")
 $ c_0 lt.eq N_i \, s_i \, N_o lt.eq C_0 \, wide \| #h(-0.16667em) upright(d) f \| lt.eq
   C_0 . $ <eq:transmission-state-range>]

Here and below an estimate for $s$ on the exterior means the same estimate for $N_o$.
  The scalar lapse sources and the drift $\( u_(*) K + ell g \) p$ are bounded at this stage;
  their derivatives are not used.

#thm([Lemma 8.2.])[
  (Continuity at the nonlinear seam).  #emph[For the state range (8.1), there are $gamma > 0$ and $C < oo$ such that
#[#set math.equation(numbering: n => "(8.2)")
 $ parallel N_i parallel_(C^gamma \( overline(Omega)_i \)) +
   parallel #h(-0.16667em) upright(d) f parallel_(C^gamma \( overline(Omega)_i \)) +
   parallel N_o parallel_(C^gamma \( K ∩ overline(Omega)_o \)) lt.eq C $ <eq:transmission-holder>]

 on every fixed compact set $K$. The constants are uniform over homotopy zeros and sufficiently large outer
   truncations. They depend on the finite state range, bounds for the undifferentiated height and lapse sources,
   and the fixed geometry, but not on derivatives of $T$ or the strength of $P$.]
] <lem:seam-holder>

#proof[
  Away from $cal(C)$, the lapse equation is a smooth metric Laplace equation with bounded divergence forcing and
    bounded scalar forcing. Its local $W^(1 \, p)$ bounds hold for some $p > 3$,
    also up to $S$ with its natural current flux. The prescribed constant flux at $S$ can be put in the current by
    a smooth bounded extension before reflection. Differentiating the divergence height equation gives scalar
    uniformly elliptic equations for the coordinate derivatives of $f$.
    Their divergence forcing contains first derivatives of $N$, bounded in $L^p$,
    and the bounded scalar height forcing, put into the corresponding component of the differentiated current.
    In particular differentiating that scalar forcing in the weak equation does not require a bound for
    $#h(-0.16667em) upright(d) T$. The inhomogeneous scalar divergence estimate gives Hölder bounds for
    $#h(-0.16667em) upright(d) f$. At $S$ subtract the constant height and reflect it oddly, the lapse evenly,
    and the metric with its tensor parities in an orthogonal collar. The reflected metric is Lipschitz.
    The height flux satisfies the weak reflected equation, since its normal component has the required even
    parity. Difference quotients justify differentiation there. These arguments prove the assertion away from the seam.
  At the seam we first bound energy weighted by inverse distance.
    A modified Newton current then gives an estimate relative to compatible constant states.
    The weighted bound supplies a uniformly positive scale of small excess;
    a blowup to an explicit linear transmission problem gives excess decay and hence Hölder continuity.
  #emph[Weighted energy.] Set
  #[#set math.equation(numbering: n => "(8.3)")
   $ E = cases(delim: "{", \| nabla N_i \|^2 + \| nabla^2 f \|^2 \, & t < 0 \,, \| nabla N_o \|^2 \, & t > 0 \,)
     wide G = - log s \, wide Y = s^(- k_0) \, $ <eq:transmission-energy-definition>]
  where $k_0$ is sufficiently large for Lemma 13. On the inside its divergence matrix is $rho cal(P)$,
    where $rho = \( 1 + y \) \/ d$, and on the outside it is the base cometric.
    After including the volume densities, these give a bounded symmetric uniformly elliptic matrix $a$ in the
    joined chart. $Y$ is continuous across the face because $N_o = s_i$ there.
    The energy identity and the boundary identity give
  #[#set math.equation(numbering: n => "(8.4)")
   $ partial_j \( a^(j k) partial_k Y \) gt.eq c E - C - C delta_(cal(C)) . $ <eq:transmission-joined-energy>]
  This is a distributional inequality. Indeed $rho q = d$ on a Dirichlet-height face,
    and the inner normal $Y$-flux is $- k_0 Y B_n \/ s + O \( 1 \)$, whereas the outer one is $- k_0 Y B_n \/ s$.
    The bounded discrepancy is precisely the surface term in (8.4).
  Fix concentric chart balls strictly contained in a larger joined chart.
    Let $theta_epsilon$ be the zero Dirichlet Green potential, for $- partial \( a partial \)$ on the larger ball,
    of a nonnegative normalized bump at a point $z_0$ in the smaller ball.
    If $Y_H$ is the homogeneous replacement of $Y$ with its boundary values, then
  #[#set math.equation(numbering: n => "(8.5)")
   $ chevron.l partial \( a partial Y \) \, theta_epsilon chevron.r =
     integral \( Y_H - Y \) thin chi_epsilon lt.eq C . $ <eq:transmission-green-pairing>]
  The maximum principle bounds $Y_H$, and $Y$ is bounded by (8.1).
    For each classical solution the identity follows first with regular potentials and then by Sobolev
    approximation. The surface term is well defined by the trace theorem.
    The divergence Green bounds for symmetric measurable uniformly elliptic matrices in dimension three give an
    upper bound $C \| z - z_0 \|^(- 1)$ and a comparable lower bound on a sufficiently small interior ball
    #cite(label("LSW1963")) Theorem 7.1 and pp. 66–67. The surface integral of $\| z -
    z_0 \|^(- 1)$ is uniformly finite. Letting the bump shrink, using (8.4) and Fatou’s lemma, proves
  #[#set math.equation(numbering: n => "(8.6)")
   $ integral_(B_(h_0) \( z_0 \)) frac(E \( z \), \| z - z_0 \|) thin #h(-0.16667em) upright(d) z lt.eq
     C . $ <eq:transmission-green-energy>]
  Both $h_0 > 0$ and $C$ are uniform on the finite collection of seam charts.
  #emph[Comparison with a constant state.] We next prove an energy bound relative to a compatible constant state.
    Such a state is
  #[#set math.equation(numbering: n => "(8.7)")
   $ cal(V)_(*) = \( n_(*) \, a_(*) #h(-0.16667em) upright(d) t \, s_(*) \) \, wide s_(*) =
     s \( n_(*) \, \| a_(*) \| \) \, wide cal(V) = \( N_i \, #h(-0.16667em) upright(d) f \,
     N_o \) . $ <eq:transmission-reference>]
  The pairs $\( n_(*) \, a_(*) \)$ range over a compact rectangle containing the state ranges with a margin,
    with $n_(*) > 0$. Since $\| #h(-0.16667em) upright(d) t \|_g = 1$, $s_(*)$ is constant in this Fermi chart.
    Norms of the state mean the sum of the inner pair’s squared norm on the inner half and the outer lapse’s
    squared norm on the outer half.
  To derive the bound, put $cal(T)_f = nabla^2 f - \( Delta f \) g$. The Newton-current identity in Lemma 14 says
  #[#set math.equation(numbering: n => "(8.8)")
   $ rho cal(P) nabla G = - frac(nabla N_i, s) +
     cal(T)_f (frac(y nabla f, d \| #h(-0.16667em) upright(d) f \|^2)) + O \( 1 \) . $ <eq:transmission-newton-current>]
  The coefficient vector extends smoothly through $#h(-0.16667em) upright(d) f = 0$.
    In the current $a #h(-0.16667em) upright(d) Y$, add $k_0 Y_(*) B \/ s_(*)$ on both sides, where $Y_(*) =
    s_(*)^(- k_0)$, and on the inside subtract the Newton term in (8.8) with its full coefficient $k_0 Y \,
    y nabla f \/ \( d \| #h(-0.16667em) upright(d) f \|^2 \)$ frozen at the reference.
    Include metric densities in all three currents. Call the resulting joined current $cal(J)_(*)$.
    The cancellation of the coefficients of $nabla N$ and $nabla^2 f$ at the reference gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ \| cal(J)_(*) \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| cal(V) -
     cal(V)_(*) \| sqrt(E) #scale(x: 120%, y: 120%)[\)] . $ <eq:transmission-modified-current-size>]
  Moreover $"div" cal(T)_f = "Ric" \( nabla f \, dot.op \)$,
    so the divergence of the subtracted term is bounded by $C \( 1 + sqrt(E) \)$;
    its frozen vector is extended smoothly using $partial_t$.
    The added $B$-current has bounded divergence and no seam jump. The frozen Newton vector is normal at the seam.
    Its normal contraction there involves $- "tr"_(cal(C)) nabla^2 f$,
    which is bounded since $f$ is constant along that face and $\| #h(-0.16667em) upright(d) f \|$ is bounded.
    Young’s inequality therefore gives, after lowering $c$,
  #[#set math.equation(numbering: n => "(8.10)")
   $ "div" cal(J)_(*) gt.eq c E - C - C delta_(cal(C)) . $ <eq:transmission-modified-current-divergence>]
  Test by $chi^2$, with $chi = 1$ on $B_h$, supported in $B_(2 h)$ and $\| #h(-0.16667em) upright(d) chi \| lt.eq
    C \/ h$. Absorb half the energy using (8.9). The volume, constant current,
    and surface contributions are at most $C h^3$, $C h^2$, and $C h^2$, respectively. We obtain
  #[#set math.equation(numbering: n => "(8.11)")
   $ h^(- 1) integral_(B_h) E lt.eq
     C (frac(1, \| B_(2 h) \|) integral_(B_(2 h)) \| cal(V) - cal(V)_(*) \|^2 + h) . $ <eq:transmission-caccioppoli>]
  On a pure inner ball the identical construction uses any constant covector reference.
    The coefficients frozen against this reference may vary smoothly with the background metric;
    their derivatives give only $C \( 1 + sqrt(E) \)$ errors.
    On a pure outer ball the analogous assertion is the usual lapse Caccioppoli inequality.
  #emph[A scale of small excess.] Fix $0 < b_0 < 1$ and define the seam excess
  #[#set math.equation(numbering: n => "(8.12)")
   $ cal(E) \( z_0 \, h \) = inf_(cal(V)_(*)) frac(1, \| B_h \|) integral_(B_h \( z_0 \)) \| cal(V) -
     cal(V)_(*) \|^2 + h^(b_0) . $ <eq:transmission-excess>]
  There is a uniformly positive scale at which this excess is arbitrarily small.
    To see the quantitative content, put $h_j = 2^(- j) h_0$.
    For each $z eq.not z_0$ the sum of $h_j^(- 1)$ over the indices with $\| z -
    z_0 \| < h_j$ is at most $C \| z - z_0 \|^(- 1)$. Thus (8.6) bounds $sum_j h_j^(- 1) integral_(B_(h_j))
    E$ uniformly. Given $eta > 0$, first make the starting ceiling small enough that $h_0^(b_0) + h_0^2 < eta$.
    Among a fixed finite number of its dyadic descendants there is a scale with $h^(- 1) integral_(B_h) E < eta$.
    The number depends only on the Green bound and $eta$, so the chosen scale has a uniform positive lower bound.
  Here is why this is also a small excess scale. Scaled Poincaré and the half-ball trace inequality bound both the
    volume deviations and the mean-square face deviations from each side mean by
  #[#set math.equation(numbering: n => "(8.13)")
   $ C h^(- 1) integral_(B_h) E + C h^2 . $ <eq:transmission-trace-poincare>]
  The additional $C h^2$ allows for Christoffel terms when replacing covariant Hessians by coordinate derivatives
    of $#h(-0.16667em) upright(d) f$. The tangential trace of $#h(-0.16667em) upright(d) f$ is zero;
    hence the tangential components of its mean are small. The trace relation $N_o =
    s \( N_i \, partial_t f \)$ and the uniform Lipschitz bound for $s$ on the state range show that the outer
    mean differs from the value obtained from the two inner means by at most the square root of (8.13).
    This provides a compatible reference with excess $C eta$.
    All references obtained this way lie in a compact subrange with room for the subsequent small updates.
  #emph[Excess decay.] We claim that, for fixed sufficiently small $theta.alt > 0$,
    whenever $h$ and $cal(E) \( z_0 \, h \)$ are sufficiently small,
  #[#set math.equation(numbering: n => "(8.14)")
   $ cal(E) \( z_0 \, theta.alt h \) lt.eq 2 #scale(x: 120%, y: 120%)[\(] C theta.alt^2 +
     theta.alt^(b_0) #scale(x: 120%, y: 120%)[\)] cal(E) \( z_0 \, h \) . $ <eq:transmission-excess-decay>]
  The constant $C$ is independent of $theta.alt$. We give the compactness argument, including the value trace.
  If the claim fails, choose violating balls with $sigma_j^2 = cal(E) \( z_j \, h_j \) arrow.r
    0$ and best references $\( n_j \, a_j #h(-0.16667em) upright(d) t \, s_j \)$.
    Translate and dilate these balls to unit size using $z = z_j + h_j zeta$,
    and rotate tangential coordinates to be orthonormal at their centers.
    Define the lapse differences divided by $sigma_j$, and the height difference by
  #[#set math.equation(numbering: n => "(8.15)")
   $ u_(i \, j) = frac(N_i - n_j, sigma_j) \, wide u_(o \, j) = frac(N_o - s_j, sigma_j) \, wide
     phi.alt_j \( zeta \) = frac(f \( z_j + h_j zeta \) - a_j h_j zeta_3, h_j sigma_j) .
     $ <eq:transmission-normalized-fields>]
  The trace of $phi.alt_j$ is zero. Their state has bounded $L^2$ norm on the unit ball.
    Applying (8.11) on smaller balls gives locally bounded $H^1$ norms for $u_(i \, j) \,
    u_(o \, j)$ and $nabla phi.alt_j$. Indeed its error after normalization is $h_j \/ sigma_j^2 lt.eq
    h_j^(1 - b_0) arrow.r 0$. The $L^2$ norm of $phi.alt_j$ is controlled by its gradient and its zero trace.
    Rellich compactness and compactness of the $H^1$ trace into $L^2$ on smaller face patches give strong local
    $L^2$ convergence of the state in the bulk and on the face, and weak $H^1$ convergence.
  Pass to a convergent reference $\( n_(*) \, a_(*) \, s_(*) \)$.
    The derivative of the height flux with respect to the gradient is $s_(*)^2 cal(P)_(*)$;
    its lapse derivative is $s_(*)^2 \( beta \/ n_(*) \) a_(*) partial_t$.
    Taylor remainders divided by $sigma_j$ have $L^1$ norm tending to zero,
    since the unnormalized state difference is $sigma_j$ times an $L^2$-bounded function.
    The same assertion holds on the face by the trace bounds.
    Smooth metric errors are $O \( h_j \/ sigma_j \)$, which tends to zero.
    The height source and lapse drift enter weak tests with this same factor;
    the scalar lapse source has the smaller factor $O \( h_j^2 \/ sigma_j \)$.
    Thus no derivative of a source is being passed to the limit.
    Joined tests have a common value on the face, so lapse current matching passes to equality of the limiting
    normal derivatives. We arrive at
  #[#set math.equation(numbering: n => "(8.16)")
   $ Delta u_i & = Delta u_o = 0 \, & \( q partial_t^2 + Delta_(z') \) phi.alt + k partial_t u_i & = 0 \, & k & =
     beta a_(*) \/ n_(*) \,\
phi.alt & = 0 \, & partial_t u_i & = partial_t u_o \, & u_o & = r_0 u_i +
  r_0 c partial_t phi.alt quad \( t = 0 \) \, $ <eq:transmission-frozen-interior>]
  where
  #[#set math.equation(numbering: n => "(8.17)")
   $ r_0 = d I > 0 \, wide c = - frac(n_(*) y, a_(*)) \, wide c k = q - 1 \, wide r_0 c = -
     frac(s_(*) J, a_(*)) . $ <eq:transmission-frozen-relations>]
  All expressions have their continuous interpretations at $a_(*) = 0$; in particular $c = k = 0$ there.
    Differentiating $s^2 + \| #h(-0.16667em) upright(d) f \|^2 s^4 = N_i^2$ gives $dot(s) = d I dot(N)_i -
    s J partial_t dot(f) \/ a_(*)$, which verifies the value relation directly.
  The elementary harmonic estimate proved just below gives uniform smooth bounds for these limits on smaller
    closed half-balls in terms of their $L^2$ state norms. Consequently their deviations from the center values
    have mean square at most $C theta.alt^2$. The center values satisfy the linearized compatibility relation.
    Replace the old reference by
  #[#set math.equation(numbering: n => "(8.18)")
   $ n'_j = n_j + sigma_j u_i \( 0 \) \, wide a'_j = a_j + sigma_j partial_t phi.alt \( 0 \) \, wide s'_j =
     s \( n'_j \, \| a'_j \| \) . $ <eq:transmission-reference-update>]
  The nonlinear compatibility error in the outer value is $O \( sigma_j^2 \)$,
    and the tangential height gradient is zero at the center.
    Strong local $L^2$ convergence therefore proves (8.14), contradicting its violation.
    The added radius term contributes at most $theta.alt^(b_0) sigma_j^2$, as required.
  For completeness, the harmonic estimate used here is as follows.
    Reflect $u_o$ into $t < 0$ and put $U = u_i + u_o^(upright("refl"))$.
    It is harmonic with zero Neumann data, so it is smooth with controlled local norms by even reflection.
    On a smaller inner cylinder choose a harmonic primitive $D$ with $D_t = u_i$. An explicit choice is
  #[#set math.equation(numbering: n => "(8.19)")
   $ D \( z' \, t \) = integral_(t_0)^t u_i \( z' \, v \) thin #h(-0.16667em) upright(d) v + a \( z' \) \, wide
     Delta_(z') a = - partial_t u_i \( z' \, t_0 \) \, $ <eq:transmission-harmonic-primitive>]
  where $t_0 < 0$ is a fixed interior slice. The slice data are controlled by interior harmonic estimates.
    This formula gives $D in H^2$ locally up to the face: the mixed and double normal derivatives come from $u_i
    in H^1$, and tangential Laplace estimates applied to $Delta_(z') D = -
    partial_t u_i$ give its remaining second derivatives. The function $V = D +
    c phi.alt$ satisfies $\( q partial_t^2 + Delta_(z') \) V = 0$, since $c k = q - 1$, and $V = D$ on the face.
    Set $tilde(V) \( z' \, t \) = V \( z' \, sqrt(q) thin t \)$. It is harmonic and, with $a_0 = r_0 \/ sqrt(q) > 0$,
  #[#set math.equation(numbering: n => "(8.20)")
   $ \( tilde(V) - D \) \|_(t = 0) = 0 \, wide partial_t \( D + a_0 tilde(V) \) \|_(t = 0) =
     U . $ <eq:transmission-positive-harmonic-combinations>]
  Scalar harmonic Dirichlet and Neumann estimates control both combinations.
    Their coefficient matrix is invertible because $1 + a_0 > 0$; in fact $a_0 = 1 \/ sqrt(1 + y)$.
    They control $D$, then $u_i = D_t$ and $u_o = U - u_i^(upright("refl"))$.
    Finally the scalar Dirichlet equation in (8.16) controls $phi.alt$.
    This last step avoids division by $c$, so all estimates are uniform through zero slope.
    The normal rescaling only reduces the patch by a uniform factor on the state range.
  Choose $theta.alt$ so small, and then $gamma > 0$ so small, that $2 \( C theta.alt^2 + theta.alt^(b_0) \) lt.eq
    theta.alt^(2 gamma)$. Begin iteration at the small-excess scales with uniform positive lower bound constructed
    above. The references stay in the permitted range because their successive changes are bounded by a convergent
    geometric sum. This yields a mean-square oscillation bound $C h^(2 gamma)$ at every seam center.
    On a pure ball near the seam, the first scale comparable to its distance from the seam is controlled by a seam
    ball. The corresponding interior excess argument, with an arbitrary constant gradient reference,
    then gives the bound at all smaller scales. Its limit equations are a harmonic lapse and a constant uniformly
    elliptic height equation with the known lapse coupling; scalar interior estimates give the same decay.
    Campanato’s characterization on each closed half-chart proves (8.2).
    Finitely many charts and the earlier ordinary boundary estimates complete the proof. ◻
]

=== 8.2 Estimates with the full derivative orders <estimates-with-the-full-derivative-orders>

We first record the linear estimate, including the unequal orders of the unknowns.
  This is also a proof of the relevant boundary estimate; it does not invoke a general theorem for the nonlinear
  transmission condition.

#thm([Lemma 8.3.])[
  (Local transmission Schauder estimate).  #emph[Give a height variation $phi.alt$ order $3$,
    lapse variations $u_i \, u_o$ order $2$, and conformal-factor variations $v_i \, v_o$ order $2$.
    For frozen coefficients from a state in (8.1), the principal equations are
#[#set math.equation(numbering: n => "(8.21)")
 $ cal(P) : nabla^2 phi.alt + beta / N nabla f dot.op nabla u_i \, wide Delta u_i \, quad Delta u_o \, wide A_i :
   nabla^2 v_i \, quad A_o : nabla^2 v_o . $ <eq:transmission-principal-rows>]

 Their residual norms are respectively $C^(1 \, alpha)$ and $C^(0 \, alpha)$ for the other four rows.
   The height trace has $C^(3 \, alpha)$ norm. The lapse and conformal-factor value residuals have
   $C^(2 \, alpha)$ norm, and their current-flux residuals have $C^(1 \, alpha)$ norm.
   On a smaller fixed patch, the field norms of the indicated orders are bounded by these residual norms and the
   supremum norms of the fields on a larger patch. The constants are uniform on compact positive state ranges.]
  #emph[At the seam the height/lapse principal conditions are (8.16);
    the conformal-factor block has value continuity and positive conormal matching.
    At $S$ they are Dirichlet for height and Neumann for the other fields; at $S_R$ they are Dirichlet.
    The same estimates hold for scalar transmission with a fixed positive $C^(2 \, alpha)$ value ratio,
    and while its outer normal-derivative coefficient is decreased to zero,
    the inner coefficient being kept strictly positive.]
] <lem:transmission-schauder>

#proof[
  It suffices first to work on a flat seam patch. Subtract scalar particular solutions of the two lapse Poisson
    equations, with $C^(2 \, alpha)$ control, and a $C^(3 \, alpha)$ particular solution of the height row,
    including its $C^(3 \, alpha)$ boundary trace. The height forcing includes the first derivative of the
    particular inner lapse, hence belongs to $C^(1 \, alpha)$ as required.
    Such particular solutions can be made on smooth domains having flat face portions containing the smaller
    patch, after extending localized data; ordinary scalar Dirichlet estimates give their stated norms.
    We are left with harmonic lapses and the homogeneous height row, zero height trace, and residuals
  #[#set math.equation(numbering: n => "(8.22)")
   $ partial_t u_i - partial_t u_o = h_1 \, wide u_o - r_0 u_i - r_0 c partial_t phi.alt = h_2 \,
     $ <eq:transmission-inhomogeneous-seam>]
  where $h_1 in C^(1 \, alpha)$ and $h_2 in C^(2 \, alpha)$.
    The reflected sum $U = u_i + u_o^(upright("refl"))$ is harmonic with Neumann data $h_1$,
    and has a controlled $C^(2 \, alpha)$ norm on a smaller patch.
    Construct $D$ by (8.19) and use its same local supremum bound.
    The two harmonic combinations in (8.20) now have Dirichlet datum zero and Neumann datum $U - h_2$,
    respectively. The latter belongs to $C^(2 \, alpha)$, so both combinations, and therefore $D$,
    are controlled in $C^(3 \, alpha)$. This controls both lapses in $C^(2 \, alpha)$.
    Scalar Dirichlet estimates for the height row finish the $C^(3 \, alpha)$ estimate for $phi.alt$.
  For the conformal-factor block, the frozen inner matrix in orthonormal face coordinates is a positive multiple
    of $"diag" \( 1 \, 1 \, d^2 \)$, and the outer matrix is isotropic.
    Subtract particular solutions, rescale the two normal coordinates, and reflect the outer field.
    The resulting fields are harmonic; their difference has the prescribed value datum and a positive weighted sum
    has the prescribed Neumann datum. This gives their $C^(2 \, alpha)$ bounds.
    More generally, if the value relation is $v_o = r v_i + h$ with $r > 0$,
    and the flux relation after reflection is $a partial_t v_i + b partial_t v_o^(upright("refl")) = k$,
    then the harmonic combinations $v_o^(upright("refl")) - r v_i$ and $a v_i +
    b v_o^(upright("refl"))$ have Dirichlet and Neumann data. Their coefficient determinant is $a + b r > 0$.
    It stays positive if $b$ decreases to zero with $a > 0$. Variable fixed $C^(2 \, alpha)$ ratios are treated by
    freezing, as in the next paragraph. Localization differentiates the value row at most twice and the flux row
    at most once; the constants depend only on the corresponding coefficient norms.
    The ordinary boundary and interior estimates follow from the scalar estimates,
    with the lapse estimated before the height row.
  For fixed regular variable coefficients, localization gives the same estimate with lower-order terms.
    In a sufficiently small chart the leading coefficients differ little in supremum norm from their frozen
    values. Apply the constant-coefficient estimate to cutoff fields on that chart.
    In a product such as $\( a - a_(*) \) D^2 v$, the coefficient supremum multiplies the top Hölder seminorm and
    can be absorbed. Its fixed Hölder seminorm multiplies the second-derivative supremum,
    which is bounded by an arbitrarily small multiple of the full high norm plus a fixed multiple of the field
    supremum, by interpolation. The same argument applies to the order-$1$ height coupling and to the
    differentiated value relation. Cutoff commutators have strictly lower orders.
    A finite cover and interpolation for separated-point Hölder quotients give the claimed local or global
    variable-coefficient estimate. This argument requires only fixed coefficient bounds and is uniform along
    compact families of such coefficients. ◻
]

We give the nonlinear application of this estimate in detail.
  Fix $0 < alpha' < alpha < gamma$, decreasing $gamma$ in Lemma 35 if necessary.
  On a fixed truncation use the Banach domain

#[#set math.equation(numbering: n => "(8.23)")
 $ X = C^(3 \, alpha') \( overline(Omega)_i \)_f times C^(2 \, alpha') \( overline(Omega)_i \)_(N_i \, w_i) times
   C^(2 \, alpha') \( overline(Omega)_(o \, R) \)_(N_o \, w_o) \, $ <eq:transmission-domain-space>]

with the two height Dirichlet values imposed by an affine lift of $u_(*)$, and with the open condition $N_i \,
  N_o \, w_i \, w_o > 0$. There are no other conditions built into this domain.
  The output space, denoted $cal(Y)$, contains the height equation in $C^(1 \, alpha')$,
  the two lapse and two conformal-factor equations in $C^(0 \, alpha')$,
  the seam value residuals and the far Dirichlet residuals in $C^(2 \, alpha')$,
  and the flux residuals at $S$ and $cal(C)$ in $C^(1 \, alpha')$.
  Height boundary values are not additional outputs because they are prescribed in $X$.

The quotient in the trace cutoff causes no additional loss.
  In a distance collar $r_S gt.eq 0$ of $S$, with $F = u_(*) M - f = 0$ on $S$,

#[#set math.equation(numbering: n => "(8.24)")
 $ frac(F \( z' \, r_S \), r_S) = integral_0^1 partial_(r_S) F \( z' \, theta r_S \) thin #h(-0.16667em)
   upright(d) theta . $ <eq:transmission-quotient>]

It is consequently an affine bounded map from the height domain into $C^(2 \, alpha')$.
  The same formula controls it in all the order-by-order estimates below.
  Outside this collar its denominator is smooth and positive.
  Products and the finite smooth cutoffs therefore define a smooth residual map

#[#set math.equation(numbering: n => "(8.25)")
 $ cal(F) : \[ 0 \, 1 \] times X_(+) arrow.r cal(Y) \, $ <eq:transmission-nonlinear-map>]

where $X_(+)$ denotes the positive open domain after the height lift.

At an exact zero, $w gt.eq 1$. Indeed its equation has nonnegative right-hand side, its outer value is $1$,
  and its natural fluxes match with zero inner flux. Testing with $\( 1 - w \)^(+)$ gives the claim.
  Since $Sigma_(+) x$ is bounded on its support by the finite state range and the cutoff $x < 1 - delta \/ 2$,
  and $P$ has finite strength, the forcing in this scalar joined equation is bounded independently of the
  particular zero. Testing with $w - 1$ and using the Dirichlet Poincaré inequality gives an $H^1$ bound for $w -
  1$ on the fixed truncation. Local scalar boundedness and Hölder estimates for its measurable uniformly elliptic
  joined divergence matrix give a $C^gamma$ bound, after reducing $gamma > 0$.
  Reflection handles the homogeneous inner flux. Thus

#[#set math.equation(numbering: n => "(8.26)")
 $ cal(U) = \( #h(-0.16667em) upright(d) f \, N_i \, N_o \, w_i \, w_o \) quad
   upright("is bounded piecewise in ") C^gamma . $ <eq:transmission-state-holder-all>]

We now prove an a priori $C^(2 \, alpha)$ bound for $cal(U)$.
  For a smooth zero, differentiate the nondivergence height row once.
  Its highest terms are the height and lapse terms in (8.21).
  Expanding the lapse and $w$ equations shows that their only highest terms at these column orders are their own
  second derivatives. Every other term involves at most two factors of first derivatives of $cal(U)$,
  with coefficients that are smooth functions of its bounded state and of the quotient (8.24).
  At the seam, differentiating the value relation twice tangentially gives

#[#set math.equation(numbering: n => "(8.27)")
 $ partial_a partial_b \( N_o - s_i \) = partial_a partial_b N_o -
   D s_i thin partial_a partial_b \( N_i \, #h(-0.16667em) upright(d) f \) -
   D^2 s_i #scale(x: 120%, y: 120%)[\(] partial_a \( N_i \, #h(-0.16667em) upright(d) f \) \,
   partial_b \( N_i \, #h(-0.16667em) upright(d) f \) #scale(x: 120%, y: 120%)[\)] + cal(R)_(a b) \,
   $ <eq:transmission-value-differentiation>]

where $cal(R)_(a b)$ contains only bounded geometry coefficients and lower-order derivatives.
  The leading first differential is exactly the principal value relation already used.
  One derivative of a current-flux relation has only the indicated first-order principal boundary operators;
  its other terms are lower at these column orders. Formula (8.24) gives the same derivative count for every
  occurrence of $F \/ d_S$.

Here are the interpolation exponents needed for absorption,
  to make the dependence on the prior continuity estimate explicit.
  Put $H = 1 + parallel cal(U) parallel_(C^(2 \, alpha))$ and suppose $parallel cal(U) parallel_(C^gamma) lt.eq
  C_0$. On fixed slightly enlarged patches, Hölder interpolation gives

#[#set math.equation(numbering: n => "(8.28)")
 $ parallel D cal(U) thin D cal(U) parallel_(C^(0 \, alpha)) & lt.eq C H^(theta_1) \, & theta_1 & =
   frac(2 + alpha - 2 gamma, 2 + alpha - gamma) < 1 \,\
parallel D^2 cal(U) parallel_(C^0) & lt.eq C H^(theta_2) \, & theta_2 & =
  frac(2 - gamma, 2 + alpha - gamma) < 1 . $ <eq:transmission-product-interpolation>]

Terms of still lower order have smaller exponents or admit the usual $eta H + C_eta$ bound.
  The first estimate follows by assigning one first derivative its supremum norm and the other its
  $C^(0 \, alpha)$ norm; their interpolation numerators are $1 - gamma$ and $1 + alpha - gamma$, respectively.

Freeze the coefficients in a chart of radius chosen using only (8.26).
  Their oscillations in supremum norm are then as small as desired, while their $C^gamma$ norms are bounded.
  A principal coefficient error times a top derivative has $C^(0 \, alpha)$ norm bounded by a small constant times
  $H$ plus a constant times $H^(theta_2)$. The same estimate after two tangential derivatives applies to the value
  row in (8.27); its quadratic part is controlled by (8.28).
  Apply Lemma 36 to cutoff fields with matched cutoff values at a seam.
  A second, slightly larger cutoff extends coefficient differences without losing their small supremum norm.
  Cutoff commutators contain only lower derivatives and have fixed patch-dependent bounds.
  Taking the maximum over a finite cover, and using supremum interpolation for Hölder quotients with separated
  points, gives

#[#set math.equation(numbering: n => "(8.29)")
 $ H lt.eq eta H + C #scale(x: 120%, y: 120%)[\(] 1 + H^(theta_1) + H^(theta_2) +
   H^(theta_3) #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq theta_3 < 1 . $ <eq:transmission-global-absorption>]

Choose $eta < 1 \/ 2$. This bounds $H$. Constants for differentiated cutoffs and source functions may depend on
  the finite parameter choices, which is permitted here.

We must also justify using smooth-zero estimates for zeros initially in (8.23).
  The following difference quotient argument supplies that justification.
  Off the seam, ordinary scalar bootstrapping applies, estimating lapse and $w$ first and height next;
  at $S$ the $w$ conormal condition is its ordinary homogeneous Neumann condition because the height gradient is
  normal. Near a seam flatten the face and take a tangential difference quotient of the equations.
  For the value relation use the averaged first differential of $s$ between the two states.
  For a fixed zero these coefficients are uniformly $C^(2 \, alpha')$ and,
  on a sufficiently small patch and for sufficiently small differences,
  are supremum-close to the same frozen principal coefficients.
  The difference quotients have uniformly bounded one-lower norms from the starting regularity.
  Apply the fixed-coefficient estimate to their cutoffs. Principal oscillations times top seminorms are absorbed;
  top supremum terms are interpolated against the known one-lower norm.
  All commutators and differentiated explicit data involve only these known orders.
  This controls one tangential derivative in the same column spaces.

The normal derivatives are recovered in a definite order.
  Solve the lapse and $w$ equations for their double normal derivatives;
  their strictly positive normal coefficients permit division.
  Then solve the height row for its double normal derivative, using the newly controlled lapse derivatives.
  Other second derivative terms have at least one tangential index, which is already controlled.
  Iterating proves smoothness. More explicitly, if orders $m + 3 \, alpha'$ for height and $m + 2 \,
  alpha'$ for the other fields are known, apply the same estimate to a tangential difference quotient of $m$
  tangential derivatives. In the height row, including its one residual derivative,
  every distributed coefficient term other than the principal row on the increments uses at most $m + 2 \,
  alpha'$ derivatives of $cal(U)$. The other interior rows start with at most one derivative of $cal(U)$ outside
  their own principal terms. In the value row the only new-order term is its first state differential on the
  increment. Thus the same argument gives the next derivatives with the largest number of tangential indices.
  Recover the others with successively fewer tangential indices by the lapse and $w$ equations first,
  then the height equation. These identities hold on the open side and extend continuously to the face.
  The quotient near $S$ obeys (8.24) at every step.

Consequently every zero of (8.25) is smooth, and (8.29) bounds it at the stronger exponent $alpha$.
  On a fixed truncation the positive zero set over $0 lt.eq u_(*) lt.eq 1$ is compact in $X$:
  the stronger Hölder bounds give precompactness, the residual map is continuous,
  and the uniform positive floors for $N$ and $w$ keep limits in $X_(+)$.

=== 8.3 Fredholm index and continuation <fredholm-index-and-continuation>

#thm([Lemma 8.4.])[
  (Index zero for the linearized transmission problem).  #emph[The field derivative $D_X
    cal(F)$ at each zero of (8.25) is Fredholm of index zero between (8.23) and its specified residual space.
    Independently, the scalar density and adjoint problems with smooth base metrics,
    fixed $C^(1 \, alpha')$ drift, a fixed positive $C^(2 \, alpha')$ value ratio, natural flux matching,
    inner Neumann and outer Dirichlet data are Fredholm of index zero.
    Their estimates may depend on derivatives of the fixed ratio.]
] <lem:transmission-fredholm>

#proof[
  Discard compact lower-order terms in the linearization. This is legitimate with the column orders used above.
    For example, a variation of the trace target in the expanded lapse row contains at most two derivatives of the
    height variation or one of the other variations, and therefore maps compactly to its $C^(0 \, alpha')$
    residual. Variations of $F \/ d_S$ lose one height derivative by (8.24), which still leaves this compactness.
    In contrast, the first differential of $N_o - s \( N_i \, #h(-0.16667em) upright(d)
    f \)$ in the $C^(2 \, alpha')$ seam residual is principal and is retained.
    The principal height coupling to a lapse derivative in its $C^(1 \, alpha')$ residual is also retained.
  In this principal operator scale the background $#h(-0.16667em) upright(d)
    f$ continuously to zero and recompute $q \, cal(P) \, beta \, s \, A$, the height coupling,
    and the value-differential coefficients from that scaled background.
    This scales coefficient fields, not the variations. In particular $c k = q -
    1$ in (8.17) holds all along the path. The states remain in a fixed positive ellipticity range.
    The local estimates of Lemma 36, followed by localization, give along this path
  #[#set math.equation(numbering: n => "(8.30)")
   $ parallel v parallel_X lt.eq C #scale(x: 120%, y: 120%)[\(] parallel L_lambda v parallel_(cal(Y)) +
     parallel v parallel_0 #scale(x: 120%, y: 120%)[\)] \, $ <eq:transmission-linear-apriori>]
  where $parallel v parallel_0$ is a sum of field supremum norms and $C$ is uniform in the path parameter $lambda$.
  At zero background gradient the height decouples, and the lapse and $w$ blocks have scalar value and positive
    conormal transmission. Decrease each outer derivative coefficient in its flux relation to zero,
    leaving the inner coefficient positive. The determinant $a + b r$ in the proof of Lemma 36 stays positive,
    so (8.30) remains valid. At the endpoint each scalar block is triangular:
    solve the inner Neumann problem, then the outer Dirichlet problem with the trace prescribed from the inner
    solution. On each connected inner component the scalar Neumann problem has equal kernel and
    compatibility-cokernel dimensions, both one; the outer Dirichlet and height Dirichlet problems have index
    zero. Dividing by positive scalar principal factors and discarding connection terms reduces this assertion to
    ordinary Poisson theory. Thus the endpoint index is zero.
  We justify index propagation using only (8.30). A sufficiently fine fixed finite grid of field evaluations
    defines $frak(p) : X arrow.r bb(R)^l$ with $parallel v parallel_0 lt.eq eta parallel v parallel_X +
    C_eta \| frak(p) v \|$. Choose $eta$ small in (8.30). The augmented operators
  #[#set math.equation(numbering: n => "(8.31)")
   $ frak(A)_lambda = \( L_lambda \, frak(p) \) : X arrow.r cal(Y) times bb(R)^l quad upright("satisfy") quad
     parallel v parallel_X lt.eq C parallel frak(A)_lambda v parallel . $ <eq:transmission-augmented-bound>]
  They are injective with closed range. At an index-zero Fredholm parameter their range has codimension $l$.
    If parameters $lambda_j$ of this kind tend to $lambda$, and the limit range had codimension at least $l + 1$,
    choose an $\( l + 1 \)$-dimensional subspace $Z_0$ disjoint from that range.
    At each $lambda_j$ there is a unit vector $z_j in Z_0 ∩ "ran" frak(A)_(lambda_j)$.
    Its preimages $v_j$ are bounded by (8.31). A subsequence of $z_j$ converges in the finite-dimensional space to
    a unit vector $z$, and operator-norm continuity gives $frak(A)_lambda v_j arrow.r z$.
    Closedness of the limit range is a contradiction. Its codimension is therefore finite.
  The kernel of $L_lambda$ is finite dimensional because $frak(p)$ is injective on it.
    Its range is closed and has finite codimension: add the finite-dimensional factor ${ 0 } times
    bb(R)^l$ to the closed finite-codimensional augmented range, and then quotient by that factor.
    This sum is closed, and the resulting quotient is exactly $"ran" L_lambda$.
    Thus $L_lambda$ is Fredholm also at the limit. Openness and local constancy of the Fredholm index,
    together with this closedness argument starting from the endpoint, propagate index zero along the whole path.
    Restoring compact lower-order terms does not change it.
  For the independent scalar density problem take the fixed positive $C^(2 \, alpha')$ ratio and fixed
    $C^(1 \, alpha')$ drift as coefficients. Its local principal boundary estimate is the scalar positive-ratio
    estimate already proved, and its lower-order drift is compact at the scalar column order two.
    Localization uses only the stated coefficient norms, so no approximation in a Hölder norm is needed.
    The same outer-flux deformation and augmentation argument applies without reference to a nonlinear zero or to
    an a priori estimate for such zeros. For its adjoint the value ratio and positive derivative weight exchange
    their roles; the same scalar combinations apply. This proves both independent index assertions. ◻
]

We now complete existence on a fixed truncation. At $u_(*) = 0$ the height is identically zero.
  Indeed its Dirichlet values are zero, its trace target is zero,
  and testing its divergence equation by $f$ gives $integral p dot.op #h(-0.16667em) upright(d) f = 0$.
  All scaled sources vanish and $s_i = N_i$, so the lapse solves the scalar harmonic transmission problem with
  ordinary value and normal-derivative matching, inner flux $- b_(*)$ in the $n$ direction, and far value $1$.
  The weak form on the joined manifold is coercive after subtracting the outer boundary value.
  Equivalently its index is zero by Lemma 37 and its homogeneous kernel is zero by energy testing.
  It therefore has a unique solution. Comparison with $1$, using the outward inner flux $+ b_(*)$, gives $N gt.eq
  1$. Scalar transmission regularity makes it piecewise smooth.
  The remaining equation is $"div" \( N^2 #h(-0.16667em) upright(d) w \) = 0$ with matching value and flux,
  inner zero flux, and far value $1$; hence $w = 1$.

This initial zero is nondegenerate. Its homogeneous linearization is triangular:
  first $"div" \( N^2 #h(-0.16667em) upright(d) dot(f) \) = 0$ with zero height traces,
  then the ordinary harmonic lapse transmission problem with homogeneous boundary data,
  then the homogeneous $w$ divergence problem with zero far value. Energy testing makes each variation zero.
  Terms differentiating the source cutoffs carry $u_(*)$ or vanish because $ell = 0$;
  constitutive-coefficient variations in these rows multiply $#h(-0.16667em) upright(d) f =
  0$ or $#h(-0.16667em) upright(d) w = 0$. Index zero now implies invertibility of the full field derivative.

We supply the finite-dimensional continuation argument so that no orientation or uniqueness assumption at the
  target parameter is implicit. Let $cal(K)$ be the compact set of positive zeros of (8.25) over $\[ 0 \, 1 \]$.
  By the Fredholm assertion, a finite-dimensional subspace $frak(Z) subset cal(Y)$ can be chosen so that

#[#set math.equation(numbering: n => "(8.32)")
 $ D_X cal(F) \( X \) + frak(Z) = cal(Y) $ <eq:transmission-cokernel-span>]

at every point of $cal(K)$: choose local cokernel complements and use a finite cover.
  Surjectivity persists on a neighborhood $cal(O)$ of $cal(K)$. If $Q$ is the quotient map to $cal(Y) \/ frak(Z)$, then

#[#set math.equation(numbering: n => "(8.33)")
 $ cal(M) = { \( u_(*) \, v \) in cal(O) : Q cal(F) \( u_(*) \, v \) = 0 } $ <eq:transmission-reduction-manifold>]

is a smooth finite-dimensional manifold of dimension $dim frak(Z) + 1$.
  The field derivative of $Q cal(F)$ is onto, so the parameter projection on $cal(M)$ is a submersion.
  Its only endpoint faces are therefore $u_(*) = 0$ and $u_(*) = 1$.
  Choose a relatively open neighborhood $cal(U)$ of $cal(K)$ in $cal(M)$ with compact closure contained in
  $cal(O)$ and with relative boundary disjoint from the zero set.
  This is possible in the finite-dimensional locally compact manifold.
  The norm of $cal(F)$ has a positive minimum on that relative boundary.

Apply Sard’s theorem simultaneously to $cal(F) \|_(cal(M))$, which takes values in $frak(Z)$,
  and its two endpoint faces. For a sufficiently small common regular value $z in frak(Z)$,
  its preimage in $cal(U)$ is a compact one-manifold whose boundary lies only on the endpoint faces.
  The implicit function theorem at the unique nondegenerate initial zero gives exactly one point on the $u_(*) =
  0$ face. Compactness of $overline(cal(U))$ excludes other points on that face for small $z$:
  a sequence of such extra points would limit to an additional zero,
  or to the initial zero in its uniqueness neighborhood. A compact one-manifold has an even number of boundary
  points. Consequently the $u_(*) = 1$ face is nonempty. Let a sequence of these regular values tend to zero and
  use compactness of $overline(cal(U))$ once more. Its limiting point is an exact positive zero at $u_(*) = 1$.
  This proves the finite-truncation assertion of Proposition 34.

=== 8.4 Removal of the outer truncation <removal-of-the-outer-truncation>

Keep every internal parameter fixed and let $R arrow.r oo$ through the solutions just obtained.
  The lapse, slope, and low-order seam bounds are locally uniform by (7.9) and Lemma 35.
  We explain why the local upper bound for $w$ is also independent of $R$,
  since the fixed-truncation energy bound alone does not imply this assertion.

Choose a fixed sphere $cal(S)$ outside all source supports.
  On its exterior both $N_o$ and $x = N_o w$ are harmonic. For $x$ this follows directly from the two equations:

#[#set math.equation(numbering: n => "(8.34)")
 $ N_o Delta_(g_o) \( N_o w \) = - P \, $ <eq:transmission-exterior-x>]

so the conclusion holds wherever $P = 0$, in particular beyond $cal(S)$.
  Both fields have value $1$ at the truncating boundary. Positive radial superharmonic barriers on the AF end of
  weight $\| x' \|^(- beta)$, with any fixed $0 < beta < 1$,
  bound their deviations from $1$ by their bounded values at $cal(S)$ times such a weight.
  Their construction uses $Delta_(g_o) \| x' \|^(- beta) = beta \( beta - 1 \) \| x' \|^(- beta - 2) +
  O \( \| x' \|^(- beta - 3) \) < 0$ at large radius; enlarge $cal(S)$ if necessary.
  At a finite outer edge the zero deviation is consistent with the positive barrier.

Suppose the supremum of $w$ on the fixed region inside $cal(S)$ were unbounded, and divide by this supremum $H_j$.
  Exterior harmonic comparison for $x$, together with the global positive floor for $N_o$,
  bounds the normalized $w$ everywhere and gives a decay bound $C \| x' \|^(- beta)$ for any subsequential limit.
  On compact sets its scalar forcing divided by $H_j$ tends to zero:
  $Sigma_(+) x$ is bounded by its cutoff and the finite state bounds, and $P$ has fixed finite strength.
  The coefficient matrices converge locally along a subsequence by the Hölder estimates for $N$ and
  $#h(-0.16667em) upright(d) f$. Scalar local boundedness, Hölder compactness and weak energy estimates then give
  a nonnegative limit $w_oo$, with a nonzero maximum on the fixed compact region, satisfying

#[#set math.equation(numbering: n => "(8.35)")
 $ - "div" \( A_oo #h(-0.16667em) upright(d) w_oo \) = 0 \, wide \[ w_oo \]_(cal(C)) = 0 \,
   wide \[ \( A_oo #h(-0.16667em) upright(d) w_oo \)_n \]_(cal(C)) = 0 \,
   wide \( A_oo #h(-0.16667em) upright(d) w_oo \)_n \|_S = 0 . $ <eq:transmission-normalized-w-limit>]

It tends to zero at infinity. This is impossible: on arbitrarily large compact joined domains,
  the weak maximum principle with natural inner flux bounds it by the supremum on the distant Dirichlet sphere,
  and that supremum tends to zero. This argument uses only the scalar joined divergence form and remains valid for
  the limiting piecewise coefficients. The contradiction proves the required compact upper bound for $w$.

Without normalization the same exterior barriers show that every limit has $N_o \, x arrow.r 1$,
  and hence $w arrow.r 1$. They also give derivative estimates of every fixed order on annuli after scaling,
  by ordinary scalar harmonic estimates for the fixed smooth AF metric.
  On the compact region containing the sources, the Hölder estimates and the absorption argument above are uniform
  in $R$: take an auxiliary fixed surrounding annulus, whose derivatives are already bounded by these harmonic
  estimates, and use the finite cover of compact patches inside it.
  A diagonal subsequence therefore converges in every fixed smooth norm on each closed side on compact sets.
  Its positive floors and its boundary and transmission conditions persist.
  This proves the outer-limit assertion and completes Proposition 34.

== 9 Scalar errors, smoothing, and free enclosures <sec:scalar-error>

Fix the compact data and the scalar-flat attachment of Proposition 30.
  All solutions in this section are the actual solutions, with homotopy parameter equal to one, of Proposition 31.
  In particular, the notation $N_i \, N_o \, f \, s \, w \, x \, W \, T \, ell \, Sigma_plus.minus \,
  P$ has the meaning given in Section 7. Constants can depend on the fixed compact data,
  the positive numbers $b_(*) \, delta_0$, the chosen exterior collar, and the fixed value of $L$.
  They are independent of $M$, of the sufficiently small subsequent lapse cutoff,
  and of the sufficiently large finite penalty strengths, unless stated otherwise.
  None of the arguments in this section restricts the topology of the compact part.

We first state the output needed in the final comparison.
  The capped manifold in this statement is auxiliary; no extension of the original initial data across its
  boundary is asserted.

#thm([Proposition 9.1.])[
  (Smooth AF comparison and two enclosures).  #emph[Let $\( Omega_i \, g \, K \)$ and $\( Omega_o \, g_o \)$ be
    the fixed inner data and attachment of Proposition 30, with attachment mass $m_o$.
    Given $0 < delta < 1$ and positive tolerances $eta_m \, eta_v \, eta_g$,
    the parameters of Proposition 31 can be chosen so that there is a smooth complete connected one-ended AF
    manifold $\( X \, h' \)$, a fixed topological cap set $O$ with $partial O = S$,
    and precompact smooth open sets $E_0 \, E$ containing $O$ in their interiors, with the following properties.]
  + #emph[The boundaries of $E_0$ and $E$ are compact embedded minimal surfaces.
    Both sets are outward minimizing, their open exteriors are connected, and
#[#set math.equation(numbering: n => "(9.1)")
 $ "Per"_(h') \( E_0 \) lt.eq "Per"_(h') \( E \) . $ <eq:unsafe-two-perimeters>]

 The set $E_0$ is a largest perimeter minimizing enclosure of $O$ alone, is strictly outward minimizing,
   and every component of $E_0$ meets $O$.]
  + #emph[On the original side of the caps,
#[#set math.equation(numbering: n => "(9.2)")
 $ "Scal"_(h') gt.eq - 2 \, wide "Scal"_(h') gt.eq 0 quad upright("on ") X \\ E \, wide m_(h') lt.eq m_o +
   eta_m . $ <eq:unsafe-comparison-output>]

 In particular the closed exterior of $E$ is smooth and complete, has exactly one AF end,
   and has outer minimizing minimal boundary. For any fixed $1 \/ 2 < beta < 1$,
   its end has metric decay $O_2 \( \| x' \|^(- beta) \)$ and scalar decay $O \( \| x' \|^(- 2 - 2 beta) \)$.]
  + #emph[Identify the two original base pieces with their images in $X \\ "int" O$,
    smoothly on each closed side of the seam, and let $g_(upright("base"))$ denote their respective metrics $g \,
    g_o$. For the piecewise graph metric $h = x macron(g)$, where $macron(g) = g +
    s^2 #h(-0.16667em) upright(d) f^2$ inside and $macron(g) = g_o$ outside, one has
#[#set math.equation(numbering: n => "(9.3)")
 $ \( 1 - eta_g \) h lt.eq h' lt.eq \( 1 + eta_g \) h \, wide macron(g) gt.eq g_(upright("base")) \, wide
   #h(-0.16667em) upright(d) V_(macron(g)) = W thin #h(-0.16667em) upright(d) V_(upright("base")) \,
   $ <eq:unsafe-metric-output>]

 after decreasing $eta_g$ below one if necessary, and
#[#set math.equation(numbering: n => "(9.4)")
 $ integral_({ x < 1 - delta }) W thin #h(-0.16667em) upright(d) V_(upright("base")) < eta_v .
   $ <eq:unsafe-bad-volume-output>]

 The scalar lower bound and the topology of $X \\ "int" O$ are independent of the large parameters.]
  #emph[The order of choice is the following: choose $b_(*) \, delta_0$ for the mass tolerance, then $delta$,
    the thin exterior omitted collar and $L$ for the volume tolerance, then $M$,
    then the lapse cutoff and the finite penalty strengths. The corner smoothing is chosen last,
    separately for each resulting fixed solution. In the enclosure construction a large fixed scaled ball radius
    is chosen before $M$.]
] <prop:af-comparison>

We prove the proposition in several steps. Throughout, a closed unsafe set is used,
  so excluding it from the new exterior also excludes limits of the regions in which the scalar sign is uncertain.

=== 9.1 Uniform geometry at unsafe points <uniform-geometry-at-unsafe-points>

Define $cal(U)_M subset overline(Omega)_i$ by the closed versions of the four trace-cutoff inequalities in (7.5),
  together with $N_i gt.eq delta_0$. The quotient at $S$ has the continuous interpretation specified there.
  This is a compact set for each fixed solution. The scalar identity (7.22) and the definition of $Sigma_(-)$ show that

#[#set math.equation(numbering: n => "(9.5)")
 $ "Scal"_h gt.eq 0 quad upright("off ") cal(U)_M quad upright("on each smooth side of the seam") .
   $ <eq:unsafe-scalar-support>]

Indeed the only possibly negative term is $- ell^2 \( 1 - zeta \( N_i \) \)$;
  it vanishes when the trace cutoff is inactive or when $N_i lt.eq delta_0$.

At $P in cal(U)_M$, set

#[#set math.equation(numbering: n => "(9.6)")
 $ N_0 = N_i \( P \) \, wide r_P = x \( P \)^(- 1 \/ 2) . $ <eq:unsafe-scale>]

Since $f \( P \) gt.eq 9 M \/ 10$, $z \( P \) lt.eq 1 \/ 2$, and $w \( P \) gt.eq M^(9 \/ 10)$,

#[#set math.equation(numbering: n => "(9.7)")
 $ x \( P \) gt.eq sqrt(3) / 2 delta_0 M^(9 \/ 10) \, wide r_P lt.eq C M^(- 9 \/ 20) . $ <eq:unsafe-radius-bound>]

The negative term in the scalar identity is bounded independently of $M$, so (9.5) also gives $"Scal"_h gt.eq -
  1$ everywhere on the two smooth pieces for all sufficiently large $M$.

#thm([Lemma 9.2.])[
  (Geometry at the unsafe scale).  #emph[There is a constant $C gt.eq 1$ with the following property.
    For every fixed $R < oo$, all sufficiently large $M$, and every $P in cal(U)_M$,
    the base ball of radius $R r_P$ about $P$ does not meet the seam.
    In interior charts, or in charts flattened at $S$ when necessary, whose unit of base length is $r_P$,
#[#set math.equation(numbering: n => "(9.8)")
 $ C^(- 1) "Id" lt.eq h lt.eq C "Id" $ <eq:unsafe-uniform-metric>]

 on the corresponding ball, restricted to the original side of $S$.
   The same comparison holds after reflection across $S$. The constant $C$ is independent of $R$;
   the required lower bound for $M$ may depend on $R$. Equivalently, the order of the quantifiers is
#[#set math.equation(numbering: n => "(9.9)")
 $ exists C med forall R < oo med exists M_0 \( R \) med forall M gt.eq M_0 \( R \) med
   forall P in cal(U)_M . $ <eq:unsafe-quantifiers>]

]
] <lem:unsafe-blowup>

#proof[
  We first control the normalized lapse without a slope bound.
    Height compactness and a sublevel argument then exclude positive limiting heights and a seam at bounded scaled
    distance. Only after this do we use the gradient estimate to obtain the flat graph limit.
    Finally a truncated Harnack argument controls the conformal factor with a constant independent of the fixed
    scaled radius.
  It is enough to examine an arbitrary sequence $M arrow.r oo$ and marked centers $P in cal(U)_M$.
    Write $r = r_P$. Use smooth base charts, with Fermi charts at a boundary, and rescale their lengths by $r$;
    equivalently use the base metric $g_r = r^(- 2) g$. On each fixed scaled compact set the base metrics converge
    smoothly to the Euclidean metric, or to the Euclidean metric on a half-space.
    The two compact boundary faces $S$ and $cal(C)$ have positive base separation,
    so at most one can remain at a bounded scaled distance.
  #emph[Lapse bounds before slope bounds.] We first obtain lapse estimates without using height-gradient bounds.
    Testing the height equation on nested base balls with a cutoff and a height function bounded in absolute value
    by $M$ gives, in scaled volume units,
  #[#set math.equation(numbering: n => "(9.10)")
   $ integral_(B_H) \( W^2 - 1 \) thin #h(-0.16667em) upright(d) V_(g_r) lt.eq C_H M /
     r integral_(B_(H')) N_i thin #h(-0.16667em) upright(d) V_(g_r) \, wide H < H' . $ <eq:unsafe-local-height-energy>]
  For a ball reaching a Dirichlet face, subtract its constant boundary height before testing;
    the boundary term then vanishes. To verify the estimate, use $p dot.op #h(-0.16667em) upright(d) f = W^2 - 1$,
    $\| p \| lt.eq N_i$, $\| T \| lt.eq C$, and a cutoff derivative of size $C_H \/ r$.
    These are also the only estimates required if the ball meets a face.
  Put $U = N_i \/ N_0$, and let $A_(H')$ be a supremum of this normalized lapse on a larger fixed scaled patch.
    The scalar forcing in its rescaled equation obeys
  #[#set math.equation(numbering: n => "(9.11)")
   $ ∥r^2 / N_0 \( Sigma_(+) + Sigma_(-) \)∥_(L^2 \( B_H \, g_r \)) & lt.eq
     C_H (r^2 + M^(1 \/ 2) r^(3 \/ 2) N_0^(- 1 \/ 2) A_(H')^(1 \/ 2))\
 & lt.eq C_H (r^2 + M^(- 7 \/ 40) A_(H')^(1 \/ 2)) . $ <eq:unsafe-scaled-source>]
  Here $Sigma_(+) lt.eq L W$, $\| Sigma_(-) \| lt.eq C delta_0$, $N_0 gt.eq delta_0$, and (9.10) were used.
    The divergence drift has size $O \( r \)$. The natural flux error at $S$ has size $O \( r b_(*) \/ N_0 \)$;
    a bounded extension of the normal datum incorporates it in the divergence forcing.
  If no seam is present on the patch, the inhomogeneous Harnack estimate for $U$,
    including natural-flux reflection at $S$, bounds the smaller supremum by a constant times its infimum plus the
    right side of (9.11). Choose the smaller patch to contain the center,
    or use a boundary-foot ball containing it, so that the infimum is at most $U \( P \) = 1$.
    Thus, on finitely many nested patches,
  #[#set math.equation(numbering: n => "(9.12)")
   $ A_H lt.eq C_H (1 + r^2 + M^(- 7 \/ 40) A_(H')^(1 \/ 2)) . $ <eq:unsafe-nonseam-iteration>]
  The crude bound $N_i lt.eq C \( L \) M$ gives $A_(H') = O \( M \)$.
    The exponent of $M$ improves by $a mapsto max \( 0 \, a \/ 2 - 7 \/ 40 \)$.
    Two applications give $1 mapsto 13 \/ 40 mapsto 0$. We have therefore obtained local boundedness by a finite
    iteration, before asserting that the forcing tends to zero.
  There is a slightly different normalization argument if the seam has bounded scaled distance.
    Reflect the exterior lapse into the inner side in the two base Fermi collars, and set $V = U +
    N_o^(upright("refl")) \/ N_0$. Use the inner density-cometric matrix for the summed equation.
    The common induced metric implies that the two matrices differ by $O \( r \| t \| \)$ at scaled distance $\|
    t \|$ from the face. Positivity and the interior gradient estimate for the harmonic exterior lapse on balls of
    radius comparable to $\| t \|$ give
  #[#set math.equation(numbering: n => "(9.13)")
   $ \| \( a_i - a_o^(upright("refl")) \) nabla \( N_o^(upright("refl")) \/ N_0 \) \| lt.eq
     C r \( N_o^(upright("refl")) \/ N_0 \) . $ <eq:unsafe-seam-drift>]
  The exterior is harmonic on the fixed omitted collar, which contains every such scaled patch for large $M$.
    The inner drift obeys the same bound with $U$. Consequently the total correction is a bounded divergence drift
    of size $C r$ times $V$, with zero natural flux at the face,
    and the scalar forcing is still bounded by (9.11) with a larger supremum of $V$.
  The infimum in Harnack for $V$ must be anchored to the inner center value. Here is that step explicitly.
    Let $m$ be the infimum of $V$ on a fixed smaller half-patch containing the center and a central disk in the
    face. On the face, $N_o = d N_i$, $0 < d lt.eq 1$, whence $U gt.eq m \/ 2$.
    Choose a fixed smooth half-domain with that flat disk in its boundary and containing the center.
    The harmonic measure of a smaller disk at the center is bounded below by a fixed positive number;
    this remains true as the center approaches that disk. Write $U = H + e$,
    where $H$ is the harmonic replacement with the same boundary values.
    The zero-Dirichlet estimate for $e$, using divergence forcing in $L^p$, $3 < p < 6$,
    and scalar forcing in $L^2$, gives
  #[#set math.equation(numbering: n => "(9.14)")
   $ parallel e parallel_oo lt.eq C_H (r A_(H') + r^2 + M^(- 7 \/ 40) A_(H')^(1 \/ 2)) .
     $ <eq:unsafe-replacement-error>]
  The remaining boundary values of $H$ are nonnegative, and $U \( P \) = 1$.
    Harmonic measure therefore bounds $m$ by a constant times one plus this error.
    Combining this with the Harnack estimate for the reflected sum yields
  #[#set math.equation(numbering: n => "(9.15)")
   $ A_H lt.eq C_H (1 + r A_(H') + r^2 + M^(- 7 \/ 40) A_(H')^(1 \/ 2)) . $ <eq:unsafe-seam-iteration>]
  Starting again from $O \( M \)$, the exponent improves by $a mapsto
    max \( 0 \, a - 9 \/ 20 \, a \/ 2 - 7 \/ 40 \)$. Three nested applications give $1 mapsto 11 \/ 20 mapsto 1 \/
    10 mapsto 0$. Thus the sum is locally bounded. This argument uses no derivative of the seam trace ratio and no
    separate trace compactness for either lapse.
  The forcing in (9.11) now tends to zero. Local Laplace estimates give $W^(1 \, p)$ bounds, $p > 3$,
    and Hölder compactness, including reflected natural boundary estimates when appropriate.
    Without a seam, every subsequential limit is a positive harmonic function on all of $bb(R)^3$,
    or on a half-space with zero Neumann data. Positive harmonic Liouville, after reflection in the latter case,
    and the center normalization show that the limit is one. At a seam the reflected sum has instead a positive
    constant limit. Its constant is positive because it is at least the inner center value.
    Its trace lower bound, the relation $U gt.eq V \/ 2$ on the face,
    and harmonic replacement with the error (9.14) tending to zero give a positive lower bound for the inner lapse
    up to the face. On compact open inner sets it converges, in a smaller Hölder exponent,
    to a smooth positive harmonic function. These conclusions hold on every fixed patch by diagonal extraction.
    In particular both upper and positive lower lapse bounds are now available in every case.
  #emph[Height compactness.] We turn to the height, setting
  #[#set math.equation(numbering: n => "(9.16)")
   $ cal(F) = frac(N_0 \( M - f \), r) \, wide cal(U) = N_i / N_0 \, wide tilde(s) = s /
     N_0 . $ <eq:unsafe-normalized-height>]
  It is nonnegative and $cal(F) \( P \) lt.eq M^(- 1)$ by the closed cutoff inequality. Its flux in the metric $g_r$ is
  #[#set math.equation(numbering: n => "(9.17)")
   $ frak(p) = tilde(s)^2 nabla_(g_r) cal(F) = - r / N_0 p \, wide "div"_(g_r) frak(p) = - r T cal(U) =
     o \( 1 \) . $ <eq:unsafe-height-equation>]
  The constitutive rule is unchanged: $tilde(s)^2 + \| frak(p) \|_(g_r)^2 = cal(U)^2$.
    If $cal(U)$ is frozen at its actual value, the flux is strictly monotone in its gradient argument $xi$,
    and the positive upper and lower lapse bounds give
  #[#set math.equation(numbering: n => "(9.18)")
   $ chevron.l frak(p) \( xi \) \, xi chevron.r gt.eq c min \( \| xi \|^2 \, \| xi \| \) \,
     wide \| frak(p) \( xi \) \|^2 lt.eq C chevron.l frak(p) \( xi \) \, xi chevron.r . $ <eq:unsafe-flux-coercivity>]
  For example, in an orthonormal frame $frak(p) \( xi \) = a xi$, where $a + a^2 \| xi \|^2 = cal(U)^2$;
    these assertions follow directly by differentiation and by considering $\| xi \| lt.eq 1$ and $\| xi \| gt.eq 1$.
  We require a compactness argument for possibly very steep graphs.
    In the product of a scaled base chart with a height line,
    the bounded vector field $\( - frak(p) \, 1 \)$ has bounded divergence and its pairing with the upward unit
    graph normal is bounded below by a positive constant, by (9.18).
    Gauss–Green applied to the subgraph and supergraph in product balls gives,
    for either side’s volume function $V \( a \)$, an upper bound $C \( V' \( a \) + V \( a \) \)$ for the graph
    perimeter in that ball. It also gives local perimeter bounds by using fixed surrounding balls.
    The four-dimensional isoperimetric inequality, at sufficiently small radii to absorb the volume term,
    yields $V' \( a \) gt.eq c V \( a \)^(3 \/ 4)$. Thus at every interior graph point both sides have volume at
    least $c a^4$. These constants are uniform on each of the fixed patches under consideration.
  At $S$, $cal(F) = 0$. For product balls at heights bounded away above zero,
    extend the subgraph as the empty set across the face. There is no new face perimeter,
    because its trace is empty there. The same subgraph density estimate is therefore valid even when the ball
    reaches $S$. BV compactness on open inner product patches and vertical nesting now give a subsequence such
    that all bounded height truncations converge in local measure to those of an extended measurable function
    $cal(F)_oo gt.eq 0$, whose value is allowed initially to be $+ oo$.
  We next prove that a nonzero limiting height forces a positive lower bound.
    On a ball $B_H$ contained in the inner side, test (9.17) with $chi^2 \( k - cal(F) \)^(+)$, where $chi =
    1$ on $B_h$. By (9.18) and Young’s inequality,
  #[#set math.equation(numbering: n => "(9.19)")
   $ integral_(B_h) min \( \| #h(-0.16667em) upright(d) \( k - cal(F) \)^(+) \|^2 \, \| #h(-0.16667em)
     upright(d) \( k - cal(F) \)^(+) \| \) lt.eq C (frac(k^2, \( H - h \)^2) + epsilon_M k) \| { cal(F) < k } ∩
     B_H \| \, $ <eq:unsafe-sublevel-energy>]
  where $epsilon_M arrow.r 0$ on the fixed patch. The same test is allowed on a half-patch with extension by zero
    across a Dirichlet face whose height exceeds $k$. On the portion with derivative at most one,
    use Cauchy–Schwarz; on its complement use the linear part of the energy.
    The $W^(1 \, 1)$ Sobolev inequality for an intermediate cutoff then gives, for $0 < l < k$,
  #[#set math.equation(numbering: n => "(9.20)")
   $ \( k - l \) \| { cal(F) < l } ∩ B_h \|^(2 \/ 3) lt.eq C
     (frac(k, H - h) + frac(k^2, \( H - h \)^2) + o \( 1 \)) \| { cal(F) < k } ∩ B_H \| .
     $ <eq:unsafe-sublevel-sobolev>]
  The error here includes $\( epsilon_M k \)^(1 \/ 2)$ and $epsilon_M k$, which tend to zero for fixed levels.
  For completeness, take radii decreasing from $H$ to $H \/ 2$ and levels decreasing from $k$ to $k \/
    2$ geometrically. First take $M$ sufficiently large at the fixed $H \,
    k$ to absorb the forcing into the first cutoff term. This also absorbs it at every later step,
    since the level remains at least $k \/ 2$ and the cutoff derivatives only increase.
    After dividing volumes by $H^3$, (9.20) has the form
  #[#set math.equation(numbering: n => "(9.21)")
   $ v_(j + 1)^(2 \/ 3) lt.eq C^(j + 1) \( 1 + k \/ H \) v_j . $ <eq:unsafe-sublevel-iteration>]
  For $0 < k lt.eq H$, a sufficiently small initial fraction, with a threshold independent of $k \/ H$,
    therefore forces $v_j arrow.r 0$. If $cal(F)_oo$ is not zero almost everywhere,
    choose a density ball of one of its positive superlevel sets and then a small fixed $k > 0$.
    Convergence of truncations supplies that small initial fraction.
    Consequently $cal(F) gt.eq k \/ 2$ on a smaller open inner ball for all sufficiently large indices.
  This lower bound propagates to compact subsets of the connected limiting inner domain.
    To justify propagation for the capped flux, choose a fixed smooth connecting subdomain with a small
    nonnegative Dirichlet bump on a boundary portion inside the known positive ball and zero data elsewhere.
    On this subdomain the actual lapse fields converge in a Hölder exponent to smooth positive coefficients.
    The flux is smooth and uniformly elliptic near zero gradient.
    The Dirichlet inverse of its linearization at zero maps divergence $C^gamma$ data to $C^(1 \, gamma)$;
    contraction in a small $C^(1 \, gamma)$ ball therefore supplies small-gradient barriers,
    uniformly for the sequence, with divergence a positive constant tending to zero that dominates the right side
    of (9.17). Their limiting solutions have positive interior values by the strict maximum principle.
    The constructed boundary values are below those of $cal(F)$.
    Strict gradient-flux monotonicity, testing the positive part of the barrier minus $cal(F)$,
    proves comparison in the required direction. A finite chain of such domains and a finite covering prove
    propagation on every compact inner subset.
  In the $S$ alternative, the lapse convergence is also Hölder up to that face.
    The connecting subdomains may then reach a flat boundary patch, with zero data on that portion.
    The limiting barrier is smooth there and has strictly positive inward derivative by Hopf’s lemma.
    The $C^1$ convergence of the barriers gives a uniform lower bound by a positive constant times inward scaled
    distance. This contradicts the closed unsafe condition
  #[#set math.equation(numbering: n => "(9.22)")
   $ frac(cal(F) \( P \), d_S \( P \) \/ r) lt.eq M^(- 1) \, $ <eq:unsafe-boundary-touchdown>]
  with the normal derivative interpretation if $P in S$. An interior limiting center is already excluded by
    $cal(F) \( P \) lt.eq M^(- 1)$. Thus a nonzero limiting height is impossible in these two alternatives.
  #emph[Excluding seam limits.] If the center approaches the seam,
    the boundary height is instead $N_0 M \/ r arrow.r oo$. A positive limiting height propagates through the open
    half-space as above. On a fixed ball reaching the face, omit first a thin strip adjacent to the face.
    The lower bound on the remaining compact set, followed by a small choice of $k$,
    makes the starting sublevel fraction arbitrarily small. Apply (9.21) with the negative part extended by zero
    across the seam. It supplies a positive lower bound up to the central face patch and contradicts center
    touchdown. This step does not require Hölder convergence of the individual lapse traces.
  The zero almost everywhere alternative is also impossible at a seam.
    On a fixed half-patch choose a smooth nonnegative function $b$ with amplitude $k$, derivative $O \( k \)$,
    positive by $c k$ on a central face disk and zero near the other edges.
    The test $\( b - cal(F) \)^(+)$ has zero boundary trace, since the seam height tends to infinity.
    Monotonicity and (9.18) give
  #[#set math.equation(numbering: n => "(9.23)")
   $ integral_({ cal(F) < b }) min \( \| #h(-0.16667em) upright(d) cal(F) \|^2 \, \| #h(-0.16667em) upright(d)
     cal(F) \| \) lt.eq C k^2 + o \( 1 \) k . $ <eq:unsafe-seam-energy>]
  The function $v = min \( cal(F) \, b \)$ has trace $b$ on that disk and tends to zero in measure in the
    interior. On almost every line normal to a smaller central disk, the fundamental theorem of calculus,
    followed by averaging over interior slices of a fixed thin collar $D_epsilon$,
    gives $integral_(D_epsilon) \| #h(-0.16667em) upright(d) v \| gt.eq c k - o \( 1 \)$.
    Here convergence in measure suffices because $0 lt.eq v lt.eq k$.
    Since $min \( t^2 \, t \) gt.eq t - 1 \/ 4$ for $t gt.eq 0$, the left side of (9.23) is at least
  #[#set math.equation(numbering: n => "(9.24)")
   $ c k - C k \| D_epsilon \| - 1 / 4 \| D_epsilon \| - o \( 1 \) . $ <eq:unsafe-seam-trace-cost>]
  Choose first $k > 0$ small enough that $c k$ dominates $C k^2$, and then the collar thin enough.
    This contradicts (9.23). All possible seam limits have now been excluded. Consequently
  #[#set math.equation(numbering: n => "(9.25)")
   $ "dist"_g \( P \, cal(C) \) \/ r_P arrow.r oo \, wide cal(F)_oo = 0 quad
     upright("almost everywhere in the remaining limits") . $ <eq:unsafe-seam-escape>]
  #emph[Uniform height and slope convergence.] The height convergence is in fact uniform on every scaled compact
    set, including up to $S$. Otherwise continuity and local convergence in measure produce graph points at some
    fixed positive height in a slightly larger patch. A fixed small product ball at such a point has uniformly
    positive subgraph volume by the density bound proved above.
    But that volume tends to zero because the limiting height is zero.
    If the points approach $S$, use the empty extension across the face;
    alternatively omit a thin boundary strip before taking the limit.
    The strip has too little product volume to account for the density lower bound.
    This excludes positive spikes as well as bounded positive plateaus.
  We can now apply the differential gradient estimate Lemma 12.
    Under the rescaling above the synthetic endomorphism and trace target become $- r K$ and $- r T$,
    and the lapse current becomes $\( r^2 \/ N_0 \) B$, so the same identity applies. Maximize
  #[#set math.equation(numbering: n => "(9.26)")
   $ - log tilde(s) + j \( cal(F) \) + k_0 log chi \, $ <eq:unsafe-local-gradient-test>]
  where $k_0 gt.eq 2$, $chi$ is a fixed local cutoff, and $j' \, j''$ are positive, bounded,
    and bounded away from zero on the now bounded height range.
    If $m = \| #h(-0.16667em) upright(d) cal(F) \|_(g_r)$, the constitutive relations give
  #[#set math.equation(numbering: n => "(9.27)")
   $ q m^2 = J / tilde(s)^2 = frac(J W^2, cal(U)^2) \, wide \( 1 - y \)^2 \( j' m \)^2 =
     frac(\( j' \)^2 z^2, cal(U)^2) . $ <eq:unsafe-scaled-gradient-algebra>]
  At an interior maximum with $y gt.eq 1 \/ 2$, the positive leading term therefore controls $W^2$.
    The source term has size $r^2 Sigma_(+) \/ N_i lt.eq C W$, and localization costs $C chi^(- 2)$. Hence
  #[#set math.equation(numbering: n => "(9.28)")
   $ c W^2 lt.eq C \( 1 + W + chi^(- 2) \) . $ <eq:unsafe-slope-bound>]
  At $S$, (3.17), $B_n = - b_(*)$, $k_T hat(z) gt.eq 0$, and $H_g lt.eq
    0$ give $partial_n \( - log tilde(s) \) gt.eq 0$ for the inward normal. Also $partial_n cal(F) = m gt.eq 0$.
    The derivative condition at a boundary maximum in (9.26) therefore gives $j' m lt.eq C \/ chi$,
    which controls that case. When $y < 1 \/ 2$, $W lt.eq sqrt(2)$ directly.
    The maximum test and $k_0 gt.eq 2$ thus bound $W$ on a smaller patch.
  After this finite slope bound, differentiating the height divergence equation gives uniformly elliptic scalar
    divergence equations for its first derivatives. Their divergence forcing is controlled in $L^p$, $p > 3$,
    by the normalized lapse estimates. Odd reflection of $cal(F)$,
    with even reflection of lapse and the Fermi metric, gives the same estimate at $S$.
    The resulting gradient Hölder estimates and the uniform height convergence imply
  #[#set math.equation(numbering: n => "(9.29)")
   $ cal(U) arrow.r 1 \, wide #h(-0.16667em) upright(d) cal(F) arrow.r 0 \, wide tilde(s) arrow.r
     1 $ <eq:unsafe-flat-graph-limit>]
  on every fixed scaled compact set.
  #emph[The conformal factor.] It remains to control the conformal factor uniformly in the chosen fixed radius.
    Put $w' = w \/ w \( P \)$. On every fixed scaled patch, the height just proved gives $f gt.eq 9 M \/ 10$,
    hence $w gt.eq T_1$ with $T_1 = M^(9 \/ 10)$. The lapse is eventually at least $delta_0 \/ 2$;
    choose the subsequent cutoff $epsilon < delta_0 \/ 8$. Also $x = s w arrow.r oo$ there.
    The volume source and the low-lapse penalty are consequently absent.
    The positive function $w'$ is a supersolution for its uniformly elliptic divergence principal part,
    while $v' = \( w' - a \)^(+)$, $a = 4 T_1 \/ w \( P \)$, is a subsolution:
    above that truncation the remaining height penalty vanishes as well.
    Weak Harnack for $w'$, combined with the local supremum bound for $v'$ with the same positive mean exponent,
    gives on balls with fixed nesting ratios
  #[#set math.equation(numbering: n => "(9.30)")
   $ sup_(B_R) w' lt.eq a + C (frac(1, \| B_(2 R) \|) integral_(B_(2 R)) \( w' \)^p)^(1 \/ p) lt.eq a +
     C' inf_(B_R) w' lt.eq \( 4 + C' \) inf_(B_R) w' . $ <eq:unsafe-w-harnack>]
  The last step uses $w' gt.eq T_1 \/ w \( P \) = a \/ 4$. Natural zero flux permits reflection at $S$.
  These constants can be chosen independently of the fixed radius.
    Indeed, on each arbitrarily large fixed patch the normalized principal matrices tend to the identity by
    (9.29). If the boundary is far enough, use concentric balls about the center with universal radius ratios.
    Otherwise use comparable larger balls about its boundary foot in a single flattened chart, and reflect.
    The smaller ball contains both the center and the requested region.
    Uniform ellipticity with fixed constants and dilation invariance of the homogeneous estimates give one common
    constant in (9.30). The index from which that constant applies may depend on the radius.
    Since $w' \( P \) = 1$, it follows that $C^(- 1) lt.eq w' lt.eq C$.
  In the rescaled coordinates the metric is
  #[#set math.equation(numbering: n => "(9.31)")
   $ h = frac(x, x \( P \)) (g_r + tilde(s)^2 #h(-0.16667em) upright(d) cal(F)^2) \, wide frac(x, x \( P \)) =
     frac(tilde(s), tilde(s) \( P \)) w' . $ <eq:unsafe-rescaled-metric>]
  Here, as usual, the expression denotes its pullback by the coordinate rescaling.
    Equations (9.29) and (9.30) prove (9.8). At $S$ the mixed metric entries vanish,
    so reflection preserves this comparison. If the uniform statement of the lemma failed,
    a sequence violating it would admit precisely the subsequences just analyzed, a contradiction. ◻
]

=== 9.2 Mass and a fixed enclosing comparator <mass-and-a-fixed-enclosing-comparator>

On the AF end outside a common compact support, $N_o$ and $x = N_o w$ are harmonic and tend to one.
  Radial barriers of weight $\| x' \|^(- beta)$, $1 \/ 2 < beta < 1$, and estimates on annuli rescaled to unit size give

#[#set math.equation(numbering: n => "(9.32)")
 $ N_o = 1 + O_2 \( \| x' \|^(- beta) \) \, wide x = 1 + O_2 \( \| x' \|^(- beta) \) . $ <eq:unsafe-af-decay>]

The constants in these end bounds can depend on the fixed solution. Thus $h = x g_o$ is AF of this order.
  Since $g_o$ is scalar flat and $x$ is harmonic there, its scalar curvature is $O \( \| x' \|^(- 2 - 2 beta) \)$,
  an integrable decay rate.

The ADM flux of the conformal metric error gives

#[#set math.equation(numbering: n => "(9.33)")
 $ m_h - m_o = - frac(1, 8 pi) lim_(R arrow.r oo) integral_(\| x' \| = R) partial_n x thin #h(-0.16667em)
   upright(d) A_(g_o) . $ <eq:unsafe-adm-flux>]

One may replace the conormal-area product by its Euclidean version:
  the error is quadratic in the decaying fields and tends to zero.
  On this end the current in (3.15) is $Q = N_o nabla x + \( 1 - x \) nabla N_o$,
  whose flux has the same limit as $nabla x$. Integration of its divergence over both pieces,
  cancellation of the matched seam fluxes with their common base area form, and the outward flux $+ b_(*)$ at $S$ yield

#[#set math.equation(numbering: n => "(9.34)")
 $ 8 pi \( m_h - m_o \) = integral_S b_(*) thin #h(-0.16667em) upright(d) A_g +
   integral #scale(x: 120%, y: 120%)[\(] \( x - 1 \) Sigma_(+) + P -
   Sigma_(-) #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) upright(d) V_(upright("base")) .
   $ <eq:unsafe-mass-budget>]

This also proves existence of the ADM limit: the current divergence has compact support. By Lemma 33,

#[#set math.equation(numbering: n => "(9.35)")
 $ limsup_(M arrow.r oo) \( m_h - m_o \) lt.eq C \( b_(*) + delta_0 \) . $ <eq:unsafe-mass-limsup>]

The constant on the right uses only the fixed compact data.
  The penalty cutoff makes $\( x - 1 \) Sigma_(+) lt.eq 0$,
  and the positive penalty costs tend to zero after the subsequent choices specified in Section 7.

We will need a competitor whose area remains bounded as $M$ increases.
  Fix a sphere $cal(S)_1$ in the attached end beyond all source supports.
  Let $psi_1$ be its exterior capacitary potential: it is harmonic, is one on $cal(S)_1$,
  and tends to zero at infinity. Existence follows by solving on compact annuli, using the preceding barriers,
  and taking a limit. The function $gamma_1 = - partial_n psi_1$ is strictly positive on the sphere by Hopf’s
  lemma. Green’s formula for $x - 1$ and $psi_1$ gives

#[#set math.equation(numbering: n => "(9.36)")
 $ integral_(cal(S)_1) gamma_1 \( x - 1 \) thin #h(-0.16667em) upright(d) A_(g_o) = -
   lim_(R arrow.r oo) integral_(\| x' \| = R) partial_n x thin #h(-0.16667em) upright(d) A_(g_o) =
   8 pi \( m_h - m_o \) . $ <eq:unsafe-capacity-comparator>]

The boundary term at infinity in the first Green identity vanishes by $beta > 1 \/ 2$;
  alternatively apply the harmonic flux identity for $x$ on the intervening annulus.
  Positivity of $x$, the positive minimum of $gamma_1$, and the upper mass bound imply

#[#set math.equation(numbering: n => "(9.37)")
 $ "Area"_h \( cal(S)_1 \) = integral_(cal(S)_1) x thin #h(-0.16667em) upright(d) A_(g_o) lt.eq
   C_(*) . $ <eq:unsafe-comparator-bound>]

For the fixed earlier choices, $C_(*)$ is independent of large $M$ and of the later parameters.
  It is also independent of the scaled radius of the obstacles introduced below.

=== 9.3 Removing the corner <removing-the-corner>

The collar mollification and conformal correction below use Miao’s corner-smoothing method
  #cite(label("Miao2002")). We give the local argument for the present unsafe-set and cap construction,
  rather than invoke his global positive mass theorem.

#thm([Lemma 9.3.])[
  (Corner smoothing with controlled mass).  #emph[For each sufficiently large fixed solution,
    the joined metric $h$ admits smooth AF replacements $h'$ on the original side of the caps such that,
    with errors made arbitrarily small separately at that solution,
#[#set math.equation(numbering: n => "(9.38)")
 $ h' = \( 1 + o \( 1 \) \) h med upright("as quadratic forms") \, wide m_(h') = m_h + o \( 1 \) \, wide
   H_(h') \( S \) < 0 . $ <eq:unsafe-smoothing-estimates>]

 They satisfy $"Scal"_(h') gt.eq 0$ off $cal(U)_M$ and $"Scal"_(h') gt.eq -
   2$ everywhere on the original side of the caps. Their AF metric and scalar decay are those of (9.32).]
] <lem:corner-smoothing>

#proof[
  By Lemma 39 the closed unsafe set is disjoint from the seam for large $M$.
    Glue the two metrics using their own Gaussian normal collars.
    In the resulting smooth manifold structure the joined metric is continuous and has the form $#h(-0.16667em)
    upright(d) t^2 + lambda \( t \)$, piecewise smooth, with the inner side at $t < 0$.
    The common induced metric and the mean-curvature inequality in (7.23) give
  #[#set math.equation(numbering: n => "(9.39)")
   $ 1 / 2 "tr"_(lambda \( 0 \)) #scale(x: 120%, y: 120%)[\(] lambda' \( 0^(+) \) -
     lambda' \( 0^(-) \) #scale(x: 120%, y: 120%)[\)] lt.eq 0 . $ <eq:unsafe-corner-sign>]
  This change of collar identification retains a smooth identification of each original closed piece with its
    image; comparisons with the base metric will always use those identifications.
  Mollify $lambda$ in $t$ with a nonnegative smooth even kernel of radius $a$,
    and interpolate back to the original smooth metrics in $2 a lt.eq \| t \| lt.eq 3 a$.
    The resulting $h_a$ converges uniformly to $h$; its first normal derivatives and fixed tangential derivatives
    are bounded. Its second normal derivative is the jump of $lambda'$ times the mollifier plus a uniformly
    bounded remainder. The interpolation has the same bound, since on those smooth one-sided regions the
    mollification error is $O \( a^2 \)$ before taking the two cutoff derivatives.
    In the hypersurface scalar-curvature formula the only potentially unbounded term is $- "tr"_lambda lambda''$.
    Replacing the inverse metric in its jump term by $lambda \( 0 \)^(- 1)$ costs $O \( a \) O \( a^(- 1) \) =
    O \( 1 \)$; the leading term has favorable sign by (9.39).
    Thus $"Scal"_(h_a) gt.eq - C \( h \)$ in the smoothing collar, uniformly as $a arrow.b 0$.
    Choose a smooth $c_a gt.eq 0$, bounded by a constant depending on the fixed metric,
    supported in $\| t \| < 4 a$, and majorizing the negative scalar part created in that collar.
  Each orientable component of $S$ bounds a compact handlebody.
    Attach such caps, extend the metric smoothly through $S$, and denote their union by $O$.
    This gives a smooth complete one-ended AF manifold on which to solve the correction.
    Its homogeneous Sobolev inequality
  #[#set math.equation(numbering: n => "(9.40)")
   $ parallel v parallel_(L^6) lt.eq C parallel nabla v parallel_(L^2) \, wide v in C_c^oo \( X \) \,
     $ <eq:unsafe-af-sobolev>]
  has a constant uniform for small $a$. Indeed all these metrics are uniformly equivalent to one fixed smooth AF
    metric. The Euclidean Sobolev inequality on the end and compact local Sobolev inequalities leave only a
    compact $L^2$ term. Integration along radial rays, followed by Cauchy–Schwarz with the integrable weight
    $r^(- 2)$, controls the trace at a fixed end sphere by the end gradient energy.
    Poincaré’s inequality with this trace controls the remaining compact term, proving (9.40).
  Solve in the completion for the gradient norm
  #[#set math.equation(numbering: n => "(9.41)")
   $ - 8 Delta_(h_a) u_a = c_a \( 1 + u_a \) . $ <eq:unsafe-conformal-correction>]
  Since $parallel c_a parallel_(3 \/ 2) arrow.r 0$, the bilinear form $8 integral \| nabla v \|^2 -
    integral c_a v^2$ is coercive by (9.40). The right side is a bounded functional with norm tending to zero,
    because $parallel c_a parallel_(6 \/ 5) arrow.r 0$. Lax–Milgram gives a solution with $parallel u_a
    parallel_6 + parallel nabla u_a parallel_2 = o \( 1 \)$. Testing with its negative part and using coercivity
    proves $u_a gt.eq 0$. Local boundedness for scalar divergence equations,
    treating the bounded $c_a u_a$ term as a zeroth-order coefficient and the $L^2$-small $c_a$ as forcing,
    gives $parallel u_a parallel_oo = o \( 1 \)$ on a fixed compact set.
    On the unchanged end, $u_a$ is harmonic and tends to zero:
    this follows first from its $L^6$ membership and scaled local estimates.
    Exterior comparison then gives the global supremum bound.
    Elliptic estimates imply smooth convergence to zero on compact sets off the seam.
    The same end barriers as before give $u_a = O_2 \( \| x' \|^(- beta) \)$.
  Set $h' = \( 1 + u_a \)^4 h_a$ and restrict to the original side of the caps. The conformal scalar formula is
  #[#set math.equation(numbering: n => "(9.42)")
   $ "Scal"_(h') = \( 1 + u_a \)^(- 5) #scale(x: 120%, y: 120%)[\(] - 8 Delta_(h_a) \( 1 + u_a \) +
     "Scal"_(h_a) \( 1 + u_a \) #scale(x: 120%, y: 120%)[\)] = \( 1 + u_a \)^(- 4) \( "Scal"_(h_a) + c_a \) .
     $ <eq:unsafe-corrected-scalar>]
  It is nonnegative off the unsafe set. On that set the metric was not mollified, $c_a = 0$, and $"Scal"_h gt.eq -
    1$; since $u_a gt.eq 0$, the lower bound remains at least $- 1$.
    In particular the claimed fixed lower bound $- 2$ holds. The end scalar decay is preserved by the conformal formula.
  The smoothing itself changes no asymptotic metric. The conformal ADM flux,
    followed by integration of (9.41) on the capped manifold, gives
  #[#set math.equation(numbering: n => "(9.43)")
   $ m_(h') - m_h = - frac(1, 2 pi) lim_(R arrow.r oo) integral_(\| x' \| = R) partial_n u_a thin #h(-0.16667em)
     upright(d) A_(h_a) = frac(1, 16 pi) integral_X c_a \( 1 + u_a \) thin #h(-0.16667em) upright(d) V_(h_a) =
     o \( 1 \) . $ <eq:unsafe-smoothing-mass>]
  The decay $beta > 1 \/ 2$ justifies replacing conormal-area products in this flux as well.
    Uniform metric convergence gives the quadratic-form comparison.
    Finally $H_h \( S \) < 0$ by (7.23); the smooth convergence of the correction near this disjoint compact
    surface preserves that strict inequality. Each smallness requirement here is imposed after the fixed solution
    has been selected. ◻
]

=== 9.4 Enclosures whose boundaries avoid the unsafe set <enclosures-whose-boundaries-avoid-the-unsafe-set>

#thm([Lemma 9.4.])[
  (Free enclosing boundaries).  #emph[Choose a sufficiently large fixed scaled radius $R_(*)$,
    then $M$ sufficiently large depending on that radius, and perform the smoothing of Lemma 40 sufficiently
    closely. There is a perimeter minimizing enclosure $E$ of $O$ and the marked balls about all points of
    $cal(U)_M$, whose boundary is smooth, free, and disjoint from those balls and from $S$.
    There is also a largest perimeter minimizing enclosure $E_0$ of $O$ alone.
    These sets have all the boundary, exterior, and minimizing properties in Proposition 38.]
] <lem:free-enclosure>

#proof[
  Extend the smooth inner base geometry across $S$ in a fixed collar for the purpose of defining balls.
    Mark every closed base ball
  #[#set math.equation(numbering: n => "(9.44)")
   $ overline(B)_(g_(upright("ext"))) \( P \, R_(*) r_P \) \, wide P in cal(U)_M \, $ <eq:unsafe-marked-balls>]
  and include their union together with $O$ as an obstacle. For fixed parameters the union is compact:
    the center set is compact and its positive radius function is continuous.
    By Lemma 39, for each fixed $R_(*)$ these balls and the fixed larger multiples used below lie off the seam
    once $M$ is sufficiently large. All lie inside the comparator $cal(S)_1$.
  Minimize $h'$-perimeter among precompact finite-perimeter sets containing this obstacle modulo null sets.
    A minimizer exists by BV compactness and lower semicontinuity inside a sufficiently large smooth truncation.
    This is also a global minimizer in the stated class. To see that the outer truncation causes no restriction,
    all sufficiently far AF spheres have strictly positive outward mean curvature.
    The unit normal field of their foliation has positive divergence.
    For almost every cutting radius, Gauss–Green on the removed part of a competitor shows that cutting inward
    saves perimeter if the removed volume is positive. The same argument excludes contact with the outer
    constraint. The fixed comparator and the small metric change give a uniform bound, after enlarging $C_(*)$ once,
  #[#set math.equation(numbering: n => "(9.45)")
   $ "Per"_(h') \( E \) lt.eq C_(*) . $ <eq:unsafe-enclosure-bound>]
  We show that its perimeter support cannot meet any marked ball.
    Suppose it meets the ball marked at $P$, at a point $q$. Use scaled smooth base coordinates with length unit
    $r_P$ on a fixed multiple of radius $R_(*)$. The base metric and the comparison metric are equivalent to
    Euclidean metrics with constants independent of $R_(*)$, by Lemma 39 and the chosen small smoothing.
    If this region reaches $S$, reflect in a base collar for these comparisons.
    Mixed entries of the graph metric vanish on the face. No comparison for the arbitrary cap metric is needed:
    perimeters of sets containing $O$ are independent of its interior extension,
    and a reflected continuous metric can be used there in the comparison argument.
  The complement of $E$ has uniform lower volume density at $q$ in these scaled coordinates.
    Indeed filling a coordinate ball preserves the obstacle condition.
    Minimality and slicing therefore bound its interior perimeter by a constant times the complement’s trace area
    on the ball. If $V \( a \) = \| B_a \( q \) \\ E \|$, Euclidean isoperimetry gives
  #[#set math.equation(numbering: n => "(9.46)")
   $ V \( a \)^(2 \/ 3) lt.eq C V' \( a \) quad upright("for almost every ") a \, wide V \( a \) gt.eq
     c a^3 . $ <eq:unsafe-complement-density>]
  The second inequality follows by integrating the first from zero;
    the volume is positive at every radius because $q$ is in the perimeter support.
    Apply this on a ball of radius comparable to $R_(*)$. On a slightly larger common coordinate ball,
    $E$ itself has volume at least $c R_(*)^3$, since it contains the whole marked base ball modulo null sets.
    The uniform comparison of the scaled base metric with Euclidean metric justifies this statement even when the
    marked ball crosses $S$. Relative isoperimetry on that common ball now gives
  #[#set math.equation(numbering: n => "(9.47)")
   $ "Per"_(h') \( E \) gt.eq c R_(*)^2 . $ <eq:unsafe-obstacle-perimeter>]
  Choose $R_(*)$ so that this exceeds $C_(*)$, and only then choose $M$ large enough for all the scaled charts and
    their fixed multiples. This contradicts (9.45). Compactness of the center set also covers contacts with the
    closure of the union of marked balls. This is where the radius-independent constant in (9.9) is essential.
  There is no contact with $S$ either. The parallel outward normal field in a sufficiently thin collar of $O$ has
    strictly negative divergence, since $H_(h') \( S \) < 0$. Adjoin that collar to a purported minimizer.
    Gauss–Green on the added portion bounds the newly exposed leaf area minus the removed perimeter by the
    integral of this negative divergence. The added volume is positive for every sufficiently small width at a
    contact point; otherwise that point would not be in the perimeter support.
    Slicing allows an almost every width for which all perimeter formulas hold.
    The resulting strict decrease contradicts minimality. Adjoining a collar is permitted whether or not marked
    balls are present.
  The perimeter support is thus separated from both obstacles and the outer constraint.
    It is locally perimeter minimizing in a smooth three-manifold.
    Interior codimension-one minimizing boundary regularity gives a smooth compact embedded minimal surface.
    Take its open set representative for $E$. Filling any bounded open exterior component would strictly reduce
    perimeter, so its open exterior is connected. Since every precompact enlargement is an admissible competitor,
    $E$ is outward minimizing. Its boundary is disjoint from every marked ball,
    so the unsafe set lies in its interior. The metric on its closed exterior has nonnegative scalar curvature,
    and its completeness and unique AF end follow from smoothness of compact truncations and the AF estimates.
  Now minimize with obstacle $O$ alone. The same compactness, outer barriers,
    and strict inner mean-curvature barrier give a smooth free minimal boundary and a connected open exterior.
    Every component of this open minimizer meets $O$, because an open component disjoint from $O$ can be removed,
    strictly reducing perimeter. Choose a minimizer of maximal volume within the fixed truncation.
    It is a largest minimizer modulo null sets: the perimeter submodularity inequality implies that the union and
    intersection of any two minimizers are minimizers, and maximal volume forces the union to agree with this one.
    Denote its open representative by $E_0$. Any proper precompact enlargement of equal perimeter would also be a
    minimizer and would contradict maximal volume. The outer barriers allow this reasoning without the truncation.
    Thus $E_0$ is strictly outward minimizing. Its boundary avoids $S$, so $O subset.double E_0$.
    Finally $E$ is itself an admissible enclosure of $O$, proving (9.1). ◻
]

No bound on the number or topology of components created by the marked balls has been used.
  In particular the subsequent area transfer starts from $E_0$, not from a topological assertion about $E$.
  The hypotheses for the AF Riemannian Penrose theorem are satisfied by the closed exterior of $E$:
  it is smooth, complete and one-ended, its scalar curvature is nonnegative and decays as
  $O \( \| x' \|^(- 2 - 2 beta) \)$, with $2 + 2 beta > 3$, its metric decay has exponent $beta > 1 \/ 2$,
  and its entire possibly disconnected minimal boundary is outer minimizing.
  The boundary version of #cite(label("BrayLee2009"), form: "prose") Theorem 1.4 therefore gives

#[#set math.equation(numbering: n => "(9.48)")
 $ m_(h') gt.eq sqrt(frac("Per"_(h') \( E \), 16 pi)) . $ <eq:unsafe-af-penrose>]

=== 9.5 Bad volume and completion of the comparison <bad-volume-and-completion-of-the-comparison>

We finish the proof of Proposition 38 by checking the uniform quantitative inputs for Proposition 19.
  The exterior capacity comparison in Section 7 gives $x gt.eq 1 - psi_oo$,
  so for fixed $delta > 0$ the set ${ x < 1 - delta }$ does not reach beyond a fixed outer sphere.
  On the designated region, (7.12) gives $integral_({ x < 1 - delta }) W lt.eq C \/ L$.
  The omitted exterior collar has $W = 1$, so its contribution is bounded by its base volume.
  The omitted inner collar has base volume $O \( M^(- 4) \)$.
  Cauchy–Schwarz and (7.15) together with (7.9) therefore give

#[#set math.equation(numbering: n => "(9.49)")
 $ integral_({ x < 1 - delta }) W thin #h(-0.16667em) upright(d) V_(upright("base")) lt.eq C / L +
   "Vol"_(g_o) \( upright("omitted exterior collar") \) + C \( L \) M^(- 1) . $ <eq:unsafe-total-bad-volume>]

The coefficient in $C \/ L$ is independent of $L$. The other constants may depend on the earlier collar choice and
  on $L$, which is harmless: first make the exterior collar thin and $L$ large, then let $M$ be large.

Choose $b_(*) \, delta_0$ small enough in (9.35) for the prescribed mass tolerance.
  For the prescribed $delta$ and volume tolerance choose the collar and $L$ as just described.
  Fix the common comparator bound, choose $R_(*)$ in Lemma 41, and then choose $M$ large enough for that lemma,
  the scalar lower bound, the mass costs, and (9.49). The subsequent small lapse cutoff and finite strengths are
  those of Proposition 31; all uniform estimates above hold for those choices.
  Apply Lemma 40 with mass and metric errors small enough for the remaining tolerances. These choices prove (9.2)–(9.4).

The caps may be fixed once as topological handlebodies, regardless of all metric parameters.
  The topology entering the area-transfer argument is consequently the fixed finite topology of $X \\ "int" O$.
  Positive-time flow levels outside $E_0$ are allowed to enter the unsafe region:
  the uniform lower scalar bound there is precisely the input supplied by (9.2).
  The mass theorem is applied to the unmodified smooth exterior of $E$,
  whereas the small initial mean-curvature change used solely for the flow is covered by Proposition 19.
  This completes the AF comparison construction.

== 10 Completion of the proof <sec:completion>

=== 10.1 The time-symmetric inequality <the-time-symmetric-inequality>

#proof[
  The approximation of Proposition 28 preserves $H \( S \) lt.eq 0$, converges uniformly in metric comparison,
    and preserves the limiting time component. The comparison of enclosing areas in Section 2 therefore allows us
    first to assume that $R_g + 6 > 0$ and that the end has the smooth conformal form used in Section 6.
    Fix this approximated metric for the constructions that follow, and put
  $ A_(*) = A_min \( S \; g \) \, wide a = sqrt(A_(*) \/ \( 4 pi \)) . $
  Given an arbitrarily small mass tolerance $epsilon_m > 0$, Proposition 30 produces a fixed compact inner piece,
    a smooth synthetic tensor on it, and a scalar-flat AF attachment with mass $m_o$ satisfying
  #[#set math.equation(numbering: n => "(10.1)")
   $ m_o lt.eq p_0 \( g \) - a^3 / 2 + epsilon_m . $ <eq:completion-attachment-budget>]
  The electrostatic height, attachment radius, and smoothing tolerances used to obtain this inequality have
    already been fixed. They are independent of the large graph height in the next construction.
  Apply Proposition 31 and the comparison construction of Proposition 38.
    Their parameters are chosen in the proved order: the small inner flux and scalar cutoff costs first,
    then a desired relative-area tolerance $0 < epsilon_A < 1$, a sufficiently small contraction threshold,
    a thin omitted exterior collar, and a sufficiently large fixed volume penalty;
    next the graph height is taken large, and finally the lapse clipping, finite penalty strengths,
    and corner-smoothing tolerances are chosen. The costs can be made small enough that the resulting smooth AF
    comparison metric satisfies
  #[#set math.equation(numbering: n => "(10.2)")
   $ m_(upright("AF")) \( h' \) lt.eq m_o + epsilon_m . $ <eq:completion-comparison-budget>]
  Let $E$ be its minimizing enclosure containing the caps and the unsafe-region obstacles.
    Its free boundary is smooth, compact, minimal, and outer minimizing.
    The exterior is complete and has $R_(h') gt.eq 0$, the AF decay required in Theorem 7, and one end.
    Let $E_0$ instead be a largest perimeter-minimizing enclosure of the caps alone. Then
  #[#set math.equation(numbering: n => "(10.3)")
   $ "Area"_(h') \( partial E \) gt.eq "Area"_(h') \( partial E_0 \) . $ <eq:completion-enclosure-order>]
  The exterior of $E_0$ has a scalar lower bound independent of the large graph height,
    even where it meets the unsafe region. The bad-volume estimates from Sections 7 and 9,
    together with the projection along the AF attachment, satisfy Proposition 19.
    Consequently, when $A_(*) > 0$, the parameters above can be chosen so that
  #[#set math.equation(numbering: n => "(10.4)")
   $ "Area"_(h') \( partial E_0 \) gt.eq \( 1 - epsilon_A \) A_(*) . $ <eq:completion-area>]
  The small initial conformal change used only for the flow fixes this initial area.
    It is not made in applying the mass theorem.
  Theorem 7 applies to the exterior of $E$, not the possibly unsafe exterior of $E_0$. Equations (10.1)–(10.4) give
  $ p_0 \( g \) & gt.eq a^3 / 2 + m_o - epsilon_m\
 & gt.eq a^3 / 2 + m_(upright("AF")) \( h' \) - 2 epsilon_m\
 & gt.eq a^3 / 2 + a / 2 sqrt(1 - epsilon_A) - 2 epsilon_m . $
  Let the two tolerances tend to zero, making fresh choices of the finite parameters as necessary.
    If $A_(*) = 0$, the same construction and the nonnegativity consequence of Theorem 7 give $p_0 \( g \) gt.eq -
    2 epsilon_m$ without the area step. Thus (1.10) holds for every fixed approximated metric.
    Passing back through the preliminary approximation proves it for the original metric. ◻
]

=== 10.2 Maximal data and invariant mass <maximal-data-and-invariant-mass>

#proof[
  The maximal constraint and (1.6) imply
  $ integral_(upright("end")) V_0 \| R_g + 6 \| #h(-0.16667em) upright(d) V_g < oo . $
  Use Proposition 6 to choose a rest chart for the original covector.
    All hypotheses remain valid in that chart and $p_0 \( g \) = m_(upright("AH")) \( g \)$.
  Define
  $ F \( A \) = 1 / 2 (sqrt(frac(A, 4 pi)) + (frac(A, 4 pi))^(3 \/ 2)) . $
  This function is continuous, nonnegative, and nondecreasing on $\[ 0 \, oo \)$.
    Theorem 3 supplies the time-symmetric input of Theorem 20,
    including comparison metrics whose covectors are not timelike. The reduction therefore gives
  $ p_0 \( g \) gt.eq F #scale(x: 120%, y: 120%)[\(] A_min \( S \; g \) #scale(x: 120%, y: 120%)[\)] . $
  Since the chart was fixed before any construction, this is precisely (1.9).
    The one-sided time-component budgets suffice; there is no further assertion about the spatial components of
    intermediate comparison metrics. ◻
]

=== 10.3 Sharpness <sharpness>

Let $m > 0$, and let $a$ be the positive solution of $a + a^3 = 2 m$. The Schwarzschild–anti-de Sitter metric is

#[#set math.equation(numbering: n => "(10.5)")
 $ g_m = frac(#h(-0.16667em) upright(d) r^2, 1 + r^2 - 2 m \/ r) + r^2 sigma \, wide r gt.eq a \, wide K =
   0 . $ <eq:sads-metric>]

To include its boundary smoothly, use proper distance $s$ from $r = a$. Then

$ g_m = #h(-0.16667em) upright(d) s^2 + r \( s \)^2 sigma \, quad r \( 0 \) = a \, quad r' \( 0 \) = 0 \,
  quad \( r' \)^2 = 1 + r^2 - 2 m \/ r . $

The simple positive radial derivative of the expression on the right at $a$ gives a smooth even solution
  $r \( s \)$ near zero, increasing for $s > 0$. Hence the horizon is a smooth minimal boundary and the exterior
  is complete with that boundary included. Since $r'' = r + m \/ r^2$, the warped-product formula gives

$ R_(g_m) = - frac(4 r'', r) + frac(2 \( 1 - \( r' \)^2 \), r^2) = - 6 . $

The constraints are vacuum, the metric error and its required tensor derivatives are $O \( r^(- 3) \)$,
  and the weighted matter integral vanishes.

For completeness the mass normalization can be checked directly.
  In the background distance coordinate, write $g_m - b = zeta #h(-0.16667em) upright(d) eta^2$, where

$ zeta = frac(2 m, r \( 1 + r^2 - 2 m \/ r \)) . $

The radial component of $"div"_b e - #h(-0.16667em) upright(d) "tr"_b e$ is $2 coth eta thin zeta$,
  and the other two terms of (1.3) cancel for $V_0$. The normalized sphere flux therefore tends to

$ m frac(1 + r^2, 1 + r^2 - 2 m \/ r) arrow.r m . $

Rotational symmetry makes the three spatial fluxes zero, so $m_(upright("AH")) \( g_m \) = m$.

Radial projection onto the horizon has two-area Jacobian at most one, since $r gt.eq a$.
  Every radial ray meets the entire intrinsic boundary of any admissible end-side domain:
  either it enters that domain across its boundary, or its initial point already lies on the counted boundary at
  $S$. Thus projection of the cut covers the horizon. The area formula gives $"Area"_(g_m) \( partial D \) gt.eq
  4 pi a^2$. The horizon itself is an admissible competitor, and hence $A_min \( S \; g_m \) = 4 pi a^2$.
  Equation $2 m = a + a^3$ proves equality in (1.9) and completes Theorem 2.

#bibliography("refs.bib", style: "ieee", title: [References])
