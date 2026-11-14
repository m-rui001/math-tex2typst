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

#align(center)[#text(size: 16pt, weight: "bold")[Boundary graph deformations for the spacetime Penrose inequality]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <b:introduction>

The spacetime Penrose inequality compares the invariant ADM mass $m_(upright("ADM")) =
  sqrt(E^2 - \| P \|^2)$ with the area needed to enclose a trapped region,
  where $E$ and $P$ are the energy and linear momentum of asymptotically flat initial data.
  The deformations below control energy in a chosen end; for general weak data,
  the invariant-mass conclusion uses a separate passage to rest ends, where $P = 0$.
  Reducing the problem to the Riemannian Penrose inequality already exposes the main difficulty.
  A deformation must create nonnegative scalar curvature while controlling both quantities in the comparison:
  energy at infinity and the area of every enclosing cut. If the deformation is performed on an exterior with a
  genuine inner boundary, its boundary flux is a third quantity that must be controlled.

This paper constructs such boundary deformations in three and four spatial dimensions.
  It also develops a direct four-dimensional maximal construction that retains a noncompact decaying second
  fundamental form. The common output is a smooth complete Riemannian exterior with nonnegative scalar curvature,
  strictly negative inner mean curvature, a metric lower bound protecting all enclosing areas,
  and an arbitrarily small upper error in energy. A minimal enclosure then supplies the boundary to which the
  Riemannian Penrose inequality applies.

To explain the area comparison, let $\( M \, g \, K \)$ be an initial data exterior with compact boundary and one
  asymptotically Euclidean end. The tensor $K$ is the second fundamental form.
  Orient an inner boundary toward the end, let $H$ be its mean curvature, and write $theta_(+) = H +
  "tr"_(upright("tan")) K$ for its future expansion. A full enclosing cut is the entire compact boundary of a
  connected closed outer domain that contains the distant end and has interior in the open exterior.
  Every boundary component counts, including any part coincident with the original boundary.
  Denote the infimum of their $g$-areas by $A_(*) \( g \)$. The infimum need not be attained.
  The precise asymptotic and constraint hypotheses for each construction are stated at its beginning.

Both the area and the horizon predicate matter. In spatial dimension three,
  Ben-Dov’s example has an outermost future apparent horizon $S$ with $\| S \| > 16 pi
  m_(upright("ADM"))^2$ #cite(label("BenDov2004")). Carrasco–Mars construct outer area-minimizing generalized
  apparent horizons, defined by $H = \| "tr"_(upright("tan")) K \|$,
  with the same strict area inequality #cite(label("CarrascoMars2010")). These concern distinct formulations.
  We use full enclosing area and specify the expansion condition in each theorem.

The area comparison uses an elementary point that remains valid for all these cuts.
  In spatial dimension $d$, if $h gt.eq c g$ as quadratic forms for some $c > 0$,
  then the restriction to each tangent $\( d - 1 \)$-plane gives

$ \| Gamma \|_h gt.eq c^(\( d - 1 \) \/ 2) \| Gamma \|_g quad upright("and hence") quad A_(*) \( h \) gt.eq
  c^(\( d - 1 \) \/ 2) A_(*) \( g \) . $

No selection of a minimizing component and no convergence of minimizers is needed for this inequality.
  We use it after constructing a metric of the form

$ hat(g) = e^(4 t \/ \( d - 2 \)) #scale(x: 120%, y: 120%)[\(] g +
  l \( t \)^2 thin upright(d) f^2 #scale(x: 120%, y: 120%)[\)] \, wide t gt.eq - epsilon . $

Here $f$ is the graph height, $t$ is the conformal unknown, and $l > 0$ is the warping factor.
  The graph term is nonnegative on every tangent plane. Thus the lower bound for $t$ protects the full enclosing
  area before the graph is known to have bounded slope.

=== 1.1 The constructions and their relationship <the-constructions-and-their-relationship>

The first two constructions start with strict dominant-energy data, a strictly future-trapped boundary,
  and a prepared end with compactly supported $K$. The third keeps a maximal tensor tail.
  The following map separates these geometric outputs from their original-data applications;
  the cited statements give the full hypotheses. Here $omega_3 = \| S^3 \| = 2 pi^2$.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Construction
], table.cell(rowspan: 1, colspan: 1)[Geometric output
], table.cell(rowspan: 1, colspan: 1)[Original-data consequence
]),
  table.cell(rowspan: 1, colspan: 1)[Prepared dimension three; compact $K$
], table.cell(rowspan: 1, colspan: 1)[Theorem 3
], table.cell(rowspan: 1, colspan: 1)[$m_(upright("ADM")) gt.eq
  sqrt(A_(*) \/ \( 16 pi \))$ for weak decay $q > 1 \/ 2$; Theorem 4
],
  table.cell(rowspan: 1, colspan: 1)[Prepared dimension four; compact $K$
], table.cell(rowspan: 1, colspan: 1)[Theorem 38
], table.cell(rowspan: 1, colspan: 1)[$m_(upright("ADM")) gt.eq 1 /
  2 \( A_(*) \/ omega_3 \)^(2 \/ 3)$ for weak decay $q > 1$; Corollary 68
],
  table.cell(rowspan: 1, colspan: 1)[Direct maximal dimension four; decaying $K$
], table.cell(rowspan: 1, colspan: 1)[Proposition 71
], table.cell(rowspan: 1, colspan: 1)[$E gt.eq 1 / 2 \( \| S \|_g \/ omega_3 \)^(2 \/ 3)$ in the maximal-vacuum
  application; Theorem 70
],
)
]

In the first two applications, weak decay means $g - delta = O_2 \( r^(- q) \)$ and $K = O_1 \( r^(- 1 - q) \)$.
  The exteriors satisfy the dominant energy condition, integrable constraint densities,
  finite timelike ADM charges $E > \| P \|$, and weak future trapping.
  Their separate rest preparations control all enclosing cuts.
  In dimension three, the prepared energies tend to $m_(upright("ADM"))$ and the full enclosing-area infima
  converge. In dimension four, the distant-end replacement supplies a one-sided lower area bound;
  strictification is removed at each fixed repaired end before the replacement radius tends to infinity.
  These inputs are #cite(label("NumericalCompanion")) Proposition 7.13 and Proposition 8.8/Lemma 8.9, respectively.

The direct maximal theorem has its own approximation and retains the tensor tail.
  Its stated application has $q > 1$, ball-exterior topology,
  a connected spherical marginally outer trapped boundary ($theta_(+) = 0$), a torus action, $P = 0$, $E > 0$,
  outermostness, and outer area minimization against all enclosures.
  Here $P = 0$ identifies energy with invariant mass, and outer area minimization identifies $A_(*)$ with $\|
  S \|_g$. The strict geometric output in the middle column has its own hypotheses;
  the theorem records this particular original-data application.
  The broader numerical comparison in Corollary 68 uses the distinct end-replacement route.

The difference at infinity is concrete. With compactly supported $K$,
  the distant trace equation is a homogeneous graph equation with a positive height term.
  When $"tr"_g K = 0$, the retained tensor contributes a term quadratic in $nabla f$,
  which becomes a drift along the solution. The equation remains homogeneous and still forces exponential graph
  decay at fixed deformation parameter. The scalar equation behaves differently:
  its zero-graph limit retains $\| K \|^2 \/ 2$. Section 15 derives this term and the tail weights needed to
  control it. That calculation identifies both the shared argument and the additional preparation,
  threshold geometry and estimates required for the maximal route.

=== 1.2 Why the inner boundary matters <why-the-inner-boundary-matters>

The scalar-curvature identity separates the original constraint densities, a nonnegative quadratic expression,
  and the divergence of a vector field $V$. Prescribing this divergence produces the required curvature sign.
  At infinity, the integral of $V$ measures the ADM energy change.
  A boundary condition for $V$ also prescribes the mean curvature of the deformed inner boundary.
  The divergence theorem therefore links the two ends of the construction.

The useful boundaries are threshold trapped-region frontiers.
  For general $K$, two signs of the tensor produce black and white faces,
  whose names distinguish their expansion equations and the corresponding Dirichlet heights of the graph.
  The collars outside these faces supply geometric barriers for the graph before uniform ellipticity is available.
  They first confine its scaled height to the required interval and then force a signed normal slope.
  That slope makes the possible negative inner flux exponentially small relative to the positive bulk terms.
  The all-black maximal construction has its own threshold argument,
  using maximality in place of the two-sided trace budget.

This order is essential. Uniform ellipticity is an outcome of the geometric height, floor and slope estimates;
  it is not assumed to prove them. Once the coefficients lie in a bounded elliptic range,
  local scalar estimates give the boundary regularity needed for a compact continuation map.
  The four-dimensional proof retains the critical interpolation step and the interface measures produced by
  reflection. Each application verifies its own boundary conditions and completes its own degree and bootstrap argument.

There are two kinds of constants throughout. Polynomial bounds in the large deformation parameter $N$ are used in
  the final flux comparison. Classical regularity constants may depend arbitrarily on fixed $N$.
  One first exhausts the outer radius with $N$ fixed, then lets $N$ tend to infinity using only the polynomial
  estimates. This distinction prevents a local compactness argument from being mistaken for a uniform estimate in
  the final mass limit.

=== 1.3 Relation to earlier methods <relation-to-earlier-methods>

Penrose’s proposed inequality arose from the relation between gravitational collapse,
  horizons and total energy #cite(label("Penrose1973")). In the time-symmetric setting the second fundamental form
  vanishes and the dominant-energy condition becomes nonnegative scalar curvature.
  Geroch’s smooth-flow idea and the conditional argument of Jang–Wald preceded the weak-flow
  theory #cite(label("Geroch1973")) #cite(label("JangWald1977"));
  see also the historical discussion in #cite(label("HuiskenIlmanen2001")) p. 359.
  Huisken–Ilmanen’s weak inverse-mean-curvature flow proved the three-dimensional Riemannian inequality for each
  connected component of the horizon #cite(label("HuiskenIlmanen2001")) Main Theorem, p. 356;
  Bray’s conformal flow gives the bound for the total area of a disconnected horizon #cite(label("Bray2001"))
  Theorems 1 and 19. Bray–Lee extended the numerical conformal-flow theorem to dimensions below eight
  #cite(label("BrayLee2009")) Theorem 1.4. The final comparison here uses the numerical clauses of these theorems
  after constructing their complete Riemannian inputs.

The graph strategy comes from Jang’s equation and the Schoen–Yau positive-energy argument #cite(label("Jang1978"))
  #cite(label("SchoenYau1981")). The earlier Schoen–Yau proof establishes the positive mass theorem in the
  Riemannian and maximal-data cases by minimal surfaces #cite(label("SchoenYau1979")).
  A classical Jang graph can develop a cylindrical end at an apparent horizon;
  Metzger analyses this blow-up and its exponential cylindrical convergence near a strictly stable
  component #cite(label("Metzger2010")). Conformal normalization of such a graph can lose the horizon-area
  comparison. Bray and Khuri developed the warped-graph approach to address this
  obstruction #cite(label("BrayKhuri2010")) #cite(label("BrayKhuri2011"));
  their 2010 work also proves a sharp spherical case under its stated hypotheses.
  The general warped scalar identity already retains a trace discrepancy before the generalized Jang equation is
  imposed #cite(label("BrayKhuri2011")) Identity 9, p. 580.

Han–Khuri prove existence and quantitative boundary blow-up for prescribed warping
  factors #cite(label("HanKhuri2013")). Their later coupling to conformal flow gives a reduction contingent on
  solving the coupled system with the required boundary behavior #cite(label("HanKhuri2018")).
  The direct conclusion of that argument concerns ADM energy, as its Remark 2 explains.
  Here the coupled equations prescribe a nonzero divergence source,
  a trace depending increasingly on graph height, and a penalty near the conformal lower bound.
  The boundary analysis proves global existence for these equations and supplies the area and energy comparisons
  needed for the subsequent limits.

This distinction concerns the equations, not only their interpretation.
  Jaracz proves radial nonexistence for a specified generalized-Jang and zero-divergence
  system #cite(label("Jaracz2023")); that result does not apply to the nonzero-source system studied here.
  His spacetime Poisson method also provides a predecessor for conformal strictification
  #cite(label("Jaracz2025StrictDEC")). The maximal construction below solves its own problem with nonzero inner
  Neumann data and proves the energy and full enclosing-area comparisons needed to remove the strict approximation.

Trapped-region boundaries and their stability enter through the work of Andersson–Metzger and
  Andersson–Eichmair–Metzger #cite(label("AnderssonMetzger2009")) #cite(label("AnderssonEichmairMetzger2011")).
  Eichmair’s Perron and almost-minimizing constructions provide the original higher-dimensional
  method #cite(label("Eichmair2010")); the precise total-region theorem used below is the one recorded by
  Andersson–Eichmair–Metzger. For the stability operator of marginally outer trapped surfaces (MOTS) and its
  principal-eigenfunction characterization of stability we use
  Andersson–Mars–Simon #cite(label("AnderssonMarsSimon2008")).
  The local arguments below explain the additional threshold continuity,
  support transport and collar choices used by the deformation.
  The analytic part combines scalar elliptic estimates with the Leray–Schauder degree principle
  #cite(label("LeraySchauder1934")); the particular boundary homotopies and their admissible open sets are
  constructed explicitly.

Recent spacetime results also distinguish the relevant scopes.
  Khuri–Kunduri prove the sharp inequality for cohomogeneity-one $upright("SU") \( n + 1 \)$-invariant data in
  spatial dimensions $2 \( n + 1 \) gt.eq 4$, with their outermost future-or-past horizon condition
  #cite(label("KhuriKunduri2025")) Theorem 1.1. The direct maximal theorem here has different symmetry and
  outer-area-minimization hypotheses. Allen–Bryden–Kazaras–Khuri prove a three-dimensional invariant-mass bound by
  a universal suboptimal constant times the square root of minimum enclosing area,
  with additional trace decay and a specified horizon selection #cite(label("AllenBrydenKazarasKhuri2025"))
  Theorem 1.1 and Remark 1.2.

Two companion manuscripts supply specified inputs: scalar algebra and weak-end preparations
  from #cite(label("NumericalCompanion")), and full-perimeter enclosure geometry
  from #cite(label("RiemannianCompanion")). Their exact hypotheses and normalization are checked at each use.
  The numerical comparisons at the end of the boundary constructions use Bray and Bray–Lee directly.

=== 1.4 Reading the proof <reading-the-proof>

The three routes retain their own geometry, equations, global bounds and end comparison.
  Shared arguments are proved at their first use in the three-dimensional route:
  threshold continuity, stable collars and exact support transport in Section 3;
  the passage from lower tests to sublevel supports in Lemma 21;
  and scalar measure-source regularity and degree on varying open sets in Lemmas 6.2 and 31.
  Each later use verifies its tensor, coefficients and boundary conditions.

For dimension three, Sections 4–7 proceed from the coupled equations and conformal floor through geometric bounds,
  boundary existence, and the complete-end comparison. Dimension four follows the same order in Sections 9–13,
  with its own compact total-region construction and the critical interpolation in Theorem 61.
  Corollary 68 then gives its separate weak-decay transfer.

Section 15 explains the maximal tensor tail before Sections 17–22 construct the direct route.
  Its pointwise scalar and boundary identities come from Section 10, its axial estimate from Theorem 61,
  and its enclosure input from Proposition 39. The maximal part supplies its own strict approximation,
  noncompact drift bounds, scalar solve, reflected boundary checks and final flux estimate.

== 2 A boundary deformation in three dimensions <n3:intro:section>

The aim of this part is to replace an initial-data exterior by a Riemannian exterior while keeping a genuine inner
  boundary. Three quantities have to be controlled together:
  scalar curvature, the area of every enclosing cut, and the ADM energy.
  The inner boundary creates a flux term in the energy balance.
  We choose its geometry and the boundary conditions so that this term is absorbed by a positive bulk integral.

=== 2.1 Initial data, normals, and enclosing area <initial-data-normals-and-enclosing-area>

We work in three spatial dimensions, with zero cosmological constant and $G = c = 1$.
  For a Riemannian metric $g$ and a symmetric covariant two-tensor $K$, define the constraint densities by

#[#set math.equation(numbering: n => "(2.1)")
 $ 16 pi mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide 8 pi J =
   "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] . $ <n3:intro:constraints>]

Here $J$ is a covector field. The dominant energy condition is

#[#set math.equation(numbering: n => "(2.2)")
 $ mu gt.eq \| J \|_g . $ <n3:intro:dec>]

All initial data considered here are smooth, including at a compact boundary when one is present.

On an asymptotically flat end with Euclidean coordinates $x$ and $r = \| x \|$, our basic assumptions are

#[#set math.equation(numbering: n => "(2.3)")
 $ g_(i j) - delta_(i j) = O_2 \( r^(- q) \) \, wide K_(i j) = O_1 \( r^(- 1 - q) \) \, wide q > 1 /
   2 . $ <n3:intro:decay>]

The notation $O_j \( r^(- a) \)$ includes the corresponding coordinate derivative bounds through order $j$.
  We assume that $mu$ and $\| J \|_g$ are integrable and that the following ADM limits exist and are finite:

#[#set math.equation(numbering: n => "(2.4)")
 $ E & = frac(1, 16 pi) lim_(r arrow.r oo) integral_(S_r) \( partial_j g_(i j) - partial_i g_(j j) \) n^i thin
   upright(d) A_delta \,\
P_i & = frac(1, 8 pi) lim_(r arrow.r oo) integral_(S_r) #scale(x: 120%, y: 120%)[\(] K_(i j) - \( "tr"_g K \)
  g_(i j) #scale(x: 120%, y: 120%)[\)] n^j thin upright(d) A_delta . $ <n3:intro:energy>]

The normal and area form in these definitions are Euclidean. Whenever $E > \| P \|_delta$, write

#[#set math.equation(numbering: n => "(2.5)")
 $ m = sqrt(E^2 - \| P \|_delta^2) . $ <n3:intro:rest-mass>]

For a two-sided surface $Sigma$ with specified unit normal $nu$, we use

$ H_Sigma = "div"_Sigma nu \, wide theta_(+) \( Sigma \) = H_Sigma + "tr"_Sigma K . $

Thus Euclidean spheres have positive mean curvature for the normal toward infinity.
  A future marginally outer trapped surface, abbreviated MOTS, satisfies $theta_(+) = 0$.
  A weakly future outer trapped surface satisfies $theta_(+) lt.eq 0$. Our spacetime sign convention is

#[#set math.equation(numbering: n => "(2.6)")
 $ K \( Y \, Z \) = upright(bold(g)) \( upright(bold(nabla))_Y n \, Z \) \, $ <n3:intro:k-sign>]

where $n$ is the future unit timelike normal. Equivalently,
  in Gaussian normal coordinates the spatial metric has normal derivative $2 K$.

#prodef([Definition 2.1.])[
  (Exterior and enclosing area).  An exterior is a connected orientable smooth three-manifold $Omega$ with
    nonempty compact smooth boundary, complete as a metric space with its boundary included,
    and with one asymptotically flat coordinate end whose complement is compact.
    An enclosing cut is the entire compact smooth embedded two-sided intrinsic boundary of a connected smooth
    end-containing domain $D$ closed in $overline(Omega)$, whose intrinsic interior lies in $"int" Omega$.
    It separates the entire inner boundary from the distant end.
    The inner side includes the original obstacle and every bounded complementary pocket.
    All components of the cut and every portion coincident with the inner boundary are counted.
    Its normal points into $D$, toward the end. We put
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
  intermediate trapped boundary need be connected. The smooth-cut and full-perimeter formulations have the same
  infimum; we use the independent full-enclosure geometry of #cite(label("RiemannianCompanion")) Lemma 2.1.

=== 2.2 Prepared data and the geometric output <prepared-data-and-the-geometric-output>

The construction itself starts from the following explicit geometric conditions.
  Its hypotheses do not require that the data have been obtained by a particular end-replacement procedure.

#prodef([Definition 2.2.])[
  (Prepared three-dimensional data).  Let $\( Omega_0 \, g \, K \)$ be an exterior in Definition 1,
    with inner boundary $S_0$. Suppose $K$ is compactly supported and, on its single coordinate end, $g - delta =
    O_j \( r^(- 1) \)$ for every fixed $j gt.eq 0$. Assume the physical constraint densities in Equation (2.1) are
    integrable, the ADM energy is $E > 0$, and the ADM momentum is zero.
    There are $0 < delta < 1$, $c > 0$, and a smooth radius extension $𝜚 gt.eq 1$,
    equal to $r$ sufficiently far out, such that
  $ R_g = O \( r^(- 3 - delta) \) \, wide 8 pi \( mu - \| J \|_g \) gt.eq c 𝜚^(- 3 - delta) . $
  The boundary is strictly future trapped with its normal into the exterior:
    $theta_(+) \( S_0 \) < 0$ on every component. Its full enclosing-area infimum is denoted by $A_(*) =
    a_g \( S_0 \) > 0$.
] <n3:prepared:data>

#thm([Theorem 2.3.])[
  (Three-dimensional boundary deformation).  #emph[For every prepared exterior $\( Omega_0 \, g \, K \)$ there is
    a connected one-ended subexterior $Omega subset Omega_0$ whose smooth compact boundary $B$ separates $S_0$
    from infinity, with the following property. For each sufficiently small fixed $epsilon.alt >
    0$ and every sufficiently large integer $N$, there is a smooth metric $hat(g)_(epsilon.alt \, N)$ on
    $overline(Omega)$, complete with its boundary included, for which
#[#set math.equation(numbering: n => "(2.7)")
 $ R_(hat(g)_(epsilon.alt \, N)) & gt.eq 0 \, & H_(partial Omega) \( hat(g)_(epsilon.alt \, N) \) & < 0 \,\
hat(g)_(epsilon.alt \, N) & gt.eq e^(- 4 epsilon.alt) g \, & E_(hat(g)_(epsilon.alt \, N)) & lt.eq E +
  eta_(epsilon.alt \, N) \, $ <n3:prepared:curvature>]

 where the boundary normal points into $Omega$ and, at fixed $epsilon.alt$, $eta_(epsilon.alt \, N) arrow.r 0$.
   More precisely, for constants $C \, a$ depending on the fixed data and $epsilon.alt$,
$ 0 lt.eq eta_(epsilon.alt \, N) lt.eq C \( 1 + N \)^a #scale(x: 120%, y: 120%)[\(] e^(- epsilon.alt N) +
  e^(- epsilon.alt N \/ 2) #scale(x: 120%, y: 120%)[\)] . $

 The new end has $hat(g)_(epsilon.alt \, N) - delta = O_2 \( r^(- 1) \)$ and $R_(hat(g)_(epsilon.alt \, N)) =
   O \( r^(- 3 - delta') \)$ for some $delta' > 0$. Every full enclosing cut $T$ in $Omega$ satisfies
$ \| T \|_(hat(g)_(epsilon.alt \, N)) gt.eq e^(- 4 epsilon.alt) A_(*) . $

]
] <n3:prepared:output>

The construction begins by selecting maximal black and white trapped regions.
  Their outer collars prescribe opposite signs for the graph slope,
  but the same negative mean-curvature condition for the final metric.
  Section 3 proves the required geometry, including the passage from weak supports to smooth enclosures.
  Section 4 specifies the trace and divergence equations and excludes a lower conformal barrier.
  The estimates of Section 5 then control the solutions before uniform ellipticity is available.
  Section 6 supplies the boundary solve and degree argument.
  Finally, Section 7 computes the end charge and proves Theorem 3.

The algebraic inputs from #cite(label("NumericalCompanion")) Propositions 4.1–4.2 and Lemma 4.3 are its scalar
  identity, weighted coercivity, and the pointwise algebraic clause of its floor lemma.
  Their proofs are independent of its numerical conclusion.
  The boundary construction here retains the signed-collar estimates, boundary flux, homotopy,
  and degree that a filled construction does not require.

=== 2.3 Consequence for weakly decaying original data <consequence-for-weakly-decaying-original-data>

#thm([Theorem 2.4.])[
  (Minimum-enclosing-area inequality).  #emph[Let $\( Omega \, g \, K \)$ be an exterior as in Definition 1.
    Assume Equations (2.1)–(2.3), integrability of $mu$ and $\| J \|_g$, and the finite ADM limits (2.4)–(2.4).
    Orient $partial Omega$ by the normal into $Omega$, and suppose $theta_(+) \( partial Omega \) lt.eq 0$.
    If $E > \| P \|_delta$, then
#[#set math.equation(numbering: n => "(2.8)")
 $ sqrt(E^2 - \| P \|_delta^2) gt.eq sqrt(frac(a_g \( partial Omega \), 16 pi)) . $ <n3:intro:penrose>]

 No extension of the data across $partial Omega$ is required.]
] <n3:intro:exterior-inequality>

The last assertion will follow from the boundary construction and the weak three-dimensional preparation theorem
  of #cite(label("NumericalCompanion")) Proposition 7.13. That preparation supplies compact tensor support,
  strict trapping and the weighted margin in Definition 2; its energies converge to $sqrt(E^2 - \| P \|^2)$ and
  its full enclosing areas converge to the original infimum.
  We will use only this preparation theorem, not the companion’s numerical inequality.
  In particular, the ADM normalizations in Equations (2.4) and (2.4) remain unchanged.

== 3 Trapped domains, collars, and weak supports <n3:domains:section>

We need a boundary on which the graph height can be constant and its slope has a definite sign.
  A future trapped face supplies one sign; a past trapped face supplies the other.
  We first choose maximal regions of these two types, then construct outward collars and compatible height
  offsets. The original obstacle stays on their excluded side,
  so every resulting enclosing cut still controls its full area. Throughout, the data satisfy Definition 2.
  Write $S_0$ for their inner boundary. Thus $S_0$ is strictly future outer trapped, $K$ has compact support,
  and the single end has the all-order $O \( r^(- 1) \)$ bounds stipulated in that definition.
  In particular, sufficiently large coordinate spheres have positive outward mean curvature. The function

#[#set math.equation(numbering: n => "(3.1)")
 $ frak(m) \( x \) = 8 pi #scale(x: 120%, y: 120%)[\(] mu \( x \) - \| J \( x \) \|_g #scale(x: 120%, y: 120%)[\)]
   $ <n3:domains:margin>]

is positive, has a positive lower bound on every compact set,
  and has the positive $r^(- 3 - delta)$ lower bound on the end, with $0 < delta < 1$.
  Let $A_(*)$ denote the prepared data’s filled enclosing perimeter infimum.

=== 3.1 The bounding-region convention <the-bounding-region-convention>

For a symmetric tensor $Q$ and a two-sided surface $Sigma$ with a specified unit normal $nu$, put

#[#set math.equation(numbering: n => "(3.2)")
 $ Theta_Q \( Sigma \, nu \) = H_Sigma \( nu \) + "tr"_Sigma Q . $ <n3:domains:expansion>]

For the boundary of a domain the specified normal always points #emph[out of that domain].
  Notice both elementary identities

#[#set math.equation(numbering: n => "(3.3)")
 $ Theta_(Q - \( c \/ 2 \) g) = Theta_Q - c \, wide Theta_(- Q) \( Sigma \, - nu \) = -
   Theta_Q \( Sigma \, nu \) . $ <n3:domains:shift-reversal>]

The factor $1 \/ 2$ in the first formula is the reciprocal of the surface dimension.

We use the following geometric theorem. Its boundary parts may be disconnected.

#thm([Theorem 3.1.])[
  (MOTS barriers and the total trapped region).  #emph[Let $\( N \, g \, Q \)$ be a smooth compact
    three-dimensional initial data set with boundary $Gamma_(-) union.sq Gamma_(+)$.
    Assume $Gamma_(+)$ is nonempty and has positive expansion with its normal out of $N$.
    The inner part $Gamma_(-)$ may be empty; when it is present,
    assume its expansion is negative with its normal into $N$.]
  #emph[Consider all smooth domains whose inner boundary is $Gamma_(-)$ and whose remaining boundary $Sigma$ lies
    in the interior of $N$ and satisfies $Theta_Q \( Sigma \) lt.eq 0$.
    They avoid $Gamma_(+)$, and their normal on $Sigma$ points out of the domain.
    If their union is nonempty, its closure has a smooth compact embedded stable MOTS frontier in the interior,
    separating it from $Gamma_(+)$. This closure is itself the closure of such a domain and contains every domain
    in the defining class. If $Gamma_(-)$ is nonempty, the two strict barriers also give a nonempty smooth
    embedded enclosing MOTS.]
] <n3:domains:region-theorem>

The total-region assertion is #cite(label("AnderssonMetzger2009")) Definitions 7.1–7.2 and Theorem 7.3;
  the barrier assertion is Theorem 3.1 there, with stability furnished by Theorem 4.1.
  The preliminary conventions in Section 2 of that paper allow an empty inner boundary.
  That paper uses open regions; taking their closures preserves the smooth frontier and its expansion,
  giving the closed-region formulation above. These results require no energy condition on $Q$.
  We therefore apply them to the shifted tensors in Equation (3.3),
  even though these tensors need not satisfy the dominant energy condition.
  A component of the complement of a smooth trapped domain which meets no designated outer boundary may be filled:
  its entire boundary is then deleted and the remaining boundary has the same expansion.
  The maximal region is therefore filled in this relative sense.

We use compact inner fillings only to express enclosing competitors.
  One may attach a smooth collar behind $S_0$, extend the one-sided metric smoothly,
  and complete the inner side by a fixed compact filling. All competitors contain that filling and only their
  boundaries in the original exterior are counted. This introduces no geometric condition behind $S_0$.
  For perimeter minimization with this smooth obstacle, the relevant regularity input is
  #cite(label("HuiskenIlmanen2001")) Regularity Theorem 1.3(iii):
  the minimizing boundary is $C^(1 \, 1)$ and is smooth away from contact.
  We retain the filled enclosing class and its smooth approximation from the independent enclosure geometry
  of #cite(label("RiemannianCompanion")) Lemmas 2.1–2.2. The trapped regions below are not assumed to minimize
  perimeter.

=== 3.2 Choosing the two maximal regions <choosing-the-two-maximal-regions>

Fix a large sphere $S_(R_0)$ outside $"supp" K$ such that all coordinate spheres with radius at least $R_0$ have
  positive outward mean curvature. A compact smooth domain with $Theta_(plus.minus K) lt.eq c lt.eq
  0$ cannot reach this part of the end. Indeed, at a point where its boundary maximizes the coordinate radius,
  it lies inside the tangent coordinate sphere and has the same outward normal.
  The graph second-derivative comparison gives $H_(partial D) gt.eq H_(S_r) > 0$ there; also $K = 0$ there.
  This contradicts its assumed expansion. The same argument applies to an enclosing domain with prescribed inner
  obstacle, since the maximum radius is attained on its free boundary.
  Consequently all the negative-threshold regions used below lie in one fixed compact radial range.
  They may be constructed using any sufficiently distant sphere as the outer barrier, without dependence on that choice.

For

#[#set math.equation(numbering: n => "(3.4)")
 $ max_(S_0) Theta_K \( S_0 \) < c < 0 \, $ <n3:domains:black-interval>]

let $cal(B)_c$ be the closed total trapped region for the condition $Theta_K lt.eq c$,
  with $S_0$ as the required inner boundary and with its inner filling understood. It is nonempty:
  a sufficiently short outward collar of $S_0$ supplies a strict seed.
  Theorem 5, applied to $K - \( c \/ 2 \) g$, gives its smooth stable frontier with expansion exactly $c$.
  The regions $cal(B)_c$ increase with $c$. Their complement toward the end has no bounded component,
  since such a component could be filled to enlarge the total trapped region.

We will choose $c_b < 0$ close to zero and set $cal(B) = cal(B)_(c_b)$.
  In the complement of $cal(B)$, use the full black frontier and a distant coordinate sphere as #emph[outer]
  barrier faces. With the normal out of this complement, the black frontier has expansion for $- K$ equal to $-
  c_b > 0$. For $c < 0$ close to zero, let $cal(W)_c$ be the closed total trapped region of compact smooth domains
  in that complement with

#[#set math.equation(numbering: n => "(3.5)")
 $ Theta_(- K) = H - "tr"_Sigma K lt.eq c . $ <n3:domains:white-condition>]

There is no required inner boundary in this application of Theorem 5.
  The shifted expansion of a reversed black face is $- c_b - c > 0$,
  and that of a distant sphere is also positive. Thus the theorem applies whenever the defining union is nonempty.
  When the union is empty we simply put $cal(W)_c = diameter$.
  When nonempty, it has smooth stable frontier of white expansion $c$ and lies a positive distance from all black
  faces. The family $cal(W)_c$ is increasing, with the black region held fixed.

To control limits of the deformation, we choose thresholds at which these regions are right-continuous.
  The following lemma includes empty regions.

#thm([Lemma 3.2.])[
  (Right-continuous thresholds).  #emph[Let $E_c$, $c$ in an interval,
    be an increasing family of closed subsets of a fixed compact metric space. Outside a countable set of parameters,
#[#set math.equation(numbering: n => "(3.6)")
 $ E_(c_j) arrow.r E_c quad upright("in Hausdorff distance whenever") quad
   c_j arrow.b c . $ <n3:domains:hausdorff-right>]

 Here continuity at $E_c = diameter$ means that $E_(c')$ is empty for every sufficiently close $c' > c$.]
] <n3:domains:right-continuity>

#proof[
  Choose a countable dense set ${ x_i }$ and a number $L$ larger than the diameter of the compact space.
    Set $d_c \( x \) = min { L \, "dist" \( x \, E_c \) }$, with the value $L$ when $E_c$ is empty.
    For each $i$, $c mapsto d_c \( x_i \)$ is a bounded nonincreasing real function,
    so its right discontinuities form a countable set. Avoid their countable union.
    Then $d_(c_j) \( x_i \) arrow.r d_c \( x_i \)$ for all $i$ whenever $c_j arrow.b c$.
    Every $d_c$ is $1$-Lipschitz. A finite net chosen from the dense set therefore upgrades this convergence to
    uniform convergence on the compact space.
  For nonempty $E_c$, if points $y_j in E_(c_j)$ stayed a fixed distance from $E_c$,
    uniform convergence evaluated at $y_j$ would contradict $d_(c_j) \( y_j \) = 0$.
    The opposite Hausdorff inclusion follows from $E_c subset E_(c_j)$.
    For empty $E_c$, uniform convergence to $L$ is incompatible with any nonempty $E_(c_j)$,
    since its distance function has a zero. This proves the stated convention as well. ◻
]

Choose $c_b$ at such a right-continuity point of the black family,
  then choose $c_w < 0$ at such a point of the white family for this fixed black region.
  Both choices can be made arbitrarily close to zero. Write $cal(W) = cal(W)_(c_w)$,
  and let $Omega$ be the closure of the component of the complement of $cal(B) union
  cal(W)$ which reaches the selected end. Its boundary $B$ is a finite disjoint union of complete components of
  the two smooth frontiers. Write

#[#set math.equation(numbering: n => "(3.7)")
 $ B = B_b union.sq B_w \, wide H = H_B \( nu \) \, wide P_B = "tr"_B K \, $ <n3:domains:faces>]

where $nu$ points into $Omega$. Thus

#[#set math.equation(numbering: n => "(3.8)")
 $ H + P_B = c_b quad upright("on ") B_b \, wide H - P_B = c_w quad upright("on ") B_w . $ <n3:domains:face-expansions>]

The set $B_w$ may be empty, and $B_b$ need not contain every black frontier component:
  a white component may cut a black face off from the end. We retain exactly the boundary of the component that
  reaches infinity. The compact, disjoint frontiers create no intersection corners.

The excluded side of $B$ contains $S_0$ and a collar of it.
  Hence every compact smooth enclosing cut $T$ in $Omega$, with all its components retained,
  is an enclosing competitor for the original filled obstacle after adjoining the discarded regions to its inner
  side. It follows that

#[#set math.equation(numbering: n => "(3.9)")
 $ \| T \|_g gt.eq A_(*) . $ <n3:domains:inherited-area>]

The same conclusion holds for perimeter competitors. This is a statement about inclusion of competitor classes;
  no minimizing property of $B$ is used.

Every enclosing cut now carries the area lower bound $A_(*)$. The next step is local:
  on each retained face we need a smooth outward family whose expansion is strictly larger than its threshold.
  Stability alone allows a zero principal eigenvalue, so that case requires the maximality of the chosen region.

=== 3.3 Outward collars, including zero stability eigenvalue <outward-collars-including-zero-stability-eigenvalue>

#thm([Lemma 3.3.])[
  (Collars of a maximal frontier).  #emph[Let $\( N^d \, g \)$ be smooth, with $d in { 3 \,
    4 }$ and a fixed smooth symmetric tensor $Q$. Let $Sigma$ be a compact connected smooth two-sided hypersurface
    without boundary, forming a component of the frontier of a closed region $D$, with normal pointing out of $D$.
    Assume $Theta_Q \( Sigma \) = c$ and stability for outward variations.
    Assume also local #emph[outward-replacement maximality]: in some collar of $Sigma$ disjoint from the other
    frontier components and all designated barrier faces, no positive outward normal graph can replace $Sigma$,
    leaving $D$ unchanged outside that collar, and have expansion at most $c$ everywhere on the new component.
    There is a smooth foliation $Sigma_s$, $0 lt.eq s < s_0$, of an outward collar, with $Sigma_0 =
    Sigma$ and positive outward normal velocity, such that
#[#set math.equation(numbering: n => "(3.10)")
 $ Theta_Q \( Sigma_s \) > c quad \( 0 < s < s_0 \) \, wide Theta_Q \( Sigma_0 \) = c . $ <n3:domains:collar-expansion>]

 In particular its leaf parameter $s$ is a smooth defining function and $\| nabla
   s \|$ is bounded above and below by positive constants.]
] <n3:domains:stable-collar>

#proof[
  Use normal graphs $Sigma \( v \)$ over $Sigma$ and pull their expansion back to $Sigma$. The map
  $ Phi : C^(2 \, alpha) \( Sigma \) arrow.r C^(0 \, alpha) \( Sigma \) \, wide Phi \( v \) =
    Theta_Q \( Sigma \( v \) \) - c $
  is smooth near zero. Let $nu$ be the outward normal and $upright("II")$ its second fundamental form.
    The normal-variation formulas give the linearization $L = D Phi \( 0 \)$ explicitly as
  $ L v = - Delta_Sigma v + 2 Q \( nu \, "grad"_Sigma v \) +
    #scale(x: 120%, y: 120%)[\(] "tr"_Sigma nabla_nu Q - \| upright("II") \|^2 -
    "Ric" \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] v . $
  The hypersurface dimension is $d - 1$, so $Theta_(Q - c g \/ \( d - 1 \)) = Theta_Q - c$.
    This constant shift has zero derivative under hypersurface variations;
    hence $L$ is also the MOTS stability operator for $Q - c g \/ \( d - 1 \)$, with principal part $-
    Delta_Sigma$. Stability gives a principal eigenvalue $lambda gt.eq
    0$ and a positive smooth eigenfunction $phi$ #cite(label("AnderssonMarsSimon2008")) Proposition 5.1.
    If $lambda > 0$, take $v = s phi$. Smooth dependence gives $Phi \( s phi \) = s lambda phi +
    O \( s^2 \)$ in $C^0$, which is positive for all sufficiently small $s > 0$. The graph velocity is positive as well.
  Suppose $lambda = 0$. The kernel of $L$ is spanned by $phi$,
    and the adjoint kernel is spanned by a positive smooth function $phi^(*)$.
    These are the principal-eigenfunction facts for a scalar elliptic operator on a compact connected closed
    manifold #cite(label("AnderssonMarsSimon2008")) Section 4, Lemma 4.1.
    For example, simplicity of the kernel also follows by writing a kernel element as $v =
    phi w$ and applying the strong maximum principle to the resulting equation for $w$,
    whose zeroth-order term vanishes. Consider the augmented map
  $ cal(G) \( v \, a \) = (Phi \( v \) - a \, med integral_Sigma v thin thin upright(d) A) . $
  Its derivative at $\( 0 \, 0 \)$ is
  #[#set math.equation(numbering: n => "(3.11)")
   $ \( v \, a \) mapsto (L v - a \, med integral_Sigma v thin thin upright(d) A) .
     $ <n3:domains:augmented-linearization>]
  This map is an isomorphism. Indeed, to solve $L v - a = f$ with $integral v = b$,
    the Fredholm compatibility condition uniquely fixes
  $ a = - frac(integral_Sigma phi^(*) f thin thin upright(d) A, integral_Sigma phi^(*) thin thin upright(d) A) . $
  The equation for $v$ then has a solution; adding a multiple of $phi$ imposes its prescribed integral uniquely.
    Elliptic estimates and this one-dimensional normalization give a bounded inverse between the indicated Hölder
    spaces.
  The implicit-function theorem consequently supplies smooth $v \( s \) \,
    a \( s \)$ with $cal(G) \( v \( s \) \, a \( s \) \) = \( 0 \, s \)$.
    Differentiating at zero and pairing with $phi^(*)$ gives $a' \( 0 \) = 0$ and
  $ v' \( 0 \) = frac(phi, integral_Sigma phi thin thin upright(d) A) > 0 . $
  After shortening the interval, all these graphs form an outward foliation and have constant expansion $c +
    a \( s \)$. If $a \( s \) lt.eq 0$ at any positive $s$ in this interval,
    replace only this frontier component by $Sigma \( v \( s \) \)$.
    This graph strictly enlarges $D$ inside the chosen collar,
    leaves every other frontier component and designated barrier fixed,
    and has expansion at most $c$ on the replaced component. This contradicts the assumed local
    outward-replacement maximality. Therefore $a \( s \) > 0$ for every such $s > 0$.
  In either case positive graph velocity and compactness give the asserted bounds on $\| nabla s \|$.
    Smooth elliptic bootstrapping of the graph equation gives smooth leaves in the zero-eigenvalue case. ◻
]

In the present application $d = 3$. The full black and white regions are $cal(B)_(c_b)$ and $cal(W)_(c_w)$,
  with $Q = K$ and $Q = - K$, respectively. Theorem 5 gives their smooth two-sided stable frontiers,
  whose retained components have expansion $c_b$ and $c_w$.
  Total-region maximality verifies the local replacement hypothesis:
  a positive outward replacement with expansion at most the threshold,
  leaving all other frontier components and designated barriers fixed,
  would be an admissible strictly larger trapped region. For white faces the entire replacement lies in the fixed
  black complement. Thus the lemma applies separately to each retained face.
  There are finitely many faces, so choose disjoint collars in $Omega$ and shorten them to have a common positive
  parameter range when convenient. Write $nu_s = nabla s \/ \| nabla s \|$ for their outward leaf normal;
  it agrees with $nu$ at $B$.

=== 3.4 From weak exterior supports to a smooth enclosure <from-weak-exterior-supports-to-a-smooth-enclosure>

The sublevel limits used below need not have smooth frontiers.
  We now show how an expansion bound on their exterior supports produces a smooth enclosure.
  The argument applies to arbitrary closed sets, without positive reach or a curvature bound on the supporting surfaces.

#prodef([Definition 3.4.])[
  Let $\( N^d \, g \)$ be a smooth Riemannian manifold, $d in { 3 \, 4 }$, with a smooth symmetric tensor $Q$.
    Let $D subset N$ be closed, and let $x in partial D$ be an interior point of $N$.
    A smooth exterior support is a smooth function $phi.alt$ near $x$ with $phi.alt \( x \) = 0$,
    $thin upright(d) phi.alt \( x \) eq.not 0$, and $D subset { phi.alt lt.eq 0 }$ locally near $x$.
    Its normal is $n = nabla phi.alt \/ \| nabla phi.alt \|$. Define
  #[#set math.equation(numbering: n => "(3.12)")
   $ cal(E)_Q \[ phi.alt \] \( x \) = frac(\( g^(i j) - n^i n^j \) nabla_i nabla_j phi.alt, \| nabla phi.alt \|) +
     "tr" Q - Q \( n \, n \) . $ <n3:domains:test-expansion>]
  We say $D$ has exterior-support expansion at most $c$ if every such support at every point of its frontier has
    $cal(E)_Q \[ phi.alt \] lt.eq c$.
] <n3:domains:support-definition>

For a smooth domain this is exactly the usual upper bound on its outward expansion:
  at contact an exterior supporting graph has mean curvature at most that of the enclosed smooth graph.
  The definition is unchanged by increasing smooth reparametrizations of $phi.alt$,
  because the additional Hessian term is a multiple of $thin upright(d) phi.alt ⊗ thin upright(d)
  phi.alt$ and has zero tangential trace.

#thm([Lemma 3.5.])[
  (Parallel neighborhoods and additive error).  #emph[Let $\( N^d \, g \, Q \)$ be smooth, with $d in { 3 \, 4 }$.
    Suppose the frontier of a closed set $D$ lies in a fixed compact interior region and has exterior-support
    expansion at most $c$. Put $D_z = { y : "dist" \( y \, D \) lt.eq z }$.
    For sufficiently small $z > 0$, all exterior supports of $D_z$ have expansion at most
#[#set math.equation(numbering: n => "(3.13)")
 $ c + C z . $ <n3:domains:parallel-estimate>]

 The allowable radius and $C$ depend only on the compact ambient geometry and $Q$, and not on the support,
   its second fundamental form, or the regularity of $D$.]
] <n3:domains:parallel-support>

#proof[
  If $D = diameter$, use $"dist" \( y \, D \) = + oo$; then $D_z = diameter$ and the assertion is vacuous.
    Otherwise, take a support $phi.alt$ to $D_z$ at $x'$. Since $x' in partial D_z$, its distance from $D$ is $z$.
    For sufficiently small radii the relevant distance neighborhood of $partial
    D$ lies in a fixed compact interior neighborhood. There is therefore a nearest point $x in
    D$ and a length-$z$ minimizing unit-speed geodesic $gamma : \[ 0 \, z \] arrow.r N$ from $x$ to $x'$.
    This nearest point lies on $partial D$: if it were interior to $D$,
    moving a short distance along $gamma$ toward $x'$ would decrease the distance.
    The entire segment lies in the fixed smooth compact neighborhood and is shorter than its injectivity radius.
    The ball $overline(B)_z \( x \)$ is contained in $D_z$ and touches its exterior support at $x'$.
    Its tangent plane there therefore agrees with that of the support and
  #[#set math.equation(numbering: n => "(3.14)")
   $ frac(nabla phi.alt \( x' \), \| nabla phi.alt \( x' \) \|) = dot(gamma) \( z \) . $ <n3:domains:radial-normal>]
  Let $P_t : T_x N arrow.r T_(gamma \( t \)) N$ denote parallel transport and put $P = P_z$.
  For every $X in T_x N$ solve the Jacobi boundary problem
  #[#set math.equation(numbering: n => "(3.15)")
   $ J''_X + "Rm" \( J_X \, dot(gamma) \) dot(gamma) = 0 \, wide J_X \( 0 \) = X \, wide J_X \( z \) =
     P X . $ <n3:domains:jacobi-endpoints>]
  Here primes denote covariant differentiation along $gamma$.
    The short interval and absence of conjugate points make this problem uniquely solvable.
    Its estimates can be seen without division by an uncontrolled quantity.
    In a parallel frame write $j_X \( t \) = P_t^(- 1) J_X \( t \)$ and $cal(R) \( t \)$ for the curvature
    coefficient. The integral equation is
  $ j_X \( t \) = X + t A_X - integral_0^t \( t - s \) cal(R) \( s \) j_X \( s \) thin thin upright(d) s \, wide
    A_X = 1 / z integral_0^z \( z - s \) cal(R) \( s \) j_X \( s \) thin thin upright(d) s . $
  It implies, by absorption for small $z$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ sup_(0 lt.eq t lt.eq z) \| j_X \( t \) \| & lt.eq 2 \| X \| \, wide \| A_X \| lt.eq C z \| X \| \,\
sup_(0 lt.eq t lt.eq z) \| j_X \( t \) - X \| & lt.eq C z^2 \| X \| . $ <n3:domains:jacobi-estimates>]
  The second line follows from the same integral equation and the first-line bounds.
    Also $chevron.l J_X \, dot(gamma) chevron.r$ is affine in $t$ and has equal endpoint values.
    Thus $chevron.l A_X \, dot(gamma) \( 0 \) chevron.r = 0$.
  We may therefore prescribe the first jet of a smooth unit vector field $V$ near $x$ by
  $ V \( x \) = dot(gamma) \( 0 \) \, wide nabla_X V \( x \) = A_X . $
  To realize it with uniform second-jet bounds, choose a smooth local orthonormal frame obtained by radial
    parallel transport from $x$. In that frame take the affine coefficient vector with the prescribed value and
    first derivatives, and normalize its length. The orthogonality just proved means normalization preserves its
    prescribed first derivatives. The frame has uniformly bounded derivatives on a fixed small coordinate ball,
    and Equation (3.16) therefore gives uniformly bounded second derivatives of $V$.
    This construction uses the radial direction and the ambient geometry, with no derivatives of the support $phi.alt$.
  Define the local endpoint map
  $ F_z \( y \) = exp_y #scale(x: 120%, y: 120%)[\(] z V \( y \) #scale(x: 120%, y: 120%)[\)] . $
  Its differential at $x$ is the terminal value of the Jacobi field with initial values $X \, nabla_X V \( x \)$.
    By Equation (3.15), it has the exact property
  #[#set math.equation(numbering: n => "(3.17)")
   $ F_z \( x \) = x' \, wide \( thin upright(d) F_z \)_x = P \,
     wide \| \( nabla thin upright(d) F_z \)_x \| lt.eq C z . $ <n3:domains:exact-endpoint-isometry>]
  The last bound follows by differentiating the smooth map $\( y \, v \, z \) mapsto
    exp_y \( z v \)$ twice in $y$, including the first and second derivatives of $V$.
    At $z = 0$ the map is the identity and its covariant second derivative vanishes.
    Its $z$-derivative is uniformly bounded for the bounded jets just constructed,
    giving the displayed $C z$ bound. The exact middle identity, rather than a near-isometry estimate, is essential.
  The map $F_z$ takes $D$ locally into $D_z$, since its defining geodesic from any $y in D$ has length $z$.
    Consequently $psi = phi.alt compose F_z$ is an exterior support to $D$ at $x$.
    Its derivative is $P^(*) thin upright(d) phi.alt$, so its gradient length is exactly $\| nabla
    phi.alt \( x' \) \|$ and, by Equation (3.14), its normal is $dot(gamma) \( 0 \)$. The covariant chain rule gives
  $ "Hess" psi \( X \, Y \) = "Hess" phi.alt \( P X \, P Y \) +
    thin upright(d) phi.alt #scale(x: 120%, y: 120%)[\(] \( nabla thin upright(d) F_z \) \( X \, Y \)
    #scale(x: 120%, y: 120%)[\)] quad upright("at ") x . $
  Trace over an orthonormal basis of $dot(gamma) \( 0 \)^perp$ and divide by the common gradient length.
    The first term is exactly the corresponding normalized tangential trace at $x'$,
    and the remaining term has absolute value at most $C z$. Finally, the tensor trace changes by at most $C z$,
    by the $C^1$ bound on $Q$ and parallel transport. It follows that
  $ \| cal(E)_Q \[ psi \] \( x \) - cal(E)_Q \[ phi.alt \] \( x' \) #scale(x: 120%, y: 120%)[\|] lt.eq C z . $
  The assumed support inequality at $x$ proves Equation (3.13). There is no term containing $z \| "Hess" phi.alt \|$. ◻
]

#thm([Lemma 3.6.])[
  (A smooth enclosure from weak supports).  #emph[Let $N$ be a smooth compact connected three-manifold with
    boundary $Gamma_(-) union.sq Gamma_(+)$, where $Gamma_(+)$ is nonempty and $Gamma_(-)$ may be empty.
    Let $D$ be a nonempty closed subset which contains a relative collar of $Gamma_(-)$ when that boundary is
    prescribed, and stays a positive distance from $Gamma_(+)$.
    Suppose its interior frontier has exterior-support expansion at most $c$ for a smooth tensor $Q$.]
  #emph[For every $c' > c$ such that $Theta_Q \( Gamma_(+) \) > c'$ with its normal out of $N$,
    there is a smooth bounding domain $E$ containing $D$ in its relative interior,
    containing the required inner collar, and avoiding $Gamma_(+)$, whose free boundary satisfies
#[#set math.equation(numbering: n => "(3.18)")
 $ Theta_Q \( partial E \\ Gamma_(-) \) = c' . $ <n3:domains:smooth-enclosure-expansion>]

 Its boundary and the domain may be disconnected. In particular $D$ is contained in the closed total trapped
   region at any such larger threshold. No regularity or positive-thickness assumption on $D$ is required.]
] <n3:domains:weak-support>

#proof[
  All distance neighborhoods in this proof are relative to $N$.
    Since $D$ contains a collar of $Gamma_(-)$ and avoids $Gamma_(+)$, their new frontiers,
    at sufficiently small radii, lie in a compact subset of the interior.
    A minimizing segment ending on a new frontier has its nearest point on the interior frontier of $D$;
    it cannot start on $Gamma_(-)$ because its covered collar has fixed positive width.
    Thus the proof of Lemma 9 applies unchanged. Choose $beta > 0$ so small that its conclusion holds for $0 < z
    lt.eq beta$, all these frontiers avoid the prescribed boundary, and
  #[#set math.equation(numbering: n => "(3.19)")
   $ c + C beta < c' . $ <n3:domains:band-gap>]
  We first construct a smooth inner enclosure without imposing any expansion bound on it.
    Smoothly approximate the continuous distance function $d_D = "dist" \( dot.op \, D \)$ on $N$ uniformly,
    with error less than $beta \/ 32$, using a finite coordinate cover, mollification, and a partition of unity.
    Choose a regular value in $\( beta \/ 3 \, beta \/ 2 \)$ of the resulting smooth function.
    Its sublevel set $U$ has smooth interior boundary and, for example, satisfies
  #[#set math.equation(numbering: n => "(3.20)")
   $ D_(beta \/ 4) subset U subset D_(3 beta \/ 4) . $ <n3:domains:initial-smooth-neighborhood>]
  The boundary $Gamma_(-)$ is contained in its relative interior and $Gamma_(+)$ is excluded.
    If a component of $N \\ overline(U)$ meets no component of $Gamma_(+)$, fill it.
    This only deletes components of the smooth free boundary.
    After this filling the second inclusion in Equation (3.20) need not hold for its interior,
    but every remaining free boundary component still lies in the indicated thin neighborhood,
    and the first inclusion still holds.
  Choose $eta in C^oo \( N \)$, $0 lt.eq eta lt.eq 1$, equal to one on that free boundary and supported in ${
    d_D < beta }$. Its existence uses the positive separation between this compact smooth boundary and the closed
    set ${ d_D gt.eq beta }$; it requires no smoothness of $d_D$.
    For a sufficiently large finite constant $A$, the tensor
  #[#set math.equation(numbering: n => "(3.21)")
   $ Q_A = Q - 1 / 2 \( c' + A eta \) g $ <n3:domains:modified-tensor>]
  makes the free boundary of $U$ a strictly negative inner barrier:
  $ Theta_(Q_A) \( partial U \) = Theta_Q \( partial U \) - c' - A < 0 . $
  All prescribed outer faces remain strictly positive for $Q_A$, because $eta =
    0$ there and their original expansion exceeds $c'$. Apply the barrier part of Theorem 5 on each component of
    $N \\ overline(U)$. Each meets $Gamma_(+)$ by the filling step and has nonempty inner boundary by
    connectedness of $N$ and $U eq.not diameter$. We obtain smooth MOTSs $Sigma$ bounding a domain $E$ which
    contains $overline(U)$ and avoids $Gamma_(+)$. They satisfy, with their normal out of $E$,
  #[#set math.equation(numbering: n => "(3.22)")
   $ Theta_Q \( Sigma \) = c' + A eta gt.eq c' . $ <n3:domains:modified-mots-expansion>]
  We claim $Sigma$ misses ${ d_D < beta }$. Otherwise set $z = min_Sigma d_D < beta$.
    The first inclusion in Equation (3.20) gives $z gt.eq beta \/ 4 > 0$.
    Moreover $D_z$ lies on the inner side of $Sigma$. To see this directly, if $d_D \( y \) < z$,
    a shortest path from $y$ to $D$ of length less than $z$ cannot cross $Sigma$:
    such a crossing would have distance from $D$ less than $z$.
    Since $D subset E$, the whole path and $y$ lie in $E$. Closure gives $D_z subset overline(E)$.
  At a point attaining the minimum, a defining function for the smooth boundary $Sigma$ is therefore an exterior
    support to $D_z$, with the same outward normal as in Equation (3.22).
    The parallel support bound and Equation (3.19) imply
  $ Theta_Q \( Sigma \) lt.eq c + C z < c' \, $
  contradicting Equation (3.22). This excludes the entire modification range, so $eta =
    0$ on $Sigma$ and proves Equation (3.18). The contained $D_(beta \/ 4)$ gives strict enclosure of $D$.
    If desired, fill any remaining complementary components which meet no designated outer face;
    this deletes smooth boundary components and preserves all stated properties. ◻
]

For an exterior, truncate by a distant sphere that is strict at the larger threshold.
  In the black construction, $cal(B)$ already contains the original inner collar.
  In the white construction there is no required inner boundary, and the black faces belong to $Gamma_(+)$.
  The later applications therefore need compact avoidance of the foreign faces;
  they need no boundary regularity of the weak set. Empty weak sets can be omitted.

The support argument has supplied the geometric compactness needed for the later height estimate.
  We can now fix the small offsets in the trace equation. Their size is measured against the strict constraint
  margin, while their normal derivatives distinguish the two boundary signs.

=== 3.5 Small offsets and the prepared domain <small-offsets-and-the-prepared-domain>

#thm([Proposition 3.7.])[
  (Prepared domain).  #emph[The thresholds and the domain above can be chosen with the following properties.
    The numbers $c_b \, c_w < 0$ are right-continuity points of their respective full maximal-region families.
    The boundary of $Omega$ consists of the faces in Equation (3.8),
    has disjoint smooth outward leaf collars as in Lemma 7, and preserves the enclosing-area lower bound in
    Equation (3.9).]
  #emph[There are a smooth compactly supported function $C$ on $Omega$, constants $C_b gt.eq 0$, $C_w lt.eq 0$,
    and positive constants $k_B$ on its face collars such that
#[#set math.equation(numbering: n => "(3.23)")
 $ C_w lt.eq C lt.eq C_b \, & wide C = C_b - k_B s &  & upright("in a black collar near ") B_b \,\
 & wide C = C_w + k_B s &  & upright("in a white collar near ") B_w . $ <n3:domains:offset-collars>]

 For an absent type, its corresponding constant is simply a bound. Set
#[#set math.equation(numbering: n => "(3.24)")
 $ b_(-) = c_b - C_b < 0 \, wide b_(+) = - c_w - C_w > 0 . $ <n3:domains:assigned-heights>]

 There is a smooth positive function $rho$, equal to a positive constant times $r^(- 4)$ on the far end and
   satisfying symbol derivative bounds there, such that, for every $h in \[ b_(-) \, b_(+) \]$,
#[#set math.equation(numbering: n => "(3.25)")
 $ \| \( h + C \) "tr" K \| + \| nabla C \| + rho lt.eq 1 / 2 frak(m) quad
   upright("everywhere on ") Omega . $ <n3:domains:offset-smallness>]

 The thresholds, collars, offset, and $rho$ are fixed before the deformation parameters are chosen.
   After fixing the thresholds and collars, the offset and its first derivatives can be made arbitrarily small.]
] <n3:domains:prepared-domain>

#proof[
  The large-sphere comparison above confines all negative-threshold regions to a fixed compact set,
    independently of how close the thresholds are to zero. Choose a slightly larger compact set $cal(K)$
    containing this range and $"supp" K$ in its interior. Let
  $ m_0 = min_(cal(K)) frak(m) > 0 \, wide T_0 = sup_(cal(K)) \| "tr" K \| . $
  First restrict both negative thresholds to an interval so close to zero that
  $ max { \| c_b \| \, \| c_w \| } thin T_0 < m_0 \/ 8 \, $
  while retaining Equation (3.4). Lemma 6 allows the required successive choices in that interval.
    Construct the two regions, select $Omega$, and fix their disjoint collars inside $cal(K)$ as above.
    All ensuing constants may depend on these fixed choices.
  Here is an explicit offset construction. On each collar choose a smooth nonincreasing cutoff $chi \( s \)$,
    equal to one near $s = 0$ and zero near the collar’s far end.
    Choose $kappa_B > 0$ so that $1 - kappa_B s > 0$ throughout that collar.
    For a common amplitude $a > 0$, define the contribution of a black collar to be $a
    chi \( s \) \( 1 - kappa_B s \)$, and that of a white collar to be $- a chi \( s \) \( 1 - kappa_B s \)$.
    Extend by zero outside the disjoint collars and sum. This produces a smooth function on the manifold with
    boundary $Omega$, supported in $cal(K)$, with $C_b = a$, $C_w = - a$, and $k_B =
    a kappa_B$ on the respective collars. These remain valid bounds when a type is absent.
    Its $C^1$ norm tends to zero with $a$, even though the collar widths have already been fixed.
  For $h in \[ b_(-) \, b_(+) \]$ and $C in \[ C_w \, C_b \]$,
  $ \| h + C \| lt.eq max { \| c_b \| \, \| c_w \| } + C_b - C_w . $
  Choose $a$ so small that $\( C_b - C_w \) T_0 + parallel nabla C parallel_oo < m_0 \/ 8$.
    The first two terms of Equation (3.25) are then at most $m_0 \/ 4$ on $cal(K)$ and vanish outside $cal(K)$.
    Finally take a fixed smooth positive weight equal to $r^(- 4)$ far out and multiply it by a sufficiently small
    positive constant. The end lower bound for $frak(m)$ and $delta < 1$, together with compact positivity,
    allow the choice $rho lt.eq frak(m) \/ 4$ everywhere. This proves Equation (3.25).
    All remaining assertions were proved in constructing the regions and collars. ◻
]

At the assigned face heights the quantity $h + C$ consequently has the useful exact values

#[#set math.equation(numbering: n => "(3.26)")
 $ h + C & = c_b = P_B + H &  & upright("on ") B_b upright(" when ") h = b_(-) \,\
h + C & = - c_w = P_B - H &  & upright("on ") B_w upright(" when ") h = b_(+) . $ <n3:domains:compatible-face-values>]

These identities determine the deformation’s boundary signs.
  Right-continuity and Lemma 10 will exclude limiting sublevel sets away from the corresponding full trapped regions.

== 4 The elliptic deformation and exclusion of the floor <n3:deformation:section>

We define the coupled system, derive its scalar-curvature identity,
  and choose a continuation path along which the conformal factor cannot touch its lower bound.
  We use the fixed data of Proposition 11. Thus $Omega$ has one controlled asymptotically flat end,
  $K$ is compactly supported, and its compact boundary $B = B_b union B_w$ consists of black and white faces.
  Either type may be absent. The normal $nu$ points into $Omega$, and

$ H = "div"_B nu \, wide P_B = "tr"_B K . $

The numbers $b_(-) < 0 < b_(+)$, the smooth compactly supported offset $C$, and the positive function $rho =
  O \( r^(- 4) \)$ are fixed as in that proposition. In particular,

#[#set math.equation(numbering: n => "(4.1)")
 $ b_(-) + C = P_B + H med upright("on ") B_b \, wide b_(+) + C = P_B - H med
   upright("on ") B_w . $ <n3:deformation:face-thresholds>]

All compact sets and geometric constants in this section are fixed after this preparation.
  Extend the end radius to a smooth function on $overline(Omega)$ bounded below by one.
  Write $Omega_R$ for the large spherical truncations and $S_R$ for their outer boundary.

A #emph[polynomial constant] is bounded by $C \( 1 + N \)^A$, with $C \,
  A$ depending on the prepared data and fixed auxiliary profiles, but not on $R$, the homotopy parameter,
  or the solution. Constants permitted to depend arbitrarily on fixed $N$ will be identified explicitly.
  First fix $0 < epsilon.alt < 1$, then choose $N$ sufficiently large, and finally require $R gt.eq
  R_min \( N \, epsilon.alt \)$. We always take $N gt.eq 4$ and $N > 2 \/ epsilon.alt$.

=== 4.1 Variables and equations <n3:deformation:variables>

Choose a smooth nonincreasing $theta.alt : bb(R) arrow.r \[ 0 \, 1 \]$ equal to one on $\( - oo \, 0 \]$ and zero
  on $\[ 1 \, oo \)$. Define

#[#set math.equation(numbering: n => "(4.2)")
 $ p \( t \) = N theta.alt \( N t \) \, wide l \( t \) = exp (integral_0^t p \( s \) thin upright(d) s) \,\
L \( t \) = l \( t \) e^(2 t) \, wide p_L = p + 2 . $ <n3:deformation:l-profile>]

Thus $l \( 0 \) = 1$, $l \( t \) = e^(N t)$ for $t lt.eq 0$, and $l$ is constant for $t gt.eq 1 \/ N$.
  Derivatives of $p$ of every fixed order are polynomially bounded. Set

#[#set math.equation(numbering: n => "(4.3)")
 $ ell = e^(- epsilon.alt N) \, wide tau = ell^(3 \/ 2) . $ <n3:deformation:small-parameters>]

Whenever $t gt.eq - epsilon.alt$, one has $ell lt.eq l \( t \) lt.eq e$.

For a function $f$, set

#[#set math.equation(numbering: n => "(4.4)")
 $ sigma = \| nabla f \| \, quad D = 1 + l^2 sigma^2 \, quad d = D^(- 1) \,\
a = l sigma \/ sqrt(D) \, quad v = a^2 = 1 - d \, quad w = l nabla f \/ sqrt(D) \, quad chi = 4 d \/ \( 4 + p v \) \,\
Z = t + 1 / 8 log D \, quad u = L sqrt(D) \, quad U = l sqrt(D) \, quad h = tau f . $ <n3:deformation:basic-variables>]

Derivatives and contractions refer to $g$ unless indicated otherwise.
  At $sigma > 0$, write $e = nabla f \/ sigma$ and $A_j = I + \( j - 1 \) e ⊗ e$.
  The matrices used below have the direction-free expressions

#[#set math.equation(numbering: n => "(4.5)")
 $ A_d = I - w ⊗ w \, wide A_chi = I - frac(p + 4, 4 + p v) w ⊗ w . $ <n3:deformation:axial-matrices>]

Vectors and covectors are identified with $g$.

The unknowns will be $\( f \, Z \)$. For fixed $nabla f$, $partial Z \/ partial t = 1 + p v \/ 4 > 0$,
  and its defining expression tends to $- oo$ and $+ oo$ at the two ends of the $t$-axis.
  It therefore defines a unique smooth $t = t \( Z \, nabla f \)$ for all inputs, without a floor assumption.
  The coefficients $t \, d \, v \, w \, chi \, u \, U$ and the direction-free matrices are smooth at $nabla f =
  0$; occurrences of $sigma$ and $a$ in the equations combine into smooth invariant expressions.
  One has $0 < chi lt.eq d lt.eq 1$ for finite inputs. Define

#[#set math.equation(numbering: n => "(4.6)")
 $ macron(g) = g + l^2 thin upright(d) f^2 \, wide hat(g) = e^(4 t) macron(g) \, wide H^f = l /
   sqrt(D) "Hess" f \, wide S = K + H^f . $ <n3:deformation:metrics>]

The original trace equation is

#[#set math.equation(numbering: n => "(4.7)")
 $ "tr"_(A_chi) S = F \, wide F = h + C \, $ <n3:deformation:trace>]

where $"tr"_A S$ is contraction with the contravariant matrix $A$.
  Along the continuation path we will specify modified right sides $F$. The full flux is

#[#set math.equation(numbering: n => "(4.8)")
 $ V = u A_chi #scale(x: 120%, y: 120%)[\(] 4 nabla Z + K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] .
   $ <n3:deformation:flux>]

Here $f$ is the graph height, while $Z$ combines the conformal variable $t$ with the logarithm of the graph slope.
  The numbers $d$ and $chi$ record ellipticity in the gradient direction, and $u$ weights the divergence flux.
  The scaled height $h = tau f$ makes the prescribed trace strictly increasing in $f$.
  At $S_R$ prescribe $f = Z = 0$. Initially the inner Dirichlet values are $h = b_(-)$ on $B_b$ and $h =
  b_(+)$ on $B_w$.

=== 4.2 The exact scalar-curvature identity <the-exact-scalar-curvature-identity>

The graph-curvature strategy originates in Jang’s equation and the Schoen–Yau positive-energy argument
  #cite(label("Jang1978")) #cite(label("SchoenYau1981")). Its generalized warped-graph form and Penrose coupling
  were developed by Bray and Khuri #cite(label("BrayKhuri2010")) #cite(label("BrayKhuri2011"));
  see in particular Identity 9 of #cite(label("BrayKhuri2011")).
  We use the independently proved algebraic identity of #cite(label("NumericalCompanion")) Proposition 4.1,
  with the normalization below. The prescribed trace $F = h + C$, nonzero source,
  and floor penalty below define a different coupled system;
  the identity does not import global solvability of a zero-divergence coupling.

The next identity separates the original constraint densities, a nonnegative quadratic term, and a divergence.
  The second equation will prescribe that divergence so that the deformed metric has nonnegative scalar curvature.

#thm([Proposition 4.1.])[
  (Deformation identity).  #emph[Let $f \, t$ be smooth and $F = "tr"_(A_chi) \( K + H^f \)$.
    At $sigma > 0$ decompose $S$ relative to $bb(R) e xor e^perp$:
$ T = S \|_(e^perp times e^perp) \, quad M = S \( e \, dot.op \) \|_(e^perp) \, quad q = S \( e \, e \) \, quad
  "tr" T = F - chi q . $

 Then
#[#set math.equation(numbering: n => "(4.9)")
 $ 1 / 2 e^(4 t) "Scal"_(hat(g)) =  & 8 pi \( mu + J \( w \) \) + cal(T) + w \( F \) - F "tr" K -
   u^(- 1) "div" V \, $ <n3:deformation:scalar-identity>]

 where
#[#set math.equation(numbering: n => "(4.10)")
 $ cal(T) =  & 1 / 2 \| T^("tf") \|^2 + \( M + p a nabla_perp t \) dot.op \( M + \( p + 2 \) a nabla_perp t \)\
 & + 4 \( p + 1 \) \| thin upright(d) t \|_(A_d)^2 + \( chi - chi^2 \/ 4 \) q^2 +
   2 \( p + 1 \) chi q a thin partial_e t\
 & - chi F q \/ 2 + 3 F^2 \/ 4 . $ <n3:deformation:quadratic-term>]

 After substituting $F = "tr"_(A_chi) S$, this expression extends smoothly across $sigma = 0$.]
] <n3:deformation:identity>

#proof[
  Apply the scalar identity of #cite(label("NumericalCompanion")) Proposition 4.1 in spatial dimension three,
    so its surface dimension is $k = 2$. To distinguish the two conventions temporarily,
    add a subscript $upright(A)$ to its variables. The exact dictionary is
  #[#set math.equation(numbering: n => "(4.11)")
   $ t_(upright(A)) = 2 t \, quad Z_(upright(A)) = 2 Z \, quad l_(upright(A)) \( s \) = l \( s \/ 2 \) \, quad
     p_(upright(A)) = p \/ 2 \,\
mu_(upright(A)) = 8 pi mu \, wide J_(upright(A)) = 8 pi J \, wide S_(upright(A)) =
  S . $ <n3:deformation:normalization-dictionary>]
  The quantities $D \, d \, w \, a \, v \, H^f \, F \, U$ are identical. In particular,
  $ frac(2 d, 2 + p_(upright(A)) v) = frac(4 d, 4 + p v) = chi \, quad u_(upright(A)) =
    e^(t_(upright(A))) l sqrt(D) = u \, quad 2 nabla Z_(upright(A)) = 4 nabla Z \, $
  and the companion metric $e^(2 t_(upright(A))) macron(g)$ is precisely $hat(g) = e^(4 t) macron(g)$.
    Thus the divergence term, trace prescription and metric match without rescaling their flux.
    The physical density conversion gives $8 pi \( mu + J \( w \) \)$;
    the ADM energy and momentum are not changed by that conversion.
  For the quadratic expression, the companion coefficient $s_p =
    p_(upright(A)) + \( k - 1 \) \/ 2$ is $\( p + 1 \) \/ 2$, and $d t_(upright(A)) = 2 d t$.
    Its transverse square is $\| M + \( p + 1 \) a nabla_perp t \|^2$.
    Combining its residual $- \[ a^2 \| nabla_perp t \|^2 \]$ with that square gives $\( M + p a nabla_perp t \)
    dot.op \( M + \( p + 2 \) a nabla_perp t \)$. The remaining gradient contribution is $4 \( p + 1 \) \| d
    t \|_(A_d)^2$. Its normal terms become
  $ \( chi - chi^2 \/ 4 \) q^2 + 2 \( p + 1 \) chi q a thin partial_e t - chi F q \/ 2 + 3 F^2 \/ 4 . $
  These substitutions give Equations (4.9) and (4.10). Smoothness at zero gradient is part of the invariant
    identity: the temporary axis has not been used to define its coefficients.
    The import is pointwise and requires neither an energy condition nor a solved divergence equation. ◻
]

#thm([Lemma 4.2.])[
  (Polynomial coercivity).  #emph[The weighted coercivity theorem of #cite(label("NumericalCompanion"))
    Proposition 4.2, with Equation (4.11), makes $cal(T)$ nonnegative. For $0 lt.eq p lt.eq N$,
#[#set math.equation(numbering: n => "(4.12)")
 $ \| thin upright(d) t \|_(A_d)^2 + \| T \|^2 + \| M \|^2 + d q^2 + F^2 lt.eq
   C \( 1 + N \)^A cal(T) $ <n3:deformation:coercive-estimate>]

 with universal $C \, A$. At $thin upright(d) t = 0$ there is the stronger comparison, uniform in $p \, d$,
#[#set math.equation(numbering: n => "(4.13)")
 $ c #scale(x: 120%, y: 120%)[\(] \| T^("tf") \|^2 + \| M \|^2 + chi q^2 + F^2 #scale(x: 120%, y: 120%)[\)] lt.eq
   cal(T) lt.eq C #scale(x: 120%, y: 120%)[\(] \| T^("tf") \|^2 + \| M \|^2 + chi q^2 +
   F^2 #scale(x: 120%, y: 120%)[\)] . $ <n3:deformation:floor-norm>]

]
] <n3:deformation:coercivity>

#proof[
  With $x = partial_e t$ and $y = nabla_perp t$, exact completion gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ cal(T) =  & 1 / 2 \| T^("tf") \|^2 + \| M + \( p + 1 \) a y \|^2 + \[ 4 \( p + 1 \) - v \] \| y \|^2\
 & + 4 \( p + 1 \) d (x + frac(chi a q, 4 d))^2\
 & + 3 / 4 (F - frac(chi q, 3))^2 + frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) q^2 . $ <n3:deformation:square-completion>]
  Completing first in $x$ leaves $3 chi q^2 \/ \( 4 + p v \)$;
    completing next in $F$ leaves $3 chi \/ \( 4 + p v \) - chi^2 \/ 12 =
    4 d \( 9 - d \) \/ \[ 3 \( 4 + p v \)^2 \]$. The latter coefficient is at least $32
    d \/ \[ 3 \( 4 + N \)^2 \]$. It controls $d q^2$ polynomially.
    The $F$-square then controls $F^2$, since $chi^2 q^2 lt.eq d q^2$.
    The transverse gradient coefficient is at least three, and the shifted $M$-square controls $M$ with an
    additional factor $\( 1 + N \)^2$. The squared $d$-norm of the shift in the $x$-square is $chi^2 v
    q^2 \/ \( 16 d \) lt.eq d q^2 \/ 16$, so it also controls $d x^2$.
    Finally $\| T \|^2 = \| T^("tf") \|^2 + \( F - chi q \)^2 \/ 2$. This proves (4.12).
    If $thin upright(d) t = 0$, the sole cross term is $- chi F q \/ 2$.
    Using $\| chi F q \| \/ 2 lt.eq chi q^2 \/ 4 + chi F^2 \/ 4$ and $0 < chi lt.eq 1$ proves (4.13). ◻
]

The scalar identity separates curvature from divergence. At the inner boundary we must also relate this divergence
  flux to mean curvature. Differentiating the definition of $Z$ gives, wherever $d f eq.not 0$,

#[#set math.equation(numbering: n => "(4.15)")
 $ 4 thin d t + 1 / 2 thin d log D = 4 thin d Z = \( 4 + p v \) thin d t +
   v thin d log sigma . $ <n3:deformation:Z-differential>]

This relation is smooth in its direction-free form and will be used only in contractions that extend across $d f = 0$.

#thm([Lemma 4.3.])[
  (Boundary identity).  #emph[On a face where $f$ is constant,
#[#set math.equation(numbering: n => "(4.16)")
 $ V_nu \/ u = d \( H + 4 partial_nu t \) - H + w_nu \( F - P_B \) . $ <n3:deformation:boundary>]

 Its mean curvature in $hat(g)$, with normal into $Omega$, is $e^(- 2 t) sqrt(d) thin \( H + 4 partial_nu t \)$.]
] <n3:deformation:boundary-identity>

#proof[
  The tangential Hessian is $"Hess" f \|_(T B) = \( partial_nu f \) "II"_g$.
    Thus $"tr"_perp H^f = w_nu H$ and $chi q = F - P_B - w_nu H$. The normal component of (4.8), using (4.15), is
  $ V_nu \/ u = 4 d partial_nu t + chi w_nu q = 4 d partial_nu t + w_nu \( F - P_B \) - v H . $
  The $macron(g)$-normal is $sqrt(d) thin nu$. Its mean curvature is $sqrt(d) thin H$,
    because the tangential metric is unchanged and its normal first variation is multiplied by $sqrt(d)$.
    The conformal mean-curvature formula gives the asserted mean curvature for $hat(g)$. ◻
]

=== 4.3 The source, boundary condition, and continuation path <the-source-boundary-condition-and-continuation-path>

We now prescribe the divergence and inner flux. For the original system,
  the source is chosen to give the deformed metric nonnegative scalar curvature.
  A penalty near the lower bound will exclude contact with that bound along the continuation path.

Choose $3 \/ 4 < gamma < 1$ and fixed positive smooth weights

$ rho_0 asymp r^(- 4) \, wide rho_1 asymp r^(- 2 gamma) \, $

with differentiated end bounds. Let $m : bb(R) arrow.r \[ 0 \, 1 \]$ be smooth,
  equal to one on $\( - oo \, 0 \]$ and zero on $\[ 1 \, oo \)$, and set

$ m_0 \( t \) = m \( N \( t + epsilon.alt \) \) \, wide cal(P) = C_N \( rho_0 + v rho_1 \) . $

The positive $delta_0$ is fixed independently of $N \, R$ in Proposition 20;
  thereafter $C_N$ is a sufficiently large polynomial constant. Define

#[#set math.equation(numbering: n => "(4.17)")
 $ Xi = delta_0 cal(T) + rho + delta_0 tau a sigma - m_0 \( t \) cal(P) . $ <n3:deformation:source>]

Choose a smooth face function $N_B > 1 + sup_B \| H \|$. The original second equation and its inner condition are

#[#set math.equation(numbering: n => "(4.18)")
 $ "div" V = u Xi \, wide V_nu \/ u = - H + w_nu \( F - P_B \) - N_B d . $ <n3:deformation:original-second-equation>]

Lemma 14 gives $H + 4 partial_nu t = - N_B$. Only $- epsilon.alt lt.eq t lt.eq - epsilon.alt +
  1 \/ N$ is penalized in the admissible range. Since $N > 2 \/ epsilon.alt$, this band has negative $t$, and

#[#set math.equation(numbering: n => "(4.19)")
 $ ell lt.eq l lt.eq e ell \, wide c ell lt.eq L lt.eq C ell quad
   upright("on the admissible penalty band") . $ <n3:deformation:penalty-band>]

The latter constants can be uniform for $0 < epsilon.alt < 1$.

#thm([Proposition 4.4.])[
  (Specified homotopy).  #emph[There is a continuous piecewise smooth family of systems indexed by $s
    in \[ 0 \, 4 \]$, beginning at (4.7), (4.18) and the original Dirichlet values, and ending at $f =
    0$ and the scalar problem with zero source and zero inner conormal flux.
    Throughout its first three stages the source is (4.17), with $cal(T)$ evaluated using the actual trace $F$.
    Each trace equation has right-side derivative at least one in $h$, with $x \, Z \, nabla f$ fixed.]
] <n3:deformation:homotopy>

#proof[
  Fix a smooth $j : bb(R) arrow.r \[ 0 \, 1 \]$ which vanishes for $t lt.eq 0$ and equals one for $t gt.eq 1$.
    For $0 lt.eq lambda lt.eq 1$ put
  $ V_lambda = u A_chi \( 4 nabla Z + lambda K \( w \, dot.op \) \) \, wide cal(B) = - H + w_nu \( F - P_B \) -
    N_B d . $
  Before the last stage use the boundary condition
  #[#set math.equation(numbering: n => "(4.20)")
   $ \( V_lambda \)_nu \/ u =  & \[ 1 - \( 1 - lambda \) j \( t \) \]\
 & dot.op \[ cal(B) - \( 1 - lambda \) \( A_chi K \( w \, dot.op \) \)_nu \] . $ <n3:deformation:homotopy-boundary>]
  Outer values remain $f = Z = 0$ throughout.
  We specify two smooth collar modifications. Let $nu_s = nabla s \/ \| nabla
    s \|$ be the outward unit normal to a collar leaf; the leaf coordinate $s$ here is local and is separate from
    the homotopy parameter. Choose disjoint collar cutoffs equal to one at the faces.
    Take $eta > 0$ so small that $b_(-) + 3 eta < b_(+)$. A black contribution to $D_0 \( x \, w \, h \)$ is a
    negative constant times a collar cutoff, times a smooth directional cutoff supported where $w dot.op nu_s < -
    1 \/ 2$ and equal to one at $- 1$, times a nonincreasing height cutoff equal to one below $b_(-) +
    eta$ and zero above $b_(-) + 2 eta$. A white contribution has positive sign,
    its directional cutoff supported where $w dot.op nu_s > 1 \/ 2$ and equal to one at $1$,
    and a nondecreasing height cutoff equal to zero below $b_(+) - 2 eta$ and one above $b_(+) - eta$.
    Decrease $eta$ to separate these ranges. Their sum $D_0$ is smooth, bounded, supported in the collars,
    and nondecreasing in $h$. It is nonpositive for $h lt.eq b_(-) + eta$, nonnegative for $h gt.eq b_(+) - eta$,
    and vanishes on black outward and white inward directions, for every length $0 lt.eq \| w \| lt.eq 1$.
  Choose the magnitudes larger than $2 sup_B \| H \| + 1$. Equation (4.1) then gives, for $F = h + C +
    D_0$ at the assigned boundary height $b = b_plus.minus$,
  #[#set math.equation(numbering: n => "(4.21)")
   $ F \( x \, + nu \, b \) gt.eq P_B + H \, wide F \( x \, - nu \, b \) lt.eq P_B -
     H . $ <n3:deformation:directional-barriers>]
  These are limiting directional evaluations at $a = 1 \, chi = 0$.
    The compatible direction has equality; $D_0$ corrects the other one.
    Its derivatives on bounded height ranges are independent of $N$.
    Choose a smooth compactly supported extension $b \( x \)$,
    constant equal to $b_plus.minus$ on each smaller collar. On these collars let $D_1 \( x \, w \) =
    A_1 w dot.op nu_s$, extended by a collar cutoff, with $A_1 > sup_B \| H \| + 1$.
    Then $D_1 \( x \, 0 \) = 0$ and $D_1 \( x \, plus.minus nu \) = plus.minus A_1$ on $B$.
  The four stages are the following.
  + For $0 lt.eq s lt.eq 1$, set $lambda = 1 - s$, keep $F = h + C$ and $h \|_B = b$, and use $"div" V_lambda =
    u Xi$ and (4.20).
  + For $1 lt.eq s lt.eq 2$, set $lambda = 0$, $alpha = s - 1$, retain $h \|_B = b$,
    and replace the trace right side by $F = h + C + alpha D_0 \( x \, w \, h \)$.
    Keep the same scalar equation and boundary prescription.
  + For $2 lt.eq s lt.eq 3$, set $lambda = 0$, $zeta = s - 2$, prescribe $h \|_B = \( 1 - zeta \) b$, and use
    #[#set math.equation(numbering: n => "(4.22)")
     $ F =  & h + \( 1 - zeta \) \[ C + D_0 \( x \, w \, h + zeta b \( x \) \) \]\
 & + zeta \[ "tr"_(A_chi) K + D_1 \( x \, w \) \] . $ <n3:deformation:interpolation-trace>]
    Keep the same scalar equation and boundary prescription. At a face, $h + zeta b = b$.
      The value at $w = plus.minus nu$ is the convex combination of the preceding directional value and $P_B +
      D_1 \( x \, plus.minus nu \)$, so (4.21) persists.
  + For $3 lt.eq s lt.eq 4$, retain the trace problem at $zeta =
    1$ and multiply both $Xi$ and the right side of (4.20) by $eta_s = 4 - s$.
  The prescriptions agree at the common endpoints. Their $h$-derivatives are $1$, $1 + alpha partial_h D_0$,
    or $1 + \( 1 - zeta \) partial_h D_0$, all at least one.
  At $zeta = 1$ the trace equation is $"tr"_(A_chi) H^f = h + D_1 \( x \, w \)$ with zero Dirichlet values.
    At a positive interior maximum of $f$, one has $w = 0$, $A_chi = I$, $D_1 = 0$, and $l Delta f = tau f > 0$,
    a contradiction. A negative minimum is excluded in the same way. Thus $f = 0$ and $t = Z$ in the last stage.
    At $s = 4$ the remaining equation is $"div" \( 4 L \( Z \) nabla Z \) = 0$,
    with zero inner conormal flux and $Z = 0$ on $S_R$. Multiplication by $Z$ and integration give $Z = 0$.
    For the fixed-point construction in Section 6, the final linear scalar problem has zero source and zero inner
    flux for every input; consequently that last map has output identically zero. ◻
]

=== 4.4 Elementary height and end barriers <elementary-height-and-end-barriers>

#thm([Lemma 4.5.])[
  (Height control).  #emph[Every smooth trace solution in Proposition 15 satisfies $\| h \| lt.eq C_0$,
    independently of $N \, R$, the homotopy parameter, and the input $Z$.
    Its actual right side satisfies $\| F \| lt.eq C_F$ with the same independence.]
] <n3:deformation:height>

#proof[
  The collar modifications vanish at $w = 0$. At an interior extremum the trace equation reads either $"tr" K +
    l Delta f = h + C$ or $"tr" K + l Delta f = h + \( 1 - zeta \) C + zeta "tr" K$.
    The maximum and minimum inequalities bound $h$ by fixed bounds for $\| "tr" K \| + \| C \|$.
    Boundary values range between $b_(-) \, 0 \, b_(+)$. This proves the height bound without using the floor.
    Boundedness of $D_0 \, D_1$ and $\| "tr"_(A_chi) K \| lt.eq 3 \| K \|$ proves the assertion for $F$. ◻
]

#thm([Lemma 4.6.])[
  (End height and outer boundary).  #emph[There are $r_0 \, C > 0$, independent of $N \,
    R$ and the homotopy parameter, such that for $R gt.eq 2 r_0$,
#[#set math.equation(numbering: n => "(4.23)")
 $ \| h \| lt.eq C \( r^(- gamma) - R^(- gamma) \) quad \( r_0 lt.eq r lt.eq R \) .
   $ <n3:deformation:end-height-estimate>]

 In particular,
#[#set math.equation(numbering: n => "(4.24)")
 $ \| nabla f \| lt.eq C R^(- 1 - gamma) \/ tau quad upright("on ") S_R . $ <n3:deformation:outer-gradient>]

 For fixed $epsilon.alt \, N$, a sufficiently large lower bound for $R$ gives $t > - epsilon.alt$ on $S_R$.]
] <n3:deformation:end-height>

#proof[
  Take $r_0$ outside the supports of $K \, C \, D_0 \, D_1$.
    There $F = h$ in the first three stages, and $h = 0$ in the last one.
    For $psi = r^(- gamma)$, with axis $nabla psi \/ \| nabla psi \|$, the controlled end gives,
    uniformly for $0 < chi lt.eq 1$,
  $ "tr"_(A_chi) "Hess" psi = gamma \( \( gamma + 1 \) chi - 2 \) r^(- gamma - 2) + O \( r^(- gamma - 3) \) < 0 $
  after enlarging $r_0$. At a comparison contact, coefficients use the given $Z$ and the common gradient of test
    and solution. The positive factor $l \/ \( tau sqrt(D) \)$ preserves this sign.
    Height monotonicity therefore makes $C \( psi - R^(- gamma) \)$ an upper barrier and its negative a lower
    barrier. Choose $C$ to dominate $C_0$ on $r = r_0$ for every $R gt.eq 2 r_0$.
    Differentiating at the common outer value gives (4.24); tangential derivatives there vanish.
  At $S_R$, $Z = 0$. The monotonicity of its defining expression implies $t > -
    epsilon.alt$ if $ell^2 \| nabla f \|^2 < e^(8 epsilon.alt) - 1$.
    It suffices to require $C^2 ell^2 tau^(- 2) R^(- 2 - 2 gamma) < e^(8 epsilon.alt) - 1$,
    which is a permissible lower bound depending on fixed $N \, epsilon.alt$. ◻
]

=== 4.5 Exclusion of a contact with the floor <exclusion-of-a-contact-with-the-floor>

We exclude a proposed floor contact using the equations at that point.
  These estimates require neither an upper bound for $Z$ nor a bound for $\| nabla f \|$.

#thm([Lemma 4.7.])[
  (Curvature at a minimum of $t$).  #emph[At an interior point where $thin upright(d) t = 0$ and $"Hess" t gt.eq 0$,
#[#set math.equation(numbering: n => "(4.25)")
 $ 1 / 2 e^(4 t) "Scal"_(hat(g)) lt.eq 1 / 2 "Scal"_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) \,
   $ <n3:deformation:floor-gauss>]

 where, for a symmetric tensor $A$,
#[#set math.equation(numbering: n => "(4.26)")
 $ cal(S) \( A \) =  & 1 / 4 \( "tr"_perp A \)^2 - 1 / 2 \| A_(perp perp)^("tf") \|^2\
 & + d A_(e e) "tr"_perp A - d \| A_(e perp) \|^2 . $ <n3:deformation:gauss-quadratic>]

 There are universal $c_(*) \, eta_(*) > 0$ and polynomial constants $C_N$ such that, at $thin upright(d) t = 0$,
#[#set math.equation(numbering: n => "(4.27)")
 $ cal(T) - cal(S) \( H^f \) gt.eq c_(*) cal(T) - C_N \( F^2 + \| K \|^2 \) . $ <n3:deformation:floor-algebra-general>]

 If $K = 0$, the more useful uniform estimate is
#[#set math.equation(numbering: n => "(4.28)")
 $ cal(T) - cal(S) \( H^f \) gt.eq c_(*) cal(T) - C_N v F^2 . $ <n3:deformation:floor-algebra-end>]

]
] <n3:deformation:floor-curvature>

#proof[
  Consider the graph of $f$ in the Riemannian product with warped fiber
    $\( Omega times bb(R) \, g + l^2 thin upright(d) b_0^2 \)$. Its induced metric is $macron(g)$.
    At $thin upright(d) t = 0$ one also has $thin upright(d) l = 0$, and its second fundamental form,
    up to orientation, is $H^f$. Write $E = l^(- 1) partial_(b_0)$.
    The graph unit normal is $sqrt(d) thin E - a e$. The ambient curvature formulas at this point are
  $ "Scal"_(upright("amb")) = "Scal"_g - 2 Delta l \/ l \,\
"Ric"_(upright("amb")) \|_(T Omega) = "Ric"_g - "Hess" l \/ l \, wide "Ric"_(upright("amb")) \( E \, E \) = -
  Delta l \/ l \, $
  with zero mixed Ricci terms. Hence the ambient contribution to half the graph scalar curvature is
  $ 1 / 2 "Scal"_g - v "Ric"_g \( e \, e \) - v thin "tr"_perp "Hess" l \/ l . $
  The last term is nonpositive: at $thin upright(d) t = 0$, $"Hess" l = l p thin "Hess" t$ and $p gt.eq 0$.
    The second-form contribution is $\[ \( "tr"_(macron(g)) H^f \)^2 - \| H^f \|_(macron(g))^2 \] \/ 2$.
    Since the inverse graph metric is $A_d$, its expansion is exactly (4.26).
    Finally the conformal contribution at this point is $- 4 accent(Delta t, ‾) lt.eq 0$. This proves (4.25).
  The pointwise algebraic clause of #cite(label("NumericalCompanion")) Lemma 4.3 applies under Equation (4.11).
    We also record its three-dimensional calculation, because the boundary homotopy below needs its precise
    degenerate normal coefficient. First evaluate $cal(S)$ on $S = K + H^f$,
    whose trace in the transverse plane is $F - chi q$. Subtracting (4.26) from (4.10) at $thin upright(d) t = 0$ gives
  #[#set math.equation(numbering: n => "(4.29)")
   $ cal(T) - cal(S) \( S \) =  & \| T^("tf") \|^2 + \( 1 + d \) \| M \|^2\
 & + chi \( 1 + d - chi \/ 2 \) q^2 - d F q + F^2 \/ 2 . $ <n3:deformation:floor-difference>]
  The normal coefficient is at least $chi$, while $\| d F q \| lt.eq chi q^2 \/ 2 + d^2 F^2 \/ \( 2 chi \)$. Because
  $ d^2 \/ chi = d \( 4 + p v \) \/ 4 lt.eq 1 + N \/ 4 \, $
  Equation (4.13) implies $cal(T) - cal(S) \( S \) gt.eq c cal(T) - C \( 1 + N \) F^2$ with universal $c > 0$.
  To replace $S$ by $H^f = S - K$, polarize (4.26). The difference is bounded by
  $ C \| K \| \( \| T^("tf") \| + \| M \| + \| F \| + d \| q \| \) + C \| K \|^2 . $
  Indeed the only extra normal product is $d q thin "tr"_perp K$;
    all remaining products involve transverse entries, $d M$, or $"tr"_perp S = F - chi q$.
    By (4.13) and $d \/ sqrt(chi) lt.eq C sqrt(1 + N)$, this bound is at most $C sqrt(1 + N) \| K \|
    sqrt(cal(T)) + C \| K \|^2$. Young’s inequality absorbs a fixed small fraction of $cal(T)$ and costs only
    $C \( 1 + N \) \| K \|^2$. This proves (4.27).
  If $\( 1 + p \) v lt.eq eta_(*)$, then $d$ and $chi$ are within $C eta_(*)$ of one.
    At $d = chi = 1$ the normal block in (4.29) is $3 q^2 \/ 2 - F q + F^2 \/ 2$;
    its symmetric matrix has smallest eigenvalue $\( 2 - sqrt(2) \) \/ 2 > 0$.
    Choose $eta_(*) > 0$ small enough that its coefficients remain within half this spectral gap.
    The transverse coefficients are already bounded below. For $K = 0$, Equation (4.13) therefore gives $cal(T) -
    cal(S) \( H^f \) gt.eq c_(*) cal(T)$ in this regime. In the remaining regime $v > eta_(*) \/ \( 1 + p \)$,
    use (4.27) with $K = 0$ and absorb $\( 1 + N \) F^2$ into $C \( 1 + N \)^2 v F^2$. This proves (4.28).
    All formulas extend to $sigma = 0$ by their invariant expressions; there $d = chi =
    1$ and the full quadratic expressions are independent of the temporary choice of axis. ◻
]

#thm([Lemma 4.8.])[
  (Homotopy errors at a floor contact).  #emph[There is a fixed compact set $cal(K) subset
    overline(Omega)$ containing the supports of $K \, C \, b \, D_0 \, D_1$ such that,
    at an interior minimum $t = - epsilon.alt$ of a smooth solution in the first three stages,
#[#set math.equation(numbering: n => "(4.30)")
 $ "div" V_lambda \/ u gt.eq 2 delta_0 cal(T) + tau a sigma -
   C \( 1 + N \)^A \[ upright(bold(1))_(cal(K)) + v \( rho_0 + rho_1 \) \] . $ <n3:deformation:floor-divergence-lower>]

 Here $delta_0 > 0$ can be fixed sufficiently small independently of $N \, R$ and the homotopy parameter.]
] <n3:deformation:floor-errors>

#proof[
  At this contact $thin upright(d) t = 0$ and $p = N$ is locally constant as a function of $t$ near its value $-
    epsilon.alt$. Differentiating $w$ in an orthonormal frame gives
  #[#set math.equation(numbering: n => "(4.31)")
   $ nabla_i w_j = H_(i j)^f - w_j H_(i k)^f w^k . $ <n3:deformation:floor-w-derivative>]
  In the $e$-frame the normal vector slot is multiplied by $d$.
    Equations (4.13) and $d \/ sqrt(chi) lt.eq C sqrt(1 + N)$ therefore show
  #[#set math.equation(numbering: n => "(4.32)")
   $ \| nabla w \| lt.eq C \( 1 + N \)^A \( \| K \| + sqrt(cal(T)) \) . $ <n3:deformation:floor-w-control>]
  No bound for the uncontracted normal Hessian is asserted.
  Each first-three-stage right side can be written as a smooth function $F \( x \, w \, h \, p \)$.
    Its $h$-derivative is at least one. On the bounded height range supplied by Lemma 16,
    its explicit $x$- and $w$-derivatives are polynomially bounded and compactly supported,
    apart from the derivative of the term $h$. This follows directly from the fixed collar cutoffs and $A_chi =
    I - \( p + 4 \) w ⊗ w \/ \( 4 + p v \)$, whose denominator is at least four.
    For example its first $w$-derivatives on $\| w \| lt.eq 1$ are bounded by $C \( 1 + N \)^2$,
    and the other explicit modifications have bounds independent of $N$.
    Combining these bounds with (4.32) and Young’s inequality therefore produces a fixed finite power of $1 + N$.
    Since $nabla p = 0$ at the contact and $w \( h \) = tau a sigma$, the chain rule and (4.32) give,
    for every fixed $eta > 0$,
  #[#set math.equation(numbering: n => "(4.33)")
   $ w \( F \) gt.eq tau a sigma - eta cal(T) - C_eta \( 1 + N \)^A upright(bold(1))_(cal(K)) .
     $ <n3:deformation:floor-F-control>]
  The dependence $D_0 \( x \, w \, h + zeta b \( x \) \)$ only adds the fixed compact derivative of $b$ and does
    not change this conclusion.
  The omitted flux is $\( 1 - lambda \) u A_chi K \( w \, dot.op \)$. Let $B_K = A_chi K \( w \, dot.op \)$.
    Its derivative is bounded by a polynomial constant times $1 + sqrt(cal(T))$ on $cal(K)$, by (4.32);
    derivatives of $p$ vanish. The weight term requires the contraction rather than a bound for $\| nabla log
    u \|$. At the contact,
  $ nabla log u = H^f \( w \, dot.op \) \, wide chevron.l nabla log u \, B_K chevron.r =
    a^2 #scale(x: 120%, y: 120%)[\(] chi H_(e e)^f K_(e e) + H_(e perp)^f dot.op K_(e perp)
    #scale(x: 120%, y: 120%)[\)] . $
  This involves only $chi H_(e e)^f$ and $H_(e perp)^f$ and is controlled by (4.13). It follows that
  #[#set math.equation(numbering: n => "(4.34)")
   $ \| "div" \( u B_K \) \| \/ u lt.eq eta cal(T) + C_eta \( 1 + N \)^A upright(bold(1))_(cal(K)) .
     $ <n3:deformation:floor-flux-control>]
  Combine the scalar identity with (4.25). The difference $8 pi mu -
    "Scal"_g \/ 2$ equals $\( \( "tr" K \)^2 - \| K \|^2 \) \/ 2$ and is compactly supported; so is $J$.
    The term $F "tr" K$ is compactly bounded by Lemma 16. On $cal(K)$,
    Equation (4.27) therefore contributes $c_(*) cal(T) - C \( 1 + N \)^A$.
    Outside $cal(K)$, $K = 0$, $F = h$, and (4.28) together with Lemma 17 gives $c_(*) cal(T) -
    C \( 1 + N \)^A v r^(- 2 gamma)$. The remaining Ricci term is bounded below by $-
    C upright(bold(1))_(cal(K)) - C v r^(- 3)$; enlarge $cal(K)$ if necessary.
    Both end weights are bounded by a multiple of $rho_0 + rho_1$.
    Finally subtract the omitted flux and use (4.33)–(4.34), choosing their two $eta$’s with sum at most $c_(*) \/
    2$. Fix $0 < delta_0 < min \( c_(*) \/ 4 \, 1 \/ 4 \)$. Decreasing it slightly if necessary gives (4.30). ◻
]

#thm([Proposition 4.9.])[
  (Floor exclusion).  #emph[Choose $delta_0$ as in Lemma 19.
    There is a polynomial choice $C_N = C \( 1 + N \)^A$ in the penalty such that,
    for all sufficiently large $N$ and all $R gt.eq R_(upright("floor")) \( N \, epsilon.alt \)$,
    no smooth solution anywhere along Proposition 15 can satisfy $t gt.eq - epsilon.alt$ and attain $t = -
    epsilon.alt$. In particular every such admissible solution has $t > - epsilon.alt$ on $overline(Omega_R)$.]
] <n3:deformation:floor>

#proof[
  Choose $R_(upright("floor"))$ to include the requirement of Lemma 17. A floor contact cannot occur on $S_R$.
    In the first three stages, an inner contact has $j \( t \) = 0$.
    Equation (4.20) then cancels the omitted flux on both sides and gives $V_nu \/ u = cal(B)$.
    Equation (4.16) forces $H + 4 partial_nu t = - N_B$, so $partial_nu t < 0$.
    This contradicts the nonnegative derivative into $Omega_R$ at a boundary minimum.
  Consider an interior contact.
    Let $E_N = C \( 1 + N \)^A \[ upright(bold(1))_(cal(K)) + v \( rho_0 + rho_1 \) \]$ denote the error in
    (4.30). Because $rho_0$ has a positive minimum on $cal(K)$, $upright(bold(1))_(cal(K)) lt.eq
    C_(cal(K)) rho_0$. Also $v rho_0 lt.eq rho_0$, and $rho \/ rho_0$ is globally bounded.
    We can therefore choose a polynomial $C_N$ so large that, pointwise for all $0 lt.eq v lt.eq 1$,
  #[#set math.equation(numbering: n => "(4.35)")
   $ cal(P) gt.eq E_N + 2 rho + rho_0 . $ <n3:deformation:penalty-choice>]
  At the floor $m_0 = 1$, so the scalar equation and the lower estimate give
  $ 0 & gt.eq delta_0 cal(T) + \( 1 - delta_0 \) tau a sigma + cal(P) - E_N - rho\
 & gt.eq rho + rho_0 > 0 \, $
  a contradiction. Enlarging $C_N$ below preserves this inequality and preserves its polynomial dependence.
  In the last stage $f = 0$, $t = Z$, $u = L$, and $v = 0$.
    At an interior minimum, $cal(T) = \( \| K \|^2 + \( "tr" K \)^2 \) \/ 2$.
    Increase $C_N$ polynomially if necessary so that $delta_0 cal(T) + rho - C_N rho_0 < 0$ at all such points.
    For $eta_s > 0$, the scalar equation at a floor minimum has left side $4 L Delta t gt.eq
    0$ and strictly negative right side. At an inner floor minimum its flux is $4 partial_nu t =
    eta_s \( - H - N_B \) < 0$, also impossible. If $eta_s = 0$,
    multiplication of $"div" \( 4 L \( t \) nabla t \) = 0$ by $t$, with zero outer value and zero inner flux,
    gives $t = 0$. Thus the last stage has no floor contact either. ◻
]

We have excluded floor contact for every smooth admissible solution along the specified homotopy.
  Section 5 supplies the remaining a priori bounds, and Section 6 proves existence.
  The choice of $cal(P)$ uses only polynomial losses in $N$; it is independent of all fixed-$N$ Schauder constants.

== 5 A priori estimates for the deformation <n3:apriori:section>

We bound the height, boundary slopes, and conformal variable before using classical regularity.
  Fix the prepared exterior of Proposition 11, its thresholds and collars, and $epsilon.alt > 0$.
  We use the variables and four stages of Proposition 15. A solution is smooth on a finite truncation and
  satisfies $t gt.eq - epsilon.alt$, so the estimates include putative floor-contact solutions.
  No Hessian bound or upper bound for $Z$ is assumed.

A quantity denoted by $Pi_N$ is bounded by $C \( 1 + N \)^A$, with $C \, A$ independent of the truncation,
  the homotopy parameter, and $N$. It can increase at successive uses.
  The fixed data, collars, and $epsilon.alt$ can enter $C \, A$.
  A constant denoted by $C \( N \)$ can depend arbitrarily on these fixed data and on $N \, ell \, tau$;
  it is still independent of the truncation and the homotopy parameter.
  Constants explicitly described as fixed do not depend on $N$. Recall that

#[#set math.equation(numbering: n => "(5.1)")
 $ ell = e^(- epsilon.alt N) \, wide tau = ell^(3 \/ 2) \, wide ell lt.eq l lt.eq e \, wide 0 lt.eq p lt.eq N \,
   wide frac(4 d, 4 + N) lt.eq chi lt.eq d . $ <n3:apriori:parameter-comparisons>]

In particular $Pi_N tau \/ ell arrow.r 0$. This small factor will absorb only terms whose constants are polynomial.

=== 5.1 Sublevels and exclusion of boundary layers <sublevels-and-exclusion-of-boundary-layers>

The limiting height will be only lower semicontinuous. We first show how an expansion bound on its lower tests
  controls every exterior support of a closed sublevel, including a plateau.
  This local step will also apply to the four-dimensional constructions.

#thm([Lemma 5.1.])[
  (Exterior supports of a closed sublevel).  #emph[Let $U$ be an open subset of a smooth Riemannian manifold of
    dimension $d in { 3 \, 4 }$, let $Q$ be a smooth symmetric tensor on $U$, and let $u : U arrow.r
    bb(R)$ be finite and lower semicontinuous. Fix $k < k'$ and $q_0 in bb(R)$.
    A smooth lower test of $u$ at $x$ is a smooth function $phi.alt$ with $phi.alt \( x \) =
    u \( x \)$ and $phi.alt lt.eq u$ near $x$. Suppose every such test with $u \( x \) < k'$ and $thin upright(d)
    phi.alt \( x \) eq.not 0$ satisfies
$ cal(E)_Q \[ phi.alt \] \( x \) lt.eq q_0 \, $

 where $cal(E)_Q$ is the expansion in Equation (3.12) of the regular level through $x$,
   oriented toward increasing $phi.alt$. Equivalently, subtract $phi.alt \( x \)$ before applying that formula.
   Then every smooth exterior support of the relatively closed set $D_k = { x in U : u \( x \) lt.eq k }$,
   at a frontier point in $U$, has expansion at most $q_0$.]
] <n3:apriori:sublevel-support>

#proof[
  For integers $j gt.eq 1$ define
  #[#set math.equation(numbering: n => "(5.2)")
   $ S_j \( s \) = #scale(x: 120%, y: 120%)[\(] 1 + exp \[ - j^2 \( s - k - j^(- 1) \) \]
     #scale(x: 120%, y: 120%)[\)]^(- 1) \, wide v_j = S_j compose u . $ <n3:apriori:sigmoid>]
  These functions are lower semicontinuous and take values in $\( 0 \, 1 \)$.
    Their lower relaxed limit $liminf_(j arrow.r oo \, thin y arrow.r x)
    v_j \( y \)$ is the function $I_k \( x \)$ equal to zero on $D_k$ and one on its complement.
    Indeed, at $x in D_k$ the constant sequence gives $v_j \( x \) lt.eq S_j \( k \) arrow.r 0$, while $v_j gt.eq
    0$ everywhere. If $u \( x \) > k$, lower semicontinuity gives a neighborhood on which $u gt.eq k +
    delta$ for some $delta > 0$, and $v_j arrow.r 1$ uniformly there.
  Let $phi.alt$ define an exterior support of $D_k$ at $x$:
    $phi.alt \( x \) = 0$, $thin upright(d) phi.alt \( x \) eq.not 0$, and $phi.alt lt.eq 0$ on $D_k$ near $x$.
    Shrink to a small normal-coordinate ball compactly contained in $U$ on which $\| phi.alt \| < 1 \/ 2$.
    Then $phi.alt$ is a lower test of $I_k$ at $x$. Subtract a small positive multiple of the fourth power of the
    distance from $x$ to make this contact strict without changing its two-jet;
    write the resulting function as $phi.alt_0$. Minimize $v_j - phi.alt_0$ on the closed ball.
    The preceding relaxed-limit description, the strict contact, and $v_j \( x \) arrow.r
    0$ show that the minimizers $x_j$ lie in its interior for large $j$, satisfy $x_j arrow.r x$,
    and have contact values $v_j \( x_j \) arrow.r 0$. Thus $phi.alt_0 + a_j$ is a lower test of $v_j$ at $x_j$,
    where $a_j arrow.r 0$.
  For each fixed large $j$, restrict to a neighborhood of $x_j$ on which $phi.alt_0 +
    a_j$ takes values in $\( 0 \, 1 \)$. The increasing function $S_j^(- 1)$ makes
    $S_j^(- 1) \( phi.alt_0 + a_j \)$ a smooth lower test of $u$. Its contact height is
  $ u \( x_j \) = k + j^(- 1) + j^(- 2) log frac(v_j \( x_j \), 1 - v_j \( x_j \)) lt.eq k + j^(- 1) < k' $
  for all sufficiently large $j$. Its gradient is nonzero, since $thin upright(d) phi.alt_0 \( x_j \) arrow.r
    thin upright(d) phi.alt \( x \) eq.not 0$. An increasing smooth composition preserves the oriented level
    expansion: it preserves the unit normal, and for $theta' > 0$,
  $ "Hess" \( theta compose phi.alt_0 \) = theta' "Hess" phi.alt_0 +
    theta'' thin upright(d) phi.alt_0 ⊗ thin upright(d) phi.alt_0 \, wide
    frac("tr"_(\( thin upright(d) phi.alt_0 \)^perp) "Hess" \( theta compose phi.alt_0 \), \| thin upright(d) \(
    theta compose phi.alt_0 \) \|) =
    frac("tr"_(\( thin upright(d) phi.alt_0 \)^perp) "Hess" phi.alt_0, \| thin upright(d) phi.alt_0 \|) . $
  The hypothesis therefore gives $cal(E)_Q \[ phi.alt_0 + a_j \] \( x_j \) lt.eq q_0$.
    Letting $j arrow.r oo$ yields $cal(E)_Q \[ phi.alt \] \( x \) lt.eq q_0$,
    because $phi.alt_0$ and $phi.alt$ have the same two-jet at $x$. ◻
]

For notation in this section, let $cal(B)_c$ be the full closed maximal black region at threshold $c$,
  and let $cal(W)_c$ be the corresponding white region with $cal(B)_(c_b)$ held fixed.
  These are the families used in Proposition 11.

#thm([Lemma 5.2.])[
  (Uniform separation from the wrong height).  #emph[In the first two homotopy stages, the following holds.
    If $Q subset macron(Omega)$ is compact and disjoint from $cal(B)_(c_b)$, there are $eta_Q > 0$ and $N_Q$ such that
#[#set math.equation(numbering: n => "(5.3)")
 $ h gt.eq b_(-) + eta_Q quad upright("on ") Q $ <n3:apriori:lower-height>]

 for every $N gt.eq N_Q$, every sufficiently large allowed truncation,
   and every admissible or floor-contact solution in those stages.
   If $Q$ is disjoint from $cal(W)_(c_w)$, the analogous conclusion is $h lt.eq b_(+) - eta_Q$.
   The compact sets are relative to the full closure: they may contain faces of the opposite color.]
] <n3:apriori:sublevels>

#proof[
  We prove the lower assertion. It is enough to consider an arbitrary sequence $N_i arrow.r oo$, $R_i arrow.r
    oo$ and solutions in either of the first two stages. The elementary height and end estimates in Lemmas 16
    and 17 give
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| h_i \| lt.eq C_0 \, wide \| h_i \| lt.eq C \( r^(- gamma) - R_i^(- gamma) \) quad upright("on the end") \,
     wide 3 \/ 4 < gamma < 1 . $ <n3:apriori:elementary-height>]
  Near each white face extend $h_i$ to the other side by the constant $b_(+)$.
    Extend the fixed geometric coefficients smoothly there. The extended functions are continuous.
    Define the lower relaxed limit
  $ underline(h) \( x \) = lim_(j arrow.r oo) inf { h_i \( y \) : i gt.eq j \, med "dist" \( x \, y \) < 1 \/ j } . $
  It is lower semicontinuous, bounded, and satisfies the limiting end bound. No equicontinuity of $h_i$ is asserted.
  Choose $b_(-) < k' < min { 0 \, b_(-) + eta }$, where $eta$ is the low-height sign range of the added term
    $D_0$. Suppose that a smooth function $phi.alt$ touches $underline(h)$ from below at $x$,
    with $underline(h) \( x \) lt.eq k'$ and $d phi.alt \( x \) eq.not 0$. Exclude for the moment the black faces.
    Subtracting a small fourth-order localization term from $phi.alt$ makes the contact strict without changing
    its two-jet. Minimization on a small closed ball then produces, after passing to a subsequence,
    points $x_i arrow.r x$ and constants $c_i arrow.r 0$ such that $phi.alt +
    c_i$ touches $h_i$ from below at $x_i$, and $h_i \( x_i \) arrow.r underline(h) \( x \)$.
    The boundary of this ball cannot contain $x_i$ by strictness.
    Nor can $x_i$ lie on a white face or on the extended side: their values there are $b_(+) > k'$.
    Thus every sufficiently large $i$ uses the interior trace equation.
  At these contacts,
  $ nabla f_i = tau_i^(- 1) nabla phi.alt \, wide d_i lt.eq
    frac(tau_i^2, ell_i^2 \| d phi.alt \( x_i \) \|^2) arrow.r 0 \, wide a_i arrow.r 1 \, wide chi_i arrow.r 0 . $
  Here $a_i = l_i \| nabla f_i \| \/ sqrt(D_i)$ is the deformation variable.
    Positivity of $A_(chi_i)$ and the Hessian inequality at a lower contact imply
  $ "tr"_(A_(chi_i)) K + frac(l_i, tau_i sqrt(D_i)) "tr"_(A_(chi_i)) "Hess" phi.alt lt.eq F_i \( x_i \) . $
  In the second stage $D_0 lt.eq 0$ at these values; in the first stage it is absent.
    Consequently $limsup F_i \( x_i \) lt.eq k' + C_b$. Passing to the limit gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ frac("tr"_(\( d phi.alt \)^perp) "Hess" phi.alt, \| d phi.alt \|) + "tr"_(\( d phi.alt \)^perp) K lt.eq k' +
     C_b . $ <n3:apriori:relaxed-test>]
  This is the expansion of the level surface of $phi.alt$, oriented toward increasing $phi.alt$.
    The only Hessian used in this passage is the fixed test Hessian.
    Removing the localization proves the assertion for non-strict contacts as well.
  Fix $b_(-) < k < k'$ and put $E_k = { underline(h) lt.eq k }$.
    Apply Lemma 21 with $u = underline(h)$, tensor $Q = K$, and $q_0 = k' + C_b$.
    The function is finite and lower semicontinuous, and Equation (5.5) supplies the required bound for every
    nonzero-gradient lower test below $k'$. We apply the lemma locally away from black faces,
    using the constant extensions to obtain open neighborhoods across white faces.
    Every exterior support of $E_k$ there consequently has expansion at most $k' + C_b$,
    with no regularity assumption on the sublevel.
  This argument also rules out a hidden layer at a white face.
    At every point strictly on the added side, the relaxed limit equals $b_(+) > k$.
    Thus $E_k$ lies locally in the original closed exterior, and the reversed white face is an exterior support of
    $E_k$ at any contact there, with expansion
  $ - H_B + P_B = - c_w > 0 . $
  For $k'$ sufficiently close to $b_(-)$, this is strictly greater than $k' + C_b$.
    The high extension ensured that all preceding low-value tests came from the interior equation,
    so the support contradiction applies at the face itself. Hence $E_k$ avoids every white face.
    The end estimate makes $E_k$ compact.
  Adjoin the entire closed region $cal(B)_(c_b)$. At a point on its smooth black frontier,
    every exterior support of the union also contains the black region locally.
    The tangency comparison therefore bounds its expansion by $c_b < k' + C_b$.
    At all other frontier points the preceding sublevel argument applies.
    The resulting compact closed set contains the required original inner barrier with a collar,
    because the black region already does. It avoids the outer barriers.
    Lemma 10 places it in a smooth black trapped region at any threshold $c'' > k' +
    C_b$ sufficiently close to $c_b$. It is consequently contained in $cal(B)_(c'')$.
  Finally let $Q$ be as in the lemma. Hausdorff right continuity at $c_b$ gives a $delta >
    0$ such that $cal(B)_(c_b + delta) ∩ Q = diameter$; decrease $delta$ so that the enlarged threshold is still
    negative and all barriers remain strict. Choose $k \, k' \, c''$ with
  $ b_(-) < k < k' \, wide k' + C_b < c'' < c_b + delta . $
  The construction implies $E_k ∩ Q = diameter$ for every sequence under consideration.
    If the uniform estimate $h > k$ on $Q$ failed, choose violating solutions with $N_i arrow.r oo$, $R_i arrow.r
    oo$ and $x_i in Q$, $h_i \( x_i \) lt.eq k$. A subsequence has $x_i arrow.r
    x in Q$ and $underline(h) \( x \) lt.eq k$, a contradiction. This gives (5.3), after decreasing its positive margin.
  For the upper assertion apply the entire argument to $\( - h \, - K \, - C \)$, interchanging colors.
    The reversed black faces have strictly positive white expansion $- c_b$.
    Their exclusion and compactness give positive distance from the black region before applying the white version
    of Lemma 10. Adjoining the full white region is therefore legitimate in the fixed black complement.
    Empty white regions and missing face types cause no change:
    only an actually nonempty sublevel would supply a trapped seed and hence a contradiction. ◻
]

For the truncation quantifier, start with any $R_min \( N \) arrow.r
  oo$ that satisfies the outer estimates of Section 4, and enlarge it when necessary.
  Failure of any asserted estimate for arbitrarily large $N$ and $R gt.eq
  R_min \( N \)$ supplies exactly the sequence excluded above.
  Only finitely many compact sets will be needed below, so their thresholds can be chosen simultaneously.

The weak-set argument has kept low heights near black faces and high heights near white faces.
  We now sharpen this separation into a nonzero signed boundary slope.
  That slope makes the otherwise uncontrolled inner flux small enough for the mass estimate.

=== 5.2 Signed collar barriers <signed-collar-barriers>

#thm([Lemma 5.3.])[
  (Boundary slopes).  #emph[There are fixed constants $c \, C_(*) > 0$ such that,
    for sufficiently large $N$ and the allowed truncations, the first two stages satisfy
#[#set math.equation(numbering: n => "(5.6)")
 $ c \/ tau lt.eq partial_nu f lt.eq C_(*) \/ tau & upright("on black faces") \,\
c \/ tau lt.eq - partial_nu f lt.eq C_(*) \/ tau & upright("on white faces") . $ <n3:apriori:signed-slopes>]

 During the third stage one still has $\| partial_nu f \| lt.eq C_(*) \/ tau$.
   On every fixed compact region needed for the final scalar-curvature estimate,
   the first two stages satisfy $b_(-) lt.eq h lt.eq b_(+)$.]
] <n3:apriori:collars>

#proof[
  Write $s$ for the smooth leaf parameter in an outward collar and $nu_s = nabla s \/ \| d s \|$.
    All geometric coefficients of this fixed collar are bounded, with $\| d s \|$ bounded above and below.
    At a comparison contact with $h_0 = b_(-) + psi \( s \)$, $psi' > 0$, the shared gradient gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ d lt.eq C frac(tau^2, ell^2 \( psi' \)^2) \, wide 1 - a lt.eq d \, wide N chi gt.eq
     c_1 d quad \( N gt.eq 4 \) . $ <n3:apriori:contact-degeneracy>]
  If the slopes are in a fixed positive interval, the first bound is $d lt.eq C ell$.
    None of these comparisons uses an upper bound for $Z$.
  The trace operator on this test is
  #[#set math.equation(numbering: n => "(5.8)")
   $ & "tr"_(A_chi) (K + frac(l, tau sqrt(D)) "Hess" h_0)\
 & quad = P_s + a H_s + chi K \( nu_s \, nu_s \) +
   a chi (frac("Hess" s \( nu_s \, nu_s \), \| d s \|) + \| d s \| psi'' / psi') \, $ <n3:apriori:collar-trace>]
  where $P_s$ is the tangential trace of $K$ on the leaf. Thus it is the leaf expansion $H_s + P_s$,
    with an error of absolute value at most $C d$, plus the displayed logarithmic-slope term.
    The same formula for a negative slope has $a$ replaced by $- a$ in the Hessian terms.
    This is an evaluation at the contact variables; it does not differentiate the unknown $t$.
  On a black collar $H_s + P_s gt.eq c_b$ and $C = C_b - k_B s$.
    Choose small positive slopes so that $psi \( 0 \) = 0$ and $psi \( s \) lt.eq k_B s \/ 2$.
    At the outer end of a sufficiently short fixed collar, Lemma 22 lets this test lie below the solution.
    In the compatible direction the add-on $D_0$ vanishes. The residual of the trace equation on the test is
    therefore at least
  #[#set math.equation(numbering: n => "(5.9)")
   $ k_B s \/ 2 - C d + a chi \| d s \| psi'' / psi' . $ <n3:apriori:lower-collar-residual>]
  Choose a smooth nonnegative $beta_N \( s \)$ equal to $A N$ for $0 lt.eq s lt.eq 1 \/ N$, supported in $0 lt.eq
    s lt.eq 2 \/ N$, and satisfying $integral beta_N lt.eq 2 A$. Define
  $ psi' \( s \) = m exp (integral_0^s beta_N \( q \) thin upright(d) q) . $
  Choose the fixed $A$ large enough that the final term of (5.9) dominates $C d$ on $s lt.eq 1 \/ N$,
    using (5.7) and $a gt.eq 1 \/ 2$ there. On $s gt.eq 1 \/ N$, the first term dominates $C d lt.eq
    C ell$ for large $N$; the taper contributes with the good sign.
    Since the slope multiplier is at most $e^(2 A)$, a fixed sufficiently small $m >
    0$ enforces all the previous small-slope requirements. This constructs a strict lower barrier with slopes
    bounded above and below independently of $N$.
  An upper barrier from $b_(-)$ is constructed in the same collar with
  $ psi' \( s \) = M exp (- integral_0^s beta_N \( q \) thin upright(d) q) . $
  The smooth leaf expansion differs from its boundary value by $O \( s \)$.
    Choose the fixed $M$ so large that $psi \( s \) gt.eq C_2 s$ dominates this variation, the offset variation,
    and the height bound at the outer collar end. The logarithmic-slope term is now negative.
    On $s lt.eq 1 \/ N$ it dominates $C d$; on the rest of the collar the negative margin proportional to $s$ does
    so. The upper barrier is strict at every possible positive contact.
    Its slopes lie in $\[ M e^(- 2 A) \, M \]$, an interval independent of $N$.
  To check the comparison signs, at a negative interior minimum of $h -
    h_0$ the Hessian of $h$ dominates that of $h_0$, the gradients and $Z$ agree, and hence so do $t \, l \,
    A_chi$. The right side is strictly increasing in the height.
    Thus a strict positive residual for a lower barrier contradicts the equation.
    At a positive maximum the inequalities reverse, proving the upper-barrier assertion.
    Taking the one-sided derivative at $s = 0$ proves the black part of (5.6).
    Replacing $\( h \, K \, C \)$ by $\( - h \, - K \, - C \)$ proves the white part.
  In the third stage the boundary height is the assigned interpolated constant, say $b_zeta$.
    Construct tests $b_zeta + psi \( s \)$ and $b_zeta - psi \( s \)$ with large positive $psi'$ and
    $\( log psi' \)' = - beta_N$. At $s = 0$, the two directional inequalities of Proposition 15 say precisely
    that the positive-slope test has nonpositive limiting residual and the negative-slope test nonnegative
    limiting residual. At every comparison contact, the fixed positive barrier slope and Equation (5.7) give $d
    lt.eq C ell$, so $a gt.eq 1 \/ 2$ for large $N$. On $1 \/ 2 lt.eq \| w \| lt.eq 1$,
    the first $w$-derivatives of $A_chi$ in Equation (4.5) are bounded independently of $0 lt.eq p lt.eq N$.
    The other collar terms have fixed smooth coefficients on the bounded height range.
    Thus, at fixed boundary height the coefficient and geometric errors are $O \( s + d + chi \)$,
    since $\| w - \( plus.minus nu_s \) \| = 1 - a lt.eq d$ and the radial comparison segment stays in this range.
    Changing the test height supplies, by height monotonicity,
    a residual of magnitude at least $psi \( s \)$ with the required sign.
    Large fixed slopes dominate the $O \( s \)$ error and the outer-end height bound.
    The logarithmic-slope term has the required sign for both tests, as follows from (5.8);
    it dominates the $O \( d \)$ error on the initial $1 \/ N$ interval.
    The remaining margin dominates it beyond that interval. This proves the two-sided upper derivative bound,
    without using sublevel exclusion in the third stage.
  Finally, on each own-color collar the lower barrier just constructed gives the required one-sided height bound.
    On the rest of a fixed compact region use Lemma 22; the opposite height bound on an own-color collar follows
    from that lemma as well, since the closed collar is disjoint from the other region.
    A finite cover proves $b_(-) lt.eq h lt.eq b_(+)$ on the compact regions in the statement. ◻
]

=== 5.3 A trace estimate with polynomial constants <a-trace-estimate-with-polynomial-constants>

The collar trace estimate must have polynomial constants:
  it will control the boundary flux both here and in the mass estimate.
  We therefore prove it before comparing with the ordinary product graph.

#thm([Lemma 5.4.])[
  (Weighted and unweighted collar traces).  #emph[In the first two stages let $cal(C)$ be a fixed union of
    disjoint collars of the inner faces, shortened if necessary.
    For every nonnegative smooth function $phi$ supported in those collars,
#[#set math.equation(numbering: n => "(5.10)")
 $ integral_B L phi thin upright(d) A_g & lt.eq Pi_N integral_(cal(C)) u
   #scale(x: 120%, y: 120%)[\[] \( 1 + sqrt(cal(T)) \) phi + \| d phi \|_(A_chi) #scale(x: 120%, y: 120%)[\]] thin
   upright(d) V_g \,\
integral_B phi thin upright(d) A_g & lt.eq Pi_N integral_(cal(C)) sqrt(D)
  #scale(x: 120%, y: 120%)[\[] \( 1 + sqrt(cal(T)) \) phi + \| d phi \|_(A_chi) #scale(x: 120%, y: 120%)[\]] thin
  upright(d) V_g . $ <n3:apriori:weighted-trace>]

 The estimates also hold without a support condition on $phi$ if the right sides include a fixed collar cutoff
   equal to one on $B$, with its derivative included in the coefficient of $phi$.]
] <n3:apriori:trace>

#proof[
  For $sigma > 0$, write $e_f = nabla f \/ sigma$, the axis denoted by $e$ in Section 4. Set
  $ W = l accent(nabla f, ‾) = frac(l nabla f, D) = sqrt(d) thin a e_f . $
  Its norm in $macron(g)$ is $a lt.eq 1$. For any covector $xi$,
  #[#set math.equation(numbering: n => "(5.11)")
   $ \| xi \( W \) \| lt.eq \| xi \|_(A_d) lt.eq sqrt(1 + N \/ 4) thin \| xi \|_(A_chi) . $ <n3:apriori:W-gradient>]
  Direct differentiation, using $u W = L w$, gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ frac("div" \( u W \), u) & = sqrt(d) ["tr"_(A_d) H^f + \( d p + p_L \) a partial_(e_f) t] \,\
frac("div" \( sqrt(D) thin W \), sqrt(D)) & = sqrt(d) ["tr"_(A_d) H^f + d p thin a partial_(e_f) t] .
  $ <n3:apriori:W-divergence>]
  For example, $"div" w = "tr"_(A_d) H^f + d p thin a partial_(e_f) t$,
    while differentiating $L$ adds $p_L a partial_(e_f) t$ to the first formula.
    Coercivity in Lemma 13 bounds both right sides by $Pi_N \( 1 + sqrt(cal(T)) \)$.
    More explicitly, writing $q = \( K + H^f \)_(e_f e_f)$, the normal Hessian term has coefficient $d^(3 \/ 2)$,
    so it is bounded by $sqrt(d) \| q \| + C$. The other Hessian terms are transverse traces,
    and the gradient term is at most $\( 2 N + 2 \) sqrt(d) \| partial_(e_f) t \|$.
    All are controlled by the stated coercivity estimate. This also establishes the formulas and bounds at zero
    gradient by their smooth direction-free extensions.
  Let $epsilon_B = 1$ on a black collar and $- 1$ on a white collar.
    The signed slopes give $w_nu = epsilon_B a$ on $B$ and $a gt.eq 1 \/ 2$ for large $N$. Thus
  $ u W_nu = epsilon_B L a \, wide sqrt(D) thin W_nu = epsilon_B a . $
  The outward integration normal is $- nu$. Apply the divergence theorem to $- epsilon_B u W phi$,
    with a fixed collar cutoff. Its boundary flux is $L a phi$.
    Equations (5.11) and (5.12), and the fixed cutoff derivative, give (5.10).
    Replace $u$ by $sqrt(D)$ and use (5.12) for (5.10). No factor $ell^(- 1)$ was used. ◻
]

=== 5.4 High-level energy and the first upper bound <high-level-energy-and-the-first-upper-bound>

The signed slopes and polynomial trace estimate are now available.
  We use them before allowing any constants that depend arbitrarily on $N$.
  The first stage contains the drift in the divergence equation.
  We first bound this stage uniformly for $lambda in \[ 0 \, 1 \]$. There is a number $M_0 = M_0 \( N \) > 0$ such that

#[#set math.equation(numbering: n => "(5.13)")
 $ Xi gt.eq delta_0 cal(T) + rho + 1 / 2 delta_0 tau a sigma quad
   upright("on ") { Z > M_0 } . $ <n3:apriori:high-source>]

Indeed, outside the support of $m_0$ this is immediate. On its support, $- epsilon.alt lt.eq t lt.eq -
  epsilon.alt + 1 \/ N$, so $l$ is comparable to $ell$. The identity $D =
  e^(8 \( Z - t \))$ shows that $a sigma$ tends uniformly to infinity as $Z arrow.r oo$ in that band.
  The penalty $cal(P)$ is bounded on the whole exterior by $Pi_N$.
  It is therefore absorbed by $delta_0 tau a sigma \/ 2$ above a fixed $M_0 \( N \)$.
  This choice is independent of $R$ and $lambda$.

Choose a smooth nondecreasing $k_0$ equal to zero on $Z lt.eq M_0$, equal to one on $Z gt.eq M_0 + 1$,
  and with bounded derivative. Test $"div" V_lambda = u Xi$ by $k_0 \( Z \)$.
  Its outer boundary term vanishes since $Z = 0$. The drift cross term is bounded by

$ u k'_0 lr(|chevron.l d Z \, K \( w \, dot.op \) chevron.r_(A_chi)|) lt.eq 2 u k'_0 \| d Z \|_(A_chi)^2 +
  C u k'_0 \| K \|^2 . $

The last term has bounded integral: it is supported on a fixed compact set and on $M_0 lt.eq Z lt.eq M_0 + 1$,
  where the floor and $D = e^(8 \( Z - t \))$ bound $u$ and $sigma$ by $C \( N \)$.

At a black face $F - P_B = H$, $w_nu = a$; at a white face $F - P_B = - H$, $w_nu = - a$. In both cases

$ - H + w_nu \( F - P_B \) = \( a - 1 \) H . $

The additional omitted-drift term in the homotopy boundary condition has absolute value at most $C chi lt.eq C d$,
  since $A_chi K \( w \, dot.op \)$ has normal component $chi w_nu K \( nu \, nu \)$.
  The remaining term is $- N_B d$, and the boundary multiplier lies between zero and one. Hence

#[#set math.equation(numbering: n => "(5.14)")
 $ \| \( V_lambda \)_nu \| lt.eq C u d = C L sqrt(d) lt.eq C tau / ell L quad upright("on ") B \,
   $ <n3:apriori:small-boundary-flux>]

where the last inequality uses the lower slope in (5.6). Integration now gives

#[#set math.equation(numbering: n => "(5.15)")
 $ & integral_(Omega_R) u k_0 (delta_0 cal(T) + rho + 1 / 2 delta_0 tau a sigma) thin upright(d) V_g +
   2 integral_(Omega_R) u k'_0 \| d Z \|_(A_chi)^2 thin upright(d) V_g\
 & #h(18mm)  lt.eq C \( N \) + C tau / ell integral_B L k_0 thin upright(d) A_g .
   $ <n3:apriori:high-energy-before-trace>]

Apply (5.10) with the fixed collar cutoff. The boundary cost is at most

$ Pi_N tau / ell integral_(cal(C)) u [k_0 \( 1 + sqrt(cal(T)) \) + k'_0 \| d Z \|_(A_chi)] thin upright(d) V_g . $

Let $rho_(cal(C)) > 0$ be the minimum of $rho$ on the closed collars.
  Pointwise, $1 + sqrt(cal(T)) lt.eq C \( rho + delta_0 cal(T) \)$ there, with $C$ fixed.
  Since $Pi_N tau \/ ell arrow.r 0$, the first summand is absorbed in the first integral of (5.15).
  Young’s inequality bounds the derivative summand by

$ u k'_0 \| d Z \|_(A_chi)^2 + C \( Pi_N tau \/ ell \)^2 u k'_0 . $

The second term again has bounded compact integral because it lies in the transition strip of $k_0$. We obtain

#[#set math.equation(numbering: n => "(5.16)")
 $ integral u k_0 \( cal(T) + rho + tau a sigma \) thin upright(d) V_g +
   integral u k'_0 \| d Z \|_(A_chi)^2 thin upright(d) V_g lt.eq C \( N \) . $ <n3:apriori:high-energy>]

The smallness requirement on $N$ in this absorption is independent of $M_0$;
  only its resulting right-hand constant depends on $M_0$.

The polynomial boundary absorption is complete. We may now use arbitrary fixed-$N$ comparison constants.
  Write $Gamma$ for the ordinary product graph of $f$ in $g + \( thin upright(d) b_0 \)^2$,
  and $thin upright(d) Gamma = sqrt(1 + sigma^2) thin upright(d) V_g$.
  The measures $thin upright(d) Gamma$ and $sqrt(D) thin upright(d)
  V_g$ are comparable by constants depending only on $ell$. On every fixed compact set $Q$,

#[#set math.equation(numbering: n => "(5.17)")
 $ integral_(Gamma ∩ pi^(- 1) \( Q \)) e^(2 Z) thin upright(d) Gamma lt.eq C_Q \( N \) \, $ <n3:apriori:L2>]

where $pi$ is projection to the base. To check this without an upper bound for $t$, observe that

$ e^(2 Z) = e^(2 t) D^(1 \/ 4) \, wide u = l e^(2 t) sqrt(D) \, wide D^(1 \/ 4) lt.eq
  C \( N \) \( 1 + tau a sigma \) . $

The last inequality follows by splitting $l sigma lt.eq 1$ and $l sigma > 1$, using $ell lt.eq l lt.eq e$;
  on the second set $a gt.eq 1 \/ sqrt(2)$ and the right side grows linearly in $sigma$,
  whereas $D^(1 \/ 4)$ grows at most as $C sqrt(sigma)$. Thus the high-level part of (5.17) follows from (5.16)
  and the positive minimum of $rho$ on $Q$. On $Z lt.eq M_0 + 1$,
  both $sigma$ and $e^(2 Z)$ are bounded by the floor identity, which controls the remaining compact integral.

=== 5.5 Sobolev inequality and iteration on the ordinary graph <sobolev-inequality-and-iteration-on-the-ordinary-graph>

The high-level estimate gives integral control, but degree requires a pointwise upper bound for $Z$.
  The graph Sobolev inequality and iteration supply that bound.
  The earlier polynomial trace estimate, not the constants in this iteration, will control the mass limit.

The comparisons in this subsection are uniform in the solution, $R$, and the homotopy parameter,
  but may depend arbitrarily on $N$. If $d_0 = \( 1 + sigma^2 \)^(- 1)$, then

$ \| d phi \|_(A_(d_0)) = \| nabla_Gamma phi \| \, wide d / d_0 = frac(1 + sigma^2, 1 + l^2 sigma^2) . $

The last ratio is bounded above and below by constants depending only on $ell$;
  Equation (5.1) therefore compares $A_(d_0) \, A_d \, A_chi$ without any bound for $Z$.

#thm([Lemma 5.5.])[
  (Local graph Sobolev inequality).  #emph[For a smooth function $omega$ supported over a fixed compact base
    patch, which may meet an inner face,
#[#set math.equation(numbering: n => "(5.18)")
 $ parallel omega parallel_(L^6 \( thin upright(d) Gamma \))^2 lt.eq
   C \( N \) integral_Gamma [\| nabla_Gamma omega \|^2 + \( 1 + cal(T) \) omega^2] thin upright(d) Gamma .
   $ <n3:apriori:sobolev-equation>]

]
] <n3:apriori:sobolev>

#proof[
  Extend the fixed base patch smoothly and embed a compact enlargement isometrically in Euclidean space by Nash’s
    embedding theorem #cite(label("Nash1956")) Theorem 2, p. 59.
    Its product with the vertical line gives an isometric Euclidean immersion of the graph.
    The second fundamental form of the base embedding is bounded,
    so its contribution to the graph mean curvature vector is bounded. The scalar mean curvature in the product is
  $ H_Gamma = frac(sqrt(D), l sqrt(1 + sigma^2)) ("tr"_(e_f^perp) H^f + d_0 H^f \( e_f \, e_f \)) . $
  The prefactor is bounded by $C \( N \)$, and $d_0 \/ sqrt(d) = sqrt(1 + l^2 sigma^2) \/ \( 1 + sigma^2 \) lt.eq
    e$. Coercivity therefore gives $\| bold(H)_Gamma \| lt.eq C \( N \) \( 1 + sqrt(cal(T)) \)$.
    This estimate involves controlled quadratic energy, not a pointwise bound for the Hessian.
  The ordinary Michael–Simon inequality #cite(label("MichaelSimon1973")),
    in the compact-support form stated in #cite(label("Simon2014")) Chapter 4, Section 5, Theorem 5.7, p. 98,
    gives after the boundary extension described below, for nonnegative $phi$,
  $ (integral_Gamma phi^(3 \/ 2) thin upright(d) Gamma)^(2 \/ 3) lt.eq
    C
    [integral_Gamma \( \| nabla_Gamma phi \| + \| bold(H)_Gamma \| phi \) thin upright(d) Gamma +
    integral_(partial Gamma) phi thin upright(d) A] . $
  One can obtain the boundary form directly from the compact-support version by smoothly extending each smooth
    graph across its boundary and cutting off on a collar tending to zero:
    the cutoff derivative integral converges to the boundary integral,
    and the added curvature integral tends to zero. This argument is applied to each smooth graph before the
    uniform estimate is taken. The only boundary in the support is an inner face,
    where $f$ is constant and $thin upright(d) A = thin upright(d) A_g$.
    Equation (5.10) and the fixed-$N$ graph comparisons bound its contribution by
  $ C \( N \) integral_Gamma \[ \( 1 + sqrt(cal(T)) \) phi + \| nabla_Gamma phi \| \] thin upright(d) Gamma . $
  Apply the resulting inequality to $phi = \| omega \|^4$. Cauchy–Schwarz bounds its right side by
  $ C \( N \) parallel omega parallel_6^3
    (integral_Gamma \[ \| nabla_Gamma omega \|^2 + \( 1 + cal(T) \) omega^2 \] thin upright(d) Gamma)^(1 \/ 2) . $
  The left side is $parallel omega parallel_6^4$; division, with the zero case separate,
    and squaring prove the assertion. ◻
]

To turn the integral bound into an upper bound, let $eta$ be a nonnegative cutoff over a fixed compact patch.
  For $k$ sufficiently large, independently of $R$ and the solution, test the first-stage divergence equation by

$ q = eta^2 e^(2 k Z) \/ L . $

The positive measure after cancellation of $L$ is $sqrt(D) thin upright(d) V_g$. The differentiated test is

$ d q = e^(2 k Z) / L \[ 2 eta thin d eta + eta^2 \( 2 k thin d Z - p_L thin d t \) \] . $

Its principal exponential contribution is $8 k eta^2 e^(2 k Z) \| d Z \|_(A_chi)^2$.
  The source is bounded below by $delta_0 cal(T) - Pi_N$ everywhere. Coercivity and $A_chi lt.eq A_d$ give

$ 4 p_L \| chevron.l d t \, d Z chevron.r_(A_chi) \| lt.eq 1 / 4 delta_0 cal(T) + C \( N \) \| d Z \|_(A_chi)^2 . $

Choose $k gt.eq k_(*) \( N \)$ so that the second term is absorbed by the principal contribution.
  The drift terms, with $\| K \( w \, dot.op \) \|_(A_chi) lt.eq \| K \|$, obey

$ 2 k \| chevron.l K \( w \, dot.op \) \, d Z chevron.r_(A_chi) \| & lt.eq k \| d Z \|_(A_chi)^2 + C k \| K \|^2 \,\
p_L \| chevron.l K \( w \, dot.op \) \, d t chevron.r_(A_chi) \| & lt.eq 1 / 4 delta_0 cal(T) + C \( N \) \| K \|^2 . $

The cutoff cross terms are handled by the same Cauchy inequalities,
  leaving $C \( N \) k e^(2 k Z) \( \| d eta \|_g^2 + eta^2 \)$.
  The penalty is bounded and contributes to this latter expression.
  Finally, Equation (5.14) before its last inequality gives $\| q \( V_lambda \)_nu \| lt.eq
  C eta^2 e^(2 k Z) sqrt(d) lt.eq C eta^2 e^(2 k Z)$. Converting to the ordinary graph yields

#[#set math.equation(numbering: n => "(5.19)")
 $ & integral_Gamma e^(2 k Z) eta^2 \( cal(T) + k \| nabla_Gamma Z \|^2 \) thin upright(d) Gamma\
 & quad lt.eq C \( N \) k integral_Gamma e^(2 k Z) \( eta^2 + \| d eta \|_g^2 \) thin upright(d) Gamma +
   C \( N \) integral_B e^(2 k Z) eta^2 thin upright(d) A_g . $ <n3:apriori:iteration-energy-boundary>]

Use the unweighted trace with $phi = e^(2 k Z) eta^2$. The boundary term is at most

$ C \( N \) integral_Gamma e^(2 k Z) [eta^2 \( 1 + sqrt(cal(T)) + k \| nabla_Gamma Z \| \) + eta \| d eta \|_g]
  thin upright(d) Gamma . $

Young’s inequality absorbs its $sqrt(cal(T))$ term into the $cal(T)$ integral and its $k \| nabla_Gamma
  Z \|$ term into the $k \| nabla_Gamma Z \|^2$ integral. The latter absorption costs $C \( N \) k eta^2
  e^(2 k Z)$, which has the allowed size. Hence

#[#set math.equation(numbering: n => "(5.20)")
 $ integral_Gamma e^(2 k Z) eta^2 \( cal(T) + k \| nabla_Gamma Z \|^2 \) thin upright(d) Gamma lt.eq
   C \( N \) k integral_Gamma e^(2 k Z) \( eta^2 + \| d eta \|_g^2 \) thin upright(d) Gamma \,
   $ <n3:apriori:iteration-energy>]

with constants independent of $k gt.eq k_(*)$.

Apply Lemma 25 to $omega = eta e^(k Z)$ and use (5.20). For nested base patches $U_r subset
  U_(r')$ and a cutoff satisfying $\| d eta \|_g lt.eq C \/ \( r' - r \)$, this gives

#[#set math.equation(numbering: n => "(5.21)")
 $ parallel e^Z parallel_(L^(6 k) \( Gamma \|_(U_r) \)) lt.eq
   [C \( N \) k^2 \( 1 + \( r' - r \)^(- 2) \)]^(1 \/ \( 2 k \)) parallel e^Z
   parallel_(L^(2 k) \( Gamma \|_(U_(r')) \)) . $ <n3:apriori:moser-step>]

Here $Gamma \|_U$ denotes the part of the graph projecting to $U$.
  Iterate with $k_j = 3^j k_(*)$ and radii decreasing geometrically from $r'$ to $r$.
  The sums $sum k_j^(- 1)$ and $sum j \/ k_j$ are finite. Taking the product in (5.21) therefore gives

#[#set math.equation(numbering: n => "(5.22)")
 $ S \( r \) := sup_(U_r) e^Z lt.eq C \( N \) \( r' - r \)^(- A \( N \)) parallel e^Z
   parallel_(L^(2 k_(*)) \( Gamma \|_(U_(r')) \)) . $ <n3:apriori:moser-high-norm>]

Take all these patches inside a slightly larger fixed patch on which (5.17) holds.
  Increasing $k_(*)$ to at least two, interpolation gives

$ parallel e^Z parallel_(2 k_(*)) lt.eq S \( r' \)^(1 - 1 \/ k_(*))
  (integral e^(2 Z) thin upright(d) Gamma)^(1 \/ \( 2 k_(*) \)) . $

Thus $S \( r \) lt.eq C \( N \) \( r' - r \)^(- A \( N \)) S \( r' \)^(1 - 1 \/ k_(*))$.
  For every $alpha > 0$, Young’s inequality makes this

#[#set math.equation(numbering: n => "(5.23)")
 $ S \( r \) lt.eq alpha S \( r' \) + C \( N \, alpha \) \( r' - r \)^(- A \( N \) k_(*)) .
   $ <n3:apriori:moser-interpolation>]

Choose radii increasing geometrically to a fixed outer radius $r_1$,
  and then choose $alpha < 2^(- A \( N \) k_(*) - 1)$. Iterating (5.23) has a convergent geometric sum.
  Its final remainder $alpha^j S \( r_j \)$ tends to zero, because each individual smooth solution is bounded on
  the closed outer patch. The resulting smaller-patch bound is independent of that individual supremum.
  A finite cover proves a uniform compact upper bound for $Z$, including at every inner face.

Beyond a fixed sphere containing the drift support, the equation is $"div" \( 4 u A_chi nabla Z \) = u Xi$,
  and $Xi > 0$ above $M_0$. At an interior maximum above $M_0$ its left side is nonpositive, because $d Z =
  0$ and $"Hess" Z lt.eq 0$. The outer boundary value is zero.
  The compact bound on that fixed sphere consequently extends the first-stage upper bound to the whole truncation.

=== 5.6 The remaining stages and the bounded-variable conclusion <the-remaining-stages-and-the-bounded-variable-conclusion>

In the second and third stages the drift is zero. Their source has the same high-$Z$ positivity as (5.13),
  with a uniform threshold for the bounded homotopy range. By Lemma 23, on an inner face

#[#set math.equation(numbering: n => "(5.24)")
 $ Z = t + 1 / 8 log \( 1 + l^2 sigma^2 \) lt.eq t + 1 / 8 log \( 1 + e^2 C_(*)^2 \/ tau^2 \) .
   $ <n3:apriori:high-boundary-t>]

Thus sufficiently high boundary $Z$ forces $j \( t \) = 1$.
  The prescribed boundary flux is then zero, since $lambda = 0$.
  At the face $A_chi nu = chi nu$, so this is exactly $partial_nu Z = 0$.
  The maximum principle excludes a high interior maximum, and the boundary point principle excludes a high maximum
  on a smooth inner face with this zero conormal derivative.
  Both principles are applied to the smooth individual solution on its finite domain;
  its coefficients are positive definite there. Locating the maximum requires no uniform ellipticity constant.
  The outer value is zero, so these two stages also have a uniform upper bound.

In the fourth stage $f = 0$ and $t = Z$. When the common source/flux scale is positive,
  the same maximum and boundary argument works with its positive high-level source.
  At scale zero the homogeneous mixed problem and the outer zero Dirichlet value give $Z = 0$.
  The upper bound is consequently uniform also as the scale tends to zero.

#thm([Proposition 5.6.])[
  (Bounds before regularity).  #emph[Fix the prepared data and $epsilon.alt > 0$.
    There are $N_0$ and $R_min \( N \) arrow.r oo$ such that, for each fixed $N gt.eq N_0$ and every $R gt.eq
    R_min \( N \)$, all smooth solutions of the four-stage homotopy with $t gt.eq - epsilon.alt$ satisfy
#[#set math.equation(numbering: n => "(5.25)")
 $ \| h \| lt.eq C_0 \, wide \| f \| lt.eq C_0 \/ tau \, wide - epsilon.alt lt.eq t lt.eq Z lt.eq C \( N \) \,
   wide \| nabla f \| lt.eq C \( N \) . $ <n3:apriori:bounded-variables>]

 The constants are uniform in $R$ and in the homotopy parameter.
   They include putative floor-contact solutions, which are then excluded by Proposition 20.
   The fixed signed slopes, the third-stage upper slopes, and the polynomial trace estimates are those of
   Lemmas 23 and 24.]
] <n3:apriori:bounds>

#proof[
  It remains to extract the bounds for the conformal variable and the gradient.
    Since $Z = t + log D \/ 8$ and $D gt.eq 1$, the floor gives $- epsilon.alt lt.eq t lt.eq Z$.
    The upper bound for $Z$ gives
  $ sigma^2 = frac(e^(8 \( Z - t \)) - 1, l^2) lt.eq ell^(- 2) #scale(x: 120%, y: 120%)[\(]
    e^(8 \( C \( N \) + epsilon.alt \)) - 1 #scale(x: 120%, y: 120%)[\)] . $
  This proves the asserted fixed-$N$ gradient bound. The height bounds are Lemma 16.
    The finite collection of sublevel and collar estimates and the polynomial absorption choose $N_0$ once.
    Enlarge $R_min \( N \)$ to include the outer estimates and all fixed compact patches used above.
    The next section derives Hessian and continuity estimates from these bounds and uses them to prove existence. ◻
]

== 6 Solving the three-dimensional boundary deformation <n3:existence:section>

The boundary estimates have bounded $f$, $Z$ and $D f$ for every admissible solution of the continuation
  equations. We now turn those bounds into existence. Two points need attention.
  The divergence equation for $Z$ contains $\| D^2 f \|^2$,
  so the bounded variables do not immediately give a classical elliptic estimate.
  Also, a compact solution map must be defined on an open set of arbitrary inputs,
  before imposing the admissibility inequality $t > - epsilon.alt$.

We address these points in order. A gradient-aligned scalar equation gives both continuity of $D
  f$ and a local integral bound for $D^2 f$. An oscillation argument then gives continuity of $Z$,
  after which ordinary boundary regularity applies. Separately,
  a scalar Dirichlet problem can be solved for every bounded input $Z$,
  even when its associated $t$ lies below the floor. Freezing that scalar solution in the divergence equation
  produces the compact map. The floor exclusion and the preceding estimates keep its fixed points inside the
  admissible set along the homotopy of Proposition 15.

All regularity constants in this section may depend on the fixed deformation parameters $N$,
  $epsilon.alt$ and $tau$. They are not used in any earlier argument requiring polynomial dependence on $N$.
  The estimates needed for exhaustion will be uniform in the outer radius $R$ at fixed $N$.

=== 6.1 From a bounded gradient to a Hessian integral bound <from-a-bounded-gradient-to-a-hessian-integral-bound>

The first equation has two equal transverse eigenvalues; its remaining eigenvector is the gradient of its
  solution. This structure gives a gradient estimate before the axial eigenvalue is continuous.
  The accompanying Hessian estimate will control the source in the second equation.

In the next two lemmas, $D$ denotes coordinate derivatives; it is not the scalar $1 +
  l^2 \| nabla f \|^2$ from the deformation. Balls are Euclidean coordinate balls,
  and a boundary ball is their intersection with one side of a smooth boundary.
  A family of boundary patches has bounded geometry here if normal-coordinate charts, their inverses,
  the metric and its inverse, and the derivatives through the orders used below have fixed bounds.
  We only apply the lemmas to smooth metrics and smooth boundaries.
  Their doubled metrics will be Lipschitz and smooth on each side of a single plane.

#thm([Lemma 6.1.])[
  (Axial gradient estimate).  #emph[Let $U'$ be compactly contained in an interior or boundary coordinate patch
    $U$ in dimension three. In a boundary patch assume that $z$ is constant on the boundary face.
    Suppose $z$ is $C^3$, up to that face when present, $\| nabla z \| lt.eq L$, and, almost everywhere,
#[#set math.equation(numbering: n => "(6.1)")
 $ A_chi : "Hess" z = G \, wide A_chi = I - \( 1 - chi \) e ⊗ e \, wide e = frac(nabla z, \| nabla z \|) \, wide
   0 < chi_0 lt.eq chi lt.eq 1 \, $ <n3:existence:axial-equation>]

 where $parallel G parallel_oo lt.eq Q$. At zero gradients any measurable unit axis for which the equation holds
   is allowed. Then there are $alpha in \( 0 \, 1 \)$ and $C < oo$, depending only on $chi_0$,
   the patch geometry and the separation of $U'$ from the other patch boundaries, such that
#[#set math.equation(numbering: n => "(6.2)")
 $ parallel nabla z parallel_(C^(0 \, alpha) \( U' \)) lt.eq C \( L + Q \) . $ <n3:existence:gradient-estimate>]

 For all sufficiently small coordinate balls centered in $U'$,
   with intersection with the domain understood at a boundary, one also has
#[#set math.equation(numbering: n => "(6.3)")
 $ integral_(B_r ∩ U) \| "Hess" z \|^2 thin upright(d) V_g lt.eq
   C \( L + Q \)^2 r^(1 + 2 alpha) . $ <n3:existence:hessian-morrey>]

 In particular, the constants are independent of continuity moduli of $chi$ and $G$.]
] <n3:existence:gradient>

#proof[
  We first obtain an $L^p$ Hessian estimate for some $p > 2$.
    A divergence identity then shows that a gradient nearly attaining its upper bound forces the solution to be
    nearly affine. The equation with a fixed gradient direction improves that affine approximation.
    The same steps survive reflection at a constant Dirichlet face, and iteration gives the stated estimate.
  ===== 6.1.1 A Cordes estimate above exponent two. <a-cordes-estimate-above-exponent-two.>
  For a Euclidean unit vector $e$,
  #[#set math.equation(numbering: n => "(6.4)")
   $ parallel I - A_chi parallel_F = 1 - chi lt.eq 1 - chi_0 . $ <n3:existence:cordes-defect>]
  For a compactly supported smooth function $v$, Plancherel’s theorem gives $parallel D^2 v parallel_2 =
    parallel Delta v parallel_2$. The Calderón–Zygmund operator taking $Delta v$ to the full array $D^2
    v$ is bounded on $L^p$, and interpolation makes its norm arbitrarily close to one as $p arrow.r 2$.
    Choose once and for all
  #[#set math.equation(numbering: n => "(6.5)")
   $ 2 < p_0 < 3 \, wide C_(p_0) \( 1 - chi_0 \/ 2 \) < 1 . $ <n3:existence:p-zero>]
  Rescale a metric-normalized patch until the coordinate principal matrix differs from its Euclidean axial matrix
    by less than $chi_0 \/ 2$ in Frobenius norm. Absorbing this difference in the Laplacian estimate,
    applying a cutoff, and using $parallel D v parallel_p lt.eq eta parallel D^2 v parallel_p +
    C_eta parallel v parallel_p$ gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ parallel D^2 v parallel_(L^(p_0) \( B_(1 \/ 2) \)) + parallel D v parallel_(L^(p_0) \( B_(1 \/ 2) \)) lt.eq
     C #scale(x: 120%, y: 120%)[\(] parallel v parallel_(L^(p_0) \( B_1 \)) + parallel A_chi :
     "Hess" v parallel_(L^(p_0) \( B_1 \)) #scale(x: 120%, y: 120%)[\)] . $ <n3:existence:local-cordes>]
  The Christoffel terms are bounded first-order terms in this estimate.
    The same argument applies when $v = z - L_0$ and $L_0$ is coordinate affine:
    its extra right side is bounded by $C parallel D g parallel_oo \| D L_0 \|$.
    The estimate uses bounded measurable principal coefficients only;
    the assumed $C^3$ regularity allows all of its applications without an approximation issue.
    The linear estimates just used are the ordinary Laplacian estimates;
    see #cite(label("GilbargTrudinger2001")) Chapters 7 and 9.
  ===== 6.1.2 A nearly maximal gradient forces small Hessian energy. <a-nearly-maximal-gradient-forces-small-hessian-energy.>
  The preceding estimate does not yet give continuity of $D z$.
    To gain continuity we use the fact that the axial direction is $nabla z$ itself.
    Put $H = "Hess" z$ and $P = nabla z$. Equation (6.1) gives the pointwise vector identity
  #[#set math.equation(numbering: n => "(6.7)")
   $ A_chi nabla frac(\| P \|^2, 2) - G P = \( H - Delta z thin g \) P . $ <n3:existence:gradient-flux>]
  Indeed $H P = \| P \| H \( e \, dot.op \)$ and $G = Delta z - \( 1 - chi \) H \( e \, e \)$,
    so the two axial terms cancel. The identity is also valid at $P = 0$.
    Taking the divergence of its right side, rather than differentiating $chi$, yields
  #[#set math.equation(numbering: n => "(6.8)")
   $ "div" (A_chi nabla frac(\| P \|^2, 2) - G P) = \| H \|^2 - \( Delta z \)^2 +
     "Ric" \( P \, P \) . $ <n3:existence:bochner-flux>]
  Choose $a_0 > 0$ so small that $\( 1 + a_0 \) \( 1 - chi_0 \)^2 < 1$. Young’s inequality and the equation show
  #[#set math.equation(numbering: n => "(6.9)")
   $ \| H \|^2 - \( Delta z \)^2 gt.eq c_0 \| H \|^2 - C_0 G^2 \, $ <n3:existence:positive-hessian>]
  where $c_0 > 0$ depends only on $chi_0$.
  Consider solutions normalized by $\| nabla z \| lt.eq 1$ on $B_1$.
    After making the scale small, let the forcing and the rescaled geometric errors have size at most $delta$.
    The nonnegative function $s = 1 - \| nabla z \|^2$ then satisfies
  #[#set math.equation(numbering: n => "(6.10)")
   $ "div" \( A_chi nabla s + 2 G nabla z \) lt.eq - 2 c_0 \| "Hess" z \|^2 + C delta $ <n3:existence:s-supersolution>]
  in a weak sense. In the Euclidean case the last term can be replaced by $C delta^2$.
    We allow $C delta$ to include the geometric errors.
  For the compactness step, suppose the normalized errors tend to zero in a sequence and $inf_(B_(1 \/ 2)) s
    arrow.r 0$. The inhomogeneous weak Harnack inequality, applied to Equation (6.10) after dropping its favorable
    Hessian term, gives $s arrow.r 0$ in measure on $B_(1 \/ 2)$.
    The boundedness $0 lt.eq s lt.eq 1$ also gives convergence in every finite $L^p$ norm there.
    To recover the Hessian information, take a cutoff $eta$ supported inside $B_(1 \/ 2)$ and use
    $eta^2 \( b - s \)_(+)$ in the weak supersolution inequality. Ellipticity and Young’s inequality give
  #[#set math.equation(numbering: n => "(6.11)")
   $ integral_({ s < b }) eta^2 \| D s \|^2 lt.eq C b^2 integral \| D eta \|^2 +
     o \( 1 \) $ <n3:existence:low-truncation>]
  for each fixed $b > 0$ as the errors vanish. The error fields in Equation (6.10) are bounded and tend to zero,
    so their products with $D s$ are absorbed in deriving this inequality.
    Equation (6.6) supplies a uniform $L^2$ bound for $D s$. Its integral over ${ s gt.eq
    b }$ tends to zero in $L^1$ by Cauchy’s inequality and convergence in measure.
    On ${ s < b }$ use Equation (6.11), then let $b arrow.b 0$. Thus $D s arrow.r 0$ locally in $L^1$.
    Testing Equation (6.8) with a nonnegative compact cutoff and using Equations (6.9) and (6.7) now gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ integral_(B_(1 \/ 4)) \| "Hess" z \|^2 arrow.r 0 . $ <n3:existence:hessian-flat-limit>]
  Uniform Lipschitz compactness implies that, after subtracting a constant and taking a subsequence,
    $z$ tends uniformly on a smaller ball to an affine function.
    Its slope has length one because $\| nabla z \| arrow.r 1$ in measure and the Hessians tend to zero.
  Consequently, for any prescribed sufficiently small $b_(*) > 0$ there are fixed $r_(*) in \( 0 \, 1 \/ 4 \)$,
    $k_(*) in \( r_(*) \, 1 \)$ and $delta_(*) > 0$ such that every normalized solution with errors at most
    $delta_(*)$ has one of the following properties:
  #[#set math.equation(numbering: n => "(6.13)")
   $ & sup_(B_(r_(*))) \| nabla z \| lt.eq k_(*) \; wide upright("or")\
 & sup_(B_(r_(*))) \| z - L_0 \| lt.eq b_(*) r_(*) \, wide 1 / 2 lt.eq \| D L_0 \| lt.eq
   2 . $ <n3:existence:drop-or-flat>]
  If this conclusion failed, solutions whose gradient suprema approach one and whose errors approach zero would
    contradict Equation (6.12). A gradient-drop constant can always be weakened toward one to ensure $k_(*) > r_(*)$.
  ===== 6.1.3 Regularity when the direction is fixed. <regularity-when-the-direction-is-fixed.>
  The second alternative in (6.13) supplies a nonzero affine slope.
    The comparison equation for that slope has a fixed direction,
    although its axial coefficient remains merely measurable. Let $e_0$ be a Euclidean unit vector and suppose
  #[#set math.equation(numbering: n => "(6.14)")
   $ Delta_(e_0^perp) Y_0 + chi \( x \) partial_(e_0 e_0) Y_0 = 0 quad upright("in ") B_(3 \/ 4) \, wide
     parallel Y_0 parallel_(W^(2 \, 2) \( B_(3 \/ 4) \)) lt.eq C_1 . $ <n3:existence:fixed-axis>]
  The derivative $v = partial_(e_0) Y_0$ belongs to $W^(1 \, 2)$ and, in distributions, satisfies
  #[#set math.equation(numbering: n => "(6.15)")
   $ Delta_(e_0^perp) v + partial_(e_0) \( chi thin partial_(e_0) v \) =
     0 . $ <n3:existence:axial-derivative-divergence>]
  This follows by differentiating the distribution $chi partial_(e_0) v$ as a whole.
    It does not assume a derivative of $chi$ exists as a function.
    De Giorgi’s estimate for this uniformly elliptic divergence equation, followed by Caccioppoli applied to $v -
    v \( x_0 \)$, gives an exponent $alpha_1 in \( 0 \, 1 \)$ and
  #[#set math.equation(numbering: n => "(6.16)")
   $ \[ v \]_(C^(0 \, alpha_1) \( B_(1 \/ 2) \)) lt.eq C \, wide integral_(B_r \( x_0 \)) \| D v \|^2 lt.eq
     C r^(1 + 2 alpha_1) $ <n3:existence:axial-derivative-morrey>]
  for balls in a smaller fixed interior region. These are the scalar divergence estimates with ellipticity
    $chi_0$; see #cite(label("GilbargTrudinger2001")) Chapter 8.
  All components of $D Y_0$, not only $v$, are controlled by this estimate. In fact,
  #[#set math.equation(numbering: n => "(6.17)")
   $ Delta Y_0 = f_0 \, wide f_0 = \( 1 - chi \) partial_(e_0) v \, wide integral_(B_r \( x_0 \)) \| f_0 \| lt.eq
     C r^(2 + alpha_1) . $ <n3:existence:poisson-source>]
  The last inequality follows from Cauchy’s inequality and Equation (6.16).
    Take the Newton potential of $f_0$ restricted to a slightly larger interior ball;
    its difference from $Y_0$ is harmonic in that ball. For two points at distance $h$,
    the contribution to the difference of gradient potentials from annuli of radius $r lt.eq
    2 h$ is bounded by $C sum r^(alpha_1) lt.eq C h^(alpha_1)$.
    On the remaining annuli the difference of gradient kernels is at most $C h r^(- 3)$, so their contribution is
  #[#set math.equation(numbering: n => "(6.18)")
   $ C h sum_(r gt.eq 2 h) r^(alpha_1 - 1) lt.eq C h^(alpha_1) . $ <n3:existence:potential-annuli>]
  The harmonic remainder has its usual interior derivative estimates. Therefore, decreasing the interior ball if needed,
  #[#set math.equation(numbering: n => "(6.19)")
   $ parallel Y_0 parallel_(C^(1 \, alpha_1) \( B_(1 \/ 4) \)) lt.eq C . $ <n3:existence:model-gradient>]
  ===== 6.1.4 Improving the affine approximation. <improving-the-affine-approximation.>
  We now compare the original equation with the fixed-direction equation.
    Assume that, for a coordinate-affine function $L_0$,
  #[#set math.equation(numbering: n => "(6.20)")
   $ parallel z - L_0 parallel_(L^oo \( B_1 \)) lt.eq b \, wide 1 / 4 lt.eq \| D L_0 \| lt.eq 4 \,
     wide \| nabla z \| lt.eq 8 . $ <n3:existence:flat-input>]
  Let the forcing and the first-derivative metric errors be at most $b delta$.
    For $Y = \( z - L_0 \) \/ b$, Equation (6.6) on fixed nested balls gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ parallel Y parallel_(W^(2 \, p_0) \( B_(7 \/ 8) \)) lt.eq C . $ <n3:existence:normalized-residual>]
  In particular, this estimate does not require a bound for $D Y$ in the supremum norm.
    Since $D z = D L_0 + b D Y$, the variable axis converges in measure to $e_0 =
    D L_0 \/ \| D L_0 \|$ as $b arrow.r 0$. More quantitatively,
    the coefficient error $E$ caused by replacing this axis by $e_0$ is bounded and satisfies
  #[#set math.equation(numbering: n => "(6.22)")
   $ parallel E parallel_(L^q \( B_(7 \/ 8) \)) lt.eq C b^theta.alt + C b delta \, wide q =
     frac(2 p_0, p_0 - 2) \, wide theta.alt = frac(p_0 - 2, 2) > 0 . $ <n3:existence:axis-error>]
  Indeed the unit-direction map is Lipschitz where $\| b D Y \| < \| D L_0 \| \/ 2$,
    and elsewhere its difference is bounded; the $L^(p_0)$ bound in Equation (6.21) and interpolation give
    Equation (6.22). The same estimate includes the metric principal-part error.
    Hölder’s inequality, with $1 \/ 2 = 1 \/ q + 1 \/ p_0$, shows that
  #[#set math.equation(numbering: n => "(6.23)")
   $ parallel \[ I - \( 1 - chi \) e_0 ⊗ e_0 \] : D^2 Y #scale(x: 120%, y: 120%)[parallel]_(L^2 \( B_(3 \/ 4) \))
     lt.eq C \( b^theta.alt + delta \) . $ <n3:existence:small-fixed-axis-source>]
  Solve for a zero-Dirichlet correction $w$ on $B_(3 \/ 4)$ with the left side of Equation (6.23) as its source.
    This does not require a nondivergence Green function. The convex Dirichlet Hessian inequality $parallel D^2 w
    parallel_2 lt.eq parallel Delta w parallel_2$ and Equation (6.4) make the Laplace solution operator a
    contraction on $W^(2 \, 2) ∩ W_0^(1 \, 2)$. Hence
  #[#set math.equation(numbering: n => "(6.24)")
   $ parallel w parallel_(W^(2 \, 2) \( B_(3 \/ 4) \)) lt.eq C chi_0^(- 1) \( b^theta.alt + delta \) \, wide
     parallel w parallel_oo lt.eq C \( b^theta.alt + delta \) . $ <n3:existence:fixed-axis-correction>]
  The last implication uses $W^(2 \, 2) arrow.r.hook C^(0 \, 1 \/ 2)$ in dimension three.
    The convex Hessian inequality is the Miranda–Talenti estimate #cite(label("Talenti1965")) Section 2,
    Theorem 3, p. 297. Now $Y_0 = Y - w$ satisfies Equation (6.14) with a uniform $W^(2 \, 2)$ bound.
  Choose $0 < alpha_2 < alpha_1$ and then a fixed $lambda_0 in \( 0 \, 1 \/ 4 \)$ such that $C
    lambda_0^(1 + alpha_1) lt.eq lambda_0^(1 + alpha_2) \/ 4$ in Equation (6.19).
    By first taking $delta$ small and then $b lt.eq b_(*)$ small,
    Equation (6.24) has supremum norm at most $lambda_0^(1 + alpha_2) \/ 4$.
    Taylor expansion of $Y_0$ at the center therefore gives an affine function $L_1$ with
  #[#set math.equation(numbering: n => "(6.25)")
   $ sup_(B_(lambda_0)) \| z - L_1 \| lt.eq b lambda_0^(1 + alpha_2) \, wide \| D L_1 - D L_0 \| lt.eq
     C b . $ <n3:existence:improved-flatness>]
  All constants are uniform in the slope range in Equation (6.20).
  ===== 6.1.5 Reflection at a constant Dirichlet face. <reflection-at-a-constant-dirichlet-face.>
  Subtract the boundary value and use normal coordinates with the face given by $x_3 = 0$.
    Reflect the metric across this plane and reflect $z$ oddly.
    Tangential derivatives of $z$ vanish on the face, so the extension is $C^1$.
    There is no distributional Hessian atom. The doubled metric is Lipschitz;
    the coefficient and lower-order estimates in Equation (6.6) hold with its essential first-derivative bound.
  The flux in Equation (6.7) may have a normal jump. On either side of the face its normal trace is
  #[#set math.equation(numbering: n => "(6.26)")
   $ #scale(x: 120%, y: 120%)[\(] \( "Hess" z - Delta z thin g \) nabla z
     #scale(x: 120%, y: 120%)[\)]_nu = - \( "tr"_T "Hess" z \) thin partial_nu z . $ <n3:existence:reflected-flux>]
  Because the boundary value is constant, $"tr"_T "Hess" z$ is its mean-curvature coefficient times $partial_nu
    z$. The jump is therefore bounded by $C \| upright("II") \| thin \| nabla z \|^2$.
    At scale $r$ it is a bounded plane density of size $O \( r \)$.
    Write the plane density and flux after multiplication by the reflected coordinate volume density,
    so that the following divergence is Euclidean. Such a signed density $a \( x' \) thin
    delta_({ x_3 = 0 })$ is the divergence of the bounded field $a \( x' \) upright(bold(1))_({ x_3 > 0 })
    partial_3$. Thus its negative part is another small divergence error in Equation (6.10).
    Smooth-side curvature errors are $O \( r^2 \)$. Weak Harnack and the low-truncation argument remain valid,
    and the flatness comparison uses the same Lipschitz metric estimates.
    This proves all the preceding alternatives for balls meeting the reflection plane as well.
  ===== 6.1.6 Iteration and the required Hessian bound. <iteration-and-the-required-hessian-bound.>
  There are now two ways to improve the solution on a smaller ball:
    its gradient bound decreases, or its approximation by a nonconstant affine function improves.
    We choose the constants once so that either route can be repeated.
    Keep $alpha_2 \, lambda_0$ from the affine improvement fixed.
    Choose $b_(*)$ sufficiently small that $C b_(*) \/ \( 1 - lambda_0^(alpha_2) \) < 1 \/ 4$,
    with $C$ the slope-increment constant in Equation (6.25).
    Then choose $r_(*) \, k_(*) \, delta_(*)$ in Equation (6.13) for this fixed $b_(*)$.
    Normalize initially by a fixed multiple of $L + Q$ and choose a uniformly small initial radius so that the
    metric and forcing errors satisfy all the preceding smallness conditions.
    If the first case of Equation (6.13) holds, rescale the ball by $r_(*)$ and the gradient bound by $k_(*)$.
    The normalized forcing decreases by $r_(*) \/ k_(*) < 1$.
    Repeating this step either continues forever or reaches the second case.
    In the former case the gradient decays with exponent $log k_(*) \/ log r_(*)$.
    In the latter case apply Equation (6.25) successively, retaining exponent $alpha_2$.
    At each affine step, rescale $z$ by dividing by the spatial scale, subtracting only an additive constant;
    this preserves its gradient bound. Its slope changes have total size at most $C
    b_(*) \/ \( 1 - lambda_0^(alpha_2) \)$, so the slopes remain in $\[ 1 \/ 4 \, 4 \]$.
    At the $j$th step the error size is $b_(*) lambda_0^(j alpha_2)$,
    while the normalized forcing and metric first-derivative errors have size $O \( lambda_0^j \)$.
    Since $alpha_2 < 1$, their ratio to the error size only decreases.
    This justifies every subsequent application of the improvement lemma. To combine the two branches, now choose
  #[#set math.equation(numbering: n => "(6.27)")
   $ 0 < alpha lt.eq min {alpha_2 \, frac(log k_(*), log r_(*))} \, wide
     alpha < 1 . $ <n3:existence:iteration-exponent>]
  At every center we have consequently obtained affine functions $L_(x \, r)$ satisfying
  #[#set math.equation(numbering: n => "(6.28)")
   $ sup_(B_r \( x \)) \| z - L_(x \, r) \| lt.eq C \( L + Q \) r^(1 + alpha) . $ <n3:existence:campanato-affine>]
  The slope differences at consecutive radii are bounded by $C \( L + Q \) r^alpha$;
    comparing the affine approximations on overlapping balls gives Equation (6.2).
    This also identifies their limiting slope with $D z$, since $z$ is $C^1$.
    The reflected version gives the estimate up to a boundary.
  Finally apply the $L^2$ version of Equation (6.6) to $z - L_(x \, 2 r)$ after rescaling.
    The affine error contributes $C \( L + Q \) r^(1 \/ 2 + alpha)$ to the Hessian $L^2$ norm;
    the bounded forcing and affine Christoffel term contribute $C \( L + Q \) r^(3 \/ 2)$.
    Squaring and using $alpha < 1$ proves Equation (6.3). ◻
]

=== 6.2 Continuity in the presence of a quadratic source <continuity-in-the-presence-of-a-quadratic-source>

The preceding lemma controls $\| D^2 f \|^2$ by its mass on small balls.
  We next show why that control suffices for the $Z$-equation.
  An exponential change of variable absorbs its quadratic gradient term.
  The remaining measure has a small Green potential, and weak Harnack then decreases the oscillation.
  We allow a measure source so that the argument also covers the inner boundary after reflection.

#thm([Lemma 6.2.])[
  (Natural growth with a measure source).  #emph[ Let $n in { 3 \,
    4 }$ and let $Z in L^oo ∩ W_(upright("loc"))^(1 \, 2)$ on a ball in $bb(R)^n$.
    Fix a Borel representative with $\| Z \| lt.eq M$ for products with measures. Suppose, in distributions, that
#[#set math.equation(numbering: n => "(6.29)")
 $ "div" \( a D Z + b \) = e \, $ <n3:existence:natural-equation>]

 where $a$ is measurable and symmetric, $lambda I lt.eq a lt.eq Lambda I$ for $0 < lambda lt.eq Lambda$,
   $\| b \| lt.eq B$, and $e$ is a signed measure satisfying
#[#set math.equation(numbering: n => "(6.30)")
 $ \| e \| lt.eq C_0 \( 1 + \| D Z \|^2 \) thin upright(d) x + mu \, wide mu \( B_r \( x \) \) lt.eq
   C_mu r^(n - 2 + beta) \, wide beta > 0 . $ <n3:existence:natural-source>]

 Here $mu$ is a positive measure, and its bound holds at every center and all sufficiently small radii in a larger
   patch. Assume the weak exponential product rule (6.31) below is valid with the specified representative.
   This is true, in particular, for a function continuous across a flat interface and smooth on its two closed
   sides, when the equation includes the normal-flux jump. Then the Sobolev class of $Z$ has a Hölder
   representative on smaller balls, with constants depending only on the displayed bounds and patch separation.
   If $Z$ is already continuous, this is a uniform estimate for that function.
   The conclusion applies up to a smooth face whenever its reflected equation satisfies these hypotheses.]
] <n3:existence:natural-growth>

#proof[
  The proof has two steps. An exponential change absorbs the quadratic term in $D Z$;
    a small potential correction then permits weak Harnack to decrease the essential oscillation.
    Both steps work in the two dimensions stated in the lemma.
    Restricting all radii to at most one, we may replace $beta$ by $min { beta \, 1 }$ in the measure bound.
    We retain the symbol $beta$ for this positive reduced exponent;
    this also makes the small-scale mollification bound below immediate.
  Write $cal(L) = - "div" \( a D \)$ and, for $s in { - 1 \, 1 }$, set $V_s = e^(s k Z)$. The assumed product rule is
  #[#set math.equation(numbering: n => "(6.31)")
   $ cal(L) V_s = "div" \( s k V_s b \) - s k V_s e - k^2 V_s #scale(x: 120%, y: 120%)[\(] a D Z dot.op D Z +
     b dot.op D Z #scale(x: 120%, y: 120%)[\)] . $ <n3:existence:exponential-identity>]
  The term $V_s e$ uses the fixed bounded representative. For a continuous piecewise smooth function the identity
    follows by integration on the two sides; its common trace multiplies the flux jump.
    Choose $k gt.eq max { 1 \, 4 C_0 \/ lambda }$ and use $B \| D Z \| lt.eq \( lambda \/ 2 \) \| D Z \|^2 +
    B^2 \/ \( 2 lambda \)$. The gradient-square term from $e$ is absorbed by the negative quadratic term for both
    signs. Since $e^(- k M) lt.eq V_s lt.eq e^(k M)$, this gives
  #[#set math.equation(numbering: n => "(6.32)")
   $ cal(L) V_s lt.eq "div" F_s + nu \, wide \| F_s \| lt.eq C \, wide nu = C \( thin upright(d) x + mu \) gt.eq
     0 . $ <n3:existence:exponential-subsolution>]
  Thus no small-ball estimate for $\| D Z \|^2$ is needed.
  On a ball $B_R$ in the smaller patch solve the zero-Dirichlet problem $cal(L) w_s = "div" F_s + nu$.
    For the bounded vector source, the scalar bounded-solution estimate with any fixed $p > n$ gives
  $ parallel w_(F_s) parallel_oo lt.eq C R^(1 - n \/ p) parallel F_s parallel_(L^p \( B_R \)) lt.eq C R \; $
  this is the scaled divergence-source estimate of #cite(label("LittmanStampacchiaWeinberger1963")) Theorem 2.6,
    p. 50. For the positive measure source, extend $a$ elliptically to $B_(2 R)$.
    The scalar Green comparison theorem #cite(label("LittmanStampacchiaWeinberger1963")) Theorem 7.1 and Remark 2,
    p. 66, and domain monotonicity, give
  $ 0 lt.eq cal(G)_(B_R) \( x \, y \) lt.eq cal(G)_(B_(2 R)) \( x \, y \) lt.eq C \| x - y \|^(2 - n) \, wide x \,
    y in B_R . $
  Using $B_(2 R)$ keeps both points in a fixed compact interior region of the comparison ball after rescaling.
    Dyadic annuli and (6.30) imply
  #[#set math.equation(numbering: n => "(6.33)")
   $ sup_(x in B_R) integral_(B_R) cal(G)_(B_R) \( x \, y \) thin upright(d) nu \( y \) & lt.eq
     C sum_(j gt.eq 0) \( 2^(- j) R \)^(2 - n) nu \( B_(2^(1 - j) R) \( x \) \)\
 & lt.eq C \( R^2 + R^beta \) . $ <n3:existence:green-morrey-correction>]
  All balls used in this estimate lie in the chosen larger patch.
  This potential also gives an energy solution. Mollify the restriction of $nu$ to $B_R$ and restrict the
    resulting positive density again to $B_R$. Its ball-growth bounds are uniform:
    above the smoothing scale use an enlarged ball, and below it use the mollified density bound.
    The variational solutions have the preceding supremum bound and obey
  $ lambda integral \| D w_j \|^2 lt.eq integral w_j thin upright(d) nu_j lt.eq
    parallel w_j parallel_oo nu_j \( B_R \) . $
  Weak compactness in $W_0^(1 \, 2)$ and distributional convergence produce the desired measure-source solution.
    Adding the vector-source solution, and taking $R lt.eq 1$, yields
  #[#set math.equation(numbering: n => "(6.34)")
   $ parallel w_s parallel_oo lt.eq epsilon_R \, wide epsilon_R = C \( R + R^beta \) . $ <n3:existence:correction-size>]
  All extrema in the rest of this proof are essential extrema.
    Put $M_R = "ess sup"_(B_R) Z$ and $m_R = "ess inf"_(B_R) Z$. The functions
  #[#set math.equation(numbering: n => "(6.35)")
   $ H_(+) = e^(k M_R) - e^(k Z) + w_(+) + epsilon_R \, wide H_(-) = e^(- k m_R) - e^(- k Z) + w_(-) +
     epsilon_R $ <n3:existence:exponential-deficits>]
  are nonnegative almost everywhere and satisfy $cal(L) H_plus.minus gt.eq 0$.
    At least half of $B_(R \/ 2)$ satisfies either $Z lt.eq \( M_R + m_R \) \/ 2$ or $Z gt.eq \( M_R + m_R \) \/
    2$. On the first set the positive exponential deficit is at least $c \( M_R - m_R \)$;
    on the second set the negative exponential deficit has that lower bound.
    Their derivatives are bounded above and away from zero on $\[ - M \, M \]$.
    Weak Harnack for the corresponding $H_plus.minus$ therefore either lowers the essential supremum or raises the
    essential infimum on $B_(R \/ 4)$ by at least $c' \( M_R - m_R \) - C epsilon_R$. Hence
  #[#set math.equation(numbering: n => "(6.36)")
   $ "ess osc"_(B_(R \/ 4)) Z lt.eq \( 1 - c' \) "ess osc"_(B_R) Z +
     C \( R + R^beta \) . $ <n3:existence:oscillation-contraction>]
  Choose a positive exponent smaller than $min { 1 \, beta }$ and than $- log \( 1 - c' \) \/ log 4$.
    Iteration gives an essential oscillation bound $C r^gamma$ at every center in a smaller patch.
    The averages of $Z$ on balls centered at $x$ are consequently Cauchy as their radii decrease to zero.
    Their limit defines $Z^(*) \( x \)$ at every center; comparison on overlapping balls gives $\| Z^(*) \( x \) -
    Z^(*) \( y \) \| lt.eq C \| x - y \|^gamma$. Lebesgue differentiation identifies $Z^(*) =
    Z$ almost everywhere. This proves the representative assertion.
    For continuous $Z$ the representatives agree everywhere. No conclusion about arbitrary values of the initially
    chosen Borel representative on a null set is required.
  For the boundary application, flatten a face and set $S = "diag" \( 1 \, dots.h \, 1 \, - 1 \)$.
    An even extension uses $a_(-) = S a_(+) S$ and $b_(-) = S b_(+)$;
    its plane source is twice the prescribed total normal flux.
    An odd extension after subtracting a constant Dirichlet value uses $a_(-) = S a_(+) S$, $b_(-) = -
    S b_(+)$ and the sign-reflected bulk source; its normal flux is continuous.
    The coordinate volume density is included in these coefficients.
    For the smooth reflected solutions used here the product rule holds,
    and a bounded plane density has ball mass $O \( r^(n - 1) \)$, giving $beta = 1$ for that part of the measure.
    This verifies the boundary clause whenever the remaining reflected measure has the stated growth. ◻
]

=== 6.3 Boundary regularity for the coupled equations <boundary-regularity-for-the-coupled-equations>

We return to the deformation. Its regularity must be obtained in the order $D f$, then $Z$, then $D^2 f$,
  and finally $D Z$. In the last step, small oscillation of $Z$ absorbs its quadratic gradient term.
  This order avoids assuming the Hessian estimate that the second equation still needs.

#thm([Proposition 6.3.])[
  (Classical bounds for bounded-variable solutions).  #emph[Fix the deformation parameters and assume the bounds
    in Proposition 26. Every smooth solution in the homotopy of Proposition 15, with $t gt.eq - epsilon.alt$,
    has uniform local classical estimates of every finite order, up to the inner and outer faces.
    At fixed $N$ the constants are independent of the homotopy parameter and of all sufficiently large outer radii
    $R$. The local patches can be chosen with a uniform positive radius throughout the end.]
] <n3:existence:classical-bounds>

#proof[
  #emph[First, control $D f$ and the Hessian measure.] Proposition 26 bounds $f \, Z \,
    t$ and $sigma = \| nabla f \|$. At fixed parameters this bounds $u \, l \,
    D$ above and away from zero and gives $chi gt.eq chi_0 > 0$.
    After dividing the scalar trace equation by $l \/ sqrt(D)$, its right side is
  #[#set math.equation(numbering: n => "(6.37)")
   $ G_f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] F_s - "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] .
     $ <n3:existence:normalized-f-source>]
  It is bounded throughout the homotopy, including its added collar terms.
    Lemma 27 therefore gives a uniform $C^(1 \, alpha)$ estimate for $f$ and
  #[#set math.equation(numbering: n => "(6.38)")
   $ integral_(B_r) \| "Hess" f \|^2 lt.eq C r^(1 + 2 alpha) $ <n3:existence:f-morrey-application>]
  on the uniform patches, including boundary patches where $f$ is constant.
  #emph[Second, control the oscillation of $Z$.] After multiplication by the Riemannian volume density,
    the second equation has coordinate principal coefficients $a^(i j) = 4 sqrt(det g) thin u A_chi^(i j)$,
    a bounded flux vector $b$, and a source bounded in absolute value by
  #[#set math.equation(numbering: n => "(6.39)")
   $ C #scale(x: 120%, y: 120%)[\(] 1 + \| D Z \|^2 + \| D^2 f \|^2 #scale(x: 120%, y: 120%)[\)] .
     $ <n3:existence:Z-quadratic-source>]
  Indeed $t$ is a smooth function of $x \, Z \, D f$ on the bounded variable range.
    Thus $D t$ is a bounded linear combination of $D Z \, D^2 f$ and fixed smooth terms;
    the expression $cal(T)$ is quadratic in these quantities. All other source terms have lower order.
    The same volume density is included in $b \, e$; it is smooth and bounded above and away from zero on the
    chosen patches, so it preserves these bounds and uniform ellipticity.
    The prescribed conormal flux at the inner boundary is bounded. At the outer face $Z = 0$.
    Apply Lemma 28, with $mu = C \| D^2 f \|^2 thin upright(d) x$ and the bounded reflected plane density.
    Equation (6.38) supplies its measure growth hypothesis. We obtain a uniform positive Hölder exponent for $Z$.
  #emph[Third, gain two derivatives of $f$.] The coefficients and source of the scalar equation are smooth
    functions of $x \, Z \, D f$ on the bounded range. They are therefore Hölder now that $Z$ and $D
    f$ are Hölder. Interior and constant-Dirichlet boundary Schauder estimates give $f in
    C^(2 \, theta)$ for a uniform $theta > 0$. Expand the $Z$-equation in nondivergence form.
    Its principal coefficients are uniformly elliptic and $C^(0 \, theta)$,
    while its right side is bounded by $C \( 1 + \| D Z \|^2 \)$. On an inner face $D f$ is normal.
    Therefore $A_chi$ has zero normal–tangential components there and normal eigenvalue $chi$.
    Its boundary equation solves for
  #[#set math.equation(numbering: n => "(6.40)")
   $ partial_nu Z = cal(H)_s \( x \, Z \, f \, D f \) \, $ <n3:existence:ordinary-normal-condition>]
  where $cal(H)_s$ is smooth on a fixed bounded variable range.
    Its derivatives with respect to $x$ and its displayed scalar arguments are bounded at fixed parameters.
    The outer condition remains constant Dirichlet. These are different, disjoint smooth boundary components;
    there is no change of boundary condition along an edge or a corner.
  #emph[Fourth, absorb the quadratic growth and control $D Z$.] Continuity of $Z$ supplies the small factor needed
    for this step. Fix $p > 3$. The linear local $W^(2 \, p)$ estimate for the leading nondivergence operator with
    Equation (6.40) or outer Dirichlet data has the form, on fixed nested patches $U_x subset.double V_x$,
  #[#set math.equation(numbering: n => "(6.41)")
   $ parallel Z parallel_(W^(2 \, p) \( U_x \)) lt.eq
     C (1 + parallel D Z parallel_(L^(2 p) \( V_x \))^2 + parallel Z parallel_(W^(1 \, p) \( V_x \))) .
     $ <n3:existence:Wp-pre-absorption>]
  Here the boundary norm is controlled by
  #[#set math.equation(numbering: n => "(6.42)")
   $ parallel cal(H)_s \( x \, Z \, f \, D f \) parallel_(W^(1 - 1 \/ p \, p) \( partial V_x \)) lt.eq
     C #scale(x: 120%, y: 120%)[\(] 1 + parallel Z parallel_(W^(1 \, p) \( V_x^(+) \))
     #scale(x: 120%, y: 120%)[\)] \, $ <n3:existence:boundary-trace-composition>]
  using trace and composition after extending its smooth expression through the collar.
    The derivatives of $f \, D f$ entering this extension are already bounded.
    The leading matrix has a fixed Hölder modulus, so its small oscillation on sufficiently small patches permits
    the usual freezing and absorption in the linear estimate.
    The normal boundary operator is uniformly oblique and satisfies the complementing condition.
    The general boundary theory is developed in the two papers of Agmon,
    Douglis and Nirenberg #cite(label("AgmonDouglisNirenberg1959")) #cite(label("AgmonDouglisNirenberg1964")).
    The scalar estimate used here is #cite(label("AgmonDouglisNirenberg1959")) Theorem 15.2, estimate (15.5), p. 704.
  The outer patches $U_x \, V_x \, V_x^(+)$ and the constant in (6.41) are fixed before the next radius $h$ is
    chosen; only the interpolation is localized further. Let $\[ Z \]_(C^(0 \, theta)) lt.eq H_0$.
    On balls or half-balls of radius $h$, the scaled Gagliardo–Nirenberg inequality,
    applied after subtracting a constant, gives
  #[#set math.equation(numbering: n => "(6.43)")
   $ parallel D Z parallel_(L^(2 p) \( B_h \))^2 & lt.eq C "osc"_(B_h) Z thin parallel D^2 Z parallel_(L^p \( B_h \))\
 & quad + C h^(3 \/ p - 2) \( "osc"_(B_h) Z \)^2 . $ <n3:existence:small-oscillation-GN>]
  One can use a bounded extension operator on a half-ball; its constants are uniform in the boundary charts.
    Here the interpolation exponents are spatial dimension $3$, derivative orders $2$ and $1$,
    top-derivative exponent $p > 3$, height exponent $oo$, and interpolation parameter $1 \/ 2$;
    the resulting gradient exponent is $2 p$. This is #cite(label("Nirenberg1959")) Lecture II, Equation (2.2),
    p. 125, and Remark 5, p. 126, including the lower-order term on a bounded patch.
    Subtracting a constant gives the oscillation, rather than the absolute height,
    as the coefficient of $parallel D^2 Z parallel_p$. Cover $V_x$ by radius-$h$ patches of bounded overlap and
    take the $ell^p$ sum of Equation (6.43). It follows that
  #[#set math.equation(numbering: n => "(6.44)")
   $ parallel D Z parallel_(L^(2 p) \( V_x \))^2 lt.eq C H_0 h^theta parallel D^2 Z parallel_(L^p \( V_x^(+) \)) +
     C H_0^2 h^(2 theta - 2) . $ <n3:existence:global-local-GN>]
  Also, for any $eta > 0$, $parallel Z parallel_(W^(1 \, p) \( V_x \)) lt.eq
    eta parallel D^2 Z parallel_(L^p \( V_x^(+) \)) + C_eta$.
    Each enlarged patch $V_x^(+)$ is covered by a bounded number of the patches $U_y$, independently of $R$.
    Set $S = sup_y parallel Z parallel_(W^(2 \, p) \( U_y \))$, finite for each smooth finite-domain solution.
    Equations (6.41) and (6.44) give
  #[#set math.equation(numbering: n => "(6.45)")
   $ S lt.eq C \( H_0 h^theta + eta \) S + C \( h \, eta \) . $ <n3:existence:uniform-local-absorption>]
  Choose $h$ and then $eta$ so the first coefficient is less than $1 \/ 2$.
    We obtain a uniform $W^(2 \, p)$ bound and hence a $C^(1 \, 1 - 3 \/ p)$ bound for $Z$.
  #emph[Finally, obtain all remaining derivatives.] The bounds $f in C^(2 \, theta)$ and $Z in
    C^(1 \, 1 - 3 \/ p)$ make the expanded $Z$ source Hölder and its normal datum
    $cal(H)_s \( x \, Z \, f \, D f \)$ of class $C^(1 \, theta')$, after reducing the positive exponent.
    Its principal coefficients are Hölder as well, so both the interior and normal-boundary Schauder estimates
    apply. First the nondivergence $Z$-equation has Hölder source, giving $Z in C^(2 \, theta')$;
    the scalar $f$-equation then gains another derivative. Repetition gives every finite classical derivative
    supported by the smooth data. The same procedure holds on the uniform unit patches of the asymptotic end and
    on the large outer spheres, whose normal-coordinate constants are uniform.
    This proves the asserted independence of $R$. The prepared background has end symbol bounds of every order by
    Definition 2; no regularity constant here requires additional derivatives of the original weak-decay data. ◻
]

=== 6.4 Solving the scalar equation for arbitrary inputs <solving-the-scalar-equation-for-arbitrary-inputs>

The previous proposition estimates solutions of the coupled system.
  To construct such a solution by degree, we first need an operator defined on all of a Banach space of trial
  functions $Z$. In particular, $t gt.eq - epsilon.alt$ cannot be assumed at this stage.
  The scalar equation remains solvable because its loss of axial ellipticity at large slope is at most
  reciprocal-linear.

#thm([Lemma 6.4.])[
  (Scalar solve for unrestricted bounded inputs).  #emph[Fix $N gt.eq 4$, $tau > 0$,
    a finite smooth truncation $Omega_R$, and a homotopy parameter $s in \[ 0 \, 4 \]$.
    For every $Z in C^(1 \, b) \( overline(Omega_R) \)$, $0 < b < 1$, the scalar trace equation of Proposition 15,
    with its prescribed componentwise constant Dirichlet values for $f$, has a unique solution.
    It lies in $C^(3 \, b)$ and is smooth to the extent allowed by the input. The solution operator
#[#set math.equation(numbering: n => "(6.46)")
 $ f = cal(S)_s \( Z \) $ <n3:existence:scalar-operator>]

 is continuous in $\( s \, Z \)$, including across the concatenation points of the homotopy.
   On bounded subsets of $C^(1 \, b)$ its $C^(3 \, b)$ norm is uniformly bounded at these fixed parameters.
   No lower bound for $t$ is required.]
] <n3:existence:scalar-solve>

#proof[
  For the scalar continuation below, use the affine space of $C^(3 \, b)$ functions with the assigned Dirichlet
    values and the equation space $C^(1 \, b)$. Its individual solutions meet the $C^3$ hypothesis of Lemma 27;
    no uniform third-derivative bound is assumed before that lemma is applied.
    The monotonicity $partial Z \/ partial t = 1 + p v \/ 4 > 0$ defines $t =
    t \( x \, Z \, D f \)$ smoothly for every finite input, including $D f = 0$.
    The principal matrix has no dependence on the value of $f$.
    The right side is increasing in $h = tau f$, with derivative at least one.
    At a height extremum the collar terms vanish and $D f = 0$,
    so the equation gives fixed constant upper and lower barriers. Including all prescribed boundary heights, we obtain
  #[#set math.equation(numbering: n => "(6.47)")
   $ \| h \| lt.eq C_0 \, $ <n3:existence:scalar-height>]
  where the constant can be chosen independently of $Z$ and the homotopy parameter.
    We include the fixed boundary values in its choice.
  #emph[Large slopes.] Only $\| Z \| lt.eq M$ is assumed here.
    As $sigma arrow.r oo$, the implicit equation forces $t arrow.r - oo$ uniformly in $Z$.
    There $p = N$ and $l = e^(N t)$, so its exact form is
  #[#set math.equation(numbering: n => "(6.48)")
   $ e^(8 Z) = e^(8 t) + e^(\( 2 N + 8 \) t) sigma^2 . $ <n3:existence:implicit-large-slope>]
  Consequently
  #[#set math.equation(numbering: n => "(6.49)")
   $ t & = - frac(log sigma, N + 4) + O \( 1 \) \, wide l asymp sigma^(- N \/ \( N + 4 \)) \,\
d & asymp sigma^(- 8 \/ \( N + 4 \)) \, wide chi asymp sigma^(- 8 \/ \( N + 4 \)) \, wide sqrt(D) /
  l asymp sigma . $ <n3:existence:large-slope-asymptotics>]
  The constants are uniform for $\| Z \| lt.eq M$ at fixed $N$.
    Since $N gt.eq 4$, the exponent $8 \/ \( N + 4 \)$ is at most one.
    Combining the large-slope estimates with compactness of the remaining variable range yields
  #[#set math.equation(numbering: n => "(6.50)")
   $ chi gt.eq frac(c, 1 + sigma) \, wide \| G_f \| lt.eq C \( 1 + sigma \) $ <n3:existence:scalar-growth>]
  whenever Equation (6.47) holds.
  #emph[Boundary slopes.] The estimate $chi gt.eq c \/ \( 1 + sigma \)$ suggests a concave logarithmic barrier:
    its axial second derivative can dominate terms of linear growth in its slope.
    Let $delta$ be smaller than a fixed collar radius, half the distance between distinct boundary components,
    and a normal injectivity radius of a smooth extension of the finite domain. On a boundary distance collar use
  #[#set math.equation(numbering: n => "(6.51)")
   $ psi \( r \) = k^(- 1) log \( 1 + B r \) \, wide psi'' = - k \( psi' \)^2 . $ <n3:existence:logarithmic-modulus>]
  The upper and lower barriers are the assigned face value plus or minus $psi$.
    On these tests the axis is normal to the distance leaves, so their principal trace is $chi psi'' +
    psi' Delta r$. At slopes at least one, Equation (6.50) gives
  #[#set math.equation(numbering: n => "(6.52)")
   $ - k chi \( psi' \)^2 lt.eq - 1 / 2 c k psi' . $ <n3:existence:logarithmic-dominance>]
  Choose $k$ large enough to dominate all the bounded geometry terms and the linear growth in Equation (6.50).
    Next shrink $delta$ so that $1 \/ \( 2 k delta \)$ exceeds any fixed large-slope threshold used here.
    Finally choose $B$ large enough that $B delta gt.eq 1$ and $psi \( delta \) > 4 C_0 \/ tau$.
    The latter exceeds twice the bound for $"osc" f$ from (6.47).
    Then $psi' gt.eq 1 \/ \( 2 k delta \)$ on this collar and the two barriers compare by the height monotonicity.
    This gives a uniform boundary gradient bound.
  #emph[Interior slopes.] Use the same modulus for differences at two points. After increasing $B$ if needed, consider
  #[#set math.equation(numbering: n => "(6.53)")
   $ f \( x \) - f \( y \) - psi \( "dist" \( x \, y \) \) \, wide
     0 < "dist" \( x \, y \) < delta . $ <n3:existence:doubling-function>]
  The distance is taken in the fixed smooth extension. The boundary barriers exclude a positive maximum with one
    endpoint on a face: the other point lies in that face’s collar,
    its distance to the face is at most the distance between the pair, and $psi$ is increasing.
    The separation choice prevents endpoints on distinct faces.
    The inequality $psi \( delta \) > 2 "osc" f$ excludes the other boundary of the two-point domain.
    At a positive interior maximum let $r = "dist" \( x \, y \)$ and $q = psi' \( r \)$.
    The two gradients have length $q$ and are parallel transports along the connecting geodesic.
    Vary both endpoints simultaneously in parallel transverse directions.
    The second variation formula for the short geodesic yields
  #[#set math.equation(numbering: n => "(6.54)")
   $ "tr"_(e_x^perp) "Hess" f \( x \) - "tr"_(e_y^perp) "Hess" f \( y \) lt.eq
     C q r . $ <n3:existence:two-point-transverse>]
  Varying each endpoint separately along that geodesic gives $f_(\; e_x e_x) \( x \) lt.eq
    psi'' \( r \)$ and $f_(\; e_y e_y) \( y \) gt.eq - psi'' \( r \)$.
    Subtracting the two scalar equations therefore gives
  #[#set math.equation(numbering: n => "(6.55)")
   $ - 2 C \( 1 + q \) lt.eq G_f \( x \) - G_f \( y \) lt.eq
     C q r + \( chi_x + chi_y \) psi'' \( r \) . $ <n3:existence:two-point-contradiction>]
  By Equations (6.50) and (6.51), the last term is at most $- c k q$ at the large comparison slopes.
    Our choice of $k$ gives a contradiction. Thus Equation (6.53) is nonpositive.
    Reversing $x \, y$ proves the same bound for the absolute difference and, on letting $y arrow.r x$,
    a global Lipschitz bound for $f$. The endpoint variations are interior variations in the smooth extension;
    the connecting short geodesic need not stay inside $Omega_R$.
    This argument used no continuity modulus for $chi_x - chi_y$;
    only the common transverse eigenvalues and the radial lower bound were needed.
  #emph[Continuation and uniqueness.] The height and gradient estimates supply compactness for a scalar
    continuation. Interpolate the normalized equation with $Delta f = tau f$,
    retaining its prescribed boundary values. Explicitly, for $a
    in \[ 0 \, 1 \]$ take principal matrix $\( 1 - a \) I + a A_chi$ and right side $\( 1 - a \) tau f + a G_f$.
    The height sign, the linear gradient growth, and Equation (6.50) persist uniformly in $a$.
    The height and logarithmic gradient bounds just proved are therefore uniform.
    After these bounds the interpolating equations are uniformly elliptic.
    Their matrices still have the axial form, with axial eigenvalue $\( 1 - a \) + a chi$, so Lemma 27 applies.
    Schauder estimates then give a uniform $C^(2 \, theta)$ bound at fixed input $Z$.
    The coefficients and right side are now Lipschitz in position on bounded input sets,
    which permits their $C^(0 \, b)$ estimates and an upgrade to $C^(2 \, b)$.
    Differentiating once, or using the next Schauder estimate, yields $f in C^(3 \, b)$ because $Z in C^(1 \, b)$.
  The scalar linearization has the form $a^(i j) D_(i j) phi + b^i D_i phi - c phi$ with $c gt.eq
    c_1 tau > 0$ on the bounded variable range. Indeed the principal matrix is independent of the height,
    while $partial_f G_f gt.eq tau sqrt(D) \/ l > 0$. The Dirichlet maximum principle gives uniqueness and a zero
    kernel; the linear elliptic Dirichlet theory gives an inverse from $C^(1 \, b)$ to $C_0^(3 \, b)$,
    where the subscript denotes zero data on the entire boundary.
    The implicit-function theorem gives openness of the interpolation parameter set.
    The uniform classical bounds and compactness give closedness, starting from the invertible Laplace endpoint.
    This proves existence. The same maximum principle applied to the difference of two solutions proves uniqueness
    of the nonlinear solution. The implicit-function theorem, or compactness and uniqueness,
    gives continuous dependence on $Z$ and on the homotopy parameter.
    At the finitely many concatenation points the scalar equations agree, so the same continuity holds there. ◻
]

=== 6.5 Degree on the admissible set and exhaustion <degree-on-the-admissible-set-and-exhaustion>

We can now construct the compact map. The homotopy parameter $s
  in \[ 0 \, 4 \]$ has a separate role from the deformation integer $N$:
  in Proposition 15, $s = 0$ is the original system, $s = 1$ removes the drift, $s =
  2$ completes the collar modification, and $s = 3$ makes the scalar solution $f$ identically zero.
  On $\[ 3 \, 4 \]$ the divergence source and the inner flux are multiplied together by $4 - s$.
  The final compact map is consequently the zero map. The remaining task is to show that no fixed point can cross
  the boundary of the admissible set along this path.

#thm([Lemma 6.5.])[
  (Degree on varying open sets).  #emph[Let $I = \[ a \, b \]$, let $X$ be a real Banach space, and let $T :
    I times X arrow.r X$ be continuous and map bounded sets to relatively compact sets.
    Let $cal(U) subset I times X$ be bounded and relatively open.
    Suppose no fixed point $Z = T \( s \, Z \)$ belongs to the relative boundary of $cal(U)$.
    Then, for $cal(U)_s = { Z : \( s \, Z \) in cal(U) }$, the Leray–Schauder degree
$ deg \( I_X - T_s \, cal(U)_s \, 0 \) $

 is well defined and independent of $s$. Empty sections have degree zero.
   If $T_b$ is the zero map and $0 in cal(U)_b$, the common degree is one, and every section contains a fixed point.]
] <b:lem:moving-degree>

#proof[
  The fixed points in $overline(cal(U))$ form a compact set $frak(F)$.
    Indeed, boundedness of $cal(U)$, compactness of $I$ and of the images of $T$ give a convergent subsequence of
    any sequence of such fixed points; continuity preserves the fixed-point equation.
    The hypothesis places $frak(F)$ inside $cal(U)$. Also ${ s } times
    partial cal(U)_s$ lies in the relative boundary of $cal(U)$, so each section degree is defined.
  Fix $s_0 in I$. Cover its compact fixed-point slice by finitely many open balls in $X$ whose closed balls remain
    in $cal(U)_s$ for all $s$ sufficiently close to $s_0$. Relative openness and the finite cover permit this
    common parameter interval. Let $U$ be their union. All fixed points in the closed sections for these nearby
    parameters lie in $U$ after shortening the interval: otherwise compactness of $frak(F)$ would give an omitted
    fixed point in the slice at $s_0$. Excision identifies the degree on each $cal(U)_s$ with that on $U$,
    and fixed-domain homotopy invariance makes the latter constant.
    If the slice is empty, compactness instead gives no nearby fixed points in the closed sections,
    so those degrees are all zero. Thus the section degree is locally constant,
    and connectedness of $I$ makes it constant. These are the excision and homotopy properties of Leray–Schauder
    degree #cite(label("LeraySchauder1934")) Sections 12–14, pp. 59–61; see also #cite(label("Deimling1985")).
    At the stated terminal map, normalization gives degree one;
    the existence property of nonzero degree proves the last assertion. ◻
]

#thm([Theorem 6.6.])[
  (Existence on finite truncations).  #emph[For the prepared domain of Proposition 11 and every sufficiently small
    fixed $epsilon.alt > 0$, there is an integer $N_0 gt.eq 4$ and, for each $N gt.eq N_0$,
    a radius $R_min \( N \)$, with $R_min \( N \) arrow.r oo$,
    such that the original deformation system has a smooth solution on every $Omega_R$ with $R gt.eq
    R_min \( N \)$. It satisfies $t > - epsilon.alt$ on the closure.
    At fixed $N$, these solutions have the local bounds of Proposition 29, uniformly as $R arrow.r oo$.
    In particular, any sequence $R_j arrow.r oo$ of such radii has a subsequence converging smoothly on compact
    subsets of $overline(Omega)$ to a solution of the original equations with $t gt.eq - epsilon.alt$.]
] <n3:existence:deformation>

#proof[
  #emph[Choose the parameters before defining degree.] Fix the prepared data, thresholds,
    collars and $epsilon.alt$. Choose an integer $N_0$ so that
  #[#set math.equation(numbering: n => "(6.56)")
   $ N_0 gt.eq max { 4 \, floor.l 2 \/ epsilon.alt floor.r + 1 } $ <n3:existence:n-choice>]
  and so that the floor test and all estimates of Proposition 26 apply for $N gt.eq N_0$.
    Let $R_(upright("ap")) \( N \)$ dominate every lower-radius requirement in the a priori estimates and in the
    floor exclusion; let $R_(upright("geo"))$ contain all compact boundary faces,
    collars and supports of the construction. The end barrier of that proposition gives a constant
    $C_(upright("out"))$, independent of $N \, R \, s$, such that every admissible or floor-contact homotopy
    solution has
  #[#set math.equation(numbering: n => "(6.57)")
   $ \| nabla f \| lt.eq C_(upright("out")) tau^(- 1) R^(- 1 - gamma) quad
     upright("on the outer sphere") . $ <n3:existence:outer-gradient>]
  The scalar last stage has $f = 0$ and satisfies the same bound.
    Choose, enlarging to a radius of a smooth truncation if necessary,
  #[#set math.equation(numbering: n => "(6.58)")
   $ R_min \( N \) = max { & N \, R_(upright("geo")) \, R_(upright("ap")) \( N \) \,\
 & (frac(2 C_(upright("out")) ell, tau sqrt(e^(8 epsilon.alt) - 1)))^(1 \/ \( 1 + gamma \))
   #scale(x: 240%, y: 240%)[}] . $ <n3:existence:R-choice>]
  At $Z = 0$, the value of its implicit expression at $t = - epsilon.alt$ is $- epsilon.alt + 1 /
    8 log \( 1 + ell^2 sigma^2 \)$. Equations (6.57) and (6.58) make this strictly negative.
    Strict monotonicity of that expression in $t$ therefore excludes an outer floor contact.
    The term $N$ in Equation (6.58) ensures $R_min \( N \) arrow.r oo$.
  The sublevel and collar estimates apply to arbitrary smooth admissible or floor-contact solution sequences with
    $N arrow.r oo$ and expanding outer cutoffs, uniformly over the compact ranges of the homotopy parameters.
    If the needed conclusion failed for arbitrarily large $N$ with $R gt.eq R_min \( N \)$,
    one could select such a violating sequence. The chosen radius convention would make it precisely an expanding
    sequence excluded by those proofs. Thus a single $N_0$, followed by the radius choices above,
    suffices for every homotopy parameter. No upper bound for $Z$ is inserted in the earlier contact estimates:
    there $sigma asymp tau^(- 1)$ and $l gt.eq ell$ alone give $d lt.tilde \( tau \/ ell \)^2$.
  #emph[Define the compact map on all bounded input sets.] For the rest of the degree argument fix $N gt.eq
    N_0$ and $R gt.eq R_min \( N \)$. Work in the Banach space
  #[#set math.equation(numbering: n => "(6.59)")
   $ X_b = { Z in C^(1 \, b) \( overline(Omega_R) \) : Z = 0 upright(" on the outer face") } \, wide
     0 < b < 1 . $ <n3:existence:banach-space>]
  For an input $Z in X_b$, first solve $f = cal(S)_s \( Z \)$ by Lemma 30.
    Compute $t \, u \, A_chi \, cal(T)$ and the full homotopy source from this input pair.
    Write $B_s$ for the frozen drift summand in the flux, $E_s$ for the full right side of its divergence
    equation, and $q_s$ for the prescribed inner flux. Thus before the final scaling $B_s =
    lambda_s u A_chi K \( w \, dot.op \)$ and $E_s = u Xi$; on the final interval $E_s$ and $q_s$ have the
    simultaneous scalar factor prescribed in Proposition 15. Define $cal(K)_s \( Z \) =
    tilde(Z)$ by the linear mixed problem
  #[#set math.equation(numbering: n => "(6.60)")
   $
     cases(delim: "{", "div" \( 4 u A_chi nabla tilde(Z) + B_s \) = E_s & upright("in ") Omega_R \,, \( 4 u A_chi
     nabla tilde(Z) + B_s \)_nu = q_s & upright("on ") B \,, tilde(Z) = 0 & upright("on the outer face") .)
     $ <n3:existence:compact-map-equation>]
  All coefficients in this problem are computed from the input $\( cal(S)_s \( Z \) \, Z \)$;
    the only unknown is $tilde(Z)$. The normal $nu$ on the inner faces points into the domain.
    For a test function $phi$ vanishing on $S_R$, the weak form is
  $ integral_(Omega_R) 4 u A_chi nabla tilde(Z) dot.op nabla phi = - integral_(Omega_R) E_s phi -
    integral_(Omega_R) B_s dot.op nabla phi - integral_B q_s phi . $
  The sign of the boundary term comes from using $- nu$ as the integration normal.
    The scalar estimate bounds the leading coefficient above and away from zero on each bounded input set.
    The nonempty outer Dirichlet face supplies Poincaré’s inequality,
    so the bilinear form is coercive and has a unique solution.
  On bounded input sets in $C^(1 \, b)$, Lemma 30 bounds $f$ in $C^(3 \, b)$.
    Hence the leading coefficient and drift in Equation (6.60) are $C^(1 \, b)$, the bulk source is $C^(0 \, b)$,
    and the prescribed boundary data are $C^(1 \, b)$. The derivatives of $t \( x \, Z \, D f \)$ involve only $D
    Z$ and $D^2 f$, so this assertion includes the quadratic expression $cal(T)$.
    Linear regularity gives a bounded output set in $C^(2 \, b)$.
    The inclusion $C^(2 \, b) arrow.r.hook C^(1 \, b)$ is compact on the finite domain.
    Continuous dependence of the scalar solve and the linear problem makes $\( s \, Z \) mapsto
    cal(K)_s \( Z \)$ a continuous compact homotopy on bounded sets.
    These assertions hold also at the concatenation parameters because the defining equations coincide there.
    A fixed point solves the coupled system; repeated Schauder estimates make it smooth.
  #emph[Exclude fixed points from the boundary of admissibility.] Write $t_s \[ Z \] =
    t \( x \, Z \, D cal(S)_s \( Z \) \)$. The scalar solution must be computed before this admissibility test. Define
  #[#set math.equation(numbering: n => "(6.61)")
   $ cal(O) = { \( s \, Z \) in \[ 0 \, 4 \] times X_b : min_(overline(Omega_R)) t_s \[ Z \] > - epsilon.alt \,
     med parallel Z parallel_(C^(1 \, b)) < M_1 } . $ <n3:existence:admissible-open-set>]
  It is relatively open because the scalar solve and the implicit function defining $t$ depend continuously on
    $\( s \, Z \)$. Propositions 26 and 29 give a uniform bound in $C^(1 \, b)$ for all fixed points satisfying $t
    gt.eq - epsilon.alt$. If initially needed, use their higher classical bounds to reach the chosen exponent $b$.
    Choose $M_1$ larger than this bound. No fixed point lies on the norm boundary of $cal(O)$.
    No fixed point lies on its floor boundary either: outer contacts were excluded above and all remaining
    contacts are excluded by Proposition 20.
  #emph[Apply degree on the varying admissible sections.] The sections $cal(O)_s$ need not be constant in $s$.
    Lemma 31 applies with $I = \[ 0 \, 4 \]$, $X = X_b$, $T_s = cal(K)_s$ and $cal(U) = cal(O)$.
    We have proved continuity and compactness on bounded input sets;
    the norm condition makes $cal(O)$ bounded and the scalar solve makes it relatively open.
    Its relative boundary can contain only norm contact or floor contact,
    and neither can be a fixed point by the preceding estimates. Thus its section degree is constant.
  At $s = 4$, the scalar equation has the unique solution $f = 0$.
    The drift vanishes, and both $E_4$ and $q_4$ vanish for every input.
    Equation (6.60) then has output identically zero. Moreover, $t_4 \[ 0 \] = 0 > - epsilon.alt$,
    so $0 in cal(O)_4$ and
  #[#set math.equation(numbering: n => "(6.62)")
   $ deg \( I - cal(K)_4 \, cal(O)_4 \, 0 \) = 1 . $ <n3:existence:degree-one>]
  Homotopy invariance gives the same degree at $s = 0$. There is therefore a fixed point in $cal(O)_0$,
    which is the desired smooth solution with $t > - epsilon.alt$.
  #emph[Remove only the outer truncation.] Keep $N$ and all other deformation parameters fixed.
    Proposition 29 gives estimates independent of $R$ on an exhaustion by compact sets,
    using boundary charts at the fixed inner faces. A diagonal subsequence converges smoothly on compact subsets
    of $overline(Omega)$. Both equations and their inner boundary conditions pass to the limit.
    The strict finite-domain inequality gives the non-strict limit inequality $t gt.eq - epsilon.alt$.
    The following section establishes end normalization, decay and mass flux;
    those conclusions do not follow from compact exhaustion alone. ◻
]

== 7 The complete exterior and its energy <n3:limit:section>

We now obtain the three geometric outputs stated at the beginning:
  nonnegative scalar curvature, control of every cut, and an arbitrarily small upper energy error.
  Their combination will also yield the numerical comparison.
  Fix the prepared initial data of Definition 2, and the prepared exterior $Omega$ of Proposition 11.
  Its boundary $B$ separates the original inner obstacle from the end.
  Let $A_(*)$ be the enclosing-area infimum of that original obstacle, measured in the reduced metric $g$.
  In particular every cut enclosing $B$ has $g$-area at least $A_(*)$.

We use the notation of Section 4 and take the physical endpoint of the homotopy:

$ F = h + C \, wide h = tau f \, wide "div" V = u Xi \, wide Xi = delta_0 cal(T) + rho + delta_0 tau a sigma -
  m_0 \( t \) cal(P) . $

Here $0 < delta_0 < 1$, $ell = e^(- epsilon.alt N)$, $tau = ell^(3 \/ 2)$,
  and all constants in the prepared data are fixed before $N$ is taken large.
  Constants marked $C_N$ in this section are bounded by $C \( 1 + N \)^C$, with fixed exponents.
  Other constants explicitly allowed to depend on fixed $N$ need not have such a bound.

=== 7.1 The limiting solution and its end <the-limiting-solution-and-its-end>

#thm([Lemma 7.1.])[
  (End control).  #emph[Fix $epsilon.alt > 0$ and a sufficiently large $N gt.eq max { 4 \,
    floor.l 2 \/ epsilon.alt floor.r + 1 }$. The truncation solutions of Theorem 32 have a subsequence converging
    smoothly on compact subsets of $overline(Omega)$ to a solution of the physical system with $t gt.eq -
    epsilon.alt$. On the asymptotically flat end, for some $c_N > 0$ and fixed-$N$ constants $C_j \( N \)$,
$ \| nabla^j f \| lt.eq C_j \( N \) e^(- c_N r) quad upright("for each fixed ") j \, wide Z \, t = O_2 \( r^(- 1) \) . $

 The differences $t - Z$, $macron(g) - g$, and their coordinate derivatives of any fixed order decay
   exponentially. The vector field $V$ satisfies
#[#set math.equation(numbering: n => "(7.1)")
 $ V = 4 nabla_g t + O \( r^(- 3) \) $ <n3:limit:V-asymptote>]

 and has a finite outward flux limit.]
] <n3:limit:end>

#proof[
  The compact convergence, including at the fixed inner boundary,
    follows from Theorem 32 and its uniform fixed-$N$ classical estimates.
    All equations and inner boundary conditions pass to this limit.
    To preserve the end normalization, we prove the decay estimates on the truncations before passing to infinity.
  Outside a fixed large sphere, $K = C = 0$, and the first equation is
  $ "tr"_(A_chi) "Hess"_g f = frac(tau sqrt(D), l) thin f . $
  At fixed $N$ the preceding estimates make the left side uniformly elliptic,
    and its positive height coefficient is bounded below by a positive constant depending on $N$.
    It is bounded above as well. For sufficiently small $c_N > 0$,
    the functions $exp \[ - c_N \( r - r_0 \) \]$ are positive supersolutions of the corresponding linear equation
    outside a sufficiently large $r_0$: their radial second derivative has size $c_N^2$,
    while their tangential second derivatives have size $c_N \/ r$,
    and the fixed positive height term dominates both. Multiplying by a constant bounds the solution on $S_(r_0)$;
    the zero outer Dirichlet value is also bounded. The maximum principle applied to both signs of $f$ gives the
    uniform exponential estimate. The fixed-$N$ unit-patch estimates,
    followed by the local homogeneous linear estimates for this equation, give the same decay for derivatives.
    The corresponding boundary estimates apply on the large outer spheres.
    Iterating the smooth equations gives each required finite derivative order.
  The relation $Z = t + 1 / 8 log \( 1 + l^2 \| nabla f \|^2 \)$ now shows that $t - Z$ is exponentially small,
    with derivatives. The graph errors have the same property. On the end the second equation becomes
  #[#set math.equation(numbering: n => "(7.2)")
   $ Delta_g Z + b_N \( Z \) \| d Z \|_g^2 = O \( r^(- 4) \) \, wide b_N \( s \) = p_L \( s \) -
     delta_0 #scale(x: 120%, y: 120%)[\(] p_L \( s \) - 1 #scale(x: 120%, y: 120%)[\)] . $ <n3:limit:Z-end>]
  Indeed $A_chi = I$ and $u = L \( Z \)$ up to exponentially small errors, whereas $cal(T) =
    4 \( p_L \( Z \) - 1 \) \| d Z \|^2$ up to such errors. The $rho_0$ penalty weight is $O \( r^(- 4) \)$;
    the term with $rho_1$ is multiplied by the exponentially small $v$.
    All coefficients in this statement are bounded on the fixed-$N$ solution range.
    Differentiably controlled exponential errors can absorb any fixed polynomial power of $r$.
  Define an increasing smooth function on that range by
  $ Phi_N \( 0 \) = 0 \, wide Phi'_N \( s \) = exp #h(-0.16667em) (integral_0^s b_N \( z \) thin upright(d) z) . $
  Its derivative is bounded above and below by positive fixed-$N$ constants. The chain rule in (7.2) gives
  $ Delta_g Phi_N \( Z \) = O \( r^(- 4) \) . $
  The function is bounded and vanishes at the outer cutoff.
    To obtain a bound independent of that cutoff, choose $0 < eta < 1$.
    For large $r$, a positive multiple of $r^(- 1) - r^(- 1 - eta)$ satisfies
  $ - Delta_g \( r^(- 1) - r^(- 1 - eta) \) gt.eq c r^(- 3 - eta) . $
  Here the Euclidean leading term is $eta \( 1 + eta \) r^(- 3 - eta)$, and the metric error is $O \( r^(- 4) \)$.
    It dominates the right side after increasing the multiple and the fixed inner radius.
    Comparison for both signs yields $\| Phi_N \( Z \) \| lt.eq C' \( N \) r^(- 1)$,
    where $C' \( N \)$ is a fixed-$N$ constant with no polynomial claim. Consequently $Z = O \( r^(- 1) \)$.
  At sufficiently large radius this estimate and the exponential graph error give $t > - epsilon.alt + 1 \/ N$;
    hence the floor penalty vanishes there. Rescale each annulus of radii comparable to $r$ to unit size.
    The equation for $Phi_N \( Z \)$ has a bounded rescaled source and uniformly controlled metric coefficients.
    Local $W^(2 \, p)$ estimates with $p > 3$ first give the gradient decay.
    Its source is then a smooth weight times a smooth function of the bounded variables,
    plus the already controlled exponential errors. Schauder estimates,
    or a further Sobolev bootstrap followed by them, give $Z = O_2 \( r^(- 1) \)$.
    Inverting $Phi_N$ preserves these bounds, and the same holds for $t$.
  Since $L \( 0 \) = 1$, we have $u = 1 + O \( r^(- 1) \)$ and $A_chi = I + O \( e^(- c_N r) \)$.
    With $K = 0$ on the end, the definition of $V$ gives (7.1). Moreover $"div" V = u Xi$ is integrable there:
    $cal(T) = O \( r^(- 4) \)$, $rho = O \( r^(- 4) \)$, the penalty has vanished,
    and $tau a sigma$ decays exponentially. The divergence theorem on annuli proves the existence of the outward
    flux limit. ◻
]

#thm([Lemma 7.2.])[
  (Curvature, completeness, and ADM charge).  #emph[For the solution in Lemma 33,
$ hat(g) = e^(4 t) \( g + l^2 d f^2 \) $

 is a smooth complete metric on $overline(Omega)$, with nonnegative scalar curvature and strictly negative mean
   curvature on $B$ for the normal pointing into $Omega$. Its end is asymptotically flat with
$ hat(g) - delta = O_2 \( r^(- 1) \) \, wide R_(hat(g)) = O \( r^(- 3 - delta') \) \, wide delta' = min { delta \,
  1 } > 0 \, $

 where the reduced end has $R_g = O \( r^(- 3 - delta) \)$. If
$ frak(F)_N = lim_(r arrow.r oo) integral_(S_r) V_nu thin upright(d) A_g \, $

 then
#[#set math.equation(numbering: n => "(7.3)")
 $ E_(hat(g)) = E - frac(frak(F)_N, 8 pi) . $ <n3:limit:adm>]

]
] <n3:limit:geometry>

#proof[
  At the physical endpoint the curvature identity gives
  $ 1 / 2 e^(4 t) R_(hat(g)) =  & 8 pi \( mu + J \( w \) \) + \( 1 - delta_0 \) cal(T) + \( 1 - delta_0 \) tau a sigma\
 & + w dot.op nabla C - F "tr" K - rho + m_0 \( t \) cal(P) . $
  The height bounds on the compact supports of $K$ and $C$ give $h in \[ b_(-) \, b_(+) \]$.
    Since $\| w \| lt.eq 1$, the terms $\| F "tr" K \| + \| nabla C \| +
    rho$ are dominated by $8 pi \( mu - \| J \| \)$, by the choices in Proposition 11 and the choice of $rho$.
    Outside those supports the same conclusion uses $8 pi \( mu - \| J \| \) - rho gt.eq 0$.
    All remaining terms are nonnegative. This proves $R_(hat(g)) gt.eq 0$.
  The boundary identity and the prescribed flux give $H + 4 partial_nu t = - N_B < 0$.
    Since $f$ is constant on each face, this is exactly the mean-curvature sign for $hat(g)$.
    Also $hat(g) gt.eq e^(- 4 epsilon.alt) g$, so any escaping curve has infinite length;
    the compact boundary is included. Smoothness and completeness therefore follow.
  Lemma 33 gives the stated metric decay. The prepared-data hypothesis supplies $R_g =
    O \( r^(- 3 - delta) \)$ on the end. Since graph errors are exponentially small, the conformal formula gives
  $ R_(hat(g)) = e^(- 4 t) #scale(x: 120%, y: 120%)[\(] R_g - 8 Delta_g t -
    8 \| d t \|_g^2 #scale(x: 120%, y: 120%)[\)] + O \( e^(- c_N r) \) . $
  Equation (7.2), the vanishing far-end penalty, and the gradient estimate give $Delta_g t = O \( r^(- 4) \)$.
    This proves the asserted scalar-curvature decay, including the pointwise falloff required by the AF convention
    of #cite(label("Bray2001")) Definition 21 and Theorem 19.
  Exponential graph errors contribute no ADM flux. The conformal change and $t = O_2 \( r^(- 1) \)$ give
  $ E_(hat(g)) = E - frac(1, 2 pi) lim_(r arrow.r oo) integral_(S_r) partial_nu t thin upright(d) A_g . $
  Replacing the metric normal and area form by their Euclidean versions costs $o \( 1 \)$,
    and the $O \( r^(- 3) \)$ error in (7.1) has vanishing sphere integral. This proves (7.3). ◻
]

=== 7.2 The boundary and floor losses <the-boundary-and-floor-losses>

The mass formula reduces the remaining estimate to a lower bound for the flux.
  We absorb the inner boundary term into the positive bulk source and then estimate the penalty near the floor.
  Both steps use only polynomial constants.

#thm([Lemma 7.3.])[
  (Flux lower bound).  #emph[For fixed $epsilon.alt > 0$, the physical solutions satisfy
$ frak(F)_N gt.eq - epsilon_N \, wide 0 lt.eq epsilon_N lt.eq C \( 1 + N \)^C #scale(x: 120%, y: 120%)[\(] ell +
  ell^2 \/ tau #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $

 All constants in this estimate are independent of the fixed-$N$ classical regularity constants.]
] <n3:limit:flux>

#proof[
  The normal $nu$ on $B$ points into $Omega$, so the divergence theorem has the sign
  #[#set math.equation(numbering: n => "(7.4)")
   $ frak(F)_N = integral_Omega u Xi thin upright(d) V_g + integral_B V_nu thin upright(d) A_g .
     $ <n3:limit:flux-split>]
  Each integral is finite for a fixed $N$, by Lemma 33 and compact smoothness.
  At a black face, $F - P_B = H$ and $w_nu = a$. At a white face, $F - P_B = - H$ and $w_nu = - a$.
    Thus at either type of face,
  $ V_nu \/ u = - \( 1 - a \) H - N_B d gt.eq - C d . $
  The signed boundary gradient bounds give $sigma gt.eq c \/ tau$, so
  $ sqrt(d) lt.eq frac(1, l sigma) lt.eq C tau \/ ell \, wide integral_B V_nu thin upright(d) A_g gt.eq - C tau /
    ell integral_B L thin upright(d) A_g . $
  Use the polynomial collar trace estimate from Section 5 with the constant test function:
  $ integral_B L thin upright(d) A_g lt.eq C \( 1 + N \)^C integral_(cal(C)) u \( 1 + sqrt(cal(T)) \) thin
    upright(d) V_g \, $
  where $cal(C)$ is a fixed compact union of collars. Its polynomial constant is independent of the upper $Z$
    bound. Since $rho$ has a fixed positive minimum on $cal(C)$,
  $ integral_(cal(C)) u \( 1 + sqrt(cal(T)) \) thin upright(d) V_g lt.eq
    C integral_Omega u \( delta_0 cal(T) + rho \) thin upright(d) V_g . $
  The factor $C \( 1 + N \)^C tau \/ ell = C \( 1 + N \)^C ell^(1 \/ 2)$ tends to zero.
    For large $N$, the entire negative boundary term in (7.4) is therefore at most one quarter of $integral_Omega
    u \( delta_0 cal(T) + rho \) thin upright(d) V_g$.
  It remains to estimate the floor penalty. On its support, $- epsilon.alt lt.eq t lt.eq - epsilon.alt + 1 \/ N$,
    so $l$ and $L$ are comparable to $ell$, with constants independent of $N$. Directly from their definitions,
  $ u & = L sqrt(1 + l^2 sigma^2) lt.eq C \( ell + ell^2 sigma \) \,\
u v & = frac(L l^2 sigma^2, sqrt(1 + l^2 sigma^2)) lt.eq C ell^2 sigma \,\
u a sigma & = L l sigma^2 gt.eq c ell^2 sigma^2 . $
  Consequently
  $ u m_0 cal(P) lt.eq C_N #scale(x: 120%, y: 120%)[\[] ell rho_0 +
    ell^2 sigma \( rho_0 + rho_1 \) #scale(x: 120%, y: 120%)[\]] . $
  Young’s inequality, with the square term chosen to be a quarter of $delta_0 tau u a sigma$, yields
  $ u m_0 cal(P) lt.eq 1 / 4 delta_0 tau u a sigma + C_N [ell rho_0 + ell^2 / tau \( rho_0^2 + rho_1^2 \)] . $
  Squaring the constant only changes the polynomial $C_N$. The integrals of $rho_0$, $rho_0^2$,
    and $rho_1^2$ are finite: on the end their orders are respectively $r^(- 4)$, $r^(- 8)$, and $r^(- 4 gamma)$,
    with $4 gamma > 3$. Integrating leaves at most $C \( 1 + N \)^C \( ell + ell^2 \/ tau \)$, after absorption.
  Substitute both bounds in (7.4). Positive fractions of the three bulk terms $delta_0 cal(T) \, rho \,
    delta_0 tau a sigma$ remain. Dropping them proves the claim.
    Finally $ell^2 \/ tau = ell^(1 \/ 2)$, so the error tends to zero exponentially against every polynomial loss. ◻
]

#proof[
  The fixed subexterior and preservation of every full cut are supplied by Proposition 11.
    Fix $epsilon.alt$ and take the global solutions of Lemma 33,
    obtained by first exhausting the end at fixed $N$. Lemma 34 gives completeness, the two curvature signs,
    and the end decay. The pointwise inequality $hat(g) gt.eq
    e^(- 4 epsilon.alt) g$ gives the two-dimensional area inequality on every full cut,
    including every component and every coincident portion. The energy formula and Lemma 35 give the asserted
    upper error with $eta_(epsilon.alt \, N) = epsilon_N \/ \( 8 pi \)$.
    This completes the geometric construction before any Riemannian Penrose comparison. ◻
]

=== 7.3 The Riemannian horizon and the inequality <the-riemannian-horizon-and-the-inequality>

The deformed metric has nonnegative scalar curvature, strictly negative inner mean curvature toward the end,
  and the required asymptotic decay. We replace its inner boundary by an outer area-minimizing minimal enclosure,
  then compare its area with the original enclosing infimum.

#thm([Theorem 7.4.])[
  (Reduced energy inequality).  #emph[The reduced data satisfy
$ E gt.eq sqrt(frac(A_(*), 16 pi)) . $

 Consequently Theorem 4 holds in its entire stated exterior class.]
] <n3:limit:energy>

#proof[
  For each fixed sufficiently large $N$, minimize $hat(g)$-area among filled cuts enclosing $B$,
    using a large outer sphere as an auxiliary barrier. The independent enclosure results
    of #cite(label("RiemannianCompanion")) Lemmas 2.1–2.3 apply to this smooth AF metric;
    we check their hypotheses and the strict detachment here.
    A fixed enclosing competitor bounds the area, and local perimeter density estimates prevent minimizers from
    escaping to infinity. The positive mean curvature of sufficiently large outer spheres excludes contact there,
    as in that enclosure theorem. For the inner barrier, let $U_s$ be a short outward normal collar of the filled
    obstacle and $Y$ its outward unit foliation field. Strict negativity gives $"div"_(hat(g)) Y <
    0$ throughout the collar. If a perimeter minimizer $E$ omitted a positive-volume portion $D = U_s \\ E$,
    Gauss–Green and $\| Y \|_(hat(g)) lt.eq 1$ would give
  $ P_(hat(g)) \( E union U_s \) - P_(hat(g)) \( E \) lt.eq
    integral_D "div"_(hat(g)) Y thin upright(d) V_(hat(g)) < 0 . $
  Thus $E$ contains a whole inner collar; obstacle regularity upgrades this inclusion to its regular
    representative. Its free boundary is disjoint from the obstacle.
    The resulting cut $Gamma_N$ is compact, smooth, and minimal in dimension three; it may be disconnected.
    It is outer area-minimizing by its minimizing property. Equivalently one may first use the ordinary
    trapped-region theorem for $\( hat(g) \, 0 \)$ and then take the outer minimizing enclosure.
    The boundary version of the Riemannian Penrose theorem applies to the exterior of $Gamma_N$,
    by Lemma 34 and #cite(label("Bray2001")) Theorem 19.
  For every two-plane the restriction of $macron(g) = g + l^2 d f^2$ dominates that of $g$. The floor therefore gives
  $ \| Gamma_N \|_(hat(g)) gt.eq e^(- 4 epsilon.alt) \| Gamma_N \|_g gt.eq e^(- 4 epsilon.alt) A_(*) . $
  The last inequality uses that $B$, and hence $Gamma_N$, cuts off the original filled obstacle.
    Lemmas 34 and 35 now give
  $ E + frac(epsilon_N, 8 pi) gt.eq E_(hat(g)) gt.eq sqrt(frac(\| Gamma_N \|_(hat(g)), 16 pi)) gt.eq
    e^(- 2 epsilon.alt) sqrt(frac(A_(*), 16 pi)) . $
  Let $N arrow.r oo$ with $epsilon.alt$ fixed, and then $epsilon.alt arrow.b 0$. This proves the reduced inequality.
  Finally apply the weak three-dimensional rest-preparation theorem of #cite(label("NumericalCompanion"))
    Proposition 7.13 to an exterior satisfying the hypotheses of Theorem 4.
    Write $\( g_j \, K_j \)$ for the resulting data. Their tensor fields have compact support,
    their momenta vanish, and their metrics have all-order $r^(- 1)$ decay and the stipulated scalar falloff.
    Discard a finite initial segment so that $E_j > 0$. Strict trapping and strict DEC hold on the compact core.
    The positive minimum there of $8 pi \( mu_j - \| J_j \|_(g_j) \) 𝜚^(3 + delta)$, together with the end margin,
    gives the global weighted bound after decreasing $c_j$. The full enclosing area is positive by the geometric
    enclosure lemma. Thus each fixed $j$ satisfies Definition 2;
    no constant uniform in $j$ has been used in its deformation solve.
    The reduced energies converge to its invariant ADM mass and the full enclosing infima converge to the original
    enclosing infimum. Applying the reduced bound to each member of that sequence and passing to the limit gives
    Equation (2.8). ◻
]

== 8 A boundary deformation in four dimensions <four:sec:output>

The construction in this section keeps a genuine inner boundary throughout the graph deformation.
  The boundary has two jobs: it must become strictly mean concave, so that a minimal enclosure can detach from it,
  and its flux must be small enough to leave the energy at infinity almost unchanged.
  These requirements explain the signed collars and the boundary condition in the coupled equations.
  They also distinguish this construction from a solve on a manifold obtained by filling the boundary.

We first state the geometric output and deduce its numerical consequence.
  The rest of this part constructs that output. The proof is independent of the numerical spacetime inequality:
  its scalar identity and local analytic estimates apply before any Riemannian comparison is made.

=== 8.1 Data, normalization and the full enclosing area <data-normalization-and-the-full-enclosing-area>

Here the spatial dimension is four. Write

$ omega_3 = \| S^3 \| = 2 pi^2 \, wide tau = "tr"_g K \, wide mu = 1 / 2 \( R_g + tau^2 - \| K \|_g^2 \) \, wide
  J_i = nabla^j \( K_(i j) - tau g_(i j) \) . $

Here $tau$ denotes the trace of $K$; the small height regularizer called $tau$ in the three-dimensional
  construction is denoted by $eta_N$ in this part. The tensor $K$ is symmetric,
  and $nabla$ is the Levi–Civita connection of $g$. Our Laplacian is $Delta_g = "div"_g "grad"_g$.
  A hypersurface with unit normal $nu$ has mean curvature $H =
  "div"_(upright("tan")) nu$ and future expansion $H + "tr"_(upright("tan")) K$.
  At the inner boundary the normal points into the exterior.
  In a compact auxiliary region it points out of that region.
  Every change of sign below specifies both the tensor and the orientation.

The notation $O_j \( r^(- a) \)$ includes coordinate derivatives of order $k lt.eq j$,
  bounded by $O \( r^(- a - k) \)$. In the Euclidean end coordinates our energy and momentum conventions are

#[#set math.equation(numbering: n => "(8.1)")
 $ E_g & =
   frac(1, 6 omega_3) lim_(R arrow.r oo) integral_(\| x \| = R) \( partial_j g_(i j) - partial_i g_(j j) \)
   nu_delta^i thin thin upright(d) A_delta \,\
P_i & = frac(1, 3 omega_3) lim_(R arrow.r oo) integral_(\| x \| = R) \( K_(i j) - tau g_(i j) \) nu_delta^j thin
  thin upright(d) A_delta . $ <four:intro:energy>]

The prepared tensor below has compact support, hence $P = 0$.
  No additional normalization of mass accompanies these density conventions.

#prodef([Definition 8.1.])[
  (Full cuts in a one-ended exterior).  Let $M$ be a smooth connected manifold with nonempty compact boundary $S$
    and one Euclidean end with compact complement. A full cut is the entire intrinsic boundary of a smooth
    connected codimension-zero outer domain $D subset M$ that is closed in $M$, contains the entire distant end,
    has compact boundary, and has its manifold interior in $"int" M$.
    Its boundary is embedded and two-sided; all components and every portion coincident with $S$ count. Set
  $ A_(*) = inf_D \| partial_(upright("man")) D \|_g . $
  In particular $D = M$ is permitted. The infimum need not be attained.
] <four:def:cuts>

These are full cuts rather than a selected connected component of a cut.
  Filling bounded pockets on the obstacle side removes irrelevant internal frontiers,
  while leaving a connected exterior containing the end. The metric comparison in the construction will apply on
  every tangent three-plane, so it will control this entire class at once.

=== 8.2 The geometric output and its immediate use <the-geometric-output-and-its-immediate-use>

#thm([Theorem 8.2.])[
  (Four-dimensional boundary deformation).  #emph[Let $\( M^4 \, g \, K \)$ be smooth, connected and orientable,
    complete with its nonempty compact smooth boundary $S$ included,
    with exactly one Euclidean coordinate end and compact complement. Suppose $K$ is compactly supported.
    Let $r$ be a smooth positive extension of the coordinate radius.
    Assume that, for some $c_0 > 0$ and $0 < delta_1 < 1$,
$ mu - \| J \|_g gt.eq c_0 r^(- 4 - delta_1) quad upright("on ") M \, wide H + "tr"_S K < 0 quad
  upright("on every component of ") S \, $

 with the normal into $M$. On the end assume
$ g - delta = O_j \( r^(- 2) \) quad upright("for every fixed ") j gt.eq 0 \, wide R_g = O \( r^(- 4 - delta_1) \) \, $

 and finite ADM energy in Equation (8.1).]
  #emph[There is a smooth closed connected one-ended exterior $Omega subset M$ with nonempty compact boundary $B
    subset "int" M$ such that every full cut of $B$ in $Omega$ has $g$-area at least $A_(*)$.
    For every $0 < epsilon.alt < 1$ and all sufficiently large integers $N$ there is a smooth metric
    $hat(g)_(epsilon.alt \, N)$ on $Omega$, complete with $B$ included, satisfying
#[#set math.equation(numbering: n => "(8.2)")
 $ R_(hat(g)_(epsilon.alt \, N)) gt.eq 0 \, wide H_(hat(g)_(epsilon.alt \, N)) \( B \) < 0 \, wide
   hat(g)_(epsilon.alt \, N) gt.eq e^(- 2 epsilon.alt) g \,\
hat(g)_(epsilon.alt \, N) - delta = O_2 \( r^(- 2) \) \, wide R_(hat(g)_(epsilon.alt \, N)) =
  O \( r^(- 4 - delta_1) \) \,\
E_(hat(g)_(epsilon.alt \, N)) lt.eq E_g + frac(Pi_N, 3 omega_3) #scale(x: 120%, y: 120%)[\(] e^(- epsilon.alt N) +
  e^(- epsilon.alt N \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <four:output:geometry>]

 The boundary mean curvature uses the normal into $Omega$.
   The constant $Pi_N = C \( 1 + N \)^(a_(upright("pol")))$ is polynomial in $N$,
   with $C$ and $a_(upright("pol"))$ depending only on the fixed data,
   $epsilon.alt$ and the fixed geometric choices. The constants in Equation (8.2) may depend arbitrarily on $N$.]
] <four:thm:boundary-deformation>

The metric has the form $e^(2 t) \( g + l \( t \)^2 thin upright(d) f ⊗ thin upright(d) f \)$:
  the graph term cannot shorten a tangent vector, and the floor $t gt.eq -
  epsilon.alt$ protects all enclosing areas. Its inner boundary is not itself used in the Riemannian inequality.
  Strictly negative mean curvature supplies an outward barrier for a new minimal enclosure.

We use the following precise form of the independent smooth enclosure theorem.
  It concerns perimeter alone and uses no stationary-field, variation or equality conclusion.

#thm([Proposition 8.3.])[
  (Smooth full-perimeter enclosure input).  #emph[Let $\( X^4 \, h \)$ be a smooth connected orientable one-ended
    exterior, complete with nonempty compact smooth boundary $B$ included.
    Suppose the end has compact complement and $h - delta = O_2 \( r^(- q) \)$ for some $q > 1$.
    Minimize the full perimeter of the filled obstacle among enclosing sets;
    contact with $B$ and all frontier components count. The minimizing enclosure can be chosen with connected
    complete exterior, and its full perimeter equals the infimum over the smooth full cuts of $B$.
    Its exterior frontier is outer area-minimizing against all enclosing competitors, including disconnected ones.
    If $H_h \( B \) < 0$ for the normal into $X$, that frontier is a nonempty smooth compact embedded minimal
    hypersurface contained in $"int" X$.]
] <four:input:enclosure>

This is the smooth enclosure theorem from the independent Riemannian geometric
  preliminaries #cite(label("RiemannianCompanion")) Lemmas 2.1–2.3.
  Its proof uses confinement, BV compactness, smooth-cut approximation and obstacle regularity.
  Only its strict-boundary case is used here.

#thm([Corollary 8.4.])[
  (Energy bound for the prepared exterior).  #emph[Under the hypotheses of Theorem 38,
#[#set math.equation(numbering: n => "(8.3)")
 $ E_g gt.eq 1 / 2 (A_(*) / omega_3)^(2 \/ 3) . $ <four:ex:prepared-inequality>]

]
] <four:thm:prepared-energy>

#proof[
  Fix $epsilon.alt > 0$ and a sufficiently large $N$, and abbreviate $hat(g) = hat(g)_(epsilon.alt \, N)$.
    Proposition 39 applies to $\( Omega \, hat(g) \)$: Theorem 38 gives smoothness, completeness,
    one end with exponent $q = 2 > 1$, and the strictly negative boundary mean curvature.
    Let $Sigma$ be its detached minimal frontier. Its exterior is connected, complete with boundary,
    and has the same end and energy. Outer area-minimization allows all components of every enclosing competitor.
    Since $Sigma$ is itself a full cut and the metric comparison holds on its tangent three-planes,
  #[#set math.equation(numbering: n => "(8.4)")
   $ \| Sigma \|_(hat(g)) gt.eq e^(- 3 epsilon.alt) \| Sigma \|_g gt.eq
     e^(- 3 epsilon.alt) A_(*) . $ <four:end:area-comparison>]
  The numerical part of the four-dimensional Riemannian Penrose inequality of Bray–Lee #cite(label("BrayLee2009"))
    Theorem 1.4 now applies. Its input is a smooth connected exterior,
    complete including its minimal outer-area-minimizing compact boundary, with $R gt.eq 0$,
    metric decay $O_2 \( r^(- p) \)$, $p > 1$, and scalar decay $O \( r^(- s) \)$, $s > 4$.
    Here the exponents are $p = 2$ and $s = 4 + delta_1$; the scalar curvature is integrable and the energy is
    finite. That numerical theorem permits disconnected boundary and imposes no spin hypothesis.
    Its additional spin premise concerns an equality conclusion, which is not used.
    Its mass normalization is $1 \/ \( 6 omega_3 \)$, the normalization in Equation (8.1). Consequently
  $ E_g + frac(Pi_N, 3 omega_3) \( e^(- epsilon.alt N) + e^(- epsilon.alt N \/ 2) \) gt.eq E_(hat(g)) gt.eq 1 /
    2 (frac(\| Sigma \|_(hat(g)), omega_3))^(2 \/ 3) gt.eq 1 / 2 e^(- 2 epsilon.alt) (A_(*) / omega_3)^(2 \/ 3) . $
  First let $N arrow.r oo$ at fixed prepared data and $epsilon.alt$, then let $epsilon.alt arrow.b 0$.
    Only this numerical inequality is passed to the limit. ◻
]

=== 8.3 The construction and its scales <the-construction-and-its-scales>

There are four stages in the proof of the deformation theorem.
  Section 9 chooses two trapped-region frontiers and their signed collars.
  The frontiers allow a small interval of prescribed graph trace while the original strict dominant-energy margin
  pays for the unrestricted $tau$. Section 10 fixes the coupled equations and excludes first contact with the
  conformal floor. In Section 11, geometric support comparisons first confine the scaled height to the correct
  interval; signed boundary slopes then make the inner flux small, before any uniform ellipticity is known.
  Sections 12 and 13 obtain boundary regularity, construct the compact return map and complete exhaustion and
  energy control.

The local scalar identities are given with their proofs and the exact four-dimensional constants.
  Their common content is reusable in other graph constructions.
  The degree argument, signed boundary estimates, reflected measure estimates and four-dimensional interpolation
  remain specific verifications for the boundary problem studied here.

#prodef([Remark 8.5.])[
  (Order of constants and limits).  Fix the prepared data, the thresholds and collars,
    and $epsilon.alt > 0$ first. The deformation integer $N$ is then sufficiently large.
    A bound denoted $Pi_N$ is polynomial in $N$ and uniform in the outer truncation radius,
    homotopy parameter and solution. Constants denoted $C \( N \)$ in elliptic estimates may depend arbitrarily on
    $N$. Exhaust the outer radius at fixed $N$, then pass $N arrow.r oo$ using only polynomial estimates,
    and finally $epsilon.alt arrow.b 0$. In an application to weakly decaying original data,
    strictification is removed at each fixed repaired end only after this prepared construction is finished;
    the end-replacement radius tends to infinity last.
] <four:rem:constants>

== 9 Threshold exteriors and geometric barriers <four:sec:geometry>

Our input is the prepared exterior in Theorem 38. Thus the original boundary has strictly negative future
  expansion, $K$ has compact support, and, for a smooth positive extension $r$ of the end radius,

#[#set math.equation(numbering: n => "(9.1)")
 $ mu - \| J \|_g gt.eq c_0 r^(- 4 - delta_1) \, wide c_0 > 0 \, wide 0 < delta_1 < 1 . $ <four:geo:prepared-gap>]

The enclosing infimum for this prepared metric is denoted by $A_(*)$,
  with the intrinsic-boundary convention of Definition 37. This section constructs an exterior on which both signs
  of a small prescribed trace can be controlled. The original trapping convention is always the future convention
  $H + "tr"_S K < 0$. The tensor $- K$ below is used only to construct additional interior barriers.

=== 9.1 Total regions inside a compact barrier <total-regions-inside-a-compact-barrier>

For a smooth symmetric tensor $Q$ and an oriented hypersurface $Sigma$, write

$ Theta_Q \( Sigma \) = H_Sigma + "tr"_Sigma Q . $

When $Sigma$ bounds a compact region, its normal points out of that region.
  A smooth compact region may have several components. It includes its entire manifold boundary and is the closure
  of its interior. For a compact manifold $X$ with boundary and a number $c$, define

#[#set math.equation(numbering: n => "(9.2)")
 $ T_c \( X \, Q \) =
   overline(union.big {E : E subset.double "int" X upright(" is a smooth compact region") \, quad Theta_Q \(
   partial E \) lt.eq c}) . $ <four:geo:total-definition>]

The empty union has empty closure. All closures in this definition are taken in $X$.

#thm([Lemma 9.1.])[
  (Compact total region).  #emph[Let $\( X^4 \, g \)$ be smooth, compact, connected, and orientable,
    with nonempty smooth boundary, and let $Q$ be smooth. Suppose that $Theta_Q \( partial X \) > c$,
    with the normal pointing out of $X$ on every boundary component.
    Then $T_c \( X \, Q \)$ is either empty or a smooth compact region contained in $"int" X$.
    In the latter case its frontier has expansion $c$ and is stable for outward variations.
    It contains every region in (9.2) and is itself one of those regions.
    In particular, no component of its complement whose closure is contained in $"int" X$ can be a bounded hole.]
] <four:geo:compact-total>

#proof[
  Replace $Q$ by $Q_c = Q - \( c \/ 3 \) g$. Since the hypersurfaces have dimension three,
  #[#set math.equation(numbering: n => "(9.3)")
   $ Theta_(Q_c) \( Sigma \) = Theta_Q \( Sigma \) - c $ <four:geo:threshold-shift>]
  for every oriented hypersurface. It suffices to prove the result for $c = 0$, and we use $Q_c$ throughout this proof.
  The global input is the smooth-frontier part of #cite(label("AnderssonEichmairMetzger2011")) Theorem 4.6:
    for smooth complete asymptotically flat data in spatial dimensions $2 lt.eq n lt.eq 7$,
    a nonempty total trapped region has smooth embedded outermost stable MOTS frontier.
    No dominant energy condition is required for this conclusion.
    The higher-dimensional construction uses the Perron and almost-minimizing method developed by Eichmair
    #cite(label("Eichmair2010")), who also explains its adaptation to MOTSs.
    We now reduce the compact problem to the boundaryless asymptotically flat setting of the cited total-region
    theorem, preserving exactly its trapped competitors.
  First attach an outward cobordism from $partial X$ to one three-sphere.
    Each component of $partial X$ is a closed orientable three-manifold.
    Relative one-handles join these components, and the smooth surgery theorem for orientable three-manifolds
    gives a framed link surgery from the resulting connected three-manifold to $S^3$ #cite(label("Wallace1960"))
    Theorem 6 and its proof, pp. 521–522. Its trace consists of relative two-handles:
    reversing a four-dimensional two-handle trace again uses two-handles.
    Thus the cobordism has a handle decomposition relative to $partial X$ with indices at most two.
    Attach $S^3 times \[ 0 \, oo \)$ at its other end, obtaining a boundaryless manifold $tilde(X)$.
    The handle Morse function provides a proper smooth height $q$ on the extension, with $q = 0$ on $partial X$,
    increasing in an outward collar, with only critical points of index at most two,
    and equal to a radial coordinate sufficiently far out. Extend $q$ a short distance into $X$ as a collar
    coordinate with negative values.
  Extend $g$ smoothly across $partial X$. We may choose its values near every critical point of $q$ so that
  #[#set math.equation(numbering: n => "(9.4)")
   $ "tr"_V "Hess"_g q > 0 quad upright("for every three-dimensional subspace ") V subset T_x tilde(X)
     $ <four:geo:morse-trace>]
  at that critical point, and hence throughout a smaller neighborhood.
    Indeed, at an index-two point the eigenvalues of the Hessian can be arranged as $- a \, - b \, A \, B$,
    with $a \, b > 0$ and $min \( A \, B \) > a + b$; the sum of the three smallest is positive.
    At indices zero or one the same choice is easier. This is achieved by rescaling the positive and negative
    coordinate directions in the metric in a Morse chart. The neighborhoods are disjoint and away from the
    prescribed original data, so these local metrics extend to a smooth positive metric on the whole extension.
    Choose that metric Euclidean on the remote end.
  At a regular point of a level of $q$, its mean curvature toward increasing $q$ is
  $ H_({ q = upright("constant") }) = frac("tr"_(\( "grad" q \)^perp) "Hess" q, \| thin upright(d) q \|) . $
  It is positive near the critical points by (9.4). Choose a smooth preliminary tensor extension agreeing with
    $Q_c$ in the prescribed boundary collar. Near each critical point there is $a > 0$ such that $"tr"_V "Hess" q
    gt.eq a$ on every unit three-plane. After shrinking its neighborhood, $H gt.eq
    a \/ \| thin upright(d) q \|$ dominates the bounded tangential trace of the preliminary tensor.
    On the remaining compact regular part the level mean curvature is bounded below.
    Retain the tensor near the original boundary, and add a sufficiently large nonnegative multiple of the metric
    on the remaining compact part of the extension. The tangential trace of this addition is three times its
    coefficient. We can therefore ensure strictly positive expansion on every regular level of $q$.
    The given strict boundary inequality permits the matching in a collar of $partial X$,
    including a collar on the original side. On the Euclidean remote end take the tensor to be zero;
    its round levels already have positive mean curvature. The transition to zero can be made inside that
    Euclidean region with a nonnegative metric multiple. We have obtained smooth complete one-ended data without
    boundary, exactly Euclidean with zero tensor sufficiently far out.
  Every compact smooth weakly trapped region in this extension stays a positive distance inside $X$.
    To see this, extend $q$ to a smooth function on the interior core with values below those of a fixed smaller
    collar. If a region enters that collar or the attached extension,
    the maximum of $q$ on it occurs at a point in that part. A regular maximum cannot lie in the interior of the
    region. At a regular boundary maximum the region is on the inner side of a positively expanding level,
    with the same outward normal at contact. Tangential Hessian comparison gives $Theta_(Q_c) \( partial E \)
    gt.eq Theta_(Q_c) \( { q = q_max } \) > 0$, a contradiction.
    At a critical maximum in the interior, a direction of positive Hessian contradicts maximality.
    At a critical boundary maximum, the inward open half-space of a smooth domain contains a vector $v$ with
    $"Hess" q \( v \, v \) > 0$: choose the sign of a positive Hessian direction to point inward,
    and perturb it inward if it is tangent. A curve entering the region with this initial velocity has
    $q \( gamma \( t \) \) = q \( gamma \( 0 \) \) + t^2 "Hess" q \( v \, v \) \/ 2 + o \( t^2 \)$,
    again a contradiction. Thus one fixed original-side collar is avoided by every such region.
  The global total region consequently coincides with (9.2);
    all its candidate regions lie in the same compact subset of $"int" X$.
    The cited theorem gives its smooth stable frontier. With the closed representative used here it is a smooth
    compact region, its frontier has $Theta_(Q_c) = 0$, and it contains every candidate.
    This proves the assertion at threshold $c$ by (9.3). If a complementary component has closure in $"int" X$,
    filling it deletes whole smooth boundary components and changes no remaining outward expansion.
    The resulting larger region would still be a candidate in (9.2), contradicting maximality. ◻
]

The extension in this proof is auxiliary. Neither a constraint inequality nor a topological restriction is imposed
  on it. We will also apply the lemma after compactly supported changes of $Q$ that leave the strict outer
  barriers unchanged.

=== 9.2 Threshold continuity and collars <threshold-continuity-and-collars>

#thm([Lemma 9.2.])[
  (Continuity thresholds).  #emph[Suppose that the strict barrier condition in Lemma 42 holds for every $c$ in an
    open interval $I$. The closed regions $T_c \( X \, Q \)$ increase with $c$.
    Except at a countable set of thresholds, they are right-continuous in Hausdorff distance.
    At an empty right-continuity threshold the regions are empty for all sufficiently close larger thresholds.]
] <four:geo:threshold-continuity>

#proof[
  Inclusion of the defining classes in (9.2) proves that $T_c \( X \, Q \)$ increases with $c$.
    These are closed subsets of one fixed compact metric space $\( X \, "dist"_g \)$.
    Apply Lemma 6 to this family. Its empty-set convention gives precisely the asserted eventual emptiness.
    Since the exceptional set is countable, every nonempty open subinterval of $I$ contains a right-continuity
    threshold. ◻
]

#thm([Lemma 9.3.])[
  (Outward leaf collars).  #emph[Let $T_c \( X \, Q \)$ be nonempty,
    and let $Sigma$ be one connected component of its frontier.
    On the side exterior to this region, $Sigma$ has a smooth foliated collar,
    parametrized by $s in \[ 0 \, s_0 \]$, with $\| thin upright(d) s \| > 0$.
    With normal $nu_s = "grad" s \/ \| thin upright(d) s \|$, every leaf satisfies
#[#set math.equation(numbering: n => "(9.5)")
 $ Theta_Q \( Sigma_s \) gt.eq c . $ <four:geo:collar-expansion>]

 The collars of distinct components can be chosen disjoint.]
] <four:geo:stable-collar>

#proof[
  Lemma 42 supplies a compact smooth frontier with $Theta_Q = c$, stable for the outward normal.
    Its component $Sigma$ is closed, connected, and two-sided.
    Replacing only $Sigma$ by a sufficiently small positive outward graph with expansion at most $c$ would produce
    a larger admissible region in (9.2), contradicting that lemma’s maximality.
    The graph collar can be chosen inside $"int" X$ and disjoint from the other frontier components.
  Apply Lemma 7 with ambient dimension $d = 4$ and tensor $Q$.
    Here the shifted tensor is $Q - \( c \/ 3 \) g$; (9.3) holds for every nearby graph,
    so its linearization is the same operator $L$ used in that lemma.
    In particular, when the principal eigenvalue is zero, the normalized linear map is
  #[#set math.equation(numbering: n => "(9.6)")
   $ C^(2 \, alpha) \( Sigma \) times bb(R) arrow.r C^alpha \( Sigma \) times bb(R) \,
     wide \( v \, a \) mapsto (L v - a \, integral_Sigma v thin thin upright(d) A) $ <four:geo:augmented-stability>]
  for $0 < alpha < 1$. This is the common zero-mode isomorphism (3.11),
    whose inverse and resulting foliation are proved there. The lemma gives $Theta_Q = c$ at $s =
    0$ and $Theta_Q > c$ for $s > 0$, hence (9.5), with a smooth leaf coordinate and positive normal speed.
    Apply it to the finitely many components and shorten the collars to be disjoint. ◻
]

=== 9.3 Exterior supports and smooth enclosing regions <exterior-supports-and-smooth-enclosing-regions>

A #emph[smooth exterior support] to a closed set $D$ at $x in partial D$ is a smooth regular level ${ psi =
  0 }$ through $x$, defined in a neighborhood of $x$, such that $D$ is locally contained in ${ psi lt.eq 0 }$.
  Its outward normal is $"grad" psi \/ \| thin upright(d) psi \|$.
  Saying that $D$ has expansion at most $k$ in exterior supports means that every such support has $Theta_Q lt.eq
  k$ at contact. This definition makes no regularity assumption on $D$.

The next argument is useful because the curvatures of these supports need not be bounded.
  Ordinary approximate transport of tangent metrics would produce an uncontrolled error multiplying their second
  fundamental forms. We use a map whose differential is an exact isometry at the contact point.

#thm([Lemma 9.4.])[
  (Exact support transport).  #emph[Let $g \, Q$ be smooth on a neighborhood of a compact set,
    and let $D$ be a compact closed subset of its interior. Suppose that $D$ has expansion at most $k$ in exterior
    supports. There are $z_0 > 0$ and $C < oo$ such that, for $0 < z < z_0$, every exterior support to
$ D_z = { y : "dist"_g \( y \, D \) lt.eq z } $

 has expansion at most $k + C z$. The constant $C$ depends only on bounds for the smooth background geometry and
   $Q$ in the fixed compact neighborhood, and not on the support or its curvature.
   The allowable $z_0$ is also smaller than the distance required to keep these neighborhoods in the interior.]
] <four:geo:support-transport>

#proof[
  Apply Lemma 9 with ambient dimension $d = 4$, tensor $Q$, and the compact closed set $D$.
    Choose its fixed smooth compact neighborhood inside the interior in the present hypotheses,
    and shorten $z_0$ to keep the distance neighborhoods there.
    That lemma includes the empty case and gives exactly the required estimate,
    uniformly in the support curvature. We record its contact identities in the present notation.
  Let a support ${ psi = 0 }$ touch $D_z$ at $x'$, choose a nearest point $x in partial D$,
    and let $gamma : \[ 0 \, z \] arrow.r X$ be the unit-speed minimizing segment from $x$ to $x'$.
    Put $u_0 = dot(gamma) \( 0 \)$ and let $P_t$ be parallel transport along $gamma$.
    The support normal at $x'$ is $P_z u_0$. The common proof constructs, for each $X in T_x X$, the Jacobi field
  #[#set math.equation(numbering: n => "(9.7)")
   $ D_t^2 J_X + R \( J_X \, dot(gamma) \) dot(gamma) = 0 \, wide J_X \( 0 \) = X \, wide J_X \( z \) =
     P_z X . $ <four:geo:jacobi-transport>]
  Writing $J_X \( t \) = P_t \( X + W_X \( t \) \)$, its short-interval estimates give
  #[#set math.equation(numbering: n => "(9.8)")
   $ sup_(\[ 0 \, z \]) \| W_X \| lt.eq C z^2 \| X \| \, wide \| D_t J_X \( 0 \) \| lt.eq
     C z \| X \| . $ <four:geo:jacobi-jet-bounds>]
  For $A_z X = D_t J_X \( 0 \)$ the first-jet compatibility is
  $ chevron.l A_z X \, u_0 chevron.r = 0 \, wide \| A_z \| lt.eq C z . $
  In normal coordinates $y^i$ at $x$, let $E_v \( y \)$ denote radial parallel transport of $v in T_x X$.
    The unit field of the common construction is
  $ V \( y \) = E_(u_0) \( y \) + sum_i y^i E_(A_z e_i) \( y \) \, wide U \( y \) = frac(V \( y \), \| V \( y \) \|) . $
  Its prescribed first jet and uniform second-jet bounds are those established in that proof. The endpoint map is
  $ F_z \( y \) = exp_y \( z U \( y \) \) . $
  The exact endpoint identity and its covariant second-derivative bound specialize to
  #[#set math.equation(numbering: n => "(9.9)")
   $ F_z \( x \) = x' \, wide thin upright(d) F_z \( x \) = P_z \,
     wide \| nabla thin upright(d) F_z \( x \) \| lt.eq C z . $ <four:geo:exact-isometry>]
  The pulled-back level $psi compose F_z$ is an exterior support to $D$ at $x$,
    with normal $u_0$ and the same gradient length as $psi$ at $x'$.
    For an orthonormal basis $e_1 \, e_2 \, e_3$ of $u_0^perp$, the Hessian identity from the common proof reads
  $ "Hess" \( psi compose F_z \) \( e_a \, e_a \) = "Hess" psi \( P_z e_a \, P_z e_a \) +
    thin upright(d) psi #scale(x: 120%, y: 120%)[\(] \( nabla thin upright(d) F_z \) \( e_a \, e_a \)
    #scale(x: 120%, y: 120%)[\)] . $
  Its normalized tangential trace is the four-dimensional formula
  #[#set math.equation(numbering: n => "(9.10)")
   $ H_(psi compose F_z) \( x \) - H_psi \( x' \) = sum_(a = 1)^3 chevron.l P_z
     u_0 \, \( nabla thin upright(d) F_z \) \( e_a \, e_a \) chevron.r =
     O \( z \) . $ <four:geo:mean-curvature-transport>]
  There is no error involving $"Hess" psi$. The tensor estimate is
  $ lr(|"tr"_(u_0^perp) Q \( x \) - "tr"_(P_z \( u_0^perp \)) Q \( x' \)|) lt.eq C z . $
  These identities specialize the common proof’s comparison of the two support expansions;
    the assumed inequality at $x$ gives the bound $k + C z$ at $x'$. ◻
]

#thm([Lemma 9.5.])[
  (Smooth support enclosure).  #emph[Assume the hypotheses of Lemma 42 at threshold $c'$.
    Let $D subset.double "int" X$ be a compact closed set whose every smooth exterior support has $Theta_Q lt.eq
    k$, where $k < c'$. Then
$ D subset T_(c') \( X \, Q \) . $

 In particular, the right side is nonempty whenever $D$ is nonempty.]
] <four:lem:support-enclosure>

#proof[
  Assume $D eq.not diameter$. Choose $beta > 0$ small enough that $D_beta$ lies in $"int" X$,
    Lemma 45 applies for $0 < z lt.eq beta$, and
  #[#set math.equation(numbering: n => "(9.11)")
   $ k + C beta < c' . $ <four:geo:strict-support-gap>]
  Smooth approximation of the distance function, followed by a regular-value choice,
    gives a smooth compact region $E$ with
  $ D_(beta \/ 4) subset "int" E subset E subset "int" D_(3 beta \/ 4) . $
  For example, approximate the distance uniformly to accuracy $beta \/ 16$ and choose a regular level between $7
    beta \/ 16$ and $9 beta \/ 16$.
  Choose a smooth function $a gt.eq 0$, supported where $"dist" \( dot.op \, D \) < beta$,
    that is a sufficiently large constant near $partial E$. For $Q' = Q -
    a g$ we then have $Theta_(Q') \( partial E \) = Theta_Q \( partial E \) - 3 a < c'$.
    The boundary barriers of $X$ are unchanged. Lemma 42 applied to $Q'$ produces a nonempty smooth total region
    $T'$ containing $E$. Its frontier is nonempty because $T'$ is compactly contained in the interior of the
    connected manifold $X$ with nonempty boundary. That outward frontier satisfies
  #[#set math.equation(numbering: n => "(9.12)")
   $ Theta_Q \( partial T' \) = c' + 3 a gt.eq c' . $ <four:geo:modified-frontier>]
  Since $D$ has an open neighborhood in $E subset T'$, the number $z =
    "dist" \( D \, partial T' \)$ is positive and attained.
  Suppose $z < beta$. Then $D_z subset T'$. Indeed, a minimizing segment of length at most $z$ from $D$ to a point
    outside $T'$ would first cross $partial T'$ at distance strictly less than $z$.
    Such segments stay in $X$ by our choice of $beta$. At a pair realizing the minimum distance,
    $partial T'$ is therefore an exterior support to $D_z$. Its expansion is at most $k +
    C z < c'$ by Lemma 45 and (9.11), contradicting (9.12). Consequently $z gt.eq beta$.
  The frontier of $T'$ is outside the support of $a$, so its expansion for the original tensor is exactly $c'$.
    Thus $T'$ itself is an admissible region in (9.2) for $\( X \, Q \, c' \)$.
    Since it contains $D$, the defining maximality gives $D subset T' subset T_(c') \( X \, Q \)$. ◻
]

=== 9.4 The two colors and the trace allowance <the-two-colors-and-the-trace-allowance>

#thm([Proposition 9.6.])[
  (Geometric preparation).  #emph[For the prepared data satisfying (9.1),
    there are a closed connected exterior $Omega subset M$ with one end and nonempty compact smooth boundary $B$,
    two negative numbers $c_b \, c_w$, and a decomposition of $B$ into black and white components with the
    following properties. With the normal $nu$ into $Omega$ and $P_B = "tr"_B K$,
#[#set math.equation(numbering: n => "(9.13)")
 $ H + P_B = c_b quad upright("on black components") \, wide H - P_B = c_w quad
   upright("on white components") . $ <four:geo:two-boundary-expansions>]

 The components come from closed total-region families $cal(D)_c$ and $cal(W)_c$ at right-continuity thresholds
   $c_b$ and $c_w$, respectively. The white family is formed with the black region fixed,
   and is allowed to be empty. Every face has a disjoint smooth collar in $Omega$, with parameter $s gt.eq 0$,
   $\| thin upright(d) s \| > 0$, and the corresponding expansion toward increasing $s$ is at least $c_b$ or $c_w$.]
  #emph[There are $a_0 > 0$, a compactly supported smooth function $C$, and a positive smooth weight $rho$,
    equal to a positive constant times $r^(- 4 - delta_1)$ on the end, such that $\| C \| lt.eq a_0$ and,
    on smaller collars,
#[#set math.equation(numbering: n => "(9.14)")
 $ C = a_0 - kappa_B s quad upright("on black collars") \, wide C = - a_0 + kappa_B s quad
   upright("on white collars") \, wide kappa_B > 0 . $ <four:geo:linear-offsets>]

 Set
#[#set math.equation(numbering: n => "(9.15)")
 $ b_(-) = c_b - a_0 < 0 < - c_w + a_0 = b_(+) . $ <four:geo:height-endpoints>]

 Every real-valued function $h$ taking values in $\[ b_(-) \, b_(+) \]$ on $"supp" K ∩
   Omega$ satisfies the following inequality on $Omega$:
#[#set math.equation(numbering: n => "(9.16)")
 $ \| \( h + C \) tau \| + \| thin upright(d) C \|_g + rho lt.eq mu - \| J \|_g \, wide tau =
   "tr"_g K . $ <four:eq:trace-slack>]

 There is a smooth compactly supported extension $b$ on $Omega$ of the boundary values $b_(-)$ on black faces and
   $b_(+)$ on white faces, constant on smaller collars. Finally,
   every smooth enclosing cut of $B$ in $Omega$ has $g$-volume at least $A_(*)$.]
] <four:prop:geometric-preparation>

#proof[
  Choose a distant sphere $S_(R_0)$ beyond $"supp" K$, sufficiently large that it and all farther coordinate
    spheres have positive mean curvature. Their expansions for both $K$ and $- K$ are positive.
    Let $X_0$ be the original compact core between $S$ and $S_(R_0)$. It is connected:
    paths using the remote end can be replaced at its connected spherical cross section.
    Attach a smooth compact filling $F$ behind the entire original boundary.
    Such a filling can be constructed by taking an oppositely oriented copy of $X_0$ and capping its spherical
    boundary by a four-ball. Its remaining boundary identifies with $S$.
    Extend $g$ and $K$ smoothly across $S$ into this filling, keeping the metric positive.
    Extension of the collar jets followed by a partition of unity does this;
    no constraint condition is required in $F$. The resulting compact manifold $X$ has only the connected outer
    boundary $S_(R_0)$.
  For later parameter choices, fix now
  $ sigma_(*) = min_(X_0) \( mu - \| J \|_g \) > 0 \, wide T_(*) = max_(X_0) \| tau \| . $
  Choose $gamma > 0$ so small that
  #[#set math.equation(numbering: n => "(9.17)")
   $ gamma T_(*) lt.eq sigma_(*) \/ 8 $ <four:geo:threshold-budget>]
  and the original boundary has expansion less than $- 2 gamma$.
    By strictness and continuity, $F$ together with a fixed short exterior collar of $S$ is a smooth compact
    region whose outward boundary has expansion less than $- gamma$. For every $c in \( - gamma \, 0 \)$ form
  $ cal(D)_c = T_c \( X \, K \) . $
  Here $K$ denotes its smooth extension into $F$. Lemma 42 applies and $cal(D)_c$ contains that entire filled
    neighborhood. Its smooth frontier therefore lies strictly in the original data.
    Its complement in $X$ is connected. Indeed the collar of the connected outer sphere belongs to a unique
    complementary component; every other component would be an interior hole and could be filled,
    contrary to maximality.
  Choose $c_b in \( - gamma \, 0 \)$ at a right-continuity threshold by Lemma 43.
    Write $Y$ for the closed complement of $"int" cal(D)_(c_b)$ in $X$.
    This is a smooth compact connected manifold with the outer sphere and the black frontier as its boundary.
    For the white tensor $- K$, all these boundary components have strictly positive outward expansion.
    On a black component the outward normal of $Y$ is the reverse of the outward normal of $cal(D)_(c_b)$,
    so the expansion is
  #[#set math.equation(numbering: n => "(9.18)")
   $ - H - "tr"_(partial cal(D)_(c_b)) K = - c_b > 0 . $ <four:geo:reversed-black-barrier>]
  This changes both the normal and the tensor in an auxiliary problem;
    the original boundary still has its prescribed future sign.
  For $c in \( - gamma \, 0 \)$ define the white family
  $ cal(W)_c = T_c \( Y \, - K \) . $
  It may be empty. Lemmas 42 and 43 give a right-continuity threshold $c_w in \( - gamma \, 0 \)$.
    Every nonempty white region lies strictly inside $Y$, so $cal(D)_(c_b)$ and $cal(W)_(c_w)$ are disjoint closed
    sets, a positive distance apart. Notice that the black threshold and manifold $Y$ are fixed before making this
    second threshold choice.
  In the filled one-ended manifold take the component of the open complement of $cal(D)_(c_b) union
    cal(W)_(c_w)$ that reaches the end, and let $Omega$ be its closure.
    Its boundary is the union of those entire frontier components adjoining this exterior.
    To justify the word “entire,” a smooth connected frontier component has a connected thin collar on each side;
    the component of its exterior side is therefore constant along the frontier.
    Both frontiers are compact and smooth with finitely many components, and they are disjoint.
    Thus $Omega$ is smooth, closed, and connected, and its boundary $B$ is a union of complete smooth components.
    It has one end, the original end, and lies in the original manifold because the black region contains the
    filling and a collar of $S$. Its boundary is nonempty: the component reaching infinity is separated from that
    nonempty filled region. The inherited metric is complete up to $B$;
    boundary charts give local completeness at finite limit points,
    and completeness of the original end prevents escape in finite distance.
  Call its retained $cal(D)_(c_b)$ faces black and its retained $cal(W)_(c_w)$ faces white.
    The normals into $Omega$ are the outward normals of these regions. Their threshold equations give (9.13).
    Figure 1 illustrates these orientations; $Omega_R$ there denotes the part of $Omega$ inside a distant
    coordinate sphere $S_R$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: (4.18, 1.947), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((3.515, 1.14), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S_R$]]])])
  circle((-1.662, 0), radius: (1.064, 1.026), fill: rgb("#dedede"), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  circle((-1.824, -0.019), radius: (0.456, 0.399), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-1.824, -0.019), [#text(size: 9pt)[$S$]])
  content((-1.662, 0.684), [#text(size: 9pt)[$cal(D)_(c_b)$]])
  circle((1.425, 0.6175), radius: (0.741, 0.5035), fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  content((1.425, 0.6175), [#text(size: 9pt)[$cal(W)_(c_w)$]])
  line((-0.5985, 0), (0.171, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-0.2137, 0), [#text(size: 9pt)[$nu_b$]], anchor: "south", padding: 0.1176cm)
  line((1.425, 0.114), (1.425, -0.6175), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.425, -0.2517), [#text(size: 9pt)[$nu_w$]], anchor: "west", padding: 0.1176cm)
  content((0.1425, -0.9975), [#text(size: 9pt)[$Omega_R$]])
  content((-1.662, -1.349), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$H+P_B=c_b$]]])])
  content((1.425, 1.472), [#text(size: 9pt)[$H-P_B=c_w$]])
  line((4.18, 0), (4.94, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4.94, 0), [#text(size: 9pt)[end $e$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: A schematic of the auxiliary exterior; one black and one possible white frontier component are shown. The white family may be empty. The black region encloses the original boundary. Both normals point into the retained exterior, but its black and white faces have prescribed expansion for $K$ and $- K$, respectively. The drawing represents incidence and orientations, not the topology or dimension of the hypersurfaces. ],
  ) <four:fig:two-frontiers>
  Apply Lemma 44 to their respective total regions and shorten the collars so they lie on the $Omega$ side and are
    mutually disjoint. This gives all the asserted leaf inequalities.
    The support enclosure Lemma 46 is available for the full families $cal(D)_c$ and $cal(W)_c$ on $X$ and $Y$,
    respectively; in the latter case the reversed black barriers remain fixed.
  All these collars lie in the fixed original core $X_0$, so the lower bound $sigma_(*)$ was fixed before either
    threshold or any collar width. For each collar choose a smooth profile $q_B \( s \) in \[ 0 \, 1 \]$,
    supported in that collar, with $q_B \( s \) = 1 - alpha_B s$ near its face and $alpha_B > 0$.
    Such a profile is obtained by multiplying this linear function by a nonnegative cutoff supported before the
    linear function can become negative. With disjoint supports, define
  $ C = a_0 sum_B epsilon_B q_B \( s \) \, wide epsilon_B =
    cases(delim: "{", 1 \, & B upright(" black") \,, - 1 \, & B upright(" white") .) $
  There is a finite constant $M_(*)$, now depending on the chosen collars and profiles, such that $\| C \| lt.eq
    a_0$ and $\| thin upright(d) C \| lt.eq a_0 M_(*)$. Formula (9.14) holds with $kappa_B = a_0 alpha_B > 0$.
    Only at this point choose $a_0 > 0$ small enough that
  #[#set math.equation(numbering: n => "(9.19)")
   $ a_0 \( 2 T_(*) + M_(*) \) lt.eq sigma_(*) \/ 8 . $ <four:geo:amplitude-budget>]
  For $b_(-) lt.eq h lt.eq b_(+)$ we have $\| h + C \| lt.eq gamma + 2 a_0$, and hence on $X_0 ∩ Omega$
  #[#set math.equation(numbering: n => "(9.20)")
   $ \| \( h + C \) tau \| + \| thin upright(d) C \| lt.eq gamma T_(*) + a_0 \( 2 T_(*) + M_(*) \) lt.eq
     sigma_(*) \/ 4 . $ <four:geo:compact-slack>]
  At points outside $"supp" K$ the trace term vanishes, so this estimate requires no restriction there on the
    value of $h$.
  Finally choose a constant $rho_(*) > 0$ so small that
  $ rho_(*) lt.eq c_0 \/ 4 \, wide rho_(*) max_(X_0) r^(- 4 - delta_1) lt.eq sigma_(*) \/ 4 \, wide rho =
    rho_(*) r^(- 4 - delta_1) . $
  On $X_0 ∩ Omega$, (9.20) plus this choice bounds the left side of (9.16) by $sigma_(*) \/ 2$.
    Outside $X_0$, $K = C = 0$, and (9.1) gives the required inequality directly. This proves (9.16).
    This order of choices uses no lower bound on collar widths as $c_b \, c_w$ approach zero:
    the thresholds are chosen first, the collars next, and their amplitude last.
    Ordinary collar cutoffs also give the stated compactly supported smooth extension of the constants $b_(-)$ and
    $b_(+)$.
  If $D_e$ is an admissible closed connected outer domain for a cut in $Omega$, it is also closed in $M$,
    because $Omega$ is closed in $M$. It is a smooth codimension-zero submanifold of $M$,
    its interior lies in $"int" M$, and it contains the distant original end.
    Its entire intrinsic boundary, including every part coincident with $B$,
    is therefore an admissible original enclosing cut. Its area is at least $A_(*)$.
    This proves the final assertion without assuming the existence of a minimizing cut. ◻
]

== 10 A boundary system for scalar curvature <four:sec:system>

Fix the prepared exterior and the geometric choices of Proposition 47.
  All contractions and derivatives in this section use its background metric $g$,
  unless another metric is indicated. In particular, $tau = "tr"_g K$ is unrestricted.
  The boundary normal $nu$ points into $Omega$. Let $Omega_R$ denote the truncation at a large coordinate sphere
  $S_R$, so its ordinary outward normal at its inner boundary $B$ is $- nu$.

The purpose of the system is to produce a metric $hat(g) =
  e^(2 t) \( g + l \( t \)^2 thin upright(d) f^2 \)$ with nonnegative scalar curvature and negative boundary mean
  curvature. The parameter $eta_N$ below makes the prescribed trace depend strictly increasingly on $f$.
  A separate penalty prevents $t$ from reaching $- epsilon.alt$.
  This section proves that prevention using a coarse height bound.
  The narrower height interval needed to use (9.16) will be proved subsequently.

=== 10.1 Variables and a scalar-curvature identity <variables-and-a-scalar-curvature-identity>

The warped-graph scalar identity and coupled-Penrose strategy of Bray and Khuri #cite(label("BrayKhuri2010"))
  #cite(label("BrayKhuri2011")) extend the earlier Jang–Schoen–Yau graph method #cite(label("Jang1978"))
  #cite(label("SchoenYau1981")). The computation below fixes the dimension-four coefficients and retains the
  unrestricted trace of $K$. The trace-discrepancy term already appears before imposing the generalized Jang
  equation in #cite(label("BrayKhuri2011")) Identity 9, p. 580.
  The prescribed $F = h + C$, nonzero divergence source, and floor penalty are part of the present system;
  its existence is proved independently, not inferred from an older zero-divergence coupling.

Fix $0 < epsilon.alt < 1$ and a smooth nonincreasing function $theta.alt :
  bb(R) arrow.r \[ 0 \, 1 \]$ equal to one on $\( - oo \, 0 \]$ and to zero on $\[ 1 \, oo \)$.
  For every integer $N gt.eq 4$ define

#[#set math.equation(numbering: n => "(10.1)")
 $ p \( t \) = N theta.alt \( N t \) \, wide l \( t \) = exp (integral_0^t p \( s \) thin thin upright(d) s) \,\
L_0 \( t \) = e^(2 t) l \( t \) \, wide ell = e^(- epsilon.alt N) \, wide eta_N =
  ell^(3 \/ 2) . $ <four:sys:parameters>]

Thus $0 lt.eq p lt.eq N$, $l \( t \) = e^(N t)$ for $t lt.eq 0$,
  and $l$ is constant with value between one and $e$ for $t gt.eq 1 \/ N$.
  In particular $l \( - epsilon.alt \) = ell$. The unknowns are real functions $f \, Z$.
  Define $t$ implicitly, and then all the remaining variables, by

#[#set math.equation(numbering: n => "(10.2)")
 $ sigma = \| "grad" f \| \, wide D = 1 + l \( t \)^2 sigma^2 \, wide d = D^(- 1) \, wide Z = t + 1 / 6 log D \,
   wide h = eta_N f \,\
w = frac(l "grad" f, sqrt(D)) \, wide a = \| w \| \, wide v = a^2 = 1 - d \, wide chi = frac(3 d, 3 + p v) \,\
A_d = "Id" - w ⊗ w \, wide A_chi = "Id" - frac(3 + p, 3 + p v) w ⊗ w \, wide u = L_0 sqrt(D) . $ <four:sys:variables>]

We identify vectors and covectors using $g$. A symmetric endomorphism also denotes the corresponding contravariant
  tensor, and $\| xi \|_A^2 = A \( xi \, xi \)$ for a covector $xi$.
  For fixed $thin upright(d) f$, the derivative of the defining expression for $Z$ with respect to $t$ is $1 +
  p v \/ 3 gt.eq 1$. That expression tends to $- oo$ and $+ oo$ at the two ends of the real line.
  It therefore defines a unique smooth $t = t \( x' \, Z \, thin upright(d) f \)$, with $x'$ the base point,
  for all inputs, including inputs below the proposed floor. No gradient bound is needed for this definition.
  The eigenvalues of $A_d$ and $A_chi$ on the line spanned by $"grad" f$ are $d$ and $chi$;
  their other three eigenvalues are one. Consequently

#[#set math.equation(numbering: n => "(10.3)")
 $ 0 < frac(3 d, 3 + N) lt.eq chi lt.eq d lt.eq 1 . $ <four:sys:eigenvalues>]

Set

#[#set math.equation(numbering: n => "(10.4)")
 $ macron(g) = g + l^2 thin upright(d) f^2 \, wide hat(g) = e^(2 t) macron(g) \, wide H^f = l /
   sqrt(D) "Hess"_g f \, wide S_f = K + H^f \,\
F = "tr"_(A_chi) S_f \, wide V = u A_chi #scale(x: 120%, y: 120%)[\(] 3 "grad" Z +
  K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] . $ <four:sys:metric-and-trace>]

Where $sigma > 0$, let $e = "grad" f \/ sigma$. Decompose $S_f$ into its transverse block $T = S_f \|_(e^perp)$,
  mixed block $M = S_f \( e \, dot.op \) \|_(e^perp)$, and axial entry $j = S_f \( e \, e \)$; write $T^0 = T -
  1 / 3 \( "tr" T \) g \|_(e^perp)$. Thus $"tr" T = F - chi j$.
  Also write $x = e \( t \)$ and $y = \( thin upright(d) t \) \|_(e^perp)$.
  The symbol $M$ in this block notation is a covector, not the original manifold.

#thm([Proposition 10.1.])[
  (Scalar identity).  #emph[For arbitrary smooth $f \, Z$ and arbitrary symmetric $K$,
#[#set math.equation(numbering: n => "(10.5)")
 $ 1 / 2 e^(2 t) "Scal"_(hat(g)) = mu + J \( w \) + cal(T) + w \( F \) - F tau - u^(- 1) "div"_g V \,
   $ <four:eq:scalar-identity>]

 where the smooth scalar $cal(T)$ is given, on ${ thin upright(d) f eq.not 0 }$, by
#[#set math.equation(numbering: n => "(10.6)")
 $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + \( p + 1 \) a y \|^2 - v \| y \|^2 + 3 \( p + 1 \) \( \| y \|^2 + d x^2 \)\
 & - 1 / 3 \( F - chi j \)^2 + chi j^2 - chi F j + F^2 + 2 \( p + 1 \) chi j a x . $ <four:eq:quadratic-form>]

 The expression extends smoothly across ${ thin upright(d) f = 0 }$,
   where any unit axis may be used in the block expression.]
] <four:sys:scalar-proposition>

#proof[
  We derive the identity in a stationary Lorentzian metric,
    keeping its normal second form distinct from the prescribed tensor $K$. On the product with coordinate $s'$ use
  $ upright(bold(g)) = - l^2 \( thin upright(d) s' - thin upright(d) f \)^2 + macron(g) . $
  Its constant-$s'$ slices have metric $g$. Their lapse, shift, and normal second form,
    with the convention that the second form is half the normal metric rate, are
  #[#set math.equation(numbering: n => "(10.7)")
   $ U = l sqrt(D) \, wide beta = l^2 "grad" f = U w \,\
k = - frac("sym" nabla beta, U) = - H^f - p \( thin upright(d) t ⊗ w + w ⊗ thin upright(d) t \) .
  $ <four:sys:stationary-data>]
  Here $"sym"$ includes the factor $1 \/ 2$. Put $theta = "tr"_g k$, and let $N_0$ be the future unit normal.
    The contracted Gauss and normal expansion identities are
  $ "Scal"_g = upright(bold(R)) + 2 upright(bold(R i c)) \( N_0 \, N_0 \) + \| k \|^2 - theta^2 \, wide
    upright(bold(R i c)) \( N_0 \, N_0 \) = - N_0 theta - \| k \|^2 + U^(- 1) Delta_g U . $
  Stationarity gives $U N_0 theta = - beta \( theta \)$ and $"div" beta = - U theta$. If
  $ sans(B) \( A \, B \) = A : B - \( "tr"_g A \) \( "tr"_g B \) \, wide P_A = A - \( "tr"_g A \) g \, $
  the preceding two formulas consequently yield
  #[#set math.equation(numbering: n => "(10.8)")
   $ U upright(bold(R)) = U #scale(x: 120%, y: 120%)[\(] "Scal"_g +
     sans(B) \( k \, k \) #scale(x: 120%, y: 120%)[\)] - 2 "div" \( "grad" U + theta beta \) .
     $ <four:sys:stationary-scalar>]
  In the static coordinate $s' - f$ one instead has
  $ upright(bold(R)) = "Scal"_(macron(g)) - 2 l^(- 1) Delta_(macron(g)) l \, wide Delta_(macron(g)) phi.alt = l /
    U "div" (U / l A_d "grad" phi.alt) . $
  Direct differentiation of $U = l sqrt(D)$ gives
  $ "grad" U - U / l A_d "grad" l = - k \( beta \, dot.op \) . $
  Moreover, using $J = "div" P_K$, symmetry of $P_K$, and $"sym" nabla beta = - U k$ gives
  $ "div" \( P_K beta \) = U { J \( w \) - sans(B) \( K \, k \) } . $
  Substitute these identities into (10.8), use $mu = \( "Scal"_g - sans(B) \( K \, K \) \) \/ 2$, and put $Q = K -
    k$. The result is
  #[#set math.equation(numbering: n => "(10.9)")
   $ 1 / 2 "Scal"_(macron(g)) = mu + J \( w \) + 1 / 2 sans(B) \( Q \, Q \) -
     U^(- 1) "div" \( U P_Q w \) . $ <four:sys:bar-scalar>]
  For example, the divergence arising directly from (10.8) is $U^(- 1) "div" \( U P_k w \)$;
    adding $J \( w \)$ combines it with $- U^(- 1) "div" \( U P_K w \)$ to give the last term in (10.9).
    This also fixes its sign.
  The four-dimensional conformal formula is
  $ 1 / 2 e^(2 t) "Scal"_(hat(g)) = 1 / 2 "Scal"_(macron(g)) - 3 Delta_(macron(g)) t -
    3 \| thin upright(d) t \|_(A_d)^2 . $
  Since $Delta_(macron(g)) t = U^(- 1) "div" \( U A_d "grad" t \) - p \| thin upright(d) t \|_(A_d)^2$ and $u =
    e^(2 t) U$, changing the divergence weight from $U$ to $u$ gives
  #[#set math.equation(numbering: n => "(10.10)")
   $ 1 / 2 e^(2 t) "Scal"_(hat(g)) =  & mu + J \( w \) + 1 / 2 sans(B) \( Q \, Q \) + 2 P_Q \( w \, "grad" t \) +
     3 \( p + 1 \) \| thin upright(d) t \|_(A_d)^2\
 & - u^(- 1) "div" #scale(x: 120%, y: 120%)[\(] u \( P_Q w + 3 A_d "grad" t \) #scale(x: 120%, y: 120%)[\)] .
   $ <four:sys:pretrace-identity>]
  The following differential identities follow from (10.2):
  #[#set math.equation(numbering: n => "(10.11)")
   $ 3 thin upright(d) Z & = \( 3 + p v \) thin upright(d) t + H^f \( w \, dot.op \) \,\
"div" w & = "tr"_(A_d) H^f + p d thin w \( t \) \,\
thin upright(d) log u & = \( p + 2 + p v \) thin upright(d) t +
  H^f \( w \, dot.op \) . $ <four:sys:differential-identities>]
  They imply
  #[#set math.equation(numbering: n => "(10.12)")
   $ V / u & = P_Q w + 3 A_d "grad" t + F w \,\
u^(- 1) "div" \( u w \) & = "tr"_g H^f + 2 \( p + 1 \) w \( t \)\
 & = F + \( 1 - chi \) j - tau + 2 \( p + 1 \) w \( t \) . $ <four:sys:trace-divergence>]
  Adding $u F w$ inside the divergence in (10.10) therefore leaves $w \( F \) + F u^(- 1) "div" \( u w \)$.
    Its trace contribution is exactly $- F tau$, while the remaining quadratic expression is
  #[#set math.equation(numbering: n => "(10.13)")
   $ cal(T) =  & 1 / 2 sans(B) \( Q \, Q \) + 2 P_Q \( w \, "grad" t \) + 3 \( p + 1 \) \| thin upright(d) t \|_(A_d)^2\
 & + F (F + frac(3 + p, 3 + p v) S_f \( w \, w \) + 2 \( p + 1 \) w \( t \)) . $ <four:sys:invariant-quadratic>]
  This is smooth even at $w = 0$, since $\( 1 - chi \) j = \( 3 + p \) S_f \( w \, w \) \/ \( 3 + p v \)$.
    For the block expansion, $Q$ has blocks $T$, $M + p a y$, $j + 2 p a x$, and $"tr" T = F - chi j$.
    Expanding (10.13) gives (10.6). At $w = 0$ it reduces to
  $ cal(T) = 1 / 2 #scale(x: 120%, y: 120%)[\(] \| S_f \|^2 + \( "tr"_g S_f \)^2 #scale(x: 120%, y: 120%)[\)] +
    3 \( p + 1 \) \| thin upright(d) t \|^2 \, $
  which is independent of the auxiliary axis. This proves all assertions. ◻
]

=== 10.2 Coercivity and the boundary identity <coercivity-and-the-boundary-identity>

Throughout the proof, $Pi_N$ denotes a bound of the form $C \( 1 + N \)^(a_(upright("pol")))$ for a finite
  nonnegative integer $a_(upright("pol"))$. Its coefficient $C$ and exponent $a_(upright("pol"))$ may depend on
  the fixed prepared data, $epsilon.alt$, the chosen collars and smooth switches,
  and any explicitly fixed small absorption constant. They never depend on $R$, a homotopy parameter,
  or a solution. Different occurrences may denote larger such bounds.
  Constants denoted by $C \( N \)$ in later fixed-$N$ analytic estimates have no polynomial restriction and will
  not enter a limit requiring polynomial control.

#thm([Lemma 10.2.])[
  (Polynomial coercivity).  #emph[For all inputs in (10.2),
#[#set math.equation(numbering: n => "(10.14)")
 $ \| T \|^2 + \| M \|^2 + d j^2 + F^2 + \| thin upright(d) t \|_(A_d)^2 lt.eq Pi_N cal(T) . $ <four:eq:coercivity>]

 At a point where $thin upright(d) t = 0$, there are absolute constants $c \, C > 0$ such that
#[#set math.equation(numbering: n => "(10.15)")
 $ c #scale(x: 120%, y: 120%)[\(] \| T^0 \|^2 + \| M \|^2 + chi j^2 + F^2 #scale(x: 120%, y: 120%)[\)] & lt.eq cal(T)\
 & lt.eq C #scale(x: 120%, y: 120%)[\(] \| T^0 \|^2 + \| M \|^2 + chi j^2 +
   F^2 #scale(x: 120%, y: 120%)[\)] . $ <four:sys:stationary-coercivity>]

]
] <four:sys:coercivity-lemma>

#proof[
  Completing squares in (10.6) gives the exact identity
  #[#set math.equation(numbering: n => "(10.16)")
   $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + \( p + 1 \) a y \|^2 + #scale(x: 120%, y: 120%)[\(] 3 \( p + 1 \) -
     v #scale(x: 120%, y: 120%)[\)] \| y \|^2\
 & + 3 \( p + 1 \) d (x + frac(chi a j, 3 d))^2 + 2 / 3 (F - frac(chi j, 4))^2 +
   frac(d \( 48 - 3 d \), 8 \( 3 + p v \)^2) j^2 . $ <four:sys:exact-squares>]
  For the final coefficient, the identity used in this completion is
  $ chi - 3 / 8 chi^2 - frac(\( p + 1 \) chi^2 v, 3 d) = frac(d \( 48 - 3 d \), 8 \( 3 + p v \)^2) . $
  The coefficient of $\| y \|^2$ is at least two, and the last coefficient is at least $45
    d \/ \[ 8 \( 3 + N \)^2 \]$. Thus $d j^2 lt.eq C \( 3 + N \)^2 cal(T)$.
    The inequalities $chi^2 lt.eq d^2 lt.eq d$ then recover $F^2$ from its shifted square and $d
    x^2$ from its shifted square, at polynomial cost. Recovering $M$ costs at most $C \( 1 + N \)^2 \| y \|^2$,
    and recovering $T$ uses $"tr" T = F - chi j$. This proves (10.14); these observations, for instance,
    allow one common bound $C \( 1 + N \)^2$ in that inequality.
  When $thin upright(d) t = 0$, complete only the $\( F \, j \)$ terms to obtain
  #[#set math.equation(numbering: n => "(10.17)")
   $ cal(T) = 1 / 2 \| T^0 \|^2 + \| M \|^2 + 2 / 3 (F - frac(chi j, 4))^2 +
     chi (1 - frac(3 chi, 8)) j^2 . $ <four:sys:stationary-squares>]
  Since $5 \/ 8 lt.eq 1 - 3 chi \/ 8 lt.eq 1$ and $chi^2 lt.eq chi$, this gives (10.15) with absolute constants. ◻
]

#thm([Lemma 10.3.])[
  (Boundary conversion).  #emph[On any smooth face on which $f$ is constant, let $P_B = "tr"_B K$, $w_nu =
    chevron.l w \, nu chevron.r$, and let $H$ be its background mean curvature for the normal into $Omega$. Then
#[#set math.equation(numbering: n => "(10.18)")
 $ V_nu / u = d \( H + 3 partial_nu t \) - H + w_nu \( F - P_B \) \, wide hat(H) =
   e^(- t) sqrt(d) thin \( H + 3 partial_nu t \) . $ <four:eq:boundary-identity>]

]
] <four:sys:boundary-lemma>

#proof[
  With $upright("II")_B \( X \, Y \) = g \( nabla_X nu \, Y \)$ for tangent vectors,
    one has tangentially $"Hess" f = \( partial_nu f \) upright("II")_B$, so $"tr" T = P_B + w_nu H$ and $chi j =
    F - P_B - w_nu H$. Use this relation in the first identity of (10.12); as $w$ is normal on the face, it gives
  $ V_nu \/ u = 3 d partial_nu t + w_nu \( F - P_B - w_nu H \) \, $
  which is the first assertion because $w_nu^2 = 1 - d$. The induced metric of $macron(g)$ on the face equals
    $g \|_B$, and its normal in base coordinates is $sqrt(d) thin nu$.
    In the tangential first variation, $l^2 thin upright(d) f^2$ contributes zero since the tangential derivatives
    of $f$ vanish there. Hence $H_(macron(g)) = sqrt(d) thin H$.
    Applying the boundary conformal formula with $nu_(macron(g)) = sqrt(d) thin nu$ proves the second assertion.
    Both assertions also hold when $thin upright(d) f = 0$. ◻
]

=== 10.3 The equations and their four-stage homotopy <the-equations-and-their-four-stage-homotopy>

Extend the end radius to a positive smooth function $r gt.eq 1$ on $Omega$ and set

#[#set math.equation(numbering: n => "(10.19)")
 $ rho_0 = r^(- 4 - delta_1) \, wide rho_1 = r^(- 3) \, wide m_0 \( t \) =
   theta.alt #scale(x: 120%, y: 120%)[\(] N \( t + epsilon.alt \) #scale(x: 120%, y: 120%)[\)] \, wide cal(P) =
   C_N \( rho_0 + v rho_1 \) \,\
Xi = delta_0 cal(T) + rho + delta_0 eta_N a sigma - m_0 \( t \) cal(P) . $ <four:sys:source>]

The constant $delta_0 > 0$ and the polynomial $C_N$ will be fixed in Proposition 54.
  The smooth positive weight $rho$ comes from (9.16); in particular $rho lt.eq C rho_0$.
  The combination $a sigma = l \| thin upright(d) f \|^2 \/ sqrt(D)$ is smooth also at $thin upright(d) f = 0$,
  so all terms of $Xi$ are smooth functions of the indicated jets. Choose a constant $N_B > 1 + sup_B \| H \|$, and put

$ cal(B) = - H + w_nu \( F - P_B \) - N_B d . $

The desired system is

#[#set math.equation(numbering: n => "(10.20)")
 $
   cases(delim: "{", F = h + C \, & upright("in ") Omega_R \,, "div" V = u Xi \, & upright("in ") Omega_R \,, h =
   b \, quad V_nu \/ u = cal(B) \, & upright("on ") B \,, f = Z = 0 \, & upright("on ") S_R .) $ <four:eq:system>]

In every boundary flux expression the symbol $F$ is evaluated using the prescribed trace right side.
  Thus the boundary condition contains no second derivative of $f$.
  For a solution of (10.20), (10.18) immediately gives $hat(H) = - e^(- t) sqrt(d) thin N_B < 0$.

We specify the entire homotopy because its boundary modifications and strictly increasing height term will be used
  in the a priori estimates. The stages run from the desired system to the terminal problem with solution $f = Z =
  0$; Section 13 transfers existence back along this homotopy.
  Take a smooth $j_0 : bb(R) arrow.r \[ 0 \, 1 \]$ which is zero for $t lt.eq 0$ and one for $t gt.eq 1$.
  For $0 lt.eq lambda lt.eq 1$ put

$ V_lambda = u A_chi #scale(x: 120%, y: 120%)[\(] 3 "grad" Z +
  lambda K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] . $

In stages 1–3 use

#[#set math.equation(numbering: n => "(10.21)")
 $
   cases(delim: "{", "div" V_lambda = u Xi & upright("in ") Omega_R \,, \( V_lambda \)_nu \/ u = \[ 1 - \( 1 -
   lambda \) j_0 \( t \) \] \[ cal(B) - \( 1 - lambda \) \( A_chi K \( w \, dot.op \) \)_nu \] & upright("on ")
   B .) $ <four:eq:homotopy-flux>]

Keep the outer data $f = Z = 0$ throughout.

Here are explicit smooth choices of the auxiliary trace terms.
  Fix $0 < 4 xi_1 < b_(+) - b_(-)$ and smooth height switches $q_(-) \, q_(+)$ such that

$ q_(-) \( z \) = 1 & \( z lt.eq b_(-) + xi_1 \) \, & q_(-) \( z \) = 0 quad \( z gt.eq b_(-) + 2 xi_1 \) \,\
q_(+) \( z \) = 0 & \( z lt.eq b_(+) - 2 xi_1 \) \, & q_(+) \( z \) = 1 quad \( z gt.eq b_(+) - xi_1 \) \, $

where $q_(-)$ is nonincreasing and $q_(+)$ is nondecreasing.
  Choose a smooth direction switch $q_d$ with values in $\[ 0 \, 1 \]$,
  equal to one on $\( - oo \, - 3 \/ 4 \]$ and zero on $\[ - 1 \/ 2 \, oo \)$.
  On each collar write $nu_s = "grad" s \/ \| thin upright(d) s \|$, so $nu_s = nu$ at the face,
  and choose a smooth cutoff $omega_B$ supported there and equal to one near the face. The collars are disjoint.
  With fixed constants

$ A_0 > 2 sup_B \| H \| + 1 \, wide A_1 > sup_B \| H \| + 1 \, $

define, extending by zero outside the collars,

#[#set math.equation(numbering: n => "(10.22)")
 $ D_0 \( x' \, w \, z \) & = - A_0 omega_B \( x' \) q_d \( w dot.op nu_s \) q_(-) \( z \) &  &
   upright("on black collars") \,\
D_0 \( x' \, w \, z \) & = A_0 omega_B \( x' \) q_d \( - w dot.op nu_s \) q_(+) \( z \) &  &
  upright("on white collars") \,\
D_1 \( x' \, w \) & = A_1 omega_B \( x' \) thin w dot.op nu_s &  & upright("on every collar") . $ <four:sys:switches>]

Both terms vanish at $w = 0$, are bounded for $\| w \| lt.eq 1$,
  and have bounded derivatives of every order on bounded height ranges. These bounds are independent of $N$.
  In addition $partial_z D_0 gt.eq 0$.

The successive trace prescriptions and inner Dirichlet data are as follows;
  the indicated parameter moves in the displayed direction.

+ Decrease $lambda$ from one to zero, keeping $F = h + C$ and $h \|_B = b$.
+ Keep $lambda = 0$, increase $alpha_0$ from zero to one, and use $F = h + C +
  alpha_0 D_0 \( x' \, w \, h \)$ and $h \|_B = b$.
+ Keep $lambda = 0$, increase $zeta$ from zero to one, and use
  #[#set math.equation(numbering: n => "(10.23)")
   $ F =  & h + \( 1 - zeta \) #scale(x: 120%, y: 120%)[\[] C +
     D_0 \( x' \, w \, h + zeta b \( x' \) \) #scale(x: 120%, y: 120%)[\]]\
 & + zeta #scale(x: 120%, y: 120%)[\[] "tr"_(A_chi) K + D_1 \( x' \, w \) #scale(x: 120%, y: 120%)[\]] \, wide
   h \|_B = \( 1 - zeta \) b . $ <four:sys:trace-prescriptions>]
+ Retain the terminal prescription $F = h + "tr"_(A_chi) K + D_1$ and $h \|_B = 0$.
  Keep $lambda = 0$ and multiply both right sides of (10.21) by a common parameter $gamma$, decreasing from one to zero.

The endpoints agree, so this is a continuous homotopy. All trace right sides have derivative at least one with
  respect to $h$, with $\( x' \, w \, t \)$ fixed. This is also the relevant derivative when comparing scalar
  solutions at a shared gradient and shared $Z$, since $t$ is independent of the value of $f$.

Two consequences of these choices will be useful. First, at a stage 3 face,
  evaluate the prescribed right side at $h = \( 1 - zeta \) b$ and at the limiting values $w = plus.minus nu$,
  $d = chi = 0$. It obeys

#[#set math.equation(numbering: n => "(10.24)")
 $ F \( nu \) gt.eq P_B + H \, wide F \( - nu \) lt.eq P_B - H . $ <four:sys:direction-inequalities>]

Indeed, on a black face $b + C = P_B + H$, $D_0 \( nu \, b \) = 0$, and $D_0 \( - nu \, b \) = - A_0$;
  on a white face $b + C = P_B - H$, $D_0 \( - nu \, b \) = 0$, and $D_0 \( nu \, b \) = A_0$.
  The terminal expressions are $P_B plus.minus A_1$. Each inequality follows for both endpoints from the choices
  of $A_0 \, A_1$, and hence for their convex combination.

Second, throughout stage 4 the scalar solution is $f = 0$, for every trial $Z$.
  Its equation is $"tr"_(A_chi) H^f = eta_N f + D_1$, with zero boundary values.
  At a positive interior maximum $w = 0$, $D_1 = 0$, $A_chi = "Id"$, and $l Delta f = eta_N f > 0$,
  a contradiction; a negative minimum is excluded in the same way. Consequently in this stage

#[#set math.equation(numbering: n => "(10.25)")
 $ f = 0 \, quad t = Z \, quad cal(T) = cal(T)_K + 3 \( p + 1 \) \| thin upright(d) t \|^2 \, wide cal(T)_K = 1 /
   2 \( \| K \|^2 + tau^2 \) \, $ <four:sys:terminal-system>]

and its two remaining equations are exactly

$ "div" \( 3 u "grad" t \) = gamma u Xi \, wide 3 partial_nu t = gamma \[ 1 - j_0 \( t \) \] \( - H - N_B \) . $

=== 10.4 Coarse heights and an outer boundary estimate <coarse-heights-and-an-outer-boundary-estimate>

#thm([Lemma 10.4.])[
  (Height bound before the floor).  #emph[There exist fixed $r_0$ and $C_(*) > 0$, independent of $N$, $R$,
    and all homotopy parameters, with the following property.
    Every smooth solution of the trace equation in any stage, with its prescribed Dirichlet data,
    on $Omega_R$ for $R gt.eq 2 r_0$ satisfies
#[#set math.equation(numbering: n => "(10.26)")
 $ \| h \| + \| F \| lt.eq C_(*) \, wide \| h \| lt.eq C_(*) \( r^(- 3 \/ 2) - R^(- 3 \/ 2) \)
   quad \( r_0 lt.eq r lt.eq R \) . $ <four:sys:coarse-height>]

 Here $Z$ may be arbitrary; the divergence equation and the condition $t gt.eq - epsilon.alt$ are not assumed.
   In particular, with the prescribed outer value $Z = 0$,
#[#set math.equation(numbering: n => "(10.27)")
 $ \| "grad" f \| lt.eq C_(*) eta_N^(- 1) R^(- 5 \/ 2) quad upright("on ") S_R . $ <four:sys:outer-gradient>]

 For every fixed $N$ there is $R_min \( N \) gt.eq 2 r_0$, chosen to tend to infinity with $N$,
   such that every such solution for $R gt.eq R_min \( N \)$ has
#[#set math.equation(numbering: n => "(10.28)")
 $ t > - epsilon.alt quad upright("on ") S_R . $ <four:sys:outer-floor>]

]
] <four:lem:coarse-height>

#proof[
  At an interior extremum of $h$, $w = 0$ and both auxiliary terms vanish. The trace equation becomes
  $ l Delta f = h + C - tau quad upright("in stages 1 and 2") \, wide l Delta f =
    h + \( 1 - zeta \) \( C - tau \) quad upright("in stage 3") . $
  Since $l > 0$, comparison at a maximum and a minimum bounds $\|
    h \|$ by $max \( sup_B \| b \| \, parallel C - tau parallel_oo \)$. Stage 4 has $h = 0$.
    All prescribed trace right sides then bound $\| F \|$ by a fixed constant, because $D_0 \,
    D_1$ are bounded and $parallel A_chi parallel lt.eq 1$.
  Choose $r_0$ beyond the supports of $K \, C \, b \, D_0 \, D_1$.
    At a comparison with a radial function, the axis of $A_chi$ is $"grad"_g r \/ \| thin upright(d) r \|_g$.
    Uniformly for $0 < chi lt.eq 1$, the prepared end expansion gives
  #[#set math.equation(numbering: n => "(10.29)")
   $ "tr"_(A_chi) "Hess"_g r^(- 3 \/ 2) = 3 / 2 (- 3 + 5 / 2 chi) r^(- 7 \/ 2) +
     O \( r^(- 11 \/ 2) \) < 0 $ <four:sys:radial-trace>]
  after increasing $r_0$. The leading coefficient is at most $- 3 \/ 4$, so the choice is independent of $N$.
    Take $C_(*)$ large enough that $C_(*) \( r_0^(- 3 \/ 2) - R^(- 3 \/ 2) \)$ dominates the global height bound
    for every $R gt.eq 2 r_0$. On this annulus the scalar equation is
  $ frac(l, eta_N sqrt(D)) "tr"_(A_chi) "Hess"_g h = h . $
  The functions $plus.minus C_(*) \( r^(- 3 \/ 2) - R^(- 3 \/ 2) \)$ are respectively upper and lower barriers by
    (10.29). At a putative first comparison point the gradients coincide,
    so the same positive trace matrix and the same positive prefactor occur in both expressions.
    The Hessian order and the proper height sign give a contradiction. This proves the end estimate.
    Differentiating the comparison at the outer boundary, where $h = 0$ tangentially, gives (10.27),
    absorbing the uniform end normal comparison into $C_(*)$.
  Finally let $G \( t \) = t + 1 / 6 log \( 1 + l \( t \)^2 sigma^2 \)$ at an outer point.
    It is strictly increasing and $G \( t \) = Z = 0$. Thus $t > - epsilon.alt$ if
  $ G \( - epsilon.alt \) = - epsilon.alt + 1 / 6 log \( 1 + ell^2 sigma^2 \) < 0 . $
  By (10.27), it suffices to choose $R_min \( N \)$ so large that $C_(*)^2 ell^2 eta_N^(- 2) R_min \( N \)^(- 5) <
    e^(6 epsilon.alt) - 1$. This uses only fixed-$N$ enlargement of the outer radius. ◻
]

=== 10.5 The stationary comparison at a minimum of $t$ <the-stationary-comparison-at-a-minimum-of-t>

The scalar identity is useful at a floor contact because a second,
  Riemannian Gauss calculation gives an upper bound for the same scalar curvature.
  Define, for a symmetric tensor $A$ and a chosen unit axis $e$,

#[#set math.equation(numbering: n => "(10.30)")
 $ cal(S) \( A \) = 1 / 3 \( "tr"_perp A \)^2 - 1 / 2 \| A_perp^0 \|^2 + d A_(e e) "tr"_perp A -
   d \| A_(e perp) \|^2 . $ <four:sys:gauss-quadratic>]

#thm([Lemma 10.5.])[
  (Stationary Gauss comparison).  #emph[At an interior local minimum of $t$,
#[#set math.equation(numbering: n => "(10.31)")
 $ 1 / 2 e^(2 t) "Scal"_(hat(g)) lt.eq 1 / 2 "Scal"_g - v "Ric"_g \( e \, e \) +
   cal(S) \( H^f \) . $ <four:sys:gauss-bound>]

 At every point where $thin upright(d) t = 0$ there are an absolute $c_2 > 0$ and a polynomial bound $Pi_N$ such that
#[#set math.equation(numbering: n => "(10.32)")
 $ cal(T) - cal(S) \( H^f \) gt.eq c_2 cal(T) - Pi_N #scale(x: 120%, y: 120%)[\(] v F^2 + \| K \|^2
   #scale(x: 120%, y: 120%)[\)] . $ <four:sys:floor-coercivity>]

 These conclusions extend to $thin upright(d) f = 0$ with any unit axis.]
] <four:sys:gauss-lemma>

#proof[
  Use the Riemannian warped product $g + l^2 \( thin upright(d) b' \)^2$ and its graph $b' = f$.
    At $thin upright(d) t = 0$ one has $thin upright(d) l = 0$, so the graph second form is $H^f$,
    up to its immaterial overall sign. Its inverse metric is $A_d$. The contracted second-form contribution is
  $ 1 / 2 { \( "tr"_(A_d) H^f \)^2 - \| H^f \|_(A_d ⊗ A_d)^2 } = cal(S) \( H^f \) \, $
  as is seen by writing $A_d = "diag" \( 1 \, 1 \, 1 \, d \)$. The ambient scalar curvature and Ricci blocks are
  $ "Scal"_g - 2 Delta l \/ l \, wide "Ric"_g - "Hess" l \/ l \, wide - Delta l \/ l \, $
  for the scalar, horizontal block, and unit vertical direction; the mixed block is zero.
    The graph unit normal has horizontal part $- w$ and vertical component $sqrt(d)$.
    Therefore the ambient scalar minus twice its normal Ricci, divided by two, is
  $ 1 / 2 "Scal"_g - v "Ric"_g \( e \, e \) - v "tr"_perp \( "Hess" l \/ l \) . $
  At a stationary point $"Hess" l \/ l = p "Hess" t$, and the conformal term is $- 3 "tr"_(A_d) "Hess" t$.
    Thus we have, more precisely, the equality
  #[#set math.equation(numbering: n => "(10.33)")
   $ 1 / 2 e^(2 t) "Scal"_(hat(g)) =  & 1 / 2 "Scal"_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \)\
 & - \( 3 + p v \) "tr"_perp "Hess"_g t - 3 d "Hess"_g t \( e \, e \) . $ <four:sys:stationary-gauss-exact>]
  At a minimum the last two terms are nonpositive, proving (10.31).
  For (10.32), first subtract $cal(S) \( S_f \)$. An expansion using $"tr" T = F - chi j$ gives exactly
  #[#set math.equation(numbering: n => "(10.34)")
   $ cal(T) - cal(S) \( S_f \) =  & \| T^0 \|^2 + \( 1 + d \) \| M \|^2 + chi \( 1 + d - 2 chi \/ 3 \) j^2\
 & + \( chi \/ 3 - d \) F j + F^2 \/ 3 . $ <four:sys:stationary-difference>]
  At $d = chi = 1$ the $\( F \, j \)$ quadratic is $F^2 \/ 3 - 2 F j \/ 3 + 4 j^2 \/ 3$,
    whose matrix has determinant $1 \/ 3$ and positive trace.
    It is uniformly positive in a fixed neighborhood of this point. Since
  $ 1 - d = v \, wide 1 - chi = frac(\( 3 + p \) v, 3 + p v) \, $
  there is an absolute $kappa_0 > 0$ such that this neighborhood contains all inputs with $\( 1 + p \) v lt.eq
    kappa_0$. In that region (10.34) controls an absolute fraction of $\| T^0 \|^2 + \| M \|^2 + chi j^2 + F^2$.
  In the remaining region, use $chi \( 1 + d - 2 chi \/ 3 \) gt.eq chi$ and $\| chi \/ 3 - d \| lt.eq
    d$ to absorb the mixed term into, for example, $chi j^2 \/ 4$ and a multiple of $\( d^2 \/ chi \) F^2$.
    The only ratio required is
  #[#set math.equation(numbering: n => "(10.35)")
   $ d^2 / chi = frac(d \( 3 + p v \), 3) lt.eq frac(3 + N, 3) \, wide v > frac(kappa_0, 1 + p) gt.eq
     frac(kappa_0, 1 + N) . $ <four:sys:polynomial-ratios>]
  Keeping also a fixed fraction of $F^2$ at the cost of another multiple of $F^2$,
    this proves a lower bound by an absolute fraction of the stationary norm minus $C \( 1 + N \)^2 v F^2$.
    Equation (10.15) converts the norm to $cal(T)$.
  It remains to replace $S_f$ by $S_f - K$. Polarizing (10.30) bounds the difference by
  $ C #scale(x: 120%, y: 120%)[\(] \| T \| + d \| j \| + d \| M \| #scale(x: 120%, y: 120%)[\)] \| K \| +
    C \| K \|^2 . $
  The stationary norm controls $\| T \|$ and $\| M \|$, while $d \| j \|
    lt.eq \( d^2 \/ chi \)^(1 \/ 2) \( chi j^2 \)^(1 \/ 2)$. By (10.35) and Young’s inequality,
    for every fixed $alpha > 0$ this is at most $alpha cal(T) + C_alpha \( 1 + N \) \| K \|^2$.
    Choose $alpha$ to retain half the already obtained positive coefficient of $cal(T)$.
    This proves (10.32) with absolute $c_2 > 0$. ◻
]

#thm([Lemma 10.6.])[
  (Errors from the trace switches and drift).  #emph[Let $cal(K)$ be a fixed compact enlargement of the supports
    of $K \, C \, b \, D_0 \, D_1$. For every fixed $delta_2 > 0$,
    every smooth trace solution in stages 1–3 satisfies, at a point where $thin upright(d) t = 0$,
#[#set math.equation(numbering: n => "(10.36)")
 $ w \( F \) & gt.eq eta_N a sigma - delta_2 cal(T) - Pi_N upright(bold(1))_(cal(K)) \,\
u^(- 1) \| "div" \( u A_chi K \( w \, dot.op \) \) #scale(x: 120%, y: 120%)[\|] & lt.eq delta_2 cal(T) +
  Pi_N upright(bold(1))_(cal(K)) . $ <four:sys:derivative-errors>]

 The polynomial may depend on $delta_2$ and the fixed geometric choices,
   but no negative power of $ell$ or $eta_N$ is required.]
] <four:sys:stationary-errors>

#proof[
  At $thin upright(d) t = 0$, differentiation gives
  $ nabla_i w = A_d H_(i dot.op)^f \, wide thin upright(d) log u = H^f \( w \, dot.op \) \, wide
    thin upright(d) p = p' \( t \) thin upright(d) t = 0 . $
  These formulas and (10.15) show
  #[#set math.equation(numbering: n => "(10.37)")
   $ \| nabla w \| + \| thin upright(d) log u \|_(A_chi) + \| nabla A_chi \| lt.eq
     Pi_N \( sqrt(cal(T)) + \| K \| \) . $ <four:sys:stationary-derivatives>]
  For clarity, the axial entry in $nabla w$ is $d H_(e e)^f$,
    and its control uses $d^2 \/ chi lt.eq \( 3 + N \) \/ 3$.
    In $\| thin upright(d) log u \|_(A_chi)$ the axial entry has the factor $sqrt(chi)$.
    Differentiating $A_chi = "Id" - \( 3 + p \) w ⊗ w \/ \( 3 + p v \)$ uses only the preceding $nabla
    w$ and coefficients bounded by powers of $1 + N$, since $3 + p v gt.eq 3$.
    This proves (10.37) without dividing by $l$ or $eta_N$.
  Write the relevant prescribed trace as $Phi \( x' \, w \, t \, h \)$.
    Its height derivative is at least one, so the chain rule contains the favorable term
  $ Phi_h w \( h \) gt.eq w \( h \) = eta_N a sigma . $
  All other terms are supported in $cal(K)$. Lemma 51 bounds their height arguments in a fixed range;
    derivatives of $D_0 \, D_1$ and $b$ are consequently bounded.
    Derivatives of $"tr"_(A_chi) K$ use $nabla K$ and (10.37).
    The $t$ derivative has zero contribution at the point in question.
    Thus the remaining absolute error is bounded by $Pi_N \( 1 + sqrt(cal(T)) \) upright(bold(1))_(cal(K))$.
    Young’s inequality proves the first assertion.
  Expanding the divergence in the second assertion differentiates $A_chi$, $K$, and $w$,
    and adds $chevron.l K \( w \, dot.op \) \, thin upright(d) log u chevron.r_(A_chi)$.
    The latter is bounded by $C \| K \| thin \| thin upright(d) log u \|_(A_chi)$.
    Equation (10.37), compact support, and Young’s inequality give the second assertion with the same allowed
    dependencies. ◻
]

=== 10.6 Exclusion of first contact with the floor <exclusion-of-first-contact-with-the-floor>

#thm([Proposition 10.7.])[
  (First-floor exclusion).  #emph[There are a fixed $delta_0 >
    0$ and a positive polynomial $C_N$ in (10.19) such that, for every $N gt.eq 4$ and every $R gt.eq
    R_min \( N \)$, no smooth solution at any stage of the homotopy satisfies
$ min_(overline(Omega)_R) t = - epsilon.alt . $

 The choices depend only on the prepared data, $epsilon.alt$, and the fixed switches and collars.
   They do not use a height bound sharper than Lemma 51.]
] <four:prop:floor-exclusion>

#proof[
  Suppose first that a floor minimum is interior and the parameter is in one of stages 1–3.
    At that point $thin upright(d) t = 0$ and $"Hess" t gt.eq 0$.
    Subtract (10.31) from (10.5) and use $V_lambda = V - \( 1 - lambda \) u A_chi K \( w \, dot.op \)$. This gives
  $ u^(- 1) "div" V_lambda gt.eq  & mu - 1 / 2 "Scal"_g + J \( w \) + v "Ric"_g \( e \, e \) + cal(T) -
    cal(S) \( H^f \) + w \( F \) - F tau\
 & - \( 1 - lambda \) u^(- 1) "div" \( u A_chi K \( w \, dot.op \) \) . $
  Choose $delta_2 > 0$ in Lemma 53 so small that the two losses $delta_2 cal(T)$ leave at least $c_2 cal(T) \/
    2$ in (10.32). The remaining tensor expressions $mu - "Scal"_g \/ 2 = \( tau^2 - \| K \|^2 \) \/ 2$, $J$,
    and $F tau$ are compactly supported and bounded by fixed constants, using Lemma 51.
    On the complement of $cal(K)$, $F = h$ and $F^2 lt.eq C r^(- 3)$; also $\| "Ric"_g \| lt.eq C r^(- 4)$.
    On $cal(K)$ the positive weight $rho_0$ has a fixed positive minimum. Hence
  $ upright(bold(1))_(cal(K)) + v F^2 + v \| "Ric"_g \| lt.eq C \( rho_0 + v rho_1 \) . $
  Combining these bounds yields an absolute $c_3 > 0$ and a polynomial $Q_N gt.eq 0$ such that, at the proposed minimum,
  #[#set math.equation(numbering: n => "(10.38)")
   $ u^(- 1) "div" V_lambda gt.eq c_3 cal(T) + eta_N a sigma -
     Q_N \( rho_0 + v rho_1 \) . $ <four:sys:floor-divergence-lower>]
  Fix $0 < delta_0 < min \( c_3 \/ 2 \, 1 \/ 4 \)$. Since $t = - epsilon.alt$ gives $m_0 \( t \) = 1$,
    choose $C_N$ to exceed $Q_N + 1 + sup_Omega \( rho \/ rho_0 \)$.
    The right side of (10.38) then strictly exceeds $delta_0 cal(T) + rho + delta_0 eta_N a sigma -
    C_N \( rho_0 + v rho_1 \) = Xi$, contradicting (10.21). This choice is polynomial in $N$.
  At an interior minimum in stage 4, (10.25) gives $f = 0$, $t = Z$, and $v = 0$.
    If $gamma > 0$, its equation at the stationary point is
  $ 3 Delta t = gamma #scale(x: 120%, y: 120%)[\(] delta_0 cal(T)_K + rho - C_N rho_0 #scale(x: 120%, y: 120%)[\)] . $
  Enlarge $C_N$, still polynomially, so that $C_N > 1 + sup_Omega \( delta_0 cal(T)_K + rho \) \/ rho_0$.
    The right side is strictly negative, contradicting $Delta t gt.eq 0$.
    This additional bound is finite because $K$ is compactly supported.
  Consider next an inner boundary minimum in stages 1–3. There $j_0 \( - epsilon.alt \) = 0$,
    so the same drift correction appears on both sides of (10.21). Cancelling it gives $V_nu \/ u = cal(B)$.
    Equation (10.18) and $d > 0$ imply
  $ 3 partial_nu t = - H - N_B < 0 . $
  This contradicts the nonnegative derivative into $Omega_R$ at a boundary minimum.
    In stage 4 with $gamma > 0$, the corresponding exact formula from (10.25) is $3 partial_nu t =
    gamma \( - H - N_B \) < 0$, giving the same contradiction. The outer boundary is excluded by (10.28).
  Finally, at $gamma = 0$, $f = 0$ and the remaining problem is $"div" \( 3 u "grad" t \) =
    0$ with homogeneous inner conormal data and $t = 0$ on $S_R$.
    Testing by $t$ gives $integral_(Omega_R) 3 u \| thin upright(d) t \|^2 = 0$.
    Connectedness and the nonempty Dirichlet boundary imply $t = 0$. Thus no stage admits floor equality. ◻
]

The order of choices is now fixed: choose the background geometric data and $epsilon.alt$,
  then $delta_0$ and the polynomial penalty $C_N$. At each $N$, enlarge the outer radius as in Lemma 51.
  Subsequent estimates may increase the lower bound on $N$ or $R_min \( N \)$,
  but none will replace $C_N$ by an arbitrary fixed-$N$ constant.
  In particular, the first-floor argument has paid for $F tau$ using a bounded compact error and has not used the
  eventual small-height absorption in (9.16).

== 11 Separating the graph from the two frontiers <four:sec:bounds>

Throughout this section the prepared geometry, its thresholds and collars,
  and $epsilon.alt in \( 0 \, 1 \)$ are fixed. We consider arbitrary smooth solutions of the four stages of the
  homotopy in Section 10, on $Omega_R$, satisfying $t gt.eq - epsilon.alt$.
  The admissible radii satisfy $R gt.eq R_min \( N \)$, where $R_min \( N \) arrow.r
  oo$ and is large enough for the outer-boundary conclusion of Proposition 54.
  Every assertion of uniformity includes the homotopy parameter and $R$.
  As in Remark 41, $Pi_N$ denotes a polynomial bound in $N$,
  whereas $C \( N \)$ can depend arbitrarily on the fixed integer $N$.
  We shall keep this distinction through the boundary-flux estimate.

=== 11.1 The limiting heights and the two total regions <the-limiting-heights-and-the-two-total-regions>

The large factor $l \/ eta_N$ forces a nonconstant test level of $h$ to approach a hypersurface whose expansion is
  controlled by the trace equation. A sublevel of the relaxed limiting height need not have a regular boundary.
  We first establish the expansion inequality for every smooth exterior support,
  including at a plateau and at a face of the opposite color.

#thm([Proposition 11.1.])[
  (Separation from the two total regions).  #emph[Let $A subset overline(Omega)$ be compact.
    In the first two homotopy stages the following statements hold.]
  + #emph[If $A ∩ cal(D)_(c_b) = diameter$, there exist $xi_A > 0$ and $N_A$ such that $h gt.eq b_(-) +
    xi_A$ on $A$ for every $N gt.eq N_A$.]
  + #emph[If $A ∩ cal(W)_(c_w) = diameter$, there exist $xi_A > 0$ and $N_A$ such that $h lt.eq b_(+) -
    xi_A$ on $A$ for every $N gt.eq N_A$.]
  #emph[Here the total regions are the full closed regions of Proposition 47,
    including components whose frontiers do not border $Omega$.]
] <four:prop:height-exclusion>

#proof[
  We give the lower-height argument first. Consider any sequence $N_i arrow.r oo$ of the indicated solutions;
    its radii tend to infinity. Extend $h_i$ by the constant $b_(+)$ into a small collar across each white face.
    The functions on these enlarged neighborhoods are continuous. Define their lower relaxed limit by
  $ underline(h) \( x \) = liminf_(i arrow.r oo\
y arrow.r x) h_i \( y \) . $
  It is lower semicontinuous and locally bounded by Lemma 51. Fix levels
  #[#set math.equation(numbering: n => "(11.1)")
   $ b_(-) < k < k' < min { 0 \, b_(-) + xi_1 } \, wide k' + a_0 < 0 \, $ <four:bnd:levels>]
  where $xi_1$ is the height-cutoff constant in $D_0$. We initially work away from black faces.
  Suppose a smooth $phi.alt$ touches $underline(h)$ from below at $x$,
    with $underline(h) \( x \) < k'$ and $thin upright(d) phi.alt \( x \) eq.not 0$.
    Subtracting a small fourth-order function of distance makes the contact strict on a small closed neighborhood
    without changing its second jet. The definition of the relaxed limit and minimization on this neighborhood
    give, after passing to a subsequence, points $x_i arrow.r x$ and constants $c_i$ such that $phi.alt +
    c_i$ touches $h_i$ from below at $x_i$, and $h_i \( x_i \) arrow.r underline(h) \( x \)$.
    These contacts are interior contacts of the original exterior:
    their heights are eventually strictly below $k' < b_(+)$,
    so they cannot occur on a white face or in its constant extension.
    This remains true when $x$ itself is on a white face.
  At contact, $thin upright(d) h_i = thin upright(d) phi.alt$ and $"Hess" h_i gt.eq "Hess" phi.alt$.
    The positive trace matrix therefore gives
  #[#set math.equation(numbering: n => "(11.2)")
   $ "tr"_(A_(chi_i)) K + 1 / sqrt(\( eta_(N_i) \/ l_i \)^2 + \| thin upright(d) phi.alt \|^2) "tr"_(A_(chi_i))
     "Hess" phi.alt lt.eq h_i + C + alpha_i D_0 \, wide 0 lt.eq alpha_i lt.eq 1 . $ <four:bnd:test-trace>]
  Here $alpha_i = 0$ in the first stage. The cutoff construction gives $D_0 lt.eq 0$ at these low heights,
    everywhere: its white contribution vanishes there, and its black contribution is nonpositive. Moreover
  $ l_i / eta_(N_i) gt.eq ell_i / eta_(N_i) = e^(epsilon.alt N_i \/ 2) arrow.r oo . $
  Consequently $\| w_i \| arrow.r 1$, $d_i arrow.r 0$, $chi_i arrow.r 0$,
    and $A_(chi_i)$ tends to the orthogonal projection onto $\( "grad" phi.alt \)^perp$.
    Passing to the limit in (11.2) proves
  #[#set math.equation(numbering: n => "(11.3)")
   $ Theta_K \[ phi.alt \] := "tr"_(\( "grad" phi.alt \)^perp) K +
     frac("tr"_(\( "grad" phi.alt \)^perp) "Hess" phi.alt, \| thin upright(d) phi.alt \|) lt.eq k' +
     a_0 . $ <four:bnd:limiting-expansion>]
  The normal here points toward increasing $phi.alt$.
  We next transfer this test inequality to the closed set $D_k = { underline(h) lt.eq k }$ by Lemma 21,
    with ambient dimension four, $u = underline(h)$, tensor $Q = K$, and $q_0 = k' + a_0$.
    The coarse height bound makes $u$ finite, its defining relaxed limit makes it lower semicontinuous,
    and Equation (11.3) gives the required bound for every nonzero-gradient lower test at a height below $k'$.
    Away from black faces these hypotheses hold on open neighborhoods;
    at white faces use the constant extensions already constructed.
    The lemma therefore bounds every exterior support of $D_k$ there by $k' + a_0$,
    including when the sublevel has a plateau.
  This argument also rules out a boundary layer at a white face.
    The constant extension need not make $underline(h)$ continuous there.
    Nevertheless all approximating low contacts used above are interior,
    so the support inequality holds at a limiting white-face contact.
    At every point strictly on the added side the relaxed limit equals $b_(+) > k$,
    so $D_k$ lies locally in the original closed exterior. The reversed white face would therefore be an exterior
    support of $D_k$ with expansion
  $ - H + P_B = - c_w > 0 \, $
  contradicting $k' + a_0 < 0$. Hence $D_k$ misses every white face.
  Adjoin the full black total region and consider $D_k union cal(D)_(c_b)$ in the filled black barrier manifold.
    At a frontier point belonging to $partial cal(D)_(c_b)$, an exterior support of this union also supports the
    smooth region $cal(D)_(c_b)$, so smooth tangency bounds its expansion by $c_b$.
    At other frontier points the bound is $k' + a_0 > c_b$. The coarse end-height decay makes the additional
    sublevel compact. It lies strictly inside the distant barrier sphere:
    otherwise a sphere at its greatest radius is an exterior support with positive expansion, a contradiction.
    There are no remaining contacts with the boundary of the filled barrier manifold. Lemma 46 therefore gives
  #[#set math.equation(numbering: n => "(11.4)")
   $ D_k union cal(D)_(c_b) subset cal(D)_(c') quad upright("whenever ") k' +
     a_0 < c' < 0 $ <four:bnd:sublevel-enclosure>]
  in the chosen threshold range.
  If $A$ is disjoint from $cal(D)_(c_b)$, its distance from that closed region is positive.
    Right continuity first permits $c' > c_b$ close enough that $A ∩ cal(D)_(c') = diameter$.
    We then choose $k \, k'$ as in (11.1), close enough to $b_(-)$ that $k' + a_0 < c'$.
    It follows that $A ∩ D_k = diameter$. If a uniform eventual lower bound $h gt.eq k$ on $A$ failed,
    a sequence of violating points in the compact set $A$ would give a point of $A ∩
    D_k$ in its lower relaxed limit. This contradiction proves the first claim, with, for example, $xi_A = k - b_(-)$.
  For the second claim apply the same proof to $\( - h \, - K \, - C \)$.
    The low-height modification is now $- D_0$ and again has the required nonpositive sign.
    Extend across black faces by the high constant $- b_(-)$.
    At a limiting contact, the reversed black face has expansion $- c_b > 0$ for $- K$,
    and is excluded before using the white barrier manifold. Adjoining $cal(W)_(c_w)$ and applying Lemma 46 now
    places the sublevel in $cal(W)_(c')$. Right continuity at $c_w$ finishes the proof.
    This also covers an empty chosen white region: the distance-cap formulation of right continuity makes the
    nearby regions empty if necessary, and a nonempty enclosed sublevel is then impossible. ◻
]

=== 11.2 Collar comparisons and boundary slopes <collar-comparisons-and-boundary-slopes>

We shorten the disjoint collars to $0 lt.eq s lt.eq s_0$ so that the offset is exactly linear there.
  Their outer leaves are a positive distance from the corresponding closed total region.
  Proposition 55 therefore provides a strict height gap on those leaves in the first two stages.
  All these leaves and the compact sets needed below are fixed before increasing $N$.

#thm([Lemma 11.2.])[
  (Collar slopes).  #emph[For all sufficiently large $N$, there are constants $0 < c_4 < C_4$,
    independent of $N \, R$ and the homotopy parameter, such that in the first two stages
#[#set math.equation(numbering: n => "(11.5)")
 $ c_4 / eta_N lt.eq epsilon_B partial_nu f lt.eq C_4 / eta_N \, wide epsilon_B =
   cases(delim: "{", 1 & upright("on black faces") \,, - 1 & upright("on white faces") .) $ <four:bnd:signed-slopes>]

 On these collars $h gt.eq b_(-)$ on black faces and their exterior collars, and $h lt.eq
   b_(+)$ on white faces and their exterior collars. In stage three,
#[#set math.equation(numbering: n => "(11.6)")
 $ \| partial_nu f \| lt.eq C_4 \/ eta_N . $ <four:bnd:third-slopes>]

 In stage four $f = 0$.]
] <four:bnd:collar-slopes>

#proof[
  Write $nu_s = "grad" s \/ \| thin upright(d) s \|$ and let $P_s \,
    H_s$ be the tangential trace of $K$ and the mean curvature of the collar leaf, with normal $nu_s$.
    For a test height $h_(*) = b_(*) + psi \( s \)$ of positive slope,
    comparison with a solution uses the test gradient and the solution’s value of $Z$.
    With the resulting implicit $t$, direct contraction gives
  #[#set math.equation(numbering: n => "(11.7)")
   $ "tr"_(A_chi) \( K + H^(f_(*)) \) = P_s + a H_s + chi K \( nu_s \, nu_s \) +
     a chi (frac("Hess" s \( nu_s \, nu_s \), \| thin upright(d) s \|) + \| thin upright(d) s \| psi'' / psi') .
     $ <four:bnd:collar-trace>]
  Indeed $f_(*) = h_(*) \/ eta_N$ and $"Hess" f_(*) = \( psi' "Hess" s + psi'' thin upright(d) s^2 \) \/ eta_N$.
    The factor $l psi' \/ \( eta_N sqrt(D) \)$ equals $a \/ \| thin upright(d) s \|$,
    and $"tr"_(nu_s^perp) "Hess" s = \| thin upright(d) s \| H_s$.
    For a test $b_(*) - psi \( s \)$ with $psi' > 0$, all terms with prefactor $a$ in (11.7) change sign.
  If the slope is between two fixed positive constants, the floor and the fixed collar geometry imply
  #[#set math.equation(numbering: n => "(11.8)")
   $ d lt.eq C \( eta_N \/ ell \)^2 = C e^(- epsilon.alt N) \, wide 1 - a = frac(d, 1 + a) lt.eq d \, wide N chi =
     frac(3 N, 3 + p v) d gt.eq d \, $ <four:bnd:collar-smallness>]
  and $a gt.eq 1 \/ 2$ for large $N$. Choose a smooth nonnegative cutoff $theta.alt_2$,
    equal to one on $\[ 0 \, 1 \]$ and zero on $\[ 2 \, oo \)$, and set
  $ b_N \( s \) = A_2 N theta.alt_2 \( N s \) \, wide integral_0^(s_0) b_N \( s \) thin thin upright(d) s lt.eq
    2 A_2 . $
  Thus slopes whose logarithmic derivative is $plus.minus b_N$ remain within a fixed multiplicative factor
    $e^(2 A_2)$ of their initial slopes.
  On a black collar a lower barrier is $b_(-) + psi_(-) \( s \)$, with $psi_(-) \( 0 \) =
    0$ and $psi''_(-) \/ psi'_(-) = b_N$. First choose $A_2$ large, depending only on bounded collar geometry.
    Then choose the slope multiplier sufficiently small that $psi'_(-) lt.eq
    kappa_B \/ 2$ throughout the collar and that its value at $s_0$ is below the solution by the strict outer-leaf
    gap. The direction of its gradient is compatible with the face, so $D_0 = 0$ at a contact.
    Since $P_s + H_s gt.eq c_b$ and $C = a_0 - kappa_B s$, the left side of the trace equation minus its
    prescribed right side at this test height is at least
  #[#set math.equation(numbering: n => "(11.9)")
   $ frac(kappa_B s, 2) - C d + a chi \| thin upright(d) s \| b_N . $ <four:bnd:lower-residual>]
  The constant multiplying $d$ depends on collar geometry, not on the size of the chosen slope multiplier.
    On $s lt.eq 1 \/ N$, the last term dominates $C d$ by (11.8) and the choice of $A_2$.
    On $s gt.eq 1 \/ N$, the first term dominates the exponentially small $C d$ for sufficiently large $N$.
    The residual is therefore strictly positive.
  For an upper barrier use $b_(-) + psi_(+) \( s \)$ with $psi''_(+) \/ psi'_(+) = - b_N$.
    Choose its minimum slope sufficiently large to dominate the coarse height at $s_0$ and all fixed linear
    spatial variations. Smoothness and $P_0 + H_0 = c_b$ give $\| P_s + H_s - c_b \| lt.eq C s$.
    The residual is consequently bounded above by
  #[#set math.equation(numbering: n => "(11.10)")
   $ - c s + C d - a chi \| thin upright(d) s \| b_N $ <four:bnd:upper-residual>]
  for a fixed $c > 0$. It is strictly negative by the same two ranges of $s$.
    In particular, the favorable linear term in these comparisons comes from the height and the offset;
    we have not assumed a positive derivative of the leaf expansion at $s = 0$.
  At any hypothetical crossing extremum, the test and the solution have the same gradient and the same $Z$,
    hence the same $t$ and positive trace matrix. The prescribed right side is increasing in $h$ with derivative
    at least one. The strict residual signs, Hessian comparison,
    and the endpoint inequalities exclude such a crossing. Differentiating the resulting barriers at $s = 0$,
    and using upper and lower positive bounds for $\| thin upright(d) s \|$, proves (11.5) on black faces.
    Sign reversal of $h \, K \, C$ proves the white assertion.
    The compatible-direction modification again vanishes there.
  In stage three let $b_(*) = \( 1 - zeta \) b$ be the assigned face height.
    Use $b_(*) + psi \( s \)$ and $b_(*) - psi \( s \)$, with $psi' > 0$, $psi'' \/ psi' = - b_N$,
    and with a large fixed minimum slope. For the limiting coefficients $a = 1$, $chi = 0$ at $s =
    0$ and height $b_(*)$, the directional inequalities in the homotopy construction are
  $ F_(upright("presc")) \( nu \) gt.eq P_B + H \, wide F_(upright("presc")) \( - nu \) lt.eq P_B - H . $
  Their residuals have precisely the signs needed for the upper and lower tests, respectively.
    At positive $s$ and finite $d$, smooth spatial variation and $1 - a lt.eq d$, $chi lt.eq
    d$ cost at most $C \( s + d \)$. Increasing or decreasing the height by $psi \( s \)$ improves the respective
    residual by at least $psi \( s \)$. Choose the minimum slope to dominate the $C
    s$ error and the coarse height at the outer collar leaf. The logarithmic curvature contribution in (11.7) has
    the favorable sign for both tests and dominates $C d$ on $s lt.eq 1 \/ N$; on $s gt.eq
    1 \/ N$ the linear height term dominates it. The same comparison proves (11.6).
    All constants are uniform in $zeta in \[ 0 \, 1 \]$ by smoothness of the prescribed convex combination.
    The assertion for stage four is the scalar maximum-principle conclusion already proved in the homotopy
    construction. ◻
]

Combining the own-color collar comparison with Proposition 55 on the compact complement of smaller own-color
  collars yields

#[#set math.equation(numbering: n => "(11.11)")
 $ b_(-) lt.eq h lt.eq b_(+) quad upright("on ") overline(Omega) ∩ "supp" K quad
   upright("in the first two stages, for all sufficiently large ") N . $ <four:eq:height-interval>]

The finitely many compact sets used here are fixed first.
  Thus (11.11) has exactly the range required in (9.16); it was not used to establish the floor.

=== 11.3 Polynomial weighted traces and flux <polynomial-weighted-traces-and-flux>

The slope sign supplies a trace inequality with a small coefficient in the boundary flux.
  Its proof uses weighted divergences, so it does not require an upper bound for $Z$ or $\| thin upright(d) f \|$.
  All measures in the next lemma are background $g$ measures.

#thm([Lemma 11.3.])[
  (Weighted trace inequalities).  #emph[Let $cal(C)$ be the union of fixed collars,
    slightly enlarged if necessary. In stages one and two, for every nonnegative smooth $phi$ and every
    sufficiently large $N$,
#[#set math.equation(numbering: n => "(11.12)")
 $ integral_B L_0 phi thin thin upright(d) A_g & lt.eq Pi_N integral_(cal(C)) u
   #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) phi + \| thin upright(d) phi \|_(A_chi)
   #scale(x: 120%, y: 120%)[\)] thin thin upright(d) V_g \,\
integral_B phi thin thin upright(d) A_g & lt.eq Pi_N integral_(cal(C)) sqrt(D)
  #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) phi + \| thin upright(d) phi \|_(A_chi)
  #scale(x: 120%, y: 120%)[\)] thin thin upright(d) V_g . $ <four:bnd:weighted-trace>]

 On $B$, the corresponding homotopy flux satisfies
#[#set math.equation(numbering: n => "(11.13)")
 $ \| \( V_lambda \)_nu \| lt.eq C u d lt.eq C eta_N / ell L_0 . $ <four:eq:boundary-flux-bound>]

 The constants $C$ and the coefficients of $Pi_N$ are independent of $N \, R$ and the solution.]
] <four:lem:weighted-trace>

#proof[
  Set $W = sqrt(d) thin w$. For every covector $xi$,
  #[#set math.equation(numbering: n => "(11.14)")
   $ \| xi \( W \) \| lt.eq \| xi \|_(A_d) lt.eq sqrt(\( N + 3 \) \/ 3) thin \| xi \|_(A_chi) \, wide u W =
     L_0 w \, wide sqrt(D) thin W = w . $ <four:bnd:W-dual>]
  The first assertion follows along the axis from $\| xi \( W \) \|^2 = d v xi \( e \)^2 lt.eq
    d xi \( e \)^2$ and is immediate transversely.
  For completeness, write $Q_f = "tr"_(A_d) H^f$. Differentiating $w$ and $D$ gives
  $ nabla_i w_j & = H_(i j)^f - H^f \( w \, partial_i \) w_j + p d thin t_i w_j \,\
"div" w & = Q_f + p d thin w \( t \) \, & Q_f & = F + \( d - chi \) j - "tr"_(A_d) K . $
  The two weighted divergences are exactly
  #[#set math.equation(numbering: n => "(11.15)")
   $ D^(- 1 \/ 2) "div" \( sqrt(D) thin W \) & = sqrt(d) #scale(x: 120%, y: 120%)[\(] Q_f +
     p d thin w \( t \) #scale(x: 120%, y: 120%)[\)] \,\
u^(- 1) "div" \( u W \) & = sqrt(d) #scale(x: 120%, y: 120%)[\(] Q_f + \( p + 2 + p d \) w \( t \)
  #scale(x: 120%, y: 120%)[\)] . $ <four:bnd:first-divergence>]
  Indeed the second formula follows from $u W = L_0 w$ and $thin upright(d) log L_0 = \( p + 2 \) thin upright(d)
    t$. Since $sqrt(d) thin \| w \( t \) \| lt.eq \| thin upright(d) t \|_(A_d)$ and $0 lt.eq d - chi lt.eq d$,
    coercivity (10.14) bounds both right sides by $Pi_N \( 1 + sqrt(cal(T)) \)$ on the fixed collars.
    No factor $l^(- 1)$ or $eta_N^(- 1)$ occurs.
  On a face $epsilon_B w_nu = a gt.eq 1 \/ 2$ by (11.5). Integrate the divergence of $epsilon_B zeta u W
    phi$ separately on each collar, where $zeta = 1$ at $B$ and $zeta = 0$ near its outer leaf.
    The outward normal of $Omega_R$ at $B$ is $- nu$, so the boundary term is $- integral_B L_0 a phi$.
    Taking absolute values of the remaining terms and using (11.14)–(11.15) proves (11.12).
    Replacing $u$ by $sqrt(D)$ proves (11.12). The derivatives of $zeta$ cost only a fixed constant.
  On the boundary the compatible slope makes $D_0 = 0$, and the prescribed heights and offsets give exactly $F -
    P_B = epsilon_B H$. Moreover $w_nu = epsilon_B a$ and $\( A_chi K \( w \, dot.op \) \)_nu =
    epsilon_B a chi K \( nu \, nu \)$. Writing $q_lambda = 1 - \( 1 - lambda \) j_0 \( t \) in \[ 0 \, 1 \]$,
    the flux formula (10.21) is therefore
  $ frac(\( V_lambda \)_nu, u) =
    q_lambda [- frac(d, 1 + a) H - N_B d - \( 1 - lambda \) epsilon_B a chi K \( nu \, nu \)] . $
  This is bounded in absolute value by $C d$ since $chi lt.eq d$.
    Finally $u d = L_0 sqrt(d)$ and $sqrt(d) lt.eq C eta_N \/ ell$ at $B$ by (11.5). This proves (11.13). ◻
]

=== 11.4 A high-level integral and graph Sobolev inequality <a-high-level-integral-and-graph-sobolev-inequality>

From this point, constants used to obtain a bounded range may depend arbitrarily on fixed $N$.
  The only large-$N$ absorption needed first uses the polynomial constants just proved:

#[#set math.equation(numbering: n => "(11.16)")
 $ Pi_N eta_N / ell = Pi_N e^(- epsilon.alt N \/ 2) arrow.r 0 . $ <four:bnd:small-boundary-factor>]

There exists $Z_0 \( N \) > 0$, independent of the solution and $R$, such that

#[#set math.equation(numbering: n => "(11.17)")
 $ Xi gt.eq delta_0 cal(T) + rho + 1 / 2 delta_0 eta_N a sigma quad upright("on ") { Z > Z_0 \( N \) } \, wide
   Xi gt.eq delta_0 cal(T) - C \( N \) quad upright("everywhere") . $ <four:bnd:high-source>]

To see the first assertion, only the support of $m_0$ matters.
  There $- epsilon.alt lt.eq t lt.eq - epsilon.alt + 1 \/ N$, whereas

$ D = e^(6 \( Z - t \)) \, wide eta_N a sigma = eta_N / l (sqrt(D) - 1 / sqrt(D)) . $

At fixed $N$ this last expression tends uniformly to infinity with $Z$,
  and dominates the bounded penalty $cal(P)$. The global lower bound follows from the bounded weights defining $cal(P)$.

#thm([Lemma 11.4.])[
  (High-level integral).  #emph[In stage one, choose a smooth nondecreasing $k_0$ which is zero on
    $\( - oo \, Z_0 \]$ and one on $\[ Z_0 + 1 \, oo \)$. For all sufficiently large fixed $N$,
#[#set math.equation(numbering: n => "(11.18)")
 $ integral_(Omega_R) u k_0 \( Z \) #scale(x: 120%, y: 120%)[\(] cal(T) + rho +
   eta_N a sigma #scale(x: 120%, y: 120%)[\)] thin thin upright(d) V_g lt.eq C \( N \) . $ <four:bnd:high-integral>]

]
] <four:bnd:high-level-integral>

#proof[
  The test $k_0 \( Z \)$ vanishes on $S_R$. Integration by parts gives
  $ integral u k_0 Xi + 3 integral u k'_0 \| thin upright(d) Z \|_(A_chi)^2 = - integral_B k_0 \( V_lambda \)_nu -
    lambda integral u k'_0 chevron.l K \( w \, dot.op \) \, thin upright(d) Z chevron.r_(A_chi) . $
  The last integral is absorbed into part of the gradient term plus $C \( N \)$.
    Indeed it is supported in a fixed compact set and in the strip $Z_0 lt.eq Z lt.eq Z_0 + 1$, where
  #[#set math.equation(numbering: n => "(11.19)")
   $ u = l e^(3 Z - t) lt.eq e^(1 + 3 \( Z_0 + 1 \) + epsilon.alt) . $ <four:bnd:strip-weight>]
  Thus the residual strip integral has bounded background volume and a bounded weight,
    without any preliminary gradient estimate.
  By Lemma 57, the absolute boundary contribution is at most
  $ Pi_N eta_N / ell integral_(cal(C)) u #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) k_0 +
    k'_0 \| thin upright(d) Z \|_(A_chi) #scale(x: 120%, y: 120%)[\)] . $
  The fixed collars have $min_(cal(C)) rho > 0$. Consequently $1 + sqrt(cal(T)) lt.eq
    C \( rho + delta_0 cal(T) \)$ there. Choose $N$ large using (11.16) to absorb the nondifferentiated term into
    the positive source in (11.17). Young’s inequality absorbs the differentiated term into another part of
    $integral u k'_0 \| thin upright(d) Z \|_(A_chi)^2$, with a bounded remainder by (11.19). This proves (11.18). ◻
]

Let $Gamma_f$ be the ordinary product graph of $f$ in $\( Omega_R times bb(R) \, g + thin upright(d) z^2 \)$.
  Put $E_f = 1 + sigma^2$ and $G_f = "Id" - \( sigma^2 \/ E_f \) e ⊗ e$,
  the inverse graph metric on base covectors. The following comparisons hold without a bound for $sigma$:

#[#set math.equation(numbering: n => "(11.20)")
 $ e^(- 1) sqrt(D) thin thin upright(d) V_g lt.eq thin upright(d) V_(Gamma_f) =
   sqrt(E_f) thin thin upright(d) V_g lt.eq ell^(- 1) sqrt(D) thin thin upright(d) V_g \,\
ell^2 A_chi lt.eq G_f lt.eq frac(e^2 \( N + 3 \), 3) A_chi . $ <four:bnd:graph-comparison>]

They follow from $ell lt.eq l lt.eq e$, hence $ell^2 lt.eq D \/ E_f lt.eq e^2$, and $3 d \/ \( N + 3 \) lt.eq
  chi lt.eq d$. Thus graph measure and gradient norms are comparable to $sqrt(D) thin thin upright(d)
  V_g$ and the $A_chi$ norm, with constants depending only on fixed $N$.

On every fixed compact base set $Q$, (11.18) implies

#[#set math.equation(numbering: n => "(11.21)")
 $ integral_(Gamma_f \|_Q) e^(2 Z) thin thin upright(d) V_(Gamma_f) lt.eq C \( N \, Q \) . $ <four:bnd:starting-L2>]

In fact, for $x = sqrt(D) gt.eq 1$, the elementary estimate $x^(2 \/ 3) lt.eq
  C \( N \) \( 1 + \( eta_N \/ l \) \( x - x^(- 1) \) \)$ gives

$ D^(1 \/ 3) lt.eq C \( N \) \( 1 + eta_N a sigma \) \, wide e^(2 Z) sqrt(D) = u / l D^(1 \/ 3) . $

On ${ Z gt.eq Z_0 + 1 }$ use (11.18) and the positive minimum of $rho$ on $Q$.
  On its complement the floor bounds $D$ and $e^(2 Z)$, and the fixed base volume suffices.

#thm([Lemma 11.5.])[
  (Sobolev inequality on the graph).  #emph[Fix a compact base patch and a slightly larger compact neighborhood.
    For every smooth $phi$ supported over the patch, allowed to meet $B$, a stage-one solution satisfies
#[#set math.equation(numbering: n => "(11.22)")
 $ (integral_(Gamma_f) \| phi \|^4 thin thin upright(d) V_(Gamma_f))^(1 \/ 2) lt.eq
   C \( N \) integral_(Gamma_f) (\| nabla_(Gamma_f) phi \|^2 + \( 1 + cal(T) \) phi^2) thin thin upright(d)
   V_(Gamma_f) . $ <four:bnd:sobolev>]

 The constant depends on the fixed neighborhoods, and is independent of the graph and the outer radius.]
] <four:bnd:graph-sobolev>

#proof[
  Extend the compact base neighborhood smoothly to a compact Riemannian manifold and fix a smooth Euclidean
    isometric embedding by Nash’s theorem #cite(label("Nash1956")) Theorem 2, p. 59.
    Its product with a line embeds the product graph isometrically.
    The scalar mean curvature of the product graph is, up to its normal sign,
  $ H_(Gamma_f) = frac(sqrt(D), l sqrt(E_f)) ["tr" T - "tr"_(e^perp) K + E_f^(- 1) \( j - K \( e \, e \) \)] . $
  The prefactor is at most $ell^(- 1)$ and $E_f^(- 1) lt.eq e^2 d$.
    Coercivity therefore bounds its magnitude by $C \( N \) \( 1 + sqrt(cal(T)) \)$.
    The additional mean-curvature vector of the fixed embedding has magnitude at most four times the bound for its
    second fundamental form. Thus the Euclidean mean-curvature vector has the same bound,
    independently of the graph slope.
  The four-dimensional Michael–Simon $L^1$ Sobolev inequality #cite(label("MichaelSimon1973")),
    in the compact-support form of #cite(label("Simon2014")) Chapter 4, Section 5, Theorem 5.7, p. 98,
    applied to $\| phi \|^3$, gives
  $ (integral_(Gamma_f) \| phi \|^4)^(3 \/ 4) lt.eq C \( N \) integral_(Gamma_f)
    (\| phi \|^2 \| nabla_(Gamma_f) phi \| + \( 1 + sqrt(cal(T)) \) \| phi \|^3) +
    C integral_(partial Gamma_f) \| phi \|^3 . $
  We have retained the boundary term. Its form follows, for each individual smooth graph,
    by applying the boundaryless inequality to cutoffs tending to one up to the face:
    the integral of their normal derivatives tends to the face integral.
    Artificial patch edges do not contribute because $phi$ vanishes there.
    Along $B$, $f$ is constant on each face, so the graph face measure is exactly $thin upright(d) A_g$.
    Apply (11.12) to $\| phi \|^3$ and use (11.20). This bounds the face contribution by the same two interior
    expressions. If $I = integral_(Gamma_f) \| phi \|^4$, Cauchy–Schwarz now gives
  $ I^(3 \/ 4) lt.eq
    C \( N \) I^(1 \/ 2) (integral_(Gamma_f) \( \| nabla_(Gamma_f) phi \|^2 + \( 1 + cal(T) \) phi^2 \))^(1 \/ 2) . $
  For $I > 0$ divide by $I^(1 \/ 2)$ and square. The case $I = 0$ is immediate, proving (11.22). ◻
]

=== 11.5 Iteration and a bounded range for all stages <iteration-and-a-bounded-range-for-all-stages>

#thm([Proposition 11.6.])[
  (Global bounded range).  #emph[For every sufficiently large fixed $N$ there is a finite $C \( N \)$ such that
    every above-floor smooth solution in any of the four homotopy stages satisfies
#[#set math.equation(numbering: n => "(11.23)")
 $ - epsilon.alt lt.eq t lt.eq Z lt.eq C \( N \) \, wide \| f \| + \| "grad" f \| lt.eq C \( N \) quad
   upright("on ") overline(Omega)_R . $ <four:eq:bounded-range>]

 The constant is uniform in the allowed radii and homotopy parameters.]
] <four:prop:bounded-range>

#proof[
  We first treat stage one, where the compactly supported drift can prevent a direct maximum argument.
    Let $psi$ be a smooth base cutoff supported in a fixed compact patch, permitted to meet $B$.
    For $k gt.eq k_(*) \( N \) gt.eq 1$, test the divergence equation with $psi^2 e^(2 k Z) \/ L_0$. We claim
  #[#set math.equation(numbering: n => "(11.24)")
   $ integral_(Gamma_f) e^(2 k Z) psi^2 \( cal(T) + k \| nabla_(Gamma_f) Z \|^2 \) lt.eq
     C \( N \) k integral_(Gamma_f) e^(2 k Z) \( psi^2 + \| thin upright(d) psi \|_g^2 \) \,
     $ <four:bnd:exponential-energy>]
  where $C \( N \)$ is independent of $k$.
  Here are the error estimates establishing the claim. Let $thin upright(d) mu_D =
    sqrt(D) thin thin upright(d) V_g$, and write $kappa = K \( w \, dot.op \)$ in this computation.
    Since $thin upright(d) log L_0 = \( p + 2 \) thin upright(d) t$, the exact tested identity is
  $ & integral e^(2 k Z) psi^2 \( Xi + 6 k \| thin upright(d) Z \|_(A_chi)^2 \) thin thin upright(d) mu_D\
 & = - integral_B frac(psi^2 e^(2 k Z), L_0) \( V_lambda \)_nu thin thin upright(d) A_g -
   2 k lambda integral e^(2 k Z) psi^2 chevron.l kappa \, thin upright(d) Z chevron.r_(A_chi) thin thin upright(d) mu_D\
 & quad - 2 integral e^(2 k Z) psi chevron.l 3 thin upright(d) Z + lambda kappa \,
   thin upright(d) psi chevron.r_(A_chi) thin thin upright(d) mu_D +
   integral e^(2 k Z) psi^2 \( p + 2 \) chevron.l 3 thin upright(d) Z + lambda kappa \,
   thin upright(d) t chevron.r_(A_chi) thin thin upright(d) mu_D . $
  The global lower bound in (11.17) supplies $delta_0 cal(T)$ and costs only $C \( N \) psi^2$ on the right.
    Coercivity bounds the final integrand, by Young’s inequality, by
  $ 1 / 8 delta_0 psi^2 cal(T) + C \( N \) psi^2 \| thin upright(d) Z \|_(A_chi)^2 + C \( N \) psi^2 . $
  Choose $k_(*) \( N \)$ sufficiently large to absorb this fixed multiple of the gradient square.
    The drift term carrying $2 k$ is bounded by $k psi^2 \| thin upright(d) Z \|_(A_chi)^2 + C \( N \) k psi^2$.
    The cutoff terms cost another fixed fraction of the $k$-weighted gradient square plus $C \( N \)
    k \( psi^2 + \| thin upright(d) psi \|_g^2 \)$.
  For the boundary term, (11.13) gives $\| \( V_lambda \)_nu \| \/ L_0 lt.eq C sqrt(d) lt.eq C$.
    Apply (11.12) to $psi^2 e^(2 k Z)$. The resulting integrand, apart from its common factor $e^(2 k Z)$, is bounded by
  $ C \( N \)
    [\( 1 + sqrt(cal(T)) \) psi^2 + 2 \| psi \| \| thin upright(d) psi \|_(A_chi) + 2 k psi^2 \| thin upright(d)
    Z \|_(A_chi)] . $
  For any fixed coefficient $b = C \( N \)$ the estimates
  $ b sqrt(cal(T)) lt.eq 1 / 8 delta_0 cal(T) + 2 b^2 \/ delta_0 \, wide
    2 b k \| thin upright(d) Z \|_(A_chi) lt.eq k \| thin upright(d) Z \|_(A_chi)^2 + b^2 k $
  show that the boundary cost is absorbed with the claimed remainder linear in $k$.
    Leaving fixed positive fractions of the coercive terms and using (11.20) proves (11.24).
  Set $U = e^Z$. Applying (11.22) to $psi U^k$ and using (11.24) yields
  #[#set math.equation(numbering: n => "(11.25)")
   $ (integral_(Gamma_f) psi^4 U^(4 k))^(1 \/ 2) lt.eq C \( N \) k^2 integral_(Gamma_f)
     U^(2 k) \( psi^2 + \| thin upright(d) psi \|_g^2 \) . $ <four:bnd:iteration-step>]
  Choose nested base patches $Q_r subset.double Q_s$ in a fixed coordinate neighborhood,
    or corresponding half patches at $B$, with $0 < s - r lt.eq 1$.
    Cutoffs have $\| thin upright(d) psi \| lt.eq C \/ \( s - r \)$.
    Iterate (11.25) with $k_j = 2^j k_(*)$ and geometric gaps. The factor at the $j$th step is at most
  $ #scale(x: 120%, y: 120%)[\[] C \( N \) k_j^2 \( 1 + upright("gap")_j^(- 2) \)
    #scale(x: 120%, y: 120%)[\]]^(1 \/ \( 2 k_j \)) . $
  Its product is finite, since $sum_j \( j + 1 \) \/ k_j < oo$. Tracking the total gap exponent gives
  #[#set math.equation(numbering: n => "(11.26)")
   $ sup_(Q_r) U lt.eq
     C \( N \) \( s - r \)^(- 2 \/ k_(*))
     (integral_(Gamma_f \|_(Q_s)) U^(2 k_(*)) thin thin upright(d) V_(Gamma_f))^(1 \/ \( 2 k_(*) \)) .
     $ <four:bnd:first-iteration>]
  All comparisons here use the same graph measure of the individual solution;
    its constants are uniform by the preceding lemmas.
  The starting exponent $2 k_(*)$ can exceed the exponent in (11.21).
    A second, elementary nested-patch argument closes this point. Write $M \( s \) = sup_(Q_s) U$. Interpolation gives
  $ (integral_(Gamma_f \|_(Q_s)) U^(2 k_(*)))^(1 \/ \( 2 k_(*) \)) lt.eq
    M \( s \)^(1 - 1 \/ k_(*)) (integral_(Gamma_f \|_(Q_s)) U^2)^(1 \/ \( 2 k_(*) \)) . $
  The last integral is uniformly bounded by (11.21). If $k_(*) = 1$ this already suffices.
    Otherwise Young’s inequality applied to (11.26) gives, for any $q in \( 0 \, 1 \)$,
  #[#set math.equation(numbering: n => "(11.27)")
   $ M \( r \) lt.eq q M \( s \) + C \( N \, q \) \( s - r \)^(- 2) . $ <four:bnd:second-iteration>]
  Choose increasing radii $r_j$ tending to a fixed larger radius, with $r_(j + 1) -
    r_j$ proportional to $2^(- j)$, and take $q < 1 \/ 4$. Iteration sums a geometric series with ratio $4 q < 1$.
    The remaining $q^j M \( r_j \)$ tends to zero: for each individual smooth solution all these patches lie in
    one compact neighborhood with finite supremum. Thus $M \( r_0 \) lt.eq C \( N \)$ uniformly.
    A finite cover gives a uniform $Z$ bound on a compact set containing $B$ and the support of $K$.
  Outside this set $K = 0$. At an interior maximum with $Z > Z_0 \( N \)$, $thin upright(d) Z = 0$ and
  $ "div" \( 3 u A_chi "grad" Z \) = 3 u "tr"_(A_chi) "Hess" Z lt.eq 0 \, $
  whereas $u Xi > 0$ by (11.17). The outer value is $Z = 0$,
    so this maximum argument extends the compact bound through the end. This proves the stage-one $Z$ estimate.
  In stages two and three $lambda = 0$, so the same maximum argument works everywhere in the interior.
    On $B$ the already established face-gradient bounds show that $Z$ can be high only if $t gt.eq 1$: if $t < 1$, then
  $ Z = t + 1 / 6 log \( 1 + l^2 \| thin upright(d) f \|^2 \) lt.eq 1 + 1 / 6 log \( 1 + e^2 C_4^2 eta_N^(- 2) \) . $
  For $t gt.eq 1$ the boundary switch satisfies $j_0 = 1$ and the prescribed conormal flux in (10.21) is zero.
    A high boundary maximum would contradict the boundary point principle applied locally on the high-level set to
    $"div" \( 3 u A_chi "grad" Z \) = u Xi > 0$. For this application the individual smooth solution gives a
    smooth positive elliptic matrix; no uniform ellipticity constant is being assumed before the bound.
    Equivalently, the outward derivative at a nonconstant boundary maximum is strictly positive,
    whereas the zero conormal flux forces it to vanish. This bounds $Z$ in these two stages.
  In stage four $f = 0$, hence $t = Z$. At a positive scale multiplying the source and boundary data,
    the same high-level interior and boundary arguments apply.
    At zero scale the homogeneous mixed problem gives $Z = 0$. The resulting bound is uniform in the scale.
  Finally $Z - t = 1 / 6 log D gt.eq 0$, so the floor and the upper bound give $D lt.eq
    e^(6 \( C \( N \) + epsilon.alt \))$. Since $l gt.eq ell > 0$, $\| thin upright(d) f \| lt.eq
    ell^(- 1) sqrt(D - 1) lt.eq C \( N \)$. The coarse bound for $h = eta_N f$ gives $\| f \| lt.eq C \( N \)$.
    This proves all of (11.23). ◻
]

The bounded range now permits fixed-$N$ regularity and exhaustion.
  The final mass estimate will use only the earlier polynomial bounds in Lemma 57 and (11.13);
  the graph Sobolev and Moser constants are not needed in that limit.

== 12 Four-dimensional regularity up to the boundary <four:sec:regularity>

The second equation has quadratic growth in both $"grad" Z$ and $"Hess" f$.
  A bound for its ellipticity constants therefore does not close the regularity argument.
  We first prove an independent scalar estimate which gives a positive Morrey exponent for $\| "Hess" f \|^2$.
  That exponent permits a measure correction in the second equation.
  All constants in this section may depend arbitrarily on a fixed $N$;
  none of them is subsequently used as a polynomial bound $Pi_N$.
  In coordinate calculations $D_x$, or $D$ when there is no ambiguity, denotes ordinary differentiation,
  whereas $D = 1 + l^2 \| "grad" f \|^2$ in the system retains its earlier meaning.

=== 12.1 An independent scalar estimate <an-independent-scalar-estimate>

#thm([Theorem 12.1.])[
  (Measurable axial coefficient).  #emph[Let $U$ be a four-dimensional coordinate ball $B_2$,
    or a half-ball $B_2^(+) = B_2 ∩ { x_4 > 0 }$. Assume that the metric is smooth,
    $C_g^(- 1) "Id" lt.eq \( g_(i j) \) lt.eq C_g "Id"$, and that its coordinate $C^2$ norm is at most $C_g$.
    Assume also uniformly bounded $C^3$ norms for the charts and inverse charts.
    On a half-ball use boundary normal coordinates, so $g_44 = 1$ and $g_(a 4) = 0$ for $a < 4$.
    Let $z$ be $C^3$, up to the flat face when present, and constant on that face. Suppose, almost everywhere, that
#[#set math.equation(numbering: n => "(12.1)")
 $ A_z : "Hess"_g z = G \, wide A_z = "Id" - \( 1 - tilde(chi) \) e_z ⊗ e_z \,\
e_z = frac("grad" z, \| "grad" z \|) \, wide 0 < chi_0 lt.eq tilde(chi) lt.eq 1 . $ <four:reg:axial-equation>]

 Here $tilde(chi)$ and $G$ are measurable. At $"grad" z = 0$,
   any measurable unit axis making the equation true is allowed.
   If $\| "grad" z \| lt.eq M_1$ and $\| G \| lt.eq N_1$, then there are $alpha in \( 0 \, 1 \)$,
   $r_0 > 0$ and $C < oo$ such that
#[#set math.equation(numbering: n => "(12.2)")
 $ parallel "grad" z parallel_(C^alpha \( U_1 \)) lt.eq C \( M_1 + N_1 \) \, wide
   integral_(B_r \( x \) ∩ U) \| "Hess"_g z \|^2 thin thin upright(d) V_g lt.eq
   C \( M_1 + N_1 \)^2 r^(2 + 2 alpha) $ <four:eq:axial-estimate>]

 for $x in overline(U_1)$ and $0 < r lt.eq r_0$, where $U_1 = B_1$ or $B_1^(+)$.
   The constants depend only on $chi_0$, the stated geometry bounds and the separation from the curved patch
   edges. The $C^alpha$ norm may equivalently be taken for the coordinate gradient components.
   In particular, no modulus of continuity of $G$ or $tilde(chi)$, and no bound for a derivative of either, is assumed.]
] <four:thm:axial-regularity>

#proof[
  We prove the assertion on uniformly small full balls, using a reflection at the flat face.
    Rescaling back and a finite local cover give the stated form.
    The argument first establishes a local Hessian estimate and a dichotomy:
    on a smaller ball, either the gradient bound decreases or the solution is close to a nonconstant affine
    function. A fixed-axis estimate then improves the affine approximation.
    Iterating these alternatives gives Hölder gradient control,
    from which the local Hessian estimate yields the Morrey bound.
  ===== 12.1.1 Doubling and a quantitative Hessian estimate. <doubling-and-a-quantitative-hessian-estimate.>
  Subtract the constant boundary value. With $R_4 = "diag" \( 1 \, 1 \, 1 \, - 1 \)$,
    extend the tangential metric block evenly and set $tilde(z) \( x \) = - z \( R_4 x \)$ below the plane.
    Tangential derivatives of $z$ vanish on the face and the two normal derivatives agree.
    Thus $tilde(z)$ is $C^1$; its distributional coordinate Hessian has no surface measure.
    The doubled metric is Lipschitz and has the prescribed smooth bounds on each closed side.
    On the reflected side the gradient and covariant Hessian are $- R_4 "grad" z$ and $-
    R_4 \( "Hess"_g z \) R_4$, respectively. Extend $tilde(chi)$ evenly and $G$ oddly.
    Equation (12.1) then holds almost everywhere on the double.
    Each individual doubled function is locally $W^(2 \, p)$ for every finite $p$,
    although these norms are not yet uniformly bounded.
  Make a constant linear coordinate change so that the metric at the center of a ball is the identity.
    A plane in the double remains a plane under this change. If the ball is sufficiently small,
    the coordinate principal matrix $a = \( a^(i j) \)$ in (12.1) satisfies
  #[#set math.equation(numbering: n => "(12.3)")
   $ \| "Id" - a \( x \) \|_F lt.eq 1 - chi_0 \/ 2 = : kappa < 1 . $ <four:reg:defect>]
  The reason for the strict gap is the exact identity $\| "Id" - A_z \|_F = 1 -
    tilde(chi)$ in an orthonormal frame; the small metric oscillation consumes at most half the gap.
  Let $T = D^2 Delta^(- 1)$ on $bb(R)^4$, with its values measured in the Frobenius norm.
    Its $L^2$ operator norm is exactly one, since its Fourier multiplier satisfies
  $ sum_(i \, j) lr(|frac(xi_i xi_j, \| xi \|^2)|)^2 = 1 . $
  The Calderón–Zygmund bound gives a finite $L^4$ operator norm $C_4$.
    Interpolation between $2$ and $4$ therefore gives $parallel T parallel_p lt.eq C_4^(theta.alt \( p \))$,
    where $1 \/ p = \( 1 - theta.alt \( p \) \) \/ 2 + theta.alt \( p \) \/ 4$ and $theta.alt \( p \) arrow.b
    0$ as $p arrow.b 2$. Choose once and for all $2 < p_0 < 4$ such that $C_4^(theta.alt \( p_0 \)) kappa < 1$.
    For a compactly supported $y$, write $Delta y = a : D^2 y + \( "Id" - a \) : D^2 y$ and absorb to obtain
  $ parallel D^2 y parallel_p lt.eq frac(parallel T parallel_p, 1 - kappa parallel T parallel_p) parallel a :
    D^2 y parallel_p \, wide p = 2 \, p_0 . $
  This proves the needed Cordes estimate without differentiating $a$.
  For later use its local, scaled form is
  #[#set math.equation(numbering: n => "(12.4)")
   $ parallel D^2 y parallel_(L^p \( B_(r \/ 2) \)) lt.eq
     C (parallel a : D^2 y parallel_(L^p \( B_r \)) + r^(- 2) parallel y parallel_(L^p \( B_r \))) \, wide p =
     2 \, p_0 . $ <four:reg:cordes-local>]
  Here is the localization. A cutoff across a gap $h$ gives the additional terms $C h^(- 1) parallel D y
    parallel_p + C h^(- 2) parallel y parallel_p$. On a slightly larger ball,
    derivative interpolation bounds the first by $epsilon parallel D^2 y parallel_p +
    C_epsilon h^(- 2) parallel y parallel_p$. Use concentric gaps decreasing geometrically and choose $epsilon$ so
    that the resulting geometric series absorbs the larger-ball Hessian norms.
    For each individual function these norms are finite, so the terminal term tends to zero.
    This proves (12.4); the same argument absorbs bounded first order coefficients.
    In particular the Christoffel terms in the covariant equation cause no difficulty.
    The analytic inputs here are the scalar Calderón–Zygmund and interpolation estimates
    #cite(label("GilbargTrudinger2001")).
  ===== 12.1.2 A divergence inequality for the gradient deficit. <a-divergence-inequality-for-the-gradient-deficit.>
  Divide by $M_1 + N_1$ unless this number is zero, in which case the claim is immediate.
    Subtract a constant and rescale space by $r$ and height by $r$.
    The new gradient has norm at most one and the new forcing has norm at most $r$.
    Metric first derivatives and the second fundamental form of a reflecting plane are $O \( r \)$;
    curvature on the smooth sides is $O \( r^2 \)$. After normalizing the metric at the center,
    all of these errors can be made uniformly small. In this paragraph write $P = "grad" z$, $H_z = "Hess"_g z$,
    and $s = 1 - \| P \|_g^2 gt.eq 0$.
  There is an exact cancellation of the measurable axial coefficient:
  #[#set math.equation(numbering: n => "(12.5)")
   $ A_z "grad" \( \| P \|_g^2 \/ 2 \) - G P & = \( H_z - Delta_g z thin g \) P = : Q \,\
"div" Q & = \| H_z \|_g^2 - \( Delta_g z \)^2 + "Ric"_g \( P \, P \) . $ <four:reg:flux-identity>]
  Indeed $"grad" \( \| P \|_g^2 \/ 2 \) = H_z P$ and $Delta_g z = G + \( 1 - tilde(chi) \) H_z \( e_z \, e_z \)$.
    The axial parts in the first formula cancel. In the second formula, $"div" H_z = "grad" Delta_g z +
    "Ric"_g \( P \, dot.op \)$ cancels the third derivatives.
    Both identities hold also at $P = 0$, because the first has both sides zero there.
    At no point is a derivative of $G$ or $tilde(chi)$ taken.
    Choose $epsilon_0 > 0$ with $\( 1 + epsilon_0 \) \( 1 - chi_0 \)^2 < 1$ when $chi_0 < 1$.
    Young’s inequality, or directly $Delta_g z = G$ if $chi_0 = 1$, gives
  #[#set math.equation(numbering: n => "(12.6)")
   $ \| H_z \|_g^2 - \( Delta_g z \)^2 gt.eq c \| H_z \|_g^2 - C \| G \|^2 \, wide c =
     c \( chi_0 \) > 0 . $ <four:reg:flux-coercivity>]
  We compute the only surface error in this identity. In boundary normal coordinates on the original side, $P =
    z_4 partial_4$ at the plane and, for $a \, b < 4$,
  $ \( H_z \)_(a b) = - Gamma_(a b)^4 z_4 = 1 / 2 \( partial_4 g_(a b) \) z_4 . $
  Writing $H_B = 1 / 2 g^(a b) partial_4 g_(a b)$ for the mean curvature toward increasing $x_4$, this gives
  $ Q_4 = \( z_44 - Delta_g z \) z_4 = - H_B z_4^2 . $
  Thus the jump of the volume-weighted normal flux on the double is bounded by $C \| "II"_B \| \| P \|^2$.
    In particular it contains no uncontrolled second derivative of $z$.
    A bounded plane density $j \( x' \)$ is the distributional divergence of $j \( x' \)
    upright(bold(1))_({ x_4 > 0 }) partial_4$; only a normal derivative is taken in this assertion.
    After a linear coordinate change use the corresponding constant normal direction.
    Subtracting this bounded step field handles the signed jump, without imposing any tangential regularity on $j$.
  More explicitly, put $J_g = sqrt(det g)$ and let
  $ a_1^(i j) = J_g #scale(x: 120%, y: 120%)[\(] g^(i j) - \( 1 - tilde(chi) \) e_z^i e_z^j
    #scale(x: 120%, y: 120%)[\)] $
  be the coordinate divergence matrix. Let $j = \[ J_g Q^4 \]$ be the upper trace minus the lower trace.
    Reflection gives $Q^(-) = R_4 Q^(+)$, so $j = - 2 J_g H_B z_4^2$. Then
  $ "div" \( J_g Q \) = J_g #scale(x: 120%, y: 120%)[\(] \| H_z \|^2 - \( Delta_g z \)^2 +
    "Ric"_g \( P \, P \) #scale(x: 120%, y: 120%)[\)] + j thin thin upright(d) cal(H)^3 \|_({ x_4 = 0 }) . $
  Since $a_1 D s + 2 J_g G P = - 2 J_g Q$, the error field $2 J_g G P +
    2 j \( x' \) upright(bold(1))_({ x_4 > 0 }) partial_4$ cancels the plane contribution exactly.
  Consequently (12.5)–(12.6), with volume factors included, imply on a full normalized ball
  #[#set math.equation(numbering: n => "(12.7)")
   $ "div" \( a_1 D s + E_1 \) lt.eq - c_1 \| H_z \|^2 + e_1 \, wide parallel E_1 parallel_oo +
     parallel e_1 parallel_oo arrow.r 0 $ <four:reg:deficit-inequality>]
  as the normalized source and geometry errors tend to zero.
    The matrix $a_1$ is bounded, symmetric and uniformly elliptic,
    with constants depending only on $chi_0$ and the fixed comparison bounds.
    For example, away from the plane one may take the volume-weighted matrix of $A_z$, $E_1 =
    2 sqrt(det g) thin G P$, and $e_1 lt.eq C \( \| G \|^2 + \| "Ric"_g \| \)$;
    the step field just described supplies the remaining term in $E_1$.
  ===== 12.1.3 The gradient drop or affine alternative. <the-gradient-drop-or-affine-alternative.>
  Fix $r_(*) = 1 \/ 32$. We claim that, for every $b_0 > 0$,
    there are $r_(*) < k_(*) < 1$ and $delta_(upright("alt")) > 0$,
    depending only on the fixed parameters and $b_0$, such that a normalized solution on $B_1$,
    with gradient at most one and errors at most $delta_(upright("alt"))$, satisfies one of
  #[#set math.equation(numbering: n => "(12.8)")
   $ sup_(B_(r_(*))) \| "grad" z \|_g lt.eq k_(*) \; wide parallel z - L parallel_(L^oo \( B_(r_(*)) \)) lt.eq
     r_(*) b_0 \, quad 1 / 2 lt.eq \| D L \| lt.eq 2 \, $ <four:reg:alternative>]
  where $L$ is a coordinate affine function.
  To prove the claim, consider a sequence with errors tending to zero and $inf_(B_(r_(*))) s arrow.r 0$.
    Weak Harnack for nonnegative scalar divergence supersolutions,
    applied to (12.7) with its bounded vector and scalar errors, yields for some $q > 0$
  $ (\| B_(1 \/ 2) \|^(- 1) integral_(B_(1 \/ 2)) s^q)^(1 \/ q) lt.eq
    C (inf_(B_(r_(*))) s + parallel E_1 parallel_oo + parallel e_1 parallel_oo) arrow.r 0 . $
  One obtains these fixed radii from the usual concentric weak Harnack inequality by a finite chain of overlapping
    balls. Thus $s arrow.r 0$ in measure. The scalar weak Harnack and energy estimates used here are valid for
    bounded measurable divergence matrices #cite(label("GilbargTrudinger2001")).
  There is also $D s arrow.r 0$ in $L^1$ on smaller balls. Indeed, for a fixed cutoff $zeta$ and $b > 0$,
    test the weak inequality by $zeta^2 \( b - s \)_(+)$. Discarding its favorable Hessian term and using Young’s
    inequality gives
  $ integral_({ s < b }) zeta^2 \| D s \|^2 lt.eq C b^2 integral \| D zeta \|^2 + C parallel E_1 parallel_oo^2 +
    C b #scale(x: 120%, y: 120%)[\(] parallel E_1 parallel_oo +
    parallel e_1 parallel_oo #scale(x: 120%, y: 120%)[\)] . $
  The full local $L^2$ norm of $D s$ is bounded by (12.4), the gradient bound and the geometry bounds.
    On ${ s gt.eq b }$, Cauchy–Schwarz and convergence in measure give a vanishing $L^1$ norm.
    On ${ s < b }$ the displayed estimate bounds the limiting $L^1$ norm by $C b$.
    Letting $b arrow.b 0$ proves the claim. Testing (12.7) with a fixed nonnegative cutoff equal to one on
    $B_(1 \/ 4)$ now gives
  $ integral_(B_(1 \/ 4)) \| H_z \|^2 arrow.r 0 . $
  The coordinate Hessian also tends to zero in $L^2$, because the connection coefficients tend to zero and $D
    z$ is bounded. After subtracting $z \( 0 \)$, the functions are equi-Lipschitz.
    Poincaré gives convergence of their gradients in $L^2$ to constants,
    and compactness gives uniform convergence to an affine function on smaller balls.
    Since $s arrow.r 0$ in measure and the metrics converge to the identity, its slope has length one.
    If (12.8) failed for every $k_(*) arrow.t 1$ and every tolerance tending to zero,
    this conclusion would contradict failure of its affine alternative. This proves the claim.
  ===== 12.1.4 All derivatives for a fixed exceptional axis. <all-derivatives-for-a-fixed-exceptional-axis.>
  For a constant Euclidean unit vector $e_0$, let
  #[#set math.equation(numbering: n => "(12.9)")
   $ cal(A)_0 Y := Delta_(e_0^perp) Y + tilde(chi) \( x \) partial_(e_0 e_0) Y . $ <four:reg:fixed-axis-operator>]
  If $Y_0 in W^(2 \, 2) \( B_(3 \/ 4) \)$ and $cal(A)_0 Y_0 = 0$ almost everywhere, we claim that,
    for some $alpha_1 in \( 0 \, 1 \)$,
  #[#set math.equation(numbering: n => "(12.10)")
   $ parallel D Y_0 parallel_(C^(alpha_1) \( B_(1 \/ 4) \)) lt.eq
     C parallel Y_0 parallel_(W^(2 \, 2) \( B_(3 \/ 4) \)) . $ <four:reg:fixed-axis-estimate>]
  Set $v_1 = partial_(e_0) Y_0 in W^(1 \, 2)$. Differentiating the equation in distributions,
    with no differentiation of its coefficient as a separate function, gives
  $ Delta_(e_0^perp) v_1 + partial_(e_0) \( tilde(chi) partial_(e_0) v_1 \) = 0 . $
  This is a scalar uniformly elliptic divergence equation. Its local boundedness and Hölder estimate bound $v_1$
    in $C^(alpha_1)$. Caccioppoli, subtracting the value at the center of a ball of radius $h$, then gives
  #[#set math.equation(numbering: n => "(12.11)")
   $ integral_(B_h \( x \)) \| D v_1 \|^2 lt.eq C h^(2 + 2 alpha_1) parallel Y_0
     parallel_(W^(2 \, 2) \( B_(3 \/ 4) \))^2 $ <four:reg:fixed-axis-morrey>]
  at all centers in a fixed smaller ball. The power follows from $h^(- 2)$ for the cutoff,
    $h^(2 alpha_1)$ for the squared oscillation, and volume $h^4$.
  Normalize the norm on the right to one. Since $Delta Y_0 = \( 1 - tilde(chi) \) partial_(e_0) v_1$, it follows that
  #[#set math.equation(numbering: n => "(12.12)")
   $ integral_(B_h \( x \)) \| Delta Y_0 \| lt.eq C h^(3 + alpha_1) . $ <four:reg:laplacian-morrey>]
  Let $cal(N)$ be the Newtonian potential of $zeta Delta Y_0$,
    where $zeta$ is supported inside $B_(1 \/ 2)$ and equals one on a slightly smaller ball.
    The remainder $Y_0 - cal(N)$ is harmonic there, with bounded local $L^2$ norm;
    the potential has such a bound by local integrability of $\| x \|^(- 2)$ and the $L^2$ bound for $Delta Y_0$.
    For the gradient of $cal(N)$, the kernel and its derivative are bounded by $C \| x \|^(- 3)$ and $C \|
    x \|^(- 4)$. If two points are separated by $h$, the annuli of radii $s lt.eq 4 h$ give, by (12.12),
    $C sum s^(alpha_1) lt.eq C h^(alpha_1)$. On annuli $s > 4 h$ the kernel difference instead gives $C h sum
    s^(alpha_1 - 1) lt.eq C h^(alpha_1)$. The sums run over dyadic scales;
    both converge because $0 < alpha_1 < 1$. The harmonic remainder has bounded smooth derivatives on the final
    smaller ball. Thus every component of $D Y_0$, and not only $partial_(e_0) Y_0$, satisfies (12.10).
  ===== 12.1.5 Improvement of a nonzero affine approximation. <improvement-of-a-nonzero-affine-approximation.>
  Suppose on $B_1$ that
  #[#set math.equation(numbering: n => "(12.13)")
   $ parallel z - L parallel_oo lt.eq b \, quad 0 < b lt.eq b_0 \, quad 1 / 4 lt.eq \| D L \| lt.eq 4 \,
     quad \| "grad" z \|_g lt.eq 8 \, $ <four:reg:affine-input>]
  and the source, metric oscillation from the identity and metric first derivatives are at most $b
    delta_(upright("aff"))$. Put $Y = \( z - L \) \/ b$. Its coordinate equation has uniformly bounded right hand
    side on $B_1$: the covariant Hessian of $L$ is a Christoffel symbol times its bounded slope,
    and division by $b$ leaves a bound $C delta_(upright("aff"))$.
    Consequently (12.4) gives a uniform $W^(2 \, p_0) \( B_(7 \/ 8) \)$ bound for $Y$.
  Let $e_0 = D L \/ \| D L \|$ and let $a_0 = "Id" - \( 1 - tilde(chi) \) e_0 ⊗ e_0$.
    Since $D z = D L + b D Y$, the set $E_b = { \| b D Y \| > sqrt(b) } ∩ B_(3 \/ 4)$ has measure at most $C
    b^(p_0 \/ 2)$. On its complement the actual gradient is bounded away from zero and the coordinate principal
    matrix differs from $a_0$ by at most $C \( sqrt(b) + b delta_(upright("aff")) \)$.
    On $E_b$ this difference is bounded. Hölder’s inequality, with $1 \/ 2 = 1 \/ p_0 + 1 \/ q$, shows explicitly that
  #[#set math.equation(numbering: n => "(12.14)")
   $ parallel a_0 : D^2 Y parallel_(L^2 \( B_(3 \/ 4) \)) lt.eq
     C (delta_(upright("aff")) + sqrt(b_0) + b_0^(\( p_0 - 2 \) \/ 4)) = : epsilon_1 . $ <four:reg:small-fixed-source>]
  Zeros of $D z$ can occur only in the exceptional set when $b_0$ is small.
    The arbitrary permitted choice of their axis is therefore covered by the same estimate.
  Remove this residual by solving $a_0 : D^2 y_1 = a_0 : D^2 Y$ on $B_(3 \/ 4)$ with zero Dirichlet data.
    To justify this solve for measurable $tilde(chi)$, recall the Miranda–Talenti boundary identity on a Euclidean
    ball for smooth zero-trace $y$ #cite(label("Talenti1965")) Section 2, Theorem 3, p. 297:
  $ integral #scale(x: 120%, y: 120%)[\(] \( Delta y \)^2 - \| D^2 y \|^2 #scale(x: 120%, y: 120%)[\)] =
    integral_(partial B) H_(partial B) \( partial_nu y \)^2 gt.eq 0 . $
  Here mean curvature is the outward trace convention, equal to minus three times Talenti’s signed normalized mean
    curvature. The identity extends by density to $W^(2 \, 2) ∩ W_0^(1 \, 2)$.
    Hence the Dirichlet inverse of $Delta$ has Hessian norm at most one. On this space the map
  $ y mapsto Delta_D^(- 1) #scale(x: 120%, y: 120%)[\(] a_0 : D^2 Y + \( "Id" - a_0 \) :
    D^2 y #scale(x: 120%, y: 120%)[\)] $
  is a contraction in the Hessian $L^2$ norm with factor at most $1 - chi_0$.
    Poincaré and the Dirichlet Laplace estimate identify this as a complete norm and give
  #[#set math.equation(numbering: n => "(12.15)")
   $ parallel y_1 parallel_(W^(2 \, 2) \( B_(3 \/ 4) \)) lt.eq C epsilon_1 . $ <four:reg:small-correction>]
  The function $Y_0 = Y - y_1$ has uniformly bounded $W^(2 \, 2)$ norm and satisfies the homogeneous fixed-axis
    equation. Therefore (12.10) applies to it.
  The passage to a small supremum norm must use a separate estimate in dimension four.
    Choose any $0 < eta < min { 1 \, 2 - 4 \/ p_0 }$. The $W^(2 \, p_0)$ bound gives a uniform $C^(0 \, eta)$
    modulus for $Y$ on smaller balls. The fixed-axis estimate and the local $L^2$ norm give a uniform Lipschitz
    bound for $Y_0$. Thus $y_1$ has a common $C^(0 \, eta)$ modulus on $B_(1 \/ 4)$.
    If $m = parallel y_1 parallel_(L^oo \( B_(1 \/ 8) \))$, a ball of radius $c
    m^(1 \/ eta)$ around a point with absolute value at least $m \/ 2$ has absolute value at least $m \/ 4$,
    provided $m$ is small. Hence
  $ parallel y_1 parallel_2^2 gt.eq c m^(2 + 4 \/ eta) \, wide m lt.eq C epsilon_1^(eta \/ \( eta + 2 \)) . $
  If $m$ is not small, the same reasoning on a fixed smaller ball first excludes that case when $epsilon_1$ tends
    to zero. This argument uses no embedding of $W^(2 \, 2) \( bb(R)^4 \)$ into $C^0$.
  Choose $0 < alpha_2 < alpha_1$, then $0 < lambda_0 < 1 \/
    8$ so that the Taylor remainder constant in (12.10) satisfies $C lambda_0^(1 + alpha_1) lt.eq 1 /
    2 lambda_0^(1 + alpha_2)$. Next choose $delta_(upright("aff")) \,
    b_0 > 0$ so that the correction supremum above is at most $1 / 2 lambda_0^(1 + alpha_2)$.
    Taylor approximation of $Y_0$ at the center gives an affine $L_1$ such that
  #[#set math.equation(numbering: n => "(12.16)")
   $ parallel z - L_1 parallel_(L^oo \( B_(lambda_0) \)) lt.eq b lambda_0^(1 + alpha_2) \, wide \| D L_1 -
     D L \| lt.eq C b . $ <four:reg:affine-improvement>]
  Reduce $b_0$ further so that
  #[#set math.equation(numbering: n => "(12.17)")
   $ C b_0 \/ \( 1 - lambda_0^(alpha_2) \) < 1 \/ 4 . $ <four:reg:slope-sum>]
  These estimates concern the almost everywhere coordinate equation on full balls and therefore apply equally to
    doubled patches.
  ===== 12.1.6 The complete scaling iteration. <the-complete-scaling-iteration.>
  The choices are ordered as follows: first $p_0 \, alpha_1$ and their constants; then $alpha_2 \, lambda_0 \,
    delta_(upright("aff")) \, b_0$; then $k_(*) \, delta_(upright("alt"))$ from (12.8) for that $b_0$.
    Finally shrink the initial spatial scale so that its normalized source and geometry errors are bounded by
    $delta$, where
  #[#set math.equation(numbering: n => "(12.18)")
   $ delta lt.eq c min { delta_(upright("alt")) \, b_0 delta_(upright("aff")) \/ r_(*) } .
     $ <four:reg:initial-tolerance>]
  Here the fixed $c > 0$ incorporates all comparison constants in the geometry rescalings.
    This scale depends only on the theorem’s parameters, since division by $M_1 +
    N_1$ makes the initial source at most one. Write the resulting function as $u$ and center all following balls
    at zero.
  After $m$ successive gradient drops the actual rescaled solution is
  $ u_m \( x \) = frac(u \( r_(*)^m x \) - u \( 0 \), r_(*)^m k_(*)^m) \, wide \| "grad" u_m \|_(g_m) lt.eq 1 \,
    wide parallel G_m parallel_oo lt.eq delta \( r_(*) \/ k_(*) \)^m . $
  The metric remains the identity at the center; its oscillation and first derivative errors are at most $C delta
    r_(*)^m$, with its curvature error shrinking at least as fast.
    A reflecting plane has the correspondingly scaled second fundamental form.
    Since $r_(*) < k_(*)$, the next application of the alternative is legitimate.
    If the affine alternative first occurs after these $m$ drops, rescale its ball by setting $v_0 \( x \) =
    u_m \( r_(*) x \) \/ r_(*)$. Then $v_0$ has affine error at most $b_0$, slope in $\[ 1 \/ 2 \, 2 \]$,
    bounded gradient, and source at most
  $ r_(*) delta \( r_(*) \/ k_(*) \)^m lt.eq b_0 delta_(upright("aff")) . $
  Its geometry satisfies the same tolerance by (12.18).
  In all subsequent affine steps use
  $ v_i \( x \) = lambda_0^(- i) v_0 \( lambda_0^i x \) \, wide b_i = b_0 lambda_0^(i alpha_2) . $
  The derivative $D v_i \( x \) = D v_0 \( lambda_0^i x \)$ retains the actual gradient bound.
    The source and first order geometry errors are at most $b_0 delta_(upright("aff")) lambda_0^i lt.eq
    b_i delta_(upright("aff"))$, because $alpha_2 < 1$. The affine function used at stage $i$ is rescaled in the
    same way, including its constant term. Thus (12.16) applies inductively.
    Its changes of slope sum to less than $1 \/ 4$ by (12.17), so all slopes remain in $\[ 1 \/ 4 \, 4 \]$.
    Only the auxiliary residual in the proof of an improvement is divided by $b_i$;
    that residual is never asserted to solve the original nonlinear axial equation.
  Choose
  $ 0 < alpha lt.eq min { alpha_2 \, log k_(*) \/ log r_(*) } . $
  If the drops never end, the gradient on $B_(r_(*)^m)$ is at most $k_(*)^m lt.eq r_(*)^(m alpha)$,
    and subtraction of the central value gives a constant affine approximation with error $C
    r_(*)^(m \( 1 + alpha \))$. If the drops end after $m$ steps, the affine approximation at $R_i =
    r_(*)^(m + 1) lambda_0^i$ has error at most
  $ b_0 k_(*)^m r_(*)^(m + 1) lambda_0^(i \( 1 + alpha_2 \)) lt.eq b_0 r_(*)^(- alpha) R_i^(1 + alpha) . $
  The previous drop scales have the same type of estimate. Adjacent radii have ratio $r_(*)$ or $lambda_0$,
    both fixed, so every intermediate radius has an affine approximation with error $C r^(1 + alpha)$.
    This conclusion holds at every center of the smaller full patches, including centers whose balls cross the plane.
  For clarity, the usual comparison of affine approximations gives the gradient conclusion directly.
    If $L_r \, L_(r \/ 2)$ are two such approximations, then $parallel L_r -
    L_(r \/ 2) parallel_(L^oo \( B_(r \/ 2) \)) lt.eq C r^(1 + alpha)$, whence $\| D L_r - D L_(r \/ 2) \| lt.eq
    C r^alpha$. Their slopes converge, and the limit is $D z$ since $z$ is $C^1$.
    At points separated by $h$, compare the two approximations on overlapping balls of radius $4 h$;
    the same affine norm estimate gives a slope difference $C h^alpha$.
    Their limits differ from those slopes by $C h^alpha$ as well. This proves the first estimate in (12.2).
  Finally take an affine approximation $L$ on $B_r$ with error $C r^(1 + alpha)$.
    Its $L^2$ error is at most $C r^(3 + alpha)$. The coordinate equation for $z -
    L$ has right hand side equal to $G$ plus a bounded Christoffel coefficient times $D z$,
    whose $L^2$ norm is at most $C r^2$ before these iterative rescalings. Equation (12.4) with $p = 2$ therefore gives
  $ parallel D^2 z parallel_(L^2 \( B_(r \/ 2) \)) lt.eq C \( r^(1 + alpha) + r^2 \) . $
  The difference $"Hess"_g z - D^2 z$ has $L^2$ norm at most $C r^2$.
    Since $alpha < 1$, squaring and restoring $M_1 + N_1$ proves the second estimate in (12.2). ◻
]

=== 12.2 The measure estimate needed in dimension four <the-measure-estimate-needed-in-dimension-four>

The second regularity step is Lemma 6.2 with $n = 4$. Its input is a bounded scalar function satisfying

#[#set math.equation(numbering: n => "(12.19)")
 $ "div" \( cal(A) D Z + B_1 \) = E \, $ <four:reg:natural-equation>]

with symmetric measurable uniformly elliptic $cal(A)$, bounded $B_1$, and a signed source dominated by

#[#set math.equation(numbering: n => "(12.20)")
 $ \| E \| lt.eq C_0 \( 1 + \| D Z \|^2 \) thin upright(d) x + mu_1 \, wide mu_1 \( B_r \( x \) \) lt.eq
   C_mu r^(2 + beta) \, wide beta > 0 . $ <four:reg:natural-growth-bound>]

The preceding axial theorem will supply the Hessian part of $mu_1$.
  A bounded density on a reflecting three-plane contributes $O \( r^3 \)$,
  which also has the required positive exponent. The shared lemma absorbs $\| D
  Z \|^2$ by its exponential product rule and bounds the remaining Green correction by $C \( r + r^beta \)$.

In the application below each individual solution is smooth,
  and its reflection is continuous and smooth on the two closed sides.
  Its common trace therefore defines the measure products and verifies that product rule,
  including the plane flux. The Hölder representative supplied by the lemma agrees everywhere with this continuous
  function. We now verify the coefficients, the reflected source,
  and the ball-growth bound for the actual homotopy before applying the estimate.

=== 12.3 Application to the homotopy and the boundary estimates <application-to-the-homotopy-and-the-boundary-estimates>

#thm([Proposition 12.2.])[
  #emph[Fix the prepared data, $epsilon.alt$, a sufficiently large $N$ and any stage of the homotopy.
    Every smooth solution on an allowed finite truncation $Omega_R$ with $t gt.eq -
    epsilon.alt$ has uniform local estimates for every finite number of derivatives of $f$ and $Z$,
    up to both the inner and outer boundary faces. The constants on the fixed compact part and on uniform unit
    patches of the end are independent of $R$ and of the homotopy parameters. They may depend arbitrarily on $N$.
    On each fixed finite truncation they therefore bound $parallel Z
    parallel_(C^(1 \, alpha_0))$ for every prescribed $0 < alpha_0 < 1$.]
] <four:prop:coupled-regularity>

#proof[
  We use the uniform family of interior and boundary patches described in the statement,
    shrinking them by fixed factors when necessary.
  ===== 12.3.1 The first Hölder estimates and the reflected equation. <the-first-hölder-estimates-and-the-reflected-equation.>
  The bounded range (11.23) keeps $f \, Z \, t \, "grad" f$ bounded and $l \, d \, chi \,
    u$ above positive constants depending on $N$. Divide the trace equation by $l \/ sqrt(D)$ to obtain
  #[#set math.equation(numbering: n => "(12.21)")
   $ A_chi : "Hess"_g f = G_f \, wide G_f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] F_(upright("presc")) -
     "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] \,\
\| G_f \| lt.eq C \( N \) \, wide 0 < chi_0 \( N \) lt.eq chi lt.eq 1 . $ <four:reg:trace-normalized>]
  All prescribed trace expressions have bounded values on this range.
    Every boundary value of $f$ is constant on its face. Thus Theorem 61 gives a Hölder bound for $D f$ and
  #[#set math.equation(numbering: n => "(12.22)")
   $ integral_(B_r \( x \) ∩ Omega_R) \| D_x^2 f \|^2 thin thin upright(d) x lt.eq
     C \( N \) r^(2 + 2 alpha) . $ <four:reg:f-morrey>]
  The coordinate and covariant Hessians differ by a bounded Christoffel term times $D f$,
    so they have the same bound at these radii. The bound also holds for the odd double at a face.
  In coordinates set
  $ cal(A)^(i j) = 3 sqrt(det g) thin u thin A_chi^(i j) \, wide B_1^i =
    lambda sqrt(det g) thin u thin #scale(x: 120%, y: 120%)[\(] A_chi K \( w \, dot.op \)
    #scale(x: 120%, y: 120%)[\)]^i \, $
  using $lambda = 0$ in the later stages. The coordinate $Z$ equation is (12.19),
    with these bounded coefficients and the appropriate scalar homotopy factor in $E$.
    Its matrix is symmetric and uniformly elliptic at fixed $N$.
    Differentiating the implicit relation for $t$ gives the exact covector identity
  #[#set math.equation(numbering: n => "(12.23)")
   $ 3 thin thin upright(d) Z = \( 3 + p v \) thin thin upright(d) t +
     H^f \( w \, dot.op \) . $ <four:reg:t-differential>]
  Since $3 + p v gt.eq 3$ and all its coefficients are bounded on the range, $\| D_x t \| lt.eq
    C \( N \) \( 1 + \| D_x Z \| + \| D_x^2 f \| \)$ in coordinates.
    The quadratic formula (10.6) and the bounded lower order terms in the source therefore give
  #[#set math.equation(numbering: n => "(12.24)")
   $ \| E \| lt.eq C \( N \) \( 1 + \| D_x Z \|^2 + \| D_x^2 f \|^2 \) $ <four:reg:coupled-source>]
  in the interior. No derivative of the principal matrix has been used to obtain this bound.
  At a face take the domain to be $x_4 > 0$ and write $Q = cal(A) D Z + B_1$.
    For $x_4 < 0$ define, with $s = 1$ or $- 1$,
  $ tilde(Z) \( x \) = s Z \( R_4 x \) \, quad tilde(cal(A)) \( x \) = R_4 cal(A) \( R_4 x \) R_4 \, quad
    tilde(B)_1 \( x \) = s R_4 B_1 \( R_4 x \) . $
  The reflected flux is $tilde(Q) \( x \) = s R_4 Q \( R_4 x \)$.
    Integration by parts on the two sides shows that its divergence has the reflected bulk source $s
    E \( R_4 x \)$ and the plane term
  #[#set math.equation(numbering: n => "(12.25)")
   $ \( 1 + s \) Q_4^(+) thin thin upright(d) cal(H)^3 \|_({ x_4 = 0 }) . $ <four:reg:reflection-measure>]
  Indeed the upper normal component is $Q_4^(+)$ and the lower one is $- s Q_4^(+)$,
    so their difference is $\( 1 + s \) Q_4^(+)$. For an inner face use even reflection, $s = 1$.
    The total conormal flux is prescribed by (10.21); its coordinate density $Q_4^(+)$ is bounded on the
    established range. For an outer face use odd reflection, $s = - 1$.
    The zero Dirichlet condition makes $Z$ continuous across the face, and the plane term vanishes.
    Even reflection at the inner face is also continuous. Each individual reflected function belongs to
    $W^(1 \, 2)$ and is smooth on the two closed sides, which verifies the weak chain rule required in Lemma 6.2.
  In the full patch, (12.24) and (12.25) give a signed measure dominated by
  $ C \( N \) \( 1 + \| D_x Z \|^2 \) thin thin upright(d) x + mu_1 \, wide mu_1 =
    C \( N \) \| D_x^2 f \|^2 thin thin upright(d) x + 2 \| Q_4^(+) \| thin thin upright(d)
    cal(H)^3 \|_({ x_4 = 0 }) \, $
  where the Hessian density is reflected and the plane term is omitted for an odd face or an interior patch.
    By (12.22), this positive measure satisfies, at every center,
  $ mu_1 \( B_h \( x \) \) lt.eq C \( N \) h^(2 + beta) \, wide beta = min { 2 alpha \, 1 } > 0 . $
  For balls crossing the plane this follows either from the doubled estimate or by enlarging a ball centered on
    the plane by a fixed factor. Lemma 6.2 now supplies a uniform Hölder modulus for $Z$,
    including at both boundary types.
  ===== 12.3.2 Schauder for $f$ and the ordinary normal condition for $Z$. <schauder-for-f-and-the-ordinary-normal-condition-for-z.>
  The actual coefficients in (12.21) are smooth functions of $\( x \, Z \, D f \)$ on the bounded range.
    This remains true at $D f = 0$, as is manifest from
  $ A_chi = "Id" - frac(3 + p, 3 + p v) w ⊗ w . $
  The source is smooth in these variables and $f$, uniformly over the four parameter ranges.
    The Hölder bounds just proved therefore make the coefficients and source uniformly $C^(0 \, theta)$ for some
    $theta > 0$. The scalar Dirichlet Schauder estimate, with the constant face data, gives
  #[#set math.equation(numbering: n => "(12.26)")
   $ parallel f parallel_(C^(2 \, theta) \( U' \)) lt.eq C \( N \) $ <four:reg:f-schauder>]
  on every smaller interior or boundary patch #cite(label("GilbargTrudinger2001")).
    This application has Hölder principal coefficients, a Hölder right hand side, smooth boundary,
    and uniform ellipticity; it does not apply a system estimate.
  Now expand the divergence equation for $Z$. Derivatives of its coefficients,
    which depend smoothly on $\( x \, Z \, D f \)$, are sums of bounded terms and bounded multiples of $D Z \,
    D^2 f$. The latter Hessian is bounded by (12.26). Thus
  #[#set math.equation(numbering: n => "(12.27)")
   $ a_2^(i j) \( x \) D_(i j) Z = R_2 \, wide \| R_2 \| lt.eq C \( N \) \( 1 + \| D Z \|^2 \) \,
     $ <four:reg:Z-nondivergence>]
  with bounded $C^(0 \, theta)$ uniformly elliptic principal coefficients.
    The source contains no second derivative of $Z$.
  On an inner face $D f$ is normal and hence $A_chi nu = chi nu$. Dividing the prescribed flux by $3 u chi > 0$ gives
  #[#set math.equation(numbering: n => "(12.28)")
   $ partial_nu Z = b_2 \( x \, Z \, f \, D f \) . $ <four:reg:normal-data>]
  The function $b_2$ is smooth on the bounded range, separately on each homotopy stage,
    with uniform bounds through their matching endpoints. Extend its displayed expression smoothly in the spatial
    variable into the collar. Equation (12.26) then gives
  $ \| D_x b_2 \( x \, Z \, f \, D f \) \| lt.eq C \( N \) \( 1 + \| D_x Z \| \) . $
  Consequently the Sobolev trace theorem bounds the $W^(1 - 1 \/ p \, p)$ norm of this normal datum by
    $C \( N \) \( 1 + parallel Z parallel_(W^(1 \, p)) \)$ on a larger patch, for each finite $p > 1$.
    This derivative count costs $D Z$ and $D^2 f$, never $D^2 Z$.
  ===== 12.3.3 Linear estimates and absorption of the quadratic term. <linear-estimates-and-absorption-of-the-quadratic-term.>
  Fix $p > 4$. On a ball or smooth half-patch of size $h$, the local linear $W^(2 \, p)$ estimate for (12.27),
    with zero outer Dirichlet data or (12.28), has the form
  #[#set math.equation(numbering: n => "(12.29)")
   $ parallel D^2 Z parallel_(L^p \( Q_h \)) lt.eq C_(*) parallel D Z parallel_(L^(2 p) \( Q_(2 h) \))^2 +
     C_h #scale(x: 120%, y: 120%)[\(] 1 + parallel Z parallel_(W^(1 \, p) \( Q_(2 h) \))
     #scale(x: 120%, y: 120%)[\)] . $ <four:reg:Z-linear>]
  Here $C_(*)$ is independent of sufficiently small $h$; $C_h$ may contain inverse powers of $h$.
    The constants are uniform over the locations and the truncations in question.
  We specify the linear estimate underlying this assertion.
    Freeze the continuous principal matrix at the patch center.
    The interior constant-coefficient Hessian estimate follows from the Euclidean one by a fixed linear change of
    coordinates. At the boundary, normal coordinates give no mixed normal–tangential entries in the frozen matrix,
    because its exceptional axis is normal there. A tangential linear transformation and a normal dilation reduce
    the frozen principal part to the Laplacian and preserve the plane.
    Subtract a Sobolev extension of the normal datum, or of the Dirichlet datum,
    to obtain homogeneous boundary data. Even reflection for homogeneous normal data and odd reflection for
    homogeneous Dirichlet data give the constant-coefficient half-space estimate.
    The extension costs precisely the $W^(1 - 1 \/ p \, p)$ norm for the normal datum.
    Coefficient oscillation contributes $sup \| a_2 - a_2 \( x_0 \) \| thin parallel D^2 Z
    parallel_p$ and is absorbed on small patches, uniformly by the established Hölder bound.
    Cutoffs and interpolation handle the first order terms. Scaling shows that the coefficient of the interior
    $L^p$ source norm is the constant $C_(*)$, independent of $h$;
    the lower order and trace terms account for $C_h$. This proves (12.29) by the scalar local estimates
    #cite(label("GilbargTrudinger2001")). The construction requires no meeting of different boundary types,
    and the inner and outer faces here are disjoint.
  For use in its nonlinear right hand side, the scaled scalar interpolation inequality on $Q_h$ is
  #[#set math.equation(numbering: n => "(12.30)")
   $ parallel D Z parallel_(L^(2 p) \( Q_h \))^2 lt.eq C thin "osc"_(Q_h) Z thin parallel D^2 Z
     parallel_(L^p \( Q_h \)) + C h^(4 \/ p - 2) #scale(x: 120%, y: 120%)[\(] "osc"_(Q_h) Z
     #scale(x: 120%, y: 120%)[\)]^2 . $ <four:reg:quadratic-interpolation>]
  One can obtain it on the unit patch by subtracting a constant,
    using a bounded Sobolev extension on a smooth ball or half-patch,
    and applying the bounded-domain Gagliardo–Nirenberg inequality with derivative orders $1 \, 2$,
    exponents $2 p \, p \, oo$ and parameter $1 \/ 2$. A convenient modern formulation is
    #cite(label("LiZhang2022")) Theorem 1.3. To see the interpolation mechanism directly for a compactly supported
    function $v$, integration by parts gives
  $ integral \| D v \|^(2 p) lt.eq C_p parallel v parallel_oo integral \| D v \|^(2 p - 2) \| D^2 v \| lt.eq
    C_p parallel v parallel_oo (integral \| D v \|^(2 p))^(1 - 1 \/ p) parallel D^2 v parallel_p . $
  Division gives the required product estimate. Extension and cutoff produce the additional $parallel v
    parallel_oo^2$ term on a bounded unit patch. This lower-order term is essential:
    the bounded-domain Gagliardo–Nirenberg estimate includes an additive multiple of $parallel v parallel_oo$,
    so one may not drop its square after applying the estimate to $v = Z - c$.
    Taking $c$ between the maximum and minimum replaces this norm by the oscillation used here.
    Finally rescaling $x = h y$ multiplies a squared $L^(2 p)$ gradient norm and the Hessian product by
    $h^(4 \/ p - 2)$, which proves precisely the last power in (12.30).
  Here is a cover argument that absorbs larger-patch norms without assuming their uniform boundedness in advance.
    Use uniformly comparable patches of radius $h$ covering the finite truncation,
    and their fixed-factor enlargements. Each enlargement is covered by at most $M_(upright("cov"))$ smaller
    patches, where $M_(upright("cov"))$ is independent of $h$, $R$ and the total number of patches. Let
  $ S = sup_j parallel D^2 Z parallel_(L^p \( Q_h^j \)) . $
  For each individual smooth solution on the finite truncation, $S$ is finite.
    The Hölder estimate for $Z$ gives $"osc"_(Q_(2 h)^j) Z lt.eq C \( N \) h^gamma$.
    Apply (12.30) in the enlarged patches and then cover them by smaller ones.
    Its contribution to (12.29) is at most $C_(*) C \( N \) h^gamma M_(upright("cov"))^(1 \/ p) S +
    C \( N \, h \)$. Choose $h$ small enough, also satisfying the linear freezing condition,
    that this coefficient is at most $1 \/ 4$. For the remaining first order term, local interpolation gives,
    for any $epsilon > 0$,
  $ parallel D Z parallel_(L^p \( Q_(2 h)^j \)) lt.eq epsilon parallel D^2 Z parallel_(L^p \( Q_(2 h)^j \)) +
    C \( h \, epsilon \) parallel Z parallel_(L^p \( Q_(2 h)^j \)) . $
  Choose $epsilon$ so that $C_h epsilon M_(upright("cov"))^(1 \/ p) lt.eq 1 \/ 4$.
    The bounded range controls the last term. Taking the supremum in (12.29) now gives $S lt.eq C \( N \, h \) +
    S \/ 2$, and hence a uniform bound for $S$. First order interpolation supplies the corresponding local
    $W^(2 \, p)$ bounds for $Z$. All constants may depend on the now fixed $h$ and on $N$,
    but not on the total number of patches or $R$.
  ===== 12.3.4 Alternating Schauder estimates and uniform geometry. <alternating-schauder-estimates-and-uniform-geometry.>
  Since $p > 4$, Sobolev embedding gives $Z in C^(1 \, theta')$ for some $theta' > 0$.
    In conjunction with (12.26), the trace equation now has $C^(1 \, theta'')$ coefficients and source for $0 <
    theta'' lt.eq min { theta \, theta' }$. One differentiation and the scalar Dirichlet Schauder estimate give $f
    in C^(3 \, theta'')$. The equation for $Z$ then has $C^(0 \, theta'')$ source,
    and its normal datum (12.28) is $C^(1 \, theta'')$. The scalar normal-derivative or Dirichlet Schauder
    estimate gives $Z in C^(2 \, theta'')$. The boundary estimate is justified by the same frozen half-space
    problem used above: its normal derivative does not annihilate a nonzero decaying solution of the homogeneous
    principal equation. Smooth normal coordinates and smooth normal field therefore satisfy its obliqueness condition.
  Repeating in the order $f$ then $Z$ increases the number of derivatives by one each time.
    The trace equation uses $Z$ without derivatives; the expanded second equation uses only $D^2 f$ and $D
    Z$ in its lower terms; and its boundary expression uses only $D f$.
    These are exactly the derivative counts needed for the iteration.
    The smooth fixed coefficients give all finite orders.
  The compact inner faces have uniform smooth collars. On the prepared end,
    the metric and all fixed coefficient fields have uniform bounds on unit patches.
    Large coordinate spheres have boundary normal charts with uniform bounds of each finite order,
    and are separated from the inner faces. Thus every radius, ellipticity bound,
    chart constant and local covering number used above is independent of the sufficiently large truncation
    radius. Finally a uniform local $C^2$ bound controls any prescribed $C^(1 \, alpha_0)$ norm, $alpha_0 < 1$,
    on a fixed finite truncation. This proves the proposition. ◻
]

#prodef([Remark 12.3.])[
  Theorem 61 also applies in the scalar trial problem below.
    Its separate height and gradient bounds give bounded source and a positive axial eigenvalue without the floor.
    Interpolation of the principal matrix with $"Id"$ preserves its three unit transverse eigenvalues.
    A trial $Z in C^(1 \, alpha_0)$ then supplies the coefficient regularity for scalar Schauder estimates through
    $f in C^(3 \, alpha_0)$; this requires $D Z$, but no second derivative of the trial input.
] <four:reg:scalar-trial-interface>

== 13 Solving the boundary system and controlling its energy <four:sec:existence>

We now construct solutions of the system, exhaust the asymptotically flat end,
  and compare the resulting Riemannian energy with the energy of the prepared data.
  The distinction between two kinds of constants is essential.
  Constants in the scalar solution map and in local regularity may depend arbitrarily on a fixed $N$;
  constants used in the final flux estimate are the polynomial bounds $Pi_N$ established earlier.

=== 13.1 A scalar solution map on the whole trial space <a-scalar-solution-map-on-the-whole-trial-space>

Fix $0 < alpha < 1$, a sufficiently large integer $N$, and an allowed truncation $Omega_R$.
  In this subsection constants may depend on $R$, $N$, and a bound for the trial input in

$ X_R = { Z in C^(1 \, alpha) \( overline(Omega)_R \) : Z \|_(S_R) = 0 } . $

The four stages of the homotopy are parametrized consecutively by $s in \[ 0 \, 4 \]$, with $s =
  0$ the desired system and $s = 4$ its zero terminal scale.
  Denote their trace prescriptions by $F_s^(upright("presc")) \( x \, w \, h \, t \)$.
  All dependence suppressed in this notation is the smooth dependence specified in the homotopy.

#thm([Lemma 13.1.])[
  (Scalar trial problem).  #emph[For every $Z in X_R$ and $s in \[ 0 \, 4 \]$,
    the prescribed trace equation with the assigned constant Dirichlet value on every boundary component has a
    unique solution $f_s \[ Z \] in C^(3 \, alpha) \( overline(Omega)_R \)$.
    The map $\( s \, Z \) mapsto f_s \[ Z \]$ is continuous into $C^(3 \, alpha)$ and maps bounded trial sets to
    bounded sets, uniformly in $s$. No lower bound for the implicitly defined $t$ is imposed on the trial inputs.]
] <four:ex:scalar-trial>

#proof[
  We use the scalar method of continuity in the affine space of $C^(3 \, alpha)$ functions with the assigned
    boundary values, with equation space $C^(1 \, alpha)$. Thus every solution estimated along this continuation
    already has the differentiability required by Theorem 61; the estimates below are uniform bounds,
    not an assumption of uniform third derivatives.
  The normalized equation is
  #[#set math.equation(numbering: n => "(13.1)")
   $ A_chi : "Hess"_g f = G_s \( x \, Z \, f \, thin upright(d) f \) \, wide G_s = sqrt(D) /
     l #scale(x: 120%, y: 120%)[\(] F_s^(upright("presc")) - "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] .
     $ <four:ex:scalar-normalized>]
  The implicit relation defining $t$ is smoothly solvable for every $\( Z \, thin upright(d) f \)$.
    Neither $t$, the matrix, nor the positive prefactor $sqrt(D) \/ l$ depends on the value of $f$.
    The prescriptions satisfy
  $ \| F_s^(upright("presc")) - h \| lt.eq C \, wide partial_h F_s^(upright("presc")) gt.eq 1 \, wide h = eta_N f \, $
  with the other arguments held fixed. For a second parameter $beta in \[ 0 \, 1 \]$, use the scalar interpolation
  #[#set math.equation(numbering: n => "(13.2)")
   $ A_beta : "Hess"_g f = G_beta \, quad A_beta = \( 1 - beta \) "Id" + beta A_chi \, quad
     G_beta = \( 1 - beta \) eta_N f + beta G_s \, $ <four:ex:scalar-interpolation>]
  with the same Dirichlet values. At a positive interior maximum above a fixed height threshold,
    both source summands are positive, whereas the left side is nonpositive.
    The negative minimum argument is identical with signs reversed.
    Including the assigned boundary values gives $\| h \| lt.eq C$,
    uniformly in both parameters and the bounded trial set.
  We next check the degeneracy at large gradient, before invoking any regularity theorem.
    Put $sigma = \| thin upright(d) f \|_g$. Uniformly for bounded $Z$, $sigma arrow.r oo$ forces $t arrow.r -
    oo$: a lower bound on $t$ would bound $e^(6 t) l \( t \)^2$ away from zero, contradicting $e^(6 Z) =
    e^(6 t) \( 1 + l \( t \)^2 sigma^2 \)$. Thus eventually $t < 0$ and $l \( t \) = e^(N t)$, giving the exact equation
  #[#set math.equation(numbering: n => "(13.3)")
   $ e^(6 Z) = e^(6 t) + e^(\( 2 N + 6 \) t) sigma^2 . $ <four:ex:large-gradient-equation>]
  Writing $gamma_N = 6 \/ \( N + 3 \)$, its consequences, uniformly for $Z$ in a fixed bounded interval, are
  #[#set math.equation(numbering: n => "(13.4)")
   $ t & = - frac(log sigma, N + 3) + frac(3 Z, N + 3) + o \( 1 \) \,\
d & = e^(- 6 N Z \/ \( N + 3 \)) sigma^(- gamma_N) \( 1 + o \( 1 \) \) \, & chi & =
  frac(3, N + 3) d \( 1 + o \( 1 \) \) \,\
sqrt(D) / l & = sigma \( 1 + o \( 1 \) \) . $ <four:ex:large-gradient>]
  For example, the first line follows by taking logarithms of $e^(\( 2 N + 6 \) t) sigma^2 = e^(6 Z) \( 1 - d \)$;
    the last follows directly from $sqrt(D) \/ l = \( sigma^2 + l^(- 2) \)^(1 \/ 2)$.
    Since $N gt.eq 4$, one has $gamma_N < 1$. Compactness of the remaining bounded-gradient range therefore gives
    constants $c \, C > 0$ such that
  #[#set math.equation(numbering: n => "(13.5)")
   $ chi_beta := 1 - beta + beta chi gt.eq frac(c, 1 + sigma) \, wide \| G_beta \| lt.eq
     C \( 1 + sigma \) . $ <four:ex:linear-growth>]
  The estimate for the source uses the height bound just proved. Notice also the exact structural identity
  $ A_beta = "Id" - \( 1 - chi_beta \) e ⊗ e \, wide e = "grad" f \/ \| "grad" f \| \, wide 0 < chi_beta lt.eq 1 . $
  In particular, all three transverse eigenvalues remain exactly one throughout the scalar interpolation.
  Here is a gradient estimate using only (13.5). Extend $g$ smoothly across the boundary to a compact enlargement.
    All distances below are distances of this extension, at scales below its injectivity radius.
    If $H_0$ is the uniform bound for $\| f \|$, set
  $ psi \( r \) = 1 / k log \( 1 + B' r \) \, wide q_1 \( r \) = psi' \( r \) \, wide psi'' \( r \) = -
    k q_1 \( r \)^2 . $
  First choose $k$ large relative to the constants in (13.5) and the bounded geometry.
    Next choose $h_0 < 1 \/ \( 4 k \)$ below all collar, injectivity,
    and distinct-boundary-component separation scales. Finally choose $B'$ so large that
  #[#set math.equation(numbering: n => "(13.6)")
   $ q_1 gt.eq 1 quad \( 0 lt.eq r lt.eq h_0 \) \, wide psi \( h_0 \) > 2 H_0 . $ <four:ex:log-choices>]
  These requirements are compatible: $q_1 \( h_0 \)$ tends to $1 \/ \( k h_0 \) >
    4$ and $psi \( h_0 \)$ tends to infinity as $B' arrow.r oo$.
  On the inward collar of a boundary face with constant value $f_0$, let $r$ be its distance function.
    The functions $f_0 plus.minus psi \( r \)$ are upper and lower barriers.
    To check the upper barrier at a hypothetical positive maximum of $f - f_0 - psi \( r \)$,
    the common gradient is $q_1 "grad" r$. The tangential Hessian of the barrier contributes at most $C q_1$,
    and its axial contribution is at most $- c k q_1^2 \/ \( 1 + q_1 \)$.
    By enlarging $k$ this is strictly less than $- C \( 1 + q_1 \)$,
    the lower bound for the equation’s source at the solution height.
    Ellipticity and the second derivative test contradict the equation.
    For the lower barrier both inequalities reverse. At the outer edge of the collar the comparisons follow from
    (13.6). Consequently
  #[#set math.equation(numbering: n => "(13.7)")
   $ \| f \( x \) - f_0 \| lt.eq psi #scale(x: 120%, y: 120%)[\(] "dist" \( x \, upright("face") \)
     #scale(x: 120%, y: 120%)[\)] quad upright("in its ") h_0 upright(" collar") . $ <four:ex:boundary-modulus>]
  For completeness, the same modulus controls interior pairs. Suppose that
  $ f \( x \) - f \( y \) - psi #scale(x: 120%, y: 120%)[\(] "dist" \( x \, y \) #scale(x: 120%, y: 120%)[\)] $
  has a positive maximum on pairs of distance at most $h_0$.
    Neither the diagonal nor the distance-$h_0$ set contains such a maximum.
    If an endpoint lies on a face, the other endpoint lies in that face’s collar;
    (13.7) and monotonicity of $psi$ exclude this as well. Thus both endpoints are interior.
    Let $r > 0$ be their distance and orient their unique short geodesic from $y$ to $x$.
    The first derivative test says that their gradients are $q_1 \( r \)$ times the corresponding parallel unit
    tangent vectors.
  Vary both endpoints in each of three parallel transverse directions.
    The index-form estimate for the second variation of distance, using the parallel field along the geodesic,
    is bounded above by $C r$. The second derivative test for the two-point maximum therefore gives
  $ "tr"_(e^perp) "Hess" f \( x \) - "tr"_(e^perp) "Hess" f \( y \) lt.eq C q_1 r . $
  Separate axial variations at the two endpoints give
  $ "Hess" f \( x \) \( e \, e \) lt.eq psi'' \, wide "Hess" f \( y \) \( e \, e \) gt.eq - psi'' . $
  Because the transverse coefficients are exactly one at both endpoints,
    while the axial coefficients satisfy (13.5), the difference of the two left sides of (13.2) is at most
  $ C q_1 r - frac(2 c k q_1^2, 1 + q_1) . $
  Their source difference is at least $- 2 C \( 1 + q_1 \)$.
    Since $q_1 gt.eq 1$, these inequalities contradict each other for the already sufficiently large $k$.
    No comparison of the two axial coefficients was used. Only variations of the interior endpoints were required,
    so the short geodesic need not remain inside $Omega_R$. We have proved the two-point modulus;
    letting $y arrow.r x$ gives $\| thin upright(d) f \| lt.eq psi' \( 0 \) = B' \/ k$ everywhere,
    including the boundary by (13.7).
  The scalar interpolation is now uniformly elliptic. On the given smooth interior and constant-Dirichlet boundary
    patches, its equation has the exact form required by Theorem 61:
    the gradient and source are bounded, and $0 < chi_0 lt.eq chi_beta lt.eq 1$.
    That theorem first gives a uniform Hölder bound for $thin upright(d) f$, at some positive exponent.
    The coefficients and source in (13.2) are smooth compositions of $x \, Z \, f \, thin upright(d) f$,
    so the scalar Dirichlet Schauder estimate gives $C^(2 \, alpha')$ bounds for some $alpha' > 0$.
    These bounds make $f \, thin upright(d) f$ Lipschitz. Together with $Z in C^(1 \, alpha)$,
    this yields $C^(0 \, alpha)$ coefficients and source, hence $C^(2 \, alpha)$ bounds.
    The compositions are now $C^(1 \, alpha)$ and the next Dirichlet estimate gives a $C^(3 \, alpha)$ bound.
  Subtract a smooth extension of the assigned boundary values and work in the affine space with model $Y_R =
    C_0^(3 \, alpha) \( overline(Omega)_R \)$, where the zero trace is on the entire boundary.
    The equation defines a continuously differentiable map into $C^(1 \, alpha) \( overline(Omega)_R \)$.
    Its derivative in $f$ is
  $ L phi = A_beta^(i j) nabla_i nabla_j phi + b^i nabla_i phi - c \( x \) phi \, wide c \( x \) =
    eta_N [\( 1 - beta \) + beta sqrt(D) / l partial_h F_s^(upright("presc"))] > 0 . $
  Derivatives of $A_beta$ and $t$ with respect to $thin upright(d)
    f$ contribute only first derivative terms in $phi$. Its coefficients are $C^(1 \, alpha)$ and the ellipticity
    and positivity are uniform on the bounded range. The maximum principle removes the homogeneous Dirichlet
    kernel. Linear Dirichlet solvability and Schauder estimates therefore make $L : Y_R arrow.r
    C^(1 \, alpha)$ an isomorphism #cite(label("GilbargTrudinger2001")).
    The implicit function theorem proves openness in $beta$. The bounds above prove closedness:
    subsequences converge in lower Hölder norms, their limits solve the equation,
    and the uniform $C^(3 \, alpha)$ estimates retain that regularity.
    At $beta = 0$ the equation is $Delta_g f = eta_N f$, with ordinary Dirichlet solvability.
    Thus the scalar equation is solvable at $beta = 1$.
  For uniqueness, at a positive maximum of the difference of two solutions their gradients agree.
    Their matrices and positive prefactors therefore agree, whereas strict height monotonicity makes the source
    difference positive, contradicting the Hessian comparison. The reverse comparison completes uniqueness.
    Applying the same implicit function theorem with parameters $\( s \, Z \)$ proves continuous dependence into
    $C^(3 \, alpha)$. At stage junctions use one-sided parameter neighborhoods and the agreement of the
    prescriptions. The estimates were uniform on bounded trial sets, which proves the last assertion. ◻
]

=== 13.2 The frozen return map and degree <the-frozen-return-map-and-degree>

For each trial $Z$, the scalar problem has determined $f_s \[ Z \]$; the second equation remains to be imposed.
  We freeze its coefficients and source at the trial pair and solve for a new scalar function.
  A fixed point of this return map solves both equations. Arbitrary trial inputs are not assumed to satisfy the floor.

For a trial pair $\( f_s \[ Z \] \, Z \)$, evaluate all expressions in the homotopy at that pair.
  Write $A = u A_chi$, let $B_s = lambda u A_chi K \( w \, dot.op \)$ be its drift,
  and write $Q_s$ and $q_s$ for the prescribed interior source and inner flux,
  including the common terminal scale. Define $T_s Z = Y$ by the linear problem

#[#set math.equation(numbering: n => "(13.8)")
 $ "div"_g \( 3 A "grad" Y + B_s \) & = Q_s &  & upright("in ") Omega_R \,\
\( 3 A "grad" Y + B_s \) dot.op nu & = q_s &  & upright("on ") B \,\
Y & = 0 &  & upright("on ") S_R . $ <four:ex:frozen-problem>]

Thus only the occurrence of $3 "grad" Z$ in the flux is replaced by $3 "grad" Y$; the coefficients, source,
  and boundary expression are frozen. In $q_s$ the value of $F$ is always its trace prescription.

The matrix $A$ is symmetric positive definite and $C^(1 \, alpha)$.
  On bounded trial sets its ellipticity constants, $C^(1 \, alpha)$ norm, and those of $B_s \, q_s$ are bounded;
  $Q_s$ is bounded in $C^(0 \, alpha)$. In particular the source uses $thin upright(d) Z$ and $"Hess" f$,
  whose regularity is already available. With

$ cal(H)_R = { Y in H^1 \( Omega_R \) : Y \|_(S_R) = 0 } \, $

the weak problem has coercive bilinear form $3 integral_(Omega_R) A "grad" Y dot.op "grad" phi$.
  Indeed $Omega_R$ is connected and $S_R$ is nonempty, so Poincaré’s inequality holds on $cal(H)_R$.
  The prescribed flux is a bounded linear functional by the trace inequality.
  Lax–Milgram gives a unique weak solution. At an inner face $f$ is constant, so $A_chi nu = chi nu$,
  and its flux condition is equivalently

$ partial_nu Y = frac(q_s - B_s dot.op nu, 3 u chi) . $

This is a $C^(1 \, alpha)$ ordinary normal datum. The disjoint Dirichlet and normal faces have no corners.
  Linear boundary and interior estimates give $Y in C^(2 \, alpha)$ with bounds uniform on bounded trial sets;
  the weak energy estimate supplies the lower norm in these estimates.
  Coefficient dependence and uniqueness, or the same linear estimates applied to differences,
  give continuous dependence. Consequently

#[#set math.equation(numbering: n => "(13.9)")
 $ T : \[ 0 \, 4 \] times X_R arrow.r X_R quad upright("is continuous and compact on bounded sets") .
   $ <four:ex:compact-map>]

Here compactness uses the compact embedding $C^(2 \, alpha) arrow.r.hook C^(1 \, alpha)$ on the fixed truncation.

Every fixed point is smooth. Initially it has $Z in C^(2 \, alpha)$ and $f in C^(3 \, alpha)$.
  The trace equation raises the regularity of $f$, and then expansion of the divergence equation,
  with its normal boundary datum, raises the regularity of $Z$. Repetition gives all orders.
  The smooth a priori estimates from the preceding sections therefore apply to every fixed point.

#thm([Proposition 13.2.])[
  (Existence and exhaustion).  #emph[Fix the prepared geometry and $0 < epsilon.alt < 1$.
    For every sufficiently large $N$ and every allowed $R$, system (10.20) has a smooth solution on
    $overline(Omega)_R$ with $t > - epsilon.alt$. For each such fixed $N$ there is a sequence $R arrow.r
    oo$ whose solutions converge smoothly on compact subsets up to $B$ to a solution on $overline(Omega)$ with $t
    gt.eq - epsilon.alt$. This solution satisfies the prescribed inner boundary conditions,
    the height interval (11.11), and the weighted trace and flux estimates of Lemma 57.]
] <four:prop:existence>

#proof[
  Choose $N$ large enough for Proposition 55, the collar estimates,
    and the polynomial absorption conditions used in Proposition 60. Fix an allowed $R$.
    By (11.23) and Proposition 62, choose $M_0$ strictly larger than every $C^(1 \, alpha)$ norm of an above-floor
    fixed point on this truncation. Define
  #[#set math.equation(numbering: n => "(13.10)")
   $ cal(O)_s = {Z in X_R : parallel Z parallel_(C^(1 \, alpha)) < M_0 \, quad
     min_(overline(Omega)_R) t #scale(x: 120%, y: 120%)[\(] Z \,
     thin upright(d) f_s \[ Z \] #scale(x: 120%, y: 120%)[\)] > - epsilon.alt} . $ <four:ex:moving-sections>]
  Lemma 64 and smooth implicit dependence of $t$ make their union relatively open in $\[ 0 \, 4 \] times X_R$.
  Apply Lemma 31 to $I = \[ 0 \, 4 \]$, $X = X_R$, $T_s$ from (13.8), and $cal(U) = { \( s \, Z \) :
    Z in cal(O)_s }$. The norm cutoff makes $cal(U)$ bounded; the scalar solution map makes it relatively open;
    and (13.9) supplies continuity and compactness. Every fixed point is smooth.
    A fixed point on its relative boundary would satisfy $t gt.eq -
    epsilon.alt$ and meet either the norm cutoff or the floor.
    The first is excluded by the choice of $M_0$, and the second by Proposition 54.
    The section degree is therefore constant. This checks the varying-domain hypotheses for this boundary problem
    without imposing the floor on trial inputs.
  At $s = 4$, the scalar prescription is $"tr"_(A_chi) H^f = h + D_1 \( x \, w \)$ with zero boundary heights.
    At an interior extremum $w = 0$ and $D_1 = 0$, so the maximum principle gives $f = 0$ for every trial $Z$,
    and then $t = Z$. The terminal scale sets both frozen right sides to zero and the drift is absent.
    Testing the frozen equation with $Y$ gives $Y = 0$; thus $T_4$ is the zero map,
    even though its positive coefficients may depend on the input.
    Its sole fixed point, $Z = 0$, belongs to $cal(O)_4$ and has degree one.
    The degree at $s = 0$ is consequently one, proving existence there.
  Now keep $N$ fixed. The preceding choices of sufficiently large $N$ used only the already proved uniform height
    and collar results and polynomial losses such as $Pi_N eta_N \/ ell arrow.r 0$.
    The arbitrary fixed-$N$ constants in the scalar construction impose no subsequent condition on $N$.
    The bounds in Proposition 62 are uniform in allowed $R$ on each compact set, including its portions on $B$.
    A diagonal Arzelà–Ascoli argument along $R arrow.r oo$ gives smooth convergence on all these sets.
    The equation and inner data pass to the limit, as do $t gt.eq - epsilon.alt$, the height interval,
    and the collar estimates. Smooth convergence on the fixed collars passes the weighted trace and flux
    inequalities as well. Strictness of the floor in this exhaustion limit is unnecessary below. ◻
]

=== 13.3 Decay on the end <decay-on-the-end>

#thm([Lemma 13.3.])[
  (End estimates).  #emph[For every solution obtained in Proposition 65, with $N$ fixed,
    there is $a_N > 0$ such that, for every integer $j gt.eq 0$,
#[#set math.equation(numbering: n => "(13.11)")
 $ \| nabla^j f \| + \| nabla^j \( t - Z \) \| lt.eq C_j \( N \) e^(- a_N r) quad
   upright("on the distant end") . $ <four:ex:end-f>]

 Moreover
#[#set math.equation(numbering: n => "(13.12)")
 $ t \, Z = O_2 \( r^(- 2) \) \, wide Delta_g t = O \( r^(- 4 - delta_1) \) . $ <four:ex:end-tz>]

 The constants in these assertions may depend arbitrarily on $N$.
   The zeroth-order estimates and (13.11) hold uniformly for the finite-truncation solutions up to their outer faces.]
] <four:lem:end-decay>

#proof[
  Choose a fixed sphere beyond the supports of $K \, C$, and all collar terms.
    Along each finite-truncation solution the trace equation is the homogeneous linear equation
  #[#set math.equation(numbering: n => "(13.13)")
   $ A_chi : "Hess"_g f - c \( x \) f = 0 \, wide c \( x \) = eta_N sqrt(D) / l gt.eq
     c_N > 0 . $ <four:ex:f-end-linear>]
  By (11.23) the coefficients are uniformly elliptic; by Proposition 62 all their derivatives are bounded on
    uniform unit patches, independently of $R$. On the end,
  $ \( A_chi : "Hess"_g - c \) e^(- a r) = e^(- a r) #scale(x: 120%, y: 120%)[\(] a^2
    A_chi \( thin upright(d) r \, thin upright(d) r \) - a A_chi : "Hess"_g r - c #scale(x: 120%, y: 120%)[\)] . $
  Choose $a = a_N > 0$ so small that the first term is less than $c_N \/ 4$,
    and then enlarge the fixed sphere so the second term has magnitude less than $c_N \/ 4$.
    Thus $e^(- a_N r)$ is a strict supersolution. A fixed multiple dominates both signs of $f$ on the initial
    sphere and dominates the zero Dirichlet data on $S_R$. Linear comparison gives $\| f \| lt.eq
    C \( N \) e^(- a_N r)$ uniformly in $R$. Local estimates for (13.13),
    including the zero-Dirichlet estimates on the uniform outer-sphere charts,
    give the same exponential decay for every derivative, after harmless reduction of $a_N$ if necessary. The identity
  $ Z - t = 1 / 6 log \( 1 + l \( t \)^2 \| thin upright(d) f \|^2 \) $
  and the uniform smooth local bounds then give (13.11). Every graph contribution to the metric and to the
    equations is exponentially small with unit-patch derivatives.
  At zero graph and $K = 0$, the exact formulas give
  $ u = e^(2 Z) l \( Z \) \, wide V = 3 u "grad" Z \, wide cal(T) = 3 \( p \( Z \) + 1 \) \| thin upright(d) Z \|^2 . $
  Hence the actual divergence equation, divided by $u$, becomes
  #[#set math.equation(numbering: n => "(13.14)")
   $ 3 Delta_g Z + 3 frak(b)_N \( Z \) \| thin upright(d) Z \|_g^2 = rho - m_0 \( Z \) C_N rho_0 + cal(E)_N \,
     quad frak(b)_N \( z \) = p \( z \) + 2 - delta_0 \( p \( z \) + 1 \) \, $ <four:ex:Z-end-equation>]
  where $cal(E)_N$ and its derivatives on unit patches are $O_j \( e^(- a_N r) \)$.
    Define the strictly increasing function
  #[#set math.equation(numbering: n => "(13.15)")
   $ Phi \( 0 \) = 0 \, wide Phi' \( z \) = exp (integral_0^z frak(b)_N \( s \) thin thin upright(d) s) .
     $ <four:ex:Phi>]
  Its derivative is bounded above and away from zero on the fixed bounded range of $Z$.
    The chain rule cancels the quadratic term:
  #[#set math.equation(numbering: n => "(13.16)")
   $ Delta_g Phi \( Z \) = frac(Phi' \( Z \), 3) #scale(x: 120%, y: 120%)[\(] rho - m_0 \( Z \) C_N rho_0 +
     cal(E)_N #scale(x: 120%, y: 120%)[\)] \, wide \| Delta_g Phi \( Z \) \| lt.eq
     C \( N \) r^(- 4 - delta_1) . $ <four:ex:Phi-Poisson>]
  Put $beta_1 = delta_1 \/ 2$ and $W \( r \) = r^(- 2) \( 1 - r^(- beta_1) \)$. In dimension four,
  $ Delta_delta W = - beta_1 \( 2 + beta_1 \) r^(- 4 - beta_1) \, wide Delta_g W = -
    beta_1 \( 2 + beta_1 \) r^(- 4 - beta_1) + O \( r^(- 6) \) . $
  Since $0 < beta_1 < delta_1 < 1$, a sufficiently large multiple of $W$ is positive and has negative Laplacian
    dominating the absolute source in (13.16) on a sufficiently distant end.
    Enlarge the multiple to dominate $\| Phi \( Z \) \|$ on its initial sphere.
    Its value is positive on $S_R$, whereas $Phi \( Z \) = 0$ there.
    Applying the maximum principle to both $Phi \( Z \) - C W$ and $- Phi \( Z \) - C W$ gives
  $ \| Phi \( Z \) \| lt.eq C \( N \) r^(- 2) \, wide \| Z \| lt.eq C \( N \) r^(- 2) \, $
  uniformly on truncations and then in the exhaustion limit.
  Here are the differentiated estimates, which do not follow from the pointwise barrier alone.
    On an annulus of radius $r_1$, rescale by $x = r_1 y$ and set $U \( y \) = r_1^2 Phi \( Z \( r_1 y \) \)$.
    Its supremum and its Poisson source in the rescaled equation are bounded:
    the source is $r_1^4$ times the right side of (13.16), of size $O_N \( r_1^(- delta_1) \)$.
    The rescaled background coefficients have uniform smooth bounds.
    Interior $W^(2 \, p)$ estimates, for a fixed $p > 4$, give bounded $C^(1 \, theta)$ norms of $U$ on a smaller
    annulus. The weights have their differentiated power decay,
    the compositions with $Z$ now have bounded scaled Hölder norms,
    and the exponential errors remain bounded with all scaled derivatives.
    The right side therefore has a bounded $C^(0 \, theta)$ norm.
    Schauder estimates give a bounded $C^(2 \, theta)$ norm of $U$.
    The inverse of $Phi$ has bounded smooth derivatives on the relevant range.
    Rescaling back gives $Z = O_2 \( r^(- 2) \)$, and (13.11) gives the same statement for $t$.
    Finally $\| thin upright(d) Z \|^2 = O \( r^(- 6) \)$ in (13.14); since $delta_1 < 1$,
    this is lower order than $r^(- 4 - delta_1)$. Equation (13.11) now gives the asserted bound for $Delta_g t$. ◻
]

=== 13.4 Scalar curvature, boundary sign, and finite flux <scalar-curvature-boundary-sign-and-finite-flux>

For the desired system $F = h + C$ and $w \( h \) = eta_N a sigma$.
  Substitute these into (10.5) and use $"div" V = u Xi$ to obtain

#[#set math.equation(numbering: n => "(13.17)")
 $ 1 / 2 e^(2 t) "Scal"_(hat(g)) =  & mu + J \( w \) + w \( C \) - rho - \( h + C \) tau\
 & + \( 1 - delta_0 \) \( cal(T) + eta_N a sigma \) + m_0 cal(P) med gt.eq 0 . $ <four:ex:positive-scalar>]

Indeed $\| w \| lt.eq 1$, and on $"supp" K$ the height interval (11.11) permits use of (9.16):

$ mu + J \( w \) + w \( C \) - rho - \( h + C \) tau gt.eq mu - \| J \| - \| thin upright(d) C \| -
  rho - \| \( h + C \) tau \| gt.eq 0 . $

Outside $"supp" K$ the same slack inequality needs no height restriction.
  The other terms are nonnegative by (10.14) and the definitions of the penalty and $delta_0$.
  Thus the nonmaximal trace term has been retained and controlled at this final step.

The inner flux condition and (10.18) give exactly

#[#set math.equation(numbering: n => "(13.18)")
 $ H + 3 partial_nu t = - N_B \, wide hat(H) = - e^(- t) sqrt(d) thin N_B < 0 quad
   upright("on every component of ") B . $ <four:ex:negative-boundary>]

All quantities here are finite and $d > 0$ for each fixed $N$. Furthermore (13.11) and (13.12) imply

#[#set math.equation(numbering: n => "(13.19)")
 $ hat(g) - delta = O_2 \( r^(- 2) \) \, wide "Scal"_(hat(g)) = O \( r^(- 4 - delta_1) \) . $ <four:ex:final-AF>]

For the scalar estimate one may use the conformal scalar formula with $macron(g) = g + O_j \( e^(- a_N r) \)$:
  $e^(2 t) "Scal"_(hat(g)) = "Scal"_(macron(g)) - 6 Delta_(macron(g)) t -
  6 \| thin upright(d) t \|_(macron(g))^2$. The prepared scalar decay and (13.12) give precisely (13.19).
  The nonnegative scalar curvature is therefore integrable. The inequality

#[#set math.equation(numbering: n => "(13.20)")
 $ hat(g) = e^(2 t) \( g + l^2 thin upright(d) f ⊗ thin upright(d) f \) gt.eq
   e^(- 2 epsilon.alt) g $ <four:ex:metric-comparison>]

also proves completeness with $B$ included: a $hat(g)$-Cauchy sequence is $g$-Cauchy,
  its limit belongs to the closed complete exterior, and smooth local metric equivalence gives convergence in $hat(g)$.

#thm([Proposition 13.4.])[
  (Energy comparison).  #emph[For each fixed $epsilon.alt > 0$ and all sufficiently large $N$,
    the limiting metric has finite ADM energy and
#[#set math.equation(numbering: n => "(13.21)")
 $ E_(hat(g)) lt.eq E_g + frac(Pi_N, 3 omega_3) (ell + ell^2 / eta_N) . $ <four:ex:energy-error>]

 The polynomial $Pi_N$ depends only on the prepared data, $epsilon.alt$, and the fixed geometric choices.
   In particular the error tends to zero as $N arrow.r oo$ with $epsilon.alt$ fixed.]
] <four:prop:mass-comparison>

#proof[
  We first establish the exact sign and normalization at fixed $N$. Lemma 66 gives $u = 1 + O_N \( r^(- 2) \)$ and
  #[#set math.equation(numbering: n => "(13.22)")
   $ V = 3 "grad"_g t + O_N \( r^(- 5) \) + O_N \( e^(- a_N r) \) . $ <four:ex:V-asymptotics>]
  Also $u Xi in L^1 \( Omega \, thin upright(d) V_g \)$: on the end the quadratic term is $O_N \( r^(- 6) \)$,
    the graph and height-gradient terms are exponentially small,
    and the remaining weights are $O_N \( r^(- 4 - delta_1) \)$.
    The divergence theorem on a large truncation consequently gives a finite limit
  #[#set math.equation(numbering: n => "(13.23)")
   $ frak(F) := lim_(r arrow.r oo) integral_(S_r) V dot.op nu_g thin thin upright(d) A_g =
     integral_Omega u Xi thin thin upright(d) V_g + integral_B V_nu thin thin upright(d) A_g . $ <four:ex:flux>]
  The plus sign before the inner flux arises because the domain-outward normal on $B$ is $- nu$.
  To compute the metric flux, write $hat(g) = e^(2 t) g$ up to exponential errors.
    The leading perturbation relative to $g$ is $2 t delta_(i j)$,
    so in four dimensions the change of its energy numerator is
  $ partial_j \( 2 t delta_(i j) \) - partial_i \( 2 t delta_(j j) \) = - 6 partial_i t . $
  All omitted derivatives are $O_N \( r^(- 5) \)$ or exponentially small. Their sphere integrals tend to zero.
    Since $thin upright(d) t = O_N \( r^(- 3) \)$ and $g - delta = O_2 \( r^(- 2) \)$,
    changing the normal and measure in its flux from Euclidean to background ones also has vanishing error.
    Equation (13.22) thus proves both existence of the new energy and the exact relation
  #[#set math.equation(numbering: n => "(13.24)")
   $ E_(hat(g)) - E_g = - 1 / omega_3 lim_(r arrow.r oo) integral_(S_r) partial_(nu_delta) t thin thin upright(d)
     A_delta = - frac(frak(F), 3 omega_3) . $ <four:ex:mass-flux>]
  We now use polynomial constants only. Apply Lemma 57 with $phi = 1$ and use (11.13).
    On the fixed compact collars $cal(C)$ one has $min_(cal(C)) rho > 0$, and therefore
  $ integral_B \| V_nu \| thin thin upright(d) A_g & lt.eq Pi_N eta_N /
    ell integral_(cal(C)) u \( 1 + sqrt(cal(T)) \) thin thin upright(d) V_g\
 & lt.eq Pi_N eta_N / ell integral_(cal(C)) u \( rho + delta_0 cal(T) \) thin thin upright(d) V_g . $
  The polynomial absorbs the fixed comparison constant in the second line.
    Because $eta_N \/ ell = e^(- epsilon.alt N \/ 2)$, for sufficiently large $N$ this is at most one half of
    $integral_Omega u \( rho + delta_0 cal(T) \)$.
  It remains to estimate the penalty. Its support in an above-floor solution lies in $- epsilon.alt lt.eq
    t lt.eq - epsilon.alt + 1 \/ N$. For $N > 1 \/ epsilon.alt$ this interval is negative, and uniformly there
  #[#set math.equation(numbering: n => "(13.25)")
   $ l asymp ell \, wide L_0 asymp ell \, wide u lt.eq C \( ell + ell^2 sigma \) \, wide u v lt.eq
     C ell^2 sigma \, wide u a sigma = L_0 l sigma^2 gt.eq c ell^2 sigma^2 . $ <four:ex:penalty-band>]
  For example $u v = L_0 l^2 sigma^2 \/ sqrt(1 + l^2 sigma^2) lt.eq L_0 l sigma$. Thus on that band
  $ u m_0 cal(P) lt.eq Pi_N #scale(x: 120%, y: 120%)[\[] ell rho_0 +
    ell^2 sigma \( rho_0 + rho_1 \) #scale(x: 120%, y: 120%)[\]] . $
  Young’s inequality applied to $sqrt(eta_N) ell sigma$ and $Pi_N ell \( rho_0 + rho_1 \) \/ sqrt(eta_N)$,
    together with (13.25), yields everywhere
  #[#set math.equation(numbering: n => "(13.26)")
   $ u m_0 cal(P) lt.eq 1 / 2 delta_0 u eta_N a sigma + Pi_N [ell rho_0 + ell^2 / eta_N \( rho_0^2 + rho_1^2 \)] .
     $ <four:ex:penalty-absorption>]
  The enlarged $Pi_N$ is still polynomial. The three residual weights are integrable against $thin upright(d)
    V_g$ in dimension four: $rho_0 = r^(- 4 - delta_1)$, $rho_0^2 = r^(- 8 - 2 delta_1)$, and $rho_1^2 =
    r^(- 6)$ on the end, and they are bounded on the compact part.
    Combining (13.23), the boundary absorption, and (13.26) gives
  $ frak(F) gt.eq - Pi_N (ell + ell^2 / eta_N) . $
  This and (13.24) prove (13.21). Finally $ell = e^(- epsilon.alt N)$ and $ell^2 \/ eta_N =
    e^(- epsilon.alt N \/ 2)$; both dominate every polynomial loss.
    No constant from the fixed-$N$ decay or Schauder estimates appears in this bound. ◻
]

=== 13.5 Completion of the boundary deformation <completion-of-the-boundary-deformation>

#proof[
  The geometric preparation in Proposition 47 chooses a closed connected one-ended exterior $Omega$ inside the
    original data. It has nonempty compact smooth boundary and does not change the asymptotic energy.
    The last assertion of that Proposition compares every full cut in $Omega$ with the original infimum $A_(*)$.
    Fix $0 < epsilon.alt < 1$. For each sufficiently large $N$,
    Proposition 65 gives the desired smooth solution after exhausting the outer radius at that fixed $N$.
    Equation (13.17) gives nonnegative scalar curvature; Equation (13.18) gives strictly negative inner mean
    curvature on every face. Equations (13.19) and (13.20) establish the required asymptotics,
    integrability and completeness, as well as the lower metric bound.
    Proposition 67 gives finite ADM energy with the stated error.
    Its polynomial bound uses only the fixed geometric data and $epsilon.alt$.
    Since $ell = e^(- epsilon.alt N)$ and $ell^2 \/ eta_N = e^(- epsilon.alt N \/ 2)$, this error tends to zero.
    No estimates uniform over a further sequence of prepared data,
    and no convergence of the constructed metrics as $N arrow.r oo$, are needed. ◻
]

== 14 Returning to weakly decaying four-dimensional data <b:four-transfer>

The prepared boundary theorem can be used without imposing its improved end decay on the original data.
  The necessary reduction is the independent rest-end replacement and strictification proved in
  #cite(label("NumericalCompanion")) Proposition 8.8 and Lemma 8.9.
  We record the application with its order of limits, since its area comparison is one-sided.

#thm([Corollary 14.1.])[
  (The one-ended weak-decay consequence).  #emph[Let $\( M^4 \, g \, K \)$ be a smooth connected orientable
    exterior, complete with its nonempty compact smooth boundary included,
    and with exactly one Euclidean coordinate end and compact complement. Assume
$ g - delta = O_2 \( r^(- q) \) \, wide K = O_1 \( r^(- 1 - q) \) \, wide q > 1 . $

 Use the four-dimensional densities and ADM normalizations of Section 8.
   Suppose the densities are integrable, the finite ADM charges satisfy $E > \| P \|$,
   the dominant energy condition holds, and the boundary satisfies $H + "tr"_(upright("tan")) K lt.eq
   0$ with normal into $M$. Then
$ sqrt(E^2 - \| P \|^2) gt.eq 1 / 2 (frac(A_(*) \( g \), omega_3))^(2 \/ 3) \, wide omega_3 = 2 pi^2 \, $

 where $A_(*)$ uses every full cut of Definition 37.]
] <b:four-weak>

#proof[
  Set $m = sqrt(E^2 - \| P \|^2)$. The rest-end replacement #cite(label("NumericalCompanion")) Proposition 8.8
    applies with exactly these one-ended weak-decay hypotheses.
    It produces data $\( g_R \, K_R \)$ on the same exterior,
    satisfying the dominant energy condition and the weak future-trapping inequality,
    with compactly supported $K_R$ and an exact static Schwarzschild–Tangherlini tail.
    Their energy is $m_R arrow.r m$, their momentum is zero, and their full enclosing infima satisfy
  #[#set math.equation(numbering: n => "(14.1)")
   $ A_(*) \( g_R \) gt.eq \( 1 - o_R \( 1 \) \) A_(*) \( g \) . $ <b:four-transfer:one-sided>]
  This is the lower bound required below; no equality or convergence of these infima is used.
  Fix $R$ first. The strictification of #cite(label("NumericalCompanion")) Lemma 8.9 gives
    $\( g_(R \, s) \, K_(R \, s) \) = \( e^(2 s phi.alt_R) g_R \, e^(s phi.alt_R) K_R \)$,
    for all sufficiently small $s > 0$. It preserves completeness and compact tensor support,
    makes the boundary strictly future trapped, and gives, for a fixed $0 < delta_1 < 1$,
  $ mu_(R \, s) - \| J_(R \, s) \| gt.eq c_(R \, s) thin r^(- 4 - delta_1) > 0 \, quad g_(R \, s) - delta =
    O_j \( r^(- 2) \) med \( j gt.eq 0 \) \, quad R_(g_(R \, s)) = O \( r^(- 4 - delta_1) \) . $
  The densities are integrable and the ADM energy is finite.
    Thus every hypothesis of Theorem 38 is met, with all data and their constants now fixed.
    Its complete boundary solve and Corollary 40 give
  $ E_(g_(R \, s)) gt.eq 1 / 2 (frac(A_(*) \( g_(R \, s) \), omega_3))^(2 \/ 3) . $
  The latter corollary already exhausts the domain, takes $N arrow.r oo$,
    and removes the conformal floor for this fixed pair $\( R \, s \)$.
  Still at fixed $R$, strictification supplies $E_(g_(R \, s)) arrow.r m_R$ and $A_(*) \( g_(R \, s) \) arrow.r
    A_(*) \( g_R \)$ as $s arrow.b 0$. Taking this limit and then using (14.1) gives
  $ m_R gt.eq 1 / 2 (frac(A_(*) \( g_R \), omega_3))^(2 \/ 3) gt.eq 1 /
    2 (frac(\( 1 - o_R \( 1 \) \) A_(*) \( g \), omega_3))^(2 \/ 3) . $
  Finally take $R arrow.r oo$. The mass and density conventions coincide with those of both preparation results,
    so no normalization factor is introduced. The proof has used their preparations and the boundary construction,
    without importing a numerical spacetime theorem. ◻
]

== 15 What changes when the tensor reaches infinity <b:transition>

The boundary construction controls two different interfaces of the same deformation.
  At the inner boundary it prescribes the normal flux so that the new mean curvature is negative.
  At infinity it estimates the total flux so that the new energy is no larger than the old energy,
  up to an error tending to zero. Compact support of the second fundamental form simplifies the second task:
  sufficiently far out, the trace equation contains only the graph.
  We now explain precisely how maximality replaces that simplification.
  This calculation is also the reason to retain a separate maximal construction:
  it carries the original decaying tensor through the deformation instead of removing it from the end.

We work in spatial dimension four. Write $g$ for the background metric, $K$ for its second fundamental form,
  and assume $"tr"_g K = 0$. Let $N gt.eq 4$ be a fixed deformation parameter, let $0 < epsilon < 1$,
  and choose a smooth nonincreasing function $theta.alt$ equal to one on $\( - oo \, 0 \]$ and zero on
  $\[ 1 \, oo \)$. Set

$ p \( t \) = N theta.alt \( N t \) \, wide l \( t \) = exp #h(-0.16667em)
  (integral_0^t p \( s \) thin thin upright(d) s) \, wide L_0 \( t \) = e^(2 t) l \( t \) \, wide ell =
  e^(- epsilon N) \, quad eta_N = ell^(3 \/ 2) . $

For functions $f \, Z$, the equation

$ Z = t + 1 / 6 log D \, wide D = 1 + l \( t \)^2 \| nabla f \|_g^2 $

defines $t$ uniquely: its right side has positive $t$ derivative $1 + p \( 1 - D^(- 1) \) \/ 3$,
  and tends to the two ends of the real line with $t$. Put

$ d = D^(- 1) \, quad w = frac(l nabla f, sqrt(D)) \, quad v = \| w \|^2 = 1 - d \, quad chi =
  frac(3 d, 3 + p v) \, quad A_chi = I - frac(3 + p, 3 + p v) w ⊗ w \, quad u = L_0 sqrt(D) . $

The deformed metric and flux are

$ hat(g) = e^(2 t) \( g + l^2 thin upright(d) f^2 \) \, wide V = u A_chi #scale(x: 120%, y: 120%)[\(] 3 nabla Z +
  K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] . $

These are exactly the four-dimensional boundary variables. Thus the inner boundary calculation remains unchanged.
  On a face where $f$ is constant, writing $H = "div"_B nu$ and $P_B = "tr"_B K$ for the normal into the exterior gives

#[#set math.equation(numbering: n => "(15.1)")
 $ V_nu / u = d \( H + 3 partial_nu t \) - H + w_nu \( F - P_B \) \, wide hat(H) =
   e^(- t) sqrt(d) thin \( H + 3 partial_nu t \) . $ <b:transition:boundary>]

These are the local identities of Lemma 50, with $H^f = l D^(- 1 \/ 2) nabla^2 f$ and $F =
  "tr"_(A_chi) \( K + H^f \)$. All graph variables and the normal convention agree with that lemma.
  Its proof uses only the constant trace of $f$ on the face and the four-dimensional conformal boundary formula;
  it imposes no support or energy hypothesis on $K$. In particular the prescribed flux $V_nu \/ u = - H +
  w_nu \( F - P_B \) - N_B d$, with $N_B > 0$, still makes $hat(H) = - e^(- t) sqrt(d) thin N_B < 0$.

The new issue lies at the other end of the domain. There the compactly supported offset $C$ vanishes and the trace
  equation is

#[#set math.equation(numbering: n => "(15.2)")
 $ "tr"_(A_chi) \( K + H^f \) = eta_N f . $ <b:transition:trace>]

Maximality is useful here for an exact algebraic reason:

$ "tr"_(A_chi) K = - frac(3 + p, 3 + p v) l^2 / D K \( nabla f \, nabla f \) . $

Consequently (15.2) is, along any fixed solution, the homogeneous linear equation

#[#set math.equation(numbering: n => "(15.3)")
 $ A_chi : nabla^2 f + b dot.op nabla f - c_f f = 0 \, wide b = - frac(3 + p, 3 + p v) l /
   sqrt(D) K \( nabla f \, dot.op \) \, quad c_f = frac(eta_N sqrt(D), l) gt.eq eta_N / e > 0 . $ <b:transition:drift>]

Here $l lt.eq e$ follows directly from its definition. Thus retaining $K$ introduces a drift,
  but no independent forcing of the graph. An arbitrary nonmaximal tensor would leave the term $"tr"_g
  K$ and would not have this property.

#thm([Lemma 15.1.])[
  (The maximal end equation).  #emph[Suppose $1 < q < 2$, $0 < delta < q - 1$, $g - delta_(upright("Eucl")) =
    O_2 \( r^(- q) \)$ and $K = O_1 \( r^(- 1 - q) \)$ on a four-dimensional end.
    Assume $"tr"_g K = 0$ and $R_g = O \( r^(- 4 - delta) \)$.
    For fixed $N \, epsilon$, consider smooth solutions on successively larger spherical truncations, with $f =
    Z = 0$ on the outer sphere, of (15.2) and
#[#set math.equation(numbering: n => "(15.4)")
 $ "div"_g V =
   u [delta_0 cal(T) + rho + delta_0 eta_N \| w \| \| nabla f \| - m_0 \( t \) C_N \( rho_0 + v rho_1 \)] .
   $ <b:transition:divergence>]

 Here $0 < delta_0 < 1$, $rho \, rho_0 = O \( r^(- 4 - delta) \)$ with their differentiated bounds, $rho_1 =
   O \( r^(- 2 gamma) \)$ for a fixed $gamma > 1$, $m_0$ is a smooth bounded function,
   and $cal(T)$ is the quadratic term in the four-dimensional scalar identity.
   Assume that the solutions have a common bounded range and that, for every fixed derivative order,
   the background coefficients, weights and solutions have uniform fixed-$N$ classical bounds on end unit patches,
   including the outer boundary patches. Assume also that $A_chi$ is uniformly elliptic there.
   These bounds may depend on $N$ and the derivative order; they are independent of the outer radius.
   They are separate assumptions from the displayed $O_2 \/ O_1$ decay rates. Then, uniformly on those truncations,
$ \| nabla^j f \| lt.eq C_j \( N \) e^(- c_j \( N \) r) quad \( j gt.eq 0 \) \, wide \| Z \| + \| t \| lt.eq
  C \( N \) r^(- 2) . $

 Every smooth local limit satisfies $Z \, t = O_2 \( r^(- 2) \)$. Before taking that limit, its scalar equation is
#[#set math.equation(numbering: n => "(15.5)")
 $ 3 Delta_g Z + 3 \[ p \( Z \) + 2 - delta_0 \( p \( Z \) + 1 \) \] \| thin upright(d) Z \|^2 =  & delta_0 /
   2 \| K \|^2 + rho - m_0 \( Z \) C_N rho_0 + cal(E)_N \, $ <b:transition:zero-graph>]

 where $cal(E)_N$ and each required fixed derivative have exponential unit-patch bounds.]
] <b:transition:end>

#proof[
  The coefficients in (15.3) are uniformly bounded and elliptic at fixed $N$.
    For sufficiently small $c > 0$, substitution of $e^(- c r)$ into its left side gives an upper bound
  $ e^(- c r) #scale(x: 120%, y: 120%)[\(] C \( N \) c^2 + C \( N \) c - eta_N \/ e #scale(x: 120%, y: 120%)[\)] < 0 $
  outside one fixed sphere. A multiple of this positive supersolution dominates $\| f \|$ on that sphere;
    the zero outer value is already dominated. Comparison for $f$ and $- f$ gives exponential decay,
    uniformly in the truncation radius. The assumed unit-patch estimates,
    followed by the smooth linear interior and zero-Dirichlet boundary estimates for (15.3),
    give the asserted differentiated decay. These are the smooth-coefficient estimates of
    #cite(label("GilbargTrudinger2001")) Chs. 6–9 and #cite(label("AgmonDouglisNirenberg1959")).
    The implicit formula for $t$ then shows that $t - Z$ and the graph metric error have the same type of bounds.
  It remains to identify what survives when those graph errors are removed.
    Set the graph height and its first two derivatives equal to zero in the coefficients,
    retaining the exponentially small difference as an error.
    Then $H^f = 0$, $F = 0$, $w = 0$, $D = d = chi = 1$, $t = Z$ and $u = L_0 \( Z \)$.
    The smooth scalar quadratic form at this zero graph is
  #[#set math.equation(numbering: n => "(15.6)")
   $ cal(T) = 1 / 2 \| K \|^2 + 3 \( p \( Z \) + 1 \) \| thin upright(d) Z \|^2 . $ <b:transition:quadratic>]
  One can also verify this directly from its block formula.
    Choose any unit vector $e$, write $j = K \( e \, e \)$, $M = K \( e \, dot.op \) \|_(e^perp)$ and $T =
    K \|_(e^perp)$, and use $"tr" T = - j$. The terms involving $K$ become $1 / 2 \| T^0 \|^2 + \| M \|^2 + 2 /
    3 j^2$. Since $\| T \|^2 = \| T^0 \|^2 + j^2 \/ 3$, this is exactly $\| K \|^2 \/ 2$.
    The terms linear in $thin upright(d) Z$ contain $w$ and vanish, leaving the second term in (15.6).
    In particular setting the graph to zero does not set the tensor to zero.
  Now $\( log L_0 \)' = p + 2$. Divide (15.4) by $L_0$, insert (15.6),
    and move the quadratic gradient term to the left. Smooth dependence on the bounded solution variables absorbs
    the graph errors into $cal(E)_N$ and gives (15.5).
  Define $Phi \( 0 \) = 0$ and
  $ Phi' \( z \) =
    exp #h(-0.16667em) (integral_0^z \[ p \( s \) + 2 - delta_0 \( p \( s \) + 1 \) \] thin thin upright(d) s) . $
  On the common bounded range of $Z$, both $Phi'$ and its reciprocal are bounded at fixed $N$. The chain rule gives
  $ Delta_g Phi \( Z \) = frac(Phi' \( Z \), 3) [delta_0 / 2 \| K \|^2 + rho - m_0 \( Z \) C_N rho_0 + cal(E)_N] . $
  The right side is $O_N \( r^(- 4 - delta) \)$, because $\| K \|^2 = O \( r^(- 2 - 2 q) \)$ and $2 + 2 q > 4 +
    delta$. With $alpha = delta \/ 2$, set $b_0 = r^(- 2) - r^(- 2 - alpha)$.
    For sufficiently large $r$, this is positive and
  $ - Delta_g b_0 = alpha \( 2 + alpha \) r^(- 4 - alpha) + O \( r^(- 4 - q) \) gt.eq c r^(- 4 - alpha) . $
  A fixed multiple of $b_0$ dominates both the absolute source and $\| Phi \( Z \) \|$ on the fixed inner sphere.
    Since $Phi \( Z \) = 0$ at the outer sphere, comparison for both signs gives $\| Phi \( Z \) \| lt.eq
    C \( N \) r^(- 2)$, and hence $\| Z \| + \| t \| lt.eq C \( N \) r^(- 2)$.
    These estimates hold before exhaustion, so the local limit has the asserted normalization at infinity.
  Finally rescale annuli $R < r < 2 R$ to unit size. The metric has uniformly controlled scaled $C^(1 \, beta)$
    coefficients for each fixed $0 < beta < 1$. Interior $W^(2 \, p_1)$ estimates with $p_1 > 4$ first give $\|
    thin upright(d) Z \| = O_N \( r^(- 3) \)$. The first derivative bound on $K$,
    the differentiated weights and the exponential error then give a controlled scaled Hölder norm for the source.
    Schauder estimates yield $nabla^2 Z = O_N \( r^(- 4) \)$. The same follows for $t$ from the graph error. ◻
]

The term $\| K \|^2 \/ 2$ has two consequences for the rest of the construction.
  First, the end proof must use the original decay of $K$; it cannot invoke a result whose hypothesis is $K =
  0$ outside a compact set. Second, the continuation must control the corresponding noncompact drift before these
  fixed-parameter estimates are available. The appropriate tail weights follow from a short calculation. Choose

$ 1 < gamma < min { 2 \, q - delta \/ 2 } \, wide rho_0 asymp r^(- 4 - delta) \, quad rho_1 asymp r^(- 2 gamma) . $

This interval is nonempty because $delta < q - 1$. For $a = \| w \|$ one has

#[#set math.equation(numbering: n => "(15.7)")
 $ a r^(- 2 - q) lt.eq 1 / 2 a^2 r^(- 2 gamma) + 1 / 2 r^(- 4 - 2 q + 2 gamma) lt.eq
   C \( v rho_1 + rho_0 \) . $ <b:transition:tail-budget>]

The first inequality is Young’s inequality; the second uses $2 gamma < 2 q - delta$.
  Also $\| K \|^2 lt.eq C rho_0$. Thus the drift error controlled by $Pi_N \( \| K \|^2 + a \| nabla K \| \)$ fits
  the same kind of floor penalty as in the boundary construction, with exponents adapted to the original end.
  Since $4 gamma > 4$, the square of $rho_1$ is integrable.
  That last fact is exactly what permits its contribution to the flux loss to be absorbed with an error tending to zero.

The local comparison is now explicit. Signed boundary faces and their inner flux formula are shared.
  The maximal route supplies its own strict approximation and an all-black threshold boundary;
  it proves the noncompact drift estimate and its complete boundary continuation with the weights above.
  Once these yield the fixed-$N$ estimates, Lemma 69 gives the correct end normalization.
  In applying that lemma, unit-scale convolution of the strict end coefficients supplies their uniform bounds at
  every fixed derivative order; a subsequent trace-free projection preserves maximality.
  This is an actual preparation step, not a consequence of smoothness and $O_2 \/ O_1$ decay alone.
  The displayed decay rates are the ones retained from the original data and used in the final annular estimates.
  The final comparison still uses the actual metric $hat(g)$, its minimal enclosure, and its ADM flux.
  Maximality preserves a method with the original tensor tail; it does not replace those existence, boundary,
  or enclosure arguments.

== 16 The maximal comparison and its scope <four:maximal:section>

Maximality allows the boundary deformation to retain a decaying second fundamental form all the way to infinity.
  The reason is the homogeneous trace equation in Section 15:
  when $"tr"_g K = 0$, the tensor contributes a drift proportional to the graph gradient.
  Thus the graph can decay exponentially even though $K$ does not vanish outside a compact set.
  The conformal equation still sees $\| K \|^2 \/ 2$. We now construct the solutions for which that end
  calculation applies.

There are two geometric tasks before solving the equations.
  We must create strict dominant-energy slack without destroying maximality or changing the limiting energy and
  enclosing area. We must then select an inner boundary whose outward collars control the large graph slopes.
  The remaining analysis has the same input and output as the boundary method:
  nonnegative scalar curvature, negative inner mean curvature, a lower metric comparison on every cut,
  and an upper error in energy. The noncompact drift requires the tail weights and continuation estimates proved
  in this part.

The following theorem records the maximal-vacuum application considered here.
  Corollary 68 gives a broader numerical comparison under its one-ended weak-decay and dominant-energy hypotheses.
  That corollary first replaces the distant end and tensor.
  The construction below retains the decaying tensor tail through the deformation.

Throughout, four refers to the spatial dimension. The associated spacetime dimension is five,
  and a horizon has dimension three. Write $omega_3 = \| S^3 \| = 2 pi^2$.
  The notation $O_j \( r^(- q) \)$ includes coordinate derivatives through order $j$,
  with the corresponding additional decay.

#thm([Theorem 16.1.])[
  #emph[Let $\( M \, g \, K \)$ be a smooth connected orientable initial-data exterior,
    diffeomorphic to $bb(R)^4$ minus an open ball, complete up to its connected compact boundary $S tilde.equiv
    S^3$, and with one asymptotically flat end. Here $K$ is a symmetric covariant two-tensor.
    Assume the vacuum constraint equations with zero cosmological constant and maximality:
#[#set math.equation(numbering: n => "(16.1)")
 $ R_g + \( "tr"_g K \)^2 - \| K \|_g^2 = 0 \, wide "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g
   #scale(x: 120%, y: 120%)[\)] = 0 \, wide "tr"_g K = 0 . $ <four:maximal:intro:constraints>]

 Assume a smooth effective $T^2 = U \( 1 \) times U \( 1 \)$ action preserving $g \, K$ which,
   in an asymptotically Euclidean chart $bb(R)^4 = bb(C)^2$, is
$ \( e^(i alpha) \, e^(i beta) \) dot.op \( z_1 \, z_2 \) = \( e^(i alpha) z_1 \, e^(i beta) z_2 \) $

 at all sufficiently large radii. No cohomogeneity-one assumption is made. In that chart suppose
#[#set math.equation(numbering: n => "(16.2)")
 $ g_(i j) - delta_(i j) = O_2 \( r^(- q) \) \, wide K_(i j) = O_1 \( r^(- q - 1) \) \, wide
   q > 1 . $ <four:maximal:intro:decay>]

 Suppose the following ADM limits exist and are finite:
#[#set math.equation(numbering: n => "(16.3)")
 $ E & = frac(1, 6 omega_3) lim_(r arrow.r oo) integral_(\| x \| = r) \( partial_j g_(i j) - partial_i g_(j j) \)
   nu_delta^i thin upright(d) A_delta \,\
P_i & = frac(1, 3 omega_3) lim_(r arrow.r oo) integral_(\| x \| = r) #scale(x: 120%, y: 120%)[\(]
  K_(i j) - \( "tr"_g K \) g_(i j) #scale(x: 120%, y: 120%)[\)] nu_delta^j thin upright(d) A_delta .
  $ <four:maximal:intro:energy>]

 Assume $P = 0$ and $E > 0$.]
  #emph[Orient $S$ by its unit normal $nu$ toward the end and set $H_S = "div"_S nu$. Suppose
#[#set math.equation(numbering: n => "(16.4)")
 $ Theta_K \( S \) := H_S + "tr"_S K = 0 . $ <four:maximal:intro:mots>]

 Suppose $S$ is outermost toward the end: there is no compact smooth embedded two-sided hypersurface in the
   interior enclosing $S$, oriented toward the end, with $Theta_K lt.eq 0$ everywhere.
   Suppose also that $S$ is outer area-minimizing: every compact smooth embedded enclosing hypersurface has
   three-volume at least $A = \| S \|_g$. Disconnected and noninvariant enclosing competitors are included. Then
#[#set math.equation(numbering: n => "(16.5)")
 $ E gt.eq 1 / 2 (frac(A, 2 pi^2))^(2 \/ 3) . $ <four:maximal:intro:main-inequality>]

]
] <four:maximal:thm:main>

An enclosing hypersurface separates $S$ from the selected end and bounds with $S$ a compact region.
  The original $S$ is itself allowed when taking the enclosing-area infimum.
  All hypersurface areas in this part are three-dimensional volumes.
  In particular, outer area-minimization in Theorem 70 is not restricted by the torus action.
  The torus action and outermostness specify the stated application class;
  the construction below does not use them. Ball-exterior topology supplies the compact filling,
  and vacuum supplies the initial strictification. Outer area-minimization identifies the final enclosing-area
  infimum with $A$. Neither $H_S = 0$ nor $"tr"_S K = 0$ is imposed.
  The conditions $P = 0$ and $E > 0$ identify the energy in (16.3) with the ADM rest mass.

The normalization is sharp. The time-symmetric Schwarzschild–Tangherlini family #cite(label("Tangherlini1963"))
  has, in isotropic coordinates of radius $𝜚$, the spatial metric

$ g_m = (1 + frac(m, 2 𝜚^2))^2 delta \, wide K = 0 \, wide 𝜚 gt.eq sqrt(m \/ 2) \; $

see also #cite(label("BrayLee2009")) p. 83. Its leading metric term is $m 𝜚^(- 2) delta$,
  so (16.3) gives energy $m$. The boundary sphere has volume $8 omega_3 \( m \/ 2 \)^(3 \/ 2) =
  omega_3 \( 2 m \)^(3 \/ 2)$, making the right side of (16.5) equal to $m$.

Unless a different metric is indicated, norms, contractions,
  covariant derivatives and index raising use the background metric $g$. We use $Delta = "div" "grad"$.
  For symmetric two-tensors define

#[#set math.equation(numbering: n => "(16.6)")
 $ P_D & = D - \( "tr"_g D \) g \, & sans(B) \( D_1 \, D_2 \) & = D_1 : D_2 - \( "tr"_g D_1 \) \( "tr"_g D_2 \) \,\
mu & = 1 / 2 #scale(x: 120%, y: 120%)[\(] R_g - sans(B) \( K \, K \) #scale(x: 120%, y: 120%)[\)] \, & J & =
  "div"_g P_K . $ <four:maximal:intro:bilinear>]

Thus the vacuum constraints give $mu = J = 0$. For an oriented hypersurface the expansion is $Theta_K = H +
  "tr"_(upright("tan")) K$, with the normal toward the specified exterior.
  On an inner boundary this normal points into the exterior domain;
  on a distant coordinate sphere the outward normal points toward infinity.
  We retain these conventions in every boundary flux.

For an inner cut $S_0$, let

$ cal(A)_g \( S_0 \) = inf { \| Sigma \|_g : Sigma upright(" is a smooth enclosing cut of ") S_0 } \, $

using the full class of cuts in Definition 37 and including $S_0$ when it is smooth.
  The proof uses this infimum until the final application of the outer area-minimizing hypothesis.

=== 16.1 The geometric output and the route to it <the-geometric-output-and-the-route-to-it>

It is useful to state what the construction will produce for strict data before introducing its equations.
  This is the point at which the analytic problem rejoins the mass–area comparison.

#thm([Proposition 16.2.])[
  (Maximal deformation output).  #emph[Let $\( M \, g \, K \)$ be a smooth connected orientable four-dimensional
    ball exterior, complete including its compact boundary $S$, with one Euclidean coordinate end.
    Let $r gt.eq 1$ be a fixed smooth positive extension of its Euclidean radius.
    Suppose $1 < q < 2$, $0 < delta < q - 1$,
$ "tr"_g K = 0 \, quad g - delta_(upright("Eucl")) = O_2 \( r^(- q) \) \, quad K = O_1 \( r^(- 1 - q) \) \, quad
  R_g = O \( r^(- 4 - delta) \) \, wide mu - \| J \| gt.eq c_0 r^(- 4 - delta) > 0 \, $

 and suppose $H_S + "tr"_S K < 0$. Assume finite ADM energy and uniform bounds of every fixed derivative order on
   end patches of unit size. Write $A_(*) = cal(A)_g \( S \)$ for the infimum over all smooth enclosing cuts,
   including disconnected cuts.]
  #emph[There is a smooth cut $B$ enclosing $S$, with connected one-ended exterior $Omega$,
    such that for each $0 < epsilon.alt < 1$ and all sufficiently large integers $N$ there is a smooth metric
    $hat(g)_N$ on $overline(Omega)$ satisfying
$ hat(g)_N gt.eq e^(- 2 epsilon.alt) g \, wide R_(hat(g)_N) gt.eq 0 \, wide hat(H)_B < 0 \, wide
  E_(hat(g)_N) lt.eq E_g + frac(Pi_N, 3 omega_3) \( e^(- epsilon.alt N) + e^(- epsilon.alt N \/ 2) \) . $

 Here $Pi_N$ has polynomial growth at fixed strict data and $epsilon.alt$.
   The new metric is complete including $B$, has $hat(g)_N - delta_(upright("Eucl")) =
   O_2 \( r^(- q) \)$ and $R_(hat(g)_N) = O \( r^(- 4 - delta) \)$,
   and every smooth cut enclosing $B$ has $hat(g)_N$-area at least $e^(- 3 epsilon.alt) A_(*)$.]
] <four:maximal:prop:geometric-output>

The proof occupies Sections 17– 22. First we obtain $B$ and its outward collars.
  Next we prove a lower bound for $t$, followed by height, boundary-flux and range estimates for every possible
  continuation solution. Local regularity and an unrestricted scalar solve then define the compact continuation
  map. Only after existence and fixed-$N$ exhaustion do we use the end calculation of Lemma 69.
  The final flux estimate proves the displayed energy bound.
  This order separates the polynomial estimates needed for the mass limit from arbitrary fixed-$N$ regularity constants.

The trace $"tr"_g K$ vanishes throughout this construction.
  Its positive regularizing parameter is $eta_N = ell^(3 \/ 2)$; this parameter is distinct from the trace.
  The scalar weight is denoted by $L_0 = e^(2 t) l \( t \)$.
  First fix the strict geometry and its decay exponents, then $epsilon.alt > 0$ and a sufficiently large $N$.
  Exhaust the outer radius at fixed $N$, send $N arrow.r oo$ using polynomial constants only,
  then send $epsilon.alt arrow.b 0$ and remove the strict approximation.
  Arbitrary fixed-$N$ regularity constants do not enter the final mass limit.

== 17 Strict data and the geometric inner boundary <four:maximal:sec:preparation>

This section produces the strict data and the inner boundary used in the deformation.
  The approximation is controlled in ADM energy and in the infimum over all enclosing areas.
  The geometric construction also supplies a comparison principle for closed sets described by smooth exterior
  supports; this will be used before any derivative estimates for the deformation are available.

=== 17.1 Strict conformal approximation <strict-conformal-approximation>

The spacetime Poisson construction of Jaracz #cite(label("Jaracz2025StrictDEC")) is the model for this reduction.
  Here the conformal exponents are four-dimensional, the inner Neumann datum is nonzero,
  and we prove preservation of maximality and comparison for the full enclosing-area infimum.

Decrease the decay exponent, if necessary, so that $1 < q < 2$, and fix $0 < delta < q - 1$.
  Extend the end radius to a positive smooth function $r gt.eq 1$ on the exterior.
  We use the enclosing-area infimum $cal(A)_g \( S \)$ defined above.

#thm([Proposition 17.1.])[
  (Reduction to strict data).  #emph[The data of Theorem 70 admit smooth approximations $\( g_j \, K_j \)$ on the
    same exterior such that
#[#set math.equation(numbering: n => "(17.1)")
 $ "tr"_(g_j) K_j & = 0 \, & mu_j - \| J_j \|_(g_j) & gt.eq c_j r^(- 4 - delta) \,\
Theta_(K_j) \( S \) & < 0 \, & R_(g_j) & = O \( r^(- 4 - delta) \) \, wide
  c_j > 0 . $ <four:maximal:prep:strict-properties>]

 They have the prescribed $O_2 \( r^(- q) \)$ metric decay and $O_1 \( r^(- 1 - q) \)$ tensor decay,
   and all their coordinate derivatives are bounded uniformly over end patches of unit size,
   with constants allowed to depend on $j$ and the derivative order. Moreover,
#[#set math.equation(numbering: n => "(17.2)")
 $ E_(g_j) arrow.r E_g \, wide cal(A)_(g_j) \( S \) arrow.r cal(A)_g \( S \) . $ <four:maximal:prep:approx-limits>]

 Consequently, it suffices to prove $E_g gt.eq 1 / 2 \( cal(A)_g \( S \) \/ omega_3 \)^(2 \/ 3)$ for such strict
   maximal data on this exterior. Neither vacuum nor marginality is required of the intermediate approximations.]
] <four:maximal:prop:strict-data>

#proof[
  Choose a positive smooth function $b gt.eq \| K \|_g$ which equals a constant multiple of $r^(- 1 - q)$
    sufficiently far out. We first solve
  #[#set math.equation(numbering: n => "(17.3)")
   $ - Delta_g phi.alt = b sqrt(\| thin upright(d) phi.alt \|_g^2 + r^(- 6)) + r^(- 4 - delta) \, wide
     partial_nu phi.alt = - 1 upright(" on ") S \, wide phi.alt arrow.r 0 upright(" at infinity") \,
     $ <four:maximal:prep:phi-equation>]
  where $nu$ points into the exterior. In particular, the normal derivative in this equation is the negative of
    the domain’s outward normal derivative at its inner boundary.
  Here are the existence and decay details. On the compact truncation $M_R$, impose $phi.alt =
    0$ on the outer coordinate sphere and replace $b$ on the right by $lambda b$, $0 lt.eq lambda lt.eq 1$.
    The linearization, with homogeneous boundary data, is
  $ v mapsto - Delta_g v -
    lambda b
    frac(chevron.l thin upright(d) phi.alt \, thin upright(d) v chevron.r_g, sqrt(\| thin upright(d)
    phi.alt \|_g^2 + r^(- 6))) . $
  Its drift is bounded by $b$. Its kernel is zero by the strong maximum principle and the boundary point lemma,
    since the outer Dirichlet face is nonempty and the inner face has homogeneous normal derivative.
    The mixed operator has Fredholm index zero, by deformation to the mixed Laplacian, and hence is invertible.
    The two boundary components are disjoint, smooth, and compact,
    so ordinary scalar elliptic estimates apply without a junction between boundary types;
    see #cite(label("GilbargTrudinger2001")) Chapters 3, 6, and 9 and #cite(label("AgmonDouglisNirenberg1959"))
    Theorems 7.3 and 15.2–15.3.
  For fixed $R$, the global mixed $W^(2 \, p)$ estimate, $p > 4$, and interpolation give
  #[#set math.equation(numbering: n => "(17.4)")
   $ parallel phi.alt parallel_(W^(2 \, p) \( M_R \)) lt.eq C_(R \, p) #scale(x: 120%, y: 120%)[\(] 1 +
     parallel thin upright(d) phi.alt parallel_(L^p \( M_R \)) +
     parallel phi.alt parallel_(L^p \( M_R \)) #scale(x: 120%, y: 120%)[\)] lt.eq
     C'_(R \, p) \( 1 + parallel phi.alt parallel_oo \) . $ <four:maximal:prep:phi-estimate>]
  These constants are uniform in $lambda$. If the suprema were unbounded,
    divide by their sup norms and take a subsequence. Compact embedding of $W^(2 \, p)$ in $C^(1 \, alpha)$,
    with a smaller $alpha > 0$, gives a nonzero limit $v$ satisfying
  $ - Delta_g v = lambda_(*) b \| thin upright(d) v \|_g \, wide partial_nu v = 0 upright(" on ") S \, wide v =
    0 upright(" on the outer face") . $
  This is a homogeneous linear equation with a bounded measurable drift:
    set the drift to $lambda_(*) b "grad" v \/ \| thin upright(d) v \|$ where $thin upright(d) v eq.not 0$,
    and to zero otherwise. The maximum principle and boundary point lemma again exclude a nonzero solution.
    Thus (17.4) is bounded, and Schauder estimates and bootstrapping give closedness in the continuity argument.
    The $lambda = 0$ mixed Poisson problem is solvable, so the implicit function theorem and compactness give a
    smooth solution for $lambda = 1$. It is nonnegative: a negative minimum is excluded in the interior by $-
    Delta phi.alt > 0$, on the outer face by its zero value, and on the inner face by $partial_nu phi.alt = - 1$.
  We next bound these solutions independently of $R$. On the end consider
  $ T \( r \) = r^(- 2) \( 1 - A r^(- delta) \) . $
  Choose a fixed $A > 0$, then a large fixed $r_0$, so that $T > 0$ and
  #[#set math.equation(numbering: n => "(17.5)")
   $ \( - Delta_g - b \| thin upright(d) thin dot.op thin \| \) T gt.eq
     c thin r^(- 4 - delta) wide \( r gt.eq r_0 \) . $ <four:maximal:prep:radial-barrier>]
  Indeed, $- Delta_(bb(R)) T = A delta \( 2 + delta \) r^(- 4 - delta)$,
    while both the metric error and $b \| thin upright(d) T \|$ are $O \( r^(- 4 - q) \)$. Also
  $ - Delta_g phi.alt - b \| thin upright(d) phi.alt \| lt.eq b r^(- 3) + r^(- 4 - delta) lt.eq C r^(- 4 - delta) . $
  Comparison on ${ r_0 lt.eq r lt.eq R }$, including the zero outer value, therefore yields
  #[#set math.equation(numbering: n => "(17.6)")
   $ 0 lt.eq phi.alt_R \( x \) lt.eq C \( 1 + m_R \) r \( x \)^(- 2) \, wide m_R =
     max_({ r lt.eq r_0 }) phi.alt_R . $ <four:maximal:prep:uniform-tail>]
  If $m_R$ were unbounded along expanding truncations, divide by $m_R$.
    Local versions of (17.4), including the inner boundary estimates,
    give a nonnegative limit attaining value one in the fixed core.
    It solves $- Delta v = b \| thin upright(d) v \|$, has homogeneous inner normal derivative,
    and is $O \( r^(- 2) \)$ by (17.6). Its positive maximum is therefore attained at a finite point.
    The strong maximum principle or the boundary point lemma excludes it.
    We have a uniform core bound, and diagonal compactness gives a smooth solution of (17.3).
  Rescale annuli by their radii. The bound $phi.alt = O \( r^(- 2) \)$, the scaled metric bounds furnished by $g -
    delta = O_2 \( r^(- q) \)$, and the linear gradient growth in (17.3) first give scaled $W^(2 \, p)$ estimates
    by interpolation. They give Hölder control of the gradient;
    the right side then has the scaled Hölder control needed for Schauder estimates. Hence
  #[#set math.equation(numbering: n => "(17.7)")
   $ phi.alt = O_2 \( r^(- 2) \) . $ <four:maximal:prep:phi-decay>]
  The source in (17.3) is $O \( r^(- 4 - q) \) + O \( r^(- 4 - delta) \)$, and is integrable.
    The divergence theorem shows that
  $ I_phi.alt = lim_(R arrow.r oo) integral_(S_R) partial_(nu_g) phi.alt thin upright(d) A_g $
  exists. Replacing this by its Euclidean-coordinate flux changes it by $O \( R^(- q) \)$, which tends to zero.
  For small $s > 0$ set $g_s = e^(2 s phi.alt) g$ and $K_s = e^(s phi.alt) K$. The trace remains zero.
    The connection change is
  $ Gamma \( g_s \)_(i j)^k - Gamma \( g \)_(i j)^k =
    s \( delta_i^k phi.alt_j + delta_j^k phi.alt_i - g_(i j) phi.alt^k \) . $
  Contracting it against the scaled trace-free tensor, and using the four-dimensional scalar-curvature formula, gives
  #[#set math.equation(numbering: n => "(17.8)")
   $ e^(2 s phi.alt) mu_s & = mu - 3 s Delta_g phi.alt - 3 s^2 \| thin upright(d) phi.alt \|^2 \,\
e^(s phi.alt) J_s & = J + 3 s K \( "grad" phi.alt \, dot.op \) \,\
Theta_(K_s) \( S \) & = e^(- s phi.alt) #scale(x: 120%, y: 120%)[\(] Theta_K \( S \) +
  3 s partial_nu phi.alt #scale(x: 120%, y: 120%)[\)] . $ <four:maximal:prep:conformal-constraints>]
  The last coefficient is three because the boundary has dimension three.
    A covector norm contributes one more factor $e^(- s phi.alt)$, so the first two identities and $mu = J = 0$ imply
  #[#set math.equation(numbering: n => "(17.9)")
   $ e^(2 s phi.alt) \( mu_s - \| J_s \|_(g_s) \) & gt.eq 3 s #scale(x: 120%, y: 120%)[\[] -
     Delta phi.alt - \| K \| \| thin upright(d) phi.alt \| - s \| thin upright(d) phi.alt \|^2
     #scale(x: 120%, y: 120%)[\]]\
 & gt.eq 3 s #scale(x: 120%, y: 120%)[\[] r^(- 4 - delta) -
   s \| thin upright(d) phi.alt \|^2 #scale(x: 120%, y: 120%)[\]] . $ <four:maximal:prep:strict-gap>]
  The ratio $\| thin upright(d) phi.alt \|^2 \/ r^(- 4 - delta)$ is bounded, by (17.7) and $delta < 1$.
    Thus small $s > 0$ gives a positive gap of the asserted order.
    The boundary expansion is $- 3 s e^(- s phi.alt) < 0$. Moreover,
  $ R_(g_s) = e^(- 2 s phi.alt) #scale(x: 120%, y: 120%)[\(] \| K \|^2 - 6 s Delta phi.alt -
    6 s^2 \| thin upright(d) phi.alt \|^2 #scale(x: 120%, y: 120%)[\)] = O \( r^(- 4 - delta) \) \, $
  because $2 + 2 q > 4 + delta$. The original metric and tensor decay is preserved, since $q < 2$.
  Only $- 6 s partial_i phi.alt$ survives from the conformal change in the ADM integrand.
    Products with a metric error or with $phi.alt$ have vanishing integrated flux by (17.7). Thus
  #[#set math.equation(numbering: n => "(17.10)")
   $ E_(g_s) = E_g - s / omega_3 I_phi.alt arrow.r E_g . $ <four:maximal:prep:conformal-mass>]
  Since $phi.alt$ is bounded, the comparison $e^(- 2 s parallel phi.alt parallel_oo) g lt.eq g_s lt.eq
    e^(2 s parallel phi.alt parallel_oo) g$ holds on the entire exterior.
    Its three-dimensional area comparison holds for every enclosing cut, and therefore for their infima.
    In particular, $cal(A)_(g_s) \( S \) arrow.r cal(A)_g \( S \)$, with no compactness assumption on minimizing cuts.
  ===== 17.1.1 Smoothing the end. <smoothing-the-end.>
  The conformal step has produced strict dominance and convergence of energy and enclosing-area infima.
    The differentiated end estimates will also need bounds of every fixed derivative order on patches of unit
    size. The original $O_2 \/ O_1$ hypotheses do not supply those bounds;
    we obtain them by smoothing each fixed strict pair sufficiently far out.
  Fix one of these strict pairs and temporarily denote it by $\( g \, K \)$. Let $h = g - delta$ in the end chart.
    Convolve $h$ and $K$ with a nonnegative smooth kernel of integral one supported in a unit ball.
    Interpolate to the original data with a cutoff which is zero for $r lt.eq R_(upright("sm"))$, one for $r gt.eq
    2 R_(upright("sm"))$, and has derivatives of order $i$ bounded by $C_i R_(upright("sm"))^(- i)$.
    Call the resulting metric and tensor $tilde(g) \, tilde(K)$,
    and project the tensor to its $tilde(g)$-trace-free part:
  $ K^(upright("sm")) = tilde(K) - 1 / 4 \( "tr"_(tilde(g)) tilde(K) \) tilde(g) . $
  For sufficiently large $R_(upright("sm"))$, the metric remains positive definite.
    The available original derivatives give
  $ h * kappa - h = O \( r^(- q - 1) \) \, wide D \( h * kappa - h \) = O \( r^(- q - 2) \) \, wide K * kappa -
    K = O \( r^(- q - 2) \) . $
  Here $D$ denotes coordinate differentiation only in this paragraph.
    For the trace projection, use the original trace-free identity in the form
  $ "tr"_delta K = \( delta^(i j) - g^(i j) \) K_(i j) = O_1 \( r^(- 1 - 2 q) \) . $
  Convolution and interpolation preserve this first-derivative bound. Moreover
  $ "tr"_(tilde(g)) tilde(K) = "tr"_delta tilde(K) + \( tilde(g)^(i j) - delta^(i j) \) tilde(K)_(i j) =
    O_1 \( r^(- 1 - 2 q) \) . $
  Differentiating the last product uses only the available first derivatives of the metric and tensor.
    Thus the projection changes the tensor by $O_1 \( r^(- 1 - 2 q) \)$,
    without requiring a second derivative of the original $K$.
  For trace-free data with these decay bounds, the constraint pair has the flat linear principal expressions
  #[#set math.equation(numbering: n => "(17.11)")
   $ \( mu \, J \) = (1 / 2 \( partial_i partial_j h_(i j) - Delta_(bb(R)) h_(i i) \) \, thin partial_j K_(i j)) +
     O \( r^(- 2 - 2 q) \) . $ <four:maximal:prep:linear-constraints>]
  The scalar error consists of $h D^2 h$, $\( D h \)^2$, and $\| K \|^2$;
    the momentum error consists of $h D K$ and $\( D h \) K$.
    The displayed linear operators commute with convolution. Cutoff derivatives multiply the preceding convolution
    differences and contribute $O \( r^(- q - 3) \)$. The trace projection changes the momentum by
    $O \( r^(- 2 - 2 q) \)$. Hence the new constraint pair is the interpolated average of the old pair, up to
  #[#set math.equation(numbering: n => "(17.12)")
   $ O \( r^(- 2 - 2 q) + r^(- q - 3) \) = o \( r^(- 4 - delta) \) . $ <four:maximal:prep:smoothing-errors>]
  Replacing the old momentum norm by its Euclidean norm, and the averaged Euclidean momentum norm by the new
    metric norm, each costs $O \( r^(- 2 - 2 q) \)$: both metrics differ from the Euclidean metric by
    $O \( r^(- q) \)$, while both momenta are $O \( r^(- 2 - q) \)$.
    The triangle inequality and positivity of the kernel therefore preserve a fixed positive fraction of the
    strict dominance gap once $R_(upright("sm"))$ is sufficiently large.
    This radius is chosen separately for each fixed strict pair,
    so the little-o errors are smaller than its particular positive gap coefficient.
    The two needed exponent inequalities are
  $ 2 q - 2 - delta > 0 \, wide q - 1 - delta > 0 . $
  The same calculation shows that the scalar curvature is still $O \( r^(- 4 - delta) \)$.
  Beyond $2 R_(upright("sm"))$, derivatives of the convolution kernel bound every higher derivative on unit
    patches, using the original zeroth, first, and second derivative bounds.
    The transition region is smooth and compact. At infinity the metric’s first derivative changes by
    $O \( r^(- q - 2) \)$, whose integrated ADM contribution is $O \( r^(1 - q) \) arrow.r 0$.
    Thus this smoothing leaves the energy exactly unchanged. As $R_(upright("sm")) arrow.r oo$,
    its uniform metric ratio tends to one, so the enclosing infimum converges as well.
    Choosing first $s arrow.b 0$, and then a sufficiently large smoothing radius for each $s$,
    proves (17.1) and (17.2). ◻
]

For the remainder of the proof fix strict data from Proposition 72, and write $A_(*) = cal(A)_g \( S \)$.
  Constants may depend on this fixed approximation. Write $c_0 > 0$ for a fixed constant such that $mu - \| J \|
  gt.eq c_0 r^(- 4 - delta)$ for these data.

=== 17.2 Threshold regions and outward collars <threshold-regions-and-outward-collars>

We use the following part of the total trapped-region theorem:
  on a complete smooth asymptotically flat initial data set of spatial dimension $2$ through $7$,
  the nonempty union of bounded regions with smooth boundary and outward expansion at most zero has a smooth
  embedded outermost stable MOTS as its outer frontier. We take its closed, filled representative.
  Filling a bounded complementary component deletes boundary components and preserves admissibility.
  This is the existence and regularity conclusion of #cite(label("AnderssonEichmairMetzger2011")) Section 4.3,
  Theorem 4.6; it requires no energy condition. We do not use the additional topology conclusions of that theorem.

#thm([Lemma 17.2.])[
  (Threshold selection and collars).  #emph[There is a number $c$ with $max_S Theta_K < c < 0$,
    and a closed filled compact region $cal(D)_c$, containing a smooth compact filling of $S$ and an exterior
    collar of $S$, with the following properties. Its boundary $B$ is a smooth embedded stable threshold surface,
    $Theta_K \( B \) = c$. It belongs to an increasing family $cal(D)_b$, $max_S Theta_K < b < 0$,
    of total regions at threshold $b$, all lying in a fixed compact set, and
#[#set math.equation(numbering: n => "(17.13)")
 $ cal(D)_b arrow.r cal(D)_c quad upright("in Hausdorff distance as ") b arrow.b c .
   $ <four:maximal:prep:right-continuity>]

 The exterior $Omega$ of $cal(D)_c$ is connected and one-ended.
   Every smooth cut enclosing $B$ has $g$-area at least $A_(*)$.
   Each component of $B$ has a smooth outward collar with leaf coordinate $s gt.eq 0$, $s = 0$ at $B$,
   $\| thin upright(d) s \| > 0$, whose leaves satisfy
#[#set math.equation(numbering: n => "(17.14)")
 $ Theta_K \( { s = upright("constant") } \) gt.eq c \, wide nu_s =
   frac("grad" s, \| thin upright(d) s \|) . $ <four:maximal:prep:outward-collars>]

]
] <four:maximal:lem:threshold-collars>

#proof[
  The given diffeomorphism of the exterior permits a smooth compact filling behind $S$.
    Extend $g \, K$ smoothly over it; the extended metric can be chosen positive definite by interpolation with
    any interior metric away from a collar. This extension is used only in the present geometric construction.
  Fix a large radius $R_0$ beyond which every coordinate sphere has $Theta_K = 3 \/ r + O \( r^(- 1 - q) \) > 0$.
    Outside a still larger fixed radius, smoothly cut the metric to the Euclidean metric and the unshifted tensor
    to zero. Dilated cutoffs preserve the bounds $g - delta = O_2 \( r^(- q) \)$, $K = O_1 \( r^(- 1 - q) \)$,
    and consequently the positive expansion of all spheres in the cutoff annuli.
    Denote these complete auxiliary data by $\( g^(upright("aux")) \, K^(upright("aux")) \)$.
    Choose a fixed nonnegative smooth cutoff $xi$, equal to one on the filling and throughout a large neighborhood
    of ${ r lt.eq R_0 }$, and zero far out. For $max_S Theta_K < b < 0$, use the tensor
  $ K_b^(upright("aux")) = K^(upright("aux")) - b / 3 xi g^(upright("aux")) . $
  Where $xi = 1$ and the data are uncut, the exact identity is
  #[#set math.equation(numbering: n => "(17.15)")
   $ Theta_(K_b^(upright("aux"))) \( Sigma \) = Theta_K \( Sigma \) - b . $ <four:maximal:prep:threshold-shift>]
  In the cutoff region the added tangential trace is $- b xi gt.eq 0$,
    so all the distant spheres still have positive expansion, uniformly in $b$.
  A smooth weakly trapped bounded region cannot meet those distant spheres:
    at a point where its boundary reaches its greatest radius,
    its tangent plane and outward normal agree with those of the coordinate sphere,
    and its mean curvature is at least the sphere’s mean curvature. The tensor traces there agree.
    This contradicts nonpositive expansion. The same argument applies to the outer frontier furnished by the
    total-region theorem. Thus all total regions are contained in the uncut part of the construction.
  For every indicated $b$, strictness at $S$ gives a short outward collar whose leaves have expansion less than
    $b$. The filling together with this collar is a nonempty trapped region for $K_b^(upright("aux"))$.
    The theorem therefore gives a total closed region $cal(D)_b$ with smooth stable frontier.
    Its frontier lies strictly outside $S$, in the original data, and has $Theta_K = b$ by (17.15).
    We used one filling and one set of cutoffs for the entire interval of $b$.
    Since $xi gt.eq 0$, increasing $b$ decreases the shifted expansion on every candidate hypersurface. It follows that
  #[#set math.equation(numbering: n => "(17.16)")
   $ b_1 < b_2 quad arrow.r.double quad cal(D)_(b_1) subset cal(D)_(b_2) . $ <four:maximal:prep:threshold-monotonicity>]
  Choose a compact enlargement $Q$ containing all these regions.
    Lemma 6 applies to the increasing family of closed subsets $E_b =
    cal(D)_b$ of this fixed compact metric space, with $max_S Theta_K < b < 0$.
    The preceding construction proves both the common compact containment and monotonicity;
    every member is nonempty. Choose $c$ outside the lemma’s countable exceptional set.
    Its conclusion is exactly (17.13). Filling bounded complementary pockets ensures that the remaining exterior
    is the connected component containing the sole end. Any cut enclosing its entire boundary $B$ also encloses
    $S$, proving the area assertion.
  It remains to construct the collars. Apply Lemma 7 with ambient dimension four, $Q = K$, threshold $c$,
    and each connected component of $B$. The total-region theorem gives a compact smooth stable frontier;
    its principal eigenvalue is nonnegative #cite(label("AnderssonMarsSimon2008")) Proposition 5.1.
    On an open neighborhood of this frontier the auxiliary cutoff $xi$ equals one and the data are uncut,
    so the relevant shifted tensor is exactly $K - \( c \/ 3 \) g$.
    Its expansion differs from $Theta_K$ by the constant $c$, with zero derivative under graph variations.
    Replacing one component by a sufficiently short outward graph of expansion at most $c$ would strictly enlarge
    the total region while preserving every other component. Thus the local maximality hypothesis of the collar
    lemma holds in this application.
  For clarity, its zero-mode construction uses the expansion $cal(E) \( v \)$ of the outward graph on this one
    component and $L = D cal(E) \( 0 \)$. The common augmented inverse specializes to
  #[#set math.equation(numbering: n => "(17.17)")
   $ \( v \, a \) mapsto (L v - a \, med integral_B v thin upright(d) A_g) \, wide C^(2 \, alpha) \( B \) times
     bb(R) arrow.r C^(0 \, alpha) \( B \) times bb(R) . $ <four:maximal:prep:augmented-inverse>]
  Here the integrals are over the chosen component. The positive principal and adjoint eigenfunctions,
    their simple kernels, and the positive pairing used to invert this map are those in
    #cite(label("AnderssonMarsSimon2008")) Section 4, Lemma 4.1, as in the common proof.
    That proof gives strictly larger expansion on every positive outward leaf, including the zero-eigenvalue case;
    stability alone would not give this conclusion. Finitely many components permit disjoint shortened collars,
    proving (17.14). ◻
]

=== 17.3 Exterior supports of nonsmooth sets <exterior-supports-of-nonsmooth-sets>

The threshold regions control smooth surfaces. The graph-height limit will give only a closed sublevel set,
  so we need the same comparison for smooth surfaces that touch such a set from outside.
  The next argument transports the supporting tangent plane exactly;
  this prevents an uncontrolled curvature of the support from entering the error.

For a closed set $A$, a smooth exterior support at $x in partial A$ is a regular level ${ psi =
  0 }$ in a neighborhood of $x$, where $psi \( x \) = 0$, $thin upright(d) psi \( x \) eq.not 0$,
  and $A subset { psi lt.eq 0 }$ locally. Its normal is $nu_psi = "grad" psi \/ \| thin upright(d) psi \|$,
  and its expansion is

#[#set math.equation(numbering: n => "(17.18)")
 $ Theta_K \[ psi \] = frac("tr"_g "Hess" psi - "Hess" psi \( nu_psi \, nu_psi \), \| thin upright(d) psi \|) +
   "tr"_g K - K \( nu_psi \, nu_psi \) . $ <four:maximal:prep:support-expansion>]

Only supports that exist are tested; no regularity is assumed of $A$ itself.

#thm([Lemma 17.3.])[
  (Enclosure from exterior supports).  #emph[Let $A$ be a compact closed set containing $cal(D)_c$.
    Suppose that every smooth exterior support to its frontier has expansion at most $k'$, where $c lt.eq k' < 0$. Then
$ A subset cal(D)_(c') wide upright("for every ") k' < c' < 0 . $

 All expansions at the frontier of $A$ are computed in the original strict exterior data.]
] <four:maximal:lem:support-enclosure>

#proof[
  First, every set under consideration lies inside one fixed large sphere.
    Otherwise the coordinate sphere at its maximum radius is an exterior support with positive expansion,
    contrary to $k' < 0$. Choose a compact enlargement containing this sphere and a small metric neighborhood of
    it. All constants below depend only on the smooth geometry and tensor on this enlargement.
    Distances may be computed in the complete smooth filling,
    since the contact points and sufficiently short segments used below lie in the original exterior:
    $A$ contains the filling and a collar of $S$.
  For $z > 0$, put $A_z = { y : "dist" \( y \, A \) lt.eq z }$.
    Apply Lemma 9 in ambient dimension four, with its set $D = A$, tensor $Q = K$, and threshold $k'$.
    The compact neighborhood and short segments required by that local lemma are precisely those just fixed.
    The definition (17.18) is its normalized expansion. It follows that every exterior support to $A_z$ has
    expansion at most
  #[#set math.equation(numbering: n => "(17.19)")
   $ k' + C z \, $ <four:maximal:prep:parallel-support-bound>]
  where $C$ is independent of that support’s curvature.
  The exact geometric feature of this application is worth recording.
    For a nearest pair $x in A$, $x' in partial A_z$, let $P : T_x M arrow.r
    T_(x') M$ be parallel transport along the short minimizing segment.
    The Jacobi construction in the common proof gives
  #[#set math.equation(numbering: n => "(17.20)")
   $ F_z \( x \) = x' \, wide thin upright(d) F_z \|_x = P \, wide \| nabla thin upright(d) F_z \|_x lt.eq
     C z . $ <four:maximal:prep:exact-transport>]
  If $psi$ defines the support at $x'$, then $psi compose F_z$ supports $A$ at $x$, and
  #[#set math.equation(numbering: n => "(17.21)")
   $ "Hess" \( psi compose F_z \)_x \( X \, Y \) =  & "Hess" psi_(x') \( P X \, P Y \)\
 & + thin upright(d) psi_(x') #scale(x: 120%, y: 120%)[\(] \( nabla thin upright(d) F_z \)_x \( X \, Y \)
   #scale(x: 120%, y: 120%)[\)] . $ <four:maximal:prep:hessian-pullback>]
  The exact tangent isometry preserves the normalized Hessian trace;
    only the $O \( z \)$ second-map derivative and the $C^1$ change of $K$ enter the expansion error.
    Thus no term multiplying $"Hess" psi$ has been discarded.
    This local transport step uses compact ambient bounds, while the following enclosure argument still uses the
    auxiliary total regions specific to the maximal end.
  Fix $k' < c' < 0$, and take $beta > 0$ below the preceding injectivity and collar scales, so small that $k' +
    C beta < c'$. Smooth approximation of the distance function, followed by a regular-value choice,
    gives a smooth compact region $U$ with
  $ A_(beta \/ 4) subset "int" U \, wide U subset A_(3 beta \/ 4) . $
  For example, approximate the distance uniformly within $beta \/ 32$,
    and choose a regular value between $3 beta \/ 8$ and $5 beta \/ 8$.
    Choose a smooth nonnegative function $zeta$ equal to one near $partial U$ with $"supp" zeta subset {
    "dist" \( dot.op \, A \) < beta }$. For sufficiently large finite $Lambda$,
    replacing the auxiliary threshold tensor by
  $ K_(c')^(upright("aux")) - Lambda zeta g^(upright("aux")) $
  makes $partial U$ strictly trapped: the added term decreases its expansion by $3 Lambda$.
    Apply the total-region theorem to these smoothly modified complete data.
    Let $tilde(cal(D))$ be the resulting closed filled total region and $tilde(B)$ its smooth frontier.
    It contains $U$. All cutoffs were placed outside the fixed enlargement above; outside the support of $zeta$,
    large spheres retain positive expansion. The maximum-radius argument confines $tilde(B)$ to the uncut
    exterior. There it satisfies
  #[#set math.equation(numbering: n => "(17.22)")
   $ Theta_K \( tilde(B) \) = c' + 3 Lambda zeta gt.eq c' . $ <four:maximal:prep:modified-frontier>]
  Let $z = "dist" \( A \, tilde(B) \)$, the global minimum distance.
    Because $tilde(cal(D))$ contains $A_(beta \/ 4)$, one has $z gt.eq beta \/ 4 > 0$.
    If $z < beta$, every path of length less than $z$ starting in $A$ remains on the inner side of $tilde(B)$:
    its first crossing would contradict the definition of $z$. Taking closures proves $A_z subset tilde(cal(D))$.
    At a pair attaining the distance, $tilde(B)$ is therefore an exterior support to $A_z$.
    Equations (17.19) and (17.22) imply
  $ c' lt.eq Theta_K \( tilde(B) \) lt.eq k' + C z lt.eq k' + C beta < c' \, $
  a contradiction. Thus $z gt.eq beta$. Since this is the global minimum,
    $zeta$ vanishes at every point of $tilde(B)$, including when the minimum equals $beta$.
    It follows that $Theta_K \( tilde(B) \) = c'$ everywhere.
    Its filled inner region is an admissible threshold-$c'$ region for the original auxiliary data,
    so $A subset tilde(cal(D)) subset cal(D)_(c')$, as required. ◻
]

=== 17.4 Fixed collar data <fixed-collar-data>

Set $b_(*) = c$. On the disjoint collars supplied by Lemma 73,
  choose a nonpositive smooth compactly supported function $C$, equal to $- kappa s$ near each component of $B$,
  with $kappa > 0$ sufficiently small. Indeed, multiply $- kappa s$ by nonnegative collar cutoffs.
  The strict gap has a positive minimum on their compact support, so $kappa$ can be chosen small enough that,
  for a fixed smooth positive function $rho$ equal to a positive multiple of $r^(- 4 - delta)$ on the end,

#[#set math.equation(numbering: n => "(17.23)")
 $ \| thin upright(d) C \| + rho lt.eq mu - \| J \| . $ <four:maximal:prep:offset-slack>]

For instance first choose $rho lt.eq \( c_0 \/ 4 \) r^(- 4 - delta)$,
  then bound $\| thin upright(d) C \|$ by half the remaining strict gap on its support.
  These data, the collars, the threshold $b_(*)$, and the region $Omega$ are fixed before choosing any of the
  deformation parameters below.

== 18 The scalar-curvature deformation <four:maximal:sec:deformation>

We now fix the strict data and the exterior $Omega$ constructed in Section 17.
  Thus $B = partial Omega$ has expansion $H_B + "tr"_B K = b_(*) < 0$, the tensor is maximal,
  and the fixed functions $C lt.eq 0$ and $rho > 0$ satisfy

#[#set math.equation(numbering: n => "(18.1)")
 $ \| d C \| + rho lt.eq mu - \| J \| . $ <four:maximal:def:slack>]

The normal $nu$ at $B$ points into $Omega$. The compactly supported function $C$ vanishes on $B$ and equals $-
  kappa s$ in its fixed collars. Throughout this section the base dimension is four and a transverse block has
  dimension three.

=== 18.1 Variables and the exact scalar identity <variables-and-the-exact-scalar-identity>

The pointwise identities used here are those of Section 10.
  We retain their variables and four-dimensional density conventions below.
  Their proofs are local and impose no support condition on $K$; maximality will enter through $"tr"_g K =
  0$ in the equations and the estimates for the tensor tail.

Fix $0 < epsilon.alt < 1$. The integer $N gt.eq 4$ is an auxiliary parameter.
  Fix once and for all a smooth nonincreasing function $theta.alt :
  bb(R) arrow.r \[ 0 \, 1 \]$ equal to one on $\( - oo \, 0 \]$ and zero on $\[ 1 \, oo \)$, and set

#[#set math.equation(numbering: n => "(18.2)")
 $ p \( t \) = N theta.alt \( N t \) \, wide l \( t \) = exp (integral_0^t p \( s \) thin upright(d) s) \, wide
   L_0 \( t \) = e^(2 t) l \( t \) \,\
ell = e^(- epsilon.alt N) \, wide eta_N = ell^(3 \/ 2) . $ <four:maximal:def:warp>]

In particular $0 lt.eq p lt.eq N$, $\| p' \| lt.eq parallel theta.alt' parallel_oo N^2$, $l \( t \) =
  e^(N t)$ for $t lt.eq 0$, and $l lt.eq e$ everywhere. A symbol $Pi_N$ denotes a positive polynomial bound in
  $N$; its coefficients may depend on the fixed strict data, collars, cutoffs, $epsilon.alt$,
  and subsequently fixed small constants, but not on a solution, the outer radius, or a homotopy parameter.
  Its value may increase from one estimate to the next. Arbitrary constants at fixed $N$ will instead be denoted
  by $C \( N \)$.

On $Omega_R = Omega ∩ { r < R }$ the unknowns are $f \, Z$.
  Define $t$ implicitly and the remaining variables explicitly by

#[#set math.equation(numbering: n => "(18.3)")
 $ sigma & = \| "grad" f \| \, & D & = 1 + l \( t \)^2 sigma^2 \, & d & = D^(- 1) \, & Z & = t + 1 / 6 log D \,\
w & = frac(l "grad" f, sqrt(D)) \, & a & = \| w \| \, & v & = a^2 = 1 - d \, & chi & = frac(3 d, 3 + p v) \,\
h & = eta_N f \, & U & = l sqrt(D) \, & u & = L_0 sqrt(D) . $ <four:maximal:def:implicit>]

At fixed $sigma$, the derivative of the right side of (18.3) with respect to $t$ is $1 + p v \/ 3 > 0$.
  As $t arrow.r - oo$ it tends to $- oo$, and as $t arrow.r oo$ it tends to $oo$.
  Consequently $t = t \( Z \, d f \)$ exists uniquely and smoothly for all finite arguments.
  Notice that $t gt.eq - epsilon.alt$ implies $ell lt.eq l lt.eq e$.

For $sigma > 0$ put $e_f = "grad" f \/ sigma$ and $A_j = "Id" + \( j - 1 \) e_f ⊗ e_f$.
  The two matrices used below have the globally smooth formulas

#[#set math.equation(numbering: n => "(18.4)")
 $ A_d = "Id" - w ⊗ w \, wide A_chi = "Id" - frac(3 + p, 3 + p v) w ⊗ w \, wide frac(3 d, 3 + N) lt.eq chi lt.eq
   d lt.eq 1 . $ <four:maximal:def:matrices>]

They are positive definite; the displayed formulas remove the apparent ambiguity of the axis when $d f = 0$.
  We identify vectors and covectors using $g$, write $\| xi \|_A^2 = A \( xi \, xi \)$, and put

#[#set math.equation(numbering: n => "(18.5)")
 $ macron(g) = g + l^2 d f ⊗ d f \, quad hat(g) = e^(2 t) macron(g) \, quad H^f = l / sqrt(D) "Hess" f \, quad
   S_f = K + H^f \,\
V = u A_chi #scale(x: 120%, y: 120%)[\(] 3 "grad" Z + K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] .
  $ <four:maximal:def:graph-fields>]

The trace equation will always be

#[#set math.equation(numbering: n => "(18.6)")
 $ "tr"_(A_chi) S_f = F . $ <four:maximal:def:trace>]

Here $F$ is the prescribed right side, including its dependence on $f$, $Z$, and $d f$ when a system is specified.

For symmetric tensors recall $P_A = A - \( "tr" A \) g$ and $sans(B) \( A_1 \, A_2 \) = A_1 :
  A_2 - \( "tr" A_1 \) \( "tr" A_2 \)$. The constraint quantities are $mu = \( R_g - sans(B) \( K \, K \) \) \/
  2$ and $J = "div" P_K$. At a point with $sigma > 0$, decompose $S_f$ relative to $e_f^perp xor bb(R)
  e_f$ into its transverse symmetric block $T$, mixed covector $M$, and axial entry $j$.
  The letter $M$ in the formulas below denotes only this block. Put

#[#set math.equation(numbering: n => "(18.7)")
 $ x = partial_(e_f) t \, wide y = \( "grad" t \)_perp \, wide T^0 = T - 1 /
   3 \( F - chi j \) "Id"_perp . $ <four:maximal:def:blocks>]

The trace equation gives $"tr" T = F - chi j$.

#thm([Proposition 18.1.])[
  (Scalar identity).  #emph[For smooth $f \, t$ satisfying (18.6),
#[#set math.equation(numbering: n => "(18.8)")
 $ 1 / 2 e^(2 t) R_(hat(g)) = mu + J \( w \) + cal(T) + w \( F \) - F "tr" K - u^(- 1) "div" V \,
   $ <four:maximal:def:scalar-identity>]

 where
#[#set math.equation(numbering: n => "(18.9)")
 $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + \( p + 1 \) a y \|^2 - v \| y \|^2 + 3 \( p + 1 \) \( \| y \|^2 + d x^2 \)\
 & - 1 / 3 \( F - chi j \)^2 + chi j^2 - chi F j + F^2 + 2 \( p + 1 \) chi j a x . $ <four:maximal:def:quadratic-form>]

 This expression extends smoothly across $d f = 0$.]
] <four:maximal:prop:scalar-identity>

#proof[
  This is Proposition 48, with its axis $e = e_f$ and the same graph variables and density normalization.
    Its arbitrary trace $tau$ is zero here.
  We record the differential relations needed in the boundary and drift calculations.
    Differentiating the implicit definition of $Z$ gives
  #[#set math.equation(numbering: n => "(18.10)")
   $ 3 thin d Z = \( 3 + p v \) d t + H^f \( w \, dot.op \) . $ <four:maximal:def:Z-differential>]
  If $k = - H^f - p \( d t ⊗ w^flat + w^flat ⊗ d t \)$ and $Q = K - k$, then
  #[#set math.equation(numbering: n => "(18.11)")
   $ V \/ u & = P_Q w + 3 A_d "grad" t + F w \,\
u^(- 1) "div" \( u w \) & = F + \( 1 - chi \) j - "tr"_g K +
  2 \( p + 1 \) w \( t \) . $ <four:maximal:def:flux-rewrite>]
  These are the identities in the proof of the cited proposition.
    They follow by inserting $"tr" T = F - chi j$ and $H^f \( w \, dot.op \) =
    v thin d log sigma$ into its invariant formula; their smooth tensor expressions also hold at $d f = 0$.
    The quadratic expression there is precisely the displayed $cal(T)$. ◻
]

#thm([Lemma 18.2.])[
  (Polynomial coercivity).  #emph[The quadratic form in (18.9) is nonnegative, and
#[#set math.equation(numbering: n => "(18.12)")
 $ \| T \|^2 + \| M \|^2 + d j^2 + F^2 + \| d t \|_(A_d)^2 lt.eq Pi_N cal(T) . $ <four:maximal:def:coercivity>]

 At $d t = 0$ it has the stronger equivalence
#[#set math.equation(numbering: n => "(18.13)")
 $ cal(T) asymp \| T^0 \|^2 + \| M \|^2 + chi j^2 + F^2 \, $ <four:maximal:def:coercivity-stationary>]

 with both constants absolute, independent of $N \, d \, chi$.]
] <four:maximal:lem:coercivity>

#proof[
  Lemma 49 applies with the same dictionary. For clarity, its exact square completion is
  #[#set math.equation(numbering: n => "(18.14)")
   $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + \( p + 1 \) a y \|^2 + #scale(x: 120%, y: 120%)[\(] 3 \( p + 1 \) -
     v #scale(x: 120%, y: 120%)[\)] \| y \|^2\
 & + 3 \( p + 1 \) d (x + frac(chi a j, 3 d))^2 + 2 / 3 (F - frac(chi j, 4))^2 +
   frac(d \( 48 - 3 d \), 8 \( 3 + p v \)^2) j^2 . $ <four:maximal:def:square-completion>]
  The last coefficient is at least $45 d \/ \[ 8 \( 3 + N \)^2 \]$ and the coefficient of $\|
    y \|^2$ is at least two. Undoing the shifted squares therefore costs only a polynomial in $N$.
    When $d t = 0$, the normal terms instead reduce to
  $ 2 / 3 \( F - chi j \/ 4 \)^2 + chi \( 1 - 3 chi \/ 8 \) j^2 . $
  The bounds $5 \/ 8 lt.eq 1 - 3 chi \/ 8 lt.eq 1$ and $chi^2 lt.eq
    chi$ give the absolute equivalence claimed in (18.13). ◻
]

#thm([Lemma 18.3.])[
  (Boundary identity).  #emph[On a hypersurface where $f$ is constant,
    let $H$ denote its $g$-mean curvature for a chosen normal $nu$, and put $P_B = "tr"_B K$. Then
#[#set math.equation(numbering: n => "(18.15)")
 $ V_nu \/ u & = d \( H + 3 partial_nu t \) - H + w_nu \( F - P_B \) \,\
hat(H) & = e^(- t) sqrt(d) thin \( H + 3 partial_nu t \) . $ <four:maximal:def:boundary-flux>]

 The identities allow either sign of $partial_nu f$, including zero.]
] <four:maximal:lem:boundary-identity>

#proof[
  Apply Lemma 50 with the chosen normal $nu$ and trace relation (18.6).
    Its formulas use the signed component $w_nu$ and extend smoothly to $d f = 0$,
    so they also apply when the normal graph slope changes sign. ◻
]

=== 18.2 The equations and their homotopy <four:maximal:def:homotopy>

Choose

#[#set math.equation(numbering: n => "(18.16)")
 $ 1 < gamma < min \( 2 \, q - delta \/ 2 \) \, wide rho_0 = r^(- 4 - delta) \, wide rho_1 =
   r^(- 2 gamma) . $ <four:maximal:def:end-weights>]

Here $r$ is the fixed positive smooth extension of the end radius.
  Fix smooth cutoffs $m_0^(*) \, j_0 : bb(R) arrow.r \[ 0 \, 1 \]$ with $m_0^(*) = 1$ on $\( - oo \, 0 \]$,
  $m_0^(*) = 0$ on $\[ 1 \, oo \)$, $j_0 = 0$ on $\( - oo \, 0 \]$, and $j_0 = 1$ on $\[ 1 \, oo \)$. Define

#[#set math.equation(numbering: n => "(18.17)")
 $ cal(P) = C_N \( rho_0 + v rho_1 \) \, wide m_0 \( t \) = m_0^(*) \( N \( t + epsilon.alt \) \) \, wide Xi =
   delta_0 cal(T) + rho + delta_0 eta_N a sigma - m_0 \( t \) cal(P) . $ <four:maximal:def:penalty>]

Proposition 81 below fixes a single $delta_0 > 0$ independent of $N$ and then a sufficiently large polynomial
  $C_N$. Choose a smooth $N_B > 1 + sup_B \| H \|$ on $B$ and write

#[#set math.equation(numbering: n => "(18.18)")
 $ cal(B) = - H + w_nu \( F - P_B \) - N_B d \, wide P_B = "tr"_B K . $ <four:maximal:def:boundary-datum>]

The system whose solution we seek is

#[#set math.equation(numbering: n => "(18.19)")
 $
   cases(delim: "{", "tr"_(A_chi) \( K + H^f \) = F = h + C \, & upright("in ") Omega_R \,, "div" V = u Xi \, &
   upright("in ") Omega_R \,, h = b_(*) \, quad V_nu \/ u = cal(B) \, & upright("on ") B \,, f = Z = 0 \, &
   upright("on ") S_R .) $ <four:maximal:def:system>]

In the boundary datum, $F$ always means the prescribed trace right side,
  so the datum contains no unprescribed second derivatives.

The two geometric signs follow directly for any smooth solution of (18.19).
  Maximality and Proposition 75 give the exact decomposition

#[#set math.equation(numbering: n => "(18.20)")
 $ 1 / 2 e^(2 t) R_(hat(g)) = #scale(x: 120%, y: 120%)[\(] mu + J \( w \) + w \( C \) -
   rho #scale(x: 120%, y: 120%)[\)] + \( 1 - delta_0 \) cal(T) + \( 1 - delta_0 \) eta_N a sigma +
   m_0 cal(P) . $ <four:maximal:def:scalar-sign>]

The bracket is nonnegative by (18.1) and $\| w \| lt.eq 1$,
  and all other terms are nonnegative when $delta_0 < 1$. On $B$, subtracting (18.18) from (18.15) gives $H +
  3 partial_nu t = - N_B$, and therefore

#[#set math.equation(numbering: n => "(18.21)")
 $ R_(hat(g)) gt.eq 0 \, wide hat(H) = - e^(- t) sqrt(d) thin N_B < 0 . $ <four:maximal:def:geometric-signs>]

These conclusions use the actual boundary expansion $H + P_B = b_(*)$. They require no assumption that $H$ vanishes.

Here is a homotopy to a scalar system with a trivial endpoint. Let

$ V_lambda = u A_chi #scale(x: 120%, y: 120%)[\(] 3 "grad" Z +
  lambda K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq lambda lt.eq 1 . $

In the first three stages impose $"div" V_lambda = u Xi$ and

#[#set math.equation(numbering: n => "(18.22)")
 $ frac(\( V_lambda \)_nu, u) = #scale(x: 120%, y: 120%)[\[] 1 - \( 1 - lambda \) j_0 \( t \)
   #scale(x: 120%, y: 120%)[\]] #scale(x: 120%, y: 120%)[\[]
   cal(B) - \( 1 - lambda \) \( A_chi K \( w \, dot.op \) \)_nu #scale(x: 120%, y: 120%)[\]] .
   $ <four:maximal:def:homotopy-boundary>]

All outer values remain $f = Z = 0$. Let $nu_s = "grad" s \/ \| d s \|$ in the fixed collars.
  Choose smooth bounded functions $D_0 \( x \, w \)$ and $D_1 \( x \, w \)$,
  supported in those collars and with uniformly bounded derivatives for $\| w \| lt.eq 1$, as follows:

- $D_0 lt.eq 0$, $D_0 = 0$ when $w dot.op nu_s gt.eq 0$, and $D_0 \( x \, - nu \) < - 2 sup_B \| H \|$ on $B$;
- $D_1 = A_1 zeta_B \( x \) w dot.op nu_s$, where $zeta_B = 1$ near $B$ is a fixed collar cutoff and $A_1 > 1 +
  sup_B \| H \|$.

Such $D_0$ is obtained by a fixed smooth function of $w dot.op nu_s$,
  zero on the nonnegative half-line and sufficiently negative at $- 1$, times a collar cutoff.
  In particular $D_0 \( x \, 0 \) = D_1 \( x \, 0 \) = 0$. The stages, with their endpoints included, are:

+ Decrease $lambda$ from one to zero, keeping $F = h + C$ and $h \|_B = b_(*)$.
+ Keep $lambda = 0$ and increase $alpha$ from zero to one, with $F = h + C + alpha D_0$ and $h \|_B = b_(*)$.
+ Keep $lambda = 0$ and increase $zeta$ from zero to one, with
  #[#set math.equation(numbering: n => "(18.23)")
   $ F = h + \( 1 - zeta \) \( C + D_0 \) + zeta #scale(x: 120%, y: 120%)[\(] "tr"_(A_chi) K +
     D_1 #scale(x: 120%, y: 120%)[\)] \, wide h \|_B = \( 1 - zeta \) b_(*) . $ <four:maximal:def:stage-three>]
+ Keep the terminal trace problem
  #[#set math.equation(numbering: n => "(18.24)")
   $ "tr"_(A_chi) H^f = h + D_1 \, wide f \|_(B union S_R) = 0 \, $ <four:maximal:def:terminal-trace>]
  and multiply both $Xi$ and the right side of (18.22) by a common factor $eta$, decreasing from one to zero.

The prescriptions agree at every junction. In every stage the derivative of $F$ with respect to $h$ is one.
  The form $cal(T)$ is always computed from the actual trace equation and the actual tensor $K + H^f$,
  including when $lambda = 0$.

Two features of this choice will be used in the estimates.
  First, in stage three the limiting values at $w = nu \, - nu$, with $chi = 0$ and the assigned face height, obey

#[#set math.equation(numbering: n => "(18.25)")
 $ F \( x \, nu \) gt.eq P_B + H \, wide F \( x \, - nu \) lt.eq P_B - H . $ <four:maximal:def:face-direction-signs>]

At $zeta = 0$ the first equality follows from $b_(*) = P_B + H$ and $D_0 \( x \, nu \) = C \|_B = 0$;
  the second follows from the choice of $D_0$. At $zeta = 1$ the two values are $P_B plus.minus A_1$.
  Convex combination proves (18.25) for intermediate $zeta$.
  Second, the terminal trace equation forces $f = 0$ for every $C^(1 \, alpha)$ trial $Z$ and its classical trace
  solution: at a positive interior maximum the left side is nonpositive and the right side is $eta_N f > 0$,
  while at a negative interior minimum the signs reverse. Boundary values are zero. Thus in stage four

#[#set math.equation(numbering: n => "(18.26)")
 $ f = 0 \, quad t = Z \, quad d = chi = 1 \, quad u = L_0 \( t \) \, quad cal(T) = 1 / 2 \| K \|^2 +
   3 \( p + 1 \) \| d t \|^2 . $ <four:maximal:def:terminal-reduction>]

#thm([Lemma 18.4.])[
  (Height and initial end bounds).  #emph[Every smooth homotopy solution satisfies $\| h \| + \| F \| lt.eq
    C_0$ for a fixed constant independent of $N \, R$ and the homotopy parameter.
    There are fixed $r_0 \, C_2$ such that, for all sufficiently large $R$ depending on $N \, epsilon.alt$,
    the first three stages satisfy
#[#set math.equation(numbering: n => "(18.27)")
 $ \| h \| lt.eq C_2 \( r^(- gamma) - R^(- gamma) \) quad \( r_0 lt.eq r lt.eq R \) \,
   wide \| "grad" f \| \|_(S_R) lt.eq C_3 eta_N^(- 1) R^(- 1 - gamma) . $ <four:maximal:def:height-end>]

 Moreover $t > - epsilon.alt$ on $S_R$. None of these assertions assumes an interior lower bound for $t$.]
] <four:maximal:lem:height-end>

#proof[
  At an interior extremum of $h$, we have $w = 0$, $A_chi = "Id"$, $D_0 = D_1 = 0$, and $"tr" K = 0$.
    The trace equation and its positive Hessian coefficient show that a minimum has $h gt.eq
    0$ and that a maximum has $h lt.eq parallel C parallel_oo$. The boundary heights lie in $\[ b_(*) \, 0 \]$.
    Consequently
  #[#set math.equation(numbering: n => "(18.28)")
   $ b_(*) lt.eq h lt.eq parallel C parallel_oo $ <four:maximal:def:height-range>]
  in stages one through three; stage four has $f = 0$. All remaining terms in the trace prescriptions are
    uniformly bounded for $\| w \| lt.eq 1$, $0 lt.eq chi lt.eq 1$, so $F$ has a fixed bound as well.
  Outside the compact supports the trace equation takes the form
  $ beta "tr"_(A_chi) "Hess" h + s_K "tr"_(A_chi) K = h \, wide beta = frac(l, eta_N sqrt(D)) \, wide 0 lt.eq
    s_K lt.eq 1 . $
  Here $s_K = 1$ in the first two stages and $s_K = 1 - zeta$ in the third.
    At a nonzero test gradient $beta = a \/ \| "grad" h \|$. Test with $psi =
    C_2 \( r^(- gamma) - R^(- gamma) \)$. Since the test axis is radial, the end metric estimates give,
    uniformly for $0 < chi lt.eq 1$,
  $ frac("tr"_(A_chi) "Hess" psi, \| "grad" psi \|) = frac(- 3 + \( gamma + 1 \) chi, r) +
    O \( r^(- 1 - q) \) lt.eq - c_1 / r \, wide c_1 = \( 2 - gamma \) \/ 2 > 0 \, $
  after fixing $r_0$ sufficiently large. In addition, maximality gives
  #[#set math.equation(numbering: n => "(18.29)")
   $ \| "tr"_(A_chi) K \| lt.eq K_0 r^(- 1 - q) min \( 1 \, \( 1 + N \/ 3 \) a^2 \) .
     $ <four:maximal:def:K-trace-estimate>]
  Indeed $"tr"_(A_chi) K = \( chi - 1 \) K \( e_f \, e_f \)$ and $1 - chi = \( 3 + p \) v \/ \( 3 + p v \) lt.eq
    min \( 1 \, \( 1 + N \/ 3 \) v \)$. These estimates hold for every value of $t$.
  Put $c_gamma = 1 - 2^(- gamma)$ and $H_0 = max \( \| b_(*) \| \, parallel C parallel_oo \)$.
    Choose the fixed coefficient $C_2$ so that
  $ C_2 gt.eq max {1 \, frac(2 H_0 r_0^gamma, c_gamma) \, frac(2 K_0 r_0^(gamma - 1 - q), c_gamma)} . $
  For $R gt.eq 2 r_0$, this dominates the heights at $r = r_0$.
    On $r lt.eq R \/ 2$, the tensor term in (18.29) is at most $psi \/ 2$, since $gamma < 1 + q$.
    On $r gt.eq R \/ 2$, use $min \( 1 \, \( 1 + N \/ 3 \) a^2 \) lt.eq sqrt(1 + N \/ 3) thin a$ and require
  $ R gt.eq 2 (frac(2 K_0 sqrt(1 + N \/ 3), c_1))^(1 \/ q) . $
  The tensor error is then at most $c_1 a \/ \( 2 r \)$.
  If $h - psi$ had a positive maximum, it would occur in the interior of this annulus.
    The gradients there agree and the Hessian of $h$ is no larger than the Hessian of $psi$.
    The coefficients use the actual $Z$ and this common gradient,
    so they agree at the contact regardless of the two heights.
    On the first half of the annulus the equation gives $h lt.eq - c_1 a \/ r + psi \/ 2 < psi$;
    on the second half it gives $h lt.eq - c_1 a \/ \( 2 r \) < 0$. Both are contradictions.
    At a negative minimum of $h + psi$ the Hessian inequality reverses,
    while its axis and $chi$ are unchanged on reversing the gradient;
    the same estimates give the lower comparison. This proves the height bound in (18.27).
  Because $h = 0$ at $S_R$, the two comparisons bound its normal derivative there by $C_3 R^(- 1 - gamma)$,
    with $C_3 = 2 C_2 gamma$ after increasing $r_0$ so that $\| d r \| lt.eq 2$.
    Tangential derivatives vanish, giving the asserted bound for $\| "grad" f \|$.
    Finally, at $S_R$ the strictly increasing function $G \( t \) = t + 1 /
    6 log \( 1 + l \( t \)^2 sigma^2 \)$ has $G \( t \) = Z = 0$.
    Since $l \( - epsilon.alt \) = ell$, its root exceeds $- epsilon.alt$ whenever $ell^2 sigma^2 <
    e^(6 epsilon.alt) - 1$. It suffices to require
  #[#set math.equation(numbering: n => "(18.30)")
   $ R^(2 gamma + 2) > frac(C_3^2 e^(epsilon.alt N), e^(6 epsilon.alt) - 1) . $ <four:maximal:def:outer-radius-floor>]
  In stage four the conclusion follows instead from $f = 0$ and $Z = 0$ on $S_R$.
    Every restriction on $R$ made here depends only on the fixed data, $N \, epsilon.alt$,
    and is compatible with $R arrow.r oo$ at fixed $N$. ◻
]

=== 18.3 Exclusion of the lower boundary of the admissible range <exclusion-of-the-lower-boundary-of-the-admissible-range>

The next argument concerns any smooth homotopy solution whose minimum value of $t$ is $- epsilon.alt$.
  It supplies the strict exclusion needed for continuation before any global gradient or Hessian estimate is available.

#thm([Lemma 18.5.])[
  (Gauss comparison at a minimum).  #emph[At an interior minimum of $t$,
#[#set math.equation(numbering: n => "(18.31)")
 $ 1 / 2 e^(2 t) R_(hat(g)) lt.eq 1 / 2 R_g - v "Ric"_g \( e_f \, e_f \) + cal(S) \( H^f \) \,
   $ <four:maximal:def:graph-gauss>]

 where, for a symmetric tensor $A$,
#[#set math.equation(numbering: n => "(18.32)")
 $ cal(S) \( A \) = 1 / 3 \( "tr"_perp A \)^2 - 1 / 2 \| A_perp^0 \|^2 + d A_(e e) "tr"_perp A -
   d \| A_(e perp) \|^2 . $ <four:maximal:def:gauss-form>]

 At every point where $d t = 0$, there is an absolute $c_2 > 0$ such that
#[#set math.equation(numbering: n => "(18.33)")
 $ cal(T) - cal(S) \( H^f \) gt.eq c_2 cal(T) - Pi_N #scale(x: 120%, y: 120%)[\(] v F^2 + \| K \|^2
   #scale(x: 120%, y: 120%)[\)] . $ <four:maximal:def:floor-comparison>]

 At $d f = 0$ the terms multiplied by $v$ vanish and any axis may be used.]
] <four:maximal:def:gauss-minimum>

#proof[
  Lemma 52, with $e = e_f$, uses exactly (18.32). At a minimum $"Hess" t gt.eq 0$,
    so its stationary Gauss identity gives (18.31).
  The two algebraic identities used by its floor estimate specialize to
  #[#set math.equation(numbering: n => "(18.34)")
   $ cal(T) - cal(S) \( S_f \) =  & \| T^0 \|^2 + \( 1 + d \) \| M \|^2\
 & + chi \( 1 + d - 2 chi \/ 3 \) j^2 + \( chi \/ 3 - d \) F j + F^2 \/ 3 $ <four:maximal:def:gauss-difference>]
  and
  #[#set math.equation(numbering: n => "(18.35)")
   $ d^2 / chi = frac(d \( 3 + p v \), 3) lt.eq frac(N + 3, 3) . $ <four:maximal:def:d-chi-ratio>]
  They are (10.34) and the first ratio in (10.35). The common proof splits at $\( 1 + p \) v$ small,
    uses stationary coercivity, and replaces $S_f$ by $H^f = S_f - K$.
    It yields an absolute positive $c_2$ and a polynomial $Pi_N$ in precisely (18.33),
    including the smooth extension to $d f = 0$. ◻
]

#thm([Lemma 18.6.])[
  (Coefficient derivatives).  #emph[The following estimates hold along every smooth trace solution:
#[#set math.equation(numbering: n => "(18.36)")
 $ \| nabla w \| + \| nabla A_chi \| + \| d log u \|_(A_chi) lt.eq
   Pi_N \( sqrt(cal(T)) + \| K \| \) . $ <four:maximal:def:derivative-bounds>]

 Consequently, for each fixed $eta_1 > 0$,
#[#set math.equation(numbering: n => "(18.37)")
 $ frac(\| "div" \( u A_chi K \( w \, dot.op \) \) \|, u) lt.eq eta_1 cal(T) +
   Pi_N #scale(x: 120%, y: 120%)[\(] \| K \|^2 + a \| nabla K \| #scale(x: 120%, y: 120%)[\)] .
   $ <four:maximal:def:drift-divergence>]

 In each of the first three trace stages,
#[#set math.equation(numbering: n => "(18.38)")
 $ w \( F \) gt.eq eta_N a sigma - eta_1 cal(T) - Pi_N #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(cal(K)) + \|
   K \|^2 + a \| nabla K \| #scale(x: 120%, y: 120%)[\)] \, $ <four:maximal:def:F-derivative>]

 where $cal(K)$ is a fixed compact enlargement of the supports of $C \, D_0 \, D_1$.
   For fixed $eta_1$ the bounds remain polynomial in $N$.]
] <four:maximal:def:coefficient-lemma>

#proof[
  Differentiating $w = l "grad" f \/ sqrt(D)$ covariantly gives
  #[#set math.equation(numbering: n => "(18.39)")
   $ nabla_i w = A_d \( H_(i dot.op)^f \) + p d thin w thin partial_i t \, wide d log u = \( p + p v + 2 \) d t +
     H^f \( w \, dot.op \) . $ <four:maximal:def:w-derivative-exact>]
  In the first formula, $d$ is the scalar $D^(- 1)$. Relative to the axis,
    the $A_d$ factor multiplies the axial output of $H^f$ by $d$.
    The transverse and mixed entries are controlled by (18.12);
    the possibly large axial entry occurs as $d \( j - K_(e e) \)$ and is also controlled because $d lt.eq
    sqrt(d)$. Furthermore $d \| d t \| lt.eq \| d t \|_(A_d)$.
    This proves the estimate for $nabla w$ without an inverse power of $l$ or $d$.
    For the second formula use $chi lt.eq d$: the weighted norm of its first term is at most $\( 2 N + 2 \) \| d
    t \|_(A_d)$, while its last term is bounded by $a \( \| M - K_(e perp) \| + sqrt(chi) thin \| j - K_(e e) \| \)$.
  Write $A_chi = "Id" - c \( p \, v \) w ⊗ w$, where $c \( p \, v \) = \( 3 + p \) \/ \( 3 + p v \)$.
    The relevant derivatives are
  $ partial_p c = frac(3 d, \( 3 + p v \)^2) \, wide partial_v c = - frac(p \( 3 + p \), \( 3 + p v \)^2) \,
    wide \| nabla v \| lt.eq 2 a \| nabla w \| . $
  The $p'$ contribution retains its factor $d$, and is bounded by a polynomial times $d \| d t \|$.
    All other terms are bounded by a polynomial times $\| nabla w \|$. This proves (18.36).
  In (18.37), differentiating $u$ contributes at most
  $ \| d log u \|_(A_chi) \| K \( w \, dot.op \) \|_(A_chi) . $
  The other derivatives contribute at most
  $ \| K \| \( \| nabla A_chi \| + \| nabla w \| \) + a \| nabla K \| . $
  Apply (18.36) and then Young’s inequality to $Pi_N \| K \| √ cal(T)$.
    Squaring a polynomial remains polynomial, proving (18.37) with the asserted dependence.
  For (18.38), the common height term gives exactly $w \( h \) = eta_N a sigma$.
    Derivatives of $C \, D_0 \, D_1$ cost, on $cal(K)$, a fixed multiple of $1 + \| nabla w \|$,
    hence an arbitrarily small fixed multiple of $cal(T)$ plus a polynomial compact error and $Pi_N \| K \|^2$.
    The only other term is $w \( "tr"_(A_chi) K \)$ in stage three;
    it is bounded in absolute value by a fixed multiple of $a \| nabla K \| + a \| K \| \| nabla A_chi \|$,
    handled in the same way. All stage parameters lie in $\[ 0 \, 1 \]$, so the estimates are uniform in them.
    This proves the last assertion. ◻
]

#thm([Proposition 18.7.])[
  (Floor exclusion).  #emph[There is a choice $0 < delta_0 < 1 \/
    4$ independent of $N$ and a positive polynomial $C_N$ such that, for every sufficiently large allowed $R$,
    no smooth solution of any of the four homotopy stages has
$ min_(overline(Omega_R)) t = - epsilon.alt . $

 These choices use the fixed data and the preceding pointwise and height estimates only.
   In particular they do not use existence, an upper bound for $Z$, or a uniform Hessian estimate.]
] <four:maximal:prop:floor>

#proof[
  We first record all end losses that will occur. There is a fixed constant $C_(*)$ with
  #[#set math.equation(numbering: n => "(18.40)")
   $ upright(bold(1))_(cal(K)) + \| K \|^2 + v F^2 + v \| "Ric"_g \| + a \| nabla K \| lt.eq
     C_(*) \( rho_0 + v rho_1 \) . $ <four:maximal:def:floor-weight-domination>]
  On a fixed compact set this follows from positivity of $rho_0$ and Lemma 78.
    Outside that set, $\| F \| lt.eq \| h \| + \| K \|$ in all three trace stages,
    and the same lemma controls $h^2$ by a fixed multiple of $r^(- 2 gamma)$.
    The metric and tensor decay give $\| "Ric"_g \| = O \( r^(- 2 - q) \)$, $\| K \|^2 =
    O \( r^(- 2 - 2 q) \)$ and $\| nabla K \| = O \( r^(- 2 - q) \)$.
    Since $2 gamma < 2 + q$ and $2 + 2 q > 4 + delta$, the curvature and squared tensor terms have the stated
    bounds. For the derivative term the precise estimate is
  $ a r^(- 2 - q) lt.eq 1 / 2 a^2 r^(- 2 gamma) + 1 / 2 r^(- 4 - 2 q + 2 gamma) lt.eq 1 / 2 v rho_1 + 1 / 2 rho_0 \, $
  where $2 \( q - gamma \) > delta$ was used. This proves (18.40).
    Also $rho lt.eq C_rho rho_0$ for a fixed $C_rho$, by its prescribed tail and compact positivity of $rho_0$.
  Suppose first that the minimum occurs in the interior in one of the first three stages.
    Then $d t = 0$ and $"Hess" t gt.eq 0$ there. Proposition 75 and (18.31) imply, using $"tr" K = 0$,
  $ u^(- 1) "div" V gt.eq mu - 1 / 2 R_g + J \( w \) + v "Ric"_g \( e_f \, e_f \) + cal(T) - cal(S) \( H^f \) +
    w \( F \) . $
  Here $mu - R_g \/ 2 = - \| K \|^2 \/ 2$ and $\| J \( w \) \| lt.eq C_(*) a \| nabla K \|$.
    Use (18.33), (18.38), and (18.40); then pass from $V$ to $V_lambda =
    V - \( 1 - lambda \) u A_chi K \( w \, dot.op \)$ by (18.37).
    Choose the two fixed Young errors smaller than $c_2 \/ 4$.
    This yields an absolute $c_3 > 0$ and a polynomial bound $Pi_N^(upright(f))$ such that at the proposed minimum
  #[#set math.equation(numbering: n => "(18.41)")
   $ u^(- 1) "div" V_lambda gt.eq c_3 cal(T) + eta_N a sigma -
     Pi_N^(upright(f)) \( rho_0 + v rho_1 \) . $ <four:maximal:def:floor-divergence>]
  In particular $c_3$ is independent of $N$.
  Fix $delta_0 < min \( c_3 \/ 2 \, 1 \/ 4 \)$. At the floor $m_0 = 1$,
    and the prescribed right side in the first three stages is $delta_0 cal(T) + rho + delta_0 eta_N a sigma -
    C_N \( rho_0 + v rho_1 \)$. The lower bound in (18.41) exceeds it by at least
  $ \( c_3 - delta_0 \) cal(T) + \( 1 - delta_0 \) eta_N a
    sigma + \( C_N - Pi_N^(upright(f)) \) \( rho_0 + v rho_1 \) - rho . $
  Choose $C_N gt.eq Pi_N^(upright(f)) + C_rho + 1$. The last display is strictly positive because $rho_0 > 0$,
    contradicting the equation. This choice is polynomial and independent of $R$ and of the solution.
  In stage four use (18.26). At an interior floor minimum the left side is $u^(- 1) "div" \( 3 u "grad" t \) =
    3 Delta t gt.eq 0$, while the right side is
  $ eta #scale(x: 120%, y: 120%)[\(] delta_0 \| K \|^2 \/ 2 + rho - C_N rho_0 #scale(x: 120%, y: 120%)[\)] . $
  Increasing $C_N$ by a fixed constant makes the bracket strictly negative everywhere, since $\| K \|^2 lt.eq
    C_(*) rho_0$. Thus an interior floor minimum is impossible whenever $eta > 0$.
  An inner boundary minimum in the first three stages is also impossible.
    At $t = - epsilon.alt$ we have $j_0 = 0$. Since $V_lambda = V - \( 1 - lambda \) u A_chi K \( w \, dot.op \)$,
    the drift correction in (18.22) cancels, leaving $V_nu \/ u = cal(B)$. Lemma 77 therefore gives
  $ 3 partial_nu t = - H - N_B < 0 . $
  This contradicts the nonnegative derivative into $Omega_R$ required at a boundary minimum.
    In stage four, where $f = 0$, the corresponding formula is $3 partial_nu t =
    eta \( - H - N_B \) < 0$ for $eta > 0$. The outer boundary is excluded by Lemma 78.
  It remains to consider $eta = 0$. The last-stage equation and boundary conditions then reduce to
  $ "div" \( 3 L_0 \( Z \) "grad" Z \) = 0 \, wide partial_nu Z \|_B = 0 \, wide Z \|_(S_R) = 0 . $
  Multiplying by $Z$ and integrating gives $integral_(Omega_R) 3 L_0 \( Z \) \| "grad" Z \|^2 thin upright(d)
    V_g = 0$. Thus $Z = t = 0$, which is strictly above the floor.
    This treats every stage and every possible location of a floor minimum. ◻
]

The order of the choices is now fixed: strict background data and collars, $epsilon.alt$ and the cutoffs,
  the absolute small $delta_0$, the polynomial $C_N$, and finally sufficiently large $N$ and allowed $R$.
  The estimates in the next Section concern arbitrary smooth admissible solutions with $t gt.eq - epsilon.alt$.
  Proposition 81 separately ensures that a homotopy solution cannot meet the boundary of this range.

== 19 Global a priori bounds <four:maximal:sec:bounds>

Throughout this section the strict background data, collars, and $epsilon.alt > 0$ are fixed.
  We consider arbitrary smooth solutions of the homotopy on $Omega_R$ satisfying $t gt.eq - epsilon.alt$.
  Existence is not assumed: each assertion is an estimate for every solution that might occur.
  The constants denoted by $Pi_N$ are bounded by a polynomial in $N$, independently of the solution,
  homotopy parameter, and allowed radius. Constants denoted by $C \( N \)$ may depend arbitrarily on the fixed
  integer $N$. All integrals without an indicated graph measure use $g$.

=== 19.1 Separation from the threshold region <separation-from-the-threshold-region>

#thm([Lemma 19.1.])[
  (Compact separation).  #emph[Let $Q_0$ be a compact subset of $overline(Omega)$ disjoint from $cal(D)_c$.
    There are $eta_2 > 0$, $N_0$, and allowed radii $R_min \( N \) arrow.r oo$ such that, in stages 1 and 2,
#[#set math.equation(numbering: n => "(19.1)")
 $ h gt.eq c + eta_2 quad upright("on ") Q_0 wide \( N gt.eq N_0 \, med R gt.eq R_min \( N \) \) .
   $ <four:maximal:bounds:separation>]

 The constants are uniform over both stages.]
] <four:maximal:lem:separation>

#proof[
  We first identify the geometric inequality satisfied by a relaxed limit.
    Take any sequence of admissible solutions with $N_i arrow.r oo$ and allowed $R_i arrow.r oo$, and write
  $ underline(h) \( x \) = lim_(j arrow.r oo) inf { h_i \( y \) : i gt.eq j \, med "dist" \( x \, y \) < j^(- 1) } . $
  On compact sets this is a finite lower semicontinuous function, by Lemma 78.
    Let a smooth function $phi.alt$ touch $underline(h)$ from below at an interior point $x$,
    with $"grad" phi.alt \( x \) eq.not 0$. Subtracting a small multiple of the fourth power of the distance makes
    the contact strict without changing its two-jet. Minimization on a small closed ball then gives a subsequence
    of local lower contacts of $phi.alt$ plus constants with $h_i$, at points $x_i arrow.r x$,
    whose contact values converge to $underline(h) \( x \)$.
  At these contacts, $eta_(N_i) "grad" f_i = "grad" phi.alt$, so
  $ l_i sigma_i gt.eq ell_i / eta_(N_i) \| "grad" phi.alt \( x_i \) \| arrow.r oo \, wide d_i \, chi_i arrow.r
    0 \, quad a_i arrow.r 1 . $
  In particular this conclusion uses the floor and the fixed test gradient,
    rather than an estimate for the solution gradients. Put $nu_phi.alt = "grad" phi.alt \/ \| "grad" phi.alt \|$.
    Positivity of $A_chi$ and the Hessian inequality at a lower contact give
  $ "tr"_(A_(chi_i)) K + frac(a_i, \| "grad" phi.alt \|) "tr"_(A_(chi_i)) "Hess" phi.alt lt.eq F_i lt.eq h_i . $
  The last inequality holds throughout stages 1 and 2 because $C lt.eq 0$ and $D_0 lt.eq 0$. Passing to the limit proves
  #[#set math.equation(numbering: n => "(19.2)")
   $ frac("tr"_(nu_phi.alt^perp) "Hess" phi.alt, \| "grad" phi.alt \|) + "tr"_(nu_phi.alt^perp) K lt.eq
     underline(h) \( x \) . $ <four:maximal:bounds:lower-test>]
  The left side is the outward expansion of the regular level of $phi.alt$.
    Neither convergence of the homotopy parameters nor continuity bounds for the solution coefficients were needed.
  Fix $c < k < k' < 0$. Apply Lemma 21 on $U = "int" Omega$ with $u = underline(h)$, $Q = K$ and $q_0 = k'$.
    The relaxed limit is finite and lower semicontinuous. At a nonzero-gradient lower test whose contact value is
    less than $k'$, (19.2) bounds its expansion by that value, hence by $k'$.
    The lemma therefore shows that every smooth exterior support to the closed sublevel ${ underline(h) lt.eq
    k }$ at an interior frontier point has expansion at most $k'$.
    In particular, this conclusion also applies when the sublevel has a plateau at height $k$.
  Lemma 78 makes this sublevel bounded: for a large fixed $r$,
    its lower height bound exceeds the fixed negative number $k$.
    Adjoin $cal(D)_c$ to obtain a compact closed set. At a frontier point on $B$,
    each exterior support also supports $cal(D)_c$; tangency comparison with its smooth boundary gives expansion
    at most $c$. Lemma 74 therefore places the union in $cal(D)_(c')$ for every $k' < c' < 0$.
  Hausdorff right continuity at $c$ and the positive distance of $Q_0$ from $cal(D)_c$ allow us to choose $c < k <
    k' < c' < 0$ so that $cal(D)_(c') ∩ Q_0 = diameter$. If (19.1) failed, choose $N_i arrow.r oo$,
    allowed $R_i gt.eq i$, and $x_i in Q_0$ with $h_i \( x_i \) lt.eq c + i^(- 1)$.
    A subsequence has $x_i arrow.r x in Q_0$, and then $underline(h) \( x \) lt.eq c < k$,
    contradicting that containment. This also proves uniformity over the two stages.
    Enlarging the allowed radius function never invalidates the assertion. ◻
]

=== 19.2 Collar barriers and polynomial trace estimates <collar-barriers-and-polynomial-trace-estimates>

#thm([Lemma 19.2.])[
  (Inner collar slopes).  #emph[For all sufficiently large $N$ and allowed $R$,
    there are fixed constants $0 < c_5 < C_6$ such that
#[#set math.equation(numbering: n => "(19.3)")
 $ c_5 / eta_N lt.eq partial_nu f lt.eq C_6 / eta_N quad upright("in stages 1 and 2") \,
   wide \| partial_nu f \| lt.eq C_6 / eta_N quad upright("in stage 3") . $ <four:maximal:bounds:collar-slopes>]

 Here $nu$ points into $Omega$. In stage 4, $f = 0$.]
] <four:maximal:lem:collar-slopes>

#proof[
  Use a fixed short collar $0 lt.eq s lt.eq s_0$ from Lemma 73, with $C = - kappa s$, $nu_s =
    "grad" s \/ \| thin upright(d) s \|$, and $0 < c_s lt.eq \| thin upright(d) s \| lt.eq C_s$.
    All its geometric derivatives are bounded, and $P_s + H_s gt.eq c$, where $P_s =
    "tr"_({ s = upright("constant") }) K$. The finitely many outer collar faces satisfy Lemma 82.
  For a positive-slope test $h_0 = c + psi \( s \)$, the trace operator,
    with $t$ computed from the solution’s $Z$ and the common contact gradient, is exactly
  #[#set math.equation(numbering: n => "(19.4)")
   $ P_s + a H_s + chi K \( nu_s \, nu_s \) +
     a chi (frac("Hess" s \( nu_s \, nu_s \), \| thin upright(d) s \|) + \| thin upright(d) s \| psi'' / psi') .
     $ <four:maximal:bounds:collar-operator>]
  For a test with negative slope, replace $a$ by $- a$ in this formula.
    If $\| psi' \|$ lies between fixed positive constants, the floor gives
  #[#set math.equation(numbering: n => "(19.5)")
   $ d lt.eq C \( eta_N \/ ell \)^2 = C e^(- epsilon.alt N) \, wide 1 - a lt.eq d \, wide frac(N chi, d) =
     frac(3 N, 3 + p v) gt.eq frac(3 N, 3 + N) . $ <four:maximal:bounds:steep-coefficients>]
  Thus $a gt.eq 1 \/ 2$ and $N chi gt.eq c_4 d$ for large $N$.
  Choose a fixed smooth $theta.alt_1 : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ equal to one on $\[ 0 \, 1 \]$ and zero
    on $\[ 2 \, oo \)$, and put $b_N \( s \) = Lambda_(*) N theta.alt_1 \( N s \)$,
    where $Lambda_(*) > 0$ is a fixed collar constant, independent of $N$.
    The constant will be chosen large; its crucial property is
  $ 0 lt.eq integral_0^(s_0) b_N \( s \) thin upright(d) s lt.eq 2 Lambda_(*) . $
  For the lower barrier in stages 1 and 2, prescribe $psi' \( s \) =
    q_(-) exp \( integral_0^s b_N \)$ and $psi \( 0 \) = 0$. For the chosen value of $Lambda_(*)$,
    take $q_(-) > 0$ so small that $psi' lt.eq kappa \/ 2$ and $psi \( s_0 \) < eta_2$.
    Positive normal direction makes $D_0 = 0$. Subtracting the prescribed trace right side from (19.4) gives a
    residual at least
  #[#set math.equation(numbering: n => "(19.6)")
   $ kappa s \/ 2 - C d + a chi \| thin upright(d) s \| b_N \( s \) . $ <four:maximal:bounds:lower-residual>]
  The constant $C$ in this residual depends only on collar geometry.
    We choose $Lambda_(*)$ so large that the last term dominates $2 C d$ on $\[ 0 \, 1 \/ N \]$.
    On $\[ 1 \/ N \, s_0 \]$, the first term dominates $C d$ for large $N$, because $N e^(- epsilon.alt N) arrow.r
    0$, and the last term has a favorable sign. This is a strict lower barrier.
    Its outer value is below $h$ by separation and its inner value agrees with $h$.
  For the upper barrier take $psi' \( s \) = q_(+) exp \( - integral_0^s b_N \)$.
    Choose its fixed minimum slope larger than twice the bounded linear variation of $P_s + H_s - c + kappa s$,
    and choose $q_(+)$ still larger if needed to dominate the height bound at $s_0$.
    The residual is now at most $- c_7 s + C d - a chi \| thin upright(d) s \| b_N$, for fixed $c_7 > 0$.
    The same two intervals prove strict negativity. The bounded integral of $b_N$ leaves all lower and upper test
    slopes between fixed positive constants, independently of $N$.
  For completeness, at an interior positive maximum of $h_0 - h$,
    the test Hessian is at most the solution Hessian, whereas its height is larger.
    The positive principal matrix and the strictly increasing dependence of $F$ on $h$ contradict a positive test
    residual. This proves lower comparison; reversing the difference proves upper comparison.
    In both comparisons $Z$ and the gradient are the same at contact,
    so all coefficients other than the height agree. Taking inward derivatives at $s =
    0$ gives the first assertion of (19.3).
  In stage 3 the face height is $b_zeta = \( 1 - zeta \) c$.
    Use $b_zeta plus.minus psi \( s \)$ with fixed large positive slopes and $psi'' \/ psi' = - b_N$.
    At $s = 0$ the two unit-direction inequalities in (18.25) say that the positive-slope residual is nonpositive
    and the negative-slope residual is nonnegative. Replacing $plus.minus nu_s$ by $plus.minus a
    nu_s$ costs $O \( d \)$, including the term $chi K \( nu_s \, nu_s \)$;
    moving to distance $s$ costs $O \( s \)$, uniformly in $zeta$.
    The change of height then supplies a strict linear margin, with the desired sign,
    when the minimum test slope exceeds the fixed spatial error constant.
    The term involving $b_N$ has the correct sign for both tests and dominates the $O \( d \)$ error on
    $\[ 0 \, 1 \/ N \]$. On the remainder the linear margin dominates it. The height bound handles $s = s_0$.
    These two comparisons bound the slope in absolute value in stage 3.
    The terminal trace equation has $f = 0$, as established in Section 18. ◻
]

#thm([Lemma 19.3.])[
  (Weighted trace and boundary flux).  #emph[Let $cal(C)$ be a fixed union of collars.
    In stages 1 and 2, every nonnegative $C^1$ function $phi$ satisfies
#[#set math.equation(numbering: n => "(19.7)")
 $ integral_B L_0 phi & lt.eq Pi_N integral_(cal(C)) u #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \)
   phi + \| thin upright(d) phi \|_(A_chi) #scale(x: 120%, y: 120%)[\)] \,\
integral_B phi & lt.eq Pi_N integral_(cal(C)) sqrt(D) #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) phi + \|
  thin upright(d) phi \|_(A_chi) #scale(x: 120%, y: 120%)[\)] . $ <four:maximal:bounds:trace-weighted>]

 The integrands vanish outside the support of $phi$ and its derivative;
   thus both statements localize to any base patch. Moreover
#[#set math.equation(numbering: n => "(19.8)")
 $ \| \( V_lambda \)_nu \| lt.eq C_7 u d = C_7 L_0 sqrt(d) lt.eq
   C_8 \( eta_N \/ ell \) L_0 . $ <four:maximal:bounds:boundary-flux>]

 Consequently,
#[#set math.equation(numbering: n => "(19.9)")
 $ integral_B \| \( V_lambda \)_nu \| lt.eq Pi_N eta_N / ell integral_(cal(C)) u \( rho + delta_0 cal(T) \) .
   $ <four:maximal:bounds:boundary-absorption>]

 All constants in these assertions have the stated polynomial control.]
] <four:maximal:lem:weighted-trace>

#proof[
  Set $W = l "grad"_(macron(g)) f = sqrt(d) thin w$. For each covector $xi$,
  $ \| xi \( W \) \| lt.eq \| xi \|_(A_d) lt.eq sqrt(\( 3 + N \) \/ 3) thin \| xi \|_(A_chi) \, wide u W = L_0 w . $
  The second inequality follows from $d \/ chi = \( 3 + p v \) \/ 3$.
    Lemma 83 gives $w dot.op nu = a gt.eq 1 \/ 2$ on $B$. Direct differentiation yields
  $ "div" w & = "tr"_(A_d) H^f + d p thin w \( t \) \,\
u^(- 1) "div" \( u W \) & = sqrt(d) #scale(x: 120%, y: 120%)[\(] "tr"_(A_d) H^f + \( d p + p + 2 \) w \( t \)
  #scale(x: 120%, y: 120%)[\)] \,\
D^(- 1 \/ 2) "div" \( sqrt(D) W \) & = sqrt(d) #scale(x: 120%, y: 120%)[\(] "tr"_(A_d) H^f +
  d p thin w \( t \) #scale(x: 120%, y: 120%)[\)] . $
  These last two expressions have absolute value at most $Pi_N \( 1 + sqrt(cal(T)) \)$ on the collars.
    Indeed the axial tensor term is $d^(3 \/ 2) H_(e e)^f$, controlled by the $d j^2$ term of Lemma 76,
    and $sqrt(d) thin \| w \( t \) \| lt.eq \| thin upright(d) t \|_(A_d)$;
    all background $K$ terms are bounded there. No inverse power of $l$ has occurred.
  Take a fixed collar cutoff $eta$, equal to one near $B$ and zero near the outer collar faces.
    Apply the divergence theorem to $eta phi u W$. The domain’s outward normal on $B$ is $- nu$,
    so the boundary integral is $- integral_B L_0 a phi$. Taking absolute values of the three interior terms,
    and using $a gt.eq 1 \/ 2$, proves (19.7). The derivative of $eta$ costs only a fixed multiple of $phi$.
    Using $sqrt(D) W = w$ instead proves (19.7). The same computation proves the asserted localization.
  On $B$, positive slope gives $w_nu = a$, $D_0 = 0$, and $F = c = P_B + H$.
    Thus the expression inside the boundary multiplier of the homotopy is
  $ \( a - 1 \) H - N_B d - \( 1 - lambda \) chi a K \( nu \, nu \) . $
  The multiplier lies in $\[ 0 \, 1 \]$, and $1 - a lt.eq d$, $chi lt.eq d$.
    This proves the first inequality in (19.8). The lower collar slope gives $sqrt(d)
    lt.eq \( l \| partial_nu f \| \)^(- 1) lt.eq C eta_N \/ ell$, proving the rest.
    Finally apply (19.7) with $phi = 1$. On the fixed collars, $rho$ has a positive minimum, so $1 +
    sqrt(cal(T)) lt.eq C \( rho + delta_0 cal(T) \)$ with fixed $C$. This proves (19.9). ◻
]

=== 19.3 The global high-level energy bound <the-global-high-level-energy-bound>

The collar estimates have already made the inner flux small with polynomial constants.
  We now obtain a bounded range for the conformal variable at each fixed parameter. That is a separate task:
  its constants may be arbitrary at fixed parameter because the mass estimate will return to the earlier collar bounds.

We now allow arbitrary constants $C \( N \)$. At sufficiently high levels $Z > Z_0 \( N \) > 0$,
  the unscaled source satisfies

#[#set math.equation(numbering: n => "(19.10)")
 $ Xi gt.eq delta_0 cal(T) + rho + 1 / 2 delta_0 eta_N a sigma . $ <four:maximal:bounds:high-source>]

To see this, $cal(P)$ is bounded at fixed $N$, and on the admissible support of $m_0$ we have $- epsilon.alt lt.eq
  t lt.eq - epsilon.alt + 1 \/ N$. There $D = e^(6 \( Z - t \))$ and $eta_N a
  sigma = \( eta_N \/ l \) \( sqrt(D) - D^(- 1 \/ 2) \)$ tends uniformly to infinity as $Z arrow.r oo$.
  Outside this band the penalty vanishes. On the full range we also have $Xi gt.eq delta_0 cal(T) - C \( N \)$.

Only stage 1 requires an energy argument to handle its nonzero drift.
  Choose a smooth nondecreasing $k_0$ which is zero below $Z_0$, one above $Z_0 + 1$, and has bounded derivative.
  Testing the divergence equation with $k_0 \( Z \)$, whose outer trace is zero, gives

$ integral_(Omega_R) u k_0 Xi + 3 integral_(Omega_R) u k'_0 \| thin upright(d) Z \|_(A_chi)^2 = -
  integral_B k_0 \( V_lambda \)_nu - lambda integral_(Omega_R) u k'_0 chevron.l K \( w \, dot.op \) \,
  thin upright(d) Z chevron.r_(A_chi) . $

Young’s inequality absorbs half the gradient term and leaves $C integral u k'_0 \| K \|^2$.
  This is at most $C \( N \)$: on the derivative strip,

$ u = l e^(3 Z - t) lt.eq e^(1 + 3 \( Z_0 + 1 \) + epsilon.alt) \, $

and $\| K \|^2$ is integrable since $q > 1$. By (19.8) and (19.7), the boundary cost is at most

$ Pi_N eta_N / ell integral_(cal(C)) u #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) k_0 +
  k'_0 \| thin upright(d) Z \|_(A_chi) #scale(x: 120%, y: 120%)[\)] . $

The first term is absorbed by a fixed fraction of $integral u k_0 \( delta_0 cal(T) + rho \)$ for large $N$,
  because $Pi_N eta_N \/ ell arrow.r 0$. Young’s inequality absorbs the second term into $integral u k'_0 \| thin
  upright(d) Z \|_(A_chi)^2$ and a bounded derivative-strip integral over $cal(C)$. We obtain

#[#set math.equation(numbering: n => "(19.11)")
 $ integral_(Omega_R) u #scale(x: 120%, y: 120%)[\[] k_0 \( cal(T) + rho + eta_N a sigma \) +
   k'_0 \| thin upright(d) Z \|_(A_chi)^2 #scale(x: 120%, y: 120%)[\]] lt.eq
   C \( N \) . $ <four:maximal:bounds:global-energy>]

This is uniform in $R$ and in the stage 1 parameter.

Let $Gamma$ denote the ordinary graph of $f$ in $\( Omega \, g \) times bb(R)$ with product metric $g +
  thin upright(d) b^2$. This is a four-dimensional graph. Its measure and gradient satisfy, at fixed $N$,

#[#set math.equation(numbering: n => "(19.12)")
 $ thin upright(d) Gamma asymp_N sqrt(D) thin upright(d) V_g \,
   wide \| "grad"_Gamma phi.alt \| asymp_N \| thin upright(d) phi.alt \|_(A_chi) .
   $ <four:maximal:bounds:graph-comparison>]

These comparisons use only $ell lt.eq l lt.eq e$ and $3 d \/ \( 3 + N \) lt.eq chi lt.eq d$. Also

$ D^(1 \/ 3) lt.eq C \( N \) \( 1 + eta_N a sigma \) \, wide e^(2 Z) sqrt(D) = l^(- 1) u D^(1 \/ 3) . $

For the first inequality, put $y = l sigma$. It is immediate for $y lt.eq 1$; for $y gt.eq
  1$ use $eta_N a sigma gt.eq \( eta_N \/ \( sqrt(2) l \) \) y$ and $y^(2 \/ 3) lt.eq y$.
  On any fixed compact base set $Q$, the positive minimum of $rho$ and (19.11) control the integral of
  $u \( 1 + eta_N a sigma \)$ above $Z_0 + 1$. Below that level the floor and $D =
  e^(6 \( Z - t \))$ bound every integrand on $Q$. Consequently

#[#set math.equation(numbering: n => "(19.13)")
 $ integral_(Gamma ∩ pi^(- 1) \( Q \)) e^(2 Z) thin upright(d) Gamma lt.eq
   C \( N \, Q \) . $ <four:maximal:bounds:graph-l2>]

Here $pi$ is the graph projection. The estimate is local in the base;
  the global estimate from which it follows is (19.11).

=== 19.4 Graph Sobolev inequality and the exponential test <graph-sobolev-inequality-and-the-exponential-test>

We continue with stage 1 for the next two estimates. For a fixed compact base patch and a function $omega$
  supported over it, away from $S_R$ but possibly meeting $B$, we claim

#[#set math.equation(numbering: n => "(19.14)")
 $ parallel omega parallel_(L^4 \( thin upright(d) Gamma \))^2 lt.eq
   C \( N \) integral_Gamma #scale(x: 120%, y: 120%)[\(] \| "grad"_Gamma omega \|^2 + \( 1 + cal(T) \) omega^2
   #scale(x: 120%, y: 120%)[\)] thin upright(d) Gamma . $ <four:maximal:bounds:graph-sobolev>]

Extend a compact enlargement of the base metric smoothly to a closed manifold and use a smooth isometric Euclidean
  embedding #cite(label("Nash1956")) Theorem 2, p. 59. Its product with $bb(R)$ gives a Euclidean immersion of the
  graph. The contribution to its mean curvature from the base embedding is bounded by a fixed constant:
  it is a trace of the fixed second fundamental form on a four-dimensional tangent plane.
  The remaining product mean curvature has magnitude

$ frac(sqrt(D), l sqrt(1 + sigma^2)) lr(|"tr"_perp H^f + \( 1 + sigma^2 \)^(- 1) H_(e e)^f|) lt.eq
  C \( N \) \( 1 + sqrt(cal(T)) \) . $

Indeed the prefactor is bounded at fixed $N$, while $\( 1 + sigma^2 \)^(- 1) lt.eq
  C \( N \) d$ and the axial term is controlled by $d j^2$ in Lemma 76.

The Euclidean submanifold Sobolev inequality in dimension four gives

$ (integral_Gamma \| omega \|^4 thin upright(d) Gamma)^(3 \/ 4) lt.eq
  C \( N \) integral_Gamma #scale(x: 120%, y: 120%)[\(] \| omega \|^2 \| "grad"_Gamma
  omega \| + \( 1 + sqrt(cal(T)) \) \| omega \|^3 #scale(x: 120%, y: 120%)[\)] thin upright(d) Gamma +
  C integral_B \| omega \|^3 . $

We have applied the $L^1$ Sobolev inequality to $\| omega \|^3$;
  see Michael–Simon #cite(label("MichaelSimon1973")) and the precise rectifiable-submanifold statement in
  #cite(label("Simon2014")) Chapter 4, §5, Theorem 5.7, p. 98.
  Its hypotheses hold for this smooth multiplicity-one immersion with locally integrable mean curvature and
  compactly supported test. To justify the displayed boundary term from the interior statement,
  extend each individual smooth graph across $B$ and cut off in an exterior strip whose width tends to zero.
  The integral of the cutoff gradient tends to the boundary integral,
  while the strip’s other integrals tend to zero. This requires smoothness of each graph,
  not a uniform curvature estimate for extensions. The induced boundary metric is $g \|_B$, since $f$ is constant there.

Apply (19.7) to $\| omega \|^3$ and then (19.12). It bounds the last term by the same two interior terms.
  Each such term is at most

$ C \( N \) (integral_Gamma \| omega \|^4 thin upright(d) Gamma)^(1 \/ 2)
  (integral_Gamma \( \| "grad"_Gamma omega \|^2 + \( 1 + cal(T) \) omega^2 \) thin upright(d) Gamma)^(1 \/ 2) $

by Cauchy–Schwarz. Dividing, and squaring, proves (19.14); the case $omega = 0$ is immediate.

Next let $psi$ be a smooth compact base cutoff of the same kind.
  There is $k_(*) \( N \) gt.eq 1$ such that for every real $k gt.eq k_(*) \( N \)$,

#[#set math.equation(numbering: n => "(19.15)")
 $ integral_Gamma e^(2 k Z) psi^2 \( cal(T) + k \| "grad"_Gamma Z \|^2 \) thin upright(d) Gamma lt.eq
   C \( N \) k integral_Gamma e^(2 k Z) \( psi^2 + \| thin upright(d) psi \|_g^2 \) thin upright(d) Gamma .
   $ <four:maximal:bounds:exponential-energy>]

The constant $C \( N \)$ here is independent of $k$. To prove this,
  test the stage 1 divergence equation with $phi = psi^2 e^(2 k Z) \/ L_0$.
  Write $Q = psi^2 e^(2 k Z)$ and $b = lambda K \( w \, dot.op \)$.
  After integration, cancellation of $L_0$ gives the exact identity

$ & integral_(Omega_R) sqrt(D) thin Q #scale(x: 120%, y: 120%)[\(] Xi +
  6 k \| thin upright(d) Z \|_(A_chi)^2 #scale(x: 120%, y: 120%)[\)]\
 & = - integral_B \( V_lambda \)_nu Q \/ L_0 - integral_(Omega_R) sqrt(D) thin e^(2 k Z)
   #scale(x: 120%, y: 120%)[\[] 2 psi chevron.l 3 thin upright(d) Z + b \, thin upright(d) psi chevron.r_(A_chi) +
   2 k psi^2 chevron.l b \, thin upright(d) Z chevron.r_(A_chi) #scale(x: 120%, y: 120%)[\]]\
 & #h(1cm)  + integral_(Omega_R) sqrt(D) thin Q \( p + 2 \) chevron.l 3 thin upright(d) Z + b \,
   thin upright(d) t chevron.r_(A_chi) . $

Use $Xi gt.eq delta_0 cal(T) - C \( N \)$, $\| b \|_(A_chi) lt.eq \| K \|$, and Lemma 76. For example,

$ \( p + 2 \) \| thin upright(d) t \|_(A_chi) \( \| thin upright(d) Z \|_(A_chi) + \| K \| \) lt.eq delta_0 /
  8 cal(T) + C \( N \) \( \| thin upright(d) Z \|_(A_chi)^2 + \| K \|^2 \) . $

Young’s inequality handles the drift and cutoff products with a fixed fraction of $k \| thin upright(d)
  Z \|_(A_chi)^2$ and a remainder bounded by $C \( N \) k e^(2 k Z) \( psi^2 + \| thin upright(d) psi \|^2 \)$.
  Choose $k_(*) \( N \)$ large enough to absorb the preceding $C \( N \) \| thin upright(d) Z \|_(A_chi)^2$ term.

By (19.8) the boundary contribution is at most $C integral_B Q$ (enlarging a fixed constant since $eta_N \/ ell
  lt.eq 1$). Applying (19.7) to $Q$ gives, only on $cal(C) ∩ "supp" psi$,

$ C \( N \) integral sqrt(D) thin e^(2 k Z) #scale(x: 120%, y: 120%)[\[] \( 1 + sqrt(cal(T)) \) psi^2 +
  2 \| psi \| \| thin upright(d) psi \| + 2 k psi^2 \| thin upright(d) Z \|_(A_chi) #scale(x: 120%, y: 120%)[\]] . $

The $sqrt(cal(T))$ and $k \| thin upright(d) Z \|_(A_chi)$ terms are absorbed by small fixed fractions of $delta_0
  psi^2 cal(T)$ and $k psi^2 \| thin upright(d) Z \|_(A_chi)^2$,
  leaving at most $C \( N \) k e^(2 k Z) \( psi^2 + \| thin upright(d) psi \|^2 \)$.
  Finally (19.12) proves (19.15). In particular, neither the trace cutoff nor differentiation of $1 \/
  L_0$ introduces a constant exponential in $k$.

=== 19.5 Moser iteration and the full range <moser-iteration-and-the-full-range>

#thm([Proposition 19.4.])[
  (Bounded variables).  #emph[For every sufficiently large fixed $N$ and all sufficiently large allowed $R$,
    every admissible smooth homotopy solution satisfies
#[#set math.equation(numbering: n => "(19.16)")
 $ \| f \| lt.eq C_0 \/ eta_N \, wide - epsilon.alt lt.eq t lt.eq Z lt.eq C \( N \) \, wide \| "grad" f \| lt.eq
   C \( N \) . $ <four:maximal:bounds:bounded-range>]

 The constants are independent of $R$, the solution, and the homotopy parameter.
   No uniform Hessian or coefficient continuity estimate is used in obtaining these bounds.]
] <four:maximal:prop:bounded-range>

#proof[
  We first finish stage 1. Apply (19.14) to $omega = psi e^(k Z)$ and then use (19.15).
    If $psi = 1$ on a smaller patch and $\| thin upright(d) psi \| lt.eq C \/ upright("gap")$,
    the resulting norm step is
  $ parallel e^Z parallel_(L^(4 k) \( upright("smaller graph") \)) lt.eq
    #scale(x: 120%, y: 120%)[\[] C \( N \) k^2 \( 1 + upright("gap")^(- 2) \)
    #scale(x: 120%, y: 120%)[\]]^(1 \/ \( 2 k \)) parallel e^Z parallel_(L^(2 k) \( upright("larger graph") \)) . $
  Choose $k_j = 2^j k_(*) \( N \)$ and geometrically decreasing gaps between fixed nested base patches.
    The logarithms of the factors sum because $sum_j \( 1 + j \) \/ 2^j < oo$.
    Writing $S \( r \) = sup_(Q_r) e^Z$ for a nested family of compact patches gives
  $ S \( r' \) lt.eq C \( N \) \( r'' - r' \)^(- A \( N \)) parallel e^Z
    parallel_(L^(2 k_(*)) \( Gamma ∩ pi^(- 1) \( Q_(r'') \) \)) . $
  Interpolation with (19.13) yields
  $ parallel e^Z parallel_(2 k_(*)) lt.eq S \( r'' \)^(1 - 1 \/ k_(*)) parallel e^Z parallel_2^(1 \/ k_(*)) . $
  If $k_(*) = 1$ this already proves the bound. Otherwise Young’s inequality gives, for every $alpha > 0$,
  $ S \( r' \) lt.eq alpha S \( r'' \) + C \( N \, alpha \) \( r'' - r' \)^(- A' \( N \)) . $
  Iterate over radii increasing geometrically to a fixed larger radius and take $alpha < 2^(- A' \( N \) - 1)$.
    The sum of the remainder terms is finite. The final term $alpha^j
    S \( r_j \)$ tends to zero for each individual smooth solution,
    since all $Q_(r_j)$ lie in a fixed compact patch. The resulting bound is independent of that individual
    supremum. Finitely many such patches prove an upper bound for $Z$ on any fixed compact base set, including $B$.
  To extend the bound along the end, use (18.37), with a fixed small coefficient:
  $ u^(- 1) \| "div" \( u A_chi K \( w \, dot.op \) \) \| lt.eq delta_0 / 4 cal(T) +
    Pi_N \( \| K \|^2 + a \| "grad" K \| \) . $
  Since $a sigma = l sigma^2 \/ sqrt(D) gt.eq e^(- 1) a^2$, Young’s inequality bounds the second term by
  $ delta_0 / 4 eta_N a sigma + C \( N \) \( \| K \|^2 + \| "grad" K \|^2 \) . $
  The last expression, apart from its favorable term, is $o \( rho \)$ on the end.
    Indeed $2 + 2 q > 4 + delta$ and $\| "grad" K \|^2 = O \( r^(- 4 - 2 q) \)$.
    Beyond a sufficiently large fixed-$N$ sphere, the high-level source (19.10) therefore implies
  $ "div" \( 3 u A_chi "grad" Z \) > 0 quad upright("where ") Z > Z_0 \( N \) . $
  At an interior maximum its left side is $3 u A_chi : "Hess" Z lt.eq 0$, a contradiction.
    The compact bound controls the inner sphere and $Z = 0$ on $S_R$. This proves the global upper bound in stage 1.
  In stages 2 and 3, $lambda = 0$. The same high-level source is strictly positive,
    so it excludes interior high maxima directly. The boundary slope bound implies
  $ Z = t + 1 / 6 log \( 1 + l^2 \| partial_nu f \|^2 \) lt.eq t + 1 / 6 log \( 1 + e^2 C_6^2 \/ eta_N^2 \) quad
    upright("on ") B . $
  Thus sufficiently high boundary $Z$ forces $t gt.eq 1$. At such points $j_0 \( t \) = 1$,
    and the boundary prescription gives zero conormal flux. The boundary point principle excludes a nonconstant
    high maximum there: in a neighborhood of the maximum the individual smooth operator is elliptic and
    $"div" \( 3 u A_chi "grad" Z \) > 0$, so its outward conormal derivative at a boundary maximum is strictly
    positive, contrary to the zero datum. This uses ellipticity only for each individual solution.
    The outer Dirichlet value is zero, so the upper bound follows uniformly through these stages.
  In stage 4, $f = 0$ and $t = Z$. For positive scaling $eta$,
    sufficiently high levels lie outside the penalty band and have source $eta \( delta_0 cal(T) + rho \) > 0$;
    the same maximum and boundary point argument applies. At zero scaling,
    multiplying the homogeneous equation by $Z$ gives $integral 3 L_0 \| thin upright(d) Z \|^2 = 0$,
    and the outer value yields $Z = 0$. These bounds are uniform even as $eta arrow.b 0$.
  Finally the height bound is Lemma 78, and $t lt.eq Z$ follows from $D gt.eq 1$. The implicit equation gives
  $ D = e^(6 \( Z - t \)) lt.eq e^(6 \( C \( N \) + epsilon.alt \)) \,
    wide \| "grad" f \|^2 = \( D - 1 \) \/ l^2 lt.eq ell^(- 2) e^(6 \( C \( N \) + epsilon.alt \)) . $
  This proves (19.16). ◻
]

#prodef([Remark 19.5.])[
  Separation, the collar slopes, and (19.7)–(19.9) were proved before introducing any arbitrary $C \( N \)$.
    The graph comparisons, Moser iteration, and subsequent regularity may have arbitrary fixed-$N$ losses.
    The final mass comparison uses the earlier weighted trace and boundary-flux inequalities directly;
    none of these later constants enters its limit as $N arrow.r oo$.
] <four:maximal:bounds:parameter-order>

== 20 Local regularity of the coupled system <four:maximal:sec:regularity>

The bounded-range estimate makes the trace equation uniformly elliptic at fixed $N$.
  The second equation still contains $\| "grad" Z \|^2$ and $\| "Hess" f \|^2$,
  so classical estimates cannot yet be applied to it. We first use Theorem 61 to control $d
  f$ and the local integral of $\| "Hess" f \|^2$. The scalar measure-source estimate of Lemma 6.2 then gives
  Hölder continuity of $Z$, including at both boundary types. These two gains start the classical bootstrap.

All constants in this section may depend arbitrarily on the fixed data and $N$.
  The earlier polynomial bounds will control the final energy error.
  In coordinate calculations $D$ denotes ordinary differentiation; the graph scalar $D = 1 +
  l^2 \| "grad" f \|^2$ retains its earlier meaning in geometric formulas.

#thm([Proposition 20.1.])[
  #emph[Fix the strict data, $epsilon.alt$, a sufficiently large $N$,
    and any of the homotopy stages of Section 18. Every smooth solution on an allowed finite truncation with $t
    gt.eq - epsilon.alt$ has uniform local bounds for every finite number of derivatives of $f$ and $Z$,
    including up to the inner and outer boundary faces. On the uniform unit patches on the end these constants are
    independent of the outer truncation radius and of the stage parameter. They may depend arbitrarily on $N$.
    In particular, on a fixed finite truncation they bound the $C^(1 \, alpha)$ norm of $Z$ for each fixed $0 <
    alpha < 1$.]
] <four:maximal:prop:classical-estimates>

#proof[
  Work on the uniform interior and boundary-normal patches of the prepared geometry.
  ===== 20.1 The axial estimate and the Hessian measure. <the-axial-estimate-and-the-hessian-measure.>
  Proposition 85 bounds $f \, Z \, t \, "grad" f$ and keeps $l \/
    sqrt(D)$ bounded above and away from zero at fixed $N$. Dividing the trace equation by this factor gives
  #[#set math.equation(numbering: n => "(20.1)")
   $ A_chi : "Hess" f = G_f \, wide G_f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] F -
     "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] \, wide \| G_f \| lt.eq C \( N \) \, quad chi gt.eq
     chi_0 \( N \) > 0 . $ <four:maximal:reg:f-normalized>]
  The geometry of each patch has the bounds required by Theorem 61, and each face value of $f$ is constant.
    Each individual solution is smooth; the theorem’s constants depend only on the bounded gradient, source,
    geometry and ellipticity. It gives a uniform Hölder bound for $"grad" f$ and
  #[#set math.equation(numbering: n => "(20.2)")
   $ integral_(B_r \( x \) ∩ Omega_R) \| "Hess" f \|^2 thin upright(d) V_g lt.eq
     C \( N \) r^(2 + 2 alpha) . $ <four:maximal:reg:f-hessian-measure>]
  Coordinate Hessians satisfy the same estimate, since their difference from covariant Hessians is bounded.
    At a face the theorem uses the $C^1$ odd graph double and controls its interface flux explicitly.
    It has no support hypothesis on $K$; the prepared tensor tail and geometry supply the uniform patch bounds
    used here.
  ===== 20.2 The scalar source and its boundary reflection. <the-scalar-source-and-its-boundary-reflection.>
  In coordinates, absorb the volume density in the second equation and write it as
  #[#set math.equation(numbering: n => "(20.3)")
   $ "div" \( cal(A) D Z + B_1 \) = E . $ <four:maximal:reg:natural-equation>]
  Here $cal(A)$ and $B_1$ are the coordinate versions of $3 u A_chi$ and $lambda u A_chi K \( w \, dot.op \)$,
    respectively, with the appropriate homotopy factors in the source.
    On the established range $cal(A)$ is bounded, symmetric and uniformly elliptic, and $B_1$ is bounded.
    The implicit relation for $t$ has derivative $1 + p v \/ 3 > 0$, so $t =
    t \( x \, Z \, D f \)$ is smooth on that range and
  #[#set math.equation(numbering: n => "(20.4)")
   $ \| D t \| lt.eq C \( N \) \( 1 + \| D Z \| + \| D^2 f \| \) . $ <four:maximal:reg:t-chain>]
  The quadratic expression for $cal(T)$, together with the bounded lower-order terms in each stage, therefore gives
  #[#set math.equation(numbering: n => "(20.5)")
   $ \| E \| lt.eq C \( N \) \( 1 + \| D Z \|^2 + \| D^2 f \|^2 \) . $ <four:maximal:reg:coupled-growth>]
  This estimate does not presume a bound for $D Z$. The prescribed inner conormal value concerns the total flux
    and is bounded on this range. The outer value of $Z$ is zero.
  To apply Lemma 6.2 at a boundary, flatten the face to $x_4 = 0$, with domain $x_4 > 0$, and write $Q =
    cal(A) D Z + B_1$. Put $R = "diag" \( 1 \, 1 \, 1 \, - 1 \)$. For $x_4 < 0$ set
  $ tilde(Z) \( x \) = s Z \( R x \) \, quad tilde(cal(A)) \( x \) = R cal(A) \( R x \) R \, quad
    tilde(B)_1 \( x \) = s R B_1 \( R x \) \, wide s in { 1 \, - 1 } . $
  Then $tilde(Q) \( x \) = s R Q \( R x \)$ below the plane.
    Its distributional divergence has reflected bulk source $s E \( R x \)$ and plane source
  #[#set math.equation(numbering: n => "(20.6)")
   $ \( 1 + s \) Q_4^(+) thin upright(d) cal(H)^3 \|_({ x_4 = 0 }) . $ <four:maximal:reg:reflection-source>]
  At the inner conormal face use $s = 1$. The added signed density is bounded because $Q_4^(+)$ is the prescribed
    total conormal flux in these coordinates. At the outer zero Dirichlet face use $s = - 1$.
    The reflected $Z$ is continuous and the normal total flux matches, so there is no plane term.
    The coefficient matrix remains measurable, symmetric and uniformly elliptic.
    Each reflected solution is continuous and smooth on its two closed sides.
    Integration on those sides gives the weak exponential product rule required by the shared lemma,
    including the full measure in (20.6).
  The absolute source on the doubled patch is consequently dominated by
  $ C \( N \) \( 1 + \| D Z \|^2 \) thin upright(d) x + mu_0 \, wide mu_0 =
    C \( N \) \| D^2 f \|^2 thin upright(d) x + 2 \| Q_4^(+) \| thin upright(d) cal(H)^3 \|_({ x_4 = 0 }) \, $
  with the bulk density reflected and the plane term omitted where absent.
    Equation (20.2) and the area of a three-dimensional plane section give, at every local center,
  $ mu_0 \( B_r \( x \) \) lt.eq C \( N \) r^(2 + beta) \, wide beta = min \( 2 alpha \, 1 \) > 0 . $
  On an interior patch only the bulk term is needed. Thus all the hypotheses of Lemma 6.2, with dimension four,
    hold. Its Hölder representative agrees with the existing continuous $Z$,
    giving a uniform Hölder bound up to either face.
  ===== 20.3 Schauder for the trace equation and the normal datum. <schauder-for-the-trace-equation-and-the-normal-datum.>
  The actual coefficients in (20.1) are smooth functions of $x \, Z \, D f$, including at $D f = 0$, since
  $ A_chi = "Id" - frac(3 + p, 3 + p v) thin w ⊗ w . $
  Its source is smooth in the same variables and in $f$. The Hölder bounds just proved therefore make them
    uniformly $C^(0 \, theta)$ for some $theta > 0$. Interior and constant Dirichlet Schauder estimates give
  #[#set math.equation(numbering: n => "(20.7)")
   $ parallel f parallel_(C^(2 \, theta) \( U' \)) lt.eq C \( N \) $ <four:maximal:reg:f-schauder>]
  on smaller patches; the hypotheses are precisely uniform ellipticity,
    $C^(0 \, theta)$ leading coefficients and source, smooth faces and constant Dirichlet data
    #cite(label("GilbargTrudinger2001")) Sections 6.1–6.2.
  Expand the divergence equation for $Z$ using (20.7). A derivative of a coefficient depending on $x \, Z \,
    D f$ is a bounded term plus bounded multiples of $D Z \, D^2 f$. Thus it takes the nondivergence form
  #[#set math.equation(numbering: n => "(20.8)")
   $ a^(i j) \( x \) D_(i j) Z = R_Z \, wide \| R_Z \| lt.eq C \( N \) \( 1 + \| D Z \|^2 \) \,
     $ <four:maximal:reg:Z-nondivergence>]
  with uniformly elliptic $C^(0 \, theta)$ leading coefficients.
    No derivative of $Z$ of order two has been placed on its right side.
  On an inner face, $f$ is constant and $D f$ is normal, so $A_chi nu = chi nu$.
    Dividing the flux condition by $3 u chi > 0$ gives
  #[#set math.equation(numbering: n => "(20.9)")
   $ partial_nu Z = b \( x \, Z \, f \, D f \) \, $ <four:maximal:reg:normal-datum>]
  where $b$ is a smooth bounded-range function, separately on each smooth stage of the homotopy.
    The formulas agree at stage junctions and have uniform bounds.
    At zero gradient the smooth formula for $A_chi$ above gives the same conclusion.
    A smooth collar extension of the right hand side has derivative bounded by
  $ C \( N \) \( 1 + \| D Z \| + \| D f \| + \| D^2 f \| \) lt.eq C \( N \) \( 1 + \| D Z \| \) . $
  The trace theorem therefore bounds its $W^(1 - 1 \/ p \, p)$ norm on the face by
    $C \( N \) \( 1 + parallel Z parallel_(W^(1 \, p)) \)$ on a larger collar patch.
    In particular, differentiating this extension costs $D Z$ and $D^2 f$, and does not cost $D^2 Z$.
  ===== 20.4 Absorbing the quadratic gradient term. <absorbing-the-quadratic-gradient-term.>
  Fix $p_1 > 4$. The linear local $W^(2 \, p_1)$ estimates for (20.8), with zero Dirichlet data or (20.9),
    give on nested patches
  #[#set math.equation(numbering: n => "(20.10)")
   $ parallel Z parallel_(W^(2 \, p_1) \( U' \)) lt.eq C \( N \)
     (1 + parallel D Z parallel_(L^(2 p_1) \( U \))^2 + parallel Z parallel_(W^(1 \, p_1) \( U \))) .
     $ <four:maximal:reg:Z-linear-estimate>]
  We specify why the coefficient regularity at this point suffices.
    Freeze the continuous leading matrix on small patches. The constant coefficient interior Hessian estimate
    follows from the Laplacian estimate by a linear coordinate change. At a boundary, use normal coordinates.
    On that face the matrix has no mixed tangential-normal entry, by the normal-axis property above.
    After removing the boundary datum by its Sobolev trace extension,
    odd Dirichlet or even homogeneous-normal reflection gives the constant coefficient estimate.
    The term $\( a \( x \) - a \( x_0 \) \) : D^2 Z$ is absorbed when its oscillation is sufficiently small.
    Cutoff terms are first order. This proves the local estimate with the $W^(1 - 1 \/ p_1 \, p_1)$ normal trace
    norm just estimated; it is the scalar Dirichlet/oblique specialization of
    #cite(label("AgmonDouglisNirenberg1959")) Theorems 15.1–15.3, pp. 702–706, especially Theorem 15.2,
    estimate (15.5), together with the interior $L^p$ estimate #cite(label("GilbargTrudinger2001")) Section 9.5.
    Uniform Hölder control fixes the patch size uniformly. The complementing condition can also be checked
    directly: a nonzero decaying Fourier mode for the frozen scalar operator in a half-space has nonzero value and
    nonzero normal derivative at its boundary. Thus neither the Dirichlet nor the normal operator annihilates that
    mode. The normal field is smooth and has unit transverse component;
    the boundary is smooth and the leading coefficients are continuous,
    as required for this $W^(2 \, p_1)$ specialization. The inner and outer faces are disjoint,
    so no change of boundary type occurs within such a patch.
  For a ball or smooth half-patch $Q_h$ of radius $h$, subtract a constant from $Z$.
    Nirenberg’s interpolation inequality, with derivative orders $1 \, 2$, endpoint exponent $oo$,
    Hessian exponent $p_1$ and interpolation parameter $1 \/ 2$, gives
  #[#set math.equation(numbering: n => "(20.11)")
   $ parallel D Z parallel_(L^(2 p_1) \( Q_h \))^2 lt.eq C "osc"_(Q_h) Z thin parallel D^2 Z
     parallel_(L^(p_1) \( Q_h \)) + C h^(4 \/ p_1 - 2) \( "osc"_(Q_h) Z \)^2 . $ <four:maximal:reg:nirenberg-scaled>]
  This is the bounded-domain form of #cite(label("Nirenberg1959")) Lecture II, (2.2) and Remark 5, pp. 125–126;
    extension on half-patches preserves the estimate. The power of $h$ follows by rescaling from dimension four.
    Our choice $p_1 > 4$, $j = 1$, $m = 2$ avoids the exceptional endpoint cases in that inequality.
  The Hölder estimate for $Z$ makes its oscillation at most $C h^theta$.
    Cover each larger patch in (20.10) by such $Q_h$ with bounded overlap.
    Taking the $ell^(p_1)$ norm of (20.11) over this cover gives
  $ parallel D Z parallel_(L^(2 p_1) \( U \))^2 lt.eq C sup_(Q_h) "osc"_(Q_h) Z thin parallel D^2 Z
    parallel_(L^(p_1) \( U^(+) \)) + C \( N \, h \) \, $
  where $U^(+)$ is a fixed enlargement. The number of small patches may affect the harmless constant
    $C \( N \, h \)$; their overlap, hence the coefficient of the Hessian norm,
    is bounded independently of the truncation. Choose $h$ so that this coefficient,
    including the constant in (20.10) and the fixed enlargement factor, is less than $1 \/ 4$.
    Ordinary interpolation handles the $W^(1 \, p_1)$ term with another coefficient less than $1 \/ 4$.
  To make the absorption on enlarged patches precise, use a uniform radius cover of the whole finite truncation
    and let $S$ be the supremum of the local $W^(2 \, p_1)$ norms on its smaller patches.
    Each fixed enlargement is covered by a bounded number of these patches,
    independently of the total number of patches. The last two estimates give $S lt.eq C \( N \) + 1 / 2 S$.
    For each individual smooth solution on a finite truncation $S$ is finite before this inequality is used.
    Thus $S lt.eq 2 C \( N \)$ uniformly. The same argument on nested compact patches gives the local estimate
    when no global cover is needed.
  ===== 20.5 Bootstrap and the continuation interface. <bootstrap-and-the-continuation-interface.>
  Since $p_1 > 4$, the bound just proved gives $Z in C^(1 \, theta')$ for some $theta' > 0$.
    The trace equation now has $C^(1 \, theta'')$ coefficients and source after (20.7),
    so one differentiation and Dirichlet Schauder give $f in C^(3 \, theta'')$, with $0 < theta'' lt.eq
    min \( theta \, theta' \)$. Equation (20.8) consequently has a $C^(0 \, theta'')$ source,
    and (20.9) has a $C^(1 \, theta'')$ datum. The scalar oblique/Dirichlet Schauder estimate gives $Z in
    C^(2 \, theta'')$; the boundary estimate is #cite(label("AgmonDouglisNirenberg1959")) Theorem 7.3,
    estimate (7.8), p. 668, with the complementing condition verified above.
    Repeating these two steps in this order raises the differentiability by one each time,
    because the trace equation contains $Z$ without its derivatives and the second equation contains at most $D^2
    f$ and $D Z$ in its lower order terms. The normal datum has the same derivative count.
    Smooth prepared geometry and smooth data complete the bootstrap to every finite order.
  For the scalar solve with trial $Z in C^(1 \, alpha)$ used in Section 21,
    this argument makes no assertion that $D^2 Z$ exists. Its preliminary individual third derivatives for $f$
    require only one differentiation of the trace equation, hence $D Z$.
    After the scalar gradient and axial estimates, bounded $D^2 f$ makes $D f$ Lipschitz;
    smooth compositions with the trial $C^(1 \, alpha)$ input then give $C^(0 \, alpha)$ scalar coefficients,
    Dirichlet $C^(2 \, alpha)$ estimates, and one more differentiation gives $C^(3 \, alpha)$.
    The independent scalar gradient bound and solvability are proved there.
    Finally, for actual coupled solutions the uniform $C^2$ bound already controls every fixed $C^(1 \, alpha)$
    norm, $alpha < 1$, regardless of the first Hölder exponent obtained above.
  The prepared end has uniform smooth geometry on unit patches.
    Large outer coordinate spheres admit boundary normal patches with the same bounds;
    their curvature and higher local chart derivatives are bounded uniformly.
    All the local constants and covering overlap numbers in this proof can therefore be chosen independently of
    the outer radius. This proves the proposition. ◻
]

== 21 Scalar solvability and compact continuation <four:maximal:sec:existence>

Fix the strict data and $0 < epsilon.alt < 1$. In this section $N gt.eq
  4$ and an allowed finite truncation $Omega_R$ are fixed. The boundary components $B$ and $S_R$ are smooth and
  disjoint. Fix also $0 < alpha < 1$, with no requirement that $alpha$ equal the exponent in Theorem 61.
  We parametrize the four successive stages of Section 18.2 by $s in \[ 0 \, 4 \]$:
  $s = 0$ is the desired system and $s = 4$ is the final zero-scale system.
  This parameter is unrelated to a collar coordinate. Constants in the scalar construction below may depend on
  $N \, epsilon.alt \, R \, alpha$ and on a specified bound for the trial input. They need not be polynomial in $N$.

=== 21.1 The trace equation on unrestricted trial inputs <the-trace-equation-on-unrestricted-trial-inputs>

#thm([Proposition 21.1.])[
  (Scalar solution operator).  #emph[For every $Z in C^(1 \, alpha) \( overline(Omega)_R \)$ and every homotopy
    parameter $s$, the trace equation with its assigned constant Dirichlet values has a unique solution $f =
    f_s \[ Z \] in C^(3 \, alpha) \( overline(Omega)_R \)$. No lower bound on $t =
    t \( Z \, "grad" f \)$ is assumed. On bounded sets of trial inputs,
    these solutions have bounded $C^(3 \, alpha)$ norms, uniformly in $s$.
    The map $\( s \, Z \) mapsto f_s \[ Z \]$ is continuous into $C^(3 \, alpha)$ and is locally obtained by
    inversion of the scalar Dirichlet operator.]
] <four:maximal:prop:scalar-solve>

#proof[
  Write the trace prescription at parameter $s$ as
  $ F_s = eta_N f + F_s^0 \( x \, Z \, "grad" f \) \, wide Q = sqrt(D) / l \, wide G_s =
    Q #scale(x: 120%, y: 120%)[\(] F_s - "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] . $
  Here $F_s^0$ is smooth in its displayed finite-dimensional arguments.
    For example, in stage three it is $\( 1 - zeta \) \( C + D_0 \) + zeta \( "tr"_(A_chi) K + D_1 \)$.
    The functions $D_0 \, D_1$ are evaluated on $w$, whose length is less than one.
    Thus $F_s^0 - "tr"_(A_chi) K$ is bounded on the finite truncation, uniformly in the gradient and in $s$.
    The normalized scalar equation is
  #[#set math.equation(numbering: n => "(21.1)")
   $ A_chi : "Hess" f = G_s \( x \, Z \, f \, "grad" f \) . $ <four:maximal:exist:normalized-trace>]
  Its matrix is independent of the value of $f$, and $partial_f G_s = eta_N Q > 0$.
  For the scalar method of continuity introduce a further parameter $theta in \[ 0 \, 1 \]$,
    retaining the assigned Dirichlet values and using
  #[#set math.equation(numbering: n => "(21.2)")
   $ A^(\( theta \)) & = \( 1 - theta \) "Id" + theta A_chi =
     "Id" - \( 1 - chi_theta \) e_f ⊗ e_f \, & chi_theta & = 1 - theta + theta chi \,\
G_s^(\( theta \)) & = \( 1 - theta \) eta_N f + theta G_s \, & A^(\( theta \)) : "Hess" f & =
  G_s^(\( theta \)) . $ <four:maximal:exist:scalar-interpolation>]
  At zero gradient these expressions are interpreted by their smooth tensor formulas. In particular,
  #[#set math.equation(numbering: n => "(21.3)")
   $ partial_f G_s^(\( theta \)) = eta_N #scale(x: 120%, y: 120%)[\(] 1 - theta +
     theta Q #scale(x: 120%, y: 120%)[\)] > 0 . $ <four:maximal:exist:strict-height>]
  Every trace stage has coefficient one on $h = eta_N f$, so this strict sign holds throughout both parameters.
  ===== 21.1.1 Height and large-gradient behavior. <height-and-large-gradient-behavior.>
  At a critical point of $f$, $w = 0$, $A_chi = "Id"$, $t = Z$, $D_0 \( x \, 0 \) = D_1 \( x \, 0 \) = 0$,
    and $"tr" K = 0$. The signs at extrema used in Lemma 78 therefore persist in (21.2):
    a fixed interval containing the assigned boundary values and the zeros of its scalar right side contains every
    solution. Denote its resulting bound by
  #[#set math.equation(numbering: n => "(21.4)")
   $ \| f \| lt.eq M_f . $ <four:maximal:exist:scalar-height>]
  This argument uses neither the divergence equation nor the floor.
  Suppose $parallel Z parallel_(C^0) lt.eq M_Z$ and put $sigma = \| "grad" f \|$.
    The implicit relation $Z = t + 1 / 6 log \( 1 + l \( t \)^2 sigma^2 \)$ implies $t arrow.r -
    oo$ uniformly as $sigma arrow.r oo$: if $t$ stayed bounded below, its right side would tend to infinity.
    Eventually $p = N$ and $l = e^(N t)$, whence exactly
  #[#set math.equation(numbering: n => "(21.5)")
   $ e^(6 Z) = e^(6 t) + e^(\( 6 + 2 N \) t) sigma^2 . $ <four:maximal:exist:large-gradient-identity>]
  Since the first term tends uniformly to zero and $e^(6 Z)$ stays between two positive constants, this gives
  #[#set math.equation(numbering: n => "(21.6)")
   $ t & = - frac(log sigma, N + 3) + O \( 1 \) \,\
d = e^(6 \( t - Z \)) & asymp sigma^(- 6 \/ \( N + 3 \)) \, wide chi = frac(3 d, 3 + N \( 1 - d \)) asymp d \,\
Q = sqrt(sigma^2 + l^(- 2)) & asymp sigma . $ <four:maximal:exist:large-gradient-asymptotics>]
  The constants here are uniform for bounded $Z$ at the fixed parameters.
    On bounded gradient sets the implicit equation has bounded $t$ and positive $l \, d \, chi$.
    Since $N gt.eq 4$ makes $6 \/ \( N + 3 \) < 1$, combining the two ranges yields constants $c_(*) >
    0$ and $C_(*) > 0$ such that
  #[#set math.equation(numbering: n => "(21.7)")
   $ chi_theta gt.eq chi gt.eq frac(c_(*), 1 + sigma) \, wide \| G_s^(\( theta \)) \| lt.eq
     C_(*) \( 1 + sigma \) quad upright("when ") \| f \| lt.eq M_f . $ <four:maximal:exist:linear-growth>]
  No uniform ellipticity has yet been asserted.
  ===== 21.1.2 Logarithmic collar barriers. <logarithmic-collar-barriers.>
  Extend the metric smoothly across all faces to a compact enlargement.
    Choose a short distance scale below its injectivity radius, the tubular radii of the faces,
    and their positive mutual separation. The geometry of all these collars is bounded.
    For the inward distance $r$ from a face with value $b$, consider
  #[#set math.equation(numbering: n => "(21.8)")
   $ b plus.minus psi \( r \) \, wide psi \( r \) = 1 / k log \( 1 + B_0 r \) \,\
q_1 \( r \) = psi' \( r \) = frac(B_0, k \( 1 + B_0 r \)) \, wide psi'' = -
  k q_1^2 . $ <four:maximal:exist:log-barrier>]
  Here $k$ and $B_0$ are constants, not any of the geometric tensors.
    At a comparison contact the gradient is $plus.minus q_1 "grad" r$.
    The distance Hessian vanishes in that axial direction, and the three transverse eigenvalues of
    $A^(\( theta \))$ are one. Its contraction on the positive test is consequently
  $ chi_theta psi'' + q_1 sum_(a = 1)^3 "Hess" r \( E_a \, E_a \) \, $
  where $E_1 \, E_2 \, E_3$ are orthonormal tangent directions to the distance leaf.
    If $q_1 gt.eq 1$, (21.7) bounds this above by $- c_(*) k q_1 \/ 2 + C q_1$;
    the negative test has the reverse bound. Choose $k$ so large that this axial term dominates both the distance
    Hessian bound and $C_(*) \( 1 + q_1 \)$, and also the pair-comparison constants below.
    Then choose a width $delta_2 < 1 \/ \( 4 k \)$ below all the preceding geometric scales.
    Finally choose $B_0$ large enough that
  #[#set math.equation(numbering: n => "(21.9)")
   $ q_1 \( delta_2 \) gt.eq 2 \, wide psi \( delta_2 \) > 2 M_f + 1 . $ <four:maximal:exist:barrier-choices>]
  These choices are compatible: as $B_0 arrow.r oo$ the two quantities tend respectively to
    $1 \/ \( k delta_2 \) > 4$ and to infinity.
  At a positive interior maximum of $f - b - psi \( r \)$ the solution and test have the same gradient and the
    solution Hessian is no larger. Evaluating the source at the #emph[solution] height, which obeys (21.4),
    the preceding strict upper bound contradicts (21.2). At the outer end of the collar the height inequality
    follows from (21.9), and at its inner end there is equality.
    The negative test is handled with the reversed inequalities. Thus
  #[#set math.equation(numbering: n => "(21.10)")
   $ \| f \( x \) - b \| lt.eq psi #scale(x: 120%, y: 120%)[\(] "dist" \( x \, upright("face") \)
     #scale(x: 120%, y: 120%)[\)] wide \( "dist" \( x \, upright("face") \) lt.eq delta_2 \) .
     $ <four:maximal:exist:collar-comparison>]
  The tests themselves need not stay in the bounded height interval;
    the source estimate was used only at solution heights.
  ===== 21.1.3 The full two-point comparison. <the-full-two-point-comparison.>
  The face barriers control graph slopes only at the boundary.
    An interior two-point comparison supplies the missing global gradient bound.
    Its key feature is that the three transverse eigenvalues agree at both points;
    the two axial eigenvalues need only have the same lower bound.
  Let $r \( x \, y \)$ be distance in the smooth extension.
    On the compact set ${ \( x \, y \) in overline(Omega)_R^2 : r \( x \, y \) lt.eq delta_2 }$ consider
  $ f \( x \) - f \( y \) - psi \( r \( x \, y \) \) . $
  It is zero on the diagonal and negative when $r = delta_2$.
    It cannot have a positive maximum with a boundary endpoint:
    if, for example, $x$ belongs to a face of height $b$, then $y$ lies in that same face’s collar,
    its distance to the face is at most $r \( x \, y \)$, and (21.10) and monotonicity of $psi$ give $b -
    f \( y \) lt.eq psi \( r \( x \, y \) \)$. The case with $y$ on a face is identical.
    The separation choice excludes different faces at such distances.
  Suppose then that a positive maximum occurs at an interior pair with $0 < r < delta_2$.
    The short geodesic $gamma$ from $y$ to $x$ is unique in the extension; the distance is smooth at this pair.
    Write $e_y = dot(gamma) \( 0 \)$ and $e_x = dot(gamma) \( r \)$, with unit speed. First variation gives
  #[#set math.equation(numbering: n => "(21.11)")
   $ "grad" f \( x \) = q_1 e_x \, wide "grad" f \( y \) = q_1 e_y \, wide q_1 = psi' \( r \) gt.eq
     1 . $ <four:maximal:exist:pair-gradients>]
  Parallel translate an orthonormal transverse frame $E_1 \, E_2 \, E_3$ along $gamma$.
    Vary both endpoints simultaneously in the corresponding $E_a$ directions, using geodesic endpoint curves.
    The first variation of the distance is zero. The second variation is bounded above by $C r$:
    the parallel comparison field has index form
  $ - integral_0^r chevron.l "Rm" \( E_a \, dot(gamma) \) dot(gamma) \,
    E_a #scale(x: 120%, y: 120%)[chevron.r] thin upright(d) v \, $
  whose absolute value is at most $C r$, and the Jacobi field with the same endpoints minimizes this index form on
    the short segment. The second derivative test at the pair maximum therefore gives
  #[#set math.equation(numbering: n => "(21.12)")
   $ sum_(a = 1)^3 #scale(x: 120%, y: 120%)[\[] "Hess" f_x \( E_a \( r \) \, E_a \( r \) \) -
     "Hess" f_y \( E_a \( 0 \) \, E_a \( 0 \) \) #scale(x: 120%, y: 120%)[\]] lt.eq
     C q_1 r . $ <four:maximal:exist:pair-transverse>]
  Varying only $x$ in direction $e_x$, and only $y$ in direction $e_y$,
    the distance changes linearly and its second derivative vanishes. Hence
  $ "Hess" f_x \( e_x \, e_x \) lt.eq psi'' \, wide "Hess" f_y \( e_y \, e_y \) gt.eq - psi'' . $
  The two axial coefficients need not be equal. Positivity and (21.7) nevertheless imply
  #[#set math.equation(numbering: n => "(21.13)")
   $ & chi_theta \( x \) "Hess" f_x \( e_x \, e_x \) - chi_theta \( y \) "Hess" f_y \( e_y \, e_y \)\
 & #h(12mm)  lt.eq #scale(x: 120%, y: 120%)[\(] chi_theta \( x \) +
   chi_theta \( y \) #scale(x: 120%, y: 120%)[\)] psi'' lt.eq - frac(2 c_(*) k q_1^2, 1 + q_1) lt.eq -
   c_(*) k q_1 . $ <four:maximal:exist:pair-axial>]
  There are exactly three transverse eigenvalues at #emph[each] endpoint, all equal to one.
    Thus (21.12) and (21.13), followed by the two scalar equations, give
  $ G_s^(\( theta \)) \( x \) - G_s^(\( theta \)) \( y \) lt.eq C q_1 r - c_(*) k q_1 . $
  On the other hand, the source growth bound and (21.11) give a lower bound $- 2 C_(*) \( 1 + q_1 \) gt.eq -
    4 C_(*) q_1$. Taking $k$ above so that $c_(*) k > C + 4 C_(*)$ and $delta_2 < 1$ is a contradiction.
    This uses no continuity estimate on the two axial coefficients or on their difference.
    The connecting segment is permitted to leave $Omega_R$: only endpoint variations and the extension’s bounded
    geometry enter the argument, and the endpoints are interior.
  It follows that $\| f \( x \) - f \( y \) \| lt.eq psi \( r \( x \, y \) \)$ for short pairs.
    Letting $y arrow.r x$, and also using the collar comparison at a face, proves
  #[#set math.equation(numbering: n => "(21.14)")
   $ parallel "grad" f parallel_(C^0 \( overline(Omega)_R \)) lt.eq psi' \( 0 \) =
     B_0 \/ k . $ <four:maximal:exist:scalar-gradient>]
  This estimate is uniform in $s \, theta$ and on bounded trial-input sets,
    and was obtained without assuming the floor or a positive uniform ellipticity constant in advance.
  ===== 21.1.4 Regularity and the scalar method of continuity. <regularity-and-the-scalar-method-of-continuity.>
  The gradient bound and the implicit relation now confine all scalar coefficients to a compact range.
    In particular $0 < chi_0 lt.eq chi_theta lt.eq 1$, and the normalized source is bounded.
    There is a small regularity point before applying Theorem 61.
    An individual $C^(2 \, alpha)$ solution of (21.2) is $C^(3 \, alpha)$ for a trial $Z in C^(1 \, alpha)$.
    Indeed one differentiation of the equation gives a linear equation for a first derivative of $f$.
    Its coefficients and source involve $Z \, "grad" Z \, "grad" f \, "Hess" f$ and smooth geometric coefficients;
    they involve no second derivative of $Z$. Difference quotients justify this differentiation initially.
    In a flattened boundary chart tangential differentiation preserves the zero Dirichlet value after subtracting
    the constant face height. The linear boundary Schauder estimate controls these tangential derivatives through
    order two. Solving the original equation for the pure normal second derivative, whose coefficient is positive,
    and differentiating that identity in the normal direction recovers the remaining pure normal third derivative.
    Every other third derivative already has a tangential index.
    This gives individual third-order regularity, without presuming a uniform estimate.
  Theorem 61 now applies to (21.2), including its constant-Dirichlet faces.
    It bounds $"grad" f$ in $C^(0 \, beta)$ for some $beta > 0$.
    Since the trial inputs are bounded in $C^(1 \, alpha)$, the coefficients and source of the scalar equation are
    consequently bounded in $C^(0 \, beta')$ for a positive $beta'$.
    Dirichlet Schauder estimates give a uniform $C^(2 \, beta')$ bound for $f$.
    In particular $"grad" f$ is now uniformly Lipschitz. Smooth composition with $Z$,
    which also has bounded first derivatives, shows that those same coefficients and sources have bounded
    $C^(0 \, alpha)$ norms for the originally chosen, arbitrary $alpha < 1$.
    Schauder estimates upgrade $f$ to $C^(2 \, alpha)$. Their coefficients and sources then have bounded
    $C^(1 \, alpha)$ norms, and the preceding differentiation argument gives
  #[#set math.equation(numbering: n => "(21.15)")
   $ parallel f parallel_(C^(3 \, alpha) \( overline(Omega)_R \)) lt.eq C . $ <four:maximal:exist:scalar-schauder>]
  The linear estimates used here are the interior and Dirichlet boundary Schauder estimates and their
    differentiated versions #cite(label("GilbargTrudinger2001")) Sections 6.1–6.4.
    Their hypotheses hold on the finite smooth domain: positive uniform ellipticity on the established range,
    the indicated Hölder coefficient bounds, and smooth constant Dirichlet data on each disjoint component.
  For completeness, the local inverse has the required sign.
    Linearizing $A^(\( theta \)) : "Hess" f - G_s^(\( theta \))$ in the $f$ variable gives
  #[#set math.equation(numbering: n => "(21.16)")
   $ cal(L) phi = A^(\( theta \) i j) nabla_i nabla_j phi + b^i nabla_i phi -
     eta_N \( 1 - theta + theta Q \) phi \, wide phi \|_(partial Omega_R) =
     0 . $ <four:maximal:exist:scalar-linearization>]
  Its first-order coefficients are bounded Hölder functions along each solution.
    Differentiating the gradient dependence of $A^(\( theta \))$ contributes terms involving $"Hess"
    f$ only to this first-order part. The strictly negative zeroth-order coefficient and the maximum principle
    give a zero kernel. The linear Dirichlet solvability theorem and Schauder estimate give an isomorphism
    $C_0^(2 \, alpha) arrow.r C^(0 \, alpha)$ #cite(label("GilbargTrudinger2001")) Sections 6.2–6.3;
    here the subscript means zero trace on #emph[all] boundary components.
    Equivalently, one can continue the linear operator to $Delta - eta_N$,
    using its Schauder estimate and the maximum principle at each point of that linear continuation.
    With the additional coefficient regularity it is also an isomorphism $C_0^(3 \, alpha) arrow.r C^(1 \, alpha)$.
  The endpoint $theta = 0$ is the solvable linear Dirichlet problem $Delta f = eta_N f$.
    Subtract a smooth extension of the assigned face values when working on spaces with homogeneous boundary data.
    The implicit function theorem and (21.16) give openness in $theta$.
    The bound (21.15) gives compactness in $C^(2 \, alpha)$, so passage to a limiting equation gives closedness.
    Thus the solution exists at $theta = 1$.
  If $f_1 - f_2$ had a positive maximum in the interior, their gradients and therefore their principal matrices
    and $Q$ would agree there. Their Hessian difference would have nonpositive contraction,
    whereas the difference of the sources would be $eta_N Q \( f_1 - f_2 \) > 0$.
    This contradiction, and its reverse, prove uniqueness. Finally use (21.16) in $C_0^(3 \, alpha) arrow.r
    C^(1 \, alpha)$ with $Z$ as a $C^(1 \, alpha)$ parameter.
    Smooth composition and the implicit function theorem show that the unique scalar solution depends continuously
    on that input in $C^(3 \, alpha)$. The same statement holds along each homotopy stage;
    the explicit prescriptions and boundary heights agree at their junctions,
    so it holds across those junctions as well. ◻
]

=== 21.2 The frozen linear return problem <the-frozen-linear-return-problem>

The trace equation is now solvable for every trial $Z$, including trials below the intended floor.
  We can therefore define a compact return map on a fixed function space.
  The floor becomes a restriction on the degree domain, rather than an unproved prerequisite for defining the map.

Set

$ X = { Z in C^(1 \, alpha) \( overline(Omega)_R \) : Z \|_(S_R) = 0 } . $

Given $\( s \, Z \) in \[ 0 \, 4 \] times X$, first compute $f =
  f_s \[ Z \]$ by Proposition 88 and then all of $t \, l \, u \, w \, chi$, $F$ and $cal(T)$ from this pair.
  Let $lambda_s$ denote the drift parameter, let $q_s = 1$ in the first three stages and $q_s = eta$ in the last,
  and let $b_s$ denote the prescribed right side of $\( V_(lambda_s) \)_nu \/ u$ in the full homotopy,
  including its last-stage scale. Define $T_s Z = tilde(Z)$ by

#[#set math.equation(numbering: n => "(21.17)")
 $
   cases(delim: "{", "div" #scale(x: 120%, y: 120%)[\(] 3 u A_chi "grad" tilde(Z) + u A_chi lambda_s K \( w \,
   dot.op \) #scale(x: 120%, y: 120%)[\)] = q_s u Xi & upright("in ") Omega_R \,, #scale(x: 120%, y: 120%)[\(] 3 u
   A_chi "grad" tilde(Z) + u A_chi lambda_s K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)]_nu = u b_s &
   upright("on ") B \,, tilde(Z) = 0 & upright("on ") S_R .) $ <four:maximal:exist:return-problem>]

Every quantity in this display except $"grad" tilde(Z)$ is frozen at the input pair,
  including every occurrence of $"grad" Z$ in $Xi$.

The coefficient $cal(A) = 3 u A_chi$ is symmetric and positive definite.
  On a bounded subset of $X$ its ellipticity constants are uniformly positive,
  by Proposition 88 and the smooth implicit equation for $t$. Let $cal(D) = u A_chi lambda_s K \( w \, dot.op \)$.
  On the Hilbert space of $H^1$ functions vanishing on $S_R$, the weak form of (21.17) is

#[#set math.equation(numbering: n => "(21.18)")
 $ integral_(Omega_R) cal(A) "grad" tilde(Z) dot.op "grad" phi = - integral_(Omega_R) q_s u Xi phi -
   integral_(Omega_R) cal(D) dot.op "grad" phi - integral_B u b_s phi . $ <four:maximal:exist:return-weak>]

The last sign uses the inward normal $nu$ on $B$. Poincaré’s inequality holds because $S_R$ is nonempty and the
  domain is connected. Consequently the left side is a coercive bilinear form and the right side is a bounded
  linear functional, by the trace inequality. To solve it directly,
  minimize one half of this quadratic form minus the right-side functional on that Hilbert space.
  Coercivity bounds a minimizing sequence in $H^1$; weak compactness and lower semicontinuity give a minimizer.
  Its first variation is (21.18), and strict convexity gives uniqueness. There is no Neumann compatibility constraint.

We check the precise regularity of this linear problem. The formula

$ A_chi = "Id" - frac(3 + p, 3 + p v) thin w ⊗ w $

is smooth also at zero gradient, and the derivative of the implicit relation in $t$ is $1 + p v \/ 3 > 0$.
  Thus $t \, u \, A_chi \, cal(D)$ have bounded $C^(1 \, alpha)$ norms on bounded input sets.
  Differentiating $t = t \( x \, Z \, "grad" f \)$ requires only $"grad" Z$ and $"Hess" f$.
  The expression for $cal(T)$ is quadratic in $"Hess" f$ and $"grad" t$ with smooth bounded-range coefficients,
  so $q_s u Xi$ has a bounded $C^(0 \, alpha)$ norm. The prescribed boundary expression $u
  b_s$ has a bounded $C^(1 \, alpha)$ norm. At $B$ the scalar Dirichlet data make $"grad" f$ normal,
  hence $A_chi nu = chi nu$; the boundary equation is equivalently

#[#set math.equation(numbering: n => "(21.19)")
 $ partial_nu tilde(Z) = frac(b_s - lambda_s \( A_chi K \( w \, dot.op \) \)_nu, 3 chi) .
   $ <four:maximal:exist:return-normal>]

This is a $C^(1 \, alpha)$ normal derivative datum, with a denominator bounded away from zero on the input set.
  After expanding the divergence, interior and boundary Schauder estimates therefore give a bounded
  $C^(2 \, alpha)$ norm for $tilde(Z)$. The estimates apply locally with Dirichlet data on $S_R$ and a uniformly
  oblique, here normal, derivative on $B$; these faces do not meet.
  We use the Dirichlet estimates just cited and the oblique derivative estimates of
  #cite(label("GilbargTrudinger2001")) Theorem 6.30, p. 127;
  the weak existence argument above fixes the additive constant that is present in a pure Neumann problem.

Subtracting two return equations and applying the same linear estimates proves continuity in $\( s \, Z \)$ into
  $C^(2 \, alpha)$. The parameter continuity is uniform on bounded input sets.
  Indeed the negative zeroth-order bound in (21.16) and the Schauder estimate bound the scalar inverse uniformly
  on such a set. Differentiation in a stage parameter, after extending its Dirichlet data,
  then bounds the parameter derivative of $f_s \[ Z \]$; the return equation gives the same conclusion for $T_s
  Z$. The finitely many stage junctions preserve continuity.
  The inclusion $C^(2 \, alpha) arrow.r.hook C^(1 \, alpha)$ on the fixed smooth compact domain is compact.
  We have thus constructed a continuous homotopy $T_s : X arrow.r X$ that is compact on bounded sets,
  jointly in $s$, before making any floor restriction. A fixed point satisfies both original equations and their
  exact boundary conditions. It is smooth: the first gain is $Z in C^(2 \, alpha)$,
  and successive differentiation of the scalar equation, the divergence equation and its normal boundary condition
  then alternately improves $f$ and $Z$ to every finite order.

=== 21.3 Degree on the open floor sections <degree-on-the-open-floor-sections>

#thm([Proposition 21.2.])[
  (Existence and exhaustion).  #emph[For the fixed strict data and every $0 < epsilon.alt <
    1$ there are $N_0$ and $R_min \( N \)$, with $R_min \( N \) arrow.r oo$, such that for every integer $N gt.eq
    N_0$ and every $R gt.eq R_min \( N \)$ the desired coupled system has a smooth solution on $overline(Omega)_R$
    with $t > - epsilon.alt$. At each such fixed $N$, a subsequence as $R arrow.r
    oo$ converges smoothly on compact subsets of $overline(Omega)$ to a solution of the equations and inner
    boundary conditions with $t gt.eq - epsilon.alt$. The previously proved height,
    range and collar estimates hold for this limit.]
] <four:maximal:prop:existence>

#proof[
  All estimates from Sections 18–20 were conditional estimates for arbitrary smooth homotopy solutions.
    Specifically, Lemma 78 and Proposition 81 precede the bounded-range and derivative estimates;
    Lemma 82 and Lemma 83 apply to solutions satisfying the floor; Proposition 85 then bounds their variables;
    and Proposition 87 bounds their derivatives. None presupposes a fixed point of the map just defined.
    On this finite truncation these results give, uniformly in $s$,
  $ parallel Z parallel_(C^(1 \, alpha)) lt.eq M_(*) quad upright("for every smooth fixed point with ") min t
    gt.eq - epsilon.alt . $
  The arbitrary exponent $alpha < 1$ is permitted because the classical estimates give a $C^2$ bound,
    and higher bounds as needed. Choose $M_0 > M_(*) + 1$.
  Let
  #[#set math.equation(numbering: n => "(21.20)")
   $ m \( s \, Z \) & = min_(overline(Omega)_R) t #scale(x: 120%, y: 120%)[\(] x \, Z \,
     "grad" f_s \[ Z \] #scale(x: 120%, y: 120%)[\)] \,\
cal(W) & = { \( s \, Z \) in \[ 0 \, 4 \] times X : m \( s \, Z \) > - epsilon.alt \,
  parallel Z parallel_(C^(1 \, alpha)) < M_0 } \,\
cal(W)_s & = { Z : \( s \, Z \) in cal(W) } . $ <four:maximal:exist:floor-sections>]
  The minimum is continuous by Proposition 88, so $cal(W)$ is relatively open and every section is a bounded open
    subset of $X$. Consider
  $ cal(K) = { \( s \, Z \) in overline(cal(W)) : Z = T_s Z } . $
  This is compact: any sequence has a convergent parameter subsequence,
    and joint compactness of $T_s$ on the bounded input ball makes its fixed points converge in $X$;
    continuity preserves the fixed-point equation and membership in the closed set.
    Every point of $cal(K)$ is a smooth solution with $m \( s \, Z \) gt.eq - epsilon.alt$.
    Its norm is at most $M_(*) < M_0$, and Proposition 81 excludes $m \( s \, Z \) = - epsilon.alt$. Therefore
  #[#set math.equation(numbering: n => "(21.21)")
   $ cal(K) subset cal(W) . $ <four:maximal:exist:no-boundary-fixed-point>]
  Apply Lemma 31 with $I = \[ 0 \, 4 \]$, the Banach space $X$ above,
    the jointly compact homotopy $\( s \, Z \) mapsto T_s Z$, and $cal(U) = cal(W)$.
    The uniform norm bound makes $cal(W)$ bounded; continuity of $m$ makes it relatively open.
    The preceding compactness argument and (21.21) verify that its closed fixed-point set is compact and contained
    in $cal(W)$, so no fixed point lies on the relative boundary. The lemma gives constancy of
  $ deg \( "Id" - T_s \, cal(W)_s \, 0 \) wide \( 0 lt.eq s lt.eq 4 \) . $
  It applies to these varying sections without a convexity assumption.
  At $s = 4$ the scalar boundary values are zero and the final trace equation is
  $ "tr"_(A_chi) H^f = eta_N f + D_1 \( x \, w \) . $
  At a positive or negative extremum $w = 0$ and $D_1 \( x \, 0 \) = 0$, so the strict height sign forces $f = 0$.
    This holds for every trial $Z$, not just at fixed points. Thus $t = Z$, $chi = 1$ and $u = L_0 \( Z \)$.
    Both the drift and the prescribed source and boundary flux in (21.17) vanish.
    Testing its homogeneous equation by $tilde(Z)$ gives
  $ integral_(Omega_R) 3 L_0 \( Z \) \| "grad" tilde(Z) \|^2 = 0 \, $
  so $T_4 Z = 0$ for every input. At its sole fixed point $Z = 0$ one has $t = 0$,
    so $0 in cal(W)_4$ and $deg \( "Id" - T_4 \, cal(W)_4 \, 0 \) =
    1$ #cite(label("LeraySchauder1934")) Chapter II, §8, p. 55.
    The same degree at $s = 0$ yields a desired fixed point in $cal(W)_0$,
    proving the assertion on the finite truncation.
  We finally make the parameter order explicit. Fix the strict background, $epsilon.alt$,
    the collars and the end weights first. The pointwise floor argument chooses the small $delta_0$ and a
    polynomially large penalty coefficient $C_N$ without derivative estimates.
    The separation statement is uniform along arbitrary expanding sequences of the first two homotopy stages;
    applied at the finitely many fixed collar ends, it supplies the eventual separation needed for the slopes.
    Increase $N_0$ to meet this requirement and the finitely many conditions of the form $Pi_N eta_N \/ ell <
    upright("constant")$. Increase $R_min \( N \)$ to meet all the fixed-$N$ outer-radius requirements,
    requiring also $R_min \( N \) gt.eq N$. These choices give the estimates for every $N gt.eq
    N_0$ and every $R gt.eq R_min \( N \)$. All subsequent scalar,
    degree-radius and classical regularity constants may depend arbitrarily on the now fixed $N$.
  For that fixed $N$, take $R_j arrow.r oo$ and the desired fixed points just obtained.
    Proposition 87 gives uniform bounds of every finite order on each fixed compact subset,
    including patches meeting $B$. Successive compact extractions on a countable exhaustion produce a subsequence
    converging in $C^k$ on each such compact set for every finite $k$.
    All equations, inner data and collar inequalities pass to the limit.
    The strict floor may become non-strict, which is the asserted $t gt.eq - epsilon.alt$.
    The normalization at infinity is supplied by the uniform tail estimates in Proposition 90;
    it is not inferred from compact convergence alone. Only after this fixed-$N$ exhaustion will $N$ tend to
    infinity in the flux comparison. The latter uses the earlier polynomial estimates directly,
    and does not use the arbitrary constants of the present section. ◻
]

== 22 End normalization and the mass–area comparison <four:maximal:sec:comparison>

Fix the strict approximation data, the threshold exterior $Omega$ with boundary $B$, and $0 < epsilon.alt < 1$.
  Take $N$ sufficiently large as in Proposition 89. In the first part of this section,
  $N$ remains fixed while the truncation radius tends to infinity.
  Constants in end estimates may depend arbitrarily on these fixed parameters.
  In the flux deficit estimate, by contrast, we will return directly to the polynomial bounds of Lemma 84.

=== 22.1 Normalization inherited from the truncations <normalization-inherited-from-the-truncations>

#thm([Proposition 22.1.])[
  (Control of the asymptotic end).  #emph[The exhaustion solutions of Proposition 89 admit a smooth local limit
    $\( f \, Z \)$ on $overline(Omega)$ satisfying the desired system and $t gt.eq - epsilon.alt$. Every such limit has
#[#set math.equation(numbering: n => "(22.1)")
 $ \| nabla^j f \| lt.eq C_j \( N \) e^(- c_j \( N \) r) quad \( j gt.eq 0 \) \, wide Z \, t =
   O_2 \( r^(- 2) \) . $ <four:maximal:end:decay>]

 The zeroth-order estimates producing this normalization are uniform on the finite truncations.
   The resulting metric $hat(g) = e^(2 t) \( g + l^2 d f ⊗ d f \)$ is smooth, complete with its boundary included,
   and asymptotically flat with
#[#set math.equation(numbering: n => "(22.2)")
 $ hat(g)_(i j) - delta_(i j) = O_2 \( r^(- q) \) \, wide 0 lt.eq R_(hat(g)) = O \( r^(- 4 - delta) \) \, wide
   hat(H)_B < 0 . $ <four:maximal:end:geometry>]

 Here the normal defining $hat(H)_B$ points toward infinity.]
] <four:maximal:prop:end-control>

#proof[
  The local compactness and the inner boundary conditions follow from Propositions 87 and 89.
    To determine the value at infinity, apply Lemma 69 to the finite truncations before taking their local limit.
    We verify its hypotheses explicitly.
  The strict background has $1 < q < 2$, $0 < delta < q - 1$, $g - delta_(upright("Eucl")) = O_2 \( r^(- q) \)$,
    $K = O_1 \( r^(- 1 - q) \)$, $"tr"_g K = 0$, and $R_g = O \( r^(- 4 - delta) \)$ by Proposition 72.
    Outside the compact support of $C$, the trace right side is $eta_N f$.
    The divergence equation is exactly (15.4), with $rho_0 = r^(- 4 - delta)$, $rho_1 =
    r^(- 2 gamma)$ and the smooth penalty switch defined in (18.17).
    Their differentiated end bounds follow from the fixed smooth radial choices.
    Propositions 85 and 87 supply the common bounded range and all fixed-$N$ classical estimates,
    on end unit patches and on the zero-Dirichlet outer faces, uniformly in the truncation radius.
    The leading matrix is uniformly elliptic on that range.
  The lemma therefore gives exponential decay of $f$ and its fixed derivatives,
    a truncation-uniform bound $\| Z \| + \| t \| lt.eq C \( N \) r^(- 2)$, and $Z \, t =
    O_2 \( r^(- 2) \)$ for every local limit. In particular normalization at infinity follows from a comparison on
    the actual truncations, not from local convergence. The equation used for that comparison is
  #[#set math.equation(numbering: n => "(22.3)")
   $ 3 Delta_g Z & + 3 #scale(x: 120%, y: 120%)[\[] p \( Z \) + 2 -
     delta_0 \( p \( Z \) + 1 \) #scale(x: 120%, y: 120%)[\]] \| d Z \|^2\
 & = delta_0 / 2 \| K \|^2 + rho - m_0 \( Z \) C_N rho_0 + cal(E)_N \, $ <four:maximal:end:zero-graph>]
  where the graph error $cal(E)_N$ has exponential unit-patch bounds.
    The $\| K \|^2 \/ 2$ term survives because the tensor is retained; its decay is integrable since $2 +
    2 q > 4 + delta$. All constants in this application are allowed to depend on the fixed $N$.
    They will not be used to estimate the later limit in $N$.
  The signs can now be recorded directly from the desired system.
    Since $F = eta_N f + C$ and $w \( f \) = a sigma$, the scalar identity becomes
  #[#set math.equation(numbering: n => "(22.4)")
   $ 1 / 2 e^(2 t) R_(hat(g)) =  & \[ mu + J \( w \) + w \( C \) - rho \] + \( 1 - delta_0 \) cal(T)\
 & + \( 1 - delta_0 \) eta_N a sigma + m_0 \( t \) cal(P) . $ <four:maximal:end:scalar-sign>]
  The bracket is nonnegative by $\| w \| lt.eq 1$ and $mu - \| J \| gt.eq \| d C \| + rho$;
    all remaining terms are nonnegative. The boundary identity and the prescribed conormal datum give
  #[#set math.equation(numbering: n => "(22.5)")
   $ H_B + 3 partial_nu t = - N_B \, wide hat(H)_B = - e^(- t) sqrt(d) thin N_B < 0 .
     $ <four:maximal:end:boundary-sign>]
  This uses the normal into $Omega$ on every component of $B$.
  As quadratic forms $hat(g) gt.eq e^(- 2 epsilon.alt) g$. A $hat(g)$-Cauchy sequence is therefore $g$-Cauchy;
    completeness of the background exterior and local equivalence of the smooth metrics give completeness with the
    boundary included. Since $q < 2$, the conformal $O_2 \( r^(- 2) \)$ term and the exponential graph error
    retain the background decay $hat(g) - delta = O_2 \( r^(- q) \)$.
    Equation (22.3) gives $Delta_g t = O_N \( r^(- 4 - delta) \)$, since $\| d t \|^2 =
    O_N \( r^(- 6) \)$ and $0 < delta < 1$. Finally,
  $ R_(hat(g)) = e^(- 2 t) #scale(x: 120%, y: 120%)[\(] R_(macron(g)) - 6 Delta_(macron(g)) t -
    6 \| d t \|_(macron(g))^2 #scale(x: 120%, y: 120%)[\)] $
  and the exponential graph errors, together with $R_g = O \( r^(- 4 - delta) \)$, give the scalar decay in (22.2). ◻
]

=== 22.2 The ADM change and a polynomial flux deficit <the-adm-change-and-a-polynomial-flux-deficit>

All integrals in the next Proposition use the background metric $g$.
  At the inner boundary $nu$ points into $Omega$, and at a coordinate sphere $nu_g$ points toward increasing radius.

#thm([Proposition 22.2.])[
  (Flux and mass comparison).  #emph[For the limiting solution at fixed $N$, the flux
$ frak(F) = lim_(r arrow.r oo) integral_(S_r) V dot.op nu_g thin upright(d) A_g $

 exists and satisfies
#[#set math.equation(numbering: n => "(22.6)")
 $ E_(hat(g)) = E_g - frac(frak(F), 3 omega_3) \, wide omega_3 = 2 pi^2 . $ <four:maximal:end:mass-flux>]

 There is a polynomial bound $Pi_N$, independent of the exhaustion radius and of the fixed-$N$ regularity
   constants, such that
#[#set math.equation(numbering: n => "(22.7)")
 $ frak(F) gt.eq - Pi_N (ell + ell^2 / eta_N) . $ <four:maximal:end:flux-deficit>]

 Consequently, for fixed strict data and $epsilon.alt > 0$, $E_(hat(g)) lt.eq E_g + o \( 1 \)$ as $N arrow.r oo$.]
] <four:maximal:prop:flux>

#proof[
  The end estimates imply
  $ cal(T) & = 1 / 2 \| K \|^2 + 3 \( p \( t \) + 1 \) \| d t \|^2 + O_N \( e^(- c r) \) \,\
u & = 1 + O_N \( r^(- 2) \) \, wide V = 3 "grad"_g t + O_N \( r^(- 5) \) + O_N \( e^(- c r) \) . $
  In particular $u Xi$ is absolutely integrable. Its nonexponential terms have decay $r^(- 2 - 2 q)$, $r^(- 6)$,
    or $r^(- 4 - delta)$. The possibly slower weight $rho_1$ is multiplied by the exponentially small $v$ on this
    fixed-$N$ end. The divergence theorem gives
  $ integral_(S_r) V dot.op nu_g thin upright(d) A_g - integral_B V dot.op nu thin upright(d) A_g =
    integral_(Omega_r) u Xi thin upright(d) V_g . $
  Here $Omega_r$ denotes the part of $Omega$ inside $S_r$. Absolute integrability proves existence of the limit
    and yields the orientation-sensitive formula
  #[#set math.equation(numbering: n => "(22.8)")
   $ frak(F) = integral_Omega u Xi thin upright(d) V_g + integral_B V dot.op nu thin upright(d) A_g .
     $ <four:maximal:end:divergence-flux>]
  We next compute the mass change in the same asymptotic chart.
    The linear conformal perturbation is $2 t delta_(i j)$, and in dimension four its contribution to the ADM
    numerator is exactly
  $ partial_j \( 2 t delta_(i j) \) - partial_i \( 2 t delta_(j j) \) = - 6 partial_i t . $
  The differentiated remainders are $O_N \( r^(- 3 - q) \) + O_N \( r^(- 5) \) +
    O_N \( e^(- c r) \)$ and have vanishing sphere integrals.
    They include products of $t$ with $g - delta$, quadratic conformal terms, and the graph perturbation.
    Replacing Euclidean surface flux for $d t$ by $g$-surface flux changes it by $O_N \( r^(- q) \)$ after
    integration. Since the ADM denominator is $6 omega_3$, we obtain
  $ E_(hat(g)) - E_g = - 1 / omega_3 lim_(r arrow.r oo) integral_(S_r) partial_(nu_g) t thin upright(d) A_g = -
    frac(frak(F), 3 omega_3) . $
  This also proves existence of the ADM energy of $hat(g)$ from the assumed existence of $E_g$;
    no interchange of the $r$ and $N$ limits is involved.
  To estimate (22.8), use the boundary flux bound (19.8) and the weighted trace estimate (19.7) with test function
    one. They give
  #[#set math.equation(numbering: n => "(22.9)")
   $ integral_B \| V dot.op nu \| thin upright(d) A_g & lt.eq C eta_N / ell integral_B L_0 thin upright(d) A_g\
 & lt.eq Pi_N eta_N / ell integral_(upright("collars")) u \( 1 + sqrt(cal(T)) \) thin upright(d) V_g\
 & lt.eq Pi_N eta_N / ell integral_(upright("collars")) u \( rho + delta_0 cal(T) \) thin upright(d) V_g .
   $ <four:maximal:end:boundary-cost>]
  For the last step, $rho$ has a positive minimum on these fixed compact collars, and $sqrt(cal(T)) lt.eq
    c cal(T) + C_c$ with fixed $c > 0$. Only the polynomial constants in those two earlier estimates enter (22.9).
    Since $eta_N \/ ell = e^(- epsilon.alt N \/ 2)$, increasing $N$ absorbs this entire cost into, for example,
    one half of the $u \( rho + delta_0 cal(T) \)$ contribution to the bulk integral.
  The negative bulk term is $u m_0 \( t \) cal(P)$. On its support,
  $ - epsilon.alt lt.eq t lt.eq - epsilon.alt + 1 \/ N \, wide ell lt.eq l lt.eq e ell \, wide c ell lt.eq
    L_0 lt.eq C ell . $
  These constants are uniform for $0 < epsilon.alt < 1$ and sufficiently large $N$.
    From the definitions, rather than from a derivative estimate, one obtains
  #[#set math.equation(numbering: n => "(22.10)")
   $ u lt.eq C \( ell + ell^2 sigma \) \, wide u v lt.eq C ell^2 sigma \, wide u a sigma = L_0 l sigma^2 gt.eq
     c ell^2 sigma^2 . $ <four:maximal:end:band-identities>]
  For the middle inequality use $v sqrt(D) = l^2 sigma^2 \/ sqrt(1 + l^2 sigma^2) lt.eq l sigma$.
    Thus Young’s inequality, with $C_N$ polynomial and $0 lt.eq m_0 lt.eq 1$, gives
  #[#set math.equation(numbering: n => "(22.11)")
   $ u m_0 cal(P) & lt.eq Pi_N #scale(x: 120%, y: 120%)[\[] ell rho_0 +
     ell^2 sigma \( rho_0 + rho_1 \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq 1 / 2 delta_0 eta_N u a sigma + Pi_N [ell rho_0 + ell^2 / eta_N \( rho_0^2 + rho_1^2 \)] .
   $ <four:maximal:end:penalty-loss>]
  Off the band the left side vanishes, so the final inequality holds everywhere. All weights in the loss are integrable:
  $ rho_0 = r^(- 4 - delta) in L^1 \, wide rho_0^2 in L^1 \, wide rho_1^2 = r^(- 4 gamma) in L^1 $
  on the four-dimensional end, using $delta > 0$ and $gamma > 1$.
    Their smooth extensions are bounded on the compact interior.
    In particular no integrability of $rho_1$ itself is being used.
  Insert (22.9) and (22.11) into (22.8), absorb the indicated nonnegative terms,
    and discard the remaining nonnegative bulk terms. This proves (22.7). Finally,
  $ ell + ell^2 / eta_N = e^(- epsilon.alt N) + e^(- epsilon.alt N \/ 2) \, $
  which tends to zero against every polynomial in $N$. The constants used to prove (22.1) have not entered this
    estimate. ◻
]

#proof[
  #emph[Completion of Proposition 71.] The threshold exterior and its all-cut comparison are supplied by Lemma 73.
    Propositions  89 and 90 construct the complete metric with the stated signs and decay.
    Its lower metric bound gives the asserted three-dimensional area comparison on each cut separately.
    Proposition 91 gives the energy estimate, since $ell = e^(- epsilon.alt N)$ and $eta_N = ell^(3 \/ 2)$.
    Every stated output is therefore established before the Riemannian Penrose inequality is applied. ◻
]

=== 22.3 A minimal enclosing hypersurface <a-minimal-enclosing-hypersurface>

The boundary $B$ has strictly negative mean curvature in $hat(g)$.
  We obtain the minimal boundary required for the Riemannian theorem from the full-perimeter enclosure
  proposition. Perimeter here means the full area of the measure-theoretic boundary of a set,
  including any portion coinciding with an obstacle.

#thm([Lemma 22.3.])[
  (Minimal enclosure).  #emph[The metric $hat(g)$ of Proposition 90 admits a nonempty compact smooth embedded
    minimal hypersurface $Sigma$ enclosing $B$. Its exterior is connected, complete with boundary,
    and has the same single asymptotically flat end. The hypersurface is outer area-minimizing,
    with disconnected competitors permitted, and its area $hat(A) = \| Sigma \|_(hat(g))$ satisfies
#[#set math.equation(numbering: n => "(22.12)")
 $ hat(A) gt.eq e^(- 3 epsilon.alt) A_(*) . $ <four:maximal:end:area-comparison>]

]
] <four:maximal:lem:minimal-enclosure>

#proof[
  For the classical codimension-one regularity background, see #cite(label("Federer1969")) Sections 5.3–5.4 and
    #cite(label("Federer1970")); the smooth-Riemannian formulation is #cite(label("Simon2014")) Chapter 7, §5,
    Theorem 5.8, p. 200. Apply Proposition 39 to $\( X \, g_X \) = \( Omega \, hat(g) \)$.
    The threshold construction gives a smooth connected orientable four-dimensional exterior with nonempty compact
    smooth boundary $B$ and exactly one end. Proposition 90 gives completeness with $B$ included and $hat(g) -
    delta = O_2 \( r^(- q) \)$ with $q > 1$. These are the full geometric hypotheses of the cited proposition;
    it imposes no scalar-curvature condition and does not require decay exponent two.
    Its perimeter counts the entire frontier, including contact with the obstacle.
  The strict inequality $hat(H)_B < 0$ places the minimizing frontier $Sigma$ strictly outside $B$ and makes it a
    nonempty compact smooth embedded minimal hypersurface. The same proposition gives its connected complete
    one-ended exterior and outer area-minimization with every component counted,
    including disconnected enclosing competitors.
  Every such cut encloses the original obstacle. The cut comparison in Lemma 73 gives $\| Sigma \|_g gt.eq A_(*)$.
    Restriction of $hat(g) gt.eq e^(- 2 epsilon.alt) g$ to each three-dimensional tangent plane gives
  $ \| Sigma \|_(hat(g)) gt.eq e^(- 3 epsilon.alt) \| Sigma \|_g gt.eq e^(- 3 epsilon.alt) A_(*) . $
  This proves the asserted area comparison. The argument uses the general full-perimeter proposition directly,
    with its full $q > 1$ decay range. An enclosure result requiring $O_2 \( r^(- 2) \)$ decay would not suffice
    for this application. ◻
]

=== 22.4 The Riemannian inequality and the ordered limits <the-riemannian-inequality-and-the-ordered-limits>

We use the following dimension-four instance of the boundary Riemannian Penrose inequality
  #cite(label("BrayLee2009")) Theorem 1.4, p. 84. Let $\( cal(E) \, g_(cal(E)) \)$ be a smooth connected
  four-dimensional Riemannian manifold, complete with its nonempty compact boundary included,
  having one asymptotically flat end. Suppose in that end

$ \( g_(cal(E)) \)_(i j) - delta_(i j) = O_2 \( r^(- p_0) \) \, quad p_0 > 1 \, wide R_(g_(cal(E))) =
  O \( r^(- s_0) \) \, quad s_0 > 4 \, $

and $R_(g_(cal(E))) gt.eq 0$ everywhere. If its boundary is minimal and outer area-minimizing, then

#[#set math.equation(numbering: n => "(22.13)")
 $ E_(g_(cal(E))) gt.eq 1 / 2 (frac(\| partial cal(E) \|_(g_(cal(E))), omega_3))^(2 \/ 3) .
   $ <four:maximal:end:bray-lee>]

The boundary may have one or more components, and the ADM normalization is $1 \/ \( 6 omega_3 \)$.
  The numerical inequality does not require a spin assumption;
  the additional spin hypothesis in the published theorem concerns its equality conclusion. We use only (22.13).

#proof[
  First keep one set of strict approximation data fixed. For fixed $epsilon.alt >
    0$ and each sufficiently large $N$, take the exhaustion limit of Proposition 90.
    Apply (22.13) to the exterior of $Sigma$ from Lemma 92, with metric $hat(g)$.
    That exterior is smooth and complete with boundary, has one end, and has nonnegative scalar curvature.
    Its decay exponents are $p_0 = q > 1$ and $s_0 = 4 + delta > 4$ by (22.2).
    Its boundary is compact, minimal, and outer area-minimizing by the lemma.
    Its ADM energy exists by Proposition 91 and is unchanged by restriction past the compact region.
    Thus every hypothesis of the Riemannian theorem has been checked for this new exterior.
  Equations (22.6), (22.7), and (22.12) give
  $ E_g + frac(Pi_N, 3 omega_3) (ell + ell^2 / eta_N) & gt.eq E_(hat(g)) gt.eq 1 / 2 (hat(A) / omega_3)^(2 \/ 3)\
 & gt.eq 1 / 2 e^(- 2 epsilon.alt) (A_(*) / omega_3)^(2 \/ 3) . $
  Let $N arrow.r oo$ with these strict data and $epsilon.alt$ fixed. The error vanishes by its polynomial bound.
    Letting $epsilon.alt arrow.b 0$ next yields
  $ E_g gt.eq 1 / 2 (A_(*) / omega_3)^(2 \/ 3) $
  for the strict data. No convergence of the metrics $hat(g)$ as $N arrow.r oo$ has been assumed:
    only their individual inequalities and the uniform deficit are used.
  Finally remove the strict approximation using Proposition 72.
    The approximation energies converge to the original $E$, and their enclosing infima $A_(*)$ converge to the
    original enclosing infimum. The given outer area-minimizing hypothesis,
    including the admissibility of $S$ itself and all disconnected enclosing competitors,
    identifies this infimum with $A = \| S \|_g$. Therefore
  $ #box(stroke: black, inset: 3pt, [$ E gt.eq 1 / 2 (frac(A, 2 pi^2))^(2 \/ 3) . $]) $
  The prescribed $P = 0$ and $E > 0$ identify this energy with the ADM rest mass $m = sqrt(E^2 - \| P \|^2) = E$.
    The original boundary was used with its future MOTS condition;
    no minimality or vanishing tangential trace of $K$ on that boundary was imposed. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
