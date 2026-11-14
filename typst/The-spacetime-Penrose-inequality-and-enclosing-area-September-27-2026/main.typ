#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The spacetime Penrose inequality and enclosing area]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 The inequality and its geometric quantity <sec:introduction>

The Penrose inequality asks how much mass is required to surround a trapped region.
  Its origin is a test of cosmic censorship: a collapsing configuration should settle to a black hole,
  radiation should carry energy away, and the horizon area should not decrease.
  Penrose’s null-shell argument made this comparison concrete #cite(label("Penrose1973")).
  An initial-data theorem must express it using only a Riemannian metric,
  a second fundamental form and a specified enclosing area.

The choice of area is part of the problem. A surface outside an apparent horizon can have smaller area than the
  horizon itself. Ben-Dov gave spherically symmetric examples satisfying the dominant energy condition for which
  the bound using the apparent horizon’s own area fails #cite(label("BenDov2004")).
  Carrasco and Mars found a different obstruction for generalized apparent horizons:
  their counterexamples already have an outer area-minimizing generalized horizon
  #cite(label("CarrascoMars2010")). Thus a mass–area statement must specify both its trapping condition and its
  enclosing class. We use instead the infimum of the areas of all full cuts separating the boundary from infinity.
  Every component counts, including any part coincident with the boundary.
  The mass is the Lorentz-invariant length of the ADM energy-momentum vector.
  These choices lead to the following precise formulation.

=== 1.1 Data, area and statements <data-area-and-statements>

#prodef([Definition 1.1.])[
  (Initial-data exterior).  Let $n gt.eq 3$ and let $Omega$ be a smooth connected orientable $n$-manifold with
    nonempty compact smooth boundary $S$. The metric $g$ and symmetric covariant two-tensor $K$ are smooth up to
    $S$, and $g$ is complete with $S$ included. Outside a compact set,
    $Omega$ is a single coordinate end ${ x in bb(R)^n : \| x \| > R_0 }$.
    Thus there are no additional ends hidden in the compact-complement condition.
  Write $R_g$ for scalar curvature and $nabla$ for the connection of $g$. Write $tau = "tr"_g K$.
    Our constraint normalization is
  #[#set math.equation(numbering: n => "(1.1)")
   $ 2 mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide J_i =
     nabla^j #scale(x: 120%, y: 120%)[\(] K_(i j) - \( "tr"_g K \) g_(i j) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:setting:constraints>]
  The dominant energy condition is $mu gt.eq \| J \|_g$. We require $mu \, \| J \|_g in L^1 \( Omega \, d V_g \)$.
    Along $S$ the unit normal $nu$ points into $Omega$, toward the end. Its future expansion is
  $ theta_(+) = H_S + "tr"_S K \, wide H_S = "div"_S nu \, wide "tr"_S K = \( g^(i j) - nu^i nu^j \) K_(i j) . $
  The boundary is weakly future trapped when $theta_(+) lt.eq 0$ on every component.
    No condition is imposed on the other null expansion.
  For coordinate tensors, $T = O_j \( r^(- a) \)$ means $\| partial^alpha T \| lt.eq
    C_alpha r^(- a - \| alpha \|)$ for $\| alpha \| lt.eq j$, where $r = \| x \|$.
    The decay orders will be specified in each theorem. Set $k = n - 1$ and $omega =
    omega_(n - 1) = \| bb(S)^(n - 1) \|$. The Laplacian is $Delta =
    "div" nabla$ and symmetrization includes a factor $1 \/ 2$. We require the finite ADM limits
  #[#set math.equation(numbering: n => "(1.2)")
   $ E & = frac(1, 2 \( n - 1 \) omega_(n - 1)) lim_(R arrow.r oo)
     integral_(\| x \| = R) \( partial_j g_(i j) - partial_i g_(j j) \) n_delta^i thin d A_delta \,\
P_i & = frac(1, \( n - 1 \) omega_(n - 1)) lim_(R arrow.r oo) integral_(\| x \| = R) #scale(x: 120%, y: 120%)[\(]
  K_(i j) - \( "tr"_g K \) g_(i j) #scale(x: 120%, y: 120%)[\)] n_delta^j thin d A_delta . $ <eq:setting:energy>]
  Here $n_delta$ and $d A_delta$ are Euclidean. If $E > \| P \|_delta$,
    define $m = \( E^2 - \| P \|_delta^2 \)^(1 \/ 2)$.
] <def:data>

#prodef([Definition 1.2.])[
  (Full enclosing cuts).  A #emph[full enclosing cut] is the entire intrinsic manifold boundary $Gamma =
    partial D$ of a connected smooth codimension-zero submanifold-with-boundary $D subset Omega$.
    We require $D$ to be closed in $Omega$, its manifold interior to lie in $"int" Omega$,
    and $D$ to contain the whole sufficiently distant end. Its full boundary must be compact, smooth,
    embedded and two-sided. In particular, $D = Omega$ is admissible and has boundary $S$. Define
  #[#set math.equation(numbering: n => "(1.3)")
   $ A_(min \, g) \( S \) = inf_D "Area"_g \( partial D \) . $ <eq:setting:minarea>]
  The use of intrinsic boundary ensures that coincident portions of $S$ are counted.
    A cut need not be connected, trapped or minimal. The infimum need not be attained.
] <def:fullcuts>

#thm([Theorem 1.3.])[
  (The enclosing-area Penrose inequality).  #emph[Let $\( Omega^n \, g \, K \)$ be the smooth one-ended exterior
    specified above, with integrable constraint densities, finite ADM limits,
    dominant energy condition and weakly future trapped boundary. Suppose
$ g - delta = O_6 \( r^(- q) \) \, wide K = O_5 \( r^(- 1 - q) \) \, wide frac(n - 2, 2) < q < n - 2 \, $

 and assume $E > \| P \|_delta$ and $A_(min \, g) \( S \) > 0$. Then
#[#set math.equation(numbering: n => "(1.4)")
 $ m gt.eq 1 / 2 (frac(A_(min \, g) \( S \), omega_(n - 1)))^(frac(n - 2, n - 1)) . $ <eq:setting:main>]

 The coefficient and exponent are sharp in each dimension $n gt.eq 3$.]
] <thm:main>

Thus the enclosing-area form of the spacetime Penrose conjecture holds in this class.
  Neither outermostness nor outer area minimization of $S$ is assumed.
  The second fundamental form is arbitrary, and no spin, vacuum or interior-topology hypothesis is imposed.
  The time-symmetric Schwarzschild–Tangherlini exterior of mass $m > 0$ has $A_(min \, g) \( S \) =
  omega_(n - 1) \( 2 m \)^(\( n - 1 \) \/ \( n - 2 \))$ and attains equality.

#thm([Corollary 1.4.])[
  (Automatic future timelikeness in the strong-decay class).  #emph[Assume all hypotheses of Theorem 3 except the
    inequality $E > \| P \|_delta$. In particular, retain the one-ended exterior,
    the $O_6 \/ O_5$ decay with $\( n - 2 \) \/ 2 < q < n - 2$, and $A_(min \, g) \( S \) > 0$.
    Then $E > \| P \|_delta$, and Equation (1.4) holds.]
] <cor:automatic-timelikeness>

The proof follows the numerical deduction in Section 2.

#thm([Theorem 1.5.])[
  (Weaker decay in dimensions three and four).  #emph[Let $n = 3$ or $n = 4$.
    Let $\( Omega^n \, g \, K \)$ be the smooth one-ended exterior specified above,
    with integrable constraint densities, finite ADM limits, dominant energy condition and weakly future trapped
    boundary. Assume
$ g - delta = O_2 \( r^(- q) \) \, wide K = O_1 \( r^(- 1 - q) \) \, wide q > frac(n - 2, 2) . $

 Then $A_(min \, g) \( S \) > 0$, $E > \| P \|_delta$, and (1.4) holds.]
] <thm:low>

Here positive enclosing area and timelikeness are both conclusions, and no extra decay is required of $"tr"_g K$.
  The two derivative regimes concern the original data. After preparation,
  both lead to ends with estimates at every fixed derivative order,
  allowing one common deformation theorem to prove the numerical bound.

There are also designated-end formulations for finitely many ends,
  with different area classes in dimensions three and four.
  In the three-dimensional complete-data formulation the chosen outer region may retain other ends;
  in four dimensions its connected outer domain excludes their distant tails.
  Sections 7 and Section 8 give their precise definitions and proofs.
  Their reduction to the one-ended inequality compares the two enclosing infima in the needed direction;
  it does not identify them. The one-ended statements above isolate the common numerical construction.
  Equality for the original data requires additional horizon assumptions and a separate variational argument.

=== 1.2 From time symmetry to spacetime data <from-time-symmetry-to-spacetime-data>

When $K = 0$, the dominant energy condition becomes $R_g gt.eq 0$ and a marginal boundary is minimal.
  Geroch introduced the connected-surface Hawking-mass monotonicity underlying smooth inverse mean curvature flow
  #cite(label("Geroch1973")). Jang and Wald related this method to the Penrose bound under the assumption that a
  classical flow runs from the inner boundary to asymptotically round spheres #cite(label("JangWald1977"));
  Huisken and Ilmanen recount these precursors in #cite(label("HuiskenIlmanen2001")) p. 359.
  Two different flow methods then established the three-dimensional Riemannian inequality.
  Huisken and Ilmanen’s weak inverse mean curvature flow allows jumps while preserving the Hawking mass
  comparison; its bound applies to each connected component of an outermost minimal boundary
  #cite(label("HuiskenIlmanen2001")). Bray’s conformal flow changes the metric,
  preserving the horizon area and making mass nonincreasing,
  and proves the sharp bound for the total area of a possibly disconnected horizon #cite(label("Bray2001")).
  Bray and Lee extended that method through dimension seven #cite(label("BrayLee2009")).
  Their numerical theorem requires no spin assumption; the additional spin hypothesis in the published statement
  belongs to its equality conclusion.

Above dimension seven, minimizing frontiers may be singular. Bi and Zhu extend conformal flow to this setting.
  Their revised theorem treats almost-minimizing Caccioppoli boundaries with minimal regular part,
  outermost minimizing enclosure and a metric extending with the stated regularity across the boundary
  #cite(label("BiZhu2026v2")) Theorem 1.2. Their work supplies the ancestry of the separation,
  mass–capacity and convergence arguments used for the Riemannian endpoint here.
  The exact version we need allows all components of a locally minimizing and outer-minimizing frontier;
  its full proof is part of the Riemannian argument described below.

Nonzero $K$ introduces a different difficulty: neither scalar curvature nor the boundary mean curvature has the
  required Riemannian sign. Jang introduced a graph equation for extending Geroch’s positive-energy argument
  beyond time symmetry #cite(label("Jang1978")). Schoen and Yau’s minimal-surface argument established the
  three-dimensional Riemannian positive-mass theorem #cite(label("SchoenYau1979")).
  Their spacetime proof combined Jang’s equation with conformal deformation and a treatment of graph blow-up to
  prove positive energy for general three-dimensional initial data #cite(label("SchoenYau1981")).
  The Penrose problem asks more of the deformation: a lower bound for enclosing area must survive along with the
  mass comparison. Malec and Ó Murchadha explained the obstruction to obtaining both controls from the direct
  classical-Jang and conformal-deformation scheme, even in spherical symmetry #cite(label("Malec")).

In spherical symmetry, Malec and Ó Murchadha proved the inequality for maximal data,
  and Hayward obtained it from monotonicity of the Misner–Sharp energy in untrapped regions without that
  maximality restriction #cite(label("MalecOMurchadha1994")) #cite(label("Hayward1996")).
  Bray and Khuri introduced a warped graph and a generalized Schoen–Yau scalar-curvature identity
  #cite(label("BrayKhuri2010")) #cite(label("BrayKhuri2011")).
  On solutions of the generalized Jang equation, the identity separates the nonnegative dominant-energy
  contribution and square terms from a divergence. It does not by itself solve the equations needed to control
  that divergence. They gave a new proof in spherical symmetry and proposed coupled systems for the general
  problem. Han and Khuri established existence and boundary blow-up for prescribed warping factors with suitable
  boundary and asymptotic behavior #cite(label("HanKhuri")).
  Jaracz later constructed spherical data for which one particular coupling,
  generalized Jang with zero divergence, has no smooth radial solution with the required positive warp and
  asymptotics #cite(label("Jaracz2023")). That obstruction concerns the specified coupling and radial solution class.

Sharp spacetime results are also known beyond the spherical three-dimensional case.
  Bryden, Khuri and Sormani proved the sharp inequality and Schwarzschild rigidity in spherical symmetry in every
  spatial dimension #cite(label("BrydenKhuriSormani2021")).
  Khuri and Kunduri proved a sharp spacetime inequality for $upright("SU") \( ell + 1 \)$-invariant data of
  dimension $2 \( ell + 1 \)$; their result for the full cohomogeneity-one class is Riemannian
  #cite(label("KhuriKunduri2025")).

For nonsymmetric three-dimensional asymptotically flat data, Allen, Bryden,
  Kazaras and Khuri proved a universal invariant-mass bound with a suboptimal constant under their asymptotic
  hypotheses, including extra decay of $"tr"_g K$ #cite(label("AllenBrydenKazarasKhuri2025")).
  For each end, their statement uses at least one outermost collection of future or past marginal components and
  its least enclosing area. Theorems 3 and 5 give the sharp coefficient under the original-data hypotheses above,
  using full enclosing cuts for any weakly future trapped boundary.

Other nonsymmetric results concern different hypotheses and area quantities.
  Ellithy’s inequality bounds the total area of outermost future apparent-horizon sections under a
  quasi-final-state condition on the future development, negative ingoing expansion,
  and a piecewise smooth horizon tube with finitely many area-nondecreasing jumps #cite(label("Ellithy2026"))
  Theorem 4.12. Dong’s pure-trace theorem gives the bound for each connected generalized-horizon component
  #cite(label("Dong2026Sigma")) Theorem 1.2; his two-convex theorem assumes a connected outermost past apparent
  horizon #cite(label("Dong2026TwoConvex")) Theorem 1.2. In the latter class the stated asymptotic restrictions
  force zero ADM linear momentum, as noted in #cite(label("Dong2026TwoConvex")) Remark 1.3.
  These area and tensor assumptions are distinct from the full enclosing cuts and arbitrary second fundamental
  forms in our statements. Mars surveys the underlying alternatives in formulating the initial-data Penrose
  problem #cite(label("Mars2009")).

=== 1.3 How the proof controls curvature, mass and area <how-the-proof-controls-curvature-mass-and-area>

The numerical argument first prepares the end, then performs one filled graph and conformal deformation.
  The preparation replaces the distant end by a vacuum reference slice with matching charges,
  bends that slice to rest, and repairs the constraints while comparing every full enclosing cut.
  Its output has compactly supported $K$, strict dominant energy condition and strict boundary trapping.
  In dimensions three and four the weak-decay preparation provides the same differentiated output.
  The three-dimensional enclosing infima converge to the original one;
  in four dimensions the available lower comparison is sufficient.
  The finite-stage data, rather than a formal limiting object, enter the common deformation theorem.

Fix a prepared exterior $\( Omega \, g_0 \, K_0 \)$, with energy $E_0$ and enclosing area $A_0 =
  A_(min \, g_0) \( S \)$. For each small $epsilon > 0$, the deformation theorem constructs a family of smooth
  metrics indexed by a large parameter $N$. Each metric has a minimizing frontier lying in the original exterior
  and separating its inner boundary from infinity, with area at least $e^(- \( n - 1 \) epsilon) A_0$,
  nonnegative scalar curvature outside that frontier, and energy at most $E_0$ plus an error tending to zero as $N
  arrow.r oo$. The Riemannian numerical inequality therefore gives

$ E_0 gt.eq 1 / 2 (frac(e^(- \( n - 1 \) epsilon) A_0, omega_(n - 1)))^(frac(n - 2, n - 1)) $

after $N arrow.r oo$. Letting $epsilon arrow.b 0$ proves the prepared inequality.
  Only then do we remove the end preparation. No metric at $N = oo$ is needed.

The construction must explain all three estimates together.
  We fill the inner boundary smoothly and solve for a graph height and a conformal factor on the resulting
  manifold without boundary. The conformal factor has a lower bound, protecting the area of every enclosing cut.
  The curvature identity separates the dominant energy term, coercive squares and a divergence.
  In contrast to the zero-divergence coupling, the divergence has a specified nonzero source term;
  its integral controls the change of mass. Compared with the Schoen–Yau and Bray–Khuri identities
  #cite(label("SchoenYau1981")) #cite(label("BrayKhuri2011")),
  the trace equation and the divergence source are modified to enforce these simultaneous controls.

Global solvability is the analytic part of this construction.
  Height comparison and a barrier argument establish the lower conformal bound.
  Testing the scalar divergence equation and applying a Sobolev inequality on the graph,
  based on Michael–Simon #cite(label("MichaelSimon1973")), yield the complementary upper estimate before uniform
  ellipticity is available. Together these bounds control graph distortion and make the equations uniformly
  elliptic for each fixed $N$. Separate scalar regularity estimates treat the trace equation,
  whose distinguished direction is the solution’s gradient, and the divergence equation,
  which has quadratic gradient growth. They supply the control needed for continuation and exhaustion.
  These steps prove solvability of this particular coupled system;
  prescribed-warp existence for another system is not used as a substitute.

The filling removes inner boundary flux, but a minimizing enclosure might enter the filled region.
  We prevent this by a further conformal change, large deep inside the filling and small near infinity.
  Two-sided density estimates force the minimizing frontier away from the interior obstacle and into the band
  where scalar curvature has the correct sign. This is why scalar-curvature improvement alone would not finish the
  proof: the location and full area of the enclosure must be controlled.

For dimensions three through seven, Bray–Lee’s numerical theorem supplies the Riemannian endpoint.
  In higher dimensions the detached frontier can have a singular set of dimension at most $n - 8$.
  The required endpoint is the minimizing-frontier theorem, including its conformal flow, separation,
  smoothing and limiting arguments. We use the complete companion argument of #cite(label("RiemannianCompanion"));
  Section 2 quotes the precise mathematical input. Its numerical application uses the stated second-order
  asymptotic decay and weak-boundary hypotheses. Only the numerical bound is needed;
  no Riemannian equality theorem or all-orders expansion of the input metric at infinity is used.
  The endpoint thus requires control of both the singular frontier and the asymptotically flat end.

Section 2 first states the prepared geometric output and proves the numerical comparison.
  Section 3 prepares the strongly decaying original end. Sections 4 and Section 5 derive the curvature identity
  and solve the filled system. Section 6 locates the minimizing enclosure.
  Sections 7 and Section 8 give the complete weak-decay preparations and their distinct designated-end transfers.
  The companion #emph[Boundary graph deformations for the spacetime Penrose inequality]
  #cite(label("BoundaryCompanion")) studies what changes when one keeps an actual inner boundary,
  including its signed flux, or retains a decaying tensor in a maximal-data construction.
  It provides alternative analytic tools. The companion #emph[Equality and rigidity in the spacetime Penrose
  inequality] #cite(label("RigidityCompanion")) returns to the original $g$ and $K$ through variation,
  a causal adjoint system and static classification. These alternative methods and equality results are not
  premises of the numerical argument proved here.

== 2 The prepared geometric comparison <sec:comparison>

The central construction produces a Riemannian exterior whose energy is almost no larger than the energy of the
  input, while its full boundary area is almost no smaller than the input’s least enclosing area.
  This section states that construction in geometric terms and gives the complete numerical deduction.
  The following sections prove the construction. The data entering it are specified directly;
  they need not have been obtained by any particular preparation procedure.

#prodef([Definition 2.1.])[
  (Prepared exterior).  Let $\( Omega^n \, g_0 \, K_0 \)$ be a smooth connected orientable one-ended exterior with
    nonempty compact smooth boundary $S$, complete with $S$ included and with compact complement of its Euclidean
    coordinate end. Use the constraint and ADM conventions of Equations (1.1)–(1.2).
    Let $𝜚$ be a smooth positive function on the closed exterior,
    equal to the coordinate radius on a distant tail. Require that, for some $0 < beta < 1$ and $c > 0$,
  #[#set math.equation(numbering: n => "(2.1)")
   $ "supp" K_0 upright(" is compact") \, wide g_0 - delta = O_d \( r^(2 - n) \) upright(" for every fixed ") d \,\
R_(g_0) = O \( r^(- n - beta) \) \, wide mu_0 - \| J_0 \|_(g_0) gt.eq c 𝜚^(- n - beta) \, wide H_S +
  "tr"_S K_0 < 0 upright(" on every component of ") S . $ <eq:end:prepared>]
  The constraint densities are integrable. The ADM momentum is $P_0 = 0$; write $E_0$ for the energy.
    Finally the full-cut infimum, with every component and all contact counted as in Definition 2, is $A_0 =
    A_(min \, g_0) \( S \) > 0$.
] <def:prepared>

Once one prepared datum has been fixed, we suppress its subscript and write $g \, K \, E \, a$ for $g_0 \, K_0 \,
  E_0 \, A_0$. All constants in its deformation may depend on this fixed datum.
  A proper map comparing different prepared data is an output of end preparation, not an assumption in this definition.

The output below may have a singular frontier. For an enclosing-set exterior,
  length distance is computed by rectifiable paths in the closed exterior and may equal $+ oo$.
  Completeness means completeness on each finite-distance equivalence class;
  every frontier point and the full perimeter remain included.

#thm([Theorem 2.2.])[
  (The geometric deformation).  #emph[ Fix a prepared exterior and $0 < epsilon.alt < 1$.
    For all sufficiently large integers $N$ there is a connected enclosing-set exterior $X_N$,
    complete with its compact frontier $Sigma_N$ included, in a smooth Riemannian ambient metric $tilde(g)_N$.
    It has one Euclidean coordinate end with compact complement, and
#[#set math.equation(numbering: n => "(2.2)")
 $ & R_(tilde(g)_N) gt.eq 0 \, quad R_(tilde(g)_N) in L^1 \( X_N \) \, quad tilde(g)_N - delta = O_2 \( r^(2 - n) \) \,\
 & R_(tilde(g)_N) = O \( r^(- n - beta') \) quad upright("for some ") beta' > 0 \,\
 & E \( tilde(g)_N \) lt.eq E_0 + P_N \( e^(- N epsilon.alt) + e^(- N epsilon.alt \/ 2) \) \,\
 & cal(H)_(tilde(g)_N)^(n - 1) \( Sigma_N \) gt.eq e^(- \( n - 1 \) epsilon.alt) A_0 .
   $ <eq:height:enclosure-estimates>]

 Here $P_N$ is a polynomial in $N$, with coefficients depending on the fixed datum and $epsilon.alt$.
   The metric is smooth through the frontier. The whole frontier is outer minimizing and locally perimeter
   minimizing as the boundary of its filled side. It is smooth embedded minimal away from a compact singular set
   of Hausdorff dimension at most $n - 8$; for $3 lt.eq n lt.eq 7$ the singular set is empty.
   Its area counts every component.]
] <thm:prepared:deformation>

The proof is completed in Section 6. The analytic construction in Sections 4 and Section 5 takes place on a smooth
  filling and yields the energy estimate before any frontier is selected.
  The height argument then gives a detached minimizing frontier and the lower bound for its full area.

Here is the precise Riemannian input from the complete companion #emph[Conformal flow and the Riemannian Penrose
  inequality with minimizing frontiers] #cite(label("RiemannianCompanion")).
  We use its Theorem 1.1 in the following form.

#quote(block: true)[
  Let $X^n$ be a connected complete enclosing-set exterior, including its compact frontier $Sigma$,
    with a metric $gamma$ smooth through that frontier. Suppose there is one Euclidean coordinate end with compact
    complement, $gamma - delta = O_2 \( r^(- tau) \)$ with $tau > \( n - 2 \) \/ 2$, and $R_gamma gt.eq 0$,
    $R_gamma in L^1$, and $R_gamma = O \( r^(- n - beta) \)$ for some $beta > 0$.
    Suppose its full frontier is outer minimizing and locally perimeter minimizing as the boundary of the filled
    side, allowing compactly supported variations on either side.
    Its regular part is a smooth embedded minimal hypersurface.
    Its singular set has Hausdorff dimension at most $n - 8$. Then
  $ E \( gamma \) gt.eq 1 / 2 (frac(cal(H)_gamma^(n - 1) \( Sigma \), omega_(n - 1)))^(\( n - 2 \) \/ \( n - 1 \)) . $
  The assertion includes zero frontier area and imposes neither a spin condition nor connectedness of the frontier.
]

The smooth numerical theorem of Bray–Lee #cite(label("BrayLee2009")) Theorem 1.4 is an alternative in dimensions
  three through seven. In higher dimensions the companion retains the full singular-frontier argument.
  Its conformal-flow ancestry includes Bi–Zhu’s version 2 area-before-nesting and singular separation arguments
  #cite(label("BiZhu2026v2")). The independent smooth positive-mass input is Brendle–Wang
  #cite(label("BrendleWang2026")) Corollary 1.6, applied there to constructed smooth complete boundaryless
  approximants with strictly positive scalar curvature and the required differentiated end.
  Those stronger approximant hypotheses are not additional assumptions on $X$.

#thm([Theorem 2.3.])[
  (The prepared energy inequality).  #emph[Every exterior in Definition 6 satisfies
#[#set math.equation(numbering: n => "(2.3)")
 $ E_0 gt.eq 1 / 2 (A_0 / omega)^(\( n - 2 \) \/ \( n - 1 \)) . $ <eq:height:prepared-inequality>]

]
] <thm:numerical:prepared>

#proof[
  Fix the datum and $epsilon.alt$. Apply the quoted Riemannian theorem to the actual exterior $X_N$ furnished by
    Theorem 7. Its metric is smooth through the compact frontier;
    its closure is complete and its open exterior is connected.
    The end has compact complement and decay exponent $n - 2 > \( n - 2 \) \/ 2$.
    Its scalar curvature is nonnegative and integrable with the required pointwise decay.
    The whole frontier is outer minimizing and locally perimeter minimizing,
    hence has minimal regular part and singular dimension at most $n - 8$. These verify each receiving hypothesis.
    We obtain
  $ E_0 + P_N \( e^(- N epsilon.alt) + e^(- N epsilon.alt \/ 2) \) gt.eq E \( tilde(g)_N \) gt.eq 1 /
    2 (frac(cal(H)_(tilde(g)_N)^(n - 1) \( Sigma_N \), omega))^(\( n - 2 \) \/ \( n - 1 \)) gt.eq 1 /
    2 (frac(e^(- \( n - 1 \) epsilon.alt) A_0, omega))^(\( n - 2 \) \/ \( n - 1 \)) . $
  First let $N arrow.r oo$; exponential decay beats the fixed polynomial. Then let $epsilon.alt arrow.b 0$.
    These are limits of numbers. The exhaustion constructing a smooth solution at each fixed $N$ is completed
    before this argument, and no metric at $N = oo$ is required. Since $A_0 > 0$, this also proves $E_0 > 0$. ◻
]

#proof[
  #emph[Deduction of Theorem 3.] Proposition 9, proved in the next section,
    supplies prepared data with energies $E_j arrow.r m = sqrt(E^2 - \| P \|^2)$ and enclosing infima $A_j
    gt.eq \( 1 - o \( 1 \) \) A_(min \, g) \( S \)$. Apply Theorem 8 to each prepared datum,
    completing all its fixed-data limits first. Then
  $ m gt.eq 1 / 2 (frac(A_(min \, g) \( S \), omega))^(\( n - 2 \) \/ \( n - 1 \)) . $
  No estimate uniform in the preparation index is used.
  For sharpness, let $M > 0$, $r_M = \( 2 M \)^(1 \/ \( n - 2 \))$, and take the static Schwarzschild–Tangherlini slice
  $ g = frac(d r^2, 1 - 2 M \/ r^(n - 2)) + r^2 sigma_(n - 1) \, quad K = 0 \, wide r gt.eq r_M . $
  Proper distance from the horizon makes this a smooth complete metric with minimal compact boundary.
    Its scalar curvature is zero, and its ADM vector is $\( M \, 0 \)$.
    Radial projection to the sphere of radius $r_M$ has $\( n - 1 \)$-Jacobian at most one.
    More explicitly the pullback of that sphere’s area form is closed with comass at most one;
    Stokes’ theorem on an end truncation of any full outer domain shows that its integral over the entire cut is
    $omega r_M^(n - 1)$. Thus every full cut has area at least that number, while the boundary itself attains it.
    Consequently $A_min = omega \( 2 M \)^(\( n - 1 \) \/ \( n - 2 \))$ and equality holds. ◻
]

The same numerical bound forces future timelikeness once a positive enclosing area is retained under an
  energy-raising conformal change.

#proof[
  If instead $E lt.eq \| P \|_delta$, choose $epsilon_j > 0$ tending to zero and put
  $ lambda_j = frac(\| P \|_delta + epsilon_j - E, 2) > 0 . $
  Lemma 14, proved in the final subsection of Section 3, gives, separately for each $j$,
    data satisfying the same one-ended strong-decay, constraint and trapping hypotheses, with
  $ E_j = \| P \|_delta + epsilon_j \, wide P_j = P \, wide A_(min \, g_j) \( S \) gt.eq A_(min \, g) \( S \) > 0 . $
  Their ADM vectors are future timelike, so Theorem 3 gives
  $ sqrt(\( \| P \|_delta + epsilon_j \)^2 - \| P \|_delta^2) gt.eq 1 /
    2 (frac(A_(min \, g) \( S \), omega_(n - 1)))^(frac(n - 2, n - 1)) > 0 . $
  The right side is fixed and the left side tends to zero, a contradiction.
    The theorem is applied afresh to each datum; no estimate for its end preparation is required to be uniform
    near the null cone. Thus $E > \| P \|_delta$, and Theorem 3 applies to the original data. ◻
]

The proofs for weak original decay appear in Sections 7 and Section 8.
  Their reductions reach Definition 6 by different means: three-dimensional enclosing areas converge fully,
  whereas the four-dimensional rest replacement gives the one-sided comparison needed by the numerical argument.
  The latter is followed by strictification at fixed replacement radius,
  with that strictification removed before the radius tends to infinity.

== 3 Preparing an end with zero momentum <sec:end>

Put $k = n - 1$ and $p = n - 2 = k - 1$. A radius function $𝜚$ below is smooth and positive on the closed exterior
  and equals the Euclidean radius on a sufficiently distant part of its coordinate end.
  Constants in the end-preparation argument may depend on the original data and on its fixed future-timelike ADM
  vector. In particular, no uniform estimate as $E - \| P \| arrow.b 0$ is asserted.
  The final subsection supplies the positive-shell construction used in Section 2 to prove automatic timelikeness;
  that construction does not assume timelikeness.

The target class is Definition 6. The present task is to reach it while comparing every full cut with an original cut.

#thm([Proposition 3.1.])[
  (Reduction to a prepared exterior).  #emph[Let $\( Omega \, g \, K \)$ be a smooth one-ended exterior as in
    Definition 1, with compact complement of its coordinate end and with
$ g - delta = O_6 \( r^(- q) \) \, wide K = O_5 \( r^(- 1 - q) \) \, wide frac(n - 2, 2) < q < n - 2 . $

 Assume integrable constraint densities satisfying $mu gt.eq \| J \|_g$,
   finite ADM limits satisfying $E > \| P \|$, and $theta_(+) \( S \) lt.eq 0$ on every boundary component.
   Suppose that the full-cut infimum of Definition 2 is $a = A_min^g \( S \) > 0$,
   and put $m = \( E^2 - \| P \|^2 \)^(1 \/ 2)$. There are prepared data $\( g_j \, K_j \)$ on the same exterior,
   with one fixed $beta in \( 0 \, 1 \)$, numbers $epsilon.alt_j arrow.b 0$, and proper diffeomorphisms $Phi_j :
   Omega arrow.r Omega$ equal to the identity near $S$, such that
#[#set math.equation(numbering: n => "(3.1)")
 $ P_j = 0 \, wide E_j arrow.r m \, wide Phi_j^(*) g lt.eq \( 1 + epsilon.alt_j \) g_j \, wide
   A_min^(g_j) \( S \) gt.eq \( 1 + epsilon.alt_j \)^(- k \/ 2) a . $ <eq:end:reduction-limits>]

 The positive constant $c_j$ in Equation (2.1) and the end coordinates may depend on $j$.]
] <prop:end:reduction>

We first match the original energy and momentum with a boosted vacuum end.
  A compact annular correction joins the two ends with a constraint error whose total scale tends to zero.
  Within the vacuum region we then bend the slice to a static one, giving zero momentum.
  A positive conformal factor repairs the small annular error without decreasing the metric.
  A proper radial comparison map protects every full enclosing cut during the change of slice.
  For each already fixed replacement, a second scalar perturbation makes the energy condition and future trapping
  strict while changing the energy by a quantity tending to zero.
  The argument fixes the original boost throughout; it needs no estimates uniform as the ADM vector approaches the
  null cone.

An asymptotic change to a rest frame is also used by Allen, Bryden,
  Kazaras and Khuri in the invariant-mass step of #cite(label("AllenBrydenKazarasKhuri2025")) Section 5.
  Here the end is first replaced by an explicit vacuum model,
  and the proper comparison map in Proposition 9 controls every full cut during the replacement and bending.

=== 3.1 Conformal changes and a vacuum model with matching charges <conformal-changes-and-a-vacuum-model-with-matching-charges>

The conformal identities below explain how a scalar function can improve the constraint inequality and the
  boundary expansion at the same time. We then compute the vacuum model’s charges directly in the ADM
  normalization used here.

For a smooth function $s$ set $g_s = e^(2 s) g$ and $K_s = e^s K$.
  If $\| v \|_g lt.eq 1$, the corresponding vector in the new unit ball is $v_s = e^(- s) v$.
  The conformal connection formula and scalar curvature formula give

#[#set math.equation(numbering: n => "(3.2)")
 $ e^(2 s) #scale(x: 120%, y: 120%)[\(] mu_s + J_s \( v_s \) #scale(x: 120%, y: 120%)[\)] & = mu + J \( v \) -
   k Delta_g s - frac(k p, 2) \| d s \|_g^2 + k K \( nabla s \, v \) \,\
e^s theta_(+ \, s) & = theta_(+) + k partial_nu s . $ <eq:end:conformal>]

Here the normal $nu$ points into the exterior. For completeness, $tau_s = e^(- s) tau$, $\| K_s \|_(g_s)^2 =
  e^(- 2 s) \| K \|_g^2$, and

$ R_(g_s) = e^(- 2 s) #scale(x: 120%, y: 120%)[\(] R_g - 2 k Delta_g s -
  k p \| d s \|_g^2 #scale(x: 120%, y: 120%)[\)] . $

Writing $pi = K - tau g$, contraction of $Gamma \( g_s \)_(i j)^l - Gamma \( g \)_(i j)^l = s_i delta_j^l +
  s_j delta_i^l - g_(i j) s^l$ yields $J_(s \, i) = e^(- s) \( J_i + k K_(i j) nabla^j s \)$.
  The tangential trace of $K$ scales by $e^(- s)$ and $H_s = e^(- s) \( H + k partial_nu s \)$,
  proving both identities. In particular, if $s = 2 p^(- 1) log U$, $U > 0$,
  the entire added term in the first identity is

#[#set math.equation(numbering: n => "(3.3)")
 $ frac(2 k, p U) #scale(x: 120%, y: 120%)[\(] - Delta_g U +
   K \( nabla U \, v \) #scale(x: 120%, y: 120%)[\)] . $ <eq:end:conformal-U>]

#thm([Lemma 3.2.])[
  (Charges of a boosted Schwarzschild–Tangherlini end).  #emph[In the Schwarzschild–Tangherlini spacetime of
    geometric mass $M > 0$, let $b \, y$ be static time and isotropic spatial coordinates. Make the Lorentz change
#[#set math.equation(numbering: n => "(3.4)")
 $ b = gamma \( T + v x^1 \) \, wide y^1 = gamma \( x^1 + v T \) \, wide y^a = x^a med \( 2 lt.eq a lt.eq n \) \,
   wide gamma = \( 1 - v^2 \)^(- 1 \/ 2) \, $ <eq:end:boost-coordinates>]

 where $0 lt.eq v < 1$. The induced data on $T = 0$, oriented by the future normal, have
#[#set math.equation(numbering: n => "(3.5)")
 $ E = gamma M \, wide P_1 = gamma M v \, wide P_a = 0 med \( a > 1 \) . $ <eq:end:boost-charges>]

 The metric and second fundamental form have the homogeneous leading terms computed below,
   with remainders $O_d \( r^(- 2 p) \)$ and $O_d \( r^(- 2 p - 1) \)$, respectively,
   for every fixed derivative order $d$.]
] <lem:end:boost>

#proof[
  The exact isotropic metric is
  $ - (frac(1 - M \/ \( 2 \| y \|^p \), 1 + M \/ \( 2 \| y \|^p \)))^2 d b^2 +
    (1 + frac(M, 2 \| y \|^p))^(4 \/ p) \| d y \|^2 . $
  Its leading perturbation of Minkowski space is $2 M \| y \|^(- p) \( d b^2 + p^(- 1) \| d y \|^2 \)$. On $T = 0$ put
  $ rho^2 = gamma^2 \( x^1 \)^2 + sum_(a = 2)^n \( x^a \)^2 \, wide f = rho^(- p) \, wide A =
    gamma^2 \( v^2 + p^(- 1) \) \, quad B = p^(- 1) \, quad C = k p^(- 1) gamma^2 v . $
  The nonzero relevant leading components of the spacetime perturbation $sans(H)$ are $sans(H)_11 = 2 M A f$,
    $sans(H)_(a a) = 2 M B f$, and $sans(H)_01 = 2 M C f$. Moreover
  $ partial_1 f = - p gamma^2 x^1 rho^(- n) \, wide partial_a f = - p x^a rho^(- n) \, wide partial_T f = -
    p gamma^2 v x^1 rho^(- n) . $
  Thus the energy flux vector $Q_i = partial_j sans(H)_(i j) - partial_i sans(H)_(j j)$ satisfies
  $ Q_1 = - 2 M k B partial_1 f = 2 M k gamma^2 x^1 rho^(- n) \, wide Q_a = - 2 M \( A + p B \) partial_a f =
    2 M p \( A + 1 \) x^a rho^(- n) . $
  Since $p \( A + 1 \) = k gamma^2$, these expressions give the pointwise identity
  #[#set math.equation(numbering: n => "(3.6)")
   $ Q_i = 2 M k gamma^2 x_i rho^(- n) . $ <eq:end:boost-energy-vector>]
  The chosen sign of the second fundamental form gives, to first order,
  $ K_(i j) = 1 / 2 #scale(x: 120%, y: 120%)[\(] partial_T sans(H)_(i j) - partial_i sans(H)_(0 j) -
    partial_j sans(H)_(0 i) #scale(x: 120%, y: 120%)[\)] . $
  Direct substitution gives
  $ K_11 & = M gamma^4 v \( 2 p + 1 - p v^2 \) x^1 rho^(- n) \, & K_(a a) & = - M gamma^2 v x^1 rho^(- n) \,\
K_(1 a) & = M k gamma^2 v x^a rho^(- n) \, & K_(a b) & = 0 quad \( a eq.not b \) . $
  Their Euclidean trace is $M gamma^4 v \( p + v^2 \) x^1 rho^(- n)$.
    Consequently, for the leading Euclidean trace reversal $pi_(i j) = K_(i j) - \( "tr"_delta K \) delta_(i j)$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ pi_(1 j) = M k gamma^2 v x_j rho^(- n) \, wide pi_(a 1) = M k gamma^2 v x^a rho^(- n) \, wide pi_(a b) = -
     M k gamma^4 v x^1 rho^(- n) delta_(a b) . $ <eq:end:boost-momentum-tensor>]
  Using the exact normal and the exact metric in the trace reversal changes these formulas by
    $O_d \( r^(- 2 p - 1) \)$. The energy remainder has first derivatives of this same order.
    Their sphere integrals are $O \( r^(- p) \)$, and therefore vanish for every $n gt.eq 3$.
  The ellipsoid ${ \| "diag" \( gamma \, 1 \, dots.h \, 1 \) x \| < 1 }$ has volume $omega \/ \( n gamma \)$.
    Polar integration therefore gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ integral_(S^(n - 1)) \| "diag" \( gamma \, 1 \, dots.h \, 1 \) theta \|^(- n) thin d theta = omega /
     gamma . $ <eq:end:ellipsoid-integral>]
  Equations (3.6) and (3.7), divided by $2 k omega$ and $k omega$, give $E = M gamma$ and $P_1 = M gamma v$.
    The integrand of a transverse momentum row is a constant times $x^1 x^a rho^(- n) \/ r$,
    whose integral vanishes by reflection. ◻
]

For the original charges we now fix $M = m$, $v = \| P \| \/ E$,
  and rotate the first axis to the direction of $P$ when $P eq.not 0$.
  Lemma 10 gives a model end $\( g^(upright(b)) \, K^(upright(b)) \)$ with exactly the same charges.
  The parameter $v$ is fixed in all limits that follow.

=== 3.2 Joining the original and model ends <joining-the-original-and-model-ends>

A direct cutoff need not preserve the dominant energy condition.
  Our immediate task is to remove its leading constraint error by compactly supported corrections.
  The obstructions to a compact correction are finitely many moments.
  Charge matching removes their constant limits, and integrability makes the remaining first moments small enough
  after rescaling.

Localized constraint deformation and the finite-dimensional obstruction from the adjoint kernel are central to the
  gluing methods of Corvino–Schoen #cite(label("CorvinoSchoen2006")) and Chruściel–Delay
  #cite(label("ChruscielDelay2003")). We use this methodological starting point,
  not an imported rest-end replacement theorem: the present data need not be vacuum, no parity is imposed,
  and both the energy inequality and every full enclosing cut must survive the replacement.

We give the compact correction explicitly because neither parity conditions nor convergence of center of mass or
  angular momentum is assumed. On Euclidean tensors define

$ sans(S) \( h \) = partial_i partial_j \( h_(i j) - \( "tr"_delta h \) delta_(i j) \) \, wide sans(D) \( b \)_i =
  partial_j \( b_(i j) - \( "tr"_delta b \) delta_(i j) \) . $

Their formal adjoint kernels relevant to compact support are, respectively,
  affine scalar functions and Euclidean Killing fields.

#thm([Lemma 3.3.])[
  (Compact right inverses).  #emph[Let $cal(A) subset bb(R)^n$ be a bounded connected Euclidean annulus and fix a
    compact subset of its interior. Smooth scalar sources supported in that subset with zero constant and first
    moments have smooth symmetric solutions of $sans(S) \( h \) =
    f$ supported in a larger fixed compact subset of $cal(A)$.
    Smooth vector sources with zero integrals against every Euclidean Killing field have similarly supported
    symmetric solutions of $sans(D) \( b \) = F$. For $1 < a < oo$ and integers $d gt.eq 0$,
    these solutions may be chosen linearly with estimates
$ parallel h parallel_(W^(d + 2 \, a)) lt.eq C_(d \, a) parallel f parallel_(W^(d \, a)) \, wide
  parallel b parallel_(W^(d + 1 \, a)) lt.eq C_(d \, a) parallel F parallel_(W^(d \, a)) . $

 For arbitrary sources the same conclusions hold after subtracting fixed smooth moment bumps,
   whose coefficients are bounded by the absolute values of the respective moments.]
] <lem:end:compact-inverses>

#proof[
  We use the compact scalar divergence inverse on a connected open set:
    a mean-zero smooth function supported in a fixed compact set has a compactly supported vector primitive,
    with one Sobolev derivative gained; the support and Sobolev mapping statements are given, for example,
    by the regularized Bogovskii operator in #cite(label("CostabelMcIntosh2010")) Section 3.1, Equation (3.13),
    Theorem 3.2, Corollaries 3.3–3.4, Remark 3.5, and Proposition 4.1(ii).
    Here is its local construction and the support issue. On a ball,
    choose a smooth unit-integral function supported in a smaller concentric ball and use the Bogovskii integral
  $ \( cal(B) f \) \( x \) = integral f \( y \) \( x - y \) integral_1^oo eta \( y + t \( x - y \) \) t^(n - 1)
    thin d t thin d y . $
  Differentiation in distributions gives $"div" cal(B) f = f - eta integral f = f$;
    the segments occurring in the integral remain in the ball.
    For compact input support and compact $"supp" eta$, their union is compact in that ball.
    The kernel is of order $1 - n$, and its differentiated kernel has the cancellation of a Calderon–Zygmund
    kernel. The resulting $W^(d \, a)$ estimate is the usual boundedness of that singular integral and its
    commutators with derivatives. Cover the prescribed support by finitely many balls compact in $cal(A)$,
    connect them by a finite chain of overlapping such balls, and use a partition of unity.
    Transfer the means along the chain using unit-integral bumps in the overlaps.
    Each resulting ball source has mean zero; the sum of its ball primitives proves the stated inverse on
    $cal(A)$, with fixed support and constants.
  Apply it first to a scalar $f$ with its affine moments zero, obtaining $partial_i v_i = f$.
    Compact support gives $integral v_i = - integral z_i f = 0$.
    Apply the same inverse to each $v_i$ to obtain $partial_j T_(i j) = v_i$.
    Then $Q = \( T + T^(sans(t)) \) \/ 2$ has $partial_i partial_j Q_(i j) = f$.
    The tensor $h = Q - k^(- 1) \( "tr"_delta Q \) delta$ has trace reversal $Q$, so $sans(S) \( h \) =
    f$ with the asserted two-derivative gain.
  For a vector source $F$, first solve $partial_j B_(i j) = F_i$ row by row.
    Translation moments permit this solve. Rotation moments give
  $ 0 = integral \( z_i F_j - z_j F_i \) = integral \( B_(i j) - B_(j i) \) . $
  Put $A_(i j) = \( B_(i j) - B_(j i) \) \/ 2$ and solve $partial_l D_(i j l) = - A_(i j)$,
    choosing $D_(i j l) = - D_(j i l)$. Set
  $ E_(i j) = partial_l \( D_(i j l) - D_(i l j) - D_(j l i) \) \, wide C_(i j) = B_(i j) + E_(i j) . $
  Index interchange gives $E_(i j) - E_(j i) = - 2 A_(i j)$ and $partial_j E_(i j) = 0$:
    the first two double derivatives cancel after interchanging $j \, l$,
    and the last vanishes by skew symmetry in those indices. Thus $C$ is symmetric and $partial_j C_(i j) = F_i$.
    Taking $b = C - k^(- 1) \( "tr"_delta C \) delta$ proves the assertion, including the derivative count.
  Finally take a nonnegative smooth bump supported in an open ball of $cal(A)$.
    The Gram matrix of the affine functions, or of the vector Killing fields,
    with this weight is positive definite: a polynomial in either finite-dimensional space vanishing on that ball
    vanishes identically. Multiplying the basis elements by the bump and the inverse Gram matrix produces fixed
    dual moment bumps. Subtraction removes all moments with the stated bound on coefficients. ◻
]

The preceding inverses reduce the joining problem to estimates for the moments that they cannot remove.
  We apply them on the fixed annulus $cal(A) = { z in bb(R)^n : 1 < \| z \| < 4 }$.
  Choose a smooth cutoff $0 lt.eq chi lt.eq 1$, equal to one near its inner sphere and zero near its outer sphere.
  For $L$ large put $chi_L \( x \) = chi \( x \/ L \)$ on $cal(A)_L = { L < \| x \| < 4 L }$.
  The following observation explains why no center-of-mass or angular-momentum limit is required.

#thm([Lemma 3.4.])[
  (Sublinear first moments).  #emph[Let $h = g - delta$, $h^(upright(b)) = g^(upright(b)) - delta$, and $b = K$,
    $b^(upright(b)) = K^(upright(b))$ on their common coordinate tail.
    Put $H = h - h^(upright(b))$ and $B = b - b^(upright(b))$. Define the scalar and vector commutators on $cal(A)_L$ by
$ C_L = sans(S) \( chi_L H \) - chi_L sans(S) \( H \) \, wide F_L = sans(D) \( chi_L B \) - chi_L sans(D) \( B \) \, $

 and their rescaled versions on $cal(A)$ by
$ hat(C)_L \( z \) = L^2 C_L \( L z \) \, wide hat(F)_L \( z \) = L^2 F_L \( L z \) . $

 The flat sources $sans(S) \( H \)$ and $sans(D) \( B \)$ are integrable.
   For every fixed affine scalar function $a \( z \)$ and every fixed Euclidean Killing field $Y \( z \)$,
$ integral_(cal(A)) a hat(C)_L thin d z = o \( L^(2 - n) \) \, wide
  integral_(cal(A)) Y^i hat(F)_(L \, i) thin d z = o \( L^(2 - n) \) . $

]
] <lem:end:moments>

#proof[
  Expansion of the constraint formulas about $\( delta \, 0 \)$ gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ sans(S) \( h \) = 2 mu + O \( r^(- 2 q - 2) \) \, wide sans(D) \( K \) = J +
     O \( r^(- 2 q - 2) \) . $ <eq:end:flat-remainders>]
  The remainder estimates follow, respectively, from $h D^2 h$, $\( D h \)^2$, and $K^2$,
    and from $h D K$ and $D h thin K$. The volume densities of $g$ and $delta$ are uniformly comparable on the
    tail. Hence integrability of $mu \, J$, together with $2 q > n - 2$, gives the claim for the original data.
    The model is vacuum with faster decay, so its flat sources are integrable too.
  For any integrable tail function $f$, even without an integrable first absolute moment,
  #[#set math.equation(numbering: n => "(3.10)")
   $ integral_(R_0 < r < 4 L) r \| f \| thin d x = o \( L \) . $ <eq:end:sublinear-moment>]
  Indeed divide by $L$ and split at a fixed large radius $R_1$.
    The inner integral divided by $L$ tends to zero, whereas the outer integral divided by $L$ is at most $4
    integral_(r > R_1) \| f \|$, which tends to zero as $R_1 arrow.r oo$.
  Write $Q = H - \( "tr"_delta H \) delta$. For an affine function $a \( x \)$ define its Green flux by
  $ cal(B)_a \( R \) = integral_(S_R) #scale(x: 120%, y: 120%)[\(] a thin partial_j Q_(i j)
    nu_delta^i - \( partial_i a \) Q_(i j) nu_delta^j #scale(x: 120%, y: 120%)[\)] thin d A_delta . $
  Integration by parts between spheres yields $cal(B)_a \( R \) - cal(B)_a \( R_0 \) =
    integral_(R_0 < r < R) a thin sans(S) \( H \)$. Charge matching gives $cal(B)_1 \( R \) arrow.r 0$,
    and Equation (3.10) gives $cal(B)_(x^a) \( R \) = o \( R \)$.
    For the scalar commutator $C_L$, supported where the cutoff varies, one consequently has
  #[#set math.equation(numbering: n => "(3.11)")
   $ integral_(L < r < 4 L) a C_L = - cal(B)_a \( L \) - integral_(L < r < 4 L) chi_L a thin sans(S) \( H \) .
     $ <eq:end:commutator-moment>]
  This is $o \( 1 \)$ for $a = 1$ and $o \( L \)$ for $a = x^a$.
  For momentum put $Q_(i j) = \( K - K^(upright(b)) \)_(i j) - "tr"_delta \( K - K^(upright(b)) \) delta_(i j)$.
    For a Euclidean Killing field $Y$, symmetry of $Q$ gives $Q_(i j) partial_j Y_i = 0$.
    Its Green flux is thus simply $integral_(S_R) Y_i Q_(i j) nu_delta^j$.
    For constant $Y$ its limit is zero by equality of the momenta;
    replacing geometric trace reversal by Euclidean trace reversal changes the sphere flux by
    $O \( R^(n - 2 - 2 q) \) arrow.r 0$. For rotational $Y$ the same Green identity and Equation (3.10) give
    $o \( R \)$. Equation (3.11) holds for $F_L$ with this flux and pairing.
  Under $x = L z$ the fields are $h \( L z \)$ and $L K \( L z \)$, and both flat sources are multiplied by $L^2$.
    A constant moment is therefore multiplied by $L^(2 - n)$ and a first moment by $L^(1 - n)$.
    The preceding $o \( 1 \)$ and $o \( L \)$ bounds prove the same $o \( L^(2 - n) \)$ bound for all rescaled
    moments. ◻
]

We now apply these two lemmas to the actual joining problem.
  Under $x = L z$, interpolate the scaled fields on $cal(A)$ between the original and model fields using $chi$.
  The errors in $\( 2 mu \, J \)$ relative to the cutoff interpolation of the exact constraint densities equal
  $hat(C)_L$ and $hat(F)_L$, respectively, plus $O \( L^(- 2 q) \)$ in scaled units.
  The commutators are supported in the fixed compact subset where the cutoff varies.
  By Lemma 11 subtract compact corrections that cancel these commutators after their moment bumps have been
  removed. The commutators have $W^(1 \, a)$ norm $O \( L^(- q) \)$, for any fixed $a > n$,
  because the available asymptotic derivatives include those of order three for $g$ and two for $K$.
  Sobolev embedding in dimension $n$ therefore gives corrections of size $O \( L^(- q) \)$ in $C^(2 \, alpha)$ for
  the scaled metric and in $C^(1 \, alpha)$ for the scaled second fundamental form, where $0 < alpha < 1 - n \/ a$.

These are smooth compact corrections; only their first few norms need be bounded uniformly in $L$.
  Their nonlinear contribution is still $O \( L^(- 2 q) \)$.
  The fixed smooth moment bumps contribute $o \( L^(2 - n) \)$ by Lemma 12.
  Thus, returning to physical units, the new data $\( tilde(g)_L \, tilde(K)_L \)$ agree with the original for $r
  lt.eq L$ and with the model for $r gt.eq 4 L$, and satisfy

#[#set math.equation(numbering: n => "(3.12)")
 $ tilde(mu)_L - \| tilde(J)_L \|_(tilde(g)_L) gt.eq - d_L L^(- n) thin upright(bold(1))_({ L < r < 4 L }) \, wide
   d_L arrow.r 0 . $ <eq:end:deficit>]

To check the unit balls in this assertion, the interpolated metric, the original metric,
  and $delta$ differ by $O \( L^(- q) \)$. The scaled original $J$ is $O \( L^(- q) \)$.
  Transporting a unit vector between these balls thus changes its pairing with the interpolated $J$ by
  $O \( L^(- 2 q) \)$. The cutoff is between zero and one, so the original DEC and the vacuum model give the
  claimed sign after precisely the errors already estimated.

=== 3.3 Changing the vacuum slice and repairing the constraints <changing-the-vacuum-slice-and-repairing-the-constraints>

We have joined the original data to a vacuum end with matching charges.
  The only possible failure of the dominant energy condition has the small bound in Equation (3.12).
  The next step removes the momentum by changing the slice entirely within that vacuum end;
  it therefore creates no further constraint error.

In the model coordinates, $T = 0$ is the graph $b = v y^1$.
  Choose a smooth cutoff $zeta$ equal to one initially and zero finally, with

$ lr(|frac(d zeta, d log \| y \|)|) lt.eq eta_v \, wide v \( 1 + eta_v \) < 1 . $

This can be done by taking a sufficiently long, but fixed, interval in $log \( \| y \| \/ L \)$.
  Start it outside $\| y \| = 4 gamma L$, where the joined data are exactly the model.
  Replace the graph by $b = v y^1 zeta \( log \( \| y \| \/ L \) \)$ there.
  Its Euclidean slope is at most $v \( 1 + eta_v \) < 1$; the Schwarzschild coefficients tend uniformly to their
  flat values on the transition as $L arrow.r oo$. Thus this is a smooth spacelike hypersurface for large $L$,
  and its induced data are exactly vacuum throughout the bending region.
  They agree with $b = 0$ beyond $\| y \| = C_v L$, for a fixed $C_v$. For $v = 0$ no bending is necessary.

Use $y = "diag" \( gamma \, 1 \, dots.h \, 1 \) x$ to parametrize the whole construction outside the unchanged
  core. The resulting metric and second fundamental form, denoted $\( macron(g)_L \, macron(K)_L \)$, satisfy,
  in this region,

#[#set math.equation(numbering: n => "(3.13)")
 $ c_v delta lt.eq macron(g)_L lt.eq C'_v delta \, wide \| D macron(g)_L \| + \| macron(K)_L \| lt.eq
   C'_v \/ r . $ <eq:end:bending-bounds>]

On the joining annulus the stronger small perturbation estimates hold;
  in the bending region these bounds follow by differentiating the graph and its normal.
  The tensor $macron(K)_L$ is compactly supported, and the only possible DEC deficit is Equation (3.12).

The slice is now static near infinity and its second fundamental form has compact support.
  It remains to repair the annular deficit. By Equation (3.3),
  it is enough to build a positive function whose negative Laplacian dominates the drift $\| macron(K)_L \|
  thin \| d U_L \|$ and the deficit. The function must be constant on the original core,
  so the boundary expansion keeps its sign.

We construct a nonnegative radial function $f_L \( s \)$, $s = \| y \| \/ L$,
  with bounded derivatives on every fixed transition interval, so that

#[#set math.equation(numbering: n => "(3.14)")
 $ U_L = 1 + e_L L^(- p) f_L \( \| y \| \/ L \) \, wide e_L arrow.b 0 \, $ <eq:end:repair-factor>]

repairs that deficit. Choose a smooth nonnegative $chi_(*)$ equal to one on the radial interval containing the
  full joining annulus and supported in a slightly larger interval. Begin before that interval with $z_L = 0$, and solve

$ z'_L = C_(*) z_L + chi_(*) \, wide z_L = - f'_L . $

Continue this equation through the bending interval. The interval and $C_(*)$ are fixed for the chosen boost.
  Thus $z_L$ and its derivatives are bounded independently of large $L$.
  The radial function has $\| d s \|_(macron(g)_L)^2 gt.eq c L^(- 2)$, $\| Delta_(macron(g)_L) s \| lt.eq
  C L^(- 2)$, and $\| macron(K)_L \| \| d s \|_(macron(g)_L) lt.eq C L^(- 2)$ there, by Equation (3.13). Consequently

#[#set math.equation(numbering: n => "(3.15)")
 $ - Delta_(macron(g)_L) U_L - \| macron(K)_L \| thin \| d U_L \|_(macron(g)_L) & =
   e_L L^(- p) #scale(x: 120%, y: 120%)[\(] z'_L \| d s \|^2 +
   z_L Delta s - \| macron(K)_L \| z_L \| d s \| #scale(x: 120%, y: 120%)[\)]\
 & gt.eq c' e_L L^(- n) chi_(*) $ <eq:end:repair-sign>]

when $C_(*)$ is sufficiently large. Where $z_L = 0$ the factor is constant,
  so no condition is needed on the original compact part.

This construction supplies the required sign through the joining and bending regions.
  To control the ADM charge, we continue it into the static tail using its radial flux.

There remains a tail extension of $z_L$. In the exact static part set $a_L \( s \) = 1 +
  M \/ \( 2 \( L s \)^p \)$. The radial flux factor is

$ q_L \( s \) = s^k a_L \( s \)^2 z_L \( s \) . $

The equation just used makes $q'_L > 0$ at the beginning of this static part,
  after increasing $C_(*)$ if necessary. Extend $q_L$ smoothly so that it stays nondecreasing and is ultimately a
  positive constant $q_(L \, oo)$. For example, continue its positive derivative over a short interval and then
  multiply that derivative by a smooth cutoff that becomes zero.
  This preserves the previous function on an overlap, and all resulting constants remain bounded independently of
  large $L$. Define $z_L = q_L \/ \( s^k a_L^2 \)$ afterwards and $f_L \( s \) =
  integral_s^oo z_L \( t \) thin d t$ everywhere. Then $f_L gt.eq 0$, is constant before the transition,
  and has a finite value there. The static radial Laplacian satisfies

$ Delta_(macron(g)_L) f_L = - L^(- 2) a_L^(- 2 n \/ p) s^(- k) q'_L \( s \) lt.eq 0 . $

It is zero on the ultimate tail, where $macron(K)_L = 0$.

Take $e_L arrow.r 0$ sufficiently slowly that $d_L \/ e_L arrow.r 0$. Apply the conformal change

$ g_L^(*) = U_L^(4 \/ p) macron(g)_L \, wide K_L^(*) = U_L^(2 \/ p) macron(K)_L . $

Equations (3.3), (3.12), and (3.15) prove DEC everywhere for all sufficiently large $L$.
  Since $U_L$ is constant on the original core, the future boundary expansion keeps its weak sign.
  Moreover $U_L gt.eq 1$, so this repair increases the metric as a quadratic form.

On the static tail, $f_L \( s \) = q_(L \, oo) p^(- 1) s^(- p) + O \( L^(- p) s^(- 2 p) \)$.
  It follows that the coefficient of $\| y \|^(- p)$ in $U_L - 1$ is $e_L q_(L \, oo) \/ p$.
  Computed in the asymptotically Euclidean rest coordinates $y$, the energy is

#[#set math.equation(numbering: n => "(3.16)")
 $ E_L^(*) = M + frac(2 e_L q_(L \, oo), p) = M + o \( 1 \) \, wide P_L^(*) = 0 . $ <eq:end:repair-energy>]

One can also see the exact normalization without an expansion:
  on this tail $a_L U_L$ is a radial Euclidean harmonic function with limit one,
  because $a_L^(4 \/ p) delta$ is scalar flat and $U_L$ is harmonic for that metric.
  Thus the ultimate metric is exactly an isotropic Schwarzschild metric with the mass in Equation (3.16).
  The new constraints are integrable, since the repair source is compactly supported and the ultimate end is vacuum.

=== 3.4 Comparing every full enclosing cut <comparing-every-full-enclosing-cut>

We have obtained zero momentum, energy tending to $m$, and the dominant energy condition.
  The numerical transfer also requires a lower bound for the infimum over #emph[all] full cuts.
  The metric need not approach the original metric uniformly on the whole end during the change of slice.
  The following comparison supplies what is needed for all enclosing areas.
  In the original $x$ coordinates the metrics $g_L^(*)$ have a uniform lower bound $c_0
  delta$ throughout the region $r gt.eq L$, where $c_0 > 0$ depends on the fixed boost.
  Choose a fixed $0 < lambda < 1$ with $lambda^2 < c_0 \/ 2$.

Let $h_L : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ be smooth and increasing, equal to $r$ for $r lt.eq sqrt(L)$,
  with $lambda lt.eq h'_L lt.eq 1$, and with $h'_L = lambda$ for $r gt.eq 2 sqrt(L)$.
  Set $Phi_L \( r theta \) = h_L \( r \) theta$ on the end, and extend by the identity on the core.
  The derivative eigenvalues in the Euclidean radial and tangential directions are $h'_L$ and $h_L \/ r$,
  respectively. They are at most one; for $r gt.eq L$ they are at most $lambda + O \( L^(- 1 \/ 2) \)$,
  since $h_L \( r \) = lambda r + O \( sqrt(L) \)$. Also $h_L arrow.r oo$,
  so $Phi_L$ is a proper diffeomorphism of the entire exterior onto itself.

For $r lt.eq sqrt(L)$ the map is the identity and $g_L^(*) gt.eq g$.
  For $sqrt(L) lt.eq r lt.eq L$, both $g$ at $x$ and $g$ at $Phi_L \( x \)$ equal $delta + o \( 1 \)$ uniformly,
  and $g_L^(*)$ is a conformal multiple, at least one, of $g$.
  The derivative bound therefore gives $Phi_L^(*) g lt.eq \( 1 + o \( 1 \) \) g_L^(*)$ there.
  For $r gt.eq L$ one instead has

$ Phi_L^(*) g lt.eq \( lambda^2 + o \( 1 \) \) delta lt.eq g_L^(*) . $

Combining the regions proves

#[#set math.equation(numbering: n => "(3.17)")
 $ Phi_L^(*) g lt.eq \( 1 + o \( 1 \) \) g_L^(*) . $ <eq:end:compression>]

If $Gamma = partial D$ is any full enclosing cut for $g_L^(*)$, then $Phi_L \( D \)$ is connected, closed,
  has interior in $"int" Omega$, and contains the entire distant end.
  Its full intrinsic boundary is $Phi_L \( Gamma \)$, including every component and every portion on $S$.
  Restricting Equation (3.17) to each $k$-dimensional tangent plane and taking determinants gives

#[#set math.equation(numbering: n => "(3.18)")
 $ "Area"_(g_L^(*)) \( Gamma \) gt.eq \( 1 + o \( 1 \) \)^(- k \/ 2) "Area"_g \( Phi_L \( Gamma \) \)
   gt.eq \( 1 - o \( 1 \) \) a . $ <eq:end:all-cut-comparison>]

Taking an infimum uses no existence or regularity of a minimizing cut.

=== 3.5 A strict scalar perturbation <a-strict-scalar-perturbation>

The use of a spacetime Poisson equation for conformal strictification has a direct precedent in Jaracz’s
  three-dimensional construction #cite(label("Jaracz2025StrictDEC")) Theorem 1.1 and Section 3.1,
  preprint version 1. The conformal scaling below is its dimension-dependent counterpart.
  Here a negative inner normal derivative also makes trapping strict; the smoothed drift, prescribed decay,
  and charge and full-cut estimates are established for the present exterior class.

At this stage the inequalities may still be non-strict. We solve a scalar equation with positive source and
  negative inner normal derivative. The source gives a quantitative strict energy margin;
  the normal derivative makes the future expansion strictly negative.
  We state the equation on the original decay class as well as on a static tail,
  so the resulting scalar perturbation is available independently of the preceding replacement.

#thm([Lemma 3.5.])[
  (Strictification).  #emph[Let $Omega$ be a smooth connected exterior,
    complete with its nonempty compact smooth boundary $S$ included,
    and with exactly one Euclidean coordinate end outside a compact set.
    Let $\( g \, K \)$ be smooth up to $S$, with $g - delta = O_6 \( r^(- q) \)$ and $K =
    O_5 \( r^(- 1 - q) \)$ for some $q > \( n - 2 \) \/ 2$. Choose $0 < beta <
    min \( 1 \, q \)$ and a smooth nonnegative function $B gt.eq \| K \|_g$ with $B = O_5 \( r^(- 1 - q) \)$.
    Then the problem
#[#set math.equation(numbering: n => "(3.19)")
 $ - Delta_g phi.alt = B sqrt(\| d phi.alt \|_g^2 + 𝜚^(- 2 k)) + 𝜚^(- n - beta) \, wide partial_nu phi.alt = -
   1 upright(" on ") S \, wide phi.alt arrow.r 0 upright(" at infinity") $ <eq:end:strict-pde>]

 has a smooth positive solution, unique among decaying smooth solutions. It satisfies
#[#set math.equation(numbering: n => "(3.20)")
 $ phi.alt = O_6 \( r^(2 - n) \) \, wide frac(- Delta_g phi.alt, r^(- n - beta)) arrow.r 1 \,\
frak(f)_phi.alt := lim_(R arrow.r oo) integral_(S_R) partial_(nu_g) phi.alt thin d A_g\
= - "Area"_g \( S \) - integral_Omega #scale(x: 120%, y: 120%)[\(] B sqrt(\| d phi.alt \|^2 + 𝜚^(- 2 k)) + 𝜚^(- n - beta) #scale(x: 120%, y: 120%)[\)] thin d V_g < 0 . $ <eq:end:strict-estimates>]

 If $K$ is compactly supported, $B$ may be chosen compactly supported.
   If in addition $g - delta = O_d \( r^(2 - n) \)$ for all $d$,
   the solution has this decay through every derivative order.]
  #emph[Suppose also that the ADM limits of $\( g \, K \)$ exist and are finite, that the data satisfy DEC,
    and that $theta_(+) \( S \) lt.eq 0$ on every boundary component. For all sufficiently small $delta > 0$,
$ g_delta = e^(2 delta phi.alt) g \, wide K_delta = e^(delta phi.alt) K $

 satisfy
#[#set math.equation(numbering: n => "(3.21)")
 $ mu_delta - \| J_delta \|_(g_delta) gt.eq c_delta 𝜚^(- n - beta) \, wide theta_(+ \, delta) < 0 \, wide
   E_delta = E - delta / omega frak(f)_phi.alt \, wide P_delta = P . $ <eq:end:strict-margin>]

 Here $g_delta gt.eq g$, and their ratio tends uniformly to one as $delta arrow.b 0$.]
] <lem:end:strict>

#proof[
  #emph[1. Continuation on a truncation.] Write $a = 𝜚^(- k)$ and $b = 𝜚^(- n - beta)$.
    The positive regularizing term $a^2$ makes the right side smooth as a function of $d phi.alt$,
    with first gradient derivative of norm at most $B$. Choose a large coordinate sphere enclosing $S$ and a
    compact core. On a larger truncation $Omega_R$ impose $phi.alt = 0$ on $S_R$,
    and multiply $B$ in the equation by $t in \[ 0 \, 1 \]$. The inner Neumann and outer Dirichlet boundary
    components are disjoint smooth hypersurfaces.
  At $t = 0$ this mixed Laplace problem is solvable. Indeed its weak formulation is coercive on $H^1$ functions of
    zero outer trace by Poincare’s inequality; the Neumann datum is a bounded boundary functional by the trace
    theorem. Lax–Milgram gives the weak solution and local boundary regularity gives a smooth solution.
    The linearization at any solution for $0 lt.eq t lt.eq 1$ is
  $ - Delta_g u - t B frac(chevron.l d phi.alt \, d u chevron.r_g, sqrt(\| d phi.alt \|^2 + a^2)) \, wide
    partial_nu u = 0 upright(" on ") S \, quad u = 0 upright(" on ") S_R . $
  It has a bounded drift, is uniformly elliptic, and has no zeroth order term.
    Its homogeneous kernel is zero by the strong maximum principle and the Hopf boundary lemma:
    a nonzero maximum or minimum cannot occur in the interior or on a zero-Neumann component
    #cite(label("GilbargTrudinger")) Chapter 3. The same conclusion follows for weak limits with merely bounded
    drift. The drift is a compact perturbation of the mixed Laplace isomorphism in Hölder spaces,
    so its index is zero and this injectivity gives surjectivity.
    The implicit function theorem gives openness of the continuation set.
  #emph[2. Bounds independent of the truncation.] We detail the estimates giving closedness and exhaustion.
    All solutions are nonnegative. An interior negative minimum contradicts $- Delta phi.alt > 0$.
    At a minimum on $S$ the Hopf lemma requires a negative outward derivative,
    whereas the outward derivative of $Omega_R$ is $- partial_nu phi.alt = 1$. The outer boundary value is zero.
  For $0 < alpha < min \( beta \, q \)$ and sufficiently large $r_0$, the function
  $ W \( r \) = r^(- p) #scale(x: 120%, y: 120%)[\(] 1 - r^(- alpha) #scale(x: 120%, y: 120%)[\)] \, wide r gt.eq
    r_0 \, $
  is positive and satisfies
  #[#set math.equation(numbering: n => "(3.22)")
   $ - Delta_g W - B \| d W \|_g gt.eq c r^(- n - alpha) . $ <eq:end:strict-barrier>]
  In fact $- Delta_delta W = alpha \( p + alpha \) r^(- n - alpha)$, the metric error is $O \( r^(- n - q) \)$,
    and $B \| d W \| = O \( r^(- n - q) \)$. Since $b + B a = O \( r^(- n - beta) \)$,
    a sufficiently large multiple $C \( A + 1 \) W$, where $A = sup_(S_(r_0)) phi.alt$,
    is a supersolution outside $r_0$, dominates $phi.alt$ on $S_(r_0)$, and is nonnegative on $S_R$.
    Here we used $sqrt(\| d phi.alt \|^2 + a^2) lt.eq \| d phi.alt \| +
    a$ and the fact that this gradient dependence is Lipschitz.
    Subtracting a supersolution therefore gives a scalar linear inequality with bounded drift,
    to which comparison applies. Hence
  #[#set math.equation(numbering: n => "(3.23)")
   $ 0 lt.eq phi.alt \( x \) lt.eq C \( 1 + A \) r^(- p) quad \( r_0 lt.eq r lt.eq R \) \, $ <eq:end:strict-tail-bound>]
  uniformly in $R$ and $t$.
  We claim that the suprema of all these solutions are uniformly bounded.
    Otherwise divide a sequence by its suprema $M_i arrow.r oo$.
    Estimate (3.23) ensures that the normalized functions have a positive supremum on a fixed compact region.
    Local $W^(2 \, a_0)$ estimates, for any fixed $a_0 > n$, apply uniformly,
    including the inner Neumann boundary: the equation has right side bounded by a fixed multiple of $\| d
    phi.alt \| + 1$, and first derivative interpolation absorbs the gradient term in the second derivative
    estimate. The same argument applies after division by $M_i$.
    Compactness gives a nonnegative, nonzero limit $u$ with $u arrow.r 0$ at infinity and
  $ - Delta_g u = t_(*) B \| d u \| \, wide partial_nu u = 0 . $
  If the outer radii instead have a finite limit, the limit has zero data at that limiting sphere.
    In either case its positive maximum is attained. The strong maximum principle, or the Hopf lemma at $S$,
    contradicts that maximum. These principles apply because $B \| d
    u \|$ equals a bounded measurable drift paired with $d u$, defining that drift to be zero where $d u = 0$.
    This proves the uniform supremum estimate.
  #emph[3. Exhaustion and uniqueness.] The $W^(2 \, a_0)$ estimates now give uniform $C^(1 \, gamma)$ bounds on
    fixed patches. Their right sides are then Hölder continuous,
    and the scalar Schauder estimates give $C^(2 \, gamma)$ bounds.
    Differentiation and the strictly positive regularizer $a$ give all higher local bounds.
    For each fixed truncation these estimates close continuation to $t = 1$.
    Letting $R arrow.r oo$ gives a smooth solution of Equation (3.19); the tail bound gives the specified limit.
    It is strictly positive by the same minimum principle. The difference of two decaying solutions has zero
    Neumann data and solves a homogeneous equation with bounded drift,
    by integrating the gradient derivative of the square root along the segment between their gradients.
    Its positive and negative extrema are excluded as above, proving uniqueness.
  #emph[4. End decay and flux.] On dyadic end annuli rescale $x = L z$ and $Phi \( z \) = L^p phi.alt \( L z \)$.
    Estimate (3.23) bounds $Phi$. The rescaled equation has uniformly controlled metric coefficients and the form
  $ - Delta_(g \( L z \)) Phi = O_5 \( L^(- q) \) sqrt(\| d Phi \|_(g \( L z \))^2 + \| z \|^(- 2 k)) +
    L^(- beta) \| z \|^(- n - beta) \, $
  where the coefficient denoted $O_5 \( L^(- q) \)$ is nonnegative and smooth.
    The same interpolation, scalar estimates and differentiation give uniform bounds for six derivatives of $Phi$.
    In the compactly supported $B$ case the equation is just a Poisson equation on the distant end,
    and all available metric derivative orders give corresponding derivative bounds.
    This proves the asserted decay. It also gives $B sqrt(\| d phi.alt \|^2 + r^(- 2 k)) = O \( r^(- n - q) \)$,
    so $beta < q$ proves the Laplacian ratio in Equation (3.20).
  The source is integrable. Integrating the equation on $Omega_R$, remembering that its inner outward normal is $-
    nu$, gives
  $ integral_(S_R) partial_(nu_g) phi.alt thin d A_g = - "Area"_g \( S \) -
    integral_(Omega_R) #scale(x: 120%, y: 120%)[\(] B sqrt(\| d phi.alt \|^2 + a^2) +
    b #scale(x: 120%, y: 120%)[\)] thin d V_g . $
  This proves the claimed finite negative flux.
  #emph[5. Strict inequalities and charges.] Finally $\| d phi.alt \|^2 lt.eq C b$ globally:
    on the end the quotient has order $r^(- \( n - 2 - beta \))$, which is bounded because $beta < 1 lt.eq n - 2$,
    and on the core $b$ is positive. Equation (3.19) implies, for every unit-ball vector $v$, $- Delta phi.alt +
    K \( nabla phi.alt \, v \) gt.eq b$. Use Equation (3.2) with $s = delta phi.alt$;
    for sufficiently small fixed $delta > 0$ the negative square term is at most half the positive $k delta
    b$ term. This proves the strict DEC margin, and $e^(delta phi.alt) theta_(+ \, delta) = theta_(+) -
    k delta < 0$. The conformal energy vector changes by $- 2 k delta thin d phi.alt + o \( r^(1 - n) \)$.
    The geometric and Euclidean fluxes of $d phi.alt$ agree in the limit,
    since their difference is $O \( r^(- q) \)$ after integration.
    Division by $2 k omega$ gives the energy formula in Equation (3.21) exactly.
    The momentum trace reversal is multiplied by $e^(delta phi.alt)$; its flux change is $O \( r^(- q) \) arrow.r
    0$. Positivity and boundedness of $phi.alt$ give the last metric statements. ◻
]

===== 3.5.1 Infinitesimal strictification. <infinitesimal-strictification.>

For any datum in Lemma 13, the same construction gives a quantitative infinitesimal statement at points where the
  dominant energy condition is saturated. Write $frak(C)_delta \( v \) = 2 #scale(x: 120%, y: 120%)[\(] mu_delta +
  J_delta \( e^(- delta phi.alt) v \) #scale(x: 120%, y: 120%)[\)]$.
  At an active ray, meaning $\| v \|_g lt.eq 1$ and $mu + J \( v \) = 0$, differentiation of Equation (3.2) gives

#[#set math.equation(numbering: n => "(3.24)")
 $ frak(C)'_0 \( v \) = 2 k #scale(x: 120%, y: 120%)[\(] - Delta phi.alt +
   K \( nabla phi.alt \, v \) #scale(x: 120%, y: 120%)[\)] gt.eq 2 k 𝜚^(- n - beta) . $ <eq:end:strict-direction>]

Its quotient by $r^(- n - beta)$ tends to $2 k$ along any active rays escaping to infinity:
  the two terms involving $B$ and $K$ are $O \( r^(- n - q) \)$.
  At a marginal boundary the expansion derivative of the same direction is exactly $- k$.

#proof[
  Apply Lemma 13 to the repaired data $\( g_L^(*) \, K_L^(*) \)$,
    choosing $B$ compactly supported and choosing $delta_L arrow.b 0$ so that $delta_L parallel phi.alt_L
    parallel_oo arrow.r 0$ and $delta_L \| frak(f)_(phi.alt_L) \| arrow.r 0$.
    There is no need for constants in this solve to be uniform in $L$:
    this choice is made after the entire replacement at that $L$.
    Its scalar curvature has the required decay, since the ultimate initial end is scalar flat and
  $ R_(e^(2 delta_L phi.alt_L) g_L^(*)) = e^(- 2 delta_L phi.alt_L) #scale(x: 120%, y: 120%)[\(] 2 k delta_L
    r^(- n - beta) - k p delta_L^2 \| d phi.alt_L \|^2 #scale(x: 120%, y: 120%)[\)] $
  there. Compact support of $K_L^(*)$ is preserved, and all metric derivative orders have the stated asymptotics.
    The strict margin and expansion are those of Lemma 13. The core remains smooth and the tail is uniformly
    Euclidean comparable, so completeness with $S$ included is preserved.
    The constraints are integrable on the core and have integrable decay on the tail.
  By Equation (3.16) and the choice of $delta_L$, the final energy tends to $M = m > 0$,
    and the final momentum is zero. Strictification only increases the metric,
    so Equation (3.17) and the full-cut comparison remain valid; in particular,
    every resulting full-cut infimum is positive. Pass to a sequence along which the comparison errors are bounded
    by numbers $epsilon.alt_j arrow.b 0$. These data satisfy Definition 6 and every assertion in Equation (3.1). ◻
]

=== 3.6 A positive shell with fixed momentum <a-positive-shell-with-fixed-momentum>

The reduction above uses a fixed original future-timelike ADM vector.
  The following independent conformal change applies without a timelike assumption:
  it raises the energy by a prescribed amount, fixes the momentum, and increases every full-cut area.
  These are the properties used in the proof of Corollary 4 in Section 2.

#thm([Lemma 3.6.])[
  (A positive shell in the strong-decay class).  #emph[Assume all hypotheses of Theorem 3 except possibly $E > \|
    P \|_delta$. For every $lambda > 0$ there is a smooth function $U_lambda gt.eq 1$, constant near $S$, such that
$ g_lambda = U_lambda^(4 \/ p) g \, wide K_lambda = U_lambda^(2 \/ p) K $

 are smooth complete one-ended data with the same $O_6 \/ O_5$ decay and $q$, integrable constraint densities,
   the dominant energy condition and weakly future trapped boundary, and satisfy
$ E_lambda = E + 2 lambda \, wide P_lambda = P \, wide A_(min \, g_lambda) \( S \) gt.eq A_(min \, g) \( S \) > 0 . $

]
] <lem:end:positive-shell>

#proof[
  For $U > 0$ put $a = U^(2 \/ p)$ and $\( g_U \, K_U \) = \( a^2 g \, a K \)$.
    Substitution of $s = 2 p^(- 1) log U$ into Equation (3.2) gives, as scalar and covector identities,
  $ a^2 mu_U = mu - frac(2 k, p U) Delta_g U \, wide a J_U = J + frac(2 k, p U) K \( nabla U \, dot.op \) . $
  Indeed, the scalar terms combine as $- k Delta s - frac(k p, 2) \| d s \|^2 = - frac(2 k, p U) Delta U$.
    Taking the new-metric covector norm introduces another factor $a^(- 1)$, so
  #[#set math.equation(numbering: n => "(3.25)")
   $ a^2 \( mu_U - \| J_U \|_(g_U) \) gt.eq mu - \| J \|_g + frac(2 k, p U) #scale(x: 120%, y: 120%)[\(] -
     Delta_g U - \| K \|_g \| d U \|_g #scale(x: 120%, y: 120%)[\)] . $ <eq:end:shell-dec>]
  The boundary identity is
  $ a theta_(+ \, U) = theta_(+) + frac(2 k, p U) partial_nu U . $
  Thus a factor constant near $S$ preserves its expansion sign, and $-
    Delta_g U gt.eq \| K \|_g \| d U \|_g$ preserves the dominant energy condition.
  Choose $0 < xi < min \( q \, 1 \)$. In a sufficiently distant part of the coordinate end set
  $ T \( r \) = r^(- p) - r^(- p - xi) . $
  There $T > 0$ and $T' < 0$. Since $p = n - 2$, $Delta_delta r^(- alpha) =
    alpha \( alpha + 2 - n \) r^(- alpha - 2)$. The original metric and tensor estimates therefore give
  $ - Delta_g T - \| K \|_g \| d T \|_g = xi \( p + xi \) r^(- n - xi) + O \( r^(- n - q) \) > 0 $
  after increasing the radius. Choose a nondecreasing smooth switch $beta$ from zero to one in this region,
    constant near its endpoints, and put
  $ G \( r \) = - integral_r^oo beta \( t \) T' \( t \) thin d t . $
  Extend $G$ constantly through the interior. Then $G gt.eq 0$, it is constant near $S$, and $G =
    T$ sufficiently far out. Because $d G = beta thin d T$,
  $ - Delta_g G - \| K \|_g \| d G \|_g = beta \( - Delta_g T - \| K \|_g \| d T \|_g \) -
    beta' T' \| d r \|_g^2 gt.eq 0 . $
  Use $U_lambda = 1 + lambda G$. Equation (3.25) and the boundary formula prove the required signs for every fixed
    $lambda > 0$, without a smallness condition.
  The factor is bounded for each fixed $lambda$ and is at least one,
    so completeness with $S$ included is preserved. The manifold and its unique coordinate end are unchanged.
    On the tail $G = O_j \( r^(- p) \)$ at every fixed derivative order.
    Since $q < p$, the added metric tail is faster than the original decay, and
  $ g_lambda - delta = O_6 \( r^(- q) \) \, wide K_lambda = O_5 \( r^(- 1 - q) \) . $
  Moreover,
  $ Delta_g U_lambda = O \( r^(- n - xi) \) + O \( r^(- n - q) \) \, wide \| K \|_g \| d U_lambda \|_g =
    O \( r^(- n - q) \) . $
  These terms are integrable against $d V_g asymp r^(n - 1) d r thin d omega$.
    The scalar and covector identities above, and the bounded conformal factors for fixed $lambda$,
    show that the new constraint densities are integrable against $d V_(g_lambda)$.
  For the charges write $f_lambda = U_lambda^(4 \/ p)$. Then
  $ f_lambda = 1 + frac(4 lambda, p) G + O_1 \( r^(- 2 p) \) . $
  In the metric flux of Equation (1.2), the leading change is $- k partial_i \( f_lambda - 1 \)$.
    Terms involving $g - delta$ or its first derivatives have integrated flux $O \( R^(- q) \)$,
    and the nonlinear remainder has flux $O \( R^(- p) \)$. Since
  $ lim_(R arrow.r oo) integral_(S_R) partial_r G thin d A_delta = - p omega_(n - 1) \, $
  the current normalization gives
  $ E_lambda - E = - frac(2 lambda, p omega_(n - 1)) lim_(R arrow.r oo) integral_(S_R) partial_r G thin d
    A_delta = 2 lambda . $
  If $pi = K - \( "tr"_g K \) g$, its transformed tensor is exactly $pi_lambda = U_lambda^(2 \/ p) pi$.
    The additional momentum flux in Equation (1.2) is $O \( R^(- q) \)$, because $U_lambda^(2 \/ p) - 1 =
    O \( r^(- p) \)$ and $pi = O \( r^(- 1 - q) \)$. Thus $P_lambda = P$, and the new ADM limits are finite.
  Finally, the admissible domains in Definition 2 are unchanged. For their entire intrinsic boundaries,
  $ "Area"_(g_lambda) \( partial D \) = integral_(partial D) U_lambda^(2 k \/ p) thin d A_g gt.eq
    "Area"_g \( partial D \) . $
  This comparison includes every component and boundary-coincident portion.
    Taking the infimum proves the claimed full-cut area inequality. ◻
]

== 4 A scalar identity that controls area and mass <sec:scalar>

Throughout this section the data satisfy Definition 6. We seek a metric $hat(g) =
  e^(2 t) \( g + l \( t \)^2 d f ⊗ d f \)$ with $t > - epsilon.alt$, so that $hat(g) gt.eq
  e^(- 2 epsilon.alt) g$ controls the loss of full-cut area.
  The normalized height $h = eta f$ will separate the filling from the enclosure;
  weighted coercivity will control its derivatives. We solve for the graph height $f$ and the modified conformal
  variable $Z$ in Equation (4.2). The scalar divergence equation for $Z$ controls the penalty’s contribution to
  the ADM energy. Section 5 constructs smooth solutions by exhaustion at fixed $epsilon.alt \, N$;
  the later limit in $N$ uses only the explicit estimates. All identities below hold in every dimension $n = k +
  1 gt.eq 3$.

=== 4.1 Filling the boundary and choosing the unknowns <filling-the-boundary-and-choosing-the-unknowns>

We need a divergence equation with no inner flux. A smooth filling permits that equation to be solved on a
  complete manifold without boundary. The filling is auxiliary: its energy condition will never be assumed.
  Its height will later be separated from the Riemannian comparison region.

The original exterior has compact complement of its coordinate end.
  Cut it at a large coordinate sphere, take an orientation-reversed copy of the resulting compact manifold,
  and cap the copied spherical face by a ball. The resulting compact manifold has boundary a copy of the
  #emph[whole] $S$. Gluing along that boundary therefore fills all components of $S$ simultaneously;
  no individual component is required to bound. Smooth collars perform the gluing.
  Initially extend $g \, K$ across $S$ on a fixed short collar.
  Strict negativity of the expansions of the signed-distance leaves persists there by continuity.
  Beyond that collar interpolate the metric to a product, and subtract a smooth nonnegative multiple of the metric
  from $K$. Start this subtraction while the strict inequality still holds and make the multiple large before
  performing the remaining interpolation. Since the transition is fixed and compact,
  its leaf mean curvatures and the other tangential traces are bounded. Thus the subtraction can ensure

$ H + "tr"_(upright("leaf")) K < - c_0 < 0 $

through every transition. Arrange $K = - L_0 g$ on the ensuing product necks and on the remaining cap,
  with $L_0$ a sufficiently large fixed constant. The neck length at each boundary component may be chosen between
  $c \( 1 + N \)$ and $C \( 1 + N \)$, increasing $C$ when the height ramp in Section 6 is chosen.

Denote the resulting complete manifold without boundary by $cal(M)_N$, and continue to write $g \,
  K$ for the extended fields. They are unchanged on the original exterior.
  All the local metric models belong to a fixed finite family, apart from translation along product cylinders.
  Consequently their injectivity radii are bounded below, every prescribed finite collection of local geometric
  bounds is bounded independently of $N$, and the enlarged core has volume and covering number $O \( 1 + N \)$.
  No energy condition is imposed in the added region. Extend the end radius to a smooth positive function $𝜚$,
  uniformly comparable to $1$ on that core. Hence weighted integrals over the core cost at most a polynomial in $N$.

In the scalar construction, $p = p \( t \)$ is the cutoff defined below; the dimensional exponent is written $n -
  2 = k - 1$. Fix $0 < epsilon.alt < 1$. Let $theta.alt in C^oo \( bb(R) \)$ be nonincreasing,
  equal to $1$ on $\( - oo \, 0 \]$ and to $0$ on $\[ 1 \, oo \)$, with values in $\[ 0 \, 1 \]$.
  For an integer $N > max \( k \, 2 \/ epsilon.alt \)$ put

#[#set math.equation(numbering: n => "(4.1)")
 $ p \( t \) = N theta.alt \( N t \) \, wide l \( t \) = exp (integral_0^t p \( s \) thin d s) \,\
ell = e^(- N epsilon.alt) \, wide eta = ell^(3 \/ 2) \, wide m_0 \( t \) =
  theta.alt #scale(x: 120%, y: 120%)[\(] N \( t + epsilon.alt \) #scale(x: 120%, y: 120%)[\)] .
  $ <eq:scalar:parameters>]

In particular $l = e^(N t)$ for $t lt.eq 0$, $l lt.eq e$ everywhere, and $sup \| p^(\( j \)) \| lt.eq
  C_j N^(j + 1)$ for each fixed $j$.

For smooth unknowns $f \, Z$, define $t$ implicitly by

#[#set math.equation(numbering: n => "(4.2)")
 $ Z = t + frac(1, 2 k) log D \, wide D = 1 + l \( t \)^2 \| d f \|_g^2 . $ <eq:scalar:implicit>]

For fixed $d f$ the derivative of the right side with respect to $t$ is $\( k + p v \) \/ k gt.eq 1$, where $v =
  1 - D^(- 1)$. Its limits as $t$ tends to $plus.minus oo$ are $plus.minus oo$.
  Thus this equation defines $t$ globally and smoothly as a function of $\( Z \, \| d f \|^2 \)$,
  without a lower-bound assumption on $t$. Use $g$ to identify vectors and covectors and set

#[#set math.equation(numbering: n => "(4.3)")
 $ & w = l D^(- 1 \/ 2) nabla f \, wide a_w = \| w \| \, wide v = a_w^2 \, wide d = D^(- 1) = 1 - v \,\
 & chi = frac(k d, k + p v) \, wide A_d = I - w ⊗ w \, wide A_chi = I - frac(k + p, k + p v) w ⊗ w \,\
 & H^f = l D^(- 1 \/ 2) "Hess"_g f \, wide L = K + H^f \, wide F = "tr"_(A_chi) L \, wide h = eta f \,\
 & U = l sqrt(D) \, wide u = e^(\( k - 1 \) t) U \, wide V = u A_chi #scale(x: 120%, y: 120%)[\(] k nabla Z +
   K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] \,\
 & macron(g) = g + l^2 d f ⊗ d f \, wide hat(g) = e^(2 t) macron(g) \, wide s_p = p +
   frac(k - 1, 2) . $ <eq:scalar:variables>]

The notation $"tr"_A B$ means $A^(i j) B_(i j)$, and $\| alpha \|_A^2 = A^(i j) alpha_i alpha_j$.
  The tensors $A_d \, A_chi$ have transverse eigenvalue $1$ and axial eigenvalues $d \, chi$, respectively.
  More explicitly,

#[#set math.equation(numbering: n => "(4.4)")
 $ 0 < frac(k, k + N) d lt.eq chi lt.eq d lt.eq 1 \, wide k thin d Z = \( k + p v \) thin d t +
   H^f \( w \, dot.op \) . $ <eq:scalar:differential>]

The second equality follows by differentiating Equation (4.2):
  $1 / 2 d log D = p v thin d t + H^f \( w \, dot.op \)$. Every tensor in Equation (4.3) is smooth at $d f = 0$.
  The axis notation used below is only a way of displaying these tensors,
  not a coefficient definition at gradient zeros.

In this and the next two sections $cal(P)_N$ denotes a polynomial in $1 + N$,
  whose coefficients may depend on the fixed prepared data, $n$, and $epsilon.alt$.
  Increasing such a polynomial finitely many times does not change this convention.
  An estimate with an arbitrary constant depending on fixed $N$ will be explicitly identified as such;
  it cannot be substituted into a later $cal(P)_N$ estimate.

=== 4.2 The scalar identity <the-scalar-identity>

The model for this calculation is the Schoen–Yau scalar-curvature identity for Jang graphs
  #cite(label("SchoenYau1981")), and more specifically its warped generalization in #cite(label("BrayKhuri2011"))
  Identity 9, p. 580. Our conformal variable, gradient-aligned trace, and redistributed divergence are different.
  We derive their exact identity before imposing the coupled equations;
  its algebra and their global solvability are separate steps.

For symmetric tensors define the bilinear form and trace reversal

$ sans(B) \( B \, C \) = chevron.l B \, C chevron.r_g - \( "tr"_g B \) \( "tr"_g C \) \, wide P_B =
  B - \( "tr"_g B \) g . $

At a nonzero gradient let $e = nabla f \/ \| d f \|$, and decompose $L$ and $d t$ relative to $e^perp xor bb(R) e$ as

$ L = mat(delim: "(", T, M; M^(⊺), j) \, wide d t = \( y \, x \) \, wide T^0 = T - frac("tr" T, k) I_(e^perp) . $

Here $"tr" T = F - chi j$. At $d f = 0$ one may choose any unit axis.

#thm([Proposition 4.1.])[
  (Scalar identity).  #emph[For every smooth $f \, Z$ and every smooth $g \, K$ the following identity holds,
    without a field equation or energy hypothesis:
#[#set math.equation(numbering: n => "(4.5)")
 $ 1 / 2 e^(2 t) R_(hat(g)) = mu + J \( w \) + cal(T) + w \( F \) - F tau - u^(- 1) "div"_g V \, $ <eq:scalar:identity>]

 where $2 mu = R_g + tau^2 - \| K \|^2$, $J = "div"_g P_K$, and
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + s_p a_w y \|^2 + (k s_p - frac(\( k - 1 \)^2, 4) v) \| y \|^2 + k s_p d x^2\
 & - frac(k - 1, 2 k) \( F - chi j \)^2 + chi j^2 - chi F j + F^2 + 2 s_p chi j a_w x . $ <eq:scalar:quadratic>]

 The quantity $cal(T)$ is smooth, including where $d f = 0$.]
] <prop:scalar:identity>

#proof[
  We derive the curvature formula before completing any squares.
    On $bb(R)_z times cal(M)_N$ consider the stationary Lorentz metric
  $ upright(bold(G)) = - l^2 \( d z - d f \)^2 + macron(g) = - l^2 d z^2 + 2 l^2 d z thin d f + g . $
  The constant-$z$ slices have lapse $U$, shift $U w = l^2 nabla f$, future unit normal $upright(bold(n)) =
    U^(- 1) partial_z - w$, and second fundamental form
  #[#set math.equation(numbering: n => "(4.7)")
   $ b = - U^(- 1) "sym" nabla \( U w \) = - H^f - p \( d t ⊗ w + w ⊗ d t \) . $ <eq:scalar:stationary-second-form>]
  This sign follows directly from $partial_z g = 2 U b + cal(L)_(U w) g =
    0$ and the prescribed future-normal convention. Write $B_0 = "tr" b$.
    Contracted Gauss and the normal lapse equation give
  $ upright(bold(R)) + 2 upright(bold("Ric")) \( upright(bold(n)) \, upright(bold(n)) \) = R_g -
    sans(B) \( b \, b \) \, wide upright(bold("Ric")) \( upright(bold(n)) \, upright(bold(n)) \) = -
    upright(bold(n)) \( B_0 \) - \| b \|^2 + U^(- 1) Delta_g U . $
  Since $B_0$ is stationary, $upright(bold(n)) \( B_0 \) = - w \( B_0 \)$,
    and taking the trace in Equation (4.7) gives $"div" \( U w \) = - U B_0$. Substitution proves
  #[#set math.equation(numbering: n => "(4.8)")
   $ upright(bold(R)) = R_g + sans(B) \( b \, b \) - 2 U^(- 1) "div" #scale(x: 120%, y: 120%)[\(] nabla U +
     B_0 U w #scale(x: 120%, y: 120%)[\)] . $ <eq:scalar:stationary-curvature>]
  In coordinates $z' = z - f$, the same metric is the static warped product $- l^2 \( d z' \)^2 + macron(g)$.
    Its only mixed connection terms are $bold(Gamma)_(i z')^(z') = partial_i log l$ and $bold(Gamma)_(z' z')^i =
    l macron(g)^(i j) partial_j l$; contracting their curvature contributions yields $upright(bold(R)) =
    R_(macron(g)) - 2 l^(- 1) Delta_(macron(g)) l$. Also $macron(g)^(- 1) = A_d$, $d V_(macron(g)) =
    sqrt(D) thin d V_g$, and therefore
  $ l^(- 1) Delta_(macron(g)) l = U^(- 1) "div" #scale(x: 120%, y: 120%)[\(] \( U \/ l \) A_d nabla l
    #scale(x: 120%, y: 120%)[\)] . $
  Differentiating $U = l sqrt(D)$ and using Equation (4.4) proves the vector identity
  $ nabla U - \( U \/ l \) A_d nabla l = - U b \( w \, dot.op \) . $
  Consequently Equation (4.8) becomes
  #[#set math.equation(numbering: n => "(4.9)")
   $ 1 / 2 R_(macron(g)) = 1 / 2 R_g + 1 / 2 sans(B) \( b \, b \) +
     U^(- 1) "div" \( U P_b w \) . $ <eq:scalar:bar-first>]
  Set $Q = K - b = L + p \( d t ⊗ w + w ⊗ d t \)$. For any symmetric $C$,
    the product rule and Equation (4.7) give the useful exact contraction
  $ U^(- 1) "div" \( U P_C w \) = \( "div" P_C \) \( w \) - sans(B) \( C \, b \) . $
  Expanding $sans(B) \( K - b \, K - b \)$ and applying this formula to $C = K$ transforms Equation (4.9) into
  #[#set math.equation(numbering: n => "(4.10)")
   $ 1 / 2 R_(macron(g)) = mu + J \( w \) + 1 / 2 sans(B) \( Q \, Q \) -
     U^(- 1) "div" \( U P_Q w \) . $ <eq:scalar:bar-identity>]
  For example, the terms involving $K$ on the right cancel to $R_g \/ 2 -
    sans(B) \( b \, b \) \/ 2 + \( "div" P_b \) \( w \)$, as they must.
  The conformal scalar law in dimension $k + 1$ is
  $ 1 / 2 e^(2 t) R_(hat(g)) = 1 / 2 R_(macron(g)) - k Delta_(macron(g)) t -
    frac(k \( k - 1 \), 2) \| d t \|_(A_d)^2 . $
  The volume formula gives
  $ Delta_(macron(g)) t = U^(- 1) "div" \( U A_d nabla t \) - p \| d t \|_(A_d)^2 . $
  Changing the divergence weight from $U$ to $u = e^(\( k - 1 \) t) U$ now yields
  #[#set math.equation(numbering: n => "(4.11)")
   $ 1 / 2 e^(2 t) R_(hat(g)) =  & mu + J \( w \) + 1 / 2 sans(B) \( Q \, Q \) + \( k - 1 \) P_Q \( w \, d t \) +
     k s_p \| d t \|_(A_d)^2\
 & - u^(- 1) "div" #scale(x: 120%, y: 120%)[\(] u \( P_Q w + k A_d nabla t \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:scalar:invariant-preidentity>]
  In particular the last change of weight adds $k \( k - 1 \) \| d
    t \|_(A_d)^2$ to the preceding coefficient $k \[ p - \( k - 1 \) \/ 2 \]$.
  There are two remaining first-order algebraic identities:
  #[#set math.equation(numbering: n => "(4.12)")
   $ u \( P_Q w + k A_d nabla t \) & = V - u F w \,\
u^(- 1) "div" \( u w \) & = "tr"_g L - tau + 2 s_p w \( t \) = F + \( 1 - chi \) j - tau +
  2 s_p a_w x . $ <eq:scalar:flux-relations>]
  For the first, $P_Q w + k A_d d t$ has transverse and axial components
  $ a_w M + \( k + p v \) y \, wide - a_w "tr" T + k d x \, $
  whereas $V \/ u$ has components $a_w M + \( k + p v \) y$ and $chi a_w j + k d x$ by Equation (4.4).
    Their difference is $F w$. For the second, use $"div" \( U w \) = - U "tr" b$ and change the weight.
    Thus the smooth invariant definition of the claimed quadratic form is
  #[#set math.equation(numbering: n => "(4.13)")
   $ cal(T) = 1 / 2 sans(B) \( Q \, Q \) + \( k - 1 \) P_Q \( w \, d t \) + k s_p \| d t \|_(A_d)^2 +
     F #scale(x: 120%, y: 120%)[\(] "tr"_g L + 2 s_p w \( t \) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:scalar:invariant-quadratic>]
  This proves smoothness and Equation (4.5). To obtain its displayed block form, the blocks of $Q$ are $T$, $M +
    p a_w y$, and $j + 2 p a_w x$. The transverse terms are
  $ \| M + p a_w y \|^2 + \( k - 1 \) a_w \( M + p a_w y \) dot.op y = \| M + s_p a_w y \|^2 -
    frac(\( k - 1 \)^2, 4) v \| y \|^2 . $
  The terms containing $F a_w x$ cancel, while their remaining axial cross term is $2 s_p chi j a_w x$.
    Finally $\| T \|^2 = \| T^0 \|^2 + \( F - chi j \)^2 \/ k$ gives Equation (4.6).
  For completeness this derivation retains derivatives of $p$.
    In the flux of Equation (4.11) the part explicitly containing $p$ is $p { v nabla t - w \( t \) w }$;
    its divergence contributes $p' v \| y \|^2$. Thus the scalar side contains $- p' v \| y \|^2$.
    In Equation (4.5) the redistribution of this term can also be checked directly.
    Holding $t \, d t \, d f \, H^f \, K$ fixed when taking the partial derivative in $p$, one has $chi_p = -
    chi v \/ \( k + p v \)$. The terms containing $p'$ in $w \( F \)$ and $u^(- 1) "div" V$ are respectively
  $ p' chi_p a_w x j \, wide p' #scale(x: 120%, y: 120%)[\(] v \| y \|^2 +
    chi_p a_w x j #scale(x: 120%, y: 120%)[\)] . $
  Their difference is exactly $- p' v \| y \|^2$. No derivative of the cutoff has been discarded. ◻
]

=== 4.3 Coercivity with polynomial constants <coercivity-with-polynomial-constants>

The identity has isolated the divergence, but it is useful only if the remaining quadratic form controls the graph
  and conformal derivatives. The next proposition records exactly which axial weights survive.
  Its constants are polynomial in the large parameter; this is what will allow the exponentially small penalty
  flux to tend to zero.

#thm([Proposition 4.2.])[
  (Weighted coercivity).  #emph[For $0 lt.eq p lt.eq N$ and $0 lt.eq
    v < 1$ the quadratic form in Equation (4.6) is nonnegative, and
#[#set math.equation(numbering: n => "(4.14)")
 $ \| T \|^2 + \| M \|^2 + d j^2 + F^2 + \| d t \|_(A_d)^2 lt.eq C_k \( 1 + N \)^2 cal(T) . $ <eq:scalar:coercivity>]

 At $d t = 0$ one has, with constants depending only on $k$,
#[#set math.equation(numbering: n => "(4.15)")
 $ c_k #scale(x: 120%, y: 120%)[\(] \| T^0 \|^2 + \| M \|^2 + F^2 + chi j^2 #scale(x: 120%, y: 120%)[\)] lt.eq
   cal(T) lt.eq C_k #scale(x: 120%, y: 120%)[\(] \| T^0 \|^2 + \| M \|^2 + F^2 +
   chi j^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:scalar:stationary-coercivity>]

]
] <prop:scalar:coercivity>

#proof[
  The entire axial part of Equation (4.6) is exactly
  #[#set math.equation(numbering: n => "(4.16)")
   $ & k s_p d (x + frac(a_w j, k + p v))^2 + frac(k + 1, 2 k) (F - frac(chi j, k + 1))^2 +
     frac(k d B_k \( v \), \( k + p v \)^2) j^2 \,\
 & B_k \( v \) = d frac(k \( k + 2 \), 2 \( k + 1 \)) + v frac(k + 1, 2) =
   frac(k \( k + 2 \) + v, 2 \( k + 1 \)) . $ <eq:scalar:completed-axial>]
  Indeed completing first the $x$ square and then the $F$ square leaves
  $ chi - frac(k, 2 \( k + 1 \)) chi^2 - s_p frac(chi^2 v, k d) = frac(k d B_k \( v \), \( k + p v \)^2) . $
  The last coefficient is at least $c_k d \/ \( 1 + N \)^2$, and
  $ k s_p - frac(\( k - 1 \)^2, 4) v gt.eq frac(k^2 - 1, 4) > 0 . $
  These inequalities control $\| T^0 \|^2 \, \| y \|^2 \, d j^2$ and the two completed squares.
    Recovering $M$ from $M + s_p a_w y$ costs at most $C_k \( 1 + N \)^2$.
    Recovering $sqrt(d) thin x$ costs the already controlled $sqrt(d) thin j$, since $a_w \/ \( k + p v \) lt.eq
    1 \/ k$. Recovering $F$ costs no more because $chi^2 lt.eq d$.
    The relation $"tr" T = F - chi j$ then controls $\| T \|^2$.
    These observations give Equation (4.14) with the stated single quadratic polynomial;
    they do not remove the factors $d$.
  When $d t = 0$ the axial expression instead completes as
  $ frac(k + 1, 2 k) (F - frac(chi j, k + 1))^2 + chi (1 - frac(k chi, 2 \( k + 1 \))) j^2 . $
  Its second parenthesis is bounded above and below by positive constants, and $chi^2 lt.eq chi$.
    This proves Equation (4.15) independently of $N$. ◻
]

=== 4.4 The penalized system and the lower barrier <the-penalized-system-and-the-lower-barrier>

We now choose the equations using the signs in Equation (4.5).
  Imposing $F = h = eta f$ turns $w \( F \)$ into the nonnegative term $eta a_w \| d f \|$.
  We can assign a small fixed fraction of this term and of $cal(T)$ to the divergence source while retaining the
  rest in the scalar-curvature formula. To enforce the lower bound for $t$,
  the source will also contain a negative term near $t = - epsilon.alt$.
  Its sign improves scalar curvature, but its integral can increase ADM energy.
  We therefore need both a pointwise floor argument and a separate estimate for the weighted integral of that penalty.

Choose

#[#set math.equation(numbering: n => "(4.17)")
 $ n / 4 < b_1 < min (n - 2 \, n / 2) \, wide rho_0 = 𝜚^(- n - beta) \, quad rho_1 = 𝜚^(- 2 b_1) \, quad rho =
   c_(*) rho_0 > 0 . $ <eq:scalar:weights>]

This interval is nonempty for every $n gt.eq 3$. Its three restrictions serve different parts of the argument:
  $b_1 < n - 2$ permits the radial height comparison in Section 5;
  $2 b_1 < n$ lets $v rho_1$ dominate the end-curvature error in the floor calculation;
  and $4 b_1 > n$ makes $rho_1^2$ integrable in the flux estimate.
  Take $c_(*)$ small enough that $mu - \| J \| gt.eq 2 rho$ on the original exterior. The system to be solved is

#[#set math.equation(numbering: n => "(4.18)")
 $ F = h = eta f \, wide "div" V = u Xi \,\
Xi = delta_0 #scale(x: 120%, y: 120%)[\(] cal(T) + eta a_w \| d f \| #scale(x: 120%, y: 120%)[\)] + rho -
  m_0 C_N \( rho_0 + v rho_1 \) . $ <eq:scalar:system>]

Here $delta_0 > 0$ is a sufficiently small fixed number and $C_N$ is a sufficiently large polynomial,
  specified by the next lemma. Substitution in the scalar identity retains
  $\( 1 - delta_0 \) \( cal(T) + eta a_w \| d f \| \)$; the positive source $rho$ spends only part of the strict
  energy margin on the original exterior. The remaining term $- h tau$ will be controlled on a small height band.
  The negative penalty is chosen to contradict the flux lower bound at a minimum with $t = - epsilon.alt$.

For an above-floor solution its support lies in $- epsilon.alt < t < - epsilon.alt + N^(- 1)$, where $ell lt.eq
  l lt.eq e ell$. Proposition 18 will use this small weight to bound the possible energy increase by a polynomial
  times $ell + ell^2 \/ eta$. The height-derivative estimate below instead uses $eta \/ ell$.
  The choice $eta = ell^(3 \/ 2)$ makes both ratios $ell^2 \/ eta$ and $eta \/ ell$ equal to $ell^(1 \/ 2)$.
  Both ratios tend to zero faster than any polynomial in $N$ at fixed $epsilon.alt$.

On a large truncation the outer data are $f = Z = 0$; there is no inner boundary.
  For the existence argument we use two homotopies. In the first replace $K$ by $a K$, $0 lt.eq a lt.eq 1$,
  everywhere in these definitions, keeping the weights and constants fixed.
  In the second keep $K = 0$ and multiply the whole expression $Xi$ by $s in \[ 0 \, 1 \]$.

For a symmetric tensor $B$ write

$ cal(S) \( B \) = 1 / 2 {\( "tr"_(A_d) B \)^2 - \| B \|_(A_d ⊗ A_d)^2} . $

#thm([Lemma 4.3.])[
  (Pointwise exclusion of the floor).  #emph[There is $c_1 > 0$ depending on $k$ alone such that,
    at any point with $d t = 0$,
#[#set math.equation(numbering: n => "(4.19)")
 $ cal(T) - cal(S) \( H^f \) gt.eq c_1 cal(T) - cal(P)_N \( v F^2 + \| K \|^2 \) . $ <eq:scalar:floor-algebra>]

 Suppose a smooth solution on a truncation with outer $f = Z =
   0$ satisfies the trace equation and has $\| h \| lt.eq C$ on the core and $\| h \| lt.eq
   C 𝜚^(- b_1)$ on the end, with constants independent of the homotopy parameter and $N$.
   One may choose $0 < delta_0 < min \( c_1 \, 1 \) \/ 2$ and a polynomial $C_N$ such that a solution of
   Equation (4.18) for which $min t = - epsilon.alt$ cannot attain this minimum of $t$ at an interior point.
   This holds in both stages of the homotopy.]
] <lem:scalar:floor>

#proof[
  At $d t = 0$, direct block contraction gives
  $ cal(S) \( L \) = frac(k - 1, 2 k) \( F - chi j \)^2 - 1 / 2 \| T^0 \|^2 + d j \( F - chi j \) - d \| M \|^2 . $
  Subtracting from Equation (4.6) gives the full difference, including its mixed term:
  #[#set math.equation(numbering: n => "(4.20)")
   $ cal(T) - cal(S) \( L \) =  & \| T^0 \|^2 + \( 1 + d \) \| M \|^2 + F^2 / k\
 & + (frac(k - 2, k) chi - d) F j + chi (1 + d - frac(k - 1, k) chi) j^2 . $ <eq:scalar:floor-difference>]
  If $\( 1 + p \) v lt.eq zeta_k$ with $zeta_k > 0$ sufficiently small, then $\| d - 1 \| + \| chi - 1 \| lt.eq
    C_k zeta_k$. At $d = chi = 1$ the expression is
  $ \| T^0 \|^2 + 2 \| M \|^2 + frac(\( F - j \)^2, k) + j^2 = \| L \|^2 . $
  Perturbation of this finite-dimensional positive form, and Equation (4.15),
    therefore bound Equation (4.20) below by a fixed positive multiple of $cal(T)$.
  In the other case $1 \/ v lt.eq \( 1 + p \) \/ zeta_k$. The last coefficient in Equation (4.20) is at least
    $chi$, since $chi lt.eq d$. The absolute value of its mixed coefficient is at most $d$.
    Hence Young’s inequality bounds the difference below by
  $ \| T^0 \|^2 + \| M \|^2 + 1 / 2 chi j^2 + (1 / k - frac(d^2, 2 chi)) F^2 . $
  Here
  $ d^2 / chi = frac(d \( k + p v \), k) lt.eq 1 + N / k . $
  It follows, again using Equation (4.15), that the desired fixed multiple of $cal(T)$ is obtained after
    subtracting at most $C_k \( 1 + N \)^2 v F^2 \/ zeta_k$.
  To replace $L$ by $H^f = L - K$, polarize $cal(S)$ in the $A_d ⊗ A_d$ norm. The preceding stationary coercivity gives
  $ \| L \|_(A_d ⊗ A_d)^2 = \| T \|^2 + 2 d \| M \|^2 + d^2 j^2 lt.eq C_k \( 1 + N \) cal(T) . $
  Moreover $\| K \|_(A_d ⊗ A_d) lt.eq \| K \|$. Therefore
  $ \| cal(S) \( L \) - cal(S) \( L - K \) \| lt.eq zeta cal(T) + C_(k \, zeta) \( 1 + N \) \| K \|^2 $
  for every fixed $zeta > 0$. Taking $zeta$ below half the positive constant already obtained proves Equation (4.19).
  At an interior minimum of $t$, $d t = 0$ and $"Hess"_g t gt.eq 0$.
    To estimate curvature from above, view $macron(g)$ as the metric on the graph of $f$ in the Riemannian warped
    product $g + l^2 d z^2$. At that point $d l = 0$ and $l^(- 1) "Hess" l = p "Hess" t$.
    Its ambient scalar curvature is $R_g - 2 p Delta t$, its horizontal Ricci tensor is $"Ric"_g - p "Hess" t$,
    and its unit vertical Ricci component is $- p Delta t$. The graph unit normal is $D^(- 1 \/ 2)
    partial_(z \, upright("unit")) - w$ and its second form with this orientation is $- H^f$,
    which has the same quadratic Gauss term as $H^f$. The Gauss equation followed by the conformal law
    consequently gives the exact minimum-point formula
  #[#set math.equation(numbering: n => "(4.21)")
   $ 1 / 2 e^(2 t) R_(hat(g)) =  & 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \)\
 & - p v "tr"_(e^perp) "Hess" t - k "tr"_(A_d) "Hess" t\
lt.eq  & 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) . $ <eq:scalar:minimum-curvature>]
  When $v = 0$, terms using $e$ vanish. In particular all $p' \( d t \)^2$ terms vanish at this point.
  Combining Equations (4.5), (4.19), and (4.21), and using $F = eta f$, yields
  #[#set math.equation(numbering: n => "(4.22)")
   $ u^(- 1) "div" V gt.eq c_1 cal(T) + eta a_w \| d f \| - cal(P)_N \( rho_0 + v rho_1 \) . $ <eq:scalar:minimum-flux>]
  Here are the weights in this estimate. The curvature-independent constraint contribution is $mu -
    R_g \/ 2 = \( tau^2 - \| K \|^2 \) \/ 2$. This, $J \( w \)$, $F tau$,
    and the $\| K \|^2$ error are uniformly bounded on the enlarged core and vanish on the far end,
    so they cost $C rho_0$ pointwise. On the end, $v \| "Ric"_g \| lt.eq C v 𝜚^(- n) lt.eq
    C v rho_1$ because $2 b_1 < n$; the height comparison gives $v F^2 lt.eq C v rho_1$.
    The same statements hold uniformly for $a K$, $0 lt.eq a lt.eq 1$.
    No use of the dominant energy condition in the filling has entered this calculation.
  At $t = - epsilon.alt$ one has $m_0 = 1$. Subtracting the right side of Equation (4.18) from the lower bound in
    Equation (4.22) gives
  $ \( c_1 - delta_0 \) cal(T) + \( 1 - delta_0 \) eta a_w \| d
    f \| + \( C_N - cal(P)_N \) \( rho_0 + v rho_1 \) - rho . $
  Choose $C_N > cal(P)_N + c_(*) + 1$. The expression is strictly positive, contradicting the equation.
    In the second homotopy stage the trace comparison gives $f = 0$:
    a positive maximum or negative minimum contradicts $"tr"_(A_chi) H^f = eta f$.
    Thus $t = Z$, and at a floor minimum the left side of the divergence equation divided by $u$ is $k Delta t
    gt.eq 0$, whereas its right side is $s \( rho - C_N rho_0 \) < 0$ for $s > 0$.
    At $s = 0$, the equation $"div" \( u nabla Z \) = 0$ with zero outer data gives $Z =
    0$ by the maximum principle. This finishes the pointwise exclusion. ◻
]

The lemma excludes the boundary $min t = - epsilon.alt$ of the moving degree domain.
  It does not purport to classify solutions that lie below that domain.
  The uniform height comparisons and the separate outer-face exclusion used in its hypotheses are proved in Section 5.

=== 4.5 Scalar curvature on solutions and height derivatives <scalar-curvature-on-solutions-and-height-derivatives>

On the original exterior, substituting Equation (4.18) into the identity gives

#[#set math.equation(numbering: n => "(4.23)")
 $ 1 / 2 e^(2 t) R_(hat(g)) =  & mu + J \( w \) - rho - h tau + \( 1 - delta_0 \) cal(T) + \( 1 - delta_0 \) eta
   a_w \| d f \|\
 & + m_0 C_N \( rho_0 + v rho_1 \) . $ <eq:scalar:solution-curvature>]

In particular a small fixed height band has a strict scalar margin:
  choose $b_3 > 0$ such that $b_3 \| tau \| lt.eq rho \/ 2$ on the support of $tau$.
  Then $mu - \| J \| - rho - \| h tau \| gt.eq rho \/ 2$ on $\| h \| lt.eq b_3$.
  This is possible since $tau$ is compactly supported and $mu - \| J \| gt.eq 2 rho$ there.

For later use the exact height identities are

#[#set math.equation(numbering: n => "(4.24)")
 $ \| d h \|_(A_d) & = frac(eta \| d f \|, sqrt(D)) lt.eq eta / l \,\
e^(2 t) Delta_(hat(g)) h & = frac(eta, l sqrt(D)) {"div" w + \( k - 1 - p \) w \( t \)} \,\
"div" w & = "tr"_(A_d) H^f + p d thin w \( t \) . $ <eq:scalar:height-derivatives>]

The middle formula follows from $sqrt(D) A_d nabla h = \( eta \/ l \) w$ and the conformal Laplacian law;
  the last follows by differentiating $w = l D^(- 1 \/ 2) nabla f$.
  For an above-floor solution, $l gt.eq ell$, and Proposition 16 therefore implies

#[#set math.equation(numbering: n => "(4.25)")
 $ \| d h \|_(A_d) lt.eq ell^(1 \/ 2) \, wide \| e^(2 t) Delta_(hat(g)) h \| lt.eq
   cal(P)_N ell^(1 \/ 2) \( 1 + sqrt(cal(T)) \) . $ <eq:scalar:height-estimates>]

Indeed $"tr"_(A_d) H^f = "tr" T + d j - "tr"_(A_d) K$ is bounded by $cal(P)_N \( 1 + sqrt(cal(T)) \)$.
  The other potentially large term is $w \( t \) = a_w x$. The prefactor $D^(- 1 \/ 2) =
  sqrt(d)$ converts it to $a_w sqrt(d) thin x$, precisely the weighted quantity controlled by Equation (4.14).
  Thus no inverse power of $d$ is lost. Section 6 uses these estimates to raise the metric inside a compact height band.

=== 4.6 The penalty flux and its ADM normalization <the-penalty-flux-and-its-adm-normalization>

#thm([Proposition 4.4.])[
  (Flux and energy cost).  #emph[Fix $epsilon.alt$ and $N$ as above.
    Suppose a smooth global solution of Equation (4.18) satisfies $t > - epsilon.alt$, $Z lt.eq cal(P)_N$,
    and on the coordinate end
$ f = O_j \( e^(- c_N r) \) \, wide t = O_j \( r^(2 - n) \) \, wide Delta_g t = O \( r^(- n - beta) \) $

 for all required derivative orders, with constants allowed to depend arbitrarily on this fixed $N$.
   These hypotheses will be supplied by Theorem 19. Then
#[#set math.equation(numbering: n => "(4.26)")
 $ frak(F)_N := lim_(r arrow.r oo) integral_(S_r) g \( V \, nu_g \) thin d A_g = integral_(cal(M)_N) u Xi thin d V_g \,\
hat(E) - E = - frac(frak(F)_N, k omega) \, wide frak(F)_N gt.eq - cal(P)_N \( ell + ell^(1 \/ 2) \) \,\
hat(E) lt.eq E + cal(P)_N \( ell + ell^(1 \/ 2) \) . $ <eq:scalar:flux-energy>]

 The polynomial in the error uses only the fixed geometry, the weights, and the explicit parameters,
   not the arbitrary fixed-$N$ derivative constants in the stated end estimates.]
] <prop:scalar:flux>

#proof[
  For fixed $N$, the end hypotheses and Equation (4.4) give
  $ D - 1 = O_j \( e^(- c'_N r) \) \, quad Z - t = O_j \( e^(- c'_N r) \) \, quad V = k nabla t +
    O_N \( r^(3 - 2 n) \) + O \( e^(- c'_N r) \) . $
  The notation $O_N$ here permits arbitrary fixed-$N$ constants.
    Since $N epsilon.alt > 2$ and $t arrow.r 0$, $m_0 = 0$ sufficiently far out.
    There $cal(T) = k s_p \| d t \|^2 + O \( e^(- c'_N r) \)$, so every term in $u Xi$ is integrable:
    the gradient term is $O_N \( r^(2 - 2 n) \)$, and $rho = O \( r^(- n - beta) \)$.
    Smoothness gives integrability on the compact filled core.
    The divergence theorem on exhausting domains has no inner boundary and proves the first equality and existence
    of the flux limit. It also proves existence of $lim integral_(S_r) partial_(nu_g) t$ directly from $Delta_g t
    in L^1$.
  The graph part $l^2 d f^2$ contributes zero to the ADM flux by its exponential decay. The conformal perturbation is
  $ \( e^(2 t) - 1 \) g = 2 t delta + O_1 \( r^(4 - 2 n) \) . $
  The linear ADM integrand of $2 t delta$ is $- 2 k thin partial_i t$;
    the remainder has integrated flux $O \( r^(2 - n) \) arrow.r 0$.
    Euclidean and $g$-normal fluxes differ by the same vanishing order. Thus
  $ hat(E) - E = - omega^(- 1) lim_(r arrow.r oo) integral_(S_r) partial_(nu_g) t thin d A_g = -
    frac(frak(F)_N, k omega) . $
  It remains to bound the negative part of the integral independently of those end constants.
    It is supported in the penalty band $- epsilon.alt < t < - epsilon.alt + 1 \/ N$, where $t < 0$ and $ell lt.eq
    l lt.eq e ell$. Put $sigma = \| d f \|$. Directly from the definitions,
    with constants independent of $N$ on this band,
  #[#set math.equation(numbering: n => "(4.27)")
   $ u lt.eq C \( ell + ell^2 sigma \) \, wide u v lt.eq C ell^2 sigma \, wide u a_w sigma =
     e^(\( k - 1 \) t) l^2 sigma^2 gt.eq c ell^2 sigma^2 . $ <eq:scalar:penalty-weights>]
  For the second estimate use $l sqrt(D) thin v = l^3 sigma^2 \/ sqrt(1 + l^2 sigma^2) lt.eq l^2 sigma$.
    The nonnegative terms $u delta_0 cal(T)$ and $u rho$ may be dropped,
    while the favorable gradient term absorbs the linear $sigma$ terms. More explicitly Young’s inequality gives
  $ C C_N ell^2 sigma \( rho_0 + rho_1 \) lt.eq 1 / 2 delta_0 c eta ell^2 sigma^2 + C' C_N^2 ell^2 /
    eta \( rho_0^2 + rho_1^2 \) . $
  Consequently
  $ frak(F)_N gt.eq - C C_N ell integral rho_0 - C' C_N^2 ell^2 / eta integral \( rho_0^2 + rho_1^2 \) . $
  All integrals use $d V_g$ on $cal(M)_N$. They are bounded by $C \( 1 + N \)$:
    on the end $rho_0$ is integrable and $4 b_1 > n$ makes $rho_1^2$ integrable,
    while on the core the weights are uniformly bounded and its volume is $O \( 1 + N \)$.
    Since $ell^2 \/ eta = ell^(1 \/ 2)$, this proves the polynomial flux estimate.
    For fixed $epsilon.alt > 0$ the resulting error tends to zero as $N arrow.r oo$. ◻
]

Finally, every above-floor solution satisfies the pointwise comparison

#[#set math.equation(numbering: n => "(4.28)")
 $ hat(g) gt.eq e^(- 2 epsilon.alt) g . $ <eq:scalar:metric-domination>]

This comparison and the flux estimate are applied to each smooth solution at fixed $N$.
  They require no limiting elliptic solution as $N arrow.r oo$ and no regularity assertion for a minimizing boundary.

== 5 Solving the filled equations <sec:elliptic:construction>

The metric comparison and the energy estimate from Section 4 become useful only after its two scalar equations
  have a smooth solution. We construct that solution here, on the filled manifold and at fixed prepared data.
  The boundary of a large truncation is a single coordinate sphere; both unknowns vanish there.

The first task is to keep the conformal variable above $-
  epsilon.alt$ and to bound $Z$ without assuming uniform ellipticity.
  The height comparison and the floor calculation give the lower bound.
  Testing the scalar divergence equation on the graph of $f$ then gives a polynomial upper bound for $Z$.
  Together these bounds control the slope and make both scalar equations uniformly elliptic for each fixed $N$.

We next prove the local estimates needed to pass from these bounds to smoothness.
  The gradient-aligned trace equation and the bounded natural-growth divergence equation are treated separately,
  as reusable scalar lemmas. Finally we solve the trace equation for every trial $Z$,
  use it to define a compact map, and obtain a fixed point by two homotopies.
  Exhausting the outer spheres gives the complete solution and the end estimates needed for its ADM flux.
  No regularity theorem for elliptic systems or numerical Penrose inequality enters this construction.

#thm([Theorem 5.1.])[
  (Filled construction).  #emph[Fix smooth prepared data satisfying Equation (2.1) on a complete one-ended
    exterior with nonempty compact smooth boundary. In particular, $K$ is compactly supported, $g - delta =
    O_d \( r^(2 - n) \)$ for every fixed $d$, $R_g = O \( r^(- n - beta) \)$ for some $0 < beta < 1$,
    the dominant-energy margin is bounded below by a positive multiple of $𝜚^(- n - beta)$,
    and every boundary component is strictly future trapped. Fix $0 < epsilon.alt < 1$ and
$ n / 4 < b_1 < min { n - 2 \, n \/ 2 } . $

 Use the filled manifolds $cal(M)_N$, weights $rho_0 \, rho_1 \, rho$, and definitions in Equation (4.3).
   Choose $delta_0 > 0$ and the polynomial $C_N$ as in Lemma 17.
   For all sufficiently large integers $N > k = n - 1$, there are smooth functions $f \,
   Z$ on $cal(M)_N$ solving Equation (4.18). The associated function $t$ satisfies
#[#set math.equation(numbering: n => "(5.1)")
 $ - epsilon.alt < t lt.eq Z lt.eq P \( N \) \, wide ell lt.eq l \( t \) lt.eq e \,
   wide \| f \| + \| d f \|_g lt.eq exp \( P \( N \) \) \, wide ell =
   e^(- N epsilon.alt) . $ <eq:elliptic:polynomial-bounds>]

 Here and below $P$ is a polynomial with coefficients depending only on the fixed prepared data, $n$,
   $epsilon.alt$, and the fixed choices in the filling. The height $h = eta f$, $eta = ell^(3 \/ 2)$, obeys
#[#set math.equation(numbering: n => "(5.2)")
 $ \| h \| lt.eq C \, wide \| h \( x \) \| lt.eq C r \( x \)^(- b_1) quad upright("on the original end") \,
   $ <eq:elliptic:height-bound>]

 where $C$ is independent of $N$. At each fixed $N$, for every integer $j gt.eq
   0$ there are constants $C_(N \, j)$ and $a_N > 0$ such that on that end
#[#set math.equation(numbering: n => "(5.3)")
 $ \| D^j f \| lt.eq C_(N \, j) e^(- a_N r) \, wide t \, Z = O_j \( r^(2 - n) \) \, wide Delta_g t =
   O \( r^(- n - beta) \) . $ <eq:elliptic:end-bounds>]

 The constants in Equation (5.3), and higher derivative bounds on compact sets, may depend arbitrarily on fixed $N$.]
] <thm:elliptic:filled>

For clarity, we specify the homotopies used in the proof.
  On a large outer truncation $cal(M)_(N \, R)$ impose $f = Z = 0$ on its sole boundary $S_R$.
  In the first homotopy replace $K$ everywhere by $K_a = a K$, $0 lt.eq a lt.eq 1$,
  retaining the definitions of $cal(T) \, F \, V$ with that replacement, and put

#[#set math.equation(numbering: n => "(5.4)")
 $ F = eta f \, wide "div" V = u Xi_a \, wide Xi_a = delta_0 \( cal(T) + eta a_w \| d f \| \) + rho -
   m_0 C_N \( rho_0 + v rho_1 \) . $ <eq:elliptic:homotopies>]

The second homotopy keeps $K = 0$ and replaces $Xi_0$ by $s Xi_0$, $0 lt.eq s lt.eq 1$.
  The weights and $C_N$ do not vary in either homotopy. The endpoint $\( a \, s \) = \( 0 \, 1 \)$ is common to
  them. Until the arbitrary-trial problem is introduced, the estimates concern smooth fixed points on a truncation
  with $t gt.eq - epsilon.alt$. The floor will be excluded on the boundary of the degree domain.
  Solvability for arbitrary trials will be established separately, without that restriction.

=== 5.1 Height comparison and the outer floor <height-comparison-and-the-outer-floor>

The trace equation controls the normalized height before any derivative estimate.
  Its end comparison also bounds the outer normal derivative;
  this will prevent the floor from being reached on the truncating sphere.

#thm([Lemma 5.2.])[
  #emph[There are constants $C$ and $r_1$, independent of $N \, R$ and the homotopy parameters,
    such that every smooth solution of the trace equation in Equation (5.4) satisfies
$ \| eta f \| lt.eq C \, wide \| eta f \| lt.eq C \( r^(- b_1) - R^(- b_1) \) quad \( r_1 lt.eq r lt.eq R \) . $

 For each fixed $N$ there is $R_min \( N \)$ such that $R gt.eq R_min \( N \)$ and $Z = 0$ on $S_R$ imply $t > -
   epsilon.alt$ there. The same conclusions hold in the second homotopy, where in fact $f = 0$.]
] <lem:elliptic:height>

#proof[
  At a positive maximum of $f$, $d f = 0$, $A_chi = I$, and
  $ eta f = "tr" K_a + l Delta_g f lt.eq "tr" K_a . $
  The negative minimum gives the reverse bound. The tensor fields in the filling have a common pointwise bound,
    including along the product necks, so this proves the first assertion uniformly.
    If $K = 0$, both comparisons give $f = 0$.
  On the end $K_a = 0$. At a point of contact with $H \( r \) = C \( r^(- b_1) - R^(- b_1) \)$,
    considered as a test for $h = eta f$, the two gradients agree.
    Thus the axial direction of $A_chi$ is the radial direction. In the Euclidean metric the Hessian contraction is
  $ A_chi : "Hess" H = C b_1 r^(- b_1 - 2) #scale(x: 120%, y: 120%)[\(] \( b_1 + 1 \) chi -
    k #scale(x: 120%, y: 120%)[\)] . $
  The error from $g - delta = O_2 \( r^(2 - n) \)$ has absolute value at most $C' r^(2 - n) C b_1 r^(- b_1 - 2)$,
    uniformly for $0 < chi lt.eq 1$. Since $b_1 + 1 < k$, the contraction is strictly negative for $r gt.eq r_1$,
    with $r_1$ independent of $N$. The height equation is
  $ A_chi : "Hess" h = frac(eta sqrt(D), l) thin h . $
  Consequently $H$ and $- H$ are respectively an upper and a lower comparison function.
    For $R gt.eq 2 r_1$, their constant $C$ can be chosen to dominate the already established height bound on
    $S_(r_1)$. The maximum principle then proves the displayed end estimate.
  Taking the one-sided derivative at the outer zero boundary gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| d f \|_(S_R) lt.eq C eta^(- 1) R^(- b_1 - 1) . $ <eq:elliptic:outer-gradient>]
  Tangential derivatives vanish there. For all real $t$ we have $l \( t \) lt.eq e$.
    The identity $Z = t + \( 2 k \)^(- 1) log \( 1 + l \( t \)^2 \| d f \|^2 \)$ therefore gives, on $S_R$,
  $ 0 gt.eq t gt.eq - frac(1, 2 k) log #scale(x: 120%, y: 120%)[\(] 1 +
    e^2 C^2 eta^(- 2) R^(- 2 b_1 - 2) #scale(x: 120%, y: 120%)[\)] . $
  Choosing $R_min \( N \)$ sufficiently large proves the assertion. ◻
]

Together, Lemmas 20 and 17 exclude every fixed point with $min t = - epsilon.alt$.
  The height lemma supplies the bounds assumed by the scalar floor lemma and excludes the outer sphere by
  Equation (5.5). The scalar floor lemma then excludes an interior minimum in either homotopy.
  These exclusions concern the boundary of the degree domain;
  they make no assertion about solutions whose minima lie strictly below $- epsilon.alt$.

=== 5.2 A polynomial upper bound before ellipticity <a-polynomial-upper-bound-before-ellipticity>

Above the floor, the implicit relation expresses the metric distortion directly in terms of $Z$.
  We therefore need an upper bound for this single scalar quantity.
  The proof first bounds its high-level mass, then combines a graph Sobolev inequality with exponential testing.
  The bound for $Z$ must be polynomial in $N$: the enclosure argument in Section 6 needs metric distortion at most
  $exp \( P \( N \) \)$ while $N$ increases.

#thm([Proposition 5.3.])[
  #emph[Every smooth fixed point on $cal(M)_(N \, R)$ with $t gt.eq - epsilon.alt$ satisfies Equation (5.1),
    with the same polynomial bounds for all $R gt.eq R_min \( N \)$ and all homotopy parameters.]
] <prop:elliptic:upper>

#proof[
  Write $sigma = \| d f \|$, $B = K_a \( w \, dot.op \)$, $A = A_chi$, and
  $ d mu_D = sqrt(D) thin d V_g \, wide W = e^(\( k - 1 \) t) l \, wide u = W sqrt(D) = l e^(k Z - t) . $
  The floor already implies
  #[#set math.equation(numbering: n => "(5.6)")
   $ ell lt.eq l lt.eq e \, quad t lt.eq Z \, quad D = e^(2 k \( Z - t \)) \, quad sigma lt.eq
     ell^(- 1) e^(k \( Z + epsilon.alt \)) . $ <eq:elliptic:elementary-distortion>]
  Only the upper bound for $Z$ remains to be proved.
  #emph[High levels.] On the support of $m_0$, the floor implies $- epsilon.alt lt.eq t lt.eq - epsilon.alt +
    N^(- 1)$ and $l asymp ell$. In particular,
  $ eta a_w sigma = eta / l \( sqrt(D) - D^(- 1 \/ 2) \) . $
  The weights are bounded above uniformly, and $C_N$ is polynomial.
    It follows from $D = e^(2 k \( Z - t \))$ that there is a positive polynomial threshold $Z_0 = P \( N \)$ such that
  #[#set math.equation(numbering: n => "(5.7)")
   $ Xi_a gt.eq delta_0 cal(T) + rho + delta_0 / 2 eta a_w sigma quad
     upright("when ") Z > Z_0 . $ <eq:elliptic:high-source>]
  For example, it suffices that $e^(k Z_0) gt.eq C \( 1 + C_N \) eta^(- 1)$, after increasing the fixed constant;
    its logarithm has polynomial size. Away from the support of $m_0$ the inequality is immediate.
  Choose a smooth nondecreasing $zeta$ that vanishes on $\( - oo \, Z_0 \]$ and equals one on
    $\[ Z_0 + 1 \, oo \)$, with $0 lt.eq zeta' lt.eq C$. Testing the divergence equation with $zeta \( Z \)$ gives
  $ integral zeta \( Z \) u Xi_a = - integral zeta' \( Z \) u { k \| d Z \|_A^2 + chevron.l B \,
    d Z chevron.r_A } lt.eq C integral_({ Z_0 < Z < Z_0 + 1 } ∩ "supp" K) u \| K \|^2 . $
  The integration has no boundary term since $Z = 0 < Z_0$ on $S_R$.
    On the last strip $u = l e^(k Z - t) lt.eq exp \( P \( N \) \)$.
    The support of $K$ consists of a fixed exterior compact set and the enlarged filling;
    it has volume $O \( 1 + N \)$. Thus
  #[#set math.equation(numbering: n => "(5.8)")
   $ integral_({ Z > Z_0 + 1 }) u \( delta_0 cal(T) + rho + 1 / 2 delta_0 eta a_w sigma \) thin d V_g lt.eq
     exp \( P \( N \) \) . $ <eq:elliptic:high-integral>]
  This estimate uses no upper bound for $sigma$. It controls the high levels of $Z$ with exactly the volume and
    slope weights needed on the graph. We next convert it into the initial integrability for an iteration on fixed
    base patches.
  Fix $0 < alpha lt.eq k - 1$, independent of $N$. Cover the enlarged core and a fixed extra end annulus by base
    coordinate patches of uniformly controlled size and geometry.
    The number of patches is $O \( 1 + N \)$, and $rho$ has a uniform positive lower bound on them.
    We claim that on each such patch $Q$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ integral_Q e^(alpha Z) thin d mu_D lt.eq exp \( P \( N \) \) . $ <eq:elliptic:initial-integral>]
  Below $Z_0 + 1$, Equation (5.6) proves this directly. Above that level, when $D lt.eq 2$ use
  $ frac(e^(alpha Z) sqrt(D), u) = l^(- 1) e^(\( alpha - k + 1 \) t) D^(alpha \/ \( 2 k \)) lt.eq
    exp \( P \( N \) \) . $
  When $D gt.eq 2$, use instead
  $ u eta a_w sigma = eta e^(\( k - 1 \) t) \( D - 1 \) \, wide e^(alpha Z) sqrt(D) =
    e^(alpha t) D^(1 \/ 2 + alpha \/ \( 2 k \)) . $
  The ratio of the second expression to the first is at most $C eta^(- 1) e^(\( alpha - k + 1 \) t) lt.eq
    exp \( P \( N \) \)$ because $1 \/ 2 + alpha \/ \( 2 k \) lt.eq 1$ and $t gt.eq - epsilon.alt$.
    Equation (5.8) proves the claim.
  #emph[Sobolev inequality on the product graph.] We use the ordinary graph of $f$ in
    $\( Q times bb(R) \, g + d z^2 \)$ so that its ambient geometry depends only on the fixed background patch.
    The warp $l \( t \)$ has no a priori derivative bound yet.
    We compare the ordinary graph’s measure and inverse metric with $d mu_D$ and $A$,
    and use $cal(T)$ to control its mean curvature. The ordinary graph has measure and inverse metric
  $ sqrt(1 + sigma^2) thin d V_g \, wide A_(*) = I - frac(d f ⊗ d f, 1 + sigma^2) . $
  The ratios of $D$ and $1 + sigma^2$ lie between $exp \( - P \( N \) \)$ and $exp \( P \( N \) \)$,
    even when $sigma$ is unbounded. The axial eigenvalues $d$ and $chi =
    k d \/ \( k + p v \)$ differ by at most a factor $1 + N \/ k$.
    Thus these graph norms compare with $d mu_D$ and $A$ with factors $exp \( P \( N \) \)$.
  Its mean curvature is $\( 1 + sigma^2 \)^(- 1 \/ 2) "tr"_(A_(*)) "Hess" f$.
    Write $K_a + H^f$ in its transverse and axial blocks. The transverse contraction is controlled by $\| T \|$,
    and the axial coefficient of $A_(*)$ is at most $e^2 d$. Also $sqrt(D) \/ \( l sqrt(1 + sigma^2) \) lt.eq
    exp \( P \( N \) \)$. Proposition 16 therefore gives
  $ \| H_(upright("graph")) \| lt.eq exp \( P \( N \) \) \( 1 + sqrt(cal(T)) \) . $
  Extend the metric of a slightly larger fixed base patch to a closed manifold and use Nash’s smooth isometric
    embedding theorem #cite(label("Nash1956")); then take its product with the line.
    The additional second fundamental form is uniformly bounded.
    Such embeddings can be chosen from finitely many fixed models for the cap, transitions, and product necks.
    The Michael–Simon inequality #cite(label("MichaelSimon1973")),
    in the formulation of #cite(label("SimonGMT")) Chapter 4, Section 6, Theorem 6.7,
    applied to compactly supported functions on this smooth $n$-dimensional graph, then gives,
    after its usual $L^1$ to $L^2$ conversion,
  #[#set math.equation(numbering: n => "(5.10)")
   $ (integral \| phi \|^(2 kappa_n) thin d mu_D)^(1 \/ kappa_n) lt.eq
     exp \( P \( N \) \) integral #scale(x: 120%, y: 120%)[\(] \| d phi \|_A^2 + \( 1 + cal(T) \) phi^2
     #scale(x: 120%, y: 120%)[\)] thin d mu_D \, wide kappa_n = frac(n, n - 2) . $ <eq:elliptic:graph-sobolev>]
  To see the conversion explicitly, apply the $L^1$ inequality to $\|
    phi \|^(2 \( n - 1 \) \/ \( n - 2 \))$ and use Cauchy–Schwarz on its derivative and mean-curvature terms.
    The resulting common $L^(2 n \/ \( n - 2 \))$ factor cancels.
    No bound for the height or area of the graph is required.
  #emph[Exponential testing.] The graph inequality still contains $cal(T)$ on its right side.
    The divergence equation controls that term together with the gradient of an exponential of $Z$;
    this is the estimate that closes the iteration. Globally $Xi_a gt.eq delta_0 cal(T) - P \( N \)$.
    Let $psi$ be a base cutoff compactly supported in $Q$ and test the equation with $psi^2 e^(2 q Z) \/ W$.
    Put $beta_W = d log W = \( k - 1 + p \) d t$. Since $A lt.eq A_d$,
    scalar coercivity gives $\| beta_W \|_A^2 lt.eq P \( N \) cal(T)$. Integration by parts yields exactly
  $ integral psi^2 e^(2 q Z) Xi_a thin d mu_D = - integral e^(2 q Z) #scale(x: 120%, y: 120%)[\(] 2 q psi^2 d Z -
    psi^2 beta_W + 2 psi d psi #scale(x: 120%, y: 120%)[\)] dot.op A \( k d Z + B \) thin d mu_D . $
  Young’s inequality bounds the $beta_W dot.op A thin d Z$ term by $delta_0 cal(T) \/ 8 +
    P \( N \) \| d Z \|_A^2$, the $beta_W dot.op A B$ term by $delta_0 cal(T) \/ 8 + P \( N \)$,
    and the $q B dot.op A thin d Z$ term by a fixed fraction of $k q \| d Z \|_A^2 + C q$.
    The cutoff terms cost a further fixed fraction of that gradient term and
    $P \( N \) \( psi^2 + \| d psi \|^2 \)$. Consequently there is a polynomial $q_(*) \( N \) gt.eq max { 1 \,
    alpha }$ such that, for $q gt.eq q_(*) \( N \)$,
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral e^(2 q Z) psi^2 \( cal(T) + q \| d Z \|_A^2 \) thin d mu_D lt.eq
     P \( N \) \( 1 + q \) integral e^(2 q Z) \( psi^2 + \| d psi \|_g^2 \) thin d mu_D .
     $ <eq:elliptic:exponential-energy>]
  Only $d t$ occurs in this test; it does not differentiate $p$.
  Apply Equation (5.10) with $phi = psi e^(q Z)$ and then use Equation (5.11).
    For nested base patches $Q' subset.double Q$ separated by a coordinate distance $b lt.eq 1$, this gives
  $ parallel e^Z parallel_(2 kappa_n q \, Q') lt.eq #scale(x: 120%, y: 120%)[\[] e^(P \( N \)) \( 1 + q \)^2
    b^(- 2) #scale(x: 120%, y: 120%)[\]]^(1 \/ \( 2 q \)) parallel e^Z parallel_(2 q \, Q) . $
  All norms here use $d mu_D$. Iterate with $q_i = kappa_n^i q_(*)$ and geometrically decreasing patch gaps.
    The sums of $q_i^(- 1)$ and $i q_i^(- 1)$ converge, so
  #[#set math.equation(numbering: n => "(5.12)")
   $ sup_(Q') e^Z lt.eq e^(P \( N \)) b^(- C) parallel e^Z parallel_(2 q_(*) \, Q) \, $ <eq:elliptic:moser-output>]
  where $C$ is independent of $N$.
  Finally interpolate the norm on the right with Equation (5.9):
  $ parallel e^Z parallel_(2 q_(*) \, Q) lt.eq #scale(x: 120%, y: 120%)[\(] sup_Q e^Z
    #scale(x: 120%, y: 120%)[\)]^theta e^(P \( N \)) \, wide theta = 1 - frac(alpha, 2 q_(*)) < 1 . $
  Choose expanding patches $Q_j$, all inside one fixed larger patch, with gaps comparable to $2^(- j)$.
    The logarithms $M_j = log sup_(Q_j) e^Z$ satisfy $M_j lt.eq theta M_(j + 1) + P \( N \) + C j$. Iteration gives
  $ M_0 lt.eq theta^m M_m + sum_(j = 0)^(m - 1) theta^j \( P \( N \) + C j \) lt.eq theta^m M_m + P \( N \) . $
  The last polynomial is justified by $\( 1 - theta \)^(- 1) = 2 q_(*) \/ alpha lt.eq P \( N \)$.
    For each individual smooth solution the suprema on the largest patch are finite,
    so the first term tends to zero. We have proved $Z lt.eq P \( N \)$ on the enlarged core and the drift
    support. A larger maximum outside that set would have $K_a = 0$, $d Z = 0$, and, by Equation (5.7),
    $Xi_a > 0$; at the same point $u^(- 1) "div" \( k u A nabla Z \) = k A : "Hess" Z lt.eq 0$, a contradiction.
  For the second homotopy $f = 0$. A positive maximum above the penalty band has right side $s rho > 0$ if $s >
    0$, which is impossible. When $s = 0$ the solution is zero. This proves its upper bound as well.
    Equation (5.6) and the height bound prove the remaining bounds in Equation (5.1). In particular,
  $ d gt.eq e^(- 2 k \( P \( N \) + epsilon.alt \)) \, wide chi gt.eq
    frac(k, k + N) e^(- 2 k \( P \( N \) + epsilon.alt \)) . $
  The same bounds give positive upper and lower bounds for $u$ at each fixed $N$.
    Thus both $A_chi$ and $k u A_chi$ are uniformly elliptic,
    with constants independent of the truncating radius and the homotopy parameter.
    These are the ellipticity bounds used in the following scalar estimates. ◻
]

=== 5.3 A scalar gradient estimate with a measurable axial coefficient <a-scalar-gradient-estimate-with-a-measurable-axial-coefficient>

The upper bound has made both scalar equations uniformly elliptic at each fixed $N$.
  Regularity still has to pass between them in a specific order. Dividing the trace equation by $l \/ sqrt(D)$ gives

$ A_chi : "Hess"_g f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] eta f -
  "tr"_(A_chi) K_a #scale(x: 120%, y: 120%)[\)] . $

Its right side and $D f$ are bounded, but its coefficients depend on $Z$, for which we have no continuity modulus.
  Schauder theory does not yet apply.

The gradient direction accounts for the matrix structure;
  the remaining unknown eigenvalue $chi$ can be treated as merely measurable.
  The next lemma gives both a Hölder bound for $D f$ and a local mass bound for $\| D^2 f \|^2$.
  This second conclusion is needed because the divergence source for $Z$ contains $\| D^2 f \|^2$:
  the mass bound will give Hölder continuity of $Z$ through the following scalar lemma.
  Once both $Z$ and $D f$ have a modulus, scalar Schauder estimates can begin.
  All constants in this regularity argument may depend arbitrarily on fixed $N$;
  the bounds needed as $N$ increases were established above.

We prove the gradient estimate in two regimes. Strict rank-one absorption first gives $W^(2 \, s)$ control for
  some $s > 2$. A trace-reversed Hessian flux then shows that either the gradient norm drops on a smaller ball or
  the solution is close to an affine function with nonzero gradient.
  In the latter regime we freeze the direction while retaining the measurable axial coefficient;
  the axial derivative satisfies a scalar divergence equation.
  Iterating these two alternatives gives gradient continuity and the required Hessian mass bound.

#thm([Lemma 5.4.])[
  (Gradient-aligned rank-one equation).  #emph[Let $n gt.eq 3$ and $0 < c lt.eq 1$.
    Let $Q$ be a smooth metric coordinate ball, or a smooth half-ball with constant Dirichlet data on its face.
    Suppose that $u$ is $C^2$ up to the face and satisfies almost everywhere
#[#set math.equation(numbering: n => "(5.13)")
 $ A : "Hess"_g u = G \, wide A = "id" - \( 1 - chi \) e ⊗ e \, wide c lt.eq chi lt.eq 1 \, wide e =
   frac(nabla_g u, \| nabla_g u \|_g) quad upright("where ") nabla_g u eq.not 0 . $ <eq:elliptic:rankone-equation>]

 At a zero of the gradient, $e$ may be any measurable unit vector. Assume $\| nabla_g u \|_g + \| G \| lt.eq M$.
   On every smaller ball, including its portion of the Dirichlet face, there are estimates
#[#set math.equation(numbering: n => "(5.14)")
 $ \[ D u \]_(C^alpha) lt.eq C \, wide integral_(B_r \( x \) ∩ Q) \| "Hess"_g u \|_g^2 thin d V_g lt.eq
   C r^(n - 2 + 2 alpha) . $ <eq:elliptic:rankone-conclusion>]

 Here $alpha in \( 0 \, 1 \)$ depends only on $n \, c$, and $C$ depends on $n \, c \, M$,
   the fixed coordinate geometry and the distance from the other chart boundaries.
   No modulus of continuity of $chi$ enters these constants.]
] <lem:elliptic:gradient>

#proof[
  We use only the scalar linear De Giorgi–Nash and weak Harnack estimates,
    the Krylov–Safonov interior estimate for strong nondivergence solutions,
    and the Euclidean Hessian estimates of Calderón and Zygmund; see #cite(label("GilbargTrudinger")).
    The two structural arguments needed to apply these results are proved below.
    All coordinate norms of matrices use the Frobenius norm unless indicated otherwise.
  #emph[1. A Hessian estimate with a strict absorption margin.] Normalize the metric at the center of a chart.
    The coordinate principal matrix is
  $ a^(i j) = g^(i j) - \( 1 - chi \) e^i e^j . $
  If $g = I$, then $\| I - a \| = 1 - chi lt.eq 1 - c$. Consequently, on a sufficiently small chart,
    depending only on $c$ and the metric modulus,
  #[#set math.equation(numbering: n => "(5.15)")
   $ \| I - a \| lt.eq 1 - c / 2 . $ <eq:elliptic:cordes-margin>]
  This remains true for the reflected metrics used below, since they are continuous and uniformly Lipschitz.
    In particular this assertion places no condition on the oscillation of $e$ or $chi$.
  Let $cal(R) = D^2 Delta^(- 1)$ on $bb(R)^n$, with its matrix-valued range given the Frobenius norm.
    Plancherel’s identity gives $parallel cal(R) parallel_(L^2 arrow.r L^2) = 1$.
    Its $L^4$ norm is finite by the Calderón–Zygmund theorem.
    Interpolation therefore supplies $s_0 > 2$, depending only on $n \, c$, such that
  $ parallel cal(R) parallel_(L^s arrow.r L^s) \( 1 - c \/ 2 \) < 1 \, wide 2 lt.eq s lt.eq s_0 . $
  For a compactly supported $v$ the identity $Delta v = a : D^2 v + \( I - a \) : D^2 v$ now gives, by absorption,
  $ parallel D^2 v parallel_(L^s) lt.eq C parallel a : D^2 v parallel_(L^s) \, wide s = 2 \, s_0 . $
  Cutoffs, first-derivative interpolation and absorption on nested balls give the local version
  #[#set math.equation(numbering: n => "(5.16)")
   $ parallel D^2 v parallel_(L^s \( B_(r \/ 2) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel a :
     D^2 v parallel_(L^s \( B_r \)) + r^(- 2) parallel v parallel_(L^s \( B_r \)) #scale(x: 120%, y: 120%)[\)] \,
     wide s = 2 \, s_0 . $ <eq:elliptic:cordes-local>]
  For completeness, let $psi$ be a smooth cutoff for the nested balls.
    Applying the compact-support estimate to $psi v$ first produces an additional $\( t - rho \)^(- 1) parallel D
    v parallel_(L^s \( B_t \))$ on $B_rho subset.double B_t$.
    The interpolation estimate on a slightly larger ball bounds this by $epsilon parallel D^2 v
    parallel_(L^s)$ plus $C epsilon^(- 1) \( t - rho \)^(- 2) parallel v parallel_(L^s)$,
    with the scale factors absorbed into $epsilon$. Choose the coefficient of the first term smaller than the
    square of the geometric ratio of the successive gaps, and sum over increasing nested radii.
    The resulting geometric series is exactly Equation (5.16).
    These estimates initially apply to the individually finite Sobolev norms of the functions under consideration
    and then, by approximation, to $W^(2 \, s)$ functions.
  #emph[2. The exact flux and the constant-value reflection.] Write $P = nabla_g u$, $H = "Hess"_g u$,
    and $q = \| P \|_g^2 \/ 2$. The equation implies $Delta_g u = \( 1 - chi \) H \( e \, e \) + G$.
    Since $nabla_g q = H^sharp P$, it gives the pointwise identity
  #[#set math.equation(numbering: n => "(5.17)")
   $ A nabla_g q - G P = #scale(x: 120%, y: 120%)[\(] H^sharp - \( Delta_g u \) "id" #scale(x: 120%, y: 120%)[\)]
     P = : cal(F) . $ <eq:elliptic:trace-reversed-flux>]
  Both sides vanish when $P = 0$, so no choice of axis at those points affects this identity.
    For smooth $u$, commuting third derivatives gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ "div"_g cal(F) = \| H \|_g^2 - \( Delta_g u \)^2 + "Ric"_g \( P \, P \) .
     $ <eq:elliptic:trace-reversed-divergence>]
  For $C^2$ functions the same formula holds distributionally:
    approximate $u$ in $C^2$ on compact subsets of each original smooth side.
    The flux and the right side converge uniformly, so integration against a smooth compactly supported test
    function passes to the limit. This argument establishes only the geometric divergence identity;
    the algebraic Equation (5.17) is applied to the original solution,
    and no approximant is required to solve the equation. Neither identity differentiates $chi$.
  Put $gamma = 1 - \( 1 - c \)^2 > 0$. Young’s inequality, with the gap $gamma \/ 2$, gives
  $ \( \( 1 - chi \) H \( e \, e \) + G \)^2 lt.eq \( 1 - gamma \/ 2 \) \| H \|_g^2 + C_c G^2 . $
  Thus, when $\| P \|_g lt.eq 1$ and $s = 1 - \| P \|_g^2 gt.eq 0$,
  #[#set math.equation(numbering: n => "(5.19)")
   $ "div"_g \( A nabla_g s + 2 G P \) lt.eq - gamma \| H \|_g^2 + C_c G^2 +
     2 \| "Ric"_g \|_g . $ <eq:elliptic:gradient-deficit>]
  We record precisely how this inequality is used at the face.
    Subtract the constant boundary value and take Gaussian coordinates $g = d t^2 +
    h_(a b) \( y \, t \) thin d y^a d y^b$ on $t gt.eq 0$. Extend $u$ oddly and $h$ evenly across $t = 0$,
    and extend $chi$ evenly and $G$ oddly. The reflected equation holds almost everywhere.
    Tangential derivatives of $u$ vanish on the face, while the normal derivative agrees from both sides.
    Therefore $u$ is $C^1$ after reflection and belongs locally to $W^(2 \, s)$ for every finite $s$ individually.
    The metric is Lipschitz, smooth on either side, and $s$ is a continuous $W^(1 \, 2)$ function.
  Let $J = sqrt(det g)$ and define the face mean curvature using the normal $+ partial_t$ by
  $ kappa \( y \) = 1 / 2 h^(a b) \( y \, 0 \) partial_t h_(a b) \( y \, 0 + \) \, wide p \( y \) = u_t \( y \, 0 \) . $
  On the upper side, $H_(a b) = 1 / 2 \( partial_t h_(a b) \) p$ and hence $cal(F)_(+)^t = - kappa p^2$.
    On the lower side the signs of these tangential Hessians reverse and $cal(F)_(-)^t = kappa p^2$.
    Since $J$ is continuous across the face, the density-valued flux $J \( A nabla_g s + 2 G P \) = -
    2 J cal(F)$ has normal jump
  $ j \( y \) = 4 J \( y \, 0 \) kappa \( y \) p \( y \)^2 . $
  Adding the coordinate vector
  #[#set math.equation(numbering: n => "(5.20)")
   $ B_(upright("face")) \( y \, t \) = - j \( y \) upright(bold(1))_({ t > 0 }) partial_t $ <eq:elliptic:face-step>]
  cancels that interface measure exactly. Indeed its coordinate divergence is $- j \( y \) delta_({ t = 0 })$;
    no derivative in $y$ occurs, because the vector has only a $t$ component.
    Its $L^oo$ norm is at most $C parallel kappa parallel_oo$ under the gradient normalization.
    All these statements are local, so the coefficient $j \( y \)$ only needs to be extended constantly in the
    normal direction over the chart.
  On a normalized unit ball let the metric oscillation, Christoffel symbols, smooth-side curvature,
    face second fundamental form if present, and forcing be at most $epsilon$.
    The reflected and interior cases then both give the distributional inequality
  #[#set math.equation(numbering: n => "(5.21)")
   $ "div" \( a_1 D s + B_1 \) lt.eq - gamma_1 \| H \|_g^2 + C epsilon \, wide a_1^(i j) = J a^(i j) \, wide
     parallel B_1 parallel_oo lt.eq C epsilon \, $ <eq:elliptic:deficit-coordinate>]
  where $B_1^i = 2 J G P^i + B_(upright("face"))^i$ and $gamma_1 > 0$ is fixed.
    The matrix $a_1$ is symmetric and uniformly elliptic with fixed constants.
    The face can be absent or can be a plane at any position in the ball.
  #emph[3. Gradient-norm drop or approximation by a nonzero affine function.] Fix $r_(*) in \( 0 \, 1 \/ 32 \)$.
    For every $b_(*) > 0$ there are $k_(*) in \( r_(*) \, 1 \)$ and $epsilon_(*) > 0$ with the following property.
    Suppose that $\| nabla_g u \|_g lt.eq 1$ on $B_1$, the normalized geometric and forcing errors just listed are
    at most $epsilon_(*)$, and $u \( 0 \) = 0$. Then either
  #[#set math.equation(numbering: n => "(5.22)")
   $ sup_(B_(r_(*))) \| nabla_g u \|_g lt.eq k_(*) \, $ <eq:elliptic:norm-drop>]
  or there is an affine $L$ such that
  #[#set math.equation(numbering: n => "(5.23)")
   $ 1 / 2 lt.eq \| D L \| lt.eq 2 \, wide sup_(B_(r_(*))) \| u - L \| lt.eq b_(*) r_(*) . $ <eq:elliptic:affine-entry>]
  Here is the compactness argument with its energy step. Otherwise choose a sequence with errors tending to zero,
    no approximation in Equation (5.23), and gradient supremum tending to one on $B_(r_(*))$.
    Its functions are uniformly Lipschitz and vanish at zero. Equation (5.16), applied to
  $ a : D^2 u = G + a^(i j) Gamma_(i j)^ell u_ell \, $
  gives uniform local $L^2$ bounds for $D^2 u$, hence for $H$ and $D s$.
    The weak Harnack inequality applies to the nonnegative weak supersolution $s$ in Equation (5.21) after
    discarding the negative Hessian term. It gives, for some $p_0 > 0$,
  $ (frac(1, \| B_(1 \/ 3) \|) integral_(B_(1 \/ 3)) s^(p_0))^(1 \/ p_0) lt.eq
    C (inf_(B_(1 \/ 3)) s + parallel B_1 parallel_oo + epsilon) arrow.r 0 . $
  The infimum tends to zero because $B_(r_(*)) subset B_(1 \/ 3)$ and the gradient supremum there tends to one.
    Thus $s arrow.r 0$ in measure locally.
  To recover the Hessian energy, take a compactly supported cutoff $psi$ in $B_(1 \/ 3)$ and test the same
    inequality with $psi^2 \( b - s \)_(+)$, where $0 < b < 1$ is fixed. Its weak form is
  $ integral \( a_1 D s + B_1 \) dot.op D phi gt.eq gamma_1 integral \| H \|_g^2 phi - C epsilon integral phi \,
    wide phi gt.eq 0 . $
  Dropping the nonnegative Hessian term, expanding the test derivative and using Young’s inequality proves
  #[#set math.equation(numbering: n => "(5.24)")
   $ integral_({ s < b }) psi^2 \| D s \|^2 lt.eq C_psi b^2 + C_psi parallel B_1 parallel_oo^2 +
     C_psi b parallel B_1 parallel_oo + C_psi epsilon b . $ <eq:elliptic:lower-truncation>]
  On a fixed compact subset, the integral of $\| D s \|$ over ${ s < b }$ has limsup at most $C b$.
    Its integral over ${ s gt.eq b }$ tends to zero by the uniform $L^2$ bound for $D
    s$ and convergence in measure of $s$. Letting $b arrow.b 0$ yields $D s arrow.r 0$ locally in $L^1$.
    Testing Equation (5.21) with a fixed nonnegative smooth cutoff now yields $H arrow.r 0$ locally in $L^2$.
    Since $Gamma arrow.r 0$ and $D u$ is bounded, also $D^2 u arrow.r 0$ locally in $L^2$.
  Uniform Lipschitz compactness produces a locally uniform limit.
    Its distributional Hessian vanishes, so it is affine. Poincaré’s inequality and $D^2 u arrow.r
    0$ give convergence of the gradients to its slope in local $L^2$.
    Since $s arrow.r 0$ in measure and $g arrow.r I$, that slope has norm one.
    This contradicts the failure of Equation (5.23) and proves the dichotomy.
    Increasing $k_(*)$ if necessary ensures $r_(*) < k_(*) < 1$.
  Repeated gradient-norm drops will give decay directly. To handle the other alternative,
    we next improve approximation by a nonzero affine function.
    Its fixed slope determines the direction to freeze; the axial eigenvalue remains measurable throughout this
    argument.
  #emph[4. The frozen-axis linear equation.] Let $e_0$ be a fixed Euclidean unit vector.
    We first prove the quantitative statement
  #[#set math.equation(numbering: n => "(5.25)")
   $ parallel Y_0 parallel_(C^(1 \, alpha_1) \( B_(1 \/ 2) \)) lt.eq
     C parallel Y_0 parallel_(W^(2 \, 2) \( B_1 \)) quad upright("if") quad Delta_(e_0^perp) Y_0 +
     chi partial_(e_0)^2 Y_0 = 0 med upright("a.e. in ") B_1 \, $ <eq:elliptic:frozen-axis-estimate>]
  for $Y_0 in W^(2 \, 2)$ and arbitrary measurable $c lt.eq chi lt.eq 1$.
    Rotate so that $e_0 = partial_n$ and put $w = partial_n Y_0 in W^(1 \, 2)$.
    Differentiating the displayed equation only in the sense of distributions gives exactly
  #[#set math.equation(numbering: n => "(5.26)")
   $ sum_(a < n) partial_a^2 w + partial_n \( chi partial_n w \) = 0 \, quad upright("or") quad
     "div" #scale(x: 120%, y: 120%)[\(] \( I - e_0 ⊗ e_0 + chi e_0 ⊗ e_0 \) D w #scale(x: 120%, y: 120%)[\)] =
     0 . $ <eq:elliptic:frozen-derivative-divergence>]
  This is a scalar divergence equation for a $W^(1 \, 2)$ weak solution with a measurable uniformly elliptic
    matrix. The De Giorgi–Nash estimate gives $w in C^(alpha_1)$ on smaller balls, for a fixed $0 < alpha_1 < 1$,
    quantitatively in its $L^2$ norm. Testing with $psi^2 \( w - w \( x \) \)$,
    where $psi$ is a cutoff on the ball, and using that Hölder bound gives, uniformly for balls in a smaller fixed ball,
  #[#set math.equation(numbering: n => "(5.27)")
   $ integral_(B_r \( x \)) \| D w \|^2 lt.eq C r^(n - 2 + 2 alpha_1) . $ <eq:elliptic:frozen-derivative-morrey>]
  The ordinary Laplacian of $Y_0$ is $f = \( 1 - chi \) partial_n w$. By Cauchy–Schwarz,
  #[#set math.equation(numbering: n => "(5.28)")
   $ integral_(B_r \( x \)) \| f \| lt.eq C r^(n - 1 + alpha_1) . $ <eq:elliptic:frozen-source-mass>]
  Here is why this controls every component of $D Y_0$. Cut $f$ off on an intermediate ball and form its Newton
    potential $V$. For two points at distance $r$ in a smaller ball,
    the part of $D V$ within distance $2 r$ of either point is bounded by
  $ C sum_(j gt.eq 0) \( 2^(- j) r \)^(1 - n) \( 2^(- j) r \)^(n - 1 + alpha_1) lt.eq C r^(alpha_1) . $
  For distances $R gt.eq 2 r$, the difference of the two gradient kernels is at most $C r R^(- n)$.
    Summing over dyadic annuli and using Equation (5.28) gives
  $ C r sum_(r lt.eq R lt.eq 1) R^(alpha_1 - 1) lt.eq C r^(alpha_1) . $
  The farther part is bounded by the total $L^1$ norm of $f$ and contributes $O \( r \)$.
    The same estimates show that $V \, D V$ are bounded. The difference $Y_0 - V$ is harmonic on the smaller ball,
    so interior harmonic estimates control its gradient and its gradient Hölder norm by its $L^2$ norm.
    Together with the initial $W^(2 \, 2)$ bound this proves Equation (5.25).
    Taking slightly nested balls in this argument yields the stated $B_(1 \/ 2)$ estimate.
  #emph[5. Improvement near a nonzero affine function.] Fix a universal gradient bound,
    say $\| nabla_g u \|_g lt.eq 4$. There are $alpha_2 in \( 0 \, alpha_1 \)$,
    $lambda in \( 0 \, 1 \/ 8 \)$ and small $b_0 \, delta > 0$, depending only on $n \, c$,
    with the following property. If $L$ is affine and
  #[#set math.equation(numbering: n => "(5.29)")
   $ 1 / 4 lt.eq \| D L \| lt.eq 4 \, wide parallel u - L parallel_(L^oo \( B_1 \)) lt.eq b \, quad 0 < b lt.eq
     b_0 \, wide parallel g - I parallel_oo + parallel Gamma parallel_oo + parallel G parallel_oo lt.eq b delta \,
     $ <eq:elliptic:affine-improvement-hypotheses>]
  then there is an affine $L'$ such that
  #[#set math.equation(numbering: n => "(5.30)")
   $ sup_(B_lambda) \| u - L' \| lt.eq b lambda^(1 + alpha_2) \, wide \| D L' - D L \| lt.eq
     C b . $ <eq:elliptic:affine-improvement>]
  The metrics may again be smooth or reflected.
  Set $Y = \( u - L \) \/ b$. Its coordinate equation is
  $ a : D^2 Y = b^(- 1) #scale(x: 120%, y: 120%)[\(] G + a^(i j) Gamma_(i j)^ell u_ell #scale(x: 120%, y: 120%)[\)] \, $
  whose right side has absolute value at most $C delta$. Equation (5.16) and interpolation give
  #[#set math.equation(numbering: n => "(5.31)")
   $ parallel Y parallel_(W^(2 \, s_0) \( B_(7 \/ 8) \)) lt.eq C . $ <eq:elliptic:normalized-remainder-sobolev>]
  Put $e_0 = D L \/ \| D L \|$ and $a_0 = I - \( 1 - chi \) e_0 ⊗ e_0$.
    Since $D u = D L + b D Y$ and $\| D L \| gt.eq 1 \/ 4$, the direction projections obey
  $ parallel a - a_0 parallel_(L^(s_0) \( B_(7 \/ 8) \)) lt.eq C b \, wide parallel a - a_0 parallel_oo lt.eq C . $
  Indeed the map taking a nonzero vector to its unit-direction projection has the estimate $\| Pi \( v \) -
    Pi \( q \) \| lt.eq C min \( 1 \, \| v - q \| \/ \| q \| \)$ when $q eq.not 0$.
    At $v = 0$ any assigned unit projection satisfies the same estimate after enlarging $C$.
    The change from $D u$ to its metric gradient contributes $O \( parallel g - I parallel_oo \)$.
    Hölder’s inequality, with $1 \/ 2 = 1 \/ s_0 + 1 \/ p$ and interpolation of the bounded matrix difference in
    $L^p$, therefore gives
  #[#set math.equation(numbering: n => "(5.32)")
   $ R := a_0 : D^2 Y \, wide parallel R parallel_(L^2 \( B_(3 \/ 4) \)) lt.eq C \( delta + b^sigma \) \, quad
     sigma = min { 1 \, \( s_0 - 2 \) \/ 2 } > 0 . $ <eq:elliptic:frozen-residual>]
  We remove this residual in $W^(2 \, 2)$, without any Sobolev embedding into $C^0$.
    On the convex ball $cal(B) = B_(3 \/ 4)$, integration by parts for a zero-trace function gives
  $ integral_(cal(B)) \| D^2 v \|^2 lt.eq integral_(cal(B)) \| Delta v \|^2 . $
  The omitted boundary term is the nonnegative integral of the sphere’s mean curvature times
    $\( partial_nu v \)^2$; the identity extends by density to $W^(2 \, 2) ∩ W_0^(1 \, 2)$.
    Thus the Dirichlet solution operator $Delta_D^(- 1)$ satisfies $parallel D^2 Delta_D^(- 1) f parallel_2 lt.eq
    parallel f parallel_2$. The map
  $ v mapsto Delta_D^(- 1) #scale(x: 120%, y: 120%)[\(] R + \( 1 - chi \) partial_(e_0)^2 v
    #scale(x: 120%, y: 120%)[\)] $
  is a contraction, with factor at most $1 - c$, on $W^(2 \, 2) \( cal(B) \) ∩
    W_0^(1 \, 2) \( cal(B) \)$ equipped with the Hessian norm. Its fixed point satisfies
  $ a_0 : D^2 v = R \, wide parallel v parallel_(W^(2 \, 2) \( cal(B) \)) lt.eq C parallel R parallel_2 . $
  Consequently $Y_0 = Y - v$ satisfies the homogeneous frozen equation and has bounded $W^(2 \, 2) \( cal(B) \)$
    norm. By Equation (5.25), $parallel Y_0 parallel_(C^(1 \, alpha_1) \( B_(3 \/ 8) \)) lt.eq C$.
  Independently, $Y$ has a uniform $C^theta$ bound on $B_(1 \/ 2)$ by the Krylov–Safonov estimate applied to its
    unfrozen equation: the matrix $a$ is measurable and uniformly elliptic, its source is bounded,
    and $parallel Y parallel_oo lt.eq 1$. The function $Y$ is individually $W^(2 \, n)$ (also across the face),
    so the strong-solution version of that theorem applies. Hence $v = Y -
    Y_0$ has uniformly bounded $C^theta$ norm on $B_(3 \/ 8)$. Its small $L^2$ norm now implies
  #[#set math.equation(numbering: n => "(5.33)")
   $ parallel v parallel_(L^oo \( B_(1 \/ 3) \)) lt.eq C parallel v parallel_2^(2 theta \/ \( n + 2 theta \))
     lt.eq C \( delta + b^sigma \)^(2 theta \/ \( n + 2 theta \)) . $ <eq:elliptic:correction-uniform>]
  To see the first inequality for small $parallel v parallel_2$, a value $\| v \( x \) \| =
    m$ forces $\| v \| gt.eq m \/ 2$ on a ball of radius $\( m \/ \( 2 C \) \)^(1 \/ theta)$;
    integrating its square gives the stated exponent.
  Choose $alpha_2 < alpha_1$, then $lambda$ so small that $C lambda^(1 + alpha_1) lt.eq 1 /
    2 lambda^(1 + alpha_2)$, and finally $delta \, b_0$ so small that the right side of Equation (5.33) is at most
    $1 / 2 lambda^(1 + alpha_2)$. The affine function
  $ L' = L + b #scale(x: 120%, y: 120%)[\(] Y_0 \( 0 \) + D Y_0 \( 0 \) dot.op x #scale(x: 120%, y: 120%)[\)] $
  then satisfies Equation (5.30).
  #emph[6. Iteration, including its transition between the two alternatives.] Decrease $b_0$ further so that $C
    b_0 \/ \( 1 - lambda^(alpha_2) \) lt.eq 1 \/ 8$, where $C$ is the slope constant in Equation (5.30).
    Apply the dichotomy with $b_(*) = b_0$. At each center, first normalize $g$ there and choose a fixed
    sufficiently small radius $R_0$. Divide heights by $K R_0$, where $K gt.eq
    max \( 1 \, parallel nabla_g u parallel_oo \)$, and subtract the center value.
    On the rescaled unit ball the gradient is at most one. The forcing is multiplied by $R_0 \/ K$,
    the connection and face second form by $R_0$, and smooth-side curvature by $R_0^2$.
    Metric oscillation from its center value is $O \( R_0 \)$.
    Choose $R_0$ uniformly so that these errors satisfy both the dichotomy threshold and $b_0 delta$.
  Denote this normalized function by $u_0$. After $j$ successive norm drops, the normalized function is
  $ u_j \( x \) = frac(u_0 \( r_(*)^j x \), r_(*)^j k_(*)^j) . $
  It again has gradient at most one. Its forcing has acquired the factor $\( r_(*) \/ k_(*) \)^j$, and its metric,
    connection and face errors have acquired at least the factor $r_(*)^j$.
    All required smallness conditions persist because $r_(*) < k_(*)$. If this branch continues forever, then
  $ sup_(B_(r_(*)^j)) \| u_0 - u_0 \( 0 \) \| lt.eq C r_(*)^j k_(*)^j = C \( r_(*)^j \)^(1 + alpha_d) \, wide
    alpha_d = frac(log k_(*), log r_(*)) in \( 0 \, 1 \) . $
  If the affine alternative first occurs after $j$ norm drops, rescale its ball once by $r_(*)$,
    retaining its current gradient normalization. The resulting function $U$ has a unit-ball affine error at most
    $b_0$ and an initial slope in $\[ 1 \/ 2 \, 2 \]$. Iterate the affine improvement using
  $ U_i \( x \) = frac(U \( lambda^i x \), lambda^i) \, wide b_i = b_0 lambda^(i alpha_2) . $
  Only constants are subtracted from the nonlinear unknown if a renormalization of its value is needed;
    the affine functions are used solely as comparison functions.
    In particular the original gradient-aligned equation remains its equation at every step.
    The relative error threshold remains valid: geometric and forcing errors acquire a factor $lambda^i$, and
  $ lambda^i b_0 delta lt.eq b_i delta quad upright("because") quad alpha_2 < 1 . $
  The gradient remains bounded by its entry normalization, and the affine slopes change by at most $C b_i$.
    Their total change is at most $1 \/ 8$, so all slopes remain within $\[ 1 \/ 4 \, 4 \]$,
    as required by Equation (5.29).
  Take $0 < alpha lt.eq min \( alpha_d \, alpha_2 \)$. Before affine entry the constant approximations above have
    error $C r^(1 + alpha)$. At entry the original radius is $r_e =
    r_(*)^(j + 1)$ and the gradient normalization is $a_e = k_(*)^j$.
    At the subsequent radii $r = r_e lambda^i$, the affine errors in the original $u_0$ are bounded by
  $ C a_e r_e lambda^(i \( 1 + alpha_2 \)) = C r^(1 + alpha) thin #scale(x: 120%, y: 120%)[\(] a_e r_e^(- alpha)
    #scale(x: 120%, y: 120%)[\)] lambda^(i \( alpha_2 - alpha \)) lt.eq C r^(1 + alpha) \, $
  because $a_e r_e^(- alpha) = k_(*)^(- 1) r_e^(alpha_d - alpha) lt.eq k_(*)^(- 1)$.
    Thus the constants remain uniform across every possible entry scale.
    Intermediate radii are handled by restricting the approximation from the next larger radius,
    whose ratio is one of the two fixed numbers $r_(*)^(- 1)$ and $lambda^(- 1)$.
  We have proved that at every center and every sufficiently small radius there is an affine approximation with
    uniform error $C r^(1 + alpha)$. The elementary affine Campanato criterion gives the gradient estimate:
    comparison of the affine functions on concentric radii $r \,
    r \/ 2$ bounds their slope difference by $C r^alpha$; summation identifies the limiting slope with $D
    u$ at the center. Comparing the approximations at two centers in a common ball of radius comparable to their
    distance then bounds the difference of these limiting slopes by that distance to the power $alpha$.
    This proves the first estimate in Equation (5.14), also on the reflected face,
    with constants uniform on the smaller original chart.
  Finally let $L_x \( y \) = u \( x \) + D u \( x \) dot.op \( y - x \)$ in fixed coordinates.
    The gradient estimate gives $parallel u - L_x parallel_(L^oo \( B_(2 r) \( x \) \)) lt.eq C r^(1 + alpha)$. Since
  $ a : D^2 \( u - L_x \) = G + a^(i j) Gamma_(i j)^ell u_ell \, $
  Equation (5.16) with $s = 2$ yields
  $ parallel D^2 u parallel_(L^2 \( B_r \( x \) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] r^(n \/ 2) +
    r^(n \/ 2 - 1 + alpha) #scale(x: 120%, y: 120%)[\)] . $
  The bounded connection term converting $D^2 u$ to $"Hess"_g u$ has $L^2$ norm $O \( r^(n \/ 2) \)$.
    Squaring the estimate and using $alpha < 1$ proves the Hessian estimate in Equation (5.14).
    Restricting the reflected estimate to the original half-ball proves the face version. ◻
]

=== 5.4 A bounded scalar equation with quadratic gradient growth <a-bounded-scalar-equation-with-quadratic-gradient-growth>

The trace estimate now supplies the local mass control needed for the second equation.
  Its source has quadratic growth in $D Z$ and also contains $\| D^2 f \|^2$.
  The latter need not yet have a pointwise bound uniform over solutions:
  the estimate $integral_(B_r) \| D^2 f \|^2 lt.eq C r^(n - 2 + 2 alpha)$ from the preceding lemma is the
  information available at this stage.

The following bounded-solution estimate uses exactly such a mass bound.
  Two exponential changes of variable absorb the quadratic $D Z$ term,
  and the mass bound makes the remaining source potential small on short scales.
  Oscillation decay then gives a Hölder modulus for $Z$ while its principal coefficients are still treated as
  measurable.

#thm([Lemma 5.5.])[
  (Natural-growth scalar estimate).  #emph[Let $n gt.eq 3$ and let $Q$ be a Euclidean coordinate ball,
    or a smooth flattened half-ball with constant Dirichlet value on its face.
    Suppose a bounded classical function $Z$ satisfies weakly
#[#set math.equation(numbering: n => "(5.34)")
 $ - partial_i \( A^(i j) partial_j Z \) = partial_i B^i + S \, wide lambda I lt.eq A lt.eq Lambda I \, wide A =
   A^(sans(T)) \,\
\| B \| lt.eq C_0 \, wide \| S \| lt.eq C_0 \( 1 + \| D Z \|^2 + F_0 \) . $ <eq:elliptic:natural-growth-model>]

 where $A$ is measurable and $F_0 gt.eq 0$ is bounded for each individual solution.
   Assume, for some $a in \( 0 \, 1 \)$ and $r_0 > 0$, and every ball of radius $0 < r lt.eq
   r_0$ with center in the coordinate patch, that the measure $nu = \( 1 + F_0 \) thin d x$ obeys
#[#set math.equation(numbering: n => "(5.35)")
 $ nu \( B_r ∩ Q \) lt.eq C_1 r^(n - 2 + a) . $ <eq:elliptic:ng-source-morrey>]

 Then $Z$ has a uniform $C^b$ bound on smaller patches, including the constant-Dirichlet face,
   for some $b in \( 0 \, a \)$. Its exponent and bound depend only on $n \, lambda \, Lambda \, C_0 \, C_1 \,
   a \, r_0$, the bound for $\| Z \|$, the fixed chart geometry and the distance from the remaining patch
   boundary. They use neither a modulus of continuity for $A$ nor a uniform pointwise bound for $F_0$ or $D^2 Z$.]
] <lem:elliptic:natural-growth>

#proof[
  If a Dirichlet face is present, first subtract its constant boundary value.
    This changes neither the equation nor its source bounds. The reflection creates no measure on that face.
    Flatten it as ${ x_n = 0 }$ and write $J = "diag" \( 1 \, dots.h \, 1 \, - 1 \)$.
    For $x_n < 0$ extend the four quantities by
  #[#set math.equation(numbering: n => "(5.36)")
   $ Z^e \( x \) = - Z \( J x \) \, quad A^e \( x \) = J A \( J x \) J \, quad B^e \( x \) = - J B \( J x \) \,
     quad S^e \( x \) = - S \( J x \) . $ <eq:elliptic:ng-reflection>]
  The zero trace makes $Z^e$ a $W^(1 \, 2)$ function, and ellipticity is preserved.
    To verify the equation across the face, test the original equation on the upper half with $phi \( x \) -
    phi \( J x \)$, which has zero trace. Changing variables in the reflected half gives precisely Equation (5.34)
    for the extended quantities. Equivalently, the normal component of the full flux $A D Z +
    B$ agrees in the weak flux sense on the two sides. Thus there is no boundary flux jump to estimate.
    A different constant Dirichlet value is handled by subtracting that constant first.
    Reflect the nonnegative density $1 + F_0$ evenly. The ball-mass bound changes by at most a fixed
    multiplicative factor. The reflected coefficients need not be smooth.
  #emph[Exponential absorption and potentials.] Use $nu = \( 1 + F_0 \) thin d x$,
    with the even extension just described where needed. We give the two-sign exponential argument for
    Equation (5.34). Put $Q_epsilon = e^(epsilon L Z)$ for $epsilon in { - 1 \, 1 }$, and let $cal(L) = -
    partial_i \( A^(i j) partial_j \)$. The weak chain rule gives
  #[#set math.equation(numbering: n => "(5.37)")
   $ cal(L) Q_epsilon & = partial_i #scale(x: 120%, y: 120%)[\(] epsilon L Q_epsilon B^i
     #scale(x: 120%, y: 120%)[\)] - L^2 Q_epsilon B dot.op D Z + epsilon L Q_epsilon S -
     L^2 Q_epsilon A D Z dot.op D Z . $ <eq:elliptic:ng-exp-identity>]
  Indeed it follows directly by testing the equation for $Z$ with $epsilon L Q_epsilon phi$.
    Young’s inequality bounds the second term on the right by $1 / 2 lambda L^2 Q_epsilon \| D Z \|^2 +
    C L^2 Q_epsilon$. Taking $L gt.eq 2 C \/ lambda$ absorbs also the quadratic part of $epsilon L Q_epsilon S$.
    Since $Z$ is bounded and $L$ is now fixed, we obtain, for both signs,
  #[#set math.equation(numbering: n => "(5.38)")
   $ cal(L) Q_epsilon lt.eq "div" B_epsilon + C nu \, wide B_epsilon = epsilon L Q_epsilon B \, wide
     parallel B_epsilon parallel_oo lt.eq C . $ <eq:elliptic:ng-exp-inequality>]
  This uses no derivative of $B$, $A$, or the density of $nu$.
  On a ball $B_r$ in the resulting full patch, let $v_epsilon$ solve
  #[#set math.equation(numbering: n => "(5.39)")
   $ cal(L) v_epsilon = "div" B_epsilon + C nu \, wide v_epsilon \|_(partial B_r) = 0 . $ <eq:elliptic:ng-potential>]
  The density of $nu$ is bounded for each individual classical solution,
    so this solve and the following tests can first be made in $W^(1 \, 2)$.
    Only the uniform mass bound in Equation (5.35) enters the estimate.
    The part with right side $"div" B_epsilon$ has absolute value at most $C r parallel B_epsilon parallel_oo$.
    This is the scaled bounded-divergence-source estimate: testing by positive and negative level truncations
    gives $integral \| D \( v - k \)_(+) \|^2 lt.eq C parallel B_epsilon parallel_oo^2 \| { v > k } \|$,
    and Sobolev level iteration on the unit ball proves the asserted bound after rescaling.
  For the measure part, the scalar Dirichlet Green function of a uniformly elliptic divergence operator in
    dimension $n gt.eq 3$ satisfies $0 lt.eq G_r \( x \, y \) lt.eq C \| x - y \|^(2 - n)$.
    For bounded measurable coefficients this follows from the whole-space Green-function comparison
    #cite(label("LittmanStampacchiaWeinberger1963")) Section 7:
    extend $A$ uniformly elliptically off the ball, and compare the whole-space and zero-Dirichlet Green functions
    by the maximum principle. Dividing $B_r$ into annuli about any $x in B_r$ gives
  $ integral_(B_r) G_r \( x \, y \) thin d nu \( y \) lt.eq
    C sum_(j gt.eq 0) \( 2^(- j) 2 r \)^(2 - n) nu #scale(x: 120%, y: 120%)[\(] B_(2^(- j) 2 r) \( x \)
    #scale(x: 120%, y: 120%)[\)] lt.eq C sum_(j gt.eq 0) \( 2^(- j) 2 r \)^a lt.eq C r^a . $
  We work sufficiently far inside the coordinate patch that the mass bound applies to the balls in this sum.
    Consequently
  #[#set math.equation(numbering: n => "(5.40)")
   $ parallel v_epsilon parallel_(L^oo \( B_r \)) lt.eq E_r \, wide E_r =
     C \( r + r^a \) . $ <eq:elliptic:ng-potential-bound>]
  #emph[Oscillation decay.] Here is the oscillation reduction, including the role of the two signs.
    Let $m = inf_(B_r) Z$, $M = sup_(B_r) Z$, and $omega = M - m$. By Equations (5.38) and (5.39), the functions
  $ W_(+) = e^(L M) - Q_(+) + v_(+) + E_r \, wide W_(-) = e^(- L m) - Q_(-) + v_(-) + E_r $
  are nonnegative weak supersolutions of $cal(L) W gt.eq 0$ on $B_r$. At least one of the sets
  $ { Z lt.eq \( m + M \) \/ 2 } ∩ B_(r \/ 2) \, wide { Z gt.eq \( m + M \) \/ 2 } ∩ B_(r \/ 2) $
  has at least half the measure of $B_(r \/ 2)$. On the first set $e^(L M) - Q_(+) gt.eq c omega$,
    and on the second $e^(- L m) - Q_(-) gt.eq c omega$, because the exponential and its inverse are uniformly
    Lipschitz on the fixed bounded range of $Z$. For the corresponding sign the weak Harnack inequality,
    with its fixed exponent $q > 0$, yields
  $ c omega lt.eq C (frac(1, \| B_(r \/ 2) \|) integral_(B_(r \/ 2)) W_epsilon^q)^(1 \/ q) lt.eq
    C inf_(B_(r \/ 4)) W_epsilon . $
  Subtracting $v_epsilon + E_r$, whose absolute value is at most $2 E_r$,
    and using the same Lipschitz comparison with $Z$, improves one of its two extremes.
    Hence, for a fixed $theta in \( 0 \, 1 \)$,
  #[#set math.equation(numbering: n => "(5.41)")
   $ "osc"_(B_(r \/ 4)) Z lt.eq \( 1 - theta \) "osc"_(B_r) Z + C \( r + r^a \) . $ <eq:elliptic:ng-oscillation-decay>]
  Iteration gives a uniform $C^b$ bound for any fixed
  $ 0 < b < min {a \, frac(- log \( 1 - theta \), log 4)} . $
  Applying the same conclusion to the reflected equation proves the estimate up to the constant Dirichlet face. ◻
]

=== 5.5 Regularity of the coupled fixed points <regularity-of-the-coupled-fixed-points>

We apply the two local lemmas in a definite order. The trace equation first controls $D
  f$ and the local mass of $\| D^2 f \|^2$. The scalar divergence lemma then controls the oscillation of $Z$.
  These two Hölder bounds permit scalar Schauder estimates,
  followed by an absorption of the remaining quadratic gradient term.
  Each step has constants uniform in the outer truncation at fixed $N$.

#thm([Proposition 5.6.])[
  #emph[Fix $N$. Smooth solutions of either homotopy on $cal(M)_(N \, R)$ with $t gt.eq -
    epsilon.alt$ have bounds of every fixed order on coordinate balls and on outer Dirichlet half-balls of a
    sufficiently small fixed size. Their size and the constants may depend arbitrarily on $N$,
    but are independent of $R gt.eq R_min \( N \)$ and of the homotopy parameter.
    In particular their $C^(1 \, gamma)$ norms are bounded on each fixed truncation, for any chosen $0 < gamma < 1$.]
] <prop:elliptic:regularity>

#proof[
  #emph[1. The trace estimate and divergence form.] Fix $N$ and a member of the homotopy.
    Proposition 21 gives uniform bounds for $\| f \|$, $\| d f \|$, and $\| Z \|$,
    and uniform ellipticity on coordinate balls of a fixed small radius.
    The radius and constants may depend on $N$, but can be chosen independently of the outer truncation.
    Lemma 22, applied to the trace equation, gives some $a in \( 0 \, 1 \)$ such that
  #[#set math.equation(numbering: n => "(5.42)")
   $ \[ d f \]_(C^a) lt.eq C \, wide integral_(B_r ∩ cal(M)_(N \, R)) \| D^2 f \|^2 thin d x lt.eq
     C r^(n - 2 + 2 a) \, wide 0 < r lt.eq r_0 . $ <eq:elliptic:ng-hessian-morrey>]
  Here and below the boundary version uses a smooth half-ball with constant Dirichlet data;
    coordinate and covariant Hessians differ by a bounded quantity.
    Each occurrence of a ball in a mass estimate allows all centers in the coordinate patch, not just one fixed center.
  The implicit relation defining $t$ has derivative $1 + p v \/ k gt.eq 1$ with respect to $t$.
    On the bounded range now under consideration it therefore defines a smooth function of $\( x \, Z \, D f \)$,
    whose relevant partial derivatives are bounded. In particular,
  #[#set math.equation(numbering: n => "(5.43)")
   $ \| D t \| lt.eq C \( 1 + \| D Z \| + \| D^2 f \| \) . $ <eq:elliptic:ng-dt>]
  All the expressions in the equations are smooth before the block decomposition, including at $d f = 0$.
    Since $cal(T)$ is quadratic in $H^f$, $d t$, and $K$, Equation (5.43) and the bounded zeroth- and first-order
    quantities imply the following coordinate form of the second equation:
  #[#set math.equation(numbering: n => "(5.44)")
   $ - partial_i \( A^(i j) partial_j Z \) = partial_i B^i + S \, wide lambda I lt.eq A lt.eq Lambda I \,
     wide \| B \| lt.eq C \, wide \| S \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| D Z \|^2 + \| D^2 f \|^2
     #scale(x: 120%, y: 120%)[\)] . $ <eq:elliptic:ng-natural-equation>]
  The matrix $A$ is symmetric. With volume densities included, $A$ represents $k u A_chi$,
    $B$ represents $u A_chi K \( w \, dot.op \)$, and $S = - sqrt(det g) thin u Xi$.
    The same bounds hold uniformly along both stages of the homotopy;
    scaling $Xi$ towards zero improves its absolute-value bound. No continuity modulus for $A$ is being used yet.
  Apply Lemma 23 with $F_0 = \| D^2 f \|^2$. Its coefficient and source hypotheses are precisely Equation (5.44).
    On patches of size at most one, Equation (5.42) gives $nu \( B_r \) lt.eq
    C r^(n - 2 + a)$ for $nu = \( 1 + \| D^2 f \|^2 \) thin d x$.
    The lemma therefore gives a uniform $C^b$ bound for $Z$ for some $0 < b < a$,
    up to the constant outer Dirichlet face as well. Both $Z$ and $D
    f$ now have the continuity needed to improve the trace equation by Schauder theory.
  #emph[2. Absorbing the quadratic gradient term.] The coefficients of the trace equation are smooth functions of
    $\( x \, Z \, D f \)$. The preceding estimate and Equation (5.42) therefore give a uniform $C^c$ modulus for
    those coefficients and the trace right side, with $c = min \( a \, b \) > 0$.
    Interior and Dirichlet Schauder estimates give
  #[#set math.equation(numbering: n => "(5.45)")
   $ parallel f parallel_(C^(2 \, c)) lt.eq C $ <eq:elliptic:ng-f-schauder>]
  on smaller patches of the same uniform type. This use of Schauder requires only the now established Hölder
    modulus of $\( Z \, D f \)$.
  Expand the divergence equation on each original ball or half-ball.
    Since $A = A \( x \, Z \, D f \)$ and $B = B \( x \, Z \, D f \)$, their derivatives consist of bounded terms,
    terms linear in $D Z$, and terms linear in $D^2 f$. Equation (5.45) and the formula for $D
    t$ show that the expanded equation has the form
  #[#set math.equation(numbering: n => "(5.46)")
   $ A^(i j) D_(i j) Z = H \, wide \| H \| lt.eq C \( 1 + \| D Z \|^2 \) \, wide parallel A parallel_(C^c) lt.eq
     C . $ <eq:elliptic:ng-expanded>]
  The bound on the Hölder norm of $A$ does not presuppose a bound for $D Z$.
    Coordinate lower-order terms are included in $H$.
  Fix any finite $s > n$. Freezing the now Hölder principal matrix on sufficiently small balls gives the interior
    and flat-Dirichlet $W^(2 \, s)$ estimates with uniformly bounded coefficient in front of $parallel H
    parallel_s$. On nested patches $Q_r subset Q_(2 r)$ these give
  #[#set math.equation(numbering: n => "(5.47)")
   $ parallel D^2 Z parallel_(s \, Q_r) lt.eq C_s parallel D Z parallel_(2 s \, Q_(2 r))^2 +
     C_(s \, r) . $ <eq:elliptic:ng-local-w2s>]
  The last constant includes the bounded height, the constant term in Equation (5.46),
    and the scaled cutoff costs. For a ball or a fixed-shape half-ball the scaled interpolation inequality is
  #[#set math.equation(numbering: n => "(5.48)")
   $ parallel D Z parallel_(2 s \, Q)^2 lt.eq C_s "osc"_Q Z thin parallel D^2 Z parallel_(s \, Q) +
     C_s r^(n \/ s - 2) \( "osc"_Q Z \)^2 \, $ <eq:elliptic:ng-interpolation>]
  where $Q$ has size $r$. Indeed apply the usual second-order interpolation inequality on the unit ball or
    half-ball after subtracting a constant and rescaling. On a half-ball,
    the constant Dirichlet value belongs to the closed range of $Z$, so it can be used for this subtraction.
    The constants depend only on the uniform chart shapes, $s$, and the dimension.
  For clarity, the absorption is local and does not lose the number of patches in a large truncation.
    For a fixed sufficiently small $r$, let
  $ cal(M)_r = sup_x parallel D^2 Z parallel_(s \, Q_r \( x \)) . $
  It is finite for each individual classical solution on a truncation.
    The uniform local geometry allows each $Q_(2 r) \( x \)$ to be covered by at most $J_0$ patches of size $r$,
    with $J_0$ independent of the outer radius. Thus Equations (5.47) and (5.48) imply
  $ cal(M)_r lt.eq C_s J_0^(1 \/ s) sup_x "osc"_(Q_(2 r) \( x \)) Z thin cal(M)_r + C_(s \, r) . $
  Choose $r$ small enough, using the uniform $C^b$ bound already proved,
    that the displayed coefficient of $cal(M)_r$ is at most $1 \/ 2$.
    This gives a uniform local $W^(2 \, s)$ bound up to the outer face,
    independently of the total number of patches. Sobolev embedding now bounds $Z$ in $C^(1 \, d)$ for $d < 1 - n \/ s$.
  #emph[3. Bootstrap.] The trace equation consequently bounds $f$ in $C^(3 \, d')$ for some $d' > 0$.
    Its coefficients now have one Hölder derivative; the expanded second equation has Hölder right side,
    giving $Z in C^(2 \, d')$. Repetition yields bounds of every fixed order,
    since the background data are smooth. More explicitly, once $Z in C^(j \, d')$ and $f in
    C^(j + 1 \, d')$ for $j gt.eq 1$, the trace equation first gives $f in C^(j + 2 \, d')$,
    and the divergence equation then gives $Z in C^(j + 1 \, d')$.
    Shrinking the exponent once at the first step suffices. The argument applies initially to the $C^(2 \, gamma)$
    fixed points constructed below: their individual Hessian norms are already finite,
    and smoothness is the conclusion of the bootstrap. All constants in this paragraph may depend arbitrarily on
    fixed $N$ and the chosen derivative order. ◻
]

=== 5.6 The trace equation for an arbitrary trial <the-trace-equation-for-an-arbitrary-trial>

The degree argument requires a map defined beyond the region $t > - epsilon.alt$. The next lemma supplies it.
  Its estimates are separate from Proposition 21: here a trial $Z$ is prescribed,
  and no lower bound for its associated $t$ is assumed.

#thm([Lemma 5.7.])[
  #emph[Let $cal(D)$ be a compact smooth $n$-dimensional Riemannian manifold with nonempty smooth boundary,
    with $n gt.eq 3$ and $k = n - 1$, and let $K$ be a smooth symmetric tensor on $cal(D)$.
    Fix $N > k$, $0 < gamma < 1$, and a positive constant $eta$.
    Use $p \( t \) = N theta.alt \( N t \)$ and $l \( t \) = exp \( integral_0^t p \( s \) thin d s \)$,
    with the smooth cutoff $theta.alt$ of Equation (4.1), and define $D$, $t$,
    $A_chi$ by Equations (4.2) and (4.3). Put $K_a = a K$. For every $z in C^(1 \, gamma) \( cal(D) \)$ and $a
    in \[ 0 \, 1 \]$, the Dirichlet problem
$ "tr"_(A_chi) (K_a + l / sqrt(D) "Hess" f) = eta f \, wide f \|_(partial cal(D)) = 0 \, wide t +
  frac(1, 2 k) log \( 1 + l \( t \)^2 \| d f \|^2 \) = z $

 has a unique solution $f = f_a \[ z \] in C^(3 \, gamma)$.
   The solution map is continuous from $\[ 0 \, 1 \] times C^(1 \, gamma) \( cal(D) \)$ to
   $C^(3 \, gamma) \( cal(D) \)$ and maps bounded sets to bounded sets.
   All constants may depend on $N \, eta \, cal(D) \, g \, K$ and the prescribed bound for $z$.
   There is no restriction on the minimum of the implicitly determined $t$.]
] <lem:elliptic:trial-trace>

#proof[
  #emph[1. Coefficient growth without a floor.] Let $b = sqrt(D) \/ l$.
    On a bounded trial range the coefficients satisfy, for every $sigma = \| d f \|$,
  #[#set math.equation(numbering: n => "(5.49)")
   $ b lt.eq C \( 1 + sigma \) \, wide frac(c, 1 + sigma) lt.eq chi lt.eq 1 . $ <eq:elliptic:trial-growth>]
  We verify the bounds also at large slope, where $t$ has no fixed floor.
    The implicit relation implies $t < 0$ when $sigma$ is sufficiently large. There $p = N$, $l = e^(N t)$, and
  $ e^(2 k z) = e^(2 k t) + sigma^2 e^(2 \( k + N \) t) . $
  Uniformly on a bounded $z$ range, as $sigma arrow.r oo$,
  $ t = frac(k z - log sigma, k + N) + o \( 1 \) \, wide d asymp sigma^(- 2 k \/ \( k + N \)) \, wide
    chi asymp frac(k, k + N) sigma^(- 2 k \/ \( k + N \)) . $
  The exponent is less than one because $N > k$. Moreover $b = sigma \/ sqrt(v) asymp sigma$ there.
    The remaining bounded slope range is compact in $\( z \, sigma \)$,
    and the coefficients are smooth and positive on it. This proves Equation (5.49).
  #emph[2. A global gradient bound.] Continue from $Delta_g f = f$ by solving, for $0 lt.eq q lt.eq 1$,
  #[#set math.equation(numbering: n => "(5.50)")
   $ A_q : "Hess" f - c_q f = - q b "tr"_(A_chi) K_a \, wide A_q = \( 1 - q \) I + q A_chi \, wide c_q = 1 - q +
     q eta b . $ <eq:elliptic:trace-continuation>]
  The scalar $c_q$ is positive. Extrema give a common height bound $parallel f parallel_oo lt.eq H$, since
  $ frac(q b \| "tr"_(A_chi) K_a \|, c_q) lt.eq C / eta . $
  On this height range the right side of the equation written as $A_q : "Hess" f =
    G \( x \, f \, d f \)$ satisfies, for a covector $xi$,
  #[#set math.equation(numbering: n => "(5.51)")
   $ \| G \( x \, f \, xi \) \| lt.eq C \( 1 + \| xi \| \) \, $ <eq:elliptic:trial-forcing>]
  uniformly in $q \, a$. The eigenvalues of $A_q$ are one in the transverse directions and $chi_q = 1 - q +
    q chi gt.eq c \/ \( 1 + \| xi \| \)$ along $xi$.
  Here is a gradient estimate using precisely this lower axial bound.
    Choose $K_0$ sufficiently large, then a positive distance $d_0$ smaller than the boundary tubular radius,
    the injectivity radius of a smooth extension of the compact domain, and $\( 2 K_0 \)^(- 1)$. For $M > 0$ set
  #[#set math.equation(numbering: n => "(5.52)")
   $ psi \( d \) = K_0^(- 1) log \( 1 + K_0 M d \) \, wide psi'' = - K_0 \( psi' \)^2 . $ <eq:elliptic:log-modulus>]
  By increasing $M$ we ensure both $psi' gt.eq 1$ on $\[ 0 \, d_0 \]$ and $psi \( d_0 \) > 2 H$.
    Indeed $psi' \( d_0 \)$ tends to $\( K_0 d_0 \)^(- 1) > 2$, while $psi \( d_0 \)$ tends to infinity.
  First compare with $plus.minus psi \( d \( x \, partial cal(D) \) \)$ in the boundary collar.
    At a contact, the gradient is normal and has length $sigma = psi'$.
    The tangential Hessian contraction costs at most $C sigma$, whereas
  $ chi_q psi'' lt.eq - frac(c K_0 sigma^2, 1 + sigma) lt.eq - frac(c K_0, 2) sigma . $
  Choose $K_0$ large enough to dominate the collar curvature and Equation (5.51).
    The positive barrier is a strict supersolution; the negative one is a strict subsolution.
    On the inner edge of this collar they dominate $plus.minus f$ by the height bound,
    and both vanish at the boundary. Therefore
  #[#set math.equation(numbering: n => "(5.53)")
   $ \| f \( x \) \| lt.eq psi \( d \( x \, partial cal(D) \) \) quad
     upright("when ") d \( x \, partial cal(D) \) lt.eq d_0 . $ <eq:elliptic:boundary-modulus>]
  Consider now $f \( x \) - f \( y \) - psi \( d \( x \, y \) \)$ for pairs with $0 lt.eq d \( x \, y \) lt.eq
    d_0$, using the distance of the smooth ambient extension.
    It is nonpositive on the diagonal, for $d = d_0$, and when either endpoint lies on the boundary,
    by Equation (5.53) and the monotonicity of $psi$. Suppose it had a positive interior maximum.
    The endpoint gradients are parallel along their unique short joining geodesic and have the same length
    $sigma = psi' gt.eq 1$. Write $e$ for their common parallel direction.
    Varying one endpoint in the axial direction gives
  $ "Hess" f_x \( e \, e \) lt.eq psi'' \, wide "Hess" f_y \( e \, e \) gt.eq - psi'' . $
  Varying both endpoints in parallel transverse directions and summing the second-variation inequalities gives
  $ "tr"_(e^perp) "Hess" f_x - "tr"_(e^perp) "Hess" f_y lt.eq C d \( x \, y \) sigma . $
  For completeness, the simultaneous endpoint variation is generated by a parallel vector field along the
    geodesic; its index form is bounded above by $C d \( x \, y \)$ since the ambient curvature is bounded.
    This is the displayed estimate after multiplication by $psi'$.
    The transverse eigenvalues are exactly one at both endpoints, so
  $ A_(q \, x) : "Hess" f_x - A_(q \, y) : "Hess" f_y & lt.eq
    C d \( x \, y \) sigma + \( chi_(q \, x) + chi_(q \, y) \) psi''\
 & lt.eq C d_0 sigma - c K_0 sigma . $
  The right sides of Equation (5.50) differ by a quantity at least $- 2 C \( 1 + sigma \)$.
    A sufficiently large $K_0$ contradicts this. Notice that no estimate for $chi_(q \, x) -
    chi_(q \, y)$ was needed: both signed axial Hessian bounds have the favorable sign.
    We conclude $\| f \( x \) - f \( y \) \| lt.eq psi \( d \( x \, y \) \)$ and hence $\| d f \| lt.eq
    psi' \( 0 \) = M$.
  #emph[3. Continuation and regularity.] Equation (5.49) now gives uniform ellipticity throughout the
    continuation. Its normalized forcing is bounded. Lemma 22 gives a common positive Hölder exponent for $d f$,
    including the boundary. Since the coefficients are smooth functions of $\( x \, z \, d f \)$,
    the Dirichlet Schauder estimate first gives $f in C^(2 \, gamma_0)$ for a possibly smaller exponent.
    The resulting Lipschitz bound for $d f$ then makes those coefficients $C^(0 \, gamma)$,
    so the estimate improves to $C^(2 \, gamma)$. Differentiating the equation once gives $C^(3 \, gamma)$
    estimates: the trial is $C^(1 \, gamma)$ and all differentiated coefficient and source terms are controlled.
    These scalar estimates are uniform along the continuation;
    they are the interior and smooth Dirichlet estimates of #cite(label("GilbargTrudinger")) on a finite
    coordinate covering.
  The linearization in $f$ is a uniformly elliptic scalar operator with bounded Hölder first-order coefficients
    and zero-order coefficient $- c_q < 0$. Its homogeneous Dirichlet kernel is zero by the maximum principle.
    The scalar linear Dirichlet continuity theorem, starting from $Delta_g - 1$ and using the Schauder estimate,
    makes it invertible from $C_0^(2 \, gamma)$ to $C^(0 \, gamma)$.
    The implicit function theorem gives openness of the nonlinear continuation set;
    the bounds and compactness give closedness. The initial solution is $f = 0$, hence existence follows at $q = 1$.
  #emph[4. Uniqueness and continuity.] For uniqueness compare two solutions at a positive maximum of their
    difference. Their gradients agree there, so their coefficient matrices and their positive factors $b$ agree;
    Hessian ordering and the strictly negative zero-order term give a contradiction.
    For continuity in the stated norm, regard the normalized trace operator as a map
  $ \[ 0 \, 1 \] times C^(1 \, gamma) times C_0^(3 \, gamma) arrow.r C^(1 \, gamma) . $
  It is continuously differentiable in the trial and solution variables,
    since its coefficient functions are smooth on every bounded jet range.
    At a solution its linearized principal, first-order, and zero-order coefficients are $C^(1 \, gamma)$.
    The same maximum principle and the one-derivative-higher Dirichlet Schauder estimate therefore make that
    linearization an isomorphism from $C_0^(3 \, gamma)$ onto $C^(1 \, gamma)$.
    The implicit function theorem supplies local continuous dependence into $C^(3 \, gamma)$;
    uniqueness joins these local maps. The a priori estimates already proved give the bounded-set assertion. ◻
]

=== 5.7 A compact map and the two homotopies <a-compact-map-and-the-two-homotopies>

We now return to $cal(D) = cal(M)_(N \, R)$ and $eta = ell^(3 \/ 2)$. Fix $N \, R$ with $R gt.eq R_min \( N \)$, and let

$ X = { z in C^(1 \, gamma) \( cal(M)_(N \, R) \) : z \|_(S_R) = 0 } \, wide 0 < gamma < 1 . $

For a trial $z in X$, solve $f = f_a \[ z \]$ by Lemma 25.
  Evaluate $t \, D \, u \, A_chi \, w$ and $cal(T)$ using $\( f \, z \)$,
  including the derivatives of $t$ obtained by differentiating its implicit definition.
  Define $T_a \( z \) = Z_(upright("out"))$ to be the solution of the #emph[linear] Dirichlet problem

#[#set math.equation(numbering: n => "(5.54)")
 $ "div" \( k u A_chi nabla Z_(upright("out")) \) = u Xi_a -
   "div" #scale(x: 120%, y: 120%)[\(] u A_chi K_a \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] \, wide
   Z_(upright("out")) \|_(S_R) = 0 . $ <eq:elliptic:compact-map>]

Only the displayed gradient of $Z_(upright("out"))$ is unfrozen.
  The source $Xi_a$ is evaluated at the input $z$, not at the output.

On bounded subsets of $X$, the trace lemma gives bounded $C^(3 \, gamma)$ norms for $f$.
  Consequently the principal coefficient $k u A_chi$ is $C^(1 \, gamma)$ and uniformly positive definite,
  the drift flux is $C^(1 \, gamma)$, and $u Xi_a$ is $C^(0 \, gamma)$.
  The linear scalar Dirichlet theorem and Schauder estimate therefore give a unique $C^(2 \, gamma)$ output.
  The map $T_a : X arrow.r X$ is continuous and compact, uniformly on bounded sets and $a in \[ 0 \, 1 \]$.
  The same construction, with $a = 0$ and source $s u Xi_0$, defines the second compact homotopy $T_(0 \, s)$.
  Its trace solution is zero for every trial, since $K = 0$.

Every fixed point bootstraps to smoothness. Indeed the first Schauder step just described gives $z in
  C^(2 \, gamma)$; the trace equation then gives $f in C^(4 \, gamma)$,
  and repeated application to the second equation and then the first gives arbitrary derivatives.
  Thus the a priori estimates proved above apply to all fixed points.

For either homotopy parameter $lambda$, set

#[#set math.equation(numbering: n => "(5.55)")
 $ cal(U)_lambda = { z in X : min_(cal(M)_(N \, R)) t \[ z \, d f_lambda \[ z \] \] > - epsilon.alt \, med
   parallel z parallel_(C^(1 \, gamma)) < M } . $ <eq:elliptic:degree-domain>]

The associated set of parameter–trial pairs is

$ cal(U) = { \( lambda \, z \) in \[ 0 \, 1 \] times X : z in cal(U)_lambda } . $

It is relatively open in $\[ 0 \, 1 \] times X$ because the trace solution map and the implicit function defining
  $t$ are continuous. Choose $M$ larger than the common $C^(1 \, gamma)$ bound for all above-floor fixed points
  supplied by Proposition 24. There is no fixed point on the norm boundary,
  and the floor lemmas exclude one on the other boundary.

Here is the precise reason degree may be used on these moving sets.
  The fixed points in the closure of $cal(U)$ form a compact subset of $\[ 0 \, 1 \] times X$:
  the parameter interval is compact, the trial norms are bounded,
  and compactness of the homotopy gives a convergent subsequence of every sequence of such fixed points.
  Its limit cannot lie on either excluded boundary. Near any one parameter,
  take a fixed open neighborhood of that compact fiber whose closure remains inside $cal(U)_lambda$ for all
  sufficiently nearby parameters; shrink the parameter interval to exclude other fixed points outside this
  neighborhood, using compactness. Excision and ordinary fixed-domain homotopy invariance identify the degrees at
  those nearby parameters. A finite chain of such intervals identifies the degree at the two ends.
  These are the usual excision and homotopy properties of Leray–Schauder degree #cite(label("Deimling1985")) Chapter 2.

At the endpoint $a = 0 \, s = 0$, Equation (5.54) has zero source and zero boundary value,
  so $T_(0 \, 0) \( z \) = 0$ for every trial. Its sole fixed point is zero, with $t = 0 > - epsilon.alt$,
  and its degree is one. First follow the second homotopy to $s = 1$, then the first to $a = 1$.
  The degree remains one, yielding a smooth solution of the desired filled system on every sufficiently large
  truncation.

=== 5.8 Exhaustion, end decay, and the energy flux <exhaustion-end-decay-and-the-energy-flux>

The degree argument gives solutions on every sufficiently large truncation.
  Uniform local estimates let the outer boundary escape while $N$ remains fixed.
  The positive zeroth-order term in the trace equation then gives exponential decay of the graph;
  a scalar change of variable converts the end equation for $Z$ to a Poisson estimate.
  These are the precise asymptotics needed to evaluate the energy.

#proof[
  #emph[Completion of the proof of Theorem 19.] Keep $N$ fixed and let $R arrow.r oo$.
    The estimates of Proposition 24 on compact sets are independent of $R$.
    A diagonal subsequence therefore converges smoothly on every compact subset of $cal(M)_N$ to a solution
    $\( f \, Z \)$. The polynomial bounds and height comparisons survive.
    They give $t gt.eq - epsilon.alt$; equality would be an interior global minimum and contradict Lemma 17.
  We prove the remaining end estimates on the truncation solutions, uniformly in $R$ at this fixed $N$;
    the estimates then pass to the smooth limit just obtained.
  On the end $K = 0$ and the trace equation reads
  #[#set math.equation(numbering: n => "(5.56)")
   $ A_chi : "Hess" f - frac(eta sqrt(D), l) f = 0 \, wide frac(eta sqrt(D), l) gt.eq eta /
     e > 0 . $ <eq:elliptic:end-trace>]
  For small $a_N > 0$ and a sufficiently large fixed $r_2 \( N \)$, $v_N \( r \) = e^(- a_N \( r - r_2 \))$ obeys
  $ A_chi : "Hess" v_N - frac(eta sqrt(D), l) v_N < 0 quad \( r gt.eq r_2 \) . $
  In fact $0 < A_chi lt.eq I$ and the end metric bounds give $A_chi : "Hess" v_N lt.eq
    C \( a_N^2 + a_N \/ r \) v_N$; choose $C a_N^2 < eta \/ \( 4 e \)$ and then $r_2$ large.
    Multiples of $plus.minus v_N$ dominate $f$ at $S_(r_2)$ and at the outer zero sphere.
    The maximum principle for the operator in Equation (5.56), with its coefficients evaluated at the solution,
    proves exponential decay uniformly on all truncations. The already established scalar local estimates,
    on balls and boundary half-balls of a fixed size, then give the same decay for every derivative of $f$.
    In particular $t - Z$ and its derivatives are exponentially small.
  The second equation can consequently be written, with an error exponentially small through every fixed number of
    derivatives, as
  #[#set math.equation(numbering: n => "(5.57)")
   $ k Delta_g Z + k B_N \( Z \) \| d Z \|_g^2 = rho - theta.alt \( N \( Z + epsilon.alt \) \) C_N rho_0 +
     O_j \( e^(- a_N r) \) \,\
B_N \( z \) = \( k - 1 \) + p \( z \) - delta_0 s_(p \( z \)) . $ <eq:elliptic:end-equation>]
  To verify this formula, set $f = 0$ in the coefficients. Then $D = 1$, $t = Z$, $w = 0$, $A_chi = I$, $cal(T) =
    k s_(p \( Z \)) \| d Z \|^2$, and $V = k u \( Z \) nabla Z$ with $\( log u \)' = k - 1 + p$.
    Every difference from these expressions has an exponentially small factor involving a derivative of $f$;
    its other factors are bounded at fixed $N$ by local regularity.
    This also proves the differentiated error assertion. The outer boundary causes no loss,
    since the same fixed-size local estimates hold there uniformly in $R$.
  Define a smooth increasing function $Q_N$ on the bounded range of $Z$ by
  $ Q_N \( 0 \) = 0 \, wide Q'_N \( z \) = exp (integral_0^z B_N \( tau \) thin d tau) . $
  Its derivative has positive upper and lower bounds at fixed $N$. Equation (5.57) and the chain rule give
  #[#set math.equation(numbering: n => "(5.58)")
   $ \| Delta_g Q_N \( Z \) \| lt.eq C'_N r^(- n - beta) \, wide Q_N \( Z \) \|_(S_R) = 0 . $ <eq:elliptic:end-poisson>]
  Here $C'_N$ denotes a constant at fixed $N$, not necessarily the penalty polynomial. The function
  $ b_(*) \( r \) = r^(2 - n) \( 1 - r^(- beta \/ 2) \) $
  is positive for $r > 1$ and satisfies
  $ Delta_g b_(*) = - beta / 2 (n - 2 + beta / 2) r^(- n - beta \/ 2) + O \( r^(2 - 2 n) \) < 0 $
  sufficiently far out. The correction dominates the metric error because $beta \/ 2 < n - 2$.
    Taking a sufficiently large multiple of $b_(*)$ dominates both the source in Equation (5.58) and the inner
    boundary values. Comparison with its two signs, also valid on the outer zero sphere,
    gives $\| Q_N \( Z \) \| lt.eq C'_N r^(2 - n)$ on every truncation.
    Monotonicity of $Q_N$ gives $Z = O \( r^(2 - n) \)$, and hence the same bound for $t$.
  Rescale successive end annuli to unit size. The metric coefficients have uniformly controlled derivatives and
    converge to the Euclidean ones. The right side of the equation for $Q_N \( Z \)$ is a smooth function of $Z$
    times $r^(- n - beta)$ plus exponentially small terms. Interior Poisson $W^(2 \, p)$ estimates,
    then Schauder estimates and differentiation, give $Z \, t = O_j \( r^(2 - n) \)$ for each $j$;
    the constants may depend on $N \, j$. Finally $\| d Z \|^2 = O \( r^(2 - 2 n) \) = O \( r^(- n - beta) \)$,
    since $beta < n - 2$. Equation (5.57) now proves the stated $Delta_g t$ bound and finishes the theorem. ◻
]

For the resulting solution, Proposition 18 now applies with all of its end hypotheses verified.
  In particular, writing $omega = omega_(n - 1)$ and $frak(F)_N =
  lim_(r arrow.r oo) integral_(S_r) g \( V \, nu_g \) thin d A_g$,

#[#set math.equation(numbering: n => "(5.59)")
 $ hat(E) - E_0 = - frac(frak(F)_N, k omega) \, wide frak(F)_N = integral_(cal(M)_N) u Xi thin d V_g gt.eq -
   cal(P)_N \( ell + ell^(1 \/ 2) \) . $ <eq:elliptic:constructed-energy>]

Here $E_0$ is the energy of the fixed prepared data. The metric also satisfies $hat(g) gt.eq
  e^(- 2 epsilon.alt) g$ pointwise. The flux estimate uses the polynomial penalty-band calculation of that
  proposition; the arbitrarily $N$-dependent constants in the end regularity estimates are used only to justify
  the flux and its normalization.

#prodef([Remark 5.8.])[
  The construction exhausts the radii only after $N$ has been fixed.
    Equations (5.1) and (5.2) are the estimates used with $N arrow.r oo$ in the next section.
    No bound for a high derivative that depends arbitrarily on $N$ is substituted for a polynomial bound.
    In particular, this proof takes no elliptic limit as $N arrow.r
    oo$ and imposes no equation on a limiting singular hypersurface.
] <rem:elliptic:limit-order>

== 6 Height separation and a weak minimizing enclosure <sec:height>

Throughout this section the data satisfy Definition 6. In particular, $K$ has compact support,
  the dominant energy inequality is strict, and every component of $S$ has strictly negative future expansion.
  Write $a$ for the full-cut infimum of these prepared data. Fix $0 < epsilon.alt < 1$.
  We use the smooth solution on the filled manifold $cal(M)_N$ supplied by Theorem 19,
  with the notation of Proposition 15. Thus

#[#set math.equation(numbering: n => "(6.1)")
 $ ell = e^(- N epsilon.alt) \, wide eta = ell^(3 \/ 2) \, wide h = eta f \, wide hat(g) =
   e^(2 t) \( g + l^2 d f ⊗ d f \) . $ <eq:height:parameters>]

On the filling, $g$ denotes its smooth extension. All comparisons with the original cut infimum will take place in
  the original exterior.

We first state precisely what is needed from the analytic construction.
  After increasing a polynomial $P_N = P \( N \)$, its estimates give

#[#set math.equation(numbering: n => "(6.2)")
 $ - epsilon.alt < t lt.eq Z lt.eq P_N \, wide ell lt.eq l lt.eq e \, wide \| f \| + \| d f \|_g lt.eq e^(P_N) \,
   wide \| h \| lt.eq C_0 . $ <eq:height:quantitative-input>]

Moreover, $\| h \| lt.eq C r^(- b_1)$ on the original end, with $C$ independent of $N$.
  Local geometry of the background filling is uniformly bounded;
  its added product lengths and volume are $O \( 1 + N \)$.
  In particular it has uniform coordinate balls of some radius $r_0 > 0$,
  with uniform local isoperimetric constants. For each fixed $N$, the end estimates are

#[#set math.equation(numbering: n => "(6.3)")
 $ t = O_j \( r^(2 - n) \) \, wide Delta_g t = O \( r^(- n - beta) \) \, wide
   f upright(" and its derivatives decay exponentially") \, $ <eq:height:end-input>]

where $beta > 0$. Constants in Equation (6.3) may depend arbitrarily on fixed $N$.
  Only Equation (6.2) and the uniform height barrier will be used in estimates required to be polynomial in $N$.

The height separates the filling from infinity: it remains uniformly negative on the filling and tends uniformly
  to zero on the original end. We use this separation to place a large constant conformal factor around the
  filling. The cutoff vanishes on a distant tail, so it leaves the ADM energy unchanged.
  Its transition derivatives are small by weighted coercivity.
  We then minimize perimeter subject to a distance obstacle inside the plateau.
  Contact with that obstacle would give positive volume densities on both sides of the frontier;
  the plateau would turn the resulting perimeter into an area larger than a distant competitor.
  Detachment places the exterior and a neighborhood of its frontier in the region of controlled scalar curvature.
  The construction and its estimates are at fixed prepared data and fixed $epsilon.alt$.

=== 6.1 A negative height on the whole filling <a-negative-height-on-the-whole-filling>

#thm([Lemma 6.1.])[
  (The cap and collar barrier).  #emph[The product lengths in the filling can be chosen $O \( 1 + N \)$ so that,
    for some $b_2 > 0$ independent of $N$, every sufficiently large $N$ satisfies
#[#set math.equation(numbering: n => "(6.4)")
 $ h < - b_2 quad upright("on the whole added filling and a neighborhood of ") S . $ <eq:height:negative-core>]

 The conclusion concerns the final solution with the original prepared $K$;
   no analogous assertion is required along the existence homotopy.]
] <lem:height:ramp>

#proof[
  Use the signed transverse coordinate $s$ increasing from each product neck toward $S$ and the original end.
    The fixed transition from product geometry to an original collar has been chosen so that its leaves have
  #[#set math.equation(numbering: n => "(6.5)")
   $ H_s + "tr"_(T S_s) K lt.eq - 4 delta $ <eq:height:leaf-expansion>]
  for some fixed $delta > 0$. Shrink $delta$ when necessary.
    On the cap and the product part $K = - L_0 g$, where $L_0$ is a fixed large constant.
  It is useful to write the trace equation directly in terms of $h$.
    At a point where a test function has the same gradient as $h$, put $a_0 =
    eta \/ l$ and let $chi$ have its value for the solution there. The operator applied to the test function $v_(*)$ is
  #[#set math.equation(numbering: n => "(6.6)")
   $ cal(Q) \( v_(*) \) = "tr"_(A_chi) K + frac("tr"_(A_chi) "Hess"_g v_(*), sqrt(a_0^2 + \| d v_(*) \|_g^2)) .
     $ <eq:height:test-operator>]
  The equation is $cal(Q) \( h \) = h$. The coefficients in Equation (6.6) are evaluated at the solution;
    we do not replace its value of $t$ by one computed from the barrier. Nevertheless,
  #[#set math.equation(numbering: n => "(6.7)")
   $ 0 < chi lt.eq d = frac(a_0^2, a_0^2 + \| d h \|_g^2) \, wide eta / e lt.eq a_0 lt.eq eta / ell =
     ell^(1 \/ 2) . $ <eq:height:axial-smallness>]
  These inequalities suffice for a comparison at a positive maximum of $h - v_(*)$.
  Set $v_(*) = - delta$ on the cap. On a product neck let $q_N = v'_(*) gt.eq 0$ start from zero,
    increase approximately exponentially, and end at a small fixed number $q_(*) > 0$.
    One explicit construction is to take an exponential $q_(*)
    e^(s - L_N)$ where its size lies between a constant multiple of $eta$ and $q_(*)$,
    smooth its end to the constant $q_(*)$ on an interval of fixed length,
    and multiply its initial part by a fixed smooth cutoff on an interval where it is $O \( eta \)$. Choose
  $ L_N = log \( q_(*) \/ eta \) + O \( 1 \) = O \( 1 + N \) . $
  The cutoff can be flat at its initial endpoint. This construction gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| q'_N \| lt.eq C \( q_N + eta \) \, wide integral q_N thin d s lt.eq C q_(*) + C eta \,
     $ <eq:height:ramp-estimates>]
  with $C$ independent of $N$. Thus $v_(*)$ glues smoothly to the constant on the cap.
    The same construction is made separately on every neck. The cap value is common to all components.
  The product Hessian has only an axial component. Equations (6.7)–(6.8) give, even where the slope vanishes,
  $ frac(chi \| v''_(*) \|, sqrt(a_0^2 + \| v'_(*) \|^2)) lt.eq
    C frac(q_N + eta, sqrt(\( eta \/ e \)^2 + q_N^2)) lt.eq C' . $
  Consequently $cal(Q) \( v_(*) \) lt.eq - k L_0 + C'$ on this part.
    Choose $L_0$ large enough that this is less than $- 2 delta$.
    Since $v_(*) gt.eq - delta$, this is a strict supersolution inequality $cal(Q) \( v_(*) \) < v_(*)$.
    It also holds on the constant cap, where the trace of $K$ is $- n L_0$.
  Continue with the fixed slope $q_(*)$ across the fixed transition and up to $S$.
    Choose $q_(*)$ so small that all the increase up to $S$, including Equation (6.8), is less than $delta \/ 4$.
    Beyond $S$, still inside the fixed strictly trapped collar, increase the slope smoothly until $v_(*) > C_0 +
    1$ at the outer edge of that collar. This requires only a fixed, possibly large, slope and fixed derivatives;
    they do not depend on $N$. Keep $v'_(*) gt.eq q_(*)$ on the entire transition and collar.
    For such a function of signed distance,
  $ cal(Q) \( v_(*) \) = "tr"_(T S_s) K + chi K \( partial_s \, partial_s \) + v'_(*) /
    sqrt(a_0^2 + \( v'_(*) \)^2) H_s + frac(chi v''_(*), sqrt(a_0^2 + \( v'_(*) \)^2)) . $
  Equation (6.7) shows that this converges uniformly to the left side of Equation (6.5).
    For example, the absolute error is bounded by $C ell \/ q_(*)^2 + C ell sup \| v''_(*) \| \/ q_(*)^3$,
    with fixed $C$. For large $N$ it is therefore less than $delta$.
    As $v_(*) gt.eq - delta$, again $cal(Q) \( v_(*) \) < v_(*)$.
  Apply the maximum test on the compact region consisting of the cap, necks, transitions, and these outer collars.
    On its outer boundary $h - v_(*) < 0$. At a positive interior maximum, the gradients agree and $"Hess" h lt.eq
    "Hess" v_(*)$. Positive definiteness of $A_chi$ would give
  $ h = cal(Q) \( h \) lt.eq cal(Q) \( v_(*) \) < v_(*) < h \, $
  a contradiction. Thus $h lt.eq v_(*)$. Up to $S$ the barrier is less than $- 3 delta \/ 4$.
    Continuity of the fixed collar barrier gives the same strict negative bound on a small neighborhood of $S$.
    Taking, for example, $b_2 = delta \/ 2$ proves the assertion. ◻
]

=== 6.2 Increasing area without losing exterior scalar curvature <increasing-area-without-losing-exterior-scalar-curvature>

Choose $0 < b_3 < b_2 \/ 4$ so small that

#[#set math.equation(numbering: n => "(6.9)")
 $ mu - \| J \|_g - rho - b_3 \| tau \| gt.eq 1 / 2 rho > 0 quad
   upright("on the original exterior") . $ <eq:height:strict-margin>]

This follows from the strict prepared inequality and the choice of $rho$ in the scalar construction:
  outside the compact support of $tau$ no smallness condition on $b_3$ is needed,
  and on that compact set choose $b_3 \| tau \| lt.eq rho \/ 2$.
  Let $zeta in C^oo \( bb(R) \)$ be nonnegative, equal to zero for $\| z \| lt.eq b_3 \/ 4$,
  equal to one for $\| z \| gt.eq b_3 \/ 2$, and with values in $\[ 0 \, 1 \]$. Define

#[#set math.equation(numbering: n => "(6.10)")
 $ A_N = \( ell \/ eta \)^(1 \/ 2) = ell^(- 1 \/ 4) \, wide psi_N = A_N zeta \( h \) \, wide tilde(g)_N =
   e^(2 psi_N) hat(g) . $ <eq:height:plateau-metric>]

The height barrier on the end puts ${ \| h \| gt.eq b_3 \/ 4 }$ in a fixed original coordinate radius,
  together with the added filling. Hence $psi_N$ vanishes identically near infinity.
  It changes neither the ADM energy nor the asymptotic estimates of $hat(g)$.

#thm([Lemma 6.2.])[
  (Curvature on the small-height exterior).  #emph[For all sufficiently large $N$,
$ R_(tilde(g)_N) gt.eq 0 quad upright("on ") Omega ∩ { \| h \| lt.eq b_3 } . $

 On the original exterior the metric satisfies $tilde(g)_N gt.eq e^(- 2 epsilon.alt) g$. Its ADM energy obeys
#[#set math.equation(numbering: n => "(6.11)")
 $ E \( tilde(g)_N \) lt.eq E + P_N \( ell + ell^(1 \/ 2) \) . $ <eq:height:energy-upper>]

]
] <lem:height:curvature>

#proof[
  The solution supplied by Theorem 19 has $t > - epsilon.alt$ and the parameters of the scalar construction.
    Thus Equation (4.23) applies without a change of data or normalization.
    On $\| h \| lt.eq b_3$, its constraint and trace terms have lower bound $rho \/ 2$ by Equation (6.9);
    the remaining terms are nonnegative and retain the positive contribution $\( 1 - delta_0 \) cal(T)$.
  For the new conformal factor we use Equation (4.25), with $eta = ell^(3 \/ 2)$.
    Its constants are polynomial in $N$ for these fixed prepared data.
    The factor $sqrt(d)$ in the height Laplacian cancels the axial loss in weighted coercivity,
    as shown immediately after that equation. No arbitrary fixed-$N$ estimate for unweighted second derivatives
    enters this bound.
  The conformal scalar-curvature law in dimension $n = k + 1$ reads
  #[#set math.equation(numbering: n => "(6.12)")
   $ 1 / 2 e^(2 \( t + psi_N \)) R_(tilde(g)_N) = 1 / 2 e^(2 t) R_(hat(g)) - k e^(2 t) Delta_(hat(g)) psi_N -
     frac(k \( k - 1 \), 2) e^(2 t) \| d psi_N \|_(hat(g))^2 . $ <eq:height:conformal-curvature>]
  The chain rule, Equation (4.25), and the fixed derivative bounds of $zeta$ imply
  $ \| e^(2 t) Delta_(hat(g)) psi_N \| & lt.eq P_N ell^(1 \/ 4) \( 1 + sqrt(cal(T)) \) + C ell^(3 \/ 4) \,\
e^(2 t) \| d psi_N \|_(hat(g))^2 & lt.eq C ell^(1 \/ 2) . $
  On the support of these errors $b_3 \/ 4 lt.eq \| h \| lt.eq b_3 \/ 2$.
    This region is disjoint from the filling by Lemma 27, and is contained in a fixed compact portion of the
    original exterior. There $rho gt.eq c_(*) > 0$. Young’s inequality bounds the error containing $sqrt(cal(T))$
    by $\( 1 - delta_0 \) cal(T) \/ 2 + P_N ell^(1 \/ 2)$. All remaining errors tend to zero.
    Equation (4.23) therefore proves nonnegative scalar curvature there for large $N$.
    Where $zeta$ is constant, Equation (6.12) has no error terms and the same conclusion follows directly.
  The floor $t > - epsilon.alt$, the nonnegative graph term, and $psi_N gt.eq 0$ give the metric comparison.
    Finally $psi_N = 0$ near infinity, so Equation (6.11) is exactly Proposition 18.
    In particular its sign is the upper energy estimate required for the Riemannian inequality. ◻
]

=== 6.3 Perimeter minimization and detachment from a distance obstacle <perimeter-minimization-and-detachment-from-a-distance-obstacle>

We use full perimeter in the filled manifold. For a measurable set $F$ and an open set $U$,
  write $P_gamma \( F \; U \) = \| D upright(bold(1))_F \|_gamma \( U \)$ for perimeter in a smooth metric
  $gamma$, and $P_gamma \( F \) = P_gamma \( F \; cal(M)_N \)$.
  The frontier is the support of this perimeter measure. For a set of finite perimeter its integration boundary is
  the reduced boundary $partial^(*) F$, and $P_gamma \( F \; U \) = cal(H)_gamma^k \( partial^(*) F ∩ U \)$.
  These conventions distinguish full perimeter from a relative frontier inside $Omega$.

The final exterior and an ambient neighborhood of its frontier must lie in the original small-height region where
  Lemma 28 applies. We therefore enclose the whole set where $\| h \| gt.eq b_3$, which contains the filling,
  and use a thin distance neighborhood of that set as the obstacle.
  Its distance collar will supply the filled-side density if a minimizing frontier touches it. Put

#[#set math.equation(numbering: n => "(6.13)")
 $ C_N^h = { \| h \| gt.eq b_3 } \, wide O_N = { x : "dist"_g \( x \, C_N^h \) lt.eq s_N } \, wide s_N =
   e^(- Q_N) \, $ <eq:height:obstacle>]

where $Q_N$ is a sufficiently large polynomial. It can be chosen so that $s_N < r_0 \/ 10$ and

#[#set math.equation(numbering: n => "(6.14)")
 $ 3 s_N sup \| d h \|_g < b_3 \/ 2 . $ <eq:height:plateau-neighborhood>]

Indeed $\| d h \| lt.eq eta e^(P_N)$ by Equation (6.2). The entire $2
  s_N$-neighborhood of $O_N$ then lies in ${ \| h \| > b_3 \/ 2 }$, where $tilde(g)_N = e^(2 A_N) hat(g)$.
  The compact obstacle $O_N$ contains the whole added filling and a neighborhood of $S$.
  No smoothness of $partial O_N$ is asserted or needed. Outside $O_N$ we are in $"int" Omega ∩ { \| h \| < b_3 }$;
  detachment from $O_N$ will provide the required ambient neighborhood as well.

#thm([Lemma 6.3.])[
  (Existence with a compact support bound).  #emph[There is a bounded finite-perimeter set $F_N supset O_N$,
    modulo null sets, minimizing $P_(tilde(g)_N)$ among all bounded sets containing $O_N$.
    One may choose it to contain every other minimizer modulo null sets. Its perimeter satisfies
#[#set math.equation(numbering: n => "(6.15)")
 $ P_(tilde(g)_N) \( F_N \) lt.eq e^(P_N) . $ <eq:height:competitor-bound>]

]
] <lem:height:BV-existence>

#proof[
  At fixed $N$ the end is smooth and asymptotically Euclidean with the differentiated falloff in Equation (6.3).
    Consequently sufficiently large coordinate spheres have positive mean curvature for $tilde(g)_N$ toward
    infinity. The required radius may depend arbitrarily on $N$.
  Here is the clipping argument that gives the compact support needed for the direct method.
    All objects in this paragraph use $tilde(g)_N$. On the large end let $Y = nabla r \/ \| nabla r \|$,
    so $\| Y \| = 1$ and $"div" Y = H_r > 0$. For a bounded finite-perimeter competitor $F$ and almost every large
    $R$, Gauss–Green on $F ∩ { r > R }$ gives
  $ integral_(F ∩ { r > R }) H_r thin d V = integral_(partial^(*) F ∩ { r > R }) chevron.l Y \,
    nu_F chevron.r thin d A - cal(H)^k \( F^(\( 1 \)) ∩ S_R \) . $
  The spherical normal here is $- Y$. Boundedness of $F$ eliminates an outer flux;
    alternatively first cut off $Y$ beyond its support. The first boundary integral is at most
    $P \( F \; { r > R } \)$. The BV truncation formula therefore yields the stronger clipping inequality
  #[#set math.equation(numbering: n => "(6.16)")
   $ P_(tilde(g)_N) \( F ∩ { r < R } \) lt.eq P_(tilde(g)_N) \( F \) -
     integral_(F ∩ { r > R }) H_r thin d V_(tilde(g)_N) . $ <eq:height:clipping>]
  The Gauss–Green and truncation formulas hold at almost every radius by the trace and slicing theorems for BV
    functions #cite(label("AFP")). The notation ${ r < R }$ here includes the entire compact core.
    In particular it contains $O_N$ once $R$ is sufficiently large.
  Choose a fixed interval of such radii beyond the obstacle.
    Applying Equation (6.16) to each term of a minimizing sequence,
    with an almost-everywhere admissible radius in that interval, confines the sequence to one compact set.
    BV compactness gives $L^1$ convergence along a subsequence, and lower semicontinuity gives a minimizer.
    Containment of $O_N$ is preserved almost everywhere. The minimum is the unrestricted bounded-competitor
    minimum, so local variations are not subject to an artificial outer constraint.
  Choose a fixed original coordinate sphere $S_(R_(*))$ so far out that $\| h \| < b_3 \/
    4$ on and beyond it for every $N$. It encloses $O_N$ when $N$ is large.
    On it $psi_N = 0$, and Equation (6.2) implies $hat(g) lt.eq e^(P_N) g$.
    Its filled side is a competitor; increasing $P_N$ gives Equation (6.15).
    The fixed sphere need not lie in the region used for clipping:
    the latter was needed only for compactness at fixed $N$.
  All minimizers have a common compact support bound: if a minimizer had positive volume beyond an
    almost-everywhere admissible clipping radius, the strictly positive last integral in Equation (6.16) would
    contradict minimality. Among minimizers, maximize the enclosed volume.
    Compactness, lower semicontinuity, and convergence of volume show that this maximum is attained.
    Perimeter submodularity implies
  $ P \( F union G \) + P \( F ∩ G \) lt.eq P \( F \) + P \( G \) . $
  For two minimizers both sets on the left contain $O_N$, so equality holds and their union is a minimizer.
    Maximal volume therefore implies $G subset F_N$ modulo null sets for every minimizer $G$. ◻
]

#thm([Lemma 6.4.])[
  (Two densities and detachment).  #emph[For all sufficiently large $N$,
#[#set math.equation(numbering: n => "(6.17)")
 $ "supp" \| D upright(bold(1))_(F_N) \| ∩ O_N = diameter . $ <eq:height:detached>]

]
] <lem:height:detachment>

#proof[
  The two different density arguments are illustrated in Figure 1. Suppose $p$ belongs to this intersection.
    It cannot lie in the interior of $O_N$, because $F_N$ contains $O_N$ almost everywhere.
    Thus $"dist"_g \( p \, C_N^h \) = s_N$. The complete background metric has a minimizing geodesic from some $z
    in C_N^h$ to $p$. In particular $B_(s_N)^g \( z \) subset O_N$.
    The midpoint of this geodesic is the center of a ball of radius $s_N \/
    4$ contained in both $O_N$ and $B_(s_N)^g \( p \)$. Uniform background ball-volume bounds give
  #[#set math.equation(numbering: n => "(6.18)")
   $ "Vol"_g \( F_N ∩ B_(s_N)^g \( p \) \) gt.eq c s_N^n . $ <eq:height:filled-density>]
  This is the filled-side density, obtained from the distance obstacle.
  We derive the other density from minimization. On $B_(s_N)^g \( p \)$ the high conformal multiplier is constant.
    Remove it and write $gamma = hat(g)$. Equation (6.2) gives, on this ball and every $k$-plane,
  #[#set math.equation(numbering: n => "(6.19)")
   $ e^(- P_N) g lt.eq gamma lt.eq e^(P_N) g \, wide e^(- P_N) d A_g lt.eq d A_gamma lt.eq e^(P_N) d A_g \,
     $ <eq:height:pointwise-comparison>]
  after changing the polynomial. No derivative of $gamma$ appears in this comparison.
  Put $U = cal(M)_N \\ F_N$ and $V \( r \) = "Vol"_g \( U ∩ B_r^g \( p \) \)$.
    Since $p$ is in the support of perimeter, $V \( r \) > 0$ for every $r > 0$:
    otherwise $upright(bold(1))_(F_N)$ would be constant almost everywhere on some neighborhood of $p$.
    For almost every $0 < r < s_N$, filling the ball is an admissible competitor.
    Cancel the unchanged exterior perimeter and the common constant factor $e^(k A_N)$.
    The perimeter truncation formula gives
  $ P_gamma \( U \; B_r^g \( p \) \) lt.eq cal(H)_gamma^k \( U^(\( 1 \)) ∩ partial B_r^g \( p \) \) . $
  Here $U^(\( 1 \))$ is the measure-theoretic interior; the displayed trace agrees with it for almost every
    radius. The coarea formula in the smooth background metric and Equation (6.19) then yield
  #[#set math.equation(numbering: n => "(6.20)")
   $ P_g \( U \; B_r^g \( p \) \) lt.eq e^(P_N) V' \( r \) quad
     upright("for almost every ") r in \( 0 \, s_N \) . $ <eq:height:one-sided-perimeter>]
  The absolute isoperimetric inequality on a uniformly controlled background ball,
    applied to the zero extension of $upright(bold(1))_(U ∩ B_r^g \( p \))$, includes its spherical trace:
  $ V \( r \)^(\( n - 1 \) \/ n) lt.eq C #scale(x: 120%, y: 120%)[\(] P_g \( U \; B_r^g \( p \) \) +
    V' \( r \) #scale(x: 120%, y: 120%)[\)] lt.eq e^(P_N) V' \( r \) . $
  Local Euclidean isoperimetry in a uniform coordinate ball proves this form;
    the smooth background metric changes its constant by a fixed factor.
    Since $V$ is absolutely continuous and positive for $r > 0$, its $n$th root satisfies
  $ \( V^(1 \/ n) \)' \( r \) gt.eq n^(- 1) e^(- P_N) quad upright("almost everywhere on ") \( 0 \, s_N \) . $
  Integrate from $a > 0$ to $r$ and let $a arrow.b 0$. The result is
  #[#set math.equation(numbering: n => "(6.21)")
   $ V \( r \) gt.eq e^(- P_N) r^n wide \( 0 < r lt.eq s_N \) \, $ <eq:height:unfilled-density>]
  with another polynomial. This proves the unfilled-side density from a one-sided comparison,
    without assuming that the obstacle contact is a regular point or that the deformed metric has controlled
    derivatives.
  Relative isoperimetry in $B_(s_N)^g \( p \)$, together with Equations (6.18) and (6.21), now gives
  $ P_g \( F_N \; B_(s_N)^g \( p \) \) gt.eq e^(- P_N) s_N^(n - 1) . $
  Absorb $s_N^(n - 1) = e^(- \( n - 1 \) Q_N)$ into the polynomial exponential, use Equation (6.19),
    and restore the constant multiplier. We obtain
  #[#set math.equation(numbering: n => "(6.22)")
   $ P_(tilde(g)_N) \( F_N \) gt.eq exp \( k A_N - P_N \) = exp #scale(x: 120%, y: 120%)[\(] k
     e^(N epsilon.alt \/ 4) - P_N #scale(x: 120%, y: 120%)[\)] . $ <eq:height:contact-cost>]
  For fixed $epsilon.alt > 0$, $e^(N epsilon.alt \/ 4)$ dominates every polynomial in $N$.
    Equation (6.22) contradicts Equation (6.15) for large $N$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.518, fill: rgb("#e8e8ff"), stroke: none)
  circle((0, 0), radius: 1.518, stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  circle((1.518, 0), radius: 1.518, stroke: (paint: rgb("#a65300"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((0.759, 0), radius: 0.3795, fill: rgb("#9999ff"), stroke: none)
  circle((0.759, 0), radius: 0.3795, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (1.518, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((0.46, 0.7176), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#e8e8ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$d_g(z,p)=s$]]])])
  circle((0, 0), radius: 0.0322, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$z$]], anchor: "north-east", padding: 0.1176cm)
  circle((0.759, 0), radius: 0.0322, fill: black, stroke: none)
  circle((1.518, 0), radius: 0.0414, fill: black, stroke: none)
  content((1.518, 0), [#text(size: 9pt)[$p$]], anchor: "north-west", padding: 0.1176cm)
  content((-0.506, 1.748), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$B_s^g(z) subset O_N$]]])
  content((2.088, 1.748), [#text(fill: rgb("#a65300"))[#text(size: 9pt)[$B_s^g(p)$]]])
  line((0.7176, -1.638), (0.759, -0.4232), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  content((0.7176, -1.748), [#text(size: 9pt)[a ball of radius $s"/"4$#linebreak()inside both balls]], anchor: "north", padding: 0.1176cm)
  content((3.68, 0.368), [#text(size: 9pt)[Obstacle inclusion gives#linebreak()$"Vol"_g(F_N inter B_s^g(p)) gt.eq c s^n$.#linebreak() Filling-ball comparison gives#linebreak()$"Vol"_g(F_N^c inter B_s^g(p)) gt.eq e^(-P_N)s^n$.]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The two densities at a hypothetical contact point $p in "supp" \| D upright(bold(1))_(F_N) \| ∩ partial O_N$, with $z in C_N^h$ chosen so that $d_g \( z \, p \) = s = s_N$. The circles depict background metric balls schematically; no regularity of the obstacle or of the contact is assumed. Their overlap provides the first density. Minimality provides the second. Relative isoperimetry then forces perimeter inside the large constant conformal plateau, contradicting the competitor bound. ],
) <fig:height:two-densities>

=== 6.4 The exterior, its full boundary, and its area <the-exterior-its-full-boundary-and-its-area>

#proof[
  #strong[The connected exterior and its curvature region.]
  Choose $F_N$ as in Lemma 29. Its frontier is compact and, by Lemma 30, has positive distance from $O_N$.
    Every sufficiently small variation of the set near a frontier point remains admissible.
    Thus its boundary is locally perimeter minimizing in the smooth metric $tilde(g)_N$.
  We use the regularity theorem for codimension-one minimizing boundaries:
    the support of the perimeter measure is a smooth embedded minimal hypersurface outside a relatively closed set
    of Hausdorff dimension at most $n - 8$. A directly applicable smooth-ambient formulation is
    #cite(label("SimonGMT")) Chapter 7, Section 5, Theorem 5.8; its hypersurface dimension is $k = n - 1$,
    so the singular bound is $k - 7 = n - 8$. Multiplicity one for the boundary of a set is recorded in
    #cite(label("SimonGMT")) Chapter 7, Section 5, Remark 5.2.
    The compactness and tangent-cone conclusions used in the minimizing-boundary regularity argument are
    Theorems 5.3 and 5.5 of that section.
  We also specify the representative of the filled set. Since the frontier is detached from the obstacle,
    both insertion and deletion of a sufficiently small ball are admissible.
    The coarea and isoperimetric argument used in the preceding lemma, now applied to each side,
    gives positive lower volume densities for both $F_N$ and its complement at every point in the support of
    perimeter. On a ball not meeting that support the indicator has zero distributional derivative,
    hence is constant almost everywhere. Let $U_N$ be the union of those balls on which that constant is zero,
    and let the closed filled representative be $cal(M)_N \\ U_N$.
    The two density bounds identify its topological frontier with the perimeter support:
    every neighborhood of a support point contains both filled and unfilled points.
    Conversely a point outside the support has a constant-indicator neighborhood.
    This representative agrees with $F_N$ up to a null set; the regularity theorem makes its frontier
    $n$-dimensional-volume null. Its perimeter and all the preceding minimizing comparisons are therefore unchanged.
  Put $Sigma_N = partial U_N$. There is only one component of $U_N$.
    Indeed there is exactly one unbounded component, since $F_N$ is bounded and the ambient manifold has just one
    end. Filling all bounded complementary components cannot increase perimeter.
    This statement can be seen directly on regular boundary charts,
    where it deletes the separating sheets and adds no sheet; the singular set has zero $cal(H)^k$ measure.
    Equivalently it is the component decomposition and perimeter additivity for finite-perimeter sets
    #cite(label("AFP")). The resulting set is still an admissible bounded competitor.
    If any bounded open component existed, its positive volume would strictly increase the filled volume;
    minimality would either be contradicted by a perimeter decrease or preserved with a volume increase.
    Both alternatives contradict the choice of $F_N$. Thus $U_N$ is connected.
    We take $X_N = overline(U_N)$, with its ambient boundary included.
  The exterior lies in $Omega ∩ { \| h \| < b_3 }$, because the filled set contains $O_N supset C_N^h$.
    In fact it has a smooth ambient neighborhood in that region:
    detachment gives positive separation between $Sigma_N$ and $O_N$,
    and compactness permits a smooth compact domain containing $O_N$ whose boundary is still strictly inside the
    filled set. Remove that domain. On the remaining smooth ambient exterior,
    Lemma 28 gives nonnegative scalar curvature, also on a neighborhood of $Sigma_N$.
  All local variations of $Sigma_N$ have zero first variation.
    More precisely, if $Y$ is a compactly supported smooth ambient vector field near the frontier and $Phi_s$ is
    its flow, then $Phi_s \( F_N \)$ remains admissible for both signs of small $s$.
    Differentiation of the perimeter area formula gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ integral_(partial^(*) F_N) "div"_(T_x partial^(*) F_N) Y thin d cal(H)_(tilde(g)_N)^k =
     0 . $ <eq:height:weak-minimality>]
  This is stationarity of the full boundary varifold, including the assertion that there is no additional
    first-variation term at the singular set. Global outer minimization follows because every bounded superset of
    $F_N$ also contains $O_N$. The maximal choice of $F_N$ also makes it the outermost member among enclosures
    with this same minimum perimeter, although outermostness is not required below.
  #strong[Comparison with full original cuts.]
  We verify the comparison with original full cuts in some detail.
    Detachment and Lemma 27 put $Sigma_N$ in $"int" Omega$, separated from a neighborhood of the entire original
    filling, including every component of $S$. There are bounded smooth open sets $F_j$ in the filled manifold such that
  #[#set math.equation(numbering: n => "(6.24)")
   $ upright(bold(1))_(F_j) arrow.r upright(bold(1))_(F_N) upright(" in ") L^1 \, wide P_g \( F_j \) arrow.r
     P_g \( F_N \) \, $ <eq:height:strict-approximation>]
  and each $F_j$ still contains a fixed neighborhood of the whole filling.
    Here is a way to impose the last condition in strict BV approximation.
    Choose a smaller compact neighborhood on which $upright(bold(1))_(F_N) = 1$ almost everywhere,
    separated from $Sigma_N$, and a compact exterior region where it is zero.
    Smooth the characteristic function in finitely many coordinate charts only in the remaining region,
    using a partition of unity and leaving those two constant regions fixed.
    The resulting smooth functions $u_j in \[ 0 \, 1 \]$ converge in $L^1$ with total variation converging to
    $P_g \( F_N \)$. Choose $delta_j arrow.b 0$ so slowly that $parallel u_j -
    upright(bold(1))_(F_N) parallel_(L^1) \/ delta_j arrow.r 0$.
    By coarea there is a regular value $t_j in \( delta_j \, 1 - delta_j \)$ for which
  $ P_g \( { u_j > t_j } \) lt.eq frac(integral \| d u_j \|_g thin d V_g, 1 - 2 delta_j) + o \( 1 \) =
    P_g \( F_N \) + o \( 1 \) . $
  The $L^1$ difference of this level set from $F_N$ is at most $parallel u_j -
    upright(bold(1))_(F_N) parallel_(L^1) \/ delta_j$, and hence tends to zero.
    Lower semicontinuity gives the reverse perimeter liminf. Thus $F_j = { u_j > t_j }$ satisfies Equation (6.24).
    This is the strict approximation/coarea construction of #cite(label("AFP")),
    localized away from the two constant regions.
  For each $j$ retain the component of $cal(M)_N \\ overline(F_j)$ that contains the distant end,
    and let $D_j$ be its closure. A compact smooth boundary has finitely many components;
    retaining this exterior component merely selects some of those entire boundary components.
    It preserves smoothness and can only decrease the full boundary area.
    Because $F_j$ contains a neighborhood of the whole filling, $D_j subset Omega$,
    its interior lies in $"int" Omega$, and $D_j$ is closed and connected with a smooth compact intrinsic boundary
    $Gamma_j$. It is an admissible full cut in Definition 2. Thus
  $ a lt.eq "Area"_g \( Gamma_j \) lt.eq P_g \( F_j \) . $
  Taking the limit gives $P_g \( F_N \) gt.eq a$. No component of a cut has been discarded in evaluating its
    intrinsic boundary; the passage to $D_j$ is an admissible choice of the exterior domain itself.
    There is no coincidence with $S$ in this approximation because of the fixed neighborhood,
    and the original definition still allows coincidence for its other competitors.
  Since $tilde(g)_N gt.eq e^(- 2 epsilon.alt) g$ on $Omega$,
    comparison on every approximate tangent $k$-plane now yields
  #[#set math.equation(numbering: n => "(6.25)")
   $ cal(H)_(tilde(g)_N)^k \( Sigma_N \) = P_(tilde(g)_N) \( F_N \) gt.eq e^(- k epsilon.alt) P_g \( F_N \) gt.eq
     e^(- k epsilon.alt) a . $ <eq:height:original-area>]
  The first equality uses the regularity theorem and the zero $cal(H)^k$ measure of the singular set.
  #strong[Completeness and the end.]
  The filled metric is complete, since $tilde(g)_N gt.eq e^(- 2 epsilon.alt)
    g$ and the background filled metric is complete. Its restriction to $X_N$ is complete with the frontier
    included. Here completeness is understood in the enclosing-set convention of the Riemannian input:
    the intrinsic length distance on $X_N$ may be extended-valued,
    and its restriction to each finite-distance equivalence class is complete.
    For the intrinsic-length formulation, a Cauchy sequence has a subsequence whose successive intrinsic distances
    are less than $2^(- j)$. Join successive terms by curves of length less than $2^(1 - j)$ in $X_N$.
    Their concatenation has an ambient endpoint, by ambient completeness,
    and that endpoint belongs to $X_N$ because $X_N$ is closed.
    Appending this endpoint gives a curve in $X_N$ whose tail length tends to zero,
    proving intrinsic convergence of the subsequence and then of the original Cauchy sequence.
    The frontier is included in the closed-enclosing-set sense used in the Riemannian input in Section 2.
  Finally the end satisfies $tilde(g)_N - I = O_j \( r^(2 - n) \)$. The conformal law applied to Equation (6.3) shows
  $ R_(tilde(g)_N) = O \( r^(- n - beta) \) + O \( r^(- 2 n + 2) \) . $
  If needed decrease $beta$ so that $0 < beta < n - 2$; then the displayed bound is $O \( r^(- n - beta) \)$.
    All graph errors decay exponentially, and $psi_N$ is zero on the end.
    Scalar curvature is integrable there and, being smooth and bounded on the compact ambient neighborhood of the
    frontier, integrable on the remainder of $X_N$. The energy estimate is Lemma 28.
    This proves all the stated properties. ◻
]

#prodef([Remark 6.5.])[
  (Flux and weak boundary conventions).  The scalar flux in Proposition 18 is computed on the complete smooth
    filled manifold before an enclosure is chosen:
  $ frak(F)_N = lim_(R arrow.r oo) integral_(S_R) g \( V \, nu_g \) thin d A_g =
    integral_(cal(M)_N) u Xi thin d V_g \, wide E \( hat(g) \) - E = - frac(frak(F)_N, k omega) . $
  Thus no elliptic boundary condition or unaccounted singular-boundary flux is involved.
    If one restricts a smooth vector field to $X_N$, the Gauss–Green theorem for finite-perimeter sets gives its
    ordinary reduced-boundary flux. For instance at a regular truncation radius,
  $ integral_(U_N ∩ B_R) "div"_(tilde(g)_N) Y thin d V_(tilde(g)_N) =
    integral_(S_R) tilde(g)_N \( Y \, nu_R \) thin d A_(tilde(g)_N) -
    integral_(partial^(*) F_N) tilde(g)_N \( Y \, nu_(F_N) \) thin d A_(tilde(g)_N) \, $
  when $Y$ is supported in the indicated truncation or has its stated outer trace.
    The normal $nu_(F_N)$ points from the filled set toward the end.
    There is no further measure on the singular set. This flux convention and Equation (6.23) are the weak
    identities attached to the constructed boundary.
] <rem:height:flux>

== 7 Weakly asymptotically flat data in three dimensions <sec:weak3>

The prepared theorem can be applied under only two differentiated metric bounds and one differentiated tensor
  bound in dimension three. The reason is a separate end construction:
  first match the original ADM vector by a Schwarzschild reference slice,
  then bend that slice to rest and repair the small constraint error.
  The metric changes at distances tending to infinity. We prove compactness of minimizing enclosures before making
  those changes; it gives convergence of the full enclosing infimum, not only a one-sided area bound.
  A positive conformal family subsequently removes timelikeness as an assumption,
  and truncation of the other ends gives the complete-data statement.

=== 7.1 Initial data, normals, and enclosing area <initial-data-normals-and-enclosing-area>

We work in three spatial dimensions, with zero cosmological constant and $G = c = 1$.
  In this section $mu \, J$ denote the physical densities: the geometric densities of Equation (1.1) are $8 pi
  mu \, 8 pi J$. The ADM energy and momentum retain exactly their previous normalization.
  We spell out this dictionary again when applying the common prepared theorem.
  For a Riemannian metric $g$ and a symmetric covariant two-tensor $K$, define the constraint densities by

#[#set math.equation(numbering: n => "(7.1)")
 $ 16 pi mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide 8 pi J =
   "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] . $ <n3:intro:constraints>]

Here $J$ is a covector field. The dominant energy condition is

#[#set math.equation(numbering: n => "(7.2)")
 $ mu gt.eq \| J \|_g . $ <n3:intro:dec>]

All initial data considered here are smooth, including at a compact boundary when one is present.

On an asymptotically flat end with Euclidean coordinates $x$ and $r = \| x \|$, our basic assumptions are

#[#set math.equation(numbering: n => "(7.3)")
 $ g_(i j) - delta_(i j) = O_2 \( r^(- q) \) \, wide K_(i j) = O_1 \( r^(- 1 - q) \) \, wide q > 1 /
   2 . $ <n3:intro:decay>]

The notation $O_j \( r^(- a) \)$ includes the corresponding coordinate derivative bounds through order $j$.
  We assume that $mu$ and $\| J \|_g$ are integrable and that the following ADM limits exist and are finite:

#[#set math.equation(numbering: n => "(7.4)")
 $ E & = frac(1, 16 pi) lim_(r arrow.r oo) integral_(S_r) \( partial_j g_(i j) - partial_i g_(j j) \) n^i thin
   upright(d) A_delta \,\
P_i & = frac(1, 8 pi) lim_(r arrow.r oo) integral_(S_r) #scale(x: 120%, y: 120%)[\(] K_(i j) - \( "tr"_g K \)
  g_(i j) #scale(x: 120%, y: 120%)[\)] n^j thin upright(d) A_delta . $ <n3:intro:energy>]

The normal and area form in these definitions are Euclidean. Whenever $E > \| P \|_delta$, write

#[#set math.equation(numbering: n => "(7.5)")
 $ m = sqrt(E^2 - \| P \|_delta^2) . $ <n3:intro:rest-mass>]

For a two-sided surface $Sigma$ with specified unit normal $nu$, we use

$ H_Sigma = "div"_Sigma nu \, wide theta_(+) \( Sigma \) = H_Sigma + "tr"_Sigma K . $

Thus Euclidean spheres have positive mean curvature for the normal toward infinity.
  A future marginally outer trapped surface, abbreviated MOTS, satisfies $theta_(+) = 0$.
  A weakly future outer trapped surface satisfies $theta_(+) lt.eq 0$. Our spacetime sign convention is

#[#set math.equation(numbering: n => "(7.6)")
 $ K \( Y \, Z \) = upright(bold(g)) \( upright(bold(nabla))_Y n \, Z \) \, $ <n3:intro:k-sign>]

where $n$ is the future unit timelike normal. Equivalently,
  in Gaussian normal coordinates the spatial metric has normal derivative $2 K$.

#prodef([Definition 7.1.])[
  (Exterior and enclosing area).  An exterior is a connected orientable smooth three-manifold $Omega$ with
    nonempty compact smooth boundary, complete as a metric space with its boundary included,
    and with exactly one end, which is asymptotically flat. An enclosing cut is the entire compact smooth embedded
    two-sided intrinsic boundary of a connected closed outer domain containing the sufficiently distant end,
    with its manifold interior in the open exterior. Equivalently,
    it separates the entire inner boundary from infinity, with bounded complementary pockets filled on the inner
    side. Every frontier component is counted, including portions coinciding with the inner boundary.
    A cut may have several components. Its normal points toward the retained end. We put
  $ a_g \( partial Omega \) = inf { \| Gamma \|_g : Gamma upright(" is an enclosing cut") } . $
  When using perimeter compactness, we take the closure of this class among filled inner sets and include the area
    of any frontier coinciding with the obstacle. Smooth outward approximation gives the same infimum.
    Enclosing cuts and minimizing sets are taken with bounded complementary pockets filled.
    Auxiliary perimeter arguments may use competitors containing the inner obstacle before filling:
    filling a bounded pocket deletes its frontier, cannot increase perimeter,
    and leaves the enclosing infimum unchanged.
] <n3:intro:exterior-class>

The definition permits coincidence because first variations of the minimum need not be realized by a cut lying
  strictly outside the obstacle. It permits disconnected cuts because neither the minimizing hull nor an
  intermediate trapped boundary need be connected. The perimeter formulation and its compactness properties are
  established in Lemma 37.

=== 7.2 The one-ended exterior inequality <the-one-ended-exterior-inequality>

#thm([Theorem 7.2.])[
  (Minimum-enclosing-area inequality).  #emph[Let $\( Omega \, g \, K \)$ be an exterior as in Definition 32.
    Assume Equations (7.1)–(7.3), integrability of $mu$ and $\| J \|_g$, and the finite ADM limits (7.4)–(7.4).
    Orient $partial Omega$ by the normal into $Omega$, and suppose $theta_(+) \( partial Omega \) lt.eq 0$.
    If $E > \| P \|_delta$, then
#[#set math.equation(numbering: n => "(7.7)")
 $ sqrt(E^2 - \| P \|_delta^2) gt.eq sqrt(frac(a_g \( partial Omega \), 16 pi)) . $ <n3:intro:penrose>]

 No extension of the data across $partial Omega$ is required.]
] <n3:intro:exterior-inequality>

=== 7.3 A positive lower bound for every enclosing cut <a-positive-lower-bound-for-every-enclosing-cut>

Before preparing the end, we record a geometric fact about the full enclosing infimum.
  A thin tube joining the inner boundary to infinity carries a fixed flux through every enclosing cut.
  A bound for the flux density then gives a uniform positive area bound.
  This argument uses neither the constraint equations nor a sign for the boundary expansion.

#thm([Lemma 7.3.])[
  (Positive enclosing area).  #emph[Let $\( Omega \, g \)$ be a connected orientable smooth three-dimensional
    exterior, complete with its nonempty compact smooth boundary $B$ included,
    with one asymptotically flat end and compact complement. Let $a_g \( B \)$ be the infimum of the full areas of
    the enclosing cuts in Definition 32, including all components and all portions coincident with $B$. Then
$ 0 < a_g \( B \) < oo . $

]
] <bridge:bridge:positive-area>

#proof[
  A sufficiently large coordinate sphere encloses $B$, so the infimum is finite.
    To obtain a lower bound, choose a point of $B$ and a smooth proper embedded ray starting there,
    initially normal to $B$ and pointing into $Omega$. Choose the ray to be straight in the asymptotic coordinates
    outside a compact set. A tubular neighborhood has product coordinates $\( t \, y \) in \[ 0 \, oo \) times
    D^2$, with its initial disk contained in $B$. On the straight tail the transverse coordinate disk can have a
    fixed positive width.
  Choose a smooth two-form $eta$ supported in the interior of $D^2$ with $integral_(D^2) eta = 1$.
    Pull it back by $\( t \, y \) mapsto y$ and extend it by zero across the lateral boundary of the tube.
    This gives a smooth closed two-form $omega$ on $Omega$, smooth also at $B$. Its pointwise comass is bounded:
    this follows from compactness on the initial portion of the tube and from asymptotic flatness and fixed
    coordinate width on the tail. Write
  $ C_omega = sup_(x in Omega) sup_(v \, w med upright("orthonormal in ") \( T_x Omega \, g \)) \|
    omega_x \( v \, w \) \| < oo . $
  Orient the transverse disk so that the flux through a sufficiently large outward-oriented coordinate sphere
    $S_R$ is one.
  Let $Gamma$ be a smooth enclosing cut lying in the interior of $Omega$, oriented toward the end,
    and choose $S_R$ outside it. The region between $Gamma$ and $S_R$ is compact and disjoint from $B$;
    all of its inner boundary components are counted in $Gamma$. Stokes’ theorem gives
  $ integral_Gamma omega = integral_(S_R) omega = 1 \, wide 1 lt.eq C_omega "Area"_g \( Gamma \) . $
  This calculation also applies when the cut is disconnected.
    If a smooth cut touches or coincides with $B$, push it into the interior by a smooth collar flow pointing from
    $B$ into $Omega$, filling the collar on the obstacle side.
    The resulting surfaces are enclosing cuts and their areas converge to the full area of the original cut.
    Thus the same lower bound holds for boundary-coincident cuts.
    Taking the infimum yields $a_g \( B \) gt.eq C_omega^(- 1) > 0$.
    The smooth/perimeter equivalence in the definition of the full enclosing infimum transfers this bound to its
    filled-perimeter formulation as well. ◻
]

Throughout the construction, write $B = partial Omega$. Thus $Omega$ is smooth, connected and orientable,
  complete including its nonempty compact smooth boundary, and has a single Euclidean coordinate end with compact
  complement. The boundary normal points into $Omega$. The differentiated asymptotic assumptions are

#[#set math.equation(numbering: n => "(7.8)")
 $ g - delta = O_2 \( r^(- q) \) \, wide K = O_1 \( r^(- 1 - q) \) \, wide q > 1 / 2 . $ <n3:reduction:original-decay>]

The density, finite-charge and weak-trapping hypotheses are those stated in Theorem 33.
  The preparation assumes $E > \| P \|$; the conformal construction immediately below does not.

=== 7.4 A strict conformal direction <a-strict-conformal-direction>

Conformal strictification by a spacetime Poisson equation was developed by
  Jaracz #cite(label("Jaracz2025StrictDEC")). Here a regularized drift equation with nonzero inner Neumann data
  also gives strict trapping, an exact energy slope, unchanged momentum, and comparison of all enclosing cuts.
  These quantitative conclusions are established below.

#thm([Lemma 7.4.])[
  (Conformal constraint formulas).  #emph[For a smooth function $f$, set
$ g_f = e^(4 f) g \, wide K_f = e^(2 f) K . $

 The corresponding constraint densities satisfy
#[#set math.equation(numbering: n => "(7.9)")
 $ 16 pi e^(4 f) mu_f & = 16 pi mu - 8 Delta_g f - 8 \| d f \|_g^2 \,\
8 pi J_f & = e^(- 2 f) #scale(x: 120%, y: 120%)[\(] 8 pi J +
  4 K \( nabla f \, dot.op \) #scale(x: 120%, y: 120%)[\)] . $ <n3:reduction:conformal-energy>]

 Here the second identity is an identity of covectors. Consequently,
#[#set math.equation(numbering: n => "(7.10)")
 $ 16 pi e^(4 f) \( mu_f - \| J_f \|_(g_f) \) gt.eq  & 16 pi \( mu - \| J \|_g \)\
 & + 8 #scale(x: 120%, y: 120%)[\(] - Delta_g f - \| d f \|_g^2 - \| K \|_g \| d f \|_g
   #scale(x: 120%, y: 120%)[\)] . $ <n3:reduction:conformal-dec>]

 On the fixed boundary,
#[#set math.equation(numbering: n => "(7.11)")
 $ theta_(+ \, f) = e^(- 2 f) \( theta_(+) + 4 partial_nu f \) . $ <n3:reduction:conformal-expansion>]

 Equivalently, if $u = e^f > 0$, the last summand in Equation (7.10) is $8
   u^(- 1) \( - Delta_g u - \| K \|_g \| d u \|_g \)$.]
] <n3:reduction:conformal-formulas>

#proof[
  Apply the pointwise identities in Equation (3.2) with $n = 3$, $k = 2$, $p = 1$, and $s = 2 f$.
    The densities in that identity are $mu_(upright(A)) = 8 pi mu$ and $J_(upright(A)) =
    8 pi J$ in this section’s physical normalization. Setting the vector argument to zero gives $8 pi e^(4 f)
    mu_f = 8 pi mu - 4 Delta f - 4 \| d f \|^2$; multiplication by two is Equation (7.9).
    The covector formula proved there gives $8 pi J_f = e^(- 2 f) \( 8 pi J + 4 K \( nabla f \, dot.op \) \)$.
    Its new-metric norm introduces a further factor $e^(- 2 f)$,
    so the triangle inequality gives Equation (7.10) with precisely its factor $8$.
    The boundary formula has $k partial_nu s = 4 partial_nu f$ and proves Equation (7.11).
    Finally Equation (3.3) uses $U = e^f = u$ here and gives the stated positive-factor form.
    These are pointwise identities; no decay or additional differentiated end hypothesis is used. ◻
]

#thm([Lemma 7.5.])[
  (Strict direction under the original decay).  #emph[Choose
$ 0 < delta < beta < min \( q \, 1 \) . $

 There are smooth positive functions $w$ and $phi.alt$ on $Omega$, with $w = r^(- 3 - delta)$ on the end, such that
#[#set math.equation(numbering: n => "(7.12)")
 $ & partial_nu phi.alt = - 1 quad upright("on ") B \, & phi.alt & = O_2 \( r^(- 1) \) \,\
 & - Delta_g phi.alt - \| K \|_g \| d phi.alt \|_g gt.eq w \, & frac(- Delta_g phi.alt, w) & arrow.r
   1 . $ <n3:reduction:strict-boundary>]

 The Euclidean normal flux
$ L_phi.alt = lim_(r arrow.r oo) integral_(S_r) partial_r phi.alt thin thin upright(d) A_delta $

 is finite and negative. For every finite $s gt.eq 0$, set
#[#set math.equation(numbering: n => "(7.13)")
 $ u_s = 1 + s phi.alt \, wide g_s = u_s^4 g \, wide K_s = u_s^2 K . $ <n3:reduction:linear-family>]

 These data are complete up to $B$ and satisfy DEC, strictly for $s > 0$.
   If $theta_(+) lt.eq 0$ on $B$, their boundary expansion remains nonpositive and is strictly negative for $s >
   0$. Their decay exponent can be taken to be $min \( q \, 1 \) > 1 \/ 2$,
   their constraint densities are integrable, and
#[#set math.equation(numbering: n => "(7.14)")
 $ E_s = E + s A_phi.alt \, wide P_s = P \, wide A_phi.alt = -
   frac(L_phi.alt, 2 pi) > 0 . $ <n3:reduction:strict-charges>]

 Their full enclosing infima satisfy
#[#set math.equation(numbering: n => "(7.15)")
 $ a_g \( B \) lt.eq a_(g_s) \( B \) lt.eq \( 1 + s parallel phi.alt parallel_oo \)^4 a_g \( B \) .
   $ <n3:reduction:strict-areas>]

 In particular $E_s arrow.r E$ and $a_(g_s) \( B \) arrow.r a_g \( B \)$ as $s arrow.b 0$.
   No sign assumption on the ADM vector is needed.]
  #emph[If $K$ is compactly supported and the metric has symbol estimates of all orders with $g - delta =
    O \( r^(- 1) \)$, the function can instead be chosen with $phi.alt = O_k \( r^(- 1) \)$ for every $k$,
    while retaining Equations (7.12) and (7.12).]
] <n3:reduction:strict-direction>

#proof[
  Choose smooth $b gt.eq \| K \|_g$, positive everywhere and equal to $b_0 r^(- 1 - beta)$ sufficiently far out,
    where $b_0 > 0$ is chosen large enough. This is possible because $beta < q$.
    Choose a smooth positive regularizer $zeta$, equal to $r^(- 2)$ on the end,
    and extend $w$ smoothly and positively to $Omega$. We solve
  #[#set math.equation(numbering: n => "(7.16)")
   $ - Delta_g phi.alt = b sqrt(\| d phi.alt \|_g^2 + zeta^2) + w \, wide partial_nu phi.alt = - 1 \, wide
     phi.alt arrow.r 0 . $ <n3:reduction:drift-poisson>]
  The regularizer makes this equation smooth even at critical points.
  First truncate at a large coordinate sphere $S_R$ and prescribe $phi.alt = 0$ there.
    The Neumann and Dirichlet conditions occur on disjoint boundary components.
    For $0 lt.eq t lt.eq 1$, replace $b$ in Equation (7.16) by $t b$.
    At $t = 0$, the mixed Laplacian is invertible: its Dirichlet face gives the Poincare inequality,
    and the weak solution obtained from its coercive quadratic form is smooth by boundary regularity.
    At any solution, the linearization is a Laplacian with a smooth drift of norm at most $b$ and with the
    homogeneous mixed boundary conditions. The strong maximum principle and the Hopf boundary principle make its
    kernel zero. It is a Fredholm perturbation of the mixed Laplacian of index zero, and is therefore invertible.
    The boundary estimates used here are the ordinary elliptic estimates for Dirichlet and normal Neumann
    conditions: positive definiteness of $g$ verifies their principal complementing condition,
    and the disjoint boundary components can be covered separately #cite(label("AgmonDouglisNirenberg1959")).
    The maximum principles and local elliptic estimates below are used in their usual uniformly elliptic forms
    #cite(label("GilbargTrudinger")).
  To close continuation at $t = 1$, first work on a fixed truncation.
    The elliptic $W^(2 \, p)$ estimate and gradient interpolation give
  $ parallel phi.alt parallel_(W^(2 \, p)) lt.eq C_p #scale(x: 120%, y: 120%)[\(] 1 +
    parallel phi.alt parallel_(L^p) + parallel d phi.alt parallel_(L^p) #scale(x: 120%, y: 120%)[\)] lt.eq 1 /
    2 parallel phi.alt parallel_(W^(2 \, p)) + C'_p \( 1 + parallel phi.alt parallel_(L^p) \) . $
  The constants include the fixed boundary data and are uniform in $t$.
    If the supremum norms of solutions on this truncation were unbounded, divide them by their supremum norms.
    The preceding estimate with $p > 3$, compactness, and the equation give a nonzero limit $v$ with homogeneous
    mixed data satisfying
  $ - Delta_g v = t_(*) b \| d v \|_g . $
  This can be written $Delta_g v + A dot.op d v = 0$ with a bounded measurable drift:
    take $A = t_(*) b nabla v \/ \| d v \|$ off the critical set and zero on it.
    The strong and Hopf maximum principles exclude a nonzero solution with the homogeneous mixed conditions.
    Thus the supremum norms are bounded. The $W^(2 \, p)$ estimate, Schauder estimates,
    and the smooth equation now give the bounds needed for closedness of continuation.
    Existence on each truncation follows.
  Every such solution is nonnegative. A negative minimum cannot be interior because the right side of
    Equation (7.16) is positive. At an inner-boundary minimum,
    the outward-domain derivative would be negative by the Hopf principle,
    whereas the prescribed derivative in that direction is $1$. The outer value is zero.
  It remains to make these bounds independent of $R$. For fixed sufficiently large $A$ and then sufficiently large
    $r_0$, the positive radial function
  $ v_0 \( r \) = r^(- 1) \( 1 - A r^(- delta) \) $
  satisfies, on $r gt.eq r_0$,
  $ - Delta_g v_0 - b \| d v_0 \|_g & = A delta \( 1 + delta \) r^(- 3 - delta) + O \( r^(- 3 - q) \) +
    O \( r^(- 3 - beta) \) gt.eq c_0 w . $
  The constants are fixed independently of the truncation. Since $b zeta = o \( w \)$,
    a sufficiently large multiple of $v_0$ is a supersolution of the regularized equation.
    The comparison principle gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ 0 lt.eq phi.alt \( x \) lt.eq C \( 1 + M_R \) v_0 \( r \) \, wide M_R =
     sup_(Omega ∩ { r lt.eq r_0 }) phi.alt \, quad r_0 lt.eq r lt.eq R . $ <n3:reduction:core-barrier>]
  The notation for the compact core includes all points outside the end chart.
    Were $M_R$ unbounded along expanding truncations, the normalized solutions $phi.alt \/
    M_R$ would have locally uniform $W^(2 \, p)$ bounds, including at $B$,
    by the preceding local estimates and Equation (7.17). A subsequence would converge locally in $C^1$ to a
    nonnegative function with maximum one on the core, homogeneous inner Neumann data,
    and a bounded-drift homogeneous equation. Equation (7.17) makes its value tend to zero at infinity.
    It consequently attains a positive maximum, contradicting the strong or Hopf principle for that homogeneous
    equation. This proves the uniform core bound. The contradiction uses the homogeneous bounded-drift equation.
  Local compactness and diagonal extraction give a smooth solution of Equation (7.16), with $phi.alt =
    O \( r^(- 1) \)$. The claimed derivative count can be checked directly on annuli. Put
  $ phi.alt_rho \( y \) = rho phi.alt \( rho y \) \, wide g_rho \( y \) = g \( rho y \) \, wide 1 < \| y \| < 4 . $
  On smaller fixed annuli the equation is
  $ - Delta_(g_rho) phi.alt_rho =
    rho b \( rho y \) sqrt(\| d phi.alt_rho \|_(g_rho)^2 + \( rho^2 zeta \( rho y \) \)^2) + rho^3 w \( rho y \) . $
  Its coefficients have uniform $C^(1 \, 1)$ bounds from the two derivatives in Equation (7.8);
    the scaled drift is $O \( rho^(- beta) \)$ and the scaled source is $O \( rho^(- delta) \)$.
    The bounded zeroth-order norm, interior $W^(2 \, p)$ estimates,
    and gradient interpolation first give uniform $C^(1 \, alpha)$ bounds for some $alpha > 0$.
    The right side is then uniformly $C^alpha$. Schauder estimates give uniform $C^(2 \, alpha)$ bounds on smaller
    annuli. This proves $phi.alt = O_2 \( r^(- 1) \)$ without using a third derivative of $g$ or a second
    derivative of $K$.
  The right side of Equation (7.16) is $w + O \( r^(- 3 - beta) \)$. It is integrable and proves Equation (7.12).
    The divergence theorem, with outward-domain normal $- nu$ on $B$, gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ lim_(r arrow.r oo) integral_(S_r) partial_(n_g) phi.alt thin thin upright(d) A_g = - \| B \|_g -
     integral_Omega #scale(x: 120%, y: 120%)[\(] b sqrt(\| d phi.alt \|_g^2 + zeta^2) +
     w #scale(x: 120%, y: 120%)[\)] thin thin upright(d) V_g . $ <n3:reduction:phi-flux>]
  The Euclidean flux differs by $O \( r^(- q) \)$ and has the same finite limit.
  For every fixed finite $s gt.eq 0$, the factor $u_s$ in Equation (7.13) is bounded and at least one,
    so the transformed data are complete up to $B$. The $u$-form of Lemma 35 gives
  $ 16 pi u_s^4 \( mu_s - \| J_s \|_(g_s) \) & gt.eq 16 pi \( mu - \| J \|_g \) +
    frac(8 s, u_s) \( - Delta_g phi.alt - \| K \|_g \| d phi.alt \|_g \) gt.eq frac(8 s, u_s) w \,\
theta_(+ \, s) & = u_s^(- 2) (theta_(+) - frac(4 s, u_s)) . $
  This proves the asserted signs for all finite $s$, without a smallness restriction.
  Since $u_s - 1 = O_2 \( r^(- 1) \)$, the transformed decay exponent is $min \( q \, 1 \) > 1 \/ 2$.
    The exact energy transformation is
  $ 16 pi u_s^4 mu_s = 16 pi mu - 8 s u_s^(- 1) Delta_g phi.alt . $
  Here $Delta_g phi.alt = O \( r^(- 3 - delta) \)$, and the additional current term is bounded by a fixed-$s$
    constant times $\| K \|_g \| d phi.alt \|_g = O \( r^(- 3 - q) \)$. Both are integrable in dimension three.
    The bounded positive conformal factor also preserves integrability in the transformed volume measure.
  The leading metric change is $4 s phi.alt delta$, whose ADM energy flux is $-
    8 s integral_(S_r) partial_r phi.alt thin thin upright(d) A_delta$ before division by $16 pi$.
    All remaining metric flux terms are $O_s \( r^(- q) \) + O_s \( r^(- 1) \)$.
    Writing $pi = K - \( "tr"_g K \) g$, one has $pi_s = u_s^2 pi$,
    so the change in its Euclidean momentum flux is $O_s \( r^2 r^(- 1) r^(- 1 - q) \) = O_s \( r^(- q) \)$.
    This proves Equation (7.14); Equation (7.18) gives $A_phi.alt > 0$.
    No $1 \/ r$ coefficient expansion for $phi.alt$ is needed.
    Finally, the cut class is unchanged and every cut has area $integral_Gamma u_s^4 thin thin upright(d) A_g$.
    Bounding $u_s$ between $1$ and $1 + s parallel phi.alt parallel_oo$ and taking infima proves Equation (7.15),
    including coincident and disconnected cuts.
  For the final assertion, take $b$ nonnegative, compactly supported, and at least $\| K \|$;
    the proof is unchanged. The end equation is then simply $- Delta_g phi.alt = w$.
    Once the two-derivative estimate has been established, successive annular elliptic estimates use the assumed
    symbol bounds for $g$ and $w$ to give $phi.alt = O_k \( r^(- 1) \)$ for every $k$. ◻
]

=== 7.5 Compactness of enclosing minimizers <compactness-of-enclosing-minimizers>

The end replacement will change the metric on receding annuli.
  The next lemma keeps area-minimizing enclosures in a fixed compact set,
  where local metric convergence controls their areas.

#thm([Lemma 7.6.])[
  (Enclosing areas under receding changes).  #emph[Let $g_j$ be smooth metrics on the fixed exterior $Omega$,
    converging to $g$ locally uniformly up to $B$. Suppose that in a fixed chart outside a compact set they
    satisfy, with constants independent of $j$,
#[#set math.equation(numbering: n => "(7.19)")
 $ c delta lt.eq g_j lt.eq C delta \, wide r \| partial g_j \|_delta lt.eq C . $ <n3:reduction:area-geometry>]

 Suppose also that each $g_j$ has an asymptotically flat end, possibly in a different chart,
   and admits a fixed compact enclosing competitor with uniformly bounded area.
   Then minimizing filled enclosures exist, their boundaries lie in one fixed compact subset of $Omega$, and
$ a_(g_j) \( B \) arrow.r a_g \( B \) . $

 The perimeter and smooth enclosing infima agree. Each minimizing boundary is $C^(1 \, 1)$,
   and is smooth minimal away from contact with $B$.]
] <n3:reduction:area-compactness>

#proof[
  For purposes of perimeter minimization only, extend the metrics through a collar of $B$ and attach a fixed
    compact filling. The filling need not satisfy any constraint or curvature condition.
    Extend $g_j$ so that the extensions converge uniformly on this fixed collar and filling.
    A filled enclosure is then a bounded set containing the prescribed inner obstacle.
  For each fixed metric, sufficiently large spheres in its asymptotically flat chart have strictly positive
    outward mean curvature. Clipping a bounded enclosure at any such sphere cannot increase perimeter.
    To see this, integrate the divergence of the outward unit normal field of the sphere foliation over the part
    of the enclosure outside the sphere. Its divergence is positive.
    Its flux through the exterior boundary is at most the area of that boundary,
    whereas its flux on the cutting sphere is the negative of the new cutting area.
    Thus the discarded boundary area is at least the inserted area.
    Approximation gives the same statement for finite-perimeter sets.
    The direct method on the resulting bounded domain now gives a minimizer.
    The clipping observation makes this a minimizer against every bounded competitor,
    not merely those inside the chosen truncation.
  Off the obstacle the boundary is locally perimeter minimizing.
    If it contains a point of radius $r$ sufficiently large, the coordinate ball of radius $c_1
    r$ about that point avoids the obstacle. After scaling this ball to unit size,
    Equation (7.19) gives uniform ellipticity and uniform first-derivative bounds for its area integrand.
    The local perimeter density estimate gives
  $ "Area"_(g_j) \( partial F_j ∩ B_(c_1 r) \) gt.eq c_2 r^2 . $
  Here $c_1 \, c_2 > 0$ are independent of $j$ and $r$. To justify the uniform lower bound,
    work in a rescaled coordinate ball avoiding the obstacle, and let $v \( s \) = \| F_j ∩ B_s \|_delta$.
    Removing $F_j ∩ B_s$ is an admissible local comparison. For almost every $s$,
    minimality and uniform metric comparability give
  $ P_delta \( F_j \; B_s \) lt.eq C v' \( s \) \, wide P_delta \( F_j ∩ B_s \) lt.eq C' v' \( s \) . $
  The Euclidean isoperimetric inequality therefore yields $v \( s \)^(2 \/ 3) lt.eq C'' v' \( s \)$.
    At a point in the support of the minimizing frontier, both phases meet every ball.
    Integrating this differential inequality gives $v \( s \) gt.eq c s^3$.
    Filling the complement in $B_s$ gives the same estimate for $\| B_s \\ F_j \|_delta$.
    The relative isoperimetric inequality now gives $P_delta \( F_j \; B_s \) gt.eq
    c' s^2$ on a smaller fixed ball. Returning to the original scale proves the displayed area bound.
    The argument also applies at all support points by taking limits of reduced-boundary points.
    No uniform curvature or higher metric derivative bound is used.
    The fixed competitor bounds the total area independently of $j$.
    Consequently the minimizing boundaries lie in a fixed compact set.
  The local obstacle regularity theorem for pure area minimization with a $C^2$ obstacle gives $C^(1 \, 1)$
    regularity, and smoothness off contact, in dimension three;
    its local estimates require only the appropriate bounded geometry of the smooth metric
    #cite(label("HuiskenIlmanen2001")) Regularity Theorem 1.3.
    This applies to the fixed smooth obstacle and each of the smooth metrics $g_j$ and $g$ after the collar
    extension. Push a minimizing boundary slightly away from its contact set by a smooth vector field agreeing
    there with the outward obstacle normal. In a small obstacle collar its flow increases the signed distance to
    the obstacle. The resulting $C^1$ embedded boundary is a positive distance from the obstacle.
    Smooth local graph approximation, within that distance, preserves enclosure and changes area by an arbitrarily
    small amount. This proves equality of the smooth and perimeter infima for each metric.
  Enlarge the fixed compact region so that its complement is a connected coordinate tail.
    Each minimizing inner set is either empty or the whole tail there, since its frontier is absent.
    Boundedness excludes the latter, so the sets themselves also lie in a common compact set.
    Choose a fixed smooth auxiliary metric on this compact set.
    Uniform metric comparability gives uniformly bounded auxiliary perimeters,
    and BV compactness gives a limiting filled enclosure. The obstacle is still contained in the limit.
    Fill any newly bounded complementary pockets; this only removes frontier.
    Uniform metric convergence makes the area integrands converge uniformly relative to the auxiliary metric,
    so lower semicontinuity implies
  $ a_g \( B \) lt.eq liminf_j a_(g_j) \( B \) . $
  Conversely, using a fixed enclosure with $g$-area arbitrarily close to $a_g \( B \)$ gives the reverse
    upper-limit inequality. ◻
]

=== 7.6 Schwarzschild reference charges <schwarzschild-reference-charges>

The area infimum is now stable under uniformly controlled changes on receding annuli.
  We next arrange those changes. The vacuum reference end must first have the original ADM charges;
  only after matching can we bend it to a rest slice without paying a nonvanishing constraint-repair cost.

#thm([Lemma 7.7.])[
  (A reference end with prescribed timelike charges).  #emph[Let $E > \|
    P \|$ and $m = \( E^2 - \| P \|^2 \)^(1 \/ 2)$. There is a spacelike plane near spatial infinity of
    Schwarzschild spacetime of mass $m$ whose induced data, in asymptotically Euclidean coordinates on the plane,
    have ADM charges $\( E \, P \)$. The reference data satisfy
$ g_(*) - delta = O_k \( r^(- 1) \) \, wide K_(*) = O_k \( r^(- 2) \) $

 for every derivative order $k$.]
] <n3:reduction:boosted-reference>

#proof[
  Apply Lemma 10 with $n = 3$, $k = 2$, $p = 1$, and $M = m$.
    In static isotropic coordinates $\( T \, y \)$ its spacetime metric is
  #[#set math.equation(numbering: n => "(7.20)")
   $ - (frac(1 - m \/ \( 2 r \), 1 + m \/ \( 2 r \)))^2 thin upright(d) T^2 +
     (1 + frac(m, 2 r))^4 delta_(i j) thin upright(d) y^i thin upright(d) y^j \, wide
     r = \| y \| . $ <n3:reduction:schwarzschild-spacetime>]
  For $P eq.not 0$, put $v = P \/ E$ and rotate the boost axis into its direction; for $P = 0$, take $v = 0$.
    Then $gamma = \( 1 - \| v \|^2 \)^(- 1 \/ 2) = E \/ m$, and the reference plane has charges
    $\( m gamma \, m gamma v \) = \( E \, P \)$. The common lemma uses the same future-normal convention for $K$,
    and its ADM prefactors become
  $ frac(1, 2 k omega_2) = frac(1, 16 pi) \, wide frac(1, k omega_2) = frac(1, 8 pi) . $
  Thus its charges have precisely the present signs and normalization;
    the use of physical constraint densities here does not rescale them.
  For the later bend, write the plane as $T = v dot.op y$ and set $y = A x$,
    where $A = \( I - v ⊗ v \)^(- 1 \/ 2)$. The induced Minkowski metric in the $x$ coordinates is $delta$.
    The perturbation of the metric above from Minkowski space has symbol decay of order $r^(- 1)$ on this fixed
    spacelike plane, and Lemma 10 gives the induced metric and tensor orders $r^(- 1)$ and $r^(- 2)$ through every
    fixed derivative order. These estimates concern the exact reference end and impose no additional derivative
    assumption on the original data. ◻
]

=== 7.7 Moments and compact linear corrections <moments-and-compact-linear-corrections>

The reference end has the required charges, but interpolation can violate DEC.
  Compact linear corrections reduce this error before the conformal repair.
  This is related to localized constraint deformation and its adjoint obstructions
  #cite(label("CorvinoSchoen2006")) #cite(label("ChruscielDelay2003"));
  those results are not being invoked as a no-parity DEC rest-end or all-cut comparison theorem.

All operators in the next two lemmas are Euclidean. For symmetric covariant tensors define

#[#set math.equation(numbering: n => "(7.21)")
 $ cal(L) h = partial_i partial_j h_(i j) - Delta "tr" h \, wide \( cal(D) k \)_i =
   partial_j \( k_(i j) - \( "tr" k \) delta_(i j) \) . $ <n3:reduction:linear-operators>]

The formal adjoint kernel of $cal(L)$ consists of affine functions;
  the formal adjoint kernel of $cal(D)$ consists of Euclidean Killing fields.
  Orthogonality to these kernels is the compatibility condition for the compact inverses below.

#thm([Lemma 7.8.])[
  (Compact scalar and symmetric divergence inverses).  #emph[Let $cal(A) subset
    bb(R)^3$ be a fixed connected open annulus and let $Q subset.double cal(A)$.
    Smooth sources supported in $Q$ admit the following compact corrections,
    supported in a fixed larger compact subset of $cal(A)$.]
  + #emph[If $integral f = 0$ and $integral x^i f = 0$ for $i = 1 \, 2 \, 3$,
    there is a smooth symmetric tensor $h$ with $cal(L) h = f$ and $parallel h parallel_(W^(k + 2 \, p)) lt.eq
    C_(k \, p) parallel f parallel_(W^(k \, p))$.]
  + #emph[If $integral V dot.op Y = 0$ for every Euclidean Killing field $Y$,
    there is a smooth symmetric tensor $k$ with $cal(D) k = V$ and $parallel k parallel_(W^(k_0 + 1 \, p)) lt.eq
    C_(k_0 \, p) parallel V parallel_(W^(k_0 \, p))$.]
  #emph[The estimates hold for integers $k \, k_0 gt.eq 0$ and $1 < p < oo$.]
] <n3:reduction:compact-inverses>

#proof[
  Apply Lemma 11 in dimension three, with the prescribed source support $Q$ and the same connected annulus.
    The scalar operator there is exactly $cal(L)$ here, and its affine moments are the four conditions in (i).
    The vector operator is exactly $cal(D)$; its translational and rotational moments are (ii).
    The inverse of trace reversal in that proof is $S mapsto S - \( "tr" S \) delta \/ \( n - 1 \)$,
    which becomes $S mapsto S - \( "tr" S \) delta \/ 2$. In particular its symmetric correction is obtained from
    a skew tensor $D_(i j k) = - D_(j i k)$ by
  #[#set math.equation(numbering: n => "(7.22)")
   $ C_(i j k) = D_(i j k) - D_(i k j) - D_(j k i) . $ <n3:reduction:stress-symmetrization>]
  The identities $C_(i j k) = - C_(i k j)$ and $\( C_(i j k) - C_(j i k) \) \/ 2 =
    D_(i j k)$ cancel the skew part without changing divergence.
    The two scalar inversions gain two derivatives, and the row-divergence inversion followed by that correction
    gains one. All supports and bounds are those of the fixed annulus.
    Thus the full conclusions, including linear dependence and every stated Sobolev order,
    are precisely the specializations of that lemma. This is an operator statement about smooth sources;
    the estimates available from the original weakly decaying data are verified separately in the annular
    replacement proof below. ◻
]

#thm([Lemma 7.9.])[
  (Integrable sources give sublinear first moments).  #emph[For data satisfying Equation (7.8) and integrable
    $mu \, \| J \|$, put $h = g - delta$ and $pi = K - \( "tr"_delta K \) delta$. Then
#[#set math.equation(numbering: n => "(7.23)")
 $ cal(L) h & = 16 pi mu + O \( r^(- 2 - 2 q) \) \,\
partial_j pi_(i j) & = 8 pi J_i + O \( r^(- 2 - 2 q) \) . $ <n3:reduction:linear-source-integrability>]

 In particular these Euclidean sources are integrable. Their scalar boundary fluxes paired with affine functions
   having zero constant term, and their vector boundary fluxes paired with rotational Killing fields,
   are $o \( R \)$ on coordinate spheres of radius $R$.]
] <n3:reduction:moment-estimates>

#proof[
  The scalar-curvature expansion has remainder bounded by
  $ C #scale(x: 120%, y: 120%)[\(] \| h \| \| partial^2 h \| + \| partial h \|^2 + \| K \|^2
    #scale(x: 120%, y: 120%)[\)] \, $
  and the replacement of the momentum constraint by Euclidean divergence has remainder bounded by
    $C \( \| h \| \| partial K \| + \| partial h \| \| K \| \)$.
    These are $O \( r^(- 2 - 2 q) \)$, using exactly the derivatives in Equation (7.8).
    They are integrable because $2 + 2 q > 3$.
  For any integrable function $F$ on the end and fixed $c > 1$,
  #[#set math.equation(numbering: n => "(7.24)")
   $ 1 / R integral_(r_0 < \| x \| < c R) \| x \| thin \| F \( x \) \| thin thin upright(d) x arrow.r
     0 . $ <n3:reduction:sublinear-tail>]
  Indeed the contribution inside any fixed radius $M$ tends to zero after division by $R$;
    the remaining contribution is at most $c integral_(\| x \| > M) \| F \|$.
    Let $R arrow.r oo$ and then $M arrow.r oo$.
  For an affine function $f$, the vector field
  $ cal(Q)_f \( h \)^i = f \( partial_j h_(i j) - partial_i "tr" h \) - \( partial_j f \)
    h_(i j) + \( partial_i f \) "tr" h $
  satisfies $partial_i cal(Q)_f \( h \)^i = f cal(L) h$. For a Euclidean Killing field $Y$,
  $ partial_j \( pi_(i j) Y^i \) = Y^i partial_j pi_(i j) \, $
  because $pi$ is symmetric. Integrating from a fixed inner sphere and using Equation (7.24) proves the asserted
    $o \( R \)$ estimates. This argument does not assert the existence of a center-of-mass or angular-momentum
    limit and requires no parity condition. ◻
]

#thm([Proposition 7.10.])[
  (Annular replacement with a vanishing deficit).  #emph[Suppose $E > \| P \|$,
    and let $\( g_(*) \, K_(*) \)$ be the reference end from Lemma 38,
    identified with the given end in the common asymptotically Euclidean coordinates.
    For all sufficiently large $R$ there are smooth data $\( tilde(g)_R \, tilde(K)_R \)$ equal to $\( g \, K \)$
    on $r lt.eq R$ and to $\( g_(*) \, K_(*) \)$ on $r gt.eq 4 R$ such that
#[#set math.equation(numbering: n => "(7.25)")
 $ 16 pi \( tilde(mu)_R - \| tilde(J)_R \|_(tilde(g)_R) \) gt.eq - eta_R R^(- 3) \, wide eta_R arrow.r
   0 . $ <n3:reduction:annular-deficit>]

 The possible negative part is supported in $R < r < 4 R$.
   The metrics there are uniformly Euclidean comparable and have uniformly bounded scaled first derivatives.
   The construction uses no derivatives of the original data beyond those in Equation (7.8) for its quantitative
   estimates.]
] <n3:reduction:annular-replacement>

#proof[
  Fix $1 / 2 < beta < min \( q \, 1 \)$ and work on the annulus $cal(A) = { 1 < \| y \| < 4 }$ with $x = R y$.
    The scaled fields are
  $ g_R \( y \) = g \( R y \) \, wide k_R \( y \) = R K \( R y \) \, $
  and likewise for the reference data. Their constraint densities are the original densities multiplied by $R^2$.
    If $h_R = g_R - delta$, then
  #[#set math.equation(numbering: n => "(7.26)")
   $ parallel h_R parallel_(C^2 \( cal(A) \)) + parallel k_R parallel_(C^1 \( cal(A) \)) +
     parallel h_(* \, R) parallel_(C^2 \( cal(A) \)) + parallel k_(* \, R) parallel_(C^1 \( cal(A) \)) lt.eq
     C R^(- beta) . $ <n3:reduction:scaled-smallness>]
  Choose $chi in C^oo \( cal(A) \)$ with $0 lt.eq chi lt.eq 1$, equal to one near $\| y \| =
    1$ and zero near $\| y \| = 4$, with all its derivatives supported in a fixed compact subannulus.
    Blend both fields by this cutoff.
  Write the constraints in the unnormalized form
  $ cal(C) \( g \, k \) = #scale(x: 120%, y: 120%)[\(] "Scal"_g + \( "tr"_g k \)^2 - \| k \|_g^2 \,
    "div"_g \( k - \( "tr"_g k \) g \) #scale(x: 120%, y: 120%)[\)] . $
  Their Euclidean linear part is $\( cal(L) h \, cal(D) k \)$.
    On fields satisfying Equation (7.26), the nonlinear remainder is bounded in supremum norm by $C R^(- 2 beta)$.
    Thus the blended constraints equal the blended original constraint sources,
    plus a quadratic error and the compact commutators
  $ f_R & = cal(L) \( chi \( h_R - h_(* \, R) \) \) - chi cal(L) \( h_R - h_(* \, R) \) \,\
V_R & = cal(D) \( chi \( k_R - k_(* \, R) \) \) - chi cal(D) \( k_R - k_(* \, R) \) . $
  They have $C^(0 \, 1)$ norms at most $C R^(- beta)$. In detail the scalar commutator applied to a symmetric
    tensor $h$ is
  $ & 2 partial_i chi \( partial_j h_(i j) - partial_i "tr" h \) + \( partial_i partial_j chi \)
    h_(i j) - \( Delta chi \) "tr" h \; $
  one derivative of this expression uses at most two derivatives of $h$.
    The vector commutator is $\( partial_j chi \) \( k_(i j) - \( "tr" k \) delta_(i j) \)$;
    one derivative uses at most one derivative of $k$. No derivative of the complete matter sources is needed.
  Every affine moment of $f_R$ and every Killing-field moment of $V_R$ is $o \( R^(- 1) \)$.
    For the constant moments, integration by parts on $cal(A)$ gives $R^(- 1)$ times the difference between the
    physical translation fluxes on its two boundary spheres, less the integrals of the blended linear sources.
    The flux difference tends to zero because the reference and original ADM vectors agree.
    Replacing the physical momentum integrand by its Euclidean trace reversal costs $O \( R^(1 - 2 q) \)$,
    which tends to zero. By Lemma 40, the physical linear-source integrals on this receding annulus tend to zero
    as well. For a linear scalar test or a rotational vector test the corresponding factor is $R^(- 2)$.
    Its physical boundary fluxes are $o \( R \)$ by the same lemma,
    while the weighted source integrals are $o \( R \)$ by Equation (7.24). This proves the claim.
  Remove these small moments by fixed smooth bumps. Explicitly, for a basis $p_1 \, dots.h \,
    p_4$ of affine functions and a fixed nonnegative bump $omega$ positive on a ball inside the annulus, the Gram matrix
  $ G_(a b) = integral omega p_a p_b $
  is positive definite. Subtract $omega sum_(a \, b) p_a \( G^(- 1) \)_(a b) integral p_b f_R$ from $f_R$.
    For the vector moments use in exactly the same way the Gram matrix $integral omega Y_a dot.op
    Y_b$ of a basis of the six Euclidean Killing fields. It too is positive definite,
    since a nonzero Killing field cannot vanish on an open ball.
    Both bump corrections have every fixed smooth norm $o \( R^(- 1) \)$.
  Apply Lemma 39 with the negative of the moment-free commutators.
    Since their $W^(1 \, p)$ norms are $O \( R^(- beta) \)$, choosing $p >
    3$ gives metric and tensor corrections of size $O \( R^(- beta) \)$ in $W^(3 \, p)$ and $W^(2 \, p)$,
    respectively. Sobolev embedding gives the needed $C^(2 \, alpha)$ and $C^(1 \, alpha)$ bounds.
    Their supports stay in a fixed compact subset of $cal(A)$. Extend them by zero and undo the scaling.
    The metric remains positive definite for large $R$.
  To check DEC, denote the original scaled sources by $\( A_R \, B_R \)$, so $A_R gt.eq 2 \| B_R \|_(g_R)$.
    The reference sources vanish. The corrected sources therefore have the form
  $ #scale(x: 120%, y: 120%)[\(] chi A_R \, chi B_R #scale(x: 120%, y: 120%)[\)] + o \( R^(- 1) \) +
    O \( R^(- 2 beta) \) $
  in supremum norm. The norm of $B_R$ changes by at most $C R^(- beta) \| B_R \| lt.eq
    C R^(- 2 beta)$ when the metric is changed, since the pointwise constraint formula gives $\| B_R \| lt.eq
    C R^(- beta)$. All other nonlinear correction terms have the same quadratic bound.
    Because $2 beta > 1$, the scaled DEC deficit is $o \( R^(- 1) \)$.
    Multiplication by $R^(- 2)$ gives Equation (7.25). Outside the correction annulus the data are either the
    original DEC data or the exact vacuum reference data. Smoothness follows from smoothness of the original
    fields and of the compact inverse constructions, irrespective of the sizes of their unneeded higher derivatives. ◻
]

=== 7.8 Bending to a rest slice and repairing the deficit <bending-to-a-rest-slice-and-repairing-the-deficit>

The annular correction has reduced the possible DEC failure to $o \( R^(- 3) \)$ on a region of radius comparable
  to $R$. We now work inside the exact vacuum reference part.
  Bending makes the distant tensor vanish; a radial conformal factor then repairs the earlier deficit at mass cost
  $o \( 1 \)$. Both operations must retain the uniform geometry needed by Lemma 37.

#thm([Lemma 7.11.])[
  (A vacuum bend with uniform geometry).  #emph[The data in Proposition 41 can be modified farther out,
    inside their exact Schwarzschild part, so that they are induced by a constant-static-time slice outside a
    compact set. This modification adds no constraint deficit.
    Write $\( g_R \, K_R \)$ for the resulting unscaled data.
    In the common end coordinates the metrics are uniformly Euclidean comparable, and throughout all transition annuli
#[#set math.equation(numbering: n => "(7.27)")
 $ \| partial g_R \|_delta + \| K_R \|_delta lt.eq C \/ r . $ <n3:reduction:bend-geometry>]

 There is a smooth proper radius $rho_R$ on the end which equals the original coordinate radius on the gluing
   annulus and equals the rest isotropic radius beyond the transitions, with
#[#set math.equation(numbering: n => "(7.28)")
 $ c r lt.eq rho_R lt.eq C r \, wide \| d rho_R \|_(g_R)^2 gt.eq c \, wide \| Delta_(g_R) rho_R \| lt.eq
   C \/ r . $ <n3:reduction:radius-geometry>]

 All transition annuli lie between fixed multiples of $R$;
   the constants can depend on the prescribed timelike ADM vector, but not on $R$.]
] <n3:reduction:vacuum-bend>

#proof[
  Use the description $T = v dot.op y$, $y = A x$, from Lemma 38.
    Choose $R_b = c_b R$ so large, with $c_b$ fixed, that the region $\| y \| gt.eq
    R_b$ is entirely inside the exact reference part. Let $psi$ be a smooth function equal to one on
    $\( - oo \, 0 \]$, zero on $\[ 1 \, oo \)$, and taking values in $\[ 0 \, 1 \]$. Replace the plane by the graph
  #[#set math.equation(numbering: n => "(7.29)")
   $ T_R \( y \) = \( v dot.op y \) psi (frac(log \( \| y \| \/ R_b \), L)) . $ <n3:reduction:bending-graph>]
  Its Euclidean gradient satisfies
  $ \| d T_R \|_delta lt.eq \| v \| #scale(x: 120%, y: 120%)[\(] 1 +
    parallel psi' parallel_oo \/ L #scale(x: 120%, y: 120%)[\)] . $
  Choose a fixed $L$ making the right side strictly smaller than one.
    The lapse and spatial coefficients in Equation (7.20) converge to their Minkowski values,
    so for all sufficiently large $R$ this graph is uniformly spacelike.
    In fact for positive Schwarzschild mass the lapse is smaller than one and the spatial conformal factor exceeds
    one, which only improves this estimate on the static exterior.
  The graph agrees with the original plane before $R_b$ and with a constant-time slice after $e^L R_b$.
    Its first derivative is bounded, and its second and third derivatives are $O \( r^(- 1) \)$ and
    $O \( r^(- 2) \)$. The induced metric is uniformly comparable with $delta$;
    differentiating its pullback formula gives the first bound in Equation (7.27).
    The second fundamental form uses the graph’s second derivatives and ambient first derivatives,
    divided by a uniformly positive spacelikeness factor, and gives the other bound.
    These estimates remain true in the $x$ coordinates because $A$ is a fixed invertible linear map.
    The constraints vanish on the entire bent part by the Gauss–Codazzi equations in exact vacuum Schwarzschild
    spacetime.
  It remains to make the radius precise. On the bent region keep $rho_R = \| x \| = \| A^(- 1) y \|$.
    Beyond the bend, where the slice is already static, write $y =
    r omega$ and put $a \( omega \) = \| A^(- 1) omega \|$. Choose $R_c$ a sufficiently large fixed multiple of
    $R_b e^L$, and a cutoff $chi_0$ equal to one before zero and zero after one. In that static region set
  $ rho_R \( r \, omega \) = r exp [chi_0 (frac(log \( r \/ R_c \), L_0)) log a \( omega \)] . $
  For fixed sufficiently large $L_0$ its radial derivative is bounded below by a positive constant:
    differentiating in $r$ gives the positive factor $rho_R \/ r$ times $1 + L_0^(- 1) chi'_0 log a$,
    which is at least $1 \/ 2$. The function and its first two Euclidean derivatives have the bounds $rho_R asymp
    r$, $\| d rho_R \| lt.eq C$, and $\| partial^2 rho_R \| lt.eq C \/ r$.
    Before this interpolation, the same bounds hold for $\| A^(- 1) y \|$,
    and uniform metric comparability gives the gradient lower bound.
    Combining these facts with Equation (7.27) proves Equation (7.28).
    After the interpolation, $rho_R = r$ is precisely the static isotropic radius.
    All radius ratios used in the construction are fixed, independently of $R$. ◻
]

#thm([Lemma 7.12.])[
  (A radial DEC repair of vanishing mass cost).  #emph[Consider the data obtained from Proposition 41 and
    Lemma 42. There is a smooth positive conformal factor $u_R$,
    constant on the unchanged inner region and tending to one at infinity,
    such that $\( u_R^4 g_R \, u_R^2 K_R \)$ satisfy DEC everywhere. Moreover
#[#set math.equation(numbering: n => "(7.30)")
 $ parallel u_R - 1 parallel_oo = o \( R^(- 1) \) \, wide \| d u_R \| = o \( R^(- 2) \) quad
   upright("on the transition region") . $ <n3:reduction:repair-size>]

 The final end is exactly Schwarzschild with $K = 0$ and mass $m + o \( 1 \)$.
   The boundary expansion retains its original weak sign.]
] <n3:reduction:radial-repair>

#proof[
  All geometry estimates below are uniform in $R$. Enlarge the fixed transition region slightly so that,
    in terms of $t = rho_R \/ R$, it lies inside an interval $\( a \, b \)$ with $0 < a < b < oo$.
    Arrange that $t gt.eq b$ is in the static spherical region,
    and that the support of the possible deficit lies in a fixed smaller interval $I subset.double \( a \, b \)$.
    Increasing $b$ if needed makes these assertions follow from Lemma 42. We take $a = 1$:
    the compact supports in the annular correction leave a fixed neighborhood of $t = 1$ free of deficit.
    The factor constructed below will consequently be constant throughout the original region $r lt.eq R$,
    and is extended by that constant over the compact core of $Omega$.
  Let $eta_R arrow.r 0$ be as in Equation (7.25), replacing it by a positive majorant if necessary.
    We will choose $epsilon_R = C_0 eta_R$ and construct
  $ u_R = 1 + epsilon_R / R F_R \( rho_R \/ R \) \, $
  where $F_R$ and the relevant derivatives are bounded independently of $R$. Write $z_R = - F'_R$.
    On $\[ a \, b + 1 \]$, initially define $z_R$ by
  #[#set math.equation(numbering: n => "(7.31)")
   $ z'_R = C_1 z_R + omega_1 \, wide z_R \( a \) = 0 \, $ <n3:reduction:repair-ode>]
  where $omega_1$ is smooth, nonnegative, zero near $a$, and at least one on $I$.
    Take $C_1$ sufficiently large, depending only on the constants in Equations (7.27) and (7.28).
    The solution is nonnegative and has uniform bounds on this fixed interval.
    For a function with $F'_R = - z_R$ the chain rule gives
  $ - Delta_(g_R) u_R - \| K_R \|_(g_R) \| d u_R \|_(g_R) & = epsilon_R /
    R^3 [z'_R \| d rho_R \|_(g_R)^2 + R z_R Delta_(g_R) rho_R - R z_R \| K_R \|_(g_R) \| d rho_R \|_(g_R)]\
 & gt.eq epsilon_R / R^3 \( c_1 z'_R - C_2 z_R \) . $
  Choose $C_1$ so that this is nonnegative and is at least $c_1 epsilon_R R^(- 3)$ on $I$.
  The preceding differential inequality need not be imposed on the spherical tail.
    There $K_R = 0$ and the Schwarzschild radial Laplace flux coefficient is $\( r + m \/ 2 \)^2$.
    Put $c_R = m \/ \( 2 R \)$ and, on the still spherical interval near $b$, define
  $ A_R \( t \) = \( t + c_R \)^2 z_R \( t \) . $
  It has positive derivative wherever $z_R > 0$. Continue it to a positive constant on $\[ b + 1 \, oo \)$ while
    keeping $A'_R gt.eq 0$. For an explicit smooth continuation, continue the solution of Equation (7.31) to $b +
    1$, multiply the derivative of $\( t + c_R \)^2 z_R \( t \)$ by a nonnegative cutoff equal to one near $b$ and
    zero near $b + 1$, and integrate with the initial value $A_R \( b \)$.
    Define $z_R = A_R \( t \) \/ \( t + c_R \)^2$ on this tail, and set it to zero for $t lt.eq a$.
    All joins are smooth, the functions are nonnegative, and their bounds on finite intervals are uniform in $R$.
    The constant tail value, denoted $A_R^oo$, is bounded independently of $R$.
  Now define
  $ F_R \( t \) = integral_t^oo z_R \( s \) thin thin upright(d) s . $
  It is nonnegative, uniformly bounded, and constant before $a$.
    The preceding construction gives a superharmonic $u_R$ on the spherical tail,
    because its signed radial flux is $- epsilon_R A_R \( t \)$ and is nonincreasing.
    It also gives Equation (7.30). For large $R$, $1 lt.eq u_R lt.eq 2$. Increasing $C_0$ ensures
  $ - Delta_(g_R) u_R - \| K_R \| \| d u_R \| gt.eq u_R / 8 thin #scale(x: 120%, y: 120%)[\[] 16
    pi \( \| J_R \|_(g_R) - mu_R \) #scale(x: 120%, y: 120%)[\]]_(+) . $
  On the original inner region the conformal factor is constant and the original data satisfy DEC.
    Elsewhere this inequality and Lemma 35 prove DEC for the repaired data.
    Using $u_R$, rather than estimating $log u_R$ separately, incorporates the gradient-square term exactly.
  On the final end,
  $ u_R = 1 + frac(epsilon_R A_R^oo, r + m \/ 2) . $
  Writing $a_R = epsilon_R A_R^oo = o \( 1 \)$, one obtains the exact identity
  #[#set math.equation(numbering: n => "(7.32)")
   $ u_R^4 (1 + frac(m, 2 r))^4 delta = (1 + frac(m \/ 2 + a_R, r))^4 delta . $ <n3:reduction:repaired-schwarzschild>]
  Thus the final mass is $m + 2 a_R = m + o \( 1 \)$ and the momentum is zero.
    Multiplication of $K_R$ by $u_R^2$ preserves its compact support.
    On the inner boundary, where $u_R$ is constant, the expansion is simply multiplied by $u_R^(- 2)$,
    so its weak sign is preserved. ◻
]

=== 7.9 The numerical reduction <the-numerical-reduction>

The preceding construction has replaced the end while preserving DEC and the boundary expansion sign.
  A final strict conformal change puts the data in the class used for the elliptic deformation.

#thm([Proposition 7.13.])[
  (Reduction to strict data with a controlled rest end).  #emph[Let $\( Omega \, g \, K \)$ satisfy the exterior
    hypotheses of Theorem 33, including $theta_(+) lt.eq 0$ on its smooth compact boundary,
    and let $m = \( E^2 - \| P \|^2 \)^(1 \/ 2) > 0$. There is a sequence of smooth exterior data
    $\( g_j \, K_j \)$ on $Omega$ with the following properties:]
  + #emph[$mu_j > \| J_j \|_(g_j)$ everywhere and $theta_(+ \, j) < 0$ on $B$.
    The constraint densities are integrable. On the end their DEC margin is bounded below by $c_j
    r^(- 3 - delta)$ for some $c_j > 0$ and one fixed $0 < delta < 1$.
    For a smooth positive radius extension $rho$, the constant can be decreased so that $mu_j - \| J_j \|_(g_j)
    gt.eq c_j rho^(- 3 - delta)$ on all of $Omega$.]
  + #emph[$K_j$ is compactly supported, and in a rest chart $g_j - delta = O_k \( r^(- 1) \)$ and $R_(g_j) =
    O_k \( r^(- 3 - delta) \)$ for every $k$. In particular $"Ric"_(g_j) = O \( r^(- 3) \)$ there.
    Their ADM momentum is zero.]
  + #emph[$\( g_j \, K_j \) arrow.r \( g \, K \)$ smoothly on every fixed compact subset up to the boundary,
    their ADM energies satisfy $E_j arrow.r m$, and $a_(g_j) \( B \) arrow.r a_g \( B \)$.]
  #emph[Consequently it suffices to prove the energy/enclosing-area inequality for the class in (i)–(ii) in order
    to prove Theorem 33 in its stated class.]
] <n3:reduction:rest-reduction>

#proof[
  Apply Proposition 41, Lemma 42, and Lemma 43 along any sequence $R_j arrow.r oo$.
    The resulting DEC exteriors have compactly supported second fundamental form and an exact rest Schwarzschild
    end with energy tending to $m$. They agree with the original data on expanding compact subsets except for a
    constant conformal factor tending to one. Hence they converge smoothly on each fixed compact subset.
    Their boundary expansion is weakly negative.
  Apply the last part of Lemma 36 separately to each of these fixed exteriors,
    using the same chosen $0 < delta < 1$ and a compactly supported drift coefficient.
    Choose its positive parameter $s$ in Equation (7.13) small enough that the energy change,
    $parallel log \( 1 + s phi.alt \) parallel_oo$, and the supremum of its first derivative multiplied by the
    fixed original coordinate radius are at most $1 \/ j$. Also require the change in the first $j$ smooth norms
    on the first $j$ members of a compact exhaustion to be at most $1 \/ j$.
    All these quantities are finite for the fixed $j$-th exterior, so these choices are possible.
    No estimate uniform in the receding bending radius is required for this final strictification.
  The resulting data have pointwise strict DEC and strict trapping.
    The quantitative end gap is at least $c_j r^(- 3 - delta)$.
    On its compact complement the continuous positive function $\( mu_j - \| J_j \|_(g_j) \)
    rho^(3 + delta)$ has a positive minimum. Replacing $c_j$ by the smaller of this minimum and the end constant
    proves the global weighted assertion in (i). The strict conformal factor has symbol decay of all orders and
    does not enlarge the support of $K$. On the far Schwarzschild end the drift vanishes, so $- Delta phi.alt =
    w = r^(- 3 - delta)$. Since the rest Schwarzschild metric has zero scalar curvature and $K = 0$ there,
    the exact $u$-formula gives
  $ R_(g_j) = 8 s \( 1 + s phi.alt \)^(- 5) r^(- 3 - delta) . $
  This proves the scalar-curvature bound in (ii). The Ricci bound follows from the two-derivative metric decay.
    The energy change tends to zero and the momentum change is zero.
    The prescribed smallness gives smooth local convergence, proving (ii) and the local convergence and charge
    assertions in (iii).
  The metrics before strictification satisfy the uniform comparisons and scaled first-derivative bounds of
    Lemma 37, in the fixed original end chart: the reference plane, the bend,
    and the radius interpolation involve only fixed linear maps and fixed radius ratios.
    The radial repair preserves these bounds. The final strictification parameters were chosen to preserve them as
    well. That lemma therefore gives the convergence of enclosing infima.
  This completes the preparation; no numerical inequality was used in constructing these data. ◻
]

=== 7.10 Applying the prepared theorem at each fixed stage <n3:reduction:prepared-transfer>

#proof[
  Let $m = sqrt(E^2 - \| P \|^2) > 0$, and take the sequence in Proposition 44.
    Each datum is a smooth complete one-ended exterior on $Omega$ with the same nonempty compact boundary $B$.
    The proposition gives a compactly supported tensor, $O_d \( r^(- 1) \)$ metric decay for every fixed
    derivative order $d$, scalar curvature $O \( r^(- 3 - delta) \)$ with $0 < delta < 1$, integrable constraints,
    strict future trapping, and a global weighted DEC margin.
    These are the geometric and asymptotic conditions in Definition 6.
  The enclosing class also agrees with its full-cut class: both retain a connected end-containing outer domain and
    count its entire intrinsic frontier, including coincidence with the obstacle.
    Filling pockets removes only surplus frontier and leaves either infimum unchanged.
    Thus the prepared area is $A_j = a_(g_j) \( B \) > 0$, where positivity follows from Lemma 34.
  There is one normalization conversion. The densities used in this section are physical densities,
    while those of the prepared theorem satisfy $2 mu_(upright(A)) =
    R + \( "tr" K \)^2 - \| K \|^2$ and $J_(upright(A)) = "div" \( K - \( "tr" K \) g \)$. Hence
  $ mu_(upright(A)) = 8 pi mu \, wide J_(upright(A)) = 8 pi J . $
  The global weighted margin becomes $mu_(upright(A) \, j) - \| J_(upright(A) \, j) \|_(g_j) gt.eq
    8 pi c_j rho^(- 3 - delta)$, and all sign and integrability conditions are preserved.
    At $n = 3$, $k = n - 1 = 2$ and $omega_2 = 4 pi$, so the energy and momentum prefactors in that theorem are
    respectively
  $ frac(1, 2 k omega_2) = frac(1, 16 pi) \, wide frac(1, k omega_2) = frac(1, 8 pi) . $
  Thus neither ADM energy nor momentum nor invariant mass is rescaled.
  Theorem 8 therefore applies to each fixed prepared datum and gives
  $ E_j gt.eq 1 / 2 (frac(a_(g_j) \( B \), 4 pi))^(1 \/ 2) = sqrt(frac(a_(g_j) \( B \), 16 pi)) . $
  Its elliptic exhaustion and its numerical limits in $N$ and $epsilon.alt$ have already been completed for that
    datum; no estimate uniform in $j$ is required. Now use $E_j arrow.r
    m$ and the full convergence $a_(g_j) \( B \) arrow.r a_g \( B \)$ to obtain
  $ sqrt(E^2 - \| P \|^2) gt.eq sqrt(frac(a_g \( B \), 16 pi)) \, $
  as asserted. ◻
]

=== 7.11 Future timelikeness from the exterior inequality <bridge:bridge:section>

The conformal direction already constructed allows us to move the ADM energy upward while fixing the momentum and
  increasing every enclosing area. If the original ADM vector were not future timelike,
  we could approach the future null cone through data to which the timelike inequality applies.
  The positive area bound would persist along this family, giving a contradiction.

#thm([Theorem 7.14.])[
  (The exterior inequality without a timelike assumption).  #emph[ Let $\( Omega \, g \, K \)$ satisfy all the
    hypotheses of Theorem 33 except $E > \| P \|_delta$. Then
$ E > \| P \|_delta \, wide sqrt(E^2 - \| P \|_delta^2) gt.eq sqrt(frac(a_g \( B \), 16 pi)) \, wide B =
  partial Omega . $

 No extension of the data across $B$ is required.]
] <bridge:bridge:timelike>

#proof[
  Lemma 36 supplies a positive function $phi.alt$, a constant $A_phi.alt > 0$, and, for every finite $s gt.eq 0$,
    the data
  $ g_s = \( 1 + s phi.alt \)^4 g \, wide K_s = \( 1 + s phi.alt \)^2 K . $
  These data retain completeness, integrable constraint densities, DEC, weak future trapping of $B$,
    and the required differentiated decay. The lemma makes no sign assumption on the original ADM vector.
    Its charge and area identities, Equations (7.14) and (7.15), give
  $ E_s = E + s A_phi.alt \, wide P_s = P \, wide a_(g_s) \( B \) gt.eq a_g \( B \) > 0 \, $
  where the last strict inequality is Lemma 34.
  Suppose $E lt.eq \| P \|_delta$, and set $s_0 = \( \| P \|_delta - E \) \/ A_phi.alt$.
    This is a finite nonnegative number. For every $s > s_0$ the deformed vector is future timelike,
    so Theorem 33, applied to these fixed data, implies
  $ sqrt(\( E + s A_phi.alt \)^2 - \| P \|_delta^2) gt.eq sqrt(frac(a_(g_s) \( B \), 16 pi)) gt.eq
    sqrt(frac(a_g \( B \), 16 pi)) > 0 . $
  As $s arrow.b s_0$ the left side tends to zero, while the final lower bound is fixed and positive.
    This contradiction proves $E > \| P \|_delta$. The timelike exterior inequality now applies directly to
    $\( Omega \, g \, K \)$ and gives the stated bound. ◻
]

=== 7.12 Complete data with finitely many ends <complete-data-with-finitely-many-ends>

We now pass from a one-ended exterior to a complete boundaryless initial-data manifold.
  The ambient enclosing class allows other ends to remain on the chosen side.
  We first isolate the chosen end to use the exterior theorem,
  and then compare the two area infima in the direction required for the conclusion.

#prodef([Definition 7.15.])[
  (Admissible boundary and ambient enclosing area).  Let $\( M \, g \, K \)$ be a smooth three-dimensional initial
    data set without boundary, with $M$ connected, and fix one asymptotically flat end $e$.
    An admissible boundary for $e$ is a nonempty compact smooth embedded two-sided surface $S = partial D^(+)$,
    where $D^(+)$ is a smooth open region containing the entire sufficiently distant part of $e$.
    The surface and the region may be disconnected, and $D^(+)$ may contain other ends.
    For the normal $nu$ pointing into $D^(+)$, require
  $ H_S + "tr"_S K lt.eq 0 . $
  Its minimum enclosing area is
  #[#set math.equation(numbering: n => "(7.33)")
   $ A_min \( S \) = inf {"Area"_g \( partial D' ""^(+) \) :
     D' ""^(+) subset.eq D^(+) upright(" is a smooth open region containing")\
upright("the entire sufficiently distant part of ") e \,\
partial D' ""^(+) upright(" is compact, smooth, and embedded")} . $ <bridge:intro:global-area>]
  The full boundary area is counted, including portions coincident with $S$.
    Competitor regions $D' ""^(+)$ may be disconnected and may retain other ends.
    Their boundaries need be neither trapped nor minimal. The definition imposes no sign condition on the inward
    null expansion.
] <bridge:intro:global-admissible>

#thm([Theorem 7.16.])[
  (Spacetime Penrose inequality for complete initial data).  #emph[Let $\( M \, g \, K \)$ be a connected
    orientable smooth three-dimensional initial data set without boundary, with $g$ complete.
    Suppose that outside a compact set $M$ has finitely many asymptotically flat ends.
    On each end, in its asymptotic coordinates, assume
$ g - delta = O_2 \( r^(- q) \) \, wide K = O_1 \( r^(- 1 - q) \) \, wide q > 1 / 2 \, $

 and finite ADM energy and momentum limits with the normalizations (7.4)–(7.4).
   The decay exponents may differ between ends. Assume that the physical constraint densities (7.1) obey $mu
   gt.eq \| J \|_g$ and that both $mu$ and $\| J \|_g$ are integrable on $M$.]
  #emph[For every chosen end and every admissible boundary $S$ in Definition 46, its ADM vector $\( E \, P \)$ satisfies
#[#set math.equation(numbering: n => "(7.34)")
 $ E > \| P \|_delta \, wide sqrt(E^2 - \| P \|_delta^2) gt.eq
   sqrt(frac(A_min \( S \), 16 pi)) . $ <bridge:intro:global-inequality>]

]
] <bridge:intro:global-penrose>

#proof[
  Let $D_0$ be the connected component of $D^(+)$ containing the distant chosen end.
    Its boundary is a union of components of $S$. It is nonempty:
    otherwise $D_0$ would be both open and closed in the connected manifold $M$, and hence equal to $M$,
    contradicting $S eq.not diameter$. The closure $X_0 = overline(D_0)$ is therefore a smooth manifold with
    nonempty compact boundary. Since $S$ is compact, each sufficiently distant end of $M$ lies either entirely in
    $D_0$ or entirely outside it. Thus $X_0$ has finitely many ends,
    precisely those original end tails contained in $D_0$.
  For every end of $X_0$ other than the chosen one, remove a sufficiently distant open coordinate tail.
    The tails can be chosen disjoint and disjoint from $S$. Denote the remainder by $Omega$. It is connected:
    a path segment entering one of the removed tails can be replaced by a path on the connected coordinate sphere
    bounding that tail. Consequently $Omega$ is a one-ended smooth exterior with compact boundary
  $ B = partial D_0 med union med union.big_(upright("other ends of ") X_0) S_(R_i) . $
  This boundary is nonempty because $partial D_0$ is nonempty.
  The set $Omega$ is closed in the complete manifold $\( M \, g \)$,
    and it is complete for its intrinsic distance with $B$ included.
    Indeed, an intrinsic Cauchy sequence is ambient Cauchy and has its ambient limit in $Omega$.
    At an interior limit point the two distances are locally comparable.
    At a boundary limit point, a smooth boundary chart identifies $Omega$ locally with a half-ball and gives the
    same comparison, so the sequence converges intrinsically as well.
    Restricting the data preserves DEC and integrability. The chosen end is unchanged,
    so its decay and ADM vector remain the original ones.
  On $partial D_0$ the normal into $Omega$ is the normal into $D^(+)$, and the future expansion is nonpositive.
    On an added sphere $S_(R_i)$, the normal into $Omega$ points toward decreasing radius in the removed end.
    The differentiated asymptotic assumptions give
  $ H_(S_(R_i)) = - 2 / R_i + O \( R_i^(- 1 - q_i) \) \, wide "tr"_(S_(R_i)) K = O \( R_i^(- 1 - q_i) \) . $
  Choose each $R_i$ large enough that their sum is negative.
    Every component of $B$ is then weakly future outer trapped for the normal into $Omega$.
    Theorem 45 applies and yields
  #[#set math.equation(numbering: n => "(7.35)")
   $ E > \| P \|_delta \, wide sqrt(E^2 - \| P \|_delta^2) gt.eq
     sqrt(frac(a_g \( B \), 16 pi)) . $ <bridge:bridge:restricted-inequality>]
  It remains to compare the enclosing classes. We claim
  #[#set math.equation(numbering: n => "(7.36)")
   $ a_g \( B \) gt.eq A_min \( S \) . $ <bridge:bridge:global-area-comparison>]
  Take first a smooth enclosing cut $Gamma$ contained in the interior of $Omega$.
    The connected component on its distant chosen-end side is a smooth open region $D' ""^(+) subset D_0 subset
    D^(+)$. Its boundary consists of components of $Gamma$, so it is compact and smooth and has area at most
    $"Area"_g \( Gamma \)$. It is therefore an admissible competitor in (7.33).
    For a cut that meets or coincides with $B$, a smooth collar push into the interior,
    with the obstacle side filled, gives enclosing cuts whose areas converge to its full area.
    This applies also to contact with the added coordinate spheres.
    Hence every full enclosing cut of $Omega$ has area at least $A_min \( S \)$,
    proving (7.36) after taking the infimum. The discarded components of $D^(+)$ do not obstruct this comparison:
    the ambient definition permits the chosen-end component alone as a competitor.
    Combining the area comparison with (7.35) proves the theorem. ◻
]

The auxiliary exterior excludes the other distant ends, whereas the ambient competitor class allows them.
  The proof uses only the one-sided comparison (7.36). Rigidity is a separate question about the original data;
  it requires its own argument rather than equality transport through these conformal changes or end truncations.

== 8 Weak asymptotics in four dimensions <n4:sec:introduction>

We prove a lower bound for the ADM rest mass in terms of the least three-volume needed to separate a chosen
  asymptotically flat end from the compact weakly trapped boundary and the other ends.
  The task is to bring two derivatives of the metric and one derivative of the second fundamental form within the
  scope of Theorem 8. We first replace the selected end by a rest end while controlling every cut,
  then make the dominant energy and boundary inequalities strict.
  The prepared theorem is applied to each fixed resulting datum; only its numerical conclusion is passed to the limit.

=== 8.1 Initial data and enclosing cuts <initial-data-and-enclosing-cuts>

Four is the spatial dimension; the associated spacetime dimension is five,
  and a hypersurface area is a three-dimensional Riemannian volume.
  Here $omega_3 = \| S^3 \| = 2 pi^2$, and we write $tau = "tr"_g K$.
  Specializing the constraint convention already fixed in the paper gives

$ 2 mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide J_i = nabla^j \( K_(i j) - \( "tr"_g K \) g_(i j) \) . $

Here $R_g = "Scal"_g$ denotes scalar curvature and $nabla$ is the Levi–Civita connection of $g$.
  The cosmological constant is zero. We use $Delta_g = "div"_g "grad"_g$.
  For a hypersurface with specified unit normal $nu$, write

$ H = "div"_(upright("tan")) nu \, wide "tr"_(upright("tan")) K = \( g^(i j) - nu^i nu^j \) K_(i j) \, wide
  Theta_K = H + "tr"_(upright("tan")) K . $

At an inner boundary the normal points into the exterior.
  In an auxiliary trapped-region construction it points out of the bounded region.

The notation $O_j \( r^(- a) \)$ includes coordinate derivatives of order $k lt.eq j$,
  bounded by $O \( r^(- a - k) \)$. On an asymptotically flat end the ADM normalization is

#[#set math.equation(numbering: n => "(8.1)")
 $ E & = frac(1, 6 omega_3) lim_(R arrow.r oo) integral_(\| x \| = R) \( partial_j g_(i j) - partial_i g_(j j) \)
   n_delta^i thin thin upright(d) A_delta \,\
P_i & = frac(1, 3 omega_3) lim_(R arrow.r oo) integral_(\| x \| = R) \( K_(i j) - tau g_(i j) \) n_delta^j thin
  thin upright(d) A_delta . $ <n4:intro:energy>]

Here $n_delta$ and $thin upright(d) A_delta$ are Euclidean.
  Whenever a charge is used below, its stated limit is required to exist.

#prodef([Definition 8.1.])[
  (Enclosing cuts).  Let $M$ have nonempty compact boundary $S$ and finitely many asymptotically flat ends,
    and fix an end $e$. An admissible outer domain $D_e$ is a connected smooth codimension-zero submanifold with
    boundary, closed as a subset of $M$, such that its manifold interior lies in $"int" M$,
    it contains the entire sufficiently distant part of $e$, and it contains no sufficiently distant part of any
    other end. Its entire intrinsic manifold boundary $Gamma =
    partial_(upright("man")) D_e$ is required to be compact. The enclosing volume is
  $ A_e \( S \) = inf_(D_e) \| partial_(upright("man")) D_e \|_g . $
  All frontier coincident with $S$ is counted. The cut may be disconnected.
    In the one-ended case $D_e = M$ is allowed and has intrinsic boundary $S$.
    We then also write $A_(*)$ for this infimum.
] <n4:def:cuts>

Only these smooth cuts are used. Their infimum need not be attained.
  The connected outer domain excludes the distant parts of all other ends, although its cut may be disconnected.
  Thus all other ends and the entire original boundary are obstacles to the selected outer domain.
  This end-isolating convention remains distinct from the three-dimensional complete-data class,
  whose chosen-end region may be disconnected and may retain other ends.

#thm([Theorem 8.2.])[
  #emph[Let $\( M^4 \, g \, K \)$ be smooth and connected, with $M$ orientable,
    $K$ an arbitrary smooth symmetric covariant two-tensor, and $S = partial M$ nonempty, compact, and smooth.
    Suppose $g$ is complete as a metric space with $S$ included.
    Outside a compact set let $M$ have finitely many, and at least one,
    ends diffeomorphic to the complement of a closed ball in $bb(R)^4$. Assume
$ mu gt.eq \| J \|_g \, wide mu \, \| J \|_g in L^1 \( M \, thin upright(d) V_g \) \, $

 and, on every end for a common $q > 1$,
$ g - delta = O_2 \( r^(- q) \) \, wide K = O_1 \( r^(- 1 - q) \) \, $

 with finite energy and momentum limits (8.1)–(8.1). On every component of $S$ assume $Theta_K lt.eq 0$,
   with normal into $M$.]
  #emph[Then for each end $e$,
#[#set math.equation(numbering: n => "(8.2)")
 $ E_e gt.eq sqrt(\| P_e \|_delta^2 + 1 / 4 (frac(A_e \( S \), omega_3))^(4 \/ 3)) . $ <n4:intro:main>]

 In particular $E_e > \| P_e \|_delta$, and the invariant mass satisfies
#[#set math.equation(numbering: n => "(8.3)")
 $ sqrt(E_e^2 - \| P_e \|_delta^2) gt.eq 1 / 2 (frac(A_e \( S \), omega_3))^(2 \/ 3) . $ <n4:intro:mass>]

]
] <n4:thm:weak>

The strict timelikeness is a conclusion: Lemma 50 establishes $A_e \( S \) > 0$,
  and the proof includes the non-timelike case. There is no extra decay assumption on $tau = "tr"_g K$.
  All original boundary components use the same future trapping convention.

The coefficient is sharp. On the time-symmetric Schwarzschild–Tangherlini exterior #cite(label("Tangherlini1963")),

$ g_m = (1 + frac(m, 2 r^2))^2 delta \, wide K = 0 \, wide r gt.eq sqrt(m \/ 2) \, $

the ADM energy is $m$, the momentum is zero, and the boundary has three-volume $omega_3 \( 2 m \)^(3 \/ 2)$.
  The areal radius $r + m \/ \( 2 r \)$ is nondecreasing on this exterior.
  Radial projection to its boundary is therefore nonexpanding on three-dimensional tangent volumes;
  its degree on an enclosing cut is one. The minimum enclosing volume is consequently the boundary volume,
  and (8.2) is an equality for this family. The theorem concerns the numerical bound.
  Classification at equality requires a separate argument on the original data.

=== 8.2 The exact cut class and removal of other ends <the-exact-cut-class-and-removal-of-other-ends>

#thm([Lemma 8.3.])[
  (Cut reduction and positivity).  #emph[Under the hypotheses of Theorem 49,
    the quantity $A_e \( S \)$ is finite and strictly positive for every end $e$.
    Truncating all other ends at sufficiently large coordinate spheres gives a connected,
    complete one-ended exterior $M_T$ with compact smooth boundary $S_T$.
    All its boundary components have future nonpositive expansion with the normal into $M_T$.
    Its selected-end charges are the original charges, and
#[#set math.equation(numbering: n => "(8.4)")
 $ A_(*) \( M_T \, g \) gt.eq A_e \( S \) \, wide lim_(T arrow.r oo) A_(*) \( M_T \, g \) =
   A_e \( S \) . $ <n4:end:cut-truncation>]

 The common parameter $T$ in the limit can be replaced by any exhaustion in which every unwanted truncation radius
   tends to infinity.]
] <n4:lem:cut-reduction>

#proof[
  A sufficiently distant sphere in the chosen end bounds an admissible outer domain, so the infimum is finite.
    To obtain a positive lower bound, choose an embedded arc from an open disk in $S$ to the chosen end,
    and continue it along a straight coordinate ray. The compact part of the arc can be chosen embedded and
    disjoint from the boundary except at its initial point. A boundary collar and the tubular neighborhood theorem
    give a proper tube with coordinates
  $ \[ 0 \, oo \) times B^3 arrow.r M . $
  Its initial section lies in $S$; its far part is a Euclidean tube of fixed transverse coordinate size.
    Choose a smooth nonnegative function $eta$ compactly supported in $B^3$, with integral one, and define in this tube
  $ alpha = eta \( z \) thin thin upright(d) z^1 and thin upright(d) z^2 and thin upright(d) z^3 . $
  Extend $alpha$ by zero across the lateral tube boundary. It is a smooth closed three-form on $M$.
    Its comass, meaning the supremum of its absolute value on unit simple three-vectors,
    has a finite bound $C_alpha$: the initial part is compact,
    and the far metric is uniformly comparable with the Euclidean metric.
    A sufficiently distant selected-end sphere has $alpha$-integral one, after fixing orientation.
  Let $D_e$ be any admissible outer domain with cut $Gamma$.
    Cut off its selected-end tail at a sphere beyond $Gamma$.
    The resulting domain is compact, since $D_e$ contains no distant part of another end.
    Its boundary is the distant sphere together with the #emph[entire] intrinsic boundary $Gamma$,
    with the boundary orientations. Stokes’ theorem gives
  $ lr(|integral_Gamma alpha|) = 1 \, wide \| Gamma \|_g gt.eq C_alpha^(- 1) . $
  This proof applies to disconnected cuts and to frontier on $S$.
    In particular, it proves positivity before any end is truncated.
  On an unwanted end, the normal of the truncation sphere that points into the retained manifold is the inward
    radial normal. The given decay therefore gives
  $ H = - 3 T^(- 1) + O \( T^(- 1 - q) \) \, wide "tr"_(S_T) K = O \( T^(- 1 - q) \) . $
  The new boundary has strictly negative future expansion for large $T$.
    The other boundary components are the original ones. Removing the open tails leaves a connected manifold:
    a path entering a removed tail can have that portion replaced by a path along its connected spherical
    cross-section. The retained manifold is closed in $M$. It is complete for its intrinsic metric as well.
    Indeed, an intrinsic Cauchy sequence is ambient Cauchy and has a limit in the retained set;
    near a smooth boundary or an interior point, the intrinsic and ambient local distances are comparable in a
    half-ball or ball chart.
  Every admissible outer domain in $M_T$, viewed as a submanifold of $M$, is an admissible outer domain for $e$.
    A part of its frontier on a truncation sphere becomes a hypersurface in the interior of $M$,
    and remains part of its intrinsic boundary. This proves the first inequality in (8.4).
    Conversely, a fixed original admissible domain has compact frontier and contains no tail of any unwanted end.
    It is consequently contained in $M_T$ for all sufficiently large truncation radii and is then an admissible
    domain there. Applying this observation to cuts with area within any prescribed positive error of
    $A_e \( S \)$ proves the limit. The selected-end data have not been changed,
    so neither selected-end charge changes. ◻
]

We may thus work on one-ended data until the final transfer. The boundary is always included.
  No finite-perimeter relaxation or minimizing cut is needed in this section.

=== 8.3 Conformal changes and an energy-raising shell <conformal-changes-and-an-energy-raising-shell>

#thm([Lemma 8.4.])[
  (Conformal constraint and boundary formulas).  #emph[Let $u > 0$ be smooth, and set $g_u = u^2 g$, $K_u = u K$.
    In dimension four, as an identity of scalar functions and an identity of covectors, respectively,
#[#set math.equation(numbering: n => "(8.5)")
 $ u^2 mu_u & = mu - 3 u^(- 1) Delta_g u \,\
u J_u & = J + 3 K \( "grad"_g log u \, dot.op \) . $ <n4:end:conformal-mu>]

 Consequently,
#[#set math.equation(numbering: n => "(8.6)")
 $ u^2 #scale(x: 120%, y: 120%)[\(] mu_u - \| J_u \|_(g_u) #scale(x: 120%, y: 120%)[\)] gt.eq mu - \| J \|_g +
   3 u^(- 1) #scale(x: 120%, y: 120%)[\(] - Delta_g u - \| K \|_g \| thin upright(d) u \|_g
   #scale(x: 120%, y: 120%)[\)] . $ <n4:end:conformal-dec>]

 For any consistently oriented hypersurface,
#[#set math.equation(numbering: n => "(8.7)")
 $ Theta_(K_u) = u^(- 1) #scale(x: 120%, y: 120%)[\(] Theta_K +
   3 partial_nu log u #scale(x: 120%, y: 120%)[\)] . $ <n4:end:conformal-expansion>]

]
] <n4:lem:conformal>

#proof[
  Use Equation (3.2) with $n = 4$, $k = 3$, $p = 2$, and $s = log u$. The constraint normalization is unchanged.
    At zero vector argument its first identity gives $u^2 mu_u = mu - 3 Delta log u - 3 \| d log u \|^2 = mu -
    3 u^(- 1) Delta u$. The covector formula proved with that identity gives $u J_u = J +
    3 K \( nabla log u \, dot.op \)$; taking its $g_u$ norm adds another factor $u^(- 1)$.
    The triangle inequality then gives Equation (8.6), equivalently the $U = u$ specialization of Equation (3.3).
    The boundary formula reads $Theta_(K_u) = u^(- 1) \( Theta_K + 3 partial_nu log u \)$,
    with the same chosen normal. The identities require smooth fields and $u > 0$ only,
    so this application does not strengthen the original $O_2 \/ O_1$ decay hypotheses. ◻
]

#thm([Lemma 8.5.])[
  (Positive shell).  #emph[For any one-ended data in Theorem 49 and every $lambda > 0$,
    there is a conformal change preserving all its hypotheses, with
$ E_lambda = E + 2 lambda \, wide P_lambda = P \, wide A_(*) \( g_lambda \) gt.eq A_(*) \( g \) . $

 The conformal factor is constant near the compact boundary and is at least one everywhere.]
] <n4:end:positive-shell>

#proof[
  Choose $0 < xi < min \( q \, 1 \)$. For $T \( r \) = r^(- 2) - r^(- 2 - xi)$, at sufficiently large radius,
  $ T' < 0 \, wide - Delta_g T - \| K \|_g \| thin upright(d) T \|_g = xi \( 2 + xi \) r^(- 4 - xi) +
    O \( r^(- 4 - q) \) > 0 . $
  Take a nondecreasing smooth switch $beta$ from zero to one in this region,
    constant on neighborhoods of its endpoints, and set
  $ G \( r \) = - integral_r^oo beta \( s \) T' \( s \) thin thin upright(d) s . $
  Extend $G$ constantly throughout the interior. Then $G gt.eq 0$, it equals $T$ sufficiently far out, and
  $ - Delta_g G - \| K \|_g \| thin upright(d) G \|_g =
    beta \( - Delta_g T - \| K \|_g \| thin upright(d) T \|_g \) - beta' T' \| thin upright(d) r \|_g^2 gt.eq 0 . $
  Use $u = 1 + lambda G$ in Lemma 51. The dominant energy condition is preserved,
    as is the boundary expansion sign. The new densities are integrable:
    outside a compact set the additional terms in (8.5)–(8.5) are bounded by constants, depending on $lambda$,
    times $r^(- 4 - xi) + r^(- 4 - q)$. The new falloff exponent can be taken to be $min \( q \, 2 \) > 1$.
  For completeness, the leading change in the metric flux numerator is $- 6 partial_i \( lambda G \)$.
    Products involving $g - delta$, $u - 1$, or their first derivatives have vanishing limiting flux. Hence (8.1) gives
  $ E_lambda - E = - lambda / omega_3 lim_(r arrow.r oo) integral_(S_r) partial_r G thin thin upright(d) A_delta =
    2 lambda . $
  The transformed momentum tensor is exactly $u \( K - tau g \)$.
    Its additional flux is $O \( r^(- q) \)$, so $P_lambda = P$ by (8.1).
    Since $u gt.eq 1$, every cut has at least its original area, proving the cut comparison. ◻
]

The shell will be used only after proving the inequality for $E > \| P \|$.
  It then excludes all remaining ADM vectors; no preliminary strict timelikeness hypothesis will remain.

=== 8.4 Matching the charges before making a rest end <matching-the-charges-before-making-a-rest-end>

A rest end must have energy close to $sqrt(E^2 - \| P \|^2)$, not to $E$.
  We therefore first attach a vacuum reference plane carrying exactly $\( E \, P \)$,
  and only then bend that plane to a static slice. Compact linear corrections make the interpolation deficit
  small; a positive conformal repair restores DEC at vanishing mass cost.

=== The reference plane <the-reference-plane>

#thm([Lemma 8.6.])[
  (Explicit reference-plane charges).  #emph[For any $E > \| P \|$, put $m = \( E^2 - \| P \|^2 \)^(1 \/ 2)$.
    A spacelike plane in the Schwarzschild–Tangherlini spacetime of mass $m$,
    sufficiently far from its central region, has induced vacuum data $\( g_(*) \, K_(*) \)$ with charges exactly
    $\( E \, P \)$, and
$ g_(*) - delta = O_k \( r^(- 2) \) \, wide K_(*) = O_k \( r^(- 3) \) quad upright("for every integer ") k gt.eq 0 . $

 Here $K_(*)$ is one half the metric rate in the future normal direction.]
] <n4:end:boosted-plane>

#proof[
  Use Lemma 10 with $n = 4$, $k = 3$, $p = 2$, and $M = m$. Its exact isotropic spacetime metric is
  #[#set math.equation(numbering: n => "(8.8)")
   $ upright(bold(g)) = - (frac(1 - m \/ \( 2 \| y \|^2 \), 1 + m \/ \( 2 \| y \|^2 \)))^2 upright(d) b^2 +
     (1 + frac(m, 2 \| y \|^2))^2 sum_(i = 1)^4 \( upright(d) y^i \)^2 . $ <n4:end:tangherlini>]
  Rotate the first axis into the direction of $P$ and put $v = \| P \| \/ E$, $gamma = \( 1 - v^2 \)^(- 1 \/ 2)$.
    The Lorentz plane in that lemma has $E_(*) = m gamma = E$ and $P_(* 1) = m gamma v = \| P \|$,
    with all transverse momenta zero. These are the present factors $1 \/ \( 6 omega_3 \)$ and
    $1 \/ \( 3 omega_3 \)$: in particular no mass is rescaled.
    The leading energy flux is $6 m gamma^2 x_i rho^(- 4)$, the leading momentum tensor is the $k =
    3$ instance of (3.7), and the angular integral in (3.8) is $omega_3 \/ gamma$.
    Thus the sign and normalization are the same ones used here.
    The second form uses the same future-normal convention. Finally the metric and tensor remainders in that lemma
    are $O_d \( r^(- 4) \)$ and $O_d \( r^(- 5) \)$, with leading orders $r^(- 2)$ and $r^(- 3)$,
    through every fixed derivative order. Gauss–Codazzi in the vacuum metric (8.8) proves that the reference data
    are vacuum. ◻
]

=== Compact inverses for the linear constraints <compact-inverses-for-the-linear-constraints>

Localized constraint deformation and finite-dimensional adjoint obstructions have a substantial history
  #cite(label("CorvinoSchoen2006")) #cite(label("ChruscielDelay2003")).
  The compact operators below are used to reduce, rather than silently solve away, the interpolation defect.
  The subsequent DEC repair and comparison of every admissible cut are separate conclusions of this section.

On Euclidean four-space write

#[#set math.equation(numbering: n => "(8.9)")
 $ cal(L) b = partial_i partial_j \( b_(i j) - \( "tr"_delta b \) delta_(i j) \) \, wide \( cal(D) k \)_i =
   partial_j \( k_(i j) - \( "tr"_delta k \) delta_(i j) \) . $ <n4:end:linear-operators>]

These are the linearizations at $\( delta \, 0 \)$ of $2 mu$ and $J$.
  The next lemma identifies every compatibility condition needed for a compact correction.

#thm([Lemma 8.7.])[
  (Compact linear constraint corrections).  #emph[Fix a compact subannulus $U_0$ of a bounded connected Euclidean
    annulus $U$. If $f$ and $F$ are smooth and supported in $U_0$, and
#[#set math.equation(numbering: n => "(8.10)")
 $ integral f phi.alt thin thin upright(d) z & = 0 &  & upright("for every affine ") phi.alt \,\
integral F_i Y^i thin thin upright(d) z & = 0 &  & upright("for every Euclidean Killing field ") Y \,
  $ <n4:end:compatibility>]

 there are symmetric smooth tensors $b \, k$, supported in a fixed compact subset of $U$, with $cal(L) b = f$,
   $cal(D) k = F$. For every integer $j gt.eq 0$ and every $1 < p_1 < oo$,
   they can be chosen linearly in the sources so that
#[#set math.equation(numbering: n => "(8.11)")
 $ parallel b parallel_(W^(j + 2 \, p_1)) lt.eq C parallel f parallel_(W^(j \, p_1)) \, wide
   parallel k parallel_(W^(j + 1 \, p_1)) lt.eq C parallel F parallel_(W^(j \, p_1)) . $ <n4:end:inverse-bounds>]

 The constant depends only on $U_0 \, U \, j \, p_1$ and fixed localization choices.
   The moment conditions are also necessary for compactly supported solutions.]
] <n4:end:compact-inverses>

#proof[
  Lemma 11 applies with $n = 4$ on the given connected annulus.
    Its scalar operator $sans(S)$ is $cal(L)$, and its vector operator $sans(D)$ is $cal(D)$.
    Its affine and Euclidean Killing moments are exactly (8.10). The inverse trace reversal specializes to
  #[#set math.equation(numbering: n => "(8.12)")
   $ b = S - 1 / 3 \( "tr"_delta S \) delta \, $ <n4:end:trace-inverse>]
  so $b - \( "tr"_delta b \) delta = S$. The scalar construction gains two Sobolev derivatives.
    The symmetric divergence construction first gains one derivative,
    uses a further divergence inverse to correct the skew part, and differentiates that correction once;
    its net gain is one. This proves (8.11), with support in a fixed larger compact subset and linear dependence
    on the sources. No quantitative derivative bound for the initial data is being inferred here;
    the commutator calculation below establishes the needed source norms from $O_2 \/ O_1$.
  For necessity, integration by parts pairs $cal(L) b$ with $"Hess" phi.alt - \( Delta phi.alt \) delta$,
    which vanishes for affine $phi.alt$, and pairs $cal(D) k$ with the symmetric gradient of a Killing field after
    trace reversal. The latter also vanishes. Thus all and only the stated moments obstruct these compact inverses. ◻
]

=== 8.5 Rest-end replacement and comparison of all cuts <rest-end-replacement-and-comparison-of-all-cuts>

#thm([Proposition 8.8.])[
  (Rest-end replacement).  #emph[Let $\( M \, g \, K \)$ satisfy the one-ended hypotheses of Theorem 49,
    and suppose $E > \| P \|$. Put $m = \( E^2 - \| P \|^2 \)^(1 \/ 2)$.
    There is a sequence of smooth data $\( g_R \, K_R \)$ on the same manifold,
    complete with the same compact boundary, satisfying the dominant energy condition and the same future boundary
    inequality, such that:]
  + #emph[$K_R$ is compactly supported, and the ultimate end is an exact static Schwarzschild–Tangherlini spatial end;]
  + #emph[its energy is $m_R = m + o \( 1 \)$, its momentum is zero, and both constraint densities are integrable;]
  + #emph[$A_(*) \( g_R \) gt.eq \( 1 - o \( 1 \) \) A_(*) \( g \)$.]
  #emph[Every error here tends to zero as $R arrow.r oo$ for the fixed original data and fixed timelike vector.
    No uniformity as $E - \| P \|$ tends to zero is asserted or needed.]
] <n4:prop:rest-end>

#proof[
  Use Lemma 53 for a reference end with exactly the original charges.
    We first join the data to this plane on $R < r < 4 R$, controlling the full pointwise constraint deficit.
  ===== 8.5.1 The scaled commutators. <the-scaled-commutators.>
  Fix $1 < p < min \( 2 \, q \)$, write $x = R z$, and on $1 < \| z \| < 4$ use the scaled component fields
  $ g \( R z \) \, wide k \( z \) = R K \( R z \) \, $
  and their reference counterparts. This corresponds to rescaling lengths by $R^(- 1)$,
    so both constraint densities scale by $R^2$. The metric deviations and tensors have size $O \( R^(- p) \)$ in
    $C^2$ and $C^1$, respectively. Expanding the constraint map about $\( delta \, 0 \)$ gives its linear part
    $\( cal(L) \, cal(D) \)$ from (8.9), with remainder bounded in $C^0$ by $C R^(- 2 p)$.
    This follows directly from the scalar curvature formula: the nonlinear metric terms are bounded by
    $C \( \| b \| \| D^2 b \| + \| D b \|^2 \)$; the other scalar terms are quadratic in $k$.
    The momentum remainder is bounded by $C \( \| b \| \| D k \| + \| D b \| \| k \| \)$.
  Choose a fixed smooth radial $psi$, equal to one near $\| z \| = 1$ and zero near $\| z \| = 4$, with $0 lt.eq
    psi lt.eq 1$. Blend the metric components and tensors by $psi$.
    If $b$ is the difference of the two scaled metric perturbations and $k$ the difference of the two scaled
    tensors, the errors of the linear constraints relative to the blended sources are $f_R = \[ cal(L) \, psi \]
    b$ and $F_R = \[ cal(D) \, psi \] k$. For $T_(i j) = b_(i j) - \( "tr"_delta b \) delta_(i j)$,
  #[#set math.equation(numbering: n => "(8.13)")
   $ \[ cal(L) \, psi \] b & = \( partial_i partial_j psi \) T_(i j) + 2 \( partial_i psi \) partial_j T_(i j) \,\
\( \[ cal(D) \, psi \] k \)_i & = \( partial_j psi \) \( k_(i j) - \( "tr"_delta k \) delta_(i j) \) .
  $ <n4:end:scalar-commutator>]
  These expressions are supported in a fixed compact subannulus, and their $C^1$ norms are $O \( R^(- p) \)$.
    In particular, the first bound uses only two metric derivatives, and the second only one tensor derivative.
  ===== 8.5.2 All compatibility moments are small. <all-compatibility-moments-are-small.>
  We prove the sharper bound $o \( R^(- 2) \)$ for every moment in (8.10).
    Work momentarily in the physical coordinates, with
  $ h = g - g_(*) \, quad T = K - \( "tr"_delta K \) delta - K_(*) + \( "tr"_delta K_(*) \) delta \, quad f =
    cal(L) h \, quad F_i = partial_j T_(i j) . $
  Both $f$ and $F$ belong to $L^1$ on the end. Indeed, the difference between the physical constraints and their
    Euclidean linear parts is $O \( r^(- 2 - 2 min \( q \, 2 \)) \)$, which is integrable in dimension four.
    The physical densities are integrable by hypothesis and by reference vacuum,
    and Euclidean and physical measures and norms are uniformly comparable there.
  An elementary consequence of integrability is
  #[#set math.equation(numbering: n => "(8.14)")
   $ integral_(r_0 < r < 4 R) r \( \| f \| + \| F \| \) thin thin upright(d) x =
     o \( R \) . $ <n4:end:weak-first-moment>]
  To see this, split at a fixed radius $L$. The integral up to $L$, divided by $R$, tends to zero.
    The remaining integral divided by $R$ is at most four times the $L^1$ tail beyond $L$,
    which can be made arbitrarily small. A finite first moment is not required.
  For an affine function $phi.alt$, define the flux primitive
  $ Q_(phi.alt \, i) = phi.alt \( partial_j h_(i j) - partial_i h_(j j) \) - \( partial_j phi.alt \)
    h_(i j) + \( partial_i phi.alt \) h_(j j) . $
  Its divergence is $phi.alt f$. For a Killing field $Y$, symmetry of $T$ gives $partial_j \( Y^i T_(i j) \) =
    Y^i F_i$. Let $frak(F)_phi.alt \( r \)$ and $frak(G)_Y \( r \)$ be the corresponding outward Euclidean sphere
    fluxes. For constant tests, matching the ADM charges gives
  $ frak(F)_1 \( r \) = o \( 1 \) \, wide frak(G)_(e_i) \( r \) = o \( 1 \) . $
  In the momentum flux the replacement of $"tr"_g K thin g$ by $\( "tr"_delta K \)
    delta$ costs at most $O \( r^(2 - 2 min \( q \, 2 \)) \) = o \( 1 \)$.
    For homogeneous linear scalar tests and rotational fields, integration from a fixed sphere and (8.14) instead give
  $ frak(F)_phi.alt \( r \) = o \( r \) \, wide frak(G)_Y \( r \) = o \( r \) . $
  Put $psi_R \( x \) = psi \( x \/ R \)$, and let $A_R = { R < r < 4 R }$.
    Integration by parts, with $psi_R = 1$ near the inner sphere and zero near the outer sphere,
    gives the exact formulas
  #[#set math.equation(numbering: n => "(8.15)")
   $ integral_(A_R) phi.alt \[ cal(L) \, psi_R \] h thin thin upright(d) x & = - frak(F)_phi.alt \( R \) -
     integral_(A_R) psi_R phi.alt f thin thin upright(d) x \,\
integral_(A_R) Y^i \( \[ cal(D) \, psi_R \] \( K - K_(*) \) \)_i thin thin upright(d) x & = - frak(G)_Y \( R \) -
  integral_(A_R) psi_R Y^i F_i thin thin upright(d) x . $ <n4:end:scalar-moment>]
  In scaled coordinates, constant moments have the factor $R^(- 2)$:
    the source scales by $R^2$ and volume by $R^(- 4)$. A linear test in $z$ contributes the additional factor
    $R^(- 1)$. Thus (8.15)–(8.15) and the preceding estimates show
  #[#set math.equation(numbering: n => "(8.16)")
   $ integral f_R phi.alt thin thin upright(d) z = o \( R^(- 2) \) \, wide
     integral \( F_R \)_i Y^i thin thin upright(d) z = o \( R^(- 2) \) $ <n4:end:small-moments>]
  for each element of a fixed basis of the affine functions or Killing fields.
  ===== 8.5.3 Correction and the physical deficit. <correction-and-the-physical-deficit.>
  Choose a nonnegative smooth bump $zeta$, supported in a fixed ball within the annulus and positive on a smaller
    ball. For a basis of the affine tests, its Gram matrix $integral zeta phi.alt_a
    phi.alt_b$ is positive definite. For a basis of Killing fields,
    the matrix $integral zeta thin Y_a dot.op Y_b$ is likewise positive definite:
    a nonzero affine Killing field cannot vanish on an open ball.
    Subtract the corresponding bump combinations from $f_R \, F_R$ to erase their moments.
    By (8.16), the coefficients, and every fixed smooth norm of these bump corrections, are $o \( R^(- 2) \)$.
  Apply Lemma 54 to the negatives of the moment-free commutators and add the resulting tensors to the blend.
    With $j = 1$ and $p_1 > 4$, Sobolev embedding and (8.11) bound the metric correction in $C^2$ and the tensor
    correction in $C^1$ by $C R^(- p)$. Their supports stay in a fixed enlarged compact subannulus.
    The new metric is positive for sufficiently large $R$ and agrees exactly with the original data inside $R$ and
    the plane outside $4 R$.
  Let $\( tilde(g)_R \, tilde(K)_R \)$ denote these physical data.
    Their scaled constraints equal $psi$ times the original scaled constraints, plus an error $o \( R^(- 2) \) +
    O \( R^(- 2 p) \)$; the reference constraints vanish. The change in the momentum norm costs another
    $O \( R^(- 2 p) \)$, because the metric change is $O \( R^(- p) \)$ and the scaled momentum density is
    $O \( R^(- p) \)$. Since $psi gt.eq 0$, the original dominant energy condition implies, after undoing the scaling,
  #[#set math.equation(numbering: n => "(8.17)")
   $ tilde(mu)_R - \| tilde(J)_R \|_(tilde(g)_R) gt.eq - eta_R R^(- 4) \, wide eta_R arrow.r
     0 . $ <n4:end:physical-deficit>]
  Indeed the remaining physical error is $R^(- 2) \[ o \( R^(- 2) \) + O \( R^(- 2 p) \) \] = o \( R^(- 4) \)$,
    since $p > 1$. The possible deficit is confined to a fixed closed subannulus on the scale $R$.
    Replace $eta_R$ by a positive majorant tending to zero if necessary.
  ===== 8.5.4 Bending the plane to a static slice. <bending-the-plane-to-a-static-slice.>
  Only the exact reference region is used for this step. In its spatial coordinates $y$, write the plane as $b =
    v dot.op y$. Choose a smooth switch $psi_1$ from one to zero on $\[ 0 \, 1 \]$,
    constant outside that interval, and replace the plane farther out by the graph
  #[#set math.equation(numbering: n => "(8.18)")
   $ b = \( v dot.op y \) psi_1 (L^(- 1) log \( \| y \| \/ R_b \)) . $ <n4:end:vacuum-bend>]
  Here $R_b$ is a sufficiently large fixed multiple of $R$,
    so the graph initially lies wholly beyond the gluing annulus.
    For fixed $\| v \| < 1$, choose the fixed $L$ so large that
  $ \| "grad"_y b \| lt.eq \| v \| #scale(x: 120%, y: 120%)[\(] 1 +
    parallel psi'_1 parallel_oo \/ L #scale(x: 120%, y: 120%)[\)] < 1 . $
  The Minkowski graph is uniformly spacelike. Since the perturbation (8.8) is $O \( r^(- 2) \)$,
    it remains uniformly spacelike in that metric for large $R$.
    It agrees with the plane on an open inner region and with $b = 0$ on an open outer region.
    These induced data are vacuum everywhere in the bend, so it adds no deficit.
  In the fixed $x$ chart, use $y = A x$ where $A = \( I - v ⊗ v \)^(- 1 \/ 2)$, with the chosen rotation.
    The derivatives of (8.18) give $D^2 b = O \( r^(- 1) \)$, and the induced data,
    now denoted $\( g_R^0 \, K_R^0 \)$, satisfy on all transition regions
  #[#set math.equation(numbering: n => "(8.19)")
   $ c delta lt.eq g_R^0 lt.eq C delta \, wide \| partial g_R^0 \| + \| K_R^0 \| lt.eq
     C \/ r . $ <n4:end:transition-geometry>]
  Here $c \, C > 0$ may depend on the fixed boost and switches, but not on large $R$.
    Outside a fixed multiple of $R$, the data are static in the $y$ chart and have tensor zero.
  For the repair choose a smooth radius $frak(r)$, equal to $\|
    x \|$ through the gluing annulus and through the bend, and equal to $\|
    y \|$ farther out in the static region. It can be chosen with
  #[#set math.equation(numbering: n => "(8.20)")
   $ frak(r) asymp r \, wide c lt.eq \| thin upright(d) frak(r) \|_(g_R^0) lt.eq C \,
     wide \| Delta_(g_R^0) frak(r) \| lt.eq C \/ r . $ <n4:end:radius-bounds>]
  Here is an explicit way to make the interpolation. In the static region put $a \( n \) = \| A^(- 1) n \|$, $n =
    y \/ \| y \|$, and interpolate
  $ log frak(r) = log \| y \| + \( 1 - chi \( log \( \| y \| \/ R_c \) \) \) log a \( n \) . $
  Take $R_c$ beyond the bend and make $chi$ change from zero to one over a sufficiently long fixed logarithmic
    interval. Its slope can be made so small that the derivative of $log frak(r)$ with respect to $log \|
    y \|$ lies between $1 \/ 2$ and $3 \/ 2$. Angular derivatives are bounded,
    second spatial derivatives are $O \( r^(- 1) \)$, and (8.19) proves (8.20).
    All transition intervals are contained between fixed multiples of $R$.
  ===== 8.5.5 A conformal repair with vanishing mass cost. <a-conformal-repair-with-vanishing-mass-cost.>
  Write $s = frak(r) \/ R$. We construct a nonnegative function $F_R \( s \)$, constant on the inside, and use
  $ u_R = 1 + epsilon_R R^(- 2) F_R \( s \) \, wide epsilon_R = C_0 eta_R . $
  Choose a fixed interval $\[ a \, b_1 \]$ in the $s$ variable that starts before the possible deficit,
    contains all transition regions, and ends where the radius is $\| y \|$ and the data are static.
    This interval lies in the end for all large $R$. Put $z_R = - F'_R$ and prescribe
  #[#set math.equation(numbering: n => "(8.21)")
   $ z_R \( a \) = 0 \, wide z'_R = C_1 z_R + omega_1 \, $ <n4:end:repair-ode>]
  where $omega_1 gt.eq 0$ is smooth, vanishes on a neighborhood of $a$,
    and is at least one on a neighborhood of the possible deficit interval. Choose it to vanish near $b_1$.
    The solution is nonnegative and its norms on this fixed interval are bounded independently of large $R$.
  Differentiating $u_R$ and using (8.19) and (8.20) gives fixed constants $c' \, C' > 0$ such that
  #[#set math.equation(numbering: n => "(8.22)")
   $ - Delta_(g_R^0) u_R - \| K_R^0 \| \| thin upright(d) u_R \|_(g_R^0) gt.eq
     epsilon_R R^(- 4) \( c' z'_R - C' z_R \) quad upright("on ") a lt.eq s lt.eq b_1 . $ <n4:end:repair-estimate>]
  In fact the first positive term is $epsilon_R R^(- 4) z'_R \| thin upright(d) frak(r) \|^2$;
    the other terms are $epsilon_R R^(- 3) z_R Delta frak(r)$ and the negative tensor term,
    both bounded below by $- C epsilon_R R^(- 4) z_R$ here. Choose $C_1 > C' \/ c'$.
    Equation (8.21) then makes (8.22) nonnegative everywhere on this interval and at least $c' epsilon_R
    R^(- 4)$ on the deficit region.
  On the static region put $c_m = m \/ 2$ and continue $z_R$ so that
  $ q_R \( s \) = s^3 (1 + frac(c_m, R^2 s^2))^2 z_R \( s \) $
  is nondecreasing and becomes a positive constant $q_(R \, oo)$.
    This can be done smoothly with a uniform bound on $q_(R \, oo)$.
    Indeed, immediately past $b_1$, continue (8.21); both its derivative and that of the positive prefactor make
    $q'_R$ nonnegative for large $R$. Multiply this nonnegative derivative by a smooth switch that equals one
    initially and zero after one more fixed interval, and integrate.
    This preserves all matching derivatives and keeps $q_R$ nondecreasing.
    The radial Laplacian of the static metric then shows $- Delta_(g_R^0) u_R gt.eq 0$ there,
    since its radial divergence is proportional to $- q'_R$; also $K_R^0 = 0$.
  Set $F_R \( s \) = integral_s^oo z_R \( t \) thin thin upright(d) t$, extending it constantly before $a$.
    Its norm is bounded uniformly: the finite intervals have bounded length and data, while on the tail $z_R =
    O \( s^(- 3) \)$. Thus $1 lt.eq u_R lt.eq 2$ for large $R$.
    Choose the fixed $C_0$ large enough that $3 u_R^(- 1) c' epsilon_R gt.eq eta_R$.
    Lemma 51, (8.17), and (8.22) now prove the dominant energy condition everywhere for
  $ g_R = u_R^2 g_R^0 \, wide K_R = u_R K_R^0 . $
  The repair is constant in a neighborhood of the original boundary, and therefore preserves its expansion sign.
  On the ultimate tail the integral for $F_R$ is explicit:
  $ u_R = 1 + frac(a_R, \| y \|^2 + c_m) \, wide a_R = 1 / 2 epsilon_R q_(R \, oo) = O \( epsilon_R \) = o \( 1 \) . $
  Consequently
  #[#set math.equation(numbering: n => "(8.23)")
   $ g_R = (1 + frac(c_m + a_R, \| y \|^2))^2 delta \, wide K_R = 0 quad
     upright("on that tail") . $ <n4:end:static-repaired-metric>]
  Its energy is $m + 2 a_R = m + o \( 1 \)$, with zero momentum, by the direct static instance of Lemma 53.
    The densities vanish on this tail and are smooth on the remaining compact part, so they are integrable.
    The data are complete with boundary: a fixed compact core is smooth,
    and the end has a uniform positive metric lower bound for each $R$.
  ===== 8.5.6 Comparison of every enclosing cut. <comparison-of-every-enclosing-cut.>
  The final metric dominates the original $g$ for $r lt.eq R$,
    because the intermediate data there are the original ones and $u_R gt.eq 1$.
    For $r gt.eq R$, (8.19) and the static tail give $g_R gt.eq
    c delta$ in the original $x$ chart with a fixed $c > 0$. Choose $0 < kappa < min \( 1 \, sqrt(c) \/ 2 \)$.
    Let $L_R = R^(1 \/ 2)$, and choose a smooth strictly increasing radial map $rho_R$ equal to $r$ for $r lt.eq
    L_R$, with derivative decreasing from one to $kappa$ on $\[ L_R \, 2 L_R \]$,
    and derivative $kappa$ afterward. It defines a diffeomorphism
  $ Phi_R \( x \) = rho_R \( \| x \| \) thin frac(x, \| x \|) $
  on the end, extended by the identity on the core. It is proper because $rho_R \( r \) arrow.r oo$,
    preserves the selected end, and fixes the boundary. Its radial and tangential Euclidean dilations are $rho'_R$
    and $rho_R \/ r$. They are at most one everywhere, and for $r gt.eq R$ are at most $kappa + O \( R^(- 1 \/ 2) \)$.
  On the nonidentity region with $r lt.eq R$, both $r$ and $rho_R \( r \)$ tend uniformly to infinity;
    the original metric is therefore $\( 1 + o \( 1 \) \) delta$ at both points.
    The dilation bound and $g_R gt.eq g$ show $Phi_R^(*) g lt.eq \( 1 + o \( 1 \) \) g_R$ there.
    For $r gt.eq R$, the choice of $kappa$, the same original-end decay, and $g_R gt.eq
    c delta$ give this inequality as well. It is immediate on the identity core.
    We have thus proved the global tensor comparison
  #[#set math.equation(numbering: n => "(8.24)")
   $ Phi_R^(*) g lt.eq \( 1 + epsilon.alt_R \) g_R \, wide epsilon.alt_R arrow.r 0 . $ <n4:end:compression-metric>]
  Let $Gamma$ be the full boundary of any admissible outer domain for $g_R$.
    Its image under this proper diffeomorphism is the full boundary of an admissible original outer domain,
    with all coincident frontier retained. Equation (8.24) gives
  $ \| Phi_R \( Gamma \) \|_g lt.eq \( 1 + epsilon.alt_R \)^(3 \/ 2) \| Gamma \|_(g_R) . $
  Taking infima gives
  $ A_(*) \( g \) lt.eq \( 1 + epsilon.alt_R \)^(3 \/ 2) A_(*) \( g_R \) \, $
  which proves the last assertion without a compactness assumption on minimizing sequences. ◻
]

=== 8.6 Strict trapping and a positive energy margin <n4:sec:strictification>

The rest-end replacement preserves weak trapping and the dominant energy condition.
  The prepared construction requires strict inequalities. We now obtain them by a conformal change whose size
  tends uniformly to zero and whose change in ADM energy can be computed exactly.
  All constants in this step belong to one fixed rest-end metric.
  In particular, when that metric depends on the replacement radius $R$, we keep $R$ fixed throughout this construction.

The drift-Poisson equation used below is related to Jaracz’s conformal
  strictification #cite(label("Jaracz2025StrictDEC")). The proof here supplies the four-dimensional equation,
  its nonzero inner Neumann condition, and the charge and full-cut estimates needed for the numerical argument.

#thm([Lemma 8.9.])[
  (Strictification of a fixed rest end).  #emph[Let $\( M \, g \, K \)$ be a smooth connected four-dimensional
    exterior, complete with its nonempty compact smooth boundary included,
    with one Euclidean coordinate end and compact complement.
    Suppose $mu gt.eq \| J \|_g$ and $Theta_K lt.eq 0$ on every boundary component,
    where the boundary normal $nu$ points into $M$. Assume that $K$ has compact support and that, outside a compact set,
$ g = (1 + c / r^2)^2 delta $

 in the end coordinates, for a constant $c$. Fix $0 < delta_1 < 1$,
   and extend the coordinate radius to a positive smooth function $r$ on $M$.]
  #emph[There is a nonnegative smooth function $phi.alt$, with $phi.alt =
    O_k \( r^(- 2) \)$ for every fixed derivative order $k$, such that, for all sufficiently small $s > 0$, the data
$ \( g_s \, K_s \) = \( e^(2 s phi.alt) g \, e^(s phi.alt) K \) $

 satisfy
#[#set math.equation(numbering: n => "(8.25)")
 $ Theta_(K_s) < 0 \, wide mu_s - \| J_s \|_(g_s) gt.eq c_s r^(- 4 - delta_1) quad upright("on ") M \, wide
   c_s > 0 . $ <n4:eq:strictification-output>]

 They are complete, have compactly supported second fundamental form, integrable constraint densities,
   zero ADM momentum and finite ADM energy. Their end satisfies
#[#set math.equation(numbering: n => "(8.26)")
 $ g_s - delta = O_k \( r^(- 2) \) quad upright("for every fixed ") k \, wide R_(g_s) =
   O \( r^(- 4 - delta_1) \) . $ <n4:eq:strictification-decay>]

 For the full enclosing-cut infimum on this fixed exterior,
#[#set math.equation(numbering: n => "(8.27)")
 $ E_(g_s) arrow.r E_g \, wide A_(*) \( g_s \) arrow.r A_(*) \( g \) quad
   upright("as ") s arrow.b 0 . $ <n4:eq:strictification-limits>]

]
] <n4:lem:strictification>

#proof[
  The generic strictification lemma, Lemma 13, applies to this fixed rest exterior.
    Indeed the exact static tail has $g - delta = O_d \( r^(- 2) \)$ for every $d$,
    and $K$ is compactly supported. Choose any $1 < q_(*) < 2$ to express its $O_6 \/ O_5$ bounds, set $n = 4$,
    $k = 3$, and take $beta = delta_1$. The condition $0 < delta_1 <
    min \( 1 \, q_(*) \)$ is exactly the one required by that lemma.
    Its smooth nonnegative majorant can be chosen compactly supported: write it as $b_0 gt.eq \| K \|_g$.
    The complete mixed-boundary continuation, uniform core and tail estimates, exhaustion,
    and differentiated-decay proof of that lemma therefore give a positive smooth solution of
  #[#set math.equation(numbering: n => "(8.28)")
   $ - Delta_g phi.alt = b_0 sqrt(\| upright(d) phi.alt \|_g^2 + r^(- 6)) + r^(- 4 - delta_1) \, wide
     partial_nu phi.alt = - 1 \, wide phi.alt arrow.r 0 . $ <n4:eq:strictification-pde>]
  The exponent $- 6$ is $- 2 k$. The all-order clause of the same lemma gives
  #[#set math.equation(numbering: n => "(8.29)")
   $ \| partial^j phi.alt \| lt.eq C_j r^(- 2 - j) wide \( j gt.eq 0 \) . $ <n4:eq:strictification-phi-decay>]
  This application occurs after rest replacement, so it uses no higher derivatives of the original weakly
    asymptotically flat end.
  We now verify the geometric conclusions. Put
  $ F = b_0 sqrt(\| upright(d) phi.alt \|^2 + r^(- 6)) + r^(- 4 - delta_1) . $
  The inner outward normal is $- nu$, and the finite-flux conclusion of the lemma is
  #[#set math.equation(numbering: n => "(8.30)")
   $ L_phi.alt = lim_(T arrow.r oo) integral_(S_T) partial_r phi.alt thin upright(d) A_delta = - \| partial
     M \|_g - integral_M F thin upright(d) V_g < 0 . $ <n4:eq:strictification-flux>]
  The geometric and Euclidean fluxes differ by $O \( T^(- 2) \)$ on the static tail, by (8.29).
  Apply Lemma 51 with $u = e^(s phi.alt)$. It gives
  $ e^(2 s phi.alt) \( mu_s - \| J_s \|_(g_s) \) gt.eq 3 s #scale(x: 120%, y: 120%)[\(] r^(- 4 - delta_1) -
    s \| upright(d) phi.alt \|^2 #scale(x: 120%, y: 120%)[\)] . $
  The number $B = sup_M r^(4 + delta_1) \| upright(d) phi.alt \|^2$ is finite:
    smoothness controls the compact core and the tail is $O \( r^(- 2 + delta_1) \)$. Choose $s B lt.eq 1 \/ 2$.
    This proves the global margin with $c_s = \( 3 s \/ 2 \) e^(- 2 s parallel phi.alt parallel_oo) > 0$.
    On each boundary component,
  $ Theta_(K_s) = e^(- s phi.alt) \( Theta_K + 3 s partial_nu phi.alt \) = e^(- s phi.alt) \( Theta_K - 3 s \) < 0 . $
  Furthermore
  #[#set math.equation(numbering: n => "(8.31)")
   $ g lt.eq g_s lt.eq e^(2 s parallel phi.alt parallel_oo) g . $ <n4:eq:strictification-metric-comparison>]
  Thus completeness with the boundary included is preserved, and the tensor remains compactly supported.
    On the tail, $R_g = 0$, $K_s = 0$ and
  $ R_(g_s) = 6 e^(- 2 s phi.alt) #scale(x: 120%, y: 120%)[\(] s r^(- 4 - delta_1) -
    s^2 \| upright(d) phi.alt \|^2 #scale(x: 120%, y: 120%)[\)] = O \( r^(- 4 - delta_1) \) . $
  This proves the scalar decay and integrability there; the rest is smooth and compact.
    All differentiated metric bounds follow from (8.29), and momentum is zero because the tensor vanishes on a
    distant tail.
  The leading metric change is $2 s phi.alt delta + O_1 \( r^(- 4) \)$, whose energy flux numerator is $-
    6 s partial_i phi.alt + O \( r^(- 5) \)$. The latter remainder has vanishing sphere flux.
    Division by $6 omega_3$ therefore gives
  #[#set math.equation(numbering: n => "(8.32)")
   $ E_(g_s) - E_g = - s / omega_3 L_phi.alt arrow.r 0 . $ <n4:eq:strictification-energy>]
  Every full cut has its three-dimensional area element multiplied by $e^(3 s phi.alt)$;
    the cut class itself is unchanged. Taking infima yields
  #[#set math.equation(numbering: n => "(8.33)")
   $ A_(*) \( g \) lt.eq A_(*) \( g_s \) lt.eq e^(3 s parallel phi.alt parallel_oo) A_(*) \( g \) .
     $ <n4:eq:strictification-area>]
  The infimum is finite, since a distant coordinate sphere is admissible.
    Its convergence as $s arrow.b 0$ follows without an attained minimizer.
    Together these estimates prove every asserted output at this fixed rest datum.
    If it is $\( g_R \, K_R \)$, every constant above may depend on $R$; strictification is removed with $R$ fixed. ◻
]

=== 8.7 Applying the prepared theorem and returning to the original end <applying-the-prepared-theorem-and-returning-to-the-original-end>

The proper radial comparison protects the original enclosing area during rest-end replacement.
  Strictification then changes the cut infimum by a factor tending to one at each fixed replacement radius.
  We apply the prepared inequality after both constructions, remove strictification at that fixed radius,
  and finally send the replacement radius to infinity.

#thm([Proposition 8.10.])[
  (Transfer from prepared data).  #emph[Theorem 8, applied in dimension four, implies Theorem 49.]
] <n4:end:transfer>

#proof[
  First let the original exterior have one end and $E > \| P \|$. Set $m = \( E^2 - \| P \|^2 \)^(1 \/ 2) > 0$.
    Proposition 55 gives data $\( g_R \, K_R \)$ with zero momentum and energy $m_R arrow.r m$.
    Its full-cut comparison is
  #[#set math.equation(numbering: n => "(8.34)")
   $ A_(*) \( g_R \) gt.eq \( 1 + epsilon.alt_R \)^(- 3 \/ 2) A_(*) \( g \) \, wide epsilon.alt_R arrow.r
     0 . $ <n4:end:one-sided-area>]
  Fix one sufficiently large replacement radius $R$. For any fixed $0 < delta_1 < 1$,
    Lemma 56 makes $\( g_(R \, s) \, K_(R \, s) \)$ a prepared exterior for all sufficiently small $s > 0$.
    Indeed it is the same smooth connected orientable one-ended exterior,
    complete with its compact boundary included and with compact complement of its coordinate end.
    It has finite ADM energy and a compactly supported tensor, so its ADM momentum is zero.
    On the end, $g_(R \, s) - delta = O_d \( r^(- 2) \)$ for every fixed derivative order $d$,
    its scalar curvature is $O \( r^(- 4 - delta_1) \)$, and its constraint densities are integrable.
    The boundary is strictly future trapped, and the global margin is
  $ mu_(R \, s) - \| J_(R \, s) \|_(g_(R \, s)) gt.eq c_(R \, s) rho^(- 4 - delta_1) \, wide c_(R \, s) > 0 \, $
  where $rho$ is a positive smooth extension of the rest-end radius.
    These are the geometric and decay conditions of Definition 6, with $n = 4$ and $beta = delta_1$.
  The area condition follows along the same comparisons. In one end,
    Definition 48 is exactly the prepared full-cut class: the outer domain is connected and closed,
    its interior lies in the open exterior, and its entire compact intrinsic boundary is counted,
    including every component and all coincidence with the original boundary.
    Lemma 50 gives $A_(*) \( g \) > 0$; Equation (8.34) and strictification give $A_(*) \( g_(R \, s) \) gt.eq
    A_(*) \( g_R \) > 0$. The constraint and ADM normalizations also agree:
    $2 mu = R + \( "tr" K \)^2 - \| K \|^2$, $J = "div" \( K - \( "tr" K \) g \)$,
    and the energy and momentum factors are $1 \/ \( 6 omega_3 \)$ and $1 \/ \( 3 omega_3 \)$. No rescaling is made.
  Theorem 8 therefore yields, at every such fixed pair $\( R \, s \)$,
  #[#set math.equation(numbering: n => "(8.35)")
   $ E_(R \, s) gt.eq 1 / 2 (frac(A_(*) \( g_(R \, s) \), omega_3))^(2 \/ 3) . $ <n4:end:fixed-prepared-inequality>]
  This is the completed numerical theorem: its elliptic exhaustion and its limits $N arrow.r
    oo$ and $epsilon.alt arrow.b 0$ have already been taken for the fixed prepared datum.
    None of those estimates is required to be uniform in $R$ or $s$.
  Now let $s arrow.b 0$ with $R$ fixed. Strictification gives both $E_(R \, s) arrow.r
    m_R$ and $A_(*) \( g_(R \, s) \) arrow.r A_(*) \( g_R \)$, so
  $ m_R gt.eq 1 / 2 (frac(A_(*) \( g_R \), omega_3))^(2 \/ 3) gt.eq 1 /
    2 \( 1 + epsilon.alt_R \)^(- 1) (frac(A_(*) \( g \), omega_3))^(2 \/ 3) . $
  Only at this point let $R arrow.r oo$. The result is
  #[#set math.equation(numbering: n => "(8.36)")
   $ sqrt(E^2 - \| P \|^2) gt.eq 1 / 2 (frac(A_(*) \( g \), omega_3))^(2 \/ 3) wide \( E > \| P \| \) .
     $ <n4:end:timelike-conclusion>]
  Full convergence of $A_(*) \( g_R \)$ has not been used or asserted.
  It remains to remove the timelike assumption. If instead $E lt.eq \| P \|$,
    take any sequence $a_j > 0$ tending to zero and set
  $ lambda_j = frac(\| P \| + a_j - E, 2) > 0 . $
  Lemma 52 gives, separately for each $j$, data of energy $\| P \| + a_j$, momentum $P$,
    and enclosing infimum at least $A_(*) \( g \)$. Their charges are future timelike, so (8.36) gives
  $ sqrt(\( \| P \| + a_j \)^2 - \| P \|^2) gt.eq 1 / 2 (frac(A_(*) \( g \), omega_3))^(2 \/ 3) > 0 . $
  The right side is fixed and positive by Lemma 50, while the left side tends to zero.
    This contradiction includes zero, negative, and null energy cases.
    No preparation geometry is passed to a limit as the boost degenerates:
    the timelike numerical result was applied afresh to each shell datum.
    Thus $E > \| P \|$ and (8.36) hold for every one-ended original datum in the theorem.
  Finally let the original manifold have finitely many ends and fix one end $e$.
    Truncate every other end at a sufficiently large sphere as in Lemma 50.
    The retained manifold is a complete connected one-ended exterior.
    Its added boundary components are strictly future trapped,
    its selected-end charges are still $\( E_e \, P_e \)$, and its full-cut infimum is at least $A_e \( S \)$.
    Applying the one-ended result gives
  $ E_e gt.eq sqrt(\| P_e \|^2 + 1 / 4 (frac(A_e \( S \), omega_3))^(4 \/ 3)) . $
  Positivity of $A_e \( S \)$ was proved before any truncation.
    This gives both the asserted inequality and strict future timelikeness at $e$. ◻
]

The one-ended cases of Theorems 7.14 and 49 together prove Theorem 5.

=== 8.8 The general maximal DEC energy inequality <the-general-maximal-dec-energy-inequality>

The maximal special case requires no assumption that a momentum limit exists.
  The following end calculation supplies that limit from the decay and integrability already imposed on the data.

#thm([Lemma 8.11.])[
  (Existence of the momentum flux).  #emph[On a smooth four-dimensional asymptotically flat end, suppose $g -
    delta = O_2 \( r^(- q) \)$ and $K = O_1 \( r^(- 1 - q) \)$ for some $q > 1$.
    If $\| J \|_g$ is integrable, where $J_i = nabla^j \( K_(i j) - \( "tr"_g K \) g_(i j) \)$,
    then each ADM momentum limit in (8.1) exists and is finite.]
] <n4:lem:momentum-exists>

#proof[
  In the given coordinates set
  $ pi_(i j)^g = K_(i j) - \( "tr"_g K \) g_(i j) \, wide pi_(i j)^delta = K_(i j) - \( "tr"_delta K \) delta_(i j) . $
  The differentiated decay assumptions give
  #[#set math.equation(numbering: n => "(8.37)")
   $ pi^g - pi^delta = O_1 \( r^(- 1 - 2 q) \) \, wide partial_j pi_(i j)^delta - J_i =
     O \( r^(- 2 - 2 q) \) . $ <n4:end:momentum-integrability>]
  To verify the second bound, expand the covariant divergence as
  $ J_i = g^(j k) #scale(x: 120%, y: 120%)[\(] partial_k pi_(i j)^g - Gamma_(k i)^a pi_(a j)^g -
    Gamma_(k j)^a pi_(i a)^g #scale(x: 120%, y: 120%)[\)] . $
  Replacing $g^(j k)$ by $delta^(j k)$ costs $O \( r^(- q) \) O \( r^(- 2 - q) \)$;
    replacing $pi^g$ by $pi^delta$ costs the derivative of the first bound in (8.37).
    Each connection term has size $O \( r^(- 1 - q) \) O \( r^(- 1 - q) \)$. These are exactly the asserted errors.
  Their Euclidean radial volume bound is $C r^(1 - 2 q)$, integrable because $q > 1$.
    The asymptotic metric and Euclidean volume and covector norms are uniformly comparable,
    so $partial_j pi_(i j)^delta in L^1$. The Euclidean divergence theorem between two large spheres makes the
    flux $integral_(S_R) pi_(i j)^delta n_delta^j thin thin upright(d) A_delta$ a Cauchy function of $R$,
    with finite limit. By the first bound in (8.37), its difference from the flux of $pi^g$ is
    $O \( R^(2 - 2 q) \) arrow.r 0$. This is the tensor appearing in (8.1), which proves the lemma. ◻
]

#thm([Corollary 8.12.])[
  (Maximal DEC energy inequality).  #emph[ Let $\( X^4 \, g_X \, K_X \)$ be smooth and connected,
    with $X$ orientable, $g_X$ complete as a metric space with its nonempty compact smooth boundary $S_X$
    included, and with exactly one end, which is asymptotically flat and diffeomorphic to the complement of a
    closed ball in $bb(R)^4$. Let $K_X$ be a smooth symmetric covariant two-tensor. Suppose
$ "tr"_(g_X) K_X = 0 \, wide mu_X = 1 / 2 \( R_(g_X) - \| K_X \|_(g_X)^2 \) gt.eq \| "div"_(g_X) K_X \|_(g_X) \,\
mu_X \, \| "div"_(g_X) K_X \|_(g_X) in L^1 \( X \, thin upright(d) V_(g_X) \) . $

 Assume for some $q > 1$ that
$ g_X - delta = O_2 \( r^(- q) \) \, wide K_X = O_1 \( r^(- 1 - q) \) \, $

 and that the ADM energy $E_X$ in (8.1) is finite. On every component of $S_X$, require $H + "tr"_(S_X) K_X lt.eq
   0$ with the normal into $X$. For the one-ended enclosing-cut infimum of Definition 48,
   denoted here by $a_(g_X) \( S_X \)$, one has
$ E_X gt.eq 1 / 2 (frac(a_(g_X) \( S_X \), 2 pi^2))^(2 \/ 3) . $

 The boundary may have any topology and finitely many components.
   No symmetry, vacuum, spin, outermostness, outer area-minimization or momentum-flux assumption is imposed.]
] <n4:cor:maximal-dec>

#proof[
  Maximality identifies the momentum density with $J_X = "div"_(g_X) K_X$.
    Lemma 58 supplies the finite ADM momentum. All hypotheses of Theorem 49 therefore hold for this one-ended
    exterior. Its invariant-mass inequality in particular gives the displayed energy bound.
    The proof of Theorem 49 uses Theorem 8, independently of this corollary.
    This numerical consequence retains its broad maximal-DEC scope;
    the separate direct maximal-vacuum construction has its own hypotheses. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
