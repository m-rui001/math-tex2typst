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

#align(center)[#text(size: 16pt, weight: "bold")[Projection moments, positive cap domination, \
and Riesz estimates on the sphere]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <p:introduction>

A linear projection can concentrate a measure even when the original measure has no atoms. The amount of concentration depends on how much mass can lie near the affine subspaces that a projection collapses. This paper studies that dependence for random exact projections and uses it to analyze what a finite memory state can retain from noiseless Gaussian equations.

We consider three questions. The first asks for an integrated moment of a projected density. Let $nu$ be a finite positive measure in $bb(R)^d$ whose mass on every ball of radius $r$ is at most $K r^beta$, and let $P$ be a random matrix with $k$ orthonormal rows. When $P_(\#) nu$ has density $g_P$, an integrated estimate controls the average over $P$ of $integral g_P^q$. Such an estimate measures concentration throughout the label space. Theorem 10 proves a bound with explicit dependence on the dimension, support radius, and local-mass exponent.

The second question asks for an actual positive dominating measure after a finite routing decision. Let $sigma$ be uniform probability on $S^(d - 1)$, and let $mu_B$ be $sigma$ conditioned on a spherical cap $B$. A routing rule observes a Gaussian matrix $X$ and the exact label $X s$, and selects an output $w$ with probability $K_w \( X \, X s \)$. Its average likelihood $f_w \( s \) = bb(E)_X K_w \( X \, X s \)$ weights the parent measure to $f_w mu_B$. We seek a positive sum of normalized cap measures that dominates this measure, with a controlled cost for small child radii. The positive-domination theorem in Section 4 constructs a countable such sum and bounds its cost by a power of a reference routing probability.

The third question concerns evaluation at a specified label. For a measurable function $h : S^(d - 1) arrow.r \[ 0 \, 1 \]$, the ambient Riesz functional

$ V \( h \) = sup_(z in bb(R)^d) integral h \( s \) ∥s - z∥^(- d \/ 2) thin d sigma \( s \) $

is the supremum of the raw Riesz potentials of $h sigma$ over ambient centers, and it controls mass near every center. If $h sigma$ is restricted to a ball about $z$, Section 5 estimates a Gaussian projected density at $X z + b$ for every fixed offset $b$. It uses one explicitly chosen density version for all offsets. This qualification matters: an integrated density norm is unchanged by modifications on a matrix-dependent graph, so it cannot by itself assign or bound the values on that graph.

All three estimates give a precision bound for finite-state regression. The signal is uniform on $S^(d - 1)$, and each fresh observation is a standard Gaussian feature together with its exact inner product with the signal. Write $T$ for the learner’s deterministic sample horizon. In the bit-memory model of Section 2, a learner with $M \( d \) = o \( d^2 \)$ retained bits that achieves angular error at most $epsilon.alt \( d \)$, where $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$, with average probability at least $2 \/ 3$ requires

$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

for an absolute $c > 0$ and all sufficiently large $d$, as stated in Theorem 4. The dimension threshold may depend on the memory sequence. Under the same accuracy and success requirements, the integrated projection argument also gives the explicit tradeoff

$ T gt.eq frac(c thin d log \( 1 \/ epsilon.alt \), 1 + M \/ d^2) $

for every nonnegative integer $M$ and all $d$ above an absolute threshold (Corollary 5). In particular, the same precision bound holds with absolute constants throughout $M lt.eq d^2$. The underlying success-probability bounds (17), (30), and Proposition 23 retain explicit dependence on arbitrary $M$.

=== 1.1 Projection geometry and earlier methods <projection-geometry-and-earlier-methods>

The local growth condition belongs to classical potential theory. Mattila’s work on Hausdorff dimension and orthogonal projections uses inverse-distance energy averaging and compares positive-dimensional Hausdorff measure with the existence of a measure satisfying a ball-growth bound #cite(label("Mattila1975")) Lemma 5.1, p. 236, and Theorem 5.4, p. 237. Mattila describes the potential-theoretic projection method as following Kaufman’s work #cite(label("Mattila1975")) Introduction, p. 227. Here the growth measure is supplied by a hypothesis or constructed from a cap test. The quantitative estimates require successive distances to affine spans and moments whose order grows with $d$.

Affine simplex volumes also have an established role in integral geometry. Drury’s affine-plane change of variables contains a simplex-volume Jacobian #cite(label("Drury1984")) Lemma 1, pp. 497–498. In our frame calculation, the product of successive affine heights is the volume of the associated parallelepiped, and the $k$ projected rows raise its inverse to the $k$th power. We derive that row-Jacobian and its probability normalization directly. The exact density of a rectangular block of a Haar orthogonal matrix is classical; see Jiang #cite(label("Jiang2006")) Lemma 2.5. Our derivation keeps its normalization explicit before the affine-height change of variables. Classical beta descriptions of a uniform direction projected onto a subspace are discussed by Frankl and Maehara #cite(label("FranklMaehara1990")); Lemma 1 gives the vector density and conditional direction law used here.

The regression application sits within a broader study of learning with limited retained information. Shamir’s finite-message protocols include a bounded-memory online subclass #cite(label("Shamir2014")) Section 2. Steinhardt, Valiant, and Wager related memory, communication, and statistical queries #cite(label("SVW2016")) Section 1.1; Raz subsequently proved a qualitative quadratic-memory versus exponential-sample separation for parity learning #cite(label("Raz2016")) Theorem 1. For regression, Steinhardt and Duchi established memory-dependent minimax risk bounds in a sparse noisy model #cite(label("SteinhardtDuchi2015")) Section 1.1.

Sharan, Sidford, and Valiant developed a nonuniform finite-width branching-program analysis for continuous regression. Their principal theorem concerns independent isotropic Gaussian features with independent uniform additive noise of half-width $2^(- d \/ 5)$. With at most $d^2 \/ 4$ bits of memory, success probability at least $2 \/ 3$ for a uniformly distributed unit signal, and Euclidean accuracy $d^(- r)$ in its stated range $r lt.eq O \( d \/ log d \)$, it gives an $Omega \( d log r \)$ sample bound #cite(label("SSV2019")) Theorem 1. Their projection argument expands high moments into independent copies and uses successive orthogonalization #cite(label("SSV2019")) Section 7, Lemma 12. That is a close methodological predecessor of our tuple calculations. Their lemma treats one noisy interval under a global $L^2$ density condition. The estimates here treat exact multirow labels under local ball or Riesz-potential conditions. Dagan, Kur, and Shamir obtained related quadratic-space obstructions for approximate null vectors of Gaussian rows and for empirical residual error in a different equation model #cite(label("DKS2019")) Theorems 3 and 10. These comparisons concern distinct statistical targets and observation laws.

=== 1.2 How the three arguments work <how-the-three-arguments-work>

For the integrated estimate, expand the $q$th density moment using $q$ points of the measure. The collision of their labels is controlled by the projection of the $q - 1$ differences from the first point. Successive coordinates of an orthonormal frame have ellipsoidal densities; their determinant powers telescope, leaving one nonnegative determinant power and an explicit $sqrt(d)$ scale. Gram–Schmidt converts the remaining change of variables into inverse affine heights. A tube about each preceding affine span is covered by balls, so the local mass hypothesis integrates these heights in reverse order. This proves Theorem 10.

The first application separates a Gaussian matrix into its positive radial factor and an independent orthonormal frame. The routing rule may use the whole radial factor; averaging that dependence produces weights on frame and projected label. The projected support occupies a $k$-ball. Its volume cancels the dimensional scale in the density norm and returns the same radius exponent as the incoming local-mass bound. The backward argument therefore preserves the ambient dimension through every block. Section 3 completes this route with local stopping-index counting and the common full-data bound of Section 2.

For positive cap domination, the order is different. Bounded nonnegative tests on a countable cap dictionary imply a local ball bound for a rescaled test measure. The normalized instance of the integrated theorem bounds the test of $f_w mu_B$. To turn all these inequalities into a positive dominating measure, the proof uses a weighted sum of cap densities. Finitely many caps occur at each scale and the weighted cost makes the fine-scale $L^1$ tail vanish. This gives norm compactness. Strict separation of the closed downward convex set then produces exactly the bounded tests already controlled. The resulting positive sums propagate the unnormalized joint laws of signal and state, with a separate reference probability for each parent cap.

The specified-label argument uses $q$ vectors anchored at $z$, rather than $q - 1$ differences anchored at a sampled point. Their images under the Gaussian rows have covariance equal to the anchored Gram matrix. The resulting ball-average estimate is uniform in every fixed offset. Taking a single lower-limit version and applying Fatou’s lemma on each offset graph preserves that estimate for exact densities. Operator-norm bins and radial shells then control the Riesz potential of earlier continuations. This route retains a factor of order $1 + log \( 1 \/ epsilon.alt \)$ from its shell count and a global terminal clock; its own short-run argument controls both.

The three analytic conclusions and the costs of their regression applications are compared below. Here $T$ is the deterministic sample horizon, and a stopping index is charged only where its value enters the corresponding argument.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Estimate
], table.cell(rowspan: 1, colspan: 1)[Analytic guarantee
], table.cell(rowspan: 1, colspan: 1)[Regression argument
]),
  table.cell(rowspan: 1, colspan: 1)[Integrated projection
], table.cell(rowspan: 1, colspan: 1)[A density moment integrated over the frame and label space
], table.cell(rowspan: 1, colspan: 1)[Backward local-mass propagation; stopping indices counted within each block
],
  table.cell(rowspan: 1, colspan: 1)[Positive cap domination
], table.cell(rowspan: 1, colspan: 1)[An actual dominating sum of cap measures, with weighted radius cost
], table.cell(rowspan: 1, colspan: 1)[Forward propagation of joint signal–state laws; one final sum over stopping indices
],
  table.cell(rowspan: 1, colspan: 1)[Fixed-offset density
], table.cell(rowspan: 1, colspan: 1)[One density version with a moment bound at every fixed affine offset
], table.cell(rowspan: 1, colspan: 1)[Backward Riesz-potential propagation; global terminal tags and a logarithmic shell count
],
)
]

Section 2 supplies the probability normalizations, finite-state model, Borel-kernel reduction, and common full-data endpoint. Section 3 proves the integrated estimates and their backward application; these two sections suffice for the regression consequence and the explicit memory tradeoff. Section 4 uses the normalized projection moment to construct positive dominating measures and propagate them forward. Section 5 first proves its specified-offset estimate, then develops the Riesz recurrence and its parameter argument. The cap dual constraints test averages on spherical caps; they are distinct from integration on affine subspheres.

== 2 Spherical probabilities and exact observations <p:geometry-model>

We collect the geometric facts used by all three estimates and then specify the finite-state experiment to which they will be applied. The geometric lemmas keep their normalizations visible: all measures on spheres below are probability measures, whereas densities on Euclidean label spaces are relative to Lebesgue measure unless another reference measure is stated.

=== 2.1 Coordinates and caps <coordinates-and-caps>

Write $sigma_d$ for uniform probability on the unit sphere $S^(d - 1) subset bb(R)^d$, and write $B \( z \, r \)$ for the closed Euclidean ball with center $z$ and radius $r$. When the ambient dimension is fixed we abbreviate $sigma_d$ to $sigma$. The norm is Euclidean, and $∥∥ A_(upright("op"))$ denotes the operator norm of a matrix. Constants denoted by $C$ are positive and absolute and may increase from one occurrence to the next. A subscript records any permitted additional dependence. All logarithms are natural unless a base is displayed.

#thm([Lemma 2.1.])[
  (Coordinates of a uniform direction).  #emph[Let $D gt.eq 2$ and $1 lt.eq k < D$ be integers. If $U$ is uniform on $S^(D - 1)$ and $P$ is any $k$-by-$D$ matrix satisfying $P P^(sans(T)) = I_k$, then $P U$ has Lebesgue density 
#[#set math.equation(numbering: n => "(1)")
 $ c \( D \, k \) \( 1 - ∥∥ u^2 \)^(\( D - k - 2 \) \/ 2) upright(bold(1))_({ ∥∥ u < 1 }) \, #h(2em) c \( D \, k \) = frac(Gamma \( D \/ 2 \), pi^(k \/ 2) Gamma \( \( D - k \) \/ 2 \)) . $ <p:coordinate-formula>]

 The direction of the component of $U$ in $ker P$ is uniform on its unit sphere and is independent of the pair consisting of $P U$ and the length of that complementary component. In particular, its conditional law given $P U$ is uniform.]
] <p:coordinate-density>

#proof[
  Rotation invariance reduces the projection to the first $k$ coordinates. Let $G in bb(R)^k$ and $H in bb(R)^(D - k)$ be independent standard Gaussian vectors. Then $\( G \, H \) \/ sqrt(∥∥ G^2 + ∥∥ H^2)$ is uniform on the sphere. The random variables $∥∥ G^2 \/ 2$ and $∥∥ H^2 \/ 2$ are independent unit-scale gamma variables of shapes $k \/ 2$ and $\( D - k \) \/ 2$. Changing variables from these two positive numbers to their sum and their first fraction shows that the fraction has density
  $ frac(Gamma \( D \/ 2 \), Gamma \( k \/ 2 \) Gamma \( \( D - k \) \/ 2 \)) t^(k \/ 2 - 1) \( 1 - t \)^(\( D - k \) \/ 2 - 1) \, #h(2em) 0 < t < 1 . $
  The direction of $G$ is uniform and independent of these lengths. Polar coordinates in $bb(R)^k$, with $"vol" \( S^(k - 1) \) = 2 pi^(k \/ 2) \/ Gamma \( k \/ 2 \)$, now give (1). The surface-area identity itself follows by integrating $e^(- ∥∥ x^2)$ in polar coordinates. The direction of $H$ is uniform and independent of both lengths and of $G$, which proves the conditional assertion. The event $H = 0$ is null. ◻
]

The beta distribution in this lemma is a classical description of random orthogonal projections; see Frankl and Maehara #cite(label("FranklMaehara1990")). We use the displayed derivation, including its conditional direction law.

Write $v_k$ for the Lebesgue volume of the unit ball in $bb(R)^k$. The following estimate will cancel the dimensional density scale in both projection arguments.

#thm([Lemma 2.2.])[
  (Unit-ball volume).  #emph[For every integer $k gt.eq 1$, 
#[#set math.equation(numbering: n => "(2)")
 $ v_k lt.eq \( 2 pi e \/ k \)^(k \/ 2) . $ <p:unit-ball-volume>]

]
] <p:unit-ball-volume-lemma>

#proof[
  On the ball of radius $sqrt(k)$, the function $e^(- ∥∥ z^2 \/ 2)$ is at least $e^(- k \/ 2)$. Comparing its integral there with the full Gaussian integral gives
  $ e^(- k \/ 2) k^(k \/ 2) v_k lt.eq integral_(bb(R)^k) e^(- ∥∥ z^2 \/ 2) thin d z = \( 2 pi \)^(k \/ 2) \, $
  which is the claimed bound. ◻
]

#thm([Lemma 2.3.])[
  (Spherical cap mass).  #emph[Put $n = d - 1$ for $d gt.eq 2$. There is an absolute $a > 0$ such that, for every $c in S^(d - 1)$ and $0 < r lt.eq 2$, 
#[#set math.equation(numbering: n => "(3)")
 $ \( a r \)^n lt.eq sigma #scale(x: 120%, y: 120%)[\(] B \( c \, r \) #scale(x: 120%, y: 120%)[\)] lt.eq min { 1 \, r^n } . $ <p:cap-mass-two-sided>]

 For every ambient center $z in bb(R)^d$ and radius $r > 0$, 
#[#set math.equation(numbering: n => "(4)")
 $ sigma #scale(x: 120%, y: 120%)[\(] B \( z \, r \) #scale(x: 120%, y: 120%)[\)] lt.eq min { 1 \, \( 2 r \)^n } . $ <p:ambient-cap-mass>]

 An output direction independent of the signal has probability at most $epsilon.alt^n$ of angular error at most $epsilon.alt$, averaged over $sigma$.]
] <p:cap-mass>

#proof[
  For $r lt.eq 1$, rotate $c$ to the north pole. A sphere point in $B \( c \, r \)$ has last coordinate at least $1 - r^2 \/ 2 gt.eq 1 \/ 2$. Its surface element as a graph over $c^perp$ is at most twice Lebesgue measure, and its projection lies in the $n$-ball of radius $r$. The full sphere has area at least twice the volume of the unit $n$-ball, by projecting both hemispheres. This proves the upper bound for $r lt.eq 1$; total mass one proves it for $r > 1$.
  For the lower bound when $r lt.eq 1$, the angular radius $2 arcsin \( r \/ 2 \)$ is at least $r$. In polar angle the cap mass is the integral of $sin^(n - 1) theta$ over this interval divided by its integral over $\[ 0 \, pi \]$. Use $sin theta gt.eq 2 theta \/ pi$ for $0 lt.eq theta lt.eq r$ and bound the denominator by $pi$. Since $n lt.eq 2^(n - 1)$, the result is at least $\( r \/ pi \)^n$. For $1 lt.eq r lt.eq 2$, monotonicity therefore gives the lower bound with $a = 1 \/ \( 2 pi \)$.
  If an ambient ball meets the sphere, choose $c$ in the intersection. Its sphere portion is contained in $B \( c \, 2 r \)$, proving (4); an empty intersection is immediate. Finally, angular error at most $epsilon.alt$ implies chordal error at most $epsilon.alt$, because $2 sin \( theta \/ 2 \) lt.eq theta$. Apply the sphere-centered upper bound to each fixed output and then integrate over any independent output randomization. ◻
]

=== 2.2 The finite-state regression experiment <the-finite-state-regression-experiment>

An unknown direction $s in S^(d - 1)$ is observed through independent standard Gaussian features and their exact labels:

$ X_t tilde.op N \( 0 \, I_d \) \, #h(2em) Y_t = chevron.l X_t \, s chevron.r \, #h(2em) t = 1 \, 2 \, dots.h . $

At each sample index the learner retains a state from a set of at most $2^M$ values, where $M$ is a nonnegative integer. A transition may use the current state, the entire current pair $\( X_t \, Y_t \)$, the sample index, and fresh independent randomness. Computation within the transition is unrestricted. Every piece of information depending on earlier samples that remains available later must be encoded by the finite state. The learner neither chooses a feature nor revisits an earlier one.

The learner stops after at most a prescribed integer $T gt.eq 0$ samples. Its stopping decisions obey the same information restriction. For fixed rules, its output is a unit vector whose law depends only on the terminal state and stopping index, with fresh randomness allowed. In particular, the last observed pair influences the output only through the terminal state. The sample index is available without being stored in the state; the proofs below account for the information in the stopping index.

A shared random seed may select the rules before sampling. The pair consisting of this seed and the initial finite state is jointly independent of the signal and the entire sequence of feature rows. The seed and initial state may depend on each other. Fresh transition and output randomness is independent of these variables and of initialization. Nonuniform rules may also depend on $d \, epsilon.alt$, and the sample index. This is a bit-memory model with a deterministic finite horizon.

We impose the following measurability convention. The original experiment is jointly measurable in the signal, pre-generated feature rows, shared seed, initial state, and fresh randomness, including the resulting state path, stopping index, and output. For almost every fixed shared seed, the finite vector of transition and stopping probabilities at each fixed state and index is measurable in the completion of $gamma_d \( d x \) thin d y$, where $gamma_d = N \( 0 \, I_d \)$. A rule given instead as a completed-measurable function of the current pair and an independent fresh seed is also allowed; Lemma 6 justifies this presentation. Each terminal output law is a probability measure on the Borel sphere.

For the lower bounds, let $S tilde.op sigma$ be independent of the feature rows. We call the probability of $arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt$, including all learner randomness, the #emph[uniform-sphere average success probability].

#thm([Theorem 2.4.])[
  (Finite-memory precision bound).  #emph[Let $M \( d \) = o \( d^2 \)$ be a sequence of nonnegative integers and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$. There is an absolute $c > 0$ such that, for all sufficiently large $d$, every learner in the experiment above whose uniform-sphere average success satisfies 
$ bb(P) { arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt \( d \) } gt.eq 2 / 3 $

 must use 
$ T \( d \) gt.eq c thin d log frac(1, epsilon.alt \( d \)) . $

 The dimension threshold may depend on the memory sequence. In particular, the conclusion holds when the same success probability is required separately for every $s in S^(d - 1)$.]
] <p:regression>

An every-signal guarantee implies the average guarantee by integration against $sigma$. All three proofs use the average guarantee itself. The first proof also yields a uniform dependence on the memory budget.

#thm([Corollary 2.5.])[
  (Finite-dimensional memory dependence).  #emph[There are absolute constants $c > 0$ and $d_0$ such that, for every integer $d gt.eq d_0$, every nonnegative integer $M$, and every $0 < epsilon.alt lt.eq 1 \/ 10$, a learner in the experiment above with uniform-sphere average success at least $2 \/ 3$ and deterministic finite horizon $T$ satisfies 
$ T gt.eq frac(c thin d log \( 1 \/ epsilon.alt \), 1 + M \/ d^2) . $

]
] <p:finite-memory-tradeoff>

The proof appears at the end of Section 3. In particular, the same precision bound holds with absolute constants throughout $M lt.eq d^2$ once $d$ exceeds an absolute threshold.

=== 2.3 Measurable continuations and shared randomness <measurable-continuations-and-shared-randomness>

The block arguments will start fresh executions from specified states, including states the learner never reaches. The next lemma supplies Borel rules for all such continuations while preserving the actual uniform-prior experiment. Its proof uses the marginal law of each observation pair, so it does not require a density conditional on a selected state.

#thm([Lemma 2.6.])[
  (Borel versions and counterfactual continuations).  #emph[Fix $d gt.eq 2$, finite $T$, and finite state sets. Suppose each transition and stopping probability, for each fixed state and index, is measurable in the completion of the Borel sigma field of $bb(R)^d times bb(R)$ under $lambda \( d x \, d y \) = gamma_d \( d x \) thin d y$, where $gamma_d$ is standard Gaussian probability on $bb(R)^d$. The terminal output law depends only on the terminal state and index. There are everywhere Borel probability kernels with the same state sets and output laws that induce the same uniform-prior joint law of signal, state path, stopping index, and output. For the Borel learner, starting from any state and index and supplying fresh future features defines a measurable continuation success function, whether or not that state is reachable in the original execution. The same conclusion holds when a rule is given before seed integration by a finite probability vector measurable in the completion of $lambda ⊗ kappa$, where $kappa$ is the law of an independent fresh seed.]
] <p:borel-kernels>

#proof[
  First suppose the rule includes a fresh seed of law $kappa$. Each completed-product measurable coordinate has a product-measurable version: approximate it by simple functions and replace the countably many level sets by product-measurable sets modulo null sets. Replace the resulting finite vector by a fixed point mass wherever it fails to be a probability vector. This repair occurs on a product-measurable null set. Integrating against $kappa$ now gives a Borel probability vector in the current pair, and Fubini shows agreement with the original integrated rule for $lambda$-almost every pair. It therefore suffices to consider the coordinate probabilities in the first statement.
  For each fixed state and index, combine the possible transitions and stops into a finite set of destinations, tagged as continuing or stopping. Choose Borel versions of their coordinate probabilities by the same simple-function construction. On the Borel null set where the versions fail to be nonnegative or to sum to one, replace the vector by a fixed point mass. Finitely many states and indices are involved, so all changes lie in one Borel $lambda$-null set $Z$.
  For every nonzero feature $x$, Lemma 1 gives a Lebesgue density for $chevron.l x \, S chevron.r$. Since a Gaussian feature is nonzero almost surely, every pre-generated pair $\( X_t \, chevron.l X_t \, S chevron.r \)$ has law absolutely continuous with respect to $lambda$. Thus each pair avoids $Z$ almost surely. Even if the current state depends on previous observations, the probability of being in a particular state and seeing a pair in $Z$ is bounded by the marginal probability of seeing that pair in $Z$, which is zero.
  Almost surely none of the finitely many pre-generated pairs lies in $Z$. Couple the original and modified finite destination kernels by the same fresh uniform random numbers. Induction gives identical state paths and stopping decisions; couple their unchanged terminal output laws identically as well. This proves equality of the specified joint laws. Finally, finite composition and integration of the Borel kernels against independent future features and coins defines a measurable continuation from every specified state and index, including unreachable states. ◻
]

===== 2.3.1 Convention for the three applications. <convention-for-the-three-applications.>

We first condition on a shared seed for which the model assumptions hold. The joint independence of seed and initial state from signal and feature rows ensures that the conditional initial-state law still contains no signal or sample information. We then use the Borel learner supplied by Lemma 6. The lemma need only preserve the uniform-prior law; preservation at every fixed signal is unnecessary. All bounds below are uniform in the fixed rules and are averaged over the shared seed at the end. The original conditional success probabilities are measurable in that seed because the original experiment is jointly measurable. Neither the replacement kernels nor any subsequent proof decompositions need to be selected jointly across seeds.

=== 2.4 A common full-data endpoint <a-common-full-data-endpoint>

The three moment arguments produce bounds involving $T + d$. The next elementary obstruction supplies the linear lower bound on $T$ needed to remove that additive $d$, without using any memory restriction.

#thm([Lemma 2.7.])[
  (Antipodal full-data bound).  #emph[In the experiment above, if $epsilon.alt lt.eq 1 \/ 10$ and $T lt.eq d \/ 8$, even an estimator given all $T$ features and labels has uniform-prior success probability at most $5 \/ 8$.]
] <p:haar-linear>

#proof[
  Let $F$ be the row span of the pre-generated feature matrix and put $u = P_F S$. Its dimension is $T$ almost surely, with the evident interpretation for $T = 0$. The labels determine $u$. For $T = 0$, the residual is the original uniform signal. For $T > 0$, Lemma 1, applied after fixing the feature matrix, shows that conditional on all the data the residual is $sqrt(1 - ∥∥ u^2) thin omega$, with $omega$ uniform on the unit sphere of $F^perp$. Before conditioning on the labels, isotropy gives $bb(E) ∥∥ u^2 = T \/ d$. Consequently $bb(P) { ∥∥ u^2 gt.eq 1 \/ 2 } lt.eq 2 T \/ d$.
  When $∥∥ u^2 < 1 \/ 2$, opposite residual directions give two signals at distance $2 sqrt(1 - ∥∥ u^2) > sqrt(2) > 2 epsilon.alt$. They have the same conditional law, and at most one can be within chordal distance $epsilon.alt$ of a fixed output. Angular success implies this chordal condition, so conditional success is at most $1 \/ 2$, also after averaging independent estimator randomness. Total success is at most
  $ 1 / 2 + 1 / 2 bb(P) { ∥∥ u^2 gt.eq 1 \/ 2 } lt.eq 1 / 2 + T / d lt.eq 5 / 8 . $
  Giving the estimator all pre-generated data also covers a learner that stops at a prefix, with its independent shared and fresh randomness. ◻
]

== 3 Integrated moments of orthonormal projections <p:projection>

This section answers the first question: how does a bound on the mass of every Euclidean ball control the density after a random orthonormal projection, when the label is integrated over its whole space? The proof has two geometric parts. A frame calculation expresses the cost of projecting several points through their affine Gram determinant. A covering argument then integrates that determinant using the ball-mass bound. We retain the dimensional factor in the density norm because it cancels against the projected support volume in the regression application.

For integers $1 lt.eq k < d$, let $cal(V)_(d \, k)$ be the space of $k$-by-$d$ matrices $P$ satisfying $P P^(sans(T)) = I_k$. Write $theta.alt_(d \, k)$ for the law of the first $k$ rows of a uniform orthogonal matrix. One direct construction fixes the probability normalization. For a square standard Gaussian matrix $G$, which is invertible almost surely, put $O = G \( G^(sans(T)) G \)^(- 1 \/ 2)$. Then $O$ is orthogonal. For fixed orthogonal $U \, V$, the same formula applied to $U G V$ gives $U O V$; the Gaussian law is unchanged by both multiplications. Thus the law of $O$ is a probability invariant on both sides, the Haar probability used here. Its columns can equivalently be sampled successively uniformly in the orthogonal complements of the preceding columns. To verify the equivalence, average either invariant frame law under an independent $O$; transitivity makes the averaged law independent of the initial frame. As in Section 2, $v_k$ is the unit-ball volume.

=== 3.1 The projected frame and its determinant <the-projected-frame-and-its-determinant>

We first record the classical truncated Haar density, together with the affine-height form used below. Jiang #cite(label("Jiang2006")) Lemma 2.5 records this formula and refers to earlier formulations by Diaconis, Eaton, and Lauritzen and by Eaton. We include its derivation to retain the dimensional normalization.

#thm([Lemma 3.1.])[
  (Projected frame density).  #emph[Let $k \, m gt.eq 1$ and $k + m + 1 lt.eq d$. Fix a $d$-by-$m$ matrix $E$ with orthonormal columns, and draw $P tilde.op theta.alt_(d \, k)$. The $k$-by-$m$ matrix $P E$ has Lebesgue density 
#[#set math.equation(numbering: n => "(5)")
 $ (product_(j = 0)^(m - 1) frac(Gamma \( \( d - j \) \/ 2 \), pi^(k \/ 2) Gamma \( \( d - j - k \) \/ 2 \))) det \( I_k - Z Z^(sans(T)) \)^(\( d - k - m - 1 \) \/ 2) upright(bold(1))_({ I_k - Z Z^(sans(T)) > 0 }) . $ <p:frame-density-exact>]

 Here $> 0$ means positive definite. In particular, this density is bounded by $\( C sqrt(d) \)^(k m)$.]
  #emph[If $x_1 \, dots.h \, x_(m + 1) in bb(R)^d$ are affinely independent and 
$ delta_i = "dist" #scale(x: 120%, y: 120%)[\(] x_i \, "aff" \( x_1 \, dots.h \, x_(i - 1) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 2 lt.eq i lt.eq m + 1 \, $

 then the joint Lebesgue density of the columns $P \( x_i - x_1 \)$, $2 lt.eq i lt.eq m + 1$, is bounded by 
#[#set math.equation(numbering: n => "(6)")
 $ \( C sqrt(d) \)^(k m) product_(i = 2)^(m + 1) delta_i^(- k) . $ <p:frame-difference-density>]

]
] <p:frame-density>

#proof[
  Right rotational invariance allows us to replace the fixed columns of $E$ by an independent uniform orthonormal frame. Conditional on $P$, its projection has the same law as the first $k$ coordinates of that frame. Sample the full columns successively and let $Z_j$ be the matrix of the first $k$ coordinates of its first $j$ columns. Set
  $ S_j = I_k - Z_j Z_j^(sans(T)) \, #h(2em) S_0 = I_k . $
  Given the preceding full columns, the next column is uniform on the unit sphere in their $d - j$-dimensional orthogonal complement. The coordinate map from that complement to the first $k$ coordinates has row Gram matrix $S_j$. When $S_j > 0$, multiplication by $S_j^(- 1 \/ 2)$ makes its rows orthonormal. Lemma 1 and a linear change of variables therefore give the next projected column $z$ conditional density
  $ c \( d - j \, k \) \( det S_j \)^(- 1 \/ 2) \( 1 - z^(sans(T)) S_j^(- 1) z \)^(\( d - j - k - 2 \) \/ 2) $
  on $z^(sans(T)) S_j^(- 1) z < 1$. This expression depends only on $Z_j$, so it is also the conditional density given those projected columns. The strict inequality implies $S_(j + 1) = S_j - z z^(sans(T)) > 0$ almost surely. The determinant identity
  $ det S_(j + 1) = det S_j \( 1 - z^(sans(T)) S_j^(- 1) z \) $
  shows that multiplication of the $m$ conditional densities cancels every intermediate determinant. The remaining factor is $det S_m^(\( d - k - m - 1 \) \/ 2)$, proving (5). Its exponent is nonnegative and $0 < det S_m lt.eq 1$.
  The normalizing constants have the stated scale. For a unit-scale gamma variable $G$ of shape $a = \( d - j - k \) \/ 2 > 0$, Cauchy–Schwarz and the gamma recurrence give
  $ frac(Gamma \( \( d - j \) \/ 2 \), Gamma \( \( d - j - k \) \/ 2 \)) = bb(E) G^(k \/ 2) lt.eq \( bb(E) G^k \)^(1 \/ 2) = (product_(i = 0)^(k - 1) \( a + i \))^(1 \/ 2) lt.eq d^(k \/ 2) . $
  Together with the factor $pi^(- k \/ 2)$, this bounds each $c \( d - j \, k \)$ by $\( C sqrt(d) \)^k$.
  For the last assertion, Gram–Schmidt writes $\[ x_2 - x_1 \, dots.h \, x_(m + 1) - x_1 \] = E R$, where $E$ has orthonormal columns and $R$ is triangular with $lr(|det R|) = product_(i = 2)^(m + 1) delta_i$. Right multiplication by $R$ on $k$-by-$m$ matrices has Jacobian $lr(|det R|)^k$, one factor for each row. Applying this change of variables to the preceding density proves (6). ◻
]

The product of the affine heights in (6) is $m !$ times the $m$-dimensional volume of the simplex spanned by the points. Related simplex-volume factors occur in Drury’s affine-plane Jacobian #cite(label("Drury1984")) Lemma 1, pp. 497–498. Here the exponent and normalization come from the displayed $k$-row change of variables.

=== 3.2 From local mass to an exact density norm <from-local-mass-to-an-exact-density-norm>

The local growth hypothesis below is of Frostman type, and inverse-distance averaging is a classical projection method; compare Mattila #cite(label("Mattila1975")) Lemma 5.1, p. 236, and Theorem 5.4, p. 237. We prove the quantitative affine-tube and growing-order moment bounds needed here.

#thm([Lemma 3.2.])[
  (Affine inverse distances).  #emph[Let $0 < beta lt.eq d$, $K gt.eq 0$, and $R > 0$. Let $nu$ be a finite positive Borel measure supported in $B \( z \, R \) subset bb(R)^d$ such that 
#[#set math.equation(numbering: n => "(7)")
 $ nu \( B \( b \, t \) \) lt.eq K t^beta #h(2em) \( b in bb(R)^d \, med t > 0 \) . $ <p:all-ball-mass>]

 If $F$ is an affine $j$-plane, $k gt.eq 1$ is an integer, and $beta - j - k gt.eq 1$, then $nu \( F \) = 0$ and 
#[#set math.equation(numbering: n => "(8)")
 $ integral "dist" \( x \, F \)^(- k) thin d nu \( x \) lt.eq C^d K R^(beta - k) \, $ <p:affine-inverse-bound>]

 provided $j \, k lt.eq d$.]
] <p:affine-inverse>

#proof[
  For $0 < t lt.eq R$, the projection of $B \( z \, R \)$ onto $F$ is contained in a $j$-ball of radius $R$. A maximal $t$-separated subset is a $t$-net with at most $\( 3 R \/ t \)^j$ points, by packing disjoint $j$-balls of radius $t \/ 2$. For $j = 0$, one point suffices. The corresponding ambient balls of radius $2 t$ cover the points of $B \( z \, R \)$ within distance $t$ of $F$. Thus
  #[#set math.equation(numbering: n => "(9)")
   $ nu { "dist" \( x \, F \) lt.eq t } lt.eq 3^j 2^beta K R^j t^(beta - j) . $ <p:affine-tube>]
  Because $beta - j > 0$, continuity from above as $t arrow.b 0$ gives $nu \( F \) = 0$. Distances greater than $R$ contribute at most $R^(- k) nu \( B \( z \, R \) \) lt.eq K R^(beta - k)$. On the shell $2^(- h - 1) R < "dist" \( x \, F \) lt.eq 2^(- h) R$, (9) gives a contribution at most
  $ 3^j 2^(beta + k) K R^(beta - k) thin 2^(- h \( beta - j - k \)) . $
  The sum over $h gt.eq 0$ is at most twice its first term. Since $beta \, j \, k lt.eq d$, the resulting factor is bounded by $C^d$. ◻
]

#thm([Theorem 3.3.])[
  (Integrated orthonormal-projection moment).  #emph[Let $d \, k \, q$ be integers and $beta$ a real number with $k gt.eq 1$, $q gt.eq 2$, and 
#[#set math.equation(numbering: n => "(10)")
 $ k + q lt.eq d \, #h(2em) 0 < beta lt.eq d \, #h(2em) beta - k - \( q - 2 \) gt.eq 1 . $ <p:frame-margins>]

 Let $nu$ be a finite positive Borel measure supported in $B \( z \, R \)$, $R > 0$, satisfying (7) for some $K gt.eq 0$. Assume that $P_(\#) nu$ is absolutely continuous with respect to Lebesgue measure for $theta.alt_(d \, k)$-almost every $P$. There is a jointly measurable version $g \( P \, u \)$ of its density such that 
#[#set math.equation(numbering: n => "(11)")
 $ (integral_(cal(V)_(d \, k)) integral_(bb(R)^k) g \( P \, u \)^q thin d u thin d theta.alt_(d \, k) \( P \))^(1 \/ q) lt.eq C^d \( C sqrt(d) \)^(k \( 1 - 1 \/ q \)) K R^(beta - k \( 1 - 1 \/ q \)) . $ <p:frame-moment-bound>]

 For every $P$, this version vanishes when $∥u - P z∥ > R$.]
] <p:frame-moment>

#proof[
  When $K = 0$, the measure is zero and the assertion is immediate. For $K > 0$, let $v_k$ be the unit-ball volume and define
  $ g_delta \( P \, u \) = frac(nu { x : ∥P x - u∥ lt.eq delta }, v_k delta^k) . $
  These are jointly measurable nonnegative functions. Expanding their $q$th powers and using Tonelli’s theorem expresses the integrated moment through $q$ points $x_1 \, dots.h \, x_q$ drawn from $nu$. The intersection of the $q$ label balls of radius $delta$ has volume at most $v_k delta^k$; it is empty unless $∥P \( x_i - x_1 \)∥ lt.eq 2 delta$ for $i gt.eq 2$.
  Put $delta_i = "dist" \( x_i \, "aff" \( x_1 \, dots.h \, x_(i - 1) \) \)$. Lemma 9 shows that every affine plane encountered here has zero $nu$-mass: its dimension is at most $q - 2$, so the last condition in (10) applies. Consequently the tuple is affinely independent for $nu^(⊗ q)$-almost every choice. For such a tuple, Lemma 8 applies with $m = q - 1$; the condition $k + q lt.eq d$ is exactly its determinant condition. The probability of all $q - 1$ inequalities is bounded by
  $ \( C sqrt(d) \)^(k \( q - 1 \)) product_(i = 2)^q delta_i^(- k) #scale(x: 120%, y: 120%)[\[] v_k \( 2 delta \)^k #scale(x: 120%, y: 120%)[\]]^(q - 1) . $
  The label-ball volumes cancel those in the definition of $g_delta$. Absorbing $2^(k \( q - 1 \))$ in $C$, we obtain
  #[#set math.equation(numbering: n => "(12)")
   $ integral #h(-0.16667em) #h(-0.16667em) integral g_delta^q thin d u thin d theta.alt_(d \, k) lt.eq \( C sqrt(d) \)^(k \( q - 1 \)) integral product_(i = 2)^q delta_i^(- k) thin d nu^(⊗ q) . $ <p:frame-before-integration>]
  The degenerate tuples form a null set and can be assigned an infinite upper bound in this nonnegative integral.
  Integrate first in $x_q$, then in $x_(q - 1) \, dots.h \, x_2$. At each step Lemma 9 bounds the current factor by $C^d K R^(beta - k)$. The remaining first-point mass is at most $K R^beta$. Hence the last integral in (12) is at most
  $ C^(d \( q - 1 \)) K^q R^(q beta - k \( q - 1 \)) . $
  This proves the $q$th power of (11) uniformly in $delta$.
  Define $g \( P \, u \) = liminf_(j arrow.r oo) g_(1 \/ j) \( P \, u \)$. The assumed absolute continuity and Lebesgue differentiation #cite(label("TaoMeasure2011")) Theorem 1.6.19, pp. 146–147 imply that, for almost every $P$, this is a density of $P_(\#) nu$ for almost every $u$. Fatou’s lemma on the product space #cite(label("TaoMeasure2011")) Corollary 1.4.47, p. 110 gives (11). If $∥u - P z∥ > R$, sufficiently small label balls miss $P \( B \( z \, R \) \)$, since $P$ is a contraction; the displayed version is then zero. This limiting calculation concerns the exact projected measure. It introduces no noise into an observation. ◻
]

We now spell out the two parameter choices that will be used. Their normalizations differ, even though their frame calculation is shared.

#thm([Corollary 3.4.])[
  (All-radii projection of spherical local mass).  #emph[For sufficiently large $d$, put 
$ n = d - 1 \, #h(2em) k = q = floor.l d \/ 4 floor.r \, #h(2em) beta = n - q . $

 Let $0 lt.eq f lt.eq 1$ be Borel on $S^(d - 1)$, and suppose for $K gt.eq 0$ that 
$ integral_(B \( b \, t \)) f thin d sigma lt.eq K t^beta #h(2em) \( b in bb(R)^d \, med t > 0 \) . $

 For $z in bb(R)^d$, $R > 0$, and $E = B \( z \, R \)$, the projection of $upright(bold(1))_E f sigma$ by $P tilde.op theta.alt_(d \, k)$ has a jointly measurable Lebesgue density $g \( P \, u \)$ satisfying 
#[#set math.equation(numbering: n => "(13)")
 $ ∥∥ g_(L^q \( theta.alt_(d \, k) thin d u \)) lt.eq C^d \( C sqrt(d) \)^(k \( 1 - 1 \/ q \)) K R^(beta - k \( 1 - 1 \/ q \)) . $ <p:frame-n30-bound>]

]
] <p:frame-n30>

#proof[
  Restriction preserves the stated all-ball bound. For every $P$, the projection of $sigma$ is absolutely continuous by Lemma 1, so the same holds for the restricted weighted measure. The exact margins are
  $ k + q = 2 floor.l d \/ 4 floor.r lt.eq d \, #h(2em) beta - k - \( q - 2 \) = d + 1 - 3 floor.l d \/ 4 floor.r gt.eq d \/ 4 + 1 . $
  Thus Theorem 10 applies. This also records the nonnegative frame-determinant exponent $\( d - k - q \) \/ 2 = \( d - 2 floor.l d \/ 4 floor.r \) \/ 2$. ◻
]

#thm([Theorem 3.5.])[
  (Normalized moment for unit-ball measures).  #emph[For sufficiently large $d$, put 
$ k = p = floor.l d \/ 16 floor.r \, #h(2em) lambda = \( d - 1 \) \/ 2 . $

 Let $X$ be a $k$-by-$d$ standard Gaussian matrix and define 
$ H = \( X X^(sans(T)) \)^(1 \/ 2) \, #h(2em) P = H^(- 1) X $

 on its probability-one full-row-rank event, and set $P$ to a fixed frame on the null complement. Let $m_k$ be uniform probability on the unit ball of $bb(R)^k$. Suppose $nu$ is a finite positive Borel measure fixed independently of $X$, of mass at most one, supported in the unit ball of $bb(R)^d$, such that for a fixed $D > 0$, 
$ nu \( B \( b \, t \) \) lt.eq D^d t^lambda #h(2em) \( b in bb(R)^d \, med t > 0 \) . $

 Assume $P_(\#) nu$ is absolutely continuous for almost every $X$. There is a jointly measurable nonnegative $g_X \( z \)$ such that, for almost every $X$, $P_(\#) nu \( d z \) = g_X \( z \) thin d z \/ v_k$. This version vanishes when $∥∥ z > 1$ and satisfies 
#[#set math.equation(numbering: n => "(14)")
 $ bb(E)_X integral g_X \( z \)^p thin d m_k \( z \) lt.eq exp \( C_D d p \) . $ <p:frame-positive-bound>]

]
] <p:frame-positive>

#proof[
  Right rotational invariance of $X$ makes $P$ have law $theta.alt_(d \, k)$; the independence assertion about $P \, H$ used later is proved below. The exact determinant and inverse-distance margins are
  $ k + p = 2 floor.l d \/ 16 floor.r lt.eq d \, #h(2em) lambda - k - \( p - 2 \) = frac(d - 1, 2) - 2 floor.l d \/ 16 floor.r + 2 gt.eq frac(3 d, 8) + 3 / 2 . $
  Apply Theorem 10 with $q = p$, $beta = lambda$, $K = D^d$, and $R = 1$. If $ell \( P \, z \)$ is its Lebesgue density, then $g_X \( z \) = v_k ell \( P \, z \)$ is the required normalized density. Moreover
  $ (bb(E)_X integral g_X^p thin d m_k)^(1 \/ p) = v_k^(1 - 1 \/ p) ∥ell∥_(L^p \( theta.alt_(d \, k) thin d z \)) . $
  Use the unit-ball volume estimate (2). Since $k gt.eq d \/ 32$ for sufficiently large $d$,
  $ v_k^(1 - 1 \/ p) \( C sqrt(d) \)^(k \( 1 - 1 \/ p \)) lt.eq C^d . $
  Theorem 10 now bounds the normalized $L^p$ norm by $exp \( C_D d \)$, proving (14). The density version and its support are inherited from that theorem. The mass-at-most-one and absolute-continuity hypotheses have been retained explicitly. ◻
]

=== 3.3 Radial averaging and dimension-preserving propagation <radial-averaging-and-dimension-preserving-propagation>

We next apply the all-radii estimate to the actual Gaussian data. A learner may use both the row directions and their lengths and correlations. The following factorization retains all of that radial information before averaging it into the routing weights.

#thm([Lemma 3.6.])[
  (Gaussian radial factor and frame).  #emph[Let $X$ be a $k$-by-$d$ standard Gaussian matrix with $k < d$. Almost surely, 
$ X = H P \, #h(2em) H = \( X X^(sans(T)) \)^(1 \/ 2) \, #h(2em) P = H^(- 1) X . $

 The frame $P$ has law $theta.alt_(d \, k)$ and is independent of $H$.]
] <p:radial-factor>

#proof[
  Full row rank holds almost surely because the rank-deficient matrices are the zero set of nonzero minors and the Gaussian law has a density. Right multiplication of $X$ by a fixed orthogonal matrix leaves its law unchanged, fixes $H$, and right-rotates $P$. Let $O$ be an independent uniform orthogonal matrix. For bounded measurable $phi.alt \, psi$, invariance and averaging give
  $ bb(E) \[ phi.alt \( H \) psi \( P \) \] = bb(E) #h(-0.16667em) [phi.alt \( H \) integral psi \( P O \) thin d mu \( O \)] \, $
  where $mu$ is uniform orthogonal probability. The inner integral is independent of $P$: the right action on $cal(V)_(d \, k)$ is transitive, and $mu$ is invariant. Its value is $integral psi thin d theta.alt_(d \, k)$. This factorizes the expectation for all bounded measurable tests, which proves the stated law and independence. ◻
]

#thm([Proposition 3.7.])[
  (One-block all-radii propagation).  #emph[For sufficiently large $d$, use $k = q = floor.l d \/ 4 floor.r$ and $beta = d - 1 - q$. Let $f_1 \, dots.h \, f_N : S^(d - 1) arrow.r \[ 0 \, 1 \]$ be Borel functions satisfying 
$ integral_(B \( b \, t \)) f_w thin d sigma lt.eq K t^beta #h(2em) \( b in bb(R)^d \, med t > 0 \, med 1 lt.eq w lt.eq N \) . $

 Let $Q_w \( X \, y \)$ be nonnegative Borel functions on $bb(R)^(k times d) times bb(R)^k$ with $sum_w Q_w lt.eq 1$, and define 
$ f_(upright("in")) \( s \) = bb(E)_X sum_(w = 1)^N Q_w \( X \, X s \) f_w \( s \) . $

 Then 
#[#set math.equation(numbering: n => "(15)")
 $ integral_(B \( z \, R \)) f_(upright("in")) thin d sigma lt.eq C^d N^(1 \/ q) K R^beta #h(2em) \( z in bb(R)^d \, med R > 0 \) . $ <p:haar-block-bound>]

]
] <p:haar-block>

#proof[
  Write $X = H P$ as in Lemma 13 and average the full radial dependence of the routing rule:
  $ tau_w \( P \, u \) = bb(E)_H Q_w \( H P \, H u \) . $
  These are measurable nonnegative weights with $sum_w tau_w lt.eq 1$. Independence gives the exact identity
  #[#set math.equation(numbering: n => "(16)")
   $ f_(upright("in")) \( s \) = integral sum_w tau_w \( P \, P s \) f_w \( s \) thin d theta.alt_(d \, k) \( P \) . $ <p:haar-routing>]
  Fix $E = B \( z \, R \)$, and let $g_w \( P \, u \)$ be the exact density in Corollary 11 for $upright(bold(1))_E f_w sigma$. After integrating (16) over $E$, pushforward integration yields $integral #h(-0.16667em) integral sum_w tau_w g_w thin d u thin d theta.alt_(d \, k)$. Each $g_w$ is supported in $∥u - P z∥ lt.eq R$. On this domain the measure with density $tau_w$, relative to frame probability, label Lebesgue measure, and counting measure in $w$, has total mass at most $v_k R^k$. Hölder’s inequality therefore gives
  $ integral_E f_(upright("in")) thin d sigma lt.eq \( v_k R^k \)^(1 - 1 \/ q) (sum_w integral #h(-0.16667em) #h(-0.16667em) integral tau_w g_w^q thin d u thin d theta.alt_(d \, k))^(1 \/ q) lt.eq \( v_k R^k \)^(1 - 1 \/ q) N^(1 \/ q) max_w ∥g_w∥_(L^q) . $
  Substitute (13). The radius powers add exactly to $beta$. Also $k gt.eq d \/ 8$, so (2) gives
  $ v_k^(1 - 1 \/ q) \( C sqrt(d) \)^(k \( 1 - 1 \/ q \)) lt.eq C_0^d . $
  This proves (15). The original $Q_w$ could use all entries of $H$; only after that dependence was retained did we average it into $tau_w$. ◻
]

=== 3.4 Backward propagation of continuation success <backward-propagation-of-continuation-success>

We now apply Proposition 14 to the success probability of a fresh continuation from each state. Its local-mass exponent survives every block, and the resulting finite-dimensional estimate retains the full dependence on $M$.

#thm([Proposition 3.8.])[
  (Success bound from orthonormal projections).  #emph[There are absolute constants $C gt.eq 1$ and $d_0$ such that the following holds for every integer $d gt.eq d_0$, every nonnegative integer $M$, every $0 < epsilon.alt lt.eq 1 \/ 10$, and every learner of deterministic finite horizon $T$ in Section 2. Put 
$ k = q = floor.l d \/ 4 floor.r \, #h(2em) b = ceil.l T \/ k ceil.r \, #h(2em) N_(*) = \( k + 2 \) 2^M . $

 Then 
#[#set math.equation(numbering: n => "(17)")
 $ bb(P) { upright("success") } lt.eq C^d epsilon.alt^q #scale(x: 120%, y: 120%)[\[] C^d N_(*)^(1 \/ q) #scale(x: 120%, y: 120%)[\]]^b . $ <p:haar-success>]

 The constant and dimension threshold are independent of $M \, epsilon.alt \, T$ and the learner’s rules.]
] <p:haar-success-proposition>

#proof[
  Use the fixed-seed and Borel-kernel convention of Section 2, and set $n = d - 1$ and $beta = n - q$. For each terminal state and stopping index, let $h \( s \)$ be the success probability of its signal-independent output law. The cap estimates of Lemma 3 give
  $ integral_(B \( z \, R \)) h thin d sigma lt.eq C^d min { R^n \, epsilon.alt^n } lt.eq C^d epsilon.alt^q R^beta #h(2em) \( z in bb(R)^d \, med R > 0 \) . $
  The last inequality follows from $R lt.eq epsilon.alt$ or $R gt.eq epsilon.alt$, respectively. Thus the all-radii coefficient for every terminal function is at most $K_0 = C^d epsilon.alt^q$.
  Divide the horizon into $b$ blocks of $k$ rows, padding the last block with independent rows ignored by its rules. Starting at a specified state and boundary index, define its continuation by a fresh future execution. This definition does not condition on that state being reached. The continuation functions are Borel and take values in $\[ 0 \, 1 \]$ by Lemma 6.
  Within a block, a destination is either a continuing state at the next boundary or a terminal state tagged by its local stopping index. The possible local stopping indices are $0 \, 1 \, dots.h \, k$, including an immediate stop. There are at most $\( k + 1 \) 2^M$ terminal destinations and $2^M$ continuing destinations, hence at most $N_(*)$ in total. The global stopping index is determined by the fixed block start and this local index, so the terminal output retains its full allowed dependence on time.
  Finite composition of the transition kernels produces Borel routing probabilities $Q_w \( X \, y \)$ for these destinations, with $sum_w Q_w lt.eq 1$. Their continuation functions $f_w$ use only future independent rows and coins; terminal destinations use the functions $h$ above. The incoming continuation therefore has precisely the form
  $ f_(upright("in")) \( s \) = bb(E)_X sum_w Q_w \( X \, X s \) f_w \( s \) $
  from Proposition 14. The Gaussian block is fresh: conditional on the fixed shared seed, its rows are jointly independent of the signal and entering state, which depends only on initialization, past pairs, and past coins.
  Backward induction through the blocks multiplies the all-radii coefficient by at most $C^d N_(*)^(1 \/ q)$ per block. This factor is at least one, so the coefficient also bounds any earlier terminal option. Integrate the initial continuation over $B \( 0 \, 1 \)$ and average over the conditional initial-state law, which is independent of the signal and rows. Conditional success is at most the right side of (17). The bound is uniform in the fixed rules, so the shared-seed convention gives the same bound for the original learner. When $T = 0$, the terminal bound supplies the conclusion directly. ◻
]

#proof[
  Put $L = log \( 1 \/ epsilon.alt \)$. Choose an absolute dimension threshold so that Proposition 15 applies and $k = q gt.eq d \/ 8$. If success is at least $2 \/ 3$, (17) implies
  $ q L lt.eq \( b + 1 \) d log C + b / q #scale(x: 120%, y: 120%)[\(] M log 2 + log \( k + 2 \) #scale(x: 120%, y: 120%)[\)] + log \( 3 \/ 2 \) . $
  Since $b lt.eq 8 T \/ d + 1$ and $log \( k + 2 \) \/ q$ is bounded by an absolute constant, this gives an absolute $C_1$ such that
  #[#set math.equation(numbering: n => "(18)")
   $ d L lt.eq C_1 \( T + d \) (1 + M / d^2) . $ <p:haar-memory-arithmetic>]
  No bound on $M$ was used. Lemma 7 forces $T > d \/ 8$, and hence $T + d < 9 T$. Substitution into (18) proves Corollary 5 with an absolute constant.
  Finally, if $M \( d \) = o \( d^2 \)$, then $1 + M \( d \) \/ d^2 lt.eq 2$ for all sufficiently large $d$. The corollary proves Theorem 4, with an absolute lower-bound constant and a dimension threshold that may depend on the memory sequence. This proof is uniform over the accuracy sequence and uses only within-block stopping indices. ◻
]

== 4 Positive domination by cap measures <p:cap-section>

This section proves the sample bound by propagating the joint law of the signal and each memory state forward through the stream. We bound each such law by a positive sum of uniform measures on spherical caps. A term is charged for its mass and for a power of the reciprocal of its radius. The main step shows that a block of observations increases the total charge by a controlled factor. The passage from bounds on test functions to an actual dominating measure requires compactness in the norm of $L^1$.

We prove Theorem 4 by a forward argument in the finite-state experiment of Section 2. Use that section’s fixed-seed convention and Borel kernels from Lemma 6. All bounds below are uniform in the fixed rules; their scalar probability conclusions are averaged over the shared seed at the end.

=== 4.1 The spherical experiment and the projection input <the-spherical-experiment-and-the-projection-input>

Write $sigma$ for uniform probability on $S^(d - 1)$, and set

#[#set math.equation(numbering: n => "(19)")
 $ n = d - 1 \, #h(2em) k = p = floor.l d \/ 16 floor.r \, #h(2em) alpha = lambda = n / 2 \, #h(2em) theta = 1 - 1 / p . $ <p:cap-parameters>]

We take $d$ sufficiently large that $p gt.eq 2$ and $k \, p gt.eq d \/ 32$. For $c in S^(d - 1)$ and $0 < r lt.eq 2$, define

$ B \( c \, r \) = { s in S^(d - 1) : ∥s - c∥ lt.eq r } \, #h(2em) mu_(c \, r) \( d s \) = frac(upright(bold(1))_(B \( c \, r \)) \( s \), sigma \( B \( c \, r \) \)) thin sigma \( d s \) . $

These are spherical caps and their normalized probability measures. For an ambient ball in $bb(R)^d$ we use the distinct notation $D \( b \, t \) = { u in bb(R)^d : ∥u - b∥ lt.eq t }$.

Lemma 3 supplies the two-sided estimate

#[#set math.equation(numbering: n => "(20)")
 $ \( a r \)^n lt.eq sigma \( B \( c \, r \) \) lt.eq \( A_0 r \)^n \, #h(2em) a = \( 2 pi \)^(- 1) \, quad A_0 = 1 . $ <p:cap-volume-bound>]

In particular every $mu_(c \, r)$ is well defined.

Let $X$ be a $k times d$ matrix with independent standard Gaussian entries and put

$ H = \( X X^(sans(T)) \)^(1 \/ 2) \, #h(2em) P = H^(- 1) X $

on the probability-one event that $X$ has full row rank. Define $P$ arbitrarily on the remaining null set. We may make this definition measurable. On the full-rank event $P P^(sans(T)) = I_k$ and $X = H P$; the law of $P$ is invariant under right orthogonal multiplication. Let $v_k$ be the Lebesgue volume of the unit ball of $bb(R)^k$ and let $m_k \( d z \) = v_k^(- 1) upright(bold(1))_({ ∥∥ z lt.eq 1 }) thin d z$ be uniform probability on that ball.

The use of independent replicas for high projection moments is related to the argument of Sharan, Sidford, and Valiant #cite(label("SSV2019")) Section 7, Lemma 12. We use the normalized moment theorem (Theorem 12) with the parameters in (19). Its inverse-distance margin satisfies $lambda - \( p - 2 \) - k gt.eq 3 d \/ 8$. Below we verify its unit support, mass, local-growth, independence, and absolute-continuity hypotheses for each finite positive test measure before invoking its normalized density bound.

=== 4.2 One block: from bounded tests to a dominating measure <one-block-from-bounded-tests-to-a-dominating-measure>

Fix a parent cap $B = B \( c \, r \)$. Let $cal(W)$ be a finite set and let $K_w \( X \, Y \) in \[ 0 \, 1 \]$, for $w in cal(W)$, be Borel functions of a $k times d$ matrix and a vector in $bb(R)^k$ with $sum_w K_w lt.eq 1$. Define

#[#set math.equation(numbering: n => "(21)")
 $ f_w \( s \) & = bb(E)_X K_w \( X \, X s \) \,\
q_w & = bb(E)_X integral K_w \( X \, X c + r H z \) thin d m_k \( z \) . $ <p:cap-reference-probabilities>]

The functions $f_w$ are measurable. The variables $z$ in the second line are independent of $X$ and are used only to define a reference law. The kernel still receives the full matrix $X$ and the radial factor $H$ through the displayed label. In particular, $sum_w q_w lt.eq 1$.

#thm([Proposition 4.1.])[
  (Positive domination after one block).  #emph[For each $w in cal(W)$, there are countably many caps $B \( c_i \, rho_i \)$ with $0 < rho_i lt.eq r$ and coefficients $a_i gt.eq 0$ such that 
#[#set math.equation(numbering: n => "(22)")
 $ f_w mu_(c \, r) lt.eq sum_i a_i mu_(c_i \, rho_i) \, #h(2em) sum_i a_i \( r \/ rho_i \)^alpha lt.eq exp \( C d \) q_w^theta . $ <p:cap-domination-bound>]

 The first inequality is an inequality of finite positive measures on $S^(d - 1)$: it holds after evaluating both sides on every measurable set. The constant $C$ is independent of the parent cap and of the kernels.]
] <p:cap-domination>

#proof[
  We prove a bound for nonnegative tests and then convert it into a countable positive domination.
  #emph[Cap tests and their local mass.] Put $rho_j = r 2^(- j)$ and choose a finite $rho_j \/ 2$-net $N_j$ of the sphere for every $j gt.eq 0$. Take as a dictionary the parent cap, indexed by $*$, together with all $B \( c' \, rho_j \)$, $c' in N_j$. Repetitions may have separate indices. For this countable index set $I$, write $B_i = B \( c_i \, rho_i \)$ and
  $ phi.alt_i = frac(upright(bold(1))_(B \( c_i \, rho_i \)), sigma \( B \( c_i \, rho_i \) \)) \, #h(2em) b_i = \( r \/ rho_i \)^alpha . $
  Thus $phi.alt_(*) thin d sigma = mu_(c \, r)$, every $phi.alt_i$ is a probability density, $b_(*) = 1$, and the weights at level $j$ are $2^(alpha j)$. If $h in L^oo \( sigma \)$ is nonnegative and satisfies
  #[#set math.equation(numbering: n => "(23)")
   $ integral h phi.alt_i thin d sigma lt.eq b_i #h(2em) \( i in I \) \, $ <p:cap-dual-constraints>]
  then its integral against any positive dictionary sum is at most that sum’s weighted cost. We will bound $integral h f_w thin d mu_(c \, r)$ for every such test.
  Let $nu$ be the image of $h mu_(c \, r)$ under $s mapsto \( s - c \) \/ r$. It has unit-ball support and mass at most one by the parent constraint. We claim that, for an absolute $D gt.eq 1$,
  #[#set math.equation(numbering: n => "(24)")
   $ nu \( D \( b \, t \) \) lt.eq D^d t^lambda #h(2em) \( b in bb(R)^d \, med t > 0 \) . $ <p:cap-test-ball-bound>]
  For $0 < t lt.eq 1 \/ 4$, suppose the ball meets the rescaled cap, and choose a point $s_0 in B$ whose image lies in it. The corresponding sphere points are all within $2 r t$ of $s_0$. Set
  $ j = ⌊log_2 frac(1, 4 t)⌋ \, #h(2em) rho = rho_j \; #h(2em) 4 r t lt.eq rho < 8 r t \, quad rho lt.eq r . $
  A center in $N_j$ within $rho \/ 2$ of $s_0$ gives a dictionary cap containing those points, since $2 r t + rho \/ 2 lt.eq rho$. Its constraint and the two-sided cap estimate imply
  $ nu \( D \( b \, t \) \) & lt.eq frac(sigma \( B_i \), sigma \( B \)) integral h thin d mu_(c_i \, rho_i)\
 & lt.eq \( A_0 \/ a \)^n \( rho \/ r \)^(n - alpha) lt.eq \( A_0 \/ a \)^n \( 8 t \)^lambda . $
  An empty intersection has zero mass. For $t > 1 \/ 4$, use the mass bound and $1 lt.eq 4^lambda t^lambda$. These estimates prove (24).
  #emph[The quantitative test estimate.] All hypotheses of Theorem 12 now hold for $nu$. Indeed, the test, parent cap, and measure are fixed before the fresh matrix $X$ is drawn. For every orthonormal $k$-frame $P$, the coordinate density in Lemma 1 gives $P_(\#) sigma lt.double d z$. Because $h mu_(c \, r) lt.double sigma$, its projection is also absolutely continuous, and the affine rescaling
  $ P \( \( s - c \) \/ r \) = \( P s - P c \) \/ r $
  gives the same conclusion for $P_(\#) nu$. The theorem therefore supplies a jointly measurable density satisfying, for almost every $X$,
  $ P_(\#) nu = g_X m_k \, #h(2em) g_X \( z \) = 0 upright(" for ") ∥∥ z > 1 \, #h(2em) bb(E)_X integral g_X^p thin d m_k lt.eq exp \( C_D d p \) . $
  The density is relative to $d m_k = d z \/ v_k$ on the unit ball; $D$, and hence the new constant, is absolute. Since $s = c + r u$ gives $X s = X c + r H P u$, Tonelli’s theorem and Hölder’s inequality on the product law of $X$ and $z$ yield
  #[#set math.equation(numbering: n => "(25)")
   $ integral h f_w thin d mu_(c \, r) & = bb(E)_X integral K_w \( X \, X c + r H z \) g_X \( z \) thin d m_k \( z \)\
 & lt.eq (bb(E)_X integral g_X^p thin d m_k)^(1 \/ p) (bb(E)_X integral K_w \( X \, X c + r H z \)^(p') thin d m_k)^(1 \/ p')\
 & lt.eq exp \( C d \) q_w^theta \, #h(2em) p' = p \/ \( p - 1 \) . $ <p:cap-dual-test>]
  The last line uses $0 lt.eq K_w lt.eq 1$. Thus every test satisfying (23) obeys (25).
  #emph[Representation by positive cap sums.] The geometric estimate is complete; the remaining step uses only the dictionary and its test bound. If $q_w = 0$, the feasible test $h = 1$ shows that $f_w mu_(c \, r) = 0$, and the empty sum suffices. Otherwise set $K = exp \( C d \) q_w^theta > 0$, with the constant from (25), and define in real $L^1 \( sigma \)$
  $ cal(C)_K = {sum_(i in I) a_i phi.alt_i : a_i gt.eq 0 \, med sum_i a_i b_i lt.eq K} . $
  Each series converges in $L^1$, since $b_i gt.eq 1$ and $∥phi.alt_i∥_(L^1) = 1$. This convex set is norm compact. To see this, take a sequence and choose a coefficient array for each term. A diagonal subsequence converges coefficientwise, since $0 lt.eq a_i lt.eq K \/ b_i$. The limiting array has cost at most $K$ by Fatou’s lemma. There are finitely many indices through every level $J$, and uniformly over all admissible arrays,
  #[#set math.equation(numbering: n => "(26)")
   $ ∥sum_(j > J) sum_(i upright(" at level ") j) a_i phi.alt_i∥_(L^1) = sum_(j > J) sum_(i upright(" at level ") j) a_i lt.eq K 2^(- alpha \( J + 1 \)) . $ <p:cap-compact-tail>]
  The same estimate holds for the limiting array. Finite-level convergence followed by (26) gives convergence in $L^1$. This proves sequential compactness, and hence compactness in the metric space $L^1 \( sigma \)$ #cite(label("SchnaubeltFA2025")) Section 1.3, Theorem 1.37, p. 29.
  Its signed downward closure
  $ cal(D)_K = { u in L^1 \( sigma \) : u lt.eq v upright(" a.e. for some ") v in cal(C)_K } $
  is convex, contains every nonpositive $L^1$ function, and is norm closed. In fact, if $u_m arrow.r u$ and $u_m lt.eq v_m in cal(C)_K$, compactness provides a subsequence $v_m arrow.r v in cal(C)_K$; then
  $ ∥\( u - v \)_(+)∥_(L^1) lt.eq ∥u - u_m∥_(L^1) + ∥v_m - v∥_(L^1) arrow.r 0 . $
  Put $F = f_w phi.alt_(*)$. If $F in.not cal(D)_K$, strict separation of the closed convex set $cal(D)_K$ and the compact singleton ${ F }$ #cite(label("SchnaubeltFA2025")) Section 5.2, Theorem 5.20(b), pp. 98–99 gives a continuous real functional $ell$ with
  $ ell \( F \) > sup_(u in cal(D)_K) ell \( u \) . $
  A probability measure is localizable #cite(label("FremlinTaxonomy")) Theorem 211L, so real $L^1$–$L^oo$ duality #cite(label("FremlinFunctionSpaces")) Theorem 243G(b) represents $ell \( u \) = integral h u thin d sigma$ for a real $h in L^oo \( sigma \)$. The finite supremum forces $h gt.eq 0$: if $h lt.eq - delta$ on a set $E$ of positive measure, the functions $- t upright(bold(1))_E in cal(D)_K$ would make it infinite. Define
  $ S_h = sup_i frac(integral h phi.alt_i thin d sigma, b_i) \, #h(2em) 0 lt.eq S_h lt.eq ∥∥ h_(L^oo) . $
  Then
  #[#set math.equation(numbering: n => "(27)")
   $ sup_(u in cal(D)_K) integral h u thin d sigma = K S_h . $ <p:cap-support-functional>]
  The cost bound gives the upper inequality, and the single terms $\( K \/ b_i \) phi.alt_i$ give the reverse inequality by taking the supremum over $i$. This does not require the supremum to be attained. If $S_h = 0$, the parent term gives $integral h phi.alt_(*) thin d sigma = 0$, and $0 lt.eq f_w lt.eq 1$ implies $ell \( F \) = 0$, contrary to strict separation. If $S_h > 0$, the function $h \/ S_h$ satisfies (23), so (25) again contradicts separation. Therefore $F in cal(D)_K$. An admissible series dominates its density almost everywhere; integrating gives the asserted measure inequality and cost bound. Its total mass is at most $K$. ◻
]

=== 4.3 Propagation, bounded stopping, and the accuracy endpoint <propagation-bounded-stopping-and-the-accuracy-endpoint>

The preceding proposition applies to each cap in a joint-state bound. The positivity of all measures makes the iteration linear before any estimate is taken.

#thm([Lemma 4.2.])[
  (Cost of a forward block).  #emph[Let $cal(V)$ and $cal(W)$ be finite state sets with $lr(|cal(W)|) lt.eq 2^M$. For each $v in cal(V)$, let $K_(v \, w)$ be block kernels of the type in (21), with likelihoods $f_(v \, w)$. Let $eta_v$ be finite positive measures on the sphere and suppose 
$ eta_v lt.eq sum_i a_(v \, i) mu_(c_(v \, i) \, r_(v \, i)) \, #h(2em) cal(P) = sum_(v \, i) a_(v \, i) \( 2 \/ r_(v \, i) \)^alpha < oo \, $

 where each sum is countable, $a_(v \, i) gt.eq 0$, and $0 < r_(v \, i) lt.eq 2$. Define the outgoing measures by 
$ eta'_w \( E \) = sum_v integral_E f_(v \, w) \( s \) thin eta_v \( d s \) . $

 Then the $eta'_w$ admit countable positive cap dominations whose total cost $cal(P)'$ satisfies 
#[#set math.equation(numbering: n => "(28)")
 $ cal(P)' lt.eq cal(P) exp \( C d \) 2^(M \/ p) . $ <p:cap-cost-multiplier>]

]
] <p:cap-forward-step>

#proof[
  Multiplication by a nonnegative measurable function preserves a measure inequality, as follows first for simple functions and then by monotone convergence. Summing over incoming states and cap terms therefore gives
  $ eta'_w lt.eq sum_(v \, i) a_(v \, i) f_(v \, w) mu_(c_(v \, i) \, r_(v \, i)) . $
  Apply Proposition 16 separately to every term. For a fixed incoming cap, write $q_(v \, i \, w)$ for its reference probabilities. They depend on that cap as well as on the starting state, and satisfy $sum_w q_(v \, i \, w) lt.eq 1$. Hölder’s inequality for the finite sum gives
  $ sum_w q_(v \, i \, w)^theta lt.eq lr(|cal(W)|)^(1 \/ p) (sum_w q_(v \, i \, w))^theta lt.eq 2^(M \/ p) . $
  If the outgoing terms for this parent have coefficients $beta_j$ and radii $rho_j$, their contribution to the global cost is bounded by
  $ sum_j a_(v \, i) beta_j \( 2 \/ rho_j \)^alpha & = a_(v \, i) \( 2 \/ r_(v \, i) \)^alpha sum_j beta_j \( r_(v \, i) \/ rho_j \)^alpha\
 & lt.eq a_(v \, i) \( 2 \/ r_(v \, i) \)^alpha exp \( C d \) q_(v \, i \, w)^theta . $
  Sum first over $w$ and then over the countably many incoming terms to obtain (28). Tonelli’s theorem applies throughout because every summand is nonnegative.
  At each of finitely many block boundaries there are only countably many state–cap terms. Choosing a dominating sum for each produces a deterministic proof representation, with another countable sum at the next boundary. There is no choice indexed by the random signal or by the fresh matrix. The state measures here remain unnormalized joint measures; the argument never divides them by their total masses. ◻
]

#thm([Lemma 4.3.])[
  (Terminal success under a cap).  #emph[Let $Q$ be any probability law on unit-vector outputs, independent of the signal, and put $h_Q \( s \) = Q { z : arccos chevron.l z \, s chevron.r lt.eq epsilon.alt }$ for $0 < epsilon.alt lt.eq 1 \/ 10$. For every cap $B \( c \, r \)$, 
#[#set math.equation(numbering: n => "(29)")
 $ integral h_Q thin d mu_(c \, r) lt.eq exp \( C d \) \( epsilon.alt \/ r \)^alpha . $ <p:cap-terminal-bound>]

]
] <p:cap-terminal>

#proof[
  For a fixed unit output $z$, write $theta.alt = arccos chevron.l z \, s chevron.r$. Angular success implies $∥s - z∥ = 2 sin \( theta.alt \/ 2 \) lt.eq epsilon.alt$. If $epsilon.alt < r$, Lemma 3 bounds its probability under $mu_(c \, r)$ by
  $ frac(sigma \( B \( z \, epsilon.alt \) \), sigma \( B \( c \, r \) \)) lt.eq \( A_0 \/ a \)^n \( epsilon.alt \/ r \)^n lt.eq exp \( C d \) \( epsilon.alt \/ r \)^alpha . $
  If $epsilon.alt gt.eq r$, use probability at most one and $\( epsilon.alt \/ r \)^alpha gt.eq 1$. Integration over $Q$ proves the result. ◻
]

#thm([Proposition 4.4.])[
  (A fixed stopping index).  #emph[For all sufficiently large $d$, let a learner obey the observation and information restrictions in Section 2, with $0 < epsilon.alt lt.eq 1 \/ 10$, any nonnegative integer $M$ bits of state, and horizon $T$, and let $sans(T)$ be its stopping index. For every fixed integer $0 lt.eq t lt.eq T$, 
#[#set math.equation(numbering: n => "(30)")
 $ bb(P) { sans(T) = t upright(" and ") arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt } lt.eq exp \( C d \) \( epsilon.alt \/ 2 \)^alpha [exp \( C d \) 2^(M \/ p)]^(ceil.l t \/ k ceil.r) . $ <p:cap-fixed-stop-explicit>]

 In particular, for a sequence $M \( d \) = o \( d^2 \)$ the right side is eventually at most 
#[#set math.equation(numbering: n => "(31)")
 $ exp #scale(x: 120%, y: 120%)[\(] C d \( 1 + ceil.l t \/ k ceil.r \) #scale(x: 120%, y: 120%)[\)] \( epsilon.alt \/ 2 \)^alpha \, $ <p:cap-fixed-stop-asymptotic>]

 with an absolute $C$ and a dimension threshold that may depend on the memory sequence.]
] <p:cap-fixed-stop>

#proof[
  Fix $t > 0$ throughout the argument and split its first $t$ indices into $b = ceil.l t \/ k ceil.r$ consecutive blocks of length at most $k$. At a prefinal boundary retain only paths that have not stopped and are eligible to continue. In the final block retain exactly the paths stopping at $t$, with their terminal state. For a fixed starting state and a supplied block of pairs, integrating the internal randomness gives the probability of each retained ending state. These are Borel kernels with sum at most one, since all omitted paths are discarded. A shorter block is padded by independent unused Gaussian rows, which the kernels ignore. Its likelihood for a signal $s$ is therefore $f_(v \, w) \( s \)$ of (21). Conditional on the fixed seed, the fresh Gaussian feature rows in the block are jointly independent of the signal and entering state, indeed of the signal, initialization, past rows, and past coins. Given the signal, the past affects this likelihood only through the starting state and the fixed index.
  At any counted boundary, let $eta_v \( E \)$ be the probability that $S in E$ and the path is counted in state $v$. These are unnormalized joint measures and their outgoing laws have exactly the formula in Lemma 17. Initially, $B \( c \, 2 \) = S^(d - 1)$ and $mu_(c \, 2) = sigma$. Write $V_0$ for the initial finite state. For the fixed shared seed $xi$, joint initialization independence gives
  $ eta_v^xi \( E \) = pi_xi \( v \) sigma \( E \) \, #h(2em) pi_xi \( v \) = bb(P) { V_0 = v divides xi } \, #h(2em) sum_v pi_xi \( v \) = 1 . $
  Thus the initial total cost is one before any discarded paths are removed, and at most one afterward. After $b$ applications of that lemma, the counted terminal measures admit positive cap dominations of total cost at most $\[ exp \( C d \) 2^(M \/ p) \]^b$.
  At each fixed terminal state and index $t$, the output is drawn from a fixed law using fresh randomness. Apply Lemma 18 to each term of its dominating cap sum. A term of coefficient $a$ and radius $r$ contributes at most $exp \( C d \) \( epsilon.alt \/ 2 \)^alpha a \( 2 \/ r \)^alpha$. Summing proves the conditional version of (30). At $t = 0$, use the initial domination and the same terminal estimate directly. The index has been fixed throughout, so only the at most $2^M$ states at each ending boundary were counted. No additional state is charged for the value of $t$.
  The countable dominating sums are chosen only after fixing the shared seed. The bound is uniform in that seed, so the common convention of Section 2 allows us to average the original conditional success probabilities. No measurable choice of cap decompositions across shared seeds is required. Finally, for $M \( d \) = o \( d^2 \)$ we eventually have $M \( d \) lt.eq d^2$. Since $p gt.eq d \/ 32$, the logarithm of the extra factor $2^(M \/ p)$ is then at most $32 \( log 2 \) d$. Absorbing it into the absolute exponential constant proves (31). ◻
]

We now sum the fixed-index estimate over all possible stopping times and use the common full-data bound to absorb the resulting lower-order terms.

#proof[
  Put $L = log \( 1 \/ epsilon.alt \)$.
  For the given sequence $M \( d \) = o \( d^2 \)$, use (31) in all sufficiently large dimensions. The stopping events are disjoint. Since $k gt.eq d \/ 32$, $alpha gt.eq d \/ 3$, and $ceil.l t \/ k ceil.r lt.eq t \/ k + 1$, summing over $0 lt.eq t lt.eq T$ yields
  #[#set math.equation(numbering: n => "(32)")
   $ bb(P) { upright("success") } lt.eq \( T + 1 \) exp \( C_1 d + C_2 T - d L \/ 3 \) . $ <p:cap-total-success>]
  Here $\( epsilon.alt \/ 2 \)^alpha lt.eq exp \( - d L \/ 3 \)$, and $C_1 \, C_2$ are absolute. If success is at least $2 \/ 3$, taking logarithms gives
  $ frac(d L, 3) lt.eq C_1 d + C_2 T + log \( T + 1 \) + log \( 3 \/ 2 \) lt.eq C_1 d + \( C_2 + 1 \) T + log \( 3 \/ 2 \) \, $
  since $log \( T + 1 \) lt.eq T$ for every $T gt.eq 0$. Lemma 7 also gives $T > d \/ 8$, and therefore $T gt.eq 1$. Consequently
  $ d L lt.eq 3 \( 8 C_1 + C_2 + 2 \) T . $
  This proves the claimed bound with an absolute constant, uniformly over the full accuracy range. Only the dimension at which the memory factor is absorbed may depend on the sequence $M \( d \)$. ◻
]

== 5 Riesz estimates at fixed affine offsets <p:riesz-section>

An integrated density norm does not specify the value of a density on a matrix-dependent graph of labels. We now construct a single density version whose moment is controlled at every fixed affine offset. The bound uses the supremum of ambient Riesz potentials of the original measure. We first prove this analytic estimate, then use it on distance shells to propagate finite-state continuation probabilities backward. The shell argument retains an explicit logarithmic loss.

Throughout this section, fix an integer $d gt.eq 16$ and put

#[#set math.equation(numbering: n => "(33)")
 $ k = q = floor.l d \/ 8 floor.r \, #h(2em) alpha = d \/ 2 . $ <p:riesz-parameters>]

These choices give

$ q gt.eq 2 \, #h(2em) d \/ 16 lt.eq k = q lt.eq d \/ 8 \, #h(2em) alpha - k - q gt.eq 1 \, #h(2em) d - 1 - alpha gt.eq 1 . $

The matrix $X$ will always denote a $k$ by $d$ standard Gaussian matrix. Constants denoted by $C gt.eq 1$ are absolute and may increase between uses.

=== 5.1 Ambient potentials and affine distances <ambient-potentials-and-affine-distances>

For a measurable $h : S^(d - 1) arrow.r \[ 0 \, 1 \]$, define the supremum of its ambient Riesz potentials by

#[#set math.equation(numbering: n => "(34)")
 $ V \( h \) = sup_(z in bb(R)^d) integral_(S^(d - 1)) frac(h \( s \), ∥s - z∥^alpha) thin d sigma \( s \) . $ <p:riesz-potential>]

For a measure $mu$, the raw Riesz potential is $U_alpha^mu \( z \) = integral ∥s - z∥^(- alpha) thin d mu \( s \)$ #cite(label("CalefHardin2008v1")) Section 1, p. 2. Thus $V \( h \)$ is its supremum over ambient centers for $mu = h sigma$; it is not the Riesz energy. The kernel is understood as a nonnegative extended-valued function at $s = z$. Write $B_r \( z \) = { x in bb(R)^d : ∥x - z∥ lt.eq r }$, and intersect such balls with the sphere when integrating against $sigma$.

#thm([Lemma 5.1.])[
  (Ambient potential bounds).  #emph[For every $z in bb(R)^d$ and $0 < r lt.eq 1 \/ 10$, 
#[#set math.equation(numbering: n => "(35)")
 $ sigma \( B_r \( z \) \) lt.eq C^d r^(d - 1) . $ <p:riesz-cap>]

 Every measurable $h : S^(d - 1) arrow.r \[ 0 \, 1 \]$ has finite potential. Moreover, for $0 < epsilon.alt lt.eq 1 \/ 10$, 
#[#set math.equation(numbering: n => "(36)")
 $ sup_(z in bb(R)^d) integral_(∥s - z∥ lt.eq epsilon.alt) ∥s - z∥^(- alpha) thin d sigma \( s \) lt.eq C^d epsilon.alt^(d - 1 - alpha) . $ <p:riesz-inner>]

]
] <p:riesz-potential-finite>

#proof[
  The ambient estimate (35) follows from Lemma 3, with $2^(d - 1)$ absorbed into $C^d$. For dyadic outer radii $r_m = epsilon.alt 2^(- m)$, the shell $r_m \/ 2 < ∥s - z∥ lt.eq r_m$ contributes at most $\( 2 \/ r_m \)^alpha C^d r_m^(d - 1)$. The point $s = z$ has zero $sigma$-measure, and $sum_(m gt.eq 0) 2^(- m \( d - 1 - alpha \)) lt.eq 2$. Summing proves (36). The same argument at radius $1 \/ 10$, together with the kernel bound $10^alpha$ outside that ball, proves $V \( h \) < oo$ uniformly over $0 lt.eq h lt.eq 1$. ◻
]

The potential bounds the measure of a tube around any affine subspace through an ambient center. We use that fact to integrate successive inverse distances when computing the Gaussian projection moment.

#thm([Lemma 5.2.])[
  (Inverse distance to an anchored affine space).  #emph[Let $h : S^(d - 1) arrow.r \[ 0 \, 1 \]$ be measurable, $z in bb(R)^d$, $rho > 0$, and let $F$ be an affine subspace through $z$ of dimension $ell lt.eq q - 1$. Then $F ∩ B_rho \( z \)$ has zero $h thin d sigma$ mass, and 
#[#set math.equation(numbering: n => "(37)")
 $ integral_(B_rho \( z \)) "dist" \( s \, F \)^(- k) h \( s \) thin d sigma \( s \) lt.eq C^d V \( h \) rho^(alpha - k) . $ <p:riesz-distance-bound>]

]
] <p:riesz-distance>

#proof[
  For every ambient center $c$ and radius $r > 0$, definition (34) gives
  #[#set math.equation(numbering: n => "(38)")
   $ integral_(B_r \( c \)) h thin d sigma lt.eq V \( h \) r^alpha . $ <p:riesz-ball-control>]
  Fix $0 < r lt.eq rho$. A maximal $r$-separated subset of $F ∩ B_rho \( z \)$ has at most $\( 1 + 2 rho \/ r \)^ell lt.eq \( 3 rho \/ r \)^ell$ points, by comparing disjoint radius-$r \/ 2$ balls in $F$ with the radius-$\( rho + r \/ 2 \)$ ball. It is an $r$-net. The orthogonal projection onto $F$ of any point in $B_rho \( z \)$ lies in $F ∩ B_rho \( z \)$, since $z in F$. Consequently the part of $B_rho \( z \)$ within distance $r$ of $F$ is covered by the corresponding ambient radius-$2 r$ balls. Equation (38) yields
  #[#set math.equation(numbering: n => "(39)")
   $ integral_(B_rho \( z \) ∩ { "dist" \( s \, F \) lt.eq r }) h \( s \) thin d sigma \( s \) lt.eq 3^ell 2^alpha V \( h \) rho^ell r^(alpha - ell) . $ <p:riesz-tube>]
  This includes $ell = 0$, with a one-point net. Since $alpha - ell > 0$, letting $r$ decrease to zero shows that $F ∩ B_rho \( z \)$ has zero mass.
  Every point of $B_rho \( z \)$ is within distance $rho$ of $F$. Apply (39) on the shells with outer distance $r_m = rho 2^(- m)$ and bound the inverse power there by $\( 2 \/ r_m \)^k$. Their sum is at most
  $ 3^ell 2^(alpha + k) V \( h \) rho^(alpha - k) sum_(m gt.eq 0) 2^(- m \( alpha - ell - k \)) . $
  Here $alpha - ell - k gt.eq alpha - \( q - 1 \) - k gt.eq 2$, so the series is at most $2$. Since $ell lt.eq d \/ 8$, $alpha = d \/ 2$, and $k lt.eq d \/ 8$, the remaining constant is at most $C^d$. This proves (37). ◻
]

=== 5.2 A density at fixed affine offsets <a-density-at-fixed-affine-offsets>

The next estimate uses $q$ points anchored at the chosen center $z$. Their images under each Gaussian row have an anchored Gram matrix as covariance. The inverse-distance bound just proved will integrate the negative determinant power in the joint Gaussian density.

#thm([Lemma 5.3.])[
  (Projection density at deterministic offsets).  #emph[Let $z in bb(R)^d$, $rho > 0$, let $H subset S^(d - 1) ∩ B_rho \( z \)$ be measurable, and let $h : S^(d - 1) arrow.r \[ 0 \, 1 \]$ be measurable. Fix these objects before drawing a $k$ by $d$ standard Gaussian matrix $X$. The pushforward of $h upright(bold(1))_H thin d sigma$ by $s mapsto X s$ admits a single jointly Borel function 
$ R : bb(R)^(k times d) times bb(R)^k arrow.r \[ 0 \, oo \] $

 such that $R \( X \, dot.op \)$ is its Lebesgue density for every full-row-rank $X$, and, for every fixed $b in bb(R)^k$, 
#[#set math.equation(numbering: n => "(40)")
 $ (bb(E)_X R \( X \, X z + b \)^q)^(1 \/ q) lt.eq C^d V \( h \) rho^(alpha - k) . $ <p:riesz-density-bound>]

 The same function $R$ is used for all $b$. Moreover, 
#[#set math.equation(numbering: n => "(41)")
 $ R \( X \, y \) = 0 quad upright("if") quad ∥y - X z∥ > ∥∥ X_(upright("op")) rho . $ <p:riesz-density-support>]

]
] <p:riesz-density>

#proof[
  Let $mu$ be the finite Borel measure given by $mu \( E \) = integral_E h upright(bold(1))_H thin d sigma$ on Borel subsets of the sphere. For $eta > 0$, let $B_eta^k = { u in bb(R)^k : ∥∥ u lt.eq eta }$ and let $"vol"_k$ denote $k$-dimensional Lebesgue measure. Define
  #[#set math.equation(numbering: n => "(42)")
   $ R_eta \( X \, y \) = frac(1, "vol"_k \( B_eta^k \)) integral upright(bold(1))_({ ∥X t - y∥ lt.eq eta }) thin d mu \( t \) . $ <p:riesz-ball-average>]
  The integrand is Borel in $\( X \, y \, t \)$, so the parameter integral is Borel in $\( X \, y \)$. We first prove (40) with $R_eta$ in place of $R$, uniformly in $eta$.
  Expand its $q$th moment at $X z + b$ by Tonelli’s theorem, using $t_1 \, dots.h \, t_q$ from the $q$ copies of $mu$. For a fixed tuple, the columns $X \( t_j - z \)$ form an array whose $k$ rows are independent centered Gaussian vectors with covariance
  $ G = #scale(x: 120%, y: 120%)[\(] chevron.l t_i - z \, t_j - z chevron.r #scale(x: 120%, y: 120%)[\)]_(1 lt.eq i \, j lt.eq q) . $
  If $G$ is nonsingular, their joint density is bounded everywhere by $\( 2 pi \)^(- k q \/ 2) \( det G \)^(- k \/ 2)$. Therefore the probability that all columns belong to the radius-$eta$ ball about $b$ is at most this bound times $"vol"_k \( B_eta^k \)^q$.
  The singular tuples have zero $mu^q$ mass. Indeed, at the first linearly dependent vector $t_j - z$, the point $t_j$ lies in $z + "span" \( t_1 - z \, dots.h \, t_(j - 1) - z \)$, an affine space through $z$ of dimension at most $q - 1$. Lemma 21 assigns zero $mu$ mass to it. The degeneracy set is measurable, and Fubini’s theorem applied at each $j$ proves the claim. For a nonsingular tuple, Gram–Schmidt triangularizes the matrix with columns $t_j - z$ with diagonal entries equal to the successive orthogonal distances. Taking the determinant of its Gram matrix gives
  #[#set math.equation(numbering: n => "(43)")
   $ \( det G \)^(- k \/ 2) = product_(j = 1)^q "dist" #h(-0.16667em) (t_j \, z + "span" \( t_1 - z \, dots.h \, t_(j - 1) - z \))^(- k) . $ <p:riesz-gram>]
  Integrate this product first in $t_q$, then in $t_(q - 1)$, and so on. For every nonsingular prefix, Lemma 21 bounds the next integral by $C^d V \( h \) rho^(alpha - k)$. The exceptional prefixes have zero product measure by the same degeneracy argument. It follows that the integral of (43) is at most $\( C^d V \( h \) rho^(alpha - k) \)^q$. The ball volumes cancel in the moment expansion, and the Gaussian prefactor is at most one. Thus
  $ bb(E)_X R_eta \( X \, X z + b \)^q lt.eq #scale(x: 120%, y: 120%)[\(] C^d V \( h \) rho^(alpha - k) #scale(x: 120%, y: 120%)[\)]^q $
  for every $eta > 0$ and every fixed $b$.
  Now choose the function once and for all:
  #[#set math.equation(numbering: n => "(44)")
   $ R \( X \, y \) = liminf_(m arrow.r oo) R_(1 \/ m) \( X \, y \) . $ <p:riesz-density-version>]
  It is jointly Borel. To see that it is a density, fix a full-row-rank $X$. Set $D = \( X X^(sans(T)) \)^(1 \/ 2)$ and $P = D^(- 1) X$, so $D$ is invertible, $P$ has orthonormal rows, and $X = D P$. Lemma 1 makes $P_(\#) sigma$ absolutely continuous, and the invertible map $D$ preserves absolute continuity. Since $mu lt.eq sigma$, the pushforward $X_(\#) mu$ is also absolutely continuous. The Lebesgue differentiation theorem #cite(label("TaoMeasure2011")) Theorem 1.6.19, applied to its $L^1$ density, shows that (44) equals that density almost everywhere in $y$. A Gaussian $X$ has full row rank almost surely, since each successive Gaussian row avoids the span of the preceding rows.
  For each fixed $b$, the identity $R \( X \, X z + b \) = liminf_m R_(1 \/ m) \( X \, X z + b \)$ holds by the definition of the single function $R$. Fatou’s lemma #cite(label("TaoMeasure2011")) Corollary 1.4.47 over $X$ now gives (40). These are separate moment statements for each deterministic $b$; no simultaneous almost-sure bound in $X$ over all offsets is asserted. Finally, if $∥y - X z∥ > ∥∥ X_(upright("op")) rho$, then every $X t$ with $t in H$ is at distance at least $∥y - X z∥ - ∥∥ X_(upright("op")) rho > 0$ from $y$. The averages in (42) are eventually zero, proving (41). ◻
]

The explicit choice (44) is the feature needed for the next step. A density chosen only up to a Lebesgue-null set in $y$ for each $X$ would not justify the moment estimate at the matrix-dependent point $X z + b$. An integrated $L^q \( d X thin d y \)$ estimate controls a density only up to product-null sets, while the graph $y = X z + b$ has zero product measure. Positive cap domination instead controls the measure of every Borel set by a positive sum of cap measures. Neither conclusion supplies the specified-offset moment in Lemma 22; its anchored determinant estimate and explicit limit are therefore kept as a separate argument.

=== 5.3 Continuation probabilities and the terminal potential <continuation-probabilities-and-the-terminal-potential>

We apply the specified-offset estimate to the finite-state experiment of Section 2. Fix nonnegative integers $M \, T$ and an accuracy $0 < epsilon.alt lt.eq 1 \/ 10$, and write

$ p_(upright("succ")) = bb(P) { arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt } \, #h(2em) L = log \( 1 \/ epsilon.alt \) \, #h(2em) N = ceil.l T \/ k ceil.r \, #h(2em) W = \( T + 2 \) 2^M . $

The success probability averages over the uniform signal, Gaussian features, and learner randomness. The factor $W$ will count the retained states together with their possible terminal stopping indices.

#thm([Proposition 5.4.])[
  (Riesz success estimate).  #emph[There is an absolute constant $C_0 gt.eq 1$ such that every learner just specified satisfies 
#[#set math.equation(numbering: n => "(45)")
 $ p_(upright("succ")) lt.eq B J^N \, #h(2em) B = C_0^d epsilon.alt^(thin d \/ 2 - 1) \, #h(2em) J = 1 + C_0^d \( 1 + L \) W^(1 \/ q) . $ <p:riesz-success-bound>]

 This includes $T = 0$. No asymptotic assumption on $M$ is needed for this estimate.]
] <p:riesz-success>

We first bound the potential of each terminal output law. To control its increase across a block, we apply Lemma 22 at $X z + b$ and then integrate over $b$. The factor $1 + L$ in (45) counts the distance shells and remains in the final parameter argument.

Use the fixed-seed and Borel-kernel convention of Section 2: first fix an admissible shared seed, under which the initial state is independent of the signal and rows, and then apply Lemma 6 to choose Borel rules. These rules define continuations from every state. All bounds below are uniform in the fixed rules; after proving the conditional bound, we average the original conditional success probabilities over the seed.

Complete unused rules and terminal laws arbitrarily, and force a halt by $T$. After a halt, retain a tag consisting of the stopping index and terminal state and ignore further samples. At any time there are at most $2^M$ live states and at most $\( T + 1 \) 2^M$ such tags, including a possible immediate halt. Hence the stated bound $W$ applies. Add independent unused Gaussian rows after $T$ to complete the last block of length $k$. Let $cal(V)_i$ be the state set at the boundary after block $i$, $0 lt.eq i lt.eq N$; thus $\| cal(V)_i \| lt.eq W$.

For every $v in cal(V)_i$ and $s in S^(d - 1)$, let $h_i \( v \, s \)$ be the success probability of the remaining execution started at that boundary state. This definition also applies to states not reached by the original run. At $i = N$ it is the success probability of the fixed output law associated with the terminal state. These functions are Borel and take values in $\[ 0 \, 1 \]$: the terminal assertion follows by integrating the Borel success indicator against the output law, and the assertion at earlier boundaries follows inductively from the formula below. If $X$ is a fresh $k$ by $d$ standard Gaussian matrix, then for $1 lt.eq i lt.eq N$

#[#set math.equation(numbering: n => "(46)")
 $ h_(i - 1) \( v \, s \) = bb(E)_X sum_(w in cal(V)_i) K_(v \, w)^(\( i \)) \( X \, X s \) h_i \( w \, s \) . $ <p:riesz-recursion>]

Here $K_(v \, w)^(\( i \)) \( X \, y \)$ is the probability of the block transition from $v$ to $w$ on the exact row pairs $\( X \, y \)$. These kernels are Borel, nonnegative, and sum to one in $w$ for every $\( X \, y \)$. They incorporate internal randomization and the ignored rows after a halt. The functions $h_i \( w \, dot.op \)$ are fixed independently of $X$. The fresh Gaussian block is independent of the signal, initialization, past rows, and past coins. Starting the continuation at the specified state therefore gives exactly (46); the state and boundary index contain all retained sample-dependent information.

#thm([Lemma 5.5.])[
  (Terminal potential).  #emph[Let $Q$ be a signal-independent probability law on unit-vector outputs, and let $h \( s \) = Q { u : arccos chevron.l u \, s chevron.r lt.eq epsilon.alt }$. Then 
#[#set math.equation(numbering: n => "(47)")
 $ V \( h \) lt.eq C^d epsilon.alt^(d - 1 - alpha) . $ <p:riesz-terminal>]

]
] <p:riesz-terminal-lemma>

#proof[
  Lemma 3 gives $integral h thin d sigma lt.eq epsilon.alt^(d - 1)$, also for a randomized output law. For any ambient center $z$, use $h lt.eq 1$ and (36) inside $B_epsilon.alt \( z \)$. Outside that ball, bound the kernel by $epsilon.alt^(- alpha)$ and use the total mass bound. The sum is at most $C^d epsilon.alt^(d - 1 - alpha)$ uniformly in $z$, proving (47). ◻
]

Set

$ V_i = max_(v in cal(V)_i) V \( h_i \( v \, dot.op \) \) . $

The maximum is finite by Lemma 20. Lemma 24 gives $V_N lt.eq C^d epsilon.alt^(d - 1 - alpha)$. We next estimate the contribution of a single distance shell in (46).

=== 5.4 One block and the distance shells <one-block-and-the-distance-shells>

#thm([Lemma 5.6.])[
  (One shell across a block).  #emph[For $1 lt.eq i lt.eq N$, $v in cal(V)_(i - 1)$, $z in bb(R)^d$, and $rho > 0$, let $H_rho \( z \) = { s in S^(d - 1) : rho \/ 2 < ∥s - z∥ lt.eq rho }$. Then 
#[#set math.equation(numbering: n => "(48)")
 $ integral_(H_rho \( z \)) frac(h_(i - 1) \( v \, s \), ∥s - z∥^alpha) thin d sigma \( s \) lt.eq C^d W^(1 \/ q) V_i . $ <p:riesz-shell-bound>]

]
] <p:riesz-shell>

#proof[
  For each successor $w$, use the particular density $R_w \( X \, y \)$ of Lemma 22 for the measure $h_i \( w \, dot.op \) upright(bold(1))_(H_rho \( z \)) thin d sigma$. Tonelli’s theorem, (46), and pushforward integration give
  #[#set math.equation(numbering: n => "(49)")
   $ integral_(H_rho \( z \)) frac(h_(i - 1) \( v \, s \), ∥s - z∥^alpha) thin d sigma \( s \) & lt.eq \( 2 \/ rho \)^alpha bb(E)_X integral_(bb(R)^k) sum_w K_(v \, w)^(\( i \)) \( X \, y \) R_w \( X \, y \) thin d y\
 & lt.eq \( 2 \/ rho \)^alpha bb(E)_X integral_(∥y - X z∥ lt.eq ∥∥ X_(upright("op")) rho) max_w R_w \( X \, y \) thin d y . $ <p:riesz-shell-pushforward>]
  The pushforward identity used in the first inequality holds for every full-row-rank $X$, hence almost surely. The second inequality uses the probability-vector property of $K^(\( i \))$ and (41).
  We need a deterministic integration region after averaging over $X$. Choose a sufficiently large absolute $D_0$ and partition the matrices into
  $ E_1 = { ∥∥ X_(upright("op")) lt.eq D_0 sqrt(d) } \, #h(2em) E_j = { D_0 \( j - 1 \) sqrt(d) < ∥∥ X_(upright("op")) lt.eq D_0 j sqrt(d) } quad \( j gt.eq 2 \) . $
  These bins obey
  #[#set math.equation(numbering: n => "(50)")
   $ bb(P) \( E_j \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - 4 \( j - 1 \)^2 d #scale(x: 120%, y: 120%)[\)] #h(2em) \( j gt.eq 2 \) . $ <p:riesz-bins>]
  For completeness, take $1 \/ 4$-nets on the unit spheres of $bb(R)^d$ and $bb(R)^k$. A maximal separated set has at most $9^d$ and $9^k$ points, respectively, by the disjoint-ball volume argument. Approximating each unit vector by its net point incurs an error at most $∥∥ X_(upright("op")) \/ 2$ in a bilinear form. Hence $∥∥ X_(upright("op"))$ is at most twice the largest absolute bilinear form on the two nets. Each such form is standard Gaussian, so its elementary tail bound and a union bound give
  #[#set math.equation(numbering: n => "(51)")
   $ bb(P) { ∥∥ X_(upright("op")) > t } lt.eq 2 dot.op 9^(d + k) exp \( - t^2 \/ 8 \) . $ <p:riesz-operator-tail>]
  Putting $t = D_0 \( j - 1 \) sqrt(d)$ proves (50) after increasing $D_0$, since $k lt.eq d \/ 8$.
  For every deterministic $b in bb(R)^k$, Hölder’s inequality and (40) give
  #[#set math.equation(numbering: n => "(52)")
   $ bb(E)_X #h(-0.16667em) [upright(bold(1))_(E_j) max_w R_w \( X \, X z + b \)] & lt.eq bb(P) \( E_j \)^(1 - 1 \/ q) (sum_w bb(E)_X R_w \( X \, X z + b \)^q)^(1 \/ q)\
 & lt.eq bb(P) \( E_j \)^(1 - 1 \/ q) W^(1 \/ q) C^d V_i rho^(alpha - k) . $ <p:riesz-bin-holder>]
  No conditional version of the density lemma is being used: Hölder’s inequality pays for the bin event. For a fixed matrix in $E_j$, translate $y = X z + b$ in (49); the remaining region is $∥∥ b lt.eq D_0 j sqrt(d) thin rho$. Joint measurability permits Tonelli’s theorem to integrate (52) over this deterministic ball.
  The volume of that ball is at most $C^d j^k rho^k$. Indeed, the unit-ball bound (2) gives $v_k lt.eq \( 2 pi e \/ k \)^(k \/ 2)$. Since $d \/ k lt.eq 16$, $v_k \( D_0 j sqrt(d) thin rho \)^k lt.eq C^d j^k rho^k$. Also, by $q gt.eq 2$ and (50),
  $ sum_(j gt.eq 1) j^k bb(P) \( E_j \)^(1 - 1 \/ q) lt.eq 1 + sum_(j gt.eq 2) exp #scale(x: 120%, y: 120%)[\(] k log j - 2 \( j - 1 \)^2 d #scale(x: 120%, y: 120%)[\)] lt.eq 2 . $
  For the last bound use $k log j lt.eq \( d \/ 8 \) \( j - 1 \)^2$ for $j gt.eq 2$ and sum the resulting geometric upper bound. Combining the volume and bin estimates with (49) proves (48). The powers of the shell radius cancel exactly:
  $ rho^(- alpha) rho^(alpha - k) rho^k = 1 . $
  ◻
]

#proof[
  Outside $B_epsilon.alt \( z \)$ use the shells
  $ 2^m epsilon.alt < ∥s - z∥ lt.eq 2^(m + 1) epsilon.alt \, #h(2em) m = 0 \, 1 \, dots.h . $
  For every ambient $z$, at most $C \( 1 + L \)$ of these meet the sphere. If $∥∥ z lt.eq 3$, all distances are at most $4$, giving at most $ceil.l log_2 \( 4 \/ epsilon.alt \) ceil.r$ nonempty shells. If $∥∥ z > 3$, the distances lie between $∥∥ z - 1$ and $∥∥ z + 1$, whose ratio is less than $2$; only a bounded number of dyadic shells can then meet that interval.
  Inside $B_epsilon.alt \( z \)$ use $h_(i - 1) lt.eq 1$ and (36). On each remaining shell use Lemma 25. Taking the supremum over $z$ and the maximum over $v$ gives
  #[#set math.equation(numbering: n => "(53)")
   $ V_(i - 1) lt.eq C^d epsilon.alt^(d - 1 - alpha) + C^d \( 1 + L \) W^(1 \/ q) V_i . $ <p:riesz-step>]
  Choose $C_0$ large enough that the first term here and the terminal value $V_N$ are at most $B$ in (45), and that the second coefficient is at most $J - 1$. With $U_i = max { V_i \, B }$, equation (53) gives $U_(i - 1) lt.eq J U_i$, while $U_N = B$. Hence $V_0 lt.eq B J^N$, also when $N = 0$.
  At $z = 0$ the kernel in (34) equals one on the unit sphere, so $integral h_0 \( v \, s \) thin d sigma \( s \) lt.eq V_0$ for each initial state. For almost every fixed shared seed, averaging over its conditional initial-state law preserves the bound, because that law is independent of the signal and rows. Averaging the original conditional success probabilities over the seed then preserves it again. This proves (45). ◻
]

=== 5.5 The logarithmic lower bound <the-logarithmic-lower-bound>

We now prove Theorem 4 from the Riesz success estimate. The parameter argument retains the stopping-index factor in $W$ and the shell-count factor $1 + L$. Terminal-tag counting controls both in the only case still requiring proof, namely $T < d L$.

#proof[
  There is a useful bound that counts possible terminal tags. For fixed rules as above, write $p_(upright("succ") \, upright("rule"))$ for the conditional success probability. For a tag $a$, let $f_a \( s \)$ be the probability of reaching it given $s$, and let $g_a \( s \)$ be its output law’s success probability. This output law depends only on the tag, and $0 lt.eq f_a lt.eq 1$. Lemma 3 gives $integral g_a thin d sigma lt.eq C^d epsilon.alt^(d - 1)$, including a randomized output law. Sum over at most $W$ tags to obtain
  #[#set math.equation(numbering: n => "(54)")
   $ p_(upright("succ") \, upright("rule")) = sum_a integral f_a \( s \) g_a \( s \) thin d sigma \( s \) lt.eq W C^d epsilon.alt^(d - 1) . $ <p:riesz-packing>]
  The right side is independent of the chosen rules, so averaging also gives $p_(upright("succ")) lt.eq W C^d epsilon.alt^(d - 1)$.
  Write $L = log \( 1 \/ epsilon.alt \)$. If $T gt.eq d L$, the conclusion already holds. In the remaining case $T < d L$, assume $p_(upright("succ")) gt.eq 2 \/ 3$. Taking logarithms in the averaged form of (54) gives
  $ \( d - 1 \) L lt.eq M log 2 + log \( T + 2 \) + d log C + log \( 3 \/ 2 \) . $
  For the given memory sequence, eventually $M lt.eq d^2$. Since $L gt.eq log 10$ and $T < d L$, we also have
  $ log \( T + 2 \) lt.eq log \( 2 d \) + log L lt.eq log \( 2 d \) + L $
  for large $d$. It follows that $\( d - 2 \) L lt.eq d^2 log 2 + d log C + log \( 2 d \) + log \( 3 \/ 2 \)$. Consequently, only in this remaining case,
  #[#set math.equation(numbering: n => "(55)")
   $ L lt.eq C d \, #h(2em) log W = M log 2 + log \( T + 2 \) lt.eq C d^2 . $ <p:riesz-short-run>]
  Thus the multiplier from Proposition 23 obeys
  $ log J lt.eq log 2 + d log C_0 + log \( 1 + L \) + frac(log W, q) lt.eq C d \, $
  using $q gt.eq d \/ 16$. In particular the shell-count term has been bounded rather than removed.
  Now (45) and $p_(upright("succ")) gt.eq 2 \/ 3$ imply
  #[#set math.equation(numbering: n => "(56)")
   $ \( d \/ 2 - 1 \) L lt.eq d log C_0 + N log J + log \( 3 \/ 2 \) lt.eq C d \( 1 + N \) + log \( 3 \/ 2 \) lt.eq C' \( d + T \) \, $ <p:riesz-final>]
  because $N = ceil.l T \/ k ceil.r lt.eq 16 T \/ d + 1$. The common full-data bound, Lemma 7, gives $T > d \/ 8$; hence the additive $d$ on the right of (56) is at most $8 T$. For $d gt.eq 4$ the left coefficient is at least $d \/ 4$, so $T gt.eq c thin d L$ for an absolute $c > 0$. This combines with the case $T gt.eq d L$ already separated. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
