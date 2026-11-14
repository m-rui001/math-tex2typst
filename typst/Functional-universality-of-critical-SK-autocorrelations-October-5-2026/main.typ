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

#align(center)[#text(size: 16pt, weight: "bold")[Functional universality of critical SK autocorrelations]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The equilibrium spin autocorrelation measures how much a system remembers its initial configuration after
  averaging over its stationary dynamics. At the critical temperature of the Sherrington–Kirkpatrick model,
  this memory lives on a time scale that diverges with the number of spins.
  We determine its limiting random function and prove that Gaussian and Rademacher interactions give the same law
  on the stated clock.

=== 1.1 Model and result <model-and-result>

Let $D$ be either the standard Gaussian distribution or the uniform distribution on ${ - 1 \, 1 }$.
  For $n gt.eq 2$, let $\( J_(i j) \)_(i < j)$ be independent with law $D$, put $J_(j i) = J_(i j)$ and $J_(i i) =
  0$, and define

#[#set math.equation(numbering: n => "(1.1)")
 $ pi_(n \, J) \( sigma \) = 1 / Z_(n \, J) exp (1 / sqrt(n) sum_(i < j) J_(i j) sigma_i sigma_j) \, wide
   sigma in { - 1 \, 1 }^n . $ <eq:intro-gibbs>]

This is the zero-field model at inverse temperature one. Each site has an independent rate-one clock.
  When the clock at site $i$ rings, its spin is resampled from its conditional law under $pi_(n \, J)$:

$ bb(P) { sigma_i arrow.l a divides sigma_(- i) } = frac(exp \( a h_i \( sigma \) \), 2 cosh h_i \( sigma \)) \,
  wide h_i \( sigma \) = 1 / sqrt(n) sum_(j eq.not i) J_(i j) sigma_j . $

One unit of this clock contains $n$ site updates on average. Write $P_t^J$ for this reversible semigroup.
  Its stationary spin autocorrelation and its critical rescaling are

#[#set math.equation(numbering: n => "(1.2)")
 $ C_(n \, J) \( t \) & = 1 / n sum_(i = 1)^n chevron.l sigma_i \, P_t^J sigma_i chevron.r_(pi_(n \, J)) \,\
A_(n \, J) \( s \) & = n^(1 \/ 3) C_(n \, J) \( s n^(2 \/ 3) \) \, wide s > 0 . $ <eq:intro-correlation>]

Thermal fluctuations and the randomness of the dynamics have already been averaged in these quantities.
  Their only remaining randomness is the interaction matrix.

Let $C_(upright("loc")) \( \( 0 \, oo \) \)$ denote the continuous real functions,
  with uniform convergence on every compact subinterval of $\( 0 \, oo \)$.

#thm([Theorem 1.1.])[
  (Functional universality).  #emph[There is a Borel probability law $Q_(upright("crit"))$ on
    $C_(upright("loc")) \( \( 0 \, oo \) \)$ such that, for each of the two choices of $D$,
$ "Law"_D \( A_(n \, J) \) arrow.r.double Q_(upright("crit")) wide \( n arrow.r oo \) . $

 The law $Q_(upright("crit"))$ is not a point mass. It assigns probability one to nonzero, nonnegative,
   nonincreasing functions $f$ satisfying $lim_(s arrow.r oo) f \( s \) = 0$.
   The Gaussian and Rademacher models use exactly the normalization in (1.2).]
] <thm:main>

The restriction to positive times is necessary: $A_(n \, J) \( 0 \) = n^(1 \/ 3)$.
  At every fixed positive time, the limiting value has unbounded support, as proved in Proposition 46.
  The limiting law is described explicitly in Section 2. It is the law of a sum of coordinate autocorrelations for
  a reversible semigroup in countably many edge coordinates.
  The equilibrium measure of those coordinates is Gaussian conditioned on a renormalized quadratic constraint;
  its parameters are the random GOE edge points. A single positive deterministic coefficient accounts for the
  relaxation of microscopic spin gradients. Section 6 characterizes that coefficient by a determinate moment problem.

=== 1.2 History and relation to earlier work <history-and-relation-to-earlier-work>

Sherrington and Kirkpatrick introduced their infinite-range spin-glass model in 1975 #cite(label("SK1975")).
  Dynamical mean-field theory subsequently studied relaxation through correlation and response,
  notably in the soft-spin framework of Sompolinsky and Zippelius #cite(label("SompolinskyZippelius1982")).
  For critical Ising heat-bath dynamics, Billoire and Campbell #cite(label("BilloireCampbell2011")) Equation (7)
  tested numerically the finite-size scaling form

$ q_c \( n \, t \) tilde.op n^(- 1 \/ 3) F \( t \/ n^(2 \/ 3) \) \, $

with time measured in updates per spin. This is the direct numerical precedent for (1.2).
  A disorder-averaged scaling curve does not determine whether individual sample curves concentrate;
  our result identifies their limiting probability law.

Spherical models made the role of the spectral edge especially clear.
  Kosterlitz, Thouless, and Jones #cite(label("KosterlitzThoulessJones1976")) identified the edge mechanism in the
  spherical spin-glass transition. Cugliandolo and Dean #cite(label("CugliandoloDean1995")) analyzed Langevin
  relaxation and aging, and Ben Arous, Dembo, and Guionnet #cite(label("BenArousDemboGuionnet2001")) proved
  limiting dynamics and aging results for a soft spherical constraint.
  At finite size, Fyodorov, Perret, and Schehr #cite(label("FyodorovPerretSchehr2015")) related non-self-averaging
  on the $n^(2 \/ 3)$ time scale to edge fluctuations in zero-temperature spherical dynamics.
  These are spectral and dynamical predecessors, with different temperatures, initial conditions,
  and spin spaces from stationary critical Ising heat-bath dynamics.

The equilibrium comparison used here has its own history.
  Comets #cite(label("Comets1996")) related Ising and spherical partition functions by averaging over the
  eigenframe. Baik and Lee #cite(label("BaikLee2016")) studied spherical free-energy fluctuations on the two sides
  of the transition, and Landon #cite(label("Landon2022")) analyzed critical free-energy fluctuations and the
  edge-scale saddle. Du and Huang #cite(label("DuHuang2026FreeEnergy")) obtained a quantitative critical
  Ising–spherical partition comparison; their quenched overlap theorem #cite(label("DuHuang2026Overlap"))
  describes the random critical overlap law using Gaussian coordinates conditioned on a centered square sum.
  The conditioned measure used below follows this framework.
  The additional work here identifies the closed dynamical form, its microscopic coefficient,
  and the functional limit across two coupling laws.

Rigorous high-temperature mixing developed through spectral functional inequalities and localization.
  Relevant steps include Bauerschmidt and Bodineau #cite(label("BauerschmidtBodineau2019")), Eldan, Koehler,
  and Zeitouni #cite(label("EldanKoehlerZeitouni2022")), and Anari, Koehler,
  and Vuong #cite(label("AnariKoehlerVuong2024")). For fixed inverse temperature $beta < 1 \/ 2$,
  Wang #cite(label("Wang2026")) obtains $O_beta \( n log \( n \/ epsilon.alt \) \)$ random-site heat-bath mixing,
  uniformly in external fields, with probability tending to one over the disorder.
  At zero field, Boban, Li, and Oveis Gharan #cite(label("BobanLiOveisGharan2026")) obtain a spectral gap bounded
  below by a positive constant for rate-one-per-site dynamics, and polynomial mixing for $beta < 1 \/ 2 +
  epsilon.alt_0$, with a universal $epsilon.alt_0 > 0$, again with high disorder probability.
  Such fixed-subcritical estimates do not identify dynamics at the endpoint $beta = 1$.

Two companion manuscripts supply the Gaussian estimates used below.
  The critical slowing-down manuscript #cite(label("CS")) Theorems 1.1 and 1.2 identifies the $n^(2 \/ 3)$ scale
  of covariance and linear relaxation, and gives an obstruction to mixing from most realized equilibrium starts at
  smaller times. The critical mixing manuscript #cite(label("CM")) Theorem 1.1 obtains the matching mixing
  exponent and functional inequalities. Its comparison of spectral caps with spherical measures provides the
  starting estimates for our proof. An exponent statement alone does not identify the dynamics at a fixed multiple
  of $n^(2 \/ 3)$; we need quantitative improvements and an identification of the limiting energy.
  We state the companion inputs with their precise ranges in Section 2 and prove those additional steps here.

Finally, the comparison of coupling laws belongs to the Lindeberg approach to
  universality #cite(label("Chatterjee2006")). Carmona and Hu #cite(label("CarmonaHu2006")) proved universality of
  the SK limiting free energy. The observable here depends on the Gibbs law and the generator simultaneously.
  Its critical derivative bounds require the quadratic-feature comparison described next.

=== 1.3 The proof and its main ingredients <the-proof-and-its-main-ingredients>

We first work with Gaussian couplings. Adjoining an independent Gaussian diagonal does not affect the Gibbs law
  and makes the interaction matrix a GOE matrix $W = U Lambda U^(sans(T))$.
  The spectral coordinates $x = n^(- 1 \/ 3) U^(sans(T)) sigma$ isolate the fluctuations near the upper edge.
  Their limiting equilibrium law is a conditioned measure $Pi$,
  rather than a product of independent Gaussian coordinates.
  This constraint remains visible in the domain of the limiting gradient form.

There are two separate reasons why equilibrium convergence does not already give the answer.
  First, a function of the edge coordinates can lower its Dirichlet energy by adding a small microscopic
  correction. Second, convergence of finitely many edge coordinates gives no bound on the sum over all coordinates
  in (1.2). The proof treats these issues before comparing the two coupling distributions.

The starting observation is the resolvent trace. If $H$ is minus the heat-bath generator, then for $z > 0$ set

$ B_n \( z \) = sum_(a = 1)^n chevron.l x_a \, \( z + n^(2 \/ 3) H \)^(- 1) x_a chevron.r . $

This quantity is independent of the choice of orthogonal coordinates.
  It is the Stieltjes transform of the same spectral measure whose Laplace transform is $A_(n \, J)$.
  We establish convergence of these traces and then recover convergence of the functions on every compact positive
  time interval.

The observations used below have a concrete spectral meaning. At scale $p > 0$, remove from $W$ the matrix

$ B_p = U "diag" #scale(x: 120%, y: 120%)[\(] \( lambda_a - \( 2 - p^2 \) \)_(+) #scale(x: 120%, y: 120%)[\)]
  U^(sans(T)) \, wide h_p = B_p sigma + sans(N) \( 0 \, B_p \) . $

Conditioning on $h_p$ replaces the interaction by $W - B_p$, whose eigenvalues are capped at $2 - p^2$,
  and adds the external field $h_p$. Decreasing $p$ retains fewer observed directions near the spectral edge.

The Gaussian argument has four stages.

+ Spectral observations smooth functions on the cube. We compare their posterior means with a spherical model and
  control the score of the comparison density. Sections 3 and 4 sharpen the cap estimates to a conditional
  variance bound of order $p^(- 2)$ at cap scale $p$, without a power loss.
  The gain comes from averaging the curvature error before compressing it onto a smaller random spectral subspace.
+ In Section 5, slopes of these smoothings converge to weak gradients for $Pi$.
  We prove that their domain equals the closure of smooth cylinder functions.
  This identifies the closed energy form on the conditioned equilibrium measure.
+ Section 6 identifies the energy remaining after microscopic correction.
  Fixed-order contractions specify a deterministic positive measure $omega$ on $\[ 0 \, oo \)$.
  Polynomial approximation isolates its atom $c_(*) = omega \( { 0 } \)$,
  producing matching lower bounds and recovery sequences for the limiting form $c_(*) integral \| nabla F \|^2
  thin d Pi$.
+ Section 7 bounds the tail of the resolvent trace by vector integration by parts.
  The summable decay of the resulting coefficients makes finite-coordinate convergence sufficient for the whole
  observable.

For Rademacher couplings we compare basis-independent traces directly.
  The Lindeberg argument in Section 8 first transfers a trace built from quadratic spin features.
  Its vanishing controls the fourth-order remainders for the spin trace.
  This order of comparison is what allows Gaussian and sign couplings, whose fourth moments differ,
  to have the same limit. Finally, Section 9 proves the functional convergence, decay,
  and surviving disorder randomness. Appendix 10 explains why almost-sure decay is compatible with nondecaying
  functions in the closed topological support.

== 2 The conditioned edge measure and the Gaussian inputs <sec:edge-law>

The limiting state space is determined by the upper spectral edge of the interaction matrix.
  The spherical model makes this state space explicit: after diagonalization,
  its only remaining interaction is a constraint on the sum of the squared coordinates.
  We construct the resulting probability measure on infinitely many coordinates,
  following the equilibrium edge-conditioning description of Du–Huang #cite(label("DuHuang2026Overlap"))
  Section 2. We then explain the change of disorder law that transfers spherical calculations to the cube,
  and record the cap estimates used in the dynamical argument.

=== 2.1 The heat-bath form and the edge coordinates <the-heat-bath-form-and-the-edge-coordinates>

Write $mu = pi_(n \, J)$ and put $T = n^(2 \/ 3)$. For a function on the cube, let

$ D_i f \( X \) = frac(f \( X^(i \, +) \) - f \( X^(i \, -) \), 2) \, wide t_i \( X \) = tanh h_i \( X \) \, wide
  w_i \( X \) = 1 - t_i \( X \)^2 \, $

where $X^(i \, plus.minus)$ is obtained by setting the $i$th spin to $plus.minus 1$ and $h_i \( X \) =
  n^(- 1 \/ 2) sum_(j eq.not i) J_(i j) X_j$. The nonnegative heat-bath operator and its Dirichlet form are

#[#set math.equation(numbering: n => "(2.1)")
 $ H = sum_(i = 1)^n \( X_i - t_i \) D_i \, wide cal(E) \( f \, g \) =
   mu #h(-0.16667em) [sum_(i = 1)^n w_i D_i f D_i g] \, wide cal(E) \( f \) =
   cal(E) \( f \, f \) . $ <eq:edge-heatbath-form>]

Thus $P_t^J = e^(- t H)$. Forms and inner products of vector-valued functions include summation over the vector
  index. In particular, the clock normalization in (2.1) is rate one at each site.

Until Section 8, the couplings are Gaussian. Let $W$ have off-diagonal entries $J_(i j) \/ sqrt(n)$,
  and add independent diagonal entries with law $N \( 0 \, 2 \/ n \)$.
  The extra energy is constant on the cube, so it changes neither $mu$ nor $H$. The completed matrix is GOE.
  Diagonalize it as

$ W = U Lambda U^(sans(T)) \, wide lambda_1 gt.eq dots.h.c gt.eq lambda_n \, wide d_a = 2 - lambda_a \, wide
  g_(a \, n) = n^(2 \/ 3) d_a . $

After independent choices of eigenvector signs, $U$ is Haar orthogonal conditionally on $Lambda$.
  Its columns are denoted by $v_a$. Set

$ Y_a = v_a^(sans(T)) X \, wide x_a = n^(- 1 \/ 3) Y_a \, wide B_n \( z \) =
  sum_(a = 1)^n chevron.l x_a \, \( z + T H \)^(- 1) x_a chevron.r_mu \, quad z > 0 . $

The trace $B_n \( z \)$ is independent of the chosen orthonormal basis and is the Laplace transform of the
  rescaled autocorrelation:

$ B_n \( z \) = integral_0^oo e^(- z s) A_(n \, J) \( s \) thin d s . $

We use $x_a$ also for the coordinate functions of the limiting measure.

Let $rho_(upright("sc"))$ be the semicircle probability measure

$ d rho_(upright("sc")) \( lambda \) = frac(1, 2 pi) sqrt(4 - lambda^2) thin
  upright(bold(1))_(\[ - 2 \, 2 \]) \( lambda \) thin d lambda . $

The GOE edge convergence theorem gives the joint convergence of each fixed number of $g_(a \, n)$ to a simple,
  increasing point process $g = \( g_1 \, g_2 \, dots.h \)$; see #cite(label("RamirezRiderVirag2011")).
  This definition fixes the sign and scale of the edge process throughout the paper.

#thm([Lemma 2.1.])[
  (Spectral bounds).  #emph[The GOE eigenvalues have the following additional properties.]
  + #emph[$max_a \| lambda_a \| lt.eq 3$ with probability tending to one.]
  + #emph[There are tight random bounds $K_n gt.eq 0$ and $C_n > 0$ such that $g_(a \, n) gt.eq
    C_n^(- 1) a^(2 \/ 3)$ for every $a > K_n$.]
  + #emph[For every $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(2.2)")
 $ lim_(L arrow.r oo) limsup_(n arrow.r oo) bb(P) #h(-0.16667em)
   (g_(1 \, n) + L lt.eq 0 med upright("or") med lr(|n^(1 \/ 3) - sum_(a = 1)^n frac(1, g_(a \, n) + L) -
   sqrt(L)|) > epsilon.alt) = 0 . $ <eq:edge-trace-double-limit>]

]
  #emph[In the event appearing in the last formula, the sum is evaluated only when $g_(1 \, n) + L > 0$.]
] <lem:edge-spectral>

#proof[
  We use the eigenvalue-only spectral estimate of #cite(label("CS")) Proposition 3.1.
    For every deterministic sequence $L_n arrow.r oo$ with $L_n lt.eq log n$,
    that proposition controls both resolvent traces for $s in \[ L_n n^(- 2 \/ 3) \, 5 \]$,
    with positive denominators. At $s = L_n n^(- 2 \/ 3)$, multiplying its first-trace error by $n^(1 \/ 3)$ gives
  $ O #h(-0.16667em) (L_n^(- 1) + L_n^(- 1 \/ 8) + L_n^(- 1 \/ 4) sqrt(log \( 2 + L_n \))) = o \( 1 \) . $
  The semicircle resolvent equals $\( 2 + s - sqrt(s \( 4 + s \)) \) \/ 2$,
    whose expansion supplies the main term $sqrt(L_n)$ and an additional error $O \( L_n n^(- 1 \/ 3) \) = o \( 1 \)$.
  The second-trace estimate yields, for the same interval of $u$,
  $ \# { a : d_a lt.eq u } lt.eq 4 u^2 sum_a \( d_a + u \)^(- 2) lt.eq C n u^(3 \/ 2) . $
  Indeed $0 < d_a + u lt.eq 2 u$ for every counted eigenvalue.
    It follows that $g_(a \, n) gt.eq c a^(2 \/ 3)$ once $a > C L_n^(3 \/ 2)$.
    The uniform norm bound is part of the same proposition.
  These conclusions hold for every arbitrarily slowly divergent $L_n$.
    If (2.2) failed, one could select $L_j arrow.r oo$ and $n_j arrow.r oo$, with $log n_j gt.eq L_j$,
    along which the failure probability stayed positive, and embed the values $L_(n_j) =
    L_j$ in a sufficiently slow divergent sequence. This contradicts the preceding estimate.
    The identical criterion, applied to the least index after which the counting consequence holds,
    makes that index tight. This proves the second assertion as well. ◻
]

#prodef([Remark 2.2.])[
  (Convergence on sets of large disorder probability).  We will use constants that are bounded on disorder events
    of probability arbitrarily close to one. A bound of this kind is called a tight bound.
    For subsequential arguments, include these bounds, the eigenvalues,
    and the countably many relevant error quantities in the joint law before taking a Skorokhod representation.
    On the represented space, finite bounds and coordinate convergence can then be used deterministically.
    The conditional laws of the remaining finite-dimensional variables lift this representation to the original
    finite problems. A further diagonal extraction handles quantities that vanish in an iterated limit such as
    (2.2). The representation itself makes no assertion of convergence for the original sequence:
    one must identify every subsequential limit. Once this identification is made,
    the subsequence criterion gives the asserted joint convergence in distribution.
    In particular, if every subsequence of an intrinsic error quantity has a further represented subsequence
    tending to zero, that quantity tends to zero in probability on the original disorder space.
    No uniform integrability on exceptional disorders is required.
  A separate uniformity convention is essential for variational arguments.
    When an estimate is applied to a disorder-dependent test,
    its quenched inequality is understood to hold on one event for every test in the stated class,
    with the displayed bounds on its norm, energy, and polynomial growth.
    One way to obtain such an event, used below, is to bound the error for every test by its stated norms times a
    common nonnegative random error $R_n$. Convergence $R_n arrow.r
    0$ then permits arbitrary measurable choices of the test.
    Convergence on a countable core alone is not used to infer this uniformity.
] <rem:edge-tight-convergence>

=== 2.2 Conditioning the infinite Gaussian family <conditioning-the-infinite-gaussian-family>

Choose an admissible parameter $b$ with $b + g_1 > 0$, and write $l_a = \( g_a + b \)^(- 1)$.
  A convenient measurable choice is $b = 1 + \( - g_1 \)_(+)$; use the corresponding $b_n =
  1 + \( - g_(1 \, n) \)_(+)$ in finite dimension. By Lemma 2,

$ l_(a \, n) = \( g_(a \, n) + b_n \)^(- 1) arrow.r l_a \, wide lim_(m arrow.r oo) sup_n sum_(a > m) l_(a \, n)^2 = 0 $

on the represented sets just described, after discarding finitely many initial $n$. In particular $sum_a l_a^2 < oo$.

For independent $Z_a tilde.op N \( 0 \, l_a \)$, the centered series $S =
  sum_a \( Z_a^2 - l_a \)$ converges almost surely and in $L^2$. Define

#[#set math.equation(numbering: n => "(2.3)")
 $ D \( b \) = lim_(L arrow.r oo) {sqrt(L) - sum_(a gt.eq 1) (frac(1, g_a + b) - frac(1, g_a + L))} . $ <eq:source-1>]

Here $L$ is restricted to values with $L + g_1 > 0$. The limit is in probability with respect to $g$;
  a deterministic subsequence gives an almost sure version.
  The next proposition both justifies the limit and gives a pointwise meaning to conditioning on $S = D \( b \)$.

#thm([Proposition 2.3.])[
  (The conditioned edge measure).  #emph[Formula (2.3) defines a finite random variable, and
$ D_n \( b_n \) := n^(1 \/ 3) - sum_(a = 1)^n l_(a \, n) med arrow.r.double med D \( b \) $

 jointly with the edge coordinates. Almost surely $sum_a l_a = oo$.
   The law of $\( Z_a \)_(a gt.eq 1)$ conditioned on $S = D \( b \)$ has a version $Pi =
   Pi_g$ characterized by continuous conditional densities. It is independent of the admissible choice of $b$.]
  #emph[Let $mu^(upright("sp"))$ denote normalized surface measure on the sphere of radius $sqrt(n)$,
    tilted by $exp \( X^(sans(T)) W X \/ 2 \)$. The fixed-coordinate marginals of $n^(- 1 \/ 3) U^(sans(T))
    X$ under $mu^(upright("sp"))$ converge jointly in distribution with the eigenvalues to the random marginals of
    $Pi$. On the spectral representations of Remark 3, this is ordinary weak convergence of measures,
    including convergence of every fixed polynomial moment. On the sets in Remark 3, for every fixed $0 lt.eq
    j < oo$ one has
#[#set math.equation(numbering: n => "(2.4)")
 $ integral \| x_a \|^j thin d Pi lt.eq C_j l_a^(j \/ 2) \, wide mu^(upright("sp")) \| x_a \|^j lt.eq
   C_j l_(a \, n)^(j \/ 2) \, $ <eq:edge-coordinate-moments>]

 uniformly in the retained coordinate $a$.]
  #emph[For any sufficiently large fixed $m$, the tail $\( x_a \)_(a > m)$ under $Pi$ has a density relative to
    $⨂_(a > m) N \( 0 \, l_a \)$. Conditional on this tail, the first $m$ coordinates lie on the sphere of squared
    radius
#[#set math.equation(numbering: n => "(2.5)")
 $ D \( b \) + sum_(a lt.eq m) l_a - sum_(a > m) \( x_a^2 - l_a \) \, $ <eq:edge-polar-radius>]

 with the Gaussian angular density on that sphere. In particular, $sum_a \( x_a^2 - l_a \) =
   D \( b \)$ holds $Pi$-almost surely.]
] <prop:edge-conditioned-law>

#proof[
  For fixed admissible $L$, the identity
  $ D_n \( b_n \) = n^(1 \/ 3) - sum_a frac(1, g_(a \, n) + L) -
    sum_a (frac(1, g_(a \, n) + b_n) - frac(1, g_(a \, n) + L)) $
  separates the divergent trace from an absolutely convergent difference.
    The tail of the second sum is bounded by a constant times $\| L -
    b_n \| sum_(a > m) a^(- 4 \/ 3)$ on each set of bounded spectral data, so that sum passes to the limit.
    Lemma 2 then shows that the expressions in braces in (2.3) are Cauchy in probability,
    and that $D_n \( b_n \)$ has the asserted joint limit. If $sum_a l_a$ were finite,
    those expressions would tend to $+ oo$ as $L arrow.r oo$; this contradicts the finite limit.
    Changing $b$ changes $D \( b \)$ by the corresponding absolutely convergent resolvent difference.
  We give the density argument explicitly. Let $q$ be the density of $S$,
    and let $q_m$ be the density of $sum_(a > m) \( Z_a^2 - l_a \)$.
    After any fixed coordinates are omitted, a sufficiently large fixed group of remaining coordinates supplies an
    integrable bound for the characteristic function: the modulus of the factor for coordinate $a$ is
    $\( 1 + 4 t^2 l_a^2 \)^(- 1 \/ 4)$. Fourier inversion therefore gives continuous, bounded densities.
    The same bound applies to the finite sums and proves uniform convergence of their densities when the variances
    converge and their squared tails vanish.
  The centered sum after any finite deletion has support all of $bb(R)$.
    Its unbounded right support comes from one square. To reach an arbitrarily negative interval,
    make a sufficiently long finite block of squares small, using $sum l_a = oo$,
    and keep the remaining centered sum in a bounded interval of positive probability.
    Convolution with a finite block whose square-sum density is positive in the interior of its support now gives
    $q \( s \) > 0$ and $q_m \( s \) > 0$ for every $s in bb(R)$.
    Thus the first $m$ coordinates of the required conditional law have density
  #[#set math.equation(numbering: n => "(2.6)")
   $ frac(q_m #h(-0.16667em) (D \( b \) - sum_(a lt.eq m) \( x_a^2 - l_a \)),
     q \( D \( b \) \)) product_(a lt.eq m) e^(- x_a^2 \/ \( 2 l_a \)) / sqrt(2 pi l_a) . $ <eq:edge-cylinder-density>]
  Convolution shows that these densities are consistent. They depend measurably on the spectral data,
    so their extension is a random probability measure $Pi_g$.
  For completeness, they admit a disintegration on the constraint itself.
    Let $q_m^(upright("head"))$ be the density of $sum_(a lt.eq m) \( Z_a^2 - l_a \)$.
    Give the tail product Gaussian law the weight
  $ frac(q_m^(upright("head")) #h(-0.16667em) (D \( b \) - sum_(a > m) \( x_a^2 - l_a \)), q \( D \( b \) \)) . $
  Given the tail, use polar disintegration of the first $m$ Gaussian coordinates at the radius (2.5).
    This produces (2.6), has an absolutely continuous tail law, and enforces the constraint almost surely.
  In finite dimension, conditioning independent normals of variances $l_(a \, n)$ on $sum_a x_a^2 =
    n^(1 \/ 3)$ gives exactly the spherical Gibbs measure in the stated coordinates:
    the term involving $b_n$ in the Gaussian exponent is constant on that sphere.
    The density convergence above and $q \( D \( b \) \) > 0$ imply convergence of each cylinder marginal.
    Their densities are bounded by a constant times the corresponding product Gaussian density.
    To retain an arbitrary single coordinate uniformly, choose the integrable Fourier bound from a fixed group of
    leading coordinates other than that coordinate. This proves (2.4) and uniform integrability of all fixed
    polynomial moments.
  The argument applies to every admissible $b$ on sets where its distance from the pole is bounded below and its
    magnitude is bounded above; these sets exhaust the admissible choices.
    The finite conditioned spherical law is independent of $b_n$,
    so its limiting cylinder marginals are also independent of $b$.
    The conclusion holds simultaneously for all admissible $b$.
    First take a common probability-one event for rational parameters.
    On every compact admissible interval, the resolvent-difference series converges uniformly,
    so $D \( b \)$ is continuous. The squared variance tails and the Fourier majorants above are also uniform on
    that interval. Thus the conditional cylinder densities in (2.6),
    and their integrals against bounded continuous cylinder tests, depend continuously on $b$.
    Equality for rational parameters therefore extends to the whole interval. ◻
]

#thm([Lemma 2.4.])[
  (The bulk spectral weight).  #emph[For a spherical Gibbs spin, the random probability measure
$ 1 / n sum_a Y_a^2 delta_(lambda_a) $

 converges in probability, conditionally on the spectral data as above,
   to $\( 2 - lambda \)^(- 1) d rho_(upright("sc")) \( lambda \)$.]
] <lem:edge-bulk-weight>

#proof[
  First test against a bounded continuous function supported away from $2$.
    Before conditioning, the Gaussian variance of its integral is $O \( n^(- 1) \)$,
    and its mean converges to the stated integral by the semicircle law.
    Integrate out a fixed number of leading Gaussian coordinates when imposing the norm constraint.
    Their square-sum density gives a bounded density ratio, so the concentration persists after conditioning.
    Each of those leading coordinates has mass $n^(- 1 \/ 3) x_a^2 = o \( 1 \)$ in probability by (2.4).
    Finally both the finite measure and its proposed limit have mass one,
    since $integral \( 2 - lambda \)^(- 1) d rho_(upright("sc")) \( lambda \) = 1$.
    This extends convergence across the edge. The same argument permits bounded tests with cuts at continuity
    points in the bulk. ◻
]

=== 2.3 The limiting autocorrelation and its time constant <the-limiting-autocorrelation-and-its-time-constant>

For a smooth compactly supported cylinder function $F$ on $bb(R)^(bb(N))$, consider the quadratic form

$ cal(E)_Pi \( F \) = integral sum_a \| partial_a F \|^2 thin d Pi . $

Proposition 22 will prove that this form is closable and identify its domain.
  Denote the nonnegative operator associated to its closure by $H_Pi$. The law in Theorem 1 is specified by

#[#set math.equation(numbering: n => "(2.7)")
 $ cal(A) \( s \) = sum_(a gt.eq 1) chevron.l x_a \, e^(- s c_(*) H_Pi) x_a chevron.r_Pi \, wide s > 0 \,
   $ <eq:source-2>]

where $c_(*) > 0$ is deterministic. Finiteness, continuity,
  and the remaining assertions about this random function are proved in Sections 7 and 9.

The coefficient is $c_(*) = omega \( { 0 } \)$, where $omega$ is the deterministic finite positive measure of
  microscopic heat-bath energies characterized by the moment prescription (6.2) in Section 6.
  Proposition 26 constructs this measure and proves its determinacy;
  Theorem 33 proves that its atom at zero is strictly positive and is the coefficient in (2.7).

=== 2.4 Haar bias and Gaussian cap observations <haar-bias-and-gaussian-cap-observations>

We now connect the spherical calculations with the cube. All partition functions use probability reference
  measures: uniform probability on the cube and normalized surface measure on the sphere.
  Conditional on the spectrum, put

$ L_compose \( U \) = frac(Z_(upright("cube")) \( W \), Z_(upright("sp")) \( W \)) . $

Haar averaging gives $E_U L_compose = 1$. Define the probability law $upright(bold(P))$,
  and its expectation $upright(bold(E))$, by drawing $U$ with Haar density $L_compose$,
  then drawing a cube spin with law $mu$. Any observation noises introduced below are independent of this spin
  conditionally on the matrix. The spectrum is held fixed in $upright(bold(P))$ and $upright(bold(E))$.

#thm([Lemma 2.5.])[
  (Spherical identity under Haar bias).  #emph[Under $upright(bold(P))$,
    $U^(sans(T)) X$ has exactly the spherical Gibbs law in spectral coordinates.
    After the row sign change sending $X$ to $upright(bold(1))$, conditional on $y =
    U^(sans(T)) X$ the eigenframe is Haar subject to $U y = upright(bold(1))$.
    Moreover, on the eigenvalue events used below,
#[#set math.equation(numbering: n => "(2.8)")
 $ E_U \( L_compose - 1 \)^2 = o \( 1 \) . $ <eq:edge-uncapped-comparison>]

]
] <lem:edge-biased-law>

#proof[
  In the joint weighted law, $Z_(upright("cube"))$ cancels the Gibbs denominator.
    For each fixed cube vertex, Haar rotation sends that vertex to uniform surface measure on the sphere of radius
    $sqrt(n)$. The remaining energy weight is $exp \( y^(sans(T)) Lambda y \/ 2 \)$, proving the first assertion.
    The same invariance gives the conditional Haar law on the stated coset.
    Finally, the uncapped zero-field calculation in the proof of the static cap comparison of #cite(label("CM")),
    Section 15, paragraph “Zero field and overlaps bounded away from zero,” gives $E_U
    Z_(upright("cube"))^2 \/ \( Z_(upright("sp")) \)^2 = 1 + o \( 1 \)$.
    Together with $E_U L_compose = 1$, this is (2.8). ◻
]

For example, if $G gt.eq 0$ is a spin or observation functional, then

$ E_U #h(-0.16667em) [upright(bold(1))_({ L_compose gt.eq 1 \/ 2 }) Q_mu G] lt.eq 2 upright(bold(E)) G . $

Here $Q_mu$ denotes the ordinary joint law of the Gibbs spin and its observations at fixed disorder.
  This inequality and Markov’s inequality transfer biased mean estimates to quenched estimates;
  the discarded disorder event has probability $o \( 1 \)$ by (2.8).

The cap at scale $p > 0$ is defined by

$ P_p = upright(bold(1))_({ d lt.eq p^2 }) \, quad cal(H)_p = "ran" P_p \, quad B_p = \( p^2 - d \)_(+) \, quad
  W_p = W - B_p \, quad k_p = n p^3 \, quad M_p = sqrt(n p) . $

Matrix functions in these formulas are conjugated by $U$ when used in physical coordinates.
  Figure 1 shows how the cap flattens the upper edge and how the removed part becomes observation precision.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((3.3, 2.4), (6.105, 4.44), (6.105, 2.4), close: true, fill: rgb("#ebebff"), stroke: none)
  line((0, 0), (7.012, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.012, 0), [#text(size: 9pt)[$lambda$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 4.86), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 4.86), [#text(size: 9pt)[eigenvalue]], anchor: "south", padding: 0.1176cm)
  line((0.5775, 0.42), (6.353, 4.62), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0.5775, 0.42), (3.3, 2.4), (6.435, 2.4), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  line((3.3, 0), (3.3, 2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((0, 2.4), (3.3, 2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((3.3, 0), [#text(size: 9pt)[$2-p^2$]], anchor: "north", padding: 0.1176cm)
  content((0, 2.4), [#text(size: 9pt)[$2-p^2$]], anchor: "east", padding: 0.1176cm)
  line((4.95, 0.054), (4.95, -0.054), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.95, -0.054), [#text(size: 9pt)[$2$]], anchor: "north", padding: 0.1176cm)
  content((1.815, 1.32), [#text(fill: rgb("#808080"))[#text(size: 9pt)[original eigenvalue]]], anchor: "south", angle: 36deg, padding: 0.1176cm)
  content((5.197, 2.28), [#text(fill: rgb("#000099"))[#text(size: 9pt)[$min ( lambda ,2-p^2)$]]], anchor: "north", padding: 0.1176cm)
  line((5.775, 2.472), (5.775, 4.14), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((5.89, 3.36), [#text(size: 9pt)[observation#linebreak()precision]], anchor: "west", padding: 0.1176cm)
  line((3.3, -0.78), (6.518, -0.78), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((4.917, -0.78), [#text(size: 9pt)[active eigendirections#linebreak()$lambda >2-p^2$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A spectral cap, shown near the upper edge. The posterior interaction $W_p$ retains eigenvalues below $2 - p^2$ and flattens those above it. The removed amount $\( lambda - \( 2 - p^2 \) \)_(+)$ is the precision of the Gaussian observation in that eigendirection. The drawing is schematic; its geometry illustrates the defining spectral functions, not an eigenvalue density. ],
) <fig:spectral-cap>

Observe $h_p = B_p X + sans(N) \( 0 \, B_p \)$, with independent Gaussian increments as $B_p$ increases,
  starting from zero precision if necessary. Bayes’ formula makes the posterior interaction $W_p$ and the
  posterior field $h_p$. Write $mu_(p \, h)$ for the cube posterior at a specified field $h$.
  Let $phi.alt_p \( h \)$ be its log partition function, $m_p \( h \) = nabla phi.alt_p \( h \)$ its mean,
  and $K_p \( h \) = P_p nabla^2 phi.alt_p \( h \) P_p$ its covariance restricted to $cal(H)_p$.
  Superscript $upright("sp")$ denotes the corresponding spherical quantities.
  At path fields we often suppress the argument $h_p$.

On the joint space of the eigenframe and the spectral observation path,
  the density of $upright(bold(P))$ relative to independent Haar measure and the spherical observation law,
  through scale $p$, is

#[#set math.equation(numbering: n => "(2.9)")
 $ L_p = exp { phi.alt_p \( h_p \) - phi.alt_p^(upright("sp")) \( h_p \) } . $ <eq:source-4>]

Indeed the likelihood of the observations is a common Gaussian factor multiplied by the posterior partition
  function divided by the original one; the factor $L_compose$ cancels the two original partition functions.
  The spin in spectral coordinates already has the spherical law by Lemma 6;
  its observation noises are independent Gaussian increments with covariance determined by the spectrum.
  Hence the entire spectral observation path under $upright(bold(P))$ has exactly its spherical law.
  We normalize its coordinates by

$ u_(p \, a) = frac(\( U^(sans(T)) h_p \)_a, p^2 n^(1 \/ 3)) \, wide r = n^(- 1 \/ 3 + delta) \, wide delta =
  10^(- 4) . $

We will use $r lt.eq p lt.eq p_(upright("top"))$, allowing fixed-factor buffers at the endpoints.
  The values $d_a = p^2$ cause no discontinuity in the observations; they may be omitted in scale integrals,
  and zero-variance coordinates are omitted from density formulas.

=== 2.5 Saddles and cap estimates <saddles-and-cap-estimates>

For a field $h in cal(H)_p$, its spherical saddle $alpha = alpha_p \( h \)$ is the unique solution above the pole of

#[#set math.equation(numbering: n => "(2.10)")
 $ R_(p \, alpha) = \( max \( d \, p^2 \) + alpha \)^(- 1) \, wide n = "Tr" R_(p \, alpha) +
   parallel R_(p \, alpha) h parallel^2 . $ <eq:source-5>]

The annulus $\| alpha_p \( h \) \| lt.eq s_0 p^2$ is separated from zero field. Its radius as a function of $alpha$ is

$ ell_p \( alpha \) = \( p^2 + alpha \) sqrt(n - "Tr" R_(p \, alpha)) . $

The following statement collects the precise Gaussian inputs needed later.
  All upper cutoffs and tolerances in it are fixed constants before $n$ tends to infinity.

#thm([Proposition 2.6.])[
  (Cap inputs).  #emph[Fix a finite field radius $R$ and positive fixed error tolerances.
    There are sufficiently small constants $p_(upright("top")) \,
    s_0 > 0$ such that the following hold with probability tending to one in the range $n p^3 gt.eq
    c sqrt(log n)$ and $p lt.eq p_(upright("top"))$.]
  #emph[#emph[Spectral and spherical estimates, at every scale.] The spectral dimension satisfies $dim cal(H)_p
    asymp k_p$, $d_1 gt.eq - o \( p^2 \)$ uniformly in the cap range, and $"Tr" R_(p \, 0)^2 = O \( n \/ p \)$.
    On $\| alpha \| lt.eq s_0 p^2$, $ell_p \( alpha \) asymp p^2 M_p$ and $ell'_p \( alpha \) asymp M_p$.
    For $parallel h parallel lt.eq R p^2 M_p$, the saddle precision has gap comparable to $p^2$.
    At $alpha = alpha_p \( h \)$, the density at $n$ of the squared norm of
    $sans(N) \( R_(p \, alpha) h \, R_(p \, alpha) \)$ is comparable to $sqrt(p \/ n)$.
    After multiplication by $e^(v^(sans(T)) X)$ and renormalization,
    the Gaussian mean becomes $R_(p \, alpha) \( h + v \)$ while its covariance remains $R_(p \, alpha)$;
    its squared-norm density at $n$ is at most a fixed multiple of $sqrt(p \/ n)$.
    For $m$ replicas, where $m$ is fixed, consider rowwise linear or quadratic tilts that preserve Gaussianity.
    The joint density of their squared norms is at most $C_m \( p \/ n \)^(m \/ 2)$ under the following
    hypotheses. The spectral rows remain independent after the rowwise tilt,
    the tilted precision is positive definite, and on at least $c
    k_p$ rows the post-tilt row covariance $C_a$ satisfies $c p^(- 2) "Id"_m prec.curly.eq C_a prec.curly.eq C
    p^(- 2) "Id"_m$. All comparison constants here are fixed.]
  #emph[#emph[Curvature estimates, at every scale.] On the annulus, for any prescribed fixed $epsilon.alt_0 > 0$,
#[#set math.equation(numbering: n => "(2.11)")
 $ K_p prec.curly.eq \( 1 + epsilon.alt_0 \) p^(- 2) "Id"_(cal(H)_p) \, wide p^2 \( K_p \)_(e e) lt.eq 1 -
   epsilon.alt_1 \, quad e = h \/ parallel h parallel \, quad epsilon.alt_1 = 0.1 . $ <eq:source-6>]

 On the entire field ball one also has $K_p prec.curly.eq C_R p^(- 2) "Id"_(cal(H)_p)$,
   where $C_R$ may be chosen before $epsilon.alt_0$.]
  #emph[#emph[Static comparisons and cube projection tails,
    on geometric lists.] For any prescribed fixed geometric list of scales, uniformly over the field ball,
$ \| phi.alt_p \( h \) - phi.alt_p^(upright("sp")) \( h \) \| lt.eq epsilon.alt_v k_p \, wide
  parallel P_p m_p \( h \) - R_(p \, alpha_p \( h \)) h parallel lt.eq epsilon.alt_g M_p . $

 Any fixed finite family of such lists is allowed. For each $h in cal(H)_p$ with $parallel h parallel lt.eq
   R p^2 M_p$, the cube posterior $mu_(p \, h)$ satisfies, uniformly for every $v gt.eq
   v_0$ with a sufficiently large fixed threshold $v_0$,
$ mu_(p \, h) { parallel P_p X parallel > v M_p } lt.eq C exp \( - a k_p v^6 \) . $

 For $v > p^(- 1 \/ 2)$ the event is empty, since $parallel X parallel = sqrt(n)$.
   Here $a > 0$, and the same bound holds under the uncapped zero-field cube measure $mu$ at the same list scales.]
  #emph[The spherical projection-tail estimate holds at every scale in the stated range,
    for capped bounded-field and uncapped zero-field measures.
    Also, at every such cap scale, for independent spherical replicas at a common field in the prescribed ball,
$ \( mu_(p \, h)^(upright("sp")) \)^(⊗ 2) { \| n^(- 1) X^(sans(T)) X' \| > rho } lt.eq C exp \( - c n rho^3 \) \,
  wide C p lt.eq rho lt.eq rho_0 \, $

 for a sufficiently small fixed $rho_0 > 0$. A fixed finite number of replicas obeys the corresponding bound for
   any pair.]
] <prop:edge-cap-inputs>

#proof[
  #emph[Source statements and the radial consequence.] The spectral, saddle,
    and density assertions are the conclusions of #cite(label("CM")), Sections 15.2–15.3,
    “Spectral estimates at the bottom scale” and “Spherical saddles, norm densities,
    and tails.” The static comparison and its projection tails are Proposition 15.1 in that section.
    Its order of choices is the one stated here: fix the radius, errors, and geometric ratios,
    then decrease the upper cutoff. The overlap estimate is the spherical estimate preceding that proposition.
  The upper covariance bounds are Theorem 18.6, “Uniform curvature of the true cap potentials,” in
    #cite(label("CM")). Its lower endpoint is $\( sqrt(log n) \/ n \)^(1 \/ 3)$,
    with fixed-factor changes permitted, so it covers our scale $r$ and its fixed buffers.
    We also use a consequence retained in that theorem’s proof.
    Let $gamma$ be the fixed geometric ratio chosen in that proof,
    and set $R_(p \, alpha)^H = \( P_p R_(p \, alpha) P_p \) \|_(cal(H)_p)$.
    At an intermediate evaluation ratio $x in \[ gamma^2 \, gamma \]$, Lemma 16.2,
    “Evaluation with the induction extension,” in #cite(label("CM")) bounds the radial entry of
    $p^2 \( K_p - R_(p \, alpha)^H \)$ above by $- 0.26$. The theorem’s proof chooses $s_0$ so that every target
    saddle lies inside the parent agreement annulus with fixed slack,
    and applies exactly this deterministic evaluation. Therefore
  $ p^2 \( K_p \)_(e e) lt.eq frac(1, 1 + alpha \/ p^2) - 0.26 lt.eq frac(1, 1 - s_0) - 0.26 lt.eq 0.9 $
  after decreasing $s_0$. This proves the second part of (2.11) with a fixed tolerance. ◻
]

The list restriction in the static comparison is harmless,
  but its removal requires a short argument because later observation identities integrate over all scales.

#thm([Lemma 2.7.])[
  (Interpolation between cap scales).  #emph[The value, projected-mean,
    and cube projection-tail conclusions of Proposition 7 hold at every scale in the stated range,
    after prescribing slightly smaller errors on a sufficiently fine fixed geometric list and decreasing the upper
    cutoff.]
] <lem:edge-static-interpolation>

#proof[
  First use an ordinary fixed-ratio list. Monotonicity of $P_p$ and a fixed-factor change in $M_p$ extend the
    uncapped projection tail to every $p$. Removing $B_p$ from the interaction changes its normalizing factor by
  $ mu exp \( - X^(sans(T)) B_p X \/ 2 \) gt.eq mu { parallel P_p X parallel lt.eq
    V M_p } thin exp \( - parallel B_p parallel V^2 M_p^2 \/ 2 \) gt.eq e^(- C k_p) \, $
  where $V$ is fixed and large. We used $parallel B_p parallel = O \( p^2 \)$ on the spectral event.
    Thus the projection tail persists at cap zero field. A field $parallel h parallel lt.eq
    R p^2 M_p$ adds at most $R k_p v$ on the shell $parallel P_p X parallel = v M_p$;
    this is dominated by $a k_p v^6$ for large $v$. The zero-field measure is even,
    so its linear-tilt normalizer is at least one. This gives the same tail on the field ball,
    with an adjusted starting threshold. The argument also bounds $parallel P_q X parallel \/
    M_q$ under the $p$-cap posterior whenever $q gt.eq p$ and $q \/ p$ is bounded:
    use the uncapped $P_q$ tail, the same denominator lower bound, and $P_p h = h in cal(H)_q$.
    This is the tail needed to compare two nearby caps. The spherical estimates give the identical conclusion.
  Now choose a fixed geometric list with consecutive ratios close to one,
    and let $q$ be its first scale above $p$. Then $cal(H)_p subset cal(H)_q$ and
  $ parallel W_p - W_q parallel lt.eq C \( 1 - p \/ q \) q^2 \, wide "ran" \( W_p - W_q \) subset cal(H)_q . $
  For $h in cal(H)_p$ in the prescribed ball, restrict first to $parallel P_q X parallel lt.eq V M_q$.
    The change in log weight there is at most $C \( 1 - p \/ q \) V^2 k_q$.
    On its complement, the projection tail controls the exponential of the quadratic change:
    the exponent $C \( 1 - p \/ q \) k_q v^2$ is dominated by the negative $a k_q v^6$ tail.
    Choose $V$ first and the list ratio second. The resulting log-partition change is as small as desired in units
    $k_q$, for both cube and sphere. Their value comparison at $q$ therefore implies the value comparison at $p$,
    since $k_p \/ k_q$ is arbitrarily close to one.
  For the mean, use the value comparison on a slightly larger field ball.
    The frozen Gaussian saddle identity and its norm-density bound give, for any unit $v in cal(H)_p$ and both signs,
  $ log mu_(p \, h) e^(plus.minus t v^(sans(T)) \( X - R_(p \, alpha) h \)) lt.eq 2 epsilon.alt_v k_p + 1 /
    2 t^2 v^(sans(T)) R_(p \, alpha) v + C . $
  Jensen’s inequality, with $t = theta p^2 M_p$, bounds the projected mean discrepancy divided by $M_p$ by $C
    theta + \( 2 epsilon.alt_v + C \/ k_p \) \/ theta$. Choose $theta$ from the required mean tolerance and then
    $epsilon.alt_v$ sufficiently small. This proves the claim uniformly at every intermediate scale. ◻
]

The estimates of this section supply the ordinary Gaussian caps and the spherical description of their
  observations. The next section derives the quantitative comparison and score estimates needed to retain the
  exact $n^(2 \/ 3)$ time scale.

== 3 Quantitative estimates for the observations <sec:observations>

The coarse cap estimates of Proposition 7 locate the relevant fields and bound their covariance by a constant
  times $p^(- 2)$. For the time normalization in Theorem 1,
  we shall need a relative covariance error that is integrable in logarithmic scale.
  The purpose of this section is to obtain the averaged estimates from which that improvement will follow.
  There are two different sources of smallness: a two-replica comparison at the smallest observation scale,
  and an integrated likelihood estimate at the larger scales.

We retain the notation and conditional-on-spectrum probability $upright(bold(P))$ of Lemma 6.
  Thus $upright(bold(P))$ includes the partition-function bias on the eigenframe and the ordinary Gibbs
  observation path given that frame; $Q_mu$ denotes the latter path law for fixed disorder.
  Expectations with respect to these laws are denoted by $upright(bold(E))$ and $Q_mu \[ thin dot.op thin \]$.
  Constants in the present section are uniform on each of the tight spectral sets described in Remark 3.
  They may depend on that set, on a fixed moment order, and on fixed field or scale ratios.
  A bound $C exp \( - n^xi \)$ always has some $xi > 0$; decreasing $xi$ absorbs polynomial factors and the
  $O \( log n \)$ scale intervals used below. Recall that

$ r = n^(- 1 \/ 3 + delta) \, wide delta = 10^(- 4) \, wide k_p = n p^3 \, wide M_p = \( n p \)^(1 \/ 2) . $

All estimates involving a fixed multiplicative enlargement of the interval of scales have the same meaning,
  provided its upper endpoint is sufficiently small. In particular,
  $k_p$ grows as a positive power of $n$ throughout the intervals considered here.

=== 3.1 Location of the path and coordinate moments <location-of-the-path-and-coordinate-moments>

The following estimate improves the fixed annulus test to a shrinking annulus.
  It concerns the ordinary observation path averaged under $upright(bold(P))$;
  it is not an assertion about every external field.

#thm([Lemma 3.1.])[
  (The observation annulus).  #emph[There are $a \, xi > 0$ and a sufficiently small fixed upper scale
    $p_(upright("top")) > 0$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ \| alpha_p \( h_p \) \| lt.eq C k_p^(- a) p^2 wide \( r lt.eq p lt.eq p_(upright("top")) \) $ <eq:source-7>]

 outside a set of $upright(bold(P))$-probability at most $C exp \( - n^xi \)$.
   On disorder events of probability arbitrarily close to one, the same whole-path statement holds under $Q_mu$,
   with a possibly smaller $xi$.]
] <lem:observations-annulus>

#proof[
  Under $upright(bold(P))$, the field in spectral coordinates has exactly its spherical distribution.
    Generate the spherical spin from independent centered Gaussian coordinates $y_i$ of precision $D'_i = d_i +
    b_n n^(- 2 \/ 3)$, conditioned on $sum_i y_i^2 = n$; the choice of $b_n$ is that of Proposition 4.
    Before this conditioning, write
  $ h_(p \, i) = B_(p \, i) y_i + B_(p \, i)^(1 \/ 2) z_i \, wide m = p^2 + b_n n^(- 2 \/ 3) \, $
  where the $z_i$ are independent standard normals. On an active coordinate $B_(p \, i) = m - D'_i$,
    and direct expansion gives
  $ upright(bold(E))_0 #scale(x: 120%, y: 120%)[\(] parallel h_p parallel^2 -
    m^2 parallel y parallel^2 #scale(x: 120%, y: 120%)[\)] = - m^2 "Tr" R_(p \, b_n n^(- 2 \/ 3)) . $
  Here $upright(bold(E))_0$ denotes the unconditioned Gaussian expectation.
    The subtraction of $m^2 parallel y parallel^2$ removes the large contribution of the leading coordinates:
    its coefficient on the standardized $y_i^2$ term is $\( B_(p \, i)^2 - m^2 \) \/ D'_i = D'_i - 2 m = O \( p^2 \)$.
  As a quadratic form in the standardized $\( y \, z \)$ variables,
    the centered quantity has squared Frobenius norm at most $C p^4 k_p$ and operator norm at most $C p^2
    k_p^(1 \/ 3)$. Indeed the cross coefficients are $O \( p^3 \/ sqrt(D'_i) \)$, while the spectral estimates give
  $ min_i D'_i gt.eq c n^(- 2 \/ 3) \, wide sum_(d_i lt.eq p^2) \( D'_i \)^(- 1) lt.eq C n p . $
  The inactive coordinates are bounded by the capped second resolvent trace.
    The Gaussian quadratic-form exponential-moment formula therefore bounds deviations larger than $p^2
    k_p^(9 \/ 10)$ by $C exp \( - k_p^(a_0) \)$ for some $a_0 > 0$.
  This estimate survives conditioning on $parallel y parallel^2 = n$.
    To see this directly, use the same exponential tilt in the Markov bound,
    with its parameter at most one eighth of the inverse operator norm.
    The tilted joint Gaussian covariance, and hence its $y$-marginal covariance,
    remain comparable to the original ones. A fixed number of leading covariance eigenvalues bounds the density of
    $n^(- 2 \/ 3) parallel y parallel^2$ from above. Its original density at $n^(1 \/ 3)$ is bounded below on the
    chosen spectral set, by Proposition 4. The ratio of norm densities therefore costs only a constant.
  After conditioning, the deterministic target for $parallel h_p parallel^2$ is $ell_p \( b_n n^(- 2 \/ 3) \)^2
    asymp p^2 k_p$. The deviation just proved is a relative $O \( k_p^(- 1 \/ 10) \)$ error,
    so it first places the inferred saddle inside any fixed surrounding annulus for all sufficiently large $n$.
    On that annulus, the derivative of $ell_p \( alpha \)^2$ is comparable to $k_p$.
    Consequently the preceding deviation bound implies $\| alpha_p - b_n n^(- 2 \/ 3) \| lt.eq
    C p^2 k_p^(- 1 \/ 10)$. Since $b_n n^(- 2 \/ 3) \/ p^2 = O \( k_p^(- 2 \/ 3) \)$,
    this proves the fixed-scale assertion.
  For the whole path take a sufficiently fine inverse-polynomial mesh in $p^2$.
    The functions $B_p$, the saddle targets, and their relevant derivatives have polynomial bounds;
    the positive-part operation defining $B_p$ is continuous at coordinate activations.
    Conditional on the spin, each coordinate of the noise has independent Gaussian increments.
    A maximal Gaussian estimate in every mesh interval, followed by a union bound over coordinates and intervals,
    makes their oscillation smaller than the polynomial tolerance just used.
    The fixed-scale exponential estimate absorbs this union bound because $k_r = n^(3 delta)$.
    Finally, Lemma 6, Markov’s inequality, and $L_compose gt.eq
    1 \/ 2$ outside a vanishing disorder exception transfer the result to $Q_mu$. ◻
]

The signal-plus-noise representation also gives the moment estimates needed to test the field against individual
  edge coordinates. Every $u_(p \, a)$ has moments of every fixed order bounded uniformly in $a \,
  p$ under $upright(bold(P))$. For each fixed finite set of leading indices and every fixed $j < oo$,

#[#set math.equation(numbering: n => "(3.2)")
 $ parallel u_(p \, a) - x_a parallel_(L^j \( upright(bold(P)) \)) lt.eq frac(C_j, p n^(1 \/ 3)) \, wide r lt.eq
   p lt.eq p_(upright("top")) . $ <eq:source-8>]

Indeed the signal is $\( B_(p \, a) \/ p^2 \) x_a$ and the noise standard deviation is at most
  $\( p n^(1 \/ 3) \)^(- 1)$. For a leading coordinate, $\| d_a \| \/ p^2 = O \( \( p n^(1 \/ 3) \)^(- 2) \)$.
  The same estimates hold in $L^j \( Q_mu \)$ with tight disorder-dependent constants,
  simultaneously in $p$ in the sense of moment bounds at each scale:
  apply the signal-plus-noise formula to the tight quenched moments of $x_a$ furnished by the biased first moment
  and the concentration of $L_compose$.

=== 3.2 Two replicas and the smallest scale <two-replicas-and-the-smallest-scale>

In the next lemma the field is deterministic in spectral coordinates.
  Consequently $E_U$ means an independent Haar average at that fixed field,
  whereas $upright(bold(E))$ subsequently averages a random field with its spherical observation distribution.

#thm([Lemma 3.2.])[
  (Replica comparison).  #emph[Fix a bounded range for $parallel h
    parallel \/ \( p^2 M_p \)$ and take the upper scale sufficiently small. Uniformly for fields in this range,
#[#set math.equation(numbering: n => "(3.3)")
 $ E_U L_p \( h \)^2 lt.eq exp \( C + C n p^4 \) . $ <eq:source-9>]

 For a sufficiently large fixed $C_1$, the contribution to this normalized second moment of cube pairs satisfying
   $\| n^(- 1) X dot.op X' \| > C_1 p$ is at most $C exp \( - a k_p \)$. At $p = r$, the stronger estimates
#[#set math.equation(numbering: n => "(3.4)")
 $ E_U \( L_r - 1 \)^2 & lt.eq C n^(- 1 \/ 4) \,\
E_U #h(-0.16667em) [L_r^2 parallel m_r - m_r^(upright("sp")) parallel^2] & lt.eq C M_r^2 n^(- 1 \/ 4) $ <eq:source-10>]

 hold for the full mean vectors, written in spectral coordinates.
   The first bound also holds for the uncapped zero-field likelihood $L_compose$.
   The pair-tail assertion at scale $r$ also holds in that uncapped case.]
] <lem:observations-replicas>

#proof[
  Given the overlap $rho = n^(- 1) X dot.op X'$, the Haar angular integral of a cube pair equals that of a
    spherical pair. The difference is entirely in their overlap distributions.
    The replica Gram comparison of #cite(label("CM")) Section 15.4,
    Equation (15.10) bounds the ratio on overlap cells of width $2 \/ n$ by $exp \( C + C n rho^4 \)$.
    Above $C_1 p$ and below a small fixed cutoff, the spherical pair tail costs $exp \( - a n rho^3 \)$;
    choosing the cutoff small pays for the comparison on all dyadic bands.
    At overlaps bounded away from zero, the normalized zero-field comparison has a strictly negative exponential
    rate, by #cite(label("CM")) Section 15.4, p. 118. A bounded field changes logarithmic weights by at most $C n
    p^(5 \/ 2)$, which preserves that rate when the upper scale is small.
    Below $C_1 p$ the comparison factor is $exp \( C + C n p^4 \)$. This proves (3.3) and its pair-tail assertion.
    The uncapped argument uses the corresponding uncapped spherical tail from #cite(label("CM")) Section 15.3.
  We give the finer cell estimate, now taking $p = r$ throughout the remaining comparison.
    On $\| rho \| lt.eq C_1 p$, Stirling’s formula and the spherical overlap density show that the binomial mass
    of a cell and its spherical mass differ by a relative error
  $ O \( n p^4 + p + n^(- 1) \) . $
  It remains to compare the angular integrands within one cell.
    Write a spherical pair on an orthonormal sum-and-difference frame $\( q \, q' \)$.
    For $A = W_p$ their tilt exponent is
  $ n / 2 #scale(x: 120%, y: 120%)[\(] \( 1 + rho \) q^(sans(T)) A q + \( 1 - rho \) q'^(sans(T)) A q'
    #scale(x: 120%, y: 120%)[\)] + sqrt(2 n \( 1 + rho \)) thin h^(sans(T)) q . $
  Its oscillation on a cell is bounded by $C \( \| q^(sans(T)) A q - q'^(sans(T)) A q' \| + p^(5 \/ 2) \)$.
    This is uniformly bounded, and its average against the normalized tilted spherical pair law on these cells is
    $O \( p \)$. For the latter assertion, the exact identity
  $ q^(sans(T)) A q - q'^(sans(T)) A q' =
    frac(2 Y^(sans(T)) A Y' - rho \( Y^(sans(T)) A Y + Y'^(sans(T)) A Y' \), n \( 1 - rho^2 \)) $
  and $parallel A parallel lt.eq C$ bound the diagonal terms by $C \| rho \|$. It remains to show
  $ E_(upright("sp")) \| Y^(sans(T)) A Y' \| lt.eq C n p . $
  At a bounded cap field, apply exponential Markov with parameter $c p^2$ to either sign of $Y^(sans(T)) A Y'$.
    The saddle means have squared norm $O \( n p \)$, the covariance trace-square is $O \( n \/ p \)$,
    and a sufficiently small $c$ leaves a fixed precision margin.
    The Gaussian logarithmic moment generating function is therefore at most $C k_p$.
    Conditioning both norms costs a constant by the joint norm-density bound in #cite(label("CM"))
    Equation (15.6). Integrating the resulting tail, beginning at a sufficiently large multiple of $n p$,
    proves the displayed estimate. For uncapped zero field, freeze a Gaussian parameter equal to a small fixed
    multiple of $p^2$. The same moment generating function bound applies,
    and the deficit-filling lower density estimate in that subsection costs at most $exp \( C k_p \)$;
    this gives the same integrated bound.
  For completeness, the passage from this averaged oscillation to comparison of angular integrals does not require
    a pointwise $O \( p \)$ derivative bound. The oscillation of the exponent on a cell is bounded by a fixed
    constant, so the mean value theorem bounds the difference of its exponentials by a constant times its
    integrated absolute derivative. The spherical overlap density varies by a bounded factor on a cell.
    Summing over cells is thus bounded by the preceding $O \( p \)$ integral.
    Slightly enlarging the overlap cutoff pays for boundary cells by the pair tail.
  At $p = r$, $n p^4 + p + n^(- 1) = O \( n^(- 1 \/ 3 + 4 delta) \) = O \( n^(- 1 \/ 4) \)$.
    The normalized pair integral consequently equals $1 + O \( n^(- 1 \/ 4) \)$,
    which proves the first part of (3.4), since $E_U L_r = 1$. Apply the same comparison with the test $n rho$.
    Its absolute value on the retained cells is at most $C n p = C M_p^2$,
    and its change within one cell is bounded by $2$. Hence
  $ E_U parallel L_r m_r parallel^2 = parallel m_r^(upright("sp")) parallel^2 + O \( M_r^2 n^(- 1 \/ 4) \) . $
  The first-moment identity $E_U \[ L_r m_r \] = m_r^(upright("sp"))$ turns this into an $L^2$ bound on $L_r m_r -
    m_r^(upright("sp"))$. Finally,
  $ L_r \( m_r - m_r^(upright("sp")) \) = \( L_r m_r - m_r^(upright("sp")) \) - \( L_r - 1 \) m_r^(upright("sp")) \, $
  and $parallel m_r^(upright("sp")) parallel lt.eq C M_r$ proves the second part of (3.4). ◻
]

#thm([Corollary 3.3.])[
  (Cube edge marginals).  #emph[Jointly with the spectral variables, in the sense of Remark 3,
    the quenched cube integrals of continuous cylinder functions of polynomial growth converge to their integrals
    under $Pi$. In particular, all fixed moments of any fixed finite set of scaled edge coordinates converge.]
] <cor:observations-static>

#proof[
  In the uncapped comparison, insert a bounded Lipschitz cylinder function of the scaled spectral coordinates in
    each replica numerator. Changing the overlap within a cell moves each scaled coordinate by
    $O \( n^(- 5 \/ 6) \)$; the preceding weight comparison therefore remains valid.
    The variance over Haar frames of the numerator normalized by $Z_(upright("sp"))$ tends to zero.
    Together with $L_compose arrow.r 1$ and Proposition 4, this proves convergence of the quenched cube cylinder
    integrals to $Pi$. Polynomially growing continuous tests follow by the higher moment bounds and truncation. ◻
]

#thm([Corollary 3.4.])[
  (Mean moments and the initial score).  #emph[For every fixed $j < oo$, after reducing the fixed upper scale if needed,
#[#set math.equation(numbering: n => "(3.5)")
 $ upright(bold(E)) #scale(x: 120%, y: 120%)[\(] parallel m_p parallel \/ M_p #scale(x: 120%, y: 120%)[\)]^j +
   upright(bold(E)) #scale(x: 120%, y: 120%)[\(] parallel m_p^(upright("sp")) parallel \/ M_p
   #scale(x: 120%, y: 120%)[\)]^j lt.eq C_j . $ <eq:source-11>]

 At the smallest scale,
#[#set math.equation(numbering: n => "(3.6)")
 $ upright(bold(E)) frac(parallel m_r - m_r^(upright("sp")) parallel^2, M_r^2) lt.eq C n^(- 1 \/ 20) \, wide
   upright(bold(E)) parallel nabla_(u_r) log L_r parallel^4 = o \( 1 \) . $ <eq:source-12>]

]
] <cor:observations-means>

#proof[
  Lemma 9 confines the random field to a bounded range except with power-exponential probability.
    At a fixed such field, the Haar-averaged pair-tail numerator divided by the squared spherical partition
    function is at most $C e^(- a k_p)$, by Lemma 10. Under the biased frame law $L_p thin d U$,
    the set $L_p < e^(- a k_p \/ 4)$ has mass at most $e^(- a k_p \/ 4)$.
    On its complement, the expectation of the posterior pair-tail probability is at most $e^(a k_p \/ 4)$ times
    that pair-tail integral. A further Markov bound gives an exponentially small posterior pair tail outside an
    exponentially small biased exception. Since $parallel m_p parallel^2 = mu_(p \, h)^(⊗ 2) \[ X dot.op X' \]$,
    this implies $parallel m_p parallel^2 lt.eq C n p$ there.
    The deterministic bound $parallel m_p parallel lt.eq sqrt(n)$ pays for all exceptions and proves the cube part
    of (3.5). The spherical part follows by the same argument.
  For the first estimate in (3.6), split according to $L_r gt.eq n^(- 0.12)$.
    On this event (3.4) bounds the biased second moment by $C M_r^2 n^(- 0.13)$.
    The complementary biased probability is at most $n^(- 0.12)$;
    Cauchy–Schwarz and the fourth moment in (3.5) give $C M_r^2 n^(- 0.06)$. The field exceptions are negligible.
    Finally
  $ nabla_(u_r) log L_r = n^(1 \/ 3) r^2 P_r \( m_r - m_r^(upright("sp")) \) \, wide n^(1 \/ 3) r^2 M_r =
    n^(\( 5 \/ 2 \) delta) . $
  Interpolation of the decaying second moment with an arbitrarily high fixed moment from (3.5) proves the
    fourth-moment assertion. ◻
]

=== 3.3 Likelihood dissipation and covariance errors <likelihood-dissipation-and-covariance-errors>

The smallest-scale comparison controls a single observation.
  At larger scales the useful quantity is the score accumulated along the path.
  The Gaussian observation construction is a form of stochastic localization #cite(label("Eldan2013")); here,
  conditional on the disorder, the precision follows the deterministic spectral schedule $B_p$.
  We derive its likelihood identity below and combine it with the replica estimates just proved.
  Write $a_p^(upright("err")) = P_p \( m_p - m_p^(upright("sp")) \)$.

#thm([Lemma 3.5.])[
  (Integrated score).  #emph[There is a fixed $tau > 0$ such that,
    on each scale interval of a fixed bounded ratio about $q$,
#[#set math.equation(numbering: n => "(3.7)")
 $ integral parallel a_p^(upright("err")) parallel^2 thin d \( p^2 \) lt.eq
   C k_q \( q^tau + k_q^(- tau) \) $ <eq:source-13>]

 outside a set of $upright(bold(P))$-probability at most $C exp \( - n^xi \)$.
   The bound holds simultaneously on a geometric list of intervals, with fixed enlargements,
   and also holds in expectation.]
] <lem:observations-score>

#proof[
  Use $t = p^2$ as the channel parameter and take the filtration generated by the eigenframe and observations
    through time $t$. In particular, every disorder event is measurable at time zero.
    Between coordinate activations, $dot(B)_t = P_p$, and the Gaussian likelihood identity gives
  $ d log L_p = a_p^(upright("err")) dot.op d cal(B)_t + 1 / 2 parallel a_p^(upright("err")) parallel^2 d t \, $
  where $cal(B)$ is the innovation Brownian motion in the active subspace.
    The bracket of the martingale is the score integral. There is no singular term at an activation because the
    added precision starts at zero. These statements also follow by Itô differentiation of the posterior partition
    function, including the compensating interaction change $- d B_t$.
  Put $H_q = C k_q \( q^tau + k_q^(- tau) \)$, with $tau$ small and fixed.
    At the first endpoint, the likelihood-density identity gives $upright(bold(P)) \( log L_p < - H_q \) lt.eq
    e^(- H_q)$. At the last endpoint, (3.3) gives
  $ upright(bold(P)) \( log L_p > H_q \, med h_p upright(" in the bounded range") \) lt.eq
    exp \( - H_q + C + C k_q q \) . $
  Choose $C$ large and use Lemma 9 outside the range. An exponential martingale inequality now bounds the event
    that the bracket exceeds a sufficiently large multiple of $H_q$ while these endpoint inequalities hold.
    This proves (3.7). The logarithmic number of intervals is absorbed by the power-exponential bound.
    Both means have norm at most $sqrt(n)$, so the integral has a polynomial deterministic bound;
    integrating the exception proves the expectation assertion. ◻
]

Let $cal(G)_n$ be the intersection of the disorder events on which the fixed-tolerance annular covariance bounds
  of Proposition 7, the static value and projected-mean comparisons of Lemma 8,
  and the associated projection tails hold on the full scale and fixed field ranges used below.
  All tolerances and ranges are fixed before taking $n arrow.r oo$;
  their finite intersection has probability tending to one.
  The next estimate is asserted on $cal(G)_n$; its exceptional probability is measured before any conditioning on
  that event.

#thm([Lemma 3.6.])[
  (Integrated covariance error).  #emph[Put $D_p^K = p^2 K_p - "Id"$ on $cal(H)_p$.
    After decreasing $tau > 0$ if necessary,
#[#set math.equation(numbering: n => "(3.8)")
 $ integral_q^(2 q) frac(parallel D_p^K parallel_(upright(F))^2, k_p) thin d log p lt.eq
   C \( q^tau + k_q^(- tau) \) $ <eq:source-14>]

 outside an event whose intersection with $cal(G)_n$ has $upright(bold(P))$-probability at most $C
   exp \( - n^xi \)$. Fixed enlargements of the interval are allowed,
   and the assertions hold simultaneously on a geometric list.]
] <lem:observations-curvature>

#proof[
  On the shrinking annulus of Lemma 9, the spherical covariance has norm $O \( p^(- 2) \)$.
    By rotation invariance within the flat cap its restriction to $e^perp$, $e = h_p \/ parallel h_p parallel$,
    is scalar. The frozen Gaussian linear-tilt bound gives an $O \( p^(- 1) \)$ error between the spherical radial
    mean and the saddle mean. Dividing by $parallel h_p parallel asymp p^2
    M_p$ shows that the transverse covariance differs from $\( p^2 + alpha_p \)^(- 1)
    "Id"$ by $O \( p^(- 2) k_p^(- 1 \/ 2) \)$. The remaining radial covariance is rank one.
    Thus its contribution, and the shrinking saddle parameter, are already bounded by the right side of (3.8).
  It remains to compare $K_p$ and $K_p^(upright("sp"))$. The spherical posterior,
    evaluated along the cube observation path, has innovation drift $K_p^(upright("sp")) a_p^(upright("err")) d
    t$. Subtracting the two posterior mean equations gives
  $ d a_p^(upright("err")) = \( K_p - K_p^(upright("sp")) \) thin d cal(B)_t -
    K_p^(upright("sp")) a_p^(upright("err")) d t $
  between activations. Multiply $p^2 parallel a_p^(upright("err"))
    parallel^2$ by a smooth nonnegative cutoff supported on an enlarged scale interval and equal to one on
    $\[ q \, 2 q \]$, with bounded derivative in $log p$. Itô’s formula and integration by parts give
  $ integral_q^(2 q) parallel p^2 \( K_p - K_p^(upright("sp")) \) parallel_(upright(F))^2 thin d log p lt.eq
    C integral_(upright("enlargement")) parallel a_p^(upright("err")) parallel^2 thin d \( p^2 \) + C \| cal(M) \| . $
  Activations add squared new mean coordinates with nonnegative coefficients,
    so they may be discarded on this side of the inequality. The cutoff is zero at both endpoints;
    the displayed energy identity is applied over the entire interval, not at a stopping time. Its martingale is
  $ cal(M) =
    2 integral chi \( t \) t chevron.l
    a_(sqrt(t))^(upright("err")) \, \( K_(sqrt(t)) - K_(sqrt(t))^(upright("sp")) \) thin d cal(B)_t chevron.r . $
  For concentration, stop this stochastic integral alone at the first failure of the annular covariance bounds,
    and set its integrand to zero on $cal(G)_n^c$, a time-zero event.
    Its bracket is then bounded by $C integral parallel a_p^(upright("err")) parallel^2 d \( p^2 \)$.
    The stopped integral agrees with $cal(M)$ on $cal(G)_n$ and the whole-path annulus event.
    The martingale inequality, Lemma 13, and Lemma 9 therefore prove the assertion.
    Division by $k_q asymp k_p$ gives the stated normalization. ◻
]

We finish with an angular estimate that will identify derivatives of the limiting measure.
  This estimate uses the remaining Haar randomness without restricting first to $cal(G)_n$.

#thm([Lemma 3.7.])[
  (Angular score).  #emph[For a cap field $h$, write $tilde(h) =
    U^(sans(T)) h$ and $tilde(phi.alt)_p \( tilde(h) \) = phi.alt_p \( U tilde(h) \)$.
    Let $A$ be a fixed skew-symmetric matrix supported on finitely many leading spectral coordinates,
    and set $cal(R) = \( A tilde(h) \) dot.op nabla_(tilde(h))$. There is $tau' > 0$ such that
#[#set math.equation(numbering: n => "(3.9)")
 $ integral_q^(2 q) frac(upright(bold(E)) \| cal(R) tilde(phi.alt)_p \( tilde(h)_p \) \|^2, n^(2 \/ 3) p^2) thin d
   log p lt.eq C_A \( q^(tau') + k_q^(- tau') \) . $ <eq:source-15>]

]
] <lem:observations-angular>

#proof[
  The coordinates on which $A$ acts belong to the cap for all sufficiently large $n$.
    By (2.9), the joint density of the frame and spectral observation relative to independent Haar and the
    spherical observation law is $L_p$. Condition on the physical capped matrix $W_p$, the physical vector $h_p$,
    and the spectral coordinates of that vector. The spherical observation density is now fixed,
    and $L_p$ depends only on the fixed physical data and spectrum.
    The remaining rotation of the spectral frame in $e^perp ∩ cal(H)_p$ is therefore exactly Haar.
    In physical coordinates, the differentiation direction is $U A tilde(h)_p$,
    which is orthogonal to $h_p$ and has length $\| A tilde(h)_p \|$. The spherical mean in the cap is radial.
    Haar averaging consequently gives
  $ frac(upright(bold(E)) \| cal(R) tilde(phi.alt)_p \( tilde(h)_p \) \|^2, n^(2 \/ 3) p^2) lt.eq
    C upright(bold(E)) [\| A u_p \|^2 frac(p^2 parallel a_p^(upright("err")) parallel^2, k_p)] . $
  Apply (3.7) in expectation and interpolate with the higher moments in (3.5) and the coordinate moments following
    Lemma 9. Hölder’s inequality on probability times logarithmic scale gives (3.9),
    with a smaller positive exponent. No event depending on the unused spectral refinement was inserted before the
    Haar average. ◻
]

== 4 Conditional variance at the exact cap scale <sec:variance>

The observation removes the part of a test that depends on the leading spectral coordinates.
  We now show that its remaining variance costs at most $C p^(- 2)$ times the original heat-bath energy.
  The exponent $2$ is essential: integrating a covariance bound $\( 1 + epsilon \)
  p^(- 2)$ with a fixed $epsilon > 0$ would instead produce a power loss.
  The integrated estimates of Section 3 allow us to replace this fixed error by one that is integrable in
  logarithmic scale.

#thm([Proposition 4.1.])[
  (Conditional variance).  #emph[There is a fixed $p_(*) > 0$ with the following property.
    For every $epsilon > 0$ there are finite constants $C$, $xi > 0$ and disorder events $cal(V)_n$ with $liminf_n
    bb(P) \( cal(V)_n \) gt.eq 1 - epsilon$ such that, on $cal(V)_n$,
    simultaneously for every real function $f$ on the cube and every $r lt.eq p lt.eq p_(*)$,
#[#set math.equation(numbering: n => "(4.1)")
 $ V_p \( f \) := Q_mu \[ "Var" \( f divides h_p \) \] lt.eq C p^(- 2) cal(E) \( f \) +
   C e^(- n^xi) parallel f parallel_oo^2 . $ <eq:source-16>]

 The constants and the disorder event are independent of $f$.
   The inequality also holds componentwise and may be summed for vector-valued functions.]
] <prop:variance-main>

In particular, the remainder is negligible for any fixed polynomial bound on the supremum norm,
  including for disorder-dependent tests. We first prove the requisite covariance improvement,
  then establish a variance bound at a fixed upper scale, and finally integrate the posterior variance identity.

=== 4.1 A sharper upper covariance bound <a-sharper-upper-covariance-bound>

We work initially on the disorder event $cal(G)_n$ of Section 3.
  Its fixed tolerances will be chosen below; no tolerance depends on $n$.
  Probabilities in the next proposition are measured under $upright(bold(P))$ before restriction to this event.

#thm([Proposition 4.2.])[
  (Positive covariance error).  #emph[There are fixed $a \, xi \,
    C > 0$ and a sufficiently small fixed $p_(*) > 0$ such that,
    for each deterministic $p in \[ r \, p_(*) \]$ away from the activation scales,
#[#set math.equation(numbering: n => "(4.2)")
 $ p^2 K_p prec.curly.eq #scale(x: 120%, y: 120%)[\(] 1 + C \( p^a + k_p^(- a) \) #scale(x: 120%, y: 120%)[\)]
   "Id" $ <eq:source-17>]

 outside an event $cal(N)_(n \, p)$ satisfying $upright(bold(P)) \( cal(N)_(n \, p) ∩ cal(G)_n \) lt.eq
   C e^(- n^xi)$. The exceptional event may depend on $p$; its probability bound has common constants for the
   entire scale range. By Fubini’s theorem the same bound holds after integration in $d log p$,
   with a possibly smaller $xi$.]
] <prop:variance-curvature>

The gain comes from comparing a small cap to a larger one.
  The radial covariance deficit permits us to put all positive errors in the tangent space of the parent field.
  Their restriction to the much smaller child space is then controlled by the unused Haar rotation.

Fix a small constant $gamma > 0$, a child scale $c$, and a parent scale $p$ such that $x =
  c \/ p in \[ gamma \, 2 gamma \]$. Put $Delta = B_p - B_c$.
  Conditional on $h_c$, the parent field has the transition law

$ d sans(T)_(c \, p \, h_c) \( y \) =
  frac(e^(phi.alt_p \( y \)) thin d N \( h_c \, Delta \) \( y \), integral e^(phi.alt_p \( z \)) thin d N \(
  h_c \, Delta \) \( z \)) . $

The Gaussian is taken on the positive-increment space. The observation precision increment,
  compressed to the child space, is $Delta_c = \( P_c Delta P_c \) \|_(cal(H)_c) = \( 1 - x^2 \) p^2 "Id"$.
  Writing $\[ M \]_(cal(H)_c)$ for this compression of any operator $M$,
  differentiation of the Gaussian convolution gives

#[#set math.equation(numbering: n => "(4.3)")
 $ K_c = Delta_c^(- 1) \[ "Cov"_(sans(T)_(c \, p \, h_c)) \( h_p \) \]_(cal(H)_c) Delta_c^(- 1) -
   Delta_c^(- 1) . $ <eq:source-18>]

#thm([Lemma 4.3.])[
  (An annular extension for the transition).  #emph[Choose $eta > 0$ sufficiently small compared with $gamma^2$,
    then the coarse curvature tolerance $epsilon_0$ sufficiently small compared with $eta$.
    The annulus width $s_0$ and the fixed upper scale may be chosen so that the following holds on $cal(G)_n$.
    For every child field with $\| alpha_c \( h_c \) \| lt.eq s_0 c^2$,
    the parent potential has an extension $overline(phi.alt)_p$ with upper Hessian bound $\( 1 + eta \) p^(- 2)
    "Id"$ that agrees with $phi.alt_p$ near $\| alpha_p \| lt.eq s_0 p^2 \/ 2$.
    Under both the true transition and the transition obtained by using $overline(phi.alt)_p$,
    the complement of this agreement region has probability at most $C e^(- a_1 k_p)$.
    The same bound holds with any fixed polynomial moment of $parallel h_p parallel \/ \( p^2 M_p \)$ inserted,
    after decreasing $a_1 > 0$.]
] <lem:variance-extension>

#proof[
  We give the construction and its tail comparison, following the cap extension method of #cite(label("CM"))
    Proposition 16.1. On $\| alpha_p \| lt.eq 3 s_0 p^2 \/ 4$, take the infimum of the quadratics
  $ phi.alt_p \( z \) + nabla phi.alt_p \( z \) dot.op \( y - z \) + frac(1 + eta, 2 p^2) parallel y - z parallel^2 . $
  Each of these supports lies above $phi.alt_p$ on that smaller annulus.
    Choose $s_0$ small compared with $eta$ and $gamma^2$. The radial buffer between the smaller and larger annuli
    then determines a fixed $beta_(upright("buf")) > 0$ such that every segment starting in the smaller annulus
    and of length at most $beta_(upright("buf")) p^2 M_p$ remains in the larger one.
    For such pairs $y \, z$, the supporting inequality follows by integrating the coarse Hessian bound along their
    segment. For $d = y - z$ with $parallel d parallel gt.eq beta_(upright("buf")) p^2 M_p$,
    freeze the spherical saddle at $z$. The frozen Gaussian bound bounds the spherical logarithmic increment by
    the quadratic with Hessian $\( p^2 + alpha_p \( z \) \)^(- 1) "Id"$, its saddle gradient,
    and a bounded density error. The static value and gradient errors from Lemma 8 are at most $epsilon.alt_v
    k_p$ and $epsilon.alt_g M_p$. Relative to $parallel d parallel^2 \/ p^2$, their combined contribution,
    including the density error, is at most
  $ frac(2 epsilon.alt_v + C \/ k_p, beta_(upright("buf"))^2) + epsilon.alt_g / beta_(upright("buf")) . $
  The frozen Hessian is at most $\( 1 + C s_0 \) p^(- 2) "Id"$.
    Thus, after choosing $s_0$, then $beta_(upright("buf"))$, then the static errors,
    the excess quadratic term dominates this residual for all sufficiently large $n$.
    This proves the supporting property, and the infimum is a semiconcave extension agreeing on the smaller annulus.
  For the transition tails freeze instead the child saddle $alpha = alpha_c \( h_c \)$.
    As reference use the Gaussian transition tilted by the parent quadratic $parallel y
    parallel^2 \/ \( 2 \( p^2 + alpha \) \)$ with no linear term.
    Writing $R_u = R_(u \, alpha)$, its law is characterized by
  $ R_p h_p tilde.op N \( R_c h_c \, R_c - R_p \) \, wide R_c^(- 1) = R_p^(- 1) - Delta . $
  Since the child saddle satisfies its norm constraint, the expected squared norm of $h_p$ is
    $ell_p \( alpha \)^2$. Its covariance norm is at most $C gamma^(- 2) p^2$.
    Therefore deviations in radius by $v p^2 M_p$ cost
  $ C exp \( - a_0 gamma^2 k_p v^2 \) \, wide v gt.eq C \( gamma sqrt(k_p) \)^(- 1) . $
  The radius $ell_p \( alpha \)$ lies strictly inside the parent agreement annulus, because $\| alpha \| lt.eq s_0 c^2$.
  Calibrate the reference quadratic to the spherical potential at this radius.
    On a bounded range of scaled radii the true potential is at most the reference quadratic plus $epsilon.alt
    k_p + O \( 1 \)$, with arbitrarily small fixed $epsilon.alt > 0$,
    by the frozen norm-density bound and static comparison. Outside a sufficiently large bounded range,
    the zero-field projection tail gives
  $ phi.alt_p \( y \) - phi.alt_p \( 0 \) lt.eq C k_p (1 + (frac(parallel y parallel, p^2 M_p))^(6 \/ 5)) . $
  This follows by integrating the tail $exp \( - a k_p v^6 \)$ against the linear field tilt.
    Its growth is absorbed by the reference quadratic. For the extension,
    use the support centered at the point of radius $ell_p \( alpha \)$ in the direction of $y$.
    At radial distance $v p^2 M_p$ its excess above the reference is at most
  $ epsilon.alt k_p + epsilon.alt k_p v + C \( eta + s_0 \) k_p v^2 + O \( 1 \) . $
  Choose $eta + s_0$ small compared with $gamma^2$, and choose $epsilon.alt$ after the fixed gap to the boundary
    of agreement. These errors are strictly smaller than the Gaussian deviation cost outside agreement.
  The normalizing integrals relative to the reference are bounded below by $exp \( - epsilon.alt' k_p \)$ with any
    needed fixed $epsilon.alt' > 0$. Indeed integrate over a sufficiently thin fixed relative shell around
    $ell_p \( alpha \)$. Both potentials agree there, their values at the central radius are given by static
    comparison, and their gradients are bounded in units of $M_p$.
    Gaussian concentration gives a positive lower bound for the reference mass of this shell for large $n$.
    This proves the asserted transition tails; polynomial moments are absorbed by the same Gaussian deviation
    estimate and the subquadratic bound above. ◻
]

The extension permits Brascamp–Lieb’s covariance inequality #cite(label("BrascampLieb1976")) to be used in the
  Gaussian convolution. After whitening, the transition has a fixed strict log-concavity margin depending on
  $gamma$, because $Delta prec.curly.eq \( 1 - x^2 \) p^2 "Id"$ and $eta lt.double gamma^2$.
  If $K$ denotes the extended Hessian, this inequality bounds its covariance by the expectation of

$ Delta^(1 \/ 2) \( "Id" - Delta^(1 \/ 2) K Delta^(1 \/ 2) \)^(- 1) Delta^(1 \/ 2) . $

Mollification justifies this formula for the semiconcave extension.
  Lemma 18 then replaces the extended Hessian by the true one inside agreement and replaces the extended
  transition by the true transition, with exponentially small errors.
  The covariance comparison includes the means: Cauchy–Schwarz and the polynomial moment tail bound control the
  difference of first and second moments. In (4.3), only $Delta_c$ is inverted outside this expression,
  so newly activated directions of arbitrarily small precision cause no loss.

#thm([Lemma 4.4.])[
  (Removing the radial error).  #emph[On the coarse annulus, let $D = p^2 K_p - "Id"$, $e =
    h_p \/ parallel h_p parallel$, $z = D_(perp e)$, and define, on $e^perp$,
$ E_p = \( D_(perp perp) + z z^(sans(T)) \/ \| D_(e e) \| \)_(+) \, $

 extended by zero on $e$. Put $s_p^(+) = parallel D_(+) parallel$. Then $D prec.curly.eq E_p$ and
#[#set math.equation(numbering: n => "(4.4)")
 $ parallel E_p parallel lt.eq C s_p^(+) \, wide frac("Tr" E_p, k_p) lt.eq
   C frac(parallel D parallel_(upright(F)), sqrt(k_p)) + C / k_p . $ <eq:source-19>]

]
] <lem:variance-radial>

#proof[
  The coarse radial deficit gives $D_(e e) lt.eq - epsilon_1 < 0$.
    For each transverse vector, maximize the quadratic form of $D$ over its radial coordinate.
    The resulting form is $D_(perp perp) + z z^(sans(T)) \/ \| D_(e e) \|$, proving $D prec.curly.eq E_p$.
    Since $K_p succ.curly.eq 0$ and $p^2 K_p prec.curly.eq \( 1 + epsilon_0 \) "Id"$,
    both $D$ and the maximizing radial coordinate for a unit transverse vector are bounded by constants.
    Comparing that vector with $D prec.curly.eq s_p^(+) "Id"$ proves the norm estimate.
    The trace of the rank-one correction is bounded, while the trace of the positive part of $D_(perp perp)$ is at
    most $sqrt(dim cal(H)_p) thin parallel D parallel_(upright(F))$. This proves (4.4). ◻
]

Define $E_p = 0$ outside the coarse annulus, and also whenever the local covariance inequalities needed in
  Lemma 19 fail. This definition uses only the physical parent data $\( W_p \, h_p \)$ and the spectrum.
  In particular, it is defined and bounded before imposing $cal(G)_n$.
  On that event, the local failures never occur on the annulus.
  By choosing $epsilon_0$ small enough, we have $parallel E_p parallel lt.double gamma^2$.

Insert $K_p prec.curly.eq p^(- 2) \( "Id" + E_p \)$ in the covariance comparison.
  The baseline $p^(- 2) "Id"$ gives $c^(- 2) "Id"$ in (4.3).
  For the correction, expand the inverse around $"Id" - Delta \/ p^2$.
  Its inverse has norm at most $x^(- 2)$; because $parallel E_p parallel lt.double x^2$,
  the whole positive correction is at most twice the first insertion in quadratic-form order.
  On the child subspace the two outer inverse factors are scalars. Multiplication by $c^2$ yields

#[#set math.equation(numbering: n => "(4.5)")
 $ s_c^(+) lt.eq C x^(- 2) sans(T)_(c \, p \, h_c) \[ parallel P_c E_p P_c parallel \] +
   C_gamma e^(- a_1 k_p) $ <eq:source-20>]

for every child field in its annulus. The first constant is absolute.

#thm([Lemma 4.5.])[
  (Compression by the unused frame).  #emph[For $x = c \/ p in \[ gamma \, 2 gamma \]$,
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel P_c E_p P_c parallel lt.eq C (frac("Tr" E_p, k_p) + x^3 parallel E_p parallel) $ <eq:source-21>]

 outside a set of $upright(bold(P))$-probability at most $C exp \( - a_gamma k_p \)$.
   This is an unconditional assertion with respect to the unused spectral refinement;
   its exceptional set may afterwards be intersected with $cal(G)_n$.]
] <lem:variance-compression>

#proof[
  Condition on $W_p$, the physical field $h_p$, and its spectral coordinates, as in Lemma 15.
    The remaining frame in $e^perp ∩ cal(H)_p$ is Haar, and $E_p$ is fixed under this conditioning.
    For a uniformly rotating unit vector $v$ in that space, the Gaussian representation of the uniform sphere gives
  $ bb(P) (v^(sans(T)) E_p v > frac(C \( "Tr" E_p + t parallel E_p parallel \), k_p)) lt.eq
    C \( e^(- t) + e^(- c_0 k_p) \) . $
  The same bound applies to a fixed vector of norm at most one.
    Choose a constant-resolution net of the child unit sphere and project it onto $e^perp$.
    Its cardinality is at most $exp \( C dim cal(H)_c \) lt.eq exp \( C x^3 k_p \)$.
    With $t = C_2 x^3 k_p$, a sufficiently large $C_2$ pays for the net;
    taking $gamma$ sufficiently small also pays for the second exponential term.
    The net approximation for a positive quadratic form proves (4.6). ◻
]

#proof[
  Let $hat(s)_p$ be $s_p^(+)$ on the full coarse annulus and zero outside it. We now restrict to $cal(G)_n$.
    Average (4.5) over $c \/ \( 2 gamma \) lt.eq p lt.eq c \/ gamma$ with normalized logarithmic measure,
    and condition on $W$ and the observation path through $c$.
    Combining (4.4) and (4.6), the operator-norm term has coefficient at most $C x^(- 2) x^3 lt.eq C gamma$.
    Choose $gamma$ so that this coefficient, denoted by $theta$, is less than $1 \/ 2$.
    The trace term is controlled by Cauchy–Schwarz and the integrated Frobenius estimate (3.8). We obtain
  #[#set math.equation(numbering: n => "(4.7)")
   $ hat(s)_c lt.eq theta "avg"_(c \/ \( 2 gamma \) lt.eq p lt.eq c \/ gamma)
     upright(bold(E)) \[ hat(s)_p divides W \, cal(F)_c \] + C_gamma \( c^b + k_c^(- b) \) + "err"_c \,
     $ <eq:source-22>]
  where $b > 0$, $cal(F)_c$ is the observation filtration, and $"err"_c gt.eq 0$ satisfies
  $ upright(bold(E)) \[ upright(bold(1))_(cal(G)_n) "err"_c \] lt.eq C e^(- n^xi) $
  uniformly at deterministic scales. To verify the exceptional terms in this assertion,
    first apply (3.8) to the parent scale integral before taking its conditional expectation.
    Its failures and those of (4.6) have exponential probability and at most polynomial cost.
    Since $W$ is included in the conditioning, the indicator of $cal(G)_n$ commutes with that conditional
    expectation. No assertion of Haar independence conditional on $cal(G)_n$ is used.
    If the child field is outside its annulus, the inequality holds by truncation.
  Choose $a lt.eq b$ sufficiently small that $theta gamma^(- a) < 1$.
    For a sufficiently large $C'$, the function $b_0 \( c \) =
    C' \( c^a + k_c^(- a) \)$ dominates its parent average multiplied by $theta$,
    plus $C_gamma \( c^b + k_c^(- b) \)$, with a fixed margin.
    It also dominates the coarse constant bound at the upper scales where the parent interval no longer fits below
    $p_(*)$. Take positive parts above $b_0$ in (4.7), use conditional Jensen,
    and average over $upright(bold(P))$ with $upright(bold(1))_(cal(G)_n)$.
    At each iteration the scale increases by at least $\( 2 gamma \)^(- 1) > 1$,
    so there are only $O \( log n \)$ generations; their errors sum to at most $C e^(- n^xi) sum_(j gt.eq 0)
    theta^j$. Thus
  $ upright(bold(E)) \[ upright(bold(1))_(cal(G)_n) \( hat(s)_c - b_0 \( c \) \)_(+) \] lt.eq C e^(- n^xi) . $
  Enlarging $C'$ and applying Markov’s inequality proves the asserted probability bound,
    since $b_0 \( c \)$ is bounded below by an inverse polynomial on the scale range.
    Lemma 9 removes the truncation. All bounds were uniform at deterministic scales,
    so Fubini’s theorem gives their integrated version. ◻
]

=== 4.2 The variance bound at a fixed upper scale <the-variance-bound-at-a-fixed-upper-scale>

We next obtain the starting variance estimate from the fixed-scale continuation in #cite(label("CM"))
  Section 19.4. We record precisely why its entropy estimate applies to the perturbations needed here.

#thm([Lemma 4.6.])[
  (The fixed-scale starting bound).  #emph[On disorder events of probability tending to one,
    for a sufficiently small fixed $p_(upright("top")) > 0$ and every real function $f$ on the cube,
$ V_(p_(upright("top"))) \( f \) lt.eq C cal(E) \( f \) + C e^(- a n) parallel f parallel_oo^2 . $

 The event and constants are independent of $f$.]
] <lem:variance-start>

#proof[
  The continuation in #cite(label("CM")) Section 19.4 increases the observation precision from
    $B_(p_(upright("top")))$ through finitely many cap intervals, a bridge to a classical field,
    and a bounded-duration continuation to a diagonal-interaction endpoint.
    For an initial change of spin law from $mu$ to $nu$, let $nu_s \, mu_s$ be the two posteriors, let $l_s =
    D \( nu_s bar.v.double mu_s \)$, and put $H \( s \) = E_(Q_nu) l_s$. On this continuation, the estimate used is
  #[#set math.equation(numbering: n => "(4.8)")
   $ dot(H) \( s \) gt.eq - C H \( s \) - e^(- a n) . $ <eq:variance-entropy-ode>]
  This is #cite(label("CM")) Equation (19.17). Its proof uses upper bounds on observation likelihoods and
    posterior entropy tails, rather than a support restriction on the posterior.
    We explain its application when the initial density lies between $1 \/ 2$ and $2$.
    Every observation likelihood then has the same bounds, every posterior density ratio lies between $1 \/
    4$ and $4$, and $l_s lt.eq log 4$.
  At the classical part, the ordinary posterior covariance is bounded on a fixed normalized field neighborhood
    outside an event of probability $e^(- a n)$; farther along the continuation it is bounded for every field.
    The linear entropy inequality in that neighborhood gives $parallel m_nu - m_mu parallel^2 lt.eq
    C l_s$ whenever $l_s$ is bounded: a trial field shift of size proportional to $sqrt(l_s)$ fits the
    neighborhood. The bounded density ratios pay for the ordinary exceptional paths.
  To propagate this mean estimate across a preceding cap or bridge interval,
    use the approximate gradient $g_s$ furnished by the extended potential there.
    The transport identity #cite(label("CM")) Lemma 18.3 holds under either initial law.
    If $U$ is its linear transport from the current time $s$ to the end of the interval, subtraction gives,
    for a vector $v$ in the current rate subspace,
  $ chevron.l v \, m_(nu \, s) - m_(mu \, s) chevron.r =  & E_(Q_(nu \, h)^(upright("cont"))) chevron.l U v \,
    m_(nu \, upright("end")) - m_(mu \, upright("end")) chevron.r\
 & + \( E_(Q_(nu \, h)^(upright("cont"))) - E_(Q_(mu \, h)^(upright("cont"))) \) chevron.l U v \,
   m_(mu \, upright("end")) - g_(upright("end")) chevron.r . $
  Here the two continuation laws live on the same path space,
    and the same path function $U$ is used in both expectations.
    Its operator norm is bounded by a fixed constant on these fixed intervals.
    At agreement, the terminal approximation error in the tested subspace has bounded norm. Truncate it there.
    Data processing gives $D \( Q_(nu \, h)^(upright("cont")) bar.v.double Q_(mu \, h)^(upright("cont")) \) lt.eq
    l_s$, so Pinsker’s inequality bounds the second term by $C sqrt(l_s) parallel v parallel$.
  The complements have exponentially small averaged squared cost.
    Indeed, for any nonnegative terminal cost $W_1$, the bounded full-path and prefix likelihoods give both
  $ E_(Q_nu) E_(Q_(nu \, h)^(upright("cont"))) W_1 lt.eq C E_(Q_mu) W_1 \, wide
    E_(Q_nu) E_(Q_(mu \, h)^(upright("cont"))) W_1 lt.eq C E_(Q_mu) W_1 . $
  Apply these inequalities to the polynomially weighted ordinary exceptions in the terminal approximation
    estimates of #cite(label("CM")) Section 19.4. Conditional Cauchy–Schwarz controls the first transport term by
    the terminal squared mean difference. Taking the supremum over unit $v$ costs no dimension factor because all
    the bounds are norm bounds uniform in $v$. Since terminal expected posterior entropy is at most $H \( s \)$,
    backward induction through the finite list yields
  $ E_(Q_nu) parallel P_(upright("rate")) \( m_(nu \, s) - m_(mu \, s) \) parallel^2 lt.eq C H \( s \) + C e^(- a n) . $
  The observation entropy identity #cite(label("CM")) Lemma 19.2, with bounded precision rates on these intervals,
    now proves (4.8). This also proves that its constants apply uniformly to the bounded-density perturbations below.
  Normalize $parallel f parallel_oo lt.eq 1$, set $eta = e^(- n^(1 \/ 3))$, and take
  $ frac(d nu, d mu) = frac(1 + eta f, 1 + eta mu f) . $
  Every path likelihood and every posterior density ratio is bounded by fixed constants.
    Taylor’s formula for relative entropy gives, uniformly at every posterior,
  $ c eta^2 "Var"_(mu_s) \( f \) lt.eq D \( nu_s bar.v.double mu_s \) lt.eq C eta^2 "Var"_(mu_s) \( f \) . $
  Thus $H \( s \)$ is comparable to $eta^2 V_s \( f \)$. Integrating (4.8) over a bounded duration and dividing by
    $eta^2$ gives $V_(p_(upright("top"))) \( f \) lt.eq C V_(upright("end")) \( f \) + C e^(- a' n)$.
    At the endpoint the posterior is a product measure, so variance tensorization and conditional-variance
    contraction give
  $ V_(upright("end")) \( f \) lt.eq E sum_i "Var" \( f divides X_(- i) \, upright("endpoint observations") \)
    lt.eq sum_i mu \[ "Var" \( f divides X_(- i) \) \] = cal(E) \( f \) . $
  Rescaling $f$ proves the lemma. ◻
]

=== 4.3 Integration of the posterior variance identity <integration-of-the-posterior-variance-identity>

The passage from a posterior covariance bound to a variance bound uses the localization mechanism of
  #cite(label("EldanKoehlerZeitouni2022")) Lemma 9, arXiv version 2.
  For the deterministic precision path considered here, it takes the following form.

#proof[
  For fixed $W$, the posterior mean of $f$ is a martingale in the observation filtration.
    Its diffusion coefficient, with parameter $t = p^2$, is $P_p "Cov" \( X \, f divides h_p \)$. Consequently
  $ - frac(d, d \( p^2 \)) V_p \( f \) = Q_mu parallel P_p "Cov" \( X \, f divides h_p \) parallel^2 lt.eq
    Q_mu #scale(x: 120%, y: 120%)[\[] parallel K_p parallel "Var" \( f divides h_p \) #scale(x: 120%, y: 120%)[\]] . $
  Integrate the exceptional probabilities in Proposition 17 in logarithmic scale,
    then apply Markov’s inequality and Lemma 6. On disorder events of probability arbitrarily close to one,
    intersected with $cal(G)_n$, their total ordinary path mass is at most $C e^(- n^xi)$.
    The same statement holds for the annulus exceptions used with the coarse bound between $p_(*)$ and
    $p_(upright("top"))$. These events are chosen before, and independently of, $f$.
  On the exceptional paths the elementary estimate $parallel P_p "Cov" \( X \, f divides h_p \) parallel^2 lt.eq
    C n parallel f parallel_oo^2$ suffices. On the remaining paths, put $epsilon.alt_p =
    C \( p^a + k_p^(- a) \)$ below $p_(*)$ and use the fixed coarse tolerance above it.
    Backward integration from $p_(upright("top"))$ gives an amplification bounded by
  $ exp (integral_(p^2)^(p_(upright("top"))^2) frac(1 + epsilon.alt_(sqrt(t)), t) thin d t) lt.eq C p^(- 2) \, $
  because
  $ integral_r^(p_(*)) \( p^a + k_p^(- a) \) thin d log p lt.eq C \, $
  and the remaining scales form a fixed interval bounded away from zero.
    The amplification and the elementary exceptional-path costs are polynomial in $n$;
    they are absorbed by decreasing $xi$. Lemma 21 therefore gives (4.1).
    The same integrated exceptional event works for every lower endpoint $p$,
    so the assertion is simultaneous in scale as well as in the test. ◻
]

== 5 The gradient on the conditioned edge measure <sec:gradient>

The variance estimate of Proposition 16 says that a function of bounded rescaled energy is almost determined by a
  sufficiently fine cap observation. We now identify the derivatives of the resulting functions of the edge
  coordinates. There are two issues. The measure $Pi$ is supported on a renormalized quadratic constraint,
  so its Sobolev domain must first be specified. We then show that the slopes of the observation smoothings
  converge to derivatives in this domain. The energy bound obtained here has a finite constant;
  Section 6 will determine the exact coefficient.

Throughout the first part of this section, fix a realization of the edge parameters for which Proposition 4 holds.
  Thus $l_a = \( g_a + b \)^(- 1) > 0$, $sum_a l_a = oo$, and $sum_a l_a^2 < oo$.
  All assertions about $Pi$ below are deterministic for this realization.

=== 5.1 Angular derivatives and the form domain <angular-derivatives-and-the-form-domain>

A #emph[smooth cylinder function] is a smooth function of finitely many coordinates.
  We initially take it compactly supported in those coordinates.
  For a skew-symmetric matrix $A$ with finitely many nonzero entries, set $cal(R)_A = \( A x \) dot.op partial_x$.
  We say that $\( F \, G \) in L^2 \( Pi \) times L^2 \( Pi \; ell^2 \)$ satisfies the angular weak identities if

#[#set math.equation(numbering: n => "(5.1)")
 $ integral psi thin \( A x \) dot.op G thin d Pi = - integral F {cal(R)_A psi -
   psi sum_a \( A x \)_a \( g_a + b \) x_a} thin d Pi $ <eq:source-23>]

for every such $A$ and every smooth compact cylinder test $psi$ whose coordinate set contains the indices of $A$.
  Finite rotations preserve the quadratic constraint. Their action on the product Gaussian density gives the
  second term in braces; the contribution involving $b$ cancels by skew-symmetry.
  Consequently, smooth cylinders satisfy (5.1) with their Euclidean gradients.

#thm([Proposition 5.1.])[
  (The conditioned gradient).  #emph[The Euclidean gradient on smooth compact cylinder functions is closable from
    $L^2 \( Pi \)$ to $L^2 \( Pi \; ell^2 \)$. Its closed graph consists exactly of the pairs satisfying (5.1).
    In particular, the vector $G$ in that identity is unique; we denote it by $nabla F$.]
  #emph[The closed form
$ cal(E)_Pi \( F \) = integral \| nabla F \|^2 thin d Pi $

 has kernel equal to the constants. Each coordinate $x_a$ belongs to its domain and satisfies $nabla x_a = e_a$,
   so that $cal(E)_Pi \( x_a \) = 1$.]
] <prop:gradient-domain>

We first verify closability and then prove the density assertion,
  which is the substantial part of the proposition. By the polar disintegration in Proposition 4,
  the law of the coordinates outside a sufficiently large fixed initial block is absolutely continuous with
  respect to their product Gaussian law. Under that product law,

$ sum_(a lt.eq N) x_a^2 = sum_(a lt.eq N) l_a + sum_(a lt.eq N) \( x_a^2 - l_a \) arrow.r oo wide
  upright("almost surely") . $

Thus $x in.not ell^2$ also holds $Pi$-almost surely. If $G$ and $G'$ both satisfy (5.1) for the same $F$,
  the coordinate rotations give

$ x_i \( G_j - G'_j \) = x_j \( G_i - G'_i \) wide upright("for all ") i \, j \, $

outside one null set. Their difference is therefore proportional to $x$ and must vanish because it belongs to
  $ell^2$. The angular graph is closed: every test in (5.1) has bounded coefficients on its finite coordinate
  support, so the identity passes to strong limits in $L^2 \( Pi \) times L^2 \( Pi \; ell^2 \)$.
  A closed graph containing the cylinder gradient and having a unique vector component proves closability.

===== 5.1.1 Reduction to a product chart. <reduction-to-a-product-chart.>

Let $\( F \, G \)$ satisfy (5.1). Conditional on the complement of a finite block,
  its coordinates lie on a sphere of fixed radius with a smooth positive tilted density.
  Disintegrating (5.1), including tests in outside coordinates,
  gives the ordinary tangential weak identities on almost every such sphere.
  The rotation fields span its tangent spaces. The usual weak chain and product rules therefore apply.

Smooth truncation first reduces to bounded $F$, with convergence of both $F$ and $G$.
  Fix an initial block of size $m > 3$, and write its radius as $R$.
  We may next localize to an annulus $epsilon.alt < R < M$.
  Near zero, the marginal density bound of Proposition 4 gives $Pi \( R lt.eq epsilon.alt \) =
  O \( epsilon.alt^m \)$. A cutoff with derivative $O \( epsilon.alt^(- 1) \)$ thus has energy
  $O \( epsilon.alt^(m - 2) \)$ when multiplied by bounded $F$.
  At infinity, a cutoff with derivative $O \( M^(- 1) \)$ has vanishing cost.
  The corresponding products with $G$ converge by dominated convergence. It suffices to approximate each localized pair.

Write the first block as $R theta.alt$, with $theta.alt in S^(m - 1)$, and put $y = \( x_i \)_(i > m)$.
  The constraint gives

$ R^2 = C - S_y \, wide C = D \( b \) + sum_(i lt.eq m) l_i \, wide S_y = sum_(i > m) \( y_i^2 - l_i \) . $

Relative to uniform angle and the product Gaussian law of $y$, the conditioned measure has density proportional to

$ upright(bold(1))_({ S_y < C }) R^(m - 2) exp (- R^2 / 2 sum_(j lt.eq m) theta.alt_j^2 / l_j) . $

On the chosen annulus this density is bounded above and below by positive constants.
  Decompose the first block of $G$ into radial and transverse components $G_R \, G_theta.alt$,
  and let $f$ be the expression of the localized $F$ in this chart.
  With $a = - G_R \/ \( 2 R \)$, the finite-block identities give

#[#set math.equation(numbering: n => "(5.2)")
 $ nabla_theta.alt f = R G_theta.alt \, wide partial_(y_i) f - 2 y_i a = G_i quad \( i > m \) . $ <eq:source-24>]

To justify the weak tail identity, condition on the coordinates outside the union of the first block and ${ i }$.
  On this $\( m + 1 \)$-coordinate sphere, varying $y_i$ at fixed angle has tangent vector

$ V_i = e_i - y_i / R^2 sum_(j lt.eq m) x_j e_j . $

It is a smooth linear combination of the $i$–$j$ rotation fields on $R > 0$,
  and its pairing with $G$ is $G_i - \( y_i \/ R \) G_R = G_i + 2 y_i a$.
  The conditional density is smooth and positive on each compact chart with $R > 0$,
  so multiplying tests by its reciprocal converts the tangential weak identity to the ordinary weak coordinate
  identity. Disintegration then gives (5.2) in the product chart,
  with Gaussian integration by parts for Gaussian tests. The radial cutoff permits extension by zero without a
  boundary term. The quantities $f$, $a$, $nabla_theta.alt f$,
  and the compensated derivative vector $\( partial_(y_i) f - 2 y_i a \)_(i > m)$ are square integrable for angle
  times product Gaussian measure.

The domain question has now become an approximation problem for the compensated tail derivatives in (5.2).
  The following lemma supplies exactly this approximation; the angular variable will be handled afterward by
  ordinary spherical harmonics.

#thm([Lemma 5.2.])[
  (Approximation with a compensated derivative).  #emph[Let $gamma = ⨂_(i gt.eq 1) sans(N) \( 0 \, l_i \)$,
    where $l_i > 0$, $sum_i l_i = oo$ and $sum_i l_i^2 < oo$, and let $S_y = sum_i \( y_i^2 - l_i \)$.
    Suppose that $f \, a in L^2 \( gamma \)$ and $G in L^2 \( gamma \; ell^2 \)$ satisfy,
    coordinatewise in the weak sense,
$ partial_(y_i) f - 2 y_i a = G_i . $

 Then $\( f \, a \, G \)$ is a limit in these three spaces of triples
$ (P \, partial_s P \, #scale(x: 120%, y: 120%)[\(] partial_(y_i) P #scale(x: 120%, y: 120%)[\)]_i) \|_(s = S_y) \, $

 where $P = P \( s \, y_1 \, dots.h \, y_N \)$ is a polynomial.
   The derivatives in this display treat $s$ and the individual $y_i$ as independent variables.]
] <lem:gradient-compensated>

#proof[
  Expand $f$ and $a$ in the normalized product Hermite basis.
    We index the basis by finitely supported multi-indices $beta$ and write the coefficients as $f_beta \,
    a_beta$. Gaussian integration by parts gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ \( G_i \)_beta = sqrt(beta_i + 1) / sqrt(l_i) f_(beta + e_i) -
     2 sqrt(l_i) (sqrt(beta_i) thin a_(beta - e_i) + sqrt(beta_i + 1) thin a_(beta + e_i)) . $ <eq:source-25>]
  The formula is valid for weak derivatives: one first uses finite-coordinate Hermite tests with cutoffs,
    then removes the cutoffs by Cauchy–Schwarz.
  ===== 5.1.2 Reduction to one chaos grade. <reduction-to-one-chaos-grade.>
  Group the unknowns as pairs $\( f^(\( d \)) \, a^(\( d - 2 \)) \)$,
    where the superscript denotes Hermite chaos order and negative orders are omitted.
    The derivative of $f^(\( d \))$ and the creation part of $2 y_i a^(\( d - 2 \))$ both have order $d -
    1$ and must be kept together. The remaining, annihilation part of $2 y_i a^(\( d \))$ has summed norm at most
  $ (4 sum_(i \, beta) l_i \( beta_i + 1 \) \| a_(beta + e_i) \|^2)^(1 \/ 2) lt.eq
    C sqrt(d) thin parallel a^(\( d \)) parallel_2 . $
  Here $sup_i l_i < oo$ follows from $sum_i l_i^2 < oo$. It follows from (5.3) that each fixed-grade pair has a
    square-summable compensated derivative.
  These pairs also approximate the full triple in its graph norm.
    To see this without separating divergent creation terms, multiply the grade-$d$ pair by $e^(- s d)$,
    with $s > 0$. Relative to damping the output of (5.3) by $e^(- s d)$ in order $d - 1$,
    the only discrepancy is the annihilation term, with multiplier $e^(- s \( d + 2 \)) - e^(- s d)$.
    Its squared norm is bounded by
  $ C s^2 sum_d d e^(- 2 s d) parallel a^(\( d \)) parallel_2^2 lt.eq C s thin parallel a parallel_2^2 \, $
  which tends to zero. For fixed $s$, truncating the damped grades then converges in all three norms.
    It remains to approximate one grade.
  ===== 5.1.3 The array represented by a fixed grade. <the-array-represented-by-a-fixed-grade.>
  Fix $d$ and the finite set $O$ of coordinates with odd multiplicity.
    The relevant coefficients of $f$ have indices $upright(bold(1))_O + 2 j$,
    where $j$ is a count vector with $\| j \| = h = \( d - \| O \| \) \/ 2$; those of $a$ use $\| j \| = h - 1$.
    Different parity sets are orthogonal in the norms of the common derivative–creation terms,
    so finitely many such sets suffice for approximation. If $h = 0$,
    only a finite-coordinate monomial is involved. Suppose henceforth that $h gt.eq 1$.
  Set
  $ c \( j \) = product_i l_i^(j_i) frac(sqrt(\( 2 j_i \) !), j_i !) \, wide f_(upright(bold(1))_O + 2 j) =
    c \( j \) u \( j \) \, wide a_(upright(bold(1))_O + 2 j) = c \( j \) v \( j \) . $
  View $u$ and $v$ as symmetric arrays on $h$ and $h - 1$ ordered places. Give each place mass $mu_i = l_i^2$.
    The coefficient norms are equivalent to the resulting product $L^2$ norms:
    the ordered-place multiplicities and the displayed factorials have ratios bounded above and below for fixed
    $h$ and $O$. This comparison includes repeated indices.
  For $i in.not O$, the identity
  $ sqrt(2 j_i + 2) / sqrt(l_i) c \( j + e_i \) = 2 sqrt(l_i) sqrt(2 j_i + 1) thin c \( j \) $
  shows that the common term in (5.3) is exactly a multiple of $u \( j + e_i \) - v \( j \)$.
    Its norm is therefore equivalent, again with fixed-grade constants, to the sum over places of
  $ integral sum_i l_i thin \| u \( i \, i_2 \, dots.h \, i_h \) -
    v \( i_2 \, dots.h \, i_h \) \|^2 thin d mu \( i_2 \) dots.h.c d mu \( i_h \) . $
  The finitely many indices in $O$ contribute bounded operators in the coefficient norms,
    as does the annihilation term at this fixed grade. We have thus reduced the approximation problem to symmetric
    arrays with a common one-place trace $v$.
  ===== 5.1.4 The sum of the one-place forms. <the-sum-of-the-one-place-forms.>
  For one place, take the base Hilbert space $frak(H) = ell^2 \( mu \)$.
    We include the scalar trace in the form norm by defining
  $ D \( q \) & = { u in frak(H) : upright("there exists ") v in bb(R) upright(" with ") u - v in ell^2 \( l_i \) } \,\
q \( u \) & = \| v \|^2 + sum_i l_i \| u_i - v \|^2 . $
  The trace $v$ is unique because $sum_i l_i = oo$. This is a densely defined closed form.
    Indeed, finite-support sequences belong to $D \( q \)$; and a Cauchy sequence in the form norm has convergent
    traces and convergent deviations, whose coordinatewise limits identify the trace and deviation of its limit in
    $frak(H)$. Replacing the tail of $u$ by its trace proves that eventually constant sequences are a form core.
  On $frak(H)^(⊗ h)$ take the #emph[sum] of the $h$ coordinate forms.
    By the slice description of each coordinate form, its norm on symmetric arrays is precisely,
    up to fixed factors, the norm of $u$, the norm of $v$, and the integrated deviations just obtained.
    In particular, it requires $v$ to belong to the base $\( h - 1 \)$-place Hilbert space;
    it requires no further form regularity of $v$.
  For completeness, let $A_q$ be the nonnegative selfadjoint operator associated with $q$.
    The commuting projections $upright(bold(1))_(\[ 0 \, M \]) \( A_q \)^(⊗ h)$ converge to the identity in the
    norm of the sum form. On their ranges the form is bounded by $h M$ times the squared Hilbert norm.
    Algebraic tensors are dense there, and each factor can in turn be approximated in its one-place form norm by
    eventually constant sequences. This proves that such tensors are a core for the sum form.
    Symmetrizing preserves convergence and identifies the slice traces.
    We may consequently approximate $\( u \, v \)$ by arrays constant in each place outside a finite set.
    This argument does not require traces on intersections of two or more limiting faces.
  ===== 5.1.5 Return to polynomials. <return-to-polynomials.>
  The correspondence is already visible with one place and even parity.
    If $u_i = v$ outside a finite set $E$, the polynomial
  $ P \( s \, y \) = v s + sum_(i in E) \( u_i - v \) \( y_i^2 - l_i \) $
  has $P \( S_y \, y \) = sum_i u_i \( y_i^2 - l_i \)$ and $partial_s P = v$.
    Its compensated derivatives vanish outside $E$. Thus the constant tail of a coefficient array is represented
    by the centered square sum. For several places, its powers give the corresponding tensor coefficients,
    as the following calculation shows.
  Choose a finite set $E$ containing $O$ and all exceptional indices of one of these approximating arrays.
    A symmetric array constant in each place outside $E$ is determined by its value $U_j$ for every count vector
    $j = \( j_i \)_(i in E)$ with $\| j \| lt.eq h$: the remaining $r =
    h - \| j \|$ places can have arbitrary indices outside $E$, including coincident ones. Define
  $ S_(E^c) \( s \, y \) = s - sum_(i in E) \( y_i^2 - l_i \) \, wide M_j \( y \) =
    product_(i in E) y_i^(upright(bold(1))_O \( i \) + 2 j_i) . $
  The degree-$d$ Hermite coefficients of $M_j \( y \) S_(E^c) \( S_y \, y \)^r$ have the prescribed counts $j$ in
    $E$. For outside counts $k$ with $\| k \| = r$, their coefficient is
  $ C_E \( j \) thin r ! product_(i in.not E) l_i^(k_i) frac(sqrt(\( 2 k_i \) !), k_i !) \, wide C_E \( j \) =
    product_(i in E) l_i^(\( upright(bold(1))_O \( i \) + 2 j_i \) \/ 2)
    sqrt(\( upright(bold(1))_O \( i \) + 2 j_i \) !) . $
  This follows directly from the multinomial expansion, and so includes repeated outside indices.
    Multiplying this polynomial by $U_j c \( j \) \/ \( r ! C_E \( j \) \)$,
    and summing over the finitely many $j$, realizes exactly the desired top-grade array $u$.
    Here $c \( j \)$ is restricted to $E$. Differentiation in $s$ replaces $S_(E^c)^r$ by $r S_(E^c)^(r - 1)$.
    Its top coefficients have the same limiting one-place trace, since $r \( r - 1 \) ! = r !$.
    They therefore realize $v$, also by trace uniqueness.
  Every such polynomial pair has a square-summable compensated derivative,
    since differentiation after subtracting $2 y_i partial_s P$ leaves only the finitely many
    individual-coordinate derivatives. All its moments are finite;
    the centered sum $S_y$ has exponential moments in a neighborhood of zero.
    Induction on the grade now removes the lower Hermite grades of these polynomial pairs.
    More explicitly, their lower grades satisfy the same summability identities and, by induction,
    already belong to the polynomial closure. Subtracting their approximants shows that the desired top-grade pair
    lies in that closure. The fixed-grade approximations and the preceding damping argument prove the lemma. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 22.] We can now use Lemma 23.
    Work in the uniform-angle times product Gaussian norm, equivalent to the localized conditioned norm.
    First project onto finitely many spherical harmonics in $theta.alt$;
    the projections converge in the first angular Sobolev norm and commute with the tail identities.
    Apply the lemma to each resulting coefficient. This yields polynomials in $S_y$ and finitely many $y_i$,
    with smooth angular coefficients, converging in $f$, $a$, the compensated derivatives, and the angular derivative.
  Multiply these approximants by a smooth cutoff of $S_y$ supported in a slightly larger radius annulus and equal
    to one on the original support. Under multiplication by $chi \( S_y \)$ the scalar component becomes $chi a +
    chi' f$, while the compensated derivative becomes $chi G$.
    This is continuous in all the norms under consideration. Finally substitute $S_y = C - R^2$.
    The approximants are now genuine cylinder functions in $x$,
    smooth because their first-block radii stay away from zero.
    Their Euclidean gradients have exactly the components in (5.2).
    Ordinary cutoffs in their finitely many other coordinates make them compactly supported,
    with convergence in the same norms. Removing the localizations proves equality of the cylinder closure and the
    angular graph.
  It remains to identify the kernel. If $G = 0$, the restriction of $F$ to almost every finite initial-block
    sphere is constant, since the sphere is connected. Thus $F$ is measurable, modulo null sets,
    with respect to the complement of every sufficiently large initial block.
    This completed tail field is trivial. To check this directly under $Pi$, eliminate one fixed initial block.
    Its tail law has an integrable density with respect to product Gaussian measure.
    Approximating this density and its product with any bounded observable by cylinder functions shows that events
    beyond increasing indices are asymptotically independent of that observable, uniformly over the events.
    An event in every completed tail field is consequently independent of itself and has probability zero or one.
    Hence $F$ is constant. Conversely constants satisfy the angular identities with $G =
    0$ and are in the closed domain by what we have proved.
  The same characterization applies to $x_a$: it is square integrable by Proposition 4,
    and its angular weak gradient is $e_a$. This proves the last assertion. ◻
]

=== 5.2 Observation smoothings and their slopes <observation-smoothings-and-their-slopes>

We return to the finite SK model and use the quenched subsequential convention of Remark 3.
  Write $T = n^(2 \/ 3)$. Consider functions $f = f_n$ such that

$ mu \| f \|^2 + T cal(E) \( f \) lt.eq C \, wide parallel f parallel_oo lt.eq C n^D $

for a fixed exponent $D$. The bounds below hold on disorder sets of arbitrarily high probability,
  with finite constants depending on the set but not on $f$.
  Terms denoted by $o \( 1 \)$ absorb the exponentially small exceptional-path costs multiplied by these
  polynomial bounds. The fixed exponent $D$ affects these vanishing errors, not the constants multiplying the energy.

For the cap observation $h_p$, define

$ F_p \( h_p \) = bb(E) \[ f divides h_p \] \, wide S_p f \( X \) = bb(E) \[ F_p \( h_p \) divides X \] \, wide
  J_p^f \( X \) = n^(1 \/ 3) bb(E) \[ B_p nabla_(h_p) F_p \( h_p \) divides X \] . $

All expectations here are under the ordinary observation law for the fixed disorder.
  The vector $J_p^f$ is expressed in physical coordinates. Recall that
  $u_(p \, a) = \( U^t h_p \)_a \/ \( p^2 n^(1 \/ 3) \)$.

#thm([Lemma 5.3.])[
  (Smoothing estimates).  #emph[For $r lt.eq p lt.eq p_(*)$ in the range of Proposition 16,
#[#set math.equation(numbering: n => "(5.4)")
 $ Q_mu parallel nabla_(u_p) F_p parallel^2 lt.eq C T cal(E) \( f \) + o \( 1 \) \, $ <eq:source-26>]

 and
#[#set math.equation(numbering: n => "(5.5)")
 $ parallel n^(1 \/ 3) \( f - S_p f \) parallel_(L^2 \( mu \)) & lt.eq C p^(- 1) sqrt(T cal(E) \( f \)) + o \( 1 \) \,\
∥n^(1 \/ 3) \( D_i S_p f \)_i - J_p^f∥_(L^2 \( mu \; bb(R)^n \)) & lt.eq C p sqrt(T cal(E) \( f \)) +
  o \( 1 \) . $ <eq:source-27>]

 In particular, $J_p^f$ is bounded in $L^2 \( mu \; bb(R)^n \)$.]
] <lem:gradient-smoothing>

#proof[
  On the active cap, $nabla_(h_p) F_p = P_p "Cov" \( X \, f divides h_p \)$. Conditional Cauchy–Schwarz therefore gives
  $ \| nabla_(h_p) F_p \|^2 lt.eq parallel K_p parallel "Var" \( f divides h_p \) . $
  Combining the covariance bound (2.11), the annulus estimate (3.1), and the variance estimate (4.1),
    and multiplying by the squared change-of-variable factor $p^4 n^(2 \/ 3)$, proves (5.4).
    Conditional Jensen and $parallel B_p parallel lt.eq C p^2$ also bound $J_p^f$.
    The first line of (5.5) follows from the same Jensen inequality applied to $f - F_p \( h_p \)$.
  For the second line, condition on $X$ and write the channel as $h_p = B_p X + B_p^(1 \/ 2) Z$,
    with $Z$ standard Gaussian on the active space. Flipping spin $i$ translates $Z$ by $-
    2 X_i B_p^(1 \/ 2) e_i$. Expand the Gaussian translation in Hermite tensors.
    The degree-one term in the half-difference is the $i$th component of $J_p^f$.
    For the higher degrees, subtract the constant $f \( X \)$ from the translated function.
    The total squared norm of the Hermite coefficients of $n^(1 \/ 3) \( F_p \( h_p \) - f \( X \) \)$,
    averaged over $X$, is at most
  $ C p^(- 2) T cal(E) \( f \) + o \( 1 \) $
  by (4.1). The degree-$j$ contraction into the vector indexed by $i$ has operator norm at most
  $ 2^j / sqrt(j !) parallel B_p parallel^(1 \/ 2) (max_i \( B_p \)_(i i))^(\( j - 1 \) \/ 2) . $
  Indeed its Gram matrix, apart from the displayed scalar and spin signs, is a Schur power of $B_p$;
    the Schur product bound gives the estimate. Since $max_i \( B_p \)_(i i) lt.eq parallel B_p parallel lt.eq
    C p^2$, summing degrees $j gt.eq 2$ costs $O \( p^2 \)$ times the coefficient norm.
    This proves the second line of (5.5) in the unweighted vector norm. ◻
]

=== 5.3 Identification of the limiting derivative <identification-of-the-limiting-derivative>

The static convergence of cube cylinder integrals in Corollary 11 implies that a bounded $L^2 \( mu \)$ sequence
  has a subsequence with a weak cylinder limit $F in L^2 \( Pi \)$.
  Concretely, this means $mu \[ f psi \( x \) \] arrow.r Pi \[ F psi \]$ for a countable dense family of cylinder
  tests, and then for all such tests by their $L^2$ bounds.
  For fixed small $q > 0$, let a bar denote probability averaging in $d log p$ over $\[ q \, 2 q \]$.

#thm([Proposition 5.4.])[
  (Limit of the observation slopes).  #emph[Suppose $f_n$ satisfies the preceding bounds and has weak cylinder
    limit $F$. Choose a subsequence on which $T cal(E) \( f_n \)$ tends to its liminf.
    After further extraction in the quenched convention, there is a sequence $q_j arrow.b
    0$ such that the spectral components of $overline(J^f)_(q_j)$ have weak cylinder limits $G^(\( j \))$ as $n
    arrow.r oo$. Every weak cluster point of $\( G^(\( j \)) \)$ in $L^2 \( Pi \; ell^2 \)$ equals $nabla F$.
    In particular, $F$ belongs to the form domain of Proposition 22 and
#[#set math.equation(numbering: n => "(5.6)")
 $ parallel nabla F parallel_(L^2 \( Pi \; ell^2 \)) lt.eq
   C (liminf_(n arrow.r oo) T cal(E) \( f_n \))^(1 \/ 2) . $ <eq:source-28>]

 The constant is the same for all sequences with the stated size bounds.]
] <prop:gradient-observation>

#proof[
  Pass first to a subsequence on which the energy converges to its liminf.
    Equation (5.4) bounds the weak spectral vector limits in $L^2 \( Pi \; ell^2 \)$.
    To identify them, fix $A$ and $psi$ as in (5.1). We will compare the angular pairing of the slopes at fixed
    cap scale to an integration by parts at the smallest scale $r$.
  Define
  $ T_p^A = Q_mu \[ psi \( u_p \) cal(R)_A F_p \( h_p \) \] \, $
  where the rotation acts on spectral coordinates. By (3.2) and (5.4),
  $ mu \[ psi \( x \) \( A x \) dot.op U^t J_p^f \] - T_p^A =
    O #scale(x: 120%, y: 120%)[\(] \( p n^(1 \/ 3) \)^(- 1) #scale(x: 120%, y: 120%)[\)] + o \( 1 \) . $
  For the finitely many coordinates involved, $B_p \/ p^2 = I + O \( \( p n^(1 \/ 3) \)^(- 2) \)$.
    Replacing $x$ by $u_p$ in the test then uses Cauchy–Schwarz and (3.2); compact support of the test,
    or its fourth-moment version, controls the coordinate factors.
  ===== 5.3.1 Transport between two scales. <transport-between-two-scales.>
  Let $r lt.eq c < p lt.eq 2 c$, with all indices of $A$ active at scale $c$.
    The increment covariance $B_p - B_c$ is scalar on those indices.
    Rotation therefore commutes with the Gaussian convolution expressing the observation bridge.
    Differentiating its numerator and denominator gives the exact identity
  #[#set math.equation(numbering: n => "(5.7)")
   $ cal(R)_A F_c \( h_c \) =
     bb(E)
     [cal(R)_A F_p \( h_p \) + \( F_p \( h_p \) - F_c \( h_c \) \) cal(R)_A phi.alt_p \( h_p \) thin mid(bar.v)
     thin h_c] . $ <eq:source-29>]
  In the first term, replacement of $psi \( u_c \)$ by $psi \( u_p \)$ costs $O \( \( c n^(1 \/ 3) \)^(- 1) \) +
    o \( 1 \)$, using (3.2) and (5.4). The other term is bounded in absolute value by
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel psi parallel_oo V_c \( f \)^(1 \/ 2) parallel cal(R)_A phi.alt_p parallel_(L^2 \( Q_mu \)) .
     $ <eq:source-30>]
  Here $bb(E) \[ \( F_p - F_c \)^2 \] lt.eq V_c \( f \)$ follows from the posterior martingale and conditional
    variance decomposition.
  Starting at each $p in \[ q \, 2 q \]$, descend by factors of two, using $r$ as the final scale if necessary.
    The coordinate errors sum to $O \( \( r n^(1 \/ 3) \)^(- 1) \) = O \( n^(- delta) \)$.
    For the score errors, (4.1) bounds (5.8), up to a fixed tight factor,
    by the root mean square of $cal(R)_A phi.alt_p$ divided by $n^(1 \/ 3) p$. Average over the starting $p$.
    In every resulting parent window, (3.9) and Cauchy–Schwarz apply,
    including a partial final window by enlarging it to its fixed-ratio buffer.
    Under the biased law the expected contribution of a window of scale $Q$ is at most
  $ C_A #scale(x: 120%, y: 120%)[\(] Q^(tau') + k_Q^(- tau') #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  The comparison through $L_compose gt.eq 1 \/ 2$ transfers this estimate to ordinary disorder integrals.
    Its sum is bounded by $C_A \( q^(tau' \/ 2) + k_r^(- tau' \/ 2) \)$.
    Markov’s inequality therefore shows that the averaged $T_p^A$ and $T_r^A$ differ by a quantity tending to zero
    in probability as $n arrow.r oo$ and then $q arrow.b 0$. The estimate is independent of the choice of $f$
    within the stipulated size and energy bounds.
  ===== 5.3.2 Integration by parts at the smallest scale. <integration-by-parts-at-the-smallest-scale.>
  The observation density in the active $h_r$ coordinates is proportional to
  $ exp (phi.alt_r \( h_r \) - 1 / 2 h_r^t B_r^(- 1) h_r) . $
  In $u_r$ coordinates the quadratic coefficient in direction $i$ is $n^(2 \/ 3) r^4 \/ B_(r \, i)$.
    Its pairwise differences are
  #[#set math.equation(numbering: n => "(5.9)")
   $ delta_(i j) = n^(2 \/ 3) r^4 frac(d_i - d_j, B_(r \, i) B_(r \, j)) arrow.r g_i - g_j $ <eq:source-31>]
  for fixed leading indices. The common divergent part of the coefficient cancels in an angular derivative.
    Also $phi.alt_r^(upright("sp"))$ is radial on the cap, so that $cal(R)_A phi.alt_r = cal(R)_A log L_r$.
    Its contribution to the integration-by-parts identity tends to zero by (3.6), the field-coordinate moments,
    and the same biased-to-quenched comparison. Cauchy–Schwarz applies because $F_r$ is bounded in $L^2$ and the
    relevant score has vanishing $L^2$ norm after multiplication by the compact cylinder test.
  For every function $b \( h_r \)$, $Q_mu \[ F_r \( h_r \) b \( h_r \) \] = Q_mu \[ f \( X \) b \( h_r \) \]$.
    We may therefore use (3.2) in the remaining terms of the integration-by-parts identity and then the weak
    cylinder convergence of $f$. Equations (5.9) and (5.1) have the same limiting quadratic coefficient,
    since adding the scalar $b$ has no angular effect. We obtain
  $ T_r^A arrow.r - integral F {cal(R)_A psi - psi sum_a \( A x \)_a \( g_a + b \) x_a} thin d Pi . $
  Together with the preceding scale comparison, this proves that each weak limit $G$ of the averaged slopes
    satisfies (5.1). Proposition 22 identifies it with $nabla F$, and weak lower semicontinuity in (5.4) proves (5.6).
  Finally, these arguments can be realized simultaneously for the countably many scales and tests needed in the
    sequel. Represent the bounds by tight random constants on the high-probability disorder sets,
    and include the error variables in the subsequential realization of Remark 3.
    The errors tend to zero along a sufficiently rapidly decreasing outer sequence of scales.
    On the resulting limit samples, weak Hilbert-space extraction applies to any of the particular sequences $f_n$
    under consideration. This establishes the stated quenched form of the proposition. ◻
]

== 6 Microscopic relaxation and the effective coefficient <sec:microscopic>

The weak gradient constructed in Section 5 gives a coarse lower bound on the limiting energy.
  We now identify its exact coefficient. A correction that vanishes in $L^2$ can still alter the limiting rescaled
  Dirichlet energy. We describe these corrections using polynomials in the unscaled heat-bath operator $H$.
  Their limiting slope inner products are encoded by a deterministic measure $omega$ on $\[ 0 \, oo \)$.
  Its atom at zero will give the effective coefficient.

Throughout this section the couplings are Gaussian. Limits of quenched quantities use the joint spectral
  convention of Section 2. Assertions about countably many fixed polynomials and cylinder functions may
  consequently be imposed simultaneously after subsequence extraction.
  All polynomial degrees are fixed before $n$ tends to infinity. Write

$ chevron.l A \, B chevron.r_(w \, n) = mu #h(-0.16667em) [sum_i w_i A_i B_i] \, wide
  parallel A parallel_(w \, n)^2 = chevron.l A \, A chevron.r_(w \, n) $

for vectors of functions on the cube. For a polynomial $Q$ and a fixed leading eigenvector $v_a$, define $A_a^Q =
  D Q \( H \) Y_a$. Its component $\( A_a^Q \)_i$ is independent of $X_i$.

=== 6.1 The measure of microscopic energies <the-measure-of-microscopic-energies>

Let $nu_(a \, n)$ be the spectral measure of $H$ on $Y_a$, and put $omega_(a \, n) \( d lambda \) =
  lambda thin nu_(a \, n) \( d lambda \)$. This is a finite positive measure.
  Selfadjointness and the formula for the Dirichlet form give

#[#set math.equation(numbering: n => "(6.1)")
 $ integral Q Q' thin d omega_(a \, n) & = chevron.l A_a^Q \, A_a^(Q') chevron.r_(w \, n) \,\
integral lambda^j thin d omega_(a \, n) & = mu #h(-0.16667em) [sum_i w_i D_i Y_a D_i H^j Y_a] .
  $ <eq:micro-finite-measure>]

The factor $lambda$ is essential: $omega_(a \, n)$ records energies,
  rather than the variances recorded by the spectral measure of $Y_a$.

To specify the limiting measure through an experiment with deterministic spectral data,
  use only fixed microscopic moments as follows. Take deterministic midpoint quantiles $lambda_(1 \, N) gt.eq
  dots.h.c gt.eq lambda_(N \, N)$ of $rho_(upright("sc"))$,
  and choose $y in bb(R)^N$ with $parallel y parallel^2 = N$ such that

$ 1 / N sum_(a = 1)^N y_a^2 delta_(lambda_(a \, N)) med arrow.r.double med
  frac(d rho_(upright("sc")) \( lambda \), 2 - lambda) . $

For example, take $y_a^2$ proportional to $\( 2 - lambda_(a \, N) \)^(- 1)$ and normalize their sum to $N$.
  Draw $U$ by Haar measure subject to $U y = upright(bold(1))$, form $W = U Lambda U^(sans(T))$, and define $H \,
  w_i \, Y_1$ as above, always omitting the diagonal of $W$ from the molecular fields.
  The prescription for its $j$th moment, for each fixed integer $j gt.eq 0$, is

#[#set math.equation(numbering: n => "(6.2)")
 $ integral lambda^j thin d omega \( lambda \) = lim_(N arrow.r oo) bb(E)_(U divides U y = upright(bold(1)))
   [sum_(i = 1)^N w_i D_i Y_1 D_i H^j Y_1\|_(X = upright(bold(1)))] \, wide c_(*) = omega \( { 0 } \) . $ <eq:source-3>]

Proposition 26 proves that these limits exist and determine a finite positive measure;
  Theorem 33 proves that its atom at zero is strictly positive and is the coefficient in (2.7).

#thm([Proposition 6.1.])[
  (Microscopic moment measure).  #emph[There is a deterministic finite positive measure $omega$ on $\[ 0 \, oo \)$
    whose moments are given by (6.2). For fixed leading indices $a \, a'$, polynomials $Q \, Q'$,
    and a bounded continuous cylinder $psi$,
#[#set math.equation(numbering: n => "(6.3)")
 $ mu #h(-0.16667em) [psi \( x \) sum_i w_i \( A_a^Q \)_i \( A_(a')^(Q') \)_i] arrow.r
   upright(bold(1))_({ a = a' }) Pi \[ psi \] integral Q Q' thin d omega . $ <eq:source-32>]

 For every $epsilon > 0$ one also has
#[#set math.equation(numbering: n => "(6.4)")
 $ lim_(q arrow.b 0) limsup_(n arrow.r oo) bb(P) #h(-0.16667em) (mu #h(-0.16667em)
   [∥P_q \( w A_a^Q \) - v_a integral Q thin d omega∥^2] > epsilon) = 0 . $ <eq:source-33>]

 Here $w A$ denotes entrywise multiplication. For some $c > 0$,
   $integral e^(c sqrt(lambda)) thin d omega \( lambda \) < oo$.
   The measure is uniquely determined by its moments, and polynomials are dense in
   $L^2 \( \( 1 + lambda \) omega + delta_0 \)$.]
] <prop:micro-moment-measure>

The proof has two parts. A fixed-order Haar calculation gives the limiting contractions and their factorization.
  A separate estimate on iterated differences controls moment growth.
  This separation avoids applying a diagram expansion at a degree that increases with $n$.

==== 6.1.1 Conditional Haar contractions <conditional-haar-contractions>

In the biased representation of Lemma 6, multiply row $i$ of $U$ by the sampled spin $X_i$.
  The spin is then $upright(bold(1))$, and, conditionally on $y = U^t X$, the rotation is Haar subject to $U y =
  upright(bold(1))$. The spectral inputs are

$ 1 / n sum_a delta_(lambda_a) arrow.r.double rho_(upright("sc")) \, wide 1 /
  n sum_a y_a^2 delta_(lambda_a) arrow.r.double frac(rho_(upright("sc")) \( d lambda \), 2 - lambda) \, $

together with bounded $parallel Lambda parallel$, $lambda_a arrow.r 2$, and $y_a \/ sqrt(n) arrow.r
  0$ for each fixed leading index. These inputs hold both for the deterministic data in (6.2) and for a biased
  Gibbs sample. For the latter, the weighted bulk limit is Lemma 5.

The case $Q = Q' = 1$ shows what the calculation must track.
  Since $D_i Y_a = v_(i a)$, the unrelaxed slope contraction is

$ sum_i "sech"^2 \( h_i \) v_(i a) v_(i a') = 1 / n sum_i
  "sech"^2 \( h_i \) \( sqrt(n) thin v_(i a) \) \( sqrt(n) thin v_(i a') \) . $

Thus each summand carries two marked eigenvector entries and the common normalization is $1 \/ n$.
  Its limit can already be read from a finite number of rows. Put $u = y \/ sqrt(n)$ and

$ m_n = u^t Lambda u arrow.r 1 \, wide s_n^2 = u^t Lambda^2 u - m_n^2 arrow.r 1 . $

These values follow from $integral lambda thin rho_(upright("sc")) \( d lambda \) \/ \( 2 - lambda \) =
  1$ and $integral lambda^2 thin rho_(upright("sc")) \( d lambda \) \/ \( 2 - lambda \) = 2$.
  The exact field decomposition is

$ U Lambda y = m_n upright(bold(1)) + sqrt(n) thin U \( Lambda u - m_n u \) . $

Conditionally on $U y = upright(bold(1))$, the second term comes from a vector of length $s_n$ rotated uniformly
  in $upright(bold(1))^perp$. It therefore tends at each fixed row to a standard normal.
  The inner products of a marked axis $e_a$ with $u$ and with $Lambda u - m_n u$ are, respectively,
  $y_a \/ sqrt(n)$ and $\( lambda_a - m_n \) y_a \/ sqrt(n)$, both tending to zero.
  Consequently the joint fixed-row limit of the field and the marked entries is
  $\( 1 + Z \, G_a \, G_(a') \, dots.h \)$, with independent standard normals $Z \, G_a \, G_(a') \,
  dots.h$ for distinct marked axes. The omitted diagonal $W_(i i)$ tends to zero and does not change this limit.

The same conditional Haar argument at two distinct rows gives independent copies of these limits,
  with uniformly bounded fixed moments. Row exchangeability then makes the displayed average converge in $L^2$ to
  $upright(bold(1))_({ a = a' }) m_0$, where

#[#set math.equation(numbering: n => "(6.5)")
 $ m_0 = bb(E) \[ "sech"^2 \( 1 + Z \) \] = omega \( \[ 0 \, oo \) \) . $ <eq:micro-zeroth-moment>]

This is the energy before microscopic correction; the coefficient in the limiting dynamics is instead the atom
  $c_(*) = omega \( { 0 } \)$. For higher moments, a difference of a field function introduces a factor $W_(i j)$
  joining two sites. The graph calculation below keeps these matrix factors together with the marked row variables.

A #emph[matrix edge] below means an entry of $U M U^t$, where $M$ is a bounded spectral function of $Lambda$ or a
  projection onto one of finitely many marked spectral axes.
  A site vertex may carry a continuous function, of polynomial growth,
  of the field $\( U Lambda y \)_i$ and of the entries $sqrt(n) thin v_(i a)$ at the marked axes.
  In particular it may carry any fixed derivative of $tanh$.

Here are precise definitions for the contraction statement. Set

$ B = "span" { y \/ sqrt(n) \, Lambda y \/ sqrt(n) \, e_a : med a upright(" is marked") } \, wide R = "Id" - P_B . $

Choose an orthonormal basis $b_1 \, dots.h \, b_k$ of $B$, with $b_1 = y \/ sqrt(n)$,
  and put $xi_i = \( sqrt(n) thin \( U b_r \)_i \)_(1 lt.eq r lt.eq k)$.
  The allowed vertex factors are functions of $xi_i$; the field and marked entries above are linear combinations
  with convergent coefficients. If a finite multigraph $G = \( V_G \, E_G \)$ has a symmetric matrix $M_e$ at each
  edge and a vertex function $Phi_v$, its normalized contraction is

#[#set math.equation(numbering: n => "(6.6)")
 $ S_G = 1 / n sum_(kappa : V_G arrow.r { 1 \, dots.h \, n })
   product_(e = { u \, v } in E_G) \( U M_e U^t \)_(kappa \( u \) \, kappa \( v \)) product_(v in V_G)
   Phi_v \( xi_(kappa \( v \)) \) . $ <eq:micro-graph-sum>]

Loops and multiple edges are allowed. We also use the same expression with $kappa$ restricted to be injective.
  By a normalized spectral trace or a finite spectral path we mean, respectively,

#[#set math.equation(numbering: n => "(6.7)")
 $ 1 / n "Tr" \( R M_(e_1) R dots.h.c M_(e_l) R \) \, wide
   b_r^t M_(e_1) R dots.h.c R M_(e_l) b_s . $ <eq:micro-spectral-words>]

The one-edge path is $b_r^t M_e b_s$. In particular, path endpoints include the field direction $Lambda y \/
  sqrt(n)$, not just the spin direction. Only bounded-length words occur in any fixed moment of $S_G$.

#thm([Lemma 6.2.])[
  (Connected contractions).  #emph[Suppose the edge matrices have uniformly bounded operator norms and that the
    traces and paths in (6.7) converge for every fixed word. For a fixed connected $G$ and fixed continuous vertex
    functions of polynomial growth, $S_G$ converges in every fixed $L^p$ under the conditional Haar law to a
    deterministic limit. The same holds for the sum restricted to injective site labels.
    Products of finitely many such contractions have the products of their limits.]
  #emph[The conclusion applies to the contractions defining $sum_i
    w_i \( A_a^Q \)_i \( A_(a')^(Q') \)_i$ at the sampled spin,
    and to their quadratic contractions with an additional $P_q$ edge, for $q > 0$ fixed.
    In the latter case the limit tends to zero as $q arrow.b 0$ if that edge is replaced by $P_q -
    P_(upright("mark"))$, where $P_(upright("mark"))$ projects onto the marked spectral axes.]
] <lem:micro-contractions>

#proof[
  Separate all coincidences among the site labels; the $V$ remaining site vertices have distinct labels.
    Condition on the image under $U$ of the chosen orthonormal basis of $B$.
    The residual map between the orthogonal complements is Haar.
    The Gram matrix of the first two displayed vectors tends to $mat(delim: "(", 1, 1; 1, 2)$,
    while the marked axes are asymptotically orthonormal and orthogonal to these two vectors.
    Thus the basis can be chosen with converging coefficients. For bounds, an arbitrary orthonormal basis suffices.
  At any fixed number of distinct rows, its image entries multiplied by $sqrt(n)$ converge jointly with all
    moments: the first column equals $1$, and the remaining entries tend to independent standard normals.
    This follows by representing finitely many columns by independent Gaussian vectors projected off
    $upright(bold(1))$ and then orthonormalizing. At fixed graph and moment orders,
    products of vertex factors and row polynomials have a common polynomial growth bound.
    The bounds on higher row moments make these products uniformly integrable,
    so their expectations converge also when the continuous vertex functions are not polynomials.
    The vertex functions can therefore be retained in the calculation of residual Haar moments and integrated afterward.
  We give the counting argument, using the orthogonal Haar integration formula #cite(label("CollinsSniady2006"))
    Section 3.2. Suppose that splitting the edge endpoints between $B$ and $B^perp$ leaves $e$ edges and $2
    b$ residual endpoints. The finite-block endpoints contribute $n^(- \( e - b \))$ times a polynomial in the
    scaled row variables. Odd residual endpoint counts have zero expectation.
    For $2 b$ endpoints the integration formula is a sum over a physical pairing $pi$ and a spectral pairing
    $sigma$, whose coefficient has order
  $ O \( n^(- b - d \( pi \, sigma \)) \) . $
  Here $d \( pi \, sigma \)$ is $b$ minus the number of loops in the paired union.
    This order also follows directly by inverting the pairing Gram matrix:
    after removing the diagonal power of $n$, the off-diagonal entries have orders given by the pairing distances.
    The leading inverse terms are paths of minimum total distance.
  We spell out the spectral wiring represented by a pairing.
    Split each matrix edge into its two endpoints, declaring each endpoint either finite-block or residual.
    The $2 b$ residual endpoints are paired by $sigma$; keep the original matrix edges as well.
    Each connected component of this endpoint diagram is then either a closed alternating cycle,
    or a path ending at two finite-block endpoints. Summing its spectral indices gives a trace or path of (6.7).
    Define $t \( sigma \)$ to be the number of closed components of this diagram.
    The notation $t \( pi \)$ means the number obtained from exactly this construction with $pi$ in place of $sigma$.
  Writing $sans(P) = "Id" - U P_B U^t$, a term of the conditional expectation therefore has the form
  $ n^(- \( e - b \)) thin upright("Wg")_(n - k) \( pi \, sigma \) product_({ alpha \, beta } in pi)
    sans(P)_(kappa \( v_alpha \) \, kappa \( v_beta \)) product_(upright("cycles ") c) "Tr" \( M_c \)
    product_(upright("paths ") p) chevron.l b_(r_p) \, M_p b_(s_p) chevron.r \, $
  times its vertex factors and a polynomial in the scaled rows.
    Here $v_alpha$ is the physical vertex incident to endpoint $alpha$, and $M_c \,
    M_p$ abbreviate the compressed products just defined. There are $2 e - 2 b$ finite-block endpoints,
    each supplying a row entry $n^(- 1 \/ 2) xi_(i \, r)$; this explains the factor $n^(- \( e - b \))$.
  The physical covariance $sans(P)$ is the projection off the image of $B$.
    Each pairing of unequal site vertices thus costs another factor $n^(- 1)$,
    with polynomially bounded factors in the scaled rows. Let $D$ be the number of such pairs.
    Each trace costs at most $C n$; each path costs at most a constant. If the original graph has $a$ components, then
  #[#set math.equation(numbering: n => "(6.8)")
   $ t \( pi \) lt.eq e + D - V + a \, wide t \( sigma \) lt.eq t \( pi \) + d \( pi \, sigma \) . $ <eq:source-34>]
  Indeed, add the $D$ unequal-site pairing connections to the graph, and let $c lt.eq
    a$ be the resulting number of components. Its cycle rank is $e + D - V + c$.
    The residual trace circuits are edge-disjoint circuits in this enlarged graph, so $t \( pi \) lt.eq e + D -
    V + c lt.eq e + D - V + a$. Open paths ending in $B$ add no circuits.
    A pairing switch creates at most one new circuit, which proves the second inequality.
  Before summing site labels, the resulting bound is
  $ n^(- \( e - b \)) n^(- b - d \( pi \, sigma \)) n^(- D) n^(t \( sigma \)) = O \( n^(- V + a) \) . $
  It compensates for the site sum and the $a$ normalizing factors. Every surviving term has a limit:
    the normalized trace and path factors converge by hypothesis,
    the row expectations converge by Gaussian orthogonalization,
    and the rescaled leading Haar coefficients converge by the Gram-matrix expansion.
  The same count proves concentration. In a product of normalized sums,
    identifying vertices in two original components saves a power of $n$,
    as does a physical pairing across components. If only the spectral pairing crosses components,
    consider the first cross-component switch along a shortest pairing path.
    Before it, each residual circuit or open path lies inside one original component.
    Joining two circuits loses a circuit; joining paths, or a path and a circuit, cannot create a circuit.
    This switch therefore gains at most zero circuits, instead of the one allowed by (6.8),
    and again saves a power of $n$. Surviving terms remain inside the original components.
    Their row limits and leading Haar coefficients factor; for the latter,
    shortest pairing paths cannot join distinct paired components.
    Applying this factorization to even powers of centered sums proves convergence in every fixed $L^p$.
    The argument also gives bounds uniform over bounded spectral data.
  We verify the graph representation for the heat-bath expressions. Repeatedly use the exact rule
  $ D_i \( F G \) = F \( X \) D_i G + \( D_i F \) G \( X^(\( i \)) \) . $
  A difference of an explicit spin identifies an existing site;
    a difference of a field function adds a factor $W_(i j)$ joining the differentiating site to that field
    vertex. The induction invariant is that each summand obtained from one copy of $Y_a$ has a connected set of
    site labels and exactly one marked factor. Initially its summand is $v_(j a) X_j$ on one site.
    In an application of $H$, a newly summed site must differentiate an existing factor:
    it either becomes an existing site or joins one by a field edge.
    The factor $X_i - t_i$ remains at that same site. Flip evaluations from the product rule introduce only field
    edges to sites already present. The final difference $D_i$ has the same property,
    with $i$ retained as the distinguished slope site. A term in which a new difference strikes no factor
    vanishes, so there is no unattached summation site. The slope inner product identifies the distinguished sites
    of two such pieces; a projected quadratic contraction joins them by a projection edge instead.
    Both are connected. Each piece carries one marked factor $v_(j a) = n^(- 1 \/ 2) \( sqrt(n) thin v_(j a) \)$,
    so the two marks together supply the normalization $1 \/ n$.
  The shifts of fields caused by flips may be Taylor expanded to a sufficiently large fixed order.
    Under conditional Haar, the off-diagonal entries and centered diagonal entries are at most $n^(- 0.49)$
    outside a probability exponentially small in a positive power of $n$.
    Haar concentration on the complement of the prescribed spin direction has bounded Lipschitz constants,
    and the entry means are $O \( n^(- 1) \)$; a union bound gives the assertion.
    Each fixed expression has only polynomially many summands.
    A large enough fixed Taylor order therefore makes all remainders vanish in any prescribed fixed moment.
    Polynomial bounds absorb the exceptional event. For the diagonal in $h_i = \( U Lambda y \)_i - W_(i i)$,
    Taylor-expand about $"Tr" Lambda \/ n$ and retain the powers of $W_(i i) -
    "Tr" Lambda \/ n$ as loop factors in the graph. Their edge matrix is $Lambda - \( "Tr" Lambda \/ n \) "Id"$;
    only the high-order Taylor remainder is discarded by the entrywise bound. This proves the required representation.
  For these applications the edge matrices are powers of $Lambda$, fixed spectral cutoffs, marked projections,
    and the scalar shifts just described. All hypotheses concerning (6.7) follow from the stated spectral inputs.
    Indeed, finite-rank removal changes a normalized trace by $O \( n^(- 1) \)$.
    Expanding each $R = "Id" - sum_r b_r b_r^t$ in a path reduces it to finitely many products of ordinary mixed
    spectral inner products between $y \/ sqrt(n)$, $Lambda y \/ sqrt(n)$, and the marked axes.
    Their limits are given by the two empirical spectral laws, the leading eigenvalue limits,
    and $y_a \/ sqrt(n) arrow.r 0$. At fixed $q$, the cutoff endpoint $2 -
    q^2$ is a continuity point of the limiting laws.
  Finally set $R_q = P_q - P_(upright("mark"))$ in the extra edge.
    Normalized traces containing $R_q$ tend to zero as $q arrow.b 0$,
    because the semicircle mass of $\[ 2 - q^2 \, 2 \]$ vanishes. Finite paths also vanish:
    $R_q$ kills the marked axes and, for every fixed $k$,
  $ limsup_(n arrow.r oo) parallel R_q Lambda^k y \/ sqrt(n) parallel^2 lt.eq
    integral_(2 - q^2)^2 frac(lambda^(2 k), 2 - lambda) thin rho_(upright("sc")) \( d lambda \) arrow.r 0 . $
  Paths containing finite-block compressions reduce to these statements by expanding those projections.
    There are only finitely many contractions at each fixed order.
    The limit order is $n arrow.r oo$ at fixed $q$, followed by $q arrow.b 0$. ◻
]

The lemma gives deterministic limits for polynomial slope inner products at a sampled spin.
  A sign change of just one of two distinct marked axes preserves the limiting spin/field Gram data and reverses
  the corresponding contraction, so its limit is zero. All fixed leading axes have eigenvalue limit $2$ and
  identical limiting Gram data; hence the diagonal limit is independent of $a$.
  By (6.1), it depends on $Q \, Q'$ through $Q Q'$.

The moment bounds in Lemma 27, together with Lemma 6, transfer convergence to constants from the biased
  representation to quenched Gibbs integrals. Bounded cylinder multipliers may then be inserted using
  Corollary 11. For (6.4), the lemma removes $P_q - P_(upright("mark"))$.
  The remaining coefficients are $v_(a') dot.op \( w A_a^Q \)$,
  with diagonal limit given by the same moment functional applied to $Q$ and off-diagonal limit zero.
  It remains to prove that the moment functional determines a measure.

=== 6.2 Growth of the microscopic moments <subsec:micro-moment-growth>

Lemma 27 determines every fixed moment of the microscopic spectral measure. We next control their growth.
  This will show that those moments determine a measure on $\[ 0 \, oo \)$ and that polynomials approximate its
  atom at zero in the weighted norm needed for the correctors. The estimate is deterministic:
  it uses only a bound on the interaction norm and small individual interaction entries.

For this subsection, let $W$ be a real symmetric $n times n$ matrix with zero diagonal, and let

$ mu \( X \) = Z^(- 1) exp #scale(x: 120%, y: 120%)[\(] 1 / 2 X^t W X #scale(x: 120%, y: 120%)[\)] \, wide
  X in { - 1 \, 1 }^n . $

Write $h_i \( X \) = sum_j W_(i j) X_j$, $t_i = tanh h_i$, and $w_i = 1 - t_i^2$.
  The half difference $D_i f$ is independent of $X_i$. Thus the operator $H = sum_i \( X_i - t_i \) D_i$ satisfies

#[#set math.equation(numbering: n => "(6.9)")
 $ mu \[ f H g \] = sum_i mu \[ w_i D_i f D_i g \] . $ <eq:micro-discrete-form>]

In particular, $H$ is selfadjoint and nonnegative on $L^2 \( mu \)$.
  For an ordered tuple $S = \( s_1 \, dots.h \, s_m \)$ of distinct sites, set $D_S =
  D_(s_1) dots.h.c D_(s_m)$ and $w_S = product_(j in S) w_j$, and define

$ N_m \( f \)^2 = sum_(S in { 1 \, dots.h \, n }^m\
upright("entries distinct")) mu \[ w_S \| D_S f \|^2 \] . $

The order matters only in this sum: each set of $m$ sites occurs $m !$ times. We put $N_m = 0$ for $m > n$.
  Subsets of $S$ in the proof below inherit the order of their positions,
  whereas unions inside a difference operator denote the corresponding collection of distinct sites.

#thm([Lemma 6.3.])[
  (Weighted difference recursion).  #emph[Fix $K < oo$. Suppose that $W$ is symmetric, has zero diagonal, and obeys
$ parallel W parallel lt.eq K \, wide epsilon.alt_n := max_(i \, j) \| W_(i j) \| lt.eq n^(- 49 \/ 100) . $

 There is $C = C \( K \) gt.eq 1$ such that, for each fixed integer $m gt.eq 1$,
   uniformly in these matrices and in real functions $f$ on ${ - 1 \, 1 }^n$,
#[#set math.equation(numbering: n => "(6.10)")
 $ N_m \( H f \) lt.eq sum_(l = 1)^(m + 2) #scale(x: 120%, y: 120%)[\(] C^(m - l + 3) \( m + 1 \)^(m - l + 2) +
   o_(n \; m) \( 1 \) #scale(x: 120%, y: 120%)[\)] N_l \( f \) . $ <eq:source-35>]

 Here $o_(n \; m) \( 1 \)$ is deterministic, nonnegative, and tends to zero as $n arrow.r oo$ with $m$ fixed.]
] <lem:micro-weighted-recursion>

#proof[
  We first separate the differences that strike a conditional mean from those that remain on $f$.
    The exact product rule is
  $ D_j \( F G \) = F D_j G + \( D_j F \) G \( X^(\( j \)) \) \, wide G \( X^(\( j \)) \) = G \( X \) -
    2 X_j D_j G \( X \) . $
  If $i in S$, applying $D_i$ first to $\( X_i - t_i \) D_i f$ gives $D_i f$;
    these terms therefore sum to $m D_S f$. For $i in.not S$,
    the terms in which no difference strikes $t_i$ give $H D_S f$. Every remaining term, with its overall minus sign, is
  #[#set math.equation(numbering: n => "(6.11)")
   $ \( D_A t_i \) product_(j in B) \( - 2 X_j \) thin D_({ i } union \( S \\ A \) union B) f \, wide
     i in.not S \, quad diameter eq.not A subset S \, quad B subset A . $ <eq:source-36>]
  Indeed, the iterated product rule first evaluates $D_({ i } union \( S \\ A \)) f$ at $X^A$,
    and expanding the flips at the sites of $A$ gives the displayed sum over $B$.
  Fix the positions of $A$ and $B$, and write $a = \| A \|$, $b = \| B \|$ and $l = 1 + m - a + b$.
    We estimate the sum over $i$ of (6.11) in the norm obtained by summing $mu \[ w_S \| dot.op \|^2 \]$ over $S$.
    For positive derivative orders,
  $ \| tanh^(\( a \)) u \| lt.eq C^a a ! "sech"^2 u . $
  For example, Cauchy’s formula on a fixed circle of radius less than $pi \/ 2$, applied to $"sech"^2 z$,
    proves this inequality: on that circle $\| "sech"^2 z \| lt.eq C "sech"^2 u$ uniformly for real $u$.
    The difference integral for $D_A t_i$ consequently gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| D_A t_i \| lt.eq w_i C^a a ! product_(j in A) \| W_(i j) \| . $ <eq:micro-coefficient-bound>]
  The constant is uniform for each fixed $m$ and all sufficiently large $n$,
    since all field shifts in that integral have absolute value at most $2 m epsilon.alt_n$ and $\| log "sech"^2
    u - log "sech"^2 v \| lt.eq 2 \| u - v \|$.
  Suppose first that $b gt.eq 1$, and select $j_0 in B$. Apply Cauchy–Schwarz to the sum over $i$,
    using $sum_i W_(i j_0)^2 lt.eq K^2$ for its first factor.
    The second factor contains $w_i^2$, the squared derivative of $f$,
    and $product_(j in A \\ { j_0 }) W_(i j)^2$. Put $R = S \\ A$ and $A_0 = A \\ B$.
    The weights $w_R w_B$ occur in both input and output norms and are retained.
    Bound the additional output weights $w_(A_0)$ by one. Summing the sites of $A_0$ now costs at most
    $K^(2 \( a - b \))$, by row square sums; the remaining $b -
    1$ factors at sites of $B$ cost at most $epsilon.alt_n^(2 \( b - 1 \))$.
    Finally, $w_i^2 lt.eq w_i$ supplies the input weight at site $i$.
    Here only the distinctness restrictions involving the summed-out sites of $A_0$ are removed;
    the retained tuple $\( i \, R \, B \)$ still consists of distinct sites.
    After summing that tuple and integrating, the resulting norm is at most
  #[#set math.equation(numbering: n => "(6.13)")
   $ C^(a + 1) a ! epsilon.alt_n^(b - 1) N_l \( f \) \, wide b gt.eq 1 . $ <eq:micro-shared-slot-bound>]
  Thus all terms with $b gt.eq 2$ have coefficients $o_(n \; m) \( 1 \)$.
  When $b = 0$, taking absolute values in the sum over $i$ would lose the operator norm bound on $W$.
    Instead expand the difference integral once more:
  #[#set math.equation(numbering: n => "(6.14)")
   $ D_A t_i =  & #scale(x: 180%, y: 180%)[\(] product_(j in A) W_(i j) #scale(x: 180%, y: 180%)[\)]
     {tanh^(\( a \)) \( h_i \) - tanh^(\( a + 1 \)) \( h_i \) sum_(j in A) W_(i j) X_j + R_(i \, A)} \,\
\| R_(i \, A) \| lt.eq  & C_m w_i epsilon.alt_n^2 . $ <eq:micro-coefficient-expansion>]
  The first correction has the indicated sign because the field in the integral is $h_i -
    2 sum_(j in A) s_j W_(i j) X_j$, with each $s_j$ uniform on $\[ 0 \, 1 \]$.
  Here is the operator estimate for the first two terms. Regard
  $ \( T_a u \)_(j_1 \, dots.h \, j_a) = sum_i product_(r = 1)^a W_(i j_r) thin u_i $
  as a map from $ell^2$ of sites to $ell^2$ of ordered site tuples, initially allowing repetitions.
    Its Gram matrix is $\( W W^t \)^(compose a)$, the entrywise $a$th power, so $parallel T_a parallel lt.eq K^a$.
    To see the norm bound directly, the entrywise product of two matrices is the compression of their tensor
    product to the span of the vectors $e_i ⊗ e_i$; iterate this observation for $W W^t$.
    In each first-correction term, one factor $W_(i j_r)$ is replaced by $W_(i j_r)^2$.
    The matrix $\( W_(i j)^2 \)_(i \, j)$ has row and column sums at most $K^2$,
    hence operator norm at most $K^2$. The same tensor-product bound therefore controls this corrected map by
    $K^(a + 1)$. Multiplication by $X_(j_r)$ on its output is an isometry.
  Fix $R = S \\ A$ and apply these operator estimates pointwise in $X$, before integrating against $w_R mu$.
    Restrictions that the sites of $A$ be distinct and avoid $R$ are coordinate projections on the output of these
    maps. The restriction $i in.not R$ is a coordinate projection on the input,
    and $i in.not A$ is automatic from $W_(i i) = 0$. The output weights $w_A$ may again be discarded.
    The common weight $w_R$ remains, and the factors $tanh^(\( a \)) \( h_i \)$ and $tanh^(\( a + 1 \)) \( h_i \)$
    are bounded multiples of $w_i$. Their multiplication on an input with squared norm $sum_i w_i \|
    D_({ i } union R) f \|^2$ thus costs no inverse powers of $w_i$.
    Summing $R$ proves the required bound $C^(a + 1) a ! N_l \( f \)$ for the first two terms of (6.14),
    after increasing $C$. For the remainder, signs may be discarded:
    the matrix with entries $product_(r = 1)^a \| W_(i j_r) \|$ has squared Frobenius norm
  $ sum_i (sum_j W_(i j)^2)^a lt.eq n K^(2 a) . $
  Its contribution is at most $C_m sqrt(n) epsilon.alt_n^2 N_l \( f \) = o_(n \; m) \( 1 \) N_l \( f \)$. We have proved
  #[#set math.equation(numbering: n => "(6.15)")
   $ upright("norm of the fixed-position terms with ") b = 0 med lt.eq
     #scale(x: 120%, y: 120%)[\(] C^(a + 1) a ! + o_(n \; m) \( 1 \) #scale(x: 120%, y: 120%)[\)]
     N_(1 + m - a) \( f \) . $ <eq:micro-unshared-slot-bound>]
  It remains to control $H D_S f$. This term is measured with $w_S mu$,
    so we require an operator estimate in precisely that measure.
    Fix $S$ and write $nu = w_S mu$, without normalizing it. Denote its conditional means and variances by $t'_i$
    and $w'_i$, its heat-bath operator by $H' = sum_i \( X_i - t'_i \) D_i$,
    and its first two difference seminorms by $N'_1$ and $N'_2$, using the measure $nu$ and weights $w'_i$.
    We claim that
  #[#set math.equation(numbering: n => "(6.16)")
   $ parallel H F parallel_(L^2 \( nu \)) lt.eq C { N'_2 \( F \) + \( 1 + m \) N'_1 \( F \) } \, wide
     C^(- 1) w_i lt.eq w'_i lt.eq C w_i . $ <eq:source-37>]
  The constants depend only on $K$, once $n$ is sufficiently large for the fixed $m$.
  The conditional field under $nu$ is exactly
  $ h'_i = h_i + delta_i \, wide delta_i = D_i log w_S . $
  Since the first two derivatives of $log "sech"^2 u$ are bounded, the nonnegative deterministic quantities
  $ a_i = 2 sum_(k in S) \| W_(i k) \| \, wide L_(i j) = C sum_(k in S) \| W_(i k) W_(j k) \| $
  satisfy $\| delta_i \| lt.eq a_i$ and $\| D_j delta_i \| lt.eq L_(i j)$ for $i eq.not j$. They obey
  $ parallel a parallel_2 lt.eq 2 m K \, quad parallel a parallel_oo lt.eq 2 m epsilon.alt_n \, quad
    parallel L parallel lt.eq C m K^2 \, quad #scale(x: 180%, y: 180%)[\(] sum_j L_(i j)^2
    #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq C K a_i . $
  These statements follow respectively from the triangle inequality for columns of $W$ and the expression of $L$
    as a sum of nonnegative rank-one matrices. The variance comparison in (6.16) follows from $\| delta_i \| lt.eq
    a_i = o \( 1 \)$ uniformly in $i$. Taylor’s formula for $tanh$ and $"sech"^2$, now at the tilted fields, also gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ D_i t'_j & = w'_j \( W_(i j) + E_(i j) \) \, & \| E_(i j) \| & lt.eq C \( L_(i j) + W_(i j)^2 \) \,\
\| D_i w'_j \| & lt.eq C w'_j r_(i j) \, & r_(i j) & = \| W_(i j) \| + L_(i j) \, wide
  i eq.not j . $ <eq:micro-tilted-coefficients>]
  In deriving the first bound, the square of $L_(i j)$ is absorbed into $L_(i j)$ since its maximum tends to zero.
    The absolute error matrix is bounded entrywise by a nonnegative matrix of norm at most $C \( 1 + m \)$;
    indeed $\( W_(i j)^2 \)$ has norm at most $K^2$. Also $sup_i sum_j r_(i j)^2 lt.eq
    C$ and $max_(i \, j) r_(i j) = o \( 1 \)$, for $n$ large at fixed $m$.
  For completeness, these coefficient bounds give the operator estimate without an independence assumption on the
    slopes. Put $F_i = D_i F$ and $F_(i j) = D_i D_j F$. The product rule gives the exact identity
  $ D_i H' F = H' F_i + F_i - sum_(j eq.not i) \( D_i t'_j \) \( F_j - 2 X_i F_(i j) \) . $
  Use the version of (6.9) for $nu$ to write
  $ parallel H' F parallel_(L^2 \( nu \))^2 =  & N'_1 \( F \)^2 +
    sum_(i eq.not j) nu \[ w'_j D_j \( w'_i F_i \) F_(i j) \]\
 & - sum_(i eq.not j) nu \[ w'_i F_i \( D_i t'_j \) \( F_j - 2 X_i F_(i j) \) \] . $
  In the last sum, the $F_j$ term is bounded by $C \( 1 + m \) N'_1 \( F \)^2$:
    apply the signed norm bound to $W$ with input $\( w'_i F_i \)_i$,
    and the absolute matrix bound to $\( E_(i j) \)$. The $F_(i j)$ term is bounded by $C N'_1 \( F \)
    N'_2 \( F \)$, by Cauchy–Schwarz and the row square bounds for $r$. Finally,
  $ D_j \( w'_i F_i \) = w'_i F_(i j) + \( D_j w'_i \) \( F_i - 2 X_j F_(i j) \) . $
  The first summand contributes $N'_2 \( F \)^2$. The other two summands cost, respectively,
    $C N'_1 \( F \) N'_2 \( F \)$ and $C N'_2 \( F \)^2$, using (6.17) and the same row square bounds. Consequently
  $ parallel H' F parallel_(L^2 \( nu \))^2 lt.eq C { N'_2 \( F \)^2 +
    N'_1 \( F \) N'_2 \( F \) + \( 1 + m \) N'_1 \( F \)^2 } . $
  Moreover $\| t_i - t'_i \| lt.eq C a_i w_i$, so pointwise Cauchy–Schwarz and $parallel a parallel_2 lt.eq C m$ show
  $ parallel \( H - H' \) F parallel_(L^2 \( nu \)) lt.eq C m N'_1 \( F \) . $
  These two bounds prove (6.16).
  Apply (6.16) to $F = D_S f$ and sum squares over the ordered tuples $S$.
    A difference at a site already in $S$ vanishes. For all other sites,
    the variance comparison replaces $w'_i$ by $w_i$ with a fixed factor.
    Appending one or two ordered sites to $S$ enumerates exactly the ordered tuples in $N_(m + 1)$ or $N_(m + 2)$;
    there is no further factorial. Minkowski’s inequality therefore yields
  $ (sum_S mu \[ w_S \| H D_S f \|^2 \])^(1 \/ 2) lt.eq C { N_(m + 2) \( f \) + \( 1 + m \) N_(m + 1) \( f \) } . $
  Together with the term $m D_S f$, this controls every contribution except the positional sums already bounded above.
  There are $binom(m, a)$ choices of the positions of $A$, and $binom(a, b)$ choices for $B$.
    The terms with $b = 0$ have $l = m - a + 1$ and coefficients bounded by $C^(a + 1) a ! binom(m, a)$;
    those with $b = 1$ have $l = m - a + 2$ and coefficients bounded by $C^(a + 1) a ! a binom(m, a)$.
    Use $a ! binom(m, a) lt.eq m^a$ and absorb the factor $a lt.eq 2^a$ by increasing $C$.
    Both bounds, as well as the $H D_S f$ and $m D_S f$ contributions,
    fit the coefficient $C^(m - l + 3) \( m + 1 \)^(m - l + 2)$ in (6.10).
    The finitely many $b gt.eq 2$ terms and Taylor remainders combine into $o_(n \; m) \( 1 \)$. ◻
]

We now apply this estimate to the linear functions $Y_a = v_a^t X$, where $parallel v_a parallel_2 = 1$.
  Then $N_1 \( Y_a \) lt.eq 1$ and $N_m \( Y_a \) = 0$ for $m gt.eq 2$.
  For each fixed $j gt.eq 0$, iterating (6.10) gives

#[#set math.equation(numbering: n => "(6.18)")
 $ limsup_(n arrow.r oo) N_1 \( H^j Y_a \) lt.eq C^j \( 2 j + 2 \)^(2 j) . $ <eq:micro-moment-growth>]

Here and below a larger constant $C = C \( K \)$ may be used.
  To verify the iteration explicitly, a nonzero terminal term follows indices $m_0 = 1 \, m_1 \, dots.h \, m_j =
  1$, with $1 lt.eq m_(r + 1) lt.eq m_r + 2$. Set $k_r = m_r - m_(r + 1) + 2 gt.eq 0$. Then

$ sum_(r = 0)^(j - 1) k_r = 2 j \, wide sum_(r = 0)^(j - 1) \( k_r + 1 \) = 3 j \, wide m_r + 1 lt.eq 2 j + 2 . $

The product of the coefficients on this path is at most $C^(3 j) \( 2 j + 2 \)^(2 j)$.
  The number of paths is bounded by the number of weak compositions of $2 j$ into $j$ parts,
  $binom(3 j - 1, j - 1) lt.eq 8^j$ for $j gt.eq 1$. Only finitely many fixed orders occur for a given $j$,
  so all $o_(n \; m) \( 1 \)$ coefficients disappear in this iteration before $j$ is allowed to increase.
  This proves (6.18); the case $j = 0$ is immediate.

#thm([Corollary 6.4.])[
  (Determination by moments and polynomial density).  #emph[Let the matrices and normalized linear functions above
    vary with $n$, and suppose the moments of the finite measures
$ omega_(n \, a) \( B \) = chevron.l Y_a \, H upright(bold(1))_B \( H \) Y_a chevron.r_(L^2 \( mu \)) \, wide
  B subset \[ 0 \, oo \) upright(" Borel") \, $

 converge at every fixed nonnegative integer order. They converge weakly to a finite measure $omega$ on
   $\[ 0 \, oo \)$ with those moments. This measure is uniquely determined among measures on $\[ 0 \, oo \)$ by
   its moments, and, for some $c > 0$,
$ integral e^(c sqrt(lambda)) thin d omega \( lambda \) < oo . $

 Polynomials are dense in both $L^2 \( omega \)$ and $L^2 \( \( 1 + lambda \) omega + delta_0 \)$.]
] <cor:micro-moment-density>

#proof[
  The masses are at most one, and the spectral theorem and (6.9) give
  $ integral lambda^(2 j) thin d omega_(n \, a) \( lambda \) = N_1 \( H^j Y_a \)^2 . $
  The $j = 1$ bound gives tightness. Bounds at higher even orders give uniform integrability for each fixed power
    of $lambda$, so every weak subsequential limit has the prescribed moments. In particular, (6.18) implies
  #[#set math.equation(numbering: n => "(6.19)")
   $ integral lambda^(2 j) thin d omega \( lambda \) lt.eq C^(2 j) \( 2 j + 2 \)^(4 j) . $ <eq:micro-even-moments>]
  Define the symmetric square-root lift $rho$ by
  $ integral g \( t \) thin d rho \( t \) = 1 / 2 integral { g \( sqrt(lambda) \) +
    g \( - sqrt(lambda) \) } thin d omega \( lambda \) . $
  Its $4 j$th absolute moment is bounded by the right side of (6.19).
    For an arbitrary integer $k gt.eq 1$, choose $4 j$ between $k$ and $k + 3$ and use Hölder’s inequality.
    Since the mass is at most one, this gives $integral \| t \|^k thin d rho \( t \)
    lt.eq \( D k \)^k$ with a constant $D = D \( K \)$. The exponential series and $k !
    gt.eq \( k \/ e \)^k$ therefore show that $integral e^(c \| t \|) thin d rho \( t \) <
    oo$ for small enough $c > 0$. This is the claimed square-root exponential moment.
  If another measure on $\[ 0 \, oo \)$ has the same moments,
    its symmetric square-root lift has the same integer moments as $rho$,
    and the same argument gives an exponential moment. The Fourier transforms of the two lifts extend analytically
    to a strip about the real axis. Their Taylor series at zero agree,
    so the identity theorem and uniqueness of Fourier transforms of finite measures identify the lifts,
    and hence the original measures. Every subsequential limit is therefore $omega$,
    proving weak convergence of the full sequence.
  For density, let $g in L^2 \( rho \)$ be orthogonal to all polynomials.
    Cauchy–Schwarz implies that the finite signed measure $g rho$ has an exponential moment with a smaller
    positive exponent. All derivatives at zero of its Fourier transform vanish.
    The same analytic argument shows that this transform, and hence $g rho$, is zero.
    Thus polynomials are dense in $L^2 \( rho \)$. Applying the bounded projection $p \( t \)
    mapsto \( p \( t \) + p \( - t \) \) \/ 2$ shows that even polynomials are dense in its even subspace.
    The isometry $f \( lambda \) mapsto f \( t^2 \)$ identifies this subspace with $L^2 \( omega \)$,
    proving the first density assertion. Finally, the symmetric square-root lift of $\( 1 + lambda \) omega +
    delta_0$ is $\( 1 + t^2 \) rho + delta_0$. It also has an exponential moment after decreasing $c$,
    and the same proof establishes the second density assertion. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 26.] For the Gaussian matrices in this section,
    removing the diagonal preserves a bounded operator norm and the entry bound used in Lemma 28,
    on events whose probability tends to one. The fixed-order contractions give moment convergence there.
    Corollary 29 therefore constructs the unique positive measure with those moments and proves the exponential
    bound and polynomial density. The moments are deterministic and the same for every fixed leading index.
    Applying the conditional Haar calculation to the deterministic spectral data of (6.2) gives precisely those
    same moments. Finally the contraction and projection arguments preceding this subsection give (6.3) and (6.4)
    with this measure. This proves all assertions of the proposition. ◻
]

=== 6.3 Correctors and the exact energy <correctors-and-the-exact-energy>

Define $c_(*) = omega \( { 0 } \)$. We have proved that this number is deterministic;
  for now we know only $c_(*) gt.eq 0$. Choose real polynomials $Q_j$ with

#[#set math.equation(numbering: n => "(6.20)")
 $ Q_j \( 0 \) = 1 \, wide Q_j arrow.r upright(bold(1))_({ 0 }) quad
   upright("in ") L^2 \( \( 1 + lambda \) omega + delta_0 \) . $ <eq:micro-zero-polynomials>]

The density assertion in Proposition 26 supplies such polynomials:
  the extra atom enforces convergence of the values at zero, after which division by those values normalizes them.
  Consequently

$ integral Q_j^2 thin d omega arrow.r c_(*) \, wide integral Q_j thin d omega arrow.r c_(*) \, wide
  integral lambda Q_j^2 thin d omega arrow.r 0 . $

The first limit gives the energy of the corrected slopes. The last makes their microscopic divergence negligible.

#thm([Lemma 6.5.])[
  (Cylinder recovery).  #emph[Let $F$ be a smooth compact cylinder, and let $Q$ be a polynomial with $Q \( 0 \) =
    1$. Define
#[#set math.equation(numbering: n => "(6.21)")
 $ f_(n \, Q) \( X \) = F \( x \) + n^(- 1 \/ 3) sum_a F_(\, a) \( x \) \( Q \( H \) - 1 \) Y_a \, $ <eq:source-39>]

 where the sum is over the finitely many coordinates of $F$.
   Then $f_(n \, Q)$ is bounded by a fixed power of $n$, converges weakly against cylinders to $F$,
   and its squared $L^2$ norm converges to $Pi \[ F^2 \]$. Moreover,
$ lim_(n arrow.r oo) T cal(E) \( f_(n \, Q) \) = (integral Q^2 thin d omega) Pi \[ parallel nabla F parallel^2 \] . $

 The exponent in the polynomial bound may depend on $Q$.]
] <lem:micro-recovery>

#proof[
  Set $V_a = \( Q \( H \) - 1 \) Y_a$. Since $Q - 1$ vanishes at zero,
  $ parallel V_a parallel_2^2 = integral frac(\( Q \( lambda \) - 1 \)^2, lambda) thin d omega_(a \, n) \( lambda \) $
  is bounded for fixed $Q$: the quotient extends to a polynomial at zero.
    Thus the correction in (6.21) tends to zero in $L^2$. Static convergence of cylinders gives the claimed
    convergence of values and norms. The bounds $parallel H parallel_(oo arrow.r oo) lt.eq
    2 n$ and $parallel Y_a parallel_oo lt.eq sqrt(n)$ give the polynomial supremum bound.
  Taylor’s formula in the finitely many coordinates of $F$ gives
  $ n^(1 \/ 3) D_i F \( x \) = sum_a F_(\, a) \( x \) v_(i a) + r_i \, wide sum_i \| r_i \|^2 = o \( 1 \) \, $
  uniformly in the spin. The discrete product rule then writes the scaled slope of (6.21) as $sum_a
    F_(\, a) \( x \) A_a^Q$ plus this remainder and terms $\( D_i F_(\, a) \) \( x \) V_a \( X^(\( i \)) \)$.
    Their coefficients satisfy
  $ \| D_i F_(\, a) \( x \) \|^2 lt.eq C n^(- 2 \/ 3) sum_b v_(i b)^2 . $
  The microscopic potentials need not be independent of these coefficients.
    Conditionally on all spins except $i$, put $p_i \( xi \) = \( 1 + xi t_i \) \/ 2$. The identity
  $ frac(w_i p_i \( xi \), p_i \( - xi \)) = \( 1 + xi t_i \)^2 lt.eq 4 $
  implies $mu \[ w_i \| V_a \( X^(\( i \)) \) \|^2 \] lt.eq 4 mu \[ \| V_a \( X \) \|^2 \]$.
    Summing over $i$ and using the unit norms of the finitely many $v_b$ gives
  $ ∥n^(1 \/ 3) D f_(n \, Q) - sum_a F_(\, a) \( x \) A_a^Q∥_(w \, n) arrow.r 0 . $
  Equation (6.3), with multiplier $F_(\, a) F_(\, a')$, now proves the energy limit. ◻
]

#thm([Lemma 6.6.])[
  (Positivity of the effective coefficient).  #emph[One has $c_(*) = omega \( { 0 } \) > 0$.]
] <lem:micro-positivity>

#proof[
  Choose a smooth compact cylinder $F$ with $Pi \[ parallel nabla F parallel^2 \] > 0$,
    possible because finite-coordinate marginals have full support.
    For each fixed $j$, apply Proposition 25 to $f_(n \, Q_j)$.
    Its limiting gradient is $nabla F$ by Proposition 22, and the constant in the coarse bound (5.6) is
    independent of the fixed polynomial index. Lemma 30 therefore yields
  $ Pi \[ parallel nabla F parallel^2 \] lt.eq C (integral Q_j^2 thin d omega) Pi \[ parallel nabla F parallel^2 \] . $
  Let $j arrow.r oo$ to obtain $1 lt.eq C c_(*)$. Only one fixed-degree sequence is used at a time.
    There is no need to impose a common polynomial supremum exponent on a sequence whose degree increases with $n$. ◻
]

The remaining task is to test arbitrary finite-model slopes against these corrected ones.
  Multiplication by a macroscopic cylinder test changes their microscopic divergence by a negligible amount.
  Here $E_i$ denotes conditional expectation over spin $i$,
  and $D_w^(*)$ is the adjoint of $D$ for the weighted slope pairing.

#thm([Lemma 6.7.])[
  (Multiplied divergence).  #emph[For a fixed polynomial $Q$, fixed leading index $a$,
    and smooth compact cylinder $psi$,
$ D_w^(*) \( psi \( x \) A_a^Q \) = psi \( x \) H Q \( H \) Y_a + o_(L^2 \( mu \)) \( 1 \) \, wide
  parallel H Q \( H \) Y_a parallel_2^2 arrow.r integral lambda Q^2 thin d omega . $

]
] <lem:micro-divergence>

#proof[
  Conditional single-site integration gives the exact formula
  $ D_w^(*) \( psi A_a^Q \) = sum_i \( X_i - t_i \) \( E_i psi \) \( A_a^Q \)_i . $
  Replacing $E_i psi$ by $psi$ gives $psi H Q \( H \) Y_a$.
    The cylinder Lipschitz estimate is $sum_i \| E_i psi - psi \|^2 lt.eq C n^(- 2 \/ 3)$ pointwise.
    Since $\( A_a^Q \)_i$ is independent of $X_i$, Cauchy–Schwarz gives
  $ & ∥sum_i \( X_i - t_i \) \( E_i psi - psi \) \( A_a^Q \)_i∥_2^2\
 & quad lt.eq C n^(- 2 \/ 3) mu #h(-0.16667em) [sum_i \( X_i - t_i \)^2 \| \( A_a^Q \)_i \|^2] =
   C n^(- 2 \/ 3) parallel A_a^Q parallel_(w \, n)^2 = o \( 1 \) . $
  Finally, $parallel H Q \( H \) Y_a parallel_2^2 = integral lambda Q^2 thin d omega_(a \, n)$. ◻
]

We can now state the form convergence used for the resolvent limit.
  Weak cylinder convergence means convergence of the integrals against every smooth compact cylinder test,
  in the quenched represented sense of Section 2. Strong convergence additionally requires convergence of the
  squared $L^2$ norms.

#thm([Theorem 6.8.])[
  (Relaxed energy).  #emph[The constant $c_(*) = omega \( { 0 } \)$ is deterministic and strictly positive.
    On any quenched represented subsequence, suppose that $parallel f_n parallel_oo lt.eq C n^D$ for fixed $C \,
    D$, that the $L^2$ norms and $T cal(E) \( f_n \)$ are bounded,
    and that $f_n$ converges weakly against cylinders to $F$.
    Then $F$ is in the closed form domain on $L^2 \( Pi \)$ and
#[#set math.equation(numbering: n => "(6.22)")
 $ liminf_(n arrow.r oo) T cal(E) \( f_n \) gt.eq c_(*) Pi \[ parallel nabla F parallel_(ell^2)^2 \] . $ <eq:source-38>]

 Conversely, for each smooth compact cylinder $F$, the functions $f_(n \, Q_j)$ in (6.21) converge strongly to $F$
   for every fixed $j$, are polynomially bounded at that fixed $j$, and satisfy
$ lim_(j arrow.r oo) lim_(n arrow.r oo) T cal(E) \( f_(n \, Q_j) \) = c_(*) Pi \[ parallel nabla F parallel^2 \] . $

 All assertions for countably many chosen sources and tests hold on a common represented event.
   In particular the lower bound and recovery use the same deterministic coefficient.]
] <thm:micro-relaxation>

#proof[
  Only the lower bound remains. Pass to a subsequence attaining the lower limit of the scaled energies.
    Proposition 25 gives the weak gradient $G = nabla F$ and its coarse bound.
    For finitely many smooth compact cylinders $psi_a$, put $Z_(n \, j) = sum_a psi_a \( x \) A_a^(Q_j)$.
    Equation (6.3) gives
  $ lim_(j arrow.r oo) lim_(n arrow.r oo) parallel Z_(n \, j) parallel_(w \, n)^2 = c_(*) sum_a Pi \[ psi_a^2 \] . $
  We identify its pairing with $n^(1 \/ 3) D f_n$.
  Fix $q > 0$ small and use the logarithmic averages over $\[ q \, 2 q \]$ in Lemma 24.
    By (5.5), $r_(n \, q) = n^(1 \/ 3) \( f_n - overline(S f_n)_q \)$ has $L^2$ norm at most $C \/ q$.
    Lemma 32 bounds the limiting absolute value of its slope pairing against $psi_a A_a^(Q_j)$ by
  $ frac(C parallel psi_a parallel_oo, q) (integral lambda Q_j^2 thin d omega)^(1 \/ 2) . $
  This vanishes when $j arrow.r oo$ at fixed $q$, after $n arrow.r oo$.
  For the smoothed part, the second estimate of (5.5) replaces $n^(1 \/ 3) D
    overline(S f_n)_q$ by $overline(J^(f_n))_q$, with pairing error at most $C q limsup_n parallel Z_(n \, j)
    parallel_(w \, n)$. This vector belongs to $cal(H)_(2 q)$ and has bounded unweighted $L^2$ norm.
    For any fixed polynomial index $J$, (6.4) and weak convergence of the averaged slopes therefore give
  $ mu #h(-0.16667em) [psi_a \( x \) overline(J^(f_n))_q dot.op w A_a^(Q_J)] arrow.r
    (integral Q_J thin d omega) Pi \[ psi_a G_a \] $
  as $n arrow.r oo$ and then $q arrow.b 0$ along the gradient extraction.
  The last step fixes the polynomial before taking $q arrow.b 0$, whereas the residual estimate takes $j arrow.r
    oo$ first. The following bound reconciles these orders without uniform graph estimates in the degree:
  $ limsup_(n arrow.r oo) parallel w \( A_a^(Q_j) - A_a^(Q_J) \) parallel_(L^2 \( mu \; bb(R)^n \)) lt.eq
    (integral \( Q_j - Q_J \)^2 thin d omega)^(1 \/ 2) . $
  It follows from $0 lt.eq w_i lt.eq 1$ and (6.3). For fixed $J$, its right side tends as $j arrow.r
    oo$ to $parallel upright(bold(1))_({ 0 }) - Q_J parallel_(L^2 \( omega \))$,
    and then tends to zero as $J arrow.r oo$. Boundedness of $overline(J^(f_n))_q$ makes this estimate uniform in
    the cap scale. All these bounds may be expressed with upper and lower limits,
    so no prior convergence of the raw slope pairings is required.
    We first take the finite-size limit, then send $j arrow.r oo$ at fixed $q$ to remove the residual,
    approximate the remaining test by a large fixed $J$, send $q arrow.b 0$, and finally send $J arrow.r oo$.
    The limiting cross pairing is $c_(*) sum_a Pi \[ psi_a G_a \]$.
  Apply the elementary inequality
  $ parallel n^(1 \/ 3) D f_n parallel_(w \, n)^2 gt.eq 2 chevron.l n^(1 \/ 3) D f_n \,
    Z_(n \, j) chevron.r_(w \, n) - parallel Z_(n \, j) parallel_(w \, n)^2 $
  and these iterated estimates to obtain
  $ liminf_n T cal(E) \( f_n \) gt.eq 2 c_(*) sum_a Pi \[ psi_a G_a \] - c_(*) sum_a Pi \[ psi_a^2 \] . $
  Finite vectors of smooth compact cylinders are dense in $L^2 \( Pi \; ell^2 \)$. Optimizing proves (6.22).
    The remaining claims follow from Lemmas 30 and 31. ◻
]

The coefficient in this theorem is the atom $omega \( { 0 } \)$,
  whereas $omega \( \[ 0 \, oo \) \)$ is the unrelaxed energy of a leading linear coordinate.
  Although $omega_(a \, n) \( { 0 } \) = 0$ for every finite system,
  its weak limit can acquire mass from eigenvalues tending to zero. The correctors isolate precisely this mass.
  Theorem 33 and cylinder density now supply the energy estimates needed to pass to Gaussian resolvents.

== 7 Convergence of the Gaussian resolvent trace <sec:trace>

The form convergence in Section 6 identifies each fixed edge coordinate.
  The autocorrelation, however, sums over every coordinate, and the static variances are not summable.
  We now prove the additional trace estimate that permits this sum to pass to the limit.
  Its mechanism is angular integration by parts: an edge gap of order $a^(2 \/ 3)$ gives a factor $a^(- 2 \/ 3)$
  in the dual norm of the $a$th source. The squares of these factors are summable.
  The variational passage from forms to individual resolvents is the standard one in the theory of varying Hilbert
  spaces #cite(label("KuwaeShioya2003")) Theorem 2.4; the summation over sources requires the additional estimates
  below.

Throughout this section the disorder is Gaussian. Write

#[#set math.equation(numbering: n => "(7.1)")
 $ B_g \( z \) := sum_(a gt.eq 1) chevron.l x_a \, \( z + c_(*) H_Pi \)^(- 1) x_a chevron.r_Pi \, wide
   z > 0 . $ <eq:source-40>]

The sum is initially allowed to be infinite. Recall that $B_n \( z \) =
  sum_(a = 1)^n chevron.l x_a \, \( z + T H \)^(- 1) x_a chevron.r_mu$ and $T = n^(2 \/ 3)$.

#thm([Proposition 7.1.])[
  (Gaussian trace convergence).  #emph[For almost every edge configuration $g$,
    the series defining $B_g \( z \)$ is finite for every $z > 0$.
    For every finite collection $z_1 \, dots.h \, z_k > 0$,
$ \( B_n \( z_1 \) \, dots.h \, B_n \( z_k \) \) med arrow.r.double
  med \( B_g \( z_1 \) \, dots.h \, B_g \( z_k \) \) . $

 Moreover, for each $z \, epsilon.alt > 0$,
$ lim_(ell arrow.r oo) limsup_(n arrow.r oo) bb(P) {sum_(a > ell) chevron.l x_a \, \( z + T H \)^(- 1) x_a
  chevron.r_mu > epsilon.alt} = 0 . $

]
] <prop:trace-goe>

We separate fixed-coordinate convergence from the estimate uniform in the number of coordinates.
  For a vector-valued function $f$, let

$ parallel f parallel_(z \, n)^2 = z mu \| f \|^2 + T cal(E) \( f \) \, $

where the energy includes the sum over vector components.
  The notation $parallel f parallel_oo$ means $sup_X \| f \( X \) \|$ in the Euclidean norm of the target space,
  or its Hilbert–Schmidt norm for matrix targets. We allow a polynomial number of components:
  summing an exponentially small scalar remainder over that many components still gives a negligible error for
  each fixed polynomial supremum bound. The resolvent identity in variational form is

$ chevron.l S \, \( z + T H \)^(- 1) S chevron.r_mu = sup_f { 2 mu \[ S dot.op f \] -
  parallel f parallel_(z \, n)^2 } = (sup_(parallel f parallel_(z \, n) lt.eq 1) mu \[ S dot.op f \])^2 . $

This formula applies to both scalar and vector sources.

#thm([Lemma 7.2.])[
  (Fixed coordinates).  #emph[For every fixed $ell$ and every finite collection of positive $z$,
    the corresponding sums over $1 lt.eq a lt.eq ell$ converge jointly to the same restrictions of (7.1).]
] <lem:trace-fixed>

#proof[
  Use the quenched subsequential realization from Section 2.
    For a fixed coordinate the source has bounded $L^2$ norm on the represented sequence,
    by the static moment convergence. Its resolvent optimizer therefore has bounded $L^2$ norm and bounded scaled
    energy. Markov contraction also gives a polynomial supremum bound: $parallel x_a parallel_oo lt.eq n^(1 \/ 6)$ and
  $ parallel \( z + T H \)^(- 1) x_a parallel_oo lt.eq z^(- 1) n^(1 \/ 6) . $
  The lower form bound (6.22), together with weak lower semicontinuity of the mass term,
    bounds the upper limit of the variational expression. Source pairings pass to the limit by first cutting off
    $x_a$, using static cylinder convergence, and then removing the cutoff with the fixed-coordinate moment bounds.
  Conversely, the correctors (6.21) give the variational lower bound for every smooth compact cylinder test:
    first take $n arrow.r oo$ at a fixed recovery polynomial $Q_j$, and then take $j arrow.r oo$.
    The polynomial supremum exponent may depend on $j$, which is harmless in this order of limits.
    The cylinder core in Proposition 22 extends it to the full form domain.
    The two variational bounds identify the limiting resolvent.
    The same argument uses one subsequence for the finitely many sources and parameters under consideration,
    proving the joint assertion. ◻
]

=== 7.1 Moving a vector pairing to the smallest cap <moving-a-vector-pairing-to-the-smallest-cap>

For a vector test $f = \( f_a \)_(a > ell)$, put $F_p = bb(E) \[ f divides h_p \]$, componentwise.
  We use the ordinary observation law $Q_mu$, and all its expectations below are at fixed disorder.
  The scale is $r = n^(- 1 \/ 3 + delta)$, with the fixed $delta$ chosen in Section 2.

#thm([Lemma 7.3.])[
  (Observation replacement).  #emph[Uniformly over vector tests satisfying $parallel f parallel_(z \, n) lt.eq
    1$ and a fixed polynomial supremum bound,
#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(a > ell) mu \[ f_a x_a \] = n^(- 1 \/ 3) sum_(a > ell) Q_mu
   #scale(x: 120%, y: 120%)[\[] \( F_r \)_a \( U^t m_r \)_a #scale(x: 120%, y: 120%)[\]] +
   o_(bb(P)) \( 1 \) . $ <eq:source-41>]

 The error is uniform in $ell$ and in the number of vector components.]
] <lem:trace-replacement>

#proof[
  The posterior means of $f$ and $X$ are martingales as the observation precision increases.
    If $c < p lt.eq 2 c$, orthogonality of martingale increments bounds the change in their pairing by
  $ n^(- 1 \/ 3) #scale(x: 120%, y: 120%)[\(] Q_mu \| F_p -
    F_c \|^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] Q_mu \| m_p -
    m_c \|^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C n^(- 2 \/ 3) c^(- 1) #scale(x: 120%, y: 120%)[\(]
    Q_mu \| m_p \|^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) + o \( 1 \) . $
  Here (4.1) bounds the first increment by $C n^(- 1 \/ 3) c^(- 1)$;
    its exponentially small remainder can be summed over at most $n$ components with polynomially bounded
    supremum. The moment estimate (3.5), with $M_p = \( n p \)^(1 \/ 2)$,
    makes the last bound of order $n^(- 1 \/ 6) p^(- 1 \/ 2)$, apart from tight constants.
    On a geometric list beginning at $r$, these deterministic weights sum to $O \( n^(- delta \/ 2) \)$.
  For completeness, no simultaneous bound on the maximum of all these random constants is required.
    Restrict first to the common disorder events on which (4.1) holds with a fixed constant.
    Average the weighted sum over the biased rotation law, use (3.5), and then use $L_compose gt.eq
    1 \/ 2$ and Markov’s inequality to return to ordinary disorder probability.
    The probability of the discarded disorder events can be made arbitrarily small.
  At the fixed upper endpoint $p_(*)$, the difference from the original pairing is bounded directly using (4.1)
    and $\| X \| = sqrt(n)$. It is $O \( n^(- 1 \/ 6) \)$. Combining this endpoint estimate with the geometric sum
    proves the lemma. All inequalities use vector norms, so their constants do not grow with the vector dimension. ◻
]

=== 7.2 Angular integration by parts and a summable tail <angular-integration-by-parts-and-a-summable-tail>

We next bound the right side of (7.2). By (3.6), replacing $m_r$ there by $m_r^(upright("sp"))$ costs
  $o_(bb(P)) \( 1 \)$, uniformly over the tests in the lemma.
  Indeed its annealed squared error is bounded by a constant times $n^(- 2 \/ 3) M_r^2 n^(- 1 \/ 20) =
  n^(delta - 1 \/ 20)$. On the cap annulus, radial symmetry of the spherical posterior gives

$ n^(- 1 \/ 3) \( U^t m_r^(upright("sp")) \)_a = t \( parallel h_r parallel \) u_a \, wide u = u_r \, $

on the active coordinate space, and zero on its orthogonal complement. The saddle bounds make $t$ bounded.
  Insert a smooth radial cutoff supported in the annulus and equal to one on a smaller annulus containing the
  event in (3.1). The discarded contribution is negligible by its power-exponential probability and the polynomial
  bounds. Write $theta \( u \)$ for the resulting bounded radial multiplier.

Fix $m_0 = 50$ and define $R_0 = sum_(j = 1)^(m_0) u_j^2$.
  On the tight spectral sets and for sufficiently large $n$, these leading coordinates are all active.
  For $a > ell$ active and $j lt.eq m_0$, let $delta_(a j)$ be the coefficient in (5.9).
  Taking $ell$ beyond a tight index cutoff gives $delta_(a j) gt.eq c a^(2 \/ 3)$. Define

#[#set math.equation(numbering: n => "(7.3)")
 $ cal(V)_a & = sum_(j = 1)^(m_0) frac(u_j, R_0 delta_(a j)) \( u_j partial_a - u_a partial_j \) \,\
\| cal(V)_a \| & lt.eq C a^(- 2 \/ 3) (1 + frac(\| u_a \|, sqrt(R_0))) \, wide \| "div" cal(V)_a \| lt.eq
  C a^(- 2 \/ 3) frac(\| u_a \|, R_0) . $ <eq:source-42>]

The vector field is tangent to Euclidean spheres. It therefore annihilates $theta$ and every radial term in the
  spherical log density. The normalization of $delta_(a j)$ gives the exact identity

$ cal(V)_a (- 1 / 2 h_r^t B_r^(- 1) h_r) = - u_a . $

We record the integrability needed to use these fields. In the biased law $upright(bold(P))$,
  the first $m_0$ signal coordinates have a uniformly bounded joint density on each tight spectral set,
  by the conditioning construction of $Pi$ and its finite-dimensional version.
  Their signal multipliers $B_(r \, j) \/ r^2$ are bounded away from zero.
  Adding independent observation noise preserves a uniform density bound. Hence, for every $q < m_0 \/ 2$,

$ upright(bold(E)) R_0^(- q) lt.eq C_q . $

For example, integrate the bounded density over the unit ball in $bb(R)^(m_0)$ and use $R_0^(- q) lt.eq
  1$ outside that ball. All individual $u_a$ also have uniformly bounded moments of every fixed order.
  Thus, with $s_ell = sum_(a > ell) a^(- 4 \/ 3)$ and with sums restricted to active indices,

$ upright(bold(E)) sum_(a > ell) \| "div" cal(V)_a \|^2 lt.eq C s_ell \,
  wide ∥sum_(a > ell) \| cal(V)_a \|^2∥_(L^2 \( upright(bold(P)) \)) lt.eq C s_ell . $

The second estimate follows from Minkowski’s inequality and

$ (upright(bold(E)) u_a^4 / R_0^2)^(1 \/ 2)
  lt.eq \( upright(bold(E)) u_a^8 \)^(1 \/ 4) \( upright(bold(E)) R_0^(- 4) \)^(1 \/ 4) . $

In particular, the dimensions of the active cap never enter these bounds.

The ordinary observation density in $u$ is proportional to

$ L_r \( u \) exp {phi.alt_r^(upright("sp")) \( h_r \) - 1 / 2 h_r^t B_r^(- 1) h_r} . $

Integration by parts therefore gives

$ sum_(a > ell) Q_mu \[ theta \( F_r \)_a u_a \] =  & sum_(a > ell) Q_mu \[ theta cal(V)_a \( F_r \)_a \]\
 & + sum_(a > ell) Q_mu \[ theta \( F_r \)_a "div" cal(V)_a \]\
 & + sum_(a > ell) Q_mu \[ theta \( F_r \)_a cal(V)_a log L_r \] . $

These three terms correspond respectively to differentiating the test, the vector field,
  and the comparison density. The first is bounded by Cauchy–Schwarz using $Q_mu sum_a \| cal(V)_a \|^2$ and $Q_mu
  sum_a \| nabla_u \( F_r \)_a \|^2$; the latter is bounded by the vector version of (5.4).
  The second uses $Q_mu \| F_r \|^2 lt.eq z^(- 1)$ and the divergence estimate above.
  For the third, put $W_ell = sum_(a > ell) \| cal(V)_a \|^2$. Then

$ upright(bold(E)) sum_(a > ell) \| cal(V)_a log L_r \|^2 lt.eq
  parallel W_ell parallel_(L^2 \( upright(bold(P)) \)) #scale(x: 120%, y: 120%)[\(] upright(bold(E)) \| nabla_u
  log L_r \|^4 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = o \( 1 \) s_ell $

by (3.6). Transferring these nonnegative bounds to ordinary disorder with $L_compose gt.eq
  1 \/ 2$ and Markov’s inequality shows that the entire pairing is $O_(bb(P)) \( s_ell^(1 \/ 2) \) +
  o_(bb(P)) \( 1 \)$, uniformly over the tests. More precisely,
  for each $eta > 0$ one first chooses a deterministic index $L_eta$ and bounds on the spectral, variance,
  and gradient constants, outside disorder events of probability at most $eta$.
  The displayed moment estimates then hold with a constant $C_eta$ for every $ell gt.eq L_eta$, uniformly in $n$.
  This is the uniformity in the tail index that will be used below.
  The integration by parts is justified first with a cutoff away from $R_0 = 0$ and then without it.
  If $chi \( R_0 \/ epsilon \)$ is such a cutoff, then

$ \| cal(V)_a chi \( R_0 \/ epsilon \) \| lt.eq C a^(- 2 \/ 3) frac(\| u_a \|, R_0)
  upright(bold(1))_({ R_0 lt.eq 2 epsilon }) . $

The squared norms of these cutoff terms sum to a quantity tending to zero by the coordinate and inverse moments
  above. They are therefore harmless against the vector $F_r$ by Cauchy–Schwarz.
  At fixed $n$ the observation density is smooth on its active space.

#proof[
  Let $B_(n \, > ell) \( z \)$ denote the tail trace in the proposition.
    If it is at least $epsilon.alt$, its normalized optimizer is
  $ f = frac(\( z + T H \)^(- 1) \( x_a \)_(a > ell), sqrt(B_(n \, > ell) \( z \))) . $
  It has $parallel f parallel_(z \, n) = 1$ and $parallel f parallel_oo lt.eq
    n^(1 \/ 6) \/ \( z sqrt(epsilon.alt) \)$, since $\| \( x_a \)_(a > ell) \| lt.eq n^(1 \/ 6)$ pointwise.
    It is therefore an admissible test for the uniform estimates above.
    Lemma 36 and the angular calculation imply that its pairing with the source vanishes in probability in the
    double limit $n arrow.r oo$, then $ell arrow.r oo$. That pairing equals $sqrt(B_(n \, > ell) \( z \))$.
    In the localized form just described, Markov’s inequality gives,
    for each fixed $epsilon.alt > 0$ and every $ell gt.eq L_eta$,
  $ limsup_(n arrow.r oo) bb(P) { B_(n \, > ell) \( z \) > epsilon.alt } lt.eq eta + C_eta epsilon.alt^(- 1) s_ell . $
  Letting $ell arrow.r oo$ and then $eta arrow.b 0$ proves the asserted tail estimate.
  Combine it with Lemma 35. The tail estimate and tightness of one sufficiently long fixed-coordinate sum first
    give tightness of the full $B_n \( z \)$. Each limiting finite partial sum is therefore bounded by the same
    tightness bounds, uniformly in its length: apply convergence of that partial sum and its pointwise bound by
    $B_n \( z \)$. Monotonicity now shows that the limiting series is finite almost surely.
    The tail estimate then proves full trace convergence, jointly at finitely many parameters.
    Finiteness at all positive $z$ follows first at positive rationals and then everywhere by resolvent monotonicity. ◻
]

=== 7.3 A quadratic feature needed for disorder comparison <a-quadratic-feature-needed-for-disorder-comparison>

One more Gaussian estimate will allow the trace to be compared across entry distributions.
  Regard $X X^t \/ n$ as a vector in the space of matrices with the Hilbert–Schmidt inner product, and set

$ B_n^(\[ 2 \]) \( z \) = sum_(i \, j = 1)^n ⟨frac(X_i X_j, n) \, \( z + T H \)^(- 1) frac(X_i X_j, n)⟩_mu . $

This feature has pointwise squared norm one, so $0 lt.eq B_n^(\[ 2 \]) \( z \) lt.eq z^(- 1)$.

#thm([Proposition 7.4.])[
  (Vanishing quadratic-feature trace).  #emph[For Gaussian disorder and every $z > 0$,
#[#set math.equation(numbering: n => "(7.4)")
 $ B_n^(\[ 2 \]) \( z \) arrow.r 0 quad upright("in probability") . $ <eq:source-43>]

]
] <prop:trace-second>

#proof[
  Test the feature against a vector $f$ with $parallel f parallel_(z \, n) lt.eq
    1$ and a polynomial supremum bound. By (4.1), replacing $f$ by $F_r$ in this pairing costs
    $O \( n^(- delta) \) + o \( 1 \)$: the feature has norm one and $Q_mu \| f - F_r \|^2 lt.eq
    C r^(- 2) n^(- 2 \/ 3) + o \( 1 \)$. The remaining pairing uses the conditional mean $M_r^(\[ 2 \]) =
    bb(E) \[ X X^t \/ n divides h_r \]$. If $X \, X'$ are independent posterior replicas, then
  $ \| M_r^(\[ 2 \]) \|_(upright("HS"))^2 = bb(E) [(frac(X dot.op X', n))^2\| h_r] . $
  The pair-tail estimate following (3.3), the annulus estimate (3.1),
    and the biased-to-quenched transfer used for (3.5) give
  $ upright(bold(E)) \| M_r^(\[ 2 \]) \|_(upright("HS"))^2 lt.eq C r^2 + C exp \( - n^xi \) \, wide
    Q_mu \| M_r^(\[ 2 \]) \|_(upright("HS"))^2 = o_(bb(P)) \( 1 \) . $
  For the first inequality, split posterior overlaps at $C' r$,
    and on the complementary event use the likelihood-threshold argument from (3.5).
    The second follows by $L_compose$ comparison and Markov’s inequality.
    The $n^2$ matrix components cause no loss in (4.1), because their exponentially small remainders remain
    negligible after summation. The posterior Cauchy–Schwarz bound now makes the pairing vanish uniformly.
    As in the preceding proof, whenever the trace exceeds a fixed $epsilon.alt$,
    the normalized resolvent optimizer has a fixed polynomial supremum bound;
    in this case even a constant bound suffices. The variational formula proves (7.4). ◻
]

== 8 Comparison with sign disorder <sec:comparison>

We now transfer the Gaussian resolvent limits to sign couplings.
  The comparison uses the physical spin coordinates, so it requires no information about eigenvectors for the sign
  model. Its two inputs from Section 7 are the joint Gaussian trace limit (7.1) and the vanishing
  quadratic-feature trace (7.4). The latter will control fourth derivatives of the former.
  We use the Taylor replacement principle of #cite(label("Chatterjee2006"));
  its application here rests on averaged derivative estimates for these dynamical traces.

Let

$ nu_t = \( 1 - t \) sans(N) \( 0 \, 1 \) + t thin 1 / 2 \( delta_(- 1) + delta_1 \) \, wide 0 lt.eq t lt.eq 1 \, $

and write $bb(P)_t \, bb(E)_t$ for independent disorder entries with law $nu_t$.
  Thermal expectations continue to be denoted by $mu$. For a vector-valued feature $S$ define its resolvent trace by

$ B_S \( z \) = chevron.l S \, \( z + T H \)^(- 1) S chevron.r_mu \, wide T = n^(2 \/ 3) \, quad z > 0 \, $

where the inner product sums the feature coordinates. The two features used below are

$ S^(\[ 1 \]) \( X \) = n^(- 1 \/ 3) X \, wide S^(\[ 2 \]) \( X \) = frac(X X^(sans(t)), n) . $

The second takes values in matrices with the Hilbert–Schmidt norm.
  Set $B_n^(\[ k \]) \( z \) = B_(S^(\[ k \])) \( z \)$; thus $B_n^(\[ 1 \]) \( z \) =
  B_n \( z \)$ by orthogonal invariance of the sum defining the trace.
  Positivity of $H$ gives the useful deterministic bounds

#[#set math.equation(numbering: n => "(8.1)")
 $ 0 lt.eq B_n^(\[ 1 \]) \( z \) lt.eq n^(1 \/ 3) / z \, wide 0 lt.eq B_n^(\[ 2 \]) \( z \) lt.eq 1 /
   z . $ <eq:comparison-trivial-traces>]

#thm([Theorem 8.1.])[
  (Trace universality).  #emph[For every $z > 0$,
$ sup_(0 lt.eq t lt.eq 1) bb(E)_t B_n^(\[ 2 \]) \( z \) arrow.r 0 . $

 For each finite collection $z_1 \, dots.h \, z_m > 0$, the vector
   $\( B_n \( z_1 \) \, dots.h \, B_n \( z_m \) \)$ under sign disorder converges in law to the Gaussian limiting
   vector in (7.1). In particular the coefficient $c_(*)$ in that limit is unchanged.]
] <thm:comparison-universality>

The proof first compares the bounded second-feature traces.
  Their vanishing then supplies the additional estimate needed to compare the first-feature traces.
  We begin with a static estimate that applies throughout the mixture.

=== 8.1 Uniform static overlap control <uniform-static-overlap-control>

For two independent spins under $mu$, write $rho \( X \, X' \) = n^(- 1) X dot.op X'$.
  The following estimate also controls correlations after multiplying $mu$ by a density that depends on the disorder.

#thm([Lemma 8.2.])[
  #emph[For every $0 < epsilon.alt lt.eq 1$ there is $a_epsilon.alt > 0$ such that
#[#set math.equation(numbering: n => "(8.2)")
 $ sup_(0 lt.eq t lt.eq 1) bb(P)_t {mu^(⊗ 2) \( \| rho \| gt.eq epsilon.alt \) > e^(- a_epsilon.alt n)} arrow.r
   0 . $ <eq:comparison-overlap-tail>]

 Consequently, for fixed $C \, K < oo$, uniformly over nonnegative,
   possibly disorder-dependent functions $p$ satisfying $mu p lt.eq 1$ and $parallel p parallel_oo lt.eq C n^K$,
   the quantities
$ 1 / binom(n, 2) sum_(i < j) \| mu \[ p X_i X_j \] \| $

 converge to zero in probability, uniformly in $t$. They also converge to zero in expectation, uniformly in $t$.]
] <lem:comparison-overlap>

#proof[
  Let $Z$ denote the partition function with uniform cube probability as its reference measure.
    The moment generating function $m_t \( v \) = bb(E)_t e^(v J_12)$ satisfies
  $ m_t \( v \) lt.eq e^(v^2 \/ 2) \, wide log m_t \( n^(- 1 \/ 2) \) gt.eq frac(1, 2 n) - C / n^2 \, $
  with constants independent of $t$. If $Z_A^(\( 2 \))$ is the two-replica partition function restricted to an
    event $A$ depending on $rho$, independence of the entries therefore gives
  #[#set math.equation(numbering: n => "(8.3)")
   $ frac(bb(E)_t Z_A^(\( 2 \)), \( bb(E)_t Z \)^2) lt.eq C thin bb(E)_(upright("cube")) #h(-0.16667em)
     [e^(n rho^2 \/ 2) upright(bold(1))_A] . $ <eq:comparison-annealed-pair>]
  Here the expectation on the right is over two independent uniform cube spins.
    Indeed the pair exponent uses $\( X_i X_j + X'_i X'_j \)^2 = 2 + 2 X_i X'_i X_j X'_j$;
    summing over $i < j$ produces $n rho^2 \/ 2$ after division by the squared first moment,
    with only a bounded factor remaining.
  Put
  $ I \( r \) = frac(\( 1 + r \) log \( 1 + r \) + \( 1 - r \) log \( 1 - r \), 2) \, wide - 1 lt.eq r lt.eq 1 \, $
  with $0 log 0 = 0$. The binomial bound $bb(P)_(upright("cube")) \( rho = r \) lt.eq
    e^(- n I \( r \))$ and the fact that there are $n + 1$ possible overlaps show that the right side of (8.3) is
    at most $C \( n + 1 \)$. On $A = { \| rho \| gt.eq epsilon.alt }$ it is at most
  #[#set math.equation(numbering: n => "(8.4)")
   $ C \( n + 1 \) e^(- n kappa_epsilon.alt) \, wide kappa_epsilon.alt = I \( epsilon.alt \) -
     epsilon.alt^2 \/ 2 > 0 . $ <eq:comparison-entropy-gap>]
  For the strict inequality, $I' \( r \) - r = "arctanh" \( r \) - r > 0$ for $0 < r < 1$,
    and continuity handles $r = 1$.
  We next obtain a lower bound for the quenched partition function.
    The unrestricted second-moment estimate and Paley–Zygmund imply
  $ bb(P)_t { Z gt.eq 1 / 2 bb(E)_t Z } gt.eq frac(c, n + 1) . $
  Clip every entry to $\[ - log n \, log n \]$, and let $Z_L$ be the resulting partition function.
    The probability that any entry changes is at most $C n^2 e^(- \( log n \)^2 \/ 2)$, uniformly in $t$.
    Changing one clipped entry changes $log Z_L$ by at most $2 log n \/ sqrt(n)$.
    Bounded differences hence gives, for each $eta > 0$,
  $ bb(P)_t {\| log Z_L - bb(E)_t log Z_L \| > eta n} lt.eq 2 exp #h(-0.16667em) (- frac(c eta^2 n, \( log n \)^2)) . $
  This upper bound is smaller than $c \/ \( 2 \( n + 1 \) \)$ for large $n$.
    The preceding Paley–Zygmund event thus forces $bb(E)_t log Z_L gt.eq log bb(E)_t Z -
    eta n$ for all sufficiently large $n$, after adjusting $eta$ by a fixed factor.
    Concentration once more shows that, for every fixed $eta > 0$,
  #[#set math.equation(numbering: n => "(8.5)")
   $ sup_t bb(P)_t { Z < e^(- eta n) bb(E)_t Z } arrow.r 0 . $ <eq:comparison-partition-lower>]
  Use (8.4) and Markov’s inequality to bound $Z_A^(\( 2 \)) lt.eq
    e^(- 3 kappa_epsilon.alt n \/ 4) \( bb(E)_t Z \)^2$ with probability tending to one.
    On the event in (8.5) with $eta = kappa_epsilon.alt \/ 8$,
    division by $Z^2$ proves (8.2) with $a_epsilon.alt = kappa_epsilon.alt \/ 2$.
  For the last assertion, an exact identity is
  #[#set math.equation(numbering: n => "(8.6)")
   $ 1 / binom(n, 2) sum_(i < j) mu \[ p X_i X_j \]^2 =
     frac(n mu^(⊗ 2) \[ p \( X \) p \( X' \) rho^2 \] - \( mu p \)^2, n - 1) . $ <eq:comparison-weighted-overlap>]
  On the event supplied by (8.2), the replica integral on the right is at most $epsilon.alt^2 +
    C^2 n^(2 K) e^(- a_epsilon.alt n)$. First let $n arrow.r oo$ and then $epsilon.alt arrow.b 0$.
    Cauchy–Schwarz gives the asserted average of absolute correlations.
    This average is bounded by $mu p lt.eq 1$, which also gives the uniform convergence in expectation. ◻
]

=== 8.2 Perturbing one interaction <perturbing-one-interaction>

Fix an arbitrary disorder matrix, one of the two features $S$, and $z > 0$.
  All estimates in this subsection are deterministic unless an expectation over disorder is displayed.
  Let $e = { i \, j }$ be an unordered pair, set $q = X_i X_j$,
  and add $theta$ to its interaction coefficient $J_(i j) \/ sqrt(n)$.
  Writing $u = tanh theta$, the perturbed Gibbs probability has density $\( 1 + u q \) \/ \( 1 + u mu q \)$
  relative to $mu$.

It is convenient to work first with the unnormalized measure $\( 1 + u q \) mu$.
  Let $M \( u \)$ be the mass-plus-energy form for its heat-bath operator:

$ M \( u \) \( f \, g \) = z mu \[ \( 1 + u q \) f dot.op g \] + T cal(E)_u^(upright("un")) \( f \, g \) \, wide
  b \( u \) \( g \) = mu \[ \( 1 + u q \) S dot.op g \] . $

Here $cal(E)_u^(upright("un"))$ is the heat-bath Dirichlet form integrated against $\( 1 + u q \) mu$.
  Put $M = M \( 0 \)$, write $parallel g parallel_M^2 = M \( g \, g \)$ and $parallel dot.op
  parallel_(*)$ for its dual norm, and define

$ Y = M^(- 1) b \( 0 \) = \( z + T H \)^(- 1) S \, quad B = B_S \( z \) = M \( Y \, Y \) \, quad
  d = \( 1 + B \)^(1 \/ 2) . $

The feature coordinates are contracted in every form and dual pairing.
  Expand $M \( u \) = sum_(a gt.eq 0) u^a M_a$ and $b \( u \) = b_0 + u b_1$;
  the indices $a$ here denote Taylor coefficients, not sites. The quantities that measure the effect of the pair are

#[#set math.equation(numbering: n => "(8.7)")
 $ Gamma_e = T / d^2 sum_(k in e) mu \[ w_k \| D_k Y \|^2 \] \, wide R_e = 1 / d parallel b_1 -
   M_1 Y parallel_(*) . $ <eq:comparison-sensitivities>]

We use $"avg"_e$ for the average over the $binom(n, 2)$ pairs. Counting each site in $n - 1$ pairs gives

#[#set math.equation(numbering: n => "(8.8)")
 $ 0 lt.eq Gamma_e lt.eq 1 \, wide "avg"_e Gamma_e = 2 / n frac(T cal(E) \( Y \), 1 + B) lt.eq 2 /
   n . $ <eq:comparison-energy-average>]

Gaussian and sign entries have the same first three moments,
  so the comparison uses a fourth-order Taylor remainder. The derivative estimates below will require fourth-power
  averages of $R_e$.

#thm([Lemma 8.3.])[
  (Residual estimates).  #emph[Uniformly over the disorder and the pair $e$,
#[#set math.equation(numbering: n => "(8.9)")
 $ R_e^2 lt.eq frac(2 T, z) Gamma_e . $ <eq:source-44>]

 For $S = S^(\[ 2 \])$ one also has $R_e^2 lt.eq C_z$, whereas for $S = S^(\[ 1 \])$,
#[#set math.equation(numbering: n => "(8.10)")
 $ R_e^2 lt.eq C_z #scale(x: 120%, y: 120%)[\(] 1 + n^(1 \/ 3) sqrt(B_n^(\[ 2 \]) \( z \))
   #scale(x: 120%, y: 120%)[\)] . $ <eq:source-45>]

 Consequently $"avg"_e R_e^2 lt.eq C_z n^(- 1 \/ 3)$. Its fourth-power analogue is $"avg"_e R_e^4 lt.eq
   C_z n^(- 1 \/ 3)$ for $S^(\[ 2 \])$, and
#[#set math.equation(numbering: n => "(8.11)")
 $ "avg"_e R_e^4 lt.eq C_z #scale(x: 120%, y: 120%)[\(] n^(- 1 \/ 3) +
   sqrt(B_n^(\[ 2 \]) \( z \)) #scale(x: 120%, y: 120%)[\)] wide upright("for ") S^(\[ 1 \]) . $ <eq:source-46>]

]
] <lem:comparison-residual>

#proof[
  For a site $k in.not e$, the energy multiplier in $M \( u \)$ is $1 + u q$.
    At an endpoint $k in e$, let $s$ be the other spin in the pair.
    Its conditional mean changes from $t_k$ to $\( t_k + u s \) \/ \( 1 + u s t_k \)$,
    while the marginal measure on $X_(- k)$ acquires the factor $1 + u s t_k$. Thus its energy term has the multiplier
  #[#set math.equation(numbering: n => "(8.12)")
   $ frac(1 - u^2, 1 + u s t_k) $ <eq:comparison-endpoint-multiplier>]
  relative to $mu \[ w_k D_k f dot.op D_k g \]$. Since $\| t_k \| lt.eq 1$,
    these formulas show that $parallel M_a parallel_(M arrow.r M^(*)) lt.eq C^a$ and, for $a gt.eq 2$,
    that $M_a$ uses only the two endpoint energies. In particular,
  #[#set math.equation(numbering: n => "(8.13)")
   $ parallel M_a Y parallel_(*) & lt.eq C^a d sqrt(Gamma_e) \, & \| M_a \( Y \, Y \) \| & lt.eq
     C^a d^2 Gamma_e quad \( a gt.eq 2 \) \,\
parallel M_1 Y parallel_(*) & lt.eq C sqrt(B) . $ <eq:comparison-coefficient-locality>]
  Write $E_k g = mu \[ g divides X_(- k) \]$. Testing the equation $M Y = b_0$ against $q g$ gives the exact identity
  #[#set math.equation(numbering: n => "(8.14)")
   $ \( b_1 - M_1 Y \) \( g \) = T sum_(k in e) mu \[ w_k D_k Y dot.op s E_k g \] . $ <eq:comparison-residual-identity>]
  To verify it, the mass terms and all sites outside $e$ cancel.
    At an endpoint, $D_k \( q g \) = s \( g \( X_k = 1 \) + g \( X_k = - 1 \) \) \/ 2$,
    whereas the first coefficient in (8.12) is $- s t_k$. The remaining sum is $s E_k g$.
    Cauchy–Schwarz and conditional Jensen now give
  $ \| \( b_1 - M_1 Y \) \( g \) \|^2 lt.eq d^2 Gamma_e T sum_(k in e) mu \[ w_k \| E_k g \|^2 \] lt.eq
    frac(2 T, z) d^2 Gamma_e parallel g parallel_M^2 \, $
  which proves (8.9).
  By (8.13), $R_e^2 lt.eq C_z \( 1 + parallel b_1 parallel_(*)^2 \)$.
    For the second feature, $parallel q S^(\[ 2 \]) parallel_(L^2 \( mu \)) = 1$,
    so $parallel b_1 parallel_(*)^2 lt.eq 1 \/ z$. For the first feature,
    use the stationary heat-bath process at the fixed disorder to write
  $ parallel b_1 parallel_(*)^2 & = n^(1 \/ 3) integral_0^oo e^(- z s) bb(E)_mu #h(-0.16667em)
    [q \( X_0 \) q \( X_(T s) \) rho \( X_0 \, X_(T s) \)] thin d s\
 & lt.eq n^(1 \/ 3) (1 / z integral_0^oo e^(- z s) bb(E)_mu \[ rho \( X_0 \, X_(T s) \)^2 \] thin d s)^(1 \/ 2) =
   n^(1 \/ 3) sqrt(B_n^(\[ 2 \]) \( z \) \/ z) . $
  The last equality is the Hilbert–Schmidt feature identity $chevron.l X X^(sans(t)) \/ n \,
    X' X' ""^(sans(t)) \/ n chevron.r = rho \( X \, X' \)^2$. This proves (8.10).
    Finally, (8.9) and (8.8) give the second-power average. Multiplying it by the respective pointwise bound on
    $R_e^2$ proves both fourth-power estimates. ◻
]

The residual is small on average because a single pair touches only two site energies.
  The other contribution to a trace derivative is a correlation with $q$.
  The static overlap estimate controls precisely this contribution. Define

#[#set math.equation(numbering: n => "(8.15)")
 $ h_e = \| mu q \| + d^(- 2) \| M_1 \( Y \, Y \) \| + R_e + sqrt(Gamma_e) . $ <eq:comparison-h>]

#thm([Lemma 8.4.])[
  (Averaged sensitivities).  #emph[For either feature, $"avg"_e \( h_e + h_e^4 \) lt.eq C_z$ deterministically.
    There is a deterministic sequence $epsilon.alt_n arrow.r 0$ such that, uniformly $t in \[ 0 \, 1 \]$,
#[#set math.equation(numbering: n => "(8.16)")
 $ bb(E)_t "avg"_e \( h_e + h_e^4 \) & lt.eq epsilon.alt_n &  & upright("for ") S^(\[ 2 \]) \,\
bb(E)_t "avg"_e \( h_e + h_e^4 \) & lt.eq epsilon.alt_n +
  C_z bb(E)_t sqrt(B_n^(\[ 2 \]) \( z \)) &  & upright("for ") S^(\[ 1 \]) . $ <eq:comparison-average-second>]

]
] <lem:comparison-average>

#proof[
  The first two terms in (8.15) are bounded by constants. For the second of them introduce the nonnegative function
  $ p_Y = frac(z \| Y \|^2 + T sum_k w_k \| D_k Y \|^2, d^2) . $
  Its mass is $B \/ \( 1 + B \) lt.eq 1$. The Markov resolvent representation yields $parallel Y parallel_oo lt.eq
    parallel S parallel_oo \/ z$, with vector norm intended, and hence $parallel p_Y parallel_oo lt.eq
    C_z n^2$ for the first feature and $parallel p_Y parallel_oo lt.eq C_z n^(5 \/ 3)$ for the second.
    The endpoint formula gives
  $ lr(|d^(- 2) M_1 \( Y \, Y \) - mu \[ q p_Y \]|) lt.eq 2 Gamma_e . $
  Lemma 39, first with $p = 1$ and then with $p = p_Y$, therefore shows that these first two terms have vanishing
    pair averages in expectation, uniformly in $t$. Their fourth powers have the same property because the terms
    are bounded. The remaining terms are controlled by (8.8), Lemma 40, and Cauchy–Schwarz:
  $ "avg"_e R_e lt.eq C_z n^(- 1 \/ 6) \, wide "avg"_e sqrt(Gamma_e) lt.eq sqrt(2 \/ n) . $
  Combining these estimates proves (8.16) and (8.16). The deterministic bound follows from the same estimates and
    $B_n^(\[ 2 \]) \( z \) lt.eq 1 \/ z$. ◻
]

=== 8.3 Fourth derivatives of bounded trace observables <fourth-derivatives-of-bounded-trace-observables>

The first trace need not be bounded uniformly in $n$. We compare it through the bounded coordinate
  $\( 1 + B \)^(- 1)$. The next lemma turns the preceding sensitivities into the derivative estimate needed for
  replacement.

#thm([Lemma 8.5.])[
  #emph[Fix finitely many traces $B_a = B_n^(\[ k_a \]) \( z_a \)$, with $k_a in { 1 \, 2 }$ and $z_a > 0$,
    and a smooth function $F$ on a neighborhood of $\[ 0 \, 1 \]^m$.
    For an arbitrary base disorder and pair $e$, let $B_a \( theta \)$ denote the traces after adding $theta$ to
    the interaction coefficient of $e$, and let $frak(h)_e = sum_(a = 1)^m h_(e \, a)$,
    with each sensitivity computed at the base disorder. Then for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(8.17)")
 $ sup_(\| theta \| lt.eq 2 log n \/ sqrt(n))
   lr(|frac(d^4, d theta^4) F (frac(1, 1 + B_1 \( theta \)) \, dots.h \, frac(1, 1 + B_m \( theta \)))|) lt.eq
   C_F \( frak(h)_e + frak(h)_e^4 \) . $ <eq:comparison-fourth-derivative>]

 At every real base disorder, derivatives of orders at most four also have a deterministic bound polynomial in $n$.]
] <lem:comparison-derivative>

#proof[
  We first consider one trace. Complexify the finite-dimensional form space,
    extending the forms and dual pairings complex bilinearly.
    The coefficient bounds for $M \( u \)$ imply that $M^(- 1 \/ 2) M \( u \)
    M^(- 1 \/ 2)$ differs from the identity in norm by $O \( \| u \| \)$ on a fixed disk.
    Its inverse is therefore analytic and uniformly bounded on a smaller fixed disk.
    Put $r \( u \) = b \( u \) - M \( u \) Y$ and $A \( u \) = b \( u \) M \( u \)^(- 1) b \( u \)$.
    Completing the quadratic expression around $Y$ gives the algebraic identity
  $ A \( u \) = 2 b \( u \) Y - M \( u \) \( Y \, Y \) + r \( u \) M \( u \)^(- 1) r \( u \) . $
  The coefficient of $u$ in $\( A \( u \) - B \) \/ d^2$ is
  $ frac(M_1 \( Y \, Y \) + 2 \( b_1 - M_1 Y \) \( Y \), d^2) \, $
  whose absolute value is at most $C h_e$. For higher coefficients, (8.13) gives
  $ frac(parallel r_1 parallel_(*), d) = R_e \, wide frac(parallel r_a parallel_(*), d) lt.eq
    C^a sqrt(Gamma_e) quad \( a gt.eq 2 \) . $
  The direct term $- M_a \( Y \, Y \) \/ d^2$ is at most $C^a Gamma_e$.
    Coefficients of the residual quadratic term are bounded, using the analytic inverse,
    by $C^a \( R_e^2 + R_e sqrt(Gamma_e) + Gamma_e \) lt.eq C^a h_e^2$.
    Thus every coefficient of order $a gt.eq 2$ in $\( A \( u \) - B \) \/ d^2$ is bounded by $C^a h_e^2$.
  The actual trace divides $A \( u \)$ by the total mass $1 + u mu q$. Thus, with
  $ delta \( u \) = frac(B \( u \) - B, d^2) \, $
  its linear coefficient is $O \( h_e \)$ and its coefficients of order $a gt.eq
    2$ are bounded by $C^a \( h_e + h_e^2 \)$. From (8.10) and (8.1), $h_e lt.eq
    C_z \( 1 + n^(1 \/ 6) \)$ for the first feature; for the second it is bounded.
    Consequently $\| u \| h_e = o \( 1 \)$ uniformly for $\| u \| lt.eq 2 log n \/ sqrt(n)$.
    Summing the coefficient bounds on this interval gives
  $ sup \| delta \( u \) \| = o \( 1 \) \, wide \| delta' \( u \) \| lt.eq C h_e \,
    wide \| delta^(\( a \)) \( u \) \| lt.eq C \( h_e + h_e^2 \) \, quad 2 lt.eq a lt.eq 4 . $
  Since
  $ frac(1, 1 + B \( u \)) = 1 / d^2 frac(1, 1 + delta \( u \)) \, $
  the chain rule bounds its fourth derivative, and that of any fixed smooth test of it, by $C \( h_e + h_e^4 \)$.
    The derivatives of $u = tanh theta$ through order four are bounded on the interval in question,
    so the same estimate holds for interaction displacement $theta$.
  For several traces apply the multivariable chain rule and bound every mixed product using $frak(h)_e +
    frak(h)_e^4$. Finally, at any real base point the coefficient argument applies at $theta = 0$,
    where the denominator of the compactification is at least one.
    The bound $h_e lt.eq C \( 1 + n^(1 \/ 6) \)$ supplies the claimed polynomial bounds, uniformly in that base point. ◻
]

=== 8.4 Replacement and the two-feature argument <replacement-and-the-two-feature-argument>

We have obtained a small average fourth derivative under a complete iid mixture disorder.
  Taylor replacement removes an entry before expanding, so its expansion point does not itself have that law.
  The following independent completion lets us use the averaged estimates without changing the Taylor coefficients.

Let

$ Phi \( J \) = F (\( 1 + B_n^(\[ k_1 \]) \( z_1 \) \)^(- 1) \, dots.h \, \( 1 + B_n^(\[ k_m \]) \( z_m \) \)^(- 1)) . $

Differentiating the finite product mixture measure gives exactly

#[#set math.equation(numbering: n => "(8.18)")
 $ frac(d, d t) bb(E)_t Phi = sum_e bb(E)_(t \, - e) #h(-0.16667em)
   [bb(E)_xi Phi \( J_(- e) \, xi \) - bb(E)_g Phi \( J_(- e) \, g \)] \, $ <eq:comparison-mixture-derivative>]

where $xi$ is a symmetric sign, $g$ is standard normal, and $bb(E)_(t \, - e)$ averages all entries other than
  $e$. For fixed $J_(- e)$, Taylor-expand $x mapsto Phi \( J_(- e) \, x \)$ at zero through degree three.
  These polynomial terms cancel in (8.18), since $xi$ and $g$ have the same first three moments.

Independently of both proposed values, draw $J_e^0$ with law $nu_t$, and write $J^0 = \( J_(- e) \, J_e^0 \)$.
  If $\| x \| \, \| J_e^0 \| lt.eq log n$, every point of the Taylor segment between $0$ and $x$ differs from
  $J_e^0$ by at most $2 log n$. Lemma 42, with $J^0$ as its base, therefore bounds the Taylor remainder by

#[#set math.equation(numbering: n => "(8.19)")
 $ C_F frac(\| x \|^4, n^2) #scale(x: 120%, y: 120%)[\(] frak(h)_e \( J^0 \) +
   frak(h)_e \( J^0 \)^4 #scale(x: 120%, y: 120%)[\)] . $ <eq:comparison-remainder>]

The factor $n^(- 2)$ changes four derivatives in the interaction coefficient $J_e \/
  sqrt(n)$ into four derivatives in $J_e$. The factor $\| x \|^4$ is measured from the Taylor center $0$.
  The independently completed entry is used only to bound the derivatives along the segment,
  so it does not enter this factor.

The events $\| g \| > log n$ and $\| J_e^0 \| > log n$ have probability smaller than every fixed inverse power of
  $n$, uniformly in $t$. The boundedness of $Phi$, together with the polynomial derivative bounds in Lemma 42,
  bounds the Taylor polynomial and its remainder by a polynomial in $n$ times $1 + \| x \|^4$.
  Gaussian tail moments thus make the omitted contributions $o \( n^(- 2) \)$, uniformly in $J_(- e)$ and $t$.
  On the remaining event, enlarge the right side of (8.19) by removing its indicator.
  Its $\| x \|^4$ factor is independent of the completed base $J^0$ and has bounded expectation.
  Moreover, if $e$ is chosen uniformly, $J^0$ has the full iid mixture law independently of $e$.
  Summing the remainders in (8.18) therefore yields

#[#set math.equation(numbering: n => "(8.20)")
 $ lr(|frac(d, d t) bb(E)_t Phi|) lt.eq C_F bb(E)_t "avg"_e \( frak(h)_e + frak(h)_e^4 \) + o \( 1 \) \,
   $ <eq:comparison-master-bound>]

uniformly for $0 lt.eq t lt.eq 1$.

#proof[
  First use only second-feature traces in (8.20). For finitely many traces, $frak(h)_e + frak(h)_e^4 lt.eq
    C_m sum_a \( h_(e \, a) + h_(e \, a)^4 \)$. Equation (8.16) therefore makes the mixture derivative tend to
    zero uniformly in $t$. In particular, for one $z$, choose the test $F \( v \) = 1 - v$.
    The Gaussian convergence (7.4) and the bound $B_n^(\[ 2 \]) \( z \) lt.eq 1 \/ z$ imply
  $ sup_t bb(E)_t frac(B_n^(\[ 2 \]) \( z \), 1 + B_n^(\[ 2 \]) \( z \)) arrow.r 0 . $
  Since $b lt.eq \( 1 + 1 \/ z \) b \/ \( 1 + b \)$ for $0 lt.eq b lt.eq 1 \/ z$,
    this proves the first assertion of the theorem and, by Jensen,
    $sup_t bb(E)_t sqrt(B_n^(\[ 2 \]) \( z \)) arrow.r 0$.
  Now use first-feature traces. Equation (8.16) makes their right side in (8.20) tend to zero uniformly in $t$.
    Integrating from $t = 0$ to $t = 1$ shows equality of the limiting expectations of every smooth test of
    finitely many compactified traces. Such tests determine probability laws on $\[ 0 \, 1 \]^m$.
    By Proposition 34, the Gaussian trace vector converges to the finite vector in (7.1);
    its compactification therefore has all coordinates strictly positive almost surely.
    The continuous mapping theorem for the inverse map $v mapsto v^(- 1) -
    1$ recovers the same joint limit for the sign traces. ◻
]

== 9 The functional limit and its randomness <sec:functional>

Proposition 34 and Theorem 38 identify the same finite collections of resolvent traces for Gaussian and sign
  disorder. We first turn these statements into convergence of autocorrelation functions.
  We then prove decay and show that the edge dependence produces a random, rather than deterministic, limit.

=== 9.1 From resolvents to continuous functions <from-resolvents-to-continuous-functions>

Let $E_n$ be the spectral resolution of the nonnegative operator $T H$, and define the finite measure

$ nu_n \( I \) = sum_(i = 1)^n chevron.l n^(- 1 \/ 3) X_i \, E_n \( I \) n^(- 1 \/ 3) X_i chevron.r_mu $

for Borel sets $I subset \[ 0 \, oo \)$. Basis invariance gives

$ B_n \( z \) = integral frac(d nu_n \( lambda \), z + lambda) \, wide A_(n \, J) \( s \) =
  integral e^(- s lambda) thin d nu_n \( lambda \) . $

Although $nu_n \( \[ 0 \, oo \) \) = n^(1 \/ 3)$ diverges, its division by $1 + lambda$ has tight mass.
  This is the reason to use resolvents rather than the unweighted spectral measures.

#thm([Lemma 9.1.])[
  (A continuity principle for spectral measures).  #emph[Let $nu_n$ and $nu$ be random nonnegative measures on
    $\[ 0 \, oo \)$ such that their integrals against $\( 1 + lambda \)^(- 1)$ are finite almost surely,
    for every $n$ and for $nu$. Suppose the corresponding integrals against $\( z + lambda \)^(- 1)$ converge
    jointly in law for every finite collection of positive $z$, including $z = 1$. Then
$ (s mapsto integral e^(- s lambda) thin d nu_n \( lambda \)) med arrow.r.double med
  (s mapsto integral e^(- s lambda) thin d nu \( lambda \)) $

 in $C_(upright("loc")) \( \( 0 \, oo \) \)$.]
] <lem:functional-spectral>

#proof[
  Set $d eta_n = \( 1 + lambda \)^(- 1) d nu_n$ and regard $eta_n$ as a finite measure on the compact space
    $K = \[ 0 \, oo \]$, giving no mass to infinity. Its total mass is the Stieltjes transform at $z = 1$,
    and is therefore tight. Finite measures on $K$ with bounded total mass form a compact set,
    so the laws of $eta_n$ are tight.
  For $z > 0$ the function
  $ k_z \( lambda \) = frac(1 + lambda, z + lambda) \, wide k_z \( oo \) = 1 \, $
  is continuous on $K$. A countable dense family of these functions, including $k_1 = 1$,
    determines a finite measure even when that measure has mass at infinity.
    Indeed their closed linear span contains $1$ and $r_z \( lambda \) = \( z + lambda \)^(- 1)$,
    with $r_z \( oo \) = 0$. The partial-fraction identity $r_z r_w = \( r_z - r_w \) \/ \( w - z \)$,
    followed by uniform limits when $w = z$, shows that this span is an algebra.
    It separates the points of $K$, so it is dense in $C \( K \)$.
    Consequently every subsequential law is the law of $d eta = \( 1 + lambda \)^(- 1) d nu$,
    with no mass at infinity. Here joint convergence on the countable determining family identifies the law of the
    random measure, rather than only its mean.
  For $s > 0$, define $h_s \( lambda \) = \( 1 + lambda \) e^(- s lambda)$ and $h_s \( oo \) = 0$.
    On each compact interval $a lt.eq s lt.eq b$, $a > 0$, the map $s mapsto
    h_s$ is continuous in the uniform norm on $K$. Thus weak convergence of finite measures on $K$ gives
    convergence of their $h_s$ integrals uniformly on $\[ a \, b \]$:
    a finite uniform-norm net of the functions $h_s$ reduces the assertion to finitely many continuous tests,
    while weak convergence bounds the total masses. The resulting map from measures to
    $C_(upright("loc")) \( \( 0 \, oo \) \)$ is continuous. The continuous mapping theorem proves the claim. ◻
]

#thm([Proposition 9.2.])[
  (Identification of the functional limit).  #emph[The series (2.7) has a Borel version $g mapsto
    cal(A)_g$ with values in $C_(upright("loc")) \( \( 0 \, oo \) \)$. For both Gaussian and symmetric-sign entries,
$ "Law" \( A_(n \, J) \) arrow.r.double Q_(upright("crit")) = "Law" \( cal(A)_g \) \, $

 where the same edge law and the same deterministic coefficient $c_(*)$ are used in (2.7).]
] <prop:functional-identification>

#proof[
  For a fixed edge configuration $g$, let $E_g$ be the spectral resolution of $c_(*) H_Pi$ and put
  $ nu_g \( I \) = sum_(a gt.eq 1) chevron.l x_a \, E_g \( I \) x_a chevron.r_Pi . $
  This countable sum defines a nonnegative measure. By Proposition 34, its division by $1 +
    lambda$ has finite mass $B_g \( 1 \)$ almost surely. It follows in particular that the series in (2.7) defines
    a continuous function $cal(A)_g$ on $\( 0 \, oo \)$.
  These constructions are measurable in $g$. The density prescription for $Pi$ makes each cylinder integral
    measurable. Resolvent pairings can then be computed by the variational supremum over a countable family of
    smooth compact cylinders. The family can be chosen independently of $g$ by ordinary approximation of a
    function and its first derivatives on finite-dimensional compact sets; it is a form core by Proposition 22.
    Thus the resolvent pairings, the divided spectral measure determined by them, and $cal(A)_g$ are measurable.
  Apply Lemma 43 to the finite-dimensional trace convergence in Proposition 34 and Theorem 38. For either entry law,
  $ "Law" \( A_(n \, J) \) arrow.r.double Q_(upright("crit")) := "Law" \( cal(A)_g \) quad
    upright("in ") C_(upright("loc")) \( \( 0 \, oo \) \) . $
  The common coefficient is the deterministic $c_(*)$ of Theorem 33; no further change of time is involved. ◻
]

=== 9.2 Decay and positive values <decay-and-positive-values>

The spectral representation makes $cal(A)_g$ nonnegative and nonincreasing.
  Proposition 22 identifies the kernel of $H_Pi$ as the constants.
  Each $x_a$ is centered by sign symmetry of $Pi$, so $nu_g$ has no atom at zero.
  For any fixed $s_0 > 0$, $e^(- s_0 lambda)$ is integrable against $nu_g$.
  Dominated convergence for $s gt.eq s_0$ therefore gives

$ lim_(s arrow.r oo) cal(A)_g \( s \) = 0 . $

There is also a useful positive lower bound. Put $v \( g \) = Pi \[ x_1^2 \]$,
  which is finite by the coordinate moment bounds and strictly positive by full support of the first-coordinate
  marginal. The coordinate is in the form domain with energy one, by Proposition 22.
  Jensen’s inequality for its normalized spectral measure gives

#[#set math.equation(numbering: n => "(9.1)")
 $ cal(A)_g \( s \) gt.eq chevron.l x_1 \, e^(- s c_(*) H_Pi) x_1 chevron.r_Pi gt.eq v \( g \) exp { -
   s c_(*) \/ v \( g \) } > 0 . $ <eq:functional-positive>]

It remains to show that these functions do not have a deterministic law.
  For this we will vary a leading edge point while retaining absolute continuity with respect to the original edge law.

=== 9.3 Finite shifts of the edge process <finite-shifts-of-the-edge-process>

Let $sans(P)$ denote the law of the increasing edge sequence $g$. For an integer $m$ and a vector $h in bb(R)^m$, define

$ T_h g = \( g_1 + h_1 \, dots.h \, g_m + h_m \, g_(m + 1) \, dots.h \) \, $

and let $cal(O)_h$ be the event that this sequence is still strictly increasing.
  We use the restriction of $sans(P)$ to this event, without normalizing its mass.

#thm([Lemma 9.3.])[
  (Absolute continuity under finite shifts).  #emph[For every fixed $m$ and $h in bb(R)^m$,
$ \( T_h \)_(*) \( sans(P) \|_(cal(O)_h) \) lt.double sans(P) . $

 In particular, lowering $g_1$ by any fixed positive amount gives a law absolutely continuous with respect to
   $sans(P)$.]
] <lem:functional-shift>

#proof[
  We prove the claim by finite-dimensional GOE density ratios.
    Let $sans(P)_n$ denote the ordered GOE edge law in dimension $n$.
    When a sequence-valued argument is needed, append the values $g_(n \, n) + j$, $j gt.eq 1$,
    after its final coordinate. This convention does not affect any fixed coordinate for large $n$,
    so $sans(P)_n arrow.r.double sans(P)$ in the product topology; it also commutes with $T_h$ whenever $n > m$.
    In the variables $g_(a \, n) = n^(2 \/ 3) \( 2 - lambda_a \)$, the ordered density is proportional to
  $ exp {- n / 4 sum_(a = 1)^n \( 2 - n^(- 2 \/ 3) g_(a \, n) \)^2} product_(i < j) \( g_(j \, n) - g_(i \, n) \) . $
  Translation of the first $m$ variables has Jacobian one. Its Gaussian log-density ratio is $n^(1 \/ 3)
    sum_(k lt.eq m) h_k + O \( 1 \)$ on sets where the first $m$ coordinates are bounded.
    For a fixed $k lt.eq m$, the spectral estimates of Section 2 give, tightly,
  $ sum_(m < i lt.eq n) frac(1, g_(i \, n) - g_(k \, n)) = n^(1 \/ 3) + O \( 1 \) \, wide
    sum_(m < i lt.eq n) frac(1, \( g_(i \, n) - g_(k \, n) \)^2) = O \( 1 \) . $
  To see the first assertion, compare the reciprocals with $\( g_(i \, n) + b_n \)^(- 1)$, where $g_(1 \, n) +
    b_n gt.eq 1$. Their difference is summable by the square-tail bound, while $n^(1 \/ 3) -
    sum_i \( g_(i \, n) + b_n \)^(- 1)$ is tight. Tight separation of the first finitely many eigenvalues controls
    the remaining denominators.
  The logarithm of the Vandermonde ratio involving indices $k lt.eq m < i$ contains
  $ sum_(m < i lt.eq n) log (1 - frac(h_k, g_(i \, n) - g_(k \, n))) . $
  Beyond a sufficiently large fixed index, the fractions have absolute value at most $1 \/ 2$.
    Taylor’s inequality and the preceding two bounds show that this sum is $- h_k n^(1 \/ 3) + O \( 1 \)$.
    The finitely many remaining factors, including pairs within the first $m$ coordinates,
    are bounded away from zero after imposing positive margins on the old and shifted gaps.
    The linear terms cancel those of the Gaussian factor. Consequently the new-to-old density ratio has a positive
    lower bound on sets of probability arbitrarily close to one,
    after any fixed localization inside the strict-order event.
  Here is the measure-theoretic direction of the resulting implication.
    Let $chi$ be a continuous function of finitely many leading coordinates, with $0 lt.eq chi lt.eq 1$,
    supported where the shifted order has a positive margin and the leading coordinates are bounded.
    For every $epsilon.alt > 0$, the density-ratio bound supplies $c_epsilon.alt > 0$ such that,
    for every bounded nonnegative continuous function $f$ of the edge sequence,
  $ sans(P)_n \( f \) gt.eq
    c_epsilon.alt (sans(P)_n \[ chi thin f compose T_h \] - epsilon.alt parallel f parallel_oo) . $
  The common spectral exceptional sets have probability at most $epsilon.alt$ for all sufficiently large $n$.
    Pass to the edge limit. For a compact subset of a $sans(P)$-null set,
    take continuous tests between zero and one, equal to one on that compact subset and supported in open sets of
    arbitrarily small $sans(P)$-mass. The inequality bounds its $\( T_h \)_(*) \( chi sans(P) \)$-mass by
    $epsilon.alt$. Inner regularity gives the same bound for every $sans(P)$-null set.
    Letting $epsilon.alt arrow.b 0$ proves absolute continuity for this localized measure.
    Finally exhaust $cal(O)_h$ by such continuous localizations.
    This proves the lemma without requiring a uniform bound on the density ratio over the entire edge law. ◻
]

#thm([Proposition 9.4.])[
  (Randomness of the limit).  #emph[For every fixed $s > 0$,
    the finite random variable $cal(A)_g \( s \)$ is essentially unbounded.
    In particular $Q_(upright("crit"))$ is not a point mass.]
] <prop:functional-randomness>

#proof[
  Lower $g_1$ by $t > 0$, leaving the other points fixed, and denote the resulting sequence by $g^(\( t \))$.
    Choose the auxiliary parameter $b$ large enough for both Gaussian prescriptions. Only $l_1$ changes, and (2.3) shows
  $ D_(g^(\( t \))) \( b \) - D_g \( b \) = - #scale(x: 120%, y: 120%)[\(] l_1^(\( t \)) -
    l_1 #scale(x: 120%, y: 120%)[\)] . $
  At a common coordinate sequence $x$, the finite centered-square sums in the two prescriptions differ by
    $- \( l_1^(\( t \)) - l_1 \)$. Thus, wherever these sums converge, $S_(g^(\( t \))) \( x \) =
    S_g \( x \) - \( l_1^(\( t \)) - l_1 \)$. Consequently
  $ S_(g^(\( t \))) \( x \) - D_(g^(\( t \))) \( b \) = S_g \( x \) - D_g \( b \) . $
  The two renormalized constraints therefore coincide. Comparing the first Gaussian coordinate in their
    conditioning densities gives
  $ frac(d Pi_(g^(\( t \))), d Pi_g) \( x \) = frac(exp \( t x_1^2 \/ 2 \), Pi_g \[ exp \( t x_1^2 \/ 2 \) \]) . $
  The denominator is finite: increase $b$ until $g_1 + b > t$ and use the bounded conditional first-coordinate
    density relative to the centered Gaussian of variance $\( g_1 + b \)^(- 1)$.
    The independence of the conditioned law from $b$ then gives the displayed identity for $Pi_g$.
  For a nonnegative random variable with unbounded support,
    exponential tilts with parameter tending to infinity have means tending to infinity.
    Indeed, for any $M$, the mass below $M$ after tilting is at most $e^(- t \/ 2) Pi_g \[ x_1^2 lt.eq M \] \/
    Pi_g \[ x_1^2 gt.eq M + 1 \]$. It follows that $v \( g^(\( t \)) \) arrow.r oo$ as $t arrow.r oo$.
  Suppose that $v \( g \)$ had an essential finite upper bound.
    By Lemma 45, this same bound would hold for $v \( g^(\( t \)) \)$ almost surely for every positive integer
    $t$. Intersecting these countably many full-measure events contradicts the preceding divergence.
    Therefore $v \( g \)$ is essentially unbounded. The lower bound (9.1) proves the same assertion for
    $cal(A)_g \( s \)$ at every fixed positive $s$. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Proposition 44 proves convergence of the laws in
    $C_(upright("loc")) \( \( 0 \, oo \) \)$ for both entry distributions and identifies their common limit by
    (2.7). The same deterministic $c_(*) > 0$ occurs in both models.
    The spectral representation and the trivial form kernel prove nonnegativity, monotonicity,
    and almost-sure decay. Equation (9.1) excludes the zero function,
    and Proposition 46 establishes sample-to-sample randomness. ◻
]

Decay at infinity is not a closed condition in $C_(upright("loc")) \( \( 0 \, oo \) \)$.
  The almost-sure decay proved above can therefore coexist with nondecaying functions in the closed topological
  support. Appendix 10 gives a precise example: the constant-one function belongs to the closed topological
  support of $Q_(upright("crit"))$.

== 10 The closed topological support <sec:support>

The decay assertion in Theorem 1 holds almost surely under $Q_(upright("crit"))$.
  The set of functions that decay at infinity is not closed in $C_(upright("loc")) \( \( 0 \, oo \) \)$,
  and in the present problem the distinction is substantive.
  We prove that the closed topological support contains a nondecaying function.
  For an edge configuration $g$, write $cal(A)_g$ for the function in (2.7).

#thm([Proposition 10.1.])[
  #emph[The constant function $s mapsto 1$ belongs to the closed topological support of $Q_(upright("crit"))$ in
    $C_(upright("loc")) \( \( 0 \, oo \) \)$.]
] <prop:support-constant>

The proof modifies finitely many edge points so that the conditioned law concentrates near $x_1 = plus.minus 1$.
  A smooth function distinguishing these two regions has vanishing form energy,
  while the resolvent contribution of the remaining coordinates vanishes.
  The finite-shift absolute continuity from Lemma 45 ensures that every function used in the approximation belongs
  to the closed support.

#proof[
  Let $K = "supp" Q_(upright("crit"))$ denote the closed topological support.
    Since $C_(upright("loc")) \( \( 0 \, oo \) \)$ is separable, $Q_(upright("crit")) \( K \) = 1$.
    Consider all shifts of finitely many edge points by rational amounts,
    restricted to the event that the shifted points remain strictly ordered. There are countably many such shifts.
    By Lemma 45, outside a single null set, every valid shift $g'$ of $g$ gives a configuration for which the
    conditioned measure, the form identities, and (2.7) are defined, and for which $cal(A)_(g')$ belongs to $K$.
    We fix such a configuration $g$, also satisfying the spectral bounds of Section 2.
    Choose and fix $b$ with $g_1 + b > 0$, and put
  $ l_a = \( g_a + b \)^(- 1) \, wide D = D \( b \) . $
  In particular, $l_a$ is strictly decreasing, $sum_a l_a = oo$, and $l_a lt.eq
    C a^(- 2 \/ 3)$ for all sufficiently large $a$. All constants below may depend on this fixed configuration and
    on $b$.
  #emph[Choosing the modified variances.] We leave $g_1$ fixed and modify $g_2 \, dots.h \, g_m$,
    along a sequence of integers $m arrow.r oo$. Let $J = 60$ and define
  $ A_m = sum_(i = 2)^m l_i + D + l_1 - 1 . $
  Then $A_m arrow.r oo$ and $A_m = O \( m^(1 \/ 3) \)$. There are arbitrarily large $m$ such that
  #[#set math.equation(numbering: n => "(10.1)")
   $ l_(m + 1) lt.eq frac(A_m, 2 m) . $ <eq:support-subsequence>]
  Indeed, if the reverse strict inequality held eventually, the identity $A_(m + 1) = A_m +
    l_(m + 1)$ would imply $A_(m + 1) > A_m \( 1 + 1 \/ \( 2 m \) \)$, and hence $A_m gt.eq c m^(1 \/ 2)$,
    contrary to the upper bound. Restrict henceforth to integers satisfying (10.1), and set $M =
    A_m \/ \( m - 1 \)$. For all sufficiently large such integers,
  #[#set math.equation(numbering: n => "(10.2)")
   $ c / m lt.eq M lt.eq C m^(- 2 \/ 3) . $ <eq:support-scale>]
  Choose strictly decreasing positive numbers on indices $2 \, dots.h \, m$ whose sum is $A_m$,
    with the first $J - 1$ numbers close to $2 M$ and the others close to $M$.
    This is possible by adjusting the latter group by a relative amount $O \( J \/ m \)$ and then making small
    distinct perturbations of zero total sum. For large $m$ these numbers are less than $l_1$ and greater than
    $l_(m + 1)$, by (10.1). They therefore define an ordered modification of the edge points through $g'_i =
    1 \/ l'_i - b$. Approximate each of the finitely many shifts $g'_i - g_i$ by a rational number,
    sufficiently closely to retain strict order and all the strict comparisons just imposed.
    We continue to write $g^(\( m \))$ and $l_a^(\( m \))$ for the resulting configuration and variances.
    The approximation can also be chosen so that the following bounds hold, with constants independent of $m$:
  #[#set math.equation(numbering: n => "(10.3)")
   $ & l_1^(\( m \)) = l_1 \, wide l_a^(\( m \)) = l_a quad \( a > m \) \, wide
     l_a^(\( m \)) asymp M quad \( 2 lt.eq a lt.eq m \) \,\
 & l_a^(\( m \)) / l_j^(\( m \)) lt.eq q < 1 quad \( a > J \, med 1 lt.eq j lt.eq J \) \,\
 & V_m := D^(\( m \)) \( b \) + l_1 arrow.r 1 \, wide sum_(a > 1) \( l_a^(\( m \)) \)^2 lt.eq
   C m^(- 1 \/ 3) . $ <eq:support-variances>]
  Here $D^(\( m \))$ is the value of (2.3) for $g^(\( m \))$.
    To check the first conclusion in (10.3), the finite-change identity from that equation gives
  $ D^(\( m \)) \( b \) - D \( b \) = - sum_(i = 2)^m \( l_i^(\( m \)) - l_i \) . $
  Before rational approximation our choice of sum makes $V_m = 1$ exactly; afterwards we can require $\| V_m -
    1 \| lt.eq m^(- 1)$. The square-sum bound follows from $m M^2 lt.eq
    C m^(- 1 \/ 3)$ and $sum_(a > m) l_a^2 lt.eq C m^(- 1 \/ 3)$.
    By the choice of the original configuration, each $cal(A)_(g^(\( m \)))$ belongs to $K$.
  #emph[Concentration after conditioning.] Let $gamma_m$ be the product law of centered normals on indices $a >
    1$ with variances $l_a^(\( m \))$, and let
  $ S_m = sum_(a > 1) #scale(x: 120%, y: 120%)[\(] x_a^2 - l_a^(\( m \)) #scale(x: 120%, y: 120%)[\)] . $
  This series converges in $L^2 \( gamma_m \)$, and (10.3) implies $S_m arrow.r 0$ in probability under $gamma_m$.
    Write $Pi_m = Pi_(g^(\( m \)))$. Eliminating $x_1$ in the conditioning prescription shows that the $a >
    1$ marginal of $Pi_m$ has density
  #[#set math.equation(numbering: n => "(10.4)")
   $ r_m & = Z_m^(- 1) h_m \( S_m \) \, wide Z_m = bb(E)_(gamma_m) h_m \( S_m \) \,\
h_m \( v \) & = upright(bold(1))_({ v < V_m }) \( V_m - v \)^(- 1 \/ 2) exp (- frac(V_m - v, 2 l_1)) \,
  $ <eq:support-tail-density>]
  relative to $gamma_m$. Under the full law, $x_1^2 = V_m - S_m$, and the sign of $x_1$ is independent and symmetric.
  We give bounds near the singularity in (10.4), because concentration under the product law alone would not
    suffice. Put $t_m = m^(1 \/ 10)$. For either sign, the centered Gaussian square-sum formula and (10.3) give
  #[#set math.equation(numbering: n => "(10.5)")
   $ log bb(E)_(gamma_m) e^(plus.minus t_m S_m) lt.eq C t_m^2 sum_(a > 1) \( l_a^(\( m \)) \)^2 lt.eq C \,
     $ <eq:support-mgf>]
  since $t_m max_(a > 1) l_a^(\( m \)) arrow.r 0$. Under either exponential tilt the coordinates remain
    independent normals, with variances $l_a^(\( m \)) \/ \( 1 minus.plus 2 t_m l_a^(\( m \)) \)$,
    comparable to the original variances. The sum of the squares of any fixed four coordinates among $2 \,
    dots.h \, J$ has density bounded by $C \/ M$: its characteristic function has absolute value at most
    $C \( 1 + M^2 u^2 \)^(- 1)$, whose integral is $O \( M^(- 1) \)$.
    Convolution with the remaining coordinates does not increase this bound.
    The same assertion holds for the infinite sum by its $L^2$ convergence.
    Undoing the tilt and using (10.2)–(10.5), we obtain a density $p_m$ of $S_m$ satisfying
  #[#set math.equation(numbering: n => "(10.6)")
   $ p_m \( v \) lt.eq C m e^(- t_m \| v \|) \, wide v in bb(R) . $ <eq:support-density-bound>]
  The factors $h_m \( v \)$ are uniformly bounded on the complement of a fixed neighborhood of $v = V_m$.
    Near that point, which stays bounded away from zero, (10.6) supplies an exponentially small factor,
    while the singularity $\( V_m - v \)^(- p \/ 2)$ is integrable for every $p < 2$.
    Consequently, concentration of $S_m$ at zero gives
  #[#set math.equation(numbering: n => "(10.7)")
   $ Z_m arrow.r e^(- 1 \/ \( 2 l_1 \)) \, wide sup_m parallel r_m parallel_(L^(3 \/ 2) \( gamma_m \)) < oo .
     $ <eq:support-density-norm>]
  The same estimate, integrated over $\| S_m \| > epsilon$,
    shows that for each fixed $epsilon > 0$ there are positive constants $C_epsilon \, c_epsilon$ such that
  #[#set math.equation(numbering: n => "(10.8)")
   $ Pi_m { \| x_1^2 - 1 \| > epsilon } lt.eq C_epsilon e^(- c_epsilon m^(1 \/ 10)) $ <eq:support-concentration>]
  for all sufficiently large $m$. Integrating the negative tail of $S_m$ also gives convergence of $x_1^2$ to $1$
    in every fixed moment. Finally, Hölder’s inequality applied to (10.7) yields, for each fixed $p < oo$,
  #[#set math.equation(numbering: n => "(10.9)")
   $ sup_m sup_(a > 1) Pi_m [lr(|x_a \/ sqrt(l_a^(\( m \)))|)^p] < oo . $ <eq:support-coordinate-moments>]
  #emph[The first coordinate and the trace tail.] Write $H_m = H_(Pi_m)$ and $cal(E)_m \( F \) =
    integral \| nabla F \|^2 thin d Pi_m$. Choose an odd smooth compactly supported function $phi.alt$ on $bb(R)$
    which equals $1$ near $1$ and $- 1$ near $- 1$. The preceding concentration and moment estimates imply
  $ parallel x_1 - phi.alt \( x_1 \) parallel_(L^2 \( Pi_m \)) arrow.r 0 \, wide
    parallel phi.alt \( x_1 \) parallel_(L^2 \( Pi_m \))^2 arrow.r 1 \, wide
    cal(E)_m \( phi.alt \( x_1 \) \) arrow.r 0 . $
  For $0 lt.eq s lt.eq S$, the spectral theorem gives
  $ 0 lt.eq parallel phi.alt \( x_1 \) parallel_2^2 - chevron.l phi.alt \( x_1 \) \,
    e^(- s c_(*) H_m) phi.alt \( x_1 \) chevron.r lt.eq S c_(*) cal(E)_m \( phi.alt \( x_1 \) \) . $
  Semigroup contraction therefore shows that the first coordinate’s contribution to $cal(A)_(g^(\( m \))) \( s \)$
    tends to $1$, uniformly for $s$ in bounded intervals. Coordinates $2 \, dots.h \,
    J$ contribute at most $sum_(a = 2)^J Pi_m \[ x_a^2 \] = O \( M \)$, which tends to zero.
    It remains to control the infinitely many coordinates beyond $J$.
    We use the angular integration-by-parts estimate of Section 7.
    Here the angular identity (5.1) is exact, so there is no likelihood-score error.
    The remaining task is to make the coefficient and inverse-moment bounds uniform in $m$.
  Let $R_0 = sum_(j = 1)^J x_j^2$. We first establish the uniform inverse moments needed for angular integration
    by parts. By (10.7), Hölder’s inequality, and $R_0 gt.eq sum_(j = 2)^J x_j^2$,
  $ Pi_m \[ R_0^(- 8) \] lt.eq C (bb(E)_(gamma_m) [(sum_(j = 2)^J x_j^2)^(- 24)])^(1 \/ 3) lt.eq C M^(- 8) lt.eq
    C m^8 . $
  The Gaussian inverse moment is finite because $J - 1 = 59 > 48$.
    On ${ x_1^2 gt.eq 1 \/ 2 }$ the quantity $R_0^(- 4)$ is bounded by $16$; on the complement,
    Cauchy–Schwarz and (10.8) absorb the preceding polynomial bound. Thus
  #[#set math.equation(numbering: n => "(10.10)")
   $ sup_m Pi_m \[ R_0^(- 4) \] < oo . $ <eq:support-inverse-moments>]
  For $a > J$ put
  $ delta_(a j) = \( l_a^(\( m \)) \)^(- 1) - \( l_j^(\( m \)) \)^(- 1) \, wide cal(V)_a =
    sum_(j = 1)^J frac(x_j, R_0 delta_(a j)) \( x_j partial_a - x_a partial_j \) . $
  By (10.3), $delta_(a j) gt.eq \( 1 - q \) \/ l_a^(\( m \))$.
    The calculation in (7.3), now in the limiting coordinates, gives
  $ \| cal(V)_a \| & lt.eq C l_a^(\( m \)) \( 1 + \| x_a \| \/ sqrt(R_0) \) \,\
\| "div" cal(V)_a \| & lt.eq C l_a^(\( m \)) \| x_a \| \/ R_0 . $
  Together with (10.9) and (10.10), these imply
  #[#set math.equation(numbering: n => "(10.11)")
   $ parallel cal(V)_a parallel_(L^2 \( Pi_m \)) + parallel "div" cal(V)_a parallel_(L^2 \( Pi_m \)) lt.eq
     C l_a^(\( m \)) . $ <eq:support-field-norms>]
  Each rotation $x_j partial_a - x_a partial_j$ preserves the square-sum constraint.
    Its derivative of the Gaussian log density is $- delta_(a j) x_a x_j$,
    so the corresponding derivative along $cal(V)_a$ is exactly $- x_a$.
    Applying (5.1) with the coefficients defining $cal(V)_a$ therefore gives
  #[#set math.equation(numbering: n => "(10.12)")
   $ Pi_m \[ x_a f \] = Pi_m \[ cal(V)_a f \] + Pi_m \[ f "div" cal(V)_a \] $ <eq:support-ibp>]
  for smooth cylinder tests. To justify the singular coefficients,
    multiply them first by $chi \( R_0 \/ epsilon \)$, where $chi$ is smooth, zero below $1$, and one above $2$.
    Direct calculation gives
  $ cal(V)_a R_0 = - 2 x_a sum_(j = 1)^J frac(x_j^2, R_0 delta_(a j)) \,
    wide \| cal(V)_a chi \( R_0 \/ epsilon \) \| lt.eq C l_a^(\( m \)) frac(\| x_a \|, R_0)
    upright(bold(1))_({ R_0 lt.eq 2 epsilon }) . $
  The last expression tends to zero in $L^2 \( Pi_m \)$ by (10.9) and (10.10).
    At infinity we use a radial cutoff in a finite coordinate set containing $1 \, dots.h \, J \,
    a$ and all test coordinates. Every rotation in $cal(V)_a$ preserves this radius,
    so differentiating that cutoff produces no error. This proves (10.12) on the cylinder core,
    which then extends the identity to the form domain.
  Fix $z > 0$ and a finite set $I subset { J + 1 \, J + 2 \, dots.h }$.
    Applying (10.12) to a vector of tests $\( f_a \)_(a in I)$ and using Cauchy–Schwarz and (10.11) yields
  $ lr(|sum_(a in I) Pi_m \[ x_a f_a \]|) lt.eq C_z (sum_(a > J) \( l_a^(\( m \)) \)^2)^(1 \/ 2)
    (sum_(a in I) { z parallel f_a parallel_2^2 + c_(*) cal(E)_m \( f_a \) })^(1 \/ 2) . $
  By the resolvent variational formula, followed by monotone convergence over finite $I$,
  #[#set math.equation(numbering: n => "(10.13)")
   $ sum_(a > J) chevron.l x_a \, \( z + c_(*) H_m \)^(- 1) x_a chevron.r_(Pi_m) lt.eq
     C_z sum_(a > J) \( l_a^(\( m \)) \)^2 arrow.r 0 . $ <eq:support-resolvent-tail>]
  For every $s_0 > 0$ the scalar inequality $e^(- s lambda) lt.eq
    C_(s_0 \, z) \( z + lambda \)^(- 1)$ holds for $s gt.eq s_0$ and $lambda gt.eq 0$.
    Hence (10.13) also makes the semigroup trace beyond $J$ tend to zero uniformly on compact subsets of
    $\( 0 \, oo \)$.
  We have proved $cal(A)_(g^(\( m \))) arrow.r 1$ in $C_(upright("loc")) \( \( 0 \, oo \) \)$.
    Each approximating function belongs to $K$, so closedness of $K$ proves the proposition. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
