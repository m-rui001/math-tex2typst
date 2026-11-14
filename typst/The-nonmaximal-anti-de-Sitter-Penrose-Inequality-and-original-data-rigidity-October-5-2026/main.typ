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

#align(center)[#text(size: 16pt, weight: "bold")[The nonmaximal anti-de Sitter Penrose Inequality \
and original-data rigidity]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

=== 1.1 History and scope <hist:history>

Penrose’s 1973 argument connected gravitational collapse and cosmic censorship with a lower bound for the mass in
  terms of black-hole area #cite(label("penrose1973")). In the asymptotically flat, time-symmetric setting,
  Huisken and Ilmanen proved the three-dimensional inequality for the area of each connected outermost minimal
  component by weak inverse mean curvature flow #cite(label("huiskenilmanen2001")).
  Bray’s conformal flow proved the bound for the total area of a possibly disconnected outermost minimal boundary
  #cite(label("bray2001")); Bray and Lee extended the Riemannian inequality to dimensions less than eight
  #cite(label("braylee2009")). These are scalar-curvature theorems for Riemannian metrics.
  Recovering an arbitrary original second fundamental form in an equality statement requires further arguments.

For cosmological constant $- 3$, the Schwarzschild–anti-de Sitter horizon relation is $M = \( r_h + r_h^3 \) \/
  2$. It leads to the asymptotically hyperbolic Penrose bound,
  whose mass convention comes from the metric mass integrals of Wang and Chruściel–Herzlich
  #cite(label("wang2001")) #cite(label("chruscielherzlich2003")).
  Earlier Riemannian results include the graphical estimates of Dahl,
  Gicquaud and Sakovich #cite(label("dahlgicquaudsakovich2013")),
  the sharp Inequality of de Lima and Girão for balanced hyperbolic graphs with scalar curvature at least $-
  6$ and a minimal horizon in a horizontal totally geodesic slice met orthogonally,
  whose projection is star-shaped and mean convex #cite(label("delimagirao2016")) Theorem 1.2,
  and Ambrozio’s Theorem for sufficiently small perturbations of a fixed positive-mass Schwarzschild–anti-de
  Sitter metric, with minimal boundary and scalar curvature at least $- 6$ #cite(label("ambrozio2015")).
  Lee and Neves treat a different asymptotically locally hyperbolic regime,
  using a nonpositive supremum of the mass aspect and a boundary component with the genus of conformal infinity
  #cite(label("leeneves2015")). For static systems, Borghini,
  Fogagnolo and Pinamonti characterize finite domains attaining equality in the substatic Heintze–Karcher
  inequality as warped products #cite(label("borghinifogagnolopinamonti2024")) Theorem 1.1.
  We use this finite-domain result after proving that the equality data force the static deficit to vanish,
  and then prove the global extension. The flow issue at infinity is substantive:
  Neves constructed an asymptotically hyperbolic inverse mean curvature flow lacking the convergence needed for
  the direct Hawking-mass argument #cite(label("neves2010")).

There are also perturbative results involving the second fundamental form.
  Khuri and Kopiński prove the inequality for small maximal vacuum conformal perturbations of
  Schwarzschild–anti-de Sitter data under a quantitative comparison between a weighted bulk norm and a
  boundary-related norm of the seed tensor #cite(label("khurikopinski2023")).
  The earlier method manuscript #cite(label("internalads")) treats a fixed seed and a fixed local maximal vacuum
  conformal branch; its quadratic-null directions require a fourth-order calculation.
  The asymptotically flat manuscript #cite(label("internalflat")) develops coupled deformation and original-data
  rigidity methods at zero cosmological constant. We use these as methodological antecedents and supply the
  arguments needed at the present hypotheses.

=== 1.2 Significance and technical contributions <hist:significance>

We establish the three-dimensional nonmaximal asymptotically anti-de Sitter spacetime Penrose Inequality for the
  precise class specified below. Its numerical assertion uses the full enclosing-area infimum of a possibly
  disconnected weakly future outer trapped boundary and the Lorentz norm of the four #emph[metric] fluxes.
  In the connected, outermost, outer area-minimizing future marginally outer trapped subclass,
  its equality assertion recovers the original pair $\( g \, K \)$ as a smooth proper spacelike hypersurface in
  the smooth maximal extension of Schwarzschild–anti-de Sitter spacetime of parameter exactly $M =
  m_(upright("AH"))$, with a full future horizon section (the bifurcation sphere is allowed) and an end reaching
  conformal infinity. This resolves the asymptotically anti-de Sitter spacetime Penrose Conjecture in this
  initial-data class, including its Riemannian specialization and original-data rigidity on the stated connected
  horizon subclass. The mass match concerns the designated initial slice;
  spatial chart covariance supplies no invariance under arbitrary changes of that slice.
  The assertions are initial-data statements and make no claim to prove cosmic censorship or an evolution theorem.

Three parts of the construction have uses beyond the model calculation.
  First, the coupled deformation combines weak trapping barriers with estimates that distinguish the constants
  required uniformly in the large profile parameter from those needed only after that parameter is fixed.
  A scalar regularity argument for a measurable rank-one axial coefficient and a bounded-input solution operator
  provide the analytic ingredients for the degree construction.
  Second, a primitive correcting the spatially varying lapse cancels mixed derivatives in the hyperbolic
  deformation; the resulting weighted divergence estimate controls all four mass fluxes and retains the full
  enclosing-area comparison. Third, equality is tested on the original constraints.
  The first stationarity argument determines the horizon surface gravity,
  and a causal adjoint with analysis across its null set produces the complete static quotient.
  Weighted improvement of its end evaluates the static Heintze–Karcher deficit in terms of the original mass.
  The equality data force its nonnegative interior defect to vanish.
  A finite horizon collar then attains exact equality, and the static equations give global Schwarzschild–anti-de
  Sitter identification. The remaining reconstruction recovers both original tensors and the proper hypersurface
  embedding, including its future horizon attachment and conformal infinity.

=== 1.3 The results <the-results>

The mass in this paper is the hyperbolic metric four-flux mass.
  The area is the infimum over full enclosing cuts, including all intrinsic boundary components.
  Precise definitions appear in Section 2.

#thm([Theorem 1.1.])[
  (Nonmaximal anti-de Sitter Penrose Inequality).  #emph[Let $\( Omega \, g \, K \)$ satisfy Definition 3,
    the same future boundary condition $H + "tr"_(T S) K lt.eq 0$ on every component,
    and the future-timelike metric mass condition in Definition 5. Then
#[#set math.equation(numbering: n => "(1.1)")
 $ m_(upright("AH")) \( g \) gt.eq sqrt(frac(A_min \( S \), 16 pi)) (1 + frac(A_min \( S \), 4 pi)) =
   frac(r_A + r_A^3, 2) . $ <eq:main-penrose>]

 The coefficient is sharp. No maximality assumption, restriction on the compact topology or boundary genera,
   or outermostness hypothesis is required.]
] <thm:main-numerical>

#thm([Theorem 1.2.])[
  (Original-data equality).  #emph[Assume in addition the connected horizon hypotheses of Definition 8.
    Equality in Equation (1.1) holds if and only if the original pair $\( g \, K \)$ is realized by a smooth
    proper spacelike embedding of $Omega$, with boundary, into the smooth maximally extended Schwarzschild–anti-de
    Sitter spacetime of parameter exactly $M = m_(upright("AH")) \( g \)$.
    Its interior lies in one black-hole exterior; its boundary maps diffeomorphically onto a full smooth spacelike
    cross-section of that exterior’s future event horizon, with the bifurcation sphere also allowed;
    and its unique end reaches that exterior’s conformal infinity.
    The embedding induces both $g$ and $K$ with the future-normal convention of Equation (2.5).]
] <thm:main-rigidity>

The mass match in Theorem 2 is part of the statement. It is not a consequence of being an arbitrary asymptotic
  time slice of a Schwarzschild–AdS spacetime. The theorem permits all smooth slices satisfying its intrinsic
  hypotheses and this computed mass match. The numerical theorem also allows nonoutermost boundaries;
  its equality configurations outside the connected horizon subclass are not classified here.

=== 1.4 Proof architecture <proof-architecture>

The numerical argument first establishes a fixed-chart time-component bound without assuming that its comparison
  mass is timelike. In the one-sign case, a conserved auxiliary stress has a flux that approaches the minimum
  enclosing area. Removing this stress at infinity changes the asymptotic model and produces the cubic area term.
  The resulting asymptotically flat data are handled by a coupled elliptic deformation and the Riemannian Penrose
  Inequality. A separate weighted deformation on the hyperbolic end removes a general original second fundamental
  form. Spatial Lorentz covariance then gives Equation (1.1).

The two coupled constructions require global existence, not just ellipticity of their scalar equations.
  We prove the necessary bounds, the boundary version of a rank-one measurable-coefficient gradient estimate,
  the bounded-input scalar solve, and degree invariance on the moving admissible regions.
  Every final small error uses an explicit parameter order.
  Constants used only for fixed-parameter compactness are kept separate from those that must be polynomial in the
  parameter.

Section 4 states the flat estimate and constructs its equations and lower-bound barriers.
  Section 5 supplies the local regularity estimate used in both deformations,
  and Section 6 proves existence and completes the flat mass comparison.
  Section 7 then adapts these tools to the hyperbolic end and proves the general numerical inequality.

For equality, variations of the original data produce a causal stationary field and identify the boundary
  conditions, including the surface gravity. Twist estimates and exclusion of an interior null set give a static
  quotient. Its normalized end, horizon area and surface gravity make the static Heintze–Karcher deficit vanish.
  A bounded elliptic exhaustion and the finite-domain equality theorem of Borghini–Fogagnolo–Pinamonti
  #cite(label("borghinifogagnolopinamonti2024")) Theorem 1.1 identify a warped horizon collar;
  the static equations extend this identification over the complete exterior.
  Finally we recover the original spacelike graph, including its future horizon boundary and its second
  fundamental form. Neither equality of a deformation metric nor an assumed spacetime realization replaces this
  last step.

Figure 1 records these dependencies.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-1.6, 1.26), [#text(size: 9pt)[\(a\) Numerical inequality]], anchor: "west", padding: 0.1176cm)
  content((0, 0), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Auxiliary stress#linebreak()Conserved; flux saturation#linebreak()Lemmas~3.12, 3.13]]])])
  content((3.85, 0), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Bend to a flat end#linebreak()Cubic mass correction#linebreak()Proposition~3.15]]])])
  content((7.7, 0), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[AF coupled deformation#linebreak()$R_( hat(g) ) gt.eq 0$#linebreak()Lemma~6.13]]])])
  content((11.55, 0), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Riemannian Penrose#linebreak()Flat mass estimate#linebreak()Theorem~6.15]]])])
  line((1.593, 0), (2.257, 0), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((5.443, 0), (6.107, 0), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((9.293, 0), (9.957, 0), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  content((0, -2.5), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[AH deformation#linebreak()$( hat(g) ,0)$#linebreak()Mass and area control#linebreak()Proposition~7.13]]])])
  content((3.85, -2.5), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[One-sign bound#linebreak()Applied to $( hat(g) ,0)$#linebreak()Theorem~3.1]]])])
  content((7.7, -2.5), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Fixed-chart bound for $g$#linebreak()$p_0(g) gt.eq (r_A+r_A^3)"/"2$#linebreak()Theorem~7.1]]])])
  content((11.55, -2.5), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Spatial Lorentz#linebreak()Balancing#linebreak()$m_( upright("AH") ) gt.eq (r_A+r_A^3)"/"2$#linebreak()Theorem~7.16]]])])
  line((11.55, -0.71), (11.55, -1.22), (3.85, -1.22), (3.85, -1.79), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  content((7.7, -1.22), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[ordered limits of inequalities]]])], anchor: "south")
  line((1.593, -2.5), (2.257, -2.5), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((5.443, -2.5), (6.107, -2.5), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((9.293, -2.5), (9.957, -2.5), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  content((-1.6, -3.8), [#text(size: 9pt)[\(b\) Equality on the connected horizon subclass]], anchor: "west", padding: 0.1176cm)
  content((0, -5.02), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Original-data variations#linebreak()At equality in $(g,K)$#linebreak()Section~8]]])])
  content((3.85, -5.02), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Causal adjoint#linebreak()$(u,X)$; horizon data#linebreak()Theorem~8.1]]])])
  content((7.7, -5.02), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[No interior null set#linebreak()Regular static quotient#linebreak()Theorem~9.1]]])])
  content((11.55, -5.02), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Weighted end estimates#linebreak()Normalized smooth end#linebreak()Proposition~10.4]]])])
  line((1.593, -5.02), (2.257, -5.02), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((5.443, -5.02), (6.107, -5.02), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((9.293, -5.02), (9.957, -5.02), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  content((3.85, -7.77), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Horizon area and gravity#linebreak()$|S|_h=4 pi r_h^2$#linebreak()$kappa = frac(1+3r_h^2, 2r_h)$#linebreak()Proposition~10.1]]])])
  content((7.7, -7.77), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Vanishing static deficit#linebreak()Global static model#linebreak()Theorem~11.3]]])])
  content((11.55, -7.77), [#box(width: 3.187cm, inset: 0.1235cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Original graph#linebreak()$(g,K)$, $M=m_( upright("AH") )$#linebreak()Full future horizon#linebreak()Conformal infinity#linebreak()Proposition~12.3]]])])
  line((7.7, -5.73), (7.7, -6.16), (3.85, -6.16), (3.85, -7.06), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((11.55, -5.73), (11.55, -6.44), (7.7, -6.44), (7.7, -7.06), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((5.443, -7.77), (6.107, -7.77), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
  line((9.293, -7.77), (9.957, -7.77), stroke: (paint: rgb("#404040"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, width: 0.12cm, fill: rgb("#404040"))))
})],
  caption: [Figure 1: Dependencies of the two arguments. AF means asymptotically flat and AH means asymptotically hyperbolic. Arrows indicate input to the next step. In (a), the one-sign theorem is first proved by the upper route and then applied to the AH comparison data; their mass covector need not be timelike. Only the original mass covector is balanced. In (b), equality and the numerical inequality give variations of the original data. The normalized end and the inherited horizon area and surface gravity jointly supply the static rigidity hypotheses. Numerical area comparisons use full enclosing cuts. The equality route uses no limit of the deformation metrics. ],
) <fig:proof-architecture>

The local conformal AdS and asymptotically flat rigidity manuscripts #cite(label("internalads"))
  #cite(label("internalflat")) motivate parts of the construction. No theorem from either is assumed:
  the reused arguments and all changes required by the present hypotheses are proved below.
  The public inputs are invoked with their local geometry, regularity,
  asymptotic and boundary hypotheses checked where they are used.

== 2 Data, enclosing cuts, and the metric mass <sec:setup>

We use the cosmological constant $Lambda = - 3$ and units $G = c = 1$. All initial data and boundaries are smooth.
  Norms at infinity are tensor norms in the hyperbolic metric, rather than norms of coordinate components.

#prodef([Definition 2.1.])[
  (Initial-data exterior).  An initial-data exterior is a connected orientable three-manifold $Omega$ with
    nonempty compact smooth boundary $S$, a Riemannian metric $g$, and a symmetric covariant tensor $K$.
    The metric space $\( Omega \, g \)$, with its boundary included, is complete and has exactly one end.
    Outside a compact set there is a chart $\( r_0 \, oo \) times bb(S)^2$ with
  #[#set math.equation(numbering: n => "(2.1)")
   $ b = frac(d r^2, 1 + r^2) + r^2 sigma \, wide eta = "arsinh" r \, $ <eq:setup-background>]
  where $sigma$ is the unit round metric. For some $0 < alpha < 1$ and $3 \/ 2 < tau < 3$, assume
  #[#set math.equation(numbering: n => "(2.2)")
   $ g - b in C_tau^(2 \, alpha) \, wide K in C_tau^(1 \, alpha) . $ <eq:setup-decay>]
  The space $C_tau^(k \, alpha)$ controls $e^(tau eta)$ times the $b$-norm of every covariant derivative through
    order $k$, and the corresponding weighted Hölder seminorms on $b$-unit balls.
    The noncosmological constraint densities are
  #[#set math.equation(numbering: n => "(2.3)")
   $ 16 pi mu = R_g + 6 + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide 8 pi J =
     "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] . $ <eq:setup-constraints>]
  We require
  #[#set math.equation(numbering: n => "(2.4)")
   $ mu gt.eq \| J \|_g \, wide integral_Omega sqrt(1 + r^2) #scale(x: 120%, y: 120%)[\(] mu + \| J \|_g + \|
     K \|_g^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) V_g < oo \, $ <eq:setup-dec>]
  where the positive weight is extended smoothly over the compact part.
    No restriction is placed on the compact topology, the number of boundary components, or their genera.
] <def:setup-data>

If $nu$ is the normal toward the designated exterior and infinity, set

#[#set math.equation(numbering: n => "(2.5)")
 $ H = "div"_S nu \, wide theta_(+) = H + "tr"_(T S) K . $ <eq:setup-expansion>]

The boundary hypothesis is $theta_(+) lt.eq 0$ on every component of $S$, with this same future sign.
  No condition on the other null expansion is imposed. A spacetime realization uses $K \( Y \, Z \) =
  overline(g) \( overline(nabla)_Y n \, Z \)$ for the future unit normal $n$.
  A surface with $theta_(+) = 0$ is a marginally outer trapped surface (MOTS).

#prodef([Definition 2.2.])[
  (Full enclosing cuts).  An admissible exterior region is a connected smooth codimension-zero submanifold with
    boundary $D subset Omega$, closed in $Omega$, whose interior lies in $"int"
    Omega$ and which contains the entire sufficiently distant end.
    An admissible cut is its full compact intrinsic boundary $Gamma = partial D$,
    assumed smoothly embedded and two-sided. Coincidence with $S$, or with some of its components, is allowed. Define
  #[#set math.equation(numbering: n => "(2.6)")
   $ A_min \( S \; g \) = inf_Gamma "Area"_g \( Gamma \) \, wide r_A =
     sqrt(frac(A_min \( S \; g \), 4 pi)) . $ <eq:setup-area>]
  We omit $g$ when it is fixed. The competitor $D = Omega$ has intrinsic boundary $S$;
    it has area $"Area"_g \( S \)$, not zero. Admissible cuts need not be minimal or trapped, and may be disconnected.
] <def:setup-cut>

There is no extension across $S$ in this definition. An enclosing minimization or trapped-region construction used
  below is always carried out in the given exterior with $S$ as an obstacle or an actual boundary.
  In particular, changing the exterior region requires comparison of the entire cut,
  including any retained components of $S$.

#prodef([Definition 2.3.])[
  (Hyperbolic metric four-flux).  Let $x_1 \, x_2 \, x_3$ be the coordinate functions on $bb(S)^2$, and put
  #[#set math.equation(numbering: n => "(2.7)")
   $ V_0 = sqrt(1 + r^2) \, wide V_i = r x_i quad \( 1 lt.eq i lt.eq 3 \) . $ <eq:setup-potentials>]
  For $e = g - b$ and a static potential $V$, define the one-form
  #[#set math.equation(numbering: n => "(2.8)")
   $ bb(U)_b \( V \, e \) = V #scale(x: 120%, y: 120%)[\(] "div"_b e -
     d "tr"_b e #scale(x: 120%, y: 120%)[\)] + \( "tr"_b e \) d V -
     e \( nabla_b V \, dot.op \) . $ <eq:setup-flux-form>]
  The four mass components are
  #[#set math.equation(numbering: n => "(2.9)")
   $ p_a \( g \) = frac(1, 16 pi) lim_(R arrow.r oo) integral_({ r = R }) bb(U)_b \( V_a \, e \) \( nu_b \) thin
     upright(d) A_b . $ <eq:setup-flux>]
  The target class requires these limits to be finite and future timelike: $p_0 > sqrt(p_1^2 + p_2^2 + p_3^2)$.
    Its mass is
  #[#set math.equation(numbering: n => "(2.10)")
   $ m_(upright("AH")) \( g \) = sqrt(p_0^2 - p_1^2 - p_2^2 - p_3^2) . $ <eq:setup-invariant-mass>]
  For auxiliary component estimates we do not impose timelikeness.
] <def:setup-mass>

The entries $p_i$ are spatial components of the metric mass covector.
  They are not ADM momentum or angular momentum. This paper makes no invariance assertion under arbitrary changes
  of asymptotic spacetime slice. The asymptotic data are $\( b \, 0 \)$ with $Lambda = - 3$.

#thm([Lemma 2.4.])[
  (Flux convergence and spatial covariance).  #emph[The decay and integrability in Definition 3 imply convergence
    of the four integrals in Equation (2.9). The same limits are obtained on any smooth exhaustion whose boundary
    escapes every compact set. Under a fixed hyperbolic background isometry the covector $p$ transforms by the
    corresponding Lorentz transformation. It is invariant, with this transformation understood,
    under admissible asymptotic spatial chart changes: both charts must satisfy the tensor-decay and
    weighted-integrability conditions of Definition 3. In particular,
    a future-timelike $p$ can be balanced by a spatial change of hyperbolic chart so that
    $\( p_0 \, p_1 \, p_2 \, p_3 \) = \( m_(upright("AH")) \, 0 \, 0 \, 0 \)$.]
] <lem:setup-mass-covariance>

#proof[
  Each $V_a$ satisfies $"Hess"_b V_a = V_a b$ and $Delta_b V_a = 3 V_a$. The scalar curvature linearization at $b$ is
  $ \( D R \)_b \( e \) = "div"_b "div"_b e - Delta_b "tr"_b e + 2 "tr"_b e . $
  Differentiating Equation (2.8) gives the exact identity
  #[#set math.equation(numbering: n => "(2.11)")
   $ "div"_b bb(U)_b \( V_a \, e \) = V_a \( D R \)_b \( e \) . $ <eq:setup-scalar-divergence>]
  In a sufficiently distant end write $R_g + 6 = \( D R \)_b \( e \) + Q \( e \)$, where
  $ \| Q \( e \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] \| e \| \| nabla_b^2 e \| + \| nabla_b e \|^2 + \| e \|^2
    #scale(x: 120%, y: 120%)[\)] . $
  The right side is $O \( e^(- 2 tau eta) \)$. Since $\| V_a \| lt.eq C e^eta$ and $d V_b =
    O \( e^(2 eta) \) d eta d A_sigma$, the product $V_a Q$ is integrable precisely with the sufficient condition
    $2 tau > 3$. Moreover,
  $ \| R_g + 6 \| lt.eq 16 pi mu + 4 \| K \|_g^2 \, $
  so $V_a \( R_g + 6 \)$ is integrable by Equation (2.4) and the uniform equivalence of $g$ and $b$ in the end.
    Equation (2.11) and the divergence theorem now make the fluxes Cauchy.
    The difference between their values on two escaping homologous cut boundaries is bounded by the integral of
    this absolutely integrable divergence over the intervening tail.
    This also proves the asserted exhaustion independence for boundaries enclosing the same compact region.
  In the hyperboloid model the four functions in Equation (2.7) are its ambient coordinate functions.
    A hyperbolic isometry therefore acts linearly on their span by a Lorentz matrix.
    The flux expression is linear in $V$ and natural under a background isometry.
    Its transformed coordinate spheres are an escaping exhaustion, to which the preceding argument applies.
    This proves the transformation law directly. The decay and weighted integrability remain valid because a fixed
    hyperbolic isometry changes $eta$ by a bounded amount. The more general admissible spatial chart covariance is
    the metric mass invariance Theorem of Chruściel–Herzlich #cite(label("chruscielherzlich2003")) Proposition 2.2
    and Theorem 2.3: its quadratic decay threshold and weighted scalar-integrability hypotheses have just been
    checked. Only the background-isometry case is needed to balance the mass in the numerical proof.
    Finally, elementary Lorentz linear algebra sends every future-timelike covector to its rest covector. ◻
]

#prodef([Remark 2.5.])[
  (Conformal normalization).  In three dimensions the linear flux for a pure conformal perturbation is
  #[#set math.equation(numbering: n => "(2.12)")
   $ bb(U)_b \( V \, 4 t b \) = - 8 \( V thin d t - t thin d V \) . $ <eq:setup-conformal-flux>]
  Indeed, $"tr"_b \( 4 t b \) = 12 t$, $"div"_b \( 4 t b \) = 4 d t$,
    and the last two terms of Equation (2.8) sum to $8 t thin d V$.
    For example, if $t = O_1 \( r^(- s) \)$, $g - b = O_1 \( r^(- tau) \)$, $2 s > 3$, and $s + tau > 3$, then
  $ e^(4 t) g - g - 4 t b = O_1 \( r^(- 2 s) \) + O_1 \( r^(- s - tau) \) . $
  Its flux against each static potential is $O \( r^(3 - 2 s) \) + O \( r^(3 - s - tau) \)$, which tends to zero.
    Thus Equation (2.12) gives the exact limiting mass change whenever those limits exist;
    weighted scalar-curvature integrability supplies their existence as above.
] <rem:setup-conformal-flux>

#prodef([Definition 2.6.])[
  (Connected horizon subclass).  The horizon subclass consists of the preceding data with $S$ connected,
    $theta_(+) \( S \) = 0$, and the following two properties.
    First, no compact smooth embedded two-sided enclosing surface contained entirely in $"int" Omega$,
    possibly disconnected and oriented on each component toward infinity, has $theta_(+) lt.eq 0$ everywhere.
    This is outermostness. Second, $"Area"_g \( S \) lt.eq "Area"_g \( Gamma \)$ for every full cut $Gamma$.
    This is outer area minimization, and gives $A_min \( S \) = "Area"_g \( S \)$.
] <def:setup-horizon>

#thm([Lemma 2.7.])[
  (Schwarzschild–AdS normalization).  #emph[For $M > 0$, let $F_M \( r \) = 1 + r^2 -
    2 M \/ r$ and let $r_h$ be its positive root. The metric $g_M = F_M^(- 1) d r^2 +
    r^2 sigma$ on $\[ r_h \, oo \)$, with its smooth minimal-boundary interpretation,
    has $\( p_0 \, p_1 \, p_2 \, p_3 \) = \( M \, 0 \, 0 \, 0 \)$.
    A full smooth spacelike cross-section of the future horizon in the regular extension of
#[#set math.equation(numbering: n => "(2.13)")
 $ overline(g)_M = - F_M thin d t^2 + F_M^(- 1) d r^2 + r^2 sigma $ <eq:setup-model-spacetime>]

 has area $4 pi r_h^2$, and $M = \( r_h + r_h^3 \) \/ 2$.]
] <lem:setup-model-mass>

#proof[
  In the radial $b$-orthonormal frame, $g_M - b$ has just one entry,
  $ q = frac(2 M, r F_M) \, $
  in the radial direction. Thus $bb(U)_b \( V_0 \, g_M - b \) \( nu_b \) = 2 V_0 coth eta thin q$.
    The normalized integral is $M \( 1 + r^2 \) \/ F_M$, which tends to $M$.
    The three other integrals vanish by the zero spherical averages of $x_i$.
    On the horizon the degenerate induced metric is the pullback of $r_h^2
    sigma$ from the space of null generators. A full spacelike cross-section projects diffeomorphically onto that
    sphere and therefore has its area. The relation between $M$ and $r_h$ follows from $F_M \( r_h \) = 0$. ◻
]

Throughout the proof, estimates denoted by $O_j$ include derivatives through order $j$ and the local Hölder
  control used in the relevant elliptic estimate. Hyperbolic unit-ball estimates are distinguished from asymptotic
  symbol estimates with derivatives $r partial_r$ and $partial_omega$.
  Preliminary approximation parameters are fixed before subsequent deformation parameters.
  The final numerical limits are limits of inequalities; no regular limiting deformation metric is assumed in the
  equality argument.

== 3 A saturating conserved stress and reduction to a flat end <sec:str-reduction>

Throughout this section, $A_g \( S \)$ denotes the full intrinsic-boundary infimum $A_min \( S \; g \)$ of
  Definition 4. All normals at the original boundary point into the designated exterior.
  On an end, $O_j \( r^(- a) \)$ denotes a bound by $C r^(- a)$ after at most $j$ derivatives chosen from $r
  partial_r$ and smooth angular vector fields. We write $O_oo$ when this holds for each fixed derivative order.
  Bounds in physical weighted Hölder spaces are stated separately; they do not, without further argument,
  assert bounds for all angular derivatives.

#thm([Theorem 3.1.])[
  (The one-sign component inequality).  #emph[Let $\( Omega \, g \, K \)$ satisfy Definition 3, and assume $H +
    "tr"_(T S) K lt.eq 0$ on every component of $S$, with the convention of Equation (2.5).
    Suppose that $K$ is compactly supported and that one of the two tensors
$ K - \( "tr"_g K \) g \, wide - K + \( "tr"_g K \) g $

 is positive semidefinite throughout $Omega$. In each fixed admissible hyperbolic chart for which the metric
   fluxes exist,
#[#set math.equation(numbering: n => "(3.1)")
 $ p_0 \( g \) gt.eq sqrt(frac(A_g \( S \), 16 pi)) + 1 / 2 (frac(A_g \( S \), 4 pi))^(3 \/ 2) .
   $ <eq:str-component-bound>]

 This assertion does not require the flux covector to be timelike.
   If that covector is future timelike, its Lorentz norm satisfies the same lower bound.]
] <thm:str-one-sign>

The asymptotically flat result used in the proof is Theorem 25. Its required interface is the following:
  a smooth exterior with one asymptotically Euclidean end, the full-cut convention above,
  a strictly negative future boundary expansion, and

#[#set math.equation(numbering: n => "(3.2)")
 $ R_q + \( "tr"_q B \)^2 - \| B \|_q^2 - 2 \| "div"_q \( B - \( "tr"_q B \) q \) \|_q & gt.eq
   c \( 1 + s \)^(- 3 - delta) \,\
q - delta_(upright("Eucl")) = O_oo \( s^(- 1) \) \, wide R_q & = O_oo \( s^(- 3 - delta) \) \,\
B = O_oo \( s^(- 2) \) \, wide "tr"_q B & = 0 quad upright("outside a compact set") \, $ <eq:str-flat-interface>]

where $c > 0$ and $0 < delta < 1$, has ADM metric energy at least $sqrt(A_q \( S \) \/ \( 16 pi \))$.
  That theorem is proved in this manuscript; it is not an additional premise.

=== 3.1 Conformal preparation with preservation of the component mass <conformal-preparation-with-preservation-of-the-component-mass>

It is useful to fix the constraint normalization

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(H)_g \( K \) = R_g + 6 + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide cal(J)_g \( K \) =
   "div"_g \( K - \( "tr"_g K \) g \) . $ <eq:str-constraint-normalization>]

The dominant energy condition is $cal(H)_g \( K \) gt.eq 2 \| cal(J)_g \( K \) \|_g$.

#thm([Lemma 3.2.])[
  (Preparation).  #emph[Under the hypotheses of Theorem 10,
    there are smooth data $\( g_i \, K_i \)$ on the same exterior, numbers $c_i > 0$,
    and a fixed $0 < delta < 1$ such that:]
  + #emph[$K_i$ is compactly supported, with the same global stress sign as $K$,
    and its future boundary expansion has the original weak sign;]
  + #emph[$cal(H)_(g_i) \( K_i \) - 2 \| cal(J)_(g_i) \( K_i \) \|_(g_i) gt.eq c_i \( 1 + r \)^(- 3 - delta)$,
    with $r$ smoothly extended over a compact region;]
  + #emph[$g_i = e^(4 v_i) b$ on an exact tail, where
#[#set math.equation(numbering: n => "(3.4)")
 $ v_i = r^(- 3) v_(3 \, i) \( omega \) - d_(0 \, i) r^(- 3 - delta) + O_oo \( r^(- 4) \) \, wide
   d_(0 \, i) > 0 \, $ <eq:str-prepared-expansion>]

 and $v_(3 \, i)$ is smooth;]
  + #emph[for a fixed $beta > 3 \/ 2$, $g_i arrow.r g$ and $K_i arrow.r
    K$ in physical weighted $C_beta^(2 \, alpha')$ and $C_beta^(1 \, alpha')$ norms, respectively,
    with any fixed sufficiently small $alpha' > 0$;]
  + #emph[$p_a \( g_i \) arrow.r p_a \( g \)$ for all four metric fluxes and $A_(g_i) \( S \) arrow.r A_g \( S \)$.]
  #emph[When $K = 0$, one may take $K_i = 0$. A minimal boundary remains minimal,
    and the convergence on fixed compact subsets is smooth if the original metric is smooth there.]
] <lem:str-preparation>

#proof[
  Choose
  #[#set math.equation(numbering: n => "(3.5)")
   $ 3 / 2 < beta < min { tau \, 3 } \, wide 0 < delta < min { 2 beta - 3 \, 1 } \, wide eta_R =
     R^(beta - tau) . $ <eq:str-preparation-parameters>]
  Take $R$ beyond the support of $K$ and a fixed cutoff $chi_R = chi \( r \/ R \)$, equal to one for $r lt.eq
    R$ and zero for $r gt.eq 2 R$. Set $q_R = b + chi_R \( g - b \)$ on the end and $q_R = g$ elsewhere.
    For large $R$ this is positive definite. The curvature cutoff error
  $ E_R = 1 / 8 { chi_R \( R_g + 6 \) - \( R_(q_R) + 6 \) } $
  is supported in $R lt.eq r lt.eq 2 R$ and satisfies
  #[#set math.equation(numbering: n => "(3.6)")
   $ parallel E_R parallel_(C_beta^(0 \, alpha')) lt.eq C eta_R . $ <eq:str-cutoff-source>]
  Indeed, the scalar-curvature formula uses two derivatives of the metric,
    physical derivatives of $chi \( r \/ R \)$ are uniformly bounded on this annulus, and every term contains $g -
    b$ or one of its first two physical derivatives. The quadratic terms decay faster.
    The metrics $q_R$ have uniform bounded-geometry coordinate estimates of the orders used here.
  Choose a nonnegative smooth compactly supported function $D gt.eq \| K \|_g$,
    with support in the region where $q_R = g$, and a smooth positive $w_0$ equal to $r^(- 3 - delta)$ far out. We solve
  #[#set math.equation(numbering: n => "(3.7)")
   $ {\( - Delta_(q_R) + 3 \) v = D sqrt(eta_R^2 + \| d v \|_(q_R)^2) + E_R + eta_R w_0 \,\
partial_nu v = 0 quad upright("on ") S \, wide v arrow.r 0 quad
  upright("at infinity") . $ <eq:str-preparation-equation>]
  Here the sign of the normal in the homogeneous Neumann condition is immaterial.
  We give the existence and uniform estimates. On a finite truncation put $v = 0$ on its outer sphere,
    and multiply the entire right side of Equation (3.7) by $lambda in \[ 0 \, 1 \]$.
    Write its gradient term as $W dot.op d v + F_D$, where $\| W \| lt.eq D$ and $0 lt.eq F_D lt.eq D eta_R$;
    for example this follows from
  $ sqrt(eta_R^2 + \| d v \|^2) = frac(\| d v \|^2, sqrt(eta_R^2 + \| d v \|^2)) + eta_R^2 /
    sqrt(eta_R^2 + \| d v \|^2) . $
  The maximum principle for $- Delta - W dot.op d + 3$, with the indicated mixed boundary conditions,
    bounds $\| v \|$ by $C eta_R$. Outside a fixed sphere containing $"supp" D$,
    the radial function $r^(- beta)$ satisfies
  $ \( - Delta_(q_R) + 3 \) r^(- beta) = { \( 3 - beta \) \( beta + 1 \) + o \( 1 \) } r^(- beta) gt.eq
    c_beta r^(- beta) $
  uniformly in $R$. Comparison using Equation (3.6) therefore sharpens the bound to
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| v \| lt.eq C eta_R \( 1 + r \)^(- beta) . $ <eq:str-v-height>]
  The boundary constants in these comparisons are independent of the outer truncation.
  For completeness, the required derivative bounds follow from scalar elliptic estimates without any
    coupled-system assumption. Divide the equation by $eta_R$ and write $u = v \/ eta_R$.
    Its gradient dependence is $D sqrt(1 + \| d u \|^2)$, with uniformly bounded first derivative in $d u$.
    Local $W^(2 \, p)$ estimates on physical balls, the corresponding Neumann or Dirichlet half-ball estimates,
    and first-derivative interpolation give a bound for $u$ in $W^(2 \, p)$ on smaller patches in terms of its
    already bounded height and the source $E_R \/ eta_R + w_0$.
    One can see the absorption directly by applying the estimate to nested cutoffs and using
  $ parallel d u parallel_(L^p) lt.eq epsilon parallel u parallel_(W^(2 \, p)) + C_epsilon parallel u parallel_(L^p) . $
  Choose $p > 3$ sufficiently large. Sobolev embedding makes $d u$ Hölder,
    and the scalar Schauder estimate then gives $C^(2 \, alpha')$ control.
    On the end the same argument is applied after multiplication by the local weight,
    which is comparable on every physical unit patch. Thus
  #[#set math.equation(numbering: n => "(3.9)")
   $ parallel v parallel_(C_beta^(2 \, alpha')) lt.eq C eta_R . $ <eq:str-v-estimate>]
  Lemma 119 supplies these scalar estimates and the finite-domain inverse.
    Its local reflection argument permits bounded drift, and its Schauder step is applied to the original
    one-sided equation after the gradient becomes Hölder. The ellipticity, boundary smoothness,
    source regularity and gradient-growth hypotheses have just been specified.
    The linearization of the finite-domain equation is
  $ - Delta_(q_R) + 3 -
    lambda D frac(chevron.l d v \, d \( thin dot.op thin \) chevron.r, sqrt(eta_R^2 + \| d v \|^2)) . $
  Its kernel vanishes by the same maximum principle. Its index is zero by continuation of the bounded drift from
    zero. It is therefore an isomorphism with these boundary conditions.
    The a priori bounds close the continuation from $lambda = 0$ to $1$.
    Exhaustion, the uniform estimates, and a diagonal subsequence give a smooth solution of Equation (3.7).
  On its exact hyperbolic tail, this solution satisfies $\( - Delta_b + 3 \) v = eta_R r^(- 3 - delta)$.
    Rotations commute with the operator and annihilate this radial source.
    Applying difference quotients, comparison by $r^(- beta')$ for any fixed $beta' < 3$,
    and local elliptic estimates gives the same decay for all fixed angular derivative orders.
    The hyperbolic Laplacian is
  $ Delta_b = \( 1 + r^2 \) partial_r^2 + \( 2 \/ r + 3 r \) partial_r + r^(- 2) Delta_sigma . $
  Consequently, for $beta'$ sufficiently close to $3$,
  $ \( - r^2 partial_r^2 - 3 r partial_r + 3 \) v = eta_R r^(- 3 - delta) + O_oo \( r^(- 2 - beta') \) . $
  Variation of constants for the two Euler solutions $r$ and $r^(- 3)$,
    with the growing solution excluded by decay, yields
  $ v = r^(- 3) v_3 \( omega \) - frac(eta_R, delta \( 4 + delta \)) r^(- 3 - delta) + O_oo \( r^(- 4) \) . $
  Angular difference quotients give a smooth $v_3$, and differentiating the radial equation gives the stated
    symbol estimates. In particular $d_0 = eta_R \/ \[ delta \( 4 + delta \) \] > 0$.
  Define
  $ tilde(g) = e^(4 v) q_R \, wide tilde(K) = e^(2 v) K . $
  The stress transforms as $tilde(K) - \( "tr"_(tilde(g)) tilde(K) \) tilde(g) =
    e^(2 v) \( K - \( "tr"_(q_R) K \) q_R \)$, so its sign is retained. The conformal boundary formula is
  $ H_(tilde(g)) + "tr"_T tilde(K) = e^(- 2 v) \( H_(q_R) + "tr"_T K + 4 partial_nu v \) \, $
  which preserves the original expansion sign. The scalar and divergence formulas are
  #[#set math.equation(numbering: n => "(3.10)")
   $ e^(4 v) cal(H)_(tilde(g)) \( tilde(K) \) & = cal(H)_(q_R) \( K \) + 6 \( e^(4 v) - 1 \) - 8 Delta_(q_R) v -
     8 \| d v \|_(q_R)^2 \,\
cal(J)_(tilde(g)) \( tilde(K) \) & = e^(- 2 v) { cal(J)_(q_R) \( K \) +
  4 K \( nabla v \, dot.op \) } . $ <eq:str-conformal-hamiltonian>]
  The momentum norm in the second formula gains a further $e^(- 2 v)$.
    Substituting Equation (3.7), using $D sqrt(eta_R^2 + \| d v \|^2) gt.eq \| K \| \| d v \|$,
    and using the original DEC on the support of $K$ and its scalar version outside that support, gives
  $ e^(4 v) { cal(H)_(tilde(g)) \( tilde(K) \) - 2 \| cal(J)_(tilde(g)) \( tilde(K) \) \| } gt.eq 8 eta_R w_0 -
    8 \| d v \|^2 + 6 \( e^(4 v) - 1 \) - 24 v . $
  The last two terms are nonnegative. Equation (3.9) and $2 beta > 3 + delta$ give $\| d v \|^2 lt.eq
    C eta_R^2 \( 1 + r \)^(- 3 - delta)$. For large $R$ the required strict margin follows.
  Uniform bilinear convergence of $tilde(g)$ to $g$ gives convergence of every full-cut infimum:
    if $\( 1 - epsilon.alt \) g lt.eq tilde(g) lt.eq \( 1 + epsilon.alt \) g$,
    the same factors bound all two-dimensional areas, hence their infima.
    To verify mass convergence, observe outside $"supp" D$ that
  $ e^(4 v) \( R_(tilde(g)) + 6 \) = chi_R \( R_g + 6 \) + 8 eta_R w_0 + O \( v^2 + \| d v \|^2 \) . $
  The weighted integrals of the right side on distant tails are uniformly small.
    The scalar-linearization divergence formula in Lemma 6 has quadratic remainder bounded by $C V_0
    r^(- 2 beta)$, whose integral is finite because $beta > 3 \/ 2$.
    Compare the fluxes first on a fixed sphere, where local convergence applies,
    and then bound both tails by these integrals. Since $\| V_a \| lt.eq V_0$,
    this proves convergence for all four fluxes. Finally, for $K = 0$, $D =
    0$ and the correction equation is linear on each fixed compact subset for all sufficiently large $R$.
    Differentiated local estimates prove the asserted smooth convergence.
    Relabeling a sequence $R arrow.r oo$ proves the lemma. ◻
]

=== 3.2 Full-cut comparison under addition of a short collar <full-cut-comparison-under-addition-of-a-short-collar>

#thm([Lemma 3.3.])[
  (A collar with almost unchanged cut infimum).  #emph[Let $\( Omega \, g \)$ be smooth up to its compact
    boundary. For every sufficiently small $epsilon > 0$ there is an enlarged exterior
    $\( Omega_epsilon \, g_epsilon \)$, obtained by adding a collar on the inner side of every boundary component,
    which agrees with $g$ on $Omega$, has a product metric near its new boundary, and satisfies
#[#set math.equation(numbering: n => "(3.11)")
 $ A_(g_epsilon) \( partial Omega_epsilon \) gt.eq \( 1 - o \( 1 \) \) A_g \( S \) wide \( epsilon arrow.b 0 \) .
   $ <eq:str-collar-area>]

 No constraint inequality on the added collar is required.]
] <lem:str-added-collar>

#proof[
  Use disjoint Gaussian collars $\[ 0 \, L \] times S_j$ with metric $d x^2 + q_j \( x \)$,
    where $L > 0$ is fixed. Extend $q_j$ smoothly to $\[ - epsilon \, 0 \]$.
    Since $q_j \( x \) = q_j \( 0 \) + O \( epsilon \)$ there,
    a cutoff to the constant $q_j \( - epsilon \)$ near $- epsilon$ changes only the metric values by
    $O \( epsilon \)$; derivatives may depend on $epsilon$. Choose a smooth map $F_epsilon : \[ - epsilon \, L \]
    arrow.r \[ 0 \, L \]$ equal to the identity near $L$, mapping endpoints to endpoints,
    and satisfying $F_epsilon - x = O \( epsilon \)$ and $F'_epsilon = 1 + O \( epsilon \/ L \)$.
    Its product with the identity on $S_j$, extended by the identity elsewhere, is a diffeomorphism $Phi_epsilon :
    Omega_epsilon arrow.r Omega$ with
  $ \( 1 - o \( 1 \) \) g_epsilon lt.eq Phi_epsilon^(*) g lt.eq \( 1 + o \( 1 \) \) g_epsilon . $
  This diffeomorphism maps a connected exterior submanifold and its entire intrinsic boundary to another of the
    same type. Applying the area comparison to every such cut proves Equation (3.11).
    The new product face has mean curvature zero. ◻
]

=== 3.3 The nonlinear Dirichlet problem <str-pde-section>

For $s gt.eq 0$, define $t \( s \) in \[ 0 \, 1 \)$ by

#[#set math.equation(numbering: n => "(3.12)")
 $ s^2 = frac(t, 1 - t^(3 \/ 2)) \, wide b \( s \) = frac(s t' \( s \), t \( s \)) =
   frac(4 \( 1 - t^(3 \/ 2) \), 2 + t^(3 \/ 2)) . $ <str-pde-law>]

The limiting value of $b$ at zero is $2$. Set $a \( s \) = t \( s \) \/ s^2$, with $a \( 0 \) = 1$. Then

#[#set math.equation(numbering: n => "(3.13)")
 $ a + s^3 a^(3 \/ 2) = 1 \,\
a = 1 - s^3 + O \( s^6 \) \, wide t = s^2 - s^5 + O \( s^8 \) wide \( s arrow.b 0 \) \,\
b s^2 = frac(4 t, 2 + t^(3 \/ 2)) arrow.r 4 / 3 wide \( s arrow.r oo \) . $ <str-pde-law-limits>]

In particular, $0 < b lt.eq 2$ and $inf_(s gt.eq 0) b \( s \) \( 1 + s^2 \) > 0$.
  The vector $t \( \| d f \|_g \) nabla_g f \/ \| d f \|_g$ is defined to be zero at critical points.
  Its continuous dependence on $d f$ will always be understood in this sense.

#thm([Theorem 3.4.])[
  (Fixed-height stress potential).  #emph[ Let $\( X \, g \)$ be a connected smooth complete three-dimensional
    exterior with compact smooth nonempty boundary, exactly one end, and a smooth metric up to its boundary.
    Let $H_(partial X) lt.eq 0$, for the normal pointing into $X$. Suppose that on the end, with $z = r^(- 1)$,
#[#set math.equation(numbering: n => "(3.14)")
 $ g = z^(- 2) macron(g) \, wide macron(g) = e^(4 v) (frac(d z^2, 1 + z^2) + sigma) \, wide v =
   z^3 v_3 \( omega \) - d z^(3 + delta) + O_oo \( z^4 \) \, $ <str-pde-prepared-end>]

 where $v_3$ is smooth, $0 < delta < 1$, and the remainder and its tangential derivatives satisfy the indicated
   symbol estimates. For every $D > 0$ there is a unique bounded weak solution
#[#set math.equation(numbering: n => "(3.15)")
 $ "div"_g (t \( \| d f \|_g \) frac(nabla_g f, \| d f \|_g)) = 0 \, wide f \|_(partial X) = D \, wide
   lim_(r arrow.r oo) f = 0 . $ <str-pde-dirichlet>]

 It satisfies $0 < f < D$ in the interior, has bounded physical gradient,
   belongs to $C^(1 \, theta)$ on compact subsets including the finite boundary for some $theta > 0$,
   and is smooth wherever $d f eq.not 0$. On a collar of conformal infinity it is noncritical and
#[#set math.equation(numbering: n => "(3.16)")
 $ f = z C_f \( omega \) + R_f \, wide C_f in C^oo \( bb(S)^2 \) \, wide C_f > 0 \,\
\| \( z partial_z \)^j partial_omega^nu R_f \| lt.eq C_(j \, nu) z^2 quad \( 0 lt.eq j lt.eq 2 \) .
  $ <str-pde-end-expansion>]

 The constants can depend on $D$ and the fixed geometry. In particular,
#[#set math.equation(numbering: n => "(3.17)")
 $ \| d f \|_g = z C_f + O \( z^2 \) \, wide t \( \| d f \|_g \) = z^2 C_f^2 + O \( z^3 \) \,\
- lim_(r arrow.r oo) integral_({ r = upright("const") }) t \( \| d f \|_g \) ⟨frac(nabla_g f, \| d f \|_g) \,
  nu_g⟩ d A_g = integral_(bb(S)^2) C_f^2 thin d A_sigma . $ <str-pde-end-flux>]

]
] <thm:str-stress-dirichlet>

We give the a priori estimates and the existence argument separately.
  In what follows, constants are independent of the outer truncation and of the regularization parameter,
  unless stated otherwise.

#thm([Lemma 3.5.])[
  (Regularization and the public regularity input).  #emph[For sufficiently small $h > 0$,
    choose a smooth $b_h$ equal to $1$ on $\[ 0 \, h \/ 2 \]$, equal to $b$ on $\[ 2 h \, oo \)$,
    and between $1$ and $2$ on the intervening interval. Define $t_h$ by $s t'_h \/ t_h =
    b_h$ and $t_h \( 2 h \) = t \( 2 h \)$. For each fixed $M < oo$,
#[#set math.equation(numbering: n => "(3.18)")
 $ c_M \( h + s \) s lt.eq t_h \( s \) lt.eq C_M \( h + s \) s \, wide c_M \( h + s \) lt.eq t'_h \( s \) lt.eq
   C_M \( h + s \) quad \( 0 lt.eq s lt.eq M \) . $ <str-pde-regularized-structure>]

 Here $t_h \( s \) \/ s$ is constant near zero, so the regularized vector field is smooth at the zero covector.
   On coordinate patches with uniformly controlled metric and first derivatives, its density
$ A_h^i \( x \, p \) = sqrt(det g) thin frac(t_h \( \| p \|_g \), \| p \|_g) g^(i j) p_j $

 obeys, for $\| p \| lt.eq M$,
#[#set math.equation(numbering: n => "(3.19)")
 $ lambda_M \( h^2 + \| p \|^2 \)^(1 \/ 2) \| zeta \|^2 & lt.eq D_p A_h \[ zeta \, zeta \] \,
   wide \| D_p A_h \| lt.eq Lambda_M \( h^2 + \| p \|^2 \)^(1 \/ 2) \,\
\| A_h \| + \| partial_x A_h \| & lt.eq C_M \( h + \| p \| \) \| p \| . $ <str-pde-density-structure>]

 Once an a priori gradient bound $M$ has been established,
   the field can be extended for $\| p \| > M$ to satisfy these inequalities globally,
   with possibly changed constants independent of $h$.]
  #emph[Consequently bounded weak solutions with this gradient bound have local $C^(1 \, theta)$ estimates,
    including Dirichlet boundary patches, uniformly in $h$. On interior unit patches for $h = 0$,
    the estimate can be normalized to give
#[#set math.equation(numbering: n => "(3.20)")
 $ sup_(B_(1 \/ 2)) \| d f \|_g lt.eq C "osc"_(B_1) f \, $ <str-pde-oscillation-gradient>]

 provided the same fixed extension and the same structural constants apply on the patch.
   Smooth boundary data on finite boundary patches are allowed.]
] <str-pde-regularity-input>

#proof[
  Below $h \/ 2$ the normalization gives $t_h \( s \) = c_h s$ with $c_h asymp h$.
    On the transition interval $s asymp h$, $t_h asymp h^2$, and $b_h in \[ 1 \, 2 \]$.
    Above it the inequalities follow from $t \/ s^2 > 0$ and $b > 0$ on a bounded interval.
    The radial and tangential eigenvalues of the covector derivative are $t'_h$ and $t_h \/ s$.
    Metric differentiation costs at most a constant times $\| p \|_g$ in differentiating $\| p \|_g$,
    and $s t'_h = b_h t_h lt.eq 2 t_h$. These facts prove (3.19).
    For example, outside a slightly larger bounded-gradient interval one may interpolate the logarithmic
    derivative to $2$ and then continue by a quadratic flux law.
    Positive lower and upper bounds for that logarithmic derivative give the required global extension.
    This extension is used only after the gradient bound; it is not an existence argument for the saturating law.
  We specify the hypotheses of the regularity theorem. For $- partial_i A^i \( x \, u \, D u \) =
    B \( x \, u \, D u \)$ on a $C^(1 \, alpha)$ domain, Appendix Theorem A.1 of #cite(label("porrettaveron2009"))
    permits
  $ lambda \( mu^2 + \| p \|^2 \)^(\( p_0 - 2 \) \/ 2) I lt.eq D_p A lt.eq
    Lambda \( mu^2 + \| p \|^2 \)^(\( p_0 - 2 \) \/ 2) I \, $
  an analogous bound for $\| D_p A \|$, and the spatial and scalar continuity condition
  $ \| A \( x \, s \, p \) - A \( y \, t \, p \) \| lt.eq
    C \( 1 + \| p \|^(p_0 - 2) + \| p \|^(p_0 - 1) \) \( \| x - y \|^alpha + \| s - t \|^alpha \) \,
    wide \| B \| lt.eq C \( 1 + \| p \|^(p_0) \) . $
  For bounded weak solutions it yields a Hölder continuous gradient up to a $C^(1 \, alpha)$ Dirichlet boundary;
    the same local argument gives the interior estimate. We apply it with $p_0 = 3$, $mu = h$,
    no scalar dependence, and $B = 0$. The metric bounds and (3.19) verify every displayed condition;
    constants on a fixed height and gradient range are uniform in $h$.
    At a finite Dirichlet face the datum is constant; subtracting that constant reduces a boundary patch to the
    homogeneous theorem. The finitely many smooth boundary components are disjoint,
    so these patches can be chosen separately. At conformal infinity the datum is already zero.
    The interior gradient estimates originate in #cite(label("tolksdorf1984")),
    and the frozen boundary estimate used in the proof is the boundary regularity estimate of
    #cite(label("lieberman1988")). We use the stated Appendix theorem as the precise boundary input.
  For completeness, normalization removes any additive constant in the interior gradient bound.
    Extend the unregularized density with $D_p A asymp \| p \|$ and $\| partial_x A \| lt.eq C \| p \|^2$.
    If $m = "osc"_(B_1) f > 0$, subtract the infimum and put $u = f \/ m$.
    The equation for $u$ has density $A_m \( x \, p \) = m^(- 2) A \( x \, m p \)$,
    whose structural constants do not depend on $m$. Since $0 lt.eq u lt.eq 1$,
    the local gradient estimate for $u$ is uniform. Multiplication by $m$ proves (3.20).
    The case $m = 0$ is immediate. ◻
]

#thm([Lemma 3.6.])[
  (Boundary barriers and global gradient bound).  #emph[Let $f$ be a classical regularized solution on a
    truncation $X_R$, with boundary values $D'$ at the finite boundary and zero at $r = R$, where $0 lt.eq
    D' lt.eq D$. Then
#[#set math.equation(numbering: n => "(3.21)")
 $ 0 lt.eq f lt.eq D \, wide \| d f \|_g lt.eq M_D \, wide f lt.eq C_D r^(- xi) quad \( r gt.eq r_1 \) \,
   $ <str-pde-global-bounds>]

 for any fixed $0 < xi < 1$ and suitable $r_1 \, C_D \, M_D$ independent of small $h$ and sufficiently large $R$.]
] <str-pde-global-gradient>

#proof[
  At a noncritical point put $s = \| d f \|_g$, $e = nabla f \/ s$, and
  $ L f = A^(i j) nabla_i nabla_j f = 0 \, wide A = g^(- 1) + \( b_h - 1 \) e ⊗ e . $
  The maximum principle gives the height bound. Let $d$ be the inward distance from the finite boundary.
    Its level sets have mean curvature $H \( d \) = Delta_g d lt.eq C d$ in a fixed collar, since $H \( 0 \) lt.eq
    0$. Consider
  $ underline(f) = D' - gamma \( d \) \, wide gamma' \( d \) = c / sqrt(d^2 + d_(*)^2) . $
  The radial operator on this function is
  #[#set math.equation(numbering: n => "(3.22)")
   $ L underline(f) = gamma' (frac(b_h \( gamma' \) d, d^2 + d_(*)^2) - H \( d \)) . $ <str-pde-inner-barrier>]
  Uniformly in $h$, $b_h \( s \) \( 1 + s^2 \) gt.eq c_0 > 0$, and hence
  $ frac(b_h \( gamma' \), d^2 + d_(*)^2) gt.eq frac(c_0, d^2 + d_(*)^2 + c^2) . $
  Choose the collar length $ell$ and $c > 0$ small first; then choose $d_(*) > 0$ sufficiently small.
    The last bound makes (3.22) nonnegative on $\[ 0 \, ell \]$, while $gamma \( ell \) =
    c "arsinh" \( ell \/ d_(*) \) gt.eq D$. Comparison with $underline(f)$ and the constant upper barrier gives a
    uniform finite-boundary gradient bound $c \/ d_(*)$.
  On the end, for $F \( r \) = r^(- xi)$, the leading radial operator is $xi \( b_h xi - 2 \) r^(- xi)$,
    with relative error tending to zero uniformly for $0 < b_h lt.eq 2$.
    Thus $F$ is a strict supersolution beyond a fixed sphere, uniformly in any positive multiple of $F$.
    Comparison with $K_D \( r^(- xi) - R^(- xi) \)$ gives both the last estimate in (3.21) and the outer-boundary
    gradient bound. Choose $K_D$ at the fixed inner sphere before sending $R$ to infinity;
    for $R$ at least twice its radius the required $K_D$ is uniform.
  It remains to exclude a large interior gradient. The following calculation is for $s gt.eq s_0$, where $b_h =
    b$. Writing $x = t^(3 \/ 2)$ gives
  $ b + s b' = b (1 - frac(18 x, \( 2 + x \)^2)) . $
  Thus, for fixed sufficiently large $s_0$, $b < 1$ and $b + s b' < 0$.
    At a point with first frame vector $e$, differentiating $L f =
    0$ and commuting covariant derivatives yields the exact identity
  #[#set math.equation(numbering: n => "(3.23)")
   $ L log s & = 1 / s^2 #scale(x: 180%, y: 180%)[\(] \| "Hess" f \|_(e^perp times e^perp)^2 + \( 1 - b \) \|
     "Hess" f \( e \, dot.op \) \|_(e^perp)^2 #scale(x: 180%, y: 180%)[\)]\
 & quad - frac(b + s b', s^2) "Hess" f \( e \, e \)^2 + "Ric"_g \( e \, e \) . $ <str-pde-log-gradient>]
  To see the coefficients, differentiate $A$ in the $e$ direction:
    its contraction with $"Hess" f$ is $b' "Hess" f \( e \, e \)^2 +
    2 \( b - 1 \) s^(- 1) \| "Hess" f \( e \, dot.op \) \|_(e^perp)^2$.
    The two derivatives of $log s$ then leave exactly the three quadratic terms displayed.
    In the curvature commutator the additional $\( b - 1 \) e ⊗ e$ term vanishes by antisymmetry,
    leaving $"Ric" \( e \, e \)$. The Ricci curvature is bounded below on the whole exterior, so $L log s gt.eq -
    C$. Moreover $L \( f^2 \) = 2 b s^2$ and $inf_(s gt.eq s_0) b s^2 > 0$. Choose $c_1$ so large that
  $ L \( log s + c_1 f^2 \) > 0 wide \( s gt.eq s_0 \) . $
  An interior maximum in this range is impossible. The two boundary gradient bounds and $0 lt.eq f lt.eq
    D$ therefore bound the maximum of $log s + c_1 f^2$, and then $s$, everywhere.
    At a critical point $log s = - oo$, so such points cause no difficulty in this maximum argument. ◻
]

#proof[
  #emph[Existence, uniqueness, and finite-boundary regularity in Theorem 3.4.] Fix $h >
    0$ and a finite smooth truncation. Use the homotopy of boundary values $lambda D$, $0 lt.eq lambda lt.eq 1$,
    for the original regularized saturating equation. At $lambda = 0$ the zero solution exists.
    For fixed $h$ and on the gradient range of Lemma 15, the operator is uniformly elliptic and smooth in the
    covector. Its linearization has no zeroth-order term, is invertible with homogeneous Dirichlet data by the
    maximum principle and linear elliptic solvability, and gives openness.
    For closedness, first apply Lemma 14 using the already established gradient bound.
    Its extension agrees with the original flux on every solution.
    This gives a common $C^(1 \, theta)$ bound; the ordinary uniformly elliptic Schauder estimates for this fixed
    $h$ then give $C^(2 \, theta')$ bounds and the required compactness.
    The continuity method therefore reaches $lambda = 1$; the linear Dirichlet solvability and Schauder estimates
    used here follow from Lemma 119, including its general-principal all-Dirichlet conclusion.
    No uniform ellipticity as $h arrow.b 0$ is asserted at this step.
  Now use the estimates that are uniform in $h$ and in the outer truncation.
    On every fixed interior or finite-boundary patch, the $C^(1 \, theta)$ estimates permit a diagonal $C^1$ limit
    as $h arrow.b 0$ and $R arrow.r oo$. The fluxes converge locally uniformly,
    so the weak equation and finite Dirichlet trace pass to the limit.
    The common bound $C_D r^(- xi)$ gives the zero limiting value at infinity.
    Interior elliptic bootstrap applies on every set where $d f eq.not 0$.
  The unregularized flux is strictly monotone in the covector:
    its radial potential has derivative $t \( s \)$, with $t' > 0$ for $s > 0$.
    For two solutions $f_1 \, f_2$, test the difference of the weak equations by $\( f_1 - f_2 - epsilon \)_(+)$.
    This test has compact support, since both functions tend uniformly to zero at infinity,
    and has zero trace on the finite boundary. Strict monotonicity forces its gradient to vanish.
    It is therefore zero; letting $epsilon arrow.b 0$ proves $f_1 lt.eq f_2$,
    and interchanging the solutions proves uniqueness. The same comparison proves monotonicity in $D$.
    Positivity can be propagated by a direct local comparison.
    On a compact geodesic annulus $r_0 < 𝜚 < r_1$ lying below the injectivity radius, take $w =
    A \( e^(- k 𝜚^2) - e^(- k r_1^2) \)$. Its radial operator is $b w'' + w' Delta_g 𝜚$.
    First choose $k$ so large that $b_0 \( 2 k 𝜚 - 1 \/ 𝜚 \) gt.eq Delta_g 𝜚$ on the annulus, where $b_0 =
    min_(0 lt.eq s lt.eq 1) b \( s \) > 0$. Then take $A > 0$ small enough that $\| d w \| lt.eq
    1$ and the inner boundary value of $w$ is below a given positive minimum of $f$.
    Since $w'' \/ \( - w' \) = 2 k 𝜚 - 1 \/ 𝜚$, this is a positive subsolution, zero at the outer sphere.
    Weak comparison propagates positivity from the inner ball to the larger ball.
    The finite-boundary barrier supplies an initial positive collar;
    a finite chain of interior balls along any path proves $f > 0$ throughout the connected interior.
    Apply the same argument to $D - f$, which solves the same odd-flux equation and is positive near infinity,
    to obtain $f < D$. This completes the asserted existence and finite-boundary statements. ◻
]

=== 3.4 The conformal boundary and its expansion <the-conformal-boundary-and-its-expansion>

#thm([Lemma 3.7.])[
  (Linear height and physical-gradient bounds at infinity).  #emph[For the solution in Theorem 3.4 there are $c \,
    C \, Q > 0$ and a collar $0 < z < z_0$ such that
#[#set math.equation(numbering: n => "(3.24)")
 $ c z lt.eq f lt.eq C z \, wide \| d f \|_g lt.eq Q z . $ <str-pde-linear-bounds>]

 These constants can be chosen uniformly for a family whenever the coarse bounds $f lt.eq C_0 z^xi$,
   a positive lower bound on one fixed inner sphere, local physical gradient bounds,
   and the compact metric bounds used in the proof are uniform.]
] <str-pde-linear-end-bounds>

#proof[
  There is a useful radial identity that also applies to the families considered below.
    For $g = z^(- 2) macron(g)$, put $u = \| d z \|_(macron(g))^2$ and $macron(e) =
    nabla_(macron(g)) z \/ sqrt(u)$. If $F' > 0$, the operator on $F \( z \)$, divided by $z^2 u$, is
  #[#set math.equation(numbering: n => "(3.25)")
   $ b F'' + (frac(b - 2, z) + E) F' \, wide E =
     frac(Delta_(macron(g)) z + \( b - 1 \) "Hess"_(macron(g)) z \( macron(e) \, macron(e) \), u) \, wide b =
     b \( z sqrt(u) F' \) . $ <str-pde-compact-radial>]
  Indeed $"Hess"_g z = "Hess"_(macron(g)) z + 2 z^(- 1) d z ⊗ d z - z^(- 1) u macron(g)$ and $Delta_g z =
    z^2 Delta_(macron(g)) z - z u$. For (3.14),
  $ E = frac(b z, 1 + z^2) - 2 \( b - 2 \) v_z = O \( z \) $
  uniformly for $0 < b lt.eq 2$. More generally, if $macron(g) - h_0 =
    O_2 \( z^beta \)$ with $h_0 = \( 1 + z^2 \)^(- 1) d z^2 + sigma$ and $beta > 1$, then $E = O \( z \) +
    O \( z^(beta - 1) \)$, again uniformly in $b$.
  Choose $F_(+) \( z \) = A \( z - c_2 z^2 \)$ with a fixed $c_2 > 0$.
    The term $\( b - 2 \) F'_(+) \/ z$ is nonpositive. Make $z_0$ small and take $A$ sufficiently large for
    $F_(+) \( z_0 \) gt.eq f \( z_0 \, dot.op \)$. The order of these choices can be made consistent with small
    physical slope: the coarse bound allows $A = 2 C_0 z_0^(xi - 1)$, so $z sqrt(u) F'_(+) lt.eq C C_0 z_0^xi$.
    Thus $b gt.eq 1$ on the whole collar after reducing $z_0$.
    The negative term $- 2 A c_2 b$ then dominates $E F'_(+)$.
    Hence $F_(+)$ is a supersolution, and comparison gives $f lt.eq F_(+)$.
    For the lower barrier take $F_(-) \( z \) = a_0 \( z + c_2 z^2 \)$,
    with $a_0 > 0$ small enough to lie below the positive minimum of $f$ on $z = z_0$.
    Here $b = 2 - O \( a_0^3 z^3 \)$, so the unfavorable term $\( b - 2 \) F'_(-) \/ z$ is $O \( a_0^4 z^2 \)$,
    while $b F''_(-)$ has a positive constant multiple of $a_0$.
    Reducing the collar if needed makes this a subsolution. For the upper comparison test by
    $\( f - F_(+) - epsilon \)_(+)$; for the lower comparison use $\( F_(-) - f - epsilon \)_(+)$.
    The limiting zero boundary values make both tests compactly supported for every $epsilon > 0$,
    and their traces vanish on the inner sphere. Monotonicity and then $epsilon arrow.b
    0$ justify both comparisons at infinity. They prove the height bounds in (3.24).
  Physical balls of a fixed small radius in this collar have uniform metric bounds;
    $z$ is comparable to its central value throughout each ball.
    The height estimate gives oscillation $O \( z \)$ there. Apply (3.20) using the bounded-gradient extension
    furnished by the global bound (or the asserted uniform local bound for a family).
    It gives $\| d f \|_g = O \( z \)$. All the choices above use only the quantities listed in the statement,
    proving the uniform version. ◻
]

#thm([Lemma 3.8.])[
  (Compactified equation and boundary jet).  #emph[Under (3.14) and (3.24), the expansion (3.16) holds.]
] <str-pde-boundary-jet>

#proof[
  Put $q = \| d f \|_(macron(g))$. In dimension three, change of the volume density and inverse metric gives the
    exact equation
  #[#set math.equation(numbering: n => "(3.26)")
   $ "div"_(macron(g)) #scale(x: 120%, y: 120%)[\(] a \( z q \) q nabla_(macron(g)) f
     #scale(x: 120%, y: 120%)[\)] = 0 . $ <str-pde-compact-equation>]
  For reference, the conformal factor in (3.14) can also be cancelled exactly:
    with $Q = \| d f \|_(h_0)$ the equation is $"div"_(h_0) \[ a \( z e^(- 2 v) Q \) Q nabla_(h_0) f \] = 0$.
    The bounds (3.24) give $q lt.eq Q_0$, so $f$ is Lipschitz up to $z =
    0$ in the compact metric and has zero trace there. In a $macron(g)$-orthonormal frame,
    the covector derivative of the compact flux has eigenvalues
  $ a \( z q \) q \, wide a \( z q \) q thin b \( z q \) . $
  They are uniformly comparable to $q$, and the first spatial derivatives of the coordinate-density flux are
    bounded by $C q^2$ on this bounded covector range. A continuation beyond that range gives the global
    three-Laplace structure used in Lemma 14.
  The interior equation has the Dirichlet weak formulation up to $z = 0$.
    Indeed, cut a smooth zero-trace test off in $z < epsilon$.
    The compact flux is bounded, the test is $O \( z \)$, and the cutoff layer has volume $O \( epsilon \)$;
    the additional integral is therefore $O \( epsilon \)$. No assertion of zero normal flux is made.
    The boundary gradient estimate now yields $f in C^(1 \, theta)$ up to $z = 0$.
    The lower bound $f gt.eq c z$ implies $f_z \( 0 \, omega \) gt.eq c$.
    Thus a smaller full collar has gradient bounded away from zero and the compact equation is uniformly elliptic there.
  The compact metric is generally $C^(3 \, delta)$, rather than smooth in its normal variable.
    Every one of its angular derivatives has the same finite normal regularity.
    Choose $0 < gamma < min \( theta \, delta \)$. The first boundary upgrade can be obtained without assuming a
    second derivative in advance. Take angular difference quotients of the divergence equation.
    Their principal coefficient is the average of $A_p$ between two gradients;
    it has a common Hölder modulus and is uniformly elliptic.
    Their divergence source is the difference quotient of the explicit spatial dependence of the flux,
    with the same Hölder control. The boundary trace remains zero.
    The linear divergence boundary estimate #cite(label("agmondouglisnirenberg1959")) Theorem 9.1, p. 675,
    with $l = 1$ therefore bounds these difference quotients in $C^(1 \, gamma)$ on smaller half-balls,
    using their already bounded $C^0$ norm. Passing to the limit gives tangential second derivatives and mixed
    derivatives. The equation then gives the normal derivative of the normal flux from its tangential derivatives.
    Its derivative with respect to $f_z$ is bounded away from zero,
    so the implicit function theorem recovers the remaining normal second derivative with its Hölder bound.
    Thus $f in C^(2 \, gamma)$, and subsequent ordinary Schauder estimates use Lemma 119.
    To record explicitly why arbitrary angular derivatives are allowed,
    write (3.26) in density form $partial_j A^j \( x \, D f \) = 0$ and put $B^(j k) = A_(p_k)^j \( x \, D f \)$.
    For an angular multi-index $nu eq.not 0$, $w_nu = partial_omega^nu f$ satisfies
  #[#set math.equation(numbering: n => "(3.27)")
   $ partial_j \( B^(j k) partial_k w_nu \) = - partial_j F_nu^j \, wide w_nu \|_(z = 0) =
     0 . $ <str-pde-tangential-equation>]
  After the top derivative $B D w_nu$ is removed, the chain-rule remainder $F_nu$ contains only explicit angular
    derivatives of the flux and $D partial_omega^mu f$ with $\| mu \| < \| nu \|$.
    Inductively $B \, F_nu in C^(1 \, gamma)$, and the preceding stage gives $w_nu in C^(1 \, gamma)$.
    Expansion of (3.27) gives a uniformly elliptic nondivergence equation whose right side is $C^(0 \, gamma)$.
    Linear boundary Schauder estimates give $w_nu in C^(2 \, gamma)$.
    Finite covers and nested boundary patches complete this induction for each fixed $nu$,
    with constants allowed to depend on $nu$.
  Set $C_f = f_z \|_(z = 0)$. It is positive and smooth angularly.
    Taylor’s formula applied to each $w_nu$ gives $partial_omega^nu \( f - z C_f \) = O \( z^2 \)$. The identities
  $ z partial_z \( w_nu - z \( w_nu \)_z \|_0 \) = z \( \( w_nu \)_z - \( w_nu \)_z \|_0 \) \, $
  $ \( z partial_z \)^2 \( w_nu - z \( w_nu \)_z \|_0 \) = z \( \( w_nu \)_z - \( w_nu \)_z \|_0 \) +
    z^2 \( w_nu \)_(z z) $
  prove the two symbol derivative estimates. Finally $q = C_f + O \( z \)$,
    and the outward normal to the physical end points toward decreasing $z$.
    Substituting in the physical flux, with $d A_g = z^(- 2) e^(4 v) d A_sigma$, gives (3.17).
    This proves the remaining assertions of Theorem 3.4. ◻
]

=== 3.5 Uniform estimates when the finite-boundary heights grow <uniform-estimates-when-the-finite-boundary-heights-grow>

The preceding global gradient bound depends on $D$. The following local estimate supplies the different uniformity
  needed when $D$ tends to infinity.

#thm([Lemma 3.9.])[
  (A gradient estimate from local height).  #emph[On a physical coordinate ball with uniformly bounded geometry,
    a solution with $0 lt.eq f lt.eq H$ has a gradient bound on a concentric smaller ball depending only on $H$
    and that geometry. The estimate applies uniformly to smooth solutions off their critical sets and to their
    $C^1$ limits.]
] <str-pde-local-gradient>

#proof[
  Increase $s_0$ in (3.23) if necessary. Since $b arrow.r 0$ and $- \( b + s b' \) \/ b arrow.r 1$,
    that identity implies
  #[#set math.equation(numbering: n => "(3.28)")
   $ L log s gt.eq 1 / 2 \| d log s \|_A^2 - C wide \( s gt.eq s_0 \) . $ <str-pde-strong-log-gradient>]
  Choose a smooth positional cutoff $psi$ that is negative near the ball boundary and positive on the smaller
    ball, with controlled first two derivatives. Choose $epsilon > 0$ depending only on $H$ so that $phi.alt =
    psi + epsilon f$ is still negative near the outer boundary and uniformly positive on the smaller ball.
    Because $L f = 0$, $L phi.alt = L psi$ is uniformly bounded. Moreover, when $s$ is sufficiently large,
  #[#set math.equation(numbering: n => "(3.29)")
   $ \| d phi.alt \|_A^2 gt.eq b \( epsilon s + e psi \)^2 gt.eq c epsilon^2 \, $ <str-pde-axial-cutoff>]
  using $b s^2 arrow.r 4 \/ 3$. On the relatively compact region $phi.alt > 0$, put $q \( phi.alt \) =
    e^(k phi.alt) - 1$ and consider $W = log s + 4 log q \( phi.alt \)$.
    At an interior maximum with large gradient, $d log s = - 4 \( q' \/ q \) d phi.alt$.
    Equations (3.28)–(3.29) then give
  #[#set math.equation(numbering: n => "(3.30)")
   $ L W gt.eq 4 (\( q' \/ q \)^2 + q'' \/ q) \| d phi.alt \|_A^2 + 4 \( q' \/ q \) L phi.alt -
     C . $ <str-pde-local-maximum>]
  Here $q' \/ q gt.eq k$ and $q'' \/ q = k q' \/ q$. A fixed sufficiently large $k$ makes the right side positive,
    a contradiction. Since $W arrow.r - oo$ at $phi.alt = 0$, and $q$ is bounded below on the smaller ball,
    a bound at the remaining, bounded-gradient maxima gives the desired interior gradient bound.
    Every calculation takes place where the gradient is large and the solution is smooth,
    so critical points introduce no additional regularity requirement. ◻
]

#thm([Lemma 3.10.])[
  (Common end for growing heights).  #emph[ Let $g_i$ be smooth metrics on the same exterior,
    with $H_(partial X) \( g_i \) lt.eq 0$, converging smoothly on compact subsets to a smooth metric $g$.
    Suppose that each has the prepared end required for Theorem 3.4, and that for a common $beta > 1$ and $M < oo$,
#[#set math.equation(numbering: n => "(3.31)")
 $ sum_(j = 0)^2 \| nabla_b^j \( g_i - b \) \|_b lt.eq M z^beta $ <str-pde-uniform-physical-metrics>]

 on a common end. Assume the compact metrics are uniformly positive definite.
   Let $D_i gt.eq 1$ be arbitrary finite heights and let $f_i$ be their solutions.
   Then on a common end collar there are constants $c \, C \, Q > 0$, independent of $i \, D_i$, such that
#[#set math.equation(numbering: n => "(3.32)")
 $ c z lt.eq f_i lt.eq C z \, wide \| d f_i \|_(g_i) lt.eq Q z . $ <str-pde-uniform-linear-bounds>]

 For some $gamma > 0$ the functions have uniform compact $C^(2 \, gamma)$ bounds on a common smaller collar,
   which is noncritical for every $f_i$. After extraction, they converge in $C^(2 \, gamma')$ for $0 < gamma' <
   gamma$ on a still smaller closed compact collar, and smoothly on interior compact subsets of that collar,
   to a solution for $g$. If $g$ has a smooth compactification in another defining function $rho$ comparable to
   $z$, the limiting solution is smooth there and has $f = rho C_oo + O \( rho^2 \)$ with positive smooth $C_oo$.]
] <lem:str-uniform-end>

#proof[
  First obtain an upper height bound without using $D_i$. Write $eta =
    "arsinh" r$ and choose a large fixed $eta_0$. On $x = eta - eta_0 > 0$ take
  #[#set math.equation(numbering: n => "(3.33)")
   $ w \( eta \) = frac(A e^(- xi x), x) \, wide 0 < xi < 1 . $ <str-pde-pole-barrier>]
  Uniformly in $i$, $\| d eta \|_(g_i)^2 = 1 + o \( 1 \)$ and
  $ Delta_(g_i) eta + \( b - 1 \) "Hess"_(g_i) eta \( e \, e \) = 2 + o \( 1 \) \, wide e =
    frac(nabla_(g_i) eta, \| d eta \|_(g_i)) \, $
  for $0 < b lt.eq 2$. The radial operator is therefore $b w'' \| d eta \|^2 + w' \( 2 + o \( 1 \) \)$.
    A direct differentiation gives
  $ frac(w'', - w') = xi + 1 / x + frac(1, x \( 1 + xi x \)) . $
  Far from the pole, $b lt.eq 2$ and $xi < 1$ give a strict supersolution after fixing $eta_0$ sufficiently large.
    Near the pole, $\| w' \| asymp A \/ x^2$, $w'' asymp A \/ x^3$, and $b \( \| w' \| \| d eta \| \) =
    O \( x^4 \/ A^2 \)$: the positive term is $O \( x \/ A \)$, whereas the negative term has order $- A \/ x^2$.
    On the remaining compact interval, increasing $A$ makes $b$ uniformly small.
    Thus one fixed $A$ makes $w$ a supersolution on the entire end, for every $i$.
  For each finite $D_i$ compare first on a truncated domain starting sufficiently near the pole that $w > D_i$.
    At its outer boundary the Dirichlet solution is zero. Passage to the exhaustion limit gives $f_i lt.eq w$.
    In particular $f_i lt.eq C_0 z^xi$ beyond a fixed sphere, independently of $i \, D_i$.
    Applying Lemma 18 on uniform physical balls there gives a common local physical gradient bound.
    This is the bound needed before extending the flux to a three-Laplace structure law on these patches.
  For a uniform positive lower value on a fixed sphere, let $u_i$ be the height-one solution for $g_i$.
    Comparison gives $f_i gt.eq u_i$. The fixed-height estimates have uniform constants in this family:
    local smooth convergence controls the finite-boundary collars and compact geometry,
    while (3.31) controls the end. Thus every subsequence has a further subsequence converging locally in $C^1$ to
    the height-one solution for $g$, with zero limiting boundary value at infinity.
    This limit is positive in the interior by the local annular comparison used above.
    Uniqueness gives the same limit for every subsequence, so the minima of $u_i$ on a fixed interior sphere have
    a positive common lower bound. Reducing it to handle finitely many initial terms if necessary supplies the
    desired lower bound. Lemma 16 now gives (3.32), using its general radial formula (3.25).
  We spell out the regularity conversion for the metrics. If $E_i = z^2 \( g_i - b \)$,
    tensor-to-coordinate conversion in (3.31) gives
  #[#set math.equation(numbering: n => "(3.34)")
   $ \| partial^j E_i \| lt.eq C M z^(beta - j) \, wide 0 lt.eq j lt.eq 2 . $ <str-pde-weight-conversion>]
  Indeed, a tensor of rank $2 + j$ with $b$-norm $O \( z^beta \)$ has coordinate components
    $O \( z^(beta - 2 - j) \)$, and $Gamma_b = O \( z^(- 1) \)$, $partial Gamma_b = O \( z^(- 2) \)$.
    The compact metrics are consequently uniformly $C^(1 \, alpha)$ for any $0 < alpha < min \( beta - 1 \, 1 \)$.
    To verify the only nontrivial case $1 < beta < 2$, let two points be separated by coordinate distance $d$.
    If $d$ is smaller than half the larger $z$ value, integrate the second derivative bound along a path on which
    $z$ is comparable to that value:
  $ \| D E_i \( x \) - D E_i \( y \) \| lt.eq C d z^(beta - 2) lt.eq C d^(beta - 1) . $
  For the remaining pairs use the first derivative amplitude $C z^(beta - 1)$ at the two endpoints.
    Pairs on the boundary follow by continuity. Smooth interior convergence and this uniform estimate also give
    compact $C^(1 \, alpha')$ convergence for $alpha' < alpha$.
    In particular, a cutoff annulus moving toward $z = 0$ does not require any extra ordinary-derivative bound.
  The compact flux in (3.26) has uniform three-Laplace structural constants,
    and (3.32) gives a common compact gradient bound. The weak zero-trace formulation and Lemma 14 give uniform
    $C^(1 \, theta)$ estimates up to $z = 0$. The lower height bound implies $f_(i \, z) \( 0 \, omega \) gt.eq
    c$. The Hölder gradient estimate therefore makes a common collar noncritical.
    On it ordinary quasilinear boundary Schauder estimates yield a uniform $C^(2 \, gamma)$ bound for $0 < gamma <
    min \( alpha \, theta \)$. Compactness gives the stated convergence,
    and smooth interior convergence of the metrics permits elliptic bootstrap on each compact subset of the collar
    away from $z = 0$.
  Finally, in a smooth limiting compactification $hat(g) = rho^2 g$,
    comparability of $rho$ and $z$ gives $c' rho lt.eq f lt.eq C' rho$ and $\| d f \|_(hat(g)) lt.eq Q'$.
    Apply the compactified boundary argument afresh with $rho$.
    It gives a noncritical collar; all subsequent boundary Schauder bootstraps are now allowed because the
    limiting compact metric is smooth. Hence the limit is smooth up to that conformal boundary. ◻
]

#prodef([Remark 3.11.])[
  The uniform physical control through two derivatives in Lemma 3.10 gives finite compact regularity.
    It does not give uniform bounds for arbitrary angular derivatives of the individual coefficients $C_(f_i)$.
    Each fixed prepared metric has the angular smoothness in (3.16), with constants depending on that metric.
    Smoothness of the limit in the final assertion is obtained separately from the smooth limiting
    compactification. The later application has $beta > 3 \/ 2$,
    which is stronger than the $beta > 1$ needed for this regularity conversion.
] <str-pde-uniformity-scope>

=== 3.6 Flux saturation and the conserved stress <flux-saturation-and-the-conserved-stress>

#thm([Lemma 3.12.])[
  (Flux saturation for full enclosing cuts).  #emph[Let $f_D$ be the solution in Theorem 13 on an exterior
    $\( X \, g \)$ with inner boundary $T$, with $f_D \|_T = D > 0$ and $f_D arrow.r 0$ at infinity.
    Write $f_D = z C_D \( omega \) + O \( z^2 \)$, and set
$ cal(F)_D = integral_(bb(S)^2) C_D^2 thin d omega . $

 Then
#[#set math.equation(numbering: n => "(3.35)")
 $ integral_X t \( \| d f_D \| \) \| d f_D \| thin d V_g = D cal(F)_D \, wide 0 lt.eq cal(F)_D lt.eq
   A_g \( T \) \, wide lim_(D arrow.r oo) cal(F)_D = A_g \( T \) . $ <eq:str-flux-saturation>]

 In particular
#[#set math.equation(numbering: n => "(3.36)")
 $ integral.slash_(bb(S)^2) C_D^3 thin d omega gt.eq (frac(cal(F)_D, 4 pi))^(3 \/ 2) . $ <eq:str-jensen>]

]
] <lem:str-flux-saturation>

#proof[
  Put $X_D = t \( \| d f_D \| \) nabla f_D \/ \| d f_D \|$, with value zero at a critical point.
    This vector field is continuous, divergence free in distributions, and has norm at most one.
    The end expansion gives $\| d f_D \| = z C_D + O \( z^2 \)$ and $t \( \| d f_D \| \) = z^2 C_D^2 +
    O \( z^3 \)$. Its flux through a distant sphere, with outward normal, tends to $- cal(F)_D$.
    The divergence theorem therefore gives the inward flux $cal(F)_D$ on every full cut separating the inner
    boundary from infinity. Consequently $cal(F)_D$ is bounded by the area of every admissible cut.
    This is also valid for continuous divergence-free fields:
    apply the distributional equation to smooth approximations of the indicator of the region between a cut and a
    distant sphere, or first mollify the density on that compact region.
  Integration of $"div" \( f_D X_D \) = t \( \| d f_D \| \) \| d
    f_D \|$ over a truncation gives the first identity in Equation (3.35).
    The outer boundary term tends to zero because $f_D = O \( z \)$ while the flux has a finite limit.
    The integrand is integrable at infinity: it is $O \( z^3 \)$ and the volume element is $O \( z^(- 3) \) thin d
    z thin d omega$.
  Fix $0 < lambda < 1$. The coarse radial supersolution in Theorem 13 gives $f_D lt.eq
    c D r^(- xi)$ for a fixed $0 < xi < 1$, with $c$ independent of $D$. Hence
  #[#set math.equation(numbering: n => "(3.37)")
   $ "Vol"_g { f_D > lambda D } lt.eq V_lambda < oo $ <eq:str-superlevel-volume>]
  uniformly in $D$. The function $sigma \( 1 - t \( sigma \) \)$ is bounded on $\[ 0 \, oo \)$:
    it tends to zero both at zero and at infinity, since $1 - t \( sigma \) = O \( sigma^(- 2) \)$ at infinity.
    Thus for a constant $C_0$,
  $ D cal(F)_D gt.eq integral_({ f_D > lambda D }) \| d f_D \| thin d V_g - C_0 V_lambda . $
  We justify the coarea lower bound with the exact full-boundary convention.
    For almost every level $a in \( 0 \, D \)$, the set ${ f_D > a }$ has finite perimeter,
    contains an inner collar of $T$, and is bounded. Its complement has a unique component containing the end.
    Fill the other complementary components. This operation can only decrease the perimeter,
    and the remaining entire boundary separates the end from every component of $T$.
    Approximate the filled set by smooth sets in a fixed compact region while preserving a smaller inner collar
    and the distant exterior; their perimeter converges to the finite-perimeter value.
    Such approximation follows by convolving the characteristic function in finitely many interior charts and
    using regular levels; the inner and outer collars are held fixed,
    and bounded complementary components are again filled. Their full boundaries are smooth admissible cuts.
    It follows that the original level perimeter is at least $A_g \( T \)$.
    Coarea, valid for the locally Lipschitz $f_D$, now gives
  $ integral_({ f_D > lambda D }) \| d f_D \| thin d V_g = integral_(lambda D)^D "Per" { f_D > a } thin d a
    gt.eq \( 1 - lambda \) D A_g \( T \) . $
  No smooth Sard assertion at critical points of a $C^(1 \, theta)$ solution is needed. We obtain
  $ \( 1 - lambda \) A_g \( T \) - C_0 V_lambda \/ D lt.eq cal(F)_D lt.eq A_g \( T \) . $
  Let $D arrow.r oo$, then $lambda arrow.b 0$. Finally, Equation (3.36) is Hölder’s Inequality on the sphere with
    its probability measure $d omega \/ \( 4 pi \)$. ◻
]

#thm([Lemma 3.13.])[
  (The conserved stress and its smoothing).  #emph[For a solution $f$ of the saturating equation,
    put $sigma = \| d f \|$, $e = nabla f \/ \| d f \|$ at noncritical points,
    and $k = \( 1 - t \( sigma \)^(3 \/ 2) \)^(1 \/ 2)$. Define
#[#set math.equation(numbering: n => "(3.38)")
 $ cal(P)_(e e) = 2 k \, wide cal(P) \|_(e^perp) = frac(3 + k^2, 2 k) I \, wide cal(P)_(e perp) = 0 \, wide L =
   cal(P) - 1 / 2 \( "tr"_g cal(P) \) g . $ <eq:str-stress-definition>]

 At a critical point set $cal(P) = 2 g$ and $L = - g$. These fields are continuous,
   smooth away from the critical set, and satisfy
#[#set math.equation(numbering: n => "(3.39)")
 $ "div"_g cal(P) = 0 \, wide \( "tr"_g L \)^2 - \| L \|_g^2 = 6 \, wide L < 0 . $ <eq:str-stress-identities>]

 If $K - \( "tr"_g K \) g gt.eq 0$, then $cal(P) : K lt.eq 0$.
   Therefore $\( g \, K + L \)$ satisfies the flat-cosmological DEC whenever $\( g \, K \)$ satisfies the
   $Lambda = - 3$ DEC, with at least the original strict margin, and its future boundary expansion is strictly smaller.]
  #emph[On any compact set where the DEC and expansion have strict margins,
    $cal(P)$ can be smoothed preserving those margins. This is valid also at an original boundary face,
    using only the exterior side.]
] <lem:str-stress-identities>

#proof[
  Let
  $ W \( sigma \) = frac(3 + k^2, 2 k) . $
  Differentiating $sigma = sqrt(t) \/ k$ and $k^2 = 1 - t^(3 \/ 2)$ gives
  #[#set math.equation(numbering: n => "(3.40)")
   $ W' \( sigma \) = 3 / 2 t \( sigma \) \, wide W \( sigma \) - sigma W' \( sigma \) =
     2 k . $ <eq:str-domain-stress-calculation>]
  Consequently $W$ is convex and $cal(P) = W g - sigma W' e ⊗ e$.
    The weak equation says that $f$ is a local minimizer of $integral W \( \| d f \| \) thin d V_g$:
    convexity gives the minimizing inequality against every compactly supported additive variation.
    Composing with a compactly supported smooth diffeomorphism is another admissible local variation.
    Differentiating this inner variation yields $integral cal(P) : nabla X thin d V_g =
    0$ for every compactly supported smooth vector field $X$.
    The differentiation is valid for the locally Lipschitz minimizer by change of variables and dominated
    convergence. This proves distributional conservation.
  Trace reversal in Equation (3.38) gives
  #[#set math.equation(numbering: n => "(3.41)")
   $ L_(e e) = - frac(3 - k^2, 2 k) \, wide L \|_(e^perp) = - k I . $ <eq:str-L-eigenvalues>]
  Both eigenvalues are negative and their quadratic constraint combination is $6$.
    As $sigma arrow.r 0$, $k = 1 + O \( sigma^3 \)$, so the definitions extend continuously across critical
    points, independently of $e$.
  Positivity of $K - \( "tr" K \) g$ implies $"tr" K lt.eq 0$ and $"tr"_(e^perp) K lt.eq 0$. Thus
  $ cal(P) : K = 2 k "tr" K + frac(3 \( 1 - k^2 \), 2 k) "tr"_(e^perp) K lt.eq 0 . $
  The flat Hamiltonian of $K + L$ is
  $ R_g + \( "tr" \( K + L \) \)^2 - \| K + L \|^2 = cal(H)_g \( K \) - 2 cal(P) : K \, $
  and its momentum is $cal(J)_g \( K \)$ by conservation. Negative definiteness of $L$ gives the strict boundary
    expansion decrease.
  We spell out the smoothing assertion because pointwise tensor approximation alone would not control momentum.
    In a coordinate chart let $Q^(i j) = sqrt(det g) thin cal(P)^(i j)$. Conservation means
  $ partial_j Q^(i j) = - Gamma_(j k)^i Q^(j k) . $
  Convolution gives smooth symmetric densities converging uniformly to $Q$,
    whose divergence differs from the required connection term by a commutator tending uniformly to zero.
    In a boundary chart $x^3 gt.eq 0$ use instead
  $ Q_epsilon.alt \( x \) = integral rho_epsilon.alt \( y \) Q \( x + 2 epsilon.alt e_3 - y \) thin d y . $
  Its kernel lies on the original side even at the face, and the same commutator estimate holds.
    After a partition of unity, additional divergence errors are sums of $d chi thin \( Q_epsilon.alt - Q \)$,
    which also tend uniformly to zero. Divide by the original volume density and trace reverse.
    The algebraic terms and the momentum therefore converge uniformly on the compact set.
    Strict DEC and strict negative expansion survive sufficiently fine smoothing.
    A separate smoothing scale may be chosen for each member of a sequence. ◻
]

=== 3.7 Turning the auxiliary end into an asymptotically flat end <str-bc-section>

We give the end construction with its mass and area estimates.
  All spherical derivatives in this subsection use the unit round metric $gamma$. A dot denotes $partial_(log s)$.
  The notation $O_j \( s^(- a) \)$ includes $j$ derivatives under $s partial_s$ and spherical differentiation,
  measured in the indicated orthonormal frame. Constants in estimates for a completed construction may depend on
  its fixed parameters.

#thm([Lemma 3.14.])[
  (Constraints in a spherical foliation).  #emph[ Let
$ q = F^(- 1) d s^2 + s^2 gamma \, wide F > 0 \, wide n = sqrt(F) thin partial_s . $

 Write the orthonormal blocks of a symmetric tensor $B$ as
$ B_(n n) = - h \, wide B_(n T) = G \, wide B_T = - k I + U \, wide "tr"_gamma U = 0 . $

 Here $G$ and $U$ are represented by a one-form and a symmetric tracefree two-tensor on the unit sphere.
   Put $cal(H) = R_q + \( "tr"_q B \)^2 - \| B \|_q^2$ and $cal(D) = "div"_q \( B - \( "tr"_q B \) q \)$. Then
#[#set math.equation(numbering: n => "(3.42)")
 $ R_q = frac(2 \( 1 - F \), s^2) - frac(2 partial_s F, s) -
   frac(2 sqrt(F), s^2) Delta_gamma F^(- 1 \/ 2) . $ <str-bc-scalar>]

 In particular, if $F = 1 + s^2 k^2 - 2 m \/ s$, then
#[#set math.equation(numbering: n => "(3.43)")
 $ cal(H) = frac(4 partial_s m, s^2) - frac(2 sqrt(F), s^2) Delta_gamma F^(- 1 \/ 2) +
   4 k \( h - k - s partial_s k \) - 2 \| G \|^2 - \| U \|^2 . $ <str-bc-hamiltonian>]

 For arbitrary $F$ the momentum components are
#[#set math.equation(numbering: n => "(3.44)")
 $ cal(D)_n & = frac(2 sqrt(F), s) \( k + s partial_s k - h \) +
   frac("div"_gamma G - 2 G dot.op nabla_gamma log sqrt(F), s) \,\
cal(D)_T & = sqrt(F) \( partial_s G + 3 G \/ s \) + 1 / s { nabla_gamma \( h + k \) - \( h - k \) nabla_gamma log
  sqrt(F) #scale(x: 120%, y: 120%)[}]\
 & #h(12mm)  + 1 / s { "div"_gamma U - U nabla_gamma log sqrt(F) #scale(x: 120%, y: 120%)[}] .
   $ <str-bc-momentum-normal>]

]
] <str-bc-constraints>

#proof[
  Choose a spherical orthonormal frame $macron(E)_a$, independent of $s$, and set $E_a = s^(- 1) macron(E)_a$.
    At a point where the spherical connection vanishes, the connection of $q$ is
  $ nabla_(E_a) n & = sqrt(F) / s E_a \, & nabla_(E_a) E_b & = - sqrt(F) / s delta_(a b) n \,\
nabla_n n & = 1 / s \( nabla_gamma log sqrt(F) \)^a E_a \, & nabla_n E_a & = - 1 / s \( partial_a log sqrt(F) \) n . $
  Away from this point the second identity also contains the spherical connection divided by $s$.
    Thus the leaf shape operator is $sqrt(F) I \/ s$. For lapse $N = F^(- 1 \/ 2)$ the scalar Gauss identity is
  $ R_q = R_(s^2 gamma) - \| A \|^2 - H^2 - 2 n \( H \) - 2 N^(- 1) Delta_(s^2 gamma) N . $
  Substituting $H = 2 sqrt(F) \/ s$ gives Equation (3.42). Moreover,
  $ \( "tr" B \)^2 - \| B \|^2 = 4 h k + 2 k^2 - 2 \| G \|^2 - \| U \|^2 \, $
  which proves Equation (3.43) by differentiating $F$. For $P = B - \( "tr" B \) q$, its blocks are $P_(n n) =
    2 k$, $P_(n T) = G$ and $P_T = \( h + k \) I + U$. In the normal divergence,
    the two acceleration terms give $- 2 G dot.op nabla_gamma log sqrt(F) \/ s$,
    while the shape terms give $2 sqrt(F) \( k - h \) \/ s$. In the tangential divergence the shape terms give $3
    sqrt(F) G \/ s$ and the acceleration terms give $\( \( k - h \) I - U \) nabla_gamma log sqrt(F) \/ s$.
    Adding the ordinary block derivatives proves the two momentum identities. ◻
]

#thm([Proposition 3.15.])[
  (Bending with arbitrarily small mass cost).  #emph[ Suppose $\( Omega \, g \, B \)$ is smooth, has one end,
    has strictly negative future boundary expansion, and satisfies $cal(H)_g - 2 \| cal(D)_g \|_g > 0$ everywhere.
    Suppose its end is $g = e^(4 v) b$, where
#[#set math.equation(numbering: n => "(3.45)")
 $ v = r^(- 3) v_3 \( omega \) - d_0 r^(- 3 - delta) + O_3 \( r^(- 4) \) \, wide 0 < delta < 1 \, quad d_0 > 0 \,
   $ <str-bc-prepared-v>]

 with smooth angular coefficients. Suppose also that on this end there are a positive smooth $C \( omega \)$ and a
   unit covector $e$ such that
#[#set math.equation(numbering: n => "(3.46)")
 $ B = - g + C^3 / r^3 (1 / 2 g - 3 / 2 e ⊗ e) + O_1 \( r^(- 4) \) \, wide e ⊗ e = n_r^flat ⊗ n_r^flat +
   O_1 \( r^(- 1) \) \, $ <str-bc-prepared-B>]

 where $n_r$ is the outward unit normal to the coordinate spheres.
   The scalar remainder has three symbol derivatives so that the change to the area coordinate has two controlled
   metric derivatives. The initial interpolation needs two derivatives of the metric error and one of the tensor
   error; the preparation in Lemma 11 supplies the stronger scalar expansion with all symbol derivatives.]
  #emph[For every $epsilon > 0$ and every fixed compact subset there exist smooth data
    $\( q_epsilon \, B_epsilon \)$ agreeing with $\( g \, B \)$ on that subset and near the original boundary, such that
#[#set math.equation(numbering: n => "(3.47)")
 $ & q_epsilon gt.eq \( 1 - epsilon \) g \,\
 & R_(q_epsilon) + \( "tr" B_epsilon \)^2 - \| B_epsilon \|^2 -
   2 \| "div" \( B_epsilon - \( "tr" B_epsilon \) q_epsilon \) \| gt.eq c_epsilon \( 1 + s \)^(- 3 - delta) > 0 \,\
 & q_epsilon - delta_(upright("Eucl")) = O_oo \( s^(- 1) \) \, wide R_(q_epsilon) = O_oo \( s^(- 3 - delta) \) \,\
 & B_epsilon = O_oo \( s^(- 2) \) \, wide "tr"_(q_epsilon) B_epsilon = 0 quad
   upright("on the final end") . $ <str-bc-lower-comparison>]

 Its metric ADM energy satisfies
#[#set math.equation(numbering: n => "(3.48)")
 $ integral.slash_(bb(S)^2) \( 8 v_3 - C^3 \/ 2 \) lt.eq E \( q_epsilon \) lt.eq
   integral.slash_(bb(S)^2) \( 8 v_3 - C^3 \/ 2 \) + epsilon . $ <str-bc-energy>]

 Consequently its full-cut area infimum is at least $\( 1 - epsilon \) A_g \( S \)$.]
] <str-bc-bending>

#proof[
  We may assume $0 < epsilon < 1$. All modifications take place beyond a radius chosen at the end of the proof.
  ===== 3.7.1 Area coordinate and initial coefficients. <area-coordinate-and-initial-coefficients.>
  Set $s = e^(2 v) r$. Its radial derivative is positive far out. In coordinates $\( s \, omega \)$ the metric is
  $ g = F_g^(- 1) \( d s - 2 s thin d_omega v \)^2 + s^2 gamma \, wide
    F_g = \( 1 + r^2 \) \( 1 + 2 r partial_r v \)^2 \, $
  where the angular differential on the right is initially taken at fixed $r$. Expansion of Equation (3.45) gives
  #[#set math.equation(numbering: n => "(3.49)")
   $ F_g = 1 + s^2 - frac(16 v_3, s) + 4 \( 4 + delta \) d_0 s^(- 1 - delta) +
     O_2 \( s^(- 2) \) . $ <str-bc-area-coefficient>]
  The mixed term has relative orthonormal size $\| d_omega v \| \/ sqrt(F_g) = O_2 \( s^(- 4) \)$. Define
  #[#set math.equation(numbering: n => "(3.50)")
   $ m_0 = 8 v_3 \, wide d = \( 8 + 2 delta \) d_0 \, wide mu = m_0 - C^3 \/ 2 \,\
k = 1 - frac(C^3, 2 s^3) \, quad h = k + s partial_s k \, quad m = mu - d s^(- delta) . $ <str-bc-initial-coefficients>]
  Then $F = 1 + s^2 k^2 - 2 m \/ s$ agrees with Equation (3.49) up to an $O_2 \( s^(- 2) \)$ term.
    Thus $F^(- 1) d s^2 + s^2 gamma$ differs from $g$ by $O_2 \( s^(- 4) \)$ in hyperbolic tensor norm.
    Equation (3.46) gives the blocks $B_T = - k I + O_1 \( s^(- 4) \)$, $B_(n n) = - h + O_1 \( s^(- 4) \)$,
    and $B_(n T) = O_1 \( s^(- 4) \)$. In particular the approximate spherical pair differs from the original pair
    by errors of exactly the orders needed by the constraints.
  For completeness, the time mass of $e^(4 v) b$ in the stipulated hyperbolic metric flux is $integral.slash 8
    v_3$. Indeed, for $e = lambda b$ its flux integrand is $- 2 V_0 d lambda + 2 lambda d V_0$, and $lambda =
    e^(4 v) - 1 = 4 v + O \( r^(- 6) \)$. The leading integrand on $r = R$ is $32 v_3 R^(- 2) + o \( R^(- 2) \)$,
    whose integral divided by $16 pi$ is $8 integral.slash v_3$.
    This uses precisely the metric time flux; no charge of $B$ is included.
  ===== 3.7.2 Exactification and finite angular approximation. <exactification-and-finite-angular-approximation.>
  Over a fixed interval in $log s$, interpolate the metric and tensor to the pair in Equation (3.50).
    For example interpolate the metric covariantly, and interpolate $B + q$ in the same fixed coordinates.
    The interpolation is positive definite for a sufficiently distant annulus.
    Its constraint error is $O \( s^(- 4) \)$, since physical derivatives of the logarithmic cutoffs are bounded
    on this hyperbolic part. In the spherical pair the mass term supplies
  #[#set math.equation(numbering: n => "(3.51)")
   $ frac(4 partial_s \( - d s^(- delta) \), s^2) = 4 delta d thin s^(- 3 - delta) . $ <str-bc-margin>]
  All remaining terms in its constraints are $O \( s^(- 4) \)$:
    in particular $nabla_gamma k = O \( s^(- 3) \)$, $h - k = O \( s^(- 3) \)$, and $nabla_gamma F =
    O \( s^(- 1) \)$. The margin in Equation (3.51) therefore absorbs the interpolation error.
    Next cut $k$ to $1$ on another fixed logarithmic annulus, retaining $h = k + s partial_s k$, $G = U = 0$,
    and the same $m$. The new terms are again $O \( s^(- 4) \)$ and are absorbed by the same margin.
  Fix $eta > 0$. Choose a finite spherical harmonic sum $mu_N$, with the same mean as $mu$,
    such that $parallel mu_N - mu parallel_(C^4) < eta$. Such sums approximate a smooth function in $C^4$:
    repeated integration by parts with $Delta_gamma$ makes its harmonic coefficients decay faster than every power
    of the degree, and hence the differentiated series converges uniformly.
    On one further logarithmic annulus replace $mu$ by $mu + chi \( mu_N - mu \)$,
    for a nondecreasing cutoff $chi$. Add to $m$ a radial nondecreasing function $rho$ with $dot(rho) =
    C eta dot(chi)$. The signed contribution $4 dot(chi) \( mu_N - mu \)$ to $s^3 cal(H)$ is bounded by $4 eta
    dot(chi)$, so a fixed $C > 1$ absorbs it. Here $k = 1$ and $t = s k = s$;
    the remaining scaled angular errors are $O \( s^(- 2) \)$. This step costs at most $C eta$ in mean mass.
    From this point onward the freely prescribed angular coefficient fields belong to one fixed finite collection
    of harmonic spaces. Nonlinear expressions such as $F^(- 1)$ need not be finite harmonic sums;
    their angular derivatives are estimated directly in the formulas below.
  ===== 3.7.3 Reduction from large radial boost. <reduction-from-large-radial-boost.>
  For radial $t = s k$, put
  $ F = 1 + t^2 - 2 m \/ s \, wide h = dot(t) \/ s \, wide G = U = 0 \, wide m = mu_N - d s^(- delta) + rho \( s \) . $
  The constraint identities become the exact formulas
  #[#set math.equation(numbering: n => "(3.52)")
   $ s^3 cal(H) & = 4 dot(m) - frac(2 Delta_gamma m, F) - frac(6 \| nabla_gamma m \|^2, s F^2) \,\
cal(D)_n & = 0 \, wide s^3 cal(D)_T = frac(\( dot(t) - t \) nabla_gamma m, F) . $ <str-bc-large-exact>]
  For example these follow from $sqrt(F) Delta_gamma F^(- 1 \/ 2) = \( Delta_gamma m \) \/ \( s F \) +
    3 \| nabla_gamma m \|^2 \/ \( s^2 F^2 \)$. Thus no expansion involving an unbounded $dot(t)$ is needed.
  Choose a large fixed $P$. Over a bounded logarithmic interval turn $t = s$ into a constant of comparable size,
    then lower that constant monotonically to $P$ over a second bounded logarithmic interval.
    Explicitly, starting at $s = R_1$, take $x = log \( s \/ R_1 \)$ and $t =
    R_1 exp \( integral_0^x kappa \( u \) thin d u \)$, where $kappa$ decreases smoothly from one to zero and is
    constant near the endpoints. Its final value is $T asymp R_1$.
    On the next interval take $t = P + \( T - P \) \( 1 - chi \( x \) \)$ with a nondecreasing cutoff flat at its
    endpoints. These profiles have $P lt.eq t lt.eq s$. In the first interval $t$ is comparable with its starting
    radius and $\| dot(t) \| lt.eq C t$; in the second interval $t$ is nonincreasing. Accordingly
  #[#set math.equation(numbering: n => "(3.53)")
   $ integral frac(1 + t + \| dot(t) \|, 1 + t^2) thin d log s lt.eq C / P . $ <str-bc-large-cost>]
  The contribution of $1 + t$ follows from the bounded interval lengths;
    for the monotone part the derivative contribution is $integral_P^T \( 1 + t^2 \)^(- 1) d t lt.eq P^(- 1)$.
  As long as $\| m \|$ is bounded and the starting radius is large, $F gt.eq \( 1 + t^2 \) \/ 2$.
    Equations (3.52) show that a smooth nonnegative radial addition with
  #[#set math.equation(numbering: n => "(3.54)")
   $ dot(rho) gt.eq C_N frac(1 + t + \| dot(t) \|, 1 + t^2) $ <str-bc-large-repair>]
  where the angular errors need repair makes their contribution to $cal(H) - 2 \| cal(D) \|$ nonnegative.
    A smooth majorant of $\| dot(t) \|$ can be used, with the same integral bound.
    The addition starts before $t$ departs from $s$; in this initial overlap the errors already have the smaller
    orders treated above. Its cost is at most $C_N \/ P$. This also verifies the boundedness of $m$ used in the
    argument: choose $P$ so that this cost is at most one and then take the radius large.
    Continue this repair into a short overlap on which $t = P$.
  ===== 3.7.4 The bounded radial boost equations. <the-bounded-radial-boost-equations.>
  Now $t$ follows a fixed smooth profile from $P$ to zero on a bounded logarithmic interval.
    Write $S_0 = sqrt(1 + t^2)$ and allow
  #[#set math.equation(numbering: n => "(3.55)")
   $ G = b \/ s^2 \, wide U = u \/ s^2 \, wide h = dot(t) \/ s + frac("div"_gamma b, 2 S_0 s^2) \,
     $ <str-bc-bounded-ansatz>]
  where $u$ is tracefree. Decompose $m = macron(mu) + rho - d s^(- delta) + m_(upright("ang"))$,
    with $m_(upright("ang"))$ of zero mean. For bounded coefficients and their needed derivatives, $F = S_0^2 +
    O \( s^(- 1) \)$. Substitution in Lemma 23 gives
  #[#set math.equation(numbering: n => "(3.56)")
   $ s^3 cal(H) & = 4 dot(rho) + 4 delta d s^(- delta) + 4 dot(m)_(upright("ang")) -
     frac(2 Delta_gamma m, S_0^2) + frac(2 t "div"_gamma b, S_0) + O \( s^(- 1) \) \,\
s^3 cal(D)_n & = O \( s^(- 1) \) \,\
s^3 cal(D)_T & = S_0 \( dot(b) + b \) + frac(nabla_gamma "div"_gamma b, 2 S_0) +
  frac(\( dot(t) - t \) nabla_gamma m, S_0^2) + "div"_gamma u + O \( s^(- 1) \) . $ <str-bc-bounded-H>]
  For instance the two leading terms in the normal component are $-
    sqrt(F) "div" b \/ \( S_0 s^3 \)$ and $"div" b \/ s^3$, which cancel to the stated order.
    The term $4 k \( h - k - s partial_s k \)$ gives $2 t "div" b \/ \( S_0 s^3 \)$.
    In the tangential component, $sqrt(F) \( partial_s G + 3 G \/ s \) = sqrt(F) \( dot(b) + b \) \/ s^3$,
    and $nabla log sqrt(F) = - nabla m \/ \( s F \)$. These observations account for every leading term in
    Equations (3.56) and (3.56); the quadratic $G \, U$ terms are $O \( s^(- 4) \)$.
  We cancel the leading angular terms by solving
  #[#set math.equation(numbering: n => "(3.57)")
   $ dot(m)_(upright("ang")) & = frac(Delta_gamma m, 2 S_0^2) - frac(t "div"_gamma b, 2 S_0) \,\
S_0 \( dot(b) + b \) & + frac(nabla_gamma "div"_gamma b, 2 S_0) + frac(\( dot(t) - t \) nabla_gamma m, S_0^2) +
  "div"_gamma u = 0 . $ <str-bc-angular-mass>]
  Let $Y$ be a spherical harmonic with $Delta_gamma Y = - lambda_ell Y$, $lambda_ell = ell \( ell + 1 \)$.
    Commutation of a covariant derivative with the Hessian, using $"Ric"_gamma = gamma$, gives
  #[#set math.equation(numbering: n => "(3.58)")
   $ "div"_gamma ("Hess"_gamma Y + lambda_ell / 2 Y gamma) = (1 - lambda_ell / 2) nabla_gamma Y . $ <str-bc-tf-hessian>]
  For $ell gt.eq 2$ set the corresponding component of $b$ equal to zero.
    Its mass coefficient $M_ell$ and tracefree tensor are then
  #[#set math.equation(numbering: n => "(3.59)")
   $ dot(M)_ell = - frac(lambda_ell M_ell, 2 S_0^2) \, wide u_ell = -
     frac(\( dot(t) - t \) M_ell, S_0^2 \( 1 - lambda_ell \/ 2 \)) ("Hess"_gamma Y + lambda_ell / 2 Y gamma) .
     $ <str-bc-higher-modes>]
  For each dipole write $m_(upright("ang")) = M Y$ and $b = A nabla_gamma Y$.
    Since $lambda_1 = 2$, the remaining equations are
  #[#set math.equation(numbering: n => "(3.60)")
   $ dot(M) = - M / S_0^2 + frac(t A, S_0) \, wide dot(A) = - frac(t^2 A, S_0^2) +
     frac(\( t - dot(t) \) M, S_0^3) . $ <str-bc-dipole-ode>]
  This finite linear system has a unique smooth solution throughout the chosen bounded interval.
    All of its norms are finite once the profile, $P$, and the harmonic cutoff have been fixed.
    Its equations preserve the mean of $m_(upright("ang"))$.
  To join smoothly to the previous stage, use an overlap of fixed logarithmic length on which $t = P$.
    Start with the prescribed mass coefficients and $A = 0$, and multiply the right sides of the derivative
    equations (3.59) and (3.60), and the formula for $u_ell$, by a cutoff increasing smoothly from zero to one.
    At constant $P$, the equations imply on this overlap
  $ \| A \| + \| dot(A) \| lt.eq C_N P^(- 2) \, wide \| dot(M)_ell \| lt.eq C_N P^(- 2) \, wide \| u_ell \| lt.eq
    C_N P^(- 1) . $
  The first estimate follows directly from the scalar equation for $A$ by variation of constants;
    its source is $P M \/ S_0^3 = O \( P^(- 2) \)$ and its zeroth-order coefficient is bounded.
    The mass coefficients remain bounded by the same finite-dimensional estimate.
    Inserting these bounds into the uncancelled parts of Equations (3.56) and (3.56) bounds them by $C_N \/ P$.
    Continue the radial repair with a smooth derivative of this size until the cutoff is identically one.
    It can decrease to zero in proportion to one minus that cutoff; its total cost is at most $C_N \/ P$.
    Thereafter the displayed angular equations hold exactly and no further radial mass bump is needed.
  ===== 3.7.5 The final dipole adjustment. <the-final-dipole-adjustment.>
  Take $t = 0$ after the preceding profile, flat at the join.
    Equations (3.59) and (3.60) then give $dot(M)_ell = - lambda_ell M_ell \/ 2$, $dot(A) = 0$, and $u = 0$.
    Let $C_1$ denote the sum of the resulting dipole potentials, so initially $b = nabla_gamma C_1$.
    On one further bounded logarithmic interval set
  #[#set math.equation(numbering: n => "(3.61)")
   $ F = 1 - 2 m \/ s \, quad k = a \/ s^2 \, quad G = b \/ s^2 \, quad U = 0 \, quad
     h = \( dot(a) - a + "div"_gamma b \/ 2 \) \/ s^2 \, $ <str-bc-final-ansatz>]
  where
  #[#set math.equation(numbering: n => "(3.62)")
   $ a = zeta C_1 \/ 2 \, wide b = nabla_gamma A_1 \, wide A_1 = C_1 - a \, $ <str-bc-final-interpolation>]
  and $zeta$ rises smoothly from zero to one, flat at both endpoints.
    Continue $dot(m)_(upright("ang")) = Delta_gamma m \/ 2$ and keep $rho$ constant.
    The leading tangential momentum in this convention is $s^(- 3) nabla_gamma partial_(log s) \( a + A_1 \)$,
    which vanishes identically. The normal leading term also cancels. There is no new leading Hamiltonian term:
    direct substitution of Equation (3.61) gives
  #[#set math.equation(numbering: n => "(3.63)")
   $ cal(H) = frac(4 dot(m) - 2 Delta_gamma m \/ F, s^3) +
     frac(- 6 \| nabla_gamma m \|^2 \/ F^2 + 4 a dot(a) - 2 a^2 + 2 a "div"_gamma b - 2 \| b \|^2, s^4) .
     $ <str-bc-final-H>]
  In particular all new errors are $O \( s^(- 4) \)$. The formula uses $F = 1 - 2 m \/ s$, not $1 + s^2 k^2 -
    2 m \/ s$; the difference belongs to the displayed quadratic order.
    The join is smooth because initially $a = 0$, and the preceding $t$ profile is already zero with all derivatives.
  At the endpoint $a = A_1 = C_1 \/ 2$ is independent of $s$ and $Delta_gamma a = - 2 a$. Thus
  #[#set math.equation(numbering: n => "(3.64)")
   $ B_(n n) = 2 a \/ s^2 \, wide B_T = - a I \/ s^2 \, wide B_(n T) = nabla_gamma a \/ s^2 \, wide "tr"_q B =
     0 . $ <str-bc-tracefree-tail>]
  This is exact tracefreeness, rather than an asymptotic trace estimate.
  ===== 3.7.6 Error bounds and the order of choices. <error-bounds-and-the-order-of-choices.>
  Here is the constraint ledger; its errors are expressed after multiplication by $s^3$.
    The positive contribution retained at every stage is $4 delta d s^(- delta)$.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[Error or repair size
], table.cell(rowspan: 1, colspan: 1)[Total added mean mass
]),
  table.cell(rowspan: 1, colspan: 1)[Initial interpolation and cutoff of $k - 1$
], table.cell(rowspan: 1, colspan: 1)[$C \/ s$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[Finite harmonic interpolation
], table.cell(rowspan: 1, colspan: 1)[$C eta dot(chi) + C \/ s$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq C eta$
],
  table.cell(rowspan: 1, colspan: 1)[Large boost reduction
], table.cell(rowspan: 1, colspan: 1)[$C_N \( 1 + t + \| dot(t) \| \) \/ \( 1 + t^2 \)$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq C_N \/ P$
],
  table.cell(rowspan: 1, colspan: 1)[Overlap for angular equations
], table.cell(rowspan: 1, colspan: 1)[$C_N \/ P + C_(N \, P) \/ s$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq C_N \/ P$
],
  table.cell(rowspan: 1, colspan: 1)[Bounded boost and dipole adjustment
], table.cell(rowspan: 1, colspan: 1)[$C_(N \, P) \/ s$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[Final infinite tail
], table.cell(rowspan: 1, colspan: 1)[$C_(N \, P) \/ s$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
)
]
  The constants in the last three rows also depend on the fixed smooth profiles.
    Choose first $eta$ and the finite harmonic approximation with $C eta < epsilon \/ 3$.
    Next choose $P$ so large that the sum of the two $C_N \/ P$ costs is less than $2 epsilon \/ 3$.
    Then fix the bounded boost, overlap, and final dipole profiles and solve their finite linear systems.
    Only now choose the starting radius $R$ large enough that $F > 0$ and
  #[#set math.equation(numbering: n => "(3.65)")
   $ C_(N \, P) s^(- 1) lt.eq delta d s^(- delta) wide \( s gt.eq R \) $ <str-bc-radius-choice>]
  for every remaining error constant. This is possible because $delta < 1$.
    The large boost formulas are exact, so the possibly large derivatives of that radius-dependent profile do not
    enter $C_(N \, P)$ in Equation (3.65). Smooth repairs may overlap the successive stages as described above;
    where a repair is turning on before $t$ departs from $s$, the errors have the initial smaller order,
    and where it turns off the angular cutoff is already becoming identically one.
    This proves a lower bound $c s^(- 3 - delta)$ for the new end.
    On the unchanged compact part the original strict inequality has a positive minimum.
    Together these give Equation (3.47).
  ===== 3.7.7 Decay, energy, and the metric comparison. <decay-energy-and-the-metric-comparison.>
  Let $s_(*)$ be the beginning of the final tail. Its coefficients have the form
  #[#set math.equation(numbering: n => "(3.66)")
   $ m = m_oo - d s^(- delta) + sum_(ell = 1)^N sum_j c_(ell j) \( s \/ s_(*) \)^(- lambda_ell \/ 2) Y_(ell j) \,
     wide m_oo = integral.slash mu + rho_oo . $ <str-bc-final-mass>]
  Every nonconstant mode is $O_oo \( s^(- 1) \)$. Since $dot(m) = delta d s^(- delta) + Delta_gamma m \/ 2$,
    the exact scalar formula is
  #[#set math.equation(numbering: n => "(3.67)")
   $ R_q = 4 delta d s^(- 3 - delta) - frac(4 m Delta_gamma m, s^4 F) - frac(6 \| nabla_gamma m \|^2, s^4 F^2) =
     4 delta d s^(- 3 - delta) + O_oo \( s^(- 5) \) . $ <str-bc-tail-scalar>]
  For example the exact endpoint momentum is
  $ s^3 cal(D)_n & = - 2 a \( 1 - sqrt(F) \) + frac(2 nabla a dot.op nabla m, s F) \,\
s^3 cal(D)_T & = \( sqrt(F) - 1 \) nabla a - frac(3 a nabla m, s F) . $
  It is $O_oo \( s^(- 4) \)$. Equations (3.66) and (3.64) prove all the symbol estimates in Equation (3.47);
    conversion to Cartesian derivatives loses one power of $s$ per derivative.
    In particular $q - delta_(upright("Eucl")) = \( F^(- 1) - 1 \) d s^2 = O_oo \( s^(- 1) \)$.
  For this metric the ADM integral at $s$ equals $s / 2 integral.slash \( F^(- 1) - 1 \)$.
    Indeed writing $q_(i j) = delta_(i j) + f omega_i omega_j$ with $f = F^(- 1) - 1$,
    the radial contraction of $partial_j q_(i j) - partial_i q_(j j)$ is $2 f \/ s$;
    angular derivatives cancel in this contraction. Its limit is $m_oo$.
    All angular changes have zero mean, and the radial additions are nonnegative with total at most $epsilon$,
    proving Equation (3.48).
  Throughout the large boost reduction $t lt.eq s$, and throughout the bounded boost $t lt.eq P lt.eq s$.
    Thus $F lt.eq 1 + s^2 + C \/ s$ everywhere after the initial interpolation.
    On the final dipole adjustment and tail the stronger bound $F lt.eq 1 + C \/ s$ holds.
    The original inverse radial coefficient is $1 + s^2 + O \( s^(- 1) \)$,
    and its mixed relative term is $O \( s^(- 4) \)$. Consequently comparison of the radial coefficients and the
    unchanged $s^2 gamma$ blocks gives $q gt.eq \( 1 - o_R \( 1 \) \) g$ uniformly on the modified end.
    The initial interpolation has the same bound. Increase $R$ once more to obtain Equation (3.47).
    This lower comparison also gives completeness. The boundary and the number of ends are unchanged.
    Every admissible full cut is the same embedded submanifold before and after the construction.
    Restricting $q gt.eq \( 1 - epsilon \) g$ to its two-dimensional tangent planes gives $"Area"_q \( Gamma \)
    gt.eq \( 1 - epsilon \) "Area"_g \( Gamma \)$. Taking the infimum over the full intrinsic boundaries,
    including $S$ when $D = Omega$, proves the asserted area comparison. ◻
]

=== 3.8 Completion of the one-sign inequality <completion-of-the-one-sign-inequality>

#proof[
  If $K - \( "tr" K \) g lt.eq 0$, replace $K$ by $- K$. Indeed $"tr"_T K gt.eq 0$ for every two-plane,
    so this decreases the future expansion and preserves DEC. We may therefore assume $K - \( "tr" K \) g gt.eq 0$.
  Apply Lemma 11 and first fix one prepared data set, suppressing its index.
    Add the short inner collar from Lemma 12. Solve the saturating Dirichlet problem there with height $D$,
    and restrict its stress to the original exterior. Lemma 22 gives strict flat-cosmological DEC and strict
    future trapping for $\( g \, K + L \)$. The stress is smooth on an end,
    and it can be smoothed on the remaining compact region without changing either the end or the strict conditions.
  Proposition 3.15, with arbitrarily small error, produces a smooth asymptotically Euclidean exterior satisfying
    all hypotheses in Equation (3.2), with
  $ E lt.eq p_0 \( g \) - 1 / 2 integral.slash C_D^3 + epsilon.alt \, wide
    A_q \( S \) gt.eq \( 1 - epsilon.alt \) A_g \( S \) . $
  Theorem 25 therefore gives, on letting $epsilon.alt arrow.b 0$,
  $ p_0 \( g \) gt.eq sqrt(frac(A_g \( S \), 16 pi)) + 1 / 2 integral.slash C_D^3 gt.eq
    sqrt(frac(A_g \( S \), 16 pi)) + 1 / 2 \( cal(F)_D \/ \( 4 pi \) \)^(3 \/ 2) . $
  For each fixed added collar, let $D arrow.r oo$ and use Lemma 21.
    Then let the collar width tend to zero and use Equation (3.11).
    This proves Equation (3.1) for the prepared data. Finally,
    remove the preparation using the mass and area convergence in Lemma 11.
  Every limiting operation just used is a limit of scalar inequalities.
    No smooth limiting stress as $D arrow.r oo$, or regular limiting metric at equality,
    is required for this argument. The fixed-chart proof did not use a sign or timelikeness assumption on the flux
    covector. If it is future timelike, a background hyperbolic isometry makes its time component equal to its
    Lorentz norm. The geometric and decay hypotheses, the compact support and sign of the constraint stress,
    and the cut area are unchanged. Lemma 6 then proves the final assertion. ◻
]

== 4 Flat deformation: equations and floor separation <sec:fl-system-floor>

We first state the asymptotically flat estimate used in the change of asymptotic model.
  The second fundamental form in this estimate need not have compact support.

#thm([Theorem 4.1.])[
  (Flat deformation estimate).  #emph[Let $\( Omega_(upright("orig")) \, q \, B \)$ be smooth three-dimensional
    initial data on a connected orientable manifold with nonempty compact smooth boundary $S_0$.
    Assume that the metric space including $S_0$ is complete and has exactly one asymptotically Euclidean end.
    On that end, in Euclidean coordinates of radius $r$, suppose that, for some $0 < delta < 1$,
#[#set math.equation(numbering: n => "(4.1)")
 $ q - delta_(upright("Eucl")) = O_oo \( r^(- 1) \) \, wide R_q = O_oo \( r^(- 3 - delta) \) \, wide B =
   O_oo \( r^(- 2) \) \, wide "tr"_q B = 0 . $ <eq:fl-data-decay>]

 Here $O_oo \( r^(- a) \)$ includes all differentiated symbol estimates:
   each Euclidean derivative lowers the indicated order by one.
   Extend $r$ to a positive smooth function on the whole manifold. Suppose that there is $c_(*) > 0$ such that
#[#set math.equation(numbering: n => "(4.2)")
 $ R_q + \( "tr"_q B \)^2 - \| B \|_q^2 - 2 \| "div"_q #scale(x: 120%, y: 120%)[\(] B - \( "tr"_q B \) q
   #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\|]_q gt.eq c_(*) \( 1 + r \)^(- 3 - delta) \,
   $ <eq:fl-strict-dec>]

 and that $H_q + "tr"_(S_0) B < 0$ on every component of $S_0$, with the normal pointing into the exterior.]
  #emph[For every connected smooth codimension-zero submanifold-with-boundary $D subset Omega_(upright("orig"))$,
    closed as a subset and with $"int" D subset "int" Omega_(upright("orig"))$,
    that contains the entire sufficiently distant end and whose #emph[full compact intrinsic boundary] is smoothly
    embedded and two-sided, use that entire boundary as an enclosing cut.
    Allow coincidence with components of $S_0$, and allow $D = Omega_(upright("orig"))$, whose cut is $S_0$. Set
$ A_(*) = inf_D "Area"_q \( partial D \) . $

 Then the metric ADM energy satisfies
$ E_q gt.eq sqrt(frac(A_(*), 16 pi)) . $

 The boundary, the intermediate cuts, and the compact interior topology are otherwise unrestricted.]
] <thm:fl-deformation>

The energy here is

$ E_q = frac(1, 16 pi) lim_(R arrow.r oo) integral_({ r = R }) \( partial_j q_(i j) - partial_i q_(j j) \)
  nu_(upright("Eucl"))^i thin thin upright(d) A_(upright("Eucl")) . $

Its existence follows from the scalar-curvature divergence identity:
  the linearized scalar curvature differs from $R_q$ by an integrable $O \( r^(- 4) \)$ error under
  Equation (4.1). The proof of Theorem 25 occupies this section and the subsequent analytic completion.
  It is completed in Theorem 67.

For its proof write $g = q$ and $K = B$. In this flat section the constraint densities contain no cosmological term:

#[#set math.equation(numbering: n => "(4.3)")
 $ 16 pi mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, wide 8 pi J =
   "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] \, wide M_d =
   8 pi \( mu - \| J \|_g \) . $ <eq:fl-flat-constraints>]

In particular $M_d gt.eq \( c_(*) \/ 2 \) \( 1 + r \)^(- 3 - delta)$ and $"tr"_g K$ has compact support.
  All derivatives and contractions below refer to $g$, unless another metric is specified.

=== 4.1 Full bounding regions and the two thresholds <subsec:fl-regions>

For a symmetric tensor $Q$, a two-sided surface $Sigma$, and a specified normal $n$, put

$ Theta_Q \( Sigma \, n \) = H_Sigma \( n \) + "tr"_Sigma Q . $

We will repeatedly use the two identities

#[#set math.equation(numbering: n => "(4.4)")
 $ Theta_(Q - \( c \/ 2 \) g) = Theta_Q - c \, wide Theta_(- Q) \( Sigma \, - n \) = -
   Theta_Q \( Sigma \, n \) . $ <eq:fl-expansion-signs>]

The factor $1 \/ 2$ is the reciprocal of the surface dimension.

We use the following barrier and total-region theorem in its bounding-domain formulation.
  We record the boundary conventions to distinguish it from an assertion about arbitrary, possibly nonbounding,
  marginal surfaces.

#thm([Lemma 4.2.])[
  (MOTS barriers and the total bounding trapped region).  #emph[Let $\( M \, g \, Q \)$ be a smooth compact
    three-manifold with boundary $Gamma_(-) union.sq Gamma_(+)$.
    Every connected component of $M$ is required to meet $Gamma_(+)$.
    The outer part $Gamma_(+)$ has $Theta_Q > 0$ with its normal out of $M$.
    The required inner part $Gamma_(-)$ may be empty; when present it has $Theta_Q < 0$ with its normal into $M$.]
  #emph[Consider all smooth bounding domains that contain a relative collar of $Gamma_(-)$, avoid $Gamma_(+)$,
    and whose free boundary has $Theta_Q lt.eq 0$ with the normal out of the domain.
    If this collection is nonempty, the closure of its union has smooth compact embedded stable MOTS free
    frontier. It is itself the closure of a bounding domain and contains every domain in the collection.
    If $Gamma_(-) eq.not diameter$, the strict inner and outer barriers give a nonempty smooth enclosing MOTS.
    Boundary parts and frontiers may be disconnected. No constraint or energy condition on $Q$ is required.]
] <lem:fl-mots-barriers>

#proof[
  This is the total-region theorem of #cite(label("anderssonmetzger2009")) Definitions 7.1–7.2 and Theorem 7.3,
    together with its strict-barrier existence theorem and stability conclusion
    #cite(label("anderssonmetzger2009")) Theorems 3.1 and 4.1.
    The conventions in Section 2 of that paper allow an empty required inner boundary for the total-region
    theorem. Apply these results on each connected component of $M$:
    its outer part is nonempty, and strict-barrier existence is used only when its own inner part is nonempty.
    A component with empty inner part contributes a frontier only if its collection of trapped domains is
    nonempty. Take the finite union of the resulting regions.
    Each free frontier is oriented toward the designated outer part.
    Their domains include the entire required inner boundary, which is not discarded as an empty relative frontier. ◻
]

A component of the complement of a smooth bounding domain that meets no designated outer face can be filled.
  This deletes whole free boundary components and preserves the expansion bound on all remaining components.
  Thus a full maximal region is filled in this sense.

Choose $R_0$ so large that every coordinate sphere with $r gt.eq R_0$ has positive expansion for both $K$ and $-
  K$. Indeed

$ H_({ r = R }) = 2 / R + O \( R^(- 2) \) \, wide \| K \| = O \( R^(- 2) \) . $

No bounding domain with $Theta_(plus.minus K) lt.eq c lt.eq 0$ can reach this part of the end.
  At a maximum of its boundary radius, the domain lies inside the tangent coordinate sphere and its outward normal
  is radial. The second-derivative comparison gives mean curvature at least that of the sphere,
  contradicting its nonpositive expansion. All negative-threshold regions therefore lie in a fixed compact radial
  range, independent of threshold and of a sufficiently large truncation.

For

$ max_(S_0) Theta_K \( S_0 \) < c < 0 $

let $cal(B)_c$ be the closed total bounding region for $Theta_K lt.eq c$,
  requiring all of $S_0$ on its inner side. A short relative collar of $S_0$ is a strict seed.
  Apply Lemma 26 to $K - \( c \/ 2 \) g$ on a large truncation.
  It gives a smooth stable frontier with expansion $c$. The regions $cal(B)_c$ increase with $c$.

Fix a threshold $c_b < 0$, to be selected below, and write $cal(B) = cal(B)_(c_b)$.
  In its complement use the entire reversed black frontier and a distant coordinate sphere as outer barrier faces.
  For the tensor $- K$ the reversed black expansion is $- c_b > 0$. There is no required inner face.
  The original truncation is connected, and the black region is filled relative to the distant sphere.
  Its remaining complement is therefore the component containing that sphere;
  in particular it has a designated outer face. Let $cal(W)_c$ be the closed total region for $Theta_(- K) lt.eq
  c < 0$ in this complement, and set it equal to the empty set if its defining collection is empty.
  For the shifted tensor $- K - \( c \/ 2 \) g$, the reversed black expansion is $- c_b - c > 0$;
  hence Lemma 26 applies. A nonempty $cal(W)_c$ has smooth stable frontier of expansion $c$,
  disjoint from the black faces. This family is increasing with $c$, while $cal(B)$ remains fixed.

#thm([Lemma 4.3.])[
  (Right-continuous thresholds).  #emph[Let $E_c$ be an increasing family of closed subsets of a fixed compact
    metric space. Except at a countable set of parameters,
$ E_(c_j) arrow.r E_c quad upright("in Hausdorff distance whenever ") c_j arrow.b c . $

 At an empty $E_c$, this means that $E_(c')$ is empty for all sufficiently close $c' > c$.]
] <lem:fl-right-continuity>

#proof[
  Choose a countable dense set $x_i$ and $L$ larger than the diameter of the compact space. Set
  $ d_c \( x \) = min { L \, "dist" \( x \, E_c \) } \, wide d_c equiv L quad upright("if ") E_c = diameter . $
  For every $i$, the bounded nonincreasing function $c mapsto
    d_c \( x_i \)$ has at most countably many right discontinuities. Avoid their countable union.
    The functions $d_c$ are uniformly $1$-Lipschitz, so convergence at the dense set implies uniform convergence
    by a finite net argument. Nesting gives one Hausdorff inclusion;
    if points in $E_(c_j)$ stayed a positive distance from $E_c$,
    evaluating the uniformly convergent distance functions at those points would contradict $d_(c_j) = 0$ there.
    If $E_c$ is empty, uniform convergence to $L$ is incompatible with a zero of any $d_(c_j)$. ◻
]

Choose $c_b$ at such a continuity point of the black family,
  then choose $c_w < 0$ at such a continuity point of the white family for this fixed black region.
  Both choices can be made arbitrarily close to zero. Write $cal(W) = cal(W)_(c_w)$.
  Let $Omega$ be the closure of the component of $Omega_(upright("orig")) \\ \( cal(B) union cal(W) \)$ that
  reaches infinity. Its compact boundary is a finite disjoint union of whole frontier components:

#[#set math.equation(numbering: n => "(4.5)")
 $ B = partial Omega = B_b union.sq B_w \, wide H + P_B = c_b med upright("on ") B_b \, wide H - P_B = c_w med
   upright("on ") B_w \, wide P_B = "tr"_B K . $ <eq:fl-face-data>]

Here and below $nu$ points into $Omega$, and $H = H_B \( nu \)$.
  Some black frontier components may be cut off from infinity by the white region;
  only the whole components bounding $Omega$ are retained. The white type, or either retained type, may be absent.

Every full enclosing cut of $Omega$ is also a full enclosing cut of $Omega_(upright("orig"))$.
  More explicitly, its connected closed exterior submanifold is a submanifold of the original exterior,
  contains the distant end, and has the same entire intrinsic boundary.
  The discarded side contains the original $S_0$ and a collar of it. Consequently

#[#set math.equation(numbering: n => "(4.6)")
 $ "Area"_g \( Gamma \) gt.eq A_(*) quad upright("for every admissible enclosing cut ") Gamma upright(" in ")
   Omega . $ <eq:fl-cut-inclusion>]

No minimizing property of the new boundary is asserted or needed.

#thm([Lemma 4.4.])[
  (Outward collars of a maximal frontier).  #emph[If $Sigma$ is a connected component of the smooth frontier of a
    full maximal region at threshold $c$ for $Q$, it has a smooth outward foliation $Sigma_s$, $0 lt.eq s < s_0$,
    such that
$ Theta_Q \( Sigma_0 \) = c \, wide Theta_Q \( Sigma_s \) > c quad \( 0 < s < s_0 \) . $

 The leaf parameter is a smooth defining function, and $\| thin upright(d) s \|$ is bounded above and away from zero.]
] <lem:fl-frontier-collars>

#proof[
  For normal graphs $v$ over $Sigma$, let $Phi \( v \) = Theta_Q \( Sigma \( v \) \) - c$, pulled back to $Sigma$.
    Its linearization $L$ is the scalar MOTS stability operator for $Q - \( c \/ 2 \) g$, with principal part $-
    Delta_Sigma$. Stability gives a principal eigenvalue $lambda gt.eq
    0$ and a positive smooth eigenfunction $phi$. If $lambda > 0$, the graphs $v = s phi$ have $Phi \( s phi \) =
    s lambda phi + O \( s^2 \) > 0$ and positive velocity for sufficiently small $s > 0$.
  If $lambda = 0$, the kernel of $L$ is spanned by $phi > 0$, and its adjoint kernel is spanned by $phi^(*) > 0$.
    These scalar elliptic principal-eigenfunction properties also follow by applying the maximum principle after
    dividing a kernel element by $phi$, together with Fredholm index zero. The derivative of the augmented map
  $ \( v \, a \) mapsto (Phi \( v \) - a \, integral_Sigma v thin thin upright(d) A) $
  is
  $ \( v \, a \) mapsto (L v - a \, integral_Sigma v thin thin upright(d) A) . $
  It is an isomorphism. For a prescribed first component $f$, pairing with $phi^(*)$ uniquely fixes $a = -
    integral phi^(*) f \/ integral phi^(*)$; adding a unique multiple of $phi$ then fixes the second component.
    The implicit-function theorem supplies $v \( s \) \, a \( s \)$ with output $\( 0 \, s \)$.
    Differentiation gives $a' \( 0 \) = 0$ and $v' \( 0 \) = phi \/ integral_Sigma phi > 0$.
    Thus the graphs are ordered and have constant expansion $c + a \( s \)$.
    If $a \( s \) lt.eq 0$ for any sufficiently small $s > 0$,
    replacing this one frontier component by that outer graph enlarges the bounding region while keeping every
    free component at expansion at most $c$. This contradicts maximality.
    The claimed bounds on the leaf parameter follow from positive velocity and compactness. ◻
]

Apply this lemma with $Q = K$ on black faces and $Q = - K$ on white faces.
  Choose disjoint collars of the finitely many retained components.
  Their outward leaf normal is $nu_s = nabla s \/ \| nabla s \|$.

=== 4.2 Exterior supports and smooth enclosures <subsec:fl-supports>

#prodef([Definition 4.5.])[
  (Exterior-support expansion).  For a closed set $E$, a smooth exterior support at $x in partial
    E$ is a smooth function $phi.alt$ near $x$ satisfying $phi.alt \( x \) = 0$,
    $thin upright(d) phi.alt \( x \) eq.not 0$, and $E subset { phi.alt lt.eq 0 }$ locally.
    With $n = nabla phi.alt \/ \| nabla phi.alt \|$, put
  $ cal(E)_Q \[ phi.alt \] = frac(\( g^(i j) - n^i n^j \) nabla_i nabla_j phi.alt, \| nabla phi.alt \|) +
    "tr"_g Q - Q \( n \, n \) . $
  The set has exterior-support expansion at most $c$ if $cal(E)_Q \[ phi.alt \] \( x \) lt.eq
    c$ for #emph[every] such support at every frontier point $x$.
] <def:fl-exterior-support>

For a smooth domain this is precisely an upper bound on its outward expansion.
  A smooth exterior supporting graph has mean curvature no larger than that of the enclosed graph.
  Increasing smooth changes of defining function preserve $cal(E)_Q$,
  since the extra axial Hessian has zero tangential trace.

#thm([Lemma 4.6.])[
  (Distance neighborhoods with an additive support error).  #emph[Suppose that the frontier of a closed set $E$
    lies in a fixed compact interior region of smooth data $\( M \, g \, Q \)$,
    and has exterior-support expansion at most $c$. For sufficiently small $z > 0$,
    the distance neighborhood $E_z = { "dist" \( thin dot.op thin \, E \) lt.eq
    z }$ has exterior-support expansion at most $c + C z$. The constant and the allowable radius depend only on
    the compact ambient geometry and $Q$, independently of the support’s curvature and the regularity of $E$.]
] <lem:fl-support-parallel>

#proof[
  Let $phi.alt$ support $E_z$ at $x'$, and choose a nearest point $x in E$,
    joined to $x'$ by a length-$z$ minimizing unit geodesic $gamma$.
    Choose $z$ below the injectivity radius of the fixed compact neighborhood.
    Since the ball of radius $z$ centered at $x$ is inside $E_z$,
    the support normal at $x'$ is $dot(gamma) \( z \)$. Let $P_t$ denote parallel transport along $gamma$.
  For $X in T_x M$, solve the Jacobi boundary-value problem
  $ nabla_(dot(gamma))^2 J_X + "Rm" \( J_X \, dot(gamma) \) dot(gamma) = 0 \, wide J_X \( 0 \) = X \, wide
    J_X \( z \) = P_z X . $
  In a parallel frame its integral equation is
  $ j_X \( t \) = X + t A_X - integral_0^t \( t - s \) cal(R) \( s \) j_X \( s \) thin thin upright(d) s \, wide
    A_X = 1 / z integral_0^z \( z - s \) cal(R) \( s \) j_X \( s \) thin thin upright(d) s . $
  For small $z$, absorption gives $sup_t \| j_X \( t \) \| lt.eq 2 \| X \|$ and $\| A_X \| lt.eq C z \| X \|$.
    Moreover $chevron.l J_X \, dot(gamma) chevron.r$ is affine with equal endpoint values.
    Hence $A_X$ is perpendicular to $dot(gamma) \( 0 \)$. We can prescribe the first jet of a local unit vector
    field $V$ by
  $ V \( x \) = dot(gamma) \( 0 \) \, wide nabla_X V \( x \) = A_X . $
  To realize this jet, use a frame obtained by radial parallel transport from $x$,
    choose affine coefficients with the prescribed first jet, and normalize their length.
    The perpendicularity just proved means that normalization preserves the first derivative.
    The second derivatives of this unit field have a uniform bound on a small ball.
  For $F_z \( y \) = exp_y \( z V \( y \) \)$, the Jacobi construction gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ F_z \( x \) = x' \, wide \( thin upright(d) F_z \)_x = P_z \,
     wide \| \( nabla thin upright(d) F_z \)_x \| lt.eq C z . $ <eq:fl-support-map>]
  For the last estimate, differentiate the exponential map twice, including the bounded jets of $V$.
    At $z = 0$ the map is the identity and its covariant second derivative is zero;
    the first derivative in $z$ is uniformly bounded on these jets.
    This construction never uses derivatives of the supporting function.
  Every $y in E$ near $x$ is moved a distance $z$, so $F_z \( y \) in E_z$.
    Thus $psi = phi.alt compose F_z$ supports $E$ at $x$. Equation (4.7) makes its gradient length exactly that of
    $phi.alt$ at $x'$, and its normal is $dot(gamma) \( 0 \)$. The covariant chain rule reads
  $ "Hess" psi \( X \, Y \) = "Hess" phi.alt \( P_z X \, P_z Y \) +
    thin upright(d) phi.alt #scale(x: 120%, y: 120%)[\(] \( nabla thin upright(d) F_z \) \( X \, Y \)
    #scale(x: 120%, y: 120%)[\)] . $
  Trace over $dot(gamma) \( 0 \)^perp$ and divide by the common gradient length.
    The first term is exactly the normalized tangential Hessian of $phi.alt$; the second costs $C z$.
    Parallel transport changes the tangential trace of $Q$ by at most $C z$.
    Therefore $\| cal(E)_Q \[ psi \] \( x \) - cal(E)_Q \[ phi.alt \] \( x' \) \| lt.eq C z$.
    The assumed bound for $psi$ proves the result. In particular there is no error proportional to $z \| "Hess"
    phi.alt \|$. ◻
]

#thm([Lemma 4.7.])[
  (Smooth enclosure from all exterior supports).  #emph[Let $M$ be a smooth compact connected three-manifold with
    boundary $Gamma_(-) union.sq Gamma_(+)$, where $Gamma_(+) eq.not diameter$.
    Let $E eq.not diameter$ be closed, contain a relative collar of the required $Gamma_(-)$ if it is present,
    and have positive distance from $Gamma_(+)$. Suppose every exterior support of its interior frontier has
    $Q$-expansion at most $c$. If
$ c' > c \, wide Theta_Q \( Gamma_(+) \) > c' $

 with the outward normal of $M$, then $E$ is strictly enclosed by a smooth bounding domain whose free frontier has
   expansion $c'$. In particular it lies in the full closed trapped region at threshold $c'$.
   The enclosing domain and frontier may be disconnected.]
] <lem:fl-support-enclosure>

#proof[
  Take $u > 0$ sufficiently small that all new distance frontiers are in a fixed compact interior neighborhood,
    avoid $Gamma_(+)$, and satisfy $c + C u < c'$ in Lemma 30.
    The collar of $Gamma_(-)$ ensures that a nearest segment ending on a new distance frontier starts on the
    interior frontier of $E$; no extension across the required boundary is needed.
  Uniformly approximate $"dist" \( thin dot.op thin \, E \)$ by a smooth function with error below $u \/ 32$,
    using a finite coordinate cover, mollification, and a partition of unity.
    A regular value between $u \/ 3$ and $u \/ 2$ gives a smooth relative neighborhood $U$ with
  $ E_(u \/ 4) subset U subset E_(3 u \/ 4) . $
  Fill any component of its complement that meets no designated outer face.
    This may enlarge its interior beyond $E_(3 u \/ 4)$, but only deletes free frontier components;
    all remaining frontier points still have distance between $u \/ 4$ and $3 u \/ 4$ from $E$.
  Choose a smooth $eta$, equal to one on that compact free frontier, with $0 lt.eq eta lt.eq
    1$ and support in ${ "dist" \( thin dot.op thin \, E \) < u }$. For a sufficiently large finite $A > 0$, set
  $ Q_A = Q - 1 / 2 \( c' + A eta \) g . $
  The free frontier of $U$ is strictly negative for $Q_A$, while the outer faces remain strictly positive.
    Apply the strict-barrier part of Lemma 26 to each component of the complement of $U$.
    Each meets an outer face by filling and has nonempty inner boundary by connectedness of $M$ and $U eq.not
    diameter$. The resulting smooth frontier $Sigma$ encloses $U$ and satisfies
  #[#set math.equation(numbering: n => "(4.8)")
   $ Theta_Q \( Sigma \) = c' + A eta gt.eq c' . $ <eq:fl-modified-mots>]
  If $Sigma$ enters the support of the modification, let $z = min_Sigma "dist" \( thin dot.op thin \, E \) < u$.
    We have $z gt.eq u \/ 4 > 0$, and $E_z$ lies on the enclosed side of $Sigma$.
    Indeed, a point at distance less than $z$ from $E$ can be joined to $E$ by a path of length less than $z$;
    crossing $Sigma$ would give a point of $Sigma$ at smaller distance.
    At a minimizing point, a defining function of $Sigma$ is therefore an exterior support of $E_z$.
    It has expansion at most $c + C z < c'$, contradicting Equation (4.8).
    Thus $eta = 0$ on all of $Sigma$, giving the desired expansion.
    The inclusion $E_(u \/ 4) subset U$ makes the enclosure strict.
    Filling remaining components without an outer face again only deletes whole smooth boundary components. ◻
]

This lemma applies after truncating an exterior by a strict distant sphere.
  For the white construction the reversed black faces belong to $Gamma_(+)$, and there is no required $Gamma_(-)$.
  An empty weak set requires no enclosure. Also, filling a closed set preserves any bound on all exterior
  supports: its new frontier is contained in the old closed set,
  and a support of the larger filled set also supports the old one at every remaining frontier point.

=== 4.3 Small offsets and the prepared data <subsec:fl-offsets>

#thm([Lemma 4.8.])[
  (Threshold preparation and offsets).  #emph[The thresholds and the prepared exterior above can be chosen so that
    both full threshold families are right-continuous at their chosen thresholds,
    the retained faces have disjoint collars as in Lemma 28, and Equation (4.6) holds.
    There are a smooth compactly supported $C$, constants $C_b > 0 > C_w$, positive collar constants $k_B$,
    and a smooth $rho > 0$, equal far out to a positive constant times $r^(- 3 - delta)$, such that
#[#set math.equation(numbering: n => "(4.9)")
 $ & C_w lt.eq C lt.eq C_b \, wide C = C_b - k_B s med upright("near ") B_b \, wide C = C_w + k_B s med
   upright("near ") B_w \,\
 & b_(-) = c_b - C_b < 0 \, wide b_(+) = - c_w - C_w > 0 \,\
 & \| \( h + C \) "tr" K \| + \| thin upright(d) C \| + rho lt.eq M_d wide upright("for all ") b_(-) lt.eq h lt.eq
   b_(+) . $ <eq:fl-offset-shape>]

 All these data are fixed before the deformation parameters.]
] <lem:fl-threshold-preparation>

#proof[
  Fix a compact set containing the common radial range of all the negative-threshold regions and
    $"supp" \( "tr" K \)$. On this compact set $M_d$ has a positive minimum.
    Restrict $c_b \, c_w$ sufficiently close to zero so that $max { \| c_b \| \, \| c_w \| } \| "tr"
    K \|$ uses less than one quarter of this minimum. The two successive right-continuity choices remain possible
    by Lemma 27. Fix the regions and their collars.
  On each collar take a smooth cutoff $kappa \( s \)$, equal to one near the face and zero near its far end,
    and choose $k > 0$ such that $1 - k s > 0$ throughout that collar.
    A black contribution $a_0 kappa \( s \) \( 1 - k s \)$ and a white contribution $-
    a_0 kappa \( s \) \( 1 - k s \)$, extended by zero and summed over disjoint collars,
    give the required $C$ with $C_b = a_0$, $C_w = - a_0$, and $k_B = a_0 k$.
    The $C^1$ norm tends to zero with $a_0$, after the collars have been fixed. Since
  $ \| h + C \| lt.eq max { \| c_b \| \, \| c_w \| } + C_b - C_w \, $
  choose $a_0$ small enough for the first two terms of Equation (4.9) to be at most $M_d \/ 2$.
    They vanish outside a compact set. Finally multiply a fixed smooth positive symbol weight,
    equal to $r^(- 3 - delta)$ on the end, by a small constant so that $rho lt.eq M_d \/ 2$ everywhere. ◻
]

When a retained type is empty its constants still serve as bounds and its collar terms are omitted.
  On the faces, the exact identities are

#[#set math.equation(numbering: n => "(4.10)")
 $ b_(-) + C = P_B + H quad upright("on ") B_b \, wide b_(+) + C = P_B - H quad
   upright("on ") B_w . $ <eq:fl-compatible-values>]

=== 4.4 Variables and the physical system <subsec:fl-equations>

Extend the end radius smoothly with $r gt.eq 1$, and write $Omega_R$ for the truncation with outer boundary $S_R$.
  First fix $0 < epsilon.alt < 1$, then choose an integer $N gt.eq 4$, $N > 2 \/ epsilon.alt$,
  and finally take $R gt.eq R_min \( N \, epsilon.alt \)$ as required by the estimates.
  A #emph[polynomial constant] means a quantity bounded by $C \( 1 + N \)^m$, with $C \,
  m$ depending on the fixed prepared geometry, profiles and $epsilon.alt$, but not on $R$, the solution,
  or the homotopy parameter. Later estimates allowed arbitrary dependence on fixed $N$ will be identified separately.

Take a smooth nonincreasing $theta.alt : bb(R) arrow.r \[ 0 \, 1 \]$,
  equal to one on $\( - oo \, 0 \]$ and zero on $\[ 1 \, oo \)$, and put

#[#set math.equation(numbering: n => "(4.11)")
 $ p \( t \) = N theta.alt \( N t \) \, wide l \( t \) = exp #h(-0.16667em)
   (integral_0^t p \( z \) thin thin upright(d) z) \, wide L \( t \) = e^(2 t) l \( t \) \, wide ell =
   e^(- epsilon.alt N) \, wide tau = ell^(3 \/ 2) . $ <eq:fl-profile>]

Thus $l = e^(N t)$ for $t lt.eq 0$, $l$ is constant for $t gt.eq 1 \/ N$,
  and every fixed-order derivative of $p$ is polynomially bounded.
  On $t gt.eq - epsilon.alt$, one has $ell lt.eq l lt.eq e$.

We solve for $\( f \, Z \)$; the formulas below define $t$ implicitly and then define the graph metric, flux,
  and source. For functions $f \, t$ define

#[#set math.equation(numbering: n => "(4.12)")
 $ & sigma = \| thin upright(d) f \| \, wide D = 1 + l^2 sigma^2 \, wide d = D^(- 1) \,\
 & a = frac(l sigma, sqrt(D)) \, quad v = a^2 = 1 - d \, quad w = frac(l nabla f, sqrt(D)) \, wide chi =
   frac(4 d, 4 + p v) \,\
 & Z = t + 1 / 8 log D \, wide h = tau f \, wide u = L sqrt(D) \, wide U = l sqrt(D) \,\
 & macron(g) = g + l^2 thin upright(d) f^2 \, wide hat(g) = e^(4 t) macron(g) \, wide H^f = l /
   sqrt(D) "Hess" f \, wide S = K + H^f . $ <eq:fl-variables>]

For $sigma > 0$, let $e = nabla f \/ sigma$ and $A_j = I + \( j - 1 \) e ⊗ e$.
  The matrices actually used have direction-free expressions

#[#set math.equation(numbering: n => "(4.13)")
 $ A_d = I - w ⊗ w \, wide A_chi = I - frac(p + 4, 4 + p \| w \|^2) thin w ⊗ w . $ <eq:fl-matrices>]

Vectors and covectors are identified using $g$. For fixed $thin upright(d) f$,

$ frac(partial Z, partial t) = 1 + frac(p v, 4) > 0 . $

The defining function of $Z$ tends to the corresponding infinite endpoint as $t arrow.r plus.minus oo$.
  Thus Equation (4.12) defines a unique smooth $t = t \( Z \, thin upright(d) f \)$ for every finite input,
  before imposing a floor. All the quantities in the actual equations are smooth at $thin upright(d) f = 0$.

The physical equations, in the unknowns $\( f \, Z \)$, are

#[#set math.equation(numbering: n => "(4.14)")
 $ & "tr"_(A_chi) S = F \, wide F = h + C \,\
 & "div" V = u Xi \, wide V = u A_chi #scale(x: 120%, y: 120%)[\(] 4 nabla Z +
   K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] . $ <eq:fl-trace>]

The notation $"tr"_A$ means contraction with the contravariant matrix $A$.
  The trace Hessian coefficient at fixed $Z$ is $l sqrt(d) thin A_chi$.
  The scalar principal coefficient at fixed trace field is $4 u A_chi$.
  Their eigenvalues are positive at all finite inputs; they are uniformly elliptic on bounded input ranges.
  The source below contains quadratic second derivatives of $f$.
  Separate positivity of these scalar principal matrices is therefore not being used as a coupled-system
  regularity theorem.

At $sigma > 0$, decompose $S$ into

$ P = S \|_(e^perp times e^perp) \, wide M = S \( e \, dot.op \) \|_(e^perp) \, wide q_1 = S \( e \, e \) \, wide
  "tr" P = F - chi q_1 . $

Write $x = partial_e t$, $y = nabla_perp t$, and $P^(upright("tf")) = P - 1 / 2 \( "tr" P \) g \|_(e^perp)$.
  Use the quadratic form

#[#set math.equation(numbering: n => "(4.15)")
 $ cal(T) =  & 1 / 2 \| P^(upright("tf")) \|^2 + \| M + \( p + 1 \) a y \|^2 + \[ 4 \( p + 1 \) - v \] \| y \|^2\
 & + 4 \( p + 1 \) d (x + frac(chi a q_1, 4 d))^2 + 3 / 4 (F - frac(chi q_1, 3))^2 +
   frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) q_1^2 . $ <eq:fl-quadratic-form>]

Here the actual trace $F = "tr"_(A_chi) S$ is substituted.
  Its smooth extension and polynomial coercivity are proved below.

Fix $3 \/ 4 < gamma < 1$ and smooth positive symbol weights

#[#set math.equation(numbering: n => "(4.16)")
 $ rho_0 asymp r^(- 3 - delta) \, wide rho_1 asymp r^(- 2 gamma) $ <eq:fl-weights>]

on the end. Define

#[#set math.equation(numbering: n => "(4.17)")
 $ & m_0 \( t \) = theta.alt #scale(x: 120%, y: 120%)[\(] N \( t + epsilon.alt \) #scale(x: 120%, y: 120%)[\)] \,
   wide W_N = rho_0 + v rho_1 \,\
 & Xi = delta_0 cal(T) + rho + delta_0 tau a sigma - m_0 \( t \) Pi_N W_N . $ <eq:fl-source>]

The constant $delta_0 > 0$ is chosen small independently of $N \, R$; $Pi_N =
  C_Pi \( 1 + N \)^m$ will then be chosen sufficiently large.
  On the allowed penalty band $- epsilon.alt lt.eq t lt.eq - epsilon.alt + 1 \/ N$,

$ ell lt.eq l lt.eq e ell \, wide L asymp_epsilon.alt ell . $

At $S_R$ prescribe $f = Z = 0$. On the inner boundary prescribe $h = b_(-)$ on $B_b$ and $h = b_(+)$ on $B_w$, and

#[#set math.equation(numbering: n => "(4.18)")
 $ V_nu / u = cal(B)_F \, wide cal(B)_F = - H + w_nu \( F - P_B \) - N_B d \, wide N_B > 1 +
   sup_B \| H \| . $ <eq:fl-boundary>]

=== 4.5 The graph identity and its coercive quadratic form <sec:fl-alg>

We supply the pointwise calculations used in the flat deformation.
  All derivatives, norms, traces, contractions, and divergences in this subsection refer to $g$,
  unless a different metric is displayed. A one-form in a divergence is identified with its $g$-dual vector.
  For symmetric covariant tensors define

$ \[ A \, B \] = chevron.l A \, B chevron.r - \( "tr" A \) \( "tr" B \) \, wide p_A = A - \( "tr" A \) g . $

In particular, the flat constraints have the normalization

#[#set math.equation(numbering: n => "(4.19)")
 $ R_g = 16 pi mu + \[ K \, K \] \, wide "div" p_K = 8 pi J . $ <eq:fl-alg-constraints>]

There is no cosmological term in these identities.

Write $p = \( log l \)' \( t \)$, so that $thin upright(d) l = p l thin thin upright(d) t$,
  and retain the graph and trace quantities defined above. The identities in this subsection require only $l > 0$,
  $0 lt.eq p lt.eq N$, and the trace equation $"tr"_(A_chi) S = F$.
  At a point where $thin upright(d) f eq.not 0$, use an orthonormal frame with first vector $e =
  nabla f \/ \| thin upright(d) f \|$, and decompose

$ S = mat(delim: "(", q_1, M^(sans(T)); M, P) \, wide thin upright(d) t = x e^flat + y \, wide y \( e \) = 0 . $

Here $P$ is a symmetric tensor on the two-dimensional plane $e^perp$, and

#[#set math.equation(numbering: n => "(4.20)")
 $ v = a^2 = 1 - d \, wide chi = frac(4 d, 4 + p v) \, wide P_0 := "tr" P = F - chi q_1 . $ <eq:fl-alg-blocks>]

We use $P^(upright("tf")) = P - 1 / 2 \( "tr" P \) g \|_(e^perp)$.
  The symbol $\| thin upright(d) t \|_(A_d)^2$ means $chevron.l A_d nabla t \, nabla t chevron.r = d x^2 + \| y \|^2$.

#thm([Lemma 4.9.])[
  (Differentiation and flux identities).  #emph[For $U = l sqrt(D)$, one has
#[#set math.equation(numbering: n => "(4.21)")
 $ 1 / 2 nabla log D & = H^f \( w \, dot.op \) + p v thin thin upright(d) t \,\
nabla_i w_j & = \( H^f A_d \)_(i j) + p d thin \( thin upright(d) t \)_i w_j \,\
nabla log u & = H^f \( w \, dot.op \) + \( 2 + p + p v \) thin upright(d) t . $ <eq:fl-alg-D-derivative>]

 Set
$ k = - H^f - p \( thin upright(d) t ⊗ w^flat + w^flat ⊗ thin upright(d) t \) \, wide Q = K - k . $

 Then the flux $V = u A_chi \( 4 nabla Z + K \( w \, dot.op \) \)$ satisfies
#[#set math.equation(numbering: n => "(4.22)")
 $ V / u & = p_Q \( w \, dot.op \) + 4 A_d nabla t + w F \,\
frac("div" \( u w \), u) & = F + \( 1 - chi \) q_1 - "tr" K + 2 \( p + 1 \) a x . $ <eq:fl-alg-flux-identity>]

 Every expression asserted to be an identity extends smoothly across $thin upright(d) f = 0$.]
] <lem:fl-alg-flux>

#proof[
  Differentiate $D = 1 + l^2 \| thin upright(d) f \|^2$, use $thin upright(d) l = p l thin thin upright(d) t$,
    and substitute $H^f = l "Hess" f \/ sqrt(D)$ and $w = l nabla f \/ sqrt(D)$. This gives (4.21).
    Differentiating the last formula for $w$, and using $1 - v = d$, gives
  $ nabla_i w_j = H_(i j)^f - H^f \( w \, dot.op \)_i w_j + p d thin \( thin upright(d) t \)_i w_j . $
  Since $A_d = I - w ⊗ w^flat$, this is (4.21). Equation (4.21) follows from $u = e^(2 t) l sqrt(D)$.
    Taking the trace of (4.21) and adding $chevron.l nabla log u \, w chevron.r$ gives
  $ frac("div" \( u w \), u) = "tr" H^f + 2 \( p + 1 \) a x . $
  Now $"tr" H^f = F + \( 1 - chi \) q_1 - "tr" K$, proving (4.22).
  From $Z = t + 1 / 8 log D$, Equation (4.21) yields
  $ 4 nabla Z + K \( w \, dot.op \) = \( 4 + p v \) nabla t + S \( w \, dot.op \) . $
  Its image under $A_chi$ has axial and transverse components
  $ 4 d x + chi a q_1 \, wide \( 4 + p v \) y + a M \, $
  because $chi \( 4 + p v \) = 4 d$. On the other hand,
  $ Q_(e e) = q_1 + 2 p a x \, wide Q_(e perp) = M + p a y \, wide Q_perp = P . $
  The same two components of $p_Q \( w \, dot.op \) + 4 A_d nabla t + w F$ are $- a P_0 + 4 d x +
    a F$ and $a \( M + p a y \) + 4 y$. Equation (4.20) identifies these with the preceding display,
    proving (4.22). Smoothness follows either from the original definitions or from
  #[#set math.equation(numbering: n => "(4.23)")
   $ A_chi = I - frac(p + 4, 4 + p \| w \|^2) thin w ⊗ w^flat . $ <eq:fl-alg-smooth-matrix>]
  In particular no choice of $e$ is needed at $w = 0$. ◻
]

#thm([Proposition 4.10.])[
  (Scalar-curvature identity).  #emph[Let
$ macron(g) = g + l^2 thin upright(d) f^2 \, wide hat(g) = e^(4 t) macron(g) . $

 For $cal(T)$ in (4.15), the exact identity is
#[#set math.equation(numbering: n => "(4.24)")
 $ 1 / 2 e^(4 t) R_(hat(g)) = 8 pi #scale(x: 120%, y: 120%)[\(] mu + J \( w \) #scale(x: 120%, y: 120%)[\)] +
   cal(T) + w \( F \) - F "tr" K - frac("div" V, u) . $ <eq:fl-alg-identity>]

]
] <prop:fl-alg-scalar>

#proof[
  #emph[The stationary calculation.] On a product with coordinate $s_0$, introduce the stationary Lorentz metric
  $ upright(bold(g)) = - l^2 \( thin upright(d) s_0 - thin upright(d) f \)^2 + macron(g) = -
    l^2 thin upright(d) s_0^2 + 2 l^2 thin upright(d) s_0 thin upright(d) f + g . $
  The $s_0$-slices have induced metric $g$, shift $beta = l^2 nabla f = U w$, lapse $U = l sqrt(D)$,
    and unit normal $n = U^(- 1) \( partial_(s_0) - beta \)$.
    We choose the sign $k \( X \, Y \) = upright(bold(g)) \( upright(bold(nabla))_X n \, Y \)$.
    Since the slice metric is independent of $s_0$,
  $ k = - frac("sym" nabla beta, U) = - H^f - p \( thin upright(d) t ⊗ w^flat + w^flat ⊗ thin upright(d) t \) . $
  Here $"sym" T = \( T + T^(sans(T)) \) \/ 2$.
  For completeness, put $theta.alt = "tr" k$. The contracted Gauss equation and the normal expansion equation,
    with this sign convention, read
  $ R_(upright(bold(g))) = R_g - 2 "Ric"_(upright(bold(g))) \( n \, n \) - \| k \|^2 + theta.alt^2 \, wide
    "Ric"_(upright(bold(g))) \( n \, n \) = - n \( theta.alt \) - \| k \|^2 + U^(- 1) Delta_g U . $
  The lapse term in the second formula follows from the acceleration $upright(bold(nabla))_n n = nabla log U$;
    its divergence contribution is $Delta_g log U + \| nabla log U \|^2 = U^(- 1) Delta_g U$.
    Stationarity gives $U n \( theta.alt \) = - beta \( theta.alt \)$, while $"div" beta = - U theta.alt$.
    Combining these equalities gives
  #[#set math.equation(numbering: n => "(4.25)")
   $ U R_(upright(bold(g))) = U \( R_g + \[ k \, k \] \) - 2 "div" #scale(x: 120%, y: 120%)[\(] nabla U +
     theta.alt beta #scale(x: 120%, y: 120%)[\)] . $ <eq:fl-alg-stationary-scalar>]
  In the coordinate $s = s_0 - f$, the same metric is $- l^2 thin upright(d) s^2 + macron(g)$.
    Direct contraction of its warped-product curvature gives $R_(upright(bold(g))) = R_(macron(g)) -
    2 l^(- 1) accent(Delta l, ‾)$. The determinant and inverse metric of $macron(g)$ give, for a scalar $phi$,
  $ macron(Delta) phi = D^(- 1 \/ 2) "div" \( sqrt(D) thin A_d nabla phi \) . $
  Moreover, Equations (4.21) and (4.21) imply
  $ nabla U - U / l A_d nabla l = - k \( beta \, dot.op \) . $
  For example, after division by $U$ its left side is
  $ H^f \( w \, dot.op \) + p { v thin thin upright(d) t + w^flat chevron.l w \, nabla t chevron.r } = -
    k \( w \, dot.op \) . $
  Substituting into (4.25) therefore yields
  #[#set math.equation(numbering: n => "(4.26)")
   $ R_(macron(g)) = R_g + \[ k \, k \] + 2 / U "div" \( p_k beta \) . $ <eq:fl-alg-graph-scalar>]
  #emph[The constraint substitution.] The symmetric part of $nabla beta$ is $- U k$, so (4.19) gives
  $ "div" \( p_K beta \) = 8 pi U J \( w \) - U \[ K \, k \] . $
  Use $Q = K - k$, $p_Q = p_K - p_k$, and $\[ Q \, Q \] = \[ K \, K \] + \[ k \, k \] - 2 \[ K \, k \]$ in (4.26).
    The result is
  #[#set math.equation(numbering: n => "(4.27)")
   $ R_(macron(g)) = 16 pi \( mu + J \( w \) \) + \[ Q \, Q \] - 2 /
     U "div" \( U p_Q \( w \, dot.op \) \) . $ <eq:fl-alg-constraint-graph>]
  #emph[The conformal calculation.] In dimension three,
  $ 1 / 2 e^(4 t) R_(hat(g)) = 1 / 2 R_(macron(g)) - 4 accent(Delta t, ‾) - 4 \| thin upright(d) t \|_(A_d)^2 . $
  Replacing the weight $U$ in the last flux of (4.27) by $u = e^(2 t) U$ adds $2 p_Q \( w \, nabla t \)$.
    Writing $accent(Delta t, ‾)$ in the preceding divergence form, and using $log \( u \/ sqrt(D) \) = 2 t +
    log l$, gives
  $ - 4 accent(Delta t, ‾) - 4 \| thin upright(d) t \|_(A_d)^2 = - 1 / u "div" \( 4 u A_d nabla t \) +
    4 \( p + 1 \) \| thin upright(d) t \|_(A_d)^2 . $
  By (4.22), the two fluxes obtained so far sum to $V - u w F$. Its divergence contributes
  $ 1 / u "div" \( u w F \) = w \( F \) + F frac("div" \( u w \), u) . $
  It follows that the quadratic term remaining after the displayed $- F "tr" K$ in (4.24) is
  #[#set math.equation(numbering: n => "(4.28)")
   $ 1 / 2 \[ Q \, Q \] + 2 p_Q \( w \, nabla t \) + 4 \( p + 1 \) \| thin upright(d) t \|_(A_d)^2 +
     F { F + \( 1 - chi \) q_1 + 2 \( p + 1 \) a x } . $ <eq:fl-alg-invariant-quadratic>]
  The next calculation identifies it with $cal(T)$, completing the proof. ◻
]

#thm([Lemma 4.11.])[
  (Square completion and uniformity).  #emph[The expression (4.28) equals $cal(T)$ in (4.15).
    It is smooth in the actual variables at $thin upright(d) f = 0$.
    For an absolute constant $C$, if $0 lt.eq p lt.eq N$, then
#[#set math.equation(numbering: n => "(4.29)")
 $ F^2 + \| P \|^2 + \| M \|^2 + d q_1^2 + \| thin upright(d) t \|_(A_d)^2 lt.eq
   C \( N + 4 \)^2 cal(T) . $ <eq:fl-alg-general-coercivity>]

 At a point with $thin upright(d) t = 0$, put $cal(E) = \| P^(upright("tf")) \|^2 + \| M \|^2 + F^2 + chi q_1^2$.
   There is the stronger bound
#[#set math.equation(numbering: n => "(4.30)")
 $ 1 / 2 cal(E) lt.eq cal(T) lt.eq cal(E) . $ <eq:fl-alg-floor-comparison>]

 These constants are independent of $d$, $p$, $N$, $l$, and the size of $thin upright(d) f$.]
] <lem:fl-alg-coercivity>

#proof[
  Using $P_0 = F - chi q_1$, direct contraction gives
  $ 1 / 2 \[ Q \, Q \] & = 1 / 2 \| P^(upright("tf")) \|^2 - 1 / 4 P_0^2 + \| M + p a y \|^2 -
    P_0 \( q_1 + 2 p a x \) \,\
2 p_Q \( w \, nabla t \) & = - 2 a P_0 x + 2 a M dot.op y + 2 p v \| y \|^2 . $
  Consequently (4.28) is
  #[#set math.equation(numbering: n => "(4.31)")
   $ cal(T) =  & 1 / 2 \| P^(upright("tf")) \|^2 + \| M + \( p + 1 \) a y \|^2 + \[ 4 \( p + 1 \) - v \] \|
     y \|^2 + 4 \( p + 1 \) d x^2 + 2 \( p + 1 \) a chi q_1 x\
 & quad + 3 / 4 F^2 - 1 / 2 chi F q_1 + \( chi - chi^2 \/ 4 \) q_1^2 . $ <eq:fl-alg-expanded-quadratic>]
  Completion of its axial and trace squares is exact because
  $ chi - chi^2 / 4 = frac(\( p + 1 \) chi^2 v, 4 d) + chi^2 / 12 + frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) . $
  This proves the asserted formula for $cal(T)$.
  For smoothness, rewrite $\( 1 - chi \) q_1 = "tr" S - F$ in (4.28), and $a x = chevron.l w \,
    nabla t chevron.r$. Every term is then an invariant smooth expression in $S \, w \, thin upright(d) t \, p$,
    with $F = "tr"_(A_chi) S$ and $A_chi$ given by (4.23). At $w = 0$ its value is
  $ cal(T) = 1 / 2 \| S \|^2 + 1 / 2 \( "tr" S \)^2 + 4 \( p + 1 \) \| thin upright(d) t \|^2 . $
  This also defines the direction-independent value at a critical point of $f$.
  To prove (4.29), denote the translated variables in the axial, trace, and mixed squares by
  $ z = x + frac(chi a q_1, 4 d) \, wide r_F = F - frac(chi q_1, 3) \, wide m_F = M + \( p + 1 \) a y . $
  The square formula bounds $\| P^(upright("tf")) \|^2 \, \| m_F \|^2$, $\( p + 1 \) \| y \|^2$,
    $\( p + 1 \) d z^2$, and $r_F^2$ by absolute multiples of $cal(T)$. Its last coefficient satisfies
  $ frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) gt.eq frac(32 d, 3 \( N + 4 \)^2) \, $
  so $d q_1^2 lt.eq C \( N + 4 \)^2 cal(T)$. Since $chi lt.eq d lt.eq 1$, one has
  $ d x^2 lt.eq 2 d z^2 + frac(chi^2 v, 8 d) q_1^2 lt.eq 2 d z^2 + 1 / 8 d q_1^2 \, wide F^2 lt.eq 2 r_F^2 + 2 /
    9 chi^2 q_1^2 . $
  These estimates control $x \, F$, and $\| P \|^2 = \| P^(upright("tf")) \|^2 + 1 / 2 \( F - chi q_1 \)^2$. Finally,
  $ \| M \|^2 lt.eq 2 \| m_F \|^2 + 2 \( p + 1 \)^2 v \| y \|^2 lt.eq C \( N + 1 \) cal(T) . $
  They prove (4.29).
  If $thin upright(d) t = 0$, Equation (4.31) becomes
  $ cal(T) = 1 / 2 \| P^(upright("tf")) \|^2 + \| M \|^2 + 3 / 4 F^2 - 1 / 2 chi F q_1 +
    chi \( 1 - chi \/ 4 \) q_1^2 . $
  Using $1 / 2 \| chi F q_1 \| lt.eq 1 / 4 F^2 + 1 / 4 chi^2 q_1^2$ and $0 < chi lt.eq
    1$ proves both bounds in (4.30). ◻
]

=== 4.6 Pointwise estimates at an interior floor contact <sec:fl-alg-floor>

A floor contact below refers to an interior local minimum of $t$.
  Thus $thin upright(d) t = 0$, $"Hess" t gt.eq 0$, and $"Hess" l \/ l = p "Hess" t gt.eq 0$.
  The estimates hold at any such minimum, not only at the particular height chosen in the continuation.

#thm([Lemma 4.12.])[
  (Gauss Inequality at a floor contact).  #emph[For a symmetric tensor $A$, define
$ cal(S) \( A \) = 1 / 4 \( "tr"_perp A \)^2 - 1 / 2 \| A_perp^(upright("tf")) \|^2 + d A_(e e) "tr"_perp A -
  d \| A_(e perp) \|^2 . $

 At an interior floor contact,
#[#set math.equation(numbering: n => "(4.32)")
 $ 1 / 2 e^(4 t) R_(hat(g)) lt.eq 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) . $ <eq:fl-alg-floor-gauss>]

 The expression $v "Ric"_g \( e \, e \)$ is interpreted as $"Ric"_g \( w \, w \)$; all quantities have continuous,
   direction-independent values at $w = 0$.]
] <lem:fl-alg-floor-gauss>

#proof[
  Consider the graph of $f$ in the Riemannian warped product $g + l^2 thin upright(d) s^2$.
    Its induced metric is $macron(g)$, its unit normal has horizontal component $- w$,
    and its vertical component has length $sqrt(d)$. Write $T = l^(- 1) partial_s$ for the unit vertical vector.
    The ambient curvature formulas are
  $ R_(upright("amb")) & = R_g - 2 l^(- 1) Delta_g l \,\
"Ric"_(upright("amb")) \( X \, Y \) & = "Ric"_g \( X \, Y \) - l^(- 1) "Hess" l \( X \, Y \) \,\
"Ric"_(upright("amb")) \( T \, T \) & = - l^(- 1) Delta_g l \, $
  with zero mixed Ricci components. Hence half the ambient term $R_(upright("amb")) -
    2 "Ric"_(upright("amb")) \( n \, n \)$ in the graph Gauss equation is
  $ 1 / 2 R_g - v "Ric"_g \( e \, e \) - v / l "tr"_perp "Hess" l . $
  At the contact $thin upright(d) l = 0$; the covariant components of the graph second form are therefore $H^f$,
    up to the harmless common sign coming from the choice of graph normal.
    Tracing with the graph inverse metric $A_d$ gives
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] \( "tr"_(A_d) A \)^2 - \| A \|_(A_d)^2 #scale(x: 120%, y: 120%)[\)] =
    cal(S) \( A \) . $
  Indeed the axial square cancels, the mixed contribution is $- d \| A_(e perp) \|^2$,
    and the transverse contribution is $1 / 4 \( "tr"_perp A \)^2 - 1 / 2 \| A_perp^(upright("tf")) \|^2$.
    Finally, at $thin upright(d) t = 0$ the conformal scalar formula contributes $- 4 "tr" \( A_d "Hess" t \)$.
    We have thus proved the exact formula
  $ 1 / 2 e^(4 t) R_(hat(g)) = 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) - v / l "tr"_perp "Hess" l -
    4 "tr" \( A_d "Hess" t \) . $
  Both final terms are nonpositive, proving (4.32). ◻
]

#thm([Lemma 4.13.])[
  (Uniform floor coercivity).  #emph[At a point with $thin upright(d) t = 0$, for an absolute constant $C$,
#[#set math.equation(numbering: n => "(4.33)")
 $ cal(T) - cal(S) \( H^f \) gt.eq 1 / 16 cal(T) - C \( 1 + N \)^2 #scale(x: 120%, y: 120%)[\(] \| K \|^2 +
   v F^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:fl-alg-floor-coercivity>]

 In particular the coefficient $1 \/ 16$ is independent of $N$ and of the graph gradient.]
] <lem:fl-alg-floor-coercivity>

#proof[
  Subtracting $cal(S) \( S \)$ from (4.31), with $thin upright(d) t = 0$, gives
  #[#set math.equation(numbering: n => "(4.34)")
   $ cal(T) - cal(S) \( S \) =  & \| P^(upright("tf")) \|^2 + \( 1 + d \) \| M \|^2 +
     chi \( 1 + d - chi \/ 2 \) q_1^2 - d F q_1 + 1 / 2 F^2 . $ <eq:fl-alg-floor-difference>]
  The identities
  $ d gt.eq chi \, wide d - chi = frac(p v, 4) chi \, wide d^2 / chi = frac(d \( 4 + p v \), 4) lt.eq frac(N + 4, 4) $
  make its parameter dependence explicit. For the part with cross coefficient $- chi$, Young’s Inequality gives
  $ 1 / 2 F^2 - chi F q_1 + chi \( 1 + chi \/ 2 \) q_1^2 gt.eq 1 / 8 F^2 + 5 / 6 chi q_1^2 . $
  The excess cross term satisfies
  $ \| \( d - chi \) F q_1 \| lt.eq 1 / 3 chi q_1^2 + 3 / 4 frac(\( d - chi \)^2, chi) F^2 lt.eq 1 / 3 chi q_1^2 +
    3 / 64 p^2 v F^2 . $
  It follows from (4.30) that
  #[#set math.equation(numbering: n => "(4.35)")
   $ cal(T) - cal(S) \( S \) gt.eq 1 / 8 cal(T) - 3 / 64 p^2 v F^2 . $ <eq:fl-alg-unshifted-floor>]
  Because $H^f = S - K$, expansion of the quadratic polynomial $cal(S)$ gives
  $ \| cal(S) \( S - K \) - cal(S) \( S \) \| lt.eq C \| K \| #scale(x: 120%, y: 120%)[\(] \|
    P^(upright("tf")) \| + \| M \| + \| F \| + d \| q_1 \| #scale(x: 120%, y: 120%)[\)] + C \| K \|^2 . $
  Here we used $"tr" P = F - chi q_1$ and $chi lt.eq d$. The estimate for $d^2 \/ chi$ above and (4.30) bound this by
  $ 1 / 16 cal(T) + C \( 1 + N \) \| K \|^2 . $
  Combining with (4.35) proves the claim. ◻
]

=== 4.7 Differentiating the trace and the weighted tensor drift <sec:fl-alg-derivatives>

The next lemma records precisely the hypotheses on the continuation right sides that enter the floor argument.
  They concern values and first derivatives only. Let $E$ be a fixed compact set containing the support of $"tr"
  K$ and of all collar corrections. Fix $0 < delta < 1$ and $3 \/ 4 < gamma < 1$,
  and positive smooth weights $rho_0 \, rho_1$ with

$ rho_0 asymp r^(- 3 - delta) \, wide rho_1 asymp r^(- 2 gamma) $

on the Euclidean end. Suppose

$ \| K \| lt.eq C r^(- 2) \, wide \| nabla K \| lt.eq C r^(- 3) $

there. All constants defining $E$, the weights, and these bounds are fixed before $N$.

For clarity denote the trace right side as a function of its inputs by $frak(F) \( x \, w \, h \, p \)$,
  and its value on the current fields by $F$. The allowed forms are

#[#set math.equation(numbering: n => "(4.36)")
 $ frak(F)_1 & = h + C \( x \) \,\
frak(F)_(2 \, theta) & = h + C \( x \) + theta D_0 \( x \, w \, h \) \, wide 0 lt.eq theta lt.eq 1 \,\
frak(F)_(3 \, zeta) & = h + \( 1 - zeta \) { C \( x \) + D_0 \( x \, w \, h + zeta b \( x \) \) } +
  zeta { "tr"_(A_chi) K + D_1 \( x \, w \) } \, wide 0 lt.eq zeta lt.eq 1 . $ <eq:fl-alg-stage-right-sides>]

Here $C \, b$ are fixed smooth functions, and $D_0 \, D_1$ are smooth bundle functions, supported over $E$,
  that extend smoothly to $\| w \| lt.eq 1$. Assume $partial_h D_0 gt.eq 0$.
  On the bounded height interval under consideration, their values and first derivatives in the base, fiber,
  and height variables are bounded independently of $N$. Only $A_chi$, through $p$,
  has $N$-dependent coefficients. Base derivatives of bundle functions mean covariant derivatives with their fiber
  arguments parallel transported.

#thm([Lemma 4.14.])[
  (Floor derivative estimates).  #emph[Assume the preceding hypotheses, $h = tau f$, and $\| h \| lt.eq C_0$.
    At any point where $thin upright(d) t = 0$, for each fixed $eta >
    0$ there are constants $C_eta$ and an integer $m$, independent of $N$, the homotopy parameters,
    and the graph gradient, such that
#[#set math.equation(numbering: n => "(4.37)")
 $ w \( F \) & gt.eq tau a \| thin upright(d) f \| - eta cal(T) - C_eta \( 1 + N \)^m \( rho_0 + v rho_1 \) \,\
lr(|frac("div" \( u A_chi K \( w \, dot.op \) \), u)|) & lt.eq eta cal(T) +
  C_eta \( rho_0 + v rho_1 \) . $ <eq:fl-alg-trace-derivative>]

 If in addition $\| h \| lt.eq C r^(- gamma)$ on the end, then
#[#set math.equation(numbering: n => "(4.38)")
 $ \| K \|^2 + v F^2 lt.eq C \( rho_0 + v rho_1 \) . $ <eq:fl-alg-weighted-remainder>]

 The constants may depend on the fixed data, weights, compact corrections, height bound, and $eta$;
   they are uniform over the three stages in (4.36).]
] <lem:fl-alg-floor-derivatives>

#proof[
  #emph[The error weights.] Since $delta + 2 gamma < 3$, the end decay implies
  $ \| nabla K \| lt.eq C sqrt(rho_0 rho_1) \, wide \| K \|^2 lt.eq C rho_0 . $
  Young’s Inequality therefore gives
  #[#set math.equation(numbering: n => "(4.39)")
   $ a \| nabla K \| lt.eq C \( rho_0 + v rho_1 \) . $ <eq:fl-alg-gradient-weight>]
  Any bounded error supported in $E$ is bounded by $C rho_0$, because $rho_0$ has a positive minimum there.
  #emph[The exact tensor-drift derivative.] Put $H = H^f$, $k_0 = K_(e e)$, $m_0 = K_(e perp)$, and $P_H =
    H \|_(e^perp)$. At the point in question,
  $ nabla p = 0 \, wide nabla log u = H \( w \, dot.op \) \, wide nabla w = H A_d . $
  For $c = \( p + 4 \) \/ \( 4 + p v \)$, Equation (4.23) reads
  $ A_chi K \( w \, dot.op \) = K \( w \, dot.op \) - c K \( w \, w \) w . $
  Its exact differentiated form is
  #[#set math.equation(numbering: n => "(4.40)")
   $ frac("div" \( u A_chi K \( w \, dot.op \) \), u) =  & a
     { \( "div" K \) \( e \) - \( 1 - chi \) \( nabla_e K \) \( e \, e \) }\
 & + chi \( 2 chi - 1 \) H_(e e) k_0 + 2 chi chevron.l H_(e perp) \, m_0 chevron.r + P_H :
   K_perp - \( 1 - chi \) \( "tr" P_H \) k_0 . $ <eq:fl-alg-exact-drift>]
  To see the cancellation explicitly, use a normal orthonormal frame at the point. The entries of $nabla w = H A_d$ are
  $ nabla_e w_e = d H_(e e) \, quad nabla_e w_A = H_(e A) \, quad nabla_A w_e = d H_(A e) \, quad nabla_A w_B =
    H_(A B) . $
  The coefficient of $H_(e e) k_0$, after adding $chevron.l nabla log u \, A_chi K \( w \, dot.op \) chevron.r$, is
  $ d - 3 c v d - 2 \( partial_v c \) v^2 d + v chi = chi \( 2 chi - 1 \) . $
  The mixed coefficient is $1 + d - 2 c v + v = 2 chi$. The remaining transverse terms are the last two terms of
    (4.40); differentiating $K$ produces its first line. This proves the formula.
  In particular every axial Hessian term in this divergence contains a factor $chi$.
    Since $H = S - K$ and $"tr" P = F - chi q_1$, the second line of (4.40) has absolute value at most
  $ C \| K \| #scale(x: 120%, y: 120%)[\(] \| P^(upright("tf")) \| + \| M \| + \| F \| +
    chi \| q_1 \| #scale(x: 120%, y: 120%)[\)] + C \| K \|^2 lt.eq eta cal(T) + C_eta \| K \|^2 . $
  Here $chi \| q_1 \| lt.eq sqrt(chi) \| q_1 \|$ and (4.30) were used.
    The first line is bounded by $C a \| nabla K \|$. Equation (4.39) proves (4.37), without an $N$-dependent constant.
  #emph[The trace derivative in each stage.] At fixed $\( x \, w \, p \)$,
    the height derivatives in (4.36) are respectively
  $ 1 \, wide 1 + theta thin partial_h D_0 \, wide 1 + \( 1 - zeta \) partial_h
    D_0 \( x \, w \, h + zeta b \( x \) \) \, $
  so each is at least one. At $thin upright(d) t = 0$, the chain rule and $h = tau f$ give
  #[#set math.equation(numbering: n => "(4.41)")
   $ w \( F \) = partial_h frak(F) thin tau a \| thin upright(d) f \| + \( nabla_x frak(F) \) \( w \) +
     D_w frak(F) \( nabla_w w \) \, wide nabla_w w = a \( d H_(e e) e + H_(e perp) \) . $ <eq:fl-alg-trace-chain>]
  There is no $partial_p frak(F)$ term because $nabla p = 0$.
  The compact corrections have uniformly bounded first derivatives. For the only noncompact correction, use
  $ "tr"_(A_chi) K = "tr" K - c K \( w \, w \) \, wide D_w c \[ xi \] = 2 \( partial_v c \) chevron.l w \,
    xi chevron.r . $
  The bounds
  $ \| c \| lt.eq C \( 1 + N \) \, wide \| partial_v c \| lt.eq C \( 1 + N \)^2 $
  give, on the stated height interval,
  $ \| nabla_x frak(F) \| lt.eq C \( 1 + N \)^2 #scale(x: 120%, y: 120%)[\(] upright(bold(1))_E + \| nabla K \|
    #scale(x: 120%, y: 120%)[\)] \, wide \| D_w frak(F) \| lt.eq
    C \( 1 + N \)^2 #scale(x: 120%, y: 120%)[\(] upright(bold(1))_E + \| K \| #scale(x: 120%, y: 120%)[\)] . $
  The base derivative here also includes the bounded derivative of $b \( x \)$ inside $D_0$.
    The second term of (4.41) is consequently bounded below by $- C \( 1 + N \)^2 \( rho_0 + v rho_1 \)$.
    For its third term, the comparison (4.30) and $d^2 \/ chi lt.eq \( N + 4 \) \/ 4$ yield
  $ & C \( 1 + N \)^2 \( upright(bold(1))_E + \| K \| \) thin a #scale(x: 120%, y: 120%)[\(] \| H_(e perp) \| +
    d \| H_(e e) \| #scale(x: 120%, y: 120%)[\)]\
 & #h(12mm)  lt.eq eta cal(T) + C_eta \( 1 + N \)^5 \( upright(bold(1))_E + \| K \|^2 \) . $
  For example, replace $H$ by $S - K$, use weighted Young Inequalities against $\| M \|^2 + chi q_1^2$,
    and absorb the remaining $K$-terms into the same right side.
    Thus one may take $m = 5$, after enlarging the constant. The weight observations at the start of the proof and
    $partial_h frak(F) gt.eq 1$ establish (4.37).
  Finally, outside $E$, all three right sides have the form
  $ F = h + zeta "tr"_(A_chi) K $
  with $0 lt.eq zeta lt.eq 1$, where $zeta = 0$ in the first two stages.
    The eigenvalues of $A_chi$ lie in $\( 0 \, 1 \]$, so $\| F \| lt.eq \| h \| + C \| K \| lt.eq
    C r^(- gamma)$ if the stated end height bound holds. On $E$,
    $F$ is uniformly bounded by the compact hypotheses. This proves (4.38). ◻
]

#prodef([Remark 4.15.])[
  The preceding propositions and lemmas are identities and estimates for smooth fields.
    Their application to the continuation uses the right sides and compact corrections of Proposition 41,
    the height bounds of Lemma 42, and the actual trace equation.
    In particular no existence conclusion for the coupled system is part of the scalar-curvature calculation.
] <rem:fl-alg-interfaces>

#thm([Lemma 4.16.])[
  (Boundary flux and conformal mean curvature).  #emph[On any face where $f$ is constant, for the actual trace $F$,
#[#set math.equation(numbering: n => "(4.42)")
 $ V_nu / u = d \( H + 4 partial_nu t \) - H + w_nu \( F - P_B \) \, wide H_(hat(g)) =
   e^(- 2 t) sqrt(d) thin \( H + 4 partial_nu t \) . $ <eq:fl-boundary-identity>]

 In particular the physical boundary condition gives $H_(hat(g)) = - e^(- 2 t) sqrt(d) thin N_B < 0$.]
] <lem:fl-boundary-identity>

#proof[
  The constant face value gives $"Hess" f \|_(T B) = \( partial_nu f \) upright("II")_g$,
    and hence $"tr"_(T B) H^f = w_nu H$. Using Equation (4.22),
    or taking the normal component of the original flux directly, gives
  $ V_nu / u = 4 d partial_nu t + chi w_nu q_1 = 4 d partial_nu t + w_nu \( F - P_B \) - v H . $
  This is the first identity. The normal in $macron(g)$ is $sqrt(d) thin nu$;
    its mean curvature is $sqrt(d) thin H$. The latter follows also by subtracting the connection change from the
    tangential Hessian above. The conformal boundary formula for $hat(g) =
    e^(4 t) macron(g)$ yields the second identity. At $thin upright(d) f = 0$ it follows by smooth continuation,
    or by the same direct computation with $d = 1$. ◻
]

=== 4.8 A specified four-stage homotopy <subsec:fl-homotopy>

#thm([Proposition 4.17.])[
  (The continuation family).  #emph[There is a continuous piecewise smooth family,
    with parameter $xi in \[ 0 \, 4 \]$, starting at Equations (4.14), (4.14), and (4.18),
    and ending at the zero trace solution and scalar equation with zero source and inner flux.
    In the first three stages the source is the $Xi$ just defined, always evaluated using the current trace $F$.
    Every trace right side has derivative at least one in $h$, at fixed point, $Z$, and $thin upright(d) f$.
    The outer values remain $f = Z = 0$.]
] <prop:fl-homotopies>

#proof[
  Choose a smooth $j : bb(R) arrow.r \[ 0 \, 1 \]$, zero for $t lt.eq 0$ and one for $t gt.eq 1$.
    For $0 lt.eq lambda lt.eq 1$, define
  $ V_lambda = u A_chi \( 4 nabla Z + lambda K \( w \, dot.op \) \) \, wide B_K = A_chi K \( w \, dot.op \) . $
  Until the last scaling stage, the inner scalar condition is
  #[#set math.equation(numbering: n => "(4.43)")
   $
     frac(\( V_lambda \)_nu, u) = \[ 1 - \( 1 - lambda \) j \( t \) \] \[ thin cal(B)_F - \( 1 - lambda \) \(
     B_K \)_nu thin \] . $ <eq:fl-homotopy-one>]
  We specify the two fixed collar corrections. Choose $eta > 0$ with $6 eta < b_(+) - b_(-)$.
    On black collars take a directional cutoff $chi_(-) \( w dot.op nu_s \)$, supported where $w dot.op nu_s < -
    1 \/ 2$ and equal to one at $- 1$, and a nonincreasing height cutoff $eta_(-) \( h \)$,
    equal to one for $h lt.eq b_(-) + eta$ and zero for $h gt.eq b_(-) + 2 eta$.
    On white collars use $chi_(+)$, supported where $w dot.op nu_s > 1 \/ 2$ and equal to one at $1$,
    and a nondecreasing $eta_(+)$, zero for $h lt.eq b_(+) - 2 eta$ and one for $h gt.eq b_(+) - eta$.
    Multiply by disjoint smooth collar cutoffs $kappa_B$, equal to one on the faces, and set
  $ D_0 \( x \, w \, h \) = - A_0 sum_(upright("black collars")) kappa_B chi_(-) eta_(-) +
    A_0 sum_(upright("white collars")) kappa_B chi_(+) eta_(+) \, wide A_0 > 2 sup_B \| H \| + 1 . $
  Thus $partial_h D_0 gt.eq 0$, $D_0 \( x \, 0 \, h \) = 0$; it is nonpositive at low heights $h lt.eq b_(-) +
    eta$, nonnegative at high heights $h gt.eq b_(+) - eta$, and zero in every compatible black outward or white
    inward direction, for all lengths $0 lt.eq \| w \| lt.eq 1$.
    All its derivatives on bounded height ranges are independent of $N$.
  At the assigned face height, the fully corrected expression $F = h + C + D_0$,
    evaluated at the limiting normal directions $w = plus.minus nu$, satisfies
  #[#set math.equation(numbering: n => "(4.44)")
   $ F \( x \, + nu \, b \) gt.eq P_B + H \, wide F \( x \, - nu \, b \) lt.eq P_B -
     H . $ <eq:fl-directional-inequalities>]
  These evaluations use $\| w \| = 1$ and $chi = 0$ in the smooth direction-free coefficients.
    Equation (4.10) gives equality in the compatible direction.
    In the opposite direction the correction of magnitude $A_0$ gives the inequality.
  Take a smooth compactly supported extension $b \( x \)$, constant at its assigned face value on each smaller
    collar. Put
  $ D_1 \( x \, w \) = A_1 sum_B kappa_B \( x \) thin w dot.op nu_s \, wide A_1 > sup_B \| H \| + 1 . $
  The collars are disjoint. Thus $D_1 \( x \, 0 \) = 0$ and $D_1 \( x \, plus.minus nu \) =
    plus.minus A_1$ on every face. The family is as follows.
  + For $0 lt.eq xi lt.eq 1$, put $lambda = 1 - xi$, retain $F = h + C$ and $h \|_B = b$,
    and use $"div" V_lambda = u Xi$ with Equation (4.43).
  + For $1 lt.eq xi lt.eq 2$, put $lambda = 0$, $alpha = xi - 1$, retain $h \|_B = b$, and set $F = h + C +
    alpha D_0 \( x \, w \, h \)$. Keep the same scalar equation and boundary condition.
  + For $2 lt.eq xi lt.eq 3$, put $lambda = 0$, $zeta = xi - 2$, prescribe $h \|_B = \( 1 - zeta \) b$, and set
    #[#set math.equation(numbering: n => "(4.45)")
     $ F = h + \( 1 - zeta \) #scale(x: 120%, y: 120%)[\[] C +
       D_0 \( x \, w \, h + zeta b \( x \) \) #scale(x: 120%, y: 120%)[\]] +
       zeta #scale(x: 120%, y: 120%)[\[] "tr"_(A_chi) K + D_1 \( x \, w \) #scale(x: 120%, y: 120%)[\]] .
       $ <eq:fl-homotopy-three>]
    Keep the same scalar equation and boundary condition.
  + For $3 lt.eq xi lt.eq 4$, retain this trace equation at $zeta = 1$,
    and multiply both $Xi$ and the right side of Equation (4.43) by $s_xi = 4 - xi$.
  The prescriptions agree at their endpoints. The height derivatives are $1$, $1 + alpha partial_h D_0$,
    and $1 + \( 1 - zeta \) partial_h D_0$, respectively. At a stage-(iii) face, $h + zeta b = b$,
    so its limiting directional value is the convex combination of the earlier corrected value and $P_B +
    D_1 \( plus.minus nu \)$. Equation (4.44) therefore persists.
  At $zeta = 1$, the trace equation becomes $"tr"_(A_chi) H^f = h + D_1 \( x \, w \)$, with zero boundary values.
    At a positive interior maximum of $f$, $w = 0$, $A_chi = I$, and $D_1 = 0$, so $l Delta f = tau f > 0$,
    a contradiction. A negative minimum is excluded similarly.
    Hence $f = 0$ and $t = Z$ throughout the last stage. At $xi =
    4$ the scalar equation is $"div" \( 4 L \( Z \) nabla Z \) = 0$,
    with zero inner flux and zero outer Dirichlet value. Multiplication by $Z$ gives $Z = 0$.
    For a frozen-coefficient scalar solve at this endpoint, the output is also identically zero for every input $Z$. ◻
]

=== 4.9 Uniform height bounds and the tracefree tail <subsec:fl-height>

#thm([Lemma 4.18.])[
  (Height and outer-boundary control).  #emph[Every smooth trace solution in Proposition 41 satisfies $\| h \|
    lt.eq C_0$, and its actual trace satisfies $\| F \| lt.eq C_F$, independently of $N \, R \,
    xi$ and the input $Z$. There are fixed $r_0 \, C > 0$ and a lower bound $R_(upright("ht")) \( N \)$ such that,
    when $R gt.eq R_(upright("ht")) \( N \)$,
#[#set math.equation(numbering: n => "(4.46)")
 $ \| h \| lt.eq C \( r^(- gamma) - R^(- gamma) \) quad \( r_0 lt.eq r lt.eq R \) \,
   wide \| thin upright(d) f \| lt.eq C tau^(- 1) R^(- 1 - gamma) quad upright("on ") S_R . $ <eq:fl-end-height>]

 The constants in the bound are independent of $N \, R \, xi$.
   For fixed $N \, epsilon.alt$, increasing the lower bound on $R$ ensures $t > -
   epsilon.alt$ at the outer boundary of every such solution.]
] <lem:fl-height>

#proof[
  The corrections $D_0 \, D_1$ vanish at $w = 0$. At an interior extremum of $f$,
    the first two stages give $"tr" K + l Delta f = h + C$, and the third gives $"tr" K + l Delta f =
    h + \( 1 - zeta \) C + zeta "tr" K$. The maximum and minimum inequalities bound $h$ by
    $lr(bar.v.double "tr" K bar.v.double)_oo + lr(bar.v.double C bar.v.double)_oo$ and the boundary heights.
    Boundedness of the corrections and $\| "tr"_(A_chi) K \| lt.eq 3 \| K \|$ then bounds $F$. No floor has been used.
  Choose $r_0$ outside the supports of $C \, D_0 \, D_1 \, b$ and $"tr" K$. The last stage has $h = 0$.
    In the other stages the tail equation takes the form
  #[#set math.equation(numbering: n => "(4.47)")
   $ frac(l, tau sqrt(D)) "tr"_(A_chi) "Hess" h - h + theta thin "tr"_(A_chi) K = 0 \, wide 0 lt.eq theta lt.eq
     1 \, $ <eq:fl-tail-trace>]
  where $theta = 1$ in the first two stages and $1 - zeta$ in the third. Since $"tr" K = 0$,
  $ "tr"_(A_chi) K = \( chi - 1 \) K \( e \, e \) \, wide 1 - chi = frac(\( p + 4 \) v, 4 + p v) . $
  For the radial test $psi = r^(- gamma)$, with its radial gradient axis,
    Equation (4.1) gives uniformly in $0 < chi lt.eq 1$
  $ "tr"_(A_chi) "Hess" psi = gamma #scale(x: 120%, y: 120%)[\(] \( gamma + 1 \) chi -
    2 #scale(x: 120%, y: 120%)[\)] r^(- 2 - gamma) + O \( r^(- 3 - gamma) \) lt.eq - c_gamma r^(- 2 - gamma) $
  after increasing $r_0$.
  Consider $phi.alt = C \( r^(- gamma) - R^(- gamma) \)$, choosing $C$ large enough to dominate $C_0$ at $r =
    r_0$ for $R gt.eq 2 r_0$. In the part $r lt.eq R \/ 2$, its height is at least $C \( 1 - 2^(- gamma) \)
    r^(- gamma)$; since $gamma < 1 < 2$, this dominates the bounded adverse tensor term $O \( r^(- 2) \)$ after
    fixing $r_0$ sufficiently large.
  In the part $r gt.eq R \/ 2$, evaluate coefficients at a possible comparison contact,
    so that the given input $Z$ and the test gradient agree with the solution’s.
    Put $z = l \| thin upright(d) phi.alt \| \/ tau$, noting $\| thin upright(d) phi.alt \| asymp C
    r^(- 1 - gamma)$. If $z gt.eq 1$, the magnitude of the negative Hessian term is at least $c r^(- 1)$,
    whereas the adverse tensor term is at most $C_K r^(- 2)$.
    If $z lt.eq 1$, the former is at least $c \( l \/ tau \) C r^(- 2 - gamma)$, while the latter is at most
  $ C_K \( N + 4 \) \( l \/ tau \)^2 C^2 r^(- 4 - 2 gamma) . $
  Their ratio is at most $C \( N + 4 \) z \/ r lt.eq C \( N + 4 \) \/ r$.
    Thus a lower bound $R_(upright("ht")) \( N \)$, enlarged after $r_0 \, C$ have been fixed,
    makes $phi.alt$ a strict upper barrier. Its negative is a lower barrier by the same absolute estimates.
    Height monotonicity allows comparison with the actual input $Z$.
    This proves the first bound in Equation (4.46). Tangential derivatives vanish on $S_R$;
    comparison at their common outer value gives the stated normal derivative bound.
  Finally, $Z = 0$ on $S_R$, and the map $t mapsto Z \( t \, thin upright(d) f \)$ is increasing.
    Its value at $t = - epsilon.alt$ is negative whenever
  $ ell^2 \| thin upright(d) f \|^2 < e^(8 epsilon.alt) - 1 . $
  The boundary slope bound makes this true once
  $ C^2 ell^2 tau^(- 2) R^(- 2 - 2 gamma) < e^(8 epsilon.alt) - 1 . $
  This is a permissible further lower bound on $R$ at fixed $N \, epsilon.alt$. ◻
]

=== 4.10 Exclusion of every floor contact <subsec:fl-floor>

We now fix the constants in the source. Only estimates at a proposed floor contact are needed;
  no upper bound on $Z$ or on $\| thin upright(d) f \|$ is assumed.

#thm([Lemma 4.19.])[
  (Error ledger at an interior floor contact).  #emph[There exist $c_0 >
    0$ and polynomial constants $C_N$ such that every smooth first-three-stage solution with $t gt.eq -
    epsilon.alt$, at an interior point with $t = - epsilon.alt$, satisfies
#[#set math.equation(numbering: n => "(4.48)")
 $ u^(- 1) "div" V_lambda gt.eq c_0 cal(T) + tau a sigma - C_N \( rho_0 + v rho_1 \) . $ <eq:fl-floor-divergence>]

 Here $c_0$ can be chosen independently of $N \, R \, xi$.]
] <lem:fl-floor-ledger>

#proof[
  At the contact $thin upright(d) t = 0$, $"Hess" t gt.eq 0$, $p = N$, and $thin upright(d) p = 0$.
    Equation (4.24) and Lemma 36 give
  $ frac("div" V, u) gt.eq 8 pi mu - 1 / 2 R_g + 8 pi J \( w \) + v "Ric" \( e \, e \) + cal(T) -
    cal(S) \( H^f \) + w \( F \) - F "tr" K . $
  The constraint gives exactly
  $ 8 pi mu - 1 / 2 R_g = 1 / 2 #scale(x: 120%, y: 120%)[\(] \( "tr" K \)^2 - \| K \|^2 #scale(x: 120%, y: 120%)[\)] . $
  Lemma 37 retains $1 / 16 cal(T)$, with an error $C_N \( \| K \|^2 + v F^2 \)$.
    The first-derivative estimates for the current trace and the omitted flux, from Lemma 38,
    retain $tau a sigma$ and each cost an arbitrarily small fixed fraction of $cal(T)$. They have polynomial remainders.
  For clarity, every coefficient remainder has the following global control, with constants independent of $N \,
    R \, xi$:
  $ \| K \|^2 & lt.eq C rho_0 \, & v F^2 & lt.eq C v rho_1 \, & \| F "tr" K \| & lt.eq C rho_0 \,\
v \| "Ric" \| & lt.eq C v rho_1 \, & a \( \| nabla K \| + \| J \| \) & lt.eq C \( rho_0 + v rho_1 \) . $
  The first bound uses $delta < 1$; the second follows from Lemma 42 and the tail expression $F = h +
    zeta "tr"_(A_chi) K$. The trace term has compact support.
    The curvature bound follows from $"Ric" = O \( r^(- 3) \)$.
    Finally, on the end $\| nabla K \| + \| J \| = O \( r^(- 3) \)$ and
  $ \| nabla K \| + \| J \| lt.eq C sqrt(rho_0 rho_1) \, wide delta + 2 gamma < 3 . $
  Weighted Young’s Inequality gives the last displayed estimate.
    All compactly supported coefficient derivatives are bounded by a constant times $rho_0$,
    which has positive minimum on their fixed compact support.
  Choose the two small derivative fractions so that their sum is less than $1 \/ 32$,
    and subtract $\( 1 - lambda \) "div" \( u A_chi K \( w \, dot.op \) \) \/ u$.
    This proves Equation (4.48), after renaming the positive universal coefficient.
    No fixed-$N$ regularity constant enters this ledger. ◻
]

#thm([Proposition 4.20.])[
  (Floor separation along the full homotopy).  #emph[Fix $0 < delta_0 < min { c_0 \/ 2 \, 1 \/ 4 }$,
    where $c_0$ is from Lemma 43. There is a polynomial choice of $Pi_N$ such that,
    for all sufficiently large $N$, followed by all $R gt.eq R_(upright("floor")) \( N \, epsilon.alt \)$,
    no smooth solution of Proposition 41 satisfies $t gt.eq - epsilon.alt$ and attains $t = - epsilon.alt$.
    Every such solution has $t > - epsilon.alt$ on the closed truncation.]
] <prop:fl-floor>

#proof[
  Enlarge $R_(upright("floor"))$ to include the outer-boundary requirement of Lemma 42.
    Thus an outer contact is impossible.
  At an inner contact in one of the first three stages, $j \( t \) = 0$.
    Equation (4.43) cancels the omitted drift on both sides and gives $V_nu \/ u = cal(B)_F$. Lemma 40 implies
  $ partial_nu t = - 1 / 4 \( N_B + H \) < 0 . $
  This contradicts the nonnegative inward derivative at a boundary minimum.
  At an interior contact, Equation (4.48) has right side at least $2 delta_0 cal(T) + tau a sigma - C_N W_N$.
    Choose the polynomial $Pi_N$ so large that
  $ \( Pi_N - C_N \) W_N gt.eq 2 rho + rho_0 . $
  This is possible since $W_N gt.eq rho_0$ and $rho \/ rho_0$ is bounded.
    At the floor $m_0 = 1$; comparison with the prescribed source would then give
  $ 0 gt.eq delta_0 cal(T) + \( 1 - delta_0 \) tau a sigma + \( Pi_N - C_N \) W_N - rho gt.eq rho + rho_0 > 0 \, $
  a contradiction.
  In the last stage $f = 0$, $t = Z$, $u = L$, and $v = 0$.
    At an interior floor minimum, $cal(T) = 1 / 2 \( \| K \|^2 + \( "tr" K \)^2 \)$.
    Enlarge the same polynomial so that $delta_0 cal(T) + rho - Pi_N rho_0 < 0$ at every such point.
    For $s_xi > 0$, the scalar equation then has left side $4 L Delta t gt.eq 0$ and strictly negative right side.
    At an inner floor minimum its boundary condition gives $4 partial_nu t = s_xi \( - H - N_B \) < 0$.
    Both are impossible. If $s_xi = 0$, multiplication of $"div" \( 4 L \( t \) nabla t \) = 0$ by $t$,
    with zero outer value and zero inner flux, gives $t = 0$. ◻
]

The estimates in this section concern every smooth candidate solution and its homotopy,
  and thus supply the boundary exclusion needed for continuation.
  Existence is established in Proposition 64, using the global estimates and regularity arguments of the following
  sections.

== 5 Local regularity for the rank-one trace equation <reg-section>

The estimate needed for the scalar trace equation is stronger than a general measurable-coefficient nondivergence
  estimate. Its distinguished eigendirection is the gradient of the solution.
  We prove the resulting gradient estimate first, and then use its Hessian measure bound in the second scalar
  equation. All the estimates in this section are local in dimension three.

#thm([Theorem 5.1.])[
  (Rank-one gradient and Hessian estimates).  #emph[Let $U$ be an interior coordinate ball or a smooth boundary
    half-ball, with a uniformly controlled $C^2$ metric $g$. In the boundary case use Gaussian coordinates,
    so $g_33 = 1$ and $g_(a 3) = 0$ for $a = 1 \, 2$. Suppose that $z$ is smooth on $U$,
    up to the face on its original side in the boundary case, and satisfies
#[#set math.equation(numbering: n => "(5.1)")
 $ A^(i j) nabla_i nabla_j z = G \, wide A^(i j) = g^(i j) - \( 1 - b \) e^i e^j \, wide e =
   frac(nabla z, \| nabla z \|) \, wide c_0 lt.eq b lt.eq 1 \, $ <reg-trace-equation>]

 where $c_0 > 0$. In the boundary case assume that $z$ is constant on the face.
   At a zero of $nabla z$, an arbitrary measurable unit direction is allowed,
   provided Equation (5.1) holds with that choice. Assume $\| nabla z \| lt.eq L$ and $\| G \| lt.eq Q$.
   There are $alpha in \( 0 \, 1 \)$, a uniform positive radius $r_0$, and $C$, depending only on $c_0$,
   the indicated geometry, and separation from the other faces of the patch, such that on a smaller patch
#[#set math.equation(numbering: n => "(5.2)")
 $ parallel D z parallel_(C^(0 \, alpha)) lt.eq C \( L + Q \) \, wide
   integral_(B_r \( x \) ∩ U) \| "Hess" z \|^2 thin d V_g lt.eq
   C \( L + Q \)^2 r^(1 + 2 alpha) quad \( 0 < r lt.eq r_0 \) . $ <reg-main-estimates>]

 The constants $alpha \, r_0 \, C$ do not depend on a modulus of continuity of $b$ or $G$.
   The same assertion holds for uniformly controlled families of patches.]
] <reg-rank-one>

Here and below, smoothness can be replaced by the piecewise smooth regularity produced by the reflection described
  in the proof. In particular, the estimates do not assume a uniform bound for the Hessian.

=== 5.1 A cutoff estimate and the gradient flux identity <a-cutoff-estimate-and-the-gradient-flux-identity>

#thm([Lemma 5.2.])[
  (A uniform exponent above two).  #emph[There is $p_0 in \( 2 \, 3 \)$ depending only on $c_0$ with the following
    property. If $g$ is sufficiently close to the Euclidean metric in $L^oo$, with bounded first derivatives,
    then the operator in Equation (5.1), with its coefficients held fixed, satisfies the interior estimate
#[#set math.equation(numbering: n => "(5.3)")
 $ parallel v parallel_(W^(2 \, p_0) \( B_(1 \/ 2) \)) lt.eq
   C #scale(x: 120%, y: 120%)[\(] parallel v parallel_(L^(p_0) \( B_1 \)) +
   parallel A^(i j) nabla_i nabla_j v parallel_(L^(p_0) \( B_1 \)) #scale(x: 120%, y: 120%)[\)] .
   $ <reg-cutoff-estimate>]

 It also satisfies the analogous estimate with exponent two.
   The coefficient direction in this assertion need not be the gradient direction of $v$.]
] <reg-cutoff>

#proof[
  For the full Hessian array the Fourier multiplier $D^2 Delta^(- 1)$ has $L^2$ operator norm one,
    since $sum_(i \, j) xi_i^2 xi_j^2 \/ \| xi \|^4 = 1$. Its finite $L^p$ bounds and interpolation give constants
    $C_p$ with $C_p arrow.r 1$ as $p arrow.b 2$. In Euclidean coordinates the Frobenius norm of $I -
    A$ is exactly $1 - b$. A sufficiently small perturbation of the metric therefore gives $\| I - A \| lt.eq 1 -
    c_0 \/ 2$. Choose $p_0 in \( 2 \, 3 \)$ so that $C_(p_0) \( 1 - c_0 \/ 2 \) < 1$. For a compactly supported $v$,
  $ parallel D^2 v parallel_(p_0) lt.eq C_(p_0) parallel A^(i j) D_(i j) v parallel_(p_0) +
    C_(p_0) \( 1 - c_0 \/ 2 \) parallel D^2 v parallel_(p_0) . $
  Absorb the last term. Christoffel symbols add a bounded first-order term.
    Applying this inequality to cutoffs on nested balls and using $parallel D v parallel_p lt.eq
    epsilon parallel D^2 v parallel_p + C_epsilon parallel v parallel_p$ gives Equation (5.3);
    the usual nested-radius absorption removes the outer Hessian term.
    The same argument at $p = 2$ proves the last assertion. All coefficient comparisons are pointwise,
    so no derivatives of $b$ or of its axis have been used. ◻
]

Put $P = nabla z$, $H = "Hess" z$, and $w = \| P \|^2 \/ 2$. A cancellation specific to the rank-one matrix gives

#[#set math.equation(numbering: n => "(5.4)")
 $ A nabla w - G P = \( H - g Delta z \) P \, wide "div" #scale(x: 120%, y: 120%)[\(] A nabla w -
   G P #scale(x: 120%, y: 120%)[\)] = \| H \|^2 - \( Delta z \)^2 + "Ric" \( P \, P \) . $ <reg-flux-identity>]

Indeed, $nabla w = H P$ and $G = Delta z - \( 1 - b \) H \( e \, e \)$; thus the terms containing $1 -
  b$ cancel before differentiating. At $P = 0$ both cancelled vectors vanish.
  The second identity follows by differentiating the remaining tensor expression and commuting the covariant
  derivatives of a scalar. In particular it is meaningful even when $b$ is measurable. Since

$ Delta z = G + \( 1 - b \) H \( e \, e \) \, $

choose $a > 0$ so that $\( 1 + a \) \( 1 - c_0 \)^2 < 1$. Young’s Inequality gives

#[#set math.equation(numbering: n => "(5.5)")
 $ \| H \|^2 - \( Delta z \)^2 gt.eq c \| H \|^2 - C G^2 . $ <reg-hessian-coercivity>]

For $c_0 = 1$ this follows directly from $Delta z = G$.

We specify how Equations (5.4) and (5.5) are used at a boundary.
  Subtract the constant boundary value, extend $z$ oddly across $x_3 = 0$, extend $g_(a b)$ and $b$ evenly,
  and extend $G$ oddly. Keep $g_33 = 1$ and $g_(a 3) = 0$. The extension of $z$ is $C^1$:
  its tangential derivatives vanish on the face and its normal derivative extends evenly.
  Hence its distributional Hessian has no surface atom. The doubled metric is Lipschitz and smooth on each side;
  we do not assert that its Ricci tensor is a bounded function across the joining plane.

Instead apply Equation (5.4) separately on the two sides.
  If $J = \( H - g Delta z \) P$, its one-sided normal component on the face is

#[#set math.equation(numbering: n => "(5.6)")
 $ J_nu = - z_nu "tr"_(T partial U) H = plus.minus H_(partial U) z_nu^2 . $ <reg-boundary-flux>]

The sign depends on the convention for the second fundamental form;
  only the bound $\| J_nu \| lt.eq \| H_(partial U) \| thin \| P \|^2$ is used.
  Consequently the jump of the flux is a plane density bounded by $2 \| H_(partial U) \| thin \| P \|^2$.
  A bounded density $q \( x' \) delta_({ x_3 = d })$ is the divergence of the bounded vector $q \( x' \)
  upright(bold(1))_({ x_3 > d }) partial_3$. No tangential derivative of $q$ is required.
  Multiplication by $sqrt(det g)$ converts the identity to Euclidean divergence form.

At any chosen center, a constant linear coordinate change makes $g \( 0 \) = I$.
  In Gaussian charts it can be taken block diagonal, so a reflected plane remains a plane,
  possibly displaced from the center. After a spatial dilation of size $r$,
  the deviations of $g$ and its first derivatives from the flat metric are $O \( r \)$,
  the ordinary Ricci terms on each side are $O \( r^2 \)$, and the reflected second fundamental form is
  $O \( r \)$. Normalize the dependent variable so $\| nabla z \| lt.eq 1$.
  If these quantities and $parallel G parallel_oo$ are at most $epsilon$, then $s = 1 - \| nabla z \|^2 gt.eq
  0$ satisfies

#[#set math.equation(numbering: n => "(5.7)")
 $ - partial_i \( cal(A)^(i j) partial_j s \) gt.eq c \| "Hess" z \|^2 - C epsilon + "div" E_epsilon \, wide
   parallel E_epsilon parallel_oo lt.eq C epsilon \, wide cal(A)^(i j) =
   sqrt(det g) thin A^(i j) . $ <reg-supersolution>]

The divergence here is the coordinate divergence. The vector $E_epsilon$ contains $2 sqrt(det g) thin G
  P$ and the bounded vector representing the plane density.
  The bulk Ricci and $G^2$ terms have been included in $C epsilon$.
  This proves Equation (5.7) both in an interior ball and in a reflected ball, with uniform ellipticity of $cal(A)$.

=== 5.2 The fixed-axis equation and improvement of flatness <the-fixed-axis-equation-and-improvement-of-flatness>

#thm([Lemma 5.3.])[
  (Regularity with a fixed axis).  #emph[Let $a$ be a fixed Euclidean unit vector and let $c_0 lt.eq
    b \( x \) lt.eq 1$ be measurable. If $Y in W^(2 \, 2) \( B_(3 \/ 4) \)$ satisfies
#[#set math.equation(numbering: n => "(5.8)")
 $ Delta_(a^perp) Y + b Y_(a a) = 0 \, $ <reg-fixed-equation>]

 then for some $alpha_1 in \( 0 \, 1 \)$ depending only on $c_0$,
#[#set math.equation(numbering: n => "(5.9)")
 $ parallel Y parallel_(C^(1 \, alpha_1) \( B_(1 \/ 4) \)) lt.eq
   C parallel Y parallel_(W^(2 \, 2) \( B_(3 \/ 4) \)) . $ <reg-fixed-axis-estimate>]

]
] <reg-fixed-axis>

#proof[
  Rotate so that $a = partial_3$ and put $v = Y_3$. Differentiating Equation (5.8) in the sense of distributions gives
  $ partial_1^2 v + partial_2^2 v + partial_3 \( b partial_3 v \) = 0 . $
  This is a scalar uniformly elliptic divergence equation, even when $b$ depends on all three variables.
    The scalar De Giorgi–Nash estimate gives a $C^(0 \, alpha_1)$ bound for $v$ on a smaller ball,
    controlled by $parallel v parallel_2$. Caccioppoli’s Inequality, applied after subtracting $v \( x \)$,
    then gives for balls contained in that smaller region
  #[#set math.equation(numbering: n => "(5.10)")
   $ integral_(B_r \( x \)) \| D v \|^2 lt.eq C r^(1 + 2 alpha_1) parallel Y
     parallel_(W^(2 \, 2) \( B_(3 \/ 4) \))^2 . $ <reg-fixed-morrey>]
  Now $Delta Y = F = \( 1 - b \) v_3$. By Cauchy–Schwarz,
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral_(B_r \( x \)) \| F \| lt.eq C r^(2 + alpha_1) parallel Y parallel_(W^(2 \, 2) \( B_(3 \/ 4) \)) .
     $ <reg-fixed-source>]
  Take a cutoff equal to one on $B_(1 \/ 3)$, supported where these estimates hold,
    and let $V$ be the Newton potential of the cut-off $F$. Its gradient kernel is bounded by $C \|
    x \|^(- 2)$ and the derivative of that kernel by $C \| x \|^(- 3)$.
    If $d = \| x - y \|$, the contribution to $\| D V \( x \) -
    D V \( y \) \|$ from distances at most $2 d$ is bounded, by dyadic annuli and Equation (5.11),
    by $C sum_(2^(- j) lt.eq 2 d) \( 2^(- j) \)^(alpha_1) lt.eq C d^(alpha_1)$.
    At larger distances the bound is $C d sum_(2^(- j) > d) \( 2^(- j) \)^(alpha_1 - 1) lt.eq C d^(alpha_1)$.
    The same bounds hold for the cut-off source, with an additional harmless large-scale term.
    Thus $D V$ is $C^(0 \, alpha_1)$. The Newton kernel is locally in $L^2$ in dimension three,
    so $parallel V parallel_oo$ is controlled by $parallel F parallel_2$.
    Finally $Y - V$ is harmonic on $B_(1 \/ 3)$; its ordinary interior derivative estimates complete Equation (5.9). ◻
]

#thm([Lemma 5.4.])[
  (Drop or affine approximation).  #emph[Fix $r_(*) in \( 0 \, 1 \/ 32 \]$.
    For every $h_(*) > 0$ there are $k_(*) in \( r_(*) \, 1 \)$ and $epsilon_(*) > 0$ with the following property.
    For a normalized solution on $B_1$ in the class of Equation (5.7), with errors at most $epsilon_(*)$, either
#[#set math.equation(numbering: n => "(5.12)")
 $ sup_(B_(r_(*))) \| nabla z \| lt.eq k_(*) \, $ <reg-drop>]

 or there is an affine $L$ such that
#[#set math.equation(numbering: n => "(5.13)")
 $ sup_(B_(r_(*))) \| z - L \| lt.eq h_(*) r_(*) \, wide 1 / 2 lt.eq \| D L \| lt.eq 2 . $ <reg-affine-alternative>]

 If the center lies on the reflecting plane and $z$ has zero boundary value, $L$ can be chosen odd about that plane.]
] <reg-dichotomy>

#proof[
  Otherwise take errors $epsilon_j arrow.r 0$ and $k_j arrow.t 1$ with neither alternative,
    and subtract $z_j \( 0 \)$ in interior balls. Lemma 46, together with the gradient bound,
    bounds $z_j$ in $W^(2 \, p_0)$ on smaller balls. Thus $D s_j$ is bounded in $L^(p_0)$.
    Failure of Equation (5.12) gives $inf_(B_(1 \/ 6)) s_j arrow.r 0$.
    The weak Harnack Inequality with bounded divergence and scalar errors implies $s_j arrow.r
    0$ in measure on $B_(1 \/ 3)$; one may use Theorem 5.2 and Corollary 5.4 of #cite(label("trudinger1973")),
    with the radii $1 \/ 6$, $1 \/ 3$, and $5 \/ 6$.
  We need more than this convergence in measure. Test Equation (5.7), after dropping its nonnegative Hessian term,
    with $eta^2 \( h - s_j \)_(+)$, where $eta$ is supported in $B_(1 \/ 3)$.
    Ellipticity and Young’s Inequality give, for fixed $h > 0$,
  #[#set math.equation(numbering: n => "(5.14)")
   $ integral_({ s_j < h }) eta^2 \| D s_j \|^2 lt.eq C h^2 integral \| D eta \|^2 +
     o_j \( 1 \) . $ <reg-truncated-energy>]
  On ${ s_j gt.eq h }$, convergence in measure and the uniform $L^2$ bound for $D
    s_j$ give convergence to zero of its $L^1$ norm. On the complementary set,
    Equation (5.14) and Cauchy–Schwarz bound the $L^1$ norm by $C h + o_j \( 1 \)$.
    First let $j arrow.r oo$, then $h arrow.b 0$. We obtain $D s_j arrow.r 0$ in $L^1 \( B_(1 \/ 4) \)$.
    Testing the full Equation (5.7) with a nonnegative cutoff now yields
  $ integral_(B_(1 \/ 8)) \| "Hess" z_j \|^2 arrow.r 0 . $
  Since $g_j arrow.r I$ and $D g_j arrow.r 0$, the same is true for $D^2 z_j$.
    Poincaré’s Inequality and the uniform Lipschitz bound show, after passage to a subsequence,
    uniform convergence on smaller balls to an affine function.
    Its slope has length one, because $s_j arrow.r 0$ in measure and the gradients converge strongly in $L^2$.
    This contradicts failure of Equation (5.13). At a boundary center the functions are odd,
    so their affine limit has zero constant and tangential terms.
    Increasing $k_(*)$ if necessary ensures $k_(*) > r_(*)$. ◻
]

#thm([Lemma 5.5.])[
  (Improvement of affine approximation).  #emph[There are $alpha_2 in \( 0 \, alpha_1 \)$,
    $r_2 in \( 0 \, 1 \/ 8 \)$, and $eta_0 \, h_0 > 0$ depending only on $c_0$ such that the following holds.
    Suppose $g \( 0 \) = I$, $\| nabla z \| lt.eq 8$,
$ parallel z - L_0 parallel_(L^oo \( B_1 \)) lt.eq h lt.eq h_0 \, wide 1 / 4 lt.eq \| D L_0 \| lt.eq 4 \, wide
  parallel G parallel_oo + parallel g - I parallel_oo + parallel D g parallel_oo lt.eq h eta_0 . $

 Then an affine $L_1$ satisfies
#[#set math.equation(numbering: n => "(5.15)")
 $ parallel z - L_1 parallel_(L^oo \( B_(r_2) \)) lt.eq h r_2^(1 + alpha_2) \, wide \| D L_1 - D L_0 \| lt.eq
   C h . $ <reg-improved-flatness>]

 If $z$ and $L_0$ are odd about a reflecting plane through the center, then $L_1$ can also be chosen odd.]
] <reg-improvement>

#proof[
  Set $Y = \( z - L_0 \) \/ h$ and hold the original coefficients of the $z$-equation fixed when applying Lemma 46
    to $Y$. The covariant Hessian of $L_0$ is $- Gamma D L_0$,
    so that lemma gives $parallel Y parallel_(W^(2 \, p_0) \( B_(7 \/ 8) \)) lt.eq C$.
    Put $a = D L_0 \/ \| D L_0 \|$ and $A_0 = I - \( 1 - b \) a ⊗ a$.
    The difference between the original axis projector and $a ⊗ a$ obeys
  $ \| e ⊗ e - a ⊗ a \| lt.eq C min { 1 \, h \| D Y \| } + C h eta_0 . $
  This remains valid at a zero gradient, since then $h \| D Y \| = \| D L_0 \|$;
    metric changes have been included in the second term. For $q =
    2 p_0 \/ \( p_0 - 2 \) > p_0$ and $theta.alt = \( p_0 - 2 \) \/ 2 > 0$,
  $ parallel min { 1 \, h \| D Y \| } parallel_(L^q \( B_(3 \/ 4) \)) lt.eq C h^(p_0 \/ q) = C h^theta.alt . $
  Consequently Hölder’s Inequality, with $1 \/ 2 = 1 \/ q + 1 \/ p_0$, gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ A_0^(i j) D_(i j) Y = F_(*) \, wide parallel F_(*) parallel_(L^2 \( B_(3 \/ 4) \)) lt.eq
     C \( h^theta.alt + eta_0 \) . $ <reg-axis-error>]
  Here $F_(*)$ includes the matrix error times $D^2 Y$, the term $G \/ h$,
    and $A^(i j) Gamma_(i j)^k \( D_k L_0 \/ h + D_k Y \)$. Thus neither $D
    Y$ nor any derivative of $b$ has been assumed pointwise bounded.
  There is a small zero-Dirichlet correction for Equation (5.16). On the convex ball $B_(3 \/ 4)$,
  #[#set math.equation(numbering: n => "(5.17)")
   $ parallel D^2 u parallel_2 lt.eq parallel Delta u parallel_2 quad \( u in W^(2 \, 2) ∩ W_0^(1 \, 2) \) .
     $ <reg-miranda-talenti>]
  For smooth functions this follows by integrating twice by parts:
    $integral \( \( Delta u \)^2 - \| D^2 u \|^2 \) = integral_(partial B_(3 \/ 4))
    H_(partial B_(3 \/ 4)) \( partial_nu u \)^2 gt.eq 0$, with the outward convex convention.
    Density proves the stated version. The map
  $ u mapsto Delta_D^(- 1) #scale(x: 120%, y: 120%)[\(] F_(*) + \( 1 - b \) u_(a a) #scale(x: 120%, y: 120%)[\)] $
  is therefore a contraction, in the Hessian norm, with factor $1 - c_0$.
    Its fixed point $u$ satisfies $A_0 : D^2 u = F_(*)$ and $parallel u parallel_(W^(2 \, 2)) lt.eq
    C parallel F_(*) parallel_2$. In dimension three the embedding $W^(2 \, 2) arrow.r.hook L^oo$ gives
  $ parallel u parallel_oo lt.eq C \( h^theta.alt + eta_0 \) . $
  The function $Y_0 = Y - u$ solves the fixed-axis equation and has a uniform $W^(2 \, 2)$ norm. Lemma 47 applies.
  Choose $alpha_2 < alpha_1$, then $r_2$ so small that the Taylor error $C r_2^(1 + alpha_1)$ is at most $1 /
    4 r_2^(1 + alpha_2)$. Next choose $eta_0$, and finally $h_0$,
    so that $C \( h_0^theta.alt + eta_0 \)$ is at most the same quantity.
    With $L_1 = L_0 + h \( Y_0 \( 0 \) + D Y_0 \( 0 \) dot.op x \)$, these bounds prove Equation (5.15).
    If the center is on the boundary plane, $a$ is its normal, $b$ is even, and $Y$ and $F_(*)$ are odd.
    Uniqueness of the correction on the symmetric ball makes $u$ odd.
    Hence $Y_0$ is odd and its Taylor polynomial has only a normal linear term, as required. ◻
]

#proof[
  Choose the constants of Lemma 49 first, and then decrease $h_(*) > 0$ so that $h_(*) lt.eq
    h_0$ and $C h_(*) sum_(j gt.eq 0) r_2^(j alpha_2) < 1 \/ 4$. Use this $h_(*)$ in Lemma 48.
    Set $M = L + Q$; the case $M = 0$ is immediate. Normalize coordinates at each center as above.
    Choose a uniform initial radius $rho_0$ so small that, after dividing $z$ by $M$ and scaling this radius to
    one, all errors required by Lemma 48 are at most $epsilon_(*)$,
    and the forcing and first-order metric errors are also at most $h_(*) eta_0$.
  As long as the drop alternative holds, the successive physical radii and gradient amplitudes are
  #[#set math.equation(numbering: n => "(5.18)")
   $ rho_j = rho_0 r_(*)^j \, wide M_j = M k_(*)^j \, wide z_j \( y \) =
     frac(z \( x + rho_j y \) - z \( x \), rho_j M_j) . $ <reg-drop-scales>]
  The forcing scales by $rho_j \/ M_j$, which decreases because $r_(*) < k_(*)$.
    The geometric errors decrease with $rho_j$. In a reflected patch the plane density is recomputed from
    Equation (5.6) with the newly normalized gradient; it is again $O \( rho_j \)$.
    Thus the class is preserved at every drop, including at centers close to, but not on, the plane.
  If drops continue indefinitely, $D z \( x \) = 0$, and the constant affine approximations on these balls have
    errors at most $C rho_j M_j$. Otherwise let $m$ be the first index where the affine alternative holds.
    At physical radius $S = rho_0 r_(*)^(m + 1)$, divide by $S
    M_m$ to obtain affine approximation with error $h_(*)$ on the unit ball and slope in $\[ 1 \/ 2 \, 2 \]$.
    Apply Lemma 49 repeatedly. At step $j$ the radius is $r_2^j$ and the flatness is $h_j =
    h_(*) r_2^(j alpha_2)$. The gradient amplitude $M_m$ is kept fixed during this iteration;
    the spatial dilation alone is changed. The forcing and metric errors decrease as $r_2^j$,
    so their ratios to $h_j$ decrease as $r_2^(j \( 1 - alpha_2 \))$.
    The total change of the normalized slopes is less than $1 \/ 4$, preserving the required slope range.
    At boundary centers every affine approximation is odd.
  Choose
  $ 0 < alpha lt.eq min {alpha_2 \, frac(log k_(*), log r_(*))} . $
  The drop scales give $M_j lt.eq M \( rho_j \/ rho_0 \)^alpha$. After the first affine scale,
  $ inf_(L med upright("affine")) parallel z - L parallel_(L^oo \( B_r \( x \) \)) lt.eq
    C M_m S \( r \/ S \)^(1 + alpha_2) lt.eq C M rho_0^(- alpha) r^(1 + alpha) wide \( r lt.eq S \) . $
  Before that scale the constant approximations have the same last bound.
    Passing from the discrete radii to arbitrary radii loses only a fixed factor.
    Every center therefore has affine approximations with error $C M r^(1 + alpha)$.
    Comparing consecutive approximations on the same ball bounds their slope differences by $C M r^alpha$;
    comparing overlapping balls gives the same bound between the limiting slopes at two centers.
    Smoothness identifies each limiting slope with $D z$. This proves the first estimate in Equation (5.2),
    also for the reflected function.
  For the second estimate take an affine approximation $L_(x \, 2 r)$ on $B_(2 r) \( x \)$ and apply the
    exponent-two form of Lemma 46 to $z - L_(x \, 2 r)$. Its source is $G$ plus $A^(i j) Gamma_(i j)^k D_k
    L_(x \, 2 r)$, and its slope is bounded by $C M$. Scaling that estimate back gives
  $ parallel D^2 z parallel_(L^2 \( B_r \( x \) \)) lt.eq C
    (r^(- 2) parallel z - L_(x \, 2 r) parallel_(L^2 \( B_(2 r) \( x \) \)) + M r^(3 \/ 2)) lt.eq
    C M r^(1 \/ 2 + alpha) . $
  The connection term converting $D^2 z$ to $"Hess" z$ has squared integral at most $C M^2 r^3$.
    This proves the claimed Hessian bound. Restricting the reflected estimate to the original side proves the
    boundary assertion. ◻
]

=== 5.3 A bounded scalar equation with natural growth <a-bounded-scalar-equation-with-natural-growth>

#thm([Lemma 5.6.])[
  (Hölder control from a Hessian measure bound).  #emph[Suppose $Z$ is locally Lipschitz, $\| Z \| lt.eq M$,
    and satisfies, in distributions on a ball in $bb(R)^3$,
#[#set math.equation(numbering: n => "(5.19)")
 $ "div" \( a D Z + B \) = e \, wide lambda I lt.eq a = a^T lt.eq Lambda I \, wide parallel B parallel_oo lt.eq
   B_0 \, $ <reg-natural-equation>]

 where $a$ is measurable and $e$ is a signed Radon measure. Assume
#[#set math.equation(numbering: n => "(5.20)")
 $ \| e \| lt.eq C_0 \( 1 + \| D Z \|^2 \) thin d x + mu \, wide mu \( B_r \( x \) \) lt.eq C_mu r^(1 + beta) \,
   wide 0 < beta lt.eq 1 \, $ <reg-natural-measure>]

 for all smaller balls, where $mu$ is nonnegative. Then $Z$ has a local $C^(0 \, theta)$ bound for some $theta >
   0$, depending only on the displayed constants and the patch separation.
   No bound for its local Lipschitz constant enters this estimate.
   The conclusion also holds at a smooth boundary with bounded total conormal flux, or with constant Dirichlet value.]
] <reg-natural-growth>

#proof[
  Write $cal(L) = - "div" \( a D \)$, choose $k gt.eq max { 1 \, 2 C_0 \/ lambda }$, and set $V_s =
    e^(s k Z)$ for $s = plus.minus 1$. The exact distributional chain rule is
  #[#set math.equation(numbering: n => "(5.21)")
   $ cal(L) V_s = "div" \( s k V_s B \) - s k V_s e - k^2 V_s #scale(x: 120%, y: 120%)[\(] a D Z dot.op D Z +
     B dot.op D Z #scale(x: 120%, y: 120%)[\)] . $ <reg-exponential-identity>]
  It is valid for the present weak equation: the exponential is locally Lipschitz and can be approximated
    uniformly and in $W^(1 \, 2)$ in the test, so the measure term converges as well.
    The inequality $\| B dot.op D Z \| lt.eq \( lambda \/ 2 \) \| D Z \|^2 +
    B_0^2 \/ \( 2 lambda \)$ and Equation (5.20) imply
  #[#set math.equation(numbering: n => "(5.22)")
   $ cal(L) V_s lt.eq "div" F_s + nu \, wide F_s = s k V_s B \, wide nu =
     e^(k M) (k C_0 + frac(k^2 B_0^2, 2 lambda)) d x + k e^(k M) mu . $ <reg-exponential-subsolution>]
  In particular $F_s$ is bounded and $nu$ is a positive measure with the same admissible growth,
    in addition to a bounded density.
  #emph[The correction estimate.] We record the small correction estimate on $B_R$:
  #[#set math.equation(numbering: n => "(5.23)")
   $ cal(L) w_s = "div" F_s + nu \, wide w_s in W_0^(1 \, 2) \( B_R \) \, wide parallel w_s parallel_oo lt.eq
     epsilon_R = C R^beta . $ <reg-small-correction>]
  For the bounded vector term, testing the Dirichlet equation with $\( w - t \)_(+)$ gives, for $p > 3$,
  $ integral \| D \( w - t \)_(+) \|^2 lt.eq C parallel F_s parallel_p^2 \| { w > t } \|^(1 - 2 \/ p) . $
  Sobolev’s Inequality then yields
  $ \| { w > h } \| lt.eq C parallel F_s parallel_p^6 \( h - t \)^(- 6) \| { w > t } \|^(3 - 6 \/ p) \, wide h > t . $
  The exponent on the right is greater than one. Iteration, also for $- w$, gives $parallel w parallel_oo lt.eq
    C R^(1 - 3 \/ p) parallel F_s parallel_p lt.eq C R$.
  For the measure term the positive scalar Dirichlet Green function satisfies $G_(B_R) \( x \, y \) lt.eq C \| x -
    y \|^(- 1)$. This is the scalar measurable-coefficient Green bound:
    extend $a$ elliptically to $bb(R)^3$, use the fundamental-solution bound in Theorem 3.1 of
    #cite(label("hofmannkim2007")), and compare the Dirichlet Green function by the weak maximum principle.
    The scalar De Giorgi–Nash estimate supplies the local Hölder hypothesis of that theorem.
    Dyadic annuli and Equation (5.20) give
  $ sup_x integral_(B_R) G_(B_R) \( x \, y \) thin d nu \( y \) lt.eq C \( R^2 + R^beta \) . $
  This also constructs the needed weak correction without assuming measure solvability.
    Approximate the restricted positive measure by smooth positive measures, preserving the ball-growth bound.
    The resulting potentials have the displayed uniform supremum bound,
    and their energy is bounded by their supremum times the total mass.
    A weak $W_0^(1 \, 2)$ limit solves the measure equation and retains the bound.
    Adding the vector and measure corrections proves Equation (5.23).
  #emph[Oscillation decay.] Let $M_R = sup_(B_R) Z$, $m_R = inf_(B_R) Z$, and set
  #[#set math.equation(numbering: n => "(5.24)")
   $ H_(+) = e^(k M_R) - e^(k Z) + w_(+) + epsilon_R \, wide H_(-) = e^(- k m_R) - e^(- k Z) + w_(-) +
     epsilon_R . $ <reg-deficits>]
  These functions are nonnegative weak supersolutions of $cal(L) H_plus.minus gt.eq 0$.
    Each exponential deficit is bounded above and below by positive constants, depending on $k M$, times $M_R -
    Z$ or $Z - m_R$, respectively. One of the two midpoint sets
  $ { Z lt.eq \( M_R + m_R \) \/ 2 } ∩ B_(R \/ 3) \, wide { Z gt.eq \( M_R + m_R \) \/ 2 } ∩ B_(R \/ 3) $
  has at least half the volume of $B_(R \/ 3)$. Apply weak Harnack to the corresponding $H_plus.minus$.
    In Theorem 5.2 of #cite(label("trudinger1973")), take the inner radius $R \/ 6$:
    its averaging ball is $B_(R \/ 3)$ and its required nonnegativity ball is $B_(5 R \/ 6)$.
    Thus the infimum on $B_(R \/ 6)$ is at least $c \( M_R - m_R \)$.
    Removing the correction in Equation (5.24) costs at most $2 epsilon_R$.
    It follows that either the upper endpoint decreases or the lower endpoint increases by $c \( M_R - m_R \) -
    C epsilon_R$, whence
  #[#set math.equation(numbering: n => "(5.25)")
   $ "osc"_(B_(R \/ 6)) Z lt.eq \( 1 - c \) "osc"_(B_R) Z + C R^beta . $ <reg-oscillation-decay>]
  Iteration gives any sufficiently small positive exponent below both $beta$ and $- log \( 1 - c \) \/ log 6$.
  #emph[Boundary reflection.] Flatten a boundary face and put $S = "diag" \( 1 \, 1 \, - 1 \)$.
    For an even extension of $Z$, extend $a^(-) = S a^(+) S$ and $B^(-) = S B^(+)$.
    If $q$ is the third component of the original total flux on $x_3 = 0$,
    the reflected equation has the additional density $2 q thin delta_({ x_3 = 0 })$.
    It is bounded by the prescribed total conormal bound, after the coordinate volume factors are included.
    For a constant Dirichlet value, extend $Z$ minus that value oddly and use $a^(-) = S a^(+) S$, $B^(-) = -
    S B^(+)$ and the odd bulk source. The normal flux is then continuous, with no plane term.
    The reflected matrix remains measurable and uniformly elliptic.
    A bounded plane density has ball mass $O \( r^2 \)$, which is allowed in Equation (5.20) because $beta lt.eq
    1$. This proves the boundary assertion. ◻
]

=== 5.4 Classical bootstrap from bounded scalar variables <classical-bootstrap-from-bounded-scalar-variables>

#thm([Proposition 5.7.])[
  (The regularity interface for the coupled system).  #emph[Consider a family of smooth solutions $\( f \, Z \)$
    on smooth finite domains with uniformly controlled interior and boundary patches.
    Assume $\| f \| + \| D f \| + \| Z \| lt.eq M$ and the following structural bounds, uniformly in the family:]
  + #emph[The $f$-equation has the form of Equation (5.1), with $b gt.eq c_0 > 0$ and bounded $G$.
    Its actual matrix and source are smooth functions of $\( x \, Z \, f \, D f \)$ on the bounded variable range,
    including at $D f = 0$. The value of $f$ on each boundary face is constant.]
  + #emph[After multiplication by the coordinate volume density, the $Z$-equation is
#[#set math.equation(numbering: n => "(5.26)")
 $ partial_i #scale(x: 120%, y: 120%)[\(] a^(i j) \( x \, Z \, f \, D f \) partial_j Z +
   B^i \( x \, Z \, f \, D f \) #scale(x: 120%, y: 120%)[\)] = Q \, wide \| Q \| lt.eq
   C \( 1 + \| D Z \|^2 + \| D^2 f \|^2 \) \, $ <reg-coupled-Z>]

 where $a$ is symmetric and uniformly elliptic and $B$ is bounded.
   The functions $a \, B$ and $Q$, as a function also of $\( D Z \, D^2 f \)$,
   are smooth on the ranges on which they are used.]
  + #emph[Each boundary component for $Z$ has either constant Dirichlet data, or bounded total conormal flux.
    In the latter case its equation can also be solved as
#[#set math.equation(numbering: n => "(5.27)")
 $ partial_nu Z = H \( x \, Z \, f \, D f \) \, $ <reg-normal-data>]

 where $H$ is smooth on the bounded variable range. These faces are disjoint and have no edges where the type of
   data changes.]
  #emph[Assume that the derivatives of the displayed smooth functions and the geometry are bounded to the order
    needed for each stated estimate. Then $f$ and $Z$ have uniform local classical estimates of every such finite
    order, including at the boundary. The constants are independent of the size of a finite exhaustion domain if
    the patch geometry and all the displayed data bounds are independent of that size.]
] <reg-coupled-bootstrap>

#proof[
  Theorem 45 gives a uniform $C^(1 \, alpha)$ bound for $f$ and
  #[#set math.equation(numbering: n => "(5.28)")
   $ integral_(B_r \( x \)) \| D^2 f \|^2 lt.eq C r^(1 + 2 alpha) . $ <reg-bootstrap-measure>]
  Coordinate connection terms do not affect this estimate. Apply Lemma 50 to Equation (5.26) with $mu =
    C \| D^2 f \|^2 d x$ and $beta = min { 2 alpha \, 1 }$. At a flux boundary include the bounded reflected plane
    density. We obtain a uniform Hölder bound for $Z$. Smooth composition in the bounded variables now makes the
    leading matrix and source of the $f$-equation Hölder. The interior and constant-Dirichlet Schauder estimates
    give $f in C^(2 \, theta)$ for some uniform $theta > 0$.
  Expand Equation (5.26) in nondivergence form. Its leading matrix is uniformly elliptic and $C^(0 \, theta)$.
    Differentiating its coefficients produces terms at most quadratic in $D Z$, because $D^2 f$ is now bounded.
    Thus its right-hand side is bounded by $C \( 1 + \| D Z \|^2 \)$. Fix $p > 3$.
    Linear local $W^(2 \, p)$ estimates, with either constant Dirichlet or the normal data in Equation (5.27),
    give on nested patches $U_x subset.double V_x subset.double V_x^(+)$
  #[#set math.equation(numbering: n => "(5.29)")
   $ parallel Z parallel_(W^(2 \, p) \( U_x \)) lt.eq
     C (1 + parallel D Z parallel_(L^(2 p) \( V_x \))^2 + parallel Z parallel_(W^(1 \, p) \( V_x^(+) \))) .
     $ <reg-linear-W2p>]
  The patch size here is chosen from the already established Hölder modulus of the leading matrix.
    The normal boundary operator is uniformly oblique; the local a priori estimate is, for example,
    a smooth-boundary specialization of Theorem 2.3 of #cite(label("dongli2022")), followed by localization.
    Only its estimate is used, not solvability for a pure oblique problem. The boundary norm is controlled by
  #[#set math.equation(numbering: n => "(5.30)")
   $ parallel H \( x \, Z \, f \, D f \) parallel_(W^(1 - 1 \/ p \, p) \( partial V_x \)) lt.eq
     C (1 + parallel Z parallel_(W^(1 \, p) \( V_x^(+) \))) . $ <reg-boundary-trace>]
  Indeed, extend the smooth expression for $H$ through the collar, differentiate it there,
    use the already bounded first two derivatives of $f$, and apply the trace theorem.
    This explains the last term in Equation (5.29) without assuming a gradient bound for $Z$.
  We give the absorption of the quadratic gradient term. On balls or half-balls of radius $h$,
    the scaled interpolation estimate is
  #[#set math.equation(numbering: n => "(5.31)")
   $ parallel D Z parallel_(L^(2 p) \( B_h \))^2 lt.eq C "osc"_(B_(2 h)) Z thin parallel D^2 Z
     parallel_(L^p \( B_(2 h) \)) + C h^(3 \/ p - 2) \( "osc"_(B_(2 h)) Z \)^2 . $ <reg-interpolation>]
  One way to obtain it is to subtract a constant, integrate $integral eta^(2 p) \| D
    Z \|^(2 p)$ by parts against $Z$, and use Hölder and Young Inequalities on the terms containing $D^2 Z$ and $D
    eta$. At the boundary use a bounded extension operator on a half-ball, bounded also in $L^oo$;
    its lower derivative terms are absorbed by the same interpolation.
    Scaling gives exactly the second power of $h$ displayed in Equation (5.31).
  Write $\[ Z \]_(C^(0 \, theta)) lt.eq H_0$. Cover $V_x$ by radius-$h$ patches of bounded overlap,
    with their doubles in $V_x^(+)$. Take the $ell^p$ sum of Equation (5.31). There are $O \( h^(- 3) \)$ patches, so
  #[#set math.equation(numbering: n => "(5.32)")
   $ parallel D Z parallel_(L^(2 p) \( V_x \))^2 lt.eq C H_0 h^theta parallel D^2 Z parallel_(L^p \( V_x^(+) \)) +
     C H_0^2 h^(2 theta - 2) . $ <reg-gradient-absorption>]
  Also, for every $eta > 0$, $parallel Z parallel_(W^(1 \, p) \( V_x^(+) \)) lt.eq
    eta parallel D^2 Z parallel_(L^p \( V_x^(+ +) \)) + C_eta$ on a further uniformly enlarged patch.
    Such enlarged patches are covered by a bounded number of the $U_y$.
    On a fixed smooth finite-domain solution let $T = sup_y parallel Z parallel_(W^(2 \, p) \( U_y \))$,
    which is finite before making any uniform assertion. Equations (5.29) and (5.32) imply
  #[#set math.equation(numbering: n => "(5.33)")
   $ T lt.eq C \( H_0 h^theta + eta \) T + C \( h \, eta \) . $ <reg-global-absorption>]
  The radius for the linear estimate was fixed first. Now choose the auxiliary covering radius $h$,
    and then $eta$, so that the coefficient of $T$ is less than $1 \/ 2$.
    This proves a uniform $W^(2 \, p)$ bound, and hence $Z in C^(1 \, 1 - 3 \/ p)$.
  The source in the nondivergence $Z$-equation is now Hölder;
    the normal data have the corresponding first derivative regularity.
    Schauder estimates give $Z in C^(2 \, theta')$. The $f$-equation then gains another derivative.
    Repeating this argument gives every finite order supported by the data.
    All coverings and constants were uniform, so this conclusion has the asserted independence from the exhaustion
    radius. ◻
]

#prodef([Remark 5.8.])[
  The hypotheses in Proposition 51 are an interface to be checked from the actual deformation equations.
    In particular the lower bound for $b$, the bounded variables, the quadratic source estimate,
    and the solvable normal boundary condition are required before applying the proposition.
    The argument supplies classical bounds on fixed-size patches; it does not by itself give decay at infinity.
    Uniform estimates of arbitrarily high order on an end require correspondingly high derivative bounds for the
    reduced background data.
]

== 6 Existence of the flat deformation and its mass comparison <sec:fc-existence>

We retain the prepared exterior $Omega$, the inner faces $B = B_b union.sq B_w$,
  and the four-stage family of Proposition 41. The parameter of that family is $xi in \[ 0 \, 4 \]$, with $xi =
  0$ the physical system. All the geometric choices in Lemma 32 are fixed throughout this section.
  A finite truncation is denoted by $Omega_R$. The normal $nu$ on $B$ points into $Omega_R$;
  its negative is the normal used in the divergence theorem. We write

$ sigma = \| d f \|_g \, wide e = nabla f \/ sigma quad \( sigma > 0 \) \, wide \| zeta \|_(A_j)^2 =
  A_j \( zeta \, zeta \) $

for a covector $zeta$. Expressions at $sigma = 0$ are understood by their smooth extensions established in Section 4.

We first obtain collar and global bounds for arbitrary smooth solutions.
  We then construct a solution by scalar solvability, degree, and exhaustion,
  and conclude with the curvature and mass comparison.

There are two distinct types of constants. A symbol $P_N$ denotes a quantity bounded by $C \( 1 + N \)^q$,
  where $C \, q$ depend on the fixed data, collars, and $epsilon.alt$, but not on $N$, $R$, or $xi$.
  Such a polynomial may be increased at successive occurrences.
  A constant $C_N$ may depend arbitrarily on the fixed positive parameters $epsilon.alt \, N \, ell \, tau$,
  but remains independent of $R$ and $xi$. In particular,

#[#set math.equation(numbering: n => "(6.1)")
 $ ell = e^(- epsilon.alt N) \, wide tau = ell^(3 \/ 2) \, wide ell lt.eq l lt.eq e \, wide frac(4 d, 4 + N) lt.eq
   chi lt.eq d \, wide P_N tau / ell arrow.r 0 . $ <eq:fc-parameter-ledger>]

All estimates preceding the existence proof concern arbitrary smooth solutions with $t gt.eq - epsilon.alt$,
  including a putative solution touching that level. No estimate for a Hessian or upper bound for $Z$ is assumed
  at this stage.

=== 6.1 Closed sublevels and signed collar estimates <closed-sublevels-and-signed-collar-estimates>

Write $cal(B)_c$ for the full black trapped region at threshold $c$,
  and $cal(W)_c$ for the corresponding white region with $cal(B)_(c_b)$ held fixed.
  These regions, including their Hausdorff right continuity at the selected thresholds, are those of Lemma 32.

#thm([Lemma 6.1.])[
  (Separation from the opposite height).  #emph[In the first two stages,
    if a fixed compact subset $Q$ of the closed prepared exterior is disjoint from $cal(B)_(c_b)$,
    there are $eta_Q > 0$ and $N_Q$ such that
$ h gt.eq b_(-) + eta_Q quad upright("on ") Q $

 for $N gt.eq N_Q$ and all sufficiently large allowed truncations.
   If $Q$ is disjoint from $cal(W)_(c_w)$, then instead $h lt.eq b_(+) - eta_Q$.
   The compact sets may meet a face of the opposite color. These assertions are uniform over the two stage parameters.]
] <lem:fc-compact-separation>

#proof[
  Consider any sequence $N_i arrow.r oo$, $R_i arrow.r oo$ of the indicated solutions.
    Lemma 42 gives, with fixed constants,
  #[#set math.equation(numbering: n => "(6.2)")
   $ \| h_i \| lt.eq C_0 \, wide \| h_i \| lt.eq C \( r^(- gamma) - R_i^(- gamma) \) quad upright("on the end") \,
     wide 3 / 4 < gamma < 1 . $ <eq:fc-height-sequence>]
  Extend each $h_i$ across every white face by the constant $b_(+)$,
    and extend the fixed metric and tensor smoothly into those short collars.
    These extensions of $h_i$ are continuous; no uniform boundary modulus is required. Let
  $ underline(h) \( x \) = lim_(j arrow.r oo) inf { h_i \( y \) : i gt.eq j \, "dist" \( x \, y \) < j^(- 1) } . $
  This is a bounded lower semicontinuous function satisfying the limiting end bound.
  Choose $b_(-) < k' < 0$ so near $b_(-)$ that the stage-two collar term is nonpositive at every height at most
    $k'$. Its positive white part vanishes in this fixed low-height range.
    Suppose $phi.alt$ is a smooth lower test of $underline(h)$ at $x$, where $underline(h) \( x \) lt.eq
    k'$ and $d phi.alt \( x \) eq.not 0$. For now exclude the black faces.
    Subtracting a small positive multiple of $"dist" \( x \, dot.op \)^4$ makes contact strict without altering
    the two-jet. Minimization on a small closed ball supplies points $x_i arrow.r
    x$ and constants tending to zero for which the translated tests touch $h_i$ from below and $h_i \( x_i \)
    arrow.r underline(h) \( x \)$. They cannot touch the boundary of the small ball.
    They cannot touch a white face or its extended side either, because $h_i = b_(+) > k'$ there.
    Thus these are interior contacts, even if $x$ itself lies on a white face.
  At these contacts $d f_i = tau_i^(- 1) d phi.alt$, whence
  $ d_i lt.eq frac(tau_i^2, ell_i^2 \| d phi.alt \( x_i \) \|^2) arrow.r 0 \, wide a_i arrow.r 1 \, wide
    chi_i arrow.r 0 . $
  The positive Hessian matrix in the trace equation gives
  $ "tr"_(A_(chi_i)) K + frac(l_i, tau_i sqrt(D_i)) "tr"_(A_(chi_i)) "Hess"_g phi.alt lt.eq F_i \( x_i \) . $
  Here $l_i \/ \( tau_i sqrt(D_i) \) = a_i \/ \| d phi.alt \|$.
    The bound on the collar addition and $C lt.eq C_b$ therefore give
  #[#set math.equation(numbering: n => "(6.3)")
   $ frac("tr"_(\( d phi.alt \)^perp) "Hess"_g phi.alt, \| d phi.alt \|) + "tr"_(\( d phi.alt \)^perp) K lt.eq
     k' + C_b . $ <eq:fc-test-expansion>]
  The left side is the expansion of the level set, oriented toward increasing $phi.alt$.
    Removing the fourth-order localization proves the same assertion for a non-strict lower test.
  To pass from functions to all supports of a closed set, fix $b_(-) < k < k'$ and put $E_k = { underline(h) lt.eq
    k }$. Define
  $ q_j \( s \) = #scale(x: 120%, y: 120%)[\(] 1 + exp \[ - j^2 \( s - k - j^(- 1) \) \]
    #scale(x: 120%, y: 120%)[\)]^(- 1) \, wide v_j = q_j \( underline(h) \) . $
  The lower relaxed limit of $v_j$ is zero on $E_k$ and one off it.
    At an equality point this follows from $q_j \( k \) = \( 1 + e^j \)^(- 1) arrow.r 0$; off $E_k$,
    lower semicontinuity gives a neighborhood whose heights exceed $k$ by a fixed positive amount.
    Let $psi$ be a nonzero-gradient lower test of this limit at a zero value.
    Strict localization gives lower tests of $v_j$ at points $y_j arrow.r x$ with $v_j \( y_j \) arrow.r 0$.
    Their original heights are below $k'$ for large $j$, since $q_j \( k' \) arrow.r 1$.
    For each fixed such $j$ the smooth inverse $q_j^(- 1)$ turns this into a lower test of $underline(h)$ with
    finite nonzero gradient. Apply (6.3) to that inverse test, taking the solution-sequence limit with $j$ fixed,
    and only then let $j arrow.r oo$. An increasing change of defining function preserves the level expansion:
    the additional Hessian term is a multiple of $d psi ⊗ d psi$ and has zero tangential trace.
    Consequently every such test $psi$ satisfies (6.3).
  A smooth local exterior support of $E_k$ has a defining function that is zero at contact and nonpositive on
    $E_k$. Shrinking and scaling the neighborhood so its positive values are below one makes it exactly a lower
    test of the preceding zero–one function. Thus every exterior support has expansion at most $k' + C_b$.
    In particular $E_k$ cannot touch a white face: the reversed face is an exterior support with expansion
  $ - H + "tr"_T K = - c_w > 0 \, $
  whereas $k' + C_b < 0$ after $k'$ is chosen sufficiently close to $b_(-)$.
    Equivalently, in a signed white collar with $s gt.eq 0$ in $Omega$, a small multiple of $-
    s$ is the offending lower test. This rules out boundary layers without assuming that the Dirichlet values
    persist in the relaxed limit. The end bound makes $E_k$ compact.
  Adjoin the entire black region and fill complementary components which contain no designated outer barrier.
    An exterior support at a black frontier point also supports the smooth black region,
    so its expansion is at most $c_b < k' + C_b$. At other frontier points the preceding argument applies.
    Filling produces no frontier point outside the old closed set;
    every support of the larger filled set is still a support of that old set.
    The support bound is therefore preserved. The original required inner collars are covered by the black region,
    and the outer barriers remain outside. Lemma 31 places the resulting set in $cal(B)_(c'')$ for any
    sufficiently close threshold $c'' > k' + C_b$.
  For a fixed compact $Q$ disjoint from $cal(B)_(c_b)$, right continuity gives $delta >
    0$ with $cal(B)_(c_b + delta) ∩ Q = diameter$. Choose
  $ b_(-) < k < k' \, wide k' + C_b < c'' < c_b + delta . $
  Then $E_k ∩ Q = diameter$ for every sequence considered above.
    Failure of a uniform lower margin would give violating points in $Q$, a convergent subsequence,
    and a relaxed limit value at most $k$ there. This contradiction proves the lower assertion.
    Apply the argument to $\( - h \, - K \, - C \)$ for the upper assertion.
    In the white problem, filling retains all reversed black outer faces.
    If the white region is empty, a nonempty violating sublevel would still provide the seed for Lemma 31;
    right continuity at the empty region rules out such seeds at arbitrarily close higher thresholds.
    Multiple components and bounded complementary pockets cause no change.
  For the truncation quantifier start with any $R_min \( N \) arrow.r oo$ satisfying the end estimates,
    and enlarge it as needed. Failure for arbitrarily large $N$ and $R gt.eq
    R_min \( N \)$ would provide exactly a sequence excluded above.
    Only finitely many fixed compact sets will be used below, so their thresholds can be chosen simultaneously. ◻
]

#thm([Lemma 6.2.])[
  (Collar slopes).  #emph[For sufficiently large $N$, the first two stages satisfy, with fixed $c \, C_1 > 0$,
#[#set math.equation(numbering: n => "(6.4)")
 $ c / tau lt.eq partial_nu f lt.eq C_1 / tau quad upright("on ") B_b \, wide c / tau lt.eq - partial_nu f lt.eq
   C_1 / tau quad upright("on ") B_w . $ <eq:fc-signed-slopes>]

 In the third stage $\| partial_nu f \| lt.eq C_1 \/ tau$.
   In the first two stages $b_(-) lt.eq h lt.eq b_(+)$ on every fixed compact region needed for the
   scalar-curvature comparison.]
] <lem:fc-collar-slopes>

#proof[
  Let $s$ be a fixed outward leaf parameter in a black collar, and let $n_s = nabla s \/ \| d s \|$.
    For $h_0 = b_(-) + psi \( s \)$ with $psi' > 0$, evaluate the operator at a comparison contact,
    where the gradients of the test and solution agree. The floor yields
  #[#set math.equation(numbering: n => "(6.5)")
   $ d lt.eq C frac(tau^2, ell^2 \( psi' \)^2) \, wide 1 - a lt.eq d \, wide N chi gt.eq
     c_1 d quad \( N gt.eq 4 \) . $ <eq:fc-collar-smallness>]
  The trace on the test is exactly
  #[#set math.equation(numbering: n => "(6.6)")
   $ P_s + a H_s + chi K \( n_s \, n_s \) +
     a chi (frac("Hess" s \( n_s \, n_s \), \| d s \|) + \| d s \| psi'' / psi') \, $ <eq:fc-collar-trace>]
  where $P_s = "tr"_(T_s) K$. In particular it is the leaf expansion $H_s + P_s$, an $O \( d \)$ error,
    and the displayed logarithmic-slope term. This calculation differentiates neither the input $Z$ nor an unknown
    coefficient. For a negative slope the Hessian terms have $a$ replaced by $- a$.
  Since $H_s + P_s gt.eq c_b$ and $C = C_b - k_B s$, choose small positive slopes with $psi \( 0 \) =
    0$ and $psi \( s \) lt.eq k_B s \/ 2$. Lemma 53 orders the test below the solution at the outer end of a fixed
    short collar. The collar addition vanishes in this compatible direction.
    The residual of the trace equation is at least
  $ frac(k_B s, 2) - C d + a chi \| d s \| psi'' / psi' . $
  Choose a nonnegative smooth $beta_N$ equal to $A N$ on $\[ 0 \, N^(- 1) \]$,
    supported in $\[ 0 \, 2 N^(- 1) \]$, and with integral at most $2 A$. Set
  $ psi' \( s \) = m exp #h(-0.16667em) (integral_0^s beta_N \( q \) thin d q) . $
  A fixed large $A$ makes the final term dominate $C d$ on the first interval, by (6.5).
    Beyond that interval $k_B s \/ 2$ dominates $C d lt.eq C ell$ for large $N$.
    A sufficiently small fixed $m > 0$ ensures all height and outer-edge requirements,
    since the slope multiplier is at most $e^(2 A)$. This is a strict lower barrier with its $h$-slope in a fixed
    positive interval.
  For an upper barrier use $psi' \( s \) = M exp \( - integral_0^s beta_N \)$.
    A fixed large $M$ makes its height gain dominate the outer-edge height bound and all $O \( s \)$ variations of
    the leaf expansion and offset. Its logarithmic-slope term has the negative sign and dominates the $O \( d \)$
    errors initially; the linear height margin dominates them thereafter.
    At a negative minimum of $h - h_0$ the Hessian of $h$ dominates that of $h_0$, their gradients and $Z$ agree,
    and their implicit $t \, l \, A_chi$ agree. Strict height monotonicity contradicts a positive lower-barrier
    residual. At a positive maximum the signs reverse. This proves comparison and the black estimates.
    The sign-reversed construction proves the white estimates.
  In stage three start at its prescribed face value and use a large positive-slope upper barrier and a large
    negative-slope lower barrier, both with logarithmic absolute-slope derivative $- beta_N$.
    The directional inequalities in Proposition 41 give the initial residual signs.
    Formula (4.45) evaluates its shifted height at the original face value,
    so these signs persist along the interpolation. At the unshifted face height all errors are $O \( s + d \)$;
    changing the height supplies a margin at least the absolute height change.
    Large fixed slopes absorb the $O \( s \)$ errors and order the outer edge,
    and the same logarithmic correction handles the initial $O \( d \)$ errors.
    This proves the absolute upper slope bound without using separation in stage three.
    Finally combine the own-color lower collar bounds with Lemma 53 on the rest of a fixed compact set.
    The opposite bound on each collar follows from that lemma as well.
    A finite cover proves the asserted height range. ◻
]

#thm([Lemma 6.3.])[
  (Collar trace inequalities).  #emph[Let $cal(C)$ be a fixed union of shortened inner collars.
    In the first two stages, for every nonnegative smooth $phi.alt$,
#[#set math.equation(numbering: n => "(6.7)")
 $ integral_B L phi.alt thin d A_g & lt.eq P_N integral_(cal(C)) u
   #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) phi.alt + \| d phi.alt \|_(A_chi)
   #scale(x: 120%, y: 120%)[\)] thin d V_g \,\
integral_B phi.alt thin d A_g & lt.eq P_N integral_(cal(C)) sqrt(D)
  #scale(x: 120%, y: 120%)[\(] \( 1 + sqrt(cal(T)) \) phi.alt + \| d phi.alt \|_(A_chi)
  #scale(x: 120%, y: 120%)[\)] thin d V_g . $ <eq:fc-weighted-trace>]

 Fixed collar cutoffs equal to one on $B$ are understood; their derivatives are included in the coefficient of
   $phi.alt$.]
] <lem:fc-trace-estimate>

#proof[
  Set $W = l accent(nabla f, ‾) = l nabla f \/ D = sqrt(d) thin a e$.
    Its $macron(g)$-norm is at most one, and $u W = L w$. For a covector $zeta$,
  $ \| zeta \( W \) \| lt.eq \| zeta \|_(A_d) lt.eq \( 1 + N \/ 4 \)^(1 \/ 2) \| zeta \|_(A_chi) . $
  Direct differentiation gives
  $ u^(- 1) "div"_g \( u W \) & = sqrt(d) #scale(x: 120%, y: 120%)[\(] "tr"_(A_d) H^f + \( d p + p + 2 \) a thin
    partial_e t #scale(x: 120%, y: 120%)[\)] \,\
D^(- 1 \/ 2) "div"_g \( sqrt(D) thin W \) & = sqrt(d) #scale(x: 120%, y: 120%)[\(] "tr"_(A_d) H^f +
  d p thin a thin partial_e t #scale(x: 120%, y: 120%)[\)] . $
  Both are bounded by $P_N \( 1 + sqrt(cal(T)) \)$ using Lemma 35.
    In particular their axial Hessian coefficient is $d^(3 \/ 2)$,
    and their axial $d t$ coefficient is at most $\( 2 N + 2 \) sqrt(d)$; the other Hessian terms are transverse.
    No factor $ell^(- 1)$ occurs. At a black or white face, respectively, $u W_nu = L a$ or $- L a$, and $a gt.eq
    1 \/ 2$ by (6.4). Apply the divergence theorem with the corresponding sign, the collar cutoff, and $phi.alt$.
    Replacing $u$ by $sqrt(D)$ gives the second inequality. The formulas also hold at zero gradients by continuity. ◻
]

=== 6.2 Global bounds before regularity <global-bounds-before-regularity>

#thm([Lemma 6.4.])[
  (High-level weighted energy).  #emph[In stage one there is $M_0 = M_0 \( N \) > 0$ such that,
    if $j_0$ is a smooth increasing cutoff equal to zero below $M_0$ and to one above $M_0 + 1$,
    with bounded derivative, then
#[#set math.equation(numbering: n => "(6.8)")
 $ integral_(Omega_R) u j_0 \( cal(T) + rho + tau a sigma \) thin d V_g +
   integral_(Omega_R) u j'_0 \| d Z \|_(A_chi)^2 thin d V_g lt.eq C_N . $ <eq:fc-high-energy>]

 Consequently, on the ordinary product graph $Gamma$ of $f$, every fixed compact base patch $Q$ satisfies
#[#set math.equation(numbering: n => "(6.9)")
 $ integral_(Gamma \| Q) e^(2 Z) thin d V_Gamma lt.eq C_(N \, Q) . $ <eq:fc-graph-L2>]

]
] <lem:fc-high-energy>

#proof[
  On the penalty band $- epsilon.alt lt.eq t lt.eq - epsilon.alt + N^(- 1)$, $l asymp ell$ and $D =
    e^(8 \( Z - t \))$. Thus $a sigma$ tends uniformly to infinity as $Z arrow.r oo$ on that band.
    The penalty weights are bounded on the entire exterior, so a sufficiently large $M_0 \( N \)$ ensures
  #[#set math.equation(numbering: n => "(6.10)")
   $ Xi gt.eq delta_0 cal(T) + rho + 1 / 2 delta_0 tau a sigma quad upright("on ") { Z > M_0 } . $ <eq:fc-high-source>]
  Outside the penalty band this is immediate. Testing the first stage divergence equation by $j_0 \( Z \)$ has no
    outer boundary term, since the outer value of $Z$ is zero. The drift term is bounded by
  $ u j'_0 \| chevron.l d Z \, K \( w \, dot.op \) chevron.r_(A_chi) \| lt.eq 2 u j'_0 \| d Z \|_(A_chi)^2 +
    C u j'_0 \| K \|^2 . $
  The latter integral is bounded by $C_N$: the floor and the bounded $Z$ strip bound $u$ there, while $K =
    O \( r^(- 2) \)$ has finite squared integral on the three-dimensional AF end.
  At either color of face, the matching signs give $- H + w_nu \( F - P_B \) = - \( 1 - a \) H$.
    The omitted-drift term has normal component bounded by $C chi lt.eq C d$,
    and the scalar boundary multiplier lies in $\[ 0 \, 1 \]$. Hence, uniformly in the first stage,
  #[#set math.equation(numbering: n => "(6.11)")
   $ \| \( V_xi \)_nu \| lt.eq C u d = C L sqrt(d) lt.eq C tau / ell L . $ <eq:fc-boundary-flux-small>]
  Integration and (6.10) give the left side of (6.8), up to fixed positive coefficients, bounded by $C_N +
    C \( tau \/ ell \) integral_B L j_0$. Use (6.7). On the fixed collars the positive minimum of $rho$ implies
  $ 1 + sqrt(cal(T)) lt.eq C \( rho + delta_0 cal(T) \) . $
  Thus the terms with $j_0$ absorb for $N$ large, by (6.1). The derivative term is bounded by
  $ u j'_0 \| d Z \|_(A_chi)^2 + C \( P_N tau \/ ell \)^2 u j'_0 . $
  Its second summand has a bounded integral on the compact collar and the bounded $Z$ strip. This proves (6.8).
  Now constants may have arbitrary fixed-$N$ dependence. The measures $d V_Gamma =
    sqrt(1 + sigma^2) thin d V_g$ and $sqrt(D) thin d V_g$ are comparable because $ell lt.eq l lt.eq e$. Moreover
  $ e^(2 Z) = e^(2 t) D^(1 \/ 4) \, wide D^(1 \/ 4) lt.eq C_N \( 1 + tau a sigma \) \, wide u = l e^(2 t) sqrt(D) . $
  The middle bound follows by separating $l sigma lt.eq 1$ and $l sigma > 1$, on which $a gt.eq 1 \/ sqrt(2)$.
    On a fixed compact $Q$, its positive minimum of $rho$ and (6.8) control the high-level part of (6.9).
    On $Z lt.eq M_0 + 1$ the floor bounds $D$, $sigma$, and $e^(2 Z)$,
    so the remaining graph volume is bounded by a constant times the fixed base volume.
    This is a local weighted estimate, with no global graph-volume assumption. ◻
]

#thm([Lemma 6.5.])[
  (Graph Sobolev Inequality and iteration).  #emph[In stage one,
    $Z$ has a uniform upper bound on every fixed compact subset of the closed prepared exterior.
    The bound is independent of the truncation and first-stage parameter at fixed $N$.]
] <lem:fc-graph-iteration>

#proof[
  Put $d_o = \( 1 + sigma^2 \)^(- 1)$. The matrices $A_(d_o) \, A_d \,
    A_chi$ are uniformly comparable at fixed $N$, without an upper bound on $Z$.
    Here $\| nabla_Gamma omega \| = \| d omega \|_(A_(d_o))$.
    Extend a fixed base patch to a compact smooth enlargement and isometrically embed it in Euclidean space by
    Nash’s Theorem #cite(label("nash1956")). Its product with the line immerses the ordinary graph isometrically.
    The base embedding contributes a bounded amount to the graph mean curvature vector.
    Its mean curvature in the product is
  $ H_Gamma = frac(sqrt(D), l sqrt(1 + sigma^2)) #scale(x: 120%, y: 120%)[\(] "tr"_(e^perp) H^f +
    d_o H^f \( e \, e \) #scale(x: 120%, y: 120%)[\)] . $
  The prefactor is bounded by $C_N$ and $d_o \/ sqrt(d) lt.eq C_N$.
    Coercivity therefore gives $\| H_Gamma \| lt.eq C_N \( 1 + sqrt(cal(T)) \)$.
    The Michael–Simon Inequality #cite(label("michaelsimon1973")),
    in the form with an ordinary boundary integral stated explicitly by Brendle #cite(label("brendle2021"))
    Theorem 1, says
  $ (integral_Gamma phi.alt^(3 \/ 2) thin d V_Gamma)^(2 \/ 3) lt.eq
    C
    [integral_Gamma \( \| nabla_Gamma phi.alt \| + \( 1 + \| H_Gamma \| \) phi.alt \) thin d V_Gamma +
    integral_(partial Gamma) phi.alt thin d A] $
  for nonnegative supported $phi.alt$. The graph over a compact smooth patch is embedded by the fixed Nash
    embedding. Enlarging the ambient Euclidean space if needed puts its codimension at least two,
    as in Brendle’s Theorem. That theorem applies first to $phi.alt + epsilon > 0$;
    letting $epsilon arrow.b 0$ and using $sqrt(a^2 + b^2) lt.eq a + b$ gives the displayed form.
    The boundary form follows also by extending each smooth immersed graph slightly across its boundary and
    letting a cutoff collar shrink: its derivative integral tends to the boundary integral and its added curvature
    integral tends to zero. This is done for each smooth graph before taking the uniform estimate.
    On an inner face $f$ is constant, so $d A = d A_g$. Equation (6.7) bounds that boundary integral by $C_N
    integral_Gamma \[ \( 1 + sqrt(cal(T)) \) phi.alt + \| nabla_Gamma phi.alt \| \] thin d V_Gamma$.
    Taking $phi.alt = \| omega \|^4$ and using Cauchy–Schwarz proves
  #[#set math.equation(numbering: n => "(6.12)")
   $ parallel omega parallel_(L^6 \( d V_Gamma \))^2 lt.eq C_N integral_Gamma #scale(x: 120%, y: 120%)[\(] \|
     nabla_Gamma omega \|^2 + \( 1 + cal(T) \) omega^2 #scale(x: 120%, y: 120%)[\)] thin d V_Gamma .
     $ <eq:fc-graph-sobolev>]
  For a compact base cutoff $eta$ test the scalar equation by $q = eta^2 e^(2 k Z) \/ L$. Its differential is
  $ d q = L^(- 1) e^(2 k Z) \[ 2 eta thin d eta + eta^2 \( 2 k thin d Z - \( p + 2 \) thin d t \) \] . $
  The principal exponential term contributes $8 k eta^2 e^(2 k Z) \| d
    Z \|_(A_chi)^2$ against the measure $sqrt(D) thin d V_g$. Coercivity gives
  $ 4 \( p + 2 \) \| chevron.l d t \, d Z chevron.r_(A_chi) \| lt.eq 1 / 4 delta_0 cal(T) + C_N \| d Z \|_(A_chi)^2 . $
  For $k gt.eq k_(*) \( N \)$ the second term absorbs. The drift terms obey
  $ 2 k \| chevron.l K \( w \, dot.op \) \, d Z chevron.r_(A_chi) \| & lt.eq k \| d Z \|_(A_chi)^2 + C k \| K \|^2 \,\
\( p + 2 \) \| chevron.l K \( w \, dot.op \) \, d t chevron.r_(A_chi) \| & lt.eq 1 / 4 delta_0 cal(T) +
  C_N \| K \|^2 . $
  The cutoff terms have the same bounds with a remainder $C_N k e^(2 k Z) \( eta^2 + \| d eta \|_g^2 \)$.
    The penalty is bounded on the entire exterior and contributes to this remainder.
    Before the last inequality of (6.11), the boundary term is at most $C eta^2 e^(2 k Z) sqrt(d) lt.eq
    C eta^2 e^(2 k Z)$. Using (6.7) with $phi.alt = eta^2 e^(2 k Z)$ bounds it by
  $ C_N integral_Gamma e^(2 k Z) #scale(x: 120%, y: 120%)[\[]
    eta^2 \( 1 + sqrt(cal(T)) + k \| nabla_Gamma Z \| \) + eta \| d eta \|_g #scale(x: 120%, y: 120%)[\]] thin d
    V_Gamma . $
  Young’s Inequality absorbs the $sqrt(cal(T))$ term and the term linear in the gradient;
    the latter costs $C_N k$ times the weighted volume. After comparison of the graph measures we have
  #[#set math.equation(numbering: n => "(6.13)")
   $ integral_Gamma e^(2 k Z) eta^2 \( cal(T) + k \| nabla_Gamma Z \|^2 \) thin d V_Gamma lt.eq
     C_N k integral_Gamma e^(2 k Z) \( eta^2 + \| d eta \|_g^2 \) thin d V_Gamma \, quad k gt.eq
     k_(*) \( N \) . $ <eq:fc-exponential-energy>]
  Its constants are independent of $k$ and $R$.
  For nested base patches $U_r subset U_(r')$, combine (6.12) with (6.13) applied to $eta e^(k Z)$:
  $ parallel e^Z parallel_(L^(6 k) \( Gamma \| U_r \)) lt.eq
    #scale(x: 120%, y: 120%)[\[] C_N k^2 \( 1 + \( r' - r \)^(- 2) \)
    #scale(x: 120%, y: 120%)[\]]^(1 \/ \( 2 k \)) parallel e^Z parallel_(L^(2 k) \( Gamma \| U_(r') \)) . $
  Iterate with $k_j = 3^j k_(*)$ and geometrically decreasing gaps.
    The sums $sum k_j^(- 1)$ and $sum j \/ k_j$ converge, giving
  $ S \( r \) := sup_(U_r) e^Z lt.eq C_N \( r' - r \)^(- A_N) parallel e^Z
    parallel_(L^(2 k_(*)) \( Gamma \| U_(r') \)) . $
  Increase $k_(*)$ to at least two. The local $L^2$ estimate (6.9) and interpolation give $S \( r \) lt.eq
    C_N \( r' - r \)^(- A_N) S \( r' \)^(1 - 1 \/ k_(*))$. For any $theta.alt > 0$, Young’s Inequality turns this into
  $ S \( r \) lt.eq theta.alt S \( r' \) + C_(N \, theta.alt) \( r' - r \)^(- A_N k_(*)) . $
  Use radii increasing geometrically to a fixed outer patch and choose $theta.alt < 2^(- A_N k_(*) - 1)$.
    The resulting series converges. The final remainder tends to zero because each individual smooth solution has
    a finite supremum on that closed outer patch. The bound obtained is independent of this individual supremum.
    A finite cover proves the lemma, including at inner faces. ◻
]

#thm([Proposition 6.6.])[
  (Bounded variables in every stage).  #emph[There are $N_0$ and $R_min \( N \) arrow.r oo$ such that,
    for $N gt.eq N_0$ and $R gt.eq R_min \( N \)$, every smooth solution of the four-stage family with $t gt.eq -
    epsilon.alt$ satisfies
$ \| h \| lt.eq C_0 \, wide \| f \| lt.eq C_0 \/ tau \, wide - epsilon.alt lt.eq t lt.eq Z lt.eq C_N \,
  wide \| d f \| lt.eq C_N . $

 The constants are uniform in the homotopy and truncation.]
] <prop:fc-bounded-range>

#proof[
  It remains to extend the first-stage compact bound to the tail; the tensor $K$ need not be compactly supported.
    Everywhere, not only at a critical point of $t$, differentiation gives
  #[#set math.equation(numbering: n => "(6.14)")
   $ nabla w = H^f A_d + p d thin d t ⊗ w \, wide d log u = \( p + 2 + p v \) thin d t +
     H^f \( w \, dot.op \) . $ <eq:fc-drift-identities>]
  Also
  $ A_chi = I - frac(4 + p, 4 + p v) w ⊗ w \, wide partial_p frac(4 + p, 4 + p v) = frac(4 d, \( 4 + p v \)^2) . $
  In differentiating $A_chi$, the derivatives of $v$ have the form $2 a d thin H^f \( dot.op \, e \) +
    2 p d a^2 d t$. Thus every axial $H^f \( e \, e \)$ or axial $d t$ term in $u^(- 1)
    "div"_g \( u A_chi K \( w \, dot.op \) \)$ has a factor $d$ or $chi$.
    More explicitly its absolute value is bounded by
  $ P_N \| K \| #scale(x: 120%, y: 120%)[\(] \| H_(T T)^f \| + \| H_(e T)^f \| + d \| H_(e e)^f \| + \| d t_T \| +
    d \| d t_e \| #scale(x: 120%, y: 120%)[\)] + P_N a \| nabla K \| . $
  For the $d log u$ term this follows from $A_chi K \( w \, dot.op \) \( e \) = chi a K \( e \, e \)$;
    for the other terms it follows directly from (6.14) and the displayed derivative of the scalar coefficient.
    Coercivity and Young’s Inequality imply
  #[#set math.equation(numbering: n => "(6.15)")
   $ lr(|u^(- 1) "div"_g \( u A_chi K \( w \, dot.op \) \)|) lt.eq 1 / 2 delta_0 cal(T) +
     C_N \( \| K \|^2 + a \| nabla K \| \) . $ <eq:fc-drift-bound>]
  Since $K = O \( r^(- 2) \)$, $nabla K = O \( r^(- 3) \)$, and $tau a sigma =
    tau a^2 sqrt(D) \/ l gt.eq \( tau \/ e \) a^2$, the second term on the right is,
    sufficiently far out at fixed $N$, at most
  $ 1 / 4 rho + 1 / 4 delta_0 tau a sigma . $
  Indeed the cross term is absorbed by a fixed fraction of $tau a^2$ with remainder $C_N r^(- 6)$,
    while $r^(- 4) = o \( r^(- 3 - delta) \)$ because $delta < 1$.
    At an interior maximum of $Z$ above $M_0$, the principal divergence contributes $4 u A_chi : "Hess" Z lt.eq
    0$. Equations (6.10) and (6.15) contradict the scalar equation.
    The compact upper bound and outer value zero therefore give a global first-stage bound.
  In stages two and three the drift is zero and the source is positive above a fixed high level,
    so an interior maximum there is impossible. At an inner face
  $ Z lt.eq t + 1 / 8 log \( 1 + e^2 C_1^2 \/ tau^2 \) . $
  Consequently high boundary $Z$ implies $t > 1$, where the boundary multiplier makes the conormal derivative
    zero. The boundary point principle on the high superlevel excludes that maximum.
    These maximum principles apply to each smooth solution with its positive definite coefficients,
    so they require no prior uniform ellipticity bound. Stage four has $f = 0$ and $t = Z$.
    Its positive scales have the same high-level argument; at scale zero its homogeneous mixed problem gives $Z =
    0$. This is uniform as the scale tends to zero.
  Finally $D = e^(8 \( Z - t \))$ and $l gt.eq ell$ give
  $ \| d f \|^2 = l^(- 2) \( e^(8 \( Z - t \)) - 1 \) lt.eq ell^(- 2) \( e^(8 \( C_N + epsilon.alt \)) - 1 \) . $
  The height bound was already proved. The finite set of compact separation and collar choices,
    followed by the polynomial absorption, fixes $N_0$. Enlarge $R_min \( N \)$ to contain all fixed patches and
    the end thresholds. The preceding arguments apply to floor-contact solutions as well. ◻
]

=== 6.3 Classical compactness and the scalar solution operator <classical-compactness-and-the-scalar-solution-operator>

The analytic estimates in Section 5 are proved independently of the deformation.
  In particular they do not assume a modulus of continuity for the axial coefficient.

#thm([Proposition 6.7.])[
  (Classical bounds).  #emph[At fixed $epsilon.alt \, N$, the solutions in Proposition 58 have local bounds of
    every finite classical order, up to the inner and outer faces,
    uniform in $xi$ and in all sufficiently large $R$. On the end one can use patches with a fixed positive radius
    and uniform constants.]
] <prop:fc-classical-bounds>

#proof[
  On the bounded variable range $l \, u \, D$ are bounded above and away from zero and $chi gt.eq c_N > 0$.
    The normalized trace equation is
  $ A_chi : "Hess"_g f = sqrt(D) / l \( F_xi - "tr"_(A_chi) K \) . $
  Its right side is bounded. Theorem 45 gives $D f$ Hölder and
  $ integral_(B_r) \| D^2 f \|^2 thin d x lt.eq C_N r^(1 + beta_N) quad upright("for some ") beta_N > 0 . $
  The scalar principal coefficient in coordinates is $4 sqrt(det g) thin u A_chi^(i j)$; the drift is bounded.
    By the smooth implicit change $t = t \( x \, Z \, D f \)$, $D t = t_Z D Z + t_(D f) :
    D^2 f$ plus controlled coordinate terms. The source, including every homotopy modification,
    is therefore bounded in absolute value by $C_N \( 1 + \| D Z \|^2 + \| D^2 f \|^2 \)$.
    The prescribed inner flux is bounded and the outer value of $Z$ is zero.
    Reflection contributes at most a bounded plane density, which has mass $O \( r^2 \)$.
    Lemma 50 now gives a Hölder estimate for $Z$.
  All smooth bounded-range coefficients of the trace equation are then Hölder,
    so its Dirichlet Schauder estimate gives $f in C^(2 \, theta)$.
    At a face $D f$ is normal, and the scalar condition solves for
  $ partial_nu Z = G_xi \( x \, Z \, f \, D f \) $
  with $G_xi$ smooth on the bounded range: $A_chi nu = chi nu$.
    The expanded scalar equation has Hölder leading matrix and right side bounded by $C_N \( 1 + \| D Z \|^2 \)$.
    Proposition 51 applies. Its interpolation after subtracting a constant uses small Hölder oscillation of $Z$ to
    absorb the quadratic gradient term in local $W^(2 \, p)$ estimates.
    The normal datum’s trace norm is controlled by a lower-order $W^(1 \, p)$ norm;
    the derivatives of $f$ entering that datum are already bounded.
    Subsequent Schauder estimates give every finite order. The data have uniform smooth end-patch bounds,
    and the large outer spheres have uniform boundary-chart constants.
    The local supremum-of-patch-norm argument in Proposition 51 therefore makes all these estimates independent of
    $R$. ◻
]

We first solve the trace equation for prescribed $Z$. This will define the compact map used in the degree argument
  below, and the same scalar result will also apply to the later spatially varying lapse.

#thm([Proposition 6.8.])[
  (A scalar trace equation with bounded input).  #emph[Let $M$ be a compact smooth Riemannian three-manifold with
    smooth, disjoint boundary components carrying constant Dirichlet values.
    For prescribed $Z in C^(1 \, b') \( M \)$, $0 < b' < 1$, consider
#[#set math.equation(numbering: n => "(6.16)")
 $ A_b \( x \, Z \, D f \) : "Hess"_g f = Q \( x \, Z \, f \, D f \) \, wide A_b = I + \( b - 1 \) e ⊗ e \, quad
   e = nabla f \/ \| d f \| . $ <eq:fc-general-trace>]

 Suppose the actual coefficients extend smoothly at $d f = 0$,
   are smooth on bounded ranges of their displayed variables,
   and the principal coefficient is independent of the height $f$.
   Suppose, uniformly on bounded input sets and any auxiliary compact parameter family, the following hold:]
  + #emph[constant upper and lower height barriers bound $\| f \| lt.eq
    M_1$ for every solution and for the normalized interpolation to $Delta_g f = c_(*) f$, with fixed $c_(*) > 0$;]
  + #emph[on that height range, $0 < b lt.eq 1$, $b gt.eq c \/ \( 1 + \| d f \| \)$, and $\| Q \| lt.eq
    C \( 1 + \| d f \| \)$;]
  + #emph[$Q_f > 0$, uniformly away from zero on bounded variable ranges.]
  #emph[Then the Dirichlet equation has a unique solution in $C^(3 \, b')$.
    It depends continuously on the input and parameters and is bounded in $C^(3 \, b')$ on bounded input sets.
    No prospective floor condition on an implicit auxiliary variable is required.]
] <prop:fc-trace-solve>

#proof[
  Take a smooth extension of $M$ and a distance collar radius smaller than a normal injectivity radius and half
    the separation of distinct boundary components. At a face use the barriers given by its value plus or minus
  $ psi \( r \) = k^(- 1) log \( 1 + B r \) \, wide psi'' = - k \( psi' \)^2 . $
  At slopes $q = psi' gt.eq 1$, the upper barrier’s axial contribution is at most $- c k q \/ 2$,
    whereas its tangential curvature and source cost at most $C \( 1 + q \)$.
    Choose $k$ large, then a collar radius $r_0$ sufficiently small, and finally $B$ large with $B r_0 gt.eq
    1$ and $psi \( r_0 \) > 2 "osc" f$. Then $q gt.eq 1 \/ \( 2 k r_0 \)$ throughout the collar.
    The lower barrier has the reverse sign. It suffices to check their residuals at possible comparison contacts,
    where their heights are in the fixed solution range; height monotonicity gives comparison.
    These barriers exclude a positive maximum of
  $ f \( x \) - f \( y \) - psi \( "dist" \( x \, y \) \) quad upright("for ") 0 < "dist" \( x \, y \) < r_0 $
  with one endpoint on $partial M$. Their value at $r_0$ excludes the other edge of this two-point domain.
  At a positive interior maximum, the endpoint gradients have common length $q =
    psi' \( r \)$ and are parallel transports along the short joining geodesic.
    Simultaneous endpoint variations in parallel transverse directions, using the second variation of distance, give
  $ "tr"_(e_x^perp) "Hess" f \( x \) - "tr"_(e_y^perp) "Hess" f \( y \) lt.eq C q r . $
  The transverse eigenvalues of both operators are exactly one.
    Separate axial variations give $f_(e_x e_x) \( x \) lt.eq psi'' \( r \)$ and $- f_(e_y e_y) \( y \) lt.eq
    psi'' \( r \)$. Therefore
  $ - 2 C \( 1 + q \) lt.eq Q \( x \) - Q \( y \) lt.eq C q r + \( b_x + b_y \) psi'' \( r \) lt.eq C q r -
    frac(2 c k q^2, 1 + q) \, $
  which contradicts the choices of $k$ and $r_0$. No derivative or continuity modulus of $b_x - b_y$ was used.
    Interchanging the points and then letting their distance tend to zero yields the global Lipschitz bound $\| d
    f \| lt.eq psi' \( 0 \)$.
  Interpolate the normalized equation by $A_s = \( 1 - s \) I + s A_b$ and $Q_s = \( 1 - s \) c_(*) f + s Q$.
    The axial lower bound, source growth, constant barriers, and strict height sign persist.
    The preceding gradient estimate is uniform in $s$, so the equations are uniformly elliptic.
    Theorem 45 first gives $C^(1 \, theta)$, then Schauder gives $C^(2 \, theta)$.
    On this range $D f$ and the prescribed $Z$ are Lipschitz;
    the undifferentiated coefficients therefore have bounded $C^(b')$ norms.
    Schauder upgrades to $C^(2 \, b')$ and one further differentiation gives $C^(3 \, b')$.
    The linearization has positive definite principal matrix and negative zeroth-order coefficient $-
    partial_f Q_s$. The Dirichlet maximum principle and linear elliptic theory give its inverse.
    The implicit function theorem supplies openness of continuation from $Delta_g f = c_(*) f$;
    the uniform estimates and compactness supply closedness. Comparison at a maximum of the difference proves
    uniqueness, because the gradients agree and the height source is strictly increasing.
    The implicit function theorem, or compactness and uniqueness, gives the asserted dependence and uniform bounds. ◻
]

#thm([Corollary 6.9.])[
  (The flat trace solution operator).  #emph[For fixed $N gt.eq 4$, $tau > 0$, a finite $Omega_R$,
    and any $xi in \[ 0 \, 4 \]$, the trace equation of Proposition 41 has a unique solution $f =
    S_xi \( Z \) in C^(3 \, b')$ for every $Z in C^(1 \, b')$ with zero outer value.
    It has the continuity and bounded-input estimates of Proposition 60, without a floor assumption.]
] <cor:fc-flat-trace-solve>

#proof[
  The implicit definition (4.12) is smooth and strictly increasing in $t$ at fixed $d f$.
    The height estimates use only the trace equation, including its strict height sign,
    so they hold without a floor. For bounded $Z$ and $sigma arrow.r oo$, necessarily $t arrow.r - oo$, $p = N$,
    and $l = e^(N t)$. The exact relation is
  $ e^(8 Z) = e^(8 t) + sigma^2 e^(\( 2 N + 8 \) t) . $
  Uniformly on bounded $Z$ ranges,
  #[#set math.equation(numbering: n => "(6.17)")
   $ t = frac(4 Z - log sigma, N + 4) + o \( 1 \) \, wide chi asymp sigma^(- 8 \/ \( N + 4 \)) \, wide sqrt(D) /
     l asymp sigma . $ <eq:fc-no-floor-asymptotics>]
  Since $N gt.eq 4$, the axial factor is at least $c \/ \( 1 + sigma \)$. After division by $l \/ sqrt(D)$ the source is
  $ Q = sqrt(D) / l \( F_xi - "tr"_(A_chi) K \) \, wide \| Q \| lt.eq C \( 1 + sigma \) . $
  All collar terms are bounded on the height range, and $Q_f = \( sqrt(D) \/ l \) tau \( F_xi \)_h > 0$.
    The principal matrix is independent of $f$ itself. The normalized interpolation to $Delta f =
    tau f$ retains these conditions and the constant barriers. Apply Proposition 60. ◻
]

=== 6.4 Degree, exhaustion, and end normalization <degree-exhaustion-and-end-normalization>

#thm([Lemma 6.10.])[
  (Degree on moving sections).  #emph[Let $X$ be a Banach space and $H : \[ 0 \, 1 \] times X arrow.r
    X$ a continuous map taking bounded sets to relatively compact sets.
    Let $cal(O) subset \[ 0 \, 1 \] times X$ be a bounded relatively open set.
    If its closure has no fixed point on its relative product boundary,
    then $deg \( I - H_s \, cal(O)_s \, 0 \)$ is independent of $s$.
    Here $cal(O)_s = { x : \( s \, x \) in cal(O) }$, and the degree of an empty section is zero.]
] <lem:fc-moving-degree>

#proof[
  The fixed set in $overline(cal(O))$ is compact by the joint compactness and continuity,
    and it lies in $cal(O)$ by hypothesis. For each parameter,
    surround its compact fixed-point set by a bounded open neighborhood whose closure is contained in all
    sufficiently nearby sections. All nearby fixed points of $overline(cal(O))$ lie in this neighborhood:
    otherwise a sequence outside it would converge to a fixed point at the original parameter outside the
    neighborhood. Excision identifies the section degree with the degree on this one neighborhood,
    and ordinary homotopy invariance makes it constant locally.
    At a parameter without fixed points the same compactness argument makes all nearby degrees zero.
    A finite covering of the parameter interval proves the assertion.
    These are the compact-perturbation degree and excision properties of Leray–Schauder
    #cite(label("lerayschauder1934")). ◻
]

#thm([Proposition 6.11.])[
  (Finite-domain existence).  #emph[For each fixed sufficiently small $epsilon.alt > 0$,
    all sufficiently large $N$, and every $R gt.eq R_min \( N \)$,
    the physical flat system has a smooth solution on $Omega_R$ with $t > - epsilon.alt$ on its closure.
    Its classical local bounds are uniform as $R arrow.r oo$ at fixed $N$.]
] <prop:fc-degree>

#proof[
  Choose $N_0 gt.eq max { 4 \, ceil.l 2 \/ epsilon.alt ceil.r }$ large enough for Proposition 44 and all the
    preceding estimates. Enlarge $R_min \( N \)$ to tend to infinity and to enforce the outer height and gradient
    barriers. Explicitly the outer slope has the bound $sigma lt.eq C_(upright("out")) tau^(- 1) R^(- 1 - gamma)$.
    It suffices also to require
  #[#set math.equation(numbering: n => "(6.18)")
   $ R gt.eq (frac(2 C_(upright("out")) ell, tau sqrt(e^(8 epsilon.alt) - 1)))^(1 \/ \( 1 + gamma \)) .
     $ <eq:fc-outer-radius>]
  At outer $Z = 0$ the implicit expression for $Z$ evaluated at $t = - epsilon.alt$ is then strictly negative,
    so its monotonicity excludes an outer floor contact. The choices may depend arbitrarily on fixed $N$;
    there is no restriction requiring a polynomial outer radius.
  Fix $N \, R$ and let
  $ X = { Z in C^(1 \, b') \( overline(Omega_R) \) : Z \|_(partial_(upright("out")) Omega_R) = 0 } . $
  For an input $Z$, solve $f = S_xi \( Z \)$ by Corollary 61 and compute all auxiliary variables and source terms
    from this pair. Denote the frozen drift summand by $D_xi$, the full frozen bulk source by $E_xi$,
    and the prescribed inner flux by $q_xi$. Define $H_xi \( Z \) = tilde(Z)$ by
  #[#set math.equation(numbering: n => "(6.19)")
   $
     cases(delim: "{", "div"_g \( 4 u A_chi nabla tilde(Z) + D_xi \) = E_xi & upright("in ") Omega_R \,, \( 4 u
     A_chi nabla tilde(Z) + D_xi \)_nu = q_xi & upright("on ") B \,, tilde(Z) = 0 &
     upright("on the outer face") .) $ <eq:fc-compact-map>]
  Only the displayed principal gradient uses the output. On bounded input sets,
    $4 u A_chi$ is positive definite and $C^(1 \, b')$, the drift is $C^(1 \, b')$,
    the bulk source is $C^(0 \, b')$, and the boundary datum is $C^(1 \, b')$.
    In particular $D t$ involves $D Z \, D^2 f$, and no second derivative of the input $Z$.
    The nonempty outer Dirichlet face gives the Poincaré Inequality,
    so the mixed linear problem is uniquely solvable by coercivity.
    The inward-normal convention changes only the sign of its boundary functional.
    Linear regularity gives $tilde(Z) in C^(2 \, b')$. The compact embedding into $X$ and continuous dependence
    make $H$ a continuous compact homotopy on bounded sets, including its concatenation points.
    Its fixed points satisfy the original equations and bootstrap to smoothness.
  After the trace solve set
  $ cal(O) = { \( xi \, Z \) : min_(overline(Omega_R)) t_xi \[ Z \] > - epsilon.alt \,
    parallel Z parallel_(C^(1 \, b')) < M } . $
  This is relatively open because the trace solve and implicit change are continuous.
    Choose $M$ larger than the fixed-point bound supplied by Propositions 58 and 59,
    using their higher estimates if necessary to reach the chosen exponent $b'$.
    A fixed point in $overline(cal(O))$ is smooth and has $t gt.eq - epsilon.alt$,
    so these estimates exclude its norm boundary. Equation (6.18) and Proposition 44 exclude its floor boundary.
    Thus Lemma 62, with the parameter interval rescaled, applies.
    Notice that arbitrary inputs need not satisfy the floor, and the map need not preserve $cal(O)_xi$.
  At $xi = 4$ the unique trace solution is $f = 0$, the drift vanishes,
    and both bulk source and inner flux in (6.19) are zero for every input. Its output is identically zero.
    The zero input has $t = 0 > - epsilon.alt$ and lies inside the norm cutoff.
    Hence the final degree is one, and so is the physical degree. A physical fixed point exists in $cal(O)_0$.
    The asserted radius-independent local bounds are Proposition 59. ◻
]

#thm([Proposition 6.12.])[
  (Existence and end estimates).  #emph[For every fixed sufficiently small $epsilon.alt >
    0$ and sufficiently large $N$, the physical system has a smooth solution on $Omega$,
    including its inner boundary, with $t gt.eq - epsilon.alt$. For some $c_N > 0$ and every fixed derivative order $j$,
#[#set math.equation(numbering: n => "(6.20)")
 $ \| nabla^j f \| lt.eq C_(N \, j) e^(- c_N r) \, wide Z \, t = O_2 \( r^(- 1) \) . $ <eq:fc-end-decay>]

 The differences $Z - t$ and $l^2 d f^2$, with their derivatives, decay exponentially. Moreover
#[#set math.equation(numbering: n => "(6.21)")
 $ V = 4 nabla_g t + O \( r^(- 3) \) \, wide cal(F)_N := lim_(r arrow.r oo) integral_(S_r) V_(nu_g) thin d A_g
   quad upright("exists and is finite") . $ <eq:fc-flux-asymptotic>]

]
] <prop:fc-existence>

#proof[
  Apply Proposition 63 to any $R_i arrow.r oo$. Uniform classical estimates and a diagonal subsequence give smooth
    convergence on each compact subset, including the fixed inner faces.
    The equations and boundary conditions pass to the limit, as does $t gt.eq - epsilon.alt$.
    We prove the end bounds already on the truncations so that their normalization does not escape to infinity.
  Where $C = 0$ and $"tr"_g K = 0$, the trace equation is
  #[#set math.equation(numbering: n => "(6.22)")
   $ A_chi : "Hess"_g f + B_f dot.op d f - c_f f = 0 \, wide c_f = tau sqrt(D) / l \, wide B_f = -
     frac(4 + p, 4 + p v) l / sqrt(D) K \( nabla f \, dot.op \) . $ <eq:fc-tail-f-linear>]
  Indeed $"tr"_(A_chi) K = - \( 1 - chi \) K \( e \, e \)$ and
  $ sqrt(D) / l \( 1 - chi \) K \( e \, e \) = frac(4 + p, 4 + p v) l / sqrt(D) K \( nabla f \, nabla f \) . $
  At fixed $N$ the equation has uniformly elliptic principal coefficient, bounded drift, and $c_f gt.eq
    tau \/ e > 0$. For a sufficiently small $c_N > 0$, the positive function $exp \[ - c_N \( r - r_0 \) \]$ is a
    supersolution of its negative-principal operator beyond a fixed large $r_0$:
    the positive height term dominates the $O \( c_N^2 \)$ radial and $O \( c_N \/ r \)$ tangential Hessian terms
    and the bounded drift term. Multiply it to dominate the inner sphere data;
    it also dominates the zero outer data. Comparison for both signs gives exponential decay uniformly in the
    truncation. The already uniform smooth coefficient bounds,
    followed by the homogeneous linear estimates for (6.22), give exponential decay of every fixed derivative.
    The corresponding zero-Dirichlet estimates apply near the outer spheres.
    Thus $Z - t$ and graph errors are exponentially small with derivatives.
  Using tracefreeness of $K$ on the tail, the quadratic form is now
  $ cal(T) = 1 / 2 \| K \|^2 + 4 \( p \( Z \) + 1 \) \| d Z \|^2 + O \( e^(- c_N r) \) \, $
  and $A_chi = I + O \( e^(- c_N r) \)$, $u = L \( Z \) + O \( e^(- c_N r) \)$.
    The drift $u A_chi K \( w \, dot.op \)$ is exponentially small as well.
    After decreasing $c_N$ to absorb polynomial factors, the scalar equation becomes
  #[#set math.equation(numbering: n => "(6.23)")
   $ Delta_g Z + b_N \( Z \) \| d Z \|^2 & = 1 / 4 rho - 1 / 4 Pi_N m_0 \( Z \) rho_0 + 1 / 8 delta_0 \| K \|^2 +
     O \( e^(- c_N r) \) \,\
b_N \( s \) & = p \( s \) + 2 - delta_0 \( p \( s \) + 1 \) . $ <eq:fc-tail-Z-equation>]
  All fixed-order local derivatives of the exponential error are controlled.
    The right side is $O \( r^(- 3 - delta) \)$ on the bounded solution range, even before the penalty disappears.
    Define the increasing smooth function
  $ Phi_N \( 0 \) = 0 \, wide Phi'_N \( s \) = exp #h(-0.16667em) (integral_0^s b_N \( v \) thin d v) . $
  Its derivative is bounded above and below on that range, and $Delta_g Phi_N \( Z \) = O \( r^(- 3 - delta) \)$.
    For $0 < delta' < delta < 1$,
  $ - Delta_g \( r^(- 1) - r^(- 1 - delta') \) = delta' \( 1 + delta' \) r^(- 3 - delta') + O \( r^(- 4) \) gt.eq
    c r^(- 3 - delta') $
  at large radius. Comparison of both signs, with zero outer values, gives $\| Phi_N \( Z \) \| lt.eq
    C_N r^(- 1)$ uniformly in truncation, and hence $Z = O \( r^(- 1) \)$.
  In the limit, sufficiently far out $t > - epsilon.alt + N^(- 1)$, so the penalty vanishes.
    Rescale comparable-radius annuli to unit size. The equation for $Phi_N \( Z \)$ has a bounded rescaled source
    and uniform smooth metric coefficients. Local $W^(2 \, p)$ estimates first give the scaled gradient bound.
    Its source is a smooth function of $Z$ times the symbol weights $rho$, $\| K \|^2$,
    plus the controlled exponential errors. Schauder estimates then give two symbol derivatives, proving (6.20).
    Since $L \( 0 \) = 1$, $u = 1 + O \( r^(- 1) \)$, and the graph and drift errors are exponential,
    the first assertion of (6.21) follows. The divergence $u Xi$ is integrable:
    its polynomial tail terms are $O \( r^(- 4) \)$ and $O \( r^(- 3 - delta) \)$,
    and its remaining terms are exponential. The divergence theorem on annuli proves the flux limit. ◻
]

=== 6.5 Curvature, full cut areas, and the mass loss <curvature-full-cut-areas-and-the-mass-loss>

#thm([Lemma 6.13.])[
  (The comparison metric).  #emph[The solution of Proposition 64 defines
$ hat(g) = e^(4 t) \( g + l^2 d f^2 \) $

 as a smooth complete metric on $Omega$, with $R_(hat(g)) gt.eq
   0$ and strictly negative mean curvature on $B$ in the normal into $Omega$. Its end satisfies
$ hat(g) - delta_(upright("Eucl")) = O_2 \( r^(- 1) \) \, wide R_(hat(g)) = O \( r^(- 3 - delta) \) \, wide
  E_(hat(g)) = E_g - frac(cal(F)_N, 8 pi) . $

]
] <lem:fc-comparison-metric>

#proof[
  At the physical endpoint $F = h + C$ and $w \( h \) = tau a sigma$. The scalar identity (4.24) therefore gives
  $ 1 / 2 e^(4 t) R_(hat(g)) =  & 8 pi \( mu + J \( w \) \) + \( 1 - delta_0 \) cal(T) + \( 1 - delta_0 \) tau a sigma\
 & + w \( C \) - \( h + C \) "tr" K - rho + m_0 \( t \) Pi_N \( rho_0 + v rho_1 \) . $
  The physical height range from Lemma 54, $\| w \| lt.eq 1$, and the preparation inequality for $C \,
    rho$ make this nonnegative. That preparation is needed only on the compact support of $"tr" K$ and $d C$;
    on the rest of the end it reduces to $rho lt.eq 8 pi \( mu - \| J \| \)$.
    The boundary identity and prescribed flux give $H + 4 partial_nu t = - N_B$. Since $f$ is face-constant,
  $ H_(hat(g)) = e^(- 2 t) sqrt(d) thin \( H + 4 partial_nu t \) = - e^(- 2 t) sqrt(d) thin N_B < 0 . $
  The pointwise inequality $hat(g) gt.eq e^(- 4 epsilon.alt) g$ proves completeness,
    with the compact smooth boundary included.
  Proposition 64 gives the metric decay. The conformal formula and exponential graph error give
  $ R_(hat(g)) = e^(- 4 t) \( R_g - 8 Delta_g t - 8 \| d t \|^2 \) + O \( e^(- c_N r) \) . $
  Equation (6.23) gives $Delta_g t = O \( r^(- 3 - delta) \)$, proving the required scalar falloff.
    Exponential graph errors have zero ADM contribution. The conformal ADM formula and $t = O_2 \( r^(- 1) \)$ give
  $ E_(hat(g)) = E_g - frac(1, 2 pi) lim_(r arrow.r oo) integral_(S_r) partial_(nu_g) t thin d A_g . $
  Replacing the normal and area by their Euclidean versions costs $o \( 1 \)$,
    and the $O \( r^(- 3) \)$ error in (6.21) has vanishing sphere integral.
    This gives the stated normalization and sign. ◻
]

#thm([Lemma 6.14.])[
  (Flux loss).  #emph[For fixed $epsilon.alt > 0$,
$ cal(F)_N gt.eq - epsilon_N \, wide 0 lt.eq epsilon_N lt.eq P_N \( ell + ell^2 \/ tau \) arrow.r 0 . $

 The constants in this estimate do not use the fixed-$N$ classical regularity constants.]
] <lem:fc-flux-loss>

#proof[
  The inward normal on $B$ gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ cal(F)_N = integral_Omega u Xi thin d V_g + integral_B V_nu thin d A_g . $ <eq:fc-integrated-flux>]
  Both integrals are finite by the end estimates. At a physical face, $V_nu \/ u = - \( 1 - a \) H - N_B d gt.eq -
    C d$. The signed slopes yield $sqrt(d) lt.eq C tau \/ ell$,
    so its negative integral is at most $C \( tau \/ ell \) integral_B L$.
    Apply (6.7) with a constant test and a fixed collar cutoff.
    On those collars $rho$ has a fixed positive minimum, and therefore this loss is at most
  $ P_N tau / ell integral_Omega u \( rho + delta_0 cal(T) \) thin d V_g . $
  For $N$ large it absorbs in one quarter of those positive terms.
  On the penalty band $l \, L asymp ell$, with constants independent of $N$, and the exact definitions give
  $ u lt.eq C \( ell + ell^2 sigma \) \, wide u v lt.eq C ell^2 sigma \, wide u a sigma =
    e^(2 t) l^2 sigma^2 gt.eq c ell^2 sigma^2 . $
  Thus, increasing only a polynomial constant,
  $ u m_0 Pi_N \( rho_0 + v rho_1 \) & lt.eq P_N \[ ell rho_0 + ell^2 sigma \( rho_0 + rho_1 \) \]\
 & lt.eq 1 / 4 delta_0 tau u a sigma + P_N [ell rho_0 + ell^2 / tau \( rho_0^2 + rho_1^2 \)] . $
  The three remaining weight integrals are finite. Their end orders are $r^(- 3 - delta)$, $r^(- 6 - 2 delta)$,
    and $r^(- 4 gamma)$, respectively, with $4 gamma > 3$. After inserting both estimates in (6.24),
    positive fractions of all three bulk terms remain. Dropping them proves the bound.
    Finally $ell^2 \/ tau = tau \/ ell = ell^(1 \/ 2)$, which decays faster than every fixed polynomial in $N$. ◻
]

#thm([Theorem 6.15.])[
  (Completion of the flat deformation estimate).  #emph[The flat exterior of Theorem 25 satisfies
$ E_g gt.eq sqrt(frac(A_(*), 16 pi)) . $

]
] <thm:fc-mass-completion>

#proof[
  For each fixed large $N$, the metric of Lemma 65 has a strictly mean-negative inner boundary and strictly
    mean-positive large coordinate spheres. Apply the three-dimensional trapped-region theorem with zero tensor to
    obtain its full outermost minimal enclosing frontier. It is a compact smooth surface, possibly disconnected,
    and bounds the connected exterior containing the end. It is outer area-minimizing:
    its minimizing enclosure exists by the direct method between the fixed barriers;
    minimal-obstacle regularity and the maximum principle make that enclosure a smooth minimal bounding frontier.
    A strict enlargement would contradict maximality of the full minimal trapped region.
    These are also the outermost/outer-minimizing horizon conventions in the Riemannian Penrose Theorem
    #cite(label("bray2001")) #cite(label("braylee2009")).
  Let this full cut be $Gamma_N$. Its exterior is complete with boundary,
    has one AF end of order one through two derivatives, and has nonnegative scalar curvature with pointwise
    falloff $O \( r^(- 3 - delta) \)$. These satisfy the boundary version of the Riemannian Penrose Theorem
    #cite(label("braylee2009")) Theorem 1.4; no extension across the original boundary is needed.
    Every cut in the prepared exterior is a full enclosing cut of the original flat obstacle.
    The pointwise metric inequality and the two-dimensional area scaling therefore give
  $ \| Gamma_N \|_(hat(g)) gt.eq e^(- 4 epsilon.alt) \| Gamma_N \|_g gt.eq e^(- 4 epsilon.alt) A_(*) . $
  Lemmas 65 and 66 imply
  $ E_g + frac(epsilon_N, 8 pi) gt.eq E_(hat(g)) gt.eq sqrt(frac(\| Gamma_N \|_(hat(g)), 16 pi)) gt.eq
    e^(- 2 epsilon.alt) sqrt(frac(A_(*), 16 pi)) . $
  First the end was exhausted at fixed $N$. Now let $N arrow.r oo$ with $epsilon.alt$ fixed,
    and then let $epsilon.alt arrow.b 0$. Only numerical estimates are passed to the last two limits;
    no smooth limit of the comparison metrics as $N arrow.r oo$ is used. This completes Theorem 25. ◻
]

== 7 Removal of the second fundamental form on an asymptotically hyperbolic end <sec:ah-deformation>

All norms and differentiated estimates in this section are measured in the hyperbolic reference metric on balls of
  fixed hyperbolic radius, unless another convention is stated.
  Thus $O_j \( r^(- a) \)$ includes covariant derivatives through order $j$, without a loss of a power of $r$.
  The letter $r$ is extended to a positive smooth function on the compact part of the manifold.
  An enclosing cut always means the entire intrinsic boundary of a connected exterior containing the designated end.

#thm([Theorem 7.1.])[
  (The time component inequality).  #emph[Let $\( Omega \, g \, K \)$ satisfy the regularity, completeness,
    one-end, dominant energy, weighted integrability, and future boundary hypotheses of the initial-data class, with
$ g - b in C_(tau_(upright("data")))^(2 \, alpha) \, wide K in C_(tau_(upright("data")))^(1 \, alpha) \, wide 3 /
  2 < tau_(upright("data")) < 3 . $

 Suppose the four metric fluxes in the designated chart are finite.
   There is no causal or sign assumption on their vector in this theorem. Then
#[#set math.equation(numbering: n => "(7.1)")
 $ p_0 \( g \) gt.eq sqrt(frac(A_min \( S \; g \), 16 pi)) (1 + frac(A_min \( S \; g \), 4 pi)) .
   $ <eq:ah-component-bound>]

 The tensor $K$ may have arbitrary trace, and the boundary may have arbitrarily many components.]
] <thm:ah-component>

We shall prove this by constructing comparison metrics with scalar curvature at least $- 6$.
  The time-symmetric case of Theorem 10, whose proof uses Theorem 25, will then apply in this same chart.
  The continuation and estimates below use the geometric and elliptic lemmas proved in the preceding sections.

=== 7.1 Strict approximation with improved tensor decay <subsec:ah-preparation>

Write

$ M = "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] = 8 pi J \, wide
  Q_g \( K \) = \( "tr"_g K \)^2 - \| K \|_g^2 \, wide M_d = 8 pi \( mu - \| J \|_g \) . $

Choose once and for all

#[#set math.equation(numbering: n => "(7.2)")
 $ 2 < kappa < 1 + sqrt(3) \, wide 3 / 2 < tau' < min { kappa \, tau_(upright("data")) } \, wide
   0 < delta < min { 1 \, 2 kappa - 4 \, 2 tau' - 3 } . $ <eq:ah-preparation-exponents>]

These choices are possible even when $tau_(upright("data"))$ is arbitrarily close to $3 \/ 2$.

#thm([Lemma 7.2.])[
  (Strict approximation).  #emph[There are smooth data $\( g_j \, K_j \)$ converging to $\( g \, K \)$ on compact
    sets, whose metric bilinear ratios converge uniformly to one, such that all four metric mass components converge and
#[#set math.equation(numbering: n => "(7.3)")
 $ & 8 pi \( mu_j - \| J_j \|_(g_j) \) gt.eq c_j \( 1 + r \)^(- 3 - delta) \, wide H_(g_j) + "tr"_T K_j < 0 \,\
 & g_j - b = O_oo \( r^(- kappa) \) \, wide K_j = O_oo \( r^(- kappa) \) \, wide R_(g_j) + 6 =
   O_oo \( r^(- 3 - delta) \) $ <eq:ah-prepared-data>]

 for positive constants $c_j$. In particular $A_min \( S \; g_j \) arrow.r A_min \( S \; g \)$.]
] <lem:ah-preparation>

#proof[
  Let $chi_R$ equal one on $r lt.eq R$ and zero on $r gt.eq 2 R$, with uniform differentiated bounds in $log r$.
    Interpolate the metric to $b$ by $q_R = b + chi_R \( g - b \)$,
    keeping the original metric on the compact part. Let $P = K - \( "tr"_g K \) g$.
    On the exterior of a fixed sufficiently large sphere $r = L$, solve
  #[#set math.equation(numbering: n => "(7.4)")
   $ \( Delta_(q_R) + "Ric"_(q_R) \) X_R = chi_R "div"_g P - "div"_(q_R) \( chi_R P \) \, wide X_R \|_(r = L) =
     0 \, wide X_R arrow.r 0 . $ <eq:ah-vector-corrector>]
  The vector Laplacian acts on one-forms. On this fixed exterior the Ricci endomorphism is bounded above by a
    negative multiple of the identity, uniformly for large $R$.
    The source has $C_(tau')^(0 \, alpha)$ norm $O \( R^(tau' - tau_(upright("data"))) \)$.
    Kato’s Inequality compares $\| X_R \|$ with the scalar operator $- Delta + 2 + o \( 1 \)$. For a radial power,
  $ \( - Delta_b + 2 \) r^(- a) = #scale(x: 120%, y: 120%)[\(] 2 + 2 a - a^2 +
    O \( r^(- 2) \) #scale(x: 120%, y: 120%)[\)] r^(- a) . $
  The coefficient is positive for $a < 1 + sqrt(3)$, so $r^(- tau')$ is a common supersolution after enlarging $L$.
  For clarity, existence in this argument follows on finite annuli from the coercivity of $- Delta -
    "Ric"$ with zero Dirichlet values. The maximum comparison just given and local boundary estimates are
    independent of the outer annulus radius. Dirichlet exhaustion, followed by local Schauder estimates, gives
  $ X_R = O_2 \( epsilon_R r^(- tau') \) \, wide epsilon_R = R^(tau' - tau_(upright("data"))) arrow.r 0 . $
  On $r > 2 R$ the metric is exactly $b$ and the source vanishes.
    The same comparison with $r^(- kappa)$, and differentiation on hyperbolic balls, gives $X_R =
    O_oo \( r^(- kappa) \)$ there, with constants allowed to depend on $R$.
  Choose a fixed cutoff equal to zero near $r = L$ and one beyond a slightly larger sphere, and add the cutoff of
  $ 2 "sym" nabla X_R - \( "div" X_R \) q_R $
  to $chi_R P$. Denote the resulting stress by $P_R$, and let $K_R$ be its inverse trace reversal in $q_R$. The identity
  $ "div"_(q_R) #scale(x: 120%, y: 120%)[\(] 2 "sym" nabla X_R - \( "div" X_R \) q_R
    #scale(x: 120%, y: 120%)[\)] = \( Delta_(q_R) + "Ric"_(q_R) \) X_R $
  shows that
  $ "div"_(q_R) P_R = chi_R "div"_g P + E_R \, $
  where $E_R$ is supported in a fixed annulus and tends to zero in every needed compact norm.
    The data are unchanged near $S$. The family $K_R$ is bounded by a common smooth weight of order $- tau'$,
    and its exact tail has order $- kappa$.
  Here is the error estimate needed for the energy condition.
    Let $w_0 > 0$ be smooth and equal to $r^(- 3 - delta)$ on the tail. There is a number $e_R arrow.r 0$ such that
  #[#set math.equation(numbering: n => "(7.5)")
   $ chi_R \( R_g + 6 \) + Q_(q_R) \( K_R \) - 2 \| "div"_(q_R) P_R \|_(q_R) gt.eq - e_R w_0 . $ <eq:ah-cutoff-dec>]
  Indeed the expression with $Q_(q_R) \( K_R \)$ replaced by $chi_R Q_g \( K \)$, and with the last norm in $g$,
    is nonnegative by the original dominant energy condition.
    Its errors are the fixed-annulus term $E_R$, products involving $X_R$ and $K$,
    the quadratic cutoff error $\( chi_R^2 - chi_R \) Q_g \( K \)$, and the change of norm between $g$ and $q_R$.
    The noncompact terms are bounded by a coefficient tending to zero times $r^(- 2 tau')$.
    Since $2 tau' > 3 + delta$, these are $o \( 1 \) w_0$. The fixed-annulus terms have the same conclusion by
    compact positivity of $w_0$. This argument uses no extra pointwise decay of the original density $mu$.
  Let $D gt.eq \| K_R \|_(q_R)$ be a common smooth positive weight of order $- tau'$,
    and let $w_2 > 0$ be a smooth weight equal to $r^(- tau')$ far out.
    Choose $eta_R arrow.r 0$ sufficiently slowly that $e_R + epsilon_R = o \( eta_R \)$. Solve
  #[#set math.equation(numbering: n => "(7.6)")
   $ \( - Delta_(q_R) + 3 \) v_R =  & 1 / 8 { chi_R \( R_g + 6 \) - \( R_(q_R) + 6 \) }\
 & + D sqrt(\| d v_R \|^2 + eta_R^2 w_2^2) + eta_R w_0 \,\
partial_nu v_R \|_S =  & - eta_R \, wide v_R arrow.r 0 . $ <eq:ah-conformal-corrector>]
  The scalar forcing satisfies
  $ ∥1 / 8 { chi_R \( R_g + 6 \) - \( R_(q_R) + 6 \) }∥_(C_(tau')^(0 \, alpha)) lt.eq C epsilon_R = o \( eta_R \) \, $
  by the differentiated cutoff estimates above. Here and below $nu$ at an inner boundary points into the exterior.
    This is a scalar equation with a bounded first-order drift and a positive zeroth-order coefficient.
    A complete continuation argument is as follows. On a finite truncation impose zero outer values and multiply
    the right side and the inner normal derivative by a parameter $a in \[ 0 \, 1 \]$.
    Subtract $a eta_R$ times a fixed collar function with normal derivative $- 1$;
    the remaining function has homogeneous Neumann data. At its extrema the gradient term is bounded by the fixed
    collar derivatives and the regularizing source. The Neumann maximum principle therefore gives a uniform
    $O \( eta_R \)$ bound. On the end, $r^(- tau')$ is a supersolution for the equation with any of its bounded
    decaying drifts, because $3 + 2 tau' - \( tau' \)^2 > 0$. Hence
  $ v_R = O_2 \( eta_R r^(- tau') \) . $
  The estimates of Lemma 119, first absorbing the bounded first-order term by interpolation and then applying the
    one-sided Schauder estimate, give closedness of continuation.
    Its linearization has positive zeroth order and the same mixed boundary conditions,
    so the maximum principle and linear elliptic theory give openness.
    Exhaustion now gives the displayed solution. On the exact tail the sources decay faster than $r^(- kappa)$;
    comparison improves the bound to that power. The regularizer $w_2$ bounds all differentiated coefficients on
    rescaled balls. Bootstrap gives the stated estimates of all orders at fixed $R$.
  Set $g'_R = e^(4 v_R) q_R$, $K'_R = e^(2 v_R) K_R$. Direct conformal calculation gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ 8 pi J'_R & = e^(- 2 v_R) { thin "div"_(q_R) P_R + 4 K_R \( nabla v_R \, dot.op \) thin } \,\
e^(4 v_R) \( R_(g'_R) + 6 \) & = chi_R \( R_g + 6 \) + 8 D sqrt(\| d v_R \|^2 + eta_R^2 w_2^2) + 8 eta_R w_0 +
  6 \( e^(4 v_R) - 1 - 4 v_R \) - 8 \| d v_R \|^2 . $ <eq:ah-conformal-momentum>]
  The norm in the first equation contributes another factor $e^(- 2 v_R)$.
    Equations (7.5)–(7.7), $D gt.eq \| K_R \|$, and $2 tau' > 3 +
    delta$ imply strict dominant energy with a positive multiple of $eta_R w_0$. At the boundary
  $ theta_(+) \( g'_R \, K'_R \) = e^(- 2 v_R) { theta_(+) \( g \, K \) + 4 partial_nu v_R } =
    e^(- 2 v_R) { theta_(+) \( g \, K \) - 4 eta_R } < 0 . $
  Moreover, the four terms following $chi_R \( R_g + 6 \)$ in Equation (7.7) are $O \( eta_R \) w_0$.
  We include the mass argument because uniform metric convergence alone would not prove it.
    The original constraint and the weighted integrability assumption imply $integral V_0 \| R_g +
    6 \| thin d V_g < oo$. For any static potential $V_a$, its scalar-linearization flux has divergence $V_a D
    R_b \( g - b \)$. The difference between $D R_b \( g - b \)$ and $R_g +
    6$ is quadratic in the metric error and its first two derivatives. Its weighted radial integral is bounded by
  $ C integral^oo r^(2 - 2 tau') thin d r < oo . $
  Equation (7.7) makes the curvature tail uniformly small, and the quadratic error has the same uniform integrable
    bound. Compare the fluxes on a fixed large sphere, where the data converge,
    and then send that sphere to infinity. Since $\| V_a \| + \| d V_a \| lt.eq C V_0$,
    this proves convergence of all four components. It also proves their existence for each approximating metric.
    The improved tail bounds and the constraints give all the weighted integrability requirements for the new
    data. If the original data have only the stated finite regularity,
    the constructed data are already smooth outside a compact set:
    there the vector equation is homogeneous on $b$, and all coefficients and sources of the scalar equation are
    smooth after bootstrap. On the remaining compact set, smooth the metric in $C^2$ and the tensor in $C^1$,
    with a cutoff leaving that smooth tail unchanged. The strict energy margin and strict boundary expansion have
    positive minima in absolute value on their respective compact sets.
    Continuity of scalar curvature in $C^2$, momentum divergence in $C^1$,
    and boundary expansion in these norms therefore preserves both inequalities if the smoothing error is
    sufficiently small. Choose that error to tend to zero with $R$.
    This gives smooth approximants with unchanged asymptotic estimates and mass components.
  Finally, uniform bilinear ratio convergence bounds every cut area between factors tending to one,
    and therefore bounds their infima by the same factors. ◻
]

It suffices henceforth to prove Theorem 68 for fixed data satisfying Equation (7.3).
  All constants from this preparation are fixed before any parameter of the following deformation is chosen.

=== 7.2 The compact domain, the lapse, and the profiles <subsec:ah-profiles>

Coordinate spheres have both expansions tending to $2$. The maximum-radius comparison therefore confines all
  bounding regions at negative thresholds near zero to a common compact set.
  Apply Lemmas 26, 27, and 28 as follows. First take the full black region at a fixed right-continuity threshold
  $c_b < 0$, using the given boundary as required inner boundary.
  In its complement take the full white region for $- K$, at a right-continuity threshold $c_w < 0$;
  the reversed black faces are strict outer barriers, and this second region may be empty.
  Retain the closed component toward infinity after deleting both regions.
  Its boundary consists of entire black and white faces. Every full cut in this smaller exterior is a full cut in
  the original one.

The compact geometric lemmas apply without a cosmological or energy assumption:
  their hypotheses are smooth compact geometry, the stated strict outer barriers,
  and the tensor threshold shift $K mapsto K - c g \/ 2$. Their generalized-support conclusion is Lemma 31;
  it will be used below only on fixed compact sets with those same barrier conventions.

Choose a smooth compactly supported offset $C$, with $C_w lt.eq C lt.eq C_b$, such that on the outward leaf collars

$ C = C_b - k_B s quad upright("on black collars") \, wide C = C_w + k_B s quad upright("on white collars") \, $

where $C_b > 0 > C_w$ and $k_B > 0$. Set

#[#set math.equation(numbering: n => "(7.8)")
 $ b_(-) = c_b - C_b < 0 \, wide b_(+) = - c_w - C_w > 0 . $ <eq:ah-face-heights>]

The thresholds and these offsets will be made small in the order specified in Lemma 77.

#thm([Lemma 7.3.])[
  (A spatial lapse).  #emph[There is a positive smooth function $lambda$,
    constant on a fixed large compact region containing all boundary collars,
    and equal to $sqrt(A_0^2 + r^2)$ far out, such that, with $s = d log lambda$,
#[#set math.equation(numbering: n => "(7.9)")
 $ \| s \| lt.eq 1 \, wide E := frac(Delta lambda - "Hess" lambda \( w \, w \), lambda) + v \| s \|_(A_d)^2 lt.eq
   3 . $ <eq:ah-lapse-inequalities>]

 Here $w$ is any vector of length less than one, $v = \| w \|^2$, and $A_d = I - w ⊗ w$. On the end, also
$ E lt.eq E_0 := Delta lambda \/ lambda lt.eq 3 \, wide E_0 = 3 + O \( r^(- 2) \) . $

 A fixed smooth positive $rho$, radial of order $- 3 - delta$ on the end, may be chosen with $10 rho < M_d$,
   and the lapse can be chosen so that $\| s \| \| K \| lt.eq
   c_(*) sqrt(rho)$ for any prescribed sufficiently small $c_(*) > 0$.]
] <lem:ah-lapse>

#proof[
  First smoothly replace $r^2$ by a constant on a sufficiently large compact set.
    On a fixed compact region, taking $A_0$ large makes all derivatives of the logarithm of the resulting square
    root small, proving Equation (7.9) there. For the exact hyperbolic metric on the tail,
    the tangential and radial Hessian eigenvalues divided by $lambda$ are
  $ frac(1 + r^2, A_0^2 + r^2) \, wide 1 - frac(A_0^4 - A_0^2, \( A_0^2 + r^2 \)^2) . $
  Each is at least
  $ \| d log lambda \|_b^2 = frac(r^2 \( 1 + r^2 \), \( A_0^2 + r^2 \)^2) . $
  Their gaps are positive multiples of $r^(- 2)$ for $A_0 > 1$. Also
  $ frac(Delta_b lambda, lambda) - 3 = - frac(\( A_0^2 - 1 \) \( 3 A_0^2 + 2 r^2 \), \( A_0^2 + r^2 \)^2) . $
  The errors from $g - b = O_2 \( r^(- kappa) \)$ are smaller than these gaps because $kappa > 2$.
    This proves the assertions after enlarging the fixed compact transition.
    The last smallness condition follows by making $s = 0$ throughout a sufficiently large compact set:
    on its complement $r^(- kappa) = o \( r^(- \( 3 + delta \) \/ 2) \)$. ◻
]

Choose $beta \, q$ with

#[#set math.equation(numbering: n => "(7.10)")
 $ 2 + delta \/ 2 < beta < min { 3 \, kappa } \, wide q > max { 3 + delta \, 2 beta } . $ <eq:ah-beta-q>]

The constants $delta_0 > 0$, $P_0$, and $B_0$ below are chosen successively in the floor and absorption arguments.
  For a large integer $N$, put

#[#set math.equation(numbering: n => "(7.11)")
 $ epsilon.alt = frac(B_0 log N, N) \, wide ell = N^(- B_0) \, wide tau = ell^(5 \/ 4) \, wide R =
   N^a . $ <eq:ah-profiles>]

Choose the fixed exponent $a$ so large that

#[#set math.equation(numbering: n => "(7.12)")
 $ a \( 2 beta - 4 - delta \) > 5 / 4 B_0 \, wide a \( q - 1 \) + 1 > 5 / 4 B_0 . $ <eq:ah-R-conditions>]

Let $A_R = 1$ before $R$, let $A_R asymp 1 + r \/ R$, and let it be proportional to $r$ beyond $2 R$.
  Its logarithmic derivative in $log r$ is nondecreasing from zero to one.
  Let $n = N$ on a fixed compact region, let $n asymp N \( 1 + r \)^q$ up to $R$,
  and cap it smoothly to $n_oo asymp N R^q$ past $2 R$. The positive-order derivatives of $log
  n$ are uniformly bounded. The implicit comparison constants may depend on the fixed inner radius where $n$
  begins to increase. Equations (7.12) imply

#[#set math.equation(numbering: n => "(7.13)")
 $ R^(4 + delta - 2 beta) / tau arrow.r 0 \, wide frac(R, n_oo tau) arrow.r 0 . $ <eq:ah-small-ratios>]

All these profiles are held fixed while an independent outer truncation radius tends to infinity.

Let $p_(*)$ be smooth and nonincreasing, equal to one on $\( - oo \, 0 \]$ and zero on $\[ 1 \, oo \)$. Define

$ l_0 \( t \, x \) = exp #h(-0.16667em) (integral_0^(n \( x \) t) p_(*) \( z \) thin d z) \, wide l = lambda l_0 \,\
p = partial_t log l_0 = n p_(*) \( n t \) \, wide A = d_x log l = s + p t thin d log n . $

Spatial derivatives carrying the subscript $x$ keep $t$ fixed.
  For $t lt.eq 0$, $l_0 = e^(n t)$; for $t gt.eq 1 \/ n$, $l_0$ is a constant independent of $n$.

=== 7.3 Variables and the physical equations <subsec:ah-equations>

For functions $f \, t$, define

$ sigma = \| d f \| \, quad D = 1 + l^2 sigma^2 \, quad d = D^(- 1) \, quad w = frac(l nabla f, sqrt(D)) = a e \,
  quad a = \| w \| \, quad v = a^2 \, quad e = nabla f \/ sigma \,\
A_j = I + \( j - 1 \) e ⊗ e \, wide chi = frac(4 d, 4 + p v) \, wide H^f = frac(l "Hess" f, sqrt(D)) \,\
S = K + H^f + w ⊗ A + A ⊗ w \, wide h = tau A_R f \, wide L = e^(2 t) l_0 \, quad u = lambda L sqrt(D) \, quad Z =
  t + 1 / 8 log D . $

All actual coefficients extend smoothly across $sigma = 0$; for example $A_chi =
  I - \( 4 + p \) w ⊗ w \/ \( 4 + p v \)$. For fixed $x \, d f$,
  the derivative $partial Z \/ partial t$ is $\( 4 + p v \) \/ 4 > 0$, and the map is onto $bb(R)$.
  Thus $t = t \( x \, Z \, d f \)$ is defined without imposing a floor.

Decompose $S$ into its transverse block $P$, mixed block $M$, and axial entry $q_1$.
  Write $x_t = partial_e t$ and $y = nabla_perp t$. In expressions involving the trace equation, $F =
  "tr"_(A_chi) S$, so $"tr" P = F - chi q_1$. Put

#[#set math.equation(numbering: n => "(7.14)")
 $ cal(T) =  & 1 / 2 \| P^(upright("tf")) \|^2 + \| M + \( p + 1 \) a y \|^2 + \[ 4 \( p + 1 \) - v \] \| y \|^2\
 & + 4 \( p + 1 \) d (x_t + frac(chi a q_1, 4 d))^2 + 3 / 4 (F - frac(chi q_1, 3))^2 +
   frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) q_1^2 . $ <eq:ah-T>]

Let $d_0 \( n t \)$ equal $1 \/ 2$ for $n t gt.eq 0$, equal a fixed sufficiently small $delta_0 > 0$ for $n t
  lt.eq - 1$, and lie between those values. Let $rho_0 > 0$ have order $- 3 - delta$, and let $m_0 \( t \, x \) =
  m \( n \( x \) \( t + epsilon.alt \) \)$, where $m = 1$ on $\( - oo \, 0 \]$, $m = 0$ on $\[ 1 \, oo \)$,
  and $0 lt.eq m lt.eq 1$. The physical equations are

#[#set math.equation(numbering: n => "(7.15)")
 $ "tr"_(A_chi) S & = F = h + C \,\
"div" V & = u Xi \, wide V = u A_chi { 4 nabla Z + K \( w \, dot.op \) + A \( w \) w } \,\
Xi & = 3 \( e^(4 t) - 1 \) + 4 chevron.l A \, d t chevron.r_(A_d) + d_0 \( cal(T) + tau A_R a sigma \) + rho -
  m_0 n^(P_0) \( rho_0 + v \) . $ <eq:ah-system>]

On black faces impose $h = b_(-)$, on white faces $h = b_(+)$, and on every inner face impose

#[#set math.equation(numbering: n => "(7.16)")
 $ V_nu / u = cal(B) := - H + w_nu \( F - P_B \) - N_B d \, wide P_B = "tr"_T K \, wide N_B > 1 +
   sup \| H \| . $ <eq:ah-inner-flux>]

On an outer truncation sphere impose $f = Z = 0$.

The comparison metrics are

$ macron(g) = g + l^2 d f^2 \, wide hat(g) = e^(4 t) macron(g) . $

The exact identity underlying the equations is

#[#set math.equation(numbering: n => "(7.17)")
 $ 1 / 2 e^(4 t) \( R_(hat(g)) + 6 \) & = 8 pi \( mu + J \( w \) \) + 3 \( e^(4 t) - 1 \) + 4 chevron.l A \,
   d t chevron.r_(A_d) + cal(T)\
 & quad + w \( F \) - F "tr" K - u^(- 1) "div" V . $ <eq:ah-curvature>]

Its full derivation, together with the weighted primitive and the metric flux normalization, is given next.

=== 7.4 Exact identities and the metric mass flux <sec:ah-algebra>

We give the differential identities used in the deformation,
  including their dependence on the spatially varying lapse profile.
  The argument in this subsection is local until the asymptotic assumptions in Proposition 74 are imposed.
  In particular, none of the identities requires a solution of the deformation equations to have been constructed
  in advance.

===== 7.4.1 Notation. <notation.>

All gradients, contractions, and divergences in the differential identities below refer to $g$.
  We identify vectors and covectors using $g$ when they occur in the same formula.
  Let $t \, f$ be smooth, let $l \( t \, x \) > 0$, and write

$ p = partial_t log l \, wide A = upright(d)_x log l \, wide B = upright(d) log l = A + p thin upright(d) t . $

Here $upright(d)_x$ holds $t$ fixed, whereas $upright(d)$ differentiates the composition $x mapsto
  l \( t \( x \) \, x \)$. Use $l = lambda l_0$ from Section 7.2 and $L = e^(2 t) l_0$ from Section 7.3. Set

$ D = 1 + l^2 \| upright(d) f \|^2 \, wide d = D^(- 1) \, wide w = frac(l nabla f, sqrt(D)) \, wide
  v = \| w \|^2 = 1 - d \, wide a = sqrt(v) \,\
H^f = frac(l nabla^2 f, sqrt(D)) \, wide overline(g) = g + l^2 upright(d) f ⊗ upright(d) f \, wide hat(g) =
  e^(4 t) overline(g) \,\
U = l sqrt(D) \, wide u = e^(2 t) U = lambda L sqrt(D) \, wide Z = t + 1 / 8 log D . $

At a point where $a > 0$, put $e = w \/ a$, and define

$ A_j = I + \( j - 1 \) e ⊗ e \, wide chi = frac(4 d, 4 + p v) \, wide S = K + H^f + w ⊗ A + A ⊗ w \, wide F =
  "tr"_(A_chi) S . $

Thus $A_d = I - w ⊗ w$, which is the inverse of $overline(g)$ relative to $g$.
  We assume $p gt.eq 0$, as holds for the profiles used here.
  The formulas involving $A_chi$ extend smoothly across $a = 0$, since

$ A_chi = I - frac(p + 4, 4 + p v) thin w ⊗ w . $

For a symmetric tensor $T$, let

$ p_T = T - \( "tr"_g T \) g \, wide \[ T_1 \, T_2 \] = chevron.l T_1 \,
  T_2 chevron.r - \( "tr"_g T_1 \) \( "tr"_g T_2 \) . $

We use the constraint normalization

$ 16 pi mu = R_g + 6 + \( "tr"_g K \)^2 - \| K \|^2 \, wide 8 pi J = "div"_g p_K . $

Decompose $S$ into its $e^perp$-block $P$, mixed block $M$, and axial entry $q_1 = S \( e \, e \)$, and put $x_t =
  partial_e t$, $y = \( upright(d) t \)_(e^perp)$. The quadratic form of Equation (7.14) is

#[#set math.equation(numbering: n => "(7.18)")
 $ cal(T) =  & 1 / 2 \| P^(upright("tf")) \|^2 + \| M + \( p + 1 \) a y \|^2 + \[ 4 \( p + 1 \) - v \] \| y \|^2\
 & + 4 \( p + 1 \) d (x_t + frac(chi a q_1, 4 d))^2 + 3 / 4 (F - frac(chi q_1, 3))^2 +
   frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) q_1^2 . $ <eq:ah-alg-T>]

Although this expression uses an axis where $a > 0$, its sum is direction independent at $a = 0$,
  as will also follow from the coordinate-free expression in the proof below.

#thm([Proposition 7.4.])[
  (Curvature identity).  #emph[With the preceding definitions, put
#[#set math.equation(numbering: n => "(7.19)")
 $ V = u A_chi #scale(x: 120%, y: 120%)[\(] 4 nabla Z + K \( w \, dot.op \)^sharp +
   A \( w \) w #scale(x: 120%, y: 120%)[\)] . $ <eq:ah-alg-V>]

 Then the following identity holds pointwise:
#[#set math.equation(numbering: n => "(7.20)")
 $ 1 / 2 e^(4 t) \( R_(hat(g)) + 6 \) =  & 8 pi #scale(x: 120%, y: 120%)[\(] mu +
   J \( w \) #scale(x: 120%, y: 120%)[\)] + 3 \( e^(4 t) - 1 \) + 4 chevron.l A \, upright(d) t chevron.r_(A_d) +
   cal(T)\
 & + w \( F \) - F "tr"_g K - u^(- 1) "div"_g V . $ <eq:ah-alg-curvature-identity>]

 Here $F$ denotes the actual trace $"tr"_(A_chi) S$; therefore the identity applies to any prescribed trace
   equation by substituting that prescription for $F$.]
] <prop:ah-alg-curvature>

#proof[
  We first derive the graph identity, keeping the full spatial dependence of $l$.
    On a product with coordinate $s$, consider the stationary Lorentz metric
  $ upright(bold(g)) = - l^2 \( upright(d) s - upright(d) f \)^2 + overline(g) = - l^2 upright(d) s^2 +
    2 l^2 upright(d) s thin upright(d) f + g . $
  The $s$-slices have induced metric $g$, shift $beta = l^2 nabla f = U w$, and lapse $U = l sqrt(D)$.
    For the future normal $U^(- 1) \( partial_s - beta \)$, with the convention $k \( X \, Y \) =
    upright(bold(g)) \( upright(bold(nabla))_X n \, Y \)$, stationarity gives
  $ k = - frac(1, 2 U) cal(L)_beta g = - H^f - w ⊗ B - B ⊗ w . $
  The contracted Gauss equation and the normal Ricci equation for these stationary slices give
  #[#set math.equation(numbering: n => "(7.21)")
   $ U R_(upright(bold(g))) = U #scale(x: 120%, y: 120%)[\(] R_g + \[ k \, k \] #scale(x: 120%, y: 120%)[\)] -
     2 "div"_g #scale(x: 120%, y: 120%)[\(] nabla U + \( "tr"_g k \) beta #scale(x: 120%, y: 120%)[\)] .
     $ <eq:ah-alg-stationary>]
  For completeness, this sign can be fixed directly by combining
  $ R_(upright(bold(g))) = R_g + \( "tr" k \)^2 - \| k \|^2 - 2 "Ric"_(upright(bold(g))) \( n \, n \) $
  with the normal expansion identity
  $ "Ric"_(upright(bold(g))) \( n \, n \) = - n \( "tr" k \) - \| k \|^2 + U^(- 1) Delta_g U . $
  Indeed $n \( "tr" k \) = - U^(- 1) beta \( "tr" k \)$ by stationarity, and $"div"_g beta = - U "tr"_g k$.
    Substitution is exactly Equation (7.21).
  In the coordinate $s - f$, the same spacetime metric is $- l^2 upright(d) \( s - f \)^2 + overline(g)$, so
  $ R_(upright(bold(g))) = R_(overline(g)) - 2 l^(- 1) overline(Delta l) . $
  The inverse metric and volume element of $overline(g)$ give
  $ overline(Delta l) = D^(- 1 \/ 2) "div"_g \( sqrt(D) thin A_d nabla l \) . $
  Differentiating $U$ also gives
  $ nabla U - U / l A_d nabla l = - k \( beta \, dot.op \)^sharp . $
  It follows from Equation (7.21) that
  $ U R_(overline(g)) = U #scale(x: 120%, y: 120%)[\(] R_g + \[ k \, k \] #scale(x: 120%, y: 120%)[\)] +
    2 "div"_g \( p_k beta \) . $
  Let
  $ Q = K - k = S + p \( w ⊗ upright(d) t + upright(d) t ⊗ w \) . $
  Since the symmetric part of $nabla beta$ is $- U k$,
  $ 2 / U "div"_g \( p_K beta \) & = 2 \( "div"_g p_K \) \( w \) + 2 / U chevron.l p_K \, nabla beta chevron.r\
 & = 16 pi J \( w \) - 2 \[ K \, k \] . $
  Using $p_k = p_K - p_Q$ and $R_g = 16 pi mu - 6 + \[ K \, K \]$, we obtain
  #[#set math.equation(numbering: n => "(7.22)")
   $ R_(overline(g)) = 16 pi #scale(x: 120%, y: 120%)[\(] mu + J \( w \) #scale(x: 120%, y: 120%)[\)] -
     6 + \[ Q \, Q \] - 2 U^(- 1) "div"_g \( U p_Q w \) . $ <eq:ah-alg-graph-curvature>]
  The conformal scalar-curvature formula in three dimensions is
  $ e^(4 t) R_(hat(g)) = R_(overline(g)) - 8 overline(Delta t) - 8 \| upright(d) t \|_(overline(g))^2 . $
  Replacing $U$ by $u = e^(2 t) U$ in the first divergence in Equation (7.22) contributes $2
    p_Q \( w \, upright(d) t \)$ after division by two. For the conformal Laplacian term,
    the equality $upright(d) log \( e^(2 t) l \) = \( p + 2 \) upright(d) t + A$ yields
  $ - 4 overline(Delta t) - 4 \| upright(d) t \|_(overline(g))^2 =  & - 4 u^(- 1) "div"_g \( u A_d nabla t \)\
 & + 4 \( p + 1 \) \| upright(d) t \|_(A_d)^2 + 4 chevron.l A \, upright(d) t chevron.r_(A_d) . $
  The cosmological terms are $- 3 + 3 e^(4 t)$. Consequently, if $V_(upright("pre")) =
    u \( p_Q w + 4 A_d nabla t \)$, then
  #[#set math.equation(numbering: n => "(7.23)")
   $ 1 / 2 e^(4 t) \( R_(hat(g)) + 6 \) =  & 8 pi #scale(x: 120%, y: 120%)[\(] mu +
     J \( w \) #scale(x: 120%, y: 120%)[\)] + 3 \( e^(4 t) - 1 \) + 4 chevron.l A \, upright(d) t chevron.r_(A_d)\
 & + 1 / 2 \[ Q \, Q \] + 2 p_Q \( w \, upright(d) t \) + 4 \( p + 1 \) \| upright(d) t \|_(A_d)^2 -
   u^(- 1) "div"_g V_(upright("pre")) . $ <eq:ah-alg-before-trace>]
  We next incorporate the trace equation into the flux. Direct differentiation gives
  #[#set math.equation(numbering: n => "(7.24)")
   $ nabla_i w_j = H_(i k)^f \( A_d \)_(k j) + d B_i w_j \, wide upright(d) log sqrt(D) = H^f \( w \, dot.op \) +
     v B . $ <eq:ah-alg-w-derivatives>]
  Since $u = e^(2 t) l sqrt(D)$, these identities imply
  #[#set math.equation(numbering: n => "(7.25)")
   $ u^(- 1) "div"_g \( u w \) = F + \( 1 - chi \) q_1 - "tr"_g K + 2 \( p + 1 \) a x_t . $ <eq:ah-alg-uw-divergence>]
  One way to see the cancellation of $A$ is to first obtain
  $ u^(- 1) "div"_g \( u w \) = "tr"_g H^f + 2 B \( w \) + 2 upright(d) t \( w \) \, $
  and then use $"tr"_g S = "tr"_g K + "tr"_g H^f + 2 A \( w \) = F + \( 1 - chi \) q_1$.
    Define $V = V_(upright("pre")) + u w F$. The divergence of the added term contributes
  $ w \( F \) + F #scale(x: 120%, y: 120%)[\[] F + \( 1 - chi \) q_1 - "tr"_g K +
    2 \( p + 1 \) a x_t #scale(x: 120%, y: 120%)[\]] $
  to Equation (7.23).
  We verify the resulting quadratic expression explicitly. Write $z = "tr"_(e^perp) P = F - chi q_1$.
    The three blocks of $Q$ are $P$, $M + p a y$, and $q_1 + 2 p a x_t$, so
  $ 1 / 2 \[ Q \, Q \] = 1 / 2 \| P^(upright("tf")) \|^2 - 1 / 4 z^2 + \| M + p a y \|^2 - z q_1 - 2 p a x_t z \, $
  and
  $ 2 p_Q \( w \, upright(d) t \) = - 2 a x_t z + 2 a chevron.l M \, y chevron.r + 2 p v \| y \|^2 . $
  Adding the terms in Equation (7.23) and Equation (7.25), and setting aside $- F "tr"_g K$, gives
  $ & 1 / 2 \| P^(upright("tf")) \|^2 + \| M + \( p + 1 \) a y \|^2 + \[ 4 \( p + 1 \) - v \] \| y \|^2\
 & quad + 4 \( p + 1 \) d x_t^2 + 2 \( p + 1 \) a chi x_t q_1 + 3 / 4 F^2 - chi / 2 F q_1 + (chi - chi^2 / 4) q_1^2 . $
  Completing the $x_t$-square leaves the coefficient
  $ chi - chi^2 / 4 - frac(\( p + 1 \) v chi^2, 4 d) = frac(12 d, \( 4 + p v \)^2) $
  in front of $q_1^2$. Completing the $F$-square then gives exactly Equation (7.18).
    Equivalently, $cal(T)$ is the coordinate-free expression
  $ 1 / 2 \[ Q \, Q \] + 2 p_Q \( w \, upright(d) t \) + 4 \( p + 1 \) \| upright(d) t \|_(A_d)^2 +
    F #scale(x: 120%, y: 120%)[\[] F + \( 1 - chi \) q_1 + 2 \( p + 1 \) a x_t #scale(x: 120%, y: 120%)[\]] . $
  The apparently directional terms in this last expression are smooth:
    $\( 1 - chi \) q_1 = \( \( p + 4 \) \/ \( 4 + p v \) \) S \( w \, w \)$ and $a x_t = upright(d) t \( w \)$.
    This proves the asserted extension through zero gradient.
  Finally, Equation (7.24) gives
  $ 4 thin upright(d) Z = \( 4 + p v \) upright(d) t + H^f \( w \, dot.op \) + v A . $
  Using $\( 1 - chi \) \( 4 + p v \) = \( p + 4 \) v$, the preceding definition of $V$ reduces to
  #[#set math.equation(numbering: n => "(7.26)")
   $ V / u = p_Q w + 4 A_d nabla t + w F = A_chi #scale(x: 120%, y: 120%)[\(] 4 nabla Z +
     K \( w \, dot.op \)^sharp + A \( w \) w #scale(x: 120%, y: 120%)[\)] . $ <eq:ah-alg-flux-reduction>]
  This proves both the stated flux formula and Equation (7.20). ◻
]

#thm([Proposition 7.5.])[
  (The spatial primitive).  #emph[Suppose the lapse is the profile defined in Section 7.2;
    in particular $l_0 \( t \, x \) = e^(n \( x \) t)$ for $t lt.eq 0$ and $l_0 \( 0 \, x \) = 1$. Define
#[#set math.equation(numbering: n => "(7.27)")
 $ G \( t \, x \) = lambda \( x \) integral_(- oo)^t L \( z \, x \) thin upright(d) z \, wide G_c \( x \) =
   G \( 0 \, x \) = frac(lambda \( x \), n \( x \) + 2) \,\
V_(*) = V - 4 sqrt(D) thin A_d nabla_x G + 4 nabla G_c . $ <eq:ah-alg-primitive-definitions>]

 Assume the scalar equation of Equation (7.15) is written as
$ u^(- 1) "div"_g V = 3 \( e^(4 t) - 1 \) + 4 chevron.l A \, upright(d) t chevron.r_(A_d) + cal(P) \, $

 where, for the physical system,
$ cal(P) = d_0 \( cal(T) + tau A_R a sigma \) + rho - m_0 n^(P_0) \( rho_0 + v \) \, wide sigma = \| upright(d) f \| . $

 Put
$ b_1 = frac(G, lambda L) \, wide s_G = upright(d)_x log G \, wide X_1 = x_t + frac(a q_1, 4 + p v) . $

 Then
#[#set math.equation(numbering: n => "(7.28)")
 $ u^(- 1) "div"_g V_(*) = cal(P) + cal(R) \, $ <eq:ah-alg-primitive-divergence>]

 where
#[#set math.equation(numbering: n => "(7.29)")
 $ cal(R) =  & 3 \( e^(4 t) - 1 \) - 4 b_1 E_G + frac(4 sqrt(d), lambda L) Delta_g G_c\
 & + 4 b_1 {s_G \( w \) #scale(x: 120%, y: 120%)[\(] F - "tr"_(A_d) K + p d a X_1 #scale(x: 120%, y: 120%)[\)] -
   p v chevron.l \( s_G \)_(e^perp) \, y chevron.r} \,\
E_G =  & frac(Delta_x G - nabla_x^2 G \( w \, w \), G) + v chevron.l s_G \,
  A chevron.r_(A_d) . $ <eq:ah-alg-primitive-residual>]

 Here $Delta_x G$ and $nabla_x^2 G$ differentiate $x mapsto G \( t \, x \)$ with $t$ fixed.
   If $lambda$ and $n$ are spatially constant on a boundary collar, then $V_(*) = V$ on that collar.]
] <prop:ah-alg-primitive>

#proof[
  For a fixed spatial function $phi.alt$, write
  $ cal(L) phi.alt = D^(- 1 \/ 2) "div"_g \( sqrt(D) thin A_d nabla phi.alt \) . $
  Differentiating $A_d = I - w ⊗ w$ with Equation (7.24) gives
  $ cal(L) phi.alt = "tr"_(A_d) nabla^2 phi.alt + frak(q) \( phi.alt \) \, $
  where the drift vector is
  #[#set math.equation(numbering: n => "(7.30)")
   $ frak(q) = v A_d \( A + p thin upright(d) t \)^sharp - w
     (F + \( d - chi \) q_1 - "tr"_(A_d) K + 2 d p a x_t) . $ <eq:ah-alg-primitive-drift>]
  To check every contraction, the coefficient of $nabla phi.alt$ before substituting $S$ is
  $ A_d nabla log sqrt(D) - \( "div"_g w \) w - nabla_w w = v A_d B^sharp -
    w #scale(x: 120%, y: 120%)[\(] "tr"_(A_d) H^f + 2 d B \( w \) #scale(x: 120%, y: 120%)[\)] . $
  Now
  $ "tr"_(A_d) H^f = F + \( d - chi \) q_1 - "tr"_(A_d) K - 2 d A \( w \) \, $
  which proves Equation (7.30).
  In applying this computation to $nabla_x G \( t \( x \) \, x \)$,
    there is one additional differentiation in $t$. The defining integral gives
  $ G_t = lambda L \, wide partial_t nabla_x G = nabla_x \( lambda L \) = lambda L A^sharp . $
  It follows that
  $ 1 / u "div"_g \( sqrt(D) thin A_d nabla_x G \) =  & b_1 {frac(Delta_x G - nabla_x^2 G \( w \, w \), G) +
    chevron.l frak(q) \, s_G chevron.r} + chevron.l A \, upright(d) t chevron.r_(A_d) . $
  Thus the factor $- 4$ in the primitive correction cancels exactly the prescribed $4 chevron.l A \,
    upright(d) t chevron.r_(A_d)$. The $A$-part of $frak(q)$ produces $E_G$.
    The remaining $upright(d) t$-dependent terms are
  $ 4 b_1 {s_G \( w \) #scale(x: 120%, y: 120%)[\[] \( d - chi \) q_1 + 2 d p a x_t #scale(x: 120%, y: 120%)[\]] -
    p v chevron.l s_G \, upright(d) t chevron.r_(A_d)} . $
  Use
  $ d - chi = frac(p d v, 4 + p v) \, wide s_G \( w \) = a \( s_G \)_e \, wide chevron.l s_G \,
    upright(d) t chevron.r_(A_d) = chevron.l \( s_G \)_(e^perp) \, y chevron.r + d \( s_G \)_e x_t . $
  These terms become
  $ 4 b_1 {s_G \( w \) p d a (x_t + frac(a q_1, 4 + p v)) - p v chevron.l \( s_G \)_(e^perp) \, y chevron.r} \, $
  as asserted. The last correction in $V_(*)$ contributes $4 Delta_g G_c \/ u =
    4 sqrt(d) thin Delta_g G_c \/ \( lambda L \)$. This establishes Equations (7.28)–(7.29).
    On a collar with spatially constant $lambda \, n$, both $nabla_x G$ and $nabla G_c$ vanish.
    The boundary assertion follows. ◻
]

#thm([Lemma 7.6.])[
  (A coercive part of the quadratic form).  #emph[For $p gt.eq 0$ and $0 < d lt.eq 1$,
    the form in Equation (7.18) satisfies
#[#set math.equation(numbering: n => "(7.31)")
 $ cal(T) gt.eq 2 / 3 F^2 + \[ 4 \( p + 1 \) - v \] \| y \|^2 + 4 \( p + 1 \) d X_1^2 . $ <eq:ah-alg-coercivity>]

]
] <lem:ah-alg-coercivity>

#proof[
  The first two terms in Equation (7.18) are nonnegative. The last two terms, keeping the $X_1$-square intact,
    combine to
  $ 3 / 4 F^2 - frac(2 d, 4 + p v) F q_1 + frac(12 d, \( 4 + p v \)^2) q_1^2 . $
  Completing their square gives the exact identity
  #[#set math.equation(numbering: n => "(7.32)")
   $ 3 / 4 F^2 - frac(2 d, 4 + p v) F q_1 + frac(12 d, \( 4 + p v \)^2) q_1^2 = frac(9 - d, 12) F^2 +
     frac(12 d, \( 4 + p v \)^2) (q_1 - frac(4 + p v, 12) F)^2 . $ <eq:ah-alg-q-minimum>]
  Since $\( 9 - d \) \/ 12 gt.eq 2 \/ 3$, the result follows. ◻
]

===== 7.4.2 Asymptotic hypotheses for the flux calculation. <asymptotic-hypotheses-for-the-flux-calculation.>

For a tensor $T$, the notation $T = O_j \( r^(- gamma) \)$ means that its $b$-norm and the $b$-norms of its
  covariant derivatives through order $j$ are $O \( r^(- gamma) \)$.
  The following statement concerns each fixed choice of the profile parameters.
  Its constants need not be uniform as those parameters vary.

#thm([Proposition 7.7.])[
  (Passage to the four metric fluxes).  #emph[Suppose $g$ has an asymptotically hyperbolic end with background $b$
    and four finite metric fluxes $p_a \( g \)$, $a = 0 \, 1 \, 2 \, 3$, in the designated chart,
    as defined in Equation (2.9). Assume that, outside a compact set, $n$ is a constant and $lambda =
    sqrt(A_0^2 + r^2)$, with fixed $A_0 > 0$. Assume the differentiated end bounds
#[#set math.equation(numbering: n => "(7.33)")
 $ g - b = O_2 \( r^(- kappa) \) \, wide K = O_1 \( r^(- kappa) \) \,\
t = O_2 \( r^(- s) \) \, wide w = O_2 \( r^(- beta) \) \,\
kappa > 3 / 2 \, wide s > 3 / 2 \, wide beta > 3 / 2 \, wide kappa + beta > 3 . $ <eq:ah-alg-end-W>]

 Finally, suppose that for some $delta > 0$,
#[#set math.equation(numbering: n => "(7.34)")
 $ R_(hat(g)) + 6 = O \( r^(- 3 - delta) \) . $ <eq:ah-alg-end-R>]

 Then all four metric fluxes of $hat(g)$ exist and are finite. For each $a = 0 \, 1 \, 2 \, 3$,
#[#set math.equation(numbering: n => "(7.35)")
 $ p_a \( hat(g) \) - p_a \( g \) = - frac(1, 2 pi) lim_(r arrow.r oo)
   integral_(S_r) \( V_a thin upright(d) t - t thin upright(d) V_a \) \( nu_b \) thin upright(d) A_b .
   $ <eq:ah-alg-four-flux>]

 Moreover,
#[#set math.equation(numbering: n => "(7.36)")
 $ V_(*) = 4 \( lambda nabla_g t - t nabla_g lambda \) + o \( r^(- 2) \) \, $ <eq:ah-alg-Vstar-asymptote>]

 and the time-component identity is
#[#set math.equation(numbering: n => "(7.37)")
 $ p_0 \( hat(g) \) - p_0 \( g \) = - frac(1, 8 pi) lim_(r arrow.r oo) integral_(S_r) g \( V_(*) \, nu_g \) thin
   upright(d) A_g . $ <eq:ah-alg-time-flux>]

]
] <prop:ah-alg-mass-passage>

#proof[
  We first show that the nonlinear terms have no mass flux.
    Since $D = \( 1 - \| w \|_g^2 \)^(- 1)$, the graph correction is exactly
  $ l^2 upright(d) f ⊗ upright(d) f = D thin w^flat ⊗ w^flat . $
  Consequently, with differentiated bounds through order one,
  #[#set math.equation(numbering: n => "(7.38)")
   $ hat(g) - g = 4 t thin b + cal(E) \, wide cal(E) = O_1 \( r^(- 2 s) \) + O_1 \( r^(- s - kappa) \) +
     O_1 \( r^(- 2 beta) \) . $ <eq:ah-alg-metric-error>]
  For the four background static potentials,
  $ \| nabla_b^j V_a \|_b = O \( r \) quad \( j = 0 \, 1 \, 2 \) \, wide \| S_r \|_b = 4 pi r^2 . $
  Thus a metric error $O_1 \( r^(- j) \)$ contributes at most $O \( r^(3 - j) \)$ to its flux.
    The assumptions in Equation (7.33) make all three contributions in Equation (7.38) tend to zero.
  Write $bb(U)_b \( V \, e \)$ for the one-form
  $ V \( "div"_b e - upright(d) "tr"_b e \) + \( "tr"_b e \) upright(d) V - e \( nabla_b V \, dot.op \) $
  appearing in the definition of the metric mass. In three dimensions,
  #[#set math.equation(numbering: n => "(7.39)")
   $ bb(U)_b \( V \, 4 t thin b \) = - 8 \( V thin upright(d) t - t thin upright(d) V \) . $ <eq:ah-alg-conformal-flux>]
  Indeed $"div"_b \( 4 t b \) = 4 upright(d) t$, $"tr"_b \( 4 t b \) = 12 t$,
    and $\( 4 t b \) \( nabla_b V \, dot.op \) = 4 t thin upright(d) V$.
    Combining Equation (7.39) with Equation (7.38) proves the asserted comparison of the finite-radius flux integrals.
  We establish existence of the limiting fluxes before taking their difference.
    Put $hat(e) = hat(g) - b$ and $nu = min \( kappa \, s \, 2 beta \) > 3 \/ 2$.
    Then $hat(e) = O_2 \( r^(- nu) \)$. The scalar-curvature linearization at the curvature $- 1$ background is
  $ D R_b \( e \) = "div"_b "div"_b e - Delta_b "tr"_b e + 2 "tr"_b e . $
  Since $nabla_b^2 V_a = V_a b$ and $Delta_b V_a = 3 V_a$, differentiating the defining one-form gives exactly
  #[#set math.equation(numbering: n => "(7.40)")
   $ "div"_b bb(U)_b \( V_a \, hat(e) \) = V_a D R_b \( hat(e) \) . $ <eq:ah-alg-linearized-divergence>]
  The Taylor remainder in scalar curvature has the estimate
  $ \| D R_b \( hat(e) \) - \( R_(hat(g)) + 6 \) #scale(x: 120%, y: 120%)[\|] lt.eq
    C #scale(x: 120%, y: 120%)[\(] \| hat(e) \| thin \| nabla_b^2 hat(e) \| + \| nabla_b hat(e) \|^2 + \|
    hat(e) \|^2 #scale(x: 120%, y: 120%)[\)] = O \( r^(- 2 nu) \) . $
  The constant is uniform on a sufficiently distant tail, where $hat(g)$ and $b$ are uniformly equivalent. As
  $ upright(d) V_b = r^2 / sqrt(1 + r^2) thin upright(d) r thin upright(d) omega \, $
  the scalar-curvature contribution and the Taylor remainder in the right side of Equation (7.40) are absolutely
    integrable there:
  $ integral^oo r^(- 1 - delta) thin upright(d) r < oo \, wide integral^oo r^(2 - 2 nu) thin upright(d) r < oo . $
  The divergence theorem on annuli therefore makes each family of flux integrals a Cauchy family.
    All four limits exist and are finite. Taking the difference from the given fluxes of $g$ now proves Equation (7.35).
  It remains to identify the corrected vector field with the time potential. On the ultimate tail, set
  $ H_n \( t \) = integral_(- oo)^t L \( z \) thin upright(d) z . $
  The constant $n$ is fixed here, and
  $ H_n \( 0 \) = frac(1, n + 2) \, wide H'_n \( 0 \) = 1 \, wide nabla_x G = H_n \( t \) nabla_g lambda . $
  Taylor expansion at zero gives
  $ nabla_x G = (frac(1, n + 2) + t + O \( t^2 \)) nabla_g lambda \, wide nabla_g G_c = frac(nabla_g lambda, n + 2) . $
  On the same tail $A = upright(d) log lambda$, so
  $ sqrt(D) A_d = I + O \( r^(- 2 beta) \) \, wide u / lambda = 1 + O \( r^(- s) \) + O \( r^(- 2 beta) \) \, wide
    nabla Z = nabla t + O \( r^(- 2 beta) \) . $
  Substituting these bounds into Equation (7.19) and Equation (7.27) yields the explicit error ledger
  #[#set math.equation(numbering: n => "(7.41)")
   $ V_(*) - 4 \( lambda nabla_g t - t nabla_g lambda \) = O \( r^(1 - 2 s) \) + O \( r^(1 - 2 beta) \) +
     O \( r^(1 - kappa - beta) \) . $ <eq:ah-alg-vector-error>]
  All three terms are $o \( r^(- 2) \)$ by Equation (7.33). In particular their integrated normal fluxes tend to zero.
  Finally,
  $ lambda - V_0 = O_1 \( r^(- 1) \) \, wide V_0 = sqrt(1 + r^2) . $
  Replacing $V_0$ by $lambda$ in the conformal flux integral costs $O \( r^(1 - s) \) = o \( 1 \)$.
    Replacing $nu_b \, upright(d) A_b$, and the background gradient by their $g$-counterparts costs
    $O \( r^(3 - s - kappa) \) = o \( 1 \)$, since $s + kappa > 3$.
    Equation (7.37) follows from Equations (7.35) and (7.36).
    The proof treats the four static potentials separately; it does not assume a causal character for the mass
    covector of $hat(g)$. ◻
]

#thm([Lemma 7.8.])[
  (Scalar-curvature decay from the end equation).  #emph[Suppose the differentiated bounds of Equation (7.33)
    hold, $R_g + 6 = O \( r^(- 3 - delta) \)$, and
$ 2 s > 3 + delta \, wide 2 beta > 3 + delta . $

 Suppose also that the scalar end equation has the form
#[#set math.equation(numbering: n => "(7.42)")
 $ Delta_g Z + C \( Z \) \| upright(d) Z \|_g^2 = 3 / 4 \( e^(4 Z) - 1 \) + O \( r^(- 3 - delta) \) \,
   $ <eq:ah-alg-end-equation>]

 where $C$ is smooth and bounded near zero for the fixed profiles. Then Equation (7.34) holds.
   In the deformation equations one takes
$ C \( Z \) = p \( Z \) + 2 - d_0 \( Z \) #scale(x: 120%, y: 120%)[\(] p \( Z \) + 1 #scale(x: 120%, y: 120%)[\)] $

 on the tail with spatially constant $n$.]
] <lem:ah-alg-scalar-decay>

#proof[
  Since $D = \( 1 - \| w \|^2 \)^(- 1)$, we have $Z - t = O_2 \( r^(- 2 beta) \)$.
    The assumed end equation therefore gives
  $ Delta_g t + C \( t \) \| upright(d) t \|_g^2 = 3 / 4 \( e^(4 t) - 1 \) + O \( r^(- 3 - delta) \) . $
  First apply the conformal scalar-curvature formula to $e^(4 t) g$:
  $ e^(4 t) #scale(x: 120%, y: 120%)[\(] R_(e^(4 t) g) + 6 #scale(x: 120%, y: 120%)[\)] & = R_g + 6 -
    8 Delta_g t - 8 \| upright(d) t \|_g^2 + 6 \( e^(4 t) - 1 \)\
 & = R_g + 6 + 8 #scale(x: 120%, y: 120%)[\(] C \( t \) - 1 #scale(x: 120%, y: 120%)[\)] \| upright(d) t \|_g^2 +
   O \( r^(- 3 - delta) \) . $
  The gradient term is $O \( r^(- 2 s) \) = O \( r^(- 3 - delta) \)$.
    The difference $hat(g) - e^(4 t) g = e^(4 t) D thin w^flat ⊗ w^flat$ is $O_2 \( r^(- 2 beta) \)$.
    The local scalar-curvature formula, on the uniformly equivalent end metrics with bounded curvature,
    then gives $R_(hat(g)) - R_(e^(4 t) g) = O \( r^(- 2 beta) \)$. This proves the required decay. ◻
]

#prodef([Remark 7.9.])[
  The scalar-curvature hypothesis in the mass proposition is essential to the convergence argument.
    Bounds $t = O_2 \( r^(- s) \)$ for every $s < 3$, by themselves, would allow $t = r^(- 3) log r$,
    whose conformal time-flux integral diverges logarithmically.
    In the construction, Lemma 75 supplies the missing integrability from the scalar equation.
    The estimates of the primitive residual are then used separately to determine the sign of the limiting flux in
    Equation (7.37).
]

=== 7.5 A specified continuation and uniform height control <subsec:ah-homotopy>

Choose $j in C^oo \( bb(R) \; \[ 0 \, 1 \] \)$ equal to zero on $t lt.eq 0$ and one on $t gt.eq 1$, and put

$ cal(D) = A_chi { K \( w \, dot.op \) + A \( w \) w } \, wide V_theta.alt =
  u \( 4 A_chi nabla Z + theta.alt cal(D) \) \, quad 0 lt.eq theta.alt lt.eq 1 . $

Before the final scalar stage the inner condition is

#[#set math.equation(numbering: n => "(7.43)")
 $
   frac(\( V_theta.alt \)_nu, u) = \[ 1 - \( 1 - theta.alt \) j \( t \) \] \[ thin cal(B) - \( 1 - theta.alt \)
   cal(D)_nu thin \] . $ <eq:ah-homotopy-boundary>]

The outer values are always $f = Z = 0$. The scalar source is always the expression $Xi$ in Equation (7.15),
  evaluated using the current trace $F$.

Here are explicit trace corrections. On a black collar take a negative multiple of a spatial cutoff,
  a directional cutoff supported on $w dot.op nu_s < - 1 \/ 2$,
  and a nonincreasing height cutoff equal to one near $b_(-)$ and zero near $b_(+)$.
  On a white collar use a positive multiple, a directional cutoff supported on $w dot.op nu_s > 1 \/ 2$,
  and a nondecreasing height cutoff supported near $b_(+)$. Their sum is denoted by $D_0 \( x \, w \, h \)$.
  It is nondecreasing in $h$, vanishes in compatible directions,
  and is nonpositive at sufficiently low heights and nonnegative at sufficiently high heights.
  Choose its amplitudes larger than $2 sup_(partial Omega) \| H \| + 1$.
  The limiting directional inequalities at the assigned face height then are

#[#set math.equation(numbering: n => "(7.44)")
 $ F \( x \, + nu \, b \) gt.eq P_B + H \, wide F \( x \, - nu \, b \) lt.eq P_B - H . $ <eq:ah-directional-barriers>]

These are evaluations at $\| w \| = 1$, hence $d = chi = 0$.
  Let $b \( x \)$ be a compactly supported extension of the face values, constant on smaller collars,
  and let $D_1 \( x \, w \) = M_1 w dot.op nu_s$ on those collars, cut off smoothly, where $M_1 > sup \| H \| + 1$.

The four stages are:

+ Decrease $theta.alt$ from one to zero, retaining $F = h + C$ and the original face heights.
+ Keep $theta.alt = 0$ and the face heights, and set $F = h + C + alpha D_0 \( x \, w \, h \)$,
  with $alpha$ increasing from zero to one.
+ Keep $theta.alt = 0$, prescribe $h \|_(partial Omega) = \( 1 - zeta \) b$, and set
  #[#set math.equation(numbering: n => "(7.45)")
   $ F = h + \( 1 - zeta \) { C + D_0 \( x \, w \, h + zeta b \( x \) \) } + zeta { "tr"_(A_chi) K +
     D_1 \( x \, w \) } \, wide 0 lt.eq zeta lt.eq 1 . $ <eq:ah-third-stage>]
+ Keep the trace problem at $zeta = 1$, and multiply both $Xi$ and the right side of Equation (7.43) by a scalar
  decreasing from one to zero.

The prescriptions agree at their junctions. At fixed $x \, Z \, d f$,
  each trace right side has derivative at least one in $h$.
  The inequalities in Equation (7.44) persist in the third stage by convex combination. In the last stage $f = 0$:
  at an extremum $w = 0$, $D_1 = 0$, and the trace equation has the strict height sign. Hence $t = Z$ there.

#thm([Lemma 7.10.])[
  (Height, confinement, and the order of compact choices).  #emph[For all sufficiently large $N$,
    and all sufficiently distant outer truncations at fixed profiles,
    every smooth solution in the first three stages satisfying $t gt.eq - epsilon.alt$ obeys
#[#set math.equation(numbering: n => "(7.46)")
 $ \| tau f \| lt.eq B \, wide \| h \| lt.eq B r^(- beta) quad \( r gt.eq r_0 \) . $ <eq:ah-height-bounds>]

 The outer normal slope obeys the differentiated rate of the same radial barrier, and $t > -
   epsilon.alt$ on the outer face. The constants $B \, r_0$ may be chosen independently of collar widths and
   collar derivatives, uniformly while the thresholds and correction amplitudes range in fixed bounded sets.]
  #emph[The thresholds and offsets can consequently be fixed so that, on every physical solution obtained below,
#[#set math.equation(numbering: n => "(7.47)")
 $ \| F "tr" K \| + \| nabla C \| lt.eq 2 rho . $ <eq:ah-offset-budget>]

 The fixed region on which $n = N$ can be chosen to contain every compact sublevel set used in the boundary slope
   argument.]
] <lem:ah-heights>

#proof[
  At an interior extremum of $f$, $w = 0$, so $A$, $D_0$, and $D_1$ contribute nothing to the trace equation.
    In stage three it reads
  $ "tr" \( l "Hess" f \) = tau A_R f + \( 1 - zeta \) \( C - "tr" K \) . $
  In the first two stages the same formula has $zeta = 0$. Since $A_R gt.eq 1$,
    the maximum principle and the boundary values give
  $ \| tau f \| lt.eq max { \| b_(-) \| \, \| b_(+) \| \, sup \| "tr" K \| + sup \| C \| } . $
  No derivative of a collar correction has been used. The necessary correction amplitudes are uniformly bounded:
    on a black face $H = c_b - "tr"_T K$, and the white face has the analogous bound.
    All supports can be kept in a fixed compact enlargement by shortening the individual collars.
  Take $r_0$ outside that enlargement and the fixed lapse transition. Compare $f$ with
  $ plus.minus B_1 / tau {frac(r^(- beta), A_R \( r \)) - frac(T^(- beta), A_R \( T \))} $
  on a truncation at $r = T$. At a contact the axis is radial.
    Put $k = beta + partial_(log r) log A_R$, so $beta lt.eq k lt.eq beta +
    1 < 4$ and its derivative is nonnegative. The Hessian term,
    together with the radial part $2 chi A \( w \)$ coming from $s = d log lambda$, has upper bound
  $ a { - 2 + chi \( k - 2 \) + o \( 1 \) } $
  for the positive decreasing test. This is bounded above by a fixed negative multiple of $a$,
    uniformly for $0 lt.eq chi lt.eq 1$. The derivative of k has favorable sign.
  The only additional spatial-profile term occurs where n varies.
    Positive t helps, because $p t thin d log n$ points outward. For negative t put $X_0 = - n t$.
    The adverse term is at most $C chi a X_0$. If $X_0 > C_1 log \( r \/ tau \)$, then $l_0 =
    e^(- X_0)$ and the tested gradient gives
  $ chi a X_0 lt.eq C X_0 e^(- X_0) frac(lambda, tau A_R) r^(- beta) = o \( r^(- beta) \) $
  by taking the fixed $C_1$ large. In the complementary regime $chi a lt.eq C \/ sqrt(n)$, so
  $ chi a X_0 lt.eq C frac(log r + log N, sqrt(n)) = o \( 1 \) r^(- beta) \, $
  uniformly on the varying region because $q > 2 beta$. There the shift at $T$ is negligible after $T$ is
    sufficiently large at fixed profiles.
  The tensor term is $O \( r^(- kappa) \)$, dominated by the positive test height since $beta < kappa$,
    except near $T$. Near $T > 2 R$, n is constant, and on the test $a gt.eq
    c_N r^(- beta)$ whenever the tested slope is small: $lambda \/
    A_R$ and $l_0$ have positive lower bounds at fixed profiles.
    Thus the negative Hessian contribution dominates the tensor term there as well.
    For larger slope it is stronger. The negative test gives the reverse inequality.
    Choose $B_1$ to dominate the already proved bound on the fixed sphere $r_0$; this uses no collar derivatives.
    Height monotonicity proves Equation (7.46). At the outer face the barrier derivative tends to zero in the
    quantity $l \| d f \|$, at fixed profiles. The relation $Z = t + log \( 1 + l^2 \| d f \|^2 \) \/ 8 =
    0$ then excludes $t = - epsilon.alt$, once $T$ is sufficiently large.
  We now specify the compact choices without circular dependence.
    Use this common B to choose a compact set Q outside which $B r^(- beta) \| "tr" K \| lt.eq rho$.
    This is possible because $beta + kappa > 3 + delta$. Choose the two negative thresholds sufficiently close to
    zero, then their collars, and finally sufficiently small offset amplitudes, so that
  $ \| \( h + C \) "tr" K \| + \| nabla C \| lt.eq rho quad upright("on Q whenever ") b_(-) lt.eq h lt.eq b_(+) . $
  The constants controlling derivatives of the now fixed collars need not be uniform in this choice.
    The next lemma proves precisely the required physical height interval on Q.
    Outside Q the end bound proves Equation (7.47), after making the support of C lie in Q.
    Finally enlarge the fixed constant-n region so that Equation (7.46) rules out heights near $b_(-)$ and $b_(+)$
    beyond it. This radius is fixed before N and R. ◻
]

#thm([Lemma 7.11.])[
  (Compact separation and polynomial collar estimates).  #emph[For the fixed choices above,
    all sufficiently large $N$, and smooth solutions satisfying the floor condition $t gt.eq - epsilon.alt$,
    the first two stages have constants $c \, C > 0$, independent of $N$ and outer truncation, such that
$ c / tau lt.eq partial_nu f lt.eq C / tau quad upright("on black faces") \, wide c / tau lt.eq -
  partial_nu f lt.eq C / tau quad upright("on white faces") . $

 In stage three, $\| partial_nu f \| lt.eq C \/ tau$. On each fixed compact set needed in Equation (7.47),
   the physical heights satisfy $b_(-) lt.eq h lt.eq b_(+)$. On the fixed collars $cal(C)$, for $phi.alt gt.eq 0$,
#[#set math.equation(numbering: n => "(7.48)")
 $ integral_(partial Omega) lambda L phi.alt & lt.eq C N^m integral_(cal(C)) u { \( 1 + sqrt(cal(T)) \)
   phi.alt + \| d phi.alt \|_(A_chi) } \,\
integral_(partial Omega) phi.alt & lt.eq C N^m integral_(cal(C)) sqrt(D) { \( 1 + sqrt(cal(T)) \) phi.alt + \| d
  phi.alt \|_(A_chi) } . $ <eq:ah-polynomial-trace>]

 The finite exponent m is independent of $B_0 \, R \, n_oo$; fixed collar geometry affects the constant C.]
] <lem:ah-collars>

#proof[
  We verify the extension of Lemma 53 rather than assume an asymptotically flat hypothesis.
    A putative failure supplies $N_i arrow.r oo$ and outer radii tending to infinity.
    On the relevant compact range $A_R = 1 \, n = N$, and $l \/ tau gt.eq c ell \/ tau = c N^(B_0 \/ 4) arrow.r
    oo$. At a fixed nonzero-gradient lower test $phi.alt$ of a lower relaxed height limit,
  $ d_i \, chi_i arrow.r 0 \, wide a_i arrow.r 1 \, wide frac(l_i, tau_i sqrt(D_i)) arrow.r \| d
    phi.alt \|^(- 1) \, wide 2 chi_i A \( w_i \) arrow.r 0 . $
  The last term is the only new trace term on this compact range, where $A = s$ is bounded.
    The limiting inequality is therefore
  $ frac("tr"_(\( d phi.alt \)^perp) "Hess" phi.alt, \| d phi.alt \|) + "tr"_(\( d phi.alt \)^perp) K lt.eq k' + C_b $
  at heights below $k'$, with $b_(-) < k' < 0$ close to $b_(-)$. The low-height $D_0$ term is nonpositive.
    The lower relaxed passage, increasing logistic reparametrizations,
    and Lemma 31 now apply exactly under the hypotheses established in Lemma 53.
    In particular each height is extended constantly as $b_(+)$ across a white face before taking the relaxed
    limit. Low test contacts are therefore interior, even if a boundary layer is present.
    The reversed white face has expansion $- c_w > 0$, and excludes contact of the resulting low closed sublevel
    set. The end bound makes that set compact. After adjoining the full black region,
    right continuity of the black threshold family excludes its meeting any compact set away from that region.
    Reversing signs proves the upper separation, including the empty-white-region case.
  On an actual boundary collar $A = 0$, $n = N$, $A_R = 1$, and $lambda = lambda_0$ is constant.
    For a test $h = b_(-) + psi \( s \)$ of fixed positive slope,
  $ d lt.eq C \( tau \/ ell \)^2 = C N^(- B_0 \/ 2) \, wide N chi gt.eq c d . $
  The trace residual is the leaf expansion plus $O \( d \)$ and the term $a chi \| d s \| \( log psi' \)'$. Use
  $ psi' = m_1 exp #h(-0.16667em) (integral_0^s gamma_N) quad upright("or") quad psi' =
    M_2 exp #h(-0.16667em) (- integral_0^s gamma_N) \, $
  where $gamma_N$ is a fixed large multiple of N on $\[ 0 \, 1 \/ N \]$, vanishes beyond $2 \/ N$,
    and has bounded integral. The first term dominates $O \( d \)$ on the short interval.
    Outside it the offset margin is a fixed multiple of s and dominates d when $B_0 > 2$.
    Compact separation orders the lower barrier on the far end of the collar;
    fixed large slopes order the upper barrier. The third-stage directional inequalities give the same upper slope
    barriers of both signs. This verifies all hypotheses and all changed small parameters in the proof of
    Lemma 54; it does not require the special flat choice $tau = ell^(3 \/ 2)$.
  For the trace inequalities use the signed field $lambda_0 L w$,
    whose boundary flux has magnitude at least $lambda_0 L \/ 2$. Direct differentiation on these collars gives
  $ frac("div" \( lambda_0 L w \), u) = sqrt(d) { "tr"_(A_d) H^f + \( d p + p + 2 \) a x_t } . $
  With the L weight removed, the same formula has only $d p thin a x_t$ in its gradient term.
    Coercivity of Equation (7.14), equivalently Lemma 35, bounds these expressions by $C
    N^m \( 1 + sqrt(cal(T)) \)$. The gradient action is bounded by $\| d phi.alt \|_(A_d)$,
    and $A_d lt.eq \( 1 + N \/ 4 \) A_chi$. Integration with fixed collar cutoffs proves Equation (7.48).
    No inverse power of $ell$ occurs in this calculation. ◻
]

=== 7.6 Exclusion of the floor <subsec:ah-floor>

#thm([Lemma 7.12.])[
  (Floor separation).  #emph[A fixed sufficiently small $delta_0 >
    0$ and then a fixed finite integer $P_0$ can be chosen so that,
    for all sufficiently large N and all sufficiently distant truncations at fixed profiles,
    no smooth solution anywhere in the continuation can satisfy $t gt.eq - epsilon.alt$ and attain $t = -
    epsilon.alt$. Neither choice requires a fixed-profile Schauder constant.]
] <lem:ah-floor>

#proof[
  At an interior contact $d t = 0 \, "Hess" t gt.eq 0$. The Gauss equation of the graph in the Riemannian warped
    product $g + l^2 d s_0^2$ gives
  #[#set math.equation(numbering: n => "(7.49)")
   $ 1 / 2 e^(4 t) R_(hat(g)) lt.eq 1 / 2 R_g - v ("Ric" \( e \, e \) + frac("tr"_perp "Hess"_x l, l)) +
     cal(S) (S - K + d^(- 1) A \( w \) w ⊗ w) \, $ <eq:ah-floor-gauss>]
  where
  $ cal(S) \( B \) = 1 / 4 \( "tr"_perp B \)^2 - 1 / 2 \| B_(perp perp)^(upright("tf")) \|^2 +
    d B_(e e) "tr"_perp B - d \| B_(e perp) \|^2 . $
  To obtain this formula, the spatial lapse derivatives contribute $w ⊗ A + A ⊗ w$ to the graph second form,
    and its vertical connection contributes $d^(- 1) A \( w \) w ⊗ w$.
    The remaining $p "Hess" t$ lapse curvature and conformal Hessian terms are nonpositive at a contact.
    The rank-one term changes $cal(S)$ by only $v A \( w \) "tr"_perp \( S - K \)$.
  We give the derivative ledger that controls the additional terms. At a floor contact, $p = n$, $d_x p = d n$, and
  $ A = s - epsilon.alt n thin d log n \, wide nabla w = H^f A_d + d A ⊗ w \, wide d log u =
    H^f \( w \, dot.op \) + \( 1 + v \) A . $
  Positive-order derivatives of $log n$ are bounded. Thus $"Hess"_x l \/ l$, $A$,
    and the needed spatial derivatives have fixed-degree polynomial bounds in $n$, uniformly in position.
    The factor $epsilon.alt < 1$ introduces no larger growth. Moreover
  $ partial_p frac(4 + p, 4 + p v) = frac(4 d, \( 4 + p v \)^2) \, wide d v = 2 d { H^f \( w \, dot.op \) + v A } $
  at contact. Therefore the derivatives of $A_chi$ always carry a $d$ factor in the uncontrolled axial Hessian
    direction. In $d log u$, that direction contracts with $chi$ in the flux.
    The same is true for the new drift $A_chi \( A \( w \) w \) = chi A \( w \) w$.
    A spatial derivative of $A$ in this drift is contracted axially and retains $chi$.
  The algebraic floor comparison of Lemma 37, applied to $S$, and Equation (7.49) therefore give,
    with universal $c > 0$, small prescribed $eta > 0$, and fixed finite powers $m$, the bounds
  $ cal(T) - cal(S) (S - K + d^(- 1) A \( w \) w ⊗ w) & gt.eq c cal(T) - C n^m \( rho_0 + v \) \,\
w \( F \) & gt.eq tau A_R a sigma - eta cal(T) - C_eta n^m \( rho_0 + v \) \,\
u^(- 1) \| "div" \( u cal(D) \) \| & lt.eq eta cal(T) + C_eta n^m \( rho_0 + v \) . $
  Here $\| K \|^2 + \| nabla K \|^2 lt.tilde rho_0$, and the height estimate bounds the squared end height by the
    same weight. For example $a \| nabla K \|$ is bounded by $v + \| nabla K \|^2$.
    The derivative of $h = tau A_R f$ gives the displayed positive term and $h thin w \( d log A_R \)$,
    whose absolute value is at most $C a \| h \| lt.eq C \( v + rho_0 \)$ for this floor estimate.
    Derivatives of $D_0 \, D_1 \, b \, C$ are fixed compact coefficients;
    the derivative in h is nonnegative and at least one. These observations enumerate all new spatial terms beyond
    the flat floor calculation, including $d_x p$, which is not zero here.
  Combining these bounds with Equation (7.17) and the constraint gives
  #[#set math.equation(numbering: n => "(7.50)")
   $ u^(- 1) "div" V_theta.alt gt.eq 2 delta_0 cal(T) + tau A_R a sigma -
     C n^m \( rho_0 + v \) $ <eq:ah-floor-divergence>]
  for fixed sufficiently small $delta_0$. The cosmological constants cancel in deriving this lower bound:
    $8 pi mu - R_g \/ 2 - 3 = Q_g \( K \) \/ 2$. In the prescribed source the remaining explicit term
    $3 \( e^(4 t) - 1 \)$ is negative at the floor, where $d_0 = delta_0$ and $m_0 = 1$.
    Choose $P_0 > m + 1$ and N sufficiently large that its penalty dominates the error and $2 rho + rho_0$.
    Equation (7.50) then contradicts the scalar equation.
  Outer contacts were excluded in Lemma 77. At an inner contact $j = 0$,
    so Equation (7.43) restores the full flux condition. Since $A = 0$ on the collar, its face identity is
  $ d \( H + 4 partial_nu t \) = - N_B d . $
  It forces $partial_nu t < 0$, contrary to a minimum. In the final scalar stage $f = 0 \, t = Z$.
    At a floor minimum the unscaled source is negative after the same penalty is enlarged;
    at positive scale the inner derivative is negative as well.
    At zero scale the homogeneous mixed problem gives $Z = 0$ by multiplication by Z.
    This proves separation for all stages. ◻
]

=== 7.7 Bounds, a compact equation, and exhaustion <subsec:ah-existence>

#thm([Proposition 7.13.])[
  (Existence at fixed profiles).  #emph[Choose $delta_0 \, P_0$ as in Lemma 79.
    There is a fixed sufficiently large $B_0$, followed by a fixed exponent $a$ satisfying Equation (7.12),
    such that for every sufficiently large $N$ the physical system has a smooth solution on the infinite exterior
    with $t gt.eq - epsilon.alt$. It is a smooth compact limit of solutions on sufficiently distant spherical
    truncations. At fixed profiles, $Z \, t \, D$, and all their derivatives on hyperbolic unit patches are
    bounded; derivatives of $f$ are bounded after multiplication by the local value of $lambda$.
    These bounds are uniform in outer truncation. Moreover $R_(hat(g)) gt.eq - 6$,
    and its inner boundary has strictly negative mean curvature.]
] <prop:ah-existence>

#proof[
  We first prove estimates for all smooth floor-admissible solutions of the continuation,
    without assuming their existence.
  ===== 7.7.1 The principal divergence at high levels. <the-principal-divergence-at-high-levels.>
  Put $B = A + p thin d t$. Differentiation gives
  $ nabla w = H^f A_d + d B ⊗ w \, wide d log u = \( p + 2 + p v \) d t + H^f \( w \, dot.op \) + \( 1 + v \) A . $
  At fixed profiles all explicit coefficients and their needed derivatives are bounded on $t gt.eq - epsilon.alt$.
    The derivatives in the axial Hessian direction carry $d$ or $chi$, as in the proof of Lemma 79;
    the same holds for $p_t d t$, because $partial_p \( \( 4 + p \) \/ \( 4 + p v \) \) = 4 d \/ \( 4 + p v \)^2$.
    The derivative of $A$ in the drift $chi A \( w \) w$ is contracted axially and retains $chi$.
    Coercivity of Equation (7.14) and Young’s Inequality consequently give
  $ u^(- 1) \| "div" \( u cal(D) \) \| lt.eq eta cal(T) + C_N \, wide 4 \| chevron.l A \,
    d t chevron.r_(A_d) \| lt.eq eta cal(T) + C_N $
  for any fixed $eta > 0$. These statements bound contracted expressions;
    they do not assert a bound for the unweighted axial entry of $H^f$.
  On a sufficiently high $Z$ level, either $t$ is large or $D$ is large.
    In the first case $3 \( e^(4 t) - 1 \)$ absorbs the bounded errors. In the second case
  $ tau A_R a sigma = frac(tau A_R, lambda l_0) v / sqrt(d) $
  does so. At fixed profiles $tau A_R \/ lambda$ has a positive lower bound on the whole exterior.
    The floor penalty is bounded by a fixed-profile constant and is absorbed in the same manner.
    Choosing $eta$ below a fixed fraction of $delta_0$ yields
  #[#set math.equation(numbering: n => "(7.51)")
   $ "div" \( 4 u A_chi nabla Z \) gt.eq c u \( 1 + cal(T) + tau A_R a sigma \) quad
     upright("on ") { Z > M_N } $ <eq:ah-high-divergence>]
  in the first three stages. The positive $c$ is fixed; the level $M_N$ may depend arbitrarily on all fixed profiles.
  ===== 7.7.2 The boundary bound before graph comparison. <the-boundary-bound-before-graph-comparison.>
  In stage one the compatible face equations give $- H + w_nu \( F - P_B \) = - \( 1 - a \) H = O \( d \)$.
    The normal drift has order $chi$, since $A = 0$ on the collars.
    Thus Equation (7.43) gives a principal normal flux of absolute value at most $C u d$. The signed slope bound gives
  $ u d = lambda L sqrt(d) lt.eq C \( tau \/ ell \) L $
  on these fixed collars. Multiply Equation (7.51) by an increasing cutoff $j_0 \( Z \)$,
    zero up to $M_N$ and one above $M_N + 1$. The outer boundary contributes zero.
    Apply Equation (7.48) to the inner boundary term. Its nondifferentiated part is at most
  $ C N^m tau / ell integral_(cal(C)) u j_0 \( 1 + sqrt(cal(T)) \) \, $
  which is absorbed by the positive bulk if $B_0 > 4 m$. The derivative term is absorbed by $integral u j'_0 \| d
    Z \|_(A_chi)^2$, leaving a bounded compact strip integral. We obtain
  #[#set math.equation(numbering: n => "(7.52)")
   $ integral u j_0 \( 1 + cal(T) + tau A_R a sigma \) + integral u j'_0 \| d Z \|_(A_chi)^2 lt.eq
     C_N . $ <eq:ah-high-energy>]
  Only the polynomial native-weight trace constant was used in this smallness choice.
    In particular no comparison involving $ell^(- 1)$, no Schauder constant,
    and no power of $n_oo$ enters the inequality $B_0 > 4 m$.
  ===== 7.7.3 The local bound near inner faces. <the-local-bound-near-inner-faces.>
  After Equation (7.52) is established, constants may depend arbitrarily on the fixed profiles.
    On the ordinary graph $Gamma = g + d f^2$, the measures $d V_Gamma$ and $sqrt(D) thin d V_g$,
    and their inverse gradient metrics, are comparable on a fixed compact patch. Moreover
  $ e^(2 Z) = e^(2 t) D^(1 \/ 4) \, wide D^(1 \/ 4) lt.eq C_N \( 1 + tau A_R a sigma \) . $
  Thus Equation (7.52), including the bounded low strip, gives a local $L^2 \( d V_Gamma \)$ bound for $e^Z$.
    The graph mean curvature is bounded by $C_N \( 1 + sqrt(cal(T)) \)$:
    its axial Hessian coefficient is $\( 1 + \| d f \|^2 \)^(- 1) lt.eq C_N d$,
    while Equation (7.14) controls the transverse and $d$-weighted axial entries.
    The graph Sobolev argument of Lemma 57 therefore applies, including its boundary term by Equation (7.48). It gives
  $ parallel omega parallel_(L^6 \( d V_Gamma \))^2 lt.eq C_N integral_Gamma { \| nabla_Gamma
    omega \|^2 + \( 1 + cal(T) \) omega^2 } . $
  For explicit control of the scalar test, multiply its first-stage equation by $eta^2 e^(2 k Z) \/ L$,
    with compact patch cutoff $eta$. The derivative of $L$ contributes $\( p + 2 \) d t + A - s$.
    Its first term costs a small $cal(T)$ fraction plus $C_N \| d Z \|_(A_chi)^2$;
    the spatial term is bounded at fixed profiles and has the same Young bound.
    To control the drift, write $b_D = K \( w \, dot.op \) + A \( w \) w^flat$, so $cal(D) = A_chi b_D$.
    On the fixed compact patch, the exact dual-metric identity gives
  $ \| cal(D) \|_(A_chi^(- 1))^2 = \| b_D \|_(A_chi)^2 lt.eq 2 \( \| K \|^2 + \| A \|^2 \) lt.eq C_N . $
  Thus $\| cal(D) dot.op d z \| lt.eq C_N \| d z \|_(A_chi)$.
    For $z = Z$, Young’s Inequality bounds the test’s $2 k thin d Z$ term by $k \| d Z \|_(A_chi)^2 + C_N k$.
    For $z = t$, use $A_chi lt.eq A_d$ and coercivity to bound the $\( p + 2 \) thin d t$ term by $epsilon_1
    cal(T) + C_(N \, epsilon_1)$, with $epsilon_1 > 0$ chosen sufficiently small.
    The cutoff terms obey the same dual-metric estimate. With $k gt.eq k_(*) \( N \)$,
  #[#set math.equation(numbering: n => "(7.53)")
   $ integral_Gamma e^(2 k Z) eta^2 { cal(T) + k \| nabla_Gamma Z \|^2 } lt.eq
     C_N k integral_Gamma e^(2 k Z) \( eta^2 + \| d eta \|^2 \) . $ <eq:ah-moser-energy>]
  At a face the remaining trace terms have only $sqrt(cal(T))$ and $k \| nabla_Gamma Z \|$ growth.
    Young’s Inequality absorbs them in the left side of Equation (7.53), at cost $C_N k$ on the right.
    This step requires no new small factor $tau \/ ell$.
  The Sobolev Inequality iterates $2 k$ to $6 k$ on nested patches.
    Interpolation with the bounded $L^2$ norm closes the iteration:
    the larger-patch supremum has exponent $1 - 1 \/ k_(*) < 1$,
    so geometric radius gaps give a uniform smaller-patch supremum. This includes inner faces.
    Equation (7.51) excludes a higher interior maximum elsewhere, and the outer value is zero.
    Hence $Z$ is uniformly bounded above in stage one.
  In stages two and three there is no drift. The high-level source excludes an interior maximum.
    At an inner face the upper $f$-slope bound forces $t > 1$ if $Z$ is sufficiently large.
    Then $j = 1$ and the conormal derivative is zero, contradicting the boundary point principle.
    In stage four $f = 0$, and the same argument works at positive scale; at zero scale $Z =
    0$ by its energy identity. Consequently
  $ - epsilon.alt lt.eq t lt.eq Z lt.eq C_N \, wide D lt.eq C_N $
  throughout the continuation. On compact sets $\| d f \| lt.eq C_N$;
    on the end the same bound holds for $lambda \| d f \|$.
  ===== 7.7.4 Classical estimates. <classical-estimates.>
  On a hyperbolic unit patch centered at $x_0$, put $c = lambda \( x_0 \)$ and $f_(upright("rescaled")) = c f$.
    Also divide the entire scalar divergence equation, its total flux,
    and its prescribed conormal datum by the same constant $c$. In local coordinates its leading matrix is then
  $ tilde(a) = 4 sqrt(det g) thin \( u \/ c \) A_chi . $
  The ratio $lambda \/ c$ is uniformly bounded above and below on the patch, with bounded logarithmic derivatives.
    At fixed capped profiles, $u \/ c$ and $chi$ have positive upper and lower bounds on the range just proved.
    The divided drift and source have the same normalization,
    and division by a constant creates no derivative term. At fixed profiles the trace coefficients are uniformly
    elliptic and bounded on the range just proved, and its normalized source is bounded.
    The rank-one estimate of Theorem 45 gives a positive Hölder exponent for the rescaled gradient and
  $ integral_(B_r) \| D^2 f_(upright("rescaled")) \|^2 lt.eq C_N r^(1 + gamma_N) quad \( gamma_N > 0 \) . $
  After $t = t \( x \, Z \, d f \)$ is substituted in the scalar equation,
    its source is bounded by $C_N \( 1 + \| D Z \|^2 + \| D^2 f_(upright("rescaled")) \|^2 \)$.
    The drift flux and prescribed inner conormal value are bounded.
    Lemma 50 therefore gives Hölder continuity of $Z$, including the disjoint Dirichlet and conormal faces.
    The coupled bootstrap of Proposition 51 applies: the trace coefficients and source are now Hölder;
    after solving the trace equation for two derivatives of $f$,
    the scalar equation has Hölder leading coefficients and natural quadratic growth in $D Z$.
    On a face its normal derivative is a smooth function of $x \, Z \, f \, d f$, because $d f$ is normal.
    There is no second derivative of $f$ or derivative of $Z$ in that boundary function.
    These checks give every local classical bound, uniformly in truncation.
  ===== 7.7.5 A trace solution for arbitrary inputs. <a-trace-solution-for-arbitrary-inputs.>
  The preceding estimates apply only to prospective fixed points.
    To define the compact map, fix a finite truncation and a bounded input $Z in C^(1 \, b)$,
    without a floor assumption. At large $sigma = \| d f \|$, the defining relation for $t$ gives
  $ t = frac(4 Z - log \( lambda sigma \), n + 4) + O \( 1 \) \, wide chi asymp sigma^(- 8 \/ \( n + 4 \)) \, wide
    sqrt(D) / l asymp sigma . $
  Since $n gt.eq N gt.eq 4$, $chi gt.eq c \/ \( 1 + sigma \)$.
    The new coefficient $A$ has growth $O \( log \( 2 + sigma \) \)$, but its normalized trace contribution has size
  $ C sigma chi \| A \| lt.eq C_N \( 1 + sigma \) . $
  All other terms have the same linear growth on the bounded height range.
    The principal matrix is independent of the height, the normalized source has strict positive height
    derivative, and all expressions are smooth and direction free on bounded ranges.
    These are exactly the hypotheses of Proposition 60. It gives the unique $C^(3 \, b)$ trace solution,
    continuous in the input and continuation parameter. Its constants may depend on this finite truncation;
    this causes no difficulty in defining the map.
  Freeze its coefficients, drift, and source, and solve the linear mixed problem for a new $Z$,
    leaving only its principal gradient unfrozen. The outer Dirichlet face gives coercivity.
    The output is bounded in $C^(2 \, b)$ on bounded input sets, hence the map is compact in $C^(1 \, b)$.
    The set defined by $min t \( x \, Z \, d f \) > - epsilon.alt$ and a sufficiently large norm cutoff is open in
    the parameter–input product. Lemma 79 and the preceding bounds exclude boundary fixed points.
    The endpoint map is zero, and zero is admissible. Lemma 62 therefore gives a physical fixed point.
    First take $N$ sufficiently large for the finite list of polynomial absorptions and compact separations;
    then take each outer radius sufficiently large for all fixed-profile barriers.
    The a priori bounds are uniform in that outer radius, so a diagonal compact limit solves the physical system
    with $t gt.eq - epsilon.alt$.
  Finally, on the physical system,
  $ w \( F \) = tau A_R a sigma + h thin w \( d log A_R \) + w \( C \) . $
  Young’s Inequality and the end height bound give
  #[#set math.equation(numbering: n => "(7.54)")
   $ \| h thin w \( d log A_R \) \| lt.eq o \( 1 \) rho + 1 / 4 tau A_R a sigma . $ <eq:ah-capillary-error>]
  Indeed it vanishes before $R$. Beyond $R$, $tau A_R \/ \( lambda l_0 \) gt.eq c tau \/ R$,
    so its remainder is at most $C \( R \/ tau \) \| h \|^2$;
    relative to $rho$ it is bounded by $C R^(4 + delta - 2 beta) \/ tau = o \( 1 \)$.
    Equations (7.17), (7.47), and $M_d > 10 rho$ imply $R_(hat(g)) gt.eq - 6$, since $d_0 lt.eq 1 \/ 2$.
    The face identity gives
  $ H_(hat(g)) = e^(- 2 t) sqrt(d) \( H + 4 partial_nu t \) = - e^(- 2 t) sqrt(d) thin N_B < 0 . $
  Also $hat(g) gt.eq e^(- 4 epsilon.alt) g$, so it is complete including its boundary. ◻
]

=== 7.8 Decay and the four limiting fluxes <subsec:ah-end>

#thm([Lemma 7.14.])[
  (Differentiated end estimates).  #emph[For each fixed $N$, the solution of Proposition 80 satisfies
$ lambda f = O_j \( r^(- beta) \) \, wide w = O_j \( r^(- beta) \) \, wide Z - t = O_j \( r^(- 2 beta) \) $

 for every $j$, and $Z \, t = O_j \( r^(- gamma) \)$ for every $gamma < 3$. Furthermore
$ R_(hat(g)) + 6 = O_j \( r^(- 3 - delta) \) . $

 All four metric fluxes of $hat(g)$ exist. They satisfy Equation (7.35),
   and the time component satisfies Equation (7.37).]
] <lem:ah-end>

#proof[
  The profiles are fixed throughout this proof. On the ultimate tail $n = n_oo$ is constant and $A = s$,
    and $A_R$ is proportional to $r$. The height bound of Lemma 77 therefore gives $lambda f =
    O \( r^(- beta) \)$. On each hyperbolic unit patch rescale $f$ by the central value of $lambda$.
    The trace equation is uniformly elliptic there by Proposition 80.
    Its inhomogeneous term at $f = 0$ is $O_j \( r^(- kappa) \)$;
    the remaining zeroth-order term is a bounded coefficient times the rescaled $f$.
    The local linear estimates for this fixed smooth solution consequently give $lambda f = O_j \( r^(- beta) \)$,
    using $beta < kappa$. The equations for $w$ and $D$ give the next two estimates.
    The same argument holds on the outer truncations with uniform boundary estimates at their zero Dirichlet face.
  Here is the scalar expansion before assuming decay of $Z$.
    Since $t$ is bounded and $n_oo$ is fixed, the substitution $t = Z +
    O_j \( r^(- 2 beta) \)$ has uniformly bounded differentiated coefficients. In the flux,
  $ A_chi = I + O_j \( r^(- 2 beta) \) \, wide u^(- 1) d u = s + \( p + 2 \) d Z + O_j \( r^(- 2 beta) \) . $
  The tensor part of $S$ has order $O_j \( r^(- beta) \)$. In Equation (7.14),
    the part quadratic in $d Z$ is $4 \( p + 1 \) \| d Z \|^2$ to error $O_j \( r^(- 2 beta) \)$.
    Every mixed term between $S$ and $d t$ has an additional factor $a$:
    its two possible forms are $a chevron.l M \, y chevron.r$ and $a q_1 x_t$.
    Thus these terms, including their differentiated bounds, have order $r^(- 2 beta)$.
    The tensor drift $K \( w \, dot.op \)$ has order $r^(- kappa - beta)$.
    The leading lapse term $4 chevron.l s \, d Z chevron.r$ from $u^(- 1)
    "div" \( 4 u nabla Z \)$ cancels the explicit lapse term on the right side of the scalar equation.
  The capillary term is $O_j \( r^(- 2 beta) \)$. Even before its support disappears,
    the penalty contributes $O_j \( r^(- 3 - delta) \) + O_j \( r^(- 2 beta) \)$,
    because $n_oo$ is fixed and all derivatives of $t$ are bounded.
    Since $2 beta > 4 + delta$, the resulting equation is
  #[#set math.equation(numbering: n => "(7.55)")
   $ Delta_g Z + C_N \( Z \) \| d Z \|^2 = 3 / 4 \( e^(4 Z) - 1 \) + O_j \( r^(- 3 - delta) \) \, wide
     C_N \( z \) = p \( z \) + 2 - d_0 \( z \) \( p \( z \) + 1 \) . $ <eq:ah-end-scalar>]
  Here $p \( z \) = n_oo p_(*) \( n_oo z \)$ and $d_0 \( z \)$ denotes the corresponding composed coefficient.
    This expansion requires only the bounded differentiated range already proved.
  Define the increasing function
  $ Phi \( z \) = integral_0^z exp #h(-0.16667em) (integral_0^xi C_N \( eta \) thin d eta) d xi . $
  On the bounded solution range both $Phi'$ and its reciprocal are bounded.
    Writing $Y = Phi \( Z \)$, Equation (7.55) becomes
  $ \( Delta_g - c \( Z \) \) Y = O_j \( r^(- 3 - delta) \) \, wide c \( z \) =
    frac(3 \( e^(4 z) - 1 \) Phi' \( z \), 4 Phi \( z \)) \, wide c \( 0 \) = 3 . $
  The quotient is positive and bounded away from zero on this range.
    For $gamma = 1$, $Delta_g r^(- gamma) = - r^(- gamma) + o \( r^(- gamma) \)$;
    hence a large multiple of $r^(- 1)$ bounds both signs of $Y$ by the maximum principle,
    first on truncations whose outer value is zero and then in their limit.
    In particular $Z arrow.r 0$, so $c \( Z \) arrow.r 3$. For any $0 < gamma < 3$,
  $ \( Delta_g - c \( Z \) \) r^(- gamma) = \( gamma^2 - 2 gamma - 3 + o \( 1 \) \) r^(- gamma) \, $
  whose leading coefficient is negative. The same comparison proves $Y \, Z \, t = O \( r^(- gamma) \)$.
    Unit-patch estimates for the transformed equation, followed by differentiation and the already bounded coupled
    coefficients, prove the differentiated versions.
  Choose $gamma > \( 3 + delta \) \/ 2$. Lemma 75 now applies to Equation (7.55) and gives the scalar-curvature
    estimate, also after differentiation. In particular the penalty vanishes sufficiently far out.
    Proposition 74 applies with $s = gamma > 3 \/ 2$: all the exponent inequalities there follow from $kappa >
    2$ and $beta > 2$. This proves existence of the four limits and both stated flux identities. ◻
]

=== 7.9 The weighted divergence estimate <subsec:ah-mass-estimate>

#thm([Proposition 7.15.])[
  (Vanishing loss in the time flux).  #emph[The profiles can be chosen in the stated order so that the physical
    solutions satisfy
$ lim_(r arrow.r oo) integral_(S_r) g \( V_(*) \, nu_g \) thin d A_g gt.eq - o_N \( 1 \) . $

 Consequently $p_0 \( hat(g) \) lt.eq p_0 \( g \) + o_N \( 1 \)$.
   The error depends on the fixed prepared data and tends to zero as $N arrow.r oo$.]
] <prop:ah-mass-loss>

#proof[
  Use the primitive of Proposition 72. For brevity write
  $ frak(C) = tau A_R a sigma = frac(tau A_R, lambda l_0) v / sqrt(d) \, wide b_c =
    frac(1 - e^(- 2 t), 2) quad \( t gt.eq 0 \) . $
  The exact divergence is
  #[#set math.equation(numbering: n => "(7.56)")
   $ u^(- 1) "div" V_(*) = d_0 \( cal(T) + frak(C) \) + rho - m_0 n^(P_0) \( rho_0 + v \) + cal(R) \,
     $ <eq:ah-mass-divergence>]
  where $cal(R)$ is Equation (7.29). We estimate each of its terms.
    Every Young constant below depends only on a chosen fixed fraction of the positive terms;
    it does not depend on $N \, R$, or a classical bound for the solution.
  On $r lt.eq 2 R$ first set aside the additive term $4 Delta G_c$ in the ordinary-volume divergence.
    The bounded logarithmic derivatives of $n \, lambda$ give
  $ \| Delta G_c \| lt.eq C lambda \/ n \, wide integral_(r lt.eq 2 R) \| Delta G_c \| thin d V_g lt.eq C /
    N (1 + integral_1^(2 R) r^(2 - q) thin d r) lt.eq C / N . $
  Also, uniformly in this whole region,
  #[#set math.equation(numbering: n => "(7.57)")
   $ frac(\( 1 + log N + log \( 1 + r \) \)^2, n rho) = o_N \( 1 \) \, $ <eq:ah-weight-smallness>]
  since $q > 3 + delta$. This estimate includes the capped transition, where $n asymp N R^q$.
  ===== 7.9.1 Positive values beyond the transition in $t$, $r lt.eq 2 R$. <positive-values-beyond-the-transition-in-t-rle2r.>
  If $t gt.eq 1 \/ n$, then $p = 0 \, A = s$. Integrating the fixed profile on $0 lt.eq n t lt.eq
    1$ and differentiating in $log n$ through order two gives
  #[#set math.equation(numbering: n => "(7.58)")
   $ b_1 E_G = b_c E + O \( 1 \/ n \) \, wide b_1 s_G = b_c s + O \( 1 \/ n \) . $ <eq:ah-positive-primitive>]
  For example the primitive above $1 \/ n$ is $lambda { L_oo \( e^(2 t) - 1 \) \/ 2 + c \( n \) }$,
    where $L_oo > 0$ is independent of $n$ and $\| \( n partial_n \)^j c \( n \) \| lt.eq C_j \/ n$ for $j lt.eq
    2$. Division by $lambda L_oo e^(2 t)$ proves these bounds, including their uniformity for arbitrarily large $t$.
  Put $z = e^(2 t) gt.eq 1$. Direct factorization gives
  $ 3 \( e^(4 t) - 1 \) - 12 b_c - 36 b_c^2 = frac(3 \( z - 1 \)^3 \( z + 3 \), z^2) gt.eq 0 . $
  Since $E lt.eq 3$, the zero-derivative terms supply $36 b_c^2$. The principal $F$ error obeys
  $ 4 b_c \| s \( w \) F \| lt.eq 18 b_c^2 + 2 / 9 F^2 . $
  By Lemma 73 and $d_0 = 1 \/ 2$, the available $F^2$ coefficient is at least $1 \/ 3$.
    Thus strict fractions remain in both places. The $K$ term is at most $C b_c \| s \| \| K \|$,
    and is bounded by a small fraction of the remaining $b_c^2$, plus $C \| s \|^2 \| K \|^2$.
    The lapse smallness in Lemma 70 makes the latter an arbitrarily small fraction of $rho$.
    The errors in Equation (7.58) are bounded by a further small fraction of $cal(T)$, plus $C \/ n$;
    the terms containing $p$ are zero. Equation (7.57) absorbs this remainder in $rho$.
  ===== 7.9.2 The nonnegative transition band, $r lt.eq 2 R$. <the-nonnegative-transition-band-rle2r.>
  For $0 lt.eq t lt.eq 1 \/ n$,
  $ b_1 = O \( 1 \/ n \) \, wide \| s_G \| + \| E_G \| lt.eq C \, wide 0 lt.eq p lt.eq n . $
  The $F$ term costs $eta F^2 + C_eta \/ n^2$; the $K$ term costs $C \/ n$ since the prepared $K$ is bounded.
    For the axial and transverse derivative terms, respectively,
  $ b_1 p thin v sqrt(d) thin \| X_1 \| lt.eq eta \( p + 1 \) d X_1^2 + C_eta b_1^2 p \, wide
    b_1 p thin v \| y \| lt.eq eta \( p + 1 \) \| y \|^2 + C_eta b_1^2 p . $
  Their remainders are $O \( 1 \/ n \)$. The zero-derivative negative term has the same order;
    the cosmological term is nonnegative. Coercivity and Equation (7.57) absorb every cost.
  ===== 7.9.3 Negative $t$, $r lt.eq 2 R$. <negative-t-rle2r.>
  Write $X = - n t gt.eq 0$. Then
  $ G = frac(lambda e^(\( n + 2 \) t), n + 2) \, wide b_1 = frac(1, n + 2) \, wide \| s_G \| lt.eq
    C \( 1 + X \) \, wide \| E_G \| lt.eq C \( 1 + X \)^2 . $
  The first two derivative bounds follow by differentiating $log G = log lambda + \( n + 2 \) t -
    log \( n + 2 \)$ with $t$ fixed. The same Young estimates as above, now with $p = n$,
    show that all terms other than a small fixed fraction of $cal(T)$ cost
  $ C_eta frac(\( 1 + X \)^2, n) . $
  This includes the cosmological term, since $1 - e^(4 t) lt.eq 4 \| t \| = 4 X \/ n$.
    For $X lt.eq C_0 \( log N + log \( 1 + r \) \)$, Equation (7.57) absorbs the cost in $rho$.
  Choose the fixed $C_0$ larger than the exponents in $1 \/ tau \, lambda$, and the polynomial $X^2$.
    For larger $X$, if $v gt.eq 1 \/ 2$, the ratio of this cost to $frak(C)$ is bounded by
  $ C frac(lambda \( 1 + X \)^2 e^(- X), n tau A_R) \, $
  which is $o_N \( 1 \)$, uniformly in this region. If $v < 1 \/ 2$, then $d > 1 \/ 2$ and $u lt.eq
    C lambda e^(- X)$. After multiplication by $u$, the unabsorbed cost is at most $C lambda \/ n$,
    and its total integral on $r lt.eq 2 R$ is $O \( 1 \/ N \)$.
    These two alternatives account for all negative $t$ in this region.
  ===== 7.9.4 The capped tail, $r gt.eq 2 R \, med t gt.eq 0$. <the-capped-tail-rge2r-tge0.>
  Here $n = n_oo$, $s_G = A = s$, and $E_G = E lt.eq E_0$, where $E_0 = Delta lambda \/ lambda lt.eq 3$. Set
  $ gamma_c = frac(G_c, lambda L) = frac(1, \( n + 2 \) L) \, wide c = b_1 - gamma_c =
    frac(integral_0^t L \( z \) thin d z, L \( t \)) . $
  Since $p gt.eq 0$, $L' \/ L = p + 2 gt.eq 2$; therefore $0 lt.eq c lt.eq b_c$.
    Also $L gt.eq 1$, so $0 lt.eq gamma_c lt.eq 1 \/ \( n + 2 \)$. Combining the primitive and correction terms gives
  $ - 4 b_1 E + 4 sqrt(d) thin gamma_c E_0 = - 4 c E + 4 gamma_c \( sqrt(d) thin E_0 - E \) gt.eq - 12 b_c -
    C v \/ n . $
  For the last inequality use the exact expression for $E$ to bound $\| E - E_0 \| lt.eq C v$, and $1 -
    sqrt(d) lt.eq v$.
  Split the $F$ coefficient into $c + gamma_c$. The $c$ term is bounded by $18 b_c^2 + \( 2 \/ 9 \) F^2$,
    and the $gamma_c$ term costs a small remaining fraction of $F^2$, plus $C v \/ n^2$.
    The $K$ term containing $c$ is absorbed using the lapse smallness as before. Its $gamma_c$ part satisfies
  $ gamma_c a \| s \| \| K \| lt.eq eta rho + C_eta v \/ n^2 . $
  When $p = 0$ there are no further terms. When $p > 0$, necessarily $t < 1 \/ n$ and $b_1 = O \( 1 \/ n \)$;
    the two derivative terms cost $eta cal(T) + C_eta v \/ n$ by the preceding shifted-square estimates.
    Finally, on this tail,
  $ frac(tau A_R, lambda) gt.eq c tau \/ R \, wide l_0 lt.eq L_oo \, wide 1 / n_oo = o \( tau \/ R \) . $
  Thus every remaining $C v \/ n$ is absorbed by an arbitrarily small fixed fraction of $frak(C)$,
    using Equation (7.13).
  ===== 7.9.5 The capped tail, $r gt.eq 2 R \, med t < 0$. <the-capped-tail-rge2r-t0.>
  Put $x = \( n + 2 \) \| t \|$ and $X = n \| t \|$. The zero-gradient potential, including the centering correction, is
  #[#set math.equation(numbering: n => "(7.59)")
   $ P \( t \) = 3 \( e^(4 t) - 1 \) + frac(4 E_0, n + 2) \( e^x - 1 \) . $ <eq:ah-negative-tail-potential>]
  If $x lt.eq 1$, the inequalities $e^(- y) gt.eq 1 - y$ and $e^x gt.eq 1 + x + x^2 \/ 2$ give
  $ P \( t \) gt.eq frac(- 4 \( 3 - E_0 \) x + 2 E_0 x^2, n + 2) gt.eq - frac(2 \( 3 - E_0 \)^2, \( n + 2 \) E_0) . $
  Since $3 - E_0 = O \( r^(- 2) \)$, this is $O \( r^(- 4) \/ n \)$, hence $o_N \( 1 \) rho$ because $delta < 1$.
    For $x gt.eq 1$, $\( e^x - 1 \) \/ x gt.eq e - 1$, so the same linear bound for $e^(- 4 \| t \|)$ shows
    $P \( t \) gt.eq 0$ as soon as $E_0 \( e - 1 \) gt.eq 3$.
    This holds on the whole tail for all sufficiently large $N$.
  The difference from the zero-gradient potential is at most $C e^x v \/ n$, because $\| E - E_0 \| + \| 1 -
    sqrt(d) \| lt.eq C v$. The floor gives $e^x lt.eq e^(2 epsilon.alt) e^X lt.eq C e^X$.
    The $F$, axial, and transverse terms, after a small fraction of $cal(T)$, cost $C v \/ n$;
    the $K$ term costs a small fraction of $rho$, plus $C v \/ n^2$.
    All these residuals are at most $C e^X v \/ n$, which is absorbed by $frak(C) = \( tau A_R \/ lambda \) e^X
    v \/ sqrt(d)$. Again the required ratio is exactly $R \/ \( n_oo tau \) = o \( 1 \)$.
  We have proved that, away from the penalty, the integral of Equation (7.56) retains positive fixed fractions of
    $u rho \, u cal(T) \, u frak(C)$, up to an ordinary volume error with total integral $o_N \( 1 \)$.
  ===== 7.9.6 The penalty band. <the-penalty-band.>
  On its support,
  $ - epsilon.alt lt.eq t lt.eq - epsilon.alt + 1 \/ n \, wide l_0 asymp e^(- epsilon.alt n) \, wide
    e^(2 t) asymp 1 \, $
  with constants independent of $N$. On $n < 2 N$, which is a fixed compact region, $lambda \,
    A_R$ and the weights are bounded, and $l_0 lt.eq C ell$. With a fixed polynomial $P \( N \)$, the definitions imply
  $ u thin m_0 n^(P_0) \( rho_0 + v \) lt.eq P \( N \) \( ell + ell^2 sigma \) lt.eq eta thin u frak(C) +
    P \( N \) \( ell + ell^2 \/ tau \) . $
  For the last inequality use the exact identity $u frak(C) =
    e^(2 t) tau A_R l^2 sigma^2$ and apply Young before replacing $l_0$ by its upper bound.
    Thus the integrated remaining cost on this fixed compact region is at most
  $ P \( N \) \( N^(- B_0) + N^(- 3 B_0 \/ 4) \) = o_N \( 1 \) $
  once $B_0$ exceeds the fixed polynomial exponents.
  On $n gt.eq 2 N$, compare the penalty’s $v$ term directly with the capillary term. Their quotient is at most
  $ frac(lambda n^(P_0) e^(- epsilon.alt n), tau A_R) . $
  This tends to zero uniformly. To see the order without using $n_oo$ as an uncontrolled polynomial constant,
    put $y = n \/ N gt.eq 2$. Before capping, $lambda \/ A_R lt.eq C y^(1 \/ q)$;
    after capping the same bound holds with $y = n_oo \/ N$, since $lambda \/ A_R asymp R$.
    The displayed quotient is therefore bounded by
  $ C N^(P_0 + 5 B_0 \/ 4) thin y^(P_0 + 1 \/ q) N^(- B_0 y) . $
  For large $N$ this is decreasing in $y gt.eq 2$, with maximum $O \( N^(P_0 - 3 B_0 \/ 4) \)$.
    Increasing $B_0$ makes it vanish. The $rho_0$ term is treated the same way where $v gt.eq 1 \/ 2$,
    since $rho_0$ is bounded. Where $v < 1 \/ 2$, use $d > 1 \/ 2$: its ordinary-volume cost is at most
  $ C lambda rho_0 thin n^(P_0) e^(- epsilon.alt n) . $
  The supremum of its final factor for $n gt.eq 2 N$ tends to zero, and $integral lambda rho_0 thin d V_g < oo$.
    This proves the required $o_N \( 1 \)$ total penalty loss.
  ===== 7.9.7 The inner boundary. <the-inner-boundary.>
  The correction leaves $V_(*) = V$ on every inner collar. On a physical face,
  $ V_nu \/ u = - \( 1 - a \) H - N_B d gt.eq - C d \, wide sqrt(d) lt.eq C tau \/ ell . $
  Thus the negative boundary integral is at most $C \( tau \/ ell \) integral_(partial Omega) L$.
    Equation (7.48), with a constant test and a fixed collar cutoff, bounds it by
  $ P \( N \) tau / ell integral_(cal(C)) u \( rho + delta_0 cal(T) \) thin d V_g . $
  Here $rho$ has a fixed positive minimum on the collars. Since $tau \/ ell = N^(- B_0 \/ 4)$,
    choosing $B_0$ larger than these fixed polynomial exponents absorbs this loss in the positive fractions
    already retained.
  The parameter order is now complete: $delta_0$ and $P_0$ were fixed by the floor;
    choose $B_0$ larger than the finitely many compact polynomial requirements,
    and then choose $a$ by Equation (7.12). No estimate used a polynomial bound for a fixed-profile Schauder
    constant or for $n_oo$. Apply the divergence theorem on finite exterior domains.
    With $nu$ pointing into the exterior at inner faces it gives
  $ integral_(S_r) g \( V_(*) \, nu_g \) thin d A_g = integral_(Omega ∩ { r' lt.eq r }) "div" V_(*) thin d V_g +
    integral_(partial Omega) V_nu thin d A_g . $
  The preceding estimates give a lower bound $- o_N \( 1 \)$ after dropping the remaining nonnegative integrals.
    Lemma 81 supplies the limiting outer flux, so the asserted estimate follows.
    Its mass consequence has the stated sign by Equation (7.37). ◻
]

=== 7.10 The full-cut inequality and the invariant mass <subsec:ah-conclusion>

#proof[
  Fix one prepared data set and the compact black–white exterior used in the construction.
    Every full enclosing cut in this smaller exterior is a full enclosing cut in the prepared original exterior.
    Since $t gt.eq - epsilon.alt$ and the graph term is nonnegative, $hat(g) gt.eq e^(- 4 epsilon.alt) g$.
    On each tangent two-plane its area density is therefore at least $e^(- 4 epsilon.alt)$ times the $g$-density.
    Taking the infimum over all full cuts gives
  $ A_min \( partial hat(Omega) \; hat(g) \) gt.eq e^(- 4 epsilon.alt) A_min \( S \; g \) . $
  This comparison uses the entire intrinsic boundary of each cut,
    including the original boundary when the exterior itself is chosen.
  By Proposition 80 and Lemma 81, $\( hat(Omega) \, hat(g) \, 0 \)$ has one complete AH end with the required
    tensor-norm decay and weighted scalar-curvature integrability, all four finite metric fluxes,
    scalar curvature at least $- 6$, and strictly mean-negative boundary.
    Thus the time-symmetric case of Theorem 10 applies in the designated chart,
    irrespective of the causal character of its flux covector. Together with Proposition 82, it gives
  $ p_0 \( g \) + o_N \( 1 \) gt.eq p_0 \( hat(g) \) gt.eq
    sqrt(frac(e^(- 4 epsilon.alt) A_min \( S \; g \), 16 pi))
    (1 + frac(e^(- 4 epsilon.alt) A_min \( S \; g \), 4 pi)) . $
  Send $N arrow.r oo$; then $epsilon.alt = B_0 log N \/ N arrow.r 0$.
    Finally remove the strict preparation using Lemma 69, which preserves the four metric flux limits and the
    full-cut infimum. This proves Equation (7.1). ◻
]

#thm([Theorem 7.16.])[
  (The AH mass inequality).  #emph[If the metric flux covector of the data in Theorem 68 is future timelike, then
$ m_(upright("AH")) := sqrt(p_0^2 - p_1^2 - p_2^2 - p_3^2) gt.eq
  sqrt(frac(A_min \( S \; g \), 16 pi)) (1 + frac(A_min \( S \; g \), 4 pi)) . $

]
] <thm:ah-invariant>

#proof[
  The four static potentials form the defining Lorentz representation of the orientation and time-orientation
    preserving hyperbolic isometry group. The metric flux is linear in the potential.
    Consequently, composing the designated end chart with such an isometry acts on its four components by the
    corresponding Lorentz transformation. This follows directly by changing variables in the flux formula:
    the background metric and its connection are preserved, and the replacement sphere exhaustion has the same
    limit because the weighted scalar-linearization divergence is absolutely integrable.
    The quadratic remainder is integrable under the stated decay exponent $> 3 \/ 2$.
    The tensor decay and weighted integrability conditions persist,
    since two radial functions related by a fixed hyperbolic isometry are comparable far out.
  A future timelike covector admits a proper future Lorentz transformation taking it to
    $\( m_(upright("AH")) \, 0 \, 0 \, 0 \)$. Apply Theorem 68 in this chart.
    The geometry of the exterior, its future boundary signs, and its intrinsic full-cut area infimum have not
    changed. This proves the assertion. Only a hyperbolic change of spatial end coordinates was used. ◻
]

This completes the proof of Theorem 1.

== 8 First variations of equality and the original-data adjoint <eq-section>

In this section $S$ is connected, is an outermost future MOTS, and is outer area-minimizing in the full-cut sense.
  We assume equality in Theorem 83. All variations below are variations of the original pair $\( g \, K \)$ on the
  original manifold $Omega$. Nearby data need satisfy only the hypotheses of the numerical inequality;
  their boundaries need not remain outermost or area-minimizing.
  Here $tau$ again denotes the original asymptotically hyperbolic decay exponent in Definition 3.

Choose a balanced spatial chart, so that $p_0 = m_(upright("AH"))$ and $p_i = 0$ at the data under consideration. Put

#[#set math.equation(numbering: n => "(8.1)")
 $ A = "Area"_g \( S \) \, wide r_h = sqrt(A \/ \( 4 pi \)) \, wide c = 16 pi frac(d, d A) frac(r_h + r_h^3, 2) =
   frac(1 + 3 r_h^2, r_h) \, wide kappa_h = c / 2 . $ <eq-area-constant>]

The fixed-chart time component is a supporting functional for the Lorentz norm of a future-timelike covector.
  Consequently the numerical inequality gives, for all sufficiently small admissible variations,

#[#set math.equation(numbering: n => "(8.2)")
 $ p_0 \( g_s \) med gt.eq med m_(upright("AH")) \( g_s \) med gt.eq med
   frac(r_(A \( s \)) + r_(A \( s \))^3, 2) \, wide r_(A \( s \)) =
   sqrt(A \( s \) \/ \( 4 pi \)) . $ <eq-supporting-inequality>]

Here $A \( s \)$ is the minimum full enclosing area for $g_s$. Equality holds throughout at $s = 0$.
  Only spatial chart covariance is used in choosing the balanced chart.

#thm([Theorem 8.1.])[
  (Causal Killing data produced by equality).  #emph[There are a smooth function $u$ and a smooth vector field $X$
    on the one-sided manifold $Omega$ with the following properties:]
  + #emph[$u gt.eq \| X \|_g$ everywhere and $u > 0$ in $"int" Omega$. For some $3 \/ 2 < beta < min { 2 \, tau }$,
#[#set math.equation(numbering: n => "(8.3)")
 $ u - V_0 = O_(2 \, alpha') \( r^(1 - beta) \) \, wide X = O_(2 \, alpha') \( r^(1 - beta) \) $ <eq-end-normalization>]

 in background tensor norm, with $0 < alpha' < alpha$.]
  + #emph[In the interior, and by continuity at the boundary,
#[#set math.equation(numbering: n => "(8.4)")
 $ "sym" nabla X & = - u K \,\
Delta u - 3 u & = - "div"_g \( K \( X \, dot.op \)^sharp \) \,\
"Hess"_g u & = u \( "Ric"_g + 3 g + \( "tr"_g K \) K - 2 K^2 \) - cal(L)_X K + 8 pi X_(\( i) J_(j \)) . $ <eq-shift>]

 Symmetrization includes averaging. Moreover $u mu + J \( X \) = 0$.]
  + #emph[On $bb(R) times "int" Omega$, the metric
#[#set math.equation(numbering: n => "(8.5)")
 $ upright(bold(g)) = - u^2 d t^2 + g_(i j) \( d x^i + X^i thin d t \) \( d x^j + X^j thin d t \)
   $ <eq-stationary-metric>]

 induces precisely the original $g$ and the original $K$ on $t = 0$, with future normal $n =
   u^(- 1) \( partial_t - X \)$. Writing $xi = partial_t$ and $N = u^2 - \| X \|_g^2$, one has
#[#set math.equation(numbering: n => "(8.6)")
 $ "Ric"_(upright(bold(g))) = - 3 upright(bold(g)) + 8 pi mu u^(- 2) xi^flat ⊗ xi^flat \, wide mu N =
   0 . $ <eq-null-matter>]

]
  + #emph[For the normal $nu$ pointing into the exterior,
#[#set math.equation(numbering: n => "(8.7)")
 $ X = u nu \, wide partial_nu u + K \( X \, nu \) = kappa_h quad upright("on ") S . $ <eq-horizon-data>]

 Either $u > 0$ on all of $S$, or $u = 0$ on all of $S$.]
] <eq-causal-killing>

We prove the theorem without assuming a stationary development.
  The Lorentzian metric in its statement will be constructed only after the multiplier fields have been obtained
  and shown to be smooth and positive.

=== 8.1 The envelope derivative for full enclosing area <the-envelope-derivative-for-full-enclosing-area>

Extend $g$ smoothly across a short collar of $S$, and fix the entire inner side of that collar as an obstacle.
  This auxiliary extension is used only for perimeter minimization. It is not required to satisfy constraints.
  Minimize among bounded filled sets containing the obstacle,
  taking perimeter in the extended open collar and the original exterior.
  Thus the obstacle itself has boundary $S$ and perimeter $"Area"_g \( S \)$:
  the convention does not erase $S$ when the exterior competitor is $D = Omega$.

Bounded complementary pockets can be filled. Their removal from the exterior component cannot increase perimeter,
  and any nonempty pocket of a regular minimizer would contribute removable positive perimeter.
  The remaining complement is the connected exterior containing the end.
  Conversely, every full cut in the original definition gives a filled competitor in this formulation.
  A compact $C^(1 \, 1)$ obstacle boundary can be pushed slightly into the exterior by a collar vector field and
  then smoothed in graph charts. These operations preserve separation and make its areas converge.
  The perimeter infimum therefore equals the infimum over the smooth full cuts of Definition 4.

Let $cal(M)$ denote the family of boundaries attaining this perimeter infimum for $g$.

#thm([Lemma 8.2.])[
  (Compact minimizing family and area derivative).  #emph[Let $g_s$ be a smooth metric path through $g$,
    with its first two parameter derivatives bounded relative to $g$,
    and with a common asymptotically hyperbolic $C^(2 \, alpha')$ bound of positive decay.
    Then, after restricting the parameter interval, the minimizing boundaries for $g_s$ lie in a common compact
    set. The family $cal(M)$ is compact for indicator $L^1$ convergence and tangent-plane area-measure
    convergence. If $H = dot(g)_0$, then
#[#set math.equation(numbering: n => "(8.8)")
 $ frac(d, d s)\|_(0 +) A \( s \) = min_(T in cal(M)) a'_T \( H \) \, wide a'_T \( H \) = 1 /
   2 integral_T "tr"_T H thin d A_g . $ <eq-area-derivative>]

 Off the obstacle, minimizing boundaries that meet have the same tangent plane.
   This common plane is continuous on their union locally away from $S$.]
] <eq-area-envelope>

#proof[
  Large coordinate spheres have mean curvature $2 + o \( 1 \)$, uniformly for these paths.
    Fix a radius beyond which this mean curvature is positive and the obstacle is absent.
    On a larger compact truncation, the direct method for perimeter gives an obstacle minimizer.
    Its boundary cannot have a maximal radius in the strictly mean-convex region:
    at a free maximum it is minimal and lies on the inner side of a strictly mean-convex coordinate sphere,
    in contradiction with the local comparison principle. Contact with the outer truncation can likewise be moved
    inward to lower area. Thus every such minimizer lies inside the same fixed radius.
    Truncations containing any prescribed smooth competitor show that their minimum is the full infimum.
  The local obstacle regularity theorem #cite(label("huiskenilmanen2001")) Regularity Theorem 1.3(iii) applies
    here to pure perimeter, a smooth obstacle, a smooth metric and ambient dimension three.
    It gives $C^(1 \, 1)$ boundaries and smooth minimal free parts.
    Part (iii) is used for this individual regularity. For a fixed $0 < alpha_0 lt.eq 1 \/ 2$,
    the local $C^(1 \, alpha_0)$ estimates in Part (ii) are uniform:
    the obstacle bounds and positive metric $C^1$ bounds are uniform for the family $g_s$.
  Only away from $S$ do we need density estimates. Here is a local proof with uniform constants.
    In a sufficiently small ball centered at a boundary point,
    compare a minimizing set $E$ with $E \\ B_rho$ and $E union B_rho$,
    filling any unnecessary pockets afterwards. The ball misses the obstacle.
    For $f \( rho \) = "Vol" \( E ∩ B_rho \)$, minimality and coarea give, for almost every $rho$,
  $ P \( E \; B_rho \) lt.eq f' \( rho \) \, wide P \( E ∩ B_rho \) lt.eq 2 f' \( rho \) . $
  Uniform local isoperimetry implies $f' \( rho \) gt.eq c f \( rho \)^(2 \/ 3)$, hence $f \( rho \) gt.eq
    c rho^3$. The same argument applies to the complement. Relative isoperimetry then gives $P \( E \; B_rho \)
    gt.eq c rho^2$; the comparison above and the uniform sphere-area bound give $P \( E \; B_rho \) lt.eq
    C rho^2$. These constants are uniform on compact sets disjoint from $S$.
    Perimeter compactness now gives subsequential indicator convergence.
    Lower semicontinuity, together with testing a fixed minimizer, gives convergence of perimeters,
    including for varying metrics.
  Here is the measure-continuity detail needed for differentiation.
    In a fixed orthonormal frame let $D chi_(E_j)$ be the vector normal measures.
    Their weak convergence and convergence of total variations imply weak convergence of their variation measures:
    any weak limit dominates $\| D chi_E \|$, and equality of total masses eliminates the excess.
    Approximate the limiting unit normal in the square-integral norm of this measure by continuous vector fields.
    For such a field $v$, expand
  $ integral \| nu_j - v \|^2 thin d \| D chi_(E_j) \| = integral \( 1 + \| v \|^2 \) thin d \| D chi_(E_j) \| -
    2 integral v dot.op d D chi_(E_j) . $
  Both terms converge. Continuous approximation and uniform continuity then give convergence for every continuous
    function of position and unit normal, and hence for functions of the unoriented tangent plane.
    A partition of unity proves the assertion globally. Uniform metric convergence converts varying-metric
    perimeters to this fixed-metric argument.
  On every rectifiable cut of bounded area, the area-element expansion is uniform:
  #[#set math.equation(numbering: n => "(8.9)")
   $ "Area"_(g_s) \( T \) = "Area"_g \( T \) + s thin a'_T \( H \) + O \( s^2 \) "Area"_g \( T \) . $ <eq-area-taylor>]
  A fixed minimizing cut gives the upper one-sided bound in (8.8).
    For the lower bound take minimizers $T_s$ for $g_s$, pass along any sequence $s arrow.b 0$ to a member $T in
    cal(M)$, and use
  $ frac(A \( s \) - A \( 0 \), s) gt.eq a'_(T_s) \( H \) + O \( s \) arrow.r a'_T \( H \) . $
  Compactness and continuity of $a'_T \( H \)$ prove the formula.
  Finally, the union and intersection of two filled minimizing sets remain obstacle competitors.
    Perimeter submodularity gives
  $ P \( E_1 union E_2 \) + P \( E_1 ∩ E_2 \) lt.eq P \( E_1 \) + P \( E_2 \) = 2 A . $
  Both terms on the left are at least $A$, so both are minimizers.
    Different tangent planes at an intersection would give a corner in one of them,
    contradicting interior regularity. To check continuity on the union,
    take points on a sequence of minimizers converging away from the obstacle.
    The two phase-volume density bounds prevent disappearance of the limiting point under indicator convergence,
    so it lies on a limiting minimizer. The uniform local $C^(1 \, alpha_0)$ estimates and strict perimeter
    convergence then give tangent-plane convergence there. The common-plane property makes this independent of the
    chosen sequence. ◻
]

=== 8.2 A strict direction and the asymptotic test generators <a-strict-direction-and-the-asymptotic-test-generators>

Use the fixed unit ball bundle

$ cal(B) = { \( x \, v \) : x in Omega \, med \| v \|_g lt.eq 1 } \, wide cal(C) \( x \, v \) =
  16 pi \( mu \( x \) + J_x \( v \) \) \, wide cal(Z) = { cal(C) = 0 } . $

In a metric variation $g_s \( dot.op \, dot.op \) = g \( A_s dot.op \, dot.op \)$, transport $v$ by $v_s =
  A_s^(- 1 \/ 2) v$. This preserves its length and gives

#[#set math.equation(numbering: n => "(8.10)")
 $ dot(v)_0 = - 1 / 2 H^sharp v . $ <eq-vector-transport>]

Every constraint derivative below includes this term.

#thm([Lemma 8.3.])[
  (Strict conformal direction).  #emph[Choose $3 \/ 2 < beta < min { 2 \, tau }$ and $0 < delta < min { 1 \,
    2 beta - 3 }$. There are smooth positive weights $w \, w_2 \, D$, with $w = r^(- 3 - delta)$, $w_2 =
    r^(- beta)$ on a far end and $D = O \( r^(- beta) \)$, $D gt.eq \| K \|$, and a smooth function $phi.alt =
    O_(2 \, alpha') \( r^(- beta) \)$, such that
#[#set math.equation(numbering: n => "(8.11)")
 $ \( - Delta + 3 \) phi.alt & = D sqrt(w_2^2 + \| d phi.alt \|^2) + w \, & partial_nu phi.alt & = -
   1 . $ <eq-strict-solve>]

 It has finite fluxes against all four static potentials. In particular,
$ \( - Delta + 3 \) phi.alt gt.eq \| K \| \| d phi.alt \| + w \, wide frac(\( - Delta + 3 \) phi.alt, w) arrow.r 1 . $

 For $Q = \( 4 phi.alt g \, 2 phi.alt K \)$, on the active set one has
#[#set math.equation(numbering: n => "(8.12)")
 $ cal(C)'_Q = 8 #scale(x: 120%, y: 120%)[\(] \( 3 - Delta \) phi.alt +
   K \( v \, nabla phi.alt \) #scale(x: 120%, y: 120%)[\)] \, quad cal(C)'_Q \/ w arrow.r 8 \, quad theta'_Q = -
   4 med upright("on ") S . $ <eq-strict-tests>]

]
] <eq-strict-direction>

#proof[
  Solve (8.11) on spherical truncations with outer Dirichlet value zero.
    Continue both the source and the inner Neumann value from zero.
    The gradient term can be written $b dot.op d phi.alt + f$, where
  $ \| b \| lt.eq D \, wide 0 lt.eq f lt.eq D w_2 + w . $
  The operator is consequently $- Delta - b dot.op nabla + 3$.
    A fixed collar function supplies the prescribed outward Neumann derivative, which is $+ 1$;
    adding a sufficiently large constant dominates its bounded compactly supported derivatives and the source.
    The maximum principle gives a bound independent of the truncation and continuation parameter. Beyond a fixed sphere,
  $ \( 3 - Delta_b \) r^(- beta) = \( 3 - beta \) \( 1 + beta \) r^(- beta) + O \( r^(- beta - 2) \) . $
  The decaying drift and metric errors preserve its positive leading coefficient.
    Comparison with a multiple of this function, using the already bounded value on the fixed sphere and zero
    outer data, gives $\| phi.alt \| lt.eq C r^(- beta)$.
  Lemma 119, followed by Sobolev embedding and the one-sided Schauder estimate,
    gives the same weighted bound through two derivatives. At the fixed inner face use the corresponding Neumann
    estimates. The linearized equation has bounded drift, zeroth-order coefficient $3$,
    homogeneous Neumann data at the inner face and homogeneous Dirichlet data at the outer face.
    Its kernel is zero by the maximum principle, so the usual elliptic Fredholm alternative makes it invertible.
    The a priori estimates close the method of continuity on each truncation.
    Exhaustion and local compactness then produce the asserted decaying solution,
    smooth on compact sets including the one-sided boundary.
  The additional source is $O \( r^(- 2 beta) \) = o \( w \)$, proving the ratio claim.
    Replacing $Delta_g$ by $Delta_b$ costs $O \( r^(- tau - beta) \)$.
    Both this error and $r^(- 2 beta)$ have finite integrals with weight $V_0 thin d V_b$, as does $w$.
    The scalar linearization identity
  $ "div"_b bb(U) \( V \, 4 phi.alt b \) = 8 V \( 3 - Delta_b \) phi.alt \, wide "Hess"_b V = V b \, $
  therefore proves existence of all the conformal fluxes. Replacing $b$ by $g$ in $4 phi.alt
    b$ costs order $r^(- tau - beta)$, beyond the mass order.
  For the exact conformal transformation $g_s = e^(4 s phi.alt) g$, $K_s = e^(2 s phi.alt) K$,
    direct differentiation gives
  $ cal(C)'_Q = - 4 phi.alt cal(C) + 8 \( \( 3 - Delta \) phi.alt + K \( v \, nabla phi.alt \) \) . $
  The first term vanishes on $cal(Z)$. The expansion transforms as $theta_s =
    e^(- 2 s phi.alt) \( theta + 4 s partial_nu phi.alt \)$; since $theta = 0$ on $S$, its derivative is $- 4$. ◻
]

In addition to $Q$, take all compact variations, including arbitrary one-sided jets at $S$,
  and the following end variations, cut off near the compact interior:

+ $\( 4 psi g \, 2 psi K \)$, where $psi = r^(- 3) f \( omega \)$ and $f in C^oo \( bb(S)^2 \)$;
+ pure tensor variations $\( 0 \, P \)$ whose trace reversal with respect to $b$ has only mixed block
  $ \( P - \( "tr"_b P \) b \)_(nu_b A) = r^(- 3) W_A \( omega \) $
  in radial and spherical orthonormal scaling, for arbitrary smooth one-forms $W$ on $bb(S)^2$.

Their constraint derivatives are $o \( w \)$ on the active rays.
  Indeed the conformal radial indicial term cancels, leaving an $O \( r^(- 5) \)$ background scalar term and
  products with the decaying original coefficients. For the mixed block, its radial derivative is $-
  3 \( V_0 \/ r \) r^(- 3) W_A$; the sphere connection terms give $+ 3 \( V_0 \/ r \) r^(- 3) W_A$.
  Thus its tangential background divergence is zero, while its normal divergence is $r^(- 4) "div"_sigma W$.
  Metric and tensor errors cost $O \( r^(- 3 - tau) \)$. The choice $delta < 1$ proves the assertion.

Let $cal(V)$ be the real linear space generated by these tests.
  The coefficient $a \( H \, P \)$ of $Q$ is well defined even if $cal(Z)$ is compact.
  Indeed, on the full unit ball bundle, $cal(C) = O \( r^(- tau) \)$, uniformly in $v$,
  and the conformal identity in the preceding proof gives

$ cal(C)'_Q / w = 8 + o \( 1 \) - frac(4 phi.alt cal(C), w) = 8 + o \( 1 \) . $

Here $tau + beta > 2 beta > 3 + delta$, so the last term tends to zero.
  The other generators have normalized full-ball derivative tending to zero by the same end calculations (and
  compact variations vanish there). Applying these limits to any linear relation among the generators forces the
  coefficient of $Q$ to vanish. The active-ray statement is its restriction when active rays exist.

=== 8.3 Positive separation of the active constraints <positive-separation-of-the-active-constraints>

#thm([Lemma 8.4.])[
  (Multiplier identity).  #emph[There are a probability measure $omega$ on $cal(M)$,
    a nonnegative finite measure $eta$ on $S$, a nonnegative locally finite measure $frak(L)$ on $cal(Z)$,
    and $z gt.eq 0$, such that $w frak(L)$ is finite and
#[#set math.equation(numbering: n => "(8.13)")
 $ 16 pi p'_0 - c integral_(cal(M)) a'_T \( H \) thin d omega \( T \) = chevron.l cal(C)' \, frak(L) chevron.r -
   chevron.l theta' \, eta chevron.r + z thin a \( H \, P \) $ <eq-multiplier-identity>]

 for every $\( H \, P \) in cal(V)$.]
] <eq-separation>

#proof[
  Compactify $cal(Z)$ by one point, collapsing all rays whose base points escape compact sets; if it was compact,
    add an isolated point. The ball fibers are compact. The functions $cal(C)' \/
    w$ extend continuously with value $8 a \( H \, P \)$. On the disjoint compact union of this space, $S$,
    and $cal(M)$, consider the linear test map
  #[#set math.equation(numbering: n => "(8.14)")
   $ \( H \, P \) mapsto #scale(x: 120%, y: 120%)[\(] cal(C)' \/ w \, med - theta' \, med c thin a'_T \( H \) -
     16 pi p'_0 #scale(x: 120%, y: 120%)[\)] . $ <eq-test-map>]
  Lemma 85 supplies continuity on the last piece.
  Suppose its image contained a function positive everywhere. Write its direction as $a Q + \( H_0 \, P_0 \)$.
    Positivity at the additional point gives $a > 0$. Realize the direction by
  $ g_s = e^(4 a s phi.alt) \( g + s H_0 \) \, wide K_s = e^(2 a s phi.alt) \( K + s P_0 \) . $
  These metrics remain positive and uniformly comparable to $g$.
    On the far end, retain the nonnegative background constraint with its positive conformal scaling factor.
    The remaining terms have the following bounds, uniformly over the unit ball:
  $ upright("term") & upright("size")\
upright("strict conformal gain") & 8 a s w\
upright("non-strict linear changes") & s thin o \( w \)\
upright("new quadratic and cross terms") & O \( s^2 w \) . $
  For clarity, the non-strict end metric and tensor tests are $O \( r^(- 3) \)$,
    their background constraint terms are $O \( r^(- 4) \) + O \( r^(- 3 - tau) \)$,
    and their products with the strict direction are $O \( r^(- 3 - beta) \)$.
    The strict direction’s own quadratic errors are $O \( r^(- 2 beta) \)$. All are controlled by $w$.
    Applying the exact conformal law after the intermediate variation gives these bounds without differentiating
    the nonnegative original constraint into an uncontrolled error.
    One may compose the two isometries of unit balls in this calculation:
    at an active unit ray a difference of isometric identifications is tangent to the unit sphere and is
    annihilated by $J$; at a vacuum ray $J = 0$.
  On the remaining compact ball bundle, positivity of the derivative on the closed active set persists on a
    neighborhood of it. The original constraint has a positive minimum on the compact complement.
    Taylor’s formula thus gives the DEC for sufficiently small $s > 0$ everywhere.
    The boundary has strictly negative future expansion. The same estimates are integrable with weight $V_0$,
    and the flux divergence identity proves differentiability of all four fluxes.
    The covector remains future timelike by continuity. Thus (8.2) applies to this path.
  Positivity on $cal(M)$, however, says
  $ c min_(T in cal(M)) a'_T \( H \) - 16 pi p'_0 > 0 . $
  By Lemma 85 and (8.1), the right derivative at zero of the difference in (8.2) is negative.
    That difference is initially zero and is nonnegative for $s > 0$, a contradiction.
  The image of (8.14) is therefore disjoint from the open positive cone of continuous functions.
    Hahn–Banach separation gives a nonzero continuous functional,
    nonnegative on nonnegative functions and annihilating this linear image.
    The Riesz Representation Theorem gives finite nonnegative measures on its three compact pieces.
    The objective piece has positive mass: otherwise evaluation on $Q$, strictly positive on both other pieces,
    would contradict annihilation. Normalize that mass to one.
    Divide the finite measure on finite active rays by $w$ and call it $frak(L)$;
    absorb eight times the end-point atom into $z$. Rearranging the identity gives (8.13). ◻
]

Define the first moments, initially as measures with the fixed-volume distribution convention, by

$ chevron.l u \, f chevron.r = integral f \( x \) thin d frak(L) \( x \, v \) \, wide chevron.l X \,
  alpha chevron.r = integral alpha_x \( v \) thin d frak(L) \( x \, v \) . $

Positivity and activity give

#[#set math.equation(numbering: n => "(8.15)")
 $ u gt.eq \| X \|_g \, wide u mu + J \( X \) = 0 $ <eq-measure-complementarity>]

as measure identities and inequalities.

=== 8.4 Removing the interior area multipliers <removing-the-interior-area-multipliers>

#thm([Lemma 8.5.])[
  (Normal slice tests).  #emph[For every $s in C_c^oo \( "int" Omega \)$,
    there are compact variations $\( H_epsilon.alt \, P_epsilon.alt \)$ with $H_epsilon.alt = 2 s K$,
    supported in one fixed compact set, whose active-ray constraint derivatives tend uniformly to zero.]
] <eq-normal-tests>

#proof[
  On a compact neighborhood of the support, choose a Gaussian Lorentzian collar
  $ upright(bold(g))_epsilon.alt = - d t^2 + g_epsilon.alt \( t \) \, wide g_epsilon.alt \( 0 \) = g \, quad
    partial_t g_epsilon.alt \( 0 \) = 2 K . $
  Prescribe its second time jets so that
  $ frac(1, 8 pi) \( G_(upright(bold(g))_epsilon.alt) - 3 upright(bold(g))_epsilon.alt \)_(i j) =
    D_(epsilon.alt \, i j) \, wide D_epsilon.alt = frac(J ⊗ J, mu + epsilon.alt) quad upright("at ") t = 0 . $
  The spatial Einstein tensor depends on the freely chosen normal derivative of $K$ by a nonzero multiple of trace
    reversal. In dimension three trace reversal has eigenvalues $1$ and $- 2$; it is invertible.
    The remaining terms are fixed spatial jets. Thus these smooth second jets can be prescribed,
    and a quadratic time extension with a cutoff realizes a smooth Lorentzian metric on a sufficiently short
    collar. The normal and mixed components of the displayed tensor are $mu \, J$, by the constraints.
  Set $D = J ⊗ J \/ mu$ where $mu > 0$, and set it to zero at vacuum. The DEC gives
  $ \| D_epsilon.alt \| lt.eq mu \, wide \| nabla D_epsilon.alt \| lt.eq 2 \| nabla J \| + \| nabla mu \| . $
  At a zero of the smooth nonnegative function $mu$, its differential vanishes; $\| J_i \| lt.eq
    mu$ then gives $d J_i = 0$ there also. The displayed derivative bound proves that $D$ is $C^1$ across vacuum
    with zero derivative there. Splitting any compact set into ${ mu gt.eq
    delta }$ and ${ mu < delta }$ proves $D_epsilon.alt arrow.r D$ in $C^1$.
  Vary the slice by graphs $t = a s \( x \)$, differentiating at $a = 0$. The metric derivative is $2 s K$.
    At a nonvacuum active ray, $mu = \| J \|$, $v = - J^sharp \/ mu$, and $zeta = n + v$ is null.
    The limiting prescribed stress has the form
  $ mu^(- 1) gamma ⊗ gamma \, wide gamma \( n \) = mu \, quad gamma \|_(T Omega) = J \, quad gamma \( zeta \) = 0 . $
  The covector $gamma$ is nonnegative on future causal vectors.
    Parallel transport $zeta$ in any spatial direction using the spacetime connection.
    Its contraction with $gamma$ is nonnegative and has a zero, so its derivative there is zero.
    Consequently the spatial covariant derivatives of the limiting stress, contracted in one slot with $zeta$, vanish.
  Let $T_epsilon.alt = \( G_(upright(bold(g))_epsilon.alt) - 3 upright(bold(g))_epsilon.alt \) \/ \( 8 pi \)$.
    Contracted Bianchi, before taking the limit, gives
  $ \( nabla_n T_epsilon.alt \) \( n \, zeta \) = sum_i \( nabla_(e_i) T_epsilon.alt \) \( e_i \, zeta \) . $
  The right side tends to zero by the compact $C^1$ convergence just proved.
    Thus the required normal derivative of the constraint combination tends to zero too.
    Differentiating its arguments causes no additional limiting term:
    the first argument is paired against a tensor with $zeta$ in its kernel, and the second argument remains null;
    at activity $gamma$ is proportional to $zeta^flat$, so nullity kills its differentiated contraction.
    At vacuum the tensor and its spatial derivatives vanish, and Bianchi gives the same conclusion for every
    vector in the closed unit ball. All expressions use only the fixed compact jets and $D_epsilon.alt \,
    nabla D_epsilon.alt$; the convergence is uniform, including near vacuum. ◻
]

#thm([Lemma 8.6.])[
  (Concentration on the original horizon).  #emph[The measure $omega$ in Lemma 87 is concentrated on the single
    cut $S$.]
] <eq-area-concentration>

#proof[
  Apply Lemma 88 in (8.13). Mass, expansion and end-point terms are zero.
    The constraint measure is finite over the fixed compact support, so the limit gives
  $ integral_(cal(M)) integral_T s thin "tr"_T K thin d A_g thin d omega \( T \) =
    0 wide \( s in C_c^oo \( "int" Omega \) \) . $
  Off $S$, form the positive aggregate area measure $frak(b) = integral_(cal(M)) d A_T thin d omega \( T \)$.
    Lemma 85 makes $F \( x \) = "tr"_(Pi \( x \)) K \( x \)$, for the common tangent plane $Pi \( x \)$,
    a single continuous function on the union of the cuts locally away from $S$.
    The last identity is $F frak(b) = 0$. Fubini on a countable compact exhaustion shows that,
    for $omega$-almost every cut, $"tr"_T K = 0$ almost everywhere off $S$.
    Such a cut is smooth minimal there, so continuity gives $H_T = "tr"_T K = 0$ throughout its free part.
  At contact, write the cut and $S$ as $C^(1 \, 1)$ graphs with the same orientation.
    Their second derivatives agree almost everywhere on the coincidence set:
    apply twice the fact that the derivative of a Lipschitz function vanishing on a measurable set is zero almost
    everywhere on that set. The cut therefore solves $H_T + "tr"_T K =
    0$ almost everywhere across contact as well as away from it.
    This is a uniformly elliptic quasilinear graph equation. Its coefficients are Hölder after the $C^(1 \, 1)$
    bound; interior elliptic regularity and differentiation make the graph smooth.
  If this smooth MOTS touches $S$, their one-sided difference satisfies a linear elliptic equation with bounded
    coefficients. The strong comparison principle gives local coincidence.
    The contact set is thus open and closed in connected $S$, so the cut contains $S$.
    Its full area is already $A$, excluding additional positive-area components.
    If it does not touch $S$, it is a smooth compact full enclosing MOTS entirely in the interior,
    after filling removable pockets. This contradicts outermostness. Hence almost every cut is exactly $S$. ◻
]

=== 8.5 A local adjoint lemma and finite-type continuation <a-local-adjoint-lemma-and-finite-type-continuation>

The following version records the cosmological constant explicitly, for later use on annuli. Set

$ 16 pi mu_(Lambda_(upright(c))) = R - 2 Lambda_(upright(c)) + \( "tr" K \)^2 - \| K \|^2 \, wide 8 pi J =
  "div"_g \( K - \( "tr" K \) g \) . $

#thm([Lemma 8.7.])[
  (Local regularity and the full adjoint).  #emph[Let $g \,
    K$ be smooth on a connected open three-manifold and let $Lambda_(upright(c))$ be constant.
    Suppose locally finite moment measures $u \, X$ satisfy $u gt.eq \| X \|$, $u mu_(Lambda_(upright(c))) +
    J \( X \) = 0$, and annihilate every compact variation of $16 pi \( mu_(Lambda_(upright(c))) + J \( v \) \)$,
    including the isometric-vector correction (8.10). Then $u \, X$ are smooth and
#[#set math.equation(numbering: n => "(8.16)")
 $ "sym" nabla X & = - u K \,\
Delta u + Lambda_(upright(c)) u & = - "div"_g \( K \( X \, dot.op \)^sharp \) \,\
"Hess" u & = u \( "Ric" - Lambda_(upright(c)) g + tau_K K - 2 K^2 \) - cal(L)_X K + 8 pi X_(\( i) J_(j \)) \, wide
  tau_K = "tr" K . $ <eq-general-shift>]

 Their full first jet satisfies a homogeneous linear first-order system with smooth coefficients depending on
   $g \, K \, Lambda_(upright(c))$. A jet vanishing at one point vanishes everywhere.
   If the moments are nonzero, then $u > 0$ everywhere.]
] <eq-local-adjoint>

#proof[
  For a pure tensor variation $P$, integration of momentum by parts gives the distributional coefficient
  $ 2 #scale(x: 120%, y: 120%)[\[] u \( tau_K g - K \) - "sym" nabla X + \( "div" X \) g
    #scale(x: 120%, y: 120%)[\]] . $
  Its trace gives $"div" X = - u tau_K$, and substitution gives (8.16).
    A simultaneous conformal test $\( 4 psi g \, 2 psi K \)$,
    using complementarity to cancel its background scaling term, gives
  $ 8 chevron.l u \, \( - Delta - Lambda_(upright(c)) \) psi chevron.r + 8 chevron.l X \,
    K \( nabla psi \, dot.op \) chevron.r = 0 . $
  This is (8.16). Diverging the shift equation and using its trace gives
  #[#set math.equation(numbering: n => "(8.17)")
   $ Delta X_j + "Ric"_(j k) X^k = \( tau_K delta_j zws^i - 2 K_j zws^i \) nabla_i u +
     u \( nabla_j tau_K - 2 nabla^i K_(i j) \) . $ <eq-vector-elliptic>]
  Together with the lapse equation this is an elliptic system with diagonal scalar-Laplacian principal part and
    smooth first-order couplings. Measures belong locally to a negative Sobolev space.
    The local elliptic estimate on nested compact cutoffs improves their Sobolev order by one,
    because the couplings have at most one derivative. Iteration and Sobolev embedding yield smoothness.
  For completeness, the metric equation is computed next. Put $P_K = K - tau_K g$.
    The compact constraint pairing is the variation of
  $ integral #scale(x: 120%, y: 120%)[\[] u \( R - 2 Lambda_(upright(c)) + tau_K^2 - \| K \|^2 \) +
    2 X^i nabla^j \( P_K \)_(i j) #scale(x: 120%, y: 120%)[\]] thin d V_g $
  together with $- 8 pi integral H \( X \, J^sharp \) thin d V_g$.
    The latter is exactly the vector-transport correction. Changing the fixed background volume density to the
    varying one adds zero, since its background integrand is $16 pi \( u mu_(Lambda_(upright(c))) + J \( X \) \) =
    0$. Integrating the shift term once gives $- integral P_K^(i j) \( cal(L)_X g \)_(i j) thin d V_g$.
    At fixed covariant $K$, contravariant $X$, and $u$, use
  $ R' & = - chevron.l "Ric" \, H chevron.r + nabla^i nabla^j H_(i j) - Delta "tr" H \,\
tau'_K & = - K^(i j) H_(i j) \, wide \( \| K \|^2 \)' = - 2 \( K^2 \)^(i j) H_(i j) \,\
\( P_K^(i j) \)' & = - H^i zws_a K^(a j) - H^j zws_a K^(i a) + \( K^(a b) H_(a b) \) g^(i j) + tau_K H^(i j) \,\
\( cal(L)_X g \)' & = cal(L)_X H \, wide \( d V_g \)' = 1 / 2 \( "tr" H \) d V_g . $
  Integration of $cal(L)_X H$ and collection of coefficients gives
  #[#set math.equation(numbering: n => "(8.18)")
   $ 0 =  & "Hess" u - \( Delta u \) g - u "Ric" + 2 u \( K^2 - tau_K K \) + u /
     2 \( R - 2 Lambda_(upright(c)) + tau_K^2 - \| K \|^2 \) g\
 & + cal(L)_X K - \( "div" X \) K - #scale(x: 120%, y: 120%)[\(] X \( tau_K \) +
   K^(a b) nabla_a X_b #scale(x: 120%, y: 120%)[\)] g - 8 pi X_(\( i) J_(j \)) . $ <eq-unsimplified-metric>]
  The shift equation gives
  $ "div" X = - u tau_K \, quad K^(a b) nabla_a X_b = - u \| K \|^2 \, quad "tr" \( cal(L)_X K \) =
    X \( tau_K \) - 2 u \| K \|^2 . $
  Taking the trace of (8.18) and using complementarity yields
  #[#set math.equation(numbering: n => "(8.19)")
   $ Delta u + X \( tau_K \) = u / 2 \( R + tau_K^2 + \| K \|^2 - 4 Lambda_(upright(c)) \) . $ <eq-trace-identity>]
  Substitution gives (8.16).
  To exhibit finite type, write $B_(i j) = nabla_(\( i) X_(j \)) = - u K_(i j)$. Commuting covariant derivatives gives
  $ nabla_i nabla_j X_k =  & nabla_i B_(j k) + nabla_j B_(i k) - nabla_k B_(i j)\
 & + 1 / 2 #scale(x: 120%, y: 120%)[\(] \[ nabla_i \, nabla_j \] X_k - \[ nabla_i \, nabla_k \]
   X_j - \[ nabla_j \, nabla_k \] X_i #scale(x: 120%, y: 120%)[\)] . $
  All commutators are curvature times $X$. Derivatives of $B$ use only $u \,
    d u$ and the first derivatives of $K$. Equation (8.16) similarly expresses the Hessian of $u$ in first jets.
    Therefore, for $cal(J) = \( u \, X \, nabla u \, nabla X \)$,
  #[#set math.equation(numbering: n => "(8.20)")
   $ nabla cal(J) = cal(A) \( g \, K \, Lambda_(upright(c)) \) thin cal(J) $ <eq-finite-type>]
  for a smooth bundle-valued linear coefficient. ODE uniqueness along paths proves continuation.
    At a zero of $u gt.eq 0$, $d u = 0$; domination $\| X \| lt.eq u$ also gives $X = d X = 0$.
    Nonzero moments consequently have positive lapse everywhere. ◻
]

#thm([Lemma 8.8.])[
  (Compactness of normalized adjoint jets).  #emph[Suppose smooth coefficients in Lemma 90 converge on compact
    subsets of a connected open manifold, and nonzero causal adjoints are defined on an exhaustion containing a
    fixed point $p$. Normalize their full first jets at $p$ to have norm one.
    A subsequence converges smoothly on compact sets to a nonzero causal adjoint for the limiting coefficients.
    The same conclusion holds for a parameter family on a fixed open manifold.]
] <eq-jet-compactness>

#proof[
  The jet at $p$ cannot be zero by continuation. On any fixed compact set,
    a finite family of coordinate neighborhoods and paths from $p$ has bounded lengths and uniformly bounded
    coefficients in (8.20). Grönwall’s Inequality gives uniform first-jet bounds there.
    The equations and local elliptic estimates give bounds of every order on smaller compact sets.
    Diagonal compactness gives the limit. Its jet at $p$ still has norm one,
    and causality is a closed pointwise condition. Lemma 90 supplies positive limiting lapse. ◻
]

=== 8.6 Boundary atoms and hyperbolic normalization <boundary-atoms-and-hyperbolic-normalization>

By Lemma 89, the area term in (8.13) is $c thin a'_S \( H \)$.
  Thus compact interior tests have zero pairing, and Lemma 90, with $Lambda_(upright(c)) = - 3$, applies.
  It gives (8.4)–(8.4) in the interior.

#thm([Lemma 8.9.])[
  (One-sided continuation and normalization).  #emph[The moment fields extend smoothly to $S$,
    their original measure moments have no part supported on $S$, and they satisfy (8.3).
    In particular they are nonzero and their lapse is positive in the interior.]
] <eq-normalization-lemma>

#proof[
  In a smooth normal collar of $S$, the coefficient in (8.20) is smooth up to the face.
    Solve its linear ODE down each collar segment from a fixed interior surface.
    Smooth dependence on its footpoint gives a smooth extension;
    ODE uniqueness identifies it with the original field in the collar.
  Subtract integration by parts of these smooth interior fields from the compact multiplier identity.
    Take a metric variation whose value and full first jet vanish on $S$, and set the tensor variation to zero.
    All area, expansion and integrated boundary terms vanish.
    The remaining boundary scalar moment tests $- partial_nu^2 "tr"_S H$, which is arbitrary,
    by choosing a prescribed $s^2$ tangential trace in collar coordinates.
    Momentum and frame terms involve only lower jets and are zero. Thus the scalar moment has no boundary part.
    Its domination of the vector moment eliminates that part as well.
  We next derive end behavior without imposing growth on the measures.
    Express the first-jet system in a $b$-parallel radial frame, with $eta = "arsinh" r$.
    At $\( b \, 0 \)$ its lapse system is $"Hess"_b u = u b$ and its shift system is hyperbolic Killing transport.
    Their radial propagators have norm at most $C e^(\| eta - eta' \|)$.
    This follows directly from the $2$-by-$2$ blocks $y'' = y$ and the constant blocks,
    or from the ambient linear functions and Lorentz generators on the hyperboloid.
    The actual coefficient differs by $O \( e^(- tau eta) \)$;
    only two metric derivatives and one tensor derivative occur. Variation of constants gives
  $ e^(- eta) \| cal(J) \( eta \) \| lt.eq C + C integral_(eta_0)^eta e^(- tau s) e^(- s) \| cal(J) \( s \) \|
    thin d s . $
  Grönwall therefore gives $cal(J) = O \( r \)$, uniformly in angle.
  The lapse and tangential-shift radial equations now read
  $ y'' - y = O \( r^(1 - tau) \) \, $
  and the normal-shift derivative is $O \( r^(1 - tau) \)$.
    Variation of constants, with $3 \/ 2 < beta < min { 2 \, tau }$, consequently gives continuous angular coefficients
  $ u & = r f_0 \( omega \) + O \( r^(1 - beta) \) \, & partial_eta u & = r f_0 \( omega \) + O \( r^(1 - beta) \) \,\
X_T & = r W_0 \( omega \) + O \( r^(1 - beta) \) \, & X^(nu_b) & = a_0 \( omega \) + O \( r^(1 - beta) \) . $
  Convergence of the leading coefficients is uniform; no angular differentiability is required at this stage.
    The homogeneous $r^(- 1)$ mode is included in the remainder because $beta < 2$.
  Use first a conformal prototype $psi = r^(- 3) f \( omega \)$ in the multiplier identity and integrate to a
    large sphere. Its interior pairing vanishes by the adjoint equations, its $S$ terms vanish,
    and its end-point coefficient is zero. All pairings converge:
    the moments grow at most as $r$, while the prototype derivatives are $O \( r^(- 4) \) +
    O \( r^(- 3 - tau) \)$ or better. The sole nonvanishing boundary expression is
  $ - 8 integral_(r = R) \( u partial_(nu_b) psi - psi partial_(nu_b) u \) thin d A_b . $
  Terms containing $K X psi$ have integrated order $O \( R^(- tau) \)$;
    replacing $g$ by $b$ has the same vanishing order. The displayed limit is $32 integral_(bb(S)^2) f_0 f thin d
    omega$. The left side is $16 pi p'_0 = 32 integral_(bb(S)^2) f thin d omega$ by the defining metric flux.
    Arbitrary $f$ gives $f_0 = 1$.
  For a mixed tensor prototype, the only boundary term is twice its trace-reversed stress flux against $X$.
    Its limit is $2 integral_(bb(S)^2) chevron.l W_0 \, W chevron.r_sigma thin d omega$,
    whereas its metric mass and area derivatives vanish. Hence $W_0 = 0$.
    The tangential trace of the shift equation on coordinate spheres now gives
  $ "div"_(S_R) X_T + H_(S_R) X^(nu_b) = O \( R^(1 - beta) \) . $
  Interpret this on the unit sphere. The divergence term tends to zero distributionally,
    since integration against a fixed test function gains the factor $R^(- 1)$, and $H_(S_R) arrow.r 2$.
    Thus $a_0 = 0$. The already uniform limits identify it pointwise.
  We have obtained the value estimates in (8.3), since $V_0 - r = O \( r^(- 1) \)$.
    The coupled elliptic system for $\( u - V_0 \, X \)$ has uniformly controlled unit-patch coefficients and
    source $O_(0 \, alpha') \( r^(1 - tau) \)$. Local estimates applied to these value bounds yield the first and
    second derivative Hölder bounds in (8.3), with a smaller $alpha'$ if necessary.
    The prototype normalization makes the field nonzero; the last assertion of Lemma 90 gives $u > 0$. ◻
]

=== 8.7 Stationary curvature and free boundary variations <stationary-curvature-and-free-boundary-variations>

#proof[
  #emph[Completion of the proof of Theorem 84.] Since $u > 0$,
    (8.5) is a smooth Lorentzian metric on the open exterior product.
    Its coefficients are independent of $t$, so $xi = partial_t$ is Killing.
    Its future normal is $n = u^(- 1) \( partial_t - X \)$; the future-normal convention fixed after
    Equation (2.5) gives
  $ 1 / 2 cal(L)_n g = - frac(1, 2 u) cal(L)_X g = K $
  by (8.4). Thus both induced tensors are the original ones.
  We verify its curvature without a spacetime existence assumption.
    The Gauss–Codazzi and lapse identities, obtained by differentiating the displayed metric, give for spatial slots
  $ "Ric"_(upright(bold(g)) \, i j) = "Ric"_(g \, i j) + tau_K K_(i j) - 2 \( K^2 \)_(i j) -
    u^(- 1) #scale(x: 120%, y: 120%)[\(] \( cal(L)_X K \)_(i j) + \( "Hess" u \)_(i j) #scale(x: 120%, y: 120%)[\)] \, $
  and
  $ R_(upright(bold(g))) = R_g + tau_K^2 + \| K \|^2 - 2 u^(- 1) \( Delta u + X \( tau_K \) \) . $
  Equation (8.19) with $Lambda_(upright(c)) = - 3$ gives $R_(upright(bold(g))) = - 12$. Equation (8.4) then gives
  $ u \( G_(upright(bold(g))) - 3 upright(bold(g)) \)_(i j) = - 8 pi X_(\( i) J_(j \)) . $
  The normal and mixed components of this tensor are the constraints, $8 pi mu$ and $8 pi J_i$.
    Complementarity and causality imply
  $ 0 = u mu + J \( X \) gt.eq u mu - \| J \| \| X \| gt.eq u \( mu - \| J \| \) gt.eq 0 . $
  Where $mu > 0$, equality forces $\| X \| = u$, $\| J \| = mu$, and $J = - mu X^flat \/ u$.
    Where $mu = 0$, $J = 0$. Substitution into all the normal, mixed and spatial components gives
  $ G_(upright(bold(g))) - 3 upright(bold(g)) = 8 pi mu u^(- 2) xi^flat ⊗ xi^flat \, wide
    mu \( u^2 - \| X \|^2 \) = 0 . $
  Since the matter term is tracefree, this is exactly (8.6).
    It allows nonzero matter on the null set; its exclusion is a separate argument in the next section.
  It remains to determine the boundary data. There are no boundary constraint atoms by Lemma 92,
    and the integration normal at $S$ is $- nu$. A compact pure tensor test $P$, arbitrary at the boundary,
    has integrated boundary term
  $ - 2 integral_S #scale(x: 120%, y: 120%)[\(] P \( X \, nu \) -
    X^nu "tr" P #scale(x: 120%, y: 120%)[\)] thin d A_g . $
  Its expansion derivative is $"tr"_S P$. Separating mixed and tangential-trace components in (8.13) gives
  $ X_T = 0 \, wide d eta = 2 X^nu thin d A_g . $
  For a compact simultaneous conformal test $\( 4 psi g \, 2 psi K \)$,
    its area derivative is $4 integral_S psi thin d A_g$ and its expansion derivative is $4 partial_nu psi$.
    Integrating the lapse equation gives
  $ - 4 c integral_S psi thin d A_g = 8 integral_S #scale(x: 120%, y: 120%)[\[] u partial_nu
    psi - \( partial_nu u + K \( X \, nu \) \) psi #scale(x: 120%, y: 120%)[\]] thin d A_g -
    4 integral_S partial_nu psi thin d eta . $
  The boundary value and normal derivative of $psi$ can be prescribed independently.
    They give $d eta = 2 u thin d A_g$, $X = u nu$, and $partial_nu u + K \( X \, nu \) = c \/ 2 = kappa_h$.
  Finally let $L_(upright("MOTS"))$ be the normal expansion linearization at $S$, with principal part $- Delta_S$.
    Extend any $s nu$, $s in C^oo \( S \)$, to a compact one-sided field $Y$ and test with
    $\( cal(L)_Y g \, cal(L)_Y K \)$. In the open exterior its active-ray derivative is zero:
    under diffeomorphism transport it differentiates a nonnegative scalar at a zero,
    and the difference from isometric transport is annihilated at activity.
    No boundary constraint measure remains. The mass derivative is zero,
    while the area and expansion derivatives are $integral_S H s thin d A_g$ and $L_(upright("MOTS")) s$.
    The multiplier identity therefore gives
  $ c integral_S H s thin d A_g = 2 integral_S u L_(upright("MOTS")) s thin d A_g \, wide
    2 L_(upright("MOTS"))^(*) u = c H . $
  Outer area minimization gives $H gt.eq 0$, by the first area variation for arbitrary nonnegative outward speeds.
    The nonnegative function $u \|_S$ is consequently a supersolution of an elliptic operator with principal part
    $- Delta_S$. The strong minimum principle applies: after reversing the operator and subtracting a sufficiently
    large zeroth-order constant, the usual nonpositive zeroth-order condition holds because $u gt.eq 0$.
    On connected $S$, either $u > 0$ everywhere or $u = 0$ everywhere. This completes all assertions. ◻
]

== 9 The timelike region and the regular static quotient <geo-section>

We now use the causal stationary field supplied by Theorem 84.
  All geometric objects in this section are constructed from the original equality data.
  The logarithmic estimate below is a cosmological version of the Killing-norm calculation in
  #cite(label("internalflat")) Section 5.3; we give its proof,
  including the treatment of an arbitrary interior null set.

Write $M = "int" Omega$, and let $nu$ on $S$ point into $Omega$.
  We record the precise outputs of Theorem 84 that are used.
  The fields $u \, X$ are smooth up to $S$, satisfy $u > 0$ on $M$ and $u gt.eq \| X \|_g$, and obey

#[#set math.equation(numbering: n => "(9.1)")
 $ "sym" nabla X = - u K \, wide X \|_S = u nu \, wide partial_nu u + K \( X \, nu \) = kappa_h > 0 \,
   $ <geo-input-killing>]

where $kappa_h$ is a constant. Either $u \|_S > 0$ everywhere or $u \|_S = 0$ everywhere.
  Writing $tau'$ for the exponent $beta$ in Theorem 84, with $tau' > 3 \/ 2$, the end estimates are

#[#set math.equation(numbering: n => "(9.2)")
 $ u - V_0 = O_2 \( r^(1 - tau') \) \, wide X = O_2 \( r^(1 - tau') \) . $ <geo-input-end>]

Here and below the end estimates use the reference hyperbolic tensor norms,
  including their stated differentiated Hölder bounds. The stationary metric

#[#set math.equation(numbering: n => "(9.3)")
 $ upright(bold(g)) = - u^2 thin upright(d) t^2 +
   g_(i j) \( thin upright(d) x^i + X^i thin upright(d) t \) \( thin upright(d) x^j + X^j thin upright(d) t \)
   $ <geo-stationary-metric>]

on $bb(R) times M$, with $xi = partial_t$ and $N = u^2 - \| X \|_g^2$, satisfies

#[#set math.equation(numbering: n => "(9.4)")
 $ "Ric"_(upright(bold(g))) = - 3 upright(bold(g)) + 8 pi mu u^(- 2) xi^flat ⊗ xi^flat \, wide mu N =
   0 . $ <geo-input-ricci>]

The musical notation on $xi$ refers to $upright(bold(g))$;
  spatial musical notation will always refer to $g$ unless specified otherwise.

#thm([Theorem 9.1.])[
  (Regular static quotient).  #emph[ Under these hypotheses, $N > 0$ throughout $M$, and $M$ is simply connected.
    The fields
#[#set math.equation(numbering: n => "(9.5)")
 $ h = g + N^(- 1) X^flat ⊗ X^flat \, wide lambda = sqrt(N) \, wide cal(A) = N^(- 1) X^flat $ <geo-quotient-fields>]

 satisfy $h gt.eq g$ and $thin upright(d) cal(A) = 0$, and there is a global smooth function $H$ on $M$ with $thin
   upright(d) H = - cal(A)$. They obey
#[#set math.equation(numbering: n => "(9.6)")
 $ Delta_h lambda = 3 lambda \, wide "Hess"_h lambda = lambda \( "Ric"_h + 3 h \) \, wide R_h = -
   6 . $ <geo-static-equations>]

 Attaching $S$ in the regular boundary coordinates of Lemma 106 gives a smooth complete Riemannian manifold with
   compact connected nondegenerate boundary. Its underlying completion is homeomorphic to $Omega$,
   and its boundary is identified diffeomorphically with $S$. On that boundary,
#[#set math.equation(numbering: n => "(9.7)")
 $ h \|_(T S) = g \|_(T S) \, wide "Area"_h \( S \) = "Area"_g \( S \) \, wide lambda = 0 \, wide
   partial_(nu_h) lambda = kappa_h \, wide upright("II")_h = 0 . $ <geo-quotient-boundary>]

 Moreover, in the original end chart,
#[#set math.equation(numbering: n => "(9.8)")
 $ h - g = O_2 \( r^(- 2 tau') \) \, wide lambda - V_0 = O_2 \( r^(1 - tau') \) \, wide lambda / V_0 arrow.r
   1 . $ <geo-quotient-end>]

]
] <geo-static-quotient>

=== 9.1 Boundary collars and the Killing identities <boundary-collars-and-the-killing-identities>

Initially put $P = { N > 0 } subset M$. On $P$ define $h \, lambda \, cal(A)$ as in Equation (9.5), and set

#[#set math.equation(numbering: n => "(9.9)")
 $ C = h^(- 1) = g^(- 1) - u^(- 2) X ⊗ X \, wide cal(F) = thin upright(d) cal(A) . $ <geo-C-F>]

The tensor $C$ extends smoothly and nonnegatively to all of $M$. Direct completion of the square gives

#[#set math.equation(numbering: n => "(9.10)")
 $ upright(bold(g)) = h - lambda^2 \( thin upright(d) t - cal(A) \)^2 \, wide thin upright(d) V_h = u /
   lambda thin upright(d) V_g . $ <geo-square-completion>]

#thm([Lemma 9.2.])[
  (The end and the original boundary collar).  #emph[The end and a collar of $S$ in $M$ lie in $P$.
    In particular the interior zero set $Z = { N = 0 } ∩ M$ is compact. If $u \|_S > 0$, then
#[#set math.equation(numbering: n => "(9.11)")
 $ thin upright(d) N \|_S = 2 kappa_h X^flat \|_S \, wide N = 2 kappa_h u \|_S thin s + O \( s^2 \) \,
   $ <geo-positive-boundary-jet>]

 where $s gt.eq 0$ is $g$-normal distance into the domain.
   If $u \|_S = 0$, there are smooth $a$ and $W$ in this collar such that
#[#set math.equation(numbering: n => "(9.12)")
 $ u = s a \, wide a \|_S = kappa_h \, wide X = s^2 W \, wide N = s^2 #scale(x: 120%, y: 120%)[\(] a^2 -
   s^2 \| W \|_g^2 #scale(x: 120%, y: 120%)[\)] . $ <geo-zero-boundary-jet>]

]
] <geo-positive-collars>

#proof[
  Since $X = u nu$ on $S$, the function $N$ vanishes there.
    The normal component of Equation (9.1) gives $chevron.l nabla_nu X \, nu chevron.r = - u K \( nu \, nu \)$,
    and hence
  $ partial_nu N = 2 u partial_nu u - 2 u chevron.l nabla_nu X \, nu chevron.r =
    2 u #scale(x: 120%, y: 120%)[\(] partial_nu u + K \( X \, nu \) #scale(x: 120%, y: 120%)[\)] = 2 u kappa_h . $
  All tangential derivatives of $N$ vanish on $S$. This proves Equation (9.11) and the positive-lapse collar
    assertion. If $u = 0$ on $S$, then $X = 0$ there and its tangential covariant derivatives vanish.
    The normal-normal and normal-tangential components of $"sym" nabla X = 0$ give $nabla_nu X = 0$ on $S$.
    Smooth division by $s$ and by $s^2$ gives Equation (9.12); the boundary lapse equation gives $a \|_S =
    kappa_h$. Compactness makes the collars uniform. Finally, Equation (9.2) gives $N =
    V_0^2 \( 1 + O_2 \( r^(- tau') \) \)$, so the entire sufficiently distant end lies in $P$.
    The remaining zero set is a closed subset of a compact set separated from $S$. ◻
]

#thm([Lemma 9.3.])[
  (Norm and twist identities).  #emph[Let $D_(alpha beta) = nabla_alpha^(upright(bold(g))) xi_beta$,
    with the full Lorentzian contraction used in $\| D \|_(upright(bold(g)))^2$. On $M$,
#[#set math.equation(numbering: n => "(9.13)")
 $ 1 / u "div"_g \( u C thin thin upright(d) N \) = 6 N - 2 \| D \|_(upright(bold(g)))^2 . $ <geo-norm-identity>]

 On $P$, the antisymmetric contravariant tensor
#[#set math.equation(numbering: n => "(9.14)")
 $ Q^(i j) = u N C^(i k) C^(j ell) cal(F)_(k ell) $ <geo-Q>]

 satisfies $nabla_i Q^(i j) = 0$.]
] <geo-killing-identities>

#proof[
  The Killing equation makes $D$ antisymmetric. Killing differentiation gives $square.stroked_(upright(bold(g)))
    xi_beta = - "Ric"_(upright(bold(g)) thin beta gamma) xi^gamma$.
    Since $upright(bold(g)) \( xi \, xi \) = - N$, it follows that
  $ square.stroked_(upright(bold(g))) N = - 2 \| D \|_(upright(bold(g)))^2 +
    2 "Ric"_(upright(bold(g))) \( xi \, xi \) = - 2 \| D \|_(upright(bold(g)))^2 + 6 N . $
  In the last equality the additional term in Equation (9.4) vanishes by $mu N = 0$.
    For a stationary scalar the spatial block of $upright(bold(g))^(- 1)$ is $C$,
    and the spacetime volume density is $u sqrt(det g)$. This proves Equation (9.13).
  For the second identity, write $theta.alt = thin upright(d) t - cal(A)$.
    The Killing one-form is $xi^flat = - lambda^2 theta.alt$, so $xi^flat and thin upright(d) xi^flat = -
    lambda^4 theta.alt and cal(F)$. The differentiated Killing equation, contracted with the volume form, gives
  $ thin upright(d) *_(upright(bold(g))) \( xi^flat and thin upright(d) xi^flat \) =
    2 *_(upright(bold(g))) #scale(x: 120%, y: 120%)[\(] xi^flat and
    "Ric"_(upright(bold(g))) \( xi \, dot.op \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  The right side vanishes because $"Ric"_(upright(bold(g))) \( xi \, dot.op \)$ is proportional to $xi^flat$.
    Evaluating the Hodge star using the unit time form $lambda theta.alt$ turns the left side,
    up to a fixed orientation sign, into $thin upright(d) \( lambda^3 *_h cal(F) \)$. Thus
  $ "div"_h #scale(x: 120%, y: 120%)[\(] lambda^3 C^(i k) C^(j ell) cal(F)_(k ell) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Use $lambda^3 thin upright(d) V_h = u N thin upright(d) V_g$ to change the divergence density.
    The connection term on the free index of an antisymmetric two-tensor vanishes for either torsion-free
    connection. The resulting equation is exactly $nabla_i Q^(i j) = 0$. ◻
]

=== 9.2 Logarithmic control and vanishing twist <logarithmic-control-and-vanishing-twist>

#thm([Lemma 9.4.])[
  (Transverse logarithmic energy).  #emph[On a neighborhood of $Z$, set $B = \| X \|_g$, $e = X \/ B$, and $T =
    e^perp$. For each smooth compactly supported cutoff $eta$ in that neighborhood,
#[#set math.equation(numbering: n => "(9.15)")
 $ sup_(epsilon > 0) integral_M u eta^2 frac(\| thin upright(d) N \|_C^2, \( N + epsilon \)^2) thin upright(d)
   V_g < oo . $ <geo-log-energy-bound>]

 In particular, $thin upright(d)_T log N$ is locally square integrable on the positive side up to $Z$:
#[#set math.equation(numbering: n => "(9.16)")
 $ integral_P eta^2 \| thin upright(d)_T log N \|_g^2 thin upright(d) V_g < oo . $ <geo-log-transverse>]

 No regularity or measure assumption on $Z$ is required.]
] <geo-logarithmic-energy>

#proof[
  On a sufficiently small fixed neighborhood of the compact set $Z$,
    both $u$ and $B$ are bounded below by positive constants.
    The tensor $C$ acts as the identity on $T$ and has eigenvalue $N \/ u^2$ in direction $e$.
    Smooth nonnegativity of $N$ implies
  #[#set math.equation(numbering: n => "(9.17)")
   $ \| thin upright(d) N \|_g^2 lt.eq C_0 N $ <geo-quadratic-vanishing>]
  on compact subsets after slightly enlarging the neighborhood.
    Indeed, choose a uniform coordinate radius and a bound $L$ for $"Hess"_g N$ large enough that $\| thin
    upright(d) N \| \/ L$ is less than that radius. Taylor’s Inequality along the negative gradient geodesic at
    length $\| thin upright(d) N \| \/ L$ yields $0 lt.eq N - \| thin upright(d) N \|^2 \/ \( 2 L \)$.
  Put $n = \( partial_t - X \) \/ u$, and complete $e$ to a spatial orthonormal frame $e \, E_1 \, E_2$.
    Since $xi = u n + B e$, differentiation of its norm gives
  $ u D_(i n) = - 1 / 2 N_i - B D_(i e) . $
  Writing $v_a = D_(a e)$, expansion of the temporal and spatial contractions therefore gives the exact formula
  #[#set math.equation(numbering: n => "(9.18)")
   $ - 2 \| D \|_(upright(bold(g)))^2 = frac(\| thin upright(d) N \|_g^2, u^2) +
     frac(4 B, u^2) sum_(a = 1)^2 N_a v_a - frac(4 N, u^2) sum_(a = 1)^2 v_a^2 - 4 D_12^2 . $ <geo-D-expansion>]
  All coefficients and the components of $D$ are bounded on the fixed neighborhood.
    Equations (9.13) and (9.17) consequently imply
  #[#set math.equation(numbering: n => "(9.19)")
   $ 1 / u "div"_g \( u C thin thin upright(d) N \) lt.eq C_1 \( N + \| thin upright(d)_T N \|_g \) .
     $ <geo-norm-upper-bound>]
  The additional cosmological term $6 N$ has the harmless first order shown.
  Multiply Equation (9.19) by $u eta^2 \/ \( N + epsilon \)$ and integrate.
    Writing $E_epsilon$ for the integral in Equation (9.15), before taking the supremum, integration by parts gives
  $ E_epsilon - 2 integral_M frac(u eta C \( thin upright(d) eta \, thin upright(d) N \), N + epsilon) thin
    upright(d) V_g lt.eq C_1 integral_M u eta^2 thin upright(d) V_g +
    C_1 integral_M frac(u eta^2 \| thin upright(d)_T N \|, N + epsilon) thin upright(d) V_g . $
  Cauchy’s Inequality bounds the cutoff term by $E_epsilon \/ 4 + C integral u \| thin upright(d) eta \|_C^2$,
    and the last term by $E_epsilon \/ 4 + C integral u eta^2$,
    because $\| thin upright(d)_T N \| lt.eq \| thin upright(d) N \|_C$. This proves the uniform bound.
    Fatou’s Lemma on $P$, together with the positive lower bound for $u$, proves Equation (9.16). ◻
]

#thm([Lemma 9.5.])[
  (Vanishing twist).  #emph[The form $cal(A)$ is closed on all of $P$.]
] <geo-vanishing-twist>

#proof[
  Lower the free index of $Q^(k j) cal(A)_j$ using $g$. Direct substitution of
  $ cal(F) = N^(- 1) thin upright(d) X^flat - N^(- 2) thin upright(d) N and X^flat \, wide C X^flat = \( N \/ u^2 \) X $
  gives
  #[#set math.equation(numbering: n => "(9.20)")
   $ W_i := g_(i k) Q^(k j) cal(A)_j = u^(- 1) {X^j \( thin upright(d) X^flat \)_(i j) -
     B^2 \( thin upright(d)_T log N \)_i} . $ <geo-twist-contraction>]
  This expression is orthogonal to $X$. At a zero of $X$ its second numerator is interpreted as $B^2 thin
    upright(d) N - thin upright(d) N \( X \) X^flat$, so the identity does not require a choice of $e$ away from
    the neighborhood used above.
  Let $chi$ be a product of three nonnegative cutoffs, excluding first $Z$, then the original boundary,
    then infinity. Testing $nabla_i Q^(i j) = 0$ by $chi cal(A)_j$ gives
  #[#set math.equation(numbering: n => "(9.21)")
   $ 1 / 2 integral_P chi u N C^(i k) C^(j ell) cal(F)_(i j) cal(F)_(k ell) thin upright(d) V_g = -
     integral_P chevron.l W \, thin upright(d) chi chevron.r_g thin upright(d) V_g . $ <geo-twist-energy>]
  The integrand on the left is nonnegative.
  Keep the boundary and infinity cutoffs fixed. Let the first cutoff change from zero to one on $epsilon < N < 2
    epsilon$, with derivative bounded by $C \/ epsilon$. Orthogonality in Equation (9.20) makes its error bounded by
  $ C integral_({ epsilon < N < 2 epsilon }) #scale(x: 120%, y: 120%)[\(] \| thin upright(d)_T log N \| + \| thin
    upright(d)_T log N \|^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) V_g $
  on a fixed compact set. This tends to zero by Lemma 96: the shell indicators tend pointwise to zero on $P$ and
    are dominated by an integrable function there. The argument also applies if $Z$ has positive volume.
  For the boundary cutoff use the normal coordinate $s$. If $u \|_S > 0$, Equation (9.11) gives $N asymp s$, $X =
    u \|_S nu + O \( s \)$, and $thin upright(d)_T N = O \( s \)$. Thus $W$ is bounded.
    Its orthogonality to $X$ implies $W \( nu \) = O \( s \)$,
    so a cutoff with derivative $O \( delta^(- 1) \)$ on $delta < s < 2 delta$ has error $O \( delta \)$.
    If $u \|_S = 0$, Equation (9.12) gives
  $ u asymp s \, quad X = O \( s^2 \) \, quad thin upright(d) X^flat = O \( s \) \, quad N asymp s^2 \, quad
    thin upright(d) N = O \( s \) \, $
  and Equation (9.20) gives $W = O \( s^2 \)$, with the same conclusion.
  Finally, Equation (9.2) gives $W = O \( r^(1 - 2 tau') \)$ on the end.
    A cutoff on $R < r < 2 R$ has bounded hyperbolic gradient and the shell has volume $O \( R^2 \)$.
    Its error is $O \( R^(3 - 2 tau') \)$, which vanishes since $tau' > 3 \/ 2$.
    Successively removing these cutoffs and using Fatou’s Lemma in Equation (9.21) makes its nonnegative integrand
    vanish everywhere. Since $u N > 0$ and $C$ is positive definite on $P$, one has $cal(F) = 0$ there. ◻
]

#thm([Lemma 9.6.])[
  (Static equations and connectedness).  #emph[Equations (9.6) hold on $P$, and $P$ is connected.]
] <geo-static-on-P>

#proof[
  Locally write $cal(A) = thin upright(d) f$ and $T_0 = t - f$.
    Then $upright(bold(g)) = h - lambda^2 thin upright(d) T_0^2$. Equation (9.4) is vacuum on $P$.
    The only mixed-time Christoffel symbols of this static product are
  $ Gamma_(i T_0)^(T_0) = lambda^(- 1) partial_i lambda \, wide Gamma_(T_0 T_0)^i = lambda h^(i j) partial_j lambda . $
  Thus its spatial Ricci tensor is $"Ric"_h - lambda^(- 1) "Hess"_h lambda$,
    and its time-time component is $lambda Delta_h lambda$. Comparing with $-
    3 upright(bold(g))$ gives the first two equations in Equation (9.6); tracing gives $R_h = - 6$.
    These equations are intrinsic and hence hold globally on $P$.
  The end belongs to a single component of $P$. Any other component has compact closure in the original manifold
    with boundary. The continuous function $lambda$ is zero on every finite boundary point of that component,
    including a possible point on $S$. It therefore attains a positive maximum at an interior point,
    contrary to $Delta_h lambda = 3 lambda$. There is no other component. ◻
]

=== 9.3 Optical completeness and simple connectivity <optical-completeness-and-simple-connectivity>

#thm([Lemma 9.7.])[
  (Completeness after truncation of the ordinary end).  #emph[Equip $P$ with the optical metric $k =
    lambda^(- 2) h$. All escape directions other than the ordinary end have infinite $k$-length.
    After truncating the ordinary end at a sufficiently large sphere,
    the resulting manifold with boundary is complete for its intrinsic optical distance.
    The same is true of each of its Riemannian covering spaces.]
] <geo-optical-completeness>

#proof[
  Near $Z$, smooth nonnegativity and compactness give $N lt.eq C "dist"_g \( dot.op \, Z \)^2$.
    If $rho = "dist"_g \( dot.op \, Z \)$, then $\| thin upright(d) rho \|_g lt.eq 1$ almost everywhere and
  $ \| thin upright(d) log rho \|_k^2 = N C \( thin upright(d) log rho \, thin upright(d) log rho \) lt.eq
    N rho^(- 2) lt.eq C . $
  Hence approach to $Z$ has infinite optical length. In the zero boundary lapse case the same calculation uses $s$
    and $N = O \( s^2 \)$.
  For positive boundary lapse it is essential to allow arbitrary tangential motion.
    In the $g$-normal collar decompose $X = X^nu nu + X_T$. Since $\| thin upright(d) s \|_g = 1$,
    the exact inverse-metric formula is
  #[#set math.equation(numbering: n => "(9.22)")
   $ \| thin upright(d) s \|_k^2 = N (1 - frac(\( X^nu \)^2, u^2)) = N /
     u^2 #scale(x: 120%, y: 120%)[\(] N + \| X_T \|_g^2 #scale(x: 120%, y: 120%)[\)] =
     O \( s^2 \) . $ <geo-optical-arbitrary-curve>]
  Here $N asymp s$, $X_T = O \( s \)$, and $u$ is bounded below.
    Therefore $\| thin upright(d) s \( v \) \| lt.eq C s \| v \|_k$ for every vector $v$,
    and any curve approaching $S$ has infinite optical length.
    This proves the assertion without restricting to normal curves.
  After truncation, $N$ is bounded above, so $k gt.eq c g$.
    Any optical Cauchy sequence is consequently Cauchy for $g$ and has a limit in the compact original region with
    the large sphere attached. The logarithmic estimates exclude a limit in $Z$ or in $S$.
    Every other limit is an ordinary smooth point of the truncated metric, including its large-sphere boundary.
    This proves completeness. A smooth manifold with boundary and its intrinsic Riemannian distance is a locally
    compact length space; completeness makes it proper. For a covering metric completeness follows by projecting a
    Cauchy sequence and then taking an evenly covered small neighborhood of its limit.
    Sufficiently short connecting paths remain in that neighborhood,
    so the sequence eventually lies in a single sheet and converges there. ◻
]

#thm([Lemma 9.8.])[
  (Two convex faces cannot be joined by a shortest optical path).  #emph[Let $\( L \, h \, lambda \)$ satisfy the
    static equations in Equation (9.6), with $lambda > 0$. Suppose that two compact boundary faces $Sigma_0 \,
    Sigma_1$ have positive $h$-mean curvature for the normals pointing out of $L$.
    There is no shortest optical path between these faces which is orthogonal at its endpoints and otherwise interior.]
] <geo-null-index-obstruction>

#proof[
  Suppose such a path has optical length $ell > 0$. In the abstract static product
    $\( bb(R) times L \, hat(upright(bold(g))) \)$, where $hat(upright(bold(g))) = -
    lambda^2 thin upright(d) T^2 + h$, its lift with increasing $T$ from $0$ to $ell$ is a null geodesic up to
    reparametrization. One can see this directly from the null energy relation $lambda^2 dot(T) = E > 0$:
    optical arclength and affine parameter are related by $thin upright(d) s \/ thin upright(d) T =
    lambda^2 \/ E$, and the spatial geodesic equation becomes the optical geodesic equation.
    Use an affine parameter on a compact interval $\[ a \, b \]$ and write its tangent as $k_0$.
  This null curve has no future timelike competitor with endpoints in the fixed-time surfaces ${ 0 } times
    Sigma_0$ and ${ ell } times Sigma_1$. Indeed every such competitor satisfies
  $ ell = integral_a^b dot(T) thin thin upright(d) s > integral_a^b frac(\| dot(x) \|_h, lambda) thin thin
    upright(d) s gt.eq "dist"_(lambda^(- 2) h) \( Sigma_0 \, Sigma_1 \) = ell . $
  We produce a competitor by second variation.
  Choose a parallel orthonormal screen pair $E_1 \, E_2$ along the null geodesic, with $chevron.l E_A \,
    k_0 chevron.r = 0$, initially tangent to ${ 0 } times Sigma_0$.
    At the terminal endpoint, add suitable multiples of $k_0$ to remove their time components.
    Orthogonality to $k_0$ then places them in $T Sigma_1$. Extending these multiples smoothly along the curve
    gives fields $V_A = E_A + b_A k_0$ tangent to the endpoint surfaces, still orthonormal,
    with $chevron.l nabla_(k_0) V_A \, nabla_(k_0) V_A chevron.r = 0$.
    Let $H_0 \, H_1 > 0$ denote the specified mean curvatures.
    The spatial component of $k_0$ is $- c_0 nu_0$ initially and $c_1 nu_1$ terminally, for positive $c_0 \, c_1$.
    The static time slices have zero second fundamental form.
    The endpoint terms in the energy second variation therefore have trace $- c_0 H_0 - c_1 H_1$.
  More explicitly, choose variations with initial and terminal curves in the fixed-time surfaces and first
    variational fields $V_A$. The second variation of $1 / 2 integral chevron.l dot(gamma) \, dot(gamma) chevron.r$ is
  $ I \( V_A \, V_A \) =
    integral_a^b (\| nabla_(k_0) V_A \|^2 - chevron.l R \( V_A \, k_0 \) k_0 \, V_A chevron.r) thin upright(d) s +
    [chevron.l nabla_(V_A) V_A \, k_0 chevron.r]_a^b . $
  At an endpoint, the surface acceleration has normal component $- upright("II")_(nu_j) \( V_A \, V_A \)$.
    This proves the stated signs. Generator multiples do not change the curvature term,
    and summing the screen curvatures gives $"Ric"_(hat(upright(bold(g)))) \( k_0 \, k_0 \) = 0$. Consequently
  #[#set math.equation(numbering: n => "(9.23)")
   $ sum_(A = 1)^2 I \( V_A \, V_A \) = - c_0 H_0 - c_1 H_1 < 0 . $ <geo-negative-null-index>]
  Choose one of these fields with negative index and a smooth variation $gamma_epsilon$ realizing it.
    The first variation of squared speed vanishes pointwise, because $chevron.l nabla_(k_0) V \, k_0 chevron.r =
    0$. Put $q \( s \) = partial_epsilon^2 \| dot(gamma)_epsilon \|^2 \|_(epsilon = 0)$;
    its integral is $2 I \( V \, V \) < 0$. Let $overline(q)$ be its negative average.
    Choose a parallel auxiliary null vector $L_0$ with $chevron.l L_0 \, k_0 chevron.r = - 1$,
    and add to the variation a second-order displacement $1 / 2 epsilon^2 f \( s \) L_0$, where
  $ f \( a \) = 0 \, wide f' \( s \) = 1 / 2 \( q \( s \) - overline(q) \) . $
  Then $f \( b \) = 0$, so the endpoints are unchanged; the second variation of squared speed changes by $-
    2 f'$ and becomes the constant $overline(q) < 0$. Uniform Taylor expansion on $\[ a \, b \]$ now makes the
    varied curve timelike for all sufficiently small nonzero $epsilon$.
    It remains future directed because $dot(T) > 0$ on the original compact segment.
    Its endpoint contacts remain transverse and directed into and out of $L$;
    away from small endpoint intervals the original curve lies a positive distance from the boundary.
    Thus the variation remains in $L$ and is the forbidden timelike competitor. ◻
]

#thm([Proposition 9.9.])[
  (Simple connectivity of the timelike region).  #emph[The connected manifold $P$ is simply connected.]
] <geo-simple-connectivity>

#proof[
  Suppose its universal cover is nontrivial. The ordinary end is a product of a sphere and a ray and is simply
    connected. Its inverse image therefore consists of at least two disjoint copies.
    Truncate every copy at the same large radius $R$. Their boundary faces are compact spheres.
    By Equation (9.2) and the formula for $h$, their mean curvatures for the normals pointing into the removed
    tails satisfy
  $ H_h = frac(2 sqrt(1 + R^2), R) + o \( 1 \) > 0 . $
  The truncated cover is connected: attaching or removing a product tail cannot join different components of its
    complement. By Lemma 99 its intrinsic optical metric is complete and proper.
  Fix one face. The union of all the other faces is a closed set,
    since it is the inverse image of the truncation sphere with the fixed component removed:
    local finiteness in evenly covered neighborhoods makes each component open as well as closed within that
    inverse image. The remaining union is disjoint from the fixed compact face.
    Properness implies that the positive distance between that face and the union is attained.
    A minimizing path has no intermediate contact with a face:
    a later contact with the initial face or an earlier contact with any other face would shorten the selected
    distance. To check its endpoint directions without assuming optical convexity,
    let $rho$ be the inward $k$-distance to the initial face in its smooth normal collar,
    and parametrize the path by unit optical speed from $t = 0$.
    The bound $\| d rho \|_k = 1$ gives $rho \( gamma \( t \) \) lt.eq t$;
    replacing the initial segment by a normal collar segment gives the reverse inequality by minimality.
    Hence $rho \( gamma \( t \) \) = t$ and $dot(gamma) = nabla_k rho$ near the endpoint.
    Apply the same argument backwards at the final face. The path is therefore an interior geodesic with
    transverse orthogonal endpoint contacts. The static equations lift to the cover,
    so Lemma 100 gives a contradiction. ◻
]

=== 9.4 The geometry of a possible interior null set <the-geometry-of-a-possible-interior-null-set>

#thm([Lemma 9.10.])[
  (Foliated coordinates and boundary-leaf equations).  #emph[There is a neighborhood of $Z$ on which $X^flat$
    defines a smooth cooriented integrable plane field. In local foliated coordinates it has the form
#[#set math.equation(numbering: n => "(9.24)")
 $ X^flat = B_1 thin upright(d) y \, wide B_1 > 0 \, wide g = q_y + D_1^2 thin upright(d) y^2 \, wide N =
   B_1 a \( y \) \, wide a gt.eq 0 . $ <geo-null-foliation>]

 At any leaf in the relative boundary of $P$, one has $a = a' = 0$.
   Put $b_1 = sqrt(B_1)$ and let $cal(K)_y$ denote the Gaussian curvature of $q_y$. On such a boundary leaf,
#[#set math.equation(numbering: n => "(9.25)")
 $ "Hess"_(q_y) b_1 = 1 / 2 b_1 \( cal(K)_y + 3 \) q_y \, wide Delta_(q_y) \( b_1^2 \) = 6 b_1^2 -
   a'' . $ <geo-boundary-leaf-system>]

]
] <geo-null-leaf-equations>

#proof[
  The compactness of $Z$ and positivity of $u$ give $X eq.not 0$ on a neighborhood of $Z$.
    On $P$, closedness of $cal(A)$ gives $X^flat and thin upright(d) X^flat = 0$.
    This extends by continuity to the relative boundary of $P$.
    In an open region where $N = 0$, Equation (9.18) and Equation (9.13) give $D_12 = 0$.
    Since the spatial restriction of $thin upright(d) xi^flat$ is $thin upright(d) X^flat =
    2 D_(i j) thin upright(d) x^i ⊗ thin upright(d) x^j$ in components,
    the restriction of $thin upright(d) X^flat$ to $X^perp$ vanishes there also.
    These cases exhaust the neighborhood, proving Frobenius integrability.
  Choose the transverse coordinate oriented so that $X^flat = B_1 thin upright(d) y$ with $B_1 > 0$,
    and transport coordinates within the leaves orthogonally using $g$.
    This gives the metric decomposition in Equation (9.24). On the positive set,
    $thin upright(d) \( B_1 thin upright(d) y \/ N \) = 0$ says that every leaf derivative of $N \/ B_1$ vanishes.
    The same derivatives vanish on the interior of the zero set and, by continuity, on its remaining boundary.
    Thus $N \/ B_1 = a \( y \)$ throughout the coordinate neighborhood.
    Nonnegativity gives $a = a' = 0$ at a zero. A boundary leaf is approached by leaves with $a > 0$.
  We compute the limit of the static equations from those positive leaves. On them,
  $ h = q_y + P_1^2 thin upright(d) y^2 \, wide P_1 = (D_1^2 + B_1 / a)^(1 \/ 2) \, wide lambda = b_1 sqrt(a) . $
  The second fundamental form of a leaf in $h$ is $k_(A B) = \( 2 P_1 \)^(- 1) partial_y q_(A B) =
    O \( sqrt(a) \)$, and $P_1^(- 1) partial_y k_(A B) = O \( a + \| a' \| \)$.
    The tangential Ricci formula is therefore
  $ \( "Ric"_h \)_(A B) = cal(K)_y q_(A B) - P_1^(- 1) \( "Hess"_(q_y) P_1 \)_(A B) + O \( a + \| a' \| \) arrow.r
    cal(K)_y q_(A B) - b_1^(- 1) \( "Hess"_(q_y) b_1 \)_(A B) . $
  The tangential normalized Hessian has the limit
  $ lambda^(- 1) \( "Hess"_h lambda \)_(A B) = b_1^(- 1) \( "Hess"_(q_y) b_1 \)_(A B) +
    O \( a + \| a' \| \) arrow.r b_1^(- 1) \( "Hess"_(q_y) b_1 \)_(A B) . $
  These estimates follow directly by inserting $P_1 = b_1 a^(- 1 \/ 2) \( 1 + a D_1^2 \/ B_1 \)^(1 \/ 2)$;
    all coefficients in their error terms are bounded smooth functions on a fixed coordinate patch.
    The tangential static Ricci equation gives the first equation in Equation (9.25).
  For the scalar equation let $v = sqrt(det q_y)$, $f = log b_1$, and $w = \( 1 + a D_1^2 \/ B_1 \)^(1 \/ 2)$.
    The normal divergence contribution to $lambda^(- 1) Delta_h lambda$ is exactly
  #[#set math.equation(numbering: n => "(9.26)")
   $ frac(1, b_1^2 w v) partial_y [v w^(- 1) (a f_y + a' / 2)] . $ <geo-normal-laplacian-limit>]
  At $a = a' = 0$ it tends to $a'' \/ \( 2 b_1^2 \)$. The tangential contribution tends to $Delta_(q_y) b_1 \/
    b_1 + \| thin upright(d) b_1 \|_(q_y)^2 \/ b_1^2$. Hence $Delta_h lambda = 3 lambda$ gives
  $ b_1 Delta_(q_y) b_1 + \| thin upright(d) b_1 \|_(q_y)^2 + a'' / 2 = 3 b_1^2 \, $
  which is the second equation in Equation (9.25). ◻
]

=== 9.5 Exclusion of flat boundary null leaves <geo-flat-subsection>

Here a boundary null leaf is called flat when $"Hess"_g N = 0$ along it, equivalently when $a'' \( y_0 \) =
  0$ in Equation (9.24). We exclude these leaves first; the remaining null leaves are then ruled out in Proposition 105.

We first give the elementary orbitwise construction needed at a possibly singular compact invariant set.
  The construction produces an arc through each point separately and requires no manifold structure on that set.

#thm([Lemma 9.11.])[
  (A transverse arc with fast backward decay).  #emph[Let $phi.alt_t$ be a smooth complete flow on a smooth
    Riemannian three-manifold $\( M \, g \)$, and let $cal(K) subset M$ be a compact set invariant for all $t in
    bb(R)$. Suppose that a smooth nonvanishing one-form $alpha$ is defined near $cal(K)$, that $E =
    ker alpha$ is preserved by the differential of the flow along $cal(K)$, and that, for every $p in cal(K)$,
    $t gt.eq 0$, and $v in E_p$,
#[#set math.equation(numbering: n => "(9.27)")
 $ \| v \|_g lt.eq \| D phi.alt_t \( p \) v \|_g lt.eq e^t \| v \|_g \, wide alpha_(phi.alt_t \( p \)) compose
   D phi.alt_t \( p \) = e^(2 t) alpha_p . $ <geo-flat-rate-hypotheses>]

 There are constants $epsilon.alt \, C > 0$ such that every $p in
   cal(K)$ admits a $C^1$ embedded arc $gamma_p : \( - epsilon.alt \, epsilon.alt \) arrow.r M$ with
#[#set math.equation(numbering: n => "(9.28)")
 $ gamma_p \( 0 \) = p \, wide alpha_p \( gamma'_p \( 0 \) \) = 1 \, wide
   d_g #scale(x: 120%, y: 120%)[\(] phi.alt_(- t) \( gamma_p \( xi \) \) \,
   phi.alt_(- t) \( p \) #scale(x: 120%, y: 120%)[\)] lt.eq C \| xi \| e^(- 3 t \/ 2) quad \( t gt.eq 0 \) .
   $ <geo-flat-arc-conclusion>]

 By decreasing $epsilon.alt$, all the backward arcs can be kept in any prescribed neighborhood of $cal(K)$.
   No regularity of the family $p mapsto gamma_p$ is asserted or needed.]
] <geo-flat-fast-arc>

#proof[
  #emph[An invariant transverse line.] Write $f = phi.alt_1$ and use the smooth complementary vector
  $ nu_p = frac(alpha_p^sharp, \| alpha_p \|_g^2) \, wide alpha_p \( nu_p \) = 1 . $
  Relative to $T_p M = E_p xor bb(R) nu_p$, the forward derivative has the block form
  #[#set math.equation(numbering: n => "(9.29)")
   $ D f_p = mat(delim: "(", A_p, B_p; 0, e^2) \, wide lr(bar.v.double A_p bar.v.double) lt.eq
     e . $ <geo-flat-forward-blocks>]
  Here $B_p in E_(f \( p \))$ and $sup_(cal(K)) \| B_p \|_g < oo$.
    Fix a full orbit $p_n = f^n \( p \)$, $n in bb(Z)$. A transverse line at $p_n$ with generator $nu_(p_n) +
    v_n$, $v_n in E_(p_n)$, is invariant precisely when its slopes satisfy
  #[#set math.equation(numbering: n => "(9.30)")
   $ v_(n + 1) = e^(- 2) \( A_(p_n) v_n + B_(p_n) \) . $ <geo-flat-slope-recurrence>]
  Each affine map in this recurrence contracts differences by at most $e^(- 1)$.
    Starting with slope zero at $p_(n - k)$ and letting $k arrow.r
    oo$ therefore gives a bounded solution at $p_n$; the solutions at different indices obey the same recurrence.
    Equivalently, one may sum the absolutely convergent series obtained by repeated substitution. Its bound is
  #[#set math.equation(numbering: n => "(9.31)")
   $ sup_(n in bb(Z)) \| v_n \|_g lt.eq frac(sup_(cal(K)) \| B \|_g, e^2 - e) . $ <geo-flat-slope-bound>]
  The bounded solution is unique: the difference of two such solutions at index $n$ is at most $e^(- k)$ times
    their uniformly bounded difference at index $n - k$.
  Set $u_n = nu_(p_n) + v_n$ and $U_n = bb(R) u_n$. Then
  $ alpha_(p_n) \( u_n \) = 1 \, wide D f_(p_n) u_n = e^2 u_(n + 1) . $
  Compactness, nonvanishing of $alpha$, and Equation (9.31) give uniform equivalence between the ambient norm and
    the norm
  $ \| \( s \, w \) \|_n = max { \| s \| \, \| w \|_g } \, wide s u_n + w in U_n xor E_(p_n) . $
  In particular these transverse lines have angles uniformly bounded away from zero relative to $E$.
  #emph[Uniform charts and backward products.] Put $q_j = p_(- j)$ for $j gt.eq 0$. Choose centered charts
  $ Psi_j \( s \, w \) = exp_(q_j) \( s u_(- j) + w \) \, wide w in E_(q_j) . $
  They and their inverses have uniformly bounded derivatives on suitable fixed radii.
    This follows from compactness and the uniformly bounded linear coordinate changes just constructed.
    No derivatives of $U_n$ as a function of $p_n$ are used. On a fixed smaller radius $rho > 0$,
    the backward time-one maps in these charts have the form
  #[#set math.equation(numbering: n => "(9.32)")
   $ Psi_(j + 1)^(- 1) compose phi.alt_(- 1) compose Psi_j \( z \) = mat(delim: "(", c, 0; 0, T_j) z +
     R_j \( z \) \, wide c = e^(- 2) \, $ <geo-flat-backward-maps>]
  where $T_j = D phi.alt_(- 1) \|_(E_(q_j))$ maps $E_(q_j)$ onto $E_(q_(j + 1))$.
    The remainders satisfy, in the displayed norms,
  #[#set math.equation(numbering: n => "(9.33)")
   $ R_j \( 0 \) = 0 \, wide D R_j \( 0 \) = 0 \, wide sup_(j gt.eq 0 \, thin \| z \| lt.eq rho)
     lr(bar.v.double D^2 R_j \( z \) bar.v.double) lt.eq M_0 $ <geo-flat-remainders>]
  for some finite $M_0$. We increase $M_0$ to a positive number if necessary. Equation (9.27) gives
  #[#set math.equation(numbering: n => "(9.34)")
   $ parallel T_j^(- 1) T_(j + 1)^(- 1) dots.h.c T_i^(- 1) #scale(x: 120%, y: 120%)[parallel] lt.eq
     e^(i - j + 1) wide \( i gt.eq j \) . $ <geo-flat-inverse-products>]
  Indeed that product is the forward leaf derivative from $q_(i + 1)$ to $q_j$.
  #emph[The two Green sums.] Fix $beta = 3 \/ 2$ and consider the Banach space of sequences
    $z_j = \( s_j \, w_j \) in bb(R) xor E_(q_j)$ with norm
  $ lr(bar.v.double z bar.v.double)_beta = sup_(j gt.eq 0) e^(beta j) max { \| s_j \| \, \| w_j \|_g } . $
  For a forcing sequence $r_j = \( r_j^s \, r_j^E \)$ taking values in $bb(R) xor E_(q_(j + 1))$,
    use the analogous norm with weight $e^(beta j)$. Define
  #[#set math.equation(numbering: n => "(9.35)")
   $ \( G r \)_j^s & = sum_(i = 0)^(j - 1) c^(j - 1 - i) r_i^s \,\
\( G r \)_j^E & = - sum_(i = j)^oo T_j^(- 1) T_(j + 1)^(- 1) dots.h.c T_i^(- 1) r_i^E . $ <geo-flat-green-sums>]
  The first sum is empty when $j = 0$. Both sums converge in the indicated weighted norm.
    More generally, for $1 < beta < 2$,
  #[#set math.equation(numbering: n => "(9.36)")
   $ lr(bar.v.double G bar.v.double) lt.eq Gamma_beta \, wide Gamma_beta = max {frac(e^beta, 1 - e^(beta - 2)) \,
     thin frac(e, 1 - e^(1 - beta))} . $ <geo-flat-green-bound>]
  For the first sum, setting $k = j - 1 - i$ bounds its weighted norm by $e^beta sum_(k gt.eq 0)
    e^(\( beta - 2 \) k) lr(bar.v.double r bar.v.double)_beta$.
    For the second, Equation (9.34) gives the bound $e sum_(k gt.eq 0) e^(\( 1 - beta \) k)
    lr(bar.v.double r bar.v.double)_beta$.
  Prescribe a small initial transverse coordinate $xi in bb(R)$ and put $cal(H) \( xi \)_j = \( c^j xi \, 0 \)$.
    The desired orbit sequence is a fixed point of
  #[#set math.equation(numbering: n => "(9.37)")
   $ z = cal(H) \( xi \) + G cal(R) \( z \) \, wide cal(R) \( z \)_j = R_j \( z_j \) . $ <geo-flat-fixed-point>]
  Choose $0 < delta < rho$ so small that
  #[#set math.equation(numbering: n => "(9.38)")
   $ theta.alt_0 := Gamma_beta M_0 delta lt.eq 1 / 2 \, wide \| xi \| lt.eq 1 / 2 delta . $ <geo-flat-parameter-choice>]
  On the closed ball $lr(bar.v.double z bar.v.double)_beta lt.eq delta$, Equation (9.33) yields
  $ lr(bar.v.double cal(R) \( z \) bar.v.double)_beta lt.eq 1 / 2 M_0 delta^2 \, wide
    lr(bar.v.double cal(R) \( z \) - cal(R) \( tilde(z) \) bar.v.double)_beta lt.eq
    M_0 delta lr(bar.v.double z - tilde(z) bar.v.double)_beta . $
  Consequently the right side of Equation (9.37) maps that ball into its ball of radius $3 delta \/
    4$ and contracts distances by at most $theta.alt_0$. The contraction principle gives a unique fixed point
    there, with
  #[#set math.equation(numbering: n => "(9.39)")
   $ lr(bar.v.double z \( xi \) bar.v.double)_beta lt.eq frac(\| xi \|, 1 - theta.alt_0) lt.eq
     2 \| xi \| . $ <geo-flat-sequence-decay>]
  Substituting the sums in Equation (9.35) shows that this fixed point satisfies Equation (9.32) at every step,
    with $s_0 = xi$. It therefore represents an actual backward orbit,
    rather than a sequence of approximate orbit points.
  #emph[Dependence on the initial coordinate.] The same contraction estimate gives
  $ lr(bar.v.double z \( xi + h \) - z \( xi \) bar.v.double)_beta lt.eq frac(\| h \|, 1 - theta.alt_0) . $
  The map $cal(R)$ is continuously differentiable on this sequence ball:
    its derivative acts pointwise by $D R_j \( z_j \)$, and the uniform second-derivative bound in Equation (9.33)
    bounds the remainder in the weighted norm.
    In particular $lr(bar.v.double G D cal(R) \( z \( xi \) \) bar.v.double) lt.eq theta.alt_0$.
    Inverting by a Neumann series gives
  #[#set math.equation(numbering: n => "(9.40)")
   $ D z \( xi \) h = #scale(x: 120%, y: 120%)[\(] I - G D cal(R) \( z \( xi \) \)
     #scale(x: 120%, y: 120%)[\)]^(- 1) cal(H) \( h \) . $ <geo-flat-parameter-derivative>]
  For clarity, this is a genuine Fréchet derivative: Taylor’s estimate and the preceding Lipschitz bound give
  $ parallel z \( xi + h \) - z \( xi \) - D z \( xi \) h #scale(x: 120%, y: 120%)[parallel]_beta lt.eq
    frac(Gamma_beta M_0, 2 \( 1 - theta.alt_0 \)^3) \| h \|^2 . $
  The derivative is continuous by the same uniform estimates.
    At $xi = 0$, the fixed point is zero and $D cal(R) \( 0 \) = 0$,
    so $D z \( 0 \) h = \( \( c^j h \, 0 \) \)_(j gt.eq 0)$.
  Define $gamma_p \( xi \) = Psi_0 \( z_0 \( xi \) \)$. Its initial derivative is $u_0$,
    hence $alpha_p \( gamma'_p \( 0 \) \) = 1$. Since $s_0 = xi$,
    it is an embedded graph in this chart on a smaller interval.
    Uniform comparison between chart and ambient distances, together with Equation (9.39),
    proves Equation (9.28) at integer times. The smooth flow has uniformly bounded derivatives near $cal(K)$ for
    times in $\[ - 1 \, 0 \]$; decreasing the chart radius if necessary gives the same estimate for all
    intervening times. Compactness makes all constants uniform in $p$.
    Shrinking $epsilon.alt$ then keeps the whole backward arc in any prescribed neighborhood of $cal(K)$. ◻
]

#thm([Lemma 9.12.])[
  (Flat boundary null leaves cannot occur).  #emph[Let $\( M \, g \)$ be a smooth three-dimensional Riemannian
    manifold and let $N in C^oo \( M \)$ be nonnegative, with compact zero set $Z = { N = 0 }$.
    Put $P = { N > 0 }$, with boundary taken in $M$. Suppose a neighborhood $U$ of $Z$ carries a smooth
    nonvanishing one-form $alpha$ defining a cooriented foliation by two-dimensional leaves.
    Assume that every sufficiently small foliated chart can be written as
#[#set math.equation(numbering: n => "(9.41)")
 $ alpha = B thin upright(d) y \, wide B > 0 \, wide N = B thin a \( y \) \, wide a gt.eq 0 \,
   $ <geo-flat-factorization>]

 with smooth coefficients. Let $q$ be the induced metric on a plaque $Sigma = { y = y_0 } subset partial P$,
   let $K_Sigma$ be its Gaussian curvature, and put $b = sqrt(B)$.
   Suppose the following leaf equations hold on every such plaque:
#[#set math.equation(numbering: n => "(9.42)")
 $ "Hess"_Sigma b = 1 / 2 b \( K_Sigma + 3 \) q \, wide Delta_Sigma \( b^2 \) = 6 b^2 -
   a'' \( y_0 \) . $ <geo-flat-leaf-equations>]

 Then $"Hess"_g N \( p \) eq.not 0$ for every $p in partial P$.
   Equivalently, every boundary zero in Equation (9.41) satisfies $a'' \( y_0 \) > 0$.]
] <geo-flat-exclusion>

#proof[
  #emph[The intrinsic vector field and the compact flat set.] On a foliated chart define
  $ f = log b \, wide Y = nabla_Sigma f \, wide L = \| Y \|_g^2 . $
  On an overlap of cooriented charts the transverse coordinates satisfy $tilde(y) =
    theta.alt \( y \)$ with $theta.alt' > 0$ after restriction to an overlap plaque. Consequently
  $ tilde(B) = frac(B, theta.alt' \( y \)) \, wide log sqrt(tilde(B)) = log sqrt(B) - 1 / 2 log theta.alt' \( y \) . $
  The last term has zero leaf derivative. Thus $Y$ and $L$ are globally defined smooth fields on $U$,
    even though $f$ need not be a global function. The vector field $Y$ is tangent to the foliation.
  At a zero $y_0$ of $a$, nonnegativity gives $a' \( y_0 \) = 0$, and direct differentiation of Equation (9.41) gives
  #[#set math.equation(numbering: n => "(9.43)")
   $ "Hess"_g N = B thin a'' \( y_0 \) thin upright(d) y ⊗ upright(d) y quad upright("on the plaque ") { y =
     y_0 } . $ <geo-flat-hessian-zero>]
  In particular flatness, meaning $a'' \( y_0 \) = 0$, is independent of the chosen transverse coordinate.
    The boundary property is also constant along a plaque: $N > 0$ on that chart exactly where $a \( y \) > 0$. The set
  #[#set math.equation(numbering: n => "(9.44)")
   $ F = partial P ∩ { "Hess"_g N = 0 } $ <geo-flat-compact-flat-set>]
  is therefore closed in $Z$, compact, and locally a union of whole plaques. It is preserved by the local flow of $Y$.
  Choose a neighborhood $U_0$ of $Z$ with compact closure in $U$ and multiply $Y$ by a smooth compactly supported
    cutoff equal to one near $overline(U_0)$. Extend the resulting field by zero to $M$ and denote its complete
    flow by $phi.alt_t$. Compact support ensures completeness.
    On $F$ this flow agrees with the original leafwise flow for all times:
    local plaque invariance and closedness of $F$ show that ${ t :
    phi.alt_t \( p \) in F }$ is both open and closed in $bb(R)$ for every $p in F$.
    In all subsequent uses outside $F$ we keep the flow inside $U_0$, where the cutoff equals one.
  #emph[The logistic identity.] On a flat plaque, tracing the first equation in Equation (9.42) gives $Delta_Sigma
    b = b \( K_Sigma + 3 \)$. The second then gives
  $ 6 b^2 = Delta_Sigma \( b^2 \) = 2 b^2 \( K_Sigma + 3 \) + 2 \| upright(d)_Sigma b \|_q^2 . $
  It follows that
  #[#set math.equation(numbering: n => "(9.45)")
   $ K_Sigma = - L \, wide "Hess"_Sigma f = frac(3 - L, 2) q - upright(d)_Sigma f ⊗ upright(d)_Sigma f \, wide
     Y \( L \) = 3 L \( 1 - L \) . $ <geo-flat-logistic-identities>]
  For the last identity, use $Y \( L \) = 2 "Hess"_Sigma f \( Y \, Y \)$.
  Since $F$ is compact and invariant, $L$ is bounded on every complete orbit in $F$.
    A logistic solution with $L \( 0 \) > 1$ has the explicit form
  $ L \( t \) = frac(L \( 0 \) e^(3 t), 1 - L \( 0 \) + L \( 0 \) e^(3 t)) $
  and blows up in finite negative time. Thus $0 lt.eq L lt.eq 1$ on $F$.
    Suppose for contradiction that $F$ is nonempty. On any flat plaque $L$ cannot vanish identically:
    that would give $Y = 0$ and $"Hess"_Sigma f = 0$, whereas Equation (9.45) would give $"Hess"_Sigma f = 3 /
    2 q$. Hence some point of $F$ has $L > 0$. The forward logistic orbit through this point has $L \( t \)
    arrow.r 1$. Compactness supplies an accumulation point with $L = 1$, so
  #[#set math.equation(numbering: n => "(9.46)")
   $ F_1 = F ∩ { L = 1 } $ <geo-flat-unit-set>]
  is a nonempty compact set invariant under the full flow.
  #emph[Leaf and transverse derivative rates.] Along $F_1$, Equation (9.45) becomes
  #[#set math.equation(numbering: n => "(9.47)")
   $ "Hess"_Sigma f = q - upright(d)_Sigma f ⊗ upright(d)_Sigma f \, wide \| Y \|_g = 1 . $ <geo-flat-unit-hessian>]
  For a leaf-tangent vector $v \( t \) = D phi.alt_t \( p \) v \( 0 \)$, $p in F_1$,
    the usual derivative of its squared length within the leaf is
  $ frac(upright(d), upright(d) t) \| v \( t \) \|_g^2 = 2 "Hess"_Sigma f \( v \( t \) \, v \( t \) \) =
    2 #scale(x: 120%, y: 120%)[\(] \| v \( t \) \|_g^2 - chevron.l Y \,
    v \( t \) chevron.r_g^2 #scale(x: 120%, y: 120%)[\)] . $
  This lies between zero and $2 \| v \( t \) \|_g^2$. Integration gives the two tangent inequalities in
    Equation (9.27). Furthermore, throughout $U_0$, tangency of $Y$ implies $Y \( y \) = 0$ and
  #[#set math.equation(numbering: n => "(9.48)")
   $ cal(L)_Y alpha = Y \( B \) thin upright(d) y = 2 L alpha \, wide Y \( N \) =
     2 L N . $ <geo-flat-alpha-and-n-evolution>]
  Here $Y \( log B \) = 2 Y \( f \) = 2 L$; the second identity also holds where $N = 0$,
    by the smooth factorization. Since $L = 1$ along $F_1$, the first identity gives $alpha_(phi.alt_t \( p \))
    compose D phi.alt_t \( p \) = e^(2 t) alpha_p$. All hypotheses of Lemma 103 therefore hold with $cal(K) =
    F_1$ and $E = ker alpha$.
  #emph[The two incompatible decay bounds.] Fix $p in F_1$ and apply Lemma 103.
    By compactness and continuity choose a neighborhood $V$ of $F_1$, with closure in $U_0$, on which $L lt.eq
    5 \/ 4$. Shrink the resulting transverse arc so that all its backward trajectories remain in $V$.
    If one of its points $q = gamma_p \( xi \)$ had $N \( q \) > 0$,
    the second equation in Equation (9.48) would give, for every $t gt.eq 0$,
  #[#set math.equation(numbering: n => "(9.49)")
   $ N \( phi.alt_(- t) \( q \) \) =
     N \( q \) exp (- integral_0^t 2 L \( phi.alt_(- s) \( q \) \) thin upright(d) s) gt.eq
     N \( q \) e^(- 5 t \/ 2) . $ <geo-flat-n-lower-bound>]
  In particular the trajectory remains positive at each finite time.
  On the other hand, $N$ and $upright(d) N$ vanish at every point of $F_1$, because $N$ is smooth and nonnegative.
    Its Hessian is uniformly bounded on a compact neighborhood of $F_1$.
    Taylor’s Theorem in uniform normal-coordinate balls therefore gives
  $ 0 lt.eq N \( x \) lt.eq C_0 d_g \( x \, z \)^2 quad upright("when ") z in F_1 upright(" and ") x
    upright(" is sufficiently close to ") z . $
  Apply this with $z = phi.alt_(- j) \( p \)$, $x = phi.alt_(- j) \( q \)$ and use Equation (9.28).
    Uniformly for all integers $j gt.eq 0$,
  #[#set math.equation(numbering: n => "(9.50)")
   $ N \( phi.alt_(- j) \( q \) \) lt.eq C_1 \| xi \|^2 e^(- 3 j) . $ <geo-flat-n-upper-bound>]
  Equations (9.49) and (9.50) imply $N \( q \) lt.eq C_1 \| xi \|^2 e^(- j \/ 2)$ for every $j$, a contradiction.
    Thus $N$ vanishes on the whole small arc.
  In a foliated chart at $p$, transversality gives $frac(upright(d), upright(d) xi)
    y \( gamma_p \( xi \) \) \|_(xi = 0) eq.not 0$. After restriction,
    the transverse coordinate of the arc covers an open interval containing $y \( p \)$.
    Equation (9.41) and positivity of $B$ then imply that $a$ vanishes on that interval.
    This gives an open neighborhood of $p$ on which $N = 0$, contradicting $p in partial P$. Hence $F$ is empty.
    Finally $a'' gt.eq 0$ at any zero of the nonnegative function $a$,
    so Equation (9.43) proves the stated strict positivity at every boundary zero. ◻
]

#thm([Proposition 9.13.])[
  (No interior null set).  #emph[One has $Z = diameter$, and hence $P = M$.]
] <geo-no-null-set>

#proof[
  Apply Lemma 104 with $alpha = X^flat$; its hypotheses are precisely the compactness in Lemma 94 and the
    factorization and equations in Lemma 102. Every boundary zero therefore satisfies $a'' > 0$.
    It is therefore an isolated zero in the transverse coordinate,
    and its neighborhood consists of a smooth two-sided zero leaf with $P$ on both sides.
    There can be no open null region. Indeed, if the interior of $Z$ were nonempty,
    it would have a boundary in the connected manifold $M$, since $P$ is nonempty.
    Such a boundary point lies in $partial P$ and would have the just-described neighborhood with no open zero
    region, a contradiction. Thus all of $Z$ equals $partial P$, and it is a compact embedded hypersurface.
    The local isolation and compactness give only finitely many components.
    The nonvanishing global form $X^flat$ coorients each of them.
  On a component of $Z$, the local positive functions $B_1 \/ a''$ patch to a global smooth function.
    To check this, another oriented transverse coordinate has the form $tilde(y) =
    phi.alt \( y \)$ with $phi.alt' > 0$. At a zero leaf,
  $ tilde(B)_1 = B_1 \/ phi.alt' \, wide tilde(a) = phi.alt' a \, wide tilde(a)'' = a'' \/ phi.alt' \, $
  where the last derivatives use $tilde(y)$ and $a = a' = 0$. The quotient is therefore invariant.
    Since $a''$ is constant along each plaque, Equation (9.25) gives
  $ Delta_(q_y) (B_1 / a'') = 6 B_1 / a'' - 1 . $
  The maximum and minimum principles on the compact component imply $B_1 \/ a'' = 1 \/ 6$.
    Its leaf derivative is zero; thus $b_1$ is constant along each plaque,
    and the first equation in Equation (9.25) gives $cal(K)_y = - 3$.
  Cut the original manifold along these finitely many two-sided components and truncate its ordinary end.
    The resulting compact orientable three-manifold $L$ is connected and has interior homotopy equivalent to $P$:
    the end and each of the original and cut boundary collars are product collars,
    which may be shortened without changing homotopy type. Proposition 101 therefore gives $H_1 \( L \; bb(Z) \) =
    H^1 \( L \; bb(Z) \) = 0$. Poincaré–Lefschetz duality and the boundary long exact sequence give
  $ H_2 \( L \, partial L \; bb(Z) \) tilde.equiv H^1 \( L \; bb(Z) \) = 0 \, wide 0 =
    H_2 \( L \, partial L \; bb(Z) \) arrow.r H_1 \( partial L \; bb(Z) \) arrow.r H_1 \( L \; bb(Z) \) = 0 . $
  Consequently every component of the orientable boundary is a sphere.
    In particular each cut copy of a component of $Z$ is a sphere,
    incompatible with its constant Gaussian curvature $- 3$ by Gauss–Bonnet. Thus $Z$ must have been empty. ◻
]

=== 9.6 The regular boundary of the quotient <the-regular-boundary-of-the-quotient>

#thm([Lemma 9.14.])[
  (Static boundary collars and the time primitive).  #emph[ The metric $h$ has the regular completion at $S$
    stated in Equation (9.7). If $u \|_S = 0$, its boundary structure is the original smooth boundary structure
    and $cal(A)$ extends smoothly to $S$. If $u \|_S > 0$, use $N$ as the original defining function and use
    $lambda = sqrt(N)$ as the quotient defining function. The quotient metric extends smoothly by reflection
    $lambda mapsto - lambda$; its diagonal blocks are even and mixed block odd. In the original collar,
#[#set math.equation(numbering: n => "(9.51)")
 $ cal(A) = frac(1, 2 kappa_h) thin upright(d) log N + beta \, wide
   beta upright(" is smooth and closed up to ") S . $ <geo-positive-A-collar>]

 In quotient normal distance $rho$ from $S$, both cases satisfy
#[#set math.equation(numbering: n => "(9.52)")
 $ h = thin upright(d) rho^2 + q_0 + O \( rho^2 \) \, wide lambda = kappa_h rho + O \( rho^3 \) \,
   $ <geo-normal-boundary-jets>]

 with smooth one-sided coefficients. For a global primitive $thin upright(d) H = - cal(A)$, one has, respectively,
#[#set math.equation(numbering: n => "(9.53)")
 $ H upright(" smooth up to ") S \, wide upright("or") wide H = - frac(1, 2 kappa_h) log N + B_0 \, quad
   B_0 upright(" smooth up to ") S . $ <geo-time-collar>]

]
] <geo-boundary-collars>

#proof[
  In the zero-lapse case put $d = a^2 - s^2 \| W \|_g^2$ in Equation (9.12). Then
  $ h = g + s^2 d^(- 1) W^flat ⊗ W^flat \, wide lambda = s sqrt(d) \, wide cal(A) = d^(- 1) W^flat \, wide
    d \|_S = kappa_h^2 . $
  These are smooth in the original collar and give $h \|_(T S) = g \|_(T S)$ and $partial_(nu_h) lambda =
    kappa_h$. The static Hessian equation extends to $S$ and gives $"Hess"_h lambda = 0$ there.
    Its tangential restriction is $kappa_h upright("II")_h$, proving $upright("II")_h = 0$.
  If $u \|_S > 0$, Equation (9.11) makes $N$ a smooth original defining function.
    In coordinates $\( N \, y^1 \, y^2 \)$, smooth division of the tangential components gives
  $ X^flat = a_0 \( N \, y \) thin upright(d) N + N beta_A \( N \, y \) thin upright(d) y^A \, wide
    a_0 \( 0 \, y \) = frac(1, 2 kappa_h) . $
  The change $N = lambda^2$ gives the metric coefficients
  #[#set math.equation(numbering: n => "(9.54)")
   $ h_(lambda lambda) & = 4 lambda^2 g_(N N) + 4 a_0^2 \, & h_(lambda A) & =
     2 lambda \( g_(N A) + a_0 beta_A \) \, & h_(A B) & = g_(A B) + lambda^2 beta_A beta_B \, $ <geo-even-odd-collar>]
  with the coefficients on the right evaluated at $\( lambda^2 \, y \)$.
    They are smooth across $lambda = 0$ with the stated parity.
    At zero the normal block is $kappa_h^(- 2)$, the mixed block vanishes,
    and the tangential block is $g \|_(T S)$, so this is a nondegenerate smooth Riemannian extension.
    Reflection is an isometry; its fixed hypersurface is totally geodesic.
    The normal derivative of $lambda$ is $kappa_h$. In either case,
    quotient Gaussian coordinates and $upright("II")_h = 0$ give $partial_rho q_rho \|_0 = 0$.
    The static equation gives $partial_rho^2 lambda \|_0 = 0$, proving Equation (9.52).
  Since $a_0 - \( 2 kappa_h \)^(- 1)$ vanishes at $N = 0$, division by $N$ also gives Equation (9.51).
    Its remainder is closed by $thin upright(d) cal(A) = 0$ in the interior and smoothness at the boundary.
    Simple connectivity and Lemma 97 give a global $H$ with $thin upright(d) H = - cal(A)$.
    In either case subtract the displayed singular term, if present.
    The remaining differential is smooth in the original collar.
    Fixing values on one interior collar section and integrating the normal derivative to $S$ gives a smooth
    extension; its tangential derivatives agree with the prescribed differential by continuity.
    This proves Equation (9.53). ◻
]

#proof[
  Propositions 101 and 105 give $P = M$ and its simple connectivity.
    Lemmas 97, 98, and 106 prove the stated closedness, equations, and boundary data.
  The quotient completion has the same underlying topology as $Omega$:
    in the positive-lapse case $N mapsto sqrt(N)$ changes the boundary smooth structure but is a homeomorphism of
    the closed collar, and its restriction to $S$ is the identity.
    To check completeness, let a path have finite $h$-length.
    Since $h gt.eq g$ in the interior, it is a $g$-Cauchy path and has a limit in the complete original manifold
    with boundary. An interior limit is an ordinary smooth quotient point because $N > 0$ there.
    A limit on $S$ is included by Lemma 106; in its smooth quotient collar the same path tends to that boundary
    point. The unique ordinary end has infinite $g$-distance, and hence infinite $h$-distance.
    These exhaust all possible finite-length escapes and prove completeness.
  Finally, Equation (9.2) gives $N = V_0^2 \( 1 + O_2 \( r^(- tau') \) \)$.
    Since spatial lowering by $g$ preserves the stated end orders,
  $ N^(- 1) X^flat ⊗ X^flat = O_2 \( r^(- 2 tau') \) \, wide sqrt(N) - V_0 = O_2 \( r^(1 - tau') \) . $
  These are Equation (9.8). In particular the attached boundary is compact,
    the quotient has the single designated end, and no additional completion points have been introduced. ◻
]

== 10 The static base and its conformal compactification <st-section>

We continue under the connected-horizon equality hypotheses. Write

$ A_0 = "Area"_g \( S \) = 4 pi r_h^2 \, wide m = m_(upright("AH")) = frac(r_h + r_h^3, 2) \, wide kappa =
  frac(1 + 3 r_h^2, 2 r_h) . $

The asymptotic spatial chart is balanced, so that the original metric mass covector is $\( m \, 0 \, 0 \, 0 \)$.
  The preceding section constructed the smooth functions and fields $u \, X \, N \,
  lambda$ and the static metric $h$ on the original open exterior. In particular,

#[#set math.equation(numbering: n => "(10.1)")
 $ N & = u^2 - \| X \|_g^2 > 0 \,\
h & = g + N^(- 1) X^flat ⊗ X^flat \, wide lambda = sqrt(N) \,\
Delta_h lambda & = 3 lambda \, wide "Hess"_h lambda = lambda \( "Ric"_h + 3 h \) \, wide R_h = -
  6 . $ <st-static-equations>]

Here and below the flat symbol on $X$ denotes lowering with the original metric $g$.
  The one-form $cal(A) = X^flat \/ N$ is closed, and the open exterior is simply connected by 93.
  These conclusions concern the original exterior, rather than an auxiliary deformed manifold.

=== 10.1 Completion at the horizon and preservation of equality <completion-at-the-horizon-and-preservation-of-equality>

#thm([Proposition 10.1.])[
  (The complete equality base).  #emph[The metric $h$ has a smooth completion by the original boundary $S$,
    with its possibly changed transverse smooth coordinate. Its boundary data are
#[#set math.equation(numbering: n => "(10.2)")
 $ h \|_(T S) = g \|_(T S) \, wide lambda \|_S = 0 \, wide partial_(nu_h) lambda = kappa \, wide
   upright("II")_h \|_S = 0 . $ <st-base-boundary>]

 The completed metric is complete, and $S$ is outer area-minimizing for $h$.
   Its four metric fluxes agree with those of $g$ in the original balanced chart. In particular,
#[#set math.equation(numbering: n => "(10.3)")
 $ A_(min \, h) \( S \) = A_0 \, wide p \( h \) = \( m \, 0 \, 0 \, 0 \) \, wide p_0 \( h \) =
   frac(r_h + r_h^3, 2) . $ <st-base-equality-data>]

 For some $tau_1 > 3 \/ 2$, the end satisfies
#[#set math.equation(numbering: n => "(10.4)")
 $ h - b = O_(2 \, alpha_1) \( r^(- tau_1) \) \, wide lambda - V_0 = O_(2 \, alpha_1) \( r^(1 - tau_1) \) \, wide
   h - g = O_(2 \, alpha_1) \( r^(- 2 tau_1) \) . $ <st-base-decay>]

 The last estimate is in physical tensor norm.]
] <st-base-equality>

#proof[
  We spell out the completion because the original boundary smooth structure is needed again in the spacetime
    reconstruction. The boundary alternatives and first jets are supplied by Theorem 8.1, Lemma 9.14.
  Suppose first that $u \|_S > 0$. Then $N$ is an original smooth defining function, positive into the exterior, and
  $ X^flat \|_S = frac(1, 2 kappa) thin d N \|_S . $
  In coordinates $\( N \, y \)$ on a collar, smooth division gives
  $ X^flat = a \( N \, y \) thin d N + N beta_A \( N \, y \) thin d y^A \, wide a \( 0 \, y \) = frac(1, 2 kappa) . $
  Set $N = lambda^2$. The coefficients of the base metric become
  #[#set math.equation(numbering: n => "(10.5)")
   $ h_(lambda lambda) & = 4 lambda^2 g_(N N) + 4 a^2 \,\
h_(lambda A) & = 2 lambda \( g_(N A) + a beta_A \) \,\
h_(A B) & = g_(A B) + lambda^2 beta_A beta_B \, $ <st-even-collar>]
  where the right sides are evaluated at $\( lambda^2 \, y \)$.
    These coefficients extend smoothly through $lambda = 0$, with even diagonal blocks and an odd mixed block.
    Reflection in $lambda = 0$ is an isometry. At the boundary, $h_(lambda lambda) =
    kappa^(- 2)$ and $h_(lambda A) = 0$, proving the first three assertions in (10.2);
    its fixed hypersurface is totally geodesic.
  If $u \|_S = 0$, let $s$ be the original inward-to-domain normal coordinate. The preceding boundary jets give
  $ u = s a \( s \, y \) \, wide X = s^2 Y \( s \, y \) \, wide a \( 0 \, y \) = kappa . $
  Consequently, with $D = a^2 - s^2 \| Y \|_g^2$,
  $ h = g + s^2 D^(- 1) Y^flat ⊗ Y^flat \, wide lambda = s sqrt(D) \, wide D \|_S = kappa^2 . $
  These are smooth in the original collar. The static Hessian equation extends continuously to $S$ and gives
    $"Hess"_h lambda = 0$ there. Its tangential part is $kappa upright("II")_h$,
    so the boundary is totally geodesic. In $h$-Gaussian distance $rho$ it also gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ h = d rho^2 + q \( rho \) \, wide q' \( 0 \) = 0 \, wide lambda = kappa rho +
     O \( rho^3 \) . $ <st-gaussian-boundary-jets>]
  The completion has the same underlying topology as the original closed exterior.
    A finite-length escaping $h$-curve is a finite-length $g$-curve because $h gt.eq g$.
    Completeness of the original metric space therefore gives a limit in the original closed exterior.
    Interior points are ordinary smooth base points because $N > 0$ everywhere in the interior,
    and points of $S$ have just been attached by regular collars.
    The end has infinite $h$-length by its hyperbolic asymptotics. Thus there is no missing finite-length escape.
  For an interior smooth enclosing cut, the quadratic-form inequality $h gt.eq
    g$ gives its $h$-area at least its $g$-area, which is at least $A_0$.
    A cut smooth in the completed base and meeting $S$ can be approximated, in area,
    by cuts whose meeting portions have been moved a positive distance into a collar.
    To see that the full-boundary convention is preserved, apply a smooth inward collar map to the entire exterior
    domain defining the cut, taper it to the identity outside a fixed collar,
    and take its full intrinsic boundary. In the positive-lapse case perform this construction in the regular
    $lambda$ collar and keep the displacement positive before regarding the cut as an original smooth interior
    cut. Collar smoothness makes the area error tend to zero.
    Hence every completed-base cut has area at least $A_0$, while $S$ itself has area $A_0$ and remains an
    admissible full boundary.
  Choose
  $ 3 / 2 < tau_1 < min \( 2 \, tau_(upright("data")) \) $
  slightly below the exponent in the adjoint end estimates.
    Those estimates give $u - V_0 \, X = O_(2 \, alpha_1) \( r^(1 - tau_1) \)$.
    Since $N tilde.op r^2$, the identity defining $h$ gives the final estimate in (10.4).
    The identity $lambda - u = - \| X \|_g^2 \/ \( u + lambda \)$ gives the estimate for $lambda$;
    the estimate for $h - b$ follows from that for $g - b$.
  Each metric-flux integrand is linear in the error and its first background derivative and has a static-potential
    factor of size $O \( r \)$. The difference contributed by $h -
    g$ is therefore $O \( r^(3 - 2 tau_1) \)$ after integration over a coordinate sphere, and tends to zero.
    The same estimate holds for all four potentials. The existing mass limits of $g$ consequently give the stated
    limits for $h$. This proves (10.3) and the proposition. ◻
]

=== 10.2 The Riemannian Einstein metric <the-riemannian-einstein-metric>

Use a circle coordinate $theta$ of any fixed positive period on the end and put

#[#set math.equation(numbering: n => "(10.7)")
 $ G = h + lambda^2 d theta^2 . $ <st-wick-metric>]

The warped-product Christoffel symbols involving the circle are $Gamma_(i theta)^theta =
  lambda_i \/ lambda$ and $Gamma_(theta theta)^i = - lambda nabla_h^i lambda$. Thus

#[#set math.equation(numbering: n => "(10.8)")
 $ "Ric"_G \|_(T Omega) = "Ric"_h - lambda^(- 1) "Hess"_h lambda = - 3 h \, wide \( "Ric"_G \)_(theta theta) = -
   lambda Delta_h lambda = - 3 lambda^2 \, wide \( "Ric"_G \)_(i theta) = 0 . $ <st-wick-einstein>]

In particular $G$ is a four-dimensional Riemannian Einstein metric.
  It is invariant under circle translation and time reflection $theta mapsto - theta$.

Only an end collar is needed for the conformal-boundary regularity theorem below.
  The following also explains why the horizon causes no singularity if a global Riemannian filling is used.

#thm([Lemma 10.2.])[
  (The regular circle bolt).  #emph[If the period of $theta$ is $2 pi \/ kappa$,
    collapsing its circles over $S$ extends (10.7) across a regular bolt.
    In polar Cartesian coordinates it is initially a $C^(2 \, alpha)$ Einstein metric for every $0 < alpha <
    1$ and hence admits smooth Einstein coordinates across the bolt.]
] <st-bolt>

#proof[
  Use (10.6) and set $theta.alt = kappa theta$, of period $2 pi$.
    On each boundary coordinate patch, write $x = rho cos theta.alt$ and $y = rho sin theta.alt$. The normal part is
  $ d rho^2 + \( lambda \/ kappa \)^2 d theta.alt^2 = d x^2 + d y^2 +
    frac(\( lambda \/ \( kappa rho \) \)^2 - 1, rho^2) \( x thin d y - y thin d x \)^2 . $
  The coefficient in front of the final squared one-form is a smooth one-sided function of $rho$ and the bolt
    variables, equal to a smooth bolt function plus $O \( rho \)$.
    The squared one-form has quadratic Cartesian coefficients.
    Its $O \( rho \)$ correction is consequently $C^(2 \, alpha)$ for every $alpha < 1$.
    Likewise $q \( rho \) = q \( 0 \) + rho^2 q_2 + O \( rho^3 \)$ gives a $C^(2 \, alpha)$ tangential block.
    There are no mixed $d rho$–bolt terms in Gaussian coordinates. Positivity follows at $rho = 0$ from $q \( 0 \) > 0$.
  The Einstein equation holds away from the bolt and, because the metric is $C^2$,
    also holds at the bolt by continuity of Ricci curvature. Interior Einstein regularity in harmonic coordinates
    applies, for instance #cite(label("deturckkazdan1981")) Theorem 5.2.
    This gives smooth, indeed analytic, Einstein coordinates there.
    The circle action and its fixed set are then smooth: isometries preserve harmonic coordinates and the local
    Killing field satisfies the corresponding elliptic equation.
    Normal exponential coordinates to the fixed set recover the usual smooth disk action.
    Thus this is a regular bolt, with no conical angle defect. ◻
]

=== 10.3 A weighted gauge on the hyperbolic tube <a-weighted-gauge-on-the-hyperbolic-tube>

The background for the end calculation is the complete hyperbolic tube

#[#set math.equation(numbering: n => "(10.9)")
 $ G_0 = b + V_0^2 d theta^2 = d eta^2 + sinh^2 eta thin sigma + cosh^2 eta thin d theta^2 quad
   upright("on ") B^3 times S^1 . $ <st-hyperbolic-tube>]

Its sectional curvature is $- 1$. Near infinity the defining function $z_0 = 2 e^(- eta)$ gives

#[#set math.equation(numbering: n => "(10.10)")
 $ G_0 = z_0^(- 2) [d z_0^2 + \( 1 - z_0^2 \/ 4 \)^2 sigma + \( 1 + z_0^2 \/ 4 \)^2 d theta^2] .
   $ <st-tube-compactification>]

We extend $z_0$ to a positive smooth function in the interior when defining global weighted spaces.
  All such extensions give equivalent norms. These are the intrinsic weighted Hölder norms measured in bounded
  physical coordinate patches; a tensor in $C_delta^(k \, alpha)$ has physical size and derivatives $O \( z_0^delta \)$.

#thm([Lemma 10.3.])[
  (Gauge and improved decay).  #emph[Let an Einstein metric $G$ on a tube end satisfy $G -
    G_0 in C_beta^(2 \, alpha)$ for some $beta > 3 \/ 2$. After a boundary-identity change of coordinates,
    its difference from $G_0$ belongs to $C_delta^(k \, alpha_0)$ on a smaller end for every integer $k$ and every
    $0 < delta < 3$. Here one can choose $alpha_0 > 0$ below the original exponent.
    The coordinate change preserves circle translation and time reflection if $G$ does.
    In particular $G$ has an ordinary $C^(2 \, alpha_2)$ conformal compactification for some $alpha_2 > 0$.]
] <st-weighted-gauge>

#proof[
  Fix $gamma$ with $3 \/ 2 < gamma < min \( 2 \, beta \)$ and lower the Hölder exponent slightly.
    First cut $G - G_0$ off toward the interior, leaving it unchanged on a sufficiently distant end.
    Call the resulting global metric $G_E = G_0 + E$. Because $gamma < beta$,
    the global $C_gamma^(2 \, alpha_0)$ norm of $E$ tends to zero as the cutoff is moved out.
    The cutoff is a function of $eta$, so retains the stated symmetries.
  Seek a harmonic map
  $ Phi : \( B^3 times S^1 \, G_E \) arrow.r \( B^3 times S^1 \, G_0 \) \, wide Phi \( x \) = exp_x^(G_0) W \( x \) \, $
  with $W in C_gamma^(3 \, alpha_0)$. Parallel translation along the exponential segment identifies its tension
    field with a section of the fixed background tangent bundle.
    The negative linearization in $W$ at $\( E \, W \) = \( 0 \, 0 \)$ is
  #[#set math.equation(numbering: n => "(10.11)")
   $ J = nabla^(*) nabla - "Ric"_(G_0) = nabla^(*) nabla + 3 . $ <st-map-jacobi>]
  It has no $L^2$ kernel, since its quadratic form is $integral \( \| nabla W \|^2 + 3 \| W \|^2 \)$.
    Theorem C(c) and Proposition E of #cite(label("lee2006")), applied to one-forms after lowering an index,
    give an isomorphism in physical weights $- 1 < delta < 4$:
    the indicial radius is $sqrt(3^2 \/ 4 + 1 + 3) = 5 \/ 2$,
    and the Fredholm index is zero with kernel equal to the $L^2$ kernel. In particular,
  $ J : C_gamma^(3 \, alpha_0) arrow.r C_gamma^(1 \, alpha_0) $
  is an isomorphism.
  The tension expression is a smooth map between these Banach spaces.
    In physical unit patches its coefficients are smooth functions of $E \, G_E^(- 1) = \( G_0 + E \)^(- 1)$,
    one derivative of $E$, and the first two derivatives of $W$;
    target curvature and its derivatives are uniformly bounded.
    Products of weighted errors have at least their summed weight.
    Consequently its nonlinear remainder satisfies, on a fixed small ball,
  $ parallel cal(R) \( E \, W \) - cal(R) \( E \, tilde(W) \) parallel_(C_gamma^(1 \, alpha_0)) lt.eq
    C #scale(x: 120%, y: 120%)[\(] parallel E parallel_(C_gamma^(2 \, alpha_0)) +
    parallel W parallel_(C_gamma^(3 \, alpha_0)) + parallel tilde(W) parallel_(C_gamma^(3 \, alpha_0))
    #scale(x: 120%, y: 120%)[\)] parallel W - tilde(W) parallel_(C_gamma^(3 \, alpha_0)) . $
  The inverse of $J$ therefore gives a contraction, or equivalently the implicit function theorem gives a unique
    small $W$, with $parallel W parallel_(C_gamma^(3 \, alpha_0)) lt.eq
    C parallel E parallel_(C_gamma^(2 \, alpha_0))$. The map is a local diffeomorphism by smallness of its first
    jet. Its displacement is bounded, so it is proper for the complete background metric.
    It is homotopic to the identity through its exponential displacements.
    A proper local diffeomorphism is a covering map, and this homotopy makes its induced fundamental-group map
    surjective; the covering therefore has one sheet. Thus $Phi$ is a global diffeomorphism.
    In compact coordinates its displacement is $O \( z_0^(1 + gamma) \)$,
    so it restricts to the identity at infinity. Uniqueness shows that it commutes with circle translations and
    time reflection.
  Set $hat(G) = \( Phi^(- 1) \)^(*) G_E$ and $k = hat(G) - G_0$.
    The identity map from $hat(G)$ to $G_0$ is harmonic, and $k in C_gamma^(2 \, alpha_0)$.
    On a smaller end $hat(G)$ is Einstein. The Ricci equation with this harmonic-map gauge has linearization
  #[#set math.equation(numbering: n => "(10.12)")
   $ P = 1 / 2 \( Delta_L + 6 \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] nabla^(*) nabla -
     2 circle(R)_(G_0) #scale(x: 120%, y: 120%)[\)] $ <st-einstein-linearization>]
  at $G_0$; see #cite(label("lee2006")) Equations (1.2)–(1.3).
    In each fixed-size physical patch the gauged Ricci expression is uniformly elliptic.
    Differentiating its difference from the background equation and applying interior Schauder estimates on nested
    patches gives successively
  $ parallel k parallel_(C^(j + 2 \, alpha_0) \( B_1 \)) lt.eq
    C_j #scale(x: 120%, y: 120%)[\(] parallel k parallel_(C^(j + 1 \, alpha_0) \( B_2 \)) +
    parallel k parallel_(C^(2 \, alpha_0) \( B_2 \)) #scale(x: 120%, y: 120%)[\)] . $
  The constants are uniform along the end because the background has bounded geometry and $k$ is uniformly small
    in $C^(2 \, alpha_0)$. The defining function is comparable on each such patch.
    Induction therefore preserves the factor $z_0^gamma$ and gives $k in C_gamma^(j \, alpha_0)$ for every $j$.
  Taylor expansion of the gauged equation now has the exact form
  #[#set math.equation(numbering: n => "(10.13)")
   $ P k = cal(Q) \( k \, nabla k \, nabla^2 k \) \, wide cal(Q) in C_(2 gamma)^(j \, alpha_0) quad
     upright("for every ") j . $ <st-quadratic-einstein-error>]
  Indeed its constant term vanishes at $G_0$, its first-order term is $P$,
    and every remaining term contains at least two error factors, counting derivatives as factors in physical norms.
  We verify injectivity for the next use of the weighted theorem. On the tube, $Z = partial_eta$ has
  $ "div"_(G_0) Z = 2 coth eta + tanh eta gt.eq 3 . $
  For a compactly supported scalar $f$, integration by parts and Cauchy–Schwarz give
  $ 3 integral f^2 lt.eq - 2 integral f thin Z f lt.eq 2 parallel f parallel_2 thin parallel d f parallel_2 \,
    wide integral \| d f \|^2 gt.eq 9 / 4 integral f^2 . $
  The integration can first omit $eta < epsilon$; its additional boundary term tends to zero because the tubular
    area is $O \( epsilon^2 \)$. Kato’s Inequality gives the same lower bound for $integral \| nabla
    T \|^2$ in terms of $integral \| T \|^2$. For a tracefree symmetric two-tensor on curvature $- 1$,
    $circle(R) T = T$, so the operator inside the parentheses in (10.12) has quadratic form at least $1 /
    4 parallel T parallel_2^2$. On a pure trace tensor, $circle(R) \( f G_0 \) = - 3 f G_0$,
    so its zeroth-order term is favorable. The trace and tracefree bundles are parallel. Thus $P$ has no $L^2$ kernel.
  Theorem C(c) and Proposition D of #cite(label("lee2006")) apply to this smooth,
    complete conformally compact background. For $Delta_L + 6$ in dimension four the indicial radius is $3 \/ 2$,
    so $P$ is an isomorphism at every physical weight $0 < delta < 3$. Cut $k$ off once more toward the interior.
    Its equation on the whole tube is (10.13) plus a smooth compactly supported commutator.
    Since $2 gamma > 3$, that source belongs to $C_delta^(j \, alpha_0)$ for every $delta < 3$.
    Solve it at any $delta$ with $2 < delta < 3$ and compare with the cut-off $k$ at weight $gamma$.
    Their difference is in the kernel at the smaller weight, hence vanishes.
    Higher weighted regularity follows by the same equation. Smaller positive weights follow by inclusion.
  Finally, for an ordinary compact coordinate component of $z_0^2 k$,
    two coordinate derivatives have size $O \( z_0^(delta - 2) \)$.
    The physical Hölder estimate, compared on patches of compact diameter comparable to $z_0$,
    gives an ordinary $C^(2 \, alpha_2)$ extension whenever $0 < alpha_2 < min \( alpha_0 \, delta - 2 \)$.
    Equivalently this is the weighted-to-ordinary inclusion of #cite(label("lee2006")) Lemma 3.7(b),
    with the tensor weight included. This proves the claimed preliminary conformal compactness. ◻
]

=== 10.4 Smooth infinity and the normalized end <smooth-infinity-and-the-normalized-end>

#thm([Proposition 10.4.])[
  (The normalized smooth expansion).  #emph[There is a geodesic defining function $z$ for the conformal
    representative $d theta^2 + sigma$ and a boundary-identity spatial collar identification in which
#[#set math.equation(numbering: n => "(10.14)")
 $ h & = z^(- 2) \( d z^2 + H \( z \) \) \,\
H \( z \) & = sigma - 1 / 2 z^2 sigma + z^3 H_3 + O \( z^4 \) \,\
z lambda & = 1 + 1 / 4 z^2 + z^3 lambda_3 + O \( z^4 \) . $ <st-normalized-expansion>]

 All functions and tensor coefficients are smooth up to $z = 0$.
   The full third coefficient of the compactified four-metric is
#[#set math.equation(numbering: n => "(10.15)")
 $ G_3 = H_3 + 2 lambda_3 d theta^2 \, wide "tr"_(d theta^2 + sigma) G_3 = 0 \, wide
   "div"_(d theta^2 + sigma) G_3 = 0 . $ <st-free-tt-data>]

 The geodesic gauge preserves the circle factor and time reflection.
   The original and new defining radii are comparable, their collar maps extend to the same conformal boundary,
   and the resulting spatial mass comparison is covered by 6.]
] <st-end-regularity>

#proof[
  Equations (10.4) and (10.7) give $G - G_0 in C_(tau_1)^(2 \, alpha_1)$ in physical four-dimensional tensor norm:
    the relative circle coefficient is $\( lambda^2 - V_0^2 \) \/ V_0^2 = O \( r^(- tau_1) \)$. Apply 109.
    The resulting metric is smooth in the interior, Einstein with $"Ric" = - 3 G$,
    has an ordinary $C^2$ conformal compactification, and has the smooth conformal representative $d theta^2 + sigma$.
  These are the hypotheses of #cite(label("cdls2005")) Theorem A.
    That theorem is local to a collar of a compact conformal boundary and does not require a global bolt filling.
    It supplies a boundary-identity collar diffeomorphism placing the metric in geodesic form.
    Its compactification is smooth in even total dimension, hence in the present dimension four.
    The defining function is chosen for the specified representative.
    Both its defining eikonal equation and the inward normal flow are invariant under circle translation and
    reflection; uniqueness with that boundary normalization makes the collar map equivariant.
    Equivariance under translations permits at most a spatially dependent circle shift,
    and reflection together with boundary identity forces that shift to vanish.
    Thus the geodesic gauge is a spatial one and has the block form in (10.14).
  For completeness we compute the coefficients needed later. Write
  $ G = z^(- 2) \( d z^2 + gamma \( z \) \) \, wide gamma \( 0 \) = gamma_0 = d theta^2 + sigma . $
  The tangential Einstein equation and its mixed constraint are
  #[#set math.equation(numbering: n => "(10.16)")
   $ 0 =  & z gamma'' - z gamma' gamma^(- 1) gamma' + z / 2 "tr" \( gamma^(- 1) gamma' \) gamma' - 2 gamma' -
     "tr" \( gamma^(- 1) gamma' \) gamma - 2 z "Ric"_gamma \,\
0 =  & "div"_gamma \( gamma^(- 1) gamma' \) - d "tr" \( gamma^(- 1) gamma' \) . $ <st-geodesic-einstein-equation>]
  They follow by using the second form $gamma' \/ 2$ of the compact metric $d z^2 +
    gamma$ and the conformal Ricci formula. Expanding the first equation at order zero gives $gamma' \( 0 \) = 0$.
    Writing $gamma = gamma_0 + z^2 gamma_2 + z^3 gamma_3 + dots.h.c$, its order-$z$ equation gives
  $ gamma_2 + "tr"_(gamma_0) \( gamma_2 \) gamma_0 = - "Ric"_(gamma_0) . $
  Here $"Ric"_(gamma_0) = sigma$ and $R_(gamma_0) = 2$, so
  $ gamma_2 = 1 / 2 d theta^2 - 1 / 2 sigma . $
  The order-$z^2$ equation gives $"tr"_(gamma_0) gamma_3 = 0$,
    and the same order in (10.16) gives $"div"_(gamma_0) gamma_3 = 0$.
    Since the circle coefficient of $gamma$ is $\( z lambda \)^2$, these statements are exactly (10.14)–(10.15).
  We verify the spatial mass comparison from the two asymptotic representations of the same metric $h$.
    In the original spatial chart, (10.4) gives $h - b = O_2 \( r_(upright(o))^(- tau_1) \)$ with $tau_1 > 3 \/
    2$. In the new geodesic chart put $r = z^(- 1) - z \/ 4$. The exact identities
  $ frac(d r^2, 1 + r^2) = z^(- 2) d z^2 \, wide r^2 sigma = z^(- 2) \( 1 - z^2 \/ 4 \)^2 sigma $
  and the smooth expansion (10.14) give $h - b = O_j \( r^(- 3) \)$ for every fixed differentiated order $j$.
    Also $R_h = - 6$ by the static equations. In each chart, therefore,
    the weighted quadratic integrability of #cite(label("chruscielherzlich2003")) Equation (2.8a) follows from
    $integral^oo r^(2 - 2 q) thin d r < oo$ with $q > 3 \/ 2$; its scalar-curvature condition (2.8b) is automatic.
    The frame decay is $o \( r^(- 3 \/ 2) \)$, as required by (2.13),
    and uniform metric equivalence holds sufficiently far out.
    Theorem 2.3 of that paper identifies the metric mass functionals up to a hyperbolic background isometry.
    The transition estimates are conclusions of that theorem,
    so differentiated estimates for the geodesic coordinate map are not an additional input here.
    Both the harmonic-map identification and the geodesic collar identification induce the identity on the spatial
    conformal boundary. The resulting hyperbolic isometry acts trivially on $bb(S)^2$ at infinity and is therefore
    the identity. This proves the asserted mass comparison.
  For radial comparability, write $z_(upright(o))$ for the original tube defining function.
    The original normalization gives $z_(upright(o)) lambda arrow.r 1$, while (10.14) gives $z lambda arrow.r 1$.
    The collar changes preserve the same unrescaled lapse, hence $z \/ z_(upright(o)) arrow.r
    1$ at corresponding points. The harmonic-map displacement gives $z_0 \/ z_(upright(o)) arrow.r
    1$ in the intermediate gauge, so also $z \/ z_0 arrow.r 1$. ◻
]

The expansion fixes the decay and normalization needed to evaluate the static Heintze–Karcher deficit in the next
  section. Its third-order trace records the mass, while the horizon area and surface gravity supply the inner
  boundary term.

== 11 Rigidity of the normalized static base <hw-section>

The equality data determine the complete static base. We use a static Heintze–Karcher deficit on smooth bounded
  domains, followed by an exhaustion and the finite-domain warped-product rigidity of
  #cite(label("borghinifogagnolopinamonti2024")) Theorem 1.1.

#thm([Theorem 11.1.])[
  (A static Heintze–Karcher deficit).  #emph[Let $\( M^3 \, q \, V \)$ be a smooth static system satisfying
$ "Hess"_q V = V \( "Ric"_q + 3 q \) \, wide Delta_q V = 3 V \, $

 with $V > 0$ in the interior and connected compact nondegenerate horizon boundary $S = { V = 0 }$.
   Suppose a bounded smooth domain $Omega$ has boundary $S union.sq Sigma$,
   where $Sigma$ has strictly positive mean curvature $H$ toward the exterior of $Omega$.
   Set $A = "Area"_q \( S \)$ and $kappa = \| nabla V \|_S$. Then
$ D = 3 A + 2 pi chi \( S \) > 0 \, wide c = frac(2 A, 3 D) > 0 . $

 The unique smooth solution of
#[#set math.equation(numbering: n => "(11.1)")
 $ \( Delta_q - 3 \) v = - 1 quad upright("in ") Omega \, wide v = c quad upright("on ") S \, wide v = 0 quad
   upright("on ") Sigma $ <hw-deficit-dirichlet>]

 satisfies
#[#set math.equation(numbering: n => "(11.2)")
 $ 2 / 3 integral_Sigma V / H - integral_Omega V - c kappa A gt.eq 3 /
   2 integral_Omega V lr(|"Hess"_q v - v \( "Ric"_q + 3 q \) + 1 / 3 q|)^2 gt.eq 0 . $ <hw-static-deficit>]

 The measures in the surface and volume integrals are those of $q$.]
] <hw-public-rigidity>

#proof[
  The static equations imply $R_q = - 6$. At $S$ they give $"Hess"_q V = 0$,
    so $S$ is totally geodesic and $kappa$ is a positive constant.
    If $K_S$ denotes its intrinsic Gauss curvature and $eta$ its inward-to-$M$ unit normal, the Gauss equation gives
  $ "Ric"_q \( eta \, eta \) = - 3 - K_S \, wide \( "Ric"_q + 3 q \) \( eta \, eta \) = - K_S . $
  Initially solve (11.1) with an arbitrary positive boundary value $c$.
    The operator $- Delta_q + 3$ is coercive with Dirichlet boundary conditions,
    and elliptic regularity gives a unique smooth solution. The maximum principle gives $0 < v lt.eq
    max \( c \, 1 \/ 3 \)$ away from $Sigma$. On the interior put
  $ p = nabla v - v / V nabla V \, wide B = "Hess"_q v - v \( "Ric"_q + 3 q \) \, wide T = B + 1 / 3 q . $
  Thus $"tr"_q B = - 1$ and $T$ is trace free. Commuting derivatives and using the static equations gives
  $ "div"_q B = 0 \, wide nabla_i p_j = B_(i j) - p_i frac(nabla_j V, V) \, wide "div"_q \( V p \) = - V . $
  The symmetry of $T$ therefore cancels the two terms involving $d V$ in the following divergence:
  #[#set math.equation(numbering: n => "(11.3)")
   $ "div"_q #scale(x: 120%, y: 120%)[\(] V T \( p \, dot.op \)^sharp #scale(x: 120%, y: 120%)[\)] =
     V chevron.l T \, B chevron.r_q = V \| T \|_q^2 . $ <hw-deficit-divergence>]
  The vector field on the left extends smoothly to $S$, since $V p = V nabla v - v nabla V$ does.
  Write
  $ W = integral_Omega V \, quad I = W + c kappa A \, quad J = integral_Sigma V / H \, quad K =
    integral_Sigma V H \( partial_nu v \)^2 \, quad E = integral_Omega V \| T \|^2 \, $
  where $nu$ is the outward normal on $Sigma$. Green’s identity gives $I = - integral_Sigma V partial_nu v$.
    On $Sigma$, the tangential Hessian is $\( partial_nu v \) upright("II")$, and hence $T \( nu \, nu \) = -
    2 \/ 3 - H partial_nu v$. On $S$, the constant boundary datum and total geodesy give $"Hess"_q
    v \( eta \, eta \) = 3 c - 1$, so that $T \( eta \, eta \) = c \( 3 + K_S \) - 2 \/ 3$.
    The outward normal of $Omega$ along $S$ is $- eta$. Integrating (11.3), with these orientations, therefore yields
  #[#set math.equation(numbering: n => "(11.4)")
   $ E = 2 / 3 I - K + c kappa (c D - 2 / 3 A) \, wide K + E = 2 / 3 W + c^2 kappa D . $ <hw-deficit-identity>]
  Here Gauss–Bonnet was used to integrate $K_S$.
  The weighted Cauchy–Schwarz inequality gives $I^2 lt.eq J K$.
    If $D lt.eq 0$, the second identity in (11.4) would bound $K$ above by $2 W \/ 3$ for every $c > 0$,
    whereas $I^2 \/ J$ tends to infinity as $c arrow.r oo$. Thus $D > 0$. Now choose $c = 2 A \/ \( 3 D \)$.
    The horizon term in the first identity vanishes, giving $E = 2 I \/ 3 - K$ and
  $ J E lt.eq 2 / 3 J I - I^2 = I (2 / 3 J - I) . $
  Since $I > 0$, this also implies $J \/ I gt.eq 3 \/ 2$ and proves (11.2). ◻
]

#thm([Lemma 11.2.])[
  (The normalized end and its boundary integral).  #emph[In the normalized geodesic chart of Proposition 110,
    put $r = z^(- 1) - z \/ 4$ and $b = d r^2 \/ \( 1 + r^2 \) + r^2 sigma$. Then
#[#set math.equation(numbering: n => "(11.5)")
 $ sum_(j = 0)^3 \| nabla_b^j \( h - b \) \|_b = O \( r^(- 3) \) \, wide lambda = sqrt(1 + r^2) +
   O_1 \( r^(- 2) \) . $ <hw-public-asymptotics>]

 Let $Sigma_z$ be a small positive constant-$z$ surface, with outward normal $nu$ and mean curvature $H_z$. Then
#[#set math.equation(numbering: n => "(11.6)")
 $ lim_(z arrow.b 0) integral_(Sigma_z) (frac(2 lambda, H_z) - partial_nu lambda) = -
   4 pi m_(upright("AH")) . $ <hw-boundary-mass-limit>]

]
] <hw-normalized-end>

#proof[
  Write $t = "tr"_sigma H_3$ and $ell = lambda_3$ in (10.14). The trace constraint (10.15) is $t + 2 ell = 0$.
    The exact identities
  $ sqrt(1 + r^2) = z^(- 1) + z / 4 \, wide frac(d r^2, 1 + r^2) = z^(- 2) d z^2 \, wide r^2 sigma =
    z^(- 2) \( 1 - z^2 \/ 4 \)^2 sigma $
  and the smooth compactified expansion prove (11.5); background orthonormal differentiation preserves the
    indicated orders. The same expansion, with $nu = - z partial_z$, gives
  $ d A_h & = z^(- 2) #scale(x: 120%, y: 120%)[\(] 1 - 1 / 2 z^2 + 1 / 2 t z^3 +
    O \( z^4 \) #scale(x: 120%, y: 120%)[\)] d A_sigma \,\
H_z & = 2 + z^2 - 3 / 2 t z^3 + O \( z^4 \) \,\
partial_nu lambda & = z^(- 1) - 1 / 4 z - 2 ell z^2 + O \( z^3 \) \,\
frac(2 lambda, H_z) & = z^(- 1) - 1 / 4 z + \( ell + 3 / 4 t \) z^2 + O \( z^3 \) . $
  In particular these spheres are strictly mean convex, and their boundary integral tends to
    $integral_(S^2) \( 3 ell + 3 t \/ 4 \) d A_sigma = - 3 integral_(S^2) t thin d A_sigma \/ 4$.
    Substitution of the angular error $z^3 H_3 + O \( z^4 \)$, in physical components,
    into the metric-flux definition gives
  $ p_0 \( h \) = frac(3, 16 pi) integral_(S^2) t thin d A_sigma . $
  Indeed its three leading contributions from $V_0 \( "div"_b e - d "tr"_b e \)$ and $\( "tr"_b e \) d V_0 -
    e \( nabla_b V_0 \, dot.op \)$ sum to $3 r^(- 2) t + O \( r^(- 3) \)$ in the radial flux density.
    The boundary-identity chart comparison in Proposition 110 and (10.3) identify this flux with the original
    $m_(upright("AH"))$. This proves (11.6). ◻
]

#thm([Theorem 11.3.])[
  (Global identification of the equality base).  #emph[The completed static base is globally isometric,
    including its smooth boundary and its normalized lapse, to
#[#set math.equation(numbering: n => "(11.7)")
 $ h = frac(d r^2, F_M \( r \)) + r^2 sigma \, wide lambda = sqrt(F_M \( r \)) \, wide F_M \( r \) = 1 + r^2 -
   frac(2 M, r) \, wide r gt.eq r_h \, $ <hw-global-model>]

 where the boundary is interpreted in spatial proper distance and
#[#set math.equation(numbering: n => "(11.8)")
 $ M = frac(r_h + r_h^3, 2) = m_(upright("AH")) > 0 . $ <hw-actual-parameter>]

 The boundary is the entire model horizon sphere, and the unique end corresponds to $r arrow.r oo$.]
] <hw-static-rigidity>

#proof[
  For this proof write $V = lambda$, $A = 4 pi r_h^2$, $chi = chi \( S \)$, and $m = m_(upright("AH"))$.
    Proposition 107 supplies a smooth connected orientable static base,
    complete with its compact connected nondegenerate boundary included, and with one spherical end.
    Its actual area, surface gravity, and mass satisfy
  #[#set math.equation(numbering: n => "(11.9)")
   $ kappa = frac(1 + 3 r_h^2, 2 r_h) \, wide A = 4 pi r_h^2 \, wide m =
     frac(r_h + r_h^3, 2) . $ <hw-equality-surface-gravity>]
  #emph[Vanishing of the static deficit.] Apply Theorem 111 on the compact domains $Omega_z$ between $S$ and the
    surfaces $Sigma_z$ of Lemma 112. In particular $D = 3 A + 2 pi chi > 0$. Since
  $ 3 integral_(Omega_z) V = integral_(Sigma_z) partial_nu V - kappa A \, $
  the left side of (11.2) has limit
  #[#set math.equation(numbering: n => "(11.10)")
   $ frac(- 4 pi m + kappa A - 2 kappa A^2 \/ D, 3) = frac(4 pi r_h^3 \( chi - 2 \), 3 \( 6 r_h^2 + chi \)) .
     $ <hw-limit-deficit>]
  The boundary $S$ is an orientable connected closed surface, so $chi lt.eq 2$.
    Its positive denominator and the nonnegative deficit force $chi = 2$.
    Thus $S$ is a sphere, and the limit in (11.10) is zero.
  Let $v_z$ solve (11.1). Its boundary constant $c = 2 A \/ \( 3 D \)$ is independent of $z$.
    The maximum principle gives $0 < v_z lt.eq max \( c \, 1 \/ 3 \)$ away from the outer boundary.
    Interior and boundary elliptic estimates on fixed compact subsets, including the fixed smooth horizon,
    give a subsequence converging smoothly on every such subset to a bounded function $v$.
    The strong maximum principle gives $v > 0$ in the interior, and $v = c$ on $S$.
    Since the right side of (11.2) tends to zero, its limit satisfies
  #[#set math.equation(numbering: n => "(11.11)")
   $ "Hess"_h v = v \( "Ric"_h + 3 h \) - 1 / 3 h $ <hw-zero-tensor>]
  throughout the interior and, by smoothness, up to $S$.
  #emph[The quotient foliation.] Put $phi = v \/ V$ and $hat(h) = V^(- 2) h$ in the interior.
    The conformal Hessian formula, applied to (11.11) and the static equation for $V$, gives
  #[#set math.equation(numbering: n => "(11.12)")
   $ "Hess"_(hat(h)) phi = frac(Delta_(hat(h)) phi, 3) hat(h) . $ <hw-concircular-quotient>]
  Here $phi arrow.r + oo$ uniformly at $S$, since $v = c > 0$ and $V$ has a simple zero, while $phi arrow.r
    0$ at the unique end because $v$ is bounded and $V arrow.r oo$.
    Consequently $phi$ is proper as a map to $\( 0 \, oo \)$.
    For all sufficiently large $a$, ${ phi gt.eq a }$ is a connected horizon collar and $phi =
    a$ is a regular level: in horizon distance $s$, one has $phi = c \/ \( kappa s \) +
    O \( 1 \)$ and $partial_s phi = - c \/ \( kappa s^2 \) + O \( 1 \)$.
  There are no critical points of $phi$. Indeed
  $ V Delta_h phi + 2 chevron.l nabla V \, nabla phi chevron.r_h = - 1 . $
  At a critical point, (11.12) therefore reads $"Hess"_(hat(h)) phi = - V hat(h) \/ 3$.
    Every critical point would be an isolated nondegenerate maximum.
    Fix a high regular level in the horizon collar. Each compact band between it and a positive lower regular
    level has finitely many critical points. On decreasing the level through a nondegenerate maximum the
    superlevel set acquires a disjoint ball; between critical levels the normalized gradient flow preserves its
    components. No such components can merge without a different kind of critical point.
    A component created at a maximum could thus never join the horizon component at a positive lower level.
    This contradicts a path from that maximum to the horizon collar,
    whose positive continuous function $phi$ has a positive minimum. This proves the assertion.
    Normalized gradient flow on compact bands now gives the global product by connected spherical levels of $phi$.
  #emph[Warped splitting on a collar and on the whole base.] Fix a large $a$ and write $Sigma_a = { phi =
    a }$ and $Omega_a = { phi gt.eq a } union S$. The function $w = v - a V$ equals $c$ on $S$,
    is zero on $Sigma_a$, is positive inside, and satisfies (11.11) with $v$ replaced by $w$.
    On $Sigma_a$, its tangential equation is
  $ \( partial_nu w \) upright("II") = - 1 / 3 h \|_(T Sigma_a) \, wide H partial_nu w = - 2 / 3 . $
  Since $partial_nu w < 0$, the surface is strictly mean convex.
    Green’s identity consequently gives the exact finite-domain equality
  $ 2 / 3 integral_(Sigma_a) V / H = - integral_(Sigma_a) V partial_nu w = integral_(Omega_a) V + c kappa A . $
  The hypotheses of #cite(label("borghinifogagnolopinamonti2024")) Theorem 1.1 all hold:
    the substatic tensor is zero, $S$ and $Sigma_a$ are connected, and $"Hess"_h V \/ V = "Ric"_h +
    3 h$ is smooth up to $S$. Its horizon constant in Equation (1.4) is exactly $2 A \/ \( 3 D \) = c$.
    That theorem makes this entire collar a warped product with radial $V$.
    The solution $w$ is radial there as well: its average over a warped-product fiber solves the same $Delta_h -
    3$ Dirichlet problem with the same constant boundary data, and uniqueness identifies that average with $w$.
    Thus this collar splitting agrees with the $phi$ foliation.
  Equation (11.12), and the connectedness of the levels, give a global optical warped product
  $ hat(h) = d rho^2 + psi \( rho \)^2 gamma . $
  To see this directly, tangential differentiation shows that $\| nabla phi \|_(hat(h))^2$ is a function of $phi$;
    its derivative determines the pure-trace Hessian coefficient.
    The unit normal flow therefore rescales the level metric by a factor depending only on its normal coordinate
    $rho$. For $W = 1 \/ V$, the static equations in this conformal metric become
  $ "Hess"_(hat(h)) W = - W / 2 "Ric"_(hat(h)) . $
  Its radial component is $partial_rho^2 W = \( psi'' \/ psi \) W$.
    Both initial data $W$ and $partial_rho W$ are constant on a fiber in the collar just obtained.
    Uniqueness of this scalar ordinary differential equation makes $W$, and hence $V$,
    radial on the whole product. Replacing $rho$ by physical distance therefore gives $h = d t^2 +
    R \( t \)^2 gamma$ globally.
  #emph[Identification and normalization.] The scalar equation $R_h = -
    6$ forces the Gauss curvature of $gamma$ to be constant. Since its underlying surface is $S^2$,
    this curvature is positive. Rescale the fiber to the unit round metric and write the metric as $d t^2 +
    r \( t \)^2 sigma$. At the horizon $r \( 0 \) = r_h$ and $r' \( 0 \) = 0$.
    The scalar equation and its first integral are
  $ 2 r r'' + \( r' \)^2 = 1 + 3 r^2 \, wide r / 2 #scale(x: 120%, y: 120%)[\(] 1 +
    r^2 - \( r' \)^2 #scale(x: 120%, y: 120%)[\)] = M . $
  Thus $M = \( r_h + r_h^3 \) \/ 2 > 0$ and $r'' \( 0 \) = \( 1 + 3 r_h^2 \) \/ \( 2 r_h \) > 0$.
    It follows that $r' > 0$ initially and then everywhere outside the horizon:
    the first integral gives $\( r' \)^2 = F_M \( r \)$, whose strictly increasing function $F_M$ has the unique
    positive zero $r_h$. The tangential static equation gives $V' r' = V r''$, so $V =
    C r'$ for one positive constant $C$. At the horizon, (11.9) gives $kappa = V' \( 0 \) = C r'' \( 0 \)$,
    whence $C = 1$. The unique end has $V arrow.r oo$; hence $r arrow.r oo$,
    and the global product covers the full model exterior. These identities prove (11.7) with the same unrescaled
    lapse and with the original mass (11.8).
  The product isometry includes the full horizon. Its extension to the completed boundary is smooth in proper
    distance: on a positive lapse level it is smooth and intertwines normal geodesic transport to the two smooth
    nondegenerate horizons. Finally, the argument divides neither by $3 r_h^2 - 1$ nor by $kappa^2 - 3$.
    It applies at $r_h = 1 \/ sqrt(3)$, where $kappa = sqrt(3)$, and on both sides of that value.
    Equivalently, both roots of $3 r_h^2 - 2 kappa r_h + 1 = 0$ are covered. ◻
]

== 12 Reconstructing the original hypersurface <emb-section>

The static isometry in 113 concerns the quotient metric. We now reconstruct the original data,
  including their original smooth structure at the boundary and their future second fundamental form. Put

#[#set math.equation(numbering: n => "(12.1)")
 $ M = m_(upright("AH")) = frac(r_h + r_h^3, 2) \, wide F \( r \) = 1 + r^2 - frac(2 M, r) \, wide q =
   frac(d r^2, F \( r \)) + r^2 sigma . $ <emb-model>]

The theorem provides an isometry of static systems

$ Psi : \( "int" Omega \, h \, lambda \) arrow.r \( \( r_h \, oo \) times S^2 \, q \, sqrt(F) \) $

which extends to their complete Riemannian boundaries. We use $\( r \, omega \)$ for its coordinates. Notice that

$ F' \( r \) = 2 r + frac(2 M, r^2) > 0 \, wide F' \( r_h \) = 2 kappa . $

Thus $F$ has a smooth inverse near its zero, and $r - r_h = N \/ \( 2 kappa \) + O \( N^2 \)$, where $N = lambda^2$.

=== 12.1 The interior graph and its future normal <the-interior-graph-and-its-future-normal>

#thm([Lemma 12.1.])[
  (The original interior data).  #emph[There is a smooth function $H$ on $"int" Omega$ for which
#[#set math.equation(numbering: n => "(12.2)")
 $ I \( x \) = #scale(x: 120%, y: 120%)[\(] T = H \( x \) \, thin r \( x \) \,
   thin omega \( x \) #scale(x: 120%, y: 120%)[\)] $ <emb-graph>]

 is a spacelike embedding into the exterior with metric
$ upright(bold(g))_M = - F \( r \) thin d T^2 + frac(d r^2, F \( r \)) + r^2 sigma . $

 Its induced metric is exactly $g$, and its second fundamental form with the future normal is exactly $K$.]
] <emb-interior>

#proof[
  By 93, the closed one-form $cal(A) = N^(- 1) X^flat$ has a global primitive with $d H = - cal(A)$.
    Set $T = t + H \( x \)$ on $bb(R) times "int" Omega$. Completion of the square gives the exact identity
  #[#set math.equation(numbering: n => "(12.3)")
   $ h - N \( d T \)^2 = - u^2 d t^2 + g_(i j) \( d x^i + X^i d t \) \( d x^j + X^j d t \) .
     $ <emb-stationary-identity>]
  After applying $Psi$ on the spatial factor, the left side is $upright(bold(g))_M$.
    The slice $t = 0$ is precisely (12.2). In particular,
  $ I^(*) upright(bold(g))_M = h - N thin d H ⊗ d H = h - N^(- 1) X^flat ⊗ X^flat = g . $
  The projection of the graph to the static base is the diffeomorphism $Psi$,
    so the graph is injective and is an embedding in the interior.
  Choose the time orientation for which $partial_T = partial_t$ is future timelike in this exterior.
    The unit normal to $t = 0$ is
  $ n = u^(- 1) \( partial_t - X \) \, wide upright(bold(g))_M \( n \, partial_t \) = - u < 0 \, $
  so it is future directed.
    With the convention $K_(i j) = upright(bold(g))_M \( overline(nabla)_i n \, partial_j \)$,
    the ADM identity is $partial_t g = 2 u K + cal(L)_X g$. The metric on the right of (12.3) is stationary,
    and 84 gives $cal(L)_X g = - 2 u K$ for the original tensor.
    Hence the induced future second form agrees with that original tensor. ◻
]

=== 12.2 Regular horizon coordinates <regular-horizon-coordinates>

Fix any antiderivative $r_(*)$ of $F^(- 1)$ on $\( r_h \, oo \)$. The simple root gives

#[#set math.equation(numbering: n => "(12.4)")
 $ r_(*) = frac(1, 2 kappa) log \( r - r_h \) + c_(*) \( r \) \, wide e^(kappa r_(*)) =
   sqrt(F \( r \)) thin Q \( F \( r \) \) \, $ <emb-tortoise>]

where $c_(*)$ is smooth near $r_h$ and $Q$ is a positive smooth function near $0$.
  Define exterior Kruskal coordinates by

#[#set math.equation(numbering: n => "(12.5)")
 $ U = - e^(- kappa \( T - r_(*) \)) \, wide V = e^(kappa \( T + r_(*) \)) . $ <emb-kruskal>]

Then $U < 0 < V$ in this exterior and

#[#set math.equation(numbering: n => "(12.6)")
 $ - U V = F Q \( F \)^2 \, wide upright(bold(g))_M = - frac(1, kappa^2 Q \( F \)^2) thin d U thin d V +
   r^2 sigma . $ <emb-kruskal-metric>]

Here $d U thin d V$ denotes the symmetric product. The derivative of $F
  Q \( F \)^2$ with respect to $r$ at $r_h$ is $2 kappa Q \( 0 \)^2 > 0$;
  hence $r$ and the coefficients in (12.6) are smooth functions of $- U V$ near the horizon.
  This gives regular coordinates in the smooth maximal extension.
  Its future horizon adjoining our exterior is $U = 0$, $V > 0$, with the bifurcation sphere at $U = V = 0$.

#thm([Lemma 12.2.])[
  (Smoothness in the original boundary structure).  #emph[The graph (12.2) extends smoothly to the original closed
    manifold $Omega$. If $u \|_S > 0$, its boundary is a full smooth cross-section of $U = 0$, $V > 0$.
    If $u \|_S = 0$, its boundary is the bifurcation sphere. In both cases the boundary map is a diffeomorphism
    onto that section.]
] <emb-horizon>

#proof[
  First suppose $u \|_S > 0$. By 106, $N$ is a smooth defining function in the original collar and
  #[#set math.equation(numbering: n => "(12.7)")
   $ cal(A) = frac(1, 2 kappa) thin d log N + beta \, wide H = - frac(1, 2 kappa) log N + B \,
     $ <emb-positive-primitive>]
  where $beta$ is smooth and closed up to $S$ and $B$ is smooth there.
    To justify the last assertion directly, the differential of the displayed remainder in $H$ is $- beta$.
    Integrating its bounded normal derivative gives a boundary value;
    tangential derivatives then extend by the smooth differential equation.
    This works to every order and on overlapping collar patches.
  The angular coordinates of $Psi$ are also smooth in the original collar.
    Here is the point that is needed because the regular base uses $lambda = sqrt(N)$.
    Formula (10.5) doubles $h$ across $lambda = 0$ by the isometry $\( lambda \, y \) mapsto \( - lambda \, y \)$.
    The angular coordinate $omega$ of the model is its normal footpoint on the horizon:
    in the model, curves of constant $omega$ are the normal geodesics from the boundary.
    A boundary-preserving isometry has the same description on the base.
    Reflection takes each such geodesic to its continuation with the same footpoint.
    Therefore $omega$ is a smooth even function of $lambda$ in doubled collar coordinates.
    A smooth even function of one real variable, with smooth parameters,
    is a smooth function of its square on the half-line. This follows, to each finite order,
    from Taylor expansion with its smooth remainder. Thus $omega =
    omega \( N \, y \)$ is smooth in the original collar. Likewise $r = F^(- 1) \( N \)$ is smooth.
  Substituting (12.7) into (12.4)–(12.5) gives on the graph
  #[#set math.equation(numbering: n => "(12.8)")
   $ U = - Q \( N \) thin N e^(- kappa B) \, wide V = Q \( N \) e^(kappa B) . $ <emb-positive-kruskal>]
  These are smooth original collar functions. On $S$ they satisfy $U = 0$ and $V = Q \( 0 \) e^(kappa B) > 0$.
    The restriction $omega : S arrow.r S^2$ is a diffeomorphism because $Psi$ extends as a boundary isometry.
    Hence the image is the graph of a smooth positive function $V \( omega \)$ over the whole horizon sphere,
    meeting each generator once. The horizon first form is $r_h^2 sigma$, so this section is spacelike.
  Now suppose $u \|_S = 0$. In the original normal coordinate $s gt.eq 0$, 106 gives smooth fields
  $ u = s a \, quad X = s^2 Y \, quad N = s^2 D \, quad D = a^2 - s^2 \| Y \|_g^2 \, quad D \|_S = kappa^2 \, wide
    cal(A) = D^(- 1) Y^flat . $
  The base smooth structure is the original one, and $H$ extends smoothly by the same primitive argument.
    On this one-sided collar $lambda = s sqrt(D)$ is smooth, with positive normal derivative.
    Both the angular boundary map and $r = F^(- 1) \( s^2 D \)$ are smooth. Equations (12.5) become
  #[#set math.equation(numbering: n => "(12.9)")
   $ U = - Q \( N \) thin lambda e^(- kappa H) \, wide V = Q \( N \) thin lambda e^(kappa H) . $ <emb-zero-kruskal>]
  They extend smoothly with $U = V = 0$ on $S$ and with nonzero normal derivatives of opposite signs.
    The angular map again gives a diffeomorphism of $S$ onto the entire bifurcation sphere.
  In either case the extended map has induced metric $g$ at $S$ by continuity of the identity in 114,
    since all ambient and map coefficients just displayed are smooth.
    For any nonzero tangent vector $v$ of $Omega$, including at its boundary,
  $ upright(bold(g))_M \( d I \( v \) \, d I \( v \) \) = g \( v \, v \) > 0 . $
  Thus $d I$ is injective and its image is spacelike up to the boundary.
    This establishes smoothness and immersion in the original, rather than merely the completed-base, structure. ◻
]

#thm([Proposition 12.3.])[
  (Properness, the future second form, and infinity).  #emph[The extended map $I$ is a smooth proper spacelike
    embedding of the original $\( Omega \, g \, K \)$ into the smooth maximal Schwarzschild–AdS extension of
    parameter $M = m_(upright("AH"))$. Its interior lies in one exterior,
    its boundary is the full future horizon section described in 115,
    and its end reaches that exterior’s conformal infinity.]
] <emb-global>

#proof[
  The interior map is injective by its base projection, the boundary map is injective by 115,
    and their images are disjoint since $r > r_h$ in the interior and $r = r_h$ on $S$.
    Let $C$ be a compact subset of the maximal spacetime. Its radius function is bounded above, say by $R$.
    The preimage $I^(- 1) \( C \)$ is closed and lies in
  $ Psi^(- 1) #scale(x: 120%, y: 120%)[\(] \[ r_h \, R \] times S^2 #scale(x: 120%, y: 120%)[\)] \, $
  which is compact in the completed base. That completion is homeomorphic to the original closed exterior,
    so it is also compact in $Omega$. Hence $I$ is proper. A proper injective immersion is an embedding,
    including for manifolds with boundary.
  The future unit normal extends smoothly to $S$. One can construct it in any of the regular charts by choosing a
    smooth future timelike ambient vector, projecting it onto the normal line of the smooth spacelike tangent
    bundle, and normalizing. These local choices give the unique future normal and therefore agree on overlaps.
    In the interior it is the normal used in 114. Its second form is smooth up to $S$ and agrees with the original
    $K$ in the interior; continuity proves equality at $S$ as well.
  For the end statement, temporarily denote the original end radius by $r_o$. The original estimates give
  $ \| cal(A) \|_g = frac(\| X \|_g, N) = O \( r_o^(- 1 - tau_1) \) \, wide tau_1 > 3 \/ 2 . $
  Consequently, in the original radial and angular coordinates,
  $ cal(A)_(r_o) = O \( r_o^(- 2 - tau_1) \) \, wide cal(A)_A = O \( r_o^(- tau_1) \) . $
  Radial integration of $d H = - cal(A)$ gives a uniform limit of $H$ as $r_o arrow.r oo$.
    Its angular oscillation tends to zero by the second bound, so this limit is a single constant $T_oo$.
    Moreover $lambda \/ sqrt(1 + r_o^2) arrow.r 1$ and $lambda = sqrt(F \( r \))$, which imply $r \/ r_o arrow.r
    1$. The unique end therefore has $r arrow.r oo$ and $T arrow.r T_oo$.
    The base isometry covers a full model end, so all angles occur.
    In the standard conformal completion with defining function $1 \/ r$,
    the graph thus reaches the full section $T = T_oo$ of this exterior’s conformal infinity.
    All these conclusions follow from the reconstructed graph and its specific decay estimates. ◻
]

=== 12.3 The converse and explicit equality examples <the-converse-and-explicit-equality-examples>

#thm([Proposition 12.4.])[
  (Converse on the stated horizon subclass).  #emph[Suppose the original data satisfy the connected horizon
    hypotheses of 8 and have the embedding required in 2, with its stipulated actual metric mass $M =
    m_(upright("AH"))$. Then equality holds in the Penrose Inequality.]
] <emb-converse>

#proof[
  In a regular horizon chart the first form of $U = 0$ has null generator $partial_V$ in its kernel and angular
    part $r_h^2 sigma$. Every full smooth spacelike cross-section therefore has area $4 pi r_h^2$,
    including the bifurcation section. The embedding and the assumed outer area-minimization give
  $ A_min = "Area"_g \( S \) = 4 pi r_h^2 . $
  The equation $F_M \( r_h \) = 0$ and the actual mass match now yield
  $ m_(upright("AH")) = M = frac(r_h + r_h^3, 2) = sqrt(frac(A_min, 16 pi)) (1 + frac(A_min, 4 pi)) . $
  This uses the mass match as specified in the statement. No invariance under an arbitrary change of asymptotic
    time slice is needed for this implication. ◻
]

Propositions 116 and 117 prove Theorem 2. The following examples also verify sharpness without a maximality assumption.

#thm([Proposition 12.5.])[
  (Mass-matched static and nonstatic examples).  #emph[For every $M > 0$,
    the static exterior with its bifurcation boundary attains equality.
    It also admits smooth compactly supported time graph perturbations with $K equiv.not
    0$ which satisfy all the initial-data and connected horizon hypotheses and still attain equality with actual
    mass $m_(upright("AH")) = M$.]
] <emb-examples>

#proof[
  Fix a closed annulus $r_h < a < b < oo$ and a smooth function $phi$ supported in its interior.
    On the graph $T = phi \( r \, omega \)$ the induced metric is
  #[#set math.equation(numbering: n => "(12.10)")
   $ q_phi = q - F thin d phi ⊗ d phi . $ <emb-example-metric>]
  For sufficiently small $C^2$ norm of $phi$ it is positive and uniformly comparable with $q$,
    so its completion is a smooth complete exterior with the same boundary.
    In proper distance from the horizon, $q$ is smooth and has a totally geodesic boundary; $phi =
    0$ on that collar. The graph lies in the vacuum metric $"Ric"_(upright(bold(g))_M) = - 3 upright(bold(g))_M$,
    so its data satisfy the vacuum constraints and hence the dominant energy condition.
    Near the boundary and near infinity its future second form vanishes and its metric is exactly $q$.
  Every coordinate sphere with $r > r_h$ has
  $ H_q = frac(2 sqrt(F), r) > 0 . $
  Its future expansion for the perturbed graph remains positive on $\[ a \, b \]$ by $C^2$ smallness,
    uniformly on this fixed annulus, and is unchanged outside it.
    If a weakly future trapped enclosing surface had a component strictly outside $S$, take its maximum radius.
    There it touches a coordinate sphere from the smaller radius side,
    with the same outward normal toward the end. The mean curvature comparison gives $H_(upright("surface")) gt.eq
    H_(upright("sphere"))$, while the tangential planes and hence the tangential traces of $K$ agree.
    Its future expansion would be positive at that point, a contradiction.
    Thus the horizon is outermost for the required future condition.
  Let $pi : \[ r_h \, oo \) times S^2 arrow.r S^2$ be angular projection.
    On the perturbation annulus the quadratic form $q - r_h^2 pi^(*)
    sigma$ is positive definite with a uniform lower bound. Taking $phi$ smaller if necessary gives everywhere
  $ q_phi gt.eq r_h^2 pi^(*) sigma . $
  For any admissible full enclosing cut $Gamma = partial_Omega D$, including cuts with portions on $S$,
    apply Stokes’ Theorem to a large truncation of $D$ and the closed form $pi^(*) d A_sigma$.
    With the orientation toward the chosen end, the sum of the degrees of all its boundary components is one:
  $ integral_Gamma pi^(*) d A_sigma = 4 pi . $
  This uses the full intrinsic boundary, so when $D = Omega$ the integral is over $S$ itself.
    The pointwise quadratic-form bound gives
  $ "Area"_(q_phi) \( Gamma \) gt.eq r_h^2 integral_Gamma \| pi^(*) d A_sigma \| gt.eq 4 pi r_h^2 . $
  Since $S$ has that area, it is outer area-minimizing.
  We compute the actual metric flux. The metric equals $q$ near infinity, so put $r = sinh eta$ and $V_0 =
    cosh eta$. Relative to $b = d eta^2 + r^2 sigma$ its only nonzero error component is
  #[#set math.equation(numbering: n => "(12.11)")
   $ q - b = f thin d eta^2 \, wide f = frac(2 M, r F \( r \)) = 2 M r^(- 3) + O \( r^(- 5) \) . $ <emb-example-error>]
  Writing $nu_b = partial_eta$, direct background differentiation gives
  $ \( "div"_b \( q - b \) - d "tr"_b \( q - b \) \) \( nu_b \) = frac(2 V_0, r) f . $
  For any of the four static potentials $V$, the radial component of $"tr"_b \( q - b \) thin d
    V - \( q - b \) \( nabla_b V \, dot.op \)$ vanishes. Thus the time-component flux in 5 is
  #[#set math.equation(numbering: n => "(12.12)")
   $ p_0 = lim_(r arrow.r oo) frac(1, 16 pi) thin 4 pi r^2 thin frac(2 V_0^2, r) f =
     lim_(r arrow.r oo) M thin frac(V_0^2, F \( r \)) = M . $ <emb-example-mass>]
  For $V_i = r omega_i$ the remaining integrand is a radial multiple of $omega_i$,
    whose spherical integral vanishes. Hence $\( p_0 \, p_1 \, p_2 \, p_3 \) = \( M \, 0 \, 0 \, 0 \)$ and
    $m_(upright("AH")) = M$. Equation (12.11) gives the required differentiated decay; all errors involving $K$,
    and all scalar-curvature defects from $R = - 6$, are compactly supported.
    The regularity and weighted integrability assumptions follow.
  The graph is smooth at the bifurcation boundary and proper by the argument of 116,
    or directly because it is unchanged there and outside a compact annulus. Thus all the conditions in 117 hold.
    Choosing $phi$ with a nonzero Hessian at a critical point gives $K eq.not 0$ there:
    at such a point the graph second form is $sqrt(F) thin "Hess"_q phi$.
    These furnish non-time-symmetric equality examples as well as the static one. ◻
]

== 13 Linear estimates on separated boundary faces <sec:linear-estimates>

The local estimates below record the precise classical boundary inputs used in the scalar continuation arguments.

#thm([Lemma 13.1.])[
  (Scalar estimates on separated boundary faces).  #emph[Let $U subset.double
    V$ be nested interior or boundary patches with uniformly controlled smooth geometry.
    Let $g$ be uniformly positive definite with uniformly controlled $C^2$ coordinate norms. Suppose that $u$ is smooth,
$ P u = - Delta_g u + B dot.op d u + c u = f \, wide parallel B parallel_oo + parallel c parallel_oo lt.eq K \, $

 and that the physical boundary in $V$, if present, carries either $u = 0$ or $partial_(nu_g) u = 0$. For $1 < p < oo$,
$ parallel u parallel_(W^(2 \, p) \( U \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel f
  parallel_(L^p \( V \)) + parallel u parallel_(L^p \( V \)) #scale(x: 120%, y: 120%)[\)] . $

 The constant depends on the patch separation, ellipticity, principal coefficient modulus, and $K$,
   but not on a continuity modulus of $B$. If the coefficients and right side have uniform $C^(0 \, gamma)$
   bounds, the corresponding one-sided $C^(2 \, gamma)$ estimates hold;
   Dirichlet data have norm $C^(2 \, gamma)$ and Neumann data norm $C^(1 \, gamma)$.]
  #emph[On a compact connected smooth domain, let the Dirichlet and Neumann faces be disjoint unions of entire
    boundary components. With Hölder coefficients, $c gt.eq 0$, and either $c gt.eq
    c_(*) > 0$ or a nonempty Dirichlet face, $P$ is an isomorphism from the $C^(2 \, gamma)$ space with
    homogeneous boundary conditions to $C^(0 \, gamma)$. The Dirichlet Schauder a priori estimate also holds for a
    general uniformly elliptic principal matrix $A in C^(0 \, gamma)$, with Hölder lower-order coefficients.
    If $A in C^(1 \, gamma)$, the same isomorphism conclusion holds with all-Dirichlet boundary conditions.]
] <lem:linear-separated-faces>

#proof[
  In metric boundary-normal coordinates, $g = d t^2 + h_(a b) \( y \, t \) d y^a d
    y^b$ and the Neumann condition is $u_t = 0$. Reflect $u \, h^(a b)$, tangential drift, $c$,
    and $f$ evenly across $t = 0$, and normal drift oddly. The principal coefficients remain Lipschitz and
    uniformly elliptic. Normal drift may jump but is bounded.
    The reflected first derivatives agree in trace, so the extended function has weak second derivatives in $L^p$,
    with no measure on the plane, and satisfies the extended equation almost everywhere.
    For zero Dirichlet data use odd reflection of $u \, f$ and the same coefficient reflections;
    the same trace argument applies.
  The interior estimate used on the reflected ball follows from the constant-coefficient estimate of
    Agmon–Douglis–Nirenberg, Theorem 14.1$'$, p. 700 #cite(label("agmondouglisnirenberg1959")).
    For a cutoff function $v$ supported where $C_0 "osc" A lt.eq 1 \/ 2$, freeze $A$ at $x_0$ to obtain
  $ parallel D^2 v parallel_p lt.eq C_0 parallel A \( x_0 \) : D^2 v parallel_p lt.eq C_0 parallel A :
    D^2 v parallel_p + 1 / 2 parallel D^2 v parallel_p . $
  The cutoff commutators and bounded drift involve only $u \, D u$.
    Apply $parallel D u parallel_p lt.eq epsilon parallel D^2 u parallel_p +
    C_epsilon parallel u parallel_p$ on nested patches, absorb, and cover by finitely many small patches.
    This proves the stated estimate, first for smooth functions and then for strong $W^(2 \, p)$ solutions by
    approximation.
  The one-sided Schauder estimate is the scalar specialization of Agmon–Douglis–Nirenberg, Theorem 7.3,
    pp. 667–669; the oblique estimate is also stated in Lieberman, Lemma 1, p. 755 #cite(label("lieberman1982")).
    At a flattened face the normal characteristic root $tau_(+)$ has positive imaginary part.
    The Dirichlet symbol is $1$; an oblique symbol has value $beta_T dot.op xi + beta_n tau_(+)$,
    which cannot vanish since $beta_n eq.not 0$. Thus the required complementing condition holds.
    The boundary faces never meet, so a finite cover uses one boundary type in each boundary chart.
    Cutoffs constant in the normal variable near a Neumann face preserve its homogeneous data.
    No estimate at an artificial half-ball rim is used.
  For solvability, add a sufficiently large constant $kappa$.
    The weak form for $P + kappa$ on $H^1$ functions with zero Dirichlet trace is coercive, since
  $ lr(|integral \( B dot.op d u \) u|) lt.eq 1 / 2 parallel d u parallel_2^2 +
    C parallel B parallel_oo^2 parallel u parallel_2^2 . $
  It therefore has a unique weak solution. For smooth data, tangential difference quotients,
    followed by recovery of the second normal derivative from the equation, give boundary regularity;
    iteration gives smoothness. Approximation, the maximum principle for $P + kappa$,
    and the Schauder estimate give $C^(2 \, gamma)$ solvability for Hölder data.
    The original map $P$ is a compact perturbation of $P + kappa$ and hence has index zero.
    Its kernel vanishes by the maximum principle and Hopf Boundary Lemma;
    constants are excluded by the positive potential or by the nonempty Dirichlet face. Thus $P$ is invertible.
    Smooth inhomogeneous data are handled by a fixed lift. The analogous all-Dirichlet argument for a general
    $C^(1 \, gamma)$ positive principal tensor follows by rewriting it in divergence form,
    putting its coefficient derivatives in the drift, and repeating the shift and compact-perturbation argument. ◻
]

===== 13.1 Application to the preparation equation. <application-to-the-preparation-equation.>

After $u = v \/ eta_R$, the gradient term is $D sqrt(zeta^2 + \| d u \|^2)$,
  bounded by $D \( zeta + \| d u \| \)$. Here $zeta = 1$ in the stress preparation and $zeta =
  w_2$ in Equation (7.6); the positive smooth regularizing weight has controlled norms on each fixed patch.
  The preceding $W^(2 \, p)$ estimate and first-derivative interpolation therefore bound $u$ using its height and
  the controlled source. Take $p > 3 \/ \( 1 - gamma \)$ for a permitted $0 < gamma < 1$.
  Sobolev embedding gives a Hölder gradient, so the original smooth gradient nonlinearity is Hölder and the
  one-sided Schauder estimate applies. One does not apply Schauder to the reflected equation with its possibly
  discontinuous normal drift. On physical end patches, multiply the estimate by the weight at the patch center;
  comparability on the larger patch gives the weighted estimate without altering homogeneous boundary data.
  All constants are uniform when the local geometry and coefficient bounds are uniform.

#bibliography("refs.bib", style: "ieee", title: [References])
