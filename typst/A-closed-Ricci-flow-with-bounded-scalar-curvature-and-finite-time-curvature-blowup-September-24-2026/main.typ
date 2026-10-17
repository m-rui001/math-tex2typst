#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[A closed Ricci flow with bounded scalar curvature \
and finite-time curvature blowup]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

A Ricci flow on a smooth manifold is a family of Riemannian metrics $g \( t \)$ satisfying $partial_t g = - 2 "Ric"_g$. Here a closed manifold is compact and has no boundary, $"Rm"$ denotes its full curvature tensor, and $R = "tr"_g "Ric"$ denotes scalar curvature. A smooth Ricci flow on a closed manifold can fail to extend at a finite time only if its full curvature becomes unbounded [7]. The scalar-curvature extension conjecture asks whether scalar curvature alone must detect such a singularity; see [3] p. 756. A uniform bound for the Ricci tensor is sufficient for extension by Šešum’s Theorem [10], but the trace of that tensor contains substantially less information. The question concerns smooth extension on the original manifold; continuation through a singular space is a different conclusion.

Bounded scalar curvature imposes a necessary restriction on the rate of full-curvature blowup. Wang proved that, at a finite singular time $T$, the product of $T - t$, the square root of the maximum full curvature, and the square root of the maximum absolute scalar curvature has a strictly positive upper limit [13] Theorem 3. Consequently, a closed flow with bounded scalar curvature must satisfy

$ limsup_(t arrow.t T) \( T - t \)^2 max_M \| "Rm" \| \( dot.op \, t \) > 0 . $

This is a subsequential restriction; it does not assert a lower bound at every sufficiently late time. It explains why examples with curvature concentration faster than the parabolic rate are relevant to the extension question.

Symmetry has made it possible to construct and study singularities with several distinct geometric scales. Angenent and Knopf constructed rotationally symmetric neckpinches on spheres [2]. A finite-time singularity is of #emph[Type II] when $\( T - t \) max_M \| "Rm" \|$ is unbounded. Gu and Zhu constructed rotationally symmetric Type-II singularities on spheres [6]. Angenent, Isenberg, and Knopf later constructed degenerate neckpinches with prescribed rates, a Bryant-soliton tip model, and a shrinking-cylinder parabolic model [1]. The Type-II constructions establish that full curvature can concentrate faster than the parabolic scale, but do not supply the scalar bound in Theorem 1.

Stolarski constructed closed, doubly warped Ricci flows that develop conical singularities with arbitrarily fast curvature blow-up and approach a Ricci-flat cone at the parabolic scale [12]. Stolarski’s discussion identifies bounded scalar curvature as a possible feature of these examples. The construction does not supply the scalar-curvature bound proved below. We use its quantitative profile estimates and establish that bound for a choice of sufficiently large dimension and mode index. The geometric cap models considered in his formal discussion belong to the cohomogeneity-one Ricci-flat setting developed by Böhm [4,12]. Our cap estimate uses only the quantitative construction inputs stated in Proposition 2; it does not require convergence to a prescribed complete cap metric.

#thm([Theorem 1.1.])[
  #emph[There are an integer $q gt.eq 10$, a time $T > 0$, and a smooth Ricci flow $g \( t \)$, $0 lt.eq t < T$, on the closed connected manifold $M = bb(S)^2 times bb(S)^(q + 1)$, with smooth initial metric, such that 
$ sup_(M times \[ 0 \, T \)) \| R_(g \( t \)) \| < oo \, #h(2em) lim_(t arrow.t T) max_M \| "Rm"_(g \( t \)) \| = oo . $

 In particular, $T$ is the finite maximal existence time of this flow.]
] <thm:main>

Theorem 1 refutes this conjecture in its unrestricted all-dimensions formulation: the assertion that every finite-time singularity of a closed Ricci flow in dimension at least four has unbounded scalar curvature. The example is in sufficiently high dimension; no dimension-four conclusion is asserted.

The estimates also determine the full-curvature rate of the examples. Corollary 18 gives two-sided power-law bounds with an unbounded discrete set of exponents, while the dimension remains fixed. Thus the scalar bound is compatible with arbitrarily fast power-law Type-II singularities, and the upper rate is controlled as well as the lower rate.

=== The two scales and the proof <the-two-scales-and-the-proof>

The examples have two sphere factors whose radii vary along an interval. Off the two pole orbits the metric is

$ d s^2 + phi.alt \( s \, t \)^2 g_(bb(S)^2) + r \( s \, t \)^2 g_(bb(S)^q) \, $

where $s$ is arclength at the indicated time and the sphere metrics have sectional curvature one. At each endpoint the $bb(S)^q$ factor collapses smoothly, leaving a positive-radius $bb(S)^2$ orbit. The singularity develops when that remaining orbit also shrinks.

Write $delta = T - t$. The parabolic length scale is $sqrt(delta)$, where the rescaled metric closely approximates a Ricci-flat cone. The smaller cap scale is $theta = delta^sigma$, with a fixed exponent $sigma > 1 \/ 2$ supplied by the construction. These two scales have different roles: the cone approximation gives small Ricci curvature on fixed parabolic annuli, whereas smoothness at the pole must be controlled on the cap scale. A small Ricci tensor at the larger scale does not by itself control the smaller cap.

The additional estimates have two features. First, Stolarski’s strict one-sided comparison with the cone and monotonicity of a logarithmic slope, together with the ordinary scalar lower bound, control the size of the cap. We adapt the scalar-sign obstruction in his Proposition 5.3 [12] to obtain this quantitative estimate. Curvature point-picking then gives a full-curvature bound without assuming convergence to a cap model. Second, on radial cylinders moving with the dominant drift, one-dimensional parabolic estimates give a Ricci reaction bound with leading coefficient $2 q$. The corresponding diffusion coefficient leaves a positive margin in large dimension. This yields $\| "Ric" \| lt.eq C r^(- e)$ for an exponent $0 < e < 1$, where $r$ is the radius of the $bb(S)^q$ factor in the doubly warped metric. The square of this bound admits a bounded scalar-curvature supersolution. These are the new estimates beyond the imported singular-flow construction.

Section 2 states the precise construction input and translates its scales. Section 3 obtains the warping identities, the strict cone gap, and the parabolic-annulus estimates. Section 4 proves the cap and radius curvature bounds by two curvature-record arguments and Shi’s derivative estimates. Section 5 proves the dimension-explicit reaction bound; the analytic estimates take place in one space dimension, which is what keeps their constants independent of $q$. Section 6 fixes the parameters in order and completes the Ricci and scalar comparisons, then records the resulting curvature rates.

===== 1.1 Conventions. <conventions.>

All tensor norms and geometric differential operators are taken with respect to $g \( t \)$, and $partial_t g = - 2 "Ric"$. The unit sphere has sectional curvature one. A constant $C$ may change between occurrences. Unless explicitly stated otherwise, it may depend on all fixed parameters of the chosen flow, but never on $t arrow.t T$. Constants used to choose the dimension will be identified as independent of both the dimension parameter $q$ and the mode index $k$.

== 2 The construction used as input <sec:construction>

We record precisely the part of Stolarski’s construction that is needed. The role of this input is to produce a single smooth singular flow with compatible inner signs and cone profiles. The curvature estimates proved in the later sections will be consequences of these data. Throughout, set $p = 2$ and write

#[#set math.equation(numbering: n => "(2.1)")
 $ m = p + q \, #h(2em) A^2 = frac(p - 1, m - 1) \, #h(2em) B^2 = frac(q - 1, m - 1) \,\
d = frac(m - 1 - sqrt(\( m - 1 \) \( m - 9 \)), 2) \, #h(2em) nu = k - d \/ 2 \, #h(2em) sigma = k \/ d . $ <eq:parameters>]

Here $q gt.eq 10$, and $k$ is a sufficiently large even positive integer. In particular $nu > 0$. We take $A \, B > 0$ and use the time-dependent scales

#[#set math.equation(numbering: n => "(2.2)")
 $ delta = T - t \, #h(2em) tau = - log delta \, #h(2em) theta = delta^sigma \, #h(2em) gamma = r \/ sqrt(delta) . $ <eq:scales>]

The dimension of the manifold is $m + 1$. The identities $nu \/ d = sigma - 1 \/ 2$ and $sqrt(delta) thin delta^(nu \/ d) = theta$ relate the two scales.

#thm([Proposition 2.1.])[
  (Construction input).  #emph[For the parameters above, Stolarski’s construction supplies a smooth Ricci flow up to a finite time $T$ on $bb(S)^p times bb(S)^(q + 1)$ with the following properties, after translating its starting time to zero.]
  + #emph[Off the two pole orbits it has the form 
$ g = d s^2 + phi.alt^2 g_(bb(S)^p) + r^2 g_(bb(S)^q) . $

 Here $s$ is radial arclength at each time. The metric is invariant under reflection exchanging the poles. On each open hemisphere, oriented from its pole toward the equator, $r_s > 0$. At a pole, $r = 0$, $r_s = 1$, and $phi.alt_s = 0$; the usual odd and even polar expansions hold for $r$ and $phi.alt$, respectively, and $phi.alt > 0$ for every $t < T$.]
  + #emph[Write $u = log phi.alt$, $z = r_s^2$, and 
$ tilde(U) = log frac(phi.alt, \( A \/ B \) r) \, #h(2em) tilde(Z) = z - B^2 . $

 There are positive tolerances $eta_j^U \, eta_j^Z$, large fixed numbers $1 < Y_1 lt.eq Y_2$, and constants $M_0 > 0$, $0 < beta < 1 \/ 2$, such that for $j = 0 \, 1 \, 2$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ lr(|partial_gamma^j \( tilde(U) - delta^nu U_k \)|) & lt.eq eta_j^U delta^nu #scale(x: 120%, y: 120%)[\(] gamma^(- d - j) + gamma^(2 k - d) #scale(x: 120%, y: 120%)[\)] \,\
lr(|partial_gamma^j \( tilde(Z) - delta^nu Z_k \)|) & lt.eq eta_j^Z delta^nu #scale(x: 120%, y: 120%)[\(] gamma^(- d - j) + gamma^(2 k - d) #scale(x: 120%, y: 120%)[\)] . $ <eq:profile-bounds>]

 The first estimate holds from $Y_1 delta^(nu \/ d)$ to $M_0 e^(beta tau)$, and the second from $Y_2 delta^(nu \/ d)$ to that upper endpoint, within the hemisphere. The profiles are smooth on $gamma > 0$. The function $U_k$ is $gamma^(- d)$ times a polynomial of degree $k$ in $gamma^2$, with positive leading coefficients at zero and infinity: 
$ U_k \( gamma \) tilde.op c_1 gamma^(- d) quad \( gamma arrow.b 0 \) \, #h(2em) U_k \( gamma \) tilde.op c_2 gamma^(2 k - d) quad \( gamma arrow.r oo \) \, #h(2em) c_1 \, c_2 > 0 . $

 Also $Z_k \( gamma \) = O_(q \, k) \( gamma^(- d) \)$ as $gamma arrow.b 0$.]
  + #emph[For all sufficiently late times, putting $f = r u_r$, one has 
#[#set math.equation(numbering: n => "(2.4)")
 $ phi.alt \/ r gt.eq A \/ B \, #h(2em) 0 lt.eq f lt.eq 1 \, #h(2em) f_r gt.eq 0 quad \( 0 < r lt.eq Y_1 theta \) \,\
B^2 lt.eq z lt.eq 1 quad \( 0 < r lt.eq Y_2 theta \) . $ <eq:inner-inputs>]

 These inner intervals lie strictly below the equator.]
  + #emph[At the initial time $tau_0 = - log T$, the same weighted profile bounds hold up to an initial outer cutoff $G_(upright("init")) = M_0 e^(beta_(upright("init")) tau_0)$, where $0 < beta_(upright("init")) < 1 \/ 2$, and $tilde(U) gt.eq 0$ beyond that cutoff. The exponents are chosen in the ranges permitted by the construction; in particular, one may take 
$ 0 < beta < frac(nu, 2 nu + 1) lt.eq beta_(upright("init")) < 1 / 2 . $

 They are therefore distinct choices, not two arbitrary exponents. The tolerances can be chosen sufficiently small depending on $q \, k$. The inner cutoffs can then be increased in order, first $Y_1$ and then $Y_2$; the initial rescaled time can subsequently be increased. Each such increase is subject only to lower-size requirements from the construction.]
] <prop:input>

#proof[
  #emph[Source and change of notation.] The existence statement is the solution furnished by Lemma 3.12 and the proof of Theorem 1.1 in [12]. The weighted estimates are Definition 3.1. The initial family is Definition 3.5 and Lemma 3.6, with the outer conditions of Definition 3.2. The inner inequalities are the Inner Region Barriers I in Definition 3.3, as propagated by Lemmas 4.5–4.9 and explicitly invoked in the proof of Theorem 4.3 on page 25. In particular that proof gives the barrier conditions on the inner intervals; the shorter list in Definition 4.1 of its final class $cal(P)$ is not the only information being used. The eigenprofile properties are Propositions A.12, A.13, and A.21; the parameter order is listed in Appendix B.
  For completeness, the initial weighted bounds hold up to the initial expansion’s own upper endpoint, not just the smaller propagated endpoint. The lower $U$-modes in Definition 3.5 are $gamma^(- d)$ times polynomials in $gamma^2$ of degree below $k$. By Propositions A.10 and A.19, the homogeneous lower $Z$-modes are $gamma^2$ times polynomials, with growth exponents strictly below $2 k - d$. Each of these finitely many modes and its first two derivatives is therefore bounded by the corresponding weight in (2.3) on all $gamma > 0$. Taking the lower-mode coefficient bound at the initial time to be $epsilon.alt_0 delta^nu$, with $epsilon.alt_0$ sufficiently small, gives the required tolerances. This choice is compatible with the degree argument in Lemma 3.10: the projection errors in Lemmas 6.13–6.14 can subsequently be reduced by increasing the initial rescaled time. Definition 3.5 imposes the outer conditions starting at that same initial expansion endpoint. Thus the initial profile bounds and outer sign meet at $G_(upright("init"))$; no identification of $beta_(upright("init"))$ with $beta$ is required. The relation between their permitted ranges is specified in the proof of Theorem 4.3, page 26, of [12].
  In the source’s notation, $B^2 lambda_k = - nu$, $alpha_k = nu \/ d$, and $Y_1 = Upsilon_U$, $Y_2 = Upsilon_Z$. Thus $sqrt(delta) thin Y_i e^(- alpha_k tau) = Y_i theta$. Moreover
  $ f = 1 + gamma tilde(U)_gamma \, #h(2em) f_r = gamma / sqrt(delta) (tilde(U)_(gamma gamma) + tilde(U)_gamma / gamma) \, $
  which translates the source’s log-radius convexity into the last slope inequality in (2.4). The mode index $k$ here is the index in the construction, rather than the arbitrary curvature blow-up exponent in the statement of its Theorem 1.1. ◻
]

#prodef([Remark 2.2.])[
  Proposition 2 is the external existence input to this paper. We do not import a scalar-curvature upper bound, a full-curvature bound at the cap scale, or convergence to a particular complete cap metric. The estimates establishing those curvature bounds are given below.
] <rem:input-scope>

== 3 Geometric identities and profile consequences <sec:geometry>

We now extract three consequences needed in the curvature estimates: uniform bounds for the warping slopes, a strict inner separation from the cone, and small Ricci curvature on fixed parabolic annuli. We distinguish time differentiation at a fixed point of the manifold from differentiation at a fixed value of the evolving radius $r$.

=== 3.1 Warping equations <warping-equations>

Let $x$ be a radial coordinate fixed on the manifold, so that $d s = chi \( x \, t \) thin d x$. Subscripts $s$ denote arclength differentiation at the indicated time. On a regular orbit the sectional curvatures are

#[#set math.equation(numbering: n => "(3.1)")
 $ h = - phi.alt_(s s) \/ phi.alt \, #h(2em) h_q = - r_(s s) \/ r \, #h(2em) j = \( 1 - phi.alt_s^2 \) \/ phi.alt^2 \,\
ell = \( 1 - r_s^2 \) \/ r^2 \, #h(2em) mu = - phi.alt_s r_s \/ \( phi.alt r \) . $ <eq:sectional>]

They correspond, respectively, to radial–$bb(S)^p$, radial–$bb(S)^q$, $bb(S)^p$-tangent, $bb(S)^q$-tangent, and mixed planes. These formulas also follow directly by computing the connection of the warped metric. The Ricci eigenvalues in the radial and the two fiber directions are

#[#set math.equation(numbering: n => "(3.2)")
 $ lambda_0 = p h + q h_q \, #h(2em) lambda_p = h + \( p - 1 \) j + q mu \, #h(2em) lambda_q = h_q + \( q - 1 \) ell + p mu . $ <eq:ricci-eigenvalues>]

Consequently

#[#set math.equation(numbering: n => "(3.3)")
 $ partial_t \|_x r & = r_(s s) + \( q - 1 \) \( r_s^2 - 1 \) \/ r + p phi.alt_s r_s \/ phi.alt \,\
partial_t \|_x phi.alt & = phi.alt_(s s) + \( p - 1 \) \( phi.alt_s^2 - 1 \) \/ phi.alt + q r_s phi.alt_s \/ r \,\
 & = lambda_0 partial_s . $ <eq:warping-flow>]

These are also the usual doubly warped Ricci-flow equations in [12] Section 2.

#thm([Lemma 3.1.])[
  (Global elementary bounds).  #emph[For each flow in Proposition 2, there is a time-independent constant $C$ such that 
$ r lt.eq C \, #h(2em) \| r_s \| + \| phi.alt_s \| lt.eq C . $

 In particular, $r$ is uniformly Lipschitz in the metric $g \( t \)$. Also $R gt.eq - C$ throughout the flow.]
] <lem:gradients>

#proof[
  At a positive maximum of $r$, its first derivative vanishes and (3.3) gives $r_t lt.eq - \( q - 1 \) \/ r$. Differentiating the first equation with the stated commutator gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ partial_t \|_x r_s =  & \( r_s \)_(s s) + (p phi.alt_s / phi.alt + \( q - 2 \) r_s / r) \( r_s \)_s\
 & + [frac(\( q - 1 \) \( 1 - r_s^2 \), r^2) - p phi.alt_s^2 / phi.alt^2] r_s . $ <eq:slope-flow>]
  At a positive interior maximum with $r_s > 1$, the reaction has negative sign; the corresponding sign is positive at a negative minimum below $- 1$. Thus $\| r_s \|$ is bounded by the larger of one and its initial supremum. Interchanging $\( r \, q \)$ and $\( phi.alt \, p \)$ proves the same bound for $\| phi.alt_s \|$. On the complete interval between poles, the endpoint values are $r_s = 1 \, - 1$ and $phi.alt_s = 0$, so every offending extremum is interior. The argument is applied first on a compact time slab; the singular radial coefficients at the endpoints cause no extra boundary condition. Finally
  $ \( partial_t - Delta \) R = 2 \| "Ric" \|^2 gt.eq 0 $
  and the compact maximum principle imply $R \( dot.op \, t \) gt.eq min_M R \( dot.op \, 0 \)$. ◻
]

Where $r_s > 0$, regard $u = log phi.alt$ and $v = r_s = sqrt(z)$ as functions of $\( r \, t \)$. From now on their time derivatives fix $r$. Subtracting the advection $\( partial_t \|_x r \) partial_r$ in (3.3) gives

#[#set math.equation(numbering: n => "(3.5)")
 $ u_t & = z u_(r r) + frac(q - 1 + z, r) u_r - \( p - 1 \) e^(- 2 u) \,\
v_t & = z v_(r r) + frac(q - 1 - z, r) v_r + frac(\( q - 1 \) v \( 1 - v^2 \), r^2) - p v^3 u_r^2 . $ <eq:sideways>]

For later use, the geometric heat operator on a scalar composition with $r > 0$ is

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(D) F := \( partial_t - Delta \) F \( r \, t \) = F_t \|_r - z F_(r r) - frac(q - 1 + z, r) F_r . $ <eq:operator>]

Indeed $Delta r = r_(s s) + q r_s^2 \/ r + p phi.alt_s r_s \/ phi.alt$, so $r_t - Delta r = - \( q - 1 + z \) \/ r$. Equations (3.5) are written in a monotone radius coordinate. The composition identity (3.6) is geometric and remains valid across the equator. The same warping equations give the global identity, off the poles,

#[#set math.equation(numbering: n => "(3.7)")
 $ \( partial_t - Delta \) log \( phi.alt \/ r \) = frac(q - 1, r^2) - frac(p - 1, phi.alt^2) . $ <eq:ratio-heat>]

=== 3.2 Consequences of the construction <consequences-of-the-construction>

The first estimate is Stolarski’s strict cone separation [12] Proposition 5.1(2), expressed in the present scales. We include its short proof to record the fixed positive gap as the cap shrinks. Its constant may be small and may depend on the chosen flow; it will be used only after the dimension and mode have been fixed.

#thm([Lemma 3.2.])[
  (A strict inner gap).  #emph[After choosing the tolerances sufficiently small, there are constants $epsilon_1 > 0$ and $C < oo$ such that, at all sufficiently late times, 
#[#set math.equation(numbering: n => "(3.8)")
 $ phi.alt \/ r gt.eq A \/ B + epsilon_1 quad \( 0 < r lt.eq Y_1 theta \) \, #h(2em) phi.alt \( Y_1 theta \, t \) lt.eq C theta . $ <eq:strict-gap>]

]
] <lem:gap>

#proof[
  At $gamma_1 = Y_1 delta^(nu \/ d)$, $delta^nu gamma_1^(- d) = Y_1^(- d)$, while the relative error in the leading small-$gamma$ asymptotic of $U_k$ tends to zero. Choose $eta_0^U < c_1 \/ 4$. Equation (2.3) then gives
  $ 0 < 1 / 2 c_1 Y_1^(- d) lt.eq tilde(U) \( gamma_1 \, tau \) lt.eq C_(q \, k \, Y_1) $
  at late times. This proves both assertions at the interface. Since $partial_(log r) log \( phi.alt \/ r \) = f - 1 lt.eq 0$, the lower bound propagates inward. For example, a fixed positive number below $\( A \/ B \) \( exp \( c_1 Y_1^(- d) \/ 2 \) - 1 \)$ is admissible as $epsilon_1$. ◻
]

#thm([Lemma 3.3.])[
  (Bounds used in the dimension estimate).  #emph[The construction parameters can be chosen so that, for all sufficiently large $q$ and all sufficiently late times, 
#[#set math.equation(numbering: n => "(3.9)")
 $ \| z - 1 \| lt.eq C_0 \/ q \, #h(2em) r \| u_r \| lt.eq 2 \, #h(2em) \( p - 1 \) r^2 e^(- 2 u) lt.eq \( q - 1 \) \( 1 + C_0 \/ q \) $ <eq:uniform>]

 on $0 < r lt.eq sqrt(delta)$, where $C_0$ is a numerical constant independent of $q$ and $k$. This interval is below the equator.]
] <lem:uniform>

#proof[
  For $0 < gamma lt.eq 1$, the fixed profiles and their errors satisfy
  $ \| tilde(U) \| + gamma \| tilde(U)_gamma \| lt.eq C_(q \, k) delta^nu gamma^(- d) \, #h(2em) \| tilde(Z) \| lt.eq C'_(q \, k) delta^nu gamma^(- d) $
  above their respective lower cutoffs. Enlarge $Y_1$, then $Y_2$, until the right sides at those cutoffs are at most $1 \/ q$. They only decrease as $gamma$ increases. In the complementary inner ranges use (2.4). Since
  $ 1 - B^2 = frac(2, q + 1) \, #h(2em) r u_r = 1 + gamma tilde(U)_gamma \, #h(2em) \( p - 1 \) r^2 e^(- 2 u) = \( q - 1 \) e^(- 2 tilde(U)) \, $
  we obtain $\| z - 1 \| lt.eq 3 \/ q$, $r \| u_r \| lt.eq 1 + 1 \/ q$, and the last bound with $e^(2 \/ q) lt.eq 1 + 4 \/ q$ for large $q$. Thus $C_0 = 4$ suffices. All dimension- or mode-dependent profile constants have been absorbed by the cutoff choices; they do not enter $C_0$.
  The lower cutoffs tend to zero and the upper cutoff exceeds one at late times. If the equator occurred before $gamma = 1$, the same estimate up to that endpoint would contradict its value $z = 0$, by continuity. Thus the stated interval is available in the $r$ coordinate. ◻
]

#thm([Lemma 3.4.])[
  (Global ratio and parabolic annuli).  #emph[For a flow chosen as above, $phi.alt \/ r gt.eq c_0 > 0$ globally off the poles. For every fixed $0 < a_1 < a_2 < oo$, at all sufficiently late times, 
#[#set math.equation(numbering: n => "(3.10)")
 $ \| "Ric" \| lt.eq C_(a_1 \, a_2) delta^(nu - 1) #h(2em) \( a_1 sqrt(delta) lt.eq r lt.eq a_2 sqrt(delta) \) . $ <eq:annular-ricci>]

 The constants and the required starting time may depend on the annulus.]
] <lem:annuli>

#proof[
  The positive large-$gamma$ coefficient of $U_k$, with a tolerance small compared with that coefficient, gives $tilde(U) gt.eq 0$ for all $gamma gt.eq Gamma_0$ in the profile region, where $Gamma_0$ is a fixed sufficiently large number. At the initial time use the initial profile bounds up to $G_(upright("init"))$, followed by the outer sign condition beyond that same endpoint. Increase the construction’s starting rescaled time so that $Gamma_0$ belongs to the controlled region for every subsequent time. On the full exterior ${ r gt.eq Gamma_0 sqrt(delta) }$, compare $log \( phi.alt \/ r \)$ with $log \( A \/ B \)$ in (3.7). The latter is an exact equilibrium value of its reaction. Initial and moving lateral data have the correct sign. On each compact time slab the reaction is locally Lipschitz there, so comparison applies. Both hemispheres are included, and the equator is not a boundary. Thus $phi.alt \/ r gt.eq A \/ B$ on the exterior. On $1 lt.eq gamma lt.eq Gamma_0$, profile control bounds $tilde(U)$ below; on $gamma lt.eq 1$ use Lemma 6. Earlier compact time intervals have a positive lower ratio by smoothness, positivity of $phi.alt$, and boundedness of $r$.
  For a fixed positive compact $gamma$-interval, the pulled-back metric $delta^(- 1) g$ is
  $ frac(d gamma^2, z) + \( A \/ B \)^2 gamma^2 e^(2 tilde(U)) g_(bb(S)^p) + gamma^2 g_(bb(S)^q) . $
  It differs in $C^2$ by $O \( delta^nu \)$ from the metric with $z = B^2$, $tilde(U) = 0$. The latter is the Ricci-flat cone with link $A^2 g_(bb(S)^p) + B^2 g_(bb(S)^q)$. Curvature depends smoothly on a positive metric and its first two derivatives on this fixed annulus. Hence its Ricci norm is $O \( delta^nu \)$ in the rescaled metric. Scaling back gives (3.10). Any prescribed fixed annulus eventually lies inside the profile region; as above, positivity of $z$ there excludes the equatorial endpoint. ◻
]

== 4 Curvature at the radius and cap scales <sec:cap>

#thm([Proposition 4.1.])[
  #emph[For every flow with the choices made above, and $q$ sufficiently large, there is a constant $C$, allowed to depend on that flow, such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ \( r^2 + theta^2 \) \| "Rm" \| lt.eq C $ <eq:full-curvature>]

 on $M times \[ 0 \, T \)$.]
] <prop:full-curvature>

We prove the two scale bounds separately. We use Shi’s curvature derivative estimates [11] in their global and local forms; precise statements and proofs are also given in [5] Theorems 1.4.1–1.4.2. A uniform curvature bound on a parabolic neighborhood gives a bound for $\| nabla "Rm" \|$ on a smaller neighborhood away from its initial time. The constants depend on the dimension, curvature bound, spatial margin, and elapsed time, and do not require an injectivity-radius lower bound. In each application below, the requisite parabolic neighborhood is established before the derivative estimate is used.

Stolarski proves a radius curvature bound in the inner region [12] Proposition 5.1(3). We first establish a global radius bound and then the cap-scale bound in Proposition 8. If the radius bound failed, both rescaled sphere radii would diverge while their arclength derivatives remained bounded. A persistent nonzero radial sectional curvature would then force a large change in one of those derivatives. For the cap bound, we first need a lower bound for the radius of the pole orbit and a quantitative estimate showing that $r_s$ approaches one near the pole. The same radial integration argument can then be used at the cap scale.

#thm([Lemma 4.2.])[
  #emph[There is a time-independent constant $C$ such that $r^2 \| "Rm" \| lt.eq C$.]
] <lem:r-curvature>

#proof[
  Suppose otherwise. Choose record points $\( x_i \, t_i \)$, with $t_i arrow.t T$, and put $r_i = r \( x_i \, t_i \) > 0$, $Q_i = \| "Rm" \| \( x_i \, t_i \)$, so that
  #[#set math.equation(numbering: n => "(4.2)")
   $ r_i^2 Q_i = max_(M times \[ 0 \, t_i \]) r^2 \| "Rm" \| arrow.r oo . $ <eq:r-record>]
  Such points exist by compactness on each closed time slab. Boundedness of $r$ implies $Q_i arrow.r oo$. By the $bb(S)^q$ component of the metric evolution,
  $ \| partial_t \|_x r^2 \| = 2 \| lambda_q \| r^2 lt.eq C_m r^2 \| "Rm" \| . $
  The identity extends to the poles since $r^2$ is smooth. For fixed sufficiently small $b > 0$, Equation (4.2) gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| r \( x \, t \)^2 - r \( x \, t_i \)^2 \| lt.eq r_i^2 \/ 16 quad upright("for ") t_i - b \/ Q_i lt.eq t lt.eq t_i \, $ <eq:r-time-variation>]
  at every fixed manifold point $x$. These time intervals lie in the flow for all large $i$.
  Rescale by $Q_i$ and translate $t_i$ to zero. On a fixed ball of radius $R$ about $x_i$ in the rescaled metric at time $- b$, the Lipschitz bound for $r$, Equation (4.3), and $r_i sqrt(Q_i) arrow.r oo$ imply $r gt.eq r_i \/ 2$ throughout $\[ - b \, 0 \]$, for large $i$. The record bound thus gives $\| "Rm" \| \/ Q_i lt.eq 4$ on this fixed spatial domain throughout the interval. Integrating the metric evolution makes the metrics uniformly comparable there, with a length-comparison factor $E$ independent of $R$ and $i$. Choose $R > E + 2$. A final-time curve of length at most one cannot leave this initial ball: up to its first exit its initial length would be at least $R$, and hence its final length at least $R \/ E > 1$. The final unit ball therefore lies inside the initial ball, with a fixed positive margin measured in the initial metric. Take $b$ below the dimension-dependent time threshold in the local derivative estimate. That estimate gives a uniform bound for the final rescaled $\| nabla "Rm" \|$ on that ball.
  In the final rescaled metric the warping functions are $F_1 = sqrt(Q_i) phi.alt$ and $F_2 = sqrt(Q_i) r$. Both tend to infinity at the center by Lemma 7. Their derivatives with respect to rescaled arclength are the original $phi.alt_s \, r_s$, hence uniformly bounded. Therefore both functions tend uniformly to infinity on any fixed short radial interval about the center. Such intervals exist: the Lipschitz bound makes the rescaled distance to either pole tend to infinity. Crossing the equator presents no obstruction.
  The rescaled tangential curvatures $j \, ell \, mu$ tend to zero. Since the rescaled norm of curvature is one at the center, the identity
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| "Rm" \|^2 = 4 (p h^2 + q h_q^2 + frac(p \( p - 1 \), 2) j^2 + frac(q \( q - 1 \), 2) ell^2 + p q mu^2) $ <eq:curvature-norm>]
  shows that a radial curvature $- F''_a \/ F_a$ has absolute value bounded below by a positive dimension-dependent constant. Along a radial geodesic, the radial vector and a fixed sphere-tangent vector divided by its warping factor are parallel. The derivative estimate therefore keeps that same sectional curvature of one sign and bounded away from zero on a fixed shorter interval. On that interval $F_a arrow.r oo$ uniformly. Integrating $F''_a$ forces an unbounded change in $F'_a$, contradicting the slope bound. ◻
]

The next proof quantifies the scalar-sign obstruction in [12] Proposition 5.3. There, the strict cone gap and monotone logarithmic slope rule out an ancient limit with nonnegative scalar curvature. Here we use the lower bound $R gt.eq - C$ on the given flow and integrate over a finite annulus whose logarithmic width would diverge if the pole orbit were too small.

#thm([Lemma 4.3.])[
  (Size of the pole orbit).  #emph[At all sufficiently late times, 
#[#set math.equation(numbering: n => "(4.5)")
 $ c theta lt.eq phi.alt \( 0 \, t \) lt.eq C theta . $ <eq:pole-size>]

 Moreover $phi.alt \( r \, t \) gt.eq c theta$ for $0 lt.eq r lt.eq Y_1 theta$.]
] <lem:pole-size>

#proof[
  The upper bound follows from Lemma 5 and $f = r u_r gt.eq 0$. For the lower bound, the scalar curvature computed from (3.1) is
  #[#set math.equation(numbering: n => "(4.6)")
   $ r^2 R =  & p \( p - 1 \) \( r \/ phi.alt \)^2 + q \( q - 1 \) \( 1 - z \)\
 & - p z #scale(x: 120%, y: 120%)[\[] \( p + 1 \) f^2 + \( 2 q - 2 \) f + 2 r f_r #scale(x: 120%, y: 120%)[\]] - \( p f + q \) r z_r . $ <eq:scalar-f>]
  For example, $phi.alt_(s s) \/ phi.alt = z \( u_(r r) + u_r^2 \) + z_r u_r \/ 2$ and $r_(s s) = z_r \/ 2$; substituting $u_r = f \/ r$ gives this formula directly.
  If the lower bound failed, choose times tending to $T$ for which $L_0 = phi.alt \( 0 \, t \) = o \( theta \)$. The inequalities $r_s gt.eq B$ and $\| phi.alt_s \| lt.eq C$ imply
  $ phi.alt \( L_0 \, t \) \/ L_0 lt.eq 1 + C \/ B . $
  Let $r_(*) = \( L_0 theta \)^(1 \/ 2)$. Since $partial_(log r) log \( phi.alt \/ r \) = f - 1$, the lower ratio bound and the last upper bound give
  $ 0 lt.eq integral_(L_0)^(r_(*)) \( 1 - f \) thin frac(d r, r) lt.eq C . $
  The integrand is nonnegative and nonincreasing, because $0 lt.eq f lt.eq 1$ and $f_r gt.eq 0$. Thus
  $ 0 lt.eq 1 - f \( r_(*) \, t \) lt.eq frac(C, log \( r_(*) \/ L_0 \)) arrow.r 0 . $
  Consequently $f = 1 + o \( 1 \)$ uniformly on $\[ r_(*) \, theta \]$.
  At $f = 1$, the nondifferentiated terms in the first two lines of (4.6), before the $z_r$ term, reduce to
  $ frac(p \( p - 1 \), \( phi.alt \/ r \)^2) + q \( q - 1 \) - m \( m - 1 \) z . $
  They vanish at $phi.alt \/ r = A \/ B$, $z = B^2$. By the fixed strict gap (3.8) and $z gt.eq B^2$, they are at most $- kappa$ for some fixed $kappa > 0$. The term involving $f_r$ is nonpositive. The uniform error $f - 1 = o \( 1 \)$ is harmless with the flow and dimension fixed. Using $R gt.eq - C$ from Lemma 4, we conclude, after reducing $kappa$ if necessary, that
  $ \( p f + q \) r z_r lt.eq - kappa + C theta^2 lt.eq - kappa \/ 2 quad \( r_(*) lt.eq r lt.eq theta \) . $
  Since $p f + q lt.eq m$, this implies $r z_r lt.eq - kappa \/ \( 2 m \)$. Integration contradicts $B^2 lt.eq z lt.eq 1$, because $log \( theta \/ r_(*) \) = 1 / 2 log \( theta \/ L_0 \) arrow.r oo$. This proves the pole lower bound. Monotonicity of $phi.alt$ extends it to the entire indicated inner interval. ◻
]

#thm([Lemma 4.4.])[
  (Radial slope at the cap scale).  #emph[For sufficiently large $q$, at late times, 
#[#set math.equation(numbering: n => "(4.7)")
 $ 0 lt.eq 1 - v lt.eq C r \/ theta #h(2em) \( 0 lt.eq r lt.eq theta \) . $ <eq:cap-slope>]

]
] <lem:cap-slope>

#proof[
  Let $w = 1 - v$. Equation (3.5) gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ (partial_t - z partial_(r r) - frac(q - 1 - z, r) partial_r + frac(\( q - 1 \) v \( 1 + v \), r^2)) w = p v^3 u_r^2 lt.eq C theta^(- 2) . $ <eq:w-operator>]
  The last inequality uses $u_r = phi.alt_s \/ \( phi.alt v \)$, Lemma 10, and $B lt.eq v lt.eq 1$. Applying this operator to $r \/ theta$ gives exactly
  $ frac(sigma r, delta theta) + frac(\( q - 1 \) \[ v \( 1 + v \) - 1 \] + z, r theta) . $
  For large $q$, $B \( 1 + B \) > 1$. Thus this expression is bounded below by a fixed positive multiple of $theta^(- 2)$ when $r lt.eq theta$. A sufficiently large multiple of $r \/ theta$ dominates the source, the data at $r = theta$, and the data on a fixed late starting slice.
  To justify comparison at the pole, fix a compact time slab. Smooth polar expansions give $w = O \( r^2 \)$ uniformly on that slab. The proposed upper barrier therefore dominates on a sufficiently small inner boundary $r = eta$. Compare on $eta lt.eq r lt.eq theta \( t \)$ and let $eta arrow.b 0$. The auxiliary radius may depend on the slab, but the barrier multiplier does not. This proves (4.7). ◻
]

#proof[
  It remains to bound $theta^2 \| "Rm" \|$. If this were unbounded, choose record points with $Q_i = \| "Rm" \| \( x_i \, t_i \)$ such that
  $ theta_i^2 Q_i = max_(M times \[ 0 \, t_i \]) theta \( t \)^2 \| "Rm" \| \( x \, t \) arrow.r oo \, #h(2em) theta_i = theta \( t_i \) . $
  Since $theta$ decreases, for every $t lt.eq t_i$ we have
  $ \| "Rm" \| \( x \, t \) lt.eq frac(theta_i^2, theta \( t \)^2) Q_i lt.eq Q_i . $
  The global derivative estimate therefore bounds $\| nabla "Rm" \|$ at the final time after rescaling by $Q_i$, uniformly in $i$. For all large $i$, a fixed backward interval in rescaled time lies inside the flow.
  Lemma 9 gives $r_i sqrt(Q_i) lt.eq C$, whereas $theta_i sqrt(Q_i) arrow.r oo$. Any fixed short outward radial interval from the center consequently lies in $r lt.eq theta_i$. On such intervals the rescaled first warping function satisfies $sqrt(Q_i) phi.alt gt.eq c sqrt(Q_i) theta_i arrow.r oo$. The rescaled second warping function is bounded above on each such interval, and its arclength derivative satisfies
  $ v arrow.r 1 $
  uniformly by Lemma 11. If the center is on a pole orbit, choose any outward radial ray.
  Move a fixed sufficiently small positive distance along the ray. The derivative estimate keeps the curvature norm at least $1 \/ 2$, while the rescaled radius is now bounded below by a fixed positive number. At this new center the three tangential curvatures tend to zero. By (4.4), some radial curvature has nonzero magnitude and constant sign on a fixed subsequent interval. For $F = sqrt(Q_i) phi.alt$, integration of $F''$ contradicts bounded $F'$ because $F arrow.r oo$. For $F = sqrt(Q_i) r$, it contradicts the uniform convergence $F' = v arrow.r 1$, because $F$ stays bounded below by a positive constant on that interval. Both alternatives are impossible. Together with Lemma 9, this proves (4.1). ◻
]

== 5 A dimension-explicit Ricci reaction bound <sec:reaction>

The constant in Proposition 8 may grow arbitrarily with the dimension. We next obtain a different estimate whose leading dimension dependence is controlled. Only the latter estimate will be used to choose the dimension. The cap estimate will enter afterward, with its flow-dependent constant, through an independently chosen small parameter.

=== 5.1 A one-dimensional interior estimate <a-one-dimensional-interior-estimate>

For $R > 0$, let $P_R = \( - R \, R \) times \[ - R^2 \, 0 \]$, with space coordinate $y$ and time coordinate $rho$.

#thm([Lemma 5.1.])[
  #emph[There is $epsilon.alt_0 > 0$ with the following property. If a smooth function $H$ on $P_2$ satisfies 
$ H_rho = a H_(y y) + b H_y + F \, #h(2em) \| a - 1 \| lt.eq epsilon.alt_0 \, #h(2em) \| H \| + \| b \| + \| F \| lt.eq K \, $

 then $\| H_y \| lt.eq C \( K \)$ on $P_1$, including the terminal time by continuity from below. No bounds on derivatives of the coefficients are required. The same conclusion holds after any fixed rescaling of the cylinders.]
] <lem:heat-perturbation>

#proof[
  Fix an exponent $s > 3$. The constant-coefficient heat estimate is
  #[#set math.equation(numbering: n => "(5.1)")
   $ parallel V_(y y) parallel_(L^s) + parallel V_rho parallel_(L^s) lt.eq C_s parallel V_rho - V_(y y) parallel_(L^s) $ <eq:heat-Lp>]
  for smooth Sobolev functions compactly supported in space and vanishing in the distant past, with norms over times up to zero. This is the classical parabolic Calderón–Zygmund estimate for the heat operator; its constants here are one-dimensional; see [8] Theorem 5.5, with time reversed. It follows equivalently from the $L^s$ boundedness of the second spatial derivative of the causal heat potential. The half-infinite time version follows by extending its forcing to future times by zero. The function itself need not vanish at time zero.
  For $1 lt.eq R_1 < R_2 < 2$, put $d_R = R_2 - R_1$ and choose a cutoff $zeta$ equal to one on $P_(R_1)$, supported spatially and in the past inside $P_(R_2)$, with
  $ \| zeta_y \| lt.eq C d_R^(- 1) \, #h(2em) \| zeta_(y y) \| + \| zeta_rho \| lt.eq C d_R^(- 2) . $
  Writing $V = zeta H$, direct expansion gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ \( partial_rho - partial_(y y) \) V =  & \( a - 1 \) V_(y y) + b V_y + zeta F\
 & + \( zeta_rho - a zeta_(y y) - b zeta_y \) H - 2 a zeta_y H_y . $ <eq:cutoff-heat>]
  Choose $epsilon.alt_0$ so that $C_s epsilon.alt_0 < 1 \/ 2$ and absorb the first term using (5.1). If $E \( R \) = parallel H_(y y) parallel_(L^s \( P_R \)) + parallel H_rho parallel_(L^s \( P_R \))$, the remaining terms yield
  $ E \( R_1 \) lt.eq C \( K \) d_R^(- 1) parallel H_y parallel_(L^s \( P_(R_2) \)) + C \( K \) d_R^(- 2) . $
  Spatial interpolation on intervals of radius between one and two gives
  $ parallel H_y parallel_(L^s \( P_R \)) lt.eq h parallel H_(y y) parallel_(L^s \( P_R \)) + C h^(- 1) parallel H parallel_(L^s \( P_R \)) $
  for sufficiently small $h > 0$, without boundary conditions on $H$. Taking $h$ to be a sufficiently small multiple of $d_R$ gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ E \( R_1 \) lt.eq 1 / 16 E \( R_2 \) + C \( K \) d_R^(- 2) . $ <eq:interior-iteration>]
  Iterate with $R_j = 7 \/ 4 - 2^(- j) \/ 4$. The error terms are summable since their factors grow as $4^j$ whereas the iteration contributes $16^(- j)$. The remainder tends to zero because $E \( R_j \) lt.eq E \( 7 \/ 4 \) < oo$ for each individual smooth function. This finiteness is not a presumed uniform bound. Hence $E \( 3 \/ 2 \) lt.eq C \( K \)$. Interpolation also controls the first derivative norm. Parabolic Sobolev embedding [9] Chapter II, Section 3, Lemma 3.3, with $s > 1 + 2$, bounds the spatial first derivative on $P_1$. This proves the claim. ◻
]

=== 5.2 Cylinders moving with the radial drift <cylinders-moving-with-the-radial-drift>

#thm([Lemma 5.2.])[
  #emph[For all sufficiently large $q$, and sufficiently late times, 
#[#set math.equation(numbering: n => "(5.4)")
 $ \| r z_r \| lt.eq C q^(- 1 \/ 2) \, #h(2em) r^2 \| u_(r r) \| lt.eq C q^(1 \/ 2) quad (0 < r lt.eq 1 / 8 sqrt(delta)) \, $ <eq:largeq-derivatives>]

 where $C$ is independent of both $q$ and $k$.]
] <lem:largeq-derivatives>

#proof[
  Fix $\( r_c \, t_c \)$ in the indicated region and set
  #[#set math.equation(numbering: n => "(5.5)")
   $ h_c = r_c / sqrt(q) \, #h(2em) t = t_c + h_c^2 rho \, #h(2em) r = R_c \( t \) + h_c y \, #h(2em) R_c \( t \) = sqrt(r_c^2 + 2 \( q - 1 \) \( t_c - t \)) . $ <eq:moving-cylinder>]
  On $P_2$, $1 lt.eq R_c \/ r_c lt.eq 3$. For $q gt.eq 16$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ 1 / 2 r_c lt.eq r lt.eq 7 / 2 r_c \, #h(2em) r^2 lt.eq 49 / 256 delta_c < delta \( t \) \, #h(2em) delta_c = T - t_c . $ <eq:cylinder-inclusion>]
  Moreover its earliest time is at least $t_c - delta_c \/ \( 16 q \)$. Thus a single sufficiently late threshold for $t_c$, for the chosen flow, puts every such cylinder inside the region of Lemma 6.
  The moving center in (5.5) follows the radial drift. Figure 1 depicts the resulting cylinder. A cylinder centered at a fixed radius would leave an uncontrolled coefficient of size $sqrt(q)$; the movement cancels this coefficient before the one-dimensional estimate is applied.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10.2, 0), [#text(size: 9pt)[$r$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 4.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 4.5), [#text(size: 9pt)[$t$]], anchor: "south", padding: 0.1176cm)
  merge-path({bezier((7.2, 0.5), (4.2, 3.8), (6.3, 1.6), (5.6, 2.7)); line((4.2, 3.8), (6.2, 3.8)); bezier((6.2, 3.8), (9.2, 0.5), (7.6, 2.7), (8.3, 1.6))}, close: true, fill: rgb("#e6e6ff"), stroke: none)
  bezier((7.2, 0.5), (4.2, 3.8), (6.3, 1.6), (5.6, 2.7), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  bezier((9.2, 0.5), (6.2, 3.8), (8.3, 1.6), (7.6, 2.7), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  bezier((8.2, 0.5), (5.2, 3.8), (7.3, 1.6), (6.6, 2.7), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0, 3.8), (6.8, 3.8), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((0, 3.8), [#text(size: 9pt)[$t_c$]], anchor: "east", padding: 0.1176cm)
  circle((5.2, 3.8), radius: 0.0635, fill: black, stroke: none)
  content((5.2, 3.8), [#text(size: 9pt)[$(r_c,t_c)$]], anchor: "south-west", padding: 0.1176cm)
  content((0.45, 1.9), [#text(size: 9pt)[$R_c'(t)=- frac(q-1, R_c(t))$]], anchor: "west", padding: 0.1176cm)
  line((7.2, -0.42), (9.2, -0.42), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((8.2, -0.42), [#text(size: 9pt)[$4h_c$]], anchor: "north", padding: 0.1176cm)
  content((7.75, 2.7), [#text(size: 9pt)[$h_c=r_c"/"sqrt(q)$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Schematic image of the fixed cylinder $P_2$ under (5.5). Its radial width is $4 h_c$ and its time length is $4 h_c^2$. Moving with $R'_c \( t \) = - \( q - 1 \) \/ R_c \( t \)$ leaves a bounded drift after rescaling. The drawing is not to scale. ],
  ) <fig:drift>
  Since $R'_c = - \( q - 1 \) \/ R_c$, the function $H = q \( v - 1 \)$, pulled back to this cylinder, satisfies Lemma 12 with
  #[#set math.equation(numbering: n => "(5.7)")
   $ a & = z \,\
b & = h_c [\( q - 1 \) (1 / r - 1 / R_c) - z / r] \,\
F & = q h_c^2 [frac(\( q - 1 \) v \( 1 - z \), r^2) - p v^3 u_r^2] . $ <eq:H-coefficients>]
  Indeed $\| H \| lt.eq C_0$, since $q \| v - 1 \| = q \| z - 1 \| \/ \( v + 1 \)$, and $\| a - 1 \| lt.eq C_0 \/ q$. The apparently large drift is bounded by
  $ lr(|h_c \( q - 1 \) (1 / r - 1 / R_c)|) = frac(\( q - 1 \) h_c^2 \| y \|, r R_c) lt.eq C . $
  For the source use $q h_c^2 = r_c^2$, $\( q - 1 \) \| 1 - z \| lt.eq C_0$, and $r \| u_r \| lt.eq 2$. All these coefficients and amplitudes are therefore bounded by one numerical constant. Increasing $q$ meets its smallness hypothesis. It follows that $\| H_y \| lt.eq C$ on $P_1$, and hence
  #[#set math.equation(numbering: n => "(5.8)")
   $ \| z_r \| = frac(2 v, q h_c) \| H_y \| lt.eq frac(C, r_c sqrt(q)) quad upright("on ") P_1 . $ <eq:zr-cylinder>]
  Differentiate the first equation of (3.5). With $w = u_r$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ w_t = z w_(r r) + [z_r + frac(q - 1 + z, r)] w_r + [z_r / r - frac(q - 1 + z, r^2) + 2 \( p - 1 \) e^(- 2 u)] w . $ <eq:ur-equation>]
  On the smaller cylinder $P_1$, set $W = r_c w$. Its transformed drift is
  $ b_W = h_c \( q - 1 \) \( 1 \/ r - 1 \/ R_c \) + h_c \( z_r + z \/ r \) \, $
  and its zeroth-order coefficient is
  $ c_W = h_c^2 [z_r \/ r - \( q - 1 + z \) \/ r^2 + 2 \( p - 1 \) e^(- 2 u)] . $
  Equations (3.9), (5.6), and (5.8) bound $\| W \|$, $\| b_W \|$, and $\| c_W \|$ numerically. In particular $h_c^2 \( p - 1 \) e^(- 2 u) lt.eq C$. Treat $c_W W$ as a bounded source and apply a fixed rescaled version of Lemma 12 on $P_1$. Evaluating at its center gives
  $ \| W_y \( 0 \, 0 \) \| = r_c h_c \| u_(r r) \( r_c \, t_c \) \| lt.eq C . $
  This proves the second estimate. The first follows from (5.8) at the center. Only the numerical $C_0$ and the one-dimensional estimates entered the constants, so neither $q$ nor $k$ occurs in $C$. ◻
]

=== 5.3 The Ricci norm and its reaction matrix <the-ricci-norm-and-its-reaction-matrix>

The derivative estimates now control the radial sectional curvatures. The remaining task is algebraic: write the curvature action on invariant diagonal tensors in coordinates that include their multiplicities in the norm. This isolates the leading term in $q$.

The tensor evolution and the evolving metric give

$ \( partial_t - Delta \) \| "Ric" \|^2 = - 2 \| nabla "Ric" \|^2 + 4 chevron.l "Rm" \( "Ric" \) \, "Ric" chevron.r . $

The inverse-metric derivatives in the squared norm cancel the cubic Ricci term from the covariant tensor evolution. Kato’s inequality then gives, wherever $\| "Ric" \| > 0$,

#[#set math.equation(numbering: n => "(5.10)")
 $ \( partial_t - Delta \) \| "Ric" \| lt.eq frac(2, \| "Ric" \|) chevron.l "Rm" \( "Ric" \) \, "Ric" chevron.r . $ <eq:ricci-norm>]

For diagonal tensors, our curvature convention is $chevron.l "Rm" \( D \) \, D chevron.r = sum_(i \, j) R_(i j i j) D_i D_j$, with $R_(i j i j)$ the sectional curvature for $i eq.not j$.

#thm([Proposition 5.3.])[
  #emph[At late times on $0 < r lt.eq 1 / 8 sqrt(delta)$, the reaction quotient 
$ c \( x \, t \) = frac(2 chevron.l "Rm" \( "Ric" \) \, "Ric" chevron.r, \| "Ric" \|^2) quad upright("where ") \| "Ric" \| > 0 $

 satisfies both bounds 
#[#set math.equation(numbering: n => "(5.11)")
 $ c lt.eq frac(2 \( q - 1 \) + C sqrt(q), r^2) \, #h(2em) c lt.eq C_(*) / theta^2 . $ <eq:reaction-two>]

 Here $C$ is independent of $q \, k$; $C_(*)$ may depend on the entire chosen flow. The second bound holds at the pole orbits as well. Globally at positive $r$, one also has $c lt.eq D_1 \/ r^2$ for some flow-dependent $D_1 > 0$.]
] <prop:reaction>

#proof[
  The Ricci tensor is diagonal and scalar on each sphere factor. For a tensor with entries $\( alpha \, beta^(times p) \, chi^(times q) \)$, use the Euclidean coordinates $\( alpha \, sqrt(p) beta \, sqrt(q) chi \)$, so its norm is the ordinary Euclidean norm. The curvature form has matrix
  #[#set math.equation(numbering: n => "(5.12)")
   $ mat(delim: "(", 0, sqrt(p) thin h, sqrt(q) thin h_q; sqrt(p) thin h, \( p - 1 \) j, sqrt(p q) thin mu; sqrt(q) thin h_q, sqrt(p q) thin mu, \( q - 1 \) ell) . $ <eq:reaction-matrix>]
  Indeed its mixed terms are $2 p h alpha beta$, $2 q h_q alpha chi$, and $2 p q mu beta chi$; this accounts for the ordered pairs and all multiplicities.
  Using $r$ as the spatial coordinate,
  #[#set math.equation(numbering: n => "(5.13)")
   $ h = - z \( u_(r r) + u_r^2 \) - 1 / 2 z_r u_r \, #h(2em) h_q = - z_r \/ \( 2 r \) \, #h(2em) mu = - z u_r \/ r \,\
j = e^(- 2 u) - z u_r^2 \, #h(2em) ell = \( 1 - z \) \/ r^2 . $ <eq:curv-sideways>]
  By Lemmas 6 and 13, after multiplication by $r^2$ the diagonal entries of (5.12) are bounded above by $0 \, q - 1 + C_0 \, C_0$, respectively. Its off-diagonal entries have sizes $O \( sqrt(q) \) \, O \( 1 \) \, O \( sqrt(q) \)$, respectively, with numerical constants. The largest eigenvalue is therefore at most $q - 1 + C sqrt(q)$. Equation (5.10) proves the first bound. The curvature contraction is bounded in absolute value by a dimension-dependent constant times $\| "Rm" \| \| "Ric" \|^2$. Proposition 8 gives the other two bounds, including the bound at a pole by continuity of the geometric curvature tensor. ◻
]

== 6 Comparison and the scalar-curvature bound <sec:barriers>

We combine the two reaction bounds with small Ricci curvature on parabolic annuli. The inner comparison gives a spatial Ricci exponent strictly below one; integrating its square through a scalar supersolution then gives the required bounded scalar curvature.

For the inner Ricci comparison we will use a positive function of the form

$ H = delta^L \( r^2 + b_0 theta^2 \)^(- a \/ 2) \, #h(2em) a \, L \, b_0 > 0 . $

Its radial diffusion has leading coefficient $a \( q - 1 \)$, so we require $a > 2$ to dominate the leading reaction coefficient $2 \( q - 1 \)$. At the cap scale, the identity $delta^L = theta^(L \/ sigma)$ makes its size proportional to $theta^(- \( a - L \/ sigma \))$. We will arrange that this exponent lies between zero and one, allowing a bounded scalar barrier to dominate the resulting Ricci-square source. The choices below also make the parabolic-annulus estimate supply the lateral data for $H$.

=== 6.1 Order of the choices <order-of-the-choices>

We now choose one flow to prove Theorem 1. Set $a = 5 \/ 2$. Since $d arrow.r 2$ as $q arrow.r oo$, choose $q$ large enough that $2 < d < a$, all universal thresholds above hold, and

#[#set math.equation(numbering: n => "(6.1)")
 $ frak(m) := \( a - 2 \) \( q - 1 \) - C sqrt(q) - 2 a^2 - 1 > 0 \, $ <eq:dimension-margin>]

where $C$ is the universal constant in Proposition 14. Next choose a sufficiently large even $k$ so that, with

#[#set math.equation(numbering: n => "(6.2)")
 $ L = k - 1 \, #h(2em) e = a - L \/ sigma = a - d + d \/ k \, $ <eq:barrier-exponents>]

we have $0 < e < 1$, $nu > 1$, and $sigma > 1 \/ 2$. These requirements are compatible because $d > 2$. Define

$ xi = min { 1 \/ 8 \, 1 \/ \( 2 sqrt(L) \) } . $

Choose the tolerances and cutoffs as in Section 3, and fix the resulting flow. In particular $C_(*)$ and $D_1$ in Proposition 14 are now fixed finite numbers. Only after this step choose $b_0 > 0$ so that

#[#set math.equation(numbering: n => "(6.3)")
 $ b_0 C_(*) < frak(m) . $ <eq:b0-choice>]

The remaining constants below are chosen for this same flow. Whenever a later starting time is needed, we restrict to a later slice of the flow already chosen; we do not repeat the construction or change its parameters.

In Figure 2, $Gamma > xi$ denotes a fixed outer comparison radius whose size will be chosen in (6.13). The annular estimate is available for every such fixed radius after moving the starting time later.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, -0.34), (2, 0.34), fill: rgb("#e8e8ff"), stroke: none)
  rect((2, -0.34), (6, 0.34), fill: rgb("#fff0e0"), stroke: none)
  rect((6, -0.34), (11, 0.34), fill: rgb("#e6f2e6"), stroke: none)
  line((0, 0), (11.35, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((11.35, 0), [#text(size: 9pt)[$r$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.11), (0, 0.11), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2, -0.11), (2, 0.11), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6, -0.11), (6, 0.11), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9, -0.11), (9, 0.11), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.5164), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((2, -0.5164), [#text(size: 9pt)[$theta$]], anchor: "north", padding: 0.1176cm)
  content((6, -0.5164), [#text(size: 9pt)[$xi sqrt( delta )$]], anchor: "north", padding: 0.1176cm)
  content((9, -0.5164), [#text(size: 9pt)[$Gamma sqrt( delta )$]], anchor: "north", padding: 0.1176cm)
  content((1, 0.42), [#text(size: 9pt)[cap]], anchor: "south", padding: 0.1176cm)
  content((4, 0.42), [#text(size: 9pt)[inner comparison]], anchor: "south", padding: 0.1176cm)
  content((8.5, 0.42), [#text(size: 9pt)[annulus and exterior]], anchor: "south", padding: 0.1176cm)
  line((0, -1.18), (6, -1.18), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, -1.38), [#box(width: 6.435cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$| "Ric" | lt.eq C delta^L(r^2+b_0 theta^2)^(-a"/"2)$]]])], anchor: "north")
  line((6, -1.18), (11, -1.18), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.5, -1.38), [#box(width: 4.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$| "Ric" | lt.eq C$]]])], anchor: "north")
})],
  caption: [Figure 2: The comparison regions at a late time, shown on a schematic radius axis. The cap scale $theta$ is much smaller than the parabolic scale $sqrt(delta)$. The inner Ricci estimate bridges these scales. Fixed parabolic-annulus control supplies lateral data for both the inner and exterior comparisons; $Gamma$ is chosen later in (6.13). ],
) <fig:scales>

=== 6.2 The inner Ricci estimate <the-inner-ricci-estimate>

#thm([Proposition 6.1.])[
  #emph[There is a constant $C$ such that, at all sufficiently late times, 
#[#set math.equation(numbering: n => "(6.4)")
 $ \| "Ric" \| lt.eq C delta^L \( r^2 + b_0 theta^2 \)^(- a \/ 2) #h(2em) \( 0 lt.eq r lt.eq xi sqrt(delta) \) . $ <eq:inner-ricci>]

 In particular, 
#[#set math.equation(numbering: n => "(6.5)")
 $ \| "Ric" \| lt.eq C r^(- e) #h(2em) \( 0 < r lt.eq xi sqrt(delta) \) . $ <eq:ricci-power>]

]
] <prop:ricci-barrier>

#proof[
  Put $D_0 = r^2 + b_0 theta^2$ and $H = delta^L D_0^(- a \/ 2)$. This is a positive smooth geometric function on both closed caps, including their pole orbits, because $r^2$ is smooth there. Using $theta_t = - sigma theta \/ delta$ and Equation (3.6), direct differentiation gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ frac(cal(D) H, H) & = - L / delta + frac(a sigma b_0 theta^2, delta D_0) + frac(a \( q - 1 \) + 2 a z, D_0) - frac(a \( a + 2 \) z r^2, D_0^2)\
 & gt.eq - L / delta + frac(a \( q - 1 \) - a^2 z, D_0) . $ <eq:inner-barrier-computation>]
  The first line has a nonnegative extra time term, and $r^2 lt.eq D_0$ gives the second. The identities extend to a pole by continuity; in particular the apparent $r^(- 1) H_r$ term has a finite limit.
  In the indicated region $z lt.eq 2$ for large $q$, and
  $ L D_0 \/ delta lt.eq L xi^2 + L b_0 delta^(2 sigma - 1) lt.eq 1 $
  at sufficiently late times. Where $\| "Ric" \| > 0$ and $r > 0$, the two bounds in (5.11) imply
  $ c D_0 = c r^2 + b_0 c theta^2 lt.eq 2 \( q - 1 \) + C sqrt(q) + b_0 C_(*) . $
  Both inequalities may be added even if $c$ is negative. At a pole, the second reaction bound alone implies the same upper bound for $c D_0$. Therefore
  #[#set math.equation(numbering: n => "(6.7)")
   $ frac(cal(D) H, H) - c gt.eq frac(- 1 + a \( q - 1 \) - 2 a^2 - 2 \( q - 1 \) - C sqrt(q) - b_0 C_(*), D_0) > 0 $ <eq:strict-ricci-super>]
  by (6.1) and (6.3).
  On the moving lateral boundary $r = xi sqrt(delta)$,
  $ H = delta^(L - a \/ 2) \( xi^2 + b_0 delta^(2 sigma - 1) \)^(- a \/ 2) asymp delta^(L - a \/ 2) . $
  Lemma 7 and $nu = k - d \/ 2$ give
  #[#set math.equation(numbering: n => "(6.8)")
   $ frac(\| "Ric" \|, H) lt.eq C delta^(nu - 1 - \( L - a \/ 2 \)) = C delta^(\( a - d \) \/ 2) . $ <eq:lateral-ratio>]
  This ratio is uniformly bounded at late times. Choose a sufficiently late fixed starting time $t_0$. On that compact starting slice, $H$ has a positive minimum on the caps, so a single multiple of $H$ strictly dominates both initial and lateral data for every subsequent compact time slab.
  At a first contact of $\| "Ric" \|$ with this positive barrier, the Ricci norm is nonzero and hence smooth nearby. Equation (5.10) and the strict inequality (6.7) rule out the contact by the maximum principle. This argument also applies at a pole, which is interior to the smooth manifold. It proves (6.4) with one multiplier for all times $t_0 lt.eq t < T$.
  Finally $delta^L = theta^(L \/ sigma) = theta^(a - e)$, with $a - e > 0$. For $r gt.eq theta$,
  $ H lt.eq theta^(a - e) r^(- a) lt.eq r^(- e) . $
  For $0 < r lt.eq theta$,
  $ H lt.eq b_0^(- a \/ 2) theta^(- e) lt.eq b_0^(- a \/ 2) r^(- e) . $
  These prove (6.5). ◻
]

=== 6.3 A scalar barrier at the pole <a-scalar-barrier-at-the-pole>

#thm([Proposition 6.2.])[
  #emph[The scalar curvature is uniformly bounded above on $0 lt.eq r lt.eq xi sqrt(delta)$ at late times.]
] <prop:scalar-inner>

#proof[
  For a real exponent $alpha$, Equation (3.6) gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ cal(D) \( r^alpha \) = - alpha \( q - 1 + alpha z \) r^(alpha - 2) #h(2em) \( r > 0 \) . $ <eq:power-operator>]
  Put $ell_0 = 2 - 2 e in \( 0 \, 2 \)$. In particular,
  #[#set math.equation(numbering: n => "(6.10)")
   $ cal(D) \( - r^(ell_0) \) = ell_0 \( q - 1 + ell_0 z \) r^(- 2 e) \, #h(2em) cal(D) \( r^(- 1) \) = \( q - 1 - z \) r^(- 3) . $ <eq:scalar-powers>]
  Write $\| "Ric" \| lt.eq K_R r^(- e)$ as in Proposition 15. Choose
  $ C_2 gt.eq frac(2 K_R^2, ell_0 \( q - 1 \)) . $
  Since $0 lt.eq z lt.eq 2 < q - 1$, every function
  #[#set math.equation(numbering: n => "(6.11)")
   $ S_epsilon = C_1 - C_2 r^(ell_0) + epsilon r^(- 1) \, #h(2em) epsilon > 0 \, $ <eq:scalar-barrier>]
  satisfies $cal(D) S_epsilon gt.eq 2 \| "Ric" \|^2$ at positive radii in the inner region.
  Choose one late starting time $t_0$ and let $rho_0 = xi sqrt(T - t_0)$. Smoothness bounds scalar curvature on the starting slice by a constant $K_0$. On the moving lateral boundary, Lemma 7, $nu > 1$, and $\| R \| lt.eq sqrt(m + 1) \| "Ric" \|$ give a uniform upper bound $K_partial$. The choice
  #[#set math.equation(numbering: n => "(6.12)")
   $ C_1 > max { K_0 \, K_partial } + C_2 rho_0^(ell_0) $ <eq:C1-choice>]
  therefore dominates the initial and lateral scalar data for every $epsilon > 0$.
  Fix $epsilon > 0$ and $t_1 < T$. Scalar curvature is bounded on the compact slab $\[ t_0 \, t_1 \]$. For sufficiently small $eta > 0$, the level $r = eta$ lies in the regular inner region throughout that slab and $epsilon \/ eta$ makes $S_epsilon$ dominate its scalar data. Apply comparison to $R - S_epsilon$ on
  $ { \( x \, t \) : t_0 lt.eq t lt.eq t_1 \, med eta lt.eq r \( x \, t \) lt.eq xi sqrt(T - t) } . $
  The moving outer boundary is regular in the monotone inner region. Both initial and lateral boundaries have been controlled, so the usual interior first-maximum argument applies. Let $eta arrow.b 0$. This proves $R lt.eq S_epsilon$ at every positive radius on the slab.
  Only the auxiliary excision radius depends on $epsilon \, t_1$; the constants in (6.12) do not. Letting the slab range up to $T$ and then sending $epsilon arrow.b 0$ pointwise gives
  $ R lt.eq C_1 - C_2 r^(ell_0) lt.eq C_1 #h(2em) \( r > 0 \) . $
  At every fixed time $t < T$, continuity gives the same bound at the pole orbits. No smoothness of $r^(ell_0)$ at the pole or uniform regularity at $t = T$ was used. ◻
]

=== 6.4 The exterior and the maximal time <the-exterior-and-the-maximal-time>

#thm([Proposition 6.3.])[
  #emph[There is a constant $C$ such that $\| "Ric" \| lt.eq C$ on $r gt.eq xi sqrt(delta)$ at late times.]
] <prop:exterior>

#proof[
  Choose $b_1 > 2 D_1 + 1$, where $D_1$ is the global reaction constant in Proposition 14, and choose
  #[#set math.equation(numbering: n => "(6.13)")
   $ Gamma > xi \, #h(2em) Gamma^2 gt.eq max { 2 b_1 \, 4 \( q - 1 \) } . $ <eq:exterior-choices>]
  On the entire geometric exterior $r gt.eq Gamma sqrt(delta)$, put $H_o = 1 - b_1 delta \/ r^2$. This is smooth across the equator and satisfies $1 \/ 2 lt.eq H_o lt.eq 1$. Equation (3.6) gives
  #[#set math.equation(numbering: n => "(6.14)")
   $ cal(D) H_o = b_1 / r^2 [1 - #scale(x: 120%, y: 120%)[\(] 2 \( q - 1 \) - 4 z #scale(x: 120%, y: 120%)[\)] delta / r^2] gt.eq frac(b_1, 2 r^2) > frac(D_1 H_o, r^2) . $ <eq:outer-barrier>]
  Here only $z gt.eq 0$ was needed; no global smallness of $z - 1$ is required.
  The fixed parabolic radius $Gamma$ eventually lies in the region of Lemma 7. The annular estimate and $nu > 1$ bound $\| "Ric" \|$ on the moving lateral boundary uniformly. On a sufficiently late starting slice, compactness and $H_o gt.eq 1 \/ 2$ allow one multiplier to dominate the initial data. The same first-contact argument as in Proposition 15 proves $\| "Ric" \| lt.eq C H_o lt.eq C$ throughout the exterior. The equator is interior, since both hemispheres are included. On the remaining fixed annulus $xi lt.eq r \/ sqrt(delta) lt.eq Gamma$, use Lemma 7 directly. ◻
]

#proof[
  Take the single flow selected at the start of Section 6. Propositions 16 and 17 give a uniform scalar upper bound on all of $M$ for sufficiently late times. There are only finitely many required starting-time restrictions, and every parameter and constant has already been fixed, so a common such time exists. Earlier times form a compact smooth interval and contribute a finite bound. Lemma 4 supplies the scalar lower bound. Thus $sup_(M times \[ 0 \, T \)) \| R \| < oo$.
  By Lemma 10, $phi.alt \( 0 \, t \) lt.eq C theta \( t \) arrow.r 0$. At a pole orbit, smoothness gives $phi.alt_s = 0$. Since $p = 2$, a two-plane tangent to the $bb(S)^p$ orbit has sectional curvature
  $ j \( 0 \, t \) = phi.alt \( 0 \, t \)^(- 2) arrow.r oo . $
  Consequently $max_M \| "Rm" \| arrow.r oo$. A smooth extension on the same compact manifold would bound curvature on a compact time neighborhood of $T$, which is impossible. The constructed flow exists smoothly for every $t < T$; closed-manifold uniqueness therefore identifies $T$ with the maximal existence time for its smooth initial metric. The product $bb(S)^2 times bb(S)^(q + 1)$ is closed, connected, and has dimension $q + 3 gt.eq 4$, as required. ◻
]

#thm([Corollary 6.4.])[
  (Curvature rates in a fixed dimension).  #emph[For every sufficiently large integer $q$, set 
$ d_q = frac(q + 1 - sqrt(\( q + 1 \) \( q - 7 \)), 2) . $

 For every sufficiently large even integer $k$, with the threshold allowed to depend on $q$, there is a smooth Ricci flow on $bb(S)^2 times bb(S)^(q + 1)$ with finite maximal time $T$, uniformly bounded scalar curvature, and constants $0 < c lt.eq C < oo$ such that 
$ c \( T - t \)^(- 2 k \/ d_q) lt.eq max_M \| "Rm" \| \( dot.op \, t \) lt.eq C \( T - t \)^(- 2 k \/ d_q) $

 for all sufficiently late times. In particular, one fixed dimension admits such flows with an unbounded discrete set of power-law Type-II curvature exponents. The flow, $T$, and the constants may depend on $q$ and $k$.]
] <cor:rates>

#proof[
  Every threshold used to choose $q$ at the beginning of this section is independent of $k$. Once such a $q$ is fixed, all sufficiently large even $k$ satisfy the requirements in (6.2); Proposition 2 then permits the remaining choices. The preceding comparisons apply to each resulting flow, with constants that may depend on it.
  Here $d = d_q$ and $theta = \( T - t \)^(k \/ d_q)$. Proposition 8 gives $max_M \| "Rm" \| lt.eq C theta^(- 2)$. At either pole orbit, Lemma 10 gives $phi.alt \( 0 \, t \) lt.eq C theta$, and the tangential sectional curvature is $j \( 0 \, t \) = phi.alt \( 0 \, t \)^(- 2)$. Hence $max_M \| "Rm" \| gt.eq c theta^(- 2)$. These are the claimed two-sided bounds. Since $2 k \/ d_q > 1$ and tends to infinity with $k$, the flows are Type II and their exponents are unbounded with $q$ fixed. ◻
]

#heading(level: 1)[References]
#bibitem([1])[S.~Angenent, J.~Isenberg, and D.~Knopf, #emph[Degenerate neckpinches in Ricci flow], J. Reine Angew. Math. #strong[709] (2015), 81--117. #link("https://arxiv.org/abs/1208.4312v1")[arXiv:1208.4312v1].]
#bibitem([2])[S.~Angenent and D.~Knopf, #emph[An example of neckpinching for Ricci flow on $S^(n + 1)$], Math. Res. Lett. #strong[11] (2004), no.~4, 493--518. #link("https://web.ma.utexas.edu/users/danknopf/Neckpinch.pdf")[Author's text]\; #link("https://web.ma.utexas.edu/users/danknopf/Corrigendum.pdf")[corrigendum].]
#bibitem([3])[R.~H. Bamler, #emph[Convergence of Ricci flows with bounded scalar curvature], Ann. of Math. (2) #strong[188] (2018), no.~3, 753--831. #link("https://doi.org/10.4007/annals.2018.188.3.2")[doi:10.4007/annals.2018.188.3.2].]
#bibitem([4])[C.~Böhm, #emph[Non-compact cohomogeneity one Einstein manifolds], Bull. Soc. Math. France #strong[127] (1999), no.~1, 135--177. #link("https://doi.org/10.24033/bsmf.2345")[doi:10.24033/bsmf.2345].]
#bibitem([5])[H.-D. Cao and X.-P. Zhu, #emph[A complete proof of the Poincaré and geometrization conjectures---application of the Hamilton--Perelman theory of the Ricci flow], Asian J. Math. #strong[10] (2006), no.~2, 165--492. #link("https://www.renyi.hu/~stipsicz/perelman/cao-zhu.pdf")[Full text].]
#bibitem([6])[H.-L.~Gu and X.-P. Zhu, #emph[The existence of Type II singularities for the Ricci flow on $S^(n + 1)$], Comm. Anal. Geom. #strong[16] (2008), no.~3, 467--494. #link("https://arxiv.org/abs/0707.0033v1")[arXiv:0707.0033v1].]
#bibitem([7])[R.~S. Hamilton, #emph[The formation of singularities in the Ricci flow], Surveys in Differential Geometry, Vol.~II (Cambridge, MA, 1993), International Press, Cambridge, MA, 1995, 7--136. #link("https://intlpress.com/site/pub/files/_fulltext/journals/sdg/1993/0002/0001/SDG-1993-0002-0001-a002.pdf")[Full text].]
#bibitem([8])[N.~V. Krylov, #emph[Parabolic equations with VMO coefficients in spaces with mixed norms], #link("https://arxiv.org/abs/math/0610955v1")[arXiv:math/0610955v1], 2006. Theorem numbering refers to this version. Published as #emph[Parabolic equations with VMO coefficients in Sobolev spaces with mixed norms], J. Funct. Anal. #strong[250] (2007), no.~2, 521--558. #link("https://doi.org/10.1016/j.jfa.2007.04.003")[doi:10.1016/j.jfa.2007.04.003].]
#bibitem([9])[O.~A. Ladyzhenskaya, V.~A. Solonnikov, and N.~N. Ural'tseva, #emph[Linear and Quasi-linear Equations of Parabolic Type], Translations of Mathematical Monographs, vol.~23, American Mathematical Society, Providence, RI, 1968; corrected reprint, 1988. #link("https://doi.org/10.1090/mmono/023")[doi:10.1090/mmono/023].]
#bibitem([10])[N.~Šešum, #emph[Curvature tensor under the Ricci flow], Amer. J. Math. #strong[127] (2005), no.~6, 1315--1324. #link("https://doi.org/10.1353/ajm.2005.0042")[doi:10.1353/ajm.2005.0042].]
#bibitem([11])[W.-X. Shi, #emph[Deforming the metric on complete Riemannian manifolds], J. Differential Geom. #strong[30] (1989), no.~1, 223--301. #link("https://doi.org/10.4310/jdg/1214443292")[doi:10.4310/jdg/1214443292].]
#bibitem([12])[M.~Stolarski, #emph[Curvature Blow-up in Doubly-warped Product Metrics Evolving by Ricci Flow], #link("https://arxiv.org/abs/1905.00087v1")[arXiv:1905.00087v1], 2019. All numbered source references in this paper use this version. Published in Mem. Amer. Math. Soc. #strong[295] (2024), no.~1470. #link("https://doi.org/10.1090/memo/1470")[doi:10.1090/memo/1470].]
#bibitem([13])[B.~Wang, #emph[On the conditions to extend Ricci flow (II)], Int. Math. Res. Not. IMRN #strong[2012], no.~14, 3192--3223. #link("https://doi.org/10.1093/imrn/rnr141")[doi:10.1093/imrn/rnr141]. #link("https://arxiv.org/abs/1107.5107v1")[arXiv:1107.5107v1]\; theorem numbering refers to this preprint version.]


