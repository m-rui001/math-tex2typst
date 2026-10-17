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

#align(center)[#text(size: 16pt, weight: "bold")[Universality of critical quench autocorrelations \
in the Sherrington--Kirkpatrick model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A quench starts a spin system from a simple nonequilibrium law and then lets it evolve at a prescribed temperature. At the critical temperature of the Sherrington–Kirkpatrick model, the relevant relaxation time grows with the number of spins. We determine the two-time autocorrelation after a quench from independent symmetric spins. The limit retains the random spectral edge of the interaction matrix and is governed by the same diffusion as the stationary critical autocorrelation.

=== 1.1 The model and the result <the-model-and-the-result>

Let $D$ be either the standard Gaussian law or the uniform law on ${ - 1 \, 1 }$. For $n gt.eq 2$, let $J_(i j)$, $i < j$, be independent with law $D$, and put $J_(j i) = J_(i j)$, $J_(i i) = 0$. The critical zero-field Gibbs measure is

#[#set math.equation(numbering: n => "(1.1)")
 $ pi_(n \, J) \( sigma \) = Z_(n \, J)^(- 1) exp {n^(- 1 \/ 2) sum_(i < j) J_(i j) sigma_i sigma_j} \, #h(2em) sigma in { - 1 \, 1 }^n . $ <eq:gibbs>]

Every site has an independent rate-one clock. At a ring at site $i$, its spin is replaced by $a in { - 1 \, 1 }$ with conditional probability

$ frac(exp \( a h_i \( sigma \) \), 2 cosh h_i \( sigma \)) \, #h(2em) h_i \( sigma \) = n^(- 1 \/ 2) sum_(j eq.not i) J_(i j) sigma_j . $

Write $P_t^J$ for this heat-bath semigroup. Thus one unit of time contains $n$ updates on average. Let $nu_n$ be the uniform law on the cube, independent of $J$, and set $T_n = n^(2 \/ 3)$. The stationary and quench autocorrelations in critical units are, respectively,

#[#set math.equation(numbering: n => "(1.2)")
 $ A_(n \, J) \( t \) & = n^(- 2 \/ 3) sum_(i = 1)^n chevron.l sigma_i \, P_(t T_n)^J sigma_i chevron.r_(pi_(n \, J)) \, #h(2em) t > 0 \,\
B_(n \, J) \( s \, t \) & = n^(- 2 \/ 3) sum_(i = 1)^n bb(E)_(nu_n)^J \[ sigma_i \( s T_n \) sigma_i \( \( s + t \) T_n \) \] \, #h(2em) s \, t > 0 . $ <eq:finite-A>]

Thermal and clock randomness are averaged in these functions; the interaction $J$ remains random. The variable $s$ is the waiting time after the quench and $t$ is the subsequent lag.

We recall the edge data of the stationary theorem #cite(label("FUA")) Proposition 2.3, Proposition 5.1, and Theorem 6.8. Let $g = \( g_a \)_(a gt.eq 1)$ be the increasing upper GOE edge process, the joint limit in law of the leading coordinates: for each fixed $m$,

$ #scale(x: 120%, y: 120%)[\(] n^(2 \/ 3) \( 2 - lambda_a \) #scale(x: 120%, y: 120%)[\)]_(a = 1)^m med arrow.r.double med \( g_a \)_(a = 1)^m \, $

where $lambda_1 gt.eq lambda_2 gt.eq dots.h.c$ are the eigenvalues of a GOE matrix with off-diagonal variance $1 \/ n$ #cite(label("RamirezRiderVirag2011")) Theorem 1.1. For any $b + g_1 > 0$, put $ell_a = \( g_a + b \)^(- 1)$ and

#[#set math.equation(numbering: n => "(1.3)")
 $ D_g \( b \) = lim_(L arrow.r oo) {sqrt(L) - sum_(a gt.eq 1) (frac(1, g_a + b) - frac(1, g_a + L))} . $ <eq:edge-D-intro>]

The limit is in probability over $g$, with the almost-sure version chosen along a deterministic sequence as in the cited stationary theorem. If $Z_a$ are independent $N \( 0 \, ell_a \)$, their centered square sum converges. The continuous densities of this sum and its tails define

$ Pi_g = "Law" (\( Z_a \)_(a gt.eq 1) thin mid(bar.v) thin sum_(a gt.eq 1) \( Z_a^2 - ell_a \) = D_g \( b \)) . $

This measure is independent of the admissible $b$. The cylinder gradient form

$ cal(E)_g \( F \) = integral sum_(a gt.eq 1) \| partial_a F \|^2 thin thin upright(d) Pi_g $

is closable. Let $H_g$ be the nonnegative operator of its closure, and let $c_(*) > 0$ be the deterministic microscopic coefficient in #cite(label("FUA")) Theorem 6.8. We write

#[#set math.equation(numbering: n => "(1.4)")
 $ S_t^g = e^(- t c_(*) H_g) \, #h(2em) A_g \( t \) = sum_(a gt.eq 1) chevron.l x_a \, S_t^g x_a chevron.r_(Pi_g) \, quad t > 0 . $ <eq:edge-semigroup>]

The stationary theorem gives a Borel version of $A_g$ in $C_(upright("loc")) \( \( 0 \, oo \) \)$. Section 2 records the finite normalization and the stationary edge, static-coordinate, and relaxed-energy inputs.

For an open set $V subset bb(R)^d$, $C_(upright("loc")) \( V \)$ denotes the space of continuous functions with uniform convergence on every compact subset. Fix the countable family $ V$ of bounded smooth cylinder tests constructed in Section 5. It is dense in $L^2 \( Pi_g \)$ for each edge realization under consideration. We call a family $h_s^g in L^2 \( Pi_g \)$ measurable when $\( g \, s \) mapsto Pi_g \[ h_s^g phi.alt \]$ is measurable for each test $phi.alt in  V$. These pairings determine each density class.

#thm([Theorem 1.1.])[
  (Critical quench universality).  #emph[There is a measurable family $\( h_s^g \)_(s > 0)$, with $h_s^g in L^2 \( Pi_g \)$, such that for almost every $g$ the following properties hold.]
  + #emph[For every $s > 0$, $h_s^g gt.eq 0$ and $Pi_g \[ h_s^g \] = 1$. For $s \, t > 0$, 
$ h_(s + t)^g = S_t^g h_s^g . $

 Moreover, 
$ h_s^g Pi_g med arrow.r.double med delta_0 quad upright("in the product topology on ") bb(R)^(bb(N)) quad \( s arrow.b 0 \) \, #h(2em) parallel h_s^g - 1 parallel_(L^1 \( Pi_g \)) arrow.r 0 quad \( s arrow.r oo \) . $

]
  + #emph[The series 
#[#set math.equation(numbering: n => "(1.5)")
 $ B_g \( s \, t \) = sum_(a gt.eq 1) integral h_s^g \( x \) thin x_a thin \( S_t^g x_a \) \( x \) thin thin upright(d) Pi_g \( x \) $ <eq:limit-B>]

 converges locally uniformly on $\( 0 \, oo \)^2$ and defines a continuous function.]
  + #emph[For both choices of $D$, 
$ "Law"_D \( A_(n \, J) \, B_(n \, J) \) med arrow.r.double med "Law"_g \( A_g \, B_g \) $

 in $C_(upright("loc")) \( \( 0 \, oo \) \) times C_(upright("loc")) \( \( 0 \, oo \)^2 \)$. The two coupling laws have the same $g$, the same family $h^g$, and the same coefficient $c_(*)$.]
  + #emph[For every $0 < a < b < oo$, 
$ sup_(a lt.eq t lt.eq b) \| B_g \( s \, t \) - A_g \( t \) \| arrow.r 0 quad upright("in probability over ") g quad \( s arrow.r oo \) . $

]
  #emph[The positive-time density limits of the Gaussian dynamics with initial law $nu_n$ select this family, as made precise in Theorem 27. The normalization is exactly (1.2)–(1.2).]
] <thm:main>

The boundary $delta_0$ is interpreted in the product topology. At small times each fixed edge coordinate can vanish while the renormalized constraint is carried by coordinates whose indices tend to infinity. The proof identifies which such entrance is selected by the uniform starts through a stronger, quantitative condition on these coordinates.

=== 1.2 History and significance <history-and-significance>

Sherrington and Kirkpatrick introduced the infinite-range spin-glass model in 1975 #cite(label("SK1975")). The subsequent dynamical theory studied memory through two-time correlation and response functions. In particular, Sompolinsky and Zippelius developed a dynamical mean-field treatment for soft spins #cite(label("SompolinskyZippelius1982")), and Cugliandolo and Kurchan analyzed nonequilibrium relaxation after a quench in a soft-spin Langevin formulation #cite(label("CugliandoloKurchan1994")). Their asymptotic regime takes the system-size limit before the long-time limit and differs from the finite-size critical window considered here. For critical Ising heat-bath dynamics, Billoire and Campbell #cite(label("BilloireCampbell2011")) Equation (7) numerically tested the stationary finite-size form

$ q_c \( n \, t \) tilde.op n^(- 1 \/ 3) F \( t \/ n^(2 \/ 3) \) \, $

with time measured in updates per spin. Theorem 1 studies the two positive times following a uniform quench and identifies the law of the sample-dependent limiting function.

The spectral mechanism is especially transparent in spherical spin glasses. Kosterlitz, Thouless, and Jones #cite(label("KosterlitzThoulessJones1976")) analyzed the infinite-range Gaussian spherical spin glass using properties of large random matrices. Cugliandolo and Dean #cite(label("CugliandoloDean1995")) studied relaxation and aging for the spherical model, while Ben Arous, Dembo, and Guionnet #cite(label("BenArousDemboGuionnet2001")) proved limiting dynamical and aging results with a soft spherical constraint. Fyodorov, Perret, and Schehr #cite(label("FyodorovPerretSchehr2015")) later connected finite-size randomness on the $n^(2 \/ 3)$ scale to the edge in zero-temperature spherical dynamics. These works concern different spin spaces or temperature regimes; they explain why the critical edge should remain visible in a nonequilibrium limit.

The stationary critical Ising theorem #cite(label("FUA")) identifies the conditioned edge measure, its closed dynamical form, and the microscopic coefficient $c_(*)$. Its equilibrium comparison uses the conditional eigenframe averaging of Comets #cite(label("Comets1996")) Equations (2.1)–(2.2), which equates the Haar-averaged cube and spherical partition integrals when both use normalized reference measures and the same quadratic Hamiltonian, and the critical conditioned-Gaussian description of Du and Huang #cite(label("DuHuang2026FreeEnergy")) #cite(label("DuHuang2026Overlap")). Using the cap and spectral estimates of #cite(label("FUA")) #cite(label("CM")) #cite(label("CS")), Sections 3 and 4 extend cap control down to a tight lower threshold for $n p^3$ and derive warming uniformly over the initial law at each positive critical time. The order-$n$ entropy argument uses Lemma 19, which strengthens the square-density posterior-mean estimate of #cite(label("SG")) Proposition 7.3 to square-root dependence on the relative heat-bath energy. The stationary relaxed-energy theorem is applied within its polynomially bounded test class through bounded resolvent optimizers in Section 5.

=== 1.3 The argument <the-argument>

In the Gaussian model, adding an independent GOE diagonal changes the spin Hamiltonian only by a constant. Let $u_a$ be orthonormal eigenvectors of the completed matrix and put $x_a = n^(- 1 \/ 3) chevron.l u_a \, sigma chevron.r$. If $w_s$ is the Gibbs-relative density at time $s T_n$, orthogonality rewrites the quench correlation as

$ B_(n \, J) \( s \, t \) = sum_(a = 1)^n pi_(n \, J) \[ w_s thin x_a thin P_(t T_n)^J x_a \] . $

This formula separates the law reached after the quench from subsequent relaxation. The source identifies the relaxation operator for sufficiently controlled tests. Three further arguments are needed.

We first regularize the law reached after the quench. At scale $p$, a nested Gaussian observation gives noisy information about the spin projections onto modes with $2 - lambda_a lt.eq p^2$; conditioning caps those eigenvalues at $2 - p^2$. On the retained spectral events, their number is comparable to $k_p = n p^3$. Section 3 bounds the variance left unresolved for $0 lt.eq f lt.eq 1$ by $C p^(- 2)$ times the heat-bath energy plus $C e^(- c k_p^a)$, down to a fixed threshold for $k_p$ at each prescribed disorder confidence. In the small-entropy part of Section 4, a contradiction argument assumes that a bounded level test $f$ has less energy than the claimed profile bound. At a later scale $R$, this makes the normalized tilt by $f^2$ close to the normalized observation tilt by $F_R^2$, where $F_R = bb(E) \[ f divides h_R \]$. Following its entropy through earlier observations, together with the source path to a product posterior at higher entropy levels, yields entropy and kernel bounds at every fixed positive critical time, uniformly over the initial law.

For bounded cylinder sources, the finite Markov resolvent contraction bounds the optimizers used in the stationary relaxed-energy theorem. Section 5 derives strong semigroup convergence from that theorem and combines it with the warming bounds on densities and transition kernels. This produces positive-time families on represented Gaussian subsequences, evolving by $S_t^g$, which may initially retain randomness beyond $g$. To select one, choose a measurable admissible $b$ with $D_g \( b \) > 0$, put $r_i = g_i + b$, and define

$ M_g \( x \) = sum_i frac(x_i^2, 2 r_i) . $

We prove that $0 < M_g \( x \) < oo$ for $Pi_g$-almost every $x$ and therefore may define, on that full-measure set, the probability weights

$ p_i \( x \) = frac(x_i^2, 2 r_i M_g \( x \)) . $

For each represented Gaussian limit, the averaged uniform-start estimate yields a deterministic sequence $s_k arrow.b 0$ along which these weights leave every fixed finite set in probability under $h_(s_k) Pi_g$, almost surely in the represented data. Section 6 considers semigroup families whose densities are locally uniformly bounded in $L^oo \( Pi_g \)$ and satisfy such sequential escape. Angular ratios and a common rescaling give linear mode equations driven by independent Brownian motions with a common diffusion factor. The square constraint gives a scalar Volterra equation whose high-mode responses approach a common kernel. A stopped coupling proves fixed-$g$ uniqueness and the full $s arrow.b 0$ product-topology boundary. The proof then constructs the common family measurably from $g$.

Finally, we compare smooth functions of the stationary and quench traces under entry replacement #cite(label("Chatterjee2006")). An order-$k$ derivative with respect to the normalized interaction $J_(i j) \/ sqrt(n)$ is accompanied by $n^(- k \/ 2)$, while summing over entries contributes order $n^2$. The two coupling laws match through order three, so the averaged fourth derivative must gain a vanishing factor. Sections 7–9 first impose static overlap-tail estimates for every interaction matrix in a cutoff’s support. Under the associated normalized weighted path laws, these estimates yield history-overlap bounds with failure probability $O \( n^(- A) \)$ for any prescribed $A > 0$, after the cutoff parameters are chosen. Forward and reverse conditional estimates for endpoint-normalized likelihoods on a binary tree of transition intervals then control the derivatives over the full critical time span. The estimates also include derivatives of the cutoff weights. They transfer the joint trace laws and the probability of retaining the cutoffs to Rademacher disorder; smooth grid tests then transfer tightness in the locally uniform topology. Section 10 assembles the result.

== 2 The stationary edge input <sec:background>

We fix the finite normalization and record the stationary edge, static-comparison, and relaxed-energy inputs used below. Source cap estimates are stated at their points of use in Section 3; the following sections develop the extensions, entrance construction, and disorder comparison.

=== 2.1 The finite form and spectral coordinates <the-finite-form-and-spectral-coordinates>

Write $mu = pi_(n \, J)$. For a function $f$ on the cube let

$ D_i f \( sigma \) = frac(f \( sigma^(i \, +) \) - f \( sigma^(i \, -) \), 2) \, #h(2em) t_i \( sigma \) = tanh h_i \( sigma \) \, #h(2em) v_i \( sigma \) = 1 - t_i \( sigma \)^2 \, $

where $sigma^(i \, plus.minus)$ is obtained by setting spin $i$ to $plus.minus 1$. The nonnegative heat-bath operator and its symmetric form are

#[#set math.equation(numbering: n => "(2.1)")
 $ H_n = sum_(i = 1)^n \( sigma_i - t_i \) D_i \, #h(2em) cal(E) \( f \, k \) = mu [sum_(i = 1)^n v_i D_i f D_i k] \, #h(2em) P_t^J = e^(- t H_n) . $ <eq:finite-form>]

Indeed the summand of $H_n$ is $f - mu \[ f divides sigma_(- i) \]$. Conditional two-point covariance gives the displayed form. Thus (2.1) uses the rate-one clock at each site specified in the theorem. We write $cal(E) \( f \) = cal(E) \( f \, f \)$ and, for $z gt.eq 0$, $cal(I) \( z \) = cal(E) \( z \, log z \)$, with its extended nonnegative value at zeros.

Until the disorder comparison, $J$ is Gaussian. Put $W_(i j) = J_(i j) \/ sqrt(n)$ off the diagonal and add independent $W_(i i) tilde.op N \( 0 \, 2 \/ n \)$. The diagonal contributes a constant to $sigma^(sans(T)) W sigma \/ 2$, so neither $mu$ nor $H_n$ changes. After independent sign choices for the eigenvectors,

$ W = U "diag" \( lambda_1 \, dots.h \, lambda_n \) U^(sans(T)) \, #h(2em) lambda_1 gt.eq dots.h.c gt.eq lambda_n \, $

has $U$ Haar orthogonal conditionally on the eigenvalues. Denote its columns by $u_a$, and put

#[#set math.equation(numbering: n => "(2.2)")
 $ d_a = 2 - lambda_a \, #h(2em) g_(a \, n) = T_n d_a \, #h(2em) x_a \( sigma \) = n^(- 1 \/ 3) chevron.l u_a \, sigma chevron.r . $ <eq:finite-edge>]

We use the same $x_a$ for the coordinate functions on $bb(R)^(bb(N))$. For two spins, orthogonality gives the exact identity

#[#set math.equation(numbering: n => "(2.3)")
 $ n^(- 2 \/ 3) sigma dot.op sigma' = sum_(a = 1)^n x_a \( sigma \) x_a \( sigma' \) . $ <eq:replica-identity>]

In particular, if $w_s = d \( nu_n P_(s T_n)^J \) \/ d mu$, then

#[#set math.equation(numbering: n => "(2.4)")
 $ A_(n \, J) \( t \) = sum_(a = 1)^n mu \[ x_a P_(t T_n)^J x_a \] \, #h(2em) B_(n \, J) \( s \, t \) = sum_(a = 1)^n mu \[ w_s x_a P_(t T_n)^J x_a \] . $ <eq:finite-spectral-traces>]

=== 2.2 Conditioned measure and relaxed energy <conditioned-measure-and-relaxed-energy>

The following statements are the parts of the stationary manuscript that we use directly. They also specify the meaning of the conditional measure in the introduction. A smooth compact cylinder is a smooth function of finitely many coordinates, compactly supported in those coordinates.

#thm([Proposition 2.1.])[
  (Stationary inputs).  #emph[The following hold for the edge law and the Gaussian finite models.]
  + #emph[Let $b + g_1 > 0$, $ell_a = \( g_a + b \)^(- 1)$. Almost surely $sum_a ell_a = oo$ and $sum_a ell_a^2 < oo$. If $Z_a$ are independent $N \( 0 \, ell_a \)$, the densities $q$ of $sum_a \( Z_a^2 - ell_a \)$ and $q_m$ of $sum_(a > m) \( Z_a^2 - ell_a \)$ are continuous, bounded, and strictly positive. The first $m$ coordinates of $Pi_g$ have density 
#[#set math.equation(numbering: n => "(2.5)")
 $ frac(q_m #h(-0.16667em) (D_g \( b \) - sum_(a lt.eq m) \( x_a^2 - ell_a \)), q \( D_g \( b \) \)) product_(a lt.eq m) e^(- x_a^2 \/ \( 2 ell_a \)) / sqrt(2 pi ell_a) . $ <eq:edge-cylinder-density>]

 These consistent densities are measurable in $g$ and independent of $b$. For each fixed $0 lt.eq j < oo$, $Pi_g \[ \| x_a \|^j \] lt.eq C_(j \, g \, b) ell_a^(j \/ 2)$, with a finite constant uniform in $a$. For sufficiently large fixed $m$, the tail beyond $m$ has a density bounded by a finite constant relative to $⨂_(a > m) N \( 0 \, ell_a \)$. Conditional on that tail, the first $m$ coordinates have the Gaussian angular law on the sphere of squared radius 
$ D_g \( b \) + sum_(a lt.eq m) ell_a - sum_(a > m) \( x_a^2 - ell_a \) . $

 In particular the renormalized constraint holds $Pi_g$-almost surely. These are the statements of #cite(label("FUA")) Proposition 2.3.]
  + #emph[With $b_n = 1 + \( - g_(1 \, n) \)_(+)$ and $b = 1 + \( - g_1 \)_(+)$, the spherical and cube edge marginals converge jointly with the edge points to $Pi_g$ on the represented subsequences described below. Cube integrals converge for every continuous cylinder of polynomial growth. Spherical coordinates obey the uniform bounds 
$ mu^(upright("sp")) \[ \| x_a \|^j \] lt.eq C_j \( g_(a \, n) + b_n \)^(- j \/ 2) \, #h(2em) lim_(m arrow.r oo) sup_n sum_(a > m) \( g_(a \, n) + b_n \)^(- 2) = 0 $

 after discarding finitely many $n$ on such a representation. Here $mu^(upright("sp"))$ is surface measure on ${ \| sigma \|^2 = n }$, tilted by $exp \( sigma^(sans(T)) W sigma \/ 2 \)$. The sources are #cite(label("FUA")) Proposition 2.3 and Corollary 3.3.]
  + #emph[The Euclidean gradient on smooth compact cylinders is closable from $L^2 \( Pi_g \)$ to $L^2 \( Pi_g \; ell^2 \)$. The associated closed form has kernel equal to the constants. Every coordinate belongs to its domain and satisfies $nabla x_a = e_a$, hence $cal(E)_g \( x_a \) = 1$. This is #cite(label("FUA")) Proposition 5.1. The usual contraction rule for gradients passes to the closure, so the form is Dirichlet and $S_t^g$ is a conservative symmetric Markov semigroup.]
  + #emph[On a quenched represented subsequence, say that $f_n$ converges weakly to $F in L^2 \( Pi_g \)$ if its $L^2 \( mu \)$ norms are bounded and $mu \[ f_n phi.alt \( x \) \] arrow.r Pi_g \[ F phi.alt \]$ for every smooth compact cylinder $phi.alt$; call the convergence strong when in addition $mu \[ f_n^2 \] arrow.r Pi_g \[ F^2 \]$. Suppose, for fixed $C \, D < oo$, that $parallel f_n parallel_oo lt.eq C n^D$, that $T_n cal(E) \( f_n \)$ is bounded, and that $f_n$ converges weakly to $F$. Then $F$ belongs to the closed form domain and 
#[#set math.equation(numbering: n => "(2.6)")
 $ liminf_n T_n cal(E) \( f_n \) gt.eq c_(*) cal(E)_g \( F \) . $ <eq:relaxed-liminf>]

 Conversely, for every smooth compact cylinder $F$, there are functions $f_(n \, j)$, polynomially bounded for each fixed $j$, such that $f_(n \, j)$ converges strongly to $F$ as $n arrow.r oo$ for each $j$, and 
#[#set math.equation(numbering: n => "(2.7)")
 $ lim_(j arrow.r oo) lim_(n arrow.r oo) T_n cal(E) \( f_(n \, j) \) = c_(*) cal(E)_g \( F \) . $ <eq:relaxed-recovery>]

 The source asserts a common represented event for countably many chosen sources and tests. Recovery is used at each fixed $j$, followed by the displayed $j$-limit #cite(label("FUA")) Theorem 6.8.]
] <prop:stationary-inputs>

In Item 1, the tail density is

$ frac(q_m^(upright("head")) #h(-0.16667em) (D_g \( b \) - sum_(a > m) \( x_a^2 - ell_a \)), q \( D_g \( b \) \)) \, $

where $q_m^(upright("head"))$ is the density of the centered head square sum. A sufficiently large head makes this density bounded. This concrete description will be used for estimates on infinitely many coordinates. For a candidate pair $\( F \, G \) in L^2 \( Pi_g \) times L^2 \( Pi_g \; ell^2 \)$, the angular weak identity underlying Item 3 is

#[#set math.equation(numbering: n => "(2.8)")
 $ integral psi thin \( A x \) dot.op G thin thin upright(d) Pi_g = - integral F {\( A x \) dot.op nabla psi - psi sum_a \( g_a + b \) x_a \( A x \)_a} thin upright(d) Pi_g \, $ <eq:angular-weak>]

for every skew-symmetric matrix $A$ with finitely many nonzero entries and every smooth compact cylinder $psi$ whose coordinate set contains every index appearing in $A$. These identities hold exactly when $F$ belongs to the closed form domain and $G = nabla F$ #cite(label("FUA")) Proposition 5.1. The term with $b$ cancels by skew-symmetry.

The source also proves that $g mapsto A_g$, defined in (1.4), is a Borel $C_(upright("loc")) \( \( 0 \, oo \) \)$-valued map and identifies $A_g$ as the stationary limit for both entry laws #cite(label("FUA")) Proposition 9.2. We will obtain the joint limit with $B_(n \, J)$ from the same finite coordinates. In particular, (2.6) is used with its polynomial bound; the strong resolvent convergence needed here is derived in Section 5.

=== 2.3 High-probability estimates and subsequences <high-probability-estimates-and-subsequences>

We make one convention for random constants. An estimate holds with #emph[tight constants] if, for every $chi > 0$, there are deterministic constants in that estimate and events $cal(G)_(n \, chi)$ such that

$ liminf_(n arrow.r oo) bb(P) \( cal(G)_(n \, chi) \) gt.eq 1 - chi $

and the estimate holds on $cal(G)_(n \, chi)$ simultaneously for every scale and test function in its stated class. The constants may depend on $chi$ and on fixed parameters specified before the estimate, but not on $n$, the scale, or the test. A tight lower threshold for the dimension parameter $k_p = n p^3$ has the same meaning with a deterministic threshold $K_chi$ on each event. When an estimate is required above a vanishing time threshold, this means that for each $chi$ a deterministic threshold $epsilon_(n \, chi) arrow.b 0$ can be chosen on those events.

We use the represented-subsequence convention of #cite(label("FUA")) Remark 2.2. The edge points, the countably many cylinder integrals and error quantities in use, and bounds that are tight in the preceding sense are included in a joint law before applying the subsequence and Skorokhod representation theorems. A further diagonal subsequence handles an iterated limit such as $lim_(m arrow.r oo) limsup_n$. On the resulting probability space, the relevant bounds are finite and the chosen coordinates converge almost surely. Conditional laws of the remaining finite data recover the original finite models. This construction is used only to show that every subsequence has a further subsequence with the identified limit, which implies the asserted convergence in law.

For a disorder-dependent test, we use the separate class-uniform quenched convention of #cite(label("FUA")) Remark 2.2: each invoked inequality holds on one event for every test in its stated norm, energy, and polynomial-growth class. The source obtains this uniformity by bounding the error by the stated norms times a common nonnegative random error, which permits measurable choices of the test. The common represented event is then chosen for the countable collection of sources and tests used in this proof. The countable core encodes limits and density classes after the uniform bounds have been established.

== 3 Gaussian estimates at the bottom edge scales <sec:edge-estimates>

The observation below reveals noisy information about leading spin projections. We control the variance of a bounded spin function left unresolved by that observation by $C p^(- 2)$ times its heat-bath energy, with a small remainder, at every scale for which $n p^3$ exceeds a tight threshold. The exponent $2$ is important: a fixed relative covariance error at every scale would accumulate to a power loss. We first extend the Gaussian cap estimates to these scales and then show that the relative error is integrable with respect to $upright(d) log p$.

=== 3.1 Cap observations and the estimates <cap-observations-and-the-estimates>

Throughout this section the disorder is Gaussian, with the independent GOE diagonal and randomized eigenvector signs specified in Section 2. Set $r_n = n^(- 1 \/ 3 + 10^(- 4))$, the terminal scale of the source estimates, and write $d = 2 I - W$. Define, in physical coordinates,

$ P_p & = U "diag" \( upright(bold(1))_({ d_a lt.eq p^2 }) \) U^(sans(T)) \, & cal(H)_p & = "ran" P_p \,\
B_p & = U "diag" \( \( p^2 - d_a \)_(+) \) U^(sans(T)) \, & W_p & = W - B_p \,\
k_p & = n p^3 \, & M_p & = sqrt(n p) . $

Thus $p^2 M_p^2 = k_p$. A field at scale $p$ lies in $cal(H)_p$, with length unit $p^2 M_p$. For such a field let

$ phi.alt_p \( h \) = log nu_n exp (1 / 2 X^(sans(T)) W_p X + h^(sans(T)) X) \, #h(2em) m_p \( h \) = nabla phi.alt_p \( h \) \, #h(2em) K_p \( h \) = [P_p nabla^2 phi.alt_p \( h \) P_p]_(cal(H)_p) . $

Brackets with subscript $cal(H)_p$ denote compression to that space. The probability with this log partition function is $mu_(p \, h)$. Thus $m_p$ and $K_p$ are its mean and its active covariance. Superscript $upright("sp")$ denotes the same definitions with normalized surface measure on ${ X : parallel X parallel^2 = n }$ in place of $nu_n$. In the tight-constant convention of Section 2, a tight lower threshold for $k_p$ means that, for each $chi > 0$, a deterministic threshold $K_chi$ can be chosen on an event of limiting lower probability at least $1 - chi$.

For $X tilde.op mu$, form the Gaussian observation

#[#set math.equation(numbering: n => "(3.1)")
 $ h_p = B_p X + beta_p \, #h(2em) "Cov" \( beta_p \, beta_q \) = B_(min \( p \, q \)) . $ <edge:observation>]

One construction uses an independent scalar Brownian motion in spectral coordinate $a$, evaluated at $\( p^2 - d_a \)_(+)$. Bayes’ formula gives $"Law" \( X divides h_q \, med q lt.eq p \) = "Law" \( X divides h_p \) = mu_(p \, h_p)$ at fixed $W$. Write $Q_mu$ for the joint law of the spin and all observations at fixed $W$. The observation filtration excludes the spin. The path $h_p$ is continuous at $p^2 = d_a$; the new coordinate then has zero precision. The finitely many activation points may be omitted in scale integrals. For $0 lt.eq f lt.eq 1$, put

#[#set math.equation(numbering: n => "(3.2)")
 $ F_p \( h \) = mu_(p \, h) \[ f \] \, #h(2em) V_p \( f \) = Q_mu \[ "Var" \( f divides h_p \) \] . $ <edge:posterior-variance>]

For $u > - p^2$ define

$ R_(p \, u) = U "diag" (\( max { d_a \, p^2 } + u \)^(- 1)) U^(sans(T)) . $

On the spectral events and scales used below, the spherical saddle $alpha_p \( h \) > - p^2$ is the unique solution of

#[#set math.equation(numbering: n => "(3.3)")
 $ n = "Tr" R_(p \, alpha_p \( h \)) + parallel R_(p \, alpha_p \( h \)) h parallel^2 . $ <edge:saddle>]

Existence, uniqueness, and bounds on this solution are proved below. Since $R_(p \, u)$ is scalar on $cal(H)_p$, the length of a field whose saddle is $u$ is

#[#set math.equation(numbering: n => "(3.4)")
 $ ell_p \( u \) = \( p^2 + u \) sqrt(n - "Tr" R_(p \, u)) $ <edge:saddle-length>]

whenever the expression under the square root is nonnegative.

We use one change of probability law, always conditional on a fixed spectrum. Under the ordinary law $U$ is Haar, and $Q_mu$ is the joint law of the spin and its physical observations at the resulting $W$. With probability reference measures in the partition functions, set $L_compose \( U \) = Z_(upright("cube")) \( W \) \/ Z_(upright("sp")) \( W \)$. Haar averaging gives $E_U L_compose = 1$. Under $upright(bold(P))$, first choose $U$ with Haar density $L_compose$, and then use $Q_mu$ given $W$; write $upright(bold(E))$ for its expectation. The spherical identity of #cite(label("FUA")) Lemma 2.5 and Equation (2.8) gives

#[#set math.equation(numbering: n => "(3.5)")
 $ "Law"_(upright(bold(P))) \( U^(sans(T)) X \) = mu^(upright("sp")) upright(" in spectral coordinates") \, #h(2em) E_U \( L_compose - 1 \)^2 = o \( 1 \) $ <edge:haar-bias>]

on its retained eigenvalue events. Consequently the spectral observation path $\( U^(sans(T)) h_p \)_p$ under $upright(bold(P))$ has the spherical observation law, denoted by $Q^(upright("sp"))$. For comparison, let $sans(R)$ choose $U$ with Haar law independently of a spectral path with law $Q^(upright("sp"))$, and transport that path to physical coordinates by $U$. For the filtration generated by $U$ and observations through $p$, but not by $X$, the exact likelihood from #cite(label("FUA")) Equation (2.9) is

#[#set math.equation(numbering: n => "(3.6)")
 $ frac(upright(d) upright(bold(P)), upright(d) sans(R)) \|_(cal(F)_p) = L_p \( h_p \) \, #h(2em) L_p \( h \) = exp { phi.alt_p \( h \) - phi.alt_p^(upright("sp")) \( h \) } . $ <edge:path-likelihood>]

The notation $L_p \( h \)$ suppresses its dependence on $U$: in a Haar average the spectral field $U^(sans(T)) h$ is held fixed, while $L_p \( h \)$ still varies with $U$. At every such field $E_U L_p \( h \) = 1$. To check the likelihood, the observation density is a common Gaussian factor times the posterior partition function divided by the original one, and $L_compose$ cancels the original partition functions. In particular, for every nonnegative spin or observation functional $G$,

#[#set math.equation(numbering: n => "(3.7)")
 $ E_U \[ upright(bold(1))_({ L_compose gt.eq 1 \/ 2 }) Q_mu G \] lt.eq 2 upright(bold(E)) G . $ <edge:bias-transfer>]

#thm([Proposition 3.1.])[
  (Cap estimates with a tight lower threshold).  #emph[Fix $0 < C_1 < oo$, $0 lt.eq R < oo$, positive tolerances $epsilon.alt_(upright("sp")) \, epsilon.alt_0 \, epsilon.alt_v \, epsilon.alt_g$, and $zeta > 0$. For every $epsilon > 0$ there are finite positive constants $K \, C \, c \, a \, v_0$, a width $s_0 > 0$, a radius $R_(upright("ann")) < oo$, and Gaussian disorder events $cal(C)_n$ with $liminf_n bb(P)_(upright("GOE")) \( cal(C)_n \) gt.eq 1 - epsilon$, such that the following hold on $cal(C)_n$, simultaneously at every scale 
#[#set math.equation(numbering: n => "(3.8)")
 $ K lt.eq k_p = n p^3 \, #h(2em) p lt.eq C_1 r_n . $ <edge:scale-range>]

]
  + #emph[The active dimension is between $c k_p$ and $C k_p$, $d_1 gt.eq - epsilon.alt_(upright("sp")) p^2$, and, with $b_0 = 4 \/ \( 3 pi \)$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ lr(|frac(n - "Tr" R_(p \, 0), n p) - b_0|) lt.eq epsilon.alt_(upright("sp")) \, #h(2em) lr(|p / n "Tr" R_(p \, 0)^2 - 2 b_0|) lt.eq epsilon.alt_(upright("sp")) . $ <edge:trace-estimates>]

 On $parallel h parallel lt.eq R p^2 M_p$, the saddle satisfies $- 1 + c_R lt.eq alpha_p \( h \) \/ p^2 lt.eq C_R$. On $\| u \| lt.eq s_0 p^2$, $ell_p \( u \) asymp p^2 M_p$ and $ell'_p \( u \) asymp M_p$.]
  + #emph[On the field ball $parallel h parallel lt.eq R p^2 M_p$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ K_p \( h \) & prec.curly.eq C_R p^(- 2) I_(cal(H)_p) \,\
\| phi.alt_p \( h \) - phi.alt_p^(upright("sp")) \( h \) \| & lt.eq epsilon.alt_v k_p \,\
parallel P_p m_p \( h \) - R_(p \, alpha_p \( h \)) h parallel & lt.eq epsilon.alt_g M_p . $ <edge:static-estimates>]

 The constant $C_R$ in the first line may be chosen independently of the requested annular tolerance $epsilon.alt_0$. On the full annulus $\| alpha_p \( h \) \| lt.eq s_0 p^2$, the field is nonzero; for $e = h \/ parallel h parallel$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ K_p \( h \) prec.curly.eq \( 1 + epsilon.alt_0 \) p^(- 2) I_(cal(H)_p) \, #h(2em) p^2 chevron.l e \, K_p \( h \) e chevron.r lt.eq 0.9 . $ <edge:coarse-curvature>]

 The annulus lies in $parallel h parallel lt.eq R_(upright("ann")) p^2 M_p$, and the event also includes the static comparisons on this ball, with constants allowed to depend on $R_(upright("ann"))$.]
  + #emph[For every $v gt.eq v_0$, the uncapped law $mu$, every posterior $mu_(p \, h)$ in the stated field ball, and their spherical counterparts satisfy 
#[#set math.equation(numbering: n => "(3.12)")
 $ Pr { parallel P_p X parallel > v M_p } lt.eq C e^(- c k_p v^6) . $ <edge:projection-tails>]

 The event is empty for $v > p^(- 1 \/ 2)$. The spherical pair bound of Lemma 6 also holds for each number of replicas fixed in advance, with constants allowed to depend on that number. Moreover, 
#[#set math.equation(numbering: n => "(3.13)")
 $ Q_mu { \| alpha_p \( h_p \) \| > zeta p^2 } lt.eq C e^(- c k_p) . $ <edge:ordinary-annulus>]

]
  + #emph[For every scale in (3.8) with $p lt.eq r_n$, simultaneously for every $0 lt.eq f lt.eq 1$, 
#[#set math.equation(numbering: n => "(3.14)")
 $ V_p \( f \) & lt.eq C p^(- 2) cal(E) \( f \) + C e^(- c k_p^a) \,\
p^2 Q_mu parallel nabla_(cal(H)_p) F_p \( h_p \) parallel^2 & lt.eq C V_p \( f \) + C e^(- c k_p^a) . $ <edge:variance-estimates>]

 The event and constants in these inequalities are independent of $f$.]
  #emph[All constants in the saddle, length, and comparison bounds are deterministic on $cal(C)_n$ and may depend on the fixed inputs and the requested failure probability, but not on $n$, $p$, or the field in its stated region.]
] <prop:edge-estimates>

Every radius, tolerance, and finite multiplicative enlargement of a scale interval is fixed before the constants are chosen. Increasing $K$ by a fixed factor supplies any such enlargement at the lower endpoint. A finite number of further requests for cap estimates may be imposed by intersecting their events, with a smaller failure probability assigned to each. This preserves the constants and exponent of any variance estimate already obtained.

===== 3.1.1 Reduction to positive covariance error. <reduction-to-positive-covariance-error.>

Fix $W$ and $0 lt.eq f lt.eq 1$. In the time variable $t = p^2$, let

$ cal(F)_t^(upright("obs")) = sigma \( h_q : 0 lt.eq q lt.eq sqrt(t) \) \, #h(2em) M_t^f = F_(sqrt(t)) \( h_(sqrt(t)) \) . $

This filtration excludes the spin and includes any information in $h_0$; the initial precision $B_0$ need not vanish. The bounded posterior martingale $M^f$ is continuous. On positive time intervals, its predictable bracket has density $parallel nabla_(cal(H)_(sqrt(t))) F_(sqrt(t)) \( h_(sqrt(t)) \) parallel^2$. The coefficient can change at an activation, but the martingale has no jump there. Total variance and the bracket identity therefore give

#[#set math.equation(numbering: n => "(3.15)")
 $ - frac(upright(d) V_p \( f \), upright(d) \( p^2 \)) = Q_mu parallel nabla_(cal(H)_p) F_p \( h_p \) parallel^2 $ <edge:variance-identity>]

almost everywhere in $p > 0$, and in integrated form across activation points. This is the localization variance calculation in #cite(label("EldanKoehlerZeitouni2022")) proof of Theorem 1, Equation (14) and the display after Equation (15), with deterministic rate $P_p$.

Let $cal(N)$ be a jointly measurable set of triples $\( p \, W \, h \)$ with $h in cal(H)_p$, chosen independently of $f$, and let $eta_p = eta_p \( W \) gt.eq 0$ be a measurable scalar fixed at each $\( W \, p \)$. Suppose that $p^2 K_p \( h \) prec.curly.eq \( 1 + eta_p \) I_(cal(H)_p)$ for $h in cal(H)_p$ when $\( p \, W \, h \) in.not cal(N)$. Put

#[#set math.equation(numbering: n => "(3.16)")
 $ Z_p \( X \) = frac(parallel P_p X parallel^2, M_p^2) \, #h(2em) rho_p \( W \) = k_p Q_mu #h(-0.16667em) [upright(bold(1))_(cal(N)) \( p \, W \, h_p \) mu_(p \, h_p) \( Z_p \)] . $ <edge:common-failure-cost>]

Conditional covariance and Cauchy–Schwarz give, at the observed field,

#[#set math.equation(numbering: n => "(3.17)")
 $ parallel nabla_(cal(H)_p) F_p \( h_p \) parallel^2 & lt.eq parallel K_p \( h_p \) parallel "Var"_(mu_(p \, h_p)) \( f \) \,\
p^2 parallel nabla_(cal(H)_p) F_p \( h_p \) parallel^2 & lt.eq k_p mu_(p \, h_p) \( Z_p \) . $ <edge:gradient-bounds>]

For the second bound, write $nabla F_p = mu_(p \, h_p) \[ P_p X \( f - F_p \) \]$ and use $\| f - F_p \| lt.eq 1$. Its right side is a common cost for every such $f$. Splitting the expectation in (3.15) at $cal(N)$ yields

#[#set math.equation(numbering: n => "(3.18)")
 $ - frac(upright(d) V_p, upright(d) log p) lt.eq 2 \( 1 + eta_p \) V_p + 2 rho_p $ <edge:variance-differential>]

almost everywhere. If $eta_u lt.eq C k_u^(- a)$ for a fixed $a > 0$ on $\[ p \, q \]$, its backward integrating factor is at most

$ exp (2 integral_p^q \( 1 + C k_u^(- a) \) thin upright(d) log u) lt.eq C \( q \/ p \)^2 \, #h(2em) integral_p^q k_u^(- a) thin upright(d) log u = frac(k_p^(- a) - k_q^(- a), 3 a) lt.eq frac(K^(- a), 3 a) $

whenever $k_p gt.eq K$. In particular,

#[#set math.equation(numbering: n => "(3.19)")
 $ V_p lt.eq C \( q \/ p \)^2 V_q + C integral_p^q \( u \/ p \)^2 rho_u thin upright(d) log u . $ <edge:variance-amplification>]

The remaining work for Item 4 is to obtain this covariance bound with $eta_p = C k_p^(- a)$, control the common cost $rho_p$ on dyadic intervals, and use the source variance estimate at $r_n$. The integrable relative error is what preserves the exponent $2$.

=== 3.2 Spectral counts, saddles, and spherical tails <spectral-counts-saddles-and-spherical-tails>

For a specified spectral error, being small above a tight threshold means

#[#set math.equation(numbering: n => "(3.20)")
 $ lim_(K arrow.r oo) limsup_(n arrow.r oo) bb(P)_(upright("GOE")) {sup_(n p^3 gt.eq K\
p lt.eq C_1 r_n) upright("the specified error at ") p > eta} = 0 quad \( eta > 0 \) . $ <edge:threshold-convention>]

Only finitely many errors at a time are needed. This is a double-limit assertion, not convergence with $n$ at a fixed $K$.

#thm([Lemma 3.2.])[
  (Spectral estimates above a tight threshold).  #emph[In the convention (3.20), the measures $nu_p = k_p^(- 1) sum_i delta_(d_i \/ p^2)$ converge on fixed bounded intervals to $pi^(- 1) sqrt(v) thin upright(bold(1))_({ v > 0 }) upright(d) v$. Their distribution functions converge uniformly on compact intervals. The same convention gives $d_1 \/ p^2 gt.eq - o \( 1 \)$, $dim cal(H)_p \/ k_p arrow.r 2 \/ \( 3 pi \)$, and the two limits in (3.9). On spectral events of arbitrarily large limiting probability there is also a fixed $C$ such that 
#[#set math.equation(numbering: n => "(3.21)")
 $ \# { i : d_i lt.eq u } & lt.eq C n u^(3 \/ 2) &  & \( u gt.eq c p^2 \, med u lt.eq 4 \) \,\
integral_(\[ A \, oo \)) \( 1 + v \)^(- 2) nu_p \( upright(d) v \) & lt.eq C A^(- 1 \/ 2) &  & \( A gt.eq 1 \) \, $ <edge:counting-tail>]

 for every fixed $c > 0$, after increasing the threshold. Every spectral restriction below also includes eigenvalue-only events $cal(S)_n^(upright("glob"))$ of probability $1 - o \( 1 \)$ on which, uniformly over their spectra, 
#[#set math.equation(numbering: n => "(3.22)")
 $ 1 / n sum_i delta_(lambda_i) med arrow.r.double med rho_(upright("sc")) \( thin upright(d) x \) := frac(1, 2 pi) sqrt(4 - x^2) thin upright(bold(1))_({ \| x \| lt.eq 2 }) thin upright(d) x \, #h(2em) lambda_1 arrow.r 2 \, #h(2em) parallel W parallel lt.eq 3 . $ <edge:global-spectral>]

]
] <edge:spectral>

#proof[
  We use the eigenvalue-only event of #cite(label("CS")) Proposition 3.1. For every deterministic $L_n arrow.r oo$ with $L_n lt.eq log n$, that proposition gives positive denominators and, uniformly for $L_n n^(- 2 \/ 3) lt.eq u lt.eq M$ with fixed $M$,
  #[#set math.equation(numbering: n => "(3.23)")
   $ m_1 \( u \) := 1 / n sum_i \( d_i + u \)^(- 1) & = frac(2 + u - sqrt(u \( 4 + u \)), 2) + o \( sqrt(u) \) \,\
m_2 \( u \) := 1 / n sum_i \( d_i + u \)^(- 2) & lt.eq C_M u^(- 1 \/ 2) \,\
lambda_j & = 2 + o \( L_n n^(- 2 \/ 3) \) quad \( 1 lt.eq j lt.eq 3 \) \, #h(2em) parallel W parallel lt.eq 3 . $ <edge:source-resolvents>]
  The errors have deterministic uniform bounds on an event of probability at least $1 - C e^(- c L_n^(1 \/ 4))$.
  For (3.22), take $cal(S)_n^(upright("glob"))$ to be the separate source event with $L_n = sqrt(log n)$. Its probability tends to one, and the edge and norm assertions follow directly from (3.23). For every fixed $u > 1$, the first resolvent converges uniformly there to
  $ frac(2 + u - sqrt(u \( 4 + u \)), 2) = integral frac(rho_(upright("sc")) \( thin upright(d) x \), 2 + u - x) . $
  The norm bound makes the empirical spectral measures a compact family. Every weak subsequential limit therefore has the displayed transform for every $u > 1$, and uniqueness of the Stieltjes transform identifies it with $rho_(upright("sc"))$. A contradiction by subsequences gives this weak convergence uniformly over the source event. Intersecting with this event does not change the tight-threshold convention.
  Let $K_n arrow.r oo$ be arbitrary and set $L_n = min { K_n^(1 \/ 3) \, sqrt(log n) }$, changing finitely many initial values if necessary. For $n p^3 gt.eq K_n$, $L_n n^(- 2 \/ 3) = o \( p^2 \)$. Thus, for every fixed $v > 0$,
  $ m_1 \( v p^2 \) = 1 - sqrt(v) thin p + O_v \( p^2 \) + o_v \( p \) $
  uniformly in the scale range, and $d_1 \/ p^2 gt.eq - o \( 1 \)$. For $u gt.eq c p^2$, the counted denominators satisfy $0 < d_i + u lt.eq 2 u$. Consequently
  $ \# { d_i lt.eq u } lt.eq 4 u^2 sum_i \( d_i + u \)^(- 2) lt.eq C n u^(3 \/ 2) . $
  Summing on dyadic bands gives the second bound in (3.21); the last band above $u = 4$ costs $O \( p \)$ by $parallel W parallel lt.eq 3$, and obeys the same bound.
  For fixed $v \, w > 0$, the transform difference is exactly
  #[#set math.equation(numbering: n => "(3.24)")
   $ integral (frac(1, x + v) - frac(1, x + w)) nu_p \( upright(d) x \) = frac(m_1 \( v p^2 \) - m_1 \( w p^2 \), p) arrow.r sqrt(w) - sqrt(v) . $ <edge:transform-difference>]
  To identify the limit including the tail, put $omega_p \( upright(d) x \) = \( 1 + x \)^(- 2) nu_p \( upright(d) x \)$. These finite measures have bounded mass, the tail bound (3.21), and negative support in an interval shrinking to zero. Every weak limit $omega$ is therefore supported on $\[ 0 \, oo \)$. Taking $w = 1$ in (3.24) gives
  $ integral frac(1 + x, x + v) thin omega \( upright(d) x \) = frac(1, 1 + sqrt(v)) . $
  Letting $v arrow.r 1$ gives $omega \( \[ 0 \, oo \) \) = 1 \/ 2$, and hence
  $ integral frac(omega \( upright(d) x \), x + v) = frac(1, 2 \( 1 + sqrt(v) \)^2) . $
  Uniqueness of the Stieltjes transform identifies $omega \( upright(d) x \) = pi^(- 1) sqrt(x) \( 1 + x \)^(- 2) upright(d) x$. The continuous distribution function of the corresponding limit of $nu_p$ gives uniformity in endpoints on compact intervals. Failure of uniformity over $p$ would provide a sequence of scales to which this same compactness argument applies, a contradiction.
  The clipped second trace has limit
  $ p / n "Tr" R_(p \, 0)^2 = integral \( max { x \, 1 } \)^(- 2) nu_p \( upright(d) x \) arrow.r 1 / pi (integral_0^1 sqrt(x) thin upright(d) x + integral_1^oo x^(- 3 \/ 2) thin upright(d) x) = frac(8, 3 pi) . $
  For the first trace, subtract an ordinary resolvent before integrating:
  $ frac(n - "Tr" R_(p \, 0), n p) = frac(1 - m_1 \( p^2 \), p) + integral (frac(1, x + 1) - frac(1, max { x \, 1 })) nu_p \( upright(d) x \) arrow.r frac(4, 3 pi) . $
  The difference kernel is $O \( x^(- 2) \)$. Its limiting integral is $4 \/ \( 3 pi \) - 1$, obtained by substituting $x = t^2$ on each of $\( 0 \, 1 \)$ and $\( 1 \, oo \)$.
  These assertions hold for every arbitrarily slowly divergent $K_n$. If (3.20) failed, one could choose $K_j arrow.r oo$ and $n_j arrow.r oo$ with failure probability bounded away from zero and embed $K_(n_j) = K_j$ in a divergent deterministic sequence. The preceding uniform conclusion contradicts that subsequence. ◻
]

#thm([Lemma 3.3.])[
  (Saddles and squared-norm densities).  #emph[On the spectral restrictions of Lemma 4, the saddle and length conclusions in Proposition 3 hold. For a saddle field in a fixed ball let 
$ Y tilde.op N \( m \, hat(R) \) \, #h(2em) hat(R) = R_(p \, alpha_p \( h \)) \, quad m = hat(R) h \, quad sigma^2 = 2 "Tr" hat(R)^2 + 4 m^(sans(T)) hat(R) m . $

 Then $sigma^2 asymp n \/ p$, and the density $f_Y$ of $parallel Y parallel^2$ satisfies $f_Y \( n \) asymp sqrt(p \/ n) = p^2 \/ sqrt(k_p)$. In standard-deviation units this density converges uniformly on $bb(R)$ to the standard normal density as $K arrow.r oo$.]
  #emph[For a fixed number $m_0$ of replicas, suppose the spectral rows $Y_i in bb(R)^(m_0)$ are independent Gaussian vectors and at least $L > 2$ row covariances obey $c u^(- 1) I_(m_0) prec.curly.eq C_i prec.curly.eq C u^(- 1) I_(m_0)$. Their means are arbitrary. The joint density of $cal(Q) = \( sum_i Y_(i 1)^2 \, dots.h \, sum_i Y_(i m_0)^2 \)$ obeys 
#[#set math.equation(numbering: n => "(3.25)")
 $ sup_z f_(cal(Q)) \( z \) lt.eq C_(m_0) \( u \/ sqrt(L) \)^(m_0) . $ <edge:replica-norm-density>]

 This applies after rowwise Gaussian tilts which preserve the stated band and independence of the rows.]
] <edge:norm-density>

#proof[
  Put $t = u \/ p^2$ and $frak(d)_p \( t \) = \( n - "Tr" R_(p \, t p^2) \) \/ \( n p \)$. For $y = parallel h parallel \/ \( p^2 M_p \)$, the saddle equation becomes
  #[#set math.equation(numbering: n => "(3.26)")
   $ frak(d)_p \( t \) = frac(y^2, \( 1 + t \)^2) \, #h(2em) t > - 1 \, #h(2em) frak(d)'_p \( t \) = p / n "Tr" R_(p \, t p^2)^2 . $ <edge:scaled-saddle>]
  Lemma 4 gives $frak(d)_p \( 0 \)$ arbitrarily close to $b_0$, and
  $ frak(d)'_p \( t \) gt.eq frac(dim cal(H)_p \/ k_p, \( 1 + t \)^2) . $
  It follows by integration that $frak(d)_p \( - 1 + kappa \) < 0$ for a sufficiently small fixed $kappa > 0$; no saddle can lie there or below. On $t gt.eq 0$, $frak(d)_p \( t \) gt.eq b_0 \/ 2$, so (3.26) bounds $t$ above when $y lt.eq R$. The right side of (3.3), viewed as a function of its parameter, is strictly decreasing and continuous, tends to infinity at $- p^2$, and tends to zero at infinity. This also proves existence and uniqueness. Denominator comparison gives $"Tr" hat(R)^2 asymp n \/ p$, $parallel m parallel^2 lt.eq C_R n p$, and $parallel hat(R) parallel lt.eq C_R p^(- 2)$, hence $sigma^2 asymp n \/ p$. For a sufficiently small fixed $s_0$, both $frak(d)_p \( t \)$ and $frak(d)'_p \( t \)$ are bounded above and below on $\| t \| lt.eq s_0$. Differentiating $ell_p \( t p^2 \) = p^2 M_p \( 1 + t \) sqrt(frak(d)_p \( t \))$ proves the length and derivative bounds.
  We record the density argument used here and later. For independent $Y_i = a_i + sqrt(upsilon_i) G_i$, suppose
  $ max_i upsilon_i lt.eq C p^(- 2) \, #h(2em) sigma^2 := 2 sum_i upsilon_i^2 + 4 sum_i upsilon_i a_i^2 asymp k_p p^(- 4) \, $
  and at least $c k_p$ variances are at least $c p^(- 2)$. The Gaussian quadratic formula, as in #cite(label("CM")) Section 15.3, Equation (15.5), gives
  #[#set math.equation(numbering: n => "(3.27)")
   $ lr(|bb(E) e^(i t sum_i Y_i^2)|) = product_i \( 1 + 4 t^2 upsilon_i^2 \)^(- 1 \/ 4) exp (- sum_i frac(2 t^2 upsilon_i a_i^2, 1 + 4 t^2 upsilon_i^2)) . $ <edge:norm-characteristic>]
  Expansion of the centered log characteristic function through order two gives
  #[#set math.equation(numbering: n => "(3.28)")
   $ log bb(E) e^(i t \( parallel Y parallel^2 - bb(E) parallel Y parallel^2 \) \/ sigma) = - t^2 \/ 2 + O \( k_p^(- 1 \/ 2) \| t \|^3 \) quad \( \| t \| lt.eq c sqrt(k_p) \) . $ <edge:norm-expansion>]
  Indeed its remainder is at most
  $ C \| t \/ sigma \|^3 sum_i \( upsilon_i^3 + upsilon_i^2 a_i^2 \) lt.eq C k_p^(- 1 \/ 2) \| t \|^3 . $
  The band in (3.27) bounds the modulus in these units by $\( 1 + c t^2 \/ k_p \)^(- c' k_p)$. Its real logarithm is at most $- c_0 t^2$ up to a small fixed multiple of $sqrt(k_p)$, and its integral outside that interval is exponentially small in $k_p$. Fourier inversion and (3.28) give
  #[#set math.equation(numbering: n => "(3.29)")
   $ sup_z lr(|sigma f_Y \( bb(E) parallel Y parallel^2 + sigma z \) - \( 2 pi \)^(- 1 \/ 2) e^(- z^2 \/ 2)|) lt.eq C k_p^(- 1 \/ 2) . $ <edge:norm-local-limit>]
  At the saddle $bb(E) parallel Y parallel^2 = n$, proving the lower and upper density bounds. At any mean, the same characteristic majorant gives the upper bound $C p^2 \/ sqrt(k_p)$.
  For replicas let $T_t = "diag" \( t_1 \, dots.h \, t_(m_0) \)$ and $H_i = C_i^(1 \/ 2) T_t C_i^(1 \/ 2)$. The modulus of the row characteristic function is at most $det \( I + 4 H_i^2 \)^(- 1 \/ 4)$; its extra factor from a nonzero mean is at most one. The singular values of $H_i$ are at least $c u^(- 1)$ times those of $T_t$, including when the entries of $T_t$ have different signs. Independence of the $L$ rows bounds the joint characteristic function by $product_j \( 1 + c t_j^2 \/ u^2 \)^(- L \/ 4)$. Its integral proves (3.25). This is the argument of #cite(label("CM")) Section 15.3, Equation (15.6); it explains the independence requirement on the spectral rows. ◻
]

#thm([Lemma 3.4.])[
  (Spherical projection and pair tails).  #emph[Fix a field radius and a fixed number of replicas. On the spectral restrictions above, for every $p$ with $k_p gt.eq K$ and $p lt.eq C_1 r_n$, both the uncapped zero-field spherical law and the capped spherical law at a field in that ball satisfy 
#[#set math.equation(numbering: n => "(3.30)")
 $ Pr { parallel P_p X parallel > v M_p } & lt.eq C e^(- c k_p v^6) &  & \( v gt.eq v_0 \) \,\
Pr { \| n^(- 1) X^(sans(T)) X' \| > w } & lt.eq C e^(- c n w^3) &  & \( C p lt.eq w lt.eq rho_0 \) . $ <edge:spherical-tail-bounds>]

 Here $X \, X'$ are independent replicas at the same field, $rho_0 > 0$ is fixed and small, and the second bound holds for every pair of a fixed finite family. The constants are uniform in $p \, n$.]
] <edge:spherical-tails>

#proof[
  We give the scale check in the polar argument of #cite(label("CM")) Section 15.3, Equations (15.5)–(15.8). For an interaction $A$, write $R_(A \, u) = \( 2 + u - A \)^(- 1)$ and
  $ q_(A \, u) \( h \) = c_n + n / 2 \( 2 + u \) + 1 / 2 log det R_(A \, u) + 1 / 2 h^(sans(T)) R_(A \, u) h \, #h(2em) c_n = log #h(-0.16667em) (2^(n \/ 2) Gamma \( n \/ 2 \) n^(1 - n \/ 2)) . $
  Coarea in squared radius gives, exactly,
  #[#set math.equation(numbering: n => "(3.31)")
   $ phi.alt_A^(upright("sp")) \( h \) = q_(A \, u) \( h \) + log f_(A \, u \, h) \( n \) \, #h(2em) partial_u q_(A \, u) \( h \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] n - "Tr" R_(A \, u) - parallel R_(A \, u) h parallel^2 #scale(x: 120%, y: 120%)[\)] \, $ <edge:frozen-density>]
  where $f_(A \, u \, h)$ is the density of $parallel N \( R_(A \, u) h \, R_(A \, u) \) parallel^2$. In the capped case take $A = W_p$ and start at its saddle $u = alpha$. For $u gt.eq p^2$,
  $ n - "Tr" R_(p \, u) lt.eq C n sqrt(u) + C k_p p^2 \/ u^2 lt.eq C n sqrt(u) . $
  The first term is (3.23); the second compares the clipped active denominators with $d_i + u$, using $dim cal(H)_p lt.eq C k_p$. For $u$ in a bounded range in $p^2$ units, the upper bound is $C_R n p$. Integrating (3.31) yields
  #[#set math.equation(numbering: n => "(3.32)")
   $ q_(W_p \, u) \( h \) - q_(W_p \, alpha) \( h \) lt.eq C n u^(3 \/ 2) + C_R k_p \, $ <edge:frozen-normalizer-cost>]
  where the first constant is independent of the field radius.
  For a rowwise quadratic test $cal(T)$ of $m_0$ replicas and $lambda > 0$, let $f_(cal(Q))^(u \, lambda)$ be the norm density under the normalized Gaussian tilt $e^(lambda cal(T))$ of $m_0$ independent copies of $N \( R_(p \, u) h \, R_(p \, u) \)$. Exponential Markov and polar coarea give
  #[#set math.equation(numbering: n => "(3.33)")
   $ \( mu_(p \, h)^(upright("sp")) \)^(⊗ m_0) { cal(T) gt.eq b } lt.eq  & e^(m_0 \( q_(W_p \, u) \( h \) - q_(W_p \, alpha) \( h \) \) - lambda b) bb(E)_u e^(lambda cal(T)) frac(f_(cal(Q))^(u \, lambda) \( n upright(bold(1)) \), f_(W_p \, alpha \, h) \( n \)^(m_0)) . $ <edge:polar-tail>]
  This compares norm densities before and after the normalized tilt; it does not divide by the probability of a shrinking shell.
  For a pair take $cal(T) = plus.minus X^(sans(T)) X'$, $b = n w$, $u = iota w^2$, and $lambda = c' u$, with $c' > 0$ a sufficiently small absolute constant. We will choose $iota > 0$ small and then the lower multiple of $w \/ p$ large, so that $u gt.double p^2$. The Gaussian formula gives
  #[#set math.equation(numbering: n => "(3.34)")
   $ log bb(E)_u e^(lambda cal(T)) lt.eq C lambda^2 "Tr" R_(p \, u)^2 + C lambda parallel R_(p \, u) h parallel^2 lt.eq C n u^(3 \/ 2) + C_R k_p . $ <edge:quadratic-mgf>]
  Indeed $"Tr" R_(p \, u)^2 lt.eq C n \/ sqrt(u)$ and $parallel R_(p \, u) h parallel^2 lt.eq C_R n p^5 \/ u^2$; the pair quadratic has zero first trace in the centered Gaussian formula. For $cal(T) = parallel P_p X parallel^2$, $b = n w$, its extra first trace costs only $C k_p$. The choice of $c'$ preserves positive precision and covariance comparable to $u^(- 1) I_(m_0)$ on $c k_p$ active rows. Lemma 5 bounds the density ratio in (3.33) by $C_(m_0) \( u \/ p^2 \)^(m_0)$.
  For uncapped zero field start at $u = p^2$. The resolvent gives $n - "Tr" \( d + p^2 \)^(- 1) asymp n p$, a leading variance comparable to $p^(- 2)$, and variance $O \( n \/ p \)$ for the other squares. Chebyshev’s inequality puts the residual squared length to be supplied by that coordinate in $\[ c n p \, C n p \]$ with probability $1 - C \/ k_p$. On this interval its Gaussian-square density is at least $c sqrt(p \/ n) e^(- C k_p)$. Convolution gives the same lower density scale, with this extra exponential factor. The uncapped resolvent also gives (3.32), and the tilted upper density has the same band bound.
  The logarithm of the resulting probability is at most
  $ - c' iota n w^3 + C iota^(3 \/ 2) n w^3 + C_R k_p + O_(m_0) \( log \( u \/ p^2 \) \) . $
  Choose $iota$ so that $C sqrt(iota) < c' \/ 4$, and then $w \/ p$ larger than a sufficiently large fixed constant. Since $n w^3 = k_p \( w \/ p \)^3$, the last two terms are absorbed by another $c' iota n w^3 \/ 4$ when $K$ is large. This proves the pair bound. For projection put $w = v^2 p lt.eq 1$; then $n w^3 = k_p v^6$. For $v > p^(- 1 \/ 2)$ the event is empty because $parallel X parallel = sqrt(n)$. ◻
]

#thm([Corollary 3.5.])[
  (Growth of the limiting spectral rates).  #emph[For GOE-almost every $g$, and every $b$ with $b + g_1 > 0$, there are finite positive constants $c_(g \, b) \, C_(g \, b)$ such that 
#[#set math.equation(numbering: n => "(3.35)")
 $ c_(g \, b) \( 1 + i \)^(2 \/ 3) lt.eq g_i + b lt.eq C_(g \, b) \( 1 + i \)^(2 \/ 3) #h(2em) \( i gt.eq 1 \) . $ <edge:limit-rate-bounds>]

 They can be chosen measurably when $b$ is a measurable admissible function of $g$.]
] <edge:limit-growth>

#proof[
  Fix errors in Lemma 4 for which the number of points with $d_i lt.eq p^2$ is between $c n p^3$ and $C n p^3$, and apply it at the countable scales $n p^3 = 2^j K$. For any finite list, finite edge-coordinate convergence transfers the inequalities, with slightly enlarged constants, to counts of limiting points below $\( 2^j K \)^(2 \/ 3)$. A fixed small buffer in the endpoints may be used; the limiting process has no point at any of these countably many fixed endpoints. Increase the finite list and use continuity of probability for decreasing events. The uniform finite-$n$ event shows that all the limiting inequalities hold with probability arbitrarily close to one when $K$ is large. Letting that failure probability tend to zero shows that almost surely, after a finite threshold,
  $ c L^(3 \/ 2) lt.eq \# { i : g_i lt.eq L } lt.eq C L^(3 \/ 2) $
  on dyadic $L$, and hence on all large $L$ by monotonicity. Invert these inequalities, add $b$, and adjust the bounds for the finitely many remaining positive numbers $g_i + b$. The least integer threshold and rational bounds give measurable choices. ◻
]

=== 3.3 Comparison with the cube <comparison-with-the-cube>

The spherical estimates control deterministic fields. We next obtain one disorder event on which the corresponding cube estimates hold for every field and scale. The additional work is confined to $k_p = O \( sqrt(log n) \)$.

#thm([Lemma 3.6.])[
  (Two-replica overlap cells).  #emph[Let $ R_n = { - 1 + 2 j \/ n : 0 lt.eq j lt.eq n }$ and $I_r = \[ r - 1 \/ n \, r + 1 \/ n \]$. The overlap of two independent uniform cube spins has mass 
$ p_n \( r \) = 2^(- n) binom(n, n \( 1 + r \) \/ 2) \, #h(2em) r in  R_n \, $

 whereas the overlap of two independent uniform spherical spins has density 
$ f_n \( s \) = frac(Gamma \( n \/ 2 \), sqrt(pi) thin Gamma \( \( n - 1 \) \/ 2 \)) \( 1 - s^2 \)^(\( n - 3 \) \/ 2) \, #h(2em) - 1 < s < 1 . $

 For a sufficiently small fixed $rho_0 > 0$, uniformly for large $n$ and $r in  R_n$ with $\| r \| lt.eq rho_0$, 
#[#set math.equation(numbering: n => "(3.36)")
 $ p_n \( r \) lt.eq e^(C + C n r^4) integral_(I_r) f_n \( s \) thin upright(d) s . $ <edge:pair-cell-mass>]

 Let $H_2$ be the uniform law of an ordered orthonormal pair $\( q \, q' \)$. If a positive measurable angular weight $a_n \( s \, q \, q' \)$ has finite integrals and satisfies, for $H_2$-almost every frame, 
$ \| log a_n \( s \, q \, q' \) - log a_n \( r \, q \, q' \) \| lt.eq K_0 quad upright("for almost every ") s in I_r \, $

 then 
#[#set math.equation(numbering: n => "(3.37)")
 $ p_n \( r \) integral a_n \( r \, q \, q' \) thin upright(d) H_2 lt.eq e^(C + C n r^4 + K_0) integral_(I_r) #h(-0.16667em) integral a_n \( s \, q \, q' \) thin upright(d) H_2 thin f_n \( s \) thin upright(d) s . $ <edge:pair-cell-weighted>]

 The cells have disjoint interiors. Summing over their midpoints in an overlap interval enlarges the spherical interval by at most $1 \/ n$ at each endpoint.]
] <edge:gram-cell>

#proof[
  We derive this form for cells centered at lattice points from the two-replica calculations in #cite(label("CM")) Section 15.4, Equation (15.10) and #cite(label("FUA")) proof of Lemma 3.2. Set
  $ I \( r \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] \( 1 + r \) log \( 1 + r \) + \( 1 - r \) log \( 1 - r \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) J \( r \) = - 1 / 2 log \( 1 - r^2 \) . $
  Uniform Stirling bounds on $\| r \| lt.eq rho_0$ put $p_n \( r \)$ between fixed multiples of $n^(- 1 \/ 2) e^(- n I \( r \))$. The same bounds for the gamma ratio, and the bounded logarithmic oscillation of $f_n$ on $I_r$, put its cell integral between fixed multiples of $n^(- 1 \/ 2) e^(- n J \( r \))$. Since $J \( r \) - I \( r \) = O \( r^4 \)$, this proves (3.36). The assumed oscillation of the positive angular weight gives (3.37) by integration. The final assertion follows directly from the cell endpoints. ◻
]

#thm([Lemma 3.7.])[
  (A Haar second moment at the low scales).  #emph[On the spectral restrictions above, for every fixed spectral field in a prescribed ball and every $K lt.eq k_p$, $p lt.eq C_1 r_n$, 
#[#set math.equation(numbering: n => "(3.38)")
 $ E_U \( L_p \( h \) - 1 \)^2 lt.eq C_R n^(- 1 \/ 4) . $ <edge:likelihood-second-moment>]

 The field is fixed inside the expectation; the constant is uniform over the indicated fields and scales.]
] <edge:replica-comparison>

#proof[
  We adapt the two-replica calculation of #cite(label("FUA")) Lemma 3.2, Equations (3.3)–(3.4), whose stated observation range starts at $r_n$. The estimate below the source range is proved here. Conditional on $rho = n^(- 1) X^(sans(T)) X'$, the Haar angular integral for a cube pair is the spherical angular integral. On the ordered orthonormal sum-and-difference frame $\( q \, q' \)$, its exponent is
  #[#set math.equation(numbering: n => "(3.39)")
   $ Psi_(p \, h) \( s \; q \, q' \) = n / 2 #scale(x: 120%, y: 120%)[\(] \( 1 + s \) q^(sans(T)) W_p q + \( 1 - s \) q'^(sans(T)) W_p q' #scale(x: 120%, y: 120%)[\)] + sqrt(2 n \( 1 + s \)) thin h^(sans(T)) q . $ <edge:pair-angular-exponent>]
  On a fixed $\| s \| lt.eq 2 rho_0 < 1$, the spectral norm bound and the field bound $parallel h parallel lt.eq R sqrt(n) thin p^(5 \/ 2)$ give $\| partial_s Psi_(p \, h) \| lt.eq C_R n$. Thus the positive angular weight $e^(Psi_(p \, h))$ has a fixed logarithmic oscillation on every width-$2 \/ n$ cell, as required in (3.37). Retain $\| rho \| lt.eq C' r_n$, choosing $C'$ larger than the lower tail constant in Lemma 6 times $C_1$. On dyadic bands between $C' r_n$ and a small fixed $rho_0$, the weighted cell comparison costs $e^(C + C n rho^4)$, while Lemma 6 gives $C e^(- c n rho^3)$. The spherical band endpoints move by at most $1 \/ n$, negligible compared with $r_n$. Decreasing $rho_0$ makes the latter pay the former and leaves $C e^(- c n r_n^3)$. At overlaps bounded away from zero, the global spectral law, edge limit, and norm bound in (3.22) supply the global inputs for the uncapped zero-field angular comparison of #cite(label("CM")) Section 15.4. Indeed, for every fixed $w > 2$, they give
  $ 1 / n log det \( w I - W \) arrow.r integral log \( w - x \) rho_(upright("sc")) \( thin upright(d) x \) \; $
  interlacing gives the same per-site limit for every orthogonal-hyperplane compression. The cited deficit-filling lower bound then gives the full critical free-energy normalization by taking $n arrow.r oo$ at fixed $w > 2$, followed by $w arrow.b 2$. For clarity, the normalized zero-field contribution being bounded is
  $ cal(M)_n \( rho_0 \; bold(lambda) \) = E_U #h(-0.16667em) [L_compose^2 thin mu_W^(⊗ 2) { \| n^(- 1) X^(sans(T)) X' \| gt.eq rho_0 }] . $
  Here $bold(lambda) = \( lambda_1 \, dots.h \, lambda_n \)$ is fixed, $W = U "diag" \( bold(lambda) \) U^(sans(T))$, and $mu_W$ is the zero-field cube Gibbs law for this $W$. The comparison in #cite(label("CM")) Section 15.4, “Zero field and overlaps bounded away from zero”, together with the lower normalization in its Section 15.3, gives $cal(M)_n \( rho_0 \; bold(lambda) \) lt.eq exp { - kappa_(rho_0) n + o \( n \) }$ for a fixed $kappa_(rho_0) > 0$, along the retained spectral sequences with the preceding per-site errors uniform. This is a consequence of that proof; the norm bound supplies continuity at the endpoints. Changing to $W_p \, h$ changes weights and log normalizers by $O_R \( n p^2 + n p^(5 \/ 2) \) = o \( n \)$, so that region still contributes $e^(- c n)$.
  On retained cells of width $2 \/ n$, Stirling’s formula for the binomial overlap mass and the spherical density proportional to $\( 1 - rho^2 \)^(\( n - 3 \) \/ 2)$ gives relative error
  #[#set math.equation(numbering: n => "(3.40)")
   $ O \( n r_n^4 + r_n + n^(- 1) \) . $ <edge:retained-stirling>]
  This is the cell estimate in the cited replica proof, now with cutoff $C' r_n$ at every $p$. More precisely than the fixed bound above, the oscillation of (3.39) on one cell is at most
  $ C #scale(x: 120%, y: 120%)[\(] \| q^(sans(T)) W_p q - q'^(sans(T)) W_p q' \| + p^(5 \/ 2) #scale(x: 120%, y: 120%)[\)] \, $
  which is uniformly bounded. The normalized spherical integral of this expression on retained cells is $O \( r_n \)$. Indeed,
  $ q^(sans(T)) W_p q - q'^(sans(T)) W_p q' = frac(2 X^(sans(T)) W_p X' - rho \( X^(sans(T)) W_p X + X'^(sans(T)) W_p X' \), n \( 1 - rho^2 \)) . $
  The diagonal terms cost $O \( r_n \)$. For the cross term, tilt a Gaussian pair at the cap saddle by $plus.minus c p^2 X^(sans(T)) W_p X'$, with $c$ small enough to preserve a fixed precision margin. The Gaussian logarithmic moment is $O_R \( k_p \)$, since $"Tr" R_(p \, alpha)^2 = O \( n \/ p \)$ and $parallel R_(p \, alpha) h parallel^2 = O_R \( n p \)$. The replica density bound (3.25) costs a fixed factor. Hence
  $ Pr_(upright("sp")) { \| X^(sans(T)) W_p X' \| > t } lt.eq C e^(C_R k_p - c p^2 t) . $
  Integrating from a sufficiently large multiple of $n p$ gives $bb(E)_(upright("sp")) \| X^(sans(T)) W_p X' \| lt.eq C_R n p lt.eq C_R n r_n$. This full probability integral also bounds its unnormalized restriction to retained cells.
  The bounded oscillation permits the mean value theorem for exponentials. After integration and summation over disjoint cells, the error is the preceding integrated $O \( r_n \)$; no supremum over frames is taken. Slightly enlarged boundary cells are paid by the pair tail. Thus
  $ E_U L_p \( h \)^2 lt.eq 1 + C_R { n r_n^4 + r_n + n^(- 1) + e^(- c n r_n^3) } . $
  Use $E_U L_p \( h \) = 1$, $n r_n^4 = n^(- 1 \/ 3 + 4 dot.op 10^(- 4))$, and $n r_n^3 = n^(3 dot.op 10^(- 4))$ to obtain (3.38). ◻
]

#thm([Lemma 3.8.])[
  (Uniform cube cap estimates).  #emph[The static, curvature, and projection assertions (3.10)–(3.12) hold on ordinary Gaussian disorder events of arbitrarily large limiting probability, with a tight threshold and every fixed field radius, tolerance, and scale buffer prescribed in Proposition 3. The projection bound also holds for $P_q X \/ M_q$ under a cap interpolated linearly between $B_p$ and $B_q$, whenever $q gt.eq p$, $q \/ p$ is bounded, and the field lies in a fixed $q$-field ball.]
] <edge:cube-caps>

#proof[
  On dyadic $p$ and $v$, the spherical tail and (3.7) give
  $ E_U \[ upright(bold(1))_({ L_compose gt.eq 1 \/ 2 }) mu { parallel P_p X parallel > v M_p } \] lt.eq C e^(- c k_p v^6) . $
  Markov’s inequality with half the exponent has total failure at most
  $ sum_(j \, l gt.eq 0) C e^(- c K thin 8^j 64^l) lt.eq C e^(- c' K) . $
  The discarded $L_compose < 1 \/ 2$ event has probability $o \( 1 \)$ by (3.5). Monotonicity of $P_p$, and a fixed-factor change in $M_p$, extend the uncapped result to every $p \, v$.
  The posterior tails follow deterministically. For $q gt.eq p$ of bounded ratio, let $B_theta$ lie between $B_p$ and $B_q$. It is positive, supported on $cal(H)_q$, and has norm at most $C q^2$. Restricting the uncapped normalizer to $parallel P_q X parallel lt.eq V M_q$ gives
  $ mu e^(- X^(sans(T)) B_theta X \/ 2) gt.eq e^(- C k_q) $
  for a fixed large $V$. The zero-field capped law is even, so its normalizer for a linear field is at least one. On the shell $parallel P_q X parallel asymp v M_q$, a field of norm at most $R q^2 M_q$ costs at most $R k_q v$. This and the denominator cost are absorbed by the uncapped $e^(- c k_q v^6)$ tail for large $v$. This proves the posterior tail, including the interpolated assertion. The spherical argument is identical. The first two projection moments under all these posteriors are consequently bounded by $C_R M_q$ and $C_R M_q^2$.
  For nearby scales and fields, integrating first derivatives of the log partition function gives
  #[#set math.equation(numbering: n => "(3.41)")
   $ \| Delta phi.alt \| lt.eq C_R k_q (\| Delta log p \| + frac(parallel Delta h parallel, q^2 M_q)) \, $ <edge:potential-interpolation>]
  and likewise for $phi.alt^(upright("sp"))$. Indeed, $parallel B_q - B_p parallel lt.eq C q^2 \| log \( q \/ p \) \|$ on $cal(H)_q$; its derivative is controlled by the second projection moment and the field derivative by the first. Fields in the smaller space are compared in $cal(H)_q$.
  Cover $K lt.eq k_p lt.eq C_0 sqrt(log n)$, with fixed $C_0$ large enough to overlap the source cutoff. Net scales from above and their spectral field balls at resolution $eta \/ \( C_R \( 1 + C_0 sqrt(log n) \) \)$ in the units of (3.41). Conditional on the spectrum, these are deterministic nets. Since $dim cal(H)_p lt.eq C k_p$, their total size is
  $ exp { O_(eta \, R) \( sqrt(log n) log log n \) } = n^(o \( 1 \)) . $
  At a net point (3.38) and Chebyshev give $Pr_U \( \| log L_p \( h \) \| > eta \/ 2 \) lt.eq C_eta n^(- 1 \/ 4)$. The union bound and (3.41) yield
  #[#set math.equation(numbering: n => "(3.42)")
   $ sup_(K lt.eq k_p lt.eq C_0 sqrt(log n)\
parallel h parallel lt.eq R p^2 M_p) \| phi.alt_p \( h \) - phi.alt_p^(upright("sp")) \( h \) \| lt.eq eta $ <edge:absolute-value-comparison>]
  with failure $n^(- 1 \/ 4 + o \( 1 \))$, in addition to the projection event. For $k_p gt.eq c sqrt(log n)$, the cap and interpolation results of #cite(label("FUA")) Proposition 2.6, Equation (2.11), and Lemma 2.7 apply as stated, since $C_1 r_n$ is eventually below their fixed upper cutoff. Together these prove the value comparison at every scale.
  For the mean, use this comparison on a larger ball. For unit $v in cal(H)_p$, freeze $alpha = alpha_p \( h \)$. The polar formula and Lemma 5 give
  $ log mu_(p \, h)^(upright("sp")) e^(plus.minus t v^(sans(T)) \( X - R_(p \, alpha) h \)) lt.eq 1 / 2 t^2 v^(sans(T)) R_(p \, alpha) v + C . $
  The cube bound has the additional $2 epsilon.alt_v k_p$. Jensen with $t = theta p^2 M_p$, in the direction of the projected mean discrepancy, gives
  $ frac(parallel P_p m_p \( h \) - R_(p \, alpha) h parallel, M_p) lt.eq C_R theta + frac(2 epsilon.alt_v + C \/ k_p, theta) . $
  Choose $theta$ from the required mean tolerance, then impose a smaller value tolerance and increase $K$.
  It remains to prove the Hessian assertion on the low range. Put $hat(R) = R_(p \, alpha_p \( h \))$, $m = hat(R) h$, and $sigma^2 = 2 "Tr" hat(R)^2 + 4 m^(sans(T)) hat(R) m$. For a unit $v in cal(H)_p$ and $\| theta \| lt.eq 1$, the shift $h + theta p v$ fits a fixed larger ball because $p \/ \( p^2 M_p \) = k_p^(- 1 \/ 2)$. Freezing $alpha$, the exact polar formula is
  $ log mu_(p \, h)^(upright("sp")) e^(theta p v^(sans(T)) \( X - m \)) = 1 / 2 theta^2 p^2 v^(sans(T)) hat(R) v + log frac(f_(alpha \, h + theta p v) \( n \), f_(alpha \, h) \( n \)) . $
  The shifted mean $m_theta = m + theta p hat(R) v$ satisfies
  $ sigma_theta^2 / sigma^2 = 1 + O_R \( k_p^(- 1 \/ 2) \) \, #h(2em) frac(n - bb(E)_theta parallel Y parallel^2, sigma_theta) = - frac(2 theta p chevron.l m \, hat(R) v chevron.r, sigma) + O_R \( k_p^(- 1 \/ 2) \) . $
  The leading term is uniformly bounded. The density estimate (3.29), at this argument and at zero, gives
  #[#set math.equation(numbering: n => "(3.43)")
   $ log mu_(p \, h)^(upright("sp")) e^(theta p v^(sans(T)) \( X - m \)) & = 1 / 2 theta^2 v^(sans(T)) Gamma_(p \, h) v + O_R \( k_p^(- 1 \/ 2) \) \,\
Gamma_(p \, h) & = p^2 (hat(R) \|_(cal(H)_p) - 4 / sigma^2 \( hat(R) m \) ⊗ \( hat(R) m \)) . $ <edge:frozen-mgf-curvature>]
  This is uniform in $h \, v \, theta$. Cauchy–Schwarz and $sigma^2 gt.eq 4 m^(sans(T)) hat(R) m$ imply $0 prec.curly.eq Gamma_(p \, h) prec.curly.eq C_R I$. Equation (3.42) changes the log moment by at most $2 eta$, so the cube error is at most $delta = C_R K^(- 1 \/ 2) + 2 eta$.
  To justify differentiating this approximation, suppose a real $Z$ obeys
  $ sup_(\| theta \| lt.eq 1) lr(|log bb(E) e^(theta Z) - a theta^2 \/ 2|) lt.eq delta \, #h(2em) 0 lt.eq a lt.eq C \, quad 0 < delta lt.eq 1 \/ 16 . $
  The values at $plus.minus 1$ bound $bb(E) e^(\| Z \|)$, and hence bound the fourth derivative of $psi \( theta \) = log bb(E) e^(theta Z)$ on $\[ - 1 \/ 2 \, 1 \/ 2 \]$. Taylor’s formula gives
  $ lr(|psi'' \( 0 \) - frac(psi \( t \) + psi \( - t \) - 2 psi \( 0 \), t^2)|) lt.eq C_C t^2 . $
  The assumed error changes this quotient by at most $2 delta \/ t^2$. With $t = delta^(1 \/ 4)$, this proves $\| "Var" Z - a \| lt.eq C_C sqrt(delta)$. Applying it to $Z = p v^(sans(T)) \( X - m \)$, for every unit $v$, yields
  #[#set math.equation(numbering: n => "(3.44)")
   $ parallel p^2 K_p \( h \) - Gamma_(p \, h) parallel lt.eq C_R sqrt(C_R K^(- 1 \/ 2) + 2 eta) . $ <edge:hessian-approximation>]
  On the annulus put $t = alpha \/ p^2$, $A = \( n - "Tr" hat(R) \) \/ \( n p \)$, $B = \( p \/ n \) "Tr" hat(R)^2$, and $e = h \/ parallel h parallel$. Since $hat(R) \|_(cal(H)_p) = p^(- 2) \( 1 + t \)^(- 1) I$ and $m$ is parallel to $e$,
  $ chevron.l e \, Gamma_(p \, h) e chevron.r = frac(B, \( 1 + t \) B + 2 A) . $
  The trace estimates and denominator comparison give $A = b_0 + O \( epsilon.alt_(upright("sp")) + s_0 \)$ and $B = 2 b_0 + O \( epsilon.alt_(upright("sp")) + s_0 \)$, so this is $1 \/ 2 + O \( epsilon.alt_(upright("sp")) + s_0 \)$. All other quadratic directions are bounded above by $\( 1 - s_0 \)^(- 1)$. Choose the spectral accuracy and $s_0$ small, then $eta$ small and $K$ large in (3.44). This proves the annular curvature and radial deficit. On the entire ball, the saddle gap and the same estimate give $C_R p^(- 2)$, with $C_R$ fixed before the annular tolerance. The source curvature assertion covers the higher range. ◻
]

=== 3.4 Location and covariance of the observation path <location-and-covariance-of-the-observation-path>

The uniform cap event controls external fields. We now locate the random field produced by the Gibbs observation. A shrinking annulus will give an averaged covariance estimate; a fixed annulus gives the stronger exponential tail needed in Proposition 3.

We first state the additional eigenvalue-only restriction used for norm conditioning. Put

$ b_n = 1 + \( - g_(1 \, n) \)_(+) \, #h(2em) ell_(a \, n) = \( g_(a \, n) + b_n \)^(- 1) \, #h(2em) D_n = n^(1 \/ 3) - sum_a ell_(a \, n) \, $

and let $q_n$ be the density of $sum_a ell_(a \, n) \( xi_a^2 - 1 \)$ for independent standard normal $xi_a$. For every $chi > 0$, one may fix sufficiently large integers $m \, J_chi$ and positive constants $c_chi \, C_chi$ so that an eigenvalue-only event $cal(S)_n^(upright("ann")) \( chi \)$ satisfies $liminf_n bb(P) \( cal(S)_n^(upright("ann")) \( chi \) \) gt.eq 1 - chi$ and, on it,

#[#set math.equation(numbering: n => "(3.45)")
 $ b_n lt.eq C_chi \, #h(2em) ell_(a \, n) gt.eq c_chi quad \( 1 lt.eq a lt.eq m \) \,\
g_(a \, n) gt.eq C_chi^(- 1) a^(2 \/ 3) quad \( J_chi < a lt.eq n \) \, #h(2em) q_n \( D_n \) gt.eq c_chi . $ <edge:conditioned-spectral-event>]

These restrictions follow from the eigenvalue bounds in #cite(label("FUA")) Lemma 2.1, finite edge-coordinate convergence, and the density argument in its Proposition 2.3. We intersect this event with the local spectral event of Lemma 4 and $cal(S)_n^(upright("glob"))$, assigning a portion of the prescribed failure probability to it. The eigenvalue events of #cite(label("FUA")) Lemma 2.5 needed for (3.5) are retained separately. All constants below may depend on the prescribed confidence; no fixed density lower bound on an event of probability $1 - o \( 1 \)$ is asserted.

#thm([Lemma 3.9.])[
  (The observation annuli).  #emph[On the fixed spectral restrictions, there are $a_(upright("an")) \, c \, C > 0$ such that for every dyadic interval $\[ q \, 2 q \]$ with fixed buffers inside the enlarged scale range, 
#[#set math.equation(numbering: n => "(3.46)")
 $ upright(bold(P)) {exists p in \[ q \, 2 q \] : \| alpha_p \( h_p \) \| > C k_p^(- 1 \/ 10) p^2} lt.eq C e^(- c k_q^(a_(upright("an")))) . $ <edge:shrinking-annulus>]

 For every fixed $zeta > 0$, after increasing the threshold, 
#[#set math.equation(numbering: n => "(3.47)")
 $ upright(bold(P)) {exists p in \[ q \, 2 q \] : \| alpha_p \( h_p \) \| > zeta p^2} lt.eq C_zeta e^(- c_zeta k_q) . $ <edge:fixed-annulus-biased>]

 Consequently (3.13) holds simultaneously at every scale on ordinary disorder events of arbitrarily large limiting probability.]
] <edge:path-annuli>

#proof[
  By (3.5), under $upright(bold(P))$ the spectral spin is spherical. Its Gaussian representation is that of #cite(label("FUA")) Proposition 2.3. The annulus calculation in #cite(label("FUA")) Lemma 3.1, Equation (3.1) is stated for the source observation range beginning at $r_n$; the tight-threshold dyadic estimates below extend that calculation to the scales used here. Set $D'_i = d_i + b_n n^(- 2 \/ 3) = n^(- 2 \/ 3) \( g_(i \, n) + b_n \)$. Before conditioning, let $Y_i$ be independent $N \( 0 \, \( D'_i \)^(- 1) \)$; conditioning on $sum_i Y_i^2 = n$ gives the spherical law. The definition of $b_n$ gives $min_i D'_i gt.eq n^(- 2 \/ 3)$, while (3.45) supplies the fixed leading variance lower bounds. The density of $n^(- 2 \/ 3) sum_i Y_i^2$ at $n^(1 \/ 3)$ is exactly $q_n \( D_n \)$, and hence is bounded below on the chosen spectral set. The same set and the active count give
  #[#set math.equation(numbering: n => "(3.48)")
   $ sum_(d_i lt.eq p^2) \( D'_i \)^(- 1) = n^(2 \/ 3) sum_(d_i lt.eq p^2) ell_(i \, n) lt.eq C n^(2 \/ 3) \( 1 + k_p^(1 \/ 3) \) lt.eq C n p . $ <edge:leading-resolvent-sum>]
  Indeed the first $J_chi$ terms are bounded by one, and the remaining terms are bounded by $C_chi i^(- 2 \/ 3)$.
  Let $theta.alt = p^2 + b_n n^(- 2 \/ 3)$ and, before conditioning, write $h_(p \, i) = B_(p \, i) Y_i + B_(p \, i)^(1 \/ 2) Z_i$. The quadratic form obtained from $parallel h_p parallel^2 - theta.alt^2 parallel Y parallel^2$ has mean $- theta.alt^2 "Tr" R_(p \, b_n n^(- 2 \/ 3))$. On an active coordinate the coefficient of the standardized $Y_i^2$ term is
  $ frac(B_(p \, i)^2 - theta.alt^2, D'_i) = D'_i - 2 theta.alt = O \( p^2 \) \; $
  the cross coefficient is $O \( p^3 \/ sqrt(D'_i) \)$. Equation (3.48) and the capped second trace bound therefore show that the matrix of this quadratic form, in the standardized $\( Y \, Z \)$ variables, satisfies
  $ parallel sans(A)_p parallel_(upright(F))^2 lt.eq C p^4 k_p \, #h(2em) parallel sans(A)_p parallel lt.eq C p^2 k_p^(1 \/ 3) . $
  The Gaussian quadratic-form moment formula for its centered version bounds a deviation of $p^2 k_p^(9 \/ 10)$ by
  $ C exp [- c min { k_p^(4 \/ 5) \, k_p^(17 \/ 30) }] . $
  This remains true after norm conditioning, with a constant loss. Indeed use the same exponential tilt, with parameter at most one eighth of $parallel sans(A)_p parallel^(- 1)$. Its joint covariance and its $Y$-marginal covariance stay comparable to the originals. A fixed number of the leading marginal variances bounds the density of $n^(- 2 \/ 3) parallel Y parallel^2$ from above by a constant, through the characteristic formula (3.27). The original density at $n^(1 \/ 3)$ is bounded below on the chosen spectral set. The polar density ratio therefore costs a constant.
  After conditioning, the deterministic target for $parallel h_p parallel^2$ is $ell_p \( b_n n^(- 2 \/ 3) \)^2 asymp p^2 k_p$. The preceding error is a relative $O \( k_p^(- 1 \/ 10) \)$. It first places the inferred saddle in a fixed annulus. On that annulus $upright(d) \( ell_p \( u \)^2 \) \/ upright(d) u asymp k_p$. Hence
  $ \| alpha_p \( h_p \) - b_n n^(- 2 \/ 3) \| lt.eq C p^2 k_p^(- 1 \/ 10) . $
  Since $b_n n^(- 2 \/ 3) \/ p^2 = O \( k_p^(- 2 \/ 3) \)$, this proves the fixed-scale version of (3.46).
  For a whole interval use a mesh of spacing $k_q^(- 3)$ in $log p$. Its size is polynomial in $k_q$. Except with $C e^(- c k_q)$ probability, the spherical projection at the upper endpoint is at most $C M_q$, by Lemma 6. The signal increments on a mesh gap are then at most $C q^2 M_q k_q^(- 3)$. The noise increments have covariance norm $O \( q^2 k_q^(- 3) \)$. A constant-resolution net of the sphere in $O \( k_q \)$ dimensions and the Gaussian maximal inequality show that their norm on every gap is less than $q^2 M_q k_q^(- 1 \/ 10)$, except with $C e^(- c k_q)$ probability. The target length is Lipschitz in the same scaled units: between activations differentiate the capped trace, using the active count and second trace; the target is continuous at activations. These observations interpolate the fixed-scale bound. The polynomial mesh size is absorbed by decreasing the positive exponent, proving (3.46).
  For a fixed $zeta$, it suffices by inclusion to treat $zeta$ below a fixed small annulus width. The stronger exponent follows from a different Gaussian reference, following the source-range fixed saddle test in #cite(label("CM")) Section 19.2, Equation (19.9) and its proof. Fix a small $xi > 0$, to be chosen after $zeta$, and let
  $ R_xi = \( 2 + xi p^2 - W \)^(- 1) \, #h(2em) Y tilde.op N \( 0 \, R_xi \) \, #h(2em) h_p = B_p Y + beta_p . $
  Increase $K$ so that $d_1 gt.eq - xi p^2 \/ 2$. The vector $a_(p \, xi) = R_(p \, xi p^2) h_p$ is centered Gaussian with covariance
  $ C_(p \, xi) = R_xi - R_(p \, xi p^2) . $
  The resolvent and clipped traces give
  $ lr(|"Tr" C_(p \, xi) - \( n - "Tr" R_(p \, 0) \)|) lt.eq C sqrt(xi) thin n p + o_K \( n p \) \, #h(2em) parallel C_(p \, xi) parallel lt.eq C \( xi p^2 \)^(- 1) \, #h(2em) "Tr" C_(p \, xi)^2 lt.eq C n \/ \( sqrt(xi) thin p \) . $
  For a fixed multiple of $n p$, exponential Markov with both signs of a sufficiently small multiple of $xi p^2$ therefore gives a deviation cost $e^(- c_zeta xi k_p)$, once $xi$ is sufficiently small. The centered logarithmic moment costs $O \( xi^(3 \/ 2) k_p \)$, whereas the Markov gain is a fixed multiple of $zeta xi k_p$.
  We spell out the norm-conditioning cost. The deficit $n - "Tr" R_xi$ is between fixed multiples of $sqrt(xi) thin n p$, after increasing $K$ for this fixed $xi$. A leading variance is comparable to $\( xi p^2 \)^(- 1)$; the other squared norms have variance at most $C n \/ \( sqrt(xi) thin p \)$. Chebyshev places the residual length in a fixed interval comparable to $sqrt(xi) thin n p$ when $K gt.double xi^(- 3 \/ 2)$. On this interval the leading Gaussian-square density is at least
  $ C_xi^(- 1) sqrt(p \/ n) exp \( - C xi^(3 \/ 2) k_p \) . $
  This is a lower bound for the original norm density by convolution. Under the quadratic tilt used above, the marginal covariance of $Y$ retains $c k_p$ independent spectral rows with covariance comparable to $p^(- 2)$; the tilt keeps the joint covariance comparable. Equation (3.25) bounds its norm density by $C_xi sqrt(p \/ n)$. Thus conditioning costs at most $C_xi e^(C xi^(3 \/ 2) k_p)$.
  Since $R_(p \, 0) h_p = \( 1 + xi \) R_(p \, xi p^2) h_p$, compare the saddle length at the two boundaries $alpha = plus.minus zeta p^2$. The derivative bounds in (3.26), and monotonicity beyond those boundaries, put ${ \| alpha_p \( h_p \) \| > zeta p^2 }$ inside the relaxed squared-length deviation just bounded. Choose $xi$ so that its $O \( sqrt(xi) \)$ target error fits the $zeta$ tolerance and $C xi^(3 \/ 2) < c_zeta xi \/ 2$. The conditioned deviation then has probability $C_zeta e^(- c'_zeta k_p)$. The same $k_q^(- 3)$ mesh proves (3.47).
  Finally take $q_j = 2^j \( K \/ n \)^(1 \/ 3)$. By (3.7) and Markov, the ordinary whole-interval probability is at most $C e^(- c k_(q_j))$ outside disorder probability $C e^(- c k_(q_j))$, after decreasing $c$. Their sum is
  $ sum_(j gt.eq 0) C e^(- c K 8^j) lt.eq C e^(- c' K) . $
  Use (3.5) for $L_compose < 1 \/ 2$ and increase $K$. Every scale lies in one such interval and $k_p asymp k_(q_j)$ there, proving (3.13) simultaneously in $p$. ◻
]

We now fix the finite set of auxiliary radii, buffers, and tolerances used in the covariance argument. Fix once a sufficiently small $gamma > 0$, as specified by the compression argument below. Then choose finite $C_(*)$ so that the range through $C_(*) r_n$ contains all parent intervals $\[ q \/ \( 2 gamma \) \, q \/ gamma \]$, $q lt.eq r_n$, and their prescribed enlargements, as well as the range through $C_1 r_n$. Choose $eta$ sufficiently small compared with $gamma^2$, and an auxiliary curvature tolerance $epsilon.alt_(upright("aux"))$ sufficiently small compared with $eta$; it may be smaller than the prescribed $epsilon.alt_0$. The extension construction below prescribes an auxiliary width $s_(upright("aux"))$, static tolerances, radii, and a threshold for these choices. They are further cap requests under the finite-intersection convention after Proposition 3. Let $cal(G)_n^(upright("aux"))$ be the event, measurable from $W$, on which Lemma 10 holds with these choices. Let $cal(G)_n^(upright("FUA"))$ be the entire good-disorder event $cal(G)_n$ defined in #cite(label("FUA")) Section 3 for its Proposition 4.2, with that source’s fixed tolerances and full scale and field ranges. This event has ordinary Gaussian-disorder probability tending to one. Set $cal(G) = cal(G)_n^(upright("aux")) ∩ cal(G)_n^(upright("FUA"))$. Below we use the source covariance conclusion on the terminal interval $\[ r_n \, C_gamma r_n \]$, which is contained in its stated interval $\[ r_n \, p_(*) \]$ for all sufficiently large $n$. All probabilities below are measured under $upright(bold(P))$ before restriction to $cal(G)$. On each chosen spectral set, the constants are uniform.

#thm([Lemma 3.10.])[
  (Integrated score and covariance error).  #emph[Let $I = \[ q \, 2 q \]$, with a prescribed fixed multiplicative enlargement inside the scale range. At path fields write 
$ a_p = P_p \( m_p - m_p^(upright("sp")) \) \, #h(2em) D_p = p^2 K_p - I_(cal(H)_p) . $

 There are $c \, C \, a_1 > 0$ such that 
#[#set math.equation(numbering: n => "(3.49)")
 $ upright(bold(P)) {integral_I parallel a_p parallel^2 thin upright(d) \( p^2 \) > C k_q^(1 \/ 2)} lt.eq C e^(- c k_q^(a_1)) \, $ <edge:score-bound>]

 and 
#[#set math.equation(numbering: n => "(3.50)")
 $ upright(bold(P)) (cal(G) ∩ {integral_q^(2 q) frac(parallel D_p parallel_(upright(F))^2, k_p) thin upright(d) log p > C k_q^(- 1 \/ 5)}) lt.eq C e^(- c k_q^(a_1)) . $ <edge:frobenius-bound>]

 The same statements hold for every fixed enlargement of $I$, with adjusted constants. They are probability statements; no expectation of the untruncated score on their failures is asserted.]
] <edge:score-covariance>

#proof[
  Put $t = p^2$, and include $U$ in the observation filtration, so that every disorder event is measurable at time zero. The exact likelihood identity (3.6) yields
  #[#set math.equation(numbering: n => "(3.51)")
   $ upright(d) log L_(sqrt(t)) = a_(sqrt(t)) dot.op upright(d) cal(B)_t + 1 / 2 parallel a_(sqrt(t)) parallel^2 thin upright(d) t \, $ <edge:likelihood-sde>]
  where $cal(B)$ is the continuous cube innovation martingale with $upright(d) chevron.l cal(B) chevron.r_t = P_(sqrt(t)) thin upright(d) t$; the coefficients lie in the active space. This is the exact filtering calculation in #cite(label("FUA")) proof of Lemma 3.5, after Equation (3.7); it follows as well by differentiating the posterior partition function, including the interaction change $- upright(d) B_(sqrt(t))$. There is no jump in $log L$ at activation.
  At a deterministic endpoint and for $H > 0$, (3.6) gives
  $ upright(bold(P)) \( log L_p < - H \) lt.eq e^(- H) . $
  For a fixed $R_0$ containing the path annulus, put $cal(U)_p = { tilde(h) : parallel tilde(h) parallel lt.eq R_0 p^2 M_p }$. Lemma 9 gives
  $ upright(bold(P)) \( log L_p > H \, h_p in cal(U)_p \) lt.eq e^(- H) integral_(cal(U)_p) Q^(upright("sp")) \( upright(d) tilde(h) \) thin E_U L_p \( tilde(h) \)^2 lt.eq \( 1 + C n^(- 1 \/ 4) \) e^(- H) . $
  The field in the inner expectation is deterministic. Lemma 11 excludes the complementary endpoint fields with probability $C e^(- c k_q^(a_(upright("an"))))$.
  On an enlarged interval write $cal(J)_I = integral parallel a_p parallel^2 thin upright(d) \( p^2 \)$ and $M = integral a_p dot.op upright(d) cal(B)_(p^2)$. On the two endpoint events just given, $M + cal(J)_I \/ 2 lt.eq 2 H$. If $cal(J)_I gt.eq 8 H$, then $M lt.eq - cal(J)_I \/ 4$. The positive exponential supermartingale $exp \( - M \/ 4 - cal(J)_I \/ 32 \)$ bounds this event by $e^(- H \/ 4)$. Taking $H = C k_q^(1 \/ 2)$ proves (3.49).
  Between activations the two filtering equations give, with $Delta_t = K_(sqrt(t)) - K_(sqrt(t))^(upright("sp"))$,
  $ upright(d) a_(sqrt(t)) = Delta_t thin upright(d) cal(B)_t - K_(sqrt(t))^(upright("sp")) a_(sqrt(t)) thin upright(d) t . $
  Choose a smooth nonnegative cutoff $chi \( t \)$, equal to one on the target interval, zero at the ends of a fixed enlargement, and with $\| t chi' \( t \) \| lt.eq C$. The integrated Itô identity is
  #[#set math.equation(numbering: n => "(3.52)")
   $ integral chi t parallel Delta_t parallel_(upright(F))^2 thin upright(d) t =  & - integral \( chi + t chi' \) parallel a_(sqrt(t)) parallel^2 thin upright(d) t + 2 integral chi t chevron.l a_(sqrt(t)) \, K_(sqrt(t))^(upright("sp")) a_(sqrt(t)) chevron.r thin upright(d) t\
 & - cal(M) - sum_j chi \( t_j \) t_j parallel Delta P_j \( m_(sqrt(t_j)) - m_(sqrt(t_j))^(upright("sp")) \) parallel^2 \,\
cal(M) =  & 2 integral chi t chevron.l a_(sqrt(t)) \, Delta_t thin upright(d) cal(B)_t chevron.r . $ <edge:score-energy>]
  Here $Delta P_j$ is the jump of $P_(sqrt(t))$ at the activation time $t_j$. The sum has the favorable sign. On $cal(G)$ and the whole-path annulus event, the coarse bounds give $parallel t K_(sqrt(t)) parallel + parallel t K_(sqrt(t))^(upright("sp")) parallel lt.eq C$. Thus the left side on the target interval is bounded by $C cal(J)_I + C \| cal(M) \|$.
  For concentration, stop only the stochastic integral at the first annulus failure, and set its integrand to zero on $cal(G)^c$. The latter event is measurable at time zero. The stopped bracket is at most $C cal(J)_I$, and the stopped integral agrees with $cal(M)$ on $cal(G)$ and the whole-path annulus event. The exponential bracket inequality, (3.49), and (3.46) consequently bound the target integral of $parallel p^2 \( K_p - K_p^(upright("sp")) \) parallel_(upright(F))^2 thin upright(d) log p$ by $C k_q^(1 \/ 2)$, with the required exceptional probability intersected with $cal(G)$. The full identity (3.52) was not stopped, so it has no terminal boundary term.
  On the shrinking annulus, rotational invariance inside the flat cap gives one spherical transverse covariance eigenvalue $kappa_perp$ and one radial eigenvalue. The frozen linear moment bound at shifts $plus.minus p e$ gives
  $ \| e^(sans(T)) \( m_p^(upright("sp")) - R_(p \, alpha) h_p \) \| lt.eq C \/ p . $
  Since $kappa_perp = \( e^(sans(T)) m_p^(upright("sp")) \) \/ parallel h_p parallel$ and $parallel h_p parallel asymp p^2 M_p$,
  $ \| p^2 kappa_perp - 1 \| lt.eq C \( k_p^(- 1 \/ 10) + k_p^(- 1 \/ 2) \) . $
  The scaled radial covariance is bounded by the spherical version of (3.44). There are $O \( k_p \)$ transverse dimensions and one radial dimension, so
  $ frac(parallel p^2 K_p^(upright("sp")) - I parallel_(upright(F))^2, k_p) lt.eq C \( k_p^(- 1 \/ 5) + k_p^(- 1) \) . $
  Combine this with the preceding cube–sphere covariance estimate, divide by $k_q asymp k_p$, and decrease $a_1 > 0$ if necessary. This proves (3.50). ◻
]

=== 3.5 The covariance iteration and exact-scale variance <the-covariance-iteration-and-exact-scale-variance>

The Frobenius estimate says that most directions have a small covariance error on average over a scale interval. To control the largest positive error, compare a child cap to a larger parent cap. The radial deficit puts every positive error in the tangent space of the parent field; the unused Haar rotation then dilutes it in the smaller child space.

Use the fixed small $gamma > 0$ above. Let $q$ be a child scale and $p$ a parent scale with $x = q \/ p in \[ gamma \, 2 gamma \]$, and put $Delta = B_p - B_q$. Conditional on $W$ and observations through $q$, $h_p$ has law

#[#set math.equation(numbering: n => "(3.53)")
 $ sans(T)_(q \, p \, h_q) \( upright(d) y \) = frac(e^(phi.alt_p \( y \)) N \( h_q \, Delta \) \( upright(d) y \), integral e^(phi.alt_p \( z \)) N \( h_q \, Delta \) \( upright(d) z \)) . $ <edge:transition>]

The Gaussian is on the positive-increment space. Its covariance compressed to $cal(H)_q$ is $Delta_q = \( 1 - x^2 \) p^2 I_(cal(H)_q)$. Differentiation of the convolution gives the exact identity from #cite(label("FUA")) Section 4.1, Equation (4.3),

#[#set math.equation(numbering: n => "(3.54)")
 $ K_q = Delta_q^(- 1) \[ "Cov"_(sans(T)_(q \, p \, h_q)) \( h_p \) \]_(cal(H)_q) Delta_q^(- 1) - Delta_q^(- 1) . $ <edge:transition-covariance>]

#thm([Lemma 3.11.])[
  (An extension on the parent annulus).  #emph[Choose $eta > 0$ sufficiently small compared with $gamma^2$, then the coarse curvature tolerance $epsilon.alt_(upright("aux"))$ sufficiently small compared with $eta$. One can choose $s_(upright("aux"))$, the static tolerances, and the threshold $K$ so that the following holds on $cal(G)$. For every child field satisfying $\| alpha_q \( h_q \) \| lt.eq s_(upright("aux")) q^2$, put 
$ cal(A)_p = { h : \| alpha_p \( h \) \| lt.eq s_(upright("aux")) p^2 \/ 2 } \, #h(2em) cal(A)_p^(+) = { h : \| alpha_p \( h \) \| < 3 s_(upright("aux")) p^2 \/ 4 } . $

 There is a semiconcave extension $macron(phi.alt)_p$ with upper Hessian bound $\( 1 + eta \) p^(- 2) I$, agreeing with $phi.alt_p$ on $cal(A)_p^(+)$. Moreover, $"dist" \( cal(A)_p \, \( cal(A)_p^(+) \)^c \) gt.eq c_(upright("buf")) p^2 M_p$ for a fixed $c_(upright("buf")) > 0$. Under both $sans(T)_(q \, p \, h_q)$ and the transition obtained by replacing $phi.alt_p$ with $macron(phi.alt)_p$, the probability of $cal(A)_p^c$ is at most $C e^(- c_1 k_p)$. The same bound holds with any fixed polynomial moment of $parallel h_p parallel \/ \( p^2 M_p \)$ inserted, after decreasing $c_1 > 0$. All constants are uniform in the indicated fields and scales.]
] <edge:annular-extension>

#proof[
  We verify the deterministic extension proof of #cite(label("FUA")) Lemma 4.3, following #cite(label("CM")) Proposition 16.1, with the new lower threshold. On ${ \| alpha_p \| lt.eq 3 s_(upright("aux")) p^2 \/ 4 }$ take the infimum, over $z$, of
  $ phi.alt_p \( z \) + nabla phi.alt_p \( z \) dot.op \( y - z \) + frac(1 + eta, 2 p^2) parallel y - z parallel^2 . $
  Choose $s_(upright("aux")) lt.double eta \, gamma^2$. The length bounds in Lemma 5 give a fixed $beta_(upright("buf")) > 0$ such that a segment of length at most $beta_(upright("buf")) p^2 M_p$ starting in this smaller annulus remains in the full annulus. For such pairs the supporting inequality follows by integrating the coarse Hessian bound. For $parallel y - z parallel gt.eq beta_(upright("buf")) p^2 M_p$, freeze the spherical saddle at $z$. The polar linear-moment bound gives the spherical quadratic support with Hessian $\( p^2 + alpha_p \( z \) \)^(- 1) I$, its saddle gradient, and a bounded norm-density error. The static value and mean estimates add $2 epsilon.alt_v k_p + epsilon.alt_g M_p parallel y - z parallel$. Relative to $parallel y - z parallel^2 \/ \( 2 p^2 \)$, the total residual is bounded by
  $ C s_(upright("aux")) + frac(4 epsilon.alt_v + C \/ k_p, beta_(upright("buf"))^2) + frac(2 epsilon.alt_g, beta_(upright("buf"))) . $
  Choose $s_(upright("aux"))$, then $beta_(upright("buf"))$, then $epsilon.alt_v \, epsilon.alt_g$ so that this is less than $eta$, and finally increase $K$. Every support lies above $phi.alt_p$ on the smaller annulus. Its infimum is finite and semiconcave with the stated upper Hessian, and it agrees there by choosing $z = y$. The length derivative gives $"dist" \( cal(A)_p \, \( cal(A)_p^(+) \)^c \) gt.eq c_(upright("buf")) p^2 M_p$.
  For the transition tails freeze the child saddle $alpha = alpha_q \( h_q \)$, and use as reference the Gaussian transition tilted by the parent frozen quadratic $q_(W_p \, alpha)$. Writing $R_u = R_(u \, alpha)$, Gaussian convolution gives
  #[#set math.equation(numbering: n => "(3.55)")
   $ R_p h_p tilde.op N \( R_q h_q \, R_q - R_p \) \, #h(2em) R_q^(- 1) = R_p^(- 1) - Delta . $ <edge:reference-transition>]
  The child saddle equation shows that $bb(E) parallel h_p parallel^2 = ell_p \( alpha \)^2$, exactly. The field covariance has norm at most $C gamma^(- 2) p^2$. Gaussian concentration of its norm therefore gives
  $ Pr_(upright("ref")) { \| parallel h_p parallel - ell_p \( alpha \) \| > v p^2 M_p } lt.eq C e^(- c gamma^2 k_p v^2) \, #h(2em) v gt.eq C \/ \( gamma sqrt(k_p) \) . $
  The reference radius lies strictly inside $cal(A)_p$: $\| alpha \| lt.eq s_(upright("aux")) q^2 lt.eq 4 s_(upright("aux")) gamma^2 p^2$. The length derivative gives a fixed positive gap in units $p^2 M_p$ to the boundary of $cal(A)_p$.
  Choose $z_0 in cal(H)_p$ with $parallel z_0 parallel = ell_p \( alpha \)$ and calibrate the reference quadratic by
  $ q^sharp \( y \) = q_(W_p \, alpha) \( y \) + log f_(W_p \, alpha \, z_0) \( n \) . $
  The active covariance is scalar, so the added density depends only on $parallel z_0 parallel$; the additive constant leaves the reference transition unchanged. On bounded scaled radii, the noncentral upper norm-density bound and the static value comparison give $phi.alt_p \( y \) - q^sharp \( y \) lt.eq epsilon.alt k_p + O \( 1 \)$, with any prescribed fixed $epsilon.alt > 0$. Outside a sufficiently large bounded radius, the zero-field projection tail gives
  $ phi.alt_p \( y \) - phi.alt_p \( 0 \) lt.eq C k_p (1 + (frac(parallel y parallel, p^2 M_p))^(6 \/ 5)) . $
  This follows by maximizing the exponent $u v - c v^6$ after integrating the tail against a linear field of scaled length $u$. Its growth is strictly subquadratic. For the extension choose the support centered at the point of radius $ell_p \( alpha \)$ in the direction of $y$. At distance $v p^2 M_p$, its excess over the reference is at most
  $ epsilon.alt k_p \( 1 + v \) + C \( eta + s_(upright("aux")) \) k_p v^2 + O \( 1 \) . $
  This uses the static mean error for the linear term and the difference of the two quadratic coefficients for the last term. Choose $eta + s_(upright("aux")) lt.double gamma^2$, and then $epsilon.alt$ small compared with the squared fixed gap to $cal(A)_p^c$. Outside $cal(A)_p$ these errors are smaller than the reference Gaussian deviation cost.
  The normalizing integrals relative to the reference are at least $e^(- epsilon.alt' k_p)$ for any needed fixed $epsilon.alt' > 0$. To see this, integrate over a thin fixed shell about the reference radius, contained in $cal(A)_p$. Its reference probability is bounded below when $K$ is large. On that shell the frozen density formula (3.31) bounds the off-saddle logarithmic density loss by $C tau^2 k_p + O \( 1 \)$ when the shell width is $tau$ in scaled units: the first parameter derivative vanishes at the saddle and the second is one quarter of the norm-square variance $O \( n \/ p \)$. The static lower value error adds only $epsilon.alt_v k_p$. Take $tau$ and $epsilon.alt_v$ sufficiently small. Both potentials agree on this shell. Dividing the preceding upper tail integrals by this lower bound proves the stated disagreement tails. Polynomial moments are absorbed by the same quadratic reference tail and the subquadratic bound at large radii. ◻
]

#thm([Lemma 3.12.])[
  (Positive covariance error).  #emph[For some $a \, c \, C > 0$, uniformly at every deterministic scale $K lt.eq k_p$, $p lt.eq r_n$, apart from activation points, 
#[#set math.equation(numbering: n => "(3.56)")
 $ upright(bold(P)) (cal(G) ∩ { p^2 K_p prec.curly.eq.not \( 1 + C k_p^(- a) \) I_(cal(H)_p) }) lt.eq C e^(- c k_p^a) . $ <edge:positive-curvature-bound>]

 The probability is taken before restricting to $cal(G)$.]
] <edge:positive-curvature>

#proof[
  Fix a deterministic nonactivation scale $p$ on the retained spectral set. For $h in cal(H)_p$, write $D_p \( h \) = p^2 K_p \( h \) - I_(cal(H)_p)$. Define a Borel predicate $cal(V)_p \( W_p \, h \)$ to be false unless $h in cal(H)_p$, the saddle $alpha_p \( h \)$ exists, and $h eq.not 0$. Otherwise, with $e = h \/ parallel h parallel$, it requires
  #[#set math.equation(numbering: n => "(3.57)")
   $ \| alpha_p \( h \) \| lt.eq s_(upright("aux")) p^2 \, #h(2em) p^2 K_p \( h \) prec.curly.eq \( 1 + epsilon.alt_(upright("aux")) \) I_(cal(H)_p) \, #h(2em) p^2 chevron.l e \, K_p \( h \) e chevron.r lt.eq 0.9 . $ <edge:local-parent-validity>]
  This condition contains no restriction to $cal(G)$. At a nonactivation scale, $P_p$ is the spectral projection of $W_p$ at its flat eigenvalue $2 - p^2$, and $R_(p \, u) = \( 2 I - W_p + u I \)^(- 1)$. Thus the predicate, the saddle, and the covariance used here are determined by $\( p \, W_p \, h \)$. Their defining formulas are jointly Borel away from activation scales. In the rest of the proof these objects are evaluated at $h = h_p$, and that argument is suppressed.
  On $cal(V)_p$, use blocks relative to $cal(H)_p = "span" { e } xor \( cal(H)_p ∩ e^perp \)$, put $z = \( D_p \)_(perp e)$, and define on $cal(H)_p ∩ e^perp$
  #[#set math.equation(numbering: n => "(3.58)")
   $ E_p = (\( D_p \)_(perp perp) + frac(z z^(sans(T)), \| \( D_p \)_(e e) \|))_(+) \, #h(2em) hat(s)_p = parallel \( D_p \)_(+) parallel . $ <edge:tangent-error>]
  Extend $E_p$ by zero on the radial direction and on $cal(H)_p^perp$. Off $cal(V)_p$, set both $E_p$ and $hat(s)_p$ to zero, before any restriction to $cal(G)$. Covariance positivity and (3.57) give $- I prec.curly.eq D_p prec.curly.eq epsilon.alt_(upright("aux")) I$ and $\( D_p \)_(e e) lt.eq - 0.1$ on $cal(V)_p$. Maximizing the quadratic form of $D_p$ over its radial coordinate, and then taking the positive part on $e^perp$, gives
  #[#set math.equation(numbering: n => "(3.59)")
   $ D_p prec.curly.eq E_p \, #h(2em) parallel E_p parallel lt.eq C hat(s)_p \, #h(2em) frac("Tr" E_p, k_p) lt.eq C frac(parallel D_p parallel_(upright(F)), sqrt(k_p)) + C / k_p $ <edge:tangent-bounds>]
  on $cal(V)_p$, with $D_p prec.curly.eq E_p$ understood on $cal(H)_p$. For the norm bound, the maximizing radial coordinate of a unit transverse vector is bounded because the radial deficit is fixed and $D_p$ is bounded; compare the resulting vector with $D_p prec.curly.eq hat(s)_p I$. For the trace, the rank-one correction has bounded trace, and $"Tr" \( \( \( D_p \)_(perp perp) \)_(+) \) lt.eq sqrt(dim cal(H)_p) parallel D_p parallel_(upright(F))$; the displayed trace bound also uses $dim cal(H)_p lt.eq C k_p$ from the retained spectral set. These are the algebraic bounds of #cite(label("FUA")) Lemma 4.4, Equation (4.4). In particular $hat(s)_p lt.eq epsilon.alt_(upright("aux"))$ and $parallel E_p parallel lt.eq C epsilon.alt_(upright("aux"))$ everywhere, including on disorder failures. Include $C epsilon.alt_(upright("aux")) lt.double gamma^2$ in the initial auxiliary choice.
  Apply Brascamp–Lieb’s covariance inequality #cite(label("BrascampLieb1976")) to the transition with $macron(phi.alt)_p$. After whitening, its Hessian has a fixed positive margin because $Delta prec.curly.eq \( 1 - x^2 \) p^2 I$ and $eta lt.double gamma^2$. If $macron(K)$ is the extended Hessian, the covariance is at most the transition expectation of
  $ Delta^(1 \/ 2) \( I - Delta^(1 \/ 2) macron(K) Delta^(1 \/ 2) \)^(- 1) Delta^(1 \/ 2) . $
  Mollify the semiconcave extension to apply the smooth inequality and pass to the limit using the positive margin. Lemma 13 replaces the extended Hessian and transition by $K_p$ and the true transition on agreement. Its polynomially weighted tails control first and second moments on the complement. In field units the covariance error is $O \( p^4 M_p^2 e^(- c k_p) \)$; after (3.54) and multiplication by $q^2$, the remaining polynomial factor in $k_p$ is absorbed by decreasing the exponent.
  On $cal(G)$, the agreement annulus lies in $cal(V)_p$, so (3.59) gives $K_p prec.curly.eq p^(- 2) \( I + E_p \)$. Put $A = I - Delta \/ p^2$ and $S = p^(- 2) Delta^(1 \/ 2) E_p Delta^(1 \/ 2)$. Then $A succ.curly.eq x^2 I$ and $parallel A^(- 1 \/ 2) S A^(- 1 \/ 2) parallel lt.double 1$, so
  $ \( A - S \)^(- 1) prec.curly.eq A^(- 1) + 2 A^(- 1) S A^(- 1) . $
  The baseline $A^(- 1)$, substituted in (3.54), is exactly $q^(- 2) I_(cal(H)_q)$. For the correction, the two outer factors $Delta A^(- 1)$ are the scalar $Delta_q \/ x^2$ on $cal(H)_q$. Thus, after multiplication by $q^2$, the first insertion is at most $2 x^(- 2) P_q E_p P_q$. We obtain on $cal(G)$, for a child in its annulus,
  #[#set math.equation(numbering: n => "(3.60)")
   $ hat(s)_q lt.eq C x^(- 2) upright(bold(E)) \[ parallel P_q E_p P_q parallel divides W \, cal(F)_q \] + C_gamma e^(- c_1 k_p) . $ <edge:parent-inequality>]
  Only $Delta_q$ is inverted outside the covariance in (3.54); directions with arbitrarily small new parent precision cause no loss.
  We next compress $E_p$ before imposing $cal(G)$. The assertion is trivial when $E_p = 0$; otherwise $e$ is defined by $cal(V)_p$. The retained spectral set supplies $c k_p lt.eq dim cal(H)_p lt.eq C k_p$ and $dim cal(H)_q lt.eq C x^3 k_p$; after increasing the threshold, $dim \( cal(H)_p ∩ e^perp \)$ is also comparable to $k_p$. Condition under $upright(bold(P))$ on the spectrum, $W_p$ in physical coordinates, the physical field $h_p$, and its spectral coordinates. Equation (3.6) makes the remaining rotation in $e^perp ∩ cal(H)_p$ exactly Haar. The operator $E_p$ is fixed under this conditioning: its definition uses only these parent data. For a uniformly rotating unit vector $v$ in this space, the Gaussian representation of the uniform sphere gives
  $ upright(bold(P)) (v^(sans(T)) E_p v > frac(C \( "Tr" E_p + t parallel E_p parallel \), k_p) thin mid(bar.v) thin upright("parent data")) lt.eq C \( e^(- t) + e^(- c_0 k_p) \) . $
  Indeed the numerator is a positive Gaussian quadratic form, and the Gaussian squared norm in the denominator is at least a fixed fraction of the dimension except with $e^(- c_0 k_p)$ probability. A fixed-resolution net chosen in the spectral child unit sphere before the remaining Haar rotation has at most $exp \( C dim cal(H)_q \) lt.eq exp \( C x^3 k_p \)$ points. Project each rotated net vector onto $e^perp$. Conditional on the parent data, it has a fixed norm at most one and a uniformly rotating direction. With $t = C_2 x^3 k_p$, a sufficiently large $C_2$ pays for the net, and a sufficiently small $gamma$ pays for the second exponential term. The net estimate for a positive quadratic form gives
  #[#set math.equation(numbering: n => "(3.61)")
   $ parallel P_q E_p P_q parallel lt.eq C (frac("Tr" E_p, k_p) + x^3 parallel E_p parallel) $ <edge:compression>]
  outside a set of unconditional $upright(bold(P))$-probability $C e^(- c_gamma k_p)$. This is the compression argument of #cite(label("FUA")) Lemma 4.5, Equation (4.6); no restriction to $cal(G)$ was made in the Haar law.
  Average (3.60) over $I_q = \[ q \/ \( 2 gamma \) \, q \/ gamma \]$, with normalized logarithmic measure. On $cal(G)$ outside the failure event in (3.50), (3.59) and Cauchy–Schwarz give
  $ "Av"_(p in I_q) frac("Tr" E_p, k_p) lt.eq C_gamma k_q^(- b) \, #h(2em) b = 1 \/ 10 . $
  Here $"Av"$ denotes that normalized logarithmic integral. On its failure the same averaged trace is bounded, because $E_p$ is bounded everywhere and $dim cal(H)_p lt.eq C k_p$. Its contribution on that failure, with $upright(bold(1))_(cal(G))$ inserted, has expectation at most $C e^(- c k_q^(a_1))$. The failures of (3.61) are charged in the same way by the bounded $parallel E_p parallel$. These estimates are applied to the whole parent-scale integral before its conditional expectation. For every nonnegative error cost $Y$,
  #[#set math.equation(numbering: n => "(3.62)")
   $ upright(bold(E)) \[ upright(bold(1))_(cal(G)) upright(bold(E)) \( Y divides W \, cal(F)_q \) \] = upright(bold(E)) \[ upright(bold(1))_(cal(G)) Y \] \, $ <edge:conditioning-good-event>]
  because $cal(G)$ is measurable from $W$.
  The norm term in (3.61) has coefficient $C x^(- 2) x^3 lt.eq C gamma$. The initial choice of $gamma$ makes this coefficient $theta < 1 \/ 2$. We have proved, on $cal(G)$,
  #[#set math.equation(numbering: n => "(3.63)")
   $ hat(s)_q & lt.eq theta "Av"_(p in I_q) upright(bold(E)) \[ hat(s)_p divides W \, cal(F)_q \] + C_gamma k_q^(- b) + "err"_q \,\
"err"_q & gt.eq 0 \, #h(2em) upright(bold(E)) \[ upright(bold(1))_(cal(G)) "err"_q \] lt.eq C e^(- c k_q^beta) $ <edge:curvature-recurrence>]
  for some $beta > 0$. Off the child annulus the left side is zero. The bounded definition of $E_p$ is essential here: no cost polynomial in $n$ is charged on a failed parent interval.
  Use a barrier $B k_q^(- alpha)$, with $0 < alpha lt.eq b$ and $B$ large. Since $k_p = k_q x^(- 3)$,
  $ theta "Av"_(p in I_q) B k_p^(- alpha) lt.eq theta \( 2 gamma \)^(3 alpha) B k_q^(- alpha) . $
  It absorbs the deterministic error in (3.63). Taking positive parts, applying conditional Jensen, and using (3.62), we obtain
  $ A \( q \) := upright(bold(E)) \[ upright(bold(1))_(cal(G)) \( hat(s)_q - B k_q^(- alpha) \)_(+) \] lt.eq theta "Av"_(p in I_q) A \( p \) + C e^(- c k_q^beta) . $
  For each deterministic nonactivation scale $r_n lt.eq p lt.eq C_gamma r_n$, use #cite(label("FUA")) Proposition 4.2, Equation (4.2) within its stated range. Under the biased law $upright(bold(P))$, it gives $p^2 K_p prec.curly.eq \( 1 + C \( p^(a_0) + k_p^(- a_0) \) \) I$ outside a set whose intersection with the full event $cal(G)_n^(upright("FUA"))$ has probability at most $C e^(- n^(xi_0))$. Since $cal(G) subset.eq cal(G)_n^(upright("FUA"))$, the same failure bound holds after intersection with $cal(G)$. Here $p k_p = n p^4 arrow.r 0$, so $p^(a_0) lt.eq k_p^(- a_0)$, and $k_p asymp n^(3 dot.op 10^(- 4))$. By taking $alpha lt.eq a_0$ and a sufficiently small positive terminal exponential power, the same bound for $A \( p \)$ is $C e^(- c k_p^(beta_0))$.
  Every parent generation multiplies $k$ by at least $Lambda = \( 2 gamma \)^(- 3) > 1$. Iteration, including the terminal bound, gives for a suitably decreased $beta_(*) > 0$
  $ A \( q \) lt.eq C sum_(j gt.eq 0) theta^j e^(- c \( Lambda^j k_q \)^(beta_(*))) lt.eq C e^(- c' k_q^(beta_(*))) . $
  Markov’s inequality at the barrier costs only a factor $k_q^alpha$, absorbed by the exponential. On $cal(G)$, (3.57) holds throughout the full auxiliary annulus, and (3.46) removes the annulus truncation. Decrease to a common positive exponent in the barrier and probability. This proves (3.56). ◻
]

#proof[
  Lemmas 4 and 5 prove the spectral and saddle assertions. Lemmas 6, 10, and 11 prove the static, curvature, projection, and ordinary annulus assertions. Assign a fixed fraction of the requested failure probability to each of their spectral and disorder restrictions, and take their finite intersection. The length bounds give a deterministic $R_(upright("ann"))$ containing the full annulus; include a further cube-cap request for the static comparisons on that ball, retaining the previously chosen width $s_0$. We select one additional event, independent of $f$, for the variance.
  In the reduction above take $eta_p = C k_p^(- a)$ and let $cal(N)$ be the jointly measurable field set where $p^2 K_p \( h \) prec.curly.eq.not \( 1 + C k_p^(- a) \) I_(cal(H)_p)$. Set its indicator to one at activation scales, which have zero scale measure for each $W$. At every deterministic nonactivation scale its evaluation at $h_p$ is the failure event in (3.56). Use $Z_p$ and the common cost $rho_p$ from (3.16); both are independent of $f$.
  Under $upright(bold(P))$, conditional Jensen and the spherical identity give
  $ upright(bold(E)) \[ mu_(p \, h_p) \( Z_p \)^2 \] lt.eq upright(bold(E)) \[ mu_(p \, h_p) \( Z_p^2 \) \] = upright(bold(E)) \[ Z_p^2 \] lt.eq C \, $
  by the uncapped spherical projection tail. Cauchy–Schwarz and (3.56), absorbing $k_p$ in the exponential, imply
  #[#set math.equation(numbering: n => "(3.64)")
   $ E_U \[ L_compose upright(bold(1))_(cal(G)) rho_p \] lt.eq C e^(- c k_p^a) . $ <edge:weighted-failure>]
  The left side is an ordinary path expectation averaged with the Haar bias. Take $q_j = 2^j \( K \/ n \)^(1 \/ 3)$ up to $r_n$. Fubini, (3.64), and $L_compose gt.eq 1 \/ 2$ bound the expected ordinary cost on $\[ q_j \, 2 q_j \]$, intersected with $cal(G)$, by $C e^(- c k_(q_j)^a)$. Markov and
  $ sum_(j gt.eq 0) e^(- c \( K 8^j \)^a) lt.eq C e^(- c' K^a) $
  give an event of arbitrarily large limiting disorder probability on which, simultaneously in $j$,
  #[#set math.equation(numbering: n => "(3.65)")
   $ integral_(q_j)^(min { 2 q_j \, r_n }) rho_p thin upright(d) log p lt.eq C e^(- c k_(q_j)^a) . $ <edge:quenched-error-intervals>]
  Increase $K$ and use (3.5) for the single discarded event. This event is independent of $f$.
  The conditional-variance estimate of #cite(label("FUA")) Proposition 4.1, Equation (4.1) holds on an ordinary event of arbitrarily large limiting probability, simultaneously for all real cube functions and scales in its stated interval $\[ r_n \, p_(*) \]$. Its remainder is $C e^(- n^(xi_0)) parallel f parallel_oo^2$. We use it only at $r_n$, for $0 lt.eq f lt.eq 1$:
  $ V_(r_n) \( f \) lt.eq C r_n^(- 2) cal(E) \( f \) + C e^(- n^(xi_0)) . $
  Intersect this event with the preceding ones. In (3.19) with terminal scale $r_n$, its amplified energy is $C p^(- 2) cal(E) \( f \)$. Its amplified remainder is bounded by $C e^(- c k_p^a)$ after decreasing $a > 0$, since $k_p lt.eq k_(r_n) = n^(3 dot.op 10^(- 4))$. For the other errors use (3.65). The first partial dyadic interval has $k_(q_j) asymp k_p$; the rest increase geometrically. Hence
  $ sum_(q_j gt.tilde p) C \( q_j \/ p \)^2 e^(- c k_(q_j)^a) lt.eq C e^(- c' k_p^a) . $
  Applying (3.19) proves the first inequality of (3.14). It extends to activation points by continuity of $V_p$ in $B_p$.
  For the second inequality impose the additional fixed annulus estimate with $zeta_(*) = min { zeta \, s_0 \/ 2 }$. On that annulus the coarse covariance and (3.17) contribute $C V_p$. For its complement, Cauchy–Schwarz and conditional Jensen give
  $ k_p Q_mu \[ upright(bold(1))_({ \| alpha_p \( h_p \) \| > zeta_(*) p^2 }) mu_(p \, h_p) \( Z_p \) \] & lt.eq k_p Q_mu { \| alpha_p \( h_p \) \| > zeta_(*) p^2 }^(1 \/ 2) mu \( Z_p^2 \)^(1 \/ 2)\
 & lt.eq C e^(- c k_p) . $
  Here $mu \( Z_p^2 \) lt.eq C$ holds at every scale on the chosen uncapped cube projection event, and the ordinary annulus estimate is also simultaneous in scale. Weakening the exponent if needed proves the second inequality of (3.14), on the same event for every $f$. ◻
]

== 4 Warming at the critical time scale <sec:warming>

The first step toward a quench limit is to control the finite law after any positive multiple of $T_n = n^(2 \/ 3)$, uniformly in its initial distribution. The edge estimates of Proposition 3 give the required control at the smallest observation scales. We turn them into dissipation estimates by measuring how much relative entropy survives between two observations. Larger entropy levels are treated by the observation path to a product measure from #cite(label("CM")) Section 19.

For a probability $rho$ on the cube, write

$ w_s^rho = frac(thin upright(d) \( rho P_(s T_n) \), thin upright(d) mu) \, #h(2em) s gt.eq 0 . $

Thus $w_s = w_s^(nu_n)$ for the uniform initial law used elsewhere in the paper. Write

$ p_t \( sigma \, tau \) = frac(P_t \( sigma \, tau \), mu \( tau \)) $

for the heat kernel relative to $mu$. We use $log_(+) z = max { log z \, 0 }$ for $z > 0$, with $z \( log_(+) z \)^m = 0$ at $z = 0$. For a probability $pi$ and a nonnegative integrable function $z$, write

$ "Ent"_pi \( z \) = pi \[ z log z \] - pi \[ z \] log pi \[ z \] \, $

with $0 log 0 = 0$ and $"Ent"_pi \( 0 \) = 0$. For a probability $nu lt.double pi$, let $D \( nu bar.v.double pi \) = "Ent"_pi \( thin upright(d) nu \/ thin upright(d) pi \)$, and set this relative entropy to $+ oo$ otherwise.

#thm([Theorem 4.1.])[
  (Warming from arbitrary initial laws).  #emph[Suppose that the couplings are Gaussian. Fix $theta.alt > 0$, an integer $m gt.eq 1$, and $0 < xi < 1 \/ 100$. There are measurable disorder events $cal(G)_n$, a constant $C < oo$, and deterministic $epsilon_n arrow.b 0$ such that $liminf_(n arrow.r oo) bb(P) \( cal(G)_n \) gt.eq 1 - theta.alt$, and the following inequalities hold on $cal(G)_n$, for all sufficiently large $n$. The constant is independent of the initial law $rho$, which may be chosen after the disorder. 
#[#set math.equation(numbering: n => "(4.1)")
 $ "Ent"_mu \( w_s^rho \) & lt.eq C \( 1 + s^(- 1.54) \) \, &  & s > 0 \, quad upright("for every probability ") rho \,\
parallel P_(s T_n) parallel_(L^1 \( mu \) arrow.r L^oo \( mu \)) & = max_(sigma \, tau) p_(s T_n) \( sigma \, tau \) lt.eq C exp \( C s^(- 1.54) \) \, &  & s gt.eq epsilon_n \,\
(1 + mu #h(-0.16667em) [w_s^rho \( log_(+) w_s^rho \)^m])^(1 \/ m) & lt.eq C (1 + s^(- 1 \/ \( 2 \/ 3 - xi \))) \, &  & s > 0 \, quad upright("for every probability ") rho . $ <warm:entropy>]

 The events and constants may depend on the displayed fixed parameters. In particular the order $m$ is fixed before $n$ tends to infinity.]
] <thm:warming>

The distinction between (4.1) and (4.1) is useful. Entropy is controlled at every positive time; the stronger kernel estimate begins at a deterministic time tending to zero in the rescaled units. The log-moment estimate supplies a different form of control at the very short times used later in the replacement argument.

=== 4.1 A restricted dissipation profile <warm:profile-section>

Recall $cal(I) \( z \) = cal(E) \( z \, log z \)$, with the extended value at zeros. On a two-point edge, the inequality

$ \( a^2 - b^2 \) \( log a^2 - log b^2 \) gt.eq 4 \( a - b \)^2 \, #h(2em) a \, b > 0 \, $

follows by integrating $1 \/ u$ between $a$ and $b$ and applying Cauchy–Schwarz. Summing it in the reversible edge representation gives

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(I) \( f^2 \) gt.eq 4 cal(E) \( f \) . $ <warm:modified-classical>]

The inequality extends to nonnegative $f$ by decreasing positive regularization.

The next profile concerns a bounded function whose square tilt retains a definite fraction of the logarithm of its inverse mass. All its inequalities hold simultaneously in the function.

#thm([Proposition 4.2.])[
  (Restricted dissipation profiles).  #emph[Fix $C_(upright("lev")) < oo$ and $0 < xi < 1 \/ 100$. With tight constants, there are a threshold $K_0 < oo$ and a number $delta > 0$ such that every $0 lt.eq f lt.eq 1$ satisfying 
#[#set math.equation(numbering: n => "(4.3)")
 $ N = mu \[ f^2 \] = e^(- L) \, #h(2em) K_0 lt.eq L lt.eq C_(upright("lev")) n \, #h(2em) D #h(-0.16667em) (frac(f^2 mu, N) mid(bar.v.double) mu) gt.eq L / 2 $ <warm:restricted-class>]

 obeys 
#[#set math.equation(numbering: n => "(4.4)")
 $ T_n thin frac(cal(I) \( f^2 \), N) & gt.eq c_xi L^(5 \/ 3 - xi) \,\
T_n thin frac(cal(E) \( f \), N) & gt.eq c cases(delim: "{", L^1.662 \, & L lt.eq n^delta \,, L^1.162 \, & L > n^delta .) $ <warm:modified-profile>]

 Here a threshold, a positive exponent, and constants are tight in the following precise sense. For each $theta.alt > 0$ they can be fixed, independently of $f$, on disorder events of limiting lower probability at least $1 - theta.alt$. They may depend on $C_(upright("lev")) \, xi \, theta.alt$.]
] <warm:profiles>

The modified profile yields entropy dissipation and the higher logarithmic moments after the reduction by level sets. The classical profile yields a support profile and hence the heat kernel bound. We prove the profiles in three ranges: $L lt.eq n^delta$ by the argument with two observations; $n^delta < L lt.eq lambda n$ by the proportional branch of the source path; and $lambda n lt.eq L lt.eq C_(upright("lev")) n$ by the product endpoint and the estimate for a reweighted mean below, for a small fixed $lambda$ chosen later.

#thm([Lemma 4.3.])[
  (Entropy between two observation scales).  #emph[Fix $C_(upright("lev")) < oo$. For every fixed $kappa > 0$, there are tight $K_0$ and $delta > 0$ such that every $f$ satisfying (4.3) with $L lt.eq n^delta$ satisfies 
#[#set math.equation(numbering: n => "(4.5)")
 $ T_n thin frac(cal(E) \( f \), N) gt.eq c_kappa L^(5 \/ 3 - kappa) . $ <warm:small-profile-bound>]

]
] <warm:small-profile>

#proof[
  Fix first one instance of Proposition 3, with $epsilon.alt_(upright("sp")) lt.eq 1$, $K gt.eq 1$, and a variance-remainder exponent $0 < a lt.eq 1$, decreasing the exponent if necessary. Its constants are fixed on a disorder event of arbitrarily high limiting probability. Choose $M > 1$ sufficiently large that
  $ M a > 1 \, #h(2em) frac(2 M, 3) > 5 / 3 - kappa . $
  We retain this variance estimate when imposing further cap tolerances below; intersection with finitely many additional events does not change its already chosen exponent $a$. Choose $delta > 0$ so small that $M delta \/ 3 < 10^(- 4)$. This leaves every fixed factor buffer about the scales below within $r_n = n^(- 1 \/ 3 + 10^(- 4))$ for large $n$. Use the same fixed small $gamma > 0$ as in the covariance iteration of Section 3. Choose the bridge tolerance $epsilon.alt > 0$ after $M$, with $2 \( M - 1 \) epsilon.alt \/ 3 < kappa$.
  For a small fixed $c_0 > 0$, to be chosen using only the projection-tail constants, define
  $ k_(p_1) = n p_1^3 = c_0 L \, #h(2em) k_R = n R^3 = L^M . $
  Increasing $K_0$ puts these scales above the threshold of Proposition 3. Suppose, for a contradiction, that $T_n cal(E) \( f \) \/ N < L^(5 \/ 3 - kappa)$. If $F_R \( h \) = mu_(R \, h) \[ f \]$ and $V_R = Q_mu \[ "Var" \( f divides h_R \) \]$, that proposition gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ V_R / N lt.eq C L^(5 \/ 3 - kappa - 2 M \/ 3) + C exp { L - c L^(M a) } = o_(K_0 arrow.r oo) \( 1 \) . $ <warm:small-variance>]
  The estimate is uniform in $n \, L \, f$ in the present range, because $R^2 T_n = L^(2 M \/ 3)$.
  Consider the joint ordinary law $Q_mu$ of the spin and its observation path through $R$. Change this law to $Q_(upright("spin"))$ or $Q_(upright("obs"))$ by the respective densities
  $ Lambda^(upright("spin")) = f^2 / N \, #h(2em) Lambda^(upright("obs")) = frac(F_R \( h_R \)^2, A) \, #h(2em) A = Q_mu \[ F_R^2 \] = N - V_R . $
  For $K_0$ large, $A gt.eq N \/ 2$, so both densities are at most $2 e^L$. For any of these laws, $Q \|_p$ denotes restriction to $sigma \( h_q : 0 lt.eq q lt.eq p \)$, always excluding the spin. Define, for $p < R$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ H \( p \) = D \( Q_(upright("obs")) bar.v.double Q_mu \) - D \( Q_(upright("obs")) \|_p bar.v.double Q_mu \|_p \) . $ <warm:residual-observation-entropy>]
  The first entropy is on the full joint law. Since its likelihood is measurable from $h_R$, it equals the relative entropy on the terminal observation sigma-field. Both terms are finite by the likelihood bound, and the conditional entropy chain rule identifies $H \( p \)$ with the expected entropy of the terminal observation tilt remaining after the prefix through $p$. To compare the two tilts, note that $Q_mu \[ f F_R \] = A$, and hence
  $ Q_mu [(f / sqrt(N) - F_R / sqrt(A))^2] = 2 (1 - sqrt(A / N)) lt.eq frac(2 V_R, N) . $
  Cauchy–Schwarz bounds the $L^1 \( Q_mu \)$ distance between the two densities by $2 sqrt(2 V_R \/ N)$. This bound persists after projection to any part of the observation path. If two projected densities $u \, v lt.eq 2 e^L$ have $L^1$ distance $d$, then
  #[#set math.equation(numbering: n => "(4.8)")
   $ lr(|Q_mu \[ u log u \] - Q_mu \[ v log v \]|) lt.eq \( 1 + L + log 2 \) d + C . $ <warm:entropy-continuity>]
  Indeed $x log x$ has derivative bounded by $1 + L + log 2$ on $\[ 1 \, 2 e^L \]$, while its absolute value is bounded on $\[ 0 \, 1 \]$. It follows from (4.6) that the two relative entropies, both before and after any projection, differ by $o \( L \)$, uniformly as $K_0$ increases.
  We bound the information revealed at $p_1$ under the spin tilt. The field $h_(p_1)$ is a sufficient statistic for the path through that scale. Let $Q_0$ be the output of the same Gaussian channel with zero signal. Convexity of relative entropy and evenness of $mu$ give
  $ D \( Q_(upright("spin")) \|_(p_1) bar.v.double Q_0 \) lt.eq 1 / 2 frac(mu \[ f^2 X^(sans(T)) B_(p_1) X \], N) \, #h(2em) log frac(thin upright(d) \( Q_mu \|_(p_1) \), thin upright(d) Q_0) \( h \) gt.eq - 1 / 2 mu \[ X^(sans(T)) B_(p_1) X \] . $
  These formulas are on the range of $B_(p_1)$, so zero precision directions cause no difficulty. Subtraction bounds $D \( Q_(upright("spin")) \|_(p_1) bar.v.double Q_mu \|_(p_1) \)$ by half the sum of the two quadratic moments. The spectral bound $d_1 gt.eq - epsilon.alt_(upright("sp")) p_1^2$ gives $B_(p_1) prec.curly.eq \( 1 + epsilon.alt_(upright("sp")) \) p_1^2 P_(p_1) prec.curly.eq 2 p_1^2 P_(p_1)$. The projection tail in Proposition 3, integrated against a density at most $e^L$, gives
  $ frac(mu \[ f^2 parallel P_(p_1) X parallel^2 \], N M_(p_1)^2) + frac(mu \[ parallel P_(p_1) X parallel^2 \], M_(p_1)^2) lt.eq C (1 + \( L \/ k_(p_1) \)^(1 \/ 3)) . $
  For example, integrate $min { 1 \, e^L C e^(- c k_(p_1) v^6) }$ in the variable $v^2$. The information is therefore at most
  $ C k_(p_1) (1 + \( L \/ k_(p_1) \)^(1 \/ 3)) lt.eq C \( c_0 + c_0^(2 \/ 3) \) L . $
  This is the proportional-cap argument in #cite(label("CM")) Equation (19.12). Choose $c_0$ so that this last bound is less than $L \/ 8$. The full spin-tilt entropy is at least $L \/ 2$. The two continuity comparisons in (4.8), combined into one uniform $o \( L \)$, therefore give
  #[#set math.equation(numbering: n => "(4.9)")
   $ H \( p_1 \) & gt.eq D \( Q_(upright("spin")) bar.v.double Q_mu \) - D \( Q_(upright("spin")) \|_(p_1) bar.v.double Q_mu \|_(p_1) \) - o \( L \)\
 & gt.eq L \/ 2 - L \/ 8 - o \( L \) gt.eq c L . $ <warm:residual-lower>]
  We follow that remaining entropy up to a fixed fraction of $R$. For $p < R$, let $sans(T)_(p \, R)^h$ be the ordinary conditional law of $h_R$ given $h_p = h$. It has density proportional to
  $ e^(phi.alt_R \( y \)) thin cal(N) \( h \, B_R - B_p \) \( thin upright(d) y \) \, $
  where the Gaussian is restricted to the range of its covariance. Let $tilde(sans(T))_(p \, R)^h$ be its tilt by $F_R \( y \)^2$, and put
  $ A_p \( h \) = sans(T)_(p \, R)^h \[ F_R^2 \] \, #h(2em) l_p \( h \) = D \( tilde(sans(T))_(p \, R)^h bar.v.double sans(T)_(p \, R)^h \) . $
  Observation sufficiency gives the prefix density $thin upright(d) \( Q_(upright("obs")) \|_p \) \/ thin upright(d) \( Q_mu \|_p \) = A_p \( h_p \) \/ A$. The conditional chain rule in (4.7) now reads
  #[#set math.equation(numbering: n => "(4.10)")
   $ H \( p \) = 1 / A Q_mu #h(-0.16667em) ["Ent"_(sans(T)_(p \, R)^(h_p)) \( F_R^2 \)] = Q_(upright("obs")) \[ l_p \( h_p \) \] . $ <warm:residual-transition-entropy>]
  Write $Delta = B_R - B_p$. On the currently active subspace $cal(H)_p$, $Delta = \( R^2 - p^2 \) I$. Differentiating its Gaussian convolution therefore gives
  $ nabla_(cal(H)_p) log A_p \( h \) = delta m_h \, #h(2em) delta m_h = tilde(sans(T))_(p \, R)^h \[ S \] - sans(T)_(p \, R)^h \[ S \] \, #h(2em) S = frac(P_p \( h_R - h \), R^2 - p^2) . $
  In the parameter $p^2$, the likelihood martingale $A_p \( h_p \) \/ A$ has innovation coefficient $\( A_p \/ A \) delta m_h$. The Gaussian likelihood formula for its relative entropy and the chain rule yield
  #[#set math.equation(numbering: n => "(4.11)")
   $ - frac(thin upright(d) H, thin upright(d) log p) = p^2 Q_(upright("obs")) \[ \| delta m_h \|^2 \] . $ <warm:bridge-loss>]
  This identity holds almost everywhere and in integrated form across activation points. One direct justification applies Itô’s formula to $\( u + epsilon.alt \) log \( u + epsilon.alt \)$ of the bounded likelihood, then lets $epsilon.alt arrow.b 0$; zero-rate directions are omitted. This is the observation entropy identity #cite(label("CM")) Lemma 19.2, Equation (19.6), applied here to a terminal observation tilt instead of a spin tilt.
  The ordinary log moment generating function of $S$, for $v in cal(H)_p$, is exactly
  $ log sans(T)_(p \, R)^h \[ e^(chevron.l \, chevron.r v S) \] = phi.alt_p \( h + v \) - phi.alt_p \( h \) + frac(\| v \|^2, 2 \( R^2 - p^2 \)) . $
  Suppose that the Hessian of $phi.alt_p$ in this subspace is at most $C_(upright("curv")) p^(- 2) I$ on all shifts of length at most $p sqrt(2 l_p \( h \) \/ C_(upright("curv")))$ from $h$. The entropy variational inequality, tested against $chevron.l \, chevron.r v S$, then gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ p^2 \| delta m_h \|^2 lt.eq 2 (C_(upright("curv")) + frac(p^2, R^2 - p^2)) l_p \( h \) . $ <warm:bridge-mean>]
  To check the finite shift radius, the centered log moment generating function is at most $1 / 2 \( C_(upright("curv")) p^(- 2) + \( R^2 - p^2 \)^(- 1) \) \| v \|^2$. Testing at length $sqrt(2 l_p \/ \( C_(upright("curv")) p^(- 2) + \( R^2 - p^2 \)^(- 1) \))$ in the mean-shift direction proves the inequality by contradiction; this length is no larger than the assumed radius.
  We next account for observations where that curvature bound is not available. The entropy bound $l_p lt.eq - log A_p$, together with $A gt.eq e^(- L) \/ 2$, implies
  #[#set math.equation(numbering: n => "(4.13)")
   $ Q_(upright("obs")) \( l_p > L + log 2 + z \) lt.eq e^(- z) \, #h(2em) z gt.eq 0 . $ <warm:bridge-entropy-tail>]
  Under the ordinary joint law,
  $ S = P_p X + \( R^2 - p^2 \)^(- 1 \/ 2) G_p \, $
  with an independent standard Gaussian $G_p$ on $cal(H)_p$. For $p lt.eq gamma R$, the projection tails of Proposition 3 and Gaussian concentration give, for each prescribed $a_0 > 0$, a fixed $V$ such that
  #[#set math.equation(numbering: n => "(4.14)")
   $ Q_mu #h(-0.16667em) [frac(\| S \|^2, M_p^2) upright(bold(1))_({ \| S \| > V M_p })] & lt.eq C e^(- a_0 k_p) \,\
Q_mu { parallel h_p parallel > V p^2 M_p } & lt.eq C e^(- a_0 k_p) . $ <warm:bridge-input-tails>]
  To see the common scale, write the observation noise using a standard Gaussian $G'_p$ on $cal(H)_p$. Since $B_p prec.curly.eq 2 p^2 P_p$,
  $ frac(parallel h_p parallel, p^2 M_p) lt.eq 2 frac(parallel P_p X parallel, M_p) + sqrt(2) frac(parallel G'_p parallel, sqrt(k_p)) \, #h(2em) frac(\| S \|, M_p) lt.eq frac(parallel P_p X parallel, M_p) + p / sqrt(R^2 - p^2) frac(parallel G_p parallel, sqrt(k_p)) . $
  The last coefficient is bounded on this range and $dim cal(H)_p lt.eq C k_p$. Integration of the same tails allows any fixed polynomial moment as well. For a prefix event $E$, conditional Jensen and the full and prefix likelihood bounds at most $2 e^L$ give
  #[#set math.equation(numbering: n => "(4.15)")
   $ p^2 Q_(upright("obs")) \[ \| delta m_h \|^2 upright(bold(1))_E \] lt.eq C k_p #scale(x: 240%, y: 240%)[\(] V^2 Q_(upright("obs")) \( E \) + e^L Q_mu #h(-0.16667em) [frac(\| S \|^2, M_p^2) upright(bold(1))_({ \| S \| > V M_p })] #scale(x: 240%, y: 240%)[\)] . $ <warm:discarded-bridge>]
  Indeed Jensen bounds $\| delta m_h \|^2$ by twice the sum of the second moments under the two conditional laws. For their parts $\| S \| lt.eq V M_p$ use the prefix probability of $E$; for the remaining parts use respectively the full likelihood $F_R^2 \/ A$ and the prefix likelihood $A_p \/ A$. Finally $p^2 M_p^2 = k_p$.
  Choose $p_2$ by $k_(p_2) = C_2 k_(p_1)$, where $C_2$ will be fixed below. Once it is fixed, $p_2 < gamma R$ for $K_0$ sufficiently large. Fix $A_0 > 0$, choose a tail rate $a_0 > c_0^(- 1)$ with a fixed margin, and then choose $V$ in (4.14). On $\[ p_1 \, p_2 \]$ retain $parallel h_p parallel lt.eq V p^2 M_p$ and $l_p lt.eq L + log 2 + A_0 k_p$. The trial shifts in (4.12), in units $p^2 M_p$, then have length at most $sqrt(2 \( c_0^(- 1) + A_0 + 1 \))$, after enlarging the ball-curvature constant to be at least one. Choose a fixed ball containing the retained fields and these shifts before requesting its curvature constant from Proposition 3. Equations (4.13)–(4.15) show that discarded observations contribute at most $C k_p e^(- c k_p)$. Thus (4.11)–(4.12) imply
  $ frac(thin upright(d) H, thin upright(d) log p) gt.eq - C_1 H - C k_p e^(- c k_p) #h(2em) \( p_1 lt.eq p lt.eq p_2 \) . $
  The logarithmic length of this interval is fixed.
  For $\[ p_2 \, gamma R \]$, make a fresh auxiliary cap and extension request with the same $gamma$. Choose $eta lt.double gamma^2$, then $epsilon.alt_(upright("aux")) lt.eq epsilon.alt$ sufficiently small compared with $eta$. Reapply the construction of Lemma 13 with these choices, and write $s_0$ for its auxiliary width. Let $cal(G)_(upright("ext")) = cal(G)_n^(upright(a u x \, e x t)) ∩ cal(G)_n^(upright("FUA"))$ be the resulting event for the required static tolerances, radii, threshold, and scale buffers. Lemma 10 gives $cal(G)_n^(upright(a u x \, e x t))$ with arbitrarily high limiting ordinary probability, and $cal(G)_n^(upright("FUA"))$ costs $o \( 1 \)$. Assign a further fraction of the failure probability and intersect with the retained variance event; its exponent $a$ and constants are unchanged.
  On the full annulus $\| alpha_p \( h \) \| lt.eq s_0 p^2$, this request gives $K_p \( h \) prec.curly.eq \( 1 + epsilon.alt_(upright("aux")) \) p^(- 2) I prec.curly.eq \( 1 + epsilon.alt \) p^(- 2) I$. The same annulus specifies admissible child fields for the extension. Choose $0 < zeta < s_0$ and a fixed $b_(upright("rad")) > 0$ so that shifts of length at most $b_(upright("rad")) p^2 M_p$ from $\| alpha_p \( h \) \| lt.eq zeta p^2$ stay in the full annulus. After $zeta$ is fixed, impose its ordinary annulus estimate from Lemma 11 as one further fixed request and intersection. Thus the ordinary failure probability is $C e^(- a_zeta k_p)$, with a fixed $a_zeta > 0$; only this probability bound is used from the further request. The trial shifts fit whenever $l_p lt.eq b k_p$, where $b = \( 1 + epsilon.alt \) b_(upright("rad"))^2 \/ 2$. Choose $C_2$ so large that
  $ L / k_p lt.eq frac(1, C_2 c_0) < 1 / 4 min { b \, a_zeta } #h(2em) \( p gt.eq p_2 \) . $
  The likelihood bound and (4.13) give exponentially small tilted probabilities for both discarded events. Using (4.15) with a further fixed $S$-tail threshold proves
  $ frac(thin upright(d) H, thin upright(d) log p) gt.eq - (2 \( 1 + epsilon.alt \) + frac(2 p^2, R^2 - p^2)) H - C k_p e^(- c k_p) . $
  The extra coefficient has bounded integral,
  $ integral_(p_2)^(gamma R) frac(2 p^2, R^2 - p^2) thin thin upright(d) log p lt.eq - log \( 1 - gamma^2 \) . $
  In both intervals the integrating factor charges a fixed power of $p \/ p_1$, whereas $k_p = n p^3$ grows as its cube. Consequently the weighted errors are bounded by a polynomial in $k_(p_1)$ times $\( e^(- c k_(p_1)) + e^(- c k_(p_2)) \)$. They are $o \( L \)$ after increasing $K_0$. The first interval costs a fixed multiplicative factor. We obtain
  #[#set math.equation(numbering: n => "(4.16)")
   $ H \( gamma R \) gt.eq c L \( p_1 \/ R \)^(2 + 2 epsilon.alt) . $ <warm:retained-small>]
  It remains to bound this entropy by the energy of $f$. For a child field satisfying $\| alpha_(gamma R) \( h \) \| lt.eq s_0 \( gamma R \)^2$, the fresh request to Lemma 13 supplies an extension of the parent potential with upper Hessian $\( 1 + eta \) R^(- 2) I$. Put
  $ cal(A)_R = { \| alpha_R \| lt.eq s_0 R^2 \/ 2 } \, #h(2em) cal(A)_R^(+) = { \| alpha_R \| < 3 s_0 R^2 \/ 4 } . $
  The extension agrees with the true potential on $cal(A)_R^(+)$. The distance from $cal(A)_R$ to $\( cal(A)_R^(+) \)^c$ is at least $c_(upright("buf")) R^2 M_R$. Both transition laws assign $cal(A)_R^c$ probability $C e^(- c k_R)$, also with fixed polynomial moments of $parallel h_R parallel \/ \( R^2 M_R \)$. The precision increment satisfies $Delta prec.curly.eq \( 1 - gamma^2 \) R^2 I$. On its range the extended transition, denoted by $overline(sans(T))$, has negative log-density Hessian at least
  $ Delta^(- 1) - \( 1 + eta \) R^(- 2) I succ.curly.eq c_gamma R^(- 2) I . $
  The Bakry–Émery logarithmic Sobolev criterion #cite(label("BakryGentilLedoux2014")) Corollary 5.7.2 gives
  $ "Ent"_(overline(sans(T))) \( g^2 \) lt.eq C_gamma R^2 overline(sans(T)) \[ \| nabla g \|^2 \] . $
  It applies to the semiconcave extension by mollification.
  Choose a smooth cutoff $chi$ equal to one on $cal(A)_R$ and supported in $cal(A)_R^(+)$. The fixed buffer and the radial saddle derivative in Proposition 3 give $\| nabla chi \| lt.eq C \/ \( R^2 M_R \)$. Apply the preceding inequality to $chi F_R$. Its cutoff-gradient term is at most $C e^(- c k_R)$, because $R^2 \| nabla chi \|^2 lt.eq C \/ k_R$ and the transition tail has that exponential rate. On agreement the ratio of the two transition densities is constant; their normalization and their exponentially small tails make that constant $1 + O \( e^(- c k_R) \)$. To compare the entropies, use $"Ent"_(sans(T)) \( g \) = sans(T) \[ g log g \] - sans(T) \[ g \] log sans(T) \[ g \]$: $x log x$ is bounded and Hölder continuous on $\[ 0 \, 1 \]$, and $0 lt.eq F_R \, chi lt.eq 1$. The comparison, with a possibly smaller positive exponent, proves
  #[#set math.equation(numbering: n => "(4.17)")
   $ "Ent"_(sans(T)_(thin gamma R \, R)^h) \( F_R^2 \) lt.eq C_gamma R^2 sans(T)_(thin gamma R \, R)^h \[ \| nabla_(cal(H)_R) F_R \|^2 \] + C e^(- c k_R) . $ <warm:transition-lsi>]
  Failure of the child condition is contained in the ordinary $zeta$-annulus failure, since $zeta < s_0$. Its probability is $C e^(- c k_R)$ after changing $c$, since $k_(gamma R) = gamma^3 k_R$. On it the conditional entropy of $F_R^2 lt.eq 1$ is at most $1 \/ e$. Average (4.17) under the ordinary child law and use (4.10). The tower property, $A gt.eq N \/ 2$, and the two inequalities of (3.14) at $R$ give
  #[#set math.equation(numbering: n => "(4.18)")
   $ H \( gamma R \) & lt.eq frac(C_gamma R^2, A) Q_mu #h(-0.16667em) [parallel nabla_(cal(H)_R) F_R \( h_R \) parallel^2] + frac(C e^(- c k_R), A)\
 & lt.eq C V_R / N + C exp { L - c k_R^a }\
 & lt.eq C R^(- 2) frac(cal(E) \( f \), N) + C exp { L - c k_R^a } . $ <warm:small-upper>]
  Here $0 < a lt.eq 1$ allows the transition error to be included in the displayed remainder, and $k_R = L^M$ makes it $C e^(L - c L^(M a))$. The error is negligible compared with (4.16), even if the latter is a negative power of $L$. Comparing the two bounds and using $T_n p_1^2 = \( c_0 L \)^(2 \/ 3)$ gives
  $ T_n thin frac(cal(E) \( f \), N) gt.eq c thin T_n R^2 L \( p_1 \/ R \)^(2 + 2 epsilon.alt) = c' L^(5 \/ 3 - 2 \( M - 1 \) epsilon.alt \/ 3) . $
  The choice $2 \( M - 1 \) epsilon.alt \/ 3 < kappa$ contradicts the assumed upper bound for $K_0$ large. All ball radii, tail rates, annulus tolerances and factor buffers have been fixed before this last increase of $K_0$ and before $n$ tends to infinity. ◻
]

=== 4.2 The product endpoint and larger entropy levels <warm:large-section>

We record first two entropy bounds at a product posterior. Let $nu = f^2 mu \/ N$. For each path used below, let $Q_mu \, Q_nu$ denote the corresponding joint laws of the initial spin and its observations, started from these two spin laws. Expectations of observation-only functions use their observation marginals, and $Q \|_u$ again denotes the observation prefix, excluding the spin. At observation time $u$, write $mu_u \, nu_u$ for their spin posteriors and $N_u = mu_u \[ f^2 \]$. Use the posterior heat-bath form and the weighted Euclidean norm

$ cal(E)_(mu_u) \( f \) = sum_i mu_u \[ "Var"_(mu_u) \( f divides X_(- i) \) \] \, #h(2em) parallel v parallel_A^2 = v^(sans(T)) A v . $

Bayes’ formula and the observation identities of #cite(label("CM")) Lemma 19.2, Equations (19.6)–(19.8) are

#[#set math.equation(numbering: n => "(4.19)")
 $ frac(thin upright(d) \( Q_nu \|_u \), thin upright(d) \( Q_mu \|_u \)) & = N_u / N \, #h(2em) nu_u = frac(f^2 mu_u, N_u) \,\
- dot(H) \( u \) & = 1 / 2 Q_nu #h(-0.16667em) [parallel nu_u \[ X \] - mu_u \[ X \] parallel_(dot(B)_u)^(thin 2)] \, #h(2em) H \( u \) = Q_nu \[ D \( nu_u bar.v.double mu_u \) \] \,\
Q_nu #h(-0.16667em) [frac(cal(E)_(mu_u) \( f \), N_u)] & = 1 / N Q_mu \[ cal(E)_(mu_u) \( f \) \] lt.eq frac(cal(E) \( f \), N) . $ <warm:posterior-likelihood>]

The posterior $nu_u$ is defined where $N_u > 0$; the remaining observation paths have $Q_nu$-mass zero and contribute zero to these averaged formulas. The loss identity has the corresponding stopped-path form, with the information in precision jumps added. The last inequality is conditional-variance contraction, site by site, under the ordinary joint spin-observation law. The form at every posterior uses the same rate-one-per-site normalization as $cal(E)$.

#thm([Lemma 4.4.])[
  (Product-posterior entropy bounds).  #emph[Fix the at most two product endpoints used below. Each has precision $t' I + W$ for a fixed $t' > 3$, chosen from the fixed path parameters before $f$. On the common disorder event of #cite(label("CM")) Equation (19.10) for these endpoints, including its polynomial-moment field-tail control, the tests (4.3) satisfy 
#[#set math.equation(numbering: n => "(4.20)")
 $ H_(upright("end")) lt.eq C sqrt(log n + L) thin frac(cal(E) \( f \), N) + O \( n^(- 3) \) \, #h(2em) H_(upright("end")) lt.eq frac(cal(I) \( f^2 \), N) . $ <warm:product-bounds>]

 The constants in the first inequality, including its remainder, may depend on these endpoints, the fixed path parameters, and $C_(upright("lev"))$, but not on $n$ or $f$. The second inequality holds for every observation channel whose posterior at the endpoint is a product measure; it does not require a field-tail estimate.]
] <warm:product>

#proof[
  The first inequality is the product calculation of #cite(label("CM")) Equation (19.18), applied at each chosen endpoint. Its precision is $t' I + W$ for the corresponding fixed $t' > 3$. The posterior interaction is then a scalar diagonal, hence its spin law is a product with fields $h_i$. Tensorizing the two-point log-Sobolev bound gives
  $ D \( nu_h bar.v.double mu_h \) lt.eq C \( 1 + parallel h parallel_oo \) frac(cal(E)_(mu_h) \( f \), N_h) . $
  The field tail of #cite(label("CM")) Equation (19.10), on the common event for the chosen endpoints, restricts $parallel h parallel_oo lt.eq C sqrt(log n + L)$. Its ordinary complement has probability at most $e^(- 2 L) n^(- 10)$, with polynomial moments; after the likelihood bound $N_h \/ N lt.eq e^L$ its entropy contribution is $O \( n^(- 3) \)$. Equation (4.19) gives the displayed bound.
  For the second inequality, entropy tensorization at a product posterior and Jensen’s inequality for the logarithm give, for positive $z$,
  $ "Ent"_(mu_h) \( z \) lt.eq sum_i mu_h \[ "Ent"_(mu_h \( dot.op divides X_(- i) \)) \( z \) \] lt.eq sum_i mu_h \[ "Cov"_(mu_h \( dot.op divides X_(- i) \)) \( z \, log z \) \] = cal(I)_(mu_h) \( z \) . $
  In fact $"Ent"_pi \( z \) lt.eq "Cov"_pi \( z \, log z \)$ follows from $pi \[ log z \] lt.eq log pi \[ z \]$. The posterior entropy formula is
  $ H_(upright("end")) = 1 / N Q_mu \[ "Ent"_(mu_h) \( f^2 \) \] . $
  It remains to compare the averaged modified form to its initial value. For a fixed site and fixed $x_(- i)$, let
  $ a_h = mu_h \( X_(- i) = x_(- i) \, X_i = + 1 \) \, #h(2em) b_h = mu_h \( X_(- i) = x_(- i) \, X_i = - 1 \) $
  be the two joint posterior masses. Their contribution to $cal(I)_(mu_h) \( z \)$ is
  $ frac(a_h b_h, a_h + b_h) \( z_(+) - z_(-) \) \( log z_(+) - log z_(-) \) . $
  The second factor is nonnegative and independent of the observation. The function $c \( a \, b \) = a b \/ \( a + b \)$, extended by zero on the coordinate axes, is concave: in the positive quadrant its Hessian is $- 2 \( b \, - a \) \( b \, - a \)^(sans(T)) \/ \( a + b \)^3$. Since $Q_mu \[ a_h \]$ and $Q_mu \[ b_h \]$ are the corresponding initial masses, Jensen’s inequality proves $Q_mu \[ cal(I)_(mu_h) \( z \) \] lt.eq cal(I)_mu \( z \)$. Take $z = f^2 + epsilon.alt$ and let $epsilon.alt arrow.b 0$ to include zeros. This proves the second bound. ◻
]

At entropy of order $n$, the observation path must be stopped before its field leaves a region where the posterior mean is controlled. The following strengthening of the square-density estimate in #cite(label("SG")) Proposition 7.3 is what permits the necessary energy range. We display the stability condition used at subcritical posterior interactions; the finite word estimates and vector recipes of #cite(label("SG")) are used in their stated form.

Let $J_(*) = beta W_(upright("off"))$, $0 < beta < 1$, and $j = beta^2$. For $y \, h in bb(R)^n$ put

$ m \( y \) = tanh y \, #h(2em) q \( y \) = frac(parallel m \( y \) parallel^2, n) \, #h(2em) V \( y \) = "diag" \( 1 - m_i \( y \)^2 \) \,\
F_h \( y \) = y + #scale(x: 120%, y: 120%)[\(] j \( 1 - q \( y \) \) I - J_(*) #scale(x: 120%, y: 120%)[\)] m \( y \) - h . $

The stability condition of #cite(label("CM")) Equation (17.2), with fixed positive $b \, eta \, epsilon.alt_A \, rho_0$, is the implication

#[#set math.equation(numbering: n => "(4.21)")
 $ n^(- 1 \/ 2) parallel F_h \( y \) parallel lt.eq 2 rho_0 \, #h(2em) 0 prec.curly.eq A prec.curly.eq \( 1 + eta \) I \,\
A med upright("diagonal") \, #h(2em) n^(- 1 \/ 2) parallel A - V \( y \) parallel_(upright(F)) lt.eq epsilon.alt_A\
arrow.r.double quad I + A^(1 \/ 2) (j \( 1 - q \( y \) \) I - J_(*) - frac(2 j, n) m \( y \) m \( y \)^(sans(T))) A^(1 \/ 2) succ.curly.eq b I . $ <warm:stability>]

for every $y \, A$. The ordinary word diagnostics below are the simultaneous estimates of #cite(label("SG")) Lemma 3.1: for a prescribed finite length they bound the operator norm, the off-diagonal entrywise $ell^4$ norm, and the Euclidean norm of the diagonal error from the noncrossing prediction for products of $J_(*)$ and bounded diagonal matrices. The ordinary vector recipes are those of #cite(label("SG")) Definition 6.2; their square-density argument uses no inverse word.

#thm([Lemma 4.5.])[
  (Square-root energy in a reweighted posterior mean).  #emph[Fix an operator-norm bound for $J_(*)$ and the parameters in (4.21), with $j \( 1 + eta \)^2 < 1$. For every sufficiently small fixed $epsilon.alt > 0$, impose the ordinary word diagnostics of a finite length depending on $epsilon.alt$. For any field $h$ satisfying (4.21), taking $A = V \( y \)$ verifies the hypothesis of #cite(label("SG")) Lemma 5.7 with residual threshold $2 rho_0 sqrt(n)$ and lower bound $b$. Let $y_(*)$ be its unique root of $F_h$, and set $m_(*) = tanh y_(*)$. This root existence is the source conclusion; the square-root energy dependence below is the new estimate. Define 
$ mu_h \( sigma \) med prop med exp { 1 / 2 sigma^(sans(T)) J_(*) sigma + h^(sans(T)) sigma } \, #h(2em) cal(D)_h \( f \) := cal(E)_(mu_h) \( f \) = sum_i mu_h \[ "Var" \( f divides sigma_(- i) \) \] . $

 For every real $f$ with $N_h = mu_h \[ f^2 \] > 0$ and $nu_h = f^2 mu_h \/ N_h$, 
#[#set math.equation(numbering: n => "(4.22)")
 $ frac(parallel nu_h \[ sigma \] - m_(*) parallel, sqrt(n)) lt.eq C_(upright("lead")) epsilon.alt + C_epsilon.alt / sqrt(n) (1 + sqrt(frac(cal(D)_h \( f \), N_h))) . $ <warm:sqrt-posterior>]

 The constants are uniform in $n \, h \, f$ under these hypotheses. $C_(upright("lead"))$ depends only on the fixed stability and norm bounds; the finite diagnostic length and $C_epsilon.alt$ may depend on $epsilon.alt$. The statement is simultaneous on a fixed compact subinterval of $\( 0 \, 1 \)$ carrying a common strict margin, as in the last paragraph of the proof of #cite(label("CM")) Proposition 17.1.]
] <warm:posterior-mean>

#proof[
  We prove the stronger square-density residual estimate that replaces the linear energy dependence in #cite(label("SG")) Lemma 6.5. Use the zero-diagonal interaction $J_(*)$, so the cube coordinates in this proof are spins, not the scaled edge coordinates. For a spin flip $sigma^(\( i \))$, put
  $ d_i g \( sigma \) = frac(g \( sigma \) - g \( sigma^(\( i \)) \), 2 sigma_i) . $
  The primary iterates of #cite(label("SG")) Section 6 are
  $ m^0 = sigma \, #h(2em) h^1 = h + J_(*) sigma \, #h(2em) m^l = tanh h^l \, #h(2em) b_l = 1 - parallel m^l parallel^2 \/ n \,\
h^(l + 1) = h + J_(*) m^l - j b_l m^(l - 1) \, #h(2em) R_l = m^(l - 1) - m^l . $
  For a fixed ordinary recipe admissible from level $l$, let $U$ be a terminal vector in that recipe. We claim that, whenever $sup_sigma \( \| H_0 \| + parallel d H_0 parallel \) lt.eq C_0$,
  #[#set math.equation(numbering: n => "(4.23)")
   $ lr(|mu_h \[ f^2 H_0 R_l^(sans(T)) U \]|) lt.eq C (N_h + sqrt(N_h cal(D)_h \( f \))) . $ <warm:sqrt-residual>]
  The constant has the dependence on the fixed recipe, depth, coefficient bounds and finite word diagnostics allowed in the source lemma, and is independent of $f$. The residual claim itself does not require root stability.
  Here are the base case and the induction, including the point where the improvement occurs. The pointwise estimate #cite(label("SG")) Lemma 6.4, Equation (6.20) gives
  $ parallel U parallel + sum_i \| d_i U_i \| lt.eq C . $
  It also gives the same bound for $tilde(U) = H_0 U$: indeed
  $ d_i \( H_0 U_i \) = H_0 thin d_i U_i + U_i \( sigma^(\( i \)) \) d_i H_0 \, #h(2em) parallel \( U_i \( sigma^(\( i \)) \) \)_i parallel lt.eq parallel U parallel + 2 parallel "diag" nabla U parallel_2 lt.eq C \, $
  and Cauchy–Schwarz bounds the sum of the added diagonal derivatives. Write $C_U$ for a bound on $parallel tilde(U) parallel + sum_i \| d_i tilde(U)_i \|$.
  Let $p_i^plus.minus = mu_h \( sigma_i = plus.minus 1 divides sigma_(- i) \)$. Then $m_i^1 = p_i^(+) - p_i^(-)$ and the conditional variance is $v_i^1 = 4 p_i^(+) p_i^(-)$, in particular $v_i^1 lt.eq 4 p_i^plus.minus$ for each sign. Since a function of one spin is affine with slope $d_i f$, the form is
  $ cal(D)_h \( f \) = mu_h sum_i v_i^1 \( d_i f \)^2 . $
  The exact one-site integration by parts #cite(label("SG")) Equation (6.31) gives
  $ mu_h \[ f^2 R_1^(sans(T)) tilde(U) \] & = mu_h sum_i v_i^1 d_i \( f^2 tilde(U)_i \)\
 & = mu_h sum_i v_i^1 f^2 d_i tilde(U)_i + mu_h sum_i v_i^1 \( f_(i \, +) + f_(i \, -) \) d_i f thin tilde(U)_i \( sigma^(\( i \)) \) . $
  Here $f_(i \, plus.minus) = f \( sigma^(i \, plus.minus) \)$, and $d_i \( f^2 \) = \( f_(i \, +) + f_(i \, -) \) d_i f$, also for signed $f$. The first term is at most $C_U N_h$ in absolute value. For the second set
  $ M_i \( sigma_(- i) \) = max_plus.minus \| tilde(U)_i \( sigma^(i \, plus.minus) \) \| . $
  At each configuration,
  $ (sum_i M_i \( sigma_(- i) \)^2)^(1 \/ 2) lt.eq parallel tilde(U) \( sigma \) parallel + 2 parallel "diag" nabla tilde(U) \( sigma \) parallel_2 lt.eq 2 C_U . $
  Weighted Cauchy–Schwarz bounds that second term by
  $ cal(D)_h \( f \)^(1 \/ 2) (mu_h sum_i v_i^1 \( f_(i \, +) + f_(i \, -) \)^2 M_i^2)^(1 \/ 2) . $
  The two separate bounds $v_i^1 lt.eq 4 p_i^plus.minus$ imply
  $ v_i^1 \( f_(i \, +) + f_(i \, -) \)^2 lt.eq 8 \( p_i^(+) f_(i \, +)^2 + p_i^(-) f_(i \, -)^2 \) . $
  Since $M_i$ is independent of $sigma_i$, conditioning term by term gives
  $ mu_h sum_i v_i^1 \( f_(i \, +) + f_(i \, -) \)^2 M_i^2 lt.eq 8 mu_h #h(-0.16667em) [f^2 sum_i M_i^2] lt.eq 32 C_U^2 N_h . $
  This proves (4.23) for $l = 1$.
  The finite induction in the source preserves this new right side. For clarity, let $U$ be admissible from level $l + 1$, put $a_l = j \( b_l - b_(l - 1) \)$, and define
  $ U'_i = Phi \( h_i^l \; h_i^(l + 1) \, a_l \) U_i \, #h(2em) Phi \( z \; v \, a \) = integral_0^1 e^(a \( 1 - u^2 \) \/ 2) frac(cosh \( u \( z - v \) \), cosh z cosh v) thin thin upright(d) u . $
  Here $\| a_l \| lt.eq j$. The integral formula bounds $Phi$ and every needed fixed-order derivative uniformly in its two real field arguments: the hyperbolic derivatives introduce bounded hyperbolic-tangent factors, and the exponential factor and its derivatives are bounded for $\| a \| lt.eq j$. Together with the explicit level indices, these bounds make $U'$ admissible from level $l$. The scalar identity in #cite(label("SG")) Section 6 then gives the residual expansion below. Adjoin the auxiliary field
  $ y' = J_(*) U' - j sum_q theta_q m^(q - 1) - j sum_b omega_b w^b \, #h(2em) theta_q = 1 / n sum_i partial_q U'_i \, quad omega_b = 1 / n sum_i partial_(y^b) U'_i . $
  Here $w^b \, y^b$ are the finitely many earlier auxiliary sources and fields of the recipe; the partials differentiate their explicitly displayed local arguments, holding parameters fixed, as in #cite(label("SG")) Definition 6.2. Equation (6.33) of that source is
  $ R_(l + 1)^(sans(T)) U =  & R_l^(sans(T)) y' + a_l R_l^(sans(T)) U' - j b_(l - 1) R_(l - 1)^(sans(T)) U' + j sum_b omega_b R_l^(sans(T)) w^b\
 & + j sum_(q gt.eq l) theta_q R_l^(sans(T)) m^(q - 1) - a_l n theta_l \, $
  with the $R_(l - 1)$ term absent when $l = 1$. All first-line terms are earlier residuals with ordinary admissible sources. Their scalar multipliers and their discrete-gradient norms are bounded by the fixed-recipe bounds. For $q > l$ in the second line, use the source $m^(q - 1) \/ sqrt(n)$ and multiplier $j sqrt(n) thin theta_q$; #cite(label("SG")) Equation (6.21) gives the same boundedness for that multiplier. Finally the exact identity
  $ R_l^(sans(T)) m^(l - 1) = n \( b_l - b_(l - 1) \) - R_l^(sans(T)) m^l $
  cancels the displayed $- a_l n theta_l$. The remainder again uses an earlier residual, the source $m^l \/ sqrt(n)$, and a bounded multiplier. A bounded multiplier $zeta$ with bounded $parallel d zeta parallel$ can always be absorbed into $H_0$, because
  $ d_i \( zeta H_0 \) = zeta \( sigma^(\( i \)) \) d_i H_0 + H_0 \( sigma \) d_i zeta . $
  Every induction call therefore retains the original $f \, N_h \, cal(D)_h \( f \)$. There are finitely many calls with a smaller residual index. This proves (4.23) at every fixed depth.
  We spell out its consequences for selection and the mean. Put $S_l = R_l^(sans(T)) m^l \/ sqrt(n)$. The primary derivative bounds in #cite(label("SG")) Lemma 7.1 give $\| S_l \| lt.eq 2 sqrt(n)$ and $parallel d S_l parallel lt.eq C_l$. Apply (4.23) with $U = m^l \/ sqrt(n)$ and $H_0 = S_l \/ sqrt(n)$. Division by $N_h sqrt(n)$ yields the strengthened form of #cite(label("SG")) Equation (7.1):
  #[#set math.equation(numbering: n => "(4.24)")
   $ nu_h #h(-0.16667em) [(S_l / sqrt(n))^2] lt.eq C_l / sqrt(n) (1 + sqrt(frac(cal(D)_h \( f \), N_h))) . $ <warm:sqrt-selection-moment>]
  For a small fixed $rho > 0$, choose a fixed depth $d$ with $floor.l d \/ 2 floor.r rho^2 \/ 4 > 2$, and then $e_rho > 0$ with $2 d e_rho < 1$. The telescoping identity
  $ frac(parallel R_l parallel^2, n) = b_l - b_(l - 1) - frac(2 S_l, sqrt(n)) $
  shows that $max_(l lt.eq d) \| S_l \| \/ sqrt(n) lt.eq e_rho$ forces a consecutive pair $R_(k - 1) \, R_k$ to have both norms at most $rho sqrt(n) \/ 2$. Otherwise the disjoint pairs would make the sum of squared norms exceed $2$, whereas telescoping bounds it by $1 + 2 d e_rho < 2$.
  As in that source lemma, choose smooth $C_k in \[ 0 \, 1 \]$, equal to one on this smaller pair region and supported where both norms are at most $rho sqrt(n)$. The primary derivative bounds give $parallel d C_k parallel lt.eq C_rho \/ sqrt(n)$. Put
  $ hat(C)_k = C_k product_(i = 2)^(k - 1) \( 1 - C_i \) \, #h(2em) D_(upright("sel")) = 1 - sum_(k = 2)^d hat(C)_k = product_(k = 2)^d \( 1 - C_k \) . $
  Positive deficit implies $max_(l lt.eq d) \| S_l \| \/ sqrt(n) > e_rho$. Chebyshev’s inequality and (4.24) give
  #[#set math.equation(numbering: n => "(4.25)")
   $ nu_h \( D_(upright("sel")) > 0 \) lt.eq C_rho / sqrt(n) (1 + sqrt(frac(cal(D)_h \( f \), N_h))) . $ <warm:sqrt-deficit>]
  The cutoffs are admissible bounded multipliers in (4.23).
  Choose $rho lt.eq epsilon.alt$ with $\( parallel J_(*) parallel + 4 j \) rho < 2 rho_0$. On the support of $C_k$, the recursion gives
  $ F_h \( h^k \) = J_(*) R_k - j b_(k - 1) \( R_(k - 1) + R_k \) + j \( b_k - b_(k - 1) \) m^k \, $
  so $parallel F_h \( h^k \) parallel lt.eq \( parallel J_(*) parallel + 4 j \) rho sqrt(n)$. The root estimate of #cite(label("SG")) Lemma 5.7,
  $ parallel y - y_(*) parallel lt.eq (1 + frac(parallel J_(*) parallel + 3 j, b)) parallel F_h \( y \) parallel quad upright("when ") parallel F_h \( y \) parallel < 2 rho_0 sqrt(n) \, $
  and the Lipschitz property of $tanh$ therefore give $parallel m^k - m_(*) parallel lt.eq C_(upright("lead")) rho sqrt(n)$, with a constant independent of the depth. For a deterministic unit vector $e$, sum (4.23) for $R_1 \, dots.h \, R_k$, with source $e$ and multiplier $hat(C)_k$. Since $sigma - m^k = sum_(l lt.eq k) R_l$, this bounds its reweighted mean against $e$ by $C_rho \( 1 + sqrt(cal(D)_h \( f \) \/ N_h) \)$. The weighted root errors together cost at most $C_(upright("lead")) epsilon.alt sqrt(n)$, because the cutoffs sum to at most one. The remaining deficit costs at most $2 sqrt(n) thin nu_h \( D_(upright("sel")) > 0 \)$, controlled by (4.25). Sum over the fixed number of cutoffs, divide by $sqrt(n)$, and take the supremum over $e$. This proves (4.22). ◻
]

#thm([Lemma 4.6.])[
  (Retention at order-$n$ entropy).  #emph[Fix $0 < lambda < C_(upright("lev")) < oo$, $C_E < oo$, and $0 < omega < 1$. On Gaussian disorder events of probability tending to one, every test (4.3) with $lambda n lt.eq L lt.eq C_(upright("lev")) n$ and 
#[#set math.equation(numbering: n => "(4.26)")
 $ frac(cal(E) \( f \), N) lt.eq C_E n^(1 - omega) $ <warm:large-energy-assumption>]

 has an observation path to a product posterior for which $H_(upright("end")) gt.eq c_(lambda \, C_(upright("lev"))) n$. The path and disorder events are chosen independently of $f$.]
] <warm:large-retention>

#proof[
  We use the path and the field tests in #cite(label("CM")) Section 19.6; we verify that its entropy argument remains valid under (4.26). On source disorder events independent of the initial spin law, the calculation around Equation (19.20) there, using its Lemma 17.4, Equation (17.12), and Proposition 17.5, gives the following early field-test bound. On a fixed interval $\[ t_(*) \, t_b \]$ of small positive scalar precision, the diagnostic and stability failures have integrated probability $o \( 1 \)$, uniformly under every initial spin law. This follows there by conditioning on the spin: the centered Gaussian-noise diagnostics have integrated failure $o \( 1 \)$, the additional spin shift has normalized norm $O \( t \)$, and the Gaussian low-band small-ball estimate is uniform in its center. No factor $e^L$ is used for this interval. From $t_b$ until the interaction coefficient reaches a fixed globally controlled range, the buffered stability test fails anywhere on the path with probability at most $e^(- a n)$ under the ordinary law $Q_mu$, for a fixed $a > 0$. This is the later field bound in #cite(label("CM")) Lemma 17.3, Section 19.4, and Section 19.6 after Equation (19.21). The word diagnostics and stability constants on the retained regions are those of Lemma 19.
  Here is the order of the fixed choices in that construction. Choose first a large scalar endpoint $t_(upright("end"))$ and a small interaction coefficient below which covariance is globally bounded. Choose $t_b > 0$ for the small-positive-field estimate, and obtain the buffer and rate $a$ for the later test. The norm bound and the fixed total duration give constants $C_(upright("jump"))$ and $C_(upright("aft"))$ for the jump loss divided by $t_(*) n$ and the loss after failure divided by $n$, uniformly when $1 - beta' lt.eq t_(*) \/ 3$. Choose a target drift budget $eta_1 > 0$ so that
  $ 3 eta_1 \( 1 + C_(upright("aft")) \/ a \) < lambda \/ 4 . $
  Next choose $0 < t_(*) lt.double t_b$ with $C_(upright("jump")) t_(*) lt.eq eta_1$, and finally $1 - beta' > 0$ sufficiently small relative to these choices, including $1 - beta' lt.eq t_(*) \/ 3$. Start with precision
  $ B_(*) = t_(*) I + \( 1 - beta' \) W \, $
  which is positive when $1 - beta'$ is small enough. Increase scalar precision to $t_(upright("end")) I + \( 1 - beta' \) W$, and then traverse
  $ B_v = \( t_(upright("end")) + 4 v \) I + \( 1 - beta' + v \) W \, #h(2em) 0 lt.eq v lt.eq beta' . $
  The latter rate $4 I + W$ is positive on the norm event. The endpoint is $\( t_(upright("end")) + 4 beta' \) I + W$, so its posterior is a product. Before the globally controlled portion, the posterior interaction coefficient is either $beta' < 1$ or in a fixed compact subinterval of $\( 0 \, 1 \)$. Reduce the available diagonal enlargement in (4.21) to $0 < eta < \( beta' \)^(- 1) - 1$. Once these stability margins and $C_(upright("lead"))$ are fixed, choose the mean accuracy $epsilon.alt$ in Lemma 19 so that its leading error, integrated over the bounded path and converted to a quadratic mean bound, is less than $eta_1$. Then fix its residual tolerance, selection depth, finite word diagnostics and constant $C_epsilon.alt$, and finally take $n$ large.
  On a valid posterior, apply (4.22) to $f$ and to $1$. With $a_u = parallel nu_u \[ X \] - mu_u \[ X \] parallel \/ sqrt(n)$, this gives
  $ a_u lt.eq 2 C_(upright("lead")) epsilon.alt + C_epsilon.alt / sqrt(n) (2 + sqrt(frac(cal(E)_(mu_u) \( f \), N_u))) . $
  By (4.19) and Cauchy–Schwarz, the $Q_nu$-mean of the square root, also with any validity indicator, is at most $sqrt(cal(E) \( f \) \/ N)$. Under (4.26) the resulting error is
  $ C_epsilon.alt / sqrt(n) (2 + sqrt(frac(cal(E) \( f \), N))) = O_epsilon.alt \( n^(- 1 \/ 2) + n^(- omega \/ 2) \) = o \( 1 \) . $
  This bound is applied at deterministic observation times; inserting $upright(bold(1))_({ u < tau })$ for a stopping time only decreases its Cauchy–Schwarz bound. Since $a_u lt.eq 2$ always, $a_u^2 lt.eq 2 a_u$. The early invalid paths cost at most four times their integrated probability, hence $o \( 1 \)$. Thus the normalized quadratic mean-shift integral, on valid paths and before any later stopping, is at most $eta_1 + o \( 1 \)$ by the preceding choice of $epsilon.alt$.
  Let $u_g$ begin the globally controlled portion and let $tau$ be the first failure of the later buffered test in $\[ t_b \, u_g \]$, with the immediate and no-failure conventions of the source. The initial jump leaks at most $C_(upright("jump")) t_(*) n$ entropy: compare to pure noise as above and use $parallel B_(*) parallel lt.eq C t_(*)$ and $parallel X parallel^2 = n$. The stopped form of (4.19), with the preceding integrated estimate, gives, with $Q^tau$ denoting the law of the stopped observations, excluding the spin,
  #[#set math.equation(numbering: n => "(4.27)")
   $ D \( Q_nu^tau bar.v.double Q_mu^tau \) lt.eq \( C_(upright("jump")) t_(*) + eta_1 + o \( 1 \) \) n . $ <warm:stopped-entropy>]
  For the event $E$ of a failure before $u_g$, the ordinary probability is at most $e^(- a n)$. Data processing for its indicator then gives
  $ D \( Q_nu^tau bar.v.double Q_mu^tau \) gt.eq Q_nu \( E \) log frac(1, Q_mu \( E \)) - log 2 \, #h(2em) Q_nu \( E \) lt.eq frac(C_(upright("jump")) t_(*) + eta_1 + o \( 1 \), a) . $
  These are exactly the deductions in #cite(label("CM")) Equations (19.21)–(19.22), now with the enlarged energy range justified by Lemma 19. After a failure the remaining precision rate and duration are bounded, and both spin means have norm at most $sqrt(n)$; the remaining loss per failed path is therefore at most $C_(upright("aft")) n$. The total loss before $u_g$ is bounded by
  $ (C_(upright("jump")) t_(*) + eta_1 + o \( 1 \)) \( 1 + C_(upright("aft")) \/ a \) n . $
  The fixed choices above make this less than $lambda n \/ 4$. The initial entropy is at least $L \/ 2 gt.eq lambda n \/ 2$, hence $H \( u_g \) gt.eq lambda n \/ 4$. In the remaining portion the spin covariance is bounded for every field. The linear entropy test then gives $- dot(H) lt.eq C H$; over its bounded duration it retains a fixed fraction of $H \( u_g \)$. This proves the lemma. ◻
]

#proof[
  Fix $C_(upright("lev")) \, xi$ and a desired disorder confidence. Apply Lemma 17 with $kappa < min { xi \, thin 5 \/ 3 - 1.662 }$. After fixing its $M$, choose its $delta > 0$ as in that proof. For $L lt.eq n^delta$, (4.5) and (4.2) imply both claimed inequalities.
  For $n^delta < L lt.eq lambda n$, use the proportional branch of #cite(label("CM")) Equation (19.16) and Section 19.4. It gives, at the product endpoint,
  #[#set math.equation(numbering: n => "(4.28)")
   $ H_(upright("end")) gt.eq c L \( L \/ n \)^(\( 2 + 2 epsilon.alt \) \/ 3) . $ <warm:moderate-retention>]
  Here $epsilon.alt > 0$ is any fixed sufficiently small tolerance, and $lambda > 0$ is chosen afterward. We justify the exact test class being used. The starting dimension in that source is $max { k_min \, c_0 L }$, with $k_min asymp sqrt(log n)$. It equals $c_0 L$ throughout the present range for large $n$. The proportional part of its initial jump estimate is the pure-noise argument reproduced in Lemma 17; it requires only the entropy at least $L \/ 2$ and density at most $e^L$. The source’s support condition is used in its other, minimum-dimension branch. Its subsequent propagation uses the likelihood and conditional-entropy tails in #cite(label("CM")) Equation (19.8) and the ordinary path tests. These also require only the same density and entropy bounds. The continuation through its finite remaining scales uses those likelihood tails and conditional Pinsker bounds, then globally bounded covariance, and so preserves this test class. Thus (4.28) applies to (4.3) without a support restriction.
  Since $L gt.eq n^delta gt.double log n$, comparison with the first bound of (4.20) gives
  $ T_n thin frac(cal(E) \( f \), N) gt.eq c n^(- 2 epsilon.alt \/ 3) L^(7 \/ 6 + 2 epsilon.alt \/ 3) gt.eq c L^(7 \/ 6 - \( 2 epsilon.alt \/ 3 \) \( 1 \/ delta - 1 \)) . $
  The additive $O \( n^(- 3) \)$ is smaller than (4.28). The second product bound similarly gives
  $ T_n thin frac(cal(I) \( f^2 \), N) gt.eq c n^(- 2 epsilon.alt \/ 3) L^(5 \/ 3 + 2 epsilon.alt \/ 3) gt.eq c L^(5 \/ 3 - \( 2 epsilon.alt \/ 3 \) \( 1 \/ delta - 1 \)) . $
  Choose $epsilon.alt$ after $delta$ so that
  $ frac(2 epsilon.alt, 3) \( 1 \/ delta - 1 \) < min { xi \, thin 7 \/ 6 - 1.162 } . $
  Then choose $lambda$ below the finitely many fixed rates and shift buffers in that source argument. This proves the profiles in the moderate range.
  Finally let $lambda n lt.eq L lt.eq C_(upright("lev")) n$. If the classical bound were false, then $cal(E) \( f \) \/ N lt.eq C n^(1.162 - 2 \/ 3)$. This meets (4.26) for a fixed positive $omega$, whereas the first product bound would give
  $ H_(upright("end")) lt.eq C n^(1 \/ 2 + 1.162 - 2 \/ 3) + O \( n^(- 3) \) = o \( n \) \, $
  contrary to Lemma 20. If the modified bound were false, (4.2) would instead give $cal(E) \( f \) \/ N lt.eq C n^(1 - xi)$, so that lemma applies with $omega = xi$. The second product bound would give $H_(upright("end")) lt.eq C n^(1 - xi) = o \( n \)$, again a contradiction.
  All the choices are uniform in $f$. More explicitly, the variance exponent and $M$ are fixed first, then the small $delta$, then the sharp cap and moderate-entropy tolerances, then $lambda$ and the fixed parameters of the order-$n$ path. The finite word length in that last path is fixed after its mean accuracy. The final threshold $K_0$ and $n$ are chosen last. Intersecting this finite collection of disorder events preserves arbitrarily high limiting probability. This proves the proposition. ◻
]

=== 4.3 Passage from profiles to arbitrary initial laws <warm:layers-section>

On the norm event $parallel W parallel lt.eq 3$, comparison of the largest and smallest spin Hamiltonians gives

#[#set math.equation(numbering: n => "(4.29)")
 $ min_sigma mu \( sigma \) gt.eq e^(- C_a n) $ <warm:atom>]

for an absolute $C_a$. In the remainder of the proof choose $C_(upright("lev")) > 2 C_a + 1$ in Proposition 16. For any density $z gt.eq 0$, $mu \[ z \] = 1$ implies $z \( sigma \) lt.eq 1 \/ mu \( sigma \)$; thus every nonempty positive logarithmic level of $z$ lies below $C_a n$.

We first isolate the bounded test associated with one such level. This same construction will be used for entropy and higher log moments.

#thm([Lemma 4.7.])[
  (A bounded test from a logarithmic level).  #emph[Fix $b > 0$ and $r > 0$. Let $z > 0$ be a density and suppose that, for some $d gt.eq v \/ 2$ and sufficiently large $v$, 
$ B = mu \[ z upright(bold(1))_({ d lt.eq log z lt.eq 1.1 d }) \] gt.eq b \( v \/ d \)^r > 0 . $

 Define 
#[#set math.equation(numbering: n => "(4.30)")
 $ u = cal(U)_d \( z \) := min { e^(1.1 d) \, thin z min \( 1 \, z e^(- 0.8 d) \) } \, #h(2em) f^2 = e^(- 1.1 d) u . $ <warm:level-transform>]

 Then $0 lt.eq f lt.eq 1$, $B lt.eq mu \[ u \] lt.eq 1$, and, if $N = mu \[ f^2 \] = e^(- L)$, 
$ 1.1 d lt.eq L lt.eq 1.1 d + C_(b \, r) #scale(x: 120%, y: 120%)[\(] 1 + log_(+) \( d \/ v \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) D #h(-0.16667em) (frac(f^2 mu, N) mid(bar.v.double) mu) gt.eq L \/ 2 . $

 For large $v \, n$, this test lies in the range $K_0 lt.eq L lt.eq C_(upright("lev")) n$ of Proposition 16. In addition, 
#[#set math.equation(numbering: n => "(4.31)")
 $ cal(I) \( cal(U)_d \( z \) \) lt.eq 4 cal(I) \( z \) . $ <warm:level-dissipation>]

]
] <warm:log-layer>

#proof[
  In logarithmic coordinates $l = log z$, the logarithm of $cal(U)_d \( e^l \)$ is
  $ 2 l - 0.8 d quad \( l lt.eq 0.8 d \) \, #h(2em) l quad \( 0.8 d lt.eq l lt.eq 1.1 d \) \, #h(2em) 1.1 d quad \( l gt.eq 1.1 d \) . $
  Consequently $u lt.eq z$, and $u = z$ on the indicated level. This proves $B lt.eq mu \[ u \] lt.eq 1$ and $L = 1.1 d - log mu \[ u \]$, with the stated upper bound from the lower bound on $B$.
  Let $E = { log z gt.eq 0.7 d }$. Since $u lt.eq e^(- 0.1 d) z$ on its complement,
  $ frac(mu \[ u upright(bold(1))_(E^c) \], mu \[ u \]) lt.eq e^(- 0.1 d) / B \, #h(2em) mu \( E \) lt.eq e^(- 0.7 d) . $
  Set $e_d = e^(- 0.1 d) \/ B$. Data processing for the indicator of $E$ gives
  $ D #h(-0.16667em) (frac(u mu, mu \[ u \]) mid(bar.v.double) mu) gt.eq \( 1 - e_d \) log frac(1, mu \( E \)) - log 2 gt.eq 0.7 d \( 1 - e_d \) - log 2 . $
  Uniformly for $d gt.eq v \/ 2$, the hypothesis on $B$ makes $e_d arrow.r 0$ and $1 + log_(+) \( d \/ v \) = o \( d \)$ as $v arrow.r oo$. The last lower bound therefore exceeds $L \/ 2$ for large $v$. The level is nonempty, so $d lt.eq C_a n$ by (4.29); the bound on $L$, with $C_(upright("lev")) > 2 C_a + 1$, puts it below $C_(upright("lev")) n$ for large $n$. Its lower bound puts it above $K_0$ for large $v$.
  Finally $cal(U)_d$ is nondecreasing and $2$-Lipschitz as a function of $z$, while $log cal(U)_d \( e^l \)$ is nondecreasing and $2$-Lipschitz as a function of $l$. The product of their increments on an edge is at most four times the product of the increments of $z$ and $log z$. Summing proves (4.31). ◻
]

#thm([Lemma 4.8.])[
  (Entropy dissipation for every density).  #emph[With tight constants, every strictly positive density $z$ with $"Ent"_mu \( z \) gt.eq K_1$ satisfies 
#[#set math.equation(numbering: n => "(4.32)")
 $ T_n cal(I) \( z \) gt.eq c thin "Ent"_mu \( z \)^1.662 . $ <warm:full-entropy-profile>]

]
] <warm:entropy-profile>

#proof[
  Put $H = "Ent"_mu \( z \)$ and $d_j = \( H \/ 2 \) \( 1.1 \)^j$. The part of $mu \[ z log z \]$ with $log z < H \/ 2$ is at most $H \/ 2$. Thus the levels $\[ d_j \, 1.1 d_j \]$ account for at least $H \/ 2$. If their tilted masses $B_j$ were all less than $c \( H \/ d_j \)^1.1$, their contribution would be at most
  $ 1.1 sum_(j gt.eq 0) d_j B_j < 1.1 c H^1.1 sum_(j gt.eq 0) d_j^(- 0.1) lt.eq C c H . $
  Choose $c$ small. One level therefore has $B gt.eq c \( H \/ d \)^1.1$. Apply Lemma 21 with $v = H$ and $r = 1.1$, followed by (4.4) with any fixed $xi < 5 \/ 3 - 1.662$. Homogeneity of $cal(I)$ gives
  $ T_n cal(I) \( z \) gt.eq 1 / 4 T_n cal(I) \( u \) gt.eq c thin mu \[ u \] L^1.662 gt.eq c B d^1.662 gt.eq c' H^1.1 d^0.562 gt.eq c'' H^1.662 . $
  The constants and the required lower threshold on $H$ are uniform. ◻
]

For the kernel we need a classical support profile. The next deduction is the equal-height and dyadic-layer argument of #cite(label("CM")) Lemma 19.1, keeping the two powers from (4.4).

#thm([Lemma 4.9.])[
  (A support profile).  #emph[With the constants and $delta$ of Proposition 16, every nonnegative $g$, supported on a set of $mu$-mass $e^(- L_(upright("supp")))$ with $L_(upright("supp")) gt.eq K_0$, satisfies 
#[#set math.equation(numbering: n => "(4.33)")
 $ T_n cal(E) \( g \) gt.eq c mu \[ g^2 \] thin Phi_n \( L_(upright("supp")) \) \, #h(2em) Phi_n \( L \) = cases(delim: "{", min { L^1.654 \, thin n^(1.154 delta) } \, & L lt.eq n^delta \,, L^1.154 \, & L > n^delta .) $ <warm:support-bound>]

 The zero function satisfies the assertion by convention.]
] <warm:support-profile>

#proof[
  First let $0 lt.eq g lt.eq 1$ equal one on a nonempty set of mass $a = e^(- L_a)$, and let its support have mass at most $e^(- L_(upright("supp")))$. Take
  $ K = ⌈log_2 \( 1 + L_a \/ L_(upright("supp")) \)⌉ \, #h(2em) g_i = K #scale(x: 120%, y: 120%)[\(] \( g - i \/ K \)_(+) and K^(- 1) #scale(x: 120%, y: 120%)[\)] \, quad 0 lt.eq i < K . $
  Let $S_i = mu \( g > i \/ K \)$, $T_i = mu \( g gt.eq i \/ K \)$. Some $i$ satisfies $T_(i + 1) gt.eq S_i^2$; otherwise induction gives $a lt.eq T_K < e^(- 2^K L_(upright("supp"))) < a$. For this $i$, with $N_i = mu \[ g_i^2 \]$,
  $ a lt.eq T_(i + 1) lt.eq N_i lt.eq S_i \, #h(2em) D #h(-0.16667em) (frac(g_i^2 mu, N_i) mid(bar.v.double) mu) gt.eq log \( 1 \/ S_i \) gt.eq 1 / 2 log \( 1 \/ N_i \) . $
  Its logarithmic inverse mass $L_i$ lies in $\[ L_(upright("supp")) \, L_a \]$, and $L_a lt.eq C_a n$ by (4.29). For $L gt.eq K_0$ large enough, the function
  $ e^(- L) cases(delim: "{", L^1.662 \, & L lt.eq n^delta \,, L^1.162 \, & L > n^delta) $
  is decreasing within each range and has a downward jump at their boundary. Since $cal(E) \( g_i \) lt.eq K^2 cal(E) \( g \)$, (4.4) implies
  $ T_n cal(E) \( g \) gt.eq frac(c a, \( 1 + log L_a \)^2) cases(delim: "{", L_a^1.662 \, & L_a lt.eq n^delta \,, L_a^1.162 \, & L_a > n^delta .) $
  Absorbing the logarithmic denominator by lowering each exponent by $0.008$ gives
  #[#set math.equation(numbering: n => "(4.34)")
   $ T_n cal(E) \( g \) gt.eq c a cases(delim: "{", L_a^1.654 \, & L_a lt.eq n^delta \,, L_a^1.154 \, & L_a > n^delta .) $ <warm:set-capacity>]
  Indeed $L^0.008 \/ \( 1 + log L \)^2$ has a positive infimum for $L gt.eq K_0$.
  For arbitrary nonnegative $g$ with the stated support, use $phi_j = \( g - 2^j \)_(+) and 2^j$, $j in bb(Z)$, and let $a_(j + 1) = mu \( g gt.eq 2^(j + 1) \)$. Omit empty upper level sets. The normalized layer $2^(- j) phi_j$ is one on that set and has the original support restriction. Its $L_a = log \( 1 \/ a_(j + 1) \)$ is at least $L_(upright("supp"))$. The right side of (4.34), divided by $a$, is at least $Phi_n \( L_(upright("supp")) \)$: before the boundary it is at least $L_(upright("supp"))^1.654$, and after the boundary it is at least $n^(1.154 delta)$, or at least $L_(upright("supp"))^1.154$ when $L_(upright("supp")) > n^delta$. For each oriented edge the nonnegative increments of the $phi_j$’s sum to the increment of $g$, so the sum of their squares is at most its square. Therefore
  $ T_n cal(E) \( g \) gt.eq sum_j T_n cal(E) \( phi_j \) gt.eq c Phi_n \( L_(upright("supp")) \) sum_j 4^j a_(j + 1) . $
  Pointwise, $sum_j 4^j upright(bold(1))_({ g gt.eq 2^(j + 1) }) gt.eq g^2 \/ 12$. Integration proves (4.33). ◻
]

#proof[
  Fix the parameters in the theorem and intersect the finitely many events needed for the preceding results. The finite heat-bath chain has a strictly positive kernel at every positive time. Hence $w_s^rho > 0$ for $s > 0$, for every initial law, and symmetry of the generator gives
  $ frac(thin upright(d), thin upright(d) s) "Ent"_mu \( w_s^rho \) = - T_n cal(I) \( w_s^rho \) . $
  When the entropy exceeds the threshold of Lemma 22, its derivative is at most $- c "Ent"_mu \( w_s^rho \)^1.662$. Integrating this differential inequality from any earlier positive time, and then letting that time decrease to zero, yields uniformly in the initial law
  $ "Ent"_mu \( w_s^rho \) lt.eq C (1 + s^(- 1 \/ 0.662)) lt.eq C' (1 + s^(- 1.54)) . $
  This proves (4.1).
  For the kernel, put $Q_s = mu \[ \( w_s^rho \)^2 \] = e^(L_s)$. The atom bound gives $Q_s lt.eq e^(C_a n)$, so its logarithm is within the range where the support profile was proved. Whenever $L_s$ is large, set $g = \( w_s^rho - Q_s \/ 4 \)_(+)$. Its support has mass at most $4 e^(- L_s)$ by $mu \[ w_s^rho \] = 1$, and
  $ mu \[ g^2 \] gt.eq Q_s - 2 \( Q_s \/ 4 \) mu \[ w_s^rho \] = Q_s \/ 2 \, #h(2em) cal(E) \( g \) lt.eq cal(E) \( w_s^rho \) . $
  Its actual support logarithm is
  $ L_(upright("supp")) = log frac(1, mu { w_s^rho > Q_s \/ 4 }) gt.eq L_s - log 4 . $
  The support is nonempty by the preceding square-mass bound, so (4.29) also gives $L_(upright("supp")) lt.eq C_a n$. Since $dot(Q)_s = - 2 T_n cal(E) \( w_s^rho \)$, Lemma 23 and monotonicity of $Phi_n$ give
  $ - dot(L)_s gt.eq c thin Phi_n \( L_s - log 4 \) $
  above a fixed threshold. A shift of the argument by $log 4$ only changes constants there. For any large $K'$, the time allowed by this differential inequality above $K'$ is at most
  #[#set math.equation(numbering: n => "(4.35)")
   $ integral_(K')^oo frac(C thin thin upright(d) L, Phi_n \( L \)) lt.eq C \( K' \)^(- 0.654) + C n^(- 0.154 delta) . $ <warm:hitting-integral>]
  For completeness, below $n^(delta \( 1.154 \/ 1.654 \))$ integrate $L^(- 1.654)$. The following constant portion of $Phi_n$, up to $n^delta$, costs at most $n^delta \/ n^(1.154 delta)$, and the integral of $L^(- 1.154)$ above $n^delta$ has the same order. Inverting (4.35) gives
  $ L_s lt.eq C \( 1 + s^(- 1 \/ 0.654) \) #h(2em) upright("for ") s gt.eq C n^(- 0.154 delta) \, $
  uniformly even for point initial laws. Reversibility and two half steps show that
  $ p_(s T_n) \( sigma \, tau \) = mu \[ p_(s T_n \/ 2) \( sigma \, dot.op \) p_(s T_n \/ 2) \( tau \, dot.op \) \] lt.eq #scale(x: 120%, y: 120%)[\(] mu \[ p_(s T_n \/ 2) \( sigma \, dot.op \)^2 \] thin mu \[ p_(s T_n \/ 2) \( tau \, dot.op \)^2 \] #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  The preceding bound, with $1 \/ 0.654 < 1.54$, proves (4.1) after enlarging the vanishing threshold.
  We finish by proving (4.1). For the fixed integer $m gt.eq 1$, let $Psi_m$ be the convex function on $\( 0 \, oo \)$ determined by
  $ Psi_m \( 1 \) = Psi'_m \( 1 \) = 0 \, #h(2em) Psi''_m \( z \) = frac(\( 1 + \| log z \| \)^(m - 1), z) . $
  It extends continuously to zero: in its twice-integrated formula the possible singularity is bounded by $integral_0^1 \( 1 + \| log z \| \)^(m - 1) thin upright(d) z < oo$. For a density $z$, put
  $ V_m \( z \) = mu \[ Psi_m \( z \) \] \, #h(2em) sans(M)_m \( z \) = (1 + mu \[ z \( log_(+) z \)^m \])^(1 \/ m) . $
  There are constants depending only on $m$ such that
  #[#set math.equation(numbering: n => "(4.36)")
   $ c_m sans(M)_m \( z \)^m - C_m lt.eq V_m \( z \) lt.eq C_m sans(M)_m \( z \)^m . $ <warm:moment-comparison>]
  Indeed for $z gt.eq 1$, $Psi'_m \( z \) = \( \( 1 + log z \)^m - 1 \) \/ m$. Integrating this on $\[ 1 \, z \]$ gives upper and lower bounds of order $z \( log z \)^m$ when $log z$ is large; the remaining range contributes at most a constant times $1 + z$. On $\[ 0 \, 1 \]$ $Psi_m$ is bounded.
  For a strictly positive density $z$, define the corresponding dissipation $cal(D)_m \( z \) = cal(E) \( z \, Psi'_m \( z \) \)$. We claim that, for $sans(M)_m \( z \)$ above a fixed threshold,
  #[#set math.equation(numbering: n => "(4.37)")
   $ T_n cal(D)_m \( z \) gt.eq c_(m \, xi) sans(M)_m \( z \)^(m + 2 \/ 3 - xi) . $ <warm:moment-dissipation>]
  Put $V = sans(M)_m \( z \)$ and use levels $d_j = \( V \/ 2 \) \( 1.1 \)^j$. If $V$ is large, the part of $mu \[ z \( log_(+) z \)^m \]$ below $V \/ 2$ is at most $2^(- m) V^m$. Geometric summation as in Lemma 22 gives a level $d gt.eq V \/ 2$ with
  $ B = mu \[ z upright(bold(1))_({ d lt.eq log z lt.eq 1.1 d }) \] gt.eq c_m \( V \/ d \)^(m + 0.1) . $
  Indeed otherwise $\( 1.1 \)^m sum_j d_j^m B_j lt.eq C_m c_m V^m$ would be too small. The test $u = cal(U)_d \( z \)$ from Lemma 21 therefore satisfies (4.3), and (4.4) gives
  #[#set math.equation(numbering: n => "(4.38)")
   $ T_n cal(I) \( u \) gt.eq c thin mu \[ u \] L^(5 \/ 3 - xi) gt.eq c B d^(5 \/ 3 - xi) . $ <warm:moment-layer-profile>]
  We check that the new dissipation controls this layer with its additional weight $d^(m - 1)$. On an edge write $a gt.eq b > 0$, $x = log a$, $y = log b$. Then
  $ Psi'_m \( a \) - Psi'_m \( b \) = integral_y^x \( 1 + \| t \| \)^(m - 1) thin upright(d) t . $
  If $x gt.eq 0.4 d$, the last integral is at least $c_m d^(m - 1) \( x - y \)$. To verify this uniformly in $y$, use the top half of $\[ 0 \, x \]$ when $- x lt.eq y lt.eq x \/ 2$, the entire interval when $y gt.eq x \/ 2$, and the negative half nearest $y$ when $y < - x$; in each case a fixed fraction of the interval has $\| t \|$ at least a fixed fraction of $x$. The two Lipschitz bounds in the proof of Lemma 21 then apply. If $x < 0.4 d$, both endpoints are in the lower branch of $cal(U)_d$. On $\[ b \, a \]$ its derivative is at most $2 e^(- 0.4 d)$, while its logarithm has slope two in log coordinates. Since $d^(m - 1) e^(- 0.4 d) lt.eq C_m$, the same conclusion follows using $\( 1 + \| t \| \)^(m - 1) gt.eq 1$. Thus in both cases
  $ d^(m - 1) #scale(x: 120%, y: 120%)[\(] cal(U)_d \( a \) - cal(U)_d \( b \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] log cal(U)_d \( a \) - log cal(U)_d \( b \) #scale(x: 120%, y: 120%)[\)] lt.eq C_m \( a - b \) #scale(x: 120%, y: 120%)[\(] Psi'_m \( a \) - Psi'_m \( b \) #scale(x: 120%, y: 120%)[\)] . $
  Summation gives $cal(D)_m \( z \) gt.eq c_m d^(m - 1) cal(I) \( u \)$. Combining this with (4.38) and the lower bound on $B$, and using $2 \/ 3 - xi > 0.1$, gives
  $ T_n cal(D)_m \( z \) gt.eq c B d^(m + 2 \/ 3 - xi) gt.eq c_m V^(m + 0.1) d^(2 \/ 3 - xi - 0.1) gt.eq c'_m V^(m + 2 \/ 3 - xi) . $
  This proves (4.37).
  Along the finite semigroup at positive times,
  $ frac(thin upright(d), thin upright(d) s) V_m \( w_s^rho \) = - T_n cal(D)_m \( w_s^rho \) . $
  Equations (4.36)–(4.37) give, above a fixed threshold,
  $ frac(thin upright(d), thin upright(d) s) V_m \( w_s^rho \) lt.eq - c V_m \( w_s^rho \)^(1 + \( 2 \/ 3 - xi \) \/ m) . $
  Integrating from an earlier positive time and letting that time decrease to zero yields $V_m \( w_s^rho \) lt.eq C \( 1 + s^(- m \/ \( 2 \/ 3 - xi \)) \)$. The comparison (4.36) proves (4.1). This argument allows initial zeros, because $Psi_m$ is continuous at zero and the kernel is strictly positive afterward.
  The three conclusions (4.1)–(4.1) depend only on the off-diagonal couplings. Let $cal(G)_n^(upright("aug"))$ be the final event in the augmented Gaussian space, and put
  $ cal(G)_n^(upright("off")) = {W_(upright("off")) : bb(P) \( cal(G)_n^(upright("aug")) divides W_(upright("off")) \) > 0} . $
  Then $bb(P) \( cal(G)_n^(upright("off")) \) gt.eq bb(P) \( cal(G)_n^(upright("aug")) \)$. For fixed off-diagonal couplings the three inequalities are deterministic, so their validity on an augmented realization in $cal(G)_n^(upright("aug"))$ descends to $cal(G)_n^(upright("off"))$. Taking this as the theorem event proves the stated disorder quantifiers. ◻
]

#thm([Corollary 4.10.])[
  (A polynomial tail bound for the heat-kernel logarithm).  #emph[Fix $beta > 0$, $A > 0$, $0 < C_star.op < oo$, and $theta.alt > 0$. On Gaussian disorder events of limiting lower probability at least $1 - theta.alt$, with a fixed constant $C$, 
#[#set math.equation(numbering: n => "(4.39)")
 $ sup_sigma med sup_(1 lt.eq d lt.eq C_star.op T_n) sum_tau P_d \( sigma \, tau \) upright(bold(1))_({log p_d \( sigma \, tau \) > 1 / 2 n^beta \( T_n \/ d \)^(3 \/ 2)}) lt.eq C n^(- A) $ <warm:kernel-tail>]

 for all sufficiently large $n$. For any initial law $rho$, averaging the displayed row probabilities over $sigma tilde.op rho$ preserves the same bound.]
] <warm:kernel-log-tail>

#proof[
  Choose $xi > 0$ so small that
  $ frac(xi, 2 \/ 3 - xi) < beta / 2 \, $
  then choose a fixed integer $m > 2 A \/ beta$. Apply (4.1) to the point initial law at $sigma$ and time $s = d \/ T_n$. Set $v = T_n \/ d$. Uniformly for $1 lt.eq d lt.eq C_star.op T_n$, so $C_star.op^(- 1) lt.eq v lt.eq n^(2 \/ 3)$,
  $ frac(1 + v^(1 \/ \( 2 \/ 3 - xi \)), n^beta v^(3 \/ 2)) lt.eq C_(xi \, C_star.op) n^(- beta + xi \/ \( 2 \/ 3 - xi \)) lt.eq C_(xi \, C_star.op) n^(- beta \/ 2) . $
  Markov’s inequality under the transition law $P_d \( sigma \, tau \) = mu \( tau \) p_d \( sigma \, tau \)$ now bounds the left side of (4.39) by
  $ (frac(2 { 1 + mu \[ p_d \( sigma \, dot.op \) \( log_(+) p_d \( sigma \, dot.op \) \)^m \] }^(1 \/ m), n^beta \( T_n \/ d \)^(3 \/ 2)))^m lt.eq C_m n^(- m beta \/ 2) lt.eq C_m n^(- A) . $
  The choices of $xi \, m$ are fixed in that order before $n$. The statement for $sigma tilde.op rho$ follows by averaging these row-specific probabilities. ◻
]

== 5 Positive-time Gaussian limits and the uniform start <sec:gaussian-limits>

Two inputs give the positive-time edge evolution. For bounded cylinder sources, the finite Markov resolvent contraction bounds the optimizers used in the stationary relaxed-energy theorem. A variational argument then gives the required strong semigroup convergence. The warming kernel bound controls the evolved densities, whose weak limits inherit that evolution. Warming also controls the total mass in a growing block of edge modes. A rotation argument distributes that mass among individual modes and retains information specific to the uniform start.

Throughout this section we use Gaussian couplings and the completed GOE matrix of Section 2, writing $Lambda = "diag" \( lambda_1 \, dots.h \, lambda_n \)$. Write $w_(n \, s) = d \( nu_n P_(s T_n) \) \/ d mu$ when the system size needs emphasis. We use the represented-subsequence convention of that section and denote the probability and expectation on a representation by $hat(bb(P))$ and $hat(bb(E))$.

#thm([Proposition 5.1.])[
  (Positive-time Gaussian subsequential limits).  #emph[Every sequence of Gaussian system sizes tending to infinity has a further represented subsequence on which the following assertions hold almost surely. The edge coordinates converge to $g$, and there is a measurable random family $h_s in L^2 \( Pi_g \)$, $s > 0$, with the following properties. The family may at this stage depend on the represented data in addition to $g$.]
  #emph[There is a finite random $C gt.eq 1$, independent of $s \, t$, such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ 0 lt.eq h_s lt.eq cal(K) \( s \) := C exp \( C s^(- 77 \/ 50) \) \, #h(2em) Pi_g \[ h_s \] = 1 \, #h(2em) h_(s + t) = S_t^g h_s \, #h(2em) s \, t > 0 \, $ <glim:density-family>]

 where $S_t^g = exp \( - t c_(*) H_g \)$. The map $s mapsto h_s$ is continuous in $L^2 \( Pi_g \)$. For each $t > 0$, $S_t^g$ has a nonnegative symmetric kernel $k_t^g$ relative to $Pi_g$ satisfying 
#[#set math.equation(numbering: n => "(5.2)")
 $ 0 lt.eq k_t^g \( x \, y \) lt.eq cal(K) \( t \) quad upright("for ") Pi_g ⊗ Pi_g upright("-almost every ") \( x \, y \) . $ <glim:limit-kernel>]

 The constant $77 \/ 50$ is the exponent $1.54$ in Theorem 15.]
  #emph[On this subsequence, 
#[#set math.equation(numbering: n => "(5.3)")
 $ A_(n \, J) arrow.r A_g quad upright("in ") C_(upright("loc")) \( \( 0 \, oo \) \) \, #h(2em) B_(n \, J) arrow.r B_h quad upright("in ") C_(upright("loc")) \( \( 0 \, oo \)^2 \) \, $ <glim:functional-subsequence>]

 where 
#[#set math.equation(numbering: n => "(5.4)")
 $ B_h \( s \, t \) = sum_(a gt.eq 1) Pi_g \[ h_s x_a thin S_t^g x_a \] . $ <glim:correlation-series>]

 The series in (5.4) converges locally uniformly and is continuous. Finally, 
#[#set math.equation(numbering: n => "(5.5)")
 $ parallel h_s - 1 parallel_(L^2 \( Pi_g \)) arrow.r 0 \, #h(2em) B_h \( s \, dot.op \) arrow.r A_g \( dot.op \) quad upright("in ") C_(upright("loc")) \( \( 0 \, oo \) \) quad \( s arrow.r oo \) . $ <glim:relaxation>]

]
] <prop:gaussian-subsequence>

#proof[
  We first pass the semigroups on bounded sources, then construct the densities, and finally justify the sum over all edge coordinates.
  ===== 5.1 Varying $L^2$ spaces. <varying-l2-spaces.>
  Choose a countable family $ C$ of smooth compact cylinders with this approximation property: every smooth compact cylinder is approximated uniformly, together with its first derivatives, by elements of $ C$ supported in one fixed compact coordinate set. Rational smooth approximations on rational boxes give such a family. The stated approximation and the definition of the closed form make $ C$ dense in its form norm, and also dense in $L^2 \( Pi_g \)$. For linear tests put $ V = "span"_(bb(Q)) \(  C union { 1 } \)$. This is a countable family of bounded smooth cylinders, dense in $L^1 \( Pi_g \)$ and $L^2 \( Pi_g \)$. If $phi.alt in  V$ depends on the first $d$ coordinates, let $phi.alt_n = phi.alt \( x_1 \, dots.h \, x_d \)$ on the finite cube.
  The static cylinder and moment convergence of #cite(label("FUA")) Corollary 3.3 gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ mu \[ phi.alt_n psi_n \] arrow.r Pi_g \[ phi.alt psi \] quad \( phi.alt \, psi in  V \) . $ <glim:static-pairings>]
  On sequences bounded in $L^2 \( mu \)$, the weak convergence of Section 2 can be tested on this countable family: the pairings with every $phi.alt in  V$ converge to the corresponding pairings with $f$ if and only if the pairings with every smooth compact cylinder do. To pass from $ V$ to an arbitrary smooth compact cylinder, approximate it uniformly on a common support by $ C$, and use the uniform $L^2$ bound to control the pairing error in both spaces. The converse follows from the same approximation, with cutoffs tending to one for the constant test. A sequence bounded in $L^2 \( mu \)$ has a weakly convergent subsequence: diagonal extraction of its pairings defines a bounded linear functional on the cylinder span by (5.6), and the Riesz representation theorem supplies its $L^2 \( Pi_g \)$ representative. The same argument gives
  $ parallel f parallel_(L^2 \( Pi_g \)) lt.eq liminf_n parallel f_n parallel_(L^2 \( mu \)) . $
  As in Section 2, the convergence is strong when the norms also converge. For such a sequence,
  #[#set math.equation(numbering: n => "(5.7)")
   $ lim_n parallel f_n - phi.alt_n parallel_(L^2 \( mu \))^2 = parallel f - phi.alt parallel_(L^2 \( Pi_g \))^2 quad \( phi.alt in  C \) . $ <glim:common-approximation>]
  Consequently strong convergence is equivalent to approximation, in both spaces, by the same cylinders. In particular, the pairing of an $L^2$-bounded weakly convergent sequence with a strongly convergent sequence converges.
  ===== 5.2 Resolvents from bounded optimizers. <resolvents-from-bounded-optimizers.>
  Set
  $ frak(q)_n = T_n cal(E) \, quad frak(A)_n = T_n H_n \, #h(2em) frak(q) = c_(*) Pi_g \[ \| nabla dot.op \|^2 \] \, quad frak(A) = c_(*) H_g . $
  For $phi.alt in  C$ and rational $z > 0$, consider
  $ u_n = \( z + frak(A)_n \)^(- 1) phi.alt_n \, #h(2em) u = \( z + frak(A) \)^(- 1) phi.alt . $
  The finite Markov property gives $parallel u_n parallel_oo lt.eq z^(- 1) parallel phi.alt parallel_oo$. The resolvent identity also bounds $parallel u_n parallel_2$ and $frak(q)_n \( u_n \)$ uniformly. Thus these particular optimizers satisfy the polynomial supremum bound as well as the norm and energy bounds in the relaxed-energy theorem #cite(label("FUA")) Theorem 6.8. That theorem applies to disorder-dependent tests under the class-uniform quenched convention recorded in Section 2. This proof invokes it only for the countably specified optimizer sequences, one for each $phi.alt in  C$ and rational $z > 0$, on their common represented event. Its lower bound therefore gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ liminf_n frak(q)_n \( u_n \) gt.eq frak(q) \( U \) quad upright("whenever ") u_n upright(" has weak limit ") U . $ <glim:optimizer-liminf>]
  Here is the variational passage, including the norm conclusion. Let
  $ v_n = sup_f { 2 chevron.l phi.alt_n \, f chevron.r_mu - z parallel f parallel_2^2 - frak(q)_n \( f \) } = chevron.l phi.alt_n \, u_n chevron.r_mu = z parallel u_n parallel_2^2 + frak(q)_n \( u_n \) \, $
  and define $v$ by the analogous supremum in $L^2 \( Pi_g \)$. Take an optimizer subsequence attaining the upper limit and then a weak limit $U$. The norm lower bound and (5.8) imply
  $ limsup_n v_n lt.eq 2 chevron.l phi.alt \, U chevron.r_(Pi_g) - z parallel U parallel_2^2 - frak(q) \( U \) lt.eq v . $
  For the reverse inequality, take $F in  C$. The recovery part of #cite(label("FUA")) Theorem 6.8 supplies, for each fixed recovery index $j$, polynomially bounded finite functions strongly converging to $F$, whose energies converge to $frak(q) \( F \)$ in the order $n arrow.r oo$, then $j arrow.r oo$. Testing the variational supremum with these functions in exactly that order gives
  $ liminf_n v_n gt.eq 2 chevron.l phi.alt \, F chevron.r_(Pi_g) - z parallel F parallel_2^2 - frak(q) \( F \) . $
  The form density of $ C$ allows the supremum over $F$, proving $v_n arrow.r v$. Only the countably many sources in $ C$ and rational $z$ are used on the common source event. The limiting variational problem is strictly concave, so every weak optimizer limit is its unique optimizer $u$. Moreover,
  $ limsup_n z parallel u_n parallel_2^2 lt.eq v - frak(q) \( u \) = z parallel u parallel_2^2 . $
  Together with norm lower semicontinuity this proves strong convergence of $u_n$ to $u$. This is the bounded-source version of the variational argument in #cite(label("FUA")) proof of Lemma 7.2.
  The bound $parallel \( z + frak(A)_n \)^(- 1) parallel_(2 arrow.r 2) lt.eq z^(- 1)$ and (5.7) now extend this resolvent convergence to every strongly converging input. No additional use of the lower energy bound is needed for that extension. To pass to semigroups, put $R_n = \( 1 + frak(A)_n \)^(- 1)$, $R = \( 1 + frak(A) \)^(- 1)$, and, for $t > 0$, define on $\[ 0 \, 1 \]$
  $ F_t \( q \) = cases(delim: "{", exp \[ - t \( q^(- 1) - 1 \) \] \, & q > 0 \,, 0 \, & q = 0 .) $
  This function is continuous. Polynomial approximation of $F_t$ and convergence of every power of $R_n$ on strongly converging inputs prove
  #[#set math.equation(numbering: n => "(5.9)")
   $ P_(t_n T_n) f_n arrow.r S_t^g f quad upright("strongly whenever ") f_n arrow.r f upright(" strongly and ") t_n arrow.r t > 0 . $ <glim:semigroup-strong>]
  For the assertion with varying times, use
  $ sup_(lambda gt.eq 0) \| e^(- t lambda) - e^(- u lambda) \| lt.eq frac(\| t - u \|, e delta) \, #h(2em) t \, u gt.eq delta > 0 . $
  This proof identifies the limit of $P_(t T_n)$ as $exp \( - t c_(*) H_g \)$ with the stated $T_n = n^(2 \/ 3)$.
  ===== 5.3 Densities and the limiting kernel. <densities-and-the-limiting-kernel.>
  On the represented sequence, Theorem 15, with fixed admissible auxiliary parameters, gives a finite random $C$ and numbers $delta_n arrow.b 0$ such that $parallel P_(s T_n) parallel_(1 arrow.r oo) lt.eq cal(K) \( s \)$ for all $s gt.eq delta_n$. Since $w_(n \, 0)$ is a nonnegative density and the semigroup is self-adjoint,
  #[#set math.equation(numbering: n => "(5.10)")
   $ 0 lt.eq w_(n \, s) lt.eq cal(K) \( s \) \, #h(2em) mu \[ w_(n \, s) \] = 1 \, #h(2em) parallel w_(n \, s) parallel_2^2 lt.eq cal(K) \( s \) quad \( s gt.eq delta_n \) . $ <glim:finite-density>]
  Include the pairings of these densities with $ V$ at each positive rational $s$ in the representation. Every limit functional $L_s$ obeys
  $ \| L_s \( phi.alt \) \| lt.eq cal(K) \( s \) Pi_g \[ \| phi.alt \| \] \, #h(2em) L_s \( phi.alt \) gt.eq - cal(K) \( s \) Pi_g \[ phi.alt^(-) \] \, #h(2em) L_s \( 1 \) = 1 . $
  Here $phi.alt^(-) = max { - phi.alt \, 0 }$. The bound follows from (5.10) and static convergence also for the continuous cylinders $\| phi.alt \|$ and $phi.alt^(-)$. It extends $L_s$ to $L^1 \( Pi_g \)$. The second inequality proves positivity of the extension: if cylinders $phi.alt_j$ converge in $L^1$ to $f gt.eq 0$, then $Pi_g \[ phi.alt_j^(-) \] lt.eq parallel phi.alt_j - f parallel_1 arrow.r 0$. The extension is therefore represented by a density $0 lt.eq h_s lt.eq cal(K) \( s \)$ of mass one. In particular $parallel h_s parallel_2^2 lt.eq cal(K) \( s \)$. This also justifies normalization if only compact cylinders were initially retained: their cutoffs tending to one have complements bounded by $cal(K) \( s \)$ times the corresponding static probabilities. Measurability can be seen concretely. Take nested finite cylinder partitions which generate the product Borel sets and whose cell boundaries have zero $Pi_g$ measure; rational coordinate boxes have this property by the cylinder densities of #cite(label("FUA")) Proposition 2.3. The value $L_s \( upright(bold(1))_A \)$ for each cell is a measurable limit of its values on fixed smooth approximations to $upright(bold(1))_A$, which can in turn be approximated by $ C$. On each cell $A$ put the ratio $L_s \( upright(bold(1))_A \) \/ Pi_g \( A \)$, with value zero if the denominator is zero. These ratios are measurable, bounded by $cal(K) \( s \)$, and are the conditional expectations of $h_s$ on the nested partitions. Their bounded martingale limit gives a measurable representative of $h_s$.
  For positive rational $s \, t$, reversibility and (5.9) imply for every $phi.alt in  C$
  $ Pi_g \[ h_(s + t) phi.alt \] = lim_n mu \[ w_(n \, s) P_(t T_n) phi.alt_n \] = Pi_g \[ h_s S_t^g phi.alt \] . $
  We used the weak–strong pairing rule; the $w_(n \, s)$ are weakly convergent and bounded in $L^2$. Hence $h_(s + t) = S_t^g h_s$. The closed cylinder-gradient form is a Dirichlet form: smooth normal contractions obey its contraction inequality, and closure preserves it. Constants belong to the form and have zero energy, by #cite(label("FUA")) Proposition 5.1. Thus $S_t^g$ is Markov and preserves one. For a real $s > 0$, choose a rational $q < s$ and set $h_s = S_(s - q)^g h_q$. The rational relation makes this definition independent of $q$. Strong continuity of the semigroup proves $L^2$ continuity in $s > 0$, as well as the relation for all $s \, t > 0$. Positivity and mass one persist. Taking rationals $q arrow.t s$ in the density bound, using $L^2$ convergence and an almost-everywhere subsequence, proves $h_s lt.eq cal(K) \( s \)$. For deterministic dyadic rationals $q_j \( s \) arrow.r s$, every cylinder integral at $s$ is the limit of its measurable values at $q_j \( s \)$. It is therefore jointly measurable in the environment and $s$. The same partition construction therefore gives jointly measurable representatives for the real-time family.
  The finite convergence against cylinders also holds along every sequence $s_n arrow.r s > 0$. Indeed, for $s gt.eq delta > 0$, the identity $w_(n \, s) = P_(\( s - delta \/ 2 \) T_n) w_(n \, delta \/ 2)$ and spectral calculus give
  #[#set math.equation(numbering: n => "(5.11)")
   $ parallel partial_s w_(n \, s) parallel_2 lt.eq frac(2, e delta) sqrt(cal(K) \( delta \/ 2 \)) quad \( n med upright("sufficiently large") \) . $ <glim:time-equicontinuity>]
  Approximation of $s$ by a rational time, followed by the weak convergence there and the $L^2$ continuity of $h_s$, proves the claim.
  For completeness we obtain the kernel needed to sum coordinates. For nonnegative smooth compact cylinders $phi.alt \, psi$, the finite kernel bound yields
  $ 0 lt.eq mu \[ phi.alt_n P_(t T_n) psi_n \] lt.eq cal(K) \( t \) mu \[ phi.alt_n \] mu \[ psi_n \] . $
  Passing to the limit using (5.9), and then approximating indicators in $L^2 \( Pi_g \)$, gives the same inequality with $Pi_g \[ phi.alt S_t^g psi \]$ in place of the left side. Define on rectangles the nonnegative functional
  $ upright(bold(1))_(A times B) mapsto Pi_g \[ upright(bold(1))_A S_t^g upright(bold(1))_B \] . $
  For a simple function on rectangles use common disjoint partitions of the two factors. The preceding rectangle inequality then bounds the functional on every nonnegative such function by $cal(K) \( t \)$ times its $L^1 \( Pi_g ⊗ Pi_g \)$ norm. It extends to a positive bounded functional on that $L^1$ space, so has a density $k_t^g$ with $0 lt.eq k_t^g lt.eq cal(K) \( t \)$. Self-adjointness makes the density symmetric. Its marginals are $Pi_g$, since $S_t^g 1 = 1$. This proves (5.2); it does not require a joint pointwise version of the kernels for all $t$.
  ===== 5.4 The tail of two equilibrium copies. <the-tail-of-two-equilibrium-copies.>
  Let $x'_a = x_a \( sigma' \)$, and set
  $ Q_(n \, m) \( sigma \, sigma' \) = sum_(a > m) x_a x'_a \, #h(2em) V_(n \, m) = \( mu ⊗ mu \) \[ Q_(n \, m)^2 \] . $
  To see why this equilibrium quantity controls the quench trace, define the relative transition kernel and the two-time density
  $ p_(n \, t) \( sigma \, sigma' \) = frac(P_(t T_n) \( sigma \, sigma' \), mu \( sigma' \)) \, #h(2em) d_(n \, s \, t) \( sigma \, sigma' \) = w_(n \, s) \( sigma \) p_(n \, t) \( sigma \, sigma' \) . $
  The latter is the density of the two spins at times $s T_n$ and $\( s + t \) T_n$ relative to $mu ⊗ mu$. On every compact subset of $s \, t > 0$, the warming bounds give a uniform bound on this density for all sufficiently large $n$ on the represented sequence. Hence
  $ lr(|sum_(a > m) mu \[ w_(n \, s) x_a P_(t T_n) x_a \]|) = lr(|\( mu ⊗ mu \) \[ d_(n \, s \, t) Q_(n \, m) \]|) lt.eq parallel d_(n \, s \, t) parallel_(L^2 \( mu ⊗ mu \)) V_(n \, m)^(1 \/ 2) . $
  The stationary trace has the same bound with $d_(n \, s \, t)$ replaced by $p_(n \, t)$. Thus it suffices to control $V_(n \, m)$ uniformly as $m$ increases. We claim that the representation may be further extracted so that
  #[#set math.equation(numbering: n => "(5.12)")
   $ lim_(m arrow.r oo) limsup_n V_(n \, m) = 0 quad upright("almost surely") . $ <glim:static-tail>]
  Recall $r_n = n^(- 1 \/ 3 + 10^(- 4))$ from Section 3, and fix the spectrum in one of the tight spectral sets of #cite(label("FUA")) Proposition 2.3. In this paragraph take its canonical parameters
  $ b_n^compose = 1 + \( - g_(1 \, n) \)_(+) \, #h(2em) b^compose = 1 + \( - g_1 \)_(+) \, #h(2em) ell_(a \, n)^compose = \( g_(a \, n) + b_n^compose \)^(- 1) . $
  Let $mu^(upright("sp"))$ be the spherical Gibbs law, and $L_compose = Z_(upright("cube")) \/ Z_(upright("sp"))$, with both partition functions relative to their normalized uniform measures. Average over the full Haar eigenframe at this fixed spectrum. Multiplication by $L_compose^2$ cancels the two cube Gibbs denominators. In the uncapped replica comparison of #cite(label("FUA")) Lemma 3.2, the normalized contribution of pairs with $\| rho \| = \| n^(- 1) sigma dot.op sigma' \| > C r_n$ is at most $C e^(- c n r_n^3)$. Since $\| Q_(n \, m) \|^2 lt.eq n^(2 \/ 3)$, inserting this square in the discarded part costs at most $C n^(2 \/ 3) e^(- c n r_n^3)$.
  On the retained overlaps, the same comparison can be used with this square inserted. Here are the required uniform details. Conditional on $rho$, a Haar-rotated cube pair and a spherical pair have the same law of an orthonormal sum-and-difference frame $\( q \, q' \)$. Their spectral vectors can be written
  $ Y \( rho \) = sqrt(n / 2) #scale(x: 120%, y: 120%)[\(] sqrt(1 + rho) thin q + sqrt(1 - rho) thin q' #scale(x: 120%, y: 120%)[\)] \, #h(2em) Y' \( rho \) = sqrt(n / 2) #scale(x: 120%, y: 120%)[\(] sqrt(1 + rho) thin q - sqrt(1 - rho) thin q' #scale(x: 120%, y: 120%)[\)] . $
  The ratio of the discrete overlap mass and the spherical mass on a cell of width $2 \/ n$ is at most $exp \( C + C n rho^4 \)$, by the replica comparison. This is bounded on $\| rho \| lt.eq C r_n$, because $n r_n^4 = o \( 1 \)$. The tilt exponent on this frame is
  $ n / 2 #scale(x: 120%, y: 120%)[\(] \( 1 + rho \) q^(sans(T)) Lambda q + \( 1 - rho \) q'^(sans(T)) Lambda q' #scale(x: 120%, y: 120%)[\)] . $
  Its oscillation in a cell is bounded when $parallel Lambda parallel$ is bounded. If $rho \, tilde(rho)$ lie in that cell, the displayed vectors change in Euclidean norm by at most $C n^(- 1 \/ 2)$. After multiplying by $n^(- 1 \/ 3)$, each vector changes by at most $C n^(- 5 \/ 6)$ and has norm $n^(1 \/ 6)$. Projection onto the coordinates $a > m$ therefore gives, uniformly in $m$,
  $ \| Q_(n \, m) \( rho \) - Q_(n \, m) \( tilde(rho) \) \| lt.eq C n^(- 2 \/ 3) . $
  The inequality $\( u + v \)^2 lt.eq 2 u^2 + 2 v^2$ now bounds the inserted square by the corresponding spherical square and $C n^(- 4 \/ 3)$, up to the preceding bounded comparison factors.
  Under two independent spherical Gibbs laws, sign symmetry kills the cross terms in that square. The uniform coordinate moment bound in #cite(label("FUA")) Proposition 2.3 gives
  $ \( mu^(upright("sp")) ⊗ mu^(upright("sp")) \) \[ Q_(n \, m)^2 \] = sum_(a > m) #scale(x: 120%, y: 120%)[\(] mu^(upright("sp")) \[ x_a^2 \] #scale(x: 120%, y: 120%)[\)]^2 lt.eq C sum_(a > m) \( ell_(a \, n)^compose \)^2 . $
  Since $upright(bold(1))_({ L_compose gt.eq 1 \/ 2 }) lt.eq 4 L_compose^2$, the comparison just proved yields
  #[#set math.equation(numbering: n => "(5.13)")
   $ bb(E)_U \[ upright(bold(1))_({ L_compose gt.eq 1 \/ 2 }) V_(n \, m) \] lt.eq C sum_(a > m) \( ell_(a \, n)^compose \)^2 + C n^(- 4 \/ 3) + C n^(2 \/ 3) e^(- c n r_n^3) . $ <glim:tail-haar>]
  The constants are uniform on the retained spectral set. The squared resolvent tails tend to zero as $m arrow.r oo$ there, and $n r_n^3$ is a positive power of $n$. Also $bb(P)_U { L_compose < 1 \/ 2 } = o \( 1 \)$, by #cite(label("FUA")) Lemma 2.5. Markov’s inequality, followed by exhaustion of the tight spectral sets, proves for every $epsilon.alt > 0$
  #[#set math.equation(numbering: n => "(5.14)")
   $ lim_(m arrow.r oo) limsup_n bb(P) { V_(n \, m) > epsilon.alt } = 0 . $ <glim:tail-probability>]
  The same estimates make $V_(n \, m)$ tight for every fixed $m$. Include these countably many quantities in the representation and extract coordinatewise limits $V_m$. The identity
  $ V_(n \, m) = sum_(a \, b > m) mu \[ x_a x_b \]^2 $
  shows that $V_(n \, m)$, and hence $V_m$, decreases with $m$. Equation (5.14) forces $V_m arrow.b 0$ almost surely. Since $V_(n \, m) arrow.r V_m$ for each fixed $m$, this is (5.12).
  The limiting version follows directly from the same sign symmetry and moments. With $ell_a^compose = \( g_a + b^compose \)^(- 1)$, for $M > m$,
  #[#set math.equation(numbering: n => "(5.15)")
   $ ∥sum_(m < a lt.eq M) x_a x'_a∥_(L^2 \( Pi_g ⊗ Pi_g \))^2 = sum_(m < a lt.eq M) Pi_g \[ x_a^2 \]^2 lt.eq C sum_(a > m) \( ell_a^compose \)^2 arrow.r 0 . $ <glim:limit-static-tail>]
  Thus these interval sums have an $L^2 \( Pi_g ⊗ Pi_g \)$ tail whose norm tends to zero.
  ===== 5.5 Correlation limits and relaxation. <correlation-limits-and-relaxation.>
  Orthogonality of the eigenframe gives the exact finite identities
  $ A_(n \, J) \( t \) = sum_(a = 1)^n mu \[ x_a P_(t T_n) x_a \] \, #h(2em) B_(n \, J) \( s \, t \) = sum_(a = 1)^n mu \[ w_(n \, s) x_a P_(t T_n) x_a \] . $
  The preceding two-copy reduction and (5.12) give uniform finite correlation tails on every compact positive time set. For the limiting series, the corresponding two-time density is $h_s \( x \) k_t^g \( x \, x' \)$ relative to $Pi_g ⊗ Pi_g$; for the stationary series it is $k_t^g \( x \, x' \)$. Equations (5.1) and (5.2) bound these densities uniformly on compact positive time sets. The same Cauchy–Schwarz argument with (5.15) therefore gives the limiting uniform tail control.
  It remains to pass each fixed summand. Static convergence of the mixed pairings $x_a phi.alt$ and the second moment $x_a^2$ makes the finite coordinate $x_a$ strongly convergent to the limiting $x_a$. If $s_n arrow.r s > 0$, then $w_(n \, s_n) x_a$ is weakly convergent to $h_s x_a$. To see this, test first against a cylinder times a smooth cutoff of $x_a$ at height $R$, and use the convergence after (5.11), extended from $ C$ by the common-support approximation above. For a bounded cylinder $phi.alt$, the omitted part of the pairing is at most
  $ cal(K) \( delta \) parallel phi.alt parallel_oo mu \[ \| x_a \| upright(bold(1))_({ \| x_a \| > R }) \] lt.eq frac(cal(K) \( delta \) parallel phi.alt parallel_oo, R) mu \[ x_a^2 \] quad \( s_n gt.eq delta \) . $
  The fixed second moments are bounded and converge, so this error vanishes uniformly as $R arrow.r oo$. Also $parallel w_(n \, s_n) x_a parallel_2 lt.eq cal(K) \( delta \) parallel x_a parallel_2$. The weak–strong pairing rule and (5.9) now give, whenever $s_n arrow.r s > 0$ and $t_n arrow.r t > 0$,
  $ mu \[ w_(n \, s_n) x_a P_(t_n T_n) x_a \] arrow.r Pi_g \[ h_s x_a S_t^g x_a \] . $
  The same argument without $w_(n \, s_n)$ gives the fixed stationary summand. Each limiting summand is continuous. For $t gt.eq delta > 0$, the kernel bound gives
  $ parallel S_t^g x_a parallel_oo lt.eq cal(K) \( delta \) Pi_g \[ \| x_a \| \] \, #h(2em) parallel x_a S_t^g x_a parallel_2 lt.eq cal(K) \( delta \) parallel x_a parallel_2^2 . $
  Thus $L^2$ continuity of $h_s$ gives continuity in $s$, uniformly for $t$ in positive compact intervals. Strong continuity of $S_t^g x_a$, paired with $h_s x_a in L^2 \( Pi_g \)$, gives continuity in $t$. The uniform tail bound proves the asserted continuity and local uniform convergence of the full series. It also proves the two locally uniform finite limits in (5.3): failure of uniform convergence on a compact set would provide a sequence of time points with a convergent subsequence, contradicting the fixed-summand convergence, the uniform tails, and continuity of the limiting sum.
  Finally, the kernel of $H_g$ consists exactly of the constants, by #cite(label("FUA")) Proposition 5.1. The spectral theorem and $h_s = S_(s - s_0)^g h_(s_0)$ give $h_s arrow.r Pi_g \[ h_(s_0) \] = 1$ in $L^2 \( Pi_g \)$. For each fixed $a$, the last displayed bound implies, uniformly for $t gt.eq delta$,
  $ \| Pi_g \[ \( h_s - 1 \) x_a S_t^g x_a \] \| lt.eq cal(K) \( delta \) parallel x_a parallel_2^2 parallel h_s - 1 parallel_2 arrow.r 0 . $
  The correlation tails are uniform also for $s gt.eq s_0$, since $parallel h_s parallel_oo lt.eq cal(K) \( s_0 \)$. Passing first through a finite sum and then letting its length tend to infinity proves (5.5). ◻
]

The preceding proposition does not yet identify the family as a function of $g$. The following estimate retains the information from the finite uniform initialization that will make this identification possible.

#thm([Proposition 5.2.])[
  (An escape estimate from the uniform start).  #emph[There is a measurable admissible choice $b = b \( g \)$ such that, almost surely, 
#[#set math.equation(numbering: n => "(5.16)")
 $ r_a := g_a + b > 0 \, #h(2em) D_g \( b \) > 0 \, #h(2em) c_g \( 1 + a \)^(2 \/ 3) lt.eq r_a lt.eq C_g \( 1 + a \)^(2 \/ 3) quad \( a gt.eq 1 \) $ <glim:rates>]

 for finite positive $c_g \, C_g$. Define 
#[#set math.equation(numbering: n => "(5.17)")
 $ M_g \( x \) = 1 / 2 sum_(a gt.eq 1) x_a^2 / r_a . $ <glim:weighted-size>]

 Then $0 < M_g < oo$ $Pi_g$-almost surely. Choose a Borel full-measure set of edge realizations on which these assertions about $b$, $r_a$, and $M_g$ hold, with $b$ Borel there and $r_a = g_a + b$. On the product of this edge set with $bb(R)^(bb(N))$, $M_g$ is an extended nonnegative Borel function of $\( g \, x \)$, since its jointly Borel partial sums increase to it. In every escape event, $x_i^2 \/ M_g \( x \)$ denotes the quotient on the subset where $0 < M_g \( x \) < oo$, extended by zero to all remaining pairs in $bb(R)^(bb(N)) times bb(R)^(bb(N))$. This version is jointly Borel and agrees with the usual quotient $Pi_g$-almost surely for every $g$ in the chosen edge set.]
  #emph[For every represented family in Proposition 25, every fixed $i gt.eq 1$, and every $epsilon.alt > 0$, 
#[#set math.equation(numbering: n => "(5.18)")
 $ lim_(s arrow.b 0) hat(bb(E)) #h(-0.16667em) [Pi_g #h(-0.16667em) [h_s upright(bold(1))_({ x_i^2 \/ M_g > epsilon.alt })]] = 0 . $ <glim:seed-escape>]

 Here the probability averages the represented environment as well as the draw from $h_s Pi_g$.]
] <prop:uniform-seed-escape>

#proof[
  We will show that $x_i^2 > s^(13 \/ 20)$ has vanishing averaged probability under the limiting time-$s$ law, while $M_g < s^(14 \/ 25)$ also has vanishing averaged probability as $s arrow.b 0$. Away from these two events, $x_i^2 \/ M_g$ is at most $s^(9 \/ 100)$. We obtain the numerator bound from the finite uniform-start dynamics, then bound the denominator directly under the conditioned edge measure.
  ===== 5.6 The total mass in a block of finite modes. <the-total-mass-in-a-block-of-finite-modes.>
  Fix $epsilon > 0$, and fix the auxiliary log-moment parameters in Theorem 15 once and for all. Its entropy bound and Proposition 3 provide a quenched disorder event $cal(G)_(n \, epsilon)$ of limiting probability at least $1 - epsilon$ on which their constants and thresholds are fixed, the entropy bound holds simultaneously for every positive time, and the uncapped cube projection tails hold at every allowed scale. Separately retain a spectrum-only event $cal(S)_(n \, epsilon)$ of limiting probability at least $1 - epsilon$ for the band estimates in Lemma 4 and the tight leading-edge bound $\| g_(1 \, n) \| lt.eq C_epsilon$. The latter follows from the GOE edge convergence in Section 2. The constants in the following calculations may depend on $epsilon$.
  For $0 < s < 1$, put $m = ceil.l s^(- 5 \/ 4) ceil.r$. For $n gt.eq m$, set
  #[#set math.equation(numbering: n => "(5.19)")
   $ D_m \( v \) = sum_(a lt.eq m) x_a \( v \)^2 \, #h(2em) I = s^(47 \/ 100) \, #h(2em) R = s^(- 53 \/ 100) . $ <glim:rotation-scales>]
  Here $x_a \( v \)$ is evaluated along the finite dynamics at physical time $v T_n$, and $I = s R$. Choose $k_p = n p^3 = C' m$, with the fixed $C'$ sufficiently large. Take $s$ small enough that $C' m$ exceeds the fixed threshold, and then take $n$ sufficiently large that $m lt.eq n$ and $p lt.eq r_n$. The spectral band estimates imply that $dim cal(H)_p gt.eq m$ on $cal(S)_(n \, epsilon)$, so $P_p$ contains the first $m$ coordinates and $g_(m \, n) lt.eq T_n p^2 = \( C' m \)^(2 \/ 3)$. Together with $\| g_(1 \, n) \| lt.eq C_epsilon$, this gives on that event
  #[#set math.equation(numbering: n => "(5.20)")
   $ max_(a lt.eq m) \| g_(a \, n) \| lt.eq C m^(2 \/ 3) . $ <glim:finite-head-spectrum>]
  At a fixed $s$, the value of $k_p$ is fixed as $n arrow.r oo$; this is why the extension to the lowest scales in Proposition 3 is used here.
  On $cal(G)_(n \, epsilon) ∩ cal(S)_(n \, epsilon)$ put $Y_p = parallel P_p sigma parallel^2 \/ M_p^2$. Its projection tail is $mu { Y_p > u } lt.eq C exp \( - a k_p u^3 \)$ for every $u gt.eq u_0$, with fixed $u_0$. Integration of this tail gives
  $ log mu exp #h(-0.16667em) (a / 2 k_p Y_p^3) lt.eq C k_p . $
  The entropy inequality for any probability density $w$ relative to $mu$, followed by Hölder’s inequality, therefore gives
  $ mu \[ w Y_p \] lt.eq C (1 + #scale(x: 120%, y: 120%)[\(] "Ent"_mu \( w \) \/ k_p #scale(x: 120%, y: 120%)[\)]^(1 \/ 3)) . $
  Since $D_m lt.eq n^(- 2 \/ 3) M_p^2 Y_p = k_p^(1 \/ 3) Y_p$, the entropy part of Theorem 15 yields under the direct dynamical law at fixed disorder
  #[#set math.equation(numbering: n => "(5.21)")
   $ bb(E)_(nu_n)^J \[ D_m \( v \) \] lt.eq C #scale(x: 120%, y: 120%)[\(] m^(1 \/ 3) + v^(- 77 \/ 150) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 < v lt.eq s lt.eq 1 . $ <glim:head-mass>]
  This use of entropy is entirely relative to the ordinary Gibbs law $mu$; the path in this expectation starts from $nu_n$.
  Let $Q \( v \) = integral_0^v D_m \( w \) thin d w$ and define the event
  $ G = { Q \( s \) < I \, med D_m \( s \) lt.eq R } . $
  Integrating (5.21) and applying Markov’s inequality at the integral and the endpoint gives, on $cal(G)_(n \, epsilon) ∩ cal(S)_(n \, epsilon)$,
  #[#set math.equation(numbering: n => "(5.22)")
   $ bb(P)_(nu_n)^J \( G^c \) lt.eq C #scale(x: 120%, y: 120%)[\(] s^(17 \/ 150) + s^(1 \/ 60) #scale(x: 120%, y: 120%)[\)] . $ <glim:cutoff-loss>]
  Indeed $m^(1 \/ 3) lt.eq C s^(- 5 \/ 12)$, and both comparisons use the same two positive powers:
  $ 1 - 5 / 12 - 47 / 100 = 53 / 100 - 5 / 12 = 17 / 150 \, #h(2em) 1 - 77 / 150 - 47 / 100 = 53 / 100 - 77 / 150 = 1 / 60 . $
  ===== 5.7 A stopped rotation at fixed spectrum. <a-stopped-rotation-at-fixed-spectrum.>
  For this step fix only a spectrum satisfying (5.20). Let $bb(E)_Lambda$ average over the full conditional Haar law of $U$ and over the uniform-start heat-bath path. In particular, this expectation does not condition on $cal(G)_(n \, epsilon)$.
  It is useful to specify the path likelihood. In normalized time $v$, take independent site clocks of rate $T_n$, a uniform initial spin, and an independent fair mark $eta in { - 1 \, 1 }$ at every ring, including rings at which the mark equals the old spin. This is a reference law; the marked path is then determined without $U$. If the ring is at site $k$, its heat-bath probability is
  $ p_(U \, k) \( eta divides sigma \) = frac(e^(eta b_k \( sigma \)), 2 cosh b_k \( sigma \)) \, #h(2em) b_k \( sigma \) = sum_(ell eq.not k) W_(k ell) sigma_ell . $
  The likelihood of the dynamical path through $s$ relative to the reference law is
  #[#set math.equation(numbering: n => "(5.23)")
   $ cal(L)_U = product_(ell : v_ell lt.eq s) 2 p_(U \, k_ell) #scale(x: 120%, y: 120%)[\(] eta_ell divides sigma \( v_ell - \) #scale(x: 120%, y: 120%)[\)] . $ <glim:path-likelihood>]
  There is no initial or clock factor depending on $U$. This likelihood fixes the marked spin outcomes while the matrix varies; it permits differentiating the smooth heat-bath probabilities. The absence of an initial score is the feature of the uniform start used in this rotation.
  For $i \, j lt.eq m$, $i eq.not j$, right-rotate these two columns with $dot(u)_i = u_j$ and $dot(u)_j = - u_i$. Then
  $ dot(x)_i = x_j \, #h(2em) dot(x)_j = - x_i \, #h(2em) dot(W) = \( lambda_i - lambda_j \) \( u_i u_j^(sans(T)) + u_j u_i^(sans(T)) \) . $
  Writing $Delta_(i j) = lambda_i - lambda_j$, diagonal deletion in the physical local field gives
  $ dot(b)_k = Delta_(i j) [n^(1 \/ 3) \( u_(j \, k) x_i + u_(i \, k) x_j \) - 2 u_(i \, k) u_(j \, k) sigma_k] . $
  Orthogonality and $sum_k u_(i \, k)^2 u_(j \, k)^2 lt.eq 1$, together with $\| Delta_(i j) \| = T_n^(- 1) \| g_(i \, n) - g_(j \, n) \| lt.eq C n^(- 2 \/ 3) m^(2 \/ 3)$, imply
  #[#set math.equation(numbering: n => "(5.24)")
   $ sum_k dot(b)_k^2 lt.eq C n^(- 4 \/ 3) m^(4 \/ 3) #scale(x: 120%, y: 120%)[\[] n^(2 \/ 3) \( x_i^2 + x_j^2 \) + 1 #scale(x: 120%, y: 120%)[\]] . $ <glim:field-rotation>]
  The final $1$ is the contribution from deleting the diagonal.
  In the filtration revealing $U$ initially and then the marked rings, the logarithmic derivative of $cal(L)_U$ through $v$ is
  $ S_(i j) \( v \) = sum_(ell : v_ell lt.eq v) #scale(x: 120%, y: 120%)[\(] eta_ell - tanh b_(k_ell) \( sigma \( v_ell - \) \) #scale(x: 120%, y: 120%)[\)] dot(b)_(k_ell) \( sigma \( v_ell - \) \) . $
  Under the dynamical law it is a square-integrable martingale. In fact each marked increment has conditional mean zero and conditional variance $"sech"^2 \( b_k \) dot(b)_k^2$; its predictable bracket is
  $ chevron.l S_(i j) chevron.r_v = T_n integral_0^v sum_k "sech"^2 \( b_k \( sigma \( w - \) \) \) dot(b)_k \( sigma \( w - \) \)^2 thin d w . $
  Define
  $ tau = s and inf { v : Q \( v \) gt.eq I } \, #h(2em) I_a = bb(E)_Lambda integral_0^tau x_a \( v \)^2 thin d v quad \( a lt.eq m \) . $
  The function $Q$ is continuous, so $Q \( tau \) lt.eq I$. Stopped martingale isometry and (5.24) give
  #[#set math.equation(numbering: n => "(5.25)")
   $ bb(E)_Lambda \[ S_(i j) \( tau \)^2 \] lt.eq C m^(4 \/ 3) #scale(x: 120%, y: 120%)[\(] I_i + I_j + s n^(- 2 \/ 3) #scale(x: 120%, y: 120%)[\)] . $ <glim:rotation-score>]
  For a fixed marked reference history, $D_m \, Q \, tau$, and $G$ are exactly invariant under this rotation. Apply Haar invariance first to
  $ F_(i j) = integral_0^tau x_i \( v \) x_j \( v \) thin d v . $
  Differentiating its integral with likelihood (5.23), and then projecting the terminal score onto the stopped filtration, gives
  #[#set math.equation(numbering: n => "(5.26)")
   $ 0 = bb(E)_Lambda \[ dot(F)_(i j) + F_(i j) S_(i j) \( s \) \] = bb(E)_Lambda \[ dot(F)_(i j) + F_(i j) S_(i j) \( tau \) \] . $ <glim:haar-identity>]
  Here is a justification at the stopping boundary. The stopping rule is constant on each rotation orbit of a fixed marked history, so $dot(F)_(i j)$ differentiates only $x_i x_j$. At each fixed $n$ and spectrum, the likelihood is bounded by $2^N$, where $N$ is the number of rings, and its derivative is bounded by this quantity times a constant (depending on $n$ and the spectrum) times $N$. Poisson exponential moments justify differentiation of the full-time integral. The random variable $F_(i j)$ is measurable at $tau$, and optional projection of the square-integrable martingale replaces $S_(i j) \( s \)$ by $S_(i j) \( tau \)$. This proves (5.26) without differentiating a law with a moving stopping time.
  Since $dot(x)_i = x_j$ and $dot(x)_j = - x_i$, this identity reads
  $ I_i - I_j = bb(E)_Lambda #h(-0.16667em) [S_(i j) \( tau \) integral_0^tau x_i \( v \) x_j \( v \) thin d v] . $
  Sum over $j lt.eq m$, $j eq.not i$. The pathwise bound
  $ sum_(j lt.eq m\
j eq.not i) (integral_0^tau x_i x_j thin d v)^2 lt.eq (integral_0^tau x_i^2 thin d v) (integral_0^tau D_m thin d v) lt.eq I integral_0^tau x_i^2 thin d v $
  and Cauchy–Schwarz on the product of probability and index spaces, together with $sum_(j lt.eq m) I_j lt.eq I$ and (5.25), yield
  #[#set math.equation(numbering: n => "(5.27)")
   $ m I_i lt.eq I + {C m^(4 \/ 3) \( m I_i + I + m s n^(- 2 \/ 3) \) thin I I_i}^(1 \/ 2) . $ <glim:integrated-rotation>]
  This estimate does not require independence between the scores. To solve it, put
  $ y = frac(m I_i, I) \, #h(2em) alpha = C I m^(1 \/ 3) \, #h(2em) kappa = frac(m s n^(- 2 \/ 3), I) . $
  It gives $y lt.eq 1 + sqrt(alpha y \( y + 1 + kappa \))$. Here $I m^(1 \/ 3) = O \( s^(4 \/ 75) \)$, while $kappa arrow.r 0$ as $n arrow.r oo$ at each fixed $s$. For sufficiently small $s$ and then sufficiently large $n$, $kappa lt.eq 1$ and $sqrt(alpha) lt.eq 1 \/ 2$. Using $sqrt(y \( y + 2 \)) lt.eq y + 1$ proves
  #[#set math.equation(numbering: n => "(5.28)")
   $ I_i lt.eq 3 I \/ m #h(2em) \( i lt.eq m \) . $ <glim:individual-integral>]
  Repeat (5.26) with $F_(i j) = upright(bold(1))_G x_i \( s \) x_j \( s \)$. This random variable is measurable at $tau$: it is zero if $tau < s$, and otherwise is measurable at $s = tau$. The indicator $G$, including its boundary, is constant on each rotation orbit, so its differentiation contributes nothing. Write $Z_a = bb(E)_Lambda \[ upright(bold(1))_G x_a \( s \)^2 \]$ for $a lt.eq m$. Now $sum_(a lt.eq m) Z_a lt.eq R$ and
  $ sum_(j lt.eq m\
j eq.not i) bb(E)_Lambda \[ upright(bold(1))_G x_i \( s \)^2 x_j \( s \)^2 \] lt.eq R Z_i . $
  Use (5.25) and (5.28) in the summed identity. Taking $n$ large enough that $m s n^(- 2 \/ 3) lt.eq I$, we obtain
  #[#set math.equation(numbering: n => "(5.29)")
   $ m Z_i lt.eq R + #scale(x: 120%, y: 120%)[\(] C m^(4 \/ 3) I R Z_i #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, #h(2em) Z_i lt.eq C R \/ m . $ <glim:terminal-rotation>]
  For the second inequality, $z = m Z_i \/ R$ satisfies $z lt.eq 1 + sqrt(alpha z)$, and hence $z lt.eq 2 + alpha$. As $R \/ m lt.eq C s^(18 \/ 25)$, Markov’s inequality gives, at each of the retained spectra,
  #[#set math.equation(numbering: n => "(5.30)")
   $ bb(P)_Lambda { x_i \( s \)^2 > s^(13 \/ 20) \, thin G } lt.eq s^(- 13 \/ 20) Z_i lt.eq C s^(7 \/ 100) . $ <glim:one-mode>]
  We now combine the two probability laws. Let $bb(P)_n$ include the Gaussian disorder, the independent diagonal and eigenvector signs, and the uniform-start dynamics. Write $bb(P)_(upright("dis"))$ and $bb(E)_(upright("dis"))$ for the completed disorder law and $bb(E)_(upright("eig"))$ for the eigenvalue law. Then
  $ bb(P)_n { x_i \( s \)^2 > s^(13 \/ 20) } lt.eq  & bb(P)_(upright("dis")) #scale(x: 120%, y: 120%)[\(] \( cal(G)_(n \, epsilon) ∩ cal(S)_(n \, epsilon) \)^c #scale(x: 120%, y: 120%)[\)]\
 & + bb(E)_(upright("dis")) #h(-0.16667em) [upright(bold(1))_(cal(G)_(n \, epsilon) ∩ cal(S)_(n \, epsilon)) bb(P)_(nu_n)^J \( G^c \)]\
 & + bb(E)_(upright("eig")) #h(-0.16667em) [upright(bold(1))_(cal(S)_(n \, epsilon)) bb(P)_Lambda { x_i \( s \)^2 > s^(13 \/ 20) \, G }] . $
  The second term uses (5.22); the last uses (5.30) with its full conditional Haar average. The complements of $cal(G)_(n \, epsilon)$ and $cal(S)_(n \, epsilon)$ cost at most $2 epsilon$ in the limit, so for each fixed $i$ and all sufficiently small $s$,
  #[#set math.equation(numbering: n => "(5.31)")
   $ limsup_n bb(P)_n { x_i \( s \)^2 > s^(13 \/ 20) } lt.eq 2 epsilon + C_epsilon #scale(x: 120%, y: 120%)[\(] s^(17 \/ 150) + s^(1 \/ 60) + s^(7 \/ 100) #scale(x: 120%, y: 120%)[\)] . $ <glim:finite-numerator>]
  This separation is essential: no frame-dependent quenched event was imposed inside the Haar identity. Sending $s arrow.b 0$ and then $epsilon arrow.b 0$ proves the finite numerator estimate.
  For a fixed positive $s$, the cylinder convergence in Proposition 25 transfers this estimate to $rho_s \( d x \) = h_s \( x \) Pi_g \( d x \)$. Indeed each coordinate marginal of $Pi_g$ has a density by #cite(label("FUA")) Proposition 2.3; the same is true of $rho_s$. The boundary $x_i^2 = s^(13 \/ 20)$ thus has zero limiting probability. Weak convergence of this coordinate marginal and bounded convergence over the represented environment yield
  #[#set math.equation(numbering: n => "(5.32)")
   $ lim_(s arrow.b 0) hat(bb(E)) #scale(x: 120%, y: 120%)[\[] rho_s { x_i^2 > s^(13 \/ 20) } #scale(x: 120%, y: 120%)[\]] = 0 . $ <glim:limit-numerator>]
  Only finite-coordinate convergence was used in this step.
  ===== 5.8 The weighted denominator. <the-weighted-denominator.>
  Corollary 7 gives the two-sided bound in (5.16) for every admissible $b$, with measurable constants when $b$ is measurable. It remains to choose $b$ with $D_g \( b \) > 0$. Start with a measurable admissible $b_0$, for example $b_0 = 1 + \( - g_1 \)_(+)$. The resolvent-difference identity in #cite(label("FUA")) Proposition 2.3 gives, for $b gt.eq b_0$,
  $ D_g \( b \) - D_g \( b_0 \) = sum_a (frac(1, g_a + b_0) - frac(1, g_a + b)) . $
  The right side increases to $+ oo$ as $b arrow.r oo$, because $sum_a \( g_a + b_0 \)^(- 1) = oo$. Choose the first integer increment $b = b_0 + j$ for which $D_g \( b \) > 0$. This is measurable and admissible, so Corollary 7 gives (5.16).
  Put $ell_a = r_a^(- 1)$. The uniform coordinate moment bound in #cite(label("FUA")) Proposition 2.3 gives
  $ Pi_g \[ M_g \] lt.eq C_g sum_a ell_a^2 < oo . $
  The first coordinate has no atom at zero, so $M_g > 0$ almost surely. This proves that (5.17) is well defined under $Pi_g$ and under every $rho_s$.
  Let $N = ceil.l s^(- 8 \/ 5) ceil.r$ and consider the coordinates $N lt.eq a lt.eq 2 N$. Under the independent Gaussian law of the conditioning construction, write $Z_a = sqrt(ell_a) xi_a$ with independent standard normals $xi_a$. Equation (5.16) implies
  $ 1 / 2 sum_(a = N)^(2 N) ell_a Z_a^2 gt.eq c_g N^(- 4 \/ 3) sum_(a = N)^(2 N) xi_a^2 . $
  The chi-square lower-tail bound shows that this is at least $c_g N^(- 1 \/ 3)$, except on an event of probability at most $C_g e^(- c_g N)$.
  The same estimate survives the norm conditioning with a fixed cost. Leave a sufficiently large fixed head of $m_0$ coordinates outside this block. Let $q$ be the density of $sum_a \( Z_a^2 - ell_a \)$, and $q_(m_0)^(upright("head"))$ the density of its first $m_0$ terms. The tail disintegration in #cite(label("FUA")) Proposition 2.3 states that
  #[#set math.equation(numbering: n => "(5.33)")
   $ frac(d \( Pi_g \)_(> m_0), d ⨂_(a > m_0) N \( 0 \, ell_a \)) = frac(q_(m_0)^(upright("head")) #h(-0.16667em) (D_g \( b \) - sum_(a > m_0) \( x_a^2 - ell_a \)), q \( D_g \( b \) \)) . $ <glim:conditioned-tail-density>]
  The head density is bounded by Fourier inversion once $m_0$ is large enough, and $q \( D_g \( b \) \) > 0$. Hence the ratio in (5.33) is bounded by a finite $g$-dependent constant. For all sufficiently small $s$, the block lies outside the head and
  $ c_g N^(- 1 \/ 3) gt.eq s^(14 \/ 25) \, #h(2em) upright("since") #h(2em) 14 / 25 - 8 / 15 = 2 / 75 > 0 . $
  It follows that
  #[#set math.equation(numbering: n => "(5.34)")
   $ Pi_g { M_g < s^(14 \/ 25) } lt.eq C_g e^(- c_g s^(- 8 \/ 5)) . $ <glim:denominator-static>]
  Using (5.1), for almost every represented environment we obtain
  $ rho_s { M_g < s^(14 \/ 25) } lt.eq C_g C exp #h(-0.16667em) (C s^(- 77 \/ 50) - c_g s^(- 8 \/ 5)) arrow.r 0 \, $
  because $8 \/ 5 > 77 \/ 50$. These probabilities are bounded by one, so the convergence also holds after $hat(bb(E))$.
  On the complement of the two exceptional events in (5.32) and (5.34),
  $ frac(x_i^2, M_g \( x \)) lt.eq s^(13 \/ 20 - 14 \/ 25) = s^(9 \/ 100) . $
  This tends to zero and proves (5.18). ◻
]

For each represented limiting law, the averaged limit in (5.18) yields a deterministic rational sequence $s_k arrow.b 0$ along which, for almost every represented environment, the displayed conditional probabilities tend to zero for every fixed $i$ and $epsilon.alt > 0$. Section 6 proves this extraction and uses the resulting criterion.

== 6 Selection of the entrance law <sec:entrance-selection>

Proposition 25 gives positive-time density families for the edge semigroup, but an extracted family might still depend on randomness beyond the edge points. The uniform-start estimate of Proposition 26 is averaged over the represented environment. We first prove fixed-$g$ uniqueness from a sequential escape criterion and derive the zero-coordinate boundary from that criterion. We then extract a qualifying sequence for almost every represented environment and obtain a family measurable in $g$.

Fix $g$ in a common Borel full-measure subset of the edge set chosen in Proposition 26 on which the conclusions about the conditioned law and the closed gradient form in Items 1 and 3 of Proposition 2 hold with their stated source versions. The rate, finiteness, and positivity conclusions of Proposition 26 hold on this set as well. In this section write

$ r_i = g_i + b \( g \) \, #h(2em) D = D_g \( b \( g \) \) \, #h(2em) Pi = Pi_g \, #h(2em) H = H_g . $

Thus $D > 0$, and there are constants $0 < c_g < C_g < oo$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ c_g \( 1 + i \)^(2 \/ 3) lt.eq r_i lt.eq C_g \( 1 + i \)^(2 \/ 3) #h(2em) \( i gt.eq 1 \) . $ <entr:rates>]

Constants with a subscript $g$ below may be enlarged or decreased and depend only on this fixed realization, unless other dependencies are displayed. Recall the finite, strictly positive random variable

#[#set math.equation(numbering: n => "(6.2)")
 $ M \( x \) = sum_(i gt.eq 1) frac(x_i^2, 2 r_i) \, #h(2em) x tilde.op Pi . $ <entr:mass>]

Its finiteness follows from the uniform coordinate moment bound $Pi \[ x_i^2 \] lt.eq C_g \/ r_i$ and $sum_i r_i^(- 2) < oo$; its positivity follows from the absolute continuity of a one-coordinate marginal. These properties of $Pi$ are part of the conditioned edge law #cite(label("FUA")) Proposition 2.3.

#thm([Theorem 6.1.])[
  (Entrance selection).  #emph[For every $g$ as above, there is at most one family $\( h_s \)_(s > 0)$ of probability densities with respect to $Pi_g$ with the following properties:]
  + #emph[$h_s gt.eq 0$, $Pi_g \[ h_s \] = 1$, and $sup_(s_0 lt.eq s lt.eq s_1) parallel h_s parallel_(L^oo \( Pi_g \)) < oo$ whenever $0 < s_0 < s_1 < oo$;]
  + #emph[$h_(s + t) = S_t^g h_s$ in $L^2 \( Pi_g \)$ for $s \, t > 0$, where $S_t^g = exp \( - t c_(*) H_g \)$;]
  + #emph[there is a sequence $s_k arrow.b 0$ such that, for every $i gt.eq 1$ and $epsilon > 0$, 
#[#set math.equation(numbering: n => "(6.3)")
 $ Pi_g [h_(s_k) thin upright(bold(1))_({ x_i^2 \/ M \( x \) > epsilon })] arrow.r 0 . $ <entr:escape>]

]
  #emph[Any such family satisfies 
#[#set math.equation(numbering: n => "(6.4)")
 $ h_s Pi_g med arrow.r.double med delta_(bold(0)) quad upright("on ") bb(R)^(bb(N)) upright(" with its product topology, as ") s arrow.b 0 . $ <entr:zero-boundary>]

 For almost every $g$ such a family exists. It can be chosen measurably in $g$, as a family of $L^2 \( Pi_g \)$ density classes, and with jointly measurable density representatives in $\( g \, s \, x \)$. Every represented Gaussian limit in Proposition 25 is this family almost surely.]
] <thm:entrance-selection>

The hypothesis (6.3) describes information retained from the finite uniform initialization. Different candidate families may use different sequences in Item 3. The zero-coordinate limit (6.4) is a consequence of that hypothesis and holds as $s$ decreases to zero through all positive times.

We prove uniqueness in the time variable

#[#set math.equation(numbering: n => "(6.5)")
 $ u = c_(*) s \, #h(2em) tilde(h)_u = h_(u \/ c_(*)) \, #h(2em) tilde(S)_u = e^(- u H) . $ <entr:unit-time>]

Then $tilde(h)_(u + v) = tilde(S)_v tilde(h)_u$. The sequence $u_k = c_(*) s_k$ has exactly the escape property (6.3). All elapsed times in the next three subsections refer to $tilde(S)$. We return to $s = u \/ c_(*)$ at the end.

=== 6.1 Angular coordinates and a common diffusion factor <angular-coordinates-and-a-common-diffusion-factor>

We need a stochastic realization only after a positive time, where the initial law has a bounded density. Put $m = 12$ and define

$ R \( x \) = (sum_(j lt.eq m) x_j^2)^(1 \/ 2) . $

On ${ R > 0 }$, set

$ theta_i \( x \) = frac(x_i, R \( x \)) \, #h(2em) overline(r) \( x \) = sum_(j lt.eq m) r_j theta_j \( x \)^2 . $

The functions $theta_i$ are homogeneous of degree zero: if a finite set $J$ contains the head ${ 1 \, dots.h \, m }$ and $i$, then $sum_(j in J) x_j partial_j theta_i = 0$. In the finite-coordinate density of $Pi$, the factor imposing the square constraint has a radial derivative. Its contribution to the generator therefore vanishes on $theta_i$. The next lemma justifies this cancellation for the associated diffusion, including avoidance of $R = 0$.

#thm([Lemma 6.2.])[
  (Angular realization).  #emph[Let $w$ be a bounded probability density with respect to $Pi$. There is a continuous process $X \( t \) = \( X_i \( t \) \)_(i gt.eq 1)$ on $bb(R)^(bb(N))$, with law $\( tilde(S)_t w \) Pi$ at time $t$, and independent standard Brownian motions $\( W_i \)_(i gt.eq 1)$ in its filtration, with the following property. Almost surely $R \( X \( t \) \) > 0$ for all $t gt.eq 0$. With $R \( t \) = R \( X \( t \) \)$, $Theta_i \( t \) = theta_i \( X \( t \) \)$, and $overline(r) \( t \) = overline(r) \( X \( t \) \)$, one has 
#[#set math.equation(numbering: n => "(6.6)")
 $ d Theta_i \( t \) & = frac(sqrt(2), R \( t \)) (d W_i \( t \) - Theta_i \( t \) sum_(j lt.eq m) Theta_j \( t \) thin d W_j \( t \))\
 & quad + Theta_i \( t \) (frac(3 - m - 2 upright(bold(1))_({ i lt.eq m }), R \( t \)^2) - r_i + overline(r) \( t \)) d t . $ <entr:angular-sde>]

 All identities hold simultaneously for $i gt.eq 1$. The Brownian increments after zero are independent of the initial sigma field.]
] <entr:angular-realization>

#proof[
  The closed form of $H$ is $cal(E)_g \( F \, G \) = Pi \[ nabla F dot.op nabla G \]$. Its domain is the closure of the smooth compact cylinder functions, contains the constants and all coordinates, and satisfies $nabla x_i = e_i$ #cite(label("FUA")) Proposition 5.1. Smooth contractions on the core extend by closure, so this is a Dirichlet form. The same approximation, with smooth clipping to preserve a common bound, gives the chain and bounded product rules. In particular the gradient vanishes almost everywhere on a set on which the function is constant: apply the chain rule to smooth truncations in successively smaller neighborhoods of the constant, and use closedness. These rules show strong locality.
  Here are the topological hypotheses for the diffusion theorem. The state space $bb(R)^(bb(N))$ is Polish in the product topology. The smooth compact cylinder core consists of continuous functions and contains a countable family separating its points. To obtain a compact nest, for each coordinate choose a smooth function $v_j$, equal to one outside a sufficiently large coordinate interval and zero on a smaller interval, with $parallel v_j parallel_(cal(E)_g \, 1) lt.eq epsilon.alt 2^(- j)$. Such a choice is possible: coordinate tails have vanishing $Pi$-mass, while a transition of increasing width makes the gradient norm vanish. The sum $sum_j v_j$ converges in the form norm and is at least one on the complement of a compact product box. The definition of $1$-capacity therefore bounds that complement’s capacity by $epsilon.alt^2$. Taking $epsilon.alt arrow.b 0$ and enlarging successive boxes gives a compact nest. The form is thus quasi-regular. Since $1$ has zero energy, its semigroup fixes $1$; the associated process has infinite lifetime under $Pi$, and hence under $w Pi$.
  The diffusion theorem and locality criterion for quasi-regular symmetric Dirichlet forms now give a continuous associated process #cite(label("MaRockner")) Theorems IV.3.5 and V.1.11. Its Fukushima decomposition is supplied by #cite(label("MaRockner")) Theorem VI.2.5. In particular, the coordinate martingales $M^i$ are continuous and have brackets
  $ chevron.l M^i \, M^j chevron.r_t = 2 integral_0^t nabla x_i dot.op nabla x_j \( X \( v \) \) thin d v = 2 delta_(i j) t . $
  The bracket identity is the energy-measure identity for the form, given by #cite(label("FOT")) Theorem 5.2.3 and Equation (5.2.34) after the quasi-regular regularization of #cite(label("MaRockner")) Chapter VI. To apply its bounded formula, first take a bounded smooth clip $u_N = c_N \( x_i \)$. For every bounded form-domain test $f$, the chain and product rules give
  $ 2 cal(E)_g \( u_N f \, u_N \) - cal(E)_g \( u_N^2 \, f \) = 2 Pi \[ f \| c'_N \( x_i \) \|^2 \] . $
  Choose the clips with $\| c'_N \| lt.eq 1$ and $c_N \( x_i \) arrow.r x_i$ in form norm. Passing to the limit in the energy measures and polarizing gives the displayed coordinate brackets. The multidimensional Lévy characterization, for every finite set of indices, gives $M^i = sqrt(2) W_i$ with the asserted countable family of Brownian motions. Brownian motion here is relative to the filtration of the process, so its future increments are independent of the initial sigma field. The usual form exceptional set has $Pi$-measure zero; it can be discarded for $w Pi$. These facts also give continuous coordinate paths.
  We verify the generator used for $theta_i$. The finite-coordinate density formula for $Pi$, on any finite set $J$, is
  #[#set math.equation(numbering: n => "(6.7)")
   $ frac(q_(J^c) #h(-0.16667em) (D - sum_(j in J) \( x_j^2 - r_j^(- 1) \)), q \( D \)) product_(j in J) (frac(r_j, 2 pi))^(1 \/ 2) e^(- r_j x_j^2 \/ 2) . $ <entr:cylinder-density>]
  Here $q$ is the density of the full centered Gaussian square sum, and $q_(J^c)$ is the density after the coordinates in $J$ are deleted #cite(label("FUA")) Proposition 2.3. Both densities exist, $q \( D \) > 0$, and $q_(J^c)$ has bounded derivatives of any prescribed finite order. For the last assertion, leave sufficiently many fixed indices outside $J$; the product of their characteristic-function moduli is bounded by $product \( 1 + 4 t^2 r_j^(- 2) \)^(- 1 \/ 4)$, which is integrable even after multiplication by the prescribed power of $\| t \|$. Fourier inversion then gives the assertion. In particular (6.7) is bounded by a constant times the product Gaussian density.
  The set $R = 0$ is polar. Indeed a smooth cutoff equal to one on ${ R lt.eq epsilon.alt }$, zero on ${ R gt.eq 2 epsilon.alt }$, and with derivative $O \( epsilon.alt^(- 1) \)$, has squared form norm $O \( epsilon.alt^m + epsilon.alt^(m - 2) \)$, by (6.7). Letting $epsilon.alt arrow.b 0$ proves zero capacity. A diffusion starting outside its exceptional set never hits a polar set, which proves the stated pathwise positivity of $R$.
  For a cylinder test whose index set $J$ contains ${ 1 \, dots.h \, m \, i }$, integrate by parts in (6.7). The derivative of the factor $q_(J^c)$ is radial in the $J$ coordinates. Its pairing with the gradient of $theta_i$ vanishes, because $sum_(j in J) x_j partial_j theta_i = 0$. Consequently the nonpositive generator on this function is
  $ cal(L) theta_i = Delta theta_i - sum_(j in J) r_j x_j partial_j theta_i . $
  This integration by parts is legitimate across $R = 0$. More explicitly, cut off at $R = epsilon.alt$ and at large finite-coordinate radius. The function and its first two derivatives near zero are bounded by $C_i \( 1 + \| x_i \| \) \( 1 + R^(- 3) \)$. The products with derivatives of the scale-$epsilon.alt$ cutoff satisfy the same bound on $R asymp epsilon.alt$. Their squared integrals near zero vanish for $m = 12 > 6$. Terms with a derivative on $q_(J^c)$ are bounded by the same Gaussian integrals with polynomial factors, since its first derivative is bounded. Gaussian tails handle the outer cutoff. Thus the cutoffs converge in the form norm, proving $theta_i$ belongs to the form domain, and the weak generator pairing passes to the limit. The displayed $cal(L) theta_i$ is in $L^2 \( Pi \)$ by the same bounds. Extending the pairing from the core shows $theta_i in "Dom" \( H \)$ and $H theta_i = - cal(L) theta_i$.
  A direct differentiation gives, with the head vector extended by zeros,
  $ partial_j theta_i = frac(delta_(i j) - theta_i theta_j upright(bold(1))_({ j lt.eq m }), R) \, #h(2em) cal(L) theta_i = theta_i (frac(3 - m - 2 upright(bold(1))_({ i lt.eq m }), R^2) - r_i + overline(r)) . $
  The Fukushima drift is the time integral of this $L^2$ generator. Its martingale has brackets with the coordinate martingales equal to $2 integral_0^t partial_j theta_i \( X \( v \) \) thin d v$, and self-bracket $2 integral_0^t \| nabla theta_i \( X \( v \) \) \|^2 thin d v$. It therefore equals $sqrt(2) sum_j integral_0^t partial_j theta_i \( X \( v \) \) thin d W_j \( v \)$: the difference has zero bracket. Only the head and index $i$ occur in this finite sum. Integrability follows, for instance, from
  $ bb(E) integral_0^T \| nabla theta_i \( X \( v \) \) \|^2 thin d v lt.eq T parallel w parallel_oo cal(E)_g \( theta_i \) < oo \, $
  because $parallel tilde(S)_v w parallel_oo lt.eq parallel w parallel_oo$. This proves (6.6). Countability permits a common null set for all indices. ◻
]

We now cancel the common head projection in the angular martingale and the common angular drift with a single stochastic integrating factor. On the process of Lemma 28, define the positive scalar $cal(U) \( t \)$ by

#[#set math.equation(numbering: n => "(6.8)")
 $ cal(U) \( 0 \) = frac(R \( 0 \), sqrt(M \( X \( 0 \) \))) \, #h(2em) d cal(U) = cal(U) {sqrt(2) / R sum_(j lt.eq m) Theta_j thin d W_j + (frac(m - 1, R^2) - overline(r)) d t} . $ <entr:scalar-rescaling>]

This is the stochastic exponential with the displayed drift and initial value. On every compact time interval $R$ has a strictly positive minimum, so all its coefficients are locally bounded along the path; the exponential is finite and strictly positive. Put

#[#set math.equation(numbering: n => "(6.9)")
 $ Q = cal(U) / R \, #h(2em) f = Q^2 \, #h(2em) Y_i = cal(U) Theta_i = Q X_i \, #h(2em) y_i = Y_i \( 0 \) . $ <entr:YQ>]

In the product rule for $cal(U) Theta_i$, the quadratic covariation contributes $2 cal(U) Theta_i \( upright(bold(1))_({ i lt.eq m }) - 1 \) R^(- 2) d t$. Adding this to the two drifts in (6.6)–(6.8) cancels all terms containing $R^(- 2)$ or $overline(r)$. Their martingale terms cancel the head projection. Thus

#[#set math.equation(numbering: n => "(6.10)")
 $ d Y_i = - r_i Y_i thin d t + sqrt(2) Q thin d W_i \, #h(2em) Y_i \( t \) = e^(- r_i t) y_i + sqrt(2) integral_0^t e^(- r_i \( t - v \)) Q \( v \) thin d W_i \( v \) . $ <entr:common-sde>]

Both $Q$ and $f$ are positive continuous processes, including at elapsed time zero. The normalization at zero gives

#[#set math.equation(numbering: n => "(6.11)")
 $ p_i := frac(y_i^2, 2 r_i) gt.eq 0 \, #h(2em) sum_i p_i = 1 \, #h(2em) y_i^2 = frac(X_i \( 0 \)^2, M \( X \( 0 \) \)) . $ <entr:seed-weights>]

In particular (6.3) says that these weights leave every finite set in probability when the starting time decreases along its specified sequence.

=== 6.2 The scalar constraint equation <the-scalar-constraint-equation>

The coordinates in (6.10) are driven by the same factor $Q$. The quadratic constraint on $X$ determines that factor through a scalar Volterra equation. To identify the equation before taking an infinite limit, view $f$ and the time kernels causally, by extending them by zero to negative elapsed times, and fix $N$. Set

$ E_i \( t \) = e^(- 2 r_i t) quad \( t gt.eq 0 \) \, #h(2em) L_N \( t \) = sum_(i lt.eq N) r_i^(- 1) E_i \( t \) \, #h(2em) R_N \( x \) = D - sum_(i lt.eq N) \( x_i^2 - r_i^(- 1) \) . $

Itô’s formula in (6.10) gives

$ Y_i \( t \)^2 = E_i \( t \) y_i^2 + 2 \( E_i * f \) \( t \) + 2 sqrt(2) integral_0^t E_i \( t - v \) Q \( v \) Y_i \( v \) thin d W_i \( v \) . $

Since $sum_(i lt.eq N) Y_i^2 = f sum_(i lt.eq N) X_i^2$ and

$ sum_(i lt.eq N) X_i^2 = D + sum_(i lt.eq N) r_i^(- 1) - R_N \( X \) \, $

rearrangement gives, as an identity of causal distributions,

#[#set math.equation(numbering: n => "(6.12)")
 $ D f + \( L_N * f \)' = sum_(i lt.eq N) E_i y_i^2 + 2 sqrt(2) sum_(i lt.eq N) E_i * \( Q Y_i thin d W_i \) + f R_N \( X \) . $ <entr:finite-constraint>]

Here the derivative includes the mass at elapsed time zero:

#[#set math.equation(numbering: n => "(6.13)")
 $ L'_N = (sum_(i lt.eq N) r_i^(- 1)) delta_0 - 2 sum_(i lt.eq N) E_i . $ <entr:initial-delta>]

Thus the coefficient of $f$ contributed by the delta mass is retained in (6.12). This identity is exact for finite $N$. The remaining passage must remove $f R_N \( X \)$ and replace $L_N$ by

$ L \( t \) = sum_i r_i^(- 1) E_i \( t \) \, #h(2em) t > 0 . $

The corresponding limiting operator on $f$ is convolution with $D delta_0 + L'$. The next lemma constructs its positive inverse kernel and the bounds needed for the stochastic terms.

#thm([Lemma 6.3.])[
  (Resolvent kernels).  #emph[For $L$ defined above, let 
$ hat(K) \( z \) = frac(1, D + z hat(L) \( z \)) quad \( z > 0 \) \, $

 where a hat denotes the Laplace transform and every kernel is zero on negative times. The function $L$ is locally integrable, and $hat(K)$ is the Laplace transform of a nonnegative, decreasing function $K$, smooth on $\( 0 \, oo \)$. For $0 < t lt.eq 1$, 
#[#set math.equation(numbering: n => "(6.14)")
 $ c_g t^(- 1 \/ 2) lt.eq K \( t \) lt.eq C_g t^(- 1 \/ 2) \, #h(2em) \| K' \( t \) \| lt.eq C_g t^(- 3 \/ 2) . $ <entr:K-bounds>]

 Set $K_i = K * E_i$. Then 
#[#set math.equation(numbering: n => "(6.15)")
 $ K_i \( t \) & lt.eq C_g frac(sqrt(t), 1 + r_i t) \, & \| K'_i \( t \) \| & lt.eq C_g frac(t^(- 1 \/ 2), 1 + r_i t) \,\
2 r_i K_i \( t \) & arrow.r K \( t \) $ <entr:Ki-bounds>]

 uniformly on each compact subinterval of $\( 0 \, 1 \]$ as $i arrow.r oo$. For $t > 0$, $h gt.eq 0$, $t + h lt.eq 1$, and $0 lt.eq xi < 1 \/ 4$, 
#[#set math.equation(numbering: n => "(6.16)")
 $ sup_i r_i K_i \( t \)^2 & lt.eq C_g \, & sup_i r_i \| K_i \( t + h \) - K_i \( t \) \|^2 & lt.eq C_g min { 1 \, h^2 \/ t^2 } \,\
sum_i \( 1 + r_i \)^(2 xi) K_i \( t \)^2 & lt.eq C_(g \, xi) t^(- 1 \/ 2 - 2 xi) \,\
sum_i \| K_i \( t + h \) - K_i \( t \) \|^2 & lt.eq C_g t^(- 1 \/ 2) min { 1 \, h^2 \/ t^2 } . $ <entr:Ki-sup>]

 As causal distributions, 
#[#set math.equation(numbering: n => "(6.17)")
 $ K * \( D delta_0 + L' \) = delta_0 . $ <entr:kernel-inverse>]

]
] <entr:kernels>

#proof[
  The local integrability follows directly from
  $ integral_0^T L \( t \) thin d t = 1 / 2 sum_i r_i^(- 2) \( 1 - e^(- 2 r_i T) \) < oo . $
  For $L_N = sum_(i lt.eq N) r_i^(- 1) E_i$, put
  $ F_N \( z \) = D + z hat(L)_N \( z \) = D + sum_(i lt.eq N) frac(z, r_i \( z + 2 r_i \)) . $
  The rational function $F_N$ is strictly increasing between its negative poles, since $F'_N \( z \) = sum_(i lt.eq N) 2 \( z + 2 r_i \)^(- 2) > 0$. Its zeros interlace those poles and are strictly negative, using $D > 0$. Its reciprocal is therefore a positive constant plus a sum of positive multiples of $\( z + a \)^(- 1)$, $a > 0$: the residue at a zero is $1 \/ F'_N \( - a \) > 0$. Repeated rates can be grouped before this argument.
  Write these sums as Stieltjes transforms of positive measures. Their measures weighted by $\( 1 + a \)^(- 1)$, with the constant as mass at the point at infinity, have total mass $F_N \( 1 \)^(- 1) lt.eq D^(- 1)$. Weak compactness on $\[ 0 \, oo \]$ and monotone convergence of $F_N \( z \)$ give
  $ frac(1, D + z hat(L) \( z \)) = c + integral_(\[ 0 \, oo \)) frac(nu \( d a \), z + a) \, #h(2em) integral frac(nu \( d a \), 1 + a) < oo . $
  By (6.1), splitting the sum at $r_i = z$ gives
  #[#set math.equation(numbering: n => "(6.18)")
   $ D + z hat(L) \( z \) asymp_g sqrt(z) #h(2em) \( z gt.eq 1 \) . $ <entr:laplace-scale>]
  For sufficiently large $z$, the part with $r_i lt.eq z$ is comparable to $sum_(r_i lt.eq z) r_i^(- 1) asymp sqrt(z)$, and the other part to $z sum_(r_i > z) r_i^(- 2) asymp sqrt(z)$. Positivity and continuity adjust the constants on the remaining compact interval $z gt.eq 1$. Hence the transform tends to zero at infinity and $c = 0$. It is bounded as $z arrow.b 0$, so $nu$ has no atom at zero. The function
  $ K \( t \) = integral_(\( 0 \, oo \)) e^(- a t) nu \( d a \) $
  has the required Laplace transform by Tonelli’s theorem. The weighted integrability of $nu$ implies smoothness for $t > 0$, and the representation makes $K$ positive and decreasing.
  The upper bound in (6.14) follows from
  $ e^(- 1) t K \( t \) lt.eq integral_0^t e^(- v \/ t) K \( v \) thin d v lt.eq hat(K) \( 1 \/ t \) lt.eq C_g sqrt(t) . $
  For the lower bound choose a fixed small $eta > 0$. When $t lt.eq eta$, (6.18) bounds $hat(K) \( eta \/ t \)$ below by $c_g sqrt(t \/ eta)$, whereas the upper bound just proved bounds its integral over $\[ 0 \, t \]$ by $C_g sqrt(t)$. Choose $eta$ so that the first constant is larger than twice the second. The integral over $\[ t \, oo \)$ is at most $eta^(- 1) t e^(- eta) K \( t \)$, proving the lower bound for $t lt.eq eta$. Positivity and monotonicity adjust the constant on $\[ eta \, 1 \]$. Finally
  $ \| K' \( t \) \| = integral a e^(- a t) nu \( d a \) lt.eq C / t K \( t \/ 2 \) lt.eq C_g t^(- 3 \/ 2) . $
  For $r_i t lt.eq 1$, integration of $K \( v \) lt.eq C_g v^(- 1 \/ 2)$ gives the first bound in (6.15). For $r_i t > 1$, write $K_i \( t \) = integral_0^t K \( t - v \) e^(- 2 r_i v) thin d v$ and split at $t \/ 2$. The first half is bounded by $C_g \/ \( r_i sqrt(t) \)$; the second by $C_g sqrt(t) thin e^(- r_i t)$, which has the same bound. For the derivative use $K'_i = K - 2 r_i K_i$. When $r_i t lt.eq 1$ the preceding bounds suffice. When $r_i t > 1$, write
  $ K'_i \( t \) = K \( t \) e^(- 2 r_i t) - 2 r_i integral_0^t e^(- 2 r_i v) #scale(x: 120%, y: 120%)[\(] K \( t - v \) - K \( t \) #scale(x: 120%, y: 120%)[\)] thin d v . $
  On $v lt.eq t \/ 2$ the derivative bound on $K$ makes the integrand difference at most $C_g v t^(- 3 \/ 2)$; on $v > t \/ 2$ the exponential factor pays the integral of $K$. This gives $\| K'_i \( t \) \| lt.eq C_g \/ \( r_i t^(3 \/ 2) \)$. It also proves (6.15), uniformly away from zero.
  The remaining estimates follow by summing (6.15). For example (6.1) gives
  $ sum_i frac(\( 1 + r_i \)^(2 xi), \( 1 + r_i t \)^2) lt.eq C_(g \, xi) t^(- 3 \/ 2 - 2 xi) quad \( 0 lt.eq xi < 1 \/ 4 \) . $
  The restriction on $xi$ is exactly integrability at infinity after the change of variable $v = r_i t$: the comparison integral there is $integral_0^oo v^(1 \/ 2 + 2 xi) \( 1 + v \)^(- 2) thin d v$. This proves (6.16). If $h < t$, integrate the bound on $K'_i$ between $t$ and $t + h$, and then use the same sum with $xi = 0$; this gives (6.16) and (6.16). If $h gt.eq t$, bound the two values separately. Finally the locally integrable function
  $ D integral_0^t K \( v \) thin d v + \( K * L \) \( t \) $
  has Laplace transform $1 \/ z$, and hence equals $1$ for almost every $t > 0$. Its causal distributional derivative gives (6.17). ◻
]

For the normalized seed weights $p_i = y_i^2 \/ \( 2 r_i \)$, define, for $0 < t lt.eq 1$, the candidate seed response

$ A_y \( t \) = sum_i K_i \( t \) y_i^2 = sum_i p_i thin 2 r_i K_i \( t \) . $

The bound $2 r_i K_i \( t \) lt.eq C_g t^(- 1 \/ 2)$, together with $sum_i p_i = 1$, proves that this series converges uniformly on each compact subinterval of $\( 0 \, 1 \]$. Its sum $A_y$ is continuous there and satisfies $0 lt.eq A_y \( t \) lt.eq C_g t^(- 1 \/ 2)$. The high-index limit $2 r_i K_i arrow.r K$ is the ingredient used below to prove $A_y arrow.r K$ in probability, uniformly on compact subintervals of $\( 0 \, 1 \]$, when the weights leave every fixed finite set. The bound $K \( t \) asymp_g t^(- 1 \/ 2)$ determines the scale used in the later stopped comparison of $f = Q^2$. The next lemma defines the infinite stochastic convolution and controls it uniformly over normalized seeds under the corresponding upper bound $\| q \( t \) \| lt.eq C_0 t^(- 1 \/ 4)$.

#thm([Lemma 6.4.])[
  (Stochastic kernel bounds).  #emph[Let $\( W_i \)$ be independent Brownian motions in a filtration, let $\( y_i \)$ be measurable at time zero with $sum_i y_i^2 \/ \( 2 r_i \) = 1$, and let $q$ be progressively measurable with $\| q \( v \) \| lt.eq C_0 v^(- 1 \/ 4)$ for $0 < v lt.eq 1$. Define 
#[#set math.equation(numbering: n => "(6.19)")
 $ Z_i^q \( t \) & = sqrt(2) integral_0^t e^(- r_i \( t - v \)) q \( v \) thin d W_i \( v \) \,\
sans(G)_q^y \( t \) & = 2 sqrt(2) sum_i integral_0^t K_i \( t - v \) q \( v \) e^(- r_i v) y_i thin d W_i \( v \) \,\
sans(N)_q \( t \) & = 2 sqrt(2) sum_i integral_0^t K_i \( t - v \) q \( v \) Z_i^q \( v \) thin d W_i \( v \) . $ <entr:stochastic-parts>]

 The two series converge in probability in $C \( \[ 0 \, 1 \] \)$, with value zero at zero. For every finite $j gt.eq 2$, their partial sums and their limits satisfy 
#[#set math.equation(numbering: n => "(6.20)")
 $ parallel Z_i^q \( t \) parallel_(L^j)^2 & lt.eq C_(g \, C_0 \, j) frac(sqrt(t), 1 + r_i t) \,\
parallel sans(G)_q^y \( t \) parallel_(L^j) + parallel sans(N)_q \( t \) parallel_(L^j) & lt.eq C_(g \, C_0 \, j) t^(1 \/ 4) \,\
parallel sans(G)_q^y \( t + h \) - sans(G)_q^y \( t \) parallel_(L^j) + parallel sans(N)_q \( t + h \) - sans(N)_q \( t \) parallel_(L^j) & lt.eq C_(g \, C_0 \, j) h^(1 \/ 4) quad \( 0 lt.eq t < t + h lt.eq 1 \) . $ <entr:Z-moment>]

 The supremum on $\[ 0 \, 1 \]$ of either limit has every finite moment, bounded by a constant depending only on $g \, C_0$, and that order.]
] <entr:stochastic-kernels>

#proof[
  The bracket estimate and the Burkholder–Davis–Gundy inequality give
  $ parallel Z_i^q \( t \) parallel_(L^j)^2 lt.eq C_(C_0 \, j) integral_0^t e^(- 2 r_i \( t - v \)) v^(- 1 \/ 2) thin d v lt.eq C_(C_0 \, j) frac(sqrt(t), 1 + r_i t) . $
  For the last inequality split at $t \/ 2$; on the second half use $v^(- 1 \/ 2) lt.eq C t^(- 1 \/ 2)$, and on the first use $e^(- 2 r_i \( t - v \)) lt.eq e^(- r_i t)$.
  Write $p_i = y_i^2 \/ \( 2 r_i \)$. The bracket of the first series, at a fixed time $t$, is bounded pathwise by
  $ C_(C_0) integral_0^t v^(- 1 \/ 2) sum_i p_i r_i K_i \( t - v \)^2 thin d v lt.eq C_(g \, C_0) sqrt(t) \, $
  by (6.16) and $sum_i p_i = 1$. This proves its bound in (6.20). In its increment, the old portion of the bracket is at most
  $ C_(g \, C_0) integral_0^t v^(- 1 \/ 2) min { 1 \, h^2 \/ \( t - v \)^2 } thin d v lt.eq C_(g \, C_0) sqrt(h) \, $
  and the new portion is bounded by $C integral_t^(t + h) v^(- 1 \/ 2) thin d v lt.eq C sqrt(h)$. For the displayed integral, if $t lt.eq 2 h$ discard the minimum; if $t > 2 h$, split at $t - h$ and at $t \/ 2$. These bounds prove the first increment estimate.
  For the second series, the martingale moment inequality followed by Minkowski’s inequality bounds its $L^j$ norm squared by
  $ C_j integral_0^t sum_i K_i \( t - v \)^2 parallel q \( v \) Z_i^q \( v \) parallel_(L^j)^2 thin d v lt.eq C_(g \, C_0 \, j) integral_0^t \( t - v \)^(- 1 \/ 2) thin d v lt.eq C_(g \, C_0 \, j) sqrt(t) . $
  We used (6.20), the deterministic bound on $q$, and (6.16) with $xi = 0$. For the increment use (6.16) on the old portion: its squared norm is bounded by
  $ C_(g \, C_0 \, j) integral_0^t \( t - v \)^(- 1 \/ 2) min { 1 \, h^2 \/ \( t - v \)^2 } thin d v lt.eq C_(g \, C_0 \, j) sqrt(h) . $
  The new portion has the same bound by integrating $\( t + h - v \)^(- 1 \/ 2)$ from $t$ to $t + h$.
  All these estimates hold for partial sums. At each fixed time their tails tend to zero in $L^j$: for the first series use $sum_(i > N) p_i r_i K_i \( t - v \)^2 arrow.r 0$ and its constant bound inside the bracket; for the second use the summable bound just displayed. Dominated convergence applies in both cases. Taking $j > 4$, (6.20) gives uniformly small moduli of continuity, by a dyadic chaining estimate (equivalently the Kolmogorov continuity criterion). Fixed-time convergence on a finite grid then proves convergence in probability in $C \( \[ 0 \, 1 \] \)$. The same chaining has a convergent series $sum_(k gt.eq 0) 2^(k \/ j) 2^(- k \/ 4)$, and bounds the $L^j$ norm of the supremum for $j > 4$. Taking a higher order gives the asserted bound for every finite order. ◻
]

#thm([Lemma 6.5.])[
  (The renormalized Volterra equation).  #emph[Let the processes be as in (6.9)–(6.10), and let $A_y$ be the candidate seed response defined above. Almost surely, for $0 < t lt.eq 1$, 
#[#set math.equation(numbering: n => "(6.21)")
 $ f \( t \) = A_y \( t \) + 2 sqrt(2) sum_i integral_0^t K_i \( t - v \) Q \( v \) Y_i \( v \) thin d W_i \( v \) . $ <entr:volterra-equation>]

 The stochastic series is defined by localization and has a continuous version on every compact subinterval of $\( 0 \, 1 \]$.]
] <entr:volterra>

#proof[
  We now justify the infinite passage in (6.12). The constraint says $R_N \( x \) = sum_(i > N) \( x_i^2 - r_i^(- 1) \)$ $Pi$-almost surely. The conditioned edge law describes the tail, after any sufficiently large fixed head, by a bounded density relative to its product Gaussian law #cite(label("FUA")) Proposition 2.3. Consequently, for $N$ beyond that head,
  #[#set math.equation(numbering: n => "(6.22)")
   $ Pi \[ \| R_N \| \] lt.eq C_g (sum_(i > N) r_i^(- 2))^(1 \/ 2) arrow.r 0 . $ <entr:tail-residual>]
  Indeed the Gaussian tail is centered and has variance $2 sum_(i > N) r_i^(- 2)$.
  The density of $X \( t \)$ is bounded by $parallel w parallel_oo$ for all elapsed $t gt.eq 0$. The constraint therefore holds for almost every elapsed time almost surely, and (6.22) gives
  $ bb(E) integral_0^T \| R_N \( X \( v \) \) \| thin d v lt.eq T parallel w parallel_oo Pi \[ \| R_N \| \] arrow.r 0 . $
  The continuous process $f$ is bounded on $\[ 0 \, T \]$ almost surely. First restrict to a bound for that supremum, and then let the bound increase. It follows that $f R_N \( X \) arrow.r 0$ in probability in $L^1 \( 0 \, T \)$. Also
  #[#set math.equation(numbering: n => "(6.23)")
   $ parallel L - L_N parallel_(L^1 \( 0 \, T \)) lt.eq 1 / 2 sum_(i > N) r_i^(- 2) arrow.r 0 . $ <entr:L-tail>]
  Convolving (6.12) with $K$, its left side therefore tends to $f$ in local distributions by (6.17). One can see this directly by writing the difference as the derivative of $K * \( L_N - L \) * f$; its undifferentiated factor tends to zero in $L_(upright("loc"))^1$ by (6.23). The convolved residual also tends to zero in probability in $L_(upright("loc"))^1$, since $K$ is locally integrable.
  The convolved deterministic terms are $sum_(i lt.eq N) K_i \( t \) y_i^2$, which converge uniformly on compact subintervals of $\( 0 \, 1 \]$ to $A_y \( t \)$ by its definition and bound above.
  For a finite stochastic sum, stochastic Fubini gives
  $ K * #scale(x: 120%, y: 120%)[\(] E_i * \( Q Y_i thin d W_i \) #scale(x: 120%, y: 120%)[\)] \( t \) = integral_0^t K_i \( t - v \) Q \( v \) Y_i \( v \) thin d W_i \( v \) . $
  It can first be used with $Q Y_i$ stopped at a finite bound. For such a bound a sufficient stochastic Fubini integral is at most
  $ C integral_0^t K \( t - s \) (integral_0^s E_i \( s - v \)^2 thin d v)^(1 \/ 2) d s lt.eq C integral_0^t K \( t - s \) sqrt(s) thin d s < oo . $
  Removing that bound by localization gives the displayed identity as local distributions.
  To specify the limit without a formal exchange of infinite stochastic sums, for $C_0 > 0$ set
  $ q_(C_0) \( v \) = Q \( v \) and \( C_0 v^(- 1 \/ 4) \) \, #h(2em) zeta_(C_0) = inf { v > 0 : Q \( v \) > C_0 v^(- 1 \/ 4) } . $
  By Lemma 30, the partial sums of $sans(G)_(q_(C_0))^y + sans(N)_(q_(C_0))$ converge in probability in $C \( \[ 0 \, 1 \] \)$ on the whole probability space. Before $zeta_(C_0)$, (6.10) gives $Y_i \( v \) = e^(- r_i v) y_i + Z_i^(q_(C_0)) \( v \)$, so these clipped partial sums agree there with the convolved finite stochastic sums.
  Fix a deterministic $C_0 > 0$ and a rational $a in \( 0 \, 1 \]$. On the whole probability space, the clipped partial sums converge in probability in $C \( \[ 0 \, a \] \)$, and the convolved residual $K * \( f R_N \( X \) \)$ converges in probability to zero in $L^1 \( 0 \, a \)$ as shown above. We may therefore choose a deterministic subsequence $N_j arrow.t oo$ along which both convergences hold almost surely. Only then restrict to the event ${ a < zeta_(C_0) }$. On this event, passage in (6.12) proves (6.21) as a distribution on $\( 0 \, a \)$. Take $C_0$ through the positive integers and $a$ through the rationals in $\( 0 \, 1 \]$, and intersect the corresponding whole-space probability-one convergence events. The continuous versions then give equality for $0 < t < min { zeta_(C_0) \, 1 }$, and by continuity at a positive hitting time $zeta_(C_0) lt.eq 1$ and at $t = 1$ when $zeta_(C_0) > 1$. The positive continuous $Q$ is finite at zero, and $sup_(v lt.eq 1) v^(1 \/ 4) Q \( v \) < oo$ almost surely. A sufficiently large integer $C_0$ therefore covers the whole interval. This proves the claimed identity and its precise interpretation. ◻
]

We next isolate the part of the equation that remembers the initial state. It becomes independent of that state when the weights (6.11) escape.

#thm([Lemma 6.6.])[
  (Escaping seeds).  #emph[Suppose that, along a sequence of initial states possibly random, $sum_i p_i = 1$ and $p_i arrow.r 0$ in probability for every fixed $i$. Then 
#[#set math.equation(numbering: n => "(6.24)")
 $ A_y arrow.r K quad upright("in probability, uniformly on compact subintervals of ") \( 0 \, 1 \] . $ <entr:A-limit>]

 For each fixed $t > 0$, the seed stochastic term $sans(G)_q^y \( t \)$ tends to zero in $L^2$, uniformly over all adapted $q$ satisfying $\| q \( v \) \| lt.eq C_0 v^(- 1 \/ 4)$.]
] <entr:escaping-seeds>

#proof[
  By (6.15), $2 r_i K_i arrow.r K$ uniformly on a fixed compact positive interval, and these functions are uniformly bounded there. In the convex combination $A_y = sum_i p_i thin 2 r_i K_i$, the contribution of a fixed finite set tends to zero in probability and the contribution of its complement is uniformly close to $K$. This proves (6.24).
  For the stochastic assertion, its squared norm is at most
  $ C_(C_0) integral_0^t v^(- 1 \/ 2) thin bb(E) #h(-0.16667em) [sum_i p_i r_i K_i \( t - v \)^2] thin d v . $
  For every $v < t$, (6.15) implies $r_i K_i \( t - v \)^2 arrow.r 0$, whereas (6.16) bounds it uniformly. Escape of $p_i$ makes the expression in brackets tend to zero in probability, and its uniform bound gives convergence of its expectation. Dominated convergence against $v^(- 1 \/ 2)$ proves the assertion. ◻
]

=== 6.3 Coupling entrances <coupling-entrances>

We now prove the deterministic uniqueness and boundary assertions of Theorem 27. Work in unit time (6.5). Let two proposed families be given, with starting sequences $u_(ell \, k) arrow.b 0$, $ell = 1 \, 2$. Start the diffusion of Lemma 28 from $tilde(h)_(u_(ell \, k))^(thin ell) Pi$, and construct $\( Q_ell \, f_ell \, Y_(ell \, i) \, y_(ell \, i) \)$ as above. Their seed weights escape in probability by (6.3) and (6.11). The constants below depend on $g$, and are uniform in $k$ and in the two families.

We may use the same Brownian motions for the two diffusions in elapsed time even though strong existence has not been asserted. Here is the coupling argument. Each joint law of the Brownian path $W$ and all its other continuous path variables is a probability on a standard Borel path space. Disintegrate it over $W$, and, given one Brownian path, sample the two other path variables independently from these conditional laws. Brownian motion remains Brownian in the joint filtration. To see this, if $Phi_ell$ is a bounded observable of the past of process $ell$ through time $t$, independence of future Brownian increments in that process implies

$ bb(E) \[ Phi_ell divides W upright(" on ") \[ 0 \, 1 \] \] = bb(E) \[ Phi_ell divides W upright(" on ") \[ 0 \, t \] \] quad upright("almost surely") . $

Test this equality first against products of functions of the Brownian past and future increments, and then use a monotone class argument. For a product $Phi_1 Phi_2$, conditional independence in the coupling makes its conditional expectation the product of two functions of the Brownian past. A second monotone class argument proves independence of future increments from the joint past. Completion and right-continuous augmentation preserve this property. Finally, stochastic integrals are limits in probability of adapted simple sums. Their laws in each marginal are unchanged by the coupling, and they are the same integrals in this joint Brownian filtration. Thus all the preceding stochastic identities hold on the coupling.

===== 6.3.1 Stops with uniform failure bounds. <stops-with-uniform-failure-bounds.>

Choose $C_0$ so large that

$ C_0^2 > 1 + sup_(0 < t lt.eq 1) sup_y sqrt(t) thin A_y \( t \) \, $

where the supremum is over the normalized seeds in (6.11); it is finite by the bound on $A_y$ following Lemma 29. For each solution use the clipped process $q_ell^(thin 0) \( v \) = Q_ell \( v \) and \( C_0 v^(- 1 \/ 4) \)$. Let $k_0 = inf_(0 < t lt.eq 1 \/ 2) sqrt(t) thin K \( t \) > 0$, and choose $c in \( 0 \, k_0 \/ 4 \)$. Lemma 32 permits a deterministic sequence $eta_k arrow.b 0$, as slow as necessary, such that with probability tending to one both solutions satisfy

#[#set math.equation(numbering: n => "(6.25)")
 $ sqrt(t) thin A_(y_ell) \( t \) gt.eq 2 c #h(2em) \( eta_k lt.eq t lt.eq 1 \/ 2 \) . $ <entr:seed-lower>]

This follows by a diagonal choice from uniform convergence on each fixed compact interval.

Stop each solution when $sqrt(t) thin f_ell \( t \)$ first reaches the upper threshold $C_0^2$; it starts below that threshold since $f_ell$ is finite at zero. Starting at $eta_k$, also stop when $sqrt(t) thin f_ell \( t \) lt.eq c$. Before the upper stop, Lemma 31 reads

$ f_ell = A_(y_ell) + sans(G)_(q_ell^(thin 0))^(y_ell) + sans(N)_(q_ell^(thin 0)) . $

It holds also at a positive first hit by continuity. On the event (6.25), either threshold hit by time $delta lt.eq 1 \/ 2$ requires the supremum of the stochastic term on $\[ 0 \, 1 \]$ to be at least a fixed multiple of $delta^(- 1 \/ 2)$. Lemma 30 and Markov’s inequality therefore bound its probability by $C_j delta^(j \/ 2)$ for any fixed sufficiently large $j$, plus a term tending to zero with $k$.

Fix $0 < xi < 1 \/ 4$. Add a stop for each solution at the infimum, over $i gt.eq 1$, of the first times

$ \| Z_i^(q_ell^(thin 0)) \( t \) \| gt.eq \( 1 + r_i \)^xi . $

This costs at most a positive power of $delta$ by time $delta$. Indeed if $N_i \( t \) = sqrt(2) integral_0^t q_ell^(thin 0) \( v \) thin d W_i \( v \)$, integration by parts gives

$ Z_i^(q_ell^(thin 0)) \( t \) = N_i \( t \) - r_i integral_0^t e^(- r_i \( t - v \)) N_i \( v \) thin d v \, #h(2em) sup_(t lt.eq delta) \| Z_i^(q_ell^(thin 0)) \( t \) \| lt.eq 2 sup_(t lt.eq delta) \| N_i \( t \) \| . $

The last supremum has $L^j$ norm at most $C_j delta^(1 \/ 4)$, uniformly in $i$. Choose $j > 3 \/ \( 2 xi \)$, so $sum_i \( 1 + r_i \)^(- j xi) < oo$ by (6.1), and sum Markov’s inequality over $i$. The resulting bound is $C_j delta^(j \/ 4)$. A countable infimum of these stopping times is a stopping time in the right-continuous filtration. If an infimum is not attained, an individual stop occurs by $2 delta$ whenever the infimum is at most $delta > 0$; this only changes the constant.

Let $tau_k$ be the minimum of all these stops for both solutions, capped at $1 \/ 2$. There are constants $b > 0 \, C < oo$, independent of $k$, such that, for sufficiently small fixed $delta > 0$,

#[#set math.equation(numbering: n => "(6.26)")
 $ limsup_(k arrow.r oo) bb(P) \( tau_k lt.eq delta \) lt.eq C delta^b . $ <entr:stop-probability>]

Here and below the probability is over the initial draws and the coupled diffusions, with $g$ fixed.

===== 6.3.2 Contraction of the common factors. <contraction-of-the-common-factors.>

Use the common stopped integrands

$ q_ell \( v \) = Q_ell \( v \) upright(bold(1))_({ v < tau_k }) \, #h(2em) d_k \( v \) = sqrt(v) thin bb(E) \| q_1 \( v \) - q_2 \( v \) \|^2 . $

They satisfy $\| q_ell \( v \) \| lt.eq C_0 v^(- 1 \/ 4)$, so $0 lt.eq d_k \( v \) lt.eq C$. Until $tau_k$, the stopped versions of (6.21) agree with $f_ell$, and $\| Z_i^(q_ell) \( v \) \| lt.eq \( 1 + r_i \)^xi$. For $v gt.eq eta_k$, the lower threshold gives

#[#set math.equation(numbering: n => "(6.27)")
 $ d_k \( v \) lt.eq C v thin bb(E) [upright(bold(1))_({ v < tau_k }) \| f_1 \( v \) - f_2 \( v \) \|^2] . $ <entr:sqrt-difference>]

This is the identity $\( sqrt(f_1) - sqrt(f_2) \)^2 = \( f_1 - f_2 \)^2 \/ \( sqrt(f_1) + sqrt(f_2) \)^2$, using $f_ell \( v \) gt.eq c v^(- 1 \/ 2)$ before the stop.

Let

$ F_ell \( v \) = A_(y_ell) \( v \) + sans(G)_(q_ell)^(y_ell) \( v \) + sans(N)_(q_ell) \( v \) . $

It agrees with $f_ell$ for $v < tau_k$. At a fixed $v > 0$, Lemma 32 and its uniform bounds give

#[#set math.equation(numbering: n => "(6.28)")
 $ bb(E) \| A_(y_1) \( v \) - A_(y_2) \( v \) \|^2 + bb(E) \| sans(G)_(q_1)^(y_1) \( v \) \|^2 + bb(E) \| sans(G)_(q_2)^(y_2) \( v \) \|^2 arrow.r 0 . $ <entr:seed-vanishes>]

For the deterministic term, convergence in probability becomes $L^2$ convergence because $\| A_y \( v \) \| lt.eq C_g v^(- 1 \/ 2)$.

It remains to compare $sans(N)_(q_1)$ and $sans(N)_(q_2)$. In its integrand write

$ q_1 Z_i^(q_1) - q_2 Z_i^(q_2) = \( q_1 - q_2 \) Z_i^(q_1) + q_2 \( Z_i^(q_1) - Z_i^(q_2) \) . $

The first term is nonzero only before the common stop, where $\| Z_i^(q_1) \| lt.eq \( 1 + r_i \)^xi$. For the second, the common Brownian motions and Itô isometry give

$ bb(E) \| Z_i^(q_1) \( w \) - Z_i^(q_2) \( w \) \|^2 = 2 integral_0^w e^(- 2 r_i \( w - a \)) a^(- 1 \/ 2) d_k \( a \) thin d a . $

Using (6.16) with $xi$ for the first term and with zero for the second yields

#[#set math.equation(numbering: n => "(6.29)")
 $ bb(E) \| sans(N)_(q_1) \( v \) - sans(N)_(q_2) \( v \) \|^2 & lt.eq C integral_0^v \( v - w \)^(- 1 \/ 2 - 2 xi) w^(- 1 \/ 2) d_k \( w \) thin d w\
 & quad + C integral_0^v \( v - w \)^(- 1 \/ 2) w^(- 1 \/ 2) integral_0^w a^(- 1 \/ 2) d_k \( a \) thin d a thin d w . $ <entr:contraction-integrals>]

All sums and integrals here are justified by Tonelli’s theorem and the displayed finite upper bounds. In the second line we used the deterministic bound $q_2 \( w \)^2 lt.eq C_0^2 w^(- 1 \/ 2)$ and discarded the decaying exponential after Itô isometry. No independence of these integrands is required.

For $v > 0$ define $d_oo \( v \) = limsup_k d_k \( v \)$. For each fixed $v$ we eventually have $v gt.eq eta_k$. Combine (6.27)–(6.29). The bounds $d_k lt.eq C$ allow the upper limit to pass under the integrals by dominated convergence applied to upper envelopes. The kernels are integrable because $xi < 1 \/ 4$. If $D_delta = sup_(0 < v lt.eq delta) d_oo \( v \)$, the two beta integrals then give

$ d_oo \( v \) lt.eq C #scale(x: 120%, y: 120%)[\(] v^(1 - 2 xi) + v^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] D_delta #h(2em) \( 0 < v lt.eq delta \) . $

For the first power use $integral_0^v \( v - w \)^(- 1 \/ 2 - 2 xi) w^(- 1 \/ 2) thin d w = C_xi v^(- 2 xi)$; for the second use $integral_0^w a^(- 1 \/ 2) thin d a = 2 sqrt(w)$. Choose $delta > 0$ small enough that $C \( delta^(1 - 2 xi) + delta^(3 \/ 2) \) < 1$. Taking the supremum proves

#[#set math.equation(numbering: n => "(6.30)")
 $ d_k \( v \) arrow.r 0 #h(2em) \( 0 < v lt.eq delta \) . $ <entr:q-convergence>]

At a fixed such $delta$, dominated convergence in (6.29) and (6.28) now shows

$ bb(E) #h(-0.16667em) [upright(bold(1))_({ delta < tau_k }) \| f_1 \( delta \) - f_2 \( delta \) \|^2] arrow.r 0 . $

For each fixed $i$, the same conclusion holds for $\| Y_(1 \, i) \( delta \) - Y_(2 \, i) \( delta \) \|^2$. Indeed $y_(ell \, i) arrow.r 0$ in probability by escape and $\| y_(ell \, i) \|^2 lt.eq 2 r_i$, while the squared norm of the difference of the two $Z_i$ terms is $2 integral_0^delta e^(- 2 r_i \( delta - v \)) v^(- 1 \/ 2) d_k \( v \) thin d v arrow.r 0$ by (6.30). On ${ delta < tau_k }$ the denominators satisfy $f_ell \( delta \) gt.eq c delta^(- 1 \/ 2)$, and

$ \| Y_(ell \, i) \( delta \) \| lt.eq sqrt(2 r_i) + \( 1 + r_i \)^xi . $

Since $X_(ell \, i) = Y_(ell \, i) \/ sqrt(f_ell)$, it follows that for every finite $j$ and every $epsilon > 0$,

#[#set math.equation(numbering: n => "(6.31)")
 $ limsup_k bb(P) (max_(i lt.eq j) \| X_(1 \, i) \( delta \) - X_(2 \, i) \( delta \) \| > epsilon) lt.eq C delta^b . $ <entr:coordinate-coupling>]

===== 6.3.3 Equality of the families. <equality-of-the-families.>

The law at elapsed time $delta$ of process $ell$ is $tilde(h)_(u_(ell \, k) + delta)^(thin ell) Pi$. It converges in total variation to $tilde(h)_delta^(thin ell) Pi$: the semigroup relation writes its density as $tilde(S)_(u_(ell \, k)) tilde(h)_delta^(thin ell)$, and strong continuity in $L^2 \( Pi \)$ implies $L^1$ convergence. The couplings of their two elapsed-time marginals are tight on $bb(R)^(bb(N)) times bb(R)^(bb(N))$, so take a weakly convergent subsequence. Its limit is a coupling of the two prescribed marginals at $delta$. For the open event in (6.31), the portmanteau theorem gives the same upper bound for the limiting coupling. Let $epsilon arrow.b 0$ and then $j arrow.t oo$. The limiting coupling assigns probability at least $1 - C delta^b$ to equality of all coordinates. Hence

$ parallel tilde(h)_delta^(thin 1) Pi - tilde(h)_delta^(thin 2) Pi parallel_("TV") lt.eq C delta^b . $

The Markov semigroup contracts total variation. For any fixed $v > delta$ the same bound holds at $v$, and sending $delta arrow.b 0$ proves equality of the two marginals at $v$. They are equal at every positive time, and hence their density classes are equal. This proves uniqueness.

===== 6.3.4 The boundary at zero. <the-boundary-at-zero.>

Use one proposed family and the preceding stops. On ${ delta < tau_k }$,

$ \| X_i \( delta \) \| = frac(\| Y_i \( delta \) \|, sqrt(f \( delta \))) lt.eq frac(sqrt(2 r_i) + \( 1 + r_i \)^xi, sqrt(c)) thin delta^(1 \/ 4) . $

Let the starting index $k arrow.r oo$. The elapsed-time law converges in total variation to the prescribed marginal at $delta$, and (6.26) bounds the excluded probability by $C delta^b$. Thus each coordinate tends to zero in probability under $tilde(h)_delta Pi$ as $delta arrow.b 0$. For example the bounded product metric $sum_i 2^(- i) min { 1 \, \| x_i \| }$ tends to zero in probability: truncate its sum and use the finitely many coordinate conclusions. This proves (6.4) in unit time, and then in the theorem’s critical time by (6.5).

=== 6.4 Measurability and Gaussian identification <measurability-and-gaussian-identification>

Return now to the theorem’s critical time $s = u \/ c_(*)$, so that the evolution is by $S_t^g = e^(- t c_(*) H_g)$. It remains to obtain the family from $g$ itself and to check existence. We give the measure-theoretic passage, since the escape estimate in Proposition 26 initially averages over the represented environment as well as $x$.

On any represented Gaussian limiting space write $mu_s = h_s Pi_g$. At rational $s > 0$ these probability measures are measurably encoded by their integrals against a countable convergence-determining collection of bounded continuous cylinders. Equivalently

$ bold(mu) = \( mu_s \)_(s in bb(Q)_(> 0)) in cal(P) \( bb(R)^(bb(N)) \)^(bb(Q)_(> 0)) $

is a random element of a standard Borel space. The asserted measurability follows from that encoding: a countable separating collection embeds $cal(P) \( bb(R)^(bb(N)) \)$ injectively and measurably in a countable product, and its inverse on the image is measurable. By the convention in Proposition 26, the escape quotient is jointly Borel on $bb(R)^(bb(N)) times bb(R)^(bb(N))$. For each fixed $i$ and $epsilon > 0$, its threshold event is a Borel subset of this parameter/state space, so the evaluation of that event under $mu_s$ is a measurable function of $\( g \, mu_s \)$.

The annealed escape estimate permits a deterministic rational sequence $s_k arrow.b 0$ for which, almost surely in the represented data, (6.3) holds for every $i \, epsilon$. To see this choose $s_k < min { 2^(- k) \, s_(k - 1) \/ 2 }$ rational, successively, so that

$ bb(E) sum_(i lt.eq k) mu_(s_k) { x_i^2 \/ M_g \( x \) > 1 \/ k } lt.eq 2^(- k) . $

Proposition 26 allows this choice. Tonelli’s theorem shows that the sum of the displayed random quantities over $k$ is finite almost surely. For fixed $i \, epsilon > 0$, eventually $i lt.eq k$ and $1 \/ k < epsilon$; the corresponding probability in (6.3) consequently tends to zero. The positive-time semigroup and boundedness properties hold on the same full-measure set by Proposition 25.

The finite-coordinate formula (6.7) makes $g mapsto Pi_g$ a measurable probability kernel. The edge semigroup is also measurable in $g$ in its countable varying-$L^2$ encoding. To see the precise claim needed here, take a countable smooth cylinder core. Its Gram entries $Pi_g \[ phi.alt_i phi.alt_j \]$ and form entries $Pi_g \[ nabla phi.alt_i dot.op nabla phi.alt_j \]$ are measurable. For $lambda > 0$ the variational formula

$ chevron.l phi.alt \, \( lambda + H_g \)^(- 1) phi.alt chevron.r_(Pi_g) = sup_v { 2 Pi_g \[ phi.alt v \] - lambda Pi_g \[ v^2 \] - cal(E)_g \( v \) } \, $

where $v$ ranges over the rational span of that core, proves measurability of the resolvent pairings; polarization gives mixed pairings. Choose the countable core sequence linearly independent as cylinder functions, with dense real span. The positive finite-coordinate densities make every finite Gram matrix positive definite. The coefficients of the orthogonal projection of an encoded $L^2$ vector on a finite core span are its cylinder pairings multiplied by the inverse Gram matrix; they are measurable. These projections converge in $L^2$, proving the corresponding measurability for arbitrary encoded vectors. Continuous functional calculus then gives measurability of $S_t^g$ in the same encoding, jointly for $t > 0$; one can approximate $e^(- t c_(*) H_g)$ by continuous functions of $\( 1 + H_g \)^(- 1)$, and use strong continuity in $t$. This is also the countable-core construction in the functional identification proof for the stationary edge law #cite(label("FUA")) proof of Proposition 9.2.

The normalization, boundedness, evolution, and escape conditions are properties of the countable code together with $g$. Normalization and bounded domination by $Pi_g$ can be checked on a countable cylinder algebra, with an integer bound on each rational compact time interval. Evolution can be checked against the same tests at rational times; it then extends to real times by strong $L^2$ continuity. The preceding core construction makes the semigroup pairings measurable in $g$. Thus these conditions, together with the displayed countable escape tests, define a measurable full set of codes on which the deterministic theorem applies.

Disintegrate the law of $\( g \, bold(mu) \)$ over $g$. For almost every $g$, two independent conditional samples of $bold(mu)$ both extend to the positive-time families just considered and both pass (6.3). Fixed-$g$ uniqueness therefore makes these samples equal. A probability measure on a standard Borel space whose two independent draws agree almost surely is a point mass (apply the assertion to a countable separating collection of Borel sets). Thus the conditional law of $bold(mu)$ given $g$ is a point mass almost surely. Its point depends measurably on $g$: the map $z mapsto delta_z$ is a measurable injection into the space of probability measures and has a measurable inverse on its image. This constructs measurable $mu_s^g$ for rational $s$, and establishes existence.

We spell out the extension to density classes and real times. A measurable Radon–Nikodym theorem applied to the kernels $mu_q^g lt.double Pi_g$ gives measurable representatives $h_q^g \( x \)$ for rational $q$.

For real $s > 0$, choose any rational $q < s$ and set

#[#set math.equation(numbering: n => "(6.32)")
 $ h_s^g = S_(s - q)^g h_q^g . $ <entr:real-extension>]

The rational evolution relation makes this independent of $q$. Choosing $q = q \( s \)$ by a fixed measurable rational rule and using the semigroup measurability established above shows that the density classes in (6.32) are measurable in $\( g \, s \)$. The corresponding measures form a measurable kernel; the measurable Radon–Nikodym theorem once more gives jointly measurable representatives $h_s^g \( x \)$. They are the $L^2$-continuous extension furnished by the semigroup, with the stated normalization and local boundedness.

For a second extracted Gaussian law, condition its code over the same GOE law of $g$. Its conditional samples pass the criterion on some sequence by the same argument, so fixed-$g$ uniqueness makes its point mass the one already constructed, outside a common null set. Thus every subsequential Gaussian limit is determined by $g$. The locally uniform correlation convergence and relaxation in Proposition 25 now hold for this $h^g$, and the subsequence criterion proves the asserted joint Gaussian convergence. Finally, undoing (6.5) returns the evolution $h_(s + t)^g = e^(- t c_(*) H_g) h_s^g$. The only time substitution in this section was the temporary variable $u = c_(*) s$; the coefficient in $S_t^g$ remains $c_(*)$. 0◻

== 7 Smooth truncation of clock histories <sec:history-cutoffs>

The replacement of the coupling variables requires bounds for clock paths whose duration is of order $T = n^(2 \/ 3)$. We obtain them by capping transition densities on every scale of a binary time tree. This section constructs the caps, proves that they discard negligible Gaussian mass, and records the conditional path laws to which the score estimates will apply.

All times in Sections 7–8 are in site-clock units. A stationary query at lag $t$ is one path of length $t T$ started from $mu$. A quench query $\( s \, t \)$ is one path started from $nu_n$, with consecutive legs of lengths $s T$ and $t T$. Fix a compact set of query times. Every complete leg then has length in $\[ c T \, C T \]$, where $0 < c < C < oo$ are fixed. We use Taylor orders at most $K = 24$. The constant $beta > 0$ will be chosen sufficiently small after $K$. The notation $a lt.tilde_beta b$ means $a lt.eq C_0 n^(C_1 beta) b$, with $C_1$ depending at most on $K$ and the fixed query set, but not on $beta$. Fixed logarithmic factors can be included in this convention. Moment orders and the precision of probability estimates may be increased without changing $C_1$; their constants and the lower bound on $n$ may change. For a vector indexed by $ E_n = { { i \, j } : 1 lt.eq i < j lt.eq n }$, put

$ \| v \|_p = (1 / binom(n, 2) sum_(e in  E_n) \| v_e \|^p)^(1 \/ p) \, #h(2em) \| v \|_oo = max_(e in  E_n) \| v_e \| . $

=== 7.1 A static support valid for every interaction matrix <a-static-support-valid-for-every-interaction-matrix>

Write $theta_(i j) = J_(i j) \/ sqrt(n)$. In entry replacement, an order-$k$ derivative in $theta_e$ is multiplied by $n^(- k \/ 2)$; summing over the order-$n^2$ entries gives the factor $n^(2 - k \/ 2)$. The Gaussian and Rademacher laws match through order three. The averaged fourth derivative of the truncated trace tests must therefore tend to zero, while higher derivatives may grow within the remaining negative power of $n$. The estimates below are organized around this fourth-order requirement; $K = 24$ supplies a global remainder bound.

The Gibbs probability $mu$ is strictly positive for every finite matrix $theta$. For independent spins $X^1 \, dots.h \, X^4$ define

$ rho_2 \( X^a \, X^b \) = 1 / n sum_i X_i^a X_i^b \, #h(2em) rho_4 \( X^1 \, X^2 \, X^3 \, X^4 \) = 1 / n sum_i X_i^1 X_i^2 X_i^3 X_i^4 . $

Let $ D_n$ be the dyadic numbers from $1$ through a fixed multiple of $C T$, including the first dyadic number beyond that multiple. Set

#[#set math.equation(numbering: n => "(7.1)")
 $ r_2 \( d \) = n^(2 beta) d^(- 1 \/ 2) \, quad r_4 \( d \) = n^(10 beta) d^(- 3 \/ 4) \, quad a_2 \( d \) = n^(3 beta) n d^(- 3 \/ 2) \, quad a_4 \( d \) = n^(8 beta) n d^(- 3 \/ 2) . $ <hist:static-scales>]

For $r_2 \( d \) < 1$ let $A_2 \( d \) = { \| rho_2 \| > r_2 \( d \) }$. For $r_4 \( d \) < 1$ let

$ A_4 \( d \) = {max_(a < b) \| rho_2 \( X^a \, X^b \) \| lt.eq r_2 \( d \) \, quad \| rho_4 \( X^1 \, X^2 \, X^3 \, X^4 \) \| > r_4 \( d \)} . $

The displayed four-replica probability below is an unconditional $mu^(⊗ 4)$ probability.

#thm([Lemma 7.1.])[
  (Static support).  #emph[There is a smooth function $chi_n \( theta \) in \[ 0 \, 1 \]$ with the following properties. On its support, and on the support of any of its derivatives of order at most $K$, the matrix satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ mu^(⊗ 2) \( A_2 \( d \) \) lt.eq e^(- a_2 \( d \)) \, #h(2em) mu^(⊗ 4) \( A_4 \( d \) \) lt.eq e^(- a_4 \( d \)) \, #h(2em) d in  D_n \,\
n^(- 6) sum_(i < j) theta_(i j)^2 lt.eq 2 . $ <hist:static-conditions>]

 An assertion involving an omitted event is void. For some $b = b \( beta \) > 0$, every derivative of $chi_n$ of positive order at most $K$ in one coefficient $theta_e$, and every differentiated factor in its product construction, is $O \( n^(- b) \)$, uniformly in $e$ and $theta$. For Gaussian couplings, $chi_n = 1$ with probability tending to one.]
] <hist:static-support>

#proof[
  Choose a fixed smooth increasing function $f$ that is zero on $\( - oo \, 1 \]$ and one on $\[ 2 \, oo \)$. For each nonempty $A_j \( d \)$ use the factor $f \( - log mu^(⊗ j) \( A_j \( d \) \) \/ a_j \( d \) \)$, and omit empty events. Multiply these factors and a smooth function of $n^(- 6) sum_e theta_e^2$ that is one below $1$ and zero above $2$. This gives (7.2) and a plateau equal to one when each probability there is at most $e^(- 2 a_j \( d \))$ and the size statistic is at most one.
  To check derivatives, the $k$th derivative of the logarithm of a nonempty replica probability in $theta_e$ is the difference of two cumulants of $sum_(a = 1)^j X_i^a X_j^a$, under the restricted and unrestricted replica probabilities. The variable is bounded by $j lt.eq 4$, so every fixed-order cumulant is bounded by a constant depending only on its order. Since $a_2 \( d \) gt.eq c_0 n^(3 beta)$ and $a_4 \( d \) gt.eq c_0 n^(8 beta)$ on $ D_n$, every derivative of positive order of a replica factor gains at least $n^(- 3 beta)$. Derivatives of the size factor gain at least $n^(- 3)$: where a derivative is nonzero, $\| theta_e \| lt.eq sqrt(2) n^3$. There are $O \( log n \)$ factors. The product rule now proves the stated bound, for example with any sufficiently small $b < min \( 3 beta \, 3 \)$.
  We prove the Gaussian assertion with the diagonal and eigenvector sign randomization fixed as in Section 3. On spectral events of limiting probability as close to one as desired, Lemma 6 gives, for the uncapped zero-field spherical law and a sufficiently small fixed $rho_0 > 0$,
  $ bb(P)_(upright("sph"))^(⊗ 2) { \| rho_2 \| > w } lt.eq C e^(- c_0 n w^3) \, #h(2em) C_0 p lt.eq w lt.eq rho_0 \, $
  where one can take any permitted reference scale with $n p^3$ above the tight threshold. The smallest pair threshold $r_2 \( d \)$ in (7.1) is $gt.double n^(- 1 \/ 3)$, so such a $p$ is available below all the nonvacuous shrinking pair thresholds. In a band $z < \| rho_2 \| lt.eq 2 z$, truncated at $rho_0$, we apply the weighted two-replica overlap-cell consequence of Lemma 8. On the retained event $parallel W parallel lt.eq 3$, the logarithm of the positive zero-field angular weight has overlap derivative $O \( n \)$, uniformly over the orthonormal two-frame. It therefore oscillates by at most a fixed constant on each cell of width $2 \/ n$. Summing the weighted cell inequality over the band enlarges its spherical endpoints by at most $1 \/ n$ and costs at most $exp \( C n z^4 + C log n \)$ after increasing $C$. For the pair thresholds $w$ at issue, $z gt.eq w gt.double n^(- 1 \/ 3)$, so the enlargement is absorbed by decreasing the tail constant $c_0$. Shrink $rho_0$ so that this cost is bounded by $exp \( c_0 n z^3 \/ 2 + C log n \)$. Summing the dyadic bands from $w$ to $rho_0$ therefore bounds the Haar mean of the restricted cube partition function, divided by the squared spherical partition function, by $exp \( - c_1 n w^3 \)$ for all the thresholds in question. Here $n w^3 gt.eq c n^(6 beta)$ absorbs $O \( log n \)$. The likelihood ratio $L_compose = Z_(upright("cube")) \/ Z_(upright("sp"))$ is at least $1 \/ 2$ with probability tending to one on these restrictions, by Equation (3.5). Markov’s inequality consequently proves the pair plateau, because
  $ frac(n r_2 \( d \)^3, a_2 \( d \)) = n^(3 beta) arrow.r oo . $
  For overlaps bounded away from zero, the fixed-overlap estimate in #cite(label("FUA")) Lemma 8.2 gives an $e^(- c n)$ tail with Gaussian probability tending to one. This pays $2 a_2 \( d \) = 2 n^(1 - 3 beta) r_2 \( d \)^3 = o \( n \)$ for any such nonvacuous threshold.
  Here is the corresponding four-replica calculation. If $r_4 \( d \) < 1$, then $r_2 \( d \) lt.eq n^(- 14 beta \/ 3) = o \( 1 \)$ and $r_2 \( d \)^2 \/ r_4 \( d \) lt.eq n^(- 6 beta)$. For one row of four independent uniform signs, let $Y in { - 1 \, 1 }^6$ be its six pair products and let $H$ be its four-product. For $n$ independent rows write $macron(Y) = n^(- 1) sum_i Y_i$ and $macron(H) = n^(- 1) sum_i H_i$. Put $Lambda \( v \) = log bb(E) e^(v dot.op Y)$, and let $bb(P)_v$ be the row probability with density $e^(v dot.op Y - Lambda \( v \))$, with expectation $bb(E)_v$. For several rows the same notation denotes its product probability. Around the origin,
  $ Lambda \( v \) = 1 / 2 \| v \|^2 + O \( \| v \|^3 \) \, #h(2em) bb(E)_v H = O \( \| v \|^2 \) . $
  Indeed the six coordinates of $Y$ are centered and have identity covariance, while $bb(E) H = bb(E) \( H Y \) = 0$; Taylor’s theorem on this finite space gives both uniform remainders. If the empirical pair vector is the lattice value $u$ with $\| u \| lt.eq sqrt(6) r_2 \( d \)$, put $E_d = { \| macron(H) \| > r_4 \( d \) }$. The change of measure gives
  $ bb(P)_(upright("cube"))^(⊗ 4) { macron(Y) = u \, med E_d } = e^(- n \| u \|^2 + n Lambda \( u \)) bb(P)_u { macron(Y) = u \, med E_d } lt.eq e^(- n \| u \|^2 + n Lambda \( u \)) bb(P)_u \( E_d \) . $
  Under $bb(P)_u$ the rows remain independent. Since $\| bb(E)_u H \| lt.eq r_4 \( d \) \/ 2$ for large $n$, Hoeffding’s inequality #cite(label("Hoeffding1963")) bounds the last probability by $2 e^(- n r_4 \( d \)^2 \/ 8)$. Together with the expansion of $Lambda$, this gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ bb(P)_(upright("cube"))^(⊗ 4) { macron(Y) = u \, med \| macron(H) \| > r_4 \( d \) } lt.eq 2 exp { - n / 2 \| u \|^2 + C n \| u \|^3 - c n r_4 \( d \)^2 } . $ <hist:cube-quartet>]
  For completeness, the reverse Gram cost is also explicit. Put $G_(a a) = 1$ and $G_(a b) = u_(a b)$. The Gram density of four independent uniform points of the sphere of radius $sqrt(n)$ is a polynomial normalization times $det \( G \)^(\( n - 5 \) \/ 2)$ on positive correlation matrices. For $\| u \| = o \( 1 \)$, $log det G = - \| u \|^2 + O \( \| u \|^3 \)$. A cell of width $c \/ n$ about $G$ thus has probability at least
  $ exp { - n / 2 \| u \|^2 - C n \| u \|^3 - C log n } . $
  At a fixed spectrum with bounded norm, let $F in bb(R)^(n times 4)$ be a uniform orthonormal frame and put
  $ cal(A)_lambda \( G \) = Z_(upright("sp"))^(- 4) bb(E)_F exp { \( n \/ 2 \) "Tr" \( F^(sans(T)) "diag" \( lambda \) F G \) } . $
  The exponent has Lipschitz constant $O \( n \)$ in $G$, so the integrand changes by at most a factor $e^(O \( 1 \))$ across the cell. The integral of $cal(A)_lambda$ against the spherical Gram probability equals one. Restricting it to the cell therefore bounds the Haar mean at Gram $G$ by
  $ exp { n / 2 \| u \|^2 + C n \| u \|^3 + C log n } . $
  Multiply this by (7.3) and sum the at most $\( n + 1 \)^6$ possible Grams. The remaining error $C n r_2 \( d \)^3 + C log n$ is negligible relative to $n r_4 \( d \)^2$, since
  $ n r_2 \( d \)^3 = n^(6 beta) n d^(- 3 \/ 2) \, #h(2em) n r_4 \( d \)^2 = n^(20 beta) n d^(- 3 \/ 2) . $
  On $L_compose gt.eq 1 \/ 2$, division by the cube partition function changes the four-replica numerator by at most $16$. Markov’s inequality proves its plateau $e^(- 2 a_4 \( d \))$, since $n r_4 \( d \)^2 \/ a_4 \( d \) = n^(12 beta)$. A union over $O \( log n \)$ scales is harmless. Finally, the Gaussian mean of $n^(- 6) sum_e theta_e^2$ is $O \( n^(- 5) \)$. The size plateau follows from Markov’s inequality. Enlarging the spectral restrictions completes the proof that $chi_n = 1$ with probability tending to one. ◻
]

Only this last verification used Gaussian frame averages. In the remainder of this section and in the score estimates, $theta$ is any deterministic matrix satisfying (7.2).

=== 7.2 The tree kernels and their survival probabilities <the-tree-kernels-and-their-survival-probabilities>

For each leg $I = \[ a \, b \]$, repeatedly bisect time intervals until their lengths belong to $\[ 1 \, 2 \]$. (Changing the harmless endpoint convention when a length is exactly $2$ leaves all statements below unchanged.) A node and its two children are denoted by $I$ and $I^(-) \, I^(+)$, in chronological order. Define

#[#set math.equation(numbering: n => "(7.4)")
 $ N_I = N \( \| I \| \) \, #h(2em) N \( d \) = n^beta \( T \/ d \)^(3 \/ 2) = n^(1 + beta) d^(- 3 \/ 2) . $ <hist:node-level>]

All these levels lie between $c_0 n^beta$ and $C_0 n^(1 + beta)$.

#thm([Lemma 7.2.])[
  (A smooth cap).  #emph[For every level in (7.4) there is a smooth $W_N : bb(R) arrow.r \( 0 \, 1 \)$ such that 
#[#set math.equation(numbering: n => "(7.5)")
 $ e^l W_N \( l \) lt.eq e^(C N) \, #h(2em) 1 - W_N \( l \) lt.eq e^(- \( log n \)^2 \/ 2) quad \( l lt.eq N \/ 2 \) . $ <hist:cap-and-plateau>]

 For $1 lt.eq k lt.eq K$ its derivative in $l$ satisfies globally 
#[#set math.equation(numbering: n => "(7.6)")
 $ frac(\| W_N^(\( k \)) \|, W_N) + frac(\| W_N^(\( k \)) \|, 1 - W_N) lt.eq C_K \, #h(2em) frac(\| W_N^(\( k \)) \|, 1 - W_N) lt.eq frac(C_K \( log n \)^(2 K), N) . $ <hist:global-ratios>]

 For each fixed $L$, wherever $W_N \( l \) gt.eq n^(- L)$ one also has 
#[#set math.equation(numbering: n => "(7.7)")
 $ frac(\| W_N^(\( k \)) \( l \) \|, W_N \( l \)) lt.eq frac(C_(K \, L) \( log n \)^(2 K), N) #scale(x: 120%, y: 120%)[\(] 1 - W_N \( l \) #scale(x: 120%, y: 120%)[\)] . $ <hist:survival-hazard>]

 Moreover, uniformly over these levels and for sufficiently large $n$, 
#[#set math.equation(numbering: n => "(7.8)")
 $ \| log W_N \( l \) \| + \| log \( 1 - W_N \( l \) \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + N + \| l \| + \( log n \)^2 #scale(x: 120%, y: 120%)[\)] . $ <hist:log-cap-growth>]

]
] <hist:cutoff-hazards>

#proof[
  Let $psi$ be smooth and nondecreasing, zero on $\( - oo \, 2 \]$, with $0 lt.eq psi' lt.eq 1$ and $psi' = 1$ on $\[ 3 \, oo \)$. Put
  $ a_N \( z \) = \( log n \)^2 \( z - 1 \) + 3 N psi \( z \) \, #h(2em) W_N \( l \) = #scale(x: 120%, y: 120%)[\(] 1 + e^(a_N \( l \/ N \)) #scale(x: 120%, y: 120%)[\)]^(- 1) . $
  For $l lt.eq 3 N$ the first inequality in (7.5) is immediate. For $z = l \/ N gt.eq 3$, $psi \( z \) gt.eq z - 3$, so $l - a_N \( z \) lt.eq 3 N$; the same inequality follows from $W_N lt.eq e^(- a_N)$. If $l lt.eq N \/ 2$, then $a_N \( l \/ N \) lt.eq - \( log n \)^2 \/ 2$, proving the plateau.
  All $l$-derivatives of $a_N \( l \/ N \)$ of positive order at most $K$ are bounded: the first is $\( log n \)^2 \/ N + 3 psi' \( l \/ N \)$ and the others are $3 N^(1 - k) psi^(\( k \)) \( l \/ N \)$. Derivatives of the logistic function have a factor $W_N \( 1 - W_N \)$ times a bounded polynomial in $W_N$, which proves the first part of (7.6). If $W_N gt.eq n^(- L)$, then $a_N lt.eq L log n + O \( 1 \) < \( log n \)^2$; hence $l \/ N < 2$ for large $n$. In this region $a_N$ is affine, and its slope in $l$ is $\( log n \)^2 \/ N$. The same derivative formula proves (7.7). It also proves the second part of (7.6) for $l \/ N lt.eq 2$. In the remaining region $W_N lt.eq e^(- \( log n \)^2)$, so the first global bound with its logistic factor gives the second bound there as well, since $N$ is polynomial in $n$. Finally the two logarithms are bounded by $C \( 1 + \| a_N \( l \/ N \) \| \)$. Since $psi$ is Lipschitz and $\( log n \)^2 \/ N lt.eq 1$ for large $n$, this proves (7.8). ◻
]

Let $p_d \( x \, y \) = P_d \( x \, y \) \/ mu \( y \)$ be the true transition density. Define the pre-density $macron(k)_I$, the survival factor $w_I$, and the post-density $k_I$, all relative to the normalized probability $mu$, by

#[#set math.equation(numbering: n => "(7.9)")
 $ macron(k)_I \( x \, y \) & = p_(\| I \|) \( x \, y \) &  & upright("if ") I upright(" is a leaf") \,\
macron(k)_I \( x \, y \) & = sum_z mu \( z \) k_(I^(-)) \( x \, z \) k_(I^(+)) \( z \, y \) &  & upright("otherwise") \,\
w_I \( x \, y \) & = W_(N_I) \( log macron(k)_I \( x \, y \) \) \, #h(2em) k_I \( x \, y \) = macron(k)_I \( x \, y \) w_I \( x \, y \) . $ <hist:kernel-recursion>]

All these numbers are positive. In particular, the logarithms are defined. The transition $k_I \( x \, y \) mu \( y \)$ is a subprobability. At a fixed leg we may equivalently sample an ordinary marked heat-bath path and retain it with the product of its $w_I \( X_a \, X_b \)$ over all nodes. Apply checks at their right endpoints, ordering equal right endpoints from the smallest interval to the largest. The equivalence follows inductively from the Markov property and (7.9).

#thm([Lemma 7.3.])[
  (Deterministic kernel consequences).  #emph[For every node $I$ of length $d$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ 0 < k_I \( x \, y \) lt.eq macron(k)_I \( x \, y \) lt.eq p_d \( x \, y \) \, #h(2em) k_I \( x \, y \) lt.eq e^(C N \( d \)) . $ <hist:kernel-bounds>]

 Both $k_I$ and $macron(k)_I$ are symmetric in $\( x \, y \)$. If an interval of length $h$ lies inside a checked tree, with $h$ larger than a fixed constant, the weighted transition across it has density at most $e^(C' N \( h \))$ after all weights other than one contained complete node are discarded. The same assertion holds when the top check of the tree is omitted or is a failure factor $1 - w_I$.]
] <hist:kernel-caps>

#proof[
  Positivity and domination by $p_d$ follow by induction and the semigroup property of $P_d$. The cap is (7.5). At a split the two children have equal lengths and use the same rule, so their kernels are identical. The convolution of this symmetric kernel with itself is symmetric; multiplication by the endpoint function $W_N \( log macron(k)_I \)$ preserves symmetry. This starts from detailed balance of $p_d$.
  Every subinterval of length $h$ larger than a fixed constant contains a tree node $J$ of length at least $c_1 h$. One may require $J$ to be a proper descendant at the cost of reducing $c_1$. Keep the checks in $J$ and discard the other weights, all of which lie in $\[ 0 \, 1 \]$. The remaining transition is an ordinary kernel, followed by $k_J$, followed by an ordinary kernel. Since ordinary kernels preserve $mu$ and constants, its density is at most $e^(C N \( \| J \| \)) lt.eq e^(C' N \( h \))$. A discarded failure or top factor also lies in $\[ 0 \, 1 \]$. ◻
]

#thm([Lemma 7.4.])[
  (Gaussian survival).  #emph[For every $A < oo$ and $epsilon > 0$, there are Gaussian disorder events of limiting lower probability at least $1 - epsilon$ on which $chi_n = 1$ and the mass lost by the checks in any complete query is at most $n^(- A)$. This bound is uniform over its query times in the fixed compact set and over its initial probability on the cube.]
] <hist:gaussian-survival>

#proof[
  The log-moment assertion of Theorem 15 says that, for each fixed integer $p gt.eq 1$ and sufficiently small fixed $xi > 0$, on disorder restrictions of arbitrarily high limiting probability,
  $ sup_x (1 + sum_y P_d \( x \, y \) log_(+)^p p_d \( x \, y \))^(1 \/ p) lt.eq C_(p \, xi) (1 + \( T \/ d \)^(1 \/ \( 2 \/ 3 - xi \))) \, quad 1 lt.eq d lt.eq C T . $
  Choose $xi$ so that $xi \/ \( 2 \/ 3 - xi \) < beta \/ 2$. Division by $N \( d \)$ shows that the right side is at most $C_(p \, xi) n^(- beta \/ 2) N \( d \)$ uniformly in this range: the largest possible extra factor is $T^(1 \/ \( 2 \/ 3 - xi \) - 3 \/ 2) = n^(xi \/ \( 2 \/ 3 - xi \))$. Markov’s inequality therefore gives
  $ sup_x P_d \( x \, { y : log p_d \( x \, y \) > N \( d \) \/ 2 } \) lt.eq C_(p \, xi) n^(- p beta \/ 2) . $
  By (7.10), $macron(k)_I lt.eq p_(\| I \|)$. At each check, its failure probability under an ordinary path is thus bounded by the last display plus $e^(- \( log n \)^2 \/ 2)$. The probability of a first failure is at most the sum of these probabilities, because all preceding weights are at most one. There are $O \( T \)$ nodes. Choose $p$ large after $A$ and use Lemma 33 for the plateau. All estimates were uniform in the starting state and in $d$, which proves the asserted uniformity. ◻
]

=== 7.3 Tested histories and their conditional interiors <tested-histories-and-their-conditional-interiors>

We record precisely which changes of path measure will be used. An ordinary marked path includes the time, site, and new sign at every ring, including a resampling that keeps the current sign. Its law on a time interval $I$ from $x$ is denoted by $sans(P)_x^I$.

#prodef([Definition 7.5.])[
  (Tested path law).  A checked history is one of the following subprobabilities, with initial probability either $mu$ or the uniform cube probability:
  + an entire query path with every survival factor in its legs;
  + the prefix through a specified first failing check $F$, with all preceding survival factors and the factor $1 - w_F$ at that check.
  The check order is the one following (7.9); the choice of $F$ and all tree shapes is fixed independently of the path and of $e$. In case (ii), the maximal checked intervals of the prefix form a forest: the last is $F$, whose descendants survive, and every preceding root and its descendants survive. Designate the initial state, all leg boundaries, and all boundaries of these maximal roots as its external endpoints, retaining only boundaries present in a stopped prefix. Multiply the history by a nonnegative function $Phi$ of these endpoints with $parallel Phi parallel_oo lt.eq n^(M_(+))$, where $M_(+)$ is fixed and $Phi$ is the same for every $e in  E_n$. When the resulting mass $m_Phi$ is at least $n^(- M_(-))$ for a fixed $M_(-)$, its normalization is a tested path law, denoted by $sans(Q)_Phi$.
  Products of a fixed number of such histories use independent ordinary paths and a separate external test on each history. Signed tests are decomposed into positive and negative parts separately. A statement that holds with arbitrarily high inverse-polynomial probability means that for every fixed $A$ its exception has $sans(Q)_Phi$ probability at most $n^(- A)$ for all sufficiently large $n$, uniformly in the fixed choices above and in disorder satisfying (7.2).
] <hist:tested-law>

There are at most polynomially many nodes. In the last, possibly partial, leg of a first-failure history, its preceding maximal roots are the earlier siblings encountered in the binary subdivision leading to $F$. In their chronological order their lengths are nonincreasing and the last such length is at least $\| F \|$. Complete earlier legs have lengths comparable to $T$. These facts also show that earlier maximal roots have lengths at least a fixed multiple of later ones, with the multiple depending only on the query set. The density of $sans(Q)_Phi$ relative to the ordinary forward law with the same initial probability is at most $n^(M_(+) + M_(-))$; future endpoints are not revealed in that forward law’s natural filtration.

For a node $I = \[ a \, b \]$, write $V_I = product_(J subset.neq I) w_J \( X_(partial J) \)$, with the product over its proper descendants. The normalized interior law with boundary $\( x \, y \)$ is

#[#set math.equation(numbering: n => "(7.11)")
 $ sans(C)_I^(x \, y) \( d omega \) = frac(V_I \( omega \) upright(bold(1))_({ X_b = y }), mu \( y \) macron(k)_I \( x \, y \)) sans(P)_x^I \( d omega \) . $ <hist:bridge-definition>]

The denominator equals the numerator’s integral by the kernel recursion. This definition excludes the top check. A top survival, failure, or omitted check is constant after its boundary is fixed.

#thm([Lemma 7.6.])[
  (Conditional interiors and prefix bounds).  #emph[Let $I$ be a fixed node of a checked root in a tested path law. Given the marked history outside the interior of $I$ and its two boundary states, the conditional law inside $I$ is $sans(C)_I^(X_a \, X_b)$. In particular, resampling this interior independently from that law preserves the tested marginal. For an internal node its midpoint $z$ under $sans(C)_I^(x \, y)$ has probability 
#[#set math.equation(numbering: n => "(7.12)")
 $ pi_I^(x \, y) \( z \) = frac(mu \( z \) k_(I^(-)) \( x \, z \) k_(I^(+)) \( z \, y \), macron(k)_I \( x \, y \)) \, $ <hist:midpoint-probability>]

 and conditional on $z$ the two interiors are independent with laws $sans(C)_(I^(-))^(x \, z)$ and $sans(C)_(I^(+))^(z \, y)$.]
  #emph[For every $A$, there is $L = L \( A \, M_(+) \, M_(-) \) < oo$ such that $macron(k)_I \( X_a \, X_b \) gt.eq n^(- L)$ outside an endpoint event of probability $n^(- A)$ under any such tested law. If $d = \| I \|$ exceeds a fixed constant, then for these boundaries the density of its first two thirds under $sans(C)_I^(x \, y)$ relative to the ordinary unconditioned prefix from $x$ is at most 
#[#set math.equation(numbering: n => "(7.13)")
 $ n^L e^(C' N \( d \)) . $ <hist:prefix-density>]

 The reversed last two thirds have the same bound relative to the ordinary prefix from $y$ in reversed time.]
] <hist:conditional-interior>

#proof[
  The tree is laminar: every check whose interior intersects the interior of $I$ is a descendant or an ancestor of $I$. Disjoint siblings may share an endpoint, but their factors are fixed by the exterior and boundary data. The ancestor factors, the top factor, and the external test are fixed by the same data. The remaining factors are exactly $V_I$. The Markov property gives (7.11) as the conditional law, and then gives (7.12) and the conditional independence. This proves the resampling assertion as well. It applies to tree nodes; an arbitrary subinterval can have crossing checks.
  At a fixed start $x$,
  $ sum_y mu \( y \) macron(k)_I \( x \, y \) upright(bold(1))_({ macron(k)_I \( x \, y \) < delta }) lt.eq delta . $
  Integrate the node first in the tested history and discard all other weights. The bound on $Phi$ and the lower bound on its mass show $sans(Q)_Phi { macron(k)_I \( X_a \, X_b \) < delta } lt.eq n^(M_(+) + M_(-)) delta$. This proves the endpoint assertion by choosing $delta = n^(- L)$.
  Let $cal(F)_t^arrow.r$ contain just the marked prefix of the node from $a$ to $t$. For $t - a lt.eq 2 d \/ 3$, its conditional density is exactly
  $ frac(d \( sans(C)_I^(x \, y) \|_(cal(F)_t^arrow.r) \), d \( sans(P)_x^I \|_(cal(F)_t^arrow.r) \)) = frac(sans(E)_x \[ V_I upright(bold(1))_({ X_b = y }) divides cal(F)_t^arrow.r \], mu \( y \) macron(k)_I \( x \, y \)) . $
  The interval remaining after $t$ contains a proper node of length at least $c_1 d$. Keep its checks and discard all others in the numerator. By Lemma 35, that numerator is at most $mu \( y \) e^(C' N \( d \))$. This proves (7.13). Detailed balance for marked paths includes self-resampling rings, and the proper-descendant weights are invariant under reversal because equal-length children use identical symmetric kernels. Reversal therefore sends $sans(C)_I^(x \, y)$ to $sans(C)_I^(y \, x)$ on the reflected node, proving the last assertion. No reversal of the entire stopped forest is needed. ◻
]

#thm([Lemma 7.7.])[
  (Overlaps along a checked history).  #emph[With arbitrarily high inverse-polynomial probability under a tested path law, simultaneously for times in any one of its checked root intervals, 
#[#set math.equation(numbering: n => "(7.14)")
 $ \| rho_2 \( X \( t_1 \) \, X \( t_2 \) \) \| lt.tilde_beta \( 1 + m \)^(- 1 \/ 2) \, #h(2em) \| rho_4 \( X \( t_1 \) \, X \( t_2 \) \, X \( t_3 \) \, X \( t_4 \) \) \| lt.tilde_beta \( 1 + m \)^(- 3 \/ 4) . $ <hist:path-overlaps>]

 In each assertion the times are increasingly ordered, and $m$ is the minimum of their consecutive gaps and of the gap from the root’s start to $t_1$. The assertion includes a failing root. It also holds for the full history obtained by each of a fixed finite collection of interior resamplings in Lemma 38, separately within each such history. All times in an overlap are taken from that one history.]
] <hist:history-overlaps>

#proof[
  First use deterministic times with $m$ larger than a fixed constant. Inside each gap choose a contained proper checked node of length comparable to $m$. They are disjoint. Dropping all other weights and applying Lemma 35 shows that the joint law of the observed states, given any initial state, is bounded by their product $mu$ law times $exp \( C_2 N \( m \) \)$. This estimate counts the retained weights without conditioning on survival. Apply (7.2) at a dyadic scale comparable to $m$, first to all relevant pairs, and then to the quartet on the event that its pairs obey the same threshold. The ratios $a_2 \( m \) \/ N \( m \) = n^(2 beta)$ and $a_4 \( m \) \/ N \( m \) = n^(7 beta)$ tend to infinity. Their exponents are at least a positive power of $n$, so they pay the cap and any polynomial test density with any prescribed inverse-polynomial precision. A vacuous threshold or bounded $m$ gives the bound directly from $\| rho_j \| lt.eq 1$.
  Use a time mesh of sufficiently small inverse-polynomial spacing. The probability that any mesh cell has two rings is arbitrarily small after paying the polynomial test density: under ordinary paths the total clock rate is $n$, and the union bound is $O \( n^2 T \)$ times the spacing. A single ring changes either overlap by at most $2 \/ n$ per affected time. This is smaller than the displayed thresholds, whose smallest quartet value has order $n^(- 1 \/ 2 + 10 beta)$. A union over the polynomially many grid tuples proves the simultaneous assertion. A resampled interior has the same tested marginal by Lemma 38; a union proves the last claim for any fixed number of copies. ◻
]

=== 7.4 Local differentiability and normalizations <local-differentiability-and-normalizations>

We finish by recording a coarse derivative bound, used to control exceptional histories. For $e = { i \, j }$ write $q_e \( x \) = x_i x_j$ and perturb the interaction $theta_e$ by $theta.alt$, putting $u = tanh theta.alt$. The new stationary probability is exactly

#[#set math.equation(numbering: n => "(7.15)")
 $ mu_u \( x \) = mu \( x \) frac(1 + u q_e \( x \), 1 + u mu q_e) \, #h(2em) \| u \| < 1 . $ <hist:stationary-perturbation>]

Let $t_i \( x \) = mu \[ X_i divides X_(- i) = x_(- i) \]$. At a ring of site $i$ with new sign $zeta$, the likelihood ratio of the perturbed mark is

#[#set math.equation(numbering: n => "(7.16)")
 $ M_(e \, i \, zeta) \( u \) = frac(1 + u zeta x_j, 1 + u x_j t_i \( x \)) \; $ <hist:ring-likelihood>]

interchange $i \, j$ at the other site, and use one at all remaining sites. The site rates stay equal to one. Thus the full path likelihood $L_(I \, e) \( u \)$ is the product of (7.16) at its rings. The formula includes a mark that retains the current sign.

Superscript $u$ on $macron(k)_I \, k_I \, w_I$ denotes the construction (7.9) for the perturbed dynamics and its normalized stationary probability $mu_u$. Throughout, $\[ u^l \]$ means the $l$th Taylor coefficient at zero (the derivative divided by $l !$). For the pre-density, the exact change of measure is

#[#set math.equation(numbering: n => "(7.17)")
 $ frac(macron(k)_I^u \( x \, y \), macron(k)_I \( x \, y \)) = \( 1 + u mu q_e \) thin sans(C)_I^(x \, y) [frac(L_(I \, e) \( u \), 1 + u q_e \( y \)) product_(J subset.neq I) frac(w_J^u \( X_(partial J) \), w_J \( X_(partial J) \))] . $ <hist:pre-ratio>]

The product is over all proper descendants; it contains only survival factors. In particular $1 + u mu q_e$ is required by normalization of the perturbed stationary probability.

#thm([Lemma 7.8.])[
  (Coarse coefficients and moments).  #emph[On the size support in (7.2), for all nodes, boundaries and $e$, and $1 lt.eq l lt.eq K$, 
$ lr(|\[ u^l \] macron(k)_I^u / macron(k)_I|) + lr(|\[ u^l \] k_I^u / k_I|) + lr(|\[ u^l \] w_I^u / w_I|) + lr(|\[ u^l \] frac(1 - w_I^u, 1 - w_I)|) lt.eq n^(C_K) . $

 The exponent $C_K$ is independent of $beta$ in a fixed sufficiently small range and of any later number of conditional copies. Absolute fixed-order moments of clock counts and raw path coefficients are polynomial under tested laws and their resampled marginals. Conditional on an arbitrary boundary pair of one node, the same moments under $sans(C)_I^(x \, y)$ are bounded by a polynomial (with exponent allowed to depend on the moment order). Finally, conditional on arbitrary designated external endpoints, the absolute normalized coefficient through total order $K$ of an entire checked or first-failure history is bounded by $n^(C_K)$, after enlarging $C_K$. Thus its unnormalized coefficient with any nonnegative external endpoint test held fixed under the interaction perturbation is bounded by $n^(C_K)$ times the test’s base mass, however small that mass is.]
] <hist:crude-ratios>

#proof[
  The size support gives $sum_e \| theta_e \| lt.eq C n^4$, hence $min_x mu \( x \) gt.eq e^(- C n^4)$. By Cauchy–Schwarz, each absolute one-site field is at most $C n^(7 \/ 2)$. On a leaf, prescribe one ring of each site in successive subintervals of length $1 \/ n$, with its sign set to the desired endpoint, and no other rings. The clock event has probability $e^(- n \| I \|) n^(- n)$, and each prescribed mark has probability at least $1 / 2 e^(- C n^(7 \/ 2))$. Thus every leaf transition probability is at least $e^(- C n^5)$, uniformly in its endpoints. Its logarithmic density has absolute value at most $C n^5$. The last assertion of Lemma 34 and the kernel recursion propagate this property up the tree: composing two positive kernels costs a fixed multiple of the previous logarithmic bound plus a polynomial, and applying $W_N$ has the same property. The depth is $O \( log n \)$, so all these absolute logarithms remain polynomial, with a fixed exponent. In particular $mu \( y \) macron(k)_I \( x \, y \) gt.eq e^(- n^(C_0))$ for a fixed $C_0$.
  The total number of ordinary rings on a node is Poisson with parameter $n \| I \| lt.eq C n T$. Its tail above any sufficiently large polynomial is smaller than $e^(- 2 n^(C_0))$ times any inverse power of $n$. Dividing by the last lower bound and using $V_I lt.eq 1$ proves polynomial conditional count moments for every boundary. Each fixed Taylor coefficient of the ring product is a polynomial of fixed degree in its number of rings, since each single-ring coefficient in (7.16) is bounded. This proves the claimed raw moments, both conditionally and under the polynomially tilted tested laws. The copy statement follows from their preserved marginals.
  At a leaf, (7.17) has an empty product; the preceding count bound and the bounded coefficients of $\( 1 + u mu q_e \) \/ \( 1 + u q_e \( y \) \)$ give the coarse bound for its pre-density. Suppose normalized coefficients of order $l lt.eq K$ at one tree level are bounded by $D^l$. For a composition, division by its base value writes its ratio as a conditional average of the product of the two child ratios and $mu_u \( z \) \/ mu \( z \)$. Its order-$l$ coefficient is therefore at most $\( C_K \( D + 1 \) \)^l$. Taylor’s chain rule for $W_N \( log macron(k)_I^u \)$ uses the global ratios (7.6); coefficients of the logarithm are polynomials in nonconstant pre-ratio coefficients, each product having total order $l$. The same bound applies to either survival or failure ratios and to the post-density. Starting with a polynomial $D$ at the leaves and iterating $D mapsto C_K \( D + 1 \)$ for $O \( log n \)$ levels proves these coefficient bounds. Formula (7.17) itself follows by inserting the path likelihood and then dividing by $mu_u \( y \) \/ mu \( y \)$ in the definition of the pre-density.
  To check the last forest assertion, fix its designated external endpoints. The interiors of its maximal roots are the corresponding conditional laws (7.11), and their top survival or failure factors are fixed. Expand a coefficient of total order at most $K$ by the product rule. A differentiated node contributes one of the normalized ratios just bounded; the raw ring factors have the conditional polynomial moments proved above. There are polynomially many nodes and at most $K$ positive orders, so the number and magnitude of the resulting terms are bounded by $n^(C_K)$. Stationary initialization, if present, contributes only the bounded coefficients in (7.15). Integrating this conditional bound against the nonnegative endpoint test and its base endpoint measure proves the asserted factor of the base mass. ◻
]

Here and below, estimates on a set of arbitrarily small inverse-polynomial probability can be used inside conditional averages. The precise elementary rule is as follows. If $sans(Q) \( E^c \) lt.eq n^(- A')$ and $parallel Y parallel_(L^p \( sans(Q) \)) lt.eq n^C$ for some $p > 1$, then for any boundary $sigma$-field $cal(B)$,

$ sans(Q) {sans(E)_(sans(Q)) \[ \| Y \| upright(bold(1))_(E^c) divides cal(B) \] > n^(- A)} lt.eq n^(A + C - \( 1 - 1 \/ p \) A') . $

Choose $A'$ after $A$ to make this as small as required. The coarse bounds of Lemma 40 supply these moments for all coefficients used below; a fixed number of copies is handled by Hölder’s inequality. For a tested mass below a chosen inverse-polynomial precision, use instead the final forest assertion of Lemma 40 before normalization: its unnormalized coefficient is at most $n^(C_K)$ times that mass. Polynomially many deterministic nodes, grid points, or choices of any fixed number of copies are handled by a union bound. These conventions never give a uniform assertion for every boundary pair when the sharper estimate was proved only for typical boundaries.

== 8 Projecting the clock scores <sec:clock-scores>

We now prove the derivative estimates for the stopped histories. The ordinary likelihood coefficients of a path of length $D$ have size $D^(l \/ 2)$ at order $l$. We gain in the contribution of a raw coefficient to a tested expectation by compensating its last ring before taking absolute values. For the sharper estimates, we first average an earlier raw block conditional on its endpoints while later insertions are still raw; those endpoints are then in the past of the later block in the chosen orientation. A drift obtained after conditioning on a future endpoint is not thereby predictable for a smaller filtration.

Throughout this section the interaction matrix is fixed on (7.2), and all weights and tested laws are at this base matrix. They are common to every $e in  E_n$. Only the ring likelihood $L_(I \, e) \( u \)$ varies when a clock coefficient is formed. Write

$ ell_(l \, e) \( I \) = \[ u^l \] L_(I \, e) \( u \) \, #h(2em) ell_(0 \, e) \( I \) = 1 . $

Superscripts $arrow.r$ and $arrow.l$ specify forward and reversed time orientation. The reversed object records the reversed marks, including the old sign as the reversed new sign. Whenever a bound written $lt.tilde_beta$ absorbs a factor $n^eta$ from a path estimate, choose $eta$ beforehand as a sufficiently small fixed multiple of $beta$. Only a number of such losses depending on $K$ occurs in this section.

=== 8.1 Changes of path law and their compensators <changes-of-path-law-and-their-compensators>

We will use two kinds of oriented probability law. The first is a tested path law in its natural forward filtration. This filtration contains the initial state and the marked past; future external endpoints are still unrevealed. The second is $sans(C)_I^(x \, y)$ on its first two thirds in the forward orientation, or on its last two thirds in the reversed orientation, for fixed $x \, y$ satisfying the endpoint bound in Lemma 38. Its reference probability is the ordinary #emph[unconditioned] prefix from its initial endpoint. The other endpoint is a fixed parameter, and no additional future path information is revealed. An independent history, or a conditional copy sampled using only already revealed data and independently of the subsequent path, can be included among the information available at the start. These will be called the admissible oriented laws. When such auxiliary data are adjoined, use the same conditional sampling kernel under the reference and changed laws, independently of future rings given the information already present. This leaves both the reference intensities and the likelihood ratio unchanged.

A bridge expectation in an identity is taken at its fixed boundary pair. Every high-probability assertion about its pathwise bounds, however, is with respect to the tested law of the boundary followed by that conditional interior. It is not a uniform conditional assertion for all pairs with $macron(k)_I \( x \, y \) gt.eq n^(- L)$: the overlap and count events are inherited under this joint law. This convention applies to every admissible bridge portion below.

In either orientation the reference predictable intensity of the mark $\( i \, zeta \)$, $zeta in { - 1 \, 1 }$, is

#[#set math.equation(numbering: n => "(8.1)")
 $ r_(i \, zeta) \( t \) = frac(1 + zeta t_i \( X \( t - \) \), 2) . $ <score:reference-rates>]

Their sum at a site is one. Under an admissible law $sans(Q)$, write its predictable intensities as $r_(i \, zeta) b_(i \, zeta)$. Such predictable ratios exist on histories of positive $sans(Q)$ probability by the intensity change formula #cite(label("Jacod1975")) Theorem 4.1. For example, conditional waiting and mark densities under a probability absolutely continuous with respect to the ordinary path law give them by dividing the conditional waiting density by the conditional no-ring survival. Localization covers zeros of that survival. For a time interval $H$ in the oriented portion put

#[#set math.equation(numbering: n => "(8.2)")
 $ cal(J)_H = integral_H sum_(i \, zeta) r_(i \, zeta) \( t \) \( sqrt(b_(i \, zeta) \( t \)) - 1 \)^2 thin d t \, #h(2em) cal(J)_(H \, i) = integral_H sum_zeta r_(i \, zeta) \( sqrt(b_(i \, zeta)) - 1 \)^2 thin d t . $ <score:hellinger-cost>]

The cost is additive on disjoint intervals. The probabilities and hence the ratios $b_(i \, zeta)$ do not depend on the entry $e$ being differentiated.

#thm([Lemma 8.1.])[
  (Likelihood and intensity bounds).  #emph[Let $cal(F)_t$ be the natural filtration of a nonexplosive marked path, augmented by an initial $sigma$-field, and let $sans(Q) lt.double sans(P)$ be a change of law up to a finite stopping time $tau$, with density $Z$ there and with intensities $r b$ relative to the reference intensities $r$ conditional on that initial information. For the cost in (8.2), 
#[#set math.equation(numbering: n => "(8.3)")
 $ sans(Q) { cal(J)_(\[ 0 \, tau \]) > A \, med log Z lt.eq B } lt.eq e^(\( B - A \) \/ 2) . $ <score:hellinger-inequality>]

 Consequently, for every fixed $eta > 0$, with arbitrarily high inverse-polynomial probability, 
#[#set math.equation(numbering: n => "(8.4)")
 $ cases(delim: "{", cal(J)_(upright("path")) lt.eq n^eta \, & upright("under a tested forward law") \,, cal(J)_(upright("portion")) lt.eq C N \( \| I \| \) + n^eta \, & upright("under either oriented portion of ") sans(C)_I^(x \, y) \, quad \| I \| gt.eq d_0 .) $ <score:action-bounds>]

 Here $d_0$ is a fixed constant large enough for Equation (7.13). The second assertion is over the tested boundary law followed by the conditional interior. In all these cases the integrated new intensity at any one site on each specified unit-length block is at most $n^eta$ with the same probability convention. These integrated intensities and $cal(J)$ have polynomial fixed-order moments, also after averaging over the boundaries of a conditional interior.]
] <score:hellinger>

#proof[
  Include a possible initial density $z_0 = d sans(Q) \|_(cal(F)_0) \/ d sans(P) \|_(cal(F)_0)$. With bounded integrated rates, the marked point-process likelihood formula #cite(label("Jacod1975")) Theorem 5.1 gives
  $ sqrt(Z) thin e^(cal(J)_(\[ 0 \, tau \]) \/ 2) = sqrt(z_0) product_(s lt.eq tau thin upright("ring")) sqrt(b_(i_s \, zeta_s) \( s \)) exp {- integral_0^tau sum_(i \, zeta) r_(i \, zeta) \( sqrt(b_(i \, zeta)) - 1 \) thin d t} . $
  The product allows zero factors; a mark with $b = 0$ has no mass under $sans(Q)$. The product-exponential following $sqrt(z_0)$ is the stochastic exponential for intensities $r sqrt(b)$ relative to $r$. Its expectation conditional on the initial data is at most one, as follows by integrating the successive conditional waiting and mark densities, also when a mark factor is zero; this is the nonnegative likelihood supermartingale of #cite(label("Jacod1975")) Proposition 4.3. Cauchy–Schwarz gives $sans(E)_(sans(P)) sqrt(z_0) lt.eq 1$. Thus the right side has $sans(P)$ expectation at most one. For general ratios, stop only when the integrated reference, changed, and square-root rates reach a finite level. Let $Y = sqrt(Z) e^(cal(J) \/ 2)$ on ${ Z > 0 }$, with extended values, and set $Y = 0$ on ${ Z = 0 }$. The localized likelihood expressions converge to $Y$ on ${ Z > 0 }$; assigning zero on ${ Z = 0 }$ can only decrease their lower limit. Fatou’s lemma gives $sans(E)_(sans(P)) Y lt.eq 1$. No positivity restriction is imposed on $b$ in this localization. Since $sans(Q) { Z = 0 } = 0$, this expectation bound also makes $cal(J) < oo$ $sans(Q)$-almost surely. On the event in (8.3), $sqrt(Z) e^(- cal(J) \/ 2) lt.eq e^(\( B - A \) \/ 2)$. Multiplying this by $Y$ and integrating under $sans(P)$ proves the inequality.
  For a tested forward law, $log Z lt.eq \( M_(+) + M_(-) \) log n$ by Definition 37. For a conditional portion, (7.13) gives $log Z lt.eq C N \( \| I \| \) + L log n$ outside an arbitrarily small boundary event. Since $N \( \| I \| \) gt.eq c n^beta$, applying (8.3) with these bounds proves (8.4) after increasing $C$.
  Let $C_(i \, H)$ be the number of rings at site $i$ in a unit block $H$, and $Lambda_(i \, H) = integral_H sum_zeta r_(i \, zeta) b_(i \, zeta) thin d t$. The exponential count supermartingale #cite(label("Jacod1975")) Proposition 4.3 gives
  $ sans(E)_(sans(Q)) exp { - C_(i \, H) + \( 1 - e^(- 1) \) Lambda_(i \, H) } lt.eq 1 \, $
  with the conditional version when the boundary is fixed. Ordinary unit counts have every fixed moment bounded; paying a polynomial test density and using the preserved copy marginals shows $C_(i \, H) lt.eq n^(eta \/ 2)$ with arbitrarily high inverse-polynomial probability, simultaneously on any polynomial collection of blocks. The last exponential bound then gives $Lambda_(i \, H) lt.eq n^eta$ with the same precision. Its tail inequality also bounds every moment of $Lambda_(i \, H)$ by a constant times a higher moment of $1 + C_(i \, H)$. The conditional assertions here are first averaged over the boundary law. Finally, $\( sqrt(b) - 1 \)^2 lt.eq b + 1$ bounds $cal(J)$ by the sum of the new and ordinary integrated intensities. The moment assertions follow, using the polynomial count moments from Lemma 40. ◻
]

For later use we make the unprojected size and reversal precise. At a ring of site $i in e = { i \, j }$, the order-$h gt.eq 1$ coefficient of (7.16) is

#[#set math.equation(numbering: n => "(8.5)")
 $ gamma_(h \, e) \( t \, i \, zeta \) = X_j \( t - \)^h \( zeta - t_i \( X \( t - \) \) \) \( - t_i \( X \( t - \) \) \)^(h - 1) . $ <score:ring-coefficient>]

It is bounded by $2$, and $sum_zeta r_(i \, zeta) gamma_(h \, e) \( t \, i \, zeta \) = 0$.

#thm([Lemma 8.2.])[
  (Raw coefficient size and reversal).  #emph[For every fixed $1 lt.eq p < oo$ and $1 lt.eq l lt.eq K$, under ordinary forward dynamics on an interval of length $d gt.eq 1$, 
#[#set math.equation(numbering: n => "(8.6)")
 $ ∥sup_(t in I) \| ell_(l \, e) \( \[ inf I \, t \] \) \|∥_(L^p) lt.eq C_(p \, K) d^(l \/ 2) . $ <score:martingale-moment>]

 For every marked path the exact likelihood reversal is 
#[#set math.equation(numbering: n => "(8.7)")
 $ frac(L_(I \, e)^arrow.r \( u \), 1 + u q_e \( X_(sup I) \)) = frac(L_(I \, e)^arrow.l \( u \), 1 + u q_e \( X_(inf I) \)) . $ <score:reversal>]

 It follows that, for every fixed $eta > 0$, with arbitrarily high inverse-polynomial probability under tested laws and their resampled marginals, simultaneously over entries and specified tree intervals, 
#[#set math.equation(numbering: n => "(8.8)")
 $ \| ell_(l \, e)^arrow.r \( I \) \| + \| ell_(l \, e)^arrow.l \( I \) \| lt.eq n^eta \| I \|^(l \/ 2) \, #h(2em) 1 lt.eq l lt.eq K . $ <score:raw-high-probability>]

 On a unit-length interval this also holds for partial products, with an arbitrarily small power allowance, when a bounded fixed-order product of earlier coefficients is included.]
] <score:raw-size>

#proof[
  The order-$l$ prefix coefficient is a martingale starting from zero. At a ring its jump is $sum_(h = 1)^l gamma_(h \, e) ell_(l - h \, e) \( \[ inf I \, t \) \)$; the prefix factors are predictable and every $gamma_h$ is centered. The martingale square-function inequality #cite(label("BurkholderDavisGundy1972")) Theorem 1.1, applied at successive ring times, and Hölder’s inequality bound its $L^p$ supremum by a constant times
  $ sum_(h = 1)^l parallel C_(e \, I)^(1 \/ 2) parallel_(L^(2 p)) ∥sup_t \| ell_(l - h \, e) \( \[ inf I \, t \] \) \|∥_(L^(2 p)) \, $
  where $C_(e \, I)$ is the number of rings at the two sites. It is Poisson with mean $2 d$, whose fixed moments are $O \( d^p \)$ for $d gt.eq 1$. Induction in $l$, with the same assertion at the higher moment order $2 p$, proves (8.6).
  Detailed balance for marked paths states that the forward path measure multiplied by its initial stationary mass equals the reversed measure multiplied by its final stationary mass. Apply this once at the base matrix and once using (7.15), and divide. This gives (8.7), including at self-resampling rings. The Taylor coefficients of the two endpoint factors in that identity are bounded through order $K$. Thus the reversed bounds follow from the forward ones. Choose $p$ sufficiently large in (8.6) to pay the polynomial test density, the number of entries and intervals, and the desired inverse-polynomial precision. This proves (8.8); resampling preserves the marginal. On a unit block a fixed-order coefficient is a fixed-degree polynomial in the two-site count, which gives the last assertion in the same way. ◻
]

=== 8.2 The gain from the last ring <the-gain-from-the-last-ring>

The compensator identity will always be used before taking absolute values. If $A_e$ is known before an oriented interval $H$ and all displayed products are integrable, then the last-ring expansion and ordinary centering give the exact identity

#[#set math.equation(numbering: n => "(8.9)")
 $ sans(E)_(sans(Q)) \[ A_e ell_(l \, e) \( H \) \] = sans(E)_(sans(Q)) sum_(h = 1)^l integral_H sum_(i in e \, zeta) A_e ell_(l - h \, e) \( \[ inf H \, t \) \) gamma_(h \, e) \( t \, i \, zeta \) r_(i \, zeta) \( t \) \( b_(i \, zeta) \( t \) - 1 \) thin d t . $ <score:compensation-identity>]

In reversed time the interval notation is interpreted in that orientation. The first step is predictable compensation at rates $r b$ #cite(label("Jacod1975")) Theorem 2.1; subtracting $r$ uses the centering of (8.5). All prefix factors are predictable. A multiplier depending on an unrevealed future path cannot be inserted in this identity; a common external test of that future is already part of the probability $sans(Q)$ and hence of its intensities.

#thm([Lemma 8.3.])[
  (One compensated insertion).  #emph[Let $H$ have length $d gt.eq 1$ within an admissible oriented portion of a checked root. Suppose $v_i \( t \)$ is predictable, $\| v_i \( t \) \| lt.eq 1$, and does not depend on the index $j$ of the other endpoint or on the new mark $zeta$. Define 
$ D_({ i \, j }) \( H \) = integral_H X_j \( t - \) v_i \( t \) sum_zeta r_(i \, zeta) \( b_(i \, zeta) - 1 \) \( zeta - t_i \) thin d t + integral_H X_i \( t - \) v_j \( t \) sum_zeta r_(j \, zeta) \( b_(j \, zeta) - 1 \) \( zeta - t_j \) thin d t . $

 With arbitrarily high inverse-polynomial probability, using the joint boundary-and-interior convention for a bridge portion, 
#[#set math.equation(numbering: n => "(8.10)")
 $ \| D \( H \) \|_2 lt.tilde_beta d^(1 \/ 4) sqrt(cal(J)_H \/ n) \, #h(2em) \| D \( H \) \|_4 lt.tilde_beta d^(5 \/ 16) n^(- 1 \/ 4) sqrt(cal(J)_H) . $ <score:one-insertion-bounds>]

 For an insertion of order $h > 1$, or with bounded predictable weights that may depend on $e$, the same bounds with $d^(1 \/ 2)$ in place of $d^(1 \/ 4)$ and $d^(5 \/ 16)$ hold without using overlap estimates. In particular this version applies on unit blocks to previously accumulated bounded coefficients, with their power allowance included.]
] <score:one-insertion>

#proof[
  For each site write $alpha_i$ for the signed measure in the first integral with $X_j$ omitted. Split it according to $b lt.eq 2$ and $b > 2$. On the first set $\| b - 1 \| lt.eq C \| sqrt(b) - 1 \|$, so Cauchy–Schwarz and $sum_zeta r_(i \, zeta) = 1$ bound the square integral of its absolute density by $C cal(J)_(H \, i)$. On the second set $\| b - 1 \| lt.eq C \( sqrt(b) - 1 \)^2$, so its total variation is at most $C cal(J)_(H \, i)$. On each unit block this variation is also bounded by a constant times the new and ordinary integrated site intensities, hence by $n^eta$ on the event of Lemma 41. If $a_(i k)$ is the sum of the two variations on the $k$th unit block, these facts imply
  #[#set math.equation(numbering: n => "(8.11)")
   $ sum_k a_(i k)^2 lt.eq C n^eta cal(J)_(H \, i) . $ <score:block-masses>]
  In particular the large ratios have been treated by total mass, not by a pointwise square-integrability assertion.
  First suppose all times in $H$ have age at least a fixed multiple of $d$ from the #emph[forward] start of its checked root. Squaring the contribution of a fixed site $i$ and averaging its other endpoint gives the kernel $n^(- 1) sum_j X_j \( t \) X_j \( s \) = rho_2 \( X \( t \) \, X \( s \) \)$. By (7.14), on unit block indices this is bounded by $n^(O \( beta \)) \( 1 + \| k - k' \| \)^(- 1 \/ 2)$. Adjacent blocks use the bound one. The $ell^1$ sum of this kernel over one index is $O \( d^(1 \/ 2) \)$, so
  $ 1 / n sum_j lr(|integral_H X_j thin d alpha_i|)^2 lt.eq n^(O \( beta \)) d^(1 \/ 2) sum_k a_(i k)^2 . $
  Omitting $j = i$ adds at most $n^(- 1) \( sum_k a_(i k) \)^2$, which is absorbed by the right side since $d lt.eq C T$. Summing over the contributing site and dividing by $binom(n, 2)$ gives, using (8.11),
  $ \| D \( H \) \|_2^2 lt.eq frac(n^(O \( beta \)) d^(1 \/ 2), n) sum_i sum_k a_(i k)^2 lt.eq n^(O \( beta \)) d^(1 \/ 2) cal(J)_H \/ n . $
  For the fourth power use the kernel $n^(- 1) sum_j product_(h = 1)^4 X_j \( t_h \) = rho_4 \( X \( t_1 \) \, dots.h \, X \( t_4 \) \)$. The age assumption and (7.14) bound its unit-block kernel by a constant times
  $ n^(O \( beta \)) sum_(1 lt.eq h < h' lt.eq 4) \( 1 + \| k_h - k_(h') \| \)^(- 3 \/ 4) . $
  For each chosen pair the convolution is at most $C d^(1 \/ 4) sum_k a_(i k)^2$; the other two $ell^1$ sums contribute at most $d sum_k a_(i k)^2$. Thus the fourth-power integral is at most $n^(O \( beta \)) d^(5 \/ 4) \( sum_k a_(i k)^2 \)^2$. The omitted-diagonal term is $n^(- 1) \( sum a_(i k) \)^4$ and is again absorbed, since $d^(3 \/ 4) \/ n lt.eq C n^(- 1 \/ 2)$. Now sum over $i$ and divide by $binom(n, 2)$. Since $sum_i cal(J)_(H \, i)^2 lt.eq cal(J)_H^2$, this gives
  $ \| D \( H \) \|_4^4 lt.eq frac(n^(O \( beta \)) d^(5 \/ 4), n) sum_i (sum_k a_(i k)^2)^2 lt.eq n^(O \( beta \)) d^(5 \/ 4) cal(J)_H^2 \/ n . $
  The fourth root is the second bound.
  For a general $H$, partition it into unit blocks near the forward root start and pieces whose lengths grow geometrically and are at most a fixed multiple of their ages. Apply the preceding estimates on each piece. For $gamma = 1 \/ 4$ or $5 \/ 16$, Cauchy–Schwarz gives $sum_j d_j^gamma sqrt(cal(J)_(H_j)) lt.eq C d^gamma sqrt(cal(J)_H)$, because $sum_j d_j^(2 gamma) = O \( d^(2 gamma) \)$. This partition uses the forward age even when the compensation orientation is reversed; it is a deterministic division of the integrals and changes no filtration. Finally, replacing both overlap kernels by one gives the exponent $1 \/ 2$ for either norm. That proof uses only a common upper bound on the absolute block masses, so bounded $e$-dependent predictable weights and higher insertion orders are permitted in this last assertion. ◻
]

=== 8.3 Conditional coefficients and the midpoint identity <conditional-coefficients-and-the-midpoint-identity>

For a node $I = \[ a \, b \]$ with fixed boundaries, keep its descendant weights fixed and define the conditional coefficient series by

#[#set math.equation(numbering: n => "(8.12)")
 $ R_e \( I \; u \) = sans(C)_I^(x \, y) [frac(L_(I \, e)^arrow.r \( u \), 1 + u q_e \( y \))] \, #h(2em) R_(l \, e) \( I \) = \[ u^l \] R_e \( I \; u \) . $ <score:R-definition>]

In particular $R_0 = 1$. Reversal (8.7) and the reversal of the bridge give the same series from the reversed path with endpoint $x$. Write $c_(l \, e)^I = sans(C)_I^(x \, y) \[ ell_(l \, e)^arrow.r \( I \) \]$ for the bridge average of the raw coefficient. Exactly,

#[#set math.equation(numbering: n => "(8.13)")
 $ c_l^I = R_l \( I \) + q_e \( y \) R_(l - 1) \( I \) \, #h(2em) l gt.eq 1 . $ <score:raw-conditional>]

For a reversed raw coefficient its end in this formula is the original start. These definitions keep all descendant weights fixed. Their derivatives are handled separately through (7.17).

At the midpoint $v = \( a + b \) \/ 2$, set $z = X_v$. With $x \, y$ fixed, $z$ has the base midpoint probability (7.12), and the two interiors are independent conditional on $z$. Reversal (8.7) gives the pathwise factorization

$ frac(L_(I \, e)^arrow.r \( u \), 1 + u q_e \( y \)) = \( 1 + u q_e \( z \) \) frac(L_(I^(-) \, e)^arrow.r \( u \), 1 + u q_e \( z \)) frac(L_(I^(+) \, e)^arrow.l \( u \), 1 + u q_e \( z \)) . $

Conditioning the two interiors on $z$ therefore gives the exact identity

#[#set math.equation(numbering: n => "(8.14)")
 $ R_e \( I \; u \) = sum_z pi_I^(x \, y) \( z \) \( 1 + u q_e \( z \) \) R_e \( I^(-) \; u \) R_e \( I^(+) \; u \) . $ <score:midpoint-series>]

Here the right factor is written in its reversed orientation, and the midpoint probability is the fixed base one. The pathwise factorization shows why the endpoint normalizations leave exactly the single factor $1 + u q_e \( z \)$.

For $l gt.eq 2$, taking coefficients and grouping the two raw terms gives

#[#set math.equation(numbering: n => "(8.15)")
 $ R_l \( I \) = sans(E)_(pi_I^(x \, y)) #scale(x: 240%, y: 240%)[\[] c_l^(I^(-)) + c_l^(I^(+) \, arrow.l) + sum_(a + b = l\
a \, b gt.eq 1) R_a \( I^(-) \) R_b \( I^(+) \) + q_e \( z \) sum_(a + b = l - 1\
a \, b gt.eq 1) R_a \( I^(-) \) R_b \( I^(+) \) #scale(x: 240%, y: 240%)[\]] . $ <score:midpoint-coefficient>]

No second or higher midpoint mass coefficient occurs. This cancellation is the reason for retaining the endpoint denominator in (8.12).

The two linear terms and the product terms in this recursion will be estimated differently. For the linear terms, the conditional interior identity gives the vector equalities

#[#set math.equation(numbering: n => "(8.16)")
 $ sans(E)_(pi_I^(x \, y)) c_l^(I^(-)) & = sans(C)_I^(x \, y) \[ ell_l^arrow.r \( I^(-) \) \] \,\
sans(E)_(pi_I^(x \, y)) c_l^(I^(+) \, arrow.l) & = sans(C)_I^(x \, y) \[ ell_l^arrow.l \( I^(+) \) \] . $ <score:raw-before-midpoint-norm>]

These identities integrate the midpoint back out before compensation. The right-hand sides use the parent oriented laws with $x \, y$ fixed and $z$ neither conditioned on nor revealed in advance; the natural path reveals its midpoint state when it reaches that time. We take vector norms only after the compensation identity. The product terms instead use the conditional child $R$ bounds under the tested boundary law followed by the conditional interior. In particular, the estimate of a linear term does not replace the norm of its midpoint average by an average of raw child norms.

Before estimating this recursion we give the raw estimate that is also used for a final block of a tested forward path.

For a node $J$ in an oriented subtree, write $J_(upright("early"))$ and $J_(upright("late"))$ for the children encountered first and second in that orientation. They are $\( J^(-) \, J^(+) \)$ in forward time and $\( J^(+) \, J^(-) \)$ in reversed time; $J^(-) \, J^(+)$ continue to denote the chronological children in the kernel and midpoint identities. In the raw-representation arguments below we suppress the arrows on $ell$ and $c$ when the orientation is fixed. The state $X_(upright("end"))$ in $c_j = R_j + q_e \( X_(upright("end")) \) R_(j - 1)$ is then the boundary state at the end of the relevant interval in that orientation.

#thm([Lemma 8.4.])[
  (Representations after compensating the last score).  #emph[Fix an admissible oriented law $sans(Q)$, its oriented filtration, and any permitted auxiliary-data augmentation. Fix a dyadic subtree $H$ of length $d$ in that oriented portion and an order $1 lt.eq l lt.eq K$. There is a finite family of time-integral vectors $V_alpha^(\( l \)) \( H \)$, chosen from this fixed setup without reference to a subsequent choice of $A$, such that for every vector $A_e$ measurable at the oriented start of $H$ for which the displayed products are integrable, coordinatewise, 
#[#set math.equation(numbering: n => "(8.17)")
 $ sans(E)_(sans(Q)) \[ A_e ell_(l \, e) \( H \) \] = sans(E)_(sans(Q)) [A_e sum_alpha V_(alpha \, e)^(\( l \)) \( H \)] . $ <score:raw-representation>]

 The vectors and $A$ may depend on the same initial information. With arbitrarily high inverse-polynomial probability, using the joint boundary-and-interior convention for a bridge portion, their sum of norms obeys 
#[#set math.equation(numbering: n => "(8.18)")
 $ sum_alpha \| V_alpha^(\( l \)) \( H \) \|_2 & lt.tilde_beta d^(\( l - 1 \) \/ 2 + 1 \/ 4) sqrt(cal(J)_H \/ n) \,\
sum_alpha \| V_alpha^(\( l \)) \( H \) \|_4 & lt.tilde_beta d^(\( l - 1 \) \/ 2 + 5 \/ 16) n^(- 1 \/ 4) sqrt(cal(J)_H) . $ <score:raw-projection-bounds>]

 Thus earlier vector factors can be included by Hölder’s inequality after the identity. This is a representation inside expectation, not a pointwise assertion about the raw coefficient $ell_l \( H \)$.]
] <score:raw-projection>

#proof[
  For $l = 1$, (8.9) is the representation, and Lemma 43 gives both bounds. For $l gt.eq 2$, expand a raw coefficient by the smallest dyadic node containing all its positive-order ring insertions. If all insertions lie in a leaf, keep that leaf term. Otherwise, at that unique node $J$ the term is $ell_(j \, e) \( J_(upright("early")) \) ell_(l - j \, e) \( J_(upright("late")) \)$ for some $1 lt.eq j < l$. This is an exact partition of the ring expansion, including rings carrying Taylor order larger than one.
  On a leaf, expand according to the last ring and its assigned order as in (8.9). The remaining prefix coefficients are predictable and are bounded by a power allowance on this unit block, by Lemma 42. The unit-block conclusion of Lemma 43 applies. At a split of length $y$, the earlier coefficient is known before the later child and is at most $n^eta y^(j \/ 2)$ by (8.8). Apply the inductive representation to the later child, then include this earlier factor by its supremum norm. At any one scale the later children are disjoint and number at most $C d \/ y$. Consequently
  $ sum_(J : thin \| J \| asymp y) sqrt(cal(J)_(J_(upright("late")))) lt.eq C sqrt(\( d \/ y \) cal(J)_H) . $
  For the $L^2$ or $L^4$ bound the power before this summation is $y^(\( l - 1 \) \/ 2 + gamma)$, with $gamma = 1 \/ 4$ or $5 \/ 16$. Relative to the claimed right side, this scale thus has the factor
  $ \( y \/ d \)^(\( l - 2 \) \/ 2 + gamma) . $
  It is geometrically summable for $l gt.eq 2$. The leaf terms cost at most $C sqrt(d cal(J)_H)$ with the respective factor $n^(- 1 \/ 2)$ or $n^(- 1 \/ 4)$, and are also bounded by the claimed expression. All compensations used the expectation identity with the earlier coefficient still predictable. After absolute values, each representation vector is bounded by a fixed polynomial in raw clock counts and prefix coefficients, and in $integral_H sum_(i \, zeta) r_(i \, zeta) \| b_(i \, zeta) - 1 \| lt.eq integral_H sum_(i \, zeta) r_(i \, zeta) b_(i \, zeta) + n \| H \|$. For the sharper representations below, an earlier endpoint projection adds a conditional coefficient with the uniform coarse bound of Lemma 40. That lemma, the intensity moments in Lemma 41, and Hölder’s inequality therefore give polynomial fixed moments for the representation norms, including a fixed number of copies. The conditional exceptional-set rule then applies to each of the polynomially many terms and proves the stated probability formulation. ◻
]

#thm([Proposition 8.5.])[
  (Conditional clock scores and raw representations).  #emph[#emph[(i) Conditional coefficients.] For every deterministic matrix on (7.2), every tested path law, and every node $I$ of length $D$ in its checked roots, the vectors in (8.12) satisfy, with arbitrarily high inverse-polynomial probability over their boundary states, 
#[#set math.equation(numbering: n => "(8.19)")
 $ \| R_l \( I \) \|_oo lt.tilde_beta D^(l \/ 2) \, #h(2em) \| R_l \( I \) \|_2 lt.tilde_beta D^(l \/ 2 - 1) \, #h(2em) \| R_l \( I \) \|_4 lt.tilde_beta D^(l \/ 2 - 1 \/ 2) \, #h(2em) 1 lt.eq l lt.eq K . $ <score:R-basic>]

 Also, 
#[#set math.equation(numbering: n => "(8.20)")
 $ \| R_3 \( I \) \|_1 lt.tilde_beta D^(- 1 \/ 4) \, #h(2em) \| R_l \( I \) \|_1 lt.tilde_beta D^(\( l - 4 \) \/ 2) \, quad 4 lt.eq l lt.eq K . $ <score:R-l1>]

 If $D gt.eq T n^(- 0.005)$, the $L^4$ bound for $R_1$ has the additional factor $n^(- 0.01)$, the $L^2$ bounds for $R_2 \, R_3$ have the additional factor $n^(- 0.001)$, and the $L^1$ bound for $R_4$ has the additional factor $n^(- 0.0007)$. The conclusions hold simultaneously for any polynomial collection of specified nodes and any fixed number of conditional copies, with the same exceptional-set convention.]
  #emph[#emph[(ii) Raw representations.] Fix an admissible oriented law, its oriented filtration, and any permitted auxiliary-data augmentation, as in Lemma 44. Then fix a dyadic subtree $H$ of length $d$ in that portion and an order $1 lt.eq l lt.eq K$. The following representations satisfy (8.17) for every earlier vector $A$ in that lemma’s class, with the representation chosen from this fixed setup before $A$. If $l gt.eq 2$ and $d gt.eq T n^(- 0.02)$, there is a representation for which 
#[#set math.equation(numbering: n => "(8.21)")
 $ sum_alpha \| V_alpha^(\( l \)) \( H \) \|_2 lt.tilde_beta n^(- 0.004) d^(\( l - 1 \) \/ 2 + 1 \/ 4) sqrt(cal(J)_H \/ n) . $ <score:raw-improvement>]

 For every $1 lt.eq l lt.eq K$, there is a representation for which 
#[#set math.equation(numbering: n => "(8.22)")
 $ sum_alpha \| V_alpha^(\( l \)) \( H \) \|_1 lt.tilde_beta max { sqrt(d) \, d^(l \/ 2 - 5 \/ 4) } sqrt(cal(J)_H \/ n) . $ <score:raw-l1-projection>]

 For $l = 4$ and $d gt.eq T n^(- 0.006)$, the latter estimate has the additional factor $n^(- 0.001)$. The two families here may differ from each other and from the family giving the two basic bounds in Lemma 44. These pathwise norm estimates have arbitrarily high inverse-polynomial probability with that lemma’s scope: for a bridge portion the probability is under the tested boundary law followed by the conditional interior. They are not uniform conditional assertions at every fixed boundary pair.]
] <prop:clock-scores>

#proof[
  All conditional estimates in this proof are first established under the tested boundary law followed by its interior sampling. We then use the conditional exceptional-set rule following Lemma 40. The polynomial coefficient and representation moments proved in Lemmas 40 and 44 permit any required stronger working precision. This yields the stated high-probability bounds on conditional expectations, without asserting them for every possible boundary.
  ===== 8.3.1 Order one and its stronger $L^4$ bound. <order-one-and-its-stronger-l4-bound.>
  The infinity bound follows at once by applying (8.8) inside (8.12) and expanding the bounded endpoint denominator. For $R_1$, split instead at a variable $v$ in the middle third of $I$. The pathwise reversal identity gives
  $ R_1 \( I \) = sans(C)_I^(x \, y) #scale(x: 120%, y: 120%)[\[] ell_1^arrow.r \( \[ a \, v \] \) + ell_1^arrow.l \( \[ v \, b \] \) - q_e \( X_v \) #scale(x: 120%, y: 120%)[\]] . $
  Average this identity uniformly over that middle third. Compensating the two ring terms in the parent forward and reversed portions uses bounded deterministic time weights, common for the other-site index. By (8.4) and (8.10) their $L^2$ cost is at most
  $ n^(O \( beta \)) D^(1 \/ 4) sqrt(N \( D \) \/ n) = n^(O \( beta \)) D^(- 1 \/ 2) . $
  For the boundary average $Q_e = \( 3 \/ D \) integral_(a + D \/ 3)^(a + 2 D \/ 3) q_e \( X_v \) thin d v$, the exact edge sum $sum_(i < j) q_(i j) \( X_v \) q_(i j) \( X_w \) = 1 / 2 \( n^2 rho_2 \( X_v \, X_w \)^2 - n \)$ gives
  $ \| Q \|_2^2 lt.eq C / D^2 integral_(a + D \/ 3)^(a + 2 D \/ 3) integral_(a + D \/ 3)^(a + 2 D \/ 3) rho_2 \( X_v \, X_w \)^2 thin d v thin d w lt.tilde_beta D^(- 1) . $
  The last step uses the square of (7.14), whose kernel is $\( 1 + \| v - w \| \)^(- 1)$ on this middle third, and absorbs $log \( 2 + D \)$. This proves the $L^2$ bound for $R_1$. Interpolation with its infinity bound gives the ordinary $L^4$ estimate.
  We will retain a stronger intermediate $L^4$ improvement. Its ring terms can be bounded directly by the second estimate in (8.10), giving
  $ n^(O \( beta \)) D^(5 \/ 16) n^(- 1 \/ 4) sqrt(N \( D \)) = n^(1 \/ 4 + O \( beta \)) D^(- 7 \/ 16) . $
  If $D gt.eq T n^(- 0.03)$ this is at most $n^(- 0.02 + O \( beta \))$. The boundary term has infinity norm at most one and $L^2$ norm $lt.tilde_beta D^(- 1 \/ 2)$, so its $L^4$ norm is even smaller. Hence
  #[#set math.equation(numbering: n => "(8.23)")
   $ \| R_1 \( I \) \|_4 lt.tilde_beta n^(- 0.02) \, #h(2em) D gt.eq T n^(- 0.03) . $ <score:R1-intermediate>]
  For bounded $D$, where the conditional prefix estimate was not invoked, Lemma 42 gives all the ordinary bounds after a constant change.
  ===== 8.3.2 Joint induction for the basic bounds and the sharper raw $L^2$ representation. <joint-induction-for-the-basic-bounds-and-the-sharper-raw-l2-representation.>
  We next prove the $L^2$ and $L^4$ bounds by induction on $l$, together with (8.21). Assume (8.19) in orders below $l gt.eq 2$. To prove the raw improvement when $d gt.eq T n^(- 0.02)$, keep the basic representation of Lemma 44 on split scales $y < d n^(- 0.02)$. The scale factor in that lemma’s proof is at most $\( y \/ d \)^(1 \/ 4)$, so these scales gain $n^(- 0.005)$. Their leaf remainder has a still larger gain.
  On a larger split, project the earlier raw coefficient #emph[before] compensating anything in the later child. In the expectation at this stage, the remaining raw insertions are outside the earlier child. By Lemma 38, for any such exterior-measurable integrand $H_e$ the exact identity is
  #[#set math.equation(numbering: n => "(8.24)")
   $ sans(E)_(sans(Q)) \[ ell_(j \, e) \( J_(upright("early")) \) H_e \] = sans(E)_(sans(Q)) \[ c_(j \, e)^(J_(upright("early"))) \( X_(partial J_(upright("early"))) \) H_e \] . $ <score:earlier-projection>]
  For a prefix law this follows by first conditioning on the full exterior and then taking the prefix marginal. The new factor is known at the start of $J_(upright("late"))$. Its $L^4$ norm is at most $n^(O \( beta \)) y^(j \/ 2 - 1 \/ 2)$ by the induction hypothesis and (8.13); for $j = 1$ the term $q_e R_0$ is simply bounded by one. Apply the basic $L^4$ representation to the later child and pair these factors in $L^2$. Compared with the basic split $L^2$ estimate the gain is
  $ n^(1 \/ 4) y^(- 7 \/ 16) . $
  Indeed the new power of $y$ is $j \/ 2 - 1 \/ 2 + \( l - j - 1 \) \/ 2 + 5 \/ 16 = l \/ 2 - 11 \/ 16$, while the old one is $l \/ 2 - 1 \/ 4$. Here $y gt.eq d n^(- 0.02) gt.eq T n^(- 0.04)$, so the last ratio is at most $n^(- 0.024 + o \( 1 \))$. Summing these scales and the smaller scales proves (8.21), with ample room for the stated exponent. The identity (8.24) was applied while the later coefficient was still raw. It is not applied to a drift from an earlier compensation, which could retain the earlier interior in its intensities.
  Consider now (8.15). For each linear raw term, use (8.16) and apply Lemma 44 on the corresponding half in the #emph[parent] oriented filtration with just $x \, y$ fixed. After the compensation identity, use the triangle inequality and the pathwise norm bounds. The action bound for that parent portion is $cal(J) lt.tilde_beta N \( D \)$, so its $L^2$ cost is
  $ n^(O \( beta \)) D^(\( l - 1 \) \/ 2 + 1 \/ 4) sqrt(N \( D \) \/ n) = n^(O \( beta \)) D^(l \/ 2 - 1) . $
  For the product terms in (8.15), the induction hypothesis and Hölder give $\| R_a R_b \|_2 lt.eq \| R_a \|_4 \| R_b \|_4 lt.tilde_beta D^(\( a + b \) \/ 2 - 1)$. The terms with $q_e$ have the still smaller exponent $\( l - 1 \) \/ 2 - 1$. Using the conditional exceptional-set rule proves the $L^2$ bound at order $l$. Interpolating it with the infinity bound proves its $L^4$ bound.
  For clarity we track the low-order margins needed below. When $D gt.eq T n^(- 0.019)$, a half has length at least $T n^(- 0.02)$ for large $n$. Use (8.21) on the two raw order-two terms. Its product term uses (8.23) on both children. Thus
  #[#set math.equation(numbering: n => "(8.25)")
   $ \| R_2 \( I \) \|_2 lt.tilde_beta n^(- 0.004) \, #h(2em) \| R_2 \( I \) \|_4 lt.tilde_beta n^(- 0.002) D^(1 \/ 2) \, #h(2em) D gt.eq T n^(- 0.019) \, $ <score:R2-intermediate>]
  where the second bound follows by interpolation. Similarly, if $D gt.eq T n^(- 0.018)$, the raw order-three terms use (8.21); their product terms use (8.23) and (8.25) on the children. The terms with $q_e$ have an additional factor $D^(- 1 \/ 2)$ relative to the target bound. This gives
  #[#set math.equation(numbering: n => "(8.26)")
   $ \| R_3 \( I \) \|_2 lt.tilde_beta n^(- 0.0015) D^(1 \/ 2) \, #h(2em) D gt.eq T n^(- 0.018) . $ <score:R3-intermediate>]
  These deductions use the induction hypothesis at strictly smaller orders, so the proof of (8.19) and of these improvements is complete.
  ===== 8.3.3 The raw $L^1$ representation. <the-raw-l1-representation.>
  With the basic conditional bounds established, we prove (8.22) by induction on $l$. In every split of the smallest-node decomposition, first apply (8.24). In the term $R_j$ of $c_j = R_j + q_e R_(j - 1)$, use its $L^2$ bound $y^(j \/ 2 - 1)$ and the basic later-child $L^2$ representation. The power before the summation at scale $y$ is $y^(l \/ 2 - 5 \/ 4)$. The term $q_e R_(j - 1)$ has an extra $y^(- 1 \/ 2)$ when $j gt.eq 2$ and is bounded the same way. Summing the square roots of the actions at this scale contributes $sqrt(d \/ y)$. Thus the sum over scales is bounded by
  $ C sqrt(d) sum_(y lt.eq d\
y med upright("dyadic")) y^(l \/ 2 - 7 \/ 4) sqrt(cal(J)_H \/ n) lt.eq C max { sqrt(d) \, d^(l \/ 2 - 5 \/ 4) } sqrt(cal(J)_H \/ n) \, $
  with a logarithm allowed at an equality of exponents.
  When $j = 1$, the remaining term in $c_1$ is $q_e$ alone. It is known before the later child. Use (8.22) inductively for the later order $l - 1$; order one follows from the $L^2$ estimate in Lemma 43. Its scale sum is at most
  $ C sqrt(d) max { 1 \, d^(l \/ 2 - 9 \/ 4) } sqrt(cal(J)_H \/ n) \, $
  which is no larger than the claimed expression. Leaf terms cost $C sqrt(d cal(J)_H \/ n)$ as in Lemma 44. This proves the ordinary bound at every order. Throughout, the earlier conditional coefficient is left inside expectation until the later compensation is performed, where it is predictable.
  At order four the leading scale contribution, divided by its value at $y = d$, is $\( y \/ d \)^(1 \/ 4)$. If $y < d n^(- 0.01)$ this gains $n^(- 0.0025)$. If $y gt.eq d n^(- 0.01)$ and $d gt.eq T n^(- 0.006)$, then $y gt.eq T n^(- 0.016)$. For an earlier order $j = 2$ or $3$, its $R_j$ term has the improved $L^2$ bound (8.25) or (8.26) on that child. Its $q_e R_(j - 1)$ term has the extra $y^(- 1 \/ 2)$ just noted. For $j = 1$ with its $R_1$ term, the later order is three, and (8.21) applies there. Constant halves are absorbed by the slack in these thresholds. Finally the leaf and $q_e$-alone branches cost only $O \( sqrt(d) \)$ in place of $d^(3 \/ 4)$. Each case gains at least $n^(- 0.001 + O \( beta \))$. This proves the additional factor in (8.22).
  ===== 8.3.4 Conditional $L^1$ bounds. <conditional-l1-bounds.>
  Apply the $L^1$ representation to each raw term in (8.15), using the order of conditioning in (8.16). Since
  #[#set math.equation(numbering: n => "(8.27)")
   $ sqrt(N \( D \) \/ n) = n^(beta \/ 2) D^(- 3 \/ 4) \, $ <score:node-action-scale>]
  the two raw order-three terms are $lt.tilde_beta D^(- 1 \/ 4)$, and raw order $l gt.eq 4$ is $lt.tilde_beta D^(\( l - 4 \) \/ 2)$. For the product terms use the two $L^2$ estimates in (8.19). At order three they cost at most $D^(- 1 \/ 2)$ (and the term with $q_e$ at most $D^(- 1)$); at order $l gt.eq 4$ they cost at most $D^(\( l - 4 \) \/ 2)$, with an extra $D^(- 1 \/ 2)$ in the terms containing $q_e$. This proves (8.20).
  If $D gt.eq T n^(- 0.005)$, a half satisfies the threshold for the improved order-four representation. In its product terms, $R_1 R_3$ uses the improved $L^2$ bound for $R_3$, $R_2 R_2$ uses that for $R_2$, and the terms with $q_e$ already have the extra $D^(- 1 \/ 2)$. The claimed factor $n^(- 0.0007)$ follows. The stated weaker late factors for $R_1 \, R_2 \, R_3$ follow immediately from (8.23)–(8.26). The conditional exceptional-set rule and a union over the specified nodes and fixed number of copies complete the proof. ◻
]

The representations in Lemma 44 and Proposition 45(ii) also apply to a last differentiated root of a tested forward path. Each is used for its respective norm bound. In that use (8.4) gives $sqrt(cal(J)_H) lt.eq n^eta$ after adjusting $eta$. Earlier root coefficients can first be conditioned on their endpoints by (8.24); these endpoints are then in the past of the last root. This is the form used in the replacement argument.

== 9 Replacement and functional universality <sec:replacement>

We now transfer the Gaussian limit to Rademacher couplings. The comparison uses the spin autocorrelations themselves. Its principal input is the averaged clock-score estimate of Proposition 45; the remaining point is to differentiate every survival and failure probability in the history construction. Conditional copies of a checked path provide these derivatives while preserving the probability laws to which the score estimates apply.

#thm([Proposition 9.1.])[
  (Transfer to Rademacher disorder).  #emph[For the Rademacher coupling law, 
$ "Law"_(upright("Rad")) #scale(x: 120%, y: 120%)[\(] A_(n \, J) \, B_(n \, J) #scale(x: 120%, y: 120%)[\)] arrow.r.double "Law"_g #scale(x: 120%, y: 120%)[\(] A_g \, B_g #scale(x: 120%, y: 120%)[\)] $

 in $C_(upright("loc")) \( \( 0 \, oo \) \) times C_(upright("loc")) \( \( 0 \, oo \)^2 \)$, where $\( A_g \, B_g \)$ is the Gaussian limit obtained by combining Proposition 25 with the identification of the entrance family in Theorem 27. In particular the entrance family and the semigroup in this limit are the same $h_s^g$ and $S_t^g = exp \( - t c_(*) H_g \)$ as in the Gaussian case, and the finite time scale is $T = T_n = n^(2 \/ 3)$.]
] <prop:universality>

Throughout this section a length $D$ of a path interval is in site-clock units. All query legs have lengths in $\[ c T \, C T \]$, where $0 < c < C < oo$ are fixed by a compact set of query times. We put $K = 24$. The small parameter $beta > 0$ and the convention $lt.tilde_beta$ are those of the preceding two sections. Constants in an exponent $O \( beta \)$ will depend on $K \, c \, C$, but not on the number of conditional-copy generations introduced below.

=== 9.1 Derivatives of tested histories <derivatives-of-tested-histories>

We first state the derivative estimate in the form needed for smooth tests of several traces. Let $e = { i \, j }$, $q_e \( x \) = x_i x_j$, $macron(q)_e = mu q_e$, and $macron(q) = \( macron(q)_e \)_e$. Add $theta.alt$ to the interaction coefficient $J_(i j) \/ sqrt(n)$ and set $u = tanh theta.alt$. For a checked full history or prefix $alpha$ of Definition 37, define the unnormalized checked integral

#[#set math.equation(numbering: n => "(9.1)")
 $ Z_(alpha \, e) \( u \) = bb(E)_(alpha \, e \, u) [v_alpha product_(I in  S_alpha) w_(I \, e) \( u \) product_(I in  F_alpha) \( 1 - w_(I \, e) \( u \) \)] . $ <repl:tested-integral>]

Here $bb(E)_(alpha \, e \, u)$ is ordinary dynamics on the prescribed full history or prefix, with uniform or perturbed stationary initialization as specified by $alpha$. The set $ S_alpha$ consists of its included survival checks, and $ F_alpha$ is empty or consists of its specified first failure. The nonnegative function $v_alpha$ depends only on the designated initial, leg, and forest endpoints; it is independent of $u$ and common to every $e$. Write $z_alpha = Z_(alpha \, e) \( 0 \)$, which does not depend on $e$. When $z_alpha$ satisfies the inverse-polynomial lower bound in Definition 37, normalizing this base integral gives the tested path law. A product of such integrals always uses independent histories; the external tests factor separately across them.

For a vector indexed by $e$, the norms $\| dot.op \|_p$ use uniform probability on the $binom(n, 2)$ edges, as in Proposition 45. Coefficients $\[ u^j \]$ below are at $u = 0$. The distinction between coefficients and derivatives costs constants depending only on $K$.

#thm([Lemma 9.2.])[
  (Averaged derivatives of histories).  #emph[There are constants $a > 0$ and $C_K < oo$ with the following property for all sufficiently small fixed $beta > 0$. Fix $A \, B < oo$, at most $K$ histories of the form (9.1), and integers $j_alpha gt.eq 0$ with $1 lt.eq k = sum_alpha j_alpha lt.eq K$. Suppose $0 lt.eq v_alpha lt.eq n^B$. On the deterministic static support of Lemma 33, put 
$ D_e = product_alpha \[ u^(j_alpha) \] Z_(alpha \, e) \( u \) . $

 Then, uniformly in the selected histories, 
#[#set math.equation(numbering: n => "(9.2)")
 $ \|  D \|_1 & lt.eq C (product_alpha z_alpha) cases(delim: "{", n^(- a + C_K beta) \, & 1 lt.eq k lt.eq 4 \,, n^(C_K beta) T^(\( k - 4 \) \/ 2) \, & 5 lt.eq k lt.eq K \,) + n^(- A) \,\
\|  D \|_oo & lt.eq C n^(C_K beta) T^(k \/ 2) product_alpha z_alpha + n^(- A) . $ <repl:averaged-history>]

 The constant $C$ and the threshold for $n$ may depend on $A \, B$ and on the fixed rectangles. The exponent constant $C_K$ is independent of these precision parameters and of $beta$. The same estimates hold for specified derivatives in $theta.alt$ in place of the coefficients in $u$. Signed tests are covered by applying the statement to their positive and negative parts.]
] <repl:history-derivatives>

#proof[
  The additive precision in the lemma is useful for very small tested masses. To prove it, first suppose each $z_alpha gt.eq n^(- M)$ for a fixed $M$. Normalize each integral by $z_alpha$ and use the tested probability law. The estimates below then have the factor $product_alpha z_alpha$. All exceptional contributions may be made smaller than $n^(- A')$ for an arbitrary fixed $A'$ by the precision convention in Definition 37 and Proposition 45. If some $z_alpha < n^(- M)$, Lemma 40 and the polynomial path moments bound its unnormalized coefficients by $n^(C \( K \, B \)) z_alpha$. Choosing $M$ after $A$ discards all such terms at cost $n^(- A)$. We shall use this reduction throughout the proof.
  ===== 9.1.1 Coefficients with fixed survival and failure weights. <coefficients-with-fixed-survival-and-failure-weights.>
  We start with the terms in which no $w_I$ is differentiated. Recall from Proposition 45 that, for a node of length $D$,
  #[#set math.equation(numbering: n => "(9.3)")
   $ \| R_l \( D \) \|_oo & lt.tilde_beta D^(l \/ 2) \, & \| R_l \( D \) \|_2 & lt.tilde_beta D^(l \/ 2 - 1) \, & \| R_l \( D \) \|_4 & lt.tilde_beta D^(l \/ 2 - 1 \/ 2) \,\
\| R_3 \( D \) \|_1 & lt.tilde_beta D^(- 1 \/ 4) \, & \| R_l \( D \) \|_1 & lt.tilde_beta D^(\( l - 4 \) \/ 2) quad \( l gt.eq 4 \) . $ <repl:score-table>]
  When $D gt.eq T n^(- 0.005)$, the $L^4$ bound for $R_1$, the $L^2$ bounds for $R_2 \, R_3$, and the $L^1$ bound for $R_4$ have additional factors $n^(- 0.01) \, n^(- 0.001) \, n^(- 0.0007)$, respectively. The notation in (9.3) records the length, with the node and its fixed endpoints understood.
  For a last raw coefficient of order $l$ in a forward tested history, the compensation representations of Lemma 44 and Proposition 45(ii), with $cal(J)_I lt.tilde_beta 1$ by (8.4), give the following costs on an interval of length $d$:
  #[#set math.equation(numbering: n => "(9.4)")
   $ upright("edge norm") & upright("cost after the compensation identity")\
L^2 & n^(- 1 \/ 2) d^(l \/ 2 - 1 \/ 4)\
L^4 & n^(- 1 \/ 4) d^(l \/ 2 - 3 \/ 16)\
L^1 & n^(- 1 \/ 2) max \( d^(1 \/ 2) \, d^(l \/ 2 - 5 \/ 4) \) . $ <repl:forward-costs>]
  Each line allows a factor $n^(O \( beta \))$. These are estimates for the integrands in the representation after taking the compensator, with earlier measurable factors kept inside the expectation. They do not estimate the expected absolute value of an unprojected score. The representations used for different lines or their improvements may be different; the table does not assert simultaneous bounds on one family of vectors. The $L^2$ cost gains $n^(- 0.004)$ for $l gt.eq 2$ and $d gt.eq T n^(- 0.02)$, and the $L^1$ cost at order four gains $n^(- 0.001)$ for $d gt.eq T n^(- 0.006)$.
  Stationary initialization contributes
  $ frac(1 + u q_e \( X_0 \), 1 + u macron(q)_e) . $
  We need a gain when these are the only differentiated factors. If $p$ is a nonnegative stationary initial density with $mu p = 1$ and $parallel p parallel_oo lt.eq n^(C_0)$, then the exact replica identity is
  #[#set math.equation(numbering: n => "(9.5)")
   $ 1 / binom(n, 2) sum_e mu \[ p q_e \]^2 = frac(n mu^(⊗ 2) \[ p \( X \) p \( X' \) rho_2 \( X \, X' \)^2 \] - 1, n - 1) lt.eq C n^(4 beta) T^(- 1) + n^(- A') $ <repl:initial-overlap>]
  for every fixed $A'$. Indeed choose the first dyadic $d_compose gt.eq c T$, so $d_compose lt.eq 2 c T$, $r_2 \( d_compose \) lt.eq c^(- 1 \/ 2) r_2 \( T \)$, and $a_2 \( d_compose \) gt.eq c_1 n^(3 beta)$. This scale is among the query scales in Lemma 33. Split at $\| rho_2 \| = r_2 \( d_compose \)$; the complementary probability is $exp \( - c n^(3 beta) \)$, which pays $parallel p parallel_oo^2$. This is the weighted replica identity used in the stationary comparison #cite(label("FUA")) Section 8. In particular
  #[#set math.equation(numbering: n => "(9.6)")
   $ \| macron(q) \|_2 lt.tilde_beta T^(- 1 \/ 2) \, #h(2em) \| macron(q) \|_4 lt.tilde_beta T^(- 1 \/ 4) \, #h(2em) \| macron(q) \|_oo lt.eq 1 . $ <repl:stationary-factor>]
  The normalized initial marginal of a tested stationary history is such a $p$: its density is at most $parallel v_alpha parallel_oo \/ z_alpha$. The coefficient of positive order $j$ in the initialization factor is $\( - macron(q)_e \)^j + q_e \( X_0 \) \( - macron(q)_e \)^(j - 1)$. A numerator supplies at most one $q_e \( X_0 \)$ on each history. Thus if all positive orders come from initialization, at least one factor is either $macron(q)$ or the integrated vector $mu \[ p q_e \]$; (9.5) and boundedness of the other factors give a fixed power saving.
  Suppose now a raw clock likelihood has a positive order. Each path is a forest with $O \( log n \)$ roots, or consists of the one or two complete legs. Chronologically earlier roots have lengths at least a constant times later ones. Independent paths can be interleaved preserving this property: merge their lists in decreasing order of the greatest remaining root length, which is comparable to the current root length on each list. Project every differentiated root preceding the last such root onto its endpoints. The conditional coefficient is
  $ c_l^I = R_l \( I \) + q_e \( X_(sup I) \) R_(l - 1) \( I \) \, #h(2em) R_0 = 1 \, $
  by (8.13). This projection is within the expectation, using Lemma 38; the endpoint factors of preceding roots are measurable before the last root. After expanding their two monomials, all initialization coefficients can therefore be bounded by one in this calculation.
  If these preceding roots supply no positive-order $R$ factor, the last root, of order $l lt.eq k$ and length $d lt.eq C T$, uses the $L^1$ line of (9.4). Its first term is $O \( n^(- 1 \/ 6) \)$. Since $T^(3 \/ 4) = sqrt(n)$, its second term is at most $C T^(\( l - 4 \) \/ 2)$ when $l gt.eq 3$; when $l lt.eq 2$ it is at most $T^(- 3 \/ 4)$, because $d gt.eq 1$. For $l < 4$ there is a fixed power saving. Put
  $ epsilon_0 = 10^(- 4) . $
  For $l = 4$ the bound saves $n^(- 3 epsilon_0 \/ 4)$ if $d lt.eq T n^(- epsilon_0)$, while the late $L^1$ improvement saves $n^(- 0.001)$ on the remaining range. This proves the required bounds for these terms.
  Otherwise, let $p$ be the total order in the preceding positive-order $R$ factors and $D$ their greatest length. Use the $L^2$ bound on one factor of length $D$, the supremum bound on the other preceding factors, and the $L^2$ line of (9.4) for the last order $l$ and length $d$. The result is
  #[#set math.equation(numbering: n => "(9.7)")
   $ n^(O \( beta \)) D^(p \/ 2 - 1) d^(l \/ 2 - 1 \/ 4) T^(- 3 \/ 4) \, #h(2em) d lt.eq C D \, #h(2em) p + l lt.eq k . $ <repl:unmarked-product>]
  For $p + l < 4$ this has a fixed power saving. For $p + l > 4$ it is bounded by $n^(O \( beta \)) T^(\( p + l - 4 \) \/ 2)$. To check both assertions when $p = 1$, write the length factor as $\( d \/ D \)^(1 \/ 2) d^(l \/ 2 - 3 \/ 4) T^(- 3 \/ 4)$; when $l = 1$ it is even smaller, and otherwise its power of $d$ is positive.
  Only $p + l = k = 4$ is a borderline case. Write $D = T x$, $d = T y$ with $y lt.eq C x$. Apart from $n^(O \( beta \))$, the three possible factors in (9.7) are
  $ \( p \, l \) & upright("factor")\
\( 1 \, 3 \) & \( y \/ x \)^(1 \/ 2) y^(3 \/ 4)\
\( 2 \, 2 \) & y^(3 \/ 4)\
\( 3 \, 1 \) & x^(1 \/ 2) y^(1 \/ 4) . $
  If $D$ or $d$ is at most $T n^(- epsilon_0)$, these bounds save at least $n^(- epsilon_0 \/ 4)$. Otherwise every contributing earlier root also has length at least a constant times $T n^(- epsilon_0)$. If $l gt.eq 2$, the late $L^2$ improvement in (9.4) applies. If $l = 1$ and a preceding order is two or three, choose that factor for the $L^2$ bound and use its $n^(- 0.001)$ improvement. Using its length in place of the greatest length costs at most $n^(epsilon_0 \/ 2)$, since all those lengths lie between a constant times $T n^(- epsilon_0)$ and $C T$. Finally, if the preceding orders are $\( 1 \, 1 \, 1 \)$, apply $L^4$ to all four factors. The three $R_1$ factors have their late improvements, and the last factor is at most $n^(O \( beta \)) T^(5 \/ 16) n^(- 1 \/ 4) = n^(- 1 \/ 24 + O \( beta \))$. These are fixed power savings in all cases. The $O \( log n \)^K$ choices of roots are absorbed into $n^(O \( beta \))$. This proves (9.2) for terms with fixed cutoff weights.
  ===== 9.1.2 The exact expansion at a differentiated cutoff. <the-exact-expansion-at-a-differentiated-cutoff.>
  For a node $I = \[ a \, b \]$, use the pre-density $macron(k)_I$ and conditional interior law $sans(C)_I^(x \, y)$ from Lemma 38. For the perturbation at $e$, put
  $ H_(I \, e) \( u \) = frac(macron(k)_(I \, e) \( u \), macron(k)_I) \, quad H_(I \, e) \( 0 \) = 1 \, #h(2em) V_(I \, e)^(+) \( u \) = frac(w_(I \, e) \( u \), w_I) \, quad V_(I \, e)^(-) \( u \) = frac(1 - w_(I \, e) \( u \), 1 - w_I) . $
  All denominators are positive. Write $W_N^(+) = W_N$ and $W_N^(-) = 1 - W_N$. For $j gt.eq 1$, the scalar chain rule gives
  #[#set math.equation(numbering: n => "(9.8)")
   $ \[ u^j \] V_(I \, e)^sigma \( u \) & = sum_(ell = 1)^j frac(\( W_(N_I)^sigma \)^(\( ell \)) \( log macron(k)_I \), ell ! thin W_(N_I)^sigma \( log macron(k)_I \)) sum_(a_1 + dots.h.c + a_ell = j\
a_h gt.eq 1) product_(h = 1)^ell b_(I \, e \, a_h) \,\
b_(I \, e \, a) & := \[ u^a \] log H_(I \, e) \( u \)\
 & = sum_(v = 1)^a frac(\( - 1 \)^(v + 1), v) sum_(d_1 + dots.h.c + d_v = a\
d_h gt.eq 1) product_(h = 1)^v \[ u^(d_h) \] H_(I \, e) \( u \) \, #h(2em) sigma in { + \, - } . $ <repl:cutoff-chain>]
  Thus a positive-order cutoff coefficient supplies one positive-order derivative ratio of $W_N^sigma$ and a product of positive-order pre-density coefficients whose orders sum to its assigned order. We call this occurrence of a derivative ratio a #emph[cutoff mark] at $I$.
  The pre-density ratio has the exact representation
  #[#set math.equation(numbering: n => "(9.9)")
   $ H_(I \, e) \( u \) = \( 1 + u macron(q)_e \) thin sans(C)_I^(x \, y) [frac(L_(I \, e) \( u \), 1 + u q_e \( y \)) product_(J subset.neq I\
J upright(" a checked node")) V_(J \, e)^(+) \( u \)] . $ <repl:pre-density-copy>]
  Indeed, the perturbed stationary probability is $mu_u \( y \) = mu \( y \) \( 1 + u q_e \( y \) \) \/ \( 1 + u macron(q)_e \)$. Dividing the perturbed pre-truncation transition mass by its base value gives the conditional expectation of $L_(I \, e) \( u \) product_(J subset.neq I) V_(J \, e)^(+) \( u \)$. The further factor $mu \( y \) \/ mu_u \( y \)$ gives (9.9); see also Equation (7.17). It is essential here that $macron(k)_I$ is a density with respect to the normalized stationary probability.
  Each product of coefficients of $H_(I \, e)$ in (9.8) is represented using independent interiors with law $sans(C)_I^(x \, y)$ conditional on the same endpoints. Recursively do the same for every positive-order descendant cutoff coefficient in (9.9). Given all already sampled paths and the endpoints of a new copy, its interior is sampled independently with this law. Ancestor and exterior factors depend only on data outside the copied interior. By Lemma 38, replacing that interior in the full tested history preserves its law. This remains true for a copy inside a copy by iteration. In particular the marginal estimates for each copy are those for a base tested path, averaged over its endpoints; no pointwise assertion for arbitrary endpoints is being made.
  There is a useful order invariant in this expansion. Assign to each coefficient slot its positive Taylor order. Formula (9.8) splits an order into positive orders with the same sum, and expanding a slot by (9.9) has the same property. The total order in all unexpanded slots, raw likelihood slots, and endpoint or $macron(q)_e$ factors is therefore at most $k$ at every stage. Cutoff marks record transferred orders; they do not add to this sum. There may be a long chain of cutoff marks carrying a single order.
  A second invariant gives a projected factor when expansion terminates. For a positive-order pre-density slot of order $r$ whose descendants receive no positive cutoff order, keep the endpoint denominator together with the conditional likelihood. Its coefficient is exactly
  #[#set math.equation(numbering: n => "(9.10)")
   $ \[ u^r \] \( 1 + u macron(q)_e \) R_e \( I \; u \) = R_r \( I \) + macron(q)_e R_(r - 1) \( I \) . $ <repl:terminal-mark>]
  Each summand contains a positive-order $R_l \( I \)$, or the order-one factor $macron(q)_e$ (when $r = 1$ the second summand is $macron(q)_e$ itself). Induction from terminal slots shows that every terminal branch descending from a cutoff mark contributes a positive-order conditional coefficient or an $macron(q)_e$ factor. The endpoint denominator in (9.10) is never estimated separately. By (9.6), $macron(q)_e$ can be treated as an $R_1$ factor of length $T$: it satisfies all the corresponding bounds in (9.3), including the late $L^4$ improvement.
  ===== 9.1.3 Summation over cutoff marks and termination of the expansion. <summation-over-cutoff-marks-and-termination-of-the-expansion.>
  Let $lambda_I = 1 - w_I$ for a survival cutoff mark and $lambda_I = 1$ for a failure cutoff mark. For any fixed $eta > 0$, Lemma 34 gives, outside an arbitrarily small inverse-polynomial contribution,
  #[#set math.equation(numbering: n => "(9.11)")
   $ lr(|frac(\( W_(N_I)^sigma \)^(\( ell \)) \( log macron(k)_I \), ell ! thin W_(N_I)^sigma \( log macron(k)_I \))|) lt.eq C n^eta lambda_I / N_I \, #h(2em) N_I = n^beta \( T \/ \| I \| \)^(3 \/ 2) . $ <repl:mark-gain>]
  For survival this estimate is used on $w_I gt.eq n^(- L)$. The discarded event $w_I < n^(- L)$ is paid from its included base survival factor, with $L$ chosen arbitrarily large. For failure the estimate holds without this restriction. The global derivative-ratio bounds of Lemma 34 control exceptional contributions.
  Here is a precise way to sum the choices of nodes in (9.11). On a normalized tested history with mass $z_alpha gt.eq n^(- M)$ and test bounded by $n^B$, put $H = sum_(I in  S_alpha) \( 1 - w_I \)$. Since $product_I w_I lt.eq e^(- H)$,
  $ bb(P)_(upright("test")) { H > h } lt.eq n^(M + B) e^(- h) . $
  One possible failure adds at most one to this hazard sum. The same statement holds for the marginal of every conditional copy, by its law-preserving construction. To make these statements simultaneous, for each deterministic prefix of at most $P + K$ choices of nodes carrying cutoff marks, sample the possible next copies conditional on that prefix. All continuations of a prefix share its already sampled paths. There are $n^(O_K \( P \))$ prefixes for fixed $P$. The arbitrary precision convention permits the hazard and moment bounds to hold for all of them simultaneously. This union uses the joint copy law and the marginal estimates for each indexed path.
  All expectation and compensator identities used for this summation are established in their stated filtrations before restriction to the simultaneous event. At a fixed sampled prefix, let $cal(I) eq.not diameter$ be the eligible next nodes on one shared path. For each $I$, let $B_I gt.eq 0$ bound the absolute value of the resulting continuation integrand or its edge norm on the common sampled tree, including all later factors and gains but excluding the factor $C n^eta lambda_I \/ N_I$ used to bound the current mark ratio. The bound $B_I$ may depend on later sampled data. On this common realization,
  $ sum_(I in cal(I)) lambda_I / N_I B_I lt.eq (sum_(I in cal(I)) lambda_I) sup_(I in cal(I)) B_I / N_I . $
  On the simultaneous event, the parenthesis is at most $n^eta + 1$. Combining this with the current $C n^eta$ from (9.11) costs at most $C n^(2 eta)$ while retaining $N_I^(- 1)$ with the continuation for the same choice. Apply this bound separately to eligible slots and paths, paying the fixed combinatorial multiplicity. Iteration gives a supremum over indexed full branches. On the simultaneous event, the score bounds together with the length estimates below control this supremum before integration. The hazards are scalars independent of $e$, so the same argument applies to edge-norm estimates after projection.
  The indicator of the simultaneous event is used only to bound these resulting integrands. The complementary integrals are controlled by the polynomial moments in Lemmas 40 and 41 and in the proof of Lemma 44, choosing their precision after $P$. Thus no future-dependent hazard event is used as a predictable factor.
  It suffices to stop after a fixed number $P$ of cutoff marks. If this threshold is reached, leave the remaining pre-density slots unexpanded. By Lemma 40 and the fixed-order path moment bounds, their product, together with all other positive-order slots, is at most $n^(C_(upright("cr")))$ in the normalized estimate, for a constant $C_(upright("cr")) = C_(upright("cr")) \( K \)$ independent of $P \, beta$. Indeed the sum of their positive orders is at most $K$; the derivative ratios already extracted at cutoff marks have uniform global bounds. Every node has length at most $C T$, so $N_I^(- 1) lt.eq C n^(- beta)$. The contribution stopped at $P$ cutoff marks, with an overshoot of at most $K$, is therefore at most
  #[#set math.equation(numbering: n => "(9.12)")
   $ C_(K \, P) n^(C_(upright("cr")) - P beta + 2 \( P + K \) eta) $ <repl:depth-remainder>]
  apart from exceptional precision.
  The parameter choices can now be made in order. First $K = 24$ is fixed. After choosing a sufficiently small $beta$ for the score estimates, take $P > \( C_(upright("cr")) + 3 \) \/ beta$, and then $eta lt.eq beta \/ \( 4 \( P + K \) \)$. For this fixed $P$, all scalar multiplicities from (9.8) and powers of $log n$ from partitions cost at most $n^(beta \/ 2)$ for large $n$. Together with $2 \( P + K \) eta lt.eq beta \/ 2$, (9.12) is at most $n^(- 2)$. Finally choose the exceptional-set and small-mass precisions. In a fully expanded term at most $K$ positive-order factors use the score estimates. Their total exponent loss is thus $C_K beta$ independent of $P$.
  ===== 9.1.4 The edge norms in fully expanded terms with cutoff marks. <the-edge-norms-in-fully-expanded-terms-with-cutoff-marks.>
  It remains to estimate terms which terminate before depth $P$. We first form a partition from the locations of their cutoff marks, before deciding which endpoints to condition on. Split each root into dyadic pieces only at nodes which properly contain a descendant carrying a cutoff mark. Make the same partition on a copy using its own cutoff marks.
  Let $m$ be the least length of a node carrying a cutoff mark, capped at $T$. In each fully expanded monomial, select one factor $R_l \( I \)$ with $l gt.eq 1$, or one factor $macron(q)_e$, supplied by a terminal $H_(I \, e)$ slot through (9.10). Make this choice from the indexed monomial, hence the same way for every $e$. The slot was created by a cutoff mark at $I$, so the selected factor has length $\| I \| gt.eq m$ in the $R_l \( I \)$ case and assigned length $T gt.eq m$ in the $macron(q)_e$ case. Every other terminal factor remains in the product. The gain from a shortest cutoff mark will be retained separately below. All partition pieces have length at least a constant times $m$, except possibly untouched original forest roots. Indeed, a split made to isolate a descendant $M$ carrying a cutoff mark creates two children, each of length at least $\| M \| gt.eq m$; further splits satisfy the same statement with their own such descendants. A copy starts at a node carrying a cutoff mark, so it has no untouched smaller root. This also gives $O_P \( 1 + log n \)$ pieces. The untouched roots smaller than a sufficiently small constant times $m$ can occur only in a stopped forest, and occur later than all cutoff marks on that path: the lengths of its original roots decrease chronologically. Choose that constant below the constants for complete legs, so no complete leg is included in this exception.
  Projecting the raw order-one coefficient on a root of length $D_1$ would replace it by $c_1 = R_1 \( D_1 \) + q_(upright("end"))$. If paired with $R_3 \( D_3 \)$, the $R_3 \( D_3 \) R_1 \( D_1 \)$ summand would have $L^2$-times-$L^2$ cost $n^(O \( beta \)) \( D_3 \/ D_1 \)^(1 \/ 2)$ by (9.3), which can grow when $D_1$ is very short. We therefore reserve one allocation before projecting piece coefficients. An untouched original root $I$ of length $z < c m$ may carry a raw coefficient of order one while the sole other factor of positive order is a conditional coefficient of order three. This is the small-root $\( 3 \, 1 \)$ allocation. Its terminal state is not revealed in advance, and its complete raw coefficient $ell_(1 \, e) \( I \) = \[ u \] L_(I \, e) \( u \)$ is retained until forward compensation. The total order is four, so no other positive-order factor is present. The small root carries no cutoff mark and cannot supply the selected terminal factor; hence in this allocation the selected factor is the $R_3$ factor.
  For every other allocation, condition on the relevant endpoints of nodes carrying cutoff marks and on the partition endpoints. The fresh piece interiors then have their conditional laws $sans(C)_J$ and factor after the endpoint variables and their shared identifications are fixed: lower weights stay inside their pieces, and every other included weight depends only on the conditioned endpoints. Shared exterior variables occur once; this does not assert independence of the completed copied histories. Whenever a raw coefficient on a piece is projected, it becomes $c_l = R_l + q_(upright("end")) R_(l - 1)$. Nonterminal denominators in (9.9) and initialization may contribute endpoint powers of absolute value one. At a terminal slot use (9.10) instead. The resulting terms are products of $R$ factors, $macron(q)$ factors counted as $R_1 \( T \)$, and bounded endpoint factors. The sum of their positive orders is at most $k$, and the selected terminal factor remains in this product. All these conditional identities are integrated under the joint copy law when the sharp estimates are used; they give no uniform sharp bound at an arbitrary fixed endpoint graph.
  For total $R$ order at most four, (9.3) gives the following complete list. Unused Hölder exponents are filled with the constant function on the edge probability space.
  #[#set math.equation(numbering: n => "(9.13)")
   $ upright("orders of the ") R upright(" factors") & upright("norms used") & upright("bound apart from ") n^(O \( beta \))\
1^r \, med 1 lt.eq r lt.eq 4 & L^4 upright(" for each") & 1\
2 \, 1^r \, med 0 lt.eq r lt.eq 2 & L^2 \, L^4 \, dots.h \, L^4 & 1\
2 \, 2 & L^2 \, L^2 & 1\
3 & L^1 & D_3^(- 1 \/ 4)\
4 & L^1 & 1\
3 \, 1 & L^2 \, L^2 & \( D_3 \/ D_1 \)^(1 \/ 2) . $ <repl:low-patterns>]
  Thus only $\( 3 \, 1 \)$ can cost more than a constant. If its order-one length $D_1$ is at least a constant times $m$, its cost is at most $C \( T \/ m \)^(1 \/ 2)$. Retain the gain from a shortest cutoff mark,
  #[#set math.equation(numbering: n => "(9.14)")
   $ frac(1, N \( m \)) = n^(- beta) \( m \/ T \)^(3 \/ 2) \; $ <repl:minimum-mark-gain>]
  when the shortest node carrying a cutoff mark has length greater than $T$, the same formula holds up to a constant. The remaining gains are at most a constant times $n^(- beta)$ each and pay their hazard summations. If $m lt.eq T n^(- epsilon_0)$, (9.14) leaves at most $\( m \/ T \)$ in the $\( 3 \, 1 \)$ case and $\( m \/ T \)^(3 \/ 2)$ in all other cases, after the total $n^beta$ allowance for hazards and logarithms. This is a fixed power saving.
  For the reserved small-root allocation, retaining $ell_(1 \, e) \( I \)$ keeps its $R_1$ and $q_(upright("end"))$ conditional terms together before a triangle inequality. The selected order-three factor is earlier on the same path or belongs to an independent original history. The endpoints of all nodes carrying cutoff marks on the same path precede $I$. Their conditional copies can be sampled before $I$, independently of its future given those already observed endpoints. Factors on other original histories can also be exposed first, because those histories and their external tests factor separately. This auxiliary sampling is fixed as part of the admissible law before choosing the earlier vector factor.
  After projecting the earlier pieces, we return to the joint tested expectation with the terminal state of $I$ unrevealed in advance, and compensate its raw order-one coefficient in the forward filtration. Under the forward tested law on this root, the external terminal and possible failure tests are included in its tilted intensities. The $L^2$ compensation in (9.4) is therefore valid with these earlier factors retained and gives $n^(O \( beta \)) z^(1 \/ 4) \/ sqrt(n)$. Paired with the order-three $L^2$ bound, the result is
  #[#set math.equation(numbering: n => "(9.15)")
   $ n^(O \( beta \)) frac(D_3^(1 \/ 2) z^(1 \/ 4), sqrt(n)) = n^(O \( beta \)) \( D_3 \/ T \)^(1 \/ 2) \( z \/ T \)^(1 \/ 4) lt.eq n^(O \( beta \)) . $ <repl:small-root>]
  This calculation is made before projecting the small root onto its endpoint, and the compensation identity precedes restriction to the hazard event. It proves the same early-$m$ saving using (9.14).
  For completeness, suppose $m gt.eq T n^(- epsilon_0)$. The selected terminal factor has length at least $m$ and is in the late range. Except for $\( 3 \, 1 \)$, the norms in (9.13) give a fixed improvement at that factor: a selected $R_1$ uses its late $L^4$ bound, a selected $R_2$ its late $L^2$ bound, and a selected $R_4$ its late $L^1$ bound. If the selected factor is the singleton $R_3$, then $D_3^(- 1 \/ 4) lt.eq T^(- 1 \/ 4) n^(epsilon_0 \/ 4)$. For the regular $\( 3 \, 1 \)$ case, put $delta_0 = 0.005$ and use the $R_3$ late $L^2$ gain $n^(- 0.001)$. Since $D_1 gt.eq c m$,
  $ cases(delim: "{", n^(- 0.001) \( D_3 \/ D_1 \)^(1 \/ 2) lt.eq C n^(- 0.001 + epsilon_0 \/ 2) \, & D_3 gt.eq T n^(- delta_0) \,, \( D_3 \/ D_1 \)^(1 \/ 2) lt.eq C n^(- \( delta_0 - epsilon_0 \) \/ 2) \, & D_3 < T n^(- delta_0) .) $
  The two savings are $n^(- 0.00095)$ and $n^(- 0.00245)$. In (9.15), the corresponding cases gain $n^(- 0.001)$ and $n^(- delta_0 \/ 2)$, respectively. These margins, and the early $m$ margin, remain positive after an exponent $C_K beta$ is included. Together with the fixed-weight calculation, they prove the low-order part of (9.2); one may take, for example, $a = 10^(- 7)$.
  For $k > 4$ the product estimates need no late gains or lower length bound. The following allocation of Hölder norms makes the power count explicit. A factor of order $l gt.eq 4$ uses its $L^1$ bound and saves two powers of $T$ relative to the supremum bounds with all lengths replaced by $C T$. If the largest order is three, pair it with an order two or three in $L^2$, or with two order ones using $L^2 \, L^4 \, L^4$; again the saving is two powers of $T$. A singleton order three is bounded by one. An order three paired with exactly one order one costs at most $T^(1 \/ 2)$, which is allowed because $k gt.eq 5$. If all orders are at most two, two order-two factors use $L^2 \, L^2$, one order two and two order ones use $L^2 \, L^4 \, L^4$, and four order ones use $L^4$ four times. Each of these saves two powers of $T$; when fewer factors are present their product is bounded by one. All unused factors use their supremum bounds. Thus if the total $R$ order is $h lt.eq k$, the cost is at most $n^(O \( beta \)) T^(\( k - 4 \) \/ 2)$. This proves the high-order part.
  Finally the same expansion with the supremum bounds in Proposition 45, the raw fixed-order path bounds, and $sum l lt.eq k$ gives (9.2). The depth remainder is already smaller, and the exceptional and small-mass reductions at the start give the stated additive precision. Since the Taylor coefficients of $tanh theta.alt$ at zero are fixed constants, a derivative of order $k$ in $theta.alt$ is a fixed linear combination of coefficients of orders at most $k$ in $u$. Applying this to each factor of a product leaves total $u$ order at most the assigned total $theta.alt$ order. The lower-order estimates fit the asserted bounds for that total order. ◻
]

=== 9.2 Localized traces and entrywise comparison <localized-traces-and-entrywise-comparison>

Let $cal(Q)_n$ be a finite set of queries in the fixed compact rectangles, with $\| cal(Q)_n \| lt.eq n^(d_0)$ for a fixed $d_0$. It may contain both stationary and quench queries. For a query $q$, let $zeta_q$ be its endpoint observable $n^(- 2 \/ 3) sum_i X_i Y_i$, so $\| zeta_q \| lt.eq n^(1 \/ 3)$. Define

$ tilde(Y)_q = bb(E)_q [zeta_q product_(I upright(" in ") q) w_I] \, #h(2em) ell_q = 1 - bb(E)_q [product_(I upright(" in ") q) w_I] . $

The expectations have the actual initialization of the query. In particular the quench history starts from the uniform cube law. The surviving trace $tilde(Y)_q$ is not renormalized. Order checks chronologically as in Definition 37. Telescoping the product gives the exact first-failure decomposition

#[#set math.equation(numbering: n => "(9.16)")
 $ ell_q = sum_(I upright(" in ") q) ell_(q \, I) \, #h(2em) ell_(q \, I) := bb(E)_q [product_(J upright(" preceding ") I) w_J thin \( 1 - w_I \)] gt.eq 0 . $ <repl:first-failure>]

The summand is the mass of the corresponding checked first-failure prefix; its unneeded future integrates to one.

Let $Gamma \( J \) = chi_n \( \( J_e \/ sqrt(n) \)_e \)$ be the static cutoff of Lemma 33. Choose a smooth $chi : bb(R) arrow.r \[ 0 \, 1 \]$ equal to one on $\( - oo \, 1 \]$ and zero on $\[ 2 \, oo \)$, and put

#[#set math.equation(numbering: n => "(9.17)")
 $ G \( J \) = Gamma \( J \) chi (n^10 sum_(q in cal(Q)_n) ell_q \( J \)) . $ <repl:outer-cutoff>]

The Gaussian static estimate and Lemma 36, used at a precision chosen after $d_0$, imply

#[#set math.equation(numbering: n => "(9.18)")
 $ bb(E)_(upright(G)) G arrow.r 1 . $ <repl:gaussian-cutoff>]

We compare bounded smooth functions $F = F_n$ on $bb(R)^(cal(Q)_n)$ satisfying, for fixed constants independent of $n$,

#[#set math.equation(numbering: n => "(9.19)")
 $ parallel F parallel_oo lt.eq C_F \, #h(2em) sup_y sum_(q_1 \, dots.h \, q_j in cal(Q)_n) lr(|partial_(q_1) dots.h.c partial_(q_j) F \( y \)|) lt.eq C_F \( log n \)^(C_F) \, quad 1 lt.eq j lt.eq K . $ <repl:test-class>]

This class includes $F = 1$. Write $Phi \( J \) = G \( J \) F \( \( tilde(Y)_q \( J \) \)_(q in cal(Q)_n) \)$ and define

$ partial_e^j Phi \( J \) = frac(d^j, d theta.alt^j) Phi \( J_(- e) \, J_e + sqrt(n) thin theta.alt \)\|_(theta.alt = 0) . $

Thus $partial_e$ differentiates the interaction coefficient, rather than the unscaled entry $J_e$.

#thm([Lemma 9.3.])[
  (Derivatives of the localized observable).  #emph[The parameter $beta > 0$ can be chosen so that there are $a_0 > 0$ and $0 < delta < 0.01$ with, for every disorder matrix $J$, 
#[#set math.equation(numbering: n => "(9.20)")
 $ 1 / binom(n, 2) sum_e \| partial_e^4 Phi \( J \) \| & lt.eq n^(- a_0) \,\
1 / binom(n, 2) sum_e \| partial_e^k Phi \( J \) \| & lt.eq n^delta T^(\( k - 4 \) \/ 2) \, quad 5 lt.eq k < K \,\
max_e \| partial_e^j Phi \( J \) \| & lt.eq n^delta T^(j \/ 2) \, quad 1 lt.eq j lt.eq K . $ <repl:fourth-derivative>]

 The constants may depend on the fixed exponents in (9.19) and on $d_0 \, c \, C$.]
] <repl:observable-derivatives>

#proof[
  On the support of a term containing a differentiated history, the static support conditions hold and $sum_q ell_q lt.eq 2 n^(- 10)$. This follows from the supports of $Gamma$ and its derivatives, and of $chi$ and its derivatives. Split each $zeta_q$ into its positive and negative parts. The base masses of these two checked integrals are at most $n^(O \( beta \))$. Indeed the post-check kernel caps at the ends of the one or two legs dominate the joint law of the two observation spins by $exp \( C' N \( c T \) \) mu^(⊗ 2)$. For a stationary query the first spin already has law $mu$; for a uniform-start query the first leg cap holds from each initial spin. Choose the first dyadic $d_(*) gt.eq c T$. Then $d_(*) lt.eq 2 c T$, $r_2 \( d_(*) \) lt.eq r_2 \( c T \)$, and $a_2 \( d_(*) \) gt.eq c_1 n^(3 beta)$. The pair cutoff therefore gives
  $ bb(E)_q [\| zeta_q \| product_I w_I] lt.eq n^(1 \/ 3) r_2 \( c T \) + n^(1 \/ 3) exp \( C' N \( c T \) - c n^(3 beta) \) lt.eq C n^(2 beta) + n^(- A') $
  for arbitrary fixed $A'$. We used $N \( c T \) = O \( n^beta \)$.
  Apply the ordinary chain rule to $chi \( n^10 sum ell_q \)$ and to $F \( tilde(Y) \)$. A term has at most $K$ positive-order history coefficients, with total order at most the differentiating order; repeated histories are represented by independent copies. The coefficients from derivatives of $F$ are evaluated at the base $tilde(Y) \( J \)$, hence are common across $e$, and their total absolute sums are bounded by (9.19). For loss factors, expand (9.16). The mass factors in Lemma 47, summed over all choices of queries and first-failure nodes and multiplied by their $n^10$ factors, give at most
  $ (n^10 sum_(q \, I) ell_(q \, I))^r lt.eq 2^r $
  when there are $r$ loss factors. Trace mass factors cost at most $n^(O_K \( beta \))$. The additive precisions in that lemma are chosen after the polynomial number of nodes and queries and after the factors $n^(10 K)$, so their total is negligible.
  If a static cutoff is also differentiated, its pointwise derivative bound from Lemma 33 multiplies these estimates. If only the static cutoff is differentiated, that bound is $O \( n^(- b) \)$ for some $b = b \( beta \) > 0$, and its remaining outer factor is bounded. Consequently the fourth averaged derivative is at most $n^(- a + C'_K beta) \( log n \)^(C') + O \( n^(- b) \)$, higher averaged derivatives are at most $n^(C'_K beta) \( log n \)^(C') T^(\( k - 4 \) \/ 2)$, and the supremum bound is at most $n^(C'_K beta) \( log n \)^(C') T^(j \/ 2)$. These estimates hold everywhere: outside the indicated supports the corresponding product-rule terms vanish. Choose $beta$ after $K$ so that $C'_K beta < a \/ 2$ and $C'_K beta < 0.005$, while satisfying the preceding sections’ smallness requirements. Absorb logarithms by a still smaller fixed power. This gives (9.20)– (9.20) for some $a_0 > 0$ and $delta < 0.01$. ◻
]

#thm([Lemma 9.4.])[
  (Entrywise replacement).  #emph[For every sequence of query sets and tests satisfying (9.19), 
$ bb(E)_(upright("Rad")) #h(-0.16667em) [G F \( tilde(Y) \)] - bb(E)_(upright(G)) #h(-0.16667em) [G F \( tilde(Y) \)] arrow.r 0 . $

]
] <repl:comparison>

#proof[
  We use the Taylor replacement principle #cite(label("Chatterjee2006")), in the finite mixture form of the stationary comparison #cite(label("FUA")) Section 8. Put $nu_lambda = \( 1 - lambda \) sans(N) \( 0 \, 1 \) + lambda \( delta_(- 1) + delta_1 \) \/ 2$ for $0 lt.eq lambda lt.eq 1$. Differentiating its finite product measure gives exactly
  #[#set math.equation(numbering: n => "(9.21)")
   $ frac(d, d lambda) bb(E)_(nu_lambda^(⊗ binom(n, 2))) Phi = sum_e bb(E)_(lambda \, - e) [bb(E)_xi Phi \( J_(- e) \, xi \) - bb(E)_Z Phi \( J_(- e) \, Z \)] \, $ <repl:mixture-derivative>]
  where $xi$ is a symmetric sign, $Z$ is standard normal, and $bb(E)_(lambda \, - e)$ averages the other entries.
  Independently of $J_(- e) \, xi \, Z$, sample $V$ from $nu_lambda$ and set $J^0 = \( J_(- e) \, V \)$. Taylor-expand at this completed matrix:
  #[#set math.equation(numbering: n => "(9.22)")
   $ Phi \( J_(- e) \, x \) = sum_(k = 0)^(K - 1) frac(partial_e^k Phi \( J^0 \), k ! thin n^(k \/ 2)) \( x - V \)^k + cal(R)_e \( x \, V \) \, #h(2em) \| cal(R)_e \( x \, V \) \| lt.eq frac(\| x - V \|^K, K ! thin n^(K \/ 2)) thin n^delta T^(K \/ 2) . $ <repl:centered-taylor>]
  The remainder bound is global by (9.20), including every point of the segment. Conditional on $J_(- e) \, V$, the orders $k lt.eq 3$ cancel exactly between the two proposals. In fact
  #[#set math.equation(numbering: n => "(9.23)")
   $ Delta_k \( V \) := bb(E)_xi \( xi - V \)^k - bb(E)_Z \( Z - V \)^k = sum_(j = 4)^k binom(k, j) \( - V \)^(k - j) #scale(x: 120%, y: 120%)[\(] bb(E) xi^j - bb(E) Z^j #scale(x: 120%, y: 120%)[\)] \, $ <repl:centered-moments>]
  where the sum is empty for $k lt.eq 3$. Independence of the completed entry from both proposals is what permits this conditional cancellation.
  For $4 lt.eq k < K$, on $\| V \| lt.eq log n$ the absolute value of (9.23) is at most $C_K \( log n \)^K$. The complementary mixture tail, even with any fixed moment of $V$, is smaller than every inverse power of $n$. Its contribution is negligible by the global polynomial bounds (9.20). When $e$ is uniform, $J^0$ has the full iid mixture law independently of $e$. Therefore (9.21)–(9.22) yield, uniformly in $lambda$,
  #[#set math.equation(numbering: n => "(9.24)")
   $ lr(|frac(d, d lambda) bb(E)_(nu_lambda^(⊗ binom(n, 2))) Phi|) & lt.eq C_K \( log n \)^K sum_(k = 4)^(K - 1) n^(2 - k \/ 2) bb(E)_lambda #h(-0.16667em) [1 / binom(n, 2) sum_e \| partial_e^k Phi \( J \) \|]\
 & #h(2cm)  + C_K n^(2 - K \/ 2 + delta) T^(K \/ 2) + o \( 1 \) . $ <repl:master-comparison>]
  The remainder uses the bounded $K$th moments of $xi \, Z \, V$. By (9.20), the $k = 4$ term tends to zero. For $k gt.eq 5$, (9.20) and $T = n^(2 \/ 3)$ give
  $ n^(2 - k \/ 2 + delta) T^(\( k - 4 \) \/ 2) = n^(- \( k - 4 \) \/ 6 + delta) = o \( 1 \) . $
  The remainder is $n^(2 - K \/ 6 + delta) = n^(- 2 + delta)$ because $K = 24$. Thus (9.24) tends to zero uniformly in $lambda$. Integration over $\[ 0 \, 1 \]$ proves the lemma. ◻
]

=== 9.3 Removing the cutoff and transferring tightness <removing-the-cutoff-and-transferring-tightness>

Take $F = 1$ in Lemma 49. In view of (9.18),

#[#set math.equation(numbering: n => "(9.25)")
 $ bb(E)_(upright("Rad")) \( 1 - G \) arrow.r 0 \, #h(2em) bb(E)_(upright(G)) \( 1 - G \) arrow.r 0 . $ <repl:both-cutoffs>]

This step transfers the high probability of the cutoff to Rademacher disorder using derivative estimates that held for every matrix on their deterministic supports.

Let $Y_q$ be the actual trace. On $G > 0$,

#[#set math.equation(numbering: n => "(9.26)")
 $ \| Y_q - tilde(Y)_q \| lt.eq n^(1 \/ 3) ell_q lt.eq 2 n^(1 \/ 3 - 10) \, #h(2em) q in cal(Q)_n . $ <repl:remove-loss>]

The first-derivative bound in (9.19) makes $F$ Lipschitz for the coordinate supremum norm with constant $C_F \( log n \)^(C_F)$. It follows from (9.25)–(9.26) that, for either entry law,

$ bb(E) F \( Y \) - bb(E) \[ G F \( tilde(Y) \) \] arrow.r 0 . $

Hence Lemma 49 applies to the actual traces at finite query sets and at all polynomial grids with tests in (9.19). At fixed finite sets this proves the equality of limiting joint finite-dimensional laws with the Gaussian pair.

We give the tightness transfer because a comparison only at fixed times would not suffice for the asserted topology. The finite heat-bath generator $cal(L)_J = sum_i \( P_i - I \)$ has $parallel cal(L)_J parallel_(oo arrow.r oo) lt.eq 2 n$, and its semigroup is a contraction in supremum norm. Differentiating the one or two semigroups in a trace therefore gives, for every $J$ and on the fixed rectangles,

#[#set math.equation(numbering: n => "(9.27)")
 $ \| partial_t A_(n \, J) \( t \) \| lt.eq 2 n^2 \, #h(2em) \| partial_s B_(n \, J) \( s \, t \) \| + \| partial_t B_(n \, J) \( s \, t \) \| lt.eq 4 n^2 . $ <repl:time-lipschitz>]

Indeed each derivative in $s$ or $t$ inserts $T cal(L)_J$ into its corresponding semigroup, and the undifferentiated trace is bounded by $n^(1 \/ 3)$.

Choose grids of mesh at most $h_n = n^(- 4)$ on the two rectangles. They and all pairs of their points have polynomial size, and (9.27) makes their interpolation error $O \( n^(- 2) \)$. For grid coordinates $y$, the signed forms used to test a supremum are $plus.minus y_q$, and those for a modulus of continuity are $plus.minus \( y_q - y_(q') \)$ for pairs in the same rectangle at distance at most a specified radius. Include the zero form. Each such linear form has coefficient $ell^1$ norm at most two. For a collection of $M_n$ forms $a_r \( y \)$, with $M_n$ polynomial, put

$ "smax"_(lambda_n) \( a \( y \) \) = lambda_n^(- 1) log sum_(r = 1)^(M_n) e^(lambda_n a_r \( y \)) \, #h(2em) lambda_n = \( log n \)^2 . $

It lies between $max_r a_r$ and $max_r a_r + \( log M_n \) \/ lambda_n$, so its error is $o \( 1 \)$. Its derivatives obey

#[#set math.equation(numbering: n => "(9.28)")
 $ sum_(q_1 \, dots.h \, q_j) lr(|partial_(q_1) dots.h.c partial_(q_j) "smax"_(lambda_n) \( a \( y \) \)|) lt.eq C_j lambda_n^(j - 1) \, #h(2em) 1 lt.eq j lt.eq K . $ <repl:softmax-derivatives>]

For example, the derivative of order $j$ is $lambda_n^(j - 1)$ times the joint cumulant of the coefficient coordinates of a random form chosen with its normalized exponential weight. The cumulant partition formula, followed by the coefficient $ell^1$ bound two in each factor, proves (9.28). Composing with a fixed bounded smooth function whose derivatives through order $K$ are bounded now satisfies (9.19) by the ordinary chain rule.

Let $omega_n \( rho \)$ be the greater of the two moduli of continuity on the fixed rectangles, with the supremum metric on each parameter domain. Use the preceding smoothed maximum over grid pairs at distance at most $2 rho$, followed by a smooth increasing function which is zero below $epsilon.alt \/ 3$ and one above $2 epsilon.alt \/ 3$. For fixed $rho \, epsilon.alt > 0$, the interpolation and smoothing errors are smaller than $epsilon.alt \/ 12$ for large $n$. Comparison of the actual grid tests consequently gives

#[#set math.equation(numbering: n => "(9.29)")
 $ limsup_(n arrow.r oo) bb(P)_(upright("Rad")) { omega_n \( rho \) > epsilon.alt } lt.eq limsup_(n arrow.r oo) bb(P)_(upright(G)) { omega_n \( 2 rho \) > epsilon.alt \/ 4 } . $ <repl:modulus-transfer>]

Here a pair of original points at distance at most $rho$ is moved to nearest grid points at distance at most $2 rho$. The same construction with forms $plus.minus y_q$ transfers tightness of the supremum norm. Gaussian tightness, proved in Proposition 25 and Theorem 27, makes the right side of (9.29) tend to zero as $rho arrow.b 0$ and makes the supremum tails vanish as their threshold tends to infinity. The Arzelà–Ascoli tightness criterion therefore gives tightness of the Rademacher restrictions to these rectangles.

Apply this argument on the exhaustion $\[ j^(- 1) \, j \]$ and $\[ j^(- 1) \, j \]^2$, $j gt.eq 2$. The usual diagonal form of the same criterion gives tightness in the product of the two $C_(upright("loc"))$ spaces. Every subsequential limit has the Gaussian finite-dimensional laws established above; evaluations on a countable dense set determine a law on continuous functions. The subsequential limit is therefore $"Law"_g \( A_g \, B_g \)$, proving Proposition 46.

Every query in the comparison used the original times $s T \, t T$ and the original uniform initialization for $B_(n \, J)$. The replacement changes only the coupling law. Thus the coefficient $c_(*)$ and the entrance $h_s^g$ obtained from the Gaussian construction pass unchanged to the Rademacher limit.

== 10 Completion of the proof <sec:completion>

#proof[
  In Gaussian disorder, Proposition 3 supplies the cap estimates used in Theorem 15. Apply that theorem to the initial law $nu_n$. Proposition 25 then supplies, on a further represented subsequence of every sequence, a normalized positive-time density family for $S_t^g = e^(- t c_(*) H_g)$, together with locally uniform limits of both finite autocorrelations. Proposition 26 gives the averaged uniform-start escape estimate. The sequence extraction and fixed-$g$ uniqueness in Theorem 27 identify every represented family with the same measurable family $h^g$ for almost every $g$. The subsequence criterion gives the Gaussian joint convergence.
  The density family is bounded at each positive time, hence belongs to $L^2 \( Pi_g \)$; it is nonnegative, has mass one, and satisfies the semigroup relation. Its weak product-topology boundary is $delta_0$ by Theorem 27. Proposition 25 proves the locally uniform convergence and continuity of the series defining $B_g$. Each finite partial sum is continuous in $\( s \, t \)$, and its evaluations at rational pairs are measurable in $g$ by the density and semigroup constructions in Theorem 27. It is therefore Borel as a $C_(upright("loc")) \( \( 0 \, oo \)^2 \)$-valued map, and so is its locally uniform limit.
  Proposition 25 gives $parallel h_s^g - 1 parallel_(L^2 \( Pi_g \)) arrow.r 0$, and hence the required $L^1$ convergence. It also gives locally uniform convergence $B_g \( s \, dot.op \) arrow.r A_g \( dot.op \)$ for almost every $g$ on which the selected family is defined. This implies the stated convergence in probability over $g$.
  Proposition 46 transfers the joint function law to Rademacher disorder. Its comparison uses the uniform initial law for each quench trace, so the limiting family is the one already selected in the Gaussian argument. The added Gaussian diagonal and the auxiliary eigenvector signs do not affect either finite autocorrelation. For both laws the finite dynamics use rate-one site clocks and are observed in the time unit $T_n = n^(2 \/ 3)$. The temporary substitution $u = c_(*) s$ was reversed in the entrance proof, so the limiting semigroup retains exactly the coefficient $c_(*)$ in (1.4), completing all the assertions. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
