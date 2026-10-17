#set page(paper: "us-letter", margin: (x: 80.9pt, y: 80.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A spectral gap throughout the high-temperature \
Sherrington--Kirkpatrick phase]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The theorem and the structure of the proof <sec:introduction>

How quickly does local resampling remove fluctuations in a densely coupled spin system? For the Sherrington–Kirkpatrick model [19], the signs of the interactions matter: each spin interacts weakly with every other spin, but the sum of the absolute interaction strengths grows with the dimension. We study heat-bath dynamics, which updates a spin from its conditional Gibbs law, in the tradition of Glauber’s local stochastic dynamics [17]. Our result is a dimension-independent Poincaré inequality throughout the high-temperature phase, at each fixed inverse temperature below one. It controls every real observable on a single event of disorder probability tending to one.

Fix $0 < beta < 1$ and put $j = beta^2$. Let $J$ be a real symmetric $n times n$ matrix with zero diagonal and independent off-diagonal entries $J_(i j) tilde.op N \( 0 \, j \/ n \)$, $i < j$. For a field $h in bb(R)^n$, write

$ mu_h \( x \) = 1 / Z_h exp {1 / 2 x^(sans(T)) J x + h^(sans(T)) x} \, #h(2em) x in { - 1 \, 1 }^n . $

Let $P_i^h$ denote conditional expectation under $mu_h$ given all spins except the $i$th. Define the unscaled Dirichlet form

#[#set math.equation(numbering: n => "(1.1)")
 $ cal(D)_h \( f \) = sum_(i = 1)^n bb(E)_(mu_h) \( f - P_i^h f \)^2 . $ <eq:dirichlet>]

We use a rate-one clock at each site in continuous time, giving the generator $cal(L)_h = sum_i \( P_i^h - I \)$. A discrete attempt selects one site uniformly and has transition operator $P_h = n^(- 1) sum_i P_i^h$. Thus $cal(L)_h = n \( P_h - I \)$, and the discrete gap is the continuous gap divided by $n$. The gap of a reversible generator is the infimum of its Dirichlet form divided by the variance, over all nonconstant functions.

#thm([Theorem 1.1.])[
  #emph[There is a finite constant $C_beta$, depending only on $beta$, such that 
$ bb(P)_J {"Var"_(mu_0) \( f \) lt.eq C_beta cal(D)_0 \( f \) upright(" for every ") f : { - 1 \, 1 }^n arrow.r bb(R)} arrow.r 1 . $

 Consequently, the discrete-time heat-bath chain that chooses a uniform site has spectral gap at least $1 \/ \( C_beta n \)$ with probability tending to one.]
] <thm:main>

The parameter $beta$ is fixed before $n$ tends to infinity; the constant $C_beta$ may depend on that fixed choice. External fields enter the proof through posterior Gibbs laws, while the theorem concerns $mu_0$. The diagonal convention is immaterial to the Gibbs law: because $x_i^2 = 1$, adding any diagonal matrix to $J$ adds a constant to the Hamiltonian. This observation will let us introduce a Gaussian diagonal for matrix calculations and remove it again.

=== 1.1 Earlier results and methods <earlier-results-and-methods>

The interval $beta < 1$ is the classical zero-field high-temperature range. Aizenman, Lebowitz, and Ruelle [2] Proposition 2.1 proved that $n^(- 1) log Z_0$ converges in probability and in mean to $log 2 + beta^2 \/ 4$, the annealed free-energy value, throughout this interval. The dynamical question is whether local resampling also removes fluctuations at a rate independent of the system size.

A basic route to such a bound controls conditional influences. Wu [24] proved a Poincaré inequality under a Dobrushin spectral-radius condition on a matrix of nonnegative conditional influences. In dense SK systems, stronger fixed-temperature estimates become possible by exploiting the signed random interactions. Bauerschmidt and Bodineau [6] used a Gaussian field decomposition to prove a high-temperature logarithmic Sobolev inequality; its full spin-flip energy differs from the heat-bath form (1.1). Eldan, Koehler, and Zeitouni [16] established a spectral condition for the heat-bath gap, yielding the SK range $beta < 1 \/ 4$. Adhikari, Brennecke, Xu, and Yau [1] obtained constant unscaled gaps for mixed $p$-spin models under a sufficiently small weighted condition on their interaction coefficients.

For mixing in single-site discrete attempts, Anari, Jain, Koehler, Pham, and Vuong [3] used entropic independence to prove an $O \( n log n \)$ bound in the SK range $beta < 1 \/ 4$. Anari, Koehler, and Vuong [4] extended this order to an inverse-temperature threshold approximately equal to $0.295$. More recently, Wang [23] Theorem 1.1 proved worst-start mixing in $O_beta \( n log \( n \/ epsilon \) \)$ attempts for every fixed $beta < 1 \/ 2$, simultaneously over external fields. Boban, Li, and Oveis Gharan [7] Theorem 1.5 and Corollary 1.6 obtained a constant unscaled gap and $O \( n^2 \)$ zero-field mixing for $beta < 1 \/ 2 + epsilon_0$, with an absolute $epsilon_0 gt.eq 5 dot.op 10^(- 5)$. Theorem 1 reaches every fixed $beta < 1$ at zero field.

Equilibrium covariance estimates already cover this entire range. El Alaoui and Gaitonde [12] Theorem 1.1 proved that the expected operator norm of the zero-field spin covariance matrix stays bounded for every fixed $beta < 1$. Brennecke, Schertzer, Xu, and Yau [9] Theorem 1.1 proved the operator-norm approximation

$ ∥"Cov"_(mu_0) \( x \) - #scale(x: 120%, y: 120%)[\(] \( 1 + beta^2 \) I - J #scale(x: 120%, y: 120%)[\)]^(- 1)∥ arrow.r 0 #h(2em) upright("in probability") . $

For $a in bb(R)^n$, the variance of the linear observable $a^(sans(T)) x$ is $a^(sans(T)) "Cov"_(mu_0) \( x \) a$. These covariance results therefore control linear fluctuations. The all-functions heat-bath inequality requires additional estimates; our proof obtains them at the random posterior fields generated by Gaussian observations.

Our argument transfers a functional inequality along stochastic localization, introduced by Eldan [15]. We use its Gaussian-observation representation developed by El Alaoui and Montanari [13]. The variance-retention and Dirichlet-form framework of Chen and Eldan [11] explains how posterior estimates can imply an inequality for the initial law. Here an observation event of exponentially small probability can still carry substantial variance for a particular test function. We control its probability after weighting paths by the square of that function. The entropy calculation is a stopped finite-mixture version of the drift-energy representation; see Lehec [18] and the work of Föllmer discussed there.

Gaussian observations, planted laws, and approximate message passing (AMP) are also combined in the SK sampling method of El Alaoui, Montanari, and Sellke [14]. Celentano [10] proved local convexity of the TAP free energy used by that sampler near sufficiently late AMP iterates. Our argument needs invertibility at every sufficiently accurate solution of the field equation along the observation path. A scalar entropy inequality and a local-volume estimate give this uniformity in Section 5. The field recursions retain the Onsager correction of the Thouless–Anderson–Palmer equations [21] and are related to Bolthausen’s iterative construction [8]. We initialize them at a Gibbs spin sample and use exact conditional-spin identities through a fixed finite depth, without requiring convergence of the recursion. Finally, the terminal gap adapts Wang’s signed two-spin method [23]; Section 8 proves the variant with an entrywise-square cost and a quartic row error.

=== 1.2 Notation and elementary identities <notation-and-elementary-identities>

For a vector $v$, set $chevron.l v chevron.r = n^(- 1) sum_i v_i$ and let $D_v$ be the diagonal matrix with diagonal $v$. Vector products and scalar functions of vectors are understood coordinatewise. Unless another subscript is displayed, $lr(bar.v.double dot.op bar.v.double)$ is Euclidean norm for vectors and operator norm for matrices; $lr(bar.v.double dot.op bar.v.double)_(upright(F))$ is Frobenius norm. A centered Gaussian orthogonal ensemble (GOE) matrix of scale $j$ has variances $j \/ n$ off diagonal and $2 j \/ n$ on the diagonal.

If $x^(\( i \))$ is obtained by flipping the $i$th spin, put

$ d_i f \( x \) = frac(f \( x \) - f \( x^(\( i \)) \), 2 x_i) \, #h(2em) \( nabla u \)_(i j) = d_j u_i . $

Thus $d_i f$ is independent of $x_i$ and

#[#set math.equation(numbering: n => "(1.2)")
 $ d_i \( f g \) = f thin d_i g + g thin d_i f - 2 x_i \( d_i f \) \( d_i g \) . $ <eq:discrete-product>]

At a fixed field $h_0$ set

$ h^1 = h_0 + J x \, #h(2em) m^1 = tanh h^1 \, #h(2em) v^1 = "sech"^2 h^1 . $

Since $J_(i i) = 0$, $m_i^1$ and $v_i^1$ are respectively the conditional mean and variance of $x_i$. In particular,

#[#set math.equation(numbering: n => "(1.3)")
 $ cal(D)_(h_0) \( f \) = bb(E)_(mu_(h_0)) sum_i v_i^1 \( d_i f \)^2 \, #h(2em) lr(bar.v.double G bar.v.double)_(*)^2 = bb(E)_(mu_(h_0)) G^2 + cal(D)_(h_0) \( G \) . $ <eq:dirichlet-gradient>]

For probability laws $nu \, mu$, their relative entropy is $D \( nu bar.v.double mu \) = integral log \( upright(d) nu \/ upright(d) mu \) thin upright(d) nu$ when $nu lt.double mu$, and $+ oo$ otherwise.

Constants are independent of $n$; dependence on a fixed temperature, construction depth, or positive stability margin is recorded at its use. Their values may change between displays. The prerequisites are Gaussian concentration and comparison, Gaussian integration by parts, and stochastic calculus. We prove the model-specific estimates in the sections below.

=== 1.3 The proof mechanism <the-proof-mechanism>

There are two parts to the argument: prove useful inequalities for posterior Gibbs laws, then transfer them to the unobserved law. A long but fixed observation makes most individual spins predictable. The corresponding small conditional variances, combined with a two-spin curvature inequality, give a terminal gap. To recover the initial variance, we need a directional covariance estimate along the path and a mean estimate under square reweighting. The former bounds the loss of variance; the latter prevents that variance from accumulating on exceptional paths.

The posterior estimates come from finite Onsager-corrected recursions. Exact conditional-spin identities control their residuals. A telescoping identity for the squared increments then selects two consecutive small increments without requiring convergence of the recursion. Uniform matrix estimates handle the resulting adaptive diagonal coefficients under an explicit inverse margin. To compare these approximate fields with an exact root, stability must hold throughout the small-residual region and persist when the diagonal variance matrix is replaced by the nearby response coefficients used in the comparison. A scalar entropy estimate controls a Gaussian integral, and a local-volume lower bound turns that integral control into exclusion of unstable approximate roots. All tolerances and finite depths are chosen before the large-$n$ limit.

=== 1.4 The three inputs <the-three-inputs>

We observe a spin sample in independent Gaussian noise:

#[#set math.equation(numbering: n => "(1.4)")
 $ X tilde.op mu_0 \, #h(2em) Y \( t \) = t X + B \( t \) \, quad 0 lt.eq t lt.eq T \, $ <eq:observation-process>]

where $B$ is standard $n$-dimensional Brownian motion independent of $X$. Conditional on the observations up to $t$, the spin law is $mu_(Y \( t \))$. The proof uses the following three inputs, established in the later sections.

+ #strong[Stability along ordinary observation paths.] Proposition 9 gives a deterministic notion of a good field such that, for typical $J$, all fields $Y \( t \)$ are good except on an event of observation probability at most $e^(- a n)$, where $a > 0$ is fixed.
+ #strong[Two estimates at a good field.] For every $G$, Proposition 23 proves
  #[#set math.equation(numbering: n => "(1.5)")
   $ lr(bar.v.double "Cov"_(mu_h) \( G \, x \) bar.v.double)^2 lt.eq C #scale(x: 120%, y: 120%)[\(] "Var"_(mu_h) \( G \) + cal(D)_h \( G \) #scale(x: 120%, y: 120%)[\)] . $ <eq:input-directional>]
  For $N = bb(E)_(mu_h) f^2 > 0$ and $nu = f^2 mu_h \/ N$, Proposition 24 proves, for each sufficiently small fixed $delta > 0$,
  #[#set math.equation(numbering: n => "(1.6)")
   $ lr(bar.v.double bb(E)_nu x - t_(*) \( h \) bar.v.double) / sqrt(n) lt.eq C delta + C_delta / sqrt(n) (1 + frac(cal(D)_h \( f \), N)) . $ <eq:input-weighted>]
  Here $t_(*) \( h \) = tanh r \( h \)$, where $r \( h \)$ is the unique solution of
  $ r - h + { j \( 1 - n^(- 1) parallel tanh r parallel^2 \) I - J } tanh r = 0 . $
  Existence and uniqueness at the fields under consideration are part of Lemma 15. The constant $C$ is independent of $delta$; $C_delta$ may depend on it. Taking $f = 1$ gives the same comparison for $bb(E)_(mu_h) x$.
+ #strong[A terminal gap.] For a sufficiently large fixed $T$, Proposition 27 gives $"Var"_(mu_(Y \( T \))) f lt.eq 2 cal(D)_(Y \( T \)) \( f \)$ outside an event of ordinary observation probability at most $e^(- a n)$.

The transfer uses the two estimates for different purposes. Directional covariance controls posterior variance loss, while square-reweighted means bound the entropy of the changed observation law. Their combination controls the contribution of the bad paths before the terminal gap is applied. Section 2 proves this implication first, so the later technical sections have a precise target.

=== 1.5 Organization <organization>

After the observation transfer in Section 2, Section 3 constructs the matrix diagnostics used by the adaptive field calculations. Sections 4 and 5 identify the scalar equality law and establish stability along observations. Section 6 develops the finite recursions and their weak residual rules; Section 7 uses them to prove the two posterior estimates. Section 8 closes the argument with the fixed-time terminal gap.

== 2 From posterior estimates to a spectral gap <sec:observation>

We now prove the transfer announced in the introduction. Its inputs are a covariance bound, a square-reweighted mean bound, and a terminal gap. The stopping rule and good-disorder event must be independent of the test function, so we keep the exceptional-path estimate explicit. The argument uses the Gaussian-channel formulation of localization [13] and the variance/Dirichlet-form framework of [11]; the finite-spin identities are derived here.

=== 2.1 Posterior martingales and Dirichlet forms <posterior-martingales-and-dirichlet-forms>

Let $cal(F)_t = sigma \( Y \( s \) : s lt.eq t \)$ and write $bb(E)_t$ for expectation under $mu_(Y \( t \))$. Bayes’ formula gives this posterior: the likelihood of an observation path given $X = x$ is proportional to $exp \( x^(sans(T)) Y \( t \) - t n \/ 2 \)$. The process

$ I \( t \) = Y \( t \) - integral_0^t bb(E)_s x thin upright(d) s $

is the innovation Brownian motion in $cal(F)_t$: conditional expectation makes it a continuous martingale, and its quadratic covariation is $t I_n$. The Brownian martingale characterization therefore applies. Applying Itô’s formula to the finitely many posterior weights gives, for every spin function $g$,

#[#set math.equation(numbering: n => "(2.1)")
 $ upright(d) \( bb(E)_t g \) = "Cov"_t \( g \, x \)^(sans(T)) upright(d) I \( t \) . $ <eq:filtering>]

To verify the cancellation, differentiate the posterior expectation with respect to $Y$; its gradient is $"Cov"_t \( g \, x \)$. Each likelihood weight $exp \( x^(sans(T)) Y \( t \) - t n \/ 2 \)$ satisfies a stochastic exponential equation. The quotient rule for their weighted sums then gives (2.1): subtracting $bb(E)_t x thin upright(d) t$ from $upright(d) Y$ removes the finite-variation term.

At every deterministic time,

#[#set math.equation(numbering: n => "(2.2)")
 $ bb(E) cal(D)_(Y \( t \)) \( f \) lt.eq cal(D)_0 \( f \) . $ <eq:dirichlet-monotonicity>]

This is conditional-variance contraction: the $i$th summand on the left is $bb(E) "Var" \( f \( X \) divides X_(- i) \, cal(F)_t \)$, and the one on the right is $bb(E) "Var" \( f \( X \) divides X_(- i) \)$. The conditional variance decomposition gives the inequality after averaging over observations. In this section, an expectation without a field subscript refers to that experiment, with $J$ held fixed.

=== 2.2 Stopping before stability fails <stopping-before-stability-fails>

Stop before the first possible loss of the field estimates. More precisely, fix the terminal horizon $T$, take the observation stopping time $tau_0$ from Corollary 10, and set $tau = T and tau_0$. This rule does not use the test function. Before $tau$, stability holds through residual threshold $rho_0 sqrt(n)$, so both posterior estimates apply. On the specified matrix event, $bb(P) \( tau_0 lt.eq T \) lt.eq e^(- a n)$.

For a fixed $J$, choose the canonical terminal good set

$ cal(T)_n \( J \) = { h : "Var"_(mu_h) \( g \) lt.eq 2 cal(D)_h \( g \) upright(" for every ") g } . $

Membership means positivity of a finite-dimensional symmetric quadratic form with coefficients continuous in $h$, so this set is Borel. Proposition 27 controls the probability that $Y \( T \)$ misses it. Declare the stopped path bad if $tau_0 lt.eq T$, or if $tau_0 > T$ and $Y \( T \) in.not cal(T)_n \( J \)$. The event is $cal(F)_tau$-measurable: before $T$ only stopping can make it bad, and at $T$ the remaining condition is determined by $Y \( T \)$. The two failure probabilities give, on the typical matrix events,

#[#set math.equation(numbering: n => "(2.3)")
 $ bb(P) \( upright("bad") \) lt.eq 2 e^(- a n) $ <eq:ordinary-bad>]

for a fixed $a > 0$, after decreasing the rate if necessary.

Suppose $bb(E)_(mu_0) f = 0$ and $bb(E)_(mu_0) f^2 = 1$. Set

$ M_t = bb(E)_t f \, quad N_t = bb(E)_t f^2 \, quad V_t = N_t - M_t^2 \, quad d_0 = cal(D)_0 \( f \) . $

By (2.1) and optional stopping, $u \( t \) = bb(E) V_(t and tau)$ is absolutely continuous and satisfies, almost everywhere,

$ u' \( t \) = - bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ t < tau }) lr(bar.v.double "Cov"_t \( f \, x \) bar.v.double)^2 #scale(x: 120%, y: 120%)[\]] . $

The directional estimate bounds the loss term before stopping. Together with (2.2), applied at the deterministic time $t$, it gives $u' \( t \) gt.eq - C_(upright(d)) \( u \( t \) + d_0 \)$, with fixed $C_(upright(d))$. Solving this scalar inequality from $u \( 0 \) = 1$ yields

#[#set math.equation(numbering: n => "(2.4)")
 $ bb(E) V_tau gt.eq v - \( 1 - v \) d_0 \, #h(2em) v = e^(- C_(upright(d)) T) > 0 . $ <eq:variance-lower>]

All uses of optional stopping here are at bounded times and for bounded random variables at each fixed $n$.

=== 2.3 Changing the law of the observations <changing-the-law-of-the-observations>

The variance lower bound alone does not control how much variance lies on bad paths. For that purpose change the initial spin law to $f^2 mu_0$, which is a probability law by normalization, and call the resulting observation law $bb(P)^f$. Its density on $cal(F)_t$ is $N_t$, and its spin posterior is $nu_t = f^2 mu_(Y \( t \)) \/ N_t$. Since $mu_(Y \( t \))$ has full support and $f$ is nonzero, $N_t > 0$. Bounded stopping gives the density $N_tau$ on $cal(F)_tau$. Let

$ a_t = bb(E)_(nu_t) x - bb(E)_t x . $

Equation (2.1) with $g = f^2$ gives $upright(d) N_t \/ N_t = a_t^(sans(T)) upright(d) I \( t \)$. Under $bb(P)^f$, $I$ has drift $a_t$. The drift-energy entropy identity, in the form discussed by Lehec [18], has a direct finite-mixture proof here. Itô’s formula for $log N_t$ yields

#[#set math.equation(numbering: n => "(2.5)")
 $ D #scale(x: 120%, y: 120%)[\(] bb(P)^f \|_(cal(F)_tau) thin bar.v.double thin bb(P) \|_(cal(F)_tau) #scale(x: 120%, y: 120%)[\)] = bb(E)^f log N_tau = 1 / 2 bb(E)^f integral_0^tau lr(bar.v.double a_t bar.v.double)^2 thin upright(d) t . $ <eq:stopped-entropy>]

The stopped identity needs no limiting integrability argument. At fixed $n$, the drift satisfies $lr(bar.v.double a_t bar.v.double) lt.eq 2 sqrt(n)$ and $tau lt.eq T$. Novikov’s condition therefore holds, and the stochastic integral in the log-density formula has zero mean.

Before stopping, applying (1.6) to $f$ and to $1$ gives

$ b_t := lr(bar.v.double a_t bar.v.double) / sqrt(n) lt.eq 2 C_(upright(w)) delta + C_delta / sqrt(n) (2 + frac(cal(D)_(Y \( t \)) \( f \), N_t)) . $

Since $b_t lt.eq 2$, we may use $b_t^2 lt.eq 2 b_t$. At deterministic $t$, the density identity and (2.2) imply

#[#set math.equation(numbering: n => "(2.6)")
 $ bb(E)^f frac(cal(D)_(Y \( t \)) \( f \), N_t) = bb(E) cal(D)_(Y \( t \)) \( f \) lt.eq d_0 . $ <eq:weighted-dirichlet>]

Write $cal(H)_tau$ for the entropy in (2.5). The preceding estimates give the quantitative bound

#[#set math.equation(numbering: n => "(2.7)")
 $ cal(H)_tau / n lt.eq 2 C_(upright(w)) T delta + frac(C_delta T, sqrt(n)) \( 2 + d_0 \) . $ <eq:entropy-bound>]

The separation of constants is essential: $C_(upright(w))$ is independent of $delta$, whereas $C_delta$ may grow when $delta$ decreases. We next convert this entropy bound into a bound on the bad-path probability. If an event has probabilities $p$ and $q$ under two laws, the log-sum inequality for the event and its complement bounds relative entropy below by $p log \( 1 \/ q \) - log 2$. With $p = bb(P)^f \( upright("bad") \)$, (2.3) therefore gives, for large $n$,

$ p lt.eq frac(cal(H)_tau + log 2, a n - log 2) . $

If the ordinary bad probability is zero, absolute continuity gives $p = 0$. For $d_0 lt.eq 1$, (2.7) therefore implies

#[#set math.equation(numbering: n => "(2.8)")
 $ p lt.eq frac(4 C_(upright(w)) T, a) delta + frac(6 C_delta T, a sqrt(n)) + frac(2 log 2, a n) . $ <eq:weighted-bad-bound>]

Choose $delta > 0$ once so that the first term is at most $v \/ 8$. With this choice fixed, enlarge $n$ until the last two terms sum to at most $v \/ 8$. The resulting bound holds simultaneously for all normalized $f$ with $d_0 lt.eq 1$:

#[#set math.equation(numbering: n => "(2.9)")
 $ bb(P)^f \( upright("bad") \) lt.eq v \/ 4 . $ <eq:weighted-bad>]

Figure 1 records how the two posterior estimates will control the stopped variance and its exceptional contribution.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[Ordinary rarity $bb(P) \( upright("bad") \) lt.eq 2 e^(- a n)$
], table.cell(rowspan: 1, colspan: 1)[Weighted-mean estimate $cal(H)_tau / n lt.eq 2 C_(upright(w)) T delta + frac(C_delta T, sqrt(n)) \( 2 + d_0 \)$
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$arrow.b.double$entropy inequality; choose $delta$, then $n$
],
  table.cell(rowspan: 1, colspan: 2, align: center)[Variance on bad paths $bb(E) \[ upright(bold(1))_(upright("bad")) V_tau \] lt.eq bb(E) \[ upright(bold(1))_(upright("bad")) N_tau \] = bb(P)^f \( upright("bad") \) lt.eq v \/ 4$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$terminal gap on good paths $bb(E) \[ upright(bold(1))_(upright("good")) V_tau \] lt.eq 2 d_0$
],
  table.cell(rowspan: 1, colspan: 1)[Directional covariance estimate $bb(E) V_tau gt.eq v - \( 1 - v \) d_0$
], table.cell(rowspan: 1, colspan: 1)[Total remaining variance $bb(E) V_tau lt.eq 2 d_0 + v \/ 4$
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$v - \( 1 - v \) d_0 lt.eq 2 d_0 + v \/ 4 #h(2em) arrow.r.double #h(2em) d_0 gt.eq v \/ 4$
],
)
]],
  caption: [Figure 1: Variance retention and control of exceptional paths, for a fixed typical matrix. Normalize $f$ by $bb(E)_(mu_0) f = 0$ and $bb(E)_(mu_0) f^2 = 1$, and put $d_0 = cal(D)_0 \( f \) lt.eq 1$. Along $Y \( t \) = t X + B \( t \)$, let $V_t = "Var"_(mu_(Y \( t \))) f$, $N_t = bb(E)_(mu_(Y \( t \))) f^2$, and $tau = T and tau_0$. Here $cal(H)_tau$ is the relative entropy of the stopped observation law induced by the spin law $f^2 mu_0$, relative to the ordinary law, and $v = e^(- C_(upright(d)) T)$. The density $N_tau$ converts its bad-path probability into an upper bound on exceptional variance. If $d_0 > 1$, the final lower bound is automatic. ],
) <fig:observation-flow>

=== 2.4 Completion of the theorem <completion-of-the-theorem>

We can now close the argument, keeping the order of choices explicit. First choose $T$ from the terminal estimate. Next choose the stable-field constants, the ordinary failure rate $a$, and the finite diagnostic length for the directional estimate; these choices determine $C_(upright(d))$ and $v$. Root stability and the operator bound on $J$ determine the leading weighted-mean constant $C_(upright(w))$ independently of selection depth. We may therefore select $delta$ in (2.8), then its diagnostic length and $C_delta$, and finally $n_0$. Every depth and tolerance is fixed before $n$ grows.

With the choices made, the proof needs a finite intersection of matrix events. Include the directional word event and the word events for the selected weighted-mean construction, each with its fixed length and coefficient bounds. Lemma 2 accommodates each fixed $M_0$, and Lemma 18 supplies an actual inverse margin independent of depth. Add the events of Propositions 9 and 27. Their intersection still has probability tending to one, and all constants and the threshold $n_0$ are uniform on it and over the test functions.

For such a matrix and a normalized $f$ with $d_0 lt.eq 1$, use $V_tau lt.eq N_tau$ and the stopped density identity to obtain

$ bb(E) \[ upright(bold(1))_(upright("bad")) V_tau \] lt.eq bb(E) \[ upright(bold(1))_(upright("bad")) N_tau \] = bb(P)^f \( upright("bad") \) lt.eq v \/ 4 . $

On a good path $tau = T$ and the terminal gap applies, so

$ bb(E) \[ upright(bold(1))_(upright("good")) V_tau \] lt.eq 2 bb(E) cal(D)_(Y \( T \)) \( f \) lt.eq 2 d_0 . $

Combining these estimates with (2.4) gives

$ v - \( 1 - v \) d_0 lt.eq 2 d_0 + v \/ 4 \, #h(2em) upright("hence") #h(2em) d_0 gt.eq frac(3 v, 4 \( 3 - v \)) gt.eq v / 4 . $

The case $d_0 > 1$ already satisfies this bound. Center and rescale any nonconstant function to obtain Theorem 1 once the three inputs have been proved, with the finite constant $C_beta = 4 e^(C_(upright(d)) T)$. We do not optimize this constant. For the clock conversion, the self-adjoint operator $H = sum_i \( I - P_i^0 \)$ has form $cal(D)_0$, and one discrete attempt is $I - H \/ n$. Its gap is therefore the asserted unscaled gap divided by $n$.

== 3 Uniform random-matrix estimates <sec:matrices>

The field analysis uses random-matrix estimates in two forms. Finite field recursions produce products whose diagonal coefficients may be chosen after the disorder is observed. Lemma 2 controls such products of bounded length, subject to a separate positivity margin whenever an inverse occurs. We also obtain fixed-vector bilinear estimates and a simultaneous determinant bound for the stability argument in Section 5. Their expectation calculations use the same inverse identity. We begin with fixed deterministic coefficients and then use concentration and finite meshes to obtain the required simultaneous estimates.

Throughout this section, $j in \( 0 \, 1 \)$ is fixed. A centered GOE matrix $W$ has independent entries on and above the diagonal, with

$ bb(E) W_(a b)^2 = j \/ n quad \( a < b \) \, #h(2em) bb(E) W_(a a)^2 = 2 j \/ n . $

We couple $J$ to $W$ by putting $J = W - D_("diag" W)$. In particular, the off-diagonal law of $J$ is the law used in the theorem. Fix $eta > 0$ so that, with $a_(+) = 1 + eta$,

#[#set math.equation(numbering: n => "(3.1)")
 $ j a_(+)^2 < 1 . $ <eq:matrix-subcritical>]

For a nonnegative diagonal matrix $A lt.eq a_(+) I$, put

#[#set math.equation(numbering: n => "(3.2)")
 $ chi_A = 1 / n "Tr" A \, #h(2em) B_A = j chi_A \, #h(2em) K_A \( M \) = K_A \( 1 \; M \) \,\
K_A \( z \; M \) = \( I - z A M + z^2 B_A A \)^(- 1) . $ <eq:K>]

The associated symmetric matrix is

$ S_A \( z \; M \) = I + z^2 B_A A - z A^(1 \/ 2) M A^(1 \/ 2) . $

The symmetric matrix lets us control the inverse without imposing a positive lower bound on the individual diagonal entries of $A$. Whenever $S_A \( z \; M \)$ is invertible, the following identities hold:

#[#set math.equation(numbering: n => "(3.3)")
 $ K_A \( z \; M \) & = I + A^(1 \/ 2) S_A \( z \; M \)^(- 1) A^(1 \/ 2) \( z M - z^2 B_A I \) \,\
K_A \( z \; M \) A & = A^(1 \/ 2) S_A \( z \; M \)^(- 1) A^(1 \/ 2) . $ <eq:K-symmetric-representation>]

To verify the first identity, apply $\( I - U V \)^(- 1) = I + U \( I - V U \)^(- 1) V$. For the second, multiply the two sides using $S_A = I - A^(1 \/ 2) \( z M - z^2 B_A I \) A^(1 \/ 2)$. These formulas will also let us truncate the inverse while retaining bounded matrix factors.

=== 3.1 Words and their predictions <words-and-their-predictions>

A #emph[word] is an ordered product of diagonal matrices, copies of a symmetric matrix $M$, and at most one factor $K_A \( M \)$. Its length is the number of factors. Consecutive diagonal factors may always be combined, and an absent diagonal factor is interpreted as $I$. To each word $Q$ we associate a diagonal matrix $sans(P) \( Q \)$ by the contraction rule below. The estimates will compare the diagonal of $Q$ with this explicitly defined matrix.

Begin with a word without $K_A$. Consider every complete noncrossing pairing of its occurrences of $M$, in their linear order. For each pairing, remove an innermost pair by the rule

#[#set math.equation(numbering: n => "(3.4)")
 $ M D M med mapsto med j frac("Tr" D, n) I \, $ <eq:noncrossing-contraction>]

where $D$ is diagonal after previous removals. Combine adjacent diagonals and continue. Sum the resulting diagonal matrices over all complete noncrossing pairings. If there is no complete pairing, the prediction is zero; if there is no occurrence of $M$, it is the word itself. The result for a fixed pairing does not depend on the order of removal: two available innermost pairs are disjoint, and their removals commute. For words without an inverse factor, this is the operator-valued semicircular moment rule with covariance map $D mapsto j n^(- 1) "Tr" \( D \) I$; see Speicher [20].

For example, four occurrences of $M$ have two complete noncrossing pairings, giving

$ sans(P) \( M D_1 M D_2 M D_3 M \) =  & j^2 frac("Tr" D_1, n) frac("Tr" D_3, n) D_2\
 & + j^2 frac("Tr" D_2, n) frac("Tr" \( D_1 D_3 \), n) I . $

The first term pairs the first two and last two occurrences; the second pairs the outside occurrences around the middle pair.

For a word containing $K_A$, replace that factor by the formal series

#[#set math.equation(numbering: n => "(3.5)")
 $ K_A \( z \; M \) = sum_(r gt.eq 0) \( z A M - z^2 B_A A \)^r \, $ <eq:K-formal-series>]

and apply the preceding rule coefficient by coefficient. Ordinary occurrences of $M$ outside this factor are left unscaled. We prove below that the resulting series $sans(P) \( Q \; z \)$ is a polynomial; we define $sans(P) \( Q \) = sans(P) \( Q \; 1 \)$.

The corresponding trace prediction is $sans(p) \( Q \) = n^(- 1) "Tr" sans(P) \( Q \)$. To see its cyclic invariance, draw an ordinary trace word on a circle, with a chord for each pair in a noncrossing pairing. Its contribution is $j$ for each chord, multiplied by, for each face, the average of the product of the diagonal matrices on that face’s boundary arcs. Removing an innermost chord gives exactly (3.4), and the average over the last face is the final normalized trace. This description is unchanged by rotating the circle. For words with $K_A \( z \; M \)$, apply this argument coefficient by coefficient in (3.5).

#thm([Lemma 3.1.])[
  (Simultaneous word estimates).  #emph[Fix $L in bb(N)$, $M_0 < oo$, and $c > 0$. There are constants $C \, c_1 > 0$ and $n_0$, depending only on $j \, a_(+) \, L \, M_0 \, c$, such that the following event has probability at least $1 - C e^(- c_1 n)$ for $n gt.eq n_0$. Simultaneously for all words $Q$ of length at most $L$, all their real diagonal factors of norm at most $M_0$, and all $0 lt.eq A lt.eq a_(+) I$, one has 
#[#set math.equation(numbering: n => "(3.6)")
 $ lr(bar.v.double Q bar.v.double) lt.eq C \, #h(2em) (sum_(a eq.not b) \| Q_(a b) \|^4)^(1 \/ 4) lt.eq C \, #h(2em) lr(bar.v.double "diag" \( Q - sans(P) \( Q \) \) bar.v.double)_2 lt.eq C . $ <eq:word-estimates>]

 For a word containing $K_A \( J \)$, the assertion is restricted to parameters satisfying $S_A \( 1 \; J \) succ.curly.eq c I$. The same conclusion holds with $W$ in place of $J$, with the corresponding stability restriction. Thus all diagonal parameters in this assertion may be chosen after the random matrix has been observed.]
  #emph[If a word has $r$ ordinary occurrences of $M$ outside its one $K_A \( z \; M \)$ factor, then $sans(P) \( Q \; z \)$ has degree at most $r$.]
] <lem:words>

We prove the simultaneous estimate in three steps. For a fixed deterministic diagonal, Gaussian comparison gives stability along $0 lt.eq z lt.eq 1$. We then calculate the expected diagonal of a truncated word. Finally, concentration makes the word estimates simultaneous in the diagonal parameters. The first step supplies stability for each deterministic choice; it does not remove the separate stability restriction for adaptive $A$ in Lemma 2.

#thm([Lemma 3.2.])[
  (Stability for a deterministic diagonal).  #emph[There is $c_0 > 0$, depending only on $j \, a_(+)$, with the following property. For every fixed deterministic $0 lt.eq A lt.eq a_(+) I$, and every fixed $R > 2 sqrt(j)$, there are constants $C \, c_2 > 0$ and $n_0$, uniform in $A$, such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ bb(P) {lr(bar.v.double  bar.v.double) W lt.eq R med upright("and") quad S_A \( z \; W \) succ.curly.eq c_0 I upright(" for all ") 0 lt.eq z lt.eq 1} gt.eq 1 - C e^(- c_2 n) #h(2em) \( n gt.eq n_0 \) . $ <eq:deterministic-path-stability>]

 In addition, for every fixed $epsilon > 0$, $bb(P) { lr(bar.v.double  bar.v.double) W > 2 sqrt(j) + epsilon } lt.eq C_epsilon e^(- c_epsilon n)$ for sufficiently large $n$.]
] <lem:matrix-path-stability>

#proof[
  We first bound the expected quadratic process that defines the smallest eigenvalue of $S_A$. Concentration will give a margin at each fixed $z$, and a finite mesh will extend it along the path.
  We use two standard Gaussian facts. A real-valued $L$-Lipschitz function of a standard Gaussian vector satisfies $bb(P) { \| F - bb(E) F \| > u } lt.eq 2 exp \( - u^2 \/ \( 2 L^2 \) \)$. Also, if two centered Gaussian processes have ordered squared increments, the process with larger squared increments has the larger expected supremum (Sudakov–Fernique). The latter comparison remains valid after the same deterministic function is added to both processes; see the deterministic-shift comparison in Vitale [22]. Both facts apply by finite nets and continuity to the compact index sets below. The linear map from the independent standard Gaussian coordinates to $W$, in Frobenius norm, has norm $sqrt(2 j \/ n)$.
  For the comparison, write $w = A^(1 \/ 2) p$ for $lr(bar.v.double  bar.v.double) p = 1$ and consider
  $ X_p = w^T W w \, #h(2em) Y_p = 2 sqrt(j \/ n) thin lr(bar.v.double  bar.v.double) w thin g^T w \, $
  where $g$ is standard Gaussian in $bb(R)^n$. If $w' = A^(1 \/ 2) p'$, direct calculation gives
  $ & bb(E) \( Y_p - Y_(p') \)^2 - bb(E) \( X_p - X_(p') \)^2\
 & #h(2em) = frac(2 j, n) [\( lr(bar.v.double  bar.v.double) w^2 - lr(bar.v.double w' bar.v.double)^2 \)^2 + 2 \( lr(bar.v.double  bar.v.double) w lr(bar.v.double w' bar.v.double) - w^T w' \)^2] gt.eq 0 . $
  Consequently, for each $z in \[ 0 \, 1 \]$,
  $ bb(E) sup_(lr(bar.v.double  bar.v.double) p = 1) { z X_p - z^2 j chi_A lr(bar.v.double  bar.v.double) w^2 } lt.eq bb(E) sup_(lr(bar.v.double  bar.v.double) p = 1) { z Y_p - z^2 j chi_A lr(bar.v.double  bar.v.double) w^2 } . $
  Set $T_g = sqrt(j \/ n) lr(bar.v.double A^(1 \/ 2) g bar.v.double)$. Since $g^T w = p^T A^(1 \/ 2) g lt.eq lr(bar.v.double A^(1 \/ 2) g bar.v.double)$, the last supremum is at most
  $ sup_(0 lt.eq v lt.eq sqrt(a_(+))) \( 2 z T_g v - z^2 j chi_A v^2 \) . $
  The remaining supremum depends on the Gaussian vector only through $T_g$. The variable $T_g^2$ has mean $j chi_A$ and variance $2 j^2 "Tr" \( A^2 \) \/ n^2 lt.eq C \/ n$. The inequality $\| sqrt(x) - sqrt(y) \| lt.eq sqrt(\| x - y \|)$ therefore shows, uniformly in $A$, that $bb(E) \| T_g - sqrt(j chi_A) \| = o \( 1 \)$. On replacing $T_g$ by $sqrt(j chi_A)$ in the preceding display, the expression becomes $2 d - d^2$, with $0 lt.eq d = z sqrt(j chi_A) v lt.eq sqrt(j) thin a_(+) < 1$. Thus, with $delta = \( 1 - sqrt(j) thin a_(+) \)^2 > 0$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ bb(E) sup_(lr(bar.v.double  bar.v.double) p = 1) { z p^T A^(1 \/ 2) W A^(1 \/ 2) p - z^2 j chi_A p^T A p } lt.eq 1 - delta + o \( 1 \) \, $ <eq:quadratic-process-margin>]
  uniformly in $A \, z$. The supremum in (3.8) is $a_(+)$-Lipschitz in $W$ for Frobenius norm. Gaussian concentration gives an exponentially small probability that it exceeds $1 - delta \/ 2$, uniformly for each fixed $A \, z$.
  To pass from a fixed $z$ to the entire interval, we also need a bound on $lr(bar.v.double  bar.v.double) W$. Taking $A = I$ in the comparison without deterministic offsets gives
  $ bb(E) lambda_max \( W \) lt.eq 2 sqrt(j \/ n) bb(E) lr(bar.v.double  bar.v.double) g lt.eq 2 sqrt(j) . $
  The same holds for $- W$. Concentration of these two eigenvalues proves the stated norm tail. On $lr(bar.v.double  bar.v.double) W lt.eq R$, the function of $z$ inside the supremum in (3.8) is uniformly Lipschitz, with constant at most $a_(+) R + 2 j a_(+)^2$. A sufficiently fine constant mesh of $\[ 0 \, 1 \]$, followed by a union bound, therefore gives (3.7), for example with $c_0 = delta \/ 4$. ◻
]

=== 3.2 Truncation and the loop recursion <truncation-and-the-loop-recursion>

The inverse in a word need not exist for every realization of the matrix. We therefore replace each word by a globally defined bounded function of $W$, agreeing with the original word whenever the required norm and stability conditions hold. This permits concentration and integration by parts before those conditions are imposed.

Fix a sufficiently large constant $R$. Let $Pi_R$ be metric projection, in the Hilbert space of real symmetric matrices with Frobenius norm, onto ${ M : lr(bar.v.double  bar.v.double) M lt.eq R }$. This is a nonexpansive map and is equivariant under orthogonal conjugation. Put $hat(W) = Pi_R \( W \)$. Choose a smooth compactly supported real function $f$ which equals $x^(- 1)$ on the interval

$ [1 / 2 min \( c \, c_0 \) \, thin 2 + c + c_0 + j a_(+)^2 + a_(+) R] . $

This interval contains, with slack, every stable spectrum needed both for deterministic-parameter estimates and for the restriction $S_A \( 1 \; M \) succ.curly.eq c I$ in Lemma 2. Replace $K_A \( z \; W \)$ by

#[#set math.equation(numbering: n => "(3.9)")
 $ hat(K)_A \( z \) = I + A^(1 \/ 2) f \( S_A \( z \; hat(W) \) \) A^(1 \/ 2) \( z hat(W) - z^2 B_A I \) . $ <eq:truncated-K>]

Replace every ordinary $W$ in a word by $hat(W)$ as well; denote the resulting word by $hat(Q)_theta \( z \)$, where $theta$ lists all its diagonal parameters. These truncated factors equal the original factors on the stability events where they will be used.

For each fixed length and fixed bounds on the diagonal parameters, there is a constant $C$ such that

#[#set math.equation(numbering: n => "(3.10)")
 $ lr(bar.v.double hat(Q)_theta \( z \) bar.v.double) & lt.eq C \, & lr(bar.v.double hat(Q)_theta \( z \; W \) - hat(Q)_theta \( z \; W' \) bar.v.double)_(upright(F)) & lt.eq C lr(bar.v.double W - W' bar.v.double)_(upright(F)) \,\
"Lip"_(upright(F)) #scale(x: 120%, y: 120%)[\(] hat(Q)_theta \( z \; dot.op \) - hat(Q)_(theta') \( z \; dot.op \) #scale(x: 120%, y: 120%)[\)] & lt.eq C sqrt(Delta) &  & upright("if ") lr(bar.v.double theta - theta' bar.v.double)_oo lt.eq Delta lt.eq 1 . $ <eq:truncated-word-lipschitz>]

The constants are uniform for $z in \[ 0 \, 1 \]$ and for all matrix sizes. Here the Lipschitz constants concern maps into matrices with Frobenius norm.

We verify both estimates with constants independent of dimension. On the operator-norm ball, all factors are bounded, and their differentials in a perturbation $E$ are bounded in Frobenius norm by $C lr(bar.v.double  bar.v.double) E_(upright(F))$. The only functional-calculus factor is handled by writing $f$ as a Fourier integral and using

$ upright(d) \( e^(i t S) \) \[ E \] = i t integral_0^1 e^(i t \( 1 - u \) S) E e^(i t u S) thin upright(d) u . $

The Fourier transform of $f$ decays faster than any power, so its first two weighted absolute moments are finite. This formula and the corresponding difference formula give

$ lr(bar.v.double upright(d) f \( S \) \[ E \] bar.v.double)_(upright(F)) lt.eq C lr(bar.v.double  bar.v.double) E_(upright(F)) \, #h(2em) lr(bar.v.double \( upright(d) f \( S \) - upright(d) f \( S' \) \) \[ E \] bar.v.double)_(upright(F)) lt.eq C lr(bar.v.double S - S' bar.v.double) lr(bar.v.double  bar.v.double) E_(upright(F)) . $

Changing the diagonal parameters by at most $Delta$ changes their square roots in norm by at most $sqrt(Delta)$. Consequently the factors, and their matrix differentials, change by respectively $C sqrt(Delta)$ and $C sqrt(Delta) lr(bar.v.double  bar.v.double) E_(upright(F))$. The product rule proves the same differential assertions for a word. Integrating along the line segment between two matrices in the convex operator-norm ball proves (3.10) and (3.10) there. Composition with the nonexpansive projection $Pi_R$ proves them everywhere.

These Lipschitz estimates first give the moment bounds needed for the expectation calculation. For a fixed parameter tuple,

#[#set math.equation(numbering: n => "(3.11)")
 $ "Var" \( hat(Q)_(a b) \) lt.eq C \/ n \, #h(2em) "Var" (1 / n "Tr" hat(Q)) lt.eq C \/ n^2 . $ <eq:word-entry-and-trace-variance>]

The normalized trace gains a factor $n^(- 1 \/ 2)$ in its Frobenius Lipschitz constant. The same estimates for a difference of two parameter tuples gain a factor $Delta$ on the right-hand sides. Fourth centered entry moments are bounded by $C \/ n^2$, or $C Delta^2 \/ n^2$ for such a difference, by integrating the Gaussian concentration tail.

#thm([Lemma 3.3.])[
  (Fixed-parameter diagonal expectations).  #emph[For the truncated words just defined, uniformly in deterministic diagonal parameters in the indicated bounded ranges, in $z in \[ 0 \, 1 \]$, and in the diagonal index $i$, 
#[#set math.equation(numbering: n => "(3.12)")
 $ bb(E) hat(Q)_theta \( z \)_(i i) = sans(P) \( Q_theta \; z \)_(i i) + O \( n^(- 1) \) . $ <eq:word-bias>]

 For words without $K_A$, the prediction has no $z$ dependence. The formal prediction for a word with $r$ ordinary $W$ letters is a polynomial of degree at most $r$.]
] <lem:word-bias>

#proof[
  The calculation has two parts. We first justify integration by parts for the truncated words and compute the inverse factor alone. We then obtain a recursion in the number of ordinary $W$ factors; the same recursion determines the formal prediction exactly and the expectation up to $O \( n^(- 1) \)$.
  All constants in this proof depend only on the fixed length and parameter bounds. Lemma 3 shows that, for every fixed deterministic parameter tuple, the truncations agree with the actual matrices for all $z in \[ 0 \, 1 \]$, except on an event of probability $C e^(- c_2 n)$. Gaussian integration by parts can be applied to the globally Lipschitz truncated factors, using weak derivatives. More explicitly, for a scalar Lipschitz function $H$,
  #[#set math.equation(numbering: n => "(3.13)")
   $ bb(E) \[ W_(a b) H \( W \) \] = j / n bb(E) #scale(x: 120%, y: 120%)[\[] upright(d) H \( W \) \[ E_(a b) + E_(b a) \] #scale(x: 120%, y: 120%)[\]] . $ <eq:GOE-integration-by-parts>]
  When $a = b$, the elementary direction on the right is doubled, as required by the diagonal variance $2 j \/ n$.
  For (3.13), remove the projection from the distinguished ordinary $W$ factor. The resulting expectation error is exponentially small, since the other factors are bounded and Gaussian norm tails control the removed factor. On the event of agreement, the differential of the inverse is
  #[#set math.equation(numbering: n => "(3.14)")
   $ upright(d) K_A \( z \; W \) \[ E \] = z K_A \( z \; W \) A E K_A \( z \; W \) . $ <eq:inverse-differential>]
  We may use the expressions on the right, with truncated factors, on the whole probability space. The error is exponentially small even after the index sums: all factors and their true truncated differentials are bounded, there are at most a fixed polynomial number of indices, and the disagreement event has exponentially small probability. More precisely, the elementary direction $E_(a b) + E_(b a)$ has Frobenius norm at most $2$. Both the true weak differential and its formal replacement are therefore bounded by $C$ in each entry; their difference vanishes on the agreement event. Each such differential error has expected absolute value at most $C e^(- c_2 n)$. Expanding the diagonal entry of a length-$L$ word and applying the product rule uses at most $\( L - 1 \) n^(L - 1)$ scalar contributions before any index identifications; the factor $j \/ n$ in integration by parts only improves this bound. Thus their total error is at most a fixed polynomial in $n$ times $e^(- c_2 n)$, hence at most $C' e^(- c' n)$. Subsequent words have bounded lengths depending only on the original length. We therefore suppress hats during the loop calculation, with this convention understood.
  We now compute the base case, in which the only nondiagonal factor is $K = K_A \( z \; W \)$. Write $a_i = A_(i i)$, $k_i \( z \) = bb(E) K_(i i)$, and $r \( z \) = n^(- 1) sum_i a_i k_i \( z \)$. Differentiating $K_(b i)$ in (3.13) gives
  $ bb(E) \( W K \)_(i i) & = frac(z j, n) bb(E) [\( "Tr" K A \) K_(i i)] + frac(z j, n) sum_b bb(E) \[ \( K A \)_(b i) K_(b i) \] + O \( e^(- c' n) \)\
 & = z j r \( z \) k_i \( z \) + O \( n^(- 1) \) . $
  For the second sum, the absolute value of the sum over $b$ is at most $lr(bar.v.double K A e_i bar.v.double) lr(bar.v.double K e_i bar.v.double) lt.eq C$. The factorization in the first term follows from (3.11); its covariance is at most $C n^(- 3 \/ 2)$, which is more than enough. The inverse identity $K = I + z A W K - z^2 B_A A K$ now yields
  #[#set math.equation(numbering: n => "(3.15)")
   $ bb(E) \( W K \)_(i i) = z j r k_i + O \( n^(- 1) \) \, #h(2em) k_i = 1 + z^2 j a_i \( r - chi_A \) k_i + O \( n^(- 1) \) . $ <eq:K-loop-equations>]
  The loop equations must select the solution near $k_i = 1$. We establish this by continuation from $z = 0$, where the inverse is the identity. Put $h \( z \) = r \( z \) - chi_A$. The truncated $k_i$ are uniformly bounded and continuous in $z$. If $\| h \( z \) \| lt.eq delta_1$, the second equation in (3.15) gives $max_i \| k_i \( z \) - 1 \| lt.eq C delta_1 + C \/ n$. Choose $delta_1 > 0$ small, using (3.1), so that throughout this region and for large $n$,
  $ lr(|z^2 j 1 / n sum_i a_i^2 k_i \( z \)|) lt.eq 1 - delta_2 $
  for some fixed $delta_2 > 0$. Averaging the second equation in (3.15) with weights $a_i$ gives
  $ h \( z \) = z^2 j (1 / n sum_i a_i^2 k_i \( z \)) h \( z \) + O \( n^(- 1) \) \, $
  and hence $\| h \( z \) \| lt.eq C \/ n$ while $\| h \( z \) \| lt.eq delta_1$. Since $h \( 0 \) = 0$, continuity rules out a first exit from that region for large $n$. It follows uniformly in $z$ that
  #[#set math.equation(numbering: n => "(3.16)")
   $ bb(E) K_(i i) = 1 + O \( n^(- 1) \) \, #h(2em) bb(E) \( W K \)_(i i) = z B_A + O \( n^(- 1) \) . $ <eq:K-and-WK-bias>]
  To complete the base case, we verify the formal identity $sans(P) \( K_A \( z \; W \) \) = I$ independently of the expectation calculation. The cancellation takes place at each coefficient of the series. In the expansion (3.5), a block $- z^2 B_A A$ may be regarded as the negative contraction of two adjacent blocks $z A W \, z A W$, since their contraction is $z^2 j chi_A A = z^2 B_A A$. Fix a completely noncrossing-paired chain $\( A W \)^(2 m)$ with $m > 0$. Let $cal(A)$ be the nonempty set of its pairs which join two originally adjacent occurrences of $W$. It is nonempty because every nonempty noncrossing pairing of a linear order has an adjacent pair. All pairs in $cal(A)$ are disjoint. The terms of (3.5) which give this paired chain are in bijection with subsets $T subset.eq cal(A)$: contract the pairs in $T$ into the negative deterministic blocks, and pair the remaining occurrences normally. The magnitude of the final diagonal contribution is unchanged, and its sign is $\( - 1 \)^(\| T \|)$. Thus the total multiplier is $sum_(T subset.eq cal(A)) \( - 1 \)^(\| T \|) = 0$. This argument is finite at each power of $z$ and proves the asserted formal identity. Multiplication by surrounding diagonal matrices proves both claims of the lemma for words with no ordinary $W$ letters.
  For the induction step, select an ordinary occurrence of $W$ in a general word and apply integration by parts at that occurrence. We describe the resulting finite recursion directly, without requiring convergence of the formal series. In each product-rule term, mark the partner of the selected occurrence: for a derivative falling on an ordinary factor, this is the $W$ being differentiated. If the derivative falls on $K_A$, replace that factor by $z K_A A thin #box(stroke: black, inset: 3pt, [$ W $]) thin K_A$ and take the boxed occurrence as the partner. In either case, list the two marked positions in their linear order, so the marked product reads
  $ U thin #box(stroke: black, inset: 3pt, [$ W $]) thin V thin #box(stroke: black, inset: 3pt, [$ W $]) thin Q . $
  The two orientations in (3.13) contribute respectively
  #[#set math.equation(numbering: n => "(3.17)")
   $ j / n bb(E) #scale(x: 120%, y: 120%)[\[] \( U Q \)_(i i) "Tr" V #scale(x: 120%, y: 120%)[\]] \, #h(2em) j / n bb(E) \( U V^T Q \)_(i i) . $ <eq:word-loop-contractions>]
  There is an additional factor $z$ when the derivative fell on $K_A$. The second expression in (3.17) is $O \( n^(- 1) \)$ by operator-norm bounds, including when it contains two copies of $K_A$. The first expression is
  #[#set math.equation(numbering: n => "(3.18)")
   $ j (1 / n bb(E) "Tr" V) bb(E) \( U Q \)_(i i) + O \( n^(- 1) \) \, $ <eq:word-loop-leading>]
  again by (3.11). The index sums explain the two terms. The opposite orientation identifies the two interior indices and gives $"Tr" V$; the equal orientation reverses the interior path and gives $V^T$.
  Consequently $bb(E) hat(Q)_(i i)$ is the finite sum of the leading products (3.18) over all ordinary partners, plus $z$ times the corresponding leading product for the one $K_A$ factor if present, with an $O \( n^(- 1) \)$ remainder. Each word $V$ and $U Q$ in this recursion has fewer ordinary $W$ letters than the original word. Each contains at most one $K_A$: if the derivative fell on $K_A$, the splitting places one of its two copies in each word. Extra diagonal factors $A$ cause no problem, since at most one is added per decrease of the induction index.
  The decrease in the number of ordinary letters holds whether the selected occurrence lies before or after the inverse. The two possible orders can be checked explicitly. If the original word is $P K_A R W T$, the contraction with $K_A$ contributes
  $ z j thin bb(E) [\( P K_A A T \)_(i i) frac("Tr" \( K_A R \), n)] . $
  If it is $P W R K_A T$, that contribution is
  $ z j thin bb(E) [\( P K_A T \)_(i i) frac("Tr" \( R K_A A \), n)] . $
  Here $P \, R \, T$ contain no inverse factor. The displayed outer and inner words each have one inverse factor, even though the original distinguished occurrence may lie anywhere among the ordinary letters.
  It remains to compare this expectation recursion with the formal prediction. Sort the noncrossing pairings by the partner of the selected ordinary occurrence. The inside and outside may then be paired independently; their predictions are respectively $sans(p) \( V \)$ and $sans(P) \( U Q \)$. If the partner occurs inside the series for $K_A \( z \; W \)$, marking that occurrence in the formal series is exactly the formal differentiation identity $upright(d) K_A \[ E \] = z K_A A E K_A$. Thus the entire sum over positions in that series is the single $z$-weighted product just described.
  We can now induct on the number $r$ of ordinary $W$ letters. An ordinary partner leaves a total of $r - 2$ such letters in the two smaller words; a partner in $K_A$ leaves $r - 1$. The base prediction is constant. The recursion therefore proves that the formal prediction is a polynomial of degree at most $r$. It also proves (3.12): use the induction hypothesis for the two expectations in each leading product, and average the diagonal induction hypothesis to handle its normalized trace. There are only finitely many products and all factors are uniformly bounded. The same induction, with no inverse factor, proves the statement for ordinary words. ◻
]

=== 3.3 Making the word estimates simultaneous <making-the-word-estimates-simultaneous>

#proof[
  We first make the centered estimates uniform over the diagonal parameters, then add the expectation estimate from Lemma 4. Fix a letter pattern and let $theta$ range over its parameter box, which has at most $C_L n$ real coordinates. Work initially with the truncated words at $z = 1$. Conjugation by any diagonal sign matrix preserves the law of $W$ and conjugates $hat(Q)_theta$ by that same sign matrix. The diagonal parameters commute with the conjugation, and both the projection and the functional calculus respect it. Thus $bb(E) \( hat(Q)_theta \)_(a b) = 0$ whenever $a eq.not b$.
  Define the two matrix seminorms
  $ N_2 \( M \) = lr(bar.v.double "diag" M bar.v.double)_2 \, #h(2em) N_4 \( M \) = (sum_(a eq.not b) \| M_(a b) \|^4)^(1 \/ 4) . $
  Both are $1$-Lipschitz with respect to Frobenius norm. The entry moment bounds following (3.11) give
  #[#set math.equation(numbering: n => "(3.19)")
   $ bb(E) N_k \( hat(Q)_theta - bb(E) hat(Q)_theta \) lt.eq C quad \( k = 2 \, 4 \) . $ <eq:centered-word-norm-expectations>]
  Indeed, sum the $n$ second moments for $k = 2$, and the at most $n^2$ fourth moments for $k = 4$, then apply Jensen’s inequality. For two parameter tuples at distance at most $Delta$, the same argument, using (3.10), gives
  $ bb(E) N_k #scale(x: 120%, y: 120%)[\(] \( hat(Q)_theta - bb(E) hat(Q)_theta \) - \( hat(Q)_(theta') - bb(E) hat(Q)_(theta') \) #scale(x: 120%, y: 120%)[\)] lt.eq C sqrt(Delta) . $
  The random norms in this last display concentrate around their means at Gaussian scale $C sqrt(Delta \/ n)$, again by (3.10). The centered expectations are deterministic and do not change Lipschitz constants.
  To control every parameter tuple, approximate it successively on finer meshes. For each $ell gt.eq 0$, choose a sup-norm mesh $cal(N)_ell$ of spacing $2^(- ell)$ in the parameter box. It may be chosen with
  $ \| cal(N)_ell \| lt.eq exp \( C_L \( ell + 1 \) n \) . $
  For a tuple $theta$, choose nearest mesh points $theta_ell in cal(N)_ell$. Then $lr(bar.v.double theta_ell - theta_(ell - 1) bar.v.double)_oo lt.eq C 2^(- ell)$. For all pairs of mesh points at this distance, concentration and a union bound show that their centered increments have both $N_2$ and $N_4$ norm at most
  $ C' sqrt(ell + 1) thin 2^(- ell \/ 2) \, $
  except with probability $C e^(- c \( ell + 1 \) n)$, provided $C'$ is chosen sufficiently large. Specifically, the squared ratio of this threshold to the Gaussian scale is a constant multiple of $\( ell + 1 \) n$, and its constant can be chosen to dominate the logarithm of the number of mesh pairs. The initial mesh is bounded in the same way using (3.19). Summing the failure probabilities over $ell$, and summing the convergent increment bounds along each chain, proves, with probability $1 - C e^(- c_1 n)$,
  #[#set math.equation(numbering: n => "(3.20)")
   $ sup_theta N_k \( hat(Q)_theta - bb(E) hat(Q)_theta \) lt.eq C quad \( k = 2 \, 4 \) . $ <eq:simultaneous-centered-words>]
  At each fixed $n$, continuity of the truncated word and its expectation in $theta$ justifies taking the limit of the mesh chain. There are only finitely many letter patterns of length at most $L$, so their events may be intersected.
  The centered words are now controlled on one event for every parameter tuple. Lemma 4 supplies the remaining bias estimate, $N_2 \( bb(E) hat(Q)_theta - sans(P) \( Q_theta \) \) lt.eq C \/ sqrt(n)$, uniformly in $theta$. Sign symmetry makes the off-diagonal of $bb(E) hat(Q)_theta$ identically zero. Combining these facts with (3.20) proves the desired diagonal and off-diagonal assertions for the truncated words. Their operator norms are already bounded by construction. On $lr(bar.v.double  bar.v.double) W lt.eq R$ and at parameters with $S_A \( 1 \; W \) succ.curly.eq c I$, the truncations equal the exact words, proving the GOE version.
  The GOE estimate transfers to the zero-diagonal model through $J = W - D_("diag" W)$. This last step uses a Frobenius bound on the removed diagonal. Since
  $ lr(bar.v.double D_("diag" W) bar.v.double)_(upright(F))^2 med =^(upright("law")) med frac(2 j, n) chi_n^2 \, $
  it is bounded by a fixed constant except with exponentially small probability. The norm tail for $W$, and a sufficiently large choice of $R$, ensure also that both $W$ and $J$ lie in the operator-norm ball except with exponentially small probability. For every parameter tuple, (3.10) then bounds the Frobenius norm of the difference of the truncated word evaluated at $W$ and at $J$ by a fixed constant. Both $N_2$ and $N_4$ of this difference are bounded by its Frobenius norm. The prediction is unchanged by this substitution. At parameters with $S_A \( 1 \; J \) succ.curly.eq c I$, the truncated factors evaluated at $J$ equal the exact factors. This proves all of (3.6). The polynomial assertion was proved in Lemma 4. ◻
]

=== 3.4 Bilinear forms and regularized determinants <bilinear-forms-and-regularized-determinants>

We next extract two forms of the preceding estimates. The first controls bilinear forms for a prescribed finite family of deterministic vectors. The second controls a regularized determinant simultaneously over its diagonal parameters and bounded finite-rank perturbations. Their quantifiers differ, and we keep the two statements separate.

#thm([Lemma 3.4.])[
  (Bilinear deterministic equivalents).  #emph[Fix an integer $m gt.eq 1$, a vector bound $M_1 < oo$, a tolerance $epsilon > 0$, and $R > 2 sqrt(j)$. For every deterministic $0 lt.eq A lt.eq a_(+) I$ and deterministic vectors $v_1 \, dots.h \, v_m in bb(R)^n$ with $lr(bar.v.double v_r bar.v.double) lt.eq M_1$, there is an event of probability at least $1 - C e^(- c_3 n)$ on which (3.7) holds and, with 
$ G_A = A^(1 \/ 2) S_A \( 1 \; W \)^(- 1) A^(1 \/ 2) = K_A \( W \) A \, $

 one has, for every $r \, s$, 
#[#set math.equation(numbering: n => "(3.21)")
 $ \| v_r^T \( G_A - A \) v_s \| & lt.eq epsilon \,\
\| v_r^T \( G_A W - B_A A \) v_s \| & lt.eq epsilon \,\
\| v_r^T \( W G_A W - B_A I - B_A^2 A \) v_s \| & lt.eq epsilon . $ <eq:bilinear-G>]

 Here $C \, c_3 \, n_0$ may depend on $j \, a_(+) \, m \, M_1 \, epsilon \, R$ but are uniform in $A$, the vectors, and $n gt.eq n_0$. The assertion is for each deterministic choice of these parameters; it does not claim simultaneity over all vector choices.]
] <lem:bilinear>

#proof[
  For each of the specified bilinear forms, we calculate its expectation and then apply concentration. Use the truncations above with a cutoff agreeing with the inverse on the path-stability event. Sign conjugation makes the off-diagonal expectations of each relevant matrix vanish. Equation (3.16) at $z = 1$ gives
  $ bb(E) hat(K)_(i i) = 1 + O \( n^(- 1) \) \, #h(2em) bb(E) \( hat(W) hat(K) \)_(i i) = B_A + O \( n^(- 1) \) . $
  The identities, valid on the event of agreement,
  $ G_A W = K_A \( W \) \( I + B_A A \) - I \, #h(2em) W G_A W = W K_A \( W \) \( I + B_A A \) - W $
  therefore give the three diagonal expectation predictions $A$, $B_A A$, and $B_A I + B_A^2 A$, with entrywise errors $O \( n^(- 1) \)$. Their use with truncated factors changes expectations only exponentially little, by the same argument as in Lemma 4. In particular, their errors in any of the specified bilinear forms are $O \( n^(- 1) \)$: for a diagonal error matrix $E$, one has $\| v_r^T E v_s \| lt.eq lr(bar.v.double  bar.v.double) E lr(bar.v.double v_r bar.v.double) lr(bar.v.double v_s bar.v.double)$.
  The expectation calculation has identified the three required predictions. To control fluctuations, each truncated bilinear form is $C M_1^2$-Lipschitz in $W$ for Frobenius norm, by (3.10). Gaussian concentration gives failure probability $C e^(- c_3 n)$ at any fixed positive tolerance. Intersect these events for the $3 m^2$ forms and with Lemma 3. For large $n$ the expectation errors are less than half the specified tolerance, proving the result. ◻
]

#thm([Lemma 3.5.])[
  (A simultaneous regularized determinant bound).  #emph[Fix $epsilon > 0$, an integer $r_0 gt.eq 0$, and $M_2 < oo$. There is $gamma_0 > 0$, depending only on $j \, epsilon$, such that for every fixed $0 < gamma lt.eq gamma_0$ and all sufficiently large $n$, an event of probability at least $1 - C e^(- c_4 n)$ has the following property. Simultaneously for all diagonal $0 lt.eq V lt.eq I$ and all real matrices $E$ with $"rank" E lt.eq r_0$ and $lr(bar.v.double  bar.v.double) E lt.eq M_2$, put 
$ b = 1 / n "Tr" V \, #h(2em) B = j b \, #h(2em) L = I + \( B I - W \) V + E . $

 Then 
#[#set math.equation(numbering: n => "(3.22)")
 $ 1 / n log det \( L^T L + gamma I \) lt.eq j b^2 + epsilon . $ <eq:logdet-upper-bound>]

 The constants $C \, c_4$ and the lower threshold on $n$ may depend on $j \, epsilon \, gamma \, r_0 \, M_2$. In particular, $V$ and $E$ may depend on $W$.]
] <lem:logdet>

#proof[
  We first compute the mean log determinant with $E = 0$ and a fixed deterministic $V$. Regularization will then provide a global Lipschitz bound, allowing a finite mesh in $V$ and finally the finite-rank perturbation. Set
  $ L_z = I + z^2 B V - z W V \, #h(2em) K \( z \) = \( I - z V W + z^2 B V \)^(- 1) . $
  Since $V lt.eq I$, we use the proof of Lemma 3 with the diagonal upper bound equal to $1$; its stability and inverse-norm constants here depend only on $j$. On the path-stability event from Lemma 3 with $A = V$, the determinant of $L_z$ equals the positive determinant of $S_V \( z \; W \)$ by $det \( I - U V \) = det \( I - V U \)$, and both $L_z^(- 1)$ and $K \( z \)$ have uniformly bounded operator norm. Indeed $L_z = K \( z \)^(- T)$, and (3.3) applies. Differentiating the normalized log determinant on this event gives
  #[#set math.equation(numbering: n => "(3.23)")
   $ frac(upright(d), upright(d) z) 1 / n log det L_z & = 1 / n "Tr" #scale(x: 120%, y: 120%)[\[] L_z^(- 1) \( 2 z B V - W V \) #scale(x: 120%, y: 120%)[\]]\
 & = 2 z B 1 / n "Tr" \( K \( z \) V \) - 1 / n "Tr" \( W K \( z \) V \) . $ <eq:logdet-derivative>]
  Here $V L_z^(- 1) = K \( z \) V$, which follows by multiplying $\( I - z V W + z^2 B V \) V = V L_z$, and cyclicity of trace was used.
  The derivative is expressed in the two matrices whose diagonal expectations were computed in (3.16). Let $cal(E)_V$ be the path-stability event intersected with $lr(bar.v.double  bar.v.double) W lt.eq R$, for a fixed $R > 2 sqrt(j)$. This one event applies to the entire interval of $z$. Equations (3.16), and replacement by the truncated factors off $cal(E)_V$, show uniformly in $z \, V$ that the expectation of the right-hand side of (3.23), multiplied by $upright(bold(1))_(cal(E)_V)$, is
  $ 2 z B b - z B b + O \( n^(- 1) \) = z j b^2 + O \( n^(- 1) \) . $
  All differentiated quantities are bounded on $cal(E)_V$, so integration and expectation may be interchanged. Since $L_0 = I$, it follows that
  #[#set math.equation(numbering: n => "(3.24)")
   $ bb(E) [upright(bold(1))_(cal(E)_V) 2 / n log det L_1] = j b^2 + O \( n^(- 1) \) . $ <eq:unregularized-logdet-mean>]
  On $cal(E)_V$, the singular values of $L_1$ are bounded below by a positive constant. Therefore
  $ 0 lt.eq 1 / n log det \( L_1^T L_1 + gamma I \) - 2 / n log det L_1 lt.eq C gamma . $
  Off $cal(E)_V$, the absolute value of the regularized normalized log determinant is bounded by
  $ \| log gamma \| + C + 2 log \( 1 + lr(bar.v.double  bar.v.double) W \) \, $
  for $0 < gamma lt.eq 1$. The norm tails of $W$ and (3.7) make its expected contribution exponentially small, for each fixed $gamma$. Consequently, uniformly in deterministic $V$,
  #[#set math.equation(numbering: n => "(3.25)")
   $ bb(E) [1 / n log det \( L_1^T L_1 + gamma I \)] lt.eq j b^2 + C gamma + O \( n^(- 1) \) + O_gamma \( e^(- c n) \) . $ <eq:regularized-logdet-mean>]
  The mean bound is uniform in deterministic $V$. To obtain a single event for all $V$, we use the concentration supplied by regularization. Define on all real matrices
  $ F_gamma \( M \) = 1 / n log det \( M^T M + gamma I \) . $
  Its Frobenius gradient is $2 n^(- 1) M \( M^T M + gamma I \)^(- 1)$. Each singular value of this gradient is at most $1 \/ \( n sqrt(gamma) \)$, and hence
  #[#set math.equation(numbering: n => "(3.26)")
   $ "Lip"_(upright(F)) \( F_gamma \) lt.eq 1 / sqrt(n gamma) . $ <eq:regularized-logdet-lipschitz>]
  For fixed $V$, the map $W mapsto L_1$ has Frobenius Lipschitz constant at most one. Gaussian concentration therefore gives
  #[#set math.equation(numbering: n => "(3.27)")
   $ bb(P) { \| F_gamma \( L_1 \) - bb(E) F_gamma \( L_1 \) \| > u } lt.eq 2 exp (- frac(gamma n^2 u^2, 4 j)) . $ <eq:regularized-logdet-concentration>]
  Choose $gamma_0 lt.eq 1$ small enough that $C gamma_0$ in (3.25) is at most $epsilon \/ 8$. For fixed $gamma lt.eq gamma_0$ and sufficiently large $n$, the expectation bound and (3.27) bound all points of any fixed sup-norm mesh of the cube $\[ 0 \, 1 \]^n$ by $j b^2 + epsilon \/ 2$, with failure $exp \( - c_gamma n^2 \)$. Indeed a mesh of spacing $Delta > 0$ has at most $\( C \/ Delta \)^n$ points, whose logarithm is only of order $n$. On $lr(bar.v.double  bar.v.double) W lt.eq R$, if $lr(bar.v.double V - V' bar.v.double) lt.eq Delta$, then
  $ \| b - b' \| lt.eq Delta \, #h(2em) lr(bar.v.double \( I + \( B I - W \) V \) - \( I + \( B' I - W \) V' \) bar.v.double)_(upright(F)) lt.eq sqrt(n) \( 2 j + R \) Delta . $
  By (3.26), the corresponding $F_gamma$ values differ by at most $\( 2 j + R \) Delta \/ sqrt(gamma)$, whereas $\| j b^2 - j \( b' \)^2 \| lt.eq 2 j Delta$. Choose $Delta$, depending only on $j \, R \, gamma \, epsilon$, so that these errors sum to at most $epsilon \/ 4$. Including the exponentially likely norm event proves, simultaneously for all $V$,
  $ F_gamma \( I + \( B I - W \) V \) lt.eq j b^2 + 3 epsilon \/ 4 . $
  We have obtained the simultaneous bound for $E = 0$ with room for the perturbation. The same Lipschitz estimate (3.26) gives, for every allowed $E$,
  $ \| F_gamma \( M + E \) - F_gamma \( M \) \| lt.eq frac(lr(bar.v.double  bar.v.double) E_(upright(F)), sqrt(n gamma)) lt.eq M_2 sqrt(frac(r_0, n gamma)) . $
  This is at most $epsilon \/ 4$ for large $n$, uniformly even when $E$ is chosen from the observed matrix. It proves (3.22) and the lemma. ◻
]

== 4 A scalar entropy inequality <sec:entropy>

The stability argument needs a scalar criterion that forces an empirical field law toward a Gaussian law. We first bound relative entropy below by a squared discrepancy involving the field and its hyperbolic tangent. We then identify the Gaussian law compatible with the scalar consistency equations. Together with the equality case of the first estimate, this characterizes the consistent equality laws.

Throughout this section, $N \( d \, s \)$ denotes the Gaussian law with mean $d$ and #emph[variance] $s$. All scalar expectations are taken with respect to the indicated probability law.

#thm([Lemma 4.1.])[
  (Scalar entropy inequality).  #emph[Let $0 < j < 1$, $d in bb(R)$, and $s > 0$. Let $P$ be a probability law on $bb(R)$ with finite second moment, and set 
$ m \( y \) = tanh y \, #h(2em) q = bb(E)_P m^2 \, #h(2em) b = 1 - q \, #h(2em) a = bb(E)_P \[ \( y - d \) m \] \, #h(2em) S = s + j q . $

 If $s gt.eq j q$, then 
#[#set math.equation(numbering: n => "(4.1)")
 $ D \( P bar.v.double N \( d \, s \) \) gt.eq frac(j \( a - s b \)^2, 2 s S) . $ <eq:scalar-entropy>]

 Equality holds if and only if $P = N \( d \, s \)$.]
] <lem:scalar-entropy>

#proof[
  The second-moment assumption makes the right-hand side finite, so it suffices to consider the case $D := D \( P bar.v.double N \( d \, s \) \) < oo$. In this case $P$ is absolutely continuous, and hence $q > 0$: otherwise $P$ would be the point mass at zero. Also $q < 1$, because $tanh^2 y < 1$ for every finite $y$. We use the following dimensionless parameters:
  #[#set math.equation(numbering: n => "(4.2)")
   $ k = frac(j q, s) in \( 0 \, 1 \] \, #h(2em) C = frac(j a, s) \, #h(2em) B = j b in \( 0 \, 1 \) \, #h(2em) a_0 = 1 - B in \( 0 \, 1 \) . $ <eq:entropy-scalars>]
  In these parameters, multiplying the desired inequality by $j$ gives the target
  #[#set math.equation(numbering: n => "(4.3)")
   $ j D gt.eq frac(\( C - B \)^2, 2 \( 1 + k \)) . $ <eq:entropy-target>]
  We will combine two entropy bounds. A monotone change of variables handles one range of the discrepancy $C - B$; comparison with a Gaussian of a different variance handles the remaining range. We retain strictness in both arguments to identify all equality cases.
  ===== 4.1 A change-of-variables bound. <a-change-of-variables-bound.>
  For the change of variables, fix $u < 1$. The map
  $ T_u \( y \) = y - u tanh y $
  is an increasing $C^1$ diffeomorphism of $bb(R)$ onto itself, with derivative $T'_u \( y \) = 1 - u \( 1 - m \( y \)^2 \) > 0$. Change of variables in relative entropy yields
  $ D & = D \( \( T_u \)_(\#) P bar.v.double N \( d \, s \) \) + frac(2 u a - u^2 q, 2 s) + bb(E)_P log #scale(x: 120%, y: 120%)[\(] 1 - u \( 1 - m^2 \) #scale(x: 120%, y: 120%)[\)]\
 & gt.eq frac(2 u a - u^2 q, 2 s) + bb(E)_P log #scale(x: 120%, y: 120%)[\(] 1 - u \( 1 - m^2 \) #scale(x: 120%, y: 120%)[\)] . $
  The entropy identity is well defined: for fixed $u < 1$, $log T'_u$ is bounded, and the second-moment assumption makes the difference of the Gaussian log densities integrable. To estimate the logarithmic term, apply concavity on the segment joining $1$ and $1 - u$. For $0 lt.eq v lt.eq 1$, this gives
  $ log \( 1 - u v \) gt.eq v log \( 1 - u \) . $
  Consequently, with $ell \( u \) = - log \( 1 - u \) - u$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ j D gt.eq u \( C - B \) - frac(k u^2, 2) - B ell \( u \) \, #h(2em) u < 1 . $ <eq:entropy-transport>]
  Completing the square isolates the amount by which this bound can exceed the target in (4.3):
  #[#set math.equation(numbering: n => "(4.5)")
   $ j D - frac(\( C - B \)^2, 2 \( 1 + k \)) gt.eq h \( u \) - frac(#scale(x: 120%, y: 120%)[\(] C - B - \( 1 + k \) u #scale(x: 120%, y: 120%)[\)]^2, 2 \( 1 + k \)) \, #h(2em) h \( u \) = u^2 / 2 - B ell \( u \) . $ <eq:entropy-slack>]
  We first locate a range in which the extra term $h \( u \)$ is strictly positive:
  #[#set math.equation(numbering: n => "(4.6)")
   $ h \( u \) > 0 quad upright("for ") u lt.eq a_0 \, med u eq.not 0 \, #h(2em) h \( a_0 \) gt.eq a_0^3 / 6 . $ <eq:entropy-slack-positive>]
  For the negative range, integrate $v \/ \( 1 + v \) lt.eq v$ over $0 lt.eq v lt.eq - u$ to obtain $ell \( u \) lt.eq u^2 \/ 2$. Since $B < 1$, this proves strict positivity for $u < 0$. For the positive range, use $ell \( u \) = sum_(r gt.eq 2) u^r \/ r$: it shows that $ell \( u \) \/ u^2$ is increasing on $0 < u < 1$. Moreover, using $B = 1 - a_0$,
  $ h \( a_0 \) = a_0^2 / 2 - \( 1 - a_0 \) ell \( a_0 \) = sum_(r gt.eq 3) frac(a_0^r, r \( r - 1 \)) gt.eq a_0^3 / 6 . $
  It follows that $h \( u \) \/ u^2 gt.eq h \( a_0 \) \/ a_0^2 > 0$ for $0 < u lt.eq a_0$, proving (4.6).
  We now choose the transport parameter. If $u_(*) = \( C - B \) \/ \( 1 + k \) lt.eq a_0$ and $C eq.not B$, set $u = u_(*)$ in (4.5). The square vanishes and $h \( u_(*) \) > 0$, so (4.3) is strict. If $u_(*) > a_0$, put
  $ C_0 = 1 + k a_0 \, #h(2em) C_1 = C_0 + sqrt(frac(1 + k, 3)) thin a_0^(3 \/ 2) . $
  In this case $C > C_0$. The endpoint choice $u = a_0$ in (4.5) still gives
  $ j D - frac(\( C - B \)^2, 2 \( 1 + k \)) gt.eq a_0^3 / 6 - frac(\( C - C_0 \)^2, 2 \( 1 + k \)) . $
  This proves strictness throughout $C_0 < C < C_1$ and leaves only the range beginning at $C_1$.
  ===== 4.2 The remaining range. <the-remaining-range.>
  For $C gt.eq C_1$, we use the second moment to obtain the remaining entropy bound. Put $v = bb(E)_P \[ \( y - d \)^2 \] \/ s > 0$. Comparison with the Gaussian $N \( d \, s v \)$ gives the exact identity
  $ D = D \( P bar.v.double N \( d \, s v \) \) + frac(v - 1 - log v, 2) \, $
  and hence $2 D gt.eq v - 1 - log v$. Cauchy–Schwarz gives
  $ v gt.eq frac(a^2, s q) = frac(C^2, j k) > 1 \, $
  where the last inequality follows from $C gt.eq C_1 > C_0 > 1$ and $j k < 1$. The function $v mapsto v - 1 - log v$ is increasing for $v gt.eq 1$, so
  $ 2 j D gt.eq C^2 / k - j - j log frac(C^2, j k) gt.eq C^2 / k - 1 - log C^2 / k . $
  The second inequality removes $j$ from the lower bound. Indeed, with $C \, k$ held fixed, the derivative of $C^2 \/ k - lambda - lambda log \( C^2 \/ \( lambda k \) \)$ is $- log \( C^2 \/ \( lambda k \) \) lt.eq 0$ for $j lt.eq lambda lt.eq 1$. Thus the remaining comparison with the target reduces to
  $ f \( C \) := C^2 / k - 1 - log C^2 / k - frac(\( C - B \)^2, 1 + k) > 0 quad \( C gt.eq C_1 \) . $
  We estimate $f$ at $C_0$ and control its increase from $C_0$ to $C_1$. Direct simplification at $C_0$ gives
  $ f \( C_0 \) & = 1 / k - 1 + log k + 2 a_0 - a_0^2 - 2 log \( 1 + k a_0 \)\
 & gt.eq - frac(2 a_0^3, 3) . $
  Indeed $1 \/ k - 1 + log k gt.eq 0$ for $0 < k lt.eq 1$, and
  $ log \( 1 + k a_0 \) lt.eq log \( 1 + a_0 \) lt.eq a_0 - a_0^2 / 2 + a_0^3 / 3 . $
  The last bound follows by integrating $\( 1 + x \)^(- 1) lt.eq 1 - x + x^2$ from zero to $a_0$. Differentiation also gives
  $ f' \( C_0 \) & = 2 / k - frac(2, 1 + k a_0) gt.eq frac(2 a_0, 1 + a_0) \,\
f'' \( C \) & = frac(2, k \( 1 + k \)) + 2 / C^2 gt.eq 1 #h(2em) \( C > 0 \) . $
  For completeness, the first inequality follows from
  $ 1 / k - frac(1, 1 + k a_0) - frac(a_0, 1 + a_0) = frac(\( 1 - k \) \( 1 + a_0 + k a_0^2 \), k \( 1 + k a_0 \) \( 1 + a_0 \)) gt.eq 0 . $
  The derivative bounds compensate for the possible negative value at $C_0$. Write $Delta = C_1 - C_0 gt.eq a_0^(3 \/ 2) \/ sqrt(3)$ and integrate them to obtain
  $ f \( C_1 \) & gt.eq - frac(2 a_0^3, 3) + frac(2 a_0, 1 + a_0) Delta + Delta^2 / 2\
 & gt.eq a_0^3 (- 2 / 3 + frac(2, sqrt(3) \( 1 + a_0 \) sqrt(a_0)) + 1 / 6) > 0 . $
  The strict inequality uses $0 < a_0 < 1$ and $1 \/ sqrt(3) + 1 \/ 6 > 2 \/ 3$. Since $f'$ is positive at $C_0$ and increasing thereafter, $f \( C \) > 0$ for every $C gt.eq C_1$.
  The two ranges together prove strictness in (4.3) whenever $C eq.not B$. To finish the equality case, suppose $C = B$. The target then has right-hand side zero, so equality is equivalent to $D = 0$, or $P = N \( d \, s \)$. Conversely, Gaussian integration by parts gives $a = s bb(E)_P "sech"^2 y = s b$ for this law, which verifies equality. ◻
]

We next impose the scalar consistency equations used in the application. Here the Gaussian parameters themselves depend on $P$: for given $t gt.eq 0$ and $sigma gt.eq 0$, set

#[#set math.equation(numbering: n => "(4.7)")
 $ M = bb(E)_P tanh y \, #h(2em) q = bb(E)_P tanh^2 y \, #h(2em) d = t + j M \, #h(2em) s = t + sigma^2 + j q . $ <eq:scalar-consistency>]

These equations give $s gt.eq j q$, the comparison required by Lemma 7. When $s > 0$, that lemma restricts equality to Gaussian laws. The next result identifies which Gaussian laws satisfy the consistency equations when $sigma = 0$, and also treats the degenerate case at $t = 0$.

#thm([Lemma 4.2.])[
  (The consistent Gaussian law).  #emph[Fix $0 < j < 1$. For each $t gt.eq 0$, the equation 
#[#set math.equation(numbering: n => "(4.8)")
 $ s_(*) \( t \) = t + j bb(E)_(N \( s_(*) \( t \) \, s_(*) \( t \) \)) tanh y $ <eq:scalar-fixed-point>]

 has a unique nonnegative solution, where $N \( 0 \, 0 \)$ means the point mass at zero. Its associated Gaussian law $P_(*) \( t \) = N \( s_(*) \( t \) \, s_(*) \( t \) \)$ is the unique Gaussian law satisfying (4.7) with $sigma = 0$. Thus, among consistent laws with $s > 0$, equality in (4.1) holds precisely at $P_(*) \( t \)$.]
  #emph[The function $t mapsto s_(*) \( t \)$ is Lipschitz with constant $\( 1 - j \)^(- 1)$, and 
#[#set math.equation(numbering: n => "(4.9)")
 $ t lt.eq s_(*) \( t \) lt.eq frac(t, 1 - j) \, #h(2em) q_(*) \( t \) := bb(E)_(P_(*) \( t \)) tanh^2 y = frac(s_(*) \( t \) - t, j) lt.eq frac(t, 1 - j) . $ <eq:scalar-fixed-point-bounds>]

 In particular $s_(*) \( 0 \) = q_(*) \( 0 \) = 0$, and $s_(*) \( t \) \, q_(*) \( t \) > 0$ for $t > 0$.]
] <lem:gaussian-equality>

#proof[
  We first show that a consistent Gaussian must have equal mean and variance. We then solve the resulting one-variable fixed-point equation and prove the bounds in the statement.
  Two Gaussian symmetry identities provide the first step. For $s > 0$, the density $rho_s$ of $N \( s \, s \)$ satisfies
  $ frac(rho_s \( y \) - rho_s \( - y \), rho_s \( y \) + rho_s \( - y \)) = tanh y . $
  Pairing the integrals over $y$ and $- y$ therefore gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E)_(N \( s \, s \)) tanh y = bb(E)_(N \( s \, s \)) tanh^2 y . $ <eq:gaussian-nishimori>]
  Second, if $d gt.eq 0$ and $s > 0$, pairing the positive and negative half-lines shows that
  #[#set math.equation(numbering: n => "(4.11)")
   $ bb(E)_(N \( d \, s \)) \[ tanh y thin "sech"^2 y \] gt.eq 0 . $ <eq:gaussian-odd-sign>]
  Here the integrand is odd and nonnegative for $y gt.eq 0$, while the density at $y$ is at least its value at $- y$ when $d gt.eq 0$.
  Now suppose a Gaussian law $N \( d \, s \)$ with $s > 0$ satisfies (4.7) with $sigma = 0$. We begin by locating its mean. For fixed $s$, the map
  $ d mapsto t + j bb(E)_(N \( d \, s \)) tanh y $
  is a contraction with Lipschitz constant at most $j$, because its derivative is $j bb(E)_(N \( d \, s \)) "sech"^2 y in \[ 0 \, j \]$. Iteration from zero stays nonnegative, so its unique fixed point $d$ is nonnegative.
  To compare this nonnegative mean with the variance, keep $s$ fixed and define
  $ H_s \( d \) = bb(E)_(N \( d \, s \)) \[ tanh y - tanh^2 y \] . $
  For $d gt.eq 0$, Gaussian differentiation and (4.11) give
  $ H'_s \( d \) = bb(E)_(N \( d \, s \)) \[ \( 1 - m^2 \) \( 1 - 2 m \) \] in \[ - 1 \, 1 \] . $
  Indeed the integrand is bounded below by $- 1$, and its expectation is at most $bb(E) \( 1 - m^2 \) lt.eq 1$ after subtracting $2 bb(E) \[ m \( 1 - m^2 \) \] gt.eq 0$. Thus $H_s$ is 1-Lipschitz on $\[ 0 \, oo \)$. By (4.10), $H_s \( s \) = 0$. On the other hand, consistency says $d - s = j \( M - q \) = j H_s \( d \)$. Consequently
  $ \| H_s \( d \) \| lt.eq \| d - s \| = j \| H_s \( d \) \| \, $
  forcing $H_s \( d \) = 0$ and $d = s$. The consistent Gaussian law must therefore satisfy (4.8).
  It remains to solve (4.8). Set
  $ F \( s \) = bb(E)_(N \( s \, s \)) tanh y quad \( s > 0 \) \, #h(2em) F \( 0 \) = 0 . $
  It is continuous at zero by bounded convergence. For $s > 0$, differentiating both the Gaussian mean and variance gives
  $ F' \( s \) & = bb(E)_(N \( s \, s \)) [\( tanh y \)' + 1 / 2 \( tanh y \)'']\
 & = bb(E)_(N \( s \, s \)) \[ \( 1 - m^2 \) \( 1 - m \) \] in \[ 0 \, 1 \] . $
  The lower bound is pointwise; the upper bound follows from (4.11). Hence $F$ is nonnegative and 1-Lipschitz on $\[ 0 \, oo \)$, with $F \( s \) lt.eq s$. Consequently, $s mapsto t + j F \( s \)$ is a contraction of $\[ 0 \, oo \)$ into itself and has exactly one fixed point $s_(*) \( t \)$. The identity (4.10) then verifies both consistency equations for $N \( s_(*) \( t \) \, s_(*) \( t \) \)$. If a consistent law has $s = 0$, then $0 = t + j q$ forces $t = q = 0$, and hence the law is the point mass at zero and $d = 0$; this agrees with the solution just constructed.
  Existence and uniqueness are now established, including the degenerate case. To obtain the dependence on time, compare the fixed-point equations at $t \, t'$:
  $ \| s_(*) \( t \) - s_(*) \( t' \) \| lt.eq \| t - t' \| + j \| s_(*) \( t \) - s_(*) \( t' \) \| \, $
  which proves the asserted Lipschitz bound. The size estimates follow from $0 lt.eq F \( s \) lt.eq s$, which gives $t lt.eq s_(*) \( t \) lt.eq t \/ \( 1 - j \)$, and (4.10) gives $q_(*) \( t \) = F \( s_(*) \( t \) \) = \( s_(*) \( t \) - t \) \/ j lt.eq t \/ \( 1 - j \)$. For $t > 0$, the variance $s_(*) \( t \)$ is positive, so its Gaussian law is nondegenerate and $q_(*) \( t \) > 0$. The equality assertion follows from Lemma 7. ◻
]

== 5 Stable fields along Gaussian observations <sec:stability>

The observation argument requires control of every approximate solution of the field equation at the fields visited by the observation process. We first prove this stability statement, including perturbations of the diagonal variance matrix, and then derive a deterministic existence, uniqueness, and inverse estimate for the field equation.

For a symmetric matrix $J$, a field $h_0 in bb(R)^n$, and $y in bb(R)^n$, define

#[#set math.equation(numbering: n => "(5.1)")
 $ m \( y \) & = tanh y \, #h(2em) q \( y \) = chevron.l m \( y \)^2 chevron.r \, #h(2em) b \( y \) = 1 - q \( y \) \,\
V_y & = D_(1 - m \( y \)^2) \, #h(2em) B \( y \) = j b \( y \) \,\
F_(J \, h_0) \( y \) & = y - h_0 + \( B \( y \) I - J \) m \( y \) . $ <eq:field-map>]

For fixed $J$, abbreviate $F_h = F_(J \, h)$; we also suppress $h$ when there is no ambiguity. Hyperbolic functions act coordinatewise. To measure stability while allowing the diagonal factor to vary, define, for each nonnegative diagonal matrix $A$,

#[#set math.equation(numbering: n => "(5.2)")
 $ sans(H)_J \( y \, A \) = I + A^(1 \/ 2) (B \( y \) I - J - frac(2 j, n) m \( y \) m \( y \)^(sans(T))) A^(1 \/ 2) . $ <eq:field-hessian>]

The matrix $sans(H)_J \( y \, V_y \)$ is the symmetric version of the possibly nonsymmetric derivative $F'_(J \, h_0) \( y \)$. The external field $h_0$ enters the residual $F_(J \, h_0) \( y \)$ but not $sans(H)_J \( y \, A \)$. This separation will let us use the same matrix witness when the observation field moves.

#thm([Proposition 5.1.])[
  (Stability along observations).  #emph[Fix $j in \( 0 \, 1 \)$ and $0 < T < oo$. There are constants $eta \, c \, epsilon.alt_A \, rho_0 \, a > 0$, depending only on $j \, T$, and events $cal(J)_n$ for the zero-diagonal Gaussian matrix $J$, such that $bb(P) \( J in cal(J)_n \) arrow.r 1$ and the following assertion holds for every $J in cal(J)_n$. Let $X tilde.op mu_0$, let $B_0$ be an independent standard $n$-dimensional Brownian motion, and put $Y \( t \) = t X + B_0 \( t \)$. With conditional probability at least $1 - e^(- a n)$, simultaneously for $0 lt.eq t lt.eq T$, $y in bb(R)^n$, and all diagonal $A$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ lr(bar.v.double F_(J \, Y \( t \)) \( y \) bar.v.double) lt.eq 2 rho_0 sqrt(n) \,\
0 lt.eq A lt.eq \( 1 + eta \) I \, #h(2em) lr(bar.v.double A - V_y bar.v.double)_(upright(F)) lt.eq epsilon.alt_A sqrt(n)} quad arrow.r.double quad sans(H)_J \( y \, A \) succ c I . $ <eq:stable-field>]

 We may require $j \( 1 + eta \)^2 < 1$ and $lr(bar.v.double  bar.v.double) J lt.eq 2 sqrt(j) + theta$ on $cal(J)_n$, for any sufficiently small fixed $theta > 0$ chosen in the proof.]
] <prop:stable-fields>

#thm([Corollary 5.2.])[
  (Stopping formulation).  #emph[For every $J in cal(J)_n$ there is an observation stopping time $tau_0$ such that 
$ bb(P) \( tau_0 lt.eq T divides J \) lt.eq e^(- a n) \, $

 and, for every $t in \[ 0 \, T \]$ with $t < tau_0$, the implication (5.3) holds at $Y \( t \)$ with residual threshold $rho_0 sqrt(n)$ in place of $2 rho_0 sqrt(n)$. The stopping rule depends on $J$ and the observations, and is independent of any test function.]
] <cor:stopping>

#proof[
  We express failure of stability through a witness set that is fixed before observing the path. Let $cal(W)_J$ consist of pairs $\( y \, A \)$ satisfying $0 lt.eq A lt.eq \( 1 + eta \) I$ and $lr(bar.v.double A - V_y bar.v.double)_(upright(F)) lt.eq epsilon.alt_A sqrt(n)$ for which $sans(H)_J \( y \, A \) succ.not c I$. Define the least normalized residual among these witnesses by
  $ d_J \( h \) = inf_(\( y \, A \) in cal(W)_J) lr(bar.v.double F_(J \, h) \( y \) bar.v.double) / sqrt(n) \, #h(2em) inf diameter = + oo . $
  If $cal(W)_J$ is nonempty, $d_J$ is finite and $n^(- 1 \/ 2)$-Lipschitz, because $F_(J \, h) \( y \) = F_(J \, 0) \( y \) - h$. Let
  $ tau_0 = inf { t in \[ 0 \, T \] : d_J \( Y \( t \) \) lt.eq rho_0 } \, $
  with value $+ oo$ when the set is empty. Continuity makes the first hitting time an observation stopping time. Before the hit, every violating witness has residual greater than $rho_0 sqrt(n)$. At a hit, the definition of the infimum supplies a violating witness with residual strictly below $2 rho_0 sqrt(n)$; attainment of the infimum is unnecessary. Proposition 9 therefore bounds the hitting probability. ◻
]

The proof of Proposition 9 has three parts. A Gaussian integral bounds the weight of unstable configurations; its scalar rate is controlled by the entropy inequality, and its conditional matrix factor is controlled near the equality laws. A local-volume estimate then shows that any unstable approximate zero would contribute too much to that integral. Finally we transfer the resulting estimate to the original observation law, uniformly over the time interval.

=== 5.1 A Gaussian integral and its scalar rate <a-gaussian-integral-and-its-scalar-rate>

We carry out the integral calculation first under a planted Gaussian law, whose relation to the original law will be proved when we assemble the path estimate. Under this law,

#[#set math.equation(numbering: n => "(5.4)")
 $ tilde(J) = W + j / n upright(bold(1)) upright(bold(1))^(sans(T)) \, #h(2em) h_0 = t upright(bold(1)) + sqrt(t) thin g \, $ <eq:planted-field>]

where $W$ is centered GOE of scale $j$ and $g$ is independent standard Gaussian. We retain the diagonal of $tilde(J)$ during this calculation. For a Borel set $cal(E) subset.eq bb(R)^n times upright("Sym")_n$, define

#[#set math.equation(numbering: n => "(5.5)")
 $ I_(t \, sigma) \( cal(E) \) = \( 2 pi sigma^2 \)^(- n \/ 2) integral upright(bold(1))_({ \( y \, tilde(J) \) in cal(E) }) exp {- frac(lr(bar.v.double F_(tilde(J) \, h_0) \( y \) bar.v.double)^2, 2 sigma^2) + frac(n j b \( y \)^2, 2)} thin upright(d) y \, #h(2em) sigma > 0 . $ <eq:field-integral>]

The weight $e^(n j b \( y \)^2 \/ 2)$ compensates for the exponential scale of the local determinant: Lemma 14 will use the regularized determinant bound to turn an approximate zero into a lower bound for this integral. The sets to which we apply the integral depend on $y \, tilde(J)$ and are independent of $h_0$. Thus the observation can be averaged while retaining the restriction to $cal(E)$.

For fixed $y \, t \, sigma$, introduce the scalar quantities

#[#set math.equation(numbering: n => "(5.6)")
 $ m = tanh y \, quad q = chevron.l m^2 chevron.r \, quad b = 1 - q \, quad B = j b \, quad M = chevron.l chevron.r m \,\
d = t + j M \, #h(2em) s = t + sigma^2 + j q \, #h(2em) S = s + j q \,\
a_y = chevron.l \( y - d upright(bold(1)) \) m chevron.r \, #h(2em) z = y - d upright(bold(1)) + B m \, #h(2em) psi = frac(j \( a_y - s b \)^2, 2 s S) . $ <eq:scalar-parameters>]

Write $phi_(d \, s)$ for the density of $N \( d \, s \)$, with $s$ denoting the variance, and define

#[#set math.equation(numbering: n => "(5.7)")
 $ G_(t \, sigma \, n) \( y \) = product_(i = 1)^n phi_(d \, s) \( y_i \) thin e^(n psi) . $ <eq:scalar-density>]

The Gaussian parameters in this expression depend on $y$ through the preceding averages; the product is therefore not a fixed product density.

#thm([Lemma 5.3.])[
  (Conditional Gaussian reduction).  #emph[With the preceding definitions, and with $g'$ an independent standard Gaussian vector, 
#[#set math.equation(numbering: n => "(5.8)")
 $ bb(E) I_(t \, sigma) \( cal(E) \) = integral sqrt(s / S) thin G_(t \, sigma \, n) \( y \) bb(P) (\( y \, tilde(J) \) in cal(E) thin mid(bar.v) thin W m + sqrt(t + sigma^2) thin g' = z) thin upright(d) y . $ <eq:conditional-integral>]

 The conditional distribution in this identity is the usual Gaussian conditional distribution and is defined for every $y$, since $sigma > 0$.]
] <lem:gaussian-reduction>

#proof[
  We first evaluate the integral without its indicator. For fixed $m$, the GOE covariance is
  $ "Cov" \( W m \) = j q I + j / n m m^(sans(T)) . $
  Convolution with the heat kernel of variance $sigma^2$ and with $sqrt(t) thin g$ therefore produces the Gaussian vector $W m + sqrt(t + sigma^2) thin g'$, of covariance $s I + j m m^(sans(T)) \/ n$. Its determinant is $s^n S \/ s$, and its inverse is
  $ 1 / s I - frac(j, n s S) m m^(sans(T)) . $
  Moreover, $F_(tilde(J) \, h_0) \( y \) = z - W m - sqrt(t) thin g$. The Gaussian density at $z$, multiplied by $e^(n j b^2 \/ 2)$, differs from $product_i phi_(d \, s) \( y_i \)$ by the prefactor $sqrt(s \/ S)$ and the exponential whose logarithm divided by $n$ is
  $ - frac(B a_y, s) - frac(B^2 q, 2 s) + frac(j \( a_y + B q \)^2, 2 s S) + frac(j b^2, 2) = frac(j \( a_y - s b \)^2, 2 s S) . $
  This calculation gives the identity for the unrestricted integral. To retain the indicator, condition the joint Gaussian pair formed by $W$ and the convolved observation on the value $z$ of the latter. The resulting conditional probability is exactly the factor in (5.8). All integrands are nonnegative, so Tonelli’s theorem justifies the interchange of integrations. ◻
]

The scalar entropy inequality controls the remaining integral in (5.8). To apply it, replace empirical averages in (5.6) by integration against a probability measure $P$ with finite second moment, keeping the notation $M \, q \, b \, d \, s \, S \, a_y \, psi$. Where needed, write $a \( P \)$ instead of $a_y$. Lemma 7 then gives

#[#set math.equation(numbering: n => "(5.9)")
 $ psi \( P \, t \, sigma \) - D \( P bar.v.double N \( d \, s \) \) lt.eq 0 #h(2em) \( s > 0 \) . $ <eq:rate-nonpositive>]

At $sigma = 0$, Lemma 8 identifies all equality cases: they form the curve

$ P_t = N \( s_(*) \( t \) \, s_(*) \( t \) \) \, #h(2em) s_(*) \( t \) = t + j bb(E)_(P_t) tanh y \, $

with the point-mass convention $P_0 = delta_0$. In particular, $s_(*) \( t \) lt.eq t \/ \( 1 - j \)$ and $q \( P_t \) = \( s_(*) \( t \) - t \) \/ j lt.eq t \/ \( 1 - j \)$.

#thm([Lemma 5.4.])[
  (Uniform scalar rate bounds).  #emph[Fix $j in \( 0 \, 1 \)$ and $T < oo$.]
  + #emph[For every $s_min > 0$ and $L < oo$, one can choose $R < oo$ such that, for all sufficiently large $n$, uniformly over $0 lt.eq t lt.eq T$ and $0 < sigma lt.eq 1$, 
$ integral_({ s gt.eq s_min \, thin chevron.l y^2 chevron.r > R^2 }) G_(t \, sigma \, n) \( y \) thin upright(d) y lt.eq e^(- L n) . $

 For every $epsilon > 0$, the unrestricted integral over ${ s gt.eq s_min }$ is at most $e^(epsilon n)$ for all sufficiently large $n$.]
  + #emph[Fix $t_0 > 0$. Outside any prescribed open neighborhood of the equality curve ${ \( P_t \, t \) : t_0 lt.eq t lt.eq T }$, there are $a \, sigma_(*) > 0$ such that the integral of $G_(t \, sigma \, n)$ is at most $e^(- a n)$, uniformly over $t_0 lt.eq t lt.eq T$ and $0 < sigma lt.eq sigma_(*)$, for all sufficiently large $n$. The neighborhood can impose weak closeness of the empirical law and closeness of any finite list of continuous, at most linearly growing averages, including all parameters in (5.6).]
  + #emph[For every $q_0 > 0$, there are $t_0 \, sigma_(*) \, a > 0$ such that 
$ integral_({ q gt.eq q_0 }) G_(t \, sigma \, n) \( y \) thin upright(d) y lt.eq e^(- a n) $

 uniformly over $0 lt.eq t lt.eq t_0$ and $0 < sigma lt.eq sigma_(*)$, for all sufficiently large $n$.]
  + #emph[Fix $t_0 > 0$ and $nu > 0$. For all sufficiently large $R_1$ there is $a > 0$ such that 
$ integral_({ chevron.l y^2 upright(bold(1))_({ \| y \| > R_1 }) chevron.r > nu }) G_(t \, sigma \, n) \( y \) thin upright(d) y lt.eq e^(- a n) \, $

 uniformly over $t_0 lt.eq t lt.eq T$ and $0 < sigma lt.eq 1$, for all sufficiently large $n$.]
  #emph[All constants are independent of $n \, t \, sigma$ in the indicated ranges. In (ii), neighborhoods are interpreted on each fixed second-moment ball; the complement of a sufficiently large such ball is covered by (i).]
] <lem:scalar-rates>

#proof[
  We first obtain a Gaussian tail envelope, then prove a compact-set bound by a finite cover. Strict negativity away from the equality laws will give the second and third assertions; an exponential tilt will give the fourth.
  Throughout, $\| d \| lt.eq T + j$ and $s lt.eq T + 1 + j$. Also $a \( P \)^2 lt.eq q integral \( y - d \)^2 thin upright(d) P$ and $j q \/ S lt.eq 1 \/ 2$. The elementary inequality $\( r - u \)^2 lt.eq 3 / 2 r^2 + 3 u^2$ consequently gives
  $ n psi lt.eq frac(3 j q, 4 s S) sum_i \( y_i - d \)^2 + frac(3 n j, 2) lt.eq frac(3, 8 s) sum_i \( y_i - d \)^2 + frac(3 n j, 2) . $
  On $s gt.eq s_min$, it follows that
  #[#set math.equation(numbering: n => "(5.10)")
   $ G_(t \, sigma \, n) \( y \) lt.eq exp (C n - c sum_i y_i^2) \, $ <eq:scalar-tail-envelope>]
  where $c > 0$ and $C < oo$ depend only on $j \, T \, s_min$. On $sum_i y_i^2 > n R^2$, use half of the remaining Gaussian square for integration and the other half for the required exponential decay. This proves the first assertion of (i).
  The estimates on bounded second moments follow from one compactness argument, which we now give in full. Put
  $ cal(P)_R = {P : integral y^2 thin upright(d) P lt.eq R^2} . $
  Tightness and preservation of the second-moment bound under weak limits make this set weakly compact. Integration of a continuous function of at most linear growth is continuous on it: the second-moment bound makes the contribution of $\| y \| > K$ uniformly $O \( K^(- 1) \)$, while bounded truncations are weakly continuous. In particular, $d \, s \, a \( P \) \, psi$ are continuous on $cal(P)_R times \[ 0 \, T \] times \[ 0 \, 1 \]$ where $s gt.eq s_min$.
  For every compact subset $cal(C)$ of that region,
  #[#set math.equation(numbering: n => "(5.11)")
   $ limsup_(n arrow.r oo) 1 / n log sup_(t \, sigma) integral_({ \( P_y \, t \, sigma \) in cal(C) }) G_(t \, sigma \, n) \( y \) thin upright(d) y lt.eq sup_(cal(C)) { psi - D \( P bar.v.double N \( d \, s \) \) #scale(x: 120%, y: 120%)[}] \, $ <eq:compact-rate-bound>]
  where $P_y = n^(- 1) sum_i delta_(y_i)$; empty integrals are zero. To establish this bound, fix a strict finite upper bound $r$ for its right-hand side. At each $xi = \( P \, t \, sigma \) in cal(C)$, choose a bounded continuous test function $phi_xi$ from the variational formula for relative entropy so that
  $ psi \( xi \) - integral phi_xi thin upright(d) P + log integral e^(phi_xi) thin upright(d) N \( d \, s \) < r . $
  Such a test also exists when the entropy is infinite. Retain positive slack in the inequality and then choose a neighborhood of $xi$ on which continuity controls $psi$, the empirical average of $phi_xi$, and $d \, s$. Moreover, on $sum_i y_i^2 lt.eq n R^2$, the logarithmic density ratio between $N \( d' \, s' \)^(⊗ n)$ and the fixed law $N \( d \, s \)^(⊗ n)$ is at most $n$ times a quantity tending uniformly to zero as $\( d' \, s' \) arrow.r \( d \, s \)$; this follows directly by expanding their Gaussian log densities. For $y$ in that neighborhood, insert $e^(sum_i phi_xi \( y_i \))$ and bound its expectation under the fixed product Gaussian. The integral on the neighborhood is then at most $e^(n r)$, after using less than the reserved slack for the three continuity errors. Cover $cal(C)$ by finitely many such neighborhoods. An arbitrarily small enlargement of $r$ absorbs their number and proves (5.11). Combining this bound with (5.9) on the ball and (5.10) outside it proves the second assertion of (i).
  To obtain a strictly negative rate, observe that the same variational formula expresses relative entropy as a supremum of continuous functions. Thus it is jointly lower semicontinuous in $P \, d \, s$ when $s$ is bounded away from zero, and $psi - D$ is upper semicontinuous. At $sigma = 0$, its zero set is precisely the equality curve identified above. On a compact set disjoint from any open neighborhood of that curve its supremum is strictly negative. The same remains true for all sufficiently small $sigma$: otherwise a convergent sequence with $sigma arrow.b 0$ and rates approaching zero would give an equality point outside that neighborhood. Apply (5.11), with $s_min = t_0$, and then choose the second-moment tail rate in (i) strictly negative. This proves (ii).
  Near time zero, the restriction on $q$ supplies the positive variance needed for the same argument. For (iii), choose $t_0$ so small that $t_0 \/ \( 1 - j \) < q_0 \/ 2$. The set $q gt.eq q_0$ contains no equality point at $sigma = 0$ and $0 lt.eq t lt.eq t_0$. On this set $s gt.eq j q_0 > 0$, so the preceding compactness argument and the tail envelope apply without change, including at $t = 0$.
  It remains to control the contribution of large coordinates in (iv). Fix $t_0 \, nu > 0$, and take $0 < lambda < 1 \/ \[ 8 \( T + 1 + j \) \]$. Let $h_(R_1) \( y \) = y^2 upright(bold(1))_({ \| y \| > R_1 })$. On a fixed second-moment ball, repeat the proof of (5.11), this time inserting $e^(lambda sum_i h_(R_1) \( y_i \))$. Begin with any small positive rate bound $epsilon$ in that proof and its finite collection of tests $phi_xi$. Uniformly for $\| d \| lt.eq T + j$ and $t_0 lt.eq s lt.eq T + 1 + j$,
  $ integral #scale(x: 120%, y: 120%)[\(] e^(lambda h_(R_1) \( y \)) - 1 #scale(x: 120%, y: 120%)[\)] thin upright(d) N \( d \, s \) \( y \) arrow.r 0 #h(2em) \( R_1 arrow.r oo \) \, $
  by Gaussian tails; the choice of $lambda$ leaves a uniformly negative quadratic exponent. The same holds with the integrand multiplied by any of the finitely many bounded $e^(phi_xi)$. The additional logarithmic moment can therefore be made arbitrarily small in every member of the finite cover. For sufficiently large $R_1$, the tilted integral on the ball is at most $e^(2 epsilon n)$. On $chevron.l h_(R_1) \( y \) chevron.r > nu$, remove the tilt at cost $e^(- lambda nu n)$. Choosing $2 epsilon < lambda nu \/ 2$ gives a strictly negative rate there. The integral off the ball is estimated without the tilt, using (i) with a larger negative rate. This proves (iv). ◻
]

=== 5.2 The conditional Hessian <the-conditional-hessian>

The scalar bounds concentrate the integral near the equality curve. We now show that, there, the conditional Hessian is positive with an exponential probability bound. The conclusion is simultaneous over all admissible nearby diagonal matrices, which will be needed to exclude every unstable approximate zero.

#thm([Lemma 5.5.])[
  (Conditional stability near the scalar equality curve).  #emph[Fix $0 < t_0 lt.eq T$, $R < oo$, and $eta > 0$ with $j \( 1 + eta \)^2 < 1$. There are $c_(*) \, epsilon.alt_(*) \, a_(*) \, sigma_(*) > 0$, a neighborhood $cal(U)$ of ${ \( P_t \, t \) : t_0 lt.eq t lt.eq T }$, a tail tolerance $nu > 0$, and a finite $R_1$ such that the following holds. Suppose 
$ chevron.l y^2 chevron.r lt.eq R^2 \, #h(2em) \( P_y \, t \) in cal(U) \, #h(2em) chevron.l y^2 upright(bold(1))_({ \| y \| > R_1 }) chevron.r lt.eq nu \, #h(2em) t_0 lt.eq t lt.eq T \, quad 0 < sigma lt.eq sigma_(*) . $

 Under the Gaussian conditioning in (5.8), with probability at least $1 - e^(- a_(*) n)$, simultaneously for all diagonal $A$ satisfying 
$ 0 lt.eq A lt.eq \( 1 + eta \) I \, #h(2em) lr(bar.v.double A - V_y bar.v.double)_(upright(F)) lt.eq epsilon.alt_(*) sqrt(n) \, $

 one has $sans(H)_(tilde(J)) \( y \, A \) succ.curly.eq c_(*) I$. All constants are uniform over the displayed ranges and sufficiently large $n$. The tail cutoff $R_1$ may be required to be arbitrarily large after choosing $nu$; $epsilon.alt_(*)$ is then decreased if necessary.]
] <lem:conditional-field-stability>

#proof[
  We first compute the Gaussian regression and the finite-rank correction at an equality law. We then show that the empirical-law and diagonal hypotheses preserve its positive margin, uniformly over all admissible diagonals.
  ===== 5.2.1 Gaussian regression and whitening. <gaussian-regression-and-whitening.>
  In a sufficiently small neighborhood of the equality curve, $s$ and $q$ have positive lower bounds depending on $j \, t_0 \, T$. Indeed $s_(*) \( t \) gt.eq t_0$, and $q \( P_t \) = bb(E)_(P_t) tanh^2 y$ is positive and continuous there. Set
  $ u = m / sqrt(n q) \, #h(2em) Z_1 = frac(y - d upright(bold(1)), sqrt(n s)) \, #h(2em) P_u = I - u u^(sans(T)) . $
  The norms of $upright(bold(1)) \/ sqrt(n) \, u \, Z_1$ are bounded uniformly by the assumed second-moment bound. Write
  $ W = P_u W P_u + u w^(sans(T)) + w u^(sans(T)) + alpha u u^(sans(T)) . $
  The three blocks in this decomposition are independent before conditioning, with $"Cov" \( w \) = \( j \/ n \) P_u$ and $"Var" \( alpha \) = 2 j \/ n$. The projection of the observation in (5.8) perpendicular to $u$ observes $sqrt(n q) thin w$ with independent noise of covariance $\( t + sigma^2 \) P_u$; projecting along $u$ observes $sqrt(n q) thin alpha$ with noise variance $t + sigma^2$. The elementary Gaussian conditional-mean and conditional-variance formulas therefore give the following representation, using a fresh centered GOE $W_0$:
  #[#set math.equation(numbering: n => "(5.12)")
   $ P_u W P_u & = P_u W_0 P_u \,\
w & = macron(w) + kappa P_u W_0 u \, #h(2em) macron(w) = j sqrt(q \/ s) thin Z_1 - frac(j a_y, s) u \, #h(2em) kappa = sqrt(frac(t + sigma^2, s)) \,\
alpha & = frac(2 j \( a_y + B q \), S) + sqrt(frac(t + sigma^2, S)) thin u^(sans(T)) W_0 u . $ <eq:conditional-W>]
  For example, the perpendicular conditional mean is $j sqrt(q \/ s) thin P_u Z_1$, which equals the displayed $macron(w)$ because $u^(sans(T)) Z_1 = a_y \/ sqrt(q s)$. The parallel conditional mean follows from $u^(sans(T)) z = sqrt(n \/ q) \( a_y + B q \)$. The parallel residual variance is $\( 2 j \/ n \) \( t + sigma^2 \) \/ S$. These conditional means and residual variances verify all three blocks of (5.12).
  For the moment, fix a deterministic admissible $A$. We compare the conditional Hessian with the positive matrix built from the fresh GOE by setting
  $ chi = 1 / n "Tr" A \, #h(2em) B_A = j chi \, #h(2em) S_A = I + B_A A - A^(1 \/ 2) W_0 A^(1 \/ 2) \, #h(2em) cal(Y) \( p \) = S_A^(- 1 \/ 2) A^(1 \/ 2) p . $
  Lemma 3 gives $S_A succ.curly.eq c_0 I$ except with exponentially small probability, where $c_0 > 0$ is uniform in $A$. Let $G_A = A^(1 \/ 2) S_A^(- 1) A^(1 \/ 2)$. Lemma 5, applied to the three deterministic vectors $upright(bold(1)) \/ sqrt(n) \, u \, Z_1$, says that their Gram entries after $cal(Y)$ are as close as desired to their $A$-weighted Gram entries, and that the extra vector $cal(Y) \( W_0 u \)$ has Gram entries as close as desired to those of
  #[#set math.equation(numbering: n => "(5.13)")
   $ B_A cal(Y) \( u \) + sqrt(B_A) thin N \, $ <eq:extra-whitened-vector>]
  where $N$ is a unit vector orthogonal to the three deterministic images in this comparison. Specifically, its mixed entries are $B_A p^(sans(T)) A u$ and its squared norm is $B_A + B_A^2 u^(sans(T)) A u$. Here $N$ describes only Gram entries; this notation does not assert a coupling with an additional random or deterministic vector. The comparison concerns finite Gram matrices; the associated symmetric finite-rank eigenvalues depend continuously on their entries, as we verify when returning to the empirical parameters. Each fixed Gram tolerance has failure probability at most $C e^(- a n)$ uniformly over the bounded deterministic vectors and over $A$. Also $u^(sans(T)) W_0 u$ is smaller than any fixed tolerance with exponentially high probability, since its variance is $2 j \/ n$.
  ===== 5.2.2 The correction at an equality law. <the-correction-at-an-equality-law.>
  We now compute the finite-rank perturbation in the ideal Gram comparison. Set $sigma = 0$, take $s = s_(*) \( t \)$, and replace each weighted average $n^(- 1) sum_i A_(i i) f \( y_i \)$ by $bb(E)_(N \( s \, s \)) \[ "sech"^2 y thin f \( y \) \]$. Evaluate all other empirical averages under the same law. Thus $a_y = s b$, $B_A = B = j b$, and $kappa^2 = 1 - j q \/ s$. Write
  $ X_1 = cal(Y) \( upright(bold(1)) \/ sqrt(n) \) \, #h(2em) U = cal(Y) \( u \) \, #h(2em) Z_2 = cal(Y) \( Z_1 \) \, $
  using the Gram interpretation just described. Subtracting $W_0$ from (5.12) gives exactly
  #[#set math.equation(numbering: n => "(5.14)")
   $ W - W_0 =  & u macron(w)^(sans(T)) + macron(w) u^(sans(T)) - \( 1 - kappa \) { u \( W_0 u \)^(sans(T)) + \( W_0 u \) u^(sans(T)) }\
 & + { alpha + \( 1 - 2 kappa \) u^(sans(T)) W_0 u } u u^(sans(T)) . $ <eq:conditional-rank-difference>]
  At equality, $macron(w) = j sqrt(q \/ s) thin Z_1 - B u$ and $alpha = 2 B$ after discarding the vanishing Gaussian scalar. Whiten by $S_A$, and use (5.13) with $B_A = B$. The perturbation to subtract from the identity consists of the planted term $j X_1 X_1^(sans(T))$, the term $2 j q U U^(sans(T))$, and the whitened version of (5.14). The terms $- 2 B U U^(sans(T))$ and $+ 2 B U U^(sans(T))$ cancel. Eliminating the orthogonal direction $N$ by Schur complement adds $\( 1 - kappa \)^2 B U U^(sans(T))$ to the perturbation. Its total $U U^(sans(T))$ coefficient becomes
  $ 2 j q - 2 \( 1 - kappa \) B + \( 1 - kappa \)^2 B = j q \( 2 - B \/ s \) . $
  Consequently the Schur complement is the identity minus
  #[#set math.equation(numbering: n => "(5.15)")
   $ j { X_1 X_1^(sans(T)) + \( 2 - B \/ s \) M_1 M_1^(sans(T)) + M_1 G_1^(sans(T)) + G_1 M_1^(sans(T)) } \, #h(2em) M_1 = sqrt(q) thin U \, quad G_1 = Z_2 \/ sqrt(s) . $ <eq:limiting-rank-perturbation>]
  To prove positivity of this Schur complement, it suffices to examine its three-vector Gram matrix. Put $e = bb(E)_(N \( s \, s \)) \[ m^2 \( 1 - m^2 \) \]$. The Gram matrix of $\( X_1 \, M_1 \, G_1 \)$ equals
  #[#set math.equation(numbering: n => "(5.16)")
   $ H = mat(delim: "(", b, e, - 2 e; e, e, b - 3 e; - 2 e, b - 3 e, b \/ s - 2 b + 6 e) . $ <eq:limiting-Gram>]
  We derive the entries of this matrix explicitly. The density of $N \( s \, s \)$ satisfies $p \( y \) \/ p \( - y \) = e^(2 y)$. Pairing $y$ and $- y$ shows that every integrable odd function $f$ satisfies $bb(E) f \( y \) = bb(E) \[ f \( y \) tanh y \]$. This gives $bb(E) \[ m \( 1 - m^2 \) \] = e$. Gaussian integration by parts gives
  $ 1 / s bb(E) \[ \( y - s \) \( 1 - m^2 \) \] = - 2 e \, #h(2em) 1 / s bb(E) \[ \( y - s \) m \( 1 - m^2 \) \] = b - 3 e . $
  Applying it twice, and using $\( 1 - m^2 \)'' = 4 m^2 \( 1 - m^2 \) - 2 \( 1 - m^2 \)^2$, gives the final diagonal entry $b \/ s - 2 b + 6 e$. The remaining entries are immediate, proving (5.16).
  The coefficient matrix in (5.15) is
  $ C = j mat(delim: "(", 1, 0, 0; 0, 2 - B \/ s, 1; 0, 1, 0) . $
  Set $d_0 = 1 - j b$ and $g_1 = j e$. The first and third columns of $I - H C$ are $\( d_0 \, - g_1 \, 2 g_1 \)^(sans(T))$ and $\( - g_1 \, - g_1 \, d_0 + 3 g_1 \)^(sans(T))$. Adding $B \/ s$ times the third column to the second makes the second column $\( 0 \, d_0 + g_1 \, 0 \)^(sans(T))$. Hence
  #[#set math.equation(numbering: n => "(5.17)")
   $ det \( I - H C \) = \( d_0 + 2 g_1 \) \( d_0 + g_1 \)^2 > 0 . $ <eq:positive-rank-determinant>]
  The same determinant is obtained from the identity minus (5.15) on any ambient space containing its three vectors. To determine its sign as a quadratic form, first subtract only $j X_1 X_1^(sans(T))$; the result is positive definite because $j lr(bar.v.double X_1 bar.v.double)^2 = j b < 1$. The remaining two-vector perturbation has at most one positive eigenvalue, since its coefficient block $j mat(delim: "(", 2 - B \/ s, 1; 1, 0)$ has one positive and one negative eigenvalue. The resulting matrix can consequently have at most one nonpositive direction. The positive determinant in (5.17) excludes both a zero eigenvalue and a single negative eigenvalue. Hence the matrix is positive definite. The Schur complement then also gives positivity before $N$ was eliminated.
  ===== 5.2.3 Perturbing the scalar law and the diagonal. <perturbing-the-scalar-law-and-the-diagonal.>
  The equality calculation supplies the positive margin we need. We first explain why the hypotheses put the actual weighted Gram entries near these equality values.
  Each deterministic vector has coordinates $n^(- 1 \/ 2)$ times one of $1 \, m \/ sqrt(q) \, \( y - d \) \/ sqrt(s)$. Products of two such coordinate functions are bounded by $C \( 1 + y^2 \)$. For any such product $f$, the tail and Frobenius bounds imply
  #[#set math.equation(numbering: n => "(5.18)")
   $ lr(|1 / n sum_i \( A_(i i) - \( V_y \)_(i i) \) f \( y_i \)|) lt.eq C_(R_1) lr(bar.v.double A - V_y bar.v.double)_(upright(F)) / sqrt(n) + C nu . $ <eq:A-moment-comparison>]
  On $\| y_i \| lt.eq R_1$, use Cauchy–Schwarz and boundedness of $f$; outside, use $\| A_(i i) - \( V_y \)_(i i) \| lt.eq 2 + eta$ and the tail hypothesis, with $R_1 gt.eq 1$. The corresponding $V_y$-weighted functions are bounded and continuous, even when multiplied by $y^2$, because $"sech"^2 y$ decays exponentially. Their averages are therefore close to the equality-law averages in a sufficiently small weak neighborhood. The parameters $d \, s \, q \, a_y$ are continuous on the second-moment ball, so their denominators and coefficients are close as well. Finally $\| B_A - B \| lt.eq j lr(bar.v.double A - V_y bar.v.double)_(upright(F)) \/ sqrt(n)$.
  We retain the positivity uniformly for $t in \[ t_0 \, T \]$ and under small Gram errors. If $Q$ has finitely many columns, the nonzero eigenvalues of $Q C Q^(sans(T))$ agree with those of $\( Q^(sans(T)) Q \)^(1 \/ 2) C \( Q^(sans(T)) Q \)^(1 \/ 2)$, including multiplicity. The largest eigenvalue, with zero adjoined, is therefore a continuous function of the Gram matrix and the coefficients. All equality parameters vary continuously on the compact interval $\[ t_0 \, T \]$, and $s \, q$ stay positive there. The exact calculation thus gives a uniform positive whitened margin. Choose a fixed tolerance $xi > 0$ on coefficients and Gram entries small enough to preserve, say, half of it. Lemmas 3 and 5, the Gaussian scalar estimate, and (5.18) show that this tolerance is achieved for each fixed admissible $A$ with failure probability at most $C e^(- a n)$, after choosing the scalar neighborhood, tail tolerance, $sigma_(*)$, and Frobenius distance sufficiently small. Returning from whitening multiplies the margin by at least $c_0$. The omitted mass $\( B - B_A \) A$ has norm at most $j \( 1 + eta \) lr(bar.v.double A - V_y bar.v.double)_(upright(F)) \/ sqrt(n)$ and can be absorbed by decreasing that distance again.
  At this stage the margin is proved for each fixed $A$. To make it simultaneous, we use that its failure exponent is uniform over the bounded deterministic vector norms. Those bounds were fixed before choosing the Frobenius distance. Also (5.12) implies $lr(bar.v.double  bar.v.double) W lt.eq K_1$ with failure $C e^(- a_1 n)$ for some uniform $K_1$: the norms of the deterministic means are bounded, and the remaining terms are controlled by $lr(bar.v.double W_0 bar.v.double)$. On this event, $A mapsto sans(H)_(tilde(J)) \( y \, A \)$ is uniformly $1 \/ 2$-Hölder in diagonal sup norm. Indeed $lr(bar.v.double A^(1 \/ 2) - hat(A)^(1 \/ 2) bar.v.double) lt.eq lr(bar.v.double A - hat(A) bar.v.double)^(1 \/ 2)$, while the middle factor in (5.2) has bounded norm.
  Choose a fixed mesh size $zeta > 0$ small enough that the Hölder error is below one quarter of the margin. Given $A$ with normalized Frobenius distance at most $epsilon.alt$ from $V_y$, let $cal(S)_A = { i : \| A_(i i) - \( V_y \)_(i i) \| > zeta }$. It has at most $alpha n$ elements, where $alpha = epsilon.alt^2 \/ zeta^2$. Outside $cal(S)_A$ replace $A_(i i)$ by $\( V_y \)_(i i)$; on $cal(S)_A$, round it within $zeta$ to a grid of $\[ 0 \, 1 + eta \]$, including the endpoints. The resulting $hat(A)$ obeys
  $ lr(bar.v.double A - hat(A) bar.v.double) lt.eq zeta \, #h(2em) lr(bar.v.double hat(A) - V_y bar.v.double)_(upright(F)) lt.eq 2 epsilon.alt sqrt(n) . $
  For fixed $y$, these approximants are deterministic and number at most
  $ sum_(k lt.eq alpha n) binom(n, k) N_zeta^k \, #h(2em) N_zeta lt.eq C \( 1 + 1 \/ zeta \) . $
  Its logarithm divided by $n$ tends to zero as $alpha arrow.b 0$; for instance it is at most $- alpha log alpha - \( 1 - alpha \) log \( 1 - alpha \) + alpha log N_zeta + o \( 1 \)$ when $alpha < 1 \/ 2$. Choose $epsilon.alt_(*)$ so small that $2 epsilon.alt_(*)$ meets all moment tolerances and this counting rate is less than half the fixed-$A$ failure exponent. A union bound, followed by the Hölder comparison, proves the desired uniform margin.
  For later use, record the order that preserves the concentration exponents. First fix $R \, t_0 \, T \, eta$, the limiting margin, and the Gram tolerance $xi$. This fixes the vector norm bounds, conditional concentration exponents, $K_1$, and the mesh $zeta$. Next take the equality neighborhood and tail tolerance $nu$ small. Choose any sufficiently large finite $R_1$, then take $epsilon.alt_(*)$ small enough for (5.18) and the union bound. Finally decrease $sigma_(*)$ so all scalar coefficients lie within the required tolerance. No concentration exponent is lost when $epsilon.alt_(*)$ is decreased. This also proves the last assertion of the lemma. ◻
]

=== 5.3 From a small integral to exclusion of approximate zeros <from-a-small-integral-to-exclusion-of-approximate-zeros>

The conditional estimate controls all nearby diagonals for each fixed $y$ satisfying the scalar hypotheses. Combined with the scalar rate bounds, it will make the expected integral over unstable configurations exponentially small. To exclude approximate zeros at any $y$, the next deterministic lemma gives the complementary lower bound: an approximate zero satisfying a regularized determinant bound contributes a definite exponential amount to the integral over a surrounding ball. The regularization makes a sign assumption on the Jacobian unnecessary.

#thm([Lemma 5.6.])[
  (Local volume at an approximate zero).  #emph[Fix $j \, K < oo$, $r > 0$, and $epsilon > 0$. Suppose $lr(bar.v.double tilde(J) bar.v.double) lt.eq K$, and a set $E subset.eq bb(R)^n$ contains the ball ${ y' : lr(bar.v.double y' - y bar.v.double) lt.eq r sqrt(n) }$. Put 
$ L = F'_(tilde(J) \, h_0) \( y \) = I + \( B I - tilde(J) \) V_y - frac(2 j, n) m m^(sans(T)) V_y \, #h(2em) Q = L^(sans(T)) L + gamma I . $

 If 
#[#set math.equation(numbering: n => "(5.19)")
 $ 1 / n log det Q lt.eq j b \( y \)^2 + epsilon_1 \, #h(2em) lr(bar.v.double F_(tilde(J) \, h_0) \( y \) bar.v.double) lt.eq rho sqrt(n) \, $ <eq:local-volume-hypotheses>]

 then 
#[#set math.equation(numbering: n => "(5.20)")
 $ \( 2 pi sigma^2 \)^(- n \/ 2) integral_E e^(- lr(bar.v.double F_(tilde(J) \, h_0) \( y' \) bar.v.double)^2 \/ \( 2 sigma^2 \) + n j b \( y' \)^2 \/ 2) thin upright(d) y' gt.eq e^(- epsilon n) $ <eq:local-volume-conclusion>]

 for all sufficiently large $n$, provided the constants are chosen in this order: first $epsilon_1 > 0$ sufficiently small in terms of $epsilon$; then any fixed $gamma > 0$; then $sigma > 0$ sufficiently small in terms of $j \, K \, r \, epsilon \, gamma$; and finally $rho > 0$ sufficiently small in terms of those constants and $sigma$. The bound is uniform in $y \, h_0 \, n$ under the stated hypotheses.]
] <lem:local-field-volume>

#proof[
  We integrate over a Gaussian ellipsoid centered at the approximate zero. Its covariance is chosen to control the linearized residual. Let $g''$ be standard Gaussian and put $Delta = sigma Q^(- 1 \/ 2) g''$, and restrict to $cal(B) = { lr(bar.v.double g'' bar.v.double) lt.eq 2 sqrt(n) }$. For $2 sigma \/ sqrt(gamma) lt.eq r$, all resulting points $y + Delta$ belong to $E$. Changing variables in the integral gives the lower bound
  #[#set math.equation(numbering: n => "(5.21)")
   $ \( det Q \)^(- 1 \/ 2) bb(P) \( cal(B) \) bb(E) [exp {lr(bar.v.double g'' bar.v.double)^2 / 2 - frac(lr(bar.v.double F \( y + Delta \) bar.v.double)^2, 2 sigma^2) + frac(n j b \( y + Delta \)^2, 2)} thin mid(bar.v) thin cal(B)] . $ <eq:volume-change-variables>]
  Here and for the remainder of this proof $F = F_(tilde(J) \, h_0)$. The conditioning has probability tending to one, and all estimates below remain valid under it with a uniform factor, since $bb(P) \( cal(B) \) gt.eq 1 \/ 2$ for large $n$.
  We must control the nonlinear residual on this ellipsoid uniformly in its center. Coordinatewise Taylor expansion gives
  $ m \( y + Delta \) = m + V_y Delta + r_m \, #h(2em) \| \( r_m \)_i \| lt.eq C Delta_i^2 . $
  Writing $b \( y + Delta \) = b + ell_b + r_b$, its linear part is $ell_b = - 2 chevron.l m \( 1 - m^2 \) Delta chevron.r$, and $\| r_b \| lt.eq C lr(bar.v.double Delta bar.v.double)^2 \/ n$. Thus, when the product $j b \, m$ in $F$ is expanded, its remainder is bounded in norm by
  $ C (lr(bar.v.double r_m bar.v.double) + lr(bar.v.double Delta bar.v.double)^2 / sqrt(n)) . $
  For the product of first differences use $\| b \( y + Delta \) - b \( y \) \| lt.eq C lr(bar.v.double Delta bar.v.double) \/ sqrt(n)$ and $lr(bar.v.double m \( y + Delta \) - m \( y \) bar.v.double) lt.eq lr(bar.v.double Delta bar.v.double)$. The remaining term $- tilde(J) m$ has remainder bounded by $K lr(bar.v.double r_m bar.v.double)$. Since the covariance of $Delta$ is bounded above by $sigma^2 I \/ gamma$, Gaussian fourth moments give
  $ bb(E) sum_i Delta_i^4 lt.eq C n sigma^4 \/ gamma^2 \, #h(2em) bb(E) lr(bar.v.double Delta bar.v.double)^4 lt.eq C n^2 sigma^4 \/ gamma^2 . $
  Combining these Taylor estimates with the Gaussian moments, and writing $R_F = F \( y + Delta \) - F \( y \) - L Delta$, yields
  #[#set math.equation(numbering: n => "(5.22)")
   $ bb(E) \[ lr(bar.v.double R_F bar.v.double)^2 divides cal(B) \] lt.eq C n sigma^4 \/ gamma^2 \, #h(2em) bb(E) \[ \| b \( y + Delta \)^2 - b \( y \)^2 \| divides cal(B) \] lt.eq C sigma \/ sqrt(gamma) . $ <eq:volume-remainders>]
  All constants depend only on $j \, K$.
  The choice of ellipsoid now controls the linear term: the singular values of $L Q^(- 1 \/ 2)$ are at most one. Hence $lr(bar.v.double L Delta bar.v.double) lt.eq sigma lr(bar.v.double g'' bar.v.double)$ pointwise, including on $cal(B)$. Expanding $F \( y + Delta \) = F \( y \) + L Delta + R_F$ and applying Cauchy–Schwarz to its cross terms yields
  $ & 1 / n bb(E) [lr(bar.v.double g'' bar.v.double)^2 / 2 - frac(lr(bar.v.double F \( y + Delta \) bar.v.double)^2, 2 sigma^2) thin mid(bar.v) thin cal(B)]\
 & #h(1cm)  gt.eq - C {rho / sigma + sigma / gamma + (rho / sigma)^2 + (sigma / gamma)^2 + rho / gamma} . $
  The last mixed term may also be absorbed into the two squares. Apply Jensen’s inequality to the conditional expectation in (5.21). Its logarithm divided by $n$ is at least
  $ - frac(1, 2 n) log det Q + frac(j b \( y \)^2, 2) - C {rho / sigma + sigma / gamma + (rho / sigma)^2 + (sigma / gamma)^2 + sigma / sqrt(gamma)} + o \( 1 \) . $
  The determinant hypothesis cancels $j b \( y \)^2 \/ 2$, with a loss of at most $epsilon_1 \/ 2$. Choose the constants in the order in the statement; the other errors then have total size smaller than $epsilon$. This proves the lower bound. ◻
]

=== 5.4 Proof of the observation-path statement <proof-of-the-observation-path-statement>

#proof[
  We assemble the scalar, matrix, and local-volume estimates under the planted law (5.4). After excluding unstable approximate zeros at a fixed time, we remove the auxiliary diagonal, control the whole path by a fixed mesh, and undo the planting.
  Let $J$ be $tilde(J)$ with its diagonal zeroed. Choose $eta \, theta \, q_0 > 0$ sufficiently small that $j \( 1 + eta \)^2 < 1$ and, whenever $q lt.eq 2 q_0$,
  #[#set math.equation(numbering: n => "(5.23)")
   $ I + \( j - 3 j q - 2 sqrt(j) - 2 theta \) A succ.curly.eq c_(upright("sm")) I #h(2em) \( 0 lt.eq A lt.eq \( 1 + eta \) I \) $ <eq:small-time-matrix-margin>]
  for some $c_(upright("sm")) > 0$. These choices are possible because at $eta = theta = q = 0$ the lower scalar bound is $1 + j - 2 sqrt(j) = \( 1 - sqrt(j) \)^2 > 0$. On
  #[#set math.equation(numbering: n => "(5.24)")
   $ lr(bar.v.double  bar.v.double) J lt.eq 2 sqrt(j) + theta \, #h(2em) max_i \| tilde(J)_(i i) \| lt.eq theta \, $ <eq:planted-norm-restriction>]
  we have $lr(bar.v.double tilde(J) bar.v.double) lt.eq 2 sqrt(j) + 2 theta$. Since $m m^(sans(T)) \/ n prec.curly.eq q I$, (5.23) implies $sans(H)_(tilde(J)) \( y \, A \) succ.curly.eq c_(upright("sm")) I$ for all $q lt.eq 2 q_0$. Choose $t_0 in \( 0 \, T \]$ small enough for Lemma 12(iii).
  For the remaining times $t in \[ t_0 \, T \]$, the conditional Hessian lemma provides the margin near the equality curve. Choose a second-moment ball whose complement has a fixed negative rate, using Lemma 12(i) with $s_min = t_0$. Apply Lemma 13 on this ball. Take its equality neighborhood and tail tolerance, choose its tail cutoff $R_1$ sufficiently large for Lemma 12(iv), and then choose its diagonal-distance radius. Decrease $sigma_(*) > 0$ so that Lemma 12(ii) excludes the complement of that equality neighborhood, and so that the small-time scalar bound also holds. The scalar regions excluded by these choices all have fixed strictly negative rates, uniformly for $0 < sigma lt.eq sigma_(*)$. On the region left over, the conditional matrix margin fails with probability at most $e^(- a_(*) n)$.
  Let $epsilon.alt_(*) > 0$ denote the full diagonal-distance radius just chosen. Choose $c_E > 0$ smaller than both $c_(*) \/ 2$ and $c_(upright("sm")) \/ 2$. For $t gt.eq t_0$, define
  $ E_t \( W \) = {y : exists A \, quad 0 lt.eq A lt.eq \( 1 + eta \) I \, quad lr(bar.v.double A - V_y bar.v.double)_(upright(F)) lt.eq epsilon.alt_(*) sqrt(n) \, quad lambda_min \( sans(H)_(tilde(J)) \( y \, A \) \) lt.eq c_E} . $
  For $0 lt.eq t < t_0$, instead put $E_t \( W \) = { y : q \( y \) gt.eq q_0 }$. There is $a_0 > 0$ such that
  #[#set math.equation(numbering: n => "(5.25)")
   $ bb(E) I_(t \, sigma) \( E_t \) lt.eq e^(- a_0 n) quad \( 0 lt.eq t lt.eq T \, 0 < sigma lt.eq sigma_(*) \) $ <eq:bad-integral-rate>]
  for all sufficiently large $n$, uniformly in $t \, sigma$. For small times, this follows from the scalar bound and Lemma 11. For larger times, split the conditional integral into the excluded scalar regions and their complement. The excluded regions have negative rates. On the complement multiply the conditional probability $e^(- a_(*) n)$ by the unrestricted scalar integral, whose rate is at most any prescribed positive number, by Lemma 12(i). Taking that number below $a_(*) \/ 2$ proves (5.25). Finitely many pieces can be absorbed by decreasing $a_0$.
  We now use local volume to exclude every unstable approximate zero. An individual witness will force a ball of the excluded set to contribute too much to the integral. Suppose
  #[#set math.equation(numbering: n => "(5.26)")
   $ lr(bar.v.double F_(tilde(J) \, h_0) \( y \) bar.v.double) lt.eq rho sqrt(n) \, #h(2em) lr(bar.v.double A - V_y bar.v.double)_(upright(F)) lt.eq 1 / 2 epsilon.alt_(*) sqrt(n) \, #h(2em) lambda_min \( sans(H)_(tilde(J)) \( y \, A \) \) lt.eq 1 / 2 c_E $ <eq:bad-approximate-point>]
  for some $0 lt.eq A lt.eq \( 1 + eta \) I$, and assume (5.24). There is a constant $r > 0$, independent of this witness and of $n \, t$, such that $lr(bar.v.double y' - y bar.v.double) lt.eq r sqrt(n)$ implies $y' in E_t \( W \)$. For $t gt.eq t_0$, the same $A$ witnesses instability throughout a sufficiently small ball. Indeed,
  $ lr(bar.v.double V_(y') - V_y bar.v.double)_(upright(F)) lt.eq 2 lr(bar.v.double y' - y bar.v.double) \, #h(2em) \| b \( y' \) - b \( y \) \| lt.eq 2 lr(bar.v.double y' - y bar.v.double) \/ sqrt(n) \, $
  and
  $ lr(bar.v.double m \( y' \) m \( y' \)^(sans(T)) \/ n - m \( y \) m \( y \)^(sans(T)) \/ n bar.v.double) lt.eq 2 lr(bar.v.double y' - y bar.v.double) \/ sqrt(n) $
  preserve the full diagonal-distance constraint and the bound $lambda_min lt.eq c_E$ if $r$ is small enough. For $t < t_0$, (5.23) and the chosen $c_E$ imply $q \( y \) > 2 q_0$; the same Lipschitz bound for $q$ then gives $q \( y' \) gt.eq q_0$ for a smaller $r$.
  Set $L = F'_(tilde(J) \, h_0) \( y \)$. It is a bounded-rank, bounded-norm perturbation of
  $ I + \( B I - W \) V_y : quad L = I + \( B I - W \) V_y - j / n upright(bold(1)) upright(bold(1))^(sans(T)) V_y - frac(2 j, n) m m^(sans(T)) V_y . $
  Here $n^(- 1) "Tr" V_y = b \( y \)$, so the determinant rate in Lemma 6 matches the weight in (5.5). That lemma says that, for any chosen $epsilon_1 > 0$, one may choose a fixed $gamma > 0$ sufficiently small so that, except on an event of probability $C e^(- a_1 n)$, simultaneously at every $y$,
  $ 1 / n log det \( L^(sans(T)) L + gamma I \) lt.eq j b \( y \)^2 + epsilon_1 . $
  The lemma’s rank-perturbation allowance applies here with two rank-one terms of norms at most $j$ and $2 j$. Choose $epsilon < a_0 \/ 2$, choose $epsilon_1$ for Lemma 14, then choose $gamma$ by the log-determinant lemma. Next fix $sigma in \( 0 \, sigma_(*) \]$ sufficiently small for the local-volume lemma, and finally fix $rho > 0$ sufficiently small for it. A witness (5.26) on the determinant event forces $I_(t \, sigma) \( E_t \) gt.eq e^(- epsilon n)$. Markov’s inequality and (5.25) show that the probability of such a witness, under (5.24), is at most $C e^(- a_2 n)$, uniformly in $t in \[ 0 \, T \]$. Here the uniformity of the negative rates permits the later choice of $sigma$ required by the local-volume estimate.
  The integral argument used a full GOE matrix. We now pass to its zero-diagonal version, retaining slack in both residual and Hessian bounds. Choose a fixed $delta_D > 0$ so small that
  $ delta_D lt.eq theta \, #h(2em) delta_D lt.eq rho \/ 2 \, #h(2em) \( 1 + eta \) delta_D lt.eq c_E \/ 4 . $
  The diagonal entries of $tilde(J)$ are independent $N \( j \/ n \, 2 j \/ n \)$, so $bb(P) \( max_i \| tilde(J)_(i i) \| > delta_D \) lt.eq C e^(- a_D n)$ for large $n$. On its complement,
  $ lr(bar.v.double F_(tilde(J) \, h_0) \( y \) - F_(J \, h_0) \( y \) bar.v.double) / sqrt(n) lt.eq delta_D \, #h(2em) lr(bar.v.double sans(H)_(tilde(J)) \( y \, A \) - sans(H)_J \( y \, A \) bar.v.double) lt.eq \( 1 + eta \) delta_D . $
  Thus a zero-diagonal witness with residual at most $rho sqrt(n) \/ 2$, radius $epsilon.alt_(*) sqrt(n) \/ 2$, and Hessian minimum at most $c_E \/ 4$ would give a witness (5.26). We have proved an exponentially small fixed-time failure probability for the zero-diagonal matrix, restricted only to $lr(bar.v.double  bar.v.double) J lt.eq 2 sqrt(j) + theta$.
  To pass from a fixed time to the whole interval, we control observation increments on a deterministic mesh. Take a mesh of size $Delta > 0$ that includes both endpoints. For a scalar Brownian motion, the reflection bound implies that $sup_(0 lt.eq u lt.eq Delta) \| B \( u \) \|^2 \/ Delta$ has an exponential moment at a fixed positive argument. The coordinate Brownian motions are independent. Exponential Markov applied to the sum of their squared suprema consequently gives, for each desired $kappa_0 > 0$, a mesh $Delta$ small enough that
  $ bb(P) (max_k sup_(t_k lt.eq t lt.eq t_(k + 1)) lr(bar.v.double B_0 \( t \) - B_0 \( t_k \) bar.v.double) / sqrt(n) > kappa_0) lt.eq C e^(- a_3 n) . $
  The deterministic drift contributes at most $Delta sqrt(n)$ to each increment. Choose the mesh so the full normalized increment is at most $rho \/ 4$. Set $rho_0 = rho \/ 8$, $epsilon.alt_A = epsilon.alt_(*) \/ 2$, and $c = c_E \/ 4$. A pathwise violation of (5.3) then gives a fixed-time violation at a mesh point: the Hessian and its witness do not use the field, and the residual increases by at most $rho sqrt(n) \/ 4$. A union bound over the fixed finite mesh proves an annealed path failure bound $C e^(- a_4 n)$ under the planted law, restricted to $lr(bar.v.double  bar.v.double) J lt.eq 2 sqrt(j) + theta$.
  We have obtained a path estimate under planting. To recover the original disorder law, introduce the partition-function density
  $ Z \( J \) = sum_x e^(x^(sans(T)) J x \/ 2) \, #h(2em) L \( J \) = Z \( J \) \/ bb(E) Z \( J \) . $
  Size-bias the original joint law of $J \, X$, with $X tilde.op mu_0$, by $L \( J \)$. Its density in $J \, X$ is proportional to $e^(x^(sans(T)) J x \/ 2)$ times the original Gaussian density. Gaussian tilting makes $X$ uniform and, conditionally on $X$, makes the off-diagonal entries of $J$ independent with means $j X_i X_j \/ n$ and variance $j \/ n$. Add independent diagonal entries with law $N \( j \/ n \, 2 j \/ n \)$—a centered GOE diagonal plus $j I \/ n$—and conjugate by $D_X$; the resulting matrix and observation have exactly the law (5.4). All witness conditions are equivariant under this conjugation, because $m \( D_X y \) = D_X m \( y \)$, $V_(D_X y) = V_y$, and diagonal $A$ commutes with $D_X$. Conditional observation paths given $J$ are unchanged by size bias.
  Undoing this change of law requires a lower bound for $L \( J \)$ on typical original matrices. For independent uniform signs $epsilon_i$, Gaussian averaging gives
  $ frac(bb(E) Z^2, \( bb(E) Z \)^2) = e^(- j \/ 2) bb(E) exp {frac(j, 2 n) (sum_i epsilon_i)^2} lt.eq \( 1 - j \)^(- 1 \/ 2) . $
  To obtain the inequality, introduce an independent standard Gaussian $g$ and use $bb(E)_epsilon e^(sqrt(j \/ n) g sum_i epsilon_i) = cosh \( sqrt(j \/ n) g \)^n lt.eq e^(j g^2 \/ 2)$. Paley–Zygmund then yields a constant $p_j > 0$ with $bb(P) \( Z gt.eq bb(E) Z \/ 2 \) gt.eq p_j$. As a function of the independent standard off-diagonal Gaussians, $log Z$ has gradient squared at most $\( j \/ n \) binom(n, 2) lt.eq j n \/ 2$. Gaussian concentration about a median therefore has scale $O \( sqrt(n) \)$. The preceding positive-probability lower bound implies that this median is at least $log bb(E) Z - O_j \( sqrt(n) \)$: otherwise its upper concentration tail would be smaller than $p_j$. It follows that, for every fixed $delta > 0$,
  #[#set math.equation(numbering: n => "(5.27)")
   $ bb(P) { L \( J \) < e^(- delta n) } arrow.r 0 . $ <eq:partition-lower-tail>]
  We can now turn the annealed planted estimate into the required conditional observation bound. Let $p_n \( J \)$ denote the conditional observation-path failure probability for (5.3). The planted estimate is
  $ bb(E) #scale(x: 120%, y: 120%)[\[] L \( J \) p_n \( J \) upright(bold(1))_({ lr(bar.v.double  bar.v.double) J lt.eq 2 sqrt(j) + theta }) #scale(x: 120%, y: 120%)[\]] lt.eq C e^(- a_4 n) . $
  Choose $delta < a_4 \/ 2$. On $L \( J \) gt.eq e^(- delta n)$, this gives an original expectation bound $C e^(- \( a_4 - delta \) n)$ for the restricted $p_n \( J \)$. Markov’s inequality makes $p_n \( J \) lt.eq e^(- a n)$ outside an event of probability tending to zero, for a fixed sufficiently small $a > 0$. Equation (5.27) and the usual GOE norm bound, including diagonal removal, show that the restrictions on $L \( J \)$ and $lr(bar.v.double  bar.v.double) J$ hold with probability tending to one. Intersect these events to obtain $cal(J)_n$ and finish the proof.
  We finish by checking measurability of the witness events used in the argument. At fixed $y$, the matrix-witness sets are projections over the compact diagonal range. For existence of $y \, A \, t$ along a continuous path, additionally restrict $lr(bar.v.double  bar.v.double) y$, $lr(bar.v.double  bar.v.double) J$, and $sup_(t lt.eq T) lr(bar.v.double Y \( t \) bar.v.double)$ by integers. The witness inequalities are closed and the witness parameter space is compact, so these restricted projections are closed. Taking a countable union removes the bounds. This also justifies the conditional probabilities and the restricted integrals above. ◻
]

=== 5.5 A unique root and quantitative inversion <a-unique-root-and-quantitative-inversion>

The preceding proposition supplies stability along random observations at fixed subcritical $j$. The following consequence is deterministic: its hypothesis requires positivity throughout the region of small residual. From that whole-region assumption we obtain a unique zero and a bound on the distance to it. This separates the probabilistic construction of stable fields from the inversion used later.

#thm([Lemma 5.7.])[
  (Root and inverse bound at a stable field).  #emph[Fix $j \, K \, c \, r_0 > 0$. Let $J$ be symmetric with $lr(bar.v.double  bar.v.double) J lt.eq K$, and let $h_0 in bb(R)^n$. Suppose 
#[#set math.equation(numbering: n => "(5.28)")
 $ sans(H)_J \( y \, V_y \) succ.curly.eq c I quad upright("whenever") quad lr(bar.v.double F_(J \, h_0) \( y \) bar.v.double) lt.eq r_0 sqrt(n) . $ <eq:root-stability-assumption>]

 Then $F_(J \, h_0)$ has exactly one zero $r in bb(R)^n$, and 
#[#set math.equation(numbering: n => "(5.29)")
 $ lr(bar.v.double y - r bar.v.double) lt.eq C lr(bar.v.double F_(J \, h_0) \( y \) bar.v.double) quad upright("if") quad lr(bar.v.double F_(J \, h_0) \( y \) bar.v.double) < r_0 sqrt(n) \, #h(2em) C = 1 + \( K + 3 j \) \/ c . $ <eq:root-distance>]

 In particular this conclusion applies to every field satisfying (5.3), even if that implication is required only through residual threshold $rho_0 sqrt(n)$.]
] <lem:root>

#proof[
  We first bound the derivative inverse on the region in the hypothesis. We then prove existence and uniqueness of a zero, and integrate the inverse bound along a path to that zero.
  Put $L_1 = B I - J - 2 j m m^(sans(T)) \/ n$. Since $F' \( y \) = I + L_1 V_y$, the elementary inverse identity gives
  $ F' \( y \)^(- 1) = I - L_1 V_y^(1 \/ 2) \( I + V_y^(1 \/ 2) L_1 V_y^(1 \/ 2) \)^(- 1) V_y^(1 \/ 2) . $
  Under (5.28), this inverse exists and has norm at most $1 + \( K + 3 j \) \/ c$, since $0 < V_y lt.eq I$ and $lr(bar.v.double L_1 bar.v.double) lt.eq K + 3 j$.
  For existence and uniqueness, pass to the coordinates $m in \( - 1 \, 1 \)^n$ and define the potential
  $ Phi \( m \) = sum_i integral_0^(m_i) "atanh" z thin upright(d) z - h_0^(sans(T)) m - 1 / 2 m^(sans(T)) J m + j / 2 lr(bar.v.double  bar.v.double) m^2 - frac(j, 4 n) lr(bar.v.double  bar.v.double) m^4 . $
  Its critical-point equation is $F_(J \, h_0) \( "atanh" m \) = 0$. At any critical point,
  $ V_y^(1 \/ 2) Phi'' \( m \) V_y^(1 \/ 2) = sans(H)_J \( y \, V_y \) succ.curly.eq c I \, #h(2em) y = "atanh" m \, $
  so the critical point has positive definite Hessian and is isolated. Choose $a in \( 0 \, 1 \)$ close enough to one that
  $ "atanh" a > 1 + max_i (\| \( h_0 \)_i \| + sum_j \| J_(i j) \| + j) . $
  Every critical point lies in the interior of $\[ - a \, a \]^n$, and on each face of this box the negative gradient $- nabla Phi$ points strictly inward. The minimum of $Phi$ on the box is therefore attained at an interior critical point. This proves existence.
  To prove uniqueness, consider the negative gradient flow from any point of the box. The inward-pointing condition keeps the trajectory in the box for all positive times. Its potential decreases and is bounded below, so $integral_0^oo lr(bar.v.double nabla Phi \( m \( t \) \) bar.v.double)^2 thin upright(d) t < oo$. The squared gradient is uniformly continuous in time, because the gradient and Hessian are bounded on the box. It follows that the gradient tends to zero: a nonzero limsup would, by uniform continuity, force disjoint intervals of fixed positive integral. Every limit point of a trajectory is therefore critical. The critical set is finite, since it is a compact set of isolated zeros. The limit set of a trajectory is connected: it is the intersection of the nested compact connected closures of its tails. Each trajectory therefore converges to one critical point.
  It remains to show that all trajectories converge to the same point. The positive Hessian makes every critical point a strict local attractor. For clarity, in a sufficiently small ball about it one has $\( m - m_(*) \)^(sans(T)) nabla Phi \( m \) gt.eq c_(*) lr(bar.v.double m - m_(*) bar.v.double)^2$, which gives exponential contraction of the distance along the flow and invariance of the ball. Continuous dependence of the flow on its starting point, up to the time it enters that ball, shows that each attraction basin is relatively open in $\[ - a \, a \]^n$. These disjoint nonempty basins cover the connected box. Hence there is only one basin and one critical point, proving uniqueness of $r$.
  We now derive the distance estimate. Suppose $lr(bar.v.double F \( y \) bar.v.double) < r_0 sqrt(n)$. Starting at $y \( 0 \) = y$, solve on the open region $lr(bar.v.double F bar.v.double) < r_0 sqrt(n)$ the ordinary differential equation
  $ dot(y) \( s \) = - F' \( y \( s \) \)^(- 1) F \( y \) . $
  The chain rule gives $F \( y \( s \) \) = \( 1 - s \) F \( y \)$ while the solution exists. Its velocity has norm at most $C lr(bar.v.double F \( y \) bar.v.double)$. If its maximal existence interval ended at or before time one, this velocity bound would give a finite limiting point, whose residual is still strictly less than $r_0 sqrt(n)$ and whose derivative is invertible. Local existence would extend the solution, a contradiction. The solution consequently reaches time one, at which its value is the unique zero $r$. Integrating the velocity bound along this path gives (5.29). ◻
]

== 6 Weak residual identities and discrete differentiation <sec:residuals>

We derive the residual identities needed for the two posterior estimates. Moments of a fixed finite sequence of primary iterates will locate two consecutive small increments. Ordinary test-vector recipes then control means under square reweighting; one additional implicit recipe supplies the linear-response test for the directional covariance estimate. The proof proceeds from discrete derivative bounds to a weak residual rule, and ends with the terminal identity for that implicit test.

This section is deterministic. We fix $J$ satisfying the word estimates of Lemma 2, fix an external field $h_0 in bb(R)^n$, and take all expectations with respect to $mu_(h_0)$. We fix the depth, the finite construction, and its coefficient bounds independently of $n$. These choices determine a finite required word length, which can increase when the choices change. Constants in derivative estimates can depend on these choices and on the corresponding word bounds; they are uniform in $n$, $h_0$, the spin configuration, and the permitted seeds. The size and inverse bounds for the initial implicit construction below have the stronger, depth-independent uniformity explicitly stated there.

We use the discrete derivatives, product rule (1.2), and norm $lr(bar.v.double  bar.v.double) G_(*)$ introduced above, with $d g = \( d_i g \)_(i = 1)^n$ for scalar $g$. All vector functions such as $tanh h^1$ are understood coordinatewise.

=== 6.1 Primary fields <primary-fields>

The following recursion has the Onsager-corrected form of iterative TAP constructions, as in Bolthausen [8]. Here it starts from a Gibbs spin sample and is used only through a fixed finite depth. Define

#[#set math.equation(numbering: n => "(6.1)")
 $ m^0 = x \, quad b_0 = 0 \, #h(2em) m^l = tanh h^l \, quad b_l = chevron.l 1 - \( m^l \)^2 chevron.r \, quad R_l = m^(l - 1) - m^l \,\
h^(l + 1) = h_0 + J m^l - j b_l m^(l - 1) quad \( l gt.eq 1 \) . $ <eq:amp>]

The finite-depth objective is visible in the scalar pairings $S_l = R_l^(sans(T)) m^l \/ sqrt(n)$. Expanding the squared increment gives

#[#set math.equation(numbering: n => "(6.2)")
 $ lr(bar.v.double R_l bar.v.double)^2 / n = b_l - b_(l - 1) - frac(2 S_l, sqrt(n)) . $ <eq:residual-telescoping>]

Since $0 lt.eq b_l lt.eq 1$, control of $S_l \/ sqrt(n)$ through a sufficiently large fixed depth forces two consecutive residuals to be small. We will prove the moment bounds

$ bb(E) S_l^2 lt.eq C_l \, #h(2em) bb(E)_nu (S_l / sqrt(n))^2 lt.eq C_l / sqrt(n) (1 + frac(cal(D)_(h_0) \( f \), N)) \, quad N = bb(E) f^2 > 0 \, quad nu = frac(f^2 mu_(h_0), N) . $

These bounds will supply the ordinary and square-reweighted selection estimates in Section 7; convergence of the primary recursion is not required.

The first residual explains what is needed from a test vector $U$. Conditional covariance in one spin gives the exact identity

$ bb(E) G R_1^(sans(T)) U = bb(E) sum_i v_i^1 d_i \( G U_i \) . $

The product rule bounds its right side by $C lr(bar.v.double  bar.v.double) G_(*)$ whenever $lr(bar.v.double  bar.v.double) U$ and $sum_i \| d_i U_i \|$ are bounded pointwise. Thus the essential property of our tests is a bound on the sum of their diagonal derivatives, in addition to a bound on their Euclidean norm. The Onsager corrections will preserve this property through the finite constructions below. We begin with the primary fields, whose derivatives enter those tests. We use $lr(bar.v.double Q bar.v.double)_(ell^4) = \( sum_(i \, j) \| Q_(i j) \|^4 \)^(1 \/ 4)$ for the unnormalized entrywise norm.

#thm([Lemma 6.1.])[
  (Primary differentiation).  #emph[Let 
#[#set math.equation(numbering: n => "(6.3)")
 $ H_1 = J \, #h(2em) M_0 = I \, #h(2em) M_l = D_(1 - \( m^l \)^2) H_l \, #h(2em) H_(l + 1) = J M_l - j b_l M_(l - 1) . $ <eq:primary-formal>]

 For each fixed $l gt.eq 1$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ & lr(bar.v.double nabla h^l - H_l bar.v.double)_(upright(F)) + lr(bar.v.double nabla m^l - M_l bar.v.double)_(upright(F)) lt.eq C \,\
 & lr(bar.v.double nabla h^l bar.v.double) + lr(bar.v.double nabla m^l bar.v.double) + lr(bar.v.double nabla h^l bar.v.double)_(ell^4) + lr(bar.v.double "diag" nabla h^l bar.v.double)_2 lt.eq C \, #h(2em) lr(bar.v.double d b_l bar.v.double) lt.eq C n^(- 1 \/ 2) . $ <eq:primary-error>]

 More generally, let $g_i$ be a smooth function of a fixed list of coordinates $h_i^l$ and averages $b_l$, with uniformly bounded derivatives through the orders being used. Deterministic site labels are permitted, provided the same bounds hold uniformly in $i$. Its derivative matrix has bounded operator norm, bounded diagonal $ell^2$ norm, and bounded entrywise $ell^4$ norm.]
] <lem:primary-derivatives>

#proof[
  We first bound the formal matrices in (6.3), then compare them with the actual discrete derivatives. Expanding $H_(l + 1)$ produces the chain
  $ J D_(1 - \( m^l \)^2) J dots.h.c D_(1 - \( m^1 \)^2) J $
  and the terms obtained by contracting disjoint pairs of originally adjacent $J$’s. Contracting $J D_(1 - \( m^s \)^2) J$ contributes $- j b_s I$. This description follows inductively from the two terms defining $H_(l + 1)$: either keep its first link, or contract that link with the next one. Multiplicities are retained when different contractions happen to give the same matrix.
  The contraction terms cancel the diagonal predictions. To see this, fix a complete noncrossing pairing of the original chain. Reinserting each contracted adjacent pair identifies its contribution with the prediction of this full pairing, multiplied by the signs of the contractions. The originally adjacent pairs belonging to a pairing are mutually disjoint, and every nonempty complete noncrossing pairing contains at least one such pair. Summing over their subsets gives $\( 1 - 1 \)^a = 0$, where $a gt.eq 1$ is their number. An odd chain has no complete pairing. Lemma 2 therefore bounds the diagonal $ell^2$ norm of $H_l$, and bounds its operator and off-diagonal $ell^4$ norms term by term. Its full $ell^4$ norm is bounded as well, since $lr(bar.v.double "diag" H_l bar.v.double)_4 lt.eq lr(bar.v.double "diag" H_l bar.v.double)_2$.
  We now compare these formal bounds with the actual derivatives. For a scalar function $psi$ with bounded second derivative, Taylor’s theorem gives
  $ \| d_j psi \( h_i^l \) - psi' \( h_i^l \) d_j h_i^l \| lt.eq C \| d_j h_i^l \|^2 . $
  The Frobenius norm of the remainder is at most $C lr(bar.v.double nabla h^l bar.v.double)_(ell^4)^2$. This proves the magnetization part of (6.4) once the field part is known. The same argument for $psi \( z \) = "sech"^2 z$ gives an operator bound for its site derivative matrix $Q_l$. Averaging its rows yields
  $ d b_l = n^(- 1) Q_l^(sans(T)) upright(bold(1)) \, #h(2em) lr(bar.v.double d b_l bar.v.double) lt.eq n^(- 1 \/ 2) lr(bar.v.double Q_l bar.v.double) . $
  In differentiating $b_l m^(l - 1)$, the term from $d b_l$ is a rank-one matrix of Frobenius norm at most $lr(bar.v.double m^(l - 1) bar.v.double) lr(bar.v.double d b_l bar.v.double) lt.eq C$. The discrete product error is $nabla m^(l - 1)$ times a diagonal whose diagonal has norm at most $2 lr(bar.v.double d b_l bar.v.double)$. Its Frobenius norm is bounded, since $lr(bar.v.double nabla m^(l - 1) bar.v.double) lt.eq C$. Starting at $nabla h^1 = J$, these estimates close the induction. The resulting bounded Frobenius perturbation preserves the operator, diagonal $ell^2$, and entrywise $ell^4$ bounds of the formal matrices.
  For the final assertion, apply the same comparison to a smooth function of several arguments. Expand along the segment between the arguments at $x$ and $x^(\( j \))$. The preceding bounds control the primary linear terms. A linear term involving $d b_s$ is a rank-one matrix with a bounded-entry left vector, hence has bounded Frobenius norm. The squared-average remainder is controlled by
  $ n sum_j \| d_j b_s \|^4 lt.eq n lr(bar.v.double d b_s bar.v.double)^4 lt.eq C . $
  Mixed remainders are bounded by sums of pure squares, and primary quadratic remainders are controlled by the entrywise $ell^4$ bounds. This proves the assertion. ◻
]

We have in particular bounded the Euclidean change of every primary vector under a single spin flip, at each fixed depth. This is the estimate that will keep the local constructions inside their buffers.

=== 6.2 Finite recipes for small vectors <finite-recipes-for-small-vectors>

The residuals will be tested against vectors built by finitely many operations. We call these vectors “small” when their Euclidean norm is bounded; the word does not refer to coordinatewise magnitude. The following definition specifies the operations and the meaning of their site partials.

#prodef([Definition 6.2.])[
  (Ordinary admissible recipe).  Choose finitely many deterministic seeds $s in bb(R)^n$ of bounded Euclidean norm. Seeds may depend on $J$ and $h_0$, but are fixed as functions of $x$. Choose a finite tuple of scalar functions $theta$ satisfying
  $ sup_x #scale(x: 120%, y: 120%)[\(] \| theta_alpha \( x \) \| + lr(bar.v.double d theta_alpha \( x \) bar.v.double) #scale(x: 120%, y: 120%)[\)] lt.eq C $
  for each component. Such scalar functions will be called parameters; they may include the averages $b_l$.
  Given auxiliary fields $y^1 \, dots.h \, y^(a - 1)$ already constructed, a source has the form
  #[#set math.equation(numbering: n => "(6.5)")
   $ w_i^a = sum_s phi.alt_(a \, s \, i) #scale(x: 120%, y: 120%)[\(] \( h_i^l \)_(l in I_a) \, theta #scale(x: 120%, y: 120%)[\)] s_i + sum_(b < a) phi.alt_(a \, b \, i) #scale(x: 120%, y: 120%)[\(] \( h_i^l \)_(l in I_a) \, theta #scale(x: 120%, y: 120%)[\)] y_i^b . $ <eq:source-form>]
  All sums and index sets are finite. Coefficients are smooth and bounded, with bounded derivatives of every fixed order needed in the construction, uniformly on their argument ranges and the connecting line segments. Define the new auxiliary field by
  #[#set math.equation(numbering: n => "(6.6)")
   $ y^a = J w^a - j sum_l chevron.l partial_l w^a chevron.r thin m^(l - 1) - j sum_(b < a) chevron.l partial_(y^b) w^a chevron.r thin w^b . $ <eq:small-field>]
  The partial $partial_l$ differentiates the explicitly displayed local argument $h_i^l$, holding every parameter and every auxiliary argument fixed. In particular it holds $b_l$ fixed even when that average is among the parameters. The partial $partial_(y^b)$ differentiates the indicated linear auxiliary argument, with its coefficient held fixed. A partial in an absent argument is zero. Thus $partial_(y^b) w^a$ is simply the coefficient vector $phi.alt_(a \, b)$.
  A terminal vector is another source of the form (6.5), using any already constructed auxiliary fields. A source $w^b$ used again as a terminal vector or in a new source is replaced by its expression (6.5); auxiliary fields themselves are not expanded. The recipe is #emph[admissible from level $p$] if every explicit primary argument appearing in its source formulas or terminal formula has index at least $p$. This condition does not restrict the parameters, or the vectors $m^(l - 1)$ in the correction terms of (6.6).
] <def:small-recipe>

The definition permits two operations that we will use repeatedly. Multiplication by a bounded smooth coefficient of the same allowed arguments gives another source. At any finite stage we may also add parameters satisfying the stated size and difference bounds. We will use the deterministic seed $upright(bold(1)) \/ sqrt(n)$ freely; thus $m^l \/ sqrt(n)$ is a source with the single primary argument $h^l$. Linearity in the auxiliary arguments is preserved in every source. It will be used in both the derivative estimates and the trace cancellation.

For a terminal vector $U$ admissible from level $p$, the estimate we seek is

$ lr(|bb(E) G R_p^(sans(T)) U|) lt.eq C lr(bar.v.double  bar.v.double) G_(*) . $

Its square-density counterpart bounds $\| bb(E) f^2 H_0 R_p^(sans(T)) U \|$ by $C \( bb(E) f^2 + cal(D)_(h_0) \( f \) \)$ when $H_0$ has bounded size and difference norm. With $U = m^p \/ sqrt(n)$, the choices $G = S_p$ and $H_0 = S_p \/ sqrt(n)$ will give the moment estimates above. Lemma 20 proves these rules after we establish the required diagonal derivative bounds.

=== 6.3 A scalar identity for comparing fields <a-scalar-identity-for-comparing-fields>

To pass from $R_(p + 1) = tanh h^p - tanh h^(p + 1)$ to earlier residuals, we use a scalar identity valid for arbitrary real fields. For $z \, r_0 \, a in bb(R)$, define

#[#set math.equation(numbering: n => "(6.7)")
 $ Phi \( z \; r_0 \, a \) = integral_0^1 e^(a \( 1 - u^2 \) \/ 2) frac(cosh \( u \( z - r_0 \) \), cosh z cosh r_0) thin upright(d) u . $ <eq:phi>]

Differentiating $e^(a \( 1 - u^2 \) \/ 2) sinh \( u \( z - r_0 \) \)$ in $u$ gives

#[#set math.equation(numbering: n => "(6.8)")
 $ #scale(x: 120%, y: 120%)[\[] \( z - r_0 - a tanh z \) - a partial_z #scale(x: 120%, y: 120%)[\]] Phi \( z \; r_0 \, a \) = tanh z - tanh r_0 . $ <eq:phi-stein>]

The boundary at $u = 0$ is zero; the boundary at $u = 1$, after division by $cosh z cosh r_0$, is the right side. The identity holds for either sign of $a$. At $a = 0$, $Phi$ is the secant slope of $tanh$, with continuous value $"sech"^2 r_0$ at $z = r_0$.

These formulas also give the uniform coefficient bounds needed for the recipes. Positivity of the integrand and the secant-slope formula imply $0 < Phi lt.eq e^(\| a \| \/ 2)$. For $a$ in a fixed bounded interval, every fixed-order derivative in $z \, r_0 \, a$ is bounded by a constant times $Phi$: derivatives of the hyperbolic factors introduce bounded ratios, and those of the exponential introduce bounded powers of $\( 1 - u^2 \) \/ 2$. The quotient rule then bounds every fixed-order derivative of each ratio $\( partial^alpha Phi \) \/ Phi$. These assertions are uniform in the two real field arguments and require no stability assumption.

In the ordinary residual induction we will substitute $\( z \, r_0 \, a \) = \( h_i^p \, h_i^(p + 1) \, j \( b_p - b_(p - 1) \) \)$. The same identity also provides the two tests comparing an approximate field with the stable root, which we construct next.

=== 6.4 An initial implicit auxiliary field <an-initial-implicit-auxiliary-field>

The directional estimate needs one auxiliary field defined by a linear implicit equation. We construct it near the stable root, establish its inverse margin, and then control its discrete derivatives on a smaller region.

Assume the stable-field implication (5.3) holds at $h_0$ through the fixed residual threshold required in Lemma 15. Let $r$ be its unique root, and put $t_(*) = tanh r$ and $q_(*) = chevron.l t_(*)^2 chevron.r$. Fix $k gt.eq 2$ and consider

#[#set math.equation(numbering: n => "(6.9)")
 $ Omega_rho = { x : max \( lr(bar.v.double R_k \( x \) bar.v.double) \, lr(bar.v.double R_(k - 1) \( x \) bar.v.double) \) lt.eq rho sqrt(n) } . $ <eq:small-region>]

All choices of $rho$ below depend only on the stable-field constants and the operator bound on $J$, until derivative estimates are considered. For sufficiently small $rho$, the primary recursion and Lemma 15 give on $Omega_(2 rho)$

#[#set math.equation(numbering: n => "(6.10)")
 $ lr(bar.v.double h^k - r bar.v.double) + lr(bar.v.double m^(k - 1) - t_(*) bar.v.double) lt.eq C rho sqrt(n) \, #h(2em) \| 1 - b_(k - 1) - q_(*) \| lt.eq C rho . $ <eq:implicit-near-root>]

The comparison is independent of $k$: the primary recursion gives

$ F \( h^k \) = J R_k - j b_(k - 1) \( R_(k - 1) + R_k \) + j \( b_k - b_(k - 1) \) m^k \, #h(2em) \| b_k - b_(k - 1) \| lt.eq 2 lr(bar.v.double R_k bar.v.double) \/ sqrt(n) \, $

so the residual is at most $C rho sqrt(n)$. Applying the root estimate therefore gives the asserted comparison with the same depth independence.

Use the scalar kernel with

#[#set math.equation(numbering: n => "(6.11)")
 $ a = j \( 1 - b_(k - 1) - q_(*) \) \, #h(2em) A_i = Phi \( h_i^k \; r_i \, a \) . $ <eq:phi-data>]

Write $A = D_(\( A_i \))$ and $chi = chevron.l A_i chevron.r$. The initial source $w_0$ is one of

$ w_(0 \, i) = A_i e_i quad \( lr(bar.v.double  bar.v.double) e lt.eq 1 \) \, #h(2em) w_(0 \, i) = n^(- 1 \/ 2) partial_(r_0) Phi \( h_i^k \; r_i \, a \) . $

The partial in the second formula holds $a$ fixed. The two choices have complementary roles. Holding $r_i \, a$ fixed in the site partial $partial_k$, the scalar identity and its derivative in $r_0$ give

#[#set math.equation(numbering: n => "(6.12)")
 $ sum_i \[ \( h_i^k - r_i - a m_i^k \) - a partial_k \] \( A_i e_i \) & = \( m^k - t_(*) \)^(sans(T)) e \,\
sum_i \[ \( h_i^k - r_i - a m_i^k \) - a partial_k \] frac(partial_(r_0) Phi \( h_i^k \; r_i \, a \), sqrt(n)) & = sqrt(n) { chi - \( 1 - q_(*) \) } . $ <eq:implicit-source-actions>]

Indeed differentiating (6.8) in $r_0$ gives $\[ \( z - r_0 - a tanh z \) - a partial_z \] partial_(r_0) Phi = Phi - "sech"^2 r_0$. Thus the first source tests a direction of the magnetization error, while the second tests the discrepancy of the averaged coefficient $chi$. Both quantities enter the posterior comparison. To put these scalar identities into a form controlled by the weak residual rule, introduce the coupled source and field

#[#set math.equation(numbering: n => "(6.13)")
 $ w = w_0 + A \( y^(upright("imp")) - j c_1 t_(*) \) \, #h(2em) y^(upright("imp")) = J w - j chi w - j c_1 m^(k - 1) \,\
c_1 = chevron.l partial_k w chevron.r . $ <eq:implicit>]

In this partial, $y^(upright("imp"))$, $c_1$, and $a$ are independent arguments held fixed. Consequently $partial_(y^(upright("imp"))) w = A$, and the field equation in (6.13) is exactly (6.6) with one allowed self-dependence: $chi$ is its auxiliary-partial average, and $c_1$ its primary-partial average. The correction $j c_1 m^(k - 1)$ will supply the scalar cancellation in Lemma 21. Its only primary local argument is $h^k$. Once constructed, $y^(upright("imp"))$ is available as the first auxiliary field in any ordinary finite recipe. The scalar $sqrt(n) c_1$ is then an additional parameter, and $t_(*) \/ sqrt(n)$ is an additional seed.

#thm([Lemma 6.3.])[
  (Implicit construction).  #emph[For sufficiently small $rho > 0$, (6.13) has a unique solution on $Omega_(2 rho)$. There are constants independent of the primary depth $k$ such that, throughout this region, 
#[#set math.equation(numbering: n => "(6.14)")
 $ lr(bar.v.double  bar.v.double) w + lr(bar.v.double y^(upright("imp")) bar.v.double) + sqrt(n) \| c_1 \| lt.eq C \, #h(2em) I + j chi A - A^(1 \/ 2) J A^(1 \/ 2) succ.curly.eq c I . $ <eq:implicit-size>]

 On $Omega_(3 rho \/ 2)$, for all sufficiently large $n$ depending on the fixed depth, the solution also satisfies 
#[#set math.equation(numbering: n => "(6.15)")
 $ lr(bar.v.double nabla w bar.v.double)_(upright(F)) + lr(bar.v.double nabla y^(upright("imp")) bar.v.double)_(upright(F)) + sqrt(n) lr(bar.v.double d c_1 bar.v.double) lt.eq C_k . $ <eq:implicit-frobenius>]

]
] <lem:implicit-construction>

#proof[
  We first control the coefficients and solve the implicit linear system. Only then do we differentiate it, using the larger region to cover spin flips from the smaller one. The uniform kernel and quotient bounds proved above will control the coefficients even when some $A_i$ are small.
  Put $ell_i = \( partial_z Phi \/ Phi \) \( h_i^k \; r_i \, a \)$. At $z = r_0$ this ratio equals $- tanh r_0$, for every $a$. Comparison with $z = r_0 \, a = 0$, followed by (6.10), gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ lr(bar.v.double A - D_(1 - \( m^k \)^2) bar.v.double)_(upright(F)) lt.eq C rho sqrt(n) \, #h(2em) lr(bar.v.double ell + t_(*) bar.v.double) lt.eq C rho sqrt(n) \, #h(2em) \| chi - b_k \| lt.eq C rho . $ <eq:implicit-coefficients>]
  In particular, the comparisons put $A$ among the diagonals allowed by the stable-field implication, once $rho$ is decreased.
  Let $u_0 = w_0 \/ A$ coordinatewise and $p_0 = A partial_k u_0$. The quotient bounds just proved give $lr(bar.v.double u_0 bar.v.double) + lr(bar.v.double p_0 bar.v.double) lt.eq C$; their local derivatives have coordinatewise bounds proportional to $\| e_i \|$ in the first case and to $n^(- 1 \/ 2)$ in the second. Direct differentiation with the specified partial convention gives
  $ partial_k w = D_ell w + p_0 \, #h(2em) c_1 = chevron.l ell w + p_0 chevron.r . $
  We can now eliminate $y^(upright("imp"))$ and $c_1$ and solve for the source alone. The resulting linear equation is
  #[#set math.equation(numbering: n => "(6.17)")
   $ [I - A \( J - j chi I \) + j / n A \( m^(k - 1) + t_(*) \) ell^(sans(T))] w = A [u_0 - j \( m^(k - 1) + t_(*) \) chevron.l p_0 chevron.r] . $ <eq:implicit-linear-system>]
  Write the matrix on the left as $I + A L_2$. Its symmetrically normalized version $I + A^(1 \/ 2) L_2 A^(1 \/ 2)$ differs in operator norm by $O \( rho \)$ from
  $ I + j b_k A - A^(1 \/ 2) J A^(1 \/ 2) - frac(2 j, n) A^(1 \/ 2) m^k \( m^k \)^(sans(T)) A^(1 \/ 2) . $
  For the rank term, use (6.10) and (6.16) in the elementary inequality $lr(bar.v.double u v^(sans(T)) - u' v' ""^(sans(T)) bar.v.double) lt.eq lr(bar.v.double u - u' bar.v.double) lr(bar.v.double  bar.v.double) v + lr(bar.v.double u' bar.v.double) lr(bar.v.double v - v' bar.v.double)$. The displayed symmetric matrix has the fixed positive margin supplied by (5.3). Decrease $rho$ until the perturbation is less than half that margin. The normalized matrix then has bounded inverse, even though it need not itself be symmetric. The identity
  $ \( I + A L_2 \)^(- 1) = I - A^(1 \/ 2) \( I + A^(1 \/ 2) L_2 A^(1 \/ 2) \)^(- 1) A^(1 \/ 2) L_2 $
  gives the same bound for the unnormalized inverse, since $lr(bar.v.double L_2 bar.v.double)$ is bounded. The right side of (6.17) is bounded in norm, because $\| chevron.l p_0 chevron.r \| lt.eq lr(bar.v.double p_0 bar.v.double) \/ sqrt(n)$. This establishes the size bounds. To obtain the last assertion of (6.14), remove the negative rank term from the stable-field matrix and change $b_k$ to $chi$. The constants used to solve the system and obtain these bounds depend only on the fixed stability and operator margins.
  It remains to bound the discrete derivatives. Compare the equations at $x$ and $x^(\( i \))$. On the stated inner region both configurations belong to $Omega_(2 rho)$ for large $n$, by Lemma 16. In every coefficient-difference term, retain the solution vector at the common point $x$. In particular,
  $ d_i c_1 & = chevron.l \( d_i ell \) w \( x \) + d_i p_0 chevron.r + n^(- 1) ell \( x^(\( i \)) \)^(sans(T)) d_i w \,\
d_i { c_1 \( m^(k - 1) + t_(*) \) } & = c_1 \( x \) d_i m^(k - 1) + \( m^(k - 1) \( x^(\( i \)) \) + t_(*) \) d_i c_1 . $
  Use the same product arrangement for $A$ and $chi$ in
  $ w = A { u_0 + \( J - j chi I \) w - j c_1 \( m^(k - 1) + t_(*) \) } . $
  For clarity, put $v = m^(k - 1) + t_(*)$ and $cal(B) = u_0 + \( J - j chi I \) w - j c_1 v$, and use primes for evaluation at $x^(\( i \))$ in the next display. With $zeta_i = n^(- 1) { \( d_i ell \)^(sans(T)) w + upright(bold(1))^(sans(T)) d_i p_0 }$, the exact equation is
  #[#set math.equation(numbering: n => "(6.18)")
   $ & [I - A' \( J - j chi' I \) + j / n A' v' \( ell' \)^(sans(T))] d_i w\
 & #h(2em) = \( d_i A \) cal(B) + A' d_i u_0 - j A' w thin d_i chi - j c_1 A' d_i m^(k - 1) - j A' v' zeta_i . $ <eq:implicit-flip-system>]
  Thus the left matrix is precisely the matrix in (6.17) evaluated at $x^(\( i \))$. The bracket $cal(B)$ on the right is consequently one common-point vector for all columns. This allows the following estimates to control the Frobenius norm of the entire right side.
  We bound its terms in turn. A site coefficient difference times a common vector $s$ of bounded norm has bounded Frobenius norm, since
  $ sum_(i \, j) s_i^2 \| d_j psi_i \|^2 lt.eq lr(bar.v.double  bar.v.double) s^2 max_i sum_j \| d_j psi_i \|^2 lt.eq C . $
  This applies to $A \, ell \, u_0 \, p_0$, using their coefficient bounds and Lemma 16; the seed factors are retained for $u_0 \, p_0$. The bracket multiplying $d_i A$ is bounded in norm by the already established size estimates, so no bound on $1 \/ A_i$ is needed. Also $lr(bar.v.double d chi bar.v.double) lt.eq C \/ sqrt(n)$, because $A_i$ is a primary site function with an average parameter of that derivative scale. If $zeta_i = chevron.l \( d_i ell \) w + d_i p_0 chevron.r$, then
  $ lr(bar.v.double zeta bar.v.double) lt.eq n^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] lr(bar.v.double D_w nabla ell bar.v.double)_(upright(F)) + lr(bar.v.double nabla p_0 bar.v.double)_(upright(F)) #scale(x: 120%, y: 120%)[\)] lt.eq C \/ sqrt(n) . $
  Its multipliers $m^(k - 1) \( x^(\( i \)) \) + t_(*)$ have norm at most $2 sqrt(n)$, which still gives a bounded Frobenius norm after summing the squared column norms. Finally $\| c_1 \| lr(bar.v.double nabla m^(k - 1) bar.v.double)_(upright(F)) lt.eq C$, by its operator bound and $\| c_1 \| lt.eq C \/ sqrt(n)$. Applying the uniformly bounded flipped inverses column by column proves $lr(bar.v.double nabla w bar.v.double)_(upright(F)) lt.eq C_k$. Returning to the two displayed difference identities gives $lr(bar.v.double d c_1 bar.v.double) lt.eq C_k \/ sqrt(n)$ and the required bound for $nabla y^(upright("imp"))$. The operator in (6.17), the regions $Omega_rho$, and the required buffer inclusions do not depend on the directional seed $e$. All bounds for its right side and its derivatives use only $lr(bar.v.double  bar.v.double) e lt.eq 1$; indeed $u_0 = e$ and $p_0 = 0$ for that source. The inverse margins, the threshold on $n$, and all these estimates are therefore uniform over the full Euclidean unit ball of seeds. ◻
]

===== 6.4.1 Local recipes and their buffers. <local-recipes-and-their-buffers.>

A local recipe starts with this implicit field and adds only ordinary auxiliaries. Such recipes are evaluated on the inner region $Omega_rho$, with all estimates also available on its fixed finite flip-neighborhoods. To define them as functions on the whole cube, keep the actual solution through $Omega_(2 rho)$ and assign finite values to $y^(upright("imp")) \, c_1$ outside that region, defining sources by their stated expressions. The implicit equation is required only inside the buffer. Every test in a local statement is supported on $Omega_rho$. For a fixed recipe, once $n$ is sufficiently large, every difference used in the proof stays strictly inside the buffer. The arbitrary extension therefore does not enter the estimates.

The buffer sizes are chosen before the construction depth; the threshold on dimension is chosen afterward. To verify this order, choose a finite recipe and let $q$ be the largest number of successive spin flips used by any difference in its proof. The induction below adds only finitely many operations at each smaller residual index, so $q$ is finite. The primary bounds give, for every involved level $l$,

$ parallel R_l \( x^(\( i \)) \) - R_l \( x \) parallel lt.eq 2 parallel nabla R_l \( x \) e_i parallel lt.eq C_l . $

With $C = max_l C_l$, a path of at most $q$ flips increases either residual defining $Omega_rho$ by at most $q C$. Thus $n > \( 2 q C \/ rho \)^2$ puts every required neighborhood of $Omega_(3 rho \/ 2)$ strictly inside $Omega_(2 rho)$. Here $q \, C$, and the threshold on $n$ may depend on the already fixed recipe and depth; $rho$ still depends only on the earlier stability and size margins.

=== 6.5 Trace control for small derivatives <trace-control-for-small-derivatives>

The primary derivative bounds do not yet give the diagonal trace control needed for integration by parts. For small vectors, the source structure and its correction terms supply this additional cancellation. We prove it together with the size and derivative bounds used to construct later auxiliary fields.

#thm([Lemma 6.4.])[
  (Small-vector differentiation).  #emph[Every source, auxiliary field, and terminal vector $U$ in a fixed ordinary admissible recipe satisfies 
#[#set math.equation(numbering: n => "(6.19)")
 $ lr(bar.v.double  bar.v.double) U + lr(bar.v.double nabla U bar.v.double)_(upright(F)) + lr(bar.v.double "diag" nabla U bar.v.double)_1 lt.eq C . $ <eq:small-derivative-bound>]

 The same holds locally for recipes with the single initial implicit field above. In these recipes the initial partial $partial_k w$ is also a small source. For every primary coefficient and auxiliary coefficient in (6.6), respectively, 
#[#set math.equation(numbering: n => "(6.20)")
 $ alpha_l = chevron.l partial_l w^a chevron.r : & quad \| alpha_l \| + lr(bar.v.double d alpha_l bar.v.double) lt.eq C \/ sqrt(n) \,\
gamma_b = chevron.l partial_(y^b) w^a chevron.r : & quad \| gamma_b \| + lr(bar.v.double d gamma_b bar.v.double) lt.eq C . $ <eq:small-average-bounds>]

 All local statements include the required fixed flip buffers. Constants can depend on the entire finite recipe and its primary depth.]
] <lem:small-derivatives>

#proof[
  The proof has two parts. We bound the errors introduced by discrete differentiation, then cancel the trace predictions of the retained formal terms. Write $lr(bar.v.double  bar.v.double) E_(upright("nuc"))$ for the sum of the singular values of $E$. The error estimates repeatedly use
  #[#set math.equation(numbering: n => "(6.21)")
   $ \| "Tr" \( P E \) \| lt.eq lr(bar.v.double  bar.v.double) P lr(bar.v.double  bar.v.double) E_(upright("nuc")) \, #h(2em) lr(bar.v.double B C bar.v.double)_(upright("nuc")) lt.eq lr(bar.v.double  bar.v.double) B_(upright(F)) lr(bar.v.double  bar.v.double) C_(upright(F)) \, #h(2em) lr(bar.v.double  bar.v.double) E_(upright("nuc")) lt.eq sum_j lr(bar.v.double E_(dot.op j) bar.v.double) . $ <eq:nuclear-tools>]
  Every bounded-length diagnostic word $P$ has bounded operator norm and bounded off-diagonal entrywise $ell^4$ norm. For the errors arising before we solve the differentiated implicit equations, $P$ may contain one inverse $K$ from (3.2). Its required margin is supplied by the last assertion of (6.14).
  ===== 6.5.1 Source errors. <source-errors.>
  Consider one source term $phi.alt_i s_i$. Retain the derivative
  #[#set math.equation(numbering: n => "(6.22)")
   $ D_phi.alt nabla s + sum_l D_(s partial_l phi.alt) nabla h^l \, $ <eq:retained-source>]
  and put parameter derivatives into the error rather than into the formal expression. Set
  $ Q_(i j) = sum_l \| d_j h_i^l \| \, #h(2em) Theta_j = sum_alpha \| d_j theta_alpha \| . $
  The finite sums have the bounds
  $ max_i sum_j Q_(i j)^2 + lr(bar.v.double  bar.v.double) Q_(ell^4)^2 + lr(bar.v.double "diag" Q bar.v.double)_2^2 lt.eq C \, #h(2em) lr(bar.v.double Theta bar.v.double) lt.eq C . $
  Taylor expansion of $d_j phi.alt_i$ has linear parameter terms and a remainder bounded entrywise by
  #[#set math.equation(numbering: n => "(6.23)")
   $ C { Q_(i j)^2 + Q_(i j) Theta_j + Theta_j^2 } . $ <eq:source-taylor-error>]
  After multiplication by $s_i$, the linear parameter terms have bounded nuclear norm: each is a rank-one matrix with a bounded-norm left vector and a bounded-norm right vector. For the $Q^2$ part, the matrix before multiplication by $D_s$ has bounded Frobenius norm. Its product with $D_s$ has bounded nuclear norm by (6.21) and $lr(bar.v.double D_s bar.v.double)_(upright(F)) = lr(bar.v.double  bar.v.double) s lt.eq C$. For the mixed part the sum of column norms is at most
  $ C sum_j Theta_j #scale(x: 180%, y: 180%)[\(] sum_i s_i^2 Q_(i j)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq C lr(bar.v.double Theta bar.v.double) #scale(x: 180%, y: 180%)[\(] sum_i s_i^2 sum_j Q_(i j)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq C . $
  For the last part it is at most $C lr(bar.v.double  bar.v.double) s sum_j Theta_j^2 lt.eq C$. These separate estimates also apply to the combined remainder in (6.23): entry by entry, assign each summand in the bound its proportional share of the actual remainder.
  The product rule also has a remainder with entries bounded by
  $ C \| d_j s_i \| { Q_(i j) + Theta_j } . $
  Assume $lr(bar.v.double nabla s bar.v.double)_(upright(F)) lt.eq C$, which is zero for a seed, holds for the initial implicit field by Lemma 18, and is inductive for later fields. The $Theta$ part has bounded sum of column norms by Cauchy–Schwarz. For the $Q$ part, test against $P$ and split the trace into diagonal and off-diagonal terms. Hölder’s inequality gives
  $ sum_(i eq.not j) \| P_(j i) \| thin \| d_j s_i \| Q_(i j) & lt.eq lr(bar.v.double P_(upright("off")) bar.v.double)_(ell^4) lr(bar.v.double nabla s bar.v.double)_(upright(F)) lr(bar.v.double  bar.v.double) Q_(ell^4) lt.eq C \,\
sum_i \| P_(i i) \| thin \| d_i s_i \| Q_(i i) & lt.eq lr(bar.v.double  bar.v.double) P lr(bar.v.double "diag" nabla s bar.v.double)_2 lr(bar.v.double "diag" Q bar.v.double)_2 lt.eq C . $
  The first line uses exponents $4 \, 2 \, 4$. In particular, the argument does not assume the diagonal $ell^1$ bound for $nabla s$ that we are still proving. Bounded entries of $Q$ also give a bounded Frobenius norm for this error. We have therefore controlled each source error both in Frobenius norm and in trace against the indicated words.
  ===== 6.5.2 Average corrections and size bounds. <average-corrections-and-size-bounds.>
  Next we control the averaged coefficients in the correction terms. Differentiating a coefficient function in a primary argument gives another source with the same inputs and bounds. Apply the size and Frobenius parts of the preceding estimates to that source, then average:
  $ \| chevron.l chevron.r u \| lt.eq lr(bar.v.double  bar.v.double) u \/ sqrt(n) \, #h(2em) lr(bar.v.double d chevron.l chevron.r u bar.v.double) lt.eq lr(bar.v.double nabla u bar.v.double)_(upright(F)) \/ sqrt(n) \, $
  which proves the first line of (6.20). The implicit coefficient $c_1$ already has these bounds from its direct construction. For an auxiliary partial the scale is different: it is a bounded coefficient vector, rather than a small vector. Averaging its difference estimate $\| d_j phi.alt_i \| lt.eq C \( Q_(i j) + Theta_j \)$ and using the row bounds above gives $\| chevron.l phi.alt chevron.r \| + lr(bar.v.double d chevron.l phi.alt chevron.r bar.v.double) lt.eq C$. This proves the second line, including the self-coefficient $chi$ when it occurs.
  For a primary correction $alpha_l m^(l - 1)$ retain $alpha_l nabla m^(l - 1)$. The dropped rank-one matrix has nuclear norm at most $lr(bar.v.double m^(l - 1) bar.v.double) lr(bar.v.double d alpha_l bar.v.double) lt.eq C$. The dropped product error is $nabla m^(l - 1)$ times a diagonal of signed entries $2 d_i alpha_l$. Its nuclear norm is bounded by
  $ 2 lr(bar.v.double nabla m^(l - 1) bar.v.double)_(upright(F)) lr(bar.v.double d alpha_l bar.v.double) lt.eq C sqrt(n) thin n^(- 1 \/ 2) lt.eq C . $
  This also holds for $m^0 = x$. For an auxiliary correction $gamma_b w^b$, the analogous rank-one and product errors have bounded nuclear norm using $lr(bar.v.double w^b bar.v.double) + lr(bar.v.double nabla w^b bar.v.double)_(upright(F)) lt.eq C$ and $\| gamma_b \| + lr(bar.v.double d gamma_b bar.v.double) lt.eq C$. When primary derivatives in retained terms are replaced by $H_l \, M_l$, their Frobenius errors from Lemma 16 are multiplied either by a small-vector diagonal or by an $O \( n^(- 1 \/ 2) \)$ scalar. In the former case (6.21) applies; in the latter use $lr(bar.v.double  bar.v.double) E_(upright("nuc")) lt.eq sqrt(n) lr(bar.v.double  bar.v.double) E_(upright(F))$. Both give bounded nuclear norm.
  We can now close the induction for the size and Frobenius parts of (6.19). In (6.6), the terms are a bounded-norm leading term, primary corrections bounded by $C sqrt(n) thin n^(- 1 \/ 2)$, and bounded-norm auxiliary corrections. The retained source derivative (6.22) is Frobenius-bounded: use the preceding auxiliary derivative bounds and $lr(bar.v.double D_(s partial_l phi.alt) nabla h^l bar.v.double)_(upright(F)) lt.eq lr(bar.v.double s partial_l phi.alt bar.v.double) lr(bar.v.double nabla h^l bar.v.double)$. The retained primary correction is bounded in Frobenius norm by $\| alpha_l \| lr(bar.v.double nabla m^(l - 1) bar.v.double)_(upright(F)) lt.eq C$. Thus the size and Frobenius induction closes before we use or prove the diagonal $ell^1$ assertion.
  ===== 6.5.3 Solving the differentiated self-dependence. <solving-the-differentiated-self-dependence.>
  The initial implicit source needs one additional step before the trace cancellation. Retain its site partials, freeze the parameters and averages, and replace the primary derivatives by their formal matrices. This gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ nabla w & = A nabla y^(upright("imp")) + D_(partial_k w) H_k + E_1 \,\
nabla y^(upright("imp")) & = \( J - j chi I \) nabla w - j c_1 M_(k - 1) + E_2 . $ <eq:implicit-formal-differentiation>]
  The errors have bounded Frobenius norm and bounded trace against words containing at most one $K$. The parameter $c_1$ causes no exception: write the corresponding source term as $- j \( sqrt(n) c_1 \) A \( t_(*) \/ sqrt(n) \)$, so that it is exactly of the source form above. Its difference bound follows from (6.15). Solving (6.24) yields
  #[#set math.equation(numbering: n => "(6.25)")
   $ nabla w = K { D_(partial_k w) H_k - j c_1 A M_(k - 1) + E_1 + A E_2 } \, #h(2em) K = \( I - A J + j chi A \)^(- 1) . $ <eq:implicit-derivative-solved>]
  Testing a propagated error against an ordinary word now puts at most one $K$ into the test word. The preceding error estimates therefore give both bounded trace and bounded Frobenius norm. Substitution gives the same conclusion for $nabla y^(upright("imp"))$. Subsequent fields are ordinary: propagating these errors multiplies them only by ordinary words. Induction therefore bounds the trace of every final error against an ordinary word. Since the recipe is fixed and finite, the required increases in word length are finite as well.
  ===== 6.5.4 Cancellation of the formal traces. <cancellation-of-the-formal-traces.>
  All differentiated errors are now controlled. To finish, we must bound the diagonal $ell^1$ norm of the retained formal derivative. A single ordinary field already illustrates the cancellation. From $w_i = phi.alt \( h_i^1 \) s_i$ we obtain $y = J w - j chevron.l phi.alt' \( h^1 \) s chevron.r x$. If $P = D_(phi.alt' \( h^1 \) s)$, its retained derivative is $J P J - j chevron.l phi.alt' \( h^1 \) s chevron.r I$, whose two diagonal predictions cancel. We now show that the correction at each node gives this same cancellation along every dependency path, including paths through the implicit field.
  At the point $x$, freeze the local partial vectors and all their averages. Index each primary or auxiliary field by a node $a$, and attach its source to the same node: for example, $h^l$ has source $m^(l - 1)$, and $y^a$ has source $w^a$. Let $p_(a d)$ be the partial of the source at node $a$ with respect to the field at node $d$. Introduce a formal variable $z$, and denote the formal source and field derivatives by $frak(S)_a$ and $frak(H)_a$, respectively. They obey
  #[#set math.equation(numbering: n => "(6.26)")
   $ frak(S)_a = sum_d D_(p_(a d)) frak(H)_d \, #h(2em) frak(H)_a = z J frak(S)_a - z^2 j sum_d chevron.l p_(a d) chevron.r frak(S)_d . $ <eq:formal-graph>]
  At the spin leaf, the source derivative for $h^1$ is $I$ and its field derivative is $z J$. A terminal source uses just the first equation. At $z = 1$ these are precisely the retained formal derivatives. In the implicit case the only cyclic node is $y^(upright("imp"))$ and its source $w$; closing it gives
  #[#set math.equation(numbering: n => "(6.27)")
   $ frak(S)_(upright("imp")) = K \( z \) { D_(partial_k w) frak(H)_(h^k) - z^2 j c_1 A frak(S)_(h^k) } \, quad K \( z \) = \( I - z A J + z^2 j chi A \)^(- 1) . $ <eq:formal-self-loop>]
  Every other dependency is acyclic and linear. Solving the single cyclic node therefore leaves at most one inverse $K \( z \)$ in each product of the closed formulas.
  The averaged term in (6.27) is essential even for $k = 2$. Write $D = D_(1 - \( m^1 \)^2)$ and $P = D_(partial_2 w)$, so that $b_1 = n^(- 1) "Tr" D$ and $c_1 = n^(- 1) "Tr" P$. Then
  $ frak(H)_(h^2) = z^2 \( J D J - j b_1 I \) \, #h(2em) frak(S)_(h^2) = z D J \, $
  and the implicit derivative is $K \( z \) { z^2 P \( J D J - j b_1 I \) - z^3 j c_1 A D J }$. At degree four, the two noncrossing pairings of $A J A J P J D J$ have predictions
  $ j^2 chi b_1 A P \, #h(2em) j^2 c_1 frac("Tr" \( A D \), n) A . $
  The first is canceled by the terms from $- j chi A$ in the quadratic coefficient of $K \( z \)$ and $- j b_1 I$ in $frak(H)_(h^2)$. The second is canceled by the degree-four term $- j c_1 A J A D J$ from the averaged correction. This calculation exhibits the first cancellation involving both the self-dependent node and its primary input. We now account for every degree by following dependency paths.
  We work coefficient by coefficient. An uncontracted dependency path, followed backwards from a field to the spin leaf, has successive links $J D_(p_(a d))$ and ends with the $J$ link of $h^1$. A terminal source contributes an initial partial diagonal and then such a path. The choices of input nodes index these paths separately, preserving all multiplicities. Expanding (6.26) is inclusion–exclusion over disjoint originally adjacent link pairs: the first term keeps the first link, while the second contracts it with the next link, with factor $- j chevron.l p_(a d) chevron.r$, and continues from the input node’s source. That continuation skips exactly the link just contracted. Every contraction has degree two in $z$, equal to the degree of the replaced links. Consequently a coefficient of degree $L$ involves only uncontracted paths of length $L$, of which there are finitely many even with the self-dependence.
  To compute the trace prediction, test the formal derivative by a bounded diagonal $D$. Fix a nonempty path and a full noncrossing pairing of its links. Reinserting contracted adjacent pairs restores that same full-pairing prediction. Each contraction contributes its minus sign. Conversely, all subsets of the originally adjacent pairs of that full pairing occur, with precisely these signs. Such a full pairing has at least one originally adjacent pair, so its total coefficient is zero. Paths of odd length have no full pairing. There is no empty path contributing a derivative of a small seed, because all seeds are fixed with respect to $x$; parameter derivatives were already put into the error. Thus the trace prediction vanishes as a formal power series. The polynomial-prediction assertion for single-inverse words in Lemma 2 then makes it zero at $z = 1$ in the closed formulas.
  To pass from this zero prediction to a bounded trace, we use the small-vector structure. Every product in a closed formal derivative of a small vector contains either a small-vector diagonal or a scalar of size $O \( n^(- 1 \/ 2) \)$: a path giving a nonzero derivative must enter the primary nodes before reaching the spin leaf. Entry from a small source uses either its primary partial, a small vector, or the average of that partial in a correction term. The latter has the indicated scalar size. For the implicit starting node these are exactly $partial_k w$ and $c_1$ in (6.27).
  For a term containing a small diagonal $D_s$, rotate the tested trace to put that factor first. The word estimate for the remaining factors and Cauchy–Schwarz give
  $ lr(|"Tr" \( D_s Q \) - sum_i s_i thin \[ sans(P) \( Q \) \]_(i i)|) lt.eq lr(bar.v.double  bar.v.double) s lr(bar.v.double "diag" \( Q - sans(P) \( Q \) \) bar.v.double)_2 lt.eq C . $
  The normalized-trace prediction is cyclically invariant by Lemma 2, so the rotation does not change the prediction being cancelled. For a term with a scalar of size $O \( n^(- 1 \/ 2) \)$, its unscaled trace error is at most $C sqrt(n)$ by the diagonal $ell^2$ word estimate, and multiplication gives the same $O \( 1 \)$ bound. The closed formula has finitely many terms. Combining their errors with the zero prediction and the already controlled differentiated errors gives
  $ \| "Tr" \( D nabla U \) \| lt.eq C #h(2em) \( lr(bar.v.double  bar.v.double) D lt.eq 1 \, med D upright(" diagonal") \) . $
  Taking $D_(i i)$ to be the sign of $d_i U_i$ proves the remaining assertion $lr(bar.v.double "diag" nabla U bar.v.double)_1 lt.eq C$. All arguments were pointwise inside the prescribed buffers, which proves the local version as well. ◻
]

=== 6.6 The weak residual rule <the-weak-residual-rule>

We now apply the diagonal $ell^1$ estimate to the exact conditional integration-by-parts identity at the first primary field. The scalar integral identity then reduces each higher residual to earlier ones. We carry out this induction for ordinary tests and square-density tests together.

#thm([Lemma 6.5.])[
  (Weak residual rule).  #emph[Let $U$ be a terminal vector in a fixed recipe admissible from level $p gt.eq 1$. For an ordinary recipe and every scalar $G$, 
#[#set math.equation(numbering: n => "(6.28)")
 $ lr(|bb(E) G R_p^(sans(T)) U|) lt.eq C lr(bar.v.double  bar.v.double) G_(*) . $ <eq:weak-residual>]

 For a local recipe with implicit starting index $k$, the same conclusion holds when $p lt.eq k$ and $G$ is supported on $Omega_rho$.]
  #emph[There is also an ordinary square-density version. If $sup_x \( \| H_0 \( x \) \| + lr(bar.v.double d H_0 \( x \) bar.v.double) \) lt.eq C_0$, then for every $f$, 
#[#set math.equation(numbering: n => "(6.29)")
 $ lr(|bb(E) f^2 H_0 R_p^(sans(T)) U|) lt.eq C { bb(E) f^2 + cal(D)_(h_0) \( f \) } . $ <eq:square-residual>]

 Constants are uniform in $f \, G \, H_0$ subject to the stated bound, and may depend on $p$, the recipe, its coefficient bounds, and the finite set of word diagnostics needed in the proof.]
] <lem:residual>

#proof[
  We induct strongly on $p$ over all finite admissible recipes, proving the two assertions together. Each step may enlarge the original recipe, but it adds only finitely many auxiliary operations and invokes only smaller residual indices. Consequently every particular instance of the induction uses finitely many operations and a finite word-length bound.
  At the base level $p = 1$, condition on all spins except the one being differentiated. Its conditional mean is $m_i^1$ and its conditional variance is $v_i^1$. A function of this single spin is affine, with linear coefficient $d_i$ of the function. Taking its conditional covariance with the spin gives the exact identity
  #[#set math.equation(numbering: n => "(6.30)")
   $ bb(E) sum_i \( x_i - m_i^1 \) G U_i = bb(E) sum_i v_i^1 d_i \( G U_i \) . $ <eq:conditional-ibp>]
  By (1.2), its right side is
  $ bb(E) sum_i v_i^1 G d_i U_i + bb(E) sum_i v_i^1 \( d_i G \) { U_i - 2 x_i d_i U_i } . $
  The diagonal derivative bound makes the first term at most $C bb(E) \| G \|$. For the second term, the coefficient vector has pointwise norm at most $lr(bar.v.double  bar.v.double) U + 2 lr(bar.v.double "diag" nabla U bar.v.double)_2 lt.eq C$. Weighted Cauchy–Schwarz and $0 < v_i^1 lt.eq 1$ therefore bound that term by $C cal(D)_(h_0) \( G \)^(1 \/ 2)$. This proves (6.28). For a supported local test, its derivatives vanish outside the one-flip neighborhood of its support; all bounds used here are available there.
  For (6.29), absorb the bounded multiplier by replacing $U$ in the base identity with $tilde(U) = H_0 U$. This vector still has bounded norm and bounded diagonal derivative $ell^1$ norm: the additional term obeys $sum_i \| U_i d_i H_0 \| lt.eq lr(bar.v.double  bar.v.double) U lr(bar.v.double d H_0 bar.v.double)$, and the product-error term is bounded by the same argument using $lr(bar.v.double "diag" nabla U bar.v.double)_2$. Apply (6.30) with $G = f^2$ and use
  $ d_i \( f^2 \) = 2 f thin d_i f - 2 x_i \( d_i f \)^2 . $
  The diagonal-derivative term is bounded by $C bb(E) f^2$; the remaining terms are bounded by $C sqrt(bb(E) f^2 thin cal(D)_(h_0) \( f \)) + C cal(D)_(h_0) \( f \)$. The base case is now proved in both forms. Before proceeding to higher residuals, we record how bounded scalar multipliers affect the tests. If $\| theta.alt \| + lr(bar.v.double d theta.alt bar.v.double) lt.eq C$, then
  #[#set math.equation(numbering: n => "(6.31)")
   $ lr(bar.v.double theta.alt G bar.v.double)_(*) lt.eq C' lr(bar.v.double  bar.v.double) G_(*) . $ <eq:star-multiplier>]
  Indeed arrange the product rule as $d_i \( theta.alt G \) = theta.alt \( x^(\( i \)) \) d_i G + G \( x \) d_i theta.alt$, square, and sum with weights $v_i^1 lt.eq 1$. In the square-density case such a multiplier can be absorbed into $H_0$; the product retains its bounded size and difference norm. For local tests only the buffer bounds are needed, since multiplication does not enlarge their support.
  For the induction step, suppose both assertions hold through level $p$ and take $U$ admissible from level $p + 1$. The scalar integral identity suggests the following new source. Set
  $ a_p = j \( b_p - b_(p - 1) \) \, #h(2em) U'_i = Phi \( h_i^p \; h_i^(p + 1) \, a_p \) U_i . $
  This is a source admissible from level $p$. Its coefficient and all needed derivatives are bounded because $\| a_p \| lt.eq j$ and the bounds for $Phi$ proved with (6.8) hold uniformly in its two real field arguments. The level condition on $U$ makes its site partial at level $p$ vanish: $partial_p U$ differentiates only explicit primary arguments. Parameters and auxiliary arguments remain fixed, including when their values depend on earlier primary fields. Applying (6.8) coordinatewise therefore yields
  $ R_(p + 1)^(sans(T)) U = \( h^p - h^(p + 1) - a_p m^p \)^(sans(T)) U' - a_p n chevron.l partial_p U' chevron.r . $
  The primary recursion gives
  $ h^p - h^(p + 1) - a_p m^p = J R_p + a_p R_p - j b_(p - 1) R_(p - 1) \, $
  where the last term is absent for $p = 1$. Add a last auxiliary field $y'$ by (6.6) with source $U'$, and write $alpha_l = chevron.l partial_l U' chevron.r$ and $gamma_b = chevron.l partial_(y^b) U' chevron.r$. Symmetry of $J$ now gives
  #[#set math.equation(numbering: n => "(6.32)")
   $ R_(p + 1)^(sans(T)) U =  & R_p^(sans(T)) y' + a_p R_p^(sans(T)) U' - j b_(p - 1) R_(p - 1)^(sans(T)) U' + j sum_b gamma_b R_p^(sans(T)) w^b\
 & + j sum_(l gt.eq p) alpha_l R_p^(sans(T)) m^(l - 1) - a_p n alpha_p . $ <eq:residual-induction-expansion>]
  The first line now consists of earlier residuals with admissible sources and bounded multipliers. After testing, (6.31), (6.20), and the level constraints allow us to apply the induction hypothesis to each term. In particular the enlarged recipe is admissible from level $p$, which is also sufficient for its $R_(p - 1)$ term.
  On the second line, the terms with $l > p$ use the terminal source $m^(l - 1) \/ sqrt(n)$, admissible from level $p$, and multiplier $sqrt(n) alpha_l$. The multiplier bounds follow from Lemma 19. The remaining term is handled by the identity
  #[#set math.equation(numbering: n => "(6.33)")
   $ R_p^(sans(T)) m^(p - 1) = n \( b_p - b_(p - 1) \) - R_p^(sans(T)) m^p . $ <eq:residual-inner-product>]
  This follows from $\( m^(p - 1) - m^p \)^(sans(T)) \( m^(p - 1) + m^p \) = lr(bar.v.double m^(p - 1) bar.v.double)^2 - lr(bar.v.double m^p bar.v.double)^2$. The first term on the right of (6.33) cancels $a_p n alpha_p$ in (6.32); the remaining term is handled with the admissible source $m^p \/ sqrt(n)$ and multiplier $sqrt(n) alpha_p$. This completes the induction for both (6.28) and (6.29). In the local version it stops at level $k$; each added source respects the support and buffer requirements of the initial implicit construction. ◻
]

The last step puts the implicit source into the form needed for the posterior comparison. The following identity is a direct application of the weak residual rule, with the averaged correction retained.

#thm([Lemma 6.6.])[
  (Terminal residual identity).  #emph[For the implicit construction at index $k$ and every $G$ supported on $Omega_rho$, 
#[#set math.equation(numbering: n => "(6.34)")
 $ lr(|bb(E) G [{ h^k - h_0 - \( J - j b_(k - 1) I \) m^k }^(sans(T)) w - j \( b_k - b_(k - 1) \) n c_1]|) lt.eq C lr(bar.v.double  bar.v.double) G_(*) . $ <eq:terminal-residual>]

]
] <lem:terminal-residual>

#proof[
  The vector in braces is $J R_k - j b_(k - 1) \( R_(k - 1) + R_k \)$. To express its pairing with the implicit source in terms of earlier residuals, use symmetry of $J$, the equation $J w = y^(upright("imp")) + j chi w + j c_1 m^(k - 1)$, and (6.33). The bracketed expression becomes
  $ R_k^(sans(T)) y^(upright("imp")) + j \( chi - b_(k - 1) \) R_k^(sans(T)) w - j b_(k - 1) R_(k - 1)^(sans(T)) w - j c_1 R_k^(sans(T)) m^k . $
  Apply Lemma 20 to the first three terms, absorbing their bounded parameters into the test. For the last term, use source $m^k \/ sqrt(n)$ and multiplier $sqrt(n) c_1$. The bounds needed for this multiplier are precisely (6.14) and (6.15). ◻
]

== 7 Posterior estimates at a stable field <sec:consequences>

The residual rules now yield the two posterior estimates used in Section 2. We first select a finite collection of small-residual regions, then compare the primary iterates with the exact root. Throughout, $J$ satisfies the required fixed-length word diagnostics, and $h_0$ satisfies the whole stable-field implication through residual threshold $rho_0 sqrt(n)$. Denote the unique zero of $F_(h_0)$ by $r$ and set $t_(*) = tanh r$, $q_(*) = chevron.l t_(*)^2 chevron.r$. All expectations and forms here are at $mu_(h_0)$, and $R_l = m^(l - 1) - m^l$ denotes the residual from Section 6.

=== 7.1 Selecting a small-residual region <selecting-a-small-residual-region>

The primary recursion need not converge. The finite-depth fact we need is that two consecutive residuals are small on most of the Gibbs mass, with a separate bound after square reweighting. Smooth cutoffs make that selection compatible with discrete differentiation.

#thm([Lemma 7.1.])[
  #emph[For each sufficiently small fixed $rho > 0$, there is a fixed depth $d$ and functions $C_k$, $2 lt.eq k lt.eq d$, with the following properties:]
  + #emph[$0 lt.eq C_k lt.eq 1$, and $C_k$ is supported where $max \( lr(bar.v.double R_k bar.v.double) \, lr(bar.v.double R_(k - 1) bar.v.double) \) lt.eq rho sqrt(n)$. It equals one where both norms are at most $rho sqrt(n) \/ 2$, and $lr(bar.v.double d C_k bar.v.double) lt.eq C_rho \/ sqrt(n)$ pointwise.]
  + #emph[Set $hat(C)_k = C_k product_(i = 2)^(k - 1) \( 1 - C_i \)$ and $D = 1 - sum_(k = 2)^d hat(C)_k$. Then $0 lt.eq D lt.eq 1$ and 
$ bb(P)_(mu_(h_0)) \( D > 0 \) lt.eq C_rho / n . $

 For $N = bb(E) f^2 > 0$ and $nu = f^2 mu_(h_0) \/ N$, 
$ bb(P)_nu \( D > 0 \) lt.eq C_rho / sqrt(n) (1 + frac(cal(D)_(h_0) \( f \), N)) . $

]
  #emph[All constants are uniform over the field and matrix under the stated diagnostics. The depth and the required diagnostic length may depend on $rho$.]
] <lem:residual-selection>

#proof[
  We use the scalar residual pairing $S_l = R_l^(sans(T)) m^l \/ sqrt(n)$ to control the total squared increment. First, the primary derivative bounds give $lr(bar.v.double d S_l bar.v.double) lt.eq C_l$ pointwise. In the product rule, the linear terms are controlled by the operator norms of $nabla R_l$ and $nabla m^l$, multiplied by $lr(bar.v.double m^l bar.v.double) \/ sqrt(n)$ and $lr(bar.v.double R_l bar.v.double) \/ sqrt(n)$. The cross term for coordinate $i$ has size at most $2 lr(bar.v.double d_i R_l bar.v.double) lr(bar.v.double d_i m^l bar.v.double) \/ sqrt(n)$; summing its square uses the bounded column norms and gives the same scale.
  Apply Lemma 20 with target $m^l \/ sqrt(n)$ and test $G = S_l$. It gives
  $ bb(E) S_l^2 lt.eq C_l #scale(x: 120%, y: 120%)[\(] bb(E) S_l^2 + C_l #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, #h(2em) upright("hence") #h(2em) bb(E) S_l^2 lt.eq C'_l . $
  For the square-density version use $H_0 = S_l \/ sqrt(n)$, which is bounded with bounded difference norm. Dividing the resulting estimate by $N sqrt(n)$ gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ bb(E)_nu (S_l / sqrt(n))^2 lt.eq C_l / sqrt(n) (1 + frac(cal(D)_(h_0) \( f \), N)) . $ <eq:weighted-S>]
  We now use the squared-increment identity (6.2). Choose a fixed $d$ with $floor.l d \/ 2 floor.r rho^2 \/ 4 > 2$, followed by $epsilon > 0$ with $2 d epsilon < 1$. Whenever $max_(l lt.eq d) \| S_l \| \/ sqrt(n) lt.eq epsilon$, telescoping gives $sum_(l = 1)^d lr(bar.v.double R_l bar.v.double)^2 \/ n < 2$. If every consecutive pair contained a residual larger than $rho sqrt(n) \/ 2$, the disjoint pairs $\( 1 \, 2 \) \, \( 3 \, 4 \) \, dots.h$ would force the sum to exceed this bound. At least one pair therefore meets the required threshold.
  To implement the selection smoothly, apply a scalar cutoff equal to one on $\[ 0 \, 1 \/ 4 \]$ and zero on $\[ 1 \, oo \)$ to each of $lr(bar.v.double R_k bar.v.double)^2 \/ \( rho^2 n \)$ and $lr(bar.v.double R_(k - 1) bar.v.double)^2 \/ \( rho^2 n \)$, and multiply the results to define $C_k$. The primary operator and column bounds, with the product rule, give $lr(bar.v.double d \( lr(bar.v.double R_l bar.v.double)^2 \/ n \) bar.v.double) lt.eq C_l \/ sqrt(n)$, hence the claimed derivative bound. Finally $D = product_(k = 2)^d \( 1 - C_k \)$: positive deficit implies $max_(l lt.eq d) \| S_l \| \/ sqrt(n) > epsilon$. The preceding two moment bounds and a finite union bound give the ordinary and square-reweighted estimates. ◻
]

=== 7.2 A directional covariance bound <a-directional-covariance-bound>

On each selected region, the implicit test vector converts the residual identity into a comparison with $t_(*)$. Its auxiliary scalar error is estimated first; only then do we test in an arbitrary Euclidean direction.

#thm([Proposition 7.2.])[
  #emph[There is a constant $C$ such that, at every field satisfying the above stable-field implication, 
#[#set math.equation(numbering: n => "(7.2)")
 $ lr(bar.v.double "Cov"_(mu_(h_0)) \( G \, x \) bar.v.double) lt.eq C #scale(x: 120%, y: 120%)[\(] "Var"_(mu_(h_0)) \( G \) + cal(D)_(h_0) \( G \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) $ <eq:directional>]

 for every $G$. The constant is uniform in $n \, h_0$, and $G$ on the specified matrix events; only a fixed finite diagnostic length is required.]
] <prop:directional>

#proof[
  Fix an index $k gt.eq 2$ and work on the small-residual region (6.9), with the buffered implicit construction (6.13). Abbreviate $m = m^k$, $p = m - t_(*)$, and put
  $ a = j \( 1 - b_(k - 1) - q_(*) \) \, #h(2em) L_(*) = sqrt(n) #scale(x: 120%, y: 120%)[\(] chi - \( 1 - q_(*) \) #scale(x: 120%, y: 120%)[\)] . $
  Here $chi = chevron.l A_i chevron.r$ and $A_i = Phi \( h_i^k \; r_i \, a \)$ are defined globally by (6.11), even though the implicit vector is only needed locally. Thus $\| L_(*) \| lt.eq C sqrt(n)$ and $lr(bar.v.double d L_(*) bar.v.double) lt.eq C_k$ pointwise, by the primary derivative bounds and $lr(bar.v.double d b_(k - 1) bar.v.double) = O \( n^(- 1 \/ 2) \)$.
  For either of the two allowed sources $w_0$, the following pointwise identity holds on the buffered region:
  #[#set math.equation(numbering: n => "(7.3)")
   $ & #scale(x: 120%, y: 120%)[\(] h^k - h_0 - \( J - j b_(k - 1) I \) m #scale(x: 120%, y: 120%)[\)]^(sans(T)) w - j \( b_k - b_(k - 1) \) n c_1\
 & quad = sum_i #scale(x: 120%, y: 120%)[\[] \( h_i^k - r_i - a m_i \) - a partial_k #scale(x: 120%, y: 120%)[\]] w_(0 \, i) + j \( 1 - q_(*) - chi \) p^(sans(T)) w - j c_1 R_k^(sans(T)) p . $ <eq:implicit-comparison>]
  Here the zeroth-order term in the first sum acts by multiplication on $w_(0 \, i)$. For the verification, subtract the root equation to write the vector on the left as $h^k - r - a m - J p + j \( 1 - q_(*) \) p$, then substitute $J w = y^(upright("imp")) + j chi w + j c_1 m^(k - 1)$. Apply (6.8) to the contribution $A \( y^(upright("imp")) - j c_1 t_(*) \)$, holding its auxiliary arguments and parameters fixed, and use $n c_1 = sum_i partial_k w_i$. The remaining scalar terms cancel by
  $ p^(sans(T)) \( m^(k - 1) + t_(*) \) + n \( b_k - b_(k - 1) \) = n \( 1 - b_(k - 1) - q_(*) \) + R_k^(sans(T)) p \, $
  which follows by expanding $p = m - t_(*)$ and $R_k = m^(k - 1) - m$.
  Lemma 21 controls the tested left-hand side of (7.3). The last term on the right also has tested expectation at most $C lr(bar.v.double G bar.v.double)_(*)$: apply Lemma 20 to target $p \/ sqrt(n)$ and multiplier $sqrt(n) c_1$. The latter is bounded with bounded difference norm on the buffer. Meanwhile the size estimates for the implicit solution and Lemma 15 give
  #[#set math.equation(numbering: n => "(7.4)")
   $ \| j \( 1 - q_(*) - chi \) p^(sans(T)) w \| lt.eq C_0 rho \| L_(*) \| . $ <eq:middle-error>]
  The source size and stability margins determine $C_0$ independently of $k$ and the selection depth. This lets us choose $rho$ first so that $C_0 rho < 1 \/ 2$ and all stability and flip-buffer conditions hold. The selection depth in Lemma 22 is chosen afterward. This order will permit absorption of the scalar error without a self-dependent choice of depth.
  First control the averaged coefficient by taking $w_(0 \, i) = partial_(r_0) Phi \( h_i^k \; r_i \, a \) \/ sqrt(n)$. The second identity in (6.12) makes the first sum in (7.3) equal to $L_(*)$. Test with $G = C_k^2 L_(*)$. The cutoff and difference bounds give
  $ lr(bar.v.double C_k^2 L_(*) bar.v.double)_(*) lt.eq C + lr(bar.v.double C_k L_(*) bar.v.double)_(L^2 \( mu_(h_0) \)) . $
  Indeed its difference vector is bounded pointwise: $\| L_(*) \| = O \( sqrt(n) \)$ multiplies $lr(bar.v.double d \( C_k^2 \) bar.v.double) = O \( n^(- 1 \/ 2) \)$, and $lr(bar.v.double d L_(*) bar.v.double) = O \( 1 \)$. Absorbing (7.4) now yields
  #[#set math.equation(numbering: n => "(7.5)")
   $ lr(bar.v.double C_k L_(*) bar.v.double)_(L^2 \( mu_(h_0) \)) lt.eq C'_k . $ <eq:susceptibility-average>]
  Now test a direction by taking $w_0 = A e$, where $e$ is any deterministic vector with $lr(bar.v.double  bar.v.double) e lt.eq 1$. By the first identity in (6.12), the first sum in (7.3) is $p^(sans(T)) e$. Test with $hat(C)_k G$. The residual estimates control the left side and the last term by $C lr(bar.v.double  bar.v.double) G_(*)$; the middle term is bounded by (7.5) and Cauchy–Schwarz, since $0 lt.eq hat(C)_k lt.eq C_k$. Thus
  $ \| bb(E) \[ hat(C)_k G \( m^k - t_(*) \)^(sans(T)) e \] \| lt.eq C lr(bar.v.double  bar.v.double) G_(*) . $
  Summing Lemma 20 with the constant target $e$ over $l = 1 \, dots.h \, k$ gives the same bound for $bb(E) \[ hat(C)_k G \( x - m^k \)^(sans(T)) e \]$. Sum over $k$. The deficit has contribution at most
  $ 2 sqrt(n) thin lr(bar.v.double  bar.v.double) G_(L^2 \( mu_(h_0) \)) bb(P)_(mu_(h_0)) \( D > 0 \)^(1 \/ 2) lt.eq C lr(bar.v.double  bar.v.double) G_(*) . $
  Thus $\| bb(E) \[ G \( x - t_(*) \)^(sans(T)) e \] \| lt.eq C lr(bar.v.double  bar.v.double) G_(*)$ uniformly over $lr(bar.v.double  bar.v.double) e lt.eq 1$. Centering $G$ and taking the supremum over this seed class gives (7.2). The uncentered estimate also records the ordinary-mean consequence: take $G = 1$ to obtain $lr(bar.v.double bb(E)_(mu_(h_0)) x - t_(*) bar.v.double) lt.eq C$. This norm is the unnormalized Euclidean norm. It compares the mean itself with $t_(*)$; no approximation of the derivative of the mean map is used here. The local construction required $n$ above a fixed threshold. In the remaining dimensions, the elementary bounds $lr(bar.v.double "Cov" \( G \, x \) bar.v.double)^2 lt.eq n "Var" \( G \)$ and $lr(bar.v.double bb(E)_(mu_(h_0)) x - t_(*) bar.v.double) lt.eq 2 sqrt(n)$ extend both conclusions after enlarging $C$. ◻
]

=== 7.3 Means under square reweighting <means-under-square-reweighting>

For the change of observation law we need a different estimate, valid for arbitrary square densities. It uses only ordinary recipes and trades a small fixed leading error for a constant depending on that tolerance.

#thm([Proposition 7.3.])[
  #emph[For every sufficiently small fixed $delta > 0$, there is a constant $C_delta$ such that, for $N = bb(E)_(mu_(h_0)) f^2 > 0$ and $nu = f^2 mu_(h_0) \/ N$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ lr(bar.v.double bb(E)_nu x - t_(*) bar.v.double) / sqrt(n) lt.eq C delta + C_delta / sqrt(n) (1 + frac(cal(D)_(h_0) \( f \), N)) . $ <eq:weighted-mean>]

 The leading constant $C$ is independent of $delta$ and of the selection depth. This estimate requires only ordinary word diagnostics, of a fixed length that may depend on $delta$.]
] <prop:weighted-mean>

#proof[
  Select the cutoffs with a fixed threshold $rho lt.eq delta$ small enough for Lemma 15. On each cutoff support, the residual-to-root comparison gives
  $ lr(bar.v.double m^k - t_(*) bar.v.double) lt.eq C delta sqrt(n) . $
  Here the constant comes from the recurrence and the inverse bound in Lemma 15, and is independent of $k$. For $lr(bar.v.double  bar.v.double) e lt.eq 1$, sum the square-density version of Lemma 20 with target $e$ through $k$, using multiplier $hat(C)_k$. After division by $N$, this bounds
  $ \| bb(E)_nu \[ hat(C)_k \( x - m^k \)^(sans(T)) e \] \| lt.eq C_delta (1 + frac(cal(D)_(h_0) \( f \), N)) . $
  The cutoff weights sum to at most one, so all root-comparison terms together cost at most $C delta sqrt(n)$. The leftover mass contributes at most $2 sqrt(n) bb(P)_nu \( D > 0 \)$, which is controlled by the second part of Lemma 22. Add the terms, divide by $sqrt(n)$, and take the supremum over $e$ to obtain (7.6). The leading $C$ comes from root stability; only $C_delta$ and the finite diagnostic length depend on the selected tolerance. Any dimensions below a fixed threshold required by this construction are covered by the elementary bound $lr(bar.v.double bb(E)_nu x - t_(*) bar.v.double) \/ sqrt(n) lt.eq 2$ after increasing $C_delta$; this leaves the leading constant unchanged. The argument has used no implicit test vector. ◻
]

== 8 The spectral gap at a large observation time <sec:terminal>

We complete the observation argument by proving a gap after a sufficiently large fixed observation time. The deterministic two-spin curvature estimate is uniform over external fields. The final probabilistic statement instead concerns the specified observation law, at fixed $j < 1$. We adapt the signed two-spin method of Wang [23] Lemma 3.4, retaining the signed first-order interaction and estimating the remaining terms by an entrywise-square matrix and a quartic row error. The complete calculation below proves the precise variant used here.

For a symmetric matrix $J$ with zero diagonal, define the symmetric matrices

$ U_(i j) = tanh J_(i j) \, #h(2em) Q_(i j) = U_(i j)^2 \, #h(2em) r_4 \( U \) = max_i sum_j U_(i j)^4 . $

In particular, $U_(i i) = Q_(i i) = 0$. The square defining $Q$ is entrywise. At a field $h_0$, put

$ H f = sum_i \( I - P_i \) f = sum_i \( x_i - m_i^1 \) d_i f \, #h(2em) g_i = d_i f \, #h(2em) a_i = v_i^1 g_i . $

Each $P_i$ is an orthogonal projection in $L^2 \( mu_(h_0) \)$, and therefore $H$ is self-adjoint and positive, with

#[#set math.equation(numbering: n => "(8.1)")
 $ bb(E)_(mu_(h_0)) \[ f H f \] = cal(D)_(h_0) \( f \) . $ <eq:terminal-generator-form>]

#thm([Lemma 8.1.])[
  (Signed curvature inequality).  #emph[There are universal constants $u_0 > 0$ and $C < oo$ such that, for every $n$, every symmetric zero-diagonal $J$ satisfying $max_(i \, j) \| U_(i j) \| lt.eq u_0$, every $h_0 in bb(R)^n$, and every real function $f$ on the discrete cube, 
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(E)_(mu_(h_0)) \[ \( H f \)^2 \] gt.eq \( 1 - C r_4 \( U \) \) cal(D)_(h_0) \( f \) - bb(E)_(mu_(h_0)) #scale(x: 120%, y: 120%)[\[] a^(sans(T)) U a + C \| a \|^(sans(T)) Q \| a \| #scale(x: 120%, y: 120%)[\]] . $ <eq:terminal-curvature>]

 Here $\| a \|$ denotes coordinatewise absolute value.]
] <lem:curvature>

#proof[
  The curvature bound is obtained by summing an exact two-spin calculation. Fix $i eq.not j$, condition on the other spins, and call the remaining spins $x \, y$. Their conditional density is proportional to $exp \( alpha x + gamma y + J_(i j) x y \)$. Introduce the scalar parameters
  $ a = tanh alpha \, quad b = tanh gamma \, quad A = 1 - a^2 \, quad B = 1 - b^2 \, quad u = tanh J_(i j) . $
  The letters $a \, b \, A \, B$ have these scalar meanings only during the pair calculation. Use $bb(E)_0$ for the product law of means $a \, b$, and $bb(E)_(i j)$ for the interacting conditional law. The identity $e^(J_(i j) x y) = cosh \( J_(i j) \) \( 1 + u x y \)$ gives their exact density ratio:
  #[#set math.equation(numbering: n => "(8.3)")
   $ frac(upright(d) mu_(i j), upright(d) mu_(0 \, i j)) \( x \, y \) = frac(1 + u x y, 1 + u a b) . $ <eq:pair-density>]
  Expand $f$ in the four-dimensional space of functions of $x \, y$. Its two gradients then have the unique representation
  $ g_i = p + r \( y - b \) \, #h(2em) g_j = s + r \( x - a \) $
  with real $p \, s \, r$. The shared coefficient $r$ is the mixed-spin term of this expansion. The conditional means and variances satisfy
  #[#set math.equation(numbering: n => "(8.4)")
   $ x - m_i^1 & = frac(\( x - a \) \( 1 - u x y \), 1 + u a y) \, & v_i^1 & = frac(A \( 1 - u^2 \), \( 1 + u a y \)^2) \,\
y - m_j^1 & = frac(\( y - b \) \( 1 - u x y \), 1 + u b x) \, & v_j^1 & = frac(B \( 1 - u^2 \), \( 1 + u b x \)^2) . $ <eq:pair-conditional-identities>]
  For a function $F$ of one spin, write $F \( z \) = overline(F) + z thin d F$, and set
  $ F_1 \( y \) = frac(g_i \( y \), 1 + u a y) \, #h(2em) F_2 \( x \) = frac(g_j \( x \), 1 + u b x) . $
  The identity $\( 1 - u x y \)^2 \( 1 + u x y \) = \( 1 - u^2 \) \( 1 - u x y \)$ and independence under $bb(E)_0$ give the following exact expression for the cross term:
  #[#set math.equation(numbering: n => "(8.5)")
   $ frac(bb(E)_(i j) \[ \( x - m_i^1 \) g_i thin \( y - m_j^1 \) g_j \], A B) = frac(1 - u^2, 1 + u a b) #scale(x: 120%, y: 120%)[\(] d F_1 d F_2 - u overline(F)_1 overline(F)_2 #scale(x: 120%, y: 120%)[\)] . $ <eq:pair-cross-exact>]
  Both terms follow from the one-spin identities $bb(E)_0 \[ \( x - a \) F_2 \( x \) \] = A thin d F_2$ and $bb(E)_0 \[ \( x - a \) x F_2 \( x \) \] = A overline(F)_2$, together with their $y$ counterparts. Thus the cross term has been reduced to four scalar coefficients.
  The four coefficients appearing here are
  $ d F_1 & = frac(r \( 1 + u a b \) - u a p, 1 - u^2 a^2) \, & overline(F)_1 & = frac(p - \( b + u a \) r, 1 - u^2 a^2) \,\
d F_2 & = frac(r \( 1 + u a b \) - u b s, 1 - u^2 b^2) \, & overline(F)_2 & = frac(s - \( a + u b \) r, 1 - u^2 b^2) . $
  Consequently the right-hand side of (8.5) is
  #[#set math.equation(numbering: n => "(8.6)")
   $ K #scale(x: 120%, y: 120%)[\[] \( - u + u^2 a b \) p s + u^2 b A thin r p + u^2 a B thin r s + R r^2 #scale(x: 120%, y: 120%)[\]] \, $ <eq:pair-cross-coefficients>]
  where
  $ K & = frac(1 - u^2, \( 1 + u a b \) \( 1 - u^2 a^2 \) \( 1 - u^2 b^2 \)) \,\
R & = \( 1 + u a b \)^2 - u \( b + u a \) \( a + u b \)\
 & = 1 + u a b + u^2 \( a^2 b^2 - a^2 - b^2 \) - u^3 a b . $
  The mixed coefficients $r p$ and $r s$ begin at order $u^2$: their first-order terms have canceled. Keeping this cancellation is what will leave only a quartic row cost after Young’s inequality.
  For $\| u \| lt.eq 1 \/ 4$ and $\| a \| \, \| b \| lt.eq 1$, all denominators above are bounded away from zero. There is thus a universal constant $C_1$ such that
  $ \| K - 1 \| + \| R - 1 \| lt.eq C_1 \| u \| . $
  Consequently the $p s$ coefficient in (8.6) is $- u + O \( u^2 \)$, both mixed coefficients are $O \( u^2 \)$, and the $r^2$ coefficient is $1 + O \( \| u \| \)$. These constants are uniform in the conditional means $a \, b$: all the displayed rational functions and their required derivatives are bounded on the compact parameter range.
  Return temporarily to the notation $a_i = v_i^1 g_i$ and $a_j = v_j^1 g_j$ for the two gradient weights. Equations (8.3) and (8.4) imply
  #[#set math.equation(numbering: n => "(8.7)")
   $ frac(bb(E)_(i j) \[ a_i a_j \], A B) = bb(E)_0 #scale(x: 120%, y: 120%)[\[] w_u \( x \, y \) g_i \( y \) g_j \( x \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) w_u \( x \, y \) = frac(\( 1 - u^2 \)^2 \( 1 + u x y \), \( 1 + u a b \) \( 1 + u a y \)^2 \( 1 + u b x \)^2) . $ <eq:pair-gradient-product>]
  Uniformly in $a \, b \, x \, y$, one has
  $ c_1 lt.eq w_u \( x \, y \) lt.eq C_2 \, #h(2em) \| w_u \( x \, y \) - 1 \| lt.eq C_2 \| u \| #h(2em) \( \| u \| lt.eq 1 \/ 4 \) $
  for universal positive constants $c_1 \, C_2$. Expanding $g_i \( y \) g_j \( x \)$ and using that the centered factors have zero product-law mean gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ frac(bb(E)_(i j) \[ a_i a_j \], A B) = p s + e_0 p s + e_1 r p + e_2 r s + e_3 r^2 \, #h(2em) \| e_ell \| lt.eq C_3 \| u \| . $ <eq:pair-gradient-coefficients>]
  To obtain the four error bounds, expand the product into its $p s$, $r p$, $r s$, and $r^2$ terms. Each centered spin is bounded by two, and the uniform estimate for $w_u - 1$ controls every resulting coefficient.
  Adding $u$ times (8.8) to (8.6), and decreasing the universal $u_0 > 0$ if necessary, yields
  $ & frac(bb(E)_(i j) \[ \( x - m_i^1 \) g_i thin \( y - m_j^1 \) g_j \] + u bb(E)_(i j) \[ a_i a_j \], A B)\
 & #h(15mm)  gt.eq 1 / 2 r^2 - C_4 u^2 \| p s \| - C_4 u^2 \| r \| \( \| p \| + \| s \| \)\
 & #h(15mm)  gt.eq - C_5 u^2 \| p s \| - C_5 u^4 \( p^2 + s^2 \) . $
  The last inequality is Young’s inequality, absorbing the mixed terms into $r^2 \/ 2$.
  We must now express the two scalar costs in the heat-bath weights that can be summed over pairs. The lower bound for $w_u$ in (8.7), followed by product independence, gives
  $ bb(E)_(i j) \| a_i a_j \| & gt.eq c_1 A B thin bb(E)_0 \| g_i \( y \) g_j \( x \) \|\
 & = c_1 A B thin bb(E)_0 \| g_i \( y \) \| thin bb(E)_0 \| g_j \( x \) \| gt.eq c_1 A B \| p s \| . $
  Similarly, the density in (8.3) and the ratios $v_i^1 \/ A$, $v_j^1 \/ B$ are bounded above and below by universal positive constants for $\| u \| lt.eq u_0$. Hence
  $ bb(E)_(i j) \[ v_i^1 g_i^2 \] gt.eq c_2 A bb(E)_0 g_i^2 gt.eq c_2 A p^2 gt.eq c_2 A B p^2 \, #h(2em) bb(E)_(i j) \[ v_j^1 g_j^2 \] gt.eq c_2 A B s^2 . $
  The comparison constants do not deteriorate when a conditional variance $A$ or $B$ is small. Substituting these bounds into the preceding scalar inequality proves the pair estimate
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(E)_(i j) \[ \( x - m_i^1 \) g_i thin \( y - m_j^1 \) g_j \] gt.eq  & - u bb(E)_(i j) \[ a_i a_j \] - C_6 u^2 bb(E)_(i j) \| a_i a_j \|\
 & - C_6 u^4 bb(E)_(i j) \[ v_i^1 g_i^2 + v_j^1 g_j^2 \] . $ <eq:terminal-pair-bound>]
  To assemble the curvature form, first condition on all but spin $i$ in the diagonal term of $bb(E) \( H f \)^2$. Their sum is $sum_i bb(E) \[ v_i^1 g_i^2 \] = cal(D)_(h_0) \( f \)$. Next average (8.9) over the outside spins and sum over ordered pairs $i eq.not j$. The signed and absolute pair costs become the two quadratic forms in (8.2). The quartic cost is bounded by
  $ 2 C_6 thin r_4 \( U \) sum_i bb(E) \[ v_i^1 g_i^2 \] . $
  Increasing $C$ proves the lemma. ◻
]

The curvature inequality is useful when the few coordinates with appreciable conditional variance occupy a small principal submatrix. Bandeira, El Alaoui, and Rödder [5] Theorem 1.1 combine uniform bounds on small principal submatrices with a sufficiently large constant field to prove polynomial mixing. Here the matrix bounds enter the signed curvature form directly. We next obtain matrix control uniform over every such coordinate set; the set will later depend on the spin configuration.

#thm([Lemma 8.2.])[
  (Small principal submatrices).  #emph[Fix $j in \( 0 \, 1 \)$. There is a finite constant $M$, depending only on $j$, with the following property. For every $epsilon > 0$ there is $alpha in \( 0 \, 1 \/ 2 \)$ such that, with probability tending to one over $J$, 
#[#set math.equation(numbering: n => "(8.10)")
 $ max_(i \, j) \| J_(i j) \| lt.eq n^(- 1 \/ 4) \, #h(2em) parallel J parallel \, parallel U parallel \, parallel Q parallel lt.eq M \, #h(2em) r_4 \( U \) lt.eq M n^(- 1 \/ 2) \,\
parallel U_(S S) parallel lt.eq epsilon \, #h(2em) parallel Q_(S S) parallel lt.eq epsilon quad upright("for every ") S subset.eq { 1 \, dots.h \, n } upright(" with ") \| S \| lt.eq alpha n . $ <eq:terminal-global-matrix>]

 The same $M$ works for all $epsilon$.]
] <lem:terminal-matrices>

#proof[
  For any deterministic unit vector $z$, the centered Gaussian variable $z^(sans(T)) J z$ has variance
  $ frac(4 j, n) sum_(i < k) z_i^2 z_k^2 lt.eq frac(2 j, n) . $
  Thus
  #[#set math.equation(numbering: n => "(8.11)")
   $ bb(P) { \| z^(sans(T)) J z \| > t } lt.eq 2 exp { - n t^2 \/ \( 4 j \) } . $ <eq:terminal-quadratic-tail>]
  To pass from fixed quadratic forms to norms, choose a $1 \/ 4$-net of the unit sphere in $bb(R)^k$ with at most $9^k$ points. Every symmetric $k times k$ matrix $B$ then satisfies
  $ parallel B parallel lt.eq 2 max_(z upright(" in the net")) \| z^(sans(T)) B z \| \; $
  to see this, approximate a unit vector maximizing the absolute quadratic form and bound the change by $2 parallel B parallel \/ 4$. Taking $k = n$ in (8.11) proves $parallel J parallel lt.eq M_0$ with probability at least $1 - e^(- c n)$ for a sufficiently large constant $M_0 = M_0 \( j \)$.
  For a fixed row $i$ and a fixed set $S$ of at most $k$ indices, Gaussian independence within that row gives
  #[#set math.equation(numbering: n => "(8.12)")
   $ bb(P) {sum_(ell in S) J_(i ell)^2 > t} lt.eq exp {- frac(n t, 4 j) + k / 2 log 2} . $ <eq:terminal-row-tail>]
  Use exponential Markov with parameter $n \/ \( 4 j \)$ to obtain this estimate: each nonzero Gaussian square contributes the factor $sqrt(2)$ to the moment generating function. Choosing the full index set and taking a union bound over rows bounds every row square sum by a fixed $M_1 = M_1 \( j \)$, with failure at most $e^(- c n)$. Separately, the Gaussian entry tail and a union bound give
  $ bb(P) { max_(i \, ell) \| J_(i ell) \| > n^(- 1 \/ 4) } lt.eq 2 n^2 exp { - sqrt(n) \/ \( 2 j \) } = o \( 1 \) . $
  Since $\| tanh z \| lt.eq \| z \|$, these bounds imply $parallel Q parallel lt.eq M_1$ and $r_4 \( U \) lt.eq M_1 n^(- 1 \/ 2)$, using the maximal absolute row-sum bound for the operator norm of a symmetric matrix. Moreover,
  $ \| tanh z - z \| lt.eq \| z \|^3 \/ 3 \, #h(2em) parallel U - J parallel lt.eq 1 / 3 max_i sum_ell \| J_(i ell) \|^3 lt.eq M_1 / 3 n^(- 1 \/ 4) . $
  The scalar inequality follows by integrating $\| 1 - "sech"^2 z \| = tanh^2 z lt.eq z^2$. This proves (8.10), with a fixed $M$.
  The global bounds have fixed $M$; we now select the small-set fraction $alpha$. Put $k = floor.l alpha n floor.r$. Bounding sets of size exactly $k$ suffices, because a smaller set can be enlarged and restriction cannot increase a principal-submatrix norm. The $binom(n, k)$ possible sets have logarithmic count at most $n frak(h) \( k \/ n \)$, where
  $ frak(h) \( t \) = - t log t - \( 1 - t \) log \( 1 - t \) \, $
  and $frak(h) \( t \) arrow.r 0$ as $t arrow.b 0$. Applying the sphere-net argument on each support and using (8.11) gives
  $ bb(P) {max_(\| S \| = k) parallel J_(S S) parallel > epsilon \/ 2} lt.eq 2 binom(n, k) 9^k exp { - n epsilon^2 \/ \( 64 j \) } . $
  Choose $alpha > 0$ sufficiently small that this tends to zero exponentially in $n$. Then $parallel U - J parallel = o \( 1 \)$ proves the assertion for $U$.
  Finally, (8.12), with $t = epsilon$, and a union bound over all rows and all $k$-element sets give
  $ bb(P) {max_i max_(\| S \| = k) sum_(ell in S) J_(i ell)^2 > epsilon} lt.eq n binom(n, k) exp {- frac(n epsilon, 4 j) + k / 2 log 2} . $
  Decreasing $alpha$ further makes this probability exponentially small. On its complement, the maximal row sum of every $Q_(S S)$ is at most $epsilon$, which proves the remaining assertion. ◻
]

We apply these matrix bounds to a noisy observation. The following statement allows any initial spin law, with the interaction still drawn at a fixed $j in \( 0 \, 1 \)$; the exceptional probability concerns the observation at that fixed matrix.

#thm([Proposition 8.3.])[
  (Terminal observation gap).  #emph[Fix $j in \( 0 \, 1 \)$. There are finite $T > 0$, $c > 0$, and events $cal(E)_n^(upright("term"))$ depending only on $J$, with $bb(P)_J \( cal(E)_n^(upright("term")) \) arrow.r 1$, such that the following holds for every sufficiently large $n$ and every $J in cal(E)_n^(upright("term"))$. Let $X$ have any probability law on ${ - 1 \, 1 }^n$, possibly depending on $J$, and let $Z$ be an independent standard Gaussian vector. Set $Y = T X + sqrt(T) thin Z$. Then, conditionally on $J$, except on an event of probability at most $e^(- c n)$, the inequality 
#[#set math.equation(numbering: n => "(8.13)")
 $ "Var"_(mu_Y) \( f \) lt.eq 2 cal(D)_Y \( f \) $ <eq:terminal-poincare>]

 holds simultaneously for every real function $f$ on the cube. All constants and matrix events are independent of the law of $X$.]
] <prop:terminal-gap>

#proof[
  Choose the tolerances in the order needed to absorb the curvature costs. Let $C$ be the constant in Lemma 25, and choose $epsilon > 0$ with $\( 1 + C \) epsilon lt.eq 1 \/ 8$. Lemma 26 supplies $alpha$ and the fixed global bound $M$. Finally choose the fixed observation time $T$ large enough that
  #[#set math.equation(numbering: n => "(8.14)")
   $ frac(16 M^2, T^2) lt.eq alpha / 2 \, #h(2em) \( 1 + C \) M #scale(x: 120%, y: 120%)[\(] 2 "sech" \( T \/ 4 \) + "sech"^2 \( T \/ 4 \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 8 \, #h(2em) e^(- T \/ 8) lt.eq frac(alpha, 4 \( e - 1 \)) . $ <eq:terminal-T-choice>]
  Let $cal(E)_n^(upright("term"))$ be the events supplied by that lemma. For all sufficiently large $n$, their bounds also ensure $max \| U_(i j) \| lt.eq u_0$ and $C r_4 \( U \) lt.eq 1 \/ 8$.
  First count coordinates whose observation field remains small. Given $X$, the indicators $upright(bold(1))_({ \| Y_i \| < T \/ 2 })$ are independent; symmetry of the Gaussian noise gives the same success probability $p_T$ for either sign of $X_i$. The Gaussian tail bound yields
  $ p_T = bb(P) { \| T + sqrt(T) Z_1 \| < T \/ 2 } lt.eq bb(P) { Z_1 < - sqrt(T) \/ 2 } lt.eq e^(- T \/ 8) . $
  For $B_Y = \# { i : \| Y_i \| < T \/ 2 }$, exponential Markov inequality yields
  $ bb(P) { B_Y > alpha n \/ 2 divides X \, J } lt.eq e^(- alpha n \/ 2) \( 1 + p_T \( e - 1 \) \)^n lt.eq e^(- alpha n \/ 4) . $
  The same bound holds after averaging over $X$.
  Suppose now that $B_Y lt.eq alpha n \/ 2$. For every spin configuration $x$, $parallel J x parallel^2 lt.eq M^2 n$, and consequently
  $ \# { i : \| \( J x \)_i \| > T \/ 4 } lt.eq frac(16 M^2 n, T^2) lt.eq alpha / 2 n . $
  It follows, simultaneously for all $x$, that
  #[#set math.equation(numbering: n => "(8.15)")
   $ S \( x \) = { i : \| Y_i + \( J x \)_i \| < T \/ 4 } quad upright("satisfies") quad \| S \( x \) \| lt.eq alpha n . $ <eq:terminal-small-field-set>]
  At this fixed field $Y$, set $q_f \( x \) = sum_i v_i^1 \( x \) g_i \( x \)^2$ and $eta = "sech"^2 \( T \/ 4 \)$. Since $0 < v_i^1 lt.eq 1$, one has pointwise
  $ parallel a parallel^2 lt.eq q_f \( x \) \, #h(2em) parallel a_(S \( x \)^c) parallel^2 lt.eq eta q_f \( x \) . $
  We may now use $S \( x \)$ even though it depends on the configuration, because (8.10) holds for every small set on one matrix event. Split the quadratic form between $S \( x \)$ and its complement. The small-set bound handles its first block, and the global norm handles the cross and complementary terms, giving
  $ a^(sans(T)) U a lt.eq #scale(x: 120%, y: 120%)[\[] epsilon + M \( 2 sqrt(eta) + eta \) #scale(x: 120%, y: 120%)[\]] q_f \( x \) . $
  The identical argument, with $\| a \|$ and $Q$, gives the same upper bound for $\| a \|^(sans(T)) Q \| a \|$. Lemma 25 and (8.14) therefore imply
  $ bb(E)_(mu_Y) \[ \( H f \)^2 \] & gt.eq [1 - C r_4 \( U \) - \( 1 + C \) { epsilon + M \( 2 sqrt(eta) + eta \) }] cal(D)_Y \( f \)\
 & gt.eq 1 / 2 cal(D)_Y \( f \) . $
  It remains to translate curvature into a gap. The kernel of the self-adjoint operator $H$ contains exactly the constants: vanishing $bb(E) \[ f H f \]$ forces every one-spin conditional variance to vanish, and the strict positivity of the Gibbs law propagates equality across every cube edge. For an eigenfunction with positive eigenvalue $lambda$, the curvature estimate and (8.1) imply $lambda^2 gt.eq lambda \/ 2$, hence $lambda gt.eq 1 \/ 2$. Expand in an orthonormal eigenbasis to obtain (8.13). The observation failure bound was $e^(- alpha n \/ 4)$, uniformly in the initial spin law, so we may set $c = alpha \/ 4$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[A.~Adhikari, C.~Brennecke, C.~Xu, and H.-T.~Yau, #emph[Spectral gap estimates for mixed $p$-spin models at high temperature], Probability Theory and Related Fields #strong[189] (2024), nos.~3--4, 879--907. #link("https://doi.org/10.1007/s00440-024-01261-9")[doi:10.1007/s00440-024-01261-9].]
#bibitem([2])[M.~Aizenman, J.~L.~Lebowitz, and D.~Ruelle, #emph[Some rigorous results on the Sherrington--Kirkpatrick spin glass model], Communications in Mathematical Physics #strong[112] (1987), 3--20. #link("https://doi.org/10.1007/BF01217677")[doi:10.1007/BF01217677].]
#bibitem([3])[N.~Anari, V.~Jain, F.~Koehler, H.~T.~Pham, and T.-D.~Vuong, #emph[Entropic independence: optimal mixing of down-up random walks], Proceedings of the 54th Annual ACM SIGACT Symposium on Theory of Computing (STOC 2022), 1418--1430. #link("https://doi.org/10.1145/3519935.3520048")[doi:10.1145/3519935.3520048]. Full Ising proof: #link("https://arxiv.org/abs/2106.04105v2")[arXiv:2106.04105v2].]
#bibitem([4])[N.~Anari, F.~Koehler, and T.-D.~Vuong, #emph[Trickle-down in localization schemes and applications], Proceedings of the 56th Annual ACM Symposium on Theory of Computing (STOC 2024), 1094--1105. #link("https://doi.org/10.1145/3618260.3649622")[doi:10.1145/3618260.3649622].]
#bibitem([5])[A.~S.~Bandeira, A.~El Alaoui, and A.~Rödder, #emph[Mixing of Glauber Dynamics on High Overlap Gibbs Measures], #link("https://arxiv.org/abs/2607.06813v1")[arXiv:2607.06813v1], July 7, 2026.]
#bibitem([6])[R.~Bauerschmidt and T.~Bodineau, #emph[A very simple proof of the LSI for high temperature spin systems], Journal of Functional Analysis #strong[276] (2019), no.~8, 2582--2588. #link("https://doi.org/10.1016/j.jfa.2019.01.007")[doi:10.1016/j.jfa.2019.01.007].]
#bibitem([7])[M.~Boban, A.~Li, and S.~Oveis Gharan, #emph[Rank-1-perturbed trickledown theorems: Mixing time of Glauber dynamics for the Sherrington--Kirkpatrick model up to $beta lt.eq 1 / 2 + epsilon$], #link("https://arxiv.org/abs/2609.13138v1")[arXiv:2609.13138v1], September 11, 2026.]
#bibitem([8])[E.~Bolthausen, #emph[An iterative construction of solutions of the TAP equations for the Sherrington--Kirkpatrick model], Communications in Mathematical Physics #strong[325] (2014), no.~1, 333--366. #link("https://doi.org/10.1007/s00220-013-1862-3")[doi:10.1007/s00220-013-1862-3].]
#bibitem([9])[C.~Brennecke, A.~Schertzer, C.~Xu, and H.-T.~Yau, #emph[The two point function of the SK model without external field at high temperature], Probability and Mathematical Physics #strong[5] (2024), 131--175. #link("https://doi.org/10.2140/pmp.2024.5.131")[doi:10.2140/pmp.2024.5.131].]
#bibitem([10])[M.~Celentano, #emph[Sudakov--Fernique post-AMP, and a new proof of the local convexity of the TAP free energy], Annals of Probability #strong[52] (2024), no.~3, 923--954. #link("https://doi.org/10.1214/23-AOP1675")[doi:10.1214/23-AOP1675].]
#bibitem([11])[Y.~Chen and R.~Eldan, #emph[Localization schemes: A framework for proving mixing bounds for Markov chains], Duke Mathematical Journal #strong[174] (2025), no.~8, 1431--1510. #link("https://doi.org/10.1215/00127094-2024-0063")[doi:`10.1215/00127094-2024-0063`]. Preprint: #link("https://arxiv.org/abs/2203.04163v2")[arXiv:2203.04163v2].]
#bibitem([12])[A.~El Alaoui and J.~Gaitonde, #emph[Bounds on the covariance matrix of the Sherrington--Kirkpatrick model], #link("https://arxiv.org/abs/2212.02445v3")[arXiv:2212.02445v3], November 12, 2024.]
#bibitem([13])[A.~El Alaoui and A.~Montanari, #emph[An information-theoretic view of stochastic localization], #link("https://arxiv.org/abs/2109.00709v2")[arXiv:2109.00709v2], September 9, 2021.]
#bibitem([14])[A.~El Alaoui, A.~Montanari, and M.~Sellke, #emph[Sampling from the Sherrington--Kirkpatrick Gibbs measure via algorithmic stochastic localization], Proceedings of the 63rd IEEE Annual Symposium on Foundations of Computer Science (FOCS 2022), 323--334. Full version: #link("https://arxiv.org/abs/2203.05093v2")[arXiv:2203.05093v2].]
#bibitem([15])[R.~Eldan, #emph[Thin shell implies spectral gap up to polylog via a stochastic localization scheme], Geometric and Functional Analysis #strong[23] (2013), no.~2, 532--569. #link("https://doi.org/10.1007/s00039-013-0214-y")[doi:10.1007/s00039-013-0214-y].]
#bibitem([16])[R.~Eldan, F.~Koehler, and O.~Zeitouni, #emph[A spectral condition for spectral gap: fast mixing in high-temperature Ising models], Probability Theory and Related Fields #strong[182] (2022), nos.~3--4, 1035--1051. #link("https://doi.org/10.1007/s00440-021-01085-x")[doi:10.1007/s00440-021-01085-x].]
#bibitem([17])[R.~J.~Glauber, #emph[Time-dependent statistics of the Ising model], Journal of Mathematical Physics #strong[4] (1963), no.~2, 294--307. #link("https://doi.org/10.1063/1.1703954")[doi:10.1063/1.1703954].]
#bibitem([18])[J.~Lehec, #emph[Representation formula for the entropy and functional inequalities], Annales de l'Institut Henri Poincaré, Probabilités et Statistiques #strong[49] (2013), no.~3, 885--899. #link("https://doi.org/10.1214/11-AIHP464")[doi:10.1214/11-AIHP464].]
#bibitem([19])[D.~Sherrington and S.~Kirkpatrick, #emph[Solvable model of a spin-glass], Physical Review Letters #strong[35] (1975), no.~26, 1792--1796. #link("https://doi.org/10.1103/PhysRevLett.35.1792")[doi:10.1103/PhysRevLett.35.1792].]
#bibitem([20])[R.~Speicher, #emph[Combinatorial theory of the free product with amalgamation and operator-valued free probability theory], Memoirs of the American Mathematical Society #strong[132] (1998), no.~627. #link("https://doi.org/10.1090/memo/0627")[doi:10.1090/memo/0627].]
#bibitem([21])[D.~J.~Thouless, P.~W.~Anderson, and R.~G.~Palmer, #emph[Solution of 'Solvable model of a spin glass'], Philosophical Magazine #strong[35] (1977), no.~3, 593--601. #link("https://doi.org/10.1080/14786437708235992")[doi:10.1080/14786437708235992].]
#bibitem([22])[R.~A.~Vitale, #emph[Some comparisons for Gaussian processes], Proceedings of the American Mathematical Society #strong[128] (2000), no.~10, 3043--3046. #link("https://doi.org/10.1090/S0002-9939-00-05367-3")[doi:10.1090/S0002-9939-00-05367-3].]
#bibitem([23])[S. Wang, #emph[Optimal Mixing of Glauber Dynamics for the Sherrington--Kirkpatrick Model at $beta < 1 \/ 2$], #link("https://arxiv.org/abs/2608.22159v2")[arXiv:2608.22159v2], August 28, 2026.]
#bibitem([24])[L.~Wu, #emph[Poincaré and transportation inequalities for Gibbs measures under the Dobrushin uniqueness condition], Annals of Probability #strong[34] (2006), no.~5, 1960--1989. #link("https://doi.org/10.1214/009117906000000368")[doi:10.1214/009117906000000368].]


