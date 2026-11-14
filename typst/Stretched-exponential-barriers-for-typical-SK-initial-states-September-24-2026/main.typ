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

#align(center)[#text(size: 16pt, weight: "bold")[Stretched-exponential barriers for typical SK initial states]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Local spin updates can preserve information about a realized equilibrium configuration for a long time,
  even though the unconditioned chain is stationary. We quantify this persistence throughout the low-temperature
  phase of the zero-field Sherrington–Kirkpatrick model. The central issue is the mass of slowly mixing initial
  states: a worst-state lower bound alone gives no information about whether a Gibbs sample encounters the obstruction.

For an integer $n gt.eq 2$, let $Sigma_n = { - 1 \, 1 }^n$,
  and let $\( J_(i j) \)_(1 lt.eq i < j lt.eq n)$ be independent standard Gaussian variables.
  At inverse temperature $beta > 0$, the zero-field Sherrington–Kirkpatrick model has Hamiltonian and Gibbs measure

#[#set math.equation(numbering: n => "(1.1)")
 $ H^J \( x \) = H_n^J \( x \) = 1 / sqrt(n) sum_(i < j) J_(i j) x_i x_j \, wide pi^J \( x \) =
   pi_(n \, beta)^J \( x \) = e^(beta H^J \( x \)) / Z_(n \, beta)^J \, wide x in Sigma_n \, $ <eq:model>]

where $Z^J = Z_(n \, beta)^J = sum_(x in Sigma_n) e^(beta H^J \( x \))$. For $x \, y in Sigma_n$, their overlap is

$ R \( x \, y \) = 1 / n sum_(i = 1)^n x_i y_i . $

The measure $pi^J$ is invariant under the global spin reversal $x mapsto - x$.
  We fix $beta > 1$ before sending $n$ to infinity.

In continuous-time heat-bath dynamics, every site has an independent rate-one clock.
  At a ring of site $i$, its spin is resampled according to

$ bb(P) \( x_i arrow.l s divides x_(\[ n \] \\ { i }) \) =
  frac(exp { beta s h_i^J \( x \) }, 2 cosh \( beta h_i^J \( x \) \)) \, wide h_i^J \( x \) = 1 /
  sqrt(n) sum_(j eq.not i) J_(i j) x_j \, quad s in { - 1 \, 1 } \, $

with $J_(j i) = J_(i j)$ and $J_(i i) = 0$. Write $P_t^J$ for its transition kernel.
  The total update-attempt rate is $n$, and an attempt may leave the configuration unchanged.
  We also consider the discrete kernel $K^J$ that chooses one site uniformly and performs one such conditional
  resampling. Both dynamics have stationary measure $pi^J$.

For probability measures $nu \, eta$ on $Sigma_n$, set $lr(bar.v.double nu - eta bar.v.double)_(upright("TV")) =
  1 / 2 sum_x \| nu \( x \) - eta \( x \) \|$. For a fixed realized state $x$, define

#[#set math.equation(numbering: n => "(1.2)")
 $ d^J \( x \, t \) & = lr(bar.v.double P_t^J \( x \, dot.op \) - pi^J bar.v.double)_(upright("TV")) \, &
   T^J \( x \) & = inf { t gt.eq 0 : d^J \( x \, t \) lt.eq 1 \/ 4 } \,\
d_(upright("disc"))^J \( x \, k \) & =
  lr(bar.v.double \( K^J \)^k \( x \, dot.op \) - pi^J bar.v.double)_(upright("TV")) \, &
  T_(upright("disc"))^J \( x \) & = min { k gt.eq 0 : d_(upright("disc"))^J \( x \, k \) lt.eq
  1 \/ 4 } . $ <eq:point-mixing-time>]

Here $k$ is an integer, and neither mixing time takes a supremum over the initial state.

#thm([Theorem 1.1.])[
  #emph[Set $kappa = 1 \/ 10000$. For every fixed $beta > 1$,
$ bb(P)_(J \, thin x_0 tilde.op pi^J) {d^J #scale(x: 120%, y: 120%)[\(] x_0 \,
  exp \( n^kappa \) #scale(x: 120%, y: 120%)[\)] > 1 / 4} & arrow.r 1 \,\
bb(P)_(J \, thin x_0 tilde.op pi^J) {d_(upright("disc"))^J #scale(x: 120%, y: 120%)[\(] x_0 \,
  floor.l exp \( n^kappa \) floor.r #scale(x: 120%, y: 120%)[\)] > 1 / 4} & arrow.r 1 . $

]
] <thm:main>

The order of conditioning in this statement is essential.
  We first draw $x_0$ from $pi^J$, then regard it as a fixed argument of the transition kernel.
  Integrating that kernel over $x_0$ would instead recover $pi^J$ at every time.
  The joint formulation above is equivalent to convergence of the corresponding Gibbs mass to one in disorder
  probability. Indeed, if $F_n \( J \) in \[ 0 \, 1 \]$ is the mass of the complementary set,
  the joint assertion says $bb(E) F_n arrow.r 0$. Markov’s inequality gives convergence in probability,
  and boundedness proves the converse.

Total variation contracts under a Markov kernel. In particular, for $s \, t gt.eq 0$,

$ d^J \( x \, t + s \) =
  lr(bar.v.double #scale(x: 120%, y: 120%)[\(] P_t^J \( x \, dot.op \) - pi^J #scale(x: 120%, y: 120%)[\)] P_s^J
  bar.v.double)_(upright("TV")) lt.eq d^J \( x \, t \) \, $

and the discrete distances are nonincreasing in $k$ as well.
  Since the state space is finite, $t mapsto d^J \( x \, t \)$ is continuous.
  Consequently $d^J \( x \, t \) > 1 \/ 4$ implies $T^J \( x \) > t$; in discrete time,
  $d_(upright("disc"))^J \( x \, k \) > 1 \/ 4$ implies $T_(upright("disc"))^J \( x \) > k$.
  It follows that the theorem implies a lower bound at every fixed polynomial time scale.
  Appendix 10 will also give an independent proof using a fixed number of crossing levels.

#thm([Corollary 1.2.])[
  #emph[For every fixed $beta > 1$ and every fixed $a > 0$,
$ bb(P)_(J \, thin x_0 tilde.op pi^J) { T^J \( x_0 \) > n^a } arrow.r 1 \, wide
  bb(P)_(J \, thin x_0 tilde.op pi^J) { T_(upright("disc"))^J \( x_0 \) > n^a } arrow.r 1 . $

 Equivalently, each corresponding Gibbs mass tends to one in probability over the disorder.]
] <cor:superpolynomial>

#proof[
  Fix $a > 0$. Eventually $n^a$ is smaller than both $exp \( n^kappa \)$ and $floor.l exp \( n^kappa \) floor.r$.
    Apply Theorem 1 at those larger times and use contraction of total variation to pass to $n^a$. ◻
]

=== 1.1 Background and relation to earlier work <background-and-relation-to-earlier-work>

Sherrington and Kirkpatrick introduced the model as a mean-field description of a spin glass [16].
  Parisi’s variational description of its equilibrium free energy [14] was established rigorously through Guerra’s
  interpolation bound and Talagrand’s matching lower bound for the limiting pressure [9,17].
  These equilibrium results provide the scalar variational structure behind our argument.
  Passing from free energy to relaxation requires additional information about which overlap configurations a
  local trajectory can visit.

Ben Arous and Jagannath developed criteria that turn overlap free-energy barriers into exponentially small
  spectral gaps for mean-field spin glasses [4]. Their use of constrained replica pressures is an important
  antecedent of the overlap comparisons used here. Their barrier criteria require additional landscape hypotheses;
  the explicit Ising sufficient conditions in that work exclude the pure quadratic covariance of SK.
  They therefore do not directly give the present result throughout $beta > 1$.
  For SK itself, Sellke proves exponentially slow worst-case Glauber mixing at sufficiently large inverse
  temperature [15] Theorem 1.1. That conclusion concerns the slowest initial states.
  It does not determine the Gibbs mass of the states that remain far from equilibrium after their initial
  configuration has been fixed.

The role of the external field is also substantial. Bandeira, El Alaoui,
  and Rödder prove polynomial worst-case mixing for lazy discrete heat-bath dynamics at every fixed inverse
  temperature when a sufficiently large constant uniform field is present,
  with high probability over the disorder [2] Corollary 1.2. Our result concerns zero field.
  Its distinctive combination is the entire range of fixed $beta > 1$,
  Gibbs mass tending to one for realized initial states, and a stretched-exponential time scale.
  The exponent $1 \/ 10000$ is not asserted to be optimal, and the constants in the proof may depend on $beta$;
  the argument does not give uniformity as $beta$ decreases to one.

El Alaoui, Montanari and Sellke prove a complementary obstruction to sampling at $beta >
  1$ for algorithms stable under disorder perturbations, in normalized $2$-Wasserstein distance [8] Theorem 2.6.
  Their stability hypothesis and approximation metric differ from the conditional Glauber transition law
  considered here.

Numerical studies have examined much sharper predictions for low-temperature relaxation.
  Billoire studies equilibrium autocorrelation times for binary couplings and sequential Metropolis updates [5];
  Monthus and Garel compute inverse spectral gaps for small SK systems with Metropolis dynamics [11].
  Both report evidence associated with an $n^(1 \/ 3)$ scale for logarithmic relaxation times.
  Their observables and dynamics differ from the state-conditioned total variation distance studied here,
  and these numerical predictions do not fix the exponent in Theorem 1.

The static comparisons build on Guerra’s Gaussian interpolation framework [9] and Talagrand’s extensions to
  systems with prescribed replica overlaps [18] Propositions 3.4 and 4.4.
  Panchenko developed a general vector-spin formulation and proved the asymptotic sharpness of these
  constrained-overlap bounds [13]. Talagrand’s two- and three-copy bounds already retain an explicit cost when the
  prescribed overlaps differ from the covariance endpoint. In Section 2,
  we derive the finite-hierarchy matrix form needed here for the quadratic SK covariance,
  allowing arbitrary finite replica dimension and nonunit endpoint diagonals.
  The same section obtains a quantitative scalar free-energy comparison by choosing an interpolation path through
  a differential equation driven by overlap expectations. This choice has a methodological parallel in the
  adaptive interpolation method of Barbier and Macris [3]; their theorems are not inputs to our finite-size SK
  estimate. Gaussian concentration and the Brascamp–Lieb variance inequality [6] supply the probabilistic
  estimates used in these comparisons.

=== 1.2 Proof strategy <proof-strategy>

Set $L = n^kappa$ and $rho = L^(- 1)$. Our task is to exclude an overlap sign passage during the first $e^L$ units
  of time. To connect that task to mixing, choose a reference $v_1$ with $R \( v_1 \, x_0 \) gt.eq
  q_(*)$ for a fixed $q_(*) > 0$. The half-space ${ z : R \( v_1 \, z \) lt.eq
  0 }$ has Gibbs mass at least $1 \/ 2$ by spin reversal. A transition law within $1 \/
  4$ of equilibrium must therefore enter it with probability at least $1 \/ 4$.
  The reference will be chosen from independent equilibrium samples, using the initial state but no future updates.

The first part of the paper establishes the static estimates that make this path argument possible.
  Section 2 compares the expected normalized log partition function $n^(- 1) bb(E) log
  Z^J$ with the minimum of the scalar Parisi functional, with error $O_beta \( n^(- 1 \/ 24) \)$,
  and proves the matrix comparison for constrained replica overlaps.
  Section 3 develops the scalar evolution and the variational identities of a minimizing measure.
  Section 4 uses these identities to compare three replicas:
  when one pair has a substantial positive overlap, their small signed overlaps with the third replica are forced
  to remain close, apart from a set of very small averaged Gibbs probability.
  Section 5 proves an equilibrium energy bound and a quantitative estimate for small Gaussian rotations of the
  disorder. All of these specialized inputs are proved within the paper.

There are two further static steps. First, the energy and rotation bounds imply a coverage statement in Section 6:
  simultaneously for every subset $S$, outside a set of targets of absolute Gibbs mass less than $e^(- D_1 L)$,
  each $x in S$ has Gibbs mass at least $e^(- D_3 L)$ of $z in S$ with $\| R \( x \, z \) \| gt.eq q_(*)$.
  Here $D_3$ is fixed after $D_1$. Sampling $exp \( O \( L \) \)$ independent Gibbs configurations can therefore
  supply a reference inside $S$. Second, Section 7 treats triples whose two smaller overlaps lie near a positive
  level $r$, while the larger overlap exceeds $r$ by only a shrinking amount.
  It supplies locking at the scales required by the backwards searches.
  The estimate uses a scalar stationarity identity on a fixed interval; if that identity fails,
  a pair-overlap pressure gap supplies a forbidden interval instead.
  This alternative avoids assuming a complete description of the minimizing measure’s support.

Section 8 applies these estimates to a stationary discrete path $\( x_k \)$,
  and obtains the continuous-time path by an independent rate-$n$ Poisson clock.
  At a crossing of a small positive overlap level, coverage supplies a new reference with large overlap with the
  current configuration. Searching backwards for the new reference’s crossing,
  the locking estimates keep the overlaps with previously retained references almost unchanged.
  Iterating creates many simultaneous overlap constraints at a single path index.

The reference samples are arranged in blocks of a fixed length $B$.
  Within a block, each new reference is chosen in the set of configurations having small absolute overlap with all
  the earlier references in that block. At the start of the next block this restriction is reset.
  A conflict with older retained references can then delete only a suffix of length at most a fixed $H_0 < B$.
  Since $H_0 < B$, deletion cannot reach the first reference of the preceding block or any older retained
  reference. In particular, $v_1$ survives; Figure 2 shows this invariant.
  This construction permits $p$ levels of order $L$ with only $exp \( O \( L \) \)$ total reference samples,
  while retaining a fixed positive fraction of the levels.

The final probability estimate uses the order in which randomness is revealed.
  At level $i$, the reference is already determined when the independent threshold $r_i$ is drawn uniformly from
  an interval of length $rho$. Its overlap at any fixed path index is unlikely to fall in the much narrower
  permitted window. Removing constraints by conditional expectation in decreasing order of level bounds their
  joint probability, even though later reference choices depend on earlier thresholds.
  We sum over deterministic path indices and deterministic subsets of retained levels.
  This avoids conditioning on the adaptively chosen retained list and completes both clock versions.

Two auxiliary conclusions have a separate role. Appendix 9 proves that every disorder-selected set of Gibbs mass
  at least $n^(- D_1)$ has polynomially large conditional mass of pairs with absolute overlap at least a fixed
  $q_(*) \( beta \)$; this threshold is chosen before $D_1$,
  and the resulting exponent $D_2$ is fixed before $n$ grows.
  Its Gaussian-gain lemma and cell corollary are proved in full.
  Appendix 10 combines that result with the fixed-scale locking estimate to obtain a second proof of the
  polynomial-time obstruction. There the number of levels is fixed and the reference banks have polynomial sizes.
  These appendices reuse the energy, rotation and static locking proofs already established in the body,
  while retaining their own complete coverage and crossing arguments.

===== 1.2.1 Notation. <notation.>

We suppress $J$, $n$, and the fixed $beta$ from $H_n^J$, $pi_(n \, beta)^J$, and $Z_(n \, beta)^J$ when harmless.
  All constants may depend on $beta$ and on other parameters fixed before $n$ grows.
  Gibbs replicas and reference samples are independent conditional on the disorder unless stated otherwise.
  For matrices, $U : V = sum_(a \, b) U_(a b) V_(a b)$ and $\| U \|^2 = U :
  U$ denote the Frobenius inner product and squared norm.

== 2 Gaussian hierarchies and quantitative free energy comparison <static-sec:gaussian>

The overlap estimates in the later sections require two pressure comparisons:
  an upper bound with prescribed replica overlaps, and a lower bound for the unconstrained pressure with a
  controlled finite-size error. We derive both from finite Gaussian hierarchies.
  The upper bound allows the hierarchy’s covariance endpoint to differ from the prescribed overlap matrix;
  the cost of that difference remains explicit. For the lower bound,
  we choose the hierarchy along an overlap-dependent differential equation and estimate its error before making
  that choice.

The constrained comparison belongs to Guerra’s Gaussian interpolation framework [9],
  including Talagrand’s bounds for coupled replicas [18] Propositions 3.4 and 4.4 and Panchenko’s vector-spin
  formulation [13]. Talagrand’s bounds already retain a cost when prescribed overlaps differ from the covariance
  endpoint. We derive the finite-hierarchy matrix form needed here directly,
  allowing nonunit endpoint diagonals as well. The quantitative lower comparison is proved separately below.
  We fix $beta > 0$ throughout. A constant $C_beta$ may vary between occurrences, but never depends on $n$.

We first remove a constant term from the covariance calculation.
  Add independent standard Gaussian variables $J_11 \, dots.h \, J_(n n)$ to the disorder and,
  only in free-energy calculations, use the Hamiltonian

$ hat(H)_n \( sigma \) = H_n \( sigma \) + 1 / sqrt(2 n) sum_(i = 1)^n J_(i i) . $

The extra term has mean zero and is the same for every $sigma$.
  The Gibbs measure and the expected log partition function are therefore unchanged.
  The covariance now takes the exact form

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(E) hat(H)_n \( sigma \) hat(H)_n \( tau \) = n / 2 R \( sigma \, tau \)^2 . $ <static-eq:hamiltonian-covariance>]

=== 2.1 Two Gaussian tools and a hierarchy identity <two-gaussian-tools-and-a-hierarchy-identity>

We will need concentration for Gaussian disorder and a variance estimate after conditioning on a spin
  configuration. The following standard Gaussian and Brascamp–Lieb inequalities supply these two estimates.

#thm([Lemma 2.1.])[
  (Gaussian tools).  #emph[Let $G$ be a standard Gaussian vector in a finite-dimensional Euclidean space.
    If $f$ is $L$-Lipschitz, then for $a > 0$ and $theta in bb(R)$,
#[#set math.equation(numbering: n => "(2.2)")
 $ bb(P) #scale(x: 120%, y: 120%)[\[] \| f \( G \) - bb(E) f \( G \) \| gt.eq
   a #scale(x: 120%, y: 120%)[\]] & lt.eq 2 exp (- frac(a^2, 2 L^2)) \,\
log bb(E) exp { theta \( f \( G \) - bb(E) f \( G \) \) } & lt.eq
  frac(theta^2 L^2, 2) . $ <static-eq:gaussian-concentration>]

 If a probability density on $bb(R)^m$ is proportional to $e^(- V)$,
   where $V$ is twice differentiable and $nabla^2 V succ.curly.eq I$, then
#[#set math.equation(numbering: n => "(2.3)")
 $ "Var" \( f \) lt.eq bb(E) parallel nabla f parallel^2 . $ <static-eq:brascamp-lieb>]

 In particular, the variance of a linear functional $a dot.op G$ under this density is at most $parallel a parallel^2$.]
] <static-lem:gaussian-tools>

The variance bound is the strongly log-concave case of the Brascamp–Lieb inequality [6].
  For clarity, we prove the concentration estimate and the specialization of the variance bound to linear
  functions, which is the only specialization used below.

#proof[
  For the concentration estimate, write $H_s$ for convolution with a centered Gaussian of covariance $s I$,
    and let $B_t$ be standard Brownian motion. The heat equation and Itô’s formula represent a smooth
    $L$-Lipschitz function as
  $ f \( B_1 \) - bb(E) f \( B_1 \) = integral_0^1 nabla H_(1 - t) f \( B_t \) dot.op thin upright(d) B_t \,
    wide \| nabla H_s f \| lt.eq L . $
  The integrand is bounded, so its exponential martingale has expectation one.
    Its quadratic variation is at most $L^2$; this proves Equation (2.2) for every real $theta$.
    Apply exponential Markov’s inequality and optimize separately for the two tails to obtain Equation (2.2).
    Smooth convolution and localization, followed by Gaussian integrability,
    extend the argument to Lipschitz functions of at most linear growth. Every application here lies in that class.
  For the linear variance estimate, we may work with the potentials that occur in the proof.
    They are smooth and satisfy $I prec.curly.eq nabla^2 V prec.curly.eq C I$,
    where the finite constant $C$ may depend on the fixed finite system.
    To see the upper bound, note that the nonquadratic terms are finite logarithmic partition functions or
    hierarchy prefix values: their Hessians are bounded sums of covariances.
    A linear tilt leaves the Hessian unchanged. Consider the diffusion
  $ thin upright(d) Y_t = sqrt(2) thin thin upright(d) B_t - nabla V \( Y_t \) thin upright(d) t $
  and denote its semigroup by $Q_t$. The drift is globally Lipschitz, which gives a unique solution.
    Under synchronous coupling, strong convexity contracts distances by $e^(- t)$.
    Thus an $L$-Lipschitz function becomes $e^(- t) L$-Lipschitz under $Q_t$.
    Integration by parts shows that $nu \( thin upright(d) y \) prop e^(- V \( y \)) thin upright(d)
    y$ is invariant and that
  $ frac(thin upright(d), thin upright(d) t) "Var"_nu \( Q_t f \) = -
    2 integral \| nabla Q_t f \|^2 thin upright(d) nu . $
  The Gaussian tails supplied by strong convexity justify the same identity for $f \( y \) =
    a dot.op y$ by a cutoff argument. For independent $Y \, Y'$ with law $nu$, contraction also gives
  $ "Var"_nu \( Q_t f \) lt.eq 1 / 2 e^(- 2 t) \| a \|^2 bb(E) \| Y - Y' \|^2 arrow.r 0 . $
  We can therefore integrate the dissipation identity to infinity.
    The gradient bound $\| nabla Q_t f \| lt.eq e^(- t) \| a \|$ yields $"Var"_nu \( a dot.op Y \) lt.eq
    2 \| a \|^2 integral_0^oo e^(- 2 t) thin upright(d) t = \| a \|^2$.
    This proves the linear estimate needed for the conditional disorder laws.
    The finite upper Hessian bound justifies the diffusion argument;
    at each application we will check its lower Hessian bound explicitly. ◻
]

We next define the hierarchy and its probability law. Besides any quenched root randomness,
  take independent Gaussian fields $g_0 \, dots.h \, g_k$. The field $g_0$ belongs to the quenched root. Choose masses

$ 0 = x_(- 1) lt.eq x_0 lt.eq dots.h.c lt.eq x_(k - 1) lt.eq x_k = 1 \, wide w_l = x_l - x_(l - 1) \, $

and a terminal log partition function $F_k$ on a finite configuration space.
  Integrate the fields backwards by setting, for $1 lt.eq j lt.eq k$,

#[#set math.equation(numbering: n => "(2.4)")
 $ F_(j - 1) = 1 / x_(j - 1) log bb(E)_j e^(x_(j - 1) F_j) . $ <static-eq:hierarchy-recursion>]

Here $bb(E)_j$ integrates the field $g_j$. At a zero mass the right-hand side is interpreted as $bb(E)_j F_j$.
  After these recursive integrations, the hierarchy pressure is $bb(E) F_0$,
  with expectation also over all quenched randomness.

The recursion also specifies a probability law on fields and terminal configurations.
  Conditional on the prefix through level $j - 1$, multiply the original Gaussian law of $g_j$ by the density

#[#set math.equation(numbering: n => "(2.5)")
 $ W_j = exp { x_(j - 1) \( F_j - F_(j - 1) \) } . $ <static-eq:hierarchy-tilt>]

Equation (2.4) normalizes this density. After sampling level $k$,
  draw a configuration from the terminal Gibbs law. For a pair of paths indexed by a level $l$,
  sample their root and fields through $l$ once, and then sample the two continuations independently conditional
  on this prefix. We denote expectation under that pair law by $bb(E)_l^(\( 2 \))$.
  At $l = k$ the only independent choices are the terminal thermal draws.
  More generally, a finite tree is sampled by drawing each shared prefix once and making its descendants
  conditionally independent. In particular, every branch has the single-path marginal law.
  This convention fixes the shared randomness in all subsequent integration-by-parts calculations.

#thm([Lemma 2.2.])[
  (Hierarchy differentiation).  #emph[Suppose an independent standard Gaussian vector $g$ at level $j$ enters the
    terminal exponent as $sqrt(v) thin g dot.op e \( S \)$, where $e$ is a fixed vector-valued function of the
    terminal configuration. With all other parameters fixed,
#[#set math.equation(numbering: n => "(2.6)")
 $ frac(partial, partial v) bb(E) F_0 = 1 /
   2 (bb(E) parallel e \( S \) parallel^2 - sum_(l = j)^k w_l bb(E)_l^(\( 2 \)) e \( S^1 \) dot.op e \( S^2 \)) .
   $ <static-eq:hierarchy-derivative>]

 A quenched Gaussian is treated as level $0$. The identity holds for $v >
   0$ and extends to interpolation endpoints by integration and continuity.]
] <static-lem:hierarchy-derivative>

#proof[
  To differentiate the pressure, first add a deterministic vector in the same direction as $sqrt(v) thin g$.
    Differentiating the terminal log partition function and then the hierarchy recursion shows that, for $l gt.eq
    j$, the gradient of $F_l$ is the conditional mean $m_l^e$ of $e \( S \)$ given the prefix through $l$.
    A second differentiation gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ nabla^2 F_l = bb(E) \[ nabla^2 F_(l + 1) divides l \] +
     x_l "Cov" \( m_(l + 1)^e divides l \) . $ <static-eq:hessian-recursion-general>]
  All conditional expectations in this calculation use the path law.
    At the terminal level, the Hessian is the thermal covariance of $e \( S \)$.
  For $j gt.eq 1$, differentiate the $j$th logarithmic expectation with respect to the variance and integrate by
    parts in its Gaussian field. The result is one half of the tilted expectation of
  $ "tr" nabla^2 F_j + x_(j - 1) parallel m_j^e parallel^2 . $
  At level $j = 0$, ordinary Gaussian differentiation omits the second term, exactly as prescribed by $x_(- 1) =
    0$. Earlier levels propagate the derivative by conditional expectation.
    Iteration of Equation (2.7) now expresses twice the pressure derivative as
  $ bb(E) parallel e \( S \) parallel^2 - bb(E) parallel m_k^e parallel^2 +
    sum_(l = j)^(k - 1) x_l #scale(x: 120%, y: 120%)[\(] bb(E) parallel m_(l + 1)^e parallel^2 -
    bb(E) parallel m_l^e parallel^2 #scale(x: 120%, y: 120%)[\)] + x_(j - 1) bb(E) parallel m_j^e parallel^2 . $
  The sum telescopes to $bb(E) parallel e \( S \) parallel^2 - sum_(l = j)^k w_l bb(E) parallel m_l^e parallel^2$.
    Two descendants are independent conditional on their common prefix, so $bb(E) parallel m_l^e parallel^2 =
    bb(E)_l^(\( 2 \)) e \( S^1 \) dot.op e \( S^2 \)$. This is the claimed identity.
  Gaussian integrability justifies each differentiation: the configuration space and the number of levels are
    finite, the coupled gradients are bounded, and the recursive values grow at most linearly in the Gaussian
    variables. A zero mass can be handled directly by the expectation recursion, or obtained as a limit.
    Integration and continuity give the stated endpoint interpretation. ◻
]

=== 2.2 A matrix interpolation bound <a-matrix-interpolation-bound>

We now apply the differentiation identity to a prescribed overlap constraint.
  For $d$ configurations $sigma^1 \, dots.h \, sigma^d$, write $D_(a b) =
  R \( sigma^a \, sigma^b \)$ for their Gram matrix. If $D$ is feasible,
  meaning that at least one such tuple realizes it, define

#[#set math.equation(numbering: n => "(2.8)")
 $ F_(d \, n) \( D \) = 1 / n bb(E) log sum_(sigma^1 \, dots.h \, sigma^d in { - 1 \, 1 }^n\
R \( sigma^a \, sigma^b \) = D_(a b) med forall a \, b) exp {beta sum_(a = 1)^d H_n \( sigma^a \)} .
  $ <static-eq:constrained-pressure>]

The sum is unnormalized. We use the Frobenius notation $U : V = sum_(a \, b) U_(a b) V_(a b)$ and $\| U \|^2 = U :
  U$. To compare this pressure with a single-site recursion, choose a symmetric matrix path

$ Q_(- 1) = 0 \, wide Q_j - Q_(j - 1) succ.curly.eq 0 quad \( 0 lt.eq j lt.eq k \) \, wide Q_k = Q_(upright("end")) . $

Within these conditions, the endpoint is free: it may differ from $D$ and may have nonunit diagonal.
  Increments of zero covariance are allowed. If the first nonzero increment should carry positive mass,
  insert a quenched level $Q_0 = 0$; the first genuine increment is then integrated at mass $x_0$.
  At a single site, take independent $d$-dimensional Gaussian fields of covariance $beta^2 \( Q_j - Q_(j - 1) \)$.
  For a symmetric multiplier $lambda$, define $Psi \( Q \, x \, lambda \)$ as the expected hierarchy value with
  terminal function

$ log sum_(s in { - 1 \, 1 }^d) exp {(sum_(j = 0)^k g_j) dot.op s + s^(sans(T)) lambda s} . $

For the deterministic correction to the pressure, set

#[#set math.equation(numbering: n => "(2.9)")
 $ integral x thin thin upright(d) \| Q \|^2 = sum_(j = 0)^k x_(j - 1) #scale(x: 120%, y: 120%)[\(] \|
   Q_j \|^2 - \| Q_(j - 1) \|^2 #scale(x: 120%, y: 120%)[\)] . $ <static-eq:matrix-path-integral>]

The initial quenched increment therefore carries mass zero in this integral.
  The next bound keeps the cost of the free endpoint explicit.

#thm([Proposition 2.3.])[
  (Matrix interpolation).  #emph[For every feasible $D$ and every path and multiplier as above,
#[#set math.equation(numbering: n => "(2.10)")
 $ F_(d \, n) \( D \) lt.eq Psi \( Q \, x \, lambda \) - lambda : D + beta^2 /
   4 (\| D - Q_(upright("end")) \|^2 - integral x thin thin upright(d) \| Q \|^2) . $ <static-eq:matrix-bound>]

 For fixed $D$ and $lambda$, the bound passes to any sequence of finite paths for which $Q_(upright("end"))$,
   $Psi \( Q \, x \, lambda \)$, and the displayed path integral converge.]
] <static-prop:matrix-bound>

#proof[
  Place independent copies of the single-site fields at all $n$ sites.
    Interpolate from those fields to the common Hamiltonian disorder, retaining the overlap constraint throughout.
    The terminal exponent is
  $ sqrt(t) thin beta sum_(a = 1)^d hat(H)_n \( sigma^a \) +
    sqrt(1 - t) sum_(i = 1)^n sum_(j = 0)^k g_(j \, i) dot.op s_i + sum_(i = 1)^n s_i^(sans(T)) lambda s_i \, wide
    s_i = \( sigma_i^1 \, dots.h \, sigma_i^d \) . $
  Denote the expected recursive value, divided by $n$, by $phi \( t \)$.
    For two terminal draws, define the cross-overlap matrix by $R_(a b) = R \( sigma^a \, tau^b \)$;
    this matrix need not be symmetric. Equation (2.1) gives Hamiltonian covariance $n beta^2 \| R \|^2 \/ 2$,
    whereas the $j$th site-field increment has covariance $n beta^2 \( Q_j - Q_(j - 1) \) : R$.
    The self-overlap is $D$. Sum Lemma 4 over these Gaussian increments to obtain
  $ phi' \( t \) & = beta^2 /
    4
    [\| D \|^2 - 2 Q_k : D - sum_(l = 0)^k w_l bb(E)_l^(\( 2 \)) #scale(x: 120%, y: 120%)[\(] \| R \|^2 - 2 Q_l :
    R #scale(x: 120%, y: 120%)[\)]]\
 & lt.eq beta^2 / 4 (\| D \|^2 - 2 Q_k : D + sum_(l = 0)^k w_l \| Q_l \|^2) . $
  The inequality discards the nonnegative squares $\| R - Q_l \|^2$ and therefore does not require symmetry of
    $R$. Summation by parts gives
  $ \| Q_k \|^2 - sum_(l = 0)^k w_l \| Q_l \|^2 = integral x thin thin upright(d) \| Q \|^2 . $
  It remains to identify the endpoints. At $t = 1$ the fields vanish and $phi \( 1 \) = F_(d \, n) \( D \) +
    lambda : D$. At $t = 0$, remove the overlap constraint. This increases the terminal sum and hence every
    recursive value, because each integration is monotone. The resulting recursion factors over sites,
    giving $phi \( 0 \) lt.eq Psi \( Q \, x \, lambda \)$. Integration of the derivative bound proves the
    proposition. Singular covariance increments are permitted by continuity,
    or directly by representing a field through a square root of its covariance. ◻
]

=== 2.3 The scalar functional <the-scalar-functional>

The scalar version of the hierarchy gives the variational quantity against which we compare the unconstrained
  pressure. Let $mu$ be a probability measure on $\[ 0 \, 1 \]$ and put $alpha \( s \) = mu \( \[ 0 \, s \] \)$.
  Define $Phi_alpha \( s \, z \)$ by the terminal condition $Phi_alpha \( 1 \, z \) =
  log \( 2 cosh z \)$ and the backward equation

#[#set math.equation(numbering: n => "(2.11)")
 $ - partial_s Phi_alpha = beta^2 / 2 (partial_(z z) Phi_alpha + alpha \( s \) \( partial_z Phi_alpha \)^2) .
   $ <static-eq:scalar-pde>]

For a step function $alpha$, the equation means the Gaussian recursion already defined:
  over an interval of length $b - a$ with constant mass $x$, its terminal function $f$ is mapped to

$ z mapsto 1 / x log bb(E) exp { x f \( z + beta sqrt(b - a) thin G \) } \, $

with ordinary expectation at $x = 0$. For general $alpha$, take $L^1$ limits of step functions;
  Lemma 9 proves that this definition exists, is independent of the approximation,
  and has the stability properties we use. Define

#[#set math.equation(numbering: n => "(2.12)")
 $ cal(P)_beta \( mu \) = Phi_alpha \( 0 \, 0 \) - beta^2 / 2 integral_0^1 s alpha \( s \) thin upright(d) s \,
   wide P_beta = inf_mu cal(P)_beta \( mu \) . $ <static-eq:scalar-functional>]

The infimum is attained by compactness and continuity, as proved in Proposition 10.
  These scalar approximation and compactness arguments are independent of the pressure comparison;
  the lower comparison below will use only finitely supported trial measures.
  Apply Proposition 5 with $d = 1$, $D = Q_(upright("end")) = 1$, and $lambda = 0$.
  First for step measures and then by approximation, this gives the upper comparison

#[#set math.equation(numbering: n => "(2.13)")
 $ p_n \( beta \) := 1 / n bb(E) log Z_(n \, beta) lt.eq P_beta . $ <static-eq:scalar-upper-bound>]

#thm([Theorem 2.4.])[
  (Quantitative comparison).  #emph[For every fixed $beta > 0$,
    there is $C_beta < oo$ such that for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(2.14)")
 $ P_beta - C_beta n^(- 1 \/ 24) lt.eq p_n \( beta \) lt.eq P_beta . $ <static-eq:finite-size>]

]
] <static-thm:finite-size>

The remaining task is the lower comparison. We will choose an interpolation path from expectations of overlaps,
  using a hierarchical backward system. Such expectation-dependent choices are also a feature of the adaptive
  interpolation method of Barbier and Macris [3]. Here we first prove an explicit overlap error estimate for the
  hierarchy, without assuming a prior description of the Gibbs measure, and then use it along the chosen path.
  Mourrat’s enriched-free-energy and Hamilton–Jacobi viewpoint [12] Section 3,
  equations (3.24)–(3.27) provides related motivation for organizing errors by hierarchical overlaps.
  This is a methodological connection only: the direct covariance and concentration argument and the quantitative
  bound here do not invoke a Hamilton–Jacobi theorem.

=== 2.4 Concentration along a hierarchy <concentration-along-a-hierarchy>

To obtain an error estimate that can be summed over the levels,
  we use equally spaced masses for the remainder of the section:

$ w_j = frac(1, k + 1) \, wide x_j = frac(j + 1, k + 1) quad \( 0 lt.eq j lt.eq k \) . $

Fix $0 lt.eq t lt.eq 1$ and levels $0 = q_(- 1) < q_0 < dots.h.c < q_k$.
  Set $Delta_j = beta^2 \( q_j - q_(j - 1) \)$ and use the terminal exponent

#[#set math.equation(numbering: n => "(2.15)")
 $ U \( sigma \) = sqrt(t) thin beta hat(H)_n \( sigma \) + sum_(j = 0)^k sqrt(Delta_j) thin z_j dot.op sigma \,
   $ <static-eq:adaptive-exponent>]

where $z_0 \, dots.h \, z_k$ are independent standard Gaussian vectors in $bb(R)^n$.
  Let $cal(A)_j$ contain the prefix through level $j$, including the quenched Hamiltonian disorder.
  Under the path law, put

#[#set math.equation(numbering: n => "(2.16)")
 $ m_j = bb(E) \[ sigma divides cal(A)_j \] \, wide M_j = frac(parallel m_j parallel^2, n) \, wide r_j =
   bb(E) M_j . $ <static-eq:hierarchy-means>]

The conditional means $m_j$ form a martingale. Consequently $0 lt.eq r_0 lt.eq dots.h.c lt.eq r_k lt.eq 1$.
  They can also be obtained by differentiating $F_j$ with respect to an additional deterministic field coupled
  linearly to the spins. We begin by controlling the Gaussian field energy under the same path law.

#thm([Lemma 2.5.])[
  (Field-energy concentration).  #emph[For every $0 lt.eq j lt.eq k$, under the single-path law,
#[#set math.equation(numbering: n => "(2.17)")
 $ "Var" (frac(z_j dot.op sigma, n)) lt.eq 1 / n . $ <static-eq:field-energy-concentration>]

]
] <static-lem:field-energy>

#proof[
  Condition first on the terminal spin $sigma$. The product of the tilts in Equation (2.5) and the terminal Gibbs
    density telescopes. Thus the conditional joint density of all standard Gaussian disorder variables and fields
    is proportional to their original Gaussian density multiplied by
  #[#set math.equation(numbering: n => "(2.18)")
   $ exp {U \( sigma \) - sum_(l = 0)^k w_l F_l} . $ <static-eq:fixed-spin-density>]
  Each $F_l$ is jointly convex in its prefix Gaussian variables.
    At the terminal level this follows from log-sum-exp with linearly entering variables.
    Backwards integration preserves convexity: expectation does so at mass zero,
    and Hölder’s inequality does so for a positive-mass logarithmic expectation.
    Extend $F_l$ to all variables by making it constant in its descendants; it is still convex.
    The weights $w_l$ are nonnegative, and $U \( sigma \)$ is linear for fixed $sigma$.
    The negative logarithm of the conditional density therefore has Hessian at least $I$.
    The linear specialization of Lemma 3 bounds the conditional variance of $z_j dot.op sigma \/ n$ by $1 \/ n$.
  To remove the conditioning, we must also check the conditional mean.
    It is independent of $sigma$, as follows from the gauge transformation with signs $epsilon_i = sigma_i$:
  $ J_(a b) mapsto epsilon_a epsilon_b J_(a b) quad \( a < b \) \, wide
    z_(l \, i) mapsto epsilon_i z_(l \, i) quad \( 0 lt.eq l lt.eq k \) . $
  Leave the diagonal variables fixed. This transformation preserves the Gaussian law and carries the conditional
    law at $sigma$ to the conditional law at the all-plus spin. It also preserves $z_j dot.op sigma$.
    Thus the conditional means agree, and the law of total variance proves Equation (2.17). ◻
]

#thm([Lemma 2.6.])[
  (Average overlap concentration).  #emph[Let $Delta_min = min_j Delta_j$.
    If $k gt.eq 1$ and $k \/ sqrt(n Delta_min) lt.eq 1$, then
#[#set math.equation(numbering: n => "(2.19)")
 $ sum_(j = 0)^k w_j bb(E)_j^(\( 2 \)) \( R - r_j \)^2 lt.eq C (k / sqrt(n Delta_min) + k^(- 1 \/ 2)) \,
   $ <static-eq:average-overlap-concentration>]

 where $C$ is an absolute constant.]
] <static-lem:average-overlap>

#proof[
  The law of total variance splits the overlap error into two terms:
    the fluctuation of its conditional mean $M_j$, and the variance left after the prefix is fixed.
    We estimate these terms in that order.
  #strong[Fluctuation of the conditional mean.] Fix $j < k$.
    Sample three paths $a \, b \, c$ with common prefix through $j +
    1$ and conditionally independent continuations. If $B = B \( sigma^a \, sigma^b \, sigma^c \)$ satisfies $\|
    B \| lt.eq 1$, integration by parts in the two adjacent Gaussian fields gives
  #[#set math.equation(numbering: n => "(2.20)")
   $ bb(E) B (z_j / sqrt(Delta_j) - z_(j + 1) / sqrt(Delta_(j + 1))) dot.op sigma^a / n = -
     w_j bb(E) B frac(m_j dot.op sigma^a, n) . $ <static-eq:tree-ibp>]
  Here is the density calculation, including the common prefix.
    Relative to the product Gaussian law, multiply $W_l$ along each common edge $1 lt.eq l lt.eq j + 1$,
    along each of the three distinct descendant branches, and then by the three terminal Gibbs probabilities.
    The logarithm of this density is
  $ & sum_(l = 1)^(j + 1) x_(l - 1) \( F_l - F_(l - 1) \)\
 & quad +
   sum_(v in { a \, b \, c }) [sum_(l = j + 2)^k x_(l - 1) \( F_l^v - F_(l - 1)^v \) + U^v \( sigma^v \) - F_k^v] . $
  Apply the derivative difference $Delta_j^(- 1 \/ 2) partial_(z_(j \, i)) -
    Delta_(j + 1)^(- 1 \/ 2) partial_(z_(j + 1 \, i))$ coordinate by coordinate.
    At level $j + 1$ and below, every term depends on these fields only through $sqrt(Delta_j) z_j +
    sqrt(Delta_(j + 1)) z_(j + 1)$, so its two derivatives cancel. Terms above $j$ depend on neither field.
    Only $F_j$ remains, with coefficient $x_(j - 1) - x_j = - w_j$; the same calculation applies at $j =
    0$ because $x_(- 1) = 0$. Its normalized derivative is $m_(j \, i)$.
    Throughout this differentiation the spin labels and $B$ are fixed.
    Integration by parts and summation over $i$ now prove Equation (2.20).
  Let $Y$ be the quantity multiplying $B$ on the left-hand side of Equation (2.20).
    Every branch has the single-path marginal. Lemma 7 and the $L^2$ triangle inequality therefore imply
  $ "Var" \( Y \)^(1 \/ 2) lt.eq 2 / sqrt(n Delta_min) . $
  With $B = 1$, Equation (2.20) reads $bb(E) Y = - w_j r_j$.
    Subtract this mean, use $\| B \| lt.eq 1$, and recall $w_j = 1 \/ \( k + 1 \)$ to obtain
  #[#set math.equation(numbering: n => "(2.21)")
   $ lr(|bb(E) B (frac(m_j dot.op sigma^a, n) - r_j)|) lt.eq
     frac(2 \( k + 1 \), sqrt(n Delta_min)) . $ <static-eq:tree-centered>]
  Choose $B = R \( sigma^b \, sigma^c \)$. Conditional on $cal(A)_(j + 1)$ the three descendants are independent,
    so the left-hand side becomes
  $ lr(|bb(E) (frac(m_j dot.op m_(j + 1), n) - r_j) M_(j + 1)|) . $
  We now replace $m_(j + 1)$ by $m_j$ in both factors. The change in the expectation is at most $3 sqrt(gamma_j)$, where
  $ gamma_j = 1 / n bb(E) parallel m_(j + 1) - m_j parallel^2 . $
  This follows from the bounds $parallel m_l parallel lt.eq sqrt(n)$ and $\| M_j - r_j \| lt.eq 1$.
    After replacement the expectation is $bb(E) \( M_j - r_j \) M_j = "Var" \( M_j \)$.
    Martingale orthogonality gives $sum_(j < k) gamma_j lt.eq 1$; averaging the errors and using Cauchy–Schwarz proves
  #[#set math.equation(numbering: n => "(2.22)")
   $ sum_(j < k) w_j "Var" \( M_j \) lt.eq C (k / sqrt(n Delta_min) + k^(- 1 \/ 2)) .
     $ <static-eq:mean-overlap-variance>]
  #strong[Conditional variance.] The conditional mean fluctuation is now controlled.
    To bound the variance of the overlap of two descendants after their common prefix is fixed, define
  $ C_j = "Cov" \( sigma divides cal(A)_j \) \, wide D_j = nabla^2 F_j \, wide V_j =
    "Cov" \( m_(j + 1) divides cal(A)_j \) \, $
  where all conditional quantities are given $cal(A)_j$, and $D_j$ is the Hessian in an additive deterministic
    spin field. The law of total covariance and the differentiated recursion give
  $ C_j = bb(E) \[ C_(j + 1) divides cal(A)_j \] + V_j \, wide D_j = bb(E) \[ D_(j + 1) divides cal(A)_j \] +
    x_j V_j . $
  The terminal identity $D_k = C_k$, together with the nondecreasing masses, allows backward induction and gives
  #[#set math.equation(numbering: n => "(2.23)")
   $ D_j succ.curly.eq x_j C_j . $ <static-eq:hessian-covariance-bound>]
  For the next field, abbreviate $Delta = Delta_(j + 1)$ and set $y = sqrt(Delta) z_(j + 1)$.
    Conditional on $cal(A)_j$, its density is proportional to $exp { - parallel y parallel^2 \/ \( 2 Delta \) +
    x_j F_(j + 1) }$. Integration by parts, using $nabla_y F_(j + 1) = m_(j + 1)$, yields
  #[#set math.equation(numbering: n => "(2.24)")
   $ "Cov" \( m_(j + 1) \, y divides cal(A)_j \) & = Delta D_j \,\
"Cov" \( y divides cal(A)_j \) & = Delta I + Delta^2 x_j D_j . $ <static-eq:conditional-cross-covariance>]
  For the first identity, use $bb(E) \[ y divides cal(A)_j \] =
    Delta x_j m_j$ and subtract the product of means from the integration-by-parts expression for
    $bb(E) \[ m_(j + 1) y^(sans(T)) divides cal(A)_j \]$. A further application to $y
    y^(sans(T))$ proves the second identity. The joint covariance matrix of $\( m_(j + 1) \, y \)$ is positive
    semidefinite, so its Schur complement gives
  #[#set math.equation(numbering: n => "(2.25)")
   $ V_j succ.curly.eq Delta D_j \( I + Delta x_j D_j \)^(- 1) D_j . $ <static-eq:covariance-schur-bound>]
  Order the eigenvalues of $C_j \, D_j \, V_j$ decreasingly and denote them by $c_i \, d_i \, v_i$, respectively.
    Equation (2.23) implies $d_i gt.eq x_j c_i$. The function $d mapsto Delta
    d^2 \/ \( 1 + Delta x_j d \)$ is increasing on $d gt.eq 0$. Apply the min–max principle to Equation (2.25) to get
  $ v_i gt.eq frac(Delta d_i^2, 1 + Delta x_j d_i) gt.eq frac(Delta x_j^2 c_i^2, 1 + Delta x_j^2 c_i) . $
  At or above the threshold $c_i gt.eq \( Delta x_j^2 \)^(- 1)$, the final expression is at least $c_i \/ 2$.
    Since also $c_i lt.eq "tr" C_j lt.eq n$, these eigenvalues contribute at most $2 n "tr" V_j$ to $sum_i c_i^2$.
    Those below the threshold contribute at most $n \/ \( Delta x_j^2 \)$. Together the two bounds give
  #[#set math.equation(numbering: n => "(2.26)")
   $ frac("tr" C_j^2, n^2) lt.eq frac(2 "tr" V_j, n) + frac(1, n Delta_(j + 1) x_j^2) .
     $ <static-eq:conditional-square-trace>]
  Martingale orthogonality again supplies the summable quantity: $sum_(j < k) bb(E) "tr" V_j lt.eq n$.
    Sum over $j$, using $x_j = \( j + 1 \) \/ \( k + 1 \)$, to obtain
  #[#set math.equation(numbering: n => "(2.27)")
   $ B_0 := sum_(j < k) w_j bb(E) frac("tr" C_j^2, n^2) lt.eq C / k +
     frac(C k, n Delta_min) . $ <static-eq:average-square-trace>]
  For two independent descendants of the level-$j$ prefix, the conditional overlap has mean $M_j$ and variance
  $ 1 / n^2 ("tr" C_j^2 + 2 m_j^(sans(T)) C_j m_j) . $
  The contribution of the second term is at most $2 sqrt("tr" C_j^2 \/ n^2)$:
    use $parallel m_j parallel^2 lt.eq n$ and $parallel C_j parallel_(upright("op")) lt.eq sqrt("tr" C_j^2)$.
    Thus the averaged conditional variance is at most $B_0 + 2 sqrt(B_0)$.
    Under $k \/ sqrt(n Delta_min) lt.eq 1$, Equation (2.27) gives $B_0 lt.eq C \/ k$.
    Combine this estimate with the conditional-mean bound (2.22) through the law of total variance.
    Finally, the level $k$ costs at most $4 \/ \( k + 1 \)$ because $\| R - r_k \| lt.eq 2$.
    These bounds prove Equation (2.19). ◻
]

=== 2.5 Adaptive interpolation and the finite-size error <adaptive-interpolation-and-the-finite-size-error>

#proof[
  The upper comparison was proved in Equation (2.13). To obtain the lower comparison,
    we choose the field levels so that the pressure derivative separates into a quadratic expression in the
    overlap means and the overlap error controlled by Lemma 8.
    After constructing that path, we will integrate the derivative and identify its single-site endpoint with a
    scalar trial measure.
  #strong[Choosing the adaptive path.] Consider provisionally a differentiable path $q \( t \)$ with positive
    gaps, and set $f \( t \) = n^(- 1) bb(E) F_0 \( t \, q \( t \) \)$.
    For a field gap in overlap units, $a_j = q_j - q_(j - 1)$, the hierarchy identity gives
  #[#set math.equation(numbering: n => "(2.28)")
   $ frac(partial, partial a_j) 1 / n bb(E) F_0 = beta^2 / 2 (1 - sum_(l = j)^k w_l r_l) .
     $ <static-eq:field-gap-derivative>]
  The Hamiltonian contribution to the derivative is $beta^2 / 4 \( 1 - sum_l w_l bb(E)_l^(\( 2 \)) R^2 \)$.
    Summing the field contributions and using $sum_(j = 0)^l a'_j = q'_l$ therefore gives
  $ f' \( t \) = beta^2 / 4 (1 - sum_(l = 0)^k w_l bb(E)_l^(\( 2 \)) R^2) + beta^2 /
    2 (q'_k - sum_(l = 0)^k w_l r_l q'_l) . $
  This calculation suggests the system
  #[#set math.equation(numbering: n => "(2.29)")
   $ q'_j \( t \) = - r_j \( t \, q \( t \) \) . $ <static-eq:adaptive-ode>]
  Indeed, since $bb(E)_j^(\( 2 \)) R = r_j$, every positive-gap solution satisfies
  #[#set math.equation(numbering: n => "(2.30)")
   $ f' \( t \) = beta^2 /
     4 [1 - 2 r_k + sum_(j = 0)^k w_j r_j^2 - sum_(j = 0)^k w_j bb(E)_j^(\( 2 \)) \( R - r_j \)^2] .
     $ <static-eq:adaptive-pressure-derivative>]
  The final term is exactly the error already estimated; the remaining terms can be bounded after integration
    using the differential equation. We now construct a solution with gaps large enough to apply that estimate. Choose
  $ k = floor.l n^(1 \/ 12) floor.r \, wide eta = n^(- 1 \/ 6) \, wide
    q_j \( 1 \) = \( j + 1 \) eta quad \( 0 lt.eq j lt.eq k \) \, $
  and solve Equation (2.29) backwards from $t = 1$.
  #strong[Existence and bounds for the adaptive path.] We verify that this system has a solution throughout
    $\[ 0 \, 1 \]$ and keeps every gap positive. On the open region of positive gaps,
    the finite Gaussian recursions make $r_j$ continuous in $t$ and locally Lipschitz in $q$.
    The following domination justifies those assertions. Fix a compact subset of this region;
    in this local argument constants may depend on $n \, k \, beta$ and that subset.
    Uniformly in the prefix and in $t in \[ 0 \, 1 \]$, we have $parallel nabla_(z_h) F_h parallel =
    sqrt(Delta_h) parallel m_h parallel lt.eq L$. Subtract the value of $F_h$ at $z_h =
    0$ from both numerator and denominator in the normalized tilt. This gives
  $ W_h \( z_h \) lt.eq C exp \( L parallel z_h parallel \) . $
  The conditional first moments of subsequent fields are consequently uniformly bounded.
    The derivative $partial_(q_i) U$ is bounded by a constant times $parallel z_i parallel +
    parallel z_(i + 1) parallel$, with the second term omitted at $i = k$.
    Differentiation through the recursions therefore yields
  $ \| partial_(q_i) F_l \| lt.eq C (1 + sum_(h lt.eq l) parallel z_h parallel) . $
  To apply this to $r_j$, represent it as the expectation of $R$ on a two-path tree.
    Since terminal Gibbs probabilities are at most one, the preceding estimates dominate its density and the $q_i$
    derivative of that density by $C \( 1 + S \) e^(L S)$, where $S$ is the sum of the norms of all fields in this
    finite tree. The bound is Gaussian integrable, uniformly in $t$ and in the chosen compact set of $q$ values.
    It justifies the differentiated recursions and gives the required local Lipschitz property.
    At $t = 0$, continuity follows from the same bound and continuity in $sqrt(t)$;
    no derivative of $sqrt(t)$ is needed.
  Along the local solution, $r_j gt.eq r_(j - 1)$ implies that each gap $q_j -
    q_(j - 1)$ is nondecreasing as time runs backwards, with $r_(- 1) = 0$.
    Each gap therefore stays at least $eta$. The bound $0 lt.eq r_j lt.eq 1$ also prevents escape to infinity and gives
  #[#set math.equation(numbering: n => "(2.31)")
   $ q_k \( t \) lt.eq \( k + 1 \) eta + 1 - t \, wide Delta_j \( t \) gt.eq
     beta^2 eta . $ <static-eq:adaptive-path-bounds>]
  These estimates continue the local solution across the full interval.
    They also verify the field-gap hypothesis of Lemma 8. Thus, for all sufficiently large $n$,
    uniformly along the path,
  #[#set math.equation(numbering: n => "(2.32)")
   $ sum_(j = 0)^k w_j bb(E)_j^(\( 2 \)) \( R - r_j \)^2 lt.eq
     C_beta n^(- 1 \/ 24) . $ <static-eq:adaptive-overlap-error>]
  Indeed, the two terms in that lemma are controlled by $k \/ sqrt(n beta^2 eta) =
    O_beta \( n^(- 1 \/ 3) \)$ and $k^(- 1 \/ 2) = O \( n^(- 1 \/ 24) \)$.
  #strong[Integration of the pressure derivative.] The adaptive path has now been constructed and its overlap
    error is bounded, so we can integrate Equation (2.30). Write $delta = \( k + 1 \) eta =
    O \( n^(- 1 \/ 12) \)$ and $Q_j = q_j \( 0 \)$. The derivative in Equation (2.28) lies between $0$ and
    $beta^2 \/ 2$. Consequently, removing the fields present at $t = 1$ costs at most $beta^2 delta \/ 2$, and
  $ f \( 1 \) lt.eq p_n \( beta \) + beta^2 / 2 delta . $
  The differential equation and Jensen’s inequality also give
  $ integral_0^1 r_j \( t \) thin upright(d) t = Q_j - q_j \( 1 \) \, wide
    integral_0^1 r_j \( t \)^2 thin upright(d) t gt.eq #scale(x: 120%, y: 120%)[\(] Q_j -
    q_j \( 1 \) #scale(x: 120%, y: 120%)[\)]^2 . $
  The endpoint bounds are $0 lt.eq Q_j lt.eq 1 + delta$ and $0 lt.eq q_j \( 1 \) lt.eq delta$.
    Integrate Equation (2.30), apply these bounds and the overlap error in Equation (2.32), and conclude that
  #[#set math.equation(numbering: n => "(2.33)")
   $ p_n \( beta \) gt.eq f \( 0 \) + beta^2 / 4 (1 - 2 Q_k + sum_(j = 0)^k w_j Q_j^2) -
     C_beta n^(- 1 \/ 24) . $ <static-eq:adaptive-lower-bound>]
  #strong[Identification of a scalar trial measure.] At $t = 0$ there is no Hamiltonian coupling,
    so the recursion factors over sites. Thus $f \( 0 \)$ is the scalar single-site value at levels $Q_0 \,
    dots.h \, Q_k$. The only possible obstruction to using these levels as the support of a trial measure on
    $\[ 0 \, 1 \]$ is that some may exceed one.
  Replace each such level by $overline(Q)_j = min \( Q_j \, 1 \)$.
    Each gap can only decrease, and their total decrease is $Q_k - overline(Q)_k lt.eq delta$.
    Equation (2.28) bounds the change in the scalar value by $beta^2 delta \/ 2$.
    The quadratic expression in Equation (2.33) changes by at most $C_beta delta$ as well.
    We may therefore take $Q_k lt.eq 1$ within the stated error, interpreting zero gaps by continuity.
  Now define $mu = sum_(j = 0)^k w_j delta_(Q_j)$. Its distribution function is zero up to $Q_0$,
    equals $x_(j - 1)$ on each gap $\( Q_(j - 1) \, Q_j \)$, and equals one between $Q_k$ and $1$.
    Over this final interval, the recursion maps $log \( 2 cosh z \)$ to $log \( 2 cosh z \) +
    beta^2 \( 1 - Q_k \) \/ 2$. Hence
  $ Phi_alpha \( 0 \, 0 \) = f \( 0 \) + beta^2 / 2 \( 1 - Q_k \) . $
  The penalty is identified by summation by parts:
  $ beta^2 / 2 integral_0^1 s alpha \( s \) thin upright(d) s = beta^2 / 4 (1 - sum_(j = 0)^k w_j Q_j^2) . $
  The expression preceding the error in Equation (2.33) is therefore exactly $cal(P)_beta \( mu \)$.
    It is at least $P_beta$, which completes the lower comparison and the proof. ◻
]

== 3 Scalar regularity and properties of a minimizer <static-sec:scalar>

We now establish the scalar identities used in the overlap comparisons and the equilibrium energy estimate.
  The argument has three parts. First, we justify the scalar equation and its stochastic evolution for general
  distribution functions, including those with atoms. Next,
  we derive first variations and use them to locate the support of an arbitrary minimizing measure.
  Finally, the resulting stationarity identity gives a strict energy bound when $beta > 1$.
  No further description of the minimizer’s support is assumed.

Regularity and step approximation for the Parisi evolution,
  together with zero-field support properties of its minimizers,
  were developed by Auffinger and Chen [1] Propositions 1–2 and Theorems 1, 5.
  The full first-variation characterization appears in Chen [7] Theorem 2 and Proposition 1 and, independently,
  in Jagannath and Tobasco [10] Proposition 1.1, Corollary 3.10 and Remark 1.3.
  We prove the required statements here with the normalization and atom conventions used by the later pressure
  comparisons.

Throughout this section, $alpha \( s \) = mu \( \[ 0 \, s \] \)$ is the right-continuous distribution function of
  a probability measure on $\[ 0 \, 1 \]$. Recall the scalar terminal-value equation

#[#set math.equation(numbering: n => "(3.1)")
 $ - partial_s Phi_alpha = beta^2 / 2 #scale(x: 120%, y: 120%)[\(] partial_(z z) Phi_alpha +
   alpha \( s \) \( partial_z Phi_alpha \)^2 #scale(x: 120%, y: 120%)[\)] \, wide Phi_alpha \( 1 \, z \) =
   log \( 2 cosh z \) . $ <static-eq:scalar-pde-recalled>]

For a step distribution function this is the Gaussian recursion from the preceding section.
  For general distribution functions, the scalar values are defined by approximation,
  which the next lemma justifies. The time derivative in the equation is understood almost everywhere;
  no differentiability at a jump of $alpha$ is required. We denote the first two spatial derivatives by $u =
  partial_z Phi_alpha$ and $chi = partial_(z z) Phi_alpha$.

=== 3.1 Regularity and first variations <regularity-and-first-variations>

#thm([Lemma 3.1.])[
  (Regularity, stability, and scalar evolution).  #emph[The step approximation defining $Phi_alpha$ is independent
    of the approximating sequence. The functions $Phi_alpha \, u \, chi$ are continuous on $\[ 0 \, 1 \] times
    bb(R)$, with
#[#set math.equation(numbering: n => "(3.2)")
 $ \| u \| lt.eq 1 \, wide 0 < chi lt.eq 1 \, wide \| chi \( s \, z \) - chi \( s \, z' \) \| lt.eq C_beta \| z -
   z' \| . $ <static-eq:scalar-derivative-bounds>]

 The function $Phi_alpha \( s \, dot.op \)$ is even, so $u \( s \, 0 \) = 0$.
   For two distribution functions $alpha \, tilde(alpha)$,
#[#set math.equation(numbering: n => "(3.3)")
 $ sup_(s \, z) #scale(x: 120%, y: 120%)[\(] \| Phi_alpha - Phi_(tilde(alpha)) \| + \| u_alpha -
   u_(tilde(alpha)) \| + \| chi_alpha - chi_(tilde(alpha)) \| #scale(x: 120%, y: 120%)[\)] lt.eq
   C_beta integral_0^1 \| alpha \( s \) - tilde(alpha) \( s \) \| thin upright(d) s . $ <static-eq:scalar-stability>]

 These functions are also continuous in $beta > 0$, uniformly in $\( s \, z \)$ for their differences,
   locally in $beta$.]
  #emph[The stochastic differential equation
#[#set math.equation(numbering: n => "(3.4)")
 $ thin upright(d) X_s = beta thin upright(d) B_s + beta^2 alpha \( s \) u \( s \, X_s \) thin upright(d) s \,
   wide X_0 = 0 \, $ <static-eq:scalar-diffusion>]

 has a unique strong solution. For a step distribution function,
   its transitions across the constant-mass intervals are the normalized tilted Gaussian kernels of the scalar
   recursion. Its bounded martingale $U_s = u \( s \, X_s \)$ satisfies
#[#set math.equation(numbering: n => "(3.5)")
 $ U_t - U_s = beta integral_s^t chi \( v \, X_v \) thin upright(d) B_v . $ <static-eq:scalar-martingale>]

 Moreover,
#[#set math.equation(numbering: n => "(3.6)")
 $ bb(E) chi \( t \, X_t \) - bb(E) chi \( s \, X_s \) = -
   beta^2 integral_s^t alpha \( v \) bb(E) chi \( v \, X_v \)^2 thin upright(d) v .
   $ <static-eq:scalar-chi-expectation>]

 For $0 lt.eq s < t lt.eq 1$, the conditional form is
#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E) \[ chi \( t \, X_t \) divides X_s \] = chi \( s \, X_s \) -
   beta^2 integral_s^t alpha \( v \) bb(E) \[ chi \( v \, X_v \)^2 divides X_s \] thin upright(d) v .
   $ <eq:scalar-evolution>]

 Consequently $Gamma \( s \) := bb(E) u \( s \, X_s \)^2$ is continuously differentiable,
   with one-sided derivatives at the endpoints, and
#[#set math.equation(numbering: n => "(3.8)")
 $ Gamma \( 0 \) = 0 \, wide Gamma' \( s \) = beta^2 bb(E) chi \( s \, X_s \)^2 . $ <static-eq:gamma-derivative>]

 The well-posedness statement and the evolution identities (3.5)–(3.6) also hold for a diffusion started at any
   deterministic time and spatial value.]
] <static-lem:scalar-regularity>

#proof[
  We prove estimates uniform over step distribution functions, use them to pass to general $alpha$,
    and then establish continuity in the temperature parameter.
  #strong[Derivative bounds along a finite step path.] Suppose first that $alpha$ is a step function.
    On an interval of constant mass $m$, its recursion is
  $ T_m f \( z \) = m^(- 1) log bb(E) e^(m f \( z + beta sqrt(ell) thin Z \)) $
  where $ell$ is the interval length and $T_0 f = bb(E) f \( z + beta sqrt(ell) thin Z \)$.
    To keep track of the successive tilts, fix $\( s \, z \)$ and list the remaining breakpoints as $s =
    t_0 < dots.h.c < t_r = 1$. Let $m_j$ be the mass on $\[ t_j \, t_(j + 1) \)$ and set $f_j =
    Phi_alpha \( t_j \, dot.op \)$. Starting with $Z_0 = z$, sample $Z_(j + 1)$ from
  $ K_j \( v \, thin upright(d) y \) = exp { m_j \[ f_(j + 1) \( y \) - f_j \( v \) \] }
    N \( v \, beta^2 \( t_(j + 1) - t_j \) \) \( thin upright(d) y \) \, $
  where the exponential equals one at $m_j = 0$. Each kernel is normalized by the scalar recursion on its own
    interval. Put $cal(F)_j = sigma \( Z_0 \, dots.h \, Z_j \)$ and $M_j = f'_j \( Z_j \)$.
    Differentiating the recursion once and twice gives
  $ bb(E) \[ M_(j + 1) divides cal(F)_j \] & = M_j \,\
f''_j \( Z_j \) & = bb(E) \[ f''_(j + 1) \( Z_(j + 1) \) divides cal(F)_j \] +
  m_j bb(E) \[ \( M_(j + 1) - M_j \)^2 divides cal(F)_j \] . $
  Thus $M$ is a martingale for the concatenated kernels, even though the tilts on successive intervals can differ.
    Its terminal value is $M_r = tanh Z_r$. Iterating the second identity yields
  $ chi \( s \, z \) = bb(E) "sech"^2 \( Z_r \) + sum_(j = 0)^(r - 1) m_j bb(E) \( M_(j + 1) - M_j \)^2 . $
  The increments are orthogonal, so their unweighted squared sum has expectation $"Var" \( tanh Z_r \)$.
    Since $0 lt.eq m_j lt.eq 1$, we obtain
  $ 0 < bb(E) #scale(x: 120%, y: 120%)[\[] 1 - tanh^2 \( Z_r \) #scale(x: 120%, y: 120%)[\]] lt.eq
    chi \( s \, z \) lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] 1 - tanh^2 \( Z_r \) #scale(x: 120%, y: 120%)[\]] +
    "Var" \( tanh Z_r \) = 1 - u \( s \, z \)^2 lt.eq 1 . $
  Every recursion preserves evenness. Its gradient is a conditional mean of the terminal gradient,
    which gives $\| u \| lt.eq 1$.
  Before differentiating the equation, we record why all required spatial derivatives exist and are bounded for a
    fixed finite path. The $k$th derivative of one logarithmic Gaussian integral is a polynomial in tilted moments
    of $f' \, dots.h \, f^(\( k \))$, with coefficients bounded for $0 lt.eq m lt.eq 1$.
    At $m = 0$, differentiation passes directly through Gaussian expectation.
    All positive-order derivatives of $log \( 2 cosh z \)$ are bounded,
    so finite induction gives bounded derivatives at the breakpoints and within each interval.
    The scalar values have at most linear growth, ensuring Gaussian integrability at every step.
    These preliminary bounds may depend on the path; we next obtain the uniform bound needed for approximation.
  Within a constant-mass interval the recursion is smooth and solves Equation (3.1).
    Its first two spatial derivatives satisfy
  $ - u_s & = beta^2 / 2 u_(z z) + beta^2 alpha u u_z \,\
- chi_s & = beta^2 / 2 chi_(z z) + beta^2 alpha u chi_z + beta^2 alpha chi^2 . $
  Set $w = chi_z$. One more differentiation gives a linear equation:
  $ - w_s = beta^2 / 2 w_(z z) + beta^2 alpha u w_z + 3 beta^2 alpha chi w . $
  The bounds already proved for $u$ and $chi$ control this equation’s drift and potential uniformly over all step
    paths. Its terminal value has absolute value at most $2$.
    Concatenate the diffusion representations over the finitely many intervals to obtain
  $ sup_(s \, z) \| w \( s \, z \) \| lt.eq 2 e^(3 beta^2) . $
  These differentiations may all be performed first inside the finite Gaussian recursions.
    Their bounded derivatives justify passage under the integrals,
    so the uniform estimate does not presuppose any regularity of the limiting path.
  #strong[The scalar diffusion and its evolution identities.] We next identify the tilted kernels with the
    diffusion in Equation (3.4). On a constant-mass interval $\[ a \, b \]$,
    start Brownian motion at $z$ by setting $Y_s = z + beta \( B_s - B_a \)$. Under this law, Itô’s formula identifies
  $ exp { m \( Phi \( b \, Y_b \) - Phi \( a \, z \) \) } $
  as the exponential martingale with stochastic logarithm $m beta integral_a^b u \( v \, Y_v \) thin upright(d)
    B_v$. Its bounded integrand justifies the change of measure, which adds drift $beta^2 m u$.
    Under that drift, a further application of Itô’s formula gives
  $ thin upright(d) u \( s \, X_s \) = beta chi \( s \, X_s \) thin upright(d) B_s \, wide
    thin upright(d) chi \( s \, X_s \) = beta chi_z \( s \, X_s \) thin upright(d) B_s -
    beta^2 alpha \( s \) chi \( s \, X_s \)^2 thin upright(d) s . $
  This establishes both evolution identities for step paths.
  #strong[Stability and passage to general distribution functions.] The remaining task is to make these
    constructions independent of the step approximation. Subtract the equations for two step paths,
    keeping the same diffusion coefficient. The difference of the scalar values has drift $beta^2 /
    2 alpha \( u + tilde(u) \)$ and source $beta^2 / 2 \( alpha - tilde(alpha) \) tilde(u)^2$.
    The equation for $u - tilde(u)$ has bounded drift and potential, with source bounded by $C_beta \| alpha -
    tilde(alpha) \|$. For $chi - tilde(chi)$, the drift and potential remain bounded, and the source is bounded by
  $ C_beta #scale(x: 120%, y: 120%)[\(] \| alpha - tilde(alpha) \| \( s \) + sup_z \| u \( s \, z \) -
    tilde(u) \( s \, z \) \| #scale(x: 120%, y: 120%)[\)] . $
  To obtain the last bound, expand $alpha u chi_z - tilde(alpha) tilde(u)
    tilde(chi)_z$ and use the uniform bound on $tilde(chi)_z$.
    In the remaining reaction term, factor the difference of squares.
    Each difference has zero terminal value, so the diffusion representation of these linear equations proves
    Equation (3.3), first for $Phi$, then for $u$, and finally for $chi$.
  Approximate an arbitrary distribution function in $L^1$ by step distribution functions.
    The stability estimates make $Phi \, u \, chi$ converge uniformly,
    with uniform convergence of differences for the unbounded scalar value $Phi$.
    The fundamental theorem of calculus in $z$ identifies the limits of $u$ and $chi$ with the first two spatial
    derivatives of the limiting $Phi$. Continuity, symmetry, and all non-strict bounds follow by passage to the
    limit. Passing to the limit in the time-integrated step equation also gives Equation (3.1) almost everywhere
    in time.
  The limiting drift in Equation (3.4) is measurable in time, bounded, and uniformly Lipschitz in space.
    Hence the equation has a strong solution and pathwise uniqueness.
    Couple the solutions for two step approximations with the same Brownian motion;
    Gronwall’s inequality gives convergence uniformly in time.
    We may therefore also pass the terminal lower bound for $chi$ to the limit:
  $ chi \( s \, z \) gt.eq bb(E)_(s \, z) "sech"^2 \( X_1 \) > 0 . $
  Since $X_1$ is finite almost surely, this lower bound is strictly positive.
    Itô isometry passes the martingale identity to the limit,
    and bounded convergence does the same for the expectation identity.
    Nothing in these arguments requires the starting point to be $\( 0 \, 0 \)$;
    they apply at every deterministic starting time and spatial value.
    Applying the expectation identity to a diffusion started at $\( s \, z \)$ and then using the Markov property
    gives Equation (3.7). Finally, Equation (3.5) and the continuity of $chi$ and $X$ give Equation (3.8).
  #strong[Continuity in the temperature parameter.] Write $b =
    beta^2$ and repeat the subtraction argument with different values of $b$.
    In the equation for $Phi$, the additional source is $\( tilde(b) - b \) \( tilde(chi) + alpha tilde(u)^2 \) \/
    2$, bounded by $C \| tilde(b) - b \|$. The bound on $tilde(chi)_z$ gives the same source bound for $u$.
    Thus the differences of $Phi$ and $u$ are $O \( \| tilde(b) - b \| \)$ locally uniformly for $b > 0$.
    To obtain continuity of $chi$, use its uniform spatial Lipschitz bound and approximate it by a difference
    quotient of $u$. For any $h > 0$,
  $ sup_(s \, z) \| chi - tilde(chi) \| lt.eq 2 / h sup_(s \, z) \| u - tilde(u) \| + C h . $
  Choose $h$ small first, then take $tilde(b)$ sufficiently close to $b$.
    This proves the required uniform continuity of $chi$. The step approximation transfers these parameter
    estimates to all distribution functions. ◻
]

We next differentiate the scalar functional in two directions:
  a change of its distribution function and a change of temperature with the distribution function fixed.
  We prove both formulas by differences, so they require no differentiability of a minimizing measure.
  For another distribution function $tilde(alpha)$, set $alpha_theta = alpha + theta \( tilde(alpha) - alpha \)$.
  The first variation is

#[#set math.equation(numbering: n => "(3.9)")
 $ frac(thin upright(d), thin upright(d) theta) cal(P)_beta \( alpha_theta \)\|_(theta = 0 +) = beta^2 /
   2 integral_0^1 \( tilde(alpha) - alpha \) \( s \) \( Gamma \( s \) - s \) thin upright(d) s .
   $ <static-eq:scalar-mass-variation>]

We use $cal(P)_beta \( alpha \)$ to denote the functional of the measure having distribution function $alpha$.
  With $alpha$ held fixed, the temperature derivative of the scalar value is

#[#set math.equation(numbering: n => "(3.10)")
 $ frac(partial, partial \( beta^2 \)) Phi_alpha \( 0 \, 0 \) = 1 /
   2 integral_0^1 bb(E) #scale(x: 120%, y: 120%)[\[] chi \( s \, X_s \) +
   alpha \( s \) u \( s \, X_s \)^2 #scale(x: 120%, y: 120%)[\]] thin upright(d) s .
   $ <static-eq:scalar-temperature-variation>]

For each formula, start with step paths, where the equations are classical between finitely many breakpoints.
  Subtraction gives an integral representation, and that representation passes to general paths by the stability lemma.

#strong[Variation of the distribution function.] Subtract the equations for $Phi_(alpha_theta)$ and $Phi_alpha$.
  The resulting drift is $beta^2 alpha \( u_(alpha_theta) + u_alpha \) \/ 2$,
  and the source is $theta beta^2 \( tilde(alpha) - alpha \) u_(alpha_theta)^2 \/ 2$.
  Introduce $Y^theta$ by $Y_0^theta = 0$ and

$ thin upright(d) Y_s^theta = beta thin upright(d) B_s + beta^2 /
  2 alpha \( s \) \( u_(alpha_theta) + u_alpha \) \( s \, Y_s^theta \) thin upright(d) s . $

The diffusion representation of the difference equation is the exact identity

#[#set math.equation(numbering: n => "(3.11)")
 $ frac(Phi_(alpha_theta) \( 0 \, 0 \) - Phi_alpha \( 0 \, 0 \), theta) = beta^2 /
   2 bb(E) integral_0^1 \( tilde(alpha) - alpha \) \( s \) u_(alpha_theta) \( s \, Y_s^theta \)^2 thin upright(d)
   s . $ <static-eq:scalar-mass-difference>]

For general $alpha \, tilde(alpha)$, choose step approximations converging to each in $L^1$,
  and take their convex combinations at a fixed $theta > 0$.
  Equation (3.3) shows that the mixed drifts converge in integrated spatial supremum norm.
  They also have a common spatial Lipschitz bound. A coupling with the same Brownian motion and Gronwall’s
  inequality therefore gives uniform convergence of the corresponding $Y^theta$ processes.
  The sources converge in integrated expectation by $\| u \| lt.eq 1$, the spatial Lipschitz bound for $u$,
  its uniform convergence, and the $L^1$ convergence of $tilde(alpha) - alpha$.
  Hence Equation (3.11) holds for arbitrary distribution functions.

We may now send $theta arrow.b 0$. The same estimates give $Y^theta arrow.r
  X$ and uniform convergence of $u_(alpha_theta)$ to $u_alpha$.
  The right-hand side converges to $beta^2 / 2 integral \( tilde(alpha) - alpha \) Gamma$.
  Subtract the derivative of the linear penalty to obtain Equation (3.9).

#strong[Variation of the temperature.] Set $b = beta^2$ and use a superscript $b$ for scalar functions with
  parameter $sqrt(b)$. For $tilde(b) eq.not b$, let $Y_0^(b \, tilde(b)) = 0$ and define its evolution by

$ thin upright(d) Y_s^(b \, tilde(b)) = sqrt(b) thin upright(d) B_s + b /
  2 alpha \( s \) \( u^b + u^(tilde(b)) \) \( s \, Y_s^(b \, tilde(b)) \) thin upright(d) s . $

Subtract the two step-path equations with diffusion coefficient $b \/ 2$ to obtain

#[#set math.equation(numbering: n => "(3.12)")
 $ frac(Phi^(tilde(b)) \( 0 \, 0 \) - Phi^b \( 0 \, 0 \), tilde(b) - b) = 1 /
   2 bb(E) integral_0^1 \[ chi^(tilde(b)) + alpha \( u^(tilde(b)) \)^2 \] \( s \, Y_s^(b \, tilde(b)) \) thin
   upright(d) s . $ <static-eq:scalar-temperature-difference>]

For fixed $b \, tilde(b)$, pass to general $alpha$ by the same step approximation and Brownian coupling used
  above. The additional term involving $chi$ is controlled by its uniform spatial Lipschitz bound.
  Next let $tilde(b) arrow.r b$. Parameter continuity in Lemma 9 and the coupling give $Y^(b \, tilde(b)) arrow.r
  X$. The integrands remain bounded and converge in integrated expectation.
  The limit in Equation (3.12) therefore proves Equation (3.10) for approach from either side.

=== 3.2 Minimizers and the energy gap <minimizers-and-the-energy-gap>

The mass variation converts minimization into a condition on the support.
  We will use that condition both to identify the expected scalar susceptibility at every time and to show that
  the minimizing measure is nontrivial when $beta > 1$.

#thm([Proposition 3.2.])[
  (Support and stationarity identities).  #emph[The scalar functional has a minimizer $mu$.
    For every such minimizer, with its associated scalar process, the following assertions hold:]
  + #emph[$0 in "supp" mu$, and $"supp" mu subset \[ 0 \, 1 - epsilon_0 \]$ for some $epsilon_0 > 0$.]
  + #emph[At every $q in "supp" mu ∩ \( 0 \, 1 \)$, $Gamma \( q \) = q$ and $Gamma' \( q \) lt.eq 1$.
    At $q = 0$, $Gamma \( 0 \) = 0$ and $Gamma' \( 0 \) lt.eq 1$.]
  + #emph[Define
#[#set math.equation(numbering: n => "(3.13)")
 $ d_(*) \( s \) = 1 - integral_(\( s \, 1 \]) t thin mu \( thin upright(d) t \) \, wide A \( s \) =
   integral_s^1 alpha \( t \) thin upright(d) t = d_(*) \( s \) -
   s alpha \( s \) . $ <static-eq:scalar-A-d-definitions>]

 Then, at every $s in \[ 0 \, 1 \]$,
#[#set math.equation(numbering: n => "(3.14)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] chi \( s \, X_s \) +
   alpha \( s \) u \( s \, X_s \)^2 #scale(x: 120%, y: 120%)[\]] =
   d_(*) \( s \) . $ <static-eq:scalar-stationarity-identity>]

 Equivalently, since $d_(*) \( s \) = A \( s \) + s alpha \( s \)$,
#[#set math.equation(numbering: n => "(3.15)")
 $ bb(E) chi \( s \, X_s \) = A \( s \) + alpha \( s \) \( s - Gamma \( s \) \) wide \( 0 lt.eq s lt.eq 1 \) .
   $ <eq:scalar-stationarity>]

 In particular
#[#set math.equation(numbering: n => "(3.16)")
 $ chi \( 0 \, 0 \) = A \( 0 \) \, wide beta A \( 0 \) lt.eq 1 . $ <static-eq:scalar-susceptibility>]

 Furthermore $alpha \( s \) > 0$ for every $s in \( 0 \, 1 \]$,
   $A \( h \) < A \( 0 \)$ for every $h in \( 0 \, 1 \]$, and $d_(*) \( 0 + \) = A \( 0 \)$.]
] <static-prop:scalar-minimizer>

#proof[
  #strong[Existence and variational support condition.] Weak convergence of probability measures on $\[ 0 \, 1 \]$
    implies pointwise convergence of their distribution functions at continuity points of the limit.
    Bounded convergence then gives convergence in $L^1$. By Lemma 9,
    the functional $cal(P)_beta$ is continuous for this topology.
    The space of probability measures on $\[ 0 \, 1 \]$ is compact, so a minimizer exists.
  Fix any minimizer and define
  $ G \( q \) = integral_q^1 \( Gamma \( s \) - s \) thin upright(d) s . $
  Fubini’s theorem and Equation (3.9) give $integral G thin upright(d) tilde(mu) gt.eq
    integral G thin upright(d) mu$ for every probability measure $tilde(mu)$.
    Testing with point masses shows that $mu$ is supported on the set of global minima of $G$.
    The function $G$ is twice continuously differentiable and satisfies
  $ G' \( q \) = q - Gamma \( q \) \, wide G'' \( q \) = 1 - Gamma' \( q \) . $
  The first- and second-derivative tests now give the claimed identities and inequalities at interior support
    points. At the right endpoint, $Gamma \( 1 \) = bb(E) tanh^2 \( X_1 \) < 1$, and hence $G' \( 1 \) > 0$.
    Thus $1$ does not minimize $G$. Its minimum set is compact, so $"supp" mu$ stays a positive distance below $1$.
  #strong[The left endpoint of the support.] Let $q_0 = min "supp" mu$. We claim that $q_0 = 0$.
    Suppose instead that $q_0 in \( 0 \, 1 \)$. Then $alpha = 0$ on $\[ 0 \, q_0 \)$, so $X_s =
    beta B_s$ there and the equation for $chi$ is the backward heat equation.
    Consequently $chi \( s \, X_s \)$ is a bounded martingale on $0 lt.eq s lt.eq q_0$.
    One can see this either from the heat semigroup or by choosing step approximations identically zero below
    $q_0$. Its second moment is nondecreasing, as is $Gamma' \( s \)$.
    But $Gamma \( q_0 \) = q_0$, $Gamma \( 0 \) = 0$, and $Gamma' \( q_0 \) lt.eq 1$.
    Thus the average of $Gamma'$ on this interval is $1$, whereas its maximum is at most $1$.
    Continuity forces $Gamma' equiv 1$ on $\[ 0 \, q_0 \]$.
  To contradict this constancy, observe that $chi \( q_0 \, dot.op \)$ is positive everywhere and cannot be
    constant: otherwise $u \( q_0 \, dot.op \)$ would have a positive constant derivative,
    contrary to $\| u \| lt.eq 1$. The function $chi \( q_0 \, dot.op \)$ is continuous,
    and $X_(q_0)$ is a nondegenerate Gaussian with full support.
    Therefore $"Var" \( chi \( q_0 \, X_(q_0) \) \) > 0$, while $chi \( 0 \, X_0 \)$ is deterministic.
    The martingale’s second moment strictly increases between these endpoints,
    which contradicts the constancy of $Gamma'$. Hence $q_0 = 0$.
    At this endpoint, $G$ has a minimum and symmetry gives $G' \( 0 \) = 0$.
    The one-sided second-derivative test then yields $Gamma' \( 0 \) lt.eq 1$.
  #strong[Stationarity with atoms included.] We have located the support and established $Gamma \( t \) =
    t$ on it. It remains to turn these support identities into an identity at every time.
    Use Equation (3.6), the terminal relation $chi \( 1 \, z \) = 1 - u \( 1 \, z \)^2$, and Equation (3.8) to write
  $ bb(E) chi \( s \, X_s \) = 1 - Gamma \( 1 \) + integral_s^1 alpha \( t \) Gamma' \( t \) thin upright(d) t . $
  Stieltjes integration by parts with the right-continuous $alpha$ gives the following formula,
    with every atom retained:
  $ integral_s^1 alpha \( t \) Gamma' \( t \) thin upright(d) t = Gamma \( 1 \) - alpha \( s \) Gamma \( s \) -
    integral_(\( s \, 1 \]) Gamma \( t \) thin mu \( thin upright(d) t \) . $
  In particular, the integral uses $\( s \, 1 \]$, while the endpoint term uses $alpha \( s \)$.
    Substituting $Gamma \( t \) = t$ on $"supp" mu$, including at zero, proves Equation (3.14).
    Fubini’s theorem gives the expression for $A$ in Equation (3.13).
    At $s = 0$ the stationarity identity becomes $chi \( 0 \, 0 \) = A \( 0 \)$.
    Finally, $Gamma' \( 0 \) = beta^2 chi \( 0 \, 0 \)^2 lt.eq 1$ proves Equation (3.16).
  Because $0 in "supp" mu$, each interval $\[ 0 \, s \]$ with $s > 0$ has positive $mu$-mass.
    Thus $A \( 0 \) - A \( h \) = integral_0^h alpha \( s \) thin upright(d) s > 0$ for every $h in \( 0 \, 1 \]$.
    The identity $d_(*) \( s \) = A \( s \) + s alpha \( s \)$, together with continuity of $A$ at zero,
    also gives $d_(*) \( 0 + \) = A \( 0 \)$. ◻
]

For $beta > 1$, the susceptibility bound excludes the measure $delta_0$.
  This makes the temperature derivative at a fixed minimizer strictly smaller than $beta \/ 2$.
  A finite-volume secant estimate transfers that strict inequality to the equilibrium energy.

#thm([Lemma 3.3.])[
  (Strict bound on the equilibrium energy).  #emph[For each fixed $beta > 1$, there are $e_0 =
    e_0 \( beta \) < beta \/ 2$ and $N = N \( beta \)$ such that
#[#set math.equation(numbering: n => "(3.17)")
 $ p'_n \( beta \) = 1 / n bb(E) pi_(n \, beta)^J \( H_n^J \) lt.eq e_0 wide \( n gt.eq N \) . $ <static-eq:energy-gap>]

]
] <static-lem:energy-gap>

#proof[
  Choose a minimizing measure $mu$ at the specified $beta$ and hold that measure fixed during the temperature
    variation. Combine Equations (3.10) and (3.14), and differentiate the penalty, to obtain
  #[#set math.equation(numbering: n => "(3.18)")
   $ frac(thin upright(d), thin upright(d) gamma) cal(P)_gamma \( mu \)\|_(gamma = beta) =
     beta integral_0^1 #scale(x: 120%, y: 120%)[\(] d_(*) \( s \) -
     s alpha \( s \) #scale(x: 120%, y: 120%)[\)] thin upright(d) s =
     beta integral_0^1 A \( s \) thin upright(d) s = beta /
     2 (1 - integral_0^1 t^2 thin mu \( thin upright(d) t \)) . $ <static-eq:fixed-minimizer-temperature-derivative>]
  The last equality follows from two applications of Fubini’s theorem.
    If $mu = delta_0$, then $A \( 0 \) = 1$, contradicting $beta A \( 0 \) lt.eq 1$ for $beta > 1$.
    The second moment of $mu$ is therefore positive. Denote the derivative in Equation (3.18) by $L$;
    we have proved $L < beta \/ 2$.
  Choose $e_0$ with $L < e_0 < beta \/ 2$. Then fix $epsilon > 0$ sufficiently small that
  $ frac(cal(P)_(beta + epsilon) \( mu \) - cal(P)_beta \( mu \), epsilon) < e_0 . $
  For every $n$, the finite-volume pressure is differentiable and convex in $beta$.
    Bound its derivative by the forward secant, use the scalar upper trial bound at $beta + epsilon$,
    and apply Theorem 6 at $beta$. This gives
  $ p'_n \( beta \) lt.eq frac(p_n \( beta + epsilon \) - p_n \( beta \), epsilon) lt.eq
    frac(cal(P)_(beta + epsilon) \( mu \) - P_beta, epsilon) + C_beta / epsilon n^(- 1 \/ 24) . $
  Since $cal(P)_beta \( mu \) = P_beta$, the fixed secant slope is strictly below $e_0$.
    Its strict margin absorbs the error once $n$ is sufficiently large.
    Finally, differentiate the finite partition sum and then take Gaussian expectation to obtain the energy
    identity in Equation (3.17). The integrable bound $max_(sigma in { - 1 \, 1 }^n) \|
    H_n^J \( sigma \) \|$ justifies this passage. The argument has varied only the temperature in the functional
    of one fixed measure; it requires no differentiability of $P_beta$ or of a choice of minimizer as a function
    of $beta$. ◻
]

== 4 Locking small overlaps across a large overlap <static-sec:locking>

When two configurations have a positive overlap bounded away from zero,
  we will show that their small overlaps with a third configuration are close, including their signs.
  This is the fixed-scale estimate used by the crossing construction.
  Spin reversal will then give the absolute-overlap version needed in Appendix 10.

Throughout the section, fix $beta > 1$ and a minimizer $mu$ of the scalar functional.
  We use the notation of Section 3 and write $pi = pi_(n \, beta)^J$. The scalar inputs are

#[#set math.equation(numbering: n => "(4.1)")
 $ 0 lt.eq chi lt.eq 1 \, wide \| u \| lt.eq 1 \, wide \| chi \( s \, z \) - chi \( s \, z' \) \| lt.eq
   C_beta \| z - z' \| \,\
bb(E) chi \( s \, X_s \) = A \( s \) + alpha \( s \) #scale(x: 120%, y: 120%)[\(] s -
  Gamma \( s \) #scale(x: 120%, y: 120%)[\)] \, wide bb(E) #scale(x: 120%, y: 120%)[\[] chi \( s \, X_s \) +
  alpha \( s \) u \( s \, X_s \)^2 #scale(x: 120%, y: 120%)[\]] = d_(*) \( s \) \,\
beta A \( 0 \) lt.eq 1 \, wide A \( h \) < A \( 0 \) quad \( 0 < h lt.eq 1 \) \, wide d_(*) \( s \) arrow.r
  A \( 0 \) quad \( s arrow.b 0 \) . $ <static-eq:locking-scalar-identities>]

We also use the scalar martingale evolution from Lemma 9 and the bounds $alpha \( s \) > 0$ for $s > 0$ and $0
  lt.eq d_(*) \( s \) lt.eq 1$ from Proposition 10.

For a nonempty Gram constraint $D$, write $Z_(d \, n) \( D \)$ for the unnormalized partition sum in (2.8).
  Thus $F_(d \, n) \( D \) = n^(- 1) bb(E) log Z_(d \, n) \( D \)$,
  and division by $Z_(n \, beta)^d$ gives the probability of $D$ under $d$ independent Gibbs draws.

#thm([Lemma 4.1.])[
  (Signed fixed-scale locking).  #emph[Let $e_(*) = 1 \/ 100$.
    For every fixed $h in \( 0 \, 1 \)$, there is $b > 0$ such that, for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E) pi^(⊗ 3) #h(-0.16667em)
   mat(delim: "{", R \( x \, y \) gt.eq h \, wide \| R \( v \, x \) \| \, \| R \( v \, y \) \| lt.eq b \,; \| R \(
   v \, x \) - R \( v \, y \) \| > 2 n^(- e_(*))) lt.eq e^(- n^(9 \/ 10)) . $ <eq:fixed-locking>]

 The same conclusion holds after decreasing $b$.]
] <lem:fixed-locking>

We will prove a pressure deficit for each forbidden overlap matrix and then sum probability bounds.
  The conversion below will also apply to the shrinking gaps in Section 7.

#thm([Lemma 4.2.])[
  (From a pressure gap to a probability bound).  #emph[Fix a replica number $d$.
    If a feasible overlap matrix $D$ satisfies
$ F_(d \, n) \( D \) lt.eq d P_beta - eta \, wide eta gt.eq 2 d C_beta n^(- 1 \/ 24) \, $

 where $C_beta$ is the constant in Theorem 6, then, for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) frac(Z_(d \, n) \( D \), Z_(n \, beta)^d) lt.eq exp \( - n eta \/ 4 \) +
   exp \( - c_(beta \, d) n eta^2 \) . $ <static-eq:pressure-gap-probability>]

 The constants are uniform over $D$ and over $n$-dependent gaps satisfying the displayed lower bound.]
] <lem:pressure-prob>

#proof[
  For fixed $d$, the derivative of $log Z_(d \, n) \( D \)$ with respect to any $J_(i j)$ has absolute value at
    most $beta d \/ sqrt(n)$. Both this function and $d log Z_(n \, beta)$ therefore have Gaussian Lipschitz
    constant at most $beta d sqrt(\( n - 1 \) \/ 2)$. Their difference
  $ T_D := log Z_(d \, n) \( D \) - d log Z_(n \, beta) $
  has Lipschitz constant at most $C_(beta \, d) sqrt(n)$ and satisfies $T_D lt.eq 0$,
    since $e^(T_D)$ is a Gibbs probability. Theorem 6 and the pressure-gap hypothesis give $bb(E) T_D lt.eq -
    n eta \/ 2$. Gaussian concentration bounds $bb(P) { T_D > -
    n eta \/ 4 }$ by $exp \( - c_(beta \, d) n eta^2 \)$. On its complement $e^(T_D) lt.eq e^(- n eta \/ 4)$,
    and on the event itself $e^(T_D) lt.eq 1$. Summing proves the claim.
    This calculation uses the original off-diagonal disorder,
    so no auxiliary diagonal Gaussian appears in the probability bound. ◻
]

Only $d = 2 \, 3$ will be needed. There are at most $\( n + 1 \)^(d \( d - 1 \) \/ 2)$ feasible overlap matrices,
  so a union over all constraints costs only a polynomial factor.

=== 4.1 A pair constraint <a-pair-constraint>

The three-replica comparison will use a large overlap $q$ for which $Gamma \( q \)$ is close to $q$.
  We first show that the remaining pair overlaps already have an exponentially small Gibbs probability.

#thm([Lemma 4.3.])[
  (Pair pressure bound).  #emph[For every nonempty pair constraint with overlap $q in \[ 0 \, 1 \]$,
#[#set math.equation(numbering: n => "(4.4)")
 $ F_(2 \, n) #h(-0.16667em) mat(delim: "(", 1, q; q, 1) lt.eq 2 P_beta - 1 /
   2 #scale(x: 120%, y: 120%)[\(] Gamma \( q \) - q #scale(x: 120%, y: 120%)[\)]^2 . $ <static-eq:pair-pressure>]

 Consequently, for every fixed $tau > 0$, the averaged Gibbs probability of pairs satisfying $\|
   Gamma \( \| R \( x \, y \) \| \) - \| R \( x \, y \) \| #scale(x: 120%, y: 120%)[\|] > tau$ is at most $C
   exp \( - c n \)$ for all large $n$.]
] <static-lem:pair-bound>

#proof[
  Use Proposition 5 with two coordinates sharing their covariance increments up to scalar time $q$ and receiving
    independent increments thereafter. Give the common increments masses $alpha \( s \) \/
    2$ and the independent increments masses $alpha \( s \)$. The endpoint is the prescribed Gram matrix.
  At zero terminal multiplier this path has recursive value $2 Phi \( 0 \, 0 \)$.
    Indeed, integrating the independent portion first leaves $Phi \( q \, z_x \) + Phi \( q \, z_y \)$.
    On the earlier common portion $z_x = z_y$; integration of twice a scalar value at mass $alpha \/
    2$ is twice the scalar integration at mass $alpha$. The penalty has the same factor two:
    before the split the squared norm is $4 s^2$ with mass $alpha \/ 2$,
    and after the split its varying part is $2 s^2$ with mass $alpha$.
  Now add $L s_x s_y$ to the terminal exponent and denote the recursive value by $Psi \( L \)$.
    In the matrix convention this sets $lambda_(x y) = lambda_(y x) = L \/ 2$, so $lambda : D = L q$.
    Differentiating at $L = 0$ transports the terminal observable $s_x
    s_y$ backwards by conditional expectation under the unperturbed tilted path.
    Given the common field at $q$, the two later branches are independent and each has conditional spin mean
    $u \( q \, X_q \)$. Hence
  $ Psi' \( 0 \) = bb(E) u \( q \, X_q \)^2 = Gamma \( q \) . $
  We also need the bound $Psi'' \( L \) lt.eq 1$ for every $L$.
    For a terminal observable $O in \[ - 1 \, 1 \]$, the terminal Hessian is its thermal variance.
    Backward integration at mass $m in \[ 0 \, 1 \]$ averages the existing Hessian and adds $m$ times the
    conditional variance of the gradient. Iterating this formula and using the total-variance decomposition bounds
    the result by $"Var" \( O \) lt.eq 1$ under the tilted path law.
    An outer quenched expectation preserves the bound. Taylor’s inequality therefore gives
  $ F_(2 \, n) \( q \) lt.eq 2 P_beta + L #scale(x: 120%, y: 120%)[\(] Gamma \( q \) -
    q #scale(x: 120%, y: 120%)[\)] + L^2 / 2 . $
  The choice $L = q - Gamma \( q \)$ yields (4.4).
  These computations are first made with step approximations of $alpha$ whose segment endpoints include $q$.
    Lemma 9 gives convergence of the scalar values, derivatives, and tilted transitions,
    so the inequality passes to the minimizing $alpha$.
  Finally, reversing one spin configuration preserves its Gibbs weight and changes the sign of its overlap.
    The same pressure estimate thus applies with the absolute overlap in place of $q$.
    There are at most $n + 1$ pair overlaps; summing (4.3) with the fixed deficit $tau^2 \/
    2$ proves the probability assertion. ◻
]

=== 4.2 A three-coordinate path with an asymmetric perturbation <static-subsec:locking-base>

Fix $q in \[ h \, 1 \]$ and a nonempty constraint

#[#set math.equation(numbering: n => "(4.5)")
 $ D = mat(delim: "(", 1, r + delta, r - delta; r + delta, 1, q; r - delta, q, 1) \, wide r gt.eq
   0 . $ <static-eq:locking-gram>]

We will choose upper bounds for $r$ and $\| delta \|$ depending only on $beta \, h$.
  Write $D_0$ for the same matrix with $delta = 0$. Starting from a hierarchy ending at $D_0$,
  we will add opposite field increments to the $x$ and $y$ coordinates.
  This realizes the desired first-order change in their overlaps with $v$.
  Keeping the increments positive semidefinite also adds a second-order covariance term.
  The free-endpoint matrix bound charges only its squared size, so that correction has a fourth-order cost.

The reason to perturb an early increment is the strict inequality $beta^2 A \( h \) A \( 0 \) < 1$,
  supplied by (4.1). At a small branching time $r$, the two scalar branches are nearly independent.
  Their susceptibility product is then bounded above by $A \( h \) A \( 0 \)$, up to small errors.
  The Gaussian variance part of the perturbation will cancel the corresponding penalty up to the pair deviation
  $q - Gamma \( q \)$; this strict product inequality controls what remains.

The base hierarchy itself is valid for every $0 lt.eq r lt.eq q lt.eq 1$;
  only the later perturbation will require $r$ to be small.
  We use the three-replica construction in Talagrand’s discussion following [18] Proposition 4.4,
  with masses divided by the size of each common block. Its three stages, in local scalar time $s$, are:

+ From $0$ to $r$, all three coordinates share each increment, integrated at mass $alpha \( s \) \/ 3$.
+ From $r$ to $q$, the coordinate $v$ follows an independent branch at mass $alpha \( s \)$, while $x \,
  y$ share a branch at mass $alpha \( s \) \/ 2$.
+ From $q$ to $1$, all three coordinates have independent increments at mass $alpha \( s \)$.

In the middle stage each branch has its own clock. If these clocks are $a$ for $v$ and $b$ for the common $x \,
  y$ branch, the current covariance is

$ Q \( a \, b \) = mat(delim: "(", a, r, r; r, b, b; r, b, b) \, wide r lt.eq a \, b lt.eq q . $

Thus one branch can advance while the other is held fixed.
  For a step function $alpha$, merge the two finite lists of increments in nondecreasing order of mass,
  retaining the order within each list. Each list is nondecreasing, so such a merge exists;
  ties may be ordered in either way consistent with the two local orders.
  The first-stage masses do not exceed either middle starting mass,
  and the middle masses do not exceed the starting mass of the last stage.
  Thus the entire schedule is a valid nondecreasing hierarchy.
  Insert a dummy initial covariance $Q_0 = 0$ to ensure that, even when $alpha \( 0 \) > 0$,
  the first genuine field increment has its prescribed positive mass and the quenched initial level has zero covariance.

The endpoint is $D_0$, and the recursive value minus the penalty equals $3 cal(P)_beta \( mu \)$.
  To check both assertions about the value, observe that a common block of size $ell$ has scalar value $ell Phi$.
  Its mass $alpha \/ ell$ gives the ordinary scalar tilted transition,
  and its squared-norm differential $ell^2 thin upright(d) \( s^2 \)$ contributes $ell$ times the scalar penalty
  after multiplication by that mass. Independent branches have additive values.
  When one branch is integrated, the value of a frozen branch is independent of that increment and passes
  unchanged through the logarithm. Applying these facts at each split proves the claimed value and penalty for
  every allowed interleaving. It also identifies the base tilted law.
  Denote the $v$ path and the shared $x \, y$ path by $X^v$ and $X^x$,
  and their common field at the first split by $X_r$. Write $K_(r \, z)$ for the scalar path law started at
  $\( r \, z \)$ and run to time $q$. If $cal(X)_0$ denotes the common prefix through $r$, then

#[#set math.equation(numbering: n => "(4.6)")
 $ cal(L) \( X_(\[ r \, q \])^v \, X_(\[ r \, q \])^x divides cal(X)_0 \) =
   K_(r \, X_r) ⊗ K_(r \, X_r) . $ <static-eq:locking-product-law>]

Indeed, the frozen branch cancels from each normalized kernel,
  while the factor three or two in the common-block value cancels the divided mass.
  The two future branches are therefore independent conditional on $X_r$, for every allowed merge.
  We will use this same base hierarchy in Section 7.

For the fixed-scale perturbation, now fix $0 < s_1 < s_2 < h$ and suppose $r < s_1$. Define

$ k \( s \) = frac(upright(bold(1))_(\[ s_1 \, s_2 \]) \( s \), s_2 - s_1) \, wide g \( s \) =
  integral_0^s k \( t \) thin upright(d) t \, wide G \( s \) = integral_0^s k \( t \)^2 thin upright(d) t \, wide
  K = G \( s_2 \) = frac(1, s_2 - s_1) . $

Let $L_(v x) = L_(x v) = 1$, $L_(v y) = L_(y v) = - 1$, with all other entries of $L$ zero.
  Let $L_2$ vanish outside its $\( x \, y \)$ block and give that block the value
  $mat(delim: "(", 1, - 1; - 1, 1)$. Then

$ \| L \|^2 = \| L_2 \|^2 = 4 \, wide L : L_2 = 0 . $

During each $v$-increment with local clock in $\[ s_1 \, s_2 \]$,
  add $delta k$ times that increment to $x$ and its negative to $y$.
  At the covariance level, this replaces $thin upright(d) s thin e_v e_v^(sans(T))$ by

$ thin upright(d) s thin #scale(x: 120%, y: 120%)[\(] e_v +
  delta k \( e_x - e_y \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] e_v +
  delta k \( e_x - e_y \) #scale(x: 120%, y: 120%)[\)]^(sans(T)) . $

This rank-one form is positive semidefinite. The accumulated change is $delta g L +
  delta^2 G L_2$ until the modification ends, and is then held fixed. The new endpoint is consequently

$ tilde(D) = D_0 + delta L + delta^2 K L_2 = D + delta^2 K L_2 . $

Apply Proposition 5 with zero terminal multiplier and this endpoint. Its mismatch contribution is

#[#set math.equation(numbering: n => "(4.7)")
 $ beta^2 / 4 \| D - tilde(D) \|^2 = beta^2 delta^4 K^2 . $ <static-eq:locking-mismatch>]

We next isolate the beneficial increase in the penalty. Along the base path, $Q : L = 0$.
  Also $Q : L_2 = 0$ until the split at $q$, by which time $g = 1$ and $G = K$.
  In the final stage, $Q : L_2 = 2 \( s - q \)$. Thus

$ \| tilde(Q) \|^2 - \| Q \|^2 = 4 delta^2 g^2 + 2 delta^2 G \( Q : L_2 \) + 4 delta^4 G^2 . $

The last term has nonnegative increments. The first changes only during the $v$-increments,
  whose masses are $alpha \( s \)$; the middle term changes only in the independent final stage.
  The penalty increase is therefore at least

#[#set math.equation(numbering: n => "(4.8)")
 $ beta^2 delta^2 (integral_0^1 alpha \( s \) thin upright(d) \( g \( s \)^2 \) + K A \( q \)) .
   $ <static-eq:locking-penalty>]

=== 4.3 The recursive value under the perturbation <the-recursive-value-under-the-perturbation>

To compare this penalty gain with the recursive value, first integrate out the unchanged independent final stage.
  Let $z$ be the common base field of $x \, y$ at the end of the middle stage,
  and let $Y$ be the sum of the raw $v$-increments weighted by $k$. The boundary value changes by

#[#set math.equation(numbering: n => "(4.9)")
 $ Delta = Phi \( q \, z + delta Y \) + Phi \( q \, z - delta Y \) -
   2 Phi \( q \, z \) . $ <static-eq:locking-boundary-increment>]

Convexity, the bound $chi lt.eq 1$, and its spatial Lipschitz bound yield

#[#set math.equation(numbering: n => "(4.10)")
 $ 0 lt.eq Delta lt.eq delta^2 Y^2 \, wide \| Delta - delta^2 chi \( q \, z \) Y^2 #scale(x: 120%, y: 120%)[\|]
   lt.eq C_beta \| delta Y \|^3 . $ <static-eq:locking-taylor>]

The remaining backward integrations are nonlinear, so a bound on the boundary change must be propagated through
  their normalized kernels. If the future value changes by $U$, an integration at positive mass $m$ changes by

$ 1 / m log bb(E)_(upright("base")) \[ e^(m U) divides upright("current prefix") \] \, $

where the expectation uses the unperturbed tilted kernel.
  At zero mass, the change is its conditional expectation of $U$.
  For $0 < m lt.eq 1$, Jensen’s inequality and the power-mean inequality put the displayed expression between
  $bb(E)_(upright("base")) \[ U divides upright("prefix") \]$ and $log
  bb(E)_(upright("base")) \[ e^U divides upright("prefix") \]$.

Here is the resulting induction explicitly. Let $K_i$ be the normalized base kernel at level $i$,
  and $U_i$ the difference of recursive values at that prefix.
  Taking the ratio of the two defining integrals gives $U_i = m_i^(- 1) log K_i e^(m_i U_(i + 1))$ for $m_i > 0$;
  this identity uses the base kernel only. Put

$ A_i = bb(E)_(upright("base")) \[ Delta divides upright("prefix ") i \] \, wide B_i =
  log bb(E)_(upright("base")) \[ e^Delta divides upright("prefix ") i \] . $

At the boundary these equal $U_i = Delta$. If $A_(i + 1) lt.eq U_(i + 1) lt.eq B_(i + 1)$,
  the kernel inequalities and tower property give

$ U_i gt.eq K_i U_(i + 1) gt.eq A_i \, wide U_i lt.eq log K_i e^(U_(i + 1)) lt.eq log K_i e^(B_(i + 1)) = B_i . $

Jensen’s inequality gives the same conclusions at zero mass. Applying this induction through the hierarchy proves

#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E)_(upright("base")) Delta med lt.eq med tilde(Psi) - Psi med lt.eq med
   log bb(E)_(upright("base")) e^Delta . $ <static-eq:locking-recursive-sandwich>]

Jensen’s inequality also preserves these bounds under an outer quenched expectation.

Under the base tilted law, take scalar diffusions $X^v \,
  X^x$ that agree through time $r$ and have independent Brownian noises thereafter. The identified path law gives

$ z = X_q^x \, wide Y = integral_(s_1)^(s_2) k \( s \) thin upright(d) X_s^v \, wide thin upright(d) X_s^v =
  beta thin upright(d) B_s^v + beta^2 alpha \( s \) u \( s \, X_s^v \) thin upright(d) s . $

Thus $Y$ is a centered Gaussian increment of variance $beta^2
  K$ plus a possibly dependent random term of absolute value at most $beta^2$.
  In particular, there are $c \, C > 0$, depending only on $beta \, s_1 \, s_2$, such that

#[#set math.equation(numbering: n => "(4.12)")
 $ bb(E)_(upright("base")) e^(c Y^2) lt.eq C . $ <static-eq:locking-Y-moment>]

This estimate is uniform in $q gt.eq h$, $r < s_1$, and the step approximations of $alpha$.
  For small enough $\| delta \|$, (4.10) and this exponential moment imply

$ bb(E) #scale(x: 120%, y: 120%)[\(] e^Delta - 1 - Delta #scale(x: 120%, y: 120%)[\)] lt.eq 1 /
  2 bb(E) #scale(x: 120%, y: 120%)[\[] Delta^2 e^Delta #scale(x: 120%, y: 120%)[\]] lt.eq C delta^4 . $

Combining with (4.11) bounds the recursive change by

#[#set math.equation(numbering: n => "(4.13)")
 $ tilde(Psi) - Psi lt.eq delta^2 bb(E) #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) Y^2
   #scale(x: 120%, y: 120%)[\]] + C \| delta \|^3 . $ <static-eq:locking-recursive-expansion>]

At this point all matrix paths can still be taken finite.
  Include $r \, q \, s_1 \, s_2$ in their segment endpoints and choose nondecreasing step approximations
  converging to $alpha$ in $L^1 \( \[ 0 \, 1 \] \)$. Lemma 9 gives convergence of the scalar values, derivatives,
  and diffusions. Couple the diffusions with the same Brownian noises, keeping the noises independent after $r$.
  The uniform exponential moment (4.12) then justifies passage to the limit in the expectation in (4.13).
  The penalty integrals converge as well: $thin upright(d) \( g^2 \) \/ thin upright(d)
  s$ is bounded and supported on $\[ s_1 \, s_2 \]$, and $A \( q \)$ is an integral of $alpha$.
  We have therefore applied the matrix comparison only to finite hierarchies and passed their upper bounds to the
  limit. No infinite hierarchy has been differentiated. In particular,
  convergence at a possible atom $q$ is unnecessary; only $L^1$ convergence of the masses is used.
  The minimizing identities will be applied after this limit.

Subtracting (4.8) from (4.13) and including the fourth-order cost (4.7) gives

#[#set math.equation(numbering: n => "(4.14)")
 $ F_(3 \, n) \( D \) lt.eq 3 P_beta + delta^2 cal(B) \( q \, r \) + C \| delta \|^3 \,\
cal(B) \( q \, r \) = bb(E) #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) Y^2 #scale(x: 120%, y: 120%)[\]] -
  beta^2 K A \( q \) - beta^2 integral_0^1 alpha \( s \) thin upright(d) \( g \( s \)^2 \) .
  $ <static-eq:locking-three-pressure-expansion>]

The task is now to choose the perturbation interval so that this quadratic coefficient is strictly negative.

=== 4.4 Choosing an interval with a strict quadratic gain <choosing-an-interval-with-a-strict-quadratic-gain>

The strict inequality $A \( h \) < A \( 0 \)$ will supply the gain. To expose it, define

$ V_t = chi \( t \, X_t^v \) + alpha \( t \) u \( t \, X_t^v \)^2 \, wide Y_s =
  integral_(s_1)^s k \( t \) thin upright(d) X_t^v quad \( s in \[ s_1 \, s_2 \] \) . $

The martingale identity $thin upright(d) u \( s \, X_s^v \) =
  beta chi \( s \, X_s^v \) thin upright(d) B_s^v$ and Itô’s formula,
  conditional on the common starting field $X_r$, give for almost every $s$

$ frac(thin upright(d), thin upright(d) s) bb(E) \[ Y_s u \( s \, X_s^v \) divides X_r \] =
  beta^2 k \( s \) bb(E) \[ V_s divides X_r \] . $

Since $Y_(s_1) = 0$, apply Itô’s formula once more to $Y_s^2$ and use conditional independence of the $v$ and $x$
  branches. This yields

#[#set math.equation(numbering: n => "(4.15)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) Y^2 #scale(x: 120%, y: 120%)[\]] =  & beta^2 K bb(E)
   chi \( q \, X_q \)\
 & + 2 beta^4 integral_(s_1)^(s_2) alpha \( s \) k \( s \) integral_(s_1)^s k \( t \) bb(E)
   #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) V_t #scale(x: 120%, y: 120%)[\]] thin upright(d) t thin
   upright(d) s . $ <static-eq:locking-Ito>]

All factors except $Y$ are bounded, and its required moments follow from (4.12).
  The conditioning and integrations are therefore justified.

Only the common field at the small time $r$ prevents the product expectation in this formula from factoring.
  Its effect is bounded by

#[#set math.equation(numbering: n => "(4.16)")
 $
   lr(|bb(E) #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) V_t #scale(x: 120%, y: 120%)[\]] - bb(E) chi \(
   q \, X_q \) thin d_(*) \( t \)|) lt.eq C_beta sqrt(r) \, wide s_1 lt.eq t lt.eq s_2 \, quad h lt.eq q lt.eq
   1 . $ <static-eq:locking-decoupling>]

To prove this estimate, restart the $x$ branch at an independent copy $X'_r$ of $X_r$,
  independent also of the whole $v$ branch, and retain its post-$r$ Brownian noise.
  The drift $beta^2 alpha u$ is uniformly Lipschitz in space,
  so the two $x$ solutions at time $q$ differ by at most $e^(beta^2) \| X_r - X'_r \|$.
  Use the spatial Lipschitz bound for $chi$, the bound $0 lt.eq V_t lt.eq 2$, and $bb(E) \| X_r - X'_r \| lt.eq
  C_beta sqrt(r)$, the latter following from the bounded drift.
  The replacement has the same marginal law and is independent of $V_t$; its expectation therefore factors,
  with $bb(E) V_t = d_(*) \( t \)$ by (4.1).

The two inequalities $beta A \( 0 \) lt.eq 1$ and $A \( h \) < A \( 0 \)$ imply

$ beta^2 A \( h \) A \( 0 \) < 1 . $

Choose $s_2 in \( 0 \, h \)$ and $gamma > 0$ small enough that

#[#set math.equation(numbering: n => "(4.17)")
 $ beta^2 A \( h \) sup_(0 < t lt.eq s_2) d_(*) \( t \) lt.eq 1 - 4 gamma \, $ <static-eq:locking-margin>]

and set $s_1 = s_2 \/ 2$. The functions $k \, g$ and the constant $K$ are now fixed. Also set

$ W = 2 beta^2 integral_(s_1)^(s_2) alpha \( s \) k \( s \) integral_(s_1)^s k \( t \) thin upright(d) t thin
  upright(d) s > 0 . $

The strict positivity follows from $alpha \( s \) > 0$ for every $s > 0$.

Let $macron(chi) \( q \) = bb(E) chi \( q \, X_q \)$. For $q gt.eq h$ with $\| q - Gamma \( q \) \| lt.eq tau$,
  the all-time scalar identity gives

$ macron(chi) \( q \) = A \( q \) + alpha \( q \) \( q - Gamma \( q \) \) lt.eq A \( h \) + tau . $

First choose $tau > 0$ small enough and then $r_0 in \( 0 \, s_1 \)$ small enough. Equations (4.16) and (4.17) give

#[#set math.equation(numbering: n => "(4.18)")
 $ beta^2 bb(E) #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) V_t #scale(x: 120%, y: 120%)[\]] - 1 lt.eq -
   2 gamma $ <static-eq:locking-negative-factor>]

uniformly for $q in \[ h \, 1 \]$ with $\| q - Gamma \( q \) \| lt.eq tau$, $0 lt.eq r lt.eq r_0$,
  and $t in \[ s_1 \, s_2 \]$. More explicitly, since $0 lt.eq d_(*) \( t \) lt.eq 1$,
  the left side is bounded above by $- 4 gamma + beta^2 tau + C_beta sqrt(r)$.

We can now compare the entire quadratic term with this strict margin.
  Using $thin upright(d) \( g^2 \) = 2 g k thin upright(d) s$, substitute (4.15) into (4.14).
  The result is the exact identity

#[#set math.equation(numbering: n => "(4.19)")
 $ cal(B) \( q \, r \) =  & beta^2 K alpha \( q \) #scale(x: 120%, y: 120%)[\(] q -
   Gamma \( q \) #scale(x: 120%, y: 120%)[\)]\
 & + 2 beta^2 integral_(s_1)^(s_2) alpha \( s \) k \( s \) integral_(s_1)^s k \( t \) {beta^2 bb(E)
   #scale(x: 120%, y: 120%)[\[] chi \( q \, X_q^x \) V_t #scale(x: 120%, y: 120%)[\]] -
   1} thin upright(d) t thin upright(d) s . $ <static-eq:locking-bracket>]

Decrease $tau$ further until $beta^2 K tau lt.eq gamma W$.
  The first term in (4.19) is then at most $gamma W$, and (4.18) bounds the double integral by $- 2 gamma W$. Hence

$ cal(B) \( q \, r \) lt.eq gamma W - 2 gamma W = - gamma W . $

The cubic remainder in (4.14) is uniform over these $q \, r$. Choose $delta_0 > 0$ small enough to absorb it.
  For some $c_0 > 0$ we have obtained

#[#set math.equation(numbering: n => "(4.20)")
 $ F_(3 \, n) \( D \) lt.eq 3 P_beta - c_0 delta^2 $ <static-eq:locking-three-gap>]

whenever the constraint is nonempty, $0 lt.eq r lt.eq r_0$, $\| delta \| lt.eq delta_0$, $q in \[ h \, 1 \]$,
  and $\| q - Gamma \( q \) \| lt.eq tau$. In particular, this estimate places no restriction $r gt.eq \|
  delta \|$ on the two small signed overlaps.

=== 4.5 From the pressure gap to locking <from-the-pressure-gap-to-locking>

#proof[
  Choose $b lt.eq min \( r_0 \, delta_0 \)$. For a triple in (4.2), set $q = R \( x \, y \) gt.eq
    h$ and reverse $v$ if necessary to make
  $ r = frac(R \( v \, x \) + R \( v \, y \), 2) gt.eq 0 \, wide delta = frac(R \( v \, x \) - R \( v \, y \), 2) . $
  This reversal preserves the Gibbs weight, the large overlap $q$, and $\| delta \|$.
    The event gives $r \, \| delta \| lt.eq b$ and $\| delta \| > n^(- e_(*))$.
    In particular, we do not need the two small overlaps to have the same sign.
  Lemma 14 bounds pairs with $\| q - Gamma \( q \) \| > tau$ by $C exp \( - c n \)$ in averaged probability.
    Adding an independent Gibbs draw does not change that bound.
    For every remaining feasible triple, (4.20) gives a pressure deficit $eta = c_0 delta^2 gt.eq
    c_0 n^(- 2 e_(*))$. Since $2 e_(*) = 1 \/ 50 < 1 \/ 24$, this dominates the finite-size error in Lemma 13,
    uniformly over the constraints. Their averaged probabilities are bounded by
  $ exp \( - c n^(49 \/ 50) \) + exp \( - c n^(24 \/ 25) \) . $
  There are at most $\( n + 1 \)^3$ overlap triples and two choices of the reversal.
    The resulting bound is at most $C \( n + 1 \)^3 exp \( - c n^(24 \/ 25) \)$,
    which is smaller than $exp \( - n^(9 \/ 10) \)$ for all sufficiently large $n$. ◻
]

#thm([Proposition 4.4.])[
  (Absolute-overlap locking).  #emph[For every fixed $h in \( 0 \, 1 \)$ there is $b > 0$ such that,
    for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(4.21)")
 $ bb(E) pi^(⊗ 3) #h(-0.16667em)
   mat(delim: "{", \| R \( x \, y \) \| gt.eq h \, wide \| R \( v \, x \) \| \, \| R \( v \, y \) \| lt.eq
   b \,; \| \| R \( v \, x \) \| - \| R \( v \, y \) \| #scale(x: 120%, y: 120%)[\|] > 2 n^(- 1 \/ 100)) lt.eq
   exp \( - n^(9 \/ 10) \) . $ <static-eq:locking-probability>]

 The same conclusion holds after decreasing $b$.]
] <static-prop:locking>

#proof[
  Take $b$ from Lemma 12. Reverse $y$ if needed to make $R \( x \, y \) gt.eq h$.
    This preserves the Gibbs weight and all absolute overlaps in the event. The inequality
  $ \| \| R \( v \, x \) \| - \| R \( v \, y \) \| #scale(x: 120%, y: 120%)[\|] lt.eq \| R \( v \, x \) -
    R \( v \, y \) \| $
  then puts the transformed triple in the signed event. The two possible reversals multiply its probability bound
    by at most two. The stronger bound $C \( n + 1 \)^3 exp \( - c n^(24 \/ 25) \)$ obtained in the preceding
    proof absorbs this factor and gives the claimed exponent. ◻
]

== 5 Energy and disorder rotation <sec:energy>

The strict energy gap from Lemma 11 will force overlap coverage on both stretched-exponential and polynomial mass
  scales. This section supplies the two estimates behind that implication.
  We first bound the upper tail of the energy of a Gibbs sample,
  then bound the change of the partition function under a Gaussian rotation.
  We work with the off-diagonal Hamiltonian of Equation (1.1) throughout;
  the auxiliary diagonal variables used for interpolation are absent.
  Write $H^J = H_n^J$, $Z^J = Z_(n \, beta)^J$ and $pi^J = pi_(n \, beta)^J$.
  All disorder vectors in this section are indexed by $i < j$.

#thm([Lemma 5.1.])[
  (An upper energy tail).  #emph[There are constants $e_1 in \( 0 \, beta \/ 2 \)$ and $c_E > 0$ such that,
    for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(P)_J #h(-0.16667em) (pi^J { H^J > n e_1 } > e^(- c_E n)) lt.eq e^(- c_E n) . $ <static-eq:coverage-energy-good>]

]
] <static-lem:coverage-energy>

#proof[
  The proof separates concentration from the location of the mean.
    Lemma 11 gives $e_0 < beta \/ 2$ with $p'_n \( beta \) lt.eq e_0$ once $n$ is sufficiently large.
    Choose $e_1 in \( max { 0 \, e_0 } \, beta \/ 2 \)$ and put $c_E = \( e_1 - e_0 \)^2 \/ 2$.
  Sample the disorder $J$ and subsequently a configuration $V tilde.op pi^J$. Fix $v in { - 1 \, 1 }^n$.
    Bayes’ formula expresses the conditional disorder density given $V = v$ as proportional to
  $ exp #h(-0.16667em) {- frac(\| J \|^2, 2) + beta H^J \( v \) - log Z^J} . $
  The log partition function is convex in the disorder. The negative log-density therefore has Hessian $I +
    nabla^2 log Z^J succ.curly.eq I$. Adding a linear tilt $s H^J \( v \)$, for any $s in bb(R)$,
    leaves that lower Hessian bound unchanged. Write $H^J \( v \) = h_v dot.op J$, where
  $ \| h_v \|^2 = 1 / n sum_(i < j) v_i^2 v_j^2 = frac(n - 1, 2) . $
  If $phi_v \( s \) = log bb(E) \[ e^(s H^J \( v \)) divides V = v \]$,
    differentiation under the linearly tilted conditional law and the Brascamp–Lieb bound from Lemma 3 give
  $ phi''_v \( s \) = "Var"_(v \, s) \( H^J \( v \) \) lt.eq frac(n - 1, 2) \, wide s in bb(R) . $
  Strong convexity ensures integrability under every tilt used here.
    Two integrations of the variance bound, subtracting the conditional mean, give
  #[#set math.equation(numbering: n => "(5.2)")
   $ bb(E) #h(-0.16667em) [e^(s \( H^J \( v \) - bb(E) \[ H^J \( v \) divides V = v \] \)) divides V = v] lt.eq
     exp #h(-0.16667em) {frac(s^2 \( n - 1 \), 4)} . $ <static-eq:coverage-posterior-mgf>]
  To identify that conditional mean, use the gauge transformation $J_(i j) mapsto J_(i j) v_i v_j$,
    which preserves the Gaussian law, preserves $Z^J$, and carries $H^J \( v \)$ to $H^J \( bold(+) \)$,
    where $bold(+) = \( 1 \, dots.h \, 1 \)$. More generally,
    these transformations act transitively on the configurations.
    Thus $V$ has a uniform marginal under the joint law, and $bb(E) \[ H^J \( v \) divides V = v \]$ has the same
    value for every $v$. Its average over $V$ is
  $ bb(E) pi^J \( H^J \) = n p'_n \( beta \) . $
  Differentiating the finite-volume pressure gives this identity;
    Gaussian integrability permits interchange with expectation.
    The conditional mean is therefore at most $n e_0$. Chernoff’s inequality in (5.2), followed by averaging, yields
  $ bb(E)_J pi^J { H^J > n e_1 } lt.eq exp #h(-0.16667em) {- frac(n^2 \( e_1 - e_0 \)^2, n - 1)} lt.eq e^(- 2 c_E n) . $
  Finally, Markov’s inequality turns this averaged Gibbs bound into the disorder estimate (5.1). ◻
]

#thm([Lemma 5.2.])[
  (A disorder rotation estimate).  #emph[Let $J \, G$ be independent standard Gaussian vectors and,
    for $theta in \( 0 \, pi \/ 2 \)$, set $J_theta = cos theta J + sin theta G$. Then for every $lambda in bb(R)$,
#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E) exp #h(-0.16667em) {lambda \( log Z^(J_theta) - log Z^J \)} lt.eq
   exp #h(-0.16667em) {frac(lambda^2 theta^2 beta^2 \( n - 1 \), 4)} . $ <static-eq:coverage-rotation-mgf>]

 In particular, for every $u > 0$,
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(P) #h(-0.16667em) (log Z^(J_theta) - log Z^J gt.eq u) lt.eq exp #h(-0.16667em) {-
   frac(u^2, theta^2 beta^2 \( n - 1 \))} . $ <static-eq:coverage-rotation-tail>]

]
] <static-lem:coverage-rotation>

#proof[
  We interpolate by rotation through independent Gaussian directions. First put $F \( J \) = log Z^J$.
    The coordinate derivative $partial_(J_(i j)) F = beta n^(- 1 \/ 2) pi^J \( sigma_i sigma_j \)$ gives
  $ \| nabla F \( J \) \|^2 lt.eq frac(beta^2 \( n - 1 \), 2) = : L_F^2 . $
  For $0 lt.eq s lt.eq theta$, let $J_s = cos s J + sin s G$ and $K_s = - sin s J + cos s G$.
    At a fixed $s$, orthogonal invariance makes $J_s$ and $K_s$ independent standard Gaussian vectors.
    Differentiation along the rotation gives
  $ F \( J_theta \) - F \( J \) = integral_0^theta nabla F \( J_s \) dot.op K_s thin thin upright(d) s . $
  Apply Jensen’s inequality to the uniform measure on $\[ 0 \, theta \]$.
    Inside the resulting integral, condition on $J_s$ and integrate the independent Gaussian $K_s$:
  $ bb(E) e^(lambda \( F \( J_theta \) - F \( J \) \)) & lt.eq 1 /
    theta integral_0^theta bb(E) e^(lambda theta nabla F \( J_s \) dot.op K_s) thin thin upright(d) s\
 & lt.eq 1 / theta integral_0^theta e^(lambda^2 theta^2 L_F^2 \/ 2) thin thin upright(d) s =
   e^(lambda^2 theta^2 L_F^2 \/ 2) . $
  This is (5.3). Exponential Markov and optimization over $lambda > 0$ prove the tail bound.
    The argument holds for every permitted angle, so it also applies to angles depending on $n$. ◻
]

For coverage we parametrize the rotation by the variance of its fresh disorder component.
  If $0 < t < 1 \/ 2$ and $J' = sqrt(1 - t) thin J + sqrt(t) thin G$, take $theta = arcsin sqrt(t)$.
  Since $theta^2 lt.eq 2 t$, the preceding lemma gives, for every $z > 0$,

#[#set math.equation(numbering: n => "(5.5)")
 $ bb(P) { log Z^(J') - log Z^J gt.eq z } lt.eq exp #h(-0.16667em) (- c_beta frac(z^2, n t)) \, wide c_beta =
   frac(1, 2 beta^2) . $ <eq:rotation-tail>]

This estimate is uniform in $t$, including rotations whose variance decreases with $n$.

== 6 Coverage at stretched-exponential scales <sec:coverage>

The energy and rotation estimates now supply references for the dynamical construction.
  Given a target $x$ in a subset $S$ of the cube, we seek a reference $z in S$ with $\| R \( x \, z \) \| gt.eq
  q_(*)$ among independent Gibbs samples. The required estimate has two parts:
  a small total Gibbs mass of targets may be excluded, and every remaining target must have a neighborhood of
  sufficient Gibbs mass. Both masses are measured by the original Gibbs law, without conditioning on $S$.
  Thus the neighborhood mass is the success probability of one sample from a reference bank.

We prove the estimate with both mass bounds on the scale $L = n^kappa$.
  If a set has too few overlapping pairs, fresh Gaussian disorder produces a gain in its restricted partition sum.
  The energy upper tail limits the loss from decreasing the original disorder,
  leaving a net increase that the rotation estimate makes unlikely.
  To make this argument uniform over all subsets, we select a violating set using the original disorder before
  sampling the perturbation.

#thm([Proposition 6.1.])[
  (Stretched-exponential coverage).  #emph[There exists $q_(*) in \( 0 \, 1 \)$,
    depending only on the fixed inverse temperature $beta > 1$, with the following property.
    For each fixed $D_1 > 0$, there exists a fixed $D_3 = D_3 \( beta \, D_1 \) >
    0$ and a sequence of events $cal(C)_n \( D_1 \)$, measurable with respect to the disorder,
    such that $bb(P)_J \( cal(C)_n \( D_1 \) \) arrow.r 1$ and, on $cal(C)_n \( D_1 \)$,
#[#set math.equation(numbering: n => "(6.1)")
 $ pi^J #h(-0.16667em) ({x in S : pi^J { z in S : \| R \( x \, z \) \| gt.eq q_(*) } < e^(- D_3 L)}) < e^(- D_1 L)
   wide upright("for every ") S subset { - 1 \, 1 }^n . $ <eq:coverage>]

]
] <prop:coverage>

#proof[
  We first control conditional pair mass and then pass to individual targets.
    Let $e_1 in \( 0 \, beta \/ 2 \)$ and $c_E > 0$ be given by Lemma 16, and define
  $ cal(E)_n = {pi^J { x : H^J \( x \) > n e_1 } lt.eq e^(- c_E n)} . $
  Thus $bb(P)_J \( cal(E)_n \) arrow.r 1$. Define
  $ g = beta^2 / 4 - frac(beta e_1, 2) > 0 \, wide 0 < q_(*) < 1 \, wide beta^2 q_(*) < g / 8 . $
  Fix this threshold once for both the present proposition and Appendix 9; the choice precedes $D_1$.
    Given $D_1 > 0$, choose fixed constants
  #[#set math.equation(numbering: n => "(6.2)")
   $ M > frac(8 \( D_1 + 1 \), g) \, wide D_2 > frac(beta^2 M, 2) + 1 \, wide t =
     frac(M L, n) . $ <eq:coverage-parameters>]
  For all sufficiently large $n$, we have $0 < t < 1 \/ 2$; moreover, $t arrow.r 0$ and $n t = M L arrow.r oo$.
  #strong[Pair mass in every sufficiently large set.] Our first claim is that, with disorder probability tending to one,
  #[#set math.equation(numbering: n => "(6.3)")
   $ #scale(x: 120%, y: 120%)[\(] pi^J \( thin dot.op divides S \) #scale(x: 120%, y: 120%)[\)]^(⊗ 2) { \|
     R \( x \, y \) \| gt.eq q_(*) } gt.eq e^(- D_2 L) quad upright("for every ") S subset { - 1 \,
     1 }^n upright(" with ") pi^J \( S \) gt.eq e^(- D_1 L) . $ <eq:coverage-pair>]
  Write $cal(V)_n$ for the failure event. Order the subsets of ${ - 1 \, 1 }^n$ deterministically and,
    for $J in cal(E)_n ∩ cal(V)_n$, select the first violating member $S \( J \)$.
    The Gibbs quantities for each fixed subset are measurable in $J$, so the selection is measurable.
    Once we condition on $J$, the chosen set is fixed and cannot depend on the independent disorder used later.
  Fix such a disorder, write $pi = pi^J$, and remove the upper-energy tail from the selected set:
  $ T = S ∩ { x : H^J \( x \) lt.eq n e_1 } \, wide nu = pi \( thin dot.op divides T \) . $
  Since $L = o \( n \)$, for all sufficiently large $n$,
  $ e^(- c_E n) lt.eq 1 / 2 e^(- D_1 L) \, wide pi \( T \) gt.eq 1 / 2 pi \( S \) gt.eq 1 / 2 e^(- D_1 L) . $
  The retained mass is at least half the original mass. Comparing the conditional pair laws gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ nu^(⊗ 2) { \| R \( x \, y \) \| gt.eq q_(*) } lt.eq (frac(pi \( S \), pi \( T \)))^2
     #scale(x: 120%, y: 120%)[\(] pi \( thin dot.op divides S \) #scale(x: 120%, y: 120%)[\)]^(⊗ 2) { \|
     R \( x \, y \) \| gt.eq q_(*) } < 4 e^(- D_2 L) . $ <eq:coverage-trimming>]
  #strong[Gain from independent disorder.] Sample an independent Gaussian disorder $G$ and set
  $ W = nu #h(-0.16667em) (e^(beta sqrt(t) H^G)) \, wide J' = sqrt(1 - t) thin J + sqrt(t) thin G . $
  The subscript $G$ means that the original disorder and its selected set are held fixed.
    The off-diagonal normalization gives
  $ bb(E)_G H^G \( x \)^2 = frac(n - 1, 2) \, wide bb(E)_G \[ H^G \( x \) H^G \( y \) \] =
    frac(n R \( x \, y \)^2 - 1, 2) . $
  The Gaussian exponential moment formula consequently yields
  #[#set math.equation(numbering: n => "(6.5)")
   $ bb(E)_G W & = e^(beta^2 t \( n - 1 \) \/ 4) \,\
frac(bb(E)_G W^2, \( bb(E)_G W \)^2) & = nu^(⊗ 2) #h(-0.16667em) (e^(beta^2 t \( n R \( x \, y \)^2 - 1 \) \/ 2))\
 & lt.eq e^(beta^2 n t q_(*)^2 \/ 2) + 4 e^(\( beta^2 M \/ 2 - D_2 \) L) lt.eq
   2 e^(beta^2 n t q_(*)^2 \/ 2) $ <eq:coverage-moments>]
  for all sufficiently large $n$. Split the pair sum at $\| R \( x \, y \) \| = q_(*)$.
    On the large-overlap part use (6.4), then the choice of $D_2$ in (6.2). Paley–Zygmund consequently yields
  #[#set math.equation(numbering: n => "(6.6)")
   $ bb(P)_G #h(-0.16667em) (W gt.eq 1 / 2 bb(E)_G W) gt.eq 1 / 8 e^(- A_0) \, wide A_0 =
     frac(beta^2 n t q_(*)^2, 2) . $ <eq:coverage-pz>]
  Concentration raises this lower probability to one half after a controlled loss in the threshold.
    For $f \( G \) = log W$, differentiation gives
  $ lr(|frac(partial f, partial G_(i j))|) lt.eq beta sqrt(t / n) \, wide
    lr(bar.v.double nabla f bar.v.double)_2^2 lt.eq frac(beta^2 t \( n - 1 \), 2) = : sigma^2 . $
  Thus Gaussian concentration applies to $f$ with Lipschitz constant at most $sigma$. Write
  $ a = frac(beta^2 t \( n - 1 \), 4) - log 2 \, wide overline(f) = bb(E)_G f . $
  When $a > overline(f)$, compare the upper concentration tail with (6.6):
  $ 1 / 8 e^(- A_0) lt.eq bb(P)_G \( f gt.eq a \) lt.eq exp #h(-0.16667em)
    (- frac(\( a - overline(f) \)^2, 2 sigma^2)) \, $
  so $overline(f) gt.eq a - sigma sqrt(2 \( A_0 + log 8 \))$.
    If $a lt.eq overline(f)$, the same lower bound holds immediately. In either case the lower concentration tail yields
  $ bb(P)_G #h(-0.16667em) (f gt.eq a - sigma sqrt(2 \( A_0 + log 8 \)) - sigma sqrt(2 log 2)) gt.eq 1 / 2 . $
  Since $sigma lt.eq beta sqrt(n t \/ 2)$, we have
  $ sigma sqrt(2 \( A_0 + log 8 \)) + sigma sqrt(2 log 2) lt.eq frac(beta^2 n t q_(*), sqrt(2)) +
    C_beta sqrt(n t) lt.eq beta^2 n t q_(*) + C_beta sqrt(n t) . $
  Consequently, with conditional probability at least one half,
  #[#set math.equation(numbering: n => "(6.7)")
   $ log W gt.eq frac(beta^2 t \( n - 1 \), 4) - beta^2 n t q_(*) - C_beta sqrt(n t) - log 2 . $ <eq:coverage-logw>]
  The constants and the large-$n$ threshold are independent of the selected disorder and its violating set.
  #strong[Comparison with the rotation cost.] The gain from $G$ must be compared with the change in the original
    energy. Linearity in the disorder gives
  $ Z^(J') / Z^J & = pi #h(-0.16667em) (e^(beta \( sqrt(1 - t) - 1 \) H^J + beta sqrt(t) H^G))\
 & gt.eq pi \( T \) e^(- beta n e_1 \( 1 - sqrt(1 - t) \)) W . $
  On $T$, the original energy is at most $n e_1$. Its negative coefficient $sqrt(1 - t) -
    1$ gives the last lower bound. Combining this with (6.7), we obtain
  $ log Z^(J') / Z^J & gt.eq - D_1 L - log 2 - beta n e_1 \( 1 - sqrt(1 - t) \) + log W\
 & gt.eq \( g - beta^2 q_(*) \) n t - D_1 L - C_beta sqrt(n t) - C_beta \( n t^2 + 1 \) . $
  Here we used $1 - sqrt(1 - t) = t \/ 2 + O \( t^2 \)$, uniformly for $0 < t < 1 \/ 2$.
    Dividing the final lower bound by $n t$, its limit inferior is at least
  $ g - beta^2 q_(*) - D_1 / M > frac(3 g, 4) . $
  It follows that, for all sufficiently large $n$ and every $J in cal(E)_n ∩ cal(V)_n$,
  #[#set math.equation(numbering: n => "(6.8)")
   $ bb(P)_G #h(-0.16667em) (log Z^(J') - log Z^J gt.eq g / 2 n t) gt.eq 1 / 2 . $ <eq:coverage-gain>]
  Average the conditional gain over $J$ and use the unconditional rotation bound (5.5):
  $ bb(P)_J \( cal(E)_n ∩ cal(V)_n \) & lt.eq 2 bb(P)_(J \, G) #h(-0.16667em) (log Z^(J') - log Z^J gt.eq g / 2 n t)\
 & lt.eq 2 e^(- c'_beta n t) = 2 e^(- c'_beta M L) arrow.r 0 $
  for a fixed $c'_beta > 0$. Adding $bb(P)_J \( cal(E)_n^c \) = o \( 1 \)$ proves $bb(P)_J \( cal(V)_n \) =
    o \( 1 \)$, and hence the simultaneous pair statement in Equation (6.3).
    Since $cal(V)_n$ is the event that any violating subset exists, this proves the simultaneous claim.
    No union bound over subsets is needed.
  #strong[From pairs to individual targets.] Choose a fixed $D_3 > D_1 + D_2$, and set $cal(C)_n \( D_1 \) =
    cal(V)_n^c$. Fix $J$ in this event and any $S subset { - 1 \, 1 }^n$, and let
  $ B = { x in S : pi^J { z in S : \| R \( x \, z \) \| gt.eq q_(*) } < e^(- D_3 L) } . $
  Suppose that $pi^J \( B \) gt.eq e^(- D_1 L)$. Since $B subset S$,
  $ #scale(x: 120%, y: 120%)[\(] pi^J \( thin dot.op divides B \) #scale(x: 120%, y: 120%)[\)]^(⊗ 2) { \|
    R \( x \, y \) \| gt.eq q_(*) } & = frac(1, pi^J \( B \)^2) sum_(x in B) pi^J \( x \) pi^J { y in B : \|
    R \( x \, y \) \| gt.eq q_(*) }\
 & < frac(e^(- D_3 L), pi^J \( B \)) lt.eq e^(- \( D_3 - D_1 \) L) < e^(- D_2 L) . $
  The set $B$ itself satisfies the mass hypothesis of (6.3), so this is a contradiction.
    Thus $pi^J \( B \) < e^(- D_1 L)$ for every $S$, proving the target-wise statement. ◻
]

== 7 Locking on a narrow annulus <sec:narrow>

Lemma 12 applies when one pair overlap exceeds a fixed positive cutoff and the other two are close to zero.
  The path argument also needs a different regime: the latter overlaps are near a positive level $r$,
  while the first overlap exceeds $r$ by an amount that may tend to zero.
  We obtain a uniform pressure loss for that regime. Fix a minimizing measure $mu$ and use its scalar data from
  Section 3. Recall $Gamma \( s \) = bb(E) u \( s \, X_s \)^2$, and write $chi_s = chi \( s \, X_s \)$.
  We work in the case where $Gamma \( s \) = s$ on a fixed interval; if the identity fails there,
  the pair pressure gap supplies the forbidden interval used in Section 8.

Fix $t_0 > 0$ with $3 t_0 < q_(*)$, where $q_(*)$ is the constant in Proposition 18.
  Recall $rho = n^(- kappa)$ with $kappa = 1 \/ 10000$, and set

#[#set math.equation(numbering: n => "(7.1)")
 $ h = rho^8 \, wide epsilon = rho^20 . $ <eq:narrow-scales>]

Constants below may depend on $beta \, t_0$ and the fixed minimizing measure.
  They do not depend on $n$ or on the overlap parameters.

The comparison will alter the fields by a contrast on the two sides of a branching time,
  together with a short increment on the other branch. When the surrounding interval has small Parisi mass,
  a tent integration by parts shows that the contrast contributes little beyond its Gaussian variance.
  The mixed term with the other branch then provides the strict pressure loss.

#thm([Lemma 7.1.])[
  (Narrow-annulus locking).  #emph[Suppose that
#[#set math.equation(numbering: n => "(7.2)")
 $ Gamma \( s \) = s wide upright("for ") t_0 \/ 2 < s < 3 t_0 . $ <eq:narrow-identity>]

 For three independent Gibbs configurations $v \, x \, y$, conditionally on the disorder, define
$ q = R \( x \, y \) \, wide r = frac(R \( v \, x \) + R \( v \, y \), 2) \, wide delta =
  frac(R \( v \, x \) - R \( v \, y \), 2) . $

 Then, for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(7.3)")
 $ bb(E) pi^(⊗ 3)
   mat(delim: "{", t_0 \/ 2 < r < 3 t_0 \, quad mu \( \[ r - h \, r + h \] \) lt.eq rho^4 \,; q gt.eq r + rho \,
   quad epsilon lt.eq \| delta \| lt.eq 2 epsilon) lt.eq exp \( - n^(4 \/ 5) \) . $ <eq:narrow-locking-probability>]

]
] <lem:narrow-locking>

#proof[
  Fix a feasible overlap matrix, in the coordinate order $v \, x \, y$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ D = mat(delim: "(", 1, r + delta, r - delta; r + delta, 1, q; r - delta, q, 1) \, $ <eq:narrow-overlap-matrix>]
  satisfying the event in (7.3). We may first impose the additional restriction
  #[#set math.equation(numbering: n => "(7.5)")
   $ \| q - Gamma \( q \) \| lt.eq rho^13 . $ <eq:narrow-pair-deviation>]
  For an excluded pair overlap, (4.4) already gives a pressure deficit of at least $rho^26 \/ 2$.
    At the end of the proof we will apply Lemma 13 to these deficits and sum over the at most $n +
    1$ pair overlaps. The independent third draw does not change their total probability.
  For the minimizing scalar data, the source of the strict loss is already visible.
    The identity $Gamma' \( r \) = 1$ normalizes $beta^2 bb(E) chi_r^2$ to one,
    whereas the conditional susceptibility evolution decreases the mixed moment:
  $ beta^2 bb(E) \[ chi_q chi_r \] lt.eq 1 - c \( q - r \) . $
  Step 8 will verify a uniform $c > 0$. We construct a covariance perturbation whose quadratic pressure change
    contains this deficit. Its much larger Gaussian variance contribution will cancel against the interpolation penalty.
  The proof of the three-replica deficit has three stages. In Steps 1–4 we construct an admissible perturbed
    hierarchy and reduce the comparison to one quadratic moment.
    Steps 5–6 estimate that moment using the tent on the first branch and a ramp on the second.
    In Steps 7–9 we pass from finite hierarchies to the minimizing scalar data,
    establish the negative quadratic coefficient, and sum the resulting probability bounds.
  #strong[Step 1. Finite scalar data and the base hierarchy.] For all large $n$, the overlap restrictions imply
  $ 0 < r - h < r < r + h < q lt.eq 1 . $
  Take increasingly fine partitions of $\[ 0 \, 1 \]$ containing $r - h \, r \, r + h \, q$.
    On each half-open segment, approximate $alpha$ by its actual value at the left endpoint,
    and set its value at $1$ to $1$. These approximations are nondecreasing step distribution functions.
    They converge in $L^1$ and preserve the actual endpoint values at the four indicated points.
    In particular, each satisfies
  #[#set math.equation(numbering: n => "(7.6)")
   $ alpha \( r + h \) - alpha \( r - h \) lt.eq rho^4 . $ <eq:narrow-step-oscillation>]
  During the finite calculations, we omit the approximation index:
    $alpha \, Phi \, u \, chi \, X \, A$ mean the step data, and $cal(P)_beta \( alpha \)$ is the scalar
    functional of the corresponding measure. These step measures need not minimize the functional.
    We will use stationarity only after passing to the minimizing limit.
  We index only the integrated covariance increments: $Q_0 = 0$, $Q_ell - Q_(ell - 1) succ.curly.eq 0$,
    with nondecreasing masses $m_ell in \[ 0 \, 1 \]$ and field covariances $beta^2 \( Q_ell - Q_(ell - 1) \)$.
    For this indexing write
  $ Q_(upright("end")) = Q_N \, wide integral m thin thin upright(d) \| Q \|^2 =
    sum_(ell = 1)^N m_ell \( \| Q_ell \|^2 - \| Q_(ell - 1) \|^2 \) . $
  Prepending a zero-covariance quenched level gives precisely the convention of Proposition 5.
    We always use zero terminal multiplier, so the terminal function is the sum of the three scalar
    $log \( 2 cosh \)$ functions.
  Build the base covariance path $Q$ in three stages:
  + From scalar time $0$ to $r$, give all three fields the same increment of variance $beta^2 thin thin upright(d)
    s$, integrated at mass $alpha \( s \) \/ 3$.
  + From $r$ to $q$, give $v$ its own scalar branch at mass $alpha \( s \)$ and give $x \,
    y$ a common scalar branch at mass $alpha \( s \) \/ 2$. The branches use independent Gaussian increments.
    Merge their finite schedules in nondecreasing mass order, preserving each branch’s local order.
  + From $q$ to $1$, give the three coordinates independent scalar increments simultaneously on each segment,
    all integrated at mass $alpha \( s \)$.
  This is the base hierarchy of Section 4.2, now with the specified finite approximation.
    In the middle stage, scalar time is local to each branch: we merge by mass, preserving each branch’s order.
    The end masses of the first stage are at most the starting middle masses,
    and the end middle masses are at most the starting third-stage masses.
    Thus the complete schedule is nondecreasing, and every increment is positive semidefinite.
  Write $Psi_0$ for its recursive value. The block-size cancellation proved in Section 4.2 gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ Psi_0 - beta^2 / 4 integral m thin thin upright(d) \| Q \|^2 = 3 Phi \( 0 \, 0 \) -
     frac(3 beta^2, 2) integral_0^1 s alpha \( s \) thin thin upright(d) s =
     3 cal(P)_beta \( alpha \) . $ <eq:narrow-base-value>]
  Its endpoint is $D$ with $delta = 0$. The same calculation identifies the base tilted law:
    after the common path through $r$, the $x \, y$ branch and the $v$ branch each have the scalar transition law.
    Denote their scalar paths by $X^x$ and $X^v$; they coincide through $r$ and then run to $q$ on their separate
    clocks. A frozen branch’s additive value cancels from every active normalized kernel,
    so merging the schedules does not change their conditional independence.
  To record the conditional independence that will be used below, let $cal(X)_0$ be the common prefix through $r$.
    If $K_(r \, z)$ denotes the scalar path law starting at $\( r \, z \)$, then
  $ cal(L) \( X_(\[ r \, q \])^x \, X_(\[ r \, q \])^v divides cal(X)_0 \) = K_(r \, X_r) ⊗ K_(r \, X_r) . $
  In particular, knowing the entire $x$ branch reveals no additional future noise of the $v$ branch.
  #strong[Step 2. A perturbation preserving positive semidefiniteness.] Set
  $ theta = rho^2 \, wide a = 1 - theta \, $
  and form the following linear combinations of field increments:
  #[#set math.equation(numbering: n => "(7.8)")
   $ Y_0 = frac(\( X_r^x - X_(r - h)^x \) - \( X_(r + h)^x - X_r^x \), h) \, wide Y_1 =
     frac(X_(r + h)^v - X_r^v, h) \, wide Y = a Y_0 + theta Y_1 . $ <eq:narrow-Y>]
  Under the raw law these are Gaussian linear expressions. Under the base tilted law the same expressions use the
    scalar paths just identified. The contrast $Y_0$ includes the common increment before the split and the $x$
    increment after the split; $Y_1$ uses the post-split increment on the $v$ branch.
    Figure 1 shows these three increments and their covariance kernels.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 4.15), [#text(size: 9pt)[Increments used in $Y="aY"_0+ theta Y_1$]], anchor: "west", padding: 0.1176cm)
  line((0, 2.407), (2.85, 2.407), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0.95, 2.407), (2.85, 2.407), stroke: (paint: rgb("#0000a6"), thickness: 1.3pt, miter-limit: 10))
  line((2.85, 2.407), (3.515, 2.988), (4.75, 2.988), stroke: (paint: rgb("#0000a6"), thickness: 1.3pt, miter-limit: 10))
  line((4.75, 2.988), (6.65, 2.988), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((2.85, 2.407), (3.515, 1.826), (4.75, 1.826), stroke: (paint: rgb("#a60000"), thickness: 1.3pt, miter-limit: 10))
  line((4.75, 1.826), (6.65, 1.826), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((2.85, 2.407), radius: 0.0635, fill: black, stroke: none)
  content((1.805, 2.44), [#text(size: 9pt)[$a"/"h$]], anchor: "south", padding: 0.1176cm)
  content((4.132, 3.029), [#text(size: 9pt)[$-a"/"h$]], anchor: "south", padding: 0.1176cm)
  content((4.132, 1.784), [#text(size: 9pt)[$theta"/"h$]], anchor: "north", padding: 0.1176cm)
  content((6.793, 2.988), [#text(size: 9pt)[$x,y$ branch]], anchor: "west", padding: 0.1176cm)
  content((6.793, 1.826), [#text(size: 9pt)[$v$ branch]], anchor: "west", padding: 0.1176cm)
  content((0.8075, 2.905), [#text(size: 9pt)[common#linebreak()branch]], anchor: "east", padding: 0.1176cm)
  line((0.95, 1.245), (0.95, 3.196), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((0.95, 1.245), [#text(size: 9pt)[$r-h$]], anchor: "north", padding: 0.1176cm)
  line((2.85, 1.245), (2.85, 3.196), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((2.85, 1.245), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  line((4.75, 1.245), (4.75, 3.196), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((4.75, 1.245), [#text(size: 9pt)[$r+h$]], anchor: "north", padding: 0.1176cm)
  line((6.65, 1.245), (6.65, 3.196), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((6.65, 1.245), [#text(size: 9pt)[$q$]], anchor: "north", padding: 0.1176cm)
  content((7.79, 0.9296), [#text(fill: rgb("#808080"))[#text(size: 9pt)[local scalar time]]], anchor: "west", padding: 0.1176cm)
  content((0, 0.249), [#text(size: 9pt)[Tent $T$ on the $x$ path]], anchor: "west", padding: 0.1176cm)
  line((0, -1.369), (6.887, -1.369), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0, -1.369), (0.95, -1.369), (2.85, -0.5395), (4.75, -1.369), (6.65, -1.369), stroke: (paint: rgb("#0000a6"), thickness: 1.3pt, miter-limit: 10))
  content((2.85, -0.5395), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  line((0.95, -1.328), (0.95, -1.411), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((0.95, -1.428), [#text(size: 9pt)[$r-h$]], anchor: "north", padding: 0.1176cm)
  line((2.85, -1.328), (2.85, -1.411), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((2.85, -1.428), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  line((4.75, -1.328), (4.75, -1.411), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((4.75, -1.428), [#text(size: 9pt)[$r+h$]], anchor: "north", padding: 0.1176cm)
  line((6.65, -1.328), (6.65, -1.411), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((6.65, -1.428), [#text(size: 9pt)[$q$]], anchor: "north", padding: 0.1176cm)
  content((7.647, 0.249), [#text(size: 9pt)[Ramp $S$ on the $v$ path]], anchor: "west", padding: 0.1176cm)
  line((7.695, -1.369), (12.02, -1.369), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((8.075, -1.369), (11.3, -0.5395), stroke: (paint: rgb("#a60000"), thickness: 1.3pt, miter-limit: 10))
  content((11.3, -0.5395), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  line((8.075, -1.328), (8.075, -1.411), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((8.075, -1.428), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  line((11.3, -1.328), (11.3, -1.411), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((11.3, -1.428), [#text(size: 9pt)[$r+h$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: The three increments in the perturbation. The upper labels are coefficients of the raw field increments in $Y$; $a = 1 - theta$. Horizontal position records local scalar time, not the mass-sorted order of the hierarchy. Below, the raw covariance of $Y_0$ with $X_s^x$, divided by $beta^2$, is the tent $T \( s \)$, which vanishes before the endpoint $q$. Conditional on the common field $X_r$, the raw covariance of $Y_1$ with $X_s^v$ on $\[ r \, r + h \]$, divided by $beta^2$, is the ramp $S \( s \)$. The tent isolates the small change in Parisi mass near $r$; the other branch supplies the mixed susceptibility term. Lengths are schematic. ],
  ) <fig:narrow-increments>
  At each level of the first two stages, add $delta$ times that level’s contribution to $Y$ to the $x$ field,
    and subtract it from the $y$ field. Leave $v$ unchanged. Each modified increment is a deterministic linear
    image of its original Gaussian increment. Consequently its covariance is positive semidefinite,
    and increments at different levels remain independent. This gives an admissible path $tilde(Q)$ with the
    original masses. At the end of the second stage the added fields are $0 \, delta Y \, - delta Y$.
  For any prefix, write $K_c$ for the accumulated raw variance of $Y$, divided by $beta^2$, and write $g_v \,
    g_x$ for its raw covariances with the base $v \, x$ fields in the same units.
    Its covariance with the base $y$ field equals $g_x$. The coefficients on the three active intervals are $a \/
    h \, - a \/ h \, theta \/ h$, so
  #[#set math.equation(numbering: n => "(7.9)")
   $ K = frac(2 a^2 + theta^2, h) \, wide g_v^(upright("end")) = a + theta = 1 \, wide g_x^(upright("end")) = a -
     a = 0 . $ <eq:narrow-covariance-end>]
  Let $e_v \, e_x \, e_y$ be the coordinate vectors and set $L_2 = \( e_x - e_y \) \( e_x - e_y \)^(sans(T))$.
    At every prefix,
  #[#set math.equation(numbering: n => "(7.10)")
   $ tilde(Q) = Q + delta L_1 + delta^2 K_c L_2 \, wide L_1 =
     mat(delim: "(", 0, g_v, - g_v; g_v, 2 g_x, 0; - g_v, 0, - 2 g_x) . $ <eq:narrow-covariance-expansion>]
  For the Frobenius product $U : V = sum_(i \, j) U_(i j) V_(i j)$, both $Q$ and $L_2$ are orthogonal to $L_1$.
    Also $\| L_1 \|^2 = 4 g_v^2 + 8 g_x^2$ and $\| L_2 \|^2 = 4$. Expanding gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ \| tilde(Q) \|^2 - \| Q \|^2 = delta^2 #scale(x: 120%, y: 120%)[\(] 4 g_v^2 + 8 g_x^2 + 2 K_c thin Q :
     L_2 #scale(x: 120%, y: 120%)[\)] + 4 delta^4 K_c^2 . $ <eq:narrow-norm-expansion>]
  The endpoint is
  #[#set math.equation(numbering: n => "(7.12)")
   $ tilde(Q)_(upright("end")) = D + delta^2 K L_2 . $ <eq:narrow-modified-end>]
  Its diagonal need not be one. We therefore use precisely the arbitrary-endpoint comparison (2.10),
    proved in Proposition 5. It assigns the endpoint discrepancy the cost
  #[#set math.equation(numbering: n => "(7.13)")
   $ beta^2 / 4 \| D - tilde(Q)_(upright("end")) \|^2 = beta^2 delta^4 K^2 . $ <eq:narrow-mismatch>]
  #strong[Step 3. The penalty gain.] We next compute the quadratic terms in the interpolation penalty.
    The base $x \, y$ fields coincide before the third stage, so $Q : L_2 = 0$ there.
    In the third stage, $Q : L_2 = 2 \( s - q \)$ and $K_c = K$ is fixed.
    The term $2 K_c thin Q : L_2$ in (7.11) therefore contributes $beta^2 delta^2 K A \( q \)$ to the penalty.
  For the other quadratic terms put
  $ I = integral m thin #scale(x: 120%, y: 120%)[\(] thin upright(d) \( g_v^2 \) +
    2 thin upright(d) \( g_x^2 \) #scale(x: 120%, y: 120%)[\)] . $
  The three active pieces have separate roles. Before the split, on $\[ r - h \, r \]$,
    both covariances grow from $0$ to $a$ at mass $alpha \( s \) \/ 3$; this contributes $alpha \( r \) a^2 +
    O \( rho^4 \)$. On the active $v$ steps, $g_v$ grows from $a$ to $a + theta$ and $g_x$ is fixed;
    this contributes $alpha \( r \) \( 2 a theta + theta^2 \) + O \( rho^4 \)$.
    On the active shared $x \, y$ steps, $g_x$ decreases from $a$ to zero and $g_v$ is fixed.
    The factor $2$ in $I$ cancels the factor $1 \/ 2$ in their masses, giving $- alpha \( r \) a^2 +
    O \( rho^4 \)$. The error in replacing each mass by $alpha \( r \)$ is controlled by (7.6) times the total
    variation of the relevant covariance square. These total variations are uniformly bounded,
    independently of the partition and its interleaving. Thus
  #[#set math.equation(numbering: n => "(7.14)")
   $ I = alpha \( r \) \( 2 a theta + theta^2 \) + O \( rho^4 \) . $ <eq:narrow-I>]
  Finally, $K_c$ is a nondecreasing cumulative variance and all masses are nonnegative.
    The fourth-order contribution $integral m thin thin upright(d) \( K_c^2 \)$ is therefore nonnegative.
    Combining the terms proves
  #[#set math.equation(numbering: n => "(7.15)")
   $ beta^2 / 4 integral m thin thin upright(d) #scale(x: 120%, y: 120%)[\(] \| tilde(Q) \|^2 - \| Q \|^2
     #scale(x: 120%, y: 120%)[\)] gt.eq beta^2 delta^2 #scale(x: 120%, y: 120%)[\(] K A \( q \) +
     alpha \( r \) \( 2 a theta + theta^2 \) - C rho^4 #scale(x: 120%, y: 120%)[\)] . $ <eq:narrow-penalty>]
  #strong[Step 4. The recursive-value cost.] Let $tilde(Psi)$ denote the modified one-site value.
    Integrating the unchanged third stage backwards leaves the boundary difference
  #[#set math.equation(numbering: n => "(7.16)")
   $ U = Phi \( q \, X_q^x + delta Y \) + Phi \( q \, X_q^x - delta Y \) - 2 Phi \( q \, X_q^x \) . $ <eq:narrow-U>]
  Initially view this as a function of the full raw Gaussian prefix through the second stage.
    Let $bb(E)_0$ denote expectation under its base tilted law. We claim that
  #[#set math.equation(numbering: n => "(7.17)")
   $ tilde(Psi) - Psi_0 lt.eq log bb(E)_0 e^U . $ <eq:narrow-recursive-comparison>]
  Apply the normalized-kernel comparison (4.11) with boundary change $U$.
    Here the state at each level is the entire raw Gaussian prefix:
    $Y$ uses several increments, so the current field alone need not determine the modified future value.
    If $K_i$ is the normalized base kernel and $Delta_i$ is the change in recursive value,
    the ratio of the defining integrals still gives
  $ Delta_i = 1 / m_i log K_i e^(m_i Delta_(i + 1)) quad \( m_i > 0 \) \, wide Delta_i =
    K_i Delta_(i + 1) quad \( m_i = 0 \) . $
  The kernel induction used for (4.11) therefore applies without change and proves (7.17).
    This argument uses no inverse transformation of the fields,
    so singular covariance increments cause no difficulty. Every kernel is from the base hierarchy,
    whose tilted prefix law was identified in Step 1.
  Write $chi_q = chi \( q \, X_q^x \)$. By Lemma 9,
  #[#set math.equation(numbering: n => "(7.18)")
   $ 0 lt.eq U lt.eq delta^2 Y^2 \, wide \| U - delta^2 chi_q Y^2 \| lt.eq
     C_beta \| delta Y \|^3 . $ <eq:narrow-U-bounds>]
  The diffusion representation under $bb(E)_0$ writes $Y = G + B_(*)$,
    where $G$ is a centered Gaussian linear combination of Brownian increments with variance $beta^2 K$,
    and $\| B_(*) \| lt.eq C_beta$. Indeed, each drift in (7.8) is bounded by $beta^2$, integrated for time $h$,
    and then divided by $h$. No independence between $G$ and $B_(*)$ is required.
    Since $delta^2 \/ h = O \( rho^32 \)$, Gaussian exponential moments and $\| Y \| lt.eq \| G \| +
    C_beta$ imply, for all large $n$,
  $ bb(E)_0 \| Y \|^3 lt.eq C_beta h^(- 3 \/ 2) \, wide bb(E)_0 #h(-0.16667em) [Y^4 e^(delta^2 Y^2)] lt.eq
    C_beta h^(- 2) . $
  Use $e^u lt.eq 1 + u + 1 / 2 u^2 e^u$ for $u gt.eq 0$, followed by $log \( 1 + z \) lt.eq z$, and then (7.18).
    We obtain
  #[#set math.equation(numbering: n => "(7.19)")
   $ log bb(E)_0 e^U lt.eq delta^2 bb(E)_0 \[ chi_q Y^2 \] +
     C_beta #scale(x: 120%, y: 120%)[\(] \| delta \|^3 h^(- 3 \/ 2) +
     delta^4 h^(- 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:narrow-exponential-error>]
  We have now reduced the comparison to estimating $bb(E)_0 \[ chi_q Y^2 \]$.
    Its Gaussian variance term will cancel the $K A \( q \)$ part of the penalty up to the pair deviation.
    The strict gain must come from the mixed moment of $Y_0$ and $Y_1$.
  #strong[Step 5. The tent on the first branch.] We will establish the quadratic-moment bound
  #[#set math.equation(numbering: n => "(7.20)")
   $ bb(E)_0 \[ chi_q Y^2 \] lt.eq beta^2 K thin bb(E)_0 chi_q +
     2 a theta beta^4 alpha \( r \) bb(E)_0 \[ chi_q chi_r \] + C_beta \( rho^4 + theta^2 \) \, wide chi_r =
     chi \( r \, X_r^x \) . $ <eq:narrow-quadratic>]
  Begin with the scalar $x$ path through $q$. Write its partition as $0 = s_0 < dots.h.c < s_N =
    q$ and its scalar masses as $m_j^(upright("sc")) = alpha \( s_j \)$.
    Its normalized tilted density $D_x$ relative to the raw Gaussian increments has logarithm
  #[#set math.equation(numbering: n => "(7.21)")
   $ ell := log D_x = sum_(j = 0)^(N - 1) m_j^(upright("sc")) #scale(x: 120%, y: 120%)[\(]
     Phi \( s_(j + 1) \, X_(s_(j + 1))^x \) - Phi \( s_j \, X_(s_j)^x \) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:narrow-density>]
  The scalar masses appear here because the base-law factorization in Step 1 has already canceled the divided
    matrix masses.
  Let $T$ be the continuous piecewise linear tent supported on $\[ r - h \, r + h \]$,
    zero at both endpoints and equal to one at $r$. For functions of the raw cumulative coordinates,
    denote by $partial$ the derivative obtained by replacing $X_s^x$ with $X_s^x +
    t T \( s \)$ and differentiating at $t = 0$. Under the raw law,
  $ upright("Cov")_(upright("raw")) \( Y_0 \, X_s^x \) = beta^2 T \( s \) \, wide
    upright("Var")_(upright("raw")) \( Y_0 \) = frac(2 beta^2, h) . $
  Finite-dimensional Gaussian integration by parts gives
  #[#set math.equation(numbering: n => "(7.22)")
   $ bb(E)_(upright("raw")) \[ Y_0 f \] = beta^2 bb(E)_(upright("raw")) \[ partial f \] \, wide
     bb(E)_(upright("raw")) \[ Y_0^2 f \] = frac(2 beta^2, h) bb(E)_(upright("raw")) f +
     beta^4 bb(E)_(upright("raw")) \[ partial^2 f \] . $ <eq:narrow-tent-ibp>]
  For a direct verification, multiply the Gaussian density by $exp { t Y_0 - t^2 \( 2 beta^2 \/ h \) \/ 2 }$.
    This shifts every cumulative coordinate by $t beta^2 T \( s \)$;
    one and two differentiations give the two formulas. These derivatives act on raw coordinates,
    not on the solution map of the tilted stochastic differential equation.
  Telescope (7.21). Since $T \( 0 \) = T \( q \) = 0$, only internal coefficients $m_(j - 1)^(upright("sc")) -
    m_j^(upright("sc"))$ remain:
  $ partial ell = sum_(j = 1)^(N - 1) \( m_(j - 1)^(upright("sc")) - m_j^(upright("sc")) \) T \( s_j \)
    u \( s_j \, X_(s_j)^x \) \, wide partial^2 ell =
    sum_(j = 1)^(N - 1) \( m_(j - 1)^(upright("sc")) - m_j^(upright("sc")) \) T \( s_j \)^2
    chi \( s_j \, X_(s_j)^x \) . $
  Only points strictly between $r - h$ and $r + h$ contribute.
    The sum of the absolute coefficients at those points is at most $alpha \( r + h \) - alpha \( r - h \)$. Thus
  #[#set math.equation(numbering: n => "(7.23)")
   $ \| partial ell \| lt.eq rho^4 \, wide \| partial^2 ell \| lt.eq rho^4 . $ <eq:narrow-density-derivatives>]
  This estimate includes an atom at $r$. Atoms at $r - h$ or $r +
    h$ contribute zero because the tent vanishes there. No continuity of $alpha$ at these points is assumed.
  The endpoint $q$ lies outside the tent, so $partial chi_q = 0$.
    Apply the second identity of (7.22) to $f = D_x chi_q$:
  #[#set math.equation(numbering: n => "(7.24)")
   $ bb(E)_0 \[ chi_q Y_0^2 \] & = frac(2 beta^2, h) bb(E)_0 chi_q +
     beta^4 bb(E)_0 #h(-0.16667em)
     [chi_q #scale(x: 120%, y: 120%)[\(] \( partial ell \)^2 + partial^2 ell #scale(x: 120%, y: 120%)[\)]]\
 & = frac(2 beta^2, h) bb(E)_0 chi_q + O_beta \( rho^4 \) . $ <eq:narrow-Y0-square>]
  At the tent’s peak, put $u_r = u \( r \, X_r^x \)$; then $partial u_r = chi_r$.
    The first identity applied to $f = D_x chi_q u_r$ gives
  #[#set math.equation(numbering: n => "(7.25)")
   $ bb(E)_0 \[ chi_q Y_0 u_r \] & = beta^2 bb(E)_0 \[ chi_q chi_r \] + beta^2 bb(E)_0 \[ chi_q u_r partial ell \]\
 & = beta^2 bb(E)_0 \[ chi_q chi_r \] + O_beta \( rho^4 \) . $ <eq:narrow-Y0-linear>]
  Both integrations by parts are legitimate for every fixed finite partition.
    Scalar values grow at most linearly, their needed derivatives are bounded,
    and the density grows at most exponential-linearly in the finite Gaussian vector.
    Gaussian integrability therefore justifies differentiation directly,
    or after truncation and passage to the limit. The error estimates above are uniform over the partitions.
  #strong[Step 6. The ramp on the other branch and the mixed moment.] Condition now on the entire path $X^x$
    through $q$. The product law from Step 1 leaves the future $v$ branch as a scalar diffusion starting at the
    fixed value $X_r$. On $\[ r \, r + h \]$, its conditional tilted density has the form (7.21),
    with starting time $r$. Use the ramp $S \( s \) = \( s - r \) \/
    h$ and denote the corresponding raw-coordinate derivative by $partial_v$.
    The raw covariance of $Y_1$ with the cumulative coordinate at $s$ is $beta^2 S \( s \)$,
    and its raw variance is $beta^2 \/ h$.
  Let $ell_v$ be this branch’s conditional log density. Telescoping its derivative produces the terminal term
    $m_(upright("last")) u \( r + h \, X_(r + h)^v \)$ and internal terms with total absolute coefficient at most
    $m_(upright("last")) - m_(upright("first")) lt.eq 1$. The initial value is fixed and the ramp is zero there.
    Using $\| u \| lt.eq 1$ and $chi lt.eq 1$ gives
  $ \| partial_v ell_v \| lt.eq 2 \, wide \| partial_v^2 ell_v \| lt.eq 2 . $
  The conditional second Gaussian integration-by-parts identity therefore yields
  #[#set math.equation(numbering: n => "(7.26)")
   $ bb(E)_0 \[ Y_1^2 divides X^x \] = beta^2 / h + beta^4 bb(E)_0 #h(-0.16667em)
     [\( partial_v ell_v \)^2 + partial_v^2 ell_v divides X^x] = beta^2 / h + O_beta \( 1 \) . $ <eq:narrow-Y1-square>]
  The error is uniform in the starting field $X_r$. Multiplying by the $X^x$-measurable variable $chi_q$ and
    averaging gives
  $ bb(E)_0 \[ chi_q Y_1^2 \] = beta^2 / h bb(E)_0 chi_q + O_beta \( 1 \) . $
  For the mixed moment we need the conditional first moment of $Y_1$.
    The Brownian increment has conditional mean zero. The arbitrary-start martingale identity (3.5) gives
    $bb(E)_0 \[ u \( z \, X_z^v \) divides X^x \] = u_r$, since the independent branch starts at $X_r$.
    Hence its drift representation gives exactly
  #[#set math.equation(numbering: n => "(7.27)")
   $ bb(E)_0 \[ Y_1 divides X^x \] = beta^2 / h integral_r^(r + h) alpha \( z \)
     bb(E)_0 \[ u \( z \, X_z^v \) divides X^x \] thin thin upright(d) z = beta^2 macron(alpha) thin u_r \, wide
     macron(alpha) = 1 / h integral_r^(r + h) alpha \( z \) thin thin upright(d) z . $ <eq:narrow-Y1-mean>]
  Conditioning on the whole $x$ path introduces no additional conditioning on the $v$ branch’s future noise.
    Moreover, (7.6) implies $\| macron(alpha) - alpha \( r \) \| lt.eq rho^4$.
    Since $Y_0 \, chi_q \, u_r$ are $X^x$-measurable, combine (7.25) with (7.27) to obtain
  #[#set math.equation(numbering: n => "(7.28)")
   $ bb(E)_0 \[ chi_q Y_0 Y_1 \] = beta^2 macron(alpha) thin bb(E)_0 \[ chi_q Y_0 u_r \] =
     beta^4 alpha \( r \) bb(E)_0 \[ chi_q chi_r \] + O_beta \( rho^4 \) . $ <eq:narrow-mixed>]
  Finally expand $Y^2 = a^2 Y_0^2 + 2 a theta Y_0 Y_1 + theta^2 Y_1^2$.
    Equations (7.9), (7.24), (7.26), and (7.28) prove (7.20). The distinction between the two errors matters:
    the tent contributes $O_beta \( rho^4 \)$, while the ramp’s $O_beta \( 1 \)$ error is multiplied by $theta^2$.
  #strong[Step 7. Passing the pressure comparison to the minimizer.] We can now apply (2.10) to the modified
    finite hierarchy. Combine the base value, mismatch, penalty, recursive comparison,
    and moment estimates in (7.7), (7.13), (7.15), (7.17), (7.19), and (7.20).
    Since $K = O \( h^(- 1) \)$, the endpoint cost is part of the $delta^4 h^(- 2)$ error.
    Discard the additional nonpositive term $- beta^2 delta^2 alpha \( r \) theta^2$ to get
  #[#set math.equation(numbering: n => "(7.29)")
   $ F_(3 \, n) \( D \) lt.eq 3 cal(P)_beta \( alpha \) + delta^2 { & beta^2 K \( bb(E)_0 chi_q - A \( q \) \) +
     2 a theta beta^2 alpha \( r \) \( beta^2 bb(E)_0 \[ chi_q chi_r \] - 1 \) +
     C_beta \( rho^4 + theta^2 \) #scale(x: 120%, y: 120%)[}]\
 & #h(-1em)  + C_beta #scale(x: 120%, y: 120%)[\(] \| delta \|^3 h^(- 3 \/ 2) +
   delta^4 h^(- 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:narrow-step-pressure>]
  The constants do not depend on the partition.
  Keep $n \, r \, q \, delta$ fixed and send the mesh size to zero.
    Lemma 9 gives uniform convergence of the scalar derivatives and $L^1$ stability of the values.
    Couple the diffusions with the same Brownian motion. Their drifts are uniformly bounded and Lipschitz in
    space, so $L^1$ convergence of $alpha$ together with uniform convergence of $u$ gives path convergence by
    Gronwall’s inequality. The bounded expectations in (7.29) consequently converge.
    So do $A \( q \)$ and the scalar functional, the latter to $P_beta$.
    By construction, every approximation uses the actual value $alpha \( r \)$.
  This limit is taken at fixed $h$, so it requires no approximation rate uniform as $h arrow.b 0$.
    Returning to the minimizing data, and writing $bb(E)$ for its scalar-process expectation, we have
  #[#set math.equation(numbering: n => "(7.30)")
   $ F_(3 \, n) \( D \) lt.eq 3 P_beta + delta^2 { & beta^2 K \( bb(E) chi_q - A \( q \) \) +
     2 a theta beta^2 alpha \( r \) \( beta^2 bb(E) \[ chi_q chi_r \] - 1 \) +
     C_beta \( rho^4 + theta^2 \) #scale(x: 120%, y: 120%)[}]\
 & #h(-1em)  + C_beta #scale(x: 120%, y: 120%)[\(] \| delta \|^3 h^(- 3 \/ 2) +
   delta^4 h^(- 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:narrow-pressure>]
  In the product $chi_q chi_r$, both susceptibilities belong to the same scalar path.
    It remains to show that their evolution makes the quadratic coefficient negative by more than all displayed errors.
  #strong[Step 8. The strict quadratic margin and the scale choices.] The assumed identity (7.2) and the scalar
    evolution imply
  $ beta^2 bb(E) chi_r^2 = Gamma' \( r \) = 1 . $
  Multiply the conditional susceptibility identity (3.7) by $chi_r$ and average. It gives
  #[#set math.equation(numbering: n => "(7.31)")
   $ beta^2 bb(E) \[ chi_q chi_r \] = 1 - beta^4 integral_r^q alpha \( z \) bb(E) \[ chi_z^2 chi_r \] thin thin
     upright(d) z lt.eq 1 - c \( q - r \) lt.eq 1 - c rho $ <eq:narrow-susceptibility-loss>]
  with a uniform $c > 0$ over the allowed $r \, q$. To justify uniformity, including $q = 1$,
    use the drift bound to obtain $sup_(s lt.eq 1) \| X_s \| lt.eq beta sup_(s lt.eq 1) \| B_s \| + beta^2$.
    Choose a fixed $M$ so that the event that the right side is at most $M$ has positive probability $p_M$.
    Continuity and strict positivity of $chi$ imply
  $ c_M := min_(0 lt.eq s lt.eq 1 \, med \| z \| lt.eq M) chi \( s \, z \) > 0 . $
  Thus $bb(E) \[ chi_z^2 chi_r \] gt.eq p_M c_M^3$ for all the times under consideration.
    Also $alpha \( z \) gt.eq alpha \( t_0 \/ 2 \) > 0$ when $z gt.eq r$.
    We may take $c = beta^4 alpha \( t_0 \/ 2 \) p_M c_M^3$ in (7.31).
    This argument uses positivity on a compact set, not a lower bound for $chi$ on the whole real line.
  The all-time stationarity identity (3.15) and the pair restriction (7.5) give
  $ bb(E) chi_q - A \( q \) = alpha \( q \) \( q - Gamma \( q \) \) lt.eq rho^13 . $
  Since $K = O \( rho^(- 8) \)$, the first term in braces in (7.30) is at most $C_beta rho^5$.
    For all large $n$, $a gt.eq 1 \/ 2$; using $theta = rho^2$, $alpha \( r \) gt.eq alpha \( t_0 \/ 2 \) > 0$,
    and (7.31), the second term is at most $- c_1 rho^3$. The remaining brace term is $O_beta \( rho^4 \)$.
    The last two errors, after division by $delta^2$, satisfy
  $ C_beta \| delta \| h^(- 3 \/ 2) lt.eq C_beta rho^8 \, wide C_beta delta^2 h^(- 2) lt.eq C_beta rho^24 . $
  Every positive error is therefore smaller than the negative $rho^3$ contribution for all large $n$.
    Uniformly over the feasible matrices in question, this proves
  #[#set math.equation(numbering: n => "(7.32)")
   $ F_(3 \, n) \( D \) lt.eq 3 P_beta - c_2 delta^2 rho^3 lt.eq 3 P_beta - c_2 rho^43 . $ <eq:narrow-pressure-gap>]
  #strong[Step 9. From pressure deficits to the claimed probability.] The choice $kappa =
    1 \/ 10000$ satisfies $43 kappa < 1 \/ 24$, so the deficit in (7.32) dominates the finite-size error required
    by Lemma 13. For each feasible triple matrix that lemma gives two exponential bounds,
    with exponents at least constant multiples of $n rho^43$ and $n rho^86$.
    The latter equals $n^(1 - 86 kappa) = n^0.9914$. Sum these bounds over the at most $\( n + 1 \)^3$ triple
    overlap matrices.
  For the pairs removed in (7.5), (4.4) and the same lemma give exponents at least constant multiples of $n
    rho^26$ and $n rho^52 = n^0.9948$. There are at most $n + 1$ pair overlaps to sum over.
    The fixed constants and polynomial counts in both sums are absorbed by $exp \( - n^(4 \/ 5) \)$ for all
    sufficiently large $n$. This proves (7.3). ◻
]

== 8 Reference banks, crossings and slow mixing <sec:dynamics>

We have established all static inputs. It remains to use them along a path:
  coverage selects references, fixed-scale locking controls incompatible references,
  and narrow-annulus locking preserves constraints during backwards searches.
  We first reduce Theorem 1 to a sign passage, then construct the required references,
  and finally bound the probability of all resulting threshold constraints.
  As before, $L = n^kappa$, $rho = n^(- kappa)$, and constants may depend on the fixed inverse temperature but not
  on $n$.

=== 8.1 Stationary paths and a sign-passage criterion <stationary-paths-and-a-sign-passage-criterion>

Given $J$, start the discrete heat-bath chain $\( x_k \)_(k gt.eq 0)$ at $x_0 tilde.op pi^J$.
  Each step chooses a uniform site and resamples its spin from the conditional Gibbs law.
  Stationarity gives marginal $pi^J$ at every deterministic index.
  If $N$ is an independent rate-$n$ Poisson process, $x_(N \( t \))$ has conditional transition kernel $P_t^J$
  from the realized $x_0$. We work up to the deterministic index

#[#set math.equation(numbering: n => "(8.1)")
 $ m = ceil.l e^(2 L) ceil.r . $ <eq:dyn-time-horizon>]

Markov’s inequality gives

#[#set math.equation(numbering: n => "(8.2)")
 $ bb(P) { N \( e^L \) > m } lt.eq frac(n e^L, m) lt.eq n e^(- L) = o \( 1 \) . $ <eq:dyn-poisson-tail>]

For every fixed configuration $v$, the overlap $R \( v \, x_k \)$ changes by at most $2 \/ n$ at a single step.

A #emph[bank] is an ordered list of independent $pi^J$ samples.
  Given $J$, all raw bank entries are mutually independent and independent of the complete path.
  Their sizes are deterministic functions of $n$. A chosen reference may be reversed in sign at selection;
  that orientation is thereafter fixed.

Suppose a first bank is used to select a reference $v_1$ satisfying $R \( v_1 \, x_0 \) gt.eq q_(*)$,
  with the choice and orientation depending only on $J \, x_0$ and this bank.
  Write $cal(S)$ for successful selection, and define its sign-passage event by

$ cal(A) = cal(S) ∩ { R \( v_1 \, x_k \) lt.eq 0 upright(" for some ") 0 lt.eq k lt.eq m } . $

Also write

$ cal(M) = {lr(bar.v.double P_(e^L)^J \( x_0 \, dot.op \) - pi^J bar.v.double)_(upright("TV")) lt.eq 1 / 4} . $

Spin-flip symmetry implies, for every oriented $v$,

$ pi^J { z : R \( v \, z \) lt.eq 0 } gt.eq 1 / 2 . $

Condition on $J \, x_0$ and successful first-bank selection.
  Since that selection uses no future updates, the path and clock still have their original conditional laws.
  On $cal(M)$, total variation therefore puts conditional probability at least $1 \/
  4$ on the opposite-sign half-space at time $e^L$. Removing clock overruns gives

#[#set math.equation(numbering: n => "(8.3)")
 $ bb(P) \( cal(A) \) gt.eq 1 / 4 bb(P) \( cal(M) ∩ cal(S) \) - bb(P) { N \( e^L \) > m } . $ <eq:dyn-tv-bridge>]

Thus the remaining task is concrete: make the first reference available with probability tending to one,
  and make its sign passage have probability tending to zero.

Choose a fixed $b in \( 0 \, 1 \)$ no larger than the small-overlap cutoff in Lemma 12 with large-overlap cutoff
  $q_(*)$. Next choose $b' in \( 0 \, b \)$ no larger than that lemma’s small-overlap cutoff with large-overlap
  cutoff $b$. Fix $t_0 > 0$ so small that

#[#set math.equation(numbering: n => "(8.4)")
 $ 4 t_0 < min { q_(*) \, b' \, b^2 \/ 2 } . $ <eq:dyn-t0-choice>]

We use the notation

#[#set math.equation(numbering: n => "(8.5)")
 $ eta_n = n^(- 1 \/ 100) = rho^100 $ <eq:dyn-fixed-error>]

for the scale in fixed-scale locking.

=== 8.2 The case with a fixed forbidden overlap interval <the-case-with-a-fixed-forbidden-overlap-interval>

There are two possible scalar regimes. In the first, $Gamma \( z \) =
  z$ fails at some point of $\( t_0 \/ 2 \, 3 t_0 \)$. Continuity then supplies fixed constants

$ t_0 \/ 2 < a_0 < a_1 < 3 t_0 \, wide d_0 > 0 \, $

such that $\| q - Gamma \( q \) \| gt.eq d_0$ for all $q in \[ a_0 \, a_1 \]$.
  The pair gap (4.4), Lemma 13, and the polynomial number of feasible pair overlaps imply,
  for some $c > 0$ and all sufficiently large $n$,

#[#set math.equation(numbering: n => "(8.6)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] \( pi^J \)^(⊗ 2) { \( v \, x \) :
   R \( v \, x \) in \[ a_0 \, a_1 \] } #scale(x: 120%, y: 120%)[\]] lt.eq e^(- c n) . $ <eq:dyn-fixed-forbidden>]

Apply Proposition 18 with $D_1 = 3$, let $D_3$ be its constant, and take a single bank with $K =
  ceil.l exp \( \( D_3 + 1 \) L \) ceil.r$ entries. Select its first entry with $\| R \( v \, x_0 \) \| gt.eq
  q_(*)$, oriented to give positive overlap. On the disorder event of coverage for the whole configuration space,
  the Gibbs mass of starting states whose qualifying neighborhood has mass below $e^(- D_3 L)$ is at most
  $e^(- 3 L)$. For every other starting state, the independent bank misses that neighborhood with probability at
  most $e^(- e^L)$. Hence $bb(P) \( cal(S) \) arrow.r 1$.

At a deterministic $k lt.eq m$, the path point and a fixed signed bank entry are independent Gibbs draws
  conditional on $J$. Sum (8.6) over entries, signs and indices:

$ bb(P) { R \( sigma v \, x_k \) in \[ a_0 \, a_1 \] upright(" for some bank entry ") v \, med sigma in { - 1 \,
  1 } \, med k lt.eq m } lt.eq 2 K \( m + 1 \) e^(- c n) = o \( 1 \) . $

For large $n$, a sequence beginning at overlap at least $q_(*) > a_1$ and reaching nonpositive overlap,
  with jumps at most $2 \/ n < a_1 - a_0$, must visit $\[ a_0 \, a_1 \]$.
  Therefore $bb(P) \( cal(A) \) arrow.r 0$. Together with (8.3), this proves the theorem in this case.

This completes the forbidden-interval case. In the second regime we have

#[#set math.equation(numbering: n => "(8.7)")
 $ Gamma \( z \) = z wide \( t_0 \/ 2 < z < 3 t_0 \) \, $ <eq:dyn-identity-interval>]

and put

#[#set math.equation(numbering: n => "(8.8)")
 $ h = rho^8 \, wide epsilon = rho^20 . $ <eq:dyn-local-scales>]

=== 8.3 Thresholds and simultaneous bank properties <thresholds-and-simultaneous-bank-properties>

Define the fixed integers and the number of levels by

#[#set math.equation(numbering: n => "(8.9)")
 $ H_0 = ceil.l 2 \/ b^2 ceil.r \, wide B = H_0 + 2 \, wide p = B ⌊frac(t_0, 5 B rho)⌋ . $ <eq:dyn-block-parameters>]

For large $n$, $p gt.eq B$. Divide the $p$ levels into consecutive blocks of $B$ levels each.
  At the first level of every block after the first, we #emph[reset] the selection cell to the whole space.
  Older retained references are kept unless they meet the conflict rule specified below.
  Independently of the disorder, banks and path, draw independent thresholds $r_i$, uniform on

#[#set math.equation(numbering: n => "(8.10)")
 $ I_i = \[ t_0 + 4 \( i - 1 \) rho \, med t_0 + \( 4 \( i - 1 \) + 1 \) rho \] . $ <eq:dyn-threshold-intervals>]

These intervals lie in $\[ t_0 \, 2 t_0 \]$, and

#[#set math.equation(numbering: n => "(8.11)")
 $ r_j - r_i gt.eq 3 rho wide \( i < j \) . $ <eq:dyn-threshold-separation>]

Fubini’s theorem gives

$ bb(E) #scale(x: 120%, y: 120%)[\[] mu \( \[ r_i - 2 h \, r_i + 2 h \] \) #scale(x: 120%, y: 120%)[\]] lt.eq
  frac(4 h, rho) . $

Consequently Markov’s inequality and a union bound show that the event

#[#set math.equation(numbering: n => "(8.12)")
 $ cal(T) = { mu \( \[ r_i - 2 h \, r_i + 2 h \] \) lt.eq rho^4 upright(" for every ") 1 lt.eq i lt.eq
   p } $ <eq:dyn-threshold-good>]

satisfies

#[#set math.equation(numbering: n => "(8.13)")
 $ bb(P) \( cal(T)^c \) lt.eq frac(4 p h, rho^5) = O \( rho^2 \) . $ <eq:dyn-threshold-good-prob>]

The Fubini calculation includes atoms; no regularity of the distribution of the minimizing measure is imposed here.

There will be a bank $cal(B)_j$ at every level. Its size must compensate for the number of earlier reference
  tuples that can define the selection cell. Using all preceding levels would give a recursion of growing depth
  $p$; Proposition 18 does not control its constants uniformly in $n$.
  The reset confines this recursion to $B$ fixed steps. Bank sizes can then depend only on the position within a
  block, keeping the total number of samples at $exp \( O \( L \) \)$.
  Older retained references will still enter the crossing constraints below.

We require coverage for every possible earlier tuple in the current block.
  For entries $u_i in cal(B)_i$ from those earlier levels, define

#[#set math.equation(numbering: n => "(8.14)")
 $ S = { z : \| R \( u_i \, z \) \| lt.eq 3 t_0 upright(" for every index in this tuple") } . $ <eq:dyn-cell>]

The empty tuple gives the whole space. We require

#[#set math.equation(numbering: n => "(8.15)")
 $ x_k in S \, quad 0 lt.eq k lt.eq m quad arrow.r.double quad
   upright("some ") w in cal(B)_j ∩ S upright(" satisfies ") \| R \( w \, x_k \) \| gt.eq
   q_(*) . $ <eq:dyn-bank-property>]

Absolute values make this property insensitive to orientations.

Choose the bank sizes recursively over the fixed positions $s = 1 \, dots.h \, B$.
  Once the constants at smaller positions are fixed, set

$ C_s = sum_(u < s) \( D_(3 \, u) + 2 \) \, wide D_(1 \, s) = C_s + 5 . $

Let $D_(3 \, s)$ be a constant supplied by Proposition 18 for $D_(1 \, s)$, and use

$ K_s = ceil.l exp \( \( D_(3 \, s) + 1 \) L \) ceil.r $

entries at position $s$. For large $n$, the number of earlier tuples in the block is at most $exp \( C_s L \)$.
  Only $B$ fixed applications of coverage are needed, so their disorder events have an intersection $cal(D)$ with
  $bb(P) \( cal(D) \) arrow.r 1$.

Fix a level at position $s$, a realization $J in cal(D)$, and its earlier bank lists. Each cell $S$ has a bad subset

$ B_S = { x in S : pi^J { z in S : \| R \( z \, x \) \| gt.eq q_(*) } < e^(- D_(3 \, s) L) } $

of Gibbs mass less than $e^(- D_(1 \, s) L)$. The path is independent of those lists given $J$,
  and each deterministic-index marginal is $pi^J$. A union bound over tuples and deterministic indices therefore
  bounds the probability that any $x_k$ lies in its cell’s bad subset by

$ \( m + 1 \) e^(\( C_s - D_(1 \, s) \) L) = O \( e^(- 3 L) \) . $

After excluding these bad targets, condition also on the complete path.
  The bank at the present level is still fresh. Its probability of missing a qualifying neighborhood inside the
  cell is at most

$ \( 1 - e^(- D_(3 \, s) L) \)^(K_s) lt.eq e^(- e^L) . $

Union over the same tuples and indices, and then over the $p = O \( L \)$ levels,
  shows that (8.15) holds simultaneously with probability $1 - o \( 1 \)$.
  The recursion has only $B$ steps, so the total number of entries across all $p$ banks is $exp \( O \( L \) \)$.

We also impose simultaneous avoidance of the exceptional triples in Lemma 12,
  for the two cutoff pairs $\( q_(*) \, b \)$ and $\( b \, b' \)$, and in Lemma 19.
  We do so for every ordered triple of signed entries from distinct banks,
  and for every ordered triple consisting of two signed entries from distinct banks and one path point $x_k$,
  $0 lt.eq k lt.eq m$. For each deterministic choice, the conditional law given $J$ is $\( pi^J \)^(⊗ 3)$:
  bank independence, stationarity at that deterministic index, and spin-flip symmetry suffice.
  The sampled configurations themselves need not be different.

There are $exp \( O \( L \) \)$ such choices, including all orders and signs.
  The exceptional probability for each is bounded by a constant times $e^(- n^(9 \/ 10)) + e^(- n^(4 \/ 5))$.
  A union bound thus makes all these locking assertions simultaneous with probability $1 - o \( 1 \)$.
  Let $cal(G)$ be the intersection of this event, the simultaneous bank property, and $cal(T)$. We have proved

#[#set math.equation(numbering: n => "(8.16)")
 $ bb(P) \( cal(G)^c \) = o \( 1 \) . $ <eq:dyn-good-event-prob>]

We have made all these estimates simultaneously before choosing references or crossing times.
  Later application at a backwards crossing therefore uses this deterministic-index event,
  not an assertion of stationarity at a random time.

=== 8.4 Backwards searches and deletion of conflicts <backwards-searches-and-deletion-of-conflicts>

Select $v_1$ from $cal(B)_1$ as the first entry whose absolute overlap with $x_0$ is at least $q_(*)$,
  and orient it positively. If it exists, let $tau_1$ be the first $k lt.eq m$ with $R \( v_1 \, x_k \) lt.eq
  r_1$. On success initialize the ordered retained list as $A_1 = { 1 }$.

At a subsequent level $j$, assuming all earlier levels have succeeded,
  form the cell (8.14) using the selected references in earlier positions of the current block.
  Choose as $v_j$ the first entry of $cal(B)_j$ lying in this cell and having absolute overlap at least $q_(*)$
  with $x_(tau_(j - 1))$. Orient it so that $R \( v_j \, x_(tau_(j - 1)) \) gt.eq q_(*)$.
  From $A_(j - 1)$ delete the conflicts, namely those indices $i$ with

#[#set math.equation(numbering: n => "(8.17)")
 $ \| R \( v_i \, v_j \) \| > b . $ <eq:dyn-conflict>]

The remaining old indices are called compatible. Search backwards from $tau_(j - 1)$,
  stopping at the first point encountered with overlap at most $r_j$ with $v_j$.
  Equivalently, if the set is nonempty, define

#[#set math.equation(numbering: n => "(8.18)")
 $ tau_j = max { 0 lt.eq k lt.eq tau_(j - 1) : R \( v_j \, x_k \) lt.eq r_j } . $ <eq:dyn-backward-time>]

Add $j$ to the compatible list to obtain $A_j$.

To use independence of each fresh threshold, define $v_j$ on failure realizations as well.
  A missing candidate or missing crossing ends the procedure.
  A candidate already selected before its crossing fails is kept as that level’s reference.
  At a level with no candidate, and at all levels after an earlier failure,
  use the first entry of the corresponding bank without sign reversal.
  These defaults serve the final conditional-probability calculation.
  Selection and orientation of $v_j$ use only thresholds earlier than $r_j$;
  its own threshold is used solely for the subsequent crossing.
  The first reference, when selected successfully, uses only $J \, x_0$ and $cal(B)_1$ as required by (8.3).

We now work deterministically on $cal(G) ∩ cal(A)$. For all sufficiently large $n$,
  we will show that every level succeeds, that reference $1$ survives, and that

#[#set math.equation(numbering: n => "(8.19)")
 $ \| R \( v_i \, x_(tau_j) \) - r_i \| & lt.eq 6 j epsilon &  & \( i in A_j \) \,\
\| R \( v_i \, v_ell \) - r_i \| & lt.eq 6 j epsilon &  & \( i \, ell in A_j \, med i < ell \) .
  $ <eq:dyn-induction-path>]

The induction also keeps the current block complete: after level $j$,
  all references from that block’s first level through $j$ remain on the list.
  At the next reset, the preceding block is therefore intact.
  Older blocks may already have gaps, but the complete preceding block will prevent a new deletion from reaching them.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((3.116, 3.45), [#text(size: 9pt)[Older blocks#linebreak()with earlier deletions]])
  content((8.742, 3.45), [#text(size: 9pt)[Immediately preceding block#linebreak()all $B$ references still retained]])
  content((13.21, 3.45), [#text(size: 9pt)[New#linebreak()level $j$]])
  line((6.138, 2.96), (6.138, 3.08), (11.62, 3.08), (11.62, 2.96), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((12.09, -0.5), (12.09, 3.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.651, 2.3), [#text(size: 9pt)[Before#linebreak()reset]], anchor: "east", padding: 0.1176cm)
  content((0.651, 0.15), [#text(size: 9pt)[After#linebreak()reset]], anchor: "east", padding: 0.1176cm)
  circle((1.209, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((1.953, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((3.441, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((4.929, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((2.697, 2.3), radius: (0.0837, 0.09), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((2.623, 2.22), (2.771, 2.38), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((4.185, 2.3), radius: (0.0837, 0.09), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((4.111, 2.22), (4.259, 2.38), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((5.534, 2.3), [#text(size: 9pt)[$dots.h$]])
  circle((1.209, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((1.953, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((3.441, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((4.929, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((2.697, 0.15), radius: (0.0837, 0.09), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((2.623, 0.07), (2.771, 0.23), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((4.185, 0.15), radius: (0.0837, 0.09), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((4.111, 0.07), (4.259, 0.23), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((5.534, 0.15), [#text(size: 9pt)[$dots.h$]])
  content((1.209, 2.4), [#text(size: 9pt)[$v_1$]], anchor: "south", padding: 0.1176cm)
  content((1.209, 0.02), [#text(size: 9pt)[$v_1$]], anchor: "north", padding: 0.1176cm)
  rect((9.114, 1.89), (11.67, 2.73), fill: rgb("#ffeded"), stroke: none)
  circle((6.417, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((7.254, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((8.091, 2.3), [#text(size: 9pt)[$dots.h$]])
  circle((8.696, 2.3), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((9.486, 2.3), radius: 0.07937, fill: rgb("#b20000"), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  circle((10.42, 2.3), radius: 0.07937, fill: rgb("#b20000"), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  circle((11.35, 2.3), radius: 0.07937, fill: rgb("#b20000"), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  content((6.417, 2.4), [#text(size: 9pt)[$v_(j-B)$]], anchor: "south", padding: 0.1176cm)
  content((11.35, 2.4), [#text(size: 9pt)[$v_(j-1)$]], anchor: "south", padding: 0.1176cm)
  line((9.114, 1.83), (9.114, 1.68), (11.67, 1.68), (11.67, 1.83), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  content((10.4, 1.28), [#text(fill: rgb("#b20000"))[#text(size: 9pt)[Conflict suffix#linebreak()$d lt.eq H_0<B$]]])
  circle((6.417, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((7.254, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((8.696, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((8.091, 0.15), [#text(size: 9pt)[$dots.h$]])
  circle((9.486, 0.15), radius: (0.0837, 0.09), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  line((9.412, 0.07), (9.56, 0.23), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  circle((10.42, 0.15), radius: (0.0837, 0.09), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  line((10.34, 0.07), (10.49, 0.23), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  circle((11.35, 0.15), radius: (0.0837, 0.09), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  line((11.27, 0.07), (11.42, 0.23), stroke: (paint: rgb("#b20000"), thickness: 0.4pt, miter-limit: 10))
  circle((13.21, 0.15), radius: 0.07937, fill: rgb("#0000a6"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((13.21, 0.02), [#text(size: 9pt)[$v_j$]], anchor: "north", padding: 0.1176cm)
  line((13.21, 2.5), (13.21, 0.5), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((13.21, 1.52), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Select#linebreak()and append]]])])
  line((1.069, -0.8), (13.53, -0.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((7.254, -0.8), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Original level order]]])])
})],
  caption: [Figure 2: Why a reset preserves the first reference. The dots are schematic slots in the original level order; omitted entries are indicated by ellipsis, and crossed gray slots represent deletions at earlier resets. Immediately before a reset at level $j$, the preceding block ${ j - B \, dots.h \, j - 1 }$ is complete. Conflicts form a suffix of the retained list of length $d lt.eq H_0 < B$, illustrated in red. The suffix therefore misses both the first reference of that complete block and all older retained references. Thus $v_1$ survives at the first reset, when it belongs to the preceding block, and at every later reset, as drawn. The new reference $v_j$ is then appended. Older blocks may contain holes and need not be complete. The diagram illustrates a nonempty conflict suffix; the proof also permits $d = 0$. ],
) <fig:protected-block>

Deletions occur only at the first level of a new block, and at most $H_0$ indices,
  forming a suffix of the old list, are deleted at each such level.

At level $1$, coverage of the whole space supplies the reference.
  Sign passage forces the first crossing, where the one-step overlap bound puts the value in
  $\[ r_1 - 2 \/ n \, r_1 \]$. This starts the induction. In the following induction we use the scale relations

#[#set math.equation(numbering: n => "(8.20)")
 $ 1 / n lt.double eta_n = rho^100 lt.double epsilon = rho^20 \, wide p epsilon = O \( rho^19 \) lt.double h =
   rho^8 lt.double rho . $ <eq:dyn-scale-relations>]

Suppose the assertions hold through level $j - 1$. All earlier references in the current block are still retained,
  since there have been no deletions within that block after its first level.
  Their overlaps with $x_(tau_(j - 1))$ have absolute value at most $2 t_0 + 6 p epsilon < 3 t_0$.
  Thus this target belongs to the required cell, and the new selection $w = v_j$ exists by (8.15).

For each compatible old index $i$, the two small overlaps in the triple $\( v_i \, w \, x_(tau_(j - 1)) \)$ have
  absolute value at most $b$, whereas $R \( w \, x_(tau_(j - 1)) \) gt.eq q_(*)$. Fixed-scale locking gives

#[#set math.equation(numbering: n => "(8.21)")
 $ \| R \( v_i \, w \) - R \( v_i \, x_(tau_(j - 1)) \) \| lt.eq 2 eta_n . $ <eq:dyn-target-transfer>]

In particular,

#[#set math.equation(numbering: n => "(8.22)")
 $ \| R \( v_i \, w \) - r_i \| lt.eq 6 \( j - 1 \) epsilon +
   2 eta_n wide \( i upright(" compatible") \) . $ <eq:dyn-reference-transfer>]

#strong[Conflicts occupy a bounded final segment.] A conflicting old index $i$ cannot precede a compatible old
  index $ell$. Indeed, by (8.19) and (8.22), the magnitudes of $R \( v_ell \, v_i \)$ and $R \( v_ell \, w \)$ are
  within $6 \( j - 1 \) epsilon$ and $6 \( j - 1 \) epsilon + 2 eta_n$ of $r_i$ and $r_ell$, respectively.
  Both magnitudes are less than $b'$, by (8.4). Their difference in magnitude is at least

$ 3 rho - 12 p epsilon - 2 eta_n > 2 eta_n . $

On the other hand $\| R \( v_i \, w \) \| > b$. Reverse one of this pair if necessary to make their mutual overlap
  positive. The signed difference of the two small overlaps has absolute value at least their difference in
  magnitude. This contradicts fixed-scale locking with cutoff pair $\( b \, b' \)$,
  which holds for all signs on $cal(G)$. The conflicts consequently form a suffix of the old retained list.

The number of conflicts is bounded by $H_0$. Indeed, the induction bounds all absolute overlaps between retained
  old references by $2 t_0 + 6 p epsilon < 3 t_0$. If $d gt.eq 1$ of them conflict with $w$,
  normalize them to unit vectors and reverse each sign to give inner product greater than $b$ with $w \/ sqrt(n)$.
  Denote these vectors by $u_1 \, dots.h \, u_d$. Then

$ d^2 b^2 < ⟨sum_(a = 1)^d u_a \, w / sqrt(n)⟩^2 lt.eq lr(bar.v.double sum_(a = 1)^d u_a bar.v.double)^2 lt.eq d +
  3 t_0 d \( d - 1 \) . $

Since $3 t_0 < b^2 \/ 2$, this implies

$ d < frac(1 - 3 t_0, b^2 - 3 t_0) < 2 / b^2 lt.eq H_0 . $

In particular $d lt.eq H_0$.

If $j$ is not the first level of its block, the most recent old index $j - 1$ is compatible:
  the cell condition gives $\| R \( v_(j - 1) \, w \) \| lt.eq 3 t_0 < b$.
  A suffix of conflicts is therefore empty. At the first level of a new block,
  the additional invariant says that all $B$ entries selected in the preceding block are still present.
  Removing at most $H_0 < B$ final indices cannot reach any older block,
  or the first index of the preceding block. In particular index $1$ survives, including at the first reset.
  Adding the new index starts the current block as a retained singleton;
  at a nonreset it extends the complete current block because there is no deletion.
  This establishes the additional invariant and the deletion claims before proving that the new crossing exists.

#strong[The backwards search preserves old constraints.] Follow the search for $tau_j$,
  including the crossing step when there is one. The new reference satisfies throughout this search

#[#set math.equation(numbering: n => "(8.23)")
 $ R \( w \, x_k \) gt.eq r_j - 2 \/ n . $ <eq:dyn-search-large-overlap>]

If there is no crossing, this follows with the stronger strict bound $R \( w \, x_k \) >
  r_j$ at every index down to zero. If there is a crossing,
  all indices strictly after it have overlap greater than $r_j$, and the jump bound gives (8.23) at the crossing itself.

For each compatible old reference $v_i$, (8.22) places the fixed value $R \( v_i \, w \)$ near $r_i$.
  The larger threshold $r_j$ separates the new overlap from that old level throughout the search.
  We will use narrow-annulus locking to prove

#[#set math.equation(numbering: n => "(8.24)")
 $ \| R \( v_i \, x_k \) - R \( v_i \, w \) \| < 2 epsilon $ <eq:dyn-search-locking>]

on this entire searched portion. Equation (8.21) proves the claim at the target.
  At a first violation while moving backwards, the one-step bound puts the left side in
  $\[ 2 epsilon \, 2 epsilon + 2 \/ n \]$. For this triple use the parameters of Lemma 19:

$ r = frac(R \( v_i \, x_k \) + R \( v_i \, w \), 2) \, wide delta =
  frac(R \( v_i \, x_k \) - R \( v_i \, w \), 2) \, wide q = R \( w \, x_k \) . $

Then

$ epsilon lt.eq \| delta \| lt.eq epsilon + 1 \/ n lt.eq 2 epsilon \, wide \| r - r_i \| lt.eq
  6 \( j - 1 \) epsilon + 2 eta_n + epsilon + 1 \/ n < h . $

It follows that $t_0 \/ 2 < r < 3 t_0$ and $\[ r - h \, r + h \] subset.eq \[ r_i - 2 h \, r_i + 2 h \]$.
  Thus $cal(T)$ gives the required bound $mu \( \[ r - h \, r + h \] \) lt.eq rho^4$.
  Also, by (8.11), (8.23), and (8.20),

$ q - r gt.eq 3 rho - 6 \( j - 1 \) epsilon - 2 eta_n - epsilon - 3 \/ n gt.eq rho . $

All conditions of the forbidden narrow-annulus event hold, contradicting its simultaneous avoidance on $cal(G)$.
  This proves (8.24).

The crossing must exist. Otherwise the search reaches index zero,
  and (8.22)–(8.24) apply there to the surviving compatible reference $1$. They would give

$ R \( v_1 \, x_0 \) < r_1 + 6 \( j - 1 \) epsilon + 2 eta_n + 2 epsilon < q_(*) \, $

contradicting the first selection. Hence the crossing exists.
  Its new reference overlap belongs to $\[ r_j - 2 \/ n \, r_j \]$.
  For each retained old reference, the error at the new crossing is at most $6 \( j - 1 \) epsilon + 2 eta_n +
  2 epsilon lt.eq 6 j epsilon$. The old-new reference errors satisfy the same claimed bound by (8.22),
  and old-old reference errors are unchanged. This proves (8.19)–(8.19) and completes the induction.

There are at most $p \/ B$ reset occasions, so the final list has size at least

#[#set math.equation(numbering: n => "(8.25)")
 $ \| A_p \| gt.eq p - H_0 p \/ B gt.eq p \/ B . $ <eq:dyn-retained-count>]

Consequently $cal(G) ∩ cal(A)$ implies that, for some index $k$ in ${ 0 \, dots.h \,
  m }$ and some subset of $p \/ B$ indices, the inequalities

#[#set math.equation(numbering: n => "(8.26)")
 $ \| R \( v_i \, x_k \) - r_i \| lt.eq 6 p epsilon $ <eq:dyn-small-target-windows>]

hold simultaneously. We have reduced sign passage to this existence event.
  The probability bound that follows will not condition on $cal(G)$ or on the random retained list.

=== 8.5 Predictable thresholds and completion of the proof <predictable-thresholds-and-completion-of-the-proof>

Let $cal(F)_0$ be generated by $J$, all raw bank lists, and the path $\( x_0 \, dots.h \, x_m \)$, and set

$ cal(F)_i = sigma \( cal(F)_0 \, r_1 \, dots.h \, r_i \) \, wide 1 lt.eq i lt.eq p . $

Every $r_i$ is uniform on $I_i$ and independent of $cal(F)_(i - 1)$.
  The failure conventions ensure that each oriented $v_i$ is $cal(F)_(i - 1)$-measurable.
  Here is the complete induction. At level $1$ its selection does not use any threshold.
  Inductively, whether a prior level failed, the previously selected references,
  and the preceding crossing time are all determined by earlier thresholds.
  Selection at level $i$ uses only that information and the bank and path data in $cal(F)_0$.
  The subsequent crossing may use $r_i$, but never changes that selected reference.
  A default caused by an earlier failure likewise depends only on earlier thresholds.
  This proves the claim, including on failure events.

For each deterministic $k lt.eq m$, let

$ E_i \( k \) = { \| R \( v_i \, x_k \) - r_i \| lt.eq 6 p epsilon } \, wide gamma_n = frac(12 p epsilon, rho) . $

The interval defining $E_i \( k \)$ has length at most $12 p epsilon$, while $I_i$ has length $rho$.
  Thus, for all sufficiently large $n$,

#[#set math.equation(numbering: n => "(8.27)")
 $ bb(P) \( E_i \( k \) divides cal(F)_(i - 1) \) lt.eq gamma_n < 1 . $ <eq:dyn-conditional-window>]

For a deterministic subset ${ i_1 < dots.h.c < i_s }$, the earlier events $E_(i_1) \( k \) \, dots.h \,
  E_(i_(s - 1)) \( k \)$ are $cal(F)_(i_s - 1)$-measurable.
  Conditioning first at the largest selected index and using (8.27) yields

$ bb(P) (⋂_(a = 1)^s E_(i_a) \( k \)) lt.eq gamma_n thin bb(P) (⋂_(a = 1)^(s - 1) E_(i_a) \( k \)) lt.eq gamma_n^s . $

The elimination order is essential: the latest selected threshold is integrated out first.
  Later centers may depend on earlier thresholds, but the displayed conditioning remains valid.
  Neither the random retained subset nor the good event has been conditioned on.

Taking $s = p \/ B$, then taking a union over all deterministic subsets and all deterministic indices $k$, proves

#[#set math.equation(numbering: n => "(8.28)")
 $ bb(P) { upright("(8.26)") upright(" holds for some ") k upright(" and some subset of size ") p \/ B }
   lt.eq \( m + 1 \) 2^p (frac(12 p epsilon, rho))^(p \/ B) = o \( 1 \) . $ <eq:dyn-threshold-union>]

Indeed $p = \( t_0 \/ 5 \) L + O \( 1 \)$, $rho = L^(- 1)$, and $12 p epsilon \/ rho = O \( rho^18 \)$.
  The logarithm of the right-hand side is therefore bounded above by

$ 2 L + O \( p \) - frac(18 p, B) log \( 1 \/ rho \) = - Omega \( L log L \) . $

The deterministic induction and (8.16) now imply

$ bb(P) \( cal(A) \) lt.eq bb(P) \( cal(G)^c \) + bb(P) \( cal(G) ∩ cal(A) \) = o \( 1 \) . $

The first selection succeeds on the simultaneous bank event at level $1$, so $bb(P) \( cal(S)^c \) =
  o \( 1 \)$ as well. Finally, (8.3) and (8.2) give

$ bb(P) \( cal(M) \) lt.eq bb(P) \( cal(S)^c \) + 4 bb(P) \( cal(A) \) + 4 bb(P) { N \( e^L \) > m } = o \( 1 \) . $

This proves Theorem 1 also under (8.7), and the two cases exhaust the possibilities.

Finally take $T_n = floor.l e^L floor.r$ discrete update attempts.
  This deterministic index lies below $m$ for large $n$. If its transition law is within $1 \/ 4$ of equilibrium,
  the opposite-sign half-space has conditional probability at least $1 \/ 4$ at that index.
  Thus the same sign-passage inequality holds with no clock-overrun term.
  All bank, locking and threshold estimates already concern the discrete path,
  so they prove the second assertion of Theorem 1 at exactly $floor.l e^L floor.r$ attempts.

== 9 Coverage inside sets of polynomial Gibbs mass <poly-sec:coverage>

The fixed-depth crossing argument in Appendix 10 uses polynomially many reference samples.
  The neighborhood bound $e^(- D_3 n^kappa)$ in Proposition 18 is smaller than every fixed inverse power of $n$,
  so it does not supply those references. We therefore apply the same energy and rotation mechanism with a
  perturbation variance of order $log n \/ n$. This yields polynomial overlap mass inside sets of polynomial Gibbs
  mass, uniformly over every subset of the cube. We give the argument from the energy and rotation estimates in
  Section 5, so that the fixed-depth route can be read independently of the growing-depth construction.

Throughout this appendix, fix $beta > 1$ and use the off-diagonal Hamiltonian of Equation (1.1).
  Write $H^J = H_n^J$, $Z^J = Z_(n \, beta)^J$, and $pi^J = pi_(n \, beta)^J$.
  For a nonempty $S subset { - 1 \, 1 }^n$, define its conditional Gibbs measure by

$ pi_S^J \( x \) = frac(pi^J \( x \) upright(bold(1))_({ x in S }), pi^J \( S \)) . $

Every nonempty set has positive Gibbs mass. All Gaussian disorder vectors below have independent standard normal
  coordinates indexed by $i < j$.

#thm([Proposition 9.1.])[
  (Polynomial overlap coverage).  #emph[There exists $q_(*) = q_(*) \( beta \) in \( 0 \, 1 \)$ such that,
    for every fixed $D_1 > 0$, there exists a fixed $D_2 > 0$ for which
#[#set math.equation(numbering: n => "(9.1)")
 $ bb(P)_J #h(-0.16667em)
   (upright("for every ") S subset { - 1 \, 1 }^n upright(" with ") pi^J \( S \) gt.eq n^(- D_1) \, quad \(
   pi_S^J \)^(⊗ 2) { \| R \| gt.eq q_(*) } gt.eq n^(- D_2)) arrow.r 1 . $ <poly-eq:coverage-uniform>]

 The threshold $q_(*)$ does not depend on $D_1$.]
] <poly-prop:coverage>

The proof compares two estimates for the change in $log Z$ under a small Gaussian rotation.
  If a set has too few overlapping pairs, a fresh Gaussian perturbation increases its restricted partition sum.
  The energy upper tail limits the loss caused by decreasing the coefficient of the original disorder.
  Together these give an increase that the rotation estimate makes unlikely.
  We first prove the required gain for an arbitrary deterministic probability measure,
  so that it can later be applied after conditioning on $J$.

=== 9.1 Gain under independent Gaussian disorder <gain-under-independent-gaussian-disorder>

#thm([Lemma 9.2.])[
  (Gaussian gain from few overlapping pairs).  #emph[Fix $M > 0$, $q in \( 0 \, 1 \)$, and $D gt.eq
    beta^2 M \/ 2 + 2$. For all sufficiently large $n$, set $t = M log n \/ n$.
    If $nu$ is any deterministic probability measure on ${ - 1 \, 1 }^n$ satisfying
$ nu^(⊗ 2) { \| R \| gt.eq q } lt.eq 4 n^(- D) \, $

 and $G$ is standard Gaussian, define $W = nu \( e^(beta sqrt(t) H^G) \)$.
   There is a constant $C_beta$, independent of $M \, q \, D \, n \, nu$, such that
#[#set math.equation(numbering: n => "(9.2)")
 $ bb(P)_G #h(-0.16667em) (log W gt.eq frac(beta^2 t \( n - 1 \), 4) - beta^2 n t q - C_beta sqrt(n t) - log 2)
   gt.eq 1 / 2 . $ <poly-eq:coverage-gain>]

]
] <poly-lem:coverage-gain>

#proof[
  For $x in { - 1 \, 1 }^n$ let $h_x = \( n^(- 1 \/ 2) x_i x_j \)_(i < j)$, so that $H^G \( x \) = h_x dot.op G$.
    In particular,
  $ \| h_x \|^2 = frac(n - 1, 2) \, wide bb(E)_G \[ H^G \( x \) H^G \( y \) \] = frac(n R \( x \, y \)^2 - 1, 2) . $
  Set
  $ m_0 = frac(beta^2 t \( n - 1 \), 4) \, wide A = frac(beta^2 n t q^2, 2) . $
  The Gaussian exponential moment formula gives $bb(E)_G W = e^(m_0)$.
    For the second moment, split pairs according to whether $\| R \| < q$:
  #[#set math.equation(numbering: n => "(9.3)")
   $ frac(bb(E)_G W^2, \( bb(E)_G W \)^2) & = nu^(⊗ 2) #h(-0.16667em) (e^(beta^2 t \( n R^2 - 1 \) \/ 2))\
 & lt.eq e^A + 4 n^(- D) e^(beta^2 n t \/ 2) lt.eq e^A + 4 n^(- 2) lt.eq 2 e^A . $ <poly-eq:coverage-moments>]
  The exponent assumption on $D$ gives the second inequality, and the last one holds for $n gt.eq 2$.
    Paley–Zygmund therefore implies
  #[#set math.equation(numbering: n => "(9.4)")
   $ bb(P)_G \( log W gt.eq m_0 - log 2 \) gt.eq 1 / 8 e^(- A) . $ <poly-eq:coverage-pz>]
  This probability may be small. Gaussian concentration will turn it into a lower bound of probability at least
    one half, while controlling the loss in the value of $log W$.
  Write $Y \( G \) = log W$. Differentiation expresses its gradient as $beta
    sqrt(t)$ times a convex combination of the vectors $h_x$. Consequently $Y$ is Lipschitz with constant at most
  $ L_W = beta sqrt(frac(t \( n - 1 \), 2)) . $
  The Gaussian moment bound in Equation (2.2) of Lemma 3, followed by Chernoff’s inequality,
    gives the following one-sided tails for this deterministic function of $G$:
  $ bb(P)_G \( Y - bb(E)_G Y gt.eq s \) lt.eq e^(- s^2 \/ \( 2 L_W^2 \)) \, wide
    bb(P)_G \( Y - bb(E)_G Y lt.eq - s \) lt.eq e^(- s^2 \/ \( 2 L_W^2 \)) quad \( s > 0 \) . $
  If $m_0 - log 2 > bb(E)_G Y$, comparison of the upper-tail bound with Equation (9.4) gives
  $ bb(E)_G Y gt.eq m_0 - log 2 - L_W sqrt(2 \( A + log 8 \)) . $
  If $m_0 - log 2 lt.eq bb(E)_G Y$, the same inequality holds immediately.
    Using $sqrt(a + b) lt.eq sqrt(a) + sqrt(b)$, we thus obtain
  #[#set math.equation(numbering: n => "(9.5)")
   $ bb(E)_G Y gt.eq m_0 - log 2 - frac(beta^2 n t q, sqrt(2)) - beta sqrt(n t log 8) . $ <poly-eq:coverage-mean-gain>]
  The lower-tail bound also gives $Y gt.eq bb(E)_G Y - L_W sqrt(2 log 2)$ with probability at least $1 \/ 2$.
    Combining this with Equation (9.5), and bounding $beta^2 n t q \/ sqrt(2)$ by $beta^2 n t q$,
    proves the stated estimate. One admissible choice is
  $ C_beta = beta #scale(x: 120%, y: 120%)[\(] sqrt(log 8) + sqrt(log 2) #scale(x: 120%, y: 120%)[\)] . $
  This constant is independent of the measure $nu$ and of the parameters $M \, q \, D$. ◻
]

=== 9.2 Uniform coverage over all subsets <uniform-coverage-over-all-subsets>

#proof[
  Let $e_1 in \( 0 \, beta \/ 2 \)$ and $c_E > 0$ be the constants from Lemma 16.
    Thus, outside a disorder event of probability at most $e^(- c_E n)$,
  #[#set math.equation(numbering: n => "(9.6)")
   $ pi^J { H^J > n e_1 } lt.eq e^(- c_E n) . $ <poly-eq:energy-event>]
  Define
  $ g = beta^2 / 4 - frac(beta e_1, 2) > 0 . $
  Choose the overlap threshold before choosing any mass exponent:
  #[#set math.equation(numbering: n => "(9.7)")
   $ 0 < q_(*) < min {1 \, frac(g, 8 beta^2)} . $ <poly-eq:coverage-constants>]
  It depends only on $beta$. We choose this same threshold in Proposition 18:
    both coverage arguments use the same $e_1$ and permit the strict bound in Equation (9.7).
    Now fix $D_1 > 0$ and choose
  #[#set math.equation(numbering: n => "(9.8)")
   $ M gt.eq frac(8 \( D_1 + 1 \), g) \, wide D_2 = frac(beta^2 M, 2) + 2 \, wide t = frac(M log n, n) \, wide
     theta = arcsin sqrt(t) . $ <poly-eq:coverage-parameters>]
  For all sufficiently large $n$, $0 < t < 1 \/ 2$. All constants have been fixed independently of $n$ and of the
    disorder.
  Let $cal(B)_n$ be the event that Equation (9.6) holds and that some $S subset { - 1 \, 1 }^n$ satisfies
  #[#set math.equation(numbering: n => "(9.9)")
   $ pi^J \( S \) gt.eq n^(- D_1) \, wide \( pi_S^J \)^(⊗ 2) { \| R \| gt.eq
     q_(*) } < n^(- D_2) . $ <poly-eq:violating-set>]
  We will bound the probability of this existence event by selecting one violating set.
    Fix a deterministic ordering of the subsets of the finite cube and take its first member satisfying
    Equation (9.9). For each fixed nonempty set, both Gibbs quantities in that equation are continuous functions
    of $J$. The resulting selector $S = S \( J \)$ is therefore measurable on $cal(B)_n$.
    In particular, it is fixed when we condition on $J$.
  For such a fixed $J$, remove the part of $S$ above the energy threshold:
  $ T = S ∩ { x : H^J \( x \) lt.eq n e_1 } \, wide nu = pi_T^J . $
  For all sufficiently large $n$, uniformly over $J in cal(B)_n$,
  #[#set math.equation(numbering: n => "(9.10)")
   $ pi^J \( T \) gt.eq pi^J \( S \) - e^(- c_E n) gt.eq 1 / 2 pi^J \( S \) gt.eq 1 /
     2 n^(- D_1) . $ <poly-eq:trimmed-mass>]
  In particular, $T$ is nonempty. Since $T subset S$, the two conditioning denominators give
  #[#set math.equation(numbering: n => "(9.11)")
   $ nu^(⊗ 2) { \| R \| gt.eq q_(*) } lt.eq (frac(pi^J \( S \), pi^J \( T \)))^2 \( pi_S^J \)^(⊗ 2) { \| R \|
     gt.eq q_(*) } < 4 n^(- D_2) . $ <poly-eq:trimmed-pairs>]
  The trimmed measure is measurable in $J$ as well. Draw $G$ independently of $J$.
    Conditional on $J$, the measure $nu$ is deterministic, so Lemma 21 applies with $q = q_(*)$ and $D = D_2$. Write
  $ W = nu \( e^(beta sqrt(t) H^G) \) \, wide J_theta = sqrt(1 - t) thin J + sqrt(t) thin G . $
  No part of the choice of $S \, T$, or $nu$ uses this fresh disorder.
  We now compare this conditional gain with the full partition sum.
    Linearity in the disorder, restriction to $T$, and $sqrt(1 - t) - 1 < 0$ imply
  $ log Z^(J_theta) / Z^J & = log pi^J #h(-0.16667em) (e^(beta \( sqrt(1 - t) - 1 \) H^J + beta sqrt(t) H^G))\
 & gt.eq - D_1 log n - log 2 - beta \( 1 - sqrt(1 - t) \) n e_1 + log W . $
  Thus Lemma 21 gives, with conditional probability at least $1 \/ 2$,
  #[#set math.equation(numbering: n => "(9.12)")
   $ log Z^(J_theta) / Z^J & gt.eq - D_1 log n - 2 log 2 - beta \( 1 - sqrt(1 - t) \) n e_1 +
     frac(beta^2 t \( n - 1 \), 4) - beta^2 n t q_(*) - C_beta sqrt(n t)\
 & gt.eq n t (g - beta^2 q_(*) - D_1 / M - frac(beta e_1 t, 2)) - C_beta sqrt(n t) - 2 log 2 -
   frac(beta^2 t, 4) . $ <poly-eq:partition-gain>]
  The last line uses $1 - sqrt(1 - t) lt.eq t \/ 2 + t^2 \/ 2$ for $0 lt.eq t < 1$.
    Our choices ensure $beta^2 q_(*) < g \/ 8$ and $D_1 \/ M < g \/ 8$.
    Since $t arrow.r 0$ and $n t = M log n arrow.r oo$, the remaining errors in Equation (9.12) are $o \( n t \)$.
    Consequently, for all sufficiently large $n$ and every $J in cal(B)_n$,
  #[#set math.equation(numbering: n => "(9.13)")
   $ bb(P)_G #h(-0.16667em) (log Z^(J_theta) - log Z^J gt.eq g / 2 n t thin mid(bar.v) thin J) gt.eq 1 /
     2 . $ <poly-eq:bad-increment>]
  The lower bound on $n$ depends only on the fixed parameters and is uniform in $J$ and its selected set.
  It remains to bound this increment under the joint law of $\( J \, G \)$.
    For $t lt.eq 1 \/ 2$, $theta lt.eq sqrt(2 t)$. The unconditional rotation estimate in Lemma 17 therefore yields
  $ bb(P)_(J \, G) #h(-0.16667em) (log Z^(J_theta) - log Z^J gt.eq g / 2 n t) & lt.eq
    exp #h(-0.16667em) (- frac(g^2 n t, 8 beta^2))\
 & = n^(- g^2 M \/ \( 8 beta^2 \)) . $
  Integrating Equation (9.13) over $cal(B)_n$ bounds $bb(P)_J \( cal(B)_n \)$ by twice this probability.
    Adding the exceptional event from Lemma 16, we conclude that the failure probability in Equation (9.1) is at most
  #[#set math.equation(numbering: n => "(9.14)")
   $ e^(- c_E n) + 2 n^(- g^2 M \/ \( 8 beta^2 \)) arrow.r 0 . $ <poly-eq:failure-bound>]
  The selector controls the existence of any violating subset, without a union bound over subsets of the cube.
    The choice of $q_(*)$ in Equation (9.7) preceded the choice of $D_1$, as required. ◻
]

=== 9.3 Target coverage within arbitrary subsets <target-coverage-within-arbitrary-subsets>

For the crossing argument, we need a bound on the total Gibbs mass of targets lacking polynomial Gibbs mass of
  overlapping references in the same subset. Both masses below use the original Gibbs measure.
  This is the form needed when targets have Gibbs marginals and reference banks contain unconditioned Gibbs
  samples. Uniformity of the pair statement gives the target bound by applying it to the set of points that would
  violate it.

#thm([Corollary 9.3.])[
  (Target coverage within arbitrary subsets).  #emph[Let $q_(*)$ be as in Proposition 20.
    For every fixed $D_1 > 0$, there exists a fixed $D_3 > 0$ such that, with probability tending to one over $J$,
    every $S subset { - 1 \, 1 }^n$ satisfies
#[#set math.equation(numbering: n => "(9.15)")
 $ pi^J #h(-0.16667em) ({x in S : pi^J { b in S : \| R \( x \, b \) \| gt.eq q_(*) } < n^(- D_3)}) < n^(- D_1) .
   $ <poly-eq:coverage-cells>]

]
] <poly-cor:coverage-cells>

#proof[
  Fix $D_1 > 0$, take the corresponding $D_2$ from Proposition 20, and choose any fixed $D_3 > D_1 + D_2$.
    Work on the simultaneous event in that proposition. Given $S subset { - 1 \, 1 }^n$,
    denote the set inside the outer measure in Equation (9.15) by $B$.
    If $m = pi^J \( B \) gt.eq n^(- D_1)$, then $B$ is nonempty, and $B subset S$ implies
  $ \( pi_B^J \)^(⊗ 2) { \| R \| gt.eq q_(*) } & = 1 / m^2 sum_(x in B) pi^J \( x \) pi^J { b in B : \|
    R \( x \, b \) \| gt.eq q_(*) }\
 & < n^(- D_3) / m lt.eq n^(- D_3 + D_1) < n^(- D_2) . $
  This contradicts Proposition 20 applied to $B$. Hence $pi^J \( B \) < n^(- D_1)$.
    This implication is deterministic on the same disorder event for every $S$,
    including cells selected after observing $J$. For $S = diameter$ the assertion is immediate. ◻
]

== 10 A fixed number of crossings on polynomial time scales <fixed-sec:crossings>

The polynomial coverage estimate in Proposition 20 has a direct dynamical application.
  Together with the absolute-overlap locking estimate of Proposition 15,
  it rules out mixing on each fixed polynomial time scale by using a fixed number of nested crossings.
  We give the argument in full. Its number of levels and threshold intervals remain fixed as $n$ grows.

#thm([Theorem 10.1.])[
  (Polynomial-time obstruction from fixed-depth crossings).  #emph[For every fixed $beta > 1$ and every fixed $a > 0$,
#[#set math.equation(numbering: n => "(10.1)")
 $ bb(P)_(J \, thin x_0 tilde.op pi^J) {d^J \( x_0 \, n^a \) > 1 / 4} & arrow.r 1 \,\
bb(P)_(J \, thin x_0 tilde.op pi^J) {d_(upright("disc"))^J \( x_0 \, floor.l n^a floor.r \) > 1 / 4} & arrow.r
  1 . $ <fixed-eq:continuous-conclusion>]

 Consequently both $bb(P) { T^J \( x_0 \) > n^a }$ and $bb(P) { T_(upright("disc"))^J \( x_0 \) >
   n^a }$ tend to one under the same joint law. Each assertion is equivalently a statement that the Gibbs mass of
   the indicated initial states tends to one in probability over $J$.]
] <fixed-thm:polynomial>

As in the main theorem, the transition law in each distance starts from the realized state $x_0$.
  The proof uses stationarity to sample possible targets along a path,
  and then uses total variation from that fixed initial state to force a sign passage.
  Independent random thresholds will make such a passage unlikely.

=== 10.1 A stationary path and fixed overlap scales <fixed-subsec:path-scales>

Fix $beta > 1$ and $a > 0$, and abbreviate $pi^J$ to $pi$. Put

#[#set math.equation(numbering: n => "(10.2)")
 $ t_n = n^a \, wide m = ceil.l 2 n^(a + 1) ceil.r \, wide e_(*) = 1 / 100 \, wide delta_n =
   n^(- e_(*)) . $ <fixed-eq:time-parameters>]

Conditional on $J$, start $x_0$ with law $pi$ and generate an infinite discrete heat-bath chain
  $\( x_k \)_(k gt.eq 0)$. At each step choose a uniform site and use fresh resampling randomness,
  including possible self-transitions. Let $N \( t \)$ be an independent rate-$n$ Poisson process.
  The process $x_(N \( t \))$ is the continuous-time chain with rate one at each site.
  Indeed, if $K_i^J$ denotes resampling at site $i$, then $K^J =
  n^(- 1) sum_i K_i^J$ and its generator is $sum_i \( K_i^J - I \) = n \( K^J - I \)$. Therefore

$ bb(E) \[ \( K^J \)^(N \( t \)) \] = exp { n t \( K^J - I \) } = P_t^J . $

Stationarity gives, for every deterministic $k$,

#[#set math.equation(numbering: n => "(10.3)")
 $ cal(L) \( x_k divides J \) = pi . $ <fixed-eq:stationary-marginal>]

Moreover, Chernoff’s inequality at parameter $log 2$, with $bb(E) N \( t_n \) = n^(a + 1)$ and $m gt.eq
  2 n^(a + 1)$, gives

#[#set math.equation(numbering: n => "(10.4)")
 $ eta_n := bb(P) { N \( t_n \) > m } lt.eq exp { - \( 2 log 2 - 1 \) n^(a + 1) } =
   o \( 1 \) . $ <fixed-eq:poisson-tail>]

Use the common threshold $q_(*) = q_(*) \( beta \) > 0$ of Proposition 20.
  With the same energy cutoff $e_1$ as in the main coverage argument, its choice satisfies

$ g = beta^2 / 4 - frac(beta e_1, 2) > 0 \, wide 0 < q_(*) < min { 1 \, g \/ \( 8 beta^2 \) } . $

Choose an integer $p gt.eq 2$ such that

#[#set math.equation(numbering: n => "(10.5)")
 $ p e_(*) > a + 2 . $ <fixed-eq:depth-count>]

This integer is fixed throughout the limit. First choose $t_p > 0$ with $2 t_p < q_(*) \/ 2$.
  For $j = p \, p - 1 \, dots.h \, 2$, take a cutoff $b_j in \( 0 \, q_(*) \/ 2 \)$ allowed by Proposition 15 for
  large-overlap threshold $h = t_j \/ 2$, and then choose $t_(j - 1) > 0$ with

#[#set math.equation(numbering: n => "(10.6)")
 $ t_(j - 1) < t_j \/ 10 \, wide 4 t_(j - 1) < b_j . $ <fixed-eq:separated-scales>]

Thus $0 < t_1 < dots.h.c < t_p$, and all scale gaps are fixed positive constants.
  Independently of the disorder and of all other randomness introduced below, draw

#[#set math.equation(numbering: n => "(10.7)")
 $ r_j tilde.op "Unif" \[ t_j \, 2 t_j \] \, wide 1 lt.eq j lt.eq p \, $ <fixed-eq:thresholds>]

independently for different $j$.

=== 10.2 Polynomial reference banks cover every possible target <fixed-subsec:banks>

We next sample finite lists of Gibbs configurations. These lists provide references for the later crossing
  construction. Their sizes are chosen so that coverage holds for every earlier reference choice and every
  deterministic index of the path segment $x_0 \, dots.h \, x_m$.

Conditional on $J$, all entries in all banks are independent with law $pi$,
  and all banks are independent of the entire chain. Choose their sizes recursively.
  Having chosen $D_(3 \, i)$ for $i < j$, set

$ B_j = sum_(i < j) \( D_(3 \, i) + 1 \) \, wide B_1 = 0 \, $

choose $D_(1 \, j) > B_j + a + 3$, and use Corollary 22 with exponent $D_(1 \, j)$ to obtain $D_(3 \, j) > 0$.
  Bank $j$ consists of

#[#set math.equation(numbering: n => "(10.8)")
 $ M_j = ceil.l n^(D_(3 \, j) + 1) ceil.r quad upright("entries") quad V_(j \, 1) \, dots.h \,
   V_(j \, M_j) . $ <fixed-eq:bank-sizes>]

The constants are chosen before any bank entries or thresholds are sampled.
  In particular, the number of tuples with one entry from each of the first $j - 1$ banks satisfies

#[#set math.equation(numbering: n => "(10.9)")
 $ Q_j := product_(i < j) M_i lt.eq 2^(j - 1) n^(B_j) . $ <fixed-eq:tuple-count>]

For the empty product, $Q_1 = 1$.

For such a tuple $bold(v) = \( v_1 \, dots.h \, v_(j - 1) \)$, define its cell by

#[#set math.equation(numbering: n => "(10.10)")
 $ S_j \( bold(v) \) = { z in { - 1 \, 1 }^n : \| R \( v_i \, z \) \| lt.eq
   3 t_i upright(" for every ") i < j } . $ <fixed-eq:cell>]

In particular $S_1 = { - 1 \, 1 }^n$. The cell restricts the small overlaps with the earlier references,
  while coverage will supply a large overlap with the current target inside that cell.

#thm([Lemma 10.2.])[
  (Simultaneous bank coverage).  #emph[With probability $1 - o \( 1 \)$, for every $1 lt.eq j lt.eq p$,
    every tuple $bold(v)$ from banks $1 \, dots.h \, j - 1$, and every $0 lt.eq k lt.eq m$,
$ x_k in S_j \( bold(v) \) quad arrow.r.double quad upright("there is ") ell lt.eq
  M_j upright(" such that ") V_(j \, ell) in S_j \( bold(v) \) \, quad \| R \( V_(j \, ell) \, x_k \) \| gt.eq q_(*) . $

 This event depends only on $J$, the chain and the bank lists, and is independent of the thresholds.]
] <fixed-lem:bank-coverage>

#proof[
  Intersect the $p$ disorder events from Corollary 22. Since $p$ is fixed, the intersection has probability $1 -
    o \( 1 \)$. On it, for every $S subset.eq { - 1 \, 1 }^n$ the set
  $ cal(B)_j \( S \) = { x in S : pi { z in S : \| R \( z \, x \) \| gt.eq q_(*) } < n^(- D_(3 \, j)) } $
  has $pi$-mass less than $n^(- D_(1 \, j))$.
  Fix a disorder in this intersection and condition on the complete first $j - 1$ banks.
    Each cell in (10.10) is then fixed. The path remains independent of these banks conditional on $J$,
    so (10.3) applies to every deterministic $k$. A union bound over all tuples and all indices gives
  #[#set math.equation(numbering: n => "(10.11)")
   $ bb(P) #h(-0.16667em) {x_k in cal(B)_j \( S_j \( bold(v) \) \) upright(" for some ") bold(v) \,
     k thin mid(bar.v) thin J \, upright(" banks ") 1 \, dots.h \, j - 1} lt.eq
     Q_j \( m + 1 \) n^(- D_(1 \, j)) . $ <fixed-eq:bad-target-bound>]
  This bound uses marginal stationarity, without requiring independence between different times.
  Now condition also on the entire chain. For a target $x_k$ in its cell but outside its bad set,
    acceptable references have $pi$-mass at least $n^(- D_(3 \, j))$.
    The entries of bank $j$ are still independent Gibbs draws under this conditioning.
    The chance that this bank misses that set is at most
  $ \( 1 - n^(- D_(3 \, j)) \)^(M_j) lt.eq exp \( - M_j n^(- D_(3 \, j)) \) lt.eq e^(- n) . $
  Another union bound gives $Q_j \( m + 1 \) e^(- n)$. Combining the two bounds and summing over the fixed number
    of banks, the total failure probability is at most
  #[#set math.equation(numbering: n => "(10.12)")
   $ o \( 1 \) + sum_(j = 1)^p Q_j \( m + 1 \) \( n^(- D_(1 \, j)) + e^(- n) \) =
     o \( 1 \) . $ <fixed-eq:coverage-failure>]
  Indeed $Q_j \( m + 1 \) = O \( n^(B_j + a + 1) \)$ and $D_(1 \, j) > B_j + a + 3$.
    Neither part of the event uses any threshold. ◻
]

#thm([Lemma 10.3.])[
  (Simultaneous bank locking).  #emph[With probability $1 - o \( 1 \)$, for every $i < j lt.eq p$,
    every entry $v$ of bank $i$, every entry $w$ of bank $j$, and every $0 lt.eq k lt.eq m$,
#[#set math.equation(numbering: n => "(10.13)")
 $ \| R \( x_k \, w \) \| gt.eq t_j \/ 2 \, wide \| R \( v \, x_k \) \| \, med \| R \( v \, w \) \| lt.eq b_j\
arrow.r.double wide \| \| R \( v \, x_k \) \| - \| R \( v \, w \) \| #scale(x: 120%, y: 120%)[\|] lt.eq
  2 delta_n . $ <fixed-eq:all-bank-locking>]

]
] <fixed-lem:bank-locking>

#proof[
  For fixed bank indices and deterministic $k$, the triple $\( v \, x_k \, w \)$ has law $pi^(⊗ 3)$ conditional on
    $J$. This follows from the independence of the two distinct banks and their independence from the stationary
    chain. Proposition 15, with $h = t_j \/ 2$ and cutoff $b_j$,
    bounds the averaged failure probability by $e^(- n^(9 \/ 10))$.
    There are only finitely many choices of $j$ for the large-$n$ threshold in that proposition.
    A union bound therefore gives the failure estimate
  #[#set math.equation(numbering: n => "(10.14)")
   $ sum_(i < j) \( m + 1 \) M_i M_j e^(- n^(9 \/ 10)) = o \( 1 \) . $ <fixed-eq:locking-failure>]
  Every bank exponent and $p$ are fixed, so the prefactor is polynomial. ◻
]

Let $cal(G)_n$ be the intersection of the events in the two lemmas. Then

#[#set math.equation(numbering: n => "(10.15)")
 $ bb(P) \( cal(G)_n^c \) = o \( 1 \) . $ <fixed-eq:good-event>]

It is determined by $J \, x_0 \, dots.h \, x_m$ and the bank lists.
  We have now obtained coverage and locking simultaneously for every choice the crossing construction can make;
  the thresholds remain independent of this event.

=== 10.3 A measurable construction of nested crossings <fixed-subsec:construction>

For a reference $v in { - 1 \, 1 }^n$, write $D_v \( k \) = \| R \( v \, x_k \) \|$.
  A single update changes at most one spin, so

#[#set math.equation(numbering: n => "(10.16)")
 $ \| D_v \( k + 1 \) - D_v \( k \) \| lt.eq 2 \/ n wide upright("for every ") v \, k . $ <fixed-eq:one-step>]

We select the first acceptable entry in each bank, in its given order.
  To keep every selected reference defined even on exceptional events,
  we specify both successful selections and defaults.

At level $1$, choose $v_1$ as the first entry of bank $1$ satisfying $D_(v_1) \( 0 \) gt.eq q_(*)$.
  If there is no such entry, set $v_1 = V_(1 \, 1)$, $tau_1 = 0$, and declare the construction inactive.
  If selection succeeds, set

#[#set math.equation(numbering: n => "(10.17)")
 $ tau_1 = min { 0 lt.eq k lt.eq m : D_(v_1) \( k \) lt.eq r_1 } $ <fixed-eq:first-crossing>]

when the set is nonempty, and declare the construction active.
  If that set is empty, set $tau_1 = 0$ and declare it inactive.

Suppose $j gt.eq 2$ and the earlier levels are defined. If the construction is active and $x_(tau_(j - 1)) in
  S_j \( v_1 \, dots.h \, v_(j - 1) \)$, select $v_j$ as the first entry of bank $j$ in that cell with

$ \| R \( v_j \, x_(tau_(j - 1)) \) \| gt.eq q_(*) . $

After a successful selection, search backwards from $tau_(j - 1)$:

#[#set math.equation(numbering: n => "(10.18)")
 $ tau_j = max { 0 lt.eq k lt.eq tau_(j - 1) : D_(v_j) \( k \) lt.eq r_j } $ <fixed-eq:backward-crossing>]

if this set is nonempty, keeping the construction active.
  If it is empty, retain the selected $v_j$, set $tau_j = 0$, and declare the construction inactive.
  If the construction was already inactive, the target was outside its cell, or the reference selection failed,
  set $v_j = V_(j \, 1)$ and $tau_j = 0$, and declare it inactive.
  An inactive construction stays inactive at all later levels.
  At every successful selection, the depth at the target is at least $q_(*) > 2 t_j gt.eq r_j$;
  hence any successful backwards crossing has $tau_j < tau_(j - 1)$.

The information used in these choices is central to the proof. Define

$ cal(W) = sigma \( J \, x_0 \, dots.h \, x_m \, upright(" all bank lists") \) \, wide cal(F)_0 = cal(W) \, wide
  cal(F)_j = cal(W) or sigma \( r_1 \, dots.h \, r_j \) . $

Induction through the explicit rules above gives

#[#set math.equation(numbering: n => "(10.19)")
 $ v_j upright(" is ") cal(F)_(j - 1) upright("-measurable") \, wide
   tau_j upright(" and the active flag after level ") j upright(" are ") cal(F)_j upright("-measurable") .
   $ <fixed-eq:filtration>]

In particular, neither the selection of $v_j$ nor any default for it uses $r_j$ or a later threshold.

Let $C_1$ denote successful selection of the first reference.
  On $C_1$ define $s_1 = "sgn" R \( v_1 \, x_0 \) in { - 1 \, 1 }$ and let

#[#set math.equation(numbering: n => "(10.20)")
 $ cal(S)_n = C_1 ∩ { upright("there exists ") 0 lt.eq k lt.eq m : s_1 R \( v_1 \, x_k \) lt.eq
   0 } . $ <fixed-eq:sign-passage>]

Take this event to be false outside $C_1$. Starting from signed overlap at least $q_(*)$,
  a sign passage must visit absolute overlap at most $2 \/ n$,
  because signed overlaps also change by at most $2 \/ n$. For sufficiently large $n$,
  it therefore forces the first crossing in (10.17).

#thm([Lemma 10.4.])[
  (Deterministic nesting).  #emph[For all sufficiently large $n$,
    on $cal(G)_n ∩ cal(S)_n$ every reference selection and every crossing succeeds. For every $1 lt.eq j lt.eq p$,
#[#set math.equation(numbering: n => "(10.21)")
 $ \| D_(v_j) \( tau_j \) - r_j \| lt.eq 2 \/ n \, wide \| D_(v_i) \( tau_j \) - r_i \| lt.eq
   6 j delta_n quad \( 1 lt.eq i lt.eq j \) . $ <fixed-eq:nested-shells>]

]
] <fixed-lem:nested-crossings>

#proof[
  At level $1$, simultaneous coverage ensures successful selection and $cal(S)_n$ ensures a crossing.
    The initial depth exceeds $r_1$. Minimality of $tau_1$ and (10.16) therefore put its depth in
    $\[ r_1 - 2 \/ n \, r_1 \]$, proving the assertions at that level.
  Assume the assertions through level $j - 1$, where $j gt.eq 2$. For every $i < j$,
  $ D_(v_i) \( tau_(j - 1) \) lt.eq 2 t_i + 6 \( j - 1 \) delta_n < 3 t_i $
  for large $n$. Thus the target is in its cell, and simultaneous coverage supplies an entry $v_j$ in that cell
    with new depth at least $q_(*)$. Both $D_(v_i) \( tau_(j - 1) \)$ and $\|
    R \( v_i \, v_j \) \|$ are at most $3 t_i$, which is less than $b_j$ because $3 t_i lt.eq 3 t_(j - 1) < b_j$.
    The new depth at the target is at least $q_(*) > t_j \/ 2$. Simultaneous locking gives
  #[#set math.equation(numbering: n => "(10.22)")
   $ \| \| R \( v_i \, v_j \) \| - r_i #scale(x: 120%, y: 120%)[\|] lt.eq \| D_(v_i) \( tau_(j - 1) \) -
     r_i #scale(x: 120%, y: 120%)[\|] + 2 delta_n lt.eq \( 6 \( j - 1 \) + 2 \) delta_n . $ <fixed-eq:reference-depth>]
  We next verify the locking hypotheses throughout the backwards search.
    At any visited index $k$ where the new depth is at least $t_j \/ 2$ and the old depths are at most $b_j$,
    locking implies
  $ D_(v_i) \( k \) lt.eq \| R \( v_i \, v_j \) \| + 2 delta_n lt.eq 3 t_i + 2 delta_n . $
  The gap $b_j - 3 t_(j - 1)$ is a fixed positive number. Hence (10.16) ensures that every old depth remains below
    $b_j$ at the next backwards step, for all sufficiently large $n$.
    Before a crossing, the new depth exceeds $r_j gt.eq t_j$; at the first crossing step it is at least $r_j -
    2 \/ n gt.eq t_j \/ 2$. Starting from the target, these observations prove by induction over the backwards
    steps that locking continues to apply up to and including the first crossing.
    If no crossing exists, the induction reaches index $0$.
  Throughout that portion of the search, locking and (10.22) give, for $i < j$,
  #[#set math.equation(numbering: n => "(10.23)")
   $ \| D_(v_i) \( k \) - r_i \| lt.eq \( 6 \( j - 1 \) + 4 \) delta_n . $ <fixed-eq:old-depths>]
  A crossing must occur: otherwise this inequality at $k = 0$ and $i = 1$ would imply
  $ q_(*) lt.eq D_(v_1) \( 0 \) lt.eq 2 t_1 + \( 6 \( j - 1 \) + 4 \) delta_n < q_(*) . $
  At the backwards crossing, the next index towards the target has depth strictly greater than $r_j$.
    Consequently $D_(v_j) \( tau_j \) in \[ r_j - 2 \/ n \, r_j \]$ by the one-step bound.
    Combining this with (10.23) proves (10.21). Since $p$, $q_(*)$, and all $t_i \, b_j$ are fixed,
    one sufficiently large value of $n$ makes every buffer used in the induction valid simultaneously. ◻
]

=== 10.4 Independent thresholds make the final shells unlikely <fixed-subsec:threshold-estimate>

The deterministic construction has reduced a sign passage to a single time at which all selected reference depths
  lie in narrow intervals about their thresholds. Define this event,
  using the references from the construction including its defaults, by

#[#set math.equation(numbering: n => "(10.24)")
 $ cal(A)_n = { upright("there exists ") 0 lt.eq k lt.eq m : \| D_(v_j) \( k \) - r_j \| lt.eq
   6 p delta_n upright(" for every ") 1 lt.eq j lt.eq p } . $ <fixed-eq:shell-event>]

Lemma 26, applied at $tau_p$, shows that

#[#set math.equation(numbering: n => "(10.25)")
 $ cal(G)_n ∩ cal(S)_n subset.eq cal(A)_n . $ <fixed-eq:sign-implies-shells>]

Fix a deterministic $k$ and set $E_(j \, k) = { \| D_(v_j) \( k \) - r_j \| lt.eq 6 p delta_n }$.
  By (10.19), its center $D_(v_j) \( k \)$ is $cal(F)_(j - 1)$-measurable,
  while $r_j$ is independent of $cal(F)_(j - 1)$ and uniform on an interval of length $t_j$. Thus

#[#set math.equation(numbering: n => "(10.26)")
 $ bb(P) \( E_(j \, k) divides cal(F)_(j - 1) \) lt.eq min { 1 \,
   12 p delta_n \/ t_j } . $ <fixed-eq:one-threshold-bound>]

The earlier events $E_(i \, k)$, $i < j$, are $cal(F)_(j - 1)$-measurable.
  Applying conditional expectation successively for $j = p \, p - 1 \, dots.h \, 1$ therefore gives

$ bb(P) #h(-0.16667em) (⋂_(j = 1)^p E_(j \, k) thin mid(bar.v) thin cal(W)) lt.eq product_(j = 1)^p min { 1 \,
  12 p delta_n \/ t_j } . $

The centers may depend on earlier thresholds; the displayed filtration is exactly what allows this product
  estimate. A union bound over the deterministic indices $k = 0 \, dots.h \, m$ now yields

#[#set math.equation(numbering: n => "(10.27)")
 $ bb(P) \( cal(A)_n \) lt.eq \( m + 1 \) product_(j = 1)^p frac(12 p delta_n, t_j) lt.eq
   C_(beta \, a) n^(a + 1 - p e_(*)) = o \( 1 \) . $ <fixed-eq:simultaneous-shell-bound>]

The exponent is less than $- 1$ by (10.5).

=== 10.5 A fast realized initial state forces a sign passage <fixed-subsec:tv-conclusion>

#proof[
  First consider continuous time and write
  $ q_n = bb(P)_(J \, thin x_0 tilde.op pi^J) { d^J \( x_0 \, t_n \) lt.eq 1 \/ 4 } . $
  The first reference is chosen using only $J \, x_0$ and bank $1$.
    Conditional on these variables, the future chain retains its transition law from the realized $x_0$.
    On $C_1$, define
  $ A = A \( J \, x_0 \, v_1 \) = { z in { - 1 \, 1 }^n : s_1 R \( v_1 \, z \) lt.eq 0 } . $
  Spin reversal preserves $pi$ and interchanges positive and negative overlaps, so $pi \( A \) gt.eq 1 \/ 2$.
    For any realized $J \, x_0$ with $d^J \( x_0 \, t_n \) lt.eq 1 \/ 4$, and any bank $1$ for which $C_1$ holds,
    the definition of total variation gives
  $ bb(P) { x_(N \( t_n \)) in A divides J \, x_0 \, upright("bank ") 1 } gt.eq 1 \/ 4 . $
  If $N \( t_n \) lt.eq m$, this endpoint event implies $cal(S)_n$.
    The Poisson process is independent of all the conditioning variables,
    so the error in (10.4) is uniform under this conditioning. Consequently
  #[#set math.equation(numbering: n => "(10.28)")
   $ bb(P) \( cal(S)_n \) & gt.eq \( 1 \/ 4 - eta_n \) bb(P) { d^J \( x_0 \, t_n \) lt.eq 1 \/ 4 \, med C_1 }\
 & gt.eq q_n \/ 4 - eta_n - 1 / 4 bb(P) \( C_1^c \) . $ <fixed-eq:fast-start-sign-bound>]
  The first-bank case of Lemma 24 gives $bb(P) \( C_1^c \) = o \( 1 \)$.
    Adding the independent thresholds does not change any probability in this comparison.
  Combining (10.15), (10.25), (10.27), and (10.28) gives the explicit estimate
  #[#set math.equation(numbering: n => "(10.29)")
   $ q_n / 4 lt.eq eta_n + 1 / 4 bb(P) \( C_1^c \) + bb(P) \( cal(G)_n^c \) + C_(beta \, a) n^(a + 1 - p e_(*)) =
     o \( 1 \) . $ <fixed-eq:fast-start-final-bound>]
  This proves (10.1).
  For discrete time set $k_n = floor.l n^a floor.r lt.eq m$ and
  $ q_n^(upright("disc")) = bb(P)_(J \, thin x_0 tilde.op pi^J) { d_(upright("disc"))^J \( x_0 \, k_n \) lt.eq
    1 \/ 4 } . $
  Use the same stationary discrete path, banks, scales and thresholds.
    Whenever the realized initial state is in the event defining $q_n^(upright("disc"))$ and $C_1$ holds,
    total variation now gives
  $ bb(P) { x_(k_n) in A divides J \, x_0 \, upright("bank ") 1 } gt.eq 1 \/ 4 . $
  This endpoint is among $x_0 \, dots.h \, x_m$, so it forces $cal(S)_n$ with no clock-tail error.
    The same argument therefore gives
  #[#set math.equation(numbering: n => "(10.30)")
   $ q_n^(upright("disc")) / 4 lt.eq 1 / 4 bb(P) \( C_1^c \) + bb(P) \( cal(G)_n^c \) +
     C_(beta \, a) n^(a + 1 - p e_(*)) = o \( 1 \) \, $ <fixed-eq:discrete-final-bound>]
  proving (10.1) directly.
  For each realized finite chain, total variation is nonincreasing in time,
    and in continuous time it is also continuous. Hence the first conclusion implies $T^J \( x_0 \) > n^a$.
    In discrete time it implies $T_(upright("disc"))^J \( x_0 \) > floor.l n^a floor.r$;
    this integer inequality gives $T_(upright("disc"))^J \( x_0 \) > n^a$.
    Finally, the Gibbs mass of each exceptional set lies in $\[ 0 \, 1 \]$ and has expectation tending to zero.
    Markov’s inequality makes that mass tend to zero in probability over $J$; conversely,
    convergence in probability of a bounded mass implies convergence of its expectation.
    This proves the asserted equivalent formulations. ◻
]

#heading(level: 1)[References]
#bibitem([1])[A.~Auffinger and W.-K.~Chen, On properties of Parisi measures,
  #emph[Probability Theory and Related Fields] #strong[161] (2015), 817--850.
  #link("https://doi.org/10.1007/s00440-014-0563-y")[doi:10.1007/s00440-014-0563-y]\;
  #link("https://arxiv.org/abs/1303.3573v1")[arXiv:1303.3573v1].]
#bibitem([2])[A.~S.~Bandeira, A.~El Alaoui and A.~Rödder,
  Mixing of Glauber dynamics on high overlap Gibbs measures, preprint (2026), version~1,
  #link("https://arxiv.org/abs/2607.06813v1")[arXiv:2607.06813v1].]
#bibitem([3])[J.~Barbier and N.~Macris, The adaptive interpolation method for proving replica formulas.
  Applications to the Curie--Weiss and Wigner spike models, #emph[J. Phys. A: Math.
  Theor.] #strong[52] (2019), 294002. #link("https://doi.org/10.1088/1751-8121/ab2735")[doi:10.1088/1751-8121/ab2735].]
#bibitem([4])[G.~Ben Arous and A.~Jagannath, Spectral gap estimates in mean field spin glasses, #emph[Comm. Math.
  Phys.] #strong[361] (2018), 1--52. #link("https://doi.org/10.1007/s00220-018-3152-6")[doi:10.1007/s00220-018-3152-6].]
#bibitem([5])[A.~Billoire, Distribution of timescales in the Sherrington--Kirkpatrick model, #emph[J. Stat.
  Mech.] (2010), P11034.
  #link("https://doi.org/10.1088/1742-5468/2010/11/P11034")[doi:10.1088/1742-5468/2010/11/P11034].]
#bibitem([6])[H.~J.~Brascamp and E.~H.~Lieb, On extensions of the Brunn--Minkowski and Prékopa--Leindler theorems,
  including inequalities for log concave functions, and with an application to the diffusion equation, #emph[J.
  Funct. Anal.] #strong[22] (1976), no.~4, 366--389.
  #link("https://doi.org/10.1016/0022-1236(76)90004-5")[doi:10.1016/0022-1236(76)90004-5].]
#bibitem([7])[W.-K.~Chen, Variational representations for the Parisi functional and the two-dimensional
  Guerra--Talagrand bound, #emph[Annals of Probability] #strong[45] (2017), no.~6A, 3929--3966.
  #link("https://doi.org/10.1214/16-AOP1154")[doi:10.1214/16-AOP1154]\;
  #link("https://arxiv.org/abs/1501.06635v2")[arXiv:1501.06635v2].]
#bibitem([8])[A.~El Alaoui, A.~Montanari and M.~Sellke, Sampling from the Sherrington--Kirkpatrick Gibbs measure
  via algorithmic stochastic localization, #emph[Proc. 63rd IEEE FOCS] (2022), 323--334. Extended version:
  #link("https://arxiv.org/abs/2203.05093v2")[arXiv:2203.05093v2].]
#bibitem([9])[F.~Guerra, Broken replica symmetry bounds in the mean field spin glass model, #emph[Comm. Math.
  Phys.] #strong[233] (2003), 1--12. #link("https://doi.org/10.1007/s00220-002-0773-5")[doi:10.1007/s00220-002-0773-5].]
#bibitem([10])[A.~Jagannath and I.~Tobasco, Some properties of the phase diagram for mixed $p$-spin glasses,
  #emph[Probability Theory and Related Fields] #strong[167] (2017), 615--672.
  #link("https://doi.org/10.1007/s00440-015-0691-z")[doi:10.1007/s00440-015-0691-z]\;
  #link("https://arxiv.org/abs/1504.02731v2")[arXiv:1504.02731v2].
  Numbered propositions and corollaries cited here refer to this preprint version.]
#bibitem([11])[C.~Monthus and T.~Garel, Eigenvalue method to compute the largest relaxation time of disordered
  systems, #emph[J. Stat. Mech.] (2009), P12017.
  #link("https://doi.org/10.1088/1742-5468/2009/12/P12017")[doi:10.1088/1742-5468/2009/12/P12017].]
#bibitem([12])[J.-C.~Mourrat, Free energy upper bound for mean-field vector spin glasses, preprint (2020),
  #link("https://arxiv.org/abs/2010.09114")[arXiv:2010.09114].
  The cited equations refer to the
  #link("https://perso.ens-lyon.fr/jean-christophe.mourrat/genbound.pdf")[author-hosted manuscript].]
#bibitem([13])[D.~Panchenko, Free energy in the mixed $p$-spin models with vector spins, #emph[Ann.
  Probab.] #strong[46] (2018), no.~2, 865--896. #link("https://doi.org/10.1214/17-AOP1194")[doi:10.1214/17-AOP1194].]
#bibitem([14])[G.~Parisi, A sequence of approximated solutions to the S-K model for spin glasses, #emph[J. Phys.
  A: Math. Gen.] #strong[13] (1980), no.~4, L115--L121.
  #link("https://doi.org/10.1088/0305-4470/13/4/009")[doi:10.1088/0305-4470/13/4/009].]
#bibitem([15])[M.~Sellke, Exponentially slow mixing of the low temperature SK model, preprint (2025), version~2,
  #link("https://arxiv.org/abs/2511.22621v2")[arXiv:2511.22621v2].]
#bibitem([16])[D.~Sherrington and S.~Kirkpatrick, Solvable model of a spin-glass, #emph[Phys. Rev.
  Lett.] #strong[35] (1975), no.~26, 1792--1796.
  #link("https://doi.org/10.1103/PhysRevLett.35.1792")[doi:10.1103/PhysRevLett.35.1792].]
#bibitem([17])[M.~Talagrand, The Parisi formula, #emph[Ann. of Math. (2)] #strong[163] (2006), no.~1, 221--263.
  #link("https://doi.org/10.4007/annals.2006.163.221")[doi:10.4007/annals.2006.163.221].]
#bibitem([18])[M.~Talagrand, Mean field models for spin glasses:
  some obnoxious problems, in E.~Bolthausen and A.~Bovier (eds.), #emph[Spin Glasses],
  Lecture Notes in Mathematics #strong[1900], Springer, Berlin, 2007, 63--80.
  #link("https://doi.org/10.1007/978-3-540-40908-3_3")[doi:10.1007/978-3-540-40908-3\_3].]
