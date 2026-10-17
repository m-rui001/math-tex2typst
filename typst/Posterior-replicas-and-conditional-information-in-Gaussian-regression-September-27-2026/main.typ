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

#align(center)[#text(size: 16pt, weight: "bold")[Posterior replicas and conditional information in Gaussian regression]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Consider an unknown unit vector $s in S^(d - 1)$ and a stream of independent Gaussian rows $X_j tilde.op N \( 0 \, I_d \)$ with exact labels $Y_j = chevron.l X_j \, s chevron.r$. If all raw observations can be retained, $d$ rows determine $s$ almost surely, because their matrix is invertible. A learner with finite persistent memory must instead replace each observed pair by an update of its state. The question is how this restriction changes the number of observations needed for a prescribed angular accuracy. Exact labels make the question particularly delicate: an individual real label has no prescribed bit precision.

We study this problem through a conditional information bound. A finite message is formed from one block of exact observations, and a separate, independent projection of the signal is then revealed to the analyst. We bound the information that remains in the message after this revelation. The projection is an analysis variable throughout; it is not available to the learner or to the rule forming the message.

=== Related memory–sample bounds <related-memorysample-bounds>

Steinhardt and Duchi established memory and communication lower bounds for noisy sparse regression, including a minimax squared-error lower bound $Omega \( sigma^2 min { k d \/ \( B n \) \, 1 } \)$ in their model with sparsity $k$, noise scale $sigma$, and $n$ observations. Here $B$ bounds memory in bits or average communication per observation #cite(label("SteinhardtDuchi2015")) Theorem 2. For learning over finite fields, Raz proved that learning a parity requires either quadratic memory or exponentially many samples, and extended the branching-program method to classes of finite learning problems defined by spectral conditions #cite(label("Raz2016")) Theorem 1#cite(label("Raz2017")) Theorem 1. These results distinguish persistent memory from unrestricted computation on a newly observed sample.

A closely related continuous regression result is due to Sharan, Sidford, and Valiant #cite(label("SSV2019")) Theorem 1 and Section 2. With Gaussian rows, independent uniform noise in $\[ - 2^(- d \/ 5) \, 2^(- d \/ 5) \]$, and at most $d^2 \/ 4$ bits, their bound is $Omega \( d log r \)$ observations for Euclidean accuracy $epsilon.alt = d^(- r)$ in the stated range $r lt.eq O \( d \/ log d \)$. Their $Omega \( d log log \( 1 \/ epsilon.alt \) \)$ consequence is stated for $epsilon.alt lt.eq d^(- Omega \( log d \))$ within that range. Their model already permits nonuniform finite-width branching programs on real-valued data. The result here concerns exact labels and $o \( d^2 \)$ memory, and gives the single-logarithmic precision cost $Omega \( d log \( 1 \/ epsilon.alt \) \)$. These memory and noise hypotheses differ: a lower bound with noisy labels alone does not imply a lower bound with exact labels, since a learner receiving exact labels can add noise itself.

Dagan, Kur, and Shamir proved quadratic-space lower bounds for finding an approximate null vector of independent Gaussian rows and for achieving small empirical residual on a random-order consistent linear system #cite(label("DKS2019")) Theorems 3 and 10. Their tasks explain another way that linear algebra can demand quadratic storage, but use different recovery criteria and observation laws from the fixed-signal stream considered here.

Two companion papers give complementary treatments of exact observations. #emph[Memory and precision in noiseless Gaussian regression] #cite(label("OpenAIMemoryPrecision2026")) Theorem 1.2 obtains the same precision scale for every fixed $A > 0$ and memory $M lt.eq A d^2$, with a constant depending on $A$, by propagating bounds on future success backward through blocks. #emph[Replacing Gaussian observations in memory-constrained inference] #cite(label("OpenAIReplacing2026")) Proposition 7.1 and Lemma 7.2 develops a conditional-information comparison based on a finite two-point fiber measure. The present paper instead develops the multi-replica block comparisons stated below and proves its streaming consequence from them.

=== Conditional information from one block <conditional-information-from-one-block>

Let $sigma_d$ denote uniform probability on $S^(d - 1)$. In a block experiment, the signal $S$ has law $p = f sigma_d$, where $f$ is a bounded nonnegative Borel density. Independently draw a standard Gaussian matrix $A$, and observe $\( A \, A S \)$. A finite-valued message $W$ is drawn from a measurable kernel of these data, conditionally independently of $S$. Finally draw a standard Gaussian matrix $B$ independently of the entire experiment producing $\( S \, A \, A S \, W \)$. Our principal quantity is

$ I \( S \; W divides B \, B S \) . $

All logarithms and entropies below are in nats.

#thm([Theorem 1.1.])[
  (Gaussian replica block bound).  #emph[For all sufficiently large $d$, set 
$ k = 2 floor.l d \/ 16 floor.r \, #h(2em) m = k \, #h(2em) t = m + 1 \, #h(2em) ell = 4 k . $

 Suppose $p = f sigma_d$ is a probability with $0 lt.eq f lt.eq L < oo$. In the block experiment above, let $A$ have $k$ rows and let $B$ have $ell$ rows. There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(1)")
 $ I \( S \; W divides B \, B S \) lt.eq frac(H \( W \), t) + C d + C log \( 2 + log L \) . $ <eq:gaussian-block>]

 The bound is uniform over the prior, the density bound $L$, and the message kernel. The labels used to produce $W$ are the exact values $A S$.]
] <thm:gaussian-block>

The entropy cost is divided by a number $t$ proportional to $d$. The weak dependence on $L$ matters when the theorem is applied to a streaming state: conditioning a uniform signal on a state value $v$ of probability $p_v > 0$ gives a density at most $1 \/ p_v$. Rare states may therefore have large density bounds, even when their average information cost is small.

The proof couples several possible signals with the same observed data. Given $\( A \, A S \)$, draw $S_1 \, dots.h \, S_t$ independently from the posterior, independently also of $W$ given the data. Each pair $\( S_i \, W \)$ has the original signal–message law. The replicas are dependent after the data are forgotten: they satisfy $A S_1 = dots.h.c = A S_t$ for the common hidden matrix. Write $K$ for the relative entropy of their joint law from $p^(⊗ t)$, and $K'$ for the corresponding relative entropy of $\( B S_1 \, dots.h \, B S_t \)$ from the product of its marginals, conditional on $B$. These are their total correlations before and after projection. Lemma 13 gives

$ t I \( S \; W divides B \, B S \) lt.eq H \( W \) + K - K' . $

Thus the proof must bound the #emph[loss] of correlation. Bounding $K$ alone would discard the geometric dependence still visible to the analyst.

The exact-label geometry supplies the comparison. For the difference matrix $D = \[ S_2 - S_1 \, dots.h \, S_t - S_1 \]$, the replica likelihood contains $det \( D^(sans(T)) D \)^(- k \/ 2)$. Theorem 15 identifies the underlying finite measure, including its normalization and density values on the constraint. An observable test of the projected replicas supplies a matching inverse-volume term. Section 4 then bounds the remaining projection-density ratio by a dyadic decomposition, proving Theorem 1.

=== A streaming consequence <a-streaming-consequence>

The learner receives the fresh pairs $\( X_j \, Y_j \)$ in order, cannot choose the rows, and cannot revisit them. At each index it has at most $2^M$ persistent states. Its transition and stopping rules may be arbitrary measurable randomized functions of the current state and current pair; all information retained for later indices must be in the state. It stops at some $tau in { 0 \, dots.h \, T }$ for a prescribed deterministic horizon $T$. Its unit-vector output uses only the terminal state, the rule at index $tau$, and fresh randomness. Thus the final observation affects the output only through that state. Rules may depend on the index, dimension, and target accuracy. Shared randomness and initialization are jointly independent of the signal and samples, and fresh random choices are independent before use. The entire experiment is required to be jointly measurable. Definition 3 records the full model and the completed-measurability convention.

#thm([Theorem 1.2.])[
  (Uniform-prior sample lower bound).  #emph[Let $M \( d \) = o \( d^2 \)$ be nonnegative integer-valued, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$. Suppose a family of learners in Definition 3 satisfies 
$ bb(P) { arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt \( d \) } gt.eq 2 / 3 #h(2em) upright("when ") S tilde.op sigma_d \, $

 where the probability includes the signal, samples, and learner randomness. Then there is an absolute $c > 0$ such that 
$ T \( d \) gt.eq c thin d log frac(1, epsilon.alt \( d \)) $

 for all sufficiently large $d$. The eventual threshold may depend on the memory sequence.]
] <thm:streaming>

The theorem assumes success averaged over the uniform sphere. A guarantee of success at least $2 \/ 3$ for every fixed signal implies that hypothesis by integration, so the same lower bound holds for such learners. Section 6 proves the result by conditioning on the current state, applying a block estimate, and averaging its prior cost. The independent projection leaves a residual sphere of dimension proportional to $d$; accurate recovery still requires order $d log \( 1 \/ epsilon.alt \)$ conditional information on that sphere.

=== Information and geometric comparisons <information-and-geometric-comparisons>

The total-correlation argument uses Watanabe’s measure of multivariate dependence #cite(label("Watanabe1960")) and its general probability-space chain rules #cite(label("Austin2020")) Sections 3.3 and 6. Posterior resampling preserves the joint law with the observed data, as in the general Nishimori identity recorded by Lelarge and Miolane #cite(label("LelargeMiolane2019")) Proposition 16. Here its role is to preserve the signal–message pair law while introducing dependence among replicas. The projected tests use the relative-entropy variational principle; a convenient statement is #cite(label("DupuisMao2022")) Equations (1.1)–(1.2). The equal-label measure is related to coarea #cite(label("Federer1959")) Theorem 3.1 and to affine simplex-volume changes of variables #cite(label("Drury1984")) Lemma 1. We prove the Gaussian probability normalization and the required evaluations at constrained labels directly. Thus these classical tools provide the background for the exact-fiber calculation, rather than an unproved formula for its particular probability law.

The subsequent comparisons retain different information from that geometry. For a prior density at most $e^b$, Theorem 21 uses $q = floor.l d \/ 8 floor.r$ replicas and gives the alternative cost $H \( W \) \/ q + C \( d + b \/ d \)$. Its test records successive simplex heights in distance bins and compares the observed bin with a mixture over fixed bins. The direct linear dependence on $b$ makes averaging over state values immediate. The other routes use different comparison laws: Table 1 records their geometric inputs and the state information fixed during iteration. Each route verifies its own normalization and exceptional sets. They offer distinct tests and ways to average the prior cost, rather than a succession of stronger asymptotic sample bounds.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Comparison
], table.cell(rowspan: 1, colspan: 1)[Geometric identity
], table.cell(rowspan: 1, colspan: 1)[Projected comparison
], table.cell(rowspan: 1, colspan: 1)[Conditioning
]),
  table.cell(rowspan: 1, colspan: 1)[Gaussian selector
], table.cell(rowspan: 1, colspan: 1)[Spherical equal-label measure
], table.cell(rowspan: 1, colspan: 1)[Normalized determinant likelihood
], table.cell(rowspan: 1, colspan: 1)[Current state
],
  table.cell(rowspan: 1, colspan: 1)[Distance bins
], table.cell(rowspan: 1, colspan: 1)[Spherical equal-label measure
], table.cell(rowspan: 1, colspan: 1)[Fixed mixture of height bins
], table.cell(rowspan: 1, colspan: 1)[Current state
],
  table.cell(rowspan: 1, colspan: 1)[Haar frame
], table.cell(rowspan: 1, colspan: 1)[Successive Haar height insertion
], table.cell(rowspan: 1, colspan: 1)[Distance distribution functions
], table.cell(rowspan: 1, colspan: 1)[Current state
],
  table.cell(rowspan: 1, colspan: 1)[Synthetic Gaussian
], table.cell(rowspan: 1, colspan: 1)[Spherical and Gaussian equal-label measures
], table.cell(rowspan: 1, colspan: 1)[Projected-prior likelihood with random covariance
], table.cell(rowspan: 1, colspan: 1)[Full history
],
  table.cell(rowspan: 1, colspan: 1)[Stiefel incidence
], table.cell(rowspan: 1, colspan: 1)[Regular-incidence coarea
], table.cell(rowspan: 1, colspan: 1)[Conditional product law and density ratio
], table.cell(rowspan: 1, colspan: 1)[Full history
],
)
]],
  caption: [Table 1: The five block comparisons. The last column records the information conditioned on before applying a block estimate. Every streaming proof also uses a residual-sphere endpoint as in Section 2. ],
)

One complete route occupies Sections 2–6. Section 2 supplies the learner reductions and the residual-sphere information requirement. Section 3 establishes the replica inequality, exact equal-label measure, and logarithmic integrability. Sections 4 and 5 prove the two block estimates, and Section 6 gives their current-state iterations. The final three sections develop the other geometric comparisons and their streaming applications; the synthetic and incidence iterations condition on full state histories. All applications use the same exact-row, finite-state, deterministic-horizon learner model.

== 2 Finite states and the information required at the endpoint <sec:model-endpoint>

The block estimates will bound information in a state after an independent projection is known. After specifying the learner model, we show why an accurate state must still carry order $d log \( 1 \/ epsilon.alt \)$ information in that experiment. We also record the reductions for randomized rules, rare states, and bounded stopping, so that later applications need only specify their block dimensions and their way of charging the clock.

=== 2.1 Finite-state learners <finite-state-learners>

#prodef([Definition 2.1.])[
  (Finite-state noiseless regression).  An unknown unit vector $s in S^(d - 1)$ is fixed before sampling. At index $j gt.eq 1$ the learner receives
  $ X_j tilde.op N \( 0 \, I_d \) \, #h(2em) Y_j = chevron.l X_j \, s chevron.r \, $
  where the $X_j$ are independent. It cannot choose a row or revisit an earlier one. At each index its persistent state has at most $2^M$ values. Its transition and stopping rule may be any measurable randomized kernel of the current state and the entire current pair $\( X_j \, Y_j \)$. Computation within a transition is unrestricted, and every piece of information retained for later indices must be in the finite state.
  The learner stops at an index $tau in { 0 \, dots.h \, T }$, where the integer $T$ is a prescribed deterministic horizon. Its unit-vector output is drawn using only the terminal state, the rule at index $tau$, and fresh randomness. In particular, the last observation can affect the output only through the terminal state. Rules may depend on $d$, the target accuracy, and the index, and may be selected by a shared random seed. The initial state and that seed are jointly independent of the signal and the entire sample sequence. Fresh transition and output random variables may also be used; each is independent of that pair, the signal, the sample sequence, and all earlier fresh random variables before it is used. Memory is measured in bits, not real registers.
  The construction from the signal, pre-generated sample rows, shared seed, initialization, and fresh transition and output randomness through the state path, stopping index, and output must form a jointly measurable probability experiment. Per-seed measurability of the sample kernels alone is not a definition of the mixture over seeds.
] <def:streaming-model>

For each fixed seed, the transition and stopping coordinates may be measurable in the completion of the Borel sigma field under $lambda \( d x \, d y \) = gamma_(1 \, d) \( d x \) thin d y$ on $bb(R)^d times bb(R)$, where $gamma_(1 \, d)$ is standard Gaussian probability on $bb(R)^d$. Lemma 8 supplies Borel versions for the fixed-seed uniform-prior experiment. The original randomized experiment must still be jointly measurable as stated in the definition.

=== 2.2 Spherical caps and residual fibers <spherical-caps-and-residual-fibers>

#thm([Lemma 2.2.])[
  (Spherical balls).  #emph[Let $sigma_q$ be uniform probability on $S^(q - 1)$, where $q gt.eq 2$. For every $z in S^(q - 1)$ and $r > 0$, 
#[#set math.equation(numbering: n => "(2)")
 $ sigma_q { u : lr(bar.v.double u - z bar.v.double) lt.eq r } lt.eq r^(q - 1) . $ <eq:spherical-ball>]

 In particular an angular cap of radius $0 < epsilon.alt lt.eq pi$ has mass at most $epsilon.alt^(q - 1)$.]
] <lem:spherical-ball>

#proof[
  For $r lt.eq 1$, rotate $z$ to the north pole. A point in the chordal ball has last coordinate at least $1 - r^2 \/ 2 gt.eq 1 \/ 2$. As a graph over its first $q - 1$ coordinates, the surface has area element at most twice Lebesgue measure, and its projection lies in the $\( q - 1 \)$-ball of radius $r$. The whole sphere has area at least twice the volume of the unit $\( q - 1 \)$-ball, by projecting both hemispheres. This proves (2). For $r > 1$, total mass one suffices. Angular distance at most $epsilon.alt$ implies chordal distance $2 sin \( epsilon.alt \/ 2 \) lt.eq epsilon.alt$, proving the last assertion. ◻
]

#thm([Lemma 2.3.])[
  (Residual sphere and radius bounds).  #emph[Let $S tilde.op sigma_d$ and let $G$ be independent of $S$, with $b$ rows, where $0 lt.eq b lt.eq d - 2$. For $b gt.eq 1$, let $G$ be either a standard Gaussian matrix or a uniform Haar frame of $b$ orthonormal rows in $bb(R)^d$. For $b = 0$, interpret $G$ and $G S$ as empty. Conditional on $\( G \, G S \)$, the signal is uniform on an affine sphere parallel to $ker G$, with ambient kernel dimension $d - b$ and radius 
$ R = lr(bar.v.double P_(ker G) S bar.v.double) . $

 For $b = 0$, this is the original unit sphere and $R = 1$ deterministically. For $1 lt.eq b lt.eq d - 2$, the squared radius has distribution 
#[#set math.equation(numbering: n => "(3)")
 $ R^2 tilde.op "Beta" #scale(x: 120%, y: 120%)[\(] \( d - b \) \/ 2 \, b \/ 2 #scale(x: 120%, y: 120%)[\)] . $ <eq:residual-beta>]

 For $0 < r_0 < 1$ one has 
#[#set math.equation(numbering: n => "(4)")
 $ bb(P) { R < r_0 } lt.eq frac(b, d \( 1 - r_0^2 \)) . $ <eq:residual-markov>]

 When $0 lt.eq b lt.eq d \/ 2$, two useful bounds at radius $1 \/ 2$ are 
#[#set math.equation(numbering: n => "(5)")
 $ bb(P) { R < 1 \/ 2 } lt.eq frac(8, d + 2) \, #h(2em) bb(P) { R < 1 \/ 2 } lt.eq 90 / d . $ <eq:residual-chebyshev>]

 The second inequality also follows directly from two Gaussian norm estimates, without using the beta variance.]
] <lem:residual-sphere>

#proof[
  The zero-row case is immediate: conditioning on empty data changes nothing, and the residual radius is one. It does not involve a beta law with a zero shape parameter.
  Suppose $b gt.eq 1$. The matrix is full row rank almost surely in the Gaussian case and by definition in the Haar case. For fixed $G$, write $S = Z \/ lr(bar.v.double  bar.v.double) Z$ with $Z$ standard Gaussian and split $Z$ into the row space of $G$ and its kernel. The squared lengths are independent chi-squares with $b$ and $d - b$ degrees of freedom. Their normalized ratio gives (3); the direction in the kernel is independent and uniform. Given the projection, its row-space component is fixed, so the remaining signal is uniform on the asserted affine sphere. Its radius has
  $ bb(E) R^2 = frac(d - b, d) \, #h(2em) "Var" \( R^2 \) = frac(2 b \( d - b \), d^2 \( d + 2 \)) . $
  These formulas also hold for the deterministic zero-row radius. Markov’s inequality applied to $1 - R^2$, whose mean is $b \/ d$, proves (4). If $b lt.eq d \/ 2$, the mean of $R^2$ is at least $1 \/ 2$ and its variance is at most $1 \/ \( 2 \( d + 2 \) \)$. Chebyshev’s inequality at distance $1 \/ 4$ from the mean gives the first bound in (5).
  For the second bound, still with $b lt.eq d \/ 2$, let $Z_ker$ be the kernel component of $Z$. Its squared norm has mean $d - b gt.eq d \/ 2$ and variance at most $2 d$, while $lr(bar.v.double  bar.v.double) Z^2$ has mean $d$ and variance $2 d$. Chebyshev gives
  $ bb(P) { lr(bar.v.double Z_ker bar.v.double)^2 < d \/ 3 } lt.eq 72 / d \, #h(2em) bb(P) { lr(bar.v.double  bar.v.double) Z^2 > 4 d \/ 3 } lt.eq 18 / d . $
  Outside these events $R^2 gt.eq 1 \/ 4$. Their union gives $90 \/ d$. For $b = 0$ the probability is zero, as already established. ◻
]

The next estimate tests success against a law in which the signal and output are conditionally independent. This is the binary-relative-entropy event method; see Bassily et al. #cite(label("BassilyEtAl2018")) Appendix A.1, Lemmas 14–15 for finite-space information bounds. Here the reference signal lies on a residual sphere.

#thm([Lemma 2.4.])[
  (Information on a residual sphere).  #emph[Let $S tilde.op sigma_d$, let $V$ be a random variable with values in a standard Borel space, jointly distributed with $S$, and let $G$ be independent of $\( S \, V \)$, with $0 lt.eq b lt.eq d - 2$ rows. For $b gt.eq 1$, $G$ may be either a standard Gaussian matrix or a uniform Haar frame of $b$ orthonormal rows; at $b = 0$ it is empty. Let $hat(S) in S^(d - 1)$ be generated from $V$ by a kernel conditionally independent of $\( S \, G \)$. Write 
$ p = bb(P) { arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt } \, #h(2em) R = lr(bar.v.double P_(ker G) S bar.v.double) . $

 For $2 epsilon.alt < r_0 lt.eq 1$, if $alpha := p - bb(P) { R < r_0 } > 0$, then 
#[#set math.equation(numbering: n => "(6)")
 $ I \( S \; V divides G \, G S \) gt.eq alpha \( d - b - 1 \) log frac(r_0, 2 epsilon.alt) - log 2 . $ <eq:residual-information>]

]
] <lem:residual-information>

#proof[
  Put $Z = \( G \, G S \)$. Compare the true law of $\( S \, V \, Z \)$ with $P_Z P_(S divides Z) P_(V divides Z)$, and in both laws generate $hat(S)$ using the same kernel from $V$. Adding that kernel preserves the divergence, which is $I \( S \; V divides Z \)$.
  Fix side data with residual radius $R gt.eq r_0$ and fix an output. If the set of successful points on the fiber is nonempty, choose one such point. Angular success implies Euclidean distance at most $epsilon.alt$ from the output, so any two successful fiber points are at Euclidean distance at most $2 epsilon.alt$. After translating and rescaling the fiber to its unit sphere, the successful set therefore lies in a chordal ball of radius $2 epsilon.alt \/ R lt.eq 2 epsilon.alt \/ r_0 < 1$ centered on that sphere. By Lemma 4, its conditional mass is at most $\( 2 epsilon.alt \/ r_0 \)^(d - b - 1)$. Under the comparison law, the output and signal are conditionally independent given $Z$, so the event of success and $R gt.eq r_0$ has probability at most this quantity. Under the true law it has probability at least $alpha$.
  For Bernoulli probabilities $a \, c$, relative entropy obeys
  $ D_(upright("KL")) \( "Bern" \( a \) bar.v.double "Bern" \( c \) \) gt.eq a log \( 1 \/ c \) - log 2 \; $
  this follows by dropping the nonnegative term $\( 1 - a \) log \( 1 \/ \( 1 - c \) \)$ and using binary entropy at most $log 2$. Apply data processing to the event just described. If the comparison probability is zero the conclusion is immediate; otherwise its upper bound and the true lower bound give (6). ◻
]

We record three numerical forms used below. The first uses an angular cap bound: a chordal radius $4 epsilon.alt$ corresponds to angular radius $2 arcsin \( 2 epsilon.alt \) lt.eq 5 epsilon.alt$ for $epsilon.alt lt.eq 1 \/ 10$.

#thm([Corollary 2.5.])[
  (Three endpoint substitutions).  #emph[Assume $0 < epsilon.alt lt.eq 1 \/ 10$ in Lemma 6. For sufficiently large $d$ the following bounds hold.]
  + #emph[If $G$ is Gaussian, $p gt.eq 3 \/ 5$, and $0 lt.eq b lt.eq d \/ 2$, the beta-variance bound (with the separate deterministic case at $b = 0$) and the angular cap just described give 
#[#set math.equation(numbering: n => "(7)")
 $ I \( S \; V divides G \, G S \) gt.eq 1 / 2 \( d - b - 1 \) log frac(1, 5 epsilon.alt) - log 2 . $ <eq:endpoint-gaussian>]

]
  + #emph[If $G$ is a Haar frame, $p gt.eq 2 \/ 3$, and $b = floor.l d \/ 4 floor.r$, Markov’s bound $bb(P) { R < 1 \/ 2 } lt.eq 4 b \/ \( 3 d \) lt.eq 1 \/ 3$ gives 
#[#set math.equation(numbering: n => "(8)")
 $ I \( S \; V divides G \, G S \) gt.eq 1 / 3 \( d - b - 1 \) log frac(1, 4 epsilon.alt) - log 2 . $ <eq:endpoint-haar>]

]
  + #emph[If $G$ is Gaussian, $p gt.eq 3 \/ 5$, and $b = floor.l d \/ 2 floor.r$, the direct Gaussian bound $bb(P) { R < 1 \/ 2 } lt.eq 90 \/ d$ gives 
#[#set math.equation(numbering: n => "(9)")
 $ I \( S \; V divides G \, G S \) gt.eq 1 / 2 \( d - b - 1 \) log frac(1, 4 epsilon.alt) - log 2 . $ <eq:endpoint-bins>]

]
  #emph[Each right side is at least $c thin d log \( 1 \/ epsilon.alt \)$ for an absolute $c > 0$ and all sufficiently large $d$.]
] <cor:replica-endpoints>

#proof[
  Use $r_0 = 1 \/ 2$. In (i), the failure probability is at most $8 \/ \( d + 2 \)$, so the true event has mass at least $1 \/ 2$ for large $d$. The angular cap bound is $\( 5 epsilon.alt \)^(d - b - 1)$, which gives the displayed version of the binary entropy calculation. In (ii), Markov’s estimate leaves event mass at least $1 \/ 3$, and the chordal cap is $\( 4 epsilon.alt \)^(d - b - 1)$. In (iii), the stated $90 \/ d$ estimate leaves mass at least $1 \/ 2$. The last assertion follows from $d - b - 1 gt.eq d \/ 2 - 1$ and
  $ log frac(1, c_0 epsilon.alt) gt.eq (1 - frac(log c_0, log 10)) log 1 / epsilon.alt #h(2em) \( c_0 = 4 upright(" or ") 5 \) . $
  The positive multiple of $d log \( 1 \/ epsilon.alt \)$ absorbs $log 2$ eventually. ◻
]

=== 2.3 Borel rules, randomness, and bounded stopping <borel-rules-randomness-and-bounded-stopping>

#thm([Lemma 2.6.])[
  (Borel versions for the averaged experiment).  #emph[Fix $d gt.eq 2$, a finite horizon $T$, and finite state sets. For fixed data-independent rule parameters, suppose each transition and stopping coordinate is measurable in the completion of the Borel sigma field on $bb(R)^d times bb(R)$ under $lambda \( d x \, d y \) = gamma_(1 \, d) \( d x \) thin d y$, where $gamma_(1 \, d)$ is standard Gaussian probability on $bb(R)^d$. The output law depends only on the terminal state and stopping index. There are Borel transition and stopping kernels, with the same state sets and output laws, having the same joint law of the signal, state path, stopping index, and output when $S tilde.op sigma_d$.]
] <lem:borel-rules>

#proof[
  For each state and index combine the next-state and stopping alternatives into a finite destination set. Choose a Borel version of every coordinate of this finite probability vector. Such versions exist for completed- measurable real functions: approximate by simple functions and replace their countably many level sets by Borel sets modulo null sets. On the Borel null set where the resulting vector is negative in a coordinate or fails to sum to one, replace it by a fixed point mass. The finite union over all states and indices is contained in one Borel $lambda$-null set $N$.
  For a nonzero fixed $x$, the scalar $chevron.l x \, S chevron.r$ has a Lebesgue density when $S tilde.op sigma_d$ and $d gt.eq 2$. Rotation and the one-coordinate spherical law show this directly. The event $x = 0$ is Gaussian-null. Consequently each pre-generated sample pair $\( X_j \, chevron.l X_j \, S chevron.r \)$ has law absolutely continuous with respect to $lambda$, and it avoids $N$ almost surely. This remains true on the event that any particular state is reached, because that event intersected with the pair lying in $N$ is contained in the marginal null event. The finite union over sample indices is still null. Coupling each original finite kernel and its Borel version by the same fresh uniform random variable now makes their state paths and stopping decisions agree by induction. Their output laws agree at the identical terminal pair. ◻
]

This lemma preserves the experiment averaged over the uniform signal; it does not claim pointwise preservation at every fixed signal. We may therefore apply it after passing to the uniform-prior hypothesis of Theorem 2. When a shared seed is present, apply the replacement separately in its fixed-seed experiments. The original jointly measurable law supplies well-defined conditional success probabilities and their average. No jointly measurable selection of the replacement Borel versions is needed.

#thm([Lemma 2.7.])[
  (Fixing randomness and padding the clock).  #emph[Consider a learner in Definition 3 under the uniform prior. If its average success is at least $p$, some fixed shared-seed conditional experiment has success at least $p$. Its initialization remains independent of the signal and samples, and its fixed-seed Borel replacement has the same success. In this Borel experiment the initialization and all remaining randomized rules can be represented by data-independent variables chosen before sampling, followed by deterministic state-based rules. For every $p' < p$, some realization of those variables gives deterministic rules with average success at least $p'$.]
  #emph[Padding a learner stopped by $T$ so that its halted states are absorbing, while retaining the stopping index and postponing the output, uses at most $\( T + 2 \) 2^M$ states at every layer. Hence every padded state has entropy at most 
#[#set math.equation(numbering: n => "(10)")
 $ h_T = M log 2 + log \( T + 2 \) . $ <eq:padded-entropy>]

 Extra ignored samples may be generated to complete a last block.]
] <lem:padding>

#proof[
  The original jointly measurable law gives a measurable conditional success function of the shared seed whose average is the original success. Work on a common full-measure set of seed values where the conditional law is the stated fixed-seed experiment and the conditional initialization remains independent of the signal and rows. The latter property follows from the joint independence of the initial state and shared seed from the signal and all rows. Some seed in this set has conditional success at least $p$: otherwise the strictly positive difference between $p$ and that conditional success would have a positive integral. Apply Lemma 8 to this one fixed-seed experiment. Its uniform-prior success is unchanged. This step does not require a jointly measurable choice of Borel replacements across seeds.
  In the resulting fixed-seed Borel experiment, for a finite destination kernel use an independent uniform variable and the cumulative coordinate probabilities to choose the destination. There are only finitely many state/index rules; unused choices can be generated in advance as well. Similarly pre-generate, for each terminal state/index, an output with its prescribed distribution, independently of the data. Together with the conditional initial state, these variables are jointly independent of the signal and samples. Conditional on their realization, the initialization and rules are deterministic and state based. The finite Borel construction is jointly measurable, and averaging its success gives that of the selected fixed-seed experiment. Some realization therefore has success at least $p' < p$.
  At a layer the active state set has at most $2^M$ values. Each earlier stopping index contributes a disjoint frozen copy of a state set of that size, and there are at most $T + 1$ stopping indices, including zero. The stated count follows. The frozen pair retains exactly the information allowed to determine the postponed output, and ignored fresh samples add no information to it. ◻
]

#thm([Lemma 2.8.])[
  (Conditional priors at finite events).  #emph[Let $S tilde.op sigma_d$ and let $H$ be a finite-valued random variable jointly distributed with $S$. Every positive-probability value $h$ gives a conditional signal density bounded by $L_h = 1 \/ bb(P) { H = h }$ relative to $sigma_d$, and 
#[#set math.equation(numbering: n => "(11)")
 $ bb(E) log L_H = H \( H \) . $ <eq:rare-event-entropy>]

]
] <lem:conditional-priors>

#proof[
  Bayes’ formula gives the Borel density
  $ frac(d P_(S divides H = h), d sigma_d) \( s \) = frac(bb(P) { H = h divides S = s }, bb(P) { H = h }) lt.eq L_h . $
  Averaging $log L_h$ gives (11). In particular, $H$ may be one padded state or a history of padded states; these have different entropy costs. ◻
]

#thm([Lemma 2.9.])[
  (Output capacity and the early clock bound).  #emph[Consider a family of learners indexed by $d$, with uniform-prior success at least a fixed $p_0 > 0$, and set $beta = log \( 1 \/ epsilon.alt \)$ for $0 < epsilon.alt lt.eq 1 \/ 10$. At each dimension, the terminal output capacity satisfies 
#[#set math.equation(numbering: n => "(12)")
 $ p_0 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) . $ <eq:output-capacity>]

 On the branch $T lt.eq d beta$, if $M = o \( d^2 \)$, then 
#[#set math.equation(numbering: n => "(13)")
 $ beta = o \( d \) \, #h(2em) T = o \( d^2 \) \, #h(2em) h_T = o \( d^2 \) . $ <eq:early-clock>]

]
] <lem:early-clock>

#proof[
  First fix a shared seed in the original conditional experiment. There are at most $\( T + 1 \) 2^M$ terminal state/index pairs. For a fixed pair, write $nu_(j \, v)$ for its prescribed output law and $r_(j \, v) \( s \)$ for the conditional probability of reaching it given $S = s$. Its contribution to success is
  $ integral r_(j \, v) \( s \) integral upright(bold(1))_({ arccos chevron.l u \, s chevron.r lt.eq epsilon.alt }) thin nu_(j \, v) \( d u \) thin sigma_d \( d s \) lt.eq epsilon.alt^(d - 1) \, $
  because $r_(j \, v) lt.eq 1$ and each angular cap has mass at most $epsilon.alt^(d - 1)$ by Lemma 4. Summing gives (12) for its conditional success. The same numerical bound holds for almost every seed, so averaging the original conditional success probabilities gives the stated bound for the jointly measurable mixture.
  On $T lt.eq d beta$, the inequalities $beta gt.eq log 10$ and $T + 1 lt.eq 2 d e^beta$ imply
  $ \( d - 2 \) beta lt.eq M log 2 + log \( 2 d \) + log \( 1 \/ p_0 \) . $
  Dividing by $d$ proves $beta = o \( d \)$ for a subquadratic memory sequence. The branch then gives $T = o \( d^2 \)$, and (10) gives $h_T = o \( d^2 \)$. ◻
]

#thm([Lemma 2.10.])[
  (A raw-sample endpoint).  #emph[Let $0 < epsilon.alt lt.eq 1 \/ 10$, and let an estimator use all exact measurements $\( G \, G S \)$ from $b lt.eq floor.l d \/ 2 floor.r$ independent Gaussian rows, together with independent randomness, when $S tilde.op sigma_d$. Its angular success probability is at most 
#[#set math.equation(numbering: n => "(14)")
 $ frac(8, d + 2) + \( 4 epsilon.alt \)^(d - b - 1) . $ <eq:raw-sample-bound>]

 The separate Gaussian-norm estimate gives the also valid bound $90 \/ d + \( 4 epsilon.alt \)^(d - b - 1)$. In particular, uniform-prior success at least $3 \/ 5$ requires $T > floor.l d \/ 2 floor.r$ for all sufficiently large $d$, even if all raw data up to the horizon are retained.]
] <lem:raw-sample-bound>

#proof[
  For $d lt.eq 2$, both numerical bounds exceed one. We may therefore assume $d gt.eq 3$, when $b lt.eq floor.l d \/ 2 floor.r lt.eq d - 2$. Condition on all the data. The estimator and the signal are then conditionally independent, and the conditional signal is the residual sphere in Lemma 5. On radius at least $1 \/ 2$, the successful points have relative chordal cap mass at most $\( 4 epsilon.alt \)^(d - b - 1)$, by the argument in Lemma 6. Add the corresponding failure probability from (5). The zero-row case uses the deterministic radius one.
  If a learner stops by $T lt.eq floor.l d \/ 2 floor.r$, grant it all of the first $floor.l d \/ 2 floor.r$ rows and labels, including unused ones. Its output is a kernel of those data and independent randomness. The displayed bound tends to zero uniformly for $epsilon.alt lt.eq 1 \/ 10$, contradicting success $3 \/ 5$. This proves the last assertion. The angular-cap version used in the first replica route follows as well by replacing $4 epsilon.alt$ by the weaker $5 epsilon.alt$. ◻
]

== 3 Posterior replicas and exact equal-label measures <sec:replicas>

The information estimate for a block has two parts. First, a general identity converts information in one finite message into the loss of dependence among several signals. Second, exact Gaussian observations give an explicit law for signals sampled from the same posterior. This section proves both statements. The subsequent sections estimate how much of that dependence remains visible after another projection.

All probability spaces used below are standard Borel. Conditional laws mean measurable regular conditional probabilities, and conditional relative entropies include integration over the conditioning variable. We write $D_(upright("KL")) \( P bar.v.double Q \)$ for relative entropy, with value $+ oo$ when $P$ is not absolutely continuous with respect to $Q$. Logarithms and entropies are in nats.

=== 3.1 Information in a message and loss of correlation <information-in-a-message-and-loss-of-correlation>

For a joint law $Q$ of $\( S_1 \, dots.h \, S_t \)$ with common marginal $p$, its #emph[total correlation] is

$ K = D_(upright("KL")) \( Q bar.v.double p^(⊗ t) \) . $

This quantity was introduced by Watanabe #cite(label("Watanabe1960")); see Austin #cite(label("Austin2020")) Sections 3.3 and 6 for its measure-theoretic form and information identities. Let $B$ be independent of the tuple and let $U_i = phi.alt_B \( S_i \)$, where $\( B \, s \) mapsto phi.alt_B \( s \)$ is measurable. Writing $p_B = \( phi.alt_B \)_(\#) p$, define the correlation visible after projection by

$ K' = bb(E)_B D_(upright("KL")) #scale(x: 120%, y: 120%)[\(] Q_(U_1 \, dots.h \, U_t divides B) bar.v.double p_B^(⊗ t) #scale(x: 120%, y: 120%)[\)] . $

#thm([Lemma 3.1.])[
  (Replica information inequality).  #emph[Let $t gt.eq 1$ and suppose $K < oo$. Let $W$ be finite-valued and suppose that every pair $\( S_i \, W \)$ has the same law as $\( S_1 \, W \)$. In the conclusion write $S = S_1$. If $B$ is independent of $\( S_1 \, dots.h \, S_t \, W \)$, then 
#[#set math.equation(numbering: n => "(15)")
 $ t I \( S \; W divides B \, phi.alt_B \( S \) \) lt.eq H \( W \) + K - K' \, #h(2em) 0 lt.eq K' lt.eq K . $ <eq:replica-information>]

 The same statement holds in a conditional experiment when all of these hypotheses hold there, including the matching pair laws and the independence of $B$. Equivalently, the left side may use a separate representative of the common signal–message pair law if it is coupled independently with $B$.]
] <lem:replica-information>

#proof[
  Let $K_W$ be the average total correlation conditional on $W$, computed relative to the product of the conditional one-coordinate marginals. Decomposing the relative entropy of $\( S_1 \, dots.h \, S_t \, W \)$ from $p^(⊗ t) ⊗ Q_W$ in the two orders gives
  #[#set math.equation(numbering: n => "(16)")
   $ t I \( S \; W \) = I \( \( S_i \)_(i = 1)^t \; W \) + K - K_W . $ <eq:replica-chain-before>]
  The relative entropy being decomposed is at most $K + H \( W \)$, so every nonnegative chain-rule term in this display is finite. Define $K'_W$ in the same way after projection, conditionally on $\( B \, W \)$. The corresponding identity after projection is
  #[#set math.equation(numbering: n => "(17)")
   $ t I \( phi.alt_B \( S \) \; W divides B \) = I \( \( U_i \)_(i = 1)^t \; W divides B \) + K' - K'_W . $ <eq:replica-chain-after>]
  Coordinatewise data processing gives $K' lt.eq K$ and $K'_W lt.eq K_W$. Independence of $B$ and the fact that $phi.alt_B \( S \)$ is determined by $\( B \, S \)$ also give
  $ I \( S \; W divides B \, phi.alt_B \( S \) \) = I \( S \; W \) - I \( phi.alt_B \( S \) \; W divides B \) . $
  Subtracting (17) from (16) therefore gives the exact identity
  $ t I \( S \; W divides B \, phi.alt_B \( S \) \) = I \( \( S_i \)_(i = 1)^t \; W divides B \, \( U_i \)_(i = 1)^t \) + \( K - K' \) - \( K_W - K'_W \) . $
  The conditional tuple-information is at most $H \( W \)$, and $K_W - K'_W gt.eq 0$. This proves the inequality. The remaining assertion is nonnegativity of relative entropy. ◻
]

The coupling used in this paper has precisely the pair-law property in the lemma. Suppose that data $\( A \, Y \)$ are generated from $S$, and that $W$ is drawn from a kernel of the data, conditionally independently of $S$. Given the same $\( A \, Y \)$, draw $S_1 \, dots.h \, S_t$ independently from the posterior law of $S$, independently also of $W$. Conditioning on the data shows that $\( S_i \, W \)$ has the original signal–message law for every $i$. We call these signals #emph[posterior replicas]. Equal one-signal marginals alone would not be sufficient for Lemma 13. The invariance of the joint data–signal law under posterior resampling is the Nishimori identity; see Lelarge and Miolane #cite(label("LelargeMiolane2019")) Proposition 16 for a general formulation. When an independent $B$ is added to both experiments, equality of the pair laws gives equality of the corresponding $\( S_i \, W \, B \)$ laws as well, so the lemma’s left side is the information in the original signal–message pair.

We shall use the following entropy test. If $Q lt.double R$ are probabilities and $F gt.eq 0$ is measurable with $bb(E)_R F lt.eq 1$, then

#[#set math.equation(numbering: n => "(18)")
 $ D_(upright("KL")) \( Q bar.v.double R \) gt.eq bb(E)_Q log F $ <eq:entropy-test>]

whenever the right side is defined. For a bounded positive test this follows by tilting $R$ by $F \/ bb(E)_R F$ and using nonnegativity of relative entropy; bounded truncations give the stated form. This is the entropy variational principle in the form used here; see Dupuis and Mao #cite(label("DupuisMao2022")) Equations (1.1)–(1.2). In particular, if the relative entropy is finite, applying the bounded form to truncations of $\( 1 + F \) \/ 2$ and then monotone convergence yields

#[#set math.equation(numbering: n => "(19)")
 $ bb(E)_Q log \( 1 + F \) lt.eq D_(upright("KL")) \( Q bar.v.double R \) + log 2 . $ <eq:entropy-positive-log>]

This supplies positive-log integrability for the likelihood tests below.

=== 3.2 Projection fibers and inverse affine volumes <projection-fibers-and-inverse-affine-volumes>

Let $sigma_d$ be uniform probability on $S^(d - 1)$ and let $gamma_(k \, d)$ be the law of a $k times d$ matrix with independent standard Gaussian entries. For a subspace $F subset bb(R)^d$, let $gamma_(k \, d)^F$ denote the law of a matrix whose rows are independent standard Gaussians in $F^perp$. For a tuple $upright(bold(u)) = \( u_1 \, dots.h \, u_t \)$ with $m = t - 1$, set

#[#set math.equation(numbering: n => "(20)")
 $ D_(upright(bold(u))) = \[ u_2 - u_1 \, dots.h \, u_t - u_1 \] \, #h(2em) F_(upright(bold(u))) = "col" \( D_(upright(bold(u))) \) \, #h(2em) J \( upright(bold(u)) \) = det \( D_(upright(bold(u)))^(sans(T)) D_(upright(bold(u))) \)^(1 \/ 2) . $ <eq:equal-label-geometry>]

At full column rank $J$ is the product of the successive distances to predecessor affine spans. For two distinct points, the difference $v = u_2 - u_1$ has $A v tilde.op N \( 0 \, lr(bar.v.double  bar.v.double) v^2 I_k \)$, whose density at zero is $\( 2 pi \)^(- k \/ 2) lr(bar.v.double  bar.v.double) v^(- k)$. This is the inverse-volume factor for two points. With $m$ differences, each row of $A D_(upright(bold(u)))$ has covariance $D_(upright(bold(u)))^(sans(T)) D_(upright(bold(u)))$, giving the factor $\( 2 pi \)^(- k m \/ 2) J \( upright(bold(u)) \)^(- k)$. The next lemma provides the integrability needed to identify an exact measure on the constraint $A u_1 = dots.h.c = A u_t$.

#thm([Lemma 3.2.])[
  (Projection fibers and inverse affine volumes).  #emph[Let $1 lt.eq k lt.eq d - 2$ and let $P^0$ be either $sigma_d$ or standard Gaussian probability on $bb(R)^d$. Every full-row-rank $k times d$ matrix $A$ projects $P^0$ to a Lebesgue density $p_A^0$. With $A^dagger = A^(sans(T)) \( A A^(sans(T)) \)^(- 1)$, the spherical density is 
#[#set math.equation(numbering: n => "(21)")
 $ p_A^0 \( y \) = frac(Gamma \( d \/ 2 \), pi^(k \/ 2) Gamma \( \( d - k \) \/ 2 \)) frac(\( 1 - lr(bar.v.double A^dagger y bar.v.double)^2 \)^(\( d - k - 2 \) \/ 2), sqrt(det \( A A^(sans(T)) \))) upright(bold(1))_({ lr(bar.v.double A^dagger y bar.v.double) < 1 }) . $ <eq:spherical-projection-density>]

 For $lr(bar.v.double A^dagger y bar.v.double) < 1$, its conditional law $P_(A \, y)^0$ is uniform on the sphere centered at $A^dagger y$, of radius $sqrt(1 - lr(bar.v.double A^dagger y bar.v.double)^2)$, in the affine space parallel to $ker A$. For the Gaussian base, $p_A^0$ is the density of $N \( 0 \, A A^(sans(T)) \)$, and the conditional point is $A^dagger y$ plus a standard Gaussian in $ker A$. These conditional laws have jointly measurable versions; unused fibers may be assigned any fixed probability law.]
  #emph[If $m gt.eq 1$, $t = m + 1$, and $k + m lt.eq d - 2$, then $J > 0$ almost surely under $\( P^0 \)^(⊗ t)$ and 
#[#set math.equation(numbering: n => "(22)")
 $ integral J \( upright(bold(u)) \)^(- k) thin \( P^0 \)^(⊗ t) \( d upright(bold(u)) \) < oo . $ <eq:inverse-affine-volume>]

 If $k + m lt.eq d - 3$, the same assertion holds with exponent $k + 1$.]
] <lem:projection-fibers>

#proof[
  Split a standard Gaussian vector into the row space and kernel of $A$. Its squared lengths in those spaces are independent chi-squares with $k$ and $d - k$ degrees of freedom. After dividing by the total length, their ratio has the beta density. Polar integration in orthonormal row coordinates gives (21); changing those coordinates to $y$ supplies the determinant factor. The remaining direction is independent and uniform in the kernel. This is the spherical beta projection law, discussed geometrically by Frankl and Maehara #cite(label("FranklMaehara1990")). Without normalization, orthogonal Gaussian independence gives the Gaussian assertion. For measurability, generate the kernel component by projecting an extra independent Gaussian with the Borel matrix $I - A^dagger A$, and normalize its length in the spherical case. Assign fixed values on rank failures and on the null event of a zero projected Gaussian.
  For the inverse moment, first note that an affine $j$-plane $V$ satisfies
  #[#set math.equation(numbering: n => "(23)")
   $ sigma_d { u : "dist" \( u \, V \) lt.eq r } lt.eq C^d r^(d - 1 - j) \, #h(2em) 0 < r lt.eq 1 . $ <eq:affine-tube>]
  Indeed, cover the part of $V$ within distance one of the unit sphere by at most $\( C \/ r \)^j$ balls of radius $r$. Each nonempty intersection with the sphere is contained in a radius-$4 r$ ball centered on the sphere. The spherical ball bound in Lemma 4, with the trivial bound one when necessary, proves (23). For a standard Gaussian point, its projection onto the orthogonal complement of the direction space of $V$ has a translated standard Gaussian density. The density is bounded uniformly over the translation, so the analogous estimate is $C^d r^(d - j)$.
  Gram–Schmidt gives
  $ J \( upright(bold(u)) \) = product_(i = 2)^t "dist" #scale(x: 120%, y: 120%)[\(] u_i \, "aff" \( u_1 \, dots.h \, u_(i - 1) \) #scale(x: 120%, y: 120%)[\)] . $
  The predecessor affine span has dimension at most $i - 2$. Thus the smallest spherical small-distance exponent in (23) is $d - 1 - \( t - 2 \) = d - m > k$. Integrating its tail bounds the inverse $k$th moment of each distance uniformly in the preceding points: for a nonnegative distance $X$,
  $ bb(E) X^(- k) lt.eq 1 + k integral_0^1 r^(- k - 1) bb(P) { X < r } thin d r . $
  Integrate the last point first and repeat. This proves the finite product moment and, since every lower-dimensional affine span has zero base mass, full affine rank almost surely. The Gaussian exponents are larger. Replacing $k$ by $k + 1$ gives the last assertion under $k + m lt.eq d - 3$. ◻
]

=== 3.3 The exact finite measure on equal labels <the-exact-finite-measure-on-equal-labels>

Let $f$ be a bounded nonnegative Borel function and set $nu = f P^0$. The measure $nu$ is finite and need not be a probability. For a full-rank $A$, choose the projected density and the normalized conditional probability by

#[#set math.equation(numbering: n => "(24)")
 $ p_A \( y \) = p_A^0 \( y \) h_A \( y \) \, #h(2em) h_A \( y \) = integral f thin d P_(A \, y)^0 \, #h(2em) nu_(A \, y) \( d u \) = frac(f \( u \), h_A \( y \)) P_(A \, y)^0 \( d u \) quad upright("when ") h_A \( y \) > 0 . $ <eq:finite-tilt>]

The conditional probability on an unused fiber may be arbitrary. In the spherical case the displayed density is zero outside the open projection ellipsoid. The constructions in Lemma 14 make these versions jointly measurable.

The equality below distinguishes two natural descriptions. The left first selects a matrix and a common label, with the label weighted by $p_A^t$, then selects points independently on that fiber. The right first selects independent points and then Gaussian rows annihilating their differences, with an inverse affine-volume weight. These are finite measures, not the two unweighted probability experiments. When $nu$ is a probability, its actual common label has density $p_A$, so recovering posterior replicas will require multiplying this identity by $p_A^(1 - t)$ on positive fibers. We first identify the measures and their null sets, before that division. The general background is coarea #cite(label("Federer1959")) Theorem 3.1; related affine simplex-volume Jacobians occur in Drury #cite(label("Drury1984")) Lemma 1. The following proof fixes the normalization and the versions used at the exact constrained labels.

#thm([Theorem 3.3.])[
  (Finite measure for equal Gaussian labels).  #emph[Let $k \, m gt.eq 1$, $t = m + 1$, and $k + m lt.eq d - 2$. Let $P^0$ be either uniform probability on $S^(d - 1)$ or standard Gaussian probability on $bb(R)^d$, and let $nu = f P^0$ for a bounded nonnegative Borel function $f$. With the notation in (20) and (24), for every nonnegative Borel function $H \( A \, y \, upright(bold(u)) \)$, 
#[#set math.equation(numbering: n => "(25)")
 $ & integral gamma_(k \, d) \( d A \) integral_(bb(R)^k) p_A \( y \)^t integral H \( A \, y \, upright(bold(u)) \) thin nu_(A \, y)^(⊗ t) \( d upright(bold(u)) \) thin d y\
 & quad = \( 2 pi \)^(- k m \/ 2) integral J \( upright(bold(u)) \)^(- k) thin nu^(⊗ t) \( d upright(bold(u)) \) integral H \( A \, A u_1 \, upright(bold(u)) \) thin gamma_(k \, d)^(F_(upright(bold(u)))) \( d A \) . $ <eq:equal-label-measure>]

 Both sides are finite measures before the test $H$ is inserted. They are supported on $A u_i = y$ for every $i$, full-column-rank $D_(upright(bold(u)))$, and full-row-rank $A$. In the spherical case the common fiber has positive radius. Thus (25) is an identity of finite measures on $\( A \, y \, upright(bold(u)) \)$; the right side places $y$ at $A u_1$.]
  #emph[For a full-rank $A$, alternatively define $p_A \( y \)$ by the lower limit of its radius-$1 \/ n$ Lebesgue ball averages or by the lower limit of its Gaussian convolutions with covariance $n^(- 2) I_k$. Each choice is jointly measurable and agrees with (24) for Lebesgue-almost every $y$. All three versions agree at $y = A u_1$, with a finite positive value, almost everywhere for the finite reference measure 
#[#set math.equation(numbering: n => "(26)")
 $ R \( d upright(bold(u)) \, d A \) = nu^(⊗ t) \( d upright(bold(u)) \) gamma_(k \, d)^(F_(upright(bold(u)))) \( d A \) . $ <eq:equal-label-reference>]

 When $nu = 0$ the last assertion is vacuous. The equality is obtained using either ball or Gaussian approximate identities in both integration orders for the base law $P^0$, then multiplying the resulting measure identity by the bounded density factors.]
] <thm:equal-label-measure>

#proof[
  We first take $nu = P^0$. Let $phi_eta$ be either the uniform density on the radius-$eta$ $k$-ball or the density of $N \( 0 \, eta^2 I_k \)$. For a continuous compactly supported test $G \( upright(bold(u)) \, A \)$ whose matrix support lies in the open full-row-rank set, integrate
  #[#set math.equation(numbering: n => "(27)")
   $ G \( upright(bold(u)) \, A \) product_(i = 2)^t phi_eta \( A \( u_i - u_1 \) \) $ <eq:equal-label-approximation>]
  against $\( P^0 \)^(⊗ t) \( d upright(bold(u)) \) gamma_(k \, d) \( d A \)$.
  Fix $A$ first and disintegrate each point by its projected label. Given the first label $y$, the other labels approach $y$ under either probability approximate identity. The base density is continuous in the interior of its support, and the conditional fiber law varies weakly continuously there. The spherical boundary has zero projected probability. Thus the integral converges to
  $ integral gamma_(k \, d) \( d A \) integral \( p_A^0 \( y \) \)^t integral G \( upright(bold(u)) \, A \) \( P_(A \, y)^0 \)^(⊗ t) \( d upright(bold(u)) \) thin d y . $
  To justify the passage, condition first also on $u_1$. The absolute value of the remaining integral is at most $lr(bar.v.double  bar.v.double) G_oo \( sup p_A^0 \)^m$. The density suprema are uniformly bounded on the compact matrix support: this follows from (21), whose exponent is nonnegative, and from the Gaussian density formula. The bound is global in all the other labels, including labels near or outside the spherical support, because each $phi_eta$ is a probability density. Dominated convergence applies for both kernels.
  In the other order, fix a tuple of full affine rank. Each row of $A D_(upright(bold(u)))$ is Gaussian with covariance $D_(upright(bold(u)))^(sans(T)) D_(upright(bold(u)))$. Its joint density has maximum at zero, with value
  $ w_(k \, m) \( upright(bold(u)) \) = \( 2 pi \)^(- k m \/ 2) J \( upright(bold(u)) \)^(- k) . $
  Conditional on $A D_(upright(bold(u))) = Z$, the matrix $A$ is a draw from $gamma_(k \, d)^(F_(upright(bold(u))))$ plus $Z \( D_(upright(bold(u)))^(sans(T)) D_(upright(bold(u))) \)^(- 1) D_(upright(bold(u)))^(sans(T))$. This translation tends to zero with $Z$. The integral in (27), conditioned on the tuple, therefore converges to
  $ w_(k \, m) \( upright(bold(u)) \) integral G \( upright(bold(u)) \, A \) gamma_(k \, d)^(F_(upright(bold(u)))) \( d A \) . $
  For either kernel its absolute value is at most $lr(bar.v.double  bar.v.double) G_oo w_(k \, m) \( upright(bold(u)) \)$. Indeed, the joint density of the whole matrix $Z = A D_(upright(bold(u)))$ is bounded by $w_(k \, m)$, while $product_(i = 2)^t phi_eta \( Z_(: \, i - 1) \)$ has Lebesgue integral one on $bb(R)^(k times m)$. This argument does not require the columns of $Z$ to be independent. The bound is integrable by Lemma 14. Dominated convergence gives the second integration order and equates these two limits.
  For clarity, the left measure is locally finite on the open full-row-rank matrix set before we identify it. If a compact set in that space has matrix projection $K_A$, its left mass is at most
  $ integral_(K_A) #h(-0.16667em) integral \( p_A^0 \( y \) \)^t thin d y thin gamma_(k \, d) \( d A \) lt.eq sup_(A in K_A) \( sup_y p_A^0 \( y \) \)^m < oo \, $
  because $integral p_A^0 \( y \) thin d y = 1$. Thus both sides are locally finite Borel measures on this locally compact second-countable space; the right one is globally finite by (22). Continuous compactly supported tests identify them on that open set. Exhausting it shows that the left total mass there equals the finite right total mass. The right measure gives no mass to remaining matrices: its rows live in a space of dimension $d - m gt.eq k + 2$. The left measure also has no such mass because $gamma_(k \, d)$ is full rank almost surely. Equality therefore extends to all nonnegative Borel tests. The right measure is supported on full affine rank by Lemma 14, so the same holds on the left. In the spherical case its label is in the open ellipsoid, and its fiber radius is positive. Equivalently, a boundary fiber could contain only one unit vector and hence could not contain a full-affine- rank tuple with $t gt.eq 2$.
  Now multiply the base equality by $product_(i = 1)^t f \( u_i \)$. The formula (24) converts the fiber side to $p_A \( y \)^t nu_(A \, y)^(⊗ t)$; the other side becomes $w_(k \, m) nu^(⊗ t) gamma_(k \, d)^(F_(upright(bold(u))))$. On a fiber with $h_A \( y \) = 0$, the measure $f P_(A \, y)^0$ is zero, so both expressions on the fiber side are zero regardless of the unused conditional probability. This conversion never divides on a zero fiber. Boundedness of $f$ preserves finiteness. Inserting a test $H \( A \, A u_1 \, upright(bold(u)) \)$ gives (25), since both sides are supported on equal labels. No normalization by $nu \( bb(R)^d \)$ has been made. In particular, the two equal-label limit calculations were made only for the base law; no continuity of $f$ or of the reweighted fiber kernel is used in them.
  It remains to justify density evaluation on that constraint. For either choice of $phi$, set
  $ tilde(p)_A \( y \) = liminf_(n arrow.r oo) integral phi_(1 \/ n) \( A u - y \) thin nu \( d u \) . $
  The integral and lower limit are jointly measurable. Lebesgue differentiation for the ball and Gaussian approximate identities makes each version agree with (24) at almost every $y$ for each full-rank $A$. On the left of (25), the common label has a measure with Lebesgue density $p_A \( y \)^t$ and hence avoids the null sets where the versions disagree or are not finite and positive. Equality of the undivided finite measures transfers this fact to the right. There the weight $w_(k \, m)$ is finite and strictly positive at full affine rank. The reference $R$ has finite mass $nu \( bb(R)^d \)^t$ and full affine rank almost everywhere, because $nu^(⊗ t) lt.double \( P^0 \)^(⊗ t)$. Restricting successively to ${ 1 \/ j lt.eq w_(k \, m) lt.eq j }$ therefore transfers the same null statement to the unweighted reference (26). The labels where $p_A = 0$ have zero left mass because their weight is $p_A^t$, so this argument does not divide on them. If $nu = 0$, both finite measures and $R$ are zero. The only additional limiting assertion for a possibly discontinuous $f$ is the ordinary almost-everywhere differentiation of its projected $L^1$ density used in this paragraph. This proves the claimed versions before any division by a projection density. ◻
]

#thm([Corollary 3.4.])[
  (Posterior replica likelihood).  #emph[Under the hypotheses of Theorem 15, suppose $p = f P^0$ is a probability. Draw $A tilde.op gamma_(k \, d)$ independently of $S tilde.op p$, put $Y = A S$, and conditionally on $\( A \, Y \)$ draw $t$ independent replicas from $p_(A \, Y)$. Let $Q$ be the law of their tuple together with $A$, and let $R = p^(⊗ t) \( d upright(bold(u)) \) gamma_(k \, d)^(F_(upright(bold(u)))) \( d A \)$. Then $R$ is a probability and 
#[#set math.equation(numbering: n => "(28)")
 $ frac(d Q, d R) \( upright(bold(u)) \, A \) = \( 2 pi \)^(- k m \/ 2) J \( upright(bold(u)) \)^(- k) p_A \( A u_1 \)^(- m) . $ <eq:replica-likelihood>]

 In particular, the tuple marginal of $Q$ is absolutely continuous relative to $p^(⊗ t)$.]
] <cor:replica-likelihood>

#proof[
  Multiply the equal finite measures by $p_A \( A u_1 \)^(- m)$ on their common finite positive set, first with bounded truncations and then by monotone convergence. The exponent $t = m + 1$ on the left becomes one, so that side is exactly the probability experiment defining $Q$. The right side is the displayed density relative to $R$. Marginalization gives the last assertion. ◻
]

#prodef([Remark 3.5.])[
  (The uniform instance used with a further inverse moment).  Suppose the replica count is $t gt.eq 2$ and $k + t + 1 < d$. Then the uniform spherical instance of Theorem 15 applies with $m = t - 1$, and Lemma 14 also gives $integral J^(- \( k + 1 \)) d sigma_d^(⊗ t) < oo$. This stronger inverse moment controls a logarithmic volume under a reference weighted by $J^(- k)$. Extending the likelihood argument to an unbounded finite-entropy density requires an additional proof; it is not included in the bounded-reweighting theorem.
] <rem:extra-inverse-moment>

=== 3.4 Finite correlation for bounded spherical priors <finite-correlation-for-bounded-spherical-priors>

The finite-measure identity applies to both bases. The additional logarithmic assertion needed for the first two block comparisons concerns a spherical probability prior. It does not assert an entropy bound for every Gaussian reweighting.

#thm([Lemma 3.6.])[
  (Logarithmic integrability for spherical replicas).  #emph[In Corollary 16, let $p = f sigma_d$ with $0 lt.eq f lt.eq L < oo$. Under the replica law $Q$, both $log p_A \( Y \)$ and $log J \( S_1 \, dots.h \, S_t \)$ are absolutely integrable. Consequently the tuple total correlation is finite and satisfies 
#[#set math.equation(numbering: n => "(29)")
 $ K lt.eq - frac(k m, 2) log \( 2 pi \) - k bb(E)_Q log J - m bb(E)_Q log p_A \( Y \) . $ <eq:replica-correlation-upper>]

]
] <lem:replica-logs>

#proof[
  Write $u_A$ for the uniform-sphere projection density. Since $p_A lt.eq L u_A$, (21) bounds the positive logarithm of $p_A \( Y \)$ by a constant depending on $d \, k \, L$ plus $1 / 2 \| log det \( A A^(sans(T)) \) \|$. Gaussian row Gram–Schmidt expresses that determinant as a product of independent chi-squares with degrees $d \, d - 1 \, dots.h \, d - k + 1$. Their absolute logarithms are integrable, directly from their densities at zero and infinity. For the negative part, the support of $p_A$ lies in the ball of radius $lr(bar.v.double  bar.v.double) A_(upright("op"))$ and $- z log z lt.eq 1 \/ e$ for $0 < z lt.eq 1$. The expected volume of that ball is finite because a finite Gaussian matrix has all positive norm moments.
  For a simplex height, condition on $\( A \, Y \)$ and let $rho$ be the fiber radius. Set $q = d - k$. After translating and rescaling to the unit sphere in $ker A$, the posterior has density at most
  $ L' = frac(L u_A \( Y \), p_A \( Y \)) gt.eq 1 . $
  For $a_i = "dist" \( S_i \, "aff" \( S_1 \, dots.h \, S_(i - 1) \) \)$, the tube estimate (23), also conditional on the predecessors, gives
  $ bb(P) { a_i lt.eq r rho divides A \, Y \, S_1 \, dots.h \, S_(i - 1) } lt.eq min { 1 \, L' C^q r^(q - 1 - \( i - 2 \)) } \, #h(2em) 0 < r lt.eq 1 . $
  The exponent is positive. With $log^(-) x = max { 0 \, - log x }$, tail integration yields
  $ bb(E) \[ log^(-) \( a_i \/ rho \) divides A \, Y \, S_1 \, dots.h \, S_(i - 1) \] lt.eq log L' + C q + 1 . $
  Moreover the bounded density ratio makes its relative entropy finite and
  #[#set math.equation(numbering: n => "(30)")
   $ 0 lt.eq bb(E) log L' = log L - bb(E)_A D_(upright("KL")) \( p_A bar.v.double u_A \) lt.eq log L . $ <eq:posterior-tilt-budget>]
  For completeness, the negative part of the density-ratio logarithm is integrable because $- z log z lt.eq 1 \/ e$ against the probability density $u_A$; the positive part is at most $log L$.
  Each pair $\( A \, S_i \)$ has the original independent matrix–signal law. For every fixed unit signal, rotational invariance of $A$ makes $rho^2$ a beta variable with parameters $\( d - k \) \/ 2 \, k \/ 2$, whose logarithm is integrable. Thus $bb(E) \[ - log rho \] < oo$. Each unscaled height is at most two, so its positive logarithm is bounded. Summing its two logarithmic parts over the Gram–Schmidt product proves absolute integrability of $log J$. We may now integrate the logarithm of (28); this is the finite divergence $D_(upright("KL")) \( Q bar.v.double R \)$. Forgetting $A$ sends $R$ to $p^(⊗ t)$, so data processing proves (29). ◻
]

== 4 A Gaussian test that cancels the affine volume <sec:gaussian>

We prove Theorem 1. Fix its dimensions $k = m = 2 floor.l d \/ 16 floor.r$, $t = m + 1$, and $ell = 4 k$, and let $p = f sigma_d$ with $0 lt.eq f lt.eq L$. Draw the block data $\( A \, Y \)$, where $Y = A S$, and then draw $t$ independent posterior replicas conditional on those data. Write $Q$ for the law of the replicas together with $A$, and use $D \, F \, J$ for their difference matrix, difference span, and affine volume as in (20).

For large $d$, $k + m lt.eq d - 2$. Corollary 16 applies with

$ c = \( 2 pi \)^(- k m \/ 2) \, #h(2em) R \( d upright(bold(s)) \, d A \) = p^(⊗ t) \( d upright(bold(s)) \) gamma_(k \, d)^F \( d A \) . $

The evaluated density is the common exact version of Theorem 15. If $K$ is the total correlation of the replicas, Lemma 18 gives

#[#set math.equation(numbering: n => "(31)")
 $ K lt.eq log c - k bb(E)_Q log J - m bb(E)_Q log p_A \( Y \) < oo . $ <eq:gaussian-correlation-upper>]

The potentially large term is the negative logarithm of $J$. We recover it from a test determined by the projected replicas. After that cancellation, only a comparison between two equal-label projection densities remains.

=== 4.1 The observable projected test <the-observable-projected-test>

Let $B$ be the independent $ell$-row matrix in Theorem 1, and set $U_i = B S_i$. The projected tuple determines

$ B D = \[ U_2 - U_1 \, dots.h \, U_t - U_1 \] . $

At its almost sure full rank, choose a $k times ell$ matrix $C_0$ with orthonormal rows in the orthogonal complement of the columns of $B D$, measurably as a function of $B D$. Projecting the standard basis and taking the first successful Gram–Schmidt choices supplies such a rule. There is room for these rows because $ell - m = 3 k$. Define the selector arbitrarily on rank failures. Put

$ tilde(A) = C_0 B . $

This matrix is known from $\( B \, U_1 \, dots.h \, U_t \)$ and satisfies $tilde(A) S_i = C_0 U_1$ for every replica. It supplies an observable equal-label likelihood to compare with the actual likelihood in (31).

#thm([Lemma 4.1.])[
  (Projected likelihood test).  #emph[Let $G$ be an $ell times m$ standard Gaussian matrix and set 
$ Z_(k \, m) = bb(E) det \( G^(sans(T)) G \)^(- k \/ 2) . $

 This constant is finite and positive. The nonnegative function 
#[#set math.equation(numbering: n => "(32)")
 $ Lambda \( B \, U_1 \, dots.h \, U_t \) = c / Z_(k \, m) det \( \( B D \)^(sans(T)) \( B D \) \)^(- k \/ 2) p_(C_0 B) \( C_0 U_1 \)^(- m) \, $ <eq:gaussian-projected-test>]

 with value zero on the exceptional null sets, has expectation one under the law that draws $B$ and projects independent $p$-distributed signals. Conditional on the replica tuple and its original matrix $A$, $tilde(A)$ has law $gamma_(k \, d)^F$; this law depends only on the tuple. If $K'$ is the projected total correlation of the replicas, then 
#[#set math.equation(numbering: n => "(33)")
 $ K - K' lt.eq C k m + m bb(E) #h(-0.16667em) [log p_(tilde(A)) \( tilde(A) S_1 \) - log p_A \( Y \)] . $ <eq:gaussian-correlation-loss>]

 Every logarithm in this display is absolutely integrable.]
] <lem:gaussian-test>

#proof[
  For a fixed full-rank tuple write $D = E T$, where the columns of $E$ form an orthonormal basis of $F$ and $T$ is invertible. Then $G = B E$ is standard Gaussian and
  $ det \( \( B D \)^(sans(T)) \( B D \) \) = J^2 det \( G^(sans(T)) G \) . $
  The action of $B$ on $F^perp$ is independent of $G$. Conditional on $G$ and the tuple, $C_0$ is fixed with orthonormal rows and $C_0 B E = 0$. Thus $tilde(A) = C_0 B$ has law $gamma_(k \, d)^F$, independently of $G$ given the tuple. Since $B$ is independent of the replica experiment, this remains its law after conditioning also on the original $A$. The test is observable from $\( B \, U_1 \, dots.h \, U_t \)$: $C_0$, $C_0 B$, and its evaluated label $C_0 U_1$ are all determined there. The common density versions of Theorem 15 make the last factor measurable, finite, and positive almost surely under the independent-tuple reference. The replica tuple is absolutely continuous with respect to that reference’s tuple marginal, so the same assertion holds for replicas.
  Under the independent-signal reference law, integrate the factor $det \( G^(sans(T)) G \)^(- k \/ 2)$ first. It contributes $Z_(k \, m)$. The remaining expectation is
  $ integral c J^(- k) p_(tilde(A)) \( tilde(A) S_1 \)^(- m) p^(⊗ t) \( d upright(bold(s)) \) gamma_(k \, d)^F \( d tilde(A) \) = 1 $
  by Corollary 16. This proves the normalization of (32).
  Here are the needed Gaussian determinant bounds. Gram–Schmidt expresses $det \( G^(sans(T)) G \)$ as a product of independent chi-squares with degrees $nu = ell \, ell - 1 \, dots.h \, ell - m + 1$; this standard Gaussian reduction is also described by Edelman and Rao #cite(label("EdelmanRao2005")) Section 5. The smallest degree is $3 k + 1 > k$. Since $k$ is even, direct integration of the chi-square density gives
  $ bb(E) \( chi_nu^2 \)^(- k \/ 2) = product_(j = 1)^(k \/ 2) \( nu - 2 j \)^(- 1) lt.eq \( 2 k \)^(- k \/ 2) . $
  In particular $Z_(k \, m) < oo$. The same densities give absolute logarithmic integrability, and Jensen gives $bb(E) log det \( G^(sans(T)) G \) lt.eq m log ell$. Consequently
  #[#set math.equation(numbering: n => "(34)")
   $ log Z_(k \, m) + k / 2 bb(E) log det \( G^(sans(T)) G \) lt.eq C k m . $ <eq:gaussian-wishart-remainder>]
  Before taking logarithms of the test, we control the positive logarithm of its projection density. For a fixed tuple put
  $ delta \( s' \) = lr(bar.v.double P_(F^perp) \( s' - S_1 \) bar.v.double) . $
  The ball-average density version in Theorem 15 holds at $tilde(A) S_1$ under the independent-tuple reference and hence under the replica law. The coordinates of $tilde(A) \( s' - S_1 \)$ are independent centered Gaussians with variance $delta \( s' \)^2$. A ball has probability at most its volume times the maximum Gaussian density. Apply this bound to the ball averages and then use Fatou’s lemma:
  #[#set math.equation(numbering: n => "(35)")
   $ bb(E)_(tilde(A)) p_(tilde(A)) \( tilde(A) S_1 \) lt.eq \( 2 pi \)^(- k \/ 2) integral delta \( s' \)^(- k) thin p \( d s' \) . $ <eq:gaussian-negative-moment>]
  Here and below such conditional estimates hold for almost every tuple. The affine space $S_1 + F$ has dimension $m$, so (23) gives
  $ p { delta lt.eq r } lt.eq L C^d r^(d - 1 - m) \, #h(2em) 0 < r lt.eq 1 . $
  Since $d - 1 - m > k$, tail integration bounds the inverse moment uniformly over tuples for fixed $d \, L$. Thus $log^(+) p_(tilde(A)) \( tilde(A) S_1 \)$ is integrable.
  The projected law has divergence $K' lt.eq K < oo$ from the independent-signal reference. Normalization of the test and (19) imply that $\( log Lambda \)^(+)$ is integrable. Its defining identity is
  #[#set math.equation(numbering: n => "(36)")
   $ log Lambda & = log c - log Z_(k \, m) - k log J - k / 2 log det \( G^(sans(T)) G \)\
 & #h(2em) - m log p_(tilde(A)) \( tilde(A) S_1 \) . $ <eq:gaussian-test-log>]
  The negative part of this expression is bounded by a constant and the positive logarithms of $J$, the Gaussian determinant, and the last density. Those are integrable by Lemma 18, the chi-square calculation, and (35). Thus $log Lambda$ is absolutely integrable. Solving (36) for the last logarithm proves its absolute integrability as well.
  We may now apply the entropy test (18) to obtain $K' gt.eq bb(E) log Lambda$. Subtract this bound from (31). Equation (36) displays the exact cancellation of $- k bb(E) log J$, and (34) bounds the remaining determinant terms by $C k m$. This gives (33). ◻
]

=== 4.2 Comparing the remaining projection densities <comparing-the-remaining-projection-densities>

Both the actual $A$ and the observable $tilde(A)$ annihilate $F$. The preceding lemma has removed the affine volume from the information bound. It remains to compare the two densities in (33). We first bound the conditional mean of the new density by a sum of averages of the actual density. The radii in that sum will depend only on $A$, allowing us to average the actual label with its original density $p_A$.

#thm([Lemma 4.2.])[
  (Dyadic density comparison).  #emph[In the replica experiment with the independent side matrix and $tilde(A) = C_0 B$ defined above, 
#[#set math.equation(numbering: n => "(37)")
 $ bb(E) #h(-0.16667em) [log p_(tilde(A)) \( tilde(A) S_1 \) - log p_A \( Y \)] lt.eq C k + C log \( 2 + log L \) . $ <eq:gaussian-density-comparison>]

]
] <lem:gaussian-density>

#proof[
  Fix the tuple and its actual $\( A \, Y \)$, and again write $delta \( s' \) = lr(bar.v.double P_(F^perp) \( s' - S_1 \) bar.v.double)$. Conditional on these data, $tilde(A)$ has law $gamma_(k \, d)^F$. We refine the inverse-moment bound (35) by using $A$. Choose the deterministic integer
  #[#set math.equation(numbering: n => "(38)")
   $ J_0 = 1 + ⌈frac(log_2 L + C_1 d, d - 1 - m - k)⌉ $ <eq:gaussian-cutoff>]
  with a sufficiently large absolute $C_1$. The denominator is bounded below by a positive absolute multiple of $d$. The contribution of $delta lt.eq 2^(- J_0)$ to the inverse moment, including the Gaussian constant, is at most
  $ \( 2 pi \)^(- k \/ 2) sum_(j gt.eq J_0) 2^(\( j + 1 \) k) L C^d 2^(- j \( d - 1 - m \)) lt.eq 1 . $
  For the remaining distances use the bins $delta in \( r \/ 2 \, r \]$, where $r = 2 \, 1 \, dots.h \, 2^(- J_0 + 1)$. These cover the remaining values because $delta \( s' \) lt.eq lr(bar.v.double s' - S_1 bar.v.double) lt.eq 2$. Since $A$ annihilates $F$,
  $ lr(bar.v.double A s' - Y bar.v.double) lt.eq lr(bar.v.double  bar.v.double) A_(upright("op")) thin delta \( s' \) . $
  Let $v_k$ be the unit $k$-ball volume, and let $overline(p)_A^(thin a) \( y \)$ be the average of $p_A$ over the radius-$a$ ball centered at $y$. The contribution of one bin is at most
  $ \( 2 \/ r \)^k p { delta lt.eq r } lt.eq 2^k v_k lr(bar.v.double  bar.v.double) A_(upright("op"))^k overline(p)_A^(thin lr(bar.v.double  bar.v.double) A_(upright("op")) r) \( Y \) . $
  Integrating $e^(- lr(bar.v.double  bar.v.double) z^2 \/ 2)$ on the radius-$sqrt(k)$ ball gives $v_k lt.eq \( 2 pi e \/ k \)^(k \/ 2)$. Hence
  #[#set math.equation(numbering: n => "(39)")
   $ bb(E)_(tilde(A)) p_(tilde(A)) \( tilde(A) S_1 \) lt.eq 1 + (frac(C lr(bar.v.double  bar.v.double) A_(upright("op")), sqrt(k)))^k sum_r overline(p)_A^(thin lr(bar.v.double  bar.v.double) A_(upright("op")) r) \( Y \) . $ <eq:gaussian-density-sum>]
  The right side depends on the tuple only through $\( A \, Y \)$.
  Divide by the finite positive density $p_A \( Y \)$ and apply Jensen first to $tilde(A)$; all logarithms are integrable by Lemma 19. Only after obtaining (39) do we average over $Y$ given $A$. Its law is then the original $p_A \( y \) thin d y$, and for every radius fixed by $A$,
  $ bb(E)_(Y divides A) frac(overline(p)_A^(thin a) \( Y \), p_A \( Y \)) lt.eq 1 \, #h(2em) bb(E)_(Y divides A) frac(1, p_A \( Y \)) lt.eq v_k lr(bar.v.double  bar.v.double) A_(upright("op"))^k . $
  The first inequality integrates an averaged probability density over ${ p_A > 0 }$, and the second is the volume of that set, contained in the radius-$lr(bar.v.double  bar.v.double) A_(upright("op"))$ ball. A second application of Jensen thus bounds the expected log ratio by
  #[#set math.equation(numbering: n => "(40)")
   $ k bb(E) log #h(-0.16667em) (C (1 + frac(lr(bar.v.double  bar.v.double) A_(upright("op")), sqrt(k)))) + log \( J_0 + 2 \) . $ <eq:gaussian-density-jensen>]
  This order of averaging is essential: before the tuple has disappeared, its conditional label need not have density $p_A$ under further conditioning.
  For completeness, choose $1 \/ 4$-nets of the unit spheres in $bb(R)^d$ and $bb(R)^k$, with at most $9^d$ and $9^k$ points. The operator norm is at most twice the maximum absolute Gaussian bilinear form on these nets. The expected maximum of $N$ absolute standard normals is at most $sqrt(2 log \( 2 N \))$, by the exponential-moment bound; their independence is not required. Thus $bb(E) lr(bar.v.double  bar.v.double) A_(upright("op")) lt.eq C sqrt(d)$. Since $k$ is a fixed positive fraction of $d$, Jensen bounds the first term of (40) by $C k$. The cutoff (38) gives $log \( J_0 + 2 \) lt.eq C log \( 2 + log L \)$, proving the lemma. ◻
]

#proof[
  Generate $W$ conditionally on $\( A \, Y \)$ independently of the replicas. Each pair $\( S_i \, W \)$ has the original pair law, and the side matrix $B$ is independent of the whole construction. Lemma 13, followed by Lemmas 19 and 20, gives
  $ t I \( S \; W divides B \, B S \) lt.eq H \( W \) + C k m + m #scale(x: 120%, y: 120%)[\(] C k + C log \( 2 + log L \) #scale(x: 120%, y: 120%)[\)] . $
  Here the representative signal is coupled independently with $B$, exactly as in the original block experiment. Since $t = m + 1$ and $k$ is proportional to $d$, division by $t$ proves (1). ◻
]

== 5 Shared data and distance-bin comparisons <sec:distance-bins>

The determinant test in the preceding section pays a double logarithm of the largest prior density. We instead encode the dyadic scale of each projected simplex height. Under a prior bounded by $e^b$, these scales have entropy $O \( 1 + b \/ d \)$. The projected correlation recovers the height and label-density terms, leaving this scale cost. Since the chosen scale depends on the side matrix, the central step compares it with a mixture over fixed scales before averaging the matrix.

Throughout this section, for sufficiently large $d$, set

#[#set math.equation(numbering: n => "(41)")
 $ k = floor.l d \/ 16 floor.r \, #h(2em) q = floor.l d \/ 8 floor.r \, #h(2em) p = floor.l d \/ 2 floor.r . $ <eq:distance-dimensions>]

Here $k$ is the number of actual rows, $q$ is the number of replicas, and $p$ is the number of side rows. In particular $k gt.eq d \/ 32$, $q gt.eq d \/ 16$, $q gt.eq 2$, and $p - i + 2 gt.eq 2 k$ for $2 lt.eq i lt.eq q$.

#thm([Theorem 5.1.])[
  (Information from shared exact data).  #emph[Let $P = f sigma_d$ be a probability with a nonnegative Borel density $f lt.eq e^b$, where $b gt.eq 0$. Let $S tilde.op P$, let $A$ be an independent $k times d$ standard Gaussian matrix, and put $Y = A S$. Let a finite message $W$ be drawn from a kernel of $\( A \, Y \)$, conditionally independently of $S$. Let $B$ be a $p times d$ standard Gaussian matrix independent of the entire joint experiment producing $\( S \, A \, Y \, W \)$. Then 
#[#set math.equation(numbering: n => "(42)")
 $ I \( S \; W divides B \, B S \) lt.eq frac(H \( W \), q) + C (d + b / d) $ <eq:distance-block>]

 for an absolute $C$, uniformly over the prior and message kernel.]
] <thm:distance-block>

The order of (42) also follows from Theorem 1: append $k$ ignored fresh rows to $A$ and first use the initial $8 k$ rows of $B$. The Gaussian theorem gives the entropy denominator $2 k + 1 gt.eq q$, and $8 k lt.eq p$. Adding the remaining independent side rows can only decrease the conditional information, because independence of the side matrix gives

$ I \( S \; W divides B \, B S \) = I \( S \; W \) - I \( W \; B \, B S \) . $

Finally $log \( 2 + b \) lt.eq log \( 2 + d \) + b \/ d lt.eq C d + b \/ d$. The direct proof below identifies the entropy of the chosen distance scales as the prior cost.

=== 5.1 The shared-data law and its affine heights <the-shared-data-law-and-its-affine-heights>

Write $g_A^0$ and $g_A$ for the projected densities of $sigma_d$ and $P$, using the versions in (24). Put $overline(f) \( A \, y \) = g_A \( y \) \/ g_A^0 \( y \)$ on the open ellipsoid. At labels with $g_A \( y \) > 0$, the posterior density on the corresponding uniform fiber is bounded by $exp \( b_(A \, y) \)$, where

#[#set math.equation(numbering: n => "(43)")
 $ b_(A \, y) = b - log overline(f) \( A \, y \) gt.eq 0 \, #h(2em) bb(E) b_(A \, Y) = b - bb(E)_A D_(upright("KL")) \( g_A bar.v.double g_A^0 \) lt.eq b . $ <eq:distance-posterior-budget>]

These quantities are integrable: the positive density-ratio logarithm is bounded by $b$, and its negative part is controlled by $- z log z lt.eq 1 \/ e$ against the probability density $g_A^0$.

Given $\( A \, Y \)$, draw $S_1 \, dots.h \, S_q$ independently from the posterior. Under this shared-data law, $A S_i = Y$, and each pair $\( S_i \, A \)$ has the original independent signal–matrix law. Define

$ F_i = "aff" \( S_1 \, dots.h \, S_(i - 1) \) \, #h(2em) rho_i = "dist" \( S_i \, F_i \) \, #h(2em) 2 lt.eq i lt.eq q . $

The next estimate is stronger than merely proving logarithmic integrability: its prior cost is divided by the ambient dimension.

#thm([Lemma 5.2.])[
  (Logarithmic cost of a height).  #emph[The heights are positive almost surely and obey 
#[#set math.equation(numbering: n => "(44)")
 $ rho_i lt.eq 2 \, #h(2em) bb(E) log^(-) rho_i lt.eq C (1 + b / d) \, #h(2em) log^(-) x := max { 0 \, - log x } . $ <eq:distance-height>]

]
] <lem:distance-heights>

#proof[
  We first record a uniform-sphere distance estimate. Let $U$ be uniform on $S^(n - 1)$ with $n lt.eq d$, and let $E$ be a linear subspace of dimension $j$ whose codimension $h = n - j$ is at least $d \/ 2$. Write a normalized Gaussian representation with independent components $X in bb(R)^h$ and $Z in bb(R)^j$. For $t gt.eq log 2$,
  $ "dist" \( U \, E \) < e^(- t) quad arrow.r.double quad lr(bar.v.double  bar.v.double) X lt.eq 2 e^(- t) lr(bar.v.double  bar.v.double) Z . $
  The Gaussian density bound and the unit-ball volume estimate give $bb(P) { lr(bar.v.double  bar.v.double) X lt.eq a } lt.eq \( C a \/ sqrt(h) \)^h$. Also
  $ bb(E) e^(lr(bar.v.double  bar.v.double) Z^2 \/ 4) = 2^(j \/ 2) \, #h(2em) lr(bar.v.double  bar.v.double) z^h lt.eq \( 2 h \)^(h \/ 2) e^(lr(bar.v.double  bar.v.double) z^2 \/ 4) . $
  Since $j lt.eq d lt.eq 2 h$, these inequalities yield $bb(E) lr(bar.v.double  bar.v.double) Z^h lt.eq \( C sqrt(h) \)^h$. Hence
  $ bb(P) { "dist" \( U \, E \) < e^(- t) } lt.eq \( C e^(- t) \)^h . $
  If the law of $U$ is reweighted by a density at most $e^a$, the right side is multiplied by $e^a$ and capped by one. Integrating the logarithmic tail gives
  #[#set math.equation(numbering: n => "(45)")
   $ bb(E) log^(-) "dist" \( U \, E \) lt.eq C + a / h . $ <eq:distance-linear-log>]
  The case $j = 0$ is immediate and also satisfies this bound.
  Condition now on $\( A \, Y \, S_1 \, dots.h \, S_(i - 1) \)$. Let $r$ and $s_0$ be the radius and center of the posterior fiber, and write $u_j = \( S_j - s_0 \) \/ r$. The vectors lie on the unit sphere in $ker A$, of ambient dimension $n = d - k$, and the next vector has density at most $e^(b_(A \, Y))$ there. Moreover
  $ rho_i / r = "dist" \( u_i \, "aff" \( u_1 \, dots.h \, u_(i - 1) \) \) gt.eq "dist" \( u_i \, "span" \( u_1 \, dots.h \, u_(i - 1) \) \) . $
  The latter span has dimension at most $i - 1$ and codimension at least $d - k - q + 1 gt.eq d \/ 2$. Apply (45) and then (43). The additional contribution $bb(E) \[ - log r \]$ is bounded by an absolute constant: for each fixed signal, rotational invariance of the independent row space of $A$ makes $r$ a uniform-vector distance to a $k$-dimensional linear space, so (45) applies with $a = 0$. This proves the negative-log bound. A zero height would make that expectation infinite, so heights are positive almost surely. The bound $rho_i lt.eq 2$ follows because all signals are on the unit sphere. ◻
]

Set

$ h_k = bb(E) \[ - log g_A \( Y \) \] . $

This is finite by Lemma 18. Apply Corollary 16 with its row count equal to the present $k$, its difference count equal to $q - 1$, and its replica count equal to $q$. The required relation $k + q - 1 lt.eq 3 d \/ 16 - 1 lt.eq d - 2$ holds in the present dimensions. The exact likelihood is

#[#set math.equation(numbering: n => "(46)")
 $ frac(d Q, d #scale(x: 120%, y: 120%)[\(] P^(⊗ q) \( d upright(bold(s)) \) gamma_(k \, d)^F \( d A \) #scale(x: 120%, y: 120%)[\)]) = \( 2 pi \)^(- k \( q - 1 \) \/ 2) J \( upright(bold(s)) \)^(- k) g_A \( A s_1 \)^(1 - q) . $ <eq:distance-likelihood>]

Here $Q$ is the shared-data law and $F$ is the span of all difference columns. The evaluated density uses the exact versions established in Theorem 15.

Since $J = product_(i = 2)^q rho_i$, all logarithms in (46) are integrable by Lemma 22 and Lemma 18. Data processing after forgetting $A$ gives the finite upper bound

#[#set math.equation(numbering: n => "(47)")
 $ "tc" \( S_1 \, dots.h \, S_q \) lt.eq \( q - 1 \) h_k - k sum_(i = 2)^q bb(E) log rho_i - frac(k \( q - 1 \), 2) log \( 2 pi \) . $ <eq:distance-correlation-upper>]

=== 5.2 Projected height bins <projected-height-bins>

Draw the independent side matrix $B$ and put $C_i = B S_i$. Conditional on the tuple, the image of the direction space of $F_i$ has rank $i - 2$ almost surely. The orthogonal residual of $S_i$ from $F_i$ has length $rho_i$. Its image under $B$ is an $N \( 0 \, rho_i^2 I_p \)$ vector, independent of the restriction of $B$ to that direction space. Projecting off the image of the direction space shows that

#[#set math.equation(numbering: n => "(48)")
 $ T_i := "dist" \( C_i \, B F_i \) med =^(upright("law")) med rho_i chi_(m_i) \, #h(2em) m_i = p - i + 2 \, $ <eq:distance-projected-height>]

conditional on the tuple. Here $chi_(m_i)$ is a chi variable. In particular $m_i gt.eq 2 k$.

Define the integer bin

$ K_i = ⌈log_2 \( T_i \/ sqrt(m_i) \)⌉ \, $

with any fixed value at $T_i = 0$, a null event. Use the reference probabilities $pi_j = 2^(- \| j \|) \/ 3$ for $j in bb(Z)$; they sum to one. The chi-square second moment and the Gaussian small-ball bound show uniformly in $m gt.eq 1$ that

$ bb(E) log \( chi_m \/ sqrt(m) \) lt.eq 0 \, #h(2em) bb(E) \| log \( chi_m \/ sqrt(m) \) \| lt.eq C . $

For the first inequality use Jensen on the square. For the second, its positive part follows from the second moment, while the negative part follows by integrating $bb(P) { chi_m \/ sqrt(m) < e^(- t) } lt.eq min { 1 \, \( C e^(- t) \)^m }$. Together with Lemma 22, this gives

#[#set math.equation(numbering: n => "(49)")
 $ \( log 2 \) bb(E) K_i lt.eq bb(E) log rho_i + log 2 \, #h(2em) H \( K_i \) lt.eq bb(E) \[ - log pi_(K_i) \] lt.eq C (1 + b / d) . $ <eq:distance-bin-budget>]

The entropy bound is the elementary cross-entropy inequality, since $- log pi_j = log 3 + \| j \| log 2$ and the expected absolute bin index is bounded.

For fixed $B$, let $P_B$ be the law of $B S'$ for $S' tilde.op P$. Given $\( B \, C_1 \, dots.h \, C_(i - 1) \)$, the affine set $B F_i$ is known. Let $E_j$ be its tube of radius $sqrt(m_i) thin 2^j$. The bin event $K_i = j$ is contained in $E_j$. Since the marginal of $C_i$ given $B$ is $P_B$, conditional relative entropy followed by the bin map yields

#[#set math.equation(numbering: n => "(50)")
 $ I \( C_i \; C_1 \, dots.h \, C_(i - 1) divides B \) gt.eq - H \( K_i divides B \, C_1 \, dots.h \, C_(i - 1) \) - bb(E) log P_B \( E_(K_i) \) . $ <eq:distance-bin-information>]

To justify the logarithms, coordinatewise data processing makes the projected total correlation finite by (47). Each conditional divergence in its chain rule is therefore finite. Its image under the bin map is finite as well. The expected negative logarithm of the reference bin probability is that image divergence plus the finite conditional bin entropy. Since the tube probability is at least the bin probability, $- log P_B \( E_(K_i) \)$ is integrable. This also proves (50) without an undefined entropy difference.

=== 5.3 A fixed mixture before averaging the side matrix <a-fixed-mixture-before-averaging-the-side-matrix>

We will prove the one-height estimate

#[#set math.equation(numbering: n => "(51)")
 $ bb(E) log P_B \( E_(K_i) \) lt.eq k bb(E) log rho_i - h_k + C (k + 1 + b / d) . $ <eq:distance-tube-goal>]

Together with (50), this recovers the terms $h_k - k bb(E) log rho_i$ in the unprojected correlation bound. The selected bin $K_i$ depends on $B$. We first bound every fixed bin using a reference density that depends only on $A$, so that the eventual label average uses the original density $g_A$.

Fix the shared-data tuple and its $\( A \, Y \)$, and fix $i$. For a candidate $s'$, put $rho' = "dist" \( s' \, F_i \)$. Its distance to $B F_i$ after projection has law $rho' chi_(m_i)$, by the same calculation as (48). The Gaussian small-ball bound gives

$ bb(E)_B P_B \( E_j \) lt.eq integral min {1 \, (frac(4 dot.op 2^j, rho'))^(m_i)} P \( d s' \) . $

The minimum is one at zero denominator. Since $A$ is constant with value $Y$ on $F_i$, $lr(bar.v.double A s' - Y bar.v.double) lt.eq lr(bar.v.double  bar.v.double) A_(upright("op")) rho'$. Pushing $P$ forward by $A$ therefore gives the further bound

#[#set math.equation(numbering: n => "(52)")
 $ bb(E)_B P_B \( E_j \) lt.eq integral min {1 \, (frac(4 dot.op 2^j lr(bar.v.double  bar.v.double) A_(upright("op")), lr(bar.v.double y' - Y bar.v.double)))^(m_i)} g_A \( y' \) thin d y' . $ <eq:distance-tube-kernel>]

For $m > k$ and $beta > 0$, radial integration in $bb(R)^k$ gives the exact kernel mass

#[#set math.equation(numbering: n => "(53)")
 $ integral_(bb(R)^k) min { 1 \, \( beta \/ lr(bar.v.double  bar.v.double) u \)^m } thin d u = v_k beta^k frac(m, m - k) . $ <eq:distance-kernel-mass>]

Indeed the inside ball contributes $v_k beta^k$, and the exterior contributes $k v_k beta^k \/ \( m - k \)$. Let $a_(A \, j)$ be the probability density obtained by convolving $g_A$ with this normalized kernel, using $m = m_i$ and $beta = 4 dot.op 2^j lr(bar.v.double  bar.v.double) A_(upright("op"))$. Since $m_i gt.eq 2 k$ and $v_k lt.eq \( 2 pi e \/ k \)^(k \/ 2)$, (52) becomes

#[#set math.equation(numbering: n => "(54)")
 $ 2^(- k j) bb(E)_B P_B \( E_j \) lt.eq (frac(C lr(bar.v.double  bar.v.double) A_(upright("op")), sqrt(k)))^k a_(A \, j) \( Y \) . $ <eq:distance-fixed-bin>]

For each fixed $i$, this density depends on $A$ and $j$, but not on the replica tuple and not on $Y$ as a parameter of the density.

Define

$ a_A = sum_(j in bb(Z)) pi_j a_(A \, j) \, #h(2em) T_B = sum_(j in bb(Z)) pi_j 2^(- k j) P_B \( E_j \) . $

The first is a probability density depending only on $A$ and the fixed index $i$. Conditional on the shared-data outcome, (54) gives

$ bb(E)_B T_B lt.eq (frac(C lr(bar.v.double  bar.v.double) A_(upright("op")), sqrt(k)))^k a_A \( Y \) . $

The $j = K_i$ summand gives the pointwise inequality

#[#set math.equation(numbering: n => "(55)")
 $ log P_B \( E_(K_i) \) lt.eq k K_i log 2 - log pi_(K_i) + log T_B . $ <eq:distance-mixture>]

Before averaging logarithms, we verify their integrability. If $Z_(A \, j) = v_k \( 4 dot.op 2^j lr(bar.v.double  bar.v.double) A_(upright("op")) \)^k m_i \/ \( m_i - k \)$, then for $y$ in the support of $g_A$,

$ pi_0 / Z_(A \, 0) lt.eq a_A \( y \) lt.eq sup g_A . $

The lower bound holds because the support has diameter at most $2 lr(bar.v.double  bar.v.double) A_(upright("op"))$, so the unnormalized kernel at $j = 0$ equals one throughout that support. The upper bound follows by convolving a bounded density with a probability density. The positive log of $sup g_A$ is integrable by the uniform projected-density formula and the Gaussian log-determinant bound. The absolute log of $Z_(A \, 0)$ is integrable: $log^(+) lr(bar.v.double  bar.v.double) A_(upright("op"))$ is controlled by its finite mean, and $log^(-) lr(bar.v.double  bar.v.double) A_(upright("op")) lt.eq log^(-) lr(bar.v.double A u_0 bar.v.double)$ for any fixed unit $u_0$, whose norm is chi-distributed. Thus $log a_A \( Y \)$ is absolutely integrable.

The pointwise inequality (55) bounds $log^(-) T_B$ by the sum of $- log P_B \( E_(K_i) \)$, $k \| K_i \| log 2$, and $- log pi_(K_i)$, all integrable. For the positive part, $bb(E)_B log^(+) T_B lt.eq log \( 1 + bb(E)_B T_B \)$, and (54) bounds its right side using $a_A \( Y \)$ and $lr(bar.v.double  bar.v.double) A_(upright("op"))$ as above. Thus $log T_B$ is absolutely integrable as well.

Conditional Jensen now gives

$ bb(E)_B log T_B lt.eq k log (frac(C lr(bar.v.double  bar.v.double) A_(upright("op")), sqrt(k))) + log a_A \( Y \) . $

The right side depends only on $\( A \, Y \)$. In the full experiment $Y divides A$ has density $g_A$, and nonnegativity of $D_(upright("KL")) \( g_A bar.v.double a_A \)$ therefore gives

#[#set math.equation(numbering: n => "(56)")
 $ bb(E) log a_A \( Y \) lt.eq bb(E) log g_A \( Y \) = - h_k . $ <eq:distance-reference-density>]

This is where the fact that $a_A$ depends only on $A$ is needed. Also $bb(E) log \( C lr(bar.v.double  bar.v.double) A_(upright("op")) \/ sqrt(k) \) lt.eq C$ by the Gaussian norm estimate in Section 4, since $k gt.eq d \/ 32$. Consequently $bb(E) log T_B lt.eq C k - h_k$. Combining this with (55) and (49) proves (51).

Insert (51) in (50), use the entropy bound in (49), and sum the conditional divergences over $i = 2 \, dots.h \, q$. The projected correlation satisfies

#[#set math.equation(numbering: n => "(57)")
 $ "tc" \( C_1 \, dots.h \, C_q divides B \) gt.eq \( q - 1 \) h_k - k sum_(i = 2)^q bb(E) log rho_i - C \( q - 1 \) (k + 1 + b / d) . $ <eq:distance-correlation-lower>]

#proof[
  Generate $W$ from the shared data independently of the replicas conditional on $\( A \, Y \)$. Each replica has the original signal–message pair law, and $B$ is independent of this coupling. The finite correlation bound (47) therefore permits Lemma 13 with $t = q$:
  $ q I \( S \; W divides B \, B S \) lt.eq H \( W \) + "tc" \( S_1 \, dots.h \, S_q \) - "tc" \( C_1 \, dots.h \, C_q divides B \) . $
  Subtract (57) from (47). The measurement entropy and all height logarithms cancel. Since $k lt.eq d \/ 16$, division by $q$ gives (42). Section 6 applies this bound while conditioning only on the current state and retaining its separate late elimination of the clock cost. ◻
]

== 6 Current-state recurrences and the streaming bound <sec:streaming-consequences>

We now complete the streaming applications of the Gaussian determinant test and the distance-bin test through two current-state iterations. Both use one independent side matrix throughout the stream. They condition on the present padded state, apply a complete bounded-prior block bound in that conditional experiment, and only then average over state values. Thus their information upper bounds never subtract two possibly infinite averages of conditional total correlations.

=== 6.1 The Gaussian replica clock <the-gaussian-replica-clock>

#thm([Proposition 6.1.])[
  (Current-state iteration of Gaussian replicas).  #emph[Let $M \( d \) = o \( d^2 \)$ be nonnegative and integer-valued, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$. A learner in Definition 3 whose uniform-prior angular success is at least $3 \/ 5$ satisfies 
$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

 for an absolute $c > 0$ and all sufficiently large $d$. The threshold may depend on the memory sequence.]
] <prop:gaussian-streaming>

#proof[
  Use the first step of Lemma 9 to choose a fixed shared-seed conditional experiment with success at least $3 \/ 5$ and then take its Borel replacement. Its initialization is independent of the signal and all rows; fresh transition and output randomness remains in the kernels. This selection uses the original jointly measurable experiment and does not require a jointly measurable family of Borel replacements.
  Put $beta = log \( 1 \/ epsilon.alt \)$. If $T > d beta$, the conclusion is immediate. On the remaining branch, Lemmas 9 and 11 give padded states of entropy at most
  #[#set math.equation(numbering: n => "(58)")
   $ h_T = M log 2 + log \( T + 2 \) = o \( d^2 \) \, #h(2em) beta = o \( d \) \, #h(2em) T = o \( d^2 \) . $ <eq:gaussian-clock-width>]
  Let
  $ k = 2 floor.l d \/ 16 floor.r \, #h(2em) t = k + 1 \, #h(2em) ell = 4 k \, #h(2em) n = ceil.l T \/ k ceil.r . $
  Append ignored fresh samples so that the padded stream has $n$ complete blocks. Let $V_i$ be the padded state at the end of block $i$, with $V_0$ the data-independent initial padded state. The latter includes a possible stopping decision at index zero. Draw a single standard Gaussian $ell times d$ matrix $B$ independently of the entire selected learner experiment and all appended rows, and put $Z = B S$.
  Consider a positive-probability value $V_i = v$, and put $p_v = bb(P) { V_i = v }$. By Lemma 10, its conditional signal law has a Borel density $f_v$ satisfying
  $ f_v lt.eq L_v := 1 \/ p_v quad upright("relative to ") sigma_d \, #h(2em) sum_v p_v log L_v = H \( V_i \) . $
  The next block matrix is independent of the pair $\( S \, V_i \)$: the state uses only the signal, completed rows, and learner randomness, and the new rows are fresh. Given $v$, the next state is a finite kernel of the new matrix $A$ and its exact label $A S$. The side matrix $B$ remains independent of this entire conditional signal, block, and message experiment. Therefore Theorem 1 applies with $L = L_v$ and with message $V_(i + 1)$.
  Apply that numerical bound at each $v$ before averaging. Concavity of $x mapsto log \( 2 + x \)$ and the entropy bound give
  #[#set math.equation(numbering: n => "(59)")
   $ I \( S \; V_(i + 1) divides V_i \, B \, Z \) & lt.eq frac(H \( V_(i + 1) divides V_i \), t) + C d + C sum_v p_v log \( 2 + log L_v \)\
 & lt.eq h_T / t + C d + C log \( 2 + H \( V_i \) \)\
 & lt.eq h_T / t + C d + C log \( 2 + h_T \) . $ <eq:gaussian-current-step>]
  All conditional uses have bounded priors and finite conditional replica correlation, as established in the block theorem. Since $t asymp d$ and $h_T = o \( d^2 \)$, the last line is at most $C_1 d$ for all sufficiently large $d$, with one absolute $C_1$.
  Write $cal(I) \( V \) = I \( S \; V divides B \, Z \)$. The chain rule and data processing give
  $ cal(I) \( V_(i + 1) \) lt.eq cal(I) \( V_i \) + I \( S \; V_(i + 1) divides V_i \, B \, Z \) . $
  Here $cal(I) \( V_0 \) = 0$ by the independence of initialization and the index-zero decision from $\( S \, B \, Z \)$. Iterating (59) yields
  #[#set math.equation(numbering: n => "(60)")
   $ cal(I) \( V_n \) lt.eq C_1 d n . $ <eq:gaussian-information-clock>]
  The side row count satisfies $ell = 8 floor.l d \/ 16 floor.r lt.eq d \/ 2$. The postponed output is a kernel of $V_n$ with fresh randomness, so (7) gives
  #[#set math.equation(numbering: n => "(61)")
   $ cal(I) \( V_n \) gt.eq 1 / 2 \( d - ell - 1 \) log frac(1, 5 epsilon.alt) - log 2 gt.eq c_1 d beta $ <eq:gaussian-streaming-endpoint>]
  for large $d$. Lemma 12 also gives $T > floor.l d \/ 2 floor.r$. In particular $T > 0$, and for $d gt.eq 32$ the inequality $k gt.eq d \/ 16$ gives the explicit clock comparison
  $ d n lt.eq d \( T \/ k + 1 \) lt.eq 16 T + d lt.eq 18 T . $
  Combining this with (60) and (61) proves the proposition. ◻
]

=== 6.2 The distance-bin clock <the-distance-bin-clock>

#thm([Proposition 6.2.])[
  (Current-state iteration of distance bins).  #emph[Under the hypotheses of Theorem 2, the distance-bin block estimate (42) also gives $T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \)$ for an absolute $c > 0$ and all sufficiently large $d$.]
] <prop:distance-streaming>

#proof[
  Apply Lemma 9 with $p = 2 \/ 3$ and $p' = 3 \/ 5$. It first fixes a shared seed using the original jointly measurable experiment, then chooses Borel versions in that conditional experiment and fixes its independent initialization and remaining fresh randomness. We obtain deterministic Borel state-based rules and an output with uniform-prior success at least $3 \/ 5$. Pad stopping and postpone this output. The final output is a function of the final tagged state.
  For this route keep the convenient clock bound
  #[#set math.equation(numbering: n => "(62)")
   $ frak(m)_T = M log 2 + log \( T + 3 \) . $ <eq:distance-clock-width>]
  Indeed, the exact count in Lemma 9 is $\( T + 2 \) 2^M$, so the entropy of every padded state is at most $h_T lt.eq frak(m)_T$. Use
  $ k = floor.l d \/ 16 floor.r \, #h(2em) q = floor.l d \/ 8 floor.r \, #h(2em) p = floor.l d \/ 2 floor.r \, #h(2em) n = ceil.l T \/ k ceil.r \, $
  and append ignored fresh rows through the last block. Let $V_0 \, dots.h \, V_n$ be the block-end states, starting with the data-independent tagged initial state. Independently of the entire deterministic learner experiment and all rows, draw one $p times d$ standard Gaussian matrix $B$. It is used only for analysis. Put $Z = B S$ and $cal(D) \( V \) = I \( S \; V divides B \, Z \)$.
  For a block from $V$ to $W$, condition on a value $v$ with probability $p_v > 0$. By Lemma 10, the conditional signal density is bounded by $exp \( b_v \)$, where $b_v = log \( 1 \/ p_v \)$. The next standard Gaussian matrix $A$ is independent of $\( S \, V \)$, the ending state is a function of $\( v \, A \, A S \)$, and $B$ remains independent of the entire conditional experiment. Apply Theorem 21 at this fixed $v$ and then average. Since $sum_v p_v b_v = H \( V \)$,
  #[#set math.equation(numbering: n => "(63)")
   $ I \( S \; W divides V \, B \, Z \) & lt.eq frac(H \( W divides V \), q) + C (d + frac(H \( V \), d))\
 & lt.eq C_2 (d + frak(m)_T / d) . $ <eq:distance-current-step>]
  The last inequality uses $q gt.eq d \/ 16$ for large $d$. In this calculation the prior cost $b_v \/ d$ is averaged linearly; no entire state history is retained. The chain rule gives $cal(D) \( W \) - cal(D) \( V \) lt.eq I \( S \; W divides V \, B \, Z \)$, and $cal(D) \( V_0 \) = 0$. Consequently
  #[#set math.equation(numbering: n => "(64)")
   $ cal(D) \( V_n \) lt.eq C_2 n (d + frak(m)_T / d) . $ <eq:distance-information-clock>]
  For the exact side row count $p = floor.l d \/ 2 floor.r$, the independent residual-sphere endpoint (9) gives
  #[#set math.equation(numbering: n => "(65)")
   $ cal(D) \( V_n \) gt.eq 1 / 2 \( d - p - 1 \) log frac(1, 4 epsilon.alt) - log 2 gt.eq c_2 d beta \, #h(2em) beta = log \( 1 \/ epsilon.alt \) \, $ <eq:distance-streaming-endpoint>]
  for sufficiently large $d$. This is the direct $90 \/ d$ radius estimate and the event of mass at least $1 \/ 2$ used in the distance-bin route. The corresponding raw-data bound in Lemma 12 also yields $T > floor.l d \/ 2 floor.r$, equivalently $T > d \/ 2$ for integer $T$. The zero-row experiment in that lemma has residual radius one.
  If $T gt.eq d beta$, the asserted lower bound is immediate. Otherwise $cal(D) \( V_n \) lt.eq H \( V_n \) lt.eq frak(m)_T$ and (65) give the route’s clock inequality
  $ c_2 d beta lt.eq M log 2 + log \( T + 3 \) lt.eq M log 2 + log \( d beta + 3 \) . $
  Since $d beta + 3 lt.eq \( d + 3 \) \( beta + 1 \)$ and $log \( 1 + beta \) lt.eq beta$, this implies, for large $d$,
  #[#set math.equation(numbering: n => "(66)")
   $ beta lt.eq frac(C \( M + log d + 1 \), d) = o \( d \) . $ <eq:distance-short-clock>]
  Thus $T < d beta = o \( d^2 \)$ and $frak(m)_T = o \( d^2 \)$. The right side of (64) is consequently at most $C_3 n d$. For $d gt.eq 32$, $k gt.eq d \/ 32$, and $T > d \/ 2$ gives
  $ d n lt.eq 32 T + d lt.eq 34 T . $
  Comparing the resulting upper bound $cal(D) \( V_n \) lt.eq C_4 T$ with (65) proves the proposition. ◻
]

#proof[
  Its uniform-prior success $2 \/ 3$ is at least the $3 \/ 5$ required by Proposition 23, which proves the theorem. Proposition 24 gives a second proof using the linear entropy cost. The later sections give three further proofs: the Haar current-state argument in Proposition 31, and the synthetic and incidence full-history arguments in Proposition 35 and Theorem 44. Each uses the same learner model, while retaining its own side law, conditional experiment, and clock estimate. ◻
]

== 7 Haar projections and posterior replica information <sec:haar>

This comparison uses Haar frames rather than the Gaussian side matrices of Sections 4 and 5. We express the replica measure by successive simplex heights. The normalization changes at each insertion because the remaining ambient dimension shrinks. A projected-distance distribution-function test, valid even with atoms, recovers a fraction of the height cost. We choose its exponent below one as a function of $d$ and keep the resulting entropy remainder explicit.

Proposition 29 gives that remainder in terms of the state entropies. In particular, the block cost is $O \( d \)$ when all state alphabets have logarithmic width $o \( d^2 \)$. We first prove the fixed-prior height identity and cancellation, then average over state values. A Gaussian observation block is converted to its orthonormal row frame only in that final step; the learner’s observations are still the original exact Gaussian pairs.

Write $sigma = sigma_d$ and $log^(+) x = max { 0 \, log x }$ for $x > 0$. A $j$-frame is a $j times d$ matrix with orthonormal rows; its Haar law is the probability law invariant under orthogonal changes of ambient coordinates. Throughout the section set

#[#set math.equation(numbering: n => "(67)")
 $ d gt.eq 64 \, #h(2em) k = r = floor.l d \/ 16 floor.r \, #h(2em) m = r + 1 \, #h(2em) ell = floor.l d \/ 4 floor.r . $ <haar:dimensions>]

Here $k$ is the actual block row count, $r$ is the number of height insertions, $m = r + 1$ is the replica count, and $ell$ is the side-frame row count. At the $i$th insertion, $1 lt.eq i lt.eq r$, the two dimensions that will matter are

#[#set math.equation(numbering: n => "(68)")
 $ n_i = d - i + 1 \, #h(2em) q_i = ell - i + 1 . $ <haar:dimension-slack>]

They satisfy

#[#set math.equation(numbering: n => "(69)")
 $ n_i > k + 2 \, #h(2em) q_i gt.eq frac(3 d, 16) > k \, #h(2em) frac(q_i, q_i - k) lt.eq 3 / 2 \, #h(2em) n_i / q_i lt.eq 16 / 3 \, #h(2em) d / k lt.eq 32 . $ <haar:dimension-bounds>]

Indeed, $q_i gt.eq ell - r + 1 gt.eq 3 d \/ 16$ and $k lt.eq d \/ 16$; also $k gt.eq d \/ 32$ for $d gt.eq 64$. The other inequalities follow at once. In particular, none of the denominators in (69) vanishes.

=== 7.1 An exact identity for the replica measure <an-exact-identity-for-the-replica-measure>

We begin with the normalization of spherical projection. For integers $1 lt.eq j < n - 2$, put

$ alpha_(n \, j) = frac(Gamma \( n \/ 2 \), pi^(j \/ 2) Gamma \( \( n - j \) \/ 2 \)) \, #h(2em) v_j = frac(pi^(j \/ 2), Gamma \( j \/ 2 + 1 \)) . $

Here $v_j$ is the volume of the unit ball in $bb(R)^j$. The first $j$ coordinates of a uniform point of $S^(n - 1)$ have density

#[#set math.equation(numbering: n => "(70)")
 $ p_(n \, j) \( u \) = alpha_(n \, j) \( 1 - lr(bar.v.double u bar.v.double)^2 \)^(\( n - j - 2 \) \/ 2) upright(bold(1))_({ lr(bar.v.double u bar.v.double) < 1 }) . $ <haar:sphere-density>]

Conditional on these coordinates, the remaining direction is uniform, with radius $sqrt(1 - lr(bar.v.double u bar.v.double)^2)$. These are the density and conditional law in Lemma 14, specialized to ambient dimension $n$ and a matrix with orthonormal rows. We keep the ambient dimension in the notation because it changes at each insertion.

We will also use the elementary estimates

#[#set math.equation(numbering: n => "(71)")
 $ alpha_(n \, j) lt.eq n^(j \/ 2) \, #h(2em) v_j alpha_(n \, j) lt.eq \( C n \/ j \)^(j \/ 2) \, $ <haar:gamma-bounds>]

where $C$ is absolute. For completeness, gamma recursion and $Gamma \( z + 1 \/ 2 \) lt.eq sqrt(z) thin Gamma \( z \)$ imply $Gamma \( n \/ 2 \) \/ Gamma \( \( n - j \) \/ 2 \) lt.eq \( n \/ 2 \)^(j \/ 2)$; the half-step inequality is Cauchy–Schwarz in the gamma integral. Integrating that integral over $\[ j \/ 2 \, j \/ 2 + 1 \]$ gives $Gamma \( j \/ 2 + 1 \) gt.eq \( j \/ 2 \)^(j \/ 2) e^(- j \/ 2 - 1)$. These two bounds prove (71).

Let $P = g sigma$ be a probability measure with a bounded Borel density $0 lt.eq g lt.eq K < oo$. Necessarily $K gt.eq 1$. Draw an independent Haar $k$-frame $A$ and $S tilde.op P$, and write $Y = A S$. Under $sigma$, the density of $Y$ is

$ p^0 \( y \) = alpha_(d \, k) \( 1 - lr(bar.v.double y bar.v.double)^2 \)^(\( d - k - 2 \) \/ 2) upright(bold(1))_({ lr(bar.v.double y bar.v.double) < 1 }) . $

For $lr(bar.v.double y bar.v.double) < 1$, let $U_(A \, y)$ be uniform probability on the sphere ${ s in S^(d - 1) : A s = y }$. On $lr(bar.v.double y bar.v.double) gt.eq 1$, choose any fixed measurable probability kernel for $U_(A \, y)$; it will always be multiplied by $p^0 \( y \) = 0$. Fix the following density and posterior versions:

#[#set math.equation(numbering: n => "(72)")
 $ p_A \( y \) & = p^0 \( y \) integral g thin upright(d) U_(A \, y) quad \( lr(bar.v.double y bar.v.double) < 1 \) \, #h(2em) p_A \( y \) = 0 quad \( lr(bar.v.double y bar.v.double) gt.eq 1 \) \,\
P_(A \, y) \( upright(d) s \) & = frac(g \( s \), integral g thin upright(d) U_(A \, y)) thin U_(A \, y) \( upright(d) s \) quad upright("when ") p_A \( y \) > 0 . $ <haar:posterior>]

The posterior on the unused set ${ p_A = 0 }$ may be any fixed measurable probability kernel. These are measurable versions. For example, a fiber direction can be generated by projecting a standard Gaussian onto $ker A$ and normalizing it. If $u$ is that unit direction, the fiber point is $A^(sans(T)) y + sqrt(1 - lr(bar.v.double y bar.v.double)^2) thin u$. A fixed coordinate convention handles the null normalization failures. This construction also makes $p_A \( y \)$ jointly measurable in $\( A \, y \)$. We have $p_A lt.eq K p^0$ and, for every $A$, $p_A$ is a probability density.

For a tuple $bold(s) = \( s_0 \, dots.h \, s_r \)$, define

$ D_i = "span" { s_1 - s_0 \, dots.h \, s_i - s_0 } \, #h(2em) D_0 = { 0 } \, #h(2em) delta_i = "dist" \( s_i - s_0 \, D_(i - 1) \) . $

Thus $delta_i$ is the height added by the $i$th point. Write $upright(d) A_D$ for Haar probability on the $k$-frames in $D^perp$. All subspaces arising here have $dim D^perp gt.eq d - r > k$. A measurable version of this frame kernel is obtained by projecting independent standard Gaussians onto $D^perp$ and applying a fixed Gram–Schmidt rule. We use $upright(d) A$ when $D = { 0 }$.

#thm([Lemma 7.1.])[
  (Haar simplex-height identity).  #emph[For the dimensions in (67) and every probability $P = g sigma$ with $0 lt.eq g lt.eq K < oo$, the following finite measures on the frame and the whole tuple are equal: 
#[#set math.equation(numbering: n => "(73)")
 $ upright(d) A integral_(bb(R)^k) p_A \( y \)^m thin upright(d) y product_(i = 0)^r P_(A \, y) \( upright(d) s_i \) = (product_(i = 0)^r P \( upright(d) s_i \)) (product_(i = 1)^r alpha_(d - i + 1 \, k) delta_i^(- k)) upright(d) A_(D_r) . $ <haar:coarea-identity>]

 Equality means equality after integration against every bounded Borel function of $\( A \, bold(s) \)$. Define the displayed product density to be zero on degenerate tuples. The measure on the right is supported on tuples with $dim D_i = i$ for all $1 lt.eq i lt.eq r$.]
] <haar:coarea>

#proof[
  We first take $P = sigma$. Fix $s_0 \, dots.h \, s_(i - 1)$ with $dim D_(i - 1) = i - 1$, and put $H = D_(i - 1)^perp$, so $dim H = n_i = d - i + 1$. For a bounded continuous function $phi \( A \, s \)$, consider
  #[#set math.equation(numbering: n => "(74)")
   $ I_t = integral upright(d) A_(D_(i - 1)) integral sigma \( upright(d) s \) thin phi \( A \, s \) frac(upright(bold(1))_({ lr(bar.v.double A \( s - s_0 \) bar.v.double) lt.eq t }), v_k t^k) \, #h(2em) t > 0 . $ <haar:small-ball-insertion>]
  We compute its limit as $t arrow.b 0$ in both orders of integration.
  Fix $A$ first. Disintegration of $sigma$ under $s mapsto A s$ rewrites the inner integral as the average over the ball of radius $t$ about $A s_0$ of
  $ y mapsto p^0 \( y \) integral phi \( A \, s \) thin U_(A \, y) \( upright(d) s \) . $
  This function is continuous in the open unit ball. Indeed, use the fiber representation following (72) with a common uniform direction and apply bounded convergence. Because $d > k + 2$, the factor $p^0$ tends to zero at the boundary, so the product extends continuously by zero to $bb(R)^k$. The average therefore tends to
  #[#set math.equation(numbering: n => "(75)")
   $ p^0 \( A s_0 \) integral phi \( A \, s \) thin U_(A \, A s_0) \( upright(d) s \) . $ <haar:first-order-limit>]
  Its absolute value, and that of every preceding average, is at most $lr(bar.v.double phi bar.v.double)_oo alpha_(d \, k)$. Dominated convergence thus permits the frame integration as well.
  For the other order, fix $s$ and put $delta = lr(bar.v.double "proj"_H \( s - s_0 \) bar.v.double)$. When $delta > 0$, the vector $A \( s - s_0 \)$ under $upright(d) A_(D_(i - 1))$ has density
  #[#set math.equation(numbering: n => "(76)")
   $ z mapsto delta^(- k) alpha_(n_i \, k) (1 - lr(bar.v.double z bar.v.double)^2 / delta^2)^(\( n_i - k - 2 \) \/ 2) upright(bold(1))_({ lr(bar.v.double z bar.v.double) < delta }) . $ <haar:insertion-density>]
  This is (70) in the current ambient space $H$, not in the original $d$-dimensional space. Since $n_i > k + 2$, the density is bounded by its value $alpha_(n_i \, k) delta^(- k)$ at zero.
  The conditional frame law also has a concrete limit. Put $e = "proj"_H \( s - s_0 \) \/ delta$ and $w = z \/ delta$. If $C$ is a Haar $k$-frame in $H ∩ e^perp$, then the conditional law of $A$ given $A \( s - s_0 \) = z$, for $lr(bar.v.double w bar.v.double) < 1$, is the law of
  #[#set math.equation(numbering: n => "(77)")
   $ A = w e^(sans(T)) + \( I_k - w w^(sans(T)) \)^(1 \/ 2) C . $ <haar:conditional-frame>]
  Its rows are orthonormal and $A e = w$. Invariance under rotations fixing $e$ identifies the remaining factor as Haar; conversely the displayed formula describes every such frame. The formula is continuous at $w = 0$. At zero the frame law is $upright(d) A_(D_i)$, since $H ∩ e^perp = D_i^perp$. It follows that the frame integral in (74) tends, for this $s$, to
  #[#set math.equation(numbering: n => "(78)")
   $ alpha_(n_i \, k) delta^(- k) integral phi \( A \, s \) thin upright(d) A_(D_i) . $ <haar:second-order-limit>]
  The bound $lr(bar.v.double phi bar.v.double)_oo alpha_(n_i \, k) delta^(- k)$ dominates the frame averages for every $t$. It is integrable in $s$. Choose a $\( k + 1 \)$-dimensional subspace $L subset \( D_(i - 1) + "span" { s_0 } \)^perp$; the available dimension is at least $d - i gt.eq d - r > k + 1$. Then $delta gt.eq lr(bar.v.double "proj"_L s bar.v.double)$. The latter vector has a bounded density by (70), because $d > k + 3$. In $k + 1$ dimensions its inverse $k$th power is integrable at zero: the radial integral is a constant times $integral_0^1 u^k u^(- k) thin upright(d) u < oo$. This also shows that $delta > 0$ for $sigma$-almost every $s$. Dominated convergence proves the second limit after integration in $s$.
  Equating the two integrated limits in (75) and (78) gives the insertion identity. Bounded continuous functions determine finite Borel measures on the compact frame–sphere space, so the identity also holds for bounded Borel tests. The frame and fiber constructions above make the kernels measurable in the preceding tuple, allowing successive integration.
  Start with $sigma \( upright(d) s_0 \) upright(d) A$ and insert, for $i = 1 \, dots.h \, r$, the kernels $p^0 \( A s_0 \) U_(A \, A s_0) \( upright(d) s_i \)$. Each insertion changes the frame law from $upright(d) A_(D_(i - 1))$ to $upright(d) A_(D_i)$ and contributes $alpha_(d - i + 1 \, k) delta_i^(- k)$. On the original side, disintegration of $s_0$ contributes one more factor $p^0 \( y \)$, so its total power is $r + 1 = m$. These measures are finite at every step because $p^0 lt.eq alpha_(d \, k)$; in particular their final mass is $integral p^0 \( y \)^m thin upright(d) y lt.eq alpha_(d \, k)^(m - 1)$. The preceding almost-sure positivity of every inserted height gives the full-rank support. This proves (73) for $sigma$.
  Finally multiply this equality of measures by the bounded Borel function $product_(i = 0)^r g \( s_i \)$. Formula (72) changes the left side into the stated measure for $P$, while the right side becomes the product of $P$ measures in (73). The bounded tilt preserves finiteness. No continuity of $g$ or of $p_A$ was used. ◻
]

We now pass from the finite measure to the actual posterior experiment. Draw $\( A \, Y \)$ with law $upright(d) A thin p_A \( y \) upright(d) y$, and, conditionally on $\( A \, Y \)$, draw $S_0 \, dots.h \, S_r$ independently from $P_(A \, Y)$. Write $Q$ for the law including the frame and tuple, and $Q_S$ for its tuple marginal. Each $\( A \, S_i \)$ has law $upright(d) A thin P \( upright(d) s \)$, and all the replicas satisfy $A S_i = Y$ almost surely.

Define the probability measure $Lambda \( upright(d) A \, upright(d) bold(s) \) = P^(⊗ m) \( upright(d) bold(s) \) upright(d) A_(D_r)$. The degenerate tuples have zero $P^(⊗ m)$-measure, by the positivity proved during insertion; fix any measurable convention there. Multiply (73) by $p_A \( A s_0 \)^(- r)$ on its positive set, and by zero on its zero set. This operation is justified first for the minimum with a finite constant and then by monotone convergence. On the left it changes $p_A^m$ to $p_A$, since $m = r + 1$ and the used posterior is supported on $A s_0 = y$. Consequently

#[#set math.equation(numbering: n => "(79)")
 $ frac(upright(d) Q, upright(d) Lambda) \( A \, bold(s) \) = (product_(i = 1)^r alpha_(d - i + 1 \, k) delta_i^(- k)) p_A \( A s_0 \)^(- r) $ <haar:replica-density>]

on the positive-density, full-rank set, with value zero elsewhere.

For a fresh Haar $ell$-frame $B$, independent of this whole experiment, put $Z_i = B S_i$ and let $P_B$ be the image of $P$ under $B$. Define the two total correlations

#[#set math.equation(numbering: n => "(80)")
 $ J_S = D_(upright("KL")) \( Q_S bar.v.double P^(⊗ m) \) \, #h(2em) J_Z = bb(E)_B D_(upright("KL")) \( Q_(Z_0 \, dots.h \, Z_r divides B) bar.v.double P_B^(⊗ m) \) . $ <haar:correlations>]

#thm([Lemma 7.2.])[
  (Finite upper correlation).  #emph[The correlations satisfy $0 lt.eq J_Z lt.eq J_S lt.eq U < oo$, where 
#[#set math.equation(numbering: n => "(81)")
 $ U & = sum_(i = 1)^r [log alpha_(d - i + 1 \, k) + k bb(E)_Q log \( 1 \/ delta_i \) - bb(E)_(A \, S tilde.op P) log p_A \( A S \)] \,\
0 lt.eq U & lt.eq C r d \( log K + log d \) . $ <haar:upper-U>]

 Here $bb(E)_(A \, S tilde.op P)$ draws the Haar frame independently of a vector with law $P$. Every logarithm in (81) is integrable.]
] <haar:upper-correlation>

#proof[
  The positive part of $log p_A$ under $p_A$ is bounded uniformly in $A$ by $log^(+) \( K alpha_(d \, k) \)$. Its negative part is also integrable uniformly: the density is supported in a ball of finite volume, and $- x log x lt.eq 1 \/ e$ for $0 < x lt.eq 1$. Comparison with uniform probability on the unit ball now gives
  #[#set math.equation(numbering: n => "(82)")
   $ - bb(E)_(A \, S tilde.op P) log p_A \( A S \) lt.eq log v_k . $ <haar:density-entropy>]
  To control a height, condition on $\( A \, Y \, S_0 \, dots.h \, S_(i - 1) \)$. Put $h = sqrt(1 - lr(bar.v.double Y bar.v.double)^2)$ and $n = d - k$. Almost surely $h > 0$. The conditional residual direction of $S_i$ in $ker A$ has density at most
  $ K' = frac(K p^0 \( Y \), p_A \( Y \)) gt.eq 1 $
  relative to uniform probability on $S^(n - 1)$. Choose a unit vector $e in ker A$ perpendicular to the preceding residual directions, including that of $S_0$. There are at most $i lt.eq r < n$ such directions; a fixed Gram–Schmidt rule makes the choice measurable. Then $e perp D_(i - 1)$. If $U_i$ is the new unit residual direction, then
  $ delta_i gt.eq \| chevron.l e \, S_i - S_0 chevron.r \| = h \| chevron.l e \, U_i chevron.r \| . $
  The one-coordinate case of (70) and (71) yield
  $ bb(P) { \| chevron.l e \, U_i chevron.r \| lt.eq t divides A \, Y \, S_0 \, dots.h \, S_(i - 1) } lt.eq min \( 1 \, C K' sqrt(d) thin t \) . $
  Integrating this tail with $t = e^(- u)$ shows that the conditional expectation of $log \( 1 \/ \| chevron.l e \, U_i chevron.r \| \)$ is at most $1 + log \( C K' sqrt(d) \)$.
  For fixed $A$, the expected density tilt is
  $ bb(E) \[ log K' divides A \] = log K - D_(upright("KL")) \( p_A bar.v.double p^0 \) lt.eq log K . $
  The divergence is finite: $p_A \/ p^0 lt.eq K$ controls its positive part, and $- x log x lt.eq 1 \/ e$ controls its negative part under $p^0$. Also the individual marginal $\( A \, S_0 \)$ consists of an independent Haar frame and a unit vector. Thus $lr(bar.v.double A S_0 bar.v.double)^2$ has beta parameters $k \/ 2 \, \( d - k \) \/ 2$ for every fixed target, with both parameters positive. The beta integral gives
  #[#set math.equation(numbering: n => "(83)")
   $ bb(E) h^(- 2) = frac(d - 2, d - k - 2) lt.eq C \, #h(2em) bb(E) log \( 1 \/ h \) lt.eq 1 / 2 log bb(E) h^(- 2) lt.eq C . $ <haar:radius-moment>]
  Combining these estimates gives $bb(E) log \( 1 \/ delta_i \) lt.eq C + log K + C log d$. The negative part is bounded because $delta_i lt.eq 2$. Both signs of every height logarithm are therefore integrable.
  We may now take the expected logarithm of (79). It is exactly the finite relative entropy $D_(upright("KL")) \( Q bar.v.double Lambda \) = U$. Forgetting $A$ by data processing yields $J_S lt.eq U$. Adding the independent $B$ and then projecting coordinatewise yields $J_Z lt.eq J_S$. Finally (71), (82), and the height bound give (81). ◻
]

The inverse-height terms in the upper bound can grow with the density bound $K$. We will keep those terms until the projected correlation has supplied matching lower bounds. This order is what permits averaging over rare states at the end.

=== 7.2 The correlation retained by the auxiliary projection <the-correlation-retained-by-the-auxiliary-projection>

We will bound the probability that an independent projected signal lies close to the affine span of preceding projected replicas. Averaging over the side frame turns this tube probability into ball averages of $p_A$ around the actual label $A S_0$. Their radii vary with the simplex height; the next lemma controls the logarithmic cost of taking a supremum over those radii.

For a probability density $f$ on $bb(R)^k$, define its centered maximal average by

$ cal(M) f \( u \) = sup_(t > 0) frac(1, v_k t^k) integral_(lr(bar.v.double u' - u bar.v.double) lt.eq t) f \( u' \) thin upright(d) u' . $

For fixed $f in L^1$, the ball integral is continuous in its center and positive radius; the supremum may therefore be restricted to positive rational radii. In particular $cal(M) f$ is measurable. For the jointly measurable family $p_A$, the same rational supremum and Tonelli’s theorem give joint measurability in $\( A \, u \)$.

For historical background on one-dimensional maximal averages, see Hardy and Littlewood #cite(label("HardyLittlewood1930")) Section III. Stein and Strömberg #cite(label("SteinStromberg1983")) p. 259 discuss the exponential dimension cost of customary covering proofs. We prove the centered weak estimate needed here, including its constant.

#thm([Lemma 7.3.])[
  (Logarithmic maximal estimate).  #emph[Suppose $f$ is a probability density supported in the unit ball of $bb(R)^k$ and $f lt.eq K alpha_(d \, k)$. Then 
#[#set math.equation(numbering: n => "(84)")
 $ integral f \( u \) log frac(cal(M) f \( u \), f \( u \)) thin upright(d) u lt.eq C d + log \( 1 + C d + log K \) . $ <haar:maximal-log>]

 Both logarithms are integrable under $f \( u \) upright(d) u$. The integrand is taken as zero on ${ f = 0 }$.]
] <haar:maximal>

#proof[
  For every $lambda > 0$,
  #[#set math.equation(numbering: n => "(85)")
   $ \| { u : cal(M) f \( u \) > lambda } #scale(x: 120%, y: 120%)[\|] lt.eq 3^k / lambda . $ <haar:weak-maximal>]
  To prove this, take a compact subset of the displayed superlevel set. Open and closed balls have the same $f$-mass, since their boundaries have Lebesgue measure zero. At each point choose an open ball centered there whose $f$-mass exceeds $lambda$ times its volume. The strict inequality persists under a sufficiently small enlargement, so these balls give an open cover. Take a finite subcover and greedily keep disjoint balls in decreasing order of radius. Every discarded ball meets a retained ball of at least its radius, and is contained in that ball’s threefold dilation. Hence the compact set has volume at most $3^k$ times the sum of the retained volumes. The retained balls are disjoint and have total $f$-mass at most one, so their volumes sum to less than $1 \/ lambda$. Inner regularity proves (85).
  Set $b = 3^k$ and $L_f = K alpha_(d \, k)$. Since $cal(M) f lt.eq L_f$, layer integration over the unit ball gives
  $ integral_(lr(bar.v.double u bar.v.double) lt.eq 1) cal(M) f \( u \) thin upright(d) u & lt.eq integral_0^(L_f) min \( v_k \, b \/ lambda \) thin upright(d) lambda\
 & lt.eq b #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( L_f v_k \/ b \) #scale(x: 120%, y: 120%)[\)] . $
  On the support of $f$, a radius-two ball contains the whole unit ball, so $cal(M) f gt.eq \( v_k 2^k \)^(- 1)$ there. Its logarithm is bounded on that support, while $f log f$ is integrable by the bounded-density argument in Lemma 26. Jensen’s inequality under the probability density $f$ now yields
  $ integral f log \( cal(M) f \/ f \) lt.eq log integral_({ f > 0 }) cal(M) f lt.eq k log 3 + log #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( K alpha_(d \, k) v_k \/ 3^k \) #scale(x: 120%, y: 120%)[\)] . $
  Use (71) and $d \/ k lt.eq 32$ to obtain (84). ◻
]

The next test uses only the projected points, including when their conditional distance distribution has atoms.

#thm([Lemma 7.4.])[
  (Lower projected correlation).  #emph[For the replica law above and every $0 < a < 1$, 
#[#set math.equation(numbering: n => "(86)")
 $ J_Z gt.eq a sum_(i = 1)^r [k bb(E)_Q log \( 1 \/ delta_i \) - log \( C_1^k v_k \) - bb(E)_(A \, S tilde.op P) log cal(M) p_A \( A S \)] + r log \( 1 - a \) \, $ <haar:lower-Z>]

 where $C_1$ is an absolute constant, independent of $P \, K \, d \, a$.]
] <haar:lower-correlation>

#proof[
  Given $\( B \, Z_0 \, dots.h \, Z_(i - 1) \)$, define for $z in bb(R)^ell$
  $ R_i \( z \) = "dist" #scale(x: 120%, y: 120%)[\(] z - Z_0 \, "span" { Z_j - Z_0 : 1 lt.eq j < i } #scale(x: 120%, y: 120%)[\)] . $
  Let $F_i \( t \) = P { s : R_i \( B s \) lt.eq t }$ be its distribution function under an independent $s tilde.op P$. The distance, and hence this conditional distribution function, is measurable in the projected history: the distance is the infimum of the corresponding norms over rational coefficient vectors. Let $rho_i = R_i \( Z_i \)$ be the actual replica distance.
  If a random variable $R$ has distribution function $F$, then
  #[#set math.equation(numbering: n => "(87)")
   $ bb(P) { F \( R \) lt.eq u } lt.eq u #h(2em) \( 0 lt.eq u lt.eq 1 \) . $ <haar:superuniform>]
  This includes distributions with atoms. In fact, the set of real $x$ with $F \( x \) lt.eq u$ is an initial interval, whose probability is the supremum of $F$ on that interval and is at most $u$. Tail integration of (87) gives, for $0 < a < 1$,
  #[#set math.equation(numbering: n => "(88)")
   $ bb(E) F \( R \)^(- a) lt.eq 1 + integral_1^oo t^(- 1 \/ a) thin upright(d) t = frac(1, 1 - a) . $ <haar:cdf-moment>]
  In particular $F \( R \) > 0$ almost surely under its own law.
  Apply the relative-entropy variational inequality to the test $z mapsto F_i \( R_i \( z \) \)^(- a)$ under the conditional one-vector reference law $P_B$. For an unbounded test, use its minimum with a finite constant and pass monotonically to the limit; (88) bounds its reference expectation. The chain rule for $J_Z$ has one term for each conditional law of $Z_i$ given $\( B \, Z_0 \, dots.h \, Z_(i - 1) \)$, and its $i = 0$ term is zero. It follows that
  #[#set math.equation(numbering: n => "(89)")
   $ J_Z gt.eq a sum_(i = 1)^r bb(E)_(Q \, B) log frac(1, F_i \( rho_i \)) + r log \( 1 - a \) . $ <haar:cdf-test>]
  The logarithmic expectations are finite: the variational bound after averaging controls their nonnegative parts by the finite correlation $J_Z lt.eq J_S$ from Lemma 26.
  We next estimate $F_i \( delta_i \)$ while holding the entire replica outcome $\( A \, S_0 \, dots.h \, S_r \)$ fixed. Put $D = D_(i - 1)$ and $E = "row" \( B \)$. The isometry $B^(sans(T)) : bb(R)^ell arrow.r E$ gives the exact identity
  #[#set math.equation(numbering: n => "(90)")
   $ "dist" \( B u \, B D \) = lr(bar.v.double "proj"_(E ∩ D^perp) u bar.v.double) . $ <haar:intersection>]
  Indeed, the orthogonal complement within $E$ of $"proj"_E D$ is precisely $E ∩ D^perp$. The projection of the fixed $\( i - 1 \)$-space $D$ into a Haar $ell$-space $E$ has full rank almost surely: generate $E$ with independent standard Gaussians and restrict them to an orthonormal basis of $D$, obtaining an $ell times \( i - 1 \)$ Gaussian matrix of full column rank. Thus $dim \( E ∩ D^perp \) = q_i = ell - i + 1$. Rotations preserving $D$ show that this intersection is a uniform $q_i$-space in the $n_i$-space $D^perp$.
  For fixed $u$, let $v = "proj"_(D^perp) u$. Spherical projection in that $n_i$-space, followed by (71), gives
  #[#set math.equation(numbering: n => "(91)")
   $ bb(P)_B { "dist" \( B u \, B D \) lt.eq t } lt.eq min (1 \, (frac(C_0 t, lr(bar.v.double v bar.v.double)))^(q_i)) \, $ <haar:projected-small-ball>]
  with value one if $v = 0$. The constant $C_0$ is absolute because $n_i \/ q_i lt.eq 16 \/ 3$; the density formula is applicable because $n_i - q_i = d - ell > 2$. In the replica experiment $A$ annihilates $D$. Therefore for $u = s - S_0$, $lr(bar.v.double v bar.v.double) gt.eq lr(bar.v.double A \( s - S_0 \) bar.v.double)$. Also $rho_i lt.eq delta_i$, since $B$ is a contraction and the distance minimization permits all vectors in $D$.
  Set $u_0 = A S_0$ and $q = q_i$. The identity
  $ min \( 1 \, \( b \/ x \)^q \) = integral_1^oo q t^(- q - 1) upright(bold(1))_({ x lt.eq b t }) thin upright(d) t #h(2em) \( b > 0 \, med x gt.eq 0 \) $
  also holds at $x = 0$. Integrating (91) against $s tilde.op P$ and using Tonelli’s theorem yields
  #[#set math.equation(numbering: n => "(92)")
   $ bb(E)_B F_i \( delta_i \) & lt.eq integral_1^oo q t^(- q - 1) P { lr(bar.v.double A s - u_0 bar.v.double) lt.eq C_0 delta_i t } thin upright(d) t\
 & lt.eq v_k \( C_0 delta_i \)^k cal(M) p_A \( u_0 \) integral_1^oo q t^(k - q - 1) thin upright(d) t\
 & = frac(q_i, q_i - k) v_k \( C_0 delta_i \)^k cal(M) p_A \( u_0 \) lt.eq C_1^k v_k delta_i^k cal(M) p_A \( u_0 \) . $ <haar:projected-maximal>]
  The integral converges because $q_i > k$, and the last step uses the exact bound $q_i \/ \( q_i - k \) lt.eq 3 \/ 2$. One absolute choice of $C_1$ works for every $k gt.eq 1$.
  Now $F_i \( rho_i \) lt.eq F_i \( delta_i \)$. Jensen’s inequality for $- log$ and (92), first for each fixed replica outcome, give
  $ bb(E)_(Q \, B) log frac(1, F_i \( rho_i \)) gt.eq k bb(E)_Q log \( 1 \/ delta_i \) - log \( C_1^k v_k \) - bb(E)_(A \, S tilde.op P) log cal(M) p_A \( A S \) . $
  Here the last expectation uses the individual marginal $\( A \, S_0 \)$. The right side is finite by Lemmas 26 and 27; Jensen may also be read in the extended sense before averaging. Substitution into (89) proves (86). ◻
]

=== 7.3 Cancellation and the block information bound <cancellation-and-the-block-information-bound>

The preceding estimates can now be subtracted. Retaining every term of $U$ gives, for every $0 < a < 1$,

#[#set math.equation(numbering: n => "(93)")
 $ J_S - J_Z lt.eq  & \( 1 - a \) U - r log \( 1 - a \)\
 & + a sum_(i = 1)^r [log \( alpha_(d - i + 1 \, k) C_1^k v_k \) + bb(E)_(A \, S tilde.op P) log frac(cal(M) p_A \( A S \), p_A \( A S \))] . $ <haar:cancellation>]

Thus only the fraction $a$ of the height contribution has been canceled; the residual $\( 1 - a \) U$ remains explicit. Take

#[#set math.equation(numbering: n => "(94)")
 $ a = 1 - d^(- 3) . $ <haar:a-choice>]

Using (81), (71), and Lemma 27 in (93) yields

#[#set math.equation(numbering: n => "(95)")
 $ frac(J_S - J_Z, m) lt.eq C d + log \( 1 + C d + log K \) + C frac(log K + log d, d^2) . $ <haar:fixed-prior-budget>]

In detail, $\( 1 - a \) U \/ m lt.eq C \( log K + log d \) \/ d^2$ because $r \/ m lt.eq 1$, and $- r log \( 1 - a \) \/ m lt.eq 3 log d$. Also $log \( alpha_(n_i \, k) C_1^k v_k \) lt.eq C d$ by (71) and $n_i \/ k lt.eq 32$. These are all the terms in (93); the $3 log d$ term is absorbed into $C d$.

#thm([Proposition 7.5.])[
  (Haar block information bound).  #emph[Let $S tilde.op sigma$, let $V$ be a finite-valued state, and let a block consist of $k = floor.l d \/ 16 floor.r$ fresh independent standard Gaussian designs, independent of $\( S \, V \)$ and the past, with their exact labels. Suppose a finite-valued state $W$ is generated by a measurable randomized kernel from $V$ and the full block, with no other retained information from the past. Let $B$ be a Haar $ell = floor.l d \/ 4 floor.r$ frame drawn independently of the entire joint experiment producing $S \, V$, the block, and $W$. Then 
#[#set math.equation(numbering: n => "(96)")
 $ I \( S \; W divides V \, B \, B S \) lt.eq  & frac(H \( W divides V \), m) + C d + log \( 1 + C d + H \( V \) \)\
 & + C frac(H \( V \) + log d, d^2) \, #h(2em) m = floor.l d \/ 16 floor.r + 1 . $ <haar:state-budget>]

 The constant $C$ is absolute. If every state has logarithmic width at most $H_(*) = o \( d^2 \)$, the left side is at most $C d$ for all sufficiently large $d$.]
] <haar:block>

#proof[
  Fix a state value $v$ with probability $p_v > 0$. Its conditional signal law has the bounded density
  $ g_v \( s \) = frac(bb(P) { V = v divides S = s }, p_v) lt.eq K_v := 1 / p_v $
  relative to $sigma$. The new Gaussian design matrix is independent of $\( S \, V \)$. Its row Gram–Schmidt factorization is $R A$ with an invertible triangular $R$ and a Haar $k$-frame $A$, almost surely. The exact labels are $R \( A S \)$, so, conditional on the design, observing them is equivalent to observing $Y = A S$. Because the whole design is independent of $S$ conditional on $V = v$, its coefficients $R$ add no information about $S$ once $\( A \, Y \)$ is specified.
  Generate the replicas conditionally independently from this posterior, and independently of $W$ given $v$ and the complete block data. A single replica then has the same joint law with the block data and $W$ as the original signal: both use the posterior given the block, and $W$ has no further dependence on the signal once those data and $v$ are fixed. In particular each pair $\( S_i \, W \)$ has the same conditional law as $\( S \, W \)$, the auxiliary $B$ is independent of the entire tuple and $W$, and the original pair used on the left is also coupled independently with $B$. The common map $\( B \, s \) mapsto B s$ is continuous, and the unprojected total correlation is finite by Lemma 26. These are precisely the application hypotheses of Lemma 13. Applied in the conditional experiment $V = v$, it gives
  $ m I \( S \; W divides V = v \, B \, B S \) lt.eq H \( W divides V = v \) + J_S \( v \) - J_Z \( v \) . $
  No conditional independence of the replicas given $W$ is asserted or needed.
  Insert (95) with $K = K_v$ and average over $v$. The identity
  $ sum_v p_v log K_v = sum_v p_v log \( 1 \/ p_v \) = H \( V \) $
  accounts exactly for rare state values. Jensen’s inequality bounds the average of $log \( 1 + C d + log K_v \)$ by $log \( 1 + C d + H \( V \) \)$. This proves (96). Under the width hypothesis, $H \( W divides V \) \/ m = o \( d \)$, the last term is $o \( 1 \)$, and the logarithmic term is $O \( log d \)$ for all sufficiently large $d$. The stated $C d$ bound follows. ◻
]

=== 7.4 The terminal fiber and the streaming conclusion <the-terminal-fiber-and-the-streaming-conclusion>

The block comparison is complete. We apply the residual-sphere endpoint of Section 2 with the present Haar side frame, then compare the resulting information with the number of blocks.

#thm([Lemma 7.6.])[
  (The terminal Haar fiber).  #emph[Let $S tilde.op sigma$, let $V_f$ be finite-valued, and let the unit-valued output $hat(S)$ be generated from $V_f$ by a measurable kernel using fresh randomness, conditionally independently of $S$. Let $B$ be a Haar $ell = floor.l d \/ 4 floor.r$ frame independent of $\( S \, V_f \, hat(S) \)$. If $bb(P) { arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt } gt.eq 2 \/ 3$ for $0 < epsilon.alt lt.eq 1 \/ 10$, then 
#[#set math.equation(numbering: n => "(97)")
 $ I \( S \; V_f divides B \, B S \) gt.eq frac(d - ell - 1, 3) log frac(1, 4 epsilon.alt) - log 2 . $ <haar:terminal-information>]

]
] <haar:terminal>

#proof[
  Apply Lemma 6 with $G = B$, $V = V_f$, $b = ell$, and $r_0 = 1 \/ 2$. Its hypotheses hold because $B$ is independent of $\( S \, V_f \, hat(S) \)$. Explicitly, the Markov bound for the residual radius $h$ is $bb(P) { h < 1 \/ 2 } lt.eq 4 ell \/ \( 3 d \) lt.eq 1 \/ 3$. Success together with $h gt.eq 1 \/ 2$ therefore has probability at least $1 \/ 3$, while the conditional prior cap probability is at most $\( 4 epsilon.alt \)^(d - ell - 1)$. These are exactly the constants in (97). ◻
]

#thm([Proposition 7.7.])[
  (Streaming consequence).  #emph[For each dimension $d$, let $S tilde.op sigma$ and consider a learner in Definition 3, with deterministic horizon $T = T \( d \)$ and nonnegative integer memory $M = M \( d \)$. If $M \( d \) = o \( d^2 \)$, $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$, and its angular success probability averaged over the signal, samples, and learner randomness is at least $2 \/ 3$, then 
$ T \( d \) = Omega #scale(x: 120%, y: 120%)[\(] d log \( 1 \/ epsilon.alt \( d \) \) #scale(x: 120%, y: 120%)[\)] . $

 The implicit constant is absolute; the dimension threshold may depend on the memory sequence.]
] <haar:streaming>

#proof[
  Apply the fixed-shared-seed part of Lemma 9 to the learner in Definition 3. The resulting Borel experiment has data-independent initialization and uniform-prior success at least $2 \/ 3$, with fresh transition and output randomness retained. This is the success threshold in Lemma 30.
  First, success forces $T = Omega \( d \)$ without any memory restriction. Suppose $T lt.eq d \/ 8$, and grant an estimator all $T$ raw pairs, filling in ignored samples after any early stopping. Lemma 5 with $b = T$ gives a uniform residual sphere in kernel dimension $d - T$; (4) bounds its probability of radius below $1 \/ 2$ by $4 T \/ \( 3 d \)$. At $T = 0$ the radius is one deterministically. On radius at least $1 \/ 2$, the cap argument of Lemma 12 bounds conditional success by $\( 4 epsilon.alt \)^(d - T - 1)$. Thus
  #[#set math.equation(numbering: n => "(98)")
   $ bb(P) { upright("angular error") lt.eq epsilon.alt } lt.eq frac(4 T, 3 d) + \( 4 epsilon.alt \)^(d - T - 1) #h(2em) \( T lt.eq d \/ 8 \) . $ <haar:raw-sample-bound>]
  The output has no further dependence on $S$ conditional on all the raw data, so the bound also covers randomized estimators. Its right side is at most $1 \/ 6 + \( 0.4 \)^(7 d \/ 8 - 1) < 2 \/ 3$ for all sufficiently large $d$. Hence $T > d \/ 8$ on those dimensions.
  Put $L = log \( 1 \/ epsilon.alt \) gt.eq log 10$. If $T gt.eq d L$, the conclusion already holds. On the remaining branch $T < d L$, apply the output-capacity bound of Lemma 11 to this uniform-prior experiment with $p_0 = 2 \/ 3$. It gives
  #[#set math.equation(numbering: n => "(99)")
   $ \( d - 1 \) L lt.eq M log 2 + log \( T + 1 \) + log \( 3 \/ 2 \) . $ <haar:output-count>]
  For large $d$, $log \( T + 1 \) lt.eq log \( d L + 1 \) lt.eq d L \/ 2$: here $d L gt.eq d log 10$ and $log \( x + 1 \) lt.eq x \/ 2$ for $x gt.eq 3$. Thus (99) implies
  #[#set math.equation(numbering: n => "(100)")
   $ d L lt.eq C \( M + 1 \) \, #h(2em) L = o \( d \) \, #h(2em) T = o \( d^2 \) . $ <haar:short-clock>]
  For example, after subtracting $d L \/ 2$, the left side is $\( d \/ 2 - 1 \) L gt.eq d L \/ 4$ for $d gt.eq 4$. The second and third conclusions follow from $M = o \( d^2 \)$ and $T < d L$.
  Use Lemma 9 to retain the stopping index, postpone the fresh randomized output, and append ignored rows through the last block. Its state count gives every padded state entropy at most
  #[#set math.equation(numbering: n => "(101)")
   $ H_(*) = M log 2 + log \( T + 2 \) lt.eq M log 2 + log \( C \( M + 1 \) + 2 \) = o \( d^2 \) . $ <haar:padded-width>]
  This count restricts the branch where the block argument is needed; it does not replace that argument in the representable-precision regime.
  Use a single independent Haar $ell$-frame $B$ for the entire analysis, put $Z = B S$, and divide the padded stream into $N = ceil.l T \/ k ceil.r$ blocks. For consecutive states $V \, W$, the chain rule and data processing give
  $ I \( S \; W divides B \, Z \) lt.eq I \( S \; V \, W divides B \, Z \) = I \( S \; V divides B \, Z \) + I \( S \; W divides V \, B \, Z \) . $
  The initial state is independent of $\( S \, B \, Z \)$. Proposition 29 and (101) therefore imply
  #[#set math.equation(numbering: n => "(102)")
   $ I \( S \; V_f divides B \, Z \) lt.eq C d ceil.l T \/ k ceil.r . $ <haar:information-clock>]
  The terminal lower bound (97) is at least $c d L$ for all sufficiently large $d$: indeed $d - ell - 1 gt.eq d \/ 2$ and
  $ log frac(1, 4 epsilon.alt) gt.eq (1 - frac(log 4, log 10)) L \, $
  while the subtractive $log 2$ is absorbed because $d L arrow.r oo$. Finally $k gt.eq d \/ 32$ and the already proved $T > d \/ 8$ give
  $ d ceil.l T \/ k ceil.r lt.eq 32 T + d lt.eq 40 T . $
  Comparison with (102) proves the proposition. ◻
]

A learner that succeeds with probability at least $2 \/ 3$ for every fixed signal also has uniform-prior success at least $2 \/ 3$ by integration. Thus Proposition 31 separately gives the corresponding worst-signal lower bound, with the same exact observations and finite-state model.

== 8 Synthetic Gaussian projections <sec:synthetic>

The Gaussian test in Section 4 uses an orthonormal selector of the projected difference space’s complement. Here we instead draw additional Gaussian rows in that complement. Their composition with the side matrix has a random covariance, which must be averaged in the likelihood comparison. To normalize that comparison, we apply the Gaussian-base equal-label identity to the projected prior, rather than applying only its spherical instance to the original prior.

The inverse-determinant scale of this random covariance cancels the scale of the projected simplex volume. A critical inverse-distance kernel then gives a double-logarithmic density cost. Although the cost has the same order as in Section 4, the comparison law and cancellation are different. We use this bound while conditioning on an entire state history.

We use the spherical and Gaussian notation of Section 3. Fix $d gt.eq 16$ and put

#[#set math.equation(numbering: n => "(103)")
 $ k = ell = ⌊d / 8⌋ \, #h(2em) u = ell - 1 \, #h(2em) m = ⌊d / 2⌋ \, #h(2em) q = m - u . $ <syn:parameters>]

In particular,

#[#set math.equation(numbering: n => "(104)")
 $ k + u lt.eq m - 2 \, #h(2em) q - k - 1 = m - 2 k > 0 \, #h(2em) d - 1 - u - k = d - 2 k gt.eq frac(3 d, 4) \, #h(2em) frac(m, q - k - 1) lt.eq 2 . $ <syn:dimension-margins>]

The letter $m$ in this section is the dimension of the side projection. The difference count in Theorem 15 will be $u$.

#thm([Proposition 8.1.])[
  (Information beyond an independent Gaussian projection).  #emph[Let $P = f sigma_d$ be a probability, where $f$ is a nonnegative Borel function satisfying $f lt.eq Lambda < oo$, with $Lambda gt.eq 1$. Draw $X tilde.op P$ and $A tilde.op gamma_(k \, d)$ independently. Let $z = z \( A \, A X \)$ be a measurable function taking at most $K gt.eq 1$ values. Independently of this entire experiment draw $B tilde.op gamma_(m \, d)$, and put $Y = B X$. With the parameters in (103), 
#[#set math.equation(numbering: n => "(105)")
 $ I \( X \; z divides B \, Y \) lt.eq frac(log K, ell) + C #scale(x: 120%, y: 120%)[\[] d + log \( 1 + log Lambda \) #scale(x: 120%, y: 120%)[\]] \, $ <syn:block-bound>]

 where $C$ is absolute and independent of $P \, Lambda \, K$, and the message rule.]
] <syn:block>

The proof couples $ell$ signals by giving them the same actual measurements. Corollary 16 describes their joint law. We compare its total correlation before and after applying $B$. For the comparison after $B$, a Gaussian matrix is constrained to annihilate the projected differences. We first construct the resulting probability law, then estimate its density while keeping its dependence on $B$ explicit.

=== 8.1 The actual and projected replica laws <the-actual-and-projected-replica-laws>

For a tuple $upright(bold(x)) = \( x_1 \, dots.h \, x_ell \)$ in $bb(R)^h$, where $h$ will be $d$ or $m$, write

$ D_(upright(bold(x))) = \[ x_2 - x_1 \, dots.h \, x_ell - x_1 \] \, #h(2em) L_(upright(bold(x))) = "col" \( D_(upright(bold(x))) \) \, #h(2em) Delta \( upright(bold(x)) \) = det \( D_(upright(bold(x)))^(sans(T)) D_(upright(bold(x))) \)^(1 \/ 2) . $

Thus $L_(upright(bold(x)))$ and $Delta \( upright(bold(x)) \)$ are the objects $F_(upright(bold(x)))$ and $J \( upright(bold(x)) \)$ of (20), with difference count $u$. At full affine rank define

#[#set math.equation(numbering: n => "(106)")
 $ w \( upright(bold(x)) \) = \( 2 pi \)^(- k u \/ 2) Delta \( upright(bold(x)) \)^(- k) . $ <syn:tuple-weight>]

We need the same version of a projection density before and after a composition of matrices. If $nu$ is a finite measure and $C$ has $r$ rows, write

#[#set math.equation(numbering: n => "(107)")
 $ g_C^nu \( v \) = liminf_(j arrow.r oo) integral phi_(1 \/ j \, r) \( C s - v \) thin nu \( d s \) \, #h(2em) phi_(eta \, r) \( v \) = \( 2 pi eta^2 \)^(- r \/ 2) exp #h(-0.16667em) (- frac(lr(bar.v.double  bar.v.double) v^2, 2 eta^2)) . $ <syn:density-version>]

This formula defines a jointly measurable function even for matrices of deficient rank. In every use below the matrix has full row rank almost surely, and Theorem 15 identifies this version with the projection density and transfers its finite positive values to the constrained evaluations. We abbreviate $g_C^P$ to $g_C$.

Fix the data of Proposition 32. In Corollary 16, take ambient dimension $d$, $k$ rows, difference count $u$, and prior $P$. The condition $k + u lt.eq d - 2$ follows from (104). Draw $A tilde.op gamma_(k \, d)$, then a common label $b$ with density $g_A$, and finally draw $X_1 \, dots.h \, X_ell$ independently from $P$ conditional on $A X = b$, and set $z = z \( A \, b \)$. Denote this law by $Q$. Its tuple–matrix likelihood is

#[#set math.equation(numbering: n => "(108)")
 $ Q \( d upright(bold(x)) \, d A \) = P^(⊗ ell) \( d upright(bold(x)) \) gamma_(k \, d)^(L_(upright(bold(x)))) \( d A \) w \( upright(bold(x)) \) g_A \( A x_1 \)^(- u) . $ <syn:actual-replica>]

Every pair $\( X_i \, z \)$ has the original signal–message law. Independently draw $B$ and put $Y_i = B X_i$. For fixed $B$, let $P^B = B_(\#) P$, and define

$ cal(C)_X = D_(upright("KL")) \( Q_(upright(bold(X))) bar.v.double P^(⊗ ell) \) \, #h(2em) cal(C)_Y = bb(E)_B D_(upright("KL")) \( Q_(upright(bold(Y)) divides B) bar.v.double \( P^B \)^(⊗ ell) \) . $

Lemma 18, with the same substitution and density bound $L = Lambda$, proves absolute integrability of $log g_A \( b \)$ and $log w \( upright(bold(X)) \)$. It gives

#[#set math.equation(numbering: n => "(109)")
 $ cal(C)_X lt.eq bb(E) log w \( upright(bold(X)) \) - u thin bb(E) log g_A \( b \) < oo . $ <syn:correlation-upper>]

Data processing under the coordinatewise map $x_i mapsto B x_i$ gives $0 lt.eq cal(C)_Y lt.eq cal(C)_X$.

We next construct a probability density against which to test $cal(C)_Y$. Almost every $B$ has full row rank. For such a fixed $B$, the spherical projection formula (21), with $m$ rows, and $P lt.eq Lambda sigma_d$ show that $P^B$ has bounded Lebesgue density on a compact ellipsoid. Here $d - m - 2 gt.eq 0$. The standard Gaussian density has a positive minimum on that ellipsoid, so $P^B$ has bounded density relative to standard Gaussian probability on $bb(R)^m$. This bound is finite for each such $B$ and is allowed to depend on $B$.

Apply Corollary 16 in ambient dimension $m$, again with $k$ rows and difference count $u$. Its dimension condition is $k + u lt.eq m - 2$, as in (104). The resulting same-label tuple law has density

#[#set math.equation(numbering: n => "(110)")
 $ R_B \( upright(bold(y)) \) = w \( upright(bold(y)) \) thin bb(E)_(F tilde.op gamma_(k \, m)^(L_(upright(bold(y))))) g_(F B) \( F y_1 \)^(- u) $ <syn:comparison-density>]

relative to $\( P^B \)^(⊗ ell)$. Indeed, the density version agrees pointwise under composition:

#[#set math.equation(numbering: n => "(111)")
 $ g_F^(P^B) \( v \) = liminf_j integral phi_(1 \/ j \, k) \( F y - v \) thin P^B \( d y \) = g_(F B)^P \( v \) . $ <syn:composition-version>]

The finite-measure theorem transfers version, zero, and infinity exceptions before the negative power is taken. Thus $R_B$ is finite and positive almost everywhere for the product law and integrates to one. It can be chosen jointly measurable in $B \, upright(bold(y))$: on the full-affine-rank set, realize the projected Gaussian rows with the Borel orthogonal projection onto $L_(upright(bold(y)))^perp$, and assign fixed values on the null complement.

The actual law $Q_(upright(bold(Y)) divides B)$ is absolutely continuous relative to $\( P^B \)^(⊗ ell)$, because $Q_(upright(bold(X))) lt.double P^(⊗ ell)$ and $B$ is independent of the tuple. At the actual $\( B \, upright(bold(Y)) \)$, draw $F$ with the conditional law in (110) and put

$ Xi = g_(F B) \( F Y_1 \) . $

The same null-set transfer makes $Xi$ finite and positive almost surely in this enlarged experiment.

=== 8.2 The synthetic density and its critical kernel <the-synthetic-density-and-its-critical-kernel>

The comparison density $R_B$ contains the inverse $u$th moment of $Xi$. To compare its logarithm with the actual likelihood in (109), we will control $Xi$ using the actual matrix $A$ and label $b$. The next lemma first averages the synthetic Gaussian covariance at a fixed tuple. It then bounds the resulting inverse-distance integral by a function $U_A \( b \)$ whose total mass can be estimated independently of that tuple.

#thm([Lemma 8.2.])[
  (Synthetic likelihood and critical kernel).  #emph[Let $P = f sigma_d$ be as in Proposition 32. Fix a tuple $upright(bold(x)) in \( S^(d - 1) \)^ell$ of affine rank $u$, and put 
$ x = x_1 \, #h(2em) L = L_(upright(bold(x))) \, #h(2em) delta \( s \) = "dist" \( s - x \, L \) . $

 Draw $B tilde.op gamma_(m \, d)$. Given $B$, draw $F tilde.op gamma_(k \, m)^(B L)$, so each row of $F$ is a standard Gaussian in $\( B L \)^perp$. Then 
#[#set math.equation(numbering: n => "(112)")
 $ bb(E)_(B \, F) g_(F B) \( F B x \) lt.eq \( 2 pi \)^(- k \/ 2) a_q integral delta \( s \)^(- k) thin P \( d s \) \, #h(2em) a_q = bb(E) det \( H H^(sans(T)) \)^(- 1 \/ 2) lt.eq \( q - k - 1 \)^(- k \/ 2) \, $ <syn:synthetic-bound>]

 where $H$ is a standard Gaussian $k times q$ matrix.]
  #emph[There is an absolute $C_0 > 0$ such that the following holds with 
#[#set math.equation(numbering: n => "(113)")
 $ r_(*) = exp #h(-0.16667em) [- frac(C_0 \( d + log Lambda \), d - 1 - u - k)] in \( 0 \, 1 \) . $ <syn:cutoff>]

 For every full-row-rank $k times d$ matrix $A$, put $a = lr(bar.v.double  bar.v.double) A_(upright("op"))$ and define 
#[#set math.equation(numbering: n => "(114)")
 $ U_A \( b \) =  & \( 2 pi \)^(- k \/ 2) upright(bold(1))_({ lr(bar.v.double  bar.v.double) b lt.eq a }) \[1 + a^k integral g_A \( v \) upright(bold(1))_({ lr(bar.v.double v - b bar.v.double) lt.eq 2 a })\
 & #h(42mm)   dot.op min { \( a r_(*) \)^(- k) \, lr(bar.v.double v - b bar.v.double)^(- k) } thin d v\] . $ <syn:majorant>]

 At $v = b$, the second entry in the minimum is interpreted as $+ oo$. If $A x = b$ and $L subset ker A$, then 
#[#set math.equation(numbering: n => "(115)")
 $ \( 2 pi \)^(- k \/ 2) integral delta \( s \)^(- k) thin P \( d s \) lt.eq U_A \( b \) . $ <syn:kernel-bound>]

 Writing $V_k$ for the volume of the Euclidean unit ball in $bb(R)^k$, the same function satisfies 
#[#set math.equation(numbering: n => "(116)")
 $ integral U_A \( b \) thin d b & lt.eq \( 2 pi \)^(- k \/ 2) V_k a^k \[ 2 + k log \( 2 \/ r_(*) \) \] \,\
bb(E)_(A tilde.op gamma_(k \, d)) log integral U_A \( b \) thin d b & lt.eq C #scale(x: 120%, y: 120%)[\[] d + log \( 1 + log Lambda \) #scale(x: 120%, y: 120%)[\]] . $ <syn:majorant-mass>]

 The logarithm in the last display is absolutely integrable, and $bb(E)_A log \( 1 + integral U_A \) < oo$.]
] <syn:synthetic>

#proof[
  At the fixed tuple, the restriction of $B$ to $L$ has rank $u$ almost surely. Choose an orthonormal $m times q$ matrix $N$ whose columns span $\( B L \)^perp$, using only $B D_(upright(bold(x)))$. Gram–Schmidt with a fixed ordering gives a measurable choice on the full-rank set. With an independent standard Gaussian $k times q$ matrix $H$, the required conditional law of $F$ is realized by
  #[#set math.equation(numbering: n => "(117)")
   $ F = H N^(sans(T)) . $ <syn:synthetic-realization>]
  The choice of $N$ uses only $B \|_L$. The Gaussian restriction $B \|_(L^perp)$ is independent of $B \|_L$. Write $s - x = v + w$ with $v in L$ and $w in L^perp$. Then $N^(sans(T)) B v = 0$, while, conditionally on $B \|_L$, the vector $N^(sans(T)) B w$ has law $N \( 0 \, lr(bar.v.double  bar.v.double) w^2 I_q \)$. Therefore, conditionally on $H$ and $B \|_L$,
  #[#set math.equation(numbering: n => "(118)")
   $ F B \( s - x \) tilde.op N \( 0 \, delta \( s \)^2 H H^(sans(T)) \) . $ <syn:covariance>]
  This conditional calculation accounts for the dependence of $F$ on $B$.
  For $eta > 0$, Tonelli’s theorem and (118) give
  $ bb(E)_(B \, F) integral phi_(eta \, k) \( F B \( s - x \) \) thin P \( d s \) = \( 2 pi \)^(- k \/ 2) integral bb(E)_H det \( delta \( s \)^2 H H^(sans(T)) + eta^2 I_k \)^(- 1 \/ 2) thin P \( d s \) . $
  The integrand on the right increases as $eta arrow.b 0$. The tube bound (23) gives $delta \( s \) > 0$ for $P$-almost every $s$; it also gives a finite inverse $k$th moment, since $d - 1 - u > k$. The matrix $H$ has full row rank almost surely. Monotone convergence on the right and Fatou’s lemma on the left, along $eta = 1 \/ j$, prove the first inequality in (112).
  For completeness, successive orthogonal residuals of the rows of $H$ have independent squared lengths
  $ V_i tilde.op chi_(q - i + 1)^2 \, #h(2em) det \( H H^(sans(T)) \) = product_(i = 1)^k V_i . $
  Indeed, conditionally on the preceding rows, the new row is standard Gaussian on a complement of dimension $q - i + 1$; this conditional law is constant, which also proves independence of the residual lengths. This is the elementary Gaussian orthogonal reduction described in Edelman and Rao #cite(label("EdelmanRao2005")) Section 5; the rectangular product used here follows from the displayed conditioning. Direct integration of the chi-squared density gives $bb(E) V^(- 1) = 1 \/ \( p - 2 \)$ for $V tilde.op chi_p^2$, $p > 2$. Cauchy–Schwarz hence gives
  $ a_q = product_(i = 1)^k bb(E) V_i^(- 1 \/ 2) lt.eq product_(i = 1)^k \( q - i - 1 \)^(- 1 \/ 2) lt.eq \( q - k - 1 \)^(- k \/ 2) . $
  We next use the actual observations. If $A x = b$ and $L subset ker A$, then, for $v = P_L \( s - x \)$,
  #[#set math.equation(numbering: n => "(119)")
   $ lr(bar.v.double A s - b bar.v.double) = lr(bar.v.double A \( s - x - v \) bar.v.double) lt.eq a thin delta \( s \) . $ <syn:actual-kernel>]
  Let $alpha = d - 1 - u$. The tube bound, now applied to $x + L$, gives
  $ P { delta lt.eq t } lt.eq Lambda C^d t^alpha \, #h(2em) 0 < t lt.eq 1 . $
  Layer-cake integration therefore yields, for $0 < r lt.eq 1$,
  $ integral_({ delta lt.eq r }) delta^(- k) thin d P lt.eq Lambda C^d (1 + frac(k, alpha - k)) r^(alpha - k) . $
  Since $alpha - k = d - 2 k gt.eq 3 d \/ 4$, an absolute choice of $C_0$ makes this quantity at most one at $r = r_(*)$. On ${ delta > r_(*) }$, (119) gives both $delta^(- k) lt.eq r_(*)^(- k)$ and $delta^(- k) lt.eq a^k lr(bar.v.double A s - b bar.v.double)^(- k)$. The pushforward of $P$ under $A$ has density $g_A$, and both $A s$ and $b$ have norm at most $a$. Integration of these two bounds gives (115) with the two support cutoffs in (114).
  The remaining singularity has the critical exponent $k$ in dimension $k$. Radial integration gives the exact mass
  #[#set math.equation(numbering: n => "(120)")
   $ integral_({ lr(bar.v.double  bar.v.double) w lt.eq 2 a }) min { \( a r_(*) \)^(- k) \, lr(bar.v.double  bar.v.double) w^(- k) } thin d w = V_k \[ 1 + k log \( 2 \/ r_(*) \) \] . $ <syn:critical-mass>]
  The ball of radius $a r_(*)$ contributes $V_k$, and the annulus contributes $k V_k integral_(a r_(*))^(2 a) d t \/ t$. Dropping the outer cutoff in (114) only for its convolution term, and using $integral g_A = 1$, proves (116).
  We record the scale in this bound before taking its logarithm. Integrating the standard Gaussian density over the ball of radius $sqrt(k)$ gives $\( 2 pi \)^(- k \/ 2) V_k lt.eq \( e \/ k \)^(k \/ 2)$. Also $bb(E) lr(bar.v.double  bar.v.double) A_(upright("op")) lt.eq C sqrt(d)$: choose $1 \/ 4$-nets on the two unit spheres of cardinalities at most $9^k$ and $9^d$, bound the operator norm by twice the maximum of the scalar bilinear forms on the nets, and integrate the union bound for their standard Gaussian tails. Jensen’s inequality gives
  $ bb(E) log #scale(x: 120%, y: 120%)[\[] \( 2 pi \)^(- k \/ 2) V_k lr(bar.v.double  bar.v.double) A_(upright("op"))^k #scale(x: 120%, y: 120%)[\]] lt.eq k / 2 \( 1 - log k \) + k log \( C sqrt(d) \) lt.eq C d . $
  The cutoff (113) and (104) give
  $ log \[ 2 + k log \( 2 \/ r_(*) \) \] lt.eq C + log d + log \( 1 + log Lambda \) . $
  These estimates prove (116). Finally, $log lr(bar.v.double  bar.v.double) A_(upright("op"))$ is integrable below because the norm dominates the absolute value of one standard Gaussian entry. Retaining the first term of $U_A$ bounds its total mass below by $\( 2 pi \)^(- k \/ 2) V_k lr(bar.v.double  bar.v.double) A_(upright("op"))^k$. Together with (116), these observations prove the two remaining integrability assertions. ◻
]

=== 8.3 Integrability and cancellation of the correlation costs <integrability-and-cancellation-of-the-correlation-costs>

The majorant now controls the synthetic density at the actual label. Before subtracting the two correlation bounds, we verify integrability of the comparison logarithms. This uses both the finite actual correlation and the normalization of $R_B$.

#thm([Lemma 8.3.])[
  (Integrability of the projected comparison).  #emph[In the replica experiment $Q$, enlarged by the independent $B$ and the conditional $F$ above, 
$ bb(E) \| log w \( upright(bold(Y)) \) \| + bb(E) \| log Xi \| + bb(E) \| log R_B \( upright(bold(Y)) \) \| < oo . $

 If $G$ is a standard Gaussian $m times u$ matrix, then 
#[#set math.equation(numbering: n => "(121)")
 $ bb(E) log w \( upright(bold(Y)) \) & = bb(E) log w \( upright(bold(X)) \) - k / 2 bb(E) log det \( G^(sans(T)) G \) \,\
1 / 2 bb(E) log det \( G^(sans(T)) G \) & lt.eq u / 2 log m . $ <syn:gram-log>]

 Moreover, 
#[#set math.equation(numbering: n => "(122)")
 $ cal(C)_Y gt.eq bb(E) log R_B \( upright(bold(Y)) \) gt.eq bb(E) log w \( upright(bold(Y)) \) - u thin bb(E) log Xi . $ <syn:correlation-lower>]

]
] <syn:logs>

#proof[
  At a fixed full-affine-rank $upright(bold(X))$, write $D_(upright(bold(X))) = U R$, where $U$ has orthonormal columns. Since $B$ is independent, $B U$ is a standard Gaussian $m times u$ matrix. Consequently
  $ Delta \( upright(bold(Y)) \) =^(upright("law")) Delta \( upright(bold(X)) \) det \( G^(sans(T)) G \)^(1 \/ 2) quad upright("conditionally on ") upright(bold(X)) . $
  The logarithm of $Delta \( upright(bold(X)) \)$ is integrable by Lemma 18. Gaussian column residuals factor $det \( G^(sans(T)) G \)$ into independent chi-squared variables of degrees $m \, m - 1 \, dots.h \, m - u + 1$. Their absolute logarithms are integrable from their densities at zero and infinity. This proves (121) and the asserted integrability of $log w \( upright(bold(Y)) \)$. Jensen applied to each factor gives (121).
  The actual equal-label experiment has $L_(upright(bold(X))) subset ker A$. Conditionally on $\( A \, b \, upright(bold(X)) \)$, the matrix $B$ remains independent, and the conditional law of $F$ is $gamma_(k \, m)^(B L_(upright(bold(X))))$. Lemma 33 therefore gives
  #[#set math.equation(numbering: n => "(123)")
   $ bb(E) \[ Xi divides A \, b \, upright(bold(X)) \] lt.eq a_q U_A \( b \) . $ <syn:conditional-mean>]
  It follows that $bb(E) log \( 1 + Xi \) < oo$. Here are the details needed for the possible small values of $g_A \( b \)$. Conditional Jensen reduces the claim to integrability of $log \( 1 + U_A \( b \) \)$. On the actual finite positive set for $g_A$,
  $ log \( 1 + U_A \( b \) \) lt.eq log \( 1 + g_A \( b \) \) + log \( 1 + U_A \( b \) \/ g_A \( b \) \) . $
  The first term is integrable by Lemma 18. For the second, average over $b$ with density $g_A$ and apply Jensen to obtain at most $log \( 1 + integral U_A \)$. Lemma 33 makes its average finite. Thus $\( log Xi \)^(+)$ is integrable.
  Let the product reference first draw $B$ and then draw $ell$ independent points from $P^B$. The divergence of the actual joint law from this reference is $cal(C)_Y < oo$, and $R_B$ integrates to one under this reference. Equation (19) gives
  #[#set math.equation(numbering: n => "(124)")
   $ bb(E) \( log R_B \( upright(bold(Y)) \) \)^(+) lt.eq bb(E) log \( 1 + R_B \( upright(bold(Y)) \) \) lt.eq cal(C)_Y + log 2 < oo . $ <syn:positive-comparison-log>]
  Conditionally on $B \, upright(bold(Y))$, Equation (110) has a finite positive right side, so $bb(E)_F Xi^(- u) < oo$. Hence $bb(E)_F \( log Xi \)^(-) < oo$ on almost every such fiber; also $bb(E)_F \( log Xi \)^(+) < oo$ there by the preceding joint bound. Conditional Jensen is now legitimate and gives
  $ log R_B \( upright(bold(Y)) \) gt.eq log w \( upright(bold(Y)) \) - u thin bb(E)_F log Xi . $
  Rearranging this inequality,
  $ u thin bb(E)_F \( log Xi \)^(-) lt.eq \( log R_B \( upright(bold(Y)) \) \)^(+) + \| log w \( upright(bold(Y)) \) \| + u thin bb(E)_F \( log Xi \)^(+) . $
  Its right side has finite expectation, proving joint integrability of $\( log Xi \)^(-)$. The same Jensen lower bound gives
  $ \( log R_B \( upright(bold(Y)) \) \)^(-) lt.eq \| log w \( upright(bold(Y)) \) \| + u thin bb(E)_F \| log Xi \| \, $
  so the negative comparison logarithm is integrable as well. Finally use the normalized test $R_B$ in (18). All logarithms are now integrable, and that test together with the conditional Jensen bound proves (122). ◻
]

#proof[
  The preceding lemma permits subtraction of all likelihood and correlation terms. Conditional Jensen in (123) gives
  $ bb(E) \[ log Xi divides A \, b \, upright(bold(X)) \] lt.eq log a_q + log U_A \( b \) . $
  The last logarithm is integrable under the actual label law: $U_A \( b \)$ is bounded below there by $\( 2 pi \)^(- k \/ 2)$, and its positive logarithm was controlled in the proof of Lemma 34. At fixed $A$, Jensen with $b tilde.op g_A$ gives
  $ integral g_A \( b \) log frac(U_A \( b \), g_A \( b \)) thin d b lt.eq log integral U_A \( b \) thin d b . $
  Together with (112) and (116), this yields
  #[#set math.equation(numbering: n => "(125)")
   $ bb(E) log Xi - bb(E) log g_A \( b \) lt.eq - k / 2 log \( q - k - 1 \) + C \[ d + log \( 1 + log Lambda \) \] . $ <syn:likelihood-difference>]
  Combine (109), (121), (121), (122), and (125). The result is
  #[#set math.equation(numbering: n => "(126)")
   $ cal(C)_X - cal(C)_Y & lt.eq frac(k u, 2) log frac(m, q - k - 1) + C u \[ d + log \( 1 + log Lambda \) \]\
 & lt.eq C ell \[ d + log \( 1 + log Lambda \) \] . $ <syn:correlation-loss>]
  The first term is $O \( k u \)$ by (104). Thus the scale from the projected Gaussian determinant cancels the inverse-determinant scale in the synthetic likelihood. The critical kernel was integrated before taking a logarithm, leaving only $log \( 1 + log Lambda \)$.
  Apply Lemma 13 with $t = ell$, the representative $S = X_1$, message $W = z$, and map $phi.alt_B \( x \) = B x$. Every replica has the required signal–message pair law, $B$ is independent of the whole tuple and message, and $cal(C)_X < oo$. Its conclusion and $H \( z \) lt.eq log K$ give
  $ ell I \( X_1 \; z divides B \, B X_1 \) lt.eq log K + cal(C)_X - cal(C)_Y . $
  The joint law of $\( B \, X_1 \, z \)$ is the product of the $B$-law and the original $\( X \, z \)$-law. Substitution of (126) therefore proves (105). ◻
]

=== 8.4 Iteration along the full state history <iteration-along-the-full-state-history>

#thm([Proposition 8.4.])[
  (The synthetic route to the sample bound).  #emph[For every nonnegative integer-valued $M \( d \) = o \( d^2 \)$ and every sequence $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$, consider learners in Definition 3 with deterministic horizon $T \( d \)$ and signal $X tilde.op sigma_d$. If their angular success probability, averaged over the uniform signal, rows, and learner randomness, is at least $2 \/ 3$, then 
$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

 for all sufficiently large $d$, with an absolute $c > 0$. The threshold may depend on the memory sequence.]
] <syn:streaming>

#proof[
  Apply Lemma 9 with $p = 2 \/ 3$ and $p' = s_0 = 16 \/ 25 = 0.64$ to the learner in Definition 3. This gives deterministic Borel state-based rules and data-independent initialization, with uniform-prior success at least $s_0$; all remaining randomness is fixed. Pre-generate all $T$ rows, including rows after an early stop.
  Put $L_epsilon.alt = log \( 1 \/ epsilon.alt \)$. It suffices to consider dimensions for which $T lt.eq d L_epsilon.alt$. At other dimensions the claimed lower bound already holds. Lemma 11, applied with $p_0 = s_0$, gives
  #[#set math.equation(numbering: n => "(127)")
   $ s_0 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) \, #h(2em) L_epsilon.alt = o \( d \) \, #h(2em) T = o \( d^2 \) . $ <syn:output-count>]
  Pad first to time $T$ and then to the least multiple of $k$ at least $T$, using the stopping-index tags and ignored fresh pairs of Lemma 9. Its exact per-index state count gives
  #[#set math.equation(numbering: n => "(128)")
   $ K = \( T + 2 \) 2^M \, #h(2em) log K = o \( d^2 \) . $ <syn:padded-width>]
  Since $s_0 > 3 \/ 5$, Lemma 12 gives $T > floor.l d \/ 2 floor.r$ for all sufficiently large $d$. We use the weaker consequence
  #[#set math.equation(numbering: n => "(129)")
   $ T > d \/ 4 . $ <syn:linear-endpoint>]
  Let $p = ceil.l T \/ k ceil.r$. Write $H_i$ for the tuple of states at the ends of the first $i$ blocks, with $H_0$ constant. Use one independent $B tilde.op gamma_(m \, d)$ and $Y = B X$ throughout. If a history $h$ has probability $p_h > 0$, Lemma 10 gives its conditional signal density
  $ frac(bb(P) { H_(i - 1) = h divides X = x }, p_h) lt.eq 1 / p_h quad upright("relative to ") sigma_d . $
  The next block matrix is independent of $\( X \, H_(i - 1) \)$. Given $h$, the initial state is fixed, and the next state is a measurable $K$-valued function of the new block and its exact labels. The side matrix remains independent of this conditional experiment. Proposition 32 therefore applies with $Lambda = 1 \/ p_h$. Averaging it over histories gives
  #[#set math.equation(numbering: n => "(130)")
   $ I \( X \; H_i divides H_(i - 1) \, B \, Y \) & lt.eq frac(log K, ell) + C [d + sum_h p_h log \( 1 + log \( 1 \/ p_h \) \)]\
 & lt.eq frac(log K, ell) + C \[ d + log \( 1 + \( i - 1 \) log K \) \] . $ <syn:history-step>]
  The last line uses concavity of $t mapsto log \( 1 + t \)$ and $H \( H_(i - 1) \) lt.eq \( i - 1 \) log K$. In particular it applies the bounded-prior block theorem before averaging its density cost. Since $p = o \( d \)$, $ell gt.eq d \/ 16$, and $log K = o \( d^2 \)$, the right side is at most $C d$, with one absolute $C$, for all sufficiently large $d$. The chain rule then gives
  #[#set math.equation(numbering: n => "(131)")
   $ I \( X \; H_p divides B \, Y \) lt.eq C d p lt.eq C \( T + d \) . $ <syn:history-information>]
  The postponed deterministic output is a function of the final tagged state, and therefore of $H_p$.
  To obtain the matching endpoint, use Lemma 6 with $S = X$, $V = H_p$, $G = B$, and $r_0 = 1 \/ 4$. The output is a function of $H_p$, and $B$ is independent of the entire signal–history experiment. Moreover, $2 epsilon.alt < 1 \/ 4$ and $m lt.eq d \/ 2 lt.eq d - 2$. For the residual radius $rho_B = lr(bar.v.double P_(ker B) X bar.v.double)$, (4) gives
  $ bb(P) { rho_B < 1 \/ 4 } lt.eq frac(m \/ d, 1 - 1 \/ 16) lt.eq 8 / 15 . $
  Thus the lemma applies with success minus radius-failure probability at least $s_0 - 8 \/ 15 = 8 \/ 75$, and yields
  #[#set math.equation(numbering: n => "(132)")
   $ I \( X \; H_p divides B \, Y \) & gt.eq 8 / 75 \( d - m - 1 \) log frac(1, 8 epsilon.alt) - log 2\
 & gt.eq c_1 d L_epsilon.alt $ <syn:history-lower>]
  for all sufficiently large $d$, with an absolute $c_1 > 0$. Indeed,
  $ log frac(1, 8 epsilon.alt) gt.eq (1 - frac(log 8, log 10)) L_epsilon.alt \, $
  and $d - m - 1 gt.eq d \/ 2 - 1$.
  By (129), $T + d < 5 T$. Combining (131) and (132) therefore gives $T gt.eq c_2 d L_epsilon.alt$ with an absolute $c_2 > 0$. The constants are absolute; the eventual threshold comes only from $M \( d \) = o \( d^2 \)$. All replicas and auxiliary projections have served solely to bound information. The learner’s observations remain the prescribed fresh Gaussian rows and exact labels. ◻
]

== 9 Stiefel incidence and conditional block information <sec:incidence>

This comparison bounds conditional information directly by the relative entropy of two laws on tuples of signals. Both laws make the signals share an exact projection. The first uses the actual observation block; the second obtains its shared projection from an orthonormal frame inside the coordinates of the independent side projection. Given the separate side projections of all the signals, the second law leaves them conditionally independent with their original fiber laws. This product structure makes the divergence of the two laws an upper bound for the information in the message, multiplied by the number of signals.

The geometric work is to express both laws relative to one incidence measure. We first construct the laws and prove their information comparison. We then compute their exact Jacobians, transfer density exceptions before division, and estimate the resulting likelihood ratio.

Write $sigma = sigma_d$, and let $v_q$ denote the volume of the unit ball in $bb(R)^q$. For the conditional chain rule on standard Borel spaces, see Austin #cite(label("Austin2020")) Sections 3.3–3.4. We use, for all sufficiently large $d$,

#[#set math.equation(numbering: n => "(133)")
 $ n = k = floor.l d \/ 16 floor.r \, #h(2em) ell = k - 1 \, #h(2em) p = floor.l d \/ 4 floor.r . $ <inc:dimensions>]

Thus $ell gt.eq 2$, while $p - n - ell$ and $d - n - ell$ are at least an absolute positive multiple of $d$.

#thm([Proposition 9.1.])[
  (Information in one block).  #emph[Let $mu = f sigma$ be a probability measure with a Borel density $0 lt.eq f lt.eq F < oo$, where $F gt.eq 1$. Draw $S tilde.op mu$ and standard Gaussian matrices $A in bb(R)^(n times d)$ and $B in bb(R)^(p times d)$, all independently. For an integer $w gt.eq 1$, a message $J$ takes values in a fixed $w$-point alphabet (unused symbols are allowed) and is drawn by an arbitrary measurable probability kernel from $\( A \, A S \)$; conditional on $\( A \, A S \)$, its randomness is independent of $\( S \, B \)$. There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(134)")
 $ I_mu \( S \; J divides B \, B S \) lt.eq frac(log w, k) + C d + C log \( 1 + log F \) . $ <inc:block-bound>]

]
] <inc:block>

The dependence on $F$ is doubly logarithmic. This permits us later to condition on an entire finite history: a history of probability $a$ changes the uniform prior to a density bounded by $1 \/ a$.

=== 9.1 Two probability laws on compatible signals <inc:laws>

We use the spherical projection versions from (24), with prior $mu = f sigma$. Recall them locally: for a full-row-rank $q times d$ matrix $L$, with $1 lt.eq q lt.eq d - 2$, and an interior label $t$, let $sigma_(L \, t)$ be uniform probability on the spherical fiber $L s = t$, and let $p_L^0$ be the uniform-sphere projection density in (21). Then

#[#set math.equation(numbering: n => "(135)")
 $ p_L \( t \) = p_L^0 \( t \) integral f thin d sigma_(L \, t) \, #h(2em) mu_(L \, t) = frac(f thin sigma_(L \, t), integral f thin d sigma_(L \, t)) quad upright("when ") p_L \( t \) > 0 . $ <inc:recalled-fibers>]

Set $p_L = 0$ outside the interior projection ellipsoid and fix one measurable probability kernel on unused fibers. These jointly measurable versions specify all the conditional draws below. Their geometric finite-measure form will enter only when we compute the two likelihoods.

Write $phi.alt_j \( A \, y \)$ for the probabilities of the message kernel. For a tuple $upright(bold(s)) = \( s_1 \, dots.h \, s_k \)$, put

$ U = \[ s_2 - s_1 \, dots.h \, s_k - s_1 \] in bb(R)^(d times ell) . $

The notation $U^perp$ means the orthogonal complement of the column space of $U$, and $P_(U^perp)$ is its orthogonal projector. Let $cal(V)_(n \, h)$ be the manifold of $n times h$ matrices with orthonormal rows, with the metric induced by the Euclidean matrix norm. Write $upsilon_(n \, h)$ for normalized Riemannian volume on it. This is the Euclidean Stiefel metric discussed by Edelman, Arias, and Smith #cite(label("EdelmanAriasSmith1998")) Section 2.2.1; we compute its volume factor below.

We use an auxiliary $C in cal(V)_(n \, p)$ and set $D = C B$. For a full-rank $p times ell$ matrix $W$, write $upsilon_W$ for uniform frames whose rows lie in $\( "col" W \)^perp$. Write $gamma_(r \, d)$ for standard Gaussian measure on $bb(R)^(r times d)$, and $gamma_U$ for the law of $n$ independent $N \( 0 \, P_(U^perp) \)$ rows. All these kernels are measurable on their rank domains. For example, projecting a Gaussian matrix onto $\( "col" W \)^perp$ and taking its orthonormal row polar factor gives $upsilon_W$; orthogonal invariance identifies this with normalized induced volume. We may assign arbitrary values on rank exceptions.

Define $Q$ by the following experiment.

+ Draw $A tilde.op gamma_(n \, d)$ and $s_1 tilde.op mu$ independently. Put $y = A s_1$. Draw $J$ from $phi.alt \( A \, y \)$ and draw $s_2 \, dots.h \, s_k$ independently from $mu_(A \, y)$, independently of $J$ conditional on $\( A \, y \)$.
+ Draw $B tilde.op gamma_(p \, d)$ independently. Given $\( upright(bold(s)) \, B \)$, draw $C tilde.op upsilon_(B U)$.

Then $A U = 0$. Conditional on $\( A \, y \)$, all $k$ signals are independent with law $mu_(A \, y)$, which is absolutely continuous on a positive-radius sphere of dimension $d - n - 1$. Each new point therefore avoids the affine span of its predecessors; hence $U$ has rank $ell$ almost surely. The independent Gaussian $B$ makes $B U$ have rank $ell$ almost surely, so $upsilon_(B U)$ is available because $p - ell gt.eq n$. Each marginal

#[#set math.equation(numbering: n => "(136)")
 $ cal(L)_Q \( s_i \, J \, B \, B s_i \) = cal(L)_mu \( S \, J \, B \, B S \) #h(2em) \( 1 lt.eq i lt.eq k \) $ <inc:q-marginals>]

is the law in Proposition 36.

The matrix $D = C B$ has a useful conditional law under $Q$:

#[#set math.equation(numbering: n => "(137)")
 $ cal(L)_Q \( D divides upright(bold(s)) \, A \, y \, J \) = N \( 0 \, P_(U^perp) \)^(⊗ n) . $ <inc:conditional-D>]

To verify this, split each row of $B$ between $"col" U$ and $U^perp$. The second component is independent of $B U$. Given the tuple, the kernel for $C$ depends on $B$ only through $B U$; its orthonormal rows send the independent Gaussian second component to $n$ independent standard Gaussian rows in $U^perp$. The first component is annihilated by $C$.

Define $R$ in the other order. First draw independent $B tilde.op gamma_(p \, d)$ and $C tilde.op upsilon_(n \, p)$; then $D = C B$ is standard Gaussian. Draw $s_1 tilde.op mu$ independently and, conditional on $\( D \, D s_1 \)$, draw $s_2 \, dots.h \, s_k$ independently from $mu_(D \, D s_1)$. Draw $J$ uniformly from its $w$ possible values, independently, and finally draw $A tilde.op gamma_U$. Again $U$ has rank $ell$. Conditional on $\( C \, D \)$, the other $p - n$ rows in an orthogonal row rotation of $B$ are independent standard Gaussian rows and were not used to draw the tuple. Since $p - n gt.eq ell$, they make $B U$ have rank $ell$ almost surely. In these experiments $A$ and $D$ also have row rank $n$ almost surely: each is either standard Gaussian or has conditional Gaussian support $U^perp$, of dimension $d - ell gt.eq n$.

#thm([Lemma 9.2.])[
  (Product conditioning).  #emph[Put $Z_i = B s_i$. After $A \, C$ are discarded under $R$, 
#[#set math.equation(numbering: n => "(138)")
 $ cal(L)_R \( upright(bold(s)) divides B \, Z_1 \, dots.h \, Z_k \, J \) = ⨂_(i = 1)^k mu_(B \, Z_i) . $ <inc:product-law>]

 Consequently, 
#[#set math.equation(numbering: n => "(139)")
 $ "KL" \( Q parallel R \) gt.eq k I_mu \( S \; J divides B \, B S \) . $ <inc:entropy-lower>]

]
] <inc:product>

#proof[
  Retain $B \, C$ temporarily and put $t = D s_1$. Conditional on $\( B \, C \, t \)$, the signals are independent with law $mu_(D \, t)$. Disintegrating this law further according to $z = B s$ gives $mu_(B \, z)$: the earlier equation $D s = t$ is just $C z = t$, already determined by $z$. Formally, disintegrate the law of $z = B s$ according to $C z$, and compose its conditional kernel with $mu_(B \, z)$; the resulting kernel is a conditional law given $D s = t$. These identities hold at the needed values because each individual signal has marginal law $mu$ given $\( B \, C \)$. Conditioning the independent signals on their separate $Z_i$’s therefore yields the product in (138). That product does not depend on $C \, t$, so discarding them leaves it unchanged. The independent uniform $J$ and the later kernel for $A$ do not change the marginal under consideration.
  Data processing and the conditional chain rule give
  $ "KL" \( Q parallel R \) gt.eq bb(E)_Q "KL" #h(-0.16667em) (Q \( upright(bold(s)) divides B \, Z_1 \, dots.h \, Z_k \, J \) thin mid(parallel) thin ⨂_(i = 1)^k mu_(B \, Z_i)) . $
  This is valid as an extended inequality; absolute continuity will be established below. Relative entropy to a product is at least the sum of the relative entropies of the marginals. For each such summand, convexity of relative entropy permits us, after averaging, to discard the other $Z_j$’s from its first conditional law. The result is at least
  $ bb(E)_Q "KL" #scale(x: 120%, y: 120%)[\(] Q \( s_i divides B \, Z_i \, J \) thin parallel thin mu_(B \, Z_i) #scale(x: 120%, y: 120%)[\)] = I_mu \( S \; J divides B \, B S \) $
  by (136). Sum over $i$. ◻
]

The product conditional law has reduced the block information bound to one task: bound $"KL" \( Q parallel R \)$ by $log w$ plus the geometric and prior-density costs. We next put both laws on a common incidence measure. Its exact densities will make that divergence computable, after exceptional sets have been removed before division.

=== 9.2 The common measure and its density versions <inc:common-measure>

To compare the two laws, we express their conditional probabilities as normalized finite measures on the same incidence set. The underlying geometric formula is the regular-submersion case of coarea; see Federer #cite(label("Federer1959")) Definition 2.10 and Theorem 3.1, pp. 423 and 426–427. The following calculation specifies the induced fiber volume and the probability normalization used here.

#thm([Lemma 9.3.])[
  (Spherical projection measure).  #emph[Suppose $L in bb(R)^(q times d)$ has full row rank and $1 lt.eq q lt.eq d - 2$. In the interior 
$ E_L = { t : t^(sans(T)) \( L L^(sans(T)) \)^(- 1) t < 1 } $

 define a finite measure on ${ s in bb(S)^(d - 1) : L s = t }$ by 
#[#set math.equation(numbering: n => "(140)")
 $ lambda_(L \, t) \( d s \) = frac(f \( s \), \| bb(S)^(d - 1) \| thin j_L \( s \)) thin d "vol"_(d - 1 - q) \( s \) \, #h(2em) j_L \( s \) = det #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] L \( I - s s^(sans(T)) \) L^(sans(T)) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <inc:fiber-measure>]

 Set $lambda_(L \, t) = 0$ outside $E_L$. Its mass and normalization are exactly the versions recalled in (135): 
$ p_L \( t \) = lambda_(L \, t) \( bb(S)^(d - 1) \) \, #h(2em) mu_(L \, t) = lambda_(L \, t) \/ p_L \( t \) quad upright("where ") p_L \( t \) > 0 . $

 The finite-measure kernel is jointly measurable in $\( L \, t \)$. Moreover, 
#[#set math.equation(numbering: n => "(141)")
 $ V_L parallel p_L parallel_oo lt.eq F d^d \, #h(2em) V_L = \| E_L \| = v_q det \( L L^(sans(T)) \)^(1 \/ 2) . $ <inc:ellipsoid-bound>]

]
] <inc:projection>

#proof[
  The tangent space at $s$ is $s^perp$. The Gram matrix of the differential $L : s^perp arrow.r bb(R)^q$ is $L \( I - s s^(sans(T)) \) L^(sans(T))$, proving the formula for its normal Jacobian. With $P_L = L^(sans(T)) \( L L^(sans(T)) \)^(- 1) L$, the determinant lemma also gives
  $ j_L \( s \) = det \( L L^(sans(T)) \)^(1 \/ 2) sqrt(1 - parallel P_L s parallel^2) . $
  The differential is onto except when $s$ belongs to the row space of $L$; that sphere has zero $\( d - 1 \)$-dimensional surface measure. Applying change of variables on coordinate patches of its complement, and then exhausting the complement, gives
  $ integral h \( s \) thin d mu \( s \) = integral_(bb(R)^q) integral h \( s \) thin lambda_(L \, t) \( d s \) thin d t quad \( h gt.eq 0 \) . $
  To identify these measures with the versions already used, put $s_0 = L^(sans(T)) \( L L^(sans(T)) \)^(- 1) t$ and $r = sqrt(1 - parallel s_0 parallel^2)$. An interior fiber is $s_0 + r bb(S) \( ker L \)$, where $bb(S) \( ker L \)$ is the unit sphere of $ker L$, and $j_L$ is constant there. Its induced volume is $\| bb(S)^(d - q - 1) \| r^(d - q - 1)$. Dividing this volume by $\| bb(S)^(d - 1) \| j_L$ gives precisely the uniform projection density $p_L^0 \( t \)$ in (21). Consequently, as finite measures on every interior fiber,
  $ lambda_(L \, t) = p_L^0 \( t \) f thin sigma_(L \, t) . $
  Taking mass and then normalizing gives (135) pointwise on its positive set. A uniform direction in $ker L$ can be generated by projecting a standard Gaussian vector onto that subspace and normalizing. The projection matrix is a measurable function of full-rank $L$; integrating the bounded Borel function $f \( s_0 + r theta \)$ against this kernel therefore gives measurable $lambda_(L \, t)$, $p_L \( t \)$, and $mu_(L \, t)$, with the fixed convention on unused fibers from (135).
  For orthonormal rows and $f = 1$, the displayed fiber formula gives a density proportional to $\( 1 - parallel t parallel^2 \)^(\( d - q - 2 \) \/ 2)$ on the unit ball. Its normalizing integral is at least $1 / 2 v_q d^(- q \/ 2)$: restrict to the ball of radius $d^(- 1 \/ 2)$ and use $\( 1 - 1 \/ d \)^(\( d - q - 2 \) \/ 2) gt.eq 1 \/ 2$. The maximum of the density times $v_q$ is consequently at most $2 d^(q \/ 2) lt.eq d^d$. The bound $f lt.eq F$ multiplies this estimate by at most $F$. Finally, an invertible change from orthonormal row coordinates to $L$ divides the density by $det \( L L^(sans(T)) \)^(1 \/ 2)$ and multiplies the ellipsoid volume by the same factor. This proves (141); in particular our chosen $p_L$ is finite everywhere. ◻
]

#thm([Lemma 9.4.])[
  (Interchange on a regular incidence set).  #emph[Let $X \, Z$ be second-countable Riemannian manifolds, and let $G : X times Z arrow.r bb(R)^a$ be smooth. On a relatively open subset $Omega$ of $G^(- 1) \( 0 \)$, suppose both partial differentials $d_x G$ and $d_z G$ are onto. Write $J_x G \, J_z G$ for their normal Jacobians. For every nonnegative measurable $h$ on $Omega$, 
#[#set math.equation(numbering: n => "(142)")
 $ & integral_Z integral_({ x : \( x \, z \) in Omega }) frac(h \( x \, z \), J_x G \( x \, z \)) thin d "vol"_(dim X - a) \( x \) thin d "vol"_Z \( z \)\
 & #h(2em) = integral_X integral_({ z : \( x \, z \) in Omega }) frac(h \( x \, z \), J_z G \( x \, z \)) thin d "vol"_(dim Z - a) \( z \) thin d "vol"_X \( x \) . $ <inc:swap-identity>]

 The fiber volumes are induced volumes, and the equality holds for nonnegative integrals even when their common value is infinite.]
] <inc:swap>

#proof[
  Near a point of $Omega$, choose coordinates $x = \( x' \, x'' \)$, $z = \( z' \, z'' \)$ so that $x''$ and $z''$ each have $a$ coordinates and both $G_(x'')$ and $G_(z'')$ are invertible. Let $u_X \( x \) thin d x$, $u_Z \( z \) thin d z$ be the volume forms in these coordinates. Changing variables from $\( x' \, x'' \)$ to $\( x' \, G \)$ shows that the induced $x$-fiber volume divided by $J_x G$ is
  $ frac(u_X \( x \), \| det G_(x'') \|) thin d x' . $
  Indeed, the tangent-volume factor and the normal-volume factor of this change of variables are respectively the induced fiber volume and the reciprocal normal Jacobian. Thus the left integral has local density $u_X u_Z \/ \| det G_(x'') \|$ in $\( x' \, z' \, z'' \)$; the right integral has density $u_X u_Z \/ \| det G_(z'') \|$ in $\( x' \, z' \, x'' \)$. At fixed $\( x' \, z' \)$, implicit differentiation gives
  $ frac(d x'', d z'') = - G_(x'')^(- 1) G_(z'') \, #h(2em) lr(|det frac(d x'', d z'')|) = frac(\| det G_(z'') \|, \| det G_(x'') \|) . $
  The two local integrals agree. Split $Omega$ into measurable pieces subordinate to a countable coordinate cover and sum using Tonelli’s theorem. This also proves the assertion for infinite integrals. ◻
]

Let $sans(H)$ be the probability law that draws $upright(bold(s)) tilde.op mu^(⊗ k)$, then independent $B tilde.op gamma_(p \, d)$, and, conditional on these, independently draws $A tilde.op gamma_U$ and $C tilde.op upsilon_(B U)$. Include an independent uniform $J$. Independent points from $mu$ give $"rank" U = ell$ almost surely. The same Gaussian decomposition as in (137) then gives full ranks for $B U \, A \, D$ under $sans(H)$.

#thm([Lemma 9.5.])[
  (Exact undivided identities and probability densities).  #emph[Define the following marginal probability measures of $sans(H)$: 
$ sans(H)_A \( d upright(bold(s)) \, d A \) & = mu^(⊗ k) \( d upright(bold(s)) \) thin gamma_U \( d A \) \,\
sans(H)_C \( d upright(bold(s)) \, d B \, d C \) & = mu^(⊗ k) \( d upright(bold(s)) \) thin gamma_(p \, d) \( d B \) thin upsilon_(B U) \( d C \) . $

 Using the unnormalized measures of (140), define nonnegative measures on the corresponding exact incidence sets by 
#[#set math.equation(numbering: n => "(143)")
 $ sans(M)_A \( d upright(bold(s)) \, d A \) & = mu \( d s_1 \) gamma_(n \, d) \( d A \) product_(i = 2)^k lambda_(A \, A s_1) \( d s_i \) \,\
sans(M)_C \( d upright(bold(s)) \, d B \, d C \) & = mu \( d s_1 \) gamma_(p \, d) \( d B \) upsilon_(n \, p) \( d C \) product_(i = 2)^k lambda_(D \, D s_1) \( d s_i \) \, #h(2em) D = C B . $ <inc:MA>]

 Values at row-rank failures may be set to zero. The weights on the right below are assigned arbitrary finite values on their Gram-rank null sets. These measures satisfy the exact identities 
#[#set math.equation(numbering: n => "(144)")
 $ sans(M)_A & = \( 2 pi \)^(- n ell \/ 2) det \( U^(sans(T)) U \)^(- n \/ 2) thin sans(H)_A \,\
sans(M)_C & = kappa det \( U^(sans(T)) B^(sans(T)) B U \)^(- n \/ 2) thin sans(H)_C \, #h(2em) kappa = frac(\| cal(V)_(n \, p - ell) \|, \| cal(V)_(n \, p) \|) . $ <inc:undivided-A>]

 These are equalities of nonnegative measures.]
  #emph[For $L = A \, D$, the values $p_L \( L s_1 \)$ are positive and finite $sans(H)$-almost surely and equal the shrinking-ball limits 
$ p_L \( L s_1 \) = lim_(j arrow.r oo) frac(mu { z : parallel L z - L s_1 parallel < 2^(- j) }, v_n 2^(- j n)) . $

 On this full-measure set, the densities of $Q$ and $R$ with respect to $sans(H)$ are 
#[#set math.equation(numbering: n => "(145)")
 $ q_(*) & = w phi.alt_J \( A \, A s_1 \) \( 2 pi \)^(- n ell \/ 2) det \( U^(sans(T)) U \)^(- n \/ 2) p_A \( A s_1 \)^(- ell) \,\
r_(*) & = kappa det \( U^(sans(T)) B^(sans(T)) B U \)^(- n \/ 2) p_D \( D s_1 \)^(- ell) . $ <inc:q-density>]

 In particular $Q lt.double R$.]
] <inc:densities>

#proof[
  We first establish the identities without dividing by any projection density. In $sans(M)_A$, integrating the tuple variables gives the exact $\( s_1 \, A \)$-marginal
  #[#set math.equation(numbering: n => "(146)")
   $ mu \( d s_1 \) gamma_(n \, d) \( d A \) thin p_A \( A s_1 \)^ell . $ <inc:MA-marginal>]
  For fixed full-rank $A$, this weight is finite by (141). Where it is positive, $lambda_(A \, A s_1)^(⊗ ell) = p_A \( A s_1 \)^ell mu_(A \, A s_1)^(⊗ ell)$. The rank argument for the $Q$ experiment therefore shows that $"rank" U = ell$ outside an $sans(M)_A$-null set. At zero weight the fiber product has zero mass. The same reasoning in $sans(M)_C$ gives the exact $\( s_1 \, B \, C \)$-marginal
  #[#set math.equation(numbering: n => "(147)")
   $ mu \( d s_1 \) gamma_(p \, d) \( d B \) upsilon_(n \, p) \( d C \) thin p_D \( D s_1 \)^ell \, $ <inc:MC-marginal>]
  and the rank argument for $R$ removes the loci where $U$ or $B U$ has rank less than $ell$. Multiplication by the finite weight in (147) preserves these native null sets.
  On either incidence set, the spherical partial differentials are regular on the remaining locus. Indeed, if some $s_i$ belonged to the row space of $A$, then its row-space projection would have norm one. The equations $A s_j = A s_i$ would give every $s_j$ that same row-space projection, and their unit norms would force $s_j = s_i$ for all $j$, contradicting $"rank" U = ell$. The same argument applies to $D$. The Gaussian rank assertions above also remove row-rank failures. Thus removing the complements of the full-rank regular loci changes neither $sans(M)_A \, sans(M)_C$ nor the corresponding $sans(H)_A \, sans(H)_C$.
  Fix $s_1$ and apply Lemma 39 to
  $ x = \( s_2 \, dots.h \, s_k \) \, #h(2em) z = A \, #h(2em) G \( x \, z \) = A U . $
  For fixed $A$, the target has $ell$ independent $n$-coordinate blocks, so the partial normal Jacobian is $product_(i = 2)^k j_A \( s_i \)$. These are precisely the denominators in $product_(i = 2)^k lambda_(A \, A s_1) \( d s_i \)$. For fixed tuple, the differential is $Delta A mapsto Delta A thin U$. It consists of $n$ row maps with Gram matrix $U^(sans(T)) U$; its normal Jacobian is $det \( U^(sans(T)) U \)^(n \/ 2)$. The $A$-fiber has rows in $U^perp$. Restricting the ambient standard Gaussian density to this subspace and then expressing it relative to the normalized Gaussian $gamma_U$ contributes $\( 2 pi \)^(- n ell \/ 2)$. This proves (144) on the regular locus, and hence exactly after the null loci just proved are removed. In particular, integrating over a restricted regular tuple fiber gives at most $p_A \( A s_1 \)^ell$, and gives equality for native almost every $\( s_1 \, A \)$.
  For the second identity, fix $\( s_1 \, B \)$ and use $G \( x \, C \) = C B U$. Put $W = B U$. The tuple partial normal Jacobian is $product_(i = 2)^k j_D \( s_i \)$. At $C W = 0$,
  $ T_C cal(V)_(n \, p) = { Delta : Delta C^(sans(T)) + C Delta^(sans(T)) = 0 } . $
  Variations whose rows belong to $"col" W$ lie in this tangent space, since $C W = 0$. They form the orthogonal complement of the tangent space to the constrained frame fiber. On this normal space the differential is $Delta mapsto Delta W$, with normal Jacobian $det \( W^(sans(T)) W \)^(n \/ 2)$. There is no additional metric factor in these normal directions. The constrained fiber, with its induced metric, is isometric to $cal(V)_(n \, p - ell)$. Replacing its unnormalized volume by $upsilon_W$ leaves the volume ratio $kappa$. Lemma 39 now proves (144), again exactly after removal of native rank-null sets. The corresponding restricted tuple mass is at most $p_D \( D s_1 \)^ell$ and equals it for native almost every $\( s_1 \, B \, C \)$.
  We next transfer the density exceptions using these undivided measures. For a full-rank $n times d$ matrix $L$, define
  $ b_j \( L \, t \) = frac(mu { z : parallel L z - t parallel < 2^(- j) }, v_n 2^(- j n)) \, $
  and let $cal(E) \( L \, s \)$ be the condition that either $p_L \( L s \) in.not \( 0 \, oo \)$, or the limit of $b_j \( L \, L s \)$ does not exist, or that limit differs from $p_L \( L s \)$. This is a measurable condition. Set
  $ cal(E)_A = { \( upright(bold(s)) \, A \) : cal(E) \( A \, s_1 \) } \, #h(2em) cal(E)_D = { \( upright(bold(s)) \, B \, C \) : cal(E) \( C B \, s_1 \) } . $
  For every fixed full-rank $L$, Lebesgue differentiation and the density formula imply $mu { s : cal(E) \( L \, s \) } = 0$. The exact native marginals (146) and (147), whose density weights are finite for each fixed native projection, therefore give
  $ sans(M)_A \( cal(E)_A \) = 0 \, #h(2em) sans(M)_C \( cal(E)_D \) = 0 . $
  On the right sides of (144) and (144), the multiplying Gram weights are strictly positive and finite almost surely. If $h$ denotes either weight, then on ${ 1 \/ m lt.eq h lt.eq m }$ the equality $integral_(cal(E)) h thin d sans(H)_bullet = 0$ gives $sans(H)_bullet \( cal(E) ∩ { 1 \/ m lt.eq h lt.eq m } \) = 0$. Letting $m arrow.r oo$ proves that $cal(E)_A$ is $sans(H)_A$-null and $cal(E)_D$ is $sans(H)_C$-null. This argument is valid even if an undivided measure has infinite total mass. Adding the unused probability kernels gives both assertions under $sans(H)$.
  Only now replace each unnormalized fiber measure by its normalized conditional law. The $Q$ experiment divides (144) by $p_A \( A s_1 \)^ell$, then attaches the same kernels for $B \, C$ and the message density $w phi.alt_J \( A \, A s_1 \)$ relative to uniform $J$. This gives (145). The $R$ experiment divides (144) by $p_D \( D s_1 \)^ell$ and attaches the unchanged $gamma_U$ kernel for $A$ and uniform $J$, giving (145). The divisions are legitimate on the full-measure set just proved. Since $r_(*) > 0$ and is finite there, $Q lt.double R$. ◻
]

#thm([Lemma 9.6.])[
  (The induced Stiefel volume).  #emph[For $1 lt.eq n lt.eq h$, with the induced Euclidean matrix metric, 
#[#set math.equation(numbering: n => "(148)")
 $ \| cal(V)_(n \, h) \| = 2^(n \( n - 1 \) \/ 4) product_(j = 1)^n \| bb(S)^(h - j) \| . $ <inc:stiefel-volume>]

 Consequently, for (133), 
#[#set math.equation(numbering: n => "(149)")
 $ kappa = pi^(- n ell \/ 2) product_(j = 1)^n frac(Gamma \( \( p - j + 1 \) \/ 2 \), Gamma \( \( p - j + 1 - ell \) \/ 2 \)) gt.eq (frac(p - n + 1 - ell, 2 pi))^(n ell \/ 2) . $ <inc:kappa>]

]
] <inc:stiefel>

#proof[
  For $n = 1$, the frame manifold is $bb(S)^(h - 1)$, giving the base case of (148). For $n gt.eq 2$, the map from $cal(V)_(n \, h)$ to its first row in $bb(S)^(h - 1)$ has constant normal Jacobian $2^(- \( n - 1 \) \/ 2)$. To compute it, move the frame by an orthogonal transformation to the first $n$ coordinate rows. Tangent matrices then consist of a skew-symmetric block in the first $n$ columns and an arbitrary remaining block. Each of the $n - 1$ skew coordinates affecting the first row appears twice in the squared matrix norm, so the corresponding singular value of the first-row map is $2^(- 1 \/ 2)$. The other first-row coordinates have singular value one. The fiber is isometric to $cal(V)_(n - 1 \, h - 1)$. Slicing thus gives
  $ \| cal(V)_(n \, h) \| = 2^(\( n - 1 \) \/ 2) \| bb(S)^(h - 1) \| thin \| cal(V)_(n - 1 \, h - 1) \| . $
  Iteration proves (148). The metric factor depends only on $n$, so it cancels in the ratio defining $kappa$. The sphere-area formula $\| bb(S)^(h - 1) \| = 2 pi^(h \/ 2) \/ Gamma \( h \/ 2 \)$ gives the product in (149).
  For $a > 0$ and $ell \/ 2 gt.eq 1$, a gamma random variable $X$ of shape $a$ and scale one satisfies $Gamma \( a + ell \/ 2 \) \/ Gamma \( a \) = bb(E) X^(ell \/ 2) gt.eq \( bb(E) X \)^(ell \/ 2) = a^(ell \/ 2)$ by Jensen’s inequality. Apply this with $a = \( p - j + 1 - ell \) \/ 2$ and then use $a gt.eq \( p - n + 1 - ell \) \/ 2$. ◻
]

=== 9.3 An inverse kernel at two scales <inc:inverse-section>

The density ratio in Lemma 40 involves $p_D \( D s_1 \) \/ p_A \( A s_1 \)$. It has no useful pointwise bound. We control its positive logarithm instead, using the fact that $A$ annihilates the same difference space that governs the conditional Gaussian law of $D$. For $u > 0$, write $log^(+) u = max { 0 \, log u }$, and set $log^(+) 0 = 0$.

#thm([Lemma 9.7.])[
  (Two-scale inverse kernel).  #emph[Under $Q$, define 
$ K & = integral "dist" \( z - s_1 \, "col" U \)^(- n) thin d mu \( z \) \,\
p_A^(*) \( t \) & = sup_(rho > 0) frac(mu { z : parallel A z - t parallel < rho }, v_n rho^n) \, #h(2em) K_0 = v_n parallel A parallel_(upright("op"))^n p_A^(*) \( A s_1 \) . $

 Then $K_0 gt.eq 2^(- n)$, and 
#[#set math.equation(numbering: n => "(150)")
 $ K lt.eq K_0 L_F \, #h(2em) L_F = 1 + frac(n, d - ell - n) + n log \( 2 \/ tau \) \, #h(2em) tau = (frac(2^(- n), F d^d))^(1 \/ \( d - ell - n \)) . $ <inc:kernel-bound>]

 In particular, $log L_F lt.eq C log d + C log \( 1 + log F \)$, and $K < oo$. Moreover, 
#[#set math.equation(numbering: n => "(151)")
 $ bb(E)_Q \[ p_D \( D s_1 \) divides upright(bold(s)) \, A \, y \, J \] lt.eq \( 2 pi \)^(- n \/ 2) K . $ <inc:conditional-density>]

]
] <inc:kernel>

#proof[
  For fixed $z$, (137) makes the coordinates of $D \( z - s_1 \)$ independent centered Gaussians with variance $"dist" \( z - s_1 \, "col" U \)^2$. Hence
  $ frac(Pr_Q { parallel D \( z - s_1 \) parallel < rho divides upright(bold(s)) \, A \, y \, J }, v_n rho^n) lt.eq \( 2 pi \)^(- n \/ 2) "dist" \( z - s_1 \, "col" U \)^(- n) . $
  The right side is interpreted as $+ oo$ when the distance is zero. Integrate in $z$ using Tonelli’s theorem and then apply conditional Fatou along $rho = 2^(- j)$. Lemma 40 and $Q lt.double sans(H)$ identify the almost-sure limit of the ball averages with $p_D \( D s_1 \)$. This proves (151) without evaluating an arbitrary density version at a dependent point.
  Let $H \( t \)$ be the $mu$-probability that the distance in $K$ is at most $t$. Since $A U = 0$,
  $ "dist" \( z - s_1 \, "col" U \) lt.eq t quad arrow.r.double quad parallel A \( z - s_1 \) parallel lt.eq parallel A parallel_(upright("op")) t . $
  The projection law has a Lebesgue density, so projection-ball boundaries have zero mass. The definition of $p_A^(*)$ therefore gives $H \( t \) lt.eq K_0 t^n$. All these distances are at most two; taking $t arrow.b 2$ from above also gives $K_0 gt.eq 2^(- n)$.
  A second estimate uses the projection onto $U^perp$, of dimension $d - ell lt.eq d - 2$. Applying Lemma 38 to a matrix with orthonormal rows for this projection bounds its density by $F d^d \/ v_(d - ell)$. A ball of radius $t$ centered at the projection of $s_1$ consequently has probability at most $F d^d t^(d - ell)$. Thus
  #[#set math.equation(numbering: n => "(152)")
   $ H \( t \) lt.eq min { K_0 t^n \, #h(0.27778em) F d^d t^(d - ell) } . $ <inc:two-scales>]
  The exponent $d - ell$ uses the bounded projection density and the condition $ell gt.eq 2$.
  The layer-cake formula, including the possibility of an initially infinite integral, is
  $ K = 2^(- n) + n integral_0^2 H \( t \) t^(- n - 1) thin d t . $
  Here $d - ell - n > 0$ and $tau lt.eq 1$. Use the second estimate in (152) up to $tau$ and the first thereafter:
  $ K & lt.eq 2^(- n) + frac(n F d^d tau^(d - ell - n), d - ell - n) + n K_0 log \( 2 \/ tau \)\
 & lt.eq K_0 (1 + frac(n, d - ell - n) + n log \( 2 \/ tau \)) . $
  The last inequality uses $F d^d tau^(d - ell - n) = 2^(- n) lt.eq K_0$. Finally,
  $ log \( 1 \/ tau \) = frac(n log 2 + log F + d log d, d - ell - n) . $
  The dimension ratios in (133) give $L_F lt.eq C \( 1 + d log d + log F \)$. Taking its logarithm gives the stated bound and finiteness of the inverse-distance integral $K$. ◻
]

#thm([Lemma 9.8.])[
  (Maximal average at an actual label).  #emph[For every full-rank $A$, 
#[#set math.equation(numbering: n => "(153)")
 $ integral log frac(p_A^(*) \( A s \), p_A \( A s \)) thin d mu \( s \) lt.eq C d + C log \( 1 + log F \) . $ <inc:maximal-bound>]

 The integrand is nonnegative almost surely.]
] <inc:maximal>

#proof[
  Lebesgue differentiation gives $p_A^(*) \( t \) gt.eq p_A \( t \)$ for $A_(\#) mu$-almost every label. We prove the particular centered maximal inequality we need. Its one-dimensional ancestry is the maximal-function theory of Hardy and Littlewood #cite(label("HardyLittlewood1930")) Section III; for the dimension cost of customary covering arguments, see Stein and Strömberg #cite(label("SteinStromberg1983")) p. 259.
  For $a > 0$, a compact subset of ${ t : p_A^(*) \( t \) > a }$ has a finite cover by balls centered in that set, each of projection mass greater than $a$ times its volume. Select disjoint balls in decreasing order of radius. Every discarded ball is contained in the triple of a selected ball, since it meets a selected ball of at least its radius. The selected masses sum to at most one, so the compact set has volume at most $3^n \/ a$. Inner regularity gives
  #[#set math.equation(numbering: n => "(154)")
   $ \| { t : p_A^(*) \( t \) > a } \| lt.eq 3^n \/ a #h(2em) \( a > 0 \) . $ <inc:weak-maximal>]
  The function is measurable: the supremum may be restricted to positive rational radii, because a density gives zero mass to ball boundaries.
  Let $E_A$ be the projection ellipsoid and $V_A = \| E_A \|$. Since $p_A^(*) lt.eq parallel p_A parallel_oo$, integration of level sets, using the bound $V_A$ up to level $1 \/ V_A$ and (154) above that level, gives
  $ integral_(E_A) p_A^(*) \( t \) thin d t lt.eq 1 + 3^n log^(+) \( V_A parallel p_A parallel_oo \) lt.eq 1 + 3^n \( log F + d log d \) . $
  Jensen’s inequality with respect to the probability density $p_A$ then yields
  $ integral p_A \( t \) log frac(p_A^(*) \( t \), p_A \( t \)) thin d t lt.eq log integral_({ p_A > 0 }) p_A^(*) \( t \) thin d t lt.eq log integral_(E_A) p_A^(*) \( t \) thin d t . $
  Values on ${ p_A = 0 }$ do not enter the integral. The preceding estimate and $n asymp d$ prove (153). ◻
]

#proof[
  On the full-measure set in Lemma 40, the log likelihood ratio is the sum of the message term $log \( w phi.alt_J \( A \, A s_1 \) \)$, the term
  #[#set math.equation(numbering: n => "(155)")
   $ - frac(n ell, 2) log \( 2 pi \) - log kappa + n / 2 log frac(det \( U^(sans(T)) B^(sans(T)) B U \), det \( U^(sans(T)) U \)) \, $ <inc:gram-term>]
  and $ell log \( p_D \( D s_1 \) \/ p_A \( A s_1 \) \)$. The message term is at most $log w$.
  Under $Q$, $B$ is independent of $U$. Conditional on $U$, put $V = U \( U^(sans(T)) U \)^(- 1 \/ 2)$. Then $G = B V$ is a standard Gaussian $p times ell$ matrix and
  $ frac(det \( U^(sans(T)) B^(sans(T)) B U \), det \( U^(sans(T)) U \)) = det \( G^(sans(T)) G \) . $
  The lower bound in (149) and the determinant–trace inequality bound (155) above by
  $ frac(n ell, 2) log frac("tr" \( G^(sans(T)) G \), ell \( p - n + 1 - ell \)) . $
  Its positive part has expectation $O \( n ell \)$. Indeed, $bb(E) "tr" \( G^(sans(T)) G \) = p ell$, the ratio $p \/ \( p - n + 1 - ell \)$ is bounded, and $bb(E) log^(+) X lt.eq log \( 1 + bb(E) X \)$ for $X gt.eq 0$.
  For the remaining ratio, use $log^(+) u lt.eq log \( 1 + u \)$, conditional Jensen, and (151) and (150). Since $p_A^(*) \( A s_1 \) \/ p_A \( A s_1 \) gt.eq 1$ almost surely, this gives
  #[#set math.equation(numbering: n => "(156)")
   $ & bb(E)_Q #h(-0.16667em) [log^(+) frac(p_D \( D s_1 \), p_A \( A s_1 \)) thin mid(bar.v) thin upright(bold(s)) \, A \, y \, J]\
 & quad lt.eq log 2 + log^(+) #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] \( 2 pi \)^(- n \/ 2) v_n parallel A parallel_(upright("op"))^n #scale(x: 120%, y: 120%)[\)] + log L_F + log frac(p_A^(*) \( A s_1 \), p_A \( A s_1 \)) . $ <inc:log-ratio-conditional>]
  The Gaussian operator term has expectation $O \( n \)$. Here are the elementary estimates. A $1 \/ 4$-net of the unit sphere in $bb(R)^h$ has size at most $9^h$, by packing disjoint radius $1 \/ 8$ balls. Nets in the two dimensions bound $parallel A parallel_(upright("op"))$ by twice the maximum of at most $9^(n + d)$ absolute standard Gaussian bilinear forms. A Gaussian tail bound gives $bb(E) parallel A parallel_(upright("op")) lt.eq C sqrt(d)$. Also, integrating the Gaussian density over the ball of radius $sqrt(n)$ gives $v_n lt.eq \( 2 pi e \/ n \)^(n \/ 2)$. Therefore
  $ log^(+) #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] \( 2 pi \)^(- n \/ 2) v_n parallel A parallel_(upright("op"))^n #scale(x: 120%, y: 120%)[\)] lt.eq n log \( 1 + sqrt(e \/ n) thin parallel A parallel_(upright("op")) \) \, $
  whose expectation is $O \( n \)$ by Jensen and $n asymp d$.
  The $\( A \, s_1 \)$-marginal under $Q$ is the original independent Gaussian/prior draw. Averaging (156) and using Lemmas 42 and 43 consequently gives
  #[#set math.equation(numbering: n => "(157)")
   $ bb(E)_Q log^(+) frac(p_D \( D s_1 \), p_A \( A s_1 \)) lt.eq C d + C log \( 1 + log F \) . $ <inc:log-ratio>]
  All positive parts in the log likelihood ratio are now integrable. Since $Q lt.double R$, its negative part is integrable as well: with $h = d Q \/ d R$, $integral_({ h < 1 }) - h log h thin d R lt.eq 1 \/ e$. Thus no undefined subtraction occurs, and
  $ "KL" \( Q parallel R \) lt.eq log w + C k d + C k log \( 1 + log F \) . $
  Combine this with (139) and divide by $k$. ◻
]

=== 9.4 Finite histories and the precision endpoint <inc:history-section>

We state the consequence first for average success under the uniform spherical prior, using the exact finite-state randomized model in Definition 3.

#thm([Theorem 9.9.])[
  (Average-prior precision bound).  #emph[There is a universal $c > 0$ with the following property. Let $M = M \( d \)$ be a nonnegative integer with $M \( d \) = o \( d^2 \)$. For all sufficiently large $d$, with the threshold allowed to depend on the rate $M \( d \) \/ d^2 arrow.r 0$, suppose $S tilde.op sigma$ and a learner in Definition 3 stops by a deterministic integer horizon $T gt.eq 0$. If 
$ Pr { angle \( hat(S) \, S \) lt.eq epsilon.alt } gt.eq 2 \/ 3 \, #h(2em) 0 < epsilon.alt lt.eq 1 \/ 10 \, $

 then 
#[#set math.equation(numbering: n => "(158)")
 $ T gt.eq c thin d log \( 1 \/ epsilon.alt \) . $ <inc:precision-bound>]

 The bound permits arbitrary computation within a transition.]
] <inc:precision>

For the proof of Theorem 44 and its auxiliary lemmas below, apply the fixed-shared-seed part of Lemma 9 to the stated learner in Definition 3. We work in the resulting Borel experiment with data-independent initialization and uniform-prior success at least $2 \/ 3$, retaining fresh transition and output randomness. This is the standing reduction for this subsection.

#thm([Lemma 9.10.])[
  (Short-horizon reduction).  #emph[Put $L_epsilon.alt = log \( 1 \/ epsilon.alt \)$. Pad stopping to $T$ by retaining the stopped state and its stopping index. At most 
#[#set math.equation(numbering: n => "(159)")
 $ w = \( T + 2 \) 2^M $ <inc:width>]

 padded states suffice. Under the hypotheses of Theorem 44, if $T < d L_epsilon.alt$, then 
#[#set math.equation(numbering: n => "(160)")
 $ L_epsilon.alt = O \( 1 + M \/ d \) = o \( d \) \, #h(2em) T = O \( d^2 \) \, #h(2em) log w = o \( d^2 \) . $ <inc:short-bounds>]

]
] <inc:short>

#proof[
  The padding count in Lemma 9, including stopping at index zero, gives (159). Its stopped records remain fixed while fresh unused observations are generated. The output-capacity bound in Lemma 11, with success at least $2 \/ 3$ and $\( T + 1 \) 2^M lt.eq w$, gives
  $ 2 / 3 lt.eq w epsilon.alt^(d - 1) \, #h(2em) \( d - 1 \) L_epsilon.alt lt.eq M log 2 + log \( T + 2 \) + log \( 3 \/ 2 \) . $
  Because $L_epsilon.alt gt.eq log 10$ and $T < d L_epsilon.alt$, $log \( T + 2 \) lt.eq log d + log L_epsilon.alt + C$. Using $log L_epsilon.alt lt.eq L_epsilon.alt$ yields
  $ \( d - 2 \) L_epsilon.alt lt.eq M log 2 + log d + C . $
  This proves $L_epsilon.alt = O \( 1 + M \/ d \) = o \( d \)$. The remaining assertions follow from $T < d L_epsilon.alt$ and $M = o \( d^2 \)$. ◻
]

#thm([Lemma 9.11.])[
  (Information accumulated over histories).  #emph[In the short-horizon case of Lemma 45, put $b = ceil.l T \/ n ceil.r$ and pad with fresh unused samples to $b n$ observations. Let $V_i$ be the transcript of the first $i$ block-end padded states, with $V_0$ trivial. Let $B tilde.op gamma_(p \, d)$ be independent of the entire learner experiment and used only for analysis. Then, for all sufficiently large $d$, 
#[#set math.equation(numbering: n => "(161)")
 $ I \( S \; V_b divides B \, B S \) lt.eq C b d $ <inc:history-bound>]

 for an absolute $C$. The dimension threshold may depend on the rate $M \/ d^2 arrow.r 0$.]
] <inc:history>

#proof[
  For a positive-probability history $V_(i - 1) = v$, Lemma 10 gives the Bayes density
  $ f_v \( s \) = frac(Pr { V_(i - 1) = v divides S = s }, Pr { V_(i - 1) = v }) lt.eq F_v := frac(1, Pr { V_(i - 1) = v }) $
  relative to $sigma$. A Borel version is available from the Borel learner. The history fixes the previous padded state. Its update over the next fresh block is a kernel of $\( A \, A S \)$ to at most $w$ next states. For the first block, independent initialization can be integrated into the same kernel. The matrix $B$ is absent from the learner and independent of its entire experiment; it remains independent of the entire conditional signal, fresh-block, and message experiment after conditioning on $v$. Proposition 36 therefore applies at each such history.
  The finite history has entropy $H \( V_(i - 1) \) lt.eq b log w$. Hence Jensen’s inequality gives
  $ bb(E)_v log \( 1 + log F_v \) lt.eq log \( 1 + H \( V_(i - 1) \) \) lt.eq log \( 1 + b log w \) = O \( log d \) . $
  The last bound uses $b = O \( d \)$ and $log w = O \( d^2 \)$ eventually, from (160) and $n asymp d$. The same bounds give $log w \/ k = o \( d \)$. Averaging the one-block estimate thus bounds each increment $I \( S \; V_i divides V_(i - 1) \, B \, B S \)$ by $C d$ eventually. The conditional chain rule, with the same independent $B$ throughout, proves (161). ◻
]

#thm([Lemma 9.12.])[
  (Precision inside an independent fiber).  #emph[Let $S tilde.op sigma$, and let a unit-vector output $hat(S)$ have angular error at most $epsilon.alt lt.eq 1 \/ 10$ with probability at least $2 \/ 3$. Let $B tilde.op gamma_(p \, d)$, $p = floor.l d \/ 4 floor.r$, be independent of the entire experiment producing $\( S \, hat(S) \)$. Then, for all sufficiently large $d$, 
#[#set math.equation(numbering: n => "(162)")
 $ I \( S \; hat(S) divides B \, B S \) gt.eq frac(d - p - 1, 3) log frac(1, 4 epsilon.alt) - log 2 gt.eq c_1 d L_epsilon.alt $ <inc:fiber-bound>]

 with an absolute $c_1 > 0$. In the learner model above, success probability at least $2 \/ 3$ is also impossible for $T lt.eq d \/ 4$, even if all observations are retained.]
] <inc:fiber-precision>

#proof[
  Apply Lemma 6 with $V = hat(S)$, the identity output kernel, $b = p$, and $r_0 = 1 \/ 2$. For the residual radius $R = parallel P_(ker B) S parallel$, Lemma 5 gives
  $ Pr { R < 1 \/ 2 } lt.eq frac(4 p, 3 d) lt.eq 1 / 3 . $
  Success at least $2 \/ 3$ therefore leaves event mass at least $1 \/ 3$, and (6) gives the first inequality in (162). The second follows from
  $ log frac(1, 4 epsilon.alt) gt.eq (1 - frac(log 4, log 10)) L_epsilon.alt \, $
  because $d - p - 1$ is an absolute positive fraction of $d$; the subtractive $log 2$ is absorbed for large $d$.
  For the final assertion, grant the learner all pre-generated observations through its horizon, including ignored rows after stopping. Its output is a kernel of those data and independent randomness. Lemma 12 shows that success at least $3 \/ 5$, and hence at least $2 \/ 3$, already requires $T > floor.l d \/ 2 floor.r$ for large $d$. In particular, $T > d \/ 4$. That lemma includes the deterministic zero-row residual sphere, so the assertion covers $T = 0$ as well. ◻
]

#proof[
  If $T gt.eq d L_epsilon.alt$, the desired bound is immediate. Otherwise apply Lemmas 45 and 46. The terminal output is a kernel of the final padded state, hence of $V_b$; conditional data processing and Lemma 47 give
  $ C b d gt.eq I \( S \; V_b divides B \, B S \) gt.eq I \( S \; hat(S) divides B \, B S \) gt.eq c_1 d L_epsilon.alt . $
  Thus $b gt.eq c_0 L_epsilon.alt$ for an absolute $c_0 > 0$. If $L_epsilon.alt gt.eq 2 \/ c_0$, then
  $ T > n \( b - 1 \) gt.eq \( c_0 \/ 2 \) n L_epsilon.alt gt.eq c thin d L_epsilon.alt $
  after adjusting an absolute constant. If $L_epsilon.alt < 2 \/ c_0$, the separate conclusion $T > d \/ 4$ of Lemma 47 gives the same order after another absolute adjustment. This proves (158) uniformly over the allowed $epsilon.alt$. ◻
]

A guarantee of success probability at least $2 \/ 3$ for every fixed unit signal implies the uniform-prior average guarantee, so it has the same consequence. The argument uses fresh exact labels, a finite persistent state alphabet, and a deterministic horizon; its additional projections and tuple resampling belong only to the analysis.


#bibliography("refs.bib", style: "ieee", title: [References])
