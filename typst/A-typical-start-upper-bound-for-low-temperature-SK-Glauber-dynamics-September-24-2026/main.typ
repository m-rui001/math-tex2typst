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

#align(center)[#text(size: 16pt, weight: "bold")[A typical-start upper bound for low-temperature \
SK Glauber dynamics]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Single-site heat-bath dynamics is a natural way to sample an interacting spin system: one spin at a time is resampled from its conditional Gibbs law. In the Sherrington–Kirkpatrick model [17], every pair of spins interacts through a Gaussian coupling. At low temperature, a configuration chosen adversarially can be much harder to escape than a configuration drawn from equilibrium. Indeed, at sufficiently low temperature, gapped configurations force an exponential worst-start mixing-time lower bound [16] Theorem 1.1.

We prove an upper bound throughout the fixed low-temperature phase for a different question. Sample the disorder, sample one configuration from its Gibbs measure, and then fix that configuration as the initial state. How long does its transition law take to approach equilibrium? The answer is at most $exp \( n^(1 - c) \)$ with probability tending to one, for an explicit positive $c$. This formulation keeps the randomness of the initial state outside the total-variation distance.

=== 1.1 Model and main theorem <model-and-main-theorem>

Let $n gt.eq 2$, and let $J_(i j)$, $1 lt.eq i < j lt.eq n$, be independent standard Gaussian variables. For $sigma in { - 1 \, 1 }^n$, define

#[#set math.equation(numbering: n => "(H)")
 $ H_n^J \( sigma \) = 1 / sqrt(n) sum_(i < j) J_(i j) sigma_i sigma_j \, #h(2em) pi_(n \, beta)^J \( sigma \) = frac(exp \( beta H_n^J \( sigma \) \), Z_(n \, beta)^J) . $ <eq:intro-model>]

The external field is zero. Each site has an independent rate-one clock. When the clock at site $i$ rings, the new spin equals $s in { - 1 \, 1 }$ with conditional probability

$ frac(exp \( beta s h_i \( sigma \) \), 2 cosh \( beta h_i \( sigma \) \)) \, #h(2em) h_i \( sigma \) = 1 / sqrt(n) sum_(j eq.not i) J_(i j) sigma_j \, $

where $J_(j i) = J_(i j)$ and $J_(i i) = 0$. Such an update may leave the configuration unchanged. Denote the resulting continuous-time transition law from a fixed $sigma$ by $P_t^(J \, beta) \( sigma \, dot.op \)$, and set

#[#set math.equation(numbering: n => "(T)")
 $ T_(n \, beta)^J \( sigma \) = inf {t gt.eq 0 : ∥P_t^(J \, beta) \( sigma \, dot.op \) - pi_(n \, beta)^J∥_(upright("TV")) lt.eq 1 / 4} . $ <eq:intro-state-mixing-time>]

#thm([Theorem 1.])[
  (Mixing from a typical Gibbs state).  #emph[For every fixed $beta > 1$, there is $c_beta in \( 0 \, 1 \)$ such that 
$ bb(P)_(J \, thin sigma_0 tilde.op pi_(n \, beta)^J) {T_(n \, beta)^J \( sigma_0 \) lt.eq exp #scale(x: 120%, y: 120%)[\(] n^(1 - c_beta) #scale(x: 120%, y: 120%)[\)]} arrow.r 1 #h(2em) upright("as ") n arrow.r oo . $

 The exponent is independent of $n$ and of the realized disorder. The proof permits $c_beta = 1 \/ 40000000$ for every fixed $beta > 1$.]
] <thm:main>

Equivalently, in probability over $J$, the Gibbs mass of states satisfying the displayed bound tends to one. The state $sigma_0$ is realized before the transition law and its distance from equilibrium are formed. If the initial state were averaged into that transition law, stationarity would instead make the distance zero at every time. The exponent above is not optimized, and the dimension at which the estimates become effective may depend on the fixed $beta$. All times in this paper use the continuous-time convention just specified.

#thm([Corollary 2.])[
  (Two-sided typical-start bounds).  #emph[For every fixed $beta > 1$, in the model and continuous-time convention above, 
$ bb(P)_(J \, thin sigma_0 tilde.op pi_(n \, beta)^J) mat(delim: "{", exp #scale(x: 120%, y: 120%)[\(] n^(1 \/ 10000) #scale(x: 120%, y: 120%)[\)], < T_(n \, beta)^J \( sigma_0 \); #none, lt.eq exp #scale(x: 120%, y: 120%)[\(] n^(1 - 1 \/ 40000000) #scale(x: 120%, y: 120%)[\)]) arrow.r 1 #h(2em) upright("as ") n arrow.r oo . $

 The Gibbs state $sigma_0$ is held fixed before the total variation in (T) is evaluated.]
] <cor:typical-two-sided>

#proof[
  The continuous-time part of [15] Theorem 1.1 gives total-variation distance greater than $1 \/ 4$ at time $exp \( n^(1 \/ 10000) \)$ with joint probability tending to one. Contraction of total variation and continuity of the finite-state semigroup then give the strict lower bound on $T_(n \, beta)^J \( sigma_0 \)$. The upper bound is Theorem 1 with $c_beta = 1 \/ 40000000$. Both events use the same disorder/Gibbs-start law and rate-one-per-site clocks, so their intersection has probability tending to one by the union bound. ◻
]

=== 1.2 Earlier mixing results and proof ingredients <earlier-mixing-results-and-proof-ingredients>

At high temperature, functional inequalities have yielded polynomial mixing bounds from every starting state. Eldan, Koehler and Zeitouni proved such a bound for $beta < 1 \/ 4$ using a spectral condition on the interaction matrix [8] Section 6. More recently, Wang proved optimal-order Glauber mixing for every fixed $beta < 1 \/ 2$ [18] Theorem 1.1, and Boban, Li and Oveis Gharan extended polynomial mixing in zero field to $beta < 1 \/ 2 + epsilon_0$ for an absolute $epsilon_0 > 0$ [2] Corollary 1.6. These results concern worst-start mixing in a high-temperature range. In the low-temperature setting, Sellke explicitly distinguished the worst-start obstruction from the possibility of faster mixing after Gibbs-distributed initialization [16] discussion after Theorem 1.1. Theorem 1 addresses this latter question throughout the range of fixed $beta > 1$.

The equilibrium input that drives the proof is stationarity along an entire interval of scalar overlaps. The variational analysis of the Parisi functional developed by Chen [6] Theorem 2 and Proposition 1 and by Jagannath and Tobasco [10] Proposition 1.1 and Corollaries 3.6, 3.10 provides the scalar stationarity conditions on the support of the minimizing measure. Zhou established full interval support immediately above the transition [19] Theorem 1. For the whole range of fixed $beta > 1$, we use the full interval conclusion of Lopatto [12] Theorem 1.1, specifically version 3. Full support lets us apply the stationarity identity at every overlap between zero and the top support point. Infinite support alone would not supply this input.

Two other equilibrium results enter with different purposes. Guerra’s finite-volume interpolation bound [9] Theorem 3 controls the expected log partition function from above. The spatial regularity and step-approximation stability of the scalar Parisi equation [1] Propositions 1–2 justify the diffusion and its calculus. Section 3 states these inputs in the exact normalization used here and derives the additional estimates beyond the support endpoint.

The proposal construction is related to established Gaussian-query methods. Bolthausen’s iterative construction of TAP solutions uses successive Gaussian conditioning and orthogonalization [4] Sections 2–3. Montanari’s incremental approximate message passing algorithm uses a Parisi diffusion and normalized magnetization increments to optimize the SK Hamiltonian [14] Sections 2–3. Our proposal uses exact finite-dimensional Gaussian conditioning to establish quantitative entropy and likelihood comparisons with the Gibbs joint law.

The comparison in the reverse direction uses transport under a strongly log-concave reference measure [3] Corollary 3.10, followed by Gaussian smoothing [13] Lemma 11. We give the necessary conditional proofs in Section 5. Finally, the conversion from flow to mixing uses the coarea proof of the reversible Cheeger bound [11] Theorem 3.5 and entropy dissipation [7] Lemmas 2.5 and 2.7. Our finite-chain argument retains a set of large stationary mass before making this conversion, so that it only requires information about cuts separating appreciable masses.

=== 1.3 How the proof reaches a typical fixed state <how-the-proof-reaches-a-typical-fixed-state>

We first construct a random spin configuration correlated with the Gaussian interaction matrix. Its coordinates follow a scalar magnetization martingale. The martingale continues beyond the Parisi support until the average coordinate uncertainty is small. During this continuation, the matrix-query noise is mixed with an independent Brownian noise. An exact scalar identity balances the entropy paid through the matrix channel against the energy gained by the proposal. Sections 3 and 4 turn this identity into two estimates: sublinear forward relative entropy, and an upper likelihood bound outside an exponentially unlikely event.

Forward relative entropy by itself does not guarantee that a proposal reaches a prescribed set of positive Gibbs mass. To obtain that property, Section 5 conditions the Gibbs joint law on the spin. The remaining disorder law is strongly log-concave. Smoothing the disorder then reverses the entropy comparison and gives a lower bound on the proposal probability of every set whose Gibbs mass is appreciable, for the realized target disorder and smoothing base.

Section 6 joins two proposals generated independently conditional on that base. Longer, fine-horizon proposals supply the endpoint coverage; shorter, coarse-horizon proposals have the rarer failures needed along the connecting sequence. Near-pinning of the magnetizations joins these two scales. Rotating the Gaussian inputs of the coarse proposals produces small consecutive Hamming distances. If a cut separating appreciable Gibbs masses had very small stationary flow, its enlarged vertex boundary would have tiny Gibbs mass. The likelihood bound makes the intermediate proposals avoid that boundary, while coverage gives a positive chance that the two endpoints lie on opposite sides. These conclusions contradict the elementary fact that a short-step sequence crossing a cut must approach its boundary; Figure 1 depicts this last step.

It remains to turn the resulting flow estimate into a mixing statement. Section 7 proves a finite-chain lemma that removes less than a prescribed small stationary mass and obtains a Poincaré inequality on the remainder. Entropy dissipation and stationarity then bound the average of the #emph[fixed-state] total-variation distances. The argument does not require a trajectory to stay in the retained set. This is the final reason that rare slow starting states do not prevent the conclusion of Theorem 1.

== 2 Notation and Gaussian completion <sec:setup>

Fix a finite $beta > 1$. Constants may depend on this fixed parameter; when that dependence matters we write $C_beta$ or $O_beta \( dot.op \)$. All logarithms are natural. For probability measures $mu lt.double nu$, set

$ upright("KL") \( mu bar.v.double nu \) = integral log frac(d mu, d nu) thin d mu . $

On the spin cube, total variation is one half of the $ell^1$ distance. For vectors in $bb(R)^n$ write $chevron.l v \, w chevron.r_n = v dot.op w \/ n$ and $\| v \|_n^2 = chevron.l v \, v chevron.r_n$. The notation $parallel dot.op parallel$ refers to the ordinary Euclidean norm, or to the operator norm of a matrix.

The orthogonal queries will use a Gaussian orthogonal ensemble (GOE) matrix. Complete the interaction matrix by independent diagonal entries: $W = W \( G \)$ is symmetric, its upper off-diagonal entries are $J_(i j) \/ sqrt(n)$, and its diagonal entries have law $N \( 0 \, 2 \/ n \)$. The vector $G$ consists of the independent standard Gaussian drivers of all these entries, and $gamma$ denotes its law. Define

$ hat(H)_G \( x \) = 1 / 2 x^(sans(T)) W \( G \) x \, #h(2em) F \( G \) = log sum_(x in { - 1 \, 1 }^n) e^(beta hat(H)_G \( x \)) \, #h(2em) pi_G \( x \) = e^(beta hat(H)_G \( x \) - F \( G \)) . $

Since $x_i^2 = 1$, the added diagonal contributes the same centered random constant to every spin energy. It changes neither $pi_G$ nor the heat-bath transition rates, and its contribution to $bb(E) F \( G \)$ vanishes.

The joint law to which proposals will be compared is

$ P \( d G \, x \) = gamma \( d G \) pi_G \( x \) . $

Thus $P$ samples the ordinary disorder first and then a Gibbs spin. A proposal law $Q_l$ will also have disorder marginal $gamma$, but its conditional spin law will be constructed by matrix queries. Keeping these joint laws distinct is necessary: entropy on the joint space first controls proposals, whereas the desired conclusion concerns a transition law for one fixed disorder and one fixed initial spin.

== 3 Scalar inputs and the entropy–energy identity <sec:scalar>

This section provides the deterministic coefficients for the proposal. The main output is (3): it balances the proposal’s information cost through the matrix channel against its energy gain, up to a small terminal error. We derive it after stating the equilibrium inputs and controlling a continuation of the scalar diffusion beyond the support of the Parisi measure.

=== 3.1 Exact equilibrium inputs and normalization <exact-equilibrium-inputs-and-normalization>

Let $mu_beta$ be a minimizing Parisi probability measure for zero-field Gaussian SK at the fixed finite $beta > 1$. We use the following external results: Guerra’s finite-volume pressure upper bound [9] Theorem 3; spatial regularity and stability under step approximation for the Parisi equation [1] Propositions 1–2; and full interval support with scalar stationarity [12] Theorem 1.1, Lemma 2.2, Proposition 2.4, and Lemma 2.5. In particular,

$ "supp" \( mu_beta \) = \[ 0 \, q_(*) \] \, #h(2em) 0 < q_(*) < 1 . $

The cited support theorem is used only for this zero-field Gaussian pair-interaction model and for each fixed $beta > 1$.

Use scalar variance time $v = beta^2 s$, and put $alpha_v = mu_beta \( \[ 0 \, v \/ beta^2 \] \)$ for $0 lt.eq v lt.eq beta^2$. Let $Phi$ solve the backward Parisi equation

$ Phi_v = - 1 / 2 \( Phi_(y y) + alpha_v Phi_y^2 \) \, #h(2em) Phi \( beta^2 \, y \) = log \( 2 cosh y \) . $

Derivatives of $Phi$ are indicated by subscripts. Equivalently, if $u$ is the scalar solution in [12], then $Phi \( v \, y \) = u \( v \/ beta^2 \, y \) + log 2$. Combining the source’s independent ordered pair couplings gives the unordered pair coefficient $beta \/ sqrt(n)$ used here, plus a centered diagonal term. Thus its scalar normalization agrees with the completed Hamiltonian.

Set $v_(*) = beta^2 q_(*)$. In these units the pressure functional and the finite-volume upper bound read

$ cal(P) = Phi \( 0 \, 0 \) - frac(1, 2 beta^2) integral_0^(beta^2) v alpha_v thin d v \, #h(2em) bb(E) F \( G \) lt.eq n cal(P) . $

The centered diagonal does not affect this expected pressure. Since $alpha_v = 1$ above $v_(*)$, the Gaussian recursion gives

$ Phi \( v_(*) \, y \) = log \( 2 cosh y \) + frac(beta^2 - v_(*), 2) . $

Only the pressure upper bound is needed below.

Continue the endpoint formula for the potential to all $v > v_(*)$ by

$ Phi \( v \, y \) = log \( 2 cosh y \) + frac(beta^2 - v, 2) \, #h(2em) alpha_v = 1 . $

This agrees with the original solution up to $beta^2$ and satisfies the same PDE for arbitrarily large $v$. For every $v gt.eq 0$, put $m \( v \, y \) = Phi_y \( v \, y \)$ and $a \( v \, y \) = Phi_(y y) \( v \, y \)$; thus $m \( v \, y \) = tanh y$ and $a \( v \, y \) = 1 - tanh^2 y$ when $v gt.eq v_(*)$. Let $Z$ be standard Brownian motion and solve

$ d Y_v = alpha_v m \( v \, Y_v \) thin d v + d Z_v \, #h(2em) Y_0 = 0 . $

The drift is bounded and spatially Lipschitz. We abbreviate its evaluated scalar functions by $m_v = m \( v \, Y_v \)$ and $a_v = a \( v \, Y_v \)$. The cited stationarity identity, the differentiated PDE, and Itô’s formula give

$ m_0 = 0 \, #h(2em) d m_v = a_v thin d Z_v \, #h(2em) bb(E) m_v^2 = v \/ beta^2 quad \( 0 lt.eq v lt.eq v_(*) \) . $

Full interval support is what makes the last identity available for every time in $\[ 0 \, v_(*) \]$; the variational identity on the support is also given in [10] Proposition 1.1 and Corollary 3.10. The martingale equation continues beyond $v_(*)$ by direct Itô calculus. Spatial derivatives are continuous under step approximation, so none of these assertions requires time differentiability at a CDF atom.

We will repeatedly use

$ 0 < a \( v \, y \) lt.eq 1 - m \( v \, y \)^2 \, #h(2em) \| m \( v \, y \) \| < 1 . $

Here is the derivative bound in a form suited to step approximation. One step with CDF height $lambda in \[ 0 \, 1 \]$ and variance $delta > 0$ takes a profile $f$ to

$ \( T f \) \( y \) = lambda^(- 1) log bb(E) e^(lambda f \( y + sqrt(delta) U \)) \, #h(2em) U tilde.op N \( 0 \, 1 \) \, $

with $T f \( y \) = bb(E) f \( y + sqrt(delta) U \)$ when $lambda = 0$. Write $bb(E)_lambda$ for the Gaussian expectation tilted by $e^(lambda f \( y + sqrt(delta) U \))$ and normalized to have total mass one. Differentiating gives

$ \( T f \)' = bb(E)_lambda f' \, #h(2em) \( T f \)'' = bb(E)_lambda f'' + lambda "Var"_lambda \( f' \) . $

If $0 < f'' lt.eq 1 - \( f' \)^2$, these formulas imply

$ 0 < \( T f \)'' lt.eq 1 - #scale(x: 120%, y: 120%)[\(] \( T f \)' #scale(x: 120%, y: 120%)[\)]^2 - \( 1 - lambda \) "Var"_lambda \( f' \) lt.eq 1 - #scale(x: 120%, y: 120%)[\(] \( T f \)' #scale(x: 120%, y: 120%)[\)]^2 . $

Inducting from $f \( y \) = log \( 2 cosh y \)$ proves the bound for step CDFs; scalar stability passes the non-strict bound to the minimizing CDF. The positive lower bound for $Phi_(y y)$ in [12] Proposition 2.4 supplies strict positivity in the limit. Hence $m$ is strictly increasing and bounded by one in absolute value, so $\| m \| < 1$. On the extension these assertions follow from $tanh$.

=== 3.2 Tail estimates for the extended diffusion <tail-estimates-for-the-extended-diffusion>

Define the deterministic functions

$ p \( v \) = bb(E) a_v \, #h(2em) r \( v \) = bb(E) a_v^2 \, #h(2em) rho \( v \) = beta sqrt(r \( v \)) . $

The martingale second-moment identity and continuity give $r \( v \) = 1 \/ beta^2$ on $\[ 0 \, v_(*) \]$, including the endpoints. The next lemma controls the continuation and shows that $rho$ is an admissible noise-mixing coefficient.

#thm([Lemma 3.])[
  (Scalar tail bounds).  #emph[For $v gt.eq v_(*)$, the extended diffusion satisfies 
#[#set math.equation(numbering: n => "(1)")
 $ rho \( v \) lt.eq 1 \, #h(2em) - 2 lt.eq \( log r \)' \( v \) lt.eq 0 \,\
p \( v \) = 1 - bb(E) m_v^2 \, #h(2em) p' \( v \) = - r \( v \) \, #h(2em) p \( v \) lt.eq C_beta e^(- v \/ 2) . $ <eq:1>]

 At the endpoint derivatives are understood from the right.]
] <lem:scalar-tail>

#proof[
  We use the transformed-density method of [12] Proposition 7.1 and the moment comparison in [12] Proposition 9.3, giving the required estimates for the arbitrary-time continuation. We first prove two moment ratios. For $v > v_(*)$, the density of $Y_v$ divided by $cosh y$ is symmetric and nonincreasing in $\| y \|$; it is enough to establish the resulting moment inequalities for step CDFs and then pass to the limit. To verify the shape property, take a step CDF with mass $alpha^(\( j \))$ on $\[ v_j \, v_(j + 1) \]$, and write $phi_t$ for the centered Gaussian density of variance $t$. The diffusion transition density on that interval is
  $ K_j \( z \, y \) = phi_(v_(j + 1) - v_j) \( y - z \) exp { alpha^(\( j \)) \[ Phi \( v_(j + 1) \, y \) - Phi \( v_j \, z \) \] } . $
  The Gaussian recursion normalizes this kernel; its Doob transform has drift $alpha^(\( j \)) Phi_y$. In a product of these kernels, the intermediate factors at $y_j$ reduce to
  $ exp { - \( alpha^(\( j \)) - alpha^(\( j - 1 \)) \) Phi \( v_j \, y_j \) } . $
  They are even and nonincreasing in $\| y_j \|$, because the masses are nondecreasing and $Phi$ is even and convex. The first positive-time Gaussian convolution turns the initial point mass at zero into a symmetric decreasing density. Multiplication by the displayed factors and further Gaussian convolutions preserve this property. For convolution, this follows by representing the profiles through their centered-interval level sets. After extending the final mass to one, the endpoint factor is a constant times $cosh y$. Dividing by this factor leaves the asserted symmetric decreasing profile.
  Weighting either the density proportional to $"sech" y$ or that proportional to $"sech"^3 y$ by this decreasing profile can only increase the expectation of $"sech"^2 y$: two nonincreasing functions of $\| y \|$ have nonnegative covariance. Integration by parts gives
  $ frac(integral_(bb(R)) "sech"^(k + 2) y thin d y, integral_(bb(R)) "sech"^k y thin d y) = frac(k, k + 1) #h(2em) \( k > 0 \) . $
  Consequently $r \/ p gt.eq 1 \/ 2$ and $bb(E) a_v^3 \/ r \( v \) gt.eq 3 \/ 4$. The passage from step CDFs is justified by scalar stability.
  On the extension $a_v = 1 - m_v^2$, and direct Itô calculations yield
  $ p' = - r \, #h(2em) r' = 4 r - 6 bb(E) a_v^3 . $
  The two moment ratios imply $p' lt.eq - p \/ 2$ and $r' lt.eq 0$. Since $0 < a_v lt.eq 1$, the second identity also gives $r' gt.eq - 2 r$. Integrating the first differential inequality proves the exponential bound on $p$. Finally $r \( v_(*) \) = 1 \/ beta^2$ and monotonicity imply $rho lt.eq 1$. ◻
]

=== 3.3 Balancing scalar entropy and energy <balancing-scalar-entropy-and-energy>

Let $cal(H) \( z \)$ be the entropy of a sign with mean $z$:

$ cal(H) \( z \) = - frac(1 + z, 2) log frac(1 + z, 2) - frac(1 - z, 2) log frac(1 - z, 2) \, $

with the usual continuous values at $z = plus.minus 1$. Define, for $V > v_(*)$,

$ e \( V \) = integral_0^V sqrt(r \( v \)) thin p \( v \) rho \( v \) thin d v \, #h(2em) j \( V \) = 1 / 2 integral_0^V rho \( v \)^2 bb(E) frac(a_v^2, 1 - m_v^2) thin d v . $

The quantity $e \( V \)$ will be the energy per spin of the matrix proposal; $j \( V \)$ will measure the information acquired through its matrix channel. The independent noise introduced later accounts for the factor $rho \( v \)^2$ in this information cost.

Up to $v_(*)$, Itô’s formula, the PDE and stationarity give

$ bb(E) \[ Y_(v_(*)) m_(v_(*)) \] & = integral_0^(v_(*)) #scale(x: 120%, y: 120%)[\(] p \( v \) + alpha_v v \/ beta^2 #scale(x: 120%, y: 120%)[\)] thin d v \,\
bb(E) Phi \( v_(*) \, Y_(v_(*)) \) & = Phi \( 0 \, 0 \) + 1 / 2 integral_0^(v_(*)) alpha_v v \/ beta^2 thin d v . $

These formulas also follow by step approximation with bounded first and second spatial derivatives. Substitute the endpoint value of $Phi$ and use $cal(H) \( tanh y \) = log \( 2 cosh y \) - y tanh y$ to obtain

#[#set math.equation(numbering: n => "(2)")
 $ integral_0^(v_(*)) p \( v \) thin d v + bb(E) cal(H) \( m_(v_(*)) \) = cal(P) - beta^2 / 4 \( 1 - q_(*) \)^2 . $ <eq:2>]

#thm([Lemma 4.])[
  (Entropy–energy identity).  #emph[For every $V > v_(*)$, 
#[#set math.equation(numbering: n => "(3)")
 $ log 2 - j \( V \) + beta e \( V \) = cal(P) - beta^2 / 4 p \( V \)^2 . $ <eq:3>]

]
] <lem:scalar-balance>

#proof[
  The same martingale calculation applied to binary entropy yields
  $ 1 / 2 integral_0^(v_(*)) bb(E) frac(a_v^2, 1 - m_v^2) thin d v = log 2 - bb(E) cal(H) \( m_(v_(*)) \) . $
  Localization justifies Itô’s formula near $plus.minus 1$; the integrand is bounded because $a lt.eq 1 - m^2$. As $rho = 1$ and $beta sqrt(r) = 1$ on $\[ 0 \, v_(*) \]$, these identities prove (3) at $V = v_(*)$. Above $v_(*)$, the derivative of its left side is $\( beta^2 \/ 2 \) r \( v \) p \( v \)$. Indeed $a_v = 1 - m_v^2$ there. The derivative of $- beta^2 p \( v \)^2 \/ 4$ is the same, by $p' = - r$. Integration proves the claim for every $V > v_(*)$. ◻
]

The terminal error in (3) is at most $C_beta e^(- V)$. We will take $V$ proportional to $log n$, so that this error is a negative power of the dimension while the scalar spin is nearly pinned.

== 4 A Gaussian-query proposal <sec:proposal>

We now construct a spin using the Gaussian matrix and auxiliary randomness. Each matrix query is orthogonal to the earlier queries. This exposes fresh Gaussian information while leaving a compressed GOE block unrevealed. The scalar identity of Section 3 will then control both the relative entropy of the resulting law and its likelihood outside a small exceptional event.

=== 4.1 Construction and conditional Gaussian laws <construction-and-conditional-gaussian-laws>

Successive Gaussian revelations along orthogonalized directions occur in the iterative TAP construction [4] Sections 2–3. Incremental approximate message passing uses related Parisi-guided normalized increments with asymptotic orthogonality [14] Sections 2–3. Here we give an exact conditional-law argument for our finite mesh, including the auxiliary noises that complete each increment.

Fix $0 < l lt.eq 1 \/ 100$ and define

$ h = n^(- 1 \/ 16) \, #h(2em) K = ceil.l l log n \/ h ceil.r \, #h(2em) t_k = k h \, #h(2em) V = t_K . $

All assertions below are for sufficiently large $n$, so $K < n$ and $V > v_(*)$. The disorder $G$ has its ordinary Gaussian law. We construct a vector process with coordinates following the scalar SDE, using

#[#set math.equation(numbering: n => "(4)")
 $ d Z = rho \( v \) thin d B + sqrt(1 - rho \( v \)^2) thin d D . $ <eq:4>]

Here $D$ is an independent auxiliary Brownian motion. The stream $B$ is constructed from matrix queries and auxiliary completions so that, after averaging over the disorder, $\( B \, D \)$ has independent standard Brownian coordinates. The weight $rho$ equals one up to $v_(*)$ and is nonincreasing afterward. The continuation therefore reduces the share of the query-generated stream while keeping unit variance in $Z$. Put $M \( v \)_i = m \( v \, Y_(v \, i) \)$.

On $\[ 0 \, h \]$, generate $B$ entirely from independent auxiliary Brownian noise. For each subsequent interval $\[ t_k \, t_(k + 1) \]$, $1 lt.eq k < K$, the previous scalar increment determines

$ s_k^2 = integral_(t_(k - 1))^(t_k) r \( v \) thin d v \, #h(2em) T_k = frac(M \( t_k \) - M \( t_(k - 1) \), s_k) . $

Project $T_k$ off the preceding query directions $u_1 \, dots.h \, u_(k - 1)$, and normalize the residual to obtain $\| u_k \|_n = 1$. If the residual is zero, choose a new direction measurably from the past: project the coordinate basis vectors in their fixed order, take the first nonzero projection, and normalize it. Since $k < n$, such a direction exists. Let $Pi_(lt.eq k)$ be the orthogonal projection onto the span through $u_k$, and write $Pi_(> k) = I - Pi_(lt.eq k)$.

Query the column $W u_k$. For an independent standard Gaussian vector $z_k$, set the endpoint of the next Brownian increment to be

$ g_k = h^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] B \( t_(k + 1) \) - B \( t_k \) #scale(x: 120%, y: 120%)[\)] = Pi_(> k) W u_k + Pi_(lt.eq k) z_k . $

Fill the interval with linear interpolation between its endpoints plus an independent centered Brownian bridge. Every new bridge and completion noise is fresh. Deterministic-coefficient integrals against this filled path may equivalently be obtained by conditioning Brownian motion on its endpoint. At time $V$, draw the spins independently given the path, with means $M_i \( V \)$. Call the marginal law of $\( G \, x \)$ obtained this way $Q_l$.

To verify the stated Brownian law, condition on the previously revealed columns and the auxiliary inputs already used. Gaussian orthogonal invariance leaves the unqueried block GOE on the orthogonal complement, with the original variance scale. The next direction is measurable with respect to this past. In an orthonormal basis beginning with $u_k \/ sqrt(n)$, the new diagonal entry, the remaining entries of that column, and the next compressed block are independent. Therefore $Pi_(> k) W u_k$ is a fresh Gaussian with covariance $Pi_(> k)$, and

$ d_k = chevron.l u_k \, W u_k chevron.r_n tilde.op N \( 0 \, 2 \/ n \) $

conditionally before the column is revealed. The independent completion has covariance $Pi_(lt.eq k)$, so $g_k$ is a fresh standard Gaussian vector. Induction, followed by the independent bridge filling, proves the assertion about $\( B \, D \)$ in (4).

In particular, after forgetting the matrix, the coordinate paths and their final spins are independent and identically distributed. The conditional mean of $x$ given the Brownian streams through time $v$ is $M \( v \)$. Its unconditional law is uniform on the cube by the symmetry of the scalar process. The spin marginal of $P$ is also uniform, by coordinate-sign symmetry of the disorder. These facts concern marginals; the proposal spin remains correlated with its matrix.

=== 4.2 Entropy and likelihood estimates <entropy-and-likelihood-estimates>

The following proposition supplies two distinct comparisons. Entropy will yield coverage after smoothing. The likelihood estimate will keep intermediate proposals out of the small boundary of a putative low-flow cut.

#thm([Proposition 5.])[
  (Proposal comparison).  #emph[For every fixed $0 < l lt.eq 1 \/ 100$ and all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(5)")
 $ upright("KL") \( Q_l bar.v.double P \) lt.eq 2 n^(1 - l \/ 2) . $ <eq:5>]

 There is an event in the proposal experiment of probability at least $1 - exp \( - n^(1 - 10 l) \)$ such that the output subprobability restricted to this event is dominated, on the space of $\( G \, x \)$, by 
#[#set math.equation(numbering: n => "(6)")
 $ exp \( n^(1 - l \/ 2) \) P . $ <eq:6>]

 The empirical Gram matrix of the $T_k$ is within $n^(- l)$ of the identity in operator norm, except with probability at most $exp \( - n^(1 - 10 l) \)$. The dimension required for these estimates may depend on the fixed $l$.]
] <prop:proposal>

#proof[
  Put $eta = n^(- l)$. We first evaluate the proposal energy from empirical inner products, then compute the information cost of its matrix channel. The pressure bound and (3) combine these estimates.
  ===== 4.2.1 Empirical inner products. <empirical-inner-products.>
  Form the empirical matrix of all normalized inner products among $T_k \, g_k$ ($1 lt.eq k < K$) and $x$. It is an average of $n$ iid row outer products, by the coordinate law just proved. Every unit linear form of a row has sub-Gaussian norm at most $C_beta e^V$. For the $T_k$ part, use their disjoint martingale increments, $\| a \| lt.eq 1$, and
  $ s_k^2 gt.eq c_beta h e^(- 2 V) \, $
  which follows from (1). An exponential martingale estimate then bounds the linear form by its deterministic quadratic-variation bound. The $g_k$ part is Gaussian and the spin term is bounded; their correlations with the first part do not affect the resulting sub-Gaussian bound.
  For completeness, squared linear forms have moments bounded by $k ! \( C_beta e^(2 V) \)^k$. Expanding the centered exponential moment and applying exponential Markov gives, at deviation scale $eta \/ 2$, a quadratic-form tail bounded by
  $ 2 exp \( - c_beta n eta^2 e^(- 4 V) \) . $
  A $1 \/ 4$-net of the unit sphere in dimension $O \( K \)$ has $exp \( O \( K \) \)$ points, by ball packing. The quadratic-form norm inequality and a union bound therefore put the entire empirical matrix within $eta$ of its expectation, with exceptional probability at most $exp \( - n^(1 - 8 l) \)$.
  The population identities are
  $ bb(E) \[ T_j T_k \]_(upright("row")) = upright(bold(1))_(j = k) \, #h(2em) bb(E) \[ T_j g_k \]_(upright("row")) = 0 quad \( j lt.eq k \) \,\
bb(E) \[ T_k x \]_(upright("row")) = s_k \, #h(2em) bb(E) \[ g_k x \]_(upright("row")) = b_k := h^(- 1 \/ 2) integral_(t_k)^(t_(k + 1)) p \( v \) rho \( v \) thin d v . $
  They follow from the martingale bracket, the conditional mean of the final spin, and (4). The vectors $s = \( s_k \)$ and $b = \( b_k \)$ each have Euclidean norm at most one, by projection of the unit-variance spin onto the corresponding orthonormal scalar variables.
  We need matrix-norm estimates that do not lose a factor $K$ under orthogonalization. Taking the triangular part of an $m times m$ matrix has operator-norm cost at most $C log \( 2 m \)$. To see this, pad to a power of two and partition the strict triangle by dyadic scales. At each scale the rectangles have disjoint row and column sets, so retaining that scale is contractive; summing over scales proves the bound.
  Let $A$ be a Gram matrix with $parallel A - I parallel lt.eq eta < 1 \/ 2$, and let $R^(sans(T)) R = A$ be its upper Cholesky factor. Along $A \( t \) = I + t \( A - I \)$, differentiation shows that $dot(R) R^(- 1)$ is the upper triangular part, with half its diagonal, of $R^(- sans(T)) dot(A) R^(- 1)$. The norms of $R$ and $R^(- 1)$ are uniformly bounded. The preceding triangular estimate and integration give $parallel R - I parallel lt.eq C eta log \( 2 m \)$. Differentiability follows directly from the triangular Cholesky recursion.
  Apply this with the Gram matrix of the $T_k$. The query matrix with columns $u_k$ is the matrix with columns $T_k$, multiplied by $R^(- 1)$. Thus, writing $c_k = chevron.l u_k \, x chevron.r_n$, the empirical event gives
  $ parallel c - s parallel & lt.eq C eta log \( 2 K \) \,\
∥#scale(x: 120%, y: 120%)[\(] upright(bold(1))_(j lt.eq k) chevron.l u_j \, g_k chevron.r_n #scale(x: 120%, y: 120%)[\)]_(j k)∥ & lt.eq C eta log \( 2 K \) \,\
parallel \( chevron.l g_k \, x chevron.r_n \)_k - b parallel & lt.eq eta . $
  For the middle estimate, left multiplication of the population cross matrix by the lower triangular $R^(- sans(T))$ preserves its zero upper triangle, including the diagonal. Also $parallel c parallel lt.eq 1$, because the query directions are orthonormal in the normalized inner product.
  ===== 4.2.2 Energy of the final spin. <energy-of-the-final-spin.>
  Let $H_0 = Pi_(> K - 1)$. Revealing the successive columns decomposes the quadratic form exactly as
  $ frac(hat(H)_G \( x \), n) = sum_k c_k chevron.l x \, Pi_(> k) g_k chevron.r_n + 1 / 2 sum_k c_k^2 d_k + 1 / 2 chevron.l x \, H_0 W H_0 x chevron.r_n . $
  The last two terms are $O \( eta \)$ outside an event of probability at most $C K exp \( - c n eta^2 \)$. The diagonal estimate follows from the conditional Gaussian law and $sum c_k^2 lt.eq 1$. For the residual term, the spin has not used the unrevealed block, so its quadratic form has the required conditional Gaussian tail.
  Removing the projections in the first term costs at most $C eta log \( 2 K \)$ by the triangular matrix bound above. Its remaining value is $s dot.op b$ up to the same error. The bound on $\( log r \)'$ implies that $s_k \/ sqrt(h)$ differs from $sqrt(r \( v \))$ on $\[ t_k \, t_(k + 1) \]$ by a relative $O \( h \)$. The missing initial interval contributes $O \( h \)$, and $e \( V \)$ is bounded. Hence $s dot.op b = e \( V \) + O_beta \( h \)$, and altogether
  #[#set math.equation(numbering: n => "(7)")
   $ hat(H)_G \( x \) \/ n = e \( V \) + O_beta \( h + eta log \( 2 K \) \) . $ <eq:7>]
  This is the energy contribution to the comparison. We next isolate the entropy paid for the matrix information alone.
  ===== 4.2.3 The auxiliary reference law. <the-auxiliary-reference-law.>
  Start on an enlarged path space with an independent uniform spin $x$, the ordinary Gaussian disorder, and all the unconditioned proposal inputs. Call this the unlinked experiment. To obtain the actual proposal, multiply its density by
  $ product_i \( 1 + x_i m \( V \, Y_(V \, i) \) \) . $
  For fixed $x$, the scalar martingale shows that this is a stochastic exponential with coordinate integrands
  $ xi_i \( v \) = frac(x_i a \( v \, Y_(v \, i) \), 1 + x_i m \( v \, Y_(v \, i) \)) \, #h(2em) \| xi_i \( v \) \| lt.eq 2 \, $
  against the streams $Z_i$ in (4). Call the resulting law the linked experiment. Summing the linking density over the uniform spin shows that the path and disorder marginal is unchanged.
  For a continuous local martingale $N$ starting at zero, write $cal(E) \( N \)_V = exp \( N_V - chevron.l N chevron.r_V \/ 2 \)$. The linking density factors as $E_B E_D$, where
  $ E_B & = cal(E) (sum_i integral_0^dot.op xi_i rho thin d B_i)_V \,\
E_D & = cal(E) (sum_i integral_0^dot.op xi_i sqrt(1 - rho^2) thin d D_i)_V . $
  This product identity uses the zero quadratic covariation of $B$ and $D$. Define the auxiliary reference to have density $E_D$ relative to the unlinked law. Its $\( G \, x \)$ marginal is still the independent product of Gaussian disorder and uniform spin. The conditional mean-one assertion behind this fact needs a filtration check, because the matrix-query endpoints depend on the past of $D$.
  Let $cal(A)$ contain all primitive auxiliary inputs other than $D$, and under the unlinked law set
  $ cal(F)_v = sigma \( x \, B_(\[ 0 \, v \]) \, D_(\[ 0 \, v \]) \) \, #h(2em) cal(G)_v = sigma \( x \, G \, cal(A) \, D_(\[ 0 \, v \]) \) . $
  Interval by interval, every query direction is determined by past $D$ and the information in $cal(G)_0$. Each new endpoint and its entire bridge are then known before using the current $D$ increment. Deterministic-coefficient bridge integrals can be formed as linear Gaussian integrals, with the endpoint term fixed by that past. Thus $cal(F)_v subset.eq cal(G)_v$. One can also see the inclusion pathwise: $rho = 1$ before $v_(*)$, and (1) gives $- rho lt.eq rho' lt.eq 0$ afterward, so $rho$ has bounded variation. The identity $integral rho thin d B = rho B - integral B thin d rho$, applied on successive intervals, uses no future $D$.
  The pair $\( B \, D \)$ is Brownian in $cal(F)$, whereas $D$ is Brownian in $cal(G)$ since its time-zero information is independent of $D$. The bounded continuous $D$ integrand has the same stochastic integral in these two filtrations: its identical left-endpoint approximations converge in $L^2$ by the Itô isometry. The bounded-integrand exponential-martingale theorem in $cal(G)$ now gives conditional mean one given $\( x \, G \, cal(A) \)$. This proves the claimed marginal for the auxiliary reference. All subsequent Brownian changes of measure use $cal(F)$; no Brownian property for $B$ in the enlarged filtration is required.
  ===== 4.2.4 Information cost and likelihood. <information-cost-and-likelihood.>
  The density of the linked experiment relative to the auxiliary reference is $E_B$. Its logarithm is
  $ L = log E_B = sum_i (integral_0^V xi_i rho thin d B_i - 1 / 2 integral_0^V xi_i^2 rho^2 thin d v) . $
  Under the linked law, compensate the $B_i$ drift by $rho xi_i$. The resulting centered integral has bracket at most $4 n V$ and hence has exponential-martingale tails. The remaining half-bracket is a sum of independent coordinate variables bounded by $2 V$ each. Coordinate independence holds after linking because the linking density factors across the iid coordinate streams and uniform spins. Moreover, conditional on the streams through time $v$, the linked spin has probabilities $\( 1 plus.minus m \( v \, Y_(v \, i) \) \) \/ 2$. It follows that
  $ bb(E) L = n j \( V \) \, #h(2em) L = n j \( V \) + O \( n eta \) $
  except with probability at most $exp \( - n^(1 - 4 l) \)$ for large $n$. The centered integral is controlled by exponential Markov; the half-bracket by bounded-variable concentration. The Brownian drift change itself follows either from Girsanov’s theorem for bounded integrands or from bounded predictable step approximation and the mean-one exponential identities.
  Change the auxiliary reference a second time, multiplying only by the density of $P$ relative to independent disorder and uniform spin. The new reference has $\( G \, x \)$ marginal $P$, and the log density of the linked experiment relative to it is
  $ L - n log 2 + F \( G \) - beta hat(H)_G \( x \) . $
  Differentiating the log partition function gives a Gaussian Lipschitz constant at most $C_beta sqrt(n)$. The Gaussian concentration inequality [5] Section 5.4, Theorem 5.6 and the pressure bound therefore imply
  $ F \( G \) lt.eq n cal(P) + n eta $
  outside an event of probability at most $2 exp \( - c_beta n eta^2 \)$. This uses the ordinary Gaussian marginal of $G$, which remains unchanged after linking.
  Substitute (3), (7), and $p \( V \)^2 lt.eq C_beta e^(- V)$ into the log density. On the events just proved, it is at most
  $ C_beta n #scale(x: 120%, y: 120%)[\(] h + eta log \( 2 K \) + e^(- V) #scale(x: 120%, y: 120%)[\)] = o #scale(x: 120%, y: 120%)[\(] n^(1 - l \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  Indeed, $V = l log n + O \( h \)$, $log \( 2 K \) = O \( log n \)$, and $0 < l lt.eq 1 \/ 100 < 1 \/ 16$. The union of the exceptional events has probability at most $exp \( - n^(1 - 10 l) \)$ for sufficiently large $n$. Taking the restricted output marginal gives (6). Its good event is defined entirely from the inputs of this one proposal run.
  Finally, the same comparison in expectation proves (5) by contraction of relative entropy under marginalization. The exceptional paths contribute negligibly: $L$ has second moment $O \( n^2 \( 1 + V \)^2 \)$, and the supremum of the absolute spin energies has second moment $O \( n^2 \)$ by Gaussian tails and a union bound. The log partition function is bounded by $n log 2$ plus that energy supremum. Cauchy–Schwarz controls all exceptional contributions. The Gram estimate was already established in the first part of the proof. ◻
]

== 5 Smoothing and reverse comparison <sec:reverse>

Proposition 5 controls $upright("KL") \( Q_l bar.v.double P \)$. For coverage we need the opposite direction: a set of appreciable Gibbs mass must receive a quantitative amount of proposal mass. Conditioning on the spin makes the Gibbs disorder law strongly log-concave. A small Gaussian smoothing then turns the forward comparison into the required reverse bound.

For the remainder of the proof fix

$ f = 1 \/ 100 \, #h(2em) d = f \/ 100 \, #h(2em) b = d \/ 100 \, #h(2em) delta = n^(- f \/ 4) . $

The longer proposal horizon $l = f$ will provide coverage of sets with Gibbs mass at least $n^(- d)$. We reserve the shorter horizon $l = b$ for Section 6, where its stronger exceptional-event estimate will control a sequence of proposals. For any joint law of disorder and spin, define $cal(S)$ by retaining the spin and replacing its disorder by

$ G^compose = sqrt(1 - delta) thin G + sqrt(delta) thin macron(G) \, $

where $macron(G)$ is an independent standard Gaussian vector. Both $cal(S) P$ and $cal(S) Q_f$ have standard Gaussian disorder marginal. Denote the conditional spin kernel of $cal(S) Q_f$ by $nu \( dot.op divides G^compose \)$. Gaussian regression gives a useful way to generate it: given $G^compose$, run the $l = f$ proposal on $sqrt(1 - delta) thin G^compose + sqrt(delta) thin G'$, using fresh independent standard Gaussian $G'$ and independent auxiliary inputs.

=== 5.1 Why smoothing reverses the entropy comparison <why-smoothing-reverses-the-entropy-comparison>

We prove

#[#set math.equation(numbering: n => "(8)")
 $ upright("KL") \( cal(S) P bar.v.double cal(S) Q_f \) lt.eq delta^(- 1) upright("KL") \( Q_f bar.v.double P \) . $ <eq:8>]

The two unsmoothed laws have the same uniform spin marginal. Given $x$, the conditional disorder density under $P$ has negative logarithm, up to a normalizing constant,

$ U_x \( G \) = 1 / 2 parallel G parallel^2 - beta hat(H)_G \( x \) + F \( G \) . $

Its Hessian is at least the identity: the Hamiltonian is linear in $G$, while $F$ is a convex log-sum-exp of linear functions.

We need the following consequence of this convexity. A law $mu$ with density proportional to $e^(- U)$, where $nabla^2 U gt.eq I$, and a law $lambda lt.double mu$ admit couplings whose mean squared displacement is at most $2 upright("KL") \( lambda bar.v.double mu \)$, or tends to that bound. This is the quadratic transport inequality; its triangular-transport form appears in [3] Corollary 3.10. We recall the proof for the finite-dimensional densities used here.

First restrict to a box and suppose both densities are smooth and strictly positive up to its boundary. Map $mu$ to $lambda$ by successive increasing conditional quantile maps. The resulting triangular map $T$ has positive diagonal derivatives, whose product is its Jacobian determinant. The entropy formula is

$ upright("KL") \( lambda bar.v.double mu \) = integral #scale(x: 120%, y: 120%)[\(] U \( T \( z \) \) - U \( z \) - log det nabla T \( z \) #scale(x: 120%, y: 120%)[\)] thin d mu \( z \) . $

Strong convexity bounds the first difference below by $nabla U \( z \) dot.op \( T \( z \) - z \) + 1 / 2 parallel T \( z \) - z parallel^2$. Integration by parts replaces the linear term by $"div" \( T - upright("id") \)$. There is no boundary term: on a face where the $i$th coordinate is an endpoint of the box, its conditional quantile map fixes that endpoint, so the normal component $T_i - z_i$ vanishes. Tangential motion does not matter. The remaining Jacobian terms are nonnegative because $z - 1 - log z gt.eq 0$ for every positive diagonal derivative $z$. This proves the coupling bound on the box.

The densities needed here satisfy the approximation requirements. For fixed $n$, the conditional proposal density is bounded by a constant times Gaussian density, since its spin probability is at most one. Truncate both conditional laws to increasing boxes and normalize them. On each box approximate $lambda$ by smoothing and mixing with a small positive constant density. Its density is bounded, and the smooth reference density is bounded away from zero on the box, so their relative entropies with respect to the reference converge. The original laws have Gaussian tails up to constants for fixed $n$, and finite relative entropy. Thus the truncated entropies converge; tightness and lower semicontinuity pass the coupling bound to the original laws.

Apply this result with $mu = P \( dot.op divides x \)$ and $lambda = Q_f \( dot.op divides x \)$. For any coupling of two disorder values $g \, tilde(g)$, the Gaussian smoothing kernels satisfy

$ upright("KL") #scale(x: 120%, y: 120%)[\(] N \( sqrt(1 - delta) thin g \, delta I \) bar.v.double N \( sqrt(1 - delta) thin tilde(g) \, delta I \) #scale(x: 120%, y: 120%)[\)] = frac(1 - delta, 2 delta) parallel g - tilde(g) parallel^2 . $

The convolution comparison is also recorded in [13] Lemma 11. Joint convexity of entropy bounds the divergence between the mixtures by this averaged kernel quantity. Average over the common spin marginal and use the entropy chain rule. The transport bound then proves (8).

=== 5.2 Coverage conditional on a target and its base <coverage-conditional-on-a-target-and-its-base>

The smoothed entropy comparison is still a joint-law statement. We now convert it to a statement for the original Gibbs law at a realized target disorder. The following proposition records both the entropy estimate and the coverage consequence used in the next section.

#thm([Proposition 6.])[
  (Coverage at a target disorder).  #emph[Let $G \, macron(G)$ be independent standard Gaussian disorder vectors, set $G^compose = sqrt(1 - delta) thin G + sqrt(delta) thin macron(G)$, and let $nu \( dot.op divides G^compose \)$ be the conditional spin kernel of $cal(S) Q_f$ defined above. Then 
#[#set math.equation(numbering: n => "(9)")
 $ bb(E) thin upright("KL") #scale(x: 120%, y: 120%)[\(] pi_G bar.v.double nu \( dot.op divides G^compose \) #scale(x: 120%, y: 120%)[\)] lt.eq O_beta \( n sqrt(delta) \) + 2 n^(1 - f \/ 2) \/ delta . $ <eq:9>]

 With probability tending to one over this target/base pair, 
#[#set math.equation(numbering: n => "(10)")
 $ upright("KL") #scale(x: 120%, y: 120%)[\(] pi_G bar.v.double nu \( dot.op divides G^compose \) #scale(x: 120%, y: 120%)[\)] lt.eq n^(1 - 4 d) . $ <eq:10>]

 On the same event, simultaneously for every set $A subset.eq { - 1 \, 1 }^n$ with $pi_G \( A \) gt.eq n^(- d)$, 
$ nu \( A divides G^compose \) gt.eq exp \( - n^(1 - 2 d) \) . $

 The set $A$ may be chosen after the target and base are realized.]
] <prop:coverage>

#proof[
  Let $overline(pi) \( dot.op divides G^compose \)$ be the conditional spin law of $cal(S) P$, namely the conditional mixture of $pi_G$. Inserting this law into the logarithmic ratio gives the exact decomposition
  $ bb(E) thin upright("KL") #scale(x: 120%, y: 120%)[\(] pi_G bar.v.double nu \( dot.op divides G^compose \) #scale(x: 120%, y: 120%)[\)] & = bb(E) thin upright("KL") #scale(x: 120%, y: 120%)[\(] pi_G bar.v.double overline(pi) \( dot.op divides G^compose \) #scale(x: 120%, y: 120%)[\)]\
 & quad + upright("KL") \( cal(S) P bar.v.double cal(S) Q_f \) . $
  Both expectations are over the target/base pair in the statement. The conditional mixture minimizes averaged divergence among spin laws depending only on the base. The first term on the right is therefore at most $bb(E) upright("KL") \( pi_G bar.v.double pi_(G^compose) \)$.
  For any two Hamiltonians the Gibbs divergence is bounded by twice $beta$ times the supremum of their absolute energy difference. Here those differences, for each fixed spin, are centered Gaussians with variance $O \( n delta \)$. A union bound, or exponential moments over the $2^n$ spins, bounds the expected supremum by $O \( n sqrt(delta) \)$. Combining this estimate with (8) and (5) proves (9).
  Since $4 d < f \/ 8$ and $4 d < f \/ 4$, Markov’s inequality applied to (9) gives (10) with probability tending to one. On this single event, let $A$ be any set with $pi_G \( A \) gt.eq n^(- d)$. For $s = pi_G \( A \)$ and $t = nu \( A divides G^compose \)$, entropy contraction to the two-point partition gives $s log \( 1 \/ t \) lt.eq upright("KL") \( pi_G bar.v.double nu \) + log 2$. Hence
  $ log \( 1 \/ t \) lt.eq n^d \( n^(1 - 4 d) + log 2 \) lt.eq n^(1 - 2 d) $
  for sufficiently large $n$. The implication is deterministic once the target and base are fixed, which proves the simultaneous assertion. ◻
]

== 6 Connecting proposals across a cut <sec:connections>

For distinct spins $x \, y$, write $c_G \( x \, y \)$ for the heat-bath jump rate. The stationary flow across a set $S$ is

$ Q_G^(upright("edge")) \( S \, S^(upright(c)) \) = sum_(x in S \, thin y in.not S) pi_G \( x \) c_G \( x \, y \) . $

Detailed balance makes the edge weights symmetric. We will show that this flow cannot be too small when both sides carry appreciable Gibbs mass. The proof joins two proposals with a common smoothing base, then uses coverage to place their endpoints across the cut and the likelihood estimate to keep the connecting configurations away from its boundary.

#thm([Proposition 7.])[
  (Balanced-cut flow).  #emph[With probability tending to one in the target disorder, 
#[#set math.equation(numbering: n => "(11)")
 $ Q_G^(upright("edge")) \( S \, S^c \) > B_min := exp \( - n^(1 - b \/ 20) \) quad upright("for every ") S upright(" such that ") min \( pi_G \( S \) \, pi_G \( S^c \) \) gt.eq n^(- d) . $ <eq:11>]

]
] <prop:cuts>

#proof[
  We divide the argument into the geometry of a putative low-flow cut, the construction of a proposal sequence, and the two estimates that make this sequence impossible.
  ===== 6.1 A low-flow cut has a small enlarged boundary. <a-low-flow-cut-has-a-small-enlarged-boundary.>
  For a sufficiently large fixed $C$, Gaussian quadratic-form tails on a $1 \/ 4$-net give $parallel W \( G \) parallel lt.eq C$ except with probability $O \( e^(- c n) \)$. On this event, every one-spin energy difference is $O \( sqrt(n) \)$. The heat-bath rate across any one-spin edge is therefore at least $exp \( - O_beta \( sqrt(n) \) \)$. If a cut has flow at most $B_min$, its two-sided vertex boundary $partial S$ consequently has Gibbs mass at most $2 B_min exp \( O_beta \( sqrt(n) \) \)$.
  Set $R_n = ceil.l n^(1 - b \/ 4) ceil.r$ and enlarge this boundary by Hamming distance $R_n$. For two spins at that distance, $parallel W \( G \) parallel lt.eq C$ and their Euclidean distance bound the logarithmic Gibbs weight ratio by $O_beta \( n^(1 - b \/ 8) \)$. A Hamming ball of radius $R_n$ has logarithmic cardinality $O \( n^(1 - b \/ 4) log n \)$. The enlarged boundary therefore has target Gibbs mass at most
  #[#set math.equation(numbering: n => "(12)")
   $ exp \( - 1 / 2 n^(1 - b \/ 20) \) . $ <eq:12>]
  Among cuts violating (11), select the first one in a fixed ordering whenever such a cut exists and $parallel W \( G \) parallel lt.eq C$. Let $cal(D) \( G \)$ be its enlarged boundary, and set $cal(D) \( G \) = diameter$ otherwise. This is a measurable selection because the cube has finitely many subsets. Let $cal(E)$ be the event that a witness exists, the target norm bound holds, and (10) holds for the sampled base $G^compose$. The norm and coverage estimates reduce the proposition to proving $Pr \( cal(E) \) = o \( 1 \)$.
  ===== 6.2 A sequence with independent fine endpoints. <a-sequence-with-independent-fine-endpoints.>
  The fine horizon $l = f$ and the coarse horizon $l = b$ serve different purposes. On $cal(E)$, Proposition 6 gives each side of the cut fine-proposal probability at least $exp \( - n^(1 - 2 d) \)$. Two conditionally independent fine endpoints therefore cross the cut with probability at least $exp \( - 2 n^(1 - 2 d) \)$. We need an unconditional bound on failures of the connecting sequence that is smaller than this endpoint probability. The available fine-horizon exception bound $exp \( - n^(1 - 10 f) \)$ is not strong enough for this comparison; the coarse bound $exp \( - n^(1 - 10 b) \)$ is, since $10 b < d \/ 2 < 2 d$. We therefore use fine spins at the endpoints and coarse spins along the grid. Their shared path prefixes and the magnetization martingale will keep each fine endpoint close to its coarse output.
  Given the target $G$ and base $G^compose$, introduce independent standard Gaussian vectors $G'_1 \, G'_2$, independent of both, and set
  $ G \( theta \) = sqrt(1 - delta) thin G^compose + sqrt(delta) \( cos theta thin G'_1 + sin theta thin G'_2 \) \, #h(2em) 0 lt.eq theta lt.eq pi \/ 2 . $
  Use a deterministic equally spaced grid including $0 \, pi \/ 2$, with spacing $O \( exp \( - n^(1 \/ 4) \) \)$ and cardinality $O \( exp \( n^(1 \/ 4) \) \)$. Rotate two independent collections of all auxiliary Gaussian path inputs by the same cosine-sine rule. At each grid point, run the proposal to the coarse horizon
  $ V_b = h ceil.l b log n \/ h ceil.r $
  and draw its coarse spin. At each endpoint, also continue the path to $V_f = h ceil.l f log n \/ h ceil.r$ and draw a fine spin. Coarse spin draws are not used in the continuation. All final spin draws may use fresh independent randomness.
  The two fine endpoint spins are independent conditional on $\( G \, G^compose \)$ and have law $nu \( dot.op divides G^compose \)$. For each individual angle, averaging the disorder and auxiliary inputs gives the appropriate proposal law. Its primitive auxiliary collection is independent of all the target, base, and proposal matrix drivers. The one-point estimates and their union bound require no independence across grid points. The shared rotation will instead supply the nearby inputs needed for continuity along the grid.
  We prove that, outside an event of probability at most $exp \( - n^(1 - d \/ 2) \)$, the following two properties hold:
  + Every coarse spin avoids $cal(D) \( G \)$.
  + The sequence formed by the first fine spin, all coarse spins in grid order, and the last fine spin has consecutive Hamming distances at most $R_n$.
  The probability here is unconditional. Figure 1 shows the deterministic obstruction these properties create when the fine endpoints lie on opposite sides of a cut.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.05, -0.75), (7.3, 0.9), fill: rgb("#f7f7f7"), stroke: none)
  rect((7.3, -0.75), (13.5, 0.9), fill: rgb("#f7f7ff"), stroke: none)
  line((7.3, -0.75), (7.3, 0.9), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((3.6, 0.63), [#text(size: 9pt)[$S$]])
  content((10.4, 0.63), [#text(size: 9pt)[$S^( upright(c) )$]])
  rect((0.375, -0.275), (0.925, 0.275), fill: rgb("#e0e0e0"), stroke: (paint: rgb("#333333"), thickness: 0.8pt, miter-limit: 10))
  circle((2.5, 0), radius: 0.275, fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  circle((4.4, 0), radius: 0.275, fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  circle((6.3, 0), radius: 0.275, fill: rgb("#ffebeb"), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  circle((8.3, 0), radius: 0.275, fill: rgb("#ffebeb"), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  circle((10.3, 0), radius: 0.275, fill: rgb("#ffffff"), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  rect((12.53, -0.275), (13.08, 0.275), fill: rgb("#e0e0e0"), stroke: (paint: rgb("#333333"), thickness: 0.8pt, miter-limit: 10))
  line((0.925, 0), (2.211, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((2.5, 0), (2.5, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((2.789, 0), (4.111, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, 0), (4.4, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((4.689, 0), (6.004, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.596, 0), (8.004, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((8.596, 0), (10.01, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((10.3, 0), (10.3, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((10.59, 0), (12.53, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.596, 0), (8.004, 0), stroke: (paint: rgb("#a60000"), thickness: 1.1pt, miter-limit: 10))
  content((0.65, -0.375), [#text(size: 9pt)[$x_( upright(f) )^((0))$]], anchor: "north", padding: 0.1176cm)
  content((12.8, -0.375), [#text(size: 9pt)[$x_( upright(f) )^((1))$]], anchor: "north", padding: 0.1176cm)
  content((6.3, -0.3962), [#text(size: 9pt)[$u$]], anchor: "north", padding: 0.1176cm)
  content((8.3, -0.3962), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  content((7.3, 0.48), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$d_H(u,v) lt.eq R$]]])])
  content((6.7, -1.12), [#text(size: 9pt)[Every step has a coarse endpoint; coarse outputs avoid $cal(D)_R$.]])
  content((7.3, -1.85), [#text(size: 9pt)[Expand the crossing step into single-spin flips: length $ell lt.eq R$.]])
  line((7.3, -2.25), (7.3, -3.4), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  circle((3.8, -2.85), radius: 0.275, fill: rgb("#ffebeb"), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  circle((4.9, -2.85), radius: 0.09, fill: rgb("#595959"), stroke: none)
  circle((6.2, -2.85), radius: 0.15, fill: rgb("#ffebeb"), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  circle((8.4, -2.85), radius: 0.15, fill: rgb("#ffebeb"), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  circle((9.7, -2.85), radius: 0.09, fill: rgb("#595959"), stroke: none)
  circle((10.8, -2.85), radius: 0.275, fill: rgb("#ffebeb"), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((4.096, -2.85), (4.803, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((4.9, -2.85), (4.9, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((4.997, -2.85), (6.036, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.364, -2.85), (8.236, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((8.564, -2.85), (9.603, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((9.7, -2.85), (9.7, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((9.797, -2.85), (10.5, -2.85), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((6.364, -2.85), (8.236, -2.85), stroke: (paint: rgb("#a60000"), thickness: 1.1pt, miter-limit: 10))
  content((7.3, -2.65), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[boundary edge]]], anchor: "south", padding: 0.1176cm)
  content((3.8, -3.246), [#text(size: 9pt)[$u=y_0$]], anchor: "north", padding: 0.1176cm)
  content((6.2, -3.114), [#text(size: 9pt)[$y_t$]], anchor: "north", padding: 0.1176cm)
  content((8.4, -3.114), [#text(size: 9pt)[$y_(t+1)$]], anchor: "north", padding: 0.1176cm)
  content((10.8, -3.246), [#text(size: 9pt)[$v=y_ ell$]], anchor: "north", padding: 0.1176cm)
  content((2.65, -2.85), [#text(size: 9pt)[$S$]])
  content((12, -2.85), [#text(size: 9pt)[$S^( upright(c) )$]])
  content((7.3, -3.83), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$d_H(u, partial S),#h(0.3333em) d_H(v, partial S) lt.eq ell lt.eq R arrow.r.double.long u,v in cal(D)_R$.]]])
})],
    caption: [Figure 1: The boundary obstruction for the finite sequence of proposals. In the upper chain, squares are fine endpoints and circles are coarse outputs; consecutive configurations have Hamming distance at most $R$. When the fine endpoints lie on opposite sides, some consecutive pair $u \, v$ crosses the cut and contains a coarse output. A shortest path of one-spin flips between that pair meets the two-sided boundary $partial S$. Its length is at most $R$, so both $u \, v$ lie in $cal(D)_R = { x : d_H \( x \, partial S \) lt.eq R }$, contradicting avoidance by the coarse outputs. All geometry is schematic: grid outputs are correlated, and lines do not represent continuous spin trajectories. ],
  ) <fig:connection>
  ===== 6.3 Avoiding a boundary selected from the target. <avoiding-a-boundary-selected-from-the-target.>
  At a fixed grid point, the driver difference $G - G \( theta \)$ has coordinate variance $2 delta$. Gaussian tails and a union bound over spins show that the supremum of absolute energy differences is $O \( n sqrt(delta) \)$, except with probability $O \( e^(- c n) \)$. On its complement, Gibbs weight ratios between the two disorders are at most $exp \( O_beta \( n sqrt(delta) \) \)$.
  Apply the likelihood estimate (6) with $l = b$. Its good event depends only on this proposal run. If $q_(upright("good")) \( d x divides g \)$ is the corresponding output subprobability kernel, disintegration against the Gaussian disorder marginal gives
  $ q_(upright("good")) \( d x divides g \) lt.eq exp \( n^(1 - b \/ 2) \) pi_g \( d x \) quad upright("for almost every ") g . $
  The primitive auxiliary inputs and final draw for this run are independent of all matrix drivers. Thus, after fixing $G \( theta \) = g$ and adjoining $\( G \, G^compose \)$, this remains its conditional good-output kernel. In particular, the inequality applies to the random set $cal(D) \( G \)$ once those matrices have been fixed. The separate energy-change event is used to compare Gibbs weights; it is not built into the proposal good event.
  By (12), the resulting boundary probability on the energy-change event’s complement is at most
  $ exp #scale(x: 120%, y: 120%)[\(] n^(1 - b \/ 2) + O_beta \( n sqrt(delta) \) - 1 / 2 n^(1 - b \/ 20) #scale(x: 120%, y: 120%)[\)] . $
  Add the proposal exceptional probability $exp \( - n^(1 - 10 b) \)$ and the energy-change exception. Since $sqrt(delta) = n^(- f \/ 8)$, this proves the required one-point avoidance bound. Correlations with auxiliary inputs at other grid points do not change this calculation.
  ===== 6.4 Continuity of the coarse magnetizations. <continuity-of-the-coarse-magnetizations.>
  We next control the increments along the grid. At any grid point, Proposition 5 puts the Gram matrix of the coarse $T_k$ within $n^(- b)$ of the identity except with probability $exp \( - n^(1 - 10 b) \)$. On this event all $\| T_k \|_n lt.eq 2$, and each Gram–Schmidt residual has norm at least $1 \/ 2$. No fallback direction is used. The reciprocals $1 \/ s_k$ are bounded by a fixed power of $n$ on the deterministic coarse horizon, by (1).
  For neighboring grid points satisfying these Gram conditions, we claim
  #[#set math.equation(numbering: n => "(13)")
   $ \| M_theta \( V_b \) - M_(theta') \( V_b \) \|_n lt.eq \( n^(C_1) \)^(K_b + 1) \| theta - theta' \| \, #h(2em) K_b = V_b \/ h \, $ <eq:13>]
  provided the primitive inputs have polynomially bounded norms. The constant $C_1$ is independent of the grid and of $n$.
  Here are the precise input bounds and the interval induction proving this assertion. Bound the operator norms of $W \( G^compose \) \, W \( G'_1 \) \, W \( G'_2 \)$ and the normalized norms of all completion vectors $z_k$ in the two input collections. For their Brownian and bridge inputs, bound the supremum norms of cumulative integrals against the deterministic coefficients $rho$ and $sqrt(1 - rho^2)$. On a filled interval include only the centered bridge in this primitive bound; its endpoint is handled separately. All these norms are at most $n^3$ outside an event of probability $O \( e^(- c n) \)$. Gaussian tails give the matrix and vector estimates. For the path integrals, write a bridge as Brownian motion minus its linearly interpolated endpoint and use the Gaussian martingale maximal bound for a bounded deterministic integrand. Rotation makes the differences of the primitive inputs at two angles at most a polynomial factor times $\| theta - theta' \|$.
  At a Gram–Schmidt step, the difference of the two projection operators is bounded by twice the sum of preceding direction differences in $\| dot.op \|_n$. Normalizing residuals of norm at least $1 \/ 2$ costs only a fixed factor. Using $1 \/ s_k$, the new direction difference is therefore controlled by earlier magnetization and direction differences at polynomial cost. The same is true of the new $g_k$, by its matrix-query and completion formula. The cumulative driving signals from (4) differ by the primitive integral differences plus the endpoint difference multiplied by a deterministic factor at most $sqrt(h)$. Finally, the scalar integral equation and its spatially Lipschitz drift control the differences in $Y$ and $M$ over this interval at constant cost, by Gronwall’s inequality. Starting with the entirely auxiliary first interval and taking successive maxima of these differences proves (13) after increasing $C_1$ if necessary.
  Only the Gram conditions at the two endpoints of each grid step were used. Since $K_b = O \( n^(1 \/ 16) log n \)$ and the mesh spacing is exponentially smaller, (13) makes all consecutive coarse magnetization differences negligible.
  ===== 6.5 From magnetizations to spins. <from-magnetizations-to-spins.>
  For either a coarse spin or a fine endpoint spin compared with its own coarse magnetization, the normalized squared distance has mean
  $ 1 - bb(E) m_(V_b)^2 = p \( V_b \) lt.eq C_beta n^(- b \/ 2) . $
  For a fine spin this follows from the martingale conditional mean through the continuation. Under the unconditioned single-run law, each squared distance is an average of bounded independent coordinate variables. It is consequently at most $n^(- b \/ 3)$ except with probability $O \( exp \( - n^(1 - b) \) \)$. The triangle inequality in $\| dot.op \|_n$, together with the negligible magnetization increments, then gives Hamming step sizes at most $R_n$ for large $n$.
  We may now union bound all one-point and consecutive-point exceptions for the two desired properties, including the primitive-input event. The grid costs only $exp \( O \( n^(1 \/ 4) \) \)$, and $10 b < d \/ 2$. The boundary exponent $1 - b \/ 20$ also exceeds $1 - d \/ 2$. Thus the total failure probability is at most $exp \( - n^(1 - d \/ 2) \)$ for sufficiently large $n$.
  ===== 6.6 The crossing contradiction. <the-crossing-contradiction.>
  On $cal(E)$, Proposition 6 gives each side of the chosen cut fine-endpoint probability at least $exp \( - n^(1 - 2 d) \)$. Conditional independence therefore puts the fine endpoints on opposite sides with probability at least $exp \( - 2 n^(1 - 2 d) \)$. But if both sequence properties hold, this cannot happen. Some consecutive pair would cross the cut, and each pair contains a coarse spin. A shortest one-spin path between that pair meets $partial S$ and has length at most $R_n$, placing that coarse spin in $cal(D) \( G \)$.
  Consequently
  $ Pr \( cal(E) \) exp \( - 2 n^(1 - 2 d) \) lt.eq exp \( - n^(1 - d \/ 2) \) . $
  Since $d \/ 2 < 2 d$, this implies $Pr \( cal(E) \) = o \( 1 \)$ and proves (11). The auxiliary diagonal and smoothing base are used only in this proof; the resulting flow bound concerns the original heat bath. ◻
]

== 7 From balanced flows to typical-state mixing <sec:mixing>

The flow estimate is available only when both sides of a cut have appreciable Gibbs mass. The following finite-state argument is adapted to exactly that information. It first finds a large set with internal expansion, then uses the full chain’s entropy dissipation to control typical starting states. There is no requirement that a trajectory remain in the large set.

#thm([Lemma 8.])[
  (Pruning and averaged mixing).  #emph[Let $Omega$ be a finite set, let $pi$ be a strictly positive probability on $Omega$, and let $P_t$ be a continuous-time Markov semigroup reversible with respect to $pi$, with jump rates $c \( x \, y \)$. Assume that, for some $R > 0$, 
$ sum_(y eq.not x) c \( x \, y \) lt.eq R #h(2em) \( x in Omega \) . $

 Let $0 < epsilon < 1 \/ 3$ and $B > 0$. Suppose 
$ Q \( S \, S^(upright(c)) \) := sum_(x in S \, thin y in.not S) pi \( x \) c \( x \, y \) > B quad upright("whenever ") epsilon lt.eq pi \( S \) lt.eq 1 - epsilon . $

 Then for every $T > 0$, 
#[#set math.equation(numbering: n => "(1)")
 $ sum_(x in Omega) pi \( x \) parallel P_T \( x \, dot.op \) - pi parallel_(upright("TV")) lt.eq frac(sqrt(2 R H \( pi \)), B sqrt(T)) + 2 epsilon \, #h(2em) H \( pi \) = - sum_x pi \( x \) log pi \( x \) . $ <eq:averaged-mixing>]

]
] <lem:pruning>

#proof[
  Put $q \( x \, y \) = pi \( x \) c \( x \, y \) = q \( y \, x \)$, and use the unordered-edge Dirichlet form
  $ frak(D) \( u \) = sum_({ x \, y }) q \( x \, y \) \( u \( x \) - u \( y \) \)^2 . $
  Only distinct vertices occur, and every unordered pair is counted once.
  ===== 7.1 Removing sets that do not expand. <removing-sets-that-do-not-expand.>
  Start with $C = Omega$. Whenever a nonempty $U subset C$ satisfies
  $ pi \( U \) lt.eq pi \( C \) \/ 2 \, #h(2em) Q \( U \, C \\ U \) < B pi \( U \) \, $
  remove $U$ from $C$. This process terminates because each removal eliminates a vertex. If $A$ denotes all vertices removed so far, then every edge between $A$ and its current complement was counted when its first endpoint was removed. Thus, whenever $A eq.not diameter$,
  $ Q \( A \, Omega \\ A \) < B pi \( A \) . $
  Suppose the removed mass first reached $epsilon$. Its preceding mass $a$ was less than $epsilon$, and the newly removed set has mass at most $\( 1 - a \) \/ 2$. The new total is therefore at most $\( 1 + a \) \/ 2 < \( 1 + epsilon \) \/ 2 < 1 - epsilon$. This contradicts the balanced-cut hypothesis, since $B pi \( A \) lt.eq B$. Consequently the terminal set satisfies $pi \( C \) > 1 - epsilon$ and
  #[#set math.equation(numbering: n => "(2)")
   $ Q \( U \, C \\ U \) gt.eq B pi \( U \) quad upright("for every ") U subset C upright(" with ") pi \( U \) lt.eq pi \( C \) \/ 2 . $ <eq:internal-expansion>]
  ===== 7.2 A Poincaré inequality on the retained set. <a-poincaré-inequality-on-the-retained-set.>
  We use the coarea proof of the reversible Cheeger inequality [11] Theorem 3.5, keeping the original, unnormalized weights on $C$. The resulting estimate is
  #[#set math.equation(numbering: n => "(3)")
   $ sum_(y in C) pi \( y \) \( u \( y \) - macron(u)_C \)^2 lt.eq frac(2 R, B^2) frak(D) \( u \) \, #h(2em) macron(u)_C = frac(1, pi \( C \)) sum_(y in C) pi \( y \) u \( y \) . $ <eq:14>]
  To prove it, choose a weighted median $m$ of $u$ on $C$. Each of $w = \( u - m \)_(+)$ and $w = \( m - u \)_(+)$ has support of mass at most $pi \( C \) \/ 2$. Integrating (2) over the level sets of $w^2$ gives
  $ B sum_C pi w^2 lt.eq sum_({ x \, y } subset C) q \( x \, y \) \| w \( x \)^2 - w \( y \)^2 \| . $
  By Cauchy–Schwarz this is at most
  $ (sum_({ x \, y } subset C) q \( x \, y \) \( w \( x \) - w \( y \) \)^2)^(1 \/ 2) (2 R sum_C pi w^2)^(1 \/ 2) . $
  Indeed, $\( w \( x \) + w \( y \) \)^2 lt.eq 2 \( w \( x \)^2 + w \( y \)^2 \)$, and the total outgoing rate is at most $R$. If $sum_C pi w^2$ vanishes, its estimate is immediate; otherwise divide and square. The sum of the energies of the positive and negative parts is at most $frak(D) \( u \)$. The weighted mean minimizes squared error, proving (3).
  ===== 7.3 Entropy dissipation for the full chain. <entropy-dissipation-for-the-full-chain.>
  For a fixed starting state $x$, set $f_t^x \( y \) = P_t \( x \, y \) \/ pi \( y \)$. Reversibility and
  $ \( a - b \) \( log a - log b \) gt.eq 4 \( sqrt(a) - sqrt(b) \)^2 #h(2em) \( a \, b > 0 \) $
  yield the entropy-dissipation estimate [7] Lemmas 2.5 and 2.7
  #[#set math.equation(numbering: n => "(4)")
   $ integral_0^T sum_x pi \( x \) frak(D) \( sqrt(f_t^x) \) thin d t lt.eq 1 / 4 H \( pi \) . $ <eq:15>]
  Indeed, the derivative of $sum_y pi \( y \) f_t^x \( y \) log f_t^x \( y \)$ is
  $ - sum_({ y \, z }) q \( y \, z \) \( f_t^x \( y \) - f_t^x \( z \) \) \( log f_t^x \( y \) - log f_t^x \( z \) \) . $
  The initial entropy is $log \( 1 \/ pi \( x \) \)$, and the final entropy is nonnegative. Averaging in $x tilde.op pi$ and integrating proves (4). Vanishing densities and reducible chains cause no problem: start instead with $\( 1 - eta \) f_0^x + eta$ and pass to $eta arrow.b 0$, or calculate on communicating classes.
  ===== 7.4 Averaging fixed-state distances. <averaging-fixed-state-distances.>
  Combining (3) and (4) supplies some $t in \( 0 \, T \]$ for which
  $ sum_x pi \( x \) r_x^2 lt.eq frac(R H \( pi \), 2 T B^2) \, #h(2em) r_x^2 = sum_C pi \( y \) \( sqrt(f_t^x \( y \)) - a_x \)^2 \, #h(2em) a_x = frac(1, pi \( C \)) sum_C pi \( y \) sqrt(f_t^x \( y \)) . $
  Cauchy–Schwarz and $a_x^2 pi \( C \) lt.eq sum_C pi f_t^x lt.eq 1$ imply
  $ sum_C pi \| f_t^x - a_x^2 \| lt.eq 2 r_x . $
  Also, total normalization gives $\| sum_C pi \( f_t^x - 1 \) \| lt.eq sum_(C^(upright(c))) pi \( f_t^x + 1 \)$. Comparing $f_t^x$ first with $a_x^2$ and then with $1$ on $C$, and adding the complement, yields
  $ sum_Omega pi \| f_t^x - 1 \| lt.eq 4 r_x + 2 sum_(C^(upright(c))) pi \( f_t^x + 1 \) . $
  The last sum before its factor two has average $2 pi \( C^(upright(c)) \)$ over $x tilde.op pi$, because stationarity gives $sum_x pi \( x \) f_t^x \( y \) = 1$. Dividing by two for total variation and applying Cauchy–Schwarz in $x$ proves the desired upper bound at this time $t$. Contraction under $P_(T - t)$ gives the same bound at the prescribed time $T$, establishing (1). ◻
]

#proof[
  On the disorder event of Proposition 7, apply Lemma 8 with
  $ epsilon = n^(- d) \, #h(2em) B = exp \( - n^(1 - b \/ 20) \) \, #h(2em) R = n . $
  The last choice is valid because there are $n$ rate-one update clocks. Also $H \( pi_G \) lt.eq n log 2$, since the state space has $2^n$ elements. Hence
  $ sum_x pi_G \( x \) parallel P_T^G \( x \, dot.op \) - pi_G parallel_(upright("TV")) lt.eq frac(sqrt(2 log 2) thin n, B sqrt(T)) + 2 n^(- d) . $
  Take $T = exp \( n^(1 - b \/ 40) \)$. The first term tends to zero, as
  $ log frac(n, B sqrt(T)) = log n + n^(1 - b \/ 20) - 1 / 2 n^(1 - b \/ 40) arrow.r - oo . $
  The flow event itself has disorder probability tending to one. Markov’s inequality therefore shows that the Gibbs mass of fixed states whose distance at time $T$ exceeds $1 \/ 4$ tends to zero in disorder probability. The added diagonal changes neither this Gibbs law nor the transition rates, so the same statement holds for the model in (H). This proves the theorem with
  $ c_beta = b \/ 40 = 1 \/ 40000000 . $
  All threshold dimensions may depend on the fixed $beta > 1$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[A.~Auffinger and W.-K.~Chen, On properties of Parisi measures, #emph[Probability Theory and Related Fields] #strong[161] (2015), 817--850. #link("https://doi.org/10.1007/s00440-014-0563-y")[doi:10.1007/s00440-014-0563-y]\; #link("https://arxiv.org/abs/1303.3573v1")[arXiv:1303.3573v1].]
#bibitem([2])[M.~Boban, A.~Li and S.~Oveis Gharan, Rank-1-perturbed trickledown theorems: mixing time of Glauber dynamics for the Sherrington--Kirkpatrick model up to $beta lt.eq 1 / 2 + epsilon$, preprint (2026), #link("https://arxiv.org/abs/2609.13138v1")[arXiv:2609.13138v1].]
#bibitem([3])[V.~I. Bogachev, A.~V. Kolesnikov and K.~V. Medvedev, Triangular transformations of measures, #emph[Sbornik: Mathematics] #strong[196] (2005), no.~3, 309--335. #link("https://doi.org/10.1070/SM2005v196n03ABEH000882")[doi:10.1070/SM2005v196n03ABEH000882].]
#bibitem([4])[E.~Bolthausen, An iterative construction of solutions of the TAP equations for the Sherrington--Kirkpatrick model, #emph[Communications in Mathematical Physics] #strong[325] (2014), 333--366. #link("https://doi.org/10.1007/s00220-013-1862-3")[doi:10.1007/s00220-013-1862-3]\; #link("https://arxiv.org/abs/1201.2891")[arXiv:1201.2891].]
#bibitem([5])[S.~Boucheron, G.~Lugosi, and P.~Massart, #emph[Concentration Inequalities: A Nonasymptotic Theory of Independence], Oxford University Press, 2013. #link("https://doi.org/10.1093/acprof:oso/9780199535255.001.0001")[Publisher reference].]
#bibitem([6])[W.-K.~Chen, Variational representations for the Parisi functional and the two-dimensional Guerra--Talagrand bound, #emph[Annals of Probability] #strong[45] (2017), no.~6A, 3929--3966. #link("https://doi.org/10.1214/16-AOP1154")[doi:10.1214/16-AOP1154]\; #link("https://arxiv.org/abs/1501.06635v2")[arXiv:1501.06635v2].]
#bibitem([7])[P.~Diaconis and L.~Saloff-Coste, Logarithmic Sobolev inequalities for finite Markov chains, #emph[Annals of Applied Probability] #strong[6] (1996), no.~3, 695--750. #link("https://doi.org/10.1214/aoap/1034968224")[doi:10.1214/aoap/1034968224].]
#bibitem([8])[R.~Eldan, F.~Koehler and O.~Zeitouni, A spectral condition for spectral gap: fast mixing in high-temperature Ising models, #emph[Probability Theory and Related Fields] #strong[182] (2022), nos.~3--4, 1035--1051. #link("https://doi.org/10.1007/s00440-021-01085-x")[doi:10.1007/s00440-021-01085-x]\; #link("https://arxiv.org/abs/2007.08200v1")[arXiv:2007.08200v1]. The section cited here refers to this preprint version.]
#bibitem([9])[F.~Guerra, Broken replica symmetry bounds in the mean field spin glass model, #emph[Communications in Mathematical Physics] #strong[233] (2003), 1--12. #link("https://doi.org/10.1007/s00220-002-0773-5")[doi:10.1007/s00220-002-0773-5]\; #link("https://arxiv.org/abs/cond-mat/0205123v1")[arXiv:cond-mat/0205123v1].]
#bibitem([10])[A.~Jagannath and I.~Tobasco, Some properties of the phase diagram for mixed $p$-spin glasses, #emph[Probability Theory and Related Fields] #strong[167] (2017), 615--672. #link("https://doi.org/10.1007/s00440-015-0691-z")[doi:10.1007/s00440-015-0691-z]\; #link("https://arxiv.org/abs/1504.02731v2")[arXiv:1504.02731v2]. Numbered propositions and corollaries cited here refer to this preprint version.]
#bibitem([11])[G.~F. Lawler and A.~D. Sokal, Bounds on the $L^2$ spectrum for Markov chains and Markov processes: a generalization of Cheeger's inequality, #emph[Transactions of the American Mathematical Society] #strong[309] (1988), no.~2, 557--580. #link("https://doi.org/10.1090/S0002-9947-1988-0930082-9")[doi:10.1090/S0002-9947-1988-0930082-9].]
#bibitem([12])[P.~Lopatto, Full replica symmetry breaking in the Sherrington--Kirkpatrick model, preprint (2026), #link("https://arxiv.org/abs/2607.11756v3")[arXiv:2607.11756v3].]
#bibitem([13])[G.~Lugosi and G.~Neu, Generalization bounds via convex analysis, #emph[Proceedings of Machine Learning Research] #strong[178] (2022), 3524--3546. #link("https://proceedings.mlr.press/v178/lugosi22a.html")[Proceedings article].]
#bibitem([14])[A.~Montanari, Optimization of the Sherrington--Kirkpatrick Hamiltonian, #emph[SIAM Journal on Computing] #strong[54] (2025), no.~4, FOCS19-1--FOCS19-38 (first published online 2021). #link("https://doi.org/10.1137/20M132016X")[doi:10.1137/20M132016X]\; #link("https://arxiv.org/abs/1812.10897v2")[arXiv:1812.10897v2]. Numbered sections cited here refer to this preprint version.]
#bibitem([15])[OpenAI, Stretched-exponential barriers for typical SK initial states, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Stretched-exponential-barriers-for-typical-SK-initial-states-September-24-2026/paper.pdf")[OAI:Stretched-exponential-barriers-for-typical-SK-initial-states-September-24-2026], 2026.]
#bibitem([16])[M.~Sellke, Exponentially slow mixing of the low temperature SK model, preprint (2025), #link("https://arxiv.org/abs/2511.22621v2")[arXiv:2511.22621v2].]
#bibitem([17])[D.~Sherrington and S.~Kirkpatrick, Solvable model of a spin-glass, #emph[Physical Review Letters] #strong[35] (1975), no.~26, 1792--1796. #link("https://doi.org/10.1103/PhysRevLett.35.1792")[doi:10.1103/PhysRevLett.35.1792].]
#bibitem([18])[S.~Wang, Optimal mixing of Glauber dynamics for the Sherrington--Kirkpatrick model at $beta < 1 \/ 2$, preprint (2026), #link("https://arxiv.org/abs/2608.22159v2")[arXiv:2608.22159v2].]
#bibitem([19])[Y.~Zhou, Existence of full replica symmetry breaking for the Sherrington--Kirkpatrick model at low temperature, #emph[Communications on Pure and Applied Mathematics] #strong[79] (2026), 1746--1770. #link("https://doi.org/10.1002/cpa.70038")[doi:10.1002/cpa.70038].]


