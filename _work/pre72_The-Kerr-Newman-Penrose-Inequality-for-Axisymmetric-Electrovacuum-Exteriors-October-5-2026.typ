#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
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

#align(center)[#text(size: 16pt, weight: "bold")[The Kerr--Newman Penrose Inequality \
for Axisymmetric Electrovacuum Exteriors]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <m:introduction>

For a black-hole exterior, the Penrose inequality compares total mass with the area of the horizon. Electric and magnetic charge and angular momentum sharpen the expected lower bound to the mass of the Kerr–Newman black hole with the same horizon area and conserved quantities. The geometric problem is to obtain this comparison directly from initial data, without assuming that the data are stationary or that their second fundamental form has zero trace.

Penrose’s proposal relates the mass at spatial infinity to the area required to enclose a black-hole region, as a consequence expected from gravitational collapse and cosmic censorship #cite(label("Penrose1973")). In the time-symmetric setting, Huisken and Ilmanen proved the Riemannian inequality for a connected horizon by weak inverse mean curvature flow #cite(label("HuiskenIlmanen2001")); Bray’s conformal flow established the inequality using the total area of an outermost minimal boundary with several components #cite(label("Bray2001")). For charged Riemannian data, Khuri, Weinstein and Yamada proved the sharp inequality with multiple horizon components under the appropriate area branch condition, together with an upper bound for the area radius without that condition #cite(label("KhuriWeinsteinYamada2017")).

Angular momentum introduces additional boundary and gauge information. Dain, Khuri, Weinstein and Yamada established mass–charge–angular-momentum and lower-area bounds for simply connected, axisymmetric maximal data with two ends #cite(label("DainKhuriWeinsteinYamada2013")). Khuri, Sokolowsky and Weinstein obtained a Penrose-type bound for maximal axisymmetric data with a connected minimal boundary; their comparison retains an integral of the horizon data and gives the Kerr–Newman expression under additional horizon matching conditions #cite(label("KhuriSokolowskyWeinstein2019")). Their harmonic-map method is a useful starting point for the comparison developed here.

The deformation and first-variation methods draw on the manuscript #emph[Equality and rigidity in the spacetime Penrose inequality] #cite(label("NeutralExterior2026")). The related charged companion #cite(label("ConditionalCharged2026")) incorporates a numerical theorem whose earlier formulation assumed both a neutral exterior inequality and a separate elliptic existence input; the companion proves those inputs internally. We establish the deformation and equality arguments needed here at their stated scope; no earlier neutral, charged or rotating Penrose inequality is assumed as an input.

We prove the connected-horizon, outer-area-minimizing, rest-frame formulation of the axisymmetric Kerr–Newman Penrose conjecture:

$ m^2 gt.eq frac(A, 16 pi) + Q^2 / 2 + frac(pi \( Q^4 + 4 J^2 \), A) . $

Here $A$ is the horizon area, $Q^2 = Q_e^2 + Q_b^2$, and $J$ is the conserved total angular momentum, including the electromagnetic contribution. Theorem 2 states the precise geometric and asymptotic hypotheses and the nondegenerate equality classification. The result permits both monopole charges, all angular momenta on the physical area branch, and arbitrary second fundamental forms satisfying the constraints.

The proof has three main ingredients. First, a conformal-cut lemma converts a lower bound for all meridional crossing lengths into a pointwise boundary density bound at any prescribed exterior conformal capacity. This removes the need to prescribe the horizon rod of a comparison model. Second, a neutral two-function deformation transfers the full electromagnetic and twist source inequality to a Riemannian comparison metric. We prove its barriers, estimates, regularity, existence and mass-flux bound; the construction requires no previous elliptic existence hypothesis. The potentials are kept fixed, and a rowwise square completion carries their information through the deformation. Third, equality produces a causal stationary adjoint for the sourced constraints. The quotient equations determine the horizon scale and the Kerr–Newman map, after which a smooth spacetime lift recovers every component of the original data. This last step retains arbitrary admissible time graphs.

The conformal-cut argument and the local gradient estimate used in the deformation are independent analytic tools. The equality argument also avoids a compactness theorem for a sequence of deformation metrics: only numerical inequalities are passed to the deformation limit, and stationarity is obtained separately by first variations at the original data.

===== 1.1 Plan of the proof. <plan-of-the-proof.>

Section 3 develops the axial reduction and the model. Sections 4 and 5 prove the cut lemma and the Riemannian comparison. Section 6 reduces the numerical theorem to a deformation property, proved in Section 7. Section 8 constructs the stationary adjoint at equality, and Section 9 identifies and lifts the original slice. Methodological connections and the standard external tools are cited where they enter.

== 2 Geometric setting and main theorem <m:setting>

We work in three spatial dimensions, with $G = c = 1$ and zero cosmological constant. The sign and asymptotic conventions below are fixed throughout.

=== 2.1 Exterior data and constraints <exterior-data-and-constraints>

Let $Omega$ be a smooth connected oriented manifold diffeomorphic to $bb(R)^3$ minus an open ball. Its nonempty compact boundary $S$ is a two-sphere. Let $g$ be a smooth Riemannian metric, complete as a metric space with $S$ included, and let $K$ be a smooth symmetric covariant two-tensor. The electric and magnetic fields $E_(upright(f)) \, B_(upright(f))$ are smooth vector fields. All data are smooth up to $S$, and there is one asymptotically flat end.

Assume a smooth effective $U \( 1 \)$ action preserves $g \, K \, E_(upright(f)) \, B_(upright(f))$ and $S$. Its Killing generator $eta$ has period $2 pi$; in the asymptotic chart it is the usual oriented rotation about the $x^3$-axis. No stationarity is assumed.

We use the future-normal convention

$ K \( X \, Y \) = overline(g) \( overline(nabla)_X n \, Y \) \, #h(2em) n upright(" future unit normal") . $

Writing $tau = "tr"_g K$, define the constraint densities by

#[#set math.equation(numbering: n => "(2.1)")
 $ 16 pi mu = R_g + tau^2 - lr(|K|)_g^2 \, #h(2em) 8 pi \( J_(upright("con")) \)_i = nabla^j \( K_(i j) - tau g_(i j) \) . $ <m:densities>]

The data are source-free electrovacuum:

#[#set math.equation(numbering: n => "(2.2)")
 $ mu = frac(lr(|E_(upright(f))|)_g^2 + lr(|B_(upright(f))|)_g^2, 8 pi) \, #h(2em) J_(upright("con")) = frac(\( E_(upright(f)) times B_(upright(f)) \)^flat, 4 pi) \, #h(2em) "div"_g E_(upright(f)) = "div"_g B_(upright(f)) = 0 . $ <m:electrovac>]

Here the cross product and Hodge star use the given spatial orientation, and $flat$ is metric duality. The covector $J_(upright("con"))$ is a local momentum density; it is distinct from the total angular momentum $J$. In a spacetime realization with electromagnetic two-form $F$, the induced fields have the conventions

#[#set math.equation(numbering: n => "(2.3)")
 $ E_(upright(f))^flat = \( iota_n F \) \|_(T Omega) \, #h(2em) B_(upright(f))^flat = star.op_g \( F \|_(T Omega) \) . $ <m:field-convention>]

=== 2.2 Asymptotics and conserved quantities <asymptotics-and-conserved-quantities>

In asymptotically Euclidean coordinates $x$, put $r = lr(|x|)$ and assume

#[#set math.equation(numbering: n => "(2.4)")
 $ g_(i j) - delta_(i j) & = O_4 \( r^(- 1) \) \, #h(2em) K_(i j) = O_3 \( r^(- 3) \) \,\
E_(upright(f))^i & = Q_e x^i / r^3 + O_3 \( r^(- 3) \) \, #h(2em) B_(upright(f))^i = Q_b x^i / r^3 + O_3 \( r^(- 3) \) . $ <m:asymptotics>]

For $O_k \( r^(- a) \)$, every coordinate derivative of order $j lt.eq k$ is $O \( r^(- a - j) \)$. Thus the fields have Coulomb leading terms; higher multipoles are allowed. Require $mu$ and $lr(|J_(upright("con"))|)_g$ to be integrable and the following limits to exist and be finite. On a coordinate sphere $S_R$, let $n_delta \, upright(d) A_delta$ denote the Euclidean outward normal and area, and $nu_R \, upright(d) A_g$ their metric counterparts:

#[#set math.equation(numbering: n => "(2.5)")
 $ E_(upright("ADM")) & = frac(1, 16 pi) lim_(R arrow.r oo) integral_(S_R) \( partial_j g_(i j) - partial_i g_(j j) \) n_delta^i thin upright(d) A_delta \,\
\( P_(upright("ADM")) \)_i & = frac(1, 8 pi) lim_(R arrow.r oo) integral_(S_R) \( K_(i j) - tau g_(i j) \) n_delta^j thin upright(d) A_delta \,\
J_(upright("ADM")) & = frac(1, 8 pi) lim_(R arrow.r oo) integral_(S_R) \( K_(i j) - tau g_(i j) \) nu_R^i eta^j thin upright(d) A_g \,\
\( Q_e \, Q_b \) & = frac(1, 4 pi) lim_(R arrow.r oo) integral_(S_R) #scale(x: 120%, y: 120%)[\(] g \( E_(upright(f)) \, nu_R \) \, g \( B_(upright(f)) \, nu_R \) #scale(x: 120%, y: 120%)[\)] thin upright(d) A_g . $ <m:energy>]

Assume $P_(upright("ADM")) = 0$ and $E_(upright("ADM")) > 0$, and set

#[#set math.equation(numbering: n => "(2.6)")
 $ m = E_(upright("ADM")) = sqrt(E_(upright("ADM"))^2 - lr(|P_(upright("ADM"))|)^2) \, #h(2em) Q = sqrt(Q_e^2 + Q_b^2) . $ <m:mass-charge>]

The imposed decay of $K$ is consistent with this rest-frame condition.

For $Q > 0$, use the constant duality rotation

#[#set math.equation(numbering: n => "(2.7)")
 $ E' = frac(Q_e E_(upright(f)) + Q_b B_(upright(f)), Q) \, #h(2em) B' = frac(- Q_b E_(upright(f)) + Q_e B_(upright(f)), Q) . $ <m:duality>]

For $Q = 0$, set $E' = E_(upright(f))$, $B' = B_(upright(f))$. The rotated charges are $\( Q \, 0 \)$, and $B' = O_3 \( r^(- 3) \)$. The zero flux removes the $H^2 \( Omega \)$ obstruction to a smooth invariant one-form $alpha$ satisfying

#[#set math.equation(numbering: n => "(2.8)")
 $ upright(d) alpha = star.op_g \( B' ""^flat \) \, #h(2em) alpha = O_2 \( r^(- 2) \) $ <m:magnetic-primitive>]

in asymptotic Cartesian components. Its construction and normalizations are given in Section 3; no primitive of the original magnetic field is assumed when $Q_b eq.not 0$.

For an invariant enclosing surface $Sigma$, with normal toward infinity, define the total angular momentum

#[#set math.equation(numbering: n => "(2.9)")
 $ J_(upright("tot")) \( Sigma \) = frac(1, 8 pi) integral_Sigma \( K - tau g \) \( nu \, eta \) thin upright(d) A_g + frac(1, 4 pi) integral_Sigma alpha \( eta \) g \( E' \, nu \) thin upright(d) A_g . $ <m:total-angular>]

Cartan’s identity and the constraints give

$ \( E' times B' \) dot.op eta = - E' dot.op nabla \( alpha \( eta \) \) \, #h(2em) "div"_g #scale(x: 120%, y: 120%)[\(] \( K - tau g \) \( eta \, dot.op \)^sharp + 2 alpha \( eta \) E' #scale(x: 120%, y: 120%)[\)] = 0 . $

Consequently $J_(upright("tot"))$ is conserved between such surfaces and is unchanged by smooth invariant gauge changes. The electromagnetic surface term vanishes at infinity by Equation (2.8), so

#[#set math.equation(numbering: n => "(2.10)")
 $ J := J_(upright("tot")) \( S \) = lim_(R arrow.r oo) J_(upright("tot")) \( S_R \) = J_(upright("ADM")) . $ <m:J>]

This identity concerns the corrected total flux. The bare gravitational surface integral on $S$ can differ from its value at infinity.

=== 2.3 The horizon and enclosing area <the-horizon-and-enclosing-area>

On $S$, let $nu$ point toward the end, and put

#[#set math.equation(numbering: n => "(2.11)")
 $ H_S = "div"_S nu \, #h(2em) "tr"_S K = \( g^(i j) - nu^i nu^j \) K_(i j) \, #h(2em) theta_(+) \( S \) = H_S + "tr"_S K . $ <m:expansion>]

Assume $theta_(+) \( S \) = 0$. Also assume that no compact smooth embedded enclosing surface lying entirely in $"int" Omega$, possibly disconnected, satisfies $theta_(+) lt.eq 0$ everywhere with its normal toward infinity. This is the outermostness condition used below; no condition is imposed on the inward null expansion.

#prodef([Definition 2.1.])[
  (Enclosing cut).  An enclosing cut $Gamma$ is the full compact intrinsic boundary of a connected smooth codimension-zero submanifold $D subset Omega$, closed as a subset of $Omega$, whose interior lies in $"int" Omega$ and which contains the entire sufficiently distant end. The boundary is smooth, embedded and two-sided. All its components are counted, including any portion coinciding with $S$. No symmetry or trapping condition is imposed on $Gamma$.
] <m:cut>

Assume that $S$ is outer area-minimizing in the precise sense

#[#set math.equation(numbering: n => "(2.12)")
 $ "Area"_g \( Gamma \) gt.eq A := "Area"_g \( S \) > 0 quad upright("for every enclosing cut ") Gamma . $ <m:area>]

Taking $D = Omega$ gives the allowed cut $S$, so $A$ is exactly the minimum enclosing area. Finally assume the physical area branch

#[#set math.equation(numbering: n => "(2.13)")
 $ A gt.eq 4 pi sqrt(Q^4 + 4 J^2) . $ <m:branch>]

We use this branch as a hypothesis; no area-charge-angular-momentum theorem is needed to deduce it.

#thm([Theorem 2.2.])[
  (Penrose inequality and nondegenerate rigidity).  #emph[Under the hypotheses of this section, 
#[#set math.equation(numbering: n => "(2.14)")
 $ #box(stroke: black, inset: 3pt, [$ m^2 gt.eq frac(A, 16 pi) + Q^2 / 2 + frac(pi \( Q^4 + 4 J^2 \), A) . $]) $ <m:penrose>]

 If $A > 4 pi sqrt(Q^4 + 4 J^2)$ and equality holds, the original exterior $\( Omega \, g \, K \, E_(upright(f)) \, B_(upright(f)) \)$ admits a smooth spacelike embedding into the domain of outer communication together with the appropriate future horizon of a subextremal dyonic Kerr–Newman spacetime with mass $m$, angular momentum $J$, and charges $Q_e \, Q_b$, in the conventions above. The induced metric, second fundamental form with a consistent future normal, and induced fields agree with the given data. The end approaches the corresponding spatial infinity. The embedding and normal extend smoothly to $S$, which maps to a smooth future-horizon cross-section or to the bifurcation sphere.]
  #emph[Conversely, every such Kerr–Newman exterior slice satisfying all the hypotheses and meeting that horizon attains equality. Nonconstant time graphs and nonzero second fundamental forms are permitted.]
] <m:main>

The closed branch in Equation (2.13) is included in the numerical inequality. No equality classification at its extremal endpoint is asserted. In particular, an extremal cylindrical end is not identified with the compact boundary in the hypotheses. The theorem concerns only the exterior and gives no classification behind $S$.

For clarity, the proof first establishes the numerical inequality, including the endpoint, in Corollary 19. The proof of its deformation input is completed in Section 7. The equality implication and converse are completed in Section 9.

== 3 Axial variables and the comparison family <a:section>

We first encode the fields and the components removed by polarization in three scalar potentials. The metric and second fundamental form in this section are the original data until a subscript $0$ is introduced. Throughout, $eta$ is the prescribed generator of period $2 pi$.

=== 3.1 The orbit space and its smooth angular coordinate <the-orbit-space-and-its-smooth-angular-coordinate>

#thm([Lemma 3.1.])[
  (Orbit topology).  #emph[The quotient of $Omega$ by the circle action is a half annulus: its boundary consists of the compact image of $S$ and two noncompact axis faces, each joining an endpoint of that image to infinity. There are no exceptional orbits. The regular part of $Omega$ is a trivial principal circle bundle over the interior of this quotient. It admits a global angular coordinate that agrees with the prescribed azimuth on a smaller asymptotic end and with smooth polar gauges near the axes.]
] <a:topology>

#proof[
  Truncate the given end at a sufficiently large rotation sphere. Both boundary spheres carry ordinary effective rotations. Here is a direct verification of the assertion for an invariant sphere. Its Euler characteristic forces fixed points. At a fixed point the tangent representation is a planar rotation with integer weight. That weight has absolute value one: otherwise a nonidentity group element would fix the point and have identity differential both on the sphere and on its invariant inward normal, hence would be an isometry with identity first jet and therefore the identity on the connected ambient manifold. At a nonfixed point a finite stabilizer acts trivially on the orbit tangent. It acts trivially also on the transverse tangent line, by orientation, and on the inward normal. The same first-jet argument excludes such a stabilizer. The slice theorem now makes the quotient of the sphere an interval, with an ordinary rotation disk at either endpoint; the free circle bundle over its interior is a product. Consequently the action extends over an ordinary rotation ball.
  Cap the two boundary spheres equivariantly, using invariant collars. The resulting closed three-manifold is simply connected. Its orbit space is a compact orientable surface with nonempty boundary, the boundary arising from fixed axes. The only other possible singular orbits are isolated exceptional fibers, represented by interior cone points of finite cyclic order. The orbifold fundamental group of this surface is a quotient of the fundamental group of the three-manifold. Indeed, away from axes and exceptional fibers, loops lift to paths; an endpoint displacement in a fiber can be closed within that fiber without changing the projected loop. Filling an axis tube introduces no nontrivial projected fiber relation. Filling an exceptional solid torus imposes the relation that the corresponding meridian raised to the isotropy order is trivial, as seen in its cyclic disk cover. Van Kampen therefore gives the asserted surjection onto the orbifold group.
  An orientable surface with nonempty boundary and cyclic cone points has orbifold group equal to the free product of its ordinary free surface group and the cyclic groups at those points. Triviality of this group implies that the surface is a disk and that there are no cone points. Removing the two cap quotients gives the half-annulus description. Its regular interior is contractible, so its principal circle bundle is trivial.
  For the last smoothness assertion, use equivariant normal disks near each axis and a signed transverse polar radius there. Changes of angular reference are smooth functions on the quotient, even in that signed radius. Their local phase lifts can be patched by a partition of unity; the only obstruction is the integral circle cocycle, which vanishes on this orbit rectangle. The same construction relative to a far-end strip preserves the given azimuth there. Thus the product gauge has the stated compatibility with the smooth axes. No isothermal, Weyl, or other metric coordinates have been assumed. ◻
]

Off the axis write, with horizontal lifts understood,

#[#set math.equation(numbering: n => "(3.1)")
 $ g = h + X^2 \( upright(d) phi.alt + cal(A) \)^2 \, #h(2em) X = \| eta \|_g \, #h(2em) e = X^(- 1) eta . $ <a:metric-splitting>]

Orient the meridional metric $h$ by $upright(d) V_g = upright(d) A_h and X \( upright(d) phi.alt + cal(A) \)$. Thus $*_h$ sends the first covector of a positive orthonormal meridional coframe to the second. A subscript $H$ denotes a horizontal component, and horizontal vector fields will be identified with their $h$-dual covectors when applying $*_h$.

=== 3.2 The conserved potentials and their axis behavior <the-conserved-potentials-and-their-axis-behavior>

Perform the constant duality rotation in Theorem 2 and write $E \, B$ for the resulting fields in this section. Their charges are $Q \, 0$. The rotation preserves $\| E \|^2 + \| B \|^2$ and $E times B$, so it preserves the electrovacuum constraints. It gives $B = O_3 \( r^(- 3) \)$ on the end.

#thm([Lemma 3.2.])[
  (Magnetic primitive and total angular momentum).  #emph[There is a smooth invariant one-form $alpha$ with 
$ upright(d) alpha = *_g B^flat \, #h(2em) alpha = O_2 \( r^(- 2) \) . $

 The flux 
#[#set math.equation(numbering: n => "(3.2)")
 $ frac(1, 8 pi) integral_Sigma \( K - tau g \) \( nu \, eta \) thin upright(d) A_g + frac(1, 4 pi) integral_Sigma alpha \( eta \) g \( E \, nu \) thin upright(d) A_g $ <a:total-flux>]

 is independent of the invariant enclosing surface $Sigma$ and of the smooth invariant gauge for $alpha$. It equals $J_(upright("ADM"))$ at infinity, and hence equals the prescribed $J$.]
] <a:angular-momentum>

#proof[
  The magnetic flux form is closed by $"div"_g B = 0$. Since $Omega$ retracts onto a sphere, its only two-dimensional de Rham period is the magnetic flux, which is zero after rotation. The form is therefore exact. The decay can be imposed without sacrificing smoothness. On a rescaled annulus, radial homotopy reduces the primitive problem to a two-form on a fixed sphere; its zero integral is exactly the condition for a spherical primitive. These homotopy operators, followed by a fixed spherical elliptic inverse, have uniform bounds through the required derivatives. Scaling back a two-form of Cartesian order $r^(- 3)$ gives a primitive of order $r^(- 2)$, with its first two derivatives of the corresponding orders. On consecutive overlapping annuli, the difference of the primitives is a closed one-form and hence is the differential of a function. After subtracting a constant, its rescaled derivatives are bounded. Use cutoff multiples of these functions on the overlaps to glue the annular primitives. The annuli can be chosen with bounded overlap, so these corrections retain the bounds. The same argument glues the end primitive to any interior primitive. All ingredients are smooth on each finite annulus; this avoids any demand for uniform bounds on unspecified higher derivatives at infinity. Averaging over the circle makes $alpha$ invariant and preserves its equation and decay.
  Set $chi = alpha \( eta \)$. Cartan’s formula gives
  $ upright(d) chi = - iota_eta \( *_g B^flat \) \, #h(2em) \( E times B \) dot.op eta = - E dot.op nabla chi . $
  The contraction of the momentum constraint with the Killing field, together with $"div" E = 0$, now gives
  $ "div"_g #scale(x: 120%, y: 120%)[\(] \( K - tau g \) \( eta \, dot.op \)^sharp + 2 chi E #scale(x: 120%, y: 120%)[\)] = 0 . $
  The divergence theorem proves conservation of Equation (3.2). If $alpha$ is changed by a closed invariant one-form $beta$, then $upright(d) \( beta \( eta \) \) = - iota_eta upright(d) beta = 0$. The constant $beta \( eta \)$ is zero on the axis, and thus everywhere. Finally $alpha \( eta \) = O \( r^(- 1) \)$, while $E dot.op nu = O \( r^(- 2) \)$; the electromagnetic surface term is $O \( r^(- 1) \)$ on the end spheres. This proves its disappearance in the limiting flux. The proof does not identify the bare gravitational flux on $S$ with the flux at infinity. ◻
]

Let $l = K \( e \, dot.op \) \|_H$. The global potentials are defined by

#[#set math.equation(numbering: n => "(3.3)")
 $ upright(d) psi = X *_h E_H \, #h(2em) upright(d) chi = X *_h B_H \, #h(2em) omega := upright(d) z + psi thin upright(d) chi - chi thin upright(d) psi = X^2 *_h l . $ <a:potentials>]

For any positive axial radius $X$ define

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(D)_X = \( X^(- 1) upright(d) psi \, X^(- 1) upright(d) chi \, X^(- 2) omega \) \, #h(2em) u = log X \,\
G = upright(d) u^2 + e^(- 2 u) \( upright(d) psi^2 + upright(d) chi^2 \) + e^(- 4 u) \( upright(d) z + psi upright(d) chi - chi upright(d) psi \)^2 . $ <a:target>]

The last expression is a Riemannian metric on $bb(R)^4$, with coordinates $\( u \, psi \, chi \, z \)$.

We verify global integrability and the normalizations in Equation (3.3). For an invariant field the divergence equation is equivalent to the closedness of $X *_h E_H$, and similarly for $B$. The second of these forms is $upright(d) \( alpha \( eta \) \)$, by Cartan’s identity with the stated orientation. The axial momentum equation gives

$ upright(d) \( X^2 *_h l \) = 2 thin upright(d) psi and upright(d) chi \, #h(2em) upright(d) #scale(x: 120%, y: 120%)[\(] X^2 *_h l + 2 chi upright(d) psi #scale(x: 120%, y: 120%)[\)] = 0 . $

Consequently $X^2 *_h l + chi upright(d) psi - psi upright(d) chi$ is closed. The meridional rectangle is simply connected, so all three defining equations integrate there.

Orient a crossing arc so that its tangent is the metric dual of $*_h nu^flat$, where $nu$ is the horizontal normal pointing toward infinity. Rotating the arc gives area element $2 pi X thin upright(d) s_h$. The electric flux divided by $4 pi$ is therefore $1 / 2 integral upright(d) psi$, and the total angular flux is

$ 1 / 4 integral \( omega + 2 chi upright(d) psi \) = 1 / 4 integral upright(d) \( z + chi psi \) . $

All potentials are constant on each axis face. Order those faces by this crossing orientation. Since $chi = alpha \( eta \) = 0$ on both axes, additive constants can and will be chosen so that their values are

#[#set math.equation(numbering: n => "(3.5)")
 $ \( psi \, chi \, z \) = \( - Q \, 0 \, - 2 J \) quad upright("and") quad \( Q \, 0 \, 2 J \) . $ <a:axis-values>]

The same computation on end-coordinate spheres proves that these are the original flux normalizations.

#thm([Lemma 3.3.])[
  (Axis and end regularity).  #emph[In a compact ordinary axis tube, let $y$ be signed transverse polar radius and let $x$ be a coordinate along the axis. The functions 
$ psi - psi_(upright("ax")) \, #h(2em) chi - chi_(upright("ax")) $

 are smooth even functions of $y$ of order $y^2$, while 
$ z + psi_(upright("ax")) chi - chi_(upright("ax")) psi - z_(upright("ax")) $

 is smooth even of order $y^4$. These statements hold with smooth longitudinal derivatives and at the boundary poles in one-sided charts. On the asymptotic end, the potentials are bounded, and near either pole their differences from the adjacent axis values obey 
#[#set math.equation(numbering: n => "(3.6)")
 $ psi - psi_(upright("ax")) = O \( sin^2 theta.alt \) \, #h(2em) chi = O \( r^(- 1) sin^2 theta.alt \) \, #h(2em) z - z_(upright("ax")) = O \( sin^2 theta.alt \) . $ <a:end-regularity>]

 The corrected central coordinate satisfies the stronger uniform estimate 
#[#set math.equation(numbering: n => "(3.7)")
 $ tilde(z) := z + psi_(upright("ax")) chi - chi_(upright("ax")) psi - z_(upright("ax")) = O \( sin^4 theta.alt \) . $ <a:end-central>]

 The estimates have the differentiated versions obtained from Equation (3.3); in particular their rescalings to end annuli have uniform bounds through the orders used below.]
] <a:axis-regularity>

#proof[
  An invariant smooth scalar is even in $y$. A smooth invariant horizontal vector field has an odd radial component and an even longitudinal component. Since $X \/ y$ is smooth positive even, $X *_h E_H$ and $X *_h B_H$ have radial component $O \( y \)$ and longitudinal component $O \( y^2 \)$ with the corresponding parities. Integration from the axis gives the first two assertions.
  Smoothness of an invariant symmetric tensor gives an angular–axis component $l_x = O \( y \)$ and an angular–radial component $l_y = O \( y^2 \)$. After multiplication by $X^2$ and rotation by $*_h$, $omega$ has radial component $O \( y^3 \)$ and longitudinal component $O \( y^4 \)$. Put $delta psi = psi - psi_(upright("ax"))$ and $delta chi = chi - chi_(upright("ax"))$. Then
  $ upright(d) \( z + psi_(upright("ax")) chi - chi_(upright("ax")) psi \) = omega - delta psi thin upright(d) chi + delta chi thin upright(d) psi . $
  The last two terms have the same radial and longitudinal orders as $omega$. Integration proves the order-four assertion.
  For the end estimates, perform the same argument in rescaled annuli. The leading electric field is the radial Coulomb field, so the leading angular derivative of $psi$ is $Q sin theta.alt thin upright(d) theta.alt$. The remainder contributes a uniformly bounded function of order $sin^2 theta.alt$ at a pole. The decaying invariant magnetic primitive gives the sharper estimate for $chi$: its normalized angular component vanishes linearly in transverse radius, and $chi = alpha \( eta \)$ vanishes quadratically. Finally $X^2 l = O \( r^(- 1) sin^2 theta.alt \)$ as a horizontal covector, with the stronger radial and longitudinal polar orders just proved. Integration along a meridian of a coordinate sphere therefore bounds $z$ and gives its order-two polar difference. For the stronger corrected estimate, fix a dyadic annulus of radius $R$ and use coordinates scaled by $R$, with signed transverse coordinate $y$. The rescaled Cartesian tensor $R^3 K \( R thin dot.op \)$ has uniform $C^3$ bounds and the same invariant tensor parity. The pullback of $omega = X^2 *_h l$ therefore has transverse component $O \( y^3 \)$ and longitudinal component $O \( y^4 \)$, uniformly in $R$: the factors from $X^2$ and a covector pullback cancel the overall $R^(- 3)$ decay of $K$. The first two potential estimates and their differentiated versions give these same orders for $- \( psi - psi_(upright("ax")) \) upright(d) chi + \( chi - chi_(upright("ax")) \) upright(d) psi$. Integrating their sum with $omega$ from $y = 0$ gives $tilde(z) = O \( y^4 \)$ uniformly. On the unit-scale annulus $y$ is comparable to $sin theta.alt$, proving Equation (3.7). Smooth polar coordinate changes with uniformly bounded transverse ratios preserve these estimates. Differentiating the defining equations supplies the radial decay and angular derivative bounds. The assumptions $g - delta = O_4 \( r^(- 1) \)$, $K = O_3 \( r^(- 3) \)$ and $E \, B$ with three controlled derivatives give all the asserted rescaled bounds. ◻
]

=== 3.3 Polarization and its exact source terms <polarization-and-its-exact-source-terms>

Define

#[#set math.equation(numbering: n => "(3.8)")
 $ g_0 = h + X^2 upright(d) phi.alt^2 \, #h(2em) k_0 = K \|_(H times H) + K \( e \, e \) X^2 upright(d) phi.alt^2 . $ <a:polarized-data>]

Thus $cal(A)$ and $l$ are removed from the metric and tensor, but retained in the map and in the velocity variables below.

#thm([Proposition 3.4.])[
  (Polarization).  #emph[The data $\( g_0 \, k_0 \)$ extend smoothly through the axis, have the stated asymptotic decay, and have the same ADM energy as $\( g \, K \)$. For every invariant surface, its area and future expansion are unchanged. Let $mu_0 \, J_0$ be the constraint densities of $\( g_0 \, k_0 \)$, with $J_0$ a covector. Write $upright(d) cal(A) = f_a upright(d) A_h$ and set $s = \( - B_e \, E_e \, - X f_a \/ 2 \)$. Then 
#[#set math.equation(numbering: n => "(3.9)")
 $ 16 pi mu_0 = 2 #scale(x: 120%, y: 120%)[\(] \| cal(D)_X \|_(g_0)^2 + \| s \|^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) 8 pi J_0 = 2 s dot.op cal(D)_X . $ <a:constraints>]

 The source combinations on the right are smooth across the axis. On a signed axis tube $s_1 \, s_2$ are odd of order $y$, and $s_3$ is even of order $y^2$. In particular the polarized data satisfy the dominant energy condition.]
] <a:polarization>

#proof[
  First consider smoothness. In the normalized polar coframe $\( upright(d) y \, upright(d) x \, y upright(d) phi.alt \)$, the angular–radial metric coefficient is even of order $y^2$, and the angular–longitudinal coefficient is odd of order $y$. The ratio $X \/ y$ is smooth positive even. Taking the horizontal Schur complement of the angular coefficient therefore preserves all polar parities and the equality of the radial and angular diagonal coefficients at the axis. The same calculation for the tensor gives the smooth lift of $k_0$. These statements apply uniformly on rescaled end annuli. Apparent factors $y^(- 1)$ in Cartesian differentiation are harmless: the Taylor terms permitted by the polar parities are smooth transverse Cartesian polynomials, and Taylor remainder estimates bound every remaining divided derivative. This also proves the required differentiated end decay. In particular
  $ cal(A)_y = O \( y r^(- 3) \) \, #h(2em) cal(A)_x = O \( r^(- 2) \) \, #h(2em) X f_a = O \( r^(- 2) \) $
  on the end. On compact axis tubes $cal(A)_y$ is smooth odd and $cal(A)_x$ smooth even, so $f_a$ is odd of order $y$. Smooth invariant vector fields have angular component odd of order $y$, proving the stated parities of $s$.
  An invariant surface is generated by a meridional curve, and its area is $2 pi$ times that curve’s length in $X^2 h$. This is the same for $g$ and $g_0$. First variation of this expression for arbitrary invariant normal speeds shows that its pointwise mean curvature is also unchanged. Its tangent space is generated by one horizontal unit vector and $e$, so its tangential trace uses only $K \|_(H times H)$ and $K \( e \, e \)$. This proves preservation of future expansion.
  For the energy, use the end azimuth fixed in Lemma 3. Let $cal(R)$ be azimuthal reflection. The difference of $g$ from its reflection average is precisely the angular cross tensor, which is odd under $cal(R)$. The linear ADM flux on a coordinate sphere is invariant under this Euclidean reflection, and hence is zero on that odd tensor. The difference of the reflection average from $g_0$ is $X^2 cal(A) ⊗ cal(A)$ in horizontal coordinate components. It has Cartesian order $O_2 \( r^(- 2) \)$, since it is quadratic in the normalized cross coefficients $O \( r^(- 1) \)$. Its ADM flux is $O \( r^(- 1) \)$. Thus the energies agree. The polar estimates above make the calculation uniform at both end poles.
  It remains to prove the source identities, including their signs. The horizontal Koszul formulas, for invariant horizontal fields $a \, b$, are
  $ \( nabla_a b \)^e & = - 1 / 2 X upright(d) cal(A) \( a \, b \) \, & \( nabla_a e \)^H = \( nabla_e a \)^H & = 1 / 2 X upright(d) cal(A) \( a \, dot.op \)^sharp \, & nabla_e e & = - nabla_h log X . $
  Together with the base connection these give
  #[#set math.equation(numbering: n => "(3.10)")
   $ R_(g_0) - R_g = 1 / 2 X^2 f_a^2 \, #h(2em) \| K \|_g^2 - \| k_0 \|_(g_0)^2 = 2 \| l \|_h^2 \, #h(2em) "tr"_(g_0) k_0 = "tr"_g K \,\
8 pi \( J_0 \)_i = 8 pi \( J_(upright("con")) \)_i + X \( upright(d) cal(A) \)_(i j) l^j quad \( i upright(" horizontal") \) \, #h(2em) J_0 \( e \) = 0 . $ <a:deletion-identities>]
  For example the last vanishing also follows from the azimuthal reflection symmetry of $\( g_0 \, k_0 \)$. The scalar constraint and
  $ \| cal(D)_X \|^2 & = \| E_H \|^2 + \| B_H \|^2 + \| l \|^2 \,\
\( E times B \)_H & = E_e *_h B_H - B_e *_h E_H \, #h(2em) \( upright(d) cal(A) \)_(i j) l^j = - f_a \( *_h l \)_i $
  now give Equation (3.9) exactly.
  For clarity, the normalized first two rows of $cal(D)_X$ need not individually be smooth three-dimensional covectors at the axis. Their radial coefficients are even and their longitudinal coefficients odd. Their squared norms, and their products with the corresponding odd $s_i$, are smooth invariant scalars and covectors. The third row is a smooth horizontal covector: its radial coefficient is odd of order $y$, and its longitudinal coefficient is even of order $y^2$. Thus all source combinations in Equation (3.9) are smooth. Finally $2 \| s dot.op cal(D)_X \| lt.eq \| s \|^2 + \| cal(D)_X \|^2$ implies $mu_0 gt.eq \| J_0 \|_(g_0)$. ◻
]

=== 3.4 The spacetime quotient and local reconstruction <the-spacetime-quotient-and-local-reconstruction>

We record the corresponding spacetime equations with all signs fixed. This is a local assertion on regular orbits and does not assume a stationary development of the initial data. Write

$ overline(g) = H + X^2 \( upright(d) phi.alt + upright(bold(A)) \)^2 \, #h(2em) gamma = X^2 H \, $

where $H$ is a Lorentz metric of dimension three and signature $\( - + + \)$. Its volume form is ordered by a future time covector, then the oriented horizontal spatial coframe. The Maxwell field in this subsection has already undergone the constant duality rotation.

#thm([Proposition 3.5.])[
  (Einstein–wave-map quotient).  #emph[For an invariant electrovacuum spacetime the axial potentials satisfy 
#[#set math.equation(numbering: n => "(3.11)")
 $ upright(d) chi = - iota_eta F \, #h(2em) upright(d) psi = iota_eta *_4 F \, #h(2em) omega = - 1 / 2 X^3 *_H upright(d) upright(bold(A)) \, #h(2em) cal(D)_X \( n \) = s \, $ <a:quotient>]

 on every invariant spacelike slice, where $n$ is its horizontal future unit normal. With $Phi = \( u \, psi \, chi \, z \)$, the equations reduce to 
#[#set math.equation(numbering: n => "(3.12)")
 $ "Ric"_gamma = 2 Phi^(*) G \, #h(2em) square.stroked_gamma Phi = 0 . $ <a:wave>]

 The second expression is the wave-map tension for the target $G$. Conversely, these reduced equations reconstruct locally an invariant Einstein–Maxwell metric and field, up to angular and electromagnetic gauge. Their slice data recover the original metric, tensor, and fields from the polarized data, the potentials, and their normal velocities.]
] <a:quotient-proposition>

#proof[
  Let $\( theta^0 \, theta^1 \, theta^2 \)$ be an oriented Lorentz orthonormal coframe with $theta^0 \( n \) = 1$, and put $theta^3 = X \( upright(d) phi.alt + upright(bold(A)) \)$. The relevant signs are
  $ *_H theta^0 = - theta^1 and theta^2 \, #h(2em) *_H theta^1 = - theta^0 and theta^2 \, #h(2em) *_H theta^2 = theta^0 and theta^1 . $
  Set $p = X^(- 1) upright(d) chi$, $t = X^(- 1) upright(d) psi$, and $v = X^(- 2) omega$. Then
  #[#set math.equation(numbering: n => "(3.13)")
   $ F = p and theta^3 + *_H t \, #h(2em) *_4 F = - t and theta^3 + *_H p \, #h(2em) upright(d) upright(bold(A)) = 2 X^(- 1) *_H v . $ <a:field-reconstruction>]
  Contraction with $n$ and restriction to its spatial slice give exactly $E^flat = iota_n F$ and $B^flat = *_g \( F \|_(T Omega) \)$. In particular $t \( n \) = - B_e$ and $p \( n \) = E_e$. Writing $upright(d) upright(bold(A)) = theta^0 and a + f_a theta^1 and theta^2$, the mixed connection formula gives $l = X a \/ 2$ for the positive future-normal convention. Consequently
  $ omega \|_(T Omega) = X^2 *_h l \, #h(2em) X^(- 2) omega \( n \) = - X f_a \/ 2 . $
  This proves the restrictions in Equation (3.11).
  For completeness, the integrability of the corrected twist in spacetime follows from the mixed Einstein equation. The mixed Ricci component is
  $ \( "Ric"_4 \)_(i e) = frac(1, 2 X^2) nabla_H^j #scale(x: 120%, y: 120%)[\(] X^3 \( upright(d) upright(bold(A)) \)_(i j) #scale(x: 120%, y: 120%)[\)] = X^(- 2) nabla_H^j \( *_H omega \)_(i j) . $
  Einstein–Maxwell gives it as $- 2 \( *_H t \)_(i j) p^j$. These identities are equivalent to $upright(d) omega = 2 upright(d) psi and upright(d) chi$, and hence to the closedness of $omega + chi upright(d) psi - psi upright(d) chi$. Thus $z$ exists locally, with its constants fixed by the slice.
  The horizontal parts of the Maxwell equations give $"div"_H t = 2 chevron.l p \, v chevron.r_H$ and $"div"_H p = - 2 chevron.l t \, v chevron.r_H$, while $upright(d)^2 upright(bold(A)) = 0$ gives $"div"_H \( X^(- 1) v \) = 0$. For a covector $beta$, the conformal change in dimension three obeys $"div"_gamma beta = X^(- 3) "div"_H \( X beta \)$. Therefore
  #[#set math.equation(numbering: n => "(3.14)")
   $ "div"_gamma \( X^(- 4) omega \) & = 0 \,\
"div"_gamma \( X^(- 2) upright(d) psi \) & = 2 X^(- 4) chevron.l upright(d) chi \, omega chevron.r_gamma \,\
"div"_gamma \( X^(- 2) upright(d) chi \) & = - 2 X^(- 4) chevron.l upright(d) psi \, omega chevron.r_gamma . $ <a:map-divergences>]
  The horizontal and fiber curvature contractions of the connection formulas are
  #[#set math.equation(numbering: n => "(3.15)")
   $ \( "Ric"_4 \)_(i j) & = \( "Ric"_H \)_(i j) - X^(- 1) nabla_i nabla_j X - 1 / 2 X^2 \( upright(d) upright(bold(A)) \)_(i k) \( upright(d) upright(bold(A)) \)_j zws^k \,\
\( "Ric"_4 \)_(e e) & = - X^(- 1) square.stroked_H X + 1 / 4 X^2 \( upright(d) upright(bold(A)) \)_(i j) \( upright(d) upright(bold(A)) \)^(i j) . $ <a:ricci-blocks>]
  One can see the coefficients directly before contraction: the horizontal sectional numerator has correction $- 3 X^2 upright(d) upright(bold(A)) \( a \, b \)^2 \/ 4$, and the horizontal–fiber block is $- X^(- 1) nabla_a nabla_b X + X^2 \( upright(d) upright(bold(A)) \)_(a k) \( upright(d) upright(bold(A)) \)_b zws^k \/ 4$. The Lorentz Hodge identity
  $ \( *_H t \)_(i k) \( *_H t \)_j zws^k = t_i t_j - H_(i j) \| t \|_H^2 $
  shows that the two Einstein–Maxwell Ricci blocks in Equation (3.15) equal, respectively,
  $ 2 \( p_i p_j + t_i t_j \) - H_(i j) \( \| p \|_H^2 + \| t \|_H^2 \) \, #h(2em) \| p \|_H^2 + \| t \|_H^2 . $
  Thus the fiber equation reads $X^(- 1) square.stroked_H X = - \| p \|_H^2 - \| t \|_H^2 - 2 \| v \|_H^2$. Since $u = log X$ and $gamma = e^(2 u) H$, this becomes
  #[#set math.equation(numbering: n => "(3.16)")
   $ square.stroked_gamma u = - e^(- 2 u) \( \| upright(d) psi \|_gamma^2 + \| upright(d) chi \|_gamma^2 \) - 2 e^(- 4 u) \| omega \|_gamma^2 . $ <a:u-wave>]
  The conformal Ricci formula
  $ "Ric"_gamma = "Ric"_H - "Hess"_H u + upright(d) u ⊗ upright(d) u - \( square.stroked_H u + \| upright(d) u \|_H^2 \) H $
  then cancels the remaining scalar multiples of $H$ and gives
  $ "Ric"_gamma = 2 \( upright(d) u ⊗ upright(d) u + p ⊗ p + t ⊗ t + v ⊗ v \) = 2 Phi^(*) G . $
  Equations (3.14) and (3.16) are exactly the four Euler–Lagrange equations of the target metric in Equation (3.4). This proves Equation (3.12).
  Conversely, start with Equation (3.12), put $H = X^(- 2) gamma$, and define $p \, t \, v$ as above. The first equation in (3.14) makes $2 X^(- 1) *_H v$ closed, so it has a local connection primitive $upright(bold(A))$. Define $F$ by Equation (3.13). The remaining divergence equations and the identities $upright(d)^2 psi = upright(d)^2 chi = 0$ give both Maxwell equations. The identity $upright(d) omega = 2 upright(d) psi and upright(d) chi$ supplies the mixed Einstein equation. Reversing the horizontal and fiber calculations supplies the other Einstein equations.
  The slice reconstruction is explicit. Its horizontal tensor is the second fundamental form of its slice in $H$; the other components are
  #[#set math.equation(numbering: n => "(3.17)")
   $ K \( e \, e \) = n \( log X \) \, #h(2em) X^2 *_h K \( e \, dot.op \) \|_H = omega \|_(T Omega) \, #h(2em) \( X^(- 1) upright(d) psi \( n \) \, X^(- 1) upright(d) chi \( n \) \, X^(- 2) omega \( n \) \) = s . $ <a:reconstruction>]
  The spatial potential equations recover $E_H \, B_H$, and the first two velocities recover $B_e \, E_e$. The third recovers the spatial connection curvature. A chosen connection on a simply connected meridian is then fixed up to angular gauge. Finally the inverse constant duality rotation recovers the original ordered pair of electric and magnetic fields. ◻
]

=== 3.5 Target geometry <target-geometry>

#thm([Lemma 3.6.])[
  #emph[The target $\( bb(R)^4 \, G \)$ is complete, simply connected, and has nonpositive curvature. In particular any two of its points are joined by a unique geodesic, and squared distance is jointly convex along pairs of geodesics.]
] <a:target-geometry>

#proof[
  A path of bounded $G$-length has bounded $u$. The same length then controls the variations of $psi$ and $chi$. Since these coordinates are bounded, control of $upright(d) z + psi upright(d) chi - chi upright(d) psi$ also controls the variation of $z$. A finite-length escaping path is therefore impossible, which proves completeness. The underlying manifold is $bb(R)^4$.
  Let $E_0 \, E_1 \, E_2 \, E_3$ be the frame dual to $\( upright(d) u \, e^(- u) upright(d) psi \, e^(- u) upright(d) chi \, e^(- 2 u) omega \)$. Its nonzero brackets are
  $ \[ E_0 \, E_1 \] = E_1 \, quad \[ E_0 \, E_2 \] = E_2 \, quad \[ E_0 \, E_3 \] = 2 E_3 \, quad \[ E_1 \, E_2 \] = - 2 E_3 . $
  In the bivector order $\( 01 \, 02 \, 12 \, 03 \, 13 \, 23 \)$, Koszul’s formula gives the curvature operator
  $ mat(delim: "(", - 1, 0, 0, 0, 0, - 1; 0, - 1, 0, 0, 1, 0; 0, 0, - 4, 2, 0, 0; 0, 0, 2, - 4, 0, 0; 0, 1, 0, 0, - 1, 0; - 1, 0, 0, 0, 0, - 1) . $
  Its quadratic form on $\( a \, b \, c \, d \, e \, f \)$ is $- \( a + f \)^2 - \( b - e \)^2 - \( c + d \)^2 - 3 \( c - d \)^2$, so it is nonpositive. The geodesic and convexity assertions follow from the Cartan–Hadamard theorem and the second variation formula. ◻
]

=== 3.6 The Kerr–Newman comparison maps <the-kerrnewman-comparison-maps>

The models below are comparison objects. Their stationarity is not a hypothesis on the given data. Set

$ C = Q^4 + 4 J^2 \, #h(2em) F_(*) \( R \) = 1 / 2 sqrt(R^2 + 2 Q^2 + C \/ R^2) . $

#thm([Lemma 3.7.])[
  (Model parameters).  #emph[For every $R > 0$ with $R^2 > sqrt(C)$, define 
$ M = F_(*) \( R \) \, #h(2em) a = - J \/ M \, #h(2em) b = sqrt(M^2 - a^2 - Q^2) . $

 Then 
#[#set math.equation(numbering: n => "(3.18)")
 $ b = frac(R^4 - C, 4 M R^2) > 0 \, #h(2em) \( M + b \)^2 + a^2 = R^2 \, #h(2em) F'_(*) \( R \) = b / R . $ <a:parameter-identities>]

 The function $b \( R \)$ is strictly increasing and maps this branch onto $\( 0 \, oo \)$.]
] <a:model-parameters>

#proof[
  Substitute $4 M^2 = R^2 + 2 Q^2 + C \/ R^2$ and $a^2 = J^2 \/ M^2$. Clearing denominators gives the first two identities. Ordinary differentiation gives the third and also
  $ b' \( R \) = frac(R^8 + 4 Q^2 R^6 + 6 C R^4 + 4 Q^2 C R^2 + C^2, 2 R^2 \( R^4 + 2 Q^2 R^2 + C \)^(3 \/ 2)) > 0 . $
  At the lower endpoint $b arrow.r 0$ (also when $C = 0$, where the endpoint is $R = 0$); as $R arrow.r oo$, $b tilde.op R \/ 2$. ◻
]

Use the azimuth oriented by $eta$ and the standard electrically charged Kerr–Newman solution with the parameter $a$ just fixed. In coordinates

$ r = M + b cosh sigma \, #h(2em) sigma > 0 \, #h(2em) 0 < theta.alt < pi \, $

put

$ Delta & = r^2 - 2 M r + a^2 + Q^2 = b^2 sinh^2 sigma \,\
P & = r^2 + a^2 cos^2 theta.alt \,\
W & = \( r^2 + a^2 \)^2 - a^2 Delta sin^2 theta.alt . $

Its metric and a Maxwell potential are

#[#set math.equation(numbering: n => "(3.19)")
 $ overline(g)_(*) =  & - frac(P Delta, W) upright(d) t^2 + P \( upright(d) sigma^2 + upright(d) theta.alt^2 \) + W / P sin^2 theta.alt (upright(d) phi.alt - frac(a \( 2 M r - Q^2 \), W) upright(d) t)^2 \,\
frak(a)_(*) =  & frac(Q r, P) \( upright(d) t - a sin^2 theta.alt thin upright(d) phi.alt \) \, #h(2em) cal(F)_(*) = upright(d) frak(a)_(*) . $ <a:kn-metric>]

We use the classical explicit fact #cite(label("NewmanEtAl1965")) that Equation (3.19) is an Einstein–Maxwell solution. For the field-equation verification and the Boyer–Lindquist form, see also #cite(label("AdamoNewman2014")) Section 2.2 and Equation (3.2), with the opposite metric signature. The reduction and comparison properties needed from that solution are verified next.

#thm([Proposition 3.8.])[
  (Model map and boundary data).  #emph[Let $Phi_(*)$ be the map of Proposition 7 for Equation (3.19), with axis values Equation (3.5). Its ADM energy is $M$, its angular momentum in the present convention is $J = - a M$, its charges are $Q \, 0$, and its horizon area is $4 pi R^2$. It is independent of Killing time. Define 
$ w = sinh sigma sin theta.alt \, #h(2em) q_(*) = 1 / 2 log \( W sin^2 theta.alt \) . $

 With Euclidean strip derivatives, it satisfies 
#[#set math.equation(numbering: n => "(3.20)")
 $ "div"_G \( w thin upright(d) Phi_(*) \) = 0 \, #h(2em) - Delta q_(*) = \| partial Phi_(*) \|_G^2 \, #h(2em) q_(*) \( 0 \, theta.alt \) = log \( R^2 sin theta.alt \) . $ <a:model-map>]

 The canonical slice and its tensor and fields extend smoothly to the bifurcation sphere, including the ordinary axis poles. Its potentials have the regularity of Lemma 5; their renormalized components and $u_(*) - log sin theta.alt$ have bounded derivatives on compact closed strip ranges.]
] <a:model>

#proof[
  The axial radius and quotient are
  #[#set math.equation(numbering: n => "(3.21)")
   $ X_(*)^2 = \( W \/ P \) sin^2 theta.alt \, #h(2em) gamma_(*) = - b^2 sinh^2 sigma sin^2 theta.alt thin upright(d) t^2 + W sin^2 theta.alt \( upright(d) sigma^2 + upright(d) theta.alt^2 \) . $ <a:kn-quotient>]
  Both Maxwell contractions in Equation (3.11) have zero time component. The same holds for $*_H upright(d) upright(bold(A))$, since $upright(bold(A)) = - a \( 2 M r - Q^2 \) upright(d) t \/ W$ has curvature of the form $upright(d) t and$ a spatial one-form. Thus the map is time independent.
  An explicit check of all potential constants is useful. With $x = cos theta.alt$, they are
  #[#set math.equation(numbering: n => "(3.22)")
   $ psi_(*) & = - frac(Q \( r^2 + a^2 \) x, P) \, & chi_(*) & = - frac(Q a r \( 1 - x^2 \), P) \,\
z_(*) & = a M x \( 3 - x^2 \) + frac(a^3 M x \( 1 - x^2 \)^2 - a Q^2 r x \( 1 - x^2 \), P) . &  & $ <a:kn-potentials>]
  These expressions satisfy the contractions and corrected twist in Equation (3.11), by differentiation. In particular the axis values are $\( - Q \, 0 \, 2 a M \)$ and $\( Q \, 0 \, - 2 a M \)$. To check the angular sign directly, the shift is
  $ beta^phi.alt = - 2 a M \/ r^3 + O \( r^(- 4) \) . $
  Stationarity and the positive convention $K = 1 / 2 cal(L)_n g$ give $K = - cal(L)_beta g \/ \( 2 N \)$ on the canonical slice. Hence
  $ K_(r phi.alt) = - 3 a M sin^2 theta.alt \/ r^2 + O \( r^(- 3) \) \, #h(2em) frac(1, 8 pi) integral_(S_r) K \( nu \, eta \) thin upright(d) A arrow.r - a M . $
  The leading term $Q upright(d) t \/ r$ of $frak(a)_(*)$ gives $F_(t r) = Q \/ r^2 + O \( r^(- 3) \)$ and therefore positive electric charge $Q$ with $E = iota_n F$. The magnetic flux is zero.
  The horizon is $r = M + b$, or $sigma = 0$. There $W = \( r^2 + a^2 \)^2 = R^4$ by Equation (3.18); its area density is $R^2 sin theta.alt thin upright(d) theta.alt upright(d) phi.alt$, proving the area and the boundary value of $q_(*)$. In the Euclidean end radius $𝜚 = \( b \/ 2 \) e^sigma$, one has $r = 𝜚 + M + b^2 \/ \( 4 𝜚 \)$. Expanding the spatial metric in the associated Cartesian chart gives
  $ \( g_(*) \)_(i j) = \( 1 + 2 M \/ 𝜚 \) delta_(i j) + O_4 \( 𝜚^(- 2) \) \, $
  and hence ADM energy $M$. The shift and potential give $K_(*) = O_3 \( 𝜚^(- 3) \)$, the electric Coulomb leading term, and $B_(*) = O_3 \( 𝜚^(- 3) \)$, with uniform polar derivatives.
  Put $rho_(*) = b w$. Equation (3.21) is static, with spatial metric $e^(2 q_(*)) \( upright(d) sigma^2 + upright(d) theta.alt^2 \)$. The wave-map equation in Equation (3.12) is therefore $"div"_G \( rho_(*) upright(d) Phi_(*) \) = 0$, giving the first equation in Equation (3.20). Its spatial Ricci trace is
  $ - 2 e^(- 2 q_(*)) Delta q_(*) - rho_(*)^(- 1) e^(- 2 q_(*)) Delta rho_(*) = 2 e^(- 2 q_(*)) \| partial Phi_(*) \|_G^2 . $
  Since $Delta rho_(*) = 0$, this proves the second equation.
  Finally all the displayed spatial coefficients and potentials are smooth even functions of $sigma$ at zero, with the ordinary polar parity in $theta.alt$. The apparent lapse division in the canonical $K_(*)$ and fields is removable. Indeed the angular velocity $omega_(*) = a \( 2 M r - Q^2 \) \/ W$ is constant on the horizon: $omega_H = a \/ R^2$. Thus its $theta.alt$ derivative is $O \( sigma^2 \)$ and its $sigma$ derivative is $O \( sigma \)$, while the lapse is $sigma$ times a smooth positive even function. The electrostatic potential on $partial_t + omega_H partial_phi.alt$ is also constant on the horizon; its nonconstant remainder is $O \( sigma^2 \)$. These orders give smooth canonical tensor and field components after division by the lapse. The metric has no conical defect at the axes, and the explicit potentials give precisely the order-two and corrected order-four axis behavior established earlier. For a two-sided extension across $sigma = 0$, the stationary lapse is taken with its smooth sign, $b sinh sigma sqrt(P \/ W)$; the stationary Killing field changes time orientation across the bridge. This supplies a smooth future normal and tensor, whereas using the absolute value of that lapse would only reflect the chosen stationary time orientation. This proves all the regularity assertions. ◻
]

== 4 A conformal cut of prescribed capacity <c:section>

The comparison argument will require a pointwise length density on its inner edge. A lower bound for the total length of every crossing does not directly provide such a density. The following lemma constructs both the cut and its conformal parametrization; its leading coefficient at infinity can be prescribed independently of the lower length bound.

Write

$ cal(S) = bb(R) times \( 0 \, pi \) \, #h(2em) Z = e^(v + i alpha) . $

The sides $alpha = 0$ and $alpha = pi$ correspond to the positive and negative real rays, respectively. In the lemma, a crossing is a rectifiable path with ordinary endpoints on these two rays and otherwise lying in the upper half-plane. Allowing limiting or piecewise smooth crossings gives the same lower-bound hypothesis by approximation.

#thm([Lemma 4.1.])[
  (Variable conformal cut).  #emph[Suppose a meridional length element in the upper half-plane is 
$ upright(d) ell = B \( v \, alpha \) lr(|upright(d) \( v + i alpha \)|) . $

 Besides the boundary puncture $Z = 0$, allow finitely many punctures $a_1 \, dots.h \, a_N in bb(R) \\ { 0 }$. Assume the following.]
  + #emph[Away from the punctures and the two ends, $B \/ sin alpha$ has a positive continuous extension to the closed strip.]
  + #emph[As $v arrow.r - oo$, this quotient converges uniformly to a positive continuous function $b_(-) \( alpha \)$. As $v arrow.r + oo$, 
$ frac(B \( v \, alpha \), c_(+) e^(2 v) sin alpha) arrow.r 1 quad upright("uniformly") \, #h(2em) c_(+) > 0 . $

 At the sides, these statements concern the continuous quotients.]
  + #emph[Near each $a_j$, put $t = - log lr(|Z - a_j|)$ and $beta = arg \( Z - a_j \)$. For sufficiently large $t$, the same length element has the form 
$ B_j \( t \, beta \) lr(|upright(d) \( - t + i beta \)|) \, #h(2em) c_j sin beta lt.eq B_j \( t \, beta \) lt.eq C_j sin beta \, #h(2em) 0 < c_j lt.eq C_j < oo . $

]
  #emph[If every crossing has length at least $L > 0$, then, for every $k > 0$ and $0 < L' < L$, there is a holomorphic univalent map on $lr(|xi|) > 1$, smooth with nonvanishing derivative on $lr(|xi|) = 1$, such that 
$ f \( overline(xi) \) = overline(f \( xi \)) \, #h(2em) f \( xi \) = k xi + O \( 1 \) quad \( xi arrow.r oo \) . $

 Its boundary is a smooth Jordan curve enclosing $0$, its upper semicircle maps to a cut avoiding all additional punctures, and, in the coordinates $xi = e^(sigma + i theta.alt)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ frac(upright(d) ell, upright(d) theta.alt)\|_(sigma = 0) gt.eq L' / 2 sin theta.alt \, #h(2em) 0 lt.eq theta.alt lt.eq pi . $ <c:density>]

 Additional punctures not enclosed by the cut are marked points on the real sides of the parametrized exterior. The constants used to construct $f$ may depend on $k$.]
] <c:cut>

Only continuity of the original weight is required. In particular the statement applies to continuous weights with piecewise smooth seams. The smoothness asserted for the cut is in the coordinate $Z$.

=== 4.1 A smooth lower weight <a-smooth-lower-weight>

#thm([Lemma 4.2.])[
  #emph[Under the hypotheses of Lemma 11, for every $ell < L$ there is a weight 
$ W \( v \, alpha \) = b_0 \( v \, alpha \) sin alpha lt.eq B \( v \, alpha \) $

 whose crossing lengths are at least $ell$, where $b_0$ is smooth, has even reflection at both sides, satisfies $0 < m_0 lt.eq b_0 lt.eq M_0 < oo$, and is independent of $v$ on each sufficiently far end. It is smooth across the locations of the additional punctures.]
] <c:lower-weight>

#proof[
  All losses below can be made arbitrarily small. We first remove the extra puncture tails, while retaining the original weight elsewhere. Take pairwise disjoint puncture neighborhoods and modify the weight only where $t > T$. A positive bounded lower extension exists there: in the main strip, the puncture comparison implies
  $ frac(B, sin alpha) asymp lr(|Z|)^2 / lr(|Z - a_j|)^2 . $
  Indeed $sin beta = "Im" Z \/ lr(|Z - a_j|)$ and $lr(|upright(d) log \( Z - a_j \)|) = lr(|Z|) lr(|Z - a_j|)^(- 1) lr(|upright(d) log Z|)$. Thus a small positive smooth quotient can replace the divergent quotient near $a_j$, with the transition wholly in $t > T$.
  These modifications cannot decrease the crossing infimum by a fixed positive amount as $T arrow.r oo$. To prove this, suppose that modified crossings of length at most a fixed $M$ did produce such a loss. Enlarge each original side by all the modified tails attached to that side. Between the last encounter with the initial enlarged side before the first encounter with the terminal enlarged side, keep the intervening path. It meets no modified tail in its interior. If an endpoint is in a tail, this path must traverse the unchanged collar $T \/ 2 < t < T$ to leave its puncture neighborhood. On that traversal,
  $ M gt.eq c_j integral sin beta thin lr(|upright(d) t|) gt.eq frac(c_j T, 2) min sin beta . $
  At a point attaining, or arbitrarily approaching, this minimum, attach the path to the nearer local ray by a constant-$t$ angular interval. Its original length is at most
  $ C_j \( 1 - lr(|cos beta|) \) lt.eq C_j sin^2 beta lt.eq C_j (frac(2 M, c_j T))^2 . $
  Both local rays at $a_j$ lie on the same original global side. Attaching at the two ends of the retained path therefore produces an original opposite-side crossing with only $O \( T^(- 2) \)$ additional length. The finitely many disjoint collars make this estimate uniform. This contradicts a fixed loss. Taking $M > L$ suffices, since longer paths cannot violate any proposed lower bound below $L$.
  At the negative end, uniform convergence permits replacement by a smooth even profile below $b_(-)$, with arbitrarily small relative loss. A transition can be made within a region where the original quotient is uniformly close to $b_(-)$. At the positive end, fix a small $delta > 0$ and take $V$ large enough that
  $ \( 1 - delta \) c_(+) e^(2 v) lt.eq B \/ sin alpha lt.eq \( 1 + delta \) c_(+) e^(2 v) #h(2em) \( v gt.eq V - 1 \) . $
  Blend downward to $\( 1 - delta \) c_(+) e^(2 v)$ before $v = V$, and thereafter use $\( 1 - delta \) c_(+) e^(2 min \( v \, V \))$. Radial projection $\( v \, alpha \) mapsto \( min \( v \, V \) \, alpha \)$ converts a path for this lower weight into a path for the preexisting weight with length increased by at most $\( 1 + delta \) \/ \( 1 - delta \)$. Below $V$ this follows from the same ratio comparison on the transition; above $V$, projection deletes the radial component, and the angular weight at $V$ is at most that ratio times the saturated weight. Projection preserves the two sides. Consequently saturation loses only this arbitrarily small factor in the crossing lower bound.
  The resulting positive continuous quotient is bounded above and below, and is constant in $v$ on both far ends. Approximate it uniformly from below by a smooth quotient, even at the sides and still product on the ends. Such approximation follows by even reflection, convolution on the compact remaining rectangle, and a small downward adjustment; the positive lower bound converts uniform error to relative error. The product profiles can be approximated in the same way before extending them along the tails. The accumulated relative and additive losses can be chosen smaller than $L - ell$. This proves the lemma. ◻
]

=== 4.2 Distance calibration and removal of critical levels <distance-calibration-and-removal-of-critical-levels>

#thm([Lemma 4.3.])[
  (Angular calibration).  #emph[For every $L' < L$ there are a lower weight $W$ as in Lemma 12, a number $L_1 > L'$, and a smooth angular coordinate $Theta : overline(cal(S)) arrow.r \[ 0 \, pi \]$ such that 
#[#set math.equation(numbering: n => "(4.2)")
 $ phi = cos Theta \, #h(2em) lr(|upright(d) phi|)_(upright("flat")) lt.eq 2 / L_1 W lt.eq 2 / L_1 B . $ <c:calibration>]

 Here $Theta = 0 \, pi$ on the respective sides, $upright(d) Theta$ never vanishes, $Theta$ has ordinary odd reflection at both sides, and on each far end it is an increasing angular diffeomorphism independent of $v$. Moreover, $Theta$ is joined to $alpha$ by a smooth family of angular coordinates with these properties, product on uniform far ends; the estimate in Equation (4.2) is needed only at the final member.]
] <c:angular>

#proof[
  Choose a lower weight with crossing infimum at least $ell > L'$, leaving strict room for the losses that follow. Let $d_(+)$ denote its distance to the side $alpha = 0$. The distance inequality gives $lr(|upright(d) d_(+)|) lt.eq W$ almost everywhere. Since $m_0 lt.eq b_0 lt.eq M_0$, angular intervals give
  $ d_(+) \( v \, alpha \) lt.eq M_0 \( 1 - cos alpha \) \, #h(2em) d_(+) \( v \, alpha \) gt.eq ell - M_0 \( 1 + cos alpha \) . $
  The second inequality follows by appending an angular interval from the point to the opposite side to an almost minimizing path for $d_(+)$. For a small $h > 0$, truncate $d_(+)$ to $\[ h \, ell - h \]$ and put
  $ phi_0 = 1 - 2 min {1 \, max {0 \, frac(d_(+) - h, ell - 2 h)}} . $
  Thus $lr(|upright(d) phi_0|) lt.eq 2 W \/ \( ell - 2 h \)$, and $phi_0$ is identically $1$ and $- 1$ on full, uniform collars of the respective sides. Take $h$ small enough to retain strict slack above $L'$.
  Clamp $v$ to a large closed interval with endpoints inside the product tails. This projection is length nonincreasing for $W$, so composition preserves the gradient bound and makes $phi_0$ independent of $v$ on the far tails. Smooth after even reflection at the sides. The constant side collars remain constant; elsewhere $W$ has a positive lower bound on a compact rectangle, so convolution and a small slack loss preserve the weighted gradient bound. This produces a smooth function. A sufficiently small convex combination with $cos alpha$ then gives strict interior values and
  $ partial_(alpha alpha) phi \( v \, 0 \) < 0 \, #h(2em) partial_(alpha alpha) phi \( v \, pi \) > 0 . $
  Its gradient cost fits within the slack, because $sin alpha lt.eq W \/ m_0$.
  On a product end write $W = b_plus.minus \( alpha \) sin alpha$ and set
  $ I_plus.minus = integral_0^pi b_plus.minus \( s \) sin s thin upright(d) s \, #h(2em) phi_plus.minus \( alpha \) = 1 - 2 / I_plus.minus integral_0^alpha b_plus.minus \( s \) sin s thin upright(d) s . $
  The vertical crossing on that end gives $I_plus.minus gt.eq ell$. Both the smoothed function and $phi_plus.minus$ have the same endpoint values and even reflection, so their difference is $O \( sin^2 alpha \)$, uniformly on the end. Interpolate to $phi_plus.minus$ sufficiently slowly in $v$. The angular derivative is bounded by the convex combination of the preceding bounds. The new $v$ derivative is bounded by $C lr(|chi'|) sin^2 alpha$, which is arbitrarily small relative to $W$ when the interpolation interval is long. Thus, for some $L_0 > L'$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ lr(|upright(d) phi|) lt.eq 2 / L_0 W . $ <c:initial-calibration>]
  The angular derivative is strictly negative on the far ends and in small uniform side collars. A compactly supported arbitrarily small Morse perturbation away from those collars leaves these properties intact and leaves only finitely many critical points. We retain the notation $phi$ and a slightly smaller $L_0 > L'$.
  We next replace its level sets by a foliation without losing the estimate. Delete small open intervals about its finitely many critical values. In a closed remaining regular value band, intersect a level with $\[ - V \, V \] times \[ 0 \, pi \]$, taking $V$ in the common product tails. There is exactly one level point on each vertical edge and no point on a horizontal edge. A compact regular level is a union of circles and intervals; its two boundary points must therefore be joined by one interval component. This is the unique essential component.
  For an entire closed regular band, a vector field satisfying $upright(d) phi \( V_phi \) = 1$, chosen tangent to the vertical edges, flows these essential components smoothly into one embedded rectangle. It has precisely the two extreme essential arcs and the appropriate vertical-edge intervals as its boundary. The Jordan separation theorem therefore identifies its image with the full region between the two arcs. In particular, discarding the other, circular level components creates no holes in this essential band. Essential bands at distinct values are disjoint and ordered, since their order is fixed at both vertical ends and disjoint crossing arcs cannot exchange that order. Near $1$ and $- 1$ keep the monotone side collars: outside smaller such collars the values stay uniformly away from the extrema, by compactness and the product-end behavior.
  These finitely many essential bands can be completed to a foliation of the whole strip by proper arcs. Here is the extension with its boundary conditions. Slightly shrink each good band, retaining its level coordinate on a neighborhood of the resulting closed band. Between two consecutive bands, their smooth boundary arcs and the two vertical edges bound a disk. Prescribe product parametrizations on collars of all four edges, using the original label where it is already fixed and the existing angular labels on the vertical ends. They agree at the corners because the ends are product. Shrink the collars so that nonadjacent ones are disjoint and round within the compatible corner charts. Smooth Schoenflies charts reduce the extension to a prescribed orientation-preserving collar map of a disk. Here the relative extension can be described explicitly. In polar coordinates its boundary derivative is triangular, with positive diagonal entries. Interpolation to the radial product map is therefore an isotopy on a sufficiently thin collar; extend its generating vector field with a cutoff over the disk. For the resulting boundary map, choose an increasing lift $h$ with $h \( theta + 2 pi \) = h \( theta \) + 2 pi$. The map
  $ \( r \, theta \) mapsto #scale(x: 120%, y: 120%)[\(] r \, theta + chi \( r \) \( h \( theta \) - theta \) #scale(x: 120%, y: 120%)[\)] \, $
  where $0 lt.eq chi lt.eq 1$, $chi = 1$ near the boundary, and $chi = 0$ near the center, is a smooth disk diffeomorphism: its angular derivative is $1 - chi + chi h' > 0$, and it is the identity near the center. Undoing the extended collar isotopy gives an extension agreeing with the entire prescribed smaller collar. Thus there is no additional corner or orientation condition to impose. Extending by the product ends gives a smooth value function $hat(phi)$, with no interior critical points, agreeing with $phi$ on the smaller good bands and on the side collars. It has the same endpoint values and reflection parity. The labels in every intervening strip lie solely in its assigned complementary value interval. Thus discarded circles do not reappear as extra components of a good label.
  There is no a priori gradient estimate in an intervening strip, but there are only finitely many of them, they avoid the side collars, and they are product at infinity. Hence $lr(|upright(d) hat(phi)|) \/ W$ has a finite bound there, say $M$. The total width $delta$ of their label intervals, including small transition intervals within good bands, can be chosen arbitrarily small. Choose a smooth positive function $r$ of the label, equal to $1$ away from those intervals, at most $1$ everywhere, and at most $epsilon$ on every bad label interval; arrange its transitions inside good bands. Put
  $ F \( t \) = - 1 + frac(2, integral_(- 1)^1 r \( s \) thin upright(d) s) integral_(- 1)^t r \( s \) thin upright(d) s . $
  The normalization factor is at most $2 \/ \( 2 - delta \)$. On good bands the old gradient estimate is multiplied by at most this factor. On bad bands it is bounded by this factor times $epsilon M$. First choose $delta$ small, and then $epsilon$ small. The function $F compose hat(phi)$ satisfies Equation (4.2) for some $L_1 > L'$. It has no interior critical points. Since $F' > 0$ at the endpoints, its side jets remain nondegenerate and even. We again call this function $phi$.
  Set $Theta = arccos phi$. In the interior this is a submersion. At $alpha = 0$, the even expansion has the form $1 - phi = alpha^2 a \( v \, alpha^2 \)$ with $a \( v \, 0 \) > 0$; smooth square-root division shows that $Theta$ is $alpha$ times a positive smooth even function. The same argument applies to $pi - Theta$ at the other side. Thus $Theta$ has precisely the stated reflection and nonvanishing boundary derivative.
  For use in the analytic argument we also record an isotopy. Integrate $D Theta \/ lr(|D Theta|)^2$ from the lower edge, with $Theta$ as time. The vector field is vertical on the product ends and has bounded coefficients in the remaining compact region. Its flow gives a strip diffeomorphism $D \( v_0 \, theta \)$ with $Theta \( D \( v_0 \, theta \) \) = theta$. Reflection reverses the flow parameter and gives ordinary even/odd parity for the two components of $D$. In particular $D$ is product on uniform far ends.
  Such a diffeomorphism is smoothly isotopic to the identity within this class. First straighten its two end angular diffeomorphisms by convex angular interpolation, whose derivative stays positive, and extend these collar motions by their generating vector fields. Next straighten the parametrizations of the horizontal sides, if necessary, by convex interpolation of their increasing longitudinal parametrizations; these motions are compactly supported in $v$. After this, the derivative on each side is diagonal with positive entries by reflection. Linear interpolation to the identity in a sufficiently thin collar is consequently a local collar isotopy. Extend its generating field with a symmetric cutoff. The remaining map fixes a neighborhood of the entire boundary of a compact disk. After choosing a smaller fixed boundary collar, the smooth disk isotopy theorem #cite(label("Smale1959")) Theorem 4 joins it to the identity through orientation-preserving diffeomorphisms fixing that collar. Reattaching the fixed collars and ends, and taking inverse coordinate maps, gives the required family of angular submersions. All these uses of disk topology concern smooth parametrizations of planar disks; no metric estimate is required during the isotopy. ◻
]

=== 4.3 The nonlinear analytic boundary problem <the-nonlinear-analytic-boundary-problem>

We prove the analytic step explicitly because both its normalization at infinity and its compactness are needed for arbitrary prescribed $k$. Extend every angular coordinate by odd reflection and by $Theta \( v \, alpha + 2 pi \) = Theta \( v \, alpha \) + 2 pi$.

#thm([Lemma 4.4.])[
  #emph[Let $Theta$ be an angular coordinate with the product-end, reflection, and isotopy properties of Lemma 13. For every $k > 0$ there is a real-symmetric holomorphic function $U$ on $lr(|xi|) > 1$, smooth up to the circle and with $U \( oo \) = 0$, such that 
#[#set math.equation(numbering: n => "(4.4)")
 $ Theta #scale(x: 120%, y: 120%)[\(] log k + Re U \( e^(i theta.alt) \) \, theta.alt + Im U \( e^(i theta.alt) \) #scale(x: 120%, y: 120%)[\)] = theta.alt #h(2em) \( theta.alt in bb(R) \) . $ <c:boundary-equation>]

 The map $f \( xi \) = k xi e^(U \( xi \))$ is univalent on the exterior, and its boundary is a smooth regular Jordan curve enclosing zero.]
] <c:analytic>

#proof[
  Let $Theta_s$, $0 lt.eq s lt.eq 1$, be the isotopy, with $Theta_0 \( v \, alpha \) = alpha$ and $Theta_1 = Theta$. For fixed $\( s \, theta.alt \)$, the allowed values $u = x + i y$ form the line
  $ Gamma_(s \, theta.alt) = { x + i y : Theta_s \( log k + x \, theta.alt + y \) = theta.alt } . $
  It is a smooth proper embedded line with horizontal ends. These lines vary smoothly, periodically in $theta.alt$, with $Gamma_(s \, - theta.alt) = overline(Gamma_(s \, theta.alt))$. At $theta.alt = 0 \, pi$ the line is the real axis. Their heights and the locations at which they become horizontal have uniform bounds for $s in \[ 0 \, 1 \]$ and $theta.alt$ modulo $2 pi$.
  Orient each line from its left end to its right end. Its tangent phase has a smooth real lift $beta$, obtained by transporting the initial phase zero through the strip diffeomorphisms of the isotopy. It is periodic in $theta.alt$ and odd under reflection. To check the potential integer ambiguity, at the left horizontal end its value is zero. At the right horizontal end its value is an integer multiple of $2 pi$; that integer is continuous in the isotopy parameter and is zero for $s = 0$, so remains zero. The same uniqueness of the lift proves periodicity and reflection, with value zero on the straight boundary leaves. On compact sets of positions, the line data, the phase, and all their derivatives are uniformly bounded.
  ===== 4.3.1 Openness. <openness.>
  Work with real-symmetric exterior analytic traces in $C^(m \, lambda)$, $m gt.eq 2$, $0 < lambda < 1$, normalized by $U \( oo \) = 0$; the boundary equation takes values in the odd real $C^(m \, lambda)$ functions. At a solution, its linearization in a variation $dot(U)$ is
  $ Theta_(s \, v) Re dot(U) + Theta_(s \, alpha) Im dot(U) = c \( theta.alt \) Im \( e^(- i beta \( theta.alt \)) dot(U) \) \, #h(2em) c \( theta.alt \) > 0 . $
  Here $c$ is the magnitude of the label gradient, with sign fixed by the orientation of the strip. At a symmetric trace it is even, while $beta$ is odd.
  The normalized exterior Schwarz problem gives a real-symmetric analytic function $a$, with $a \( oo \) = 0$, whose imaginary boundary value is $beta$. The zero-mean compatibility condition is automatic for odd data. The multiplier $A = e^a$ is nonvanishing, real-symmetric, and $A \( oo \) = 1$. Substituting $dot(U) = A H$ reduces a prescribed linearized value $g$ to
  $ Im H = frac(g, c lr(||) A) \, #h(2em) H \( oo \) = 0 . $
  The right side is again odd. The Schwarz problem solves it uniquely: the harmonic conjugate is determined by the periodic Hilbert transform, and the real constant is fixed at infinity. It gives a bounded inverse on the stated Hölder spaces. Multiplication by $A$ preserves the normalization. Smooth composition on the circle now permits the implicit function theorem. Since $U = 0$ solves the equation at $s = 0$, the set of solvable parameters is nonempty and open.
  ===== 4.3.2 Uniform range bounds. <uniform-range-bounds.>
  The line family bounds $Im U$ on the circle, and hence throughout the exterior by the harmonic maximum principle. Write $h_(s \, +) \( theta.alt \)$ for the height of the right horizontal end of $Gamma_(s \, theta.alt)$. It is a uniformly smooth odd periodic function. Let $H_(s \, +)$ be its normalized exterior Schwarz solution and set $V = U - H_(s \, +)$. The functions $H_(s \, +)$ are uniformly bounded in every fixed smooth norm. If $Re V$ had an excessively large positive maximum, it would occur at a point of the circle on an open arc where $U$ is in the right horizontal tail. On that arc $Im V = 0$. The Cauchy–Riemann equations then give zero normal derivative of $Re V$ at the maximum, contradicting the boundary Hopf lemma unless $V$ is constant. The constant case has $V \( oo \) = 0$ and cannot give such a maximum. One may apply this argument after inversion to the closed disk, where infinity is an interior point. Applying the same argument to the left horizontal ends gives a lower bound for $Re U$. Thus every solution, at every $s$, satisfies
  #[#set math.equation(numbering: n => "(4.5)")
   $ ∥∥ U_(L^oo \( lr(|xi|) gt.eq 1 \)) lt.eq C . $ <c:range>]
  The constant may depend on $k$; the only effect of $log k$ is to translate the horizontal thresholds for the line family.
  ===== 4.3.3 Boundary derivative compactness. <boundary-derivative-compactness.>
  Suppose instead that a sequence of solutions has $P_j = max_(lr(|xi|) = 1) lr(|partial_theta.alt U_j|) arrow.r oo$. Choose maximum points $e^(i theta.alt_j)$ and use the half-plane coordinates
  $ u_j \( z \) = U_j #scale(x: 120%, y: 120%)[\(] e^(i theta.alt_j + z \/ P_j) #scale(x: 120%, y: 120%)[\)] \, #h(2em) Re z gt.eq 0 . $
  The analytic function $xi U'_j \( xi \)$ has its maximum modulus on the circle, so Equation (4.5) and the definition of $P_j$ give
  $ lr(|u_j|) lt.eq C \, #h(2em) lr(|u'_j|) lt.eq 1 \, #h(2em) lr(|partial_y u_j \( 0 \)|) = 1 . $
  On the imaginary axis its trace lies in $Gamma_(s_j \, theta.alt_j + y \/ P_j)$. Differentiate the defining equation. With $beta_j \( y \)$ the tangent phase along this trace, the result is
  #[#set math.equation(numbering: n => "(4.6)")
   $ Im #scale(x: 120%, y: 120%)[\(] e^(- i beta_j \( y \)) partial_y u_j \( i y \) #scale(x: 120%, y: 120%)[\)] = P_j^(- 1) g_j \( y \) . $ <c:scaled-boundary>]
  For example, the forcing is $\( 1 - Theta_(s_j \, alpha) \) \/ lr(|D Theta_(s_j)|)$, evaluated at the trace. The range lies in a fixed compact set, the label gradient is bounded away from zero there, and $u_j$ is uniformly Lipschitz. Hence both $beta_j$ and $g_j$ have uniform Lipschitz bounds on every fixed boundary interval.
  We justify convergence of derivatives all the way to this boundary. Extend $beta_j$ from a slightly larger interval by a fixed cutoff, and solve the half-plane Schwarz problem with that imaginary trace for an analytic logarithm. Its exponential $A_j$ and its inverse have uniform local $C^lambda$ bounds for every $0 < lambda < 1$: the Schwarz integral and Hilbert transform send compactly supported uniformly Lipschitz data to uniformly $C^lambda$ functions. The analytic derivative $D_j = i u'_j$ divided by $A_j$ is bounded and, by Equation (4.6), has uniformly $C^lambda$ imaginary trace on the smaller interval. Subtract a Schwarz solution for a localized version of that trace. The remainder has zero imaginary trace and extends across the interval by Schwarz reflection. It is uniformly bounded on a smaller disk, so its derivatives there obey the interior Cauchy estimates. Adding back the Schwarz solution proves uniform local $C^lambda$ bounds for $D_j$ up to the straight boundary. Consequently a subsequence converges locally in $C^1$ on the closed half-plane to a bounded holomorphic $u$, and $lr(|partial_y u \( 0 \)|) = 1$.
  After a further subsequence $s_j arrow.r s_oo$ and $theta.alt_j arrow.r theta.alt_oo$ modulo $2 pi$. The limiting boundary trace lies on the single proper embedded line $Gamma_(s_oo \, theta.alt_oo)$. Properness and the bound $lr(||) u lt.eq C$ place this trace in one compact simple subarc $A$ of that line: take a compact parameter interval containing the inverse image of its intersection with the closed range disk. For every polynomial $p$, the bounded half-plane maximum principle gives
  $ lr(|p \( u \( z \) \)|) lt.eq max_(a in A) lr(|p \( a \)|) . $
  There is no boundary condition missing at infinity here. Map the half-plane to a disk; the possible exceptional boundary point has harmonic measure zero, and its contribution disappears by boundedness when a surrounding boundary arc shrinks. The displayed inequalities put the image of $u$ in the polynomial hull of $A$. In one complex variable the polynomial hull of a compact set is the set together with its bounded complementary components. A planar simple arc has connected complement, so its hull is itself. The open mapping theorem therefore forces $u$ to be constant, contradicting its normalized boundary derivative. The assumed derivative blowup is impossible.
  ===== 4.3.4 Closedness. <closedness.>
  With first derivatives bounded, the same phase-multiplier argument on fixed boundary intervals gives uniform $C^lambda$ bounds for them. The phase and forcing, now smooth compositions of $C^(1 \, lambda)$ traces, have $C^(1 \, lambda)$ bounds. More explicitly, on the fixed circle set $D = i xi U'$ and let $A$ be the phase multiplier. Then $Im \( D \/ A \) = g \/ lr(||) A$, with $g = \( 1 - Theta_(s \, alpha) \) \/ lr(|D Theta_s|)$ evaluated at the trace. Here $D \/ A$ is anti-real-symmetric and $g$ is even; this bootstrap uses Schwarz estimates for unrestricted normalized analytic traces, not the odd codomain used for openness. The imaginary boundary mean vanishes automatically because this actual analytic function has $\( D \/ A \) \( oo \) = 0$, and its remaining real constant is zero by the same normalization. Thus the Schwarz estimates increase the regularity of $U$ by one derivative. Induction gives bounds of every fixed order; interior bounds follow from Cauchy estimates. Thus sequences of solutions have convergent subsequences in the chosen $C^(m \, lambda)$ space, and their limits solve the boundary equation at the limiting parameter. Solvability is closed as well as open. Connectedness of $\[ 0 \, 1 \]$ proves existence at $s = 1$.
  ===== 4.3.5 Univalence. <univalence.>
  For $f = k xi e^U$, differentiating the boundary equation gives
  $ D Theta dot.op #scale(x: 120%, y: 120%)[\(] partial_theta.alt Re U \, 1 + partial_theta.alt Im U #scale(x: 120%, y: 120%)[\)] = 1 . $
  Thus its boundary derivative never vanishes. If two boundary values of $f$ coincide, their logarithmic radii agree and their lifted angles differ by an integer multiple of $2 pi$. The equivariance of $Theta$ then says that their parameters differ by the same multiple of $2 pi$. The boundary curve is therefore injective. Its winding about zero is one, directly from $f = k e^(i theta.alt) e^(U \( e^(i theta.alt) \))$. It is a regular Jordan curve enclosing zero.
  For a point $w$ off this curve, apply the argument principle to the exterior domain, including its one simple pole at infinity. If $n \( w \)$ is the winding of the positively parametrized boundary curve, the number of finite preimages, counted with multiplicity, is $1 - n \( w \)$. It is one in the unbounded component and zero in the bounded component. No interior point can map to the boundary curve, by the open mapping theorem and the zero count on its bounded side. Hence $f$ is univalent, has no interior critical points, and maps onto the unbounded component. Symmetry implies that a real image point has a real preimage, by uniqueness of preimages. Since the upper half maps to the upper half near infinity, it does so throughout. Finally $U \( oo \) = 0$ gives $f = k xi + O \( 1 \)$ with precisely the prescribed leading coefficient. ◻
]

=== 4.4 Completion of the cut construction <completion-of-the-cut-construction>

#proof[
  Choose the angular calibration with $L_1 > L'$ and solve the analytic boundary problem at the prescribed $k$. On the upper inner edge,
  $ phi #scale(x: 120%, y: 120%)[\(] log lr(|f \( e^(i theta.alt) \)|) \, arg f \( e^(i theta.alt) \) #scale(x: 120%, y: 120%)[\)] = cos theta.alt . $
  Consequently Equation (4.2) gives
  $ sin theta.alt lt.eq 2 / L_1 W #scale(x: 120%, y: 120%)[\(] log lr(||) f \, arg f #scale(x: 120%, y: 120%)[\)] lr(|frac(upright(d), upright(d) theta.alt) log f \( e^(i theta.alt) \)|) lt.eq 2 / L_1 frac(upright(d) ell, upright(d) theta.alt) . $
  This already proves Equation (4.1) with strict slack. If an endpoint coincides with an additional puncture, translate $f$ by a sufficiently small real constant. This preserves symmetry, univalence, and the leading coefficient $k$, and preserves enclosure of zero because the untranslated Jordan curve has positive distance from zero.
  The slack survives such a translation, including at the endpoints. Indeed, in $Z$ coordinates the smooth lower length density is
  $ lambda_0 \( Z \) = frac(b_0 \( log lr(||) Z \, arg Z \) "Im" Z, lr(||) Z^2) . $
  Away from zero it is smooth with odd reflection and has a positive simple zero at the real axis. For the translated smooth symmetric curve, the quotient
  $ frac(lambda_0 \( f \( e^(i theta.alt) \) + t \) lr(|partial_theta.alt f \( e^(i theta.alt) \)|), sin theta.alt) $
  extends continuously to $theta.alt = 0 \, pi$ and depends continuously on the small real translation $t$. At $t = 0$ it is at least $L_1 \/ 2$. Compactness of $\[ 0 \, pi \]$ therefore preserves the bound $L' \/ 2$ for all sufficiently small $t$. Avoiding the finitely many translations that put either endpoint at an $a_j$ makes the cut miss every extra puncture. Its interior already lies strictly in the upper half-plane. The original density dominates this lower density throughout, so the required estimate follows for $B$. The statement about remaining marked side points follows from symmetry and exterior univalence. ◻
]

== 5 Riemannian comparison at a prescribed conformal scale <r:section>

The comparison uses the length metric $frak(h)_r = X_r^2 h_r$ on the meridian of a polarized metric $g_r = h_r + X_r^2 upright(d) phi.alt^2$. Thus rotation of a meridional arc of $frak(h)_r$-length $ell$ has area $2 pi ell$. The subscript $r$ labels the comparison metric; it never denotes differentiation. The potentials, their normalization, and the target metric $G$ are those of the axial reduction. In particular,

$ Phi = \( u \, psi \, chi \, z \) \, #h(2em) u = log X_r \, #h(2em) G = upright(d) u^2 + \| cal(D)_(X_r) \|^2 . $

#thm([Proposition 5.1.])[
  (Riemannian comparison).  #emph[Let $Omega_r$ be the closure of the component toward infinity obtained by removing finitely many smooth compact invariant obstacles from a rotation exterior as in the axial reduction. The omitted region includes the original inner side, and $partial Omega_r$ is nonempty. Suppose the following hold.]
  + #emph[The polarized metric $g_r$ is smooth up to its inner faces, asymptotically flat of order $q_d > 1 \/ 2$ through at least two derivatives, and has finite ADM energy $E_r$.]
  + #emph[The potentials are restrictions of potentials on the original rotation exterior. Their constants on its two axis sides are $\( - Q \, 0 \, - 2 J \)$ and $\( Q \, 0 \, 2 J \)$, and they have the polar and end regularity of Lemma 5 and Equation (3.6).]
  + #emph[One has 
#[#set math.equation(numbering: n => "(5.1)")
 $ R_(g_r) gt.eq 2 \| cal(D)_(X_r) \|_(g_r)^2 \, #h(2em) R_(g_r) > 0 . $ <r:scalar-hypothesis>]

 Each inner face has strictly negative mean curvature for the normal toward infinity. Alternatively, the inner boundary is already a smooth invariant stable minimal boundary.]
  + #emph[Every meridional path in the retained region joining the two original axis sides has $frak(h)_r$-length at least $L > 0$. The same assumption may be verified by a length-decreasing projection from any added collars to a reference meridian with that lower bound.]
  #emph[For every $R$ on the open physical branch $R^2 > sqrt(Q^4 + 4 J^2)$, let $M = F_(*) \( R \)$ and $b > 0$ be the model parameters in Lemma 9. Then 
#[#set math.equation(numbering: n => "(5.2)")
 $ E_r gt.eq F_(*) \( R \) + b / 2 log frac(L, 2 R^2) . $ <r:mass-bound>]

 If the given inner boundary is a single stable minimal sphere, the strict inequality $R_(g_r) > 0$ may be omitted.]
] <r:comparison>

Here and below, meridional paths can be taken piecewise smooth, with ordinary axis endpoints and compact image away from the punctures of any cylindrical completion. The smooth approximation argument below also gives the same lower bound for their ordinarily rectifiable limits.

=== 5.1 Stable boundary and preservation of crossing lengths <r:hulls>

We first construct a stable minimal boundary when the initial faces have strictly negative mean curvature. Choose a sufficiently distant coordinate sphere in a strictly mean-convex foliation of the end. In the bounded region between this sphere and the inner obstacles, minimize the full perimeter of filled inner sets containing the obstacles. A smooth fill on the excluded side may be used to pose this ambient perimeter problem; it asserts nothing about the constraints on that side. Perimeter compactness and lower semicontinuity give a minimizer. Smooth-obstacle regularity in dimension three gives a $C^(1 \, 1)$ boundary, smooth and minimal away from the obstacle #cite(label("HuiskenIlmanen2001")) Regularity Theorem 1.3(iii).

Neither barrier can be touched. At an inner contact point, write both surfaces as graphs with the common normal toward infinity. The minimizing graph lies above the obstacle graph and has weak outward mean curvature at least zero, by outward variations, whereas the obstacle has strictly negative mean curvature. The graph comparison principle excludes this contact. The opposite strict comparison excludes contact with the outer sphere. The mean-convex foliation also prevents escape beyond the chosen outer barrier. The free boundary is therefore a smooth stable minimal surface.

We can choose the minimizer invariantly. Among the minimizers choose one with largest filled volume; such a choice exists by compactness. If $E_1 \, E_2$ are two minimizers, perimeter submodularity gives

$ "Per" \( E_1 union E_2 \) + "Per" \( E_1 ∩ E_2 \) lt.eq "Per" \( E_1 \) + "Per" \( E_2 \) . $

Both union and intersection are admissible, so both are minimizers. The union of two distinct largest-volume minimizers would have larger volume. Consequently that minimizer is unique up to null sets, and invariance of the problem under rotations makes it invariant. Fill bounded complementary pockets and retain the frontier toward infinity. If a stable minimal boundary was supplied initially, begin with that frontier instead.

For a two-sided stable minimal component $Sigma$, testing its Jacobi form by $1$ and using the Gauss equation gives

#[#set math.equation(numbering: n => "(5.3)")
 $ integral_Sigma R_Sigma thin upright(d) A gt.eq integral_Sigma \( R_(g_r) + \| upright("II") \|^2 \) thin upright(d) A > 0 . $ <r:stable-sphere>]

Thus every orientable component is a sphere. Strict scalar positivity is used only here, which explains the last assertion of the proposition. The rotation action on each sphere has two poles. In the capped rotation topology of the axial reduction, the corresponding meridional arcs and the finite axis intervals between their poles bound their compact-side disks. The filled frontier components are not nested. Exactly one compact side contains the cap behind the original boundary. Its arc joins the two original axis sides; the endpoints of every other arc lie on a single original side. Since the potentials are inherited from the whole original exterior, all three potential jumps on these additional spheres vanish.

For later use, we spell out the conversion of crossing lengths to enclosing areas. A piecewise smooth meridional path joining the original axis sides can first be perturbed off the inner boundary and off the axis except at its endpoints, with arbitrarily small increase of length in the continuous metric $X_r^2 h_r$. Arrange finitely many transverse self-intersections, discard loops, and extract a simple crossing arc. At its endpoints round it to meet the axis orthogonally in ordinary polar coordinates. The change in weighted length tends to zero because $X_r$ vanishes linearly there. Rotation produces a smooth invariant enclosing cut. In particular, if every invariant enclosing cut in a reference exterior has area at least $A_0$, then every crossing path there has length at least

#[#set math.equation(numbering: n => "(5.4)")
 $ L = frac(A_0, 2 pi) . $ <r:area-length>]

This argument uses invariant cuts only. A lower bound for all enclosing cuts supplies the required bound for that subclass.

=== 5.2 Cylindrical completion and its curvature <r:cylinders>

Discard the compact side of the stable boundary. Warped-product and two-dimensional conformal curvature formulas give, off the axis,

$ R_(g_r) = 2 K_(h_r) - 2 X_r^(- 1) Delta_(h_r) X_r \, #h(2em) K_(frak(h)_r) = X_r^(- 2) \( K_(h_r) - Delta_(h_r) u \) . $

Since $X_r^(- 1) Delta_(h_r) X_r = Delta_(h_r) u + \| upright(d) u \|_(h_r)^2$, we obtain

#[#set math.equation(numbering: n => "(5.5)")
 $ X_r^2 K_(frak(h)_r) = 1 / 2 R_(g_r) + \| upright(d) u \|_(h_r)^2 \, #h(2em) K_(frak(h)_r) gt.eq \| upright(d) Phi \|_(frak(h)_r \, G)^2 . $ <r:curvature>]

Minimality of a rotated surface is precisely the geodesic equation for its generating arc in $frak(h)_r$, since its area is $2 pi$ times that arc’s length.

Fix a stable boundary sphere and let $ell$ be arclength along its generating arc in $frak(h)_r$. Let $p > 0$ be its invariant first Jacobi eigenfunction, with eigenvalue $lambda gt.eq 0$, and put $j = X_r p$. The eigenfunction is invariant because the positive first eigenfunction is unique up to scale. A sphere normal speed $s_0$ induces geodesic normal speed $X_r s_0$. The corresponding second-variation bilinear forms therefore satisfy

$ I_Sigma \( p \, s_0 \) = 2 pi I_(upright("geo")) \( X_r p \, X_r s_0 \) . $

Since the rotational area measure is $2 pi thin upright(d) ell$, testing by invariant $s_0$ supported away from the poles gives

$ integral \( - j'' - K_(frak(h)_r) j \) X_r s_0 thin upright(d) ell = lambda integral p s_0 thin upright(d) ell . $

Consequently, on the open generating arc,

#[#set math.equation(numbering: n => "(5.6)")
 $ - j'' - K_(frak(h)_r) j = lambda j / X_r^2 gt.eq 0 . $ <r:jacobi-cylinder>]

Attach the half-cylinder $tau gt.eq 0$ with length metric

#[#set math.equation(numbering: n => "(5.7)")
 $ upright(d) ell^2 + j \( ell \)^2 upright(d) tau^2 \, $ <r:cylinder-metric>]

and hold $Phi$ constant along each $tau$-line. Its Gauss curvature is $- j'' \/ j$. Equations (5.5) and (5.6) show that this curvature dominates the original full map energy on the seam, and hence dominates the tangential map energy of the extended map. Thus the second inequality in (5.5) holds on the cylinder too.

The seam is geodesic on both sides. Match normal collars so that metric coefficients and the map are continuous there. The resulting coefficients are Lipschitz and piecewise smooth. No negative curvature measure occurs at the seam: the distributional curvature includes the sum of the two geodesic-curvature boundary terms, which is zero. More explicitly, away from the axis choose a continuous piecewise smooth oriented orthonormal frame whose first vector is tangent to the seam. The pullback of its connection form to the seam vanishes on each side by geodesicity. Stokes’ formula therefore has no seam term. A conformal-coordinate frame differs from this frame by a continuous $W^(1 \, p)$ angle; its connection form changes by the differential of that angle, so the same distributional curvature identity holds in conformal coordinates.

The apparent degeneracy at a pole is only the usual axial degeneracy. If $s_B$ is ordinary meridional arclength on the sphere, then $upright(d) ell = X_r upright(d) s_B$, and the nonsingular meridional metric underlying (5.7) is

#[#set math.equation(numbering: n => "(5.8)")
 $ upright(d) s_B^2 + p \( s_B \)^2 upright(d) tau^2 . $ <r:regular-collar>]

Here $p$ is smooth and even at each pole, and $X_r$ is smooth and odd in the reflected polar coordinate, with unit first derivative. Thus the three-dimensional lift is regular at its axes. Extend the original orbit arc across each pole by reflection and match normal collars of the two nonsingular metrics. The matched metric remains continuous and piecewise smooth, preserves reflection parity, and satisfies the no-cone condition. This construction also supplies reflected Lipschitz charts where a seam meets the axis.

Projection $\( ell \, tau \) mapsto \( ell \, 0 \)$ decreases length in (5.7). Hence every excursion into an added cylinder can be replaced by an arc of its attaching boundary. Its projection is rectifiable also in the ordinary base metric, including at the poles, so the smoothing argument preceding (5.4) applies. After conformal filling, the end of the sphere separating the original obstacle becomes one distinguished puncture. The two sides between that puncture and infinity are exactly the original two axis sides. Every additional puncture connects adjacent intervals on a single side. It follows that all crossing paths in the completed meridian still have length at least $L$.

=== 5.3 Uniformizing the completed meridian <r:uniformization>

The conformal structure is that of the nonsingular meridional metric $h_r$, equivalently that of $frak(h)_r$ off the axis. Reflect it across all ordinary axis intervals. Each product end has an explicit conformal puncture coordinate. Indeed, with

$ t_B = integral^(s_B) frac(upright(d) s, p \( s \)) \, #h(2em) T_B = integral_(upright("pole"))^(upright("pole")) frac(upright(d) s, p \( s \)) in \( 0 \, oo \) \, $

Equation (5.8) is $p^2 \( upright(d) t_B^2 + upright(d) tau^2 \)$. Exponentiating a strip coordinate with angular variable $alpha = pi t_B \/ T_B$ fills the cylindrical end by a boundary point. In logarithmic coordinates the length factor is $\( T_B \/ pi \) X_r p$, independent of the longitudinal coordinate. Dividing it by $sin alpha$ gives a positive regular function through both endpoints. This verifies the finite-width cylindrical profiles required by Lemma 11.

At infinity, asymptotic flatness conformally compactifies the reflected end after isothermal rectification. The compactified reflected surface is a sphere with finitely many points removed before filling; its genus is zero by the capped meridional topology. Uniformization, chosen compatibly with reflection, gives an upper half-plane coordinate $Z$. The reflection becomes complex conjugation. Put the distinguished cylindrical puncture at $0$, infinity at infinity, and normalize the Euclidean scale at infinity to one. Other cylindrical ends are marked points on the real boundary.

We record the regularity and mass normalization of these coordinates. On compact sets, including reflected seams, the conformal coefficients are uniformly elliptic and Lipschitz. Local Beltrami estimates give isothermal changes in $W_(upright("loc"))^(2 \, p)$ for every finite $p$, hence $C_(upright("loc"))^(1 \, lambda)$ for every $lambda < 1$. Their first derivatives do not vanish. This regularity justifies the connection-form calculation above and gives the weak conformal curvature formula across a seam.

For any

#[#set math.equation(numbering: n => "(5.9)")
 $ 1 / 2 < q' < min \( q_d \, 1 \) \, $ <r:decay-exponent>]

the normalized end transition from the original Euclidean meridian has the expansion

#[#set math.equation(numbering: n => "(5.10)")
 $ Z = Z_(upright("Eucl")) + O_2 \( rho_oo^(1 - q') \) \, $ <r:af-isothermal>]

after a Euclidean motion of the original chart. To see the claimed rate, invert in the original end chart. The reflected Beltrami coefficient is $O \( \| Z \|^(q_d) \)$ at the inverted origin, and its derivative estimates make it $C^(0 \, q')$ after extension there by zero. Local rectification has a nonzero conformal first derivative and a $C^(1 \, q')$ expansion at that origin. Inverting back gives the asserted zeroth- and first-order asymptotics. On rescaled original end annuli, first-order elliptic Schauder estimates for the Beltrami equation give the required second derivatives of the error, decreasing $q'$ if needed. Reflection preserves the even longitudinal and odd transverse estimates. Lifting these changes as a longitudinal change and a polar radial change therefore gives admissible three-dimensional asymptotically Euclidean coordinates of order $q' > 1 \/ 2$.

These coordinates have the same ADM energy. Here is the flux argument at exactly the regularity in use. If $h = g_r - delta$ in the old end chart, scalar-curvature linearization gives

$ R_(g_r) = partial_i partial_j h_(i j) - Delta h_(i i) + O \( rho_oo^(- 2 q_d - 2) \) . $

The error is integrable, and finite mass flux together with $R_(g_r) gt.eq 0$ implies integrability of $R_(g_r)$ and of the Euclidean scalar linearization. Under a change by $O_2 \( rho_oo^(1 - q') \)$, the leading change in metric perturbation is a Euclidean symmetric gradient, plus the old perturbation in the old coordinates. The linear mass flux of a symmetric gradient is zero: extend its vector field smoothly inside a sphere and commute Euclidean derivatives in its scalar linearization. All quadratic flux errors are $O \( rho_oo^(1 - 2 q') \) = o \( 1 \)$. Surface and derivative changes in the remaining old perturbation have the same vanishing bound. Finally the integrable scalar linearization identifies its flux on the resulting asymptotically round deformed spheres with its flux on coordinate spheres. Thus $E_r$ is unchanged.

Ordinary axes have a simple linear zero of the length density; the cylindrical profiles were just checked; the outer density has the Euclidean quadratic growth. All assumptions of Lemma 11 therefore hold. Fix a model $R$ and apply that lemma with capacity $k = b \/ 2$ and with $0 < L' < L$. Write its coordinates as

$ Z = f \( e^(sigma + i theta.alt) \) \, #h(2em) sigma gt.eq 0 \, quad 0 lt.eq theta.alt lt.eq pi \, #h(2em) f \( xi \) = b / 2 xi + O \( 1 \) . $

The artificial inner cut avoids the additional punctures. In these coordinates put

#[#set math.equation(numbering: n => "(5.11)")
 $ frak(h)_r = e^(2 q) \( upright(d) sigma^2 + upright(d) theta.alt^2 \) . $ <r:log-density>]

The curvature inequality and the inner cut estimate become

#[#set math.equation(numbering: n => "(5.12)")
 $ - Delta q gt.eq \| partial Phi \|_G^2 \, #h(2em) q \( 0 \, theta.alt \) gt.eq log (L' / 2 sin theta.alt) . $ <r:strip-curvature-cut>]

The differential inequality is distributional across any retained seams. A cut analytic in uniformizing coordinates need not be smooth across such a seam in the original coordinates; the weak calculation below covers this case.

=== 5.4 Target convexity and all finite boundary terms <r:weak-comparison>

Use the model map $Phi_(*)$ of Proposition 10 on this same strip, and set

$ H_0 = q - q_(*) \, #h(2em) w = sinh sigma sin theta.alt . $

By Equation (3.20), the model satisfies $- Delta q_(*) = \| partial Phi_(*) \|_G^2$ and has weighted tension zero, $sum_i nabla_i^G \( w partial_i Phi_(*) \) = 0$. Because $\( bb(R)^4 \, G \)$ is complete, simply connected and nonpositively curved, there is a unique geodesic from $Phi_(*) \( x \)$ to $Phi \( x \)$, depending smoothly on its endpoints. Let $V \( x \)$ be its initial velocity and define

$ C_i = chevron.l V \, partial_i Phi_(*) chevron.r_G . $

For its pointwise geodesic interpolation $Phi_t$, nonpositive curvature and the Jacobi-field equation imply convexity of $\| partial Phi_t \|_G^2$. The tangent-line inequality at $t = 0$ gives

$ \| partial Phi \|_G^2 - \| partial Phi_(*) \|_G^2 gt.eq 2 sum_i chevron.l nabla_i^G V \, partial_i Phi_(*) chevron.r_G = 2 w^(- 1) "div" \( w C \) . $

The last equality is the weighted model equation. By local Sobolev approximation this remains valid weakly across the seams. Subtracting the two curvature equations yields

#[#set math.equation(numbering: n => "(5.13)")
 $ - Delta H_0 gt.eq 2 w^(- 1) "div" \( w C \) . $ <r:target-convexity>]

Since $Delta w = 0$, the vector field

#[#set math.equation(numbering: n => "(5.14)")
 $ cal(F) = - w nabla H_0 + H_0 nabla w - 2 w C #h(2em) upright("satisfies") #h(2em) "div" cal(F) gt.eq 0 . $ <r:comparison-flux>]

We now account for every finite boundary piece.

===== 5.4.1 Ordinary axes. <ordinary-axes.>

The no-cone condition in conformal meridional coordinates gives the trace identity

#[#set math.equation(numbering: n => "(5.15)")
 $ H_0 = 2 \( u - u_(*) \) . $ <r:axis-traces>]

Indeed the nonsingular conformal scale equals the transverse derivative of $X_r$ at the axis, and the same statement holds for the model. The common axis constants and polar vanishing orders of the potentials give, in target norm,

$ V = \( u - u_(*) \) partial_u + o \( 1 \) \, #h(2em) sin theta.alt thin partial_theta.alt Phi_(*) = cos theta.alt thin partial_u + o \( 1 \) . $

Thus the traces of $H_0 partial_nu w$ and $- 2 w C_nu$ cancel on both axes, with their respective outward normals. The remaining term $w partial_nu H_0$ has zero limiting integral.

The last assertion also holds at axis–seam intersections. Subtracting the common $log sin theta.alt$ from the logarithmic densities leaves continuous Hölder functions with locally $L^p$ gradients for finite $p > 1$. To include the seam–axis intersection explicitly, take a common signed transverse coordinate $y$ in the matched reflected collars. The ratio $X_r \/ y$ is positive, continuous and piecewise smooth, with bounded weak first derivatives: the values match on the seam, and ordinary polar regularity and the no-cone condition give the same continuous positive trace at the corner. Write $theta.alt_(upright("ax"))$ for $theta.alt$ at the lower axis and for $pi - theta.alt$ at the upper axis, extended by signed reflection. In isothermal coordinates,

$ X_r / theta.alt_(upright("ax")) = X_r / y y / theta.alt_(upright("ax")) . $

The $W^(2 \, p)$ reflected coordinate change and the one-dimensional Hardy estimate give $y \/ theta.alt_(upright("ax")) in W^(1 \, p)$; the ratio is bounded away from zero. Thus its logarithm and $log \( X_r \/ theta.alt_(upright("ax")) \)$ are in $W^(1 \, p)$. The nonsingular conformal factor is also in $W^(1 \, p)$, by pullback of the Lipschitz metric under the same coordinate change. This proves the asserted regularity of the renormalized logarithmic density. In an axis layer of width $delta$, $w lt.eq C delta$. Paired with a cutoff derivative of size $C \/ delta$, the integral involving $w nabla H_0$ is bounded by $C integral_(upright("layer")) \| nabla H_0 \| = o \( 1 \)$. For the two other terms, continuity of their renormalized traces and (5.15) give precisely the cancellation above. Equivalently one may choose offset axes along an exhaustion with the same vanishing integrated error.

===== 5.4.2 Additional punctures. <additional-punctures.>

Every puncture still visible on a side of the strip has zero potential jump. Let $d$ denote its Euclidean distance in local flat coordinates. The product cylinder and the conformal puncture coordinate give

#[#set math.equation(numbering: n => "(5.16)")
 $ \| H_0 \| lt.eq C \( 1 + \| log d \| \) \, #h(2em) \| partial H_0 \| lt.eq C \/ d \, #h(2em) w lt.eq C d . $ <r:puncture-estimates>]

There is also the uniform target-distance bound $\| V \|_G lt.eq C \( 1 + \| log d \| \)$. To check it without losing control near the local polar directions, let $beta$ be the local puncture angle. The cylindrical radius $X_r$ is comparable to $sin beta$, while $X_(*)$ is comparable to $d sin beta$. At height $X_r$, first match the two horizontal potential coordinates and then the central coordinate. For clarity put $tilde(z) = z + psi_(upright("ax")) chi - chi_(upright("ax")) psi - z_(upright("ax"))$ and denote subtraction of model values by $delta$. The central Heisenberg displacement is exactly

#[#set math.equation(numbering: n => "(5.17)")
 $ delta z + psi_(*) delta chi - chi_(*) delta psi = delta tilde(z) + \( psi_(*) - psi_(upright("ax")) \) delta chi - \( chi_(*) - chi_(upright("ax")) \) delta psi . $ <r:central-displacement>]

The cylinder map is fixed on one compact smooth sphere. Its horizontal coordinates differ from the common axis values by $O \( sin^2 beta \)$, and its corrected central coordinate is $O \( sin^4 beta \)$ uniformly. The model has the corresponding orders in $d sin beta$. Equation (5.17) is therefore $O \( sin^4 beta \)$. Division by $X_r$ for the horizontal coordinates and by $X_r^2$ for the central coordinate gives bounded displacements. This makes the target path a bounded-cost path uniformly in $beta$. Then change the height; that costs at most $C + \| log d \|$. This proves the bound on $V$. The model derivative satisfies $w \| partial Phi_(*) \|_G lt.eq C$ near the puncture, so

$ w \| C \| lt.eq C \( 1 + \| log d \| \) . $

On a puncture semicircle of radius $d$, the three terms in (5.14) consequently have integrated magnitudes $O \( d \)$, $O \( d \( 1 + \| log d \| \) \)$, and $O \( d \( 1 + \| log d \| \) \)$, respectively. All tend to zero. This is where the vanishing jumps of the additional components are essential.

===== 5.4.3 The artificial inner cut and its corners. <the-artificial-inner-cut-and-its-corners.>

On $sigma = 0$ the outward normal is $- partial_sigma$, and $w = 0$, $partial_nu w = - sin theta.alt$. The model normal derivative $partial_sigma Phi_(*)$ is bounded in target norm on finite radial ranges, including the corners after the polar normalization. The only remaining inner flux is therefore

$ - integral_0^pi H_0 \( 0 \, theta.alt \) sin theta.alt thin upright(d) theta.alt . $

For a cut crossing seams, use the local $L^p$ gradient bounds and the same width-$delta$ argument as for the axes. Products of the inner-edge and axis cutoffs handle the corners, since $w$ vanishes on both edges. This uses only the trace of the cut density; there is no normal-derivative condition on the artificial cut.

For precision, first perform this cutoff integration in a finite strip $0 < sigma < T$, with small disks about its finitely many marked side punctures removed. Send the nonpuncture edge-layer widths to zero, using the preceding estimates. Then shrink the puncture disks. These operations leave just the outer flux at $sigma = T$ and the displayed inner flux. With

$ chevron.l D chevron.r = 1 / 2 integral_0^pi D sin theta.alt thin upright(d) theta.alt \, $

we obtain, for large regular $T$ and then in the limit,

#[#set math.equation(numbering: n => "(5.18)")
 $ lim_(T arrow.r oo) ⟨- sinh T thin partial_sigma H_0 + cosh T thin H_0 - 2 sinh T thin C_sigma⟩ gt.eq chevron.l H_0 \( 0 \, dot.op \) chevron.r . $ <r:integrated-comparison>]

The next calculation proves existence and identifies the value of the outer limit.

=== 5.5 ADM flux and completion of the comparison <r:adm>

Set $rho_0 = \( b \/ 2 \) e^sigma$. Write the comparison metric near infinity as

$ h_r = e^(2 P_1) \( upright(d) rho_0^2 + rho_0^2 upright(d) theta.alt^2 \) \, #h(2em) X_r = rho_0 sin theta.alt thin e^(P_2) . $

Both $P_1$ and $P_2$ are $O_1 \( rho_0^(- q') \)$ in the end sense, with the reflected polar estimates. A direct ADM calculation gives

#[#set math.equation(numbering: n => "(5.19)")
 $ E_r = lim_(rho_0 arrow.r oo) rho_0 / 2 ⟨- partial_sigma \( P_1 + P_2 \) + P_1 - P_2⟩ . $ <r:radial-adm>]

For clarity, in the Euclidean orthonormal spherical frame the metric perturbation has entries $A \, A \, B$, with $A = e^(2 P_1) - 1$ and $B = e^(2 P_2) - 1$. The radial ADM integrand is exactly

$ - partial_(rho_0) \( A + B \) + \( A - B \) \/ rho_0 . $

Substitution of $A = 2 P_1 + O \( P_1^2 \)$ and $B = 2 P_2 + O \( P_2^2 \)$, followed by integration over a sphere, gives (5.19). The discarded flux is $O \( rho_0^(1 - 2 q') \) = o \( 1 \)$.

Denote subtraction of model values by $delta$. Equation (5.11) gives

#[#set math.equation(numbering: n => "(5.20)")
 $ H_0 = delta \( P_1 + P_2 \) \, #h(2em) u - u_(*) = delta P_2 . $ <r:mass-differences>]

We also claim

#[#set math.equation(numbering: n => "(5.21)")
 $ C_sigma = u - u_(*) + o \( rho_0^(- 1) \) $ <r:target-log-end>]

uniformly in the polar angle. To verify this estimate, normalize the model point in the target by its Heisenberg translation and dilation, both isometries of $G$. In this fixed smooth target chart, the log-height displacement is $O \( rho_0^(- q') \)$, the normalized horizontal potential displacement is $O \( rho_0^(- 1) \)$, and the normalized central displacement is $O \( rho_0^(- 2) \)$. The end estimates and common polar constants imply these bounds also when $sin theta.alt$ is small. The horizontal differences vanish to second polar order, and Equations (3.7) and (5.17) give the fourth-order bound for the translated central difference, uniformly on rescaled end annuli. These orders cancel the inverse height factors. The geodesic logarithm differs from these normalized coordinate displacements by $O \( rho_0^(- 2 q') + rho_0^(- 2) \)$ in its radial component. Finally,

$ partial_sigma Phi_(*) = partial_u + O \( rho_0^(- 1) \) $

in the orthonormal target frame. Pairing with $V$ proves (5.21), since $2 q' > 1$.

Since $sinh sigma$ and $cosh sigma$ equal $rho_0 \/ b + O \( rho_0^(- 1) \)$, Equations (5.20) and (5.21) turn the left side of (5.18) into

$ 1 / b lim_(rho_0 arrow.r oo) rho_0 ⟨- partial_sigma delta \( P_1 + P_2 \) + delta P_1 - delta P_2⟩ = frac(2 \( E_r - M \), b) . $

At the inner edge the model identity is $q_(*) \( 0 \, theta.alt \) = log \( R^2 sin theta.alt \)$. By (5.12),

$ H_0 \( 0 \, theta.alt \) gt.eq log frac(L', 2 R^2) . $

Thus $E_r gt.eq M + \( b \/ 2 \) log \( L' \/ \( 2 R^2 \) \)$. Keeping the model $R$ fixed and letting $L' arrow.t L$ proves Proposition 15.

#thm([Corollary 5.2.])[
  (Optimization on the physical branch).  #emph[Under the hypotheses of Proposition 15, if $L \/ 2 gt.eq sqrt(Q^4 + 4 J^2)$, then 
#[#set math.equation(numbering: n => "(5.22)")
 $ E_r gt.eq F_(*) #h(-1em) (sqrt(L \/ 2)) . $ <r:optimized-bound>]

 In particular, with $L = A_0 \/ \( 2 pi \)$ this becomes 
$ E_r gt.eq sqrt(frac(A_0, 16 pi) + Q^2 / 2 + frac(pi \( Q^4 + 4 J^2 \), A_0)) . $

]
] <r:optimized>

#proof[
  Put $C = Q^4 + 4 J^2$. The model parameter relations give
  $ M = 1 / 2 sqrt(R^2 + 2 Q^2 + C \/ R^2) \, #h(2em) b = frac(R^4 - C, 4 M R^2) \, #h(2em) M' \( R \) = b / R . $
  Consequently
  #[#set math.equation(numbering: n => "(5.23)")
   $ frac(upright(d), upright(d) R) (M + b / 2 log frac(L, 2 R^2)) = frac(b' \( R \), 2) log frac(L, 2 R^2) . $ <r:optimization-derivative>]
  Here $b' \( R \) > 0$ by Lemma 9. If $L \/ 2 > sqrt(C)$, Equation (5.23) shows that the comparison expression increases up to $R^2 = L \/ 2$ and decreases afterward. At that point its logarithmic term vanishes, proving (5.22). If $L \/ 2 = sqrt(C)$, use models with $R^2 arrow.b L \/ 2$; then $b arrow.b 0$ and the logarithmic correction tends to zero. The limiting argument is numerical and uses only strictly subextremal comparison models. ◻
]

== 6 Reduction through sourced constraints <d:reduction>

In this section, $g \, k$ denote the #emph[polarized] data of Proposition 6, and $E_g$ is their ADM energy. Write $cal(D)_X = \( D_1 \, D_2 \, D_3 \)$ for the three covector rows of the potential expression of the axial construction; in particular, the third row contains the Pfaff form $upright(d) z + psi upright(d) chi - chi upright(d) psi$. The argument also applies to the following larger class of data, which will be needed for the equality variations. The proposition quantifies over all admissible potential maps with the specified axis constants, including their compactly supported variations. Within each individual application the chosen potentials remain fixed throughout the metric preparation and deformation. The constraint densities are always computed from the current $g \, k$.

#thm([Proposition 6.1.])[
  (Comparison for sourced data).  #emph[Suppose a smooth polarized rotation exterior has one asymptotically flat end, a compact weakly future trapped boundary, and the topology and potential regularity of the axial construction. Assume $g - delta = O_2 \( r^(- 1) \)$, $k = O_1 \( r^(- 3) \)$, $\| s \| + \| cal(D)_X \|_g = O \( r^(- 2) \)$, $R_g = O \( r^(- 3 - delta) \)$ for some $0 < delta < 1$, and finite ADM energy. The potentials have the axis and end regularity in Lemma 5. On each signed axis tube, $s_1 \, s_2$ are smooth odd functions of order $y$, and $s_3$ is smooth even of order $y^2$, with smooth longitudinal derivatives. For each row, the functions $\| D_i \|_g^2 \, s_i^2$ and the covector $s_i D_i$ extend smoothly to the three-dimensional exterior through the axis. The source expressions below use these extensions at axis points; neither an individual normalized row nor its ordinary norm is required to extend smoothly. Suppose, at every point and for every $w in T Omega$ with $\| w \|_g lt.eq 1$, that 
#[#set math.equation(numbering: n => "(6.1)")
 $ 8 pi #scale(x: 120%, y: 120%)[\(] mu + J_(upright("con")) \( w \) #scale(x: 120%, y: 120%)[\)] gt.eq \| cal(D)_X \|_g^2 + \| s \|^2 + 2 s dot.op cal(D)_X \( w \) . $ <d:sourced>]

 Let $L > 0$ be a lower bound for all crossing lengths in the meridional area metric of $g$. For each admissible subextremal model radius $R$, with $F_(*) \( R \)$ and $b = b \( R \) > 0$ as in Lemma 9, 
#[#set math.equation(numbering: n => "(6.2)")
 $ E_g gt.eq F_(*) \( R \) + b / 2 log frac(L, 2 R^2) . $ <d:sourced-comparison>]

]
] <d:generalized>

In particular, $J_(upright("con"))$ is retained in Equation (6.1); the local momentum density need not vanish. The three source rows are estimated separately. The neutral geometric deformation needed to prove the proposition is the following theorem. Its proof occupies Section 7, including the existence argument and end-flux estimate.

#thm([Theorem 6.2.])[
  (Neutral deformation with a prescribed loss).  #emph[Let $\( Omega \, g \, k \)$ be a smooth polarized one-ended exterior, complete with its compact nonempty boundary included. Assume the boundary is strictly future trapped, $k$ has compact support, $g - delta = O_j \( r^(- 1) \)$ for every finite $j$, $R_g = O \( r^(- 3 - delta) \)$ for some $0 < delta < 1$, and $g$ has finite ADM energy. Let $frak(m) > 0$ be a smooth invariant function such that 
$ frak(m) lt.eq 8 pi \( mu - \| J_(upright("con")) \|_g \) \, #h(2em) inf_C frak(m) > 0 quad upright("for every compact ") C subset overline(Omega) \, #h(2em) frak(m) gt.eq c r^(- 3 - delta) quad upright("on the end") $

 for some $c > 0$. There is an invariant reduced exterior $Omega_(upright("red")) subset Omega$, obtained by removing full trapped regions and retaining the component toward infinity, with smooth nonempty compact boundary, for which the following holds. For every sufficiently small fixed $epsilon > 0$, and all sufficiently large integers $n$ along a sequence, there are smooth invariant functions $f_n \, t_n$ and positive smooth profiles $l_n \( t \)$ such that 
#[#set math.equation(numbering: n => "(6.3)")
 $ macron(g)_n = g + l_n \( t_n \)^2 upright(d) f_n^2 \, #h(2em) hat(g)_n = e^(4 t_n) macron(g)_n \, #h(2em) w_n = frac(l_n \( t_n \) nabla f_n, sqrt(1 + l_n \( t_n \)^2 \| upright(d) f_n \|_g^2)) \, #h(2em) t_n gt.eq - epsilon \,\
1 / 2 e^(4 t_n) R_(hat(g)_n) gt.eq 8 pi #scale(x: 120%, y: 120%)[\(] mu + J_(upright("con")) \( w_n \) #scale(x: 120%, y: 120%)[\)] - frak(m) / 2 . $ <d:deformed-metrics>]

 The inner boundary has strictly negative mean curvature in $hat(g)_n$ for its normal toward infinity. The metric $hat(g)_n$ is complete with boundary, is asymptotically flat of order one with at least two controlled derivatives, and has finite energy satisfying 
#[#set math.equation(numbering: n => "(6.4)")
 $ E_(hat(g)_n) lt.eq E_g + o_n \( 1 \) . $ <d:deformation-energy>]

 Here the reduced domain and its collars are fixed before $epsilon$ and $n$. For each fixed $n$ the functions are obtained by exhaustion of finite outer truncations; the error in Equation (6.4) tends to zero as $n arrow.r oo$ after that exhaustion, with the prepared data and $epsilon$ fixed.]
] <d:deformation>

#proof[
  We first construct a strictifying direction, including the required elliptic solve. There is a smooth positive invariant function $v$ with
  #[#set math.equation(numbering: n => "(6.5)")
   $ nu v = - 1 quad upright("on ") partial Omega \, #h(2em) - Delta_g v - \| k \|_g \| upright(d) v \|_g gt.eq c chevron.l r chevron.r^(- 3 - delta) \, #h(2em) v = O_2 \( r^(- 1) \) \, $ <d:strictifier>]
  whose Laplacian is integrable and whose end flux has a finite limit. Here $nu$ points into the exterior and $chevron.l r chevron.r$ is a smooth positive extension of $r$ over the compact part. Choose a smooth invariant majorant $d_0 gt.eq \| k \|_g$ with $d_0 = O \( r^(- 2) \)$, and positive smooth weights $zeta_0 \, w_0$ of orders $- 2 \, - 3 - delta$, respectively, with the corresponding symbol bounds. Solve
  #[#set math.equation(numbering: n => "(6.6)")
   $ - Delta_g v = d_0 sqrt(\| upright(d) v \|_g^2 + zeta_0^2) + w_0 \, #h(2em) nu v = - 1 \, #h(2em) v \|_(S_R) = 0 $ <d:strictifier-equation>]
  on a finite truncation. Continuation from $d_0 = 0$ has an invertible linearization: it is a uniformly elliptic operator with bounded drift, homogeneous Neumann data on the inner boundary and homogeneous Dirichlet data on $S_R$. The maximum principle gives uniqueness and nonnegativity. On each fixed truncation, $W^(2 \, p)$ estimates and interpolation bound the solution by its supremum. If these suprema were unbounded during continuation, division by them and compactness would give a nonzero homogeneous bounded-drift solution with homogeneous mixed data, contradicting the maximum principle. This proves existence on each truncation.
  The bounds persist under exhaustion. On a fixed far region, a sufficiently large multiple of $r^(- 1) \( 1 - C r^(- delta) \)$, multiplied by one plus the compact-core supremum, is an upper barrier: the favorable term in $Delta \( r^(- 1 - delta) \)$ dominates the metric and drift errors of order $r^(- 4)$. If the core suprema along an exhaustion were unbounded, normalize once more. The barrier makes the limit tend to zero at infinity, while its value is one somewhere on the core. Hence it attains a positive global maximum. It satisfies a homogeneous bounded-drift equation with homogeneous inner Neumann data, so the strong maximum principle and boundary point lemma exclude this. Exhaustion therefore gives a positive solution of Equation (6.6) with the outer condition replaced by decay to zero.
  For completeness, rescale on an end annulus by $x mapsto R x$ and $v mapsto R v \( R x \)$. The value bound just proved gives uniform $W^(2 \, p)$ bounds on smaller annuli for $p > 3$: the rescaled equation has bounded coefficients and at most linear growth in the gradient. The resulting $C^(1 \, alpha)$ control makes the right side uniformly Hölder, so Schauder estimates give the stated $O_2 \( r^(- 1) \)$ bound. They also give higher symbol estimates through the orders allowed by the coefficients. The equation now gives an integrable Laplacian; the Euclidean and metric Laplacians differ by integrable errors. The divergence theorem yields a finite end flux. These facts prove Equation (6.5).
  For a small constant $delta_(upright(p)) > 0$, make the change
  #[#set math.equation(numbering: n => "(6.7)")
   $ g mapsto e^(4 delta_(upright(p)) v) g \, #h(2em) k mapsto e^(2 delta_(upright(p)) v) k \, #h(2em) s_i mapsto e^(- 2 \( 1 + h_i \) delta_(upright(p)) v) s_i \, #h(2em) \( h_1 \, h_2 \, h_3 \) = \( 1 \, 1 \, 2 \) \, $ <d:strictification>]
  and keep the potentials fixed. Identify the old and new unit balls by $w_(upright("new")) = e^(- 2 delta_(upright(p)) v) w_(upright("old"))$. After multiplying the new constraint inequality by $e^(4 delta_(upright(p)) v)$, its $i$th source row is its old value times $e^(- 4 h_i delta_(upright(p)) v) lt.eq 1$. Each row is nonnegative on the unit ball, since
  $ \| D_i \|_g^2 + s_i^2 + 2 s_i D_i \( w \) = \| D_i \|_g^2 - D_i \( w \)^2 + \( s_i + D_i \( w \) \)^2 gt.eq 0 . $
  This calculation is made off the axis; its left side is a smooth function on the unit-ball bundle and the inequality extends by continuity. Smooth invariant conformal factors preserve the stated polar orders and all these quadratic source combinations. The conformal scalar-curvature and momentum-divergence formulas add to the left side the quantity
  $ - 4 delta_(upright(p)) Delta v - 4 delta_(upright(p))^2 \| upright(d) v \|^2 + 4 delta_(upright(p)) k \( nabla v \, w_(upright("old")) \) . $
  Equation (6.5) makes this positive, uniformly on compact sets and at least $c_(delta_(upright(p))) r^(- 3 - delta)$ on the end, after decreasing $delta_(upright(p))$ if necessary. Inside its positive scaling factor the boundary expansion decreases by $4 delta_(upright(p))$. Thus the new boundary is strictly future trapped and Equation (6.1) has a positive residual. Crossing lengths vary by a factor tending to one, scalar-curvature decay is preserved, and the energy tends to $E_g$ as $delta_(upright(p)) arrow.b 0$ by the finite flux of $v$.
  Keep $delta_(upright(p)) > 0$ fixed. Cutting off $k$ sufficiently far out changes the constraints by $O \( r^(- 4) \)$, which is smaller than the strict residual because $delta < 1$. If the metric does not yet have all end symbol derivatives, smooth only its far end by averaging normalized pullbacks under small constant rotations and dilations. Use smooth kernels commuting with the axial action and the polarization reflection; for example, the rotation kernel may be conjugation invariant. This is smoothing in angle and logarithmic radius and gives symbol bounds of every order. The Euclidean linear part of scalar curvature averages with positive dilation factors; the nonlinear errors are $O \( r^(- 4) \)$ using the original two derivative bounds. Hence its positive $r^(- 3 - delta)$ lower bound and its $O \( r^(- 3 - delta) \)$ upper order persist. The source rows are $O \( r^(- 4) \)$, so the full residual persists with a smaller constant. Patch to the original metric on a fixed distant annulus, choosing the averaging aperture small enough that the compact patch errors fit within the residual. Uniform equivalence tends to identity as the aperture decreases. Averaging the linear sphere flux, using rotation invariance and the dilation scaling, also gives convergence of the ADM energies. All preparations preserve polarization.
  Choose a smooth positive $frak(m)$ no larger than this sourced residual for any $\| w \|_g lt.eq 1$, with the compact and end lower bounds in Theorem 18. Indeed, the residual has the form $a \( x \) + b_x \( w \)$ with $a$ a smooth invariant scalar and $b$ a smooth invariant covector. Its minimum on the unit ball is the continuous positive function $a - \| b \|_g$, bounded below on compact sets and by $c r^(- 3 - delta)$ on the end. A smooth positive minorant is obtained by a partition of unity on the compact part, with a sufficiently small multiple of $r^(- 3 - delta)$ on the end, followed by averaging over the circle. No derivative of a row norm is used. The row nonnegativity implies also $frak(m) lt.eq 8 pi \( mu - \| J_(upright("con")) \|_g \)$. The theorem therefore applies to the prepared data. Set
  $ g_r = e^(4 epsilon) hat(g)_n \, #h(2em) X_r = e^(2 \( t_n + epsilon \)) X gt.eq X \, $
  and renormalize the asymptotic coordinates by the constant scale. The identity $macron(g)_n^(- 1) = g^(- 1) - w_n ⊗ w_n$ gives, row by row,
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| D_i \|_g^2 + s_i^2 + 2 s_i D_i \( w_n \) = \| D_i \|_(macron(g)_n)^2 + \( s_i + D_i \( w_n \) \)^2 . $ <d:row-completion>]
  Here the calculation again holds off the axis. Since $f_n$ is a smooth invariant function, $macron(g)_n$ has the same smooth polar parities as $g$. The contractions $D_1 \( w_n \) \, D_2 \( w_n \)$ are smooth odd of order $y$, and $D_3 \( w_n \)$ is smooth even of order $y^2$. Thus the completed squares and the new squared row norms extend smoothly across the axis. In particular the resulting scalar-curvature inequality extends there by continuity. Combining the sourced residual with Equation (6.3) leaves the strictly positive quantity $frak(m) \/ 2$. Each row of $cal(D)_(X_r)$ has in addition the factor $e^(- 2 h_i \( t_n + epsilon \)) lt.eq 1$. Consequently
  $ 1 / 2 R_(g_r) > \| cal(D)_(X_r) \|_(g_r)^2 . $
  Writing the polarized metric as $g = h + X^2 upright(d) phi.alt^2$, its meridional area metric satisfies
  #[#set math.equation(numbering: n => "(6.9)")
   $ X_r^2 h_r = e^(8 \( t_n + epsilon \)) X^2 \( h + l_n^2 upright(d) f_n^2 \) gt.eq X^2 h . $ <d:length-monotonicity>]
  Thus every new crossing arc has the old lower length bound, and the potential and axis regularity required by Proposition 15 are retained. The end energy obeys $E_(g_r) lt.eq e^(2 epsilon) \( E_g + o_n \( 1 \) \)$. Apply that proposition to each fixed admissible $R$, first exhaust the truncation at fixed $n$, then let $n arrow.r oo$, then $epsilon arrow.b 0$. Finally undo the far-end smoothing and cutoff and let $delta_(upright(p)) arrow.b 0$. The energies and crossing lower bounds converge as just proved, giving Equation (6.2). ◻
]

#thm([Corollary 6.3.])[
  (Numerical inequality).  #emph[For the data of Theorem 2, 
$ m^2 gt.eq frac(A, 16 pi) + Q^2 / 2 + frac(pi \( Q^4 + 4 J^2 \), A) . $

 More generally, in the sourced class of Proposition 17, if $L \/ 2 > sqrt(Q^4 + 4 J^2)$, then $E_g gt.eq F_(*) \( sqrt(L \/ 2) \)$.]
] <d:numerical>

#proof[
  For the original data, Equation (3.9) supplies Equation (6.1). Its scalar equation, with the axial connection-curvature contribution retained in $s$, gives $R_g = O \( r^(- 4) \)$ from $\| cal(D)_X \| + \| s \| = O \( r^(- 2) \)$ and $k = O_1 \( r^(- 3) \)$. This meets the required scalar decay for every $0 < delta < 1$. The available two metric derivatives and one tensor derivative suffice even if forming polar components loses a derivative. The crossing-area comparison and the preservation of invariant areas under polarization give $L = A \/ \( 2 pi \)$, while $E_g = m$. If $A \/ \( 4 pi \) > sqrt(Q^4 + 4 J^2)$, choose $R^2 = L \/ 2$ in Equation (6.2); its logarithmic term vanishes. At the closed endpoint use subextremal radii $R^2 arrow.b L \/ 2$; then $b \( R \) arrow.r 0$ and the same conclusion follows by continuity. The formula for $F_(*)$ in Lemma 9 and $m > 0$ give the displayed inequality after squaring. The same choice of $R$ proves the last assertion for sourced data. No classification of equality at the closed endpoint is used here. ◻
]

== 7 Proof of the neutral deformation theorem <d:proof>

We now prove Theorem 18. Throughout this section the data have already been strictly prepared as in that theorem, and we write $K = k$ and $J_0 = J_(upright("con"))$. Unless indicated otherwise, all derivatives and contractions use $g$. Several letters are local to this proof: $h$ will be a rescaled graph height, $L$ a profile, $a$ a gradient length, and $chi$ an ellipticity coefficient. They are distinct from the meridional metric, crossing lower bound, model rotation parameter and electromagnetic potential used earlier.

===== 7.1 Order of choices and limits. <order-of-choices-and-limits.>

+ Fix the prepared data, then the reduced domain, collars and cutoff shapes.
+ Fix a sufficiently small $epsilon > 0$, choose a sufficiently large $n$, and form its profiles.
+ At this fixed $n$, solve on sufficiently large truncations $Omega_R$ and let $R arrow.r oo$.
+ Pass to $n arrow.r oo$ in the final energy estimate; no limit of the deformation metrics is required. Section 6 subsequently sends $epsilon arrow.b 0$ and removes the preparation.

Here $R$ is the outer truncation radius, distinct from the model radius in the comparison. Polynomial bounds $Pi_n$ are kept separate from constants that may depend arbitrarily on fixed $\( n \, epsilon \)$.

=== 7.1 Full trapped regions and stable collars <d:domains>

We use the following precise form of the barrier and trapped-region theorems #cite(label("AnderssonMetzger2009")) Theorems 3.1, 4.1 and 7.3. In a connected compact smooth three-dimensional data region, let the expansion for a prescribed smooth tensor $Q$ be $H + "tr"_Sigma Q$, with the normal out of a bounding inner region. A nonempty strictly positive outer barrier, together with a strictly negative required inner barrier, gives a smooth stable enclosing marginally outer trapped surface. The designated outer barrier may be disconnected. One may also take no required inner barrier: in that case the trapped region is allowed to be empty. If nonempty, the full trapped region, defined as the union of the inner sides of all smooth bounding surfaces with nonpositive expansion and containing any required inner barrier, has a smooth stable outer frontier; its closure is itself a maximal such region. Bounded complementary components meeting no designated outer face may be filled. For a disconnected region apply the result separately to each component meeting a designated outer face: the strict existence statement requires a nonempty inner barrier in that component, whereas the trapped-region statement allows an empty inner barrier and an empty trapped region. No energy condition on $Q$ is required. All applications below are on compact truncations with these barrier signs; they require no extension of the original constraints across the inner boundary.

For $max_(partial Omega) theta_(+) < c < 0$, let $cal(B)_c$ be the closed full black region for $H + "tr"_Sigma K lt.eq c$, with the original boundary prescribed as an inner barrier. This is the preceding construction for $Q = K - \( c \/ 2 \) g$, because a two-dimensional tangential trace of $\( c \/ 2 \) g$ is $c$. These regions are nonempty and contain an inner collar. They lie in a fixed compact radial range: at the largest radius of a bounding surface, comparison with a large coordinate sphere, on which $K = 0$ and $H > 0$, rules out a negative expansion. This also makes the full regions independent of a sufficiently distant truncation.

Choose a threshold $c_b < 0$. In the exterior of its full black region, form the closed full white regions $cal(W)_c$ for $H - "tr"_Sigma K lt.eq c < 0$. There is no required inner face, and every black boundary is a designated outer face. Its reversed normal has white expansion $- c_b > 0$ before the shift. Together with the distant sphere, these are strict outer barriers for the tensor $- K - \( c \/ 2 \) g$. The white region may be empty; otherwise its smooth stable frontier is disjoint from the black region. The black construction takes place in the connected exterior truncation with both barriers. After bounded pockets are filled, the white construction takes place in its connected complement toward infinity, with all black faces and the distant sphere designated as outer faces and with no required inner face. Thus it uses the trapped-region statement, not the strict existence statement with a missing inner barrier.

Choose $c_b$, and then $c_w$, arbitrarily close to zero at points of Hausdorff right continuity of their respective full families. To justify the choice, take the distance to each closed region, capped by a number larger than the diameter of the common compact core. At each point of a fixed countable dense set this is a monotone function of the threshold and has at most countably many discontinuities. Away from the union of these exceptional sets, the common Lipschitz bound upgrades pointwise right continuity to uniform right continuity. This is equivalent to Hausdorff right continuity for the nonempty regions. For the empty region it means that regions at sufficiently close larger thresholds remain empty. Filling bounded pockets makes the black complement connected toward infinity for the subsequent white construction. Invariance follows because the families are full maximal regions, so the circle action maps each family to itself.

Let $Omega_(upright("red"))$ be the closure of the component toward infinity outside both selected regions. Its smooth compact boundary $B = B_b union B_w$ consists of whole frontier components and is nonempty, since it separates the entire original obstacle from infinity. A color may be absent. With $nu$ pointing into $Omega_(upright("red"))$ and $P_B = "tr"_B K$, the boundary identities are

#[#set math.equation(numbering: n => "(7.1)")
 $ H + P_B = c_b quad \( B_b \) \, #h(2em) H - P_B = c_w quad \( B_w \) . $ <d:threshold-boundary>]

Each face has a smooth outward collar of leaves, with parameter $s gt.eq 0$, $\| nabla s \| > 0$, whose expansion in its own color is at least the corresponding threshold. Here is the treatment of possible zero stability eigenvalues. For the shifted tensor, the principal stability eigenvalue is nonnegative. If positive, its positive eigenfunction gives an outward graph speed with positive expansion derivative. If it is zero, the augmented linear map

$ \( v \, d_0 \) mapsto (L_(upright("MOTS")) v - d_0 \, med integral_B v thin upright(d) A) $

is an isomorphism on each component. Indeed the positive principal eigenfunction spans the kernel, the positive adjoint eigenfunction spans the cokernel, the constant $d_0$ removes the latter, and the integral condition removes the former. The implicit function theorem therefore gives constant-expansion graphs at prescribed small positive $integral_B v$. Their initial speed is positive. Their expansion cannot be at most the threshold, since that would enlarge the full maximal region. These graphs give the desired leaves. Invariant eigenfunctions and uniqueness in the augmented problem make the collars invariant. Shorten them so that all collars are disjoint, and let $nu_s = nabla s \/ \| nabla s \|$ be their outward normals.

Choose a smooth compactly supported invariant offset $C \( x \)$, constants $C_w lt.eq C lt.eq C_b$, and a smooth invariant weight $rho > 0$, equal on the far end to a sufficiently small multiple of $r^(- 4)$, such that

#[#set math.equation(numbering: n => "(7.2)")
 $ b_(-) = c_b - C_b < 0 \, #h(2em) b_(+) = - c_w - C_w > 0 \,\
\| \( h + C \) "tr" K \| + \| nabla C \| + rho lt.eq frak(m) / 2 quad upright("whenever ") b_(-) lt.eq h lt.eq b_(+) . $ <d:assigned-heights>]

Near a black face require $C = C_b - k_B s$, and near a white face require $C = C_w + k_B s$, with $k_B > 0$. These choices are possible in the following order. First take the thresholds sufficiently close to zero, using compact support of $K$ and the positive compact margin. After fixing the collars, take sufficiently small opposite offsets, with the stated linear profiles cut off to zero. Finally take $rho$ small on the compact part and use the end lower bound for $frak(m)$ to choose its $r^(- 4)$ tail. For a missing color its constant is only an upper or lower bound.

#thm([Lemma 7.1.])[
  (Enclosure from exterior supports).  #emph[Work in a connected compact barrier truncation as above. Let $D$ be a nonempty compact closed set, disjoint from the designated outer faces and containing a collar of any required inner face. Suppose that every smooth exterior support at an interior frontier point of $D$ has expansion at most $c$ for a smooth tensor $Q$. An exterior support means a smooth regular level through the point that contains $D$ locally on its inner side. Then, for every $c' > c$ for which the outer barriers remain strict, $D$ is contained in a smooth bounding region with outward expansion at most $c'$.]
] <d:weak-support>

#proof[
  First show that every exterior support of a small parallel set $D_z = { x : "dist" \( x \, D \) lt.eq z }$ has expansion at most $c + C z$, with $C$ depending on the compact geometry and $Q$, but not on its curvature. Let such a support touch at $x$, and take a shortest segment of length $z$ from $y in D$ to $x$. Choose a local unit vector field $V$ agreeing at $y$ with its initial tangent, and set $F \( y' \) = exp_(y') \( z V \( y' \) \)$. Prescribe the first derivative of $V$ so that $upright(d) F_y$ is exactly parallel transport along the segment. For each initial vector this is the Jacobi boundary-value problem with that vector and its parallel translate as the two endpoint values. Rescaling the Jacobi equation shows that the required initial derivative is $O \( z \)$ times the initial norm. Its component along the segment is zero, since the parallel component of the Jacobi field is constant. Thus it is a permissible first jet of a unit field. More explicitly, if $B_i = nabla_i V$, the unit-length constraint on its symmetric second jet is $chevron.l "sym" nabla_(i j)^2 V \, V chevron.r = - chevron.l B_i \, B_j chevron.r$; its tangential symmetric part can be chosen bounded, and the antisymmetric part is fixed by the bounded curvature commutator. In a smooth orthonormal frame, normalizing a vector-valued polynomial with the prescribed value and first jet realizes precisely this compatibility. Thus $V$ has bounded second derivatives independently of the support. Since $F$ is the identity at $z = 0$, smoothness of the exponential map now gives $\| nabla upright(d) F \| = O \( z \)$.
  If $phi.alt$ defines the support at $x$, then $phi.alt compose F$ supports $D$ at $y$: every $y' in D$ maps a distance at most $z$ from $D$. The tangent ball at $x$ aligns the support normal with the final segment tangent. Since $upright(d) F_y$ is exactly parallel transport, comparison of the two tangential Hessian traces after gradient normalization has error only $O \( z \)$, coming from $nabla upright(d) F$; there is no uncontrolled multiple of $nabla^2 phi.alt$. Normal transport and variation of $Q$ contribute another $O \( z \)$. This proves the claimed parallel-set bound.
  Choose $0 < a < b$ so small that $c + C b < c'$. Smooth approximation of the distance followed by a regular-value choice gives a smooth enclosure containing $D_a$ and contained in $D_b$; fill any pockets that meet no designated outer face. Let $eta gt.eq 0$ be one on its boundary and supported where $"dist" \( dot.op \, D \) < b$. Replacing $Q$ temporarily by
  $ Q - 1 / 2 \( c' + A_0 eta \) g $
  makes this enclosure a strict inner barrier when $A_0$ is sufficiently large. The designated outer barriers stay positive. Apply the strict barrier theorem to each complementary component meeting a designated outer face; every such component has both barriers, by connectedness and the strict enclosure. The resulting marginal surfaces together bound a region containing $D_a$.
  If the minimum distance $z$ of that boundary from $D$ were at most $b$, its boundary at a minimizing point would be an exterior support of $D_z$. Indeed a path from $D$ of shorter length cannot cross that boundary before reaching it. Its expansion for the original $Q$ is $c' + A_0 eta gt.eq c'$, contradicting the strict parallel-set bound. Thus the boundary lies beyond $D_b$, where $eta = 0$, and has original expansion $c'$. This proves the enclosure assertion without any regularity hypothesis on $D$ or any support-curvature bound. ◻
]

=== 7.2 The equations and their geometric identities <d:equations>

Fix $0 < epsilon < 1$ sufficiently small and an integer $n > max { 4 \, 2 \/ epsilon }$. Choose a smooth cutoff $theta.alt$ equal to one on $\( - oo \, 0 \]$, zero on $\[ 1 \, oo \)$, and between zero and one. Define

#[#set math.equation(numbering: n => "(7.3)")
 $ p \( t \) = n theta.alt \( n t \) \, #h(2em) l \( t \) = exp (integral_0^t p \( s \) thin upright(d) s) \, #h(2em) L \( t \) = l \( t \) e^(2 t) \, #h(2em) ell = e^(- n epsilon) \, #h(2em) tau_0 = ell^(3 \/ 2) . $ <d:profiles>]

For a graph function $f$, put

#[#set math.equation(numbering: n => "(7.4)")
 $ h = tau_0 f \, #h(2em) sigma = \| nabla f \| \, #h(2em) D = 1 + l^2 sigma^2 \, #h(2em) d = D^(- 1) \,\
w = frac(l nabla f, sqrt(D)) \, #h(2em) a = \| w \| \, #h(2em) v = a^2 = 1 - d \, #h(2em) u = L sqrt(D) \,\
Z = t + 1 / 8 log D . $ <d:variables>]

The unknowns are $f \, Z$. For any fixed gradient of $f$, Equation (7.4) determines $t$ uniquely and smoothly: the derivative of its right side with respect to $t$ is $1 + p v \/ 4 > 0$, and its range is all of $bb(R)$.

Where $sigma > 0$, set $e = nabla f \/ sigma$ and $A_j = I - \( 1 - j \) e ⊗ e$. Define

#[#set math.equation(numbering: n => "(7.5)")
 $ chi = frac(4 d, 4 + p v) \, #h(2em) A_d = I - w ⊗ w \, #h(2em) A_chi = I - frac(p + 4, 4 + p v) w ⊗ w \,\
H^f = l / sqrt(D) "Hess" f \, #h(2em) S_1 = K + H^f . $ <d:ellipticity>]

The latter matrix formulas extend smoothly across $nabla f = 0$. For a symmetric tensor $A$, $"tr"_(A_chi) A$ means contraction with $A_chi$. The physical equations are

#[#set math.equation(numbering: n => "(7.6)")
 $ "tr"_(A_chi) S_1 & = F = h + C \,\
V & = u A_chi #scale(x: 120%, y: 120%)[\(] 4 nabla Z + K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) "div" V = u Xi . $ <d:trace>]

Use $h = b_(-)$ on $B_b$, $h = b_(+)$ on $B_w$, and prescribe

#[#set math.equation(numbering: n => "(7.7)")
 $ V_nu / u = cal(B) := - H + w_nu \( F - P_B \) - N_B d \, #h(2em) N_B > 1 + \| H \| \, $ <d:boundary>]

where $N_B$ is a fixed smooth invariant positive bound on $B$. On the outer truncation $S_R$, set $f = Z = 0$.

Relative to $e$, let $T$ be the transverse two-by-two block of $S_1$, $M$ its mixed transverse–$e$ block, and $q = S_1 \( e \, e \)$. Let $T^(upright("tf")) = T - 1 / 2 \( "tr" T \) I_perp$, and use $nabla_perp$ for the transverse gradient. At zero gradient any axis can be used in these block formulas; the tensor expressions below show their independence of that choice. Write $upright(d) t \, upright(d) Z$ for differentials, to distinguish them from the scalar $d = D^(- 1)$.

#thm([Lemma 7.2.])[
  (Curvature and boundary identities).  #emph[For $macron(g) = g + l^2 upright(d) f^2$ and $hat(g) = e^(4 t) macron(g)$, and for the actual trace $F = "tr"_(A_chi) S_1$, one has 
#[#set math.equation(numbering: n => "(7.8)")
 $ 1 / 2 e^(4 t) R_(hat(g)) = 8 pi #scale(x: 120%, y: 120%)[\(] mu + J_0 \( w \) #scale(x: 120%, y: 120%)[\)] + cal(T) + w \( F \) - F "tr" K - u^(- 1) "div" V \, $ <d:curvature>]

 where 
#[#set math.equation(numbering: n => "(7.9)")
 $ cal(T) =  & 1 / 2 \| T^(upright("tf")) \|^2 + \( M + p a nabla_perp t \) dot.op \( M + \( p + 2 \) a nabla_perp t \) + 4 \( p + 1 \) \| upright(d) t \|_(A_d)^2\
 & + \( chi - chi^2 \/ 4 \) q^2 + 2 \( p + 1 \) chi q a thin partial_e t - chi / 2 F q + 3 / 4 F^2 . $ <d:quadratic>]

 It has the square completion 
#[#set math.equation(numbering: n => "(7.10)")
 $ cal(T) =  & 1 / 2 \| T^(upright("tf")) \|^2 + \| M + \( p + 1 \) a nabla_perp t \|^2 + \[ 4 \( p + 1 \) - v \] \| nabla_perp t \|^2\
 & + 4 \( p + 1 \) d (partial_e t + frac(chi a q, 4 d))^2 + 3 / 4 (F - frac(chi q, 3))^2 + frac(4 d \( 9 - d \), 3 \( 4 + p v \)^2) q^2 . $ <d:squares>]

 In particular, 
#[#set math.equation(numbering: n => "(7.11)")
 $ \| T \|^2 + \| M \|^2 + d q^2 + F^2 + \| upright(d) t \|_(A_d)^2 lt.eq Pi_n cal(T) . $ <d:coercivity>]

 Here and below $Pi_n$ denotes a positive polynomial bound in $n$; its coefficients may depend on the prepared data, fixed collars and cutoff profiles, but not on the truncation or the solution. Different occurrences may denote different such bounds. If $upright(d) t = 0$, then, with $Q_f = \| T^(upright("tf")) \|^2 + \| M \|^2 + chi q^2 + F^2$, 
#[#set math.equation(numbering: n => "(7.12)")
 $ 1 / 2 Q_f lt.eq cal(T) lt.eq Q_f . $ <d:floor-norm>]

 At any boundary face on which $f$ is constant, 
#[#set math.equation(numbering: n => "(7.13)")
 $ V_nu / u = d \( H + 4 partial_nu t \) - H + w_nu \( F - P_B \) \, #h(2em) H_(hat(g)) = e^(- 2 t) sqrt(d) thin \( H + 4 partial_nu t \) . $ <d:boundary-identity>]

]
] <d:identities>

#proof[
  Consider the auxiliary stationary Lorentz metric $- l^2 \( upright(d) b - upright(d) f \)^2 + macron(g)$. Its $b$-slice metric is $g$, its lapse is $U = l sqrt(D)$, its shift is $beta = U w$, and its slice tensor is
  $ k_s = - U^(- 1) "sym" nabla beta = - H^f - p \( upright(d) t ⊗ w^flat + w^flat ⊗ upright(d) t \) . $
  Set $frak(B) \( A \, B \) = A : B - \( "tr" A \) \( "tr" B \)$, $P_A = A - \( "tr" A \) g$, and $Q_1 = K - k_s$. The Gauss and normal-expansion identities, with stationarity, $U "tr" k_s = - "div" beta$, and, for the future unit normal $n_(upright(L))$,
  $ "Ric"_(upright("Lor")) \( n_(upright(L)) \, n_(upright(L)) \) = - n_(upright(L)) \( "tr" k_s \) - \| k_s \|^2 + U^(- 1) Delta U \, $
  give the two expressions for the spacetime scalar density
  #[#set math.equation(numbering: n => "(7.14)")
   $ U #scale(x: 120%, y: 120%)[\(] R_g + frak(B) \( k_s \, k_s \) #scale(x: 120%, y: 120%)[\)] - 2 "div" #scale(x: 120%, y: 120%)[\(] nabla U + \( "tr" k_s \) beta #scale(x: 120%, y: 120%)[\)] = U #scale(x: 120%, y: 120%)[\(] R_(macron(g)) - 2 l^(- 1) accent(Delta l, ‾) #scale(x: 120%, y: 120%)[\)] . $ <d:auxiliary-scalar>]
  The right side is the static warped-product expression in the coordinate $b - f$. Moreover,
  $ accent(Delta l, ‾) = l / U "div" (U / l A_d nabla l) \, #h(2em) nabla U - U / l A_d nabla l = - k_s \( beta \, dot.op \) . $
  Substitute the constraint equations and $P_K : nabla beta = - U frak(B) \( K \, k_s \)$ into Equation (7.14). The result is
  #[#set math.equation(numbering: n => "(7.15)")
   $ U R_(macron(g)) = U [16 pi \( mu + J_0 \( w \) \) + frak(B) \( Q_1 \, Q_1 \)] - 2 "div" \( U P_(Q_1) w \) . $ <d:graph-scalar>]
  The conformal terms in $1 / 2 e^(4 t) R_(hat(g))$ are $- 4 accent(Delta t, ‾) - 4 \| upright(d) t \|_(A_d)^2$. Differentiating Equation (7.4) gives
  #[#set math.equation(numbering: n => "(7.16)")
   $ 4 upright(d) Z = \( 4 + p v \) upright(d) t + a H^f \( e \, dot.op \) \,\
V \/ u = P_(Q_1) w + 4 A_d nabla t + w F \, #h(2em) "div" \( u w \) \/ u = F + \( 1 - chi \) q - "tr" K + 2 \( p + 1 \) w \( t \) . $ <d:z-differential>]
  Combining these formulas leaves the quadratic tensor expression
  #[#set math.equation(numbering: n => "(7.17)")
   $ cal(T) =  & 1 / 2 frak(B) \( Q_1 \, Q_1 \) + 2 P_(Q_1) \( w \, nabla t \) + 4 \( p + 1 \) \| upright(d) t \|_(A_d)^2\
 & + F #scale(x: 120%, y: 120%)[\[] F + \( 1 - chi \) q + 2 \( p + 1 \) w \( t \) #scale(x: 120%, y: 120%)[\]] . $ <d:quadratic-tensor>]
  This expression is smooth at $w = 0$; for example $\( 1 - chi \) q = frac(p + 4, 4 + p v) S_1 \( w \, w \)$. Expanding with $"tr" T = F - chi q$ gives Equations (7.8) and (7.9). Completing the mixed and normal squares gives Equation (7.10), hence Equation (7.11). When $upright(d) t = 0$, the normal quadratic form in $\( sqrt(chi) q \, F \)$ has eigenvalues $1$ and $\( 3 - chi \) \/ 4$, which lie between $1 \/ 2$ and $1$, proving Equation (7.12). Finally, at a constant-$f$ face, $\( "Hess" f \) \|_(T B) = \( partial_nu f \) upright("II")_B$. Substituting this into the trace equation gives the first boundary identity; the graph and conformal mean-curvature formulas give the second. ◻
]

Choose smooth positive invariant weights $rho_0 \, rho_1$ equal to $r^(- 4) \, r^(- 2 gamma)$ on the far end, where

#[#set math.equation(numbering: n => "(7.18)")
 $ 3 / 4 < gamma < 1 . $ <d:gamma>]

The source is

#[#set math.equation(numbering: n => "(7.19)")
 $ Xi = delta_0 cal(T) + rho + delta_0 tau_0 a sigma - m_0 \( t \) cal(P) \, #h(2em) cal(P) = C_n \( rho_0 + v rho_1 \) . $ <d:source>]

Here $0 < delta_0 < 1 \/ 4$ is a sufficiently small fixed number, $C_n$ is a sufficiently large polynomial in $n$, and $m_0$ is a smooth cutoff between zero and one, equal to one on $t lt.eq - epsilon$ and zero on $t gt.eq - epsilon + 1 \/ n$. The floor estimate below specifies the order in which $delta_0$ and $C_n$ are chosen.

=== 7.3 The four-stage homotopy <d:homotopy>

The compact-map construction will be performed on finite truncations. We specify its equations here so that every a priori estimate applies to the entire homotopy. In its first three stages use $cal(T)$ with the #emph[actual] trace $F$, and use

#[#set math.equation(numbering: n => "(7.20)")
 $ V_lambda = u A_chi #scale(x: 120%, y: 120%)[\(] 4 nabla Z + lambda K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) "div" V_lambda = u Xi \,\
frac(\( V_lambda \)_nu, u) = \[ 1 - \( 1 - lambda \) j \( t \) \] [cal(B) - \( 1 - lambda \) \( A_chi K \( w \, dot.op \) \)_nu] \, $ <d:homotopy-flux>]

where $0 lt.eq j lt.eq 1$ is smooth, zero for $t lt.eq 0$, and one for $t gt.eq 1$. The outer data are always $f = Z = 0$.

+ Run $lambda$ from $1$ to $0$, leaving $F = h + C$ and the assigned inner heights unchanged. Keep $lambda = 0$ in all later stages.
+ Add gradually to $F = h + C$ a collar term $D_0 \( x \, w \, h \)$. It is smooth, bounded, invariant and nondecreasing in $h$. On black collars it is nonpositive and supported where $w dot.op nu_s < - 1 \/ 2$ and $h < b_(-) + 2 eta$; on white collars it is nonnegative and supported where $w dot.op nu_s > 1 \/ 2$ and $h > b_(+) - 2 eta$, for a fixed sufficiently small $eta > 0$. Choose its strength so that at the full second-stage endpoint, at the assigned height on every face and in the limiting directions,
  #[#set math.equation(numbering: n => "(7.21)")
   $ F \( x \, nu \) gt.eq P_B + H \, #h(2em) F \( x \, - nu \) lt.eq P_B - H #h(2em) \( \| w \| = 1 \, med chi = 0 \) . $ <d:directional-inequalities>]
  One of these inequalities is already equality by Equation (7.1); the other is obtained by the specified sign of $D_0$ and smooth cutoffs.
+ Extend the assigned heights smoothly to a compactly supported invariant function $b \( x \)$, constant on smaller collars. Run $zeta$ from $0$ to $1$, with $h \|_B = \( 1 - zeta \) b$ and
  #[#set math.equation(numbering: n => "(7.22)")
   $ F = h + \( 1 - zeta \) #scale(x: 120%, y: 120%)[\[] C + D_0 \( x \, w \, h + zeta b \( x \) \) #scale(x: 120%, y: 120%)[\]] + zeta #scale(x: 120%, y: 120%)[\[] "tr"_(A_chi) K + D_1 \( x \, w \) #scale(x: 120%, y: 120%)[\]] . $ <d:third-trace>]
  Near each face take $D_1 = A_1 w dot.op nu_s$, with $A_1 > 1 + sup_B \| H \|$, and cut it off in the collars. At the current assigned height, $h + zeta b = b$, so Equation (7.21) persists by convexity in $zeta$. At $zeta = 1$ the trace problem has $f = 0$: zero solves it, and the maximum principle gives uniqueness.
+ Retain that trace problem and scale both the divergence source and its inner boundary flux to zero by a common factor from $1$ to $0$. Since $f = 0$, at the final endpoint the second problem has the unique solution $Z = 0$.

In every stage, the derivative of $F$ with respect to $h$, holding the other variables fixed, is at least one. This strict height monotonicity will be used for comparison and for the separate trace solve. Every cutoff and auxiliary choice is invariant.

=== 7.4 Height bounds and exclusion of the floor <d:floor-estimates>

The maximum principle for the trace equation, also without the divergence equation, gives

#[#set math.equation(numbering: n => "(7.23)")
 $ \| h \| + \| F \| lt.eq C_0 . $ <d:height-bound>]

Indeed at a critical point $d = chi = 1$, all gradient-dependent collar terms vanish, and the trace is strictly increasing in $h$ with bounded remaining terms. The constant $C_0$ is independent of $n$, the truncation and the homotopy parameter. Far out, $K = C = D_0 = D_1 = 0$ and $F = h$. Comparison with $plus.minus C \( r^(- gamma) - R^(- gamma) \)$ gives

#[#set math.equation(numbering: n => "(7.24)")
 $ \| h \| lt.eq C \( r^(- gamma) - R^(- gamma) \) quad \( r lt.eq R \) . $ <d:radial-height>]

At a comparison point with the common radial gradient, the leading coefficient of the Hessian trace of $r^(- gamma)$ is $gamma \[ \( gamma + 1 \) chi - 2 \] < 0$, uniformly for $0 < chi lt.eq 1$ because $gamma < 1$; the asymptotic metric errors are smaller. On the outer face this implies $sigma lt.eq C tau_0^(- 1) R^(- 1 - gamma)$. Since $Z = 0$ there, Equation (7.4) then gives $t > - epsilon$ for all sufficiently large $R$, at fixed $n$.

#thm([Lemma 7.3.])[
  (No contact with the floor).  #emph[Choose $delta_0 > 0$ sufficiently small, then $C_n$ sufficiently large with polynomial growth. On every sufficiently large finite truncation, no smooth solution of any homotopy stage satisfying $t gt.eq - epsilon$ can attain $t = - epsilon$.]
] <d:floor>

#proof[
  At an inner boundary contact in the first three stages, $j \( t \) = 0$. Equations (7.20) and (7.13) therefore give $4 partial_nu t = - H - N_B < 0$, incompatible with a minimum when $nu$ points into the domain. The preceding outer estimate excludes the outer face.
  Suppose there is an interior contact. Then $upright(d) t = 0$ and $"Hess" t gt.eq 0$. The graph Gauss equation in the Riemannian warped product $g + l^2 upright(d) b^2$ gives
  #[#set math.equation(numbering: n => "(7.25)")
   $ 1 / 2 e^(4 t) R_(hat(g)) lt.eq 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) \, $ <d:floor-gauss>]
  where, for a symmetric tensor $A$,
  $ cal(S) \( A \) = 1 / 4 \( "tr"_perp A \)^2 - 1 / 2 \| A_(perp perp)^(upright("tf")) \|^2 + d A_(e e) "tr"_perp A - d \| A_(e perp) \|^2 . $
  In fact $l^(- 1) "Hess" l = p "Hess" t$ at contact, so the warping term $- v "tr"_perp \( l^(- 1) "Hess" l \)$ and the conformal term $- 4 accent(Delta t, ‾)$ have favorable signs; $H^f$ is the graph second form there, up to the immaterial choice of normal.
  Directly from Equation (7.9), at $upright(d) t = 0$,
  #[#set math.equation(numbering: n => "(7.26)")
   $ cal(T) - cal(S) \( S_1 \) = \| T^(upright("tf")) \|^2 + \( 1 + d \) \| M \|^2 + chi \( 1 + d - chi \/ 2 \) q^2 - d F q + 1 / 2 F^2 . $ <d:floor-algebra>]
  Use $chi lt.eq d$ and $\| d F q \| lt.eq chi q^2 \/ 4 + \( d^2 \/ chi \) F^2$ together with $d \/ chi lt.eq 1 + n \/ 4$ and Equation (7.12). This gives
  $ cal(T) - cal(S) \( S_1 \) gt.eq 1 / 2 cal(T) - \( 1 + n \/ 4 \) F^2 . $
  Replacing $S_1$ by $H^f = S_1 - K$ introduces only products involving transverse components and $d q$. Young’s inequality and Equation (7.12) absorb an arbitrarily small fixed multiple of $cal(T)$, at polynomial cost in $n$ for $\| K \|^2$. Thus, for a fixed $c_(*) > 0$ independent of $n$,
  #[#set math.equation(numbering: n => "(7.27)")
   $ cal(T) - cal(S) \( H^f \) gt.eq c_(*) cal(T) - Pi_n \( F^2 + \| K \|^2 \) . $ <d:floor-coercivity>]
  When $K = 0$, improve the last error to $Pi_n v F^2$. To see this, if $\( 1 + p \) v$ is sufficiently small, $d$ and $chi$ are uniformly close to one and the normal quadratic form in Equation (7.26) is uniformly positive definite; its value at $d = chi = 1$ is $3 / 2 q^2 - F q + 1 / 2 F^2$. Otherwise $v gt.eq c \/ \( 1 + n \)$, so the previous error is bounded by a new polynomial times $v F^2$.
  At contact, differentiating $w$ multiplies the vector slot of $H^f$ by $A_d$, and hence $\| nabla w \| lt.eq Pi_n \( \| K \| + sqrt(cal(T)) \)$. View $F$ as a smooth function of $\( x \, w \, h \, p \)$. Its explicit $x \, w$ derivatives have compact support and polynomial bounds on the range in Equation (7.23); also $nabla p = 0$ at contact. Since $F_h gt.eq 1$, for any fixed $eta_0 > 0$,
  #[#set math.equation(numbering: n => "(7.28)")
   $ w \( F \) gt.eq tau_0 a sigma - eta_0 cal(T) - Pi_n upright(bold(1))_(upright("comp")) . $ <d:floor-height-derivative>]
  Here $upright(bold(1))_(upright("comp"))$ denotes the indicator of a fixed sufficiently large compact set; it can equally be replaced by a fixed compactly supported majorant. The difference between the physical flux and $V_lambda$ costs at most $eta_0 cal(T) + Pi_n upright(bold(1))_(upright("comp"))$ after taking its divergence and dividing by $u$. Indeed differentiate $u A_chi K \( w \, dot.op \)$ using the preceding estimate. The remaining factor $nabla log u = H^f \( w \, dot.op \)$ contracts against $A_chi K \( w \, dot.op \)$ and involves only $chi H_(e e)^f$ and $H_(e perp)^f$, which are controlled by Equation (7.12).
  Compare Equations (7.8) and (7.25), and use Equations (7.27) and (7.28). Outside the fixed compact set, $K = 0$, $F = h = O \( r^(- gamma) \)$, and $"Ric"_g = O \( r^(- 3) \)$. Choose $eta_0$ and then $delta_0$ sufficiently small compared with $c_(*)$. The resulting lower bound is
  #[#set math.equation(numbering: n => "(7.29)")
   $ u^(- 1) "div" V_lambda gt.eq 2 delta_0 cal(T) + tau_0 a sigma - Pi_n #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(upright("comp")) + v \( rho_0 + rho_1 \) #scale(x: 120%, y: 120%)[\]] . $ <d:floor-divergence>]
  Choose $C_n$ so that $cal(P)$ dominates the last error plus $2 rho$ everywhere. This requires only polynomial growth, since $rho_0$ is positive on the compact set. At the floor $m_0 = 1$, and subtracting the prescribed source from this geometric lower bound gives at least
  $ delta_0 cal(T) + \( 1 - delta_0 \) tau_0 a sigma + rho > 0 \, $
  contradicting Equation (7.20).
  In the fourth stage, $f = 0$, $t = Z$, and $v = 0$. As long as the common scale factor is positive, the inner floor-contact derivative is that factor times $\( - H - N_B \) \/ 4 < 0$. At an interior floor contact, $cal(T)$ is compactly bounded by $K$; enlarge $C_n$ so that $delta_0 cal(T) + rho - cal(P) < 0$ there. The divergence of $4 u nabla t$ is nonnegative at a minimum, giving a contradiction. At scale zero, the unique mixed-problem solution is $Z = 0$. This also cannot meet the floor. ◻
]

=== 7.5 Separation of heights and the boundary slopes <d:collar-estimates>

All estimates from now on concern solutions with $t gt.eq - epsilon$. Thus $l gt.eq ell$ and $tau_0 \/ ell = ell^(1 \/ 2)$ tends to zero exponentially as $n arrow.r oo$.

#thm([Lemma 7.4.])[
  (Height separation from the full regions).  #emph[In the first two homotopy stages, for every compact $C_(*) subset overline(Omega)_(upright("red"))$ disjoint from the selected full black region, there are $eta' > 0$ and $n_0$ such that $h > b_(-) + eta'$ on $C_(*)$ for $n gt.eq n_0$ and all sufficiently large outer truncations. The analogous statement for a compact set disjoint from the selected full white region is $h < b_(+) - eta'$. These constants are uniform over the first two stages.]
] <d:height-separation>

#proof[
  The quantifier #emph[sufficiently large truncations] allows a threshold $R_0 \( n \)$ depending on $n$. If the first conclusion fails, then for every $eta' > 0$ and every $n_0$ there is an $n gt.eq n_0$ with failures at arbitrarily large $R$. Choose successively $eta' = 1 \/ j$, $n_j gt.eq max { j \, n_(j - 1) + 1 }$ and $R_j gt.eq max { j \, R_(upright("floor")) \( n_j \) }$ among those failures, with $R_(upright("floor")) \( n \)$ the outer threshold in Lemma 22. There are points $x_j$ in the fixed compact set with $h_j \( x_j \) lt.eq b_(-) + 1 \/ j$. Pass to $x_j arrow.r x_(*)$ and take the lower spatial relaxed limit $underline(h)$, defined by infima over tail indices and shrinking balls, followed by the lower semicontinuous envelope. Near a white face first extend each $h$ continuously by the constant $b_(+)$ behind the face. This does not assert continuity of the relaxed limit. By construction, $underline(h) \( x_(*) \) lt.eq b_(-)$.
  Away from black faces, every smooth lower test $phi.alt$ for $underline(h)$ at a value sufficiently near or below $b_(-)$, with $nabla phi.alt eq.not 0$, has oriented level expansion for $K$ at most $underline(h) + C_b$. Indeed make the touching strict by a fourth-order perturbation and transfer it to local minima of $h - phi.alt$ along a subsequence. The contacts are interior, because white boundary values are higher. There $nabla f = tau_0^(- 1) nabla phi.alt$, so
  $ d \, chi arrow.r 0 \, #h(2em) frac(l, tau_0 sqrt(D)) arrow.r frac(1, \| nabla phi.alt \|) . $
  The lower Hessian comparison in the trace equation therefore gives the level expansion bound. The second-stage correction has $D_0 lt.eq 0$ at these low values, so it has the favorable sign.
  We pass from this lower-test statement to exterior supports of closed sublevels. Fix $b_(-) < k < k'$ sufficiently close to $b_(-)$ and put $D_k = { underline(h) lt.eq k }$. Apply the increasing reparametrizations
  $ r_j \( s \) = (1 + exp \[ - j^2 \( s - k - j^(- 1) \) \])^(- 1) . $
  Their lower relaxed limit on $underline(h)$ is the function $u_k$ equal to zero on $D_k$ and one off $D_k$. At a point outside the closed set, lower semicontinuity provides a local positive gap from $k$; on the set itself the unchanged point gives limiting value zero. Let $phi.alt$ define an exterior support at $x_0$, with $phi.alt \( x_0 \) = 0$, $nabla phi.alt \( x_0 \) eq.not 0$, and $D_k$ locally on its nonpositive side. Choose a small closed ball with $\| phi.alt \| < 1 \/ 4$, and set $phi.alt_eta = phi.alt - eta \| x - x_0 \|^4$, where $eta > 0$. Then $u_k - phi.alt_eta$ has its unique minimum zero at $x_0$ and a positive gap on the ball’s boundary. Minimize the lower semicontinuous function $r_j \( underline(h) \) - phi.alt_eta$ on this ball. Because $r_j \( underline(h) \( x_0 \) \) lt.eq r_j \( k \) arrow.r 0$, the lower relaxed limit property gives interior minimizers $y_j arrow.r x_0$, with minimum values $c_j arrow.r 0$. Their transformed contact values $a_j = phi.alt_eta \( y_j \) + c_j = r_j \( underline(h) \( y_j \) \)$ tend to zero and, for each finite $j$, lie strictly between zero and one.
  On a sufficiently small neighborhood of $y_j$ the smooth function $psi_j = r_j^(- 1) \( phi.alt_eta + c_j \)$ is therefore a lower test for $underline(h)$. The inverse is single-valued and strictly increasing; moreover $nabla phi.alt_eta \( y_j \) arrow.r nabla phi.alt \( x_0 \) eq.not 0$, so $nabla psi_j \( y_j \) eq.not 0$ for large $j$. Since $r_j \( k' \) arrow.r 1$, one also has $underline(h) \( y_j \) < k'$ for large $j$. Increasing reparametrization preserves the gradient direction and the tangential Hessian divided by gradient length, regardless of the size of its derivatives. Apply the already proved lower-test inequality to each fixed $psi_j$, and then let $j arrow.r oo$. The quartic perturbation has zero first and second jets at $x_0$. Thus every exterior support of $D_k$, away from black faces, has expansion at most $k' + C_b$. The original solution limit is taken first for each fixed test; the reparametrization limit is a separate subsequent limit.
  This property excludes contact with a white face: the reversed white face itself would be an exterior support, with black expansion $- c_w > 0$. The radial height bound makes $D_k$ compact on the end, since $k < 0$. Apply Lemma 20 in the original connected truncation $Omega_R$, with the original boundary as required inner face and $S_R$ as its only designated outer face. Its compact set is exactly $D_k union cal(B)_(c_b)$: neither the white regions nor omitted bounded components are adjoined. Every frontier point of this union outside $cal(B)_(c_b)$ lies in the reduced exterior away from white faces, and hence has the just-proved support bound. At any component of the smooth frontier of $cal(B)_(c_b)$, including components facing omitted regions, a support of the union also supports that black region, and comparison gives the bound $c_b < k' + C_b$. Thus the union contains the required inner collar and meets all hypotheses of the lemma, whether or not it is connected. The lemma encloses it in a smooth trapped region at any threshold slightly larger than $k' + C_b$ and still negative. It is therefore contained in the full black region at that larger threshold.
  Right continuity at $c_b = b_(-) + C_b$ lets us choose a threshold just above $c_b$ whose full region still misses $C_(*)$. Then choose $k \, k'$ close enough to $b_(-)$ that the preceding enclosure uses a smaller threshold. A purported sequence in $C_(*)$ with limiting height at most $b_(-)$ places a limit point in $D_k ∩ C_(*)$, a contradiction. This proves uniform strict separation by the usual subsequence criterion.
  For the other color apply the argument to $- h \, - K \, - C$. Extend the original heights constantly by their low boundary values locally behind black faces before taking the reverse relaxed limit. The reversed black face is a forbidden support for the high sublevels. The ambient domain is now the fixed black complement in $Omega_R$, connected after the black pocket filling, with all black frontiers and $S_R$ designated as outer faces. Adjoin only the full white region to the high sublevel. Supports on any full white frontier, including hidden components, are controlled by its smooth threshold equation. Visible black faces are excluded as just explained. A hidden black component has positive distance from the closure of the reduced domain: a fixed collar along its connected smooth face lies in a single adjacent complement component. Thus the union is disjoint from every designated outer face. Omitted components are not adjoined and introduce no other support frontier. Any pocket filling in the enclosure lemma is relative to these designated faces. Hausdorff right continuity at $c_w$ gives the same contradiction. If a selected color is absent, right continuity means nearby larger-threshold regions are empty, and the enclosure contradiction is unchanged. ◻
]

#thm([Proposition 7.5.])[
  (Collar comparison).  #emph[For all sufficiently large $n$ and sufficiently large outer truncations, solutions in the first two homotopy stages satisfy, with constants $c \, C' > 0$ independent of $n \, R$ and the stage parameter, 
#[#set math.equation(numbering: n => "(7.30)")
 $ c / tau_0 lt.eq partial_nu f lt.eq C' / tau_0 quad \( B_b \) \, #h(2em) c / tau_0 lt.eq - partial_nu f lt.eq C' / tau_0 quad \( B_w \) . $ <d:collar-slopes>]

 They also satisfy $b_(-) lt.eq h lt.eq b_(+)$ on any fixed compact core needed in Equation (7.2). In the third stage one has $\| partial_nu f \| lt.eq C' \/ tau_0$. These conclusions need no upper bound for $Z$.]
] <d:collars>

#proof[
  In a black collar, test with $h_0 = b_(-) + psi \( s \)$, where $psi \( 0 \) = 0$ and $psi' > 0$. At a comparison point the gradient is common to the solution and test, so $t \, l \, d \, chi$ are computed using that gradient and the given value of $Z$. The trace of the test is
  #[#set math.equation(numbering: n => "(7.31)")
   $ P_s + a H_s + chi K \( nu_s \, nu_s \) + a chi [frac("Hess" s \( nu_s \, nu_s \), \| nabla s \|) + \| nabla s \| psi'' / psi'] \, $ <d:collar-trace>]
  where $H_s$ and $P_s$ use $nu_s$. For slopes bounded above and below by positive constants,
  #[#set math.equation(numbering: n => "(7.32)")
   $ d lt.eq C \( tau_0 \/ ell \)^2 = C e^(- n epsilon) \, #h(2em) 1 - a lt.eq d \, #h(2em) chi lt.eq d \, #h(2em) n chi = frac(4 n d, 4 + p v) gt.eq 2 d . $ <d:collar-smallness>]
  Use Lemma 23 on the far leaf of a fixed short collar, and choose a small positive slope so that a lower test stays below the solution there. In this direction $D_0$ vanishes. The stable-leaf inequality and $C = C_b - k_B s$ give a positive trace-minus-right-side residual at least $k_B s \/ 2 - O \( d \)$, apart from the last logarithmic-slope term in Equation (7.31). Choose
  $ \( log psi' \)' = A n quad \( 0 lt.eq s lt.eq 1 \/ n \) \, $
  nonnegative and smoothly cut off to zero by $s = 2 \/ n$, with a fixed sufficiently large $A$. By Equation (7.32) its contribution dominates $O \( d \)$ on the initial interval. From $s gt.eq 1 \/ n$ onward, the $s$ margin dominates the exponentially small $d$ error. The slope changes by at most the fixed factor $e^(2 A)$; choose its initial size after $A$, keeping the whole test small. This constructs a lower barrier with strictly positive boundary derivative.
  All constants in this choice are independent of $n$ and $R$. The far leaf is fixed with the domain; height separation gives one fixed $eta'$ there for every sufficiently large $n$ and $R gt.eq R_0 \( n \)$. Choose $A$ from the fixed geometric residual constants first, and only then choose the initial slope using $eta'$, $k_B$, the collar width and the fixed ratio $e^(2 A)$. Thus these comparisons introduce no arbitrary fixed-$n$ constants into the polynomial bounds $Pi_n$.
  For an upper barrier choose a large positive slope and the opposite logarithmic derivative. The smooth leaf and offset variations are $O \( s \)$, whereas the height increase dominates them; the negative logarithmic-slope term controls the initial $d$ errors. The global height bound supplies comparison on the far leaf. Strict height monotonicity gives the comparisons throughout the collar. Equality at its initial face then gives the two black boundary derivative bounds in Equation (7.30). Reverse signs for white faces. These barriers near the appropriate faces, together with height separation off their own-color collars, give $b_(-) lt.eq h lt.eq b_(+)$ on the required compact core.
  In the third stage, start at the current assigned height $\( 1 - zeta \) b$ and use lower and upper tests with large negative and positive slopes, respectively. Taper the magnitude of each slope using the negative logarithmic derivative just described. The limiting directional inequalities (7.21) give the respective residual signs at the face. At fixed boundary height the errors are $O \( s + d + chi \)$; in particular, the term $"tr"_(A_chi) K$ is compared using the common leaf normal. The height shift controls the $s$ error, and the logarithmic-slope term, using Equation (7.32), controls $d + chi$. This gives both boundary derivative bounds in the third stage. All uses of $l gt.eq ell$ occur at a common test gradient, so a ceiling for $Z$ is unnecessary. ◻
]

=== 7.6 A ceiling for the homotopy <e:ceiling-section>

We keep the notation and the four stages of Section 7.3. All integrals without a stated measure use the metric $g$; $nu$ at an inner face points into the retained exterior. A constant $Pi_n$ is bounded by a polynomial in $n$, with the prepared data, collars and cutoff shapes fixed. In contrast, $C \( n \)$ may be arbitrary at fixed $\( n \, epsilon \)$; it is always independent of the sufficiently large truncation radius and of the homotopy parameter.

#thm([Lemma 7.6.])[
  (Weighted trace estimates).  #emph[In the first two homotopy stages, for every nonnegative smooth $phi$ one has 
#[#set math.equation(numbering: n => "(7.33)")
 $ integral_B L phi & lt.eq Pi_n integral_(upright("coll")) u #scale(x: 120%, y: 120%)[\[] \( 1 + sqrt(cal(T)) \) phi + \| upright(d) phi \|_(A_chi) #scale(x: 120%, y: 120%)[\]] \,\
integral_B phi & lt.eq Pi_n integral_(upright("coll")) sqrt(D) #scale(x: 120%, y: 120%)[\[] \( 1 + sqrt(cal(T)) \) phi + \| upright(d) phi \|_(A_chi) #scale(x: 120%, y: 120%)[\]] . $ <e:weighted-trace-eq>]

 The integrands on the right include fixed collar cutoffs. In the first stage, moreover, 
#[#set math.equation(numbering: n => "(7.34)")
 $ \| \( V_lambda \)_nu \| lt.eq C u d lt.eq C tau_0 / ell L . $ <e:small-boundary-flux>]

 None of these estimates requires an upper bound for $Z$.]
] <e:weighted-trace>

#proof[
  Set $W = w \/ sqrt(D)$. By the two-sided normal-slope bounds (7.30), $w dot.op nu$ has a definite sign on each face and $a gt.eq 1 \/ 2$ there. The corresponding signed fluxes of $u W = L w$ and $sqrt(D) W = w$ are $L a$ and $a$. Apply the divergence theorem to these fields, multiplied by the collar cutoff and $phi$, reversing the sign on the white collars. The estimates needed for the resulting volume terms are
  #[#set math.equation(numbering: n => "(7.35)")
   $ \| W \( phi \) \| lt.eq \| upright(d) phi \|_(A_d) lt.eq Pi_n \| upright(d) phi \|_(A_chi) \,\
frac(\| "div" \( u W \) \|, u) + frac(\| "div" \( sqrt(D) W \) \|, sqrt(D)) lt.eq Pi_n \( 1 + sqrt(cal(T)) \) . $ <e:trace-direction>]
  For the second inequality, direct differentiation gives
  $ "div" w = "tr"_(A_d) H^f + d thin p thin w \( t \) . $
  In $"div" \( L w \) \/ u$ every derivative is multiplied by $sqrt(d)$; in particular the longitudinal Hessian contribution is controlled by $sqrt(d) thin \| q \|$. Derivatives of $L$ contribute $\( p + 2 \) sqrt(d) thin w \( t \)$. These and the transverse terms are bounded by (7.11); replacing $H^f$ by $S_1 - K$ costs a bounded compactly supported term. The same calculation applies to the second quotient in (7.35). Derivatives of the fixed collar cutoffs have bounded cost. This proves both trace estimates.
  At assigned first-stage heights, the two colors both satisfy $w_nu \( F - P_B \) = a H$. Consequently the physical boundary expression is
  $ cal(B) = \( a - 1 \) H - N_B d = - d (N_B + frac(H, 1 + a)) . $
  The omitted normal drift in the first homotopy stage has size $O \( chi \) lt.eq O \( d \)$, because $upright(d) f$ is normal on a face and $A_chi$ has normal eigenvalue $chi$. The prefactor in the homotopy boundary condition lies in $\[ 0 \, 1 \]$. Thus its flux has size $O \( u d \)$. Finally, (7.30) and $l gt.eq ell$ give $D^(- 1 \/ 2) lt.eq C tau_0 \/ ell$, proving (7.34). ◻
]

#thm([Proposition 7.7.])[
  (Ceiling and bounded variable range).  #emph[For all sufficiently large $n$, and then all sufficiently large truncations $Omega_R$, every smooth homotopy solution with $t gt.eq - epsilon$ satisfies 
$ \| Z \| + \| t \| + \| f \| + \| nabla f \| lt.eq C \( n \) . $

 The constants are uniform over the four stages and $R gt.eq R_min \( n \)$.]
] <e:ceiling>

#proof[
  Only an upper bound for $Z$ remains to be proved. Indeed $Z = t + 1 / 8 log D gt.eq - epsilon$, and an upper bound for $Z$, together with $t gt.eq - epsilon$ and $l gt.eq ell$, bounds $D$, $t$ and $sigma$. The height estimate already bounds $f = h \/ tau_0$ at fixed $n$.
  ===== 7.6.1 An integral estimate above a fixed height. <an-integral-estimate-above-a-fixed-height.>
  There is $M_0 = M_0 \( n \)$ such that, in the first three stages,
  #[#set math.equation(numbering: n => "(7.36)")
   $ Z > M_0 quad arrow.r.double quad Xi gt.eq delta_0 cal(T) + rho + frac(delta_0 tau_0, 2) a sigma . $ <e:high-source>]
  In fact the penalty is supported, on the allowed side of the floor, where $- epsilon lt.eq t lt.eq - epsilon + 1 \/ n$. There $l$ and $L$ are comparable to $ell$, so large $Z$ forces arbitrarily large $sigma$ and hence arbitrarily large $a sigma$. The bounded coefficient $cal(P) = C_n \( rho_0 + v rho_1 \)$ is therefore absorbed into half of the indicated height term.
  In the first stage choose a smooth increasing $k_0$ which vanishes below $M_0$ and equals one above $M_0 + 1$, and test the divergence equation with $k_0 \( Z \)$. Integration by parts gives the nonnegative principal contribution $4 integral u k'_0 \| upright(d) Z \|_(A_chi)^2$ on the source side. The drift cross term is bounded by half of this contribution plus $C integral u k'_0 \| K \|^2$. The latter is bounded: it has compact support, and in the transition strip $Z in \[ M_0 \, M_0 + 1 \]$ the floor bounds $D$, $u$ and all zeroth-order coefficients. The inner flux costs at most
  $ C tau_0 / ell integral_B L k_0 . $
  Use (7.33). On the fixed collars, positivity of $rho$ implies $1 + sqrt(cal(T)) lt.eq C \( rho + delta_0 cal(T) \)$, and $Pi_n tau_0 \/ ell arrow.r 0$. Thus these terms absorb into the positive source in (7.36). The remaining trace term contains $k'_0 \| upright(d) Z \|_(A_chi)$; Young’s inequality absorbs its quadratic part into the principal contribution, with another bounded transition-strip remainder. We obtain
  #[#set math.equation(numbering: n => "(7.37)")
   $ integral_(Omega_R) u k_0 \( Z \) \( cal(T) + rho + tau_0 a sigma \) lt.eq C \( n \) . $ <e:high-integral>]
  Let $Gamma$ denote the ordinary graph of $f$ in $g + upright(d) b^2$, with measure $upright(d) Gamma = sqrt(1 + sigma^2) thin upright(d) V_g$. On every fixed compact set, (7.37) bounds $e^Z$ in $L^2 \( upright(d) Gamma \)$. To see the density comparison, use
  $ e^(2 Z) = e^(2 t) D^(1 \/ 4) \, #h(2em) D^(1 \/ 4) lt.eq C \( n \) \( 1 + tau_0 a sigma \) \, #h(2em) sqrt(1 + sigma^2) asymp_n sqrt(D) . $
  The part where $k_0 = 1$ is controlled by (7.37), since $rho$ has a positive lower bound on that compact set. On the complementary part $Z lt.eq M_0 + 1$ the floor bounds the entire density. Moreover $ell lt.eq l lt.eq exp \( 1 \)$ and $d \/ chi lt.eq 1 + n \/ 4$, so the graph gradient norm is comparable, at fixed $n$, to $\| upright(d) dot.op \|_(A_chi)$.
  ===== 7.6.2 Sobolev inequality on the graph, including its boundary. <sobolev-inequality-on-the-graph-including-its-boundary.>
  On compact base patches, including patches meeting an inner face,
  #[#set math.equation(numbering: n => "(7.38)")
   $ parallel omega parallel_(L^6 \( upright(d) Gamma \))^2 lt.eq C \( n \) integral_Gamma #scale(x: 120%, y: 120%)[\(] \| nabla_Gamma omega \|^2 + \( 1 + cal(T) \) omega^2 #scale(x: 120%, y: 120%)[\)] $ <e:graph-sobolev>]
  for smooth $omega$ supported away from the other patch edges. Here the constant is independent of the particular graph. Embed a fixed smooth extension of the base patch isometrically in a Euclidean space, using Nash’s theorem #cite(label("Nash1956")), and use the product embedding for the graph. The Euclidean mean-curvature vector of this graph obeys
  $ \| upright(bold(H))_Gamma \| lt.eq C \( n \) \( 1 + sqrt(cal(T)) \) . $
  Indeed its graph-normal component is the trace of $nabla^2 f \/ sqrt(1 + sigma^2)$ with longitudinal coefficient $\( 1 + sigma^2 \)^(- 1)$; all its transverse entries and this longitudinal trace are controlled by (7.11). The second fundamental form of the fixed base embedding adds a bounded term, since it is contracted against the inverse graph metric.
  The Euclidean submanifold Sobolev inequality of Michael–Simon #cite(label("MichaelSimon1973")), in the boundary form of #cite(label("Brendle2021")) Theorem 1, therefore gives
  $ (integral_Gamma phi^(3 \/ 2))^(2 \/ 3) lt.eq C \( n \) [integral_Gamma #scale(x: 120%, y: 120%)[\(] \| nabla_Gamma phi \| + \( 1 + sqrt(cal(T)) \) phi #scale(x: 120%, y: 120%)[\)] + integral_(partial Gamma) phi] $
  for nonnegative $phi$ of the stated support. The graph has constant height on each inner face, so its boundary measure is exactly $upright(d) A_g$. The last term is controlled by (7.33) and the graph comparisons above. Taking $phi = \| omega \|^4$, then applying Cauchy–Schwarz to $\| omega \|^3 \| nabla_Gamma omega \|$ and $\( 1 + sqrt(cal(T)) \) \| omega \|^4$, proves (7.38).
  ===== 7.6.3 Iteration to a supremum bound. <iteration-to-a-supremum-bound.>
  For a fixed base cutoff $eta$ test the first-stage equation with $eta^2 e^(2 k Z) \/ L$, where $k gt.eq k_(*) \( n \)$ will be large. After integration by parts the positive differentiated-test contribution is
  $ 8 k integral u / L eta^2 e^(2 k Z) \| upright(d) Z \|_(A_chi)^2 . $
  The source has lower bound $delta_0 cal(T) - Pi_n$. Since $upright(d) log L = \( p + 2 \) upright(d) t$, coercivity and Young’s inequality bound its cross terms with $4 upright(d) Z + lambda K \( w \, dot.op \)$ by
  $ delta_0 / 2 cal(T) + C \( n \) \( 1 + \| upright(d) Z \|_(A_chi)^2 \) . $
  Take $k_(*) \( n \)$ large enough to absorb the gradient-square part; control drift and cutoff terms by the same inequality. After cancelling $L$, the boundary term is bounded by $C integral_B eta^2 e^(2 k Z)$. Apply (7.33) to $phi = eta^2 e^(2 k Z)$. Its $sqrt(cal(T))$ contribution is absorbed into a small part of the source. Its differentiated exponential contributes $C \( n \) k \| nabla_Gamma Z \|$, which costs a small part of $k \| nabla_Gamma Z \|^2$ and $C \( n \) k$ by Young’s inequality. Thus
  #[#set math.equation(numbering: n => "(7.39)")
   $ integral_Gamma e^(2 k Z) eta^2 \( cal(T) + k \| nabla_Gamma Z \|^2 \) lt.eq C \( n \) k integral_Gamma e^(2 k Z) \( eta^2 + \| upright(d) eta \|_g^2 \) . $ <e:moser-energy>]
  Applying (7.38) to $omega = eta e^(k Z)$ and using (7.39) gives the iteration from exponent $2 k$ to $6 k$. For nested patches with separation $s$, the multiplier in this step is at most
  $ \[ C \( n \) k^2 \( 1 + s^(- 2) \) \]^(1 \/ \( 2 k \)) . $
  The product of these multipliers converges when $k$ is multiplied by three and the patch gaps decrease geometrically. Hence on two nested patches $U' subset.double U$ (relative to the inner boundary),
  $ sup_(U') e^Z lt.eq C \( n \, s \) parallel e^Z parallel_(L^(2 k_(*)) \( U \, upright(d) Gamma \)) \, $
  with $C \( n \, s \)$ bounded by a fixed inverse power of $s$. Interpolation with the already bounded $L^2$ norm gives
  $ sup_(U') e^Z lt.eq C \( n \, s \) \( sup_U e^Z \)^(1 - 1 \/ k_(*)) . $
  Young’s inequality, with any desired small coefficient for $sup_U e^Z$, and a second iteration on geometrically nested patches absorb the larger supremum. The terminal term vanishes because each individual smooth solution has a finite supremum; the resulting bound is uniform over solutions. This proves $Z lt.eq C \( n \)$ on the compact sets containing the drift support and all inner faces.
  Outside the drift support, a high interior maximum contradicts (7.36) by the divergence equation. Comparison, with zero outer data and the compact bounds just proved, completes the first-stage ceiling. In the second and third stages the drift is zero everywhere, so this maximum argument applies directly. At a boundary maximum with $Z$ sufficiently large, the upper normal-slope bound of Proposition 24 bounds $D$ on the face, hence forces $t > 1$. Then $j \( t \) = 1$, so the prescribed conormal flux is zero. The Hopf boundary lemma excludes such a high maximum. The same argument applies in the fourth stage, where $f = 0$ and the source and flux are scaled together. At scale zero the mixed homogeneous problem has only the zero solution.
  The required choices of $n$ and $R_min \( n \)$ are compatible with Proposition 24. More explicitly, failure of a uniform positive height gap for all $n gt.eq N$ and $R gt.eq R_min \( n \)$, for every choice of $N$ and finite $R_min$, would give, for each $j$, an $n_j gt.eq j$ admitting arbitrarily large failing radii at gap $1 \/ j$. Choose such an $R_j gt.eq j$. This is precisely the contrary sequence excluded in Lemma 23. A finite number of exceptional fixed $n$ can be discarded by increasing $N$; infinitely many with unbounded failure tails would give the same contrary sequence. After fixing the uniform gap, eventual validity at each remaining $n$ defines a finite $R_min \( n \)$, which we may enlarge to be at least $n$. No uniform estimate in $n$ is asserted for the subsequent ceiling constant. ◻
]

=== 7.7 A local gradient estimate <a-local-gradient-estimate>

The boundedness established above does not yet permit ordinary Schauder estimates for the second equation: its source contains the square of the Hessian of $f$. We first prove a scalar estimate that also controls the local mass of that square. Throughout this subsection $D_x$ denotes coordinate differentiation, whereas $nabla$ and $"Hess"$ refer to the background Riemannian metric. The balls used in coordinate estimates are Euclidean coordinate balls; uniformly equivalent metric balls give the same conclusions after changing constants.

#thm([Lemma 7.8.])[
  (Local gradient and Hessian estimates).  #emph[Consider three-dimensional coordinate patches with a fixed positive lower bound for their size, uniform ellipticity and smooth bounds for their metrics, and, when present, uniform smooth geometry of one boundary face. Let $z$ be a smooth solution, including up to that face, of 
#[#set math.equation(numbering: n => "(7.40)")
 $ A_chi : "Hess" z = G_0 \, #h(2em) A_chi = I - \( 1 - chi \) e ⊗ e \, #h(2em) e = frac(nabla z, \| nabla z \|) \, #h(2em) 0 < chi_0 lt.eq chi lt.eq 1 . $ <g:axial-equation>]

 At a zero of $nabla z$ any measurable unit axis for which the equation holds is allowed. Assume $\| nabla z \| lt.eq L_0$ and $\| G_0 \| lt.eq Q_0$; on a boundary face assume that $z$ is constant. Only the displayed measurable bounds on $chi$ and $G_0$ are used. There are $alpha in \( 0 \, 1 \)$, $C < oo$, and a uniform smaller patch size, depending on $chi_0$ and the geometric bounds, such that 
#[#set math.equation(numbering: n => "(7.41)")
 $ parallel D_x z parallel_(C^(0 \, alpha)) lt.eq C \( L_0 + Q_0 \) \, #h(2em) integral_(B_r) \| "Hess" z \|^2 thin upright(d) V_g lt.eq C \( L_0 + Q_0 \)^2 r^(1 + 2 alpha) . $ <g:gradient-estimates>]

 The first norm is on the smaller patch. The second estimate holds for all sufficiently small balls centered in it, with intersection with the domain understood at a boundary. The same estimate holds for $D_x^2 z$ and coordinate volume. These are a priori estimates for the stated smooth solutions, with constants independent of their higher derivatives.]
] <g:gradient>

#proof[
  We organize the proof so that neither a derivative nor a continuity modulus of $chi$ enters.
  ===== 7.7.1 Reflection and a Hessian estimate near exponent two. <reflection-and-a-hessian-estimate-near-exponent-two.>
  At a constant Dirichlet face subtract the boundary value and use boundary normal coordinates. Reflect $z$ oddly and the metric isometrically. Tangential first derivatives vanish on the face and the normal first derivatives of the odd extension agree. Thus the extended $z$ belongs locally to $W^(2 \, p)$ for every finite $p$ for each individual smooth solution; its second derivative has no surface atom. The reflected metric is Lipschitz and smooth on each closed side, with uniform bounds there. Equation (7.40) holds almost everywhere on both sides, with the reflected axis and the odd reflected source. A linear coordinate change at the center makes the metric Euclidean there. On sufficiently small rescaled balls the coordinate principal matrix, denoted by $A$, obeys
  #[#set math.equation(numbering: n => "(7.42)")
   $ parallel I - A parallel_(upright(F)) lt.eq 1 - chi_0 \/ 2 < 1 . $ <g:cordes-defect>]
  Indeed its defect at a point in an orthonormal frame is precisely $1 - chi$, and the coordinate metric error can be made smaller than $chi_0 \/ 2$. This statement also holds in a reflected patch.
  The strict-defect Hessian absorption below is a Cordes-type estimate; for the linear framework see #cite(label("SmearsSuli2013")) Section 2, Lemma 1, and Section 2.1, Theorems 2–3. The reflected near-two estimate and the subsequent nonlinear gradient and Morrey bounds are developed here.
  For a compactly supported function on $bb(R)^3$, the operator $D_x^2 Delta^(- 1)$ from a scalar source to the full Hessian array has $L^2$ norm one: its Fourier multiplier has squared Frobenius norm $sum_(i \, j) xi_i^2 xi_j^2 \/ \| xi \|^4 = 1$. Its $L^p$ norm is bounded for $1 < p < oo$, and interpolation makes that norm arbitrarily close to one when $p$ is sufficiently close to two. Absorbing $\( I - A \) : D_x^2 v$ using (7.42) therefore gives, for some $2 < p_0 < 3$,
  #[#set math.equation(numbering: n => "(7.43)")
   $ parallel v parallel_(W^(2 \, p_0) \( B_(1 \/ 2) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel v parallel_(L^(p_0) \( B_1 \)) + parallel A_chi : "Hess" v parallel_(L^(p_0) \( B_1 \)) #scale(x: 120%, y: 120%)[\)] . $ <g:cordes>]
  Here and below a fixed smaller pair of concentric balls may replace the displayed pair. To localize, apply the compact-support estimate to a cutoff times $v$ and absorb first derivative terms by $parallel D_x v parallel_p lt.eq eta parallel D_x^2 v parallel_p + C_eta parallel v parallel_p$. The rescaled Christoffel terms are handled by the same inequality. Using nested cutoffs gives an arbitrarily small multiple of the larger Hessian norm, with a polynomial cost in the inverse gap; iteration on nested balls absorbs that term. The proof also gives the exponent-two version of (7.43). It applies to the piecewise smooth reflected functions just described.
  ===== 7.7.2 A flux identity and a drop or affine alternative. <a-flux-identity-and-a-drop-or-affine-alternative.>
  Normalize the gradient bound to one on a rescaled unit ball and make the source and geometric errors at most $delta$. Geometric errors here include the metric deviation from its constant value, its piecewise first derivatives, the smooth-side curvature, and the scaled second fundamental form of a reflection face. Put $P = nabla z$, $H_z = "Hess" z$, and $s = 1 - \| P \|^2 gt.eq 0$. The equation gives $Delta z = G_0 + \( 1 - chi \) H_z \( e \, e \)$ and therefore the exact identity
  #[#set math.equation(numbering: n => "(7.44)")
   $ A_chi nabla frac(\| P \|^2, 2) - G_0 P = \( H_z - \( Delta z \) g \) P . $ <g:flux-cancellation>]
  This identity remains valid when $P = 0$. Since $1 - chi lt.eq 1 - chi_0 < 1$, Young’s inequality, with a fixed parameter depending on $chi_0$, gives
  #[#set math.equation(numbering: n => "(7.45)")
   $ \| H_z \|^2 - \( Delta z \)^2 gt.eq c \| H_z \|^2 - C G_0^2 . $ <g:hessian-coercivity>]
  For example, choose $eta > 0$ with $\( 1 + eta \) \( 1 - chi_0 \)^2 < 1$ and use $\( G_0 + \( 1 - chi \) H_z \( e \, e \) \)^2 lt.eq \( 1 + eta \) \( 1 - chi_0 \)^2 \| H_z \|^2 + C_eta G_0^2$. The divergence of the right side of (7.44) is
  $ \| H_z \|^2 - \( Delta z \)^2 + "Ric" \( P \, P \) . $
  Consequently, on the smooth sides,
  #[#set math.equation(numbering: n => "(7.46)")
   $ - "div" #scale(x: 120%, y: 120%)[\(] A_chi nabla s + 2 G_0 P #scale(x: 120%, y: 120%)[\)] gt.eq 2 c \| H_z \|^2 - C delta . $ <g:gradient-deficit>]
  The differentiation is of the right side of the exact identity; it does not require differentiating $chi$ or $G_0$ separately.
  There is also a controlled distributional version across a reflected face. There $P = \( partial_nu z \) nu$, and the normal component of the right side of (7.44) is
  $ - #scale(x: 120%, y: 120%)[\(] "tr"_T H_z #scale(x: 120%, y: 120%)[\)] partial_nu z . $
  The tangential Hessian of a function constant on the face is, up to the normal-sign convention, its normal derivative times the second fundamental form. Thus the flux jump has magnitude at most $C delta$, irrespective of the second normal derivative of $z$. Incorporate the volume density in coordinate divergence. A bounded plane density $q \( x' \)$ is the divergence of the bounded field $q \( x' \) upright(bold(1))_({ x_3 > 0 }) partial_(x_3)$ locally. Hence the plane error in (7.46) is another divergence-field error of size $C delta$. All subsequent weak inequalities have bounded uniformly elliptic principal coefficients and scalar and vector errors tending to zero with $delta$.
  Consider a sequence with $delta arrow.r 0$ and $inf_(B_(1 \/ 2)) s arrow.r 0$. Dropping the favorable Hessian term, the inhomogeneous weak Harnack inequality for nonnegative divergence supersolutions gives $s arrow.r 0$ in measure on interior smaller balls #cite(label("GilbargTrudinger2001")). Fixed radii in this argument can be chosen so as to include any prescribed ball compactly contained in $B_(1 \/ 2)$. We also have $D_x s arrow.r 0$ in $L^1$ locally there. To see the latter claim, test the supersolution inequality by $eta^2 \( b - s \)_(+)$, where $b > 0$ and $eta$ is a compactly supported cutoff. Ellipticity and Young’s inequality give
  #[#set math.equation(numbering: n => "(7.47)")
   $ integral_({ s < b }) eta^2 \| D_x s \|^2 lt.eq C_eta b^2 + o \( 1 \) . $ <g:low-level>]
  The gradient bound and (7.43) already give a uniform local $L^2$ bound for $D_x s$. On ${ s gt.eq b }$, Cauchy’s inequality and convergence in measure therefore give convergence of its $L^1$ integral to zero. On ${ s < b }$ use (7.47), then let $b arrow.b 0$. Testing the full inequality (7.46) by a fixed nonnegative cutoff now yields $H_z arrow.r 0$ locally in $L^2$. Since the scaled Christoffel symbols tend to zero, $D_x^2 z arrow.r 0$ there as well. After subtracting constants, Poincaré’s inequality makes the gradients converge in $L^2$ to a constant vector. Its length is one because $s arrow.r 0$ in measure. The gradient bounds give local uniform convergence of a subsequence to the corresponding affine function.
  It follows that for every sufficiently small prescribed $b_(*) > 0$ there are fixed numbers $0 < r_(*) < k_(*) < 1$ and an error threshold such that one of the following holds:
  #[#set math.equation(numbering: n => "(7.48)")
   $ & sup_(B_(r_(*))) \| nabla z \| lt.eq k_(*) \; #h(2em) upright("or")\
 & sup_(B_(r_(*))) \| z - L \| lt.eq b_(*) r_(*) \, #h(2em) 1 / 2 lt.eq \| D_x L \| lt.eq 2 quad upright("for an affine ") L . $ <g:drop-or-flat>]
  Indeed, fix $r_(*) < 1 \/ 4$. Failure for every $k_(*) < 1$ and every sufficiently small error threshold would give a sequence with gradients approaching length one somewhere in $B_(r_(*))$ and no such affine approximation. The preceding compactness conclusion contradicts this. Increasing $k_(*)$ if necessary ensures $r_(*) < k_(*)$.
  ===== 7.7.3 Improving a nonzero affine approximation. <improving-a-nonzero-affine-approximation.>
  Rescale the affine branch to a unit ball. Suppose
  $ sup_(B_1) \| z - L_1 \| lt.eq b \, #h(2em) 1 / 4 lt.eq \| D_x L_1 \| lt.eq 4 \, $
  the gradient has a fixed bound, and the forcing and scaled geometric errors are at most $b delta$. Set $Y = \( z - L_1 \) \/ b$. The Christoffel contribution of the affine $L_1$ is included in these errors, so $\| A_chi : "Hess" Y \| lt.eq C delta$. Equation (7.43) gives a uniform interior $W^(2 \, p_0)$ bound for $Y$. Let $e_0 = D_x L_1 \/ \| D_x L_1 \|$ be the fixed Euclidean axis. On an interior ball the difference between the actual principal matrix and $I - \( 1 - chi \) e_0 ⊗ e_0$ tends to zero in each finite $L^q$ norm as $b arrow.r 0$, uniformly in the displayed slope range. Indeed $D_x z = D_x L_1 + b D_x Y$, the last term tends to zero in measure, and the coefficient difference is bounded. The small metric error has the same property. The set where $D_x z = 0$ causes no problem: it is contained in the set where $b \| D_x Y \| gt.eq 1 \/ 4$. Choose $q$ by $1 \/ q = 1 \/ 2 - 1 \/ p_0$. Hölder’s inequality then gives
  #[#set math.equation(numbering: n => "(7.49)")
   $ parallel \( Delta_(perp_0) + chi partial_(e_0 e_0) \) Y parallel_(L^2 \( B_(3 \/ 4) \)) lt.eq C delta + o_(b arrow.r 0) \( 1 \) . $ <g:axis-replacement>]
  The coefficient $chi$ remains measurable and spatially variable. The smallness here is uniform for all $b$ below one fixed threshold. Indeed Sobolev embedding bounds $D_x Y$ in $L^(p^(*))$, where $p^(*) = 3 p_0 \/ \( 3 - p_0 \)$. Splitting according to $b \| D_x Y \| lt.eq 1$ gives
  $ parallel B_chi - A_0 parallel_(L^q) lt.eq C b^sigma + C b delta \, #h(2em) sigma = min { 1 \, p^(*) \/ q } > 0 \, $
  where $A_0 = I - \( 1 - chi \) e_0 ⊗ e_0$ and $B_chi$ is the actual coordinate principal matrix. This error need only be below the fixed tolerance for the normalized correction $Y$, not below $b delta$. To track all coordinate terms, write $A_0 = I - \( 1 - chi \) e_0 ⊗ e_0$ and let $B_chi$ be the actual coordinate principal matrix. With $q_L = D_x L_1$, the equation used here is
  $ A_0 : D_x^2 Y = \( A_0 - B_chi \) : D_x^2 Y + G_0 / b + frac(B_chi : Gamma q_L, b) + B_chi : Gamma D_x Y . $
  The notation $B_chi : Gamma q$ means $B_chi^(i j) Gamma_(i j)^k q_k$. The last term is bounded in $L^2$ by $C b delta$, and the other source and connection terms by $C delta$.
  For completeness, the fixed-axis inhomogeneous equation on $B_(3 \/ 4)$ with zero Dirichlet data has a unique $W^(2 \, 2) ∩ W_0^(1 \, 2)$ solution. Write it as $Delta v = f + \( 1 - chi \) partial_(e_0 e_0) v$ and iterate the Dirichlet Laplacian inverse in the norm $parallel Delta v parallel_2$. The convex-ball Hessian inequality
  $ parallel D_x^2 v parallel_2 lt.eq parallel Delta v parallel_2 $
  makes the contraction factor at most $1 - chi_0$. Subtract this solution for the source in (7.49). It has small $W^(2 \, 2)$ norm, hence small uniform norm in dimension three. The remainder $Y_0$ satisfies
  #[#set math.equation(numbering: n => "(7.50)")
   $ Delta_(perp_0) Y_0 + chi partial_(e_0 e_0) Y_0 = 0 $ <g:fixed-axis>]
  and has a uniform $W^(2 \, 2)$ norm.
  This fixed-axis equation has an interior $C^(1 \, alpha_1)$ estimate even for measurable $chi$. To prove it, put $v_1 = partial_(e_0) Y_0$. Distributional differentiation in the distinguished direction gives
  #[#set math.equation(numbering: n => "(7.51)")
   $ Delta_(perp_0) v_1 + partial_(e_0) \( chi partial_(e_0) v_1 \) = 0 . $ <g:directional-divergence>]
  Here $v_1 in W^(1 \, 2)$ and $chi partial_(e_0) v_1 in L^2$; the formula makes no assertion that $partial_(e_0) chi$ exists as a function. De Giorgi’s estimate makes $v_1$ Hölder continuous, with some $0 < alpha_1 < 1$. Caccioppoli applied after subtracting its value at the center gives, on smaller balls,
  $ integral_(B_r) \| D_x v_1 \|^2 lt.eq C r^(1 + 2 alpha_1) . $
  Since $Delta Y_0 = \( 1 - chi \) partial_(e_0) v_1$, its Poisson source $q_0$ satisfies
  $ integral_(B_r) \| q_0 \| lt.eq C r^(2 + alpha_1) . $
  Localize this source in a fixed smaller ball and take its Newton potential. The gradient kernel and its derivative have sizes $C \| x - y \|^(- 2)$ and $C \| x - y \|^(- 3)$. For two points a distance $h$ apart, the near and far annuli therefore bound the gradient difference by
  $ C sum_(r lt.tilde h) r^(alpha_1) + C h sum_(r gt.tilde h) r^(alpha_1 - 1) lt.eq C h^(alpha_1) \, $
  where the sums are over dyadic radii within the fixed ball. The difference between $Y_0$ and this potential is harmonic locally and has uniform interior bounds. This proves the asserted estimate for every component of $D_x Y_0$.
  Choose $0 < alpha_2 < alpha_1$, then a sufficiently small fixed $lambda_0 in \( 0 \, 1 \)$, and finally $delta$ and $b$ sufficiently small. The affine approximation of $Y_0$ at the center, together with the small uniform correction, produces an affine $L_2$ with
  #[#set math.equation(numbering: n => "(7.52)")
   $ sup_(B_(lambda_0)) \| z - L_2 \| lt.eq b lambda_0^(1 + alpha_2) \, #h(2em) \| D_x L_2 - D_x L_1 \| lt.eq C b . $ <g:affine-improvement>]
  More explicitly choose $lambda_0$ so that the $C^(1 \, alpha_1)$ remainder is at most $1 / 2 lambda_0^(1 + alpha_2)$, then make the correction smaller than the same quantity. This also explains the order of the choices.
  ===== 7.7.4 Iteration and the Hessian mass bound. <iteration-and-the-hessian-mass-bound.>
  Choose $b_(*)$ small enough for (7.52) and so that
  $ frac(C b_(*), 1 - lambda_0^(alpha_2)) < 1 / 4 . $
  Then fix the constants in (7.48). If $L_0 + Q_0 = 0$ the conclusion is immediate. Otherwise divide the dependent variable by $L_0 + Q_0$ and start on a sufficiently small uniform spatial scale. At each occurrence of the gradient-drop branch, divide the spatial scale by $r_(*)^(- 1)$ and the gradient normalization by $k_(*)^(- 1)$; equivalently replace $z \( y \)$ by $z \( r_(*) y \) \/ \( r_(*) k_(*) \)$, up to an additive constant. The normalized source is multiplied by $r_(*) \/ k_(*) < 1$. Geometric errors also decrease. If this branch persists, the constant approximants give the required approximation with every $alpha lt.eq log k_(*) \/ log r_(*)$.
  If the affine branch occurs, rescale its ball and iterate (7.52) with errors $b_j = b_(*) lambda_0^(j alpha_2)$. At each step divide the dependent variable by the spatial ratio, preserving the gradient bound, and retain the full affine slope. The total slope drift is less than $1 \/ 4$, so all slopes remain in the range required for the comparison. The forcing and geometric errors shrink as $lambda_0^j$, whereas the required tolerance is $b_(*) lambda_0^(j alpha_2) delta$. Because $alpha_2 < 1$, an initial scale that enforces this relative smallness at entry enforces it at every later step. The same initial choice works after any number of drops, since $r_(*) \/ k_(*) < 1$.
  Thus at each center and all small radii there is an affine approximant with error at most $C \( L_0 + Q_0 \) r^(1 + alpha)$, where
  $ 0 < alpha lt.eq min { alpha_2 \, log k_(*) \/ log r_(*) } < 1 . $
  The ratios of successive scales are fixed and the slopes are bounded. Comparing approximants at successive scales shows convergence of their slopes; comparing approximants on overlapping balls bounds the difference of limiting slopes by $C \( L_0 + Q_0 \) \| x - y \|^alpha$. For a smooth $z$ each limiting slope is $D_x z$ at the center. This gives the first estimate in (7.41). All previous arguments apply to the reflected Lipschitz metric, since its only additional flux error was already included.
  Finally subtract the affine approximant on $B_(2 r)$ and apply the exponent-two estimate (7.43) at scale $r$. Its value error contributes $C \( L_0 + Q_0 \)^2 r^(1 + 2 alpha)$ to the Hessian-square integral. The bounded forcing and the Christoffel term acting on the bounded affine slope contribute at most $C \( L_0 + Q_0 \)^2 r^3$. Since $alpha < 1$, this is bounded by the same claimed power for small $r$. Adding back the Christoffel term proves both versions of the Hessian estimate. ◻
]

=== 7.8 Regularity of the coupled equations <regularity-of-the-coupled-equations>

#thm([Proposition 7.9.])[
  (A priori bootstrap at fixed parameters).  #emph[Fix the prepared data, the selected reduced domain and collars, and all deformation parameters, including $n$ and $epsilon$. Consider smooth solutions of the homotopy equations on sufficiently large finite truncations, on the side $t gt.eq - epsilon$ of the floor. The bounds for $f \, Z \, t \, \| nabla f \|$ established above imply uniform local classical estimates, including at the inner and outer boundary faces, through each prescribed finite order. Constants are uniform over the homotopy and the truncations and may depend arbitrarily on the fixed deformation parameters. In particular they are not asserted to be uniform as $n arrow.r oo$.]
] <g:regularity>

#proof[
  Use uniform patches on the compact core and on the end, including boundary normal patches. Boundary components carrying different conditions are separated; the patches are chosen to meet at most one face. At every stage the trace equation is
  #[#set math.equation(numbering: n => "(7.53)")
   $ A_chi : "Hess" f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] F - "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] . $ <g:trace-normalized>]
  On the bounded variable range, $l \/ sqrt(D)$ is bounded below and $chi$ has a positive lower bound at fixed parameters. The right side is bounded, and the face values of $f$ are componentwise constant. Lemma 27 consequently gives a uniform Hölder bound for $D_x f$ and
  #[#set math.equation(numbering: n => "(7.54)")
   $ integral_(B_r) \| D_x^2 f \|^2 thin upright(d) x lt.eq C r^(1 + 2 alpha) . $ <g:f-hessian-measure>]
  ===== 7.8.1 The second equation as an equation with a controlled measure. <the-second-equation-as-an-equation-with-a-controlled-measure.>
  Write its coordinate divergence form as
  #[#set math.equation(numbering: n => "(7.55)")
   $ "div"_x \( a_0 D_x Z + b_0 \) = e_0 \, #h(2em) \| e_0 \| lt.eq C \( 1 + \| D_x Z \|^2 + \| D_x^2 f \|^2 \) . $ <g:Z-divergence>]
  Here $a_0$ includes the volume density and the principal tensor $4 u A_chi$; it is bounded, symmetric and uniformly elliptic. The bounded flux summand $b_0$ includes the prescribed homotopy drift. The expression for $t$ is smooth in $\( x \, Z \, D_x f \)$ on the bounded range. Its first derivatives are bounded by $C \( 1 + \| D_x Z \| + \| D_x^2 f \| \)$, and the tensor expression for $cal(T)$ is smooth and quadratic in these derivatives. These facts prove the displayed growth bound, including where $D_x f = 0$.
  For a flux face, flatten the boundary and reflect $Z$ evenly. For the separate outer Dirichlet face, reflect $Z$ oddly after subtracting its constant value. If $S_0$ is Euclidean reflection in the flattened plane, reflect $a_0$ as $S_0 a_0 S_0$ in both cases. Reflect $b_0$ as $S_0 b_0$ in the even case and as $- S_0 b_0$ in the odd case. For the even extension the bounded prescribed conormal flux gives a bounded plane density in the divergence. For the odd extension the normal component of the total flux agrees on the two sides, so there is no plane source. The smooth solution on each closed side justifies these distributional formulas directly. By (7.54), the extended equation has a signed measure right side obeying
  #[#set math.equation(numbering: n => "(7.56)")
   $ \| e_0 \| lt.eq C \( 1 + \| D_x Z \|^2 \) thin upright(d) x + mu_0 \, #h(2em) mu_0 \( B_r \) lt.eq C r^(1 + beta) \, #h(2em) 0 < beta lt.eq min { 2 alpha \, 1 } \, $ <g:measure-growth>]
  where $mu_0$ is a positive measure. The upper restriction $beta lt.eq 1$ includes the $O \( r^2 \)$ mass of a bounded plane density.
  ===== 7.8.2 An exponential transformation and oscillation decay. <an-exponential-transformation-and-oscillation-decay.>
  Let $cal(L)_0 = - "div"_x \( a_0 D_x \)$ and $V_plus.minus = e^(plus.minus k Z)$. Since $Z$ is bounded, these functions and their reciprocals have fixed bounds for any fixed $k$. The product rule in (7.55) gives
  #[#set math.equation(numbering: n => "(7.57)")
   $ cal(L)_0 V_plus.minus =  & "div"_x \( plus.minus k V_plus.minus b_0 \) minus.plus k V_plus.minus e_0\
 & - k^2 V_plus.minus \( a_0 D_x Z + b_0 \) dot.op D_x Z lt.eq "div"_x F_plus.minus + C \( upright(d) x + mu_0 \) \, #h(2em) \| F_plus.minus \| lt.eq C . $ <g:exponential>]
  Indeed the negative term containing $k^2 a_0$ absorbs the $C k \| D_x Z \|^2$ term from (7.56) when $k$ is fixed sufficiently large; Young’s inequality absorbs the bounded-drift cross term. Products with the plane measure are legitimate because $Z$ is continuous across the reflecting plane.
  On a ball $B_h$ in the extended patch solve the zero Dirichlet problem
  $ cal(L)_0 w_plus.minus = "div"_x F_plus.minus + C \( upright(d) x + mu_0 \) . $
  Its solution satisfies
  #[#set math.equation(numbering: n => "(7.58)")
   $ parallel w_plus.minus parallel_oo lt.eq epsilon_h := C \( h + h^beta \) . $ <g:green-correction>]
  For the bounded divergence field, the scaled vector-source estimate with any exponent greater than three gives the term $C h$. For the positive measure, the Dirichlet Green function of a bounded measurable uniformly elliptic divergence operator in dimension three has upper bound $C \| x - y \|^(- 1)$ #cite(label("LittmanStampacchiaWeinberger1963")). If necessary extend coefficients to a doubled ball before using that bound. The growth in (7.56) yields
  $ sup_x integral_(B_h) \| x - y \|^(- 1) thin upright(d) mu_0 \( y \) lt.eq C sum_(j gt.eq 0) \( 2^(- j) h \)^beta lt.eq C h^beta . $
  The volume source has the smaller bound $C h^2$. Existence in $W_0^(1 \, 2)$ may be seen by smoothing the restricted positive measure with its uniform ball-growth bound, using these uniform sup estimates, and passing to a limit. Testing the smooth problems by their solutions bounds the energies, since the measure term is at most the sup norm times its total mass and the vector term is controlled by Cauchy’s inequality. This also justifies the correction for a measure source.
  Equation (7.57) now shows that
  $ S_plus.minus = sup_(B_h) V_plus.minus - V_plus.minus + w_plus.minus + epsilon_h $
  are nonnegative weak supersolutions of $cal(L)_0$. Write $M_h = sup_(B_h) Z$ and $m_h = inf_(B_h) Z$. On the bounded range of $Z$, the positive exponential deficit is uniformly comparable to $M_h - Z$, and the negative exponential deficit to $Z - m_h$. At each point their ordinary counterparts add to $M_h - m_h$. Therefore one of the two exponential deficits is at least a fixed multiple of $M_h - m_h$ on at least half of $B_(h \/ 2)$. Weak Harnack applied to that $S_plus.minus$, and then (7.58), bounds the corresponding deficit below throughout $B_(h \/ 4)$ by $c \( M_h - m_h \) - C epsilon_h$. In the positive case this lowers the upper value of $Z$; in the negative case it raises the lower value. Consequently
  #[#set math.equation(numbering: n => "(7.59)")
   $ "osc"_(B_(h \/ 4)) Z lt.eq \( 1 - c \) "osc"_(B_h) Z + C \( h + h^beta \) . $ <g:oscillation-decay>]
  Iteration gives a uniform $C^(0 \, theta)$ bound for some $theta > 0$. The same proof in the reflected charts gives the estimate to both kinds of boundary face.
  ===== 7.8.3 Absorption of the quadratic gradient term and bootstrap. <absorption-of-the-quadratic-gradient-term-and-bootstrap.>
  Now $Z$ and $D_x f$ are Hölder continuous, and all coefficients of (7.53) are smooth functions of those variables and $x$. Interior and Dirichlet Schauder estimates give a uniform $C^(2 \, alpha')$ bound for $f$, for some $alpha' > 0$. Expand (7.55) on the original, unreflected patches. The principal coefficients are Hölder continuous, and the right side is bounded in absolute value by $C \( 1 + \| D_x Z \|^2 \)$, since $D_x^2 f$ is now bounded. On an inner face $d f$ is normal; hence $A_chi$ preserves the normal direction, and its positive normal eigenvalue converts the prescribed conormal flux into
  $ partial_nu Z = cal(G) \( x \, Z \, f \, D_x f \) \, $
  where $cal(G)$ is smooth on the bounded range. The outer condition is Dirichlet. There is no junction of these conditions within a patch.
  Fix an exponent $p > 3$. The local linear $W^(2 \, p)$ estimate for these Hölder principal coefficients follows by freezing coefficients and absorption, using the usual Dirichlet or normal-derivative estimate at a smooth face #cite(label("AgmonDouglisNirenberg1959")) #cite(label("GilbargTrudinger2001")). On nested uniform patches $U subset.double U'$ it gives
  #[#set math.equation(numbering: n => "(7.60)")
   $ parallel Z parallel_(W^(2 \, p) \( U \)) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + parallel D_x Z parallel_(L^(2 p) \( U' \))^2 + parallel Z parallel_(W^(1 \, p) \( U' \)) #scale(x: 120%, y: 120%)[\)] . $ <g:W2p-preabsorption>]
  For the boundary term, extend the smooth composition $cal(G)$ into a collar. Its $W^(1 \, p)$ norm is bounded by $C \( 1 + parallel Z parallel_(W^(1 \, p)) \)$ because $f$ is already $C^(2 \, alpha')$. The trace theorem then bounds its required $W^(1 - 1 \/ p \, p)$ norm and explains the last term in (7.60).
  The existing positive Hölder modulus makes the quadratic term absorbable. On a ball or boundary half-ball of radius $h_0$, subtract a constant from $Z$. First derivative interpolation, including the scaled lower-order term #cite(label("Nirenberg1959")), gives
  #[#set math.equation(numbering: n => "(7.61)")
   $ parallel D_x Z parallel_(2 p)^2 lt.eq C "osc" Z thin parallel D_x^2 Z parallel_p + C h_0^(3 \/ p - 2) \( "osc" Z \)^2 . $ <g:quadratic-interpolation>]
  No homogeneous normal boundary condition is needed for this interpolation. In a flattened half-patch, choose $c in \[ inf Z \, sup Z \]$ and extend $u = Z - c$ by $E u \( x' \, - t \) = 3 u \( x' \, t \) - 2 u \( x' \, 2 t \)$ on a smaller collar and cut off on a larger patch. Its value and first normal derivative match across the face, its sup norm is at most $5 "osc" Z$, and its $W^(2 \, p)$ norm has the usual bounded extension estimate after scaling. Whole-space interpolation yields Equation (7.61), including its lower-order scaled term. The fixed smooth charts change only the constants. The oscillation on each such patch is at most $C h_0^theta$. Cover $U'$ by these smaller patches with bounded overlap, using a slightly enlarged patch for each interpolation estimate. Sum their estimates in $ell^p$. This bounds the quadratic term by $C h_0^theta parallel D_x^2 Z parallel_p + C \( h_0 \)$ on a slight enlargement. Ordinary interpolation treats the $W^(1 \, p)$ term in the same fashion. Take the supremum of the resulting $W^(2 \, p)$ norms over patches of one fixed size throughout the truncation. Each enlargement is covered by a bounded number of other patches, independently of the truncation radius. This supremum is finite for each smooth solution on its finite truncation. Choose $h_0$ once so that the coefficient of the supremum on the right is less than one half and absorb it. We obtain a uniform $W^(2 \, p)$ bound for $Z$ and hence a uniform $C^(1 \, theta')$ bound for some $theta' > 0$.
  Schauder estimates for the trace equation and then the expanded second equation, with their respective boundary conditions, now increase regularity successively. At each step the source of the second equation uses at most second derivatives of $f$, which have already been controlled by the preceding trace estimate. Iteration reaches every required finite order, with constants depending on that order and the fixed parameters. The construction uses smooth three-dimensional patches also at the rotational axis, so no singular orbit-coordinate estimate is required. ◻
]

=== 7.9 Solving the coupled equations <e:solve>

The estimates proved so far concern solutions on the allowed side of the floor. To construct the compact map, we first solve the trace equation for arbitrary bounded input $Z$; this step must not assume $t gt.eq - epsilon$. Fix $n$, a sufficiently large finite truncation $Omega_R$, a homotopy parameter, and $0 < b_(upright("reg")) < 1$.

#thm([Lemma 7.10.])[
  (The scalar Dirichlet solve without a floor).  #emph[For every invariant $Z in C^(1 \, b_(upright("reg"))) \( overline(Omega)_R \)$ with outer value zero, the trace equation at the current homotopy stage has a unique solution with its assigned Dirichlet data. The solution operator is continuous into $C^(2 \, b_(upright("reg")))$, also in the homotopy parameter, and maps bounded input sets to bounded subsets of $C^(3 \, b_(upright("reg")))$. No lower bound for the implicitly defined $t$ is required.]
] <e:trace-solve>

#proof[
  We first work with smooth input $Z$ and obtain estimates depending only on its $C^(1 \, b_(upright("reg")))$ norm. Approximation will then give the asserted solve for general inputs in that space. Write the normalized trace equation as
  #[#set math.equation(numbering: n => "(7.62)")
   $ A_chi : nabla^2 f = G_f \, #h(2em) G_f = sqrt(D) / l \( F - "tr"_(A_chi) K \) . $ <e:normalized-trace>]
  Here $F$ includes the modification appropriate to the current stage. For an auxiliary parameter $s in \[ 0 \, 1 \]$, interpolate between this equation and $Delta f = tau_0 f$:
  #[#set math.equation(numbering: n => "(7.63)")
   $ A^(\( s \)) : nabla^2 f = G^(\( s \)) \, #h(2em) A^(\( s \)) = \( 1 - s \) I + s A_chi \, #h(2em) G^(\( s \)) = \( 1 - s \) tau_0 f + s G_f . $ <e:scalar-interpolation>]
  Keep the current boundary values throughout this interpolation. At zero gradient $A_chi = I$ and $"tr"_(A_chi) K = "tr" K$. The strict monotonicity of $F$ in $h$ therefore gives a uniform height bound by the maximum principle, for every $s$ and every bounded input set.
  We next establish a global gradient bound for this scalar interpolation. If $Z$ is bounded and $sigma arrow.r oo$, then $t arrow.r - oo$. In that range $p = n$ and $l = e^(n t)$, and the defining relation between $t$ and $Z$ is exactly
  #[#set math.equation(numbering: n => "(7.64)")
   $ e^(8 Z) = e^(8 t) + e^(\( 2 n + 8 \) t) sigma^2 . $ <e:nofloor-identity>]
  It follows, uniformly for bounded $Z$, that
  $ d asymp sigma^(- 8 \/ \( n + 4 \)) \, #h(2em) chi asymp sigma^(- 8 \/ \( n + 4 \)) \, #h(2em) sqrt(D) / l asymp sigma . $
  Because $n > 4$, the exponent $8 \/ \( n + 4 \)$ is less than one. On the entire bounded-height range we consequently have
  #[#set math.equation(numbering: n => "(7.65)")
   $ chi gt.eq frac(c, 1 + sigma) \, #h(2em) \| G_f \| lt.eq C \( 1 + sigma \) . $ <e:nofloor-structure>]
  The same inequalities hold for the longitudinal eigenvalue $chi^(\( s \)) = 1 - s + s chi$ and the right side $G^(\( s \))$, with uniform constants. The two transverse eigenvalues remain exactly one.
  Let $r_0$ be distance from a boundary component in a fixed smooth collar, and set
  #[#set math.equation(numbering: n => "(7.66)")
   $ psi \( r_0 \) = 1 / k log \( 1 + B_0 r_0 \) \, #h(2em) psi'' = - k \( psi' \)^2 . $ <e:log-barrier>]
  Use $f_(upright("face")) + psi$ as an upper barrier and $f_(upright("face")) - psi$ as a lower barrier. At a possible contact their gradient has length $q' = psi'$, and the longitudinal second derivative has magnitude $k \( q' \)^2$. By (7.65), its signed contribution dominates all forcing and collar-curvature terms:
  $ chi^(\( s \)) psi'' + O \( q' \) lt.eq - frac(k c \( q' \)^2, 1 + q') + C q' . $
  Choose $k$ large relative to the structural constants, then a collar width $delta'$ small enough that $1 \/ \( 2 k delta' \)$ exceeds the required slope threshold. Finally choose $B_0 delta' gt.eq 1$ so large that $psi \( delta' \)$ exceeds the height oscillation. Throughout the collar $psi' gt.eq 1 \/ \( 2 k delta' \)$, so the differential inequalities have strict sign; height monotonicity rules out a positive comparison maximum. This proves
  #[#set math.equation(numbering: n => "(7.67)")
   $ \| f - f_(upright("face")) \| lt.eq psi \( r_0 \) quad \( 0 lt.eq r_0 lt.eq delta' \) . $ <e:log-boundary>]
  The assigned values are constant on each face, and $delta'$ can be chosen below the separation of distinct boundary components.
  For the interior estimate maximize
  $ f \( x \) - f \( y \) - psi \( "dist" \( x \, y \) \) $
  over pairs at distance at most $delta'$. The distance may be computed in a fixed smooth extension of the metric; choose $delta'$ below its uniform injectivity radius. Pairs with one point on the boundary are controlled by (7.67), since the distance to that boundary component is no greater than the pair distance. Pairs at distance $delta'$ are controlled by $psi \( delta' \) gt.eq "osc" f$. A positive maximum would therefore occur at an interior pair with $r_0 = "dist" \( x \, y \) > 0$. The two gradients there are parallel transports of the common vector of length $q' = psi' \( r_0 \)$. Simultaneous variations in parallel transverse directions, using parallel trial fields in the second variation of distance, give
  $ "tr"_perp nabla^2 f \( x \) - "tr"_perp nabla^2 f \( y \) lt.eq C r_0 q' . $
  Separate longitudinal variations give
  $ nabla^2 f \( x \) \( e \, e \) lt.eq psi'' \, #h(2em) nabla^2 f \( y \) \( e \, e \) gt.eq - psi'' . $
  Subtracting (7.63) at the two points yields
  $ - 2 C \( 1 + q' \) & lt.eq G^(\( s \)) \( x \) - G^(\( s \)) \( y \)\
 & lt.eq C r_0 q' + \( chi_x^(\( s \)) + chi_y^(\( s \)) \) psi''\
 & lt.eq C r_0 q' - frac(2 k c \( q' \)^2, 1 + q') . $
  Our choices of $k$ and the lower threshold for $q'$ make this impossible. Notice that the two longitudinal eigenvalues need not coincide or have a known modulus of continuity. Thus $\| f \( x \) - f \( y \) \| lt.eq psi \( "dist" \( x \, y \) \)$ for nearby pairs, proving a global Lipschitz bound on each bounded input set.
  The interpolation is now uniformly elliptic. Lemma 27 applies to its axial matrix and bounded forcing, first giving a positive Hölder modulus for $nabla f$. Schauder estimates give $C^(2 \, theta)$ and then, by differentiating after this first gain, $C^(2 \, b_(upright("reg")))$ and $C^(3 \, b_(upright("reg")))$ bounds. More explicitly, the first differentiated estimate gives $C^(3 \, min \( theta \, b_(upright("reg")) \))$; hence $nabla f$ is Lipschitz, allowing the original coefficients to be estimated in $C^(b_(upright("reg")))$, followed by the stated full exponent. All these bounds are uniform in $s$.
  For fixed input $Z$, the principal matrix is independent of the height $f$, while
  $ partial_f G^(\( s \)) = \( 1 - s \) tau_0 + s sqrt(D) / l tau_0 partial_h F > 0 . $
  The linearized Dirichlet operator thus has strictly negative zeroth-order coefficient when written with everything on the left. The maximum principle and linear elliptic Dirichlet theory make it invertible #cite(label("GilbargTrudinger2001")). Starting at $Delta f = tau_0 f$, openness follows from the implicit function theorem, and the bounds above give closedness. This proves existence for $s = 1$. At a positive maximum of the difference of two solutions, their gradients and principal matrices agree, while strict height monotonicity contradicts the Hessian inequality; this proves uniqueness.
  For a general $C^(1 \, b_(upright("reg")))$ input, choose smooth invariant inputs $Z_j$ with the same zero outer data, uniformly bounded in $C^(1 \, b_(upright("reg")))$, and converging in $C^(1 \, b')$ for every $b' < b_(upright("reg"))$. Such an approximation follows by extension and smoothing in boundary charts, correction of the outer trace, and averaging under the circle action. Convergence in the full $C^(1 \, b_(upright("reg")))$ norm is neither asserted nor needed. The smooth scalar solutions have the uniform $C^(3 \, b_(upright("reg")))$ bounds just proved. Compact embedding gives a subsequence converging in $C^(2 \, b_(upright("reg")))$ to a solution for $Z$; the third-derivative Hölder seminorm bound passes to the limit by lower-exponent compactness. Uniqueness identifies this limit and removes dependence on the approximation. Finally, for any convergent sequence of actual inputs in $C^(1 \, b_(upright("reg")))$, the same compactness and uniqueness argument gives continuous $C^(2 \, b_(upright("reg")))$ dependence, also at the matching endpoints of the four homotopy stages. Symmetry follows from uniqueness. ◻
]

#thm([Proposition 7.11.])[
  (Existence on the reduced exterior).  #emph[At each sufficiently large fixed $n$ there is a smooth invariant physical solution of (7.6)–(7.19) on the reduced exterior, with its prescribed inner conditions and $t gt.eq - epsilon$. It is the local smooth limit of solutions on expanding truncations.]
] <e:existence>

#proof[
  Use the Banach space $X_R$ of invariant $C^(1 \, b_(upright("reg"))) \( overline(Omega)_R \)$ functions with outer value zero. For each input $Z$, solve the trace equation by Lemma 29. Compute $t \, u \, A_chi \, Xi$ and all boundary expressions from this input and its solved $f$. Freeze them, replacing only the differentiated $Z$ in the principal flux by the output unknown $tilde(Z)$. In the first three stages, for example, the linear problem is
  $ "div" #scale(x: 120%, y: 120%)[\(] 4 u A_chi nabla tilde(Z) + u A_chi lambda K \( w \, dot.op \) #scale(x: 120%, y: 120%)[\)] = u Xi \, $
  with the prescribed frozen inner flux and zero outer Dirichlet value. The fourth stage uses its stated simultaneous source and boundary scaling.
  On bounded input sets the coefficients are uniformly elliptic. The nonempty outer Dirichlet face makes this mixed problem coercive; there is no flux compatibility condition. Its coefficients, drift, and inner flux data are at least $C^(1 \, b_(upright("reg")))$, and its source is at least $C^(0 \, b_(upright("reg")))$. Linear boundary regularity therefore bounds the output in $C^(2 \, b_(upright("reg")))$ #cite(label("AgmonDouglisNirenberg1959")) #cite(label("GilbargTrudinger2001")). Together with continuous dependence of the scalar solve, this defines a continuous compact map $T_s : X_R arrow.r X_R$, continuous in the full homotopy parameter $s$. The derivative count is worth specifying: $f in C^(3 \, b_(upright("reg")))$ and $Z in C^(1 \, b_(upright("reg")))$ imply that $t$, $u A_chi$ and the drift are $C^(1 \, b_(upright("reg")))$, while the quadratic expression $cal(T)$ is $C^(0 \, b_(upright("reg")))$. Uniqueness of both solves preserves invariance. At a fixed point, $Z in C^(2 \, b_(upright("reg")))$ and $f in C^(3 \, b_(upright("reg")))$ initially. Then the frozen coefficients improve to $C^(2 \, b_(upright("reg")))$ and the source to $C^(1 \, b_(upright("reg")))$, giving $Z in C^(3 \, b_(upright("reg")))$; the trace solve next gives $f in C^(4 \, b_(upright("reg")))$. Repeating this triangular bootstrap makes each fixed point smooth. Proposition 28 supplies the uniform classical bounds for these smooth fixed points.
  Let $t_s \[ Z \]$ denote the value of $t$ after the scalar solve and define the relatively open subset of $\[ 0 \, 1 \] times X_R$
  $ cal(O) = { \( s \, Z \) : t_s \[ Z \] > - epsilon upright(" on ") overline(Omega)_R \, quad parallel Z parallel_(X_R) < M } . $
  Choose $M$ larger than the fixed-point bound supplied by Proposition 26 and Proposition 28. Lemma 22 excludes fixed points on the floor boundary; the classical estimates exclude them on the norm boundary. Fixed points in the closure of $cal(O)$ form a compact set, because the homotopy maps bounded sets to relatively compact sets. Leray–Schauder degree is therefore invariant on the moving sections $cal(O)_s$ #cite(label("LeraySchauder1934")). One way to see the minor moving-domain point is to cover this compact fixed-point set by finitely many product neighborhoods lying in $cal(O)$, subdivide the parameter interval accordingly, and apply homotopy invariance and excision on those fixed neighborhoods. No control of $T_s$ on unbounded input sets is needed.
  At the terminal endpoint the trace comparison gives $f = 0$, and the linear second solve has identically zero output. The zero input is interior to $cal(O)_1$, so its degree is one. The physical endpoint consequently has a fixed point with $t > - epsilon$. For this fixed $n$, let $R arrow.r oo$ through the admissible truncations. The estimates of Propositions 26 and 28 are uniform on every compact subset, including inner-boundary charts. A diagonal subsequence converges smoothly there, giving the asserted physical solution and the limiting bound $t gt.eq - epsilon$. ◻
]

=== 7.10 End asymptotics and the energy flux <e:flux-section>

#thm([Lemma 7.12.])[
  (Asymptotics at fixed deformation parameter).  #emph[At fixed $n$, the solution of Proposition 30 has exponentially decaying $f$, with derivatives through every required finite order, and 
$ Z \, t = O_2 \( r^(- 1) \) . $

 In particular $hat(g) = e^(4 t) \( g + l^2 upright(d) f^2 \)$ is asymptotically flat of order one. Its energy is 
#[#set math.equation(numbering: n => "(7.68)")
 $ E_(hat(g)) = E_g - frac(frak(F)_n, 8 pi) \, #h(2em) frak(F)_n = lim_(R arrow.r oo) integral_(S_R) V_nu = integral_(Omega_(upright("red"))) u Xi + integral_B V_nu . $ <e:energy-flux>]

]
] <e:asymptotics>

#proof[
  Beyond the support of $K \, C \, D_0 \, D_1$, the trace equation is
  $ A_chi : nabla^2 f = tau_0 sqrt(D) / l f . $
  On the bounded variable range at fixed $n$ its principal matrix is uniformly elliptic and its height coefficient has a positive lower bound. Slowly decaying exponentials $C e^(- c \( r - r_(*) \))$ are positive supersolutions for the operator obtained by moving the height term to the left, if $c > 0$ is small. Choose $C$ to dominate the data on $r = r_(*)$. The zero outer data allow the same barriers on every truncation; applying them to both signs and then exhausting gives exponential decay of $f$. For the derivative assertion, freeze the coefficients in this homogeneous linear equation along the solution. Proposition 28 bounds their $C^m$ norms on uniform unit patches, independently of $R$, for every fixed finite $m$. Local homogeneous estimates therefore give $parallel f parallel_(C^(j \, alpha) \( B_1 \)) lt.eq C \( n \, j \) parallel f parallel_(C^0 \( B_2 \))$; on outer half-patches the same estimate uses the zero Dirichlet condition. Each finite $j$ requires only finitely many of the already bounded coefficient derivatives. Thus every required derivative of $f$ decays exponentially; no decay of the derivatives of $Z$ is needed at this step.
  For clarity, put $E = t - Z = - 1 / 8 log D$. Then $E$, $D - 1$, $v$, $A_chi - I$, and their required derivatives are $O_n \( e^(- 2 c r) \)$, while $w \, H^f \, F = O_n \( e^(- c r) \)$ with derivatives. The tensor expression for $cal(T)$ consequently gives
  $ cal(T) = 4 \[ p \( Z \) + 1 \] \| upright(d) Z \|^2 + O_n \( e^(- 2 c r) \) . $
  Every remaining term contains two factors from $H^f \, F \, w$, or a graph error multiplying bounded derivatives of $Z$. In particular, $u - L \( Z \)$ and $p \( t \) - p \( Z \)$ have the same exponential bound, and
  $ V = 4 L \( Z \) nabla Z + E_V \, #h(2em) "div" E_V = O_n \( e^(- 2 c r) \) . $
  Here the divergence uses only the radius-uniform unit-patch bound on $nabla^2 Z$. The height term $tau_0 a sigma$ and the penalty term $v rho_1$ are exponentially small as well. There are no persistent $K$ terms, since $K$ vanishes on this end; derivatives of the profiles have bounded fixed-$n$ coefficients and multiply the stated graph errors. Consequently the end divergence equation takes the form
  #[#set math.equation(numbering: n => "(7.69)")
   $ Delta Z + #scale(x: 120%, y: 120%)[\[] p \( Z \) + 2 - delta_0 \( p \( Z \) + 1 \) #scale(x: 120%, y: 120%)[\]] \| nabla Z \|^2 = O \( r^(- 4) \) . $ <e:end-Z-equation>]
  This also holds on the truncations, with uniform constants. More precisely, the right side is
  $ 1 / 4 rho - 1 / 4 C_n m_0 \( Z \) rho_0 + O_n \( e^(- 2 c r) \) \, $
  which is $O \( r^(- 4) \)$ without any prior decay estimate for $Z$.
  Put $b \( z \) = p \( z \) + 2 - delta_0 \( p \( z \) + 1 \)$ and choose $Phi \( 0 \) = 0$, $Phi' \( z \) = exp \( integral_0^z b \( q \) thin upright(d) q \)$. On the bounded solution range, $Phi'$ and its reciprocal are bounded. Then $Y = Phi \( Z \)$ satisfies $Delta Y = O \( r^(- 4) \)$. For $0 < eta < 1$, the positive function $r^(- 1) - r^(- 1 - eta)$ has Laplacian $- eta \( 1 + eta \) r^(- 3 - eta) + O \( r^(- 4) \)$ in the AF metric. Multiples of this function dominate both the source and the bounded inner-end data, and are positive at the zero outer Dirichlet face. Comparison on the truncations proves $Y = O \( r^(- 1) \)$, hence $Z = O \( r^(- 1) \)$ after exhaustion.
  The penalty therefore vanishes sufficiently far out. In the transformed equation the remaining nonexponential terms have smooth weight coefficients of order $- 4$ and bounded smooth factors in $Z$. On rescaled annuli, a $W^(2 \, p)$ estimate with $p > 3$ first bounds the rescaled gradient and its Hölder modulus. Schauder estimates then bound the rescaled second derivatives. The exponentially small graph errors are controlled in these estimates by the unit-patch bounds of every required finite order. This yields $Z \, t = O_2 \( r^(- 1) \)$.
  It follows that $"div" V = u Xi$ is integrable and $V = 4 nabla t + O \( r^(- 3) \)$. The divergence theorem on $Omega_R$ gives
  $ integral_(S_R) V_nu = integral_(Omega_R) u Xi + integral_B V_nu \, $
  because the outward normal of $Omega_R$ on $B$ is $- nu$. This proves existence of the flux limit. The graph term has exponentially decaying ADM contribution. For the conformal factor $e^(4 t)$ the ADM change is $- \( 2 pi \)^(- 1) lim integral_(S_R) partial_nu t$, which is precisely $- frak(F)_n \/ \( 8 pi \)$. This proves (7.68). ◻
]

#thm([Proposition 7.13.])[
  (Vanishing negative flux).  #emph[With the prepared data and $epsilon > 0$ fixed, 
$ frak(F)_n gt.eq - o_n \( 1 \) \, #h(2em) E_(hat(g)) lt.eq E_g + o_n \( 1 \) quad upright("as ") n arrow.r oo . $

]
] <e:flux>

#proof[
  At the physical endpoint, (7.34) bounds the negative inner flux by $C \( tau_0 \/ ell \) integral_B L$. Apply (7.33) with a cutoff equal to one near $B$. Since $rho$ is bounded below on the collars,
  $ 1 + sqrt(cal(T)) lt.eq C \( rho + delta_0 cal(T) \) $
  there. As $Pi_n tau_0 \/ ell arrow.r 0$, this cost absorbs into, for example, half of the positive bulk integral of $u \( rho + delta_0 cal(T) \)$. These are polynomial estimates; none of the arbitrary fixed-$n$ regularity constants enters this absorption.
  On the penalty support, $- epsilon lt.eq t lt.eq - epsilon + 1 \/ n$, so $l$ and $L$ are comparable to $ell$. Directly from the definitions,
  #[#set math.equation(numbering: n => "(7.70)")
   $ u lt.eq C \( ell + ell^2 sigma \) \, #h(2em) u v lt.eq C ell^2 sigma \, #h(2em) u a sigma = L l sigma^2 gt.eq c ell^2 sigma^2 . $ <e:penalty-sizes>]
  Therefore
  $ u m_0 cal(P) lt.eq Pi_n #scale(x: 120%, y: 120%)[\[] ell rho_0 + ell^2 sigma \( rho_0 + rho_1 \) #scale(x: 120%, y: 120%)[\]] . $
  Young’s inequality against the remaining positive $delta_0 tau_0 u a sigma$ term yields
  #[#set math.equation(numbering: n => "(7.71)")
   $ u m_0 cal(P) lt.eq frac(delta_0 tau_0, 2) u a sigma + Pi_n [ell rho_0 + ell^2 / tau_0 \( rho_0^2 + rho_1^2 \)] . $ <e:penalty-absorption>]
  The displayed remainder has vanishing total integral. Indeed $rho_0 asymp r^(- 4)$ is integrable, $rho_0^2$ is integrable, and $rho_1^2 asymp r^(- 4 gamma)$ is integrable in dimension three because $gamma > 3 \/ 4$. Finally
  $ ell = e^(- n epsilon) \, #h(2em) tau_0 / ell = ell^(1 \/ 2) \, #h(2em) ell^2 / tau_0 = ell^(1 \/ 2) \, $
  so both small factors dominate every polynomial loss in $n$. Insert these bounds in (7.68) to obtain the proposition. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 18.] At the physical endpoint $F = tau_0 f + C$, whence $w \( F \) = tau_0 a sigma + w \( C \)$. Substituting (7.19) into (7.8) shows that the remainder after $8 pi \( mu + J_0 \( w \) \)$ is
  $ \( 1 - delta_0 \) cal(T) + \( 1 - delta_0 \) tau_0 a sigma + m_0 cal(P) + w \( C \) - F "tr" K - rho . $
  The first three terms are nonnegative, and the height and offset bounds give
  $ w \( C \) - F "tr" K - rho gt.eq - \| nabla C \| - \| F "tr" K \| - rho gt.eq - frak(m) \/ 2 . $
  This is the scalar-curvature conclusion of the theorem. Combining the physical boundary condition with (7.13) gives $H + 4 partial_nu t = - N_B$, so
  $ H_(hat(g)) = - e^(- 2 t) sqrt(d) thin N_B < 0 . $
  The metric inequality $hat(g) gt.eq e^(- 4 epsilon) g$ guarantees completeness with the inner boundary included. Lemma 31 supplies the required end regularity and finite energy, and Proposition 32 supplies its upper bound. All choices respect axial invariance. The limits are taken in the order established above: fix the prepared data, selected domains, cutoff shapes and $epsilon$; choose large $n$ and form its profiles; solve and exhaust $R$ at that fixed $n$; then let $n arrow.r oo$ in the scalar energy estimate. No convergence of the deformation metrics as $n arrow.r oo$ is needed. ◻
]

== 8 The stationary adjoint at nondegenerate equality <j:section>

Assume equality in Theorem 2 and the strict area branch. Throughout this section, $g \, k$ denote the #emph[polarized] metric and tensor of Equation (3.9). Write

$ R_0 = sqrt(frac(A, 4 pi)) \, #h(2em) M = m \, #h(2em) kappa = b / R_0^2 > 0 \, $

where the subextremal parameters are those of Lemma 9, evaluated at $R = R_0$. Thus $g = h + X^2 upright(d) phi.alt^2$, and $H + "tr"_S k = 0$. We write $D_i$ for the three rows of $cal(D)_X$, and set

$ \( h_1 \, h_2 \, h_3 \) = \( 1 \, 1 \, 2 \) \, #h(2em) e = X^(- 1) eta . $

The numbers $h_i$ here are weights, distinct from the meridional metric $h$.

#thm([Proposition 8.1.])[
  (Stationary adjoint).  #emph[There are smooth invariant fields $N \, Y$ on the polarized exterior, with $Y$ meridional, such that 
#[#set math.equation(numbering: n => "(8.1)")
 $ N gt.eq \| Y \|_g \, #h(2em) N > 0 med upright("in ") "int" Omega \, #h(2em) "sym" nabla Y = - N k . $ <j:causal>]

 For every $q' in \( 1 \/ 2 \, 1 \)$, their asymptotics are 
#[#set math.equation(numbering: n => "(8.2)")
 $ N = 1 + O_2 \( r^(- q') \) \, #h(2em) Y = O_2 \( r^(- 2) \) . $ <j:asymptotic>]

 At the inner boundary, with $nu$ directed into the exterior, 
#[#set math.equation(numbering: n => "(8.3)")
 $ Y = N nu \, #h(2em) partial_nu N + k \( Y \, nu \) = kappa . $ <j:boundary>]

 Furthermore, either $N \|_S > 0$ everywhere or $N \|_S equiv 0$.]
  #emph[On regular orbits in the interior, define 
#[#set math.equation(numbering: n => "(8.4)")
 $ H_3 = - N^2 upright(d) t_0^2 + h_(i j) \( upright(d) x^i + Y^i upright(d) t_0 \) \( upright(d) x^j + Y^j upright(d) t_0 \) \, #h(2em) gamma = X^2 H_3 . $ <j:stationary-metric>]

 Then $\( gamma \, Phi \)$, with $partial_(t_0) Phi = 0$, solves the full Einstein–wave-map system of Equation (3.12). For the future $H_3$-unit normal $n$ to $t_0 = 0$, the induced horizontal tensor is $k \|_h$, and the map velocities are 
$ upright(d) log X \( n \) = k \( e \, e \) \, #h(2em) cal(D)_X \( n \) = s . $

]
] <j:adjoint>

The proof uses the numerical inequality on its enlarged sourced-constraint class, as established in Corollary 19. The equality-variation method has a neutral antecedent in #cite(label("NeutralExterior2026")); all the constraint and matter variations needed here are given below.

=== 8.1 The minimum-area envelope <the-minimum-area-envelope>

For a polarized metric $tilde(g)$ near $g$, let $a \( tilde(g) \)$ be the minimum enclosing area. The argument uses its one-sided derivative; it does not require uniqueness of a minimizing enclosure.

#thm([Lemma 8.2.])[
  (Compact minimizing family and envelope derivative).  #emph[The infimum defining $a \( tilde(g) \)$ is attained by an invariant filled inner set. The family $cal(T)_0$ of invariant minimizers at $g$, viewed through their sets modulo null sets and their area and tangent-plane measures, is compact. At the equality data, 
$ a \( g \) = A . $

 For any of the smooth metric paths $tilde(g)_d$ used below, 
#[#set math.equation(numbering: n => "(8.5)")
 $ frac(upright(d), upright(d) d)\|_(0 +) a \( tilde(g)_d \) = min_(T in cal(T)_0) A'_T \, #h(2em) A'_T = 1 / 2 integral_(partial T) "tr"_(partial T) dot(g) thin upright(d) A_g . $ <j:envelope>]

]
] <j:area>

#proof[
  Extend the geometry smoothly and equivariantly across $S$ into an auxiliary cap, and require each bounded inner set to contain that cap up to $S$. Count its full frontier, including coincidence with the obstacle. First impose an outer sphere obstacle. Perimeter compactness gives a minimizer. It has a $C^(1 \, 1)$ frontier, smooth and minimal off the inner obstacle, by smooth-obstacle perimeter regularity in dimension three #cite(label("HuiskenIlmanen2001")) Regularity Theorem 1.3(iii).
  The outer sphere can be removed uniformly for metrics in the paths under consideration. Large coordinate spheres are strictly mean convex, and the competitor $S$ gives a uniform area upper bound. If a free minimizing frontier had a point at radius $r_j arrow.r oo$, its portion in an asymptotic ball of radius $epsilon r_j$, for a fixed small $epsilon > 0$, would have area at least $c r_j^2$ by the interior density estimate for perimeter minimizers. This contradicts the area upper bound. Thus every minimizer stays in one compact set. Filling bounded pockets decreases perimeter and preserves admissibility.
  Among minimizers in this compact set choose one with largest filled volume. The perimeter inequality for union and intersection shows that both the union and the intersection of two minimizing inner sets are again minimizers. Rotating a maximum-volume minimizer and taking its union with the original one therefore leaves it unchanged modulo null sets. It is invariant. Smooth outward approximation of its regular graphs, or equivariant smoothing of an outward defining function, gives smooth invariant enclosing cuts with convergent area. Invariant areas are preserved by polarization. The original minimum-area hypothesis consequently gives $a \( g \) gt.eq A$, while $S$ gives the reverse inequality.
  For a sequence $d_j arrow.r 0$, choose invariant minimizers $T_j$ for $tilde(g)_(d_j)$. Compact containment and perimeter compactness give a subsequence converging to a filled inner set $T$. Uniform equivalence of the metrics, lower semicontinuity, and comparison with a background minimizer show that $T in cal(T)_0$ and that the perimeters converge. Strict convergence of the vector measures representing the perimeter normals then implies convergence of their area and tangent-plane measures. In particular, the integral defining $A'_T$ is continuous under this convergence.
  On the common compact set the expansion of area is uniform:
  $ "Area"_(tilde(g)_d) \( partial T \) = "Area"_g \( partial T \) + d A'_T + O \( d^2 \) "Area"_g \( partial T \) . $
  Comparing the perturbed minimum first with a minimizing member of $cal(T)_0$, and then with its own minimizer $T_d$, proves the upper and lower one-sided bounds in Equation (8.5). The same compactness argument at $d = 0$ proves compactness of $cal(T)_0$. ◻
]

We will also use the common tangent plane of minimizing frontiers wherever they meet off $S$. A transverse meeting would give a corner in the minimizing union or intersection, contradicting its regularity. This common plane is a measurable function on the union of the free frontiers. Here is a compact-graph verification, including accumulation leaves. For $delta_1 > 0$, consider the triples $\( T \, x \, Pi \)$ with $T in cal(T)_0$, $x in partial T$, $"dist" \( x \, S \) gt.eq delta_1$, and $Pi = T_x partial T$. Their set is compact. Indeed the density bound prevents a limiting support point from disappearing, while strict perimeter convergence and free minimizing-boundary regularity give graphical $C^1$ convergence near the smooth multiplicity-one limiting frontier. Thus the limiting plane is its tangent plane. Projection onto $\( x \, Pi \)$ is a compact graph; the common-plane property makes it single-valued. Its plane function is therefore continuous on its compact projection. Exhausting by $delta_1 arrow.b 0$ gives the required measurable plane field.

An invariant crossing arc gives an enclosure after rotation and smooth simple crossing approximation. Its length in $X^2 h$ is therefore at least $a \( tilde(g) \) \/ \( 2 pi \)$. Corollary 19 consequently gives, for nearby data in its sourced-constraint class with weakly future trapped boundary and fixed axis values,

#[#set math.equation(numbering: n => "(8.6)")
 $ E_(tilde(g)) gt.eq F_(*) (sqrt(frac(a \( tilde(g) \), 4 pi))) . $ <j:local-bound>]

The sourced class permits compact variations of the potentials themselves, provided their polar orders and endpoint constants are retained. For each such choice of map, the numerical deformation keeps that chosen map fixed. Thus Equation (8.6) applies to all the map variations below; the conserved jumps $\( 2 Q \, 0 \, 4 J \)$ are unchanged. The strict branch persists by uniform metric equivalence. At the background, direct differentiation of the model mass gives

#[#set math.equation(numbering: n => "(8.7)")
 $ c := 16 pi frac(upright(d), upright(d) A) F_(*) (sqrt(frac(A, 4 pi))) = frac(2 b, R_0^2) = 2 kappa > 0 . $ <j:area-coefficient>]

=== 8.2 Positive multipliers from the feasible cone <positive-multipliers-from-the-feasible-cone>

Let $cal(B)$ be the closed unit-ball bundle of $g$, including the fibers over $S$. Transport its vectors isometrically when the metric varies, and define the residual

#[#set math.equation(numbering: n => "(8.8)")
 $ C \( x \, w \) = 16 pi #scale(x: 120%, y: 120%)[\(] mu + J_(upright("con")) \( w \) #scale(x: 120%, y: 120%)[\)] - 2 sum_(i = 1)^3 #scale(x: 120%, y: 120%)[\(] \| D_i \|^2 + s_i^2 + 2 s_i D_i \( w \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| w \|_g lt.eq 1 . $ <j:residual>]

Equation (3.9) says $C equiv 0$. Consequently the infinitesimal contribution from transporting the ball vectors is zero.

The compact variation space contains all smooth axial metric and tensor variations invariant under azimuthal reflection. Away from the axis, the potentials and the $s_i$ vary independently with compact support. Through an axis we impose their smooth polar orders. In a signed transverse radius $y$, the differences of $psi \, chi$ from their axis constants are even and $O \( y^2 \)$, while

$ z + psi_(upright("ax")) chi - chi_(upright("ax")) psi - z_(upright("ax")) = O \( y^4 \) $

is even. Here $psi_(upright("ax")) \, chi_(upright("ax")) \, z_(upright("ax"))$ are the constants on the axis component in question. The variables $s_1 \, s_2$ are odd and $O \( y \)$; $s_3$ is even and $O \( y^2 \)$. These conditions are preserved by the variations. They follow from the smooth polar expansions in the axial reduction, including the even longitudinal and odd transverse components of the axial connection. For $i = 1 \, 2$, $D_i$ has an even transverse coefficient and an odd longitudinal coefficient. The covector $D_3$ extends smoothly on the three-dimensional rotational space, with transverse coefficient $O \( y \)$. In particular

$ \| D_i \|^2 \, #h(2em) s_i^2 \, #h(2em) s_i D_i $

are smooth there, so that all residuals and their variations are smooth.

Adjoin two noncompact directions. The first is the energy prototype $dot(g) = delta \/ r$ on the end, with a radial cutoff to zero near $S$. Its ADM derivative is $E'_g = 1 \/ 2$. The second is the strict conformal direction from the preparation for Corollary 19. Fix $0 < delta < 1$, a positive smooth weight $w_0$ equal to $r^(- 3 - delta)$ near infinity, and its strictifying function $phi > 0$. Thus

$ partial_nu phi = - 1 \, #h(2em) - Delta phi - \| k \| thin \| upright(d) phi \| gt.eq c_0 w_0 \, #h(2em) phi = O_2 \( r^(- 1) \) \, #h(2em) frac(- Delta phi, w_0) arrow.r 1 . $

The strict direction is the derivative of

$ g_d = e^(4 d phi) g \, #h(2em) k_d = e^(2 d phi) k \, #h(2em) s_(i \, d) = e^(- 2 \( 1 + h_i \) d phi) s_i \, $

with fixed potentials. Its derivatives satisfy

#[#set math.equation(numbering: n => "(8.9)")
 $ - theta'_(+) & = 4 quad upright("on ") S \,\
C' & = - 8 Delta phi + 8 k \( w \, nabla phi \)\
 & thin + 8 phi sum_i h_i #scale(x: 120%, y: 120%)[\(] \| D_i \|^2 + s_i^2 + 2 s_i D_i \( w \) #scale(x: 120%, y: 120%)[\)] > 0 \, #h(2em) C' / w_0 arrow.r 8 . $ <j:strict-direction>]

Each row in the sum is nonnegative on the unit ball. The energy prototype has $C' = O \( r^(- 4) \)$: its Euclidean scalar linearization is $- 2 Delta_delta \( 1 \/ r \) = 0$, and all remaining terms have this decay or better. Compact directions have zero tail.

#thm([Lemma 8.3.])[
  (Multiplier identity).  #emph[There are a probability measure $omega$ on $cal(T)_0$, a nonnegative finite measure $lambda_S$ on $S$, a nonnegative locally finite measure $Lambda$ on $cal(B)$, and $z_0 gt.eq 0$, such that every variation in the space just described satisfies 
#[#set math.equation(numbering: n => "(8.10)")
 $ 16 pi E'_g - c integral_(cal(T)_0) A'_T thin upright(d) omega \( T \) = integral_(cal(B)) C' thin upright(d) Lambda - integral_S theta'_(+) upright(d) lambda_S + z_0 a_(upright("dir")) . $ <j:multiplier-identity>]

 Here $a_(upright("dir"))$ is the coefficient of the strict direction. The measures can be chosen invariant under rotations and azimuthal reflection.]
] <j:multipliers>

#proof[
  Let $cal(B)^(+)$ be the one-point compactification of $cal(B)$. For a variation $v$ consider the continuous test triple
  $ L \( v \) = (frac(C' \[ v \], w_0) \, med - theta'_(+) \[ v \] \, med {c A'_T \[ v \] - 16 pi E'_g \[ v \]}_(T in cal(T)_0)) $
  in
  $ cal(X) = C \( cal(B)^(+) \) times C \( S \) times C \( cal(T)_0 \) . $
  Continuity at the added point follows from Equation (8.9) and $delta < 1$; continuity of the last block follows from Lemma 34.
  The linear space $L \( V \)$ misses the open cone of triples strictly positive everywhere. Indeed a variation in this cone has a positive uniform margin in all three blocks. It has a smooth path realizing its derivative with
  $ C_d = d C' + O \( d^2 w_0 \) \, #h(2em) theta_(+) \( d \) = d theta'_(+) + O \( d^2 \) \, $
  uniformly on the indicated domains. For completeness, realize a finite sum of compact directions, the prototype, and the strict direction by first making the linear compact and prototype changes, and then applying the displayed exponential scalings with parameter $a_(upright("dir")) d$. On a compact set the Taylor remainders are uniform, also through the axis by the polar orders. On the end the new metric tails are $O_2 \( r^(- 1) \)$; the second-order scalar-curvature remainder is $O \( d^2 r^(- 4) \)$, as are or dominate all other constraint remainders. Since $r^(- 4) = O \( w_0 \)$, this proves the stated estimate. The end curvature remains $O \( r^(- 3 - delta) \)$, the constraints remain integrable, and the ADM energy is differentiable. All other assumptions of the enlarged class in Corollary 19 persist. For small $d > 0$ the path is therefore feasible. Equation (8.5) and the strictly positive objective block make the derivative of
  $ 16 pi [E_(g_d) - F_(*) (sqrt(frac(a \( g_d \), 4 pi)))] $
  strictly negative at its zero background value, contradicting Equation (8.6).
  Separation of an open convex cone from a linear subspace gives a nonzero continuous positive functional on $cal(X)$ annihilating $L \( V \)$. This separation requires no closed-range assertion for $L$. Riesz representation gives three nonnegative finite measures. The measure of the objective block has positive total mass: otherwise evaluation on the strict direction, whose first two blocks are strictly positive, forces both remaining measures to vanish. Divide by that positive mass to obtain $omega$. If $overline(Lambda)$ denotes the resulting first measure, set $upright(d) Lambda = w_0^(- 1) upright(d) overline(Lambda)$ on $cal(B)$. It is locally finite. Its atom at the added point gives $z_0 a_(upright("dir"))$, since the first test block has value $8 a_(upright("dir"))$ there. This proves Equation (8.10). Averaging the identity over the compact symmetry group gives the last assertion. ◻
]

=== 8.3 Concentration on the original boundary <concentration-on-the-original-boundary>

#thm([Lemma 8.4.])[
  #emph[The probability measure in Equation (8.10) is concentrated on the cut $S$.]
] <j:concentration>

#proof[
  Let $sigma_0$ be an arbitrary smooth invariant normal speed supported strictly inside $Omega$. Take a short local Einstein–Maxwell Cauchy development of the #emph[original] data about its compact support. Local hyperbolic existence and uniqueness propagate the symmetry. A compact change of its spacelike slice, followed by polarization, gives exact constraint variations
  #[#set math.equation(numbering: n => "(8.11)")
   $ C' = 0 \, #h(2em) dot(g) = 2 sigma_0 k . $ <j:slice-test>]
  To justify the second identity, differentiate the orthogonal horizontal projection defining $h$. Terms from differentiating the horizontal lifts pair to zero by orthogonality. Differentiating the fiber length gives the remaining fiber component, so the polarized variation is precisely $2 sigma_0 k$.
  The potentials in these tests can be chosen with compact variation and unchanged axis constants. Maxwell’s equations give the closed spacetime orbit forms defining $psi \, chi$, which are integrated normally in the short slab. With these potentials fixed, the orbit form defining $z$ is closed as well: its exterior derivative vanishes on every spacelike meridional plane by the axial momentum equation on each tilted slice. Such planes test every two-form locally in the three-dimensional orbit space. Normal integration therefore extends $z$ with its initial constants. These constructions preserve the polar orders. Only the interior neighborhood of the chosen support is used.
  All end and boundary variations, and $a_(upright("dir"))$, vanish in these tests. Equations (8.10) and (8.11) give
  #[#set math.equation(numbering: n => "(8.12)")
   $ integral_(cal(T)_0) integral_(partial T) sigma_0 thin "tr"_(partial T) k thin upright(d) A_g thin upright(d) omega \( T \) = 0 . $ <j:trace-measure>]
  The common-plane property above makes the tangential trace a single measurable function on the union of free frontiers. The aggregate area measure is positive. Equation (8.12), first for invariant tests and then for all tests by averaging, says that this function vanishes almost everywhere for the aggregate measure. Integrating its absolute value and using Fubini shows that, for $omega$-almost every $T$, the trace vanishes on almost every point of its free frontier. Continuity makes it vanish everywhere on each smooth free portion. Such portions are minimal and hence satisfy the MOTS equation.
  The same equation holds almost everywhere across contact with $S$. In tangent graphs the difference between the frontier and the obstacle, and its first derivatives, vanish on the contact set. Since the graphs are $C^(1 \, 1)$, differentiability and the density theorem imply that their second derivatives also agree at almost every contact point. Their outward orientations agree by obstacle inclusion. The frontier therefore solves the smooth uniformly elliptic MOTS graph equation almost everywhere across contact. In a graph chart, write this as
  $ a^(i j) \( x \, f \, upright(d) f \) partial_i partial_j f = b \( x \, f \, upright(d) f \) . $
  The $C^(1 \, 1)$ graph is a strong $W^(2 \, oo)$ solution; bounded slope makes the principal matrix uniformly elliptic. Evaluated on $\( x \, f \, upright(d) f \)$, both the coefficients and the right side are Lipschitz. Interior Schauder regularity for this linear equation therefore gives $f in C^(2 \, alpha)$ for every $alpha < 1$ on a smaller chart. Differentiation and elliptic bootstrap then make the graph smooth. Strong comparison implies local coincidence whenever it touches $S$. Connectedness then forces a touching component to be all of $S$; its total area is $A$, so it has no further component.
  If the frontier is disjoint from $S$, it is a smooth interior enclosing MOTS. For an invariant surface the original and polarized expansions agree. The filled-frontier convention removes any spurious pocket component, so this is an enclosing surface forbidden by the exact outermostness hypothesis of Theorem 2. Thus almost every minimizing cut in the multiplier is $S$. ◻
]

=== 8.4 Smoothness of the lapse and shift <smoothness-of-the-lapse-and-shift>

Take the zeroth and first fiber moments of $Lambda$. As distributions relative to $upright(d) V_g$, denote them by $N$ and $Y$:

$ N thin upright(d) V_g = "pr"_(*) Lambda \, #h(2em) Y thin upright(d) V_g = "pr"_(*) \( w Lambda \) . $

Positivity of $Lambda$ gives $N gt.eq \| Y \|$ in the measure sense. Averaging makes $Y$ meridional. After Lemma 36, the interior compact tests in Equation (8.10) have only the constraint term.

The variation of the trace-reversed tensor $k - \( "tr"_g k \) g$ gives

#[#set math.equation(numbering: n => "(8.13)")
 $ "sym" nabla Y = - N k . $ <j:shift>]

For example, if $P = dot(k) - \( "tr"_g dot(k) \) g$, then in dimension three $dot(k) = P - 1 / 2 \( "tr"_g P \) g$. The tensor-dependent variation after integration by parts is $- 2 chevron.l N k + "sym" nabla Y \, P chevron.r$, which proves Equation (8.13). Compact conformal tests with the same source weights as in Equation (8.9) give

#[#set math.equation(numbering: n => "(8.14)")
 $ Delta N = - "div" k \( Y \, dot.op \) + sum_i h_i [N \( \| D_i \|^2 + s_i^2 \) + 2 s_i D_i \( Y \)] . $ <j:lapse>]

These distributional equations hold through the axis: their coefficients are smooth, and averaging arbitrary test components gives precisely the invariant tests already allowed.

#thm([Lemma 8.5.])[
  (Regularity and a first-jet system).  #emph[The interior moment distributions are smooth. Their first jets satisfy a homogeneous linear first-order system with coefficients smooth through the axis and one-sided smooth up to $S$. They extend smoothly to $S$, and the moment measures have no part supported on $S$.]
] <j:regularity>

#proof[
  Take the divergence of Equation (8.13) together with Equation (8.14). The scalar principal symbol is $\| xi \|^2$; the vector symbol is
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] \| xi \|^2 I + xi ⊗ xi #scale(x: 120%, y: 120%)[\)] . $
  All couplings are lower order. This is an elliptic system with smooth coefficients on the rotational three-space. Distributional elliptic regularity therefore proves interior smoothness, including at the axis.
  We record the additional metric equation to justify continuation and the end estimates. For a pure metric variation the second-order term is $"Hess" N - \( Delta N \) g$. The gravitational lower-order terms are smooth linear expressions bounded in norm by
  #[#set math.equation(numbering: n => "(8.15)")
   $ C [\( \| "Rm" \| + \| k \|^2 \) \| N \| + \| nabla k \| thin \| Y \| + \| k \| thin \| nabla Y \|] . $ <j:gravitational-coefficients>]
  This follows directly from
  $ R' = "div" "div" dot(g) - Delta "tr"_g dot(g) - chevron.l "Ric" \, dot(g) chevron.r \, $
  the algebraic variation of $\( "tr" k \)^2 - \| k \|^2$, and the $nabla k * dot(g) + k * nabla dot(g)$ terms in the momentum variation. Terms due to varying the volume disappear because the background constraint residual is zero.
  The matter terms, while initially written off the axis, have smooth tensor coefficients. Up to constant factors and smooth trace terms, they contract against
  #[#set math.equation(numbering: n => "(8.16)")
   $ N (D_i^sharp ⊗ D_i^sharp + h_i \| D_i \|^2 e ⊗ e) \, #h(2em) s_i D_i \( Y \) e ⊗ e . $ <j:matter-coefficients>]
  Free compact variations of $s_i$ give
  #[#set math.equation(numbering: n => "(8.17)")
   $ D_i \( Y \) = - N s_i . $ <j:map-velocity>]
  Thus the second tensors become $- N s_i^2 e ⊗ e$, which are smooth by the polar orders. For $i = 1 \, 2$, the radial and azimuthal coefficients of the first tensor have the same leading value on the axis and smooth even parity; their difference is $O \( y^2 \)$. The radial-longitudinal coefficient is smooth odd. In Cartesian polar disks these are exactly the conditions for a smooth invariant tensor. For $i = 3$, the higher vanishing orders directly give the same conclusion. This proves smoothness of the full metric equation through the axis; the matter terms are bounded by $C \| N \| sum_i \( \| D_i \|^2 + s_i^2 \)$.
  Taking the trace of the metric equation and substituting back determines all components of $"Hess" N$ from the first jets of $N \, Y$. Differentiating Equation (8.13) and commuting covariant derivatives likewise expresses $nabla^2 Y$ in those first jets, with coefficients formed from $k \, nabla k \, "Rm"$. Hence
  $ \( N \, Y \, nabla N \, nabla Y \) $
  satisfies the asserted homogeneous first-order system. In a collar of $S$, integrate its normal ordinary differential equation from an interior collar slice. Smooth dependence on the tangential parameters gives a smooth one-sided extension to the boundary.
  There might initially remain a separate boundary-supported part of the moment measures. Take $dot(k) = 0$ and a compact metric variation whose value and first jet vanish on $S$, with arbitrary second normal derivative of its tangential trace there. Neither the area nor the expansion derivative sees this second jet. After integration of the smooth interior adjoint, its boundary terms also vanish. In the residual at $S$, only the scalar-curvature variation tests the prescribed second jet. Equation (8.10) therefore forces the boundary part of $N$ to vanish. The measure inequality $\| Y \| lt.eq N$ then removes the boundary part of $Y$. ◻
]

=== 8.5 End normalization <j:end-section>

#thm([Lemma 8.6.])[
  (Asymptotic constants and the spatial translation).  #emph[For the adjoint fields above, there are constants $N_oo \, Y_oo$ such that, for every $q' in \( 1 \/ 2 \, 1 \)$, 
$ \( N \, Y \) = \( N_oo \, Y_oo \) + O_2 \( r^(- q') \) . $

 The multiplier identity gives $N_oo = 1$, and positive ADM energy gives $Y_oo = 0$. In fact $Y = O_2 \( r^(- 2) \)$.]
  #emph[More generally, the elimination of $Y_oo$ applies to any pair with these constant asymptotics that satisfies $"sym" nabla Y = - N k$, provided $k = O_1 \( r^(- 3) \)$, $N$ is bounded, the scalar linearization $L \( g - delta \) = O \( r^(- 4) \)$, and the ADM energy is positive.]
] <j:end>

#proof[
  Set $F = \( N \, Y \)$. The first-jet equations and the original end bounds give
  #[#set math.equation(numbering: n => "(8.18)")
   $ \| partial^2 F \| lt.eq C r^(- 2 - q') \| F \| + C r^(- 1 - q') \| partial F \| . $ <j:end-ode>]
  Here the matter coefficients have order at least $r^(- 4)$, so any $q' in \( 1 \/ 2 \, 1 \)$ is allowed. Radial integration with Gronwall’s inequality, applied to $\| F \| \/ r + \| partial F \|$, first gives $F = O \( r \)$ and $partial F = O \( 1 \)$. The Hessian bound then gives a limiting gradient along each ray. Integrating the Hessian along paths of length $O \( r \)$ on coordinate spheres shows that these limits agree. A nonzero linear term in $N$ would contradict $N gt.eq 0$ in opposite asymptotic directions. Once that term vanishes, $\| Y \| lt.eq N$ eliminates every linear term of $Y$ as well. Consequently
  $ F = O \( r^(1 - q') \) \, #h(2em) partial F = O \( r^(- q') \) . $
  Reinsertion into Equation (8.18) gives $partial^2 F = O \( r^(- 1 - 2 q') \)$. The gradient limits are zero, so $partial F = O \( r^(- 2 q') \)$. Since $2 q' > 1$, radial integration gives finite value limits, and sphere paths show that there is a single such limit. One final insertion gives
  $ partial^2 F = O \( r^(- 2 - q') \) \, #h(2em) partial F = O \( r^(- 1 - q') \) \, #h(2em) F - F_oo = O \( r^(- q') \) . $
  Use the energy prototype in Equation (8.10). It vanishes near $S$, and $a_(upright("dir")) = 0$. Integrate the smooth adjoint over a large truncation. Scalar linearization gives the limiting constraint flux $16 pi N_oo E'_g$. Terms containing $nabla N$, the nonconstant part of $N$, and momentum metric-variation boundary terms tend to zero by the preceding decay. The residual tail is integrable. Since $E'_g = 1 \/ 2 eq.not 0$, the identity gives $N_oo = 1$.
  To eliminate the constant spatial translation, write $g = delta + H_0$ and put $a = Y_oo$ for this paragraph only. Equation (3.9) and scalar linearization give
  $ L H_0 := partial_i partial_j H_(0 \, i j) - Delta_delta "tr"_delta H_0 = O \( r^(- 4) \) . $
  For an affine function $V$ define the Euclidean flux covector
  $ U \( V \; h' \)_i = V \( partial_j h'_(i j) - partial_i h'_(j j) \) - h'_(i j) partial_j V + \( "tr"_delta h' \) partial_i V . $
  It satisfies $partial_i U \( V \; h' \)_i = V L h'$. The shift equation gives $cal(L)_Y g = O_1 \( r^(- 3) \)$. Subtracting $partial_a H_0$ and the pure Euclidean gauge $cal(L)_Y delta$ leaves errors $O_1 \( r^(- 2 - q') \)$. The affine flux of these errors tends to zero. The affine flux of $cal(L)_Y delta$ is identically zero after a smooth extension to the interior, because its scalar linearization vanishes. Thus the flux of $U \( V \; partial_a H_0 \)$ tends to zero.
  On the other hand, differentiation of the definition of $U$ gives
  $ U \( V \; partial_a H_0 \) = partial_a U \( V \; H_0 \) - U \( partial_a V \; H_0 \) . $
  Euclidean integration by parts, with arbitrary smooth interior extensions, consequently yields the exact sphere identity
  #[#set math.equation(numbering: n => "(8.19)")
   $ integral_(S_r) U \( V \; partial_a H_0 \) dot.op n_delta thin upright(d) A_delta & = integral_(S_r) \( a dot.op n_delta \) V thin L H_0 thin upright(d) A_delta\
 & quad - \( partial_a V \) integral_(S_r) U \( 1 \; H_0 \) dot.op n_delta thin upright(d) A_delta . $ <j:boost-flux>]
  The first term tends to zero; the second tends to $- 16 pi m thin partial_a V$. Since $m > 0$, testing all affine $V$ gives $a = 0$. This calculation uses just the hypotheses stated in the last part of the lemma.
  Finally the prolonged shift equation, now with zero limits, gives
  $ \| partial^2 Y \| lt.eq C #scale(x: 120%, y: 120%)[\(] r^(- 2) \| partial Y \| + r^(- 3) \| Y \| + r^(- 4) #scale(x: 120%, y: 120%)[\)] . $
  Starting with $Y = O_2 \( r^(- q') \)$, integration from infinity first improves this to $Y = O_2 \( r^(- 1 - q') \)$, and then to $Y = O_2 \( r^(- 2) \)$. ◻
]

We also obtain strict interior positivity. If $N$ vanished at an interior point, its nonnegativity would give $N = O \( "dist"^2 \)$ there. Domination would give the same bound for $Y$. Thus the entire first jet of $N \, Y$ would vanish at that point. Uniqueness for the homogeneous first-jet ordinary differential equation along paths would force both fields to vanish throughout the connected interior, contradicting $N_oo = 1$.

=== 8.6 Boundary data and surface gravity <boundary-data-and-surface-gravity>

Compact tensor variations up to $S$, integrated in Equation (8.10), give

#[#set math.equation(numbering: n => "(8.20)")
 $ Y_T = 0 \, #h(2em) upright(d) lambda_S = 2 Y_nu thin upright(d) A_g . $ <j:boundary-measure>]

Indeed the boundary term of the momentum pairing, whose integration normal is $- nu$, is $- 2 Y^i \( dot(k)_(i j) - \( "tr" dot(k) \) g_(i j) \) nu^j$. Its mixed tangential-normal components force $Y_T = 0$, while its tangential trace component gives the measure identity. Axial and reflection symmetry supply all components needed for the meridional field $Y$.

Now use the weighted conformal variation with an arbitrary compact smooth scalar $phi_0$, allowing independent values and normal derivatives on $S$. The area derivative is $4 integral_S phi_0 thin upright(d) A_g$, and $theta'_(+) = 4 partial_nu phi_0$. Integrating Equation (8.14), with integration normal $- nu$, gives

#[#set math.equation(numbering: n => "(8.21)")
 $ - 4 c integral_S phi_0 thin upright(d) A_g & = 8 integral_S [N partial_nu phi_0 - #scale(x: 120%, y: 120%)[\(] partial_nu N + k \( Y \, nu \) #scale(x: 120%, y: 120%)[\)] phi_0] upright(d) A_g\
 & quad - 4 integral_S partial_nu phi_0 thin upright(d) lambda_S . $ <j:boundary-conformal>]

Independent comparison of the two boundary jets, together with Equation (8.20), gives $N = Y_nu$ and $partial_nu N + k \( Y \, nu \) = c \/ 2$. Equation (8.7) proves Equation (8.3) with its stated positive surface gravity.

#thm([Lemma 8.7.])[
  (Boundary lapse dichotomy).  #emph[Either $N \|_S > 0$ everywhere or $N \|_S equiv 0$.]
] <j:dichotomy>

#proof[
  Choose a compact smooth invariant meridional vector field $W$ with $W \|_S = xi_0 nu$. Extend the data smoothly across $S$ and take their Lie derivatives along $W$. These are allowed compact first variations in Equation (8.10); they need not form a feasible path. Covariance gives $C' = cal(L)_W C = 0$ on the exterior. This also holds at $S$, since the exact residual vanishes on the interior and all its one-sided jets vanish at the boundary. No constraint condition on the extension is required. Naturality identifies the fixed-surface expansion of the pulled-back data with the expansion of the surface moved by $W$ in the original data. Consequently the first area variation is $integral_S H xi_0 thin upright(d) A_g$, and the expansion variation is $L_S xi_0$, where $L_S$ is the MOTS normal stability operator with principal part $- Delta_S$. Equation (8.10) and $upright(d) lambda_S = 2 N thin upright(d) A_g$ therefore give
  #[#set math.equation(numbering: n => "(8.22)")
   $ 2 L_S^(*) N = c H . $ <j:stability-boundary>]
  Averaging allows arbitrary scalar tests. Outer area minimization implies $H gt.eq 0$ by outward first variation; the polarized and original mean curvatures of $S$ agree. Thus $L_S^(*) N gt.eq 0$ with $N gt.eq 0$. To check the sign in the strong minimum principle, write locally $L_S^(*) = - a^(i j) partial_i partial_j + b^i partial_i + c_0 \( x \)$. Choose a constant $C_0 gt.eq max \( 0 \, sup_S c_0 \)$. Replacing $c_0$ by $C_0$ preserves the inequality because $N gt.eq 0$. The function $v = - N lt.eq 0$ then satisfies
  $ \( a^(i j) partial_i partial_j - b^i partial_i - C_0 \) v gt.eq 0 . $
  Its zeroth-order coefficient is nonpositive, and a zero of $N$ is a nonnegative interior maximum of $v$. The strong maximum principle forces local constancy. Connectedness of $S$ proves the dichotomy. ◻
]

The multiplier at infinity can now also be identified. Apply the smooth conformal adjoint identity to the strictifying function $phi$, integrating over larger truncations. Its source terms are integrable, and the end flux is $16 pi E'_g$ because $N_oo = 1$; all remaining end terms vanish by Equation (8.2). The boundary terms are exactly those of Equation (8.21). Thus

$ integral_(cal(B)) C' thin upright(d) Lambda - integral_S theta'_(+) upright(d) lambda_S = 16 pi E'_g - c A'_S $

for the strict direction. Comparing with Equation (8.10), where $a_(upright("dir")) = 1$, gives $z_0 = 0$. Its value was not needed earlier: every compact test and the energy prototype have $a_(upright("dir")) = 0$.

=== 8.7 The canonical quotient action <the-canonical-quotient-action>

We finish the proof of Proposition 33 by interpreting the complete interior adjoint. Work off the axis, where $X > 0$, and introduce the quotient canonical variables

#[#set math.equation(numbering: n => "(8.23)")
 $ hat(q) = X^2 h \, #h(2em) m_v = k \( e \, e \) \, #h(2em) p = X \( k \|_h + m_v h \) . $ <j:canonical-variables>]

Let $pi$ be the target tangent vector with orthonormal components

#[#set math.equation(numbering: n => "(8.24)")
 $ upright(d) u \( pi \) = X^(- 1) m_v \, #h(2em) cal(D)_X \( pi \) = X^(- 1) s . $ <j:canonical-momentum>]

Together with $Phi$, the variables $hat(q) \, p \, pi$ are free local variation coordinates. The quotient lapse is $hat(N) = X N$. With all spatial contractions now taken using $hat(q)$, define

#[#set math.equation(numbering: n => "(8.25)")
 $ hat(C)_H & = R_(hat(q)) + \( "tr"_(hat(q)) p \)^2 - \| p \|_(hat(q))^2 - 2 #scale(x: 120%, y: 120%)[\(] \| upright(d) Phi \|_(hat(q) \, G)^2 + \| pi \|_G^2 #scale(x: 120%, y: 120%)[\)] \,\
hat(C)_P & = "div"_(hat(q)) #scale(x: 120%, y: 120%)[\(] p - \( "tr"_(hat(q)) p \) hat(q) #scale(x: 120%, y: 120%)[\)] - 2 G \( pi \, upright(d) Phi \) . $ <j:canonical-constraints>]

The exact relation to the polarized residual is

#[#set math.equation(numbering: n => "(8.26)")
 $ C \( x \, w \) = X^2 hat(C)_H + 2 X hat(C)_P \( w \) . $ <j:constraint-conversion>]

Here only the horizontal component of $w$ enters the second term; the axial momentum residual vanishes.

We verify both parts of this conversion. The scalar identities are

$ X^2 R_(hat(q)) = R_g + 2 \| upright(d) log X \|_h^2 \, #h(2em) X^2 #scale(x: 120%, y: 120%)[\(] \( "tr" p \)^2 - \| p \|^2 #scale(x: 120%, y: 120%)[\)] - 2 m_v^2 = \( "tr"_g k \)^2 - \| k \|_g^2 . $

They follow respectively from two-dimensional conformal curvature and the trace algebra of Equation (8.23). The spatial and normal $u$-energies cancel the two extra terms. For momentum, put

$ P_H = k \|_h - \( "tr"_h k \|_h + m_v \) h . $

Its three-dimensional horizontal divergence is

$ "div"_h P_H + k \|_h \( nabla log X \, dot.op \) - m_v upright(d) log X . $

The rescaled quotient divergence is

$ X "div"_(hat(q)) \( X P_H \) = "div"_h P_H + k \|_h \( nabla log X \, dot.op \) + m_v upright(d) log X . $

Subtracting the $u$-momentum term $2 m_v upright(d) log X$, and then the remaining map momenta, gives the required horizontal residual. This proves Equation (8.26).

After circle integration the volume identity is $upright(d) V_g = 2 pi X^(- 1) upright(d) A_(hat(q))$. Since the constraints vanish at the background, variations of this conversion factor or of the multiplier coordinates make no contribution. The compact adjoint identity is therefore stationarity of

#[#set math.equation(numbering: n => "(8.27)")
 $ I = integral [hat(N) hat(C)_H + 2 Y dot.op hat(C)_P] upright(d) A_(hat(q)) $ <j:canonical-functional>]

under all compact variations of $hat(q) \, p \, Phi \, pi$. Variations of $hat(N) \, Y$ themselves also vanish by the constraints.

Integrating the momentum divergence by parts and varying $p \, pi$ gives, respectively,

#[#set math.equation(numbering: n => "(8.28)")
 $ p = - frac(cal(L)_Y hat(q), 2 hat(N)) \, #h(2em) pi = - frac(upright(d)_Y Phi, hat(N)) . $ <j:stationary-momenta>]

For instance the $p$-equation before tracing is

$ hat(N) #scale(x: 120%, y: 120%)[\(] \( "tr" p \) hat(q) - p #scale(x: 120%, y: 120%)[\)] - "sym" accent(nabla Y, ̂) + \( "div"_(hat(q)) Y \) hat(q) = 0 . $

Its two-dimensional trace eliminates $hat(N) "tr" p + "div"_(hat(q)) Y$, giving the first equation. The $pi$-variation is $- 4 hat(N) pi - 4 upright(d)_Y Phi = 0$, giving the second.

Since $N > 0$ in the interior, these are precisely the induced tensor and normal map velocity for the Lorentzian lapse-shift metric

$ gamma = - hat(N)^2 upright(d) t_0^2 + hat(q)_(i j) \( upright(d) x^i + Y^i upright(d) t_0 \) \( upright(d) x^j + Y^j upright(d) t_0 \) $

with stationary coefficients and the positive second-fundamental-form convention. Substitution into Equation (8.27) gives

#[#set math.equation(numbering: n => "(8.29)")
 $ integral hat(N) [R_(hat(q)) + \| p \|^2 - \( "tr" p \)^2 - 2 \| upright(d) Phi \|_(hat(q) \, G)^2 + 2 \| pi \|_G^2] upright(d) A_(hat(q)) . $ <j:stationary-action>]

The signs can also be read directly from the integrated shift terms: they add $2 hat(N) \( \| p \|^2 - \( "tr" p \)^2 \)$ and $4 hat(N) \| pi \|^2$ to the original constraint expression.

The Gauss decomposition identifies Equation (8.29), up to divergences, with

$ integral #scale(x: 120%, y: 120%)[\(] R_gamma - 2 \| upright(d) Phi \|_gamma^2 #scale(x: 120%, y: 120%)[\)] upright(d) V_gamma $

per unit $t_0$-time. Thus its metric and map variations give

$ "Ric"_gamma = 2 Phi^(*) G \, #h(2em) "tr"_gamma nabla upright(d) Phi = 0 \, $

which is Equation (3.12). Stationary tests give all equations: one may take a periodic time interval for the compact variational calculation and average any test in time, since every coefficient and Euler–Lagrange expression is stationary.

Finally the $H_3$-normal is $n = X n_gamma$. Equations (8.24) and (8.28) therefore give $upright(d) u \( n \) = m_v$ and $cal(D)_X \( n \) = s$. Under $gamma = X^2 H_3$ the slice tensors are related by

$ p = X #scale(x: 120%, y: 120%)[\(] k_(H_3) + n \( log X \) h #scale(x: 120%, y: 120%)[\)] \, $

so Equation (8.23) gives $k_(H_3) = k \|_h$. Together with the preceding lemmas, this proves Proposition 33.

== 9 Rigidity, reconstruction, and the converse <k:section>

Assume equality on the strict area branch. Set

$ R_0 = sqrt(frac(A, 4 pi)) \, #h(2em) M = m \, #h(2em) a = - J / M \, #h(2em) b = sqrt(M^2 - a^2 - Q^2) \, #h(2em) kappa = b / R_0^2 > 0 . $

The parameter identities in Lemma 9 give $\( M + b \)^2 + a^2 = R_0^2$. Until the reconstruction below, $g \, k$ denote the polarized data, $h$ their meridional metric, and $X = \| eta \|$. We use the lapse $N$, meridional shift $Y$, and stationary map $Phi$ supplied by Proposition 33. Thus

$ H_3 = - N^2 upright(d) t_0^2 + h_(i j) \( upright(d) x^i + Y^i upright(d) t_0 \) \( upright(d) x^j + Y^j upright(d) t_0 \) \, #h(2em) gamma = X^2 H_3 $

satisfies the Einstein–wave-map equations (3.12). In particular, the argument starts with the full quotient equations and their initial momenta.

=== 9.1 Strict timelikeness of the quotient Killing field <strict-timelikeness-of-the-quotient-killing-field>

Define

#[#set math.equation(numbering: n => "(9.1)")
 $ mu_(*) = N^2 - \| Y \|_h^2 \, #h(2em) alpha_Y = h \( Y \, dot.op \) . $ <k:norm>]

Here $mu_(*)$ is a Killing norm, unrelated to a constraint energy density. Ordinary axial parity extends $h \, N \, Y \, mu_(*)$ smoothly across the axes to the doubled meridian. This is a planar annulus with a smooth compact inner boundary; the transverse component of $Y$ is odd at an axis. The original open meridian is simply connected.

#thm([Lemma 9.1.])[
  #emph[The function $mu_(*)$ is positive throughout the interior, including on the axes. There is a globally defined function $f$ on the open meridian such that 
#[#set math.equation(numbering: n => "(9.2)")
 $ upright(d) f = - alpha_Y / mu_(*) \, #h(2em) H_3 = - lambda^2 upright(d) t^2 + h_(+) \, #h(2em) lambda = sqrt(mu_(*)) \, #h(2em) h_(+) = h + alpha_Y^2 / mu_(*) \, #h(2em) t = t_0 + f . $ <k:static>]

 The original horizontal slice is the graph $t = f$. Moreover $rho = X lambda$ is $h_(+)$-harmonic off the axes.]
] <k:timelike>

#proof[
  Let $xi = partial_(t_0)$. Stationarity of $Phi$ and $"Ric"_gamma = 2 Phi^(*) G$ imply $"Ric"_gamma \( xi \, dot.op \) = 0$. The three-dimensional Killing twist
  $ cal(W) = *_gamma #scale(x: 120%, y: 120%)[\(] xi_gamma^flat and upright(d) xi_gamma^flat #scale(x: 120%, y: 120%)[\)] $
  is a scalar. Differentiating with the parallel volume tensor, using $nabla_i xi_j = - nabla_j xi_i$ and the Killing second-derivative identity, gives $upright(d) cal(W) = plus.minus 2 *_gamma \( xi_gamma^flat and "Ric"_gamma \( xi \, dot.op \) \) = 0$. Under $gamma = X^2 H_3$, the covector wedge acquires the factor $X^4$ and the Hodge star on three-forms the factor $X^(- 3)$. Consequently $cal(W)$ is $X$ times the corresponding twist for $H_3$. The latter is bounded near any ordinary interior axis point: $H_3$ is smooth and nondegenerate there because $N > 0$. Since $X$ vanishes there, the constant $cal(W)$ is zero. Substituting $xi_(H_3)^flat = - mu_(*) upright(d) t_0 + alpha_Y$ into Frobenius gives
  #[#set math.equation(numbering: n => "(9.3)")
   $ mu_(*) thin upright(d) alpha_Y = upright(d) mu_(*) and alpha_Y . $ <k:frobenius>]
  This identity extends smoothly to the doubled meridian.
  Where $mu_(*) > 0$, Equation (9.3) makes $- alpha_Y \/ mu_(*)$ closed and gives the local static form (9.2). In these coordinates $gamma = - rho^2 upright(d) t^2 + X^2 h_(+)$. The $t t$ Ricci equation is $rho Delta_(X^2 h_(+)) rho = 0$; conformal invariance of the two-dimensional scalar Laplacian then gives $Delta_(h_(+)) rho = 0$.
  We next exclude an interior null set. First there is a positive collar of the inner boundary. The boundary alternatives from Proposition 33 are exhaustive. If $N > 0$ on $S$, then $Y = N nu$, $"sym" nabla Y = - N k$, and (8.3) give
  $ partial_nu mu_(*) = 2 N #scale(x: 120%, y: 120%)[\(] partial_nu N + N k \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] = 2 N kappa > 0 . $
  If $N = 0$ on $S$, then $Y = 0$ there. Its tangential derivatives vanish, and the symmetric-gradient equation makes its remaining first derivatives vanish as well. At inward boundary distance $s$,
  $ Y = O \( s^2 \) \, #h(2em) N = kappa s + O \( s^2 \) \, #h(2em) mu_(*) = kappa^2 s^2 + O \( s^3 \) > 0 quad \( s > 0 upright(" small") \) . $
  These collars can be chosen equivariantly and are uniform through the poles by compactness. The end also has $mu_(*) > 0$, since $N arrow.r 1$ and $Y arrow.r 0$.
  Suppose that the compact interior set $cal(Z) = { mu_(*) = 0 }$ on the double is nonempty. Proposition 33 gives $mu_(*) gt.eq 0$ everywhere and $N > 0$ in the interior, so $Y eq.not 0$ on $cal(Z)$. Let $Z$ be the $h$-orthogonal quarter-turn of $Y$, using the orientation of the double. Evaluation of (9.3) on $\( Y \, Z \)$ yields, on a neighborhood of $cal(Z)$,
  #[#set math.equation(numbering: n => "(9.4)")
   $ Z \( mu_(*) \) = - frac(upright(d) alpha_Y \( Y \, Z \), \| Y \|_h^2) thin mu_(*) . $ <k:null-flow>]
  The coefficient is smooth. Uniqueness for this scalar ordinary differential equation shows that the flow of $Z$ preserves $cal(Z)$. A trajectory starting there exists for all time, because it stays in a compact set on which $Z$ is smooth. Its omega-limit set has no equilibrium. Extend $Z$ smoothly in the plane around this compact set and apply the planar Poincaré–Bendixson theorem: $cal(Z)$ contains a periodic orbit, a simple closed curve $C$.
  Every component of ${ mu_(*) > 0 }$ on the bounded side of $C$, intersected with either open regular half-meridian, would carry a positive harmonic function $rho = X sqrt(mu_(*))$. This function extends continuously to the compact closure and vanishes on its entire frontier: the frontier lies in an axis, the inner boundary, or $cal(Z)$. A positive maximum would therefore occur at an interior point, where $h_(+)$ is smooth and elliptic. The local strong maximum principle gives a contradiction. No ellipticity at the frontier is needed in this argument. Intersections of $C$ with a reflected axis cause no additional frontier: first restrict to either open half and then take a component; its relative frontier is contained in the listed sets, with $C$ itself already contained in $cal(Z)$.
  If $C$ surrounds the inner obstacle, the positive collar supplies such a component. Otherwise $C$ bounds a disk disjoint from the obstacle. The same maximum argument, together with $mu_(*) gt.eq 0$, forces $mu_(*) = 0$ on that entire disk; a positive point on an axis would have positive off-axis neighbors. Hence $Y$, and therefore $Z$, is nonvanishing on the closed disk. Its restriction to $C$ is a tangent field to a simple periodic orbit and has winding number one, whereas a nonvanishing field extending over a disk has winding number zero. This last contradiction proves $mu_(*) > 0$ throughout the interior. Simple connectivity now gives the global primitive $f$ in (9.2). ◻
]

=== 9.2 The static boundary and its conformal scale <the-static-boundary-and-its-conformal-scale>

#thm([Lemma 9.2.])[
  #emph[The static meridian has a smooth compact inner boundary, with 
$ h_(+) \|_(T S) = h \|_(T S) \, #h(2em) lambda = 0 \, #h(2em) \| upright(d) lambda \|_(h_(+)) = kappa . $

 If $N \|_S = 0$, then its boundary coordinates and $f$ are smooth in the original one-sided coordinates. If $N \|_S > 0$, then $lambda = sqrt(mu_(*))$ is a smooth static boundary coordinate, the static metric has an isometric reflection across $lambda = 0$, and 
#[#set math.equation(numbering: n => "(9.5)")
 $ f = - frac(log mu_(*), 2 kappa) + f_0 $ <k:log-time>]

 with $f_0$ smooth in the original coordinates up to $S$. These statements are compatible with ordinary axis regularity at the two poles.]
] <k:static-boundary>

#proof[
  In the zero-lapse case, the preceding Taylor expansions give $mu_(*) = s^2 \( kappa^2 + O \( s \) \)$. Taylor division on $s gt.eq 0$ shows that $lambda = s \( kappa + O \( s \) \)$, $alpha_Y \/ mu_(*)$, and $alpha_Y^2 \/ mu_(*)$ are smooth, the last vanishing to order two. Thus $h_(+)$ extends smoothly with the stated boundary value and normal derivative, and $upright(d) f$ extends smoothly. Its primitive also extends, after fixing an additive constant. This argument only requires one-sided smoothness.
  In the positive-lapse case, $mu_(*)$ itself is a boundary defining coordinate. At $S$, $upright(d) mu_(*) = 2 N kappa thin nu^flat$ and $alpha_Y = N nu^flat$, so in a smooth collar $\( mu_(*) \, z \)$ we can write
  $ alpha_Y = a_0 thin upright(d) mu_(*) + mu_(*) eta_0 \, #h(2em) a_0 = frac(1, 2 kappa) + mu_(*) a_1 \, $
  where $a_1$ and the tangential one-form $eta_0$ are smooth. Pull back by $mu_(*) = lambda^2$. Then
  #[#set math.equation(numbering: n => "(9.6)")
   $ h_(+) = h + #scale(x: 120%, y: 120%)[\(] 2 a_0 thin upright(d) lambda + lambda eta_0 #scale(x: 120%, y: 120%)[\)]^2 . $ <k:reflected-base>]
  The pulled-back $h$ has even tangential and normal coefficients and odd mixed coefficients under $lambda mapsto - lambda$. The one-form in parentheses changes sign under this reflection. The metric is consequently invariant, with vanishing mixed coefficients and normal coefficient $4 a_0^2 = kappa^(- 2)$ at the boundary. Its tangential block is the positive boundary block of $h$, proving nonsingularity and the asserted derivative of $lambda$. Moreover
  $ upright(d) f = - frac(upright(d) mu_(*), 2 kappa mu_(*)) - a_1 upright(d) mu_(*) - eta_0 . $
  The smooth remainder is closed, because $upright(d) f$ is closed. Integration in the collar gives (9.5).
  Choose all collars equivariantly under meridional axis reflection. The preceding divisions then preserve even and odd polar parity also at the poles. On an ordinary axis away from its endpoints the added term in $h_(+)$ has zero transverse radial component. Thus the usual no-cone condition is retained: $\| upright(d) X \|_(h_(+)) = 1$ on such an axis.
  We make the joint corner regularity explicit. Near a pole in the positive-lapse case choose equivariant coordinates $\( mu_(*) \, y \)$, with $y$ a signed transverse axis coordinate. The signed extension of $X$ is
  $ X = y A_X \( mu_(*) \, y^2 \) \, #h(2em) A_X > 0 . $
  The coefficients $h_(mu_(*) y)$ and $eta_y$, where $eta_0 = eta_y upright(d) y$, are odd in $y$, while $h_(y y) \( mu_(*) \, 0 \) = A_X \( mu_(*) \, 0 \)^2$ by the original no-cone condition. In $\( lambda \, y \)$, Equation (9.6) has components
  $ \( h_(+) \)_(lambda lambda) & = 4 lambda^2 h_(mu_(*) mu_(*)) + 4 a_0^2 \,\
\( h_(+) \)_(lambda y) & = 2 lambda h_(mu_(*) y) + 2 a_0 lambda eta_y \,\
\( h_(+) \)_(y y) & = h_(y y) + lambda^2 eta_y^2 . $
  They extend smoothly under both commuting reflections $lambda mapsto - lambda$, $y mapsto - y$. At the corner the metric is diagonal and positive, with normal entry $kappa^(- 2)$, and along $y = 0$ its $y y$ entry is $A_X \( lambda^2 \, 0 \)^2$. Thus no-cone regularity persists jointly up to the pole. The zero-lapse case uses the original smooth boundary coordinate $s$ and the same $y$-reflection, without requiring an $s$-reflection. ◻
]

#thm([Lemma 9.3.])[
  #emph[There are global static isothermal coordinates $\( sigma \, theta.alt \) in \[ 0 \, oo \) times \[ 0 \, pi \]$, with the inner boundary $sigma = 0$ and the two oriented axes $theta.alt = 0 \, pi$, in which 
#[#set math.equation(numbering: n => "(9.7)")
 $ h_(+) = P_(+) \( upright(d) sigma^2 + upright(d) theta.alt^2 \) \, #h(2em) rho = b sinh sigma sin theta.alt . $ <k:rho>]

 The boundary area density is 
#[#set math.equation(numbering: n => "(9.8)")
 $ X sqrt(P_(+)) = b / kappa sin theta.alt = R_0^2 sin theta.alt #h(2em) \( sigma = 0 \) . $ <k:area-density>]

 In particular, the scale $b$ is determined by the original area and the adjoint boundary condition.]
] <k:rod-scale>

#proof[
  Reflect the static meridian across the axes. Its conformal filling at infinity is a disk with a smooth boundary. Uniformize this disk, sending infinity to its center and the axis reflection to complex conjugation; inversion gives an exterior circular coordinate, and its logarithm gives the asserted strip. Smooth isothermal and boundary conformal regularity give nonsingular charts through the ordinary axes and up to the inner boundary, including their intersections. This uses the smooth boundary established in Lemma 41. In the positive-lapse case its two commuting corner reflections are carried to the coordinate reflections. Near $theta.alt = 0$, their smooth even and odd parities give
  #[#set math.equation(numbering: n => "(9.9)")
   $ sigma = lambda A_s \( lambda^2 \, y^2 \) \, #h(2em) theta.alt = y A_theta.alt \( lambda^2 \, y^2 \) \, #h(2em) A_s \, A_theta.alt > 0 \, $ <k:corner-chart>]
  with smooth coefficients; near the other pole use $pi - theta.alt$ instead. This follows by dividing each odd function by its coordinate and applying smooth even-function factorization in the two variables. It does not require analyticity. Thus $sigma \/ lambda$, $sin theta.alt \/ y$, and $X \/ sin theta.alt$ are smooth positive ratios jointly at the corner. In the zero-lapse case the same polar conclusion follows from the smooth chart in $\( s \, y \)$, with the $y$-reflection.
  For clarity, the end normalization in this construction retains an initially unknown positive constant. We use the reflected isothermal expansion (5.10), constructed in Section 5.3. The estimate $Y = O_2 \( r^(- 2) \)$ gives $h_(+) - h = O_2 \( r^(- 4) \)$ on the end. After inversion of an asymptotically Euclidean meridional chart, the reflected conformal structure extends across the origin with Hölder coefficients of every exponent $q' < 1$. Its isothermal rectification has a nonzero first derivative there; rescaled annulus estimates give the differentiated remainder. Reflection supplies the same expansion in ratio at the axes. It follows that, for some $c_oo > 0$,
  $ frac(X, e^sigma sin theta.alt) arrow.r c_oo \, #h(2em) sqrt(P_(+)) / e^sigma arrow.r c_oo $
  uniformly, the first quotient interpreted by its continuous polar extension. Since $lambda arrow.r 1$, the same first limit holds for $rho$. The harmonicity proved in Lemma 40 becomes flat harmonicity in the strip, and $rho$ vanishes continuously on each finite side.
  Put $b' = 2 c_oo$. For any $epsilon > 0$, at a sufficiently distant line $sigma = L$ the functions $\( b' plus.minus epsilon \) sinh sigma sin theta.alt$ bound $rho$. They have the same zero values on the finite sides. Maximum comparison on the finite rectangles, followed by $L arrow.r oo$ and then $epsilon arrow.b 0$, gives
  $ rho = b' sinh sigma sin theta.alt . $
  At the inner boundary, differentiation toward the domain gives $partial_(nu_(+)) rho = kappa X$, because $rho = X lambda$ and $\| upright(d) lambda \|_(h_(+)) = kappa$. As $nu_(+) = P_(+)^(- 1 \/ 2) partial_sigma$, this says
  $ X sqrt(P_(+)) = b' / kappa sin theta.alt #h(2em) \( sigma = 0 \) . $
  The original and static metrics agree tangentially there. The area of the original invariant boundary is therefore
  $ A = 2 pi integral_0^pi X sqrt(P_(+)) thin upright(d) theta.alt = frac(4 pi b', kappa) . $
  Since $kappa = b \/ R_0^2$ and $A = 4 pi R_0^2$, we obtain $b' = b$. ◻
]

=== 9.3 Identification of the map and the horizontal metric <identification-of-the-map-and-the-horizontal-metric>

#thm([Proposition 9.4.])[
  #emph[In the coordinates of Lemma 42, the stationary map and horizontal metric coincide with those of the Kerr–Newman model of parameters $M \, a \, Q$ from Lemma 9.]
] <k:identification>

#proof[
  Let $Phi_(*)$ denote the model map in (3.20), with the same ordered axis constants as $Phi$, and set
  $ w = sinh sigma sin theta.alt \, #h(2em) D = "dist"_G \( Phi \, Phi_(*) \)^2 . $
  Both maps satisfy the harmonic-map equation with weight $w$. The target is complete, simply connected, and nonpositively curved, as established in the axial reduction. Joint convexity of squared distance along its geodesics, applied to the two weighted harmonic-map equations, gives
  #[#set math.equation(numbering: n => "(9.10)")
   $ "div" \( w nabla D \) gt.eq 0 $ <k:distance>]
  in the open strip; derivatives and divergence in this display are Euclidean.
  We verify the boundary controls needed to use this inequality. By Lemma 5, on every bounded radial range the two axial lengths are comparable to the same ordinary transverse radius. Their logarithmic difference is consequently bounded. If $y$ is that radius, the electromagnetic potential differences from their common axis values are $O \( y^2 \)$, and the adjusted central potential differences are $O \( y^4 \)$. In particular, writing $Delta psi = psi - psi_(*)$, $Delta chi = chi - chi_(*)$, the central displacement
  $ \( z - z_(*) \) + psi_(*) Delta chi - chi_(*) Delta psi $
  is $O \( y^4 \)$. To bound distance, first change the height $u = log X$, then join the remaining three coordinates at fixed height. The target length of the latter path is controlled by
  $ X_(*)^(- 1) \( \| Delta psi \| + \| Delta chi \| \) + X_(*)^(- 2) \| \( z - z_(*) \) + psi_(*) Delta chi - chi_(*) Delta psi \| . $
  These quantities are bounded, indeed vanish at a regular axis. Lemma 41 preserves the ordinary transverse radius by a smooth positive ratio at the horizon–axis corners, so the same argument applies there. Away from the axes smoothness of both maps gives boundedness directly. Thus $D$ is bounded on every compact radial range, including all finite boundary faces and corners.
  At infinity the matched scale in (9.7) gives $u - u_(*) arrow.r 0$ uniformly. The end estimates (3.6) for the normalized potentials, including their polar ratios, give respectively
  $ X_(*)^(- 1) \( \| Delta psi \| + \| Delta chi \| \) = O \( e^(- sigma) \) \, #h(2em) X_(*)^(- 2) \| \( z - z_(*) \) + psi_(*) Delta chi - chi_(*) Delta psi \| = O \( e^(- 2 sigma) \) . $
  Here the common axis constants remove the otherwise singular polar terms. The preceding path estimate shows that $D arrow.r 0$ uniformly as $sigma arrow.r oo$.
  Fix $delta > 0$ and set $v = \( D - delta \)_(+)$. It vanishes on a sufficiently distant tail and is bounded. Test (9.10) with $chi_(upright("cut"))^2 v$, where $chi_(upright("cut"))$ is a compactly supported cutoff in the open strip. The weak chain rule and Cauchy’s inequality give
  #[#set math.equation(numbering: n => "(9.11)")
   $ integral w chi_(upright("cut"))^2 \| nabla v \|^2 lt.eq 4 integral w v^2 \| nabla chi_(upright("cut")) \|^2 . $ <k:capacity-test>]
  There is no outer error if the outer transition of $chi_(upright("cut"))$ is placed in the zero tail of $v$. At each finite side, with Euclidean distance $x$ to that side, use a cutoff that rises from zero to one on $epsilon^2 < x < epsilon$ with derivative $\( x \| log epsilon \| \)^(- 1)$. On a fixed radial range $w lt.eq C x$, and
  $ integral_(epsilon^2)^epsilon x lr(|frac(1, x log epsilon)|)^2 upright(d) x = frac(1, \| log epsilon \|) arrow.r 0 . $
  Products of these cutoffs treat the corners; their gradient energies are bounded by the sum of the individual energies. Letting $epsilon arrow.b 0$ in (9.11) proves $nabla v = 0$ throughout the open strip. Its zero tail makes $v = 0$. Finally $delta arrow.b 0$ gives $Phi = Phi_(*)$.
  It remains to determine a metric coefficient; map equality alone does not yet do this. Put
  $ q = log \( X sqrt(P_(+)) \) \, #h(2em) q_(*) = log \( X_(*) sqrt(P) \) \, $
  where $P = r^2 + a^2 cos^2 theta.alt$ is the model coefficient. The static quotient has spatial metric $e^(2 q) \( upright(d) sigma^2 + upright(d) theta.alt^2 \)$. Its scalar constraint, or directly (3.12), gives $- Delta q = \| partial Phi \|_G^2$; hence $q - q_(*)$ is harmonic. It vanishes on $sigma = 0$ by (9.8). At an ordinary axis the no-cone condition says $sqrt(P_(+)) = \| partial_theta.alt X \|$. Since $X = X_(*)$, the two nonsingular conformal scales have the same axis values. Inside the strip their logarithmic difference is precisely
  $ q - q_(*) = 1 / 2 log P_(+) / P . $
  It extends boundedly through the corners, because the static base metrics are smooth and positive, and tends uniformly to zero at infinity: both square-root scales are asymptotic to $\( b \/ 2 \) e^sigma$. Maximum comparison now gives $q = q_(*)$. Thus $P_(+) = P$, $X = X_(*)$, and $lambda = rho \/ X = lambda_(*)$, proving the proposition. The oriented crossing order of the axes, future static time, and increasing original azimuth have been preserved throughout; the Hodge-star conventions in (3.11) therefore agree. ◻
]

=== 9.4 Reconstruction of the original data <reconstruction-of-the-original-data>

Return now to the original, unpolarized data $\( g \, K \, E_f \, B_f \)$. Its metric decomposition is

$ g = h + X^2 \( upright(d) phi.alt + cal(A) \)^2 . $

For this subsection $E' \, B'$ denote its constant duality rotation with charges $\( Q \, 0 \)$. The model’s angular connection is $- omega_(*) thin upright(d) t$, where

$ omega_(*) = frac(a \( 2 M r - Q^2 \), W) \, #h(2em) r = M + b cosh sigma \, #h(2em) W = \( r^2 + a^2 \)^2 - a^2 Delta sin^2 theta.alt . $

#thm([Proposition 9.5.])[
  #emph[The map of the regular interior orbits into the model given by 
#[#set math.equation(numbering: n => "(9.12)")
 $ t = f \, #h(2em) \( sigma \, theta.alt \) = \( sigma \, theta.alt \) \( x \) \, #h(2em) phi.alt_(upright("KN")) = phi.alt + beta \, #h(2em) upright(d) beta = cal(A) + omega_(*) thin upright(d) f $ <k:embedding>]

 is well defined and induces all of the original data, after inverse constant duality rotation. It extends smoothly across the ordinary interior axes and approaches spatial infinity.]
] <k:lift>

#proof[
  Proposition 43 identifies the horizontal Lorentz metric, the map, and the map’s normal velocities on the graph $t = f$. In particular, the curvature identity in (3.11), including
  $ X^(- 2) omega \( n \) = s_3 = - frac(X f_a, 2) \, #h(2em) upright(d) cal(A) = f_a thin upright(d) A_h \, $
  identifies the pullback of $upright(d) \( - omega_(*) thin upright(d) t \)$ with $upright(d) cal(A)$. Consequently $upright(d) \( cal(A) + omega_(*) thin upright(d) f \) = 0$. The meridian is simply connected, so the real primitive $beta$ in (9.12) exists globally. On the graph the model’s fiber form becomes
  $ upright(d) phi.alt_(upright("KN")) - omega_(*) thin upright(d) t = upright(d) phi.alt + upright(d) beta - omega_(*) thin upright(d) f = upright(d) phi.alt + cal(A) . $
  Its horizontal metric is $h_(+) - lambda^2 upright(d) f^2 = h$ by (9.2). The induced metric is therefore exactly the original $g$.
  We also identify the full second fundamental form. The identities (3.17) make this explicit. The horizontal quotient tensor, together with $n \( log X \)$, determines the horizontal block $K \|_h$, by the tensor relation used in Proposition 33. The fiber-fiber unit entry is $K \( e \, e \) = n \( log X \)$. Finally the spatial identity
  $ omega = X^2 *_h l \, #h(2em) l = K \( e \, dot.op \) \|_h \, $
  determines the mixed block. All these quantities agree under the map, with the same future normal, so no component of $K$ is discarded in undoing polarization.
  Likewise, $upright(d) psi = X *_h E'_H$ and $upright(d) chi = X *_h B'_H$ recover both horizontal electromagnetic components. Their normal map velocities recover the remaining components through $E'_e = s_2$, $B'_e = - s_1$. Thus the rotated Maxwell fields agree. If $Q > 0$, apply
  #[#set math.equation(numbering: n => "(9.13)")
   $ E_f = frac(Q_e E' - Q_b B', Q) \, #h(2em) B_f = frac(Q_b E' + Q_e B', Q) \; $ <k:inverse-duality>]
  if $Q = 0$, use the identity rotation. The model then has the ordered original charges $\( Q_e \, Q_b \)$. The constant rotation preserves the stress tensor and $E_f times B_f$, so it also preserves the total angular-momentum normalization. The model choice $a = - J \/ M$ consequently has exactly the prescribed $J$ with the positive convention for $K$.
  Every interior meridional change above respects axis reflection. The differential defining the angular rotation has ordinary invariant polar parity, so its primitive gives a smooth rotation of each normal polar disk. This extends the map through the axes. Finally $upright(d) f = - alpha_Y \/ mu_(*) = O \( r^(- 2) \)$, and the global static meridional coordinates tend to the model’s spatial infinity. ◻
]

=== 9.5 Smooth attachment to the future horizon <smooth-attachment-to-the-future-horizon>

#thm([Proposition 9.6.])[
  #emph[The map in Proposition 44 extends to a smooth spacelike embedding of the original exterior including $S$, with a smooth future unit normal. If $N \|_S = 0$, its boundary is the bifurcation sphere. If $N \|_S > 0$, its boundary is a smooth cross-section of the future horizon.]
] <k:horizon>

#proof[
  In the zero-lapse case the static meridional coordinates and $f$ are already smooth up to $S$. In the positive-lapse case, the isometric reflection in Lemma 41, followed by conformal reflection across the inner circle, shows that $sigma$ is odd and $theta.alt$ even as functions of $\( lambda \, z \)$. Hence
  $ sigma / lambda > 0 \, #h(2em) theta.alt $
  extend as smooth even functions, and therefore as smooth one-sided functions of the original coordinate $mu_(*) = lambda^2$. At the poles, the joint smooth positive ratios in (9.9) give the original polar extension.
  The apparent singularity of the angular variable is removed in co-rotating coordinates. Put
  $ omega_H = a / R_0^2 \, #h(2em) phi.alt_sharp = phi.alt_(upright("KN")) - omega_H t . $
  On the graph its angular adjustment has differential
  $ upright(d) beta - omega_H upright(d) f = cal(A) + \( omega_(*) - omega_H \) upright(d) f . $
  The model expansion is $omega_(*) - omega_H = sigma^2 omega_2 \( sigma^2 \, theta.alt \)$, with smooth polar coefficients. This differential is therefore smooth also in the positive-lapse case, where $upright(d) f = - upright(d) mu_(*) \/ \( 2 kappa mu_(*) \) + upright(d) f_0$. It is closed and has a smooth primitive up to the boundary, with the same axis parity as before.
  Use local horizon coordinates
  #[#set math.equation(numbering: n => "(9.14)")
   $ U = - sigma e^(- kappa t) \, #h(2em) V = sigma e^(kappa t) . $ <k:null-coordinates>]
  They satisfy the exact identities
  #[#set math.equation(numbering: n => "(9.15)")
   $ - U V = sigma^2 \, #h(2em) - upright(d) U thin upright(d) V = upright(d) sigma^2 - kappa^2 sigma^2 upright(d) t^2 \, #h(2em) sigma^2 upright(d) t = frac(V upright(d) U - U upright(d) V, 2 kappa) . $ <k:null-identities>]
  To check that these are smooth nonsingular extension coordinates, the model has
  $ lambda_(*)^2 = P kappa^2 sigma^2 + sigma^4 L \( sigma^2 \, theta.alt \) \, $
  where $L$ and all the remaining model coefficients are smooth in $sigma^2$ and the ordinary angular variables. The leading horizontal block is
  $ P \( upright(d) sigma^2 - kappa^2 sigma^2 upright(d) t^2 \) = - P thin upright(d) U thin upright(d) V . $
  The error $sigma^4 L upright(d) t^2$ is a smooth quadratic expression in $V upright(d) U - U upright(d) V$. The fiber form in co-rotating coordinates is $upright(d) phi.alt_sharp - \( omega_(*) - omega_H \) upright(d) t$, which is smooth by (9.15). Thus the complete Lorentz metric extends nonsingularly, using ordinary angular patches at the poles. For the electric model potential, its coefficient on the horizon generator is constant. Subtract that constant times $upright(d) t$; the remaining time coefficient is $O \( sigma^2 \)$, smooth in $sigma^2$, so its field also extends smoothly. The same holds after the constant duality rotation.
  On the graph, if $N \|_S = 0$, both $U$ and $V$ vanish smoothly at $S$. This is the bifurcation sphere. If $N \|_S > 0$, use (9.5) to write instead
  #[#set math.equation(numbering: n => "(9.16)")
   $ V = sigma / sqrt(mu_(*)) e^(kappa f_0) \, #h(2em) U = - sigma / sqrt(mu_(*)) thin mu_(*) e^(- kappa f_0) . $ <k:future-graph>]
  Both are smooth in the original variables, with $U = 0$, $V > 0$ on $S$. This is the future horizon branch: in the exterior $U < 0 < V$, and the future stationary generator has components $kappa \( - U partial_U + V partial_V \)$. Figure 1 summarizes these two attachments.
  The extended map preserves the smooth positive original metric. It is thus an immersion and is spacelike up to $S$; the future unit normal then extends smoothly as well. It is injective in the interior, since its static meridional coordinates form a global coordinate change and each fiber map is a rotation. On the boundary the map to the horizon cross-section coordinates is a diffeomorphism, so distinct boundary points remain distinct. No interior point maps to the horizon. Finally compactness on bounded radial sets and properness at the end make the injective map proper onto its image, hence an embedding. The induced $K \, E_f \, B_f$, already identified in the interior, agree at $S$ by smooth extension. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.8, 0), (0, 3.515), fill: rgb("#f7f7ff"), stroke: none)
  line((-4.085, 0), (0.76, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((0.76, 0), [$U$], anchor: "north")
  line((0, -0.3325), (0, 3.8), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((0, 3.8), [$V$], anchor: "south")
  bezier((-3.087, 3.183), (0, 1.377), (-1.425, 2.042), (-0.5225, 1.567), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt))
  line((-2.945, 2.945), (0, 0), stroke: (thickness: 0.4pt, dash: "dashed"))
  circle((0, 1.377), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0.5225, 2.137), [$N|_S>0$#linebreak()\(U=0, V\>0\)], anchor: "west")
  line((0.5225, 2.137), (0.076, 1.415), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((0.7125, 0.6175), [$N|_S=0$#linebreak()\(U=V=0\)], anchor: "west")
  line((0.7125, 0.6175), (0.076, 0.0285), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((-2.328, 0.7125), [exterior#linebreak()\(U\<0\<V\)])
})],
  caption: [Figure 1: The two smooth horizon attachments in (9.14), with angular directions suppressed. The curves depict alternative spacelike slices. In the positive-lapse case the boundary value of $V$ may vary over the horizon sphere, as in (9.16). ],
) <k:horizon-figure>

=== 9.6 The converse for arbitrary admissible slices <the-converse-for-arbitrary-admissible-slices>

For a Kerr–Newman spacetime whose parameters have already been identified with $m \, J \, Q_e \, Q_b$, every smooth cross-section of the indicated horizon has area

#[#set math.equation(numbering: n => "(9.17)")
 $ A_H = 4 pi [(m + sqrt(m^2 - \( J \/ m \)^2 - Q^2))^2 + \( J \/ m \)^2] . $ <k:horizon-area>]

Indeed the horizon is nonexpanding and its null induced metric descends to its sphere of generators. The area is independent of the section. Substitution in the parameter identity of Lemma 9 gives equality in Theorem 2. This applies to nonconstant time graphs as well.

We supply the end identification also when an embedding into a subextremal Kerr–Newman exterior is given without initially equating its ambient parameters with the fluxes of the slice. This ensures that the converse uses exactly the asymptotic frame in the theorem.

#thm([Lemma 9.7.])[
  #emph[Let an original, unpolarized data set satisfying the asymptotic and rest-frame hypotheses of Theorem 2 be realized as a spacelike slice approaching spatial infinity in a subextremal Kerr–Newman exterior with parameters $M \, tilde(a) \, tilde(Q)_e \, tilde(Q)_b$. Then 
$ m = M \, #h(2em) J^2 = M^2 tilde(a)^2 \, #h(2em) Q_e^2 + Q_b^2 = tilde(Q)_e^2 + tilde(Q)_b^2 . $

 In a sufficiently distant stationary spatial chart the slice is a single graph $t = F \( macron(x) \)$, with $upright(d) F = O_1 \( \| macron(x) \|^(- 2) \)$.]
] <k:end-identification>

#proof[
  Write $r_x = \| x \|$ in the prescribed slice chart, let $T$ be the stationary time Killing field future at infinity, and decompose
  $ T = N_T n + Y_T . $
  Since the end approaches ambient spatial infinity, $N_T > \| Y_T \|_g$ eventually and $N_T^2 - \| Y_T \|_g^2 = - macron(g) \( T \, T \) arrow.r 1$. We first obtain
  #[#set math.equation(numbering: n => "(9.18)")
   $ N_T arrow.r 1 \, #h(2em) Y_T = O_2 \( r_x^(- 2) \) . $ <k:restricted-killing>]
  No prior bound on the tilt of the embedding is needed. The Gauss equation bounds the tangential ambient curvature components in the slice frame by $O \( r_x^(- 3) \)$; Codazzi bounds the components with one normal index by the same order. The remaining normal-normal block follows by contraction with the ambient Ricci tensor, whose components in this frame are $O \( r_x^(- 4) \)$ by the given electromagnetic fields and the Einstein–Maxwell equation. Thus $overline("Rm") = O \( r_x^(- 3) \)$ in the entire slice frame.
  The Killing first-jet equation $macron(nabla)^2 T = overline("Rm") * T$, split into tangential and normal components, therefore has the end bounds used in Lemma 38. The splitting adds only $K * accent(nabla T, ‾)$ and $\( nabla K + K * K \) * T$; the skew symmetry of $accent(nabla T, ‾)$ controls all its components by the tangential derivatives. In slice coordinates the Christoffel symbols and their derivatives are $O \( r_x^(- 2) \)$, $O \( r_x^(- 3) \)$. The radial first-jet integration and causality argument of that lemma consequently give constant limits with $O_2 \( r_x^(- q') \)$ errors, for any fixed $1 \/ 2 < q' < 1$. Here the normalization is determined by $- macron(g) \( T \, T \) arrow.r 1$, rather than by a variational prototype.
  For the original unpolarized data, the constraints and prescribed falloff give
  $ L \( g - delta \) = partial_i partial_j \( g - delta \)_(i j) - Delta_delta "tr"_delta \( g - delta \) = O \( r_x^(- 4) \) . $
  The pair $\( N_T \, Y_T \)$ satisfies $"sym" nabla Y_T = - N_T K$, with $K = O_1 \( r_x^(- 3) \)$, bounded $N_T$, and the constant asymptotics just proved. Since $m > 0$, the general assertion of Lemma 38 gives $Y_(T \, oo) = 0$. The norm limit then gives $N_(T \, oo) = 1$. Prolonging $"sym" nabla Y_T = - N_T K$ gives
  $ \| partial^2 Y_T \| lt.eq C r_x^(- 2) \| partial Y_T \| + C r_x^(- 3) \| Y_T \| + C r_x^(- 4) . $
  Twice integrating from the zero end limits, and reinserting the improved bounds, yields (9.18).
  Project along $T$ to stationary spatial coordinates $macron(x)$ of the ambient exterior, and restrict to $macron(r) = \| macron(x) \|$ sufficiently large. This projection is a local diffeomorphism on the slice, because a timelike vector cannot be tangent to a spacelike hypersurface. It is proper over that spatial tail: the end goes to ambient spatial infinity, and a compact core has bounded projected radius. Explicitly, for every ambient radius $R$ there is a slice radius $R_x \( R \)$ such that
  $ \| x \| > R_x \( R \) quad arrow.r.double quad \| macron(x) \| > R . $
  Thus the preimage of the ambient tail contains one whole connected intrinsic coordinate tail, and the preimage of any compact subset of the ambient tail is a closed subset of an intrinsic compact set. Its image is therefore open and closed in the connected tail, so it is surjective and a covering. The spatial tail is simply connected. Each component of its preimage covers the whole tail and hence reaches arbitrarily far out in the slice end: otherwise its closure would lie in an intrinsic compact set, whose projected radius is bounded. All such components must therefore intersect the one connected full intrinsic tail just specified. There is just one component and one sheet. This proves the single-graph assertion.
  The stationary orbit metric on this three-dimensional end pulls back to
  #[#set math.equation(numbering: n => "(9.19)")
   $ g_T = g + frac(\( Y_T^flat \)^2, N_T^2 - \| Y_T \|^2) . $ <k:orbit-metric>]
  By (9.18), it differs from $g$ by $O_2 \( r_x^(- 4) \)$ and has the same mass. In the ambient stationary chart, the same metric differs from the canonical spatial metric by $macron(g)_(t i) macron(g)_(t j) \/ \( - macron(g)_(t t) \) = O_2 \( macron(r)^(- 4) \)$. The canonical mass is $M$.
  Here the equality of masses in the two charts can be checked directly. Since both represent the same uniformly Euclidean metric, $D macron(x)$ and its inverse are bounded. Distances in the two ends show that $r_x$ and $macron(r)$ are comparable. The transformation law for the Christoffel symbols then gives $D^2 macron(x) = O \( r_x^(- 2) \)$. Integrating along rays and sphere paths yields a constant orthogonal matrix $O_(*)$ with
  #[#set math.equation(numbering: n => "(9.20)")
   $ D macron(x) = O_(*) + O \( r_x^(- 1) \) \, #h(2em) macron(x) = O_(*) x + O \( log r_x \) . $ <k:chart-transition>]
  The ADM flux comparison separates a pure Euclidean symmetric gradient, whose linear flux vanishes, from the original perturbation. Quadratic errors tend to zero. The Euclidean scalar linearization is integrable ($O \( r_x^(- 4) \)$), so asymptotically round deformed spheres give the same limit as round spheres. Thus $m = M$.
  In the $macron(x)$-chart the graph satisfies
  #[#set math.equation(numbering: n => "(9.21)")
   $ upright(d) F = frac(macron(g)_(t i) upright(d) macron(x)^i - Y_T^flat, N_T^2 - \| Y_T \|^2) = O_1 \( macron(r)^(- 2) \) . $ <k:graph-gradient>]
  Its vanishing tilt leaves the leading Coulomb fluxes unchanged, giving $Q_e^2 + Q_b^2 = tilde(Q)_e^2 + tilde(Q)_b^2$; possible orientation changes do not affect this identity. The graph tangents and the normalized future normal covector proportional to $- upright(d) t + upright(d) F$ give, with the positive convention for $K$,
  #[#set math.equation(numbering: n => "(9.22)")
   $ K_(i j) = K_(i j)^(upright("can")) + partial_i partial_j F + O \( macron(r)^(- 4) \) . $ <k:graph-tensor>]
  For every Euclidean rotation vector $R$,
  $ n_delta^i \( partial_i partial_j F \) R^j = R (partial_(macron(r)) F - F / macron(r)) . $
  Its round-sphere integral is zero because $R$ preserves the sphere area form. The trace-reversed Euclidean term also vanishes, since $R$ is tangential; all metric, normal, and area errors tend to zero at these decay orders. Hence the angular flux vector in this chart has the canonical norm $\| M tilde(a) \|$.
  Under (9.20), rotation vectors agree, up to the constant orthogonal change, with errors $O \( log r_x \)$. Their flux errors are $O \( log r_x \/ r_x \)$, since $K = O_1 \( r_x^(- 3) \)$. The corresponding spheres differ in radius by $O \( log r_x \)$, and their normals and relative area elements by $O \( log r_x \/ r_x \)$; these also give vanishing angular-flux errors. In the prescribed slice chart, axisymmetry forces the two transverse components of the angular flux vector to vanish. Its axial component is the prescribed total $J$, because the electromagnetic correction tends to zero at infinity. Thus its norm is $\| J \|$, proving $J^2 = M^2 tilde(a)^2$. ◻
]

If an admissible embedded slice is only said to meet the appropriate future horizon, its boundary is nevertheless a cross-section. An interior point cannot lie on the null face, by spacelikeness and the fact that the whole image lies on its exterior side. At a boundary contact use the smooth horizon coordinate $U$, with $U = 0$ on the future branch, $U < 0$ in the exterior, and $upright(d) U$ positive on future timelike vectors. Extend the spacelike embedding locally a little beyond its boundary; spacelikeness is an open condition. The cut $U = 0$ of this extension is a smooth MOTS with normal toward $U < 0$: its outgoing future null direction is tangent to the nonexpanding horizon. This remains true at bifurcation. The given $S$ touches this cut from the exterior side with the same outward orientation. Local graph strong comparison for the expansion equation makes the surfaces coincide near the contact. The contact set is therefore open and closed in the connected $S$, so all of $S$ lies on that branch. Projection along the horizon generators is a local diffeomorphism by spacelikeness. Compactness makes it a covering of the generator sphere, and simple connectivity makes it a diffeomorphism. Formula (9.17), with the parameter identifications of Lemma 46, now proves the converse.

#thm([Lemma 9.8.])[
  (Exclusion of partial bifurcation contact).  #emph[A smooth spacelike cross-section of the closed future horizon bounding an exterior with $theta_(+) = 0$ and the all-cut outer area-minimizing property lies entirely on the open future horizon or is the bifurcation sphere.]
] <k:horizon-cut-dichotomy>

#proof[
  This is a direct boundary argument, independent of the adjoint boundary dichotomy. In the smooth co-rotating coordinates (9.14), write the section as $U = 0 \, med V = v \( x \) gt.eq 0$, where $x$ ranges over the sphere of generators. Such a global graph exists because generator projection is a diffeomorphism. Smoothness of the model coefficients in $- U V$, with the weights imposed by the horizon Killing field $kappa \( - U partial_U + V partial_V \)$, gives on $U = 0$
  $ macron(g)_(U V) = - c \, quad macron(g)_(U A) = V b_A \, quad macron(g)_(A B) = q_(A B) \, quad macron(g)_(V A) = macron(g)_(V V) = 0 \, #h(2em) c > 0 \, $
  and
  $ partial_U macron(g)_(A B) = V d_(A B) \, #h(2em) partial_U macron(g)_(V A) = e_A \, #h(2em) partial_U macron(g)_(V V) = 0 . $
  Here $q$ is a positive sphere metric and all coefficients are smooth functions of $x$. The last identity follows from the stronger form $macron(g)_(V V) = U^2 a_2 \( U V \, x \)$; merely knowing $macron(g)_(V V) = 0$ on the horizon would not suffice.
  Set $ell = partial_V$, and choose the transverse future null normal $k$ with $macron(g) \( k \, ell \) = - 1$. The section tangents are $e_A^(thin S) = partial_A + v_A partial_V$; orthogonality gives
  $ k^U = 1 / c \, #h(2em) k^A = q^(A B) (v_B - frac(v b_B, c)) \, #h(2em) k_V = - 1 \, #h(2em) k_A = v_A . $
  The remaining component is fixed by nullness and is immaterial for the expansion because the horizon’s outgoing second fundamental form is zero. Direct contraction of $- macron(g) \( k \, macron(nabla)_(e_A^(thin S)) e_B^(thin S) \)$ with $q^(A B)$ gives the linear expression
  #[#set math.equation(numbering: n => "(9.23)")
   $ theta_k \[ v \] = Delta_q v + 1 / c chevron.l upright(d) c + e - b \, upright(d) v chevron.r_q + frac("tr"_q d - 2 "div"_q b, 2 c) thin v . $ <k:cut-expansion>]
  For example the relevant lower Christoffel coefficients are
  $ Gamma_(U \; A B) = V / 2 \( partial_A b_B + partial_B b_A - d_(A B) \) \, #h(2em) Gamma_(U \; V B) = 1 / 2 \( b_B - partial_B c - e_B \) \; $
  combining these with $k_V = - 1$, $k_A = v_A$ yields (9.23). The $V V$ coefficients vanish on the horizon, so there is no quadratic gradient term.
  Outer area minimization, applied to arbitrary nonnegative outward variations, implies $H gt.eq 0$. Since $theta_(+) = H + "tr"_S K = 0$, the other future expansion is $theta_(-) = "tr"_S K - H = - 2 H lt.eq 0$. The outward future normal $n + nu$ is a positive multiple of $ell$, so $n - nu$ is a positive multiple of $k$. Consequently $theta_k \[ v \] lt.eq 0$. Equation (9.23) is a uniformly elliptic linear inequality for the nonnegative smooth function $v$. The strong minimum principle applies even if its zeroth-order coefficient has either sign: in the operator $- theta_k$, replace that coefficient by its positive part, which preserves the supersolution inequality because $v gt.eq 0$. Hence a zero of $v$ forces $v equiv 0$ on the connected sphere. Otherwise $v > 0$ everywhere, proving the two alternatives. ◻
]

=== 9.7 Sharp examples and completion of the proof <sharp-examples-and-completion-of-the-proof>

The canonical constant Boyer–Lindquist-time slice $sigma gt.eq 0$ provides a sharp example for every subextremal choice of parameters on the strict branch. Its topology is the rotation exterior, and it is complete with its compact boundary included. In the Euclidean end radius $rho_0 = \( b \/ 2 \) e^sigma$, the model metric has Cartesian expansion

$ g_(i j)^(upright("can")) = (1 + frac(2 M, rho_0)) delta_(i j) + O_4 \( rho_0^(- 2) \) . $

The angular shift is $O \( rho_0^(- 3) \)$, so $K^(upright("can")) = O_3 \( rho_0^(- 3) \)$. The electric model potential has time coefficient $Q \/ r + O \( r^(- 3) \)$ and spatial angular coefficient $O \( r^(- 1) \) sin^2 theta.alt$. It gives the required radial Coulomb electric term and $O_3 \( rho_0^(- 3) \)$ magnetic field; inverse duality gives both prescribed charges. All differentiated bounds follow by smooth expansion in $rho_0^(- 1)$ with ordinary polar parity. The bifurcate coordinates used above prove inner-boundary regularity. The source-free constraints, integrability, and $P_(upright("ADM")) = 0$ follow, with energy $M$, angular momentum $- a M$, and the specified charges.

We verify the two geometric boundary hypotheses for these examples, including cuts that are neither invariant nor trapped. On the $sigma$-spheres, the tangential trace of $K^(upright("can"))$ is zero, because its only nonzero entries are mixed azimuthal entries. For the smooth outward unit radial field $V_r = P^(- 1 \/ 2) partial_sigma$,

#[#set math.equation(numbering: n => "(9.24)")
 $ theta_(+) = H = "div" V_r = frac(partial_sigma W, 2 W sqrt(P)) . $ <k:radial-expansion>]

This is zero at $sigma = 0$ and positive outside. Indeed,

$ partial_r W = 4 r \( r^2 + a^2 \) - 2 a^2 \( r - M \) sin^2 theta.alt gt.eq 4 r^3 + 2 a^2 \( r + M \) > 0 \, $

and $partial_sigma r = b sinh sigma > 0$ outside. At a largest-radius point of an enclosing interior surface, the outward tangent normal is $V_r$ and its mean curvature is at least that of the tangent radial leaf. The tangential planes, hence their $K$-traces, agree at that point. Equation (9.24) therefore excludes every compact enclosing surface with $theta_(+) lt.eq 0$ everywhere, also when it has several components.

Finally let $D$ be any enclosing end-side domain in the definition of Theorem 2, with full intrinsic boundary $Gamma$, and let $n_D$ point out of $D$. Truncate the whole exterior and $D$ at a common distant radial sphere. Subtracting their divergence identities gives

$ 0 lt.eq integral_(Omega \\ D) "div" V_r thin upright(d) V_g = - A \( S \) - integral_Gamma chevron.l V_r \, n_D chevron.r thin upright(d) A_g . $

The identity counts portions of $Gamma$ coinciding with $S$, including the case $D = Omega$. Since $\| V_r \| = 1$,

$ A \( S \) lt.eq - integral_Gamma chevron.l V_r \, n_D chevron.r thin upright(d) A_g lt.eq "Area"_g \( Gamma \) . $

Thus the canonical horizon is outer area-minimizing for the full class of cuts.

#proof[
  #emph[Completion of Theorem 2.] Corollary 19 proves the numerical inequality on the closed physical branch. On the strict branch, Proposition 33 supplies the stationary quotient and its boundary conditions. Lemmas 40–42 and Proposition 43 identify that quotient with the subextremal model determined by Lemma 9. Propositions 44 and 45 give the required smooth embedding of the original metric, tensor, and electromagnetic fields, with its future normal and its stated boundary image. The horizon area formula and Lemma 46 prove the converse, and the canonical examples verify sharpness within the stated class. No classification on the extremal equality branch is asserted. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
