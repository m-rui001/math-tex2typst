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

#align(center)[#text(size: 16pt, weight: "bold")[Smooth anisotropic uniqueness in the Calderón problem \
from one boundary patch]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <intro:section>

Calderón’s inverse boundary problem asks whether boundary measurements determine the coefficients of an elliptic equation. In its geometric form, the unknown is a Riemannian metric and the measurements are the Dirichlet energy of harmonic extensions. A change of interior coordinates that fixes the measured boundary points preserves these measurements. We prove that this is the only ambiguity for smooth metrics in dimension at least three, even when both the prescribed values and the observations are confined to one arbitrary open boundary patch.

=== 1.1 The measurement and the theorem <the-measurement-and-the-theorem>

Let $M$ be a compact connected smooth $n$-manifold with nonempty smooth boundary, and let $g$ be a smooth positive-definite Riemannian metric on $M$, including its boundary. All volume and surface integrals use densities, so no orientation is required. For $f in H^(1 \/ 2) \( partial M \)$, let $u_f^g in H^1 \( M \)$ be the unique weak solution of

$ - Delta_g u_f^g = 0 quad upright("in ") M \, #h(2em) u_f^g \|_(partial M) = f . $

Here $Delta_g = "div"_g nabla_g$. For a nonempty relatively open set $Gamma subset partial M$, put

$ H_(c o)^(1 \/ 2) \( Gamma \) = { f in H^(1 \/ 2) \( partial M \) : "supp" f subset Gamma } . $

Equip this space with the norm inherited from $H^(1 \/ 2) \( partial M \)$. The local energy Dirichlet-to-Neumann map is the bounded operator

$ Lambda_(g \, Gamma) : H_(c o)^(1 \/ 2) \( Gamma \) arrow.r \( H_(c o)^(1 \/ 2) \( Gamma \) \)^(*) $

defined by

#[#set math.equation(numbering: n => "(1.1)")
 $ chevron.l Lambda_(g \, Gamma) f \, h chevron.r = integral_M chevron.l upright(d) u_f^g \, upright(d) u_h^g chevron.r_g thin upright(d) V_g . $ <intro:energy>]

For smooth supported data, Green’s formula writes this as

#[#set math.equation(numbering: n => "(1.2)")
 $ chevron.l Lambda_(g \, Gamma) f \, h chevron.r = integral_Gamma h thin partial_(nu_g) u_f^g thin upright(d) S_g \, #h(2em) f \, h in C_c^oo \( Gamma \) \, $ <intro:density>]

where $nu_g$ is the outward unit normal. Thus the measured output includes its boundary density. Equality on smooth supported data is equivalent to equality of the maps: each element of $H_(c o)^(1 \/ 2) \( Gamma \)$ has compact support in $Gamma$ and can be approximated in $H^(1 \/ 2) \( partial M \)$ by smooth functions supported in a fixed larger compact subset of $Gamma$.

#thm([Theorem 1.1.])[
  (Smooth anisotropic uniqueness from one patch).  #emph[Let $n gt.eq 3$. Let $M$ be a compact connected smooth $n$-manifold with nonempty smooth boundary, and let $Gamma subset partial M$ be nonempty, proper, and relatively open. If two smooth Riemannian metrics $g_1 \, g_2$ on $M$ satisfy 
$ Lambda_(g_1 \, Gamma) = Lambda_(g_2 \, Gamma) \, $

 then there is a smooth diffeomorphism $Phi : M arrow.r M$, smooth through the boundary, such that 
$ Phi \|_Gamma = upright("Id") \, #h(2em) g_2 = Phi^(*) g_1 . $

]
] <main:patch>

Equality of the graphs of these operators is equivalent to the hypothesis. Theorem 1 resolves positively the smooth anisotropic Calderón uniqueness problem with arbitrary same-patch measurements. The datum is the density-valued energy map defined above. The boundary may have several components and the manifold may be nonorientable. The conclusion fixes every measured boundary point; it imposes no pointwise condition on the inaccessible boundary.

The diffeomorphism ambiguity is unavoidable. If $Phi$ fixes $Gamma$ and $g_2 = Phi^(*) g_1$, then for $f$ supported in $Gamma$ the pullback $u_f^(g_1) compose Phi$ has boundary value $f$. Indeed a boundary diffeomorphism fixing $Gamma$ also preserves its complement. Change of variables in the energy proves equality of the local maps.

#thm([Corollary 1.2.])[
  (Full-boundary uniqueness).  #emph[Let $M \, g_1 \, g_2$ satisfy the geometric hypotheses of Theorem 1. If their Dirichlet energies agree for every pair of smooth boundary values, there is a smooth diffeomorphism $F : M arrow.r M$ fixing $partial M$ pointwise and satisfying $g_1 = F^(*) g_2$.]
] <main:full>

#proof[
  Fix $p in partial M$ and apply Theorem 1 to $Gamma = partial M \\ { p }$. This is a nonempty proper open patch, dense in the entire boundary. Continuity makes the resulting $Phi$ the identity on $partial M$. Take $F = Phi^(- 1)$. ◻
]

There is also a consequence with no coordinate ambiguity. Let $Omega subset bb(R)^n$ be bounded and connected with smooth boundary, let $Gamma subset partial Omega$ be nonempty and relatively open, and let $gamma in C^oo \( overline(Omega) \)$ be strictly positive. For $f in C_c^oo \( Gamma \)$, extended by zero to the rest of the boundary, solve

$ "div" \( gamma nabla u_f^gamma \) = 0 quad upright("in ") Omega \, #h(2em) u_f^gamma \|_(partial Omega) = f . $

With $nu_e$ the outward Euclidean unit normal, define the local conductivity map by

$ Lambda_gamma^Gamma f = gamma partial_(nu_e) u_f^gamma\|_Gamma . $

#thm([Corollary 1.3.])[
  (Smooth scalar uniqueness from one patch).  #emph[Let $n gt.eq 3$, and let $Omega$ and $Gamma$ be as above. If two strictly positive conductivities $gamma_1 \, gamma_2 in C^oo \( overline(Omega) \)$ satisfy 
$ Lambda_(gamma_1)^Gamma f = Lambda_(gamma_2)^Gamma f quad upright("for every ") f in C_c^oo \( Gamma \) \, $

 then $gamma_1 = gamma_2$ on $overline(Omega)$.]
] <main:scalar>

The reduction in Section 8 identifies the exact metric energy associated with a scalar conductivity. It then proves that a conformal self-diffeomorphism of the domain fixing a boundary patch must be the identity. No conductivity values on the inaccessible boundary are assumed.

=== 1.2 Historical context <historical-context>

Calderón formulated the inverse conductivity problem through boundary measurements of Dirichlet energy and studied its linearization #cite(label("Calderon1980")). Kohn and Vogelius established scalar boundary determination #cite(label("KohnVogelius1984")). Sylvester and Uhlmann proved full-data uniqueness for smooth scalar conductivities in Euclidean dimensions at least three using complex geometrical optics solutions #cite(label("SylvesterUhlmann1987")). For anisotropic conductivities, Lee and Uhlmann developed boundary determination and proved real-analytic recovery under geometric and topological hypotheses #cite(label("LeeUhlmann1989")). Lassas and Uhlmann subsequently recovered a real-analytic manifold and metric from an arbitrary nonempty real-analytic boundary patch in dimensions at least three, without the earlier topological restrictions #cite(label("LassasUhlmann2001")) Theorem 1.1(ii). Their Green-function method also led to the complete-manifold extension of Lassas, Taylor, and Uhlmann #cite(label("LassasTaylorUhlmann2003")). Guillarmou and Sá Barreto proved same-patch uniqueness for smooth compact Einstein manifolds with the same Einstein constant, recovering a boundary neighborhood from the Einstein equation before applying analytic continuation in the interior #cite(label("GuillarmouSaBarreto2009")) Theorem 1.1.

For smooth scalar partial data, Bukhgeim and Uhlmann introduced a Carleman-based recovery method #cite(label("BukhgeimUhlmann2002")). Kenig, Sjöstrand, and Uhlmann prescribed input near a back face and observation near a front face defined by a point outside the convex hull #cite(label("KenigSjostrandUhlmann2007")) Theorem 1.1; their conductivity corollary also assumes equality on the whole boundary #cite(label("KenigSjostrandUhlmann2007")) Corollary 1.4. The two measurement regions are constrained by this geometry. In dimension three, Isakov obtained same-patch uniqueness by reflection when the inaccessible boundary lies in a plane or sphere #cite(label("Isakov2007")). Dos Santos Ferreira, Kenig, Sjöstrand, and Uhlmann proved the density-of-products theorem for the linearized Schrödinger same-patch problem at zero potential #cite(label("DosSantosFerreiraEtAl2009")) Theorem 1.1. Alessandrini and Kim obtained same-patch stability for scalar conductivities known near the whole boundary #cite(label("AlessandriniKim2012")).

Smooth geometric results also exploit special backgrounds. Dos Santos Ferreira, Kenig, Salo, and Uhlmann developed limiting Carleman weights and recovered potentials and conformal factors on admissible manifolds, which are conformal to submanifolds of a product with a simple transverse factor #cite(label("DSFKSU2009")). Kenig and Salo extended partial-data methods on such product geometries and related them to geodesic and broken-ray transforms #cite(label("KenigSalo2013")).

Recent full-data results establish rigidity near prescribed smooth backgrounds. Lin proves rigidity near the Euclidean metric under smallness in a Hölder norm #cite(label("Lin2026")) Theorem 1.1. Muñoz-Thon and Stefanov prove local rigidity near every smooth conformally Euclidean metric under Sobolev smallness #cite(label("Stefanov2026")) Theorem 2. Chen, Jiang, Liu, and Tao obtain same-patch results under quasianalyticity, and smooth results with additional foliation and one-sided ordering assumptions #cite(label("ChenJiangLiuTao2026")) Corollary 1.2, Theorem 1.6 and Corollary 1.7. Theorem 1 allows arbitrary smooth metrics and an arbitrary common input and observation patch.

Uhlmann and Wang recover compactly supported potentials, and conformal factors equal to one near the boundary, on a fixed near-Euclidean three-dimensional metric with strictly convex boundary and an invertible Dirichlet problem #cite(label("UhlmannWangNear2026")). Their partial-data result recovers a potential near the measured boundary in a strictly convex three-dimensional domain, with the potential supported away from the measured patch #cite(label("UhlmannWangPartial2026")). Daudé, Enciso, Helffer, Kamran, and Nicoleau propagate local DN equality to a whole connected boundary component when the metrics already agree in a collar of that component #cite(label("DaudeEtAlPropagation2026")). These results clarify the separate roles of a prescribed background, an initial region of coefficient agreement, and the region reached by the measurements.

Harmonic functions provide an intrinsic way to describe points and coordinates. Greene and Wu studied embeddings by harmonic functions #cite(label("GreeneWu1975")); the Poisson embedding approach of Lassas, Liimatainen, and Salo represents a point by its evaluation on boundary-generated harmonic functions #cite(label("LLS20")). Their source embedding treats solutions generated in a remote interior region #cite(label("LLS20")) Section 6.1. The smooth separation, approximation and finite-jet arguments are local tools; their global continuation results in dimensions at least three require real analyticity. Here the smooth continuation step is supplied by Theorem 8; its uniform estimate on shrinking surfaces is the central analytic argument.

The approximation mechanism goes back to Lax and Malgrange #cite(label("Lax1956")) #cite(label("Malgrange1956")). Rüland and Salo developed its quantitative supported-boundary form #cite(label("RulandSalo2019")). We use point-distribution duality to obtain just the finite harmonic jets needed for the local argument. Localized boundary determination and exterior data transfer have further precedents in #cite(label("AlessandriniGaburro2009")) #cite(label("AlessandriniKim2012")).

=== 1.3 Proof strategy <proof-strategy>

The global argument is organized around the local metric extension Theorem 8. Its input is a pair of interior harmonic coordinate charts in which the metrics, their Green kernels, and a finite family of paired harmonic functions already agree on one side of a smooth hypersurface. The first-side Hessians span all second derivatives allowed by the harmonic equation. The theorem extends metric equality across the hypersurface. The main task is to prove this continuation theorem for smooth coefficients.

First, the measured energy form supplies the interior data needed to start. Local boundary determination recovers the full boundary jets and permits an exterior cap on which the metrics agree. A variational comparison then makes the actual Dirichlet Green kernels agree on the cap. Harmonic functions generated by sources in a remote part of that cap separate interior points and supply all admissible second-order harmonic jets. They will identify the paired charts and the finite harmonic family required by the local theorem.

Inside these charts, a mixed Green kernel solves the first metric equation in its first variable and the second metric equation in its second variable. Product continuation constructs this kernel at fixed positive separation from the diagonal. Common-basis methods for this separately harmonic extension have antecedents in #cite(label("Zeriahi1982")). Its flux on a small sphere centered at $y$ defines a functional $T_y$ that maps local first-metric harmonic functions to local second-metric harmonic functions. It sends each chosen first-side function to its paired second-side function and reproduces constants and coordinates: $T_y 1 = 1$ and $T_y x^i = y^i$. Existence at each positive radius is not yet a bound as that radius tends to zero.

To compare conformal classes, we normalize the inverse metrics to have the same trace against a reference metric conformal to the first. The shrinking argument temporarily assumes that their difference, together with a fixed finite number of its derivatives, is small compared with the sphere radius $r$. Under this assumption, we construct the transfer functional and bound its representing density uniformly in $L^2$ over a fixed set of centers and their unit spheres. Exact reproduction of constants and coordinates cancels the affine Taylor polynomial of a harmonic function. Its remainder has size $O \( r^2 \)$ on the sphere, so for a paired harmonic difference $V$ we obtain an $L^2$ bound for $V \/ r^2$. Finite-order interpolation then bounds the needed derivatives of $V$ by $C r^(3 \/ 2)$. The spanning harmonic Hessians turn this into the same superlinear bound for the normalized metric discrepancy and its required derivatives. It is a strict improvement of the temporary bound at small radii.

There are two scales in this argument. A spatial dilation is chosen once to make the initial metric discrepancy small and to handle radii above a fixed threshold. The strict improvement then allows the radius parameter to tend to zero with that dilation held fixed. The radii vanish on a fixed neighborhood, forcing equality of the normalized inverse metrics there. This determines the metrics up to a conformal factor. The common harmonic coordinates force that factor to be constant when $n gt.eq 3$, and agreement on the known side fixes it.

The uniform density estimate must control the full equation obtained by differentiating traces on the moving spheres. Comparing spherical harmonic degree-raising and degree-lowering operators gives a positive weighted estimate, using the tensor and spherical-harmonic framework that also appears in tensor tomography #cite(label("PSU15")) #cite(label("GPSU16")). The moving geometry contributes second-order terms, which cannot simply be treated as lower-order errors. A second comparison retains those terms and bounds their contribution by the positive quantities in the first estimate.

Finally, the source evaluations make the local identifications single-valued and prevent an interior point from escaping to the boundary. A ball in the matched region touching its frontier supplies the one-sided geometry of the local theorem. Applying that theorem eliminates every interior frontier. The resulting isometry extends smoothly through the boundary, and the original supported boundary data force it to fix all of $Gamma$.

Section 2 constructs the common cap and harmonic tests. Section 3 states the local extension theorem and constructs product continuations at fixed separation; Section 4 uses them to construct the sphere functionals. Section 5 proves the coercive estimate and bounds the transfer density. Section 6 turns the resulting moment bound into local metric extension. Section 7 gives the global identification and the boundary conclusion. Section 8 proves the scalar conductivity consequence.

== 2 Boundary data and a common interior region <data:section>

We first convert the measurements into data that can be continued in the interior. Equality of the energy maps determines the full boundary jets on the measured patch. These jets allow us to attach the same exterior cap to both metrics. Sources in that cap then supply common Green data and the finite families of harmonic functions needed in the local proof.

We use $Delta_g = "div"_g nabla_g$ and positive Riemannian densities throughout. In particular, no orientation is chosen. The Dirichlet realization of $L_g = - Delta_g$ on a compact connected smooth manifold with nonempty boundary is invertible: its quadratic form on $H_0^1$ is coercive. Smooth sources and boundary values give solutions smooth up to the boundary. We use interior elliptic regularity and unique continuation for smooth scalar second-order elliptic operators with real positive principal part, including a metric Laplacian multiplied by a positive smooth function. Here unique continuation means that an existing solution which vanishes on a nonempty open subset of a connected domain vanishes throughout that domain; see #cite(label("KochTataru2005")) Theorem 8. For a positive scalar elliptic principal symbol, the local noncharacteristic-surface condition applies at every smooth hypersurface; propagation through overlapping coordinate balls gives this open-set form of continuation.

We will also use its boundary version. If a smooth harmonic function has both zero value and zero normal derivative on an open boundary patch, extend the metric smoothly across that patch and the function by zero. Green’s formula shows that the extended function solves the equation distributionally: neither a value jump nor a flux jump remains. Elliptic regularity and interior unique continuation give vanishing in a neighborhood of the patch, and then in the connected interior.

=== 2.1 The density and the boundary jets <the-density-and-the-boundary-jets>

The distinction between the measured energy operator and the ordinary unit-normal DN operator matters in the first step. The latter sends $f$ to $partial_(nu_g) u_f$; the former sends it to the density $partial_(nu_g) u_f thin d S_g$.

#thm([Lemma 2.1.])[
  (Boundary jets).  #emph[Let $g_1 \, g_2$ be smooth metrics on a compact connected smooth $n$-manifold $M$ with nonempty boundary, where $n gt.eq 3$. Suppose their energy maps agree for inputs and observations in a nonempty relatively open set $Gamma subset partial M$. In boundary-normal coordinates for the respective metrics, based on the same coordinates on $Gamma$, their complete boundary Taylor jets agree.]
] <data:jets>

#proof[
  Fix a boundary chart compactly contained in $Gamma$, write $m = n - 1 gt.eq 2$, and let $h$ denote the tangential metric matrix. Relative to the coordinate density, the energy operator has principal symbol
  $ e_1 \( z \, xi \) = sqrt(det h \( z \)) sqrt(h^(a b) \( z \) xi_a xi_b) . $
  Thus its square determines the positive matrix
  $ C = \( det h \) h^(- 1) \, #h(2em) det C = \( det h \)^(m - 1) \, #h(2em) h = \( det C \)^(1 \/ \( m - 1 \)) C^(- 1) . $
  The two induced metrics, and hence their boundary densities, are therefore equal. Dividing the common density-valued operator by this known density gives equality of the ordinary DN operators locally. Cutoffs supported in $Gamma$ and equal to one near a chosen point give equality of their complete symbols there.
  We give the scalar symbol recursion to make its smooth and local content explicit. This boundary determination goes back to #cite(label("LeeUhlmann1989"), form: "prose"); see also #cite(label("JoshiLionheart2005"), form: "prose") Theorem 1.1(ii) and Proposition 3.1. In inward normal coordinates $s gt.eq 0$, write
  $ g = d s^2 + h \( s \, z \) \, #h(2em) a = 1 / 2 "tr" \( h^(- 1) partial_s h \) \, #h(2em) L_g = - partial_s^2 - a partial_s + P \, $
  where $P = - Delta_(h \( s \))$ is tangential. Smooth boundary factorization gives a tangential operator $B \( s \)$ of order one, with positive principal symbol, such that
  #[#set math.equation(numbering: n => "(2.1)")
   $ L_g = \( - partial_s + B - a \) \( partial_s + B \) med \( mod med Psi^(- oo) \) \, #h(2em) B^2 - a B - partial_s B = P med \( mod med Psi^(- oo) \) . $ <data:factorization>]
  Here the remainders are tangentially smoothing and depend smoothly on $s$. The local Poisson parametrix identifies $B \( 0 \)$, modulo smoothing, with the outward DN operator: the decaying branch satisfies $\( partial_s + B \) u = 0$ and $partial_nu = - partial_s$. This is a local factorization for smooth coefficients; it makes no analyticity assumption.
  For precision, use left symbols and $D_z = - i partial_z$, so
  $ b \# c tilde.op sum_alpha frac(\( 1 \/ i \)^(\| alpha \|), alpha !) \( partial_xi^alpha b \) \( partial_z^alpha c \) . $
  Write $b tilde.op b_1 + b_0 + b_(- 1) + dots.h.c$ for the symbol of $B$ and $p = p_2 + p_1$ for that of $P$. Then
  $ b_1 = rho = \( h^(a b) xi_a xi_b \)^(1 \/ 2) \, #h(2em) b \# b - a b - partial_s b = p . $
  The equation of degree one is
  $ 2 rho b_0 + 1 / i partial_xi rho dot.op partial_z rho - a rho - partial_s rho = p_1 . $
  The terms $p_1$ and the tangential composition term involve only $h$ and its tangential derivatives. Since
  $ partial_s rho = - frac(\( partial_s h \) \( xi^sharp \, xi^sharp \), 2 rho) \, $
  the part of $b_0$ containing a normal derivative is
  $ 1 / 4 ("tr"_h partial_s h - frac(\( partial_s h \) \( xi^sharp \, xi^sharp \), rho^2)) . $
  At each subsequent degree the new coefficient is obtained from
  $ 2 rho b_(1 - k) = partial_s b_(2 - k) + R_k \, #h(2em) k gt.eq 2 \, $
  where $R_k$ uses normal derivatives of $h$ only through order $k - 1$ and finitely many tangential derivatives. Indeed all other terms in the symbol product use earlier coefficients, and tangential differentiation does not increase normal derivative order. Writing $A_k = partial_s^k h$, induction gives the highest-jet term
  #[#set math.equation(numbering: n => "(2.2)")
   $ b_(1 - k) = frac(1, 4 \( 2 rho \)^(k - 1)) ("tr"_h A_k - frac(A_k \( xi^sharp \, xi^sharp \), rho^2)) + upright("terms involving lower normal jets") . $ <data:highest-jet>]
  Differentiating $rho$, the raising of indices, or the coefficient in the preceding induction step contributes only lower-jet terms.
  Suppose the two normal jets agree through order $k - 1$ as smooth functions on the boundary chart. Their tangential derivatives also agree. Equality of the symbols and Equation (2.2) give, for $A = partial_s^k \( h_1 - h_2 \) \|_(s = 0)$,
  $ "tr"_h A - A \( v \, v \) = 0 #h(2em) \( \| v \|_h = 1 \) . $
  Polarization yields $A = \( "tr"_h A \) h$. Taking the trace gives $\( m - 1 \) "tr"_h A = 0$, so $A = 0$. Starting from the already recovered boundary metric, induction proves all normal and mixed jet equalities. The normal metric components are $g_(s s) = 1$ and $g_(s a) = 0$, so these are the full metric jets.
  Every step is local to a half-coordinate ball and uses densities. Although the differential-form formulation in #cite(label("JoshiLionheart2005")) assumes orientability, this scalar coordinate proof requires none. Other boundary components affect only the local smoothing remainder. Finally, equality of smooth jets asserts no equality in an interior collar. ◻
]

=== 2.2 Attaching a common cap <attaching-a-common-cap>

The jets provide a common region on the exterior side of a smaller patch. The following energy argument transfers the measured data to that region without making assumptions on the inaccessible boundary.

#thm([Proposition 2.2.])[
  (Common cap and Green data).  #emph[Under the hypotheses of Lemma 4, there are compact connected smooth extensions $\( M_j^e \, g_j^e \)$ of $\( M \, g_j \)$ and an identified connected open exterior cap $E$ on which the extended metrics agree. The cap is attached through a nonempty open set $P_0 subset.double Gamma$. The extended zero-Dirichlet Green kernels satisfy 
$ G_1 \( x \, y \) = G_2 \( x \, y \) \, #h(2em) x \, y in E \, quad x eq.not y . $

 For every $F in C_c^oo \( E \)$, the two extended zero-Dirichlet solutions with source $F$ agree on $E$.]
] <data:cap>

#proof[
  Choose a boundary coordinate patch $P subset.double Gamma$ and a nonnegative smooth bump $b$ with $"supp" b subset.double P$ and connected, nonempty positivity set $P_0 = { b > 0 }$. Use the separate inward normal collars of Lemma 4, and replace the boundary $s = 0$ by the graph $s = - b \( z \)$. Take $b$ sufficiently small that this graph lies in a collar. It gives smooth compact connected extended manifolds. Their common open added part is
  $ E = { \( z \, s \) : - b \( z \) < s < 0 } . $
  Extend the first metric smoothly to negative $s$ and use the same exterior metric for the second. A smooth extension of its coordinate coefficients exists in a collar and remains positive definite after shortening the collar. Their jets match on an open neighborhood of $"supp" b$. Pasting across the entire hypersurface $s = 0$ in that neighborhood is therefore smooth, to every order. Restricting this pasting to $s gt.eq - b \( z \)$ proves smoothness also at the edges of the bump. We henceforth omit the superscript on the extended metrics.
  For the following comparison, identify the two extensions by the identity on the original $M$ and by the common collar coordinates on $E$. This identification and its inverse are smooth up to each side of the seam, with bounded derivatives, and agree on the seam. In collar charts they are therefore bi-Lipschitz. In particular they identify the spaces $H_0^1$ on the two extensions.
  Fix a real $F in C_c^oo \( E \)$ and let $w_j$ minimize
  $ cal(J)_j \( w \) = 1 / 2 integral_(M_j^e) \| d w \|_(g_j)^2 thin d V_(g_j) - integral_E F w thin d V_(g_j) quad upright("on ") H_0^1 \( M_j^e \) . $
  The minimizers are smooth up to the extended boundary and solve $- Delta_(g_j) w_j = F$. Their traces $h_j$ on the original boundary are smooth and supported in $"supp" b subset.double Gamma$: wherever $b = 0$, that boundary is also the new zero-data boundary. Transport $w_1$ by this identification and replace it inside the original manifold by the $g_2$-harmonic extension of $h_1$, leaving it unchanged on $E$. The difference between the replacement and the transported $w_1$ is the zero extension of a function in $H_0^1 \( M \)$; thus the replacement is an admissible competitor in $H_0^1 \( M_2^e \)$. This argument does not require the narrowing cap to have a regular boundary at its edges.
  The interior energies before and after replacement are the equal quadratic energies of $h_1$ for the two measured maps. The cap metric and source pairing are common. Hence $min cal(J)_2 lt.eq min cal(J)_1$. Reversing the roles gives equality. Strict convexity of the Dirichlet form makes the replacement equal to $w_2$, proving $w_1 = w_2$ on $E$.
  Normalize the symmetric Dirichlet Green kernels by
  #[#set math.equation(numbering: n => "(2.3)")
   $ - Delta_(g_j \, x) G_j \( x \, y \) = delta_y^(g_j) \( x \) \, #h(2em) G_j \( thin dot.op thin \, y \) \|_(partial M_j^e) = 0 \, #h(2em) w_j \( x \) = integral_(M_j^e) G_j \( x \, y \) F \( y \) thin d V_(g_j) \( y \) \, $ <data:green-normalization>]
  where the point mass has unit mass relative to metric volume. The source densities are identical on $E$. Varying $F$ gives equality of the distribution kernels on $E times E$, and therefore pointwise equality off the diagonal. ◻
]

Fix a nonempty open source set $U_0 subset.double E$. Figure 1 shows the two boundaries and a possible choice of this set.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-2.85, -1.188), (2.85, 0), fill: rgb("#f0f0f0"), stroke: none)
  merge-path({bezier((-1.9, 0), (0, 0.95), (-1.425, 0), (-1.235, 0.95)); bezier((0, 0.95), (1.9, 0), (1.235, 0.95), (1.425, 0))}, close: true, fill: rgb("#e0e0ff"), stroke: none)
  line((-2.85, 0), (2.85, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-1.9, 0), (0, 0.95), (-1.425, 0), (-1.235, 0.95), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  bezier((0, 0.95), (1.9, 0), (1.235, 0.95), (1.425, 0), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  line((-1.9, -0.1235), (-1.9, 0.2185), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.9, -0.1235), (1.9, 0.2185), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0, -0.665), [$M$])
  content((-0.95, 0.361), [$E$])
  circle((0.5225, 0.418), radius: (0.323, 0.1805), fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.5225, 0.418), [$U_0$])
  content((0, 0.969), [$s=-b(z)$], anchor: "south", padding: 0.1176cm)
  content((0, 0), [$P_0 subset Gamma$], anchor: "north", padding: 0.1176cm)
  content((2.85, 0), [$s=0$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: A local schematic cross-section of the common exterior cap. The boundary moves only over a compact subset of the measured patch. The oval is a nonempty open source set $U_0$ with closure inside $E$. The proof uses the smooth graph, including its flat bump edges. ],
) <data:cap-figure>

=== 2.3 Harmonic tests from sources in the cap <harmonic-tests-from-sources-in-the-cap>

For $f in C_c^oo \( U_0 \)$, let $u_f^j$ be the zero-Dirichlet solution of $L_(g_j) u_f^j = f$ on $M_j^e$. Define its evaluation at a point by

#[#set math.equation(numbering: n => "(2.4)")
 $ I_j \( p \) \( f \) = u_f^j \( p \) . $ <data:evaluations>]

Equality of evaluations means equality for every such source $f$. Proposition 5 gives $I_1 = I_2$ on $E$. The functions $u_f^j$ are harmonic away from $overline(U_0)$; we only use their harmonic jets there.

This use of harmonic evaluations follows the Poisson and source embedding approaches of #cite(label("LLS20"), form: "prose") Sections 2 and 6.1. The restricted-source approximation and separation results appear in #cite(label("LLS20")) Appendix A, Propositions A.6–A.7. The point-distribution argument below has a close antecedent in #cite(label("Malgrange1956"), form: "prose") Chapter III, Section 3, proof of Theorem 6: unique continuation forces the inverse of an annihilating point distribution to have point support, and differential order then determines that distribution. We give the full argument for the required second jets and positive densities.

#thm([Lemma 2.3.])[
  (Separation and finite harmonic jets).  #emph[Let $\( N \, g \)$ be a compact connected smooth manifold with nonempty boundary and dimension $n gt.eq 2$. Let $U subset.double N^compose$ be nonempty and open, and let $R = L_(g \, D)^(- 1)$. Then:]
  + #emph[The functionals $I \( p \) : f mapsto R f \( p \)$, $f in C_c^oo \( U \)$, separate distinct interior points. They are nonzero in the interior and zero on the boundary. For each fixed $f$, they depend continuously on $p in N$.]
  + #emph[If $p in N^compose \\ overline(U)$, the second jets of $R f$ at $p$ fill exactly the hyperplane defined by $L_g u \( p \) = 0$. In particular they provide harmonic coordinates near $p$ and any finite spanning family of harmonic Hessians in those coordinates.]
] <data:jet-family>

#proof[
  Continuity and the zero boundary values follow from smooth Dirichlet regularity. For a nonnegative nonzero $f in C_c^oo \( U \)$, the maximum principle and its strong form give $R f > 0$ throughout $N^compose$. Thus the interior functionals are nonzero.
  We prove the jet assertion by finite-dimensional duality. Let $T$ be a linear functional on second jets at $p$ annihilating all $R f$, represented as a distribution of order at most two supported at $p$. Define $w = R T$ by transposition with the metric density. The Dirichlet inverse is self-adjoint, so
  $ chevron.l w \, f chevron.r = chevron.l T \, R f chevron.r = 0 \, #h(2em) f in C_c^oo \( U \) . $
  Thus $w = 0$ on $U$ and $L_g w = T$. Away from $p$ it is smooth and harmonic by elliptic regularity. The punctured interior is connected: a path meeting $p$ can be diverted in a small punctured coordinate ball, whose spheres are connected in dimension at least two. Unique continuation consequently gives $"supp" w subset { p }$.
  A distribution supported at one point is a finite sum
  $ w = sum_(\| alpha \| lt.eq k) c_alpha partial^alpha delta_p . $
  If $w eq.not 0$ and $k$ is its highest derivative order, then $L_g w$ has exact order $k + 2$. Indeed its highest coefficient polynomial is the product of the nonzero degree-$k$ coefficient polynomial and the nonzero elliptic quadratic principal symbol. Such a product cannot vanish. Since $T$ has order at most two, $w = c delta_p$. Hence the annihilator consists precisely of multiples of $u mapsto L_g u \( p \)$. That functional does annihilate the source solutions because $p in.not overline(U)$. Finite-dimensional duality proves that their jet range is the whole stated hyperplane.
  To prove separation, suppose $I \( p \) = I \( q \)$ for distinct interior points. Apply the same transposition argument to $T = delta_p - delta_q$. The solution $R T$ vanishes on $U$, and UCP on the connected interior with these two points removed shows that it is supported at those points. The argument still applies if a point lies in $U$, since the initial vanishing on $U$ is distributional. At each support point a nonzero point-supported distribution has an elliptic image of order at least two. It cannot have the order-zero image $delta_p - delta_q$. This contradiction proves separation.
  Finally the equation constraint allows arbitrary first derivatives, by adjusting the Hessian. Choose $n$ source solutions with independent differentials; their tuple is a harmonic coordinate chart. In this chart the first-order coefficients of $Delta_g$ vanish, so the ordinary coordinate Hessians have precisely the constraint $g^(a b) partial_(a b) u = 0$. The jet conclusion supplies a basis for that hyperplane, with zero first derivatives if desired. A chosen finite basis remains spanning, with a positive Gram bound, after shrinking the chart. ◻
]

#prodef([Remark 2.4.])[
  At any point outside $overline(U_0)$ we may use finitely many pairs $\( u_f^1 \, u_f^2 \)$ to supply the harmonic coordinates and Hessians in the local argument. Once chosen, these functions remain fixed while the spatial scales shrink. The constant pair $\( 1 \, 1 \)$ is adjoined separately; it is not a zero-boundary source solution. All these statements are scalar and use positive densities, so they retain nonorientable manifolds and arbitrary boundary components.
] <data:local-pairs>

== 3 Local continuation and product solutions <cross:section>

=== 3.1 The local metric extension theorem <the-local-metric-extension-theorem>

The common cap gives an initial isometry. To enlarge it, the global argument will use source-generated harmonic coordinates to identify neighborhoods of two interior points. In these coordinates we must continue equality of the metrics across a point where equality is already known on one side. The following theorem is the local input.

#thm([Theorem 3.1.])[
  (Local metric extension).  #emph[Let $n gt.eq 3$. Let $\( N_1 \, g_1 \)$ and $\( N_2 \, g_2 \)$ be smooth compact connected Riemannian manifolds with nonempty smooth boundary, with Dirichlet Green functions $G_1 \, G_2$. Identify two interior harmonic coordinate neighborhoods with one neighborhood $Omega subset bb(R)^n$ of $0$. Suppose an open $W subset Omega$ contains, near $0$, one side of a smooth hypersurface through $0$, and suppose 
$ g_1 = g_2 upright(" on ") W \, #h(2em) G_1 \( x \, y \) = G_2 \( x \, y \) quad \( x \, y in W \, med x eq.not y \) . $

 Suppose there are finitely many smooth pairs $u_j^a$ harmonic for $g_j$ on $Omega$, agreeing on $W$, whose first-side coordinate Hessians at $0$ span 
$ { H in "Sym"^2 \( bb(R)^n \) : g_1^(i j) \( 0 \) H_(i j) = 0 } . $

 Then the two coordinate metrics agree on a neighborhood of $0$.]
] <local:extension>

We prove this theorem in Section 6. Its proof first constructs a mixed Green kernel that is harmonic for the first metric in $x$ and for the second metric in $y$: initially it is $G_1 \( x \, y \)$ when $y in W$ and $G_2 \( x \, y \)$ when $x in W$. For each prescribed compact region at positive separation from $x = y$, a sufficiently small spatial dilation allows the continuation constructed in this section to reach that region. Section 4 then continues it to a family of small spheres centered at $y$, under a temporary bound that controls a normalized difference of the inverse metrics, together with finitely many derivatives, by the current radius. Its flux transfers first-metric harmonic functions to second-metric harmonic functions. In particular, the resulting functional sends $u_1^a$ to $u_2^a$ and reproduces the constant and coordinate functions.

The remaining task is uniform control as the spheres shrink. Section 5 estimates the density representing the flux functional. Under the same temporary metric bound, this estimate and exact reproduction of affine functions give an $L^2$ bound for each paired harmonic difference divided by the squared radius. Section 6 combines it with the spanning harmonic Hessians to improve the temporary bound strictly. This improvement allows the shrinking parameter to tend to zero with the spatial dilation fixed, forcing the two metrics to be conformal near the contact point. The common harmonic coordinates remove the remaining conformal factor. The geometric continuation in this section provides existence away from the diagonal; its estimates need not remain bounded as the separation tends to zero.

=== 3.2 Product solutions and extension from a cross <product-solutions-and-extension-from-a-cross>

We begin with a statement for general scalar elliptic operators. Let $L_i$ be a smooth scalar second-order elliptic operator in a coordinate domain, with real positive definite principal matrix $g_i^(- 1)$. Lower-order terms are allowed. A #emph[product solution] is a function $F \( x \, y \)$ satisfying

$ L_1^x F = 0 \, #h(2em) L_2^y F = 0 . $

Such a function has ordinary unique continuation, since $L_1^x + L_2^y$ is elliptic on the product. We shall construct extensions explicitly; unique continuation will identify extensions already constructed.

The starting data consist of two compatible product sets, with one variable restricted to a smaller observed set in each piece. A common basis for a solution space and its restriction to the smaller set will construct the extension. Common-basis methods for separately harmonic extension have a classical antecedent in #cite(label("Zeriahi1982"), form: "prose"); singular systems also enter quantitative Runge approximation #cite(label("RulandSalo2019")). We give the variable-coefficient argument, including its quantitative dependence.

#thm([Lemma 3.2.])[
  (Extension from a cross).  #emph[Let $D_i$ be bounded connected coordinate domains and $S_i subset.double D_i$ nonempty open sets. Suppose a product solution $F$ is given consistently on 
$ \( D_1 times S_2 \) union \( S_1 times D_2 \) \, $

 with the sum of its two $L^2$ norms at most $M$. Let $O_i subset.double D_i$ be open sets such that every $L_i$-solution $w$ on $D_i$ satisfies 
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel w parallel_(L^2 \( O_i \)) lt.eq C parallel w parallel_(L^2 \( S_i \))^(gamma_i) parallel w parallel_(L^2 \( D_i \))^(1 - gamma_i) \, #h(2em) 0 < gamma_i < 1 \, #h(2em) gamma_1 + gamma_2 > 1 . $ <cross:interpolation-input>]

 Then $F$ extends as a product solution to $O_1 times O_2$, agreeing with both given pieces on their intersections. On every compact subset of this product its $C^m$ norm is at most $C_m M$. The constants are uniform when the geometric margins, ellipticity, coefficient bounds, interpolation constants and positive exponent margin are uniform. Each specified output order uses only finitely many coefficient bounds.]
] <cross:series>

#proof[
  Let $cal(H)_1 \( D_1 \)$ be the closed subspace of $L^2 \( D_1 \)$ consisting of distributional $L_1$-solutions. Restriction $R : cal(H)_1 \( D_1 \) arrow.r L^2 \( S_1 \)$ is compact by interior elliptic estimates and injective by unique continuation. The spectral theorem for $R^(*) R$ gives an orthonormal basis $\( w_j \)$ of $cal(H)_1 \( D_1 \)$ such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ \( w_i \, w_j \)_(L^2 \( S_1 \)) = mu_j^2 delta_(i j) \, #h(2em) 0 < mu_j lt.eq 1 . $ <cross:singular-values>]
  For every $N$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ mu_j lt.eq C_N \( 1 + j \)^(- N) . $ <cross:singular-decay>]
  Indeed, multiply a solution by a cutoff equal to one near $overline(S_1)$ and compactly supported in $D_1$. Its $H^k$ norm is bounded by its $L^2 \( D_1 \)$ norm. Fourier truncation in a containing cube gives a rank $O \( A^n \)$ approximation with operator error $O \( A^(- k) \)$. The minimax characterization of singular values yields $mu_j lt.eq C_k j^(- k \/ n)$. All these constants have the stated uniformity.
  For $y in S_2$ expand $F \( dot.op \, y \)$ on $D_1$:
  $ F \( x \, y \) = sum_j w_j \( x \) b_j \( y \) \, #h(2em) parallel b_j parallel_(L^2 \( S_2 \)) lt.eq M . $
  Equation (3.2) continues these coefficients to $D_2$ by the formula
  #[#set math.equation(numbering: n => "(3.4)")
   $ b_j \( y \) = mu_j^(- 2) integral_(S_1) F \( x \, y \) overline(w_j \( x \)) thin upright(d) x \, #h(2em) parallel b_j parallel_(L^2 \( D_2 \)) lt.eq M mu_j^(- 1) . $ <cross:coefficient-extension>]
  The integral solves $L_2 b_j = 0$ and agrees with the original coefficient on $S_2$. Applying (3.1) gives
  $ parallel w_j parallel_(L^2 \( O_1 \)) lt.eq C mu_j^(gamma_1) \, #h(2em) parallel b_j parallel_(L^2 \( O_2 \)) lt.eq C M mu_j^(gamma_2 - 1) . $
  Consequently the series converges absolutely in $L^2 \( O_1 times O_2 \)$: its summands are bounded by $C M mu_j^(gamma_1 + gamma_2 - 1)$. Choose $N$ in (3.3) so that $N \( gamma_1 + gamma_2 - 1 \) > 1$. The limit solves both equations in distributions. Interior estimates for their elliptic sum give the asserted smoothness and bounds on smaller sets.
  We verify agreement with the second given piece; no assertion that an arbitrary local solution extends to $D_1$ is needed. Let $z$ be orthogonal to the closure of $R cal(H)_1 \( D_1 \)$ in $L^2 \( S_1 \)$. The function
  $ y mapsto integral_(S_1) F \( x \, y \) overline(z \( x \)) thin upright(d) x $
  solves the second equation and vanishes on $S_2$, so it vanishes on connected $D_2$. Thus each second-piece slice belongs to that closed range. Its expansion in the orthonormal basis $w_j \/ mu_j$ is complete, and its coefficients are $mu_j b_j \( y \)$ by (3.4). It follows that the series is $F$ on $S_1 times O_2$; the series converges there also by the positive exponent $gamma_2$. On $O_1 times S_2$ it is the original expansion, with positive exponent $gamma_1$. This proves both agreements. Only upper bounds for the singular values were used, so uniformity does not require continuous choices of singular bases or positive lower bounds for their singular values. ◻
]

Figure 2 summarizes the sets and the two estimates in Lemma 9.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0.7), (4.2, 1.3), fill: rgb("#e0e0ee"), stroke: none)
  rect((1.05, 0), (1.65, 3.35), fill: rgb("#e0e0ee"), stroke: none)
  rect((1.05, 0.7), (1.65, 1.3), fill: rgb("#bfbfdc"), stroke: none)
  rect((0, 0), (4.2, 3.35), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 0.7), (4.2, 0.7), (0, 1.3), (4.2, 1.3), (1.05, 0), (1.05, 3.35), (1.65, 0), (1.65, 3.35), stroke: (paint: rgb("#000073"), thickness: 0.4pt, cap: "round", join: "round"))
  rect((0.58, 0.37), (3.66, 2.85), stroke: (thickness: 0.8pt, cap: "round", join: "round", dash: "densely-dashed"))
  content((2.65, 2.3), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$O_1 times O_2$]]])])
  content((2.95, 1), [#text(fill: rgb("#000073"))[#text(size: 9pt)[$D_1 times S_2$]]])
  content((1.35, 2.1), [#text(fill: rgb("#000073"))[#text(size: 9pt)[$S_1 times D_2$]]], angle: 90deg)
  content((2.1, -0.12), [#text(size: 9pt)[$D_1$ \(first variable\)]], anchor: "north", padding: 0.1176cm)
  content((-0.15, 1.68), [#text(size: 9pt)[$D_2$ \(second variable\)]], anchor: "south", angle: 90deg, padding: 0.1176cm)
  line((4.6, 1.68), (5.32, 1.68), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: black)))
  content((5.6, 1.68), [#box(width: 6.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Compatible solutions on the cross#linebreak() $ \|w\|_(O_i) lt.eq C\|w\|_(S_i)^( gamma_i) \|w\|_(D_i)^(1- gamma_i)$#linebreak() $ 0< gamma_i<1, gamma_1+ gamma_2>1$#linebreak() The cross series constructs a solution#linebreak()on the smaller product $O_1 times O_2$.]])], anchor: "west")
})],
  caption: [Figure 2: Compatible product solutions are given on the shaded cross. The $L^2$ interpolation estimates for single-variable solutions, with $gamma_1 + gamma_2 > 1$, make the singular-function series converge on $O_1 times O_2$. The drawing is schematic: each factor is a multidimensional domain, and containment of $S_i$ in $O_i$ is not required. ],
) <cross:figure>

=== 3.3 A geometric criterion for local extension <a-geometric-criterion-for-local-extension>

We next build the interpolation estimates needed in Lemma 9. For a metric $g$, call a smooth real function $theta$ a #emph[strict weight] at a point where $upright(d) theta eq.not 0$ if

#[#set math.equation(numbering: n => "(3.5)")
 $ "Hess"_g theta \( e \, e \) + "Hess"_g theta \( v \, v \) > 0 quad upright("for all ") v perp e \, med \| v \|_g = 1 \, #h(2em) e = frac(nabla^g theta, \| nabla^g theta \|_g) . $ <cross:strict-weight>]

The strict scalar Carleman estimate gives, after shrinking the coordinate neighborhood,

#[#set math.equation(numbering: n => "(3.6)")
 $ tau^3 parallel e^(tau theta) w parallel_(L^2)^2 + tau parallel nabla \( e^(tau theta) w \) parallel_(L^2)^2 lt.eq C parallel e^(tau theta) L w parallel_(L^2)^2 \, #h(2em) tau gt.eq tau_0 \, $ <cross:carleman>]

for compactly supported $w$. This is the elliptic strict-weight estimate of the classical Carleman theory; see #cite(label("HormanderIV2009"), form: "prose") Chapter XXVIII and #cite(label("KochTataru2005"), form: "prose") Definition 8.3 and Theorem 9(a). Here the hypotheses can also be checked directly. For $L = - Delta_g$, write $v = e^(tau theta) w$ and

$ e^(tau theta) L e^(- tau theta) = A_tau + B_tau \, #h(2em) A_tau = - Delta_g - tau^2 \| upright(d) theta \|_g^2 \, quad B_tau = tau \( 2 nabla^g theta dot.op nabla + Delta_g theta \) . $

Here $A_tau$ is self-adjoint and $B_tau$ is skew-adjoint for metric volume. Integration by parts gives

$ parallel \( A_tau + B_tau \) v parallel^2 & = parallel A_tau v parallel^2 + parallel B_tau v parallel^2 + \( \[ A_tau \, B_tau \] v \, v \) \,\
\( \[ A_tau \, B_tau \] v \, v \) & = 4 tau integral "Hess"_g theta \( nabla v \, nabla overline(v) \) + 4 tau^3 integral "Hess"_g theta \( nabla theta \, nabla theta \) \| v \|^2 - tau integral \( Delta_g^2 theta \) \| v \|^2 . $

Choose a real constant $m$ strictly between the negative of the least unit tangential Hessian value and the unit normal Hessian value. After shrinking the patch, these inequalities have a positive margin. Add $4 m tau \( A_tau v \, v \)$ to the commutator form. Its gradient coefficient becomes $4 tau \( "Hess"_g theta + m g \)$, and its leading zero-order coefficient is

$ 4 tau^3 \| upright(d) theta \|_g^2 #scale(x: 120%, y: 120%)[\(] "Hess"_g theta \( e \, e \) - m #scale(x: 120%, y: 120%)[\)] > c tau^3 . $

The tangential gradient form is positive. Its mixed and possibly negative normal terms cost at most $C tau parallel nabla_e v parallel^2$, and

$ parallel nabla_e v parallel^2 lt.eq C tau^(- 2) parallel B_tau v parallel^2 + C parallel v parallel^2 . $

Finally $\| 4 m tau \( A_tau v \, v \) \| lt.eq 1 / 2 parallel A_tau v parallel^2 + C tau^2 parallel v parallel^2$. For large $tau$, the squared parts absorb the normal derivative cost and the positive zero-order term absorbs the remaining errors. This yields (3.6). Smooth first- and zero-order terms in $L$ cost only $C \( parallel nabla v parallel^2 + tau^2 parallel v parallel^2 \)$ and are absorbed in the same way. The proof gives uniform constants on fixed compact sets of strict weights and bounded coefficients.

The existence criterion is a condition on a hypersurface in the product. Hessians in the following statement use the product connection of $g_1$ and $g_2$.

#thm([Proposition 3.3.])[
  (Product extension criterion).  #emph[Let $rho$ be smooth near $z_0 = \( x_0 \, y_0 \)$, with $rho \( z_0 \) = 0$ and $upright(d)_x rho \, upright(d)_y rho eq.not 0$. Put 
$ a_i = frac(nabla_i rho, \| nabla_i rho \|^2) \, #h(2em) H = "Hess" rho . $

 Suppose that at $z_0$ 
#[#set math.equation(numbering: n => "(3.7)")
 $ H \( \( a_1 \, - a_2 \) \, \( a_1 \, - a_2 \) \) + H \( \( v_1 \, v_2 \) \, \( v_1 \, v_2 \) \) > 0 quad (v_i perp a_i \, med \| v_i \| = \| a_i \|) . $ <cross:hessian-test>]

 Every product solution given on ${ rho > 0 }$ near $z_0$ extends to a neighborhood of $z_0$, agreeing on a smaller part of that side. In fact, the construction uses only two compact product sets in ${ rho > epsilon.alt }$ for some $epsilon.alt > 0$. The neighborhoods and estimates on smaller neighborhoods are uniform under small smooth perturbations preserving the strict hypotheses, provided the data on those compact sets are bounded.]
] <cross:criterion>

#proof[
  We first split the product Hessian condition into a strict weight in each factor. Their sum will lie below a defining function for the given side, with a quadratic gap. That gap places two intersecting product sets in the given side; the weights then yield interpolation exponents greater than one half, allowing Lemma 9 to apply.
  ===== 3.3.1 Splitting the weight between the factors. <splitting-the-weight-between-the-factors.>
  We seek symmetric forms $P_i$ satisfying
  $ P_i \( a_i \, a_i \) + P_i \( v_i \, v_i \) > 0 \, #h(2em) H + K thin upright(d) rho^(⊗ 2) > P_1 xor P_2 $
  for some $K > 0$, with the vectors $v_i$ as in (3.7). After division by $\| a_i \|^2$, the first inequality is the strict-weight condition for a function with gradient $nabla_i rho$ and Hessian $P_i$. The second inequality will give the quadratic gap. To obtain these forms by convex separation, the dual tests are positive semidefinite forms $D$ whose diagonal blocks are
  $ d_i a_i^(⊗ 2) + S_i \, #h(2em) d_i gt.eq 0 \, quad S_i gt.eq 0 upright(" on ") a_i^perp \, quad "tr" S_i = d_i \| a_i \|^2 . $
  This follows by separating the open convex cone consisting of positive definite forms plus the allowed $P_1 xor P_2$; the individual dual cones are generated by $a_i^(⊗ 2) + v_i^(⊗ 2)$. Normalize $"tr" D = 1$. To obtain a suitable $K$, it suffices by compactness to prove $H : D > 0$ on tests with $D thin upright(d) rho = 0$.
  Represent such a $D$ as a covariance matrix. The normal components measured by the two partial covectors are opposite. The diagonal-block condition makes each normal component uncorrelated with its own tangential component, hence with both tangential components. Their variances coincide, giving $d_1 = d_2 = d > 0$ and
  $ D = d \( a_1 \, - a_2 \)^(⊗ 2) + D_perp \, #h(2em) "tr" \( D_perp \)_(i i) = d \| a_i \|^2 . $
  The case $d = 0$ would force $D = 0$. Among nonnegative tangential forms with these two fixed traces, every extreme point has rank one: on an image of rank $r gt.eq 2$, a nonzero symmetric perturbation preserves the two traces because $r \( r + 1 \) \/ 2 > 2$, and small perturbations of both signs preserve positivity. The rank-one tests are precisely those in (3.7), multiplied by $d$. The asserted positivity follows. Compactness of the normalized tests then supplies $K$, as required.
  Prescribe gradients $upright(d)_i rho$ and Hessians $P_i$ for smooth functions $theta_i$ vanishing at the respective points. In small coordinates centered there, Taylor expansion gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ theta_1 \( x \) + theta_2 \( y \) lt.eq tilde(rho) \( x \, y \) - c \( \| x \|^2 + \| y \|^2 \) \, #h(2em) tilde(rho) = rho + K rho^2 \/ 2 \, $ <cross:quadratic-gap>]
  with $c > 0$. Each $theta_i$ satisfies (3.5). The positive side of $tilde(rho)$ is the positive side of $rho$ in this neighborhood.
  ===== 3.3.2 Placing the cross and obtaining interpolation. <placing-the-cross-and-obtaining-interpolation.>
  Use coordinates $\( s_i \, z_i \)$ with $s_i = theta_i$. Fix a small $kappa > 0$ so that $phi.alt \( s_i \) = s_i - kappa s_i^2$ remains a strict weight. Choose successively a small lateral radius $R$, a height $l lt.double c R^2$, and $e lt.double kappa l^2$. Take
  $ D_i = { - l < s_i < l + 4 e \, med \| z_i \| < R } . $
  Use a cutoff equal to one on the inner lateral half and for $- l + 3 e < s_i < l + 2 e$, supported in the cylinder and in $- l + 2 e < s_i < l + 3 e$. Let $S_i subset.double D_i$ include neighborhoods of its top and lateral derivative supports, where respectively
  $ s_i > l + e \/ 2 quad upright("or") quad \| z_i \| > R \/ 3 \, $
  and an inner top slice near $s_i = l + 5 e \/ 4$. The two closed product sets $overline(D_1 times S_2)$ and $overline(S_1 times D_2)$ lie strictly in the given side. For a top slice, the sum of the two $s$ coordinates is positive. For a lateral slice, it is greater than $- 2 l$, which is dominated by the quadratic gap in (3.8). Making the sets slightly smaller if necessary gives a common $epsilon.alt > 0$ with $rho > epsilon.alt$ on their closures.
  For an $L_i$-solution normalized by $parallel w parallel_(L^2 \( D_i \)) = 1$, apply (3.6) to this cutoff times $w$. Interior estimates bound the bottom derivative terms using the large norm and the weight $phi.alt \( - l + 3 e \)$. The remaining derivative terms use $parallel w parallel_(L^2 \( S_i \))$ and a weight at most $phi.alt \( l + 3 e \)$. On a smaller inner cylinder beginning at $s_i = - e$, the weight is at least $phi.alt \( - e \)$. Balancing the two exponentials yields (3.1) with
  #[#set math.equation(numbering: n => "(3.9)")
   $ gamma_i = frac(phi.alt \( - e \) - phi.alt \( - l + 3 e \), phi.alt \( l + 3 e \) - phi.alt \( - l + 3 e \)) > 1 / 2 . $ <cross:exponent>]
  Indeed at $e = 0$ the quotient is $1 \/ 2 + kappa l \/ 2$. Values of the balancing parameter below $tau_0$ are covered by increasing the constant. The output cylinder may be chosen to include a connected tube from the origin to the indicated top slice.
  ===== 3.3.3 Constructing and identifying the extension. <constructing-and-identifying-the-extension.>
  Lemma 9 now gives a product solution on a neighborhood of $z_0$. It agrees with the old solution there on the positive side: from a sufficiently near positive-side point, increase $s_2$ into the top slice. Since $partial_(s_2) rho > 0$ locally, the segment stays on that side and in the larger constructed cylinder. Agreement on the slice and unique continuation along a neighborhood of the segment prove agreement at the original point. All choices have strict margins. Keeping their finitely many compact sets and shrinking their output neighborhoods once proves the stated perturbation uniformity by (3.6), Lemma 9 and interior elliptic estimates. ◻
]

=== 3.4 Gluing along a compact family of surfaces <gluing-along-a-compact-family-of-surfaces>

Proposition 10 provides a germ across one surface point. The following formulation records the geometry needed to combine these germs. In particular, agreement is proved on specified overlap components, rather than inferred from the existence of a cover.

#thm([Lemma 3.4.])[
  (Propagation through a compact cylinder).  #emph[Suppose a region in a product patch has smooth coordinates $\( z \, a \)$ near $B times \[ a_(-) \, a_(+) \]$, where $B$ is a compact base, possibly with boundary or corners. A product solution is given on a neighborhood of the top and lateral boundary and on an open set $cal(S)$. Assume that $cal(S)$ is upward closed in $a$ at fixed $z$ and contains these boundary neighborhoods. If every level $a = upright("constant")$ satisfies Proposition 10 outside $cal(S)$, with the positive side pointing toward increasing $a$, the solution extends to a neighborhood of the cylinder, agreeing on $cal(S)$. For fixed coordinates, compact sets and strict reference inequalities, the extension has uniform compact-subset bounds under small smooth perturbations, in terms of bounds on finitely many compact subsets of the initially given region.]
] <cross:propagation>

#proof[
  Starting from the top, let $a_(*)$ be the infimum of levels down to which an extension agreeing with the seed has been obtained. In the uniform version include uniform bounds in this property. At a non-seed point of $B times { a_(*) }$, Proposition 10 uses compact data strictly above that level. Take a finite cover of the level by such output neighborhoods and seed neighborhoods. Their data are contained above $a_(*) + eta$ for one $eta > 0$, so an already reached level supplies them with the needed bounds.
  Shrink the outputs in $\( z \, a \)$ coordinates to boxes $B_i times \( a_(*) - d_i \, a_(*) + d_i \)$. Every connected component of an overlap contains vertical segments to a common height greater than $a_(*)$. Both germs equal the preceding extension there. Unique continuation for $L_1^x + L_2^y$ makes them identical on that overlap component. The same argument gives agreement with $cal(S)$, because a vertical segment moving upward from a seed point stays in the seed. Boundary neighborhoods use the given solution. A finite subcover has a positive minimum output width and therefore passes the putative last level, or includes the endpoint $a_(-)$. This proves continuation on the whole cylinder. The same finite constructions retain all strict margins under small perturbations. Their Carleman, series and interior estimates prove the uniform assertion. Data bounded up to a limiting surface are never required: each local construction uses compact sets strictly above it. ◻
]

=== 3.5 Initialization at a fixed distance from the diagonal <initialization-at-a-fixed-distance-from-the-diagonal>

We apply the criterion to a mixed Green kernel. Let $g_1 \, g_2$ be smooth metrics in coordinate patches centered at $0$, obtained from interior patches of compact Dirichlet manifolds. Suppose they agree on an open set $W$ containing the lower side of a smooth hypersurface through $0$. After a linear coordinate change, assume

$ g_1 \( 0 \) = g_2 \( 0 \) = I \, #h(2em) { x_n < q \( x' \) } subset W upright(" near ") 0 \, #h(2em) q \( 0 \) = 0 \, quad upright(d) q \( 0 \) = 0 \, $

for a smooth function $q$. No regularity of the rest of $partial W$ is assumed. Let $G_j$ be the Dirichlet Green kernels, normalized with metric volume, and suppose $G_1 = G_2$ on $W times W$. For a small dilation parameter $lambda > 0$, put

#[#set math.equation(numbering: n => "(3.10)")
 $ g_(j \, lambda) \( z \) = g_j \( lambda z \) \, #h(2em) G_(j \, lambda) \( x \, y \) = lambda^(n - 2) G_j \( lambda x \, lambda y \) \, #h(2em) W_lambda = lambda^(- 1) W . $ <cross:dilation>]

On each fixed bounded patch the metrics tend smoothly to the Euclidean metric, and $W_lambda$ contains every fixed compact subset of ${ z_n < 0 }$ for sufficiently small $lambda$. Initially define, off the diagonal,

#[#set math.equation(numbering: n => "(3.11)")
 $ cal(G)_lambda \( x \, y \) = cases(delim: "{", G_(1 \, lambda) \( x \, y \) \, & y in W_lambda \,, G_(2 \, lambda) \( x \, y \) \, & x in W_lambda .) $ <cross:mixed-data>]

The pieces fit and solve the first equation in $x$ and the second in $y$.

#thm([Proposition 3.5.])[
  (Fixed-separation initialization).  #emph[In this setting, let $n gt.eq 3$ and fix $B > 0$, $d > 0$ and $eta > 0$. For all sufficiently small $lambda$, the data (3.11) have a product-solution continuation to a neighborhood of 
$ { \( x \, y \) : \| x \| \, \| y \| lt.eq B \, med \| x - y \| gt.eq d } . $

 Every fixed $C^m$ norm on a smaller neighborhood is bounded uniformly in $lambda$. The continuation agrees with $G_(1 \, lambda)$ where $y_n < - eta$ and with $G_(2 \, lambda)$ where $x_n < - eta$, on the corresponding overlaps. The smallness threshold for $lambda$ and the constants may depend on $B \, d \, eta \, m$.]
] <cross:initial>

#proof[
  We first cross the limiting plane, then deform variable-radius tubes to reach the prescribed separations. All the sets and positive separation margins used in the two steps are fixed before choosing $lambda$.
  ===== 3.5.1 Crossing the plane and obtaining a common seed. <crossing-the-plane-and-obtaining-a-common-seed.>
  We first extend slightly across the plane in one variable while keeping the other at a comparable positive separation. The first interpolation exponent can be made close to one; this compensates for the fixed positive exponent obtained by propagation in the separated second variable.
  Fix a point $x_0$ of height zero and a separation scale $s > 0$. In the second factor take
  $ D_2 = { s \/ 2 < \| y - x_0 \| < 2 s } $
  and an observed ball $S_2$ about $x_0 - s e_n$. In the first take a ball of radius $3 tau_0 s$ centered at $x_0 - tau_0 s e_n$, with $tau_0 > 0$ fixed small enough that the two large domains are separated. Its observed ball has radius $\( 1 - alpha \) tau_0 s$, with $alpha > 0$ to be chosen. These observed balls lie strictly in the lower half-space.
  There is a two-constants estimate from $S_2$ to a slightly enlarged closed annulus $4 s \/ 5 lt.eq \| y - x_0 \| lt.eq 6 s \/ 5$, with an exponent $gamma_2 > 0$ independent of $alpha$. Here is a direct way to obtain it with room for perturbations. On a Euclidean annulus the weight $\| z - z_(*) \|^(- 1)$ is strict: its radial Hessian is $2 \| z - z_(*) \|^(- 3)$ and each tangential Hessian value is $- \| z - z_(*) \|^(- 3)$. Radial cutoffs in (3.6), followed by exponential balancing, propagate smallness from an inner ball to an intermediate ball using the norm on an outer ball. A finite chain of overlapping balls with enlarged balls inside $D_2$ connects $S_2$ to the target annulus. The annulus is connected since $n gt.eq 3$. Multiplying the finitely many positive exponents gives the asserted $gamma_2$. The same weights and margins work for sufficiently small perturbations of the Euclidean metric.
  In the first factor use this radial argument centered at $x_0 - tau_0 s e_n$. Keep the outer cutoff a fixed distance beyond radius $tau_0 s$, and put the inner cutoff just inside radius $\( 1 - alpha \) tau_0 s$. Take a concentric target ball of radius $\( tau_0 + c \) s$, with $c > 0$ small; it contains the observed ball and a ball of radius $c s$ about $x_0$. As $alpha$ and $c$ decrease, the target weight approaches the inner weight. The interpolation exponent therefore tends to one. Choose these constants so that $gamma_1 + gamma_2 > 1$. Lemma 9 extends the kernel to a small ball about $x_0$ times the target annulus. On these fixed separated sets the rescaled Green kernels and their derivatives are uniformly bounded: the local Green singularity is $O \( \| x - y \|^(2 - n) \)$, and interior elliptic estimates give derivative bounds away from the pole.
  The extensions agree with both lower pieces. Agreement for $y in S_2$ comes from the first expansion. For fixed $x$ below a sufficiently small negative height, continue in $y$ through the connected target annulus to compare with $G_(2 \, lambda)$. For a second point below that height, compare with $G_(1 \, lambda)$ by continuation in the first variable from its observed ball. All comparisons remain separated.
  The local extensions must next be compared on overlaps. Retain much smaller first balls and narrower annuli for coverage, keeping the larger products as comparison domains. The unused margins allow both variables to move into the known lower region. Overlapping retained products have scales comparable to $\| x - y \|$. For two products of the same orientation, lower their near-plane variable into the known region; the path stays inside both larger first balls. For products of opposite orientations, both variables lie in retained near-plane balls. On the fixed compact range of locations and positive separation scales, choose the retained products with strict ball and annular margins, then take $eta_0 > 0$ much smaller than the smallest retained width. Lower both variables by
  $ h = max \( x_n \, y_n \, 0 \) + 2 eta_0 . $
  By making the retained balls a sufficiently small fraction of the larger balls, the path stays in both larger products: its displacement is smaller than their ball and annular margins. Its endpoint has both heights below $- eta_0$, where both germs are the original kernel. Unique continuation along a neighborhood of the path proves agreement. Choose $eta_0 lt.eq eta$ and then $lambda$ small enough for this truncated lower half-space to lie in $W_lambda$ on all sets used.
  Interchanging the two variables and covering gives, for some fixed $c_0 > 0$, a single-valued continuation in
  #[#set math.equation(numbering: n => "(3.12)")
   $ min \( x_n \, y_n \) < c_0 \| x - y \| \, $ <cross:coarse-region>]
  on every fixed compact range of bounded locations and positive separations. The estimates are uniform in $lambda$ on that range. For coverage near the plane, take $x_0 = \( x' \, 0 \)$ and $s = \| y - x_0 \|$ when the first variable has the smaller nonnegative height; then $x$ is in the retained first ball and $y$ in the retained annulus if $c_0$ is small. Points already below the plane are covered by the same construction near it or by the given cross farther below it. The preceding overlap argument makes these choices compatible.
  ===== 3.5.2 Sweeping tubes inward from the common seed. <sweeping-tubes-inward-from-the-common-seed.>
  The region (3.12) is now the seed for the second stage. At fixed center $y$ and direction $omega$, we move $x$ along the ray from $y$: large radii lie in the seed, and decreasing the radius will reach the target pairs. Choose $M > B + 3$ and introduce
  #[#set math.equation(numbering: n => "(3.13)")
   $ t = M + y_n + e_0 \| y' \|^2 \, #h(2em) r_a \( y \) = a t^(1 + sigma) \, #h(2em) x = y + r_a \( y \) omega \, quad \| omega \| = 1 \, $ <cross:tubes>]
  where $sigma \, e_0 > 0$ will be small. The base is
  $ y_n gt.eq - B - 1 \, #h(2em) t lt.eq T_0 \, #h(2em) omega in bb(S)^(n - 1) \, $
  and $a$ decreases through a fixed interval $\[ a_min \, a_max \]$. The term $e_0 \| y' \|^2$ makes this base compact. The parameter $a$ decreases while $\( y \, omega \)$ remains fixed, as required by the compact-cylinder propagation lemma. Take $a_min$ small enough that the target separations exceed $r_(a_min) \( y \)$, and $a_max$ large enough that its whole level satisfies (3.12). The bottom base boundary has $y_n < 0$. Take $T_0$ so large that $c_0 a_min T_0^sigma > 1$; its top boundary also satisfies (3.12). Here the superlinear power $1 + sigma$ ensures that $r_a \/ t = a t^sigma$ is large on this top face. Thus the initial $a$-level and both base boundary faces are supplied by the seed. This known region is upward closed in $a$: since $min \( x_n \, y_n \) = y_n + r min \( omega_n \, 0 \)$, its defining inequality is $y_n < \( c_0 - min \( omega_n \, 0 \) \) r$, whose radius coefficient is positive.
  It remains to check the strict extension criterion outside that region. At the Euclidean metrics use
  $ rho = 1 / 2 \( \| x - y \|^2 - r_a \( y \)^2 \) \, #h(2em) b = nabla r_a . $
  Away from $omega + b = 0$, multiply the vectors in (3.7) by the common positive factor $r_a$ and write their real and imaginary parts as
  #[#set math.equation(numbering: n => "(3.14)")
   $ U_1 & = omega + i v \, & \| v \| = 1 \, quad v perp omega \,\
U_2 & = frac(omega + b, \| omega + b \|^2) + i w \, & w perp \( omega + b \) \, quad \| w \| = \| omega + b \|^(- 1) . $ <cross:null-vectors>]
  The identity $omega dot.op \( U_1 - U_2 \) = b dot.op U_2$ cancels the normal part of the distance Hessian. Consequently the test is
  #[#set math.equation(numbering: n => "(3.15)")
   $ \| pi_(omega^perp) \( U_1 - U_2 \) \|^2 - \( r_a partial^2 r_a \) \( U_2 \, overline(U_2) \) . $ <cross:tube-test>]
  For bounded $b$, outside fixed small neighborhoods of $b = - omega$ and $b = - 2 omega$, the first term is at least $c \| b \|^2$. To see this, a zero forces the real part of $U_2$ to be parallel to $omega$, and equality of the projected imaginary lengths gives $\| omega + b \| = 1$. Thus $b = 0$ or $b = - 2 omega$. Near $b = 0$, the real projected difference controls $\| pi_(omega^perp) b \|$ to first order; also
  $ \| pi_(omega^perp) w \| = 1 - omega dot.op b + O \( \| b \|^2 \) \, $
  so the imaginary projected difference controls $\| omega dot.op b \|$ to first order. This proves the quadratic lower bound near zero; compactness proves it on the remaining range.
  Outside (3.12), $y_n gt.eq c_0 r_a$, so $r_a \/ t lt.eq 1 \/ c_0$ and
  $ b = \( 1 + sigma \) \( r_a \/ t \) nabla t $
  stays bounded. When $nabla t$ is close to $e_n$, the two excluded neighborhoods already lie in (3.12). Indeed,
  $ x_n / r_a lt.eq frac(\( 1 + sigma \) \| nabla t \|, \| b \|) + omega_n \, $
  which is arbitrarily small near $b = - omega$ and negative near $b = - 2 omega$ as $sigma$ and the gradient error tend to zero. On the complement $\| U_2 \|$ is bounded and differentiation of (3.13) gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ r_a \| partial^2 r_a \| lt.eq C \( sigma + T_0 e_0 \) \| b \|^2 . $ <cross:tube-error>]
  Choose the excluded-neighborhood sizes first in terms of $c_0$. Use the positive lower bound on the remaining bounded $b$-range to choose $sigma$ small, then choose the $a$-interval and $T_0$ as above, and finally $e_0 > 0$ so small that (3.16) is absorbed. Choosing the transverse compactification last keeps its contribution to the Hessian test small. These choices also make the gradient error small, since $\| nabla t - e_n \| lt.eq 2 sqrt(e_0 T_0)$ on the base. Thus (3.15) is strictly positive wherever continuation is needed. Both partial gradients are nonzero there.
  All these sets are bounded and stay at separation at least $a_min \( M - B - 1 \)^(1 + sigma) > 0$. Smooth convergence of the metrics therefore preserves the strict tests for sufficiently small $lambda$. Lemma 11 continues the kernel through the cylinder, with uniform estimates and agreement on the seed. A target pair has $a = \| x - y \| \/ t^(1 + sigma) gt.eq a_min$; if $a > a_max$ it is already in the coarse region. Hence every target pair is covered.
  We also identify the extension with both pieces of the full cross (3.11). Perform the construction with a larger bound $B' > B$ and a smaller separation $0 < d' < d$, chosen so that for every $\| y \| lt.eq B$ the domain
  $ D_y = B \( 0 \, B' \) \\ overline(B \( y \, d' \)) $
  is connected and contains a fixed lower open ball with $x_n < - eta$. Choose $B'$ large enough that every excluded closed ball lies strictly inside $B \( 0 \, B' \)$ and is disjoint from that lower ball. For fixed $y in W_lambda$ in the target range, the continuation and $G_(1 \, lambda)$ solve the same first-variable equation on $D_y$. On the lower ball the continuation equals $G_(2 \, lambda)$, which equals $G_(1 \, lambda)$ because both variables lie in $W_lambda$. Unique continuation on $D_y$ proves agreement on the required overlap. Interchanging the variables proves agreement with the other piece. Keeping slightly larger target bounds and a slightly smaller separation before restricting to the prescribed range gives the claimed neighborhood and its compact-subset estimates. ◻
]

The constants in Proposition 12 may deteriorate as $d arrow.b 0$. Its role is to initialize a construction at finitely many fixed positive scales. Lemma 11 will also provide qualitative existence at each positive radius in a shrinking family; the uniform estimate for that family is established below.

== 4 Continuation to shrinking spheres <sec:balls>

We now apply the product continuation criterion near a point where an isometry is already known on one side. The purpose of this section is to construct a family of functionals on harmonic functions, represented on small spheres. Their existence will follow from the geometry of the spheres. A uniform bound for the functionals, needed when the spheres shrink, will follow from the estimate in the next section.

=== 4.1 The local data and their normalization <balls:setup>

Throughout Sections 4–6, fix the manifolds $\( N_j \, g_j \)$, actual Dirichlet Green functions $G_j$, common harmonic coordinate neighborhood $Omega$, matching set $W$, and finite harmonic pairs $\( u_1^a \, u_2^a \)$ of Theorem 8. Thus the coordinate metrics and paired functions agree on $W$, and the Green kernels agree on $W times W$ off the diagonal. The first-side coordinate Hessians span the hyperplane annihilated by $g_1^(- 1) \( 0 \)$. An interior ball in $W$ tangent at $0$ supplies the one-sided hypersurface required by that theorem. We construct the sphere functionals for these data.

A linear change of harmonic coordinates makes $g_1 \( 0 \) = g_2 \( 0 \) = I$ and writes the separating hypersurface as a graph tangent to $x_n = 0$, with the known side below it. For a spatial dilation $lambda > 0$, write

#[#set math.equation(numbering: n => "(4.1)")
 $ g_(j \, lambda) \( x \) = g_j \( lambda x \) \, #h(2em) G_(j \, lambda) \( x \, y \) = lambda^(n - 2) G_j \( lambda x \, lambda y \) . $ <balls:dilation>]

Dilate the harmonic pairs at the same time:

$ u_(j \, lambda)^a \( x \) = u_j^a \( lambda x \) . $

They remain harmonic for $g_(j \, lambda)$ and agree on the dilated known set. The metrics and Green kernels in (4.1) have the corresponding normalization on the dilated neighborhoods. On each fixed bounded coordinate set the metrics converge smoothly to $I$ as $lambda arrow.b 0$. The dilated known set contains every fixed compact set lying strictly below $x_n = 0$, once $lambda$ is sufficiently small.

Use $x$ for the first variable and $y$ for the second. The mixed kernel $cal(G)$ is initially $G_(1 \, lambda)$ when $y$ is in the known set, and $G_(2 \, lambda)$ when $x$ is in that set. These prescriptions agree on their overlap and solve the first equation in $x$ and the second in $y$, away from the diagonal. Proposition 12 continues this kernel to any specified compact region of fixed positive separation, with smooth bounds uniform for small $lambda$. We shall use that result only after all the positive separation ranges in question have been fixed.

The geometry of a moving sphere dictates the next choices. In the strict extension test, the leading terms involving the gradient of its radius cancel; strict concavity of the logarithmic radius supplies the remaining positive term (see (4.12)). We therefore choose a conformal reference metric for which a depth function is strictly concave. Separately, a scalar normalization of the second inverse metric will give the two inverse matrices the same trace relative to the reference metric. The harmonic Hessians will determine their remaining difference.

Fix the coordinate cylinder

$ Y = { y = \( y' \, y_n \) : \| y' \| lt.eq 1 \, med - 1 lt.eq y_n lt.eq 1 } \, #h(2em) t_0 \( y \) = y_n + \| y' \|^2 . $

Take a sufficiently large fixed number $L$ and put

#[#set math.equation(numbering: n => "(4.2)")
 $ gamma = e^(- 2 L t_0) g_(1 \, lambda) \, #h(2em) Q = frac(n thin g_(2 \, lambda)^(- 1), "tr" \( gamma g_(2 \, lambda)^(- 1) \)) \, #h(2em) h = Q - gamma^(- 1) . $ <balls:normalization>]

Thus $Q$ is the principal matrix of a positive multiple of the second equation and $"tr" \( gamma h \) = 0$. The first equation can likewise be multiplied by a positive function to give principal metric $gamma$. Such multiplication does not change its solutions. The metric $gamma$ will also identify the two tangent spaces at a common coordinate point. All these coefficients have uniform smooth bounds on a fixed neighborhood of $Y$ for sufficiently small $lambda$, and $h arrow.r 0$ in every fixed smooth norm as $lambda arrow.b 0$.

Define the depth function

#[#set math.equation(numbering: n => "(4.3)")
 $ t \( y \) = integral_(1 \/ 8)^(t_0 \( y \)) e^(- 2 L s) thin d s . $ <balls:depth>]

It is negative at $0$ and has nonvanishing differential on $Y$. The conformal connection formula gives

#[#set math.equation(numbering: n => "(4.4)")
 $ "Hess"_gamma t = e^(- 2 L t_0) #scale(x: 120%, y: 120%)[\(] "Hess"_(g_(1 \, lambda)) t_0 - L \| d t_0 \|_(g_(1 \, lambda))^2 g_(1 \, lambda) #scale(x: 120%, y: 120%)[\)] lt.eq - c gamma . $ <balls:depth-hessian>]

Indeed $\| d t_0 \|$ is bounded below, whereas the first Hessian on the right is uniformly bounded. Choose $L$ first and then an upper bound for $lambda$ so that the displayed strict inequality holds with fixed $c > 0$.

=== 4.2 Radii and cutoff regions <radii-and-cutoff-regions>

For a fixed integer $p gt.eq 2$, a positive amplitude $R_(*)$, and $0 < delta lt.eq 1$, define

#[#set math.equation(numbering: n => "(4.5)")
 $ ell_delta \( t \) = delta log \( 1 + e^(t \/ delta) \) \, #h(2em) r_delta \( y \) = R_(*) ell_delta \( t \( y \) \)^p \, #h(2em) f_delta = log r_delta \, quad beta_delta = \| d f_delta \|_gamma . $ <balls:radius>]

The balls will be the $gamma$-geodesic balls with center $y$ and radius $r_delta \( y \)$, lying in the first coordinate neighborhood. As the lemma below shows, they collapse where $t lt.eq 0$, including a neighborhood of the contact point, but their radii stay bounded below where $t$ is bounded away from zero on the positive side. This distinction will keep cutoff derivatives away from uncontrolled shrinking spheres.

#thm([Lemma 4.1.])[
  (Profile bounds).  #emph[On $Y$, after the preceding choices of geometry, the following bounds hold uniformly for small $lambda$, $0 < delta lt.eq 1$, and $p gt.eq 2$: 
#[#set math.equation(numbering: n => "(4.6)")
 $ beta_delta gt.eq c p \, #h(2em) "Hess"_gamma f_delta lt.eq - c beta_delta gamma \, #h(2em) \| partial^j f_delta \| lt.eq C_j beta_delta^j quad \( j gt.eq 1 \) . $ <balls:profile-estimates>]

 The constants $c \, C_j$ do not depend on $p$. The functions $r_delta^(1 \/ p)$ have a Lipschitz bound independent of $delta$ and $lambda$ for fixed $p \, R_(*)$. The radii increase with $delta$, tend to zero on ${ t lt.eq 0 }$ as $delta arrow.b 0$, and satisfy 
#[#set math.equation(numbering: n => "(4.7)")
 $ sup_(delta \, y) r_delta beta_delta^2 arrow.r 0 quad upright("as ") R_(*) arrow.b 0 $ <balls:radius-smallness>]

 for each fixed $p$.]
] <balls:profiles>

#proof[
  Write $a_delta = \( log ell_delta \)'$. In terms of $s = t \/ delta$,
  $ a_delta \( t \) = delta^(- 1) A \( s \) \, #h(2em) A \( s \) = frac(e^s, \( 1 + e^s \) log \( 1 + e^s \)) . $
  The function $A$ is positive and decreasing. At the negative end it tends to one, and at the positive end it is comparable to $\( 1 + s \)^(- 1)$. Differentiating the formula, or its convergent expressions at the two ends, gives $\| A^(\( j \)) \( s \) \| lt.eq C_j A \( s \)^(j + 1)$. On the remaining compact interval the same inequalities follow by positivity. On the fixed $t$ interval this gives a positive lower bound for $a_delta$ and
  $ a'_delta lt.eq 0 \, #h(2em) \| partial_t^j log ell_delta \| lt.eq C_j a_delta^j \, #h(2em) a_delta lt.eq ell_delta^(- 1) . $
  Since $\| d t \|_gamma$ is bounded above and below, $beta_delta = p a_delta \| d t \|_gamma$. Equation (4.4) and
  $ "Hess"_gamma f_delta = p a_delta "Hess"_gamma t + p a'_delta thin d t ⊗ d t $
  prove the Hessian bound. The chain rule proves the other derivative bounds, with constants independent of $p gt.eq 2$ because $p a_delta^j lt.eq p^j a_delta^j$.
  The bound $0 < ell'_delta < 1$ gives the asserted Lipschitz estimate for $r_delta^(1 \/ p) = R_(*)^(1 \/ p) ell_delta compose t$. Moreover,
  $ partial_delta ell_delta = log \( 1 + e^s \) - frac(s e^s, 1 + e^s) > 0 . $
  The function on the right increases up to $s = 0$ and decreases afterward, with limit zero at both ends. The pointwise limit of $ell_delta$ is $max \( t \, 0 \)$. Finally,
  $ r_delta beta_delta^2 lt.eq C R_(*) p^2 ell_delta^(p - 2) \, $
  and $ell_delta$ is uniformly bounded on the fixed interval. This proves (4.7). ◻
]

Choose $t_b > 0$ so small that $3 t_b < t \( 1 \/ 4 \)$, where on the right $t$ denotes the increasing function of $t_0$ in (4.3), and set

#[#set math.equation(numbering: n => "(4.8)")
 $ K = { y in Y : y_n gt.eq - 1 \/ 2 \, med t \( y \) lt.eq 2 t_b } . $ <balls:K>]

Then $K subset.double Y^compose$. We fix a smooth cutoff $chi in C_c^oo \( Y^compose \)$ equal to one on a neighborhood of $K$, with

#[#set math.equation(numbering: n => "(4.9)")
 $ "supp" \( d chi \) subset { y_n < - 1 \/ 4 } union { t > t_b } . $ <balls:cutoff-region>]

For example, multiply a cutoff that changes from zero to one between $y_n = - 3 \/ 4$ and $y_n = - 1 \/ 2$ by a cutoff of $t$ that changes from one to zero between $2 t_b$ and $3 t_b$, moving the endpoints slightly to make it one on a neighborhood of $K$. The inequality $3 t_b < t \( 1 \/ 4 \)$ keeps its support away from the lateral and upper faces of $Y$. This gives fixed room around $K$ and places every cutoff derivative either in the known lower region or where

$ r_delta gt.eq R_(*) t_b^p > 0 . $

Thus the later estimates for the sphere functionals can use the original Green kernel or fixed-separation continuation on every cutoff derivative support.

=== 4.3 The strict test at a moving sphere <the-strict-test-at-a-moving-sphere>

For coordinate derivatives of the tensor $h$, use the pointwise notation

$ H_8 \( y \) = sum_(\| alpha \| lt.eq 8) \| partial_y^alpha h \( y \) \| . $

We shall temporarily impose

#[#set math.equation(numbering: n => "(4.10)")
 $ H_8 lt.eq epsilon r_delta \, #h(2em) r_(delta') beta_(delta')^2 lt.eq epsilon quad \( delta lt.eq delta' lt.eq 1 \) quad upright("on ") Y . $ <balls:bootstrap-condition>]

The first inequality measures how closely the two principal metrics agree compared with the current radius. It will be improved in Section 6.

#thm([Proposition 4.2.])[
  (Continuation to the sphere family).  #emph[Choose $p$ sufficiently large and then $epsilon > 0$ sufficiently small in terms of the fixed background bounds. Choose $R_(*) > 0$ small enough that all the balls lie in normal neighborhoods and (4.7) is at most $epsilon$. For all sufficiently small spatial dilations $lambda$, and every $0 < delta lt.eq 1$ for which (4.10) holds, the mixed kernel extends to a neighborhood of 
$ { \( x \, y \) : y in Y \, med d_gamma \( x \, y \) = r_delta \( y \) } . $

 The extension solves the two homogeneous equations and agrees with the prescribed lower cross and the fixed-separation continuation. It is smooth for each positive $delta$; no uniform norm as $delta arrow.b 0$ is asserted here.]
] <balls:continuation>

#proof[
  We check Proposition 10 at each intermediate radius $r = r_(delta')$. Put $f = log r$, $beta = \| d f \|_gamma$, and $b = nabla^gamma r$, so $\| b \| = r beta$. Use the defining function
  $ rho \( x \, y \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] d_gamma \( x \, y \)^2 - r \( y \)^2 #scale(x: 120%, y: 120%)[\)] . $
  The positive side is the outside of the sphere. Parallel translation along its radial geodesic identifies the two tangent spaces for $gamma$; write $omega$ for the unit vector from $y$ to $x$.
  In the normalization of the strict test, the normal and tangential vectors can be combined into complex vectors
  $ U_1 = omega + i v \, quad v perp omega \, quad \| v \| = 1 \, #h(2em) U_2 = q + i w \, $
  where the conditions for the second principal metric $Q^(- 1)$ give
  #[#set math.equation(numbering: n => "(4.11)")
   $ \( omega + b \) dot.op U_2 = 1 \, #h(2em) q = frac(omega + b, \| omega + b \|^2) + O \( \| h \| \) \, #h(2em) \| w \| = \| omega + b \|^(- 1) + O \( \| h \| \) . $ <balls:test-vectors>]
  Here and below lengths and dot products in these formulas use $gamma$ and its parallel identification. The first equation includes $\( omega + b \) dot.op w = 0$. Since $\| b \|$ and $\| h \|$ are small, both partial gradients of $rho$ are nonzero and $\| U_2 \|$ is bounded above and below.
  The Hessian of half the squared distance, with the product $gamma$-connection, evaluated on these endpoint vectors is
  $ \| U_1 - U_2 \|^2 + O \( r^2 \) \( \| U_1 \|^2 + \| U_2 \|^2 \) . $
  To see the error size, parametrize the radial geodesic on $\[ 0 \, 1 \]$. Its Jacobi field with prescribed endpoint values differs, in a parallel frame, from the affine interpolant by $O \( r^2 \)$ in $C^1$, by the Jacobi equation and bounded curvature. The second variation formula then gives the displayed bound. Replacing the second connection by that of $Q^(- 1)$ costs $O \( r^2 \)$ as well: the connection difference is $O \( \| h \| + \| partial h \| \) = O \( epsilon r \)$ and $\| d rho \| = O \( r \)$.
  Now $omega dot.op \( U_1 - U_2 \) = b dot.op U_2$ and $"Hess" \( r^2 \/ 2 \) = 2 thin d r ⊗ d r + r^2 "Hess" f$. Consequently the strict Hessian expression is
  #[#set math.equation(numbering: n => "(4.12)")
   $ \| pi_(omega^perp) \( U_1 - U_2 \) \|^2 - \| b dot.op U_2 \|^2 - r^2 "Hess"_gamma f \( U_2 \, overline(U)_2 \) + O \( r^2 \) . $ <balls:test-expression>]
  For a real Hessian, its value on a complex vector and its conjugate is the sum of its values on the real and imaginary parts, as required by the criterion.
  The real part of the projected difference is $- pi_(omega^perp) b + O \( \| b \|^2 + \| h \| \)$. For its imaginary part, (4.11) gives $\| pi_(omega^perp) w \| = 1 - omega dot.op b + O \( \| b \|^2 + \| h \| \)$; compare this with $\| v \| = 1$. Squaring these two bounds yields
  $ \| pi_(omega^perp) \( U_1 - U_2 \) \|^2 gt.eq \| b \|^2 - C #scale(x: 120%, y: 120%)[\(] \| b \|^3 + \| b \| \| h \| + \| h \|^2 #scale(x: 120%, y: 120%)[\)] . $
  The real and imaginary directions of $U_2$ are almost orthonormal, so
  $ \| b dot.op U_2 \|^2 lt.eq #scale(x: 120%, y: 120%)[\(] 1 + C \( \| b \| + \| h \| \) #scale(x: 120%, y: 120%)[\)] \| b \|^2 . $
  By Lemma 13, the expression (4.12) is therefore bounded below by
  $ c r^2 beta - C #scale(x: 120%, y: 120%)[\(] r^2 + r^3 beta^3 + epsilon r^2 beta + epsilon^2 r^2 #scale(x: 120%, y: 120%)[\)] . $
  Choose $p$ so that $inf beta$ absorbs the $C r^2$ term. Then choose $epsilon$ small. The inequality $r beta^2 lt.eq epsilon$ absorbs $r^3 beta^3$, and the expression is strictly positive.
  It remains to specify the starting and boundary data for this local test. Deform $delta'$ from $1$ to $delta$, using $\( y \, omega \)$ as base variables. The inequality $H_8 lt.eq epsilon r_delta$ implies its counterpart for every $delta' gt.eq delta$, because the radii increase with $delta'$. At $delta' = 1$ the required separations have a fixed positive minimum. The same is true wherever $t > t_b$, since $r_(delta') gt.eq R_(*) t_b^p$. Proposition 12 supplies uniformly bounded data on these fixed separation ranges, with open room. Where $y_n < - 1 \/ 4$, use the original $G_(1 \, lambda)$; for small $lambda$ this is part of the known lower cross. These regions cover the lateral and end boundaries of the cylinder that are not supplied by the initial parameter, and their prescriptions agree on overlaps.
  The base sphere bundle over the closed cylinder is compact. On each fixed interval $delta lt.eq delta' lt.eq 1$, the radii are positive, all surfaces lie in normal neighborhoods, and the strict tests just proved apply away from the prescribed regions. Lemma 11 therefore supplies compatible extension germs on the whole family. Its finite-cover gluing also retains agreement with the prescribed regions. This is an existence argument for each finite interval; it does not assert uniform continuation bounds when the lower endpoint tends to zero. ◻
]

=== 4.4 Functionals represented on the spheres <functionals-represented-on-the-spheres>

The mixed kernel now defines a map from first-metric harmonic functions to second-metric harmonic functions. Its representation on a small sphere will allow us to estimate this map without estimating the kernel through every continuation step. Fix $0 < delta lt.eq 1$ and write $r = r_delta$ in this subsection.

For a function $u$ harmonic for $g_(1 \, lambda)$ near $overline(B_gamma \( y \, r \( y \) \))$, define

#[#set math.equation(numbering: n => "(4.13)")
 $ T_y u = integral_(partial B_gamma \( y \, r \( y \) \)) #scale(x: 120%, y: 120%)[\(] cal(G) \( x \, y \) partial_(nu_1) u \( x \) - u \( x \) partial_(nu_1) cal(G) \( x \, y \) #scale(x: 120%, y: 120%)[\)] thin d S_1 \( x \) . $ <balls:flux>]

Here $nu_1$ is the outer unit normal and $d S_1$ the hypersurface measure for the actual first metric $g_(1 \, lambda)$, not for $gamma$. Let $S_y$ be the unit sphere of $\( T_y bb(R)^n \, gamma_y \)$, with its rotation-invariant probability measure $d sigma_y$. Parametrize the integration sphere by $x = exp_y^gamma \( r \( y \) omega \)$.

#thm([Proposition 4.3.])[
  (The transfer density).  #emph[Under the assumptions of Proposition 14, there is a smooth function $psi \( y \, omega \)$ on the unit sphere bundle over $Y^compose$ such that 
#[#set math.equation(numbering: n => "(4.14)")
 $ T_y u = integral_(S_y) psi \( y \, omega \) u #scale(x: 120%, y: 120%)[\(] exp_y^gamma \( r \( y \) omega \) #scale(x: 120%, y: 120%)[\)] thin d sigma_y \( omega \) . $ <balls:density-representation>]

 For every fixed center $y_0$, if $u$ is first-metric harmonic on a neighborhood of $overline(B_gamma \( y_0 \, r \( y_0 \) \))$, then $y mapsto T_y u$ is defined and second-metric harmonic on a sufficiently small neighborhood of $y_0$. This neighborhood may depend on $u$. In particular, for functions harmonic on the fixed coordinate neighborhood required by the sphere family, 
#[#set math.equation(numbering: n => "(4.15)")
 $ integral_(S_y) psi thin d sigma_y = 1 \, #h(2em) T_y x^i = y^i \, #h(2em) T_y u_(1 \, lambda)^a = u_(2 \, lambda)^a \( y \) . $ <balls:reproduction>]

 On the support of derivatives of $chi$, every fixed angular smooth norm of $psi$ and its first base derivatives is bounded independently of $delta$ and small $lambda$, after $p \, R_(*)$ and the fixed geometry have been chosen.]
] <balls:functional>

#proof[
  For each ball, its smooth Dirichlet solution operator determines the normal derivative of a harmonic function from its boundary trace. Move this boundary operator in the first term of (4.13) onto the smooth boundary value of $cal(G)$ by adjunction, and then pull back to $S_y$. The resulting smooth density is $psi$. Smooth dependence of the Dirichlet problem and of the sphere parametrization gives its smooth dependence on $y$ for each positive radius. This construction initially applies to smooth boundary values and hence to every harmonic function used in (4.14).
  Fix a center $y_0$ and a function $u$ harmonic on a neighborhood of its closed ball. The continued kernel is defined on an open neighborhood of the compact sphere over $y_0$. Choose a fixed slightly larger surrounding surface inside this kernel neighborhood and the domain of $u$. After restricting the center neighborhood, it surrounds every moving sphere and the whole intervening collar remains in that common domain. Green’s identity on the collar replaces the moving integral in (4.13) by the integral over this fixed surface, since both first-variable equations are homogeneous there. Applying the second-variable operator under the fixed integral proves the stated local harmonicity. This argument uses arbitrary local harmonic functions, not only the source-generated pairs.
  On the lower known region $cal(G) = G_(1 \, lambda)$, so Green’s formula gives $T_y u = u \( y \)$. Unique continuation on the connected set $Y^compose$ now proves all identities in (4.15), first for the constant and coordinate pairs and then for each given harmonic pair.
  For the uniform bounds on the cutoff region, distinguish the two sets in (4.9). On the known lower set, $T_y$ is ordinary evaluation. Its density is the Poisson density at the center of the ball, expressed in normalized coordinates. After pulling the equation back by $z mapsto exp_y^gamma \( r z \)$ and multiplying by the Laplacian scaling, the coefficients form a smooth uniformly elliptic family down to $r = 0$, whose limiting equation is the Euclidean Laplace equation. The interior evaluation kernel for the Dirichlet problem consequently has uniform angular smooth bounds and smooth center–radius dependence. This follows directly by differentiating the Dirichlet equation and using its uniform elliptic estimates; the center stays a fixed positive distance from the unit sphere. The chain rule for a base derivative costs $\| d r \| = r beta$, which is uniformly bounded by (4.10).
  On the other cutoff set, $t > t_b$. There the radii have a fixed positive lower bound and all their required derivatives are bounded uniformly in $delta$. The fixed-separation bounds of Proposition 12, followed by the smooth Dirichlet construction of $psi$, give the same conclusion. Compactness of the cutoff derivative supports completes the proof. ◻
]

Figure 3 records the transfer and the two parameter roles. The next section establishes a bound for its density that remains uniform as the spheres shrink.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.7, 2.4), [#text(size: 9pt)[One fixed spatial dilation $lambda$]])
  circle((1.7, 0.55), radius: 1.35, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "dashed"))
  circle((1.7, 0.55), radius: 0.88, stroke: (paint: rgb("#000073"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((1.7, 0.55), radius: 0.42, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "dashed"))
  circle((1.7, 0.55), radius: 0.05644, fill: black, stroke: none)
  content((1.7, 0.55), [#text(size: 9pt)[$y$]], anchor: "north-east", padding: 0.1058cm)
  line((1.7, 0.55), (2.322, 1.172), stroke: (paint: rgb("#000073"), thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#000073"))))
  content((2.011, 0.861), [#text(size: 9pt)[$r_ delta (y)$]], anchor: "south", angle: 45deg, padding: 0.1058cm)
  circle((2.58, 0.55), radius: 0.05644, fill: rgb("#000073"), stroke: none)
  line((2.66, 0.55), (4.02, 0.55), stroke: (paint: rgb("#000073"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#000073"))))
  content((3.42, 0.38), [#text(size: 8pt)[trace of#linebreak()$u_1$]], anchor: "north", padding: 0.1176cm)
  content((1.7, -1.02), [#text(size: 9pt)[$t(y)<0$, $delta arrow.b 0$#linebreak() $r_ delta (y) arrow.b 0$]], anchor: "north", padding: 0.1176cm)
  content((4.3, 0.55), [#box(width: 7.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[For a harmonic pair $(u_1,u_2)$:#linebreak() $ T_"yu"_1= integral_(S_y) psi_ delta (y, omega )#h(0.1667em) u_1#h(-0.1667em) ( exp_y^ gamma (r_ delta (y) omega ) ) #h(0.1667em) d sigma_y$#linebreak() $ T_"yu"_1 =u_2(y).$#linebreak() Exact affine moments:#linebreak() $ T_y 1=1, T_"yx"^i=y^i.$]])], anchor: "west")
})],
  caption: [Figure 3: A normal-coordinate section of $gamma$-geodesic spheres in the first variable, where $gamma$ is the conformal reference metric. The center $y$ satisfies $t \( y \) < 0$. The spatial dilation $lambda$ is fixed while $delta$ decreases. The Green functional transfers paired harmonic functions and reproduces affine harmonic coordinates exactly. The unit-sphere measure $d sigma_y$ has total mass one; the density $psi_delta$ need not be positive. ],
) <fig:shrinking-functional>

== 5 An estimate on the shrinking spheres <sec:angular>

The functional in Proposition 15 is defined at every positive radius. We now estimate its representing density uniformly as the radius shrinks. The equation for this density has second-order angular and base terms. Comparing a degree-raising operator with a degree-lowering operator will control both kinds of derivatives; a second comparison will retain the principal terms caused by the changing metric.

=== 5.1 The equation for the density <the-equation-for-the-density>

We use the reference metric $gamma$, the normalized second principal matrix $Q$, and $h = Q - gamma^(- 1)$ from (4.2). In this section the subscript $delta$ on the positive radius $r$ is suppressed. Put

$ f = log r \, #h(2em) beta = \| d f \|_gamma . $

The required profile bounds are

#[#set math.equation(numbering: n => "(5.1)")
 $ beta gt.eq beta_0 \, #h(2em) "Hess"_gamma f lt.eq - c_0 beta gamma \, #h(2em) \| nabla^j f \| lt.eq C_j beta^j quad \( 1 lt.eq j lt.eq 8 \) \, $ <angular:profile-bounds>]

where $c_0 > 0$ and $C_j$ are fixed. Lemma 13 provides these bounds with $beta_0$ arbitrarily large by choosing $p$ sufficiently large. All background metric bounds below are on a fixed relatively compact coordinate region; their constants are uniform in the spatial dilation.

Let $S_gamma Y$ be the bundle of $gamma$-unit tangent spheres over the base region $Y$. Each sphere has probability measure $d sigma_y$. Horizontal differentiation $nabla$ uses parallel transport for $gamma$, including the covariant tensor indices of an operator or section. This connection preserves the sphere measure. Unless otherwise specified, all norms and full adjoints use $d V_gamma \( y \) thin d sigma_y \( omega \)$.

On each tangent unit ball, extend a sphere function harmonically for the Euclidean metric $gamma \( y \)$. Denote the boundary radial derivative of this extension by $B$, and its ambient derivatives in an orthonormal frame by $A_i$. Thus $B = k$ on the space $cal(H)_k$ of spherical harmonics of degree $k$, and $A_i : cal(H)_k arrow.r cal(H)_(k - 1)$. The star in $A_i^(*)$ denotes the sphere adjoint. These operators are parallel, with the indicated tensor indices, and

#[#set math.equation(numbering: n => "(5.2)")
 $ \[ B \, A_i^(*) \] = A_i^(*) \, #h(2em) sum_i A_i^(*) A_i^(*) = 0 . $ <angular:elementary-identities>]

Indeed differentiation lowers homogeneous degree by one, and the second identity is the adjoint of the vanishing Laplacian of a harmonic extension. For $s in bb(R)$, use the fiber Sobolev norm

$ parallel v \( y \, dot.op \) parallel_s = parallel \( 1 + B \)^s v \( y \, dot.op \) parallel_(L^2 \( S_y \)) . $

It is equivalent to the usual Sobolev norm on the unit sphere. Tensor-valued versions use the sum over an orthonormal frame.

We write $Psi^m$ for the classical pseudodifferential operators of order $m$ on the sphere. For a positive function $a \( y \)$, the notation $a Psi^m$ means that, after division by $a$, the finitely many symbol and operator seminorms used below are bounded. A statement with $j$ base derivatives permits the indicated additional factor $beta^j$.

#thm([Lemma 5.1.])[
  (Moving trace operators).  #emph[Suppose that the normal balls and the functional $T_y$ of Proposition 15 are defined, and that 
#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(\| alpha \| lt.eq 8) \| partial_y^alpha h \| lt.eq epsilon r \, #h(2em) r beta^2 lt.eq epsilon . $ <angular:smallness>]

 If $u$ is first-metric harmonic near one such ball, set 
$ U \( y \, omega \) = u #scale(x: 120%, y: 120%)[\(] exp_y^gamma \( r \( y \) omega \) #scale(x: 120%, y: 120%)[\)] . $

 There are sphere operators $cal(C)_i$ such that $nabla_i U = cal(C)_i U$. Their sphere adjoints satisfy 
#[#set math.equation(numbering: n => "(5.4)")
 $ cal(C)_i^(*) = r^(- 1) A_i^(*) + f_i B + E_i + F_i \, #h(2em) E_i in r Psi^1 \, quad F_i in Psi^0 \, #h(2em) f_i = nabla_i f . $ <angular:C-expansion>]

 The normalized remainders $r^(- 1) E_i$ and $F_i$ have uniform symbol bounds after up to six base derivatives, with the allowance $C_j beta^j$.]
  #emph[Write the normalized second equation, in the reference connection, as $Q^(i j) nabla_i nabla_j + b_2^i nabla_i$. Its drift $b_2$ is uniformly controlled. If $psi \( y \, omega \)$ represents $T_y$ against $d sigma_y$, then 
#[#set math.equation(numbering: n => "(5.5)")
 $ P psi = 0 \, #h(2em) P = r [Q^(i j) \( nabla_i + cal(C)_i^(*) \) \( nabla_j + cal(C)_j^(*) \) + b_2^i \( nabla_i + cal(C)_i^(*) \)] . $ <angular:P-equation>]

 The products in this formula are covariant products. In particular, $Q$ is not differentiated by taking a base adjoint.]
] <angular:trace>

#proof[
  Normalize the principal part of the first equation to $gamma^(- 1)$ and pull it back by $z mapsto exp_y^gamma \( r z \)$ to the unit ball. After multiplication by $r^2$, its principal coefficients are $delta^(i j) + O \( r^2 \)$ and its first-order coefficients are $O \( r \)$. The resulting smooth family remains uniformly elliptic and has an invertible Dirichlet problem, including at $r = 0$. Its radial derivative operator therefore has the expansion
  #[#set math.equation(numbering: n => "(5.6)")
   $ B + r B_1 \( y \) + r^2 B_2 \( y \, r \) \, #h(2em) B_1 in Psi^0 \, quad B_2 in Psi^1 . $ <angular:radial-expansion>]
  Here is the parameter justification. The classical boundary-symbol construction is described in #cite(label("JoshiLionheart2005")) Theorem 1.1(i) and Proposition 3.1; we keep the center and radius dependence explicitly. In boundary coordinates the decaying normal root of the principal symbol constructs the Dirichlet parametrix. Successive lower-order transport equations construct its symbols smoothly in $\( y \, r \)$. The first normal derivative trace is an operator of order one, whose principal symbol depends only on the principal coefficients and the differentiating vector. Those coefficients have zero first $r$-derivative at $r = 0$, so that derivative of the trace operator has order zero. Taylor’s formula in this symbol class gives (5.6) to smoothing error. The true solution differs from the parametrix by the Dirichlet inverse of a smooth error; differentiated Dirichlet estimates control this remainder in every fixed seminorm. More explicitly, on a compact center set the rescaled Dirichlet operator is smoothly invertible between each fixed pair of Sobolev spaces, uniformly for $0 lt.eq r lt.eq r_0$. Differentiating that inverse controls every fixed number of parameter derivatives of the smoothing correction; increasing the Sobolev orders controls its smooth kernel seminorms. Thus the Taylor expansion holds in the complete classical symbol topology, including the smoothing remainder, and not merely in one Sobolev operator norm. This proves the stated expansion and its parameter bounds.
  Differentiate the exponential map in its center, transporting $omega$ parallel to the center velocity. The Jacobi field has initial derivative zero. After inverting the differential in the $z$ variable, the velocity acting on the unit-ball solution is
  $ r^(- 1) #scale(x: 120%, y: 120%)[\(] e_i + O \( r^2 \) #scale(x: 120%, y: 120%)[\)] + f_i omega . $
  The coefficient error is smooth in $\( y \, r \, omega \)$. Tangential derivatives act directly on the boundary value; the radial derivative is (5.6). At $r = 0$ the first term is $r^(- 1) A_i$. The order-one errors are $O \( r \)$, and the order-zero errors are bounded: in particular $r f_i B_1$ is bounded because $r beta lt.eq epsilon \/ beta$. Taking sphere adjoints gives (5.4). Differentiating the radius costs at most one factor $beta$ per derivative, by (5.1); the asserted parameter estimates follow.
  For fixed $u$, differentiate $T_y u = chevron.l psi \( y \, dot.op \) \, U \( y \, dot.op \) chevron.r_(S_y)$. Metric compatibility and $nabla_i U = cal(C)_i U$ put the differentiated operator on $psi$ as $nabla_i + cal(C)_i^(*)$. The local second-metric harmonicity in Proposition 15 proves that (5.5) pairs to zero with the trace of every function harmonic near the fixed closed ball. No global extension or source-family approximation is used in this step. At a fixed sphere these traces are dense among smooth boundary data: solve the smooth Dirichlet problem on slightly enlarged balls, using boundary values transported from the limiting sphere, and use smooth dependence of the solution on the radius. Thus the paired equation is the stated equation for $psi$. ◻
]

=== 5.2 The model operator and its principal perturbations <the-model-operator-and-its-principal-perturbations>

We separate a degree-raising model operator from the remaining principal and lower-order terms of the moving trace equation. We continue under the hypotheses of Lemma 16, including (5.3).

Define

#[#set math.equation(numbering: n => "(5.7)")
 $ D_i^(+) = nabla_i + f_i B \, #h(2em) D_i^(-) = - nabla_i + f_i B \, #h(2em) T = sum_i A_i^(*) D_i^(+) \, quad T^flat = sum_i A_i D_i^(-) . $ <angular:T-definition>]

The symbol $T$ here denotes a differential operator on sphere functions; the transfer functional continues to be denoted $T_y$. Expand (5.5) by (5.4). The identities (5.2) give

$ D_i^(+) \( r^(- 1) A_j^(*) \) = r^(- 1) A_j^(*) D_i^(+) \, #h(2em) sum_i A_i^(*) A_i^(*) = 0 . $

Thus, in ordinary base coordinates and an orthonormal sphere trivialization,

#[#set math.equation(numbering: n => "(5.8)")
 $ P = 2 T + U + J \, $ <angular:P-decomposition>]

where $J$ is a uniformly bounded family in $Psi^1$, with no base derivatives, and

#[#set math.equation(numbering: n => "(5.9)")
 $ U = sum_(\| alpha \| lt.eq 2) U_alpha \( y \) partial_y^alpha \, #h(2em) U_alpha in epsilon beta^(- \| alpha \|) Psi^(2 - \| alpha \|) . $ <angular:U-bounds>]

Up to five derivatives of these coefficients have the additional allowance $C_j beta^j$. The second-base-derivative term is precisely

#[#set math.equation(numbering: n => "(5.10)")
 $ r Q^(i j) partial_(y_i) partial_(y_j) \; $ <angular:real-principal-part>]

its coefficients are real scalars independent of the sphere variable.

We detail these bounds. The pure angular second derivative contracted with $gamma^(- 1)$ vanishes. The remaining contraction is $\( h^(i j) \/ r \) A_i^(*) A_j^(*)$, and belongs to the zero-base-derivative term of (5.9). The mixed correction is $2 h^(i j) A_i^(*) D_j^(+)$ and has the stated small bounds. The $D^(+) D^(+)$ term has coefficient $r$; its base orders two, one and zero have coefficients $O \( r \)$, $O \( r beta \)$ and $O \( r beta^2 \)$, respectively. The condition $r beta^2 lt.eq epsilon$ gives (5.9) for all three. Terms containing $E_i$ obey the same bounds. Terms containing $F_i$ also do so, except for their cross terms with $r^(- 1) A_j^(*)$, which are bounded angular order-one terms and belong to $J$. The drift term with $A_i^(*)$ belongs to $J$ as well. Differentiating any of these expressions gives the stated coefficient bounds by (5.1) and (5.3). A horizontal connection written in this trivialization adds a bounded angular first derivative, which preserves the same estimates. The bounds for $J$ use the fixed background and remain uniform as $beta_0$ is increased.

The decomposition identifies the model operator $2 T$ and the second-order perturbation $U$. To carry the model estimate over to $P$ we shall need more than an ordinary first-derivative estimate: the error forms also contain mixed base and angular derivatives. For a sphere function $phi$, put

#[#set math.equation(numbering: n => "(5.11)")
 $ cal(N) \( phi \)^2 = integral_Y (parallel nabla phi parallel_0^2 + beta^2 parallel phi parallel_1^2 + beta^(- 1) parallel nabla phi parallel_(1 \/ 2)^2 + beta parallel phi parallel_(3 \/ 2)^2) d V_gamma . $ <angular:N-definition>]

The last two terms of $cal(N)$ place half an angular derivative on $nabla phi$ and three halves on $phi$. They will bound the remaining error forms left by the comparison with $P$.

=== 5.3 A comparison of raising and lowering operators <a-comparison-of-raising-and-lowering-operators>

The next estimate supplies these two derivative strengths for the model operator. Spherical harmonics are trace-free symmetric tensors, and comparing their raising and lowering operators is familiar from energy identities in tensor tomography; see, for example, #cite(label("PSU15")) #cite(label("GPSU16")). Here the negative Hessian of the spatial weight supplies the positive term that absorbs the bounded curvature. We give the calculation with its degree factors.

#thm([Lemma 5.2.])[
  (Weighted raising estimate).  #emph[Let $n gt.eq 3$, and suppose (5.1) holds on a fixed base region with uniformly bounded reference geometry. There are $beta_0$ and $c > 0$, depending only on that geometry and the constants in (5.1), such that every smooth, compactly base-supported function with zero fiber mean satisfies 
#[#set math.equation(numbering: n => "(5.12)")
 $ parallel T phi parallel^2 - parallel T^flat phi parallel^2 gt.eq c thin cal(N) \( phi \)^2 . $ <angular:raising-estimate>]

]
] <angular:raising>

#proof[
  Both operators change angular degree by exactly one, so it suffices to prove the estimate at one input degree $k gt.eq 1$. Identify that component with a harmonic homogeneous polynomial $v \( z \)$ of degree $k$. Use the Fischer inner product, in which the monomials $z^alpha$ are orthogonal with squared norm $alpha !$. Polynomial differentiation $a_i = partial_(z_i)$ is adjoint to multiplication $M_i = z_i$. On harmonic polynomials of degree $k$ the Fischer squared norm is the normalized squared sphere norm multiplied by
  $ N_k = n \( n + 2 \) dots.h.c \( n + 2 k - 2 \) \, #h(2em) N_0 = 1 . $
  For completeness, integration against a standard real Gaussian identifies the Fischer norm on trace-free homogeneous polynomials with their Gaussian $L^2$ norm; integrating radially then gives the factor $N_k$. These classical identities are also recorded in #cite(label("Render08")) Equation (2.1) and Theorem 2.1.
  Set $d = k + n \/ 2 - 1$ and use $D_i^plus.minus = plus.minus nabla_i + k f_i$ at this fixed degree. For harmonic polynomials $q_i$ of degree $k$, the Laplacian of $sum_i M_i q_i$ is $2 sum_i a_i q_i$. Since
  $ Delta_z \( \| z \|^2 s \) = 4 d thin s #h(2em) \( s in cal(H)_(k - 1) \) \, $
  its harmonic projection is $sum_i M_i q_i - \| z \|^2 sum_i a_i q_i \/ \( 2 d \)$. Orthogonality of this projection and its complement shows that its squared norm is
  $ sum_i parallel q_i parallel^2 + sum_(i \, j) \( a_j q_i \, a_i q_j \) - d^(- 1) parallel sum_i a_i q_i #scale(x: 180%, y: 180%)[parallel]^2 . $
  Changing from Fischer adjoints to sphere adjoints gives
  $ A_i^(*) \|_(cal(H)_k) = N_(k + 1) / N_k Pi_(k + 1) M_i \, $
  where $Pi_(k + 1)$ is harmonic projection in homogeneous degree $k + 1$. Consequently $N_k$ times the left side of (5.12) is
  #[#set math.equation(numbering: n => "(5.13)")
   $ \( 2 d + 2 \) [parallel D^(+) v parallel^2 + sum_(i \, j) \( a_j D_i^(+) v \, a_i D_j^(+) v \) - 1 / d parallel sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[parallel]^2] - 2 d parallel sum_i a_i D_i^(-) v #scale(x: 180%, y: 180%)[parallel]^2 . $ <angular:Fock-difference>]
  All norms in this calculation include integration over the base and use the polynomial inner product in the fibers. The factors are $N_(k + 1) \/ N_k = 2 d + 2$ and $N_k \/ N_(k - 1) = 2 d$.
  Write $C_(i j) = 2 k \( "Hess"_gamma f \)_(i j)$ and
  $ C \[ a v \] = integral_Y sum_(i \, j) C_(i j) chevron.l a_i v \, a_j v chevron.r thin d V_gamma . $
  Covariant integrations by parts give
  #[#set math.equation(numbering: n => "(5.14)")
   $ sum_(i \, j) \( a_j D_i^(+) v \, a_i D_j^(+) v \) & = parallel sum_i a_i D_i^(-) v #scale(x: 180%, y: 180%)[parallel]^2 - C \[ a v \] + O \( k^2 \) parallel v parallel^2 \,\
parallel sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[parallel]^2 & lt.eq k parallel D^(-) v parallel^2 - C \[ a v \] + O \( k^2 \) parallel v parallel^2 \,\
parallel D^(-) v parallel^2 & = parallel D^(+) v parallel^2 + integral_Y "tr" C thin \| v \|^2 thin d V_gamma . $ <angular:ibp-one>]
  Here and below a form denoted $O \( k^2 \) parallel v parallel^2$ has absolute value at most a fixed constant times that quantity. To verify the first two formulas, move a $D_j^(+)$ across the pairing and commute $D_j^(-) D_i^(+)$ to $D_i^(+) D_j^(-) - C_(i j)$. The reordered term in (5.14) is at most $k parallel D^(-) v parallel^2$, because $sum_i \| a_i w \|^2 = k \| w \|^2$ for $w in cal(H)_k$. The extra commutator is curvature: it acts as a sum of rotations of norm $O \( k \)$ at degree $k$, and the two contractions supply one more factor $k$. This proves the claimed error bounds. Expanding the two squares proves (5.14). For complex functions all the displayed forms are understood through their real parts.
  Substituting (5.14) into (5.13) rewrites that expression as
  #[#set math.equation(numbering: n => "(5.15)")
   $ & \( 2 + 2 \/ d \) [d parallel D^(+) v parallel^2 - parallel sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[parallel]^2 - d C \[ a v \]]\
 & #h(2em) + 2 parallel sum_i a_i D_i^(-) v #scale(x: 180%, y: 180%)[parallel]^2 + O \( k^3 \) parallel v parallel^2 . $ <angular:after-first-ibp>]
  We must control the remaining negative divergence square while retaining both an ordinary derivative estimate and an additional half-order angular derivative estimate. The latter requires a coefficient of size $k \/ beta$ in front of $\| D^(+) v \|^2$, including when $k$ is much larger than $beta$. Choose a small constant $theta.alt > 0$. On the fraction $1 - theta.alt$ of its negative divergence square use (5.14)–(5.14). On the remaining fraction use the pointwise convex combination
  #[#set math.equation(numbering: n => "(5.16)")
   $ \| sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[\|]^2 & lt.eq \( 1 - zeta \) \( k + n - 1 \) \| D^(+) v \|^2\
 & quad + zeta (2 \| sum_i a_i D_i^(-) v #scale(x: 180%, y: 180%)[\|]^2 + 8 k^3 beta^2 \| v \|^2) \, #h(2em) zeta = c_1 \/ beta . $ <angular:convex-bound>]
  The fraction $1 - theta.alt$ in the integrated estimates is constant; the $y$-dependent $zeta$ is used only in this pointwise inequality. The first bound follows from the adjoint multiplication operators, since the contraction $\( q_i \) mapsto sum_i a_i q_i$ has squared norm at most $k + n - 1$ on polynomials of degree $k$. The second follows from $D_i^(+) + D_i^(-) = 2 k f_i$ and $\| sum_i f_i a_i v \|^2 lt.eq k beta^2 \| v \|^2$.
  Combining these bounds in (5.15), the coefficient retained for $\| D^(+) v \|^2$ is
  #[#set math.equation(numbering: n => "(5.17)")
   $ \( 2 + 2 \/ d \) #scale(x: 120%, y: 120%)[\[] d - k - theta.alt \( n - 1 \) + theta.alt zeta \( k + n - 1 \) #scale(x: 120%, y: 120%)[\]] . $ <angular:positive-degree-factor>]
  Since $d - k = \( n - 2 \) \/ 2$, a sufficiently small fixed $theta.alt$ makes this at least a fixed positive constant plus a positive multiple of $c_1 k \/ beta$. The coefficient of $\| sum_i a_i D_i^(-) v \|^2$ is nonnegative when $beta_0$ is sufficiently large. The Hessian contribution is exactly
  #[#set math.equation(numbering: n => "(5.18)")
   $ - \( 2 + 2 \/ d \) [\( d - 1 + theta.alt \) C \[ a v \] + \( 1 - theta.alt \) k integral_Y "tr" C thin \| v \|^2 thin d V_gamma] . $ <angular:hessian-contribution>]
  For $k gt.eq 1$ and $n gt.eq 3$, both coefficients inside this expression are positive. The Hessian hypothesis bounds it below by $c k^3 integral beta \| v \|^2$. This absorbs the curvature error $O \( k^3 \) parallel v parallel^2$ by increasing $beta_0$, and absorbs the last term of (5.16) by choosing $c_1$ sufficiently small. We have therefore retained positive multiples of
  $ parallel D^(+) v parallel^2 \, #h(2em) integral_Y k / beta \| D^(+) v \|^2 thin d V_gamma \, #h(2em) k^3 integral_Y beta \| v \|^2 thin d V_gamma . $
  The first controls both $parallel nabla v parallel^2$ and $k^2 integral beta^2 \| v \|^2$, since its cross term is $- k integral Delta_gamma f thin \| v \|^2 gt.eq 0$. For the weighted derivative use the pointwise inequality
  $ k / beta \| nabla v \|^2 lt.eq 2 k / beta \| D^(+) v \|^2 + 2 k^3 beta \| v \|^2 . $
  No differentiation of $beta^(- 1)$ is required. Dividing by $N_k$, and then summing the orthogonal degree components, proves (5.12); the weights $\( 1 + k \)^s$ are comparable to $k^s$ because the zero degree is excluded. ◻
]

=== 5.4 Keeping the principal perturbations <keeping-the-principal-perturbations>

The raising estimate controls the model operator. The actual equation (5.5) also contains second base derivatives and a small second-order angular perturbation. We retain these terms in a comparison of squared norms.

#thm([Proposition 5.3.])[
  (Coercivity for the moving trace equation).  #emph[Fix a base region with bounded reference geometry and the constants in (5.1). Suppose $P$ is the operator (5.5), with the trace operators of Lemma 16. There exist $beta_0$ sufficiently large, $epsilon_0 > 0$ and $C < oo$, depending only on these fixed bounds, such that (5.3) with $epsilon lt.eq epsilon_0$ implies 
#[#set math.equation(numbering: n => "(5.19)")
 $ cal(N) \( phi \) lt.eq C parallel P phi parallel $ <angular:coercive-estimate>]

 for every smooth, compactly base-supported function $phi$ with zero mean on each sphere. These constants are independent of the shrinking parameter. Only the eight indicated derivatives of the small tensor $h$ are required.]
] <angular:coercivity>

#proof[
  Let a dagger denote the full adjoint for $d V_gamma d sigma$. Covariant integration and the degree shift give
  #[#set math.equation(numbering: n => "(5.20)")
   $ Z := T^flat - T^dagger = sum_i f_i A_i . $ <angular:Z-definition>]
  A direct expansion yields
  #[#set math.equation(numbering: n => "(5.21)")
   $ & parallel \( 2 T + U \) phi parallel^2 - parallel \( 2 T^flat + U^dagger \) phi parallel^2\
 & #h(2em) = 4 #scale(x: 120%, y: 120%)[\(] parallel T phi parallel^2 - parallel T^flat phi parallel^2 #scale(x: 120%, y: 120%)[\)] + chevron.l cal(E) phi \, phi chevron.r \, $ <angular:norm-comparison>]
  where
  #[#set math.equation(numbering: n => "(5.22)")
   $ cal(E) = 2 \[ T^dagger \, U \] + 2 \[ U^dagger \, T \] + \[ U^dagger \, U \] - 2 #scale(x: 120%, y: 120%)[\(] U Z + \( U Z \)^dagger #scale(x: 120%, y: 120%)[\)] . $ <angular:error-operator>]
  We will prove
  #[#set math.equation(numbering: n => "(5.23)")
   $ \| chevron.l cal(E) phi \, phi chevron.r \| lt.eq C epsilon cal(N) \( phi \)^2 . $ <angular:error-form-bound>]
  Here are the complete order and weight counts needed for this claim. An operator has count $\( m \, s \)$ if its coefficient at $partial_y^alpha$ is angular order $m - \| alpha \|$, of size $O \( beta^(s - \| alpha \|) \)$, with the derivative allowances already specified. Adjoints preserve the count, and products add the counts. When a base derivative hits a coefficient it consumes one differential order and adds a factor $beta$, so it preserves the weight index. A commutator of scalar angular operators loses one angular order: the products of their principal symbols cancel. Hence a scalar commutator loses one in total order while preserving the sum of the weight indices. The counts of $T \, T^dagger \, U \, Z$ are, respectively,
  $ \( 2 \, 1 \) \, quad \( 2 \, 1 \) \, quad \( 2 \, 0 \) \, quad \( 1 \, 1 \) \, $
  and every occurrence of $U$ carries the factor $epsilon$. Thus (5.22) has count at most $\( 3 \, 1 \)$ and a factor $O \( epsilon \)$; the quadratic $U$ term is smaller.
  There is a further cancellation that the total count alone does not express: no third base derivative survives. To check it explicitly, use an orthonormal sphere trivialization and write the base measure as $mu \( y \) thin d y$. The sphere probability measure is then fixed. Write
  $ U = a^(i j) partial_i partial_j + cal(B)^i partial_i + cal(C) \, #h(2em) a^(i j) = r Q^(i j) = a^(j i) in bb(R) . $
  The coefficients $cal(B)^i$ and $cal(C)$ are angular operators. Replacing a horizontal derivative by a coordinate derivative plus its angular connection term changes only base orders at most one, so these are all the second-base coefficients. If a star denotes the sphere adjoint, direct integration by parts gives
  $ U^dagger - U =  & (2 mu^(- 1) partial_j \( mu a^(i j) \) - cal(B)^i - \( cal(B)^i \)^(*)) partial_i\
 & + mu^(- 1) partial_i partial_j \( mu a^(i j) \) - mu^(- 1) partial_i #scale(x: 120%, y: 120%)[\(] mu \( cal(B)^i \)^(*) #scale(x: 120%, y: 120%)[\)] + cal(C)^(*) - cal(C) . $
  In particular it has base order at most one. In $\[ T^dagger \, U \]$ and its partner, the possible third-base-derivative coefficient is a commutator of an angular coefficient with $r Q^(i j)$, which is zero by (5.10). For $\[ U^dagger \, U \]$, first write it as $\[ U^dagger - U \, U \]$. The operator $U^dagger - U$ has no second base derivative, since the coefficient in (5.10) is real. Taking adjoints against the smooth base density only produces lower base orders. Its remaining possible third-base-derivative coefficients commute for the same reason. Finally, $U Z$ already has at most two base derivatives. It follows that $cal(E)$ is a sum of terms of precisely the following three permitted types:
  #[#set math.equation(numbering: n => "(5.24)")
   $ epsilon beta^(- 1) Psi^1 partial_y^2 \, #h(2em) epsilon Psi^2 partial_y \, #h(2em) epsilon beta Psi^3 . $ <angular:error-types>]
  This argument also covers lower orders, since $beta gt.eq 1$.
  For the first type in (5.24), integrate once in the base. The principal form is bounded by $C epsilon integral beta^(- 1) parallel partial_y phi parallel_(1 \/ 2)^2$. A derivative of its coefficient costs one factor $beta$ and leaves an $epsilon Psi^1 partial_y$ term. This includes differentiation of the weight itself: $\| d beta \| lt.eq C beta^2$ implies $\| d \( beta^(- 1) \) \| lt.eq C$. The second type has the form bound
  $ C epsilon integral_Y parallel partial_y phi parallel_(1 \/ 2) parallel phi parallel_(3 \/ 2) thin d V_gamma lt.eq C epsilon integral_Y (beta^(- 1) parallel partial_y phi parallel_(1 \/ 2)^2 + beta parallel phi parallel_(3 \/ 2)^2) d V_gamma . $
  The third type is bounded by $C epsilon integral beta parallel phi parallel_(3 \/ 2)^2$. The lower-order term from differentiating a coefficient satisfies the same bound. Replacing coordinate derivatives by horizontal derivatives adds a bounded angular first derivative, again controlled by these norms. A fixed finite partition of the base region has the same harmless lower-order errors. This proves (5.23).
  The constants in the preceding estimates are uniform for all $beta gt.eq beta_0$ once a fixed lower threshold is met. Choose $epsilon_0$ small relative to the constant in Lemma 17. Dropping the nonnegative second squared norm in (5.21) gives $cal(N) \( phi \) lt.eq C parallel \( 2 T + U \) phi parallel$. Finally,
  $ parallel J phi parallel lt.eq C parallel phi parallel_(L^2 \( Y \; H^1 \( S_y \) \)) lt.eq C beta_0^(- 1) cal(N) \( phi \) \, $
  so a sufficiently large $beta_0$ absorbs $J$ and proves (5.19).
  All these operations use angular symbol estimates pointwise in the base, and ordinary base differential operators of degree at most two. Formal adjoints, the commutator expansion and the one integration by parts use at most the five base coefficient derivatives specified in (5.9). Construction of these coefficients differentiates the moving trace operators once and the second metric to only finitely many orders below eight. Higher angular symbol seminorms depend on the fixed smooth first-metric family; differentiating in the angular variable does not differentiate the center-dependent tensor $h$. Thus the eight smallness derivatives in (5.3) suffice in every fixed dimension. No smallness assumption on all derivatives of $h$ is used. ◻
]

=== 5.5 The constant mode and the uniform density bound <the-constant-mode-and-the-uniform-density-bound>

We now apply the coercive estimate to the transfer density constructed in Section 4, restoring the notation $r = r_delta$. Its normalization is $integral_(S_y) psi thin d sigma_y = 1$, so $chi \( psi - 1 \)$ has zero fiber mean for the fixed cutoff (4.9). This is the mean-zero condition required by Proposition 18.

The decomposition (5.8) gives a uniform bound for $P 1$: its raising part annihilates $1$, only $U$’s bounded zero-base-derivative coefficient acts on $1$, and $J$ is uniformly bounded in $Psi^1$. There is no factor growing with $beta$ in this assertion.

For any fixed smooth base cutoff, the same decomposition gives

#[#set math.equation(numbering: n => "(5.25)")
 $ parallel \[ P \, chi \] w parallel lt.eq C_chi (parallel w parallel_(L^2 \( "supp" d chi \; H^1 \( S_y \) \)) + parallel r nabla w parallel_(L^2 \( "supp" d chi times S_y \))) \, $ <angular:cutoff-bound>]

where the support can be replaced by a fixed small neighborhood of the supports of all derivatives of $chi$. Indeed $\[ 2 T \, chi \] = 2 sum_i A_i^(*) \( nabla_i chi \)$, the second base derivative of $U$ contributes $2 r Q^(i j) \( partial_i chi \) partial_j$ and a bounded zeroth-base-derivative term, and its first base derivative contributes a bounded angular order-one term. The operator $J$ commutes with $chi$.

#thm([Lemma 5.4.])[
  (Uniform transfer density).  #emph[Fix the structural parameters so that Propositions 14 and 18 apply. There is a constant $C$ independent of $delta$ and of sufficiently small spatial dilations $lambda$ such that 
#[#set math.equation(numbering: n => "(5.26)")
 $ parallel chi psi parallel_(L^2 \( S_gamma Y \)) lt.eq C $ <local:density-bound>]

 whenever the coefficient condition (4.10) holds.]
] <local:density>

#proof[
  Set $phi = chi \( psi - 1 \)$, which is compactly supported in the base and has zero fiber mean. For the actual moving-sphere operator $P$, Equation (5.5) gives
  #[#set math.equation(numbering: n => "(5.27)")
   $ P phi = P #scale(x: 120%, y: 120%)[\(] chi \( psi - 1 \) #scale(x: 120%, y: 120%)[\)] = - chi P 1 + \[ P \, chi \] \( psi - 1 \) . $ <local:density-equation>]
  The cutoff estimate (5.25) involves only angular derivatives through order one and $r nabla psi$ on the supports of derivatives of $chi$. Proposition 15 bounds these there uniformly: on the lower region the density is that of ordinary evaluation, and on the other region the radii stay at a fixed positive separation. Together with the bound for $P 1$, this gives a uniformly bounded $L^2$ norm for the right side of (5.27). Proposition 18 bounds $phi$; adding the fixed function $chi$ proves (5.26). ◻
]

The uniform bound now applies to the density representing the actual Green functional at every radius allowed by (4.10). Exact affine moments will turn it into a two-power bound for the paired harmonic differences.

== 6 From harmonic differences to local metric extension <sec:bootstrap>

Lemma 19 bounds the transfer density uniformly on the shrinking spheres. Exact reproduction of affine functions now turns that bound into a two-power estimate for the difference of paired harmonic functions. The harmonic Hessians convert derivatives of these differences into metric derivatives. Finite-order interpolation will then improve the temporary metric bound and allow the radii to shrink with the spatial dilation held fixed.

=== 6.1 From the functional to harmonic jets <from-the-functional-to-harmonic-jets>

Return to the finite harmonic family in Theorem 8. Its values and first derivatives at $0$ agree between the two metrics, because the functions agree on the one-sided open set and are smooth. After dilation define

#[#set math.equation(numbering: n => "(6.1)")
 $ v_(j \, lambda)^a \( y \) = lambda^(- 2) #scale(x: 120%, y: 120%)[\(] u_j^a \( lambda y \) - u_1^a \( 0 \) - lambda thin d u_1^a \( 0 \) dot.op y #scale(x: 120%, y: 120%)[\)] . $ <local:renormalized-pairs>]

The subtracted functions are harmonic because the coordinates are harmonic. These new pairs still agree on the known side and are transferred by $T_y$. For each fixed integer $m$ they have uniform $C^m$ bounds on every required fixed bounded coordinate neighborhood. For derivative orders $j gt.eq 2$, this follows from the factor $lambda^(j - 2)$; orders zero and one follow from the second-order Taylor remainder. Moreover,

$ partial^2 v_(1 \, lambda)^a \( y \) arrow.r partial^2 u_1^a \( 0 \) $

smoothly on fixed sets. Thus the Hessian spanning condition has a uniform rank bound after sufficiently small dilation. Write $V^a = v_(2 \, lambda)^a - v_(1 \, lambda)^a$.

#thm([Lemma 6.1.])[
  (Two-power moment bound).  #emph[Under the coefficient condition (4.10), the paired differences satisfy 
#[#set math.equation(numbering: n => "(6.2)")
 $ ∥frac(chi V^a, r_delta^2)∥_(L^2 \( Y \)) lt.eq C $ <local:moment-bound>]

 with a constant independent of $delta$ and sufficiently small $lambda$.]
] <local:moment>

#proof[
  Fix a center $y$ and subtract from $v_(1 \, lambda)^a$ its affine coordinate Taylor polynomial at $y$. Exact constant and coordinate reproduction in (4.15) cancels this polynomial in $T_y v_(1 \, lambda)^a - v_(1 \, lambda)^a \( y \) = V^a \( y \)$. The remainder on $partial B_gamma \( y \, r \)$ is bounded by $C r^2$, since coordinate distance and $gamma$-distance are uniformly comparable and the functions have uniform second derivatives. Hence
  $ \| V^a \( y \) \| lt.eq C r_delta \( y \)^2 parallel psi \( y \, dot.op \) parallel_(L^2 \( S_y \)) . $
  Lemma 19 proves (6.2). The coordinate volume measure and $d V_gamma$ are uniformly comparable. No derivative in $y$ of the continued density is used here. ◻
]

We next express metric derivatives in terms of derivatives of the paired differences. Recovery of the conformal metric class from the hyperplane of harmonic Hessians is also used in #cite(label("LLS20")) Proposition 4.1 and Remark 4.2. All Hessians in this step are ordinary coordinate Hessians, not covariant Hessians. Because the coordinates are harmonic, the equations for $v_(j \, lambda)^a$ have no first-order term in these coordinates:

$ \( g_(k \, lambda)^(- 1) \)^(i j) partial_(i j) v_(k \, lambda)^a = 0 #h(2em) \( k = 1 \, 2 \) . $

Multiplication by the scalar factors in (4.2) therefore gives

#[#set math.equation(numbering: n => "(6.3)")
 $ h^(i j) partial_(i j) v_(1 \, lambda)^a = - Q^(i j) partial_(i j) V^a \, #h(2em) "tr" \( gamma h \) = 0 . $ <local:metric-system>]

Harmonicity puts each $partial^2 v_(1 \, lambda)^a \( y \)$ in the hyperplane annihilated by $gamma^(- 1) \( y \)$. The uniform rank bound established above shows that these matrices span this hyperplane for small $lambda$. The extra equation $"tr" \( gamma h \) = 0$ completes an injective system on symmetric contravariant matrices: an element annihilating all those Hessians is a multiple of $gamma^(- 1)$, and its $gamma$-trace is $n$ times that multiple. The associated finite matrix has a smooth left inverse with uniform derivatives on $Y$. For example, in fixed coordinate bases use $\( A^(*) A \)^(- 1) A^(*)$, where $A$ is this injective matrix. Its smallest singular value stays bounded below by the spanning condition and smooth convergence under dilation. Differentiating (6.3) at most eight times gives

#[#set math.equation(numbering: n => "(6.4)")
 $ H_8 \( y \) lt.eq C sum_a sum_(\| alpha \| lt.eq 10) \| partial^alpha V^a \( y \) \| . $ <local:metric-jet-bound>]

The derivatives of $Q$, $gamma$, and of the finite harmonic family are uniformly bounded. In particular, this inversion introduces no factor involving $r_delta^(- 1)$.

The metric estimate requires derivatives of the paired differences through order ten, whereas Lemma 20 controls only their weighted $L^2$ norm. The following finite-order interpolation estimate bridges these two statements using the already fixed smooth bounds.

#thm([Lemma 6.2.])[
  (Finite-order interpolation).  #emph[Let $V$ be smooth on a neighborhood of $overline(B \( y \, s \)) subset bb(R)^n$, with $0 < s lt.eq 1$ and $parallel V parallel_(C^m) lt.eq A_m$ there. For every multi-index $alpha$ of length $j < m$, 
#[#set math.equation(numbering: n => "(6.5)")
 $ \| partial^alpha V \( y \) \| lt.eq C_(m \, n) #scale(x: 120%, y: 120%)[\(] s^(- j - n \/ 2) parallel V parallel_(L^2 \( B \( y \, s \) \)) + A_m s^(m - j) #scale(x: 120%, y: 120%)[\)] . $ <local:interpolation-estimate>]

]
] <local:interpolation>

#proof[
  Expand $V \( y + s z \)$ at $z = 0$ through degree $m - 1$ on the unit ball. The remainder has absolute value at most $C_(m \, n) A_m s^m$. The $L^2$ norm of the Taylor polynomial is therefore at most $s^(- n \/ 2) parallel V parallel_(L^2 \( B \( y \, s \) \)) + C_(m \, n) A_m s^m$. On the finite-dimensional space of polynomials of degree at most $m - 1$, every coefficient is bounded by a constant times the $L^2$ norm on the unit ball. Its $z^alpha$ coefficient is $s^j partial^alpha V \( y \) \/ alpha !$, giving the claim. ◻
]

=== 6.2 A strict improvement of the metric bound <a-strict-improvement-of-the-metric-bound>

Set

#[#set math.equation(numbering: n => "(6.6)")
 $ D = 10 + n \/ 2 \, #h(2em) eta = frac(1, 2 D) \, #h(2em) p > 2 D \, #h(2em) m gt.eq ceil.l 10 + 3 D ceil.r . $ <local:exponents>]

We also take the integer $p$ large enough for Proposition 18. Thus $eta > 1 \/ p$, and $m$ is one fixed finite smoothness order. The constants may depend on these choices, which precede the final spatial dilation and all shrinkage.

#thm([Lemma 6.3.])[
  (Superlinear improvement).  #emph[After the choices in (6.6), there are $C > 0$ and $rho_0 > 0$, independent of $delta$ and sufficiently small $lambda$, such that the coefficient condition (4.10) implies 
#[#set math.equation(numbering: n => "(6.7)")
 $ H_8 \( y \) lt.eq C r_delta \( y \)^(3 \/ 2) quad upright("for ") y in K upright(" with ") r_delta \( y \) < rho_0 . $ <local:superlinear>]

]
] <local:improvement>

#proof[
  Put $r = r_delta \( y \)$ and $s = r^eta$. By Lemma 13, $r_delta^(1 \/ p)$ has a fixed Lipschitz constant. Since
  $ s / r^(1 \/ p) = r^(eta - 1 \/ p) arrow.r 0 \, $
  a sufficiently small threshold $rho_0$ ensures
  $ 1 / 2 r^(1 \/ p) lt.eq r_delta \( z \)^(1 \/ p) lt.eq 3 / 2 r^(1 \/ p) quad \( z in B \( y \, s \) \) . $
  The same fixed threshold ensures that this ball lies where $chi = 1$, because $K$ has a fixed buffer inside that set. The upper comparison and Lemma 20 imply
  $ parallel V^a parallel_(L^2 \( B \( y \, s \) \)) lt.eq C r^2 . $
  Apply Lemma 21 and the fixed uniform $C^m$ bounds of the renormalized functions. For $j lt.eq 10$ it gives
  $ \| partial^alpha V^a \( y \) \| lt.eq C_m #scale(x: 120%, y: 120%)[\(] r^(2 - eta \( j + n \/ 2 \)) + r^(eta \( m - j \)) #scale(x: 120%, y: 120%)[\)] lt.eq C_m r^(3 \/ 2) . $
  Both exponents are at least $3 \/ 2$ by (6.6). Equation (6.4) completes the proof. ◻
]

The gain in (6.7) is stronger than the temporary bound $H_8 lt.eq epsilon r_delta$. Its usefulness is that a single choice of the spatial dilation makes the improvement strict at every radius, including those above the small threshold.

=== 6.3 Local extension of the isometry <local-extension-of-the-isometry>

#proof[
  Make the linear normalization and spatial dilation of Section 4. All harmonic functions and their finite spanning family are chosen before the dilation. We now specify the remaining choices and hold each one fixed before making the next.
  First choose the fixed conformal geometry, cylinder, depth function, and cutoff, keeping uniform background smooth bounds for $0 < lambda lt.eq lambda_0$. Choose $p \, eta \, m$ as in (6.6), with $p$ large enough for the geometric and angular estimates. Choose $epsilon$ for those estimates and then $R_(*)$ so that the balls lie in normal neighborhoods and $r_delta beta_delta^2 lt.eq epsilon$ for every $delta$. These choices fix every separation range needed to start the continuation and to bound the cutoff terms. Restrict $lambda_0$ further so that Proposition 12 applies to these fixed ranges, with bounds uniform for $0 < lambda lt.eq lambda_0$.
  The constants $C \, rho_0$ of Lemma 22 are now fixed. Choose
  #[#set math.equation(numbering: n => "(6.8)")
   $ 0 < rho < rho_0 \, #h(2em) C rho^(1 \/ 2) lt.eq epsilon \/ 2 . $ <local:rho-choice>]
  At points with $r_delta < rho$, that lemma improves the coefficient bound to $H_8 lt.eq epsilon r_delta \/ 2$ whenever the temporary bound holds. At points with $r_delta gt.eq rho$, the same improvement will hold if
  #[#set math.equation(numbering: n => "(6.9)")
   $ sup_Y H_8 lt.eq epsilon rho \/ 2 . $ <local:one-dilation>]
  Since $h arrow.r 0$ smoothly under dilation, choose one $lambda lt.eq lambda_0$ satisfying (6.9) and the additional initial bounds described next. This $lambda$ is kept fixed for the rest of the proof.
  There is a uniform reason the coefficient bound holds off $K$ for every $delta$. Outside $K$, either $y_n < - 1 \/ 2$, where $h = 0$ after the fixed dilation is sufficiently small, or $t > 2 t_b$, where
  $ r_delta gt.eq R_(*) \( 2 t_b \)^p > 0 . $
  Smooth smallness of $h$ therefore gives $H_8 lt.eq epsilon r_delta \/ 2$ off $K$ for every $delta$ by reducing the same dilation once. At $delta = 1$, the radius has a positive minimum on all of $Y$, so we can also ensure the initial coefficient bound there. These conditions involve only fixed positive constants, and are compatible with (6.9).
  For this fixed metric pair on the dilated neighborhood, set
  $ cal(A) = { delta in \( 0 \, 1 \] : H_8 \( y \) lt.eq epsilon r_delta \( y \) upright(" for every ") y in K } . $
  It contains $1$. At any $delta in cal(A)$, the bound already established off $K$ gives the full hypothesis (4.10). Proposition 14 and the uniform density estimate of Lemma 19 then apply. The moment bound, metric system, and interpolation argument give Lemma 22. The small-radius improvement (6.8) and the large-radius bound (6.9) give
  $ H_8 lt.eq 1 / 2 epsilon r_delta quad upright("on ") K . $
  For every fixed positive $delta$, $r_delta$ has a positive minimum on the compact set $K$. Thus $delta mapsto max_K \( H_8 \/ r_delta \)$ is continuous on $\( 0 \, 1 \]$. The set $cal(A)$ is relatively closed, and the strict improvement makes it relatively open. Connectedness implies $cal(A) = \( 0 \, 1 \]$.
  Finally let $delta arrow.b 0$, with the spatial dilation, harmonic family, cutoff and all structural parameters fixed. On the fixed open neighborhood of $0$ where $t < 0$, the radii tend to zero. Hence $h = 0$ there. By (4.2), $g_(2 \, lambda)$ is conformal to $g_(1 \, lambda)$ on that neighborhood. Write $g_(2 \, lambda) = e^(2 omega) g_(1 \, lambda)$. The conformal change formula for the Laplace–Beltrami operator is
  $ Delta_(e^(2 omega) g) u = e^(- 2 omega) #scale(x: 120%, y: 120%)[\(] Delta_g u + \( n - 2 \) chevron.l d omega \, d u chevron.r_g #scale(x: 120%, y: 120%)[\)] . $
  Apply it to every common harmonic coordinate. Since their differentials form a basis and $n - 2 eq.not 0$, it forces $d omega = 0$. Since $g_(1 \, lambda) \( 0 \) = g_(2 \, lambda) \( 0 \) = I$, this constant is zero. This is the local harmonic-morphism rigidity mechanism of #cite(label("Fuglede1978")) Section 8, in the restricted-family form used in #cite(label("LLS20")) Proposition 4.1. The metrics therefore agree on a connected neighborhood of $0$; undoing the dilation proves the theorem. ◻
]

For clarity, the two limits in this proof have different roles: spatial dilation is used once to obtain a fixed small metric difference, and the subsequent shrinking family improves the bound for that same difference. The parameter order is

#[#set math.equation(numbering: n => "(6.10)")
 $ upright("fixed geometry and harmonic family") #h(0.27778em) arrow.r #h(0.27778em) \( p \, eta \, m \) #h(0.27778em) arrow.r #h(0.27778em) \( epsilon \, R_(*) \)\
arrow.r #h(0.27778em) rho #h(0.27778em) arrow.r #h(0.27778em) lambda upright(" fixed") #h(0.27778em) arrow.r #h(0.27778em) delta arrow.b 0 . $ <local:parameter-order>]

All estimates use finitely many derivatives selected before either limiting step. Theorem 8 is the local input that will prevent a maximal matched region from having an interior frontier.

== 7 The global isometry and the measured boundary <global:section>

We now apply Theorem 8 to the data constructed in Section 2. The source evaluations identify which points should correspond. Their separation makes this correspondence single-valued, and their behavior at the boundary prevents its escape from the interior. The local theorem then removes every interior frontier of the isometric correspondence. The use of a maximal matching set and limits of source evaluations follows the source-embedding architecture in #cite(label("LLS20")) Section 6.1; Theorem 8 supplies the smooth continuation step needed here.

Retain the extended manifolds $M_j^e$, their common cap $E$, the open source set $U_0 subset.double E$, and the functionals $I_j$ of Equation (2.4). For this section an #emph[admissible match] is a smooth local isometry

$ Phi : W arrow.r \( M_1^e \)^compose \, #h(2em) W subset \( M_2^e \)^compose \, $

where $W$ is connected, open, and contains $E$, such that

#[#set math.equation(numbering: n => "(7.1)")
 $ Phi \|_E = upright("Id") \, #h(2em) I_2 \( p \) = I_1 \( Phi \( p \) \) quad \( p in W \) . $ <global:matching>]

Thus $Phi^(*) g_1 = g_2$ on $W$. The identity on $E$ is an admissible match by Proposition 5.

#thm([Proposition 7.1.])[
  (No interior frontier).  #emph[There is an isometry 
$ Phi : \( M_2^e \)^compose arrow.r \( M_1^e \)^compose $

 onto the first interior satisfying Equation (7.1).]
] <global:frontier>

#proof[
  #emph[The maximal match and its Green kernel.] Two admissible matches agree wherever their domains overlap, since $I_1$ separates interior points by Lemma 6. Their union therefore defines a single smooth local isometry on the union $W$ of all admissible domains. This union is connected because every domain contains the connected set $E$. The union map is injective: equal images give equal $I_2$ evaluations, hence equal original points. It is itself an admissible match and is maximal by construction.
  We first record the Green equality on this larger region:
  #[#set math.equation(numbering: n => "(7.2)")
   $ G_2 \( p \, q \) = G_1 \( Phi \( p \) \, Phi \( q \) \) \, #h(2em) p \, q in W \, quad p eq.not q . $ <global:green-equality>]
  For fixed $p in W$, equality of its evaluations and the common source density give this equality for the other variable in $U_0$, initially in the distributional sense. Both Green functions are smooth away from their pole. After pullback by the local isometry, their difference is harmonic on $W \\ { p }$. This set is connected, and equality holds on a nonempty open part of it. Unique continuation proves Equation (7.2).
  #emph[A frontier partner and common coordinates.] Suppose $W$ is not the entire second interior. Connectedness gives an interior frontier point $p$. If $p_k in W$ tends to $p$, compactness of $M_1^e$ gives a subsequential limit $q$ of $Phi \( p_k \)$. For every fixed source $f$, continuity up to the boundary gives
  $ I_2 \( p \) \( f \) = I_1 \( q \) \( f \) . $
  The point $q$ is interior: all boundary evaluations are zero, whereas $I_2 \( p \)$ is nonzero. Any two such limits have the same evaluations and so coincide. It follows that every matched sequence tending to $p$ has partners tending to this unique $q$. In particular, nearby matched points have partners in any prescribed neighborhood of $q$.
  Both $p$ and $q$ are outside $overline(U_0)$. The first statement holds because $overline(U_0) subset E subset W$. If $q$ belonged to $overline(U_0)$, the common-cap identification would give $I_1 \( q \) = I_2 \( q \)$; separation on the second manifold would force $p = q in E$, a contradiction.
  Choose sources $f_1 \, dots.h \, f_n$ so that
  $ y = \( u_(f_1)^2 \, dots.h \, u_(f_n)^2 \) $
  has independent differentials at $p$, and put $x = \( u_(f_1)^1 \, dots.h \, u_(f_n)^1 \)$ near $q$. The second tuple is also a coordinate system. Indeed the isometries at the points $p_k$ give equality of the gradient Gram matrices
  $ #scale(x: 120%, y: 120%)[\(] chevron.l d u_(f_a)^2 \, d u_(f_b)^2 chevron.r_(g_2) \( p_k \) #scale(x: 120%, y: 120%)[\)]_(a \, b) = #scale(x: 120%, y: 120%)[\(] chevron.l d u_(f_a)^1 \, d u_(f_b)^1 chevron.r_(g_1) \( Phi \( p_k \) \) #scale(x: 120%, y: 120%)[\)]_(a \, b) . $
  The first limit is positive definite, and so is the second. The coordinate values at $p \, q$ coincide. Restricting the charts gives a common coordinate ball $V$ about this value, with closures away from $overline(U_0)$. The preceding convergence observation ensures that every already matched point sufficiently near $p$ has its partner in the first chart. In these coordinates its identification is $x = y$.
  Let $A subset V$ be the coordinate image of the already matched second-side points. It is open and has the center value in its relative frontier. The two coordinate metrics and every paired source function agree on $A$. By Lemma 6, choose finitely many first-side source functions whose ordinary Hessians span the hyperplane annihilated by $g_1^(- 1)$ at the center. After shrinking $V$, their spanning rank has a positive lower bound throughout $V$. Their second-side partners are harmonic there and agree with them on $A$.
  #emph[A touching ball removes the frontier.] We can now find a smooth ball touching the unknown part, without assuming any regularity of the frontier of $A$. Choose $c in A$ sufficiently close to the center that
  $ r = "dist" \( c \, V \\ A \) > 0 \, #h(2em) overline(B \( c \, r \)) subset.double V . $
  For example, if the center has distance $R$ from $partial V$, take $c$ within $R \/ 3$ of it. Then $r < R \/ 3$, and a minimizing sequence stays in a compact subset of $V$. Thus the distance is attained at some
  $ z_(*) in partial B \( c \, r \) ∩ \( V \\ A \) . $
  On $B \( c \, r \)$ the metrics, the finite harmonic pairs, and the Green kernels in both variables agree. Smoothness gives equality of the metric and harmonic-function jets at $z_(*)$, and the Hessian spanning condition holds there by our choice of $V$. All the inputs of Theorem 8 are therefore satisfied at $z_(*)$. It gives equality of the coordinate metrics on a neighborhood of $z_(*)$. We may take a small connected ball there meeting $B \( c \, r \)$. Each paired source difference is now harmonic for the common metric and vanishes on that intersection. Unique continuation makes every pair agree on the same ball. The resulting local isometry thus matches all evaluations.
  This isometry agrees with the existing one on every overlap, by separation of evaluations. Its union with $W$ is an admissible match whose domain contains $z_(*)$, contradicting maximality. Consequently $W = \( M_2^e \)^compose$.
  #emph[Surjectivity.] The image is open because $Phi$ is a local diffeomorphism. It is also closed in the first interior. Indeed, if $Phi \( p_k \)$ tends to an interior point $q$, a subsequence of $p_k$ converges in the compact second manifold to $p$. Evaluation continuity again gives $I_2 \( p \) = I_1 \( q \)$, so $p$ cannot lie on the boundary. Then $p$ is in the domain and $Phi \( p \) = q$. Connectedness of the first interior makes the image all of it. An injective surjective local diffeomorphism has a smooth inverse, proving the proposition. ◻
]

=== 7.1 Returning to the original manifold <returning-to-the-original-manifold>

The interior isometry still has two duties: it must extend smoothly through the original boundary, and it must fix every point of the measured patch, including components where no cap was attached.

#thm([Proposition 7.2.])[
  (Smooth completion and the accessible gauge).  #emph[The isometry of Proposition 23 extends to a smooth diffeomorphism $M_2^e arrow.r M_1^e$. It preserves the original copies of $M$, and its restriction satisfies 
$ g_2 = Phi^(*) g_1 \, #h(2em) Phi \|_Gamma = upright("Id") . $

]
] <global:completion>

#proof[
  An interior isometry preserves lengths of curves and hence the intrinsic distances. The metric completion of the interior of a compact smooth Riemannian manifold with boundary is the manifold itself with its length metric. To see the only boundary issue, use a collar to push a boundary-touching curve an arbitrarily small distance into the interior; its length changes arbitrarily little. Compactness and local metric comparison then identify the completion with the original compact manifold. Thus $Phi$ and its inverse extend to mutually inverse homeomorphisms of the two completions. Boundary is mapped to boundary, since the interiors already correspond bijectively.
  These extensions are smooth. In a sufficiently small uniform boundary collar, the distance $s$ to the boundary is a smooth function, and its unit gradient is the inward normal flow. The isometry preserves $s$ and, in the interior, intertwines its gradients. Fix a small positive level $s = s_0$. The map is already smooth on that interior hypersurface. Expressing points with $0 lt.eq s lt.eq s_0$ by normal flow from this level expresses $Phi$ as the composition of this smooth level map with smooth normal flows on both sides. This extends smoothly to $s = 0$. The same argument applies to the inverse.
  Since $Phi$ is the identity on $E$, continuity makes it the identity on $overline(E)$. The original interiors satisfy
  $ M_j^compose = \( M_j^e \)^compose \\ overline(E) . $
  The extended map preserves these complements, and hence their closures, the original manifolds. Its restriction is therefore a smooth diffeomorphism $Phi : M arrow.r M$ with $g_2 = Phi^(*) g_1$. It fixes the attached original patch $P_0 = { b > 0 }$ pointwise.
  To prove the full boundary assertion, take any $f in C_c^oo \( Gamma \)$ and let $v_f^j$ now denote the harmonic functions on the #emph[original] manifolds with boundary value $f$. On the second manifold both $v_f^2$ and $v_f^1 compose Phi$ are $g_2$-harmonic. Their difference has zero boundary value on $P_0$, where $Phi$ is the identity. It also has zero normal derivative there. In fact the equal energy maps give
  $ \( partial_(nu_1) v_f^1 \) thin d S_(g_1) = \( partial_(nu_2) v_f^2 \) thin d S_(g_2) quad upright("on ") P_0 . $
  The boundary densities are the same by Lemma 4, and the smooth isometry transports the outward unit normal. Boundary unique continuation, followed by interior continuation, therefore gives
  $ v_f^2 = v_f^1 compose Phi quad upright("throughout ") M . $
  Taking boundary traces yields
  $ f \( q \) = f \( Phi \( q \) \) #h(2em) \( q in partial M \, med f in C_c^oo \( Gamma \) \) . $
  For $q in Gamma$, these test functions distinguish $q$ from every other boundary point: choose a function equal to one at $q$ with support in a small neighborhood avoiding the other point. Thus $Phi \( q \) = q$ for all $q in Gamma$. ◻
]

#proof[
  Lemma 4, Proposition 5, and Lemma 6 provide the common cap, Green kernels, and finite harmonic tests. Theorem 8 applies at every interior contact in Proposition 23. Proposition 24 gives the required diffeomorphism. All integrations use densities; the argument required neither an orientation nor connectedness of the boundary or of $Gamma$. ◻
]

== 8 Scalar conductivities on a fixed Euclidean domain <scalar:section>

The geometric theorem determines a metric up to a change of coordinates. For scalar conductivities on a fixed Euclidean domain, the corresponding change of coordinates is conformal. We first show that fixing a boundary patch removes this remaining freedom, then verify the exact conversion between the two measurement maps.

#thm([Lemma 8.1.])[
  (Conformal rigidity at a boundary patch).  #emph[Let $Omega subset bb(R)^n$ be a connected open set with smooth boundary, where $n gt.eq 3$. Suppose $F : overline(Omega) arrow.r overline(Omega)$ is a smooth diffeomorphism through the boundary and 
$ F^(*) e = e^(2 b) e quad upright("in ") Omega $

 for a real $b in C^oo \( overline(Omega) \)$, where $e$ is the Euclidean metric. If $F$ fixes a nonempty relatively open subset of $partial Omega$ pointwise, then $F = upright("Id")$ and $b = 0$.]
] <scalar:boundary-rigidity>

#proof[
  The differential identities below are the classical local mechanism behind Liouville’s conformal rigidity theorem; see #cite(label("KushelmanMcGrath2024"), form: "prose") Equations (4)–(6). We include the argument with its boundary initial values, since preservation of the interior side is essential here.
  The Christoffel symbols of $e^(2 b) e$ are
  $ Gamma_(i j)^k = b_i delta_j^k + b_j delta_i^k - b_k delta_(i j) \, #h(2em) b_i = partial_i b . $
  Since $F$ is an isometry from this metric to the Euclidean metric, the connection transformation rule gives
  #[#set math.equation(numbering: n => "(8.1)")
   $ D^2 F \( v \, w \) = D F #scale(x: 120%, y: 120%)[\(] d b \( v \) w + d b \( w \) v - chevron.l v \, w chevron.r nabla b #scale(x: 120%, y: 120%)[\)] . $ <scalar:connection>]
  This identity initially holds in the interior and extends to the boundary by smoothness.
  Fix a point $q$ of the fixed boundary patch and let $nu$ be the Euclidean inward unit normal there. For every tangent vector $v$, differentiating $F = upright("Id")$ along the fixed patch gives $D F \( q \) v = v$. Conformality therefore implies $b \( q \) = 0$ and makes $D F \( q \)$ orthogonal. It follows that $D F \( q \) nu$ is either $nu$ or $- nu$. To determine the sign, choose a smooth local defining function $s$ positive in $Omega$, with $d s \( q \) nu = 1$. For small $a > 0$, both $q + a nu$ and $F \( q + a nu \)$ are interior points. Hence the right derivative at zero of $s \( F \( q + a nu \) \)$ is nonnegative. It is $d s \( q \) D F \( q \) nu = plus.minus 1$, so the positive sign holds. Consequently $D F \( q \) = I$ on the entire fixed patch.
  The tangential derivatives of $b$ vanish there because $b = 0$. Choose a smooth curve $c$ in the patch with $c \( 0 \) = q$ and a nonzero tangent $v = c' \( 0 \)$. Twice differentiating $F \( c \( a \) \) = c \( a \)$ gives
  $ D^2 F \( q \) \( v \, v \) + D F \( q \) c'' \( 0 \) = c'' \( 0 \) \, $
  so $D^2 F \( q \) \( v \, v \) = 0$. Equation (8.1), together with $D F \( q \) = I$ and $d b \( q \) v = 0$, now yields $\| v \|^2 nabla b \( q \) = 0$. Thus both $b$ and $nabla b$ vanish on the fixed patch. In particular, the argument rules out a conformal map that fixes a hypersurface but exchanges its two sides.
  The metric $e^(2 b) e = F^(*) e$ is flat. Substitution of the displayed Christoffel symbols into its Ricci tensor gives
  $ 0 = "Ric"_(i j) = - \( n - 2 \) \( b_(i j) - b_i b_j \) - #scale(x: 120%, y: 120%)[\(] Delta b + \( n - 2 \) \| nabla b \|^2 #scale(x: 120%, y: 120%)[\)] delta_(i j) . $
  Taking the Euclidean trace and substituting back, using $n - 2 eq.not 0$, gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ b_(i j) = b_i b_j - 1 / 2 \| nabla b \|^2 delta_(i j) . $ <scalar:hessian>]
  Along a straight segment of constant velocity $v$, the vector $q_b = nabla b$ therefore solves
  $ q'_b = \( q_b dot.op v \) q_b - 1 / 2 \| q_b \|^2 v . $
  Start with a short inward segment at a point of the fixed patch. Its initial value is zero, and the right side of this ordinary differential equation is locally Lipschitz in $q_b$. Uniqueness implies $q_b = 0$ along that segment. Every connected open subset of Euclidean space is polygonally connected: the set reachable from one point by polygonal paths is both open and relatively closed, because small balls lie in the domain. Apply the same uniqueness argument successively along those segments to conclude $nabla b = 0$ throughout $Omega$. Continuity at the initial boundary point gives $b = 0$.
  Equation (8.1) now gives $D^2 F = 0$ in the connected domain, so $F$ is affine there. Its derivative and value at the fixed boundary point are those of the identity. Thus $F = upright("Id")$ in $Omega$ and on its closure by continuity. ◻
]

#proof[
  For each conductivity define
  $ g_j = gamma_j^(thin 2 \/ \( n - 2 \)) e . $
  These are smooth positive metrics on the compact manifold $overline(Omega)$. In Euclidean coordinates,
  #[#set math.equation(numbering: n => "(8.3)")
   $ sqrt(det g_j) thin g_j^(a b) = gamma_j delta^(a b) \, #h(2em) integral_Omega chevron.l d u \, d v chevron.r_(g_j) thin d V_(g_j) = integral_Omega gamma_j nabla u dot.op nabla v thin d x . $ <scalar:energy-conversion>]
  Thus the $g_j$-harmonic functions are exactly the solutions of the conductivity equation. Their boundary energy output also has the correct density: writing $psi_j = log gamma_j \/ \( n - 2 \)$ gives
  $ nu_(g_j) = e^(- psi_j) nu_e \, #h(2em) d S_(g_j) = e^(\( n - 1 \) psi_j) d S_e \, #h(2em) partial_(nu_(g_j)) u thin d S_(g_j) = gamma_j partial_(nu_e) u thin d S_e . $
  The equality of scalar local maps consequently gives equality of the density-valued energy pairings for every smooth pair supported in $Gamma$, and hence of the maps on $H_(c o)^(1 \/ 2) \( Gamma \)$.
  Choose a nonempty proper relatively open patch $Gamma_0 subset Gamma$; if $Gamma$ is already proper one may take $Gamma_0 = Gamma$. Theorem 1 gives a smooth diffeomorphism $Phi : overline(Omega) arrow.r overline(Omega)$ with $Phi \|_(Gamma_0) = upright("Id")$ and $g_2 = Phi^(*) g_1$. Therefore
  $ Phi^(*) e = e^(2 b) e \, #h(2em) b = frac(log gamma_2 - log gamma_1 compose Phi, n - 2) . $
  Lemma 25 gives $Phi = upright("Id")$. The metric equality and positivity then imply $gamma_1 = gamma_2$ on $overline(Omega)$, as asserted. ◻
]

In dimension three, by contrast, two distinct uniformly positive bounded measurable scalar conductivities on a ball, both equal to one near its boundary, can have the same full weak Dirichlet-to-Neumann operator #cite(label("OpenAIRoughScalar2026")) Theorem 1.1.


#bibliography("refs.bib", style: "ieee", title: [References])
