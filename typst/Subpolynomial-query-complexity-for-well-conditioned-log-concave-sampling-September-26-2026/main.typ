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

#align(center)[#text(size: 16pt, weight: "bold")[Subpolynomial query complexity for \
well-conditioned log-concave sampling]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

How many evaluations of a potential and its gradient are needed to sample its Gibbs distribution? Even when the potential is uniformly strongly convex and smooth, familiar discretizations incur an error that grows with dimension. The question is particularly sharp when conditioning and accuracy are held fixed: is a positive power of the dimension intrinsically necessary, or is it a feature of the sampling algorithms used?

We answer this question in the exact first-order oracle model with unrestricted real computation between queries. The optimal dimension exponent is zero. The construction uses approximation orders that can depend on the desired exponent and is aimed at oracle complexity rather than practical running time.

=== 1.1 Model and result <model-and-result>

For $d gt.eq 2$, let $cal(V)_d$ consist of the functions $V in C^2 \( bb(R)^d \)$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ V \( 0 \) = 0 \, #h(2em) nabla V \( 0 \) = 0 \, #h(2em) I_d prec.curly.eq nabla^2 V \( x \) prec.curly.eq 2 I_d quad upright("for every ") x in bb(R)^d . $ <eq:original-class>]

The target law is

$ pi_V \( d x \) = Z_V^(- 1) e^(- V \( x \)) thin d x \, #h(2em) Z_V = integral_(bb(R)^d) e^(- V \( x \)) thin d x . $

An exact first-order query at $x$ returns $\( V \( x \) \, nabla V \( x \) \)$. Queries may be adaptive. Random real variables may be generated, and computation between queries is unrestricted. An algorithm may depend on $d$, but its only information about $V$ is through the oracle responses. All algorithms are measurable.

Write $lr(bar.v.double mu - eta bar.v.double)_(upright("TV")) = sup_B \| mu \( B \) - eta \( B \) \|$. Let $Q \( d \)$ be the smallest integer $q$ for which an algorithm makes at most $q$ queries on #emph[every] execution and returns $X$ satisfying $lr(bar.v.double cal(L) \( X \) - pi_V bar.v.double)_(upright("TV")) lt.eq 1 \/ 10$ for every $V in cal(V)_d$. Thus the budget is not merely an expectation. Define the optimal dimension exponent by

$ gamma_(*) = inf { gamma gt.eq 0 : Q \( d \) lt.eq d^(gamma + o \( 1 \)) } = limsup_(d arrow.r oo) frac(log Q \( d \), log d) . $

#thm([Theorem 1.1.])[
  #emph[In the oracle model above, for every $epsilon > 0$ there is $C_epsilon < oo$ such that 
$ Q \( d \) lt.eq C_epsilon d^epsilon #h(2em) \( d gt.eq 2 \) . $

 There are also absolute constants $c > 0$ and $d_0$ such that 
$ Q \( d \) gt.eq c log d #h(2em) \( d gt.eq d_0 \) . $

 The lower bound applies to arbitrary randomized adaptive first-order algorithms. In particular, $gamma_(*) = 0$.]
] <thm:main>

The upper assertion is proved in Theorem 36 and the lower assertion in Theorem 37. Together they determine the exponent but not the finer growth rate of $Q \( d \)$. In particular, the upper bound does not assert a polylogarithmic query count. The constants and the algorithmic approximation orders may depend on $epsilon$. No arithmetic or bit-complexity bound is imposed or deduced.

=== 1.2 Historical context <historical-context>

Sampling by discretizing Langevin or Hamiltonian dynamics turns functional inequalities and smoothness into algorithmic bounds, but it also introduces a dimension-dependent discretization problem. Nonasymptotic analyses of the unadjusted Langevin algorithm were developed by #cite(label("dalalyan2017langevin"), form: "prose") and #cite(label("durmus2017langevin"), form: "prose"); #cite(label("cheng2018underdamped"), form: "prose") analyzed the underdamped method under strong convexity and smoothness. Randomized midpoint discretization further improved the quadratic-Wasserstein guarantees #cite(label("shen2019randomized")). Wasserstein and total-variation guarantees must be distinguished in comparing these results. The shifted-composition analysis of #cite(label("altschuler2026shifted"), form: "prose") Theorem 5.6 gives a relative-entropy guarantee that yields a $tilde(O) \( d^(1 \/ 3) \)$ query bound at fixed conditioning and total-variation accuracy. Another gradient-only route, based on rejection sampling on diffusion path space, was developed by #cite(label("chen2026exact"), form: "prose") Theorem 3.2(ii); its stated query-tail bound also gives $tilde(O) \( d^(1 \/ 3) \)$ in this fixed-parameter setting.

High-order integration and polynomial collocation already reduce the dimensional dependence of Hamiltonian Monte Carlo under stronger regularity or structural assumptions #cite(label("mangoubi2017rapid")) #cite(label("lee2018odes")). In particular, their high-order results use assumptions beyond the two-sided Hessian bounds in (1.1). The obstacle here is to obtain high-order accuracy under those bounds while implementing every conditional mean with finitely many first-order queries.

More recently, #cite(label("chen2026picard"), form: "prose") Theorem 7.1(i) obtain a $tilde(O) \( d^(1 \/ 6) \)$ expected-gradient-query bound at fixed relative-entropy accuracy and fixed conditioning. Their theorem applies with the supplied minimizer in our model, and Pinsker’s inequality gives the same dimension exponent at fixed total-variation accuracy. The expected budget can also be capped at a constant multiple of its uniform bound, using a fixed fallback on overflow, without changing that exponent.#footnote[For example, take their relative-entropy parameter $Delta = 1 \/ 20$, so that the total-variation error is at most $1 \/ \( 20 sqrt(2) \)$. If $B \( d \)$ bounds the expected number of queries, capping the run at $ceil.l 20 B \( d \) ceil.r$ adds at most $1 \/ 20$ to the error by Markov’s inequality and a coupling of the two runs. The resulting error is less than $1 \/ 10$.] Their separate high-accuracy total-variation result combines this construction with the proximal bouncy-particle sampler #cite(label("chen2026bps")) and has a $d^(1 \/ 4)$ term, while its dependence on inverse accuracy is polylogarithmic #cite(label("chen2026picard")) Theorem 1.3. A subsequent preprint of September 30, 2026 by #cite(label("chen2026cloud"), form: "prose") Theorem 1.1 improves the high-accuracy dimension dependence to $tilde(O) \( d^(1 \/ 5) \)$ expected gradient queries at fixed conditioning, while retaining polylogarithmic dependence on inverse total-variation accuracy. Its Gaussian-cloud representation propagates unevaluated Picard iterates using likelihood corrections.

The smoothed Picard work is also a close methodological precedent: it develops Gaussian smoothing of $C^2$ potentials, conditional cumulant estimates for derivatives of the smoothed potential, and high-order Picard approximation, including arbitrary Picard depth when exact smoothed gradients are available. Here we prove the all-split tensor estimates needed by our construction and implement recursively nested noisy conditional means with finitely many queries to the original gradient. This finite implementation, together with the subsequent removal of the auxiliary noise, gives every fixed positive query exponent in Theorem 1.

The Gaussian conditional-sampling framework used below was developed by #cite(label("lee2021proximal"), form: "prose"); see also the functional-inequality analysis of #cite(label("chen2022proximal"), form: "prose"). Its main operation adds a Gaussian quadratic to the potential and samples the resulting restricted conditional law. We retain that framework and give the contraction argument used here, while implementing its conditional operation by the recursive construction above.

For lower bounds, #cite(label("chewi2023lower"), form: "prose") developed a systematic first-order query-complexity treatment of log-concave sampling. Their Gaussian lower bounds use rotational invariance to reduce arbitrary adaptive algorithms to block-Krylov information. Their results already give logarithmic dimension dependence for well-conditioned Gaussian sampling at a suitable fixed total-variation accuracy. Our lower-bound proof follows that strategy, with an explicit spectrum in $\[ 1 \, 2 \]$ and a separating statistic. We give the full argument for total-variation threshold $1 \/ 10$, including unrestricted randomized outputs.

=== 1.3 Proof strategy and principal ingredients <proof-strategy-and-principal-ingredients>

The auxiliary problem comes from conditioning a target sample after a small Gaussian perturbation. Fix $h > 0$. If $X tilde.op pi_V$ and $G$ is an independent standard Gaussian, the conditional density of $X$ given $X + sqrt(h) thin G = y$ is proportional to

$ exp #h(-0.16667em) (- V \( x' \) - frac(\| x' - y \|^2, 2 h)) . $

Writing $x' = y + sqrt(h) thin z$ gives the potential $\| z \|^2 \/ 2 + F_y \( z \)$, where $F_y \( z \) = V \( y + sqrt(h) thin z \)$ and $"Lip" \( nabla F_y \) lt.eq 2 h$. Thus a small $h$ makes the perturbation weak, using one original gradient query for each evaluation of $nabla F_y$. We first implement this conditional operation with an added Gaussian, then remove that noise by further conditioning.

To make the conditional operation reusable, we work with a $C^2$ perturbation $F : bb(R)^d arrow.r bb(R)$, a center $x in bb(R)^d$, a scale $0 < r lt.eq 1$, and the near-quadratic law

$ nu \( d z \) prop e^(- \| z \|^2 \/ 2 - F \( x + r z \)) thin d z \, $

where the gradient of $F$ has small Lipschitz constant. We construct two procedures: a sample from $nu$ with an added Gaussian, and the mean $bb(E)_nu nabla F \( x + r Z \)$ with an added Gaussian. The noise is not merely an error allowance. It is used to make recursive evaluation possible.

===== 1.3.1 Gaussian transport. <gaussian-transport.>

For independent $Z tilde.op nu$ and standard Gaussian $N$, consider $Y_rho = rho Z + sqrt(1 - rho^2) thin N$. The velocity of its marginal-law transport is a conditional gradient mean, hence another instance of the same auxiliary mean problem. This conditional-velocity construction belongs to the probability-flow and stochastic-interpolant viewpoint #cite(label("song2021score")) #cite(label("albergo2025interpolants")).

===== 1.3.2 Dimension-controlled high derivatives. <dimension-controlled-high-derivatives.>

High-order approximation is useful only if each further derivative does not introduce another power of the dimension. Derivatives of a Gaussian conditional mean form tensors with many coordinate slots. We bound each tensor as a matrix under every division of those slots into two nonempty groups. These bounds let us estimate the contractions arising along the flow by matrix composition. Repeated integration by parts then incurs only polylogarithmic dimension losses, followed by one $sqrt(d)$ cost at the final vector output. The first step builds on classical Appell polynomials and higher-order Poincaré estimates #cite(label("anshelevich2004appell")) #cite(label("adamczak2015concentration")) #cite(label("kothari2017agnostic")); we prove the all-split cumulant and subsequent divergence estimates needed here. All high derivatives come from Gaussian conditioning; the original potential still needs only the $C^2$ regularity in (1.1).

===== 1.3.3 Stationary centering. <stationary-centering.>

To produce a noisy mean, we next couple one of the smoothed marginal laws above to a Gaussian momentum law while preserving their product. Its invariance uses a skew-matrix drift, as in #cite(label("ma2015recipe"), form: "prose") Section 2.1. Our transport-derived matrix makes the momentum displacement convert a path integral of gradient means into a Gaussian centered at the desired mean. The derivative estimates control high-order quadrature of both the probability transport and this stationary flow.

===== 1.3.4 Noisy recursive evaluation. <noisy-recursive-evaluation.>

Fixed-depth polynomial and Picard computations represent the transports and centering flow as finite expressions in exact conditional means. The difficulty is to implement nested mean evaluations without knowing their exact centers. Our recursive procedure has a pathwise translation property: shifting a center can be compensated by a specified shift of its Gaussian random seeds, leaving every primitive query unchanged. A deterministic covariance reduction of those seeds then absorbs independent Gaussian noise in the center. This converts a noisy-center call into the correct known-center law. There are two distinct depths: the dependency depth of a finite expression in means, and the height of the routines called to evaluate those means. We bound both before choosing the quadrature mesh. Each routine is assigned a requested error and a bound on the size of its perturbation. The update rules for these parameters make the routine recursion finite and allow its query exponent to be arbitrarily small. This seed transformation is an exact finite-dimensional identity, not an appeal to an approximate sampling oracle.

===== 1.3.5 Return to the original target. <return-to-the-original-target.>

A Gaussian proximal chain uses the near-quadratic procedure to sample $pi_V$ with a small added Gaussian. Repeated conditioning halves the remaining variance and reduces the conditional problem to an almost Gaussian law. A mode-centered Gaussian completes the descent. This final step is necessary because the requested accuracy is for the unnoised target in total variation.

Section 2 states the auxiliary sampling guarantee and the elementary comparison facts. Sections 3 and 4 prove the derivative estimates. Sections 5 and 6 construct and discretize the two flows. Section 7 implements the resulting expressions with actual gradient calls. Section 8 proves the sampling upper bound, and Section 9 gives the independent lower bound.

== 2 The near-quadratic sampling problem <sec:preliminaries>

The conditional density in the introduction is a Gaussian multiplied by a factor with a small Hessian. We now formulate the sampling problem for that larger class of perturbations. The center will be arbitrary: later calls must work at centers supplied by earlier random computations, without a bound on the gradient there. We state the required uniform guarantee first, then prove the comparison and smoothing facts used throughout its construction.

=== 2.1 Notation and the auxiliary theorem <notation-and-the-auxiliary-theorem>

Vectors have Euclidean norm, and matrices have its induced operator norm unless otherwise indicated. For a random vector or tensor, $lr(bar.v.double X bar.v.double)_2 = \( bb(E) \| X \|^2 \)^(1 \/ 2)$, with the chosen pointwise norm; the notation $lr(bar.v.double X bar.v.double)_(upright(F) \, 2)$ specifies the Frobenius norm. The distance $W_2$ is quadratic Wasserstein distance on Euclidean space. Total variation is $lr(bar.v.double mu - eta bar.v.double)_(upright("TV")) = sup_B \| mu \( B \) - eta \( B \) \|$. All probability laws and oracle procedures are measurable.

Fix $0 < e < 1$, and put $delta = d^(- e)$. Let $F : bb(R)^d arrow.r bb(R)$ be $C^2$, with gradient $g = nabla F$ of Lipschitz constant at most the declared bound $lambda = delta$. Values of $F$ need not be available. For $x in bb(R)^d$ and $0 < r lt.eq 1$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ nu_(x \, r) \( d z \) = frac(exp \( - \| z \|^2 \/ 2 - F \( x + r z \) \) thin d z, integral_(bb(R)^d) exp \( - \| v \|^2 \/ 2 - F \( x + r v \) \) thin d v) \, #h(2em) f \( z \) = g \( x + r z \) \, #h(2em) u = bb(E)_(nu_(x \, r)) f . $ <eq:primitive-law>]

We often write $nu = nu_(x \, r)$, and use

#[#set math.equation(numbering: n => "(2.2)")
 $ L = lambda r \, #h(2em) l = lambda r^2 = r L \, #h(2em) D \( x \) = sqrt(d) + \| g \( x \) \| . $ <eq:primitive-scales>]

Here $x$ is the actual input center; it need not be a minimizer of $F$. The positive number $lambda$ is a declared upper bound, so the notation also covers affine or constant $F$. The full potential in (2.1) has Hessian between $\( 1 - l \) I$ and $\( 1 + l \) I$. Since $l lt.eq delta < 1$ for $d gt.eq 2$, the normalizing integral is finite, even when $F$ is not convex. For the quantitative construction we take $d$ large enough that $l lt.eq 1 \/ 2$.

Throughout the construction, $"polylog" \( d \)$ denotes a factor bounded by $C \( 1 + log d \)^C$. Its constants may depend on the fixed parameters $e$, accuracy orders, and other fixed orders introduced below, but never on $F \, x \, r$, or the oracle responses. Different occurrences may have different constants. Every sufficiently-large-dimension threshold has the same uniformity.

#thm([Theorem 2.1.])[
  (Noisy near-quadratic sampling).  #emph[Fix $0 < e < 1$, an integer $K_0 gt.eq 2$, and $t > 0$ satisfying 
#[#set math.equation(numbering: n => "(2.3)")
 $ 40 \( K_0 + 2 \) t < 1 / 4 . $ <eq:t-choice>]

 There are constants and a dimension threshold depending only on $e \, K_0 \, t$ with the following property. For every integer $d$ above that threshold, put $delta = d^(- e)$. One measurable randomized oracle procedure works for every $F in C^2 \( bb(R)^d \)$ with $"Lip" \( nabla F \) lt.eq delta$, every $x in bb(R)^d$, and every $0 < r lt.eq 1$. Given evaluation access to $g = nabla F$, it uses at most $"polylog" \( d \) delta^(- t)$ evaluations of $g$ on every execution and returns 
$ X = X_(upright("pre")) + 1 / 2 G \, $

 where $G tilde.op N \( 0 \, I_d \)$ is independent of $X_(upright("pre"))$ and of all queries, and 
#[#set math.equation(numbering: n => "(2.4)")
 $ W_2 #h(-0.16667em) (cal(L) \( X_(upright("pre")) \) \, nu_(x \, r) * N \( 0 \, 3 / 4 I_d \)) lt.eq "polylog" \( d \) delta^(K_0) D \( x \) . $ <eq:primitive-pre-noise>]

 Consequently both 
$ W_2 #h(-0.16667em) (cal(L) \( X \) \, nu_(x \, r) * N \( 0 \, I_d \)) quad upright("and") quad lr(bar.v.double cal(L) \( X \) - nu_(x \, r) * N \( 0 \, I_d \) bar.v.double)_(upright("TV")) $

 are at most $"polylog" \( d \) delta^(K_0) D \( x \)$. All constants in these bounds are uniform in $F \, x \, r$. The procedure’s scalar parameters, shapes of its computations, and query cap are independent of $x$ and of the primitive. It uses no evaluations of $F$ itself.]
] <thm:primitive>

The proof occupies Sections 3–7. The independent Gaussian is reserved until all queries have been made. Adding the same reserve to a coupling preserves its transportation error; smoothing by that reserve gives the total-variation conclusion through Lemma 4 below. The target here contains a full independent Gaussian convolution. Section 8 will remove that auxiliary noise before returning a sample for the original problem.

=== 2.2 Convexity, moments, and comparisons <convexity-moments-and-comparisons>

We recall the elementary diffusion facts needed for the proof, including their regularity requirements. They are familiar forms of the curvature method for functional inequalities #cite(label("bakry2014analysis")); we give the argument used here.

#thm([Lemma 2.2.])[
  (Uniformly convex laws).  #emph[Let $H in C^2 \( bb(R)^n \)$ satisfy $m I prec.curly.eq nabla^2 H prec.curly.eq M I$, with $0 < m lt.eq M < oo$. Write $mu \( d x \) prop e^(- H \( x \)) d x$, and let $z_0$ be its unique mode. Then 
$ bb(E)_mu \| X - z_0 \|^2 lt.eq n \/ m \, #h(2em) "Var"_mu h lt.eq m^(- 1) bb(E)_mu \| nabla h \|^2 . $

 The latter applies, in particular, to $C^1$ functions whose value and gradient have polynomial growth. The diffusion 
$ d X_t = - nabla H \( X_t \) thin d t + sqrt(2) thin d B_t $

 has invariant law $mu$, and synchronous solutions contract in distance by $e^(- m t)$.]
  #emph[If $macron(H)$ is another strongly convex $C^2$ potential with bounded Hessian and law $eta$, then 
#[#set math.equation(numbering: n => "(2.5)")
 $ W_2 \( mu \, eta \) lt.eq 1 / m (bb(E)_eta \| nabla H - nabla macron(H) \|^2)^(1 \/ 2) . $ <eq:synchronous-comparison>]

]
] <lem:convex-preliminaries>

#proof[
  Strong convexity implies Gaussian tails and existence of a unique minimizer. Integration by parts gives $bb(E)_mu \( X - z_0 \) dot.op nabla H \( X \) = n$; strong monotonicity of $nabla H$ gives the moment bound. The globally Lipschitz drift gives a nonexplosive diffusion. For synchronous solutions, differentiating their squared distance and using strong monotonicity gives the contraction.
  First suppose $H$ is smooth and has bounded derivatives of orders at least two. For a smooth compactly supported $h$, let $P_t h \( x \) = bb(E) \[ h \( X_t \) divides X_0 = x \]$. Differentiating the synchronous flow in the initial state gives bounded first and second derivatives on bounded time intervals. Itô’s formula and the semigroup identity yield
  $ partial_t P_t h = P_t cal(A) h = cal(A) P_t h \, #h(2em) cal(A) = Delta - nabla H dot.op nabla . $
  The equality with $cal(A) P_t h$ also follows by differentiating $P_(t + s) h = P_s \( P_t h \)$ at $s = 0$. Its at-most-linear growth is integrable against $mu$. Integration by parts gives $integral cal(A) P_t h thin d mu = 0$, hence invariance. Coupling to an invariant starting point and using contraction shows $P_t h arrow.r mu h$ in $L^2 \( mu \)$. Therefore
  $ "Var"_mu h = 2 integral_0^oo integral \| nabla P_t h \|^2 thin d mu thin d t . $
  The flow derivative has operator norm at most $e^(- m t)$. Jensen’s inequality and invariance thus bound the inner integral by $e^(- 2 m t) integral \| nabla h \|^2 d mu$, proving the Poincaré inequality.
  For $C^2$ potentials, convolve with smooth compactly supported mollifiers of radii tending to zero. Both Hessian bounds are preserved; all higher derivatives are bounded for each mollification. The normalized laws converge in total variation by the uniform quadratic tail bounds (subtract the potential’s value at zero). The gradients converge uniformly since the original gradient is globally Lipschitz. Synchronous solutions of the mollified and original diffusions consequently converge uniformly in their common starting point on each bounded time interval, by Gronwall’s inequality. Testing invariance against bounded Lipschitz functions passes it to the limit. Poincaré first passes on smooth compact tests, then by cutoff and approximation to the stated class.
  For (2.5), start the two diffusions with their respective invariant marginals, with any initial coupling, and use common Brownian motion. Writing $a \( t \) = \( bb(E) \| X_t - Y_t \|^2 \)^(1 \/ 2)$ and $beta = \( bb(E)_eta \| nabla H - nabla macron(H) \|^2 \)^(1 \/ 2)$, strong monotonicity and Cauchy–Schwarz give, in the usual upper-derivative sense,
  $ a' \( t \) lt.eq - m a \( t \) + beta . $
  The marginals remain fixed, so $W_2 \( mu \, eta \) lt.eq a \( t \)$. Letting $t$ tend to infinity proves the claim. ◻
]

These estimates apply to the auxiliary laws without imposing convexity on $F$. For $nu_(x \, r)$, the mode equation is $z_0 = - r g \( x + r z_0 \)$. In particular, for $l lt.eq 1 \/ 2$,

#[#set math.equation(numbering: n => "(2.6)")
 $ \| z_0 \| lt.eq frac(r \| g \( x \) \|, 1 - l) \, #h(2em) #scale(x: 120%, y: 120%)[\(] bb(E)_nu \| Z \|^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C \( sqrt(d) + r \| g \( x \) \| \) \, #h(2em) \| u \| lt.eq C D \( x \) . $ <eq:primitive-moments>]

Indeed, $\| g \( x + r z_0 \) - g \( x \) \| lt.eq L \| z_0 \|$ proves the first bound, and the lemma gives $lr(bar.v.double Z - z_0 bar.v.double)_2 lt.eq sqrt(d \/ \( 1 - l \))$. The triangle inequality and $\| u \| lt.eq \| g \( x \) \| + L lr(bar.v.double Z bar.v.double)_2$ give the remaining bounds. Thus $D \( x \)$ controls the required moments uniformly over all centers, including those with very large gradients.

=== 2.3 Coupling and smoothing conventions <coupling-and-smoothing-conventions>

Errors of a deterministic map evaluated on a specified input law will be measured in root mean square. Errors of randomized outputs will be measured in $W_2$. The following rules allow us to keep these two notions separate.

#thm([Lemma 2.3.])[
  (Conditional comparisons and smoothing).  #emph[Let $\( mu_z \)$ and $\( eta_z \)$ be probability kernels on finite-dimensional Euclidean spaces, and let $Z$ have law $zeta$. Whenever the relevant second moments are finite, 
$ W_2^2 #h(-0.16667em) (integral mu_z thin d zeta \( z \) \, integral eta_z thin d zeta \( z \)) lt.eq integral W_2^2 \( mu_z \, eta_z \) thin d zeta \( z \) . $

 For finite families, independent sums satisfy 
$ W_2 #h(-0.16667em) (cal(L) #scale(x: 180%, y: 180%)[\(] sum_i a_i X_i #scale(x: 180%, y: 180%)[\)] \, cal(L) #scale(x: 180%, y: 180%)[\(] sum_i a_i Y_i #scale(x: 180%, y: 180%)[\)]) lt.eq sum_i \| a_i \| W_2 \( cal(L) \( X_i \) \, cal(L) \( Y_i \) \) \, $

 where independence is required within each of the two families, not between them. For $s > 0$, 
#[#set math.equation(numbering: n => "(2.7)")
 $ lr(bar.v.double mu * N \( 0 \, s^2 I \) - eta * N \( 0 \, s^2 I \) bar.v.double)_(upright("TV")) lt.eq s^(- 1) W_2 \( mu \, eta \) . $ <eq:gaussian-smoothing>]

 Moreover, applying a common probability kernel cannot increase total variation, and 
$ ∥integral mu_z thin d zeta \( z \) - integral eta_z thin d zeta \( z \)∥_(upright("TV")) lt.eq integral lr(bar.v.double mu_z - eta_z bar.v.double)_(upright("TV")) thin d zeta \( z \) . $

]
] <lem:coupling-smoothing>

#proof[
  Use conditional near-optimal couplings for the first inequality and their independent product for the second, followed by the triangle inequality in $L^2$. Measurability of such conditional comparisons can also be seen without an exact optimal-kernel selection: quantize each output law on a finite grid inside a box, sending the complement to zero. A minimizing plan on the finite sets can be chosen measurably by a fixed ordering of the finitely many basic feasible solutions. Lift it using the conditional measures in the cells, and refine the grids and boxes. Finite unconditional second moments and the triangle inequality give the asserted limit.
  For deterministic centers $x \, y$, the relative entropy of $N \( x \, s^2 I \)$ from $N \( y \, s^2 I \)$ is $\| x - y \|^2 \/ \( 2 s^2 \)$. Pinsker’s inequality gives TV at most $\| x - y \| \/ \( 2 s \)$. Integrate this estimate over any coupling and apply Cauchy–Schwarz to obtain (2.7), with room in its constant. The total-variation rules follow directly by testing measurable functions taking values in $\[ 0 \, 1 \]$. ◻
]

We will also repeatedly combine deterministic root-mean-square errors with absolute coefficient sums. This uses the ordinary $L^2$ triangle inequality and does not require independence.

== 3 Gaussian transport and tensor derivatives <sec:jets>

The next step toward Theorem 2 is to describe a transport from a Gaussian to the auxiliary law. Its velocity will be a conditional gradient mean. Although the original potential has only two derivatives, conditioning by a nondegenerate Gaussian makes that mean smooth. We will bound each of its derivative tensors as a matrix under every division of its slots into two groups. These bounds keep later tensor contractions from introducing a dimension factor at each step. The interpolation itself is the Gaussian stochastic interpolant of #cite(label("albergo2025interpolants"), form: "prose") Section 5.1, Equations (5.5)–(5.6); we use its conditional velocity and prove the tensor estimates required for our sampling construction.

Retain the primitive notation from Section 2, and assume $l lt.eq 1 \/ 2$, as holds for all sufficiently large $d$. For independent $Z tilde.op nu$ and $N tilde.op N \( 0 \, I_d \)$, put

$ a = 1 - rho^2 \, #h(2em) Y = rho Z + sqrt(a) thin N \, #h(2em) xi_rho = cal(L) \( Y \) \, #h(2em) 0 lt.eq rho < 1 . $

Write $xi_rho \( d y \) = e^(- H_rho \( y \)) thin d y$, incorporating the normalizing constant in $H_rho$, and define

$ M_rho \( y \) = bb(E) \[ f \( Z \) divides Y = y \] . $

We use the version defined at every $y$ by the conditional density. Completing its quadratic gives

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(L) \( Z divides Y = y \) \( d z \) med prop med exp (- frac(\| z - rho y \|^2, 2 a) - F \( x + r z \)) d z . $ <eq:conditional-tilt>]

Under the change of variables $z = rho y + sqrt(a) thin w$, $M_rho \( y \)$ is exactly the primitive mean with center $x + r rho y$ and scale $r sqrt(a)$. In particular, $M_0 = u$. Thus the conditional mean is a new instance of the problem already defined in (2.1), at a specified center and a smaller positive scale. This is a density identity; evaluating that mean from finitely many gradient queries remains part of the construction.

=== 3.1 Cumulants from the Poincaré inequality <cumulants-from-the-poincaré-inequality>

For related derivative and cumulant estimates for Gaussian-smoothed log-concave potentials, see #cite(label("chen2026picard"), form: "prose") Appendix C.2. Here we need bounds for every nontrivial unfolding of each tensor; we derive that form directly from Poincaré.

A tensor $T in \( bb(R)^D \)^(⊗ n)$ can be viewed as a matrix by partitioning its $n$ slots into two nonempty sets $A$ and $B$. Contraction on the $A$ slots then defines a linear map $\( bb(R)^D \)^(⊗ \| A \|) arrow.r \( bb(R)^D \)^(⊗ \| B \|)$, where both tensor spaces carry their Euclidean, or Frobenius, norm. We call the operator norm of this matrix a #emph[split norm]. Equivalently, it is the supremum of $\| T : \( V ⊗ W \) \|$ over coefficient tensors $V \, W$ of Frobenius norm at most one, with slots in $A \, B$, respectively. The colon denotes contraction over all paired slots. A bound on $\| T \|_(upright("split"))$ means that bound for every such partition. Permuting slots simply permutes these norms. The Frobenius norm of a tensor itself is denoted by $\| T \|_F$.

We use the multivariate Appell polynomials described in #cite(label("anshelevich2004appell"), form: "prose") Section 2.3. Their vanishing expected lower derivatives connect Poincaré inequalities to tensor covariance bounds; see #cite(label("adamczak2015concentration"), form: "prose") Proposition 3.2 and Theorem 3.3 and #cite(label("kothari2017agnostic"), form: "prose") Section 4.2. We give the direct $L^2$ argument, with its dependence on the polynomial degree, and then use a logarithm with two groups of variables to bound every split of the cumulant tensor.

We use the following consequence of Poincaré, including for random vectors whose laws need not have densities in their ambient spaces.

#thm([Lemma 3.1.])[
  (All-split cumulant bound).  #emph[Let $S$ be a random vector in $bb(R)^D$ whose moment-generating function is finite in a neighborhood of zero. Suppose that, for some $beta gt.eq 0$, 
$ "Var" \( P \( S \) \) lt.eq beta bb(E) \| nabla P \( S \) \|^2 $

 for every polynomial $P$ on $bb(R)^D$. For each integer $n gt.eq 2$, define its cumulant tensor by $kappa_n \( S \) = nabla_theta^n log bb(E) e^(theta dot.op S)\|_(theta = 0)$. Then, for an absolute constant $C$, 
$ \| kappa_n \( S \) \|_(upright("split")) lt.eq C^n n^(C n) beta^(n \/ 2) $

 for every nontrivial split. The constant is independent of $D$ and of the mean of $S$.]
] <lem:appell-cumulants>

#proof[
  We first prove a dimension-independent covariance bound for centered polynomial tensors. We then recover cumulants from those covariances. If $beta = 0$, applying the hypothesis to coordinate functions shows that $S$ is almost surely constant, so every cumulant in the statement vanishes. We may therefore suppose $beta > 0$.
  Define the symmetric Appell tensor polynomials by
  $ P_j \( s \) = nabla_theta^j frac(exp \( theta dot.op s \), bb(E) exp \( theta dot.op S \))\|_(theta = 0) . $
  For a coefficient tensor $T$ of order $j$, let $Q_T \( s \) = T : P_j \( s \)$, where the colon denotes contraction on all slots. Differentiating the generating function in $s$ multiplies it by copies of $theta$. Consequently
  $ bb(E) nabla^h Q_T \( S \) = 0 quad \( 0 lt.eq h < j \) \, #h(2em) nabla^j Q_T = j ! "Sym" \( T \) . $
  Here $"Sym" \( T \)$ is the average over all permutations of the slots; hence $\| "Sym" \( T \) \|_F lt.eq \| T \|_F$. Apply Poincaré to each component of $nabla^h Q_T$ and sum. Iterating from $h = 0$ to $h = j - 1$ yields
  #[#set math.equation(numbering: n => "(3.2)")
   $ bb(E) \| T : P_j \( S \) \|^2 lt.eq beta^j \( j ! \)^2 \| T \|_F^2 . $ <eq:appell-l2>]
  Only first derivatives in the displayed Poincaré inequality are used at each application.
  In particular, if $T$ and $V$ have orders $j \, k gt.eq 1$, then
  #[#set math.equation(numbering: n => "(3.3)")
   $ lr(|bb(E) #scale(x: 120%, y: 120%)[\[] \( T : P_j \( S \) \) \( V : P_k \( S \) \) #scale(x: 120%, y: 120%)[\]]|) lt.eq beta^(\( j + k \) \/ 2) j ! k ! thin \| T \|_F \| V \|_F . $ <eq:appell-covariance>]
  This is the direct covariance estimate. It concerns arbitrary coefficient tensors, rather than products of one-dimensional test directions, which is why it controls a matrix split.
  To pass from covariance to cumulants while preserving a specified split, consider the two-variable generating function
  $ cal(G) \( theta \, omega \) = frac(bb(E) exp \( \( theta + omega \) dot.op S \), bb(E) exp \( theta dot.op S \) thin bb(E) exp \( omega dot.op S \)) . $
  Its derivative of orders $j gt.eq 1$ in $theta$ and $k gt.eq 1$ in $omega$ at $\( 0 \, 0 \)$ is the cross-moment tensor $bb(E) \[ P_j \( S \) ⊗ P_k \( S \) \]$. Across the split between the $theta$ and $omega$ slots its operator norm is at most $beta^(\( j + k \) \/ 2) j ! k !$ by (3.3).
  Both $cal(G) \( theta \, 0 \)$ and $cal(G) \( 0 \, omega \)$ are identically one. Thus every nonzero term of $cal(G) - 1$ contains variables from both groups. In the formal identity
  $ log cal(G) = sum_(m gt.eq 1) frac(\( - 1 \)^(m + 1), m) \( cal(G) - 1 \)^m \, $
  only $m lt.eq n$ can contribute at total order $n$. Every differentiated product is a tensor product of the preceding cross-moment operators, up to permutations within the two sides. Its norm is therefore at most the product of their norms. To bound the total coefficient, distribute the $n$ labeled derivative slots among at most $n$ ordered nonempty factors. There are at most $n^(n + 1)$ such assignments; the product of the factorials within any assignment is at most $n !$. Enlarging an absolute constant bounds their total by $C^n n^(C n)$.
  The mixed derivatives of $log cal(G)$ are precisely the corresponding derivatives of $log bb(E) exp \( \( theta + omega \) dot.op S \)$, since the other two logarithms have only one variable group. They are the cumulants, and the two groups can represent any prescribed nontrivial split of the $n$ slots. This proves the claim. ◻
]

In the conditional density, $y$ enters through the linear tilt $rho y \/ a$, so each differentiation of $M_rho$ with respect to $y$ supplies a factor $rho$. We divide out these factors to state bounds that remain meaningful at $rho = 0$.

#thm([Proposition 3.2.])[
  (Gaussian jet bounds).  #emph[Under the assumptions above, in particular $l lt.eq 1 \/ 2$, define for each integer $q gt.eq 1$ 
$ U_q \( rho \, y \) = rho^(- q) nabla^q M_rho \( y \) #h(2em) \( rho > 0 \) . $

 These tensors extend smoothly to $rho = 0$. There is an absolute constant $C$ such that, for every $0 lt.eq rho < 1$, $y in bb(R)^d$ and every split, 
#[#set math.equation(numbering: n => "(3.4)")
 $ \| U_q \( rho \, y \) \|_(upright("split")) lt.eq C^q q^(C q) L \( sqrt(a) \)^(- \( q - 1 \)) . $ <eq:jets>]

 Here and below the vector-output slot is included among the tensor slots. The constant is uniform in the dimension, the primitive, its center and scale, and the derivative order $q$. Moreover, $D M_rho$ and $U_1$ are symmetric, and 
#[#set math.equation(numbering: n => "(3.5)")
 $ nabla H_rho \( y \) = y + r rho M_rho \( y \) \, #h(2em) parallel nabla^2 H_rho parallel_(upright("op")) lt.eq C . $ <eq:interpolation-score>]

 For $j gt.eq 1$, every split of $nabla^j nabla^2 H_rho$ is bounded by 
#[#set math.equation(numbering: n => "(3.6)")
 $ C^(j + 1) \( j + 1 \)^(C \( j + 1 \)) \( sqrt(a) \)^(- j) . $ <eq:score-derivatives>]

]
] <prop:gaussian-jets>

#proof[
  The conditional potential in (3.1) has Hessian between $\( a^(- 1) - l \) I$ and $\( a^(- 1) + l \) I$. By Lemma 3, its Poincaré constant is at most $C a$. Under this conditional law the map
  $ z mapsto S \( z \) = \( z \, f \( z \) \/ L \) $
  has derivative norm at most $sqrt(2)$, since $f$ is $L$-Lipschitz. Pulling back an ambient test function shows that the possibly singular law of $S$ satisfies Poincaré with constant $C a$. It has exponential moments of every linear functional: $f$ has at most linear growth and the conditional law has Gaussian tails. Lemma 5 therefore applies. This use of repeated Poincaré does not differentiate $f$ repeatedly. Each application pulls back a new ambient polynomial and uses only $D f$.
  In the conditional density, the linear tilt parameter for $z$ is $rho y \/ a$. Repeated differentiation of an expectation with respect to a linear tilt gives joint cumulants. In coordinates this says
  #[#set math.equation(numbering: n => "(3.7)")
   $ \( U_q \)_(i \, k_1 \, dots.h \, k_q) = a^(- q) "cum" \( f_i \( Z \) \, Z_(k_1) \, dots.h \, Z_(k_q) divides Y = y \) . $ <eq:jet-cumulant>]
  It can also be checked directly by differentiating the logarithm of the conditional moment-generating function with one auxiliary parameter coupled to $f_i$. Restrict the cumulant of $S$ to one $f \/ L$ coordinate and $q$ ordinary coordinates. Lemma 5 gives a factor $L a^(\( q + 1 \) \/ 2)$, and the prefactor $a^(- q)$ gives (3.4).
  All the conditional integrals used here are smooth in $\( rho \, y \)$ for $rho < 1$. This follows by differentiating their densities: on compact parameter sets, every derivative inserts a polynomial with an integrable Gaussian majorant. Formula (3.7) gives the smooth extension at zero without division by $rho$. For later integrations by parts we record a slightly stronger regularity fact. On each compact interval in $rho < 1$, conditional moments of any fixed order grow at most polynomially in $y$. Indeed, the conditional mode satisfies
  $ z_0 = rho y - a r g \( x + r z_0 \) \, $
  so $\| z_0 \| lt.eq C \( \| y \| + r \| g \( x \) \| \)$. The upper and lower conditional Hessian bounds compare the density and its normalizing integral around this mode to Gaussian integrals. This proves the claimed moment growth. The same argument applies to time derivatives of the conditional integrals. Dimension-dependent constants are harmless for this regularity justification; the quantitative estimates above remain dimension-uniform.
  Conditional integration by parts gives $bb(E) \[ Z divides Y = y \] = rho y - a r M_rho \( y \)$. Differentiating the marginal density then yields the first identity in (3.5). For $rho > 0$ it implies symmetry of $D M_rho$, hence of $U_1$; continuity handles zero. Its derivative, together with (3.4), gives the bounded Hessian and (3.6). In particular, all these conclusions use only the original $C^2$ regularity of $F$. ◻
]

=== 3.2 The transport equation <the-transport-equation>

#thm([Proposition 3.3.])[
  (Probability transport).  #emph[The ordinary differential equation 
#[#set math.equation(numbering: n => "(3.8)")
 $ frac(d Y_rho, d rho) = - r M_rho \( Y_rho \) $ <eq:transport>]

 transports $xi_0 = N \( 0 \, I_d \)$ to $xi_rho$ for every $rho < 1$. Its velocity is globally $C l$-Lipschitz in space. On every compact probability-time interval it has a smooth flow in both directions.]
] <prop:transport>

#proof[
  For the random interpolation used to define $xi_rho$,
  $ frac(d, d rho) \( rho Z + sqrt(a) thin N \) = frac(Z - rho Y, a) . $
  The conditional mean of this derivative is $- r M_rho \( Y \)$ by the conditional integration-by-parts identity above. Thus, for compactly supported smooth $phi.alt$,
  $ frac(d, d rho) integral phi.alt thin d xi_rho = - r integral M_rho dot.op nabla phi.alt thin d xi_rho . $
  On the other hand, (3.4) with $q = 1$ gives $r parallel D M_rho parallel_(upright("op")) lt.eq C l$. The velocity has at most linear growth, so its smooth ordinary differential equation has a global-in-space flow and inverse on every compact interval in $rho < 1$. To identify its pushforward, fix a smooth compactly supported terminal test and transport it backward along this flow. The transported test has zero material derivative. Its supports remain in a bounded set on the interval, by the linear-growth bound. The last display then shows its expectation under $xi_rho$ is constant, which proves the pushforward assertion. ◻
]

The remaining analytic difficulty is not spatial smoothness, which the Gaussian interpolation has supplied. It is to control repeated derivatives #emph[along] the transport while paying only one $sqrt(d)$ factor for vector outputs. We establish that control next.

== 4 Dimension bounds for material derivatives <sec:divergence>

The Gaussian interpolation has supplied spatial derivatives of every order using only the original $C^2$ potential. We now need derivatives along its transporting trajectories. These are the derivatives that control the error when a path integral is replaced by polynomial quadrature. Applying a Euclidean norm after each differentiation would lose a new power of $d$ each time. We will keep at least two tensor slots free throughout the calculation and convert to a vector norm only at the last step.

Retain the primitive parameters $L = lambda r$ and $l = r L lt.eq 1 \/ 2$, and the interpolation $xi_rho = cal(L) \( rho Z + sqrt(a) thin N \)$, where $a = 1 - rho^2$ and $0 lt.eq rho < 1$. Expectations and $L^p$ norms in this section use $xi_rho$ at the displayed probability time. Along a solution of $Y'_rho = - r M_rho \( Y_rho \)$, the chain rule gives

$ frac(d, d rho) Q \( rho \, Y_rho \) = \( cal(D) Q \) \( rho \, Y_rho \) \, #h(2em) cal(D) = partial_rho - r M_rho dot.op nabla . $

Thus the required path derivatives are iterates of $cal(D)$.

The useful form of their identities involves the adjoint of a spatial derivative. If a tensor field $V$ has a distinguished coordinate slot $k$, define its #emph[adjoint divergence on that slot] by

$ \( nabla^(*) V \)_I = sum_(k = 1)^d { - partial_k V_(I \, k) + \( partial_k H_rho \) V_(I \, k) } . $

Here $I$ lists the slots that remain; the distinguished slot need not have been last before a permutation. For a compactly supported smooth test function $phi.alt$, the defining integration-by-parts relation is

$ integral \( nabla^(*) V \)_I phi.alt thin d xi_rho = integral sum_(k = 1)^d V_(I \, k) partial_k phi.alt thin d xi_rho . $

The next identities express material derivatives using this operation and contractions of the normalized spatial jets $U_q = rho^(- q) nabla^q M_rho$ from Proposition 6.

=== 4.1 Material derivatives of the conditional jets <material-derivatives-of-the-conditional-jets>

#thm([Lemma 4.1.])[
  #emph[The mean and its jets satisfy 
#[#set math.equation(numbering: n => "(4.1)")
 $ cal(D) M & = nabla^(*) U_1 \,\
\( cal(D) U_q \)_(i \, I) & = \( nabla^(*) U_(q + 1) \)_(i \, I) + 2 r rho sum_(diameter eq.not S subset.eq I) \( U_(\| S \|) \)_(k \, S) \( U_(q - \| S \| + 1) \)_(i \, k \, I \\ S) \, #h(2em) q gt.eq 1 . $ <eq:material-mean-identity>]

 In the second identity $I$ is a labeled list of $q$ derivative slots; subsets refer to positions in that list and the index $k$ is summed. For any smooth tensor field $V$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ cal(D) \( nabla^(*) V \) = nabla^(*) \( cal(D) V \) + r nabla^(*) \( \( D M_rho \) V \) \, $ <eq:material-adjoint-identity>]

 where the matrix acts on the slot removed by the divergence. These identities hold also at $rho = 0$ by continuous extension.]
] <lem:material-identities>

#proof[
  Differentiate $bb(E) \[ f_i \( Z \) phi.alt \( Y \) \] = integral \( M_rho \)_i phi.alt thin d xi_rho$. The right side differentiates using the transporting velocity from Proposition 7. On the left the random velocity is $\( Z - rho Y \) \/ a$. Subtract its conditional mean from the flux multiplying $nabla phi.alt$. The remaining coefficient is $"Cov" \( f_i \( Z \) \, Z_k divides Y \) \/ a = \( U_1 \)_(i \, k)$ by (3.7). Integration by parts proves (4.1).
  For the higher identity, coordinate differentiation gives
  $ cal(D) partial_I M_i = partial_I cal(D) M_i + r sum_(diameter eq.not S subset.eq I) \( partial_S M_k \) partial_k partial_(I \\ S) M_i . $
  Insert (4.1) and multiply by $rho^(- q)$. When all derivatives pass inside the adjoint divergence, the result is $nabla^(*) U_(q + 1)$. In the other terms they hit the score $y + r rho M_rho$. A derivative hitting its linear part contributes $q U_q \/ rho$, canceled by differentiating the prefactor $rho^(- q)$. The nonlinear score terms and the material/spatial commutator terms are identical after scaling: each is
  $ r rho sum_(diameter eq.not S subset.eq I) \( U_(\| S \|) \)_(k \, S) \( U_(q - \| S \| + 1) \)_(i \, k \, I \\ S) . $
  This proves (4.1). Each contraction retains at least one free slot in each tensor.
  Finally differentiate the adjoint identity against a transported scalar test, componentwise in the other slots. The terms involving $cal(D) phi.alt$ cancel. The gradient commutator is
  $ cal(D) partial_k phi.alt - partial_k cal(D) phi.alt = r \( partial_k M_j \) partial_j phi.alt . $
  Moving it to the other side by the adjoint relation gives (4.2). All coefficients in the final formulas are nonsingular at zero, so the extensions follow from Proposition 6. ◻
]

=== 4.2 Contractions and the expressions they generate <contractions-and-the-expressions-they-generate>

Before iterating the material identities, we isolate the norm estimate that makes their product terms harmless. Each coordinate slot represents a copy of $bb(R)^d$. Contracting one slot of each of two tensors means summing the product over one common coordinate, leaving every other slot free. The restriction to one slot is what lets us interpret the operation as matrix composition.

#thm([Lemma 4.2.])[
  (A single contraction).  #emph[Let $A$ and $B$ be tensors, and contract one slot of $A$ with one slot of $B$, leaving at least one free slot in each. For any nontrivial split of the resulting free slots there are nontrivial splits of $A$ and $B$ such that 
$ \| A * B \|_(upright("split")) lt.eq \| A \|_(upright("split")) \| B \|_(upright("split")) . $

]
] <lem:split-contraction>

#proof[
  Call the two sides of the required output split the input and output sides. Orient the contracted index from one factor to the other. If all free slots of one factor lie on the same side, its contracted slot must be placed on the opposite side of that factor’s unfolding. These requirements are compatible: incompatibility would put every free slot of the result on one side, contrary to the hypothesis. If a factor already has free slots on both sides, it imposes no requirement on the orientation. With the resulting orientation, the contraction is composition of the two matrix actions, with identities on the unused input and output coordinates and with coordinate permutations. Identities and these permutations have operator norm one. Submultiplicativity proves the assertion. ◻
]

We can now specify exactly which tensor formulas will be estimated. This also records which contractions may occur: contracting two slots of a single tensor is not one of the allowed operations.

#prodef([Definition 4.3.])[
  (Tensor expressions and their weights).  A tensor expression is a finite formula built by the following rules.
  + For each integer $q gt.eq 1$, $U_q \/ L$ is an expression with $q + 1$ free slots and weight $q - 1$.
  + A permutation of the free slots preserves the weight.
  + Two expressions may be contracted on one chosen slot each, provided each factor retains at least one free slot. The resulting weight is the sum of their weights.
  + An adjoint divergence on a chosen free slot is allowed when at least two free slots remain. It increases the weight by one.
  The formula specifies its leaves, their orders, and the slots used at each operation. This finite syntactic data is independent of $d \, rho \, x \, r$ and of the potential. Repeated occurrences are treated as separate factors, even when their values agree.
] <def:divergence-expressions>

For example, $nabla^(*) \( U_2 \/ L \)$ has two free slots and weight two, whereas $nabla^(*) \( U_1 \/ L \)$ is not an expression under these rules: it has vector output. The latter is precisely the operation we will reserve for the final $sqrt(d)$ estimate. If $E$ is an expression, $nabla^j E$ has $j$ additional free derivative slots, and a split may place any of these slots on either side. The next theorem bounds all such splits simultaneously. Its dependence on $j$ and $p$ is explicit because its proof must later take a moment order growing with $log d$.

For a related Gaussian result, #cite(label("chen2026divergence"), form: "prose") Theorem 1.1 and Corollary 1.4 prove sharp divergence inequalities with Hilbert–Schmidt derivative norms. Here we require estimates under the generally non-Gaussian law $xi_rho$ that retain every matrix split through the contractions and adjoint divergences in Definition 10.

#thm([Theorem 4.4.])[
  (Tensor divergence bound).  #emph[Let $E$ be a tensor expression of weight $k$ in Definition 10. There is a constant $C_E gt.eq 1$, depending only on that finite formula, such that for every integer $j gt.eq 0$, every real $2 lt.eq p < oo$, every $0 lt.eq rho < 1$, and every nontrivial split, 
#[#set math.equation(numbering: n => "(4.3)")
 $ parallel thin \| nabla^j E \|_(upright("split")) thin #scale(x: 120%, y: 120%)[parallel]_(L^p \( xi_rho \)) lt.eq C_E^(j + 1) #scale(x: 120%, y: 120%)[\(] p + j + log \( d + 1 \) #scale(x: 120%, y: 120%)[\)]^(C_E \( j + 1 \)) \( sqrt(a) \)^(- \( k + j \)) . $ <eq:network>]

 The same $C_E$ works for all $j \, p \, d \, rho \, x \, r$. In particular it is not restricted to fixed derivative or moment orders.]
] <thm:tensor-divergence>

#proof[
  We induct on the finite construction of $E$, proving all derivative and moment orders simultaneously. Permutations and single contractions follow directly from the preceding lemma. For a divergence, we first integrate by parts in a high trace moment. The resulting coordinate sums can be arranged as a composition of matrix unfoldings with only one closing trace. We then choose the moment large enough to absorb that trace’s dimension factor.
  For a normalized jet, $nabla^j U_q = rho^j U_(q + j)$, so Proposition 6 proves the assertion after enlarging a constant depending on $q$. Permutations cause no change. For a contraction, distribute the derivatives by Leibniz, use Lemma 9 on each summand, and use the inductive estimates at exponent $2 p$ on both factors. The number of Leibniz summands is at most $2^j$. Their weights and derivative orders add, giving (4.3) with an enlarged fixed constant.
  It remains to consider $E = nabla^(*) V$, where $V$ has weight $k_V$ and $E$ has at least two slots. Commute the $j$ derivatives past the divergence. Apart from
  $ T = nabla^(*) \( nabla^j V \) \, $
  the terms are single contractions of $nabla^(j - h) V$ with an order-$h$ derivative of the score, $1 lt.eq h lt.eq j$. Both factors retain slots. The score derivative is bounded pointwise by a constant of the form $C^h h^(C h) \( sqrt(a) \)^(- \( h - 1 \))$, by (3.5)–(3.6). Lemma 9, the inductive hypothesis, and Leibniz multiplicities therefore give the required bound for all these terms, even with exponent $k_V + j - 1$ in place of the larger allowed exponent $k_V + j + 1$. It remains to bound $T$.
  ===== 4.2.1 Removing the adjoints. <removing-the-adjoints.>
  Fix an unfolding of $T$, with both sides nonempty, and an integer $s gt.eq 1$. Pointwise,
  $ parallel T parallel_(upright("op"))^(2 s) lt.eq "tr" \( \( T T^T \)^s \) . $
  Expand the trace by coordinate indices. It contains $2 s$ labeled primary factors, each an adjoint divergence of $nabla^j V$. Their free slots are joined in the alternating trace cycle; the two bundles incident to each primary factor are nonempty.
  Remove adjoint divergences one at a time by integration by parts. For a chosen primary, its adjoint differentiates the product of the other factors, never its own inside field. If a derivative hits a remaining adjoint, use
  $ partial_i \( nabla^(*) W \) = nabla^(*) \( partial_i W \) + \( partial_i partial_k H_rho \) W_k . $
  The first term leaves that adjoint to be processed later. The second consumes it and creates a Hessian factor joining the two divergence indices. A later derivative may also hit a previously created Hessian factor. After all adjoints have been removed, a typical term has primary factors $nabla^(j + e_i) V$, $1 lt.eq i lt.eq 2 s$, and $n_H$ factors $nabla^(h_v) nabla^2 H_rho$. The bookkeeping identity is
  #[#set math.equation(numbering: n => "(4.4)")
   $ sum_(i = 1)^(2 s) e_i + sum_(v = 1)^(n_H) h_v + 2 n_H = 2 s . $ <eq:network-degree-count>]
  Indeed, a removed adjoint either adds one derivative or pairs with another adjoint to create a Hessian. Each step has at most $C s$ possible target factors and at most two commutator terms, so there are at most $\( C s \)^(C s)$ resulting terms.
  We use a graph only to describe these explicit coordinate sums. Its primary vertices are the $2 s$ labeled tensor factors; a Hessian vertex represents one factor $nabla^(h_v) nabla^2 H_rho$. An edge represents a pair of tensor slots summed over a common coordinate, and a bundle represents several such edges. Three properties will control its contraction. All original trace bundles remain. Every new direct edge connects distinct primary factors, because an adjoint never differentiates its own inside field. Finally, each Hessian factor has at least two distinct primary neighbors, the pair that created it, and there are no Hessian-to-Hessian edges. Later derivatives only add further primary-to-Hessian edges. These statements remain true if some derivatives had already been commuted inside an unprocessed adjoint.
  ===== 4.2.2 Opening the trace. <opening-the-trace.>
  Choose one bundle in the original trace cycle and cut it, leaving its $b gt.eq 1$ indices unsummed at the two ends. All remaining original bundles form a chain through the $2 s$ primary factors. Order these factors along that chain. For each Hessian factor, its two distinct creating primaries have different positions, so we can place it strictly between its earliest and latest primary neighbors. No edge joins two Hessians, so these placements impose no competing condition. Order Hessians occupying the same interval arbitrarily, and orient every uncut edge from its earlier factor to its later factor. The $b$ cut indices enter the first primary and leave the last one.
  Every tensor has both an input and an output in this ordering. An interior primary receives one original chain bundle and sends the next; at the two endpoints the cut bundle supplies the missing side. A Hessian receives an edge from an earlier neighbor and sends an edge to a later one. Thus all the matrix unfoldings used below are nontrivial splits, exactly as required by the induction hypothesis.
  Here is an explicit matrix-composition interpretation. Immediately before processing a factor, retain one copy of $bb(R)^d$ for each index whose earlier endpoint has been processed but whose later endpoint has not. The initial space is $\( bb(R)^d \)^(⊗ b)$, belonging to the cut inputs. Permute these tensor coordinates so that the incoming indices of the next factor are adjacent. Apply that factor’s matrix unfolding to them and the identity to all other retained coordinates; then permute the outputs into the new retained list. Matrix multiplication performs precisely the sums over the incoming indices. Induction over the factors therefore accounts for every uncut index once and leaves only the $b$ cut outputs at the end. If $Q$ denotes the resulting map from $\( bb(R)^d \)^(⊗ b)$ to itself, then
  $ parallel Q parallel_(upright("op")) lt.eq product_(i = 1)^(2 s) \| nabla^(j + e_i) V \|_(upright("split")) product_(v = 1)^(n_H) \| nabla^(h_v) nabla^2 H_rho \|_(upright("split")) . $
  Indeed coordinate permutations and the intervening identity maps have operator norm one. Closing the original cut is now exactly a single matrix trace, so the absolute value of this completely contracted term is at most
  #[#set math.equation(numbering: n => "(4.5)")
   $ \| "tr" Q \| lt.eq d^b parallel Q parallel_(upright("op")) . $ <eq:divergence-single-trace>]
  This argument explains why other undirected cycles introduce no further dimension factor: their coordinate sums have already been performed by the matrix compositions. Figure 1 shows a possible ordering.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$P_1$]]])])
  content((2, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$P_2$]]])])
  content((2.717, 1.067), (3.283, 1.633), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$cal(H)$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$P_3$]]])])
  content((6, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$P_4$]]])])
  line((-1.2, 0), (-0.45, 0), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0.45, 0), (1.55, 0), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((2.45, 0), (3.55, 0), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((4.45, 0), (5.55, 0), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((6.45, 0), (7.2, 0), stroke: (thickness: 1.1pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((0, 0.4), (2.593, 1.35), (0.187, 1.461), (1.516, 1.35), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((3.407, 1.35), (4, 0.4), (3.844, 1.35), (3.962, 0.8351), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((2, -0.4), (6, -0.4), (3.195, -1.403), (4.805, -1.403), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((1.55, -0.4), (6.45, -0.4), (2.204, -2.196), (5.796, -2.196), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((7.2, 0), (7.2, -2.4), (-1.2, -2.4), (-1.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((3, -2.4), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[the sole closing trace: cost $d^b$]]])])
  content((3, 1.95), [#text(size: 9pt)[order $P_1,P_2, cal(H) ,P_3,P_4$]], anchor: "south", padding: 0.1176cm)
  content((-0.75, 0.6), [#text(size: 9pt)[input]], anchor: "south", padding: 0.1176cm)
  content((6.75, 0.6), [#text(size: 9pt)[output]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: A schematic term with four primary tensors $P_i = nabla^(j + e_i) V$ after removing the adjoint divergences. Thick arrows are the surviving trace-chain bundles; thin arrows are new contracted indices. Here $cal(H) = nabla^2 H_rho$ is the Hessian factor, inserted between its first and last primary neighbors. The arrows specify matrix inputs and outputs, so every factor acts across a nontrivial split. The dashed closure is the one trace in (4.5); its cost $d^b$ becomes bounded after taking a sufficiently high moment root. ],
  ) <fig:tensor-cut>
  ===== 4.2.3 Uniform high-moment bookkeeping. <uniform-high-moment-bookkeeping.>
  The coordinate expansion and its contraction estimate are now complete. It remains to verify that their constants allow $s$ to grow with $d$ and $j$. Apply the induction hypothesis to every primary factor with moment exponent $2 s$, and use the pointwise Hessian estimates on all other factors. There are exactly $2 s$ random primary factors, so Hölder’s inequality uses no larger exponent. The power of $1 \/ sqrt(a)$ before taking the $2 s$-th root is at most
  $ 2 s \( k_V + j \) + sum_i e_i + sum_v h_v lt.eq 2 s \( k_V + j + 1 \) . $
  Since $e_i \, h_v lt.eq 2 s$, all polynomial bases in the inductive estimates are at most $C \( s + j + log \( d + 1 \) \)$. The total exponent of those bases is at most
  $ C (2 s \( j + 1 \) + sum_i e_i + sum_v \( h_v + 1 \)) lt.eq C' s \( j + 1 \) \, $
  using (4.4). The term count $\( C s \)^(C s)$ is absorbed in the same bound. The cut bundle uses only the original free slots of $T = nabla^(*) \( nabla^j V \)$, not the new indices introduced by integration by parts. Consequently $b lt.eq j + C_V$, where $C_V$ depends only on the fixed number of slots of $V$, and not on $s$. We have proved
  $ bb(E) parallel T parallel_(upright("op"))^(2 s) lt.eq d^(j + C_V) \[ C \( s + j + log \( d + 1 \) \) \]^(C s \( j + 1 \)) \( sqrt(a) \)^(- 2 s \( k_V + j + 1 \)) . $
  Choose $s$ to be the smallest positive integer satisfying $2 s gt.eq p$ and $s gt.eq \( j + C_V \) log \( d + 1 \)$, increasing $C_V$ if necessary. Then $d^(\( j + C_V \) \/ \( 2 s \)) lt.eq e^(1 \/ 2)$ and
  $ s lt.eq C_V #scale(x: 120%, y: 120%)[\(] p + \( j + 1 \) log \( d + 1 \) #scale(x: 120%, y: 120%)[\)] . $
  The expression on the right is bounded by a fixed multiple of $\( p + j + log \( d + 1 \) \)^2$. Taking the $2 s$-th root, using monotonicity of probability-space $L^p$ norms, and increasing $C_E$ now gives (4.3) with $k = k_V + 1$.
  All integration-by-parts identities above are legitimate for each finite $j \, s \, d$ and each $rho < 1$. Indeed, the conditional-integral regularity in Proposition 6, together with the score formula, gives polynomial growth for every field and derivative appearing in the finite expansion. The laws $xi_rho$ have Gaussian tails. Cutoffs therefore justify the identities with vanishing boundary terms. Uniformity in growing $s$ is supplied by the explicit estimates after the identities, not by an unproved uniform regularity assertion. This completes the induction. ◻
]

=== 4.3 One final vector dimension factor <one-final-vector-dimension-factor>

The preceding theorem controls every tensor expression while at least two slots remain. Only the last divergence producing a vector will cost a $sqrt(d)$ factor. The following elementary identity makes that cost explicit.

#thm([Lemma 4.5.])[
  (Frobenius divergence estimate).  #emph[Let $mu \( d y \) prop e^(- H \( y \)) d y$, where $H in C^2 \( bb(R)^d \)$ has bounded Hessian and $mu$ has Gaussian tails. Let $V$ be a smooth tensor field with a distinguished divergence slot and with $V \, nabla V in L^2 \( mu \)$ in Frobenius norm. Then 
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel nabla^(*) V parallel_(F \, 2) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel V parallel_(F \, 2) + parallel nabla V parallel_(F \, 2) #scale(x: 120%, y: 120%)[\)] \, $ <eq:divergence-l2>]

 where $C$ depends only on $parallel nabla^2 H parallel_(upright("op") \, oo)$, and is independent of $d$ and the number of remaining tensor slots. For $H = H_rho$ it is an absolute constant.]
] <lem:divergence-l2>

#proof[
  First take a compactly supported smooth vector field, so that the output is scalar. Integrating by parts twice gives
  $ integral \( nabla^(*) V \)^2 thin d mu = integral sum_(i \, j) [\( partial_i V_j \) \( partial_j V_i \) + V_i \( partial_(i j) H \) V_j] d mu . $
  The first term is bounded in absolute value by $\| nabla V \|_F^2$, and the second by $parallel nabla^2 H parallel_(upright("op")) \| V \|^2$. For tensor output, apply the scalar identity to each fixed collection of remaining indices and sum. Taking a square root proves (4.6) for compactly supported fields. For general $V$, multiply by smooth cutoffs $chi_R$ equal to one on the ball of radius $R$, with $\| nabla chi_R \| lt.eq C \/ R$. Then $chi_R V arrow.r V$ and $nabla \( chi_R V \) arrow.r nabla V$ in $L^2 \( mu \)$, while their adjoint divergences converge pointwise. Fatou’s lemma proves the stated estimate. All fields to which we apply it have polynomially growing derivatives and hence satisfy the required integrability. ◻
]

#thm([Corollary 4.6.])[
  (Derivatives along transported paths).  #emph[For each fixed integer $m gt.eq 1$, 
#[#set math.equation(numbering: n => "(4.7)")
 $ parallel cal(D)^m M_rho parallel_(L^2 \( xi_rho \)) lt.eq "polylog" \( d \) L sqrt(d) thin a^(- m) . $ <eq:path-mean>]

 For fixed integers $q gt.eq 1$, $m gt.eq 0$, and fixed real $2 lt.eq p < oo$, every nontrivial split satisfies 
#[#set math.equation(numbering: n => "(4.8)")
 $ parallel thin \| cal(D)^m U_q \|_(upright("split")) thin #scale(x: 120%, y: 120%)[parallel]_(L^p \( xi_rho \)) lt.eq "polylog" \( d \) L \( sqrt(a) \)^(- \( q - 1 + 2 m \)) . $ <eq:path-jet>]

 The constants hidden in $"polylog" \( d \)$ may depend on $m \, q \, p$ when these parameters occur, but are uniform in $rho$, the primitive center, scale, and oracle.]
] <cor:path-derivatives>

#proof[
  Iterate Lemma 8, using the product rule on contractions. Replacing $U_q$ by $nabla^(*) U_(q + 1)$ raises weight by two. Replacing it by one of the contracted products in (4.1) does not raise weight: the two jet weights sum to $q - 1$. The commutator (4.2) inserts $D M_rho = rho U_1$ of weight zero on the divergence slot. Every additional jet factor $L$ is accompanied by a factor $r$, so, after retaining one overall $L$, the extra factors are powers of $l = r L lt.eq 1$. Scalar coefficients are fixed polynomials in $rho$ and remain bounded under the fixed number of differentiations. Starting from a jet $U_q$, all divergences retain at least two free slots, and all contractions retain a slot of each factor. The resulting terms are therefore expressions of Theorem 11, of weight at most $q - 1 + 2 m$. Its case $j = 0$ proves (4.8).
  Starting instead from $M$, the first identity is $cal(D) M = nabla^(*) U_1$. Its outermost divergence remains a divergence to a vector under further material differentiations. Inside it, the same construction gives finitely many normalized expressions of weight at most $2 \( m - 1 \)$, each with one overall factor $L$. Apply Lemma 12 at this outermost operation. For a tensor with at least two slots, its Frobenius norm is at most $sqrt(d)$ times the operator norm of an unfolding that puts one coordinate slot on one side: that matrix has at most $d$ singular values. Thus Theorem 11, for $j = 0 \, 1$ and $p = 2$, bounds the right side of (4.6) by
  $ "polylog" \( d \) L sqrt(d) thin \( sqrt(a) \)^(- \( 2 m - 1 \)) lt.eq "polylog" \( d \) L sqrt(d) thin a^(- m) . $
  This is (4.7). ◻
]

To see the quantitative connection with quadrature, start the transport at its correct marginal and put $Q_rho = M_rho \( Y_rho \)$. Proposition 7 ensures that $Y_rho tilde.op xi_rho$, so (4.7) bounds $parallel Q_rho^(\( m \)) parallel_2$ for every probability time. On a cell $\[ rho_0 \, rho_1 \] subset \[ 0 \, 1 \)$ of length $h_c$, Taylor’s integral remainder and the $L^2$ triangle inequality give, for every $rho in \[ rho_0 \, rho_1 \]$,

$ ∥Q_rho - sum_(h = 0)^(m - 1) frac(\( rho - rho_0 \)^h, h !) Q_(rho_0)^(\( h \))∥_2 lt.eq frac(h_c^m, m !) sup_(t in \[ rho_0 \, rho_1 \]) parallel Q_t^(\( m \)) parallel_2 lt.eq C_m "polylog" \( d \) L sqrt(d) thin h_c^m \( 1 - rho_1^2 \)^(- m) . $

In particular, for a mesh ratio $theta > 0$, the condition $h_c lt.eq theta \( 1 - rho_1 \)$ makes this remainder at most $C_m "polylog" \( d \) L sqrt(d) thin theta^m$. This is a supremum of deterministic RMS bounds; it does not require an expected supremum over a random trajectory. The proof of Proposition 18 uses this cancellation between cell length and endpoint singularity in polynomial quadrature. Before constructing those finite formulas, we use the material identity itself to produce a stationary flow whose path integral represents a noisy mean.

== 5 A stationary flow for noisy means <sec:centering>

The probability transport turns conditional means into samples. We now construct the complementary operation: a path integral whose law is $N \( u \, s^2 I_d \)$ for a prescribed $s > 0$. The key is to represent the centered observable $M_(*) - u$ as a matrix adjoint divergence. That matrix couples a position with law $xi_(*)$ to a Gaussian momentum while preserving their product law; integrating the momentum equation then produces the noisy mean. This is still an exact mathematical construction: both its velocity and its ideal initial law will need to be implemented later.

Retain the primitive and interpolation notation of Sections 2–4. Thus $L = lambda r$, $l = lambda r^2 lt.eq 1 \/ 2$, $M_0 = u$, and the symmetric first jet satisfies $D M_rho = rho U_1$. Fix

$ 0 < R < 1 \/ 2 \, #h(2em) b_(*) = \( 1 - R^2 \)^(1 \/ 2) \, $

and use a star for evaluation at $rho = b_(*)$. The positive smoothing radius $R$ keeps all coefficients smooth, although $F$ itself is only $C^2$. In this section $rho$ is the Gaussian-interpolation parameter; the new stationary flow will use a separate time variable $t$.

=== 5.1 Transport Jacobians and the zero endpoint <transport-jacobians-and-the-zero-endpoint>

Let $T_rho = T_(rho arrow.r b_(*))$ denote the probability transport (3.8) from time $rho$ to time $b_(*)$. Given a terminal position $y$, define

$ Y_rho \( y \) = T_rho^(- 1) \( y \) \, #h(2em) B_rho \( y \) = D T_rho \( Y_rho \( y \) \) = \( D Y_rho \( y \) \)^(- 1) . $

In particular, $Y_(b_(*)) \( y \) = y$. The backward path satisfies $Y'_rho = - r M_rho \( Y_rho \)$ with this terminal condition. Its spatial Jacobian $J_rho = D Y_rho$ solves

$ J'_rho = - r D M_rho \( Y_rho \) J_rho \, #h(2em) J_(b_(*)) = I_d . $

Differentiating its inverse gives the order of multiplication in

#[#set math.equation(numbering: n => "(5.1)")
 $ B'_rho = r B_rho D M_rho \( Y_rho \) = r rho B_rho U_1 \( rho \, Y_rho \) \, #h(2em) B'_0 = 0 . $ <eq:backward-jacobian>]

The last equality is an exact endpoint identity, not an asymptotic estimate. Also $parallel B_rho parallel_(upright("op")) lt.eq C$, because $r parallel D M_rho parallel_(upright("op")) lt.eq C l$ and the time interval has length at most one. The following estimates control both spatial differentiation of the kernel and time interpolation of $B_rho$.

#thm([Lemma 5.1.])[
  (Transport derivatives).  #emph[For each fixed $k gt.eq 1$, the order-$k$ spatial derivatives of any transport between two times in $\[ 0 \, b_(*) \]$, after subtracting the identity map, have all nontrivial split norms at most 
$ C_k l R^(- \( k - 1 \)) . $

 For each fixed $m gt.eq 1$ and fixed finite $p gt.eq 1$, uniformly in $0 lt.eq rho lt.eq b_(*)$, 
$ parallel parallel B_rho^(\( m \)) \( y \) parallel_(upright("op")) parallel_(L^p \( y tilde.op xi_(*) \)) lt.eq "polylog" \( d \) thin l \( 1 - rho^2 \)^(- m) . $

 The constants and the polylogarithmic factor may depend on the fixed orders and on $p$, but not on the primitive center or scale.]
] <lem:transport-derivatives>

#proof[
  Differentiate the transport equation with respect to its starting position. Gronwall’s inequality gives a bounded first derivative and an $O \( l \)$ bound for its difference from $I_d$. For order $k > 1$, the chain rule has terms consisting of an order-$j$ derivative of the velocity and derivatives of the state of orders $i_1 \, dots.h \, i_j gt.eq 1$, where $i_1 + dots.h.c + i_j = k$. By (3.4), the outer tensor has every split norm at most $C_j l R^(- \( j - 1 \))$. Attach the inner tensors one at a time. Each attachment is a single contraction retaining the outer output and the inner derivative slots, so Lemma 9 applies without a dimension factor. Bound a first state derivative by a constant and use the induction hypothesis for all higher state derivatives. Since $l lt.eq 1$, the total power of $R^(- 1)$ is at most
  $ \( j - 1 \) + sum_(nu = 1)^j \( i_nu - 1 \) = k - 1 \, $
  and each forcing term retains the outer factor $l$. The term involving the unknown order-$k$ state derivative is linear, with coefficient bounded by $C l$, and this derivative starts at zero. Gronwall proves the assertion. The same argument with absolute interval lengths applies to transport in the reverse direction.
  For the second assertion, write $C_rho = r D M_rho \( Y_rho \) = r rho U_1 \( rho \, Y_rho \)$, so that $B'_rho = B_rho C_rho$. The product rule expresses $B_rho^(\( m \))$ as a finite sum of ordered products of $B_rho$ and $k gt.eq 1$ factors $C_rho^(\( j_1 \)) \, dots.h \, C_rho^(\( j_k \))$, with $j_1 + dots.h.c + j_k = m - k$. The zero-order jet bound and (4.8) imply, for every fixed moment order,
  $ parallel parallel C_rho^(\( j \)) parallel_(upright("op")) parallel_(L^p) lt.eq "polylog" \( d \) thin l \( 1 - rho^2 \)^(- j) . $
  Here the path estimates apply because inverse transport sends $y tilde.op xi_(*)$ to $Y_rho \( y \) tilde.op xi_rho$. Apply Hölder with sufficiently high fixed moments to each product. Using $l^k lt.eq l$ and $\( 1 - rho^2 \)^(- \( m - k \)) lt.eq \( 1 - rho^2 \)^(- m)$ gives the claimed conservative exponent. Moments below one, if desired, follow from the $L^1$ bound. ◻
]

=== 5.2 A kernel for the centered observable <a-kernel-for-the-centered-observable>

For a matrix field $K$, define its row-wise adjoint divergence by

$ \( nabla_(xi_(*))^(*) K \)_i = sum_j { - partial_j K_(i j) + \( partial_j H_(*) \) K_(i j) } . $

Thus $nabla_(xi_(*))^(*) K = h$ means $bb(E)_(xi_(*)) \[ h_i phi.alt \] = bb(E)_(xi_(*)) sum_j K_(i j) partial_j phi.alt$ for smooth compactly supported scalar tests $phi.alt$. We seek this identity with $h = M_(*) - u$.

This is a Stein-type integration-by-parts identity. A classical coordinate Stein kernel for a law $xi$ represents the observable $y - bb(E)_xi y$ instead. Courtade, Fathi and Pananjady construct such kernels from spectral-gap assumptions #cite(label("courtade2019stein")) arXiv version 2, Definition 2.1 and Theorem 2.4. Our observable is $M_(*) - u$; its mean is zero by conditional expectation. The transport formula below supplies its particular adjoint-divergence representation together with pointwise derivative bounds. Those bounds are needed for quadrature and do not follow from the cited existence statement. We do not require $K$ to be symmetric or positive.

Define

#[#set math.equation(numbering: n => "(5.2)")
 $ K \( y \)^T = integral_0^(b_(*)) B_rho \( y \) U_1 \( rho \, Y_rho \( y \) \) thin d rho = 1 / r integral_0^(b_(*)) B'_rho \( y \) thin frac(d rho, rho) . $ <eq:stein-kernel>]

The first integral defines the integrand at zero in the second formula: $B'_rho \/ \( r rho \) = B_rho U_1 \( rho \, Y_rho \)$ extends smoothly there. The transpose is essential: the adjoint divergence will act on the rows of $K$, while the position velocity will use $K^T$.

#thm([Lemma 5.2.])[
  (The centering kernel).  #emph[The field $K$ is smooth and satisfies 
$ nabla_(xi_(*))^(*) K = M_(*) - u \, #h(2em) parallel K \( y \) parallel_(upright("op")) lt.eq C L . $

 For each fixed $j gt.eq 1$, every nontrivial split norm of $nabla^j K$ is bounded pointwise by $C_j L R^(- j)$.]
] <lem:centering-kernel>

#proof[
  Fix an output coordinate $i$ and a smooth compactly supported scalar function $phi.alt$. The transported test $phi.alt compose T_rho$ has zero material derivative: it is constant along each probability-transport path. Differentiate its product with $M_(rho \, i)$ under the transported laws. Lemma 8 gives $cal(D) M_rho = nabla_(xi_rho)^(*) U_1$, so integration by parts and the chain rule yield
  $ frac(d, d rho) bb(E)_(xi_rho) \[ M_(rho \, i) thin phi.alt compose T_rho \] = bb(E)_(xi_rho) sum_(j \, k) \( U_1 \)_(i k) \( D T_rho \)_(j k) \( partial_j phi.alt \) compose T_rho . $
  Smooth transport on the compact time interval and Gaussian tails justify differentiation; alternatively the test can first be cut off and the resulting identities passed to the limit. Push the expectation forward to $y tilde.op xi_(*)$. Since $U_1$ is symmetric, its coefficient of $partial_j phi.alt \( y \)$ is
  $ sum_k \( U_1 \)_(i k) \( rho \, Y_rho \( y \) \) \( B_rho \( y \) \)_(j k) = \( B_rho \( y \) U_1 \( rho \, Y_rho \( y \) \) \)_(j i) . $
  The terminal expectation is $bb(E)_(xi_(*)) \[ M_(* \, i) phi.alt \]$. At zero, $M_0 = u$ and $\( T_0 \)_(\#) xi_0 = xi_(*)$, so the initial expectation is $u_i bb(E)_(xi_(*)) phi.alt$. Integrating the displayed derivative in $rho$ proves
  $ bb(E)_(xi_(*)) \[ \( M_(* \, i) - u_i \) phi.alt \] = bb(E)_(xi_(*)) sum_j K_(i j) partial_j phi.alt . $
  This proves the adjoint-divergence identity weakly, and smoothness makes it a pointwise identity.
  For the bounds, $parallel B_rho parallel_(upright("op")) lt.eq C$ and $parallel U_1 parallel_(upright("op")) lt.eq C L$ immediately give $parallel K parallel_(upright("op")) lt.eq C L$. For a positive-order spatial derivative, use Lemma 14 on both $D T_rho$ and $Y_rho$. An order-$j$ derivative of $D T_rho$ has all split norms at most $C_j l R^(- j)$, and an order-$j$ derivative of $U_1$ has all split norms at most $C_j L R^(- j)$ by (3.4). When these fields are composed with $Y_rho$, attach each chain-rule tensor by a single edge as in the preceding lemma. First derivatives of $Y_rho$ are bounded, and a derivative of order $i > 1$ costs $C_i l R^(- \( i - 1 \))$. Every order-$j$ term in the product has total cost at most $C_j L R^(- j)$, since $l lt.eq 1$. Each factor retains free slots, so the single-contraction bound preserves every nontrivial split. Integrating over an interval of length at most one proves the assertion. All orders are smooth by Gaussian conditional integration and the smooth transport on $rho lt.eq b_(*) < 1$; this uses no higher derivatives of the original unsmoothed gradient. ◻
]

=== 5.3 Stationarity and the path integral <stationarity-and-the-path-integral>

The following dynamics specialize the skew-matrix construction of Ma, Chen and Fox #cite(label("ma2015recipe")) Section 2.1, Equation (3), Theorem 1. The transport-derived $K$ makes the momentum displacement encode $M_(*) - u$. We prove completeness and invariance directly, since a formal stationary-density calculation alone would not ensure a solution exists for the full integration interval.

#thm([Proposition 5.3.])[
  (A noisy mean from a path integral).  #emph[For $s > 0$, let $\( Y_0 \, G_0 \)$ have law $xi_(*) ⊗ N \( 0 \, I_d \)$ and solve 
#[#set math.equation(numbering: n => "(5.3)")
 $ dot(Y)_t = - K \( Y_t \)^T G_t \/ s \, #h(2em) dot(G)_t = \( M_(*) \( Y_t \) - u \) \/ s . $ <eq:centering-flow>]

 The solution exists for every finite time, and its law remains $xi_(*) ⊗ N \( 0 \, I_d \)$. In particular, 
#[#set math.equation(numbering: n => "(5.4)")
 $ s G_0 + integral_0^1 M_(*) \( Y_t \) thin d t med =^(upright("law")) u + s G \, #h(2em) G tilde.op N \( 0 \, I_d \) . $ <eq:centering-output>]

]
] <prop:centering-law>

#proof[
  The vector field $v$ in (5.3) is smooth and hence locally Lipschitz. The bound on $K$ and the global Lipschitz bound on $M_(*)$ imply $\| v \( y \, g \) \| lt.eq C_(x \, r \, s) \( 1 + \| y \| + \| g \| \)$. Gronwall’s inequality therefore prevents a solution from escaping to infinity in finite positive or negative time. Local uniqueness gives a complete smooth flow $Phi_t$, with inverse $Phi_(- t)$. We only need local Lipschitz continuity here; the factor $G$ does not in general give a globally Lipschitz joint vector field.
  Write the product density as
  $ p \( y \, g \) = \( 2 pi \)^(- d \/ 2) exp \( - H_(*) \( y \) - \| g \|^2 \/ 2 \) . $
  Differentiating in the position and momentum variables separately, with the row convention of the kernel lemma, gives
  $ "div"_y \( p v_Y \) = p / s sum_i g_i \( nabla_(xi_(*))^(*) K \)_i = p / s thin g dot.op \( M_(*) - u \) \, #h(2em) "div"_g \( p v_G \) = - p / s thin g dot.op \( M_(*) - u \) . $
  Thus $"div" \( p v \) = 0$. The Jacobian formula for the complete flow now yields, pointwise,
  $ frac(d, d t) { p \( Phi_t \( z \) \) det D Phi_t \( z \) } = "div" \( p v \) \( Phi_t \( z \) \) det D Phi_t \( z \) = 0 . $
  The determinant starts at one and stays positive. Change of variables therefore proves that $Phi_t$ preserves the probability density $p$.
  For later differentiation it is useful to record the same cancellation as an operator identity. Relative to the product law, the Lie derivative is
  #[#set math.equation(numbering: n => "(5.5)")
   $ cal(L) = nabla^(*) A nabla \, #h(2em) A = mat(delim: "(", 0, K^T \/ s; - K \/ s, 0) . $ <eq:centering-skew-operator>]
  Indeed the second-order part vanishes by skew symmetry. The first-order coefficients are $- K^T g \/ s$ in position and $nabla_(xi_(*))^(*) K \/ s = \( M_(*) - u \) \/ s$ in momentum, exactly as in (5.3).
  Finally, integrating the momentum equation over $\[ 0 \, 1 \]$ gives the pathwise identity
  $ s G_0 + integral_0^1 M_(*) \( Y_t \) thin d t = u + s G_1 . $
  Stationarity makes $G_1$ a standard Gaussian, proving (5.4). ◻
]

Stationarity also makes $G_1$ independent of $Y_1$. It does not assert that $G_1$ is independent of the initial anchors $\( Y_0 \, G_0 \)$. The exact mean $u = M_0$ remains in the momentum velocity, and the proposition assumes an ideal sample from $xi_(*)$. Thus the proposition is a comparison construction, not yet an oracle routine. Section 6 will express its approximation by finitely many exact mean evaluations; Section 7 will replace every such evaluation, including $M_0$. The displayed output itself needs no separate addition of $u$.

=== 5.4 Derivatives on a stationary trajectory <derivatives-on-a-stationary-trajectory>

To approximate the path integral by high-order quadrature, we need bounds on time derivatives at each fixed time. Stationarity allows these bounds to be proved in the fixed product measure. The following lemma separates that argument from the particular kernel and avoids requiring a bound on the supremum of a random path.

#thm([Lemma 5.4.])[
  (Stationary time derivatives).  #emph[Fix $0 < R lt.eq 1$. Let a smooth probability density on $bb(R)^n$, with $n lt.eq C d$, have Gaussian tails and negative logarithm $H$. Assume its Hessian is bounded and that every positive-order score derivative $nabla^j nabla H$ has every one-slot split norm at most $C_j R^(- \( j - 1 \))$, for $j gt.eq 1$. Here a one-slot split isolates one tensor slot as the matrix input and groups all remaining slots as its output. Suppose a stationary autonomous flow has Lie derivative $cal(L) = nabla^(*) A nabla$, where the adjoint is for this density, $A$ is skew symmetric, and 
$ \| nabla^j A \|_(upright("one-slot split")) lt.eq C_j alpha R^(- j) quad \( j gt.eq 0 \) $

 for every one-slot split. Let $phi.alt_0$ be smooth and scalar- or vector-valued, with 
$ \| nabla^j phi.alt_0 \|_F lt.eq C_j a_0 sqrt(d) thin R^(- j) quad \( j gt.eq 1 \) . $

 Assume the fields and all derivatives used have polynomial growth. Then, for each fixed $k gt.eq 1$, the order-$k$ time derivative of $phi.alt_0$ on the stationary flow has RMS norm at most 
#[#set math.equation(numbering: n => "(5.6)")
 $ C_k a_0 sqrt(d) thin \( alpha R^(- 2) \)^k . $ <eq:stationary-derivatives>]

]
] <lem:stationary-derivatives>

#proof[
  Put $phi.alt_k = cal(L)^k phi.alt_0$. We prove, for $j gt.eq 0$ and $k gt.eq 1$, the stronger estimate
  #[#set math.equation(numbering: n => "(5.7)")
   $ parallel nabla^j phi.alt_k parallel_(F \, 2) lt.eq C_(j \, k) a_0 sqrt(d) thin alpha^k R^(- \( j + 2 k \)) . $ <eq:stationary-spatial-induction>]
  For $k = 0$ the same bound is assumed only for $j gt.eq 1$, which suffices: the iteration differentiates $phi.alt_(k - 1)$ before multiplying by $A$. All $L^2$ norms below are for the invariant density.
  Set $V = A nabla phi.alt_(k - 1)$. Leibniz’s rule and the induction hypothesis give, for each $h gt.eq 0$,
  $ parallel nabla^h V parallel_(F \, 2) lt.eq C_(h \, k) a_0 sqrt(d) thin alpha^k R^(- \( h + 1 + 2 \( k - 1 \) \)) . $
  To see why no dimension factor appears, in each coefficient tensor $nabla^v A$ isolate the slot contracted against the gradient of $phi.alt_(k - 1)$. Its one-slot operator norm multiplies the Frobenius norm of the other factor. Summing the finitely many Leibniz terms preserves the displayed estimate.
  Now commute $j$ derivatives past the adjoint divergence in $phi.alt_k = nabla^(*) V$. The main term is $nabla^(*) \( nabla^j V \)$. The Frobenius estimate (4.6) bounds its $L^2$ norm by a constant times $parallel nabla^j V parallel_(F \, 2) + parallel nabla^(j + 1) V parallel_(F \, 2)$. These two terms have powers $R^(- \( j + 2 k - 1 \))$ and $R^(- \( j + 2 k \))$, respectively. Each remaining commutator contracts an order-$v$ derivative of the score, $1 lt.eq v lt.eq j$, with $nabla^(j - v) V$. The coefficient’s one-slot norm again suffices; the total exponent of $R^(- 1)$ is
  $ \( v - 1 \) + \( j - v + 1 + 2 \( k - 1 \) \) = j + 2 k - 2 . $
  All these terms are bounded by (5.7) because $0 < R lt.eq 1$. This closes the induction, including $j = 0$ for $k gt.eq 1$. Gaussian tails and polynomial growth justify the integrations by parts through cutoffs.
  Along an autonomous trajectory, the $k$th time derivative of $phi.alt_0$ is $phi.alt_k$ evaluated at the current state. Stationarity identifies its RMS norm at every time with the fixed-measure norm in (5.7) for $j = 0$. ◻
]

For (5.3), the ambient dimension is $2 d$, and (5.5) satisfies the lemma’s coefficient bounds with $alpha = L \/ s$. The product potential is $H_(*) \( y \) + \| g \|^2 \/ 2$; its score-derivative bounds follow from (3.4) and the Gaussian factor. For the joint state take $a_0 = 1$: its first derivative has Frobenius norm $sqrt(2 d)$ and all higher derivatives vanish. For $M_(*)$ take $a_0 = L$. Indeed, isolating any derivative slot in (3.4) gives a matrix with input dimension $d$, so passage from its operator norm to its Frobenius norm costs at most $sqrt(d)$. Consequently, at every stationary time,

$ ∥frac(d^k, d t^k) \( Y_t \, G_t \)∥_2 lt.eq C_k sqrt(d) thin \( \( L \/ s \) R^(- 2) \)^k \, #h(2em) ∥frac(d^k, d t^k) M_(*) \( Y_t \)∥_2 lt.eq C_k L sqrt(d) thin \( \( L \/ s \) R^(- 2) \)^k . $

The strict radius choice $0 < R < 1 \/ 2$ made for this construction satisfies the abstract lemma’s $0 < R lt.eq 1$ hypothesis.

We also need an initial displacement estimate for the later iteration. Conditional expectation and the primitive Poincaré inequality give

$ bb(E)_(xi_(*)) \| M_(*) - u \|^2 lt.eq bb(E)_nu \| f - u \|^2 lt.eq C L^2 d . $

At every stationary time, $G_t$ is independent of $Y_t$, hence

$ bb(E) \| K \( Y_t \)^T G_t \|^2 = bb(E) parallel K \( Y_t \) parallel_F^2 lt.eq C L^2 d . $

Integrate the velocity and apply Minkowski’s inequality to obtain

#[#set math.equation(numbering: n => "(5.8)")
 $ parallel \( Y_t \, G_t \) - \( Y_0 \, G_0 \) parallel_2 lt.eq C t \( L \/ s \) sqrt(d) lt.eq C \( L \/ s \) sqrt(d) #h(2em) \( 0 lt.eq t lt.eq 1 \) . $ <eq:centering-initial-displacement>]

These are fixed-time RMS estimates for the exact stationary flow. They give the derivative and starting-error bounds used in the next section to approximate its path integral by finite formulas.

== 6 Finite formulas for the two flows <sec:numerics>

We now turn the probability transport and the stationary centering flow into finite formulas in conditional means. The formulas must meet two requirements at once. Their error on the prescribed input law must be small, and each new mean must be evaluated at a center that is an affine expression in earlier mean values, with scalar coefficients and controlled size. The latter property permits the recursive implementation in the next section.

The main conclusion is Theorem 24. Its proof has three numerical steps. Global Picard iteration discretizes probability transport without making the dependency depth proportional to the number of time cells. Short harmonic trajectories then give a formula for the vector $K \( y \)^T G$ in the centering velocity. Finally, Picard iteration discretizes that stationary flow. Two cancellations are needed in the middle step: a zero derivative removes the singularity at the lower endpoint of the kernel integral, and retaining only a forward transport #emph[correction] cancels its apparent inverse power of the primitive scale $r$.

Polynomial collocation of Picard iteration was developed for sampling by #cite(label("lee2018odes"), form: "prose") Algorithm 2 and Theorem 2.3; Gaussian smoothing and high-order Picard approximation also appear in #cite(label("chen2026picard"), form: "prose") Appendix E, Algorithm E.1 and Theorem E.2. Here we need, in addition, scalar affine formulas whose dependency depth can be fixed before their interpolation order. An exact conditional mean is an analytical node throughout this section. The next section replaces these nodes by finite oracle computations.

Fix an integer $K_0 gt.eq 2$ and $t > 0$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ 40 \( K_0 + 2 \) t < 1 / 4 \, #h(2em) R = delta^t \, #h(2em) psi = delta^(4 t) \, #h(2em) h_0 = delta^w \, #h(2em) 0 < w < t . $ <eq:numerical-parameters>]

The iteration count will first fix a depth bound. We then choose $w$ and finally the interpolation orders; increasing those orders will not change the depth bound. For the centering flow set $s = sigma \/ 2$, where $sigma > 0$ is the parent mean-noise parameter. Thus the centering formula itself will approximate noise of standard deviation $sigma \/ 2$. Throughout its numerical analysis assume

#[#set math.equation(numbering: n => "(6.2)")
 $ max { l \, L \/ sigma } lt.eq "polylog" \( d \) delta^b \, #h(2em) b gt.eq 1 / 2 . $ <eq:numerical-size>]

For probability transport alone only the corresponding bound on $l$ is required. All probability-time intervals lie in $\[ 0 \, \( 1 - c R^2 \)^(1 \/ 2) \]$, for a fixed $c > 0$. Constants may depend on fixed interpolation orders and fixed parameters, but not on the center, dimension, primitive scale $r$, noise parameter, or oracle. A symbol $B_d$ below denotes a bound $C \( 1 + log d \)^C$ with precisely this uniformity; the fixed exponent and constant in a size hypothesis are part of the fixed parameters. All assertions are for sufficiently large $d$.

=== 6.1 Probability transport by global Picard iteration <probability-transport-by-global-picard-iteration>

Partition a probability-time interval using equal steps of size at most $h_0$ in $- log \( 1 - rho \)$. For a nonzero interval take the ceiling of its transformed length divided by $h_0$ as the number of cells. Cell lengths $ell_c$ then obey $ell_c lt.eq C h_0 \( 1 - rho \)$ on that cell, and the number of cells is

$ O #scale(x: 120%, y: 120%)[\(] 1 + h_0^(- 1) \( 1 + \| log R \| \) #scale(x: 120%, y: 120%)[\)] . $

A zero-length interval requires no operations. On each cell interpolate at $m gt.eq 2$ distinct equally spaced nodes, including both ends, and integrate the resulting degree-$\( m - 1 \)$ polynomial. Include partial integrals to every state node. By scaling the fixed Lagrange basis on $\[ 0 \, 1 \]$, its absolute value sum is at most $C_m$, and its order-$k$ derivative absolute sum is at most $C_m ell_c^(- k)$. Consequently every partial-integral row has absolute weight sum at most $C_m$, uniformly in the number of cells.

Let $w_(i j)$ be these partial-integral weights from the starting time $rho_(upright("in"))$ to node $rho_i$, with signed weights for backward integration. Duplicate shared endpoints as labeled nodes if convenient. Given a starting position $y_(upright("in"))$, use simultaneous updates

#[#set math.equation(numbering: n => "(6.3)")
 $ y_i^(\[ 0 \]) = y_(upright("in")) \, #h(2em) y_i^(\[ k + 1 \]) = y_(upright("in")) - r sum_j w_(i j) M_(rho_j) \( y_j^(\[ k \]) \) . $ <eq:probability-update>]

This iteration integrates over the whole interval at every layer; it does not advance successively from cell to cell.

#thm([Proposition 6.1.])[
  (Probability-flow circuit).  #emph[If the input position has marginal law $xi_(rho_(upright("in")))$, then after $N_p$ iterations the maximum, over all state nodes, of the RMS error relative to the exact transport is at most 
#[#set math.equation(numbering: n => "(6.4)")
 $ C_m "polylog" \( d \) thin l sqrt(d) thin h_0^m + \( C_m l \)^(N_p) C r D . $ <eq:probability-picard>]

 Every computed state is globally Lipschitz in its initial position with constant $C_m$. After subtracting the initial position, its Lipschitz constant is at most $C_m l$.]
] <prop:probability-circuit>

#proof[
  Write $Y_rho$ for the exact path from the given random input and $Q_rho = M_rho \( Y_rho \)$. The marginal identity in Proposition 7 and (4.7) give
  $ parallel Q_rho^(\( m \)) parallel_2 lt.eq B_d L sqrt(d) \( 1 - rho^2 \)^(- m) . $
  On a cell $I = \[ a_c \, b_c \]$ of length $ell_c$, let $P$ be the Taylor polynomial of $Q$ of degree $m - 1$ at $a_c$. Minkowski’s inequality applied to the integral remainder gives, at each $v in I$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ parallel Q_v - P \( v \) parallel_2 lt.eq frac(1, \( m - 1 \) !) integral_(a_c)^v \( v - z \)^(m - 1) parallel Q_z^(\( m \)) parallel_2 thin d z lt.eq C_m B_d L sqrt(d) thin h_0^m . $ <eq:numerical-taylor-remainder>]
  The last step uses $ell_c lt.eq C h_0 \( 1 - z \)$ on that cell and $1 - z^2 gt.eq 1 - z$. The same estimate holds at the interpolation nodes. Because interpolation reproduces $P$ and its basis has bounded absolute sum, $parallel Q_v - cal(I)_c Q \( v \) parallel_2$ obeys the same bound. Integrate this pointwise estimate over the cells, whose total length is at most one. This proves the required quadrature error, for partial integrals and for either orientation. No supremum of the random path has been taken.
  Let $e_k = max_i parallel y_i^(\[ k \]) - Y_(rho_i) parallel_2$. The global bound $"Lip" \( M_rho \) lt.eq C L$, together with the absolute row sums, gives
  $ e_(k + 1) lt.eq C_m l e_k + C_m B_d l sqrt(d) thin h_0^m . $
  On each exact transported marginal, conditional expectation and the primitive moment bound give $parallel M_rho parallel_2 lt.eq C D$. Integrating the velocity shows $e_0 lt.eq C r D$. Since $C_m l < 1 \/ 2$ for large $d$, summing the geometric recurrence proves (6.4). The norm here is the maximum of the nodewise RMS errors; it is not the RMS of their maximum.
  For deterministic inputs the same recurrence, now in maximum node norm, gives a bounded Lipschitz constant for every iterate. In the correction $y_i^(\[ k + 1 \]) - y_(upright("in"))$, the factor $r$ and the $C L$-Lipschitz mean give the stronger constant $C_m l$. ◻
]

=== 6.2 The kernel action through harmonic trajectories <the-kernel-action-through-harmonic-trajectories>

The position velocity in (5.3) contains $K \( y \)^T G$. Approximating $K$ and then multiplying the error by an arbitrary momentum would not give the global Lipschitz property needed for Picard iteration. Instead we approximate the vector action directly, using short harmonic trajectories and forward transport corrections.

For the kernel integral use the mesh on $\[ 0 \, b_(*) \]$ above. Its cell lengths also satisfy $ell_c gt.eq c' h_0 \( 1 - rho \)$ for all sufficiently large $d$; this follows from the ceiling construction because the transformed interval length tends to infinity. Set $C_rho \( y \) = B_rho \( y \) - I$. We first describe a circuit for $C_rho \( y \) G$ at one probability node $rho$.

===== 6.2.1 Backward position. <backward-position.>

Apply Proposition 18 backward from input position $y$ at time $b_(*)$ to obtain an approximation $hat(Y)_rho$ to $Y_rho \( y \)$.

===== 6.2.2 Short harmonic trajectories. <short-harmonic-trajectories.>

At fixed probability time $rho$, the Hamiltonian equations with potential $H_rho$ have position integral equation

#[#set math.equation(numbering: n => "(6.6)")
 $ W_z = cos \( z \) Y_rho + sin \( z \) G - r rho integral_0^z sin \( z - v \) M_rho \( W_v \) thin d v . $ <eq:harmonic-integral>]

For every requested angle $z$, interpolate on the single cell $\[ 0 \, z \]$. Let $z_i$ be its nodes and $ell_j \( v \)$ its Lagrange basis, and set

$ w_(i j)^sin = integral_0^(z_i) sin \( z_i - v \) ell_j \( v \) thin d v . $

Use the simultaneous Picard updates

#[#set math.equation(numbering: n => "(6.7)")
 $ W_i^(\[ 0 \]) & = cos \( z_i \) hat(Y)_rho + sin \( z_i \) G \,\
W_i^(\[ k + 1 \]) & = cos \( z_i \) hat(Y)_rho + sin \( z_i \) G - r rho sum_j w_(i j)^sin M_rho \( W_j^(\[ k \]) \) . $ <eq:harmonic-picard>]

At angle zero there is no integral. The free sine and cosine terms are retained exactly.

===== 6.2.3 Differentiate the transport correction. <differentiate-the-transport-correction.>

Let $d_j$ be the weights differentiating at zero the polynomial interpolant on angle nodes $0 \, psi \, dots.h \, \( m - 1 \) psi$. Their absolute sum is $C_m psi^(- 1)$. At every such angle node, compute $T_rho \( W_z \) - W_z$ by the forward probability-flow circuit, keeping only its integral correction at the output. For exact paths,

#[#set math.equation(numbering: n => "(6.8)")
 $ frac(d, d z) \( T_rho - upright("id") \) \( W_z \)\|_(z = 0) = \( B_rho - I \) G = C_rho G \, $ <eq:kernel-action-derivative>]

since $W_0 = Y_rho$ and $W'_0 = G$. The weighted sum with coefficients $d_j$ therefore approximates $C_rho G$ using exact mean nodes only.

Here and below the interpolation orders denoted by $m$ may be increased independently. Using a common sufficiently large order merely simplifies the error displays. For the next estimates use the same number $N_p gt.eq 1$ of Picard layers in the backward, harmonic, and forward computations.

#thm([Lemma 6.2.])[
  (Errors in the angle computation).  #emph[Let $y tilde.op xi_(*)$ and $G tilde.op N \( 0 \, I_d \)$ independently. The exact-input angle differentiation in (6.8) has RMS truncation error at most 
#[#set math.equation(numbering: n => "(6.9)")
 $ C_m l sqrt(d) thin psi^(m - 1) R^(- 2 m) = C_m l sqrt(d) thin delta^(2 t m - 4 t) . $ <eq:angle-stencil-error>]

 Before applying the angle differentiation weights, the RMS errors of the computed forward correction values are at most 
#[#set math.equation(numbering: n => "(6.10)")
 $ C_m "polylog" \( d \) thin l sqrt(d) thin \( h_0^m + delta^(2 t m) \) + \( C_m l \)^(N_p) C r D . $ <eq:kernel-value-error>]

 Every such approximate correction is globally Lipschitz in $\( y \, G \)$ with constant at most $C_m l$.]
] <lem:kernel-angle-errors>

#proof[
  For exact inputs $\( Y_rho \( y \) \, G \)$, harmonic motion $dot(W) = P$, $dot(P) = - nabla H_rho \( W \)$ preserves $xi_rho ⊗ N \( 0 \, I_d \)$. The vector field is globally Lipschitz, and its weighted divergence vanishes. Its Lie derivative is $nabla^(*) A nabla$ with constant skew coefficient whose $\( W \, P \)$ block is $- I$. Lemma 17 therefore applies with $alpha = 1$, with $a_0 = l$ for $T_rho - upright("id")$, and with $a_0 = L$ for $M_rho$. Indeed Lemma 14 and (3.4) give the required spatial bounds; changing a one-slot split bound to a Frobenius bound costs only $sqrt(d)$. To apply the angle stencil, subtract the Taylor polynomial of $z mapsto \( T_rho - upright("id") \) \( W_z \)$ of degree $m - 1$ at zero. Its derivative at zero is exact, and its remainder at each stencil node has RMS norm at most $C_m l sqrt(d) thin psi^m R^(- 2 m)$. Multiplication by the absolute stencil sum $C_m \/ psi$ proves (6.9). This uses pointwise RMS remainders on the stationary harmonic path.
  For the harmonic state equation, interpolate $M_rho \( W_v \)$ in (6.6). Since $z lt.eq \( m - 1 \) psi$, its Taylor remainder, multiplied by the prefactor $r$, is bounded by $C_m l sqrt(d) thin psi^m R^(- 2 m) = C_m l sqrt(d) thin delta^(2 t m)$; the additional integration factors are bounded and can be discarded. The initial free-path error is at most $C r D$, and Picard contracts by $C_m l$. The computed harmonic state is globally Lipschitz with bounded constant in its two inputs, by the same row-sum argument as before.
  Next compare the forward probability correction started at the exact harmonic state. That state has marginal law $xi_rho$, so Proposition 18 applies. Errors in its starting state then propagate through the approximate correction with factor $C_m l$, not a factor of order one. This also controls the backward-position error transmitted through the harmonic computation. Combining these estimates proves (6.10) and the asserted global Lipschitz bound. ◻
]

=== 6.3 The zero endpoint of the kernel integral <the-zero-endpoint-of-the-kernel-integral>

It remains to integrate the derivative of $C_rho G$ against $1 \/ rho$. The exact identity $B'_0 = 0$ removes the apparent singularity, and we impose that identity on the interpolant as well.

On all but the first probability cell use ordinary degree-$\( m - 1 \)$ interpolation. On the first cell use $m - 1$ equally spaced value nodes including both endpoints and the additional Hermite condition that the derivative at zero is zero, for a total of $m$ conditions, with $m gt.eq 3$. This uniquely determines a polynomial of degree at most $m - 1$: a polynomial in the null space would have a double zero at zero and the remaining $m - 2$ distinct zeros. Let $q_i$ be the resulting weights on values when the derivative of this piecewise interpolant is integrated against $1 \/ rho$.

#thm([Lemma 6.3.])[
  (Derivative quadrature at zero).  #emph[Let $y tilde.op xi_(*)$ and $G tilde.op N \( 0 \, I_d \)$ independently. For exact values of $C_rho \( y \) G$, the RMS error of this quadrature for $integral_0^(b_(*)) B'_rho \( y \) G thin d rho \/ rho$ is at most 
$ C_m "polylog" \( d \) thin l sqrt(d) thin h_0^(m - 2) . $

 The value weights satisfy 
#[#set math.equation(numbering: n => "(6.11)")
 $ sum_i \| q_i \| lt.eq C_m h_0^(- 1) \( 1 + \| log R \| + \| log h_0 \| \) . $ <eq:kernel-weight-sum>]

 These weights are well defined even if the supplied values are approximate: the derivative condition at zero remains exact.]
] <lem:kernel-endpoint-quadrature>

#proof[
  By Lemma 14 and independence of $G$, the RMS norm of the order-$m$ derivative of $C_rho \( y \) G$ is at most $"polylog" \( d \) l sqrt(d) \( 1 - rho^2 \)^(- m)$. Here multiplication by the independent Gaussian converts the matrix norm to a Frobenius norm and costs at most $sqrt(d)$.
  On an ordinary cell, Taylor expansion and scaling the interpolation basis bound the derivative error by this derivative bound times $C_m ell_c^(m - 1)$. It is therefore at most $C_m "polylog" \( d \) l sqrt(d) h_0^(m - 1) \/ \( 1 - rho \)$. After integration against $1 \/ rho$, all ordinary cells contribute at most this prefactor times $C \( 1 + \| log R \| + \| log h_0 \| \)$, which fits the claimed more conservative $h_0^(m - 2)$ bound.
  For the first cell, subtract the Taylor polynomial at zero of degree $m - 1$. Its derivative at zero agrees with the exact zero derivative. The second derivative of the remainder, and that of the Hermite interpolant of the remainder, are bounded in RMS by $C_m "polylog" \( d \) l sqrt(d) thin ell_c^(m - 2)$. Both first derivatives vanish at zero. If $E$ is the difference between the exact function and its Hermite interpolant on this cell, then
  $ parallel E' \( rho \) parallel_2 lt.eq integral_0^rho parallel E'' \( v \) parallel_2 thin d v lt.eq C_m B_d l sqrt(d) thin rho ell_c^(m - 2) . $
  Consequently the integral of $E' \( rho \) \/ rho$ over the first cell has RMS norm at most $C_m B_d l sqrt(d) thin ell_c^(m - 1)$. This is within the stated, more conservative $h_0^(m - 2)$ bound.
  On an ordinary cell the absolute coefficient sum of the interpolant derivative is at most $C_m \/ ell_c$. Integrating and using $ell_c gt.eq c' h_0 \( 1 - rho \)$ gives a total bounded by
  $ C_m h_0^(- 1) integral_(rho_(upright("first")))^(b_(*)) frac(d rho, rho \( 1 - rho \)) . $
  This gives the logarithms in (6.11). On the first cell, scale to the unit interval. The polynomial derivative vanishes at zero and is bounded by distance to zero times the second derivative, so the integral of its absolute value divided by that distance is bounded. Scaling back gives a weight sum $C_m \/ ell_c lt.eq C_m h_0^(- 1)$. This proves the claim. ◻
]

=== 6.4 A globally Lipschitz approximate centering velocity <a-globally-lipschitz-approximate-centering-velocity>

Let $upright("corr")_(i j) \( y \, G \)$ denote the forward correction computed at probability node $i$ and angle node $j$ by the three operations above. The approximate position velocity is the explicit expression

#[#set math.equation(numbering: n => "(6.12)")
 $ hat(v)_Y \( y \, G \) = - frac(1, r s) sum_i q_i sum_j d_j upright("corr")_(i j) \( y \, G \) . $ <eq:kernel-approximate-velocity>]

Each correction retains only the integral part of the forward Picard formula. Writing its weights as $w_(i j k)$ and its mean values as $M_(i j k)$ gives

$ upright("corr")_(i j) = - r sum_k w_(i j k) M_(i j k) \, $

and hence

#[#set math.equation(numbering: n => "(6.13)")
 $ hat(v)_Y = 1 / s sum_(i \, j \, k) q_i d_j w_(i j k) M_(i j k) . $ <eq:kernel-scalar-expansion>]

The apparent factor $1 \/ r$ has canceled algebraically. There is no additive forward state left in this formula, and all coefficients multiplying mean values are deterministic scalars. Use the exact mean expression $hat(v)_G \( y \, G \) = \( M_(*) \( y \) - M_0 \) \/ s$ for the momentum velocity. In particular, the momentum occurs inside angle states; it is never multiplied by a separately approximated matrix at the output.

#thm([Proposition 6.4.])[
  (Kernel-action circuit).  #emph[On the stationary product input law, the RMS error of $hat(v) = \( hat(v)_Y \, hat(v)_G \)$ relative to (5.3) is bounded by $"polylog" \( d \)$ times 
#[#set math.equation(numbering: n => "(6.14)")
 $ & L / sigma sqrt(d) [h_0^(m - 2) + h_0^(- 1) delta^(- 4 t) \( h_0^m + delta^(2 t m) \)]\
 & #h(12mm)  + delta^(- 4 t - w) \( C_m l \)^(N_p - 1) r L / sigma D . $ <eq:kernel-velocity-error>]

 It is globally Lipschitz, with constant at most 
#[#set math.equation(numbering: n => "(6.15)")
 $ C_m "polylog" \( d \) thin \( L \/ sigma \) psi^(- 1) h_0^(- 1) . $ <eq:velocity-lipschitz>]

 For every fixed $J gt.eq 1$, its RMS error can be made at most $"polylog" \( d \) delta^J D$ with $N_p = O \( J + 1 \)$, independently of $w$ and the interpolation orders.]
] <prop:kernel-circuit>

#proof[
  Combine Lemmas 19 and 20, and divide by $r s$. The value errors are amplified only by $C_m psi^(- 1)$ and the weight sum (6.11). The exact stencil truncation has factor $psi^(m - 1) R^(- 2 m) = delta^(2 t m - 4 t)$ and the same probability-quadrature weight sum. Crucially,
  $ frac(l, r sigma) = L / sigma \, #h(2em) frac(l^(N_p) r D, r sigma) = l^(N_p - 1) r L / sigma D . $
  Thus neither division introduces a negative power of the potentially small scale $r$. The resulting estimate is (6.14).
  Each forward correction has Lipschitz constant $C_m l$ in its inputs, and the backward and harmonic maps have bounded constants. Applying the same absolute weight sums and using $l \/ \( r sigma \) = L \/ sigma$ gives (6.15); the momentum component has the smaller Lipschitz bound $C L \/ sigma$.
  For the last assertion, increase interpolation orders until the first line of (6.14) is of the desired order. Under (6.2), sufficiently many $O \( J + 1 \)$ Picard layers make the second line of that order as well. The explicit common choice given below verifies independence from interpolation orders and from $w$. ◻
]

=== 6.5 The mean formula and the order of parameter choices <the-mean-formula-and-the-order-of-parameter-choices>

We can now discretize the centering flow itself. Interpolate on the single time cell $\[ 0 \, 1 \]$, using ordinary degree-$\( m - 1 \)$ interpolation and partial-integral rows $w_(i j)$. With anchor $Z_0 = \( Y_0 \, G_0 \)$, set

$ Z_i^(\[ 0 \]) = Z_0 \, #h(2em) Z_i^(\[ k + 1 \]) = Z_0 + sum_j w_(i j) hat(v) \( Z_j^(\[ k \]) \) . $

At the end keep the position components $y_j$ and output

#[#set math.equation(numbering: n => "(6.16)")
 $ s G_0 + sum_j omega_j M_(*) \( y_j \) \, #h(2em) sum_j \| omega_j \| lt.eq C_m \, $ <eq:mean-output>]

where $omega_j$ are the full-interval integration weights.

#thm([Proposition 6.5.])[
  (Mean-flow circuit).  #emph[For ideal independent anchors $Y_0 tilde.op xi_(*)$ and $G_0 tilde.op N \( 0 \, I_d \)$, and every fixed $J gt.eq 1$, the circuit (6.16) can be chosen to differ in RMS by at most $"polylog" \( d \) sigma delta^J D$ from the exact path integral (5.4). The approximate joint states have RMS errors at most $"polylog" \( d \) delta^J D$. Every integration uses $O \( J + 1 \)$ Picard layers, with a bound independent of $w$ and all interpolation orders.]
] <prop:mean-circuit>

#proof[
  First compare the exact flow to polynomial integration of its exact velocity. Lemma 17, applied to the state with one additional derivative, bounds this quadrature error by
  $ C_m sqrt(d) thin #scale(x: 120%, y: 120%)[\(] \( L \/ s \) R^(- 2) #scale(x: 120%, y: 120%)[\)]^(m + 1) . $
  The approximation error of $hat(v)$ at every exact trajectory node is bounded by Proposition 21, by stationarity. Previous state errors propagate with its global Lipschitz constant and the absolute row sums. The true centering velocity need not be globally Lipschitz in the joint variables; it is the approximate velocity’s bound that is used in this recurrence.
  By (6.1), $b gt.eq 1 \/ 2$ and $w < t$ give $b - 4 t - w > 1 \/ 3$. For sufficiently large $d$, fixed constants and polylogarithms in (6.15) can therefore be absorbed so that the recurrence contracts by at most $delta^(1 \/ 3)$. Its initial error is at most $C \( L \/ s \) sqrt(d)$ by (5.8). Choose the quadrature and velocity error orders sufficiently high, and then $O \( J + 1 \)$ Picard layers yield the state error claimed in the statement.
  For the output, apply Lemma 17 to $M_(*)$ with $a_0 = L$. Its path quadrature error is at most $C_m L sqrt(d) thin \( \( L \/ s \) R^(- 2) \)^m$, which can be made at most $"polylog" \( d \) sigma delta^J D$. The additional error from evaluating on the approximate positions is bounded by their RMS error times $C_m L$, using the $C L$-Lipschitz bound for $M_(*)$. Since $L \/ sigma$ is small, this is within the same budget. ◻
]

We first collect the accuracy and depth estimates. We will then expand the actual formulas to obtain the coefficient and scale bounds required by the recursive implementation.

#thm([Corollary 6.6.])[
  (Accuracy without increasing dependency depth).  #emph[Fix $J gt.eq 1$. In all the probability, harmonic, and centering integrations above, one may take at most 
$ N = ceil.l 10 \( J + 2 \) ceil.r $

 Picard layers. After any fixed $w in \( 0 \, t \)$ is chosen, a common fixed interpolation order satisfying 
#[#set math.equation(numbering: n => "(6.17)")
 $ w \( m - 3 \) > J + 10 \, #h(2em) t \( m - 3 \) > J + 10 \, #h(2em) m > 4 \( J + 10 \) $ <eq:interpolation-order-choice>]

 suffices for the following conclusions, for all sufficiently large $d$. Probability transport from its exact starting marginal has endpoint RMS error at most $"polylog" \( d \) delta^J D$; the same holds after division by an endpoint parameter bounded away from zero. The mean circuit with ideal anchors has RMS error at most $"polylog" \( d \) sigma delta^J D$ relative to (5.4).]
  #emph[The number of layers of exact mean dependencies within either circuit is $O \( \( N + 1 \)^2 \)$, independently of $m$, $w$, and the number of mesh cells. All mesh nodes, interpolation weights, scalar parameters, and iteration counts are deterministic functions of the prescribed parameters and dimension.]
] <prop:exact-mean-circuits>

#proof[
  For large $d$, probability and harmonic Picard contractions $C_m l lt.eq "polylog" \( d \) delta^b$ can be bounded by $delta^(1 \/ 3)$. The only additional inverse powers in kernel evaluation are $delta^(- 4 t - w)$, besides the divisions already canceled in Proposition 21. The centering iteration also contracts by $delta^(1 \/ 3)$. The probability iteration remainder is at most $C delta^(N \/ 3) D$; after the kernel weights the iteration remainder is at most $C delta^(N \/ 3 - 4 t - w) D$. Both exponents exceed $J$ with a fixed positive margin. For the truncation terms it suffices to check the exponents
  $ w m \, quad w \( m - 2 \) \, quad w \( m - 1 \) - 4 t \, quad 2 t m - 4 t - w \, quad \( m + 1 \) \/ 3 . $
  The first four come respectively from probability quadrature, the zero-endpoint rule, its amplified probability-value error, and the harmonic and angle errors. For the last one use $\( L \/ s \) R^(- 2) lt.eq delta^(1 \/ 3)$ for large $d$ in both outer quadratures, dividing the mean-output error by $sigma$ and using $L \/ sigma lt.eq delta^(1 \/ 3)$. Every displayed exponent exceeds $J$ by (6.17). The outer Picard remainder contracts by the same $delta^(1 \/ 3)$ factor. Thus fixed constants and polylogarithms, including those depending on $m$, fit within the strict exponent margins as $d arrow.r oo$.
  Within a probability or harmonic Picard layer, all nodes depend on only the preceding layer, regardless of the number of nodes. A path through one kernel evaluation passes through a backward probability computation, a harmonic computation, and a forward probability computation, each having at most $N$ layers. Such a path traverses at most $N$ layers of the outer centering iteration. This gives depth $O \( \( N + 1 \)^2 \)$; final quadratures add a bounded number of layers. All weights integrate known polynomials, or polynomials against sine or $1 \/ rho$ with the stated zero-endpoint condition. They require no oracle information and are allowable real constants in the model. ◻
]

The order of choices is essential: first fix the target error and the Picard depth, then the mesh exponent $w$, and finally the interpolation order. The count of evaluations can depend on that order; the number of nested dependencies will not.

=== 6.6 The exact circuit interface and its derivation <the-exact-circuit-interface-and-its-derivation>

To display a primitive’s parameters, for $x' in bb(R)^d$ and $0 < r' lt.eq 1$ write

$ u_(x' \, r') := integral_(bb(R)^d) g \( x' + r' z \) thin nu_(x' \, r') \( d z \) . $

Thus $u_(x \, r) = u$ for the primitive fixed above.

We specify the two formulas to be implemented. In this subsection $cal(C)_M$ and $cal(C)_S$ denote deterministic maps of their listed anchors, with exact primitive means available as analytical nodes. The parameter $sigma$ of $cal(C)_M$ is the parent noise parameter, so its construction sets $s = sigma \/ 2$ exactly once. Define

#[#set math.equation(numbering: n => "(6.18)")
 $ cal(C)_M \( x \, r \, sigma \; y \, G \) & = sigma / 2 G + sum_j omega_j M_(*) \( y_j \) \,\
cal(C)_S \( x \, r \, eta \; y \) & = rho_e^(- 1) hat(T)_(0 arrow.r rho_e) \( y \) \, & rho_e & = \( 1 + eta^2 \/ 4 \)^(- 1 \/ 2) \, quad R lt.eq eta lt.eq 1 . $ <eq:exact-mean-circuit>]

The positions $y_j$ in the first line are the last centering Picard iterates with anchors $\( y \, G \)$, using (6.12). The second line uses the probability formula (6.3). No additional Gaussian is included in either map. The next section allocates additional noise and constructs the position anchor needed for $cal(C)_M$.

A #emph[mean dependency path] follows a mean node to a mean value used in its center expression, and then repeats. Direct expression size counts occurrences in one such expression, before expanding the center expressions of its mean nodes.

#thm([Theorem 6.7.])[
  (Numerical circuit interface).  #emph[ Fix $J gt.eq 1$, the parameters (6.1), and $N = ceil.l 10 \( J + 2 \) ceil.r$. Choose the fixed interpolation order by (6.17). For all sufficiently large $d$, the maps (6.18)–(6.18) have the following properties.]
  + #emph[#emph[Deterministic scalar formulas.] Their exact mean nodes can be ordered as $M_1 \, dots.h \, M_Q$, where 
#[#set math.equation(numbering: n => "(6.19)")
 $ M_i = u_(E_i \, r_i) \, #h(2em) E_i = b_i + sum_(j < i) a_(i j) M_j \, #h(2em) E_f = b_f + sum_j a_(f j) M_j . $ <eq:exact-affine-centers>]

 All $a_(i j)$ and $a_(f j)$ are deterministic scalars. The whole node list, its scales, and these coefficients can be formed without knowing a mean value or making an oracle query.]
  + #emph[#emph[Direct terms and scales.] Each node has $r_i = r tau_i$ and 
$ tau_i = sqrt(1 - rho_i^2) gt.eq R \/ sqrt(5) \, #h(2em) b_i = x + r \( ell_i y + m_i G \) . $

 For $cal(C)_S$, the $G$ term is absent, $rho_i lt.eq rho_e$, and $\( ell_i \, m_i \) = \( rho_i \, 0 \)$. For $cal(C)_M$, $rho_i lt.eq b_(*)$ and the pair is either $\( rho_i \, 0 \)$ or $\( rho_i cos z \, rho_i sin z \)$, with $\| z \| lt.eq C_m psi$. In particular both coefficients have absolute value at most one. A node for $M_0 = u$ has center $x$ and scale $r$. Every mean occurring directly in the final expression for $cal(C)_M$ is $M_(*)$ at a computed position and has scale exactly $r R$. The final direct terms are $b_f = sigma G \/ 2$ and $b_f = y \/ rho_e$, respectively.]
  + #emph[#emph[Coefficient sums and direct expression size.] There are positive declared bounds $A \, A_f$ such that $sum_(j < i) \| a_(i j) \| lt.eq A$ and $sum_j \| a_(f j) \| lt.eq A_f$, namely 
#[#set math.equation(numbering: n => "(6.20)")
 $ A_M & = C_1 \( 1 + log d \)^(C_1) #scale(x: 120%, y: 120%)[\[] \( r \/ sigma \) delta^(- 4 t - c_1 w) + r^2 #scale(x: 120%, y: 120%)[\]] \, & A_S & = C_1 r^2 \,\
A_(f \, M) & = C_1 \, & A_(f \, S) & = C_1 r \, & c_1 & = 10 . $ <eq:coefficient-bounds>]

 Here $C_1 gt.eq 1$ depends only on the fixed parameters and orders. Every direct expression has at most $B_d delta^(- c_1 w)$ terms. Every mean dependency path has length at most $D_0 = 3 N^2 + 1$; using a larger absolute multiple of $\( N + 1 \)^2$ is harmless. This depth bound is independent of $w$, $m$, and the number of mesh cells.]
  + #emph[#emph[Errors on the ideal anchor laws.] Under (6.2), for independent $Y tilde.op xi_(*)$ and $G tilde.op N \( 0 \, I_d \)$, 
#[#set math.equation(numbering: n => "(6.21)")
 $ W_2 #scale(x: 120%, y: 120%)[\(] cal(L) \( cal(C)_M \( x \, r \, sigma \; Y \, G \) \) \, N \( u \, sigma^2 I_d \/ 4 \) #scale(x: 120%, y: 120%)[\)] lt.eq B_d sigma delta^J D \( x \) . $ <eq:ideal-mean-circuit-error>]

 For $cal(C)_S$ only $l lt.eq B_d delta^b$, $b gt.eq 1 \/ 2$, is needed. With $Y tilde.op N \( 0 \, I_d \)$, 
#[#set math.equation(numbering: n => "(6.22)")
 $ W_2 #scale(x: 120%, y: 120%)[\(] cal(L) \( cal(C)_S \( x \, r \, eta \; Y \) \) \, nu_(x \, r) * N \( 0 \, eta^2 I_d \/ 4 \) #scale(x: 120%, y: 120%)[\)] lt.eq B_d delta^J D \( x \) . $ <eq:ideal-sample-circuit-error>]

 The coefficient and dependency assertions are deterministic, for every choice of anchors. The distributional estimates require the specified ideal anchor laws.]
] <thm:numerical-interface>

#proof[
  We expand only the additive state formulas, stopping whenever an earlier mean value is reached. This convention is what makes the coefficient bounds local: the center expression inside that earlier mean is kept as its own node.
  #emph[The three transport formulas.] A probability Picard state has its input position as direct term and mean coefficients with absolute sum at most $C_m r$. A harmonic state has direct term $cos z$ times its input position plus $sin z$ times its input momentum, with mean coefficients of absolute sum at most $C_m r$. The sine-weighted row sums are bounded because their integration intervals have bounded length. These assertions hold at every iteration: its additive direct term is the original input, not the preceding Picard iterate.
  For a kernel evaluation, the scalar expansion (6.13) has absolute coefficient sum at most $B_d sigma^(- 1) delta^(- 4 t - w)$, by the derivative-quadrature, angle-stencil, and forward-integral weight bounds. The momentum formula $\( M_(*) - M_0 \) \/ s$ has coefficient sum at most $C \/ sigma$. A centering Picard update has the original anchor as direct term and bounded outer integral rows. Its position and momentum corrections thus have the same respective coefficient bounds.
  #emph[Centers and their coefficients.] Consider a mean evaluation inside any of these formulas. Its physical center is $x + r rho v$ when its normalized position is $v$, by (3.1). Substitute its direct starting states: a backward probability state starts at the current centering position; a harmonic state starts at that backward position and the current momentum; and a forward probability state starts at the harmonic position. Stop each substitution at the mean terms just described. Only the free terms pass through this chain. Thus their anchor coefficients are exactly $\( rho \, 0 \)$ or $\( rho cos z \, rho sin z \)$. For sampling there is only the first probability computation, so the coefficient is $\( rho \, 0 \)$. Multiplication by $r rho$, with $rho lt.eq 1$, bounds the center coefficient sum in the mean case by
  $ B_d \( r \/ sigma \) delta^(- 4 t - w) + C_m r^2 . $
  The term $C_m r^2$ accounts for the backward, harmonic, and forward integral corrections. In the sampling case the bound is simply $C_m r^2$. Enlarging these positive upper bounds to (6.20) is convenient for the implementation. The mean output is the single quadrature in (6.18), so its coefficient sum is at most $C_m$ and its means all have probability time $b_(*)$. For sampling, dividing a probability correction by $rho_e gt.eq 2 \/ sqrt(5)$ gives output coefficient sum at most $C_m r$. These observations also give the stated final direct terms.
  The scale at probability time $rho$ is $r sqrt(1 - rho^2)$. In the mean computation $rho lt.eq b_(*)$, giving $tau gt.eq R$, including equality for the output means. In the sampling computation,
  $ sqrt(1 - rho_e^2) = eta / sqrt(4 + eta^2) gt.eq R / sqrt(5) . $
  This proves every assertion about the anchors and scales.
  #emph[Expression size and depth.] Let $P lt.eq B_d delta^(- w)$ bound the number of nodes in any one probability mesh. Angle stencils, harmonic quadratures, and outer centering quadratures have fixed numbers of nodes once $m$ is fixed. Formula (6.13) has at most $C_m P^2$ mean terms: one factor $P$ comes from probability-time derivative quadrature, and the other from the forward transport integral. A direct centering position has the same bound, and its momentum has only a fixed number of terms. Substituting their free states into a backward, harmonic, or forward center adds at most one backward list, one harmonic list, and one forward list. No substitution continues through a mean value. Hence $B_d delta^(- 2 w)$ already bounds the direct expression size; the exponent $c_1 w = 10 w$ is a uniform conservative choice.
  All Picard updates at a fixed layer depend only on earlier layers. Order an internal kernel computation as backward transport, harmonic motion, and forward transport, after its input states. A mean path within this computation adds at most $3 N$ nodes above a path in those inputs. There are at most $N$ outer Picard layers, and one final mean layer in (6.18). Thus $3 N^2 + 1$ bounds the depth. The sampling path has depth at most $N$. This gives an acyclic order for (6.19). Meshes, weights, angles and partial integral rows depend only on the prescribed scalar parameters; no exact mean is needed to form any of them.
  #emph[Ideal-law errors.] Couple the numerical mean formula and the exact centering path integral by the same ideal anchors. Corollary 23 bounds their RMS difference by $B_d sigma delta^J D \( x \)$, while Proposition 16 identifies the exact output as $N \( u \, sigma^2 I_d \/ 4 \)$. This coupling proves (6.21). For sampling, the exact probability transport from a standard Gaussian has law $xi_(rho_e)$. After division by $rho_e$ this is the law of
  $ Z + sqrt(1 - rho_e^2) / rho_e G = Z + eta / 2 G \, #h(2em) Z tilde.op nu_(x \, r) \, quad G tilde.op N \( 0 \, I_d \) upright(" independent") . $
  The same-anchor RMS estimate and $rho_e gt.eq 2 \/ sqrt(5)$ prove (6.22). ◻
]

For the implementation we use $J = K_0 + 2$. The theorem fixes $N$ and $D_0$ before $w$; the implementation can therefore choose $w$ using its recursion count, and then choose $m$ by (6.17). The formulas above introduce no random failure event. Their errors are RMS estimates under the ideal input laws, and their algebraic structure holds for every input.

== 7 Finite evaluation of nested conditional means <sec:compiler>

Suppose that a deterministic numerical formula calls for a conditional mean at a center that depends on other conditional means. Even a very accurate unbiased estimate is awkward here: its error changes the next center, and the next call must be analyzed at that random center. We will instead add a prescribed Gaussian to every computed center. A translation identity of the lower-level routine allows that Gaussian to be absorbed into its random seeds. The identity restores the law of a call at the intended center, which is fixed after conditioning on the parent formula’s random input anchors.

We first prove that identity. We then give the full finite recursive construction, including its termination, its query cap on every execution, and its distributional error. The analytical input is a family of finite affine formulas in exact conditional means. Theorem 24 supplies these formulas and their complete numerical construction. We now implement them and thereby prove Theorem 2.

=== 7.1 Why Gaussian center noise helps <why-gaussian-center-noise-helps>

A seeded mean routine at scale $r > 0$ is a measurable deterministic map $sans(Q) \( x \; z_1 \, dots.h \, z_m \) in bb(R)^d$, whose input is a center $x in bb(R)^d$ and $m$ seed slots $z_j in bb(R)^d$. It may query a fixed oracle. A vector $v = \( v_1 \, dots.h \, v_m \) in bb(R)^m$ gives a #emph[query-preserving translation] if, for every center, displacement and fixed seed list,

#[#set math.equation(numbering: n => "(7.1)")
 $ sans(Q) \( x + Delta \; z + v ⊗ Delta \/ r \) = sans(Q) \( x \; z \) \, $ <eq:mean-shift-warmup>]

and the two computations ask exactly the same physical oracle queries. Here $\( v ⊗ a \)_j = v_j a$. This is a deterministic identity; it does not require independent or Gaussian seeds.

#thm([Lemma 7.1.])[
  (Absorbing a Gaussian center displacement).  #emph[Let $D_s > 0$, and let $sans(Q)$ satisfy (7.1), with $parallel v parallel_2 lt.eq D_s$. Put 
$ n = frac(r, 2 D_s) \, #h(2em) P = (I_m - frac(v v^T, 4 D_s^2))^(1 \/ 2) . $

 For a deterministic $x in bb(R)^d$, let $Z \, G_1 \, dots.h \, G_m$ be independent standard Gaussian vectors in $bb(R)^d$. Then the output of $sans(Q) \( x + n Z \; \( P ⊗ I_d \) G \)$ has exactly the law of $sans(Q) \( x \; G \)$.]
] <lem:compiler-absorption>

#proof[
  The eigenvalues of $P$ lie in $\[ sqrt(3) \/ 2 \, 1 \]$. The translation identity rewrites the first output as
  $ sans(Q) (x \; P G - frac(v ⊗ Z, 2 D_s)) . $
  We suppress the tensor product with $I_d$ on slot-space matrices. The seed array in this expression is centered Gaussian and has slot covariance
  $ P P^T + frac(v v^T, 4 D_s^2) = I_m . $
  Its slots are therefore independent standard Gaussian vectors. They may remain correlated with $Z$; that is harmless because the rewritten call is at the deterministic center $x$. ◻
]

The covariance reduction $P$ is essential. With unmodified fresh seeds, translating the noisy center back would add variance. With $P$, the center noise restores precisely the variance removed from the seeds. The construction below maintains the deterministic translation identity at every level, so that this argument applies recursively.

=== 7.2 The numerical input and the implementation task <the-numerical-input-and-the-implementation-task>

We retain the primitive notation of Section 2: $g = nabla F$, $"Lip" \( g \) lt.eq lambda = delta = d^(- e)$, $0 < r lt.eq 1$, and $nu_(x \, r)$ is the law in (2.1). Write $u_(x \, r) = bb(E)_(nu_(x \, r)) g \( x + r Z \)$, $L = lambda r$, $l = lambda r^2$, and $D \( x \) = sqrt(d) + \| g \( x \) \|$. We use the uniform moment bounds (2.6) and conditional coupling rules of Lemma 4. Only evaluations of $g$ will be used by the implementation.

Fix $K_0 \, t$ as in Theorem 2, and retain the numerical parameters

$ R = delta^t \, #h(2em) b_(*) = \( 1 - R^2 \)^(1 \/ 2) \, #h(2em) psi = delta^(4 t) \, #h(2em) J = K_0 + 2 . $

Theorem 24 supplies two finite acyclic circuits, $cal(C)_M$ and $cal(C)_S$, whose nodes are exact conditional means. We use its notation $A$ for the positive declared bound on a center’s absolute coefficient sum, $A_f$ for the output bound, $D_0$ for the mean-dependency depth, and $c_1$ for the absolute constant in the fan-out exponent. A center has the form $x + r \( ell_i y + m_i G \) + sum_(j < i) a_(i j) u_(x_j \, r_j)$, with $r_i = r tau_i$. All these scalar data are deterministic functions of the prescribed numerical parameters, independent of centers, anchors, and oracle responses. We will use the circuit theorem’s explicit coefficient and scale bounds when constructing shifts and propagating sizes; the circuits themselves are comparison formulas, not additional runtime oracles.

For the mean circuit the parameter supplied is the parent’s $sigma$. Its underlying centering flow uses $s = sigma \/ 2$ once, so its direct output is $\( sigma \/ 2 \) G$. Under the specified ideal anchor law, its error is

$ W_2 #scale(x: 120%, y: 120%)[\(] cal(L) \( cal(C)_M \) \, N \( u_(x \, r) \, sigma^2 I_d \/ 4 \) #scale(x: 120%, y: 120%)[\)] lt.eq "polylog" \( d \) sigma delta^J D \( x \) . $

For the sampling circuit the direct output is $y \/ rho_e$, where $rho_e = \( 1 + eta^2 \/ 4 \)^(- 1 \/ 2)$, and the ideal target is $nu_(x \, r) * N \( 0 \, eta^2 I_d \/ 4 \)$. These numerical statements require the anchor laws and size assumptions specified in Theorem 24; we shall verify those assumptions at their uses.

The remaining task is to replace every exact mean by finitely many queries while preserving enough independent Gaussian noise for the absorption identity. The construction below first establishes a query cap on every execution. Its subsequent accuracy proof uses pathwise stability at inaccurate centers, then absorption at ideal noisy centers, and only then a standalone law for a child call.

=== 7.3 Two routines and two different kinds of depth <two-routines-and-two-different-kinds-of-depth>

We construct a mean routine $sans(M) \( x \, r \, sigma \; b \, p \)$ targeting $u_(x \, r) + sigma G$ and a sampling routine $sans(S) \( x \, r \, eta \; b \, p \)$ targeting $Z + eta G$, for independent $Z tilde.op nu_(x \, r)$ and standard Gaussian $G$. The top call is $sans(S) \( x \, r \, 1 \; 1 \, K_0 \)$. Throughout, a reachable call means a descendant of this call, including the call itself. The first label $b$ records the size conditions

#[#set math.equation(numbering: n => "(7.2)")
 $ max { l \, L \/ sigma } lt.eq "polylog" \( d \) delta^b quad \( sans(M) \) \, #h(2em) l \/ eta lt.eq "polylog" \( d \) delta^b quad \( sans(S) \) \, $ <eq:routine-sizes>]

where $R lt.eq eta lt.eq 1$. The second label $p$ records the requested error power. The intended errors are $"polylog" \( d \) sigma delta^p D \( x \)$ and $"polylog" \( d \) delta^p D \( x \)$, respectively. A call is terminal precisely when $p lt.eq b$; it is nonterminal when $p > b$. Every sampling routine reserves a final noise $eta G \/ 2$, unused in its own queries. Before adding that reserve, its target law is $nu_(x \, r) * N \( 0 \, 3 eta^2 I_d \/ 4 \)$.

For a nonterminal sampling call, use $cal(C)_S$ with a standard Gaussian position anchor, supply additional final noise $n = eta \/ sqrt(2)$, and then add the reserve. For a nonterminal mean call, pass the parent parameter $sigma$ to $cal(C)_M$ and supply final noise $n = sqrt(3) sigma \/ 2$. Obtain its position anchor from an $sans(S)$ call at the same center and scale with $eta = R \/ b_(*)$, multiplying that output by $b_(*)$. An ideal such anchor has exactly the required law $b_(*) Z + R N$. Its momentum anchor is an independent standard Gaussian. For all sufficiently large $d$, $R \/ b_(*) in \[ R \, 1 \]$, so the anchor call has an admissible noise parameter.

An expression dependency and a routine call play different roles. For example, suppose a parent circuit contains $E_f = a thin u_(x_2 \, r_2)$ and $x_2 = x + c thin u_(x_1 \, r_1)$. Evaluating $E_f$ invokes two new mean routines: one to help supply $x_2$, and one at that supplied center. Both are children of the #emph[same parent routine]. Their own internal circuits begin the next routine level. The two nested affine expressions do not create two successive losses in the parent’s accuracy label. Figure 2 makes this distinction explicit.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.7), [#box(width: 3.6cm, height: 1.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[parent routine]]])])
  content((-2.8, 0), [#box(width: 3.6cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[mean routine#linebreak()at $x_1$]]])])
  content((2.8, 0), [#box(width: 3.6cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[mean routine#linebreak()at supplied $x_2$]]])])
  line((-0.9882, 1.1), (-1.812, 0.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0.9882, 1.1), (1.812, 0.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((-2.8, -0.6), (-2.8, -1), (2.8, -1), (2.8, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((0, -1), [#text(size: 9pt)[supplies center]], anchor: "north", padding: 0.1176cm)
  content((0, -1.8), [#text(size: 9pt)[solid: routine parentage dashed: expression dependence]])
})],
  caption: [Figure 2: The two calls have the same routine parent even though one helps form the other’s center. When a mean occurs twice, each occurrence uses a separate copy of its entire center-supplying subtree. ],
) <fig:two-depths>

To evaluate an expression, we expand its mean dependencies as an uncached tree, duplicating every mean occurrence together with its entire center-supplying subtree. All mean calls at any expression tier are direct children of the routine whose circuit is being evaluated.

The children of a parent labeled $\( b \, p \)$ receive labels as follows:

#[#set math.equation(numbering: n => "(7.3)")
 $ upright("child’s role") & upright("child labels")\
upright("term of ") E_f upright(" in an ") sans(M) upright(" parent") & \( b + t \, p \)\
upright("term of ") E_f upright(" in an ") sans(S) upright(" parent") & \( b \, p \)\
upright("any other term, or the ") sans(M) upright(" position anchor") & \( b - 10 t \, p - 1 \/ 4 \) . $ <eq:compiler-labels>]

In the last row the labels are always those of the parent routine, not successively decreased while descending its expression tree.

#thm([Lemma 7.2.])[
  (Bounded routine height).  #emph[Starting at $\( b \, p \) = \( 1 \, K_0 \)$, the rules (7.3) give a finite routine tree of height at most a constant $H = H \( K_0 \, t \)$. Every reachable label satisfies $b > 1 \/ 2$.]
] <lem:compiler-height>

#proof[
  Before $4 K_0 + 1$ decreasing transitions, the total loss in $b$ is less than $10 t \( 4 K_0 + 1 \) < 1 \/ 4$, so $b > 3 \/ 4$. At that many transitions, $p lt.eq K_0 - \( 4 K_0 + 1 \) \/ 4 < 0$, forcing termination. Therefore no branch can have more such transitions. Positive transitions increase $b$ by $t$, while a nonterminal satisfies $b < p lt.eq K_0$; their total number is consequently bounded in terms of $K_0 \, t$ and the already bounded total decrease in $b$. A neutral transition is an $sans(S)$-to-$sans(M)$ transition. Another neutral transition requires first reaching another $sans(S)$, which can occur only through a decreasing transition. This bounds the neutral transitions as well and proves both claims. ◻
]

A routine is a deterministic function of its center, scalar parameters, oracle, and a finite ordered list of $d$-dimensional seed slots. Standalone use fills these slots by independent standard Gaussians. In addition, each routine will have a deterministic vector $v$ of scalar coefficients, one per slot, with

#[#set math.equation(numbering: n => "(7.4)")
 $ parallel v parallel_2 lt.eq D_s \, #h(2em) D_s := delta^(- t) . $ <eq:shift-budget>]

For #emph[every] fixed seed list, changing $x$ to $x + Delta$ and adding $v ⊗ Delta \/ r$ to the seeds will preserve every physical query point. The output of $sans(M)$ will be unchanged; the normalized output of $sans(S)$ will decrease by $Delta \/ r$. These are pathwise properties, not statements restricted to Gaussian seeds.

Within each call write $u = u_(x \, r)$ and $nu = nu_(x \, r)$. At a terminal call define

$ sans(M) & = g \( x + r Z \) + sigma G \,\
sans(S) & = Z - r g \( x + r Z \) + \( sqrt(3) eta \/ 2 \) G_1 + \( eta \/ 2 \) G_2 \, $

with separate seed slots. The last term in $sans(S)$ is its reserved noise. Taking $v = - 1$ on the $Z$ slot and zero elsewhere proves the shift property and $parallel v parallel_2 = 1$.

=== 7.4 Evaluating an expression at a noisy center <evaluating-an-expression-at-a-noisy-center>

Fix a parent circuit and its anchors, and write $M_i = u_(x_i \, r_i)$ for its exact mean nodes. For each expression $E = b_0 + sum_i a_i M_i$, the operation $"Eval" \( E \, n \)$ will approximate its exact value plus an independent $N \( 0 \, n^2 I_d \)$ noise. Assign disjoint seed blocks to every term occurrence, its center-supplying computation, and each residual noise; keep all these blocks separate from the anchors. Thus the term blocks are independent conditional on the anchors in a standalone call.

Here is the recursive evaluation rule, assuming the child routines and their shift vectors have already been constructed. Take $A' = A$ for a center expression and $A' = A_f$ at the output, and put $sigma_i = n \/ \( 2 A' \)$. For the term of scale $r_i = r tau_i$, first evaluate its center expression with noise

#[#set math.equation(numbering: n => "(7.5)")
 $ n_i = frac(r_i, 2 D_s) . $ <eq:compiler-center-noise>]

At this supplied center run the child $sans(M)$ with scale $r_i$, noise $sigma_i$, and labels from (7.3). If its shift vector is $v_i$, apply to its fresh seed block $G_i$ the deterministic slot-space transformation

#[#set math.equation(numbering: n => "(7.6)")
 $ P_i = (I - frac(v_i v_i^T, 4 D_s^2))^(1 \/ 2) \, #h(2em) upright("and use seeds ") \( P_i ⊗ I_d \) G_i . $ <eq:compiler-seed-transform>]

Denote its output by $Q_i$. Return

#[#set math.equation(numbering: n => "(7.7)")
 $ b_0 + sum_i a_i Q_i + (n^2 - sum_i a_i^2 sigma_i^2)^(1 \/ 2) G_E \, $ <eq:compiler-eval>]

where $G_E$ is a separate slot. The square root is defined, since

$ sum_i a_i^2 sigma_i^2 lt.eq (sum_i \| a_i \|)^2 frac(n^2, 4 \( A' \)^2) lt.eq n^2 \/ 4 . $

If there are no terms, return $b_0 + n G_E$. The mean-node ordering makes the expression recursion finite. At the parent’s output use the value of $n$ specified above; add the reserved noise for $sans(S)$. A routine supplied with correlated seeds performs these same deterministic operations, without any change of rule.

At an ideal supplied center $x_i + n_i Z$, Lemma 25 now identifies this child with its standalone law at $x_i$. We still owe the construction of the shift vectors and a proof that the noisy supplied centers are accurate. We prove these in that order.

=== 7.5 Query-preserving shifts and the deterministic cap <query-preserving-shifts-and-the-deterministic-cap>

We next show that the shift vectors required in Lemma 25 exist with the universal bound (7.4). This also verifies that the definition is noncircular and has a deterministic query cap.

For a nonterminal $sans(S)$, shift its Gaussian position anchor by $- rho_e Delta \/ r$. For a nonterminal $sans(M)$, we require its position anchor $y_(*)$ to shift by $- Delta \/ \( b_(*) r \)$ and leave its momentum anchor unchanged. To obtain this, apply the shift of its anchor $sans(S)$ call and additionally shift that call’s reserved seed by the coefficient $- 2 R \/ b_(*)$ times $Delta \/ r$. The ordinary shift changes its output by $- Delta \/ r$. Since the reserved standard deviation is $R \/ \( 2 b_(*) \)$, the additional change is $- R^2 Delta \/ \( b_(*)^2 r \)$. Multiplication by $b_(*)$ makes the total change

$ - (b_(*) + R^2 / b_(*)) Delta / r = - frac(Delta, b_(*) r) . $

The extra slot is used in no query, so query invariance is preserved.

For a term of scale $r tau_i$, the direct part of its supplied center then changes by $k_i Delta$, where

$ k_i = 1 - ell_i rho_e quad \( sans(S) \) \, #h(2em) k_i = 1 - ell_i \/ b_(*) quad \( sans(M) \) . $

These coefficients satisfy $\| k_i \| \/ tau_i lt.eq C$. For $sans(S)$, $rho_i lt.eq rho_e$ gives $1 - rho_i rho_e lt.eq 2 \( 1 - rho_i \) lt.eq 2 tau_i$. For $sans(M)$, its two possible coefficients obey

$ 0 lt.eq 1 - rho_i cos z \/ b_(*) lt.eq C \( 1 - rho_i \) + C z^2 \, $

with $z = 0$ when there is no cosine. Use $1 - rho_i lt.eq tau_i$, $tau_i gt.eq c R$, and $z^2 \/ R lt.eq C delta^(7 t) arrow.r 0$.

Shift that child’s untransformed seed block by

#[#set math.equation(numbering: n => "(7.8)")
 $ k_i / tau_i P_i^(- 1) v_i ⊗ Delta / r . $ <eq:compiler-child-shift>]

If (7.4) holds for the child, the smallest eigenvalue of $P_i$ is at least $sqrt(3) \/ 2$, so $parallel P_i^(- 1) parallel_(upright("op")) lt.eq 2$. Formula (7.8) induces exactly the child’s shift for center displacement $k_i Delta$. Leave all residual noise slots fixed. Induction from leaf expressions upward shows that every mean output is unchanged, and therefore that the actual supplied-center change is precisely its direct-term change. All queries are preserved. The parent’s final direct term is unchanged for $sans(M)$ and changes by $- Delta \/ r$ for $sans(S)$, giving the required output behavior.

The center-supplying subtree and the invoked child have disjoint slots. In particular, the factor $k_i \/ tau_i$ in (7.8) multiplies only the shift of that child, not the shifts of routines used to supply its center. Those are other direct children of the same parent and are charged once in its total shift vector.

#thm([Lemma 7.3.])[
  (Well-defined construction and query cap).  #emph[One can choose $w > 0$, depending only on $K_0 \, t$ and the fixed Picard counts, and then choose the interpolation orders, so that the entire construction is well defined for all sufficiently large $d$. Every routine reached from a top call satisfies (7.4). Its total number of seed slots and oracle queries is at most $"polylog" \( d \) delta^(- t)$ on every execution.]
] <lem:compiler-count>

#proof[
  Let $D_0$ be the dependency-depth bound in Theorem 24, and let $F_0$ be its direct fan-out bound. Expanding a circuit into an expression tree costs at most $\( D_0 + 1 \) \( 1 + F_0 \)^(D_0)$ nodes. Its size is thus $"polylog" \( d \) delta^(- C_2 w)$, where $C_2$ depends on the Picard counts but not on $w$ or the interpolation orders. This bounds its direct child invocations and its own anchor and residual slots. Expanding through the height $H$ from Lemma 26 gives $"polylog" \( d \) delta^(- C_3 w)$ slots and terminal queries. Interpolation orders change only fixed multiplicative constants in these bounds, not $C_2$ or $C_3$.
  The terminal shift has norm $1$. Assuming the shift bound for the children, the bounded ratios and inverse norms above show that a parent’s shift norm is at most a fixed constant times one plus the sum of its direct children’s shift norms, including the anchor call. The extra reserved-slot shift has bounded coefficient. The triangle inequality is sufficient even if ordinary and extra anchor shifts affect the same slot. Iterating through the fixed routine height gives the same bound $"polylog" \( d \) delta^(- C_3 w)$, after increasing $C_3$ if necessary.
  Choose $w > 0$ with
  $ C_3 w < t \/ 2 \, #h(2em) w < t \, #h(2em) c_1 w < t \, $
  and only then choose the fixed interpolation orders needed in Theorem 24. For sufficiently large $d$, the last shift bound is smaller than $D_s = delta^(- t)$. This is a valid bottom-up induction: it proves each child’s bound before using its inverse transformation in the parent. The count bound is also at most $"polylog" \( d \) delta^(- t)$.
  To make the parameter order explicit, first fix the Picard counts, hence $D_0 \, H \, C_3$, then $w$, then the interpolation orders. The universal scalar $D_s$ fixes every center-noise budget. The circuit shapes, labels, requested noises, and slot counts are determined by these scalar parameters before any shifts are computed. Compute child shifts before their matrices and the parent shift. No center value, oracle response, numerical-error estimate, or assumption (7.2) enters this finite construction or the count. Only terminal routines query $g$, once each; hence the bound is a cap on every execution, not an expected query count. ◻
]

=== 7.6 Terminal errors and propagation of scales <terminal-errors-and-propagation-of-scales>

The finite construction and its cap are now established independently of accuracy. We next verify its terminal errors and the size conditions needed by the numerical estimates.

#thm([Lemma 7.4.])[
  (Terminal accuracy).  #emph[In standalone use, a terminal call satisfying (7.2) obeys 
$ W_2 #scale(x: 120%, y: 120%)[\(] cal(L) \( sans(M) \) \, N \( u \, sigma^2 I_d \) #scale(x: 120%, y: 120%)[\)] & lt.eq "polylog" \( d \) sigma delta^p D \( x \) \,\
W_2 #scale(x: 120%, y: 120%)[\(] cal(L) \( sans(S)_(upright("pre")) \) \, nu_(x \, r) * N \( 0 \, 3 eta^2 I_d \/ 4 \) #scale(x: 120%, y: 120%)[\)] & lt.eq "polylog" \( d \) delta^p D \( x \) \, $

 where $sans(S)_(upright("pre"))$ is the output before adding its reserved noise $eta G_2 \/ 2$. The sampling bound also holds after adding that same independent reserve to both laws. The fixed-seed center Lipschitz constant is at most $lambda$ for $sans(M)$ and $r lambda$ for $sans(S)$.]
] <lem:compiler-terminal>

#proof[
  For the standard Gaussian seed $Z$, the primitive moment bounds give
  $ parallel g \( x + r Z \) - u parallel_(L^2) lt.eq C L #scale(x: 120%, y: 120%)[\(] sqrt(d) + r \| g \( x \) \| #scale(x: 120%, y: 120%)[\)] lt.eq C L D \( x \) . $
  Since $L \/ sigma lt.eq "polylog" \( d \) delta^b$ and $p lt.eq b$, this is within the mean error budget; couple the added Gaussian identically.
  Let $z_0$ be the mode of $nu_(x \, r)$, so $z_0 = - r g \( x + r z_0 \)$. Then
  $ parallel Z - r g \( x + r Z \) - \( Z + z_0 \) parallel_(L^2) lt.eq l parallel Z - z_0 parallel_(L^2) lt.eq C l D \( x \) . $
  Also $W_2 \( N \( z_0 \, I_d \) \, nu_(x \, r) \) lt.eq C l sqrt(d)$. Apply the synchronous comparison in Lemma 3 with Gaussian potential $H_0 \( z \) = \| z - z_0 \|^2 \/ 2$ (contraction constant $1$) and tilted potential $H \( z \) = \| z \|^2 \/ 2 + F \( x + r z \)$. Their gradient difference is $r \[ g \( x + r z \) - g \( x + r z_0 \) \]$, whose $L^2 \( nu_(x \, r) \)$ norm is at most $l parallel Z - z_0 parallel_(L^2 \( nu_(x \, r) \)) lt.eq C l sqrt(d)$. This proves the displayed Wasserstein bound under exactly the $C^2$ and bounded-Hessian hypotheses of that lemma. Adding the same independent comparison noises proves the sampling error $C l D \( x \) lt.eq "polylog" \( d \) eta delta^b D \( x \)$, which is at most the requested bound because $eta lt.eq 1$ and $p lt.eq b$. Omitting $G_2$ proves the pre-reserved assertion. The Lipschitz bounds follow directly from the two displayed terminal formulas. ◻
]

#thm([Lemma 7.5.])[
  (Size conditions descend through the routine tree).  #emph[Starting with a top call satisfying (7.2), every descendant satisfies that condition with its assigned labels, up to a uniform polylogarithmic factor. At each nonterminal circuit, 
#[#set math.equation(numbering: n => "(7.9)")
 $ lambda A lt.eq "polylog" \( d \) delta^(1 \/ 3) . $ <eq:small-coefficients>]

 For nonfinal expression terms within an $sans(M)$ parent, $sigma_i lt.eq C sigma$; within an $sans(S)$ parent, $r sigma_i lt.eq C$.]
] <lem:compiler-sizes>

#proof[
  For a final term of an $sans(M)$ parent, the output uses only means of scale $r R$, so $r_i = r R$, while $sigma_i$ is a fixed positive multiple of $sigma$. Thus $L_i \/ sigma_i$ gains a factor $R$ and $l_i$ gains $R^2$, allowing labels $\( b + t \, p \)$. For a final term of an $sans(S)$ parent, $sigma_i$ is a fixed positive multiple of $eta \/ r$. Therefore $L_i \/ sigma_i lt.eq C l \/ eta$ and $l_i lt.eq l$, allowing the unchanged labels.
  For a nonfinal term, let $r tau_(upright("prev"))$ be the scale of the node whose center is currently being supplied. Its expression is evaluated with budget $r tau_(upright("prev")) \/ \( 2 D_s \)$, irrespective of the tier at which it occurs. Consequently
  $ sigma_i = frac(r tau_(upright("prev")), 4 D_s A) \, #h(2em) L_i / sigma_i lt.eq frac(C D_s lambda A, R) . $
  The coefficient estimates give $lambda A lt.eq "polylog" \( d \) delta^(b - 4 t - c_1 w)$ for an $sans(M)$ parent. For an $sans(S)$ parent, $lambda A = C_1 l lt.eq "polylog" \( d \) delta^b$, since $eta lt.eq 1$. Using $D_s \/ R = delta^(- 2 t)$ and $c_1 w < t$ costs less than the allowed $10 t$ decrease in $b$. Also $l_i lt.eq l$. For the position-anchor $sans(S)$ call of $sans(M)$, $l \/ eta lt.eq l \/ R$, which has the same allowance. This proves the size conditions by the bounded routine height. All accumulated fixed and polylogarithmic factors are still one polylogarithmic factor.
  As $b > 1 \/ 2$ and $4 t + c_1 w < 5 t < 1 \/ 6$, the coefficient bounds imply (7.9). Finally, the positive declared bound for $A$ includes a fixed multiple of $r \/ sigma$ in an $sans(M)$ parent, so $sigma_i lt.eq r \/ \( 4 D_s A \) lt.eq C sigma$. For $sans(S)$, $A = C_1 r^2$ gives $r sigma_i lt.eq 1 \/ \( 4 C_1 D_s \) lt.eq C$. ◻
]

=== 7.7 Stability for arbitrary fixed seeds <stability-for-arbitrary-fixed-seeds>

#thm([Lemma 7.6.])[
  (Fixed-seed stability).  #emph[For every seed array, including correlated or transformed arrays, the compiled $sans(M)$ output is a function of $x$ with Lipschitz constant at most $"polylog" \( d \) lambda$; the normalized $sans(S)$ output has constant at most $"polylog" \( d \) r lambda$. If the anchors of a nonterminal $sans(M)$ are treated as separate inputs, its Lipschitz constant in the position anchor is at most $"polylog" \( d \) L$.]
] <lem:compiler-lipschitz>

#proof[
  Induct on routine height, with the terminal case supplied by Lemma 28. First hold the anchors fixed. A direct center term has Lipschitz constant $1$ in $x$ and at most $C r$ in a position anchor. The center-supplying expression combines child outputs with total absolute coefficient at most $A$. Using the child $sans(M)$ bound, the contribution of earlier supplied-center sensitivities is at most $"polylog" \( d \) lambda A$ times their maximum. By (7.9), this is small. Induction through the bounded expression depth therefore bounds center sensitivities by a constant times their direct sensitivities, with an allowed polylogarithmic factor.
  At the final expression the coefficient sum is $A_f$. Its direct term has no center dependence when anchors are held fixed; for $sans(M)$ it also has no position-anchor dependence. Hence its center sensitivity is at most $"polylog" \( d \) A_f lambda$, and its $sans(M)$ position-anchor sensitivity at most $"polylog" \( d \) A_f lambda r$. These are the asserted bounds with anchors treated as separate inputs. The $sans(S)$ Gaussian anchor is indeed center independent. The $sans(M)$ position anchor is supplied by $sans(S)$ at the same center, whose center Lipschitz constant by induction is $"polylog" \( d \) r lambda$. Its additional contribution is at most $"polylog" \( d \) L r lambda = "polylog" \( d \) L^2$, and $L^2 lt.eq lambda$ for $r lt.eq 1$ and $lambda lt.eq 1$. All seed transformations depend only on scalar parameters, not on $x$. The proof uses only fixed-seed identities and Lipschitz bounds, and therefore requires no seed independence. ◻
]

=== 7.8 Standalone accuracy and the primitive theorem <standalone-accuracy-and-the-primitive-theorem>

We prove the law guarantees by induction on routine height. This is the only stage at which a routine’s seeds are assumed independent standard Gaussians. Such an assumption will be used for a child only after the absorption identity has restored its full standalone seed law.

#thm([Proposition 7.7.])[
  (Accuracy of the compiled routines).  #emph[For every call reached from the top labels, the standalone routines satisfy 
$ W_2 \( cal(L) \( sans(M) \) \, N \( u \, sigma^2 I_d \) \) & lt.eq "polylog" \( d \) sigma delta^p D \( x \) \,\
W_2 #scale(x: 120%, y: 120%)[\(] cal(L) \( sans(S)_(upright("pre")) \) \, nu_(x \, r) * N \( 0 \, 3 eta^2 I_d \/ 4 \) #scale(x: 120%, y: 120%)[\)] & lt.eq "polylog" \( d \) delta^p D \( x \) \, $

 where $sans(S)_(upright("pre"))$ denotes the output before its reserved noise. The latter bound also holds after adding the reserved noise to both laws, and 
$ parallel cal(L) \( sans(S) \) - nu_(x \, r) * N \( 0 \, eta^2 I_d \) parallel_(upright("TV")) lt.eq "polylog" \( d \) frac(delta^p D \( x \), eta) . $

]
] <prop:compiler-accuracy>

#proof[
  The terminal assertion is Lemma 28. All random variables below have finite second moments: the actual algorithms are finite compositions of affine maps and globally Lipschitz oracle evaluations, while ideal tilted variables have the primitive moment bounds. Thus all $W_2$ comparisons are defined.
  For a nonterminal $sans(M)$, first couple its approximate $sans(S)$ position anchor to an ideal anchor, independently of all remaining seed blocks. The child labels are $\( b - 10 t \, p - 1 \/ 4 \)$. By induction and Lemma 30, replacing this anchor costs at most
  $ "polylog" \( d \) L delta^(p - 1 \/ 4) D \( x \) . $
  After division by the mean error unit $sigma delta^p D \( x \)$, the cost is at most $"polylog" \( d \) delta^(b - 1 \/ 4)$, hence is bounded for large $d$. We may now assume that the position anchor has law $b_(*) Z + R N$, where $Z tilde.op nu_(x \, r)$ and $N$ is standard Gaussian, and that the momentum anchor is an independent standard Gaussian. These are exactly the input laws in Theorem 24.
  Let $x_i$ be the centers of the deterministic exact-mean circuit under these anchors, and put $D_i = sqrt(d) + \| g \( x_i \) \|$. Their RMS values over anchors obey
  #[#set math.equation(numbering: n => "(7.10)")
   $ max_i parallel D_i parallel_(L^2) lt.eq "polylog" \( d \) D \( x \) . $ <eq:compiler-center-moments>]
  Indeed, both position and momentum anchors have RMS at most $C D \( x \)$. Use $\| g \( x_i \) \| lt.eq \| g \( x \) \| + lambda \| x_i - x \|$ and the circuit’s direct terms. An exact primitive mean at a preceding center has magnitude at most $C D_j$. Their contribution to this maximum-of-RMS recurrence is at most $C lambda A$ times its previous maximum. This is small by (7.9); the direct terms cost at most $C D \( x \)$. Induction through the node ordering proves (7.10) without a maximum inside the expectation.
  Condition on the anchors. For an expression $E$, write $epsilon.alt_E$ for the $W_2$ error of $"Eval" \( E \, n \)$ relative to its deterministic exact value plus $N \( 0 \, n^2 I_d \)$. Couple the supplied center of its $i$th term to $x_i + n_i Z$ with its conditional $W_2$ error $epsilon.alt_(E_i)$. Use the same transformed child seeds on these two centers, drawn independently of this coupling. The fixed-seed Lipschitz bound costs at most $"polylog" \( d \) lambda epsilon.alt_(E_i)$. At the ideal noisy center, Lemma 25 identifies the child’s law with its standalone law at $x_i$. The induction hypothesis therefore supplies the additional error $"polylog" \( d \) sigma_i delta^(p_i) D_i$.
  Different term occurrences have disjoint blocks, so their outputs are independent conditional on the anchors. Product couplings compare them to independent noised exact means. Together with the independent residual in (7.7), the ideal sum has exactly covariance $n^2 I_d$. We conclude that
  #[#set math.equation(numbering: n => "(7.11)")
   $ epsilon.alt_E lt.eq sum_i \| a_i \| ["polylog" \( d \) lambda epsilon.alt_(E_i) + "polylog" \( d \) sigma_i delta^(p_i) D_i] . $ <eq:compiler-error-recursion>]
  Notice the order of this argument: inaccurate supplied centers use only pathwise stability, and standalone accuracy is invoked only after Gaussian absorption. No assertion is made that the actual algorithm’s intermediate states have the ideal input laws.
  Take RMS in the anchors and expand (7.11) through the finite expression tree. At its root, direct-child labels have $p_i = p$ and
  $ sum_i \| a_i \| sigma_i lt.eq A_f frac(n, 2 A_f) = n \/ 2 . $
  Thus their intrinsic errors fit the requested budget. At tier $j gt.eq 2$, absolute coefficient sums and Lipschitz factors contribute at most
  $ A_f #scale(x: 120%, y: 120%)[\(] "polylog" \( d \) lambda A #scale(x: 120%, y: 120%)[\)]^(j - 1) . $
  All such children have the single accuracy-label loss $p_i = p - 1 \/ 4$, not one loss per expression tier. Their noise units are at most $C sigma$ in an $sans(M)$ parent and $C \/ r$ in an $sans(S)$ parent by Lemma 29; these units combine with $A_f = C_1$ or $C_1 r$, respectively. Already the first factor $"polylog" \( d \) lambda A lt.eq "polylog" \( d \) delta^(1 \/ 3)$ pays for the loss $delta^(- 1 \/ 4)$, leaving a positive power $delta^(1 \/ 12)$. The bounded expression depth allows all further tiers and polylogarithmic factors to be summed. Leaf affine expressions have zero error. This proves the required final evaluation error.
  Conditionally on the anchors, the ideal final evaluation is its deterministic exact-mean circuit value plus a Gaussian of the specified fixed covariance. Its noise may therefore be taken independent of the anchors. By Lemma 29, Theorem 24 applies. It compares the ideal mean circuit to $N \( u \, sigma^2 I_d \/ 4 \)$ and the ideal sampling circuit to $nu_(x \, r) * N \( 0 \, eta^2 I_d \/ 4 \)$, with the respective errors $"polylog" \( d \) sigma delta^J D \( x \)$ and $"polylog" \( d \) delta^J D \( x \)$. Since $J = K_0 + 2$ and $p lt.eq K_0$, both errors fit the requested bounds. Couple the independent evaluation noise identically in each comparison. For $sans(M)$, its variance $3 sigma^2 \/ 4$ raises the Gaussian target variance from $sigma^2 \/ 4$ to $sigma^2$. For $sans(S)$, its variance $eta^2 \/ 2$ raises the Gaussian convolution variance from $eta^2 \/ 4$ to $3 eta^2 \/ 4$. This closes the standalone induction. Adding the common reserved noise preserves the $W_2$ bound; Gaussian smoothing by its standard deviation $eta \/ 2$ gives the stated total variation bound by (2.7). ◻
]

#proof[
  Use the top $sans(S)$ call with $\( b \, p \, eta \) = \( 1 \, K_0 \, 1 \)$. Because $l = delta r^2 lt.eq delta$, its size condition holds with constant $1$. Proposition 31 gives both $W_2$ and total variation error at most $"polylog" \( d \) delta^(K_0) D \( x \)$ from $nu_(x \, r) * N \( 0 \, I_d \)$, uniformly in $x$ and $0 < r lt.eq 1$. Lemma 27 gives at most $"polylog" \( d \) delta^(- t)$ evaluations of $g$ on every execution. The output has the form $X_(upright("pre")) + G \/ 2$, where the reserved standard Gaussian $G$ is independent of $X_(upright("pre"))$ and all queries, and the pre-reserved conclusion of Proposition 31 gives $W_2 \( cal(L) \( X_(upright("pre")) \) \, nu_(x \, r) * N \( 0 \, 3 I_d \/ 4 \) \) lt.eq "polylog" \( d \) delta^(K_0) D \( x \)$. The exact means and numerical comparison laws serve only to analyze this finite algorithm; its only oracle operations are the terminal evaluations. ◻
]

== 8 From noisy conditional samples to the target law <sec:sampling>

The auxiliary algorithm returns a conditional sample with an added Gaussian. We now use it to sample the original, unnoised law $pi_V$. The construction has two stages. A contracting proximal chain first approaches $tilde(pi) = pi_V * N \( 0 \, h I_d \)$. Conditional on its output, a sequence of variance-halving steps reduces the remaining sampling problem to a law close to a mode-centered Gaussian. The numbers of calls in both stages are prescribed in advance.

Throughout this section, $V in C^2 \( bb(R)^d \)$ satisfies $V \( 0 \) = 0$, $nabla V \( 0 \) = 0$, and $I_d prec.curly.eq nabla^2 V prec.curly.eq 2 I_d$ everywhere. The origin is therefore the supplied minimizer. Each original query returns both $V$ and $nabla V$ at the queried point. The main construction uses only the gradient; the bounded-dimensional fallback also uses the value. We fix $0 < e < 1$, put $delta = d^(- e)$ and $h = delta \/ 2$, and take an integer $K_0 > 2 + 1 \/ e$. Choose $t > 0$ as in (2.3), and fix the approximation orders required by Theorem 2. All sufficiently-large-dimension thresholds below are uniform in $V$.

=== 8.1 A contracting noised chain <a-contracting-noised-chain>

The Gaussian proximal sampler alternates a Gaussian step with a restricted Gaussian conditional draw #cite(label("lee2021proximal")) Definition 1 and Lemmas 2 and 4; see also #cite(label("chen2022proximal"), form: "prose") Section 3 and Theorem 1. We use the chain on the noised variable and prove its contraction directly.

For $y in bb(R)^d$, denote by $kappa_y$ the probability law with density proportional to

#[#set math.equation(numbering: n => "(8.1)")
 $ exp #h(-0.16667em) (- V \( x' \) - frac(\| x' - y \|^2, 2 h)) . $ <eq:proximal-conditional>]

The ideal transition $P_h$ draws $x' tilde.op kappa_y$ and returns $x' + sqrt(h) thin N$, where $N$ is an independent standard Gaussian. Thus $P_h \( y \, dot.op \) = kappa_y * N \( 0 \, h I_d \)$.

#thm([Lemma 8.1.])[
  (Proximal contraction).  #emph[The law $tilde(pi)$ is invariant for $P_h$, and 
$ W_2 \( kappa_(y_1) \, kappa_(y_2) \) lt.eq frac(\| y_1 - y_2 \|, 1 + h) . $

 Consequently, for input laws $mu \, eta$ of finite second moment, 
$ W_2 \( mu P_h \, eta P_h \) lt.eq frac(W_2 \( mu \, eta \), 1 + h) . $

]
] <lem:proximal-contraction>

#proof[
  Under the joint law $pi_V \( d x \) N \( x \, h I_d \) \( d y \)$, the conditional law of $x$ given $y$ is $kappa_y$. Drawing this conditional and then redrawing $y$ given $x$ preserves the joint law, whose $y$-marginal is $tilde(pi)$.
  The potential in (8.1) has curvature at least $1 + 1 \/ h$. Replacing $y_1$ by $y_2$ changes its gradient by the constant vector $\( y_1 - y_2 \) \/ h$. The synchronous comparison (2.5) therefore bounds the conditional $W_2$ distance by $\| y_1 - y_2 \| \/ \( 1 + h \)$. Couple the subsequent Gaussian increments identically. Integrating these conditional couplings against an input coupling, as in Lemma 4, proves the kernel contraction. ◻
]

To implement this transition, substitute $x' = y + sqrt(h) thin z$ in (8.1). The normalized conditional potential becomes $\| z \|^2 \/ 2 + F_y \( z \)$, where

#[#set math.equation(numbering: n => "(8.2)")
 $ F_y \( z \) = V \( y + sqrt(h) thin z \) \, #h(2em) g_y \( z \) = nabla F_y \( z \) = sqrt(h) thin nabla V \( y + sqrt(h) thin z \) . $ <eq:proximal-primitive>]

The Hessian bound and $nabla V \( 0 \) = 0$ give

$ "Lip" \( g_y \) lt.eq 2 h = delta \, #h(2em) \| g_y \( 0 \) \| lt.eq 2 sqrt(h) thin \| y \| . $

An evaluation of $g_y$ is one original first-order query. Apply Theorem 2 to $F_y$ at center zero and scale one, with fresh standalone seeds, and map its output $S$ to $y + sqrt(h) thin S$. This defines the actual transition $hat(P)_h$. The primitive already approximates $Z + N$, so the ideal comparison law of this affine image is exactly $P_h \( y \, dot.op \)$. In particular, the primitive’s independent final reserve $G \/ 2$ is retained. Its pre-reserve $W_2$ guarantee and Gaussian smoothing are what supply the following TV guarantee:

#[#set math.equation(numbering: n => "(8.3)")
 $ W_2 \( hat(P)_h \( y \, dot.op \) \, P_h \( y \, dot.op \) \) & lt.eq sqrt(h) thin B_d delta^(K_0) \( sqrt(d) + 2 sqrt(h) thin \| y \| \) \,\
lr(bar.v.double hat(P)_h \( y \, dot.op \) - P_h \( y \, dot.op \) bar.v.double)_(upright("TV")) & lt.eq B_d delta^(K_0) \( sqrt(d) + 2 sqrt(h) thin \| y \| \) . $ <eq:proximal-local-errors>]

Here and below $B_d = C \( 1 + log d \)^C$ may be increased by a fixed factor or power. Its constants depend only on the fixed parameters, not on the center, oracle, or random history.

#thm([Proposition 8.2.])[
  (Mixing of the approximate noised chain).  #emph[With $K_0 > 2 + 1 \/ e$ and $t$ chosen above, start the $hat(P)_h$-chain at zero and run $ceil.l C h^(- 1) log d ceil.r + 1$ steps. For a sufficiently large fixed $C$, its output has total-variation distance $o \( 1 \)$ from $tilde(pi)$, uniformly over all admissible $V$.]
] <prop:noised-mixing>

#proof[
  Lemma 3, applied at the mode zero, gives $bb(E)_(pi_V) \| X \|^2 lt.eq d$. Hence the root mean square under $tilde(pi)$ is at most $C sqrt(d)$. Let $mu_k$ be the actual law after $k$ steps, and set $a_k = W_2 \( mu_k \, tilde(pi) \)$. Then
  $ (integral \| y \|^2 thin mu_k \( d y \))^(1 \/ 2) lt.eq a_k + C sqrt(d) . $
  All these moments are finite. Indeed they are finite at $k = 0$, and the local $W_2$ bound in (8.3), together with the conditional moment bounds for $P_h$, propagates finite second moments to the next step.
  Take the root mean square of the first local error in (8.3). Conditional coupling and Lemma 32 give
  $ a_(k + 1) lt.eq (frac(1, 1 + h) + 2 h B_d delta^(K_0)) a_k + C sqrt(h) thin B_d delta^(K_0) sqrt(d) . $
  For all large $d$, the coefficient of $a_k$ is at most $1 - c h$ for an absolute $c > 0$. Since $a_0 lt.eq C sqrt(d)$, summing this geometric recurrence yields
  #[#set math.equation(numbering: n => "(8.4)")
   $ a_k lt.eq C sqrt(d) thin e^(- c h k) + C h^(- 1 \/ 2) B_d delta^(K_0) sqrt(d) . $ <eq:proximal-global-error>]
  The second term is $o \( sqrt(h) \)$: after division by $sqrt(h)$, it is bounded by a constant times $B_d delta^(K_0 - 1) sqrt(d)$, which tends to zero because $e \( K_0 - 1 \) > 1 \/ 2$. At $k = ceil.l C h^(- 1) log d ceil.r$, a sufficiently large fixed $C$ makes the first term $o \( sqrt(h) \)$ as well.
  Use one more transition to obtain TV control. The mixture bound in Lemma 4 gives
  $ lr(bar.v.double mu_k hat(P)_h - mu_k P_h bar.v.double)_(upright("TV")) lt.eq B_d delta^(K_0) #scale(x: 120%, y: 120%)[\[] sqrt(d) + 2 sqrt(h) thin \( a_k + C sqrt(d) \) #scale(x: 120%, y: 120%)[\]] = o \( 1 \) . $
  For the remaining comparison, the conditional $x'$-laws from $mu_k$ and $tilde(pi)$ can be coupled with root mean square at most $a_k \/ \( 1 + h \)$. Their common independent $sqrt(h)$-Gaussian then gives, by (2.7),
  $ lr(bar.v.double mu_k P_h - accent(pi P, ̃)_h bar.v.double)_(upright("TV")) lt.eq frac(a_k, \( 1 + h \) sqrt(h)) = o \( 1 \) . $
  Invariance of $tilde(pi)$ completes the proof. ◻
]

=== 8.2 Conditional descent and its ideal histories <conditional-descent-and-its-ideal-histories>

An exact draw from $kappa_y$ with $y tilde.op tilde(pi)$ has marginal $pi_V$. We next implement this unnoised conditional draw. For its analysis, first replace the incoming approximate $y$ by $y tilde.op tilde(pi)$. Applying the same conditional algorithm to both inputs costs at most the TV error of Proposition 33, by data processing.

For a related recursive restricted-Gaussian-oracle framework, see Chen–Chewi–Lu–Zhang #cite(label("chen2026picard")) Algorithm 3.3 and Section 6.3. The construction here uses fixed variance halving, mode-centered Gaussian termination, and an every-execution query cap.

Fix $y$ temporarily. Keep $F_y$ and its oracle $g_y$ fixed throughout the conditional algorithm; only the primitive center and scale change. At center $x$ and scale $r$, the desired normalized law is

$ nu_(x \, r) \( d z \) prop exp #scale(x: 120%, y: 120%)[\(] - \| z \|^2 \/ 2 - F_y \( x + r z \) #scale(x: 120%, y: 120%)[\)] thin d z . $

Suppose first that $Z tilde.op nu_(x \, r)$ and that $N$ is an independent standard Gaussian. Given $Y = Z + N$, the conditional density of $Z$ is proportional to

$ exp #scale(x: 120%, y: 120%)[\(] - \| z - Y \/ 2 \|^2 - F_y \( x + r z \) #scale(x: 120%, y: 120%)[\)] . $

Substitute $z = Y \/ 2 + z_(upright("new")) \/ sqrt(2)$ to obtain the exact identity

#[#set math.equation(numbering: n => "(8.5)")
 $ Z = Y / 2 + Z_(upright("new")) / sqrt(2) \, #h(2em) Z_(upright("new")) divides Y tilde.op nu_(thin x + r Y \/ 2 \, #h(0.27778em) r \/ sqrt(2)) . $ <eq:conditional-descent>]

The actual algorithm starts at $x_0 = 0 \, r_0 = 1$ and uses $J = ceil.l C_1 log d ceil.r$ levels. At each $0 lt.eq j < J$, it calls Theorem 2 with fresh seeds at $\( x_j \, r_j \)$ to produce a noised observation $Y_j$, and sets

$ x_(j + 1) = x_j + r_j Y_j \/ 2 \, #h(2em) r_(j + 1) = r_j \/ sqrt(2) . $

At level $J$, it produces a base sample $Z_J$ by the Gaussian rule given below and returns

$ y + sqrt(h) thin \( x_J + r_J Z_J \) . $

To identify this output, define the backwards variables $Z_j = Y_j \/ 2 + Z_(j + 1) \/ sqrt(2)$ for the analysis. The center update gives

$ x_j + r_j Z_j = x_j + r_j Y_j \/ 2 + \( r_j \/ sqrt(2) \) Z_(j + 1) = x_(j + 1) + r_(j + 1) Z_(j + 1) . $

Since $x_0 = 0$ and $r_0 = 1$, the returned point is therefore $y + sqrt(h) thin Z_0$. By (8.5), ideal observations and an exact base conditional sample would make this an exact draw from $kappa_y$.

We must control the errors at random centers. The useful moment bound concerns the history in which all preceding observations have their ideal laws.

#thm([Lemma 8.3.])[
  (Moments along the ideal descent).  #emph[If $y tilde.op tilde(pi)$ and every conditioning observation preceding level $j$ is ideal, then 
$ b_j := (bb(E) \| g_y \( x_j \) \|^2)^(1 \/ 2) lt.eq C sqrt(d) #h(2em) \( 0 lt.eq j lt.eq J \) \, $

 with an absolute $C$ for all sufficiently large $d$.]
] <lem:descent-moments>

#proof[
  The initial estimate follows from $\| g_y \( 0 \) \| lt.eq 2 sqrt(h) thin \| y \|$ and the moment bound for $tilde(pi)$. Conditional on an ideal history, the next observation has the law of $Z + N$ at center $x_j$ and scale $r_j = 2^(- j \/ 2)$. Equation (2.6) therefore gives
  $ (bb(E) \[ \| Y_j \|^2 divides x_j \, y \])^(1 \/ 2) lt.eq C \( sqrt(d) + r_j \| g_y \( x_j \) \| \) . $
  The center update and $"Lip" \( g_y \) lt.eq delta$ imply, by the conditional and then unconditional $L^2$ triangle inequalities,
  $ b_(j + 1) lt.eq \( 1 + C delta r_j^2 \) b_j + C delta r_j sqrt(d) . $
  Both $sum_(j gt.eq 0) r_j$ and $sum_(j gt.eq 0) r_j^2$ are bounded by absolute constants. In particular the products of $1 + C delta r_j^2$ are bounded by $exp \( C delta sum_j r_j^2 \)$. Expanding the recurrence proves the stated uniform bound. ◻
]

Here is the precise replacement order used to sum the TV errors. For $0 lt.eq j lt.eq J$, let $H_j$ be the output law when the first $j$ observations are ideal, all later observations use the actual primitive, and the base rule is the actual Gaussian rule. For $0 lt.eq j < J$, the laws $H_j$ and $H_(j + 1)$ have the same ideal prefix of length $j$. Conditional on that prefix, only the next observation kernel changes; all subsequent computation is the same probability kernel. Data processing and the mixture TV bound therefore give

$ lr(bar.v.double H_j - H_(j + 1) bar.v.double)_(upright("TV")) lt.eq B_d delta^(K_0) bb(E)_(upright("ideal")) #scale(x: 120%, y: 120%)[\[] sqrt(d) + \| g_y \( x_j \) \| #scale(x: 120%, y: 120%)[\]] . $

The expectation includes $y tilde.op tilde(pi)$ and the common ideal prefix. Lemma 34 now yields

#[#set math.equation(numbering: n => "(8.6)")
 $ lr(bar.v.double H_0 - H_J bar.v.double)_(upright("TV")) lt.eq C J B_d delta^(K_0) sqrt(d) = o \( 1 \) . $ <eq:descent-tv>]

Thus errors are summed using only ideal-history moments. It remains to compare the actual and exact base laws under that same ideal history.

=== 8.3 The Gaussian base rule <the-gaussian-base-rule>

At depth $J$, write $l = delta r_J^2$ and start at $z^(\( 0 \)) = 0$. Make exactly $m_0 = ceil.l C_2 log d ceil.r$ gradient iterations

#[#set math.equation(numbering: n => "(8.7)")
 $ z^(\( k + 1 \)) = - r_J g_y \( x_J + r_J z^(\( k \)) \) \, #h(2em) 0 lt.eq k < m_0 . $ <eq:mode-iteration>]

The base output is $Z_J = z^(\( m_0 \)) + G$, for a fresh standard Gaussian $G$. The iteration map has Lipschitz constant at most $l$. Its unique fixed point is the mode $z_0$ of $nu_(x_J \, r_J)$, and (2.6) gives

#[#set math.equation(numbering: n => "(8.8)")
 $ \| z^(\( m_0 \)) - z_0 \| lt.eq l^(m_0) \| z_0 \| lt.eq l^(m_0) frac(r_J \| g_y \( x_J \) \|, 1 - l) . $ <eq:mode-accuracy>]

The following comparison explains why a Gaussian centered there completes the construction.

#thm([Lemma 8.4.])[
  (Mode-centered Gaussian approximation).  #emph[For any $F in C^2 \( bb(R)^d \)$ with $"Lip" \( nabla F \) lt.eq lambda$, center $x$, and scale $0 < r lt.eq 1$ such that $l = lambda r^2 lt.eq 1 \/ 2$, let $z_0$ be the mode of $nu_(x \, r)$. Then 
$ lr(bar.v.double nu_(x \, r) - N \( z_0 \, I_d \) bar.v.double)_(upright("TV")) lt.eq C l sqrt(d) . $

]
] <lem:mode-gaussian>

#proof[
  Translate by $z_0$. Up to an additive constant, the potential of $w = z - z_0$ is $\| w \|^2 \/ 2 + J \( w \)$, where
  $ J \( w \) = z_0 dot.op w + F \( x + r \( z_0 + w \) \) - F \( x + r z_0 \) . $
  The mode equation gives $nabla J \( 0 \) = 0$, and $"Lip" \( nabla J \) lt.eq l$. In particular $J \( 0 \) = 0$ and $\| J \( w \) \| lt.eq l \| w \|^2 \/ 2$. For $0 lt.eq s lt.eq 1$, the potential $\| w \|^2 \/ 2 + s J \( w \)$ has mode zero and Hessian between $\( 1 - l \) I_d$ and $\( 1 + l \) I_d$. Its law $mu_s$ satisfies, by Lemma 3,
  $ "Var"_(mu_s) J lt.eq frac(1, 1 - l) bb(E)_(mu_s) \| nabla J \|^2 lt.eq frac(l^2, 1 - l) bb(E)_(mu_s) \| w \|^2 lt.eq frac(l^2 d, \( 1 - l \)^2) lt.eq 4 l^2 d . $
  The same quadratic bounds justify differentiating
  $ Phi \( s \) = log integral_(bb(R)^d) e^(- \| w \|^2 \/ 2 - s J \( w \)) thin d w $
  twice under the integral, and give $Phi'' \( s \) = "Var"_(mu_s) J$. Since $mu_0 = N \( 0 \, I_d \)$,
  $ "KL" \( mu_0 bar.v.double mu_1 \) = Phi \( 1 \) - Phi \( 0 \) - Phi' \( 0 \) = integral_0^1 \( 1 - s \) Phi'' \( s \) thin d s lt.eq 2 l^2 d . $
  Pinsker’s inequality, followed by translation back by $z_0$, proves the assertion. ◻
]

Under an ideal history, the Gaussian shift bound and (8.8) bound the expected TV error of the base rule by

#[#set math.equation(numbering: n => "(8.9)")
 $ C delta 2^(- J) sqrt(d) + C \( delta 2^(- J) \)^(m_0) frac(2^(- J \/ 2) sqrt(d), 1 - delta 2^(- J)) . $ <eq:descent-base-error>]

Here the second term uses Lemma 34. Choose the fixed $C_1$ large enough that $delta 2^(- J) sqrt(d) arrow.r 0$. A sufficiently large fixed $C_2$ makes the second term tend to zero as well. Replacing the base law under the ideal history therefore changes TV by $o \( 1 \)$. By (8.5), the resulting completely ideal conditional algorithm returns $kappa_y$. Averaging over $y tilde.op tilde(pi)$ gives $pi_V$.

Combining this base comparison, (8.6), and the initial replacement of the incoming $y$ proves

#[#set math.equation(numbering: n => "(8.10)")
 $ lr(bar.v.double cal(L) \( X_(upright("out")) \) - pi_V bar.v.double)_(upright("TV")) = o \( 1 \) \, $ <eq:unnoised-output-error>]

uniformly over admissible $V$. The final Gaussian is used to approximate the last conditional law; the law in (8.10) is the original target without an additional convolution.

=== 8.4 Query counts and all dimensions <query-counts-and-all-dimensions>

#thm([Theorem 8.5.])[
  (Subpolynomial upper bound).  #emph[For every fixed $epsilon > 0$, there is $C_epsilon < oo$ such that, for every integer $d gt.eq 2$, a measurable algorithm using the exact value-and-gradient oracle makes at most $C_epsilon d^epsilon$ queries on every execution and returns a sample within TV distance $1 \/ 10$ of $pi_V$ for every $V$ satisfying (1.1). Thus 
$ Q \( d \) lt.eq C_epsilon d^epsilon #h(2em) \( d gt.eq 2 \) . $

]
] <thm:upper>

#proof[
  Given $epsilon > 0$, first choose $e in \( 0 \, 1 \)$ with $2 e < epsilon$, then an integer $K_0 > 2 + 1 \/ e$, and then $t > 0$ satisfying (2.3). Fix the auxiliary construction’s orders in its prescribed order, and finally the constants in the chain, descent depth, and base iteration count. These choices may depend on $epsilon$, but they are fixed before observing the oracle or the random seeds.
  Every invocation of Theorem 2 uses at most $"polylog" \( d \) delta^(- t)$ evaluations of the gradient oracle $g_y$. By (8.2), each evaluation is one original query, including calls at random descent centers. The cap is uniform in those centers. There are $O \( delta^(- 1) log d \)$ proximal calls, $O \( log d \)$ descent calls, and $O \( log d \)$ additional gradient queries in the base rule. Summing gives the deterministic cap
  #[#set math.equation(numbering: n => "(8.11)")
   $ "polylog" \( d \) delta^(- \( 1 + t \)) = d^(e \( 1 + t \) + o \( 1 \)) . $ <eq:upper-query-count>]
  The query counts and recursion shapes of this construction are fixed by the scalar parameters; they do not depend on oracle magnitudes or approximation events. All maps are measurable by the primitive theorem and the explicit finite operations above. Since $t < 1$, we have $e \( 1 + t \) < 2 e < epsilon$. The fixed polylogarithmic factors fit $C_epsilon d^epsilon$ for all sufficiently large $d$. Equation (8.10) gives TV error at most $1 \/ 10$ above a uniform dimension threshold.
  For each of the finitely many smaller dimensions, use independent standard Gaussian proposals. Accept a proposal $X$ with probability
  $ exp #scale(x: 120%, y: 120%)[\(] - V \( X \) + \| X \|^2 \/ 2 #scale(x: 120%, y: 120%)[\)] . $
  Integrating the Hessian bounds from the known minimizer gives $\| x \|^2 \/ 2 lt.eq V \( x \) lt.eq \| x \|^2$. The acceptance probability is therefore at most one, and its average is at least $bb(E) e^(- \| X \|^2 \/ 2) = 2^(- d \/ 2)$. The proposal density times its acceptance probability is proportional to $e^(- V \( x \))$, so an accepted proposal has law $pi_V$.
  Cap the number of trials at $ceil.l 4 dot.op 2^(d \/ 2) ceil.r$. Return the first accepted proposal, or zero if none is accepted. The failure probability is at most $e^(- 4) < 1 \/ 10$; conditional on success, the returned proposal has law $pi_V$. The fallback thus has TV error at most $e^(- 4)$ and makes at most the prescribed number of original first-order queries on every execution, one per trial. Increasing $C_epsilon$ covers these finitely many caps. This proves the assertion for all $d gt.eq 2$. ◻
]

Theorem 36 proves the upper assertion of Theorem 1. Its approximation orders depend on the fixed exponent $epsilon$; the result concerns oracle calls and imposes no bound on the real computation between them. The next section proves the independent logarithmic lower bound.

== 9 A logarithmic oracle lower bound <sec:lower>

The lower bound already holds for centered Gaussian targets, whose minimizer is known. The obstruction is therefore present in the same oracle model as the upper bound. We adapt the Gaussian block-Krylov strategy of #cite(label("chewi2023lower"), form: "prose") Section 5.3.3, Lemma 39 and Theorem 45, which already yields logarithmic dependence on dimension at fixed condition number. We give a complete argument for the spectral interval $\[ 1 \, 2 \]$ and total-variation accuracy $1 \/ 10$ used here, covering arbitrary measurable adaptive algorithms and unrestricted real computation.

#thm([Theorem 9.1.])[
  #emph[There are absolute constants $c > 0$ and $d_0$ such that $Q \( d \) gt.eq c log d$ for every $d gt.eq d_0$. This bound holds even when the inputs are restricted to potentials $V \( x \) = x^T A x \/ 2$ with $I prec.curly.eq A prec.curly.eq 2 I$. The query cap is imposed on every execution, and the algorithm may use arbitrary private randomness independent of its input.]
] <thm:lower>

For these potentials the gradient reply is $A x$, and the value $x^T A x \/ 2$ is already determined by the query and its gradient reply. Thus an exact value-and-gradient query is equivalent to one query to $x mapsto A x$. Each potential belongs to $cal(V)_d$, has minimizer $0$, and has target $N \( 0 \, A^(- 1) \)$.

The proof has three steps. First, deferred revelation of a random rotation represents any output in a Gaussian block-Krylov span, including outputs outside the span of the actual queries and replies. Second, a cosine statistic is small uniformly on this enlarged random span. Finally, the same statistic has a large bias under the target Gaussian, which separates the two joint experiments in total variation. These steps use no result from the sampling upper bound.

=== 9.1 Adaptive queries and unrevealed rotations <adaptive-queries-and-unrevealed-rotations>

We first record a representation of an arbitrary algorithm’s output. The auxiliary Gaussian vectors in this representation are independent of one another, but need not be independent of the input matrix.

#thm([Lemma 9.2.])[
  (Deferred rotation).  #emph[Let $Lambda$ be a fixed real diagonal $d times d$ matrix, let $O$ be Haar distributed on the orthogonal group, and set $A = O Lambda O^T$. Consider any measurable randomized algorithm, with private randomness independent of $O$, making at most $q$ adaptive queries to the map $x mapsto A x$, where $2 q + 1 < d$, and producing an output $X in bb(R)^d$. There is an extension of this experiment carrying independent standard Gaussian vectors $g_1 \, dots.h \, g_(q + 1) in bb(R)^d$ such that 
#[#set math.equation(numbering: n => "(9.1)")
 $ O^T X in "span" { Lambda^j g_i : 1 lt.eq i lt.eq q + 1 \, med 0 lt.eq j lt.eq q } #h(2em) upright("almost surely") . $ <eq:krylov-span>]

 The joint law of the original variables, including the algorithm’s randomness and $O$, is unchanged. The vectors $g_i$ need not be independent of $O$ or of $A$.]
] <lem:deferred-haar>

#proof[
  Include all the algorithm’s randomness, including any randomness used at output, in a private seed independent of $O$. Fix this seed for the moment. Pad executions with zero queries so that there are exactly $q$ query slots.
  We use the following conditional property of Haar measure. For a fixed restriction $T : E arrow.r W$ of an orthogonal map, the conditional law of its remaining restriction is uniform among isometries from $E^perp$ to $W^perp$. For a specified unit vector in either complement, its partner is uniform on the unit sphere of the other complement. After revealing that pair, the map between the smaller complements is again uniform. This follows from invariance under the orthogonal transformations fixing $E$ and $W$ pointwise. Applying this rule successively also permits each specified direction to be a measurable function of the already revealed data.
  All conditional laws below are laws of finite-dimensional data after the seed has been fixed. To represent the subspaces and partial isometries measurably, apply Gram–Schmidt to the revealed vectors in their order of appearance, discard zero residuals, and complete a basis by scanning the standard coordinate vectors in order. These operations are Borel on each rank stratum. Thus regular conditional laws and the successive Gaussian draws can be chosen as measurable kernels; no continuity of the algorithm’s query maps is required.
  Initially $E = W = { 0 }$. After each reply, reveal the restriction $T = O \|_E$, where $E$ is the span of the eigenframe coordinates of all queries and replies so far, and $W = O E$ is their span in the original coordinates. Our conditional invariant is that the unrevealed map is Haar on the two complements, given the full latent history: the seed, the transcript, this restriction, and all auxiliary variables constructed so far.
  Let $x$ be the next query, which is fixed given that history. Write $x = x_W + x_perp$ according to $W xor W^perp$. The preimage of $x_W$ is known. If $x_perp eq.not 0$, put
  $ w = frac(x_perp, \| x_perp \|) \, #h(2em) v = O^T w in E^perp . $
  Conditionally on the history, $v$ is uniform on the complementary unit sphere. Let $h$ be a standard Gaussian vector in $E$, and let $a$ have the distribution of the Euclidean norm of a standard Gaussian in $bb(R)^(d - dim E)$. Draw $h$ and $a$ independently of one another and of the unrevealed map, conditional on the history, and define
  $ g_i = h + a v . $
  The Gaussian polar decomposition shows that $g_i$ is a standard Gaussian in $bb(R)^d$ conditional on the entire previous history. Moreover, $a > 0$ almost surely, so $v = \( g_i - h \) \/ a in E + "span" { g_i }$. Reveal $O v = w$ and extend $T$ to $E + "span" { v }$. Conditioning on the full vector $g_i$ does not reveal any further part of $O$: its parallel component $h$ and complementary radius $a$ are independent auxiliary variables, and its normalized complementary component is precisely $v$. Thus the conditional Haar invariant persists. If $x_perp = 0$, instead draw a fresh independent standard Gaussian $g_i$ and make no extension at this step.
  In either case the query preimage $u = O^T x$ is now known and lies in the old space $E + "span" { g_i }$. Its reply has preimage $Lambda u$. Project $Lambda u$ onto the enlarged eigenframe space. The image of this projection is known. If the residual is nonzero, reveal the image under $O$ of its unit direction and extend the isometry once more. This is the other form of the same Haar-revelation rule: the direction in the eigenframe is fixed by the current history, and its image is uniform in the unrevealed complementary sphere. The resulting reply is exactly $A x$, and the conditional invariant is preserved.
  Every $g_i$ has conditional law $N \( 0 \, I_d \)$ given all earlier Gaussian vectors and the earlier history. Consequently these vectors are independent. To check the polynomial degrees, let $E_i$ be the revealed eigenframe space after reply $i$. Induction gives
  $ E_i subset.eq "span" { Lambda^j g_a : 1 lt.eq a lt.eq i \, med 0 lt.eq j lt.eq i } . $
  Indeed, the new query preimage is in $E_(i - 1) + "span" { g_i }$, and adjoining its reply applies $Lambda$ once. All old directions remain in the indicated larger span.
  Finally treat the algorithm’s output as one more query direction, with no reply: repeat the preimage construction using $g_(q + 1)$. This gives $O^T X in E_q + "span" { g_(q + 1) }$, proving (9.1). At most two dimensions were exposed per oracle query and one for the output, so the assumed dimension inequality ensures that every required complement is available. The construction started with the genuine Haar input and never altered it. Its added variables are obtained by measurable kernels from the original variables and independent auxiliary draws. The construction therefore applies jointly measurably for the fixed-seed algorithms; integrating over the original independent seed proves the assertion for randomized algorithms. ◻
]

=== 9.2 A statistic invisible on the block span <a-statistic-invisible-on-the-block-span>

For the rest of the section define

#[#set math.equation(numbering: n => "(9.2)")
 $ theta_k = frac(\( k - 1 \/ 2 \) pi, d) \, #h(2em) lambda_k = frac(3 + cos theta_k, 2) \, #h(2em) Lambda = "diag" \( lambda_1 \, dots.h \, lambda_d \) \, quad 1 lt.eq k lt.eq d . $ <eq:lower-spectrum>]

All eigenvalues lie strictly between $1$ and $2$. For an integer $q gt.eq 0$ put

$ n = 2 q + 1 \, #h(2em) p_k = cos \( n theta_k \) \, #h(2em) D_p = "diag" \( p_1 \, dots.h \, p_d \) . $

The frequency $n$ exceeds twice the polynomial degree in (9.1). This makes the quadratic form $u^T D_p u$ small simultaneously for all vectors in that random span.

#thm([Lemma 9.3.])[
  #emph[Suppose $4 q + 1 < 2 d$, and let $g_1 \, dots.h \, g_(q + 1)$ be independent standard Gaussian vectors. Set 
$ cal(K)_q = "span" { Lambda^j g_i : 1 lt.eq i lt.eq q + 1 \, med 0 lt.eq j lt.eq q } \, #h(2em) tau_d = frac(40 \( q + 1 \)^2, sqrt(d)) . $

 If $tau_d lt.eq 1 \/ 2$, then, with probability at least $0.99$, 
#[#set math.equation(numbering: n => "(9.3)")
 $ \| u^T D_p u \| lt.eq 2 tau_d \| u \|^2 #h(2em) upright("for every ") u in cal(K)_q . $ <eq:lower-uniform-statistic>]

]
] <lem:lower-span-statistic>

#proof[
  Let $m = \( q + 1 \)^2$ and form a $d times m$ matrix $B$, whose columns are indexed by $\( i \, j \)$ with $1 lt.eq i lt.eq q + 1$ and $0 lt.eq j lt.eq q$, by
  $ B_(k \, i j) = d^(- 1 \/ 2) \( g_i \)_k c_j cos \( j theta_k \) \, #h(2em) c_0 = 1 \, quad c_j = sqrt(2) quad \( j gt.eq 1 \) . $
  The functions $cos \( j theta \)$ are degree-$j$ polynomials in $cos theta$ with nonzero leading coefficients. Since $cos theta_k = 2 lambda_k - 3$, the range of $B$ is precisely $cal(K)_q$.
  Discrete cosine orthogonality gives
  #[#set math.equation(numbering: n => "(9.4)")
   $ bb(E) B^T B = I_m \, #h(2em) bb(E) B^T D_p B = 0 . $ <eq:lower-gram-means>]
  For completeness, the equally spaced half-grid satisfies
  #[#set math.equation(numbering: n => "(9.5)")
   $ sum_(k = 1)^d cos \( ell theta_k \) = frac(sin \( ell pi \), 2 sin \( ell pi \/ \( 2 d \) \)) = 0 \, #h(2em) 1 lt.eq ell < 2 d \, quad ell in bb(Z) . $ <eq:lower-cosine-sum>]
  Here the finite cosine sum follows by summing a geometric progression, and its denominator is nonzero in the indicated range. Expand products of two cosines for the first identity in (9.4). For the second, expand the product of three cosines with frequencies $n \, j \, j'$. Its frequencies are nonzero because $n > j + j'$, and have absolute value at most $4 q + 1 < 2 d$. Different Gaussian blocks have zero cross means in both cases.
  An entry of either Gram matrix is a sum of independent row terms. The deterministic coefficient in each term has absolute value at most $2 \/ d$, and the variance of a product of two standard Gaussian entries is at most $2$. Thus every entry has variance at most $8 \/ d$, and
  $ bb(E) #scale(x: 120%, y: 120%)[\[] parallel B^T B - I_m parallel_(upright(F))^2 + parallel B^T D_p B parallel_(upright(F))^2 #scale(x: 120%, y: 120%)[\]] lt.eq frac(16 m^2, d) . $
  By Markov’s inequality,
  $ bb(P) #h(-0.16667em) (parallel B^T B - I_m parallel_(upright(F))^2 + parallel B^T D_p B parallel_(upright(F))^2 > tau_d^2) lt.eq frac(16 m^2 \/ d, 1600 m^2 \/ d) = 0.01 . $
  Since $parallel C parallel_(upright("op")) lt.eq parallel C parallel_(upright(F))$, outside this event both operator norms are at most $40 m \/ sqrt(d) = tau_d$. Whenever these bounds hold, for every $a in bb(R)^m$,
  $ \| B a \|^2 gt.eq \( 1 - tau_d \) \| a \|^2 gt.eq 1 / 2 \| a \|^2 \, #h(2em) \| \( B a \)^T D_p \( B a \) \| lt.eq tau_d \| a \|^2 . $
  These inequalities imply (9.3) on the entire range of $B$. ◻
]

The uniformity in this lemma is essential: the output’s coefficients in the block span can depend arbitrarily on the whole transcript. No independence between these coefficients, the input rotation, and the Gaussian vectors is required.

=== 9.3 Separation from the target Gaussian <separation-from-the-target-gaussian>

An ideal target has a detectable bias at the same frequency. Write

$ 𝜚 = 3 - sqrt(8) in \( 0 \, 1 \) . $

The geometric-series formula gives the absolutely convergent identity

#[#set math.equation(numbering: n => "(9.6)")
 $ frac(2, 3 + cos theta) = 1 / sqrt(2) (1 + 2 sum_(j gt.eq 1) \( - 𝜚 \)^j cos \( j theta \)) . $ <eq:lower-fourier>]

Indeed, the series in parentheses sums to $\( 1 - 𝜚^2 \) \/ \( 1 + 2 𝜚 cos theta + 𝜚^2 \)$, and $1 + 𝜚^2 = 6 𝜚$ and $1 - 𝜚^2 = 4 sqrt(2) thin 𝜚$.

#thm([Lemma 9.4.])[
  #emph[Let $U tilde.op N \( 0 \, Lambda^(- 1) \)$, with $Lambda$ from (9.2), and suppose $n = 2 q + 1 < d$. Then 
#[#set math.equation(numbering: n => "(9.7)")
 $ mu_(d \, q) := bb(E) \[ U^T D_p U \] & = d / sqrt(2) \( - 𝜚 \)^n + R_(d \, q) \, & \| R_(d \, q) \| & lt.eq frac(sqrt(2) thin d thin 𝜚^(2 d - n), 1 - 𝜚) \,\
"Var" \( U^T D_p U \) & lt.eq 2 d \, & bb(E) \| U \|^2 & lt.eq d \, #h(2em) "Var" \( \| U \|^2 \) lt.eq 2 d . $ <eq:lower-target-mean>]

]
] <lem:lower-target-statistic>

#proof[
  Independence of the coordinates gives $mu_(d \, q) = sum_k p_k \/ lambda_k$. Substitute (9.6). The constant term vanishes by (9.5). For $1 lt.eq j < 2 d - n$, use
  $ cos \( n theta_k \) cos \( j theta_k \) = 1 / 2 cos \( \( n - j \) theta_k \) + 1 / 2 cos \( \( n + j \) theta_k \) . $
  If $j eq.not n$, both frequencies have nonzero absolute value below $2 d$, so their sums vanish. If $j = n$, the constant term contributes $d \/ 2$ and the frequency $2 n < 2 d$ contributes zero. Thus only $j = n$ contributes in this range. Each remaining cosine product has absolute sum at most $d$, so summing the geometric tail proves (9.7). Finally, a centered normal variable with variance $v$ satisfies $"Var" \( U_k^2 \) = 2 v^2$. Since $\| p_k \| lt.eq 1$ and $lambda_k gt.eq 1$, summing these coordinate variances proves (9.7). ◻
]

#proof[
  Take $A = O Lambda O^T$ with $O$ Haar and $Lambda$ as in (9.2). The reduction at the start of the section identifies an exact value-and-gradient algorithm on $V_A \( x \) = x^T A x \/ 2$ with an algorithm querying $x mapsto A x$, with the same query cap and output law.
  Fix any algorithm using at most $q$ queries on every execution, where
  $ 0 lt.eq q lt.eq c_0 log d \, #h(2em) c_0 = frac(1, 16 log \( 1 \/ 𝜚 \)) . $
  All dimension restrictions in Lemmas 38, 39, and 40 hold for sufficiently large $d$, uniformly over these $q$. Let $bb(P)_(upright("alg"))$ be the joint law of the Haar rotation and the algorithm’s output on this input. Define the event on pairs $\( O \, x \)$
  #[#set math.equation(numbering: n => "(9.8)")
   $ cal(E)_(d \, q) = {\( O \, x \) : \| O^T x \|^2 lt.eq 2 d \, quad lr(|\( O^T x \)^T D_p \( O^T x \)|) > 160 \( q + 1 \)^2 sqrt(d)} . $ <eq:lower-separating-event>]
  This event is measurable. It is also determined by $\( A \, x \)$: if $T_n$ is the polynomial defined by $T_n \( cos theta \) = cos \( n theta \)$, then $O D_p O^T = T_n \( 2 A - 3 I \)$. We retain $O$ in the notation to use eigenframe coordinates throughout the comparison.
  Apply Lemma 38 to the algorithm’s output and then Lemma 39 to its auxiliary Gaussian vectors. On the latter lemma’s event, the norm condition in (9.8) forces the quadratic form to be at most $2 tau_d \( 2 d \) = 160 \( q + 1 \)^2 sqrt(d)$. Hence
  #[#set math.equation(numbering: n => "(9.9)")
   $ bb(P)_(upright("alg")) \( cal(E)_(d \, q) \) lt.eq 0.01 . $ <eq:lower-algorithm-event>]
  For the target joint law $bb(P)_(upright("target"))$, sample $O$ from the same prior and then $X$ from $N \( 0 \, O Lambda^(- 1) O^T \)$. Conditional on $O$, the vector $U = O^T X$ has law $N \( 0 \, Lambda^(- 1) \)$. Our choice of $c_0$ gives
  $ 𝜚^(2 q + 1) gt.eq 𝜚 d^(- 1 \/ 8) \, #h(2em) frac(d 𝜚^(2 q + 1), \( q + 1 \)^2 sqrt(d)) gt.eq frac(𝜚 d^(3 \/ 8), \( 1 + c_0 log d \)^2) arrow.r oo . $
  The remainder in (9.7) satisfies
  $ frac(\| R_(d \, q) \|, d 𝜚^n \/ sqrt(2)) lt.eq frac(2 𝜚^(2 d - 2 n), 1 - 𝜚) arrow.r 0 $
  uniformly, since $n lt.eq 1 + 2 c_0 log d$. Thus it is negligible relative to the leading term. In particular, with $T_(d \, q) = 160 \( q + 1 \)^2 sqrt(d)$, we have $\| mu_(d \, q) \| > T_(d \, q)$ for large $d$, and
  $ bb(P)_(upright("target")) \( cal(E)_(d \, q)^c \) lt.eq 2 / d + frac(2 d, \( \| mu_(d \, q) \| - T_(d \, q) \)^2) = o \( 1 \) $
  uniformly, by Lemma 40 and Chebyshev’s inequality. Thus the probabilities of $cal(E)_(d \, q)$ under the two joint experiments differ by at least $0.99 - o \( 1 \)$.
  To compare these joint laws with the required guarantee on each fixed input, let $K_O$ denote the algorithm’s output law on $A = O Lambda O^T$ and let $G_O = N \( 0 \, A^(- 1) \)$. For a measurable joint event $cal(E)$, write $cal(E)_O = { x : \( O \, x \) in cal(E) }$. Both laws use the same Haar prior, so
  $ lr(|bb(P)_(upright("alg")) \( cal(E) \) - bb(P)_(upright("target")) \( cal(E) \)|) & = lr(|integral #scale(x: 120%, y: 120%)[\[] K_O \( cal(E)_O \) - G_O \( cal(E)_O \) #scale(x: 120%, y: 120%)[\]] thin d "Haar" \( O \)|)\
 & lt.eq integral parallel K_O - G_O parallel_(upright("TV")) thin d "Haar" \( O \) . $
  The pointwise sampling guarantee would bound the last integral by $1 \/ 10$. The event used to disprove that guarantee is a test of the joint laws; the algorithm need not know or compute it. This is impossible for (9.8). Therefore no such algorithm with $q lt.eq c_0 log d$ can meet the required accuracy for all inputs. Decreasing the constant if necessary proves the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
