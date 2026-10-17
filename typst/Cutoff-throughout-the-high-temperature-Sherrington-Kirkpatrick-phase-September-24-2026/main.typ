#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Cutoff throughout the high-temperature \
Sherrington--Kirkpatrick phase]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

We prove worst-start total-variation cutoff for single-site heat-bath dynamics throughout the high-temperature phase of the zero-field Gaussian Sherrington–Kirkpatrick model. The cutoff location is determined by an equilibrium gradient operator constructed in this paper. The distinction between equilibrium relaxation and worst-start mixing is central: a positive spectral gap controls equilibrium fluctuations, but a cutoff theorem must also identify when an arbitrary initial configuration loses its remaining bias.

The Sherrington–Kirkpatrick model has random interactions of mixed signs #cite(label("SK1975")). These interactions make the required control of nonequilibrium trajectories delicate even at high temperature.

Functional inequalities have provided quantitative high-temperature control. The random-SK bounds in the following comparison hold with probability tending to one over the disorder, at each fixed temperature in the stated range. Bauerschmidt and Bodineau #cite(label("BB2019")) proved a uniform logarithmic Sobolev inequality for $beta < 1 \/ 4$ with an unweighted flip-gradient form. Eldan, Koehler, and Zeitouni #cite(label("EKZ2022")) obtained a heat-bath Poincaré inequality in that range. Anari, Jain, Koehler, Pham, and Vuong #cite(label("AJKPV2022")) obtained $O \( n log n \)$ mixing there, uniformly over external fields, through entropic independence. Adhikari, Brennecke, Xu, and Yau #cite(label("ABXY2024")) proved heat-bath gap estimates for mixed $p$-spin models at sufficiently high temperature. The localization framework of Chen and Eldan #cite(label("CE2025")) relates entropy contraction to covariance estimates along tilted measures. Anari, Koehler, and Vuong #cite(label("AKV2024")) extended $O \( n log n \)$ Glauber mixing to a threshold approximately $0.295$. Wang #cite(label("Wang2026")) proved $O_beta \( n log \( n \/ epsilon \) \)$ worst-start mixing for every fixed $beta < 1 \/ 2$, uniformly over external fields. These mixing times count single-site update attempts. Boban, Li, and Oveis Gharan #cite(label("BLO2026")) proved a positive unscaled heat-bath gap in zero field for $beta < 1 \/ 2 + epsilon_0$, with a universal $epsilon_0 gt.eq 5 dot.op 10^(- 5)$, yielding $O_beta \( n^2 \)$ single-site update attempts at fixed total-variation accuracy. These results do not identify a cutoff location.

The companion article #cite(label("SKGap")) proves a positive unscaled heat-bath gap for every fixed $beta < 1$ in the zero-field Gaussian model. We record the precise imports in 2 and prove the additional arbitrary-law mean, path, and gradient estimates needed for cutoff here. They identify the leading location through a deterministic equilibrium spectral construction. The resulting rate is implicit. The appendices give an independent proof of the cutoff ratio for $beta < 1 \/ 2$, with its own scalar certificate and auxiliary estimates uniform over external fields and interaction scalings. Those stronger auxiliary uniformities are confined to the restricted-temperature method.

=== 1.1 The result <the-result>

For $Omega_n = { - 1 \, 1 }^n$, let $J$ be symmetric with zero diagonal and independent $J_(i j) tilde.op N \( 0 \, beta^2 \/ n \)$ for $i < j$. The Gibbs law is

$ mu_J \( x \) = Z_J^(- 1) exp #h(-0.16667em) (1 / 2 x^(sans(T)) J x) . $

This normalization puts the equilibrium high-temperature boundary at $beta = 1$: the normalized mean pressure $n^(- 1) bb(E) log Z_J$ tends to $log 2 + beta^2 \/ 4$ for $beta < 1$ #cite(label("ALR1987")) Proposition 2.1. For $beta > 1$, Guerra’s variational bound #cite(label("Guerra2003")) gives a limit superior strictly smaller than $log 2 + beta^2 \/ 4$.

At each spin a rate-one clock replaces that spin by a sample from its conditional law under $mu_J$, given the other spins. Write $S_t$ for this transition kernel and $P$ for one uniformly chosen single-site refresh attempt; attempts that retain the old spin are included. At fixed disorder put

$ d_n \( t \) = max_x parallel S_t \( x \, dot.op \) - mu_J parallel_("TV") \, #h(2em) d_n^(upright("disc")) \( k \) = max_x parallel P^k \( x \, dot.op \) - mu_J parallel_("TV") \, $

where $parallel nu - mu parallel_("TV") = 1 / 2 sum_x \| nu \( x \) - mu \( x \) \|$. We abbreviate $mu_J$ to $mu$. Section 2 develops the half-difference and Dirichlet-form conventions used in the proof.

#thm([Theorem 1.1.])[
  #emph[For every fixed $0 lt.eq beta < 1$, there is a deterministic $lambda \( beta \) > 0$ such that, with 
$ t_n = frac(log n, 2 lambda \( beta \)) \, $

 for every $epsilon.alt in \( 0 \, 1 \)$, 
$ d_n \( \( 1 - epsilon.alt \) t_n \) & arrow.r 1 \, & d_n \( \( 1 + epsilon.alt \) t_n \) & arrow.r 0 \,\
d_n^(upright("disc")) \( floor.l \( 1 - epsilon.alt \) n t_n floor.r \) & arrow.r 1 \, & d_n^(upright("disc")) \( ceil.l \( 1 + epsilon.alt \) n t_n ceil.r \) & arrow.r 0 . $

 All convergences are in probability over the disorder. For $beta = 0$, $lambda \( 0 \) = 1$. For $0 < beta < 1$, $lambda \( beta \)$ is the equilibrium-operator constant defined in (8.6); it satisfies 
$ 0 < lambda \( beta \) lt.eq \( 1 - beta \)^2 . $

]
] <thm:main>

The theorem answers the high-temperature cutoff question in the zero-field Gaussian setting. The temperature is fixed before the dimension tends to infinity. We do not address a temperature approaching $1$ with $n$, external fields, or a cutoff window.

=== 1.2 The rate and the gradient mechanism <the-rate-and-the-gradient-mechanism>

A half-difference measures an observable’s sensitivity to one spin:

$ d_i f \( x \) = frac(f \( x^(i \, +) \) - f \( x^(i \, -) \), 2) \, #h(2em) d f = \( d_1 f \, dots.h \, d_n f \) \, $

where $x^(i \, plus.minus)$ is obtained from $x$ by fixing spin $i$ to $plus.minus 1$. We call a vector field of the form $d f$ an exact gradient. Differentiating heat flow gives a vector semigroup $K_t$ satisfying

$ d S_t f = K_t d f . $

Its finite-dimensional generator is derived in Section 4. Thus decay under $K_t$ controls how strongly a smoothed observable can still distinguish its starting configuration.

The scale relevant to total variation is visible in the elementary bound

$ max_x g \( x \) - min_x g \( x \) lt.eq 2 sqrt(n) thin sup_x parallel d g \( x \) parallel . $

For the upper bound, the proof makes the gradient of $S_t f$ smaller than $n^(- 1 \/ 2)$, uniformly for $\| f \| lt.eq 1$, by combining gradient propagation with a late-time energy bound. For the lower bound, it finds an observable with bounded fluctuations and a mean bias that decays at any rate just above $lambda$, from an initial size arbitrarily close to $sqrt(n)$ on a logarithmic scale. These two thresholds explain the location $log n \/ \( 2 lambda \)$.

Two equilibrium rates can govern this decay. First, start the chain in $mu$ and consider its normalized spin autocorrelation

$ C_n \( t \) = 1 / n bb(E)_mu \[ X_0^(sans(T)) X_t \] . $

Section 6 proves convergence to $C \( t \) = integral e^(- u t) rho \( thin upright(d) u \)$ for a deterministic positive probability measure $rho$. Its lower support edge is $lambda_(upright("sp")) = inf "supp" rho > 0$. This rate describes the slowest part detected by the limiting averaged spin correlation.

The second rate is obtained by retaining more equilibrium observables. A finite calculation starts with the spin vector and fixed independent site seeds, and uses multiplication by $J$, linear combinations, and smooth componentwise functions. For example, the local-field vector $J x$ and the conditional-mean vector $tanh \( J x \)$ are such calculations. After normalization by $n^(- 1 \/ 2)$, their limiting equilibrium overlaps define a deterministic Hilbert space of #emph[visible] vectors. A sequence of endpoint vectors is #emph[hidden] when its contractions with every fixed such calculation vanish in square mean. Section 5 constructs this space and its conditional path predictions.

For exact gradients, the natural equilibrium energy uses the conditional spin variances $v_i \( x \) = 1 - tanh^2 \( \( J x \)_i \)$:

$ parallel p parallel_v^2 = bb(E)_mu sum_i v_i p_i^2 . $

Section 8 constructs an invariant family of equilibrium test gradients from the finite calculations and completes it in this weighted norm. The resulting space $cal(X)_v$ contains every weighted-visible limit of exact gradients relevant to the proof. On it, the limiting $K_t$ is self-adjoint; write $cal(A)_v = - upright("gen") \( K \|_(cal(X)_v) \)$. This is a preview of the precise test-potential construction in Definition 47 and its saturation result. The rate is

$ lambda = min { lambda_(upright("sp")) \, inf "spec" \( cal(A)_v \) } \, #h(2em) 0 < lambda lt.eq lambda_(upright("sp")) lt.eq \( 1 - beta \)^2 . $

All these objects are constructed from equilibrium quantities at fixed times: dimension tends to infinity before any subsequent large-time or spectral-edge limit. If the second rate is smaller, the proof isolates a finite-dimensional family of slower observables and uses it for the lower bound. The formula does not identify $lambda$ with the upper bound $\( 1 - beta \)^2$.

=== 1.3 Main ideas <main-ideas>

The main difficulty is to make these equilibrium decay mechanisms control every starting configuration for logarithmically long times. The proof establishes fixed-time comparisons first, then makes a single sufficiently long block uniform before iterating it.

===== 1.3.1 Bringing arbitrary starts into the comparison regime. <bringing-arbitrary-starts-into-the-comparison-regime.>

We strengthen the stable-field residual argument underlying the companion gap theorem to control the mean under an arbitrary change of law. The change in mean is bounded by $C \( 1 + sqrt(D) \)$, where $D$ is the Dirichlet energy of the square-root density. Transport through a two-stage Gaussian observation then gives entropy control and the fixed-time heat-kernel estimate

$ 1 / n log ∥frac(S_d \( x \, dot.op \), mu)∥_oo lt.eq C e^(- c d^(2 \/ 3)) . $

Here $d$ is fixed before $n arrow.r oo$. Choosing a sufficiently long fixed burn-in makes this density cost small enough for exponentially reliable equilibrium comparisons to survive the changed law. The observation argument also supplies the posterior and cavity gaps used later; the zero-field gap alone would not supply them.

===== 1.3.2 Averaging the hidden part from both endpoints. <averaging-the-hidden-part-from-both-endpoints.>

The path expansion of $K_t$ involves products of $J$ and diagonal labels depending on observed spin states. We compare each label with its conditional prediction from the initial or terminal state. A conditional-covariance argument shows that terms containing both an initially centered label and a later terminally centered label vanish when tested against a hidden initial vector and an exact terminal gradient. This leaves strings predicted from their two endpoints, with at most one actual path label between them.

Two estimates make this averaging useful. A projected row likelihood has subexponential moments in the interval length, while the spin spectral measure supplies summable positive path weights at every rate below $lambda_(upright("sp"))$. Their combination proves hidden-gradient decay at that edge. To justify the covariance cancellation for multitime labels, we propagate mixed differences through conditional evolution and copied observation states. The resulting directed networks retain the derivative continuing to the terminal gradient. This is the role of the derivative machinery in Sections 4 and 5. Its operator estimates also retain rare coordinate types, whose small spatial frequency need not make their operator action small.

===== 1.3.3 Recovering the visible exact part. <recovering-the-visible-exact-part.>

Projecting a nonstationary gradient onto the visible calculations gives random scalar coefficients. Transport acts on the deterministic vector directions by $K_t$ and on these coefficients by conditional expectation. The projection does not immediately preserve the identities that characterize a gradient. Reverse entropy estimates and strong control of weighted curl restore those identities; a second observation argument then bounds the distance to actual gradients. This places the visible projection in $cal(X)_v$ without differentiating its possibly irregular coefficients. The hidden bound further shows that any visible spectrum below $lambda_(upright("sp"))$ consists of isolated modes of finite multiplicity.

===== 1.3.4 From a fixed block to the two cutoff bounds. <from-a-fixed-block-to-the-two-cutoff-bounds.>

The hidden and visible estimates give contraction on one long fixed block. Strict contraction slack and normalization make this bound uniform over all starts and tests, with an inverse-polynomial additive error; iteration therefore reaches logarithmic times without assuming a quantitative rate for a fixed-time limit. A late-time martingale-energy estimate completes the upper bound. For the lower bound, spin correlation provides the distinguishing observable when $lambda = lambda_(upright("sp"))$. If a slower visible mode determines $lambda$, an additional block estimate aligns both the mean and fluctuations of its random coefficient. A small perturbation of the initial law then creates a detectable slow bias, and convexity selects a deterministic starting configuration with at least the same separation from equilibrium.

=== 1.4 Organization and dependencies <organization-and-dependencies>

Section 2 fixes the normalizations and companion inputs, and states the finite-chain concentration and clock estimates. Section 3 proves the arbitrary-law and observation bounds. Sections 4 and 5 develop the gradient evolution, conditional derivatives, and Gaussian path calculus. Section 6 treats the projected row likelihood and the spin spectral measure; Section 7 uses them to prove hidden propagation. Section 8 constructs the visible exact operator and isolates its slower spectrum. Section 9 assembles the uniform blocks and proves cutoff for both clocks. Appendices 10–17 give the independent restricted-temperature argument and its scalar certificate. Appendix 18 proves the common clock lemma. Figure 1 records the principal dependencies.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.644cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Observation and entropy \(3\)#linebreak()Density and posterior control]]])])
  content((6.944, 0), [#box(width: 5.644cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite-time Gaussian calculus#linebreak()\(4--5\)#linebreak()Conditional predictors#linebreak()and matrix words]]])])
  content((0, -2.296), [#box(width: 5.644cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Projected row moments \(6\)#linebreak()Spin spectral edge $lambda_( upright(s) p)$]]])])
  content((6.944, -2.639), [#box(width: 5.644cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Weighted gradient exactness \(8\)#linebreak()The visible sector $cal(X)_v$]]])])
  content((0, -4.607), [#box(width: 5.644cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Two-ended path averaging \(7\)#linebreak()Hidden decay at $lambda_( upright(s) p)$]]])])
  content((6.944, -4.929), [#box(width: 5.644cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Spectral isolation \(8\)#linebreak()Slower visible eigenmodes]]])])
  content((3.472, -7.357), [#box(width: 8.494cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Uniform fixed-block estimates \(9\)#linebreak()Upper cutoff and the two spectral lower bounds]]])])
  line((0, -0.5908), (0, -1.691), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((4.122, -0.9332), (1.831, -1.691), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((6.944, -0.9392), (6.944, -2.039), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((1.555, -0.5908), (5.366, -2.039), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((0, -2.902), (0, -4.002), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((6.944, -3.239), (6.944, -4.339), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((2.822, -4.738), (4.122, -4.798), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((0.7643, -5.212), (2.726, -6.766), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
  line((6.099, -5.52), (4.317, -6.766), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: rgb("#595959"))))
})],
  caption: [Figure 1: The principal estimates and their use in the cutoff proof. All limiting comparisons precede the iteration over logarithmically many fixed-time blocks. The stationary gap is an input; the reweighting, averaging, and exactness arguments are proved here. ],
) <fig:proof-dependencies>

== 2 The model, normalization, and imported estimates <sec:model>

We first fix the relation between the two update clocks, the discrete half-differences, and the heat-bath Dirichlet form. We then state the fixed-temperature gap that the proof imports and the two finite-chain estimates used to control fluctuations and change clocks. We prove the jump-moment estimate here and the longer clock comparison in Appendix 18. Both estimates use their stated finite-chain hypotheses and have no high-temperature restriction.

=== 2.1 Two clocks and the Dirichlet form <two-clocks-and-the-dirichlet-form>

Let $Omega_n = { - 1 \, 1 }^n$. Independently for $i < j$, choose $J_(i j) tilde.op N \( 0 \, beta^2 \/ n \)$, set $J_(j i) = J_(i j)$ and $J_(i i) = 0$, and put

$ mu_J \( x \) = Z_J^(- 1) exp #h(-0.16667em) (1 / 2 x^(sans(T)) J x) . $

The inverse temperature $beta$ is fixed as $n$ tends to infinity. We suppress $J$ from $mu$ and the transition kernels when this does not cause confusion. For $x in Omega_n$, write $x^i$ for the configuration with spin $i$ reversed, and write $x^(i \, +)$ and $x^(i \, -)$ for the configurations obtained by fixing that spin to $+ 1$ and $- 1$, respectively. Define the half-difference

$ d_i f \( x \) = frac(f \( x^(i \, +) \) - f \( x^(i \, -) \), 2) . $

This derivative is independent of $x_i$. Writing the conditional mean, conditional variance, and twice the flip rate as

$ m_i \( x \) = tanh \( \( J x \)_i \) \, #h(2em) v_i \( x \) = 1 - m_i \( x \)^2 \, #h(2em) w_i \( x \) = 1 - x_i m_i \( x \) \, $

the generator with one refresh attempt per spin per unit time is

#[#set math.equation(numbering: n => "(2.1)")
 $ L f \( x \) = sum_(i = 1)^n \( m_i \( x \) - x_i \) d_i f \( x \) = sum_(i = 1)^n frac(w_i \( x \), 2) #scale(x: 120%, y: 120%)[\(] f \( x^i \) - f \( x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:model-generator>]

Its semigroup is $S_t = e^(t L)$. The kernel $P$ of one uniformly chosen single-site refresh attempt therefore satisfies $L = n \( P - I \)$. Both clocks include attempts which leave the configuration unchanged.

We define the unscaled form for any full-support law $Q$ on the cube by conditional covariance:

$ cal(E)_Q \( f \, g \) = sum_i bb(E)_Q "Cov"_Q \( f \, g divides X_(- i) \) \, #h(2em) cal(E)_Q \( f \) = cal(E)_Q \( f \, f \) . $

When $Q$ is a Gibbs law with the above interaction and an external field, let $v_i$ denote the conditional variance for that law. Then

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(E)_Q \( f \, g \) = bb(E)_Q sum_i v_i thin d_i f thin d_i g . $ <eq:model-dirichlet>]

In particular,

$ - bb(E)_mu \[ f L g \] = cal(E)_mu \( f \, g \) \, #h(2em) bb(E)_mu \[ w_i divides X_(- i) \] = v_i \, #h(2em) bb(E)_mu \[ w_i^2 divides X_(- i) \] = v_i . $

The last two identities follow by conditioning on $X_(- i)$ and averaging a sign with mean $m_i$. They explain the two weights: $w_i$ occurs in the jump rates and hence in pointwise quadratic variation, while conditioning converts the stationary energy to the $v_i$-weighted form. We will make this conversion only inside the corresponding stationary expectation.

Differentiating the generator later will require the exact product rule, including its quadratic correction, and the commutation identities

#[#set math.equation(numbering: n => "(2.3)")
 $ d_i \( f g \) & = f thin d_i g + g thin d_i f - 2 x_i thin d_i f thin d_i g \,\
d_i d_j f & = d_j d_i f \, #h(2em) d_i^2 f = 0 . $ <eq:model-product>]

The zero-field symmetry gives $bb(E)_mu X = 0$, which will fix the centering of equilibrium spin observables. All vector norms are unnormalized Euclidean norms. Matrix norms are operator or Hilbert–Schmidt norms unless a normalized trace $n^(- 1) "Tr"$ is written explicitly. We use $D_a = "diag" \( a_1 \, dots.h \, a_n \)$.

For a probability density $g$ relative to $Q$, write

$ "Ent"_Q \( g \) = bb(E)_Q \[ g log g \] \, #h(2em) bb(E)_Q g = 1 . $

For an arbitrary nonnegative $g$, the homogeneous convention is $"Ent"_Q \( g \) = bb(E)_Q \[ g log \( g \/ bb(E)_Q g \) \]$. Total variation is

$ ∥nu - mu∥_("TV") = 1 / 2 sum_(x in Omega_n) lr(|nu \( x \) - mu \( x \)|) . $

Set

$ d_n \( t \) = max_(x in Omega_n) ∥S_t \( x \, dot.op \) - mu∥_("TV") \, #h(2em) d_n^(upright("disc")) \( k \) = max_(x in Omega_n) ∥P^k \( x \, dot.op \) - mu∥_("TV") . $

Probabilities without a chain subscript refer to the disorder when the event is a statement about $J$; conditional path probabilities are always taken with $J$ fixed.

=== 2.2 The spectral-gap input <the-spectral-gap-input>

The equilibrium input is an all-functions Poincaré inequality at a fixed subcritical temperature. Its form is the unscaled form just defined, so its constant controls rate-one-per-site dynamics.

#thm([Theorem 2.1.])[
  (High-temperature gap #cite(label("SKGap")) Theorem 1.1).  #emph[For every fixed $0 < beta < 1$, there is $gamma_beta > 0$ such that, with probability tending to one over $J$, 
$ "Var"_mu \( f \) lt.eq gamma_beta^(- 1) cal(E)_mu \( f \) quad upright("for every real function ") f upright(" on ") Omega_n . $

]
] <thm:input-gap>

The reference proves this for zero field and Gaussian off-diagonal variance $beta^2 \/ n$, with $cal(E)_mu = sum_i bb(E)_mu "Var" \( thin dot.op thin divides X_(- i) \)$. Its discrete-time gap is consequently the unscaled gap divided by $n$. The same companion supplies deterministic Gaussian-matrix diagnostics and stable-field residual estimates. Section 3 states those hypotheses before using them. The arbitrary-law mean estimate in 6 and the simultaneous posterior and cavity gaps in 7 require additional arguments, which we supply there. In particular, 2 is a zero-field statement and does not supply a uniform gap at arbitrary external fields.

For any fixed collection of comparisons, intersect the gap event with the finitely many matrix-diagnostic events those comparisons require. On the resulting good-disorder event a fixed operator bound $∥∥ J lt.eq C_beta$ also holds. It implies

#[#set math.equation(numbering: n => "(2.4)")
 $ min_(x in Omega_n) mu \( x \) gt.eq exp #scale(x: 120%, y: 120%)[\(] - \( log 2 + C_beta \) n #scale(x: 120%, y: 120%)[\)] \, $ <eq:model-minmass>]

because $lr(|x^(sans(T)) J x|) \/ 2 lt.eq C_beta n \/ 2$. Later arguments selecting countably many comparison tests use a diagonal sequence of such finite good events; the required uniformity is stated explicitly in Theorem 5.1, Proposition 9.1.

=== 2.3 Two reusable consequences for finite chains <two-reusable-consequences-for-finite-chains>

We now leave the random-matrix input aside. The first estimate turns a pointwise gradient bound into exponential moments of a terminal observable. The second compares averages under shifted Poisson clocks with averages under a binomial clock. Both estimates also enter the independent restricted-temperature argument in the appendices; their proofs use only the finite-chain hypotheses.

#thm([Lemma 2.2.])[
  (Jump exponential moments).  #emph[Fix $d gt.eq 0$ and $f : Omega_n arrow.r bb(R)$. Suppose a bounded measurable function $b : \[ 0 \, d \] arrow.r \[ 0 \, oo \)$ satisfies 
$ sup_x ∥d S_r f \( x \)∥^2 lt.eq b \( r \) quad \( 0 lt.eq r lt.eq d \) . $

 Put $B = sup b$ and $I = integral_0^d b \( r \) thin upright(d) r$. Then, for every $theta in bb(R)$ and every starting state $x$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(E)_x exp #h(-0.16667em) (theta \( f \( X_d \) - S_d f \( x \) \)) lt.eq exp #h(-0.16667em) (2 theta^2 e^(2 lr(|theta|) sqrt(B)) I) . $ <eq:model-jump-mgf>]

 In particular, $"Var"_x \( f \( X_d \) \) lt.eq 4 I$.]
] <lem:input-mgf>

#proof[
  Use the backward martingale $F \( s \, X_s \) = S_(d - s) f \( X_s \)$, whose initial value is $S_d f \( x \)$ and terminal value is $f \( X_d \)$. A spin flip has increment $- 2 x_i d_i F$, of magnitude at most $2 sqrt(b \( d - s \))$. Its instantaneous sum of squared jump sizes times rates is
  $ sum_i w_i / 2 \( 2 d_i F \)^2 lt.eq 4 b \( d - s \) . $
  The backward equation cancels the linear part of the exponential drift. The remaining jump compensator is controlled by the preceding square-jump bound and $e^z - 1 - z lt.eq z^2 e^(lr(||) z) \/ 2$. Integrating the resulting drift inequality and dividing by $e^(theta S_d f \( x \))$ gives (2.5). Expansion at $theta = 0$ gives the variance assertion. This argument used the flip-rate bound and the assumed gradient bound; it used no restriction on the temperature. ◻
]

The comparison between lazy discrete clocks and continuous semigroups follows the shifted Poisson and binomial method of Chen and Saloff-Coste #cite(label("ChenSaloffCoste2013")) Theorem 1.1 and Lemmas 3.1–3.2. We give the bounded-array version needed for uniformity in the disorder.

#thm([Lemma 2.3.])[
  (Clock comparison).  #emph[Fix $q in \( 0 \, 1 \)$, let $M_n in bb(N)$ tend to infinity, and let $\( a_(n \, j) \)_(j gt.eq 0)$ be real arrays satisfying $sup_(n \, j) \| a_(n \, j) \| lt.eq B < oo$. Suppose that for every fixed $y in bb(R)$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] a_(n \, N_(n \, y)) #scale(x: 120%, y: 120%)[\]] arrow.r 0 \, #h(2em) N_(n \, y) tilde.op "Poisson" \( q M_n + y sqrt(M_n) \) . $ <eq:inputclock-poisson-hypothesis>]

 The mean in this display is positive for all sufficiently large $n$. If $B_n tilde.op "Binomial" \( M_n \, q \)$, then $bb(E) \[ a_(n \, B_n) \] arrow.r 0$. The conclusion is uniform over an additional family of arrays and values of $M_n$ when their bounds and the convergences in Equation (2.6) are uniform and $M_n$ tends uniformly to infinity.]
] <lem:input-clock>

The proof appears in Appendix 18. It first approximates the two rescaled clocks by Gaussian densities, then approximates the narrower Gaussian by a finite signed sum of translates of the wider one. Fixing that sum before testing the arrays gives the stated uniformity.

=== 2.4 The independent case <the-independent-case>

The gap input assumes $beta > 0$. At $beta = 0$, independence gives the continuous-time cutoff directly, with rate equal to one.

#thm([Proposition 2.4.])[
  #emph[At $beta = 0$, the continuous-time dynamics has cutoff at $1 / 2 log n$.]
] <prop:model-independent>

#proof[
  For the upper bound, use the full density relative to equilibrium. Starting from $x$, the spins at time $t$ are independent with means $e^(- t) x_i$. Against uniform measure,
  $ 1 + chi^2 \( S_t \( x \, dot.op \) \, mu \) = \( 1 + e^(- 2 t) \)^n . $
  Thus total variation tends to zero uniformly in $x$ at $t = \( 1 + epsilon.alt \) log n \/ 2$. For the lower bound, a single statistic suffices. From the all-plus state, the normalized sum $n^(- 1 \/ 2) sum_i X_i$ has mean $sqrt(n) thin e^(- t)$ and variance at most one; at equilibrium its mean is zero and its variance is one. At $t = \( 1 - epsilon.alt \) log n \/ 2$, the mean tends to infinity. Chebyshev’s inequality gives total variation tending to one. ◻
]

Henceforth $0 < beta < 1$. The discrete independent case follows from the same clock comparison used at the end of the paper.

== 3 Static estimates and Gaussian observation <sec:static>

Our goal is a uniform heat-kernel bound whose logarithm, divided by $n$, can be made small by choosing a long but fixed time. We obtain it in four steps: control the mean under an arbitrary change of law; transport that control along a Gaussian observation with simultaneous posterior and cavity gaps; bound entropy at the product endpoint; and convert the entropy bound to a semigroup norm estimate. The first step strengthens the stable-field estimates of #cite(label("SKGap")). The observation step uses the stochastic-localization method of Eldan #cite(label("Eldan2013")), its Gaussian-channel formulation by El Alaoui and Montanari #cite(label("ElAlaouiMontanari2021")), and the localization-annealing framework of Chen and Eldan #cite(label("CE2025")). The stopped, changed-law estimates and simultaneous cavity conclusions required here are proved below. Throughout this section constants may depend on the fixed $beta < 1$. They never depend on the probability measure being compared with equilibrium.

The cost of changing a strictly positive cube law $P$ to a probability $Q$ will be measured by its square-root Dirichlet energy and relative entropy. Set

$ D_P \( Q \) = cal(E)_P #scale(x: 120%, y: 120%)[\(] sqrt(Q \/ P) #scale(x: 120%, y: 120%)[\)] \, #h(2em) H_P \( Q \) = sum_x Q \( x \) log frac(Q \( x \), P \( x \)) . $

The energy lies in $\[ 0 \, n \]$; values at zeros of $Q$ are defined by continuity. To see how it controls the change in a single conditional spin law, write $P_i \, Q_i$ for the conditional laws of spin $i$ given all other spins. Expanding the conditional variance gives

#[#set math.equation(numbering: n => "(3.1)")
 $ D_P \( Q \) = sum_i bb(E)_(Q_(- i)) [1 - (sum_(s = plus.minus 1) sqrt(P_i \( s \) Q_i \( s \)))^2] . $ <eq:stat-affinity>]

Conditionals on a $Q_(- i)$-null configuration can be assigned arbitrarily. For two probabilities $p \, q$, Cauchy–Schwarz applied to $\( sqrt(p) - sqrt(q) \) \( sqrt(p) + sqrt(q) \)$ gives $"TV" \( p \, q \)^2 lt.eq 1 - \( sum sqrt(p q) \)^2$. Hence, if $macron(m)_i = bb(E)_Q \[ x_i divides x_(- i) \]$ and $m_i^P = bb(E)_P \[ x_i divides x_(- i) \]$, then

#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E)_Q sum_i \( macron(m)_i - m_i^P \)^2 lt.eq 4 D_P \( Q \) . $ <eq:stat-conditional-means>]

=== 3.1 A stable field controls means under an arbitrary law <a-stable-field-controls-means-under-an-arbitrary-law>

We begin with the deterministic hypotheses under which the mean estimate will hold. These hypotheses come from #cite(label("SKGap")); the arbitrary-law conclusion will be proved here. For a symmetric interaction matrix $M$ with zero diagonal, a parameter $0 < j < 1$, and a field $h$, put

$ m \( y \) = tanh y \, #h(2em) b \( y \) = 1 / n sum_i "sech"^2 y_i \, #h(2em) V \( y \) = "diag" \( "sech"^2 y_i \) \, $

and, for a nonnegative diagonal matrix $A$, write

#[#set math.equation(numbering: n => "(3.3)")
 $ F_(M \, h) \( y \) & = y - h + { j b \( y \) I - M } m \( y \) \,\
sans(H)_M \( y \, A \) & = I + A^(1 \/ 2) (j b \( y \) I - M - frac(2 j, n) m \( y \) m \( y \)^(sans(T))) A^(1 \/ 2) . $ <eq:stat-field-map>]

The stability hypothesis is a uniform implication over a small-residual region and nearby diagonals. More precisely, the field has fixed positive margins $rho_0 \, epsilon.alt_A \, kappa$ and $a_(+) > 1$, with $j a_(+)^2 < 1$, such that

#[#set math.equation(numbering: n => "(3.4)")
 $ ∥F_(M \, h) \( y \)∥ lt.eq rho_0 sqrt(n) \, quad 0 lt.eq A lt.eq a_(+) I \,\
∥A - V \( y \)∥_(upright("HS")) lt.eq epsilon.alt_A sqrt(n)} quad arrow.r.double quad sans(H)_M \( y \, A \) succ.curly.eq kappa I . $ <eq:stat-stability>]

We also require the finite-word estimates of #cite(label("SKGap")) Lemma 3.1. Fix a length bound $L$, a diagonal norm bound $M_0$, and an inverse margin $c_0 > 0$. A word $W$ is an ordered product of at most $L$ factors, each either a real diagonal matrix of norm at most $M_0$, a copy of $M$, or the following inverse, which may occur at most once:

$ K_A = \( I - A M + j chi_A A \)^(- 1) \, #h(2em) chi_A = n^(- 1) "Tr" A \, #h(2em) 0 lt.eq A lt.eq a_(+) I . $

Words containing $K_A$ are considered only when

$ I + j chi_A A - A^(1 \/ 2) M A^(1 \/ 2) succ.curly.eq c_0 I . $

To define the diagonal prediction $sans(P) \( W \)$ for a word without an inverse, sum over complete noncrossing pairings of its occurrences of $M$. Remove each innermost pair by $M D M mapsto j n^(- 1) "Tr" \( D \) I$ and combine adjacent diagonals. An odd number of copies of $M$ gives zero prediction; a word with no $M$ predicts itself. For an inverse factor, apply this rule coefficientwise to $\( I - z A M + z^2 j chi_A A \)^(- 1)$ expanded formally at $z = 0$, and then set $z = 1$. The cited lemma shows that the resulting prediction is a polynomial in $z$. The required bounds are

#[#set math.equation(numbering: n => "(3.5)")
 $ ∥∥ W lt.eq C_(upright(w)) \, #h(2em) (sum_(a eq.not b) \| W_(a b) \|^4)^(1 \/ 4) lt.eq C_(upright(w)) \, #h(2em) ∥"diag" \( W - sans(P) \( W \) \)∥_2 lt.eq C_(upright(w)) . $ <eq:stat-word-diagnostics>]

The entrywise and diagonal norms are unnormalized. These bounds hold simultaneously in all the allowed diagonal choices; $C_(upright(w))$ is independent of $n$. We refer to them, together with $∥∥ M lt.eq K$, as the deterministic diagnostics. The construction below chooses a sufficiently large finite $L$ and fixed coefficient bounds before $n$ tends to infinity. Constants in the mean estimate may depend on these bounds and the fixed stability and inverse margins.

#thm([Lemma 3.1.])[
  (Arbitrary-law mean bound).  #emph[Suppose $P \( x \)$ is proportional to $exp \( x^(sans(T)) M x \/ 2 + h^(sans(T)) x \)$ and satisfies the deterministic diagnostics and (3.4). There is a constant $C$, uniform over these fields, matrices, and dimensions, such that every probability $Q$ on the cube satisfies 
#[#set math.equation(numbering: n => "(3.6)")
 $ ∥bb(E)_Q x - bb(E)_P x∥ lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + sqrt(D_P \( Q \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:stat-mean>]

 The required diagnostic length is finite and depends only on the fixed stability margins and the bounds in the construction.]
] <lem:stat-mean>

#proof[
  We first extend the weak residual identity to expectations under $Q$, then use first moments to select two consecutive small residuals, and finally compare the selected iterate with the stable root. The deterministic differentiation bounds are supplied by #cite(label("SKGap")) Lemmas 5.7, 6.1, 6.3, and 6.4. The conclusion (3.6), including its square-root dependence on the energy, is the additional assertion proved in this argument.
  #emph[Residual identities under the changed law.]
  The recursion uses Onsager corrections, as in Bolthausen’s TAP iteration #cite(label("Bolthausen2014")). Post-iteration Gaussian comparison and local convexity are studied by Celentano #cite(label("Celentano2024")); neither result substitutes for the buffered residual estimates used here. Define the primary fields by
  $ m^0 = x \, quad b_0 = 0 \, quad h^1 = h + M x \, quad m^l = tanh h^l \,\
b_l = n^(- 1) sum_i \( 1 - \( m_i^l \)^2 \) \, #h(2em) h^(l + 1) = h + M m^l - j b_l m^(l - 1) \, $
  and put $R_l = m^(l - 1) - m^l$. At any fixed depth the derivative matrices of $h^l \, m^l$ have bounded operator norm and $∥d b_l∥ lt.eq C_l n^(- 1 \/ 2)$. The small-vector constructions in #cite(label("SKGap")) Definition 6.2 start with seeds of bounded Euclidean norm that may depend on $M \, h$ but are independent of the spin $x$. Their sources are finite sums of smooth site coefficients times seeds or earlier auxiliary fields, and are linear in those auxiliary arguments. The coefficients and their derivatives through every fixed order used in the construction are uniformly bounded. Scalar parameters $theta$ satisfy $sup_x \( \| theta \( x \) \| + ∥d theta \( x \)∥ \) lt.eq C$; they may include the averages $b_l$. A source $U$ is admissible from level $p$ when every explicit primary field in its site coefficients has index at least $p$. In particular, the seed $\( 1 \, dots.h \, 1 \) \/ sqrt(n)$ permits the source $m^l \/ sqrt(n)$ at level $l$. An ordinary construction starts with an empty auxiliary list. At stage $r$, write $w^r = U$ for the new source and $y^r$ for the output of the operation below; the auxiliary sum runs over earlier pairs $\( w^a \, y^a \)$, $a < r$. The formal partial $partial_l U_i$ differentiates the explicit primary-field argument $h_i^l$, holding the seeds, scalar parameters (including the averages $b_l$), and auxiliary arguments fixed. The partial $partial_(y^a) U_i$ differentiates the linear argument $y_i^a$ with its coefficient held fixed. A partial in an absent argument is zero. The associated auxiliary operation is
  #[#set math.equation(numbering: n => "(3.7)")
   $ U mapsto M U - j sum_l alpha_l m^(l - 1) - j sum_a gamma_a w^a \, quad alpha_l = n^(- 1) sum_i partial_l U_i \, quad gamma_a = n^(- 1) sum_i partial_(y^a) U_i . $ <eq:stat-auxiliary>]
  These partials act on the displayed arguments of a recipe. They are distinct from the discrete derivative matrix $\( nabla U \)_(i j) = d_j U_i$, which records the response of the whole recipe to spin flips. For every fixed construction the imported deterministic bounds are
  #[#set math.equation(numbering: n => "(3.8)")
   $ ∥∥ U + ∥nabla U∥_(upright("HS")) + sum_i \| d_i U_i \| lt.eq C \, quad \| alpha_l \| + ∥d alpha_l∥ lt.eq C n^(- 1 \/ 2) \, quad \| gamma_a \| + ∥d gamma_a∥ lt.eq C . $ <eq:stat-small-bounds>]
  They also hold for the local implicit construction used below, on its specified fixed flip buffers. These statements concern pointwise differences and have no dependence on the law under which they are tested.
  Put $D = D_P \( Q \)$ and, for a scalar test, let
  $ B \( G \) = sup_x \| G \( x \) \| + sup_x ∥d G \( x \)∥ . $
  We claim that the weak residual bound becomes
  #[#set math.equation(numbering: n => "(3.9)")
   $ \| bb(E)_Q G R_p^(sans(T)) U \| lt.eq C B \( G \) \( 1 + sqrt(D) \) . $ <eq:stat-Q-residual>]
  For a local construction the test is supported on its small-residual region, and the supremum bounds are only needed on the corresponding buffer. In particular no conditional regularity of $Q$ is assumed.
  At the first level, the only change from the equilibrium residual argument is the mismatch between the $Q$-conditional mean and the $P$-conditional mean. Conditional covariance under $Q$ gives
  $ bb(E)_Q sum_i \( x_i - m_i^1 \) G U_i =  & bb(E)_Q sum_i \( 1 - macron(m)_i^2 \) d_i \( G U_i \)\
 & + bb(E)_Q G sum_i \( macron(m)_i - m_i^1 \) U_i . $
  This remains true when a conditional law of $Q$ is a point mass. The product rule $d_i \( G U_i \) = G d_i U_i + \( d_i G \) \( U_i - 2 x_i d_i U_i \)$ and (3.8) bound the first term by $C B \( G \)$. (3.2) and Cauchy–Schwarz bound the second by $2 C ∥∥ G_oo sqrt(D)$. This proves the base case.
  For higher levels we reduce to lower residual indices by an exact cancellation. For a target admissible from level $p + 1$, set
  $ a_p = j \( b_p - b_(p - 1) \) \, #h(2em) U'_i = Phi \( h_i^p \; h_i^(p + 1) \, a_p \) U_i \, $
  where
  #[#set math.equation(numbering: n => "(3.10)")
   $ Phi \( z \; r \, a \) = integral_0^1 e^(a \( 1 - u^2 \) \/ 2) frac(cosh \( u \( z - r \) \), cosh z cosh r) thin thin upright(d) u . $ <eq:stat-Phi>]
  It satisfies $\[ \( z - r - a tanh z \) - a partial_z \] Phi = tanh z - tanh r$. Adjoin the auxiliary field $y'$ of $U'$ using (3.7). With $alpha_l \, gamma_a$ belonging to $U'$, the recurrence gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ R_(p + 1)^(sans(T)) U =  & R_p^(sans(T)) y' + a_p R_p^(sans(T)) U' - j b_(p - 1) R_(p - 1)^(sans(T)) U' + j sum_a gamma_a R_p^(sans(T)) w^a\
 & + j sum_(l gt.eq p) alpha_l R_p^(sans(T)) m^(l - 1) - a_p n alpha_p . $ <eq:stat-residual-induction>]
  The $R_(p - 1)$ term is absent at $p = 1$. The $l = p$ term cancels the last term because
  $ R_p^(sans(T)) m^(p - 1) = n \( b_p - b_(p - 1) \) - R_p^(sans(T)) m^p . $
  After this cancellation, the remaining $l = p$ term is $- j \( sqrt(n) alpha_p \) R_p^(sans(T)) \( m^p \/ sqrt(n) \)$. Its target $m^p \/ sqrt(n)$ is admissible from level $p$ and has bounded norm. For $l > p$, use the target $m^(l - 1) \/ sqrt(n)$ in the same way. Thus every term has a lower residual index, a permitted target, and one of the bounded multipliers $a_p \, b_(p - 1) \, gamma_a \, sqrt(n) alpha_l$. Their difference bounds in (3.8) and the product rule give $B \( theta G \) lt.eq C B \( G \)$ for each such multiplier. Strong induction over finite admissible constructions therefore proves (3.9). Each step adds finitely many operations and decreases the residual index, so a finite word length suffices. For a supported local test, a difference can be nonzero only on a one-flip neighborhood of its support; the imported buffers include every such neighborhood used in this finite induction.
  #emph[Selecting two consecutive small residuals.] The weak estimate now has the desired $1 + sqrt(D)$ cost. We preserve that cost in the selection step by using first moments rather than second moments. Set $S_l = R_l^(sans(T)) m^l \/ sqrt(n)$ and $psi \( s \) = s \/ sqrt(1 + s^2)$. The primary derivative bounds give $sup ∥d S_l∥ lt.eq C_l$, while $\| psi \| \, \| psi' \| lt.eq 1$ and $s psi \( s \) gt.eq \| s \| - 1$. Testing (3.9) with $U = m^l \/ sqrt(n)$ and $G = psi \( S_l \)$ yields
  #[#set math.equation(numbering: n => "(3.12)")
   $ bb(E)_Q \| S_l \| lt.eq C_l \( 1 + sqrt(D) \) . $ <eq:stat-S-first-moment>]
  The exact telescoping identity is
  $ ∥R_l∥^2 \/ n = b_l - b_(l - 1) - 2 S_l \/ sqrt(n) . $
  For a fixed small $rho > 0$, choose a fixed depth $d_0$ with $floor.l d_0 \/ 2 floor.r rho^2 \/ 4 > 2$, and then a fixed $epsilon > 0$ with $2 d_0 epsilon < 1$. If every $\| S_l \| lt.eq epsilon sqrt(n)$, the sum of the squared residuals divided by $n$ is less than two. Some consecutive pair consequently has both norms at most $rho sqrt(n) \/ 2$. Let $C_k$ be smooth cutoffs equal to one on this latter condition and supported where both norms are at most $rho sqrt(n)$. The primary derivative bounds give $∥d C_k∥ lt.eq C_rho \/ sqrt(n)$. Combine the cutoffs in order so that earlier cutoffs reduce the weight available to later ones, and retain the unassigned deficit. Put
  $ hat(C)_k = C_k product_(l = 2)^(k - 1) \( 1 - C_l \) \, #h(2em) Delta = 1 - sum_(k = 2)^(d_0) hat(C)_k . $
  Markov’s inequality and (3.12) give
  #[#set math.equation(numbering: n => "(3.13)")
   $ Q \( Delta > 0 \) lt.eq C_rho \( 1 + sqrt(D) \) \/ sqrt(n) . $ <eq:stat-selection>]
  #emph[Comparing the selected iterate with the stable root.] Let $r$ be the unique zero of (3.3), whose existence and inverse bound follow from #cite(label("SKGap")) Lemma 5.7, and put $t_(*) = tanh r$, $q_(*) = n^(- 1) ∥t_(*)∥^2$. On the buffered region of $C_k$, fix the primary fields and the root, and choose one of the two sources $w_0$ specified below. The implicit construction of #cite(label("SKGap")) Lemma 6.3 supplies a vector $w$, an auxiliary vector $y^(upright("imp"))$, and a scalar $c_1$ solving
  $ a = j \( 1 - b_(k - 1) - q_(*) \) \, quad A_i = Phi \( h_i^k \; r_i \, a \) \, quad A = "diag" \( A_i \) \, quad chi = n^(- 1) sum_i A_i \,\
w = w_0 + A \( y^(upright("imp")) - j c_1 t_(*) \) \, #h(2em) y^(upright("imp")) = M w - j chi w - j c_1 m^(k - 1) \, #h(2em) c_1 = n^(- 1) sum_i partial_k w_i . $
  Here $w_0$ is either $A e$ for a fixed $∥∥ e lt.eq 1$, or $n^(- 1 \/ 2) partial_r Phi \( h_i^k \; r_i \, a \)$ coordinatewise. In $partial_k w_i$, the arguments $y_i^(upright("imp")) \, c_1 \, a$ are held fixed; in $partial_r Phi$, $a$ is held fixed. With this convention the displayed equations form a linear system for $\( w \, y^(upright("imp")) \, c_1 \)$, whose unique solution is supplied by the cited lemma. That lemma also gives
  $ ∥∥ w + ∥y^(upright("imp"))∥ + sqrt(n) \| c_1 \| lt.eq C \, #h(2em) I + j chi A - A^(1 \/ 2) M A^(1 \/ 2) succ.curly.eq c_0 I $
  after decreasing the common positive inverse margin if necessary. The distinction between its bounds matters for selecting parameters: derivative constants may depend on the fixed depth, while size and inverse constants do not. We will first control the susceptibility average with the second seed, then test the mean in direction $e$ with the first seed.
  Define
  $ T_k \( w \) = { h^k - h - \( M - j b_(k - 1) I \) m^k }^(sans(T)) w - j \( b_k - b_(k - 1) \) n c_1 . $
  The algebra in #cite(label("SKGap")) Lemma 6.6 expresses this as
  $ R_k^(sans(T)) y^(upright("imp")) + j \( chi - b_(k - 1) \) R_k^(sans(T)) w - j b_(k - 1) R_(k - 1)^(sans(T)) w - j c_1 R_k^(sans(T)) m^k . $
  Thus the already proved local residual estimate gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ \| bb(E)_Q G T_k \( w \) \| lt.eq C B \( G \) \( 1 + sqrt(D) \) . $ <eq:stat-Q-terminal>]
  This is the required arbitrary-law version of the terminal residual identity; the last term uses the multiplier $sqrt(n) c_1$.
  To extract a mean comparison from this terminal residual, write $p = m^k - t_(*)$ and $L_(*) = sqrt(n) { chi - \( 1 - q_(*) \) }$. Subtract the root equation and substitute the displayed equation for $M w$ to obtain
  #[#set math.equation(numbering: n => "(3.15)")
   $ T_k \( w \) =  & sum_i \[ \( h_i^k - r_i - a m_i^k \) - a partial_k \] w_(0 \, i)\
 & + j \( 1 - q_(*) - chi \) p^(sans(T)) w - j c_1 R_k^(sans(T)) p . $ <eq:stat-implicit-comparison>]
  The inverse bound and the two small residuals imply $∥∥ p lt.eq C rho sqrt(n)$. Consequently the middle term has absolute value at most $C_0 rho \| L_(*) \|$, with $C_0$ independent of the selection depth. Also $sup ∥d L_(*)∥ lt.eq C_k$. Because $C_0$ is independent of depth, we can choose $rho$ with $C_0 rho < 1 \/ 2$ first, and only then choose $d_0$ and $epsilon$ as in the selection step above.
  For $w_(0 \, i) = n^(- 1 \/ 2) partial_r Phi \( h_i^k \; r_i \, a \)$ the first sum in (3.15) is $L_(*)$: differentiate the identity following (3.10) in $r$, holding $a$ fixed. Test with $G = C_k psi \( L_(*) \)$. Its $B$-norm is bounded. The last term is controlled by (3.9) with target $p \/ sqrt(n)$ and multiplier $sqrt(n) c_1$. Absorbing the middle term gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ \( 1 - C_0 rho \) bb(E)_Q \[ C_k \| L_(*) \| \] lt.eq 1 + C'_k \( 1 + sqrt(D) \) . $ <eq:stat-L-first-moment>]
  For $w_0 = A e$, the first sum is $p^(sans(T)) e$. Test this time with $hat(C)_k$ alone. Since $hat(C)_k lt.eq C_k$, (3.14), (3.16) and the same residual bound imply
  $ \| bb(E)_Q hat(C)_k \( m^k - t_(*) \)^(sans(T)) e \| lt.eq C'_k \( 1 + sqrt(D) \) . $
  It remains to pass from the selected iterate back to the original spin. Sum (3.9) with constant target $e$ to handle $x - m^k = sum_(l lt.eq k) R_l$, and then sum over $k$. The omitted part has absolute value at most $2 sqrt(n) thin Q \( Delta > 0 \) lt.eq C \( 1 + sqrt(D) \)$ by (3.13). Taking the supremum over unit $e$ proves $∥bb(E)_Q x - t_(*)∥ lt.eq C \( 1 + sqrt(D) \)$. Apply this also with $Q = P$, when $D = 0$, and use the triangle inequality. ◻
]

=== 3.2 Two observation stages and simultaneous posterior gaps <two-observation-stages-and-simultaneous-posterior-gaps>

We next construct the observation along which the mean bound can be used. White observation first creates a large field; a second observation then removes the interaction while preserving quantitative stability. Fix $k > K$, where $∥∥ J lt.eq K$ on the matrix event under consideration, and put $A_(*) = J + k I succ 0$. Sample $X$ from $mu$. With independent standard Brownian motions $B \, W$, observe first

$ Y_s = s X + B_s quad \( 0 lt.eq s lt.eq b \) $

and then, conditionally on the first observations,

$ Z_r = r A_(*) X + A_(*)^(1 \/ 2) W_r quad \( 0 lt.eq r lt.eq 1 \) . $

The posterior at the two stages has, respectively, interaction and field

#[#set math.equation(numbering: n => "(3.17)")
 $ \( J \, Y_s \) \, #h(2em) \( \( 1 - r \) J \, Y_b + Z_r \) . $ <eq:stat-posterior-parameters>]

Indeed the likelihood of the second observation subtracts $r x^(sans(T)) A_(*) x \/ 2$ from the quadratic Hamiltonian; its diagonal part is constant on the cube. The posterior at time $b + 1$ is therefore the product measure with coordinate logits $h = Y_b + Z_1$.

Before estimating the posterior gaps, we record the two observation identities used in their proof. The relative entropy of the observation law is a drift energy, and the expected posterior Dirichlet energy does not increase. In the experiment above the instantaneous precision is $I$ on the first stage and $A_(*)$ on the second. More generally, let it be $A_t succ.curly.eq 0$, with bounded operator norm, and let $P_t \, Q_t$ be its posteriors for inputs $P \, Q$. Write $bb(P) \, bb(Q)$ for the observation laws. The entropy-as-drift-energy identity is classical; see Lehec #cite(label("Lehec2013")) Theorem 2, which credits Föllmer. Here the innovation process is Brownian and its changed drift is the difference of posterior means. For a bounded stopping time $sigma$, the density martingale and Itô’s formula give

#[#set math.equation(numbering: n => "(3.18)")
 $ H \( bb(Q) \|_(cal(F)_sigma) divides bb(P) \|_(cal(F)_sigma) \) = 1 / 2 bb(E)_(bb(Q)) integral_0^sigma ∥A_t^(1 \/ 2) \( bb(E)_(Q_t) x - bb(E)_(P_t) x \)∥^2 thin thin upright(d) t . $ <eq:stat-observation-entropy>]

For example represent the signal as $thin upright(d) Y_t = A_t X thin thin upright(d) t + A_t^(1 \/ 2) thin upright(d) B_t$; its innovation has the same covariance, and the density score is the difference of posterior means. Finite dimension and bounded horizon justify optional stopping and the change of drift. The same formula follows for singular $A_t$ by restricting to its range. At deterministic times, and also at bounded stopping times,

#[#set math.equation(numbering: n => "(3.19)")
 $ bb(E)_(bb(Q)) D_(P_t) \( Q_t \) lt.eq D_P \( Q \) . $ <eq:stat-energy-monotone>]

To see this, set $f = sqrt(Q \/ P)$. The observation density is $P_t f^2$, so the left side is $bb(E)_(bb(P)) cal(E)_(P_t) \( f \)$. Its $i$th summand is $bb(E) "Var" \( f \( X \) divides X_(- i) \, cal(F)_t \)$, bounded by $bb(E) "Var" \( f \( X \) divides X_(- i) \)$ by conditional variance decomposition. The same argument applies with $cal(F)_t$ replaced by the stopped observation $sigma$-field. These arguments are the finite-state identities of #cite(label("SKGap")) Section 2, with a bounded precision inserted.

#thm([Proposition 3.2.])[
  (Observation paths and cavities).  #emph[There are fixed $b \, k \, C \, c \, gamma > 0$ and events of disorder probability tending to one on which the following assertions hold, for the full model and for every model obtained by deleting one site. Along the observation experiment just defined, all posterior heat-bath gaps are at least $gamma$, except on an ordinary observation event of probability at most $C e^(- c n)$. On the same good paths all posteriors satisfy 6 with the same constant. The exceptional event and a stopping time before loss of these properties can be chosen independently of any test function. The constants are common to all cavities.]
] <prop:stat-posterior-gap>

#proof[
  We verify second-stage stability and its gap first. We then run the observation argument conditionally from each first-stage posterior to obtain its gap, and finally place all single-site cavities on one common disorder event.
  #emph[Stability through the two stages.] For the first stage, #cite(label("SKGap")) Proposition 5.1 and Corollary 5.2 give (3.4), with positive slack and a test-independent stopping rule, throughout the first stage up to any prescribed fixed $b$, outside an event of ordinary observation probability $e^(- c n)$. Intersect its matrix event with the finite word events required in 6 and in the directional estimate #cite(label("SKGap")) Proposition 7.2.
  On the second stage write $u = 1 - r$ and use $M = u J$, $j = u^2 beta^2$. The word bounds hold uniformly in $u in \[ 0 \, 1 \]$. In fact their inverse factor is exactly
  $ \( I - u A J + u^2 beta^2 chi_A A \)^(- 1) = \( I - \( u A \) J + beta^2 chi_(u A) \( u A \) \)^(- 1) . $
  The other word factors only acquire powers of $u$. The fixed upper bound on $A$ can thus be the same as for $J$. All derivative and implicit construction estimates used above are uniform for these parameters: the recurrences have bounded coefficients, $j$ remains bounded away from one, and the inverse margins are fixed. At $u = 0$ the measure is product; (3.2) gives its mean bound directly.
  To obtain a margin throughout the second stage, use the large field created in the first one. Gaussian maximal bounds on the two fixed Brownian intervals imply, outside $C e^(- c n)$, that
  #[#set math.equation(numbering: n => "(3.20)")
   $ sup_(0 lt.eq r lt.eq 1) ∥Y_b + Z_r - b X∥ lt.eq C sqrt(b n) $ <eq:stat-large-field>]
  for $b gt.eq 1$, with a constant depending on $K \, k$. One elementary proof of the bound for $B$ uses a $1 \/ 2$-net of the unit sphere and the scalar Brownian maximal inequality; the covariance norm of $A_(*)^(1 \/ 2) W$ is at most $K + k$. This also gives the asserted exponential probability. If $y$ has residual at most $rho_0 sqrt(n)$ in (3.3), then $∥y - h∥ lt.eq \( rho_0 + beta^2 + K \) sqrt(n)$. Thus, by (3.20), at most $C n \/ b$ coordinates have $\| y_i \| < b \/ 2$. Outside these coordinates $V \( y \)_(i i) lt.eq "sech"^2 \( b \/ 2 \)$. For a candidate $A$ in (3.4), an additional set of size at most $epsilon.alt_A^2 n \/ a^2$ has $\| A_(i i) - V \( y \)_(i i) \| > a$.
  The small principal submatrix bounds of #cite(label("SKGap")) Lemma 8.2 apply also to $J$, because $∥J - \( tanh J_(i j) \)∥ arrow.r 0$ on that event. If $S$ is the preceding exceptional set and $A_(i i) lt.eq 2 a$ off $S$, they give
  $ ∥A^(1 \/ 2) u J A^(1 \/ 2)∥ & lt.eq a_(+) ∥J_(S S)∥ + 2 K sqrt(2 a_(+) a) + 2 K a \,\
frac(2 u^2 beta^2, n) ∥A^(1 \/ 2) tanh y∥^2 & lt.eq 2 beta^2 { a_(+) \| S \| \/ n + 2 a } . $
  Choose the principal-submatrix tolerance and $a$ first so that the sum of these bounds is less than $1 \/ 2$; choose an allowed exceptional fraction next, then $b$ large and $epsilon.alt_A$ small. The nonnegative term $j b \( y \) A$ in (3.3) can be kept or dropped. This proves (3.4) with $kappa = 1 \/ 2$ on the second stage, after reducing the common margins if necessary. These choices are compatible with the first-stage theorem: choose this fixed $b$ first and subsequently intersect and reduce its supplied margins.
  #emph[The second-stage gap.] The same large-field event also gives a gap at least $1 \/ 2$ throughout this stage. The curvature bound must hold uniformly in the spin configuration. For that purpose combine (3.20) with $∥u J x∥ lt.eq K sqrt(n)$. Only a small fixed fraction of the fields $h_i + \( u J x \)_i$ can be smaller than $b \/ 4$ in absolute value. Let $v_i = "sech"^2 \( h_i + \( u J x \)_i \)$ and $a_i = v_i d_i f$. The signed curvature inequality of #cite(label("SKGap")) Lemma 8.1 is
  $ bb(E)_P \( H f \)^2 gt.eq \( 1 - C r_4 \) cal(E)_P \( f \) - bb(E)_P { a^(sans(T)) U a + C \| a \|^(sans(T)) Q_0 \| a \| } \, $
  where $H = - L_P$, $U_(i j) = tanh \( u J_(i j) \)$, $\( Q_0 \)_(i j) = U_(i j)^2$, and $r_4 = max_i sum_j U_(i j)^4 = o \( 1 \)$. On the weak-field set use the small principal-submatrix norms; on its complement use $v_i lt.eq "sech"^2 \( b \/ 4 \)$. If $q_f \( x \) = sum_i v_i \( d_i f \)^2$, each quadratic cost is bounded by $\[ epsilon + K' \( 2 sqrt(eta) + eta \) \] q_f \( x \)$ with $eta = "sech"^2 \( b \/ 4 \)$ and a fixed $K'$. Choosing the same tolerances sufficiently small proves $bb(E)_P \( H f \)^2 gt.eq cal(E)_P \( f \) \/ 2$. The finite-dimensional spectral theorem gives the gap $1 \/ 2$. The matrix bounds are uniform in $u$: $tanh \( u J \) = u J + o_(upright("op")) \( 1 \)$, while the nonnegative matrix $\( tanh \( u J_(i j) \)^2 \)$ is dominated entrywise by $\( J_(i j)^2 \)$.
  #emph[The first-stage posterior gaps.] The remaining task is to obtain a gap at every first-stage posterior. We do this by conditioning the observation experiment from that posterior onward. The zero-field gap theorem does not by itself apply to these random fields. Let $E$ be the event of a first-stage stability failure or failure of the terminal gap at time $b$. The preceding bounds and #cite(label("SKGap")) Proposition 8.3 allow a fixed $a_0 > 0$ such that $bb(P) \( E divides J \) lt.eq e^(- 2 a_0 n)$. For the observation filtration set $q_s = bb(P) \( E divides cal(F)_s \, J \)$. The nonnegative martingale maximal inequality gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ bb(P) { sup_(s lt.eq b) q_s > e^(- a_0 n) divides J } lt.eq e^(- a_0 n) . $ <eq:stat-future-bad>]
  Outside this event and $E$, fix a time $s < b$. Conditional on $cal(F)_s$, the remaining experiment is an ordinary white observation starting from its posterior $P_s$, with horizon $b - s lt.eq b$. Its future bad probability is at most $e^(- a_0 n)$.
  For every $f$ with $P_s f = 0$ and $P_s f^2 = 1$, set $d = cal(E)_(P_s) \( f \)$, and stop the remaining experiment at its next stability failure or at $b$, denoting this time by $sigma$. Write $N_t = P_t f^2$ and $V_t = P_t f^2 - \( P_t f \)^2$. Conditional variance decomposition gives $bb(E) \[ cal(E)_(P_t) \( f \) divides cal(F)_s \] lt.eq d$. At every retained stable posterior, the directional estimate of #cite(label("SKGap")) Proposition 7.2 states, in squared form,
  $ ∥"Cov"_(P_t) \( f \, x \)∥^2 lt.eq C_(upright(d)) { "Var"_(P_t) \( f \) + cal(E)_(P_t) \( f \) } . $
  It uses the same stable-field implication and a sufficiently long finite set of word diagnostics. This homogeneous estimate, combined with the filtering variance identity, implies
  #[#set math.equation(numbering: n => "(3.22)")
   $ bb(E) \[ V_sigma divides cal(F)_s \] gt.eq v_s - \( 1 - v_s \) d \, #h(2em) v_s = e^(- C_(upright(d)) \( b - s \)) gt.eq v_0 = e^(- C_(upright(d)) b) > 0 . $ <eq:stat-conditional-variance>]
  Indeed the stopped expected variance has derivative $- bb(E) \[ upright(bold(1))_(t < sigma) ∥"Cov"_(P_t) \( f \, x \)∥^2 divides cal(F)_s \]$, which is at least $- C_(upright(d)) \( bb(E) V_(t and sigma) + d \)$.
  The variance lower bound must be compared with the terminal energy. To control the variance lost on bad paths, change the input law to $f^2 P_s$. The observation density is $N_t$ and its posterior is $Q_t = f^2 P_t \/ N_t$. Before stopping, 6 and conditional variance decomposition give
  $ bb(E)^f \[ upright(bold(1))_(t < sigma) ∥bb(E)_(Q_t) x - bb(E)_(P_t) x∥^2 \] lt.eq C \( 1 + d \) \, #h(2em) bb(E)^f D_(P_t) \( Q_t \) = bb(E) cal(E)_(P_t) \( \| f \| \) lt.eq d . $
  By (3.18), the stopped observation entropy is at most $C b \( 1 + d \)$. Relative entropy between event probabilities gives
  #[#set math.equation(numbering: n => "(3.23)")
   $ bb(P)^f \( upright(f u t u r e med b a d) divides cal(F)_s \) lt.eq frac(C b \( 1 + d \) + log 2, a_0 n) . $ <eq:stat-changed-bad>]
  Here the bad event is measurable at $sigma$: it is the stopping event before $b$, or the terminal gap failure at $b$. Its ordinary conditional probability is exponentially small by (3.21). The changed probability in (3.23) is derived anew for each $f$; it is not asserted to be exponentially small.
  On good terminal paths $V_b lt.eq 2 cal(E)_(P_b) \( f \)$; on bad paths $V_sigma lt.eq N_sigma$. The stopped density identity and (3.22), (3.23) consequently give, for $d lt.eq 1$,
  $ v_0 - \( 1 - v_0 \) d lt.eq 2 d + C \/ n . $
  For all sufficiently large $n$ this implies $d gt.eq v_0 \/ 6$; for $d > 1$ the same lower bound is automatic. All constants are uniform in $s$ and $f$. A short remaining horizon improves $v_s$ and decreases the entropy integrals, so the estimate stays uniform as $s arrow.t b$. At $s = b$ use the terminal gap directly. Alternatively one can first argue at rational times and then use continuity of the finite-state gap in the field.
  #emph[One event for every cavity.] We now transfer the matrix and observation estimates to all single-site cavities at once. This requires a common disorder event, rather than a union bound over unspecified $o \( 1 \)$ disorder probabilities. Write $J^(\( i \))$ for a principal minor. Word diagnostics for this matrix are restrictions of those for $J$: insert the complementary coordinate projection among diagonal factors, and set the missing entry of an inverse diagonal to zero. All normalized traces can be retained with denominator $n$; equivalently the $\( n - 1 \)$-site variance parameter is $j_i = beta^2 \( n - 1 \) \/ n$. The identity $j_i \/ \( n - 1 \) = beta^2 \/ n$ makes these the same contractions. Inserting these projections may increase the required word length by a fixed factor; choose that larger finite length in the full event. The event is already simultaneous in its diagonal parameters. The small-submatrix bounds pass directly to every minor.
  For first-stage stability, take a candidate cavity vector $y_(- i)$ and extend it by choosing $y_i$ to solve the missing scalar equation $F_(J \, h) \( y \)_i = 0$. This equation is continuous with a bounded nonlinear part and hence has a solution. On the retained coordinates the residual changes by a vector of norm at most $∥J_(- i \, i)∥ + O \( n^(- 1 \/ 2) \) = O \( 1 \)$. Extend the candidate diagonal with $A_(i i) = "sech"^2 y_i$. Its Frobenius discrepancy is unchanged. The principal block of the full Hessian differs from the cavity Hessian by $O \( 1 \/ n \)$ in norm: the rank coefficient is exactly $2 beta^2 \/ n$ in either dimension, and only the missing contribution to $j b \( y \)$ changes. Start with smaller cavity residual and Frobenius thresholds and use the slack in the full stability event. It follows, uniformly in $i$, that full stability implies cavity stability with common positive margins for large $n$.
  The comparison of sampling laws costs only $exp \( C sqrt(n) \)$. Indeed the full marginal on $x_(- i)$ is proportional to $mu^(\( i \)) \( x_(- i) \) cosh \( J_i x_(- i) \)$, and $\| J_i x_(- i) \| lt.eq K sqrt(n)$. More explicitly, the law obtained by sampling the cavity spin configuration and an independent uniform missing spin has density at most $exp \( 2 K sqrt(n) \)$ relative to $mu$. Extend its Brownian observation by an independent coordinate. Thus a full exponential observation failure remains exponential for the cavity experiment. The second-stage large-field and curvature arguments apply directly to the minors with the same constants. A union bound over the $n$ cavities now loses only a factor $n$ from exponential observation probabilities. This proves the claimed simultaneous statement on one common disorder event. It also proves a common equilibrium gap by taking $s = 0$.
  #emph[A test-independent stopping rule.] To finish, all properties tested above depend only on the observed field and finite matrices. Stable-field failure is detected by the Lipschitz residual-distance stopping construction in #cite(label("SKGap")) Corollary 5.2; the gap is a continuous finite-matrix eigenvalue. Stopping at smaller stability margins or at a gap below half the established bound gives an observation stopping time independent of the test function, with the same exponential exceptional bound. ◻
]

=== 3.3 Entropy through the product endpoint <entropy-through-the-product-endpoint>

We now combine the observation identities and posterior mean bound with entropy tensorization at the product endpoint.

At the product endpoint, the one-site entropy constants grow with the coordinate logits. We therefore need a bound on sums of their squares over every subset of sites. Its good-disorder event may depend on a fixed accuracy $delta$, unlike the posterior-gap event.

#thm([Lemma 3.3.])[
  (Subset tails for the terminal field).  #emph[There is $C < oo$, independent of $delta > 0$, such that, on events of disorder probability tending to one for each fixed $delta$, the ordinary two-stage experiment satisfies 
#[#set math.equation(numbering: n => "(3.24)")
 $ bb(P) {exists I subset \[ n \] : sum_(i in I) h_i^2 > C [\| I \| log frac(e n, \| I \|) + s]} lt.eq e^(- s) #h(2em) \( s gt.eq delta n \) . $ <eq:stat-field-tails>]

 The empty subset contributes zero. The same event and constants can be taken for all single-site cavities, with their own dimension in the formula.]
] <lem:stat-field-tails>

#proof[
  We prove a Gaussian subset bound under the planted law, transfer it to stationary sampling using the partition function, and then convert the averaged bound to one at fixed disorder. The exponential slack will also make the cavity statement simultaneous. Let $Z \( J \)$ be the partition function with counting measure on the cube. The annealed planted law has density $e^(x^(sans(T)) J x \/ 2) \/ bb(E)_J Z \( J \)$ relative to Gaussian disorder times counting measure on $x$. Under it $X$ is uniform, and, conditionally on $X$, the off-diagonal entries are independent Gaussian variables with mean $beta^2 X_i X_j \/ n$ and variance $beta^2 \/ n$. Moreover
  #[#set math.equation(numbering: n => "(3.25)")
   $ frac(bb(E)_J Z \( J \)^2, \( bb(E)_J Z \( J \) \)^2) = e^(- beta^2 \/ 2) bb(E) exp (frac(beta^2 R_n^2, 2 n)) lt.eq \( 1 - beta^2 \)^(- 1 \/ 2) \, $ <eq:stat-Z-moment>]
  where $R_n$ is the sum of $n$ independent uniform signs. The last bound follows by introducing a standard Gaussian $G$ and using $cosh t lt.eq e^(t^2 \/ 2)$: $bb(E) e^(beta^2 R_n^2 \/ \( 2 n \)) = bb(E)_G cosh \( beta G \/ sqrt(n) \)^n$. The gradient of $log Z$ in the independent standardized Gaussian coordinates has norm at most $C sqrt(n)$. Gaussian concentration and Paley–Zygmund applied to (3.25) imply
  #[#set math.equation(numbering: n => "(3.26)")
   $ log Z \( J \) - log bb(E)_J Z \( J \) = o \( n \) quad upright("in disorder probability") . $ <eq:stat-Z-comparison>]
  For clarity, Paley–Zygmund gives a fixed positive probability of $log Z gt.eq log bb(E) Z - log 2$; concentration places its mean within $O \( sqrt(n) \)$ of this level. Concentration once more proves (3.26).
  We next estimate the fields under planting. At the observation endpoint
  $ h = \( b + k \) X + J X + B_b + A_(*)^(1 \/ 2) W_1 . $
  Under planting, conditionally on $X$, $J X$ is a Gaussian vector with bounded covariance norm and a mean of bounded coordinate magnitude. On $∥∥ J lt.eq K$, the last observation noise has conditional covariance norm at most $K + k$. Thus, for a fixed subset of size $m$, Gaussian norm tails, followed by a union bound over at most $\( e n \/ m \)^m$ subsets, give an annealed bound $C_1 e^(- c_1 t)$ for violation of
  $ sum_(i in I) h_i^2 lt.eq C_2 \[ m log \( e n \/ m \) + t \] $
  simultaneously in $I$. This uses the deterministic inequality $∥z_1 + dots.h.c + z_4∥^2 lt.eq 4 sum ∥z_a∥^2$, so independence of $J X$ and $A_(*)^(1 \/ 2) W_1$ is unnecessary. Increasing $C_2$ gives any fixed desired exponential rate in $t$. Fix this increase once, before the quenched comparison below; it does not depend on $delta$.
  To return to the quenched experiment, note that the density of the planted joint spin-disorder law relative to stationary sampling with the original disorder is $Z \( J \) \/ bb(E)_J Z \( J \)$. Restrict to (3.26) with, for example, $log Z gt.eq log bb(E) Z - delta n \/ 10$. The preceding annealed bound, with ample exponential slack, therefore bounds the disorder average of the quenched failure probability at level $s$ by $e^(- 3 s)$ for $s gt.eq delta n$, once $n$ is large. Markov’s inequality and a union bound over the integer levels $s gt.eq delta n$ give a disorder exceptional probability $O \( e^(- c delta n) \)$ outside which the required conditional probability is at most $e^(- s)$. For a real $s gt.eq delta n gt.eq 1$, apply the integer estimate at $ceil.l s ceil.r$ and double the threshold constant; then $ceil.l s ceil.r lt.eq 2 s$ and $e^(- ceil.l s ceil.r) lt.eq e^(- s)$. Only the good disorder event depends on $delta$.
  For a cavity the same planted computation has parameter $beta sqrt(\( n - 1 \) \/ n) < beta$ and common constants. Alternatively extend its spin and observation experiment as in 7; the additional $exp \( C sqrt(n) \)$ factor is absorbed by the exponential slack for fixed $delta$. Taking the union over cavities still gives probability tending to one. This argument avoids a union bound over unquantified convergence in probability in (3.26): the full partition lower bound transfers to the minors with an $O \( sqrt(n) \)$ error. More explicitly,
  $ 2 Z \( J^(\( i \)) \) lt.eq Z \( J \) lt.eq 2 e^(K sqrt(n)) Z \( J^(\( i \)) \) \, #h(2em) log frac(bb(E) Z \( J \), 2 bb(E) Z \( J^(\( i \)) \)) = frac(beta^2 \( n - 1 \), 2 n) . $
  These inequalities transfer the same full lower bound to every minor at once; the remaining exponential Markov bounds tolerate the union over $i$. ◻
]

We can now combine the drift-energy identity with tensorization at the product endpoint. The subset estimate controls the field weights without paying for the largest coordinate logit.

#thm([Theorem 3.4.])[
  (Entropy-energy estimate).  #emph[There is a constant $C$ such that for each fixed $delta > 0$, on events of disorder probability tending to one, every probability $nu$ satisfies 
#[#set math.equation(numbering: n => "(3.27)")
 $ H_mu \( nu \) lt.eq C {delta n + 1 + D_mu \( nu \) (1 + sqrt(log frac(e n, D_mu \( nu \))))} . $ <eq:stat-entropy>]

 The product containing $D_mu \( nu \)$ is zero when this energy is zero. The constant $C$ is independent of $delta$ and $nu$. The assertion holds on one common event for all single-site cavities as well.]
] <thm:stat-entropy>

#proof[
  We first bound the entropy of the observation law, then the conditional entropy left at its product endpoint. The latter bound contains a term involving the original entropy, which will be absorbed only at the end.
  #emph[Entropy of the observations.] Put $D = D_mu \( nu \)$ and $H = H_mu \( nu \)$, and change the input of the two-stage experiment from $mu$ to $nu$. Let $P_t \, Q_t$ denote the ordinary and changed posteriors, and let $sigma$ be the first loss of the retained stability conditions, capped at $b + 1$. By Lemma 3.1, (3.18), (3.19),
  #[#set math.equation(numbering: n => "(3.28)")
   $ H \( bb(Q) \|_(cal(F)_sigma) divides bb(P) \|_(cal(F)_sigma) \) lt.eq C \( 1 + D \) . $ <eq:stat-stopped-H>]
  The ordinary probability of $sigma < b + 1$ is at most $C e^(- c n)$. Applying the binary entropy inequality to this stopped event gives
  $ bb(Q) { sigma < b + 1 } lt.eq C \( 1 + D \) \/ n . $
  Continue the observations even on this event. The squared difference of posterior means is always at most $4 n$, and the precision and horizon are bounded. Hence the contribution after stopping in (3.18) is at most another $C \( 1 + D \)$. The relative entropy of the complete observation laws is therefore at most $C \( 1 + D \)$.
  #emph[Entropy remaining at the product endpoint.] The observation channel is the same for the two input laws. Thus the entropy chain rule on the joint experiment reads
  #[#set math.equation(numbering: n => "(3.29)")
   $ H = H \( bb(Q) divides bb(P) \) + bb(E)_(bb(Q)) H_(P_(b + 1)) \( Q_(b + 1) \) . $ <eq:stat-entropy-chain>]
  At the product endpoint, entropy tensorization gives
  $ H_(P_(b + 1)) \( Q_(b + 1) \) lt.eq sum_i bb(E)_(\( Q_(b + 1) \)_(- i)) H_(\( P_(b + 1) \)_i) \( \( Q_(b + 1) \)_i \) . $
  This version with all other coordinates conditioned follows, for example, by the entropy chain rule and convexity of relative entropy: conditioning on more coordinates can only increase the corresponding average conditional entropy relative to a fixed coordinate law.
  For a two-point law $p$ of least atom $p_min$ and any $q$,
  #[#set math.equation(numbering: n => "(3.30)")
   $ H_p \( q \) lt.eq C \( 1 + log \( 1 \/ p_min \) \) [1 - (sum sqrt(p q))^2] . $ <eq:stat-two-point>]
  Indeed for $0 lt.eq z lt.eq 1 \/ p_min$, $z log z - z + 1 lt.eq C \( 1 + log \( 1 \/ p_min \) \) \( sqrt(z) - 1 \)^2$: the ratio has a finite limit at $z = 1$, is bounded on $\[ 0 \, 4 \]$, and for $z gt.eq 4$ is at most $C log z$. Sum this inequality with weights $p$ and use $sum p \( sqrt(q \/ p) - 1 \)^2 = 2 \( 1 - sum sqrt(p q) \) lt.eq 2 \[ 1 - \( sum sqrt(p q) \)^2 \]$. For the product law of logit $h_i$, $log \( 1 \/ p_min \) lt.eq log 2 + 2 \| h_i \|$. Define the conditional energy contributions
  $ z_i = bb(E)_(\( Q_(b + 1) \)_(- i)) [1 - (sum_(s = plus.minus 1) sqrt(\( P_(b + 1) \)_i \( s \) \( Q_(b + 1) \)_i \( s \)))^2] . $
  They satisfy $0 lt.eq z_i lt.eq 1$ and $bb(E)_(bb(Q)) sum_i z_i lt.eq D$ by (3.19). Consequently
  #[#set math.equation(numbering: n => "(3.31)")
   $ H lt.eq C \( 1 + D \) + C bb(E)_(bb(Q)) sum_i z_i \| h_i \| . $ <eq:stat-H-z>]
  #emph[The weighted field sum and absorption.] The variables $z_i$ record where the energy is spent. We use subset tails to bound their field-weighted sum without replacing the field by its maximum over sites. By 8 there is a nonnegative excess $R \( h \)$, at least $delta n$, such that simultaneously in all subsets
  $ sum_(i in I) h_i^2 lt.eq C [\| I \| log frac(e n, \| I \|) + R \( h \)] \, #h(2em) bb(P) { R \( h \) > delta n + t } lt.eq e^(- t) quad \( t gt.eq 0 \) \, $
  after a fixed increase of $C$. In particular $bb(E)_(bb(P)) e^(R \/ 2) lt.eq C e^(delta n \/ 2)$. The entropy variational inequality on the joint spin-observation laws, whose relative entropy is exactly $H$, gives
  #[#set math.equation(numbering: n => "(3.32)")
   $ bb(E)_(bb(Q)) R lt.eq C \( delta n + 1 + H \) . $ <eq:stat-excess>]
  The same conclusion follows from the observation marginal by data processing. At this stage $H$ is still unknown. Keeping it on the right side is legitimate; the square-root estimate below will allow us to absorb the resulting contribution.
  Set $z = sum_i z_i$. Layer cake for $I_t = { i : z_i > t }$ and concavity of $u mapsto u log \( e n \/ u \)$ on $\[ 0 \, n \]$ give
  $ sum_i z_i h_i^2 = integral_0^1 sum_(i in I_t) h_i^2 thin thin upright(d) t lt.eq C { z log \( e n \/ z \) + R } . $
  Thus, first by weighted Cauchy–Schwarz and then by Cauchy–Schwarz in the observation law and Jensen’s inequality,
  $ bb(E)_(bb(Q)) sum_i z_i \| h_i \| & lt.eq C bb(E)_(bb(Q)) sqrt(z) sqrt(z log \( e n \/ z \) + R)\
 & lt.eq C sqrt(D) sqrt(D log \( e n \/ D \) + delta n + 1 + H) . $
  Here $u log \( e n \/ u \)$ is increasing on $\[ 0 \, n \]$, allowing $bb(E) z lt.eq D$ to be substituted. Insert this in (3.31). The term $C sqrt(D H)$ is at most $H \/ 2 + C' D$; the term $C sqrt(D \( delta n + 1 \))$ is at most $C' D + C' \( delta n + 1 \)$. Absorbing $H \/ 2$ proves (3.27). All estimates and choices were uniform over $nu$ and the cavities. ◻
]

=== 3.4 From entropy to a fixed-time density estimate <from-entropy-to-a-fixed-time-density-estimate>

The entropy bound gives a defective logarithmic Sobolev inequality. Its energy coefficient grows slowly as the additive defect decreases. Balancing these two terms in the hypercontractive estimate will give the following bound.

#thm([Proposition 3.5.])[
  (Stretched-exponential specific density).  #emph[There are constants $C \, c \, d_(*) > 0$ such that, for each fixed $d gt.eq d_(*)$, on events of disorder probability tending to one, 
#[#set math.equation(numbering: n => "(3.33)")
 $ sup_(x \, y) log frac(S_d \( x \, y \), mu \( y \)) lt.eq C n e^(- c d^(2 \/ 3)) . $ <eq:stat-density>]

 The assertion holds on one common event for the full system and all single-site cavities. The order of the quantifiers is fixed $d$, followed by $n arrow.r oo$.]
] <prop:stat-density>

#proof[
  #emph[A defective logarithmic Sobolev inequality.] We keep the dependence on the defect parameter explicit. For $0 < eta < 1 \/ 2$, the concave function $u sqrt(log \( e n \/ u \))$ has at $u = eta n$ a tangent with slope at most $sqrt(log \( e \/ eta \))$ and intercept at most $eta n \/ 2$. Thus 9, with $delta = eta$, implies, after normalizing $f^2$ to a density,
  #[#set math.equation(numbering: n => "(3.34)")
   $ "Ent"_mu \( f^2 \) lt.eq A_eta cal(E)_mu \( f \) + B_eta mu \( f^2 \) \, quad A_eta = C \( 1 + sqrt(log \( 1 \/ eta \)) \) \, quad B_eta = C \( 1 + eta n \) . $ <eq:stat-defective-lsi>]
  The energy of the normalized density square root lies in $\[ 0 \, n \]$, as required by 9. This also proves (3.34) for signed $f$, using $cal(E)_mu \( \| f \| \) lt.eq cal(E)_mu \( f \)$.
  #emph[Hypercontractivity with the defect retained.] Use the logarithmic-Sobolev-to-hyper­contractivity argument of Gross #cite(label("Gross1975")), carrying the additive defect through the norm calculation. Let $g_t = S_t f > 0$, $p \( 0 \) = 2$, and $p' = 4 \( p - 1 \) \/ A_eta$. Reversibility gives
  $ frac(thin upright(d), thin upright(d) t) log ∥g_t∥_p = - frac(cal(E)_mu \( g_t^(p - 1) \, g_t \), mu \( g_t^p \)) + p' / p^2 frac("Ent"_mu \( g_t^p \), mu \( g_t^p \)) . $
  For $z \, u > 0$, Cauchy–Schwarz on the interval between them gives
  $ \( z^(p \/ 2) - u^(p \/ 2) \)^2 lt.eq frac(p^2, 4 \( p - 1 \)) \( z^(p - 1) - u^(p - 1) \) \( z - u \) . $
  Apply (3.34) to $g_t^(p \/ 2)$ and use this inequality edge by edge in the Dirichlet form. The energy terms cancel, leaving
  $ frac(thin upright(d), thin upright(d) t) log ∥g_t∥_(p \( t \)) lt.eq B_eta p' \( t \) \/ p \( t \)^2 . $
  Since $p \( t \) = 1 + exp \( 4 t \/ A_eta \)$ and $integral_0^t p' \/ p^2 lt.eq 1 \/ 2$, positivity and approximation give
  #[#set math.equation(numbering: n => "(3.35)")
   $ ∥S_t∥_(2 arrow.r p \( t \)) lt.eq e^(B_eta \/ 2) . $ <eq:stat-hypercontractive>]
  #emph[A pointwise kernel bound and the choice of defect.] On $∥∥ J lt.eq K$, every spin Hamiltonian has absolute value at most $K n \/ 2$, so $mu_min gt.eq e^(- \( K + log 2 \) n)$. Consequently
  $ ∥S_t∥_(2 arrow.r oo) lt.eq exp (B_eta / 2 + frac(C n, p \( t \))) . $
  Self-adjointness and the semigroup property give
  #[#set math.equation(numbering: n => "(3.36)")
   $ sup_(x \, y) frac(S_(2 t) \( x \, y \), mu \( y \)) = ∥S_(2 t)∥_(1 arrow.r oo) lt.eq ∥S_t∥_(2 arrow.r oo)^2 lt.eq exp (B_eta + frac(2 C n, p \( t \))) . $ <eq:stat-kernel-bound>]
  The equality is the elementary formula for the norm of a positive kernel with respect to $mu$.
  We now choose the defect for the prescribed fixed time $d$. Put $t = d \/ 2$ and choose $eta = exp \( - a d^(2 \/ 3) \)$, where $a > 0$ is a sufficiently small fixed constant. For $d$ large, $A_eta lt.eq C sqrt(a) thin d^(1 \/ 3)$ after adjusting the lower threshold for $d$. Hence $p \( d \/ 2 \)^(- 1) lt.eq exp \( - c_1 a^(- 1 \/ 2) d^(2 \/ 3) \)$. Choose $a$ so that $c_1 a^(- 1 \/ 2) > a$. The logarithm in (3.36) is then at most $C + C n e^(- a d^(2 \/ 3))$. For this fixed $d$ its constant term is absorbed once $n$ is sufficiently large, proving (3.33). All ingredients were common to the cavities, with their dimension $n - 1$; enlarging $C$ gives the stated common bound. ◻
]

#prodef([Remark 3.6.])[
  10 gives an arbitrarily small positive specific log-density cost by choosing a sufficiently large fixed burn-in. It does not assert a quenched estimate uniform in $d$ of order $log n$. The later block argument uses precisely this dimension-first formulation.
] <rem:stat-order>

== 4 Exact gradient evolution and finite path comparisons <sec:gradient-path>

We establish two fixed-time approximations for the later path calculus. The first truncates the exact derivative of a conditional expectation in operator norm, uniformly in the starting state. The second replaces empirical observations along finitely many paths by finite smooth simulations. Their error bounds serve different purposes: the first allows multiplication by a correlated vector, while the second identifies limiting spatial averages.

We begin with an evolution on all site-vector functions that agrees with scalar differentiation on gradients. Its likelihood expansion controls the first approximation. Mixed differences then let us differentiate functions of several stored states. Finally, density and entropy comparisons with frozen-field paths give the simulation approximation.

All intervals in this section are fixed. Constants may depend on their lengths, the number of branches, and the finite list of tests, but never on the dimension or the starting configuration. The later block argument will fix these estimates before iterating the intervals.

=== 4.1 The vector extension and its likelihood expansion <the-vector-extension-and-its-likelihood-expansion>

The derivative of a scalar observable is a site vector. We first construct an evolution on arbitrary site-vector functions which agrees with scalar differentiation on gradients. For a site vector $b$, write $D_b = "diag" \( b_1 \, dots.h \, b_n \)$. The estimates will use the disorder conditions

#[#set math.equation(numbering: n => "(4.1)")
 $ ∥∥ J_(upright("op")) lt.eq C_0 \, #h(2em) max_i sum_j J_(i j)^2 lt.eq C_0 \,\
max_(i \, j) \| J_(i j) \| = o \( 1 \) \, #h(2em) ∥J compose J - beta^2 upright(bold(1)) upright(bold(1))^t \/ n∥_(upright("op")) = o \( 1 \) . $ <eq:path-disorder>]

Here $compose$ denotes entrywise multiplication. These hold with probability tending to one. For the last assertion one may truncate $J_(i j)^2 - beta^2 \/ n$ at $C log n \/ n$. The centered symmetric matrix has variance parameter $O \( 1 \/ n \)$; the matrix exponential bound gives $∥J compose J - bb(E) \( J compose J \)∥ = O \( sqrt(log n \/ n) + log^2 n \/ n \)$ with probability tending to one. The discarded probability tends to zero by Gaussian tails, and the missing diagonal is $O \( 1 \/ n \)$. The first three assertions follow respectively from the Gaussian matrix norm bound, chi-square tails for the rows, and a union bound for entries. The same estimates underlie the independent argument in 10.

#thm([Proposition 4.1.])[
  (Exact vector extension).  #emph[On all vector-valued functions on the cube define 
#[#set math.equation(numbering: n => "(4.2)")
 $ \( cal(G) p \)_i = \( L - I \) p_i - 2 x_i sum_j a_(i j) d_j p_i + sum_j a_(i j) p_j \, #h(2em) a_(i j) = d_i m_j \, $ <eq:path-generator>]

 and let $K_t = e^(t cal(G))$. Then $d S_t f = K_t d f$. Under (4.1), uniformly in $x$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ a & = J D_v + frac(2 beta^2, n) x \( m v \)^t + o_(upright("op")) \( 1 \) \,\
∥a D_v^(- 1)∥_(upright("op")) & lt.eq C \, & max_i sum_j a_(i j)^2 / w_j & lt.eq C . $ <eq:path-a-expansion>]

 The variance factors in the second line are retained even at saturated fields; no lower bound on $v_j$ or $w_j$ is required.]
] <prop:path-gradient>

#proof[
  #emph[Intertwining.] The exact product rule is
  $ d_i \( f g \) = f thin d_i g + g thin d_i f - 2 x_i \( d_i f \) \( d_i g \) . $
  Use $L f = sum_j \( m_j - x_j \) d_j f$, $d_i^2 f = 0$, and $d_i d_j f = d_j d_i f$. Differentiation gives
  $ d_i L f = L d_i f - d_i f + sum_j a_(i j) d_j f - 2 x_i sum_j a_(i j) d_j d_i f . $
  Uniqueness of the finite-dimensional evolution proves intertwining.
  #emph[Coefficient bounds with the variance factors retained.] For $i eq.not j$, the subtraction formula for $tanh$ gives
  $ a_(i j) / v_j = frac(tanh \( 2 x_i J_(i j) \), 2 x_i { 1 - m_j tanh \( 2 x_i J_(i j) \) }) = J_(i j) + 2 x_i m_j J_(i j)^2 + O \( \| J_(i j) \|^3 \) . $
  The remainder is uniform for $\| m_j \| lt.eq 1$ and $max \| J_(i j) \| lt.eq 1 \/ 10$, including when the local conditional variance is small. Its maximum absolute row and column sums are $o \( 1 \)$, because $sum_j \| J_(i j) \|^3 lt.eq max \| J_(i j) \| sum_j J_(i j)^2$. The last condition in (4.1) proves (4.3) and the first bound in (4.3). Finally, $\| a_(i j) \| lt.eq C \| J_(i j) \| v_j$ and $v_j = w_j \( 1 + x_j m_j \) lt.eq 2 w_j$ give $v_j^2 \/ w_j lt.eq 2$. This proves the row bound. ◻
]

The weighted coefficient bounds give two controls on this extension: a pointwise energy inequality for arbitrary vector fields, and a uniform truncation of its path expansion. Both will be needed when conditional derivatives are integrated along a tree.

#thm([Proposition 4.2.])[
  (Rough propagation and path tails).  #emph[There are constants $C \, c > 0$ such that, for every vector function $p$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ \( partial_t - L \) ∥K_t p∥^2 lt.eq C ∥K_t p∥^2 - c sum_j w_j ∥d_j K_t p∥^2 . $ <eq:path-square>]

 In particular, for every starting law $nu$ and $t gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E)_nu ∥K_t p∥^2 lt.eq e^(C t) bb(E)_(nu S_t) ∥∥ p^2 . $ <eq:path-rough-L2>]

 The same assertions hold with the multiplication term $a p$ in (4.2) replaced by $z a p$, for each fixed real $z$.]
  #emph[Expand in that multiplication term. Given $H > 0$, there are $A_H \, B_H < oo$ such that, for $t gt.eq 1$, deleting terms with more than $A_H t$ insertions, and then clipping elementary likelihoods at $exp \( B_H t \)$, changes the resulting map by at most $C_H e^(- H t)$ as a map from $L^2 \( nu S_t \; bb(R)^n \)$ to $L^2 \( nu \; bb(R)^n \)$. The constants are uniform in $nu$, including point masses. Columnwise the same statement holds for Hilbert–Schmidt norms. For every fixed $t > 0$, sending the insertion cutoff and then the likelihood cap to infinity likewise gives convergence in this same all-vector-field operator bound. At $t = 0$ the map is the identity.]
] <prop:path-rough>

#proof[
  We first prove the energy inequality, then represent each row evolution by a likelihood change, and finally truncate the expansion in the multiplication term.
  #emph[Energy control.] Put $q = K_t p$ and $cal(D) \( q \) = sum_j w_j ∥d_j q∥^2$. The jump identity gives
  $ \( partial_t - L \) ∥∥ q^2 = - 2 ∥∥ q^2 + 2 q^t a q - 4 sum_(i \, j) q_i x_i a_(i j) d_j q_i - 2 cal(D) \( q \) . $
  The middle first-order term in absolute value is at most $C ∥∥ q sqrt(cal(D) \( q \))$ by (4.3). Young’s inequality absorbs one copy of $cal(D) \( q \)$; the multiplication term costs $2 ∥∥ a ∥∥ q^2$. Integrating the resulting inequality along an ordinary trajectory proves (4.5). Retaining dissipation also gives
  $ integral_0^t bb(E)_(nu S_s) sum_j w_j ∥d_j K_(t - s) p∥^2 thin upright(d) s lt.eq C_t e^(C t) bb(E)_(nu S_t) ∥∥ p^2 . $
  #emph[Likelihood representation and moments.] To control the expansion tails, represent the evolution without its multiplication term by a change of the ordinary update rules. In row $i$ replace, at attempts at $j eq.not i$, the field $H_j = \( J X \)_j$ by $H_j - 2 X_i J_(i j)$; attempts at $i$ are unmodified. The corresponding row generator is $L - 2 x_i sum_j a_(i j) d_j$. If $ell_i \[ s \, t \]$ is its likelihood relative to ordinary attempts, its semigroup, including $- I$, is
  $ \( T_(t - s) p \)_i \( x \) = e^(- \( t - s \)) bb(E)_x \[ ell_i \[ s \, t \] p_i \( X_(t - s) \) \] . $
  The site-$i$ spin is part of the ordinary trajectory; only its update #emph[rule] is left unchanged in this representation.
  The required moments come from a one-attempt calculation. Let $b_H \( sigma \) = e^(sigma H) \/ \( 2 cosh H \)$, $sigma in { - 1 \, 1 }$, and $r = b_(H + u) \/ b_H$. Taylor’s formula and $\( log cosh \)'' lt.eq 1$ show, for every fixed real $p$, that
  $ bb(E)_(b_H) r^p = exp { log cosh \( H + p u \) - p log cosh \( H + u \) + \( p - 1 \) log cosh H } lt.eq e^(C_p u^2) . $
  For a rate-one clock at $j$, the compensator of the $p$-th likelihood moment is therefore at most $C_p J_(i j)^2$; the largest entry is small. The exponential martingale formula gives, conditionally on any past,
  #[#set math.equation(numbering: n => "(4.6)")
   $ bb(E) \[ ell_i \( I \)^p divides upright("past at the first interval") \] lt.eq exp \( C_p \| I \| \) \, $ <eq:path-likelihood-moment>]
  where $I$ is any fixed union of intervals and $\| I \|$ is its total length. Negative powers are allowed. All fields and starting states are covered by the same constants.
  #emph[Truncating insertions and then likelihoods.] Rowwise Cauchy–Schwarz gives $∥T_h p \( x \)∥^2 lt.eq e^(C h) S_h ∥∥ p^2 \( x \)$. Writing $A$ for multiplication by $a$, the term with $k$ insertions is
  #[#set math.equation(numbering: n => "(4.7)")
   $ integral_(0 < t_1 < dots.h.c < t_k < t) T_(t_1) A T_(t_2 - t_1) A dots.h.c A T_(t - t_k) p thin thin upright(d) t_1 dots.h.c thin upright(d) t_k . $ <eq:path-Duhamel>]
  Repeated rowwise Cauchy–Schwarz and the Markov property bound its $L^2$ norm by $e^(C t) C^k t^k \/ k !$ times the terminal $L^2$ norm. Consequently
  $ sum_(k > A t) e^(C t) frac(\( C t \)^k, k !) lt.eq e^(C t) (frac(e C, A))^(A t) \( 1 - e C \/ A \)^(- 1) \, $
  which is at most $C_H e^(- H t)$ when $A$ is sufficiently large. Once this insertion cutoff is fixed, only finitely many likelihood intervals remain in each term. For clipping, with any fixed $r > 0$,
  $ bb(E) \[ ell_i^2 upright(bold(1))_(ell_i > e^(B t)) divides upright("past") \] lt.eq e^(- r B t) bb(E) \[ ell_i^(2 + r) divides upright("past") \] lt.eq e^(- r B t + C_(2 + r) t) . $
  Apply this estimate at the first clipped interval, use the ordinary second-moment bounds elsewhere, and sum over at most $A t + 1$ intervals and the simplex. Increasing $B$ after $A$ proves the stated bound. For fixed $t > 0$ and a prescribed error, choose a finite insertion cutoff making the factorial-series tail sufficiently small. Then choose a likelihood cap controlling the finitely many retained terms, using the displayed moment estimate. This convergence does not require $t gt.eq 1$; that restriction was used only in the stated exponential-in-time tail formulation. Every estimate sums over columns, which proves the matrix version. ◻
]

=== 4.2 Mixed differences and conditional derivative matrices <mixed-differences-and-conditional-derivative-matrices>

A multitime calculation is a function of several stored spin states. Integrating a terminal observation introduces two arguments for its parent: the already stored state and the starting state of the new conditional expectation. If these arguments are denoted by $y \, z$, their identification obeys

$ d_j \[ G \( y \, z \) \|_(z = y) \] = [d_j^y G + d_j^z G - 2 y_j d_j^y d_j^z G]_(z = y) . $

The last term is a mixed difference. Separate first-derivative bounds in each state slot therefore do not close under this operation.

We retain the finite collection of tensors with at most one derivative in each distinct slot. Two elementary estimates below control their products and smooth compositions, after which 16 carries the collection through conditioning. The spatial indices of these tensors are reduced to path matrices in 33.

Let $F : \( { - 1 \, 1 }^n \)^m arrow.r bb(R)^n$, with state slots $x^(\( 1 \)) \, dots.h \, x^(\( m \))$. For a nonempty $I subset.eq \[ m \]$ define

#[#set math.equation(numbering: n => "(4.8)")
 $ \( T_I F \)_(i \, \( j_a : a in I \)) = product_(a in I) d_(j_a)^(\( a \)) F_i \, #h(2em) C_I \( F \) = sup_(x^(\( 1 \)) \, dots.h \, x^(\( m \))) ∥T_I F∥_(upright("op")) . $ <eq:path-mixed-norm>]

All derivative indices are columns of this rectangular matrix; its only row index is the output site. Equivalently, $C_I \( F \)$ bounds the Euclidean norm of the complete mixed-difference tensor of $c^t F$ by $C_I \( F \) ∥∥ c$ for every deterministic output vector $c$. No bound on the unnormalized Euclidean norm of $F$ is imposed. Coordinate caps, when needed for labels, are recorded separately.

#thm([Lemma 4.3.])[
  (Products and repeated squares of tensor entries).  #emph[Let $B_l$ have $n$ rows and columns indexed by $j_(S_l)$, where the nonempty sets $S_l$ cover $I$, and suppose $∥B_l∥_(upright("op")) lt.eq b_l$.Then 
#[#set math.equation(numbering: n => "(4.9)")
 $ ∥(product_l B_l \( i \, j_(S_l) \))_(i \, j_I)∥_(upright("op")) lt.eq product_l b_l . $ <eq:path-tensor-product>]

 If a rectangular matrix $R$ satisfies 
#[#set math.equation(numbering: n => "(4.10)")
 $ \| R_(i \, j_I) \| lt.eq C \| B_0 \( i \, j_(S_0) \) \|^2 product_(l gt.eq 1) \| B_l \( i \, j_(S_l) \) \| \, $ <eq:path-square-domination>]

 with the same covering condition, then $∥∥ R_(upright("op")) lt.eq C b_0^2 product_(l gt.eq 1) b_l$. The coefficient implicit in the domination may depend arbitrarily on all indices.]
] <lem:path-tensor-product>

#proof[
  #emph[Products.] First assign independent column indices to every factor. Their rowwise tensor product is obtained from $⨂_l B_l$ by restricting its output to the diagonal copy of $bb(R)^n$, an operator of norm one. Next require all occurrences of a slot to have the same index. The map
  $ e_(j_I) mapsto ⨂_l e_(j_(S_l)) $
  is an isometry, since the sets $S_l$ cover $I$. This proves (4.9). There is no absent, freely repeated column index that could contribute a dimension factor.
  #emph[An entrywise square and arbitrary bounded coefficients.] For the second assertion put $A = \| B_0 \|^2$ entrywise. Its maximum row sum and maximum column sum are at most $b_0^2$, hence the rectangular Schur test gives $∥∥ A_(upright("op")) lt.eq b_0^2$. For any two matrices $A \, B$ with the same output rows, their rowwise tensor product satisfies
  $ ∥A ⊗_(upright("row")) B∥_(upright("op")) lt.eq ∥∥ A_(upright("op")) max_i ∥"row"_i \( B \)∥_2 . $
  For example, factor it as $D_B \( A ⊗ I \)$, where $\( D_B z \)_i = sum_b B_(i b) z_(i \, b)$; the norm of $D_B$ is the displayed maximum. Apply this repeatedly to $A$ and the absolute values of the other factors, whose row Euclidean norms are at most $b_l$. Restrict repeated column indices by the same isometry as before. Finally entrywise domination implies $\| u^t R v \| lt.eq C \| u \|^t P \| v \|$ for the nonnegative dominating matrix $P$. Taking unit-vector suprema proves the assertion. ◻
]

#thm([Lemma 4.4.])[
  (Mixed-slot bounds for finite smooth calculations).  #emph[Consider a fixed finite calculation whose inputs are finitely many state slots and fixed site labels. Its operations are bounded-operator linear maps on the site index, finite linear combinations, and smooth componentwise functions with globally bounded derivatives of every positive order. Bounded coordinate products may be used through a fixed smooth extension outside their bounded ranges. Then every nonempty tensor in (4.8) has a dimension-independent bound. The constants depend on the calculation, the linear operator bounds, and finitely many scalar derivative bounds. They are uniform in fixed past labels whenever those displayed bounds are uniform. Linear-query values themselves need not be uniformly bounded.]
] <lem:path-mixed-tensors>

#proof[
  For spin inputs and fixed labels, the tensors are explicit: a spin input in slot $a$ has $T_({ a }) = I$ and every other nonempty tensor zero, while a fixed label has all nonempty tensors zero. Linear maps and sums preserve the claimed bounds. The remaining task is closure under smooth componentwise functions. We use an exact corner expansion so that no compact-range assumption is imposed on a linear query.
  First consider $F_i = phi.alt \( z_i \)$. Fix $I$, $\| I \| = r$, and a derivative tuple $j_I$. For every nonempty $S subset.eq I$ put
  $ t_S = \( - 2 \)^(\| S \|) (product_(a in S) x_(j_a)^(\( a \))) \( T_S z \)_(i \, j_S) . $
  If the indicated coordinate is flipped in each slot of $B subset.eq I$, the exact cube identity is
  #[#set math.equation(numbering: n => "(4.11)")
   $ z_i \( x^B \) = z_i \( x \) + sum_(diameter eq.not S subset.eq B) t_S . $ <eq:path-corner-increments>]
  Temporarily regard the $2^r - 1$ increments as independent scalar variables. Repeated use of the fundamental theorem of calculus gives, for any set $V$ of increments,
  #[#set math.equation(numbering: n => "(4.12)")
   $ phi.alt (z + sum_(S in V) t_S) = sum_(A subset.eq V) (product_(S in A) t_S) integral_(\[ 0 \, 1 \]^A) phi.alt^(\( \| A \| \)) (z + sum_(S in A) theta_S t_S) thin upright(d) theta . $ <eq:path-anchored-expansion>]
  The empty term is $phi.alt \( z \)$. Apply this with $V = { S : diameter eq.not S subset.eq B }$ and take the alternating sum over $B subset.eq I$ defining $T_I$. A term survives exactly when
  #[#set math.equation(numbering: n => "(4.13)")
   $ union.big_(S in A) S = I . $ <eq:path-covering>]
  Indeed, otherwise summing over a missing slot cancels the term. The remaining normalization is $2^(- r)$ and a product of column signs.
  Every surviving monomial thus contains enough increments to cover all derivative slots. Its coefficient may still depend on the derivative indices, so the product estimate alone is not yet sufficient. Expand that integral coefficient once at $z$:
  $ integral phi.alt^(\( \| A \| \)) (z + sum_(S in A) theta_S t_S) thin upright(d) theta = phi.alt^(\( \| A \| \)) \( z \) + sum_(S in A) t_S R_(A \, S) \( z \, t \) \, #h(2em) \| R_(A \, S) \| lt.eq ∥phi.alt^(\( \| A \| + 1 \))∥_oo . $
  This is an exact integral remainder. The first term is a bounded row coefficient times a product of tensors satisfying (4.13), so (4.9) applies. The remainder acquires a second copy of an increment already present in its monomial. It is therefore dominated by a product with one squared tensor factor, and (4.10) applies, even though its coefficient depends on every derivative index. There are finitely many terms.
  For a componentwise function of $q$ scalar inputs $z^1 \, dots.h \, z^q$, introduce increments $t_(b \, S)$ for every channel $b$ and nonempty $S subset.eq I$. Apply the same anchored expansion in these $q \( 2^r - 1 \)$ formal variables. The surviving monomials again cover $I$, and expanding each coefficient once repeats an increment already in that monomial. Bounded mixed scalar derivatives through order $q \( 2^r - 1 \) + 1$ suffice at this gate. The same two estimates prove the claim. Induction over the fixed calculation completes the proof. ◻
]

#thm([Lemma 4.5.])[
  (Conditional derivative matrices).  #emph[Let $F$ be a finite multitime site-vector calculation satisfying the mixed-slot bounds of 15. Evaluate it on a fixed finite ordinary path tree, condition at one joining state $x$, and hold the realized past fixed. Write $A \( x \) = d_x bb(E)_x F$, with output as row and derivative index as column. There are common finite Duhamel and likelihood truncations $A_M$ such that 
#[#set math.equation(numbering: n => "(4.14)")
 $ sup_x ∥A \( x \) - A_M \( x \)∥_(upright("op")) arrow.r 0 . $ <eq:path-conditional-op>]

 The assertion is uniform over stored parameters with uniform mixed-slot bounds. In particular, for any vector $u$, possibly depending on the joining state and stored past, 
#[#set math.equation(numbering: n => "(4.15)")
 $ ∥D_u \( A - A_M \)∥_(upright("HS")) lt.eq ∥A - A_M∥_(upright("op")) ∥∥ u . $ <eq:path-row-weighted-error>]

 The same statement holds on an added stationary reverse branch. Actual and predictor contributions may use identical subdivisions and common truncations, and are recombined before a centering test.]
] <lem:path-conditional-derivative>

#proof[
  We integrate one leaf at a time. The propagation bound controls the evolving derivative slot, while the mixed tensors retain the derivatives in every stored slot. After writing this as a finite linear recursion, we use one common truncation of each evolution operator.
  #emph[Propagation with auxiliary derivative indices.] The point-start bounds in 13 are
  #[#set math.equation(numbering: n => "(4.16)")
   $ ∥K_h q \( x \)∥ & lt.eq B_h { S_h ∥∥ q^2 \( x \) }^(1 \/ 2) \,\
∥\( K_h - K_(h \, M) \) q \( x \)∥ & lt.eq epsilon_(h \, M) { S_h ∥∥ q^2 \( x \) }^(1 \/ 2) \, #h(2em) epsilon_(h \, M) arrow.r 0 . $ <eq:path-amplified-tail>]
  They amplify to any auxiliary Euclidean space by applying them to each component and summing squares. In particular the other derivative indices of $T_I F$ can all be retained as Hilbert coordinates without a dimension factor. The truncation is one common linear operator, not a choice depending on an output test vector.
  #emph[Integrating a leaf and identifying its parent.] Integrate a final observed slot $m$ from its parent slot $p$ over an interval of length $h$. Let $y$ denote all slots other than $m$. Before identifying the parent and the evolving starting state, set
  $ G \( y \, z \) = S_h \[ w mapsto F \( y \, w \) \] \( z \) \, #h(2em) H \( y \) = G \( y \, z \) \|_(z = y^(\( p \))) . $
  The two occurrences of the parent are independent arguments of $G$. The copy identity at the start of this subsection gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ d_j^(\( p \)) H = [d_j^(\( p \)) G + d_j^z G - 2 y_j^(\( p \)) d_j^(\( p \)) d_j^z G]_(z = y^(\( p \))) . $ <eq:path-copy-difference>]
  All other frozen-slot differences commute with $S_h$ and $K_h$. For $p in.not I$, the resulting tensor is simply $S_h T_I F$ restricted to $z = y^(\( p \))$. If $p in I$ and $I' = I \\ { p }$, its three terms are respectively
  #[#set math.equation(numbering: n => "(4.18)")
   $ S_h T_I F \, #h(2em) K_h T_(I' union { m }) F \, #h(2em) - 2 D_(y^(\( p \))) thin sans(R)_(j_m = j_p) K_h T_(I union { m }) F . $ <eq:path-copy-tensors>]
  The sign multiplier in the last term acts on the derivative index. In the last two terms $K_h$ acts only on the slot-$m$ derivative coordinate; all other indices are auxiliary Hilbert coordinates. The restriction $sans(R)_(j_m = j_p)$ is a coordinate restriction within that Hilbert space, hence has norm one. It never identifies an output row with an input column across the chosen flattening.
  We can now estimate the three terms without changing the tensor flattening. Fix a deterministic output vector $c$ and apply the transpose of each tensor to $c$. Jensen for $S_h$ and (4.16) give
  #[#set math.equation(numbering: n => "(4.19)")
   $ C_I \( H \) lt.eq C_I \( F \) + B_h C_(I' union { m }) \( F \) + 2 B_h C_(I union { m }) \( F \) quad \( p in I \) \, $ <eq:path-copy-bound>]
  and $C_I \( H \) lt.eq C_I \( F \)$ otherwise. Taking the supremum over $c$ after these deterministic inequalities proves the operator bounds. Only one difference per original slot occurs. Iterate this finite elimination along a path, or remove leaves of a finite causal tree. Other branches can be held as parameters during each leaf integration. If the original calculation does not use the joining state, adjoin it as a dummy slot. Its initial difference tensors are zero. Reversibility makes a stationary reverse edge another use of the same $S_h$.
  #emph[One truncation for the complete derivative matrix.] The leaf elimination is a finite linear recursion on the family of mixed tensors. Open that recursion and replace each $K_h$ by the same chosen $K_(h \, M)$ at every occurrence with that interval. Ordinary $S_h$ expectations may remain exact. Each step has the bounded norm in (4.19); replacing one step costs at most the corresponding $epsilon_(h \, M)$ from (4.16). Telescoping the finitely many steps gives (4.14). This approximates the derivative of the exact conditional expectation. It does not assume that $A_M$ is the derivative of a separately approximated scalar message, and no operator supremum is moved through an expectation.
  #emph[Weighted errors and recombination.] Finally, $∥D_u E∥_(upright("HS"))^2 = sum_i \| u_i \|^2 ∥"row"_i \( E \)∥^2$ proves (4.15) pointwise. The recursion and the common truncation are linear in the endpoint observables; therefore actual and predictor terms can be recombined before the centered label is used. Opening their ordinary conditional expectations as causal branches is done only after these uniform norm errors have been removed. ◻
]

=== 4.3 Admissible trees and the order of limits <admissible-trees-and-the-order-of-limits>

We have controlled conditional derivatives pointwise. To compare the path observables themselves, we must specify which conditional path laws and weights are allowed. The following definition keeps each new branch attached at a single endpoint.

#prodef([Definition 4.6.])[
  (Finite tree tests).  A stationary path tree has finitely many edges of fixed finite lengths. Choose a root state with law $mu$ and run independent ordinary heat-bath paths outwards along the edges. Reversibility permits an edge to be read in either direction. A nonstationary tree is obtained from a forward path whose initial density $h$ satisfies $log ∥∥ h_oo = o \( n \)$, and by making finitely many conditional copies of portions at a shared #emph[single endpoint], using their actual conditional laws. No new branch is conditioned on both of its endpoints.
  A test has a fixed finite list of times and a fixed polynomial bound $n^M$. Its weight $W_n$ satisfies $\| W_n \| lt.eq n^M$ and $bb(E) \| W_n \| lt.eq C$. A bounded test assertion is called typical if it holds in expectation with every such weight, on disorder events of probability tending to one. One may pass to subsequences and successive finite approximations. The exponent $M$, all times, the tree, and each approximation are fixed before $n arrow.r oo$.
] <def:path-tree>

The definition also covers weighted squared norms: the weight can be $∥∥ u^2$ when $u$ is polynomially bounded with bounded mean square. Statements involving integrated auxiliary times mean integration over a fixed finite-measure parameter set first. They do not permit choosing a worst parameter from an exceptional set of measure zero.

#thm([Lemma 4.7.])[
  (Transfer to actual conditional trees).  #emph[A stationary tree event of probability $e^(- c n)$ has negligible weighted probability in 17. The same holds for a finite family of such events and for exponentially small integrated bad mass in a fixed finite-measure parameter space.]
] <lem:path-tree-transfer>

#proof[
  Forward evolution preserves the density bound. Reverse conditioning introduces denominators, so we first remove joining states where those denominators are too small. All forward marginals have relative density at most $e^(o \( n \))$, since $S_t$ is a positive $L^oo \( mu \)$ contraction. A reverse conditional edge from time $t$ to $s$ has, relative to the stationary reverse edge, the factor $h_s \( X_s \) \/ h_t \( X_t \)$. Discard endpoints where $h_t < e^(- delta n)$. Their actual marginal probability is at most $e^(- delta n)$, and their polynomially weighted probability vanishes. The remaining joint density on a tree with $r$ reverse edges is at most $exp { o \( n \) + r delta n }$. Choose $delta < c \/ \( 2 r + 2 \)$ and compare probabilities. The same calculation after Fubini proves the integrated assertion. For a finite tree with more than one original marginal, apply this argument successively at each copying operation. ◻
]

=== 4.4 Two comparisons with frozen fields <two-comparisons-with-frozen-fields>

Freezing the field over each mesh bin makes its conditional endpoint law a product measure. We will need both a bound on the log density relative to this reference and a sharper entropy bound for empirical tests. Choose a mesh containing all observation and branching times. On a mesh bin $\[ s \, s + h \]$, its frozen-field law keeps the fields $J X_s$ fixed while independent rate-one clocks refresh the sites. Conditional on $X_s$, the endpoint law is a product measure: site $i$ remains at its old value with probability $e^(- h)$ and otherwise has law $b_(\( J X_s \)_i)$. In particular its probability of changing is at most $h$.

All reference laws below are conditional on the fixed disorder. Let $P$ be the stationary ordinary marked-attempt law on the chosen root-directed tree: its root has law $mu$, and child paths are conditionally independent ordinary evolutions. Let $P_h$ have the same root law and tree factorization, with fields frozen separately in each mesh bin. Stationary reversal identifies the ordinary reference on a reversed edge; an actual nonstationary reverse edge still uses its actual conditional law. For a bin $b$ of length $delta_b$, the endpoint kernel of $P_h$ is the product measure

#[#set math.equation(numbering: n => "(4.20)")
 $ pi_b \( x \, thin upright(d) y \) = ⨂_(i = 1)^n [e^(- delta_b) delta_(x_i) \( thin upright(d) y_i \) + \( 1 - e^(- delta_b) \) b_(\( J x \)_i) \( thin upright(d) y_i \)] . $ <eq:path-frozen-product-law>]

Thus $P_h$ is a tree path law and $pi_b \( x \, dot.op \)$ is one of its conditional endpoint laws. Each coordinate of the latter has minority mass at most $delta_b lt.eq h$.

Write $Q$ for a retained, normalized admissible actual tree law, including a permitted nonnegative polynomial weight and conditioning on an event of polynomially significant probability. For a bounded test, a weighted part with total mass below $n^(- 1)$ is negligible before normalization; all other normalizers are at least inverse polynomial. Signed weights are split into positive and negative parts. All superpolynomial discards are made on the original actual forward marginals before forming $Q$.

#thm([Lemma 4.8.])[
  (Density and entropy comparisons).  #emph[Fix a time horizon and a finite tree. For sufficiently small fixed mesh size $h$, the following comparisons hold.]
  #emph[First, after events of probability smaller than every fixed inverse power of $n$ have been discarded on each actual forward marginal, the log density between actual and frozen paths, read in the tree-rooted direction, is at most $kappa \( h \) n + o \( n \)$ in absolute value, where $kappa \( h \) arrow.b 0$.]
  #emph[Second, for spatial empirical tests one has the stronger entropy estimate 
#[#set math.equation(numbering: n => "(4.21)")
 $ H \( Q divides P_h \) lt.eq C_T h n + o \( n \) \, $ <eq:path-mesh-entropy>]

 after the prescribed count and field truncations. Here $P_h$ is the frozen tree law. The law $Q$ is an admissible actual tree law, with the polynomial weights of 17, possibly conditioned on an event of probability at least $n^(- M)$ for fixed $M$. The superpolynomial discards are made first on its original forward marginals. On the retained set its additional entropy relative to the stationary comparison is $o \( n \)$. Truncation errors vanish for this class in the successive order $n arrow.r oo$, cutoff $arrow.r oo$ at fixed $h$, then $h arrow.b 0$. For use at a fixed $h$ the cutoff is chosen so that its entropy error is at most $h n$.]
] <lem:path-two-mesh>

#proof[
  We first compare absolute log densities on retained forward and reverse bins. We then retain the quadratic log-likelihood cost to obtain the sharper entropy estimate. In both arguments the exceptional events are discarded on the original forward marginals before forming the weighted conditional law.
  #emph[The forward log-density bound.] Write $Delta \( u \) = J \( X_u - X_s \)$ in a bin starting at $s$, and let $N_(i \, b)$ be its attempt counts. On a fixed mesh, Poisson exponential bounds imply, with exponential accuracy,
  #[#set math.equation(numbering: n => "(4.22)")
   $ sup_(u in b) ∥X_u - X_s∥^2 lt.eq C h n \, #h(2em) sup_(u in b) ∥Delta \( u \)∥^2 lt.eq C h n . $ <eq:path-bin-square>]
  The log ratio at an attempt at $i$ is bounded by $2 \| Delta_i \|$. For a bounded predictable integrand the compensated attempt sum obeys
  $ bb(P) \( M gt.eq a \) lt.eq exp #h(-0.16667em) (- frac(a^2, 2 \( V + b a \/ 3 \))) \, $
  where $V$ bounds its predictable bracket and $b$ its jumps. Apply this after cutting $\| Delta_i \|$ at $B$, then use $sum_i \| Delta_i \| lt.eq sqrt(n) ∥Delta∥$ for its compensator. The bounded part costs $O_T \( sqrt(h) \) n$. For the remaining part, $sum_i Delta_i^2 lt.eq C h n$ bounds the compensator by $C h n \/ B$. Its individual jumps are $O \( sqrt(n) \)$, its bracket is $O_T \( n \)$, and the displayed inequality makes a fixed positive multiple of $n$ an event of superpolynomially small probability. This proves the forward density comparison.
  #emph[Reversed bins.] For a reversed bin separate the forward within-bin difference from $J \( X_(s + h) - X_s \)$. The latter vector has norm $O \( sqrt(h n) \)$. Its entries larger than $B$ occupy at most $C h n \/ B^2$ sites. Independently of how this set is selected, the sum of $N_(i \, b)^2$ over such a set is bounded by the sum of the largest $C h n \/ B^2$ squared Poisson counts. For each fixed $h$, truncating counts at a level $K$ gives
  $ sum_(i in I) N_(i \, b)^2 lt.eq K^2 \| I \| + sum_i N_(i \, b)^2 upright(bold(1))_(N_(i \, b) > K) = o_B \( h n \) $
  with superpolynomial accuracy, by first choosing $K$ and then $B$. Cauchy–Schwarz bounds the across-bin excess by $o_B \( h n \)$. The bounded part has exponential stationary tails by reversibility. Discard the excess on each actual edge in its original forward direction, before applying 18 to the bounded part. Summing the finitely many bins proves the first assertion.
  #emph[The entropy of the retained actual tree.] For the entropy assertion, first compare $Q$ with $P$. Let $c_n = o \( n \)$ bound the logarithms of the original forward marginal densities. Discard reverse joining states with marginal density below $e^(- a_n)$, where $a_n = o \( n \)$ and $a_n \/ log n arrow.r oo$. Their actual marginal probabilities are at most $e^(- a_n)$ and remain negligible under the permitted polynomial weights. On the retained set, the reverse density factors $h_s \( X_s \) \/ h_t \( X_t \)$ bound the total tree log density by $C \( c_n + a_n \)$. Polynomial reweighting and retained event normalization add $O \( log n \)$. Thus $H \( Q divides P \) = o \( n \)$. The change of reference is exactly
  #[#set math.equation(numbering: n => "(4.23)")
   $ H \( Q divides P_h \) = H \( Q divides P \) + bb(E)_Q log frac(thin upright(d) P, thin upright(d) P_h) . $ <eq:path-entropy-reference>]
  #emph[Changing to the frozen reference.] The root laws cancel in the last ratio, leaving the root-directed within-bin refresh log ratios. The absolute estimate already proved would lose the desired factor $h$. We instead keep the quadratic log-cosh remainder. Conditional on the old configuration, the Kullback–Leibler divergence between two refresh coins at fields $H$ and $H + u$ is at most $u^2 \/ 2$. Consequently its predictable integral over all bins is at most
  $ C integral_0^T ∥J \( X_u - X_(floor.l u floor.r_h) \)∥^2 thin upright(d) u lt.eq C_T h n $
  on (4.22). For the centered log likelihood $M$ with field differences cut at $B$, stop when (4.22) fails. Its jumps are bounded by $C B$ and its predictable bracket is at most $C_T h n$: the conditional variance of a refresh log ratio is at most a constant times the squared field difference. The bounded-jump exponential martingale inequality therefore gives
  $ log bb(E)_P e^(theta M) lt.eq C_T theta^2 h n \, #h(2em) \| theta \| B lt.eq c . $
  Apply the entropy inequality $bb(E)_Q M lt.eq theta^(- 1) { H \( Q divides P \) + log bb(E)_P e^(theta M) }$ with fixed positive $theta lt.eq c \/ \( 1 + B \)$. At fixed $h \, B$, the additional $o \( n \)$ entropy costs $o \( n \)$, and the centered term costs $O_T \( h n \)$. The same estimate for $- M$ gives the reverse bound. It remains to remove the field cutoff. For the unbounded excess use the preceding forward compensator bound and the reversed-bin count bound. At fixed $h$ its normalized entropy contribution tends to zero with the cutoff; choose it below $h$ before taking the next mesh limit. Conditioning on any retained event of polynomially significant probability adds $O \( log n \)$ entropy. All superpolynomial discards remain negligible under the permitted polynomial weights and polynomially significant conditioning. An arbitrary $o \( n \)$-entropy tilt would not have this property and is not being allowed here. The chain rule over the finite tree, with the same argument on every root-directed edge, proves (4.21). ◻
]

The absolute-density estimate is sufficient for subsequent Gaussian operator comparisons. It is not sufficient for refining empirical path tests. The extra factor $h$ in (4.21) supplies that refinement through the next elementary product estimate.

#thm([Lemma 4.9.])[
  (Rare-update product concentration).  #emph[Let $pi$ be a product measure on ${ - 1 \, 1 }^n$ such that each coordinate has minority probability at most $h < 1 \/ 4$. If $sup_x ∥d F \( x \)∥ lt.eq B \/ sqrt(n)$, then 
#[#set math.equation(numbering: n => "(4.24)")
 $ log bb(E)_pi e^(theta \( F - bb(E)_pi F \)) lt.eq frac(C B^2 theta^2, n log \( 1 \/ h \)) . $ <eq:path-product-mgf>]

 Consequently, for every $Q lt.double pi$, 
#[#set math.equation(numbering: n => "(4.25)")
 $ \| bb(E)_Q F - bb(E)_pi F \| lt.eq frac(C B, sqrt(n log \( 1 \/ h \))) sqrt(H \( Q divides pi \)) . $ <eq:path-product-entropy>]

]
] <lem:path-product>

#proof[
  We prove a two-point entropy estimate and then tensorize it. The small minority mass enters through the factor $log \( 1 \/ p \)$; keeping that factor is what makes the subsequent mesh refinement converge.
  #emph[One coordinate.] For a nondegenerate Bernoulli coordinate let its minority mass be $p in \( 0 \, 1 \/ 4 \]$, put $L_p = log \( 1 \/ p \)$, and set $Lambda_p \( t \) = log \( 1 - p + p e^t \) - p t$. For $\| t \| lt.eq L_p \/ 2$,
  $ Lambda''_p \( t \) = frac(p \( 1 - p \) e^t, \( 1 - p + p e^t \)^2) lt.eq C sqrt(p) lt.eq C \/ L_p . $
  Since $Lambda_p \( 0 \) = Lambda'_p \( 0 \) = 0$, Taylor’s formula gives $Lambda_p \( t \) lt.eq C t^2 \/ L_p$ in this range. Outside it, $Lambda_p \( t \) lt.eq \| t \| lt.eq 2 t^2 \/ L_p$. Jensen also gives $Lambda_p \( t \) gt.eq 0$.
  If a two-point function $G$ has values $a \, a + t$, with the second value on the minority atom, direct calculation yields
  $ frac("Ent"_p \( e^G \), bb(E)_p e^G) = t Lambda'_p \( t \) - Lambda_p \( t \) . $
  Convexity at $t$, evaluated at $2 t$, gives $t Lambda'_p \( t \) lt.eq Lambda_p \( 2 t \) - Lambda_p \( t \)$ for either sign of $t$. Consequently
  #[#set math.equation(numbering: n => "(4.26)")
   $ frac("Ent"_p \( e^G \), bb(E)_p e^G) lt.eq Lambda_p \( 2 t \) - 2 Lambda_p \( t \) lt.eq frac(C t^2, log \( 1 \/ p \)) . $ <eq:path-bernoulli-entropy>]
  This obtains the entropy inequality by convexity, without differentiating a bound on $Lambda_p$. A deterministic coordinate contributes zero entropy.
  #emph[Tensorization and the exponential-moment bound.] Apply (4.26) conditionally with $G = theta F$ and $\| t \| = 2 \| theta d_i F \|$. Entropy tensorization gives
  $ "Ent"_pi \( e^(theta F) \) lt.eq frac(C theta^2, log \( 1 \/ h \)) bb(E)_pi [e^(theta F) sum_i \( d_i F \)^2] lt.eq frac(C B^2 theta^2, n log \( 1 \/ h \)) bb(E)_pi e^(theta F) . $
  For $psi \( theta \) = log bb(E)_pi e^(theta F)$ this bounds $theta psi' \( theta \) - psi \( theta \)$. Integrate the derivative of $psi \( theta \) \/ theta$ from zero to obtain (4.24); use $- F$ for negative $theta$.
  #emph[Changing the product law.] Finally, the entropy variational inequality gives
  $ theta \( bb(E)_Q F - bb(E)_pi F \) lt.eq H \( Q divides pi \) + frac(C B^2 theta^2, n log \( 1 \/ h \)) . $
  Optimize over $theta > 0$ and apply the same argument to $- F$. This proves (4.25). ◻
]

#thm([Proposition 4.10.])[
  (Finite simulations and endpoint predictors).  #emph[Every bounded smooth empirical test of finitely many states on an admissible tree has the same limiting value as successively finer, finite smooth simulations from the corresponding endpoint states. For a single observation interval and a test with difference norm $B \/ sqrt(n)$, the error is at most 
#[#set math.equation(numbering: n => "(4.27)")
 $ frac(C_T B, sqrt(log \( 1 \/ h \))) + o_n \( 1 \) . $ <eq:path-simulation-error>]

 The statement holds for replicated conditional tests, using the same predictor approximation on each copy. A linear query of bounded smooth outputs may be included after clipping; its spatial square tails are uniformly negligible in the successive approximation limits.]
] <prop:path-simulation>

#proof[
  We first compare one terminal test under the actual and autonomous frozen laws. This requires two telescopes with a common ordinary semigroup reference. We then treat stored states by backward leaf elimination and smooth each fixed simulation.
  #emph[The actual-law telescope.] Choose a regular $h$-mesh augmented by the finitely many prescribed observation times, so that $0 = t_0 < dots.h.c < t_N = T$, $delta_b = t_b - t_(b - 1) lt.eq h$, and $N lt.eq C_T \/ h$. First consider one terminal test $F$, with $sup_x ∥d F \( x \)∥ lt.eq B \/ sqrt(n)$, and put
  $ f_b = S_(T - t_b) F \, #h(2em) sans(P)_b \( x \, dot.op \) = S_(delta_b) \( x \, dot.op \) . $
  The point-start bound in 13 gives $sup_x ∥d f_b \( x \)∥ lt.eq C_T B \/ sqrt(n)$. Project $Q$ and $P_h$ to the mesh states and put $q_b \( dot.op divides cal(F)_(b - 1) \) = Q \( X_(t_b) in dot.op divides cal(F)_(b - 1) \)$, where $cal(F)_(b - 1) = sigma \( X_(t_0) \, dots.h \, X_(t_(b - 1)) \)$. The entropy chain rule and data processing give
  $ sum_(b = 1)^N bb(E)_Q H #h(-0.16667em) (q_b \( dot.op divides cal(F)_(b - 1) \) divides pi_b \( X_(t_(b - 1)) \, dot.op \)) lt.eq H \( Q divides P_h \) lt.eq C_T h n + o \( n \) . $
  The omitted initial-state entropy is nonnegative. Since $f_(b - 1) = sans(P)_b f_b$, the exact telescope is
  #[#set math.equation(numbering: n => "(4.28)")
   $ bb(E)_Q F \( X_T \) - bb(E)_Q S_T F \( X_0 \) = sum_(b = 1)^N bb(E)_Q \[ \( q_b - sans(P)_b \) f_b \] . $ <eq:path-actual-telescope>]
  Both kernels on the right are evaluated at the actual joining history; $sans(P)_b$ depends on it only through $X_(t_(b - 1))$. Insert $pi_b$ between them and apply 20 separately to $q_b$ and $sans(P)_b$. The second entropy has the uniform bound
  $ H \( sans(P)_b \( x \, dot.op \) divides pi_b \( x \, dot.op \) \) & lt.eq H \( upright("ordinary bin path from ") x divides upright("frozen bin path from ") x \)\
 & lt.eq C integral_0^(delta_b) bb(E)_x ∥J \( X_u - x \)∥^2 thin upright(d) u lt.eq C n delta_b^2 . $
  The first inequality is data processing, the second is the refresh-coin log-cosh bound, and the last uses $bb(E)_x ∥X_u - x∥^2 lt.eq 4 n u$ and the bound on $∥∥ J$. In particular it holds for every joining-state law. Writing $H_b$ for the sum of these two conditional entropies yields
  $ \| bb(E)_Q F \( X_T \) - bb(E)_Q S_T F \( X_0 \) \| & lt.eq frac(C_T B, sqrt(n log \( 1 \/ h \))) sum_(b = 1)^N bb(E)_Q sqrt(H_b)\
 & lt.eq frac(C_T B, sqrt(n log \( 1 \/ h \))) sqrt(N sum_(b = 1)^N bb(E)_Q H_b) lt.eq frac(C_T B, sqrt(log \( 1 \/ h \))) + o_n \( 1 \) . $
  Here dimension tends to infinity at fixed $h$.
  #emph[The autonomous frozen-law telescope.] Let $hat(P)_h$ be the autonomous frozen simulation started from the same initial law $Q_0$. The second, zero-tilt telescope is
  #[#set math.equation(numbering: n => "(4.29)")
   $ bb(E)_(hat(P)_h) F \( X_T \) - bb(E)_(Q_0) S_T F \( X_0 \) = sum_(b = 1)^N bb(E)_(hat(P)_h) \[ \( pi_b - sans(P)_b \) f_b \] . $ <eq:path-frozen-telescope>]
  Its conditional kernels equal $pi_b$, so their entropy relative to $pi_b$ is zero. The ordinary-kernel entropies still sum to at most $C n sum_b delta_b^2 lt.eq C_T h n$, uniformly in $Q_0$. Consequently this second difference is at most $C_T B \/ sqrt(log \( 1 \/ h \))$. Since $bb(E)_Q S_T F \( X_0 \) = bb(E)_(Q_0) S_T F \( X_0 \)$, the triangle inequality proves (4.27), after enlarging $C_T$, for the difference between the actual and frozen tests.
  #emph[Stored states and admissible conditioning.] Stored parameters may be included by writing the test as $F \( y \, x \)$ with the same derivative bound uniformly in $y$. Disintegrate the reference tree at the joining state and the passive variables $y$. The active future must retain its ordinary, respectively frozen, Markov kernels under that reference law. Past variables and other branches conditionally independent at the joining state have this property. Conditioning on a later endpoint of the active branch generally does not. The conditional entropy of the active future is bounded by the total tree entropy by the chain rule, so both telescopes apply after averaging over $\( y \, X_0 \)$, and the simulation retains their joint initial law. A backwards leaf elimination gives precisely these admissible disintegrations. For replicated predictions the other copies are passive and the test bound is uniform in their realized values.
  #emph[Smoothing a fixed simulation.] A fixed frozen simulation is a finite calculation using $J$, independent site clocks and uniforms, and scalar threshold maps. Replace each threshold by a smooth transition in a strip of width $epsilon$. Fresh uniforms put at most $O \( epsilon \)$ mass in that strip. Induction over finitely many operations, using the bound on $∥∥ J$, shows that the normalized mean square error tends to zero. Derivative constants of the resulting simulation can depend on its fixed mesh and smoothing width.
  #emph[Backward replacement and derivative control.] Replace the last observed state first. The smooth simulation produces a new smooth test of earlier states. Fix that calculation and its finite derivative constants before choosing the accuracy at the next earlier replacement. At a branch, duplicate the branching state as an input to the child calculations. For replicated predictions, hold all other copies as passive parameters while replacing one copy; the conditional entropy chain rule bounds its cost. Thus its derivative constant depends only on its own currently fixed test, not on the accuracy subsequently selected for a passive copy. This backwards, nested construction avoids requiring constants uniform over all meshes.
  For clarity, the derivative bound for a fixed smooth recipe follows without any probabilistic assertion. If a vector $z$ has bounded half-difference matrix, then, off its diagonal,
  $ d_j phi.alt \( z_i \) = phi.alt' \( z_i \) d_j z_i + O \( \| d_j z_i \|^2 \) . $
  The absolute row and column sums of the error are bounded by the squared operator norm of that matrix. Keep its diagonal exact. The Schur estimate in 14 and induction give a bounded derivative matrix. A normalized empirical inner product has difference norm $O \( n^(- 1 \/ 2) \)$ by the product rule. The remaining assertion concerns square tails of linear queries. Test such a tail with a smooth excess function whose second derivative is bounded and whose first derivative is at most $C \( 1 + \| z \| \)$. The same Taylor calculation, using bounded column square sums, gives a difference bound independent of the tail cutoff. For each fixed simulation Gaussian regression gives square integrability and vanishing square tails. The uniform comparison just proved then transfers this assertion to the original paths. ◻
]

== 5 Gaussian calculus on finite path trees <sec:gaussian-calculus>

We now pass from finite path calculations to the limiting Hilbert space used in the spectral formula. The construction must also control the action of path matrices on vectors orthogonal to that space. These are two different approximation problems. Spatial square-mean estimates determine the limiting recipes, but they cannot discard a diagonal supported on a vanishing fraction of sites: that diagonal may still have operator norm one. We therefore retain such diagonal actions in the operator representation and keep the two error norms separate throughout the argument.

=== 5.1 Recipes, conditional prediction, and hidden vectors <recipes-conditional-prediction-and-hidden-vectors>

Begin with the spin vector, constant vectors, and a fixed countable collection of independent $"Uniform" \[ 0 \, 1 \]$ site seed arrays. A #emph[recipe] is a finite calculation from these inputs, using multiplication by $J$, finite linear combinations, and bounded smooth componentwise functions with bounded derivatives. When its output represents a direction, we include the normalization $n^(- 1 \/ 2)$. An unbounded linear output is admitted through spatial square-mean approximation, provided its square tails are uniformly negligible.

The seed convention is fixed at this point. Sample the arrays independently of $J$ and extract them once in a typical realization for the countably many calculations being considered. Conditional simulations use independent additional seeds. Choose a countable dense family of scalar functions and coefficients; this makes the eventual completion separable. Deterministic Gram limits then give an isometry on the named recipes between completions from different typical realizations of the same seed law. In particular, the family of seed generators stays fixed during the construction.

Allowing finitely many observed states and site seeds on a tree of 17 gives a path recipe. A #emph[path label] is a bounded site function obtained from such a finite calculation, from a capped elementary likelihood, or from a successive tracial approximation of either. Here tracial approximation means that, with the coordinate caps fixed,

$ 1 / n sum_i \| d_i - tilde(d)_i \|^2 arrow.r 0 $

in the successive limits: first dimension, then approximation accuracy. This controls spatial averages; it does not make the associated diagonal matrices close in operator norm. A #emph[path matrix] is a fixed word, or a finite linear combination of words, in $J$ and the corresponding diagonal labels. The class also contains bounded finite-rank dyads of path recipe vectors and their successive operator-norm limits. We call these dyads #emph[visible].

Every elementary likelihood has a fixed cap when it enters this algebra. Removing that cap later uses 13; it requires no operator-norm approximation of an unbounded likelihood.

The theorem below has two kinds of conclusion. Its empirical and prediction assertions construct the limiting recipe space. Its operator assertions control matrix words on vectors orthogonal to that space, while keeping diagonal actions at exceptional sites. The contraction rule in those assertions averages a returning pair as $J D J mapsto beta^2 tau \( D \) I$, where $tau \( D \)$ is the limiting normalized trace. Complete noncrossing contractions repeat this operation until no matrix edge remains; a diagonal entry retains its outer site label instead of averaging that label. The creation representation and the general contraction rule are constructed below.

#thm([Theorem 5.1.])[
  (Finite-tree Gaussian calculus).  #emph[Fix $0 < beta < 1$, a finite tree, a finite collection of words and recipes, and fixed caps on its diagonal labels. Dimension is taken to infinity before any recipe accuracy, mesh, cap, or time limit. The following assertions hold in the typicality convention of 17.]
  + #emph[Stationary recipe overlaps, normalized traces, and joint empirical averages have deterministic limits. The completion of one-state recipes for the limiting inner product is a separable real Hilbert space $cal(H)$. Conditional means of path recipes at a chosen endpoint have approximations in $cal(H)$. The same stationary predictors work on actual conditional trees: centered copies sharing that endpoint have vanishing spatial pair overlaps.]
  + #emph[If $u_n$ is measurable at that endpoint, $bb(E) ∥u_n∥^2 lt.eq C$, $∥u_n∥ lt.eq n^M$, and 
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E) \| u_n^t b_n \|^2 arrow.r 0 quad upright("for every endpoint recipe ") b_n \, $ <eq:path-hidden>]

 then $u_n$ is orthogonal in this same squared sense to all bounded path recipe vectors. Multiplication by bounded path words preserves this assertion, with the transpose placed on the other vector as necessary. Such vectors will be called #emph[hidden].]
  + #emph[On the complement of visible dyads, joint limiting word inner products of hidden vectors are represented on a Hilbert space with $J \/ beta = s = ell + ell^(*)$ and 
#[#set math.equation(numbering: n => "(5.2)")
 $ ell^(*) D ell = tau \( D \) I . $ <eq:path-creation>]

 Here $tau$ is the limiting spatial state on the diagonal algebra. The representation retains an arbitrary bounded base action of every diagonal, including types of zero limiting proportion. A single representation suffices for all the finitely many vectors and words on the fixed tree. No compatible choice between different trees is asserted.]
  + #emph[Normalized traces are given by complete noncrossing contractions. For a word $Q$, let $Delta \( Q \)$ be its complete contraction with the outer diagonal unaveraged. Then 
#[#set math.equation(numbering: n => "(5.3)")
 $ max_i \| Q_(i i) - Delta \( Q \)_i \| arrow.r 0 \, #h(2em) max_(i eq.not j) \| Q_(i j) \| arrow.r 0 . $ <eq:path-entry-prediction>]

 For two bounded path matrices, 
#[#set math.equation(numbering: n => "(5.4)")
 $ Q compose R = D_(Delta \( Q \) Delta \( R \)) + V + o_(upright("op")) \( 1 \) \, $ <eq:path-hadamard>]

 where $V$ is in the operator-norm closure of bounded visible dyads.]
  + #emph[Bounded clipped likelihood labels admit tracial $L^2$ approximations by fixed finite smooth multitime calculations satisfying the mixed-slot bounds of 15, with observation times inside their path span. One-sided endpoint approximations are allowed. When only spin observations are used, the likelihood is the flip-rate likelihood. Predictors of these labels mean predictors of these tracial approximants in successive limits, with the same cap.]
  + #emph[Smooth site-recipe difference matrices, their bounded products, and matrices with column $j$ evaluated at $x^j$ belong to the same operator closure. Their off-diagonal difference entries vanish uniformly. Conditional expected derivative matrices have the stronger pointwise truncation property in 16 for those fixed smooth calculations. Their opened derivative terms reduce to path matrices by 33.]
  #emph[For two independent stationary roots in the same disorder, the limiting spin, field, and bounded likelihood histories at a uniformly sampled site are independent copies. This last assertion is restricted to these spin-generated histories. It is not asserted for arbitrary noncentered recipes or recipes sharing site seeds.]
] <thm:path-calculus>

The proof first constructs empirical limits and endpoint predictors, then supplies the likelihood labels. We next prove the norm comparison for deterministic diagonals, including rare types, and transfer it to path labels by completing the conditional Gaussian matrix. Entrywise and derivative calculations finish the operator closure. All Gaussian matrices below have off-diagonal variance $1 \/ n$ unless a factor $beta$ is displayed.

#thm([Lemma 5.2.])[
  (Planting and finite adaptive regression).  #emph[A fixed finite frozen simulation and a fixed finite list of subsequent recipe queries have deterministic empirical limits with exponentially small deviations at every fixed positive accuracy. Conditional on all the queried columns, the unrevealed Gaussian matrix is an independent Gaussian orthogonal ensemble (GOE) matrix compressed to their orthogonal complement. The revealed part is a bounded sum of dyads of calculation vectors.]
] <lem:path-regression>

#proof[
  We first transfer exponential estimates to a Gaussian experiment in which the initial spin is planted. Under the annealed one-replica weight, the initial spin $sigma$ is uniform and the off-diagonal disorder has the form
  $ J = beta G + beta^2 / n sigma sigma^t + upright("a diagonal correction") \, $
  where $G$ is independent GOE. The correction from its Gaussian diagonal has norm tending to zero. Its mean shift on the diagonal has norm $O \( 1 \/ n \)$. The Gibbs-to-planted comparison loses only $e^(o \( n \))$: indeed
  $ frac(bb(E) Z^2, \( bb(E) Z \)^2) lt.eq C_beta bb(E) exp #h(-0.16667em) (frac(beta^2 R_n^2, 2 n)) lt.eq C'_beta \, $
  where $R_n$ is a sum of iid signs. Gaussian concentration of $log Z$ and Paley–Zygmund then give $log Z - log bb(E) Z = o \( n \)$ in probability. Thus an annealed exponential failure transfers to an exponentially small Gibbs failure on a high-probability disorder event. This calculation explains why the planting comparison remains valid throughout $beta < 1$.
  We can now describe exactly which randomness remains after a query. Let $U$ have orthonormal columns, put $P = I - U U^t$, and suppose $Y = G U$ has been revealed. Symmetry gives $U^t Y = Y^t U$. The conditional matrix is
  #[#set math.equation(numbering: n => "(5.5)")
   $ G = Y U^t + U Y^t - U \( U^t Y \) U^t + P G' P \, $ <eq:path-regression-formula>]
  with $G'$ a fresh GOE independent of the revealed sigma-field. To verify independence, test the GOE covariance
  $ bb(E) \[ G_(i j) G_(k l) \] = n^(- 1) \( delta_(i k) delta_(j l) + delta_(i l) delta_(j k) \) $
  against a matrix supported in $P bb(R)^n$ and against each revealed column. The covariance is zero. Joint Gaussianity proves independence, and the displayed revealed part is the unique symmetric completion with those columns and zero $P$–$P$ block.
  Conditional Gaussian regression along iterative spin-glass calculations also underlies Bolthausen’s construction of TAP solutions #cite(label("Bolthausen2014")) Sections 2–3 of the arXiv version. Here it is used for finite causal path simulations and their extra recipe queries; the required empirical and operator conclusions are proved separately. The same formula applies adaptively. Given previous answers, normalize the residual of the next query to a unit vector $q in P bb(R)^n$. Its new perpendicular answer has law $n^(- 1 \/ 2) \( P - q q^t \) g$, and its component along $q$ has law $sqrt(2 \/ n) thin z q$, with $g \, z$ independent standard Gaussians. After this answer the remaining compression is again independent. Projection coefficients are empirical inner products of previous calculation vectors. Thus every fixed finite recursion reduces to iid site Gaussians and seeds, finitely many empirical scalar coefficients, and finitely many rank corrections.
  It remains to control the finite recursion uniformly at a fixed accuracy. For bounded smooth tests, iid empirical concentration and Gaussian quadratic tails propagate through each successive query. If a query residual has length tending to zero, omit that query; the spectral bound makes the normalized square error vanish. Equivalently, fix a residual-length threshold, propagate its deterministic error through the finite recursion, and send the threshold to zero only after the dimension limit. Fresh uniform thresholds are continuity tests. They can therefore be smoothed and the smoothing subsequently removed without changing the limits. This proves deterministic empirical convergence with exponentially small failure at each fixed positive tolerance. ◻
]

#thm([Lemma 5.3.])[
  (Conditional prediction and replica orthogonality).  #emph[Assertions (i) and (ii) of 22 hold. They remain valid after adjoining a fixed finite list of bounded path-matrix operations.]
] <lem:path-prediction>

#proof[
  We first construct the limiting inner product, then identify conditional means in its completion. Apply Proposition 4.10, Lemma 5.2 to successively fixed smooth simulations. The comparison error in (4.27) makes their empirical limits Cauchy. If a deviation had polynomially significant probability, conditioning on it would cost only $O \( log n \)$ extra entropy. The same comparison would then force the original limit on that event, a contradiction. Apply this argument to the weight-normalized tilted laws to obtain the weighted typical assertions. The limiting Gram matrices are positive semidefinite; their quotient by the null space, followed by completion, defines $cal(H)$.
  For the second step, let $z$ be a path recipe and put $m \( X_0 \) = bb(E) \[ z divides X_0 \]$ on the stationary rooted tree. Replace the future by a fixed finite smooth simulation and average its seeds. An average of $R$ independent seed copies has spatial $L^2$ error at most $C \/ R$ from that simulated conditional mean. At each fixed $R$, it is a one-state recipe under the seed convention above. To compare it with the actual $m$, expand the squared error into $∥∥ m^2$, its cross term with the simulation, and the simulation’s squared norm. Realize these three terms on two independent branches sharing $X_0$, with the same nested approximation on both copies. 21, applied while the other branch is passive, controls each term and proves the conditional mean-square approximation. They also give
  $ n^(- 1) sum_i \( z_i^(\( 1 \)) - m_i \) \( z_i^(\( 2 \)) - m_i \) arrow.r 0 $
  for distinct branches; here the $z_i$ are written without the normalizing factor. Reversibility identifies stationary reverse predictors, and 18 plus the finite-simulation comparison gives the same pair centering on actual conditional trees.
  The remaining assertion is orthogonality to a path recipe. Let $u$ satisfy (5.1) and use $R$ centered replicas $z^(\( r \)) - m$. Their Gram matrix tends, conditionally in the typical weighted sense, to a bounded diagonal matrix. Bessel’s inequality therefore gives
  $ sum_(r = 1)^R \| u^t \( z^(\( r \)) - m \) \|^2 lt.eq ∥∥ u^2 ∥"Gram" \( z^(\( 1 \)) - m \, dots.h \, z^(\( R \)) - m \)∥ . $
  All summands have the same expectation; divide by $R$, take dimension large, and then send $R arrow.r oo$. The $m$ term vanishes by recipe approximation and (5.1). For a matrix word $Q$, $Q^t z$ is another path calculation with negligible square tails after clipping its linear outputs. The same argument applied to it proves the last assertion. ◻
]

=== 5.2 Recovering likelihood labels from spin observations <recovering-likelihood-labels-from-spin-observations>

We next express a bounded likelihood label using finitely many spin observations, so that it belongs to the recipe construction above. The elementary likelihood in this subsection is the flip-rate Radon–Nikodym derivative. A marked-attempt likelihood is used only when its path law or terminal projection is explicitly specified.

#thm([Lemma 5.4.])[
  (Tracial likelihood approximation).  #emph[Assertion (v) of 22 holds, on each edge in its original forward direction, and therefore for the joint tests used in that theorem.]
] <lem:path-likelihood-approximation>

#proof[
  Let $c_j \( x \) = \( 1 - x_j tanh H_j \) \/ 2$ be the flip rate. Its logarithmic field derivatives are uniformly bounded: the first is $- x_j - m_j$, and the next two are bounded functions of $m_j$. For row $i$ the field perturbation at $j$ is $u_(i j) = - 2 x_i J_(i j)$ on its specified interval mask. The flip likelihood has logarithm
  $ sum_j integral log c_j^(\( i \)) / c_j thin upright(d) N_j - sum_j integral \( c_j^(\( i \)) - c_j \) thin upright(d) s . $
  Expand this logarithm in $J_(i j)$. The linear term is a centered score, the quadratic term is its bracket/compensator contribution, and the remaining terms have absolute expectation at most $C_T sum_j \| J_(i j) \|^3 = o \( 1 \)$, uniformly in $i$. Higher moments are controlled by (4.6). Both the score integrands and the coefficients of $J_(i j)^2$ are bounded smooth site functions. We may consequently cap the exponential at a fixed continuity value, or use a smooth cap, with arbitrarily small spatial square-mean loss.
  Freeze the bounded integrands on short bins. A bin with two or more attempts at one site has probability $O \( h^2 \)$; summing its squared Poisson counts shows that ignoring all such bins costs $O_T \( h \)$ in normalized mean square. On the remaining bins the spin values at the two ends determine whether a flip occurred. Bounded derivatives, (4.22), count truncation, and predictable rate averaging show that freezing the field-dependent integrands also has vanishing normalized mean-square cost. Multiplication by $J$ preserves that cost.
  The preceding freezing estimate still leaves the outside row-spin factor $x_i \( s \)$. Freeze this factor at the beginning of its bin. The resulting error is a vector martingale, with row-$i$ bracket bounded by
  $ C integral upright(bold(1))_({ x_i \( s \) eq.not x_i \( floor.l s floor.r_h \) }) thin upright(d) s . $
  The total bracket trace is $O_T \( h n \)$ on the Poisson count event, while the operator norm of its bracket density is bounded by $C ∥∥ J^2$. A vector jump is bounded in Euclidean norm. Apply the scalar bounded-jump inequality to its squared norm, stopped at a fixed multiple of $sqrt(n)$: its jumps are $O \( sqrt(n) \)$ and its bracket is $O_T \( n \)$. For every fixed tolerance exceeding the $O \( h \)$ bracket trace, failure has superpolynomially small probability. Thus the fraction of rows with a significant score error tends to zero with arbitrary polynomial accuracy. Bracket terms need only absolute rate averaging. Use a finer inner mesh when approximating integrands inside a bin whose outside factor has already been frozen.
  After these error estimates, the retained score can be written as a finite calculation from observed spins. On a bin $\[ s \, t \]$, set $X = X_s$, $Y = X_t$, $h = t - s$, and freeze $m = m \( X \)$ and $v = v \( X \)$. The first log-rate derivative is $- X_j - m_j$; outside the negligible multiple-flip bins,
  $ Delta N_j = \( 1 - X_j Y_j \) \/ 2 \, #h(2em) \( - X_j - m_j \) Delta N_j = \( Y_j - X_j - m_j + m_j X_j Y_j \) \/ 2 . $
  Since $\( - X_j - m_j \) c_j = - X_j v_j \/ 2$, the vector of frozen row scores is
  #[#set math.equation(numbering: n => "(5.6)")
   $ D_X J { X - Y + m - m X Y - h X v } \, $ <eq:path-frozen-score>]
  where products inside braces are componentwise. In particular the mixed query $J \( m X Y \)$ is retained. It need not be a finite sum of sitewise products of single-time outputs. Quadratic bracket terms are finite calculations using $J compose J$ and bounded site factors; this matrix has bounded operator norm and bounded absolute row sums. Their values are therefore uniformly bounded at each fixed mesh.
  For the cap of the exponential, choose a smooth bounded function $psi$ of the logarithmic score, with globally bounded derivatives, which agrees with the desired clipped exponential outside an arbitrarily small smoothing interval. An outside spin multiplying an unbounded query is handled by its two sign cases, not by assuming the map $\( a \, u \) mapsto psi \( a u \)$ has bounded derivatives for arbitrary bounded $a$ and unbounded $u$. Explicitly,
  #[#set math.equation(numbering: n => "(5.7)")
   $ psi \( x_i U_i \) = sum_(epsilon = plus.minus 1) frac(1 + epsilon x_i, 2) thin psi \( epsilon U_i \) . $ <eq:path-score-signs>]
  For finitely many bins, split the finite sign pattern of all the frozen outside row spins. Each summand is a bounded product of spin selectors and a smooth cap applied to a fixed signed linear combination of the mixed $J$ queries and the bounded quadratic terms. All scalar coefficient bounds are global, independently of the query values. Products of already bounded factors have smooth bounded extensions. Thus 15 applies to every fixed capped calculation, including all its mixed temporal slots.
  Fix the mesh, smoothing, sign decomposition, and cap before taking the dimension limit. When these choices are subsequently refined, their derivative constants may grow. The refinement removes the spatial approximation errors established above; it makes no claim that derivatives of those errors converge. Observation times can be strictly inside their bins, and can be chosen one-sidedly at endpoints. For predictors first take these fixed calculations, then their exact stationary conditional means. Conditional expectation contracts spatial $L^2$; replicated pair tests and 21 give the one-state recipe approximation. When an exact predictor is differentiated, use its fixed multitime calculation on an added stationary causal branch and apply 16. The opened tensors are treated by 33. No score estimate on an artificial reverse branch with a tilted endpoint, and no derivative estimate for a tracial approximation error, is used. ◻
]

=== 5.3 Fixed words and their Fock norm <fixed-words-and-their-fock-norm>

The creation and annihilation representation and noncrossing contractions use standard free-probability constructions; see Nica and Speicher #cite(label("NicaSpeicher2006")) Lectures 7 and 22. Strong convergence of random-matrix polynomials has a related general form in Male #cite(label("Male2010")) Theorem 1.6. That theorem concerns independent Gaussian unitary ensemble (GUE) matrices and an independent auxiliary matrix family. The auxiliary family must already converge almost surely in normalized trace and operator norm for every $*$-polynomial, with a faithful limiting trace. Here the matrices are real symmetric, and zero-frequency diagonal types remain in the norm comparison. We prove the required version locally, including those types, before transferring it to adaptive path labels.

For this construction, bin the joint values of the finitely many bounded diagonals into $q$ types. Write $p_a$ for their limiting proportions, set $cal(D) = bb(R)^q$, and put $tau \( d \) = sum_a p_a d \( a \)$. For a Hilbert space $cal(B)$ carrying a bounded representation $rho$ of $cal(D)$, set

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(F)_(tau \, cal(B)) = cal(B) xor xor.big_(r gt.eq 1) L^2 \( cal(D) \, tau \)^(⊗ r) ⊗ cal(B) . $ <eq:path-fock-space>]

A diagonal acts by $rho$ on the base and by multiplication on the first letter elsewhere. Define $ell xi = 1 ⊗ xi$. Then $ell$ is an isometry and (5.2) holds. If $p_a = 0$, the type disappears from the letter space but may act nontrivially on $cal(B)$. For upper norm comparisons take a faithful base containing every type. The choice of multiplicity of a base type does not affect polynomial norms.

A Wick string of degree $k$ with coefficient tensor $F$ is defined by linearity from the words

$ D_(a_0) s D_(a_1) dots.h.c s D_(a_k) \, #h(2em) F = F \( a_0 \, dots.h \, a_k \) \, $

by subtracting their internal adjacent returning pairs. Equivalently, use inclusion and exclusion over sets of disjoint adjacent edge pairs, each contraction replacing its middle diagonal by its trace. In the representation (5.8), its expansion consists of the $k + 1$ cuts with creations before the cut and annihilations after it. For example,

$ W \( a_0 \, a_1 \, a_2 \) = D_(a_0) s D_(a_1) s D_(a_2) - tau \( a_1 \) D_(a_0 a_2) . $

An ordinary word is a sum of Wick strings obtained by noncrossing contractions; the endpoints of each unpaired string stay unaveraged.

#thm([Lemma 5.5.])[
  (Fixed-word norm comparison).  #emph[Let $G_n$ be GOE, independent of a fixed finite family of deterministic bounded diagonals with convergent joint type proportions. For every fixed matrix polynomial $P$ in these diagonals and $G_n$, 
#[#set math.equation(numbering: n => "(5.9)")
 $ limsup_(n arrow.r oo) ∥P \( G_n \, D \)∥_(upright("op")) lt.eq ∥P \( s \, D \)∥_(cal(F)_(tau \, cal(B))) quad upright("in probability") . $ <eq:path-fock-domination>]

 The assertion includes zero limiting type proportions with their base actions retained. At every fixed tolerance $0 < a lt.eq 1$, its failure probability is at most $2 exp \( - c n a^2 \/ L^2 \)$ for sufficiently large $n$, where $L gt.eq 1$ depends only on the fixed word, coefficient caps, and spectral cutoff, and not on the smallest positive type proportion.]
] <lem:path-fock-norm>

#proof[
  The norm proof has three stages: types of positive proportion, rare coordinate types, and a concentration estimate uniform in the type counts. We begin with the first stage. Every finite-dimensional Wick contraction uses the empirical trace $tau_n = n^(- 1) "Tr"$, so that internal returning pairs cancel exactly. During the moment calculation, $p_a$ means the empirical type proportion and $tau$ still means the limiting state. Suppose first that $p_a gt.eq alpha > 0$ for every type. If every limiting proportion is positive, this holds eventually after decreasing $alpha$. For a homogeneous Wick string $W_F$ of degree $k$, use the product-state norm
  $ ∥∥ F_2^2 = sum_(a_0 \, dots.h \, a_k) p_(a_0) dots.h.c p_(a_k) \| F \( a_0 \, dots.h \, a_k \) \|^2 . $
  For $k = 0$ the string is diagonal and has norm at most $alpha^(- 1 \/ 2) ∥∥ F_2$, so the preliminary bound below is immediate. Assume henceforth in the moment calculation that $k gt.eq 1$. Let $r$ be even and consider $n^(- 1) bb(E) "Tr" \( \( W_F^(*) W_F \)^(r \/ 2) \)$. Gaussian pairings glue the $r k$ sides of a polygon in either orientation. There are $E = r k \/ 2$ paired edges; if $V$ is the number of free index vertices, set $e = E - V + 1 gt.eq 0$. A connected gluing contributes $n^(- e)$ times a type average. The two GOE covariance terms are precisely the two possible band orientations, including their multiplicities for a loop.
  Internal immediate untwisted returns cancel. Indeed selecting a specified pair of adjacent edges and applying their covariance gives exactly the trace contraction subtracted in the Wick definition. Inclusion and exclusion over disjoint pairs cancels every diagram with at least one such internal return. Hence every degree-one vertex of a surviving graph lies at a boundary of one of the $r$ strings. There are at most $r$ leaves, and the degree identity gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_v \( deg \( v \) - 2 \)_(+) lt.eq r + 2 e . $ <eq:path-map-degree>]
  We need a diagram count whose loss grows polynomially with the word degree. Suppress every chain of degree-two vertices, keeping one vertex for a pure circle. By (5.10), the remaining core has $s lt.eq C \( r + e \)$ edges. Delete the $e$ edges outside a spanning tree. Reversing local cyclic orders at vertices untwists all tree bands, and a rooted plane tree on $s - e$ edges has at most $4^s$ encodings. Reinsert the deleted bands in ordered corner slots. Their endpoints, order, and twist signs have at most $\( C s + C \)^(C e + C)$ choices. Subdividing the core edges and choosing the rooted boundary start adds a factor at most
  $ C r k binom(r k + s, s) . $
  Using $s lt.eq C \( r + e \)$, assign the $O \( r \)$ core edges to the factor $\( C \( 1 + k \) \)^(C r)$ and the additional $O \( e \)$ edges to $\( C r k \)^(C e + C)$. Thus the number of diagrams of excess $e$ is at most
  #[#set math.equation(numbering: n => "(5.11)")
   $ \( C \( 1 + k \) \)^(C r) \( C r k \)^(C e + C) . $ <eq:path-map-count>]
  Loops, parallel bands, and the pure-circle case are included by the same encoding. No factor exponential in $r k$ remains: tree-band twists were removed by vertex reversal, and only the $e$ extra bands carry independent twist choices.
  The count must now be combined with a bound for each type average. Delete $e$ nontree edges. At most $2 e$ strings cross these edges; bound each of them by
  $ ∥∥ F_oo lt.eq alpha^(- \( k + 1 \) \/ 2) ∥∥ F_2 . $
  Every remaining string is a simple tree path, since a repeated tree edge would force an internal immediate return. To count repeated type variables, let $c_v$ be the number of remaining string occurrences at vertex $v$, and let $b_v$ count their endpoints there. Each internal occurrence uses two edge incidences and each endpoint uses one. As each paired edge has at most two occurrences, $2 c_v - b_v lt.eq 2 deg \( v \)$, using the degrees of the original graph. Thus (5.10) and $sum_v b_v lt.eq 2 r$ give
  $ sum_v \( c_v - 2 \)_(+) lt.eq sum_v \( deg \( v \) - 2 \)_(+) + 1 / 2 sum_v b_v lt.eq 2 r + 2 e . $
  Replace each occurrence beyond two by a fresh independent type variable. For a nonnegative summand the comparison costs at most $alpha^(- 1)$ per replacement: an equality constraint can increase a product-state integral by at most the inverse of its smallest atom. Each remaining variable occurs at most twice, never twice within one tensor. Successive coordinate Cauchy–Schwarz therefore bounds the product integral by one $∥∥ F_2$ per surviving string. Altogether a diagram is bounded by
  #[#set math.equation(numbering: n => "(5.12)")
   $ n^(- e) alpha^(- 2 r - \( k + 3 \) e) ∥∥ F_2^r . $ <eq:path-map-weight>]
  We can now sum the diagram bounds. Choose an even $r$ of order $log n$, keeping $k \, alpha$ fixed. Equations (5.11) and (5.12) give
  $ n^(- 1) bb(E) "Tr" \( \( W_F^(*) W_F \)^(r \/ 2) \) lt.eq \( C_alpha \( 1 + k \) \)^(C r) ∥∥ F_2^r \( C r k \)^C sum_(e gt.eq 0) {frac(\( C r k \)^C alpha^(- \( k + 3 \)), n)}^e . $
  The sum is eventually at most two. Markov’s inequality for the trace power, increasing the constant in $r \/ log n$ if necessary, proves
  #[#set math.equation(numbering: n => "(5.13)")
   $ limsup ∥W_F∥_(upright("op")) lt.eq C_alpha \( 1 + k \)^C ∥∥ F_2 . $ <eq:path-wick-preliminary>]
  The strategy of obtaining a polynomial word-length norm bound and then removing its loss by taking powers has an antecedent in Haagerup #cite(label("Haagerup1979")) Lemmas 1.3–1.4, pp. 283–286. His setting is free-group convolution; the Wick/GOE diagram bound, rare-type treatment, and adaptive-label passage here are proved locally. To turn this preliminary estimate into the sharp comparison, decompose a degree-$k$ polynomial into homogeneous Wick strings. Complete noncrossing pairing identifies the sum of their squared tensor norms with the vacuum square norm. Cauchy–Schwarz and (5.13) therefore bound the matrix norm by $C_alpha \( 1 + k \)^(C + 1) ∥P \( s \, D \)∥$. Apply that bound to $\( P^(*) P \)^m$, whose degree is $2 m k$. Since $parallel \( P^(*) P \)^m parallel = parallel P parallel^(2 m)$ in both representations, it gives
  $ limsup parallel P \( G_n \, D \) parallel_(upright("op")) lt.eq { C_alpha \( 1 + 2 m k \)^(C + 1) #scale(x: 120%, y: 120%)[}]^(1 \/ \( 2 m \)) parallel P \( s \, D \) parallel . $
  Letting $m arrow.r oo$ removes the polynomial loss. For each fixed polynomial and each fixed power, there are only finitely many empirical contraction coefficients, and they converge to the coefficients formed with $tau$. The difference of the resulting matrix polynomials is $o \( 1 \)$ in operator norm on every fixed spectral ball. Thus empirical and limiting Wick conventions have the same norm limit. Dimension is sent to infinity before the power is increased; no rate for $tau_n arrow.r tau$ is required. This proves (5.9) when all types have positive proportion.
  The positive-proportion case is complete. We next keep the coordinate space of the rare types instead of discarding it. Write this space as $R_n$, with dimension $m_n = o \( n \)$, and split
  $ G_n = mat(delim: "(", B_n, V_n; V_n^(*), C_n) quad upright("on ") R_n^perp xor R_n . $
  The internal rare block has norm $o \( 1 \)$. Conditional on the bulk block and its deterministic diagonals, $V_n$ has independent $N \( 0 \, 1 \/ n \)$ entries. For every fixed bounded bulk word $A_n$, Gaussian quadratic-form concentration, polarization, and a net of size $exp \( O \( m_n \) \)$ imply
  #[#set math.equation(numbering: n => "(5.14)")
   $ ∥V_n^(*) A_n V_n - tau \( A \) I_(R_n)∥_(upright("op")) arrow.r 0 . $ <eq:path-rare-gram>]
  Indeed a unit-vector quadratic form has variance $O \( 1 \/ n \)$ and fixed accuracy tail $e^(- c n)$, while the net entropy is $o \( n \)$. The normalized bulk traces converge by ordinary Wick pairing. (5.14) holds jointly for every finite list of $A$, including $A^(*) A'$.
  The remaining task is to turn the rare-coordinate Gram comparisons into an operator-norm bound. Take a subsequence realizing a limiting norm witness and form its Hilbert ultraproduct. The closed linear span of ${ A V xi : A upright(" a bulk word") \, med xi in R }$ is a reducing subspace for the bulk word algebra, and (5.14) identifies it isometrically with $L^2 \( cal(A) \, tau \) ⊗ R$ through $A Omega ⊗ xi mapsto A V xi$. Here $cal(A)$ is the bulk Gaussian/diagonal algebra, whose norm has just been controlled. On this subspace, $V xi = Omega ⊗ xi$ and $V^(*) \( A Omega ⊗ xi \) = tau \( A \) xi$. The orthogonal bulk complement has no coupling to $R$ and obeys the bulk norm bound. On the reducing sum of $R$ and its bulk cyclic space, every return through a bulk word is exactly its vacuum expectation, while the diagonal on $R$ retains its actual type value. This is the representation induced from that base in (5.8). Its polynomial norm is bounded by the faithful-base Fock norm. The norm on the orthogonal sum of the two reducing pieces is the maximum of their restricted norms, proving the rare-type assertion.
  Both the positive-proportion and rare-type comparisons are now proved. To obtain the stated exponential rate, project GOE onto the operator-norm ball of a fixed radius $K > 3$. The bare-GOE comparison already puts a median of $∥G_n∥_(upright("op"))$ below $3$ for large $n$. This norm is one-Lipschitz in Hilbert–Schmidt norm, so Gaussian concentration gives
  $ bb(P) \( ∥G_n∥_(upright("op")) > K \) lt.eq e^(- c_K n) \, #h(2em) c_K > 0 . $
  A word of degree $k$ with diagonal bound $M$ satisfies, by telescoping,
  $ ∥P \( G \, D \) - P \( G' \, D \)∥_(upright("op")) lt.eq L ∥G - G'∥_(upright("HS")) \, $
  where $L$ depends on $k \, M$, the coefficients, and the spectral cutoff, but not on $alpha$, the type counts, or any compression rank. The projection is nonexpansive in Hilbert–Schmidt norm. Gaussian concentration for the clipped polynomial, combined with its median comparison to the limiting target, therefore gives the original polynomial the failure bound
  $ 2 e^(- c_0 n a^2 \/ L^2) + e^(- c_K n) . $
  For $0 < a lt.eq 1$, reducing the positive constant $c$ absorbs the escape term and the prefactors into $2 e^(- c n a^2 \/ L^2)$ for sufficiently large $n$. The preceding convergence puts the clipped median below the limiting norm target plus any fixed slack. These median comparisons are uniform over type counts: otherwise take a failing sequence, extract convergent proportions, and use the full-support or rare-type case just proved. One can realize this continuity on a fixed letter space $bb(R)^q$ with creation vector $\( sqrt(p_a) \)_a$ and a faithful base; creation changes in norm by at most $∥sqrt(p) - sqrt(p')∥_2$. This completes the proof. ◻
]

#thm([Lemma 5.6.])[
  (Sparse changes and a separate density mesh).  #emph[The norm comparison in 26 is valid simultaneously for arbitrary bounded changes to a sufficiently small fraction of the entries of finitely many binned labels, even when the changed entries and their supports are chosen after seeing the Gaussian matrix. The conclusion is comparison with the representation of the changed labels, retaining their base actions; it does not declare the change small in operator norm.]
] <lem:path-sparse>

#proof[
  The parameters are chosen by comparing the entropy of all allowed changes with a fixed Gaussian failure rate. First fix the word family, caps, bin resolution, spectral cutoff, and operator slack $a > 0$. For one label, changing at most $delta n$ entries with at most $q$ replacement choices gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ log N_(n \, delta) lt.eq n { H \( delta \) + delta log q } + o \( n \) \, #h(2em) H \( delta \) = - delta log delta - \( 1 - delta \) log \( 1 - delta \) . $ <eq:path-sparse-entropy>]
  For finitely many labels add these entropies. At fixed positive $delta$ this is a small positive multiple of $n$, #emph[not] $o \( n \)$. Let $c a^2 \/ L^2$ be the Gaussian rate from 26. Choose $delta$ so that the sum in (5.15), divided by $n$, is below one quarter of that rate. The union bound then gives a common exponential event for every possible modification. Polynomially many type-count cases cost only $o \( n \)$.
  This common event is enough for tracial label approximations. Indeed, if $n^(- 1) sum_i \| d_i - tilde(d)_i \|^2 lt.eq eta^2$, then at most $delta n$ sites satisfy $\| d_i - tilde(d)_i \| > eta \/ sqrt(delta)$. Off those sites, binning and polynomial telescoping absorb the small uniform error. On those sites, the comparison for every modification has already been secured by the union bound.
  Only after fixing these label approximations choose a #emph[different] mesh for the path density. By 19, its specific log-density price $kappa$ can be made smaller than another quarter of the same Gaussian rate. A density tilt $e^(kappa n + o \( n \))$ leaves a strictly positive exponential failure rate. Then take $n arrow.r oo$. The minimum positive type proportion never enters the rate: it only enters the preliminary moment constant used to establish the median. Finally let the sparse fraction, density cost, and operator slack tend to zero in this nested order. ◻
]

=== 5.4 Removing the queried compression <removing-the-queried-compression>

#thm([Lemma 5.7.])[
  (Conditional Gaussian comparison).  #emph[For fixed tracial label approximations and fixed path words, the regression in 23, followed by an independently chosen finer density mesh, gives the norm and joint-vector comparison in Assertion (iii) of 22.]
] <lem:path-compressed>

#proof[
  We must pass from the independent Gaussian comparison to the matrix left by the path queries. Fix the finite label calculations first. After conditioning on the frozen path data, the spin inputs at each mesh time are fixed, and the likelihood sees $J$ only through its images on those input columns. Retain an orthonormal basis of their nonvanishing residual directions, together with the input seed columns and the finitely many adaptive queries required by the fixed labels. Formula (5.5) leaves an independent compressed Gaussian matrix. The removed part is a bounded sum of dyads of input and innovation vectors, of rank at most twice the number of retained directions.
  Small query residuals are handled before any matrix inverse is needed. At the fixed density mesh, process the queries in causal order and omit residuals shorter than a fixed threshold $theta$. Use the orthogonal projection of each omitted query when evaluating later fields. This still defines a probability scheme: every refresh uses a normalized Bernoulli probability depending on its past. In particular, no lower bound on the smallest eigenvalue of an arbitrarily long mesh Gram matrix is assumed. The omitted spin input has normalized length at most $theta$. The spectral bound, finite-bin count truncation and 19 bound the resulting log likelihood error by $kappa_theta n$, with $kappa_theta arrow.r 0$ at the fixed mesh. Subsequent label queries with small residual can be omitted using normalized square-mean continuity. Thus nearly singular regressions cause a small density error, not an inverse-Gram operator factor.
  Before applying a full-GOE word comparison, augment the residual $P G' P$ by its missing Gaussian blocks, independently of the actual data. Conditional on the revealed columns and fixed labels, this gives a full independent GOE $G'$ on an enlarged probability space. The path-density change depends only on the compressed residual; the independent added blocks have density cost one. A full-GOE operator comparison is applied only to this completed matrix. In particular, no unrestricted polynomial norm domination for $P G' P$ by the full-GOE Fock norm is asserted.
  We now apply the comparison on that enlarged space. The GOE map from standard Gaussian coordinates has Hilbert–Schmidt Lipschitz scale $sqrt(2 \/ n)$. For a Gaussian good set of probability at least $1 \/ 2$, isoperimetry bounds the probability of Frobenius distance greater than $r$ from the set by $2 e^(- c n r^2)$. Use as the good set the full-GOE event for the required fixed-word comparisons in 26. Under a pointwise density price $e^(kappa n + o \( n \))$, taking $r > C sqrt(kappa) + a$ leaves an exponential error. Telescoping a bounded polynomial changes its operator norm by at most $L r$. Both $L$ and the Gaussian scale are independent of the number of queried directions; compressing a perturbation has norm at most its original norm. The countably many fixed approximations are taken in successive limits, not intersected as a dimension-dependent word family. Sparse label changes are covered by 27 on this same event.
  Only the hidden word inner products remain to be compared with the actual compressed matrix. The discrepancy between the actual and completed matrices has range and corange in the span of the queried directions and finitely many added isotropic Gaussian columns. Expand each polynomial discrepancy as a sum of dyads. Its two vectors lie in the cyclic spaces of those directions under the actual bounded words and labels. The queried directions and their images are path vectors, so 24 makes them orthogonal to hidden endpoint vectors. For an added Gaussian column $g$ of covariance at most $I \/ n$, condition on all actual data. For any actual bounded word $Q$ and actual endpoint vector $u$,
  $ bb(E)_g \| u^t Q g \|^2 lt.eq n^(- 1) ∥Q^t u∥^2 lt.eq C n^(- 1) ∥∥ u^2 . $
  The same estimate treats the finitely many added columns jointly and, by a further finite polynomial expansion, their word orbits. Thus the added cyclic directions vanish in hidden word inner products as well. The hidden vectors do not anticipate the added blocks: these blocks were sampled only after fixing the actual data. Removing them at this stage proves the comparison on the hidden complement that is required here, while retaining the rare diagonal base of the full-GOE model.
  This gives a positive matrix-valued functional for every finite family of hidden vectors on the algebra generated by $D$ and $s$, bounded by the norm in (5.8). To represent creation as well as the self-adjoint sum, lift the word inner products to the algebra containing $ell$. Use a norm-preserving Hahn–Banach extension of the positive functional from the unital algebra generated by $D \, s$ to the one generated by $D \, ell$. Positivity follows from preservation of the norm and its value at the identity. Apply this to matrix amplifications to retain all the joint vector states, and use the Gelfand–Naimark–Segal (GNS) construction. The resulting lifted vectors have exactly the original joint word inner products, while $ell^(*) D ell = tau \( D \) I$ holds in the ambient representation. If a finite star has a permutation symmetry one may average the extension over that finite group and take direct sums. This proves precisely the one-tree assertion; it imposes no symmetry joining independent choices at two different endpoints. ◻
]

=== 5.5 Entrywise products and difference matrices <entrywise-products-and-difference-matrices>

#thm([Lemma 5.8.])[
  (Diagonal prediction and Hadamard reduction).  #emph[Assertion (iv) of 22 holds.]
] <lem:path-hadamard>

#proof[
  First prove the entry predictions, and then strengthen the resulting Hadamard estimate to an operator bound. For independent GOE and deterministic binned diagonals, each entry of a fixed word is Frobenius Lipschitz on a spectral cutoff, with a dimension-free constant. Gaussian concentration and a union bound over $n^2$ entries therefore give uniform convergence to the entry expectations at every fixed positive accuracy. Conjugation by diagonal sign matrices makes all off-diagonal expectations zero. A fixed-degree Wick expansion of the diagonal entry leaves precisely its complete noncrossing contraction with the outer site type fixed. Every other pairing has at least one additional index identification and costs $O \( 1 \/ n \)$, uniformly in the outer type, including a rare type. This proves (5.3). The same expansion for the normalized trace averages the remaining outer diagonal and gives the vacuum trace rule.
  For the off-diagonal Hadamard product, its expectation depends only on the two endpoint types. A Wick pairing connecting the two distinct fixed endpoints has at least one fewer free index than paired edges, so each mean entry is $O \( 1 \/ n \)$. If $E_a$ is a type projection, this mean matrix is, up to an $O \( 1 \/ n \)$ diagonal correction, a sum of dyads
  $ sum_(a \, b) c_(a b) thin \( E_a upright(bold(1)) \/ sqrt(n) \) \( E_b upright(bold(1)) \/ sqrt(n) \)^t \, #h(2em) \| c_(a b) \| lt.eq C . $
  It is visible. We must still prove that the centered product is small in operator norm; entrywise smallness alone would not prove it.
  We obtain the operator bound by treating diffuse and large coordinates separately. Start with unit vectors $u \, v$ satisfying $max \( ∥∥ u_oo \, ∥∥ v_oo \) lt.eq zeta$ and consider $u^t \( Q compose R \) v$. Perturbing $G$ by $dot(G)$ gives terms of the form
  $ ⟨D_u R D_v \, dot(Q)⟩_(upright("HS")) + ⟨D_u Q D_v \, dot(R)⟩_(upright("HS")) . $
  The word differentials are Hilbert–Schmidt bounded by $C ∥dot(G)∥_(upright("HS"))$. Moreover,
  $ ∥D_u R D_v∥_(upright("HS")) lt.eq ∥∥ u_oo ∥∥ R ∥∥ v lt.eq C zeta . $
  Hence this bilinear statistic has Gaussian concentration rate $exp \( - c n a^2 \/ zeta^2 \)$. Nets of the two unit balls at a fixed resolution have size $exp \( C_a n \)$. Choose $zeta$ sufficiently small after the required accuracy $a$. A union bound controls all diffuse unit tests.
  To cover all unit vectors, separate the coordinates of magnitude greater than $zeta$. Each vector has at most $zeta^(- 2)$ such coordinates. After removing the diagonal,
  $ sum_(j eq.not i) \| Q_(i j) R_(i j) \|^2 lt.eq max_(j eq.not i) \| Q_(i j) \|^2 sum_j \| R_(i j) \|^2 = o \( 1 \) \, $
  and the same holds for columns. Thus the portions involving the finitely many large coordinates have norm $o \( 1 \)$ uniformly in their locations. The finite-net approximation is legitimate because the Schur bound gives a uniform a priori operator norm. Combining sparse and diffuse parts proves that the centered off-diagonal Hadamard product is $o_(upright("op")) \( 1 \)$.
  Visible dyads do not spoil these claims. A bounded path vector $b$ with uniform spatial square tails has $max_i \| b_i \| arrow.r 0$, since
  $ max_i \| b_i \|^2 lt.eq M^2 \/ n + sum_i \| b_i \|^2 upright(bold(1))_({ sqrt(n) \| b_i \| > M }) \, $
  with dimension first and then $M arrow.r oo$. Thus a visible dyad has negligible maximum entry. Its Hadamard product with a bounded matrix is $D_b Q D_c$ and has norm at most $∥∥ b_oo ∥∥ Q ∥∥ c_oo = o \( 1 \)$. Finite-rank approximation extends the argument to the visible closure.
  Finally use Lemma 5.7, Lemma 5.6 to transfer the uniform Gaussian comparisons to actual path labels. Polynomial norm differences tolerate the small Frobenius comparison error. Uniform entry predictions retain the actual outer diagonal on rare sites. The dyads of binned type indicators are limits of bounded path-recipe dyads by tracial approximation. This proves the stated Hadamard reduction and diagonal formula on admissible trees. ◻
]

#thm([Lemma 5.9.])[
  (Smooth difference and column-flip closure).  #emph[Assertion (vi) of 22 holds. In particular, for every fixed smooth site recipe $z$, the matrix $E \( z \)_(i j) = d_j z_i$ has bounded operator norm and vanishing off-diagonal maximum, and belongs to the path-matrix closure. On scaled vector recipes its operator bound has the additional factor $n^(- 1 \/ 2)$.]
] <lem:path-difference-closure>

#proof[
  We prove closure by induction over the recipe operations. The spin input satisfies $E \( x \) = I$, and a query by $J$ left-multiplies its difference matrix by $J$. For the nonlinear step, assume closure for $z$ and apply a bounded smooth scalar function $phi.alt$. Off the diagonal, use $z_i \( x^j \) = z_i \( x \) - 2 x_j d_j z_i$ in Taylor’s formula to obtain
  #[#set math.equation(numbering: n => "(5.16)")
   $ d_j phi.alt \( z_i \) = phi.alt' \( z_i \) E \( z \)_(i j) - x_j phi.alt'' \( z_i \) E \( z \)_(i j)^2 + R_(i j) \, #h(2em) \| R_(i j) \| lt.eq C \| E \( z \)_(i j) \|^3 . $ <eq:path-difference-taylor>]
  The remainder’s maximum row and column absolute sums tend to zero:
  $ sum_j \| R_(i j) \| lt.eq C max_(k eq.not l) \| E \( z \)_(k l) \| sum_j \| E \( z \)_(i j) \|^2 = o \( 1 \) \, $
  and similarly for columns. Keep $d_i phi.alt \( z_i \)$ exactly on the diagonal. The first two terms in (5.16) are diagonal multiplications of $E \( z \)$ and its Schur square; they belong to the asserted closure by 29. Their operator norms are bounded, and their off-diagonal maxima vanish. The exact diagonal is a bounded site label, obtained from $z_i$ and its already constructed own-spin difference. Its smooth limiting versions follow by the same recipe recursion. This completes induction over every finite calculation. Finite sums and products use the exact product rule and the bounded Schur estimate; no unbounded derivative coefficient appears.
  For column flips define $sans(F) \( Q \)_(i j) = Q_(i j) \( x^j \)$. Starting at the right end of a word, one has the exact recursions
  $ sans(F) \( J Q \) & = J sans(F) \( Q \) \,\
sans(F) \( D_f Q \) & = D_f sans(F) \( Q \) - 2 { E \( f \) compose sans(F) \( Q \) } D_x . $
  The first uses that $J$ is independent of $x$; the second is the identity $f_i \( x^j \) = f_i \( x \) - 2 x_j d_j f_i \( x \)$ with its derivative index still tied to column $j$. These recursions express every column-flip matrix through bounded path words and Schur insertions. They preserve the closure just proved. The conditional derivative of a fixed smooth multitime calculation requires the full mixed-slot recursion of Lemma 4.4, Lemma 4.5. After its uniform tails are removed, the equality-network reduction in 33 expresses every opened term through the matrix closure just described. Thus the dynamic assertion uses that additional argument; it is not inferred from first partial Jacobian bounds alone. ◻
]

=== 5.6 Opened mixed derivatives as directed networks <opened-mixed-derivatives-as-directed-networks>

To handle conditional derivatives, we still need to express the mixed tensors as path matrices. Their existing norm bound does not supply that expression: a Taylor remainder may have a bounded coefficient depending on several derivative indices. We first approximate that coefficient with control in the flattened operator norm. The resulting tensors can then be drawn as finite equality networks, which we reduce after the observation slots have been copied.

#thm([Lemma 5.10.])[
  (Polynomial approximation in the increments).  #emph[For each fixed smooth calculation of 15, every nonempty mixed tensor $T_I F$ is uniformly approximable in the norm of (4.8) by finite tensor polynomials. Their factors are matrix-query edges and equality tensors, their vertex labels are bounded smooth functions of the calculation values, and every derivative slot occurs in every nonzero term. Approximation constants are dimension independent. No bounded range of the undifferentiated linear-query values is required.]
] <lem:path-increment-approximation>

#proof[
  Only the increments need polynomial approximation; the base query values may remain unbounded. In the corner expansion from 15, the formal increments satisfy $\| t_(b \, S) \| lt.eq 2^(\| S \|) C_S \( z^b \)$ and hence range in a fixed compact box. Each remainder has the form
  #[#set math.equation(numbering: n => "(5.17)")
   $ (product_(alpha in A) t_alpha) t_gamma R_(A \, gamma) \( z \, t \) \, #h(2em) gamma in A . $ <eq:path-increment-remainder>]
  Here $z$ consists of the undifferentiated calculation values at the output site. The integral formula for $R$ and the global scalar derivative bounds give a uniform bound and a uniform modulus of continuity in $t$, independently of $z in bb(R)^q$.
  Apply multivariate Bernstein approximation on the increment box, treating $z$ as a parameter. Given $eta > 0$, this gives a fixed finite polynomial
  $ P_eta \( z \, t \) = sum_nu b_nu \( z \) t^nu \, #h(2em) sup_(z \, t) \| R_(A \, gamma) \( z \, t \) - P_eta \( z \, t \) \| lt.eq eta . $
  In the Bernstein basis the coefficients are values of $R$ at fixed increment grid points. They are therefore bounded smooth functions of $z$ with bounded derivatives of each required order. Conversion to the fixed monomial basis preserves these properties. This approximates only the increments, not the possibly unbounded $z$.
  The error still contains the repeated factor $t_gamma$ in (5.17). The repeated-square estimate in 14 therefore bounds its flattened operator norm by $C eta$. Every retained monomial still covers the original set $I$ of derivative slots. Carry out this operation at every nonlinear gate, and substitute the already constructed approximations of its input tensors. The product bound in (4.9) makes each finite substitution continuous in those operator norms. Finite induction proves the asserted approximation.
  We record the spatial structure of the resulting terms for the conditional derivative calculation. Unroll one term into a tree rooted at its output site. A linear gate gives a matrix edge. At a tensor monomial, take copies of the nonempty child tensors and join their output roots at an equality vertex labelled by $b_nu$. Each spin input supplies an identity edge ending in a derivative leaf; retain this edge even if it could immediately be contracted. A constant input has no nonempty derivative term. Factors $x_(j_a)^(\( a \))$ from the corner increments become bounded labels at the corresponding leaves. The covering property ensures that every required derivative slot has a leaf. Several occurrences of one slot remain several leaves with the same slot name, to be copied by equality tensors when the temporal indices are attached. Thus no coefficient depending on two unrelated vertex indices remains. ◻
]

#thm([Lemma 5.11.])[
  (Reduction of finite directed equality networks).  #emph[Let $cal(A)$ be a class of uniformly bounded finite matrix expressions, closed under products, transposes, Hadamard products, and multiplication by its bounded diagonal labels. Suppose every such expression $Q$, including expressions newly formed by these operations, has 
$ max_(i eq.not j) \| Q_(i j) \| = o \( 1 \) \, #h(2em) max_i \| Q_(i i) - delta_Q \( i \) \| = o \( 1 \) \, $

 where $delta_Q$ is an admitted bounded diagonal label. Consider a fixed finite equality network with matrix edges from $cal(A)$ and admitted bounded vertex labels. If it has an acyclic orientation with unique source and sink at its external input and output, then its matrix contraction is, up to $o_(upright("op")) \( 1 \)$, in $cal(A)$. It in particular has vanishing off-diagonal maximum.]
] <lem:path-directed-network>

#proof[
  We first bound a network contraction, then show how to reduce the network while controlling each error. Put $H = bb(R)^n$. For $p \, q gt.eq 1$, the labelled equality gate $E_(p \, q)^d : H^(⊗ p) arrow.r H^(⊗ q)$ sends $e_a^(⊗ p)$ to $d \( a \) e_a^(⊗ q)$ and annihilates nonconstant input tuples. Its norm is $∥∥ d_oo$. Count the external input as an incoming wire at the source and the external output as an outgoing wire at the sink. Each vertex now has both an incoming and an outgoing wire. Executing vertices in topological order, with tensor products on the other live wires, gives the deterministic bound
  #[#set math.equation(numbering: n => "(5.18)")
   $ ∥Z_G∥_(upright("op")) lt.eq product_(e in E \( G \)) ∥A_e∥_(upright("op")) product_(v in V \( G \)) ∥d_v∥_oo . $ <eq:path-network-bound>]
  In particular, there is no free summation map with norm $sqrt(n)$.
  Call an internal edge $e : u arrow.r v$ safe if deleting it preserves the unique source and sink and makes $u \, v$ incomparable in the remaining directed order. Both endpoints then retain positive incoming and outgoing degrees. Process their predecessors first and process $u \, v$ jointly. If their remaining degrees are $p_u \, q_u \, p_v \, q_v gt.eq 1$, the joint gate with coefficient $R$ is
  $ e_a^(⊗ p_u) ⊗ e_b^(⊗ p_v) mapsto d_u \( a \) d_v \( b \) R_(a b) thin e_a^(⊗ q_u) ⊗ e_b^(⊗ q_v) \, $
  and is zero on all other input tuples. Both the displayed input family and output family are orthonormal. Its norm is at most $∥d_u∥_oo ∥d_v∥_oo max_(a \, b) \| R_(a b) \|$. Taking $R$ to be the edge matrix restores the original network; taking its diagonal identifies $a = b$ and contracts $u \, v$. Hence
  #[#set math.equation(numbering: n => "(5.19)")
   $ ∥Z_G - Z_(G \/ e)∥_(upright("op")) lt.eq max_(a eq.not b) \| \( A_e \)_(a b) \| product_(f eq.not e) ∥A_f∥_(upright("op")) product_w ∥d_w∥_oo = o \( 1 \) \, $ <eq:path-network-pinch>]
  with new vertex label $d_u d_v "diag" \( A_e \)$. Its diagonal can be replaced by $d_u d_v delta_(A_e)$ using (5.18). Contraction cannot create a directed cycle: such a cycle would yield a path from $u$ to $v$ or from $v$ to $u$ after deletion. It preserves the unique source and sink.
  The norm estimate justifies pinching a safe edge. To ensure that such an edge is available, first consolidate parallel edges by Hadamard products and suppress every nonterminal vertex of indegree and outdegree one, using matrix multiplication with its diagonal label. Continue until neither reduction applies. If any internal vertex remains, the earliest one in a topological order has just one incoming edge, from the source. It must consequently have at least two outgoing edges, or it would have been suppressed. Choose the latest internal vertex $u$ having at least two outgoing edges, and let $v$ be its earliest immediate successor. The successors are distinct, so $v$ is internal. It has outdegree one by the choice of $u$, and indegree at least two because suppression has ended. There is no alternate path $u arrow.r v$: its first edge would go to another successor of $u$, later than $v$, which cannot subsequently reach $v$. Deleting $u arrow.r v$ therefore makes them incomparable and leaves positive incoming and outgoing degrees at both endpoints. This is a safe edge.
  Pinch that edge and repeat the ordinary reductions. A pinching or series reduction decreases the number of vertices, and parallel consolidation decreases the number of edges. The procedure therefore ends after finitely many steps with one edge from source to sink. All newly formed edges belong to $cal(A)$, so their own entry predictions justify every subsequent pinching. Summing the finitely many errors proves the claim. If source and sink have already been identified, acyclicity leaves only a diagonal equality gate; this case is immediate. Finally $max_(i j) \| E_(i j) \| lt.eq ∥∥ E_(upright("op"))$ transfers the off-diagonal assertion through the accumulated errors. ◻
]

Figure 2 shows the first crossed example: pinching one internal edge turns a contraction with two internal indices into a product of two Hadamard factors and a diagonal label. The proof above applies the same operation after each finite series and parallel reduction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$j$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((1.65, 1), [$g$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((1.65, -1), [$k$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((3.3, 0), [$i$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (1.65, 1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((0.825, 0.5), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C$]]])], anchor: "south-east")
  line((0, 0), (1.65, -1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((0.825, -0.5), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q^( sans(T) )$]]])], anchor: "north-east")
  line((1.65, 1), (3.3, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((2.475, 0.5), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B$]]])], anchor: "south-west")
  line((1.65, -1), (3.3, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((2.475, -0.5), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$E$]]])], anchor: "north-west")
  line((1.65, 1), (1.65, -1), stroke: (paint: rgb("#595959"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((1.65, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$T^( sans(T) )$]]])], anchor: "west")
  content((4.3, 0), [$arrow.r.long$])
  content((5.3, 0), [$j$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((7.6, 0), [$a$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((9.9, 0), [$i$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  line((5.3, 0), (7.6, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((6.45, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C compose Q^( sans(T) )$]]])], anchor: "south")
  line((7.6, 0), (9.9, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((8.75, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B compose E$]]])], anchor: "south")
  content((7.6, -0.9035), [#text(size: 9pt)[$T_(a a)$]])
  content((1.65, -1.65), [#text(size: 9pt)[two internal indices]])
  content((7.6, -1.65), [#text(size: 9pt)[one internal index]])
})],
  caption: [Figure 2: Pinching the bridge in a crossed contraction. The left network represents $sum_(g \, k) B_(i g) E_(i k) T_(g k) C_(g j) Q_(j k)$. Removing the off-diagonal entries of $T$ costs at most a fixed operator-norm constant times $max_(g eq.not k) \| T_(g k) \|$. Its diagonal identifies $g = k = a$, leaving $\( B compose E \) D_("diag" T) \( C compose Q^(sans(T)) \)$. The diagonal label is retained. ],
) <fig:network-pinching>

#thm([Proposition 5.12.])[
  (Opened conditional derivatives).  #emph[Fix a smooth multitime calculation as in 15, a finite causal tree, common Duhamel and likelihood truncations from 16, and the tensor approximations of 31. Require every linear-query edge of the calculation and every opened $K$ edge to belong to the admitted path-matrix algebra, with its entry predictions, and require all bounded coefficient labels to be admitted path labels. In particular, the calculation values are admitted path recipes; the likelihood calculations above use $J$ and $J compose J$ as their query matrices. The broader class of arbitrary bounded-operator query maps in 15 is not asserted to have this closure. After ordinary conditional expectations are opened on their specified causal branches, every remaining derivative contraction is a bounded path matrix up to successive operator-norm errors. It has vanishing off-diagonal maximum and the Hadamard and diagonal predictions of 29. The network errors have the typical, weighted and integrated-parameter meaning of 17. The earlier tensor and conditional truncation errors are uniform in the joining state and stored parameters.]
] <prop:path-opened-derivative>

#proof[
  The first step removes errors that are uniform in the joining state. Use (4.19), (4.16) for the tensor approximations and the common $K$ tails. At fixed accuracy, only finitely many terms and fixed finite-measure Duhamel integrals remain. Every $K$ insertion history is a bounded finite path-matrix word, with a fixed cap on each likelihood label. Keep ordinary $S$ expectations exact for now. On opening a later inner-product or replica test, they become ordinary causal branches and introduce no new spatial summation index.
  We now identify the two trees whose gluing represents an opened term. The spatial recipe tree is the one constructed in 31. A second, temporal tree starts at the joining derivative coordinate: construct it by reading the finite conditioning recursion backwards. In (4.18), the memory term keeps its current slot $p$. The active term replaces $p$ by the newly introduced slot $m$, through the $K$ path-word edge. The mixed term forks into $p$ and $m$, puts the $K$ edge on the latter branch, and puts the bounded sign $- 2 x_p$ at the fork. The new slot $m$ was absent from the current derivative subset. It therefore cannot reconnect to an existing temporal leaf. Repeating this construction gives a temporal tree with one terminal for each original derivative slot used in that term. Finite causal-tree conditioning has the same construction, with copies attached at the common joining vertex.
  If a slot occurs several times in the recipe polynomial, append an equality fork to its temporal terminal, one outgoing branch for each occurrence. Glue the resulting temporal leaves to the recipe leaves in pairs, retaining the input-spin identity edges until this gluing is complete. Every leaf is paired. The covering property ensures that there is at least one leaf, and that both trees are connected. Orient the temporal tree away from the joining derivative index and the recipe tree toward its output site. A directed path can cross from the temporal tree into the recipe tree only at a paired leaf; it cannot cross back. Thus the glued network is acyclic, with its unique source the joining derivative coordinate and its unique sink the output site. Every vertex is on a path between them. The only free indices are these two external ones; all internal indices are ordinary equality contractions with no normalization factor.
  The glued graph now has exactly the orientation required by 32. Its matrix algebra, including bounded visible dyads, is closed under ordinary products and transposes. Lemma 29 supplies the Hadamard reduction and entry predictions for each newly formed fixed expression. Applying the network lemma therefore reduces the opened term to the same path-matrix closure in operator norm. The bounded scalar coefficients, spin signs and diagonal predictions are path labels. Integrate its pointwise network bound over the fixed Duhamel parameter sets and use the integrated entry predictions. No worst auxiliary time or starting configuration is selected. The same argument applies to stationary reversed causal branches. Actual and predictor terms keep the same subdivisions and approximations before they are recombined and centered.
  This proves closure for the opened histories used in the subsequent conditional tests. It does not assert a uniform-operator-norm approximation of an arbitrary conditional matrix average by finitely many sampled histories. Conditional expectations remain exact until those branches are opened. For a still-averaged off-diagonal maximum one may instead use conditional Jensen:
  $ max_(i eq.not j) \| bb(E) \[ Q_(i j) divides X \] \| lt.eq bb(E) \[ max_(i eq.not j) \| Q_(i j) \| divides X \] . $
  The uniform errors were removed before this typical network step. In particular, no spatial square-mean error has been substituted for an operator error. ◻
]

=== 5.7 Two-root self-averaging and completion of the calculus <two-root-self-averaging-and-completion-of-the-calculus>

#thm([Lemma 5.13.])[
  (Site histories from independent equilibrium roots).  #emph[For two independent equilibrium samples in the same disorder, and independent heat-bath site randomness on their trees, the limiting joint site law of spin, field, and bounded likelihood histories is the product of their one-root laws. Consequently stationary site means of any such bounded history label self-average in spatial square mean.]
] <lem:path-two-root>

#proof[
  We first separate the two planted starting directions, then propagate that separation through the finite simulations. Plant the samples $sigma$ and $sigma'$. Their overlap $r = n^(- 1) sigma^t sigma'$ has the independent-uniform-spin law tilted by $exp \( beta^2 n r^2 \/ 2 \)$, up to a spin-independent constant. The Rademacher rate function satisfies $I \( r \) gt.eq r^2 \/ 2$. Since $beta < 1$, for every fixed $epsilon > 0$ the probability $\| r \| > epsilon$ is at most $e^(- c_epsilon n)$. Conditionally on the spins the Gaussian disorder has the two rank shifts $beta^2 \( sigma sigma^t + sigma' sigma' ""^t \) \/ n$. The two initial site spins are therefore asymptotically independent, and the two planted directions are asymptotically orthogonal.
  Perform the finite Gaussian recursion from 23 for both causal simulations. Each query needed for spin and field histories is odd under global spin inversion of its own root; a score query for likelihoods is also odd. Fresh refresh uniforms can be reflected under this inversion without changing their law. Deterministic cross-overlap limits of an odd query from each different tree change sign under either inversion, and hence vanish. The Gaussian regression innovations for the two trees have zero cross covariance and are independent. By induction their site recursions are independent, because their initial spins and site seeds are independent as well. Likelihood labels are bounded functions of the resulting histories; their computation needs no additional noncentered Gaussian query. Thus their joint limits also factor. This induction does not apply to an arbitrary shared noncentered query such as $J upright(bold(1))$, explaining the restriction in the statement.
  Transfer this factorization to the actual stationary paths using the two-replica planting comparison and then Proposition 4.10, Lemma 5.4. For a bounded label $b$, represent the spatial mean of $bb(E) \[ b_i divides J \]^2$ by the empirical product on the two independent roots. The factorization makes its limit $\( tau b \)^2$, proving the claimed self-averaging of the site means. ◻
]

#proof[
  #emph[Completion of the proof of 22.] The required empirical space and endpoint predictions are supplied by 24, together with orthogonality of hidden vectors. Lemma 25 puts the likelihood labels in this construction with their stated tracial convention. The norm comparison then follows from Lemma 5.5, Lemma 5.6, Lemma 5.7: the representation is on one tree, retains the rare diagonal base, and uses the Gaussian rate before paying the entropy and density costs. The entry and Hadamard assertions come from 29; the difference and column-flip closure is 30, with the opened conditional terms just reduced to that closure. Finally, 34 proves the restricted two-root independence assertion.
  Every construction used the fixed countable dense recipe family and successive fixed approximations. Diagonal extraction therefore gives common high-probability disorder events for any finite initial list of tests. Lemma 18 permits polynomial weights and actual conditional copies. All superpolynomial path discards were made separately on the original forward marginals. These observations give the typicality convention and the order of limits in the theorem. ◻
]

== 6 A projected row likelihood and the spin spectral measure <sec:row-spin>

Projection onto the terminal configuration improves the moment bounds for a row likelihood from exponential to subexponential in the path length. We prove this improvement first, keeping separate the roles of the two estimates: unprojected moments justify passage to a fixed-time limit, and projected moments determine the hidden-sector decay rate. We then construct the spin spectral measure and derive the two strict renewal inequalities needed to sum the hidden path expansion.

The inputs are the rough gradient and likelihood estimates of 13, the cavity density estimate of 10, and the following specified parts of 22: deterministic stationary spin and path limits, conditional prediction on causal trees, the noncrossing trace rule, and the two-independent-equilibrium-sample comparison for spin histories, fields, and likelihood labels. The last comparison does not assert independence of arbitrary recipes with noncentered queries or shared random seeds. The bridge argument below concerns an independent #emph[removed Gaussian row]; it is not an application of a path rule to a new bridge conditioned on two prescribed endpoints.

=== 6.1 The statement and its quantifiers <the-statement-and-its-quantifiers>

Fix a row $i$ and $d > 0$. A mask $M subset \[ 0 \, d \]$ is a deterministic finite union of intervals specifying when the row perturbation is present. In the diagonal likelihood representation of 12, let $ell_i^M$ change the field at every site $j eq.not i$ by $- 2 X_i \( s \) J_(i j)$ when $s in M$, leaving the site-$i$ update rule unchanged. The law with this modification has path density $ell_i^M$ with respect to the ordinary path law. Put

#[#set math.equation(numbering: n => "(6.1)")
 $ A_(i \, x)^M \( y \) = bb(E)_x \[ ell_i^M divides X_d = y \] . $ <eq:row-projection>]

This conditional expectation is the ratio of the modified and ordinary terminal transition probabilities. It includes paths on which the last site-$i$ refresh left the spin unchanged, so the attempt and flip likelihood conventions agree in (6.1).

#thm([Theorem 6.1.])[
  (Projected moments of a deterministic row likelihood).  #emph[For each fixed real $r$ and each $epsilon > 0$, there is $d_0 = d_0 \( r \, epsilon \)$ such that, for every fixed $d gt.eq d_0$ and every deterministic mask $M$, outside a disorder event of probability tending to zero there is a set $B_(n \, d \, M)$ satisfying 
#[#set math.equation(numbering: n => "(6.2)")
 $ mu \( B_(n \, d \, M) \) lt.eq e^(- c n) \, #h(2em) max_i bb(E)_x #scale(x: 120%, y: 120%)[\[] \( A_(i \, x)^M \( X_d \) \)^r #scale(x: 120%, y: 120%)[\]] lt.eq e^(epsilon d) + o_n \( 1 \) quad \( x in.not B_(n \, d \, M) \) . $ <eq:row-moment-quantified>]

 Here $c > 0$ can depend on the fixed $d \, r \, epsilon$, but the estimates in the proof are uniform in the deterministic mask. Thus the notation $e^(o_r \( d \))$ for these moments always means dimension first and then $d arrow.r oo$. For $0 lt.eq r lt.eq 1$ the upper bound $1$ follows directly from Jensen’s inequality. Negative $r$ in (6.2) refers to the unrestricted positive likelihood, not to a likelihood multiplied by a cutoff indicator.]
  #emph[The theorem also holds in its integrated form: if $M = M_alpha$ ranges over a deterministic measurable family with a finite measure on its parameter space, the good disorder event can be chosen so that the #emph[integrated] Gibbs mass of the exceptional starts is exponentially small. This includes masks determined by simplex times in a fixed finite path expansion and the independent Poisson schedules used below. It does not assert a simultaneous bound for a mask selected to maximize an error after seeing the disorder.]
] <thm:row-projected-moments>

The maximum over $i$ is obtained by a union bound over the $n$ rows, applied after the exponential estimate for a row and a start. This exponential margin also allows any fixed polynomial weight and any initial density bounded above by $e^(o \( n \))$ in the integrated assertion. We will use precisely these quantifiers in 42.

=== 6.2 The cavity identity and the last refresh <the-cavity-identity-and-the-last-refresh>

We begin by expressing the projected likelihood through a cavity chain. Remove row and column $i$, and let $Y$ be the resulting chain started from $x_(- i)$. Conditional on the cavity disorder, the removed vector $\( J_(i j) \)_(j eq.not i)$ is independent Gaussian with covariance $beta^2 I \/ n$. Let $N_j$ count the rate-one refresh attempts at $j$ and let

$ M_j \( t \) = sum_(s lt.eq t : thin upright("refresh at ") j) #scale(x: 120%, y: 120%)[\(] Y_j \( s \) - m_j^Y \( s - \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) m_j^Y = tanh \( \( J^(\( i \)) Y \)_j \) . $

These martingales are orthogonal, with predictable quadratic variations $integral_0^t v_j^Y \( s \) thin upright(d) s$. In the likelihood expansion we also retain the clock-conditioned compensator $integral_0^t v_j^Y \( s - \) thin upright(d) N_j \( s \)$.

Let $cal(S)$ be the site-$i$ refresh schedule. First condition on a deterministic realization $frak(s) = \( t_1 \, dots.h \, t_m \)$, with $0 < t_1 < dots.h.c < t_m < d$. The added spin $a$ stays constant between successive scheduled times. At a refresh its new value is sampled with probability

$ p_sigma \( H \) = frac(e^(sigma H), 2 cosh H) \, #h(2em) H = sum_(j eq.not i) J_(i j) Y_j \, #h(2em) sigma in { - 1 \, 1 } . $

Set $theta = 1 - 2 upright(bold(1))_M$. Relative to the cavity experiment with these site-$i$ coins, adding the field $theta \( s \) a \( s \) J_(i j)$ at the other sites has likelihood $L_theta$. Taylor expansion of $log cosh$ gives

#[#set math.equation(numbering: n => "(6.3)")
 $ log L_theta & = sum_(h = 0)^m (a_h Z_h - 1 / 2 B_h) + o_(bb(P)) \( 1 \) \,\
Z_h & = sum_(j eq.not i) J_(i j) integral_(I_h) theta \( s \) thin upright(d) M_j \( s \) \, #h(2em) B_h = sum_(j eq.not i) J_(i j)^2 integral_(I_h) v_j^Y \( s - \) thin upright(d) N_j \( s \) \, $ <eq:row-score-expansion>]

where $I_h$ are the intervals between scheduled refreshes. All changes of the mask within $I_h$ remain inside a single stochastic integral. Allowing arbitrarily many such changes therefore does not enlarge the Gaussian list. The absolute Taylor remainder is at most

$ C max_(j eq.not i) \| J_(i j) \| sum_(j eq.not i) J_(i j)^2 N_j \( d \) . $

At fixed $d$, this bound tends to zero in probability and admits the moment truncations used below. The time remains fixed before the dimension limit throughout this expansion; it is never chosen as a function of the dimension.

To keep track of the terminal spin, force its last refresh to take the value $sigma$, leaving the probabilities of all earlier coins unchanged. With $s_(*) = t_m$, define

$ macron(H)_(*) = J_i bb(E)_(x_(- i)) Y \( s_(*) \) \, #h(2em) q_sigma = p_sigma \( macron(H)_(*) \) \, #h(2em) F_sigma = frac(p_sigma \( H \( s_(*) \) \), p_sigma \( macron(H)_(*) \)) . $

The elementary inequality $\| partial_H log p_sigma \( H \) \| lt.eq 2$ gives

#[#set math.equation(numbering: n => "(6.4)")
 $ e^(- 2 \| H \( s_(*) \) - macron(H)_(*) \|) lt.eq F_sigma lt.eq e^(2 \| H \( s_(*) \) - macron(H)_(*) \|) . $ <eq:row-forced-coin>]

This ratio belongs inside the cavity average: it restores the random last-spin probability after the deterministic reference probability has been factored out. Set $Z = Y \( d \)$ and define

$ A_(theta \, sigma) \( Z \) = bb(E)_(upright("cav")) \[ L_theta F_sigma divides Z \] \, $

where the expectation includes the earlier site-$i$ coins and the forced last coin. When no refresh occurs, only one final spin is admissible, and we set $q = 1$ and $F = 1$. If $Q_d$ is the cavity terminal law, this construction gives the exact kernel identities, conditional on $cal(S) = frak(s)$,

#[#set math.equation(numbering: n => "(6.5)")
 $ P_theta \( X_i \( d \) = sigma \, Y \( d \) in thin upright(d) z \) = q_sigma A_(theta \, sigma) \( z \) Q_d \( thin upright(d) z \) \,\
A_(i \, x)^(M \, frak(s)) \( sigma \, z \) = frac(A_(theta \, sigma) \( z \), A_(1 \, sigma) \( z \)) . $ <eq:row-cavity-ratio>]

Here $A_(i \, x)^(M \, frak(s)) \( y \) = bb(E)_x \[ ell_i^M divides X_d = y \, cal(S) = frak(s) \]$; the schedule is still observed. The $r$th moment under the ordinary terminal law conditional on that schedule is therefore

#[#set math.equation(numbering: n => "(6.6)")
 $ sum_sigma q_sigma bb(E)_(Q_d) #h(-0.16667em) [A_(theta \, sigma)^(thin r) A_(1 \, sigma)^(thin 1 - r)] . $ <eq:row-ratio-moment>]

We have reduced the desired bound to fixed positive and negative moments of two conditional cavity averages. Their weights $q_sigma$ sum to one even when the deterministic mean field $macron(H)_(*)$ is large.

#thm([Lemma 6.2.])[
  (Fixed-time moment passage).  #emph[Fix $d$, a schedule, a mask, and $q < oo$. On the disorder events of 13, the positive and negative moments of $L_theta$ are bounded by $e^(C_q d)$, uniformly in the schedule and mask. The variables $L_theta F_sigma$ have finite moments of every fixed positive and negative order, with constants uniform in dimension at this fixed $d$. The same is true of their conditional averages given $Z$. Bounded replicated-bridge tests, followed by these bounds, determine both the positive and negative moments of the conditional averages in the dimension limit.]
] <lem:row-uniform-integrability>

#proof[
  Consider first a refresh at another site. The logarithmic perturbation is a Bernoulli likelihood increment with field displacement $theta a J_(i j)$. Its conditional exponential moment, at any fixed real order, is at most $exp \( C_q J_(i j)^2 \)$. Iteration over the attempts, followed by the Poisson exponential formula, gives $e^(C_q d)$ because $sum_j J_(i j)^2 lt.eq C$ and $max_j \| J_(i j) \| = o \( 1 \)$. The same calculation controls inverse moments. After its prescribed refresh the forced spin is predictable, so it does not change the calculation.
  We next control the forced-coin factor. For $f \( y \) = J_i y$, 13 supplies a fixed-horizon bound on $sup_y ∥d S_s f \( y \)∥^2$. Applying 3 controls every fixed exponential moment of $f \( Y \( s_(*) \) \) - bb(E) f \( Y \( s_(*) \) \)$. Combine this with (6.4) and Hölder’s inequality. The resulting constant may grow rapidly with fixed $d$. This step provides uniform integrability at fixed time, rather than a large-$d$ rate.
  For a positive $V$ and $A = bb(E) \[ V divides Z \]$, Jensen gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ A^q lt.eq bb(E) \[ V^q divides Z \] quad \( q gt.eq 1 \) \, #h(2em) A^(- q) lt.eq bb(E) \[ V^(- q) divides Z \] quad \( q > 0 \) . $ <eq:row-jensen-ui>]
  Choosing an order strictly above the desired one gives uniform integrability for the required powers of $A$. To identify those powers by replicated tests, take copies $V^(\( 1 \)) \, dots.h \, V^(\( b \))$ that are conditionally independent given $Z$. They satisfy
  $ bb(E) lr(|b^(- 1) sum_(a = 1)^b V^(\( a \)) - A|)^2 lt.eq b^(- 1) bb(E) \[ V^2 \] . $
  Cap the $V^(\( a \))$ first and pass to the dimension limit with the cap and $b$ fixed. Then let $b arrow.r oo$ and remove the cap. The higher moments in (6.7) justify this passage for positive and negative powers alike; in particular, a limiting $A$ has no mass at zero. Hölder’s inequality in (6.6) transfers the conclusion to the terminal density ratio. ◻
]

=== 6.3 Replicated Gaussian bridges <replicated-gaussian-bridges>

The terminal projection couples cavity paths through a common endpoint. We represent that coupling by a shared Gaussian part, then show that scores accumulated before a terminal buffer have a small shared part. Their remaining private part can then be integrated in chronological order. To construct the representation, fix the time $d$, the schedule, the moment orders, and all preliminary truncations before taking the dimension limit; $d$ will grow only later. For each terminal state $Z$, take a fixed number of conditionally independent cavity bridges from the same specified start to $Z$. On each branch, form the vector list

#[#set math.equation(numbering: n => "(6.8)")
 $ frac(Y \( s \) - bb(E) Y \( s \), sqrt(n)) quad & upright("at the scheduled coin and last-field times") \,\
1 / sqrt(n) integral_(I_h) theta thin upright(d) M quad & upright("on the required score intervals") . $ <eq:row-bridge-list>]

Conditional on these cavity data, projection by the independent removed row gives an exactly Gaussian list, with covariance $beta^2$ times its Gram matrix. The mean fields require a separate step: replace $J_i bb(E) Y \( s \)$ in the coin probabilities by formal deterministic parameters $macron(h)_s$. We establish the averaged-test comparisons and bounds uniformly in those parameters, and only then substitute the actual values $macron(h)_s = J_i bb(E) Y \( s \)$. This order avoids conditioning the row on its own mean-field projections while continuing to use its original Gaussian covariance.

To obtain the quenched statement, we now concentrate the averaged tests in the removed row. The required gradient bounds come from covariance operators under the ordinary cavity path law. For each unscaled centered field vector in (6.8), that operator is bounded by a constant depending only on $d$: apply the variance conclusion of 3 to every deterministic linear combination of spins, using 13. For an unscaled score vector the covariance operator is bounded by $d$, directly by orthogonal martingale isometry. Although the branches share an endpoint, each has the ordinary path law as its unconditional marginal. For a bounded smooth function $G$ of a fixed list of row projections, Cauchy–Schwarz with the covariance bounds therefore controls the Euclidean gradient of $bb(E)_(upright("cav")) G$ by a constant depending only on the fixed list. Since the row covariance is $beta^2 I \/ n$, Gaussian concentration gives error probability $e^(- c n)$ at each fixed accuracy.

We apply the same procedure to the brackets, first capping each site’s count. With the cap fixed, concentration of a quadratic Gaussian form gives

#[#set math.equation(numbering: n => "(6.9)")
 $ B_h - beta^2 / n sum_(j eq.not i) integral_(I_h) v_j^Y thin upright(d) N_j arrow.r 0 . $ <eq:row-bracket-replacement>]

Poisson tails remove the count cap from the averaged test, and the moment bounds of 36 then permit the required moment passage. The Taylor remainder in (6.3) is handled in the same order. The site-$i$ coins are finite smooth functions of the listed fields; after capping the tested likelihoods, the same concentration estimate applies to their averages. For uniformity in the deterministic mean fields, use a finite net on a compact field range and then the limits of $p_sigma \( h + u \)$ as $h arrow.r plus.minus oo$, truncating the centered $u$ first. This last step allows the deterministic mean field to be unbounded.

It remains to transfer these estimates from a cavity start to a full Gibbs start. They are uniform over the start for every good cavity matrix, and the two Gibbs laws satisfy

$ frac(mu_J \( a \, y \), mu_(J^(\( i \))) \( y \)) = frac(e^(a J_i y), 2 bb(E)_(mu_(J^(\( i \)))) cosh \( J_i Y \)) . $

Since $∥J_i∥ lt.eq C$, the logarithm of this ratio has magnitude $O \( sqrt(n) \)$. The change of measure therefore preserves each fixed exponential failure rate. A union bound over the rows followed by Markov’s inequality gives exponentially small quenched Gibbs mass of bad starts on an event of disorder probability tending to one. At this stage the Gaussian description concerns bounded tests; its extension to moments uses 36.

This Gaussian description does not require deterministic self-Grams. The following representation retains their randomness while separating the part shared by different bridges from the private Gaussian part of each bridge. This is a specialized Dovbysh–Sudakov-type construction; for the general representation, see Panchenko #cite(label("Panchenko2010DS")) Proposition 1, equation (1.2), and Lemmas 2–3. The finite-list principal-coordinate proof needed here is given below, rather than invoking the general representation theorem as a black box.

#thm([Lemma 6.3.])[
  (Shared and private Gaussian parts).  #emph[After subsequence extraction, a replicated array of the lists in (6.8) has the following representation. Conditional on a directing variable $cal(D)$, each branch draws independently its self-Gram matrix $Q$, its bracket data, and a list of vectors $r_alpha$ in one separable real Hilbert space. Cross-Grams between distinct branches are $⟨r_alpha \, r'_gamma⟩$, and $Q - \( ⟨r_alpha \, r_gamma⟩ \)_(alpha \, gamma)$ is positive semidefinite. Include the factor $beta$ in the vectors. Conditional on these data, the row projections have the form 
#[#set math.equation(numbering: n => "(6.10)")
 $ g \( r_alpha \) + xi_alpha \, $ <eq:row-shared-private>]

 where $g$ is one common isonormal process and, independently on each branch, $xi$ is centered Gaussian with covariance $Q - \( ⟨r_alpha \, r_gamma⟩ \)$. Conditional averages in this representation integrate one branch and its coins with $cal(D) \, g$ held fixed.]
] <lem:row-hilbert-representation>

#proof[
  Begin with a finite-dimensional list and condition on $Z$. Diagonalize
  $ T = bb(E) [sum_alpha u_alpha ⊗ u_alpha divides Z] \, $
  where $u_alpha$ denotes a normalized list vector. Work first on the sets where the list norms are bounded. If $Pi_k$ projects on the first $k$ eigenvectors, independence of two branches and $"Tr" T lt.eq K$ give
  $ bb(E) [lr(|⟨\( I - Pi_k \) u_alpha \, \( I - Pi_k \) u'_gamma⟩|)^2 \| Z] lt.eq "Tr" \[ \( \( I - Pi_k \) T \)^2 \] lt.eq frac(K^2, k + 1) . $
  Extract the laws of the finite coordinate lists together with their self-Grams, and then let $k arrow.r oo$. Count tails and the spin-norm bounds remove the preliminary restriction on list norms. The resulting directing law on lists in $ell^2$ identifies the limiting cross-Grams. At every finite coordinate projection, the stated covariance difference is positive semidefinite, and this property persists in the limit. A common isonormal process on $ell^2$, plus independent Gaussians with the covariance difference, realizes exactly these Gaussian Gram arrays. The conditional-average assertion follows from the replicated approximation in 36. ◻
]

=== 6.4 The shared part of a prefix score <the-shared-part-of-a-prefix-score>

The directing-law representation retains the information shared by bridges with the same endpoint. We now show that scores accumulated well before the terminal time have very little shared Gaussian part. For this #emph[prefix score] estimate, set $s = sqrt(d)$ and $T = d - s$. Split scores at $T$ when necessary, leaving at most $m + 2$ intervals. The intervening suffix allows us to use the cavity density bound. Write $kappa \( s \)$ for the constant from the cavity version of 10, so that

$ P_s^(upright("cav")) \( y \, z \) lt.eq e^(n kappa \( s \)) mu_(upright("cav")) \( z \) \, #h(2em) kappa \( s \) lt.eq C e^(- c s^(2 \/ 3)) . $

For any $a > 0$, discard the endpoints at which $Q_d \( z \) < e^(- a n) mu_(upright("cav")) \( z \)$. Their $Q_d$-probability is at most $e^(- a n)$. On the retained endpoints, the joint law of two bridge prefixes, after the common endpoint is integrated out, is dominated by

#[#set math.equation(numbering: n => "(6.11)")
 $ e^(n \( 2 kappa \( s \) + a \)) times upright("the law of two independent cavity prefixes") . $ <eq:row-bridge-domination>]

Indeed its density given the two prefix endpoints $y \, y'$ is $sum_z P_s \( y \, z \) P_s \( y' \, z \) \/ Q_d \( z \)$, restricted to the retained $z$; insert the preceding two bounds and sum $mu_(upright("cav")) \( z \)$.

We first estimate overlaps under the independent-prefix law, where the normalized inner product of any two score vectors is centered. Stop each coordinate martingale when its clock count reaches a fixed large polynomial in $d$. The resulting product martingale has jumps bounded by a polynomial in $d$ and bracket bounded by $n$ times a polynomial in $d$. The bounded-jump exponential martingale inequality then gives, for any inverse-polynomial tolerance,

#[#set math.equation(numbering: n => "(6.12)")
 $ bb(P) (lr(|n^(- 1) sum_j U_j^(\( 1 \)) U_j^(\( 2 \))|) > d^(- b)) lt.eq 2 e^(- n \/ d^(c_b)) . $ <eq:row-independent-overlap>]

Constants can absorb the fixed number of score positions. Removing the coordinate stopping changes normalized squared norms by an arbitrarily small inverse power of $d$: the relevant bound is a constant times $n^(- 1) sum_j N_j \( d \)^2 upright(bold(1))_(N_j \( d \) > d^C)$, whose expectation has this property and whose spatial average converges in probability. These removals are made on each #emph[single bridge marginal], which is the ordinary path law, before using (6.11); a merely subexponential count-tail bound is never multiplied by the bridge density. Since $kappa \( sqrt(d) \)$ is smaller than every inverse power of $d$, choose $a$ with the same property and apply (6.11) to (6.12). For all sufficiently large fixed $d$, every prefix-score cross-Gram is bounded by an arbitrarily prescribed inverse power of $d$ almost surely in the dimension limit.

The almost-sure bound on cross-Grams is the key output of this comparison. The next lemma converts it into a bound on shared-vector norms; a small mean squared overlap would not suffice.

#thm([Lemma 6.4.])[
  (An almost-sure overlap bound in a separable space).  #emph[If $r \, r'$ are independent with the same law in a separable Hilbert space and $\| ⟨\,⟩ r r' \| lt.eq delta$ almost surely, then $∥∥ r^2 lt.eq delta$ almost surely. The same assertion holds conditionally on a directing variable.]
] <lem:row-overlap-norm>

#proof[
  Suppose a support point had squared norm greater than $delta$. Continuity would give a sufficiently small ball about it in which every pair has inner product greater than $delta$. The ball has positive probability, so independence makes this pair event have positive probability, contradicting the hypothesis. A countable base of balls shows, by separability, that the law is carried by its support. The same argument applies to the conditional law for almost every directing variable. ◻
]

Applying 38 position by position shows that the shared vectors of prefix scores satisfy

#[#set math.equation(numbering: n => "(6.13)")
 $ max_(h : thin I_h subset \[ 0 \, T \]) ∥r_h∥ lt.eq d^(- b) quad upright("for every fixed ") b \, $ <eq:row-small-shared-score>]

once $d$ is large enough; the exponent in the preceding overlap test is chosen twice as large. The other shared vectors need not be small. Their norms, and all self-Grams, have polynomial bounds in $d$.

We have controlled the shared prefix scores. To use the private scores chronologically, we also need the self-Gram identities supplied by the single-path martingale calculation. Distinct score intervals are orthogonal; a score’s squared norm equals its bracket in (6.9); and each score is orthogonal to every centered field observed at or before its interval begins. For the last assertion, condition on that earlier field and apply the martingale isometry to its scalar contraction with the later score. For score-score and score-square tests, use the product martingale with the same count stopping as above. In the limit these are identities of the self-Gram data, not assertions that those data have become deterministic. Moreover

#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(h : thin I_h subset \[ 0 \, T \]) B_h lt.eq beta^2 d \, #h(2em) Q_(upright("field") \, upright("field")) lt.eq 4 beta^2 . $ <eq:row-gram-budgets>]

The first inequality uses $v_j^Y lt.eq 1$ and the spatial law of large numbers for the rate-one counts. The second uses the deterministic bound $∥Y \( s \) - bb(E) Y \( s \)∥^2 lt.eq 4 n$.

=== 6.5 The near-one Gaussian estimate <the-near-one-gaussian-estimate>

The self-Gram identities prepare an adapted Gaussian calculation. Subtracting the shared Gram leaves the private scores in (6.10) with small covariances against earlier scores and past fields, controlled by (6.13). We first correct those covariances to zero. The correction is made #emph[conditional on all the self-Gram and bracket data], which may still be random.

The correction must also work for a singular covariance matrix. Set the forbidden entries to zero, restore the score variances to $B_h$, and add to the whole matrix a multiple of the identity equal to the operator norm of that change. The result is positive semidefinite. For a fixed $K$, on schedules with at most $K d$ refreshes, the list has $O_K \( d \)$ coordinates and its covariance has $O_K \( d^2 \)$ entries. Its perturbation norm is bounded by the number of coordinates times the largest changed entry. Thus the added multiple $delta_d$ can be smaller than any fixed inverse power of $d$. The final score variances are $b_h = B_h + delta_d$, so $sum_h b_h lt.eq C d$; replacing the original compensators $B_h \/ 2$ by $b_h \/ 2$ costs only $O_K \( d delta_d \)$. Couple the original and corrected Gaussians through their positive square roots. The inequality $∥Q^(1 \/ 2) - tilde(Q)^(1 \/ 2)∥_(upright("op")) lt.eq C ∥Q - tilde(Q)∥_(upright("op"))^(1 \/ 2)$ gives Gaussian errors with arbitrarily small polynomial variance. The common score shifts $g \( r_h \)$ have the same property.

For each particular spin sequence the change in its coin weight is bounded multiplicatively by $exp \( 2 sum_h \| Delta H_h \| \)$, and the change in its likelihood by $exp \( sum_h \( \| Delta Z_h \| + \| Delta B_h \| \/ 2 \) \)$. The inequalities survive summation over spin sequences. Since the number of positions is $O \( d \)$, fixed exponential moments of the comparison errors cost $e^(o \( d \))$; increasing the inverse-polynomial accuracy makes that cost $e^(o \( 1 \))$. Conditional Hölder inequalities absorb these errors with an arbitrarily small additional change of powers. Thus the correction preserves the desired rate without a lower bound on the eigenvalues of the covariance matrix.

#thm([Lemma 6.5.])[
  (Chronological Gaussian integration).  #emph[Fix self-Gram and bracket data satisfying the corrected identities. Treat all deterministic mean fields and all common field shifts as arbitrary forcing. Let $tilde(Z)_h$ be the corrected prefix scores, of variances $b_h$, with $sum_h b_h lt.eq C d$. Let $a_h in { - 1 \, 1 }$ be the spin chosen using the fields and coins available before score $h$, including a prescribed forced coin when present. For 
$ W = exp {sum_h a_h tilde(Z)_h - 1 / 2 sum_h b_h} \, $

 one has, for every real $r$, 
#[#set math.equation(numbering: n => "(6.15)")
 $ exp (- 1 / 2 \| r \( r - 1 \) \| C d) & lt.eq bb(E) \[ W^r divides upright("self-Gram data and forcing") \]\
 & lt.eq exp (1 / 2 \| r \( r - 1 \) \| C d) . $ <eq:row-near-one>]

 In particular, powers within $eta$ of one cost $e^(O \( eta d \))$.]
] <lem:row-adapted-gaussian>

#proof[
  Fix the specified data. The full list is then Gaussian, and the orthogonality identities make each score independent of the earlier scores and of every field already used to choose its sign. Its variance is $b_h$. It may remain correlated with fields at later coin times, which does not affect this chronological calculation. Generate the Gaussian list and the coins in time order: the sign $a_h$ is measurable before revealing $tilde(Z)_h$, so
  $ bb(E) [exp { r a_h tilde(Z)_h - r^2 b_h \/ 2 } divides upright("past")] = 1 . $
  Their product has mean one. Using $a_h^2 = 1$ and multiplying by $exp { \( r^2 - r \) sum_h b_h \/ 2 }$ proves the bounds. Conditioning on future self-Gram data is legitimate here because the needed Gaussian orthogonality identities hold pointwise for each value of those data. At no point are the scores themselves conditioned on future observed fields. ◻
]

=== 6.6 Completion of the projected moment estimate <completion-of-the-projected-moment-estimate>

#proof[
  The prefix is now controlled at powers close to one. Conditional Hölder inequalities will put every fixed larger power on the short suffix and on the last-spin factor. First retain schedules with at most $K d$ refreshes. In the limiting representation, factor
  $ L_theta F_sigma = W_(upright("pre")) U \, #h(2em) A = bb(E) \[ W_(upright("pre")) U divides cal(D) \, g \] \, $
  where the prefix ends at $T = d - sqrt(d)$ and $U$ contains the suffix and the normalized last-spin factor, wherever that last refresh occurs. For each fixed $q$, positive and negative moments of the suffix likelihood are at most $e^(C_q sqrt(d))$. Apply the forward martingale calculation on the interval of length $sqrt(d)$, and then use the fixed-$d$ moment passage proved above. The last-field factor has bounded moments independent of $d$ in this limiting calculation: its centered Gaussian field has variance at most $4 beta^2$ by (6.14), before the common and private parts are separated. Hölder therefore gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(E) \[ \| U \|^q + \| U \|^(- q) \] lt.eq 2 e^(C_q \( 1 + sqrt(d) \)) . $ <eq:row-suffix-cost>]
  The deterministic field means disappear from this bound through (6.4).
  For $0 < eta < 1$, conditional Hölder gives the two inequalities
  #[#set math.equation(numbering: n => "(6.17)")
   $ A & lt.eq bb(E) \[ W_(upright("pre"))^(1 + eta) divides cal(D) \, g \]^(1 \/ \( 1 + eta \)) bb(E) \[ U^(\( 1 + eta \) \/ eta) divides cal(D) \, g \]^(eta \/ \( 1 + eta \)) \,\
bb(E) \[ W_(upright("pre"))^(1 - eta) divides cal(D) \, g \] & lt.eq A^(1 - eta) bb(E) \[ U^(- \( 1 - eta \) \/ eta) divides cal(D) \, g \]^eta . $ <eq:row-holder-upper>]
  For example, the second follows by writing $W_(upright("pre"))^(1 - eta) = \( W_(upright("pre")) U \)^(1 - eta) U^(- \( 1 - eta \))$. This second inequality supplies the inverse-moment bound: inverse powers of $A$ are controlled by inverse powers of the prefix conditional average together with positive powers of a suffix moment.
  By 39, each corrected prefix conditional average with power $1 plus.minus eta$ lies between $e^(- C eta d)$ and $e^(C eta d)$, uniformly in the branch data and common field forcing. Jensen permits integration over the directing law and also taking inverse powers. The small common score and covariance-coupling errors discussed above are handled by Hölder, with a power change smaller than $eta$. Combining (6.17), (6.17), (6.16) yields for every fixed $p > 0$
  #[#set math.equation(numbering: n => "(6.18)")
   $ log bb(E) \[ A^p + A^(- p) \] lt.eq C_p eta d + C_(p \, eta) \( 1 + sqrt(d) \) + o \( d \) . $ <eq:row-final-rate>]
  This inequality concerns the moments after the dimension limit. Now send $d arrow.r oo$ and then $eta arrow.b 0$. The rough full-horizon constants from 36 served only to identify these limiting moments; they contribute no additional term to (6.18).
  Hölder’s inequality in (6.6) proves the required bound for every retained schedule. We next remove the schedule conditioning. Under the ordinary path law, the tower property gives
  $ A_(i \, x)^M \( X_d \) = bb(E)_x \[ A_(i \, x)^(M \, cal(S)) \( X_d \) divides X_d \] . $
  The conditional expectation averages the schedule with its ordinary conditional law given $X_d$. For $r gt.eq 1$ or $r < 0$, conditional Jensen therefore decreases the moment when the schedule is no longer observed. Control the omitted schedules by a higher raw likelihood moment, Hölder’s inequality, and the Poisson estimate
  $ bb(P) { N_i \( d \) > K d } lt.eq e^(- d \( K log K - K + 1 \)) . $
  The raw bounds are uniform conditional on the schedule. Taking $K$ large after the desired moment order makes this contribution smaller than any prescribed $e^(- H d)$. The powers $0 lt.eq r lt.eq 1$ again follow from Jensen. This completes the moment estimate.
  It remains to obtain the stated exceptional sets, including for an integrated family of masks. Fix $d$, the schedule-count cutoff, the moment orders, and the comparison accuracies. Every row concentration constant above is then uniform in the mask parameters and deterministic schedule times. If $cal(B) \( J \, x \, alpha \)$ denotes a failure of one of the finitely many bounded tests, its row-and-start bound has the form
  $ bb(E)_J integral mu_J \( thin upright(d) x \) integral upright(bold(1))_(cal(B) \( J \, x \, alpha \)) thin nu \( thin upright(d) alpha \) lt.eq C e^(- c n) $
  on the common good cavity events. Apply Fubini at this point, before choosing the quenched event. Markov’s inequality gives integrated Gibbs bad mass at most $e^(- c n \/ 2)$ outside an event of probability $C e^(- c n \/ 2)$. If necessary, apply Markov once more to remove starts with excessive bad-schedule mass, and use higher rough moments to bound its contribution. The countable approximations are fixed successively, with arbitrary fixed slack, so their finite good events suffice before the dimension limit. Polynomial endpoint weights and an $e^(o \( n \))$ initial density preserve negligibility. At fixed times the remaining integrands are dominated by the rough moment bounds and the relevant mean-square vector budgets.
  In a path expansion the order is therefore: fix the global time, hop cutoff, shapes, elementary caps, moment orders, and label bins; integrate over their deterministic simplex parameters; take dimension to infinity; then remove caps and approximation errors; finally increase the global time and decrease rate slack. Annulus and first-exceedance restrictions multiply a positive masked label by factors in $\[ 0 \, 1 \]$. Its positive moments are bounded by those of the unrestricted label; no inverse moment of a restricted label is used. A selected start or endpoint vector changes the weights in this integrated assertion and does not choose an exceptional mask. Likewise, good interior times can be chosen from a positive-measure set after an integrated estimate; a prescribed worst time is not being asserted to be good. ◻
]

#thm([Corollary 6.6.])[
  (Stationary endpoint predictors).  #emph[Let $a_i$ be a nonnegative row label on a span of length $d$, bounded above by a masked likelihood $ell_i^M$; factors $v_i lt.eq 1$ and cutoff indicators are allowed. Its stationary predictor at the right endpoint has every fixed positive spatial moment bounded by $e^(o \( d \))$. The same bound holds after conditioning at a later endpoint. Its predictor at the left endpoint is bounded by one. Raw fixed-order moments cost at most $e^(C_p d)$.]
] <cor:row-stationary-predictors>

#proof[
  For $p gt.eq 1$, condition on both endpoints of the span and then apply Jensen to the left endpoint’s conditional law given the right endpoint. The resulting integral over ordinary starts is bounded by 35. A higher raw moment and Hölder’s inequality make the exponentially small bad-start contribution negligible. The Markov property and stationarity make conditioning at a later endpoint another $L^p$ contraction. At the left endpoint, the bound follows directly from $bb(E)_x a_i lt.eq bb(E)_x ell_i^M = 1$. Powers between zero and one follow by concavity. The raw bound is 13. ◻
]

=== 6.7 The positive spin spectral measure <the-positive-spin-spectral-measure>

We turn to the spectral input for hidden propagation. Let $E_n \( thin upright(d) u \)$ be the spectral resolution of $- L$ on $L^2 \( mu \)$, and encode the spin coordinates by the positive matrix-valued measure

$ sans(M)_n \( thin upright(d) u \)_(i j) = ⟨x_i \, E_n \( thin upright(d) u \) x_j⟩_mu \, #h(2em) rho_n \( thin upright(d) u \) = 1 / n "Tr" sans(M)_n \( thin upright(d) u \) . $

Spin inversion centers every $x_i$. Consequently, $rho_n$ is a probability measure on the positive spectrum; on the good gap event, its support lies in $\[ gamma \, oo \)$. The heat-bath normalization also identifies its first two moments:

#[#set math.equation(numbering: n => "(6.19)")
 $ integral u thin rho_n \( thin upright(d) u \) = 1 / n sum_i bb(E)_mu v_i lt.eq 1 \,\
integral u^2 rho_n \( thin upright(d) u \) = 1 / n sum_i bb(E)_mu \( m_i - x_i \)^2 = 1 / n sum_i bb(E)_mu v_i . $ <eq:spin-first-second>]

These bounds give tightness and uniform integrability of the first moments. The deterministic stationary spin limits from 22 identify a unique deterministic probability measure $rho$ to which the measures converge in probability. Its Laplace transform is

#[#set math.equation(numbering: n => "(6.20)")
 $ C \( t \) = integral e^(- u t) rho \( thin upright(d) u \) = lim_(n arrow.r oo) 1 / n sum_i ⟨x_i \, S_t x_i⟩_mu . $ <eq:spin-correlation>]

Set

$ lambda_(upright("sp")) = inf "supp" rho > 0 \, #h(2em) R \( t \) = - C' \( t \) = integral u e^(- u t) rho \( thin upright(d) u \) . $

For $z < lambda_(upright("sp"))$, put

$ hat(R) \( z \) = integral_0^oo e^(z t) R \( t \) thin upright(d) t . $

The transform is finite and strictly increasing, and $hat(R) \( 0 \) = 1$. All these definitions take dimension to infinity first.

#thm([Proposition 6.7.])[
  (Spin edge and the two renewal inequalities).  #emph[For $0 < beta < 1$, 
#[#set math.equation(numbering: n => "(6.21)")
 $ 0 < lambda_(upright("sp")) lt.eq \( 1 - beta \)^2 \, #h(2em) beta hat(R) \( z \) < 1 \, #h(2em) beta^2 hat(R) \( z \) < 1 - z quad \( z < lambda_(upright("sp")) \) . $ <eq:spin-conditions>]

 Let $P_0 \( u \) = 1$, $P_1 \( u \) = u$, and $P_(k + 1) \( u \) = u P_k \( u \) - P_(k - 1) \( u \)$ be the monic second-kind Chebyshev polynomials. If 
$ R_k \( t \) = lim_(n arrow.r oo) 1 / n "Tr" [P_k \( J \/ beta \) integral u e^(- t u) sans(M)_n \( thin upright(d) u \)] \, $

 then 
#[#set math.equation(numbering: n => "(6.22)")
 $ hat(R)_k \( z \) = beta^k hat(R) \( z \)^(k + 1) \, #h(2em) z < lambda_(upright("sp")) . $ <eq:spin-trunk-transform>]

 The limiting covariance trace density with respect to the semicircle law $rho_(upright("sc"))$ on $\[ - 2 \, 2 \]$ is 
#[#set math.equation(numbering: n => "(6.23)")
 $ lim_(n arrow.r oo) 1 / n "Tr" #scale(x: 120%, y: 120%)[\[] q \( J \/ beta \) bb(E)_mu \( x x^(sans(T)) \) #scale(x: 120%, y: 120%)[\]] = integral_(- 2)^2 frac(q \( u \), 1 - beta u + beta^2) rho_(upright("sc")) \( thin upright(d) u \) $ <eq:spin-covariance-density>]

 for every polynomial $q$.]
] <prop:spin-spectrum>

#proof[
  The proof proceeds from a time-domain diagram identity to the transform bound, then identifies the covariance trace density and tests its edge. We first derive the diagram identity, making explicit the role of stationarity. Integration by parts and gradient intertwining yield
  #[#set math.equation(numbering: n => "(6.24)")
   $ R \( t \) = lim_(n arrow.r oo) 1 / n "Tr" bb(E)_mu \[ D_v K_t I \] . $ <eq:spin-gradient-trace>]
  Here $K_t I$ applies $K_t$ to each constant coordinate vector. Insert the Duhamel expansion and use 22: visible finite-rank terms vanish in normalized trace, each hop contributes $beta s D_v$, and the remaining trace is the sum of complete noncrossing pairings. Each resulting vertex carries the product of its diagonal waiting likelihoods, its arrivals $v$, and the bare factors $e^(- h)$. These are nonnegative. The root initially carries $v$, as in (6.24).
  The recurrence for $P_k \( s \)$ removes exactly the adjacent returning contraction, making this polynomial the Wick string of $k$ consecutive edges. Each of its edges must therefore pair into the Duhamel walk. Removing those $k$ pairs exposes an ordered trunk of $k + 1$ completely paired rooted time intervals. Each interval starts with a $v$ weight, including the interval at the original root, and each trunk edge contributes $beta$. Conversely, concatenate $k + 1$ rooted complete diagrams and adjoin the outside Wick string. This recovers one and only one pairing, so no multiplicity factor appears. After contraction, distinct vertices contribute scalar traces. Stationarity makes each interval’s trace depend only on its duration. The separation into scalar factors comes from the noncrossing contraction, rather than from temporal independence of intervals along one spin history. The spin/site self-averaging assertion in 22 is what identifies each such scalar factor with its stationary trace when it is represented by independent samples. It is used only for spin, field, and likelihood labels.
  The simplex integral over the successive interval lengths therefore gives the convolution identity
  #[#set math.equation(numbering: n => "(6.25)")
   $ R_k \( t \) = beta^k R^(* \( k + 1 \)) \( t \) . $ <eq:spin-trunk-convolution>]
  For the limiting argument, first keep time, Duhamel order, and likelihood caps fixed. Then 13 removes the caps and order cutoff in the matrix $L^2$ comparison, establishing the identity at each fixed $t$. Because the complete-diagram terms are nonnegative, we may also sum them monotonically when taking Laplace transforms.
  To pass to transforms, we need a bound that is valid before the dimension limit and does not require a finite-dimensional resolvent at $z$. Positivity supplies it: for a positive matrix $B$ and a self-adjoint $Q$, $\| "Tr" \( Q B \) \| lt.eq ∥∥ Q_(upright("op")) "Tr" B$. At finite $n$ apply this to the positive matrix $integral u e^(- t u) sans(M)_n \( thin upright(d) u \)$ and to $Q = P_k \( J \/ beta \)$. The Wigner spectral bound and $sup_(\[ - 2 \, 2 \]) \| P_k \| = k + 1$ show that, after the dimension limit,
  #[#set math.equation(numbering: n => "(6.26)")
   $ \| R_k \( t \) \| lt.eq \( k + 1 \) R \( t \) . $ <eq:spin-polynomial-domination>]
  The same justification can be expressed through truncated integrals: integrate the finite-dimensional inequality over $0 lt.eq t lt.eq T$, take the dimension limit, and then send $T arrow.r oo$. The right-hand side is integrable for $z < lambda_(upright("sp"))$. Tonelli’s theorem applied to (6.25) now proves (6.22) and yields
  $ \( beta hat(R) \( z \) \)^k lt.eq k + 1 . $
  Taking $k$th roots yields $beta hat(R) \( z \) lt.eq 1$. Given $z < lambda_(upright("sp"))$, choose $z'$ strictly between them. Since $hat(R)$ is strictly increasing, $beta hat(R) \( z \) < beta hat(R) \( z' \) lt.eq 1$.
  Integrating (6.25) at $z = 0$ gives
  $ lim_(n arrow.r oo) 1 / n "Tr" [P_k \( J \/ beta \) bb(E)_mu \( x x^(sans(T)) \)] = beta^k . $
  Once again, justify the integral by first stopping at fixed $T$. The spectral gap bounds the omitted covariance tail by $∥P_k \( J \/ beta \)∥_(upright("op")) e^(- gamma T)$. To identify the resulting covariance density, use the orthonormality of the $P_k$ for $rho_(upright("sc"))$ and the generating function
  $ sum_(k gt.eq 0) beta^k P_k \( u \) = frac(1, 1 - beta u + beta^2) quad \( - 2 lt.eq u lt.eq 2 \) \; $
  the series converges uniformly because $beta < 1$ and $\| P_k \( u \) \| lt.eq k + 1$. This proves (6.23). The measure identified here is positive: at finite $n$ it is the trace of the positive covariance matrix against the spectral projections of $J \/ beta$.
  We next use this covariance density to bound the spin edge. Fix a real polynomial $q$. Weighting $sans(M)_n$ by $q \( J \/ beta \)^2$ gives a nonnegative scalar spectral measure, dominated by $∥q \( J \/ beta \)∥_(upright("op"))^2 rho_n$. All its limiting mass therefore lies in $\[ lambda_(upright("sp")) \, oo \)$, even though the finite-dimensional spin measures may put small masses below that edge. Its first moment satisfies
  $ 1 / n "Tr" #scale(x: 120%, y: 120%)[\[] q \( J \/ beta \)^2 D_(bb(E)_mu v) #scale(x: 120%, y: 120%)[\]] lt.eq 1 / n "Tr" q \( J \/ beta \)^2 \, $
  because the energy matrix $integral u sans(M)_n \( thin upright(d) u \)$ is exactly $D_(bb(E)_mu v)$. Use (6.23), and then the semicircle trace limit, to obtain
  #[#set math.equation(numbering: n => "(6.27)")
   $ lambda_(upright("sp")) integral frac(q \( u \)^2, 1 - beta u + beta^2) rho_(upright("sc")) \( thin upright(d) u \) lt.eq integral q \( u \)^2 rho_(upright("sc")) \( thin upright(d) u \) . $ <eq:spin-edge-test>]
  Alternatively, discard scalar spectral mass below $lambda_(upright("sp")) - delta$ before sending $delta arrow.b 0$. This gives the same inequality without requiring a uniform finite-$n$ lower edge. Choose $q_m \( u \) = \( \( u + 2 \) \/ 4 \)^m$. After normalization, the measures $q_m^2 rho_(upright("sc"))$ concentrate at $2$. Letting $m arrow.r oo$ in (6.27) gives $lambda_(upright("sp")) lt.eq 1 - 2 beta + beta^2$.
  Finally, for $0 lt.eq z < lambda_(upright("sp"))$,
  $ beta^2 hat(R) \( z \) < beta < 2 beta - beta^2 lt.eq 1 - lambda_(upright("sp")) < 1 - z . $
  For $z < 0$, $hat(R) \( z \) lt.eq hat(R) \( 0 \) = 1$ and $beta^2 < 1 < 1 - z$. These prove the second renewal inequality and complete (6.21). ◻
]

The two strict inequalities control different vertices in the path expansion. An ordinary interior trunk vertex has integrated weight $beta hat(R) \( z \) < 1$. If its initial variance factor is dropped, we instead retain the bare waits and sum any number of paired side excursions. The resulting bound is the geometric renewal resolvent

#[#set math.equation(numbering: n => "(6.28)")
 $ frac(1, 1 - z - beta^2 hat(R) \( z \)) < oo . $ <eq:spin-exceptional-renewal>]

A bare wait contributes the transform $\( 1 - z \)^(- 1)$. Each inserted excursion contributes two hops and one rooted paired interval, hence the transform $beta^2 hat(R) \( z \)$. Summing successive insertions gives (6.28), with the bare waits retained throughout. The bound applies because $z < lambda_(upright("sp")) < 1$.

== 7 Averaging and propagation on the hidden complement <sec:hidden>

Assume $0 < beta < 1$. Our objective is to bound propagation on the complement of the recipe space. This bound separates the bulk spectral edge from any slower eigenvalues visible in that space. We use the typicality convention of 22 for the path law, endpoint vectors, and auxiliary trees throughout. Thus the initial density is bounded above by $exp \( o \( n \) \)$ relative to equilibrium, the pointwise bounds are polynomial in $n$, and dimension tends to infinity before any approximation or large-time limit. An endpoint vector $u$ is #emph[hidden] if

$ bb(E) lr(|u^t B|)^2 arrow.r 0 $

for every fixed recipe vector $B$ at that endpoint. We write $∥u∥_2 = \( bb(E) ∥u∥^2 \)^(1 \/ 2)$; the norm inside the expectation is the unnormalized Euclidean norm. The same notation for a diagonal label means $∥a∥_(2 \, tau) = tau \( a^2 \)^(1 \/ 2)$, and will always carry the subscript $tau$ to distinguish these two normalizations.

#thm([Theorem 7.1.])[
  (Hidden propagation).  #emph[Let $lambda_(upright("sp"))$ be the spin spectral edge in 41. For every $z < lambda_(upright("sp"))$ there is a finite constant $C_z$ with the following property. Fix $t gt.eq 1$, and let $u = u \( X_0 \)$ and $p = p \( X_t \)$ be polynomially bounded endpoint vectors with bounded second moments. Suppose that $u$ is hidden, $p = d f$ is an exact gradient, and 
#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E) sum_j w_j \( X_t \) ∥d_j p \( X_t \)∥^2 lt.eq C_t < oo $ <eq:hidden-energy-hypothesis>]

 uniformly along the dimension sequence. Then 
#[#set math.equation(numbering: n => "(7.2)")
 $ limsup_(n arrow.r oo) lr(|bb(E) u^t K_t p|) lt.eq C_z e^(- z t) limsup_(n arrow.r oo) #scale(x: 120%, y: 120%)[\(] ∥u∥_2 ∥p∥_2 #scale(x: 120%, y: 120%)[\)] . $ <eq:hidden-propagation>]

 The constant does not depend on the bound in (7.1); that bound is allowed to depend on the fixed time $t$. Equivalently, the rate on the right is $exp \[ - \( lambda_(upright("sp")) - o \( 1 \) \) t \]$, with the dimension limit taken first. The assertion also holds in the integrated deterministic-time and mask comparisons of Theorem 5.1, Theorem 6.1.]
] <thm:hidden-propagation>

We first average a Wick string from its two endpoints, with at most one vertex retaining its actual path label. We then control the endpoint predictors by likelihood caps and sum the positive rooted excursions at every parameter strictly below the spin edge. The derivative work belongs to the averaging step: exactness converts (7.1) into an unweighted Hessian bound after a field cutoff.

=== 7.1 Wick strings and two-ended centering <subsec:hidden-wick>

Begin with fixed times, finitely many hops, and bounded diagonal labels. In the word calculus, put $s = J \/ beta$ and denote by $B_k \( a_0 \, dots.h \, a_k \)$ the Wick string with $k$ unpaired $s$-edges and vertex labels $a_0 \, dots.h \, a_k$. The normalization is $B_0 \( a \) = D_a$, and contracting adjacent edges around a vertex labeled $a$ replaces that label by $tau \( a \)$. Powers of $beta$ are kept outside this notation, so each actual path edge contributes a factor $beta$. Removing complete noncrossing excursions expresses a general path word as a sum of Wick strings. At each surviving vertex, multiply the labels from its repeated visits; keep the removed excursions as separate scalar trace factors. The surviving labels have ordered time spans with disjoint interiors.

In the Fock representation from 22, $s = l + l^(*)$ and $l^(*) D_a l = tau \( a \) I$. The Wick string is the sum of the $k + 1$ terms having creations to the left of a cut and annihilations to its right. In particular,

#[#set math.equation(numbering: n => "(7.3)")
 $ ∥B_k \( a_0 \, dots.h \, a_k \)∥_(upright("op")) lt.eq sum_(h = 0)^k ∥a_h∥_oo product_(j eq.not h) ∥a_j∥_(2 \, tau) . $ <eq:hidden-cut-bound>]

The norm here is taken in the representation with the full diagonal base. A diagonal with support of limiting trace zero can still act on that base. If it occurs at the cut, (7.3) retains its supremum norm.

There is also the exact splitting identity, for $0 < r < k$,

#[#set math.equation(numbering: n => "(7.4)")
 $ B_k \( a_0 \, dots.h \, a_k \) =  & B_r \( a_0 \, dots.h \, a_(r - 1) \, 1 \) D_(a_r) B_(k - r) \( 1 \, a_(r + 1) \, dots.h \, a_k \)\
 & - tau \( a_r \) B_(r - 1) \( a_0 \, dots.h \, a_(r - 1) \) B_(k - r - 1) \( a_(r + 1) \, dots.h \, a_k \) . $ <eq:hidden-wick-split>]

No subtraction is needed at an end vertex. For an interior vertex, expand the Wick polynomial by inclusion–exclusion over disjoint adjacent contracted pairs. The first line collects the choices that leave the pair incident to $r$ uncontracted. The remaining choices contract that pair and carry a minus sign, producing the second line. This verification allows arbitrary vertex labels; constancy is not used.

For a label $a$ on a path from $0$ to $t$, let $a^0$ and $a^1$ denote its stationary conditional predictors from $X_0$ and $X_t$, respectively. They are the tracial predictors supplied by 22, represented by bounded approximating recipes in successive limits. Covariance identities require a different order: choose a bounded path approximant and subtract its exact conditional prediction. Keeping these operations distinct avoids a pointwise regularity requirement on an exact quenched predictor at rare states.

#thm([Lemma 7.2.])[
  (Two-ended averaging).  #emph[Let $a_0 \, dots.h \, a_k$ be bounded path labels of the preceding kind. Under the endpoint hypotheses of 42, 
#[#set math.equation(numbering: n => "(7.5)")
 $ B_k \( a_0 \, dots.h \, a_k \) med tilde.op med & sum_(r = 0)^k B_k \( a_0^0 \, dots.h \, a_(r - 1)^0 \, a_r \, a_(r + 1)^1 \, dots.h \, a_k^1 \)\
 & - sum_(r = 0)^(k - 1) B_k \( a_0^0 \, dots.h \, a_r^0 \, a_(r + 1)^1 \, dots.h \, a_k^1 \) . $ <eq:hidden-averaging>]

 Here $T tilde.op T'$ means that $bb(E) u \( X_0 \)^t \( T - T' \) p \( X_t \)$ tends to zero after the prescribed successive approximations. The identity is an identity in these bilinear tests, not an operator-norm replacement of every path label by its predictor. The error will contain two distinguished factors: one centered from the initial endpoint and one from the terminal endpoint.]
] <lem:hidden-averaging>

To prove the averaging identity, first isolate its algebraic error. Multilinearity gives the exact difference between the two sides of (7.5):

#[#set math.equation(numbering: n => "(7.6)")
 $ sum_(0 lt.eq r < q lt.eq k) B_k #scale(x: 120%, y: 120%)[\(] a_(< r)^0 \, med a_r - a_r^0 \, med a_(r < j < q) \, med a_q - a_q^1 \, med a_(> q)^1 #scale(x: 120%, y: 120%)[\)] . $ <eq:hidden-double-centered-error>]

Telescope at the first mismatch from the left and then telescope the remaining suffix from the right. The all-initial term cancels the last term of the second telescope. Thus (7.6) retains the actual labels between the two distinguished vertices. It remains to prove that each doubly centered summand has zero limiting bilinear test.

The first use of the next lemma is to cut off large terminal fields before estimating the Hessian. A localized endpoint vector can give those fields substantial Euclidean mass even when their spatial trace is small. The two centered factors make their removal possible in the present bilinear test.

#thm([Lemma 7.3.])[
  (Small-trace replacements in a centered string).  #emph[Consider a summand of (7.6). Its bounded labels may be approximated in tracial $L^2$ while keeping the two distinguished factors centered at their respective endpoints. The error in the hidden bilinear test tends to zero with the tracial errors. A bounded diagonal of vanishing trace support can also be inserted at the terminal endpoint at zero cost in this test.]
] <lem:hidden-small-trace>

#proof[
  The Fock comparisons in this proof first remove the terminal visible component, as in the endpoint projection argument used below for the predictor caps. Fix a finite family of endpoint recipes with nonsingular limiting Gram matrix, and let $Q_m$ be their actual orthogonal projection on the corresponding Gram-good event, and zero off that event. Both $Q_m$ and $I - Q_m$ are contractions. For every fixed capped path word $W$, Cauchy–Schwarz bounds the removed pairing by $parallel Q_m W^t u parallel_2 parallel p parallel_2$, which tends to zero at fixed $m$ by Assertion (ii) of 22 and the fixed inverse Gram bound. The weighted typicality convention removes the exceptional Gram event. Exhaust the endpoint recipe completion, omitting null directions, and choose $m = m \( n \) arrow.r oo$ sufficiently slowly that these errors vanish for every fixed word and $\( I - Q_m \) p$ is hidden for every fixed endpoint recipe. Its second-moment and polynomial bounds follow from contraction. The projection depends only on the shared endpoint and its fixed seeds, so permutations of the replicated branches preserve it. This projection is used only for the Fock bilinear comparisons; we retain the original exact $p$ for the Hessian estimates that follow.
  Work on one finite tree and use the cut expansion behind (7.3). Every cut away from the replaced factor puts that factor on a pure creation or pure annihilation side. Its trace two-norm then bounds the error, multiplied by the fixed bounds on the other factors and the two endpoint norms. Only the cut at the replaced factor needs another argument. At that cut, at least one distinguished centered factor lies on the pure side leading to its own centering endpoint.
  Attach $b$ conditionally independent copies at this endpoint. Lift this single replicated star to the Fock representation, and symmetrize by taking a direct sum over permutations of the copies. Repeatedly applying $l^(*) D_a l = tau \( a \) I$ expresses inner products of pure-side strings as products of pair traces. For different copies, one factor is the pair trace of the centered label and has zero limit. With approximated predictors, bound its absolute value by $eta$, tending to zero with the approximation. Write $C_alpha$ for the pure-side creation operator on copy $alpha$, oriented toward the shared endpoint. The Gram bounds are
  $ ∥C_alpha^(*) C_alpha∥ lt.eq C \, #h(2em) ∥C_alpha^(*) C_gamma∥ lt.eq C eta quad \( alpha eq.not gamma \) \, #h(2em) ∥\[ C_1 med dots.h.c med C_b \]∥^2 lt.eq C \( 1 + \( b - 1 \) eta \) . $
  If $v$ denotes the vector at the shared endpoint, symmetry of the lifted star gives
  $ bb(E) ∥C_1^(*) v∥^2 = 1 / b sum_(alpha = 1)^b bb(E) ∥C_alpha^(*) v∥^2 lt.eq C \( b^(- 1) + eta \) bb(E) ∥v∥^2 . $
  The vector at the opposite end may depend on its whole branch; Cauchy–Schwarz now bounds the squared bilinear contraction by
  $ C #scale(x: 120%, y: 120%)[\(] b^(- 1) + eta #scale(x: 120%, y: 120%)[\)] ∥u∥_2^2 ∥p∥_2^2 . $
  The fixed caps bound the diagonal Gram blocks. Apply Cauchy–Schwarz and take the limits $n arrow.r oo$, $eta arrow.r 0$, and $b arrow.r oo$ in that order to obtain zero. All cuts for this replacement are treated on the same star. The argument makes no simultaneous choice of creation operators on stars rooted at different endpoints.
  A terminal insertion with small trace support has the same two cases. Every nonterminal cut pays its trace two-norm; at the terminal cut, the left distinguished factor lies on its centered pure side, so the replication argument applies. Iterate for finitely many replacements. When the replaced factor is an approximated distinguished label, keep its exact forward or backward subtraction throughout this step and use the other distinguished factor at the exceptional cut.
  The word comparison retains every rare diagonal’s action on the base. Small trace is used on a pure side, and centering treats the remaining cut; neither step uses the false implication $tau \( c^2 \) arrow.r 0 arrow.r.double ∥D_c∥_(upright("op")) arrow.r 0$. ◻
]

=== 7.2 The Hessian cutoff and the covariance norm <subsec:hidden-covariance>

The covariance proof will pair a terminal Hessian with a matrix in Hilbert–Schmidt norm. We first obtain the required unweighted Hessian bound. Let $h_i \( x \) = \( J x \)_i$ and choose a smooth function $chi_M$ equal to one on $\[ - M \, M \]$, vanishing outside $\[ - M - 1 \, M + 1 \]$, and with uniformly bounded first derivative. In each double-centered test, replace $p$ by

$ p_i^(\( M \)) \( x \) = chi_M \( h_i \( x \) \) p_i \( x \) . $

As $M arrow.r oo$, the field tail has vanishing spatial trace. 44 therefore justifies this replacement inside each double-centered test. This use of $p^(\( M \))$ does not require unweighted-norm approximation of an arbitrary localized $p$.

Write $d p = \( d_j p_i \)_(i \, j)$, with the component index as row and the derivative index as column. The exact product rule is

#[#set math.equation(numbering: n => "(7.7)")
 $ d_j \( f g \) = f thin d_j g + g thin d_j f - 2 x_j \( d_j f \) \( d_j g \) \, #h(2em) f \( x^j \) = f \( x \) - 2 x_j d_j f \( x \) . $ <eq:hidden-product-rule>]

Using the second form of this rule gives

$ d_j p_i^(\( M \)) = chi_M \( h_i \( x^j \) \) d_j p_i + p_i thin d_j chi_M \( h_i \) . $

For sufficiently large $n$, $max_(i j) \| J_(i j) \| lt.eq 1$. On the support of the first coefficient, $\| h_i \( x \) \| lt.eq M + 3$, and hence $w_i \( x \) gt.eq c_M > 0$. Mixed-gradient symmetry and the row square bound therefore give the pointwise estimate

#[#set math.equation(numbering: n => "(7.8)")
 $ ∥d p^(\( M \))∥_(upright("HS"))^2 & lt.eq C_M sum_(i \, j) w_i \| d_i p_j \|^2 + C sum_i p_i^2 sum_j J_(i j)^2\
 & lt.eq C_M sum_i w_i ∥d_i p∥^2 + C ∥p∥^2 . $ <eq:hidden-cutoff-hessian>]

The cutoff supplies the bounded unweighted mean-square Hessian needed below. This conversion is the averaging proof’s only use of the symmetry $d_j p_i = d_i p_j$.

We will absorb fixed smooth endpoint words into the terminal vector, so we also need preservation of this Hessian bound. Check the two generators, a bounded diagonal $D_f$ and $J$. For a diagonal, write $D f = \( d_j f_i \)_(i \, j)$ and use

#[#set math.equation(numbering: n => "(7.9)")
 $ d \( D_f q \) = D_f thin d q + D_q thin D f - 2 \( D f compose d q \) D_x . $ <eq:hidden-matrix-product-rule>]

The derivative matrix $D f$ has bounded operator norm by the smooth recipe calculus. Consequently $∥D_q D f∥_(upright("HS")) lt.eq ∥q∥ ∥D f∥_(upright("op"))$, and the other two terms are controlled by $∥d q∥_(upright("HS"))$. Multiplication by $J$ costs its bounded operator norm. These estimates, with the exact last term of (7.9), prove the assertion by induction through the endpoint word.

The second preparation concerns a correlated hidden vector. We need a pointwise operator estimate for a conditionally averaged derivative, because a tracial or averaged Hilbert–Schmidt error need not remain small after its rows are weighted by that vector.

At a joining time $s$, condition on $X_s = x$ and the realized past $pi$. For a fixed smooth multitime site-vector calculation $F$ satisfying 15, put

$ A \( x \, pi \) = d_x bb(E) \[ F divides X_s = x \, pi \] \, $

with output as row and derivative index as column. First take the conditional expectation. 16 then supplies common linear truncations $A_N$ with

#[#set math.equation(numbering: n => "(7.10)")
 $ ∥\( A - A_N \)^t c∥ \( x \, pi \) lt.eq C_F epsilon_N ∥∥ c \, #h(2em) sup_(x \, pi) ∥A - A_N∥_(upright("op")) lt.eq C_F epsilon_N \, quad epsilon_N arrow.b 0 . $ <eq:hidden-conditional-op>]

The first inequality holds for every output vector $c$ at the same fixed $\( x \, pi \)$, using the same truncation. Taking its supremum over $c$ therefore gives the operator estimate before any expectation.

Recall why this lemma applies to multitime labels. Their mixed tensors retain at most one difference in each observed-state slot. When a conditional starting state $z$ is copied into a stored parent $y$, the exact rule is

$ d_j \[ G \( y \, z \) \|_(z = y) \] = \[ d_j^y G + d_j^z G - 2 y_j d_j^y d_j^z G \]_(z = y) . $

The mixed correction is among those retained tensors. The finite leaf-elimination argument of 16 uses point-start $K$ bounds on the evolving index, with all other indices as Hilbert coordinates; copying indices is a norm-one coordinate restriction. It approximates the differentiated conditional expectation itself, rather than differentiating an approximation to its value. Thus, even when $u = u \( X_0 \)$ is correlated with $\( x \, pi \)$,

#[#set math.equation(numbering: n => "(7.11)")
 $ ∥D_u \( A - A_N \)∥_(upright("HS"))^2 = sum_i \| u_i \|^2 ∥"row"_i \( A - A_N \)∥^2 lt.eq C_F^2 epsilon_N^2 ∥u∥^2 . $ <eq:hidden-row-weighted-error>]

This is the row-weighted truncation bound used in the covariance calculation below.

Apply the operator estimate before opening auxiliary paths. Then Lemma 5.10, Proposition 5.12 approximate the fixed mixed tensors by tensor networks in operator norm and place their opened contractions in the path-matrix closure. The retained matrices satisfy the entry and Hadamard rules of 22. This concerns fixed capped histories after opening; it gives no operator-norm approximation of an arbitrary conditional expectation by finitely many Monte Carlo samples.

#thm([Lemma 7.4.])[
  (A marked continuing derivative).  #emph[Fix an opened, capped derivative history of one smooth multitime label. Suppose it has an entering derivative index, at least one branch differentiating that label, and one derivative index continuing to a later factor. Its temporal derivative tree has a unique path between the entering and continuing indices. Absorb the part before its first label attachment into the incoming propagation matrix, and retain the part after its last attachment as a subsequent bounded propagation. Let $M$ be the matrix arriving at the first attachment, with label site as row and derivative index as column.]
  #emph[If $Phi \( M \)$ is the matrix after the intervening history, then, in the finite-tree comparison, 
#[#set math.equation(numbering: n => "(7.12)")
 $ ∥Phi \( M \)∥_(upright("HS")) lt.eq C ∥"diag" \( M \)∥ + o \( 1 \) ∥M∥_(upright("HS")) . $ <eq:hidden-marked-spine-bound>]

 Here $C$ depends on the fixed circuit and capped history. All memory copies and all mixed differences of the label are included in this history. The estimate does not replace a mixed label tensor by an ordinary first Jacobian.]
] <lem:hidden-marked-spine>

#proof[
  First fix a tensor-network approximation from 31. Before opening paths, use the mixed-tensor budget to bound its operator errors, and remove those errors in the prescribed successive approximation limit. The temporal tree off the marked path consists of disjoint subtrees ending at derivative leaves of the chosen label. Each attachment has at least one such leaf. The corresponding maps are bounded tensor products and compositions of capped path matrices and equality copies; every equality copy has norm at most its fixed scalar label bound. Pull their adjoints into the row tensor of the label circuit. Repeated occurrences of a derivative index are handled by the norm-one equality embedding. The resulting tensor $U_i$ on the $r$ attachment indices satisfies
  #[#set math.equation(numbering: n => "(7.13)")
   $ sup_i sum_(a_1 \, dots.h \, a_r) \| U_i \( a_1 \, dots.h \, a_r \) \|^2 lt.eq C^2 . $ <eq:hidden-marked-row-tensor>]
  Use the operator norm of each flattened mixed tensor to bound each of its rows in Euclidean norm. The off-path maps act on disjoint groups of leaves, so their tensor-product operator norms give the stated estimate without a dimension factor.
  Suppress vertices on the marked path with no label attachment. The matrices between its remaining consecutive attachments are bounded path matrices $Q_1 \, dots.h \, Q_(r - 1)$. For $r gt.eq 2$, put
  #[#set math.equation(numbering: n => "(7.14)")
   $ L_i \( a_1 \, a_r \) = sum_(a_2 \, dots.h \, a_(r - 1)) U_i \( a_1 \, dots.h \, a_r \) product_(ell = 1)^(r - 1) \( Q_ell \)_(a_ell a_(ell + 1)) . $ <eq:hidden-marked-kernel>]
  Then $Phi \( M \)_(i \, b) = sum_a M_(i \, a) L_i \( a \, b \)$. If $r = 1$, this formula means $L_i \( a \, b \) = upright(bold(1))_(a = b) U_i \( a \)$.
  The next step is to make every $Q_ell$ in (7.14) diagonal. Control one replacement at a time: fix an edge $e$ and put $Q_e^(upright("off"))$ there. With the endpoints fixed, Cauchy–Schwarz bounds the squared kernel by
  $ (sum_(a_2 \, dots.h \, a_(r - 1)) \| U_i \( a_1 \, dots.h \, a_r \) \|^2) (B_1 dots.h.c B_e^(upright("off")) dots.h.c B_(r - 1))_(a_1 a_r) \, $
  where $B_ell = \| Q_ell \|^(compose 2)$ entrywise. Every row sum and every column sum of $B_ell$ is at most $∥Q_ell∥_(upright("op"))^2$. Writing $eta_e = max_(a eq.not b) \| \( Q_e \)_(a b) \|$, we have $B_e^(upright("off")) lt.eq eta_e^2 upright(bold(1)) upright(bold(1))^t$ entrywise. The second factor is therefore at most
  $ eta_e^2 product_(ell eq.not e) ∥Q_ell∥_(upright("op"))^2 . $
  Sum over the endpoints and use (7.13). This gives
  $ sup_i ∥L_i^(\( e \, upright("off") \))∥_(upright("HS")) lt.eq C eta_e product_(ell eq.not e) ∥Q_ell∥_(upright("op")) . $
  The estimate remains valid after any other edges have been made diagonal. Telescope over the finitely many edges and apply the entry rule in 22 to obtain $sup_i ∥L_i - L_i^(upright("diag"))∥_(upright("op")) = o \( 1 \)$. Its row action costs at most $o \( 1 \) ∥M∥_(upright("HS"))$.
  After these replacements, diagonal marked-path edges force all attachment indices to agree. The remaining action takes the form $M compose E$, where
  $ E_(i \, a) = U_i \( a \, dots.h \, a \) product_(ell = 1)^(r - 1) \( Q_ell \)_(a a) . $
  This $E$ contains the entire label derivative subnetwork, including its memory copies. It is the two-terminal network obtained by tying all temporal attachment indices to the common source $a$, with the label output $i$ as sink. Every derivative leaf is paired. Lemma 5.11, Proposition 5.12 place it in the bounded path-matrix closure. The diagonal factors above may first be replaced by their uniformly accurate diagonal predictions. Consequently $max_i \| E_(i i) \| lt.eq C$ and $max_(i eq.not a) \| E_(i \, a) \| = o \( 1 \)$. The estimate
  $ ∥M compose E∥_(upright("HS"))^2 lt.eq C^2 ∥"diag" \( M \)∥^2 + max_(i eq.not a) \| E_(i \, a) \|^2 ∥M∥_(upright("HS"))^2 $
  proves (7.12). Here the entry estimates are used on fixed typical finite trees, followed by their integrated comparison. Their scope does not include uniformity over arbitrary states. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$M$])
  content((1.6, 0), [$a_1$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((4.7, 0), [$a_2$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((7.8, 0), [$a_3$], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((9.6, 0), [$"dq"$])
  line((0.2657, 0), (1.6, 0), stroke: (paint: rgb("#595959"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  line((1.6, 0), (4.7, 0), stroke: (paint: rgb("#595959"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((3.15, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q_1$]]])], anchor: "south")
  line((4.7, 0), (7.8, 0), stroke: (paint: rgb("#595959"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((6.25, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q_2$]]])], anchor: "south")
  line((7.8, 0), (9.299, 0), stroke: (paint: rgb("#595959"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((8.7, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[suffix]]])], anchor: "south")
  content((4.7, -1.4), [#box(width: 8.2cm, height: 0.8cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[$U_i(a_1,a_2,a_3)$: pulled-back label tensor, $\|U_i\|_( ell^2) lt.eq C$]])])
  line((1.6, 0), (1.6, -1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  line((4.7, 0), (4.7, -1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  line((7.8, 0), (7.8, -1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: rgb("#595959"))))
  content((4.7, -2.05), [#text(size: 9pt)[nonempty label branches at every attachment]])
})],
  caption: [Figure 3: The derivative continuing into the later suffix defines a marked path. Side branches are absorbed into a label tensor with bounded row square norm. After branch-free segments have been combined, every intervening $Q_r$ separates two nonempty sets of label leaves. Its off-diagonal contribution is small by Cauchy–Schwarz and the row and column sums of the squared-entry matrices. Pinching all such segments ties the attachment indices and returns the diagonal estimate for $M compose E$. ],
) <fig:marked-continuation>

=== 7.3 Proof of the averaging identity <subsec:hidden-averaging-proof>

#proof[
  Fix a summand of (7.6), with distinguished labels $a = a_r - a_r^0$ and $b = a_q - a_q^1$, where $r < q$. By 44, approximate its path labels by fixed bounded smooth multitime circuits, with every observed state inside the label’s time span. These circuits may contain mixed queries such as $J \[ f \( X_s \) ⊙ X_r \]$; no representation as a sum of separated single-time products is required. The frozen-score construction of 25 puts its smooth caps in the class of 15; in particular, outside spins multiplying an unbounded query are handled by its finite sign-pattern decomposition. Before estimating derivatives, fix the circuit, its cap, and every observation time. Keep both distinguished vertices exactly conditionally centered for each approximant. Approximate the nonspecial endpoint factors by fixed smooth one-state functions before the derivative limits, and perform the field cutoff above. Its threshold and the suffix approximants remain fixed throughout the derivative comparisons.
  For the exact right predictor, use a conditional path representation instead of requiring a regular one-state recipe. Represent its value by an independent ordinary stationary-kernel path from $X_t$, reading the multitime evaluations in reverse order. Differentiate by propagating the full mixed-slot recursion down this added causal branch. Its tensor and path-network conclusions are those of Lemma 4.5, Proposition 5.12. Keep the exact conditional subtraction before opening any of these derivatives. The conditional estimates (7.10), (7.11) apply there as well. The error in replacing a tracial predictor by this exact prediction is handled before derivatives are opened, by 44.
  Split the Wick string at $a$ and $b$ using (7.4). The subtractions involving $tau \( a \)$ or $tau \( b \)$ vanish; errors from approximate trace centering are controlled in the unsplit Wick form by 44. Absorb the outer strings into the endpoint vectors. The left vector remains hidden by 22; the right vector has bounded mean-square unweighted Hessian by (7.8) and (7.9). It remains to prove
  #[#set math.equation(numbering: n => "(7.15)")
   $ bb(E) u \( X_0 \)^t D_a Q D_b p \( X_t \) arrow.r 0 \, $ <eq:hidden-covariance-target>]
  where $Q$ is a positive-length Wick string with identity end labels. The left centered label $a$ will give a martingale covariance. If its paired derivative reaches $p$, the backward centering of $b$ will cancel the term. If the derivative first hits a tail label, the nonempty Wick prefix will supply the cancellation instead.
  To prove the remaining bilinear limit, use conditional martingale covariance up to the last evaluation in $a$. For scalar future observables $F \, G$, it reads
  #[#set math.equation(numbering: n => "(7.16)")
   $ "Cov"_x \( F \, G \) = 2 bb(E)_x integral sum_j w_j \( X_s \) d_j F_s \( X_s \) thin d_j G_s \( X_s \) thin upright(d) s \, $ <eq:hidden-martingale-covariance>]
  where $F_s \, G_s$ are the conditional future expectations with their already observed arguments held fixed. The integration stops once $F$ is fully observed. To check the factor, a flip of $j$ has rate $w_j \/ 2$ and changes a scalar martingale by $- 2 x_j d_j F_s$; its product bracket is $2 w_j d_j F_s d_j G_s$. Since $a$ has exact forward conditional mean zero, (7.15) is the corresponding covariance, with $u \( X_0 \)$ fixed under the initial conditioning.
  (7.16) introduces a derivative index in addition to the sites of the Wick string. Propagate the two derivatives by the mixed-slot recursion and $d S_h = K_h d$, including every exact product and memory-copy correction. First conditionally average the factor differentiating $a$ and remove its truncation with (7.11). On the other side, each terminal tensor term contains $p$ or $d p$ exactly once, because $p$ has only the terminal state slot. The bounded mixed label tensors and the Hilbert-space amplification of 13 therefore propagate its unweighted mean-square Hilbert–Schmidt budget. Tensor and propagation errors are removed in these norms before paths are opened. For the retained histories use 33 to reduce their complete derivative subnetworks to bounded path matrices. The two conditional future expectations in the covariance can then be represented by independent causal futures from their joining state.
  We now split the retained terms according to the derivative’s first destination: either it reaches $p$ before differentiating any tail label, or it first differentiates such a label. The two cases use different cancellations.
  #emph[The derivative reaches $p$ without differentiating a tail label.] Expand each terminal mixed tensor by the exact product rule, and classify a term by whether any difference falls on a tail label. For a label $c$ and a remaining factor $q$, we use
  $ d_j \( c q \) = c thin d_j q + q thin d_j c - 2 x_j \( d_j c \) \( d_j q \) . $
  The term that bypasses $c$ retains its unshifted value; classify the mixed correction with the first-hit terms. If no tail label is differentiated, the only differentiated state slot is the terminal slot of $p$. Any extra frozen-slot branch would differentiate a label, as would a same-slot correction containing both a label difference and $d p$; both belong to the second case. Thus the history in the present case is unbranched and follows the common $K$ propagation through the entire observation grid. With the derivative as column index, its term is a finite sum or integral of
  #[#set math.equation(numbering: n => "(7.17)")
   $ bb(E) ⟨d p \( X_t \) \, D_b Q^t D_u A⟩_(upright("HS")) \, $ <eq:hidden-hessian-ending>]
  where $A$ is a bounded path matrix containing the derivative propagation, the differentiated $a$-side, and the bounded rate diagonal. Condition first on $X_t$, so the terminal Hessian is fixed when we apply Cauchy–Schwarz. We must estimate the conditional matrix
  $ H \( X_t \) = bb(E) \[ D_b Q^t D_u A divides X_t \] . $
  Take two conditionally independent copies of the entire path system given $X_t$. Directly expanding its Hilbert–Schmidt square gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ bb(E) ∥H \( X_t \)∥_(upright("HS"))^2 = bb(E) thin u_1^t [\( Q_1 D_(b_1 b_2) Q_2^t \) compose \( A_1 A_2^t \)] u_2 . $ <eq:hidden-hadamard-pair>]
  Reversibility and the tree comparison identify this system as a causal tree rooted at $X_t$. Each conditional copy shares that one root; we do not introduce a new bridge conditioned on two endpoints.
  Apply the Hadamard rule in 22. Operator-small errors and visible dyads have zero bilinear limit between these hidden vectors. The remaining diagonal is the product of the two diagonal predictions. The prediction of $Q_1 D_(b_1 b_2) Q_2^t$ is zero. Indeed, the Wick strings admit no internal return, so the two equal-length strings must pair fully across each other. Their innermost contraction is $tau \( b_1 b_2 \)$. Under the stationary kernel, the two copies are conditionally independent and $bb(E) \[ b_(1 \, i) b_(2 \, i) divides X_t \] = 0$ at every site. The zero limiting pair trace transfers to the actual, possibly tilted, reversed tree by 22; exact finite-dimensional stationary centering is not asserted for that actual reversed kernel. Thus the right-hand side of (7.18) tends to zero, and the Hessian budget proves that (7.17) vanishes.
  This cancellation requires common subdivisions and identical truncated propagation kernels for the actual and predictor terms. Keep every evaluation time in the subdivision, even when the factor evaluated there is absent from a particular term. In the present case no derivative falls on $b$, so its actual and predictor pieces have the identical matrix $A$. Recombine them into the exactly centered $b$ before using (7.18). Independent predictor simulation branches may then be used in the two copies. Separate truncations followed by separate Hadamard estimates would not establish the vanishing of $tau \( b_1 b_2 \)$.
  #emph[A tail label is differentiated.] Stop at the first such vertex from the left, including a product-rule term that differentiates the label while also continuing to the right. If an earlier contraction has made this vertex scalar, its coefficient is a deterministic limiting trace from the word calculus, not a state-dependent empirical trace, and is not differentiated. The remaining prefix retains its Wick inclusion–exclusion.
  The stopping rule must be fixed before opening derivatives of the later suffix. The surviving actual labels have ordered spans with disjoint interiors: an adjacent return removes the interior excursion and merges the two neighboring labels, whose convex span contains no surviving vertex span in its interior. Repeating returns preserves this property. The endpoint predictions in the double-centered string occur only in its terminal suffix, apart from the initial predictions already absorbed into $u$. If the first differentiated actual label $c_i$ has span ending at $v$, every later actual label is observed after $v$, and every later endpoint predictor is a function of $X_t$. For each fixed spatial suffix, form its exact conditional value
  #[#set math.equation(numbering: n => "(7.19)")
   $ q_i \( z \) = bb(E) \[ upright("later spatial suffix ending in ") p divides X_v = z \] . $ <eq:hidden-stopped-suffix>]
  The Markov property makes the local observable exactly $c_i \( upright("path up to ") v \) q_i \( X_v \)$. Spatial matrix contractions in that suffix are included in $q$; they need not be diagonal.
  Before reopening the suffix, we need its $L^2$ value and mean-square Hilbert–Schmidt derivative to be bounded. Prove both by working backwards from the bounds for $p \, d p$, using the bounded mixed label tensors and exact product and copy rules at each ordered span. For the empty derivative-index set, this means multiplication by the bounded label $c$, with bound $C_diameter = ∥∥ c_oo$. The single terminal state slot contributes the value or the first difference of the current suffix once. Their tensor Hilbert–Schmidt norms are bounded by the row tensor bounds of the labels times the corresponding suffix norm. The Hilbert-space amplification of $S \, K$ and their common tails propagates these bounds to the preceding span, while a spatial matrix costs its bounded operator norm. For a terminal predictor, the ordinary one-state product rule uses its bounded conditional derivative operator. This finite backward induction uses no second difference of $p$ in its original state slot and does not require $q$ to be an exact gradient.
  Now apply the local temporal recursion to $c_i q_i$, retaining $q$ and $d q$ as unopened terminal objects. A term that differentiates $c$ either terminates in its label tensor, leaving $q$ as a value, or has exactly one marked leaf carrying $d q$. Every other derivative leaf belongs to this single label $c$, including all its mixed-slot and memory-copy leaves. Thus the latter term has precisely the marked history in 45, illustrated in Figure 3. The later differentiated labels remain inside $d q$ until after this local estimate. Conditioning in this order keeps all side leaves at the same spatial output site, which a simultaneous expansion of the later labels would not ensure.
  For a first hit on a terminal predictor $g \( X_t \)$, apply the exact one-state product rule to $D_g q$ before opening the auxiliary causal branch representing $d g$. Its terminating term uses the whole two-terminal matrix $d g$; its continuing correction is the one-attachment case of 45. Actual and predictor pieces of $b$ can be treated separately in this first-hit case, since the cancellation below uses the Wick prefix, not a later centering. This completes the stopping rule for every possible first differentiated vertex.
  Up to bounded row multipliers at that vertex, and with an unbranched temporal segment before its first label attachment absorbed into $A$, the incoming matrix is
  #[#set math.equation(numbering: n => "(7.20)")
   $ M = P^t D_u A \, $ <eq:hidden-first-vertex-matrix>]
  where $P$ is a positive-length Wick prefix ending in identity. Its Hilbert–Schmidt norm is bounded by $∥P∥_(upright("op")) ∥A∥_(upright("op")) ∥u∥$, whereas its diagonal satisfies the exact identity
  #[#set math.equation(numbering: n => "(7.21)")
   $ "diag" \( M \) = \( P compose A \)^t u . $ <eq:hidden-diagonal-cancellation>]
  The diagonal prediction of $P$ is zero, since it is a nonempty Wick string. The Hadamard rule and hiddenness hence show that $bb(E) ∥"diag" \( M \)∥^2 arrow.r 0$.
  For a continuing term, use 45 on the whole derivative subnetwork of $c$, including more than its first Jacobian. This gives
  #[#set math.equation(numbering: n => "(7.22)")
   $ bb(E) ∥Phi \( M \)∥_(upright("HS"))^2 lt.eq C bb(E) ∥"diag" \( M \)∥^2 + o \( 1 \) bb(E) ∥M∥_(upright("HS"))^2 arrow.r 0 $ <eq:hidden-schur-small>]
  in the typical weighted comparison. The exact $- 2 x_j$ factors in the product and copy rules are bounded labels on the equality forks of this history. An unbranched segment after the last label attachment is a subsequent bounded propagation. Pairing with $d q$ at the stopping boundary now gives zero by Cauchy–Schwarz and its Hilbert–Schmidt budget. Equivalently, later suffix operations may then be opened; their bounded Hilbert–Schmidt maps preserve this zero estimate.
  If the derivative terminates at its first differentiated vertex, let $E$ be the matrix of the complete terminating label subnetwork. All its mixed leaves and memory copies have been contracted. By 33 this is a bounded path matrix. Contract its incoming index against $M$. In indices, the vector left at that vertex is
  $ sum_j M_(i j) E_(i j) = sum_h P_(h i) u_h \( A E^t \)_(h i) = #scale(x: 120%, y: 120%)[\[] \( P compose \( A E^t \) \)^t u #scale(x: 120%, y: 120%)[\]]_i . $
  It tends to zero by the same Hadamard rule, again because the prediction of $P$ is zero. Bounded row or column labels can be included in this identity without changing its conclusion. Pair with the bounded $L^2$ value of $q$ from (7.19). The terminating and continuing cases together cover every term and correction supplied by the exact product and copy rules.
  The finitely many deterministic observation times may be separated within their prescribed spans before taking limits. Integration times coinciding with them have zero Lebesgue measure. The ordinary rough bounds control the limits and all discarded propagation tails. We have proved (7.15); summing (7.6) proves (7.5). ◻
]

=== 7.4 Likelihood caps and endpoint norm estimates <subsec:hidden-caps>

Averaging is now available. Apply 43 to the path expansion of $K_t$. By 13, deleting hops of order $k > A_L t$ and elementary likelihoods above $exp \( C_L t \)$ costs $O \( e^(- L t) \)$ in the endpoint $L^2$ comparison for any prescribed $L$. Hidden orthogonality removes the visible ranks. We are left with partially paired Wick strings having $k = O \( t \)$, for which the main issue is the supremum of an endpoint predictor at a Fock cut.

At each trunk vertex, the label is a nonnegative product of row likelihoods on a deterministic union of waiting intervals and factors between zero and one. Every vertex after the first also carries its arrival factor $v$. The likelihood product is therefore a single deterministically masked likelihood. For a span of length $d$, its raw trace moments have the rough fixed-order bound $e^(C_p d)$, whereas the projected row moments satisfy

#[#set math.equation(numbering: n => "(7.23)")
 $ max_i ∥bb(E)_x \[ a_i divides X_d \]∥_(L^p \( X_d \)) lt.eq e^(o_p \( d \)) $ <eq:hidden-projected-label-moments>]

at typical starts, by 35. Restricted labels are handled by domination by the unrestricted likelihood. The forward predictor is at most one. Under stationarity the reverse predictor has spatial moments of every fixed order bounded by $e^(o_p \( d \))$. These statements concern deterministic masks, with uniform constants; the quenched exceptional mass is integrated over simplex times as in 35. A disorder-selected worst mask is not needed.

The actual center label left by (7.5) can be estimated directly by a projected row moment. If $U = U \( X_0 \)$ and $V = V \( X_t \)$ are the vectors after the two endpoint strings have been applied, set $g_i \( X_t \) = bb(E)_x \[ a_i divides X_t \]$. Row Cauchy–Schwarz gives

#[#set math.equation(numbering: n => "(7.24)")
 $ lr(|bb(E)_x sum_i U_i a_i V_i|) & lt.eq sum_i \| U_i \| ∥g_i∥_(L^2 \( X_t \)) ∥V_i∥_(L^2 \( X_t \))\
 & lt.eq #scale(x: 120%, y: 120%)[\(] max_i ∥g_i∥_(L^2 \( X_t \)) #scale(x: 120%, y: 120%)[\)] ∥U∥ #scale(x: 120%, y: 120%)[\(] bb(E)_x ∥V∥^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <eq:hidden-center-row-cs>]

Average in the initial state and use Cauchy–Schwarz again. The polynomial endpoint bounds remove the exponentially atypical starts. Thus the center costs $e^(o \( t \)) ∥U∥_2 ∥V∥_2$, and an adjacent-pair subtraction at the center costs only $\| tau \( a \) \|$.

The remaining task is to bound the endpoint predictor suprema in (7.3) at a cost of only $e^(epsilon.alt t)$. An untruncated raw likelihood has no operator bound available here. We first fix a raw likelihood cutoff using one fixed rough moment. Only afterwards do we choose the higher projected moment needed to make the predictor supremum loss small. Keeping these choices separate prevents the high-order rough constants from entering that loss. Begin by fixing the error rate $L$ and the rough path truncations. Restrict the composite labels to the box $max_j log^(+) a_j lt.eq H_0$, with $H_0 = C' t$ and $C'$ to be chosen. Outside that box use the dyadic annuli $H < max_j log^(+) a_j lt.eq 2 H$, $H = 2^m H_0$. Interpret this maximum as a tensor box in the separate label arguments. Multilinearity decomposes it into a separate restriction at each label; it is not a pointwise maximum at one common site. Telescope the difference between two boxes by the first vertex whose label exceeds the lower threshold. This uses at most $k + 1$ terms per annulus. The elementary caps leave only $O \( log \( t + 2 \) \)$ annuli because the number of intervals is $O \( t \)$.

In one such box term, continue to write $a_j$ for its restricted label, so $0 lt.eq a_j lt.eq e^(2 H)$. Write $h_j^s = a_j^s$, $s = 0 \, 1$, for its exact stationary endpoint predictors. For a parameter $0 < epsilon.alt' lt.eq 1$, set

$ tilde(h)_j^s = min { h_j^s \, e^(epsilon.alt' H) } \, #h(2em) e_j^s = h_j^s - tilde(h)_j^s \, #h(2em) c_j^s = a_j - h_j^s . $

At the designated exceptional vertex set both $tilde(h)_j^s = 0$ instead. Denote by $delta_(upright("raw"))$ a bound for the trace two-norm of its discarded predictors, and by $delta_(upright("pred"))$ a bound for the other clipping errors. In the main box there is no designated vertex and $delta_(upright("raw")) = 0$.

We next realize the exact capped endpoint functions in the finite-tree calculus. This step must avoid using a small-trace replacement at an arbitrary exterior position. Fix $M = e^(2 H)$ and an endpoint state $y$. For $h \( y \) = bb(E) \[ a divides y \]$, take $N$ conditionally independent stationary-kernel branches with labels $a^(\( 1 \)) \, dots.h \, a^(\( N \))$ in $\[ 0 \, M \]$, and put

$ Z_N = 1 / N sum_(r = 1)^N a^(\( r \)) \, #h(2em) g_N \( y \) = bb(E) \[ f \( Z_N \) divides y \] \, $

where $f \( z \) = min { z \, e^(epsilon.alt' H) }$ or $f \( z \) = \( z - e^(epsilon.alt' H) \)_(+)$. Both maps are $1$-Lipschitz, so conditional variance and Jensen give

#[#set math.equation(numbering: n => "(7.25)")
 $ sup_y max_i \| g_(N \, i) \( y \) - f \( h_i \( y \) \) \| & lt.eq M \/ sqrt(N) \,\
sup_y 1 / n sum_i bb(E) \[ \| f \( Z_(N \, i) \) - f \( h_i \( y \) \) \|^2 divides y \] & lt.eq M^2 \/ N . $ <eq:hidden-cap-branch-approximation>]

For ordinary prediction, take $f \( z \) = z$. Assign an independent branch group to each occurrence of a conditional average in a word. Multilinearity represents the resulting products and trace contractions as expectations on a finite causal tree. The first bound controls the diagonal error uniformly in operator norm, so it can be removed from any bounded fixed word. The second recovers the trace norms from the sampled labels. Both the cap labels and the error labels retain their respective supremum bounds. If needed, the scalar cap is uniformly smoothed on $\[ 0 \, M \]$ before using the tree calculus. These limits are taken at fixed $t \, H$ before the large-time estimate. They require neither a derivative bound for the exact endpoint predictor nor a high raw likelihood moment. True centered factors retain their exact subtractions.

Using the modified predictors in (7.5) has the exact residual

#[#set math.equation(numbering: n => "(7.26)")
 $ sum_(i < j) B_k #scale(x: 120%, y: 120%)[\(] tilde(h)_(< i)^0 \, med c_i^0 + e_i^0 \, med a_(i < q < j) \, med c_j^1 + e_j^1 \, med tilde(h)_(> j)^1 #scale(x: 120%, y: 120%)[\)] . $ <eq:hidden-modified-residual>]

Expand the residual into three cases. With two true centered factors, the averaging proof gives zero; that proof permits bounded endpoint-only factors outside the distinguished vertices. With one error and one centered factor, every Fock cut away from the error pays its trace two-norm. At the error itself, the centered factor lies on its appropriate pure side, and the single-star argument of 44 gives zero. With two errors, at least one is off the cut and pays its trace two-norm. If the other is at the cut, retain its supremum bound $e^(2 H)$, including its possible action on the rare base.

All remaining trace factors are bounded using only the raw second moment. Their product costs $e^(C t)$: the waiting masks across the vertices use disjoint waiting intervals. The fixed powers per vertex, pairing choices, cuts, and telescoping terms cost at most another $e^(C t)$ because $k lt.eq A_L t$. Consequently, after the dimension and approximation limits, the total modified-averaging error is bounded by

#[#set math.equation(numbering: n => "(7.27)")
 $ e^(C_0 t + 2 H) \( delta_(upright("raw")) + delta_(upright("pred")) \) ∥u∥_2 ∥p∥_2 . $ <eq:hidden-cap-error>]

Only the rough truncations and second moments enter the fixed constant $C_0$. It is independent of $epsilon.alt'$ and of the high predictor moment order to be chosen below. The successive limits have already removed the derivative-approximation constants from the exact centered cancellation, so they do not enter $C_0$.

Treat the designated raw tail first. For each fixed $r > 0$, the uniform rough likelihood moment yields

#[#set math.equation(numbering: n => "(7.28)")
 $ max_i bb(E)_x \[ a_i^2 upright(bold(1))_(a_i > e^H) \] lt.eq e^(- r H) max_i bb(E)_x a_i^(r + 2) lt.eq exp \( C_(r + 2) t - r H \) . $ <eq:hidden-raw-tail>]

The bound holds at every starting state. Conditional Jensen therefore gives both

#[#set math.equation(numbering: n => "(7.29)")
 $ delta_(upright("raw")) & lt.eq exp (1 / 2 C_(r + 2) t - r / 2 H) \,\
max_i ∥bb(E)_x \[ a_i upright(bold(1))_(a_i > e^H) divides X_t \]∥_(L^2 \( X_t \)) & lt.eq exp (1 / 2 C_(r + 2) t - r / 2 H) . $ <eq:hidden-exceptional-center>]

Stationarity gives the first estimate, which also bounds the scalar adjacent-pair trace by Cauchy–Schwarz. The second supplies the uniform row bound at the exceptional actual center. Both use the same fixed raw moment; no high projected moment is needed here.

In an annulus, setting both designated predictors to zero kills every term in the modified averaging formula except the actual center at that vertex. Split there by (7.4). Each of its two endpoint strings pays at most one supremum $e^(epsilon.alt' H)$ by (7.3). Apply (7.24), (7.29) to the center. Its contribution, its adjacent-pair subtraction, and the raw part of (7.27) are all bounded by

#[#set math.equation(numbering: n => "(7.30)")
 $ exp [(C_0 + 1 / 2 C_(r + 2)) t - (r / 2 - 2) H] ∥u∥_2 ∥p∥_2 \, $ <eq:hidden-raw-annulus-cost>]

where we used $epsilon.alt' lt.eq 1$. Fix, for example, $r = 12$, and then choose $C' gt.eq 1$ so that

#[#set math.equation(numbering: n => "(7.31)")
 $ 4 C' gt.eq C_0 + 1 / 2 C_14 + L + 3 . $ <eq:hidden-raw-cap-choice>]

For all $H gt.eq C' t$, (7.30) is at most $e^(- \( L + 3 \) t - 4 \( H - C' t \)) ∥u∥_2 ∥p∥_2$. This fixes $C'$ without reference to the desired small supremum loss.

With the raw cutoff fixed, prescribe $epsilon.alt > 0$ and set $epsilon.alt' = min { 1 \, epsilon.alt \/ \( 2 C' \) }$. The two endpoint suprema in the main box now cost at most $e^(epsilon.alt t)$. Choose the high predictor-tail order $m$ only after making this choice. For every ordinary predictor clipping error, domination by the unrestricted predictor and the projected moment theorem give

#[#set math.equation(numbering: n => "(7.32)")
 $ delta_(upright("pred"))^2 & lt.eq max_(j \, s) tau \( \( h_j^s \)^2 upright(bold(1))_(h_j^s > e^(epsilon.alt' H)) \)\
 & lt.eq e^(- m epsilon.alt' H) max_(j \, s) tau \( \( h_j^s \)^(m + 2) \) lt.eq exp \[ - m epsilon.alt' H + o_(m + 2) \( t \) \] . $ <eq:hidden-predictor-tail>]

Here the mask can be viewed on the full interval $\[ 0 \, t \]$; a restricted label has predictor bounded by that of the unrestricted likelihood. Choose $m$ sufficiently large that

#[#set math.equation(numbering: n => "(7.33)")
 $ frac(m epsilon.alt', 2) - 2 gt.eq frac(C_0 + L + 4, C') . $ <eq:hidden-predictor-cap-choice>]

The predictor part of (7.27) is then at most $e^(- \( L + 3 \) t)$ for all sufficiently large fixed $t$, with a further decaying exponential in $H - C' t$. This holds in the main box and in every annulus. Summing the annuli therefore costs $O \( e^(- L t) \)$.

The raw constant $C_(m + 2)$ is absent from (7.32), (7.33) because the projected limiting moment theorem has already removed the rough moments used for fixed-time uniform integrability. Increasing the fixed order $m$ may increase the eventual threshold in $t$, while leaving $C'$ unchanged. Only the one or two distinguished errors in each residual term use this high order; every other trace factor still uses order two.

In the surviving main-box terms the actual center costs $e^(o \( t \))$ by (7.24). The endpoint-only subtraction terms in (7.5) satisfy the direct cut bound with one predictor supremum. Thus the combined loss is $e^(epsilon.alt t + o \( t \))$, and only a fixed number of trunk vertices lose their trace two-norm estimate. The order of choices is the fixed raw order, then $C'$, then $epsilon.alt'$, then the high projected order $m$.

Apply these endpoint polynomial norm bounds after removing visible components. If a visible component is created on the right, it remains orthogonal to the hidden left vector after the remaining path operations. Prove this first for a finite endpoint recipe projection, then increase the basis using the tree Gram comparison. Thus the bound used here is the hidden word domination of 22; no unrestricted operator comparison is applied to a visible component.

=== 7.5 Trunk renewal, exceptional vertices, and temporal boundaries <subsec:hidden-renewal>

The remaining task is to sum the surviving strings. Fix $z < lambda_(upright("sp"))$ with room to increase the parameter slightly without reaching the edge. Every removed side excursion has a positive, completely paired stationary weight. Recall the rooted paired kernel $R$ from 41, and put

$ hat(R) \( z \) = integral_0^oo e^(z d) R \( d \) thin upright(d) d . $

The two inequalities in (6.21) are

#[#set math.equation(numbering: n => "(7.34)")
 $ beta hat(R) \( z \) < 1 \, #h(2em) 1 - z - beta^2 hat(R) \( z \) > 0 . $ <eq:hidden-renewal-conditions>]

The first inequality makes interior runs summable. The second controls vertices whose arrival or trace weight has been lost.

An ordinary trunk vertex contributes the trace two-norm of its initial or terminal predictor. For a fixed shape with bounded span $d$, this norm approaches the traced weight $tau \( a \)$ as the vertex moves away from the corresponding global time boundary. To justify that replacement, use the following equilibrium comparison. If $F_i$ is the conditional expectation of the vertex functional given the state at the beginning of its span, the gap yields

$ 1 / n sum_i ∥S_s F_i - mu F_i∥_(L^2 \( mu \))^2 lt.eq e^(- 2 gamma s) 1 / n sum_i ∥F_i - mu F_i∥_(L^2 \( mu \))^2 . $

The two independent stationary-sample comparison of 22 gives

$ 1 / n sum_i \( mu F_i \)^2 arrow.r tau \( a \)^2 . $

Taking square roots bounds the predictor trace norm by $tau \( a \) + o_s \( 1 \)$; the reversed comparison is identical. Fixed-shape moment bounds justify the displayed averages. Box restrictions can be dropped by positivity. For long spans, the reverse predictor has cost $e^(o \( d \))$ by 35, independently of its location within the global interval, and the forward predictor has cost at most one.

For exceptional vertices, discard the arrival factor $v$ and charge one for the remaining label. The resulting positive rooted kernel admits the following majorant. Let $B \( d \) = e^(- d) upright(bold(1))_(d gt.eq 0)$, and let $E \( d \) = beta^2 R \( d \)$. Arbitrarily many excursions, separated by bare waits, give

#[#set math.equation(numbering: n => "(7.35)")
 $ V = B * sum_(m gt.eq 0) \( E * B \)^(* m) \, #h(2em) hat(V) \( z \) = frac(1, 1 - z - beta^2 hat(R) \( z \)) < oo . $ <eq:hidden-exceptional-kernel>]

The zeroth convolution power is the unit mass at zero. Thus $V$ is a majorant for a vertex missing its arrival weight, and for the exceptional vertices whose trace estimates were lost above. A subexponential span factor is harmless: for every sufficiently small $delta > 0$ it is bounded by $C_delta e^(delta d)$, and $hat(V) \( z + delta \) < oo$. In particular the corresponding $e^(z d)$-weighted tails tend to zero.

Return to ordinary vertices. Their arrival weight and stationary trace give exactly $R$, with an additional factor $beta$ for the next unpaired edge. First restrict to bounded spans, finitely many excursions, and bounded individual excursion lengths. For these fixed shapes, the gap estimate is uniform beyond boundary distance $T$, with error tending to zero as $T arrow.r oo$. The exceptional majorant, using a small amount of slack, controls the discarded shapes. Monotone truncation followed by dominated convergence therefore provides an interior-vertex majorant $G_T$ such that

#[#set math.equation(numbering: n => "(7.36)")
 $ integral_0^oo e^(z d) G_T \( d \) thin upright(d) d lt.eq beta hat(R) \( z \) + o_T \( 1 \) < 1 $ <eq:hidden-interior-mass>]

when $T$ is sufficiently large. Equivalently, first fix a shape and take the supremum of its predictor trace bound over boundary distances at least $T$; then apply the same truncation and domination. This order does not require uniform approximation over an unbounded family of shapes.

Vertices lying within distance $T$ of time $0$ or $t$ use the crude bound. The total sum of any number of hops contained in such a bounded interval is finite: the order-$j$ contribution has the simplex factor $T^j \/ j !$, and the fixed-time rough bounds give a sum bounded by $e^(C_T)$. There are at most two additional vertices whose spans cross the edges of these boundary intervals, since the trunk spans have disjoint interiors. Those use $V$. The initial vertex without an arrival factor, the chosen center, and the fixed number of vertices at which a supremum was used also use $V$, with the global multiplier $e^(O \( epsilon.alt \) t + o \( t \))$ already identified.

We can now sum an entire term as an ordered concatenation of two bounded-time boundary runs, a bounded number of exceptional kernels, and interior runs. By (7.36), the weighted mass of an interior run is a geometric sum. Choosing the center, the cuts, and the finitely many exceptional locations contributes only a polynomial in the number $j$ of interior steps. For a number $q < 1$ supplied by (7.36),

$ sum_(j gt.eq 0) \( j + 1 \)^C q^j < oo . $

Consequently the entire positive majorant has finite Laplace mass at $z$, up to $e^(O \( epsilon.alt \) t + o \( t \))$.

To finish the renewal estimate, we must pass from finite Laplace mass to a pointwise-in-time bound. For this, distinguish a boundary or exceptional root that has a bare initial wait. In (7.35) write $V = B * nu$, where $nu = sum_(m gt.eq 0) \( E * B \)^(* m)$ has finite $z$-weighted mass. Since $z < 1$,

#[#set math.equation(numbering: n => "(7.37)")
 $ sup_(d gt.eq 0) e^(z d) V \( d \) lt.eq sup_(r gt.eq 0) e^(z r) B \( r \) integral e^(z u) nu \( thin upright(d) u \) < oo . $ <eq:hidden-density-bound>]

Subexponential factors are again paid using a slightly larger parameter. If a boundary restriction cuts this root span short, keep its bare first wait and sum all remaining vertices within that bounded boundary interval by the same simplex estimate. Thus one factor in each concatenation has bounded weighted density, while all other factors have finite weighted mass. The convolution inequality

$ ∥f * g∥_(oo \, z) lt.eq ∥f∥_(oo \, z) ∥g∥_(1 \, z) \, quad ∥f∥_(oo \, z) = sup_(d gt.eq 0) e^(z d) \| f \( d \) \| \, quad ∥g∥_(1 \, z) = integral e^(z d) \| g \| \( thin upright(d) d \) \, $

gives the pointwise bound $C_z e^(- z t)$ for the summed majorant.

#proof[
  #emph[Completion of the proof of 42.] Normalize the limiting endpoint second moments to one, using the rough comparison if an endpoint norm vanishes. For each fixed $t$, first truncate the hops and elementary likelihoods. Then apply 43, remove the likelihood annuli, and sum with the positive renewal estimate just proved. It gives, for every $z' < lambda_(upright("sp"))$,
  $ limsup_(n arrow.r oo) \| bb(E) u^t K_t p \| lt.eq C_(z' \, epsilon.alt) e^(- z' t + O \( epsilon.alt \) t + o \( t \)) + O \( e^(- H t) \) . $
  The derivative and field-cutoff errors were removed before the large-time limit. Their constants therefore impose no growth condition on (7.1). Choose $z' > z$, then the predictor cap parameter $epsilon.alt$ sufficiently small and the tail rate $H$ sufficiently large. The result is bounded by $C_z e^(- z t)$, enlarging $C_z$ on a bounded interval of times using 13. Restoring the endpoint norms proves (7.2).
  Finally, the exceptional starting-state sets in the row estimates have exponentially small integrated mass for the deterministic simplex masks. Fubini and the polynomial endpoint bounds extend the proof to the integrated comparisons in the statement. Every replicated diagram used above is a causal tree; no step calls for a uniform estimate on an adaptively selected bridge or mask. ◻
]

== 8 The visible exact sector and its isolated spectrum <sec:exact>

The hidden-sector estimate leaves one possible source of slower decay: exact gradients visible to fixed equilibrium calculations. This section constructs their deterministic operator, proves that nonstationary visible projections lie in its weighted exact space, and isolates every mode below the spin edge. The vector space is deterministic; coefficients of its vectors along a nonstationary trajectory may be random. Throughout this section all horizons, recipes, truncation levels, and approximation accuracies are fixed before letting $n$ tend to infinity. Successive approximation limits are then taken in the order specified below. The underlying disorder events are those of Theorem 5.1, Theorem 2.1, Proposition 3.2. In particular, every use of an observation posterior gap refers to the stopped, two-segment observation experiment of 7.

=== 8.1 Two completions and a deterministic exact generator <two-completions-and-a-deterministic-exact-generator>

For stationary vector fields put

#[#set math.equation(numbering: n => "(8.1)")
 $ ⟨p \, q⟩_0 = bb(E)_mu p^(sans(T)) q \, #h(2em) ⟨p \, q⟩_v = bb(E)_mu p^(sans(T)) D_v q \, #h(2em) frak(d) \( p \) = bb(E)_mu sum_(i \, j) v_j lr(|d_j p_i|)^2 . $ <eq:exact-metrics>]

We use the same notation for the deterministic limits of these forms on recipes. The first metric defines the visible space already constructed; completing it in the weaker second metric gives $cal(H)_v$. The map $iota : cal(H) arrow.r cal(H)_v$ is continuous and injective. To see injectivity, multiply first by a smooth cutoff supported on $v_i gt.eq epsilon$. On that support the unweighted norm is at most $epsilon^(- 1 \/ 2)$ times the weighted norm. For a fixed recipe the removed unweighted mass tends to zero as $epsilon arrow.b 0$, by the spatial square-tail estimates; bounded multipliers and dense approximation extend this assertion to each fixed element of $cal(H)$. Thus equality in the weighted completion identifies ordinary visible vectors, but weighted approximation need not imply ordinary approximation. We will use the forward embedding only; its inverse need not be bounded.

Write $L^(\( n \))$ also for the componentwise scalar generator on vector fields, and write $cal(G)^(\( n \))$ for the exact gradient extension in (4.2). The same letters without the superscript will be used for the limiting operators when their domain is unambiguous.

#thm([Lemma 8.1.])[
  (Semigroups and smoothing).  #emph[The stationary limits define strongly continuous semigroups $K_t$ on $cal(H)$ and on $cal(H)_v$, and $iota K_t = K_t iota$. For each fixed $T$ their operator norms on both spaces are bounded uniformly for $0 lt.eq t lt.eq T$. On $cal(H)$ the semigroup is analytic and, for $t > 0$, 
#[#set math.equation(numbering: n => "(8.2)")
 $ ∥L K_t∥_(cal(H) arrow.r cal(H)) + ∥\( - L \)^(1 \/ 2) K_t∥_(cal(H) arrow.r cal(H)) lt.eq C_t . $ <eq:exact-graph>]

 The corresponding finite-dimensional bounds are uniform in $n$ on the retained disorder events. Here $L$ is the generator of componentwise stationary heat flow, rather than the generator of $K$.]
] <lem:exact-smoothing>

#proof[
  We first establish local boundedness in each norm, and then smoothing in the ordinary norm. Conditional prediction and the path expansion in 22 preserve the visible space. In the ordinary norm, 13 gives the bound and removes likelihood tails in stationary square mean. For the weighted bound, integrate the square evolution against $mu$ and retain the weights at both edge corners. The principal integration-by-parts term absorbs a fixed multiple of
  $ bb(E)_mu sum_(i \, j) v_i v_j lr(|d_j p_i|)^2 . $
  Here both corners of an edge are retained. The elementary bounds
  $ v_i \( x^j \) \/ v_i \( x \) in \[ e^(- C \| J_(i j) \|) \, e^(C \| J_(i j) \|) \] \, #h(2em) \| d_j v_i \( x \) \| lt.eq C \| J_(i j) \| v_i \( x \) \, #h(2em) sup_i sum_j J_(i j)^2 lt.eq C $
  control the terms differentiating the weight. Cauchy–Schwarz and Young’s inequality absorb the first-order term using $sum_j a_(i j)^2 \/ v_j lt.eq C$. The multiplication term is bounded by $∥a D_v^(- 1)∥ lt.eq C$, the comparable edge weights, and $v lt.eq 1$. Consequently
  $ frac(thin upright(d), thin upright(d) t) ∥K_t p∥_v^2 lt.eq C ∥K_t p∥_v^2 - c bb(E)_mu sum_(i \, j) v_i v_j \| d_j \( K_t p \)_i \|^2 . $
  This proves the extension to the weighted completion. Strong continuity holds on smooth recipes by their difference bounds and then on both completions by density and local boundedness.
  Analyticity follows by treating the first-order and multiplication terms as a relatively bounded perturbation of componentwise heat flow. Their uniform relative bound is
  #[#set math.equation(numbering: n => "(8.3)")
   $ ∥\( cal(G)^(\( n \)) - L^(\( n \)) \) p∥_0 lt.eq C #scale(x: 120%, y: 120%)[\(] ∥\( - L^(\( n \)) \)^(1 \/ 2) p∥_0 + ∥p∥_0 #scale(x: 120%, y: 120%)[\)] . $ <eq:exact-relative>]
  For example, square the first-order term row by row and use $sum_j a_(i j)^2 \/ v_j lt.eq C$; its sum is bounded by $C frak(d) \( p \)$. The remaining term has bounded operator norm. If $z$ is on either ray bounding a sector strictly larger than the negative real half-line, the spectral theorem gives
  $ ∥\( - L^(\( n \)) \)^(1 \/ 2) \( z - L^(\( n \)) \)^(- 1)∥ lt.eq C \| z \|^(- 1 \/ 2) \, #h(2em) ∥\( z - L^(\( n \)) \)^(- 1)∥ lt.eq C \| z \|^(- 1) . $
  At sufficiently large $\| z \|$, independently of $n$, the resolvent for $cal(G)^(\( n \))$ is therefore given by a convergent Neumann series. Contour inversion gives uniform analytic bounds. Moreover, (8.3) and the scalar inequality $sqrt(u) lt.eq epsilon u + C_epsilon$ show that the graph norms of $L^(\( n \))$ and $cal(G)^(\( n \))$ are uniformly equivalent after adding a fixed multiple of the identity. This proves (8.2). Passing first on the dense recipe class and then by the uniform bounds gives the assertions in the limiting spaces. ◻
]

We now choose exact test gradients whose potentials will also detect every weighted-visible exact limit. For a smooth bounded scaled vector recipe $B$ and $delta > 0$, define

#[#set math.equation(numbering: n => "(8.4)")
 $ f_(B \, delta) = delta^(- 1) {x^(sans(T)) S_delta B - S_delta #scale(x: 120%, y: 120%)[\[] \( S_delta x \)^(sans(T)) B #scale(x: 120%, y: 120%)[\]]} . $ <eq:exact-potential>]

The semigroup in the first term acts componentwise. For every scalar test $G$, reversibility gives the pairing

$ ⟨G \, f_(B \, delta)⟩_(L^2 \( mu \)) = delta^(- 1) bb(E)_mu #h(-0.16667em) [B^(sans(T)) { S_delta \( x G \) - \( S_delta x \) S_delta G }] . $

The expression in braces is the conditional covariance of the spin vector and $G$ after a time $delta$, given the initial state. Thus $f_(B \, delta)$ tests short-time covariance in the direction $B$; in particular it is centered. For fixed $B \, delta$, the potentials have polynomial supremum bounds and

#[#set math.equation(numbering: n => "(8.5)")
 $ sup_x ∥d f_(B \, delta) \( x \)∥ lt.eq C_(B \, delta) . $ <eq:exact-test-bound>]

Indeed, the derivative matrix of $B$ has operator norm $O \( n^(- 1 \/ 2) \)$ and $∥x∥ = sqrt(n)$. The required derivatives of $S_delta B$ and $S_delta x$ are direct single-future derivatives: for each fixed output combination $c$, use $d S_delta \( c^(sans(T)) F \) = K_delta d \( c^(sans(T)) F \)$ and the point-start bound in 13. Taking the supremum over $c$ then bounds the already averaged derivative matrix at each starting state. The exact flip product rule controls its quadratic term by the column square bounds. Apply the same single-future propagation to the scalar output $\( S_delta x \)^(sans(T)) B$ to obtain (8.5).

To put these derivatives in the visible space, first truncate the conditionally averaged derivative matrices by common linear path truncations, and only then open their future branches. This is the single-future case of 16; it requires no inference from separate slot Jacobians of a general multitime function. Products and diagonals of the resulting bounded path matrices are covered by 22. Whenever a fixed smooth multitime circuit is used in a further conditional derivative, its mixed-slot bounds and common tensor truncation are those of Lemma 4.4, Lemma 4.5, and its opened matrix belongs to the path closure by 33. All such circuit choices precede dimension. Thus $d f_(B \, delta)$ and its $K$-orbits are well-defined deterministic vectors of $cal(H)$.

#prodef([Definition 8.2.])[
  Let $cal(X)$ be the closure in $cal(H)$ of the linear span of
  $ K_t d f_(B \, delta) \, #h(2em) t gt.eq 0 \, quad delta > 0 \, quad B upright(" a smooth bounded scaled recipe") . $
  Let $cal(X)_v$ be the closure of the same span in $cal(H)_v$. Equivalently, countable dense recipe, time, and accuracy sets may be used.
] <def:exact-spaces>

#thm([Theorem 8.3.])[
  (The exact visible operator).  #emph[The spaces in 47 and their semigroups are deterministic. The embedding $iota : cal(X) arrow.r cal(X)_v$ is continuous, injective, and dense. On $cal(X)_v$, $K_t$ is a positive self-adjoint semigroup. If $cal(A)_v$ is minus its generator, then $"spec" \( cal(A)_v \) subset \[ gamma \, oo \)$ for the fixed gap constant $gamma > 0$ in 2. In particular the number 
#[#set math.equation(numbering: n => "(8.6)")
 $ lambda = min {lambda_(upright("sp")) \, inf "spec" \( cal(A)_v \)} quad upright("satisfies") quad 0 < lambda lt.eq lambda_(upright("sp")) lt.eq \( 1 - beta \)^2 . $ <eq:exact-lambda>]

 All dimension limits in this definition precede the spectral infimum.]
] <thm:exact-sector>

#proof[
  On the generating span, the path limits make every inner product and fixed-time matrix element deterministic. Self-adjointness comes from finite-dimensional exactness, through the identity
  $ ⟨d f \, K_t d g⟩_v = ⟨f \, \( - L \) S_t g⟩_(L^2 \( mu \)) . $
  The right side is symmetric in $f \, g$, is nonnegative when $f = g$, and has operator norm at most $e^(- gamma t)$ in the gradient norm. These properties pass to the weighted closure. The spectral theorem then gives the generator and its lower bound. The embedding properties follow from (8.1) and the definition of the closures; the final spin-edge bound is 41. ◻
]

=== 8.2 Saturation by stationary exact gradients <saturation-by-stationary-exact-gradients>

#thm([Lemma 8.4.])[
  (Saturation).  #emph[If a weighted-visible vector is a weighted mean-square limit of stationary exact gradients, then it belongs to $cal(X)_v$. In particular this holds for any such vector initially given in $cal(H)$.]
] <lem:exact-saturation>

#proof[
  It suffices to show that the component orthogonal to $cal(X)_v$ vanishes. Subtract the weighted orthogonal projection and call the remainder $q$. It remains weighted-visible and a weighted limit of exact gradients, while its pairing with every generating orbit is zero. Take centered potentials $G_n$ representing this exact limit. The gap gives $∥G_n∥_(L^2 \( mu \))^2 lt.eq gamma^(- 1) ∥d G_n∥_v^2$. For every fixed test potential $f = f_(B \, delta)$,
  #[#set math.equation(numbering: n => "(8.7)")
   $ ⟨G_n \, f⟩_(L^2 \( mu \)) = integral_0^oo ⟨d G_n \, K_t d f⟩_v thin upright(d) t . $ <eq:exact-potential-pairing>]
  The exponential gap bound gives a uniform integrable tail; the limit is zero by orthogonality.
  The same potential pairing has a local form that detects $q$ as the short time interval shrinks. Reversibility and conditional martingale covariance give the exact identity
  #[#set math.equation(numbering: n => "(8.8)")
   $ ⟨G_n \, f_(B \, delta)⟩_(L^2 \( mu \)) = 2 / delta integral_0^delta bb(E)_mu #h(-0.16667em) [B \( X_0 \)^(sans(T)) \( d S_(delta - s) x \) \( X_s \) D_(w \( X_s \)) d S_(delta - s) G_n \( X_s \)] thin upright(d) s . $ <eq:exact-covariance-potential>]
  Here the derivative matrix has output as row. The factor $2$ is the quadratic-variation factor for flip rate $w_j \/ 2$ and spin increment $2$. The derivative matrix $d S_r x$ differs from the identity by $O \( r \)$ in operator norm: integrate $d S_r x - I = integral_0^r d S_u L x thin upright(d) u$ and use $∥d L x∥ lt.eq C$ together with the pointwise rough gradient bound. Also $bb(E)_mu ∥B \( X_s \) - B \( X_0 \)∥^2 = O_B \( s \)$.
  The passage $delta arrow.b 0$ is justified in the weighted norm, without comparing the two completions in reverse. For every own-spin independent vector $p$,
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(E)_mu ∥D_w p∥^2 = bb(E)_mu sum_i bb(E)_mu \[ w_i^2 divides x_(- i) \] p_i^2 = bb(E)_mu sum_i v_i p_i^2 \, #h(2em) bb(E)_mu \[ w_i divides x_(- i) \] = v_i . $ <eq:exact-w-isometry>]
  Thus $D_w$ is an isometry from the closure of exact gradients with their weighted norm into ordinary square mean. In (8.8) one may first replace $G_n$ by $S_epsilon G_n$, shrink $delta$, and then shrink $epsilon$, using strong continuity on exact gradients. Equivalently one passes in the displayed covariance using (8.9). It follows from the zero pairing that $⟨B \, D_w q⟩_0 = 0$ for every $B$.
  To conclude from these zero pairings, we must place $D_w q$ in the ordinary visible space. Cut off the coordinates where $v_i < epsilon$. On the retained set a weighted-visible approximation is an ordinary visible approximation, and multiplication by $w$ is an allowed bounded label. On the removed set (8.9) and own-spin independence identify its squared norm with the corresponding weighted mass of $q$. That mass tends to zero for a fixed element of $cal(H)_v$, by density of bounded recipes. Hence $D_w q in cal(H)$. Its orthogonality to all recipes makes it zero, and the isometry makes $q = 0$. ◻
]

=== 8.3 Random coefficients and a reverse entropy budget <random-coefficients-and-a-reverse-entropy-budget>

The stationary construction now has the required saturation property: a weighted-visible limit of exact gradients lies in $cal(X)_v$. The remaining task is to prove that the visible projection of an #emph[evolving] gradient is such a limit. Its coefficients can be random, so stationary exactness cannot simply be projected onto each recipe. We first retain those coefficients in a scalar Hilbert space. A reverse entropy estimate will then let us test their vector directions for weighted curl; the observation inequality below converts vanishing curl into approximation by gradients.

Consider an ordinary trajectory on a fixed interval $\[ a \, b \]$ whose initial law has relative log density $o \( n \)$ with respect to $mu$, in the finite-tree convention of 22. Let

$ p_s = d S_(D - s) f \, #h(2em) a lt.eq s lt.eq b lt.eq D \, #h(2em) bb(E) ∥p_b∥^2 lt.eq C \, $

with polynomial pointwise bounds throughout. At every time used in the argument, retain the countable family of bounded-$L^2$ scalar sequences consisting of recipe contractions with $p_s$ and the scalar tests to be used below. Close these families under rational linear combinations and the actual conditional expectations between the retained times. Extract a subsequence on which all pairwise scalar inner products converge, quotient by sequences of limiting norm zero, and complete. This defines a Hilbert space $cal(S)_s$ at time $s$. Conditional expectation descends to a contraction $C_(s \, t) : cal(S)_t arrow.r cal(S)_s$, because its finite-dimensional $L^2$ norm is at most one. Additional scalar tests can be included before extraction; they need not be regular functions of the spins.

The extraction is joint for any prescribed finite or countable family of fixed comparison times; that family can be enlarged before extraction. We also retain the comparison-time sequences selected below from the sets where the integrated typicality tests and norm budgets hold. After a further subsequence their times converge. Their scalar spaces are defined from the tests and conditional expectations at the actual finite-dimensional times, with separate copies for distinct sequences even if their limiting times coincide. We do not select arbitrary dimension-dependent times from exceptional sets or identify these spaces as a previously constructed continuous-time process. At positive limiting time separation, strong continuity and fixed smoothing identify the vector semigroup with $K$ at the limiting separation. The selection is made in 51 and in the proof of 60.

Here is the continuity estimate that permits rough random coefficients. For fixed bounded scaled recipes $B \, B'$, typicality gives concentration of $∥B - B'∥^2$ at its deterministic Gram limit. On that event, Cauchy–Schwarz bounds the squared contraction by $∥p_s∥^2 ∥B - B'∥^2$. The polynomial pointwise bounds and the upper relative log-density $o \( n \)$ remove the exponentially small exceptional set. Consequently

#[#set math.equation(numbering: n => "(8.10)")
 $ limsup_n bb(E) \| p_s^(sans(T)) \( B - B' \) \|^2 lt.eq ∥B - B'∥_(cal(H))^2 limsup_n bb(E) ∥p_s∥^2 . $ <eq:exact-contraction-continuity>]

Thus contraction extends continuously from recipes to their completion; this conclusion uses nonstationary typicality, not only stationary mean-square approximation.

Finite projections on an orthonormal recipe basis now have coefficients in $cal(S)_s$ given by their pointwise contractions with $p_s$. Typical Gram convergence and Bessel’s inequality bound the sum of their scalar second moments. Increasing the finite basis therefore defines

$ q_s in cal(H) hat(⊗) cal(S)_s \, #h(2em) ∥q_s∥^2 lt.eq liminf_n bb(E) ∥p_s∥^2 . $

The first tensor factor records the equilibrium recipe direction; the second records its possibly rough random coefficient. Conditional expectation will act on the latter, while all differentiation acts on the former.

#thm([Proposition 8.5.])[
  (Transport of the visible coefficients).  #emph[For prescribed comparison times $a lt.eq s < t lt.eq b$ retained in the preceding construction, 
#[#set math.equation(numbering: n => "(8.11)")
 $ q_s = \( K_(t - s) hat(⊗) C_(s \, t) \) q_t . $ <eq:exact-transport>]

 The identity also holds for the retained selected-time sequences with positive limiting separation: $K_(t - s)$ uses that limiting separation, while $C_(s \, t)$ is induced by their actual conditional expectations. For an interior time $s$ with a fixed positive amount of future evolution, $q_s$ belongs to the graph domain of componentwise $L$ in the vector factor, with graph norm bounded by $C_(t - s) ∥q_t∥$. No derivative is taken on the scalar factor.]
] <prop:exact-transport>

#proof[
  We test the claimed transport first on finite recipe projections. Truncate the path expansion of $K_(t - s)$ at fixed order and likelihood level. Between finitely many testing recipes, its matrix elements concentrate at their deterministic stationary values by 22. To remove the endpoint complement, apply the adjoint bounded path word to a testing recipe and project at time $t$. Conditional prediction on replicated trees makes the remaining squared contraction arbitrarily small. This squared estimate is obtained #emph[before] multiplying by any scalar test; Cauchy–Schwarz therefore permits arbitrary bounded-$L^2$ scalar coefficients, including past-dependent tests. Polynomial pointwise bounds and the exponential exceptional-set estimates justify discards. The operator-small path tails then remove the truncations. Increasing the finite basis gives (8.11), since conditional expectation is a contraction. Apply (8.2) to the first tensor factor for the last assertion. ◻
]

#thm([Lemma 8.6.])[
  (Good comparison times).  #emph[Let $h_s$ be the marginal density relative to $mu$, and set $r_(s \, j) \( x \) = h_s \( x^j \) \/ h_s \( x \)$. In every fixed open subinterval $I subset.double \( a \, b \)$ one can choose comparison times $s = s_n in I$, after extraction, for which 
#[#set math.equation(numbering: n => "(8.12)")
 $ & bb(E) ∥p_s∥^2 + bb(E) sum_j w_j ∥d_j p_s∥^2 lt.eq C_I \,\
 & bb(E) ∥p_s∥^2 sum_j w_j \( 1 - sqrt(r_(s \, j)) \)^2 = o \( n \) . $ <eq:exact-hessian-budget>]

 All fixed typicality tests and their bounded auxiliary-time integrals can be retained at these times.]
] <lem:exact-good-times>

#proof[
  We obtain the two budgets from different estimates on the same path. The rough square estimate supplies the time-integrated first line and $∥p_s \( x \)∥^2 lt.eq C bb(E) \[ ∥p_b \( X_b \)∥^2 divides X_s = x \]$. Tilt the entire path by $g \( X_b \) \/ bb(E) g \( X_b \)$, where $g = 1 + ∥p_b∥^2$. Its entropy relative to the stationary path is $o \( n \)$: the original relative log density is $o \( n \)$ and the extra log density is $O \( log n \)$. The tilt depends on the forward terminal state, so it preserves the original reverse transitions. Those transitions have rates $w_j r_(s \, j) \/ 2$, whereas stationary reverse rates are $w_j \/ 2$. The jump-process entropy chain rule and
  $ \( sqrt(r) - 1 \)^2 lt.eq r log r - r + 1 #h(2em) \( r gt.eq 0 \) $
  give an integrated Hellinger budget $o \( n \)$ under the tilted path. The preceding conditional bound on $p_s$ converts it into the time integral of (8.12). Markov’s inequality selects a positive-measure set of times where the Hessian budget is bounded and the reverse budget is $o \( n \)$. Countably many fixed typicality tests can be imposed successively there by their integrated failure bounds and extraction. Auxiliary-time exceptional sets cost their square-mean bounds, rather than a polynomial supremum times their measure. ◻
]

=== 8.4 Detecting exactness without differentiating coefficients <detecting-exactness-without-differentiating-coefficients>

The next argument tests curl through stationary adjoints. Its error under a nonstationary law is controlled by the reverse entropy budget. To retain that error explicitly, for a law $h mu$ put $r_j \( x \) = h \( x^j \) \/ h \( x \)$. Pairing the two corners of each $j$-edge gives, for arbitrary $F_j$,

#[#set math.equation(numbering: n => "(8.13)")
 $ bb(E)_(h mu) sum_j #scale(x: 120%, y: 120%)[\[] \( x_j - m_j \) F_j - v_j d_j F_j #scale(x: 120%, y: 120%)[\]] = bb(E)_(h mu) sum_j \( x_j - m_j \) w_j / 2 \( 1 - r_j \) F_j . $ <eq:exact-nonstationary-ibp>]

The formula extends by continuity if $h$ vanishes. At positive times all its ratios are finite.

Let $A$ be a bounded smooth antisymmetric word matrix from the matrix calculus, with its column-flip versions retained in that calculus. Set

#[#set math.equation(numbering: n => "(8.14)")
 $ \( B_A \)_i = 1 / sqrt(n) sum_j [\( x_j - m_j \) \( v_i A_(i j) \) \( x^j \) - v_j d_j #scale(x: 120%, y: 120%)[\(] \( v_i A_(i j) \) \( x^j \) #scale(x: 120%, y: 120%)[\)]] . $ <eq:exact-adjoint>]

The adjoint identity at stationarity is

#[#set math.equation(numbering: n => "(8.15)")
 $ ⟨q \, B_A⟩_0 = bb(E)_mu sum_(i \, j) frac(v_i v_j, sqrt(n)) A_(i j) d_j q_i . $ <eq:exact-curl-adjoint>]

Choose $A$ first as a finite one-state smooth word test. Then $B_A$ is visible: its first term is a matrix word applied to a bounded site vector with the stated normalization, and the tied-index derivatives in the second term are the one-state column-flip and Hadamard operations of 22. Conditional matrix limits are reached only after these fixed tests, through the strong approximation below. If a conditional derivative is opened in forming a fixed test approximant, 33 supplies its path-matrix closure from the mixed-slot circuit construction; no general first-Jacobian criterion is being invoked.

#thm([Lemma 8.7.])[
  (Annihilation of the stationary adjoints).  #emph[At a comparison time from 51, every scalar component of $q_s$ annihilates $B_A$. It also annihilates the stationary adjoints of $bb(E)_mu sum_i v_i b_i d_i q_i \/ sqrt(n)$, for bounded smooth diagonal labels $b$. These are scalar-square-mean assertions.]
] <lem:exact-adjoints>

#proof[
  The conclusion concerns the square mean of each random coefficient, so we multiply an adjoint test by a second visible contraction. Write $p = p_s$, and take $e = p^(sans(T)) B$ with a fixed smooth scaled recipe $B$. The flip product rule and (8.12) give $bb(E) sum_j w_j \| d_j e \|^2 lt.eq C_B$. In (8.13) use
  $ F_j = e thin U_j \, #h(2em) U_j = 1 / sqrt(n) sum_i p_i \( v_i A_(i j) \) \( x^j \) . $
  The elementary column estimate needed here is
  #[#set math.equation(numbering: n => "(8.16)")
   $ bb(E) sum_j w_j \( 1 + sqrt(r_j) \)^2 \| U_j \|^2 lt.eq C_A / n (bb(E) ∥p∥^2 + bb(E) sum_j w_j ∥d_j p∥^2) . $ <eq:exact-column-budget>]
  For the term without $r_j$, this is the bounded operator estimate for the column-flipped test matrix. For the term with $r_j$, change $x$ to $x^j$ using detailed balance. Replace $p_i \( x^j \)$ by $p_i \( x \) - 2 x_j d_j p_i \( x \)$; the first part has the same operator bound, and bounded individual column norms bound the second part by the displayed derivative budget. Local comparability of $v$ at the two corners supplies the same constants for the weighted labels.
  Factor $1 - r_j = \( 1 - sqrt(r_j) \) \( 1 + sqrt(r_j) \)$ in the remainder. Since $\| e \| lt.eq C_B ∥p∥$ and $\| x_j - m_j \| lt.eq 2$, (8.12), (8.16) make that remainder $o \( 1 \)$ by Cauchy–Schwarz: its two squared budgets are $o \( n \)$ and $O \( n^(- 1) \)$. Derivatives falling on $e$ cost $O \( n^(- 1 \/ 2) \)$, by its Dirichlet bound and the same column estimate. Derivatives falling on $p$ cancel exactly, since $d_j p_i = d_i p_j$ and $A$ is antisymmetric. The remaining identity is
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( p^(sans(T)) B \) \( p^(sans(T)) B_A \) #scale(x: 120%, y: 120%)[\]] = o \( 1 \) . $
  Approximate $B_A$ in the visible norm by allowed recipes $B$ and use Bessel’s inequality and the squared contraction comparison before removing that approximation. The result is $∥⟨q_s \, B_A⟩_(cal(H))∥_(cal(S)_s)^2 = 0$. The diagonal argument is identical, with the cancellation supplied by $d_i p_i = 0$. It uses the stationary adjoint of the stated diagonal functional and the same $n^(- 1 \/ 2)$ normalization. ◻
]

Adjoint annihilation is initially a collection of weak tests. To turn it into a vanishing curl norm, we next approximate the derivative of the #emph[limiting visible vector] strongly. This excludes derivative mass that escapes every fixed word test.

#thm([Lemma 8.8.])[
  (Strong derivative closure).  #emph[Let $q$ be a deterministic vector component of an interior $q_s$, obtained by contraction with any fixed scalar Hilbert direction. Then the pair 
$ (\( sqrt(v_i v_j) thin d_j q_i \)_(i j) \, \( sqrt(v_i) thin d_i q_i \)_i) $

 is a strong mean-square limit of normalized smooth word matrices and their diagonal parts. Consequently the adjoint annihilation in 52 implies that representatives $Q^(\( n \))$ of $q$ can be chosen with bounded $frak(d) \( Q^(\( n \)) \)$ and 
#[#set math.equation(numbering: n => "(8.17)")
 $ bb(E)_mu sum_(i \, j) v_i v_j \| d_j Q_i^(\( n \)) - d_i Q_j^(\( n \)) \|^2 + bb(E)_mu sum_i v_i \| d_i Q_i^(\( n \)) \|^2 arrow.r 0 . $ <eq:exact-vanishing-curl>]

 Each successive finite approximant may be chosen polynomially bounded.]
] <lem:exact-form-closure>

#proof[
  The approximation has two stages: smoothing in form norm, followed by finite recipe approximation. By Proposition 8.5, Lemma 8.1, $q$ lies in the graph domain of componentwise $L$. First replace it by $S_epsilon q$. The spectral theorem makes this approximation strong in the norm $∥q∥_0^2 + frak(d) \( q \)$. For fixed $epsilon > 0$, approximate the input $q$ by finite smooth recipes $q_k$. Since
  $ ∥\( - L \)^(1 \/ 2) S_epsilon \( q - q_k \)∥_0 lt.eq C_epsilon ∥q - q_k∥_0 \, $
  the second approximation is also strong in form norm. This norm controls both weighted derivative quantities displayed in the statement. These operations apply to the deterministic vector $q$; the scalar Hilbert direction used to obtain it has not been differentiated.
  For fixed $epsilon \, k$, the derivative of the one-state recipe $q_k$ is $A \/ sqrt(n)$ in the smooth word, Hadamard, and column-flip closure. Bounded finite-rank errors disappear in normalized Hilbert–Schmidt norm. Propagate this terminal derivative by the direct single-future identity $d S_epsilon = K_epsilon d$, separately for each component. The common columnwise path tail bound approximates this operation in Hilbert–Schmidt square mean, because the fixed input derivative has bounded Hilbert–Schmidt norm.
  The remaining conditional expected path matrices lie in the same strong tracial closure. Choose their bounded labels as fixed smooth multitime circuits in the class of 15, with likelihood caps and any finite spin-sign decomposition already fixed. Then simulate the finitely many transitions with the nested accuracies of 22. Conditional pair-trace tests give the squared error. Averaging $r$ independent simulation seeds has conditional Monte Carlo error at most $C \/ r$ in normalized Hilbert–Schmidt square mean. Each fixed simulated calculation is a one-state word matrix. Only strong Hilbert–Schmidt approximation is required in this step: we neither differentiate a spatial-square-mean approximation of a label nor promote its error to an operator error. When an actual derivative of a fixed multitime circuit is needed elsewhere, its operator truncation and subsequent matrix reduction are instead the separate conclusions of Lemma 4.5, Proposition 5.12. Thus the derivative approximation here is strong, rather than only a list of converging individual traces. Diagonal extraction is performed before taking closure and is a contraction for the relevant diagonal norm; its convergence also follows directly from the form approximation.
  The derivative matrices were strongly approximated by $A \/ sqrt(n)$ with $A$ in the word closure. Multiplication on the two sides by $D_(sqrt(v))$ is a contraction in Hilbert–Schmidt norm. The weighted curl is therefore strongly approximated by $D_(sqrt(v)) \( A - A^(sans(T)) \) D_(sqrt(v)) \/ sqrt(n)$. Since the word closure is linear and transpose-stable, these are precisely weighted antisymmetric test matrices of the type used in (8.15). (8.15) and adjoint annihilation force its inner product with every element of this dense antisymmetric test class to be zero, hence its norm is zero. The diagonal tests do the same for the own-spin derivative. The strong form approximants then give (8.17). Applying the argument to all scalar Hilbert directions, or to a countable orthonormal basis of their separable span, proves the corresponding tensor assertion in square mean. ◻
]

#thm([Lemma 8.9.])[
  (Removing own-spin dependence).  #emph[Let $overline(Q)_i = P_i Q_i = bb(E)_mu \[ Q_i divides x_(- i) \]$, and put 
$ O \( Q \) = bb(E)_mu sum_i v_i \| d_i Q_i \|^2 \, #h(2em) C \( Q \) = bb(E)_mu sum_(i \, j) v_i v_j \| d_j Q_i - d_i Q_j \|^2 . $

 Writing $delta_J = max_(i \, j) \| J_(i j) \|$ and $R_J = max_i sum_j J_(i j)^2$, one has 
#[#set math.equation(numbering: n => "(8.18)")
 $ ∥Q - overline(Q)∥_v^2 & lt.eq O \( Q \) \,\
C \( overline(Q) \) & lt.eq 3 e^(12 delta_J) C \( Q \) + 12 e^(14 delta_J) R_J O \( Q \) . $ <eq:exact-own-spin-bound>]

 Thus the representatives in 53 may be made own-spin independent without changing their weighted limit or the vanishing-curl conclusion.]
] <lem:exact-own-spin>

#proof[
  The first assertion is the conditional-variance identity
  $ ∥Q - overline(Q)∥_v^2 = bb(E)_mu sum_i v_i^2 \| d_i Q_i \|^2 lt.eq O \( Q \) . $
  For the curl estimate, work on one conditional two-spin law before summing over pairs. Condition on the spins outside $i \, j$ and write the pair law as $p_(a b)$, $a \, b in { - 1 \, 1 }$, with coupling $K = J_(i j)$. Delete $K$ and normalize to obtain a product law $q = q_i ⊗ q_j$. Put $m = bb(E)_q a$, $m' = bb(E)_q b$, $A = 1 - m^2$, and $B = 1 - \( m' \)^2$. Uniformly in the fields,
  $ p_(a b) / q_(a b) \, quad frac(v_i \( b \), A) \, quad frac(v_j \( a \), B) med in \[ e^(- 2 \| K \|) \, e^(2 \| K \|) \] . $
  Write $u_b = d_i Q_i \( b \)$ and $t_a = d_j Q_j \( a \)$. Affinity in one spin gives
  $ \( P_i Q_i \) \( b \) = bb(E)_(q_i) Q_i \( a \, b \) + \( m_i \( b \) - m \) u_b . $
  Consequently the averaged curl has the exact representation
  #[#set math.equation(numbering: n => "(8.19)")
   $ d_j overline(Q)_i - d_i overline(Q)_j = C_0 + E_i - E_j \, #h(2em) C_0 = bb(E)_q \[ d_j Q_i - d_i Q_j \] \, $ <eq:exact-average-difference>]
  where
  $ E_i = 1 / 2 { \( m_i \( + \) - m \) u_(+) - \( m_i \( - \) - m \) u_(-) } $
  and $E_j$ has the symmetric definition. In particular all three quantities in (8.19) are independent of the two spins. With $W = bb(E)_p \[ v_i \( b \) v_j \( a \) \]$, comparison and Jensen give
  $ W C_0^2 lt.eq e^(12 \| K \|) bb(E)_p \[ v_i v_j \| d_j Q_i - d_i Q_j \|^2 \] . $
  The log derivative of $"sech"^2$ has absolute value at most $2$, so $\| m_i \( plus.minus \) - m \| lt.eq \| K \| e^(2 \| K \|) A$. Thus
  $ E_i^2 lt.eq 1 / 2 K^2 e^(4 \| K \|) A^2 \( u_(+)^2 + u_(-)^2 \) \, #h(2em) B \( u_(+)^2 + u_(-)^2 \) lt.eq 4 bb(E)_(q_j) u_b^2 . $
  The last inequality retains the two opposite corners even when one has very small probability. Combining it with $W lt.eq e^(6 \| K \|) A B$, $A^3 lt.eq A$, and the comparison of $p thin v_i$ with $q A$, gives
  $ W E_i^2 lt.eq 2 K^2 e^(14 \| K \|) bb(E)_p \[ v_i \| d_i Q_i \|^2 \] . $
  Use the analogous bound for $E_j$, square (8.19) with factor $3$, average over the other spins, and sum ordered pairs. The two error sums together cost $12 e^(14 delta_J) R_J O \( Q \)$, proving the claim. No lower bound on an individual conditional variance, and no unweighted derivative bound, is used in this removal step. ◻
]

=== 8.5 An observation inequality excluding a harmonic defect <an-observation-inequality-excluding-a-harmonic-defect>

We now need a uniform estimate converting small weighted curl into small weighted distance from gradients. The observation process provides that estimate: at its product endpoint a Fourier calculation gives it directly, and the posterior gap controls its transport back to the original law.

#thm([Lemma 8.10.])[
  (No harmonic defect).  #emph[Let $Q = Q^(\( n \))$ be a polynomially bounded vector field with $Q_i$ independent of $x_i$. On the disorder events of 7, 
#[#set math.equation(numbering: n => "(8.20)")
 $ inf_g bb(E)_mu sum_i v_i \( Q_i - d_i g \)^2 lt.eq C bb(E)_mu sum_(i \, j) v_i v_j \| d_j Q_i - d_i Q_j \|^2 + o \( 1 \) . $ <eq:exact-hodge-bound>]

 Here $C$ depends only on the fixed observation horizon, precision bound, and posterior gap. The $o \( 1 \)$ is bounded by a polynomial in $n$ times the exponential stopping probability. It is taken separately for each fixed approximant.]
] <lem:exact-no-defect>

#proof[
  For a full-support posterior $P$ define
  $ M \( P \) = min_g bb(E)_P sum_i v_(P \, i) \( Q_i - d_i g \)^2 \, #h(2em) r = Q - d g_P . $
  Center the minimizer under $P$ to fix its additive constant. On the finite cube the Dirichlet form is positive definite modulo constants, so the minimizer is unique and the following differentiations are legitimate. We estimate its field derivative, then its observation drift, and finally the curl energy at the product endpoint.
  #emph[The normal equation and its derivative.] Since $r_i$ is own-spin independent, stationarity on a single edge gives
  #[#set math.equation(numbering: n => "(8.21)")
   $ 0 = bb(E)_P sum_i v_(P \, i) r_i d_i phi.alt = bb(E)_P phi.alt sum_i \( x_i - m_(P \, i) \) r_i quad upright("for every ") phi.alt . $ <eq:exact-normal>]
  Full support therefore implies $sum_i \( x_i - m_(P \, i) \) r_i = 0$ pointwise. Freeze the minimizer and vary the external field in coordinate $j$. The derivative of the normal functional against $phi.alt$ is exactly
  #[#set math.equation(numbering: n => "(8.22)")
   $ F_j \( phi.alt \) = - bb(E)_P phi.alt v_(P \, j) r_j . $ <eq:exact-normal-derivative>]
  Indeed the derivative of the measure multiplies the pointwise zero in (8.21); the remaining derivative is $partial_(h_j) m_(P \, i) = upright(bold(1))_(i = j) v_(P \, j)$. Testing (8.21) with $phi.alt = x_j$ also gives $bb(E)_P v_(P \, j) r_j = 0$. If the heat-bath gap of $P$ is at least $gamma$, then the dual norm relative to $cal(E)_P$ satisfies
  #[#set math.equation(numbering: n => "(8.23)")
   $ sum_j ∥F_j∥_(cal(E)_P^(*))^2 lt.eq gamma^(- 1) sum_j bb(E)_P \( v_(P \, j) r_j \)^2 lt.eq gamma^(- 1) M \( P \) . $ <eq:exact-normal-dual>]
  This uses Cauchy–Schwarz after centering $phi.alt$, followed by the posterior Poincaré inequality.
  #emph[The drift of the minimum.] Let $A succ.curly.eq 0$ be the precision per unit time on one segment of the observation. In innovation coordinates the posterior masses satisfy
  $ thin upright(d) P \( x \) = P \( x \) \( x - bb(E)_P x \)^(sans(T)) A^(1 \/ 2) thin upright(d) B . $
  This is the finite-state filtering identity; it follows by the quotient rule for likelihood weights, as in #cite(label("SKGap")) Equation (2.1), with $A^(1 \/ 2)$ inserted for the stated precision. For a fixed $i$ and rest configuration $z$, write $a = P \( z \, + \)$, $b = P \( z \, - \)$, and
  $ c_i \( z \) = frac(4 a b, a + b) \, #h(2em) v_i \( z \) = frac(4 a b, \( a + b \)^2) . $
  The edge contribution to the quadratic cost for frozen $r$ is $c_i \( z \) r_i \( z \)^2$. The Hessian of $c \( a \, b \) = 4 a b \/ \( a + b \)$ is
  $ D^2 c \( a \, b \) = - frac(8, \( a + b \)^3) mat(delim: "(", b^2, - a b; - a b, a^2) . $
  The difference of the innovation vectors of the two corners is $2 A^(1 \/ 2) e_i$. Itô’s formula therefore gives precisely
  #[#set math.equation(numbering: n => "(8.24)")
   $ "drift" \( c_i \) = - A_(i i) c_i v_i . $ <eq:exact-edge-drift>]
  Summing frozen residual costs bounds this drift below by $- ∥A∥ M \( P \)$.
  The drift of the optimized cost also includes motion of the minimizer. This contribution is nonpositive and must be bounded from below. In coordinates on potentials modulo constants, write the cost near its minimum as $M + cal(E)_P \( u \) - 2 F \( u \)$. For an infinitesimal innovation, minimization subtracts the squared dual norm of the first variation $F$. Thus this contribution is
  $ - sum_alpha ∥sum_j \( A^(1 \/ 2) \)_(j alpha) F_j∥_(cal(E)_P^(*))^(#h(-0.16667em) 2) gt.eq - ∥A∥ thin gamma^(- 1) M \( P \) \, $
  by (8.23). This is also obtained directly by Itô differentiating the inverse of the positive Dirichlet matrix. Together with (8.24), it proves
  #[#set math.equation(numbering: n => "(8.25)")
   $ "drift" M \( P_t \) gt.eq - ∥A_t∥ \( 1 + gamma^(- 1) \) M \( P_t \) $ <eq:exact-minimum-drift>]
  until the posterior-gap stopping time.
  #emph[The product endpoint.] At a product law write $sigma_i^2 = v_i$ and $chi_i = \( x_i - m_i \) \/ sigma_i$. Expand the own-independent $Q_i$ in the orthonormal products $chi_T$. For each nonempty $S subset \[ n \]$, put $b_(i \, S) = sigma_i hat(Q)_i \( S \\ { i } \)$, $i in S$. The weighted cost on this support is the squared distance of $\( b_(i \, S) \)_(i in S)$ from the constant vector, since a potential coefficient $hat(g) \( S \)$ contributes that same value to each $b_(i \, S)$. For $\| S \| = 1$ this distance is zero. For $\| S \| gt.eq 2$,
  $ sum_(i in S) \| b_(i \, S) - overline(b)_S \|^2 = frac(1, 2 \| S \|) sum_(i \, j in S) \| b_(i \, S) - b_(j \, S) \|^2 lt.eq 1 / 4 sum_(i \, j in S) \| b_(i \, S) - b_(j \, S) \|^2 . $
  The ordered-pair sum is exactly the weighted curl energy on $S$. Consequently
  #[#set math.equation(numbering: n => "(8.26)")
   $ M \( P_(upright("prod")) \) lt.eq 1 / 4 bb(E)_(P_(upright("prod"))) sum_(i \, j) v_i v_j \| d_j Q_i - d_i Q_j \|^2 . $ <eq:exact-product-hodge>]
  #emph[Transporting the curl energy.] Fix $i eq.not j$ and the remaining spins $z$. The curl $c_(i j) \( z \) = d_j Q_i - d_i Q_j$ is independent of both $x_i \, x_j$. For the four #emph[joint] masses $p_(a b) = P \( z \, a \, b \)$ define
  $ H \( p \) = (sum_(a \, b) p_(a b)^(- 1))^(- 1) . $
  This function is homogeneous and concave on the positive cone, since
  #[#set math.equation(numbering: n => "(8.27)")
   $ H \( p \) = inf {sum_(a \, b) p_(a b) u_(a b)^2 : sum_(a \, b) u_(a b) = 1} . $ <eq:exact-harmonic-concavity>]
  Extend it continuously to the boundary. If the pair has no coupling, $sum_(a \, b) p_(a b) v_i \( b \) v_j \( a \) = 16 H \( p \)$. Deleting a coupling $theta_(i j)$ changes each conditional pair mass and each conditional variance by factors $e^(O \( \| theta_(i j) \| \))$, uniformly in the external fields and $z$. Hence, throughout the observation path where $\| theta_(i j) \| lt.eq \| J_(i j) \|$,
  #[#set math.equation(numbering: n => "(8.28)")
   $ e^(- C \| J_(i j) \|) 16 H \( p \) lt.eq sum_(a \, b) p_(a b) v_i \( b \) v_j \( a \) lt.eq e^(C \| J_(i j) \|) 16 H \( p \) . $ <eq:exact-pair-weight>]
  This concave function of the four joint masses supplies the required transport estimate. Each joint posterior mass is a martingale, so concavity in (8.27) implies $bb(E) H \( p_t \) lt.eq H \( p_0 \)$. Multiply by $c_(i j) \( z \)^2$ and sum over $z \, i \, j$. Using (8.28) at the initial point and the product endpoint shows that expected terminal curl energy is at most $e^(C max \| J_(i j) \|)$ times its initial value.
  Finally stop before the posterior gap fails, using the test-independent stopping rule in 7. The horizon and precision norm are fixed. Equation (8.25) makes $e^(C t) M \( P_t \)$ a submartingale up to this stopping time. Its expected terminal value is bounded by (8.26) on good paths. On stopped paths use $M \( P \) lt.eq bb(E)_P sum_i Q_i^2 lt.eq sup_x sum_i Q_i \( x \)^2$, a polynomial bound. Their probability is exponentially small. More explicitly, let $T$ be the fixed observation horizon, let $tau$ be the stopping time, and write
  $ cal(C) \( P \) = bb(E)_P sum_(i \, j) v_(P \, i) v_(P \, j) \| d_j Q_i - d_i Q_j \|^2 . $
  Using the full observation posterior $P_T$ also on the exceptional paths, optional stopping and nonnegativity give
  $ M \( mu \) lt.eq e^(C T) {1 / 4 bb(E) cal(C) \( P_T \) + n^(C_Q) bb(P) \( tau < T \)} lt.eq C' cal(C) \( mu \) + o \( 1 \) . $
  The first inequality uses the product endpoint on paths that reach $T$ without stopping; the second is the concave curl-energy comparison. This proves (8.20). All operations can first be localized where posterior masses are bounded away from zero; bounded finite-cube costs and the displayed inequalities then remove the localization. ◻
]

#thm([Proposition 8.11.])[
  (Closedness of the random visible part).  #emph[At the comparison times of 51, 
#[#set math.equation(numbering: n => "(8.29)")
 $ q_s in cal(X)_v hat(⊗) cal(S)_s . $ <eq:exact-closedness>]

 The statement concerns the vector factor of the random-coefficient projection and requires no regularity of its scalar coefficients.]
] <prop:exact-closedness>

#proof[
  Apply the preceding results to a deterministic vector obtained by contracting $q_s$ with an arbitrary fixed scalar Hilbert direction. First, 53 gives strong approximants with vanishing curl and own-spin derivative. 54 makes the approximants own-spin independent, preserving their weighted limit and vanishing curl. Apply 55 separately to each fixed polynomial approximant, letting dimension tend to infinity before improving the approximation. Their weighted distance to exact gradients tends to zero. 49 puts the limiting deterministic vector in $cal(X)_v$. Orthogonality to $cal(X)_v^perp$ after contraction against every scalar direction gives (8.29). ◻
]

=== 8.6 Unweighted decay and the spectrum below the spin edge <unweighted-decay-and-the-spectrum-below-the-spin-edge>

#thm([Lemma 8.12.])[
  (Upgrading decay to the unweighted norm).  #emph[Let a $K$-invariant subspace of $cal(X)_v$ have weighted decay $∥K_t q∥_v lt.eq C e^(- a t) ∥q∥_v$. For every $rho < min { a \, 1 - beta^2 }$ and every $q in cal(H)$ whose weighted image lies in this subspace, 
#[#set math.equation(numbering: n => "(8.30)")
 $ ∥K_t q∥_0 lt.eq C_rho e^(- rho t) ∥q∥_0 . $ <eq:exact-unweighted-decay>]

 The same bound holds with a Hilbert scalar tensor factor and conditional expectation contractions. In particular, the full exact space has unweighted decay at every rate below $lambda$.]
] <lem:exact-upgrade>

#proof[
  The weighted estimate alone cannot be inverted through $iota$. Instead, separate the gradient extension into its diagonal differential part
  $ \( cal(D) p \)_i = \( L - I \) p_i - 2 x_i sum_j a_(i j) d_j p_i $
  and the multiplication operator $a p$. Uniformly in $x \, i$,
  #[#set math.equation(numbering: n => "(8.31)")
   $ sum_j a_(i j)^2 / v_j lt.eq sum_j J_(i j)^2 \( 1 + o \( 1 \) \) lt.eq beta^2 + o \( 1 \) . $ <eq:exact-sharp-row>]
  The first inequality follows by the one-variable mean-value formula for $tanh$, with error uniform because $max \| J_(i j) \| arrow.r 0$; the second is uniform concentration of row square sums. Integration against stationarity and completion of the square give
  $ ⟨p \, cal(D) p⟩_0 lt.eq - ∥p∥_0^2 - frak(d) \( p \) + 2 sqrt(\( beta^2 + o \( 1 \) \) ∥p∥_0^2 frak(d) \( p \)) lt.eq - \( 1 - beta^2 - o \( 1 \) \) ∥p∥_0^2 . $
  Thus its limiting semigroup $T_t^(upright("diag"))$ has norm at most $e^(- \( 1 - beta^2 \) t)$. The other part maps weighted to unweighted norm:
  $ ∥a p∥_0 lt.eq ∥a D_v^(- 1)∥ ∥D_v p∥_0 lt.eq C ∥p∥_v . $
  Duhamel’s formula consequently gives
  $ ∥K_t q∥_0 lt.eq e^(- \( 1 - beta^2 \) t) ∥q∥_0 + C integral_0^t e^(- \( 1 - beta^2 \) \( t - s \)) e^(- a s) ∥q∥_v thin upright(d) s . $
  Since $∥q∥_v lt.eq ∥q∥_0$, the convolution gives (8.30), including equality of the two exponents by taking strict slack. Tensoring and conditional expectation do not increase any norm used here. Finally $lambda lt.eq \( 1 - beta \)^2 < 1 - beta^2$ for $0 < beta < 1$. ◻
]

#thm([Proposition 8.13.])[
  (Isolation below the spin edge).  #emph[The unweighted semigroup satisfies 
#[#set math.equation(numbering: n => "(8.32)")
 $ limsup_(t arrow.r oo) 1 / t log ∥K_t \|_(cal(X))∥_(upright("ess")) lt.eq - lambda_(upright("sp")) . $ <eq:exact-essential-rate>]

 Every weighted spectral point of $cal(A)_v$ strictly below $lambda_(upright("sp"))$ is an isolated eigenvalue of finite multiplicity, and its eigenspace lifts into $cal(X)$. If $lambda < lambda_(upright("sp"))$, let $E_v$ be the bottom eigenspace and $E$ its unweighted lift. The weighted orthogonal projection $Pi_v$ and the unweighted spectral projection $P$ agree through the embedding: 
#[#set math.equation(numbering: n => "(8.33)")
 $ Pi_v iota = iota P . $ <eq:exact-projection-agreement>]

 The slow projection also defines a bounded map on every $q in cal(H)$ with $iota q in cal(X)_v$: project $iota q$ onto $E_v$ and lift through the finite-dimensional inverse $E_v arrow.r E$. On the weighted complement there is decay with some rate strictly larger than $lambda$, and hence unweighted decay at every rate below the minimum of that rate and $1 - beta^2$, for all such $q$.]
] <prop:exact-isolation>

#proof[
  There are two steps. First, the hidden estimate bounds the essential norm in the ordinary exact space. Second, the dense intertwining map identifies the resulting finite-dimensional spectral subspaces in the weighted completion.
  #emph[Essential norm.] For every fixed deterministic $u in cal(H)$ and bounded recipe $B$, the finite-dimensional contractions $u^(sans(T)) B$ concentrate at $⟨u \, B⟩_(cal(H))$. This first holds for a fixed finite recipe; for a dense approximation $u'$ use
  $ ∥\( u - u' \)^(sans(T)) B∥_(L^2 \( mu \)) lt.eq sup_x ∥B \( x \)∥ ∥u - u'∥_0 . $
  It need not hold for an arbitrary random scalar times a visible vector.
  We turn this concentration into the squared orthogonality required by the hidden theorem. Let $u_k$ be a weakly null unit sequence in $cal(X)$, and approximate each $u_k$ within $1 \/ k$ by a finite exact test combination. At dimension $n_k$ impose concentration for its contractions with the first $k$ recipes, its norm, and the operator pairing currently being tested. Take $n_k$ sufficiently large that the finite pointwise bounds of this approximant are bounded by a fixed power of $n_k$. A sufficiently slow diagonal sequence $k = k \( n \) arrow.r oo$ then has
  $ bb(E)_mu \| u_(k \( n \))^(sans(T)) B \|^2 arrow.r 0 quad upright("for every fixed recipe ") B . $
  Thus the representatives are hidden in the squared-contraction sense of 42; weak convergence by itself was not used as a substitute for this property.
  To see that this controls the essential norm, take finite-rank orthogonal projections $P_m^0 arrow.t I$ on $cal(X)$. The Hilbert-space identity
  $ ∥K_T∥_(upright("ess")) = lim_m ∥\( I - P_m^0 \) K_T∥ $
  follows because $P_m^0 K_T$ is finite rank and every compact operator is uniformly small after applying $I - P_m^0$. If the claimed essential-rate bound failed, choose unit $u_m in "ran" \( I - P_m^0 \)$ and unit inputs $p_m$ witnessing the excess. The outputs are weakly null, so the previous diagonal construction applies to these arbitrary witnesses; approximate the inputs too by finite exact test combinations while preserving the pairing. Split $K_T = K_(T - 1) K_1$ for $T > 1$. 46 supplies a uniform stationary Hessian budget for the exact inputs $K_1 p_m$. Since their derivatives are independent of the differentiating spin, their $w_j$-weighted budget equals their $v_j$-weighted budget. Apply 42 to the hidden outputs and these smoothed inputs. Here the hidden theorem imports the multitime conditional derivative argument: its fixed smooth circuits use the mixed-slot hierarchy, common tensor truncations, and opened network reduction of Lemma 4.4, Lemma 4.5, Proposition 5.12. Its path entry comparisons retain the typical integrated-parameter convention of 22; no supremum over auxiliary Duhamel times is added here. The bounded $K_1$ factor and loss of one time unit disappear after dividing the logarithm by $T$. This proves (8.32) for all possible norm witnesses.
  #emph[The dense embedding and its spectral projections.] Fix $0 < rho < lambda_(upright("sp"))$ and choose $T$ so large that the essential norm of $T_X := K_T \|_(cal(X))$ is smaller than $e^(- rho T)$. Choose $r > e^(- rho T)$ away from the spectrum, with $r < 1$. The usual resolvent argument for a finite-rank perturbation of an operator of norm smaller than $r$ gives a Riesz decomposition
  $ cal(X) = E_r xor F_r \, $
  where $E_r$ is finite dimensional, contains the spectrum outside $\| z \| = r$, and the spectral radius of $T_X \|_(F_r)$ is at most $r$. For clarity, a finite-rank approximation with smaller remainder norm makes the resolvent outside that norm the inverse of a finite-dimensional analytic matrix; its zeros are isolated and have finite multiplicity. On a compact annulus $\| z \| gt.eq r$ there are finitely many such zeros. This supplies precisely the decomposition just used.
  Let $T_v = K_T \|_(cal(X)_v)$. It is positive self-adjoint and $iota T_X = T_v iota$. Injectivity implies that every generalized eigenvector in $E_r$ embeds as a generalized eigenvector of $T_v$. Self-adjointness removes all nontrivial Jordan chains and forces these eigenvalues to be real and positive. Write $W_r = iota E_r$. For $f in F_r$ and $r' > r$, the spectral-radius formula yields
  $ ∥T_v^k iota f∥_v lt.eq ∥iota∥ thin C_(r') \( r' \)^k ∥f∥_0 . $
  If the $T_v$-spectral measure of $iota f$ charged $\( r' \, oo \)$, its $k$th moment in this inequality would grow faster than $\( r' \)^k$. The spectral theorem therefore forces that measure into $\[ 0 \, r' \]$; let $r' arrow.b r$. Thus $iota F_r$ is orthogonal to $W_r$. On the dense image $iota cal(X)$ the Riesz decomposition is already an orthogonal decomposition into $W_r$ and the low spectral subspace. It follows that
  $ cal(X)_v = W_r xor^perp overline(iota F_r) \, #h(2em) Pi_(W_r) iota = iota P_(E_r) . $
  Density now excludes additional weighted spectral mass outside $\[ 0 \, r \]$. The displayed identity proves agreement of the projections through $iota$; no boundedness of an ordinary Riesz projection in the weaker norm was assumed.
  Given any rate strictly below $lambda_(upright("sp"))$, choose $rho$ above that rate and then $r$ between the essential disk and its corresponding semigroup eigenvalue. The preceding argument accounts for all weighted spectrum below that rate by finitely many eigenvectors in $cal(X)$. If the bottom $lambda$ is strictly below $lambda_(upright("sp"))$, it is therefore attained and isolated. Its complement has weighted generator spectrum bounded below by $lambda + eta$ for some $eta > 0$. The inverse $E_v arrow.r E$ is bounded because these spaces are finite dimensional, so its composition with $Pi_v iota$ gives the asserted projection for vectors of $cal(H)$ whose image is weighted-exact. Applying 57 to their complementary parts proves the last assertion. ◻
]

#prodef([Remark 8.14.])[
  The construction of $lambda$ uses stationary fixed-time limits alone.The subsequent use of 56 on a nonstationary trajectory chooses a fixed interior smoothing interval, a finite set of recipes, derivative and likelihood truncations, and the required conditional simulation accuracies before dimension. Only after those limits are established are the finite bases enlarged and spectral or large-block limits taken. This order permits arbitrary scalar coefficients in (8.11) and keeps the nonequivalent Hilbert norms distinct throughout.
] <rem:exact-parameter-order>

== 9 From fixed blocks to cutoff <sec:cutoff>

We now convert the fixed-time spectral estimates into cutoff. Uniform contraction on one sufficiently long fixed block gives the upper bound. For the lower bound, we use a linear statistic if the rate is the spin edge, and prepare a slow visible mode otherwise. Throughout, $0 < beta < 1$ is fixed, $lambda$ is the deterministic number in (8.6), and Euclidean norms remain unnormalized. For a forward trajectory $\( X_s \)$ and a terminal function $f$ at time $T$, write

$ p_s \( x \) = d S_(T - s) f \( x \) \, #h(2em) N_s^2 = bb(E) ∥p_s \( X_s \)∥^2 \, #h(2em) 0 lt.eq s lt.eq T . $

Thus $p$ evolves backwards while the law in the expectation evolves forwards. Bounds stated uniformly for polynomial tests mean that, for each fixed $M < oo$, they hold for every real $f$ with $∥∥ f_oo lt.eq n^M$. Increasing $M$ by a fixed amount is always allowed before selecting the good-disorder event. In particular, normalization by a norm at least an inverse power of $n$ preserves this class.

=== 9.1 Uniform blocks and deterministic selection <uniform-blocks-and-deterministic-selection>

===== 9.1.1 Restarting on a fixed interval. <restarting-on-a-fixed-interval.>

The limiting statements of 8 use prescribed comparison times. We will apply them to blocks whose positions may depend on the dimension and the disorder. The following finite-chain identities put such a block on a fixed relative interval before any limit is taken. Fix its length $ell > 0$. Conditional on $J$, let the original chain start from $nu$, and choose $0 lt.eq a lt.eq T - ell$ and a terminal function $f$. These choices may depend on $n \, J$, but not on the realized trajectory. Set

$ Y_r = X_(a + r) \, #h(2em) hat(nu) = nu S_a \, #h(2em) g = S_(T - a - ell) f \, #h(2em) 0 lt.eq r lt.eq ell . $

For $0 = r_0 < r_1 < dots.h.c < r_k lt.eq ell$, the joint law is

$ bb(P) \( Y_(r_0) = x_0 \, dots.h \, Y_(r_k) = x_k \) = hat(nu) \( x_0 \) product_(j = 1)^k S_(r_j - r_(j - 1)) \( x_(j - 1) \, x_j \) . $

Thus $Y$ is the same ordinary heat-bath chain with initial law $hat(nu)$. Its actual forward and reverse conditional laws, and trees copied at a single endpoint, are those of the original path restricted to the block. The semigroup identity gives

#[#set math.equation(numbering: n => "(9.1)")
 $ hat(p)_r := d S_(ell - r) g = p_(a + r) \, #h(2em) bb(E)_(accent(nu S, ̂)_r) ∥hat(p)_r∥^2 = N_(a + r)^2 . $ <eq:cutoff-restart>]

It preserves exactness, the Hessian budgets, and all contractions with fixed recipe vectors at corresponding endpoints.

The two bounds needed for the limiting arguments are also preserved. Positivity of $S_t$ gives $∥∥ g_oo lt.eq ∥∥ f_oo$ and $sup_x ∥hat(p)_r \( x \)∥ lt.eq sqrt(n) thin ∥∥ f_oo$; stationarity also preserves the equilibrium mean, $mu g = mu f$. Division by an endpoint norm bounded below by an inverse power of $n$ therefore changes only the fixed polynomial envelope. If $h = thin upright(d) nu \/ thin upright(d) mu$, reversibility and positivity give

#[#set math.equation(numbering: n => "(9.2)")
 $ frac(thin upright(d) \( nu S_a \), thin upright(d) mu) = S_a h \, #h(2em) ∥S_a h∥_oo lt.eq ∥∥ h_oo . $ <eq:cutoff-restart-density>]

At relative time $r$, its marginal density is $hat(h)_r = S_r hat(h)_0 = h_(a + r)$. For $0 lt.eq r < u lt.eq ell$, the reverse conditional law is therefore

$ bb(P) \( Y_r = x divides Y_u = y \) = frac(mu \( x \) hat(h)_r \( x \) S_(u - r) \( x \, y \), mu \( y \) hat(h)_u \( y \)) . $

In particular, the edge density ratios in the reverse Hellinger budget are unchanged at corresponding times. An upper relative log-density $o \( n \)$ survives every restart. For a point start and $a gt.eq b$, the same argument applied after time $b$ gives $∥h_a∥_oo lt.eq ∥h_b∥_oo$; hence the fixed-$b$ bound in 10 controls all later block origins on its single disorder event. A trajectory Poincaré bound, when assumed, has exactly the same constant and remainder after this change of coordinates because the marginal laws are identical.

We will use $ell = D$ or $2 D$ for a fixed block length $D$. The endpoints $0 \, D$ (and $2 D$ when $ell = 2 D$) can then be retained as prescribed times in 50. Interior comparison times are still selected using 51 and the integrated comparison bounds. The restart does not replace that selection by a supremum over exceptional auxiliary times.

#thm([Proposition 9.1.])[
  (Uniform contraction on a fixed block).  #emph[Fix $0 < xi < lambda$, a polynomial envelope $M$, a horizon constant $A < oo$, and $H < oo$. There are deterministic constants $D \, b_0 < oo$ and disorder events of probability tending to one on which the following assertion holds simultaneously for all starting configurations, all such terminal functions, and all $b_0 lt.eq a < a + D lt.eq T lt.eq A log n$: 
#[#set math.equation(numbering: n => "(9.3)")
 $ N_a^2 lt.eq e^(- 2 \( lambda - xi \) D) N_(a + D)^2 + n^(- H) . $ <eq:cutoff-block>]

 The same assertion, with no burn-in, holds in the deterministic typicality convention of 22 for families of initial laws satisfying $log ∥thin upright(d) nu \/ thin upright(d) mu∥_oo = o \( n \)$ uniformly. The constants may be chosen after $H$ and $M$; no quantitative rate for a fixed-time $o \( 1 \)$ is asserted or required.]
] <prop:cutoff-block>

#proof[
  The proof has three steps: a limiting contraction with strict slack, uniformity down to an inverse-polynomial norm, and a fixed burn-in. Begin with a block whose initial law has vanishing specific log density. Work first with a fixed $D > 2$, which will be enlarged below. For each possible choice of its origin and terminal horizon, apply (9.1) with $ell = D$ and terminal function $g = S_(T - a - D) f$. In the limiting argument we use these restarted objects, denoting the process again by $X$, so that $a = 0$, $T = D$, and the endpoint times are prescribed. Normalize $N_D = 1$. The rough square estimate in 13, integrated over the last unit of this interval, supplies a time $s in \[ D - 1 \, D - 1 \/ 2 \]$ at which
  #[#set math.equation(numbering: n => "(9.4)")
   $ bb(E) ∥p_s∥^2 + bb(E) sum_j w_j ∥d_j p_s∥^2 lt.eq C . $ <eq:cutoff-good-time>]
  One can impose the reverse Hellinger estimate of 51 at the same time. Both requirements hold on a set of times of positive measure after enlarging their fixed constants. By 56, the visible projection $q_s$ therefore lies in the exact weighted sector, including its scalar Hilbert factor. By Proposition 8.5, Theorem 8.3, Lemma 8.12, its propagation to the prescribed time $0$ has norm at most
  $ C_rho e^(- rho \( D - 1 \)) \, #h(2em) rho < lambda . $
  Conditional expectation on the scalar factor is a contraction. The upgrade applies to an unweighted visible vector whose weighted image lies in $cal(X)_v$; it does not require membership in $cal(X)$. The hidden remainder at time $0$ satisfies the corresponding estimate with any rate strictly below $lambda_(upright("sp"))$, by 42, testing against that remainder itself. Finite recipe projections followed by increasing the projection rank justify this test; the norm and Hessian bounds in (9.4) are exactly its input hypotheses. Consequently, for every $rho < lambda$,
  #[#set math.equation(numbering: n => "(9.5)")
   $ limsup N_0 lt.eq C_rho e^(- rho \( D - 1 \)) . $ <eq:cutoff-limiting-block>]
  Choose $rho in \( lambda - xi \, lambda \)$ and then $D$ so large that the right side is strictly smaller than $e^(- \( lambda - xi \) D)$. This leaves fixed multiplicative slack.
  We specify how the comparison time is selected, since the path estimates also contain auxiliary integration variables. First impose finitely many recipe, conditional-pair, and matrix tests at a fixed accuracy. The exponential stationary discard bounds transfer through the upper density bound and every fixed polynomial weight. Bounds for deterministic masks are integrated over their simplex variables before this transfer. Fubini and extraction give convergence in measure on the bounded domains of auxiliary times. The uniform rough $L^2$ estimates, with the Hessian budget when it occurs, control the resulting integrals. In particular, we do not bound an exceptional time integral by its Lebesgue measure times a polynomial pointwise supremum. Increasing the finite test lists and decreasing their accuracies permits one common choice of $s$ along a subsequence. Strong continuity, or a further fixed positive smoothing time, treats a convergent sequence of selected times. This is the deterministic countable-test content of 22.
  To obtain the additive accuracy in (9.3), consider an arbitrary proposed violating sequence of starts, functions, origins $a_n$, and horizons $T_n$. Restart each at $a_n$ on $\[ 0 \, D \]$, with $g_n = S_(T_n - a_n - D) f_n$, as above, and set $B = N_D^2$ for its restarted endpoint norm. If
  $ B lt.eq e^(- C D) n^(- H) \, $
  the rough estimate already gives $N_0^2 lt.eq n^(- H)$. Otherwise divide $p$ and its potential by $sqrt(B)$. A polynomial pointwise bound remains, since $B^(- 1 \/ 2) lt.eq e^(C D \/ 2) n^(H \/ 2)$. If the claimed inequality failed along a sequence of deterministic good disorders, its normalized version would contradict the strict slack in (9.5). Indeed the restarted laws satisfy (9.2), their normalized terminal functions remain polynomially bounded, and every endpoint comparison is now at $0$ or $D$. Only the interior good time is selected after imposing the integrated tests. Equation (9.1) then returns the estimate to the original block, regardless of the sequences $a_n \, T_n$. This proves the required uniformity. The inverse-power remainder comes from normalization and strict slack, rather than a rate assigned to a fixed-time $o \( 1 \)$.
  We finally prove that one #emph[fixed] burn-in works with disorder probability tending to one. A deterministic diagonal contradiction will place every required typicality test on the same sequence of disorders; convergence in probability of the limiting block estimate alone would not supply this conclusion. Enumerate the deterministic good-disorder inequalities just used, including the quenched exponential bounds for stationary exceptional sets and the uniform forward superpolynomial discards. For the first $k$ tests, with their fixed tolerances, let their positive exponential rates be $c_1 \, dots.h \, c_k$. By 10, choose fixed numbers $b_k arrow.t oo$ so that
  $ delta_k = C e^(- c b_k^(2 \/ 3)) arrow.r 0 \, #h(2em) delta_k < 1 / 4 min_(j lt.eq k) c_j . $
  Include the density bound at this particular $b_k$ in the finite good-disorder event $G_(n \, k)$.
  Suppose every fixed burn-in failed. For each $b_k$, there would be $epsilon_k > 0$ and arbitrarily large dimensions at which its failure event $F_(n \, b_k)$ had probability at least $epsilon_k$. Choose one such $n_k$, increasing sufficiently fast, with
  $ bb(P) \( G_(n_k \, k)^(upright(c)) \) < epsilon_k \/ 2 \, $
  and with all the finitely many dimension thresholds satisfied. Select a deterministic disorder in $F_(n_k \, b_k) ∩ G_(n_k \, k)$, together with a violating start, function $f_k$, origin $a_k gt.eq b_k$, and horizon $T_k gt.eq a_k + D$. Restart on $\[ 0 \, D \]$ with initial law $S_(a_k) \( x_k \, dot.op \)$ and terminal function $g_k = S_(T_k - a_k - D) f_k$. Its initial density is at most $e^(n_k delta_k)$ by (9.2) applied after $b_k$, and $∥g_k∥_oo lt.eq ∥f_k∥_oo$. Normalize only above the inverse-polynomial cutoff specified above. Every fixed typicality test now holds eventually on this deterministic sequence; its exponential discard survives multiplication by $e^(n_k delta_k)$ and the fixed polynomial normalization. The limiting argument therefore contradicts the same fixed contraction slack. No lower bound on the sequence $epsilon_k$ was used. Thus some fixed $b_0$ works, as asserted. ◻
]

#thm([Proposition 9.2.])[
  (Propagation over logarithmic times).  #emph[For $0 < xi < lambda$ and fixed $A \, M \, H$, on disorder events of probability tending to one, 
#[#set math.equation(numbering: n => "(9.6)")
 $ bb(E) ∥p_a \( X_a \)∥^2 lt.eq C_xi e^(- 2 \( lambda - xi \) \( b - a \)) bb(E) ∥p_b \( X_b \)∥^2 + C_xi n^(- H) \, #h(2em) 0 lt.eq a lt.eq b lt.eq T lt.eq A log n . $ <eq:cutoff-propagation>]

 The estimate is uniform over arbitrary initial laws and all polynomial tests in the specified envelope. For every deterministic $u in bb(R)^n$ with $∥∥ u = 1$, it implies the pointwise envelope 
#[#set math.equation(numbering: n => "(9.7)")
 $ sup_x ∥d S_t \( u^t x \) \( x \)∥^2 lt.eq C_xi e^(- 2 \( lambda - xi \) t) + C_xi n^(- H) \, #h(2em) 0 lt.eq t lt.eq A log n . $ <eq:cutoff-linear-envelope>]

]
] <prop:cutoff-gradient>

#proof[
  Iterate the uniform block estimate after the fixed burn-in. Contraction makes the additive remainders summable: for $k$ full blocks their total is at most
  $ n^(- H) sum_(j = 0)^(k - 1) e^(- 2 \( lambda - xi \) D j) lt.eq frac(n^(- H), 1 - e^(- 2 \( lambda - xi \) D)) . $
  The rough square estimate handles the burn-in and the remaining interval of length less than $D$. Their total length is bounded by $b_0 + D$, so they change only the constant. One may restart this argument at time $a$, with its arbitrary marginal law; integrating the point-start estimate handles mixtures. Short intervals are covered directly by the same rough estimate. Increase the chosen block accuracy by one fixed power if necessary to absorb constant factors. This proves (9.6). For $f \( x \) = u^t x$, the terminal gradient is the constant vector $u$, giving (9.7). ◻
]

Two consequences will be used repeatedly: bounded exponential moments for linear tests, and a common unweighted Poincaré bound along evolved laws. Write $rho = lambda - xi > 0$. For a unit linear test, the function

$ b \( r \) = C_xi e^(- 2 rho r) + C_xi n^(- H) $

is a deterministic pointwise bound for its squared unweighted gradient. Both $sup b$ and $integral_0^(A log n) b \( r \) thin upright(d) r$ are bounded independently of $n$, provided $H > 0$. 3 consequently gives

#[#set math.equation(numbering: n => "(9.8)")
 $ sup_(∥∥ u = 1) sup_(x \, thin t lt.eq A log n) bb(E)_x e^(theta \( u^t X_t - S_t \( u^t x \) \( x \) \)) lt.eq C_theta \, #h(2em) theta in bb(R) . $ <eq:cutoff-linear-mgf>]

Indeed its exponent is $2 theta^2 e^(2 \| theta \| sqrt(sup b)) integral b$. The application uses the unweighted #emph[pointwise] envelope in (9.7), as required by the finite-chain moment lemma. In particular, all these transition variances are bounded.

The second consequence concerns an unweighted Poincaré inequality along a trajectory. Suppose

$ "Var"_nu g lt.eq C_0 thin nu ∥d g∥^2 . $

Total variance, the martingale variance identity, and (9.6) give, for polynomial $f$ and $t lt.eq A log n$,

#[#set math.equation(numbering: n => "(9.9)")
 $ "Var"_(nu S_t) f lt.eq C_rho \( C_0 + 2 \/ rho \) thin nu S_t ∥d f∥^2 + O \( n^(- H) \) . $ <eq:cutoff-trajectory-poincare>]

To check the constants, the martingale contribution is at most $4 integral_0^t bb(E) ∥d S_(t - s) f \( X_s \)∥^2 thin upright(d) s$ and the initial contribution is at most $C_0 nu ∥d S_t f∥^2$. The exponential integral is at most $1 \/ \( 2 rho \)$. Apply (9.6) with an accuracy two powers better than the displayed one to absorb the time factor. Thus the constant in (9.9) is fixed independently of the test’s particular polynomial normalization.

=== 9.2 The upper bound and the spin-edge lower bound <the-upper-bound-and-the-spin-edge-lower-bound>

#thm([Lemma 9.3.])[
  (Euclidean oscillation bound).  #emph[For every real function $g$ on the cube, 
#[#set math.equation(numbering: n => "(9.10)")
 $ max g - min g lt.eq 2 sqrt(n) sup_x ∥d g \( x \)∥ . $ <eq:cutoff-oscillation>]

]
] <lem:cutoff-oscillation>

#proof[
  Extend $g$ multilinearly to the cube: let $overline(g) \( z \)$, $z in \[ - 1 \, 1 \]^n$, be its expectation under the product law with coordinate means $z_i$. Then $partial_i overline(g) \( z \) = bb(E)_z d_i g$, since $d_i g$ does not depend on its own spin. Jensen’s inequality gives
  $ ∥nabla overline(g) \( z \)∥^2 lt.eq bb(E)_z sum_i \( d_i g \)^2 lt.eq sup_x ∥d g \( x \)∥^2 . $
  Integrate along the Euclidean segment joining two vertices, whose length is at most $2 sqrt(n)$. ◻
]

By spin symmetry the equilibrium mean of a linear test is zero. (9.7), (9.10) therefore imply

#[#set math.equation(numbering: n => "(9.11)")
 $ \| S_t \( u^t x \) \( x \) \| lt.eq C sqrt(n) #scale(x: 120%, y: 120%)[\(] e^(- rho t) + n^(- H \/ 2) #scale(x: 120%, y: 120%)[\)] \, #h(2em) ∥∥ u = 1 . $ <eq:cutoff-linear-mean>]

Put $t_n = log n \/ \( 2 lambda \)$. Fix $epsilon.alt > 0$, and choose $xi > 0$ so small that $rho \( 1 + epsilon.alt \) > lambda$. Since the row norms of $J$ are bounded, (9.8), (9.11) give, for every $delta > 0$ and every fixed $R < oo$,

#[#set math.equation(numbering: n => "(9.12)")
 $ sup_x sup_(\( 1 + epsilon.alt \) t_n lt.eq s lt.eq A log n) bb(P)_x #h(-0.16667em) (max_i \| \( J X_s \)_i \| > delta log n) lt.eq n^(- R) $ <eq:cutoff-field-tail>]

for all sufficiently large $n$. For clarity, choose a fixed exponential parameter larger than $\( R + 2 \) \/ delta$, with the bounded row-norm factor included, use that every field mean is $o \( 1 \)$, and then sum the $n$ bounds. The estimate is uniform in $s$; no assertion about a maximum over a continuum of trajectory times is needed.

#thm([Lemma 9.4.])[
  (Upper cutoff).  #emph[For every $epsilon.alt > 0$, 
$ sup_x ∥S_(\( 1 + epsilon.alt \) t_n) \( x \, dot.op \) - mu∥_("TV") arrow.r 0 $

 in disorder probability.]
] <lem:cutoff-upper>

#proof[
  We will find a late time with bounded gradient energy, propagate that bound back to time zero, and then control oscillation. Relabelling $epsilon.alt$, it suffices to work at $T = \( 1 + 2 epsilon.alt \) t_n$. Fix $\| f \| lt.eq 1$ and a starting point. The backward martingale $S_(T - s) f \( X_s \)$ has jump bracket density $2 sum_i w_i p_(s \, i)^2$. Hence
  #[#set math.equation(numbering: n => "(9.13)")
   $ integral_0^T bb(E) sum_i w_i p_(s \, i)^2 thin upright(d) s lt.eq 1 / 2 . $ <eq:cutoff-energy-budget>]
  On the interval $I = \[ \( 1 + epsilon.alt \) t_n \, T \]$, whose length is $epsilon.alt t_n$, (9.12) applies. On its good field event,
  $ w_i gt.eq frac(2, 1 + e^(2 \| \( J X_s \)_i \|)) gt.eq n^(- 2 delta) . $
  On the complementary event $∥p_s∥^2 lt.eq n$, since $\| f \| lt.eq 1$. There is thus a time $s in I$ at which
  #[#set math.equation(numbering: n => "(9.14)")
   $ N_s^2 lt.eq frac(n^(2 delta), 2 epsilon.alt t_n) + n^(1 - R) . $ <eq:cutoff-terminal-energy>]
  Apply (9.6) between $0$ and this time. Uniformly over the starting point and $f$,
  $ ∥d S_T f \( x \)∥^2 lt.eq C n^(- \( 1 + epsilon.alt \) rho \/ lambda + 2 delta) + C n^(1 - R) + C n^(- H) . $
  Choose
  $ 0 < 2 delta < \( 1 + epsilon.alt \) rho \/ lambda - 1 \, #h(2em) R > 3 \, quad H > 2 . $
  This choice makes the squared gradient $o \( n^(- 1) \)$, exactly the scale needed to offset the cube diameter in 62. Hence $"osc" \( S_T f \) = o \( 1 \)$ uniformly for $\| f \| lt.eq 1$. Since $mu S_T f = mu f$, the variational formula for total variation proves the result. ◻
]

#thm([Lemma 9.5.])[
  (Lower cutoff when the spin edge determines the rate).  #emph[If $lambda = lambda_(upright("sp"))$, then for every $0 < epsilon.alt < 1$, 
$ sup_x ∥S_(\( 1 - epsilon.alt \) t_n) \( x \, dot.op \) - mu∥_("TV") arrow.r 1 $

 in disorder probability.]
] <lem:cutoff-spin-lower>

#proof[
  Let $sigma_n$ be the probability measure characterized by
  $ 1 / n sum_i ⟨x_i \, S_t x_i⟩_mu = integral e^(- r t) sigma_n \( thin upright(d) r \) . $
  Its fixed-test weak convergence to the spin spectral law is supplied by 41. For each fixed $delta > 0$, the definition of its support edge supplies $c_delta > 0$ such that, with disorder probability tending to one,
  $ sigma_n \( \[ 0 \, lambda + delta \] \) gt.eq c_delta . $
  One obtains this statement by testing a nonnegative continuous function supported below $lambda + delta$ with positive limiting integral. It follows for #emph[every] $t gt.eq 0$ that
  #[#set math.equation(numbering: n => "(9.15)")
   $ bb(E)_mu \[ X_0^t X_t \] gt.eq c_delta n e^(- \( lambda + delta \) t) . $ <eq:cutoff-spin-overlap>]
  The fixed spectral-mass bound remains valid for every time in this inequality. It therefore permits logarithmic times without taking a dimension-dependent Laplace-transform limit.
  Averaging over the initial equilibrium spin selects a configuration $x$ for which $bb(E)_x \[ x^t X_t \]$ is at least the value in (9.15). The unit linear test $f_x \( y \) = n^(- 1 \/ 2) x^t y$ detects this remaining overlap. Its equilibrium mean is zero and its transition mean is at least $c_delta sqrt(n) e^(- \( lambda + delta \) t)$. Its transition variance is bounded by (9.8); its equilibrium variance is at most the inverse gap, by 2. At $t = \( 1 - epsilon.alt \) t_n$, choose, for example, $0 < delta < lambda epsilon.alt \/ 4$. The displayed mean diverges as a positive power of $n$. Chebyshev’s inequality applied at half this mean gives total variation tending to one. ◻
]

=== 9.3 Alignment with an isolated visible eigenspace <alignment-with-an-isolated-visible-eigenspace>

Assume henceforth that $lambda < lambda_(upright("sp"))$. 58 supplies a finite-dimensional slow eigenspace. Write $E = \( E_1 \, dots.h \, E_m \)$ for a basis orthonormal in the weighted metric. Its columns have finite unweighted norm; let $C_E$ bound the norm of the embedding $c mapsto E c$ into that space. The projection onto this eigenspace is the same under the weighted spectral decomposition and the unweighted isolated spectral decomposition. All its complements needed below decay at a rate strictly greater than $lambda$.

We approximate the slow columns twice, for different purposes. Coarse smooth recipes $B$ control coefficient fluctuations; their derivative constants are fixed before choosing the alignment block. Fine recipes $tilde(E)$ then report the coefficients and define the preparation. Keeping these choices separate prevents the finer derivative constants from changing the block length that has already been chosen.

#thm([Proposition 9.6.])[
  (Mean and fluctuation alignment).  #emph[Fix a logarithmic horizon, a polynomial envelope, and a common constant $C_P$ in the defective trajectory Poincaré bound (9.9), with arbitrarily prescribed inverse-power accuracy. Consider uniformly typically initialized families of ordinary trajectories satisfying this bound. For every $eta > 0$, one can choose a fixed block length $D$ and fixed smooth recipes $tilde(E)$ such that, on disorder events of probability tending to one, the following holds uniformly. Put 
$ A_r = bb(E) #scale(x: 120%, y: 120%)[\[] tilde(E) \( X_r \)^t D_(v \( X_r \)) p_r \( X_r \) #scale(x: 120%, y: 120%)[\]] . $

 For $a = b - D$, suppose $N_b gt.eq n^(- Q)$, where $Q$ is any exponent fixed in advance. Suppose also that either $p_b$ is a fixed nondegenerate finite linear combination of concentrating visible exact test gradients, or there is a subsequent block with $N_(b + D) lt.eq R N_b$ for a fixed finite $R$. Then 
#[#set math.equation(numbering: n => "(9.16)")
 $ \| A_a - e^(- lambda D) A_b \| + #scale(x: 120%, y: 120%)[\(] bb(E) ∥p_a - tilde(E) A_a∥^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq eta e^(- lambda D) N_b . $ <eq:cutoff-alignment>]

 The ratio $R$ is used only to establish exactness at $b$; it does not enter the choice of $D$ or the fluctuation estimate.]
] <prop:cutoff-coefficients>

#proof[
  We may choose $D > 2$. First put the block at prescribed relative times using (9.1). In the terminal alternative take $ell = D$ and $g = S_(T - b) f$. In the subsequent-block alternative take $ell = 2 D$ and $g = S_(T - b - D) f$. In both cases the restart origin is $a = b - D$. The new initial law is the old marginal at $a$, with the same upper density bound and common trajectory Poincaré constant. The gradient and recipe contractions are unchanged at matching times; in particular $hat(A)_r = A_(a + r)$. The terminal alternative is the same condition on $hat(p)_D$, while the other alternative gives $hat(N)_(2 D) lt.eq R hat(N)_D$. For the limiting argument denote the restarted process again by $X$ and use $a = 0 \, b = D$; retain also $2 D$ in the second alternative. Normalize $N_D = 1$.
  We first establish exactness at $D$, then control the mean and fluctuation of the slow coefficient, and finally recover a uniform finite-dimensional estimate. In the terminal alternative, $q_b$ lies in the visible exact sector by assumption. In the subsequent-block alternative, the budget $N_(2 D) lt.eq R$ allows 56 at a good time selected in a fixed subinterval compactly contained in $\( D \, 2 D \)$. Both adjacent time separations thus stay positive after extraction. Transport back to the prescribed time $D$ by 50 gives the same conclusion at $b = D$. The value of the finite budget $R$ has served this purpose and is not used again.
  Retain $0 \, D$ and the good time $s in \[ D - 1 \, D - 1 \/ 2 \]$ in the same scalar extraction, together with $2 D$ and the later good time when that alternative is used. If $c_r$ denotes the random slow coefficient of $q_r$, projection and 50 give
  #[#set math.equation(numbering: n => "(9.17)")
   $ c_a = e^(- lambda \( s - a \)) bb(E) \[ c_s divides X_a \] \, #h(2em) bb(E) c_a = e^(- lambda \( b - a \)) bb(E) c_b . $ <eq:cutoff-slow-transport>]
  This transports the mean at the desired rate. To align the vector itself in unweighted square mean, we must also make the centered coefficient small.
  Choose a good time $s in \[ b - 1 \, b - 1 \/ 2 \]$ as in (9.4). Approximate one slow column by a coarse smooth scaled recipe $B$. The scalar function
  $ F_s \( x \) = B \( x \)^t D_(v \( x \)) p_s \( x \) $
  approximates the corresponding coefficient $c_s$ in scalar $L^2$ to error at most $C delta$, where $delta$ is the unweighted approximation accuracy. Indeed multiplication by $D_v$ is a contraction in the ordinary norm, and (8.10) extends the contraction with $p_s$ from fixed recipes to the slow column. The bound uses typicality under the evolving law; stationary mean-square approximation alone would not give it.
  The trajectory Poincaré inequality will control this fluctuation once we bound the gradient of $F_s$. Set $c_i = v_i B_i$; the exact product rule gives
  $ d_j F_s = sum_i c_i \( x^j \) d_j p_(s \, i) + sum_i p_(s \, i) \( x \) d_j c_i . $
  The columns of $B$ have entries bounded by $C_B \/ sqrt(n)$, and the matrix $\( d_j c_i \)_(i j)$ has operator norm at most $C_B \/ sqrt(n)$. For the first term, mixed-gradient symmetry changes $d_j p_(s \, i)$ to $d_i p_(s \, j)$. Also $v_i \( x^j \) lt.eq e^(C \| J_(i j) \|) v_i \( x \)$ and $v_i lt.eq 2 w_i$, so
  $ sum_i frac(c_i \( x^j \)^2, w_i \( x \)) lt.eq C_B . $
  Cauchy–Schwarz, followed by summation over $j$, proves
  #[#set math.equation(numbering: n => "(9.18)")
   $ bb(E) ∥d F_s∥^2 lt.eq C_B (bb(E) sum_i w_i ∥d_i p_s∥^2 + n^(- 1) bb(E) ∥p_s∥^2) lt.eq C_B . $ <eq:cutoff-coefficient-derivative>]
  The same estimate applies to every one of the finitely many columns.
  Before choosing these recipes or $D$, freeze once and for all a moderate-rate instance of (9.6), say with $rho_0 = lambda \/ 2$, and its constant $C_(rho_0)$. The Poincaré bound at time $a$, this instance of propagation applied to the scalar function $F_s$, and (9.18) give
  #[#set math.equation(numbering: n => "(9.19)")
   $ "Var" #scale(x: 120%, y: 120%)[\(] bb(E) \[ F_s \( X_s \) divides X_a \] #scale(x: 120%, y: 120%)[\)] lt.eq C_P C_(rho_0) C_B e^(- 2 rho_0 \( s - a \)) + o \( 1 \) . $ <eq:cutoff-coefficient-fluctuation>]
  The coefficient approximation costs $C delta$ in $L^2$ before transport. By (9.17), both this error and the square root of (9.19) carry the factor $e^(- lambda \( s - a \))$. Relative to $e^(- lambda D)$, their cost is bounded by
  $ C delta + C \( C_P C_(rho_0) C_B \)^(1 \/ 2) e^(- rho_0 \( D - 1 \)) . $
  In particular the approximation error does not acquire a factor $e^(lambda D)$.
  The hidden part and the exact fast complement, propagated from $s$, cost at most $C e^(- \( lambda + kappa \) \( D - 1 \))$ for some $kappa > 0$, by Theorem 7.1, Proposition 8.13, Lemma 8.12. The latter also applies when the visible vector is only in $cal(H)$ with weighted image in the fast part of $cal(X)_v$. After division by $e^(- lambda D)$, this fast-sector error is bounded by $C e^(lambda + kappa) e^(- kappa D)$. First choose $delta$ sufficiently small in terms of $eta$ and $C_E$, and fix the coarse recipes and $C_B$. Now choose $D$ large so that both normalized exponential errors,
  $ C \( C_P C_(rho_0) C_B \)^(1 \/ 2) e^(- rho_0 \( D - 1 \)) quad upright("and") quad C e^(lambda + kappa) e^(- kappa D) \, $
  are smaller than the required fixed fraction of $eta$. Restoring the common factor $e^(- lambda D)$ proves the limiting mean and fluctuation estimate with exact slow coefficients and reconstruction.
  The block length is now fixed, so we may choose the finer recipes $tilde(E)$ without altering the fluctuation estimate. At this $D$, an accuracy smaller than $c eta e^(- \( lambda + C \) D)$ makes all changes in the reported $A_a$, $A_b$, and the reconstruction smaller than the remaining fraction of $eta e^(- lambda D)$. Here $e^(C D)$ is a rough bound for any endpoint norm needed in this comparison. The finer derivative constants have not replaced $C_B$ in (9.19).
  Finally use strict slack, the deterministic good-disorder selection in the proof of 60, and normalization by $N_b$. The condition $N_b gt.eq n^(- Q)$ preserves a fixed polynomial envelope; choose every Poincaré and propagation remainder with an exponent larger than $2 Q + H + 2$ before using it. For a violating sequence, perform the one-block or two-block restart above before extraction. The normalized gradients, actual conditional laws, common Poincaré bound, and endpoint ratio meet the same hypotheses at the prescribed relative endpoints; any parameter selected from the family is fixed conditional on the disorder before the path is sampled. The resulting fixed-interval sequence would contradict the limiting estimate. Returning by (9.1) proves (9.16) uniformly at the original block positions, without a rate for any fixed-time $o \( 1 \)$. This includes the parameter selected from the preparation family below. ◻
]

=== 9.4 Preparation, the cone, and a macroscopic mean <preparation-the-cone-and-a-macroscopic-mean>

Choose $m$ fixed scalar tests $F_1 \, dots.h \, F_m$ from the potential class defining $cal(X)$ whose gradient projections onto the slow space form an invertible matrix. Such tests exist by density. Replace them by fixed linear combinations so that the limiting matrix is the identity. Their gradients have uniformly bounded pointwise Euclidean norm, and the functions have polynomial supremum bounds. For a unit output coefficient $u in bb(R)^m$, the terminal gradient $d \( sum_j u_j F_j \)$ consequently satisfies

#[#set math.equation(numbering: n => "(9.20)")
 $ \| A_T \| gt.eq c_0 \, #h(2em) N_T lt.eq K_0 \| A_T \| $ <eq:cutoff-terminal-cone>]

uniformly on typically initialized trajectories, after the recipe accuracy is sufficiently small.

The preparation must have a common Poincaré bound even when the slow recipes are refined. We establish this uniformity before making the final approximation choices. For any fixed smooth bounded scaled recipe matrix $tilde(E)$ and any $0 < alpha < 1 \/ 2$, set

$ R_n = n^(1 \/ 2 - alpha) \, #h(2em) g^z \( x \) = tilde(E) \( x \) z \, #h(2em) \| z \| < R_n . $

Let $T_s^z$ be the rate-one refresh dynamics whose target mean at the old configuration is

$ m_i^z \( x \) = tanh \( \( J x \)_i + g_i^z \( x \) \) . $

The target may depend on the spin being refreshed, so this process need not be reversible. Its generator is nevertheless exactly

#[#set math.equation(numbering: n => "(9.21)")
 $ L^z f = sum_i \( m_i^z - x_i \) d_i f . $ <eq:cutoff-preparation-generator>]

#thm([Lemma 9.7.])[
  (Common preparation bounds).  #emph[For each fixed recipe matrix and all sufficiently large $n$, uniformly for $\| z \| < R_n$ and $0 < h lt.eq 1$, the law $nu_z = mu T_h^z$ satisfies 
#[#set math.equation(numbering: n => "(9.22)")
 $ log ∥thin upright(d) nu_z \/ thin upright(d) mu∥_oo & lt.eq n h \( e^(2 epsilon_n) - 1 \) = O \( n^(1 - alpha) \) \, & epsilon_n & = sup_(z \, x \, i) \| g_i^z \( x \) \| = O \( n^(- alpha) \) \,\
"Var"_(nu_z) f & lt.eq [C_mu e^(C_(*) h) + 4 frac(e^(C_(*) h) - 1, C_(*))] nu_z ∥d f∥^2 . $ <eq:cutoff-preparation-density>]

 Here $C_mu$ can be the inverse equilibrium gap, and $C_(*)$ is a common constant depending on the original interaction bounds, not on the fixed recipe. A finer recipe changes the sufficiently large dimension threshold, but not this common constant.]
] <lem:cutoff-preparation>

#proof[
  Both the added field and its difference matrix are small. Scaled recipe calculus gives
  #[#set math.equation(numbering: n => "(9.23)")
   $ sup_(z \, x) ∥g^z \( x \)∥_oo + sup_(z \, x) ∥\( d_i g_j^z \( x \) \)_(i j)∥_(upright("op")) lt.eq C_(tilde(E)) n^(- alpha) . $ <eq:cutoff-small-perturbation>]
  At each refresh attempt, including an attempt that leaves the spin unchanged, the ratio of the perturbed outcome probability to the ordinary outcome probability is at most $e^(2 epsilon_n)$. On the common attempt construction the path likelihood is therefore at most $e^(2 epsilon_n N_h)$, with $N_h tilde.op "Poisson" \( n h \)$ under the ordinary process. Started at $mu$, the ordinary endpoint has law $mu$ conditional on $N_h = k$, because its embedded update kernel preserves $mu$. Thus $X_h$ and $N_h$ are independent under this stationary reference law, and for every endpoint $y$,
  $ frac(mu T_h^z \( y \), mu \( y \)) lt.eq bb(E)_mu \[ e^(2 epsilon_n N_h) divides X_h = y \] = exp { n h \( e^(2 epsilon_n) - 1 \) } . $
  Averaging the attempt likelihood therefore proves the endpoint density bound (9.22).
  For the variance estimate, we use gradients of the perturbed semigroup. Differentiate (9.21). The exact gradient extension has coefficients $a_(i j)^z = d_i m_j^z$, including the diagonal $a_(i i)^z$. Its formula is
  $ \( L^z - I \) p_i - 2 x_i sum_j a_(i j)^z d_j p_i + sum_j a_(i j)^z p_j . $
  The diagonal $a_(i i)^z p_i$ is an $o \( 1 \)$ zero-order term; the own-spin derivative of an exact gradient is zero. Taylor expansion of $tanh$, with (9.23) and the bounded row and column square sums, gives common bounds
  $ ∥a^z∥_(upright("op")) lt.eq C \, #h(2em) max_i sum_j frac(\| a_(i j)^z \|^2, w_j^z) lt.eq C \, #h(2em) w_j^z = 1 - x_j m_j^z . $
  For example the leading matrix is the field-difference matrix times the diagonal variance; $v_j^z lt.eq 2 w_j^z$ controls the displayed weighted row sum. The quadratic Taylor remainders are bounded Schur products of matrices with bounded row and column square sums. Once the right side of (9.23) is at most one, the square-evolution proof of 13 therefore has a common constant $C_(*)$. In particular
  #[#set math.equation(numbering: n => "(9.24)")
   $ ∥d T_s^z f∥^2 lt.eq e^(C_(*) s) T_s^z ∥d f∥^2 . $ <eq:cutoff-preparation-gradient>]
  Thus the gradient estimate remains valid for this possibly nonreversible preparation: it was derived from the stated generator and its exact gradients, without requiring a Gibbs invariant law.
  Its jump bracket is at most $4 ∥d T_(h - s)^z f∥^2$. The conditional martingale variance formula and (9.24) give
  $ "Var"_x \( f \( X_h \) \) lt.eq 4 frac(e^(C_(*) h) - 1, C_(*)) thin T_h^z ∥d f∥^2 \( x \) . $
  The other term in total variance is
  $ "Var"_mu \( T_h^z f \) lt.eq C_mu mu ∥d T_h^z f∥^2 lt.eq C_mu e^(C_(*) h) mu T_h^z ∥d f∥^2 . $
  Their sum is (9.22). ◻
]

We now fix the remaining parameters in an order that preserves the common constants. First freeze the moderate rate $rho_0 = lambda \/ 2$ and its propagation constants in (9.6). Use 66 with $h lt.eq 1$ in (9.9); this gives a common $C_P$ for every prepared ordinary trajectory, independent of later recipe refinements. Next fix the output tests, choose $K > max { K_0 \, 2 C_E + 2 }$, and choose $eta$ small in terms of $K$ and the desired rate slack. Choose the coarse coefficient recipes, then the alignment block $D$, and then the finer reporting and preparation recipes, in exactly the order in the proof of 65. Finally choose a positive $h lt.eq 1$ for these fine recipes. Shrinking $h$ cannot increase the common Poincaré constant; larger fine-recipe derivative constants change the dimension threshold in 66 and the choice of $h$, not the previously fixed coefficient fluctuation bound or $D$.

#thm([Lemma 9.8.])[
  (Iteration inside the slow cone).  #emph[Given $xi_1 > 0$ and $epsilon.alt_0 > 0$, the preceding choices can be made so that, for $t$ an integer multiple of $D$, the gradient $p_0 = d S_t \( sum_j u_j F_j \)$ under any prepared law satisfies 
#[#set math.equation(numbering: n => "(9.25)")
 $ \| A_0 \| gt.eq c e^(- \( lambda + xi_1 \) t) \, #h(2em) #scale(x: 120%, y: 120%)[\(] bb(E)_(nu_z) ∥p_0 - tilde(E) A_0∥^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq epsilon.alt_0 \| A_0 \| \, $ <eq:cutoff-cone-output>]

 uniformly for $\| u \| = 1$, $\| z \| < R_n$, and positive times $D lt.eq t lt.eq A log n$.]
] <lem:cutoff-cone>

#proof[
  The cone compares the full gradient norm with its mean slow coefficient. Assume $N_b lt.eq K \| A_b \|$ at the end of a block. (9.16) gives
  $ \| A_a \| & gt.eq \( 1 - K eta \) e^(- lambda D) \| A_b \| \,\
N_a & lt.eq C'_E \| A_a \| + eta e^(- lambda D) N_b lt.eq (C'_E + frac(K eta, 1 - K eta)) \| A_a \| \, $
  where $C'_E$ is arbitrarily close to $C_E$ after fine approximation. Choose $K eta < 1 \/ 4$ and then $eta$ small enough that the last coefficient is at most $K$, and $K eta \/ \( 1 - K eta \) lt.eq epsilon.alt_0$. Thus the cone is preserved. At the terminal time it holds by (9.20). At each step, apply the fixed-interval restart in the proof of 65 to the ordinary trajectory with initial block law $nu_z S_a$. Its upper density bound follows from (9.22), (9.2), and its common Poincaré bound is the one fixed above. This restarts only the ordinary part of the evolution, leaving the preparation $T_h^z$ unchanged. At subsequent blocks the required forward norm ratio follows from the preceding cone step:
  $ N_(b + D) / N_b lt.eq frac(K C_A e^(lambda D), 1 - K eta) \, #h(2em) \| A_b \| lt.eq C_A N_b . $
  This ratio is finite for the already chosen block $D$. Its only role in 65 is to establish exactness at the block endpoint, so its dependence on $D$ does not create a circular choice.
  After $k = t \/ D$ steps,
  $ \| A_0 \| gt.eq c_0 \( 1 - K eta \)^k e^(- lambda t) = c_0 e^(- \[ lambda - D^(- 1) log \( 1 - K eta \) \] t) . $
  Take $D gt.eq 1$ and $eta lt.eq xi_1 \/ \( 2 K \)$, so that the extra exponent is at most $xi_1$. To verify the inverse-power cutoff throughout the iteration, choose
  $ Q > A \( lambda + xi_1 \) + 2 . $
  The lower bound for $\| A \|$, and $\| A \| lt.eq C_A N$, then keep $N$ above $n^(- Q)$ for all the $O \( log n \)$ blocks. Choose the inverse-power accuracies used in the supporting Poincaré estimates larger than $2 Q + H + 2$. No new union bound over fixed-time limiting errors is needed: (9.16) holds on one event uniformly over the functions, parameter values, and comparison times in question. The residual estimate in (9.25) follows from the final cone step. ◻
]

#thm([Lemma 9.9.])[
  (Preparation creates a ball of final means).  #emph[For sufficiently small fixed $h > 0$ chosen after the fine recipes, the smooth map 
$ cal(M)_t \( z \) = #scale(x: 120%, y: 120%)[\(] mu T_h^z S_t F_j #scale(x: 120%, y: 120%)[\)]_(j = 1)^m \, #h(2em) \| z \| < R_n \, $

 has Jacobian with smallest singular value at least 
#[#set math.equation(numbering: n => "(9.26)")
 $ sigma_min \( D cal(M)_t \( z \) \) gt.eq c h e^(- \( lambda + xi_1 \) t) = : a_t . $ <eq:cutoff-jacobian>]

 Its image therefore contains the open Euclidean ball of radius $a_t R_n$ centered at $\( mu F_j \)_(j = 1)^m$.]
] <lem:cutoff-jacobian>

#proof[
  We estimate the Jacobian in each unit output direction. For $\| u \| = 1$, put $F = sum_j u_j F_j$ and apply (9.25) at the exit from preparation. Differentiation on the finite state space and Duhamel’s formula give the row vector
  #[#set math.equation(numbering: n => "(9.27)")
   $ u^t D cal(M)_t \( z \) = integral_0^h bb(E)_(mu T_s^z) [\( d T_(h - s)^z S_t F \)^t D_(v^z) tilde(E)] thin upright(d) s \, #h(2em) v_i^z = 1 - \( m_i^z \)^2 . $ <eq:cutoff-duhamel-jacobian>]
  Indeed $partial_(z_k) L^z f = sum_i v_i^z tilde(E)_(i k) d_i f$, also when the target depends on the old spin.
  Write $p_0 = tilde(E) A_0 + r$ under $nu_z$. The rough vector extension behind (9.24) propagates $r$ back through preparation at cost at most $e^(C_(*) h \/ 2)$ in mean square. Its contribution to (9.27) is therefore $O \( h epsilon.alt_0 \| A_0 \| \)$.
  For the main vector, uniformly over $0 lt.eq s lt.eq h$,
  #[#set math.equation(numbering: n => "(9.28)")
   $ (bb(E)_(mu T_s^z) ∥K_(h - s)^z tilde(E) - tilde(E)∥^2)^(1 \/ 2) lt.eq omega_(tilde(E)) \( h \) + o_n \( 1 \) \, #h(2em) omega_(tilde(E)) \( h \) arrow.r 0 . $ <eq:cutoff-short-continuity>]
  Here the norm is the sum over the fixed number of columns. To verify this estimate, the diagonal likelihood representation has row moments bounded by $e^(C h)$, and its likelihood difference from one has squared mean $O \( h \)$, by the likelihood martingale bracket and the bounded row square sums. The entries of a fixed scaled recipe are bounded by $C \/ sqrt(n)$, so this diagonal error costs $O \( h \)$ after summation. The part with at least one inserted coefficient matrix costs $O \( h \)$ in norm by its Duhamel expansion and the common rough bound. Finally the ordinary recipe value changes by $o_h \( 1 \)$ in spatial mean square along the short path: its smooth Euclidean extension has Lipschitz constant $C_(tilde(E)) \/ sqrt(n)$, while the expected number of changed spins is at most $n h$. These estimates also apply to the perturbed rates, using (9.23); the own-spin zero-order correction is $o_n \( 1 \)$. They prove (9.28) without a regularity assertion for the exact eigenvectors.
  By (9.22), every marginal in this calculation has upper relative log-density $o \( n \)$. The one-state typicality comparisons, the chosen fine accuracy, and $∥v^z - v∥_oo = o \( 1 \)$ therefore give
  $ bb(E)_(mu T_s^z) \[ tilde(E)^t D_(v^z) tilde(E) \] = I + O \( delta_(upright("fine")) \) + o_n \( 1 \) $
  uniformly in $s \, z$. Combining this with (9.27), (9.28) yields
  $ lr(|u^t D cal(M)_t \( z \) - h A_0^t|) lt.eq C h #scale(x: 120%, y: 120%)[\(] epsilon.alt_0 + delta_(upright("fine")) + omega_(tilde(E)) \( h \) + o_n \( 1 \) #scale(x: 120%, y: 120%)[\)] \| A_0 \| . $
  Choose $epsilon.alt_0$ and the fine accuracy first, and then choose a positive fixed $h$ so that the factor in parentheses is small. (9.25) now proves (9.26), uniformly for every unit output vector.
  To pass from the Jacobian estimate to a ball of attainable means, we lift straight line segments by the inverse Jacobian. This argument requires only the proved singular-value bound, not global injectivity. For a target vector $v$ with $\| v \| < a_t R_n$, solve the inverse-Jacobian ordinary differential equation
  $ z' \( r \) = \( D cal(M)_t \( z \( r \) \) \)^(- 1) v \, #h(2em) z \( 0 \) = 0 \, #h(2em) 0 lt.eq r lt.eq 1 . $
  The right side is smooth and $\| z' \( r \) \| lt.eq \| v \| \/ a_t < R_n$. The solution stays in a compact subball of the parameter ball and therefore exists to time one. Differentiation gives $cal(M)_t \( z \( r \) \) = cal(M)_t \( 0 \) + r v$. At $z = 0$ the preparation is ordinary stationary evolution, so $cal(M)_t \( 0 \) = \( mu F_j \)_j$. This proves the assertion. ◻
]

#thm([Lemma 9.10.])[
  (Lower cutoff for an isolated visible rate).  #emph[If $lambda < lambda_(upright("sp"))$, the lower conclusion of 64 still holds.]
] <lem:cutoff-visible-lower>

#proof[
  Fix $0 < epsilon.alt < 1$, take $0 < alpha < epsilon.alt \/ 8$ and $0 < xi_1 < lambda epsilon.alt \/ 4$, and round $\( 1 - epsilon.alt \) t_n$ #emph[up] to an integer multiple $t$ of $D$. The radius in 68 is at least
  $ c h e^(- \( lambda + xi_1 \) D) n^(thin 1 \/ 2 - alpha - \( 1 - epsilon.alt \) \( lambda + xi_1 \) \/ \( 2 lambda \)) . $
  The exponent is positive, so the ball of attainable means has diverging radius. In particular, one may choose a preparation for which the mean of $F_1$ differs from $mu F_1$ by a quantity tending to infinity. The variances of $F_1$ under $nu_z S_t$ and $mu$ are bounded: use the common trajectory Poincaré estimate and its bounded pointwise gradient for the first, and the equilibrium gap for the second. Chebyshev’s inequality implies $∥nu_z S_t - mu∥_("TV") arrow.r 1$. Since $nu_z$ is a probability law on starting configurations, convexity bounds this distance by $sup_x ∥S_t \( x \, dot.op \) - mu∥_("TV")$. Monotonicity then gives the same lower bound at the unrounded, earlier time $\( 1 - epsilon.alt \) t_n$. ◻
]

#thm([Theorem 9.11.])[
  (Continuous-time cutoff).  #emph[For every fixed $0 < beta < 1$ and $epsilon.alt in \( 0 \, 1 \)$, put $t_n = log n \/ \( 2 lambda \)$. Then 
#[#set math.equation(numbering: n => "(9.29)")
 $ sup_x ∥S_(\( 1 - epsilon.alt \) t_n) \( x \, dot.op \) - mu∥_("TV") & arrow.r 1 \,\
sup_x ∥S_(\( 1 + epsilon.alt \) t_n) \( x \, dot.op \) - mu∥_("TV") & arrow.r 0 \, $ <eq:cutoff-continuous>]

 in probability over the disorder. The number $lambda > 0$ is given entirely by the dimension-first equilibrium construction in (8.6).]
] <thm:cutoff-continuous>

#proof[
  The upper bound follows from 63. For the lower bound, 64 applies when $lambda = lambda_(upright("sp"))$, and 69 applies when $lambda < lambda_(upright("sp"))$. These cases exhaust the definition of $lambda$. ◻
]

5 supplies the continuous-time conclusion at $beta = 0$, with $lambda \( 0 \) = 1$. It remains to transfer both cases to the discrete update clock.

=== 9.5 The discrete update clock <the-discrete-update-clock>

#thm([Proposition 9.12.])[
  (Cutoff for single-site update attempts).  #emph[Let $P = I + L \/ n$, so one step selects a uniform site and refreshes its spin, including attempts that leave the state unchanged. For every fixed $0 lt.eq beta < 1$, its worst-case total-variation cutoff is at 
$ frac(n log n, 2 lambda \( beta \)) \, $

 in probability over the disorder.]
] <prop:cutoff-clock>

#proof[
  We prove both directions of clock transfer. Write $d_c \( t \)$ and $d_d \( k \)$ for the continuous and discrete distances; their kernels satisfy the exact Poissonization identity $S_t = e^(n t \( P - I \))$. For $k = floor.l \( 1 - epsilon.alt \) n t_n floor.r$ and $T = \( 1 - epsilon.alt \/ 2 \) t_n$, convexity and discrete-time contraction give
  $ d_c \( T \) lt.eq bb(P) { "Poisson" \( n T \) < k } + d_d \( k \) . $
  The probability is $O \( \( n t_n \)^(- 1) \)$, while $d_c \( T \) arrow.r 1$, proving the discrete lower bound.
  For the upper bound, a uniform holding probability permits the local Poisson-to-binomial lemma. Restrict to the high-probability event $∥∥ J_(upright("op")) lt.eq K$. At every configuration, $n^(- 1) sum_i \( J x \)_i^2 lt.eq K^2$, so at least half of the fields have absolute value at most $sqrt(2) K$. The probability of keeping a selected spin is at least $\( 1 + e^(2 \| \( J x \)_i \|) \)^(- 1)$. Consequently
  #[#set math.equation(numbering: n => "(9.30)")
   $ P \( x \, x \) gt.eq h_0 := frac(1, 2 \( 1 + e^(2 sqrt(2) K) \)) > 0 . $ <eq:cutoff-holding>]
  Choose $theta.alt = 1 - h_0 \/ 2 in \( 0 \, 1 \)$ and write
  $ P = \( 1 - theta.alt \) I + theta.alt R \, #h(2em) S_t = e^(theta.alt n t \( R - I \)) . $
  Here $R$ is a Markov kernel preserving $mu$. Set $M = ceil.l \( 1 + epsilon.alt \) n t_n ceil.r$. For every $x$ and $\| f \| lt.eq 1$, put $u_j = R^j f \( x \) - mu f$, so $\| u_j \| lt.eq 2$. For each fixed real $y$,
  $ bb(E) u_("Poisson" \( theta.alt M + y sqrt(M) \)) = S_(M \/ n + y sqrt(M) \/ \( theta.alt n \)) f \( x \) - mu f . $
  The time correction is $O_y \( sqrt(log n \/ n) \)$, and hence this time exceeds $\( 1 + epsilon.alt \/ 2 \) t_n$ for large $n$. The absolute value of the display is bounded by $2 d_c \( \( 1 + epsilon.alt \/ 2 \) t_n \) arrow.r 0$, uniformly over $x \, f$.
  We have verified every shifted Poisson average required by 4, uniformly over starts and tests. Apply that uniform transfer: its assumptions are a fixed $theta.alt in \( 0 \, 1 \)$, $M arrow.r oo$, bounded arrays, and vanishing Poisson averages for every fixed shift $y$, all just verified. It gives
  $ bb(E) u_("Binomial" \( M \, theta.alt \)) = P^M f \( x \) - mu f arrow.r 0 $
  uniformly over the test family. Taking half its supremum proves $d_d \( M \) arrow.r 0$. For convergence in disorder probability, the proof of that lemma uses a fixed finite signed approximation by shifted Gaussian densities; its finitely many Poisson averages are all bounded by the same random quantity $2 d_c \( \( 1 + epsilon.alt \/ 2 \) t_n \)$. Thus it applies on the present high-probability events without any additional convergence rate. ◻
]

== 10 An independent gradient argument below one half <sec:rcut-introduction>

These appendices prove cutoff for $0 lt.eq beta < 1 \/ 2$ by following the unweighted gradient along the heat-bath dynamics. The proof places the median mixing time on the logarithmic scale and shows that the total-variation transition has vanishing relative width. The central estimate is pointwise: the gradient dissipates at a fixed positive rate outside a set of exponentially small Gibbs mass. Entropy decay first makes that exceptional set unlikely, and smoothing over a positive logarithmic lag then converts gradient control into the cutoff ratio.

This argument also yields estimates with uses beyond its cutoff conclusion. They include a spectral-gap and covariance bound uniform over external fields and interaction scalings, and the scalar variational bound $0.9969$ with its complete analytic and arithmetic certificate. The proof is independent of the limiting exact-gradient operator used in the full high-temperature argument.

Keep the model, half-differences, and two clock conventions of Section 2. Write $bb(P)_J$ for the interaction-matrix law and abbreviate the worst-start total-variation distances by $d_c \( t \) = d_n \( t \)$ and $d_d \( k \) = d_n^(upright("disc")) \( k \)$. We will use the two gradient densities and the median mixing time

$ U \( f \) = sum_i \( d_i f \)^2 \, #h(2em) Gamma \( f \) = sum_i w_i \( d_i f \)^2 \, #h(2em) t_n^(upright("med")) = inf { t gt.eq 0 : d_c \( t \) lt.eq 1 \/ 2 } . $

The weights are $w_i = 1 - x_i tanh \( \( J x \)_i \)$. Expanding the square at each spin flip gives the identity

#[#set math.equation(numbering: n => "(10.1)")
 $ L \( f^2 \) - 2 f L f = 2 Gamma \( f \) $ <rcut:eq:variance-density>]

For a probability measure $nu$ and an integrable function $f$, write $nu f = integral f thin d nu$. All vector and matrix norms in these appendices are Euclidean and Euclidean operator norms, respectively, unless explicitly specified. We continue to write $bb(P)_x$ and $bb(E)_x$ for chain probabilities and expectations after fixing the disorder.

#thm([Theorem 10.1.])[
  #emph[For every fixed $beta in \[ 0 \, 1 \/ 2 \)$, $epsilon in \( 0 \, 1 \/ 2 \)$, and $eta > 0$, let 
$ t_(n \, beta \, J) \( epsilon \) = min { k gt.eq 0 : d_d \( k \) lt.eq epsilon } . $

 Then 
$ bb(P)_J {frac(t_(n \, beta \, J) \( epsilon \), t_(n \, beta \, J) \( 1 - epsilon \)) > 1 + eta} arrow.r 0 . $

 The denominator is positive for sufficiently large $n$.]
] <rcut:thm:main>

The denominator is eventually positive because $d_d \( 0 \) = 1 - min_x mu \( x \) gt.eq 1 - 2^(- n)$. We prove the stated ratio directly; the full-phase theorem is not an input to this appendix argument.

The proof has three stages. Section 11 starts with a uniform two-spin inequality, obtains the gap under all external fields and interaction scalings, and passes from that gap to entropy decay by Gaussian observations. Section 12 expresses the pointwise gradient dissipation as a matrix inequality. The matrix comparison in Section 13 and the scalar estimate in Section 14 establish that inequality outside an exponentially small Gibbs set. Finally, Sections 15 and 16 use concentration and positive-lag smoothing to prove the cutoff ratio, invoking the general jump-moment and clock lemmas stated in Section 2. Section 17 supplies every quadrature and arithmetic enclosure used in the scalar estimate.

The temperature parameter $beta$ remains fixed throughout, and constants may depend on it. Whenever an estimate is used on a logarithmic time horizon, its times are at most $D_(*) log n$, with $D_(*) < oo$ chosen before taking $n arrow.r oo$.

== 11 Uniform spectral and entropy estimates <rcut:sec:entropy>

The entropy estimate needed for the independent cutoff argument rests on a spectral gap that survives both changes of external field and reductions of the interaction strength. We prove this gap by summing a signed two-spin inequality, then pass to entropy through Gaussian observations. The observation posterior changes both the field and the interaction, which is why both uniformities are needed. Throughout this section, the inverse temperature $beta < 1 \/ 2$ is fixed.

=== 11.1 Gaussian estimates and a good disorder event <gaussian-estimates-and-a-good-disorder-event>

We first collect the Gaussian tools used to control the operator norm, the row-square sums, and the largest entry of the interaction matrix. These three controls will make the two-spin error summable on a single disorder event.

#thm([Lemma 11.1.])[
  (Gaussian concentration and comparison).  #emph[Let $Z$ be a vector of independent standard real Gaussian variables. If $F$ is $D$-Lipschitz in Euclidean distance, then 
#[#set math.equation(numbering: n => "(11.1)")
 $ bb(E) exp #scale(x: 120%, y: 120%)[\(] s \( F \( Z \) - bb(E) F \( Z \) \) #scale(x: 120%, y: 120%)[\)] lt.eq exp (frac(pi^2 D^2 s^2, 8)) \, #h(2em) s in bb(R) . $ <rcut:eq:gaussian-mgf>]

 In particular, for $D > 0$ and $r > 0$, 
$ bb(P) #scale(x: 120%, y: 120%)[\(] \| F \( Z \) - bb(E) F \( Z \) \| gt.eq r #scale(x: 120%, y: 120%)[\)] lt.eq 2 exp (- frac(2 r^2, pi^2 D^2)) . $

 If $\( X_a \)_(a in I)$ and $\( Y_a \)_(a in I)$ are centered Gaussian processes on the same finite index set and 
$ bb(E) \( X_a - X_b \)^2 lt.eq bb(E) \( Y_a - Y_b \)^2 quad upright("for all ") a \, b in I \, $

 then $bb(E) max_a X_a lt.eq bb(E) max_a Y_a$. The comparison also holds for continuous processes on a compact metric index set when their suprema are integrable.]
] <rcut:lem:gaussian-facts>

#proof[
  For the concentration estimate, we use the Maurey–Pisier Gaussian rotation and double-Jensen argument; see Giraud #cite(label("Giraud2021")) Exercise 1.6.7, equation (1.10), parts A–B. Rotation between two independent Gaussian vectors expresses the increment as an integral of directional derivatives. First take $F$ smooth with $parallel nabla F parallel lt.eq D$. Let $Z'$ be an independent copy of $Z$ and define the rotation by
  $ Z_theta = Z cos theta + Z' sin theta \, #h(2em) V_theta = - Z sin theta + Z' cos theta \, #h(2em) 0 lt.eq theta lt.eq pi \/ 2 . $
  For a fixed angle, $Z_theta$ and $V_theta$ are independent standard Gaussian vectors. This independence lets us evaluate the exponential moment after applying Jensen’s inequality, first in $Z'$ and then with respect to the uniform measure on $\[ 0 \, pi \/ 2 \]$:
  $ bb(E) e^(s \( F \( Z \) - bb(E) F \( Z \) \)) & lt.eq bb(E) e^(s \( F \( Z \) - F \( Z' \) \))\
 & lt.eq 2 / pi integral_0^(pi \/ 2) bb(E) exp (- frac(pi s, 2) nabla F \( Z_theta \) dot.op V_theta) thin d theta lt.eq e^(pi^2 D^2 s^2 \/ 8) . $
  To pass to a general Lipschitz $F$, smooth by convolution and use dominated convergence. Linear growth gives the Gaussian exponential integrability required for this passage. Optimization of the exponential Markov bound then gives the tail estimate. The case $D = 0$ follows directly because the function is constant.
  For the comparison statement, we interpolate independent realizations of the two processes and show that the expected maximum increases along the interpolation. For $lambda > 0$, replace the maximum by the smooth function
  $ Phi_lambda \( z \) = lambda^(- 1) log sum_(a in I) e^(lambda z_a) . $
  Gaussian integration by parts gives
  $ frac(d, d t) bb(E) Phi_lambda #scale(x: 120%, y: 120%)[\(] sqrt(1 - t) thin X + sqrt(t) thin Y #scale(x: 120%, y: 120%)[\)] = 1 / 2 sum_(a \, b) B_(a b) thin bb(E) \( partial_(a b) Phi_lambda \) \, #h(2em) B = "Cov" \( Y \) - "Cov" \( X \) . $
  The Hessian has zero row sums and nonpositive off-diagonal entries. Consequently the derivative can be expressed using only increment variances. With $Delta_(a b) = B_(a a) + B_(b b) - 2 B_(a b)$ denoting their difference, the right side becomes
  $ - 1 / 4 sum_(a \, b) Delta_(a b) thin bb(E) \( partial_(a b) Phi_lambda \) gt.eq 0 . $
  The limit $lambda arrow.r oo$ gives the finite-set comparison. Exhausting a dense set by finite subsets and using continuity and dominated convergence gives the compact-set version. In the applications below, every such process is a linear function of a finite Gaussian vector, which ensures integrability of its supremum. ◻
]

#thm([Proposition 11.2.])[
  (Good disorder).  #emph[There are deterministic numbers $delta_n arrow.b 0$ and events $cal(E)_n = cal(E)_n \( beta \)$ with $bb(P) \( cal(E)_n \) arrow.r 1$ such that on $cal(E)_n$, 
#[#set math.equation(numbering: n => "(11.2)")
 $ parallel J parallel lt.eq 2 beta + delta_n \, #h(2em) max_i sum_j J_(i j)^2 lt.eq beta^2 + delta_n \, #h(2em) max_(i \, j) \| J_(i j) \| lt.eq delta_n . $ <rcut:eq:good-disorder>]

 Consequently, on the same events, 
$ max_i sum_j \| J_(i j) \|^3 arrow.r 0 . $

 One may take $delta_n = n^(- 1 \/ 4)$.]
] <rcut:prop:good-disorder>

#proof[
  We prove the operator-norm estimate first and then control the row sums and individual entries. The case $beta = 0$ is deterministic. For $beta > 0$, add independent diagonal entries of variance $2 beta^2 \/ n$ to $J$. The resulting centered Gaussian orthogonal ensemble (GOE) matrix $W$ has a covariance that permits a direct Gaussian comparison: for unit vectors $p \, q$,
  $ bb(E) \[ \( p^(sans(T)) W p \) \( q^(sans(T)) W q \) \] = frac(2 beta^2, n) \( p^(sans(T)) q \)^2 . $
  With $rho = p^(sans(T)) q$, the increment variance of $p^(sans(T)) W p$ is $4 beta^2 \( 1 - rho^2 \) \/ n$. Bound it by $8 beta^2 \( 1 - rho \) \/ n$ and compare with the linear process $\( 2 beta \/ sqrt(n) \) p^(sans(T)) z$, where $z$ is a standard Gaussian vector. Lemma 73 yields
  $ bb(E) lambda_max \( W \) lt.eq frac(2 beta, sqrt(n)) bb(E) parallel z parallel lt.eq 2 beta . $
  In the independent standard Gaussian coordinates defining $W$, the quadratic form $p^(sans(T)) W p$ is Lipschitz with constant $sqrt(2) beta \/ sqrt(n)$, uniformly over unit vectors. The supremum inherits this constant. Concentration for $lambda_max \( W \)$ and $lambda_max \( - W \)$ therefore bounds $parallel W parallel$ by $2 beta + delta_n \/ 2$ with probability tending to one. The largest absolute diagonal entry is at most $delta_n \/ 2$ with probability tending to one as well. Removing that diagonal proves the first estimate in Equation (11.2).
  For a standard Gaussian $g$,
  $ bb(E) e^(theta \( g^2 - 1 \)) = e^(- theta) \( 1 - 2 theta \)^(- 1 \/ 2) lt.eq e^(C theta^2) \, #h(2em) \| theta \| lt.eq 1 \/ 4 . $
  Apply the exponential Markov bound to the $n - 1$ independent squares in one row. The probability that their weighted sum exceeds $beta^2 + delta_n$ is at most $exp \( - c_beta n delta_n^2 \)$ for large $n$. A union bound over the rows gives the second estimate; Gaussian tails and a union bound over entries give the third. The choice $n delta_n^2 = sqrt(n)$ makes all the failure probabilities vanish. The cubic row sums needed for the two-spin remainder are now controlled by the last two estimates together:
  $ max_i sum_j \| J_(i j) \|^3 lt.eq (max_(i \, j) \| J_(i j) \|) (max_i sum_j J_(i j)^2) lt.eq delta_n \( beta^2 + delta_n \) . $
  ◻
]

=== 11.2 A two-spin estimate and a uniform gap <a-two-spin-estimate-and-a-uniform-gap>

We next prove an inequality for a pair of sites and sum it over the set of site pairs to obtain the gap. The pair estimate must remain uniform when a one-site conditional variance is small. For an Ising law $nu$ with symmetric, zero-diagonal interaction matrix $A$ and external field $theta in bb(R)^n$, write

$ nu \( x \) prop exp (1 / 2 x^(sans(T)) A x + theta dot.op x) \, #h(2em) m_i = bb(E)_nu \[ X_i divides X_(- i) \] \, #h(2em) v_i = 1 - m_i^2 . $

All notation in this subsection refers to this law. To express the one-site energies as squared projection norms, let $E_i$ be conditional expectation given the spins outside $i$, and put

$ sans(D)_i = I - E_i \, #h(2em) sans(D)_i f = \( x_i - m_i \) d_i f . $

These are orthogonal projections in $L^2 \( nu \)$, and

$ nu \[ \( sans(D)_i f \)^2 \] = nu \[ v_i \( d_i f \)^2 \] \, #h(2em) - L_nu = sum_i sans(D)_i \, $

where $L_nu$ is the heat-bath generator with rate one at every site.

The signed two-spin estimate below follows the gap method of Wang #cite(label("Wang2026")) Theorem 1.2 and Lemma 3.4. Keeping the sign of the leading interaction term allows the later summation to use an operator norm. We give the algebra and the remainder estimate that make this summation uniform in the external fields and the interaction scale.

#thm([Lemma 11.3.])[
  (Uniform two-spin inequality).  #emph[There are absolute constants $t_0 > 0$ and $C_0 < oo$ with the following property. For any finite-field Ising law $nu$, any distinct $i \, j$ with $t = tanh A_(i j)$ satisfying $\| t \| lt.eq t_0$, and any real function $f$, 
#[#set math.equation(numbering: n => "(11.3)")
 $ nu \[ sans(D)_i f sans(D)_j f \] & gt.eq - nu #scale(x: 120%, y: 120%)[\[] \( t + 2 t^2 m_i m_j \) v_i v_j d_i f d_j f #scale(x: 120%, y: 120%)[\]]\
 & #h(1cm)  - C_0 \| t \|^3 nu #scale(x: 120%, y: 120%)[\[] \( sans(D)_i f \)^2 + \( sans(D)_j f \)^2 #scale(x: 120%, y: 120%)[\]] . $ <rcut:eq:two-spin>]

 The constants are independent of all external fields and of the dimension. For example, $t_0 = 1 \/ 100$ and $C_0 = 22000$ are valid.]
] <rcut:lem:two-spin>

#proof[
  The proof has three steps: factor out the two conditional variances, identify the nonnegative part of the expansion, and absorb the cubic remainder into the one-site energies. Condition on all spins outside $i \, j$, and denote the remaining spins by $x \, y$. Their probabilities are
  $ frac(\( 1 + a x \) \( 1 + b y \) \( 1 + t x y \), 4 \( 1 + a b t \)) \, #h(2em) \| a \| \, \| b \| < 1 \, $
  where $a \, b$ are the hyperbolic tangents of the external fields left after conditioning. Set $Z_0 = 1 + a b t$. The corresponding conditional means and variances take the form
  $ m_i \( y \) = frac(a + t y, 1 + a t y) \, #h(2em) v_i \( y \) = frac(\( 1 - a^2 \) \( 1 - t^2 \), \( 1 + a t y \)^2) \, $
  and the analogous expressions with $a \, x$ and $b \, y$ interchanged. There are real numbers $p \, q \, r$ such that
  $ d_i f = p + r \( y - b \) \, #h(2em) d_j f = q + r \( x - a \) . $
  Indeed, expand the restriction of $f$ in the basis $1 \, x \, y \, x y$ and denote the coefficient of $x y$ by $r$. This isolates the common second-difference coefficient from the two first differences.
  Let $bb(E)_0$ denote uniform expectation over the four pairs $\( x \, y \)$. We now combine the mixed projection energy with the correction term in the claimed inequality. The identities
  $ x - m_i \( y \) = frac(\( x - a \) \( 1 - t x y \), 1 + a t y) \, #h(2em) \( 1 + a x \) \( x - a \) = x \( 1 - a^2 \) $
  and their counterparts for $y$ give the exact factorization
  $ & nu \[ sans(D)_i f sans(D)_j f divides X_(- { i \, j }) \] + nu \[ \( t + 2 t^2 m_i m_j \) v_i v_j d_i f d_j f divides X_(- { i \, j }) \] = P_0 Q \,\
 & P_0 = frac(\( 1 - a^2 \) \( 1 - b^2 \) \( 1 - t^2 \), Z_0) \, #h(2em) Q = bb(E)_0 #scale(x: 120%, y: 120%)[\(] \[ p + r \( y - b \) \] \[ q + r \( x - a \) \] C \( t \; x \, y \) #scale(x: 120%, y: 120%)[\)] \, $
  where
  $ C \( t \; x \, y \) =  & frac(x y - t, \( 1 + a t y \) \( 1 + b t x \))\
 & + \( t + 2 t^2 m_i \( y \) m_j \( x \) \) frac(\( 1 - t^2 \) \( 1 + a x \) \( 1 + b y \) \( 1 + t x y \), \( 1 + a t y \)^2 \( 1 + b t x \)^2) . $
  Only the expansion through second order will contribute to the leading term. Expanding at $t = 0$ and reducing by $x^2 = y^2 = 1$ gives
  #[#set math.equation(numbering: n => "(11.4)")
   $ C \( t \; x \, y \) = x y [1 + a b t + \( 1 - a^2 - b^2 + 2 a^2 b^2 \) t^2] + R \( t \; x \, y \) . $ <rcut:eq:two-spin-expansion>]
  The cancellation can be checked directly: before collecting terms, the coefficient of $t^2$ is
  $ d + x y \( d^2 - a b x y \) + \( 1 + a x \) \( 1 + b y \) \( x y - 2 d + 2 a b \) \, #h(2em) d = a y + b x . $
  Collecting terms gives the coefficient in Equation (11.4), with the coefficients of $1 \, x \, y$ cancelling. Thus the displayed expansion contributes through the following single identity:
  $ bb(E)_0 #scale(x: 120%, y: 120%)[\(] x y \[ p + r \( y - b \) \] \[ q + r \( x - a \) \] #scale(x: 120%, y: 120%)[\)] = r^2 . $
  It remains to control the remainder without excluding nearly deterministic spins; we therefore allow the limiting values $\| a \| = \| b \| = 1$ in this estimate. On the complex disk $\| t \| lt.eq 1 \/ 2$, the denominators $1 + a t y$ and $1 + b t x$ have modulus at least $1 \/ 2$, while $\| m_i \( y \) \| \, \| m_j \( x \) \| lt.eq 3$. The first term of $C$ is bounded in modulus by $6$. In the second term, $t + 2 t^2 m_i m_j$ is bounded by $5$; including its remaining factors gives a bound of $600$. Hence $\| C \( t \; x \, y \) \| lt.eq 606$ throughout the disk, and Cauchy’s coefficient estimate yields
  $ \| R \( t \; x \, y \) \| lt.eq 606 sum_(k gt.eq 3) \( 2 \| t \| \)^k lt.eq 9696 \| t \|^3 \, #h(2em) \| t \| lt.eq 1 \/ 4 . $
  Since
  $ \| \[ p + r \( y - b \) \] \[ q + r \( x - a \) \] \| lt.eq p^2 + q^2 + 8 r^2 $
  and $1 - a^2 - b^2 + 2 a^2 b^2 = a^2 b^2 + \( 1 - a^2 \) \( 1 - b^2 \) gt.eq 0$, we obtain
  $ Q gt.eq #scale(x: 120%, y: 120%)[\(] 1 - \| t \| - 8 dot.op 9696 \| t \|^3 #scale(x: 120%, y: 120%)[\)] r^2 - 9696 \| t \|^3 \( p^2 + q^2 \) . $
  For $\| t \| lt.eq 1 \/ 100$, the coefficient of $r^2$ exceeds $1 \/ 2$.
  The leading term is now nonnegative. To finish, the negative cubic term must be charged to the conditional energies while retaining the variance factors. Write $A_0 = 1 - a^2$ and $B_0 = 1 - b^2$. Summing over $x$ first gives the exact energy formula
  $ nu \[ v_i \( d_i f \)^2 divides X_(- { i \, j }) \] = frac(A_0 \( 1 - t^2 \), 2 Z_0) sum_(y = plus.minus 1) frac(1 + b y, 1 + a t y) \[ p + r \( y - b \) \]^2 . $
  For $\| t \| lt.eq 1 \/ 4$, the denominators lie between $3 \/ 4$ and $5 \/ 4$, so
  $ nu \[ v_i \( d_i f \)^2 divides X_(- { i \, j }) \] & gt.eq 3 / 5 A_0 \( p^2 + B_0 r^2 \) \,\
nu \[ v_j \( d_j f \)^2 divides X_(- { i \, j }) \] & gt.eq 3 / 5 B_0 \( q^2 + A_0 r^2 \) \, #h(2em) P_0 lt.eq 4 / 3 A_0 B_0 . $
  These bounds make $P_0 p^2$ and $P_0 q^2$ at most $20 \/ 9$ times their respective conditional energies. Multiply the estimate for $Q$ by $P_0$ and use $9696 dot.op 20 \/ 9 < 22000$ to obtain the conditional inequality. Averaging over the spins on which we conditioned gives Equation (11.3). The estimates are homogeneous in $p \, q \, r$, and throughout the argument neither these coefficients nor the external fields were bounded. ◻
]

#thm([Proposition 11.4.])[
  (Gap and covariance under scaled interactions and fields).  #emph[For all sufficiently large $n$, uniformly over $J in cal(E)_n$, $s in \[ 0 \, 1 \]$, and $theta in bb(R)^n$, let 
$ nu_(s \, theta) \( x \) prop exp (s / 2 x^(sans(T)) J x + theta dot.op x) . $

 Its rate-one-per-site heat-bath generator has spectral gap at least 
$ kappa_beta = frac(1 - 2 beta, 2) > 0 . $

 Moreover, 
#[#set math.equation(numbering: n => "(11.5)")
 $ "Var"_(nu_(s \, theta)) \( f \) lt.eq kappa_beta^(- 1) sum_i nu_(s \, theta) \[ v_i \( d_i f \)^2 \] \, #h(2em) parallel "Cov"_(nu_(s \, theta)) \( X \) parallel lt.eq kappa_beta^(- 1) . $ <rcut:eq:uniform-gap-covariance>]

]
] <rcut:prop:uniform-gap>

#proof[
  We use the pair estimate to compare the squared generator with its Dirichlet form. Fix $nu = nu_(s \, theta)$ and define the zero-diagonal matrix by $T_(i j) = tanh \( s J_(i j) \)$. On $cal(E)_n$, all entries are small enough for Lemma 75 to apply simultaneously. At each configuration put $z_i = v_i d_i f$ and $z'_i = m_i z_i$. Summation over ordered pairs gives
  $ ∥sum_i sans(D)_i f∥_(L^2 \( nu \))^2 gt.eq  & sum_i parallel sans(D)_i f parallel_(L^2 \( nu \))^2 - nu \[ z^(sans(T)) T z + 2 \( z' \)^(sans(T)) \( T compose T \) z' \]\
 & - 2 C_0 (max_i sum_j \| T_(i j) \|^3) sum_i parallel sans(D)_i f parallel_(L^2 \( nu \))^2 \, $
  where $compose$ denotes entrywise multiplication. The field-dependent factors remain inside the vectors, so the interaction matrices can be bounded by their operator norms. With $M = max \( parallel T parallel \, 2 parallel T compose T parallel \)$, the sum of the two quadratic forms is at most
  $ M sum_i v_i^2 \( 1 + m_i^2 \) \( d_i f \)^2 lt.eq M sum_i v_i \( d_i f \)^2 \, $
  because $v_i^2 \( 1 + m_i^2 \) = v_i \( 1 - m_i^4 \) lt.eq v_i$.
  We next control these operator norms using only the disorder event. The Taylor estimate $\| tanh u - u \| lt.eq C \| u \|^3$, together with the maximum absolute row-sum bound for symmetric matrices, gives
  $ parallel T - s J parallel lt.eq C max_i sum_j \| J_(i j) \|^3 = o \( 1 \) . $
  Also $parallel T compose T parallel lt.eq max_i sum_j T_(i j)^2 lt.eq beta^2 + o \( 1 \)$. The error bounds depend only on the deterministic tolerances defining the event; they are uniform over $s \, theta$ and $J in cal(E)_n$. The fixed assumption $beta < 1 \/ 2$ therefore gives
  $ M lt.eq max \( 2 beta \, 2 beta^2 \) + o \( 1 \) = 2 beta + o \( 1 \) . $
  Thus, for $A = - L_nu = sum_i sans(D)_i$ and all sufficiently large $n$,
  $ parallel A f parallel_2^2 gt.eq kappa_beta chevron.l f \, A f chevron.r_nu . $
  To read this as a spectral gap, use that $A$ is self-adjoint and nonnegative. Every one-site conditional law has full support, so $sans(D)_i f = 0$ for all $i$ forces $f$ to be constant along every edge of the cube. Thus the kernel consists exactly of constants. Applied to a nonconstant eigenfunction, the last inequality bounds its eigenvalue below by $kappa_beta$. This proves the gap and variance assertions. The covariance conclusion is the linear-function case $f \( x \) = c^(sans(T)) x$:
  $ c^(sans(T)) "Cov"_nu \( X \) c lt.eq kappa_beta^(- 1) sum_i nu \[ v_i \] c_i^2 lt.eq kappa_beta^(- 1) parallel c parallel^2 . $
  ◻
]

=== 11.3 Entropy through Gaussian observations <entropy-through-gaussian-observations>

We now turn the uniform covariance estimate into entropy dissipation. For a probability measure $nu$ and a positive function $f$, the homogeneous entropy functional is

$ "Ent"_nu \( f \) = nu \[ f log f \] - nu \[ f \] log nu \[ f \] . $

The convention $0 log 0 = 0$ extends it to nonnegative functions. Proposition 77 imposes no normalization on $f$. The proof uses the Gaussian observation entropy factorization principle of Chen and Eldan #cite(label("CE2025")) Theorem 49 in arXiv:2203.04163v2. We include the argument to keep the interaction scaling and the rate-one-per-site clock explicit.

#thm([Proposition 11.5.])[
  (Entropy inequality and reduction from point starts).  #emph[There are constants $C_1 \, C_2 < oo$, depending only on the fixed $beta < 1 \/ 2$, such that for all sufficiently large $n$ and $J in cal(E)_n$, the zero-field Gibbs measure satisfies 
#[#set math.equation(numbering: n => "(11.6)")
 $ "Ent"_mu \( f \) lt.eq C_1 mu #scale(x: 120%, y: 120%)[\[] f \( - L \) log f #scale(x: 120%, y: 120%)[\]] \, #h(2em) f > 0 . $ <rcut:eq:entropy-inequality>]

 For every initial point $x$ and every $t gt.eq 0$, if $rho_(t \, x) = S_t \( x \, dot.op \)$, then 
#[#set math.equation(numbering: n => "(11.7)")
 $ "Ent"_mu (frac(d rho_(t \, x), d mu)) lt.eq C_2 n e^(- t \/ C_1) . $ <rcut:eq:entropy-decay>]

 In particular, the continuous-time worst-start mixing time at every fixed positive accuracy is $O_beta \( log n \)$, uniformly on these events.]
] <rcut:prop:entropy>

#proof[
  We interpolate from the Gibbs measure to product posteriors, compare their expected entropy with the initial entropy, and then remove the observation from the one-site terms. For large $n$, Equation (11.2) ensures $parallel J parallel < 1$. Choose $K = J + 2 I$; then $K$ is positive definite and satisfies $parallel K parallel < 3$. Keep it fixed throughout the argument for the realized disorder. Given $X tilde.op mu$ and an independent standard Gaussian vector $z$, use the observation, for $0 < u lt.eq 1$,
  $ Y_u = u K^(1 \/ 2) X + sqrt(u) thin z . $
  The posterior law $nu_(u \, y) = "Law" \( X divides Y_u = y \)$ is
  #[#set math.equation(numbering: n => "(11.8)")
   $ nu_(u \, y) \( x \) prop mu \( x \) exp (y^(sans(T)) K^(1 \/ 2) x - u / 2 x^(sans(T)) K x) . $ <rcut:eq:gaussian-posterior>]
  Discarding the diagonal term, which is constant on the cube, leaves interaction matrix $\( 1 - u \) J$. The observation creates an external field, and a further linear tilt changes only that field. Thus both uniformities in Proposition 76 apply: every posterior and every such tilt has covariance norm at most $C = kappa_beta^(- 1)$. At $u = 1$, the interaction vanishes and the posterior is a product measure.
  #emph[Derivative of the expected posterior entropy.] To quantify the entropy lost to the observation, set $H \( u \) = bb(E) \[ "Ent"_(nu_(u \, Y_u)) \( f \) \]$. The derivative identity we need is
  #[#set math.equation(numbering: n => "(11.9)")
   $ H' \( u \) = - 1 / 2 bb(E) [frac(parallel K^(1 \/ 2) "Cov"_(nu_(u \, Y_u)) \( X \, f \) parallel^2, nu_(u \, Y_u) \[ f \])] . $ <rcut:eq:posterior-entropy-derivative>]
  The covariance with $f$ here is a vector. We verify the identity using the finite Gaussian mixture defining the observation. Let $phi.alt_u$ be the centered Gaussian density with covariance $u I$, and define
  $ q \( u \, y \) & = sum_x mu \( x \) e^(y^(sans(T)) K^(1 \/ 2) x - u x^(sans(T)) K x \/ 2) \,\
p \( u \, y \) & = sum_x mu \( x \) f \( x \) e^(y^(sans(T)) K^(1 \/ 2) x - u x^(sans(T)) K x \/ 2) . $
  These functions give the density of $Y_u$ as $q phi.alt_u$ and the posterior expectation as $p \/ q = nu_(u \, y) \[ f \]$. Their finite exponential sums show directly that both $p$ and $q$ solve the backward heat equation:
  $ \( partial_u + 1 / 2 Delta_y \) p = 0 \, #h(2em) \( partial_u + 1 / 2 Delta_y \) q = 0 . $
  Writing $r = p \/ q$, the chain rule gives the exact identity
  $ \( partial_u + 1 / 2 Delta_y \) #scale(x: 120%, y: 120%)[\(] p log \( p \/ q \) #scale(x: 120%, y: 120%)[\)] = 1 / 2 frac(q parallel nabla_y r parallel^2, r) . $
  Since $partial_u phi.alt_u = 1 / 2 Delta_y phi.alt_u$, differentiation and integration by parts yield
  $ frac(d, d u) integral p log \( p \/ q \) thin phi.alt_u thin d y = 1 / 2 integral frac(q parallel nabla_y r parallel^2, r) phi.alt_u thin d y . $
  Differentiation and integration by parts are legitimate: the spin sums are finite, $f$ is bounded above and below by positive constants, and the remaining dependence on $y$ grows at most exponentially in $parallel y parallel$. Gaussian tails therefore control all terms. To identify the derivative as the claimed covariance expression, use
  $ H \( u \) = mu \[ f log f \] - integral p log \( p \/ q \) phi.alt_u thin d y \, #h(2em) nabla_y r = K^(1 \/ 2) "Cov"_(nu_(u \, y)) \( X \, f \) \, $
  which proves Equation (11.9). At the initial endpoint $u arrow.b 0$, the observations tend to zero in probability and the posterior tends to $mu$. Since the entropy functional is bounded on this finite space, $H \( u \) arrow.r "Ent"_mu \( f \)$, giving the initial value for the comparison.
  #emph[Covariance controlled by entropy.] We next bound the derivative by the expected entropy itself. Let $nu$ be any posterior, take a unit vector $a$, and set $Z = a^(sans(T)) \( X - nu \[ X \] \)$. The second derivative of the log moment-generating function of $Z$ is the variance of $a^(sans(T)) X$ under a linear tilt of $nu$. Applying the uniform covariance estimate to these tilts and integrating twice gives
  $ log nu \[ e^(lambda Z) \] lt.eq C / 2 lambda^2 \, #h(2em) lambda in bb(R) . $
  The change of measure $hat(nu) = f nu \/ nu \[ f \]$ connects this exponential-moment bound to entropy. Apply Jensen’s inequality to the logarithm under $hat(nu)$ to obtain
  $ lambda hat(nu) \[ Z \] lt.eq frac("Ent"_nu \( f \), nu \[ f \]) + log nu \[ e^(lambda Z) \] lt.eq frac("Ent"_nu \( f \), nu \[ f \]) + C / 2 lambda^2 . $
  Optimize in $lambda$ and take $a$ parallel to $"Cov"_nu \( X \, f \)$ when this vector is nonzero. This yields
  #[#set math.equation(numbering: n => "(11.10)")
   $ parallel "Cov"_nu \( X \, f \) parallel^2 lt.eq 2 C nu \[ f \] "Ent"_nu \( f \) . $ <rcut:eq:covariance-entropy>]
  Equations (11.9) and (11.10) imply $H' \( u \) gt.eq - C parallel K parallel H \( u \)$. Integrating from zero to one gives
  #[#set math.equation(numbering: n => "(11.11)")
   $ "Ent"_mu \( f \) lt.eq e^(C parallel K parallel) H \( 1 \) lt.eq e^(3 C) H \( 1 \) . $ <rcut:eq:posterior-entropy-comparison>]
  We have now compared the initial entropy with the entropy at the product endpoint. The comparison used covariance control at every interaction scale: controlling linear tilts only at the original interaction $J$ would leave the quadratic change in Equation (11.8) untreated. It remains to express the endpoint entropy in terms of the original one-site energies.
  #emph[Removing the observation at the product endpoint.] For a product probability measure $pi = ⨂_i pi_i$, entropy tensorizes:
  $ "Ent"_pi \( f \) lt.eq sum_i pi \[ "Ent"_(pi_i) \( f \) \] \, $
  where in the $i$th summand the other coordinates are fixed inside the one-coordinate entropy. To prove tensorization, separate one coordinate using the entropy chain rule and apply induction to the remaining product. For a fixed base measure, $f mapsto "Ent" \( f \)$ is convex; hence averaging the separated coordinate can only decrease the remaining one-coordinate entropies. The required convexity follows from joint convexity of $\( a \, b \) mapsto a log \( a \/ b \)$ with $a = f \( x \)$ and $b = pi \[ f \]$.
  Apply tensorization to the product posterior at $u = 1$. We must then average under the joint law of $\( X \, Y_1 \)$, retaining the dependence between the observation and the spins. For this step put $F = f \( X \)$, $phi \( z \) = z log z$,
  $ cal(G)_i = sigma \( X_(- i) \) \, #h(2em) cal(H)_i = sigma \( X_(- i) \, Y_1 \) \, #h(2em) e_(cal(A)) \( F \) = bb(E) \[ phi \( F \) divides cal(A) \] - phi \( bb(E) \[ F divides cal(A) \] \) . $
  Conditional Jensen and the tower property give
  $ bb(E) \[ e_(cal(H)_i) \( F \) divides cal(G)_i \] & = bb(E) \[ phi \( F \) divides cal(G)_i \] - bb(E) \[ phi \( bb(E) \[ F divides cal(H)_i \] \) divides cal(G)_i \]\
 & lt.eq bb(E) \[ phi \( F \) divides cal(G)_i \] - phi \( bb(E) \[ F divides cal(G)_i \] \) = e_(cal(G)_i) \( F \) . $
  Thus the additional conditioning on the observation decreases the averaged conditional entropy, even though the observation and the complementary spins are dependent. Combining this fact with the posterior tensorization gives
  $ H \( 1 \) lt.eq sum_i bb(E) e_(cal(H)_i) \( F \) lt.eq sum_i bb(E) e_(cal(G)_i) \( F \) = sum_i mu #scale(x: 120%, y: 120%)[\[] "Ent"_(mu \( dot.op divides X_(- i) \)) \( f \) #scale(x: 120%, y: 120%)[\]] . $
  We can now compare each original one-coordinate entropy with the corresponding heat-bath energy. Concavity of the logarithm gives
  $ "Ent" \( f \) lt.eq "Cov" \( f \, log f \) \, $
  because the difference of the right and left sides is $bb(E) f thin \[ log bb(E) f - bb(E) log f \] gt.eq 0$. Moreover, summing these conditional covariances gives
  $ sum_i mu \[ "Cov" \( f \, log f divides X_(- i) \) \] = sum_i mu \[ f sans(D)_i log f \] = mu \[ f \( - L \) log f \] . $
  The product-endpoint estimate is therefore bounded by the entropy dissipation of the original generator. Substituting into Equation (11.11) proves Equation (11.6), with the permissible choice $C_1 = e^(3 \/ kappa_beta)$.
  #emph[Entropy decay and mixing.] For a point start, it remains to bound the initial relative entropy $log \( 1 \/ mu \( x \) \)$ uniformly in the starting point. The identity $parallel x parallel^2 = n$ gives
  $ lr(|1 / 2 x^(sans(T)) J x|) lt.eq n / 2 parallel J parallel \, #h(2em) log frac(1, mu \( x \)) lt.eq n \( log 2 + parallel J parallel \) lt.eq n \( log 2 + 1 \) . $
  Reversibility lets us evolve the density $f_t = d rho_(t \, x) \/ d mu$ using the same semigroup $S_t$. For $t > 0$ the density is strictly positive, so the entropy inequality applies to its derivative:
  $ frac(d, d t) "Ent"_mu \( f_t \) = - mu \[ f_t \( - L \) log f_t \] lt.eq - C_1^(- 1) "Ent"_mu \( f_t \) . $
  Integrating this differential inequality and using continuity at zero establishes Equation (11.7), with $C_2 = log 2 + 1$.
  To finish, coarsen the measure to an event and its complement; relative entropy then dominates the resulting binary relative entropy. For fixed $q in \( 0 \, 1 \)$, this binary entropy, viewed as a function of $p$, has value and derivative zero at $p = q$ and second derivative $1 \/ \[ p \( 1 - p \) \] gt.eq 4$. It is consequently at least $2 \( p - q \)^2$. Choosing an event that attains total variation and using the entropy decay just proved yields
  $ d_c \( t \) lt.eq sqrt(frac(C_2 n, 2)) thin e^(- t \/ \( 2 C_1 \)) \, $
  which proves the stated mixing upper bound. ◻
]

== 12 Dissipation of the unweighted gradient <rcut:sec:gradient>

The next step is a pointwise dissipation bound for the unweighted gradient $U$, with a fixed contraction rate outside a set of exponentially small Gibbs mass. We first perform the deterministic calculation: completing squares removes the second differences and leaves a quadratic form in the first differences. The error estimate retains the variance factors needed when local fields are large. We then apply the probability bounds proved in Sections 13 and 14 to identify the exceptional set.

Two row sums will control, respectively, the quadratic terms and the cubic error. For a symmetric matrix $J$ with zero diagonal, define

$ R_2 \( J \) = max_i sum_j J_(i j)^2 \, #h(2em) R_3 \( J \) = max_i sum_j \| J_(i j) \|^3 . $

We begin at the all-positive configuration $upright(bold(1))$. In the quadratic form below all local quantities are evaluated there: $h_i = \( J upright(bold(1)) \)_i$, $m_i = tanh h_i$, $v_i = 1 - m_i^2$, and $w_i = 1 - m_i$. Define

#[#set math.equation(numbering: n => "(12.1)")
 $ M_J \( p \) =  & sum_(i eq.not j) J_(i j) p_i v_j p_j + 2 sum_(i eq.not j) J_(i j)^2 p_i m_j v_j p_j\
 & + sum_(i < j) frac(J_(i j)^2 \( v_j p_i + v_i p_j \)^2, w_i + w_j) \, #h(2em) p in bb(R)^n . $ <rcut:eq:gradient-form>]

For a finite matrix $J$, every denominator is positive. The estimates below remain uniform as any local field tends to infinity, including when these denominators approach zero.

To transfer the calculation to an arbitrary configuration $x$, use the sign change

$ J^x = "diag" \( x \) J "diag" \( x \) \, #h(2em) f^x \( y \) = f \( x_1 y_1 \, dots.h \, x_n y_n \) \, #h(2em) p_i^x = x_i d_i f \( x \) . $

This sign change conjugates the generator for $J$ to the generator for $J^x$. It also gives $d_i f^x \( upright(bold(1)) \) = p_i^x$ and $U \( f^x \) \( upright(bold(1)) \) = U \( f \) \( x \)$, while preserving the matrix controls: $parallel J^x parallel = parallel J parallel$, $R_k \( J^x \) = R_k \( J \)$ for $k = 2 \, 3$. The calculation at $upright(bold(1))$ therefore suffices for every configuration.

#thm([Lemma 12.1.])[
  (Pointwise gradient calculation).  #emph[Let $f_t = S_t f_0$ for the heat-bath generator with a symmetric zero-diagonal interaction matrix $J$. At $upright(bold(1))$, write $p_i = d_i f_t$, $r_(i j) = d_i d_j f_t$, and $a_(i j) = d_i m_j$. Then 
#[#set math.equation(numbering: n => "(12.2)")
 $ 1 / 2 \( partial_t - L \) U \( f_t \) = - parallel p parallel^2 + sum_(i eq.not j) p_i a_(i j) \( p_j - 2 r_(i j) \) - sum_(i eq.not j) w_j r_(i j)^2 . $ <rcut:eq:gradient-identity>]

 If $max_(i \, j) \| J_(i j) \| lt.eq 1 \/ 10$, then, at every configuration $x$, 
#[#set math.equation(numbering: n => "(12.3)")
 $ 1 / 2 \( partial_t - L \) U \( f_t \) \( x \) lt.eq - U \( f_t \) \( x \) + M_(J^x) \( p^x \) + 16 R_3 \( J \) U \( f_t \) \( x \) . $ <rcut:eq:gradient-local-bound>]

 The constants do not depend on the local fields, on $f_0$, or on $t$.]
] <rcut:lem:gradient-algebra>

#proof[
  We first derive the exact evolution identity, then estimate the field differences before completing the squares. The half-difference $d_i f$ does not depend on spin $i$. At the all-positive point, the product rule reads
  $ d_i \( a b \) = a thin d_i b + b \( x^(i \, -) \) thin d_i a . $
  For $j eq.not i$, the first difference after a flip is $d_j f \( x^(i \, -) \) = p_j - 2 r_(i j)$. The contribution with $j = i$ to $d_i L f$ is $- p_i$: both $m_i$ and $p_i$ are independent of spin $i$. Separating this term gives
  $ d_i L f = L \( d_i f \) - p_i + sum_(j eq.not i) a_(i j) \( p_j - 2 r_(i j) \) . $
  Apply the square identity $L \( g^2 \) - 2 g L g = 2 Gamma \( g \)$ with $g = d_i f$. The equality $Gamma \( d_i f \) = sum_(j eq.not i) w_j r_(i j)^2$ then identifies the second-difference energy, proving Equation (12.2).
  To use the identity uniformly in the local fields, we must keep the conditional variance in the estimate for $a_(i j)$. Set $z = J_(i j)$ and $m = m_j \( upright(bold(1)) \)$. Flipping spin $i$ changes the $j$-field by $- 2 z$. The hyperbolic-tangent subtraction formula therefore gives
  #[#set math.equation(numbering: n => "(12.4)")
   $ a_(i j) = v_j q \( z \, m \) \, #h(2em) q \( z \, m \) = frac(tanh \( 2 z \), 2 \( 1 - m tanh \( 2 z \) \)) . $ <rcut:eq:gradient-field-difference>]
  For real arguments with $\| z \| lt.eq 1 \/ 10$ and $\| m \| lt.eq 1$, the factor $1 - m tanh \( 2 z \)$ is bounded below by $4 \/ 5$. The bound is uniform as $m$ approaches either endpoint of $\[ - 1 \, 1 \]$, so the variance factor can be retained without a field cutoff.
  To track the constants in the cubic remainder, write $T = tanh \( 2 z \)$ and expand the denominator exactly:
  $ q \( z \, m \) = T / 2 + frac(m T^2, 2) + frac(m^2 T^3, 2 \( 1 - m T \)) . $
  The inequalities $\| T \| lt.eq 2 \| z \|$ and $\| tanh u - u \| lt.eq \| u \|^3 \/ 3$ imply
  #[#set math.equation(numbering: n => "(12.5)")
   $ \| q \( z \, m \) - z - 2 m z^2 \| & lt.eq 7 \| z \|^3 \,\
\| q \( z \, m \) - z \| & lt.eq 27 / 10 z^2 \, #h(2em) \| q \( z \, m \) \| lt.eq 5 / 4 \| z \| . $ <rcut:eq:gradient-q-bounds>]
  For the first estimate, the three terms of this decomposition contribute errors bounded by $\( 4 \/ 3 \) \| z \|^3$, $\( 16 \/ 3 \) \| z \|^4$, and $5 \| z \|^3$, respectively. Their sum is less than $7 \| z \|^3$. The second estimate is a consequence of the first, while the last is immediate from Equation (12.4). The hyperbolic-tangent inequality follows by integrating $1 - \( tanh u \)' = tanh^2 u lt.eq u^2$. Returning to the field difference gives
  $ a_(i j) = J_(i j) v_j + 2 J_(i j)^2 m_j v_j + e_(i j) \, #h(2em) \| e_(i j) \| lt.eq 7 \| J_(i j) \|^3 v_j \, $
  with the variance factor retained in the remainder.
  We can now eliminate the second differences. Since $r_(i j) = r_(j i)$, the terms for one unordered pair in Equation (12.2) combine as
  $ - 2 \( a_(i j) p_i + a_(j i) p_j \) r_(i j) - \( w_i + w_j \) r_(i j)^2 . $
  Completing the square bounds this expression by $\( a_(i j) p_i + a_(j i) p_j \)^2 \/ \( w_i + w_j \)$. We compare its numerator with the leading interaction term. For the same pair, write
  $ A = a_(i j) p_i + a_(j i) p_j \, quad B = J_(i j) \( v_j p_i + v_i p_j \) \, quad S = v_j \| p_i \| + v_i \| p_j \| . $
  Equation (12.5) gives
  $ \| A - B \| lt.eq 27 / 10 \| J_(i j) \|^2 S \, #h(2em) \| A \| + \| B \| lt.eq 9 / 4 \| J_(i j) \| S . $
  Hence $\| A^2 - B^2 \| lt.eq 7 \| J_(i j) \|^3 S^2$. The remaining issue is the denominator: it can be small at a nearly saturated field. Weighted Cauchy–Schwarz keeps the variance factors attached to the corresponding weights and gives
  #[#set math.equation(numbering: n => "(12.6)")
   $ frac(S^2, w_i + w_j) lt.eq v_j^2 / w_j p_i^2 + v_i^2 / w_i p_j^2 \, #h(2em) v_i^2 / w_i = \( 1 - m_i \) \( 1 + m_i \)^2 lt.eq 32 / 27 . $ <rcut:eq:gradient-denominator-control>]
  This estimate also describes the limiting fields. As $m_j arrow.t 1$, the contribution is at most $4 \( 1 - m_j \) p_i^2$; as $m_j arrow.b - 1$, it is at most $2 \( 1 + m_j \)^2 p_i^2$. Both bounds hold without comparing the coupling size with the distance from saturation.
  Only the accumulated replacement errors remain. Replacing $sum_(i eq.not j) p_i a_(i j) p_j$ by the first two terms of $M_J \( p \)$ costs at most
  $ 7 sum_(i eq.not j) \| J_(i j) \|^3 \| p_i \| \| p_j \| lt.eq 7 R_3 \( J \) parallel p parallel^2 . $
  The last inequality uses symmetry and $2 \| p_i \| \| p_j \| lt.eq p_i^2 + p_j^2$. For the completed squares, Equation (12.6) bounds the total replacement error by
  $ 224 / 27 sum_(i < j) \| J_(i j) \|^3 \( p_i^2 + p_j^2 \) lt.eq 224 / 27 R_3 \( J \) parallel p parallel^2 . $
  Adding the two errors and using $7 + 224 \/ 27 < 16$ proves Equation (12.3) at $upright(bold(1))$. Sign conjugation then gives the asserted inequality at every $x$. ◻
]

The local calculation reduces dissipation to an upper bound on the quadratic form. We first give a bound valid at every configuration; it will also control possible growth inside the exceptional set. For every symmetric zero-diagonal $J$ and every $p$,

#[#set math.equation(numbering: n => "(12.7)")
 $ M_J \( p \) lt.eq [parallel J parallel + (frac(4, 3 sqrt(3)) + 32 / 27) R_2 \( J \)] parallel p parallel^2 . $ <rcut:eq:rough-gradient>]

To see this, treat the three terms in Equation (12.1) separately. The first is bounded by $parallel J parallel parallel p parallel^2$ because $0 lt.eq v_i lt.eq 1$. For the second, the symmetric matrix $J compose J$, with entries $J_(i j)^2$, has norm at most $R_2 \( J \)$; combine this with $max_(\| m \| lt.eq 1) \| m \( 1 - m^2 \) \| = 2 \/ \( 3 sqrt(3) \)$. For the final term, the weighted Cauchy–Schwarz estimate in Equation (12.6) gives $\( 32 \/ 27 \) R_2 \( J \) parallel p parallel^2$. This proves Equation (12.7) uniformly in the local fields.

#thm([Proposition 12.2.])[
  (Typical-state gradient dissipation).  #emph[Fix $0 lt.eq beta < 1 \/ 2$. There are constants $c > 0$ and $C < oo$, and events of disorder probability tending to one, on which a set $cal(B)_J subset.eq { - 1 \, 1 }^n$ satisfies 
$ mu_J \( cal(B)_J \) lt.eq e^(- c n) $

 and, for every $f_0$, every $t gt.eq 0$, and every configuration $x$, 
#[#set math.equation(numbering: n => "(12.8)")
 $ \( partial_t - L \) U \( S_t f_0 \) \( x \) lt.eq \[ - c + C upright(bold(1))_(cal(B)_J) \( x \) \] thin U \( S_t f_0 \) \( x \) . $ <rcut:eq:gradient-potential>]

 The constants depend only on the fixed $beta$. If $0 lt.eq beta lt.eq 7 \/ 20$, the exceptional set can be empty.]
] <rcut:prop:typical-gradient>

#proof[
  We now combine the deterministic calculation with the disorder estimates. For the smaller temperatures, the rough bound already contracts at every configuration. For the remaining temperatures, the planted comparison will provide contraction outside a small Gibbs set. Begin on the events of Proposition 74, where the deterministic tolerances give
  $ parallel J parallel lt.eq 2 beta + o \( 1 \) \, #h(2em) R_2 \( J \) lt.eq beta^2 + o \( 1 \) \,\
R_3 \( J \) lt.eq max_(i \, j) \| J_(i j) \| thin R_2 \( J \) = o \( 1 \) . $
  Sign conjugation preserves each bound, so they hold for every $J^x$. The remainder in Lemma 78 consequently tends to zero uniformly over configurations, test functions, and times.
  If $beta lt.eq 7 \/ 20$, it suffices to substitute the disorder estimates into Equation (12.7). Its coefficient is at most
  $ 2 beta + (frac(4, 3 sqrt(3)) + 32 / 27) beta^2 + o \( 1 \) < 189 / 200 + o \( 1 \) < 1 . $
  The rational bound follows from $4 \/ \( 3 sqrt(3) \) + 32 \/ 27 < 2$ at $beta = 7 \/ 20$, since both terms increase with nonnegative $beta$. There is therefore a fixed margin below one. Absorbing the vanishing remainder in Lemma 78 proves Equation (12.8) with a fixed positive $c$ and $cal(B)_J = diameter$ for all sufficiently large $n$. The endpoint $beta = 0$ can also be read directly from Equation (12.2): $a_(i j) = 0$, $w_i = 1$, and $\( partial_t - L \) U lt.eq - 2 U$. This part of the proof therefore uses no nondegenerate Gaussian field law.
  For $7 \/ 20 < beta < 1 \/ 2$, we need a sharper estimate on most configurations. The inputs are proved in Sections 13 and 14, independently of Proposition 79. First, Proposition 84 bounds the normalized variational expression in Equation (13.5) by $0.9969$. Choose $delta = 0.0031$ and $rho = delta \/ 2$ to retain half this strict margin. Proposition 80 then gives $kappa > 0$ for which the event
  $ cal(A)_n = {J : sup_(parallel p parallel = 1) M_J \( p \) > 1 - rho} $
  has planted probability at most $e^(- kappa n)$ for all sufficiently large $n$. Under the planted law, the entries above the diagonal are independent with mean $beta^2 \/ n$ and variance $beta^2 \/ n$; Section 13 defines and analyzes this law. To translate the matrix event into a set of spin configurations, define
  #[#set math.equation(numbering: n => "(12.9)")
   $ cal(B)_J = { x : J^x in cal(A)_n } . $ <rcut:eq:gradient-bad-set>]
  Lemma 83 now yields $mu_J \( cal(B)_J \) lt.eq e^(- kappa n \/ 2)$ on events whose original disorder probability tends to one. Intersect these with the good disorder events used above. The supremum over all unit vectors in the definition ensures that the set in Equation (12.9) depends only on $J$, rather than on the evolving function.
  The Gibbs mass estimate is established. To obtain the pointwise dissipation bound, take $n$ large enough that $16 R_3 \( J \) lt.eq rho \/ 2$. For $x in.not cal(B)_J$, homogeneity of $M_(J^x)$ and Lemma 78 leave the fixed margin
  $ 1 / 2 \( partial_t - L \) U \( S_t f_0 \) \( x \) lt.eq - rho / 2 U \( S_t f_0 \) \( x \) . $
  At every configuration, including those in the exceptional set, Equation (12.7) and Lemma 78 give $\( partial_t - L \) U lt.eq K U$ for some nonnegative finite $K$ depending only on $beta$. For instance, the eventual estimates $parallel J parallel lt.eq 2$, $R_2 \( J \) lt.eq 1$, and $16 R_3 \( J \) lt.eq 1$ permit $K = 8$. Choose $c = min { rho \, kappa \/ 2 }$ and $C = K + c$ to combine the Gibbs mass and dissipation bounds on the same event. Since the local calculation applies to every function, this event and these constants work simultaneously for all $f_0$, $t$, and $x$. ◻
]

== 13 A planted Gaussian comparison <rcut:sec:comparison>

We seek a bound on the quadratic form in Equation (12.1) outside a set of configurations of exponentially small Gibbs mass. A bound of the form $M_(J^x) \( p \) < parallel p parallel_2^2$ need not hold for every $x$ and every nonzero $p$. We therefore first fix a configuration and weight the disorder by its unnormalized Gibbs weight. Under this planted law, a scalar variational estimate controls the form simultaneously on all unit vectors. The final step transfers the resulting exponential probability bound to Gibbs mass under the original disorder law.

=== 13.1 The planted law and the variational bound <the-planted-law-and-the-variational-bound>

Write $hat(bb(P))_n$ for the law under which the entries $J_(i j)$, $i < j$, are independent Gaussians with mean $beta^2 \/ n$ and variance $beta^2 \/ n$, with $J_(j i) = J_(i j)$ and $J_(i i) = 0$. Relative to the original disorder law $bb(P)_n$, its density is

#[#set math.equation(numbering: n => "(13.1)")
 $ frac(d hat(bb(P))_n, d bb(P)_n) \( J \) = exp {sum_(i < j) J_(i j) - frac(beta^2 \( n - 1 \), 4)} . $ <rcut:eq:comp-planted-density>]

The density is the unnormalized Gibbs weight of the all-positive configuration divided by its expectation. Its normalization is therefore deterministic; Equation (13.1) contains no random partition function.

For $beta > 0$, let $sans(G)_beta = N \( beta^2 \, beta^2 \)$ and write $chevron.l f chevron.r = integral f \( h \) thin d sans(G)_beta \( h \)$. An asterisk denotes a second argument integrated against the same law. In this Section the scalar functions are

#[#set math.equation(numbering: n => "(13.2)")
 $ m \( h \) = tanh h \, #h(2em) v \( h \) = 1 - m \( h \)^2 \, #h(2em) w \( h \) = 1 - m \( h \) \, $ <rcut:eq:comp-field-functions>]

and we put

#[#set math.equation(numbering: n => "(13.3)")
 $ D \( h \) = beta^2 ⟨frac(v \( h_(*) \)^2, w \( h \) + w \( h_(*) \))⟩_(*) \, #h(2em) K_0 \( h \, h_(*) \) = frac(v \( h \) v \( h_(*) \), w \( h \) + w \( h_(*) \)) . $ <rcut:eq:comp-kernels>]

To control large fields uniformly, express the kernels in terms of $w in \[ 0 \, 2 \]$, using $v = w \( 2 - w \)$ also at the endpoints. The resulting kernels

#[#set math.equation(numbering: n => "(13.4)")
 $ F \( a \, b \) = frac(b^2 \( 2 - b \)^2, a + b) \, #h(2em) K \( a \, b \) = frac(a \( 2 - a \) b \( 2 - b \), a + b) $ <rcut:eq:comp-compact-kernels>]

extend continuously to $\[ 0 \, 2 \]^2$ by taking value zero at $\( 0 \, 0 \)$. Indeed $F \( a \, b \) lt.eq b \( 2 - b \)^2 lt.eq 32 \/ 27$, and $K \( a \, b \) lt.eq 4 a b \/ \( a + b \) lt.eq 4 min \( a \, b \)$. Thus the denominators remain harmless after compactifying the field through $w$, including the limit of large positive fields.

The variational parameters describe the part of a unit vector that is constant at a given field and its remaining variation. More precisely, a finite partition into field bins gives a mean $b_a$ of the rescaled coordinates $sqrt(n) thin p_i$ and a root-mean-square deviation $r_a gt.eq 0$ in each bin. Equation (13.18) makes this decomposition precise. With empirical bin proportions as weights, the sum of $b_a^2 + r_a^2$ is one. The functional below uses the limiting Gaussian law $sans(G)_beta$ instead; the rescaling in Equation (13.21) will preserve the unit norm when we pass between the two measures. Its final term will bound the conditional Gaussian contribution from the within-bin variation.

For measurable real $b$ and nonnegative $r$ with $chevron.l b^2 + r^2 chevron.r = 1$, define

#[#set math.equation(numbering: n => "(13.5)")
 $ cal(V)_beta \( b \, r \) =  & chevron.l D \( b^2 + r^2 \) chevron.r + chevron.l b h chevron.r chevron.l b v chevron.r + chevron.l b chevron.r chevron.l b h v chevron.r - beta^2 chevron.l b chevron.r chevron.l b v chevron.r\
 & + 2 beta^2 chevron.l b chevron.r chevron.l b m v chevron.r + beta^2 chevron.l b \( h \) K_0 \( h \, h_(*) \) b \( h_(*) \) chevron.r_(h \, h_(*))\
 & + beta ⟨r \( h \) sqrt(⟨\( v \( h \) + v \( h_(*) \) \)^2 r \( h_(*) \)^2⟩_(*) + "Var"_(h_(*)) #scale(x: 120%, y: 120%)[\(] \( v \( h \) + v \( h_(*) \) \) b \( h_(*) \) #scale(x: 120%, y: 120%)[\)])⟩ . $ <rcut:eq:variational>]

This definition applies to the entire stated $L^2$ class. Boundedness of the kernels and of $m \, v$, together with $h \, h v in L^2 \( sans(G)_beta \)$, makes the first two lines finite. The last radical is bounded by $sqrt(4 chevron.l b^2 + r^2 chevron.r) = 2$, so its pairing with $r$ is finite as well. In particular, $b$ and $r$ need not be bounded.

#thm([Proposition 13.1.])[
  (Planted comparison).  #emph[Fix $0 < beta lt.eq 1 \/ 2$. Suppose that, for some $delta > 0$, 
$ sup_(chevron.l b^2 + r^2 chevron.r = 1 \, med r gt.eq 0) cal(V)_beta \( b \, r \) lt.eq 1 - delta . $

 There are $kappa > 0$ and $n_0 < oo$ such that for $n gt.eq n_0$, 
#[#set math.equation(numbering: n => "(13.6)")
 $ hat(bb(P))_n (sup_(parallel p parallel_2 = 1) M_J \( p \) > 1 - delta / 2) lt.eq e^(- kappa n) . $ <rcut:eq:comp-exponential-conclusion>]

 The constants may depend on the fixed $beta$ and $delta$.]
] <rcut:prop:planted-comparison>

The proof separates the squared interactions from the centered Gaussian matrix. Lemma 81 replaces the squares by their means without discarding the dependence between fields and couplings. After this replacement, a finite partition of the fields reduces the matrix term to the conditional comparison in Lemma 82. A net of the normalized bin parameters then gives simultaneous control of all unit vectors. We choose every approximation accuracy before sending $n$ to infinity, which retains the exponential failure rate required by the proposition.

=== 13.2 Gaussian squares and the added diagonal <gaussian-squares-and-the-added-diagonal>

The first task is to control weighted sums of interaction squares. We begin with deterministic weights; the later conditioning argument will explain when these estimates also apply to weights depending on the fields. Under $hat(bb(P))_n$, $n J_(i j)^2$ has the same law as

$ X_n = \( beta Z + beta^2 \/ sqrt(n) \)^2 \, #h(2em) Z tilde.op N \( 0 \, 1 \) . $

For $mu = beta^2 \/ sqrt(n)$ and $\| t \| < 1 \/ \( 2 beta^2 \)$, direct Gaussian integration gives

#[#set math.equation(numbering: n => "(13.7)")
 $ log bb(E) e^(t \( X_n - bb(E) X_n \)) =  & - 1 / 2 log \( 1 - 2 beta^2 t \) - beta^2 t + frac(2 beta^2 mu^2 t^2, 1 - 2 beta^2 t) lt.eq C_beta t^2 \, $ <rcut:eq:comp-square-mgf>]

where the inequality holds for $\| t \| lt.eq t_beta$ with a fixed $t_beta > 0$, uniformly in $n$. Consequently, if $X_(n \, j)$ are independent copies and $\| a_j \| lt.eq A$, then exponential Markov inequalities for both signs imply

#[#set math.equation(numbering: n => "(13.8)")
 $ bb(P) (lr(|1 / n sum_(j = 1)^(n - 1) a_j \( X_(n \, j) - bb(E) X_(n \, j) \)|) > u) lt.eq 2 exp { - c_(beta \, A) n min \( u^2 \, u \) } . $ <rcut:eq:comp-weighted-square-tail>]

To see the rate, independence bounds the logarithm of the moment generating function of the unnormalized sum by $C_(beta \, A) n t^2$ on a fixed interval of $t$. In the exponential Markov bound choose $t$ to be a sufficiently small constant multiple of $min \( u \, 1 \)$, and repeat with the opposite sign. This argument remains valid after conditioning on a sigma-field that determines the coefficients and is independent of the copies.

Add independent diagonal entries $zeta_i tilde.op N \( beta^2 \/ n \, 2 beta^2 \/ n \)$ to the planted probability space, and set

#[#set math.equation(numbering: n => "(13.9)")
 $ tilde(J) = J + "diag" \( zeta_i \) = W + beta^2 e e^(sans(T)) \, #h(2em) e = bold(1) / sqrt(n) \, quad Q = I - e e^(sans(T)) \, quad H = tilde(J) bold(1) . $ <rcut:eq:comp-goe-coupling>]

Here $W$ is a centered GOE with off-diagonal variance $beta^2 \/ n$ and diagonal variance $2 beta^2 \/ n$. For every fixed $u > 0$, Gaussian tails, Equation (13.7), and Lemma 73 give constants $c \, C > 0$ such that, outside an event of probability at most $C n^2 e^(- c n)$,

#[#set math.equation(numbering: n => "(13.10)")
 $ max_i \| zeta_i \| lt.eq u \, quad max_(i < j) \| J_(i j) \| lt.eq u \, quad max_i sum_j J_(i j)^2 lt.eq beta^2 + u \, quad parallel W parallel lt.eq 2 beta + u . $ <rcut:eq:comp-basic-events>]

Each estimate has an exponential rate at fixed $u$. A row sum has mean $\( n - 1 \) \( beta^2 \/ n + beta^4 \/ n^2 \)$, so Equation (13.8) followed by a union over rows gives the third bound. Gaussian tails and finite unions give the first two. For the last, the GOE comparison in the proof of Proposition 74 gives $bb(E) lambda_max \( W \) lt.eq 2 beta$, with Gaussian Lipschitz constant $sqrt(2) beta \/ sqrt(n)$. Apply Lemma 73 to both $W$ and $- W$. These events also bound the planted norm $parallel J parallel$ by $2 beta + beta^2 + 2 u$. Only a fixed bound on that norm is needed in what follows.

The following decomposition is exact:

#[#set math.equation(numbering: n => "(13.11)")
 $ tilde(J) = Q W Q + frac(H e^(sans(T)) + e H^(sans(T)), sqrt(n)) - e e^(sans(T)) frac(e^(sans(T)) H, sqrt(n)) . $ <rcut:eq:comp-field-decomposition>]

This decomposition separates the field-dependent terms from a matrix that is independent of $H$. Indeed, the GOE covariance identity

#[#set math.equation(numbering: n => "(13.12)")
 $ bb(E) \[ \( a^(sans(T)) W b \) \( c^(sans(T)) W d \) \] = beta^2 / n #scale(x: 120%, y: 120%)[\(] \( a^(sans(T)) c \) \( b^(sans(T)) d \) + \( a^(sans(T)) d \) \( b^(sans(T)) c \) #scale(x: 120%, y: 120%)[\)] $ <rcut:eq:comp-goe-covariance>]

makes the covariance of every entry of $Q W Q$ with every entry of $W e$ equal to zero. Joint Gaussianity then gives independence of $Q W Q$ and $H$. The displayed decomposition itself follows by expanding $W$ with $I = Q + e e^(sans(T))$. The covariance identity also gives the following representation of the field vector:

#[#set math.equation(numbering: n => "(13.13)")
 $ H_i = beta^2 + beta Z_i + beta / sqrt(n) Z_0 \, $ <rcut:eq:comp-field-law>]

where $Z_0 \, Z_1 \, dots.h \, Z_n$ are independent standard Gaussians. Indeed its covariance has diagonal $beta^2 \( 1 + 1 \/ n \)$ and off-diagonal $beta^2 \/ n$.

=== 13.3 Replacing squared entries with their means <replacing-squared-entries-with-their-means>

#thm([Lemma 13.2.])[
  (Weighted square replacement).  #emph[On the enlarged planted space, put $w_i = w \( H_i \)$ and $E_(i j) = J_(i j)^2 - beta^2 \/ n$, including $E_(i i) = - beta^2 \/ n$. Here $compose$ denotes entrywise product, and $F$ is defined in Equation (13.4). For any fixed continuous function $G$ on $\[ 0 \, 2 \]^2$ and any $u > 0$, there are $c > 0$ and $n_0$ such that, for $n gt.eq n_0$, each of the following failures has probability at most $e^(- c n)$: 
#[#set math.equation(numbering: n => "(13.14)")
 $ & ∥J compose J - beta^2 e e^(sans(T))∥ > u \,\
 & sup_(parallel p parallel_2 = 1) lr(|sum_(i \, j) E_(i j) G \( w_i \, w_j \) p_i p_j|) > u \,\
 & max_i lr(|sum_(j eq.not i) E_(i j) F \( w_i \, w_j \)|) > u . $ <rcut:eq:comp-square-operator>]

]
] <rcut:lem:comp-square-replacement>

#proof[
  We first establish the unweighted operator estimate, then insert the continuous kernel $G$ by approximation. The diagonal estimate will require a separate argument that removes one row from the fields. For the operator estimate, truncate $X_n = n J_(i j)^2$ at a fixed level $T$. For a sufficiently small fixed $t > 0$,
  $ sup_n bb(E) e^(t \( X_n - T \)_(+)) arrow.r 1 quad upright("as ") T arrow.r oo . $
  For uniform dominated convergence, use $\| beta Z + beta^2 \/ sqrt(n) \| lt.eq beta \| Z \| + beta^2$; the square of the right side has an exponential moment for a sufficiently small parameter. We may therefore choose $T$ so that both the mean tail and the logarithm of the displayed moment are as small as required. Exponential Markov bounds the probability that a row average of $\( n J_(i j)^2 - T \)_(+)$ exceeds the prescribed accuracy by $e^(- c n)$. Taking the union over the $n$ rows retains a positive exponential rate. Symmetry and entrywise nonnegativity bound the tail matrix’s operator norm by its largest row sum, and the same estimate controls its expectation.
  For a fixed unit vector, the quadratic form of the centered truncated matrix is a sum of independent bounded variables with coefficients $2 p_i p_j \/ n$, $i < j$. To bound its moment generating function, recall that a centered variable whose range has length $a$ has logarithmic moment generating function at most $a^2 s^2 \/ 8$. The second derivative is a variance under a tilted law and is at most $a^2 \/ 4$; integrating twice gives this bound. Since $sum_(i < j) \( 2 p_i p_j \)^2 lt.eq 2$, the present quadratic form has logarithmic moment generating function at most $C T^2 s^2 \/ n^2$, and hence a tail at fixed accuracy bounded by $2 e^(- c n^2 \/ T^2)$. To obtain an operator estimate, use a $1 \/ 4$-net of the unit sphere with at most $9^n$ points. This cardinality follows by comparing volumes of disjoint balls of radius $1 \/ 8$. For a symmetric matrix $A$, twice the maximum of $\| p^(sans(T)) A p \|$ on this net bounds $parallel A parallel$. The union bound is therefore absorbed by the quadratic exponential rate. It remains to restore the mean and diagonal:
  $ bb(E) J_(i j)^2 = beta^2 / n + beta^4 / n^2 quad \( i eq.not j \) \, $
  so the resulting mean correction and missing diagonal have norm $O_beta \( 1 \/ n \)$. Together with the truncation and net bounds, this proves Equation (13.14).
  We now insert $G$. Uniform continuity gives an approximation on a finite rectangular partition of $\[ 0 \, 2 \]^2$, of the form $sum_(a \, d) g_(a d) upright(bold(1))_(I_a) \( w_i \) upright(bold(1))_(I_d) \( w_j \)$. Multiplication of $p$ by the corresponding coordinate masks reduces each summand to Equation (13.14). The number of summands and their coefficients are fixed. For the remaining kernel error $R_(i j)$, use
  $ lr(|sum_(i \, j) E_(i j) R_(i j) p_i p_j|) lt.eq max_(i \, j) \| R_(i j) \| thin \| p \|^(sans(T)) \| E \| thin \| p \| lt.eq max_(i \, j) \| R_(i j) \| max_i sum_j \| E_(i j) \| . $
  The row-sum bound in Equation (13.10) controls this error, since $sum_j \| E_(i j) \| lt.eq sum_j J_(i j)^2 + beta^2$. This proves Equation (13.14). On the operator and row-sum events, the argument is deterministic for every choice of masks and residual coefficients. Thus these weights may depend on the whole interaction matrix.
  For the diagonal estimate we must recover independence before applying the weighted tail bound. Fix a row $i$ and condition on
  $ cal(F)_i = sigma #scale(x: 120%, y: 120%)[\(] J_(k l) : k \, l eq.not i \; med zeta_1 \, dots.h \, zeta_n #scale(x: 120%, y: 120%)[\)] . $
  This sigma-field leaves the entries of the off-diagonal row $\( J_(i j) \)_(j eq.not i)$ independent. Remove that row from the other fields by defining
  $ H_j^(\( - i \)) = zeta_j + sum_(k eq.not i \, j) J_(j k) \, #h(2em) j eq.not i . $
  The fields so obtained are $cal(F)_i$-measurable, with $H_j - H_j^(\( - i \)) = J_(i j)$. Keep $a in \[ 0 \, 2 \]$ deterministic for now and set $c_j \( a \) = F \( a \, w \( H_j^(\( - i \)) \) \)$. Under the conditioning these weights are fixed and lie in $\[ 0 \, 32 \/ 27 \]$, so Equation (13.8) gives a bound $e^(- c n)$ for the event
  $ lr(|sum_(j eq.not i) c_j \( a \) (J_(i j)^2 - beta^2 / n)|) > u \, $
  for all large $n$, uniformly in $cal(F)_i$ and $a$; the mean correction is at most $\( 32 \/ 27 \) beta^4 \/ n$. Take a union first over a fixed finite mesh of $a$ values and then over the $n$ rows. Uniform continuity of $F$ and the bound on $sum_j \| E_(i j) \|$ extend the estimate to all $a in \[ 0 \, 2 \]$. Next restore the original fields. On the maximum-entry event, $\| H_j - H_j^(\( - i \)) \|$ is uniformly small. The Lipschitz property of $w$ and uniform continuity of $F$ bound the resulting error by a small multiple of the same row sum. Only after these simultaneous estimates do we set $a = w_i$. Conditioning on $w_i$ at the outset would condition on a row sum and destroy the independence used above. The mesh, continuity tolerances and entry bound are chosen before $n$; their failures therefore retain positive exponential rates. This completes Equation (13.14). ◻
]

We can now simplify the quadratic form. Before applying the replacement lemma, change the fields in Equation (12.1) from $J bold(1)$ to $H$. Each coordinate changes by $zeta_i$. For the squared-entry terms, uniform continuity of the compact kernels in Equation (13.4) and the bounded row sums make the error uniformly small on the unit sphere. The unsquared term has error at most $parallel J parallel max_i \| v \( \( J bold(1) \)_i \) - v \( H_i \) \|$; adding its diagonal costs at most $max_i \| zeta_i \|$. We then apply Lemma 81 to the squared entries.

Put $A = "diag" \( v \( H_i \) \)$, $overline(H) = n^(- 1) sum_i H_i$, and

$ D_n \( t \) = beta^2 / n sum_j frac(v \( H_j \)^2, w \( t \) + w \( H_j \)) . $

For every fixed accuracy $u > 0$, the preceding estimates show that, outside probability $e^(- c n)$,

#[#set math.equation(numbering: n => "(13.15)")
 $ sup_(parallel p parallel_2 = 1) \| M_J \( p \) - hat(M) \( p \) \| lt.eq u \, $ <rcut:eq:comp-reduced-error>]

where

#[#set math.equation(numbering: n => "(13.16)")
 $ hat(M) \( p \) =  & p^(sans(T)) Q W Q A p + frac(p^(sans(T)) H, sqrt(n)) \( e^(sans(T)) A p \) + \( p^(sans(T)) e \) frac(H^(sans(T)) A p, sqrt(n)) - overline(H) \( p^(sans(T)) e \) \( e^(sans(T)) A p \)\
 & + 2 beta^2 \( p^(sans(T)) e \) #scale(x: 120%, y: 120%)[\(] e^(sans(T)) "diag" \( m \( H_i \) v \( H_i \) \) p #scale(x: 120%, y: 120%)[\)] + sum_i D_n \( H_i \) p_i^2 + beta^2 / n sum_(i \, j) K_0 \( H_i \, H_j \) p_i p_j . $ <rcut:eq:comp-reduced-form>]

Here the two weighted replacement estimates have different roles. Equation (13.14) treats the diagonal part of the last square in Equation (12.1); Equation (13.14) treats its cross part and the other squared-entry term. The added terms with $i = j$ in Equation (13.16) contribute only $O_beta \( 1 \/ n \)$ on the unit sphere. To check the coefficient of the kernel term, expand the square over $i < j$: the cross part is exactly the ordered off-diagonal sum with coefficient $beta^2 \/ n$.

=== 13.4 Finite field bins and normalized parameters <finite-field-bins-and-normalized-parameters>

The reduced form still depends on all $n$ field values. We next replace them by a fixed finite collection while retaining uniformity over every unit vector. Choose a finite partition $cal(I) = \( I_1 \, dots.h \, I_k \)$ of the real line into intervals, with the two extreme intervals unbounded, and choose a representative $h_a in I_a$ for each interval. Write

$ h^(cal(I)) \( h \) = h_a quad \( h in I_a \) \, #h(2em) m_a = m \( h_a \) \, quad v_a = v \( h_a \) \, quad w_a = w \( h_a \) . $

For every prescribed accuracy, the partition and representatives can be chosen so that $parallel h - h^(cal(I)) parallel_(L^2 \( sans(G)_beta \))$ is small, and so that $m \, v$ and the kernels in Equation (13.4) change uniformly by a small amount on replacing each field by its representative. Construct the partition by first choosing $R$ so that the Gaussian square tails outside $\[ - R \, R \]$ are small. In each tail take a representative far enough out that $tanh$ is uniformly close to its endpoint; uniform continuity on the compactified $w$-square then controls both kernels. A fine mesh of $\[ - R \, R \]$ gives the remaining approximations. Choose every interval to have positive $sans(G)_beta$-probability.

Let

$ pi_a = sans(G)_beta \( I_a \) \, #h(2em) hat(pi)_a = 1 / n \| { i : H_i in I_a } \| . $

The following properties hold with exponentially small failure at any fixed accuracy:

#[#set math.equation(numbering: n => "(13.17)")
 $ max_a \| hat(pi)_a - pi_a \| med upright("is small") \, #h(2em) 1 / n sum_i \| H_i - h^(cal(I)) \( H_i \) \|^2 med upright("is small") \, #h(2em) \| overline(H) - beta^2 \| med upright("is small") . $ <rcut:eq:comp-empirical-events>]

We verify the exponential rates because the final comparison needs more than convergence in probability. In the representation (13.13), the common shift lies in any prescribed small fixed interval except with probability $e^(- c n)$. For the independent fields $Y_i = beta^2 + beta Z_i$, the bounded-variable moment generating function estimate from the square-replacement proof gives exponential concentration of each bin count. A common shift of magnitude at most $a$ can move a field to a different bin only when $Y_i$ is within $a$ of a boundary. There are finitely many boundaries. Choose $a$ so that their neighborhoods have small total probability, and concentrate their empirical count by the same estimate. For the empirical square error, the mesh, common shift and boundary counts control the bounded middle interval. The tail contribution is at most a constant times the empirical average of $\( 1 + Y_i^2 \) upright(bold(1))_({ \| Y_i \| > R - a })$. These variables possess an exponential moment at a small fixed parameter. Increasing $R$ makes its logarithm arbitrarily small, by the same domination argument used for Gaussian square tails. Exponential Markov therefore makes the tail average small with probability $1 - e^(- c n)$. The remaining assertion follows from $overline(H) - beta^2 tilde.op N \( 0 \, 2 beta^2 \/ n \)$. Thus every tolerance in Equation (13.17) has a fixed positive exponential rate. These events also bound the empirical second moment of $H$ and ensure, for large $n$, at least two sites in every bin.

For a unit vector $p$, let $p_c$ be its orthogonal projection onto vectors constant on every bin and write $p = p_c + u$. On bin $a$ put

#[#set math.equation(numbering: n => "(13.18)")
 $ \( p_c \)_i = b_a / sqrt(n) \, #h(2em) sum_(i : H_i in I_a) u_i = 0 \, #h(2em) parallel u_a parallel_2^2 = hat(pi)_a r_a^2 \, quad r_a gt.eq 0 . $ <rcut:eq:comp-bin-decomposition>]

Then $sum_a hat(pi)_a \( b_a^2 + r_a^2 \) = 1$. It is useful to use the normalized coordinates

#[#set math.equation(numbering: n => "(13.19)")
 $ B_a = sqrt(hat(pi)_a) thin b_a \, #h(2em) R_a = sqrt(hat(pi)_a) thin r_a \, #h(2em) sum_a \( B_a^2 + R_a^2 \) = 1 . $ <rcut:eq:comp-normalized-parameters>]

These coordinates place all bin parameters in a compact subset of a unit sphere of fixed dimension. They also accommodate vectors concentrated on very few sites. For example, if $p$ is one coordinate vector in a bin of $m = n hat(pi)_a$ sites, then

$ B_a = 1 / sqrt(m) \, #h(2em) R_a = sqrt(1 - 1 / m) \, $

and all other coordinates vanish. If instead $p$ is constant and normalized on that bin, then $b_a = hat(pi)_a^(- 1 \/ 2)$, but $B_a = 1$ and $R_a = 0$.

For any probability measure $nu$ with finite second moment, denote by $cal(V)_(beta \, nu)$ the expression in Equation (13.5) with every bracket and variance taken under $nu$, and with $D$ defined using that same measure. Write $cal(A)_(beta \, nu)$ for its first two lines, so that its last line is the remaining Gaussian comparison term. For the empirical bin measure $hat(nu)_(cal(I)) = sum_a hat(pi)_a delta_(h_a)$, let $overline(A) = "diag" \( v_(a \( i \)) \)$, where $a \( i \)$ is the bin of $H_i$. Equations (13.16) and (13.17) imply, with any fixed prescribed accuracy and exponentially small failure,

#[#set math.equation(numbering: n => "(13.20)")
 $ sup_(parallel p parallel_2 = 1) lr(|hat(M) \( p \) - [p^(sans(T)) Q W Q overline(A) p + cal(A)_(beta \, hat(nu)_(cal(I))) \( b \, r \)]|) med upright("is small") . $ <rcut:eq:comp-bin-form-error>]

The bin decomposition explains each part of this expression. The diagonal term is $sum_a hat(pi)_a D_(hat(nu)_(cal(I))) \( h_a \) \( b_a^2 + r_a^2 \)$, whereas terms bilinear in bin-constant vectors depend only on $b$. The three rank terms in Equation (13.11) give the three $h$-terms of Equation (13.5), after replacing $overline(H)$ by $beta^2$.

Uniformity follows from the unit norm of $p$, without a pointwise bound on $b$. For instance, write $parallel f parallel_(n \, 2)^2 = n^(- 1) sum_i f_i^2$ and apply Cauchy–Schwarz:

$ frac(\| p^(sans(T)) \( H - H^(cal(I)) \) \|, sqrt(n)) lt.eq parallel H - H^(cal(I)) parallel_(n \, 2) \, $

and the corresponding error for $H v$ is at most this error plus $max_i \| v \( H_i \) - v_(a \( i \)) \| thin parallel H^(cal(I)) parallel_(n \, 2)$. The other factors in the rank products are controlled by $parallel p parallel_2 = 1$ and the empirical second moment of the fields. A uniform kernel error contributes at most a constant times $parallel p parallel^2$ in the diagonal term, and a constant times $\( n^(- 1 \/ 2) sum_i \| p_i \| \)^2 lt.eq 1$ in the cross term. Finally, the matrix term changes by at most $parallel W parallel max_i \| v \( H_i \) - v_(a \( i \)) \|$. This proves the uniform error estimate in Equation (13.20).

We have now reduced the form to finitely many field values. To apply the hypothesis of Proposition 80, we must also replace empirical bin masses by their Gaussian probabilities. For parameters $b_a \, r_a$ normalized under $hat(pi)$, define functions on the original intervals by

#[#set math.equation(numbering: n => "(13.21)")
 $ b^(cal(I)) \( h \) = B_a / sqrt(pi_a) \, #h(2em) r^(cal(I)) \( h \) = R_a / sqrt(pi_a) quad \( h in I_a \) . $ <rcut:eq:comp-mass-rescaling>]

They satisfy $chevron.l \( b^(cal(I)) \)^2 + \( r^(cal(I)) \)^2 chevron.r = 1$. By choosing the partition accurately enough and the proportion tolerance small enough, we have

#[#set math.equation(numbering: n => "(13.22)")
 $ sup_(sum_a \( B_a^2 + R_a^2 \) = 1 \, med R_a gt.eq 0) lr(|cal(V)_(beta \, hat(nu)_(cal(I))) \( b \, r \) - cal(V)_beta \( b^(cal(I)) \, r^(cal(I)) \)|) med upright("arbitrarily small") . $ <rcut:eq:comp-functional-approximation>]

The only nonpolynomial term requires care when its radical vanishes. For bin probabilities $pi$, set $t = \( sqrt(pi_a) \)_a$ and $c_(a d) = v_a + v_d$. In normalized coordinates, write the $a$th radical as a Euclidean norm:

#[#set math.equation(numbering: n => "(13.23)")
 $ sans(N)_a \( t \, B \, R \) = ∥("diag" \( c_(a 1) \, dots.h \, c_(a k) \) R \, \( I - t t^(sans(T)) \) "diag" \( c_(a 1) \, dots.h \, c_(a k) \) B)∥_2 lt.eq 2 . $ <rcut:eq:comp-normalized-radical>]

If $t$ changes to another unit probability square-root vector $s$, then $\| sans(N)_a \( t \, B \, R \) - sans(N)_a \( s \, B \, R \) \| lt.eq 4 parallel t - s parallel_2$, since $parallel t t^(sans(T)) - s s^(sans(T)) parallel lt.eq 2 parallel t - s parallel_2$. Consequently the last line of the functional, which is $beta sum_a t_a R_a sans(N)_a \( t \, B \, R \)$, changes by at most $6 beta parallel t - s parallel_2$. The remaining terms are polynomials in $B \, R$, the probability square roots and the fixed bin coefficients. Their coefficients are bounded, so their continuity is uniform on the normalized sphere. Since the finitely many $pi_a$ are positive, we can choose a sufficiently small tolerance for the empirical proportions even when some fixed bins have very small probability.

It remains to replace each representative by the actual field inside its interval. Again use a norm representation for the last line: at outer field $h$, its radical is

$ ∥(\( v \( h \) + v \( dot.op \) \) r \( dot.op \) \, \( I - bb(E) \) \( \( v \( h \) + v \( dot.op \) \) b \( dot.op \) \))∥_(L^2 xor L^2) . $

Changing $v$ uniformly by at most $a$ changes this vector by norm at most $2 a sqrt(chevron.l b^2 + r^2 chevron.r) = 2 a$. This estimate is valid also when either radical is zero. The diagonal and kernel terms use uniform errors, and the coherent terms use, for example,

$ \| chevron.l b \( h - h^(cal(I)) \) chevron.r \| lt.eq parallel b parallel_2 parallel h - h^(cal(I)) parallel_2 \, quad parallel h v - h^(cal(I)) v^(cal(I)) parallel_2 lt.eq parallel h - h^(cal(I)) parallel_2 + parallel h^(cal(I)) parallel_2 parallel v - v^(cal(I)) parallel_oo . $

The norm estimate and these $L^2$ estimates complete Equation (13.22). In particular, the comparison holds on the whole normalized class, including functions whose mass is concentrated on rare bins.

=== 13.5 The conditional Gaussian comparison <the-conditional-gaussian-comparison>

We now bound the remaining Gaussian matrix term. We use the centered expected-supremum comparison recalled by Vitale #cite(label("Vitale2000")) Equation (3); the proof below verifies the increment inequality for the present constraints.

Condition on $H$ and on the chosen bin partition. Independence in Equation (13.11) leaves the law of $Q W Q$ unchanged. For this conditional calculation, represent it with a fresh GOE independent of $H$ and continue to call that matrix $W$. Fix also the empirical proportions and $b_a \, r_a$. We optimize only over the residual vectors $u_a$, subject to the zero-sum and norm conditions in Equation (13.18).

#thm([Lemma 13.3.])[
  (Comparison within fixed bins).  #emph[With this conditioning and these fixed parameters, 
#[#set math.equation(numbering: n => "(13.24)")
 $ & bb(E) [sup_u p^(sans(T)) Q W Q overline(A) p thin mid(bar.v) thin H]\
 & #h(2em) lt.eq beta sum_a hat(pi)_a r_a sqrt(sum_d hat(pi)_d \( v_a + v_d \)^2 r_d^2 + "Var"_(d tilde.op hat(pi)) \( \( v_a + v_d \) b_d \)) . $ <rcut:eq:comp-bin-gaussian-bound>]

 The full supremum on the left has Gaussian Lipschitz constant at most $sqrt(2) beta \/ sqrt(n)$, uniformly in the normalized parameters.]
] <rcut:lem:comp-bin-gaussian>

#proof[
  Separate the bin-constant space $cal(C)$ from the zero-sum space $cal(U)_a$ in each bin. Then $cal(C)$ is orthogonal to $xor.big_a cal(U)_a$, and $overline(A)$ preserves each space. Since $Q u = u$ and $Q overline(A) u = overline(A) u$, the process expands as
  $ p^(sans(T)) Q W Q overline(A) p =  & C_b + sum_a u_a^(sans(T)) W Q \( v_a I + overline(A) \) p_c + u^(sans(T)) W overline(A) u \,\
C_b =  & p_c^(sans(T)) Q W Q overline(A) p_c . $
  For these fixed bin parameters, $C_b$ is constant in the residual index and has conditional mean zero. The linear residual term uses the $cal(U)$–$cal(C)$ block of the GOE, while the quadratic term uses the $cal(U)$–$cal(U)$ block. Their independence follows from Equation (13.12).
  For two indices $u \, u'$, set
  $ s_a = hat(pi)_a r_a^2 \, #h(2em) q_a = u_a^(sans(T)) u'_a \, #h(2em) V_a = "Var"_(d tilde.op hat(pi)) \( \( v_a + v_d \) b_d \) . $
  The linear residual covariance is
  #[#set math.equation(numbering: n => "(13.25)")
   $ beta^2 / n sum_a q_a V_a . $ <rcut:eq:comp-linear-covariance>]
  Here $Q \( v_a I + overline(A) \) p_c$ lies in $cal(C)$ and has squared norm $V_a$. Orthogonality to the residual spaces makes the other covariance contraction vanish. Applying the same covariance identity to the quadratic residual term gives
  #[#set math.equation(numbering: n => "(13.26)")
   $ frac(beta^2, 2 n) sum_(a \, d) \( v_a + v_d \)^2 q_a q_d . $ <rcut:eq:comp-quadratic-covariance>]
  This follows from
  $ beta^2 / n #scale(x: 120%, y: 120%)[\(] \( u^(sans(T)) u' \) \( \( overline(A) u \)^(sans(T)) overline(A) u' \) + \( u^(sans(T)) overline(A) u' \) \( \( overline(A) u \)^(sans(T)) u' \) #scale(x: 120%, y: 120%)[\)] $
  and symmetrization in the bin indices.
  Cauchy–Schwarz gives $- s_a lt.eq q_a lt.eq s_a$, and hence
  #[#set math.equation(numbering: n => "(13.27)")
   $ s_a s_d - q_a q_d lt.eq s_a \( s_d - q_d \) + s_d \( s_a - q_a \) \, $ <rcut:eq:comp-overlap-inequality>]
  because the right side minus the left side is $\( s_a - q_a \) \( s_d - q_d \) gt.eq 0$. The inequality therefore holds also for negative overlaps. Combining it with Equations (13.25) and (13.26) bounds the increment variance of the residual process by
  $ frac(2 beta^2, n) sum_a \( s_a - q_a \) (V_a + sum_d \( v_a + v_d \)^2 s_d) . $
  This is exactly the increment variance of the linear process
  $ beta / sqrt(n) sum_a sqrt(V_a + sum_d \( v_a + v_d \)^2 s_d) med z_a^(sans(T)) u_a \, $
  with independent standard Gaussian vectors $z_a$ in $cal(U)_a$. Lemma 73 therefore bounds the expected supremum of the residual process by that of the linear process. We can maximize the latter separately in each residual space: each maximum is the corresponding Gaussian norm multiplied by $sqrt(s_a)$. Using $bb(E) parallel z_a parallel lt.eq sqrt(dim cal(U)_a) lt.eq sqrt(n hat(pi)_a)$, we obtain Equation (13.24). Adding $C_b$ leaves this expectation unchanged because its conditional mean is zero and the bin parameters remain fixed.
  Concentration must, however, include $C_b$. For a unit vector $p$, the full GOE functional has symmetric coefficient matrix
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] \( Q p \) \( Q overline(A) p \)^(sans(T)) + \( Q overline(A) p \) \( Q p \)^(sans(T)) #scale(x: 120%, y: 120%)[\)] \, $
  whose Frobenius norm is at most one. Consequently its coefficient norm in independent standard Gaussian coordinates is at most $sqrt(2) beta \/ sqrt(n)$. The supremum inherits this Lipschitz constant, proving the assertion for the full process, including $C_b$. ◻
]

The comparison so far fixes $b$ and $r$. We must now make it simultaneous over these parameters. Although $C_b$ has mean zero for each fixed $b$, optimizing $b$ need not preserve that property. We therefore use concentration for the full supremum just proved, and pass through a finite net of the normalized parameters.

Fix a mesh size $eta > 0$. The feasible set in Equation (13.19) has an $eta$-net inside that set of size at most $\( 1 + 2 \/ eta \)^(2 k)$, with an inessential enlargement of this bound if necessary. Conditional on $H$, this net is fixed independently of $W$. At each net point, adding the deterministic $cal(A)$ to the full supremum and applying Lemma 73 gives an upper bound

#[#set math.equation(numbering: n => "(13.28)")
 $ cal(V)_(beta \, hat(nu)_(cal(I))) \( b \, r \) + a $ <rcut:eq:comp-net-bound>]

outside probability $2 exp \( - c_beta n a^2 \)$, for every fixed $a > 0$. A union over the fixed net makes this estimate simultaneous at all its points.

To pass from the net to every parameter, use the quadratic form in Equation (13.20). Whenever $parallel W parallel$ and the empirical field second moment are bounded, its operator norm is at most a fixed $K_(upright("form"))$. Indeed, $parallel W parallel$ controls the random term, the coherent terms are bounded rank forms, and the remaining kernels are bounded. The estimates above give exponentially small probability for the complement of this event. For any residual directions, changing $\( B \, R \)$ to $\( B' \, R' \)$ while keeping the same unit direction in each residual space changes the vector $p$ by exactly $parallel \( B \, R \) - \( B' \, R' \) parallel_2$. Hence the form changes by at most $2 K_(upright("form")) parallel \( B \, R \) - \( B' \, R' \) parallel_2$. If a residual norm is zero, choose any direction in its residual space for this comparison. The event giving at least two sites per bin ensures that every such space is nonzero for large $n$. Thus the maximum of the net bounds, enlarged by $2 K_(upright("form")) eta$, controls the supremum over all normalized parameters.

#proof[
  We assemble the estimates with five fixed error allowances. Given $delta$ from the hypothesis, put $a = delta \/ 10$. First require an error at most $a$ in Equation (13.15). Next choose the field partition and tolerances to make each error in Equations (13.20) and (13.22) at most $a$. Take concentration error $a$ in Equation (13.28) and choose $eta$ so that $2 K_(upright("form")) eta lt.eq a$. Every choice precedes the limit in $n$. The rescaling in Equation (13.21) makes the limiting functions admissible for the hypothesis. Functional approximation and concentration therefore bound each net value by $1 - delta + 2 a$. The two form errors and extension from the net add the remaining $3 a$, giving, for every unit vector,
  $ M_J \( p \) lt.eq 1 - delta + 5 a = 1 - delta / 2 . $
  To verify that this simultaneous assertion retains an exponential rate, collect the failure probabilities after fixing all parameters. Their sum has the form
  $ & C n^2 e^(- c_1 n) + 2 n N_w e^(- c_2 n) + C k e^(- c_3 n) + 2 N_(upright("par")) e^(- c_4 n) + 2 thin 9^n e^(- c_5 n^2) \,\
 & #h(25mm)  N_w < oo \, #h(2em) N_(upright("par")) lt.eq \( 1 + 2 \/ eta \)^(2 k) . $
  Each $c_i$ is positive and depends only on $beta$ and the fixed choices. The initial terms account for the entry, diagonal, norm, empirical-tail and common-shift events; $N_w$ counts the deterministic row-parameter mesh. Only the last term uses an exponentially large sphere net, and its rate quadratic in $n$ absorbs $9^n$. The other prefactors are fixed or polynomial in $n$. Hence the sum is at most $e^(- kappa n)$ for some $kappa > 0$ and all sufficiently large $n$. Finally the event in Equation (13.6) does not involve the auxiliary diagonals, so its probability on the enlarged space equals that on the planted marginal. ◻
]

=== 13.6 From planted probability to Gibbs mass <from-planted-probability-to-gibbs-mass>

The planted estimate controls a disorder event for one configuration. Sign conjugation turns it into a bound on the expected unnormalized weight of all exceptional configurations. To obtain Gibbs mass, we also need the partition function to remain near its annealed value on the exponential scale.

#thm([Lemma 13.4.])[
  (Annealed transfer).  #emph[Fix $0 < beta < 1$. Let $cal(A)_n$ be a measurable event for symmetric zero-diagonal interaction matrices, and suppose that $hat(bb(P))_n \( cal(A)_n \) lt.eq e^(- kappa n)$ for all large $n$, with a fixed $kappa > 0$. For $x in { - 1 \, 1 }^n$, write $J^x = "diag" \( x \) J "diag" \( x \)$ and define 
$ cal(B)_J = { x : J^x in cal(A)_n } . $

 There are events whose original disorder probabilities tend to one on which 
#[#set math.equation(numbering: n => "(13.29)")
 $ mu_J \( cal(B)_J \) lt.eq e^(- kappa n \/ 2) . $ <rcut:eq:comp-gibbs-small>]

 In fact the complementary probabilities can be bounded by $e^(- c n)$ for a fixed $c > 0$.]
] <rcut:lem:annealed-transfer>

#proof[
  Let $Z_J$ be the original partition function and
  $ Z_(cal(B) \, J) = sum_x e^(x^(sans(T)) J x \/ 2) upright(bold(1))_({ J^x in cal(A)_n }) . $
  The original disorder law is invariant under sign conjugation. Each summand therefore reduces to the all-positive configuration, and the planted density in Equation (13.1) gives
  #[#set math.equation(numbering: n => "(13.30)")
   $ bb(E) Z_(cal(B) \, J) = 2^n bb(E) [e^(sum_(i < j) J_(i j)) upright(bold(1))_(cal(A)_n)] = bb(E) Z_J thin hat(bb(P))_n \( cal(A)_n \) lt.eq e^(- kappa n) bb(E) Z_J . $ <rcut:eq:comp-annealed-numerator>]
  Here $bb(E) Z_J = 2^n exp \( beta^2 \( n - 1 \) \/ 4 \)$.
  We next bound the denominator $Z_J$ from below on the exponential scale. Gaussian integration, with an independent uniform sign vector $\( epsilon_i \)_(i = 1)^n$, gives the exact second-moment identity
  #[#set math.equation(numbering: n => "(13.31)")
   $ frac(bb(E) Z_J^2, \( bb(E) Z_J \)^2) = e^(- beta^2 \/ 2) bb(E)_epsilon exp {frac(beta^2, 2 n) (sum_i epsilon_i)^2} lt.eq e^(- beta^2 \/ 2) / sqrt(1 - beta^2) = : C_beta . $ <rcut:eq:comp-partition-second-moment>]
  For the inequality, introduce a standard Gaussian $Z$ to linearize the square. The sign average becomes $cosh \( beta Z \/ sqrt(n) \)^n lt.eq e^(beta^2 Z^2 \/ 2)$, with expectation $\( 1 - beta^2 \)^(- 1 \/ 2)$. Separate the event ${ Z_J gt.eq bb(E) Z_J \/ 2 }$ and apply Cauchy–Schwarz to obtain
  $ bb(P)_n \( Z_J gt.eq bb(E) Z_J \/ 2 \) gt.eq frac(1, 4 C_beta) . $
  We upgrade this fixed positive probability using concentration. Each derivative of $log Z_J$ in an independent standard disorder Gaussian has magnitude at most $beta \/ sqrt(n)$, giving Lipschitz constant at most $beta sqrt(\( n - 1 \) \/ 2)$. The preceding lower event and Lemma 73 force
  $ bb(E) log Z_J gt.eq log bb(E) Z_J - C sqrt(n) . $
  Otherwise $log bb(E) Z_J - log 2$ would exceed the mean by a sufficiently large multiple of $sqrt(n)$, and upper-tail concentration would make the preceding event less likely than its fixed lower bound. Lower-tail concentration now gives, for all large $n$,
  #[#set math.equation(numbering: n => "(13.32)")
   $ bb(P)_n (log Z_J < log bb(E) Z_J - frac(kappa n, 4)) lt.eq e^(- c n) . $ <rcut:eq:comp-partition-lower>]
  Constants here may depend on the fixed $beta$ and $kappa$.
  By Equation (13.30) and Markov’s inequality,
  $ bb(P)_n (Z_(cal(B) \, J) > e^(- 3 kappa n \/ 4) bb(E) Z_J) lt.eq e^(- kappa n \/ 4) . $
  On the complement of this event and the event in Equation (13.32), divide the numerator bound by the partition-function lower bound to obtain Equation (13.29). A smaller positive exponent absorbs the sum of the two failure probabilities. ◻
]

== 14 A uniform bound on the variational expression <rcut:sec:scalar>

This appendix supplies the variational gap required by the planted comparison. We use the notation of Section 13: $h tilde.op N \( beta^2 \, beta^2 \)$, brackets denote expectation under this law, and $m = tanh h$, $v = 1 - m^2$, $w = 1 - m$. The bound below has one numerical margin for the entire stated temperature interval and for all admissible functions.

#thm([Proposition 14.1.])[
  (Uniform scalar gap).  #emph[For every $beta in \[ 0.35 \, 0.5 \]$, every real measurable $b in L^2$, and every measurable $r gt.eq 0$ in $L^2$ satisfying $chevron.l b^2 + r^2 chevron.r = 1$, the expression in Equation (13.5) satisfies 
$ cal(V)_beta \( b \, r \) lt.eq 0.9969 . $

]
] <rcut:prop:scalar-gap>

Every terminating decimal in the proof denotes an exact rational number. We will apply Young’s inequality with a positive field-dependent multiplier to separate the square-root term into quadratic terms in $b$ and $r$. The multiplier has two jobs: the total diagonal coefficient must stay below $.9789$, and its cost on $b^2$ must absorb the remaining quadratic form, with an excess of at most $.018 chevron.l b^2 chevron.r$. Normalization will then give $.9789 + .018 = .9969$. The functional reductions are proved here. The scalar enclosures on which they rely, including quadrature and arithmetic errors, are proved in Appendix 17.

=== 14.1 Identities and the positive kernel remainder <rcut:sec:scalar-identities>

We begin with two identities that simplify the scalar coefficients. Conditioned on $\| h \| = t$, the sign of the field has weights proportional to $e^t$ and $e^(- t)$, and hence mean $tanh t$. Multiplying by an even function of the field gives, for every $q$ for which the expectations exist,

#[#set math.equation(numbering: n => "(14.1)")
 $ chevron.l m q \( m^2 \) chevron.r = chevron.l m^2 q \( m^2 \) chevron.r . $ <rcut:eq:scalar-sign-identity>]

In particular, $chevron.l m chevron.r = chevron.l m^2 chevron.r$ and $chevron.l m v chevron.r = chevron.l m^2 v chevron.r$. The second identity follows by Gaussian integration by parts with $v' = - 2 m v$:

#[#set math.equation(numbering: n => "(14.2)")
 $ "Cov" \( h \, v \) = - 2 beta^2 chevron.l m v chevron.r \, #h(2em) chevron.l \( h - beta^2 + 2 beta^2 m \) v chevron.r = 0 . $ <rcut:eq:scalar-integration-parts>]

Choose the following positive multiplier for Young’s inequality. Its associated cost $k$ will combine with $D$ in the diagonal estimate:

#[#set math.equation(numbering: n => "(14.3)")
 $ Lambda  \( h \) & = 0.45 + 0.25 m \( h \)^2 - 0.06 m \( h \) \,\
k \( y \) & = beta^2 / 4 ⟨frac(\( 1 - y^2 + v \)^2, Lambda )⟩ \, #h(2em) - 1 lt.eq y lt.eq 1 \,\
a & = chevron.l v chevron.r \, #h(2em) l = chevron.l Lambda  chevron.r = 0.64 - 0.19 a . $ <rcut:eq:scalar-multiplier>]

Equation (14.1) gives the expression for $l$ in Equation (14.3); since $a lt.eq 1$, we have $l gt.eq 0.45$. Completing the square also gives $Lambda  = 0.4464 + 0.25 \( m - 0.12 \)^2 gt.eq 0.4464$. These positive bounds justify the divisions below. To bound the kernel term, define

$ g = frac(v, w + 3 \/ 4) \, #h(2em) G = chevron.l g chevron.r \, #h(2em) R = ⟨frac(\( 1 + m \) v, 2) - 3 / 2 g^2⟩ . $

#thm([Lemma 14.2.])[
  (Kernel remainder).  #emph[The quantity $R$ is nonnegative. For every real $b in L^2$, 
#[#set math.equation(numbering: n => "(14.4)")
 $ chevron.l b \( h \) K_0 \( h \, h_(*) \) b \( h_(*) \) chevron.r_(h \, h_(*)) lt.eq 3 / 2 chevron.l b g chevron.r^2 + R chevron.l b^2 chevron.r . $ <rcut:eq:scalar-kernel-bound>]

]
] <rcut:lem:scalar-kernel>

#proof[
  We separate one rank-one term from the kernel and bound the remainder by its diagonal. Put $q = \( w - 3 \/ 4 \) \/ \( w + 3 \/ 4 \)$. A finite field has $w > 0$ and $\| q \| < 1$, so expansion as a geometric series gives
  $ K_0 \( h \, h_(*) \) = 3 / 2 g \( h \) g \( h_(*) \) sum_(j = 0)^oo q \( h \)^j q \( h_(*) \)^j . $
  The $j = 0$ term will give $3 / 2 chevron.l b g chevron.r^2$. For the remaining terms set $phi.alt_j = sqrt(3 \/ 2) thin g q^j$, $j gt.eq 1$. Their diagonal sum is
  #[#set math.equation(numbering: n => "(14.5)")
   $ rho := sum_(j gt.eq 1) phi.alt_j^2 = frac(\( 1 + m \) v, 2) thin q^2 = frac(\( 1 + m \) v, 2) - 3 / 2 g^2 gt.eq 0 . $ <rcut:eq:scalar-residual-diagonal>]
  The bound $\( 1 + m \) v = \( 1 - m \) \( 1 + m \)^2 lt.eq 32 \/ 27$ implies $rho lt.eq 16 \/ 27$. Moreover $chevron.l rho chevron.r = R$, proving that $R gt.eq 0$. To justify the series for an arbitrary signed $b in L^2$, apply Cauchy–Schwarz:
  $ sum_(j gt.eq 1) chevron.l \| b phi.alt_j \| chevron.r^2 lt.eq chevron.l b^2 chevron.r sum_(j gt.eq 1) chevron.l phi.alt_j^2 chevron.r = R chevron.l b^2 chevron.r . $
  This proves absolute summability of the signed double-integral series, so its sum equals $sum_(j gt.eq 1) chevron.l b phi.alt_j chevron.r^2$. The same estimate bounds that sum by $R chevron.l b^2 chevron.r$. Restoring the $j = 0$ term proves the kernel bound. ◻
]

=== 14.2 The scalar data <rcut:sec:scalar-data>

Write $s_f = chevron.l \( f - chevron.l f chevron.r \)^2 chevron.r^(1 \/ 2)$ for the standard deviation of a real function $f$. Lemma 86 provides the numerical inputs for both parts of the argument. Its five endpoint enclosures control the diagonal coefficient. To treat the remaining quadratic form, we will write $b = chevron.l b chevron.r + b_0$, with $chevron.l b_0 chevron.r = 0$, and bound the constant, centered, and mixed terms using the moment table. Appendix 17 proves all these enclosures.

#thm([Lemma 14.3.])[
  (Certified scalar enclosures).  #emph[At $beta = 1 \/ 2$, define 
$ d \( y \) = 1 / 4 ⟨frac(v^2, 2 - y - m)⟩ \, #h(2em) - 1 lt.eq y lt.eq 1 \, $

 where at $y = 1$ the integrand is interpreted as $v \( 1 + m \)$. Then 
#[#set math.equation(numbering: n => "(14.6)")
 $ upright("quantity") & k \( 0 \) & k \( 1 \) & d \( 0 \) & d' \( 0 \) & d \( 1 \)\
upright("lower bound") & .4276 & .0898 & .0925 & .0522 & .2288\
upright("upper bound") & .4278 & .0900 & .0927 & .0524 & .2290 $ <rcut:eq:scalar-five-enclosures>]

 All bounds in this display are strict. For every $beta in \[ 7 \/ 20 \, 1 \/ 2 \]$, define 
#[#set math.equation(numbering: n => "(14.7)")
 $ F = \( v + a \) h + 2 beta^2 m v + (0.50 - frac(beta^2 a, l)) v + 0.12 m + 3 beta^2 G g . $ <rcut:eq:scalar-F>]

 At the five exact values of $beta$ displayed in Table 1, each of the eight entries after the first column differs from its corresponding expectation or standard deviation under $N \( beta^2 \, beta^2 \)$ by less than $0.001$.]
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 9,
  align: (center, right, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[#emph[$beta$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$a$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$G$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$s_v$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$s_g$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$chevron.l m v chevron.r$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$R$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$s_F$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$s_(m v)$]
]),
  table.cell(rowspan: 1, colspan: 1)[#emph[.350]
], table.cell(rowspan: 1, colspan: 1)[#emph[.890]
], table.cell(rowspan: 1, colspan: 1)[#emph[.554]
], table.cell(rowspan: 1, colspan: 1)[#emph[.128]
], table.cell(rowspan: 1, colspan: 1)[#emph[.084]
], table.cell(rowspan: 1, colspan: 1)[#emph[.081]
], table.cell(rowspan: 1, colspan: 1)[#emph[.015]
], table.cell(rowspan: 1, colspan: 1)[#emph[.659]
], table.cell(rowspan: 1, colspan: 1)[#emph[.238]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[.400]
], table.cell(rowspan: 1, colspan: 1)[#emph[.861]
], table.cell(rowspan: 1, colspan: 1)[#emph[.546]
], table.cell(rowspan: 1, colspan: 1)[#emph[.156]
], table.cell(rowspan: 1, colspan: 1)[#emph[.093]
], table.cell(rowspan: 1, colspan: 1)[#emph[.096]
], table.cell(rowspan: 1, colspan: 1)[#emph[.018]
], table.cell(rowspan: 1, colspan: 1)[#emph[.730]
], table.cell(rowspan: 1, colspan: 1)[#emph[.248]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[.445]
], table.cell(rowspan: 1, colspan: 1)[#emph[.832]
], table.cell(rowspan: 1, colspan: 1)[#emph[.537]
], table.cell(rowspan: 1, colspan: 1)[#emph[.179]
], table.cell(rowspan: 1, colspan: 1)[#emph[.101]
], table.cell(rowspan: 1, colspan: 1)[#emph[.107]
], table.cell(rowspan: 1, colspan: 1)[#emph[.022]
], table.cell(rowspan: 1, colspan: 1)[#emph[.786]
], table.cell(rowspan: 1, colspan: 1)[#emph[.253]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[.475]
], table.cell(rowspan: 1, colspan: 1)[#emph[.813]
], table.cell(rowspan: 1, colspan: 1)[#emph[.530]
], table.cell(rowspan: 1, colspan: 1)[#emph[.195]
], table.cell(rowspan: 1, colspan: 1)[#emph[.107]
], table.cell(rowspan: 1, colspan: 1)[#emph[.114]
], table.cell(rowspan: 1, colspan: 1)[#emph[.025]
], table.cell(rowspan: 1, colspan: 1)[#emph[.821]
], table.cell(rowspan: 1, colspan: 1)[#emph[.255]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[.500]
], table.cell(rowspan: 1, colspan: 1)[#emph[.796]
], table.cell(rowspan: 1, colspan: 1)[#emph[.524]
], table.cell(rowspan: 1, colspan: 1)[#emph[.207]
], table.cell(rowspan: 1, colspan: 1)[#emph[.113]
], table.cell(rowspan: 1, colspan: 1)[#emph[.120]
], table.cell(rowspan: 1, colspan: 1)[#emph[.027]
], table.cell(rowspan: 1, colspan: 1)[#emph[.847]
], table.cell(rowspan: 1, colspan: 1)[#emph[.255]
],
)
]],
    caption: [Table 1: #emph[Certified centers for the moment quantities, with radius $0.001$; the values of $beta$ are exact.] ],
  )
] <rcut:lem:scalar-data>

The function $F$ is the coefficient of the mixed term after centering $b$, as verified in Equation (14.14). Since $chevron.l b_0 chevron.r = 0$, its contribution is bounded by $s_F \| chevron.l b chevron.r \| parallel b_0 parallel_2$.

#thm([Lemma 14.4.])[
  (Diagonal envelope).  #emph[For $0.35 lt.eq beta lt.eq 0.5$ and every real field $h$, 
#[#set math.equation(numbering: n => "(14.8)")
 $ Lambda  \( h \) + D \( h \) + k \( m \( h \) \) lt.eq 0.9789 . $ <rcut:eq:scalar-envelope>]

]
] <rcut:lem:scalar-envelope>

#proof[
  We first reduce the temperature interval to its upper endpoint and then bound the dependence on the field. The Gaussian field has density
  $ p_beta \( h \) = frac(1, sqrt(2 pi) beta) exp (- beta^2 / 2 + h - frac(h^2, 2 beta^2)) . $
  The logarithmic derivative of $beta^2 p_beta \( h \)$ is $beta^(- 1) - beta + h^2 beta^(- 3) > 0$ for $beta < 1$. Thus, for fixed $y$, positivity of the integrands bounds the corresponding integrals in $D$ and $k$ by those at $beta = 1 \/ 2$. At that endpoint, $D \( h \) = d \( m \( h \) \)$.
  It remains to bound the endpoint expression uniformly in $- 1 lt.eq y lt.eq 1$. Convexity of $k$ as a function of $y^2$ gives $k \( y \) lt.eq k \( 0 \) + \( k \( 1 \) - k \( 0 \) \) y^2$. To treat $d$, take $A = 2 - m > 1$ and use the identity
  $ frac(1, A - y) = 1 / A + y / A^2 + frac(y^2, A^2 \( A - y \)) $
  which, together with $A - y gt.eq A - 1$, gives, for every $- 1 lt.eq y lt.eq 1$,
  $ d \( y \) lt.eq d \( 0 \) + d' \( 0 \) y + y^2 #scale(x: 120%, y: 120%)[\(] d \( 1 \) - d \( 0 \) - d' \( 0 \) #scale(x: 120%, y: 120%)[\)] . $
  After adding $Lambda $, the quadratic bounds give the following upper bound for $Lambda  + d + k$:
  #[#set math.equation(numbering: n => "(14.9)")
   $ max { .45 + d \( 0 \) + k \( 0 \) \, med .70 + k \( 1 \) + d \( 1 \) - d' \( 0 \) } + \| d' \( 0 \) - .06 \| . $ <rcut:eq:scalar-envelope-arithmetic>]
  We evaluate this bound using slightly enlarged intervals: replace the enclosures in Equation (14.6) by radius $.0003$ about the respective centers
  $ .4277 \, quad .0899 \, quad .0926 \, quad .0523 \, quad .2289 . $
  The two entries of the maximum are then at most $.9709$ and $.9674$, and the absolute-value term is at most $.0080$. Their sum proves Equation (14.8). ◻
]

=== 14.3 Young’s inequality and the centered coherent form <rcut:sec:scalar-reduction>

The diagonal envelope is now available. We next convert the radical in the variational expression into quadratic terms, retaining its negative square produced by expanding the variance. Set $A = chevron.l b chevron.r$ and $B = chevron.l b v chevron.r$. Apply $beta r sqrt(T) lt.eq Lambda  r^2 + beta^2 T \/ \( 4 Lambda  \)$ to the last term of Equation (13.5). Interchanging the two expectations in the resulting quadratic terms gives

$ chevron.l \( Lambda  + k \( m \) \) r^2 chevron.r quad upright("and") quad chevron.l k \( m \) b^2 chevron.r - beta^2 / 4 ⟨frac(\( B + v A \)^2, Lambda )⟩ . $

Weighted Cauchy–Schwarz bounds the negative term from above by $- beta^2 \( B + a A \)^2 \/ \( 4 l \)$. Collect it with the products of expectations and the kernel term, defining the coherent form

#[#set math.equation(numbering: n => "(14.10)")
 $ cal(C)_beta \( b \) =  & chevron.l b h chevron.r B + A chevron.l b \( h - beta^2 + 2 beta^2 m \) v chevron.r\
 & + beta^2 chevron.l b K_0 b_(*) chevron.r - frac(beta^2, 4 l) \( B + a A \)^2 \, $ <rcut:eq:scalar-coherent>]

and

#[#set math.equation(numbering: n => "(14.11)")
 $ cal(V)_beta \( b \, r \) lt.eq chevron.l \( D + k \( m \) \) \( b^2 + r^2 \) chevron.r + chevron.l Lambda  r^2 chevron.r + cal(C)_beta \( b \) . $ <rcut:eq:scalar-young>]

#thm([Lemma 14.5.])[
  (Coherent form bound).  #emph[For every $0.35 lt.eq beta lt.eq 0.5$ and every real $b in L^2$, 
#[#set math.equation(numbering: n => "(14.12)")
 $ cal(C)_beta \( b \) lt.eq chevron.l \( Lambda  + .018 \) b^2 chevron.r . $ <rcut:eq:scalar-coherent-bound>]

]
] <rcut:lem:scalar-coherent>

#proof[
  We reduce the inequality to a quadratic form in the constant and centered parts of $b$. Write $b = A + b_0$, with $chevron.l b_0 chevron.r = 0$, and set $H_0 = chevron.l b_0 h chevron.r$, $B_0 = chevron.l b_0 v chevron.r$, $G_0 = chevron.l b_0 g chevron.r$. Replace the kernel term by Lemma 85, and call the resulting upper form $cal(C)_beta^(+)$. Equation (14.2) makes its purely constant part $beta^2 \( a + 3 / 2 G^2 + R - a^2 \/ l \) A^2$. Define the two slacks
  #[#set math.equation(numbering: n => "(14.13)")
   $ U_0 & = l + .018 + beta^2 (a^2 / l - a - 3 / 2 G^2) - beta^2 R \,\
U_1 & = .4644 - frac(beta s_v, 2) + beta^2 chevron.l m v chevron.r - beta^2 (3 / 2 s_g^2 + R) . $ <rcut:eq:scalar-slacks>]
  Expanding the upper form around $A + b_0$ and subtracting the desired upper bound gives
  #[#set math.equation(numbering: n => "(14.14)")
   $ cal(C)_beta^(+) \( b \) - chevron.l \( Lambda  + .018 \) b^2 chevron.r =  & - U_0 A^2 + A chevron.l b_0 F chevron.r + H_0 B_0 + 3 / 2 beta^2 G_0^2\
 & + beta^2 R chevron.l b_0^2 chevron.r - frac(beta^2 B_0^2, 4 l) - chevron.l \( Lambda  + .018 \) b_0^2 chevron.r . $ <rcut:eq:scalar-full-expansion>]
  The coefficient of the mixed term can be checked directly. The first two terms in Equation (14.10) give $\( v + a \) h + 2 beta^2 m v$; the negative square gives $- beta^2 a v \/ l$; and the kernel bound gives $3 beta^2 G g$. Subtracting $2 chevron.l Lambda  b_0 chevron.r$ contributes $.50 v + .12 m$, up to a constant whose pairing with $b_0$ vanishes. These contributions sum to $F$ from Equation (14.7).
  We next bound the terms quadratic in $b_0$. On the centered space,
  $ H_0 B_0 lt.eq frac(beta s_v + "Cov" \( h \, v \), 2) chevron.l b_0^2 chevron.r = (frac(beta s_v, 2) - beta^2 chevron.l m v chevron.r) chevron.l b_0^2 chevron.r . $
  For this inequality, the symmetric rank-two operator associated with $u = h - chevron.l h chevron.r$ and $z = v - a$ has largest eigenvalue $\( parallel u parallel_2 parallel z parallel_2 + chevron.l u z chevron.r \) \/ 2$. Together with $G_0^2 lt.eq s_g^2 chevron.l b_0^2 chevron.r$ and $Lambda  + .018 gt.eq .4644$, this controls all centered quadratic terms. Discarding the negative $B_0^2$ term from Equation (14.14) yields
  #[#set math.equation(numbering: n => "(14.15)")
   $ cal(C)_beta \( b \) - chevron.l \( Lambda  + .018 \) b^2 chevron.r lt.eq - U_0 A^2 - U_1 chevron.l b_0^2 chevron.r + A chevron.l b_0 F chevron.r . $ <rcut:eq:scalar-two-dimensional>]
  By Cauchy–Schwarz, the mixed term is at most $s_F \| A \| parallel b_0 parallel_2$. Thus positivity of $U_0 \, U_1$ and the bound $s_F < 2 sqrt(U_0 U_1)$ will finish the proof. We verify these inequalities on the entire temperature interval, using the full radius $.001$ of Table 1.
  First we establish the monotonicities needed between table entries. The density of $\| h \|$ is proportional to $beta^(- 1) e^(- beta^2 \/ 2 - h^2 \/ \( 2 beta^2 \)) cosh h$ on $h gt.eq 0$; its ratio at a larger and a smaller $beta$ is increasing in $h$. To see the implication for expectations, let $ell$ be this ratio and $f$ a decreasing function. For independent $X \, X'$ under the smaller-$beta$ law,
  $ "Cov" \( f \( X \) \, ell \( X \) \) = 1 / 2 bb(E) \[ \( f \( X \) - f \( X' \) \) \( ell \( X \) - ell \( X' \) \) \] lt.eq 0 . $
  Since $bb(E) ell \( X \) = 1$, the expectation of $f$ decreases as $beta$ increases. In particular $a$ decreases. For $G$, average $g$ over the conditional signs and write $u = tanh^2 \| h \|$; the resulting function is
  $ frac(\( 1 - u \) \( 1.75 + u \), 1.75^2 - u) . $
  Its derivative, $4 \( 64 u^2 - 392 u - 35 \) \/ \( 16 u - 49 \)^2 < 0$ for $0 lt.eq u lt.eq 1$, proves that $G$ decreases as well. The pointwise increase of $beta^2 p_beta$ from Lemma 87 gives the other needed monotonicities: both $beta^2 chevron.l m v chevron.r = beta^2 chevron.l m^2 v chevron.r$ and $beta^2 R$ increase. For $beta^2 s_v^2$ and $beta^2 s_g^2$, write each weighted variance as the infimum over constant centers of the integral of a nonnegative squared function against $beta^2 p_beta$. Each such integral increases, so the infimum does too.
  Now take successive temperatures $j < z$ from Table 1. Enclose $a$ on this interval by taking $a_(-)$ to be the center at $z$ minus $.001$, and $a_(+)$ the center at $j$ plus $.001$. Define $G_(-) \, G_(+)$ in the same way, and set $l_(-) = .64 - .19 a_(+)$, $l_(+) = .64 - .19 a_(-)$. For any endpoint quantity $X_t$, write $X_t^(+)$ and $X_t^(-)$ for its table center plus and minus $.001$. The monotonicities above give the following lower bounds for the slacks throughout $\[ j \, z \]$:
  #[#set math.equation(numbering: n => "(14.16)")
   $ underline(U)_0 =  & l_(-) + .018 + j^2 (a_(-)^2 / l_(+) - a_(-) - 3 / 2 G_(+)^2) - z^2 R_z^(+) \,\
underline(U)_1 =  & .4644 - frac(z \( s_v \)_z^(+), 2) + j^2 chevron.l m v chevron.r_j^(-) - z^2 (3 / 2 \( \( s_g \)_z^(+) \)^2 + R_z^(+)) . $ <rcut:eq:scalar-interval-slacks>]
  For the first bound, use that $a^2 \/ l - a$ increases in $a$ and decreases in $l$ on $.795 lt.eq a lt.eq .891$, $.45 lt.eq l lt.eq .489$. The parenthesized coefficient in that line is positive on each interval; its explicit lower bounds are given below.
  To control the mixed coefficient, compare its standard deviation to the value at the right endpoint. For $j lt.eq beta lt.eq z$, the density ratio satisfies
  $ sup_h frac(p_beta \( h \), p_z \( h \)) = z / beta exp (frac(z^2 - beta^2, 2)) lt.eq z / j exp (frac(z^2 - j^2, 2)) . $
  Choose a constant center before changing measure. This bounds the standard deviation of any function by its standard deviation under $p_z$ times the square root of the displayed factor. Next compare the coefficients of $F$ at $beta$ and $z$, and apply the triangle inequality for the centered $L^2 \( p_z \)$ seminorm. With $s_h = z$ under $p_z$, this gives
  #[#set math.equation(numbering: n => "(14.17)")
   $ overline(s)_F =  & sqrt(z / j exp (frac(z^2 - j^2, 2))) #scale(x: 240%, y: 240%)[\[] \( s_F \)_z^(+) + \( a_(+) - a_(-) \) z + 2 \( z^2 - j^2 \) \( s_(m v) \)_z^(+)\
 & #h(15mm)  + (frac(z^2 a_(+), l_(-)) - frac(j^2 a_(-), l_(+))) \( s_v \)_z^(+) + 3 \( z^2 G_(+) - j^2 G_(-) \) \( s_g \)_z^(+) #scale(x: 240%, y: 240%)[\]] . $ <rcut:eq:scalar-interval-cross>]
  Substituting the full enclosures from Table 1 gives the interval bounds in Table 2. Appendix 17 specifies their directed-arithmetic verification. In the same interval order, the parenthesized coefficients in the first line of Equation (14.16) exceed $.229787 \, .152558 \, .111290 \, .074675$, confirming the positivity used above.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\[ j \, z \]$
], table.cell(rowspan: 1, colspan: 1)[$underline(U)_0 >$
], table.cell(rowspan: 1, colspan: 1)[$underline(U)_1 >$
], table.cell(rowspan: 1, colspan: 1)[$2 sqrt(underline(U)_0 underline(U)_1) >$
], table.cell(rowspan: 1, colspan: 1)[$overline(s)_F <$
]),
  table.cell(rowspan: 1, colspan: 1)[$\[ .350 \, .400 \]$
], table.cell(rowspan: 1, colspan: 1)[.513818
], table.cell(rowspan: 1, colspan: 1)[.437638
], table.cell(rowspan: 1, colspan: 1)[.948403
], table.cell(rowspan: 1, colspan: 1)[.842935
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .400 \, .445 \]$
], table.cell(rowspan: 1, colspan: 1)[.514074
], table.cell(rowspan: 1, colspan: 1)[.431904
], table.cell(rowspan: 1, colspan: 1)[.942404
], table.cell(rowspan: 1, colspan: 1)[.896470
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .445 \, .475 \]$
], table.cell(rowspan: 1, colspan: 1)[.515902
], table.cell(rowspan: 1, colspan: 1)[.429026
], table.cell(rowspan: 1, colspan: 1)[.940926
], table.cell(rowspan: 1, colspan: 1)[.897871
],
  table.cell(rowspan: 1, colspan: 1)[$\[ .475 \, .500 \]$
], table.cell(rowspan: 1, colspan: 1)[.513188
], table.cell(rowspan: 1, colspan: 1)[.426022
], table.cell(rowspan: 1, colspan: 1)[.935157
], table.cell(rowspan: 1, colspan: 1)[.914504
],
)
]],
    caption: [Table 2: Strict lower bounds in the middle three columns and strict upper bounds in the last column, using the full radius $.001$ in Table 1. ],
  )
  The table therefore provides uniform margins $U_0 > .513$, $U_1 > .426$, $s_F < .920$, and $2 sqrt(U_0 U_1) > .930$. These margins absorb the mixed term:
  $ s_F \| A \| parallel b_0 parallel_2 lt.eq 92 / 93 #scale(x: 120%, y: 120%)[\(] U_0 A^2 + U_1 parallel b_0 parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  Substitution in Equation (14.15) makes its right side at most $- \( .426 \/ 93 \) parallel b parallel_2^2$, and in particular nonpositive. This proves Equation (14.12) for every $b in L^2$. ◻
]

#proof[
  We can now assemble the two bounds. Insert the coherent-form estimate of Lemma 88 into Equation (14.11), and then apply the diagonal envelope of Lemma 87:
  $ cal(V)_beta \( b \, r \) lt.eq chevron.l \( D + k \( m \) + Lambda  \) \( b^2 + r^2 \) chevron.r + .018 chevron.l b^2 chevron.r lt.eq .9789 + .018 = .9969 . $
  The argument applies to the full function class in the proposition. The coefficients $h \, h v$ belong to $L^2$, all other coefficient functions are bounded, and Lemma 85 already justifies the kernel integral for signed, unbounded $b$. The quantity under the last radical in Equation (13.5) is at most $4 chevron.l b^2 + r^2 chevron.r = 4$, making its pairing with $r$ finite. Thus Fubini for the nonnegative quadratic integrals and every use of Cauchy–Schwarz are valid without an infinity-norm bound on either function. The estimate consequently also covers concentration on arbitrarily rare field sets. ◻
]

== 15 Avoiding exceptional states and the mixing scale <rcut:sec:dynamics>

The gradient estimate contracts outside an exceptional set of small Gibbs mass. To use it from an arbitrary initial configuration, we must also control the time the chain spends in that set. We first obtain this control after a constant burn-in, then propagate gradients over logarithmic times. The resulting concentration bounds will locate the median mixing time on that same scale.

Fix $beta in \[ 0 \, 1 \/ 2 \)$. Intersect the good-disorder events in Propositions 74, 76, 77, and 79, and denote the resulting event by $cal(G)_n$. Then $bb(P)_J \( cal(G)_n \) arrow.r 1$. We collect the inputs on this event before starting the argument. There are constants $K \, C_E \, C_L \, gamma \, kappa > 0$ and $A gt.eq 0$, depending only on the fixed $beta$, such that the following bounds hold for all sufficiently large $n$ and every realization in $cal(G)_n$. The interaction satisfies $parallel J parallel lt.eq K$, the continuous-time gap is at least $gamma$, and the transition density has the entropy bound

#[#set math.equation(numbering: n => "(15.1)")
 $ "Ent"_mu #h(-0.16667em) (frac(S_t \( x \, dot.op \), mu)) lt.eq C_E n e^(- t \/ C_L) #h(2em) \( x in Omega_n \, med t gt.eq 0 \) . $ <rcut:eq:dyn-entropy-input>]

Here the quotient denotes the density with respect to $mu$. There is also a set $cal(B) = cal(B) \( J \) subset.eq Omega_n$ such that

#[#set math.equation(numbering: n => "(15.2)")
 $ mu \( cal(B) \) lt.eq e^(- kappa n) \, #h(2em) \( partial_r - L \) U \( S_r f \) lt.eq #scale(x: 120%, y: 120%)[\(] - kappa + A upright(bold(1))_(cal(B)) #scale(x: 120%, y: 120%)[\)] U \( S_r f \) quad \( r gt.eq 0 \) $ <rcut:eq:dyn-gradient-input>]

for every real function $f$ on $Omega_n$. The same $kappa$ can be used for the exceptional mass and the contraction rate by shrinking it and enlarging $A$. From now on we work deterministically on $cal(G)_n$: both the constants and the sufficiently large dimension thresholds are uniform over this event. Suppressing the fixed disorder, we write $bb(P)_x \, bb(E)_x$ for the law and expectation of the continuous-time chain started at $x$.

=== 15.1 Gradient propagation and jump concentration <gradient-propagation-and-jump-concentration>

We begin by expressing the gradient bound along a chain trajectory. The exponential weight below records contraction outside the exceptional set and the possible loss during visits to it. A rough bound on this weight will suffice for the initial burn-in.

#thm([Lemma 15.1.])[
  (Feynman–Kac comparison).  #emph[Put $V = - kappa + A upright(bold(1))_(cal(B))$. For every real $f$, every $0 lt.eq s lt.eq d$, and every initial configuration $x$, 
#[#set math.equation(numbering: n => "(15.3)")
 $ U \( S_d f \) \( x \) lt.eq bb(E)_x #h(-0.16667em) [exp #h(-0.16667em) (integral_0^s V \( X_u \) thin d u) U \( S_(d - s) f \) \( X_s \)] . $ <rcut:eq:dyn-feynman-kac>]

 Consequently, 
#[#set math.equation(numbering: n => "(15.4)")
 $ parallel U \( S_r f \) parallel_oo lt.eq e^(A r) parallel U \( f \) parallel_oo #h(2em) \( r gt.eq 0 \) . $ <rcut:eq:dyn-rough-envelope>]

]
] <rcut:lem:feynman-kac>

#proof[
  Let $G \( r \, x \) = U \( S_r f \) \( x \)$. Equation (15.2) gives $- partial_r G + L G + V G gt.eq 0$. Following the chain forward while running the semigroup parameter backward therefore gives nonnegative drift for
  $ exp #h(-0.16667em) (integral_0^u V \( X_v \) thin d v) G \( d - u \, X_u \) \, #h(2em) 0 lt.eq u lt.eq s \, $
  so the finite state space and bounded time interval justify taking expectations. This proves Equation (15.3). For the rough envelope, take $s = d = r$ and bound the exponential weight using $V lt.eq A$. This gives Equation (15.4). ◻
]

To convert gradient envelopes into fluctuation bounds we use Lemma 3, with $U \( f \) = parallel d f parallel^2$. Its complete finite-chain proof uses only the heat-bath jump rates, so it applies throughout the present argument without a temperature assumption.

=== 15.2 Uniform avoidance after a constant burn-in <uniform-avoidance-after-a-constant-burn-in>

Small Gibbs mass alone does not control a chain started inside the exceptional set. We first show that entropy dissipation moves a fixed amount of probability a macroscopic Hamming distance away from that set. Concentration of the distance then makes the probability of a visit at any later deterministic time very small.

#thm([Proposition 15.2.])[
  #emph[There are constants $d_0 \, c_(upright(a)) > 0$, independent of $n$ and the realization in $cal(G)_n$, such that, for all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(15.5)")
 $ sup_(x in Omega_n) bb(P)_x \( X_u in cal(B) \) lt.eq q_n := e^(- c_(upright(a)) sqrt(n)) #h(2em) \( u gt.eq d_0 \) . $ <rcut:eq:dyn-bad-avoidance>]

]
] <rcut:prop:bad-avoidance>

#proof[
  If $cal(B)$ is empty there is nothing to prove. Otherwise we first enlarge it by a small fixed fraction of the coordinates and show that the enlargement still has exponentially small Gibbs mass. Let $d_H$ denote Hamming distance and, for $0 < delta < 1 \/ 2$, set
  $ cal(B)^(\( delta \)) = { x : d_H \( x \, cal(B) \) lt.eq floor.l delta n floor.r } . $
  If $d_H \( x \, y \) lt.eq delta n$, then
  $ lr(|frac(x^(sans(T)) J x - y^(sans(T)) J y, 2)|) = 1 / 2 lr(|\( x - y \)^(sans(T)) J \( x + y \)|) lt.eq 2 K sqrt(delta) thin n . $
  Thus the energy change within the neighborhood is controlled by the operator norm of the interaction. Counting the neighbors of each $y in cal(B)$, with multiplicity, gives
  #[#set math.equation(numbering: n => "(15.6)")
   $ mu \( cal(B)^(\( delta \)) \) lt.eq mu \( cal(B) \) e^(2 K sqrt(delta) thin n) sum_(j lt.eq delta n) binom(n, j) lt.eq exp #h(-0.16667em) [- n #scale(x: 120%, y: 120%)[\(] kappa - 2 K sqrt(delta) - h \( delta \) #scale(x: 120%, y: 120%)[\)]] \, $ <rcut:eq:dyn-neighborhood>]
  where $h \( delta \) = - delta log delta - \( 1 - delta \) log \( 1 - delta \)$. The binomial bound follows by inserting $z = delta \/ \( 1 - delta \) < 1$ into $\( 1 + z \)^n$ and using $z^j gt.eq z^(delta n)$ for $j lt.eq delta n$. Choose a fixed $delta$ so small that $2 K sqrt(delta) + h \( delta \) lt.eq kappa \/ 2$. Equation (15.6) then bounds the neighborhood mass by $e^(- kappa n \/ 2)$.
  We next use this small equilibrium mass to bound the probability of the neighborhood after burn-in. For probability measures $nu \, mu$ and an event of probabilities $p \, q$, respectively, conditioning on the event and its complement gives
  $ "Ent"_mu #h(-0.16667em) (nu / mu) gt.eq p log p / q + \( 1 - p \) log frac(1 - p, 1 - q) gt.eq p log 1 / q - log 2 . $
  Apply this inequality to $nu = S_(d_0) \( x \, dot.op \)$ and the neighborhood, choosing the burn-in time to be
  $ d_0 = 1 + C_L log max { 1 \, 8 C_E \/ kappa } . $
  By Equation (15.1), for sufficiently large $n$,
  $ bb(P)_x \( X_(d_0) in cal(B)^(\( delta \)) \) lt.eq frac(2 C_E, kappa) e^(- d_0 \/ C_L) + frac(2 log 2, kappa n) lt.eq 1 / 2 . $
  At least half the law is now outside the neighborhood. To strengthen this fact to avoidance of the original set, consider $g \( x \) = d_H \( x \, cal(B) \) \/ sqrt(n)$. Its half-differences have magnitude at most $1 \/ \( 2 sqrt(n) \)$, so $U \( g \) lt.eq 1 \/ 4$. Outside $cal(B)^(\( delta \))$ the distance is greater than $delta n$. The integer rounding in the neighborhood definition therefore gives
  $ S_(d_0) g \( x \) gt.eq frac(delta sqrt(n), 2) . $
  Equation (15.4) permits the envelope $b \( r \) = e^(A r) \/ 4$ for $0 lt.eq r lt.eq d_0$. Put $Q = e^(A d_0 \/ 2)$. Then $B lt.eq Q^2 \/ 4$ and $I lt.eq d_0 Q^2 \/ 4$ in Lemma 3. Taking $theta = - 1 \/ Q$ in Lemma 3 yields
  $ bb(P)_x \( X_(d_0) in cal(B) \) lt.eq exp #h(-0.16667em) (frac(e d_0, 2) - frac(delta sqrt(n), 2 Q)) lt.eq e^(- c_(upright(a)) sqrt(n)) \, #h(2em) c_(upright(a)) = frac(delta, 4 Q) \, $
  after increasing the fixed minimum dimension. The event on the left is exactly ${ g \( X_(d_0) \) = 0 }$, so the negative exponential moment controls precisely the required lower tail. This proves avoidance at the burn-in time. To obtain the same bound at every deterministic $u gt.eq d_0$, apply the Markov property to the last burn-in interval:
  $ bb(P)_x \( X_u in cal(B) \) = bb(E)_x #h(-0.16667em) [bb(P)_(X_(u - d_0)) \( X_(d_0) in cal(B) \)] lt.eq q_n . $
  Every choice depended only on the constants collected at the start of this section. The estimate is therefore uniform in the starting point and in the disorder on the good event. ◻
]

The pointwise-in-time avoidance bound also controls occupation time by integration. We now return to the Feynman–Kac weight: on a logarithmic time horizon, an exceptional occupation larger than one has such small probability that even the rough exponential envelope is harmless.

#thm([Lemma 15.3.])[
  (Propagation on a logarithmic time horizon).  #emph[Fix $D_(*) > 0$ and set 
#[#set math.equation(numbering: n => "(15.7)")
 $ T_n = D_(*) log n \, #h(2em) C_(upright("dyn")) = e^(A \( d_0 + 1 \)) \, #h(2em) r_n = T_n e^(A T_n) q_n = D_(*) log n thin n^(A D_(*)) e^(- c_(upright(a)) sqrt(n)) . $ <rcut:eq:dyn-occupation-error>]

 For every $0 lt.eq s lt.eq d lt.eq T_n$, every real $f$, and every $x$, 
#[#set math.equation(numbering: n => "(15.8)")
 $ U \( S_d f \) \( x \) & lt.eq C_(upright("dyn")) e^(- kappa s) S_s #h(-0.16667em) [U \( S_(d - s) f \)] \( x \)\
 & quad + r_n parallel U \( S_(d - s) f \) parallel_oo . $ <rcut:eq:gradient-propagation>]

 For every fixed $p > 0$, $r_n = o \( n^(- p) \)$.]
] <rcut:lem:dyn-occupation-propagation>

#proof[
  Measure only the exceptional occupation after burn-in: let $Z_n = integral_(d_0)^(T_n) upright(bold(1))_(cal(B)) \( X_u \) thin d u$ when $T_n gt.eq d_0$, and put $Z_n = 0$ otherwise. Integrating Proposition 90 and applying Markov’s inequality gives
  $ bb(P)_x \( Z_n > 1 \) lt.eq bb(E)_x Z_n lt.eq T_n q_n . $
  On ${ Z_n lt.eq 1 }$, the total bad-set occupation up to any $s lt.eq T_n$ is at most $d_0 + 1$. Therefore
  $ exp #h(-0.16667em) (integral_0^s V \( X_u \) thin d u) lt.eq C_(upright("dyn")) e^(- kappa s) quad upright("on ") { Z_n lt.eq 1 } . $
  The rough bound $e^(A T_n)$ applies to the exponential weight on the complementary event. Split the expectation in Lemma 89 accordingly. For occupation at most one, use the displayed weight bound and enlarge the expectation of the nonnegative endpoint quantity to the whole space. For larger occupation, use its supremum and the probability bound above. These two contributions are exactly the terms in Equation (15.8); occupation and endpoint gradient need not be independent. This also covers $s < d_0$, since the occupation up to $s$ is then at most $d_0$. Finally, $e^(- c_(upright(a)) sqrt(n))$ dominates every fixed power of $n$, which proves the stated decay of the error. ◻
]

=== 15.3 Linear observables and the order of the mixing time <linear-observables-and-the-order-of-the-mixing-time>

The propagated gradient has a bounded time integral for every linear observable with bounded coefficient norm. The jump exponential-moment estimate therefore gives fluctuations of bounded size, uniformly over all such observables and all starts. We will use this uniformity to choose a distinguishing observable after the disorder and the initial configuration have been selected.

#thm([Proposition 15.4.])[
  (Uniform concentration for linear observables).  #emph[Fix $D_(*) > 0$ and $L gt.eq 0$. For $a in bb(R)^n$ write $ell_a \( x \) = a^(sans(T)) x$, and define 
$ B_L = L^2 \( C_(upright("dyn")) + 1 \) \, #h(2em) I_L = L^2 (C_(upright("dyn")) / kappa + 1) . $

 For all sufficiently large $n$, every $parallel a parallel lt.eq L$, every $x$, every $0 lt.eq d lt.eq D_(*) log n$, and every $theta in bb(R)$, 
#[#set math.equation(numbering: n => "(15.9)")
 $ bb(E)_x exp #h(-0.16667em) (theta #scale(x: 120%, y: 120%)[\(] ell_a \( X_d \) - S_d ell_a \( x \) #scale(x: 120%, y: 120%)[\)]) lt.eq M_(theta \, L) := exp #h(-0.16667em) (2 theta^2 e^(2 \| theta \| sqrt(B_L)) I_L) \, $ <rcut:eq:dyn-linear-mgf>]

 and 
#[#set math.equation(numbering: n => "(15.10)")
 $ "Var"_x \( ell_a \( X_d \) \) lt.eq 4 I_L \, #h(2em) "Var"_mu \( ell_a \) lt.eq gamma^(- 1) L^2 \, #h(2em) mu \( ell_a \) = 0 . $ <rcut:eq:dyn-linear-variance>]

 These bounds hold simultaneously over all the indicated vectors and starting points, and uniformly over $cal(G)_n$.]
] <rcut:prop:linear-concentration>

#proof[
  For a linear observable, $U \( ell_a \) = parallel a parallel^2$, so the endpoint gradient in the propagation estimate is constant. Taking $s = d = r$ in Equation (15.8) gives the deterministic envelope
  $ parallel U \( S_r ell_a \) parallel_oo lt.eq b \( r \) := L^2 #scale(x: 120%, y: 120%)[\(] C_(upright("dyn")) e^(- kappa r) + r_n #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq r lt.eq T_n . $
  For sufficiently large $n$, both $r_n lt.eq 1$ and $T_n r_n lt.eq 1$. Consequently $sup b lt.eq B_L$ and $integral_0^(T_n) b \( r \) thin d r lt.eq I_L$. These are the two quantities needed by Lemma 3, which gives both the transient exponential-moment bound and the variance bound.
  The equilibrium variance uses the gap input instead. Applying its Dirichlet-form inequality gives
  $ "Var"_mu \( ell_a \) lt.eq gamma^(- 1) mu #h(-0.16667em) [ell_a \( - L \) ell_a] = gamma^(- 1) sum_i a_i^2 mu \( v_i \) lt.eq gamma^(- 1) parallel a parallel^2 . $
  The energy identity follows by conditional expectation: $mu \( x_i m_i \) = mu \( m_i^2 \)$, so the coordinate energy is $mu \( v_i \)$. Spin inversion in the zero-field model supplies the zero mean in Equation (15.10). Since the gradient envelope holds on the entire coefficient ball, none of these bounds requires $a$ to be chosen before the disorder or the starting configuration. ◻
]

We can now place the mixing time between logarithmic bounds. For the lower bound, a spin correlation will produce a linear observable whose mean is still large while both variances remain bounded. For the upper bound, the entropy estimate already available at the start of the section suffices.

#thm([Proposition 15.5.])[
  (The median mixing scale).  #emph[There is a constant $C < oo$ such that, uniformly over $cal(G)_n$ and all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(15.11)")
 $ d_c #h(-0.16667em) (1 / 4 log n) gt.eq 1 - C n^(- 1 \/ 2) . $ <rcut:eq:dyn-strong-lower>]

 The continuous median mixing time 
$ t_n^(upright("med")) = inf { t gt.eq 0 : d_c \( t \) lt.eq 1 \/ 2 } $

 satisfies $d_c \( t_n^(upright("med")) \) = 1 \/ 2$ and, for some constants $0 < c < C < oo$, 
#[#set math.equation(numbering: n => "(15.12)")
 $ c log n lt.eq t_n^(upright("med")) lt.eq C log n . $ <rcut:eq:dyn-median-scale>]

]
] <rcut:prop:mixing-scale>

#proof[
  Write $sigma_i \( x \) = x_i$. Spin inversion gives $mu \( sigma_i \) = 0$ and $mu \( sigma_i^2 \) = 1$, while
  $ mu #h(-0.16667em) [sigma_i \( - L \) sigma_i] = mu \( v_i \) lt.eq 1 . $
  Use the spectral decomposition of the finite-dimensional self-adjoint operator $- L$. The squared coefficients of $sigma_i$ form nonnegative weights summing to one, and the preceding energy is their mean eigenvalue. Jensen’s inequality for $lambda mapsto e^(- d lambda)$ therefore yields
  #[#set math.equation(numbering: n => "(15.13)")
   $ mu #h(-0.16667em) [sigma_i S_d sigma_i] gt.eq exp #h(-0.16667em) (- d mu \[ sigma_i \( - L \) sigma_i \]) gt.eq e^(- d) . $ <rcut:eq:dyn-spin-correlation>]
  Sum these correlations over $i$. Since their sum is an average over the initial state under $mu$, some configuration $x = x \( d \, J \)$ satisfies
  $ S_d ell_(x \/ sqrt(n)) \( x \) = 1 / sqrt(n) sum_i x_i S_d sigma_i \( x \) gt.eq sqrt(n) e^(- d) . $
  The coefficient vector $x \/ sqrt(n)$ has norm one, so Proposition 92, with $D_(*) = 1$ and $L = 1$, applies even to this choice. Let $V_(*) = 4 I_1$. The displayed observable has transient variance at most $V_(*)$, equilibrium mean zero, and equilibrium variance at most $gamma^(- 1)$. Let its transient mean be $m gt.eq sqrt(n) e^(- d)$. The event that the observable exceeds $m \/ 2$ separates the transient law from equilibrium. Applying Chebyshev’s inequality under both laws gives, for $0 lt.eq d lt.eq log n$,
  $ d_c \( d \) gt.eq 1 - frac(4 \( V_(*) + gamma^(- 1) \), m^2) gt.eq 1 - frac(4 \( V_(*) + gamma^(- 1) \) e^(2 d), n) . $
  Taking $d = \( log n \) \/ 4$ proves Equation (15.11).
  For the upper bound, the entropy-to-total-variation estimate proved in Proposition 77, applied to Equation (15.1), gives
  $ d_c \( t \)^2 lt.eq 1 / 2 C_E n e^(- t \/ C_L) . $
  Hence $t_n^(upright("med")) lt.eq C_L log \( 2 C_E n \)$ for sufficiently large $n$. Together with Equation (15.11), this proves Equation (15.12). It remains to justify the exact median identity. The function $d_c$ is continuous, as a maximum of finitely many continuous transition-law distances, and the entropy bound shows that it tends to zero. Since $d_c \( 0 \) = 1 - min_x mu \( x \) gt.eq 1 - 2^(- n) > 1 \/ 2$, its first crossing is attained and satisfies $d_c \( t_n^(upright("med")) \) = 1 \/ 2$. ◻
]

== 16 Cutoff and the discrete update clock <rcut:sec:cutoff>

Section 15 placed the median mixing time on a logarithmic scale. We now show that, once the chain has a fixed positive amount of common mass with equilibrium, any additional positive logarithmic lag makes its total-variation distance vanish. Applying this implication on either side of the median proves continuous-time cutoff; a comparison of update clocks then gives the discrete-time result.

Fix $beta in \[ 0 \, 1 \/ 2 \)$. Throughout this section, the disorder belongs to the simultaneous good events $cal(G)_n$ from Section 15. In particular, $parallel J parallel lt.eq K$, the spectral gap is at least $gamma > 0$, and the constants in Equation (15.8) are uniform on these events. We use its notation $kappa > 0$, $C_(upright("dyn"))$, and $r_n$. For each fixed $D_(*) > 0$, Equation (15.8) applies whenever $0 lt.eq s lt.eq d lt.eq D_(*) log n$, and its deterministic remainder satisfies

#[#set math.equation(numbering: n => "(16.1)")
 $ n^p r_n arrow.r 0 #h(2em) upright("for every fixed ") p > 0 . $ <rcut:eq:cutoff-remainder>]

We retain this uniformity throughout: unless stated otherwise, every limit is uniform over $cal(G)_n$. Constants may depend on the fixed inverse temperature and on the fixed parameters in the relevant statement.

=== 16.1 Common mass and local fields <common-mass-and-local-fields>

If two laws share a fixed positive amount of mass, their means can be separated only to the extent permitted by their variances. The following elementary estimate makes this precise. We first apply it to local fields; later we apply it to bounded test functions after semigroup smoothing.

#thm([Lemma 16.1.])[
  (Means under measures with common mass).  #emph[Let $nu$ and $pi$ be probability measures on a finite set, and suppose $parallel nu - pi parallel_(upright("TV")) lt.eq 1 - epsilon$, where $epsilon > 0$. For every real function $H$ on that set, 
#[#set math.equation(numbering: n => "(16.2)")
 $ \| nu H - pi H \| lt.eq frac(sqrt("Var"_nu H) + sqrt("Var"_pi H), sqrt(epsilon)) . $ <rcut:eq:common-mass-means>]

]
] <rcut:lem:common-mass>

#proof[
  Take the common part of the measures, $rho \( x \) = min { nu \( x \) \, pi \( x \) }$, whose mass is $q = 1 - parallel nu - pi parallel_(upright("TV")) gt.eq epsilon$. We compare each mean to the mean under the normalized common part. Since $rho lt.eq nu$, Cauchy–Schwarz gives
  $ lr(|nu H - frac(rho H, q)|) = 1 / q lr(|sum_x rho \( x \) \( H \( x \) - nu H \)|) lt.eq sqrt(frac("Var"_nu H, q)) . $
  The same calculation for $pi$ bounds the other difference from the common mean. The triangle inequality, followed by the lower bound on the common mass, proves the assertion. ◻
]

Write $h_i \( x \) = \( J x \)_i$ for the local field. Its coefficient vector has Euclidean norm at most $K$. Spin inversion gives $mu h_i = 0$ in the zero-field model. Thus the concentration estimate for linear observables applies to every local field. Common mass will also control its transient mean, yielding the following tail bound at each deterministic observation time.

#thm([Lemma 16.2.])[
  (Fields at deterministic observation times).  #emph[Fix $epsilon in \( 0 \, 1 \)$, $delta > 0$, and $D_(*) > 0$. Suppose $d_c \( t \) lt.eq 1 - epsilon$. There is a deterministic sequence $tau_n = tau_n \( epsilon \, delta \, D_(*) \)$ such that 
#[#set math.equation(numbering: n => "(16.3)")
 $ sup_x bb(P)_x [max_(1 lt.eq i lt.eq n) \| h_i \( X_z \) \| > delta log n] lt.eq tau_n \, #h(2em) t lt.eq z lt.eq D_(*) log n \, $ <rcut:eq:cutoff-field-tails>]

 and $n^p tau_n arrow.r 0$ for every fixed $p > 0$.]
] <rcut:lem:cutoff-field-tails>

#proof[
  First control the means. Contraction of total variation implies that the law $nu_(x \, z)$ of $X_z$ from any point $x$ has common mass at least $epsilon$ with $mu$ for every $z gt.eq t$. Proposition 92 bounds $"Var"_(nu_(x \, z)) h_i$ uniformly in $i \, x \, z$, and the equilibrium variance is at most $K^2 \/ gamma$. Lemma 94 therefore gives a constant $B_epsilon$ such that
  #[#set math.equation(numbering: n => "(16.4)")
   $ \| bb(E)_x h_i \( X_z \) \| lt.eq B_epsilon #h(2em) \( t lt.eq z lt.eq D_(*) log n \) . $ <rcut:eq:cutoff-field-means>]
  Next control the deviations from these means. For every fixed $theta > 0$, Proposition 92 bounds both centered exponential moments by a common constant $M_(theta \, K)$. Apply the exponential bound to both tails of each field and then take a union bound over the coordinates. Together with Equation (16.4), this gives
  #[#set math.equation(numbering: n => "(16.5)")
   $ bb(P)_x [max_i \| h_i \( X_z \) \| > delta log n] lt.eq 2 M_(theta \, K) e^(theta B_epsilon) n^(1 - theta delta) . $ <rcut:eq:cutoff-field-chernoff>]
  For a prescribed $p > 0$, first fix $theta$ with $theta delta > p + 1$, and then let $n$ tend to infinity. Define $tau_n$ as the supremum of the displayed probabilities over the indicated parameters and good disorders. The same sequence therefore has every asserted inverse-power decay rate. The uniformity is over deterministic times. In the smoothing argument we will integrate the resulting expectation bounds, so a simultaneous field event along the whole sample path is unnecessary. ◻
]

=== 16.2 A positive logarithmic lag finishes mixing <a-positive-logarithmic-lag-finishes-mixing>

The passage from a nontrivial total-variation overlap to mixing after a positive logarithmic lag is related to the concentration-based cutoff mechanism of Salez #cite(label("Salez2024")) Theorem 5 and Lemma 9. Here we prove the required implication through variances of bounded smoothed tests and their common mass with equilibrium.

We now prove the implication needed for cutoff. The common-mass hypothesis will compare expectations of a smoothed test once its variance is small under both the transient law and equilibrium. The main task is the transient variance: gradient propagation will bound the martingale energy before the observation time by the energy in a later interval of positive logarithmic length.

#thm([Proposition 16.3.])[
  (Positive-lag smoothing).  #emph[Fix $epsilon in \( 0 \, 1 \)$, $alpha > 0$, and $D_(*) > 0$, and put $s = alpha log n$. Uniformly over all times $t gt.eq 0$ satisfying 
$ d_c \( t \) lt.eq 1 - epsilon \, #h(2em) t + s lt.eq D_(*) log n \, $

 one has $d_c \( t + s \) arrow.r 0$.]
] <rcut:prop:positive-lag>

#proof[
  Fix a starting point $x$ and a real test function with $parallel f parallel_oo lt.eq 1$. We first express the transient variance as an integrated martingale energy. Set $T = t + s$ and
  $ F_u = S_(T - u) f \, #h(2em) G \( u \) = bb(E)_x Gamma \( F_u \) \( X_u \) \, #h(2em) 0 lt.eq u lt.eq T . $
  Here $F_u \( X_u \)$ is the backward martingale with terminal value $f \( X_T \)$. Differentiating its second moment and using $\( partial_u + L \) F_u = 0$ gives the exact identity
  #[#set math.equation(numbering: n => "(16.6)")
   $ "Var"_x \( F_r \( X_r \) \) = 2 integral_0^r G \( u \) thin d u \, #h(2em) 0 lt.eq r lt.eq T . $ <rcut:eq:cutoff-variance-budget>]
  Since $parallel F_u parallel_oo lt.eq 1$, this implies
  #[#set math.equation(numbering: n => "(16.7)")
   $ integral_0^T G \( u \) thin d u lt.eq 1 / 2 \, #h(2em) "Var"_x \( S_s f \( X_t \) \) = 2 integral_0^t G \( u \) thin d u . $ <rcut:eq:cutoff-budget-consequences>]
  The total energy is thus bounded. To show that little of it lies before the observation time, fix deterministic $u lt.eq t$ and $z in \[ t + s \/ 2 \, t + s \]$. Apply Equation (15.8) starting at $X_u$, with duration $T - u$ and comparison time $z - u$. These parameters lie within the fixed horizon, and the estimate holds for every possible value of $X_u$ with the same constants. Integrating against its law and using the Markov property yields
  $ bb(E)_x U \( F_u \) \( X_u \) lt.eq C_(upright("dyn")) e^(- kappa \( z - u \)) bb(E)_x U \( F_z \) \( X_z \) + n r_n . $
  The bound on the remainder uses $U \( F_z \) lt.eq n$: each half-difference of a function bounded by one has magnitude at most one. Combining this with $Gamma lt.eq 2 U$ and the separation $z - u gt.eq s \/ 2$ gives
  #[#set math.equation(numbering: n => "(16.8)")
   $ G \( u \) lt.eq 2 C_(upright("dyn")) n^(- kappa alpha \/ 2) bb(E)_x U \( F_z \) \( X_z \) + 2 n r_n . $ <rcut:eq:cutoff-early-late>]
  We still need to replace the late unweighted gradient by the late martingale energy. The field-tail estimate supplies the required lower bound on the heat-bath weights. Choose a fixed $delta$ with $0 < delta < kappa alpha \/ 4$, and let $tau_n$ be the sequence in Lemma 95. At every configuration,
  $ w_i = 1 - x_i tanh h_i gt.eq 1 - \| tanh h_i \| = frac(2, 1 + e^(2 \| h_i \|)) gt.eq e^(- 2 \| h_i \|) . $
  On the event $max_i \| h_i \( X_z \) \| lt.eq delta log n$ this gives $U \( F_z \) \( X_z \) lt.eq n^(2 delta) Gamma \( F_z \) \( X_z \)$. On the complementary event use $U \( F_z \) lt.eq n$. These are pointwise bounds, so they remain valid even though the fields and $F_z$ depend on the same configuration. Taking expectations gives
  #[#set math.equation(numbering: n => "(16.9)")
   $ bb(E)_x U \( F_z \) \( X_z \) lt.eq n^(2 delta) G \( z \) + n tau_n . $ <rcut:eq:cutoff-field-gradient>]
  Define the positive exponent and the deterministic remainder
  $ xi = frac(kappa alpha, 2) - 2 delta > 0 \, #h(2em) R_n = 2 n r_n + 2 C_(upright("dyn")) n tau_n . $
  Equations (16.8) and (16.9) imply
  #[#set math.equation(numbering: n => "(16.10)")
   $ G \( u \) lt.eq 2 C_(upright("dyn")) n^(- xi) G \( z \) + R_n quad upright("for ") u lt.eq t \, quad t + s \/ 2 lt.eq z lt.eq t + s . $ <rcut:eq:cutoff-energy-comparison>]
  The choice of the field threshold leaves a strictly positive decay exponent, and $R_n$ decreases faster than every inverse power of $n$. We have therefore compared each early energy to every energy in the late interval, with uniform error. Average Equation (16.10) over the interval of $z$ of length $s \/ 2$, and then integrate over $0 lt.eq u lt.eq t$. The total energy budget in Equation (16.7) gives
  #[#set math.equation(numbering: n => "(16.11)")
   $ "Var"_x \( S_s f \( X_t \) \) lt.eq 4 C_(upright("dyn")) t / s n^(- xi) + 2 t R_n lt.eq 4 C_(upright("dyn")) D_(*) / alpha n^(- xi) + 2 D_(*) log n thin R_n = : V_n . $ <rcut:eq:cutoff-late-variance>]
  Thus $V_n arrow.r 0$ uniformly in $f \, x \, t$ and in the good disorder, proving the required transient variance bound. The integrations concern deterministic expectations of finite-state semigroup expressions; their measurability and nonnegativity justify interchanging the two integrals by Tonelli’s Theorem. No random observation time or union over a continuum of field events enters this step.
  It remains to control the equilibrium variance and compare the two means. The uniform spectral gap from Proposition 76 gives $frac(d, d r) "Var"_mu \( S_r f \) lt.eq - 2 gamma "Var"_mu \( S_r f \)$. Integrating yields
  #[#set math.equation(numbering: n => "(16.12)")
   $ "Var"_mu \( S_s f \) lt.eq e^(- 2 gamma s) "Var"_mu \( f \) lt.eq n^(- 2 gamma alpha) . $ <rcut:eq:cutoff-equilibrium-smoothing>]
  Both variance bounds now apply to the same observable. Use Lemma 94 for the law of $X_t$ from $x$ and for $mu$, with observable $S_s f$. The common-mass hypothesis is exactly the assumed distance bound at the observation time, and the two expectations are $S_(t + s) f \( x \)$ and $mu f$. Hence
  $ \| S_(t + s) f \( x \) - mu f \| lt.eq epsilon^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] sqrt(V_n) + n^(- gamma alpha) #scale(x: 120%, y: 120%)[\)] . $
  Taking one half of the supremum over $x$ and $parallel f parallel_oo lt.eq 1$ proves Proposition 96. ◻
]

Positive-lag smoothing turns the logarithmic median scale into cutoff. At the median there is enough common mass to apply the proposition. If such common mass appeared a fixed fraction earlier, the same proposition would force mixing before the median, which is impossible.

#thm([Theorem 16.4.])[
  (Continuous-time cutoff).  #emph[Let $t_n^(upright("med")) = inf { t gt.eq 0 : d_c \( t \) lt.eq 1 \/ 2 }$ be the continuous-time median mixing time. For every fixed $b in \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(16.13)")
 $ d_c \( \( 1 - b \) t_n^(upright("med")) \) arrow.r 1 \, #h(2em) d_c \( \( 1 + b \) t_n^(upright("med")) \) arrow.r 0 \, $ <rcut:eq:continuous-cutoff-sides>]

 uniformly over $cal(G)_n$.]
] <rcut:thm:continuous-cutoff>

#proof[
  Proposition 93 gives fixed constants $c \, C > 0$ such that $c log n lt.eq t_n^(upright("med")) lt.eq C log n$ for all sufficiently large $n$, and $d_c \( t_n^(upright("med")) \) = 1 \/ 2$. Fix $b in \( 0 \, 1 \)$ and set $alpha = b c \/ 2$. Fix the horizon constant $D_(*) > \( 1 + b \) C$ so that both applications of positive-lag smoothing lie within its range. First apply Proposition 96 at $t = t_n^(upright("med"))$. This gives $d_c \( t_n^(upright("med")) + alpha log n \) arrow.r 0$. Since $alpha log n lt.eq b t_n^(upright("med")) \/ 2$, monotonicity yields the upper conclusion.
  For the lower side, argue by contradiction while preserving uniformity in the disorder. If the conclusion failed uniformly, there would be a subsequence of dimensions, a good disorder at each of those dimensions, and a fixed $epsilon_0 > 0$ such that $d_c \( \( 1 - b \) t_n^(upright("med")) \) lt.eq 1 - epsilon_0$. Proposition 96 would then give vanishing distance at time
  $ \( 1 - b \) t_n^(upright("med")) + alpha log n lt.eq t_n^(upright("med")) - frac(b c, 2) log n < t_n^(upright("med")) . $
  This contradicts the definition of $t_n^(upright("med"))$, since the distance at every time strictly below $t_n^(upright("med"))$ exceeds $1 \/ 2$. ◻
]

=== 16.3 A clock comparison with fixed holding <a-clock-comparison-with-fixed-holding>

We next transfer cutoff to the clock that counts individual update attempts. Poisson concentration gives the lower side directly. For the upper side we first extract a fixed holding probability, then apply the uniform Poisson-to-binomial comparison proved in Lemma 4. This is the same finite-chain comparison used in the main argument; below we verify all its hypotheses for the present median scale.

#thm([Proposition 16.5.])[
  (Cutoff for single-site update attempts).  #emph[For every fixed $b in \( 0 \, 1 \)$, uniformly over $cal(G)_n$, 
#[#set math.equation(numbering: n => "(16.14)")
 $ d_d #scale(x: 120%, y: 120%)[\(] floor.l \( 1 - b \) n t_n^(upright("med")) floor.r #scale(x: 120%, y: 120%)[\)] arrow.r 1 \, #h(2em) d_d #scale(x: 120%, y: 120%)[\(] ceil.l \( 1 + b \) n t_n^(upright("med")) ceil.r #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $ <rcut:eq:discrete-cutoff-sides>]

 Here each discrete step is one uniformly selected heat-bath update attempt, including attempts that leave the configuration unchanged.]
] <rcut:prop:discrete-cutoff>

#proof[
  The exact clock relation is $S_t = e^(n t \( P - I \))$, so continuous time averages discrete update attempts against a Poisson law. For the lower bound, put $k = floor.l \( 1 - b \) n t_n^(upright("med")) floor.r$ and $T = \( 1 - b \/ 2 \) t_n^(upright("med"))$, and let $N tilde.op "Poisson" \( n T \)$. Convexity of total variation and monotonicity of the discrete distance give
  #[#set math.equation(numbering: n => "(16.15)")
   $ d_c \( T \) lt.eq sum_(j gt.eq 0) bb(P) \( N = j \) d_d \( j \) lt.eq bb(P) \( N < k \) + d_d \( k \) . $ <rcut:eq:clock-lower-transfer>]
  The Poisson mean exceeds $k$ by at least $\( b \/ 2 \) n t_n^(upright("med"))$. Chebyshev’s inequality therefore implies $bb(P) \( N < k \) = O \( \( n t_n^(upright("med")) \)^(- 1) \) = o \( 1 \)$ uniformly. Theorem 97, with parameter $b \/ 2$, gives $d_c \( T \) arrow.r 1$; Equation (16.15) proves the discrete lower bound.
  For the upper bound, we must check the fixed holding condition used by the clock-comparison lemma. The operator-norm bound implies
  $ 1 / n sum_i h_i \( x \)^2 = frac(parallel J x parallel^2, n) lt.eq K^2 . $
  At least half the fields have magnitude at most $sqrt(2) K$. When spin $i$ is selected, its chance of being retained is $e^(x_i h_i) \/ \( 2 cosh h_i \) gt.eq \( 1 + e^(2 \| h_i \|) \)^(- 1)$. Averaging this lower bound over the selected coordinate gives
  #[#set math.equation(numbering: n => "(16.16)")
   $ P \( x \, x \) gt.eq h_0 := frac(1, 2 \( 1 + e^(2 sqrt(2) K) \)) > 0 . $ <rcut:eq:clock-uniform-holding>]
  Choose $q = 1 - h_0 \/ 2 in \( 0 \, 1 \)$ once for all $n$ and all good disorders, and write
  $ P = \( 1 - q \) I + q R \, #h(2em) R = frac(P - \( 1 - q \) I, q) . $
  Subtracting this fixed holding component leaves a Markov kernel $R$ with stationary measure $mu$. In terms of its powers, the two clocks become
  #[#set math.equation(numbering: n => "(16.17)")
   $ S_t = e^(q n t \( R - I \)) \, #h(2em) P^M = sum_(j = 0)^M binom(M, j) q^j \( 1 - q \)^(M - j) R^j . $ <rcut:eq:clock-thinning>]
  We now verify convergence of every fixed shifted Poisson average, as required by Lemma 4. Set $M = ceil.l \( 1 + b \) n t_n^(upright("med")) ceil.r$. For any $x in Omega_n$ and any real function $f$ with $parallel f parallel_oo lt.eq 1$, define $u_j = \( R^j f \) \( x \) - mu f$, so that $\| u_j \| lt.eq 2$. For fixed $y in bb(R)$, Equation (16.17) identifies the Poisson average with mean $m = q M + y sqrt(M)$ as
  $ bb(E) #scale(x: 120%, y: 120%)[\[] u_("Poisson" \( m \)) #scale(x: 120%, y: 120%)[\]] = S_(m \/ \( q n \)) f \( x \) - mu f . $
  Uniformly over the good disorders, $t_n^(upright("med"))$ is between fixed positive multiples of $log n$. Hence
  $ frac(m, q n) = M / n + frac(y sqrt(M), q n) gt.eq \( 1 + b \/ 2 \) t_n^(upright("med")) $
  for all sufficiently large $n$: the correction is $O_y \( sqrt(log n \/ n) \)$, whereas $\( b \/ 2 \) t_n^(upright("med"))$ is of order $log n$. Theorem 97 and monotonicity bound this Poisson average in absolute value by $2 d_c \( \( 1 + b \/ 2 \) t_n^(upright("med")) \) = o \( 1 \)$, uniformly over $x$, $f$, and the good disorder. Also $M$ tends uniformly to infinity. All hypotheses of Lemma 4 are now uniform over the indicated family, so its binomial average tends uniformly to zero. Equation (16.17) identifies that average with $P^M f \( x \) - mu f$. Taking one half of the supremum over $x in Omega_n$ and real $f$ with $parallel f parallel_oo lt.eq 1$ proves the upper bound in Equation (16.14). ◻
]

#proof[
  #emph[Completion of the proof of Theorem 72.] It remains to express discrete cutoff as the asserted ratio of mixing times and then return to disorder probability. Fix $epsilon in \( 0 \, 1 \/ 2 \)$ and $eta > 0$. Choose once
  $ 0 < b < frac(eta, 2 + eta) \, #h(2em) upright("so that") #h(2em) frac(1 + b, 1 - b) < 1 + eta . $
  Proposition 98 implies, for all sufficiently large $n$ and every disorder in $cal(G)_n$,
  $ t_(n \, beta \, J) \( 1 - epsilon \) > floor.l \( 1 - b \) n t_n^(upright("med")) floor.r \, #h(2em) t_(n \, beta \, J) \( epsilon \) lt.eq ceil.l \( 1 + b \) n t_n^(upright("med")) ceil.r . $
  The first bound ensures a positive denominator and controls the integer rounding in the ratio. Hence
  $ frac(t_(n \, beta \, J) \( epsilon \), t_(n \, beta \, J) \( 1 - epsilon \)) lt.eq frac(ceil.l \( 1 + b \) n t_n^(upright("med")) ceil.r, floor.l \( 1 - b \) n t_n^(upright("med")) floor.r + 1) lt.eq frac(1 + b, 1 - b) + frac(1, \( 1 - b \) n t_n^(upright("med"))) < 1 + eta $
  for all sufficiently large $n$, uniformly on $cal(G)_n$. The last step uses $t_n^(upright("med")) gt.eq c log n$. Since $bb(P)_J \( cal(G)_n \) arrow.r 1$, the probability of the event in Theorem 72 is at most $bb(P)_J \( cal(G)_n^c \)$ for large $n$, and therefore tends to zero. This last step uses only the probability of the good event: all preceding estimates hold for each fixed disorder, uniformly over the starting state and the test function. No coupling of disorders across dimensions is needed. ◻
]

== 17 Certificate for the scalar enclosures <rcut:sec:scalar-certificate>

The scalar argument needs certified moments of the field law $N \( beta^2 \, beta^2 \)$, with $beta in \[ 7 \/ 20 \, 1 \/ 2 \]$. Retain the notation of Section 14. We now prove Lemma 86 and verify the arithmetic in Table 2.

There are three distinct error estimates. First, a complex-strip bound controls replacement of each integral by a finite quadrature sum. Second, directed integer arithmetic encloses those sums, which use 41 nodes at each of five exact temperatures. Third, normalization, standard deviations, and the two mean parameters in $F$ must be transferred back to the continuous field law. The estimates below keep these steps separate. The interpolation between temperatures remains the analytic argument of Section 14.

#thm([Lemma 17.1.])[
  (Whole-line trapezoidal estimate).  #emph[Let $t > 0$. Suppose $f$ is continuous on ${ z : \| Im z \| lt.eq t }$, holomorphic in its interior, and satisfies a bound 
$ \| f \( x + i y \) \| lt.eq C \( 1 + \| x \| \)^p e^(- c x^2) \, #h(2em) \| y \| lt.eq t \, $

 for some $C \, c > 0$ and $p gt.eq 0$. If both horizontal-edge integrals of $\| f \|$ are at most $M$, then, for any mesh $Delta > 0$, 
#[#set math.equation(numbering: n => "(17.1)")
 $ lr(|Delta sum_(k in bb(Z)) f \( k Delta \) - integral_(bb(R)) f \( x \) thin d x|) lt.eq frac(2 M, e^(2 pi t \/ Delta) - 1) . $ <rcut:eq:scalar-trapezoid-error>]

]
] <rcut:lem:scalar-trapezoid>

#proof[
  We compare the integral and the infinite quadrature sum through the Fourier coefficients of the periodization. The assumed decay makes $sum_k f \( x + k Delta \)$ uniformly convergent on a period. Its coefficient at integer $j$ is $Delta^(- 1) integral_(bb(R)) f \( x \) e^(- 2 pi i j x \/ Delta) thin d x$. To estimate a nonconstant coefficient, shift the contour to height $- t$ when $j > 0$, and to height $t$ when $j < 0$. The integrals on the vertical sides vanish by the uniform Gaussian decay. One may first shift to an interior line and then pass to the boundary by dominated convergence, so the stated boundary regularity suffices. The resulting bound for the absolute value of the coefficient is $\( M \/ Delta \) e^(- 2 pi t \| j \| \/ Delta)$. These bounds are summable. To identify the Fourier series with the continuous periodization without a further regularity assumption, take arithmetic means of the partial Fourier sums. Relative to normalized measure on a period, their kernels are $N^(- 1) \| sum_(j = 0)^(N - 1) e^(2 pi i j x \/ Delta) \|^2$. The kernels are nonnegative, have integral one, and concentrate at the origin. Their convolutions therefore converge uniformly to the continuous periodization. Absolute convergence identifies this limit with the Fourier series itself. At zero, the constant coefficient is the integral divided by $Delta$; summing the bounds for the remaining coefficients proves Equation (17.1). ◻
]

===== 17.1 A common quadrature error for all moments. <a-common-quadrature-error-for-all-moments.>

To apply the trapezoidal estimate uniformly in the temperature, change variables to $x = h \/ beta$, whose density is $phi \( x - beta \) = \( 2 pi \)^(- 1 \/ 2) e^(- \( x - beta \)^2 \/ 2)$. On $\| Im x \| lt.eq 1.5$, we have $\| Im \( beta x \) \| lt.eq .75 < pi \/ 4$. The identity

$ \| tanh \( u + i t \) \|^2 = frac(sinh^2 u + sin^2 t, sinh^2 u + cos^2 t) $

therefore implies

#[#set math.equation(numbering: n => "(17.2)")
 $ \| m \| lt.eq 1 \, #h(2em) \| v \| lt.eq 2 \, #h(2em) \| Lambda  \| gt.eq .14 \, #h(2em) \| 1.75 - m \| gt.eq .75 \, #h(2em) \| 2 - m \| gt.eq 1 . $ <rcut:eq:scalar-strip-bounds>]

For $d \( 1 \)$, first cancel the denominator and use the expression $v \( 1 + m \)$. The displayed bounds then keep every remaining denominator in the moment integrands away from zero. The integrands are holomorphic on a neighborhood of the closed strip and, after multiplication by the Gaussian density, satisfy the uniform decay in Lemma 99.

The function $F$ involves two expectations, so its quadrature uses approximations to those expectations. We need the same analytic bound for every possible pair of means that will arise. Let $a' \, G'$ be arbitrary constants in $\[ 0 \, 1 \]$, put $l' = .64 - .19 a'$, and let $F_(a' \, G')$ be the expression in Equation (14.7) with these constants. Since $l' gt.eq .45$, $\| .5 - beta^2 a' \/ l' \| lt.eq .5$. Equation (17.2) then gives, with $h = beta x$,

#[#set math.equation(numbering: n => "(17.3)")
 $ \| F_(a' \, G') \( beta x \) \| lt.eq 1.5 \| x \| + 4.12 . $ <rcut:eq:scalar-strip-F>]

On either horizontal edge, this is at most $1.5 \| Re x \| + 6.37$. The Gaussian modulus on that edge is $e^1.125 phi \( Re x - beta \)$. Hence its product with $\| F_(a' \, G') \|^2$ has integral at most

$ e^1.125 #scale(x: 120%, y: 120%)[\(] 1.5 sqrt(1.25) + 6.37 #scale(x: 120%, y: 120%)[\)]^2 < 260 . $

For a simple upper estimate in the last inequality, use $e^1.125 < 4$ and $sqrt(1.25) < 1.12$. We also need the raw moments of $v \, g \, m v \, rho$, the squares of $v \, g \, m v$, and the five scaled integrands in Equation (14.6). Their edge integrals satisfy smaller bounds. For example, $\| g \| lt.eq 8 \/ 3$, $\| \( 1 + m \) v \/ 2 - 1.5 g^2 \| lt.eq 38 \/ 3$, and $\| \( 1 + v \)^2 \/ \( 16 Lambda  \) \| lt.eq 9 \/ \( 16 dot.op .14 \)$. Consequently $M = 1000$ works simultaneously for every first moment, raw second moment, and total-mass integral needed below.

The whole-line estimate leaves a second task: bounding the nodes discarded from the infinite sum. Choose mesh $Delta = .4$ and retain $\| x \| lt.eq 8$. At the omitted nodes $\| x \| gt.eq 8.4$, every relevant real moment integrand is bounded by $\( 1.5 \| x \| + 4.12 \)^2$. Since $\| beta \| lt.eq .5$, the sum of the two tails is bounded by twice the series with terms

$ .4 / sqrt(2 pi) \( 16.72 + .6 j \)^2 e^(- \( 7.9 + .4 j \)^2 \/ 2) \, #h(2em) j = 0 \, 1 \, dots.h . $

The ratio of successive terms is at most

$ q_(*) := e^(- 3.24) (17.32 / 16.72)^2 < .042026 . $

The two omitted tails consequently have total at most

#[#set math.equation(numbering: n => "(17.4)")
 $ frac(.8 \( 16.72 \)^2 e^(- 31.205), sqrt(2 pi) \( 1 - q_(*) \)) < 2.612 dot.op 10^(- 12) . $ <rcut:eq:scalar-tail-error>]

Lemma 99 bounds the whole-line error by $2000 \/ \( e^(7.5 pi) - 1 \) < 1.171 dot.op 10^(- 7)$. Together with Equation (17.4), this proves the following conservative common bound for each unnormalized raw moment:

#[#set math.equation(numbering: n => "(17.5)")
 $ E_(upright("quad")) := 2.3 dot.op 10^(- 7) . $ <rcut:eq:scalar-raw-error>]

This error includes both the infinite-sum error and the omitted tails; it precedes normalization of the quadrature weights. Each decimal comparison used to obtain it is checkable by the directed recipe below. The coarse enclosure $3.14159 < pi < 3.14160$ suffices; it follows, for example, from $pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$ and ten terms of the alternating series for each arctangent.

===== 17.2 The finite quantities to be enclosed. <the-finite-quantities-to-be-enclosed.>

We next specify the sums exactly, so that their arithmetic verification is a finite calculation with rational inputs. For $- 20 lt.eq j lt.eq 20$, put

#[#set math.equation(numbering: n => "(17.6)")
 $ x_j & = 2 j \/ 5 \, #h(2em) h_j = beta x_j \, #h(2em) c_j = e^(- \( x_j - beta \)^2 \/ 2) \,\
y_j & = frac(e^(2 h_j) - 1, e^(2 h_j) + 1) \, #h(2em) V_j = 1 - y_j^2 \, #h(2em) P_j = frac(V_j, 7 \/ 4 - y_j) \,\
N \( f \) & = frac(sum_(j = - 20)^20 c_j f_j, sum_(j = - 20)^20 c_j) \, #h(2em) T \( f \) = N \( f^2 \) - N \( f \)^2 . $ <rcut:eq:scalar-finite-sums>]

Define $a_N = N \( V \)$, $G_N = N \( P \)$, and

$ f_j = \( V_j + a_N \) h_j + 2 beta^2 y_j V_j + (.5 - frac(beta^2 a_N, .64 - .19 a_N)) V_j + .12 y_j + 3 beta^2 G_N P_j . $

In the order of the columns of Table 1, the eight quantities computed from these weights are

#[#set math.equation(numbering: n => "(17.7)")
 $ N \( V \) \, med N \( P \) \, med sqrt(T \( V \)) \, med sqrt(T \( P \)) \, med N \( y V \) \, med N #h(-0.16667em) (frac(V \( 1 + y \), 2) - 1.5 P^2) \, med sqrt(T \( f \)) \, med sqrt(T \( y V \)) . $ <rcut:eq:scalar-eight-sums>]

The directed recipe below encloses each of these quantities within $10^(- 6)$ of the corresponding entry in Table 3. The five temperatures in that table are exact. These enclosures in particular place every finite quantity within $.00065$ of the center in Table 1, and place every finite standard deviation above $.08$. The latter lower bound will allow us to transfer variance errors to standard-deviation errors.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 9,
  align: (center, right, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$beta$
], table.cell(rowspan: 1, colspan: 1)[$N \( V \)$
], table.cell(rowspan: 1, colspan: 1)[$N \( P \)$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(T \( V \))$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(T \( P \))$
], table.cell(rowspan: 1, colspan: 1)[$N \( y V \)$
], table.cell(rowspan: 1, colspan: 1)[$N \( rho \)$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(T \( f \))$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(T \( y V \))$
]),
  table.cell(rowspan: 1, colspan: 1)[.350
], table.cell(rowspan: 1, colspan: 1)[.890140
], table.cell(rowspan: 1, colspan: 1)[.553815
], table.cell(rowspan: 1, colspan: 1)[.128292
], table.cell(rowspan: 1, colspan: 1)[.084412
], table.cell(rowspan: 1, colspan: 1)[.081332
], table.cell(rowspan: 1, colspan: 1)[.014982
], table.cell(rowspan: 1, colspan: 1)[.659034
], table.cell(rowspan: 1, colspan: 1)[.237553
],
  table.cell(rowspan: 1, colspan: 1)[.400
], table.cell(rowspan: 1, colspan: 1)[.860648
], table.cell(rowspan: 1, colspan: 1)[.545767
], table.cell(rowspan: 1, colspan: 1)[.155504
], table.cell(rowspan: 1, colspan: 1)[.093100
], table.cell(rowspan: 1, colspan: 1)[.095751
], table.cell(rowspan: 1, colspan: 1)[.018407
], table.cell(rowspan: 1, colspan: 1)[.729518
], table.cell(rowspan: 1, colspan: 1)[.247528
],
  table.cell(rowspan: 1, colspan: 1)[.445
], table.cell(rowspan: 1, colspan: 1)[.832336
], table.cell(rowspan: 1, colspan: 1)[.536920
], table.cell(rowspan: 1, colspan: 1)[.179354
], table.cell(rowspan: 1, colspan: 1)[.101479
], table.cell(rowspan: 1, colspan: 1)[.107385
], table.cell(rowspan: 1, colspan: 1)[.021988
], table.cell(rowspan: 1, colspan: 1)[.786378
], table.cell(rowspan: 1, colspan: 1)[.252766
],
  table.cell(rowspan: 1, colspan: 1)[.475
], table.cell(rowspan: 1, colspan: 1)[.812698
], table.cell(rowspan: 1, colspan: 1)[.530184
], table.cell(rowspan: 1, colspan: 1)[.194688
], table.cell(rowspan: 1, colspan: 1)[.107439
], table.cell(rowspan: 1, colspan: 1)[.114316
], table.cell(rowspan: 1, colspan: 1)[.024549
], table.cell(rowspan: 1, colspan: 1)[.820670
], table.cell(rowspan: 1, colspan: 1)[.254625
],
  table.cell(rowspan: 1, colspan: 1)[.500
], table.cell(rowspan: 1, colspan: 1)[.795946
], table.cell(rowspan: 1, colspan: 1)[.524071
], table.cell(rowspan: 1, colspan: 1)[.207033
], table.cell(rowspan: 1, colspan: 1)[.112633
], table.cell(rowspan: 1, colspan: 1)[.119553
], table.cell(rowspan: 1, colspan: 1)[.026744
], table.cell(rowspan: 1, colspan: 1)[.846977
], table.cell(rowspan: 1, colspan: 1)[.255330
],
)
]],
  caption: [Table 3: Finite-sum centers with radius $10^(- 6)$; the values of $beta$ are exact. Columns follow Equation (17.7). ],
)

The five additional endpoint enclosures use the same weights at $beta = 1 \/ 2$. Their finite expressions are

#[#set math.equation(numbering: n => "(17.8)")
 $ 1 / 16 N #h(-0.16667em) (frac(\( 1 + V \)^2, .45 + .25 y^2 - .06 y)) \, #h(2em) 1 / 16 N #h(-0.16667em) (frac(V^2, .45 + .25 y^2 - .06 y)) \,\
1 / 4 N #h(-0.16667em) (frac(V^2, 2 - y)) \, #h(2em) 1 / 4 N #h(-0.16667em) (frac(V^2, \( 2 - y \)^2)) \, #h(2em) 1 / 4 N #scale(x: 120%, y: 120%)[\(] V \( 1 + y \) #scale(x: 120%, y: 120%)[\)] . $ <rcut:eq:scalar-five-sums>]

They lie, respectively, within $10^(- 6)$ of

#[#set math.equation(numbering: n => "(17.9)")
 $ .427718 \, quad .089859 \, quad .092577 \, quad .052281 \, quad .228875 . $ <rcut:eq:scalar-five-finite-values>]

===== 17.3 Directed integer arithmetic. <directed-integer-arithmetic.>

We now give the finite recipe that establishes the enclosures just listed. It requires no accuracy assumption for a transcendental library: exponentials and square roots are enclosed using integer arithmetic and explicit remainders. Fix $S = 10^50$, and represent an interval by integer endpoints $\[ u \, v \]$, meaning $\[ u \/ S \, v \/ S \]$. Represent a rational input by its lower and upper nearest multiples of $S^(- 1)$. Addition and subtraction act on endpoints in the usual way. For multiplication, take the minimum and maximum of the four integer endpoint products, then divide by $S$, rounding the minimum down and the maximum up. For an interval not containing zero, its reciprocal is represented by

$ [⌊S^2 / v⌋ \, ⌈S^2 / u⌉] . $

The reciprocal rule applies to positive and negative intervals alike; division is multiplication by this reciprocal. For a nonnegative interval, square roots are represented by $\[ floor.l sqrt(u S) floor.r \, ceil.l sqrt(v S) ceil.r \]$, computed by integer square root and an exact square comparison. Powers use repeated interval multiplication. Every operation preserves inclusion.

All exponential arguments $d$ needed in Equations (17.6)–(17.8) satisfy $\| d \| lt.eq 36.125$. For $z = d \/ 32$, compute

$ p_20 \( z \) = sum_(i = 0)^20 frac(z^i, i !) $

with the preceding interval operations, for example by the recursion $t_0 = 1$, $t_i = t_(i - 1) z \/ i$, followed by summation. Enlarge its interval on both sides by an outward enclosure of

$ frac(4 \( 1.13 \)^21, 21 !) \, $

and raise this interval to the 32nd power. This encloses $e^d$: $\| z \| < 1.13$, and Taylor’s remainder is at most the displayed quantity because $e^1.13 < 4$. In particular the relative error of $p_20 \( d \/ 32 \)^32$ is bounded by

#[#set math.equation(numbering: n => "(17.10)")
 $ (1 + frac(16 \( 1.13 \)^21, 21 !))^32 - 1 < 10^(- 12) . $ <rcut:eq:scalar-exponential-error>]

This relative-error estimate concerns the polynomial approximation $p_20 \( d \/ 32 \)^32$. The interval enclosure follows directly from inserting the absolute remainder before taking the 32nd power, together with outward rounding at every operation. With the rational enclosure for $pi$ given above, the same recipe checks the constants in Equations (17.4) and (17.5) and the exponential in Equation (14.17).

Apply these operations to Equations (17.6)– (17.7) to obtain Table 3; applying them to Equation (17.8) gives Equation (17.9). Applying the same operations to the rational endpoints in Equations (14.16) and (14.17) gives Table 2. The loop bounds and remainder estimates therefore reduce the finite verification to integer arithmetic alone. The supplementary files #raw("numerics-interval.py") and #raw("numerics-cross-errors.py") implement these operations and the error transfers below; their use is not needed to specify the certificate.

===== 17.4 From raw sums to normalized moments. <from-raw-sums-to-normalized-moments.>

The finite arithmetic is now specified. It remains to show that its enclosures imply the continuous-law enclosures used in the scalar proof. Let $Q$ be the unnormalized quadrature with weights $.4 phi \( x_j - beta \)$, so $N \( f \) = Q \( f \) \/ Q \( 1 \)$. The common multiplicative factor omitted in Equation (17.6) cancels in this ratio. For every raw moment under consideration, $\| Q \( f \) - chevron.l f chevron.r \| lt.eq E_(upright("quad"))$ and $\| Q \( 1 \) - 1 \| lt.eq E_(upright("quad"))$, with $E_(upright("quad"))$ from Equation (17.5). If the true $L^2$ norm of $f$ is at most 4, the normalized first- and second-moment errors are consequently bounded by

$ E_1 = frac(5 E_(upright("quad")), 1 - E_(upright("quad"))) \, #h(2em) E_2 = frac(17 E_(upright("quad")), 1 - E_(upright("quad"))) . $

Their variance error is at most

#[#set math.equation(numbering: n => "(17.11)")
 $ E_(upright("var")) = E_2 + E_1 \( 8 + E_1 \) < 1.312 dot.op 10^(- 5) . $ <rcut:eq:scalar-variance-error>]

For each of the computed standard deviations, $sqrt(T \( f \)) > .08$ by Table 3. The identity for a difference of square roots therefore bounds its fixed-function error by

#[#set math.equation(numbering: n => "(17.12)")
 $ E_(upright("sd")) = E_(upright("var")) \/ .08 < 1.64 dot.op 10^(- 4) . $ <rcut:eq:scalar-sd-error>]

The denominator here comes from the finite computation itself. In particular, this argument does not assume the continuous-law enclosures in Table 1, which are still to be proved.

We verify the $L^2$ hypothesis before applying these transfer bounds. The functions $v \, g \, m v$ have absolute value at most one on the real line. For the fixed function $F_(a' \, G')$, the required bound follows from

$ \| F_(a' \, G') \( h \) \| lt.eq 2 \| h \| + 1.87 \, #h(2em) parallel F_(a' \, G') parallel_2 lt.eq 2 sqrt(beta^2 + beta^4) + 1.87 < 3 < 4 . $

The real function $g$ belongs to $\[ 0 \, 1 \]$, since $1 - m^2 lt.eq 1.75 - m$. Positivity of the quadrature weights gives $a_N \, G_N in \[ 0 \, 1 \]$. It follows that all preceding strip and moment estimates apply to the fixed function $F_N := F_(a_N \, G_N)$, whose values at the quadrature nodes are the $f_j$ used in Equation (17.7).

===== 17.5 Replacing the two means in $F$. <replacing-the-two-means-in-f.>

There are two different functions in the remaining comparison. The finite calculation uses $F_N$, whereas the desired continuous standard deviation is that of $F$, with the true means $a \, G$. First apply Equation (17.12) to the fixed function $F_N$. After this step, both standard deviations to be compared are under the same continuous field law. We may then vary the two parameters from $a_N \, G_N$ to $a \, G$. Because $v \, g$ have absolute values at most one,

#[#set math.equation(numbering: n => "(17.13)")
 $ \| a - a_N \| \, med \| G - G_N \| lt.eq e_a := frac(2 E_(upright("quad")), 1 - E_(upright("quad"))) < 4.61 dot.op 10^(- 7) . $ <rcut:eq:scalar-mean-error>]

Throughout the parameter rectangle $\[ 0 \, 1 \]^2$, the derivatives of $F_(a' \, G')$ are

$ frac(partial F_(a' \, G'), partial a') = h - frac(.64 beta^2, \( .64 - .19 a' \)^2) v \, #h(2em) frac(partial F_(a' \, G'), partial G') = 3 beta^2 g . $

Their centered $L^2$ norms are at most $1 / 2 + 1 / 4 \( .64 \) \/ \( .45 \)^2$ and $3 \/ 4$, respectively. The triangle inequality for the centered seminorm consequently gives

#[#set math.equation(numbering: n => "(17.14)")
 $ \| s_F - s_(F_N) \| & lt.eq E_(upright("par")) := (1 / 2 + frac(.64, 4 \( .45 \)^2) + 3 / 4) e_a\
 & < 10^(- 6) . $ <rcut:eq:scalar-parameter-error>]

The parameter $l$ needs no separate perturbation allowance: the derivative above already includes its dependence $l = .64 - .19 a$. Combining Equations (17.12) and (17.14), the total error between the computed standard deviation of $f_j$ and the desired $s_F$ is

#[#set math.equation(numbering: n => "(17.15)")
 $ E_(upright("sd")) + E_(upright("par")) < .000165 . $ <rcut:eq:scalar-total-error>]

#proof[
  We now combine the finite enclosures with the transfer estimates. Every quantity in Table 3 is within $.00065$ of its center in Table 1. Among the standard deviations, the largest transfer error is Equation (17.15); the three standard deviations not involving $F$ require only Equation (17.12). For the first moments $a \, G \, chevron.l m v chevron.r \, R$, the bounded-integrand error is at most $e_a$, since Equation (14.5) bounds the integrand of $R$ by one as well. Thus
  $ .00065 + .000165 = .000815 < .001 $
  establishes every claimed interval in Table 1. To finish the five additional endpoint bounds, observe that every scaled real integrand in Equation (17.8) is bounded by one, so its normalization and quadrature error is at most $e_a$. Adding this to the finite enclosures in Equation (17.9) proves the five strict intervals in Equation (14.6). All numerical comparisons used in this proof follow from the directed operations specified above. ◻
]

== 18 A finite-chain clock comparison <app:clock-comparison>

This appendix proves the bounded-array clock lemma stated in Section 2. Both cutoff arguments use it to pass from shifted Poisson averages to a binomial average after extracting a fixed holding probability from the update kernel. The parameters and arrays below are those of Lemma 4; the proof uses no property of the SK model. It follows the shifted-clock comparison of Chen and Saloff-Coste #cite(label("ChenSaloffCoste2013")) Theorem 1.1 and Lemmas 3.1–3.2, with the finite approximation fixed before the arrays are tested. The Gaussian approximation below uses signed coefficients: cancellation permits translates of the wider Poisson Gaussian to approximate the narrower binomial Gaussian.

#proof[
  The proof has three steps. We approximate the two rescaled clocks in $L^1$ by Gaussian densities, approximate the narrower Gaussian by a finite signed sum of translates of the wider one, and then test this single finite approximation against the bounded arrays. Fixing that approximation before taking the limit will also give the uniform statement.
  #emph[Step 1: the two local limits.] For an integer $M$ and $j in bb(Z)$, let
  $ I_(M \, j) = lr([frac(j - q M, sqrt(M)) \, frac(j + 1 - q M, sqrt(M)))) . $
  The histogram density of an integer-valued random variable $Z$ is $sqrt(M) thin bb(P) \( Z = j \)$ on $I_(M \, j)$. Denote by $p_(M \, y)$ the histogram for $"Poisson" \( q M + y sqrt(M) \)$ and by $q_M$ the histogram for $"Binomial" \( M \, q \)$, assigning zero probability outside their supports. For $v > 0$ write
  $ phi_v \( x \) = 1 / sqrt(2 pi v) e^(- x^2 \/ \( 2 v \)) . $
  We claim that for every fixed $y$,
  #[#set math.equation(numbering: n => "(18.1)")
   $ parallel p_(M \, y) - phi_q \( thin dot.op - y \) parallel_1 arrow.r 0 \, #h(2em) parallel q_M - phi_(q \( 1 - q \)) parallel_1 arrow.r 0 . $ <eq:inputclock-local-limits>]
  Here is a proof from probability ratios. Let $pi_M \( j \)$ denote the probability mass function of either variable, let $k_M$ be an integer nearest its mean, and put $v = q$ in the Poisson case and $v = q \( 1 - q \)$ in the binomial case. Their successive ratios are, respectively,
  $ frac(m, j + 1) \, #h(2em) frac(\( M - j \) q, \( j + 1 \) \( 1 - q \)) \, #h(2em) m = q M + y sqrt(M) . $
  For every fixed $H < oo$, expanding their logarithms at $k_M$ gives, uniformly for integers $\| ell \| lt.eq H sqrt(M)$,
  $ log frac(pi_M \( k_M + ell + 1 \), pi_M \( k_M + ell \)) = - frac(ell, v M) + O_H \( M^(- 1) \) . $
  The constants here may depend on the fixed $q$ and $y$. Indeed, the deviations of the numerator and denominator from their central values are $O_H \( sqrt(M) \)$, and the remainder in $log \( 1 + h \) = h + O \( h^2 \)$ is $O_H \( M^(- 1) \)$; rounding the mean costs the same order. All these indices belong to the supports for large $M$. Summing forward or backward from $k_M$ proves
  #[#set math.equation(numbering: n => "(18.2)")
   $ frac(pi_M \( k_M + ell \), pi_M \( k_M \)) = exp (- frac(ell^2, 2 v M) + O_H \( M^(- 1 \/ 2) \)) #h(2em) \( \| ell \| lt.eq H sqrt(M) \) . $ <eq:inputclock-ratio-expansion>]
  The ratio estimate determines the shape near the mean. Its normalization remains to be identified. Set $A_M = sqrt(M) thin pi_M \( k_M \)$ and $J_H = integral_(- H)^H e^(- x^2 \/ \( 2 v \)) thin d x$. Equation (18.2) and Riemann sums imply
  $ bb(P) \( \| Z - k_M \| lt.eq H sqrt(M) \) = A_M \( J_H + o \( 1 \) \) . $
  Taking, for example, $H = 1$ shows that $A_M$ is bounded. The variance of $Z$ divided by $M$ tends to $v$, and its mean is within $1 \/ 2$ of $k_M$. Chebyshev’s inequality therefore gives
  $ limsup_(M arrow.r oo) bb(P) \( \| Z - k_M \| > H sqrt(M) \) lt.eq v / H^2 . $
  For fixed $H$ this bounds the limit inferior and limit superior of $A_M$ by $\( 1 - v \/ H^2 \) \/ J_H$ and $1 \/ J_H$, respectively. Letting $H arrow.r oo$ yields $A_M arrow.r \( 2 pi v \)^(- 1 \/ 2)$. Equation (18.2) now proves uniform convergence of the histogram densities on every compact interval, with limiting center $y$ in the Poisson case and zero in the binomial case. The same Chebyshev estimate controls their tails; the histogram intervals move an observation by at most $M^(- 1 \/ 2)$ in the rescaled coordinate. Gaussian tails then give the whole-line $L^1 \( bb(R) \)$ convergence in Equation (18.1).
  #emph[Step 2: approximation by translates.] We claim that the narrower Gaussian belongs to the closed linear span, in $L^1$, of translates of the wider Gaussian. Every derivative $phi_q^(\( k \))$ belongs to that closed span: its finite differences are finite linear combinations of translates, and their quotients converge to the derivative in $L^1$. For completeness, iterating the Fundamental Theorem of Calculus expresses the $k$th forward-difference quotient as
  $ integral_(\[ 0 \, 1 \]^k) phi_q^(\( k \)) \( x + h \( t_1 + dots.h.c + t_k \) \) thin d t_1 dots.h.c d t_k . $
  Gaussian derivatives are integrable polynomial multiples of a Gaussian, and their translations are continuous in $L^1$ by dominated convergence. This proves the asserted limit. Repeated differentiation also gives $phi_q^(\( k \)) = p_k phi_q$, where $p_k$ is a polynomial of degree $k$ with leading coefficient $\( - 1 \/ q \)^k$. The nonzero leading coefficients therefore let us express every polynomial multiple of $phi_q$ as a finite linear combination of these derivatives. Such multiples lie in the same closed span.
  Put $v = q$ and $w = q \( 1 - q \)$. The ratio of the two densities is
  $ frac(phi_w \( x \), phi_v \( x \)) = sqrt(v / w) thin e^(- c x^2) \, #h(2em) c = 1 / 2 (1 / w - 1 / v) > 0 . $
  If $V$ is centered Gaussian of variance $2 c$, then $e^(- c x^2) = bb(E) cos \( V x \)$. This identity follows directly from Gaussian integration by parts: the characteristic function has value one at zero and derivative $- 2 c x$ times itself. Truncate the expectation to $\| V \| lt.eq R$. The omitted contribution has absolute value at most $bb(P) \( \| V \| > R \)$, uniformly in $x$. For fixed $R$, replace cosine by its Taylor polynomials. On $\| V \| lt.eq R$, their absolute values are bounded by $e^(R \| x \|)$, which is integrable against $phi_v \( x \) thin d x$. Dominated convergence thus approximates the truncated expectation by polynomials in $L^1 \( phi_v \( x \) thin d x \)$. Sending $R$ to infinity and using the preceding derivative argument proves the claimed closed-span property for $phi_w$.
  #emph[Step 3: test one finite approximation against the arrays.] Extend $a_(n \, j)$ by zero to $j < 0$, and let $U_n$ be the function equal to $a_(n \, j)$ on $I_(M_n \, j)$. If $B = 0$ the result is immediate, so assume $B > 0$. Given $epsilon.alt_(*) > 0$, choose one finite signed sum
  $ F = sum_(ell = 1)^L a_ell phi_q \( thin dot.op - y_ell \) \, #h(2em) parallel phi_(q \( 1 - q \)) - F parallel_1 < frac(epsilon.alt_(*), 4 B) . $
  The number of terms, the real shifts, and the real coefficients are fixed before $n$ tends to infinity. Set $A_0 = max { 1 \, sum_ell \| a_ell \| }$ and abbreviate $psi = phi_(q \( 1 - q \))$, $phi.alt_ell = phi_q \( thin dot.op - y_ell \)$. Then
  #[#set math.equation(numbering: n => "(18.3)")
   $ lr(|integral q_(M_n) U_n|) & lt.eq B parallel q_(M_n) - psi parallel_1 + B parallel psi - F parallel_1\
 & quad + sum_(ell = 1)^L \| a_ell \| (lr(|integral p_(M_n \, y_ell) U_n|) + B parallel p_(M_n \, y_ell) - phi.alt_ell parallel_1) . $ <eq:inputclock-finite-approximation>]
  For large $n$, the first $L^1$ error is below $epsilon.alt_(*) \/ \( 4 B \)$, each of the finitely many other $L^1$ errors is below $epsilon.alt_(*) \/ \( 4 B A_0 \)$, and each of the Poisson averages is below $epsilon.alt_(*) \/ \( 4 A_0 \)$. The right side is then at most $epsilon.alt_(*)$. This proves the result. The same bound proves its uniform version: the finite approximation is common to the family, the local-limit errors depend only on $M$ and the fixed shifts, and the hypothesis controls the finite list of Poisson averages uniformly. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
