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

#align(center)[#text(size: 16pt, weight: "bold")[Generalized outer-electron radii of neutral Coulomb atoms]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The ionization problem asks how the outer electrons of an atom behave as its nuclear charge increases. The generalized ionization conjecture predicts universal asymptotics for both ionization energies and radii defined by a prescribed exterior electron mass. We resolve its radius part positively for the full correlated two-spin Schrödinger model, using the conditional screening and propagation estimates of [5].

=== 1.1 Statement of the result <statement-of-the-result>

In atomic units, for each integer $Z gt.eq 1$ let

#[#set math.equation(numbering: n => "(1.1)")
 $ H_Z = sum_(i = 1)^Z (- 1 / 2 Delta_(x_i) - frac(Z, \| x_i \|)) + sum_(1 lt.eq i < j lt.eq Z) frac(1, \| x_i - x_j \|) quad upright("on ") and.big^Z L^2 \( bb(R)^3 \; bb(C)^2 \) . $ <intro:hamiltonian>]

The operator is associated with its usual closed, bounded-below quadratic form. Let $Psi_Z$ be any normalized ground state and let its spin-summed one-electron density be

#[#set math.equation(numbering: n => "(1.2)")
 $ rho_(Psi_Z) \( x \) = Z sum_(sigma_1 \, dots.h \, sigma_Z in { 1 \, 2 }) integral_(bb(R)^(3 \( Z - 1 \))) \| Psi_Z \( x \, sigma_1 \; x_2 \, sigma_2 \; dots.h \; x_Z \, sigma_Z \) \|^2 thin upright(d) x_2 dots.h.c thin upright(d) x_Z . $ <intro:density>]

For $Z = 1$ the integral is absent. Thus $integral rho_(Psi_Z) = Z$. For integers $1 lt.eq m < Z$, define

#[#set math.equation(numbering: n => "(1.3)")
 $ R_m \( Psi_Z \) = inf {r gt.eq 0 : integral_(\| x \| > r) rho_(Psi_Z) \( x \) thin upright(d) x lt.eq m} . $ <intro:radius>]

This is a radius in the neutral atom: $m$ specifies the expected electron mass outside the sphere. The state itself still has $Z$ electrons.

#thm([Theorem 1.1.])[
  (Generalized ionization conjecture: radii).  #emph[Set $b_(upright("TF")) = \( 81 pi^2 \/ 2 \)^(1 \/ 3)$. For every choice of normalized neutral ground states $\( Psi_Z \)_(Z gt.eq 1)$ of (1.1), 
#[#set math.equation(numbering: n => "(1.4)")
 $ lim_(m arrow.r oo) m^(1 \/ 3) [limsup_(Z arrow.r oo\
Z > m) R_m \( Psi_Z \)] & = b_(upright("TF")) \,\
lim_(m arrow.r oo) m^(1 \/ 3) [liminf_(Z arrow.r oo\
Z > m) R_m \( Psi_Z \)] & = b_(upright("TF")) . $ <intro:limsup>]

 All limits are over integers. The inner limits hold $m$ fixed; no convergence in $Z$ at a fixed $m$ is assumed.]
] <intro:main>

The statement is uniform over all choices in each ground eigenspace. Neither the state nor its density is assumed to be spherically symmetric. Existence of these ground states, in the same form and spin convention, follows from the strict binding statement in [5] Lemma 2.5.

=== 1.2 History and scope <history-and-scope>

The Thomas–Fermi approximation became a rigorous description of the leading energy and scaled bulk density through the work of Lieb and Simon [3] Theorems III.1 and III.3. A neutral atom has bulk length scale $Z^(- 1 \/ 3)$, while the radius in (1.3), at fixed $m$, concerns only the fraction $m \/ Z$ of its mass. Convergence of the bulk density therefore leaves this outer-electron question unresolved. For the full quantum model, Seco, Sigal, and Solovej obtained a quantitative lower bound on the radius containing all but one expected electron [6] Theorem 3. This concerns the same expected-tail notion of radius, but its lower bound still decays with $Z$ and does not determine a universal outer-radius law.

Solovej’s unrestricted Hartree–Fock theorem established the universal outer-radius asymptotic with the same constant as in 1 [7] Definition 1.2 and Theorem 1.5. Its proof controls screened potentials on successively larger exterior regions [7] Sections 10–13, uniformly in the chosen Hartree–Fock minimizer. The generalized ionization conjecture for the full Schrödinger model explicitly retains both upper and lower large-$Z$ limits [8] Section 3, Equation (2). The order of limits in 1 is precisely this formulation. Sharp radius estimates were subsequently obtained for minimizers in Thomas–Fermi–Dirac–von Weizsäcker theory [1] Theorem 1.3 and for power density-matrix functionals [2] Theorem 3. These are results for distinct approximate variational models, not for arbitrary correlated Schrödinger ground states.

The limiting profile has its own earlier analytic theory. Lieb and Simon proved directional Sommerfeld asymptotics for neutral Thomas–Fermi systems [3] Theorem IV.10. Solovej’s later comparison estimate explicitly allows nonradial solutions [7] Lemma 4.4 and Remark 4.5; the homogeneous rigidity statement used here is a consequence of that estimate. We give a short dilation proof in 8. The additional task is to obtain such a profile from correlated quantum ground states and then recover their expected exterior mass.

For the full model, the foundation companion already bounds above and below, uniformly in $Z$ and the neutral ground state, the radius leaving one half of an electron in expected exterior mass [5] Theorem 1.2. The present theorem identifies the sharp coefficient as the prescribed exterior mass tends to infinity. The same companion supplies the conditional density comparisons and positive intermediate subsolutions used for this passage. Section 2 defines their common observations and smoothing conventions; Appendix 6 records the provider results and the order of parameter choices. The intermediate-scale compactness strategy also appears in the energy companion [4] Section 5. That is a shared method: the proof here uses only the foundation estimates and establishes its own neutral-profile and expected-tail arguments.

=== 1.3 Proof and reusable ingredients <proof-and-reusable-ingredients>

The limiting neutral Thomas–Fermi model explains both the rescaling and the radius coefficient. Its density $𝜚$ and screened field $F$ satisfy, away from the nucleus,

#[#set math.equation(numbering: n => "(1.5)")
 $ 𝜚 = k \( F_(+) \)^(3 \/ 2) \, #h(2em) Delta F = 4 pi 𝜚 \, #h(2em) k = frac(2^(3 \/ 2), 3 pi^2) \, #h(2em) t_(+) = max \( t \, 0 \) . $ <intro:constants>]

Here $k$ corresponds to two spin states and kinetic operator $- Delta \/ 2$ [5] Equation (1.3). Since $Delta \| x \|^(- 4) = 12 \| x \|^(- 6)$, the positive radial homogeneous solution is $F_(*) \( x \) = A_(*) \| x \|^(- 4)$, with

#[#set math.equation(numbering: n => "(1.6)")
 $ A_(*) := (frac(12, 4 pi k))^2 = frac(81 pi^2, 8) \, #h(2em) rho_(*) \( x \) := k A_(*)^(3 \/ 2) \| x \|^(- 6) quad \( x eq.not 0 \) . $ <intro:sommerfeld>]

Its exterior mass is

$ integral_(\| x \| > r) rho_(*) \( x \) thin upright(d) x = 4 A_(*) r^(- 3) = b_(upright("TF"))^3 r^(- 3) \, $

so prescribing mass $m$ gives radius $b_(upright("TF")) m^(- 1 \/ 3)$. These are equations for the limiting model, not identities for the quantum density $rho_(Psi_Z)$.

To reach this model from a quantum state, we add small independent errors to the electron positions and condition on the resulting unordered observations. Conditionally averaging smooth unit-mass packets around the electron positions gives a density; subtracting its Coulomb potential from the nuclear potential gives the screened field. At an intermediate radius $s$, we rescale this field by $s^4$ and the density by $s^6$. The comparison estimate gives a pointwise Thomas–Fermi relation on larger and larger rescaled annuli. Two difficulties remain: the field has only an upper bound, and the total rescaled electron mass can diverge. Exact neutrality makes its spherical mean nonnegative. The upper bound then controls the full local $L^1$ norm, so harmonic interior estimates give compactness even for these signed fields.

The intermediate subsolutions transfer a strictly positive lower bound to each limit. Dilation compactness and contact at approximate extrema then identify the field as the homogeneous Sommerfeld profile, without assuming radiality. The compactness and rigidity criteria are stated separately in Lemma 4.1, Lemma 4.3.

Finally, a conditional profile must be related to the expected mass defining (1.3). A localized $L^2$ count estimate removes the exceptional observations; shrinking packet supports remove the smoothing; and a separate dyadic estimate controls the distant tail. The resulting mass asymptotic, proved along every admissible sequence, gives both iterated limits by a finite-threshold argument in $Z$.

The proof follows these steps in order. Section 3 selects observations on expanding annuli, Section 4 identifies the limiting field, and Section 5 passes to expected raw counts and proves the radius limits.

=== 1.4 Notation <notation>

Write $K \( x \) = \| x \|^(- 1)$, $V = Z K$, and $f \( t \) = 4 pi k \( t_(+) \)^(3 \/ 2)$. Constants $C \, c > 0$ may change from line to line; their permitted dependencies will be specified. Expectations include the spin sum and any stated auxiliary randomness. For the raw spatial configuration of $Psi_Z$, antisymmetry gives

#[#set math.equation(numbering: n => "(1.7)")
 $ bb(E) \# { i : x_i in A } = integral_A rho_(Psi_Z) \( x \) thin upright(d) x . $ <intro:count-density>]

All finite-system radial boundary spheres have probability zero.

== 2 Conditional screening inputs <sec:inputs>

We define one family of screened conditional fields and state the foundation estimates used to study it. Their complete proofs are in [5]; Appendix 6 collects the parameter order and provider map. All constants and thresholds below are uniform over neutral ground states.

=== 2.1 Energy offset and count bounds <energy-offset-and-count-bounds>

For a fixed nuclear charge $Z$, let $E_n = E_n \( Z \)$ be the bottom of the $n$-electron Hamiltonian with the same kinetic and spin conventions as (1.1), and put $E = inf_(n gt.eq 0) E_n$. A normalized state has offset $delta$ if its energy is at most $E + delta$.

#thm([Proposition 2.1.])[
  (Uniform offset and raw counts).  #emph[There are constants $D_0 \, Z_0 < oo$ such that every normalized neutral ground state with $Z gt.eq Z_0$ has offset at most $D_0$. For every fixed $0 < alpha < beta < oo$ and every $u > 0$, its raw electron configuration satisfies 
#[#set math.equation(numbering: n => "(2.1)")
 $ ∥\# { i : alpha u < \| x_i \| < beta u }∥_(L^2 \( bb(P) \)) & lt.eq C_(alpha \, beta) #scale(x: 120%, y: 120%)[\(] max { u^(- 3) \, 1 } + sqrt(D_0 u) #scale(x: 120%, y: 120%)[\)] \,\
bb(E) \# { i : \| x_i \| > 1 } & lt.eq C \( 1 + sqrt(D_0) \) . $ <inp:counts>]

]
] <inp:energy-counts>

#proof[
  Monotonicity of the sector energies [5] Lemma 2.1 and the bounded offset of the $\( Z - 1 \)$-electron sector [5] Proposition 12.3 give $E lt.eq E_Z lt.eq E_(Z - 1) lt.eq E + C$. Take $D_0 = C$. The first assertion in (2.1) is [5] Corollary 4.9. The second follows from [5] Lemma 12.2 with $t = 4$, since neutrality gives
  $ bb(E) \# { i : \| x_i \| > 1 } = Z - bb(E) \# { i : \| x_i \| < 1 } . $
  Boundary spheres have zero probability, so either convention for annular endpoints gives the same estimates. ◻
]

=== 2.2 One family of observations and packets <one-family-of-observations-and-packets>

The comparison estimate concerns a smoothed density conditioned on noisy position observations. As the observation index increases, we discard finer observations; the propagation construction uses conditional averaging over the discarded data. We use one packet family throughout, so that comparison and propagation concern the same fields.

Fix a real smooth radial function $g$, supported in the unit ball and normalized by $integral g^2 = 1$, and set $g_t \( y \) = t^(- 3 \/ 2) g \( y \/ t \)$. Fix the universal constants

$ w = 10^(- 5) \, #h(2em) L = 10^5 \, #h(2em) 0 < c_1 < \( 10 L \)^(- 1) . $

Also fix $epsilon > 0$ sufficiently small for the barrier construction below. For $0 < s < 1$ and $Z$ large enough that $2 epsilon Z^(- 1 \/ 3) lt.eq s$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ r_0 = epsilon Z^(- 1 \/ 3) \, #h(2em) r_j = 2^j r_0 \, #h(2em) J = max { j : r_j lt.eq s } \, #h(2em) s \/ 2 < r_J lt.eq s . $ <inp:observations>]

For each $j < J$ observe the unordered array ${ x_i + r_j^1.01 U_(j i) : 1 lt.eq i lt.eq Z }$. Every Cartesian coordinate of every $U_(j i)$ is independent, independent of the raw configuration, and has density $c_zeta exp \[ - 1 \/ \( 1 - u^2 \) \] upright(bold(1))_({ \| u \| < 1 })$. Let $cal(F)_j$ retain the arrays with indices $j \, dots.h \, J - 1$; let $cal(F)_J$ be trivial. Thus the sigma-fields decrease with $j$.

For a possible electron center $x$, define the master packets and their conditional densities by

#[#set math.equation(numbering: n => "(2.3)")
 $ d_x = \| x \| \, #h(2em) hat(d)_x = max { d_x \, r_0 } \, #h(2em) t_x = c_1 hat(d)_x min { hat(d)_x \, s }^w \,\
cal(K)_x \( y \) = g_(t_x) \( y - x \)^2 \, #h(2em) mu_j \( y \) = bb(E) [sum_(i = 1)^Z cal(K)_(x_i) \( y \) thin mid(bar.v) thin cal(F)_j] \, #h(2em) H_j = V - K * mu_j . $ <inp:packets>]

The upper clamp acts only on the factor raised to $w$. In particular $t_x gt.eq c_1 r_0^(1 + w) > 0$, every packet has mass one, and its support is contained in $B \( x \, t_x \)$. Unlike the unconditional raw density $rho_(Psi_Z)$, the density $mu_j$ depends on the observed data and includes packet smoothing. Section 5 removes both operations to recover the expected raw mass defining the radius.

We use the conditional-integral versions in [5] Lemma 5.1 and Section 10.1: at data of positive marginal density, integrate against the raw law multiplied by the observation likelihood and divided by that marginal density. These versions are jointly measurable. For each finite system, every spatial derivative of $mu_j$ has a deterministic bound, since the widths have a positive lower bound. Almost surely,

#[#set math.equation(numbering: n => "(2.4)")
 $ mu_j gt.eq 0 \, #h(2em) integral mu_j = Z \, #h(2em) Delta H_j = - 4 pi Z delta_0 + 4 pi mu_j . $ <inp:mass-poisson>]

The remainder $H_j - V$ is continuous and locally Lipschitz even at zero. For example, splitting the Coulomb potential and its gradient at unit distance uses boundedness of $mu_j$ near the singularity and its finite mass farther away. The corresponding regularity bounds may depend on $Z$. The conditional tower identity for $mu_j$ holds pointwise in space; the identity for $H_j$ holds away from the nucleus, and that for the continuous extension of $H_j - V$ holds everywhere. Both identities hold after integration against smooth compactly supported tests.

=== 2.3 The inverse comparison <the-inverse-comparison>

#thm([Proposition 2.2.])[
  (Conditional comparison).  #emph[There is a universal $C_(upright("cap"))$ with the following property. Fix $L_1 gt.eq 2$, $0 < h_l < h_h < oo$, and $0 < xi < h_l \/ 16$. For all sufficiently small $s > 0$, depending on these parameters and $D_0$, and each $j < J$, there is an event in $cal(F)_j$ whose complement has probability at most $C r_j^25$, on which, simultaneously for $r_j lt.eq \| y \| lt.eq 4 L_1 r_j$ and $h_l lt.eq h lt.eq h_h$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ H_j \( y \) lt.eq C_(upright("cap")) \| y \|^(- 4) \,\
\| y \|^6 mu_j \( y \) > k h^(3 \/ 2) quad arrow.r.double quad \| y \|^4 H_j \( y \) gt.eq h - xi \,\
\| y \|^6 mu_j \( y \) < k h^(3 \/ 2) quad arrow.r.double quad \| y \|^4 H_j \( y \) lt.eq h + xi . $ <inp:comparison>]

 The probability constant may depend on the fixed comparison parameters, but $C_(upright("cap"))$ does not. The estimates are uniform in $Z$, the ground state, $j$, and $J$.]
] <inp:comparison-prop>

This is [5] Proposition 10.1. The observations and packets in (2.2)–(2.3) are chosen before $L_1 \, h_l \, h_h \, xi$. Varying the comparison accuracy or its annular width therefore does not change the conditional fields. This common choice is essential when we combine increasingly accurate comparisons with a single barrier construction.

=== 2.4 Intermediate subsolutions <intermediate-subsolutions>

#thm([Proposition 2.3.])[
  (Intermediate subsolutions).  #emph[For the fixed constants above, there are $B > 0$, $C_(upright("inv")) < oo$, $s_(upright("bar")) > 0$, and a finite integer threshold $Z_(upright("bar")) \( s \)$ for every $0 < s lt.eq s_(upright("bar"))$, such that the following holds. For every $Z gt.eq Z_(upright("bar")) \( s \)$ and every neutral ground state, [5] Proposition 11.2 supplies, at each $0 lt.eq j lt.eq J$, $cal(F)_j$-measurable functions $u_j \, p_j$ satisfying 
#[#set math.equation(numbering: n => "(2.6)")
 $ Delta u_j gt.eq - 4 pi Z delta_0 + 4 pi upright(bold(1))_({ \| y \| < r_j }) mu_j - 4 pi p_j + upright(bold(1))_({ \| y \| gt.eq r_j }) f \( u_j \) quad upright("in ") cal(D)' \( bb(R)^3 \) \,\
B \| y \|^(- 4) (1 - frac(r_j, 8 \| y \|)) lt.eq u_j \( y \) lt.eq C_(upright("inv")) \| y \|^(- 4) quad \( \| y \| gt.eq r_j \) \,\
p_j gt.eq 0 \, #h(2em) "supp" p_j subset { \| y \| lt.eq r_j } \, #h(2em) bb(E) integral p_j lt.eq C \( s^32 + s^gamma \) \, #h(2em) gamma = 19 / 2 - 3 w > 0 . $ <inp:barriers>]

 For each finite system and index, $p_j$ is bounded and $u_j - V$ is continuous and locally Lipschitz through zero. The constants $B$, $C_(upright("inv"))$, and $C$ and the thresholds are independent of the ground state and of the number of dyadic scales. We enlarge $Z_(upright("bar")) \( s \)$ to include $Z gt.eq Z_0$ and $2 r_0 lt.eq s$.]
] <inp:barrier-prop>

The bound on the expected error is valid at every intermediate index. Its persistence is important enough to recall: the propagation first replaces $p_j$ by

$ tilde(p) = p_j + upright(bold(1))_({ upright("bad data at step ") j }) upright(bold(1))_({ r_j lt.eq \| y \| < 2 r_j }) mu_j $

and then sets $p_(j + 1) = bb(E) \[ tilde(p) divides cal(F)_(j + 1) \]$; as in the proof of [5] Proposition 11.2. The added source is nonnegative and conditional averaging preserves its expected integral. Hence $bb(E) integral p_j$ is nondecreasing in $j$, so the final bound controls all preceding indices. We fix all parameters of this construction once. The only parameters varied later are those of 3, applied to the same observations and packets.

At a fixed index $j$, the identities, finite-system regularity, and almost-sure subsolution properties may be placed on one $cal(F)_j$-measurable set of full measure. Continuity and a countable dense family of compactly supported distributional tests justify the simultaneous spatial assertions. We fix these versions before selecting any observation data. The comparison inequalities of 3 hold on their separate high-probability event, which will be intersected with this full-measure set.

== 3 Retained data on expanding annuli <sec:scales>

We first arrange the foundation estimates on a sequence of expanding rescaled annuli. Throughout this section, let

#[#set math.equation(numbering: n => "(3.1)")
 $ s_ell arrow.r 0 \, #h(2em) Z_ell gt.eq Z_(upright("bar")) \( s_ell \) \, #h(2em) Z_ell s_ell^3 arrow.r oo \, $ <scales:admissible>]

and call such a sequence #emph[admissible]. Choose an arbitrary normalized neutral ground state $Psi_ell$ at each $Z_ell$. The threshold $Z_(upright("bar"))$ includes the fixed barrier requirements of the preceding section. At each index we use its observations and master packets, with the barrier parameters fixed once and for all. Probabilities and conditional expectations refer to the enlarged law of that system; no common probability space for different indices is needed. We omit a finite initial segment whenever necessary.

#thm([Proposition 3.1.])[
  (Estimates on retained data).  #emph[There are deterministic integers $q_ell arrow.r oo$ and $j_ell < J_ell$, and events $G_ell in cal(F)_(j_ell)$ with $bb(P) \( G_ell \) arrow.r 1$, such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ a_ell := r_(j_ell) / s_ell in [frac(1, 2 q_ell) \, 1 / q_ell] . $ <scales:inner-radius>]

 Put $lambda_ell = Z_ell s_ell^3$ and, on each retained datum, define 
#[#set math.equation(numbering: n => "(3.3)")
 $ F_ell \( x \) & = s_ell^4 H_(j_ell) \( s_ell x \) \, & sigma_ell \( x \) & = s_ell^6 mu_(j_ell) \( s_ell x \) \,\
U_ell \( x \) & = s_ell^4 u_(j_ell) \( s_ell x \) \, & p_ell \( x \) & = s_ell^6 p_(j_ell) \( s_ell x \) . $ <scales:fields>]

 These fields satisfy the exact identities 
#[#set math.equation(numbering: n => "(3.4)")
 $ sigma_ell gt.eq 0 \, #h(2em) integral_(bb(R)^3) sigma_ell thin thin upright(d) x = lambda_ell \, #h(2em) F_ell = lambda_ell K - K * sigma_ell \,\
Delta F_ell = - 4 pi lambda_ell delta_0 + 4 pi sigma_ell \, $ <scales:mass-field>]

 and, simultaneously on $a_ell lt.eq \| x \| lt.eq q_ell$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ F_ell \( x \) lt.eq C_(upright("cap")) \| x \|^(- 4) \, #h(2em) \| sigma_ell \( x \) - k \( F_ell \( x \)_(+) \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\|] lt.eq q_ell^(- 8) \| x \|^(- 6) . $ <scales:band>]

 The scaled subsolution obeys, in distributions on $bb(R)^3$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ Delta U_ell gt.eq - 4 pi lambda_ell delta_0 + 4 pi upright(bold(1))_({ \| x \| < a_ell }) sigma_ell - 4 pi p_ell + upright(bold(1))_({ \| x \| gt.eq a_ell }) f \( U_ell \) \, $ <scales:invariant>]

 with 
#[#set math.equation(numbering: n => "(3.7)")
 $ B \| x \|^(- 4) (1 - frac(a_ell, 8 \| x \|)) lt.eq U_ell \( x \) lt.eq C_(upright("inv")) \| x \|^(- 4) #h(2em) \( \| x \| gt.eq a_ell \) \, $ <scales:barriers>]

 and 
#[#set math.equation(numbering: n => "(3.8)")
 $ p_ell gt.eq 0 \, #h(2em) "supp" p_ell subset { \| x \| lt.eq a_ell } \, #h(2em) integral_(bb(R)^3) p_ell thin thin upright(d) x lt.eq s_ell^3 . $ <scales:error>]

 For each finite system, $sigma_ell$ is a bounded smooth density, $p_ell$ is a bounded density, and both $F_ell - lambda_ell K$ and $U_ell - lambda_ell K$ extend continuously and locally Lipschitz through the origin. All these assertions hold for every datum in $G_ell$, so they may be used along arbitrary selections of retained data.]
] <scales:good>

Figure 1 distinguishes the physical radius $s_ell$ from the expanding annulus on which its rescaled fields are compared.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((2.8, 0.83), (8.1, 1.17), fill: rgb("#ebebff"), stroke: none)
  rect((2.8, -1.17), (8.1, -0.83), fill: rgb("#ebebff"), stroke: none)
  line((0.6, 1), (9, 1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0.6, -1), (9, -1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.45, 1), [#text(size: 9pt)[physical]], anchor: "east", padding: 0.1176cm)
  content((0.45, -1), [#text(size: 9pt)[rescaled]], anchor: "east", padding: 0.1176cm)
  line((1.2, 0.91), (1.2, 1.09), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.2, -1.09), (1.2, -0.91), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.8, 0.91), (2.8, 1.09), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.8, -1.09), (2.8, -0.91), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.3, 0.91), (5.3, 1.09), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.3, -1.09), (5.3, -0.91), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.1, 0.91), (8.1, 1.09), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.1, -1.09), (8.1, -0.91), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.2, 1.1), [#text(size: 9pt)[$r_0$]], anchor: "south", padding: 0.1176cm)
  content((2.8, 1.1), [#text(size: 9pt)[$r_(j_ ell )$]], anchor: "south", padding: 0.1176cm)
  content((5.3, 1.1), [#text(size: 9pt)[$s_ ell$]], anchor: "south", padding: 0.1176cm)
  content((8.1, 1.1), [#text(size: 9pt)[$q_ ell s_ ell$]], anchor: "south", padding: 0.1176cm)
  content((1.2, -1.1), [#text(size: 9pt)[$r_0"/"s_ ell$]], anchor: "north", padding: 0.1176cm)
  content((2.8, -1.1), [#text(size: 9pt)[$a_ ell asymp q_ ell^(-1)$]], anchor: "north", padding: 0.1176cm)
  content((5.3, -1.1), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((8.1, -1.1), [#text(size: 9pt)[$q_ ell$]], anchor: "north", padding: 0.1176cm)
  line((5.3, 0.65), (5.3, -0.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((5.3, 0.025), [#text(fill: rgb("#000000"))[#text(size: 9pt)[divide radii by $s_ ell$]]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The physical and rescaled radii in Proposition 5 (schematic, not to scale). The same observation index supplies both the comparison on the shaded annulus and the intermediate subsolution. Its rescaled inner radius tends to zero while the outer endpoint tends to infinity. ],
) <fig:scales>

#proof[
  #emph[Inverting the comparison.] We extract a density approximation from the inverse comparison (2.5). Fix an integer $q gt.eq 2$ and choose $h_h > C_(upright("cap")) + 1$. At a point in its comparison band, write
  $ v = \| y \|^4 H_j \( y \) \, #h(2em) t = (frac(\| y \|^6 mu_j \( y \), k))^(2 \/ 3) gt.eq 0 . $
  Choose $0 < h_l < h_h$ and $0 < xi < min { h_l \/ 16 \, 1 }$, to be decreased below. The cap and the high implication rule out $t gt.eq h_h$: taking heights increasing to $h_h$ would give $v gt.eq h_h - xi > C_(upright("cap"))$. If $h_l < t < h_h$, heights approaching $t$ from below and above give $\| v - t \| lt.eq xi$, and hence $\| v_(+) - t \| lt.eq xi$. If $t lt.eq h_l$, heights decreasing to $h_l$ in the low implication give $v lt.eq h_l + xi$. This last case includes $t = h_l$ and allows arbitrarily negative $v$; both $t$ and $v_(+)$ still lie in $\[ 0 \, h_l + xi \]$. Consequently
  $ k \| t^(3 \/ 2) - \( v_(+) \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\|] lt.eq cases(delim: "{", 3 / 2 k sqrt(h_h) thin xi \, & h_l < t < h_h \,, k \( h_l + xi \)^(3 \/ 2) \, & t lt.eq h_l .) $
  We may therefore choose $h_l = h_l \( q \)$ and $xi = xi \( q \)$ so that the right-hand side is at most $q^(- 8)$. These choices are fixed before the comparison’s smallness threshold for $s$ is imposed.
  #emph[Choosing the observation scale.] For this fixed $q$, take $L_1 = q^2$. The admissibility condition gives
  $ r_0 / s_ell = epsilon #scale(x: 120%, y: 120%)[\(] Z_ell s_ell^3 #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 3) arrow.r 0 . $
  Thus, for all sufficiently large $ell$, the largest dyadic radius not exceeding $s_ell \/ q$ has an index $j < J_ell$ and satisfies
  $ frac(s_ell, 2 q) lt.eq r_j lt.eq s_ell / q . $
  Here $j < J_ell$ follows from $r_(J_ell) > s_ell \/ 2$ and $q gt.eq 2$. Moreover $4 L_1 r_j gt.eq 2 q s_ell$, so the comparison covers the band $r_j lt.eq \| y \| lt.eq q s_ell$. The rescaled comparison band thus extends from a radius in $\[ 1 \/ \( 2 q \) \, 1 \/ q \]$ to $q$. On its event we have
  #[#set math.equation(numbering: n => "(3.9)")
   $ H_j \( y \) lt.eq C_(upright("cap")) \| y \|^(- 4) \, #h(2em) \| mu_j \( y \) - k \( H_j \( y \)_(+) \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\|] lt.eq q^(- 8) \| y \|^(- 6) quad \( r_j lt.eq \| y \| lt.eq q s_ell \) . $ <scales:physical-band>]
  The exceptional probability is at most $C_q s_ell^25$. The observations and master kernels in (2.2)–(2.3) are fixed independently of $L_1 \, h_l \, h_h \, xi$. Thus this new application of the comparison concerns exactly the same $mu_j \, H_j$ as the fixed-parameter barrier construction.
  #emph[Choosing the stages and retained data.] Choose strictly increasing stage indices $ell_q$ so that, for every $ell gt.eq ell_q$, all the preceding requirements for that fixed $q$ hold, including $C_q s_ell^25 lt.eq 1 \/ q$. On $ell_q lt.eq ell < ell_(q + 1)$ set $q_ell = q$, and choose the deterministic index $j_ell$ just described. Then $q_ell arrow.r oo$, (3.2) holds, and the comparison events have probability tending to one. No bound on the growth of $C_q$, or on the smallness thresholds as functions of $q$, is needed.
  For each system, first choose the conditional-integral versions of the fields. At each index $j$, fix an $cal(F)_j$-measurable full-measure set on which all its imported identities, regularity properties, and barrier inequalities hold. Spatial continuity and a countable dense family of distributional tests supply the continuum assertions; the finitely many such sets are fixed before any data are selected. Intersect the comparison event at $j_ell$ with its corresponding valid-data set and with
  $ {integral_(bb(R)^3) p_(j_ell) \( y \) thin thin upright(d) y lt.eq 1} . $
  Call the resulting event $G_ell$. The intermediate error estimate (2.6) and Markov’s inequality give
  $ bb(P) \( G_ell^c \) lt.eq 1 / q_ell + C #scale(x: 120%, y: 120%)[\(] s_ell^32 + s_ell^gamma #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  In particular the retained-data assertion is pointwise on specified valid versions, not an assertion left to an exceptional set after a datum is selected.
  #emph[Rescaling.] Each conditional density has mass $Z_ell$, and the Coulomb kernel has degree $- 1$, so (3.3) gives (3.4) exactly. The comparison (3.9) gives (3.5). Since $f \( s^4 u \) = s^6 f \( u \)$ for $s > 0$, rescaling the imported distributional subsolution inequality gives (3.6), with the barriers (3.7). The support scales to the ball of radius $a_ell$, and on $G_ell$
  $ integral_(bb(R)^3) p_ell \( x \) thin thin upright(d) x = s_ell^3 integral_(bb(R)^3) p_(j_ell) \( y \) thin thin upright(d) y lt.eq s_ell^3 \, $
  which proves (3.8). The finite-system regularity follows from the imported barrier regularity and the positive lower bound on packet widths. For the field remainder, a bounded integrable density has a locally Lipschitz Coulomb potential: near the singularity the kernels $\| z \|^(- 1)$ and $\| z \|^(- 2)$ are integrable in three dimensions, while away from it both kernels are bounded. This proves the remaining assertions. ◻
]

== 4 The unique neutral limiting profile <prof:section>

Fix one datum in each retained set $G_ell$ of Proposition 5. The resulting fields are deterministic; we use its notation and all its bounds below. In particular, $a_ell arrow.r 0$, $q_ell arrow.r oo$, and the exact neutral mass identity (3.4) holds, even though $lambda_ell = Z_ell s_ell^3 arrow.r oo$ by admissibility.

We first obtain compactness of the signed fields from neutrality (Lemma 6), then transfer the positive barrier (Lemma 7), and finally identify the limit by dilation (Lemma 8). We do not assume that $F_ell$ is pointwise nonnegative.

#thm([Lemma 4.1.])[
  (Compactness from the neutral spherical mean).  #emph[The sequence $\( F_ell \)$ is locally uniformly precompact on $bb(R)^3 \\ { 0 }$. Every locally uniform subsequential limit $F$ is locally Lipschitz and satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ Delta F = f \( F \) \, #h(2em) F \( x \) lt.eq C_(upright("cap")) \| x \|^(- 4) \, #h(2em) frac(1, 4 pi) integral_(bb(S)^2) F \( d omega \) thin thin upright(d) omega gt.eq 0 quad \( d > 0 \) . $ <prof:limit-equation>]

 Along the same subsequence, $sigma_ell arrow.r k \( F_(+) \)^(3 \/ 2)$ locally uniformly away from zero. Moreover, there is a constant $C_(*)$, depending only on $C_(upright("cap"))$ and $k$, such that 
#[#set math.equation(numbering: n => "(4.2)")
 $ \| F \( x \) \| lt.eq C_(*) \| x \|^(- 4) #h(2em) \( x eq.not 0 \) . $ <prof:absolute>]

 The family of dilates ${ D^4 F \( D thin dot.op \) : D > 0 }$ is also locally uniformly precompact away from zero.]
] <prof:compactness>

#proof[
  Newton’s spherical-average identity is
  $ frac(1, 4 pi) integral_(bb(S)^2) frac(thin upright(d) omega, \| d omega - z \|) = frac(1, max \( d \, \| z \| \)) . $
  It follows either by direct integration in the angle with $z$, or by the mean-value property inside and outside the sphere. Applying it to (3.4) and using the exact equality of the nuclear coefficient and total density mass gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ overline(F)_ell \( d \) := frac(1, 4 pi) integral_(bb(S)^2) F_ell \( d omega \) thin thin upright(d) omega = integral_(\| z \| > d) (1 / d - frac(1, \| z \|)) sigma_ell \( z \) thin thin upright(d) z gt.eq 0 . $ <prof:mean>]
  All these integrals are finite for each $ell$. No upper bound on $lambda_ell$ is needed.
  Fix an annulus $alpha lt.eq \| x \| lt.eq beta$ with $0 < alpha < beta < oo$. For large $ell$, it lies in the band of (3.5). The cap and (4.3) imply, for every radius in this annulus,
  #[#set math.equation(numbering: n => "(4.4)")
   $ integral_(bb(S)^2) \| F_ell \( d omega \) \| thin thin upright(d) omega = 2 integral_(bb(S)^2) \( F_ell \( d omega \) \)_(+) thin thin upright(d) omega - integral_(bb(S)^2) F_ell \( d omega \) thin thin upright(d) omega lt.eq 8 pi C_(upright("cap")) d^(- 4) . $ <prof:sphere-lone>]
  Radial integration therefore bounds the full $L^1$ norm of $F_ell$ on the annulus. Equation (3.5) also bounds $sigma_ell$ uniformly there.
  Here is the local estimate we shall use twice. Take a ball $Q$ whose closure stays away from zero, and a larger fixed annulus containing its closure. The localized potential
  $ P_ell = K * \( sigma_ell upright(bold(1))_Q \) $
  has uniformly bounded values and first derivatives: this follows from the density bound and the integrability of $\| z \|^(- 1)$ and $\| z \|^(- 2)$ on bounded subsets of $bb(R)^3$. Since $Delta F_ell = 4 pi sigma_ell$ on $Q$, the function $h_ell = F_ell + P_ell$ is distributionally harmonic there. Its $L^1 \( Q \)$ norm is bounded by (4.4) and the bound on $P_ell$. On every smaller concentric ball, harmonic interior estimates bound $h_ell$ and its gradient by this $L^1$ norm. For completeness, convolution with a fixed smooth radial averaging kernel reproduces a harmonic function in the interior; differentiating that convolution gives these bounds. The same argument applies to continuous distributionally harmonic functions, by first mollifying on interior sets. Subtracting $P_ell$ gives uniform local value and Lipschitz bounds for $F_ell$.
  A covering by such balls, followed by a diagonal Arzelà–Ascoli argument, gives local uniform precompactness and a locally Lipschitz limit. The error in (3.5) tends uniformly to zero on every fixed compact annulus, so $sigma_ell arrow.r k \( F_(+) \)^(3 \/ 2)$ there. Passing to distributions, to the cap, and to the spherical averages proves (4.1).
  To compare with $U_ell$ on large spheres, we next strengthen the one-sided cap to an absolute bound for $F$. For $D > 0$ set $F^(\( D \)) \( x \) = D^4 F \( D x \)$. The equation, cap, and nonnegative spherical means in (4.1) are invariant under this dilation. In particular, on a fixed annulus the same argument as in (4.4) bounds the $L^1$ norm of every $F^(\( D \))$, while the source $k \( F_(+)^(\( D \)) \)^(3 \/ 2)$ is uniformly bounded by the cap. The local estimate just proved is therefore uniform in $D$. It yields both precompactness of the dilates and a uniform bound $\| F^(\( D \)) \( omega \) \| lt.eq C_(*)$ for $\| omega \| = 1$. Writing $x = D omega$ proves (4.2). ◻
]

#thm([Lemma 4.2.])[
  (Transfer of the positive barrier).  #emph[Every limit $F$ in Lemma 6 satisfies 
#[#set math.equation(numbering: n => "(4.5)")
 $ B \| x \|^(- 4) lt.eq F \( x \) lt.eq C_(upright("cap")) \| x \|^(- 4) #h(2em) \( x eq.not 0 \) . $ <prof:positive>]

]
] <prof:lower>

#proof[
  We compare the barrier and the screened field on a fixed ball after subtracting a Coulomb correction that vanishes away from the origin. Work along the subsequence converging to $F$. Fix $S > 0$; eventually $a_ell < S < q_ell$. Define
  #[#set math.equation(numbering: n => "(4.6)")
   $ e_ell \( x \) = q_ell^(- 8) \| x \|^(- 6) upright(bold(1))_({ a_ell lt.eq \| x \| lt.eq S }) \, #h(2em) L_ell = K * \( p_ell + e_ell \) gt.eq 0 . $ <prof:correction>]
  Subtracting the Poisson equation for $F_ell$ from (3.6) cancels the nucleus and the entire inner density source. Since $4 pi sigma_ell lt.eq f \( F_ell \) + 4 pi e_ell$ on $a_ell lt.eq \| x \| < S$ and $Delta \( - L_ell \) = 4 pi \( p_ell + e_ell \)$, the result is
  #[#set math.equation(numbering: n => "(4.7)")
   $ Delta \( U_ell - F_ell - L_ell \) gt.eq upright(bold(1))_({ \| x \| gt.eq a_ell }) #scale(x: 120%, y: 120%)[\(] f \( U_ell \) - f \( F_ell \) #scale(x: 120%, y: 120%)[\)] quad upright("in ") B \( 0 \, S \) . $ <prof:comparison-inequality>]
  This is an inequality on the whole ball, including the origin and the sphere $\| x \| = a_ell$; no restriction or differentiation across an interface has been made.
  Put
  $ c_S = \( C_(upright("inv")) + C_(*) + 1 \) S^(- 4) . $
  Uniform convergence on $\| x \| = S$, the bound (4.2), the upper barrier in (3.7), and $L_ell gt.eq 0$ give, for large $ell$,
  $ U_ell - F_ell - L_ell < c_S #h(2em) upright("on ") \| x \| = S . $
  We justify the comparison throughout the ball. The difference
  $ W_ell = U_ell - F_ell - L_ell - c_S = \( U_ell - lambda_ell K \) + K * sigma_ell - L_ell - c_S $
  extends continuously and locally in $H^1$ across zero. Indeed, the first term is locally Lipschitz by hypothesis. The other potentials have bounded integrable densities for each fixed $ell$, and thus locally bounded gradients. In the case of $L_ell$ the density is also compactly supported. These bounds need not be uniform in $ell$.
  The strict boundary inequality implies that $\( W_ell \)_(+)$ has compact support in $B \( 0 \, S \)$ and belongs to $H_0^1 \( B \( 0 \, S \) \)$. It may therefore be used in (4.7), by approximation with nonnegative smooth tests in $H^1$. The right side is bounded on this fixed ball for this fixed $ell$, since its reaction is cut off at the positive radius $a_ell$. On the positive set of $W_ell$ outside that radius, we have $U_ell > F_ell$, because $L_ell + c_S > 0$. Monotonicity of $f$ consequently gives
  $ - integral_(B \( 0 \, S \)) \| nabla \( W_ell \)_(+) \|^2 thin thin upright(d) x gt.eq integral_(B \( 0 \, S \)) upright(bold(1))_({ \| x \| gt.eq a_ell }) #scale(x: 120%, y: 120%)[\(] f \( U_ell \) - f \( F_ell \) #scale(x: 120%, y: 120%)[\)] \( W_ell \)_(+) thin thin upright(d) x gt.eq 0 . $
  It follows that $\( W_ell \)_(+) = 0$, or equivalently
  #[#set math.equation(numbering: n => "(4.8)")
   $ U_ell lt.eq F_ell + L_ell + c_S #h(2em) upright("in ") B \( 0 \, S \) . $ <prof:comparison>]
  For each fixed $x$ with $0 < \| x \| < S$, we next show that $L_ell \( x \) arrow.r 0$. For large $ell$, the support and mass bound in (3.8) imply
  $ \( K * p_ell \) \( x \) lt.eq frac(2 s_ell^3, \| x \|) arrow.r 0 . $
  The other source has small total mass:
  $ integral e_ell thin thin upright(d) x = frac(4 pi, 3) q_ell^(- 8) \( a_ell^(- 3) - S^(- 3) \) lt.eq frac(32 pi, 3) q_ell^(- 5) arrow.r 0 . $
  On the fixed ball $B \( x \, \| x \| \/ 4 \)$ its density is at most $C_x q_ell^(- 8)$. Integrability of the Coulomb kernel bounds its potential contribution there by $C_x q_ell^(- 8)$; on the complement the kernel is at most $4 \/ \| x \|$, so the contribution is at most $\( 4 \/ \| x \| \) integral e_ell$. Hence $L_ell \( x \) arrow.r 0$.
  Now (4.8) and the lower barrier give
  $ F \( x \) + c_S gt.eq B \| x \|^(- 4) . $
  The argument holds for every fixed $S > \| x \|$ along the same convergent subsequence. Letting $S arrow.r oo$ proves the lower bound in (4.5); the upper bound was already known. ◻
]

The next rigidity statement also follows from Solovej’s nonradial Sommerfeld estimate [7] Lemma 4.4 and Remark 4.5: in that estimate, take inner radius zero and use the positive two-sided $\| x \|^(- 4)$ bounds. We retain a direct dilation proof to make the precise compactness and contact argument explicit.

#thm([Lemma 4.3.])[
  (Rigidity of a positive comparable profile).  #emph[Let $F$ be a continuous distributional solution of $Delta F = 4 pi k F^(3 \/ 2)$ on $bb(R)^3 \\ { 0 }$, and suppose 
$ B \| x \|^(- 4) lt.eq F \( x \) lt.eq C \| x \|^(- 4) #h(2em) \( x eq.not 0 \) $

 for constants $0 < B lt.eq C < oo$. Then 
#[#set math.equation(numbering: n => "(4.9)")
 $ F \( x \) = A_(*) \| x \|^(- 4) \, #h(2em) A_(*) = (frac(12, 4 pi k))^2 = frac(81 pi^2, 8) . $ <prof:homogeneous>]

 No radiality assumption is required.]
] <prof:rigidity>

#proof[
  The local potential and harmonic estimates in Lemma 6 apply uniformly to the dilates $F^(\( D \)) \( x \) = D^4 F \( D x \)$: their values and their sources are bounded on every fixed compact annulus. Thus the dilates are locally uniformly precompact, with locally Lipschitz limits satisfying the same equation.
  Write
  $ b = sup_(x eq.not 0) \| x \|^4 F \( x \) \, #h(2em) h = inf_(x eq.not 0) \| x \|^4 F \( x \) \, #h(2em) 0 < h lt.eq b < oo . $
  Choose $x_n$ with $\| x_n \|^4 F \( x_n \) arrow.r b$, and let $D_n = \| x_n \|$, $omega_n = x_n \/ \| x_n \|$. After passing to a subsequence, $F^(\( D_n \)) arrow.r v$ locally uniformly and $omega_n arrow.r omega in bb(S)^2$. Local equicontinuity gives
  $ v \( x \) lt.eq b \| x \|^(- 4) quad \( x eq.not 0 \) \, #h(2em) v \( omega \) = b . $
  The equation passes to the limit because its reaction is continuous and locally uniformly bounded. Since $Delta \| x \|^(- 4) = 12 \| x \|^(- 6)$ in three dimensions, this contact implies
  #[#set math.equation(numbering: n => "(4.10)")
   $ 4 pi k b^(3 \/ 2) lt.eq 12 b . $ <prof:upper-contact>]
  Here is a weak proof of the contact assertion. If the inequality failed, the continuous function $g = v - b \| x \|^(- 4)$ would satisfy $g lt.eq 0$, $g \( omega \) = 0$, and $Delta g gt.eq delta > 0$ on a sufficiently small ball about $omega$. For $0 < eta < delta \/ 6$, the function $g - eta \| x - omega \|^2$ is weakly subharmonic there, equals zero at the center, and is strictly negative on the boundary. Choose a level strictly between its boundary maximum and zero. Testing its Laplacian with the positive part above that level, as in the proof of Lemma 7, contradicts the value at the center. This proves (4.10) without a classical second derivative assumption.
  Dilating instead along points approaching the infimum gives a limit $v gt.eq h \| x \|^(- 4)$ with equality at a unit point. If $4 pi k h^(3 \/ 2) < 12 h$, the same argument applies to $h \| x \|^(- 4) - v$, whose Laplacian is then strictly positive near its zero maximum. Consequently
  $ 4 pi k h^(3 \/ 2) gt.eq 12 h . $
  Together with (4.10), this gives $b lt.eq A_(*) lt.eq h$. Since $h lt.eq b$, both extrema equal $A_(*)$, proving (4.9). The argument allows $D_n$ to tend to zero, to infinity, or to neither; no extremum of the original field had to be attained. ◻
]

#thm([Proposition 4.4.])[
  (Convergence of the selected fields).  #emph[For every choice of one retained datum at each index, 
$ F_ell \( x \) arrow.r A_(*) \| x \|^(- 4) \, #h(2em) sigma_ell \( x \) arrow.r rho_(*) \( x \) := k A_(*)^(3 \/ 2) \| x \|^(- 6) $

 locally uniformly on $bb(R)^3 \\ { 0 }$.]
] <prof:limit>

#proof[
  Lemma 6 gives a locally uniformly convergent subsequence of every subsequence. Its limit satisfies the positive bounds of Lemma 7, so Lemma 8 identifies it as $A_(*) \| x \|^(- 4)$. Uniqueness of every subsequential limit proves convergence of the full sequence. The density convergence follows from (3.5). ◻
]

#thm([Corollary 4.5.])[
  (Uniformity on the retained data).  #emph[For each fixed compact annulus $cal(A) subset bb(R)^3 \\ { 0 }$, 
$ sup_(theta in G_ell) ∥sigma_ell \( theta \, thin dot.op \) - rho_(*)∥_(C \( cal(A) \)) arrow.r 0 . $

 The corresponding assertion holds for $F_ell \( theta \, thin dot.op \) - A_(*) \| dot.op \|^(- 4)$.]
] <prof:uniform>

#proof[
  If either assertion failed, there would be a positive discrepancy along a subsequence and a choice of one datum from each corresponding $G_ell$ realizing at least half that discrepancy. Those selected fields satisfy all the same deterministic hypotheses, contradicting Proposition 9. This argument uses no measurable selection: uniformity is a deterministic assertion about all the retained data, after the conditional versions have been fixed. ◻
]

== 5 Expected electron tails and the radius limits <sec:tails>

Fix any admissible sequence from (3.1), with arbitrary normalized neutral ground states $Psi_ell$ at charges $Z_ell$. Use the indices $j_ell$ and retained events $G_ell$ of Proposition 5. Throughout this section, $sigma_ell$ is the conditional-integral version from (3.3) on the full data space, and expectations are taken under the original enlarged law. Thus $bb(P) \( G_ell \) arrow.r 1$, and Corollary 10 gives uniform convergence of $sigma_ell$ to

$ rho_(*) \( x \) = k A_(*)^(3 \/ 2) \| x \|^(- 6) $

on each fixed compact annulus, uniformly over the data in $G_ell$. We now pass from these conditional densities to expected counts of raw electron positions. Every fixed sphere has zero expected raw count, since each one-electron marginal is absolutely continuous.

For $0 < a < b < oo$, write

$ cal(A) \( a \, b \) = { x : a < \| x \| < b } \, #h(2em) N_ell \( a \, b \) = \# { i : a s_ell < \| x_i \| < b s_ell } \, $

and let

$ P_ell \( a \, b \) = sum_(i = 1)^(Z_ell) integral_(s_ell cal(A) \( a \, b \)) cal(K)_(x_i) \( y \) thin upright(d) y $

be the mass of the smoothing packets in the same physical annulus. The packets and their widths are those of (2.3) for the $ell$th system. Conditional integration and a change of variables give

#[#set math.equation(numbering: n => "(5.1)")
 $ integral_(cal(A) \( a \, b \)) sigma_ell \( x \) thin upright(d) x = s_ell^3 bb(E) #scale(x: 120%, y: 120%)[\[] P_ell \( a \, b \) divides cal(F)_(j_ell) #scale(x: 120%, y: 120%)[\]] . $ <tail:conditional-mass>]

#thm([Lemma 5.1.])[
  (Packet supports).  #emph[For each fixed $0 < a < b < oo$, all sufficiently large $ell$ satisfy 
#[#set math.equation(numbering: n => "(5.2)")
 $ P_ell \( a \, b \) lt.eq N_ell \( a \/ 2 \, 2 b \) $ <tail:localization>]

 for every raw configuration. Moreover, for every fixed $0 < eta < min { a \, \( b - a \) \/ 2 }$, all sufficiently large $ell$ satisfy 
#[#set math.equation(numbering: n => "(5.3)")
 $ P_ell \( a + eta \, b - eta \) lt.eq N_ell \( a \, b \) lt.eq P_ell \( a - eta \, b + eta \) $ <tail:sandwich>]

 for every raw configuration.]
] <tail:packets>

#proof[
  Abbreviate $s = s_ell$ and $r_0 = epsilon Z_ell^(- 1 \/ 3)$, and set $delta_s = c_1 s^w arrow.r 0$. If a packet centered at $z$ has $\| z \| gt.eq r_0$, then its width obeys $t_z lt.eq delta_s \| z \|$. Consequently
  #[#set math.equation(numbering: n => "(5.4)")
   $ cal(K)_z \( y \) eq.not 0 quad arrow.r.double quad \( 1 - delta_s \) \| z \| lt.eq \| y \| lt.eq \( 1 + delta_s \) \| z \| . $ <tail:relative-support>]
  This estimate holds also for arbitrarily distant centers. If instead $\| z \| < r_0$, its packet is contained in the ball of radius
  $ r_0 + c_1 r_0^(1 + w) = o \( s \) \, $
  because $r_0 \/ s = epsilon \( Z_ell s_ell^3 \)^(- 1 \/ 3) arrow.r 0$. Such packets therefore cannot meet any fixed annulus $s cal(A) \( a \, b \)$ for large $ell$. For the remaining packets, (5.4) shows that a packet meeting this annulus has center in $s cal(A) \( a \/ 2 \, 2 b \)$ once $delta_s$ is small. Each packet has mass one, proving (5.2).
  The same inequalities show that every packet meeting the contracted annulus $s cal(A) \( a + eta \, b - eta \)$ has its center in $s cal(A) \( a \, b \)$. Conversely, every packet whose center lies in $s cal(A) \( a \, b \)$ is entirely contained in the enlarged annulus $s cal(A) \( a - eta \, b + eta \)$. For example, $delta_s < eta \/ b$ suffices for these inclusions once the clamped packets have been excluded. Summing the mass-one packets proves both inequalities in (5.3). ◻
]

#thm([Lemma 5.2.])[
  (Expected annular mass).  #emph[For every fixed $0 < a < b < oo$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ bb(E) integral_(cal(A) \( a \, b \)) sigma_ell \( x \) thin upright(d) x & arrow.r integral_(cal(A) \( a \, b \)) rho_(*) \( x \) thin upright(d) x \,\
s_ell^3 bb(E) N_ell \( a \, b \) & arrow.r integral_(cal(A) \( a \, b \)) rho_(*) \( x \) thin upright(d) x . $ <tail:smoothed-annulus>]

]
] <tail:annular>

#proof[
  Put $Y_ell = integral_(cal(A) \( a \, b \)) sigma_ell$ and $X_ell = N_ell \( a \/ 2 \, 2 b \)$. Equations (5.1) and (5.2), followed by conditional Jensen, give
  $ 0 lt.eq Y_ell lt.eq s_ell^3 bb(E) \[ X_ell divides cal(F)_(j_ell) \] \, #h(2em) parallel Y_ell parallel_2 lt.eq s_ell^3 parallel X_ell parallel_2 . $
  The annular count bound (2.1), with the common offset $D_0$ and $s_ell < 1$, therefore yields
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel Y_ell parallel_2 lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + sqrt(D_0) thin s_ell^(7 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq C' . $ <tail:uniform-integrability>]
  In particular, for the actual complement of the retained event,
  $ bb(E) #scale(x: 120%, y: 120%)[\[] Y_ell upright(bold(1))_(G_ell^c) #scale(x: 120%, y: 120%)[\]] lt.eq C' bb(P) \( G_ell^c \)^(1 \/ 2) arrow.r 0 . $
  No independence of $G_ell$ from the conditional fields is required. On $G_ell$, Corollary 10 implies that $Y_ell$ converges to $integral_(cal(A) \( a \, b \)) rho_(*)$ uniformly over all retained data. Since $bb(P) \( G_ell \) arrow.r 1$, this proves (5.5).
  Taking expectations in (5.1) gives $bb(E) Y_ell = s_ell^3 bb(E) P_ell \( a \, b \)$. Apply (5.5) to the contracted and enlarged annuli in (5.3). It follows that
  $ integral_(cal(A) \( a + eta \, b - eta \)) rho_(*) & lt.eq liminf_(ell arrow.r oo) s_ell^3 bb(E) N_ell \( a \, b \)\
 & lt.eq limsup_(ell arrow.r oo) s_ell^3 bb(E) N_ell \( a \, b \) lt.eq integral_(cal(A) \( a - eta \, b + eta \)) rho_(*) . $
  Letting $eta arrow.b 0$ proves (5.5), because $rho_(*)$ is continuous and integrable on a neighborhood of the fixed closed annulus. ◻
]

#thm([Lemma 5.3.])[
  (Exterior tightness).  #emph[There is a constant $C$, independent of the fixed number $M > 0$, such that every admissible sequence satisfies 
#[#set math.equation(numbering: n => "(5.7)")
 $ limsup_(ell arrow.r oo) s_ell^3 bb(E) \# { i : \| x_i \| > M s_ell } lt.eq C M^(- 3) . $ <tail:tightness-bound>]

]
] <tail:tightness>

#proof[
  For fixed $M$, eventually $M s_ell < 1$. Cover the region between $M s_ell$ and $1$ by shells $u < \| x \| < 2 u$, with $u = 2^p M s_ell < 1$ and $p = 0 \, 1 \, dots.h$. The annular bound (2.1), applied with the fixed shape $\( 1 \, 2 \)$, gives
  $ bb(E) \# { i : u < \| x_i \| < 2 u } lt.eq C #scale(x: 120%, y: 120%)[\(] u^(- 3) + sqrt(D_0 u) #scale(x: 120%, y: 120%)[\)] lt.eq C_D u^(- 3) #h(2em) \( 0 < u < 1 \) . $
  The expected raw mass outside radius $1$ is bounded by the other estimate in (2.1). Summing the geometric series, and allowing the last shell to overlap this exterior region, gives
  $ s_ell^3 bb(E) \# { i : \| x_i \| > M s_ell } lt.eq C_D M^(- 3) sum_(p = 0)^oo 2^(- 3 p) + C s_ell^3 . $
  The constants depend only on the fixed count estimates and $D_0$; they do not depend on $M$. Taking the upper limit proves the claim. ◻
]

#thm([Theorem 5.4.])[
  (Expected exterior asymptotic).  #emph[Along every admissible sequence, with arbitrary normalized neutral ground states, for each fixed $a > 0$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ s_ell^3 integral_(\| y \| > a s_ell) rho_(Psi_ell) \( y \) thin upright(d) y arrow.r b_(upright("TF"))^3 / a^3 . $ <tail:asymptotic-equation>]

]
] <tail:asymptotic>

#proof[
  Fix $M > a$. Lemma 12 gives convergence on $cal(A) \( a \, M \)$, whereas Lemma 13 bounds the remaining exterior mass after rescaling by $C M^(- 3)$. Thus, with $T_ell \( r \) = integral_(\| y \| > r) rho_(Psi_ell) \( y \) thin upright(d) y$,
  $ liminf_(ell arrow.r oo) s_ell^3 T_ell \( a s_ell \) & gt.eq integral_(cal(A) \( a \, M \)) rho_(*) \,\
limsup_(ell arrow.r oo) s_ell^3 T_ell \( a s_ell \) & lt.eq integral_(cal(A) \( a \, M \)) rho_(*) + C M^(- 3) . $
  Let $M arrow.r oo$. The limiting density is integrable outside every positive radius, and
  $ integral_(\| x \| > a) rho_(*) \( x \) thin upright(d) x = frac(4 pi k A_(*)^(3 \/ 2), 3 a^3) = frac(4 A_(*), a^3) = b_(upright("TF"))^3 / a^3 \, $
  using $4 pi k A_(*)^(1 \/ 2) = 12$ and $4 A_(*) = 81 pi^2 \/ 2$. This proves (5.8). ◻
]

#proof[
  For each sufficiently large integer $m$, put $s = m^(- 1 \/ 3)$ and choose a finite integer
  $ Z_min \( m \) gt.eq max { m + 1 \, thin Z_(upright("bar")) \( m^(- 1 \/ 3) \) \, thin m^(4 \/ 3) } . $
  The barrier threshold is uniform over normalized ground states. Consequently every sequence with $m arrow.r oo$ and $Z gt.eq Z_min \( m \)$ is admissible: in particular, $Z s^3 gt.eq m^(1 \/ 3) arrow.r oo$.
  Fix $0 < a_(-) < b_(upright("TF")) < a_(+)$. We claim that, for all sufficiently large integers $m$, all integers $Z gt.eq Z_min \( m \)$, and every normalized neutral ground state $Psi$ of charge $Z$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ integral_(\| y \| > a_(-) m^(- 1 \/ 3)) rho_Psi \( y \) thin upright(d) y > m \, #h(2em) integral_(\| y \| > a_(+) m^(- 1 \/ 3)) rho_Psi \( y \) thin upright(d) y < m . $ <tail:strict-bracket>]
  Otherwise choose strictly increasing violating integers $m_ell$, charges $Z_ell gt.eq Z_min \( m_ell \)$, and corresponding ground states $Psi_ell$. With $s_ell = m_ell^(- 1 \/ 3)$ this is an admissible sequence. Theorem 14, applied separately at $a_(-)$ and $a_(+)$, gives normalized tail limits $b_(upright("TF"))^3 \/ a_(-)^3 > 1$ and $b_(upright("TF"))^3 \/ a_(+)^3 < 1$. Hence both inequalities in (5.9) eventually hold on this sequence, a contradiction. This argument includes arbitrary choices of the ground states at the selected charges.
  The tail mass is nonincreasing in its radius and tends to zero, so the set defining $R_m \( Psi \)$ is nonempty. The first inequality in (5.9) excludes every radius at most $a_(-) m^(- 1 \/ 3)$ from that set; the second places $a_(+) m^(- 1 \/ 3)$ in the set. Thus
  #[#set math.equation(numbering: n => "(5.10)")
   $ a_(-) lt.eq m^(1 \/ 3) R_m \( Psi \) lt.eq a_(+) $ <tail:radius-bracket>]
  for all the states and charges just specified.
  Now fix any family $\( Psi_Z \)_(Z gt.eq 1)$ of normalized neutral ground states. For each fixed sufficiently large integer $m$, removing the finite prefix $Z < Z_min \( m \)$ changes neither the inner upper limit nor the inner lower limit. Both
  $ m^(1 \/ 3) limsup_(Z arrow.r oo\
Z > m) R_m \( Psi_Z \) quad upright("and") quad m^(1 \/ 3) liminf_(Z arrow.r oo\
Z > m) R_m \( Psi_Z \) $
  therefore lie between $a_(-)$ and $a_(+)$. Finally let $m arrow.r oo$ and squeeze with arbitrary $a_(-) < b_(upright("TF")) < a_(+)$. This proves both asserted limits. No convergence in $Z$ at fixed $m$ is used. ◻
]

== 6 Foundation providers and parameter choices <sec:interface>

Section 2 states the complete hypotheses used in this article. Their proofs are in the separate foundation companion #emph[Uniform excess charge for Coulomb molecules and the outer radius of neutral atoms] [5]. This appendix identifies the provider results and explains the compatibility of their parameter choices. All inputs use two spin states, kinetic operator $- Delta \/ 2$, and the constants in (1.5).

===== 6.1 States and raw counts. <states-and-raw-counts.>

Ground-state existence comes from Lemma 2.5 of [5], and sector monotonicity from Lemma 2.1; the bounded neutral offset uses Proposition 12.3. The annular $L^2$ bound in 2 is Corollary 4.9, and the unit-radius exterior bound follows from Lemma 12.2 with $t = 4$ and exactly $Z$ electrons. These inputs apply uniformly to every normalized neutral ground state, not only to a selected family of states.

===== 6.2 Common observations and conditional versions. <common-observations-and-conditional-versions.>

Lemma 5.1 and Section 10.1 of [5] supply the observation law and likelihood-integral versions used in (2.2)–(2.4). In particular, the same master packets define all the conditional densities. Their exact mass, Poisson and tower identities and finite-system regularity hold on fixed full-measure sets. The derivative and local Lipschitz bounds need not be uniform in $Z$.

===== 6.3 Comparison and intermediate subsolutions. <comparison-and-intermediate-subsolutions.>

Proposition 10.1 of [5] supplies 3: arbitrary fixed annular width and accuracy, a universal upper cap, and an exceptional probability of order $r_j^25$. Proposition 11.2 supplies 4 at every intermediate index, with constants independent of the number of scales. Its expected error bound controls every prefix, as explained after (2.6). At the terminal index the sigma-field is trivial, so the same bound is deterministic. The almost-sure subsolution assertions do not make the comparison event a full-measure event.

===== 6.4 Order of choices. <order-of-choices.>

First fix the kernel and propagation constants, including $epsilon$ and the positive barrier coefficient $B$. Then fix a requested comparison band and accuracy, make $s$ sufficiently small for that comparison and the fixed barrier construction, and take $Z$ above the finite threshold $Z_(upright("bar")) \( s \)$. This threshold includes $Z gt.eq Z_0$ and $2 epsilon Z^(- 1 \/ 3) lt.eq s$. Changing $L_1 \, h_l \, h_h \, xi$ changes the comparison event and its smallness requirement, not the observations, packets, conditional fields, or fixed barrier construction.

These two uniformities serve different purposes. The common fields allow Section 3 to improve the comparison accuracy along a slow diagonal while retaining the same subsolutions. Uniformity in the neutral ground state allows Section 5 to turn the result along every admissible sequence into a finite-charge threshold valid for all such states. No rate of growth for $Z_(upright("bar")) \( s \)$ is asserted or used.

#heading(level: 1)[References]
#bibitem([1])[R.~L.~Frank, P.~T.~Nam, and H.~Van Den Bosch, #emph[The ionization conjecture in Thomas--Fermi--Dirac--von Weizsäcker theory], Communications on Pure and Applied Mathematics #strong[71] (2018), no.~3, 577--614. #link("https://doi.org/10.1002/cpa.21717")[doi:10.1002/cpa.21717]. Also #link("https://arxiv.org/abs/1606.07355")[arXiv:1606.07355].]
#bibitem([2])[C.~Kehle, #emph[The maximal excess charge for a family of density-matrix-functional theories including Hartree--Fock and Müller theories], Journal of Mathematical Physics #strong[58] (2017), no.~1, 011901. #link("https://doi.org/10.1063/1.4973850")[doi:10.1063/1.4973850]. Also #link("https://arxiv.org/abs/1609.06272")[arXiv:1609.06272].]
#bibitem([3])[E.~H.~Lieb and B.~Simon, #emph[The Thomas--Fermi theory of atoms, molecules and solids], Advances in Mathematics #strong[23] (1977), no.~1, 22--116. #link("https://doi.org/10.1016/0001-8708(77)90108-6")[doi:10.1016/0001-8708(77)90108-6].]
#bibitem([4])[OpenAI, #emph[Generalized ionization energies for full Coulomb atoms], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Generalized-ionization-energies-for-full-Coulomb-atoms-September-24-2026/paper.pdf")[OAI:Generalized-ionization-energies-for-full-Coulomb-atoms-September-24-2026], 2026.]
#bibitem([5])[OpenAI, #emph[Uniform excess charge for Coulomb molecules and the outer radius of neutral atoms], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Uniform-excess-charge-for-Coulomb-molecules-and-the-outer-radius-of-neutral-atoms-September-24-2026/paper.pdf")[OAI:Uniform-excess-charge-for-Coulomb-molecules-and-the-outer-radius-of-neutral-atoms-September-24-2026], 2026.]
#bibitem([6])[L.~A.~Seco, I.~M.~Sigal, and J.~P.~Solovej, #emph[Bound on the ionization energy of large atoms], Communications in Mathematical Physics #strong[131] (1990), no.~2, 307--315. #link("https://doi.org/10.1007/BF02161416")[doi:10.1007/BF02161416].]
#bibitem([7])[J.~P.~Solovej, #emph[The ionization conjecture in Hartree--Fock theory], Annals of Mathematics (2) #strong[158] (2003), no.~2, 509--576. #link("https://doi.org/10.4007/annals.2003.158.509")[doi:10.4007/annals.2003.158.509].]
#bibitem([8])[J.~P.~Solovej, #emph[A new look at Thomas--Fermi theory], Molecular Physics #strong[114] (2016), nos.~7--8, 1036--1040. #link("https://doi.org/10.1080/00268976.2015.1130273")[doi:10.1080/00268976.2015.1130273]. Also #link("https://arxiv.org/abs/1601.00497")[arXiv:1601.00497].]


