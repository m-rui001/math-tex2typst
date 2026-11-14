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

#align(center)[#text(size: 16pt, weight: "bold")[Subsphere methods for memory--sample lower bounds in noiseless Gaussian regression]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <s:introduction>

An exact linear equation may contain arbitrarily fine real information.
  Indeed, $d$ independent Gaussian equations determine a vector in $bb(R)^d$ almost surely,
  because their coefficient matrix has full rank. A streaming learner with finitely many persistent states cannot
  retain the equations themselves at arbitrary precision. We study how many fresh equations it needs to estimate a
  direction when the information passed from one observation to the next is bounded in bits.

#prodef([Definition 1.1.])[
  (Finite-state Gaussian stream).  Fix integers $d gt.eq 2$, $M gt.eq 0$, and $T gt.eq 0$,
    and an accuracy $0 < epsilon.alt lt.eq 1 \/ 10$. For a signal $s in S^(d - 1)$, the observations are
  $ X_t tilde.op N \( 0 \, I_d \) \, wide Y_t = chevron.l X_t \, s chevron.r \, wide 1 lt.eq t lt.eq T \, $
  with the $X_t$ independent. The learner reads these pairs in order.
    At every sample index its persistent state has at most $2^M$ possible values.
    Its transition and stopping rules may depend on the index, $d \, M \, T \, epsilon.alt$, the current state,
    the entire current pair, and fresh randomness. Computation within a transition is unrestricted.
    All information retained for a later sample must be in the finite state.
  The learner stops at an index $tau in { 0 \, dots.h \, T }$ and returns $hat(s) in S^(d - 1)$.
    Its output law depends only on the terminal state, $tau$, and fresh randomness.
    Thus the last pair affects the output only through the terminal state.
  A shared random seed may choose the rules before the stream starts.
    The pair consisting of this seed and the initial state is jointly independent of the signal and all sample
    rows; in particular, conditional on the seed, initialization carries no signal or sample information.
    Conditional on the seed, fresh transition and output randomness has no additional signal or sample
    information, and the rules have only the arguments just listed.
  The original randomized experiment is required to be jointly measurable in the signal, pre-generated rows, seed,
    initialization, and fresh transition and output randomness.
    For almost every fixed seed, pair-input probabilities may be Borel measurable,
    or measurable in the completion of $gamma_d \( d x \) thin d y$, where $gamma_d =
    N \( 0 \, I_d \)$ and $d y$ is Lebesgue measure. Joint measurability of the original experiment is required
    also in the latter case; separate measurability assertions for individual seeds do not by themselves define
    its mixture. The sample bound $T$ is a deterministic finite horizon.
] <s:model>

The model charges persistent bits rather than real registers.
  It permits a different rule at every index and does not limit the work performed on the current sample.

#thm([Theorem 1.2.])[
  (Explicit noiseless precision bound).  #emph[Let $M : bb(N) arrow.r bb(Z)_(gt.eq 0)$ satisfy $M \( d \) =
    o \( d^2 \)$. There is a dimension threshold depending only on this memory sequence such that,
    for every larger $d$, every $0 < epsilon.alt lt.eq 1 \/ 10$, and every learner in Definition 1,
    the following implication holds. If $S$ is uniform on $S^(d - 1)$,
    independently of the Gaussian rows and learner randomness, and
$ bb(P) { arccos chevron.l hat(s) \, S chevron.r lt.eq epsilon.alt } gt.eq 2 / 3 \, $

 then
#[#set math.equation(numbering: n => "(1)")
 $ T gt.eq 2^(- 16) d log_2 \( 1 \/ epsilon.alt \) . $ <s:main-bound>]

]
] <s:main>

#thm([Corollary 1.3.])[
  (Guarantees for every signal).  #emph[Under the memory assumption of Theorem 2, suppose a learner satisfies
$ bb(P)_s { arccos chevron.l hat(s) \, s chevron.r lt.eq epsilon.alt } gt.eq 2 / 3 wide
  upright("for every ") s in S^(d - 1) \, $

 where $bb(P)_s$ averages its observations and randomness at the fixed signal $s$.
   Then (1) holds at the same dimension threshold.]
] <s:worst-signal>

#proof[
  Integrate the displayed guarantee over a uniform signal, then apply Theorem 2. ◻
]

The dimension threshold is uniform in the accuracy; no relation between accuracy and memory is assumed.
  For example, when $epsilon.alt = d^(- r) lt.eq 1 \/ 10$, the conclusion is $T gt.eq 2^(- 16) r d log_2 d$.

=== Context and ancestry <context-and-ancestry>

Memory restrictions affect statistical risk already in sparse noisy regression,
  as shown by Steinhardt and Duchi #cite(label("SteinhardtDuchi2015")) Section 1.1, equation (2).
  Steinhardt, Valiant, and Wager related bounded-memory inference to communication and statistical-query models
  and posed a quadratic-memory versus exponential-sample question for parity learning #cite(label("SVW2016"))
  Section 1.1, Conjecture 1. Raz established the qualitative separation through finite-width branching programs
  #cite(label("Raz2016")) Theorem 1. These works make explicit the distinction between information in a current
  observation and information that a finite state can carry forward.

The closest continuous-regression comparison among these sources is Sharan, Sidford,
  and Valiant #cite(label("SSV2019")). Their Theorem 1 uses independent isotropic Gaussian covariates and
  independent uniform additive noise of half-width $2^(- d \/ 5)$.
  At Euclidean accuracy $epsilon.alt = d^(- r)$, for $r lt.eq O \( d \/ log d \)$ in the range specified there,
  at most $d^2 \/ 4$ bits and success probability at least $2 \/
  3$ require $Omega \( d log r \)$ samples #cite(label("SSV2019")) Theorem 1.
  Their proof experiment draws the target uniformly on the sphere #cite(label("SSV2019")) Section 2.
  The exact labels in Definition 1 are more informative than noisy labels,
  so that noisy lower bound alone does not give Theorem 2. The condition-number conjecture in their Section 1.1
  concerns a different, ill-conditioned Gaussian experiment at constant accuracy.

Dagan, Kur, and Shamir give related space lower bounds for distinct linear-prediction tasks
  #cite(label("DKS2019")). Their published Theorem 3 asks for an approximate null vector of independent Gaussian
  rows. Their Theorem 10 concerns empirical residual error on a finite equation system formed from jointly
  conditioned rows and one fixed equation. Those targets and observation laws differ from the fixed-signal
  precision problem considered here.

Our block analysis uses high moments of several directions drawn in one random subspace.
  The use of independent copies and successive orthogonalization has a close predecessor in the high-moment
  calculation of Sharan, Sidford, and Valiant #cite(label("SSV2019")) Section 7, Lemma 12.
  Their calculation concerns a noisy interval projection under a global $L^2$ density hypothesis.
  The local argument below instead conditions an exact Gaussian block and controls its residual subsphere.
  Classical beta laws for random projections are discussed by Frankl and Maehara
  #cite(label("FranklMaehara1990")); all normalized densities, conditional laws,
  and inequalities used here are proved locally.

=== Exact observations and residual subspheres <exact-observations-and-residual-subspheres>

For a Euclidean linear space $H$, write $S \( H \)$ for its unit sphere and $sigma_H$ for uniform probability on
  that sphere. We test the success probability of a learner on affine subspheres

#[#set math.equation(numbering: n => "(2)")
 $ z + r S \( H \) \, wide z perp H \, quad r > 0 \, quad ∥∥ z^2 + r^2 = 1 . $ <s:affine-sphere>]

The dimension of this test means the linear dimension $D = dim H$. Fix the shared seed and the learner’s rules.
  At a block boundary, let $g_v \( s \)$ be the success probability of the remaining computation started in state
  $v$, using fresh samples. This function is defined even when $v$ is unreachable at target $s$.
  The proof bounds its average on every test (2) of sufficiently large dimension.

To evaluate one such average, draw the target uniformly on the affine test, independently of fresh block rows.
  A block of $1 lt.eq b < D$ Gaussian rows identifies the target’s projection $p$ onto their row span in $H$.
  Conditional on the full block data, the target is uniform on

$ z + p + rho S \( K \) \, wide rho^2 = r^2 - ∥∥ p^2 \, $

where $K$ is the perpendicular complement of that row span in $H$.
  When the experiment is instead conditioned on the observed projection $p$,
  the space $K$ is uniform among the $\( D - b \)$-dimensional subspaces of $E = H ∩ p^perp$.
  Thus the block leaves a random residual subsphere, even though the learner may process its exact real data
  without computational limits. Section 2 proves these conditional laws.

The state chosen after the block may depend on its entire matrix and all its labels.
  We account for this choice before averaging away the matrix data:
  the resulting success probability is bounded by the maximum over the possible continuation states.
  For fixed $p \, rho$, write

$ F_v \( K \) = integral g_v \( z + p + rho u \) thin d sigma_K \( u \) . $

If the block can choose among at most $W$ states, then for every positive integer $h$,

$ bb(E)_K max_v F_v \( K \) lt.eq (sum_v bb(E)_K F_v \( K \)^h)^(1 \/ h) . $

A bound on the $h$-th moment therefore charges state selection by $W^(1 \/ h)$.
  The moment is an average over $h$ directions drawn independently in the same random space $K$;
  those directions are correlated after $K$ is averaged out.

=== Proof of the precision bound <proof-of-the-precision-bound>

The central task is to control this correlation without spending a new test dimension for every direction.
  Conditional on preceding directions with span $V$, the next direction has more mass near $V$ than a uniform
  direction in $E$. The comparison in Section 5 bounds its law by an exponential factor times two simpler
  probability laws. The first is uniform on $S \( E \)$. The second chooses one direction in $V$ and then draws a
  uniform direction on a latitude perpendicular to it. Both laws can be bounded by the same suffix estimate on
  affine subspheres: the first uses dimension $D - 1$, and the second dimension $D - 2$.
  Every factor in the moment uses these same tests. Thus a block costs only two test dimensions,
  although it contains a number of samples proportional to $d$.

The residual radius and the comparison-latitude radii contribute inverse-radius moments.
  Their squared radius fractions have beta laws, and finite beta products bound these moments explicitly.
  Together with a moment order proportional to $d$, this gives a uniform upper bound on success that can be
  propagated backward over the blocks. The terminal bound is a spherical cap estimate.

There is still a dimension constraint: this induction is useful only while the test spheres remain large.
  Section 4 supplies that constraint from the learner model.
  There are at most $\( T + 1 \) 2^M$ terminal index-state pairs.
  Counting their cap probabilities shows that a successful putative run with $T =
  O \( d log \( 1 \/ epsilon.alt \) \)$ must have $log \( 1 \/ epsilon.alt \) = o \( d \)$ when $M = o \( d^2 \)$.
  Such a run contains only $o \( d \)$ blocks, so the induction has sufficient dimensions.
  A full-data residual estimate handles bounded precision.

The direct proof of Theorem 2 therefore proceeds through the continuation and residual laws in Section 2,
  the cap and common-subspace direction facts in Section 3, the stopping reductions in Section 4,
  and the beta-mixture comparison in Section 5.

=== Further analytic formulations <further-analytic-formulations>

The same geometric setup also gives bounds that apply to arbitrary bounded continuation functions,
  whether or not they arise from a learner. Section 6 develops a second way to control the correlated directions.
  A cap estimate bounds mass in a tube around the preceding span,
  and summing shells controls the singular conditional density. This yields Theorem 15:
  a block selecting among at most $W$ continuations increases their radius-weighted subsphere means by at most
  $W^(1 \/ h) C^d$, with $h = floor.l d \/ 16 floor.r$, while lowering the test dimension by two.
  Its terminal bound gives the same precision rate at success probability $1 \/ 2$,
  with an unspecified absolute coefficient.

Section 7 gives an explicit version of the suffix estimate simultaneously on all admissible affine subspheres.
  An even radius exponent lets its inverse-radius moment be evaluated by a finite beta product,
  retaining explicit constants throughout. Section 8 gives a different extension:
  its induction compares actual learners in different ambient dimensions and permits arbitrary Euclidean outputs
  at every positive error tolerance. The key step simulates a latitude target by a smaller Gaussian learner
  without increasing its state set. These are additional formulations of the method;
  the numerical coefficient in Theorem 2 comes from the beta-mixture proof.

== 2 Continuations and exact residual spheres <s:residual-spheres>

The block estimates test a continuation on many affine subspheres,
  including subspheres of zero measure for the original uniform prior.
  We first obtain Borel continuation functions on every such test.
  We then determine the exact target law left by a Gaussian block.

=== 2.1 Borel rules and counterfactual continuations <borel-rules-and-counterfactual-continuations>

#thm([Lemma 2.1.])[
  (Borel versions under the uniform prior).  #emph[Fix $d gt.eq 2$, a finite horizon, and finite state sets.
    For almost every realization of the shared rule seed in Definition 1,
    there are Borel transition and stopping kernels with the same state sets and terminal output laws whose
    conditional joint law of the uniform signal, state path, stopping index, and output is unchanged.]
] <s:borel>

#proof[
  Fix a seed realization for which the conditional model requirements hold.
    Such realizations have full seed probability. For a fixed state and index,
    combine continuing and stopping choices into a finite set of tagged destinations.
    Their probabilities form a finite vector of completed-measurable nonnegative functions summing to one on the
    pair space. Every completed-measurable real function has a Borel version:
    approximate it by simple functions and replace their countably many measurable level sets by Borel sets modulo
    null sets. Choose such a version for each coordinate. On the Borel set where the chosen coordinates are
    negative or fail to sum to one, replace the vector by a fixed point mass. This set is null.
    Since there are only finitely many indices and states, a single Borel $gamma_d \( d x \) thin d
    y$-null set $Z$ contains every pair-input modification.
  Let $S$ be uniform on $S^(d - 1)$ and pre-generate the independent Gaussian rows.
    The joint independence in Definition 1 ensures that, after fixing this seed,
    they retain this product law and the initial state carries no information about them.
    For a fixed $x eq.not 0$, the coordinate of $S$ in the direction $x \/ ∥∥ x$ has a Lebesgue density when $d
    gt.eq 2$; this will also follow from (4) below. Scaling by $∥∥
    x$ shows that the conditional law of $chevron.l \, chevron.r x S$ has a density.
    The event $x = 0$ is Gaussian-null. Thus each pair $\( X_t \, chevron.l X_t \, S chevron.r \)$ has marginal
    law absolutely continuous with respect to $gamma_d \( d x \) thin d y$ and avoids $Z$ almost surely.
    This conclusion remains valid along an adaptive state path, because
  $ bb(P) { upright("current state") = v \, med \( X_t \, chevron.l X_t \, S chevron.r \) in Z } lt.eq
    bb(P) { \( X_t \, chevron.l X_t \, S chevron.r \) in Z } = 0 . $
  A finite union over the pre-generated indices is still null.
    Couple the original and Borel finite kernels using the same fresh uniform random numbers.
    Their choices agree outside $Z$, so induction makes their state paths and stopping indices identical almost
    surely. The terminal output laws have no pair-input argument and can then be coupled identically.
    This proves the joint-law assertion. ◻
]

The reduction preserves the averaged experiment; it need not preserve the behavior at every exceptional individual
  signal. After making the reduction, start the Borel learner at any specified state and index,
  whether or not that state could have been reached. Its future success probability $G_v \( s \)$ is a Borel
  function of $s$, by finite composition and integration of the Borel kernels over fresh rows and randomness.
  These are counterfactual continuations, rather than conditional laws given a reached-state event.
  Every bound below is uniform over the seed realizations covered by the lemma, hence over almost every seed.
  The original jointly measurable experiment supplies measurable conditional success probabilities.
  We may therefore average those original probabilities afterward;
  no jointly measurable choice of Borel versions across seeds is needed.

For a block of $k$ pre-generated rows, the complete transitions from a fixed starting state give Borel destination
  probabilities $kappa_v \( X \, y \)$. If a padded program always has a destination, they sum to one.
  The exact recursion is

#[#set math.equation(numbering: n => "(3)")
 $ G_(upright("in")) \( s \) = bb(E)_X sum_v kappa_v \( X \, X s \) G_v \( s \) . $ <s:recursion>]

All dependence of the block computation on its rows and labels remains in $kappa_v$.
  The continuation uses only its state from the past. Conditional on the shared seed,
  initialization is independent of the signal and sample rows.
  It may be averaged at the end, after which the same uniform estimates may be averaged over the seed in the
  original jointly measurable experiment.

=== 2.2 Spherical coordinates and beta fractions <spherical-coordinates-and-beta-fractions>

We use uniform probability, never unnormalized surface area, on each sphere.
  The following normalized formulas are classical; see Frankl and Maehara #cite(label("FranklMaehara1990")) for
  the geometric beta-law context. We include their derivation and the conditional information needed here.

#thm([Lemma 2.2.])[
  (Coordinates of a uniform direction).  #emph[Let $E = E_1 xor E_2$ be an orthogonal decomposition with $dim E =
    D$, $dim E_1 = l$, and $1 lt.eq l < D$. If $U tilde.op sigma_E$, then
$ ∥P_(E_1) U∥^2 tilde.op "Beta" \( l \/ 2 \, \( D - l \) \/ 2 \) \, $

 and the two component directions are independent uniform directions, independent of this fraction.
   In coordinates on $E_1$, the projection $P_(E_1) U$ has density
#[#set math.equation(numbering: n => "(4)")
 $ c \( D \, l \) \( 1 - ∥∥ t^2 \)^(\( D - l - 2 \) \/ 2) upright(bold(1))_({ ∥∥ t < 1 }) \, wide c \( D \, l \) =
   frac(Gamma \( D \/ 2 \), pi^(l \/ 2) Gamma \( \( D - l \) \/ 2 \)) . $ <s:coordinate-density>]

 Conditional on that projection, the complementary direction is uniform on $S \( E_2 \)$.
   When $l = 0$ or $l = D$, the squared projection is respectively the point mass at $0$ or at $1$.]
] <s:coordinates>

#proof[
  Write $U = G \/ ∥∥ G$ for a standard Gaussian $G$ in $E$. The two Gaussian components are independent.
    Their squared lengths divided by two are independent unit-scale gamma variables of shapes $l \/
    2$ and $\( D - l \) \/ 2$, and their directions are independent uniform directions.
    For independent gamma variables $A \, B$ of shapes $alpha \, beta > 0$,
    the change of variables $\( A \, B \) = \( q v \, \( 1 - q \) v \)$ has Jacobian $v$.
    Their joint density therefore factors into
  $ frac(q^(alpha - 1) \( 1 - q \)^(beta - 1), upright(B) \( alpha \, beta \)) dot.op
    frac(v^(alpha + beta - 1) e^(- v), Gamma \( alpha + beta \)) . $
  The fraction and sum are independent, and the fraction is $"Beta" \( alpha \, beta \)$.
    Polar coordinates on $E_1$ give (4); its normalizing constant follows from the beta integral and the area $2
    pi^(l \/ 2) \/ Gamma \( l \/ 2 \)$ of $S^(l - 1)$. The independent component directions give the conditional
    assertion. This proof includes $D - l = 1$, when $S \( E_2 \)$ has two points and the coordinate-density
    exponent can be $- 1 \/ 2$. The endpoint decompositions $l = 0 \,
    D$ are deterministic and require no beta law with a zero shape. ◻
]

For $D gt.eq 3$, write $c_D = c \( D \, 1 \)$. The normalizing integrand $\( 1 - t^2 \)^(\( D - 3 \) \/ 2)$ is at
  least $1 \/ 2$ on $\| t \| lt.eq D^(- 1 \/ 2)$, so $c_D lt.eq sqrt(D)$.
  For an exponent at least one this lower bound follows from Bernoulli’s inequality;
  the remaining nonnegative exponents are immediate. This simple estimate will keep all cap constants exponential
  in the ambient dimension.

#thm([Lemma 2.3.])[
  (Beta moments and products).  #emph[For $A \, B > 0$ and $Z tilde.op "Beta" \( A \, B \)$, a real $q gt.eq
    0$ satisfies
#[#set math.equation(numbering: n => "(5)")
 $ bb(E) Z^(- q) = frac(upright(B) \( A - q \, B \), upright(B) \( A \, B \)) =
   frac(Gamma \( A - q \) Gamma \( A + B \), Gamma \( A \) Gamma \( A + B - q \)) quad
   upright("if ") q < A . $ <s:beta-real>]

 The moment diverges when $q gt.eq A$. If $h$ is a nonnegative integer with $h < A$, then
#[#set math.equation(numbering: n => "(6)")
 $ bb(E) Z^(- h) = product_(t = 1)^h frac(A + B - t, A - t) \, $ <s:beta-integer>]

 where the product for $h = 0$ is one. Moreover, for $C > 0$, independent
$ Z tilde.op "Beta" \( A \, B \) \, wide X tilde.op "Beta" \( A + B \, C \) $

 satisfy
#[#set math.equation(numbering: n => "(7)")
 $ Z X tilde.op "Beta" \( A \, B + C \) . $ <s:beta-product>]

]
] <s:beta-identities>

#proof[
  Integrating $z^(- q)$ against the beta density gives the first ratio when the exponent $A - q -
    1$ is greater than $- 1$. If it is at most $- 1$, the integral diverges at zero.
    The identity $upright(B) \( x \, y \) = Gamma \( x \) Gamma \( y \) \/ Gamma \( x + y \)$ gives (5),
    and the gamma recurrence gives (6). For the product, take independent unit-scale gamma variables $G_1 \,
    G_2 \, G_3$ of shapes $A \, B \, C$. The fraction $G_1 \/ \( G_1 + G_2 \)$ is independent of $G_1 + G_2$,
    hence of $\( G_1 + G_2 \) \/ \( G_1 + G_2 + G_3 \)$. These two fractions have the stated laws,
    and their product is $G_1 \/ \( G_1 + G_2 + G_3 \)$, of law $"Beta" \( A \, B + C \)$. ◻
]

=== 2.3 What an exact block leaves <what-an-exact-block-leaves>

Uniform orthogonal frames may be generated successively from uniform sphere directions in perpendicular
  complements; Mezzadri gives an authoritative exposition of this construction #cite(label("Mezzadri2007"))
  Section 8, Theorem 4 and Corollary 1. Here is the short invariance fact we need.
  A square Gaussian matrix $A$ is invertible almost surely, and $Q =
  A \( A^(sans(T)) A \)^(- 1 \/ 2)$ is orthogonal. Left and right orthogonal invariance of the Gaussian law show
  that $Q$ is invariant under both left and right multiplication by any fixed orthogonal matrix.
  We call this the uniform orthogonal law. Its image of a fixed frame is uniform.
  To see its conditional frame property, construct an ordered orthonormal frame by choosing the first vector
  uniformly and each successive vector uniformly in the perpendicular complement of the previous ones.
  This joint law is left rotation invariant. Uniqueness of invariant probability on any sphere, frame space,
  or space of flags used below follows by averaging over $Q$:
  the average of a fixed object is independent of that object by transitivity and right invariance,
  while averaging an invariant law leaves it unchanged. Thus the successive construction has the same law as the
  image under $Q$, and its definition gives the claimed uniform conditional law of the remaining frame.
  All subspace averages below are measurable: if $K = Q K_0$ is represented by an orthogonal matrix and a fixed
  subspace, then $integral f \( Q u \) thin d sigma_(K_0) \( u \)$ is a Borel function of $Q$ for Borel $f$,
  by parameter integration, and depends only on $K$.

#thm([Lemma 2.4.])[
  (Exact residual law).  #emph[Let $s = z + r omega$ with $omega tilde.op sigma_H$,
    independently of a matrix $X$ with $b$ independent standard Gaussian rows.
    Assume $z perp H$, $r > 0$, and $∥∥ z^2 + r^2 = 1$. Put $D = dim H$, and let $1 lt.eq b < D$.
    Let $R_X$ be the row span of $X$ restricted to $H$, and set $K = H ∩ R_X^perp$.
    Conditional on $X$, the joint experiment has the representation
#[#set math.equation(numbering: n => "(8)")
 $ s = z + r sqrt(1 - t) thin e + r sqrt(t) thin v \, quad t tilde.op "Beta" \( \( D - b \) \/ 2 \, b \/ 2 \) \,
   quad e tilde.op sigma_(R_X) \, quad v tilde.op sigma_K \, $ <s:residual-representation>]

 where the three draws are independent. The labels are
$ X s = X #scale(x: 120%, y: 120%)[\(] z + r sqrt(1 - t) thin e #scale(x: 120%, y: 120%)[\)] . $

 Marginally, $t$ is independent of $\( e \, K \)$, $e$ is uniform on $S \( H \)$, and, conditional on $e$,
   $K$ is uniform among the $\( D - b \)$-dimensional subspaces of $H ∩ e^perp$.]
] <s:residual>

#proof[
  The restriction of $X$ to $H$ has rank $b$ almost surely and its row span is rotation invariant.
    Conditional on $X$, Lemma 5 applied to $H = R_X xor K$ gives (8).
    In particular the residual direction $v$ is independent of $t \, e$ and remains uniform when the full $X \,
    t \, e$ are fixed. Since $X v = 0$, the displayed label identity follows.
    The restriction of $X$ to $R_X$ is injective, so, given $X$,
    the labels determine the projected component $r sqrt(1 - t) thin e$.
  To reverse the order of the other draws, take a uniform orthonormal basis of $H$,
    let $R_X$ be the span of its first $b$ vectors, and take its first vector for $e$.
    By the invariance just proved, this has the same law as a uniform row span and a uniform direction in it.
    Conditional on $e$, the remaining basis is a uniform frame in $H ∩ e^perp$.
    Its last $D - b$ vectors span a uniform $\( D - b \)$-space there.
    The beta law of $t$ does not depend on the row span or its directions, which proves the claimed independence.
    When $b = 1$, the conditional residual space is simply $H ∩ e^perp$; the statement still applies. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 2.5, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2, -1.5), (2, 1.5), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0), (2, 0), stroke: (paint: rgb("#0000ff"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000ff"))))
  content((1, -0.3528), [$p in R_X$], anchor: "north", padding: 0.1176cm)
  line((2, 0), (2, 1.5), stroke: (paint: rgb("#ff0000"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#ff0000"))))
  content((2.176, 0.75), [$rho v in K$], anchor: "west", padding: 0.1176cm)
  line((0, 0), (2, 1.5), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1, 0.75), [$r omega$], anchor: "south-east", padding: 0.1176cm)
  line((1.775, 0), (1.775, 0.225), (2, 0.225), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.04939, fill: black, stroke: none)
  content((-0.07484, -0.07484), [$z$], anchor: "north-east", padding: 0.1176cm)
  circle((2, 0), radius: 0.04939, fill: black, stroke: none)
  content((2.075, -0.07484), [$z+p$], anchor: "north-west", padding: 0.1176cm)
  circle((2, 1.5), radius: 0.04939, fill: black, stroke: none)
  content((2, 1.5), [$s$], anchor: "south-west", padding: 0.1176cm)
  circle((2, -1.5), radius: 0.04939, fill: black, stroke: none)
  content((-4.375, 0.875), [row-space projection#linebreak()fixed by the labels])
  bezier((-2.938, 0.625), (0.8125, -0.05), (-1.593, -0.007803), (-0.6683, -0.1742), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((4.5, -0.9375), [uniform residual#linebreak()direction in $K$])
  bezier((3.5, -0.75), (2.087, -1), (2.993, -0.9868), (2.645, -1.048), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
})],
  caption: [Figure 1: An orthogonal cross-section of the decomposition in Lemma 7. The observed row-space component is $p = r sqrt(1 - t) thin e$; the remaining component has length $rho = r sqrt(t)$ and direction in $K$. The line meets the displayed circle in two points because this cross-section is two-dimensional. In higher dimension the same intersection is the residual subsphere $z + p + rho S \( K \)$. ],
) <s:residual-figure>

Figure 1 shows the geometric content of the conditioning.
  The subspaces in the lemma are analysis variables; the learner is given exactly $X \, X s$.
  The next consequence is the point where the full data-dependent state choice is accounted for.

#thm([Lemma 2.5.])[
  (Averaging after a block).  #emph[In the setting of Lemma 7, let $cal(V)$ be nonempty and finite, let $g_v :
    S^(d - 1) arrow.r \[ 0 \, 1 \]$ be Borel, and let Borel weights $kappa_v \( X \, y \) gt.eq
    0$ satisfy $sum_v kappa_v lt.eq 1$. Put
$ z' = z + r sqrt(1 - t) thin e \, wide rho = r sqrt(t) \, wide F_v \( K \) =
  integral g_v \( z' + rho u \) thin d sigma_K \( u \) . $

 Then
#[#set math.equation(numbering: n => "(9)")
 $ bb(E)_(X \, s) sum_v kappa_v \( X \, X s \) g_v \( s \) lt.eq
   bb(E)_(t \, e) bb(E)_(K divides e) max_v F_v \( K \) . $ <s:state-max-bound>]

 The expectation on the left uses the independent uniform subsphere target and Gaussian block.]
] <s:state-maximum>

#proof[
  Conditional on $X \, t \, e$, the labels are $X z'$, the weights are fixed, and $u$ is uniform in $K$.
    The conditional mean is $sum_v kappa_v \( X \, X z' \) F_v \( K \)$, bounded by $max_v F_v \( K \)$.
    This maximum no longer depends on the remaining matrix data except through $K$.
    The reversed-order part of Lemma 7 therefore gives the right side of (9). ◻
]

The maximum is taken before the matrix is replaced by its marginal subspace law.
  It allows the selected state to depend arbitrarily on the entire matrix and every exact label.
  No claim that a forward posterior at a reached state is uniform on a subsphere is used.

== 3 Caps and directions in a random subspace <s:subspace-moments>

The residual law reduces a block to averages of continuation functions on a random subspace.
  We first bound terminal success by spherical caps. We then compute the dependence between several directions
  drawn in the same random subspace. Both block methods will use this conditional law;
  their different ways of bounding its moments come later.

=== 3.1 Caps and terminal outputs <caps-and-terminal-outputs>

#thm([Lemma 3.1.])[
  (Spherical caps).  #emph[Let $e$ be a unit vector in a $D$-dimensional Euclidean space.
    For $D gt.eq 3$ and every $delta > 0$,
#[#set math.equation(numbering: n => "(10)")
 $ sigma_(bb(R)^D) { u : ∥u - e∥ lt.eq delta } lt.eq c_D / 2 delta^(D - 1) lt.eq sqrt(D) /
   2 delta^(D - 1) . $ <s:sharp-cap>]

 For $D gt.eq 2$ and $0 lt.eq theta lt.eq pi$,
#[#set math.equation(numbering: n => "(11)")
 $ sigma_(bb(R)^D) { u : angle \( u \, e \) lt.eq theta } lt.eq \( 2 theta \)^(D - 1) . $ <s:angular-cap>]

 Consequently, on an affine subsphere $z + R S \( H \)$ as in (2), with radius $R$ and linear dimension $D gt.eq
   2$, the angular success probability of any fixed unit output is at most
#[#set math.equation(numbering: n => "(12)")
 $ min { 1 \, \( 8 epsilon.alt \/ R \)^(D - 1) } . $ <s:affine-terminal>]

 The last assertion also holds after averaging any target-independent output law.]
] <s:caps>

#proof[
  For the chordal cap, $t = chevron.l \, chevron.r u e$ lies in an interval of length at most $delta^2 \/
    2$ next to $1$, and $1 - t^2 lt.eq delta^2$ on that interval. Integrating (4) with $l = 1$ gives (10).
    For the angular cap, the polar-angle density is proportional to $sin^(D - 2) phi.alt$ on $\[ 0 \, pi \]$.
    Its numerator over $\[ 0 \, theta \]$ is at most $theta^(D - 1) \/ \( D - 1 \)$.
    Its denominator is at least $2^(- \( D - 2 \))$, by integration over $\[ pi \/ 6 \, 5 pi \/ 6 \]$. This proves (11).
  Angular error at most $epsilon.alt$ between unit vectors implies Euclidean error at most $epsilon.alt$.
    After projection onto $H$ and division by $R$, the successful directions in (2) lie in a Euclidean ball of
    radius $epsilon.alt \/ R$. If that set is nonempty, choose one successful direction as a center.
    Every other successful direction has chordal distance at most $2 epsilon.alt \/ R$ from it.
    For chordal distance $delta lt.eq 2$, the corresponding angle is at most $2 arcsin \( delta \/ 2 \)
    lt.eq \( pi \/ 2 \) delta$. When $8 epsilon.alt \/ R < 1$,
    (11) therefore gives $\( 8 epsilon.alt \/ R \)^(D - 1)$; when $8 epsilon.alt \/ R gt.eq 1$,
    total mass is the asserted bound. Integrating this pointwise statement over an independent output law proves
    the last claim. ◻
]

=== 3.2 Directions with a common random subspace <directions-with-a-common-random-subspace>

The joint direction law below is a spherical form of the linear Blaschke–Petkantschin formula;
  see Rubin #cite(label("Rubin2018")) Corollary 3.2, equation (3.5).
  We derive the normalized conditional density directly.

#thm([Lemma 3.2.])[
  (Conditional direction law).  #emph[Let $E$ have dimension $N$, let $L$ be a uniform $K$-dimensional subspace,
    and assume integers $1 lt.eq h < K lt.eq N$. Conditional on $L$, draw $Y_1 \, dots.h \,
    Y_h$ independently with law $sigma_L$. Given $Y_1 \, dots.h \, Y_j$,
    their span $V$ has dimension $j$ almost surely, and $L$ is uniform among the $K$-subspaces containing $V$.
    For $1 lt.eq j < h$, the conditional density of $Y_(j + 1)$ relative to $sigma_E$ is
#[#set math.equation(numbering: n => "(13)")
 $ frac(c \( K \, j \), c \( N \, j \)) "dist" \( y \, V \)^(- \( N - K \)) lt.eq
   "dist" \( y \, V \)^(- \( N - K \)) . $ <s:direction-density>]

 For $j = 0$, the first marginal is $sigma_E$. If $K = N$, the density in (13) is identically one.]
] <s:directions>

#proof[
  Fix a $K$-space $L_0 subset E$. Draw independent $xi_1 \, dots.h \,
    xi_h tilde.op sigma_(L_0)$ and an independent uniform orthogonal matrix $Q$, and put $L = Q L_0$, $Y_i =
    Q xi_i$. This produces the stated experiment. Since $h < K$, the first $j$ preimages, and hence their images,
    are linearly independent almost surely.
  Condition on the first $j$ preimages and images. Applying Gram–Schmidt to the preimages gives an orthonormal
    basis of their span, and the images determine its image basis.
    Conditional on these images, the action of $Q$ on the perpendicular complement is a uniform orthogonal
    isometry. It follows that
  $ L = V xor L' \, wide L' upright(" uniform of dimension ") K - j upright(" in ") V^perp . $
  This conditional law depends only on $V$, so it persists when the preimages are forgotten.
  The next preimage is still uniform in $L_0$. Its projection onto the preceding span has the $j$-coordinate
    density (4) in dimension $K$. Its complementary direction is sent by the uniform remaining isometry to a
    uniform direction in $V^perp$, independently of that projection.
    The same decomposition of a direction with law $sigma_E$ uses the coordinate density in dimension $N$.
    Taking their ratio gives
  $ frac(c \( K \, j \), c \( N \, j \)) \( 1 - ∥P_V y∥^2 \)^(- \( N - K \) \/ 2) \, $
  which is (13). The integral normalizing $c \( K \, j \)$ is at least that normalizing $c \( N \, j \)$,
    because $\( 1 - ∥∥ t^2 \)^(\( K - j - 2 \) \/ 2) gt.eq \( 1 - ∥∥ t^2 \)^(\( N - j - 2 \) \/ 2)$ on the unit
    ball. Thus the prefactor is at most one. The first marginal is uniform by rotation invariance.
    When $K = N$, $L = E$ and the original conditional draws remain independent uniform directions,
    as the formula also shows. ◻
]

== 4 Stopping and the remaining dimension budget <s:stopping>

Each block estimate below loses two dimensions. Before iterating it, we must know that enough dimensions remain.
  Terminal state counting gives this fact on any putative short run.
  A separate full-data argument covers constant accuracy. Both reductions count individual samples and allow early
  stopping.

Throughout this section $W = 2^M$, and success is averaged over an independent uniform signal.
  Logarithms denoted by $log_2$ are to base two.

#thm([Lemma 4.1.])[
  (Terminal count and padding).  #emph[For $d gt.eq 3$, a learner of horizon $T$ satisfies
#[#set math.equation(numbering: n => "(14)")
 $ bb(P) \( upright("success") \) & lt.eq \( T + 1 \) W \( c_d \/ 2 \) epsilon.alt^(d - 1) \,\
bb(P) \( upright("success") \) & lt.eq \( T + 1 \) W \( 2 epsilon.alt \)^(d - 1) . $ <s:output-count-sharp>]

 The learner can be padded to any prescribed later sample layer, with the same success law and width at most
#[#set math.equation(numbering: n => "(15)")
 $ W_(*) = \( T + 2 \) W . $ <s:padded-width>]

]
] <s:terminal-count>

#proof[
  Fix a seed realization covered by Lemma 4 and use its Borel version.
    Its initial-state law is independent of the signal. For each terminal index-state pair $\( t \, v \)$,
    let $q_(t \, v) \( s \)$ be its probability of being reached at signal $s$,
    and let $pi_(t \, v)$ be its target-independent output law. There are at most $\( T + 1 \) W$ such pairs.
    Replacing $q_(t \, v) \( s \)$ by one, then integrating $pi_(t \, v)$ over the uniform signal,
    bounds that pair’s contribution by a single angular cap mass.
    Angular success implies chordal error at most $epsilon.alt$, so (10) gives (14); (11) gives (14).
    The same numerical bound holds for almost every fixed seed,
    so Lemma 4 permits averaging the original conditional success probabilities.
  To pad, keep every halted state together with its original stopping index as an absorbing state,
    and ignore later samples. At the final layer use its original output law.
    At any layer there are at most $W$ active states and $\( T + 1 \) W$ halted index-state labels, giving (15).
    This includes a stop at index zero. ◻
]

The terminal count also identifies the regime where the output restriction alone is decisive.
  At success probability at least $2 \/ 3$, (14) gives

$ T + 1 gt.eq frac(4, 3 c_d) thin 2^(- M) epsilon.alt^(- \( d - 1 \)) . $

For a fixed $alpha > 0$, accuracy $epsilon.alt = 2^(- alpha d)$ therefore requires $T gt.eq
  2^(\( alpha - o \( 1 \) \) d^2)$ when $M = o \( d^2 \)$. The block arguments provide an additional obstruction
  beyond terminal output counting. To apply them, we next extract the remaining dimension budget from the same
  terminal count.

#thm([Lemma 4.2.])[
  (Short-run dimension budget).  #emph[Fix constants $c > 0$ and $alpha > 0$, and put $L =
    log_2 \( 1 \/ epsilon.alt \)$. Suppose $M \( d \) = o \( d^2 \)$.
    On any sequence of dimensions where uniform-prior success is at least $alpha$ and $T lt.eq c d L$, one has
#[#set math.equation(numbering: n => "(16)")
 $ L = o \( d \) \, wide T = o \( d^2 \) \, wide log_2 W_(*) = o \( d^2 \) . $ <s:short-run-conclusions>]

 Consequently, for any block length $k gt.eq c_0 d$ with fixed $c_0 > 0$, $ceil.l T \/ k ceil.r =
   o \( d \)$ on that sequence.]
] <s:short-run>

#proof[
  Since $L gt.eq 1$, $T + 1 lt.eq \( c + 1 \) d L$ and $log_2 L lt.eq L$.
    Taking logarithms in (14) and using $c_d lt.eq sqrt(d)$ gives the estimate
  #[#set math.equation(numbering: n => "(17)")
   $ \( d - 2 \) L lt.eq M + 3 / 2 log_2 d + log_2 frac(c + 1, 2 alpha) . $ <s:sharp-short-run>]
  This proves $L = o \( d \)$, uniformly in the accuracy and the rules on the indicated dimensions.
    The assumed sample bound gives $T = o \( d^2 \)$; then $log_2 W_(*) = M + log_2 \( T + 2 \) = o \( d^2 \)$.
    Dividing $T$ by $k gt.eq c_0 d$ proves the block-count assertion.
  The short-run hypothesis is essential: the conclusion $L = o \( d \)$ applies only on the indicated dimensions. ◻
]

#thm([Lemma 4.3.])[
  (Full-data residual bound).  #emph[Let $0 lt.eq T lt.eq d - 3$.
    Give an estimator all $T$ Gaussian rows and labels for a uniform signal,
    and allow any unit output depending on these data and independent randomness. Put $D = d - T$.
    For every $0 < r_0 < 1$, its angular success probability is at most
#[#set math.equation(numbering: n => "(18)")
 $ frac(T, d \( 1 - r_0^2 \)) + min {1 \, med c_D / 2 \( 2 epsilon.alt \/ r_0 \)^(D - 1) \,
   med \( 8 epsilon.alt \/ r_0 \)^(D - 1)} . $ <s:full-data-bound>]

]
] <s:full-data>

#proof[
  For $T gt.eq 1$, the row span $R_X$ has dimension $T$ almost surely.
    Given the full rows and labels, the row-space projection $p = P_(R_X) S$ is known,
    because the row matrix is injective on its row span. The residual law is
  $ S = p + r U \, wide r = sqrt(1 - ∥∥ p^2) \, wide U tilde.op sigma_(R_X^perp) . $
  Conditional on the data, the residual direction is uniform.
    At a fixed row span, spherical symmetry gives $bb(E) ∥∥ p^2 = T \/ d$.
    Markov’s inequality yields $bb(P) \( r < r_0 \) lt.eq T \/ \[ d \( 1 - r_0^2 \) \]$.
    On $r gt.eq r_0$, successful residual directions lie in a chordal cap of radius $2 epsilon.alt \/ r_0$,
    by the recentering argument in Lemma 9. The sharp and affine terminal cap bounds give the three alternatives
    in the minimum. The output randomization may be averaged after conditioning on the full data.
    When $T = 0$, take $R_X = { 0 }$, $p = 0$, and $r = 1$; the same argument uses the original full sphere. ◻
]

For $T lt.eq d \/ 4$, take $r_0 = 1 \/ 2$ in (18). Since $D gt.eq 3 d \/ 4$ and $2 epsilon.alt \/ r_0 lt.eq 0.4$,

$ bb(P) \( upright("success") \) lt.eq 1 / 3 + \( c_D \/ 2 \) 0.4^(D - 1) = 1 / 3 + o \( 1 \) $

uniformly in this range of $T$. Thus uniform-prior success at least $1 \/ 2$ requires

#[#set math.equation(numbering: n => "(19)")
 $ T > d \/ 4 $ <s:quarter-endpoint>]

for all sufficiently large $d$.

These full-data estimates apply to a learner that stopped earlier,
  because revealing all pre-generated rows and labels only gives it more information.

== 5 A beta-mixture comparison and the explicit constant <s:beta-mixture>

A block leaves a uniform direction in a random residual subspace.
  To bound a high moment of its continuation average, we must control the next direction after earlier directions
  in that same subspace have been exposed. Lemma 10 describes this law;
  the next lemma compares it with two families of tests on which an affine suffix bound can be used directly.

The first test is the whole ambient sphere. The second fixes one direction from the span of the earlier draws and
  averages on a latitude perpendicular to that direction. If the ambient space has linear dimension $D'$,
  each such latitude has linear dimension $D' - 1$, regardless of the number of earlier draws.
  This is the reason that a block will spend only two test dimensions:
  one for the observed projection direction and one for the comparison latitude.
  The beta variable in the construction below chooses the latitude radius so that its law controls the next
  direction near the preceding span.

#thm([Lemma 5.1.])[
  (Two-component domination).  #emph[Let $E$ have dimension $D'$, let $V subset E$ have dimension $1 lt.eq
    j < n < D'$, and let $N$ be uniform among the $n$-dimensional subspaces containing $V$.
    Conditional on $N$, let $v$ be uniform on $S \( N \)$. Set
$ alpha = frac(n - j, 2) \, wide alpha_(*) = frac(D' - j, 2) \, wide beta_0 = j / 2 \, wide beta_1 =
  frac(D' - n + j - 1, 2) . $

 Let $nu_0 = sigma_E$. Let $nu_1$ be the law of
#[#set math.equation(numbering: n => "(20)")
 $ sqrt(1 - Z) thin e_0 + sqrt(Z) thin u_0 \, wide Z tilde.op "Beta" \( alpha \, alpha_(*) - alpha \) \, quad
   e_0 tilde.op sigma_V \, quad u_0 divides e_0 tilde.op sigma_(E ∩ e_0^perp) \, $ <s:mixture-construction>]

 where $Z$ is independent of the directions. Then, as positive measures on $S \( E \)$,
#[#set math.equation(numbering: n => "(21)")
 $ "Law" \( v \) lt.eq 2^(D') \( nu_0 + nu_1 \) . $ <s:mixture-domination>]

 For $j = 0$, the first direction averaged over a uniform $N$ is uniform on $S \( E \)$.
   If $n = D'$, then $N = E$ and each new independent direction is uniform even after earlier directions are
   conditioned on. These cases require no mixture.]
] <s:mixture>

#proof[
  Put $Q \( y \) = ∥P_(V^perp) y∥^2$. For the actual direction, the orthogonal decomposition $N =
    V xor \( N ∩ V^perp \)$ and Lemma 5 give
  $ Q \( v \) tilde.op "Beta" \( alpha \, beta_0 \) . $
  For $nu_0$, the fraction has law $"Beta" \( alpha_(*) \, beta_0 \)$.
    Under $nu_1$, it equals $Z X$, where $X = ∥P_(V^perp) u_0∥^2$. If $j > 1$, the decomposition
  $ E ∩ e_0^perp = V^perp xor \( V ∩ e_0^perp \) $
  gives $X tilde.op "Beta" \( alpha_(*) \, \( j - 1 \) \/ 2 \)$, independently of $Z$.
    The beta-product identity (7) gives $Q tilde.op "Beta" \( alpha \, beta_1 \)$.
    If $j = 1$, the second summand is zero and $X = 1$ deterministically.
    In that case $beta_1 = alpha_(*) - alpha$, so $Q = Z$ has the same stated law.
    We do not use a beta law with second shape zero.
  The three vector laws are invariant under independent orthogonal transformations of $V$ and $V^perp$.
    Their two component lengths are nonzero almost surely. For completeness,
    average a bounded Borel function of a vector over an independent uniform element of $O \( V \) times
    O \( V^perp \)$. At fixed nonzero component lengths, this average is integration over the product of the two
    uniform direction laws. Invariance leaves the original expectation unchanged,
    including after multiplication by any bounded function of $Q$.
    Thus each vector law is obtained from its scalar $Q$ law with the same independent uniform component
    directions. A comparison of the scalar densities therefore lifts to the full vector measures.
  Write $b = D' + 1 - n$. The nontrivial case has $b gt.eq 2$, and
  $ alpha_(*) - alpha = \( b - 1 \) \/ 2 > 0 \, wide beta_1 - beta_0 = \( b - 2 \) \/ 2 gt.eq 0 . $
  Let $f_(A \, B)$ denote the normalized beta density. The beta integral decreases when either positive shape
    parameter increases. For $q gt.eq 1 \/ 2$,
  $ frac(f_(alpha \, beta_0) \( q \), f_(alpha_(*) \, beta_0) \( q \)) =
    frac(upright(B) \( alpha_(*) \, beta_0 \), upright(B) \( alpha \, beta_0 \)) q^(- \( alpha_(*) - alpha \))
    lt.eq 2^(alpha_(*) - alpha) lt.eq 2^(D') . $
  For $q < 1 \/ 2$,
  $ frac(f_(alpha \, beta_0) \( q \), f_(alpha \, beta_1) \( q \)) =
    frac(upright(B) \( alpha \, beta_1 \), upright(B) \( alpha \, beta_0 \)) \( 1 - q \)^(- \( beta_1 - beta_0 \))
    lt.eq 2^(beta_1 - beta_0) lt.eq 2^(D') . $
  This includes equality $beta_1 = beta_0$ when $b = 2$. Splitting at $1 \/
    2$ and using the common direction factors proves (21). For $j = 0$,
    rotation invariance gives the uniform marginal; for $n = D'$,
    the subspace is the whole $E$ and the original draws remain independent uniform directions. ◻
]

#proof[
  Fix the memory sequence, and suppose that the conclusion fails along an unbounded sequence of dimensions.
    All logarithms in this proof are to base two. Write
  #[#set math.equation(numbering: n => "(22)")
   $ lambda = log_2 \( 1 \/ epsilon.alt \) \, wide c_(*) = 2^(- 16) \, wide
     T < c_(*) d lambda . $ <s:numeric-contradiction>]
  ===== 5.1 The short-run reduction. <the-short-run-reduction.>
  Lemma 12, with $c = c_(*)$ and $alpha = 2 \/ 3$, gives $lambda = o \( d \)$, $T = o \( d^2 \)$, and $log_2 w =
    o \( d^2 \)$ for the padded width
  $ w = \( T + 2 \) 2^M . $
  These bounds are uniform over the violating accuracies and learner rules:
    the explicit estimate (17) bounds $\( d - 2 \) lambda$ by a function of $d$ and $M \( d \)$ alone.
    If $lambda lt.eq 1024$, then $T < d \/ 64$, contradicting the full-data bound (19) at large $d$.
    We therefore restrict to $lambda > 1024$.
  Set
  #[#set math.equation(numbering: n => "(23)")
   $ k = m = floor.l d \/ 16 floor.r \, wide p = 2 floor.l d \/ 32 floor.r \, wide ell = p \/ 2 \, wide J =
     ceil.l T \/ k ceil.r \, wide G = 2^(4 d) w^(1 \/ m) . $ <s:numeric-parameters>]
  The radius exponent $p$ is even, so the inverse-radius moments below have the integer exponent $ell = p \/ 2$.
    Pad early stops to length $T$ using Lemma 11, and divide the horizon into $J$ batches of length at most $k$.
    A short last batch retains its actual positive length. When $T = 0$, there are no batches.
    At sufficiently large violating dimensions,
  #[#set math.equation(numbering: n => "(24)")
   $ J lt.eq 32 c_(*) lambda + 1 = o \( d \) \, wide J lt.eq d \/ 8 \, wide m \, p gt.eq d \/ 32 . $ <s:numeric-budget>]
  The first inequality uses $k gt.eq d \/ 32$.
  ===== 5.2 The suffix bound. <the-suffix-bound.>
  Fix a rule seed for which Lemma 4 applies, and use its Borel version.
    The signal remains uniform and independent of the pre-generated rows and initialization.
    Start a continuation from any specified boundary state, without conditioning on whether that state is reached.
    All the bounds below are uniform over this fixed choice of rules and state.
  For a boundary state $v$ after $i$ batches, let $h_(i \, v) \( s \)$ be its Borel suffix success.
    We claim that every affine subsphere $c + r S \( H \)$ with $D = dim H gt.eq d - 2 i$ satisfies
  #[#set math.equation(numbering: n => "(25)")
   $ integral h_(i \, v) \( c + r u \) thin d sigma_H \( u \) lt.eq
     G^(J - i) \( 8 epsilon.alt \/ r \)^p . $ <s:numeric-invariant>]
  The test dimension in this assertion decreases by two as the boundary index increases.
    In the backward step from $i + 1$ to $i$, the available bounds therefore include all affine tests of
    dimensions $D - 1$ and $D - 2$, whenever the current test has dimension $D gt.eq d - 2 i$.
  At $i = J$, Lemma 9 proves the claim. Indeed $D gt.eq d - 2 J gt.eq 3 d \/ 4$ gives $D - 1 gt.eq p$;
    if $8 epsilon.alt \/ r gt.eq 1$, use total mass, and otherwise compare the exponents in (12).
    This also treats $J = 0$.
  ===== 5.3 One block. <one-block.>
  Suppose the claim holds at $i + 1$, and let the next batch have length $1 lt.eq b lt.eq k$. Lemma 7 gives
  $ rho^2 tilde.op "Beta" \( \( D - b \) \/ 2 \, b \/ 2 \) \, wide c' = c + r sqrt(1 - rho^2) thin e \, wide r' =
    r rho \, $
  $ E = H ∩ e^perp \, wide D' = D - 1 \, wide n = D - b . $
  Conditional on $rho \, e$, the residual space $N$ is uniform of dimension $n$ in $E$.
    By Lemma 8, the left side of (25) is at most
  #[#set math.equation(numbering: n => "(26)")
   $ bb(E)_(rho \, e) bb(E)_N max_(v') F_(v') \( N \) \, wide F_(v') \( N \) =
     integral h_(i + 1 \, v') \( c' + r' u \) thin d sigma_N \( u \) . $ <s:numeric-max>]
  This step keeps all dependence on the exact batch data until the state maximum has been taken.
  We bound this state maximum through an $m$-th moment. Each conditional factor in that moment will use the same
    stage-$i + 1$ affine bound; the earlier replica span changes its distribution but not the induction stage.
  Fix $rho \, e \, v'$ and write
  $ U_0 = G^(J - i - 1) \( 8 epsilon.alt \/ r' \)^p . $
  Expand $F_(v') \( N \)^m$ using $m$ directions drawn independently conditional on $N$.
    Given the first $j < m$ directions, their span $V$ has dimension $j$ almost surely,
    and Lemma 10 makes $N$ uniform among the $n$-spaces containing $V$. The parameter bounds imply
  $ D gt.eq 3 d \/ 4 \, wide n gt.eq 11 d \/ 16 \, wide m lt.eq d \/ 16 < n . $
  For $j = 0$, the next direction is uniform on $S \( E \)$, and the stage $i +
    1$ hypothesis bounds its expected success factor by $U_0$, since $D' = D - 1 gt.eq d - 2 \( i + 1 \)$.
    If $b = 1$, then $n = D'$ and every next independent direction is uniform in $E$; the same bound applies.
    These cases precede any use of a beta mixture.
  For $j gt.eq 1$ and $b gt.eq 2$, apply Lemma 14. The $nu_0$ expectation is at most $U_0$.
    Under $nu_1$, conditional on $Z \, e_0$, the target is uniform on the affine subsphere with
  $ tilde(H) = E ∩ e_0^perp \, wide tilde(c) = c' + r' sqrt(1 - Z) thin e_0 \, wide tilde(r) = r' sqrt(Z) . $
  Its linear dimension is $D - 2 gt.eq d - 2 \( i + 1 \)$. Also $tilde(c) perp tilde(H)$, $tilde(r) > 0$,
    and $∥tilde(c)∥^2 + tilde(r)^2 = 1$, because $c' perp E$ and $∥c'∥^2 + \( r' \)^2 = 1$.
    The induction hypothesis bounds its mean by $U_0 Z^(- ell)$.
  In the notation of Lemma 14,
  $ n - j gt.eq 10 d \/ 16 \, wide alpha - ell gt.eq 9 d \/ 32 gt.eq d \/ 4 \, wide alpha_(*) lt.eq d \/ 2 . $
  The other shape $alpha_(*) - alpha = \( b - 1 \) \/ 2$ is positive.
    The integer $ell = floor.l d \/ 32 floor.r$ is strictly below the first shape, and every ratio below is at most two:
  #[#set math.equation(numbering: n => "(27)")
   $ bb(E) Z^(- ell) = product_(t = 1)^ell frac(alpha_(*) - t, alpha - t) lt.eq 2^ell lt.eq 2^d . $ <s:mixture-inverse>]
  Since $D' lt.eq d$, the mixture domination bounds the conditional expected next factor by
  $ 2^d U_0 \( 1 + bb(E) Z^(- ell) \) lt.eq 2^(3 d) U_0 . $
  For each preceding replica span, this uses a fresh test in the same dimension $D - 2$.
    Only the single direction $e_0$ is removed from $E$; no dimension decrease is carried from one replica to the next.
  Integrating the nonnegative product in reverse conditional order gives
  $ bb(E)_N F_(v') \( N \)^m lt.eq \( 2^(3 d) U_0 \)^m . $
  Jensen’s inequality and the sum of the at most $w$ state moments then give
  $ bb(E)_N max_(v') F_(v') \( N \) lt.eq w^(1 \/ m) 2^(3 d) U_0 . $
  For the residual fraction $rho^2$, the first shape satisfies $n \/ 2 - ell gt.eq 5 d \/ 16 gt.eq d \/ 4$,
    its total shape is $D \/ 2 lt.eq d \/ 2$, and its other shape $b \/ 2$ is positive even for a one-row batch.
    The same integer beta identity yields
  #[#set math.equation(numbering: n => "(28)")
   $ bb(E) rho^(- p) = product_(t = 1)^ell frac(D \/ 2 - t, n \/ 2 - t) lt.eq 2^ell lt.eq
     2^d . $ <s:residual-inverse-numeric>]
  Averaging $r' = r rho$ in (26) supplies the factor $w^(1 \/ m) 2^(4 d) = G$, completing the backward induction.
  ===== 5.4 The numerical conclusion. <the-numerical-conclusion.>
  At $i = 0$, take the full sphere $H = bb(R)^d \, c = 0 \, r = 1$.
    The bound is uniform in the fixed shared seed and initial state;
    joint independence permits averaging over initialization,
    and then Lemma 4 permits averaging the original measurable conditional success probabilities over the seed.
    By $log_2 w = o \( d^2 \)$ and $m gt.eq d \/ 32$, we have $log_2 G lt.eq 5 d$ eventually.
    The base-two logarithm of the success upper bound is at most
  #[#set math.equation(numbering: n => "(29)")
   $ 5 d \( 32 c_(*) lambda + 1 \) + p \( 3 - lambda \) & lt.eq 5 d + \( 160 c_(*) - 1 \/ 64 \) d lambda\
 & lt.eq 5 d - d lambda \/ 128 lt.eq - 3 d . $ <s:numeric-arithmetic>]
  Here $3 - lambda lt.eq - lambda \/ 2$, $p gt.eq d \/ 32$, $160 c_(*) = 5 \/ 2048 lt.eq 1 \/ 128$,
    and $lambda gt.eq 1024$. The resulting success is less than $2 \/ 3$, a contradiction.
  Both precision branches exclude an unbounded sequence of violations.
    All eventual conditions were bounded using (17) and the fixed memory sequence;
    the full-data cap threshold is absolute. This proves the uniform dimension threshold and (1). ◻
]

== 6 The radius-weighted block estimate <s:weighted-proof>

We now develop the cap-moment method for arbitrary bounded continuation functions.
  Weighting the mean on an affine subsphere by a power of its radius makes the same test useful at every scale.
  The resulting block inequality is independent of a learner and also gives a precision bound at success
  probability one half.

For a Borel function $g : S^(d - 1) arrow.r \[ 0 \, 1 \]$, an exponent $a = d \/ 16$, and an integer $1 lt.eq
  n lt.eq d$, define

#[#set math.equation(numbering: n => "(30)")
 $ B_n \( g \) = sup_(dim H = n\
z perp H \, med R > 0\
∥∥ z^2 + R^2 = 1) R^a integral g \( z + R omega \) thin d sigma_H \( omega \) . $ <s:weighted-norm>]

In particular $B_d \( g \) = integral g thin d sigma_(bb(R)^d)$.
  The radius weight allows small subspheres to carry more mass while keeping the same test at every scale.

The block may choose among arbitrary bounded continuation functions.

#thm([Theorem 6.1.])[
  (Radius-weighted block estimate).  #emph[There are absolute constants $C gt.eq
    1$ and $d_(*)$ such that the following holds for every integer $d gt.eq d_(*)$. Put
$ k = m = floor.l d \/ 16 floor.r \, wide a = d \/ 16 . $

 Let $W gt.eq 1$, let $cal(V)$ be a nonempty finite set with $\| cal(V) \| lt.eq W$, and let $kappa_v :
   bb(R)^(k times d) times bb(R)^k arrow.r \[ 0 \, 1 \]$ be Borel functions with $sum_(v in cal(V)) kappa_v lt.eq
   1$. For Borel $g_v : S^(d - 1) arrow.r \[ 0 \, 1 \]$, set
$ g_(upright("in")) \( s \) = bb(E)_X sum_(v in cal(V)) kappa_v \( X \, X s \) g_v \( s \) \, $

 where $X$ has $k$ independent $N \( 0 \, I_d \)$ rows. For every integer $n$ with $d \/ 2 lt.eq n lt.eq d$,
#[#set math.equation(numbering: n => "(31)")
 $ B_n \( g_(upright("in")) \) lt.eq W^(1 \/ m) C^d max_(v in cal(V)) B_(n - 2) \( g_v \) . $ <s:weighted-block>]

 If $epsilon.alt > 0$, $pi$ is any probability measure on $S^(d - 1)$ and
$ g_pi \( s \) = integral upright(bold(1))_({ arccos chevron.l \, chevron.r u s lt.eq epsilon.alt }) thin
  pi \( d u \) \, $

 then, in the same range of $n$,
#[#set math.equation(numbering: n => "(32)")
 $ B_n \( g_pi \) lt.eq C^d epsilon.alt^a . $ <s:weighted-terminal>]

]
] <s:weighted-theorem>

The width factor pays for selecting a continuation after the block.
  The two-dimensional change instead records the latitude tests used to bound each conditional direction average.
  We first establish the moment estimate that connects these two features.

=== 6.1 Caps and subspace moments <caps-and-subspace-moments>

The use of replica moments and successive orthogonalization is related to Sharan, Sidford,
  and Valiant #cite(label("SSV2019")) Section 7, Lemma 12. The density becomes large near the preceding span.
  The next lemma shows that a cap estimate with sufficient dimension slack makes this singularity integrable.
  Its explicit constant retains a useful quantitative form of the argument.

#thm([Lemma 6.2.])[
  (Caps and subspace moments).  #emph[Let $E$ have dimension $N lt.eq d$,
    and let $L$ be a uniform $K$-space in $E$, with integers $1 lt.eq h < K lt.eq N$. Put $b = N - K$.
    Let $f : S \( E \) arrow.r \[ 0 \, 1 \]$ be Borel. Suppose that for some finite $Lambda gt.eq 0$,
    constants $A_0 \, A_1 gt.eq 1$, and $0 lt.eq a < N - 1$,
#[#set math.equation(numbering: n => "(33)")
 $ integral f thin d sigma_E & lt.eq A_0^d Lambda \,\
integral_(∥y - y_0∥ lt.eq delta) f \( y \) thin d sigma_E \( y \) & lt.eq
  A_1^d Lambda delta^(N - 1 - a) quad \( y_0 in S \( E \) \, med delta > 0 \) . $ <s:cap-total>]

 If
#[#set math.equation(numbering: n => "(34)")
 $ N - 1 - a - \( h - 1 \) - b gt.eq 1 \, $ <s:moment-margin>]

 then
#[#set math.equation(numbering: n => "(35)")
 $ bb(E)_L (integral f thin d sigma_L)^h lt.eq (\[ 4 max { A_0 \, 9 A_1 } \]^d Lambda)^h . $ <s:moment-bound>]

 For a nonempty family of at most $W$ functions satisfying the same conditions with numbers $Lambda_v$,
#[#set math.equation(numbering: n => "(36)")
 $ bb(E)_L max_v integral f_v thin d sigma_L lt.eq W^(1 \/ h) \[ 4 max { A_0 \, 9 A_1 } \]^d max_v Lambda_v .
   $ <s:moment-maximum>]

 In particular, $A_0 = 1 \, A_1 = 4$ gives the constant $144^d$.]
] <s:cap-moment>

#proof[
  Put $alpha = N - 1 - a$ and $Q_0 = max { A_0 \, 9 A_1 }$.
    For a $j$-dimensional subspace $V subset E$, $1 lt.eq j < h$, and $0 < delta < 1$,
    every sphere point within distance $delta$ of $V$ lies within $2
    delta$ of its normalized projection onto $S \( V \)$. A maximal $delta$-separated subset of $S \( V \)$ has at
    most $\( 3 \/ delta \)^j$ points: the open balls of radius $delta \/
    2$ about them are disjoint inside the ball of radius $1 + delta \/ 2$ in $V$.
    Caps of radius $3 delta$ about these points cover the tube. Hence
  #[#set math.equation(numbering: n => "(37)")
   $ integral_("dist" \( y \, V \) lt.eq delta) f thin d sigma_E lt.eq
     A_1^d 3^(alpha + j) Lambda delta^(alpha - j) lt.eq Q_0^d Lambda delta^(alpha - j) . $ <s:tube>]
  The last inequality uses $alpha \, j lt.eq d$. At $delta = 1$, the same bound follows from (33).
    The zero-distance set has sphere measure zero because $j < N$.
    The shells $2^(- i - 1) < "dist" \( y \, V \) lt.eq 2^(- i)$ therefore give
  #[#set math.equation(numbering: n => "(38)")
   $ integral f \( y \) "dist" \( y \, V \)^(- b) thin d sigma_E \( y \) & lt.eq
     Q_0^d Lambda thin 2^b sum_(i gt.eq 0) 2^(- i \( alpha - j - b \))\
 & lt.eq Q_0^d Lambda thin 2^(b + 1) lt.eq \( 4 Q_0 \)^d Lambda . $ <s:inverse-distance>]
  Here $alpha - j - b gt.eq 1$ follows from (34), and $b + 1 lt.eq 2 d$.
    For $j = 0$, the distance of a unit vector from ${ 0 }$ is one and the same conclusion follows directly from
    total mass. Thus this case needs neither a net nor a shell sum.
  Conditional on $L$, draw $Y_1 \, dots.h \, Y_h$ independently from $sigma_L$.
    Expanding the power in (35) gives $bb(E) product_(i = 1)^h f \( Y_i \)$.
    Lemma 10 and (38) bound the last conditional factor by $\( 4 Q_0 \)^d Lambda$.
    Continue in reverse conditional order, using total mass for the first direction. This proves (35).
    Finally, writing $F_v \( L \) = integral f_v thin d sigma_L$, Jensen’s inequality gives
  $ bb(E) max_v F_v \( L \) lt.eq bb(E) (sum_v F_v \( L \)^h)^(1 \/ h) lt.eq (sum_v bb(E) F_v \( L \)^h)^(1 \/ h) \, $
  which proves (36). ◻
]

The lemma pays for the span of prior replicas through the tube exponent.
  It does not spend a new induction dimension for each replica:
  every conditional factor is tested against the same cap hypothesis on $S \( E \)$.
  In the applications, one latitude of an affine subsphere supplies that hypothesis.

=== 6.2 Proof of the block estimate and its application <proof-of-the-block-estimate-and-its-application>

A latitude in the perpendicular ambient sphere has two fewer linear dimensions than the original test.
  Its radius-weighted mean supplies the cap hypothesis; a final beta integral averages the residual radius.

#proof[
  We work at sufficiently large $d$, with the parameters in the theorem.
    First consider a terminal function $g_pi$ and a test $\( z \, H \, R \)$ of dimension $n gt.eq d \/ 2$.
    If $R gt.eq 2 epsilon.alt$, the successful directions for any fixed output lie in a chordal cap of radius $2
    epsilon.alt \/ R lt.eq 1$. By (10), their mass is at most $\( c_n \/ 2 \) \( 2 epsilon.alt \/ R \)^(n - 1)$.
    Since $n - 1 gt.eq a$, multiplication by $R^a$ bounds this by $\( c_n \/ 2 \) \( 2 epsilon.alt \)^a lt.eq
    C^d epsilon.alt^a$. If $R < 2 epsilon.alt$, total mass gives $R^a lt.eq \( 2 epsilon.alt \)^a$.
    Averaging the output law proves (32).
  For the block bound, fix a test $\( z \, H \, R \)$ of dimension $n$.
    Let $V$ be the span in $H$ of the $k$ projected rows. Put
  $ p = R P_V omega \, wide r = sqrt(R^2 - ∥∥ p^2) \, wide K = H ∩ V^perp \, wide q = n - k . $
  Almost surely $p eq.not 0$ and $r > 0$. Conditional on the matrix and $p$, the target is $z + p +
    r U$ with $U tilde.op sigma_K$, and its labels are $X \( z + p \)$. Lemma 8 bounds the averaged block function by
  #[#set math.equation(numbering: n => "(39)")
   $ bb(E)_p bb(E)_(K divides p) max_v integral g_v \( z + p + r U \) thin d sigma_K \( U \) . $ <s:weighted-max>]
  Here $K divides p$ is uniform among the $q$-spaces of $H' = H ∩ p^perp$, whose dimension is $N = n - 1$.
    Indeed, the length of $p$ fixes the beta fraction, its direction fixes $e$, and Lemma 7 gives this conditional law.
  Fix $p$ and one function $g = g_v$. On $S \( H' \)$ set
  $ f \( U \) = g \( z + p + r U \) \, wide Lambda = r^(- a) B_(n - 2) \( g \) . $
  For $w in S \( H' \)$, condition on the latitude coordinate $t = chevron.l \, chevron.r U w in \( - 1 \, 1 \)$.
    The target on that latitude is uniform on
  $ z + p + r t w + r sqrt(1 - t^2) thin S \( H' ∩ w^perp \) . $
  This is an admissible affine subsphere of linear dimension $n - 2$:
    its center is perpendicular to $H' ∩ w^perp$, and its squared center norm plus squared radius is $∥∥ z^2 + ∥∥
    p^2 + r^2 = 1$. The definition of $B_(n - 2)$ therefore bounds the latitude average of $f$ by
    $Lambda \( 1 - t^2 \)^(- a \/ 2)$.
  The coordinate density in dimension $N$ has remaining exponent $\( N - 3 - a \) \/ 2 gt.eq 0$.
    Integrating it over the whole interval and then over the cap interval gives
  #[#set math.equation(numbering: n => "(40)")
   $ integral f thin d sigma_(H') & lt.eq 2 c_N Lambda \,\
integral_(∥U - w∥ lt.eq eta) f \( U \) thin d sigma_(H') \( U \) & lt.eq
  c_N Lambda eta^(N - 1 - a) wide \( 0 < eta lt.eq 1 \) . $ <s:weighted-total>]
  For the second line the coordinate interval has length at most $eta^2 \/ 2$ and $1 - t^2 lt.eq eta^2$ there.
    For $eta > 1$, total mass extends the cap bound with an absolute exponential factor.
    Since $2 c_N lt.eq 2 sqrt(d) lt.eq 4^d$, these estimates satisfy Lemma 16 with absolute $A_0 \, A_1$.
  Use that lemma with ambient dimension $N = n - 1$, subspace dimension $q = n - k$, and moment $m = k$.
    The singular power is $N - q = k - 1$. The required inequalities hold at large $d$:
    $1 lt.eq m < q lt.eq N$, $0 lt.eq a < N - 1$, and, for $0 lt.eq l < m$,
  $ N - 1 - a - l - \( N - q \) = n - 1 - a - l - k gt.eq n - a - 2 k gt.eq 5 d \/ 16 gt.eq 1 . $
  The moment conclusion is
  #[#set math.equation(numbering: n => "(41)")
   $ bb(E)_(K divides p) (integral g \( z + p + r U \) thin d sigma_K \( U \))^m lt.eq
     (C^d r^(- a) B_(n - 2) \( g \))^m . $ <s:weighted-moment>]
  Each replica uses the same $n - 2$-dimensional latitude tests.
    No additional induction dimension is lost while the replicas are integrated.
  The maximum inequality (36) now bounds the inner expectation in (39) by
  $ W^(1 \/ m) C^d r^(- a) max_v B_(n - 2) \( g_v \) . $
  It remains to average the residual radius. By Lemma 7, $t = \( r \/ R \)^2 tilde.op
    "Beta" \( q \/ 2 \, k \/ 2 \)$. The denominator of its beta integral satisfies
  $ upright(B) \( q \/ 2 \, k \/ 2 \) gt.eq 1 / 2 thin 4^(- \( q \/ 2 - 1 \)_(+) - \( k \/ 2 - 1 \)_(+)) gt.eq
    4^(- d) \, $
  by restriction to $\[ 1 \/ 4 \, 3 \/ 4 \]$, where $x_(+) = max { x \, 0 }$.
    After multiplication by $t^(- a \/ 2)$, the numerator is
  #[#set math.equation(numbering: n => "(42)")
   $ integral_0^1 t^(\( q - a \) \/ 2 - 1) \( 1 - t \)^(k \/ 2 - 1) thin d t lt.eq 2 . $ <s:weighted-beta-integral>]
  Indeed $q - a gt.eq 2$ makes the first exponent nonnegative.
    If $k gt.eq 2$ the second is also nonnegative; if $k = 1$,
    its integral is at most $integral_0^1 \( 1 - t \)^(- 1 \/ 2) thin d t = 2$.
    Thus $bb(E) \( R \/ r \)^a lt.eq C^d$. This direct beta-integral argument does not require $a \/
    2$ to be an integer. Multiplying (39) by $R^a$, averaging,
    and taking the supremum over the original test proves (31). ◻
]

The block theorem now gives a complete lower bound from these norms.
  This application uses success $1 \/ 2$, which is enough for the constant-accuracy estimate (19).

#thm([Corollary 6.3.])[
  (Precision bound from radius weights).  #emph[There is an absolute $c > 0$ such that, for every $M \( d \) =
    o \( d^2 \)$, all sufficiently large $d$, and all $0 < epsilon.alt lt.eq 1 \/ 10$,
    a learner with uniform-prior angular success at least $1 \/ 2$ satisfies
$ T gt.eq c thin d log_2 \( 1 \/ epsilon.alt \) . $

 The eventual threshold may depend on the memory sequence.]
] <s:weighted-application>

#proof[
  Put $L = log_2 \( 1 \/ epsilon.alt \)$. The dimensions with $T gt.eq d L$ already satisfy the conclusion.
    On the remaining dimensions, Lemma 12, using (17), gives $L = o \( d \)$, $T = o \( d^2 \)$,
    and $log_2 W_(*) = o \( d^2 \)$. Pad to $b = ceil.l T \/ k ceil.r = o \( d \)$ blocks of $k =
    floor.l d \/ 16 floor.r$ samples with width $W_(*)$, as in Lemma 11.
    A short final block is filled with unused fresh rows.
  Let $G_(i \, v)$ be the Borel suffix success from state $v$ after $i$ blocks.
    Recursion (3) and Theorem 15 apply at each boundary. Use dimension $n = d - 2 i$ at stage $i$.
    For all sufficiently large dimensions under consideration, every needed dimension, including the terminal one,
    satisfies
  #[#set math.equation(numbering: n => "(43)")
   $ d - 2 i gt.eq d - 2 b gt.eq d \/ 2 wide \( 0 lt.eq i lt.eq b \) . $ <s:weighted-budget>]
  Iteration of (31), followed by (32), gives
  #[#set math.equation(numbering: n => "(44)")
   $ 1 / 2 lt.eq \[ W_(*)^(1 \/ m) C^d \]^b C^d epsilon.alt^a . $ <s:weighted-iteration>]
  The same bound holds for each initial state and each fixed independent choice of rules,
    so averaging them is legitimate.
  At large $d$, $m gt.eq d \/ 32$ and $log_2 W_(*) \/ m lt.eq d$.
    Taking base-two logarithms in (44), with $a = d \/ 16$, gives $L lt.eq
    C_1 \( b + 1 \)$ for an absolute $C_1 gt.eq 1$. If $L gt.eq 4 C_1$, then $b lt.eq T \/ k + 1$ implies
  $ T gt.eq k L \/ \( 2 C_1 \) . $
  Since $k gt.eq d \/ 32$ eventually, this is the asserted rate.
    For $L < 4 C_1$, (19) gives the same rate with an absolute smaller constant. This completes every accuracy regime. ◻
]

== 7 An affine invariant with explicit constants <s:affine-invariant>

The radius-weighted norm packages every test of one dimension into a single number.
  A closely related formulation propagates an explicit bound on every affine subsphere at once.
  It uses a different moment order and an even radius exponent,
  so its inverse-radius calculation is an exact finite beta product. We retain its numerical constants.

In this section $m$ is the block length and $k$ is the number of blocks. Set

#[#set math.equation(numbering: n => "(45)")
 $ m = floor.l d \/ 16 floor.r \, wide p = floor.l d \/ 8 floor.r \, wide a = 2 floor.l d \/ 32 floor.r \, wide
   n_0 = ceil.l d \/ 2 ceil.r \, wide C_(*) = 1000^32 . $ <s:affine-parameters>]

#thm([Proposition 7.1.])[
  (All-affine suffix bound).  #emph[For all sufficiently large $d$,
    consider a Borel learner padded to $k$ blocks of $m$ exact Gaussian samples, of width at most $W$,
    and with target-independent unit output laws at the last layer.
    The randomized experiment, shared seed, initialization, and fresh randomness satisfy the joint measurability,
    independence, and information restrictions of Definition 1.
    Here $0 < epsilon.alt lt.eq 1 \/ 10$, and success means angular error at most $epsilon.alt$. Assume
#[#set math.equation(numbering: n => "(46)")
 $ n_0 + 2 k lt.eq d \, wide W^(1 \/ p) lt.eq 2^d . $ <s:affine-budget>]

 For each fixed shared seed whose rules satisfy these assumptions, and for a state $v$ at layer $\( k - ell \) m$,
   let $g_v \( s \)$ be the success probability of the suffix started in that state.
   For $0 lt.eq ell lt.eq k$, every affine subsphere (2) with $dim H = n gt.eq n_0 + 2 ell$ satisfies
#[#set math.equation(numbering: n => "(47)")
 $ integral g_v \( z + r xi \) thin d sigma_H \( xi \) lt.eq \( R_ell \/ r \)^a \, wide R_ell =
   16 C_(*)^ell epsilon.alt . $ <s:affine-invariant-bound>]

 The assertion is uniform in the fixed seed and includes states unreachable from the initial layer.]
] <s:affine-proposition>

#proof[
  At $ell = 0$, fix a terminal output. If $16 epsilon.alt \/ r gt.eq 1$, total mass proves the bound.
    Otherwise the successful directions lie in a chordal cap of radius $2 epsilon.alt \/ r$.
    Its polar angle is at most $4 epsilon.alt \/ r$, so the polar calculation in Lemma 9 bounds its mass by
    $\( 16 epsilon.alt \/ r \)^(n - 1)$. Since $n - 1 gt.eq a$, this is at most $\( 16 epsilon.alt \/ r \)^a$.
    Average over the output law.
  Suppose the assertion holds at $ell$. Consider a preceding block on an $n$-dimensional test with $n gt.eq n_0 +
    2 \( ell + 1 \)$. Lemma 7, with $b = m$, gives a beta fraction $t$, a direction $e$,
    and a uniform residual $K = n - m$ dimensional space $L$ inside $E = H ∩ e^perp$, of dimension $N = n - 1$. Put
  $ z' = z + r sqrt(1 - t) thin e \, wide rho = r sqrt(t) \, wide f_u \( y \) = g_u \( z' + rho y \) \, wide
    F_u \( L \) = integral f_u thin d sigma_L . $
  By Lemma 8, the desired mean is at most
  #[#set math.equation(numbering: n => "(48)")
   $ bb(E)_(t \, e) bb(E)_L max_u F_u \( L \) . $ <s:affine-state-max>]
  The maximum is over all next boundary states and has already removed their possible dependence on the rest of
    the exact block data.
  Fix $t \, e \, u$ and write $Lambda = \( R_ell \/ rho \)^a$.
    The test $z' + rho S \( E \)$ is admissible and has dimension $n - 1$,
    so the induction hypothesis gives $integral f_u thin d sigma_E lt.eq Lambda$.
    For a cap about $y_0 in S \( E \)$, condition a uniform direction on its polar angle $theta$.
    The corresponding target is uniform on the affine subsphere with center $z' + rho cos theta thin y_0$,
    radius $rho sin theta$, and space $E ∩ y_0^perp$ of dimension $n - 2 gt.eq n_0 + 2 ell$.
    Its average is at most $Lambda \( sin theta \)^(- a)$.
  For $0 < delta lt.eq 1$, the chordal cap has polar angle at most $2 delta$.
    Integrate the latitude bound against the normalized $sin^(N - 2) theta$ density.
    The exponent $N - 2 - a$ is nonnegative, and the original normalizing integral is at least
    $2^(- \( N - 2 \))$. Using $sin theta lt.eq theta$ gives
  #[#set math.equation(numbering: n => "(49)")
   $ integral_(∥y - y_0∥ lt.eq delta) f_u thin d sigma_E lt.eq 4^d Lambda delta^(N - 1 - a) . $ <s:affine-cap>]
  For $delta > 1$, total mass proves the same bound.
  Apply Lemma 16 with $A_0 = 1 \, A_1 = 4$, moment $p$, and singular exponent $N - K = m - 1$.
    We have $1 lt.eq p < K lt.eq N$, $0 lt.eq a < N - 1$, and, for $0 lt.eq j < p$,
  $ N - 1 - a - j - \( m - 1 \) gt.eq n - a - p - m gt.eq d \/ 4 + 2 \( ell + 1 \) gt.eq 1 . $
  Indeed $n gt.eq n_0 + 2 \( ell + 1 \) gt.eq d \/ 2 + 2 \( ell + 1 \)$, while $a lt.eq d \/ 16$, $p lt.eq
    d \/ 8$, and $m lt.eq d \/ 16$. The tube coefficient in (37) is $36^d$, and (38) gives $144^d Lambda$. Consequently
  $ bb(E)_L F_u \( L \)^p lt.eq \( 144^d Lambda \)^p \, wide bb(E)_L max_u F_u \( L \) lt.eq
    W^(1 \/ p) 144^d Lambda lt.eq 288^d Lambda . $
  The remaining radius fraction has $t tilde.op "Beta" \( \( n - m \) \/ 2 \, m \/ 2 \)$.
    Here $q = a \/ 2 = floor.l d \/ 32 floor.r$ is an integer. Its denominator shapes satisfy
  $ \( n - m \) \/ 2 - q gt.eq 3 d \/ 16 > 0 . $
  Since $n \/ 2 lt.eq d \/ 2$, every ratio in the finite product is at most $\( d \/ 2 \) \/ \( 3 d \/ 16 \) =
    8 \/ 3 < 3$. Lemma 6 gives
  #[#set math.equation(numbering: n => "(50)")
   $ bb(E) t^(- a \/ 2) = product_(j = 1)^q frac(n \/ 2 - j, \( n - m \) \/ 2 - j) lt.eq 3^d . $ <s:affine-beta>]
  Substitution into (48) yields $864^d \( R_ell \/ r \)^a$.
    For large $d$, $a gt.eq d \/ 32$, hence $C_(*)^a gt.eq 1000^d gt.eq 864^d$.
    This proves the induction step with $R_(ell + 1) = C_(*) R_ell$. ◻
]

To apply the proposition, let $h = log_2 \( 1 \/ epsilon.alt \)$, assume $M \( d \) = o \( d^2 \)$,
  and suppose uniform-prior success is at least $2 \/ 3$. The dimensions with $T > d
  h$ already have the desired rate. On those with $T lt.eq d h$, apply Lemma 12 with $c = 1$ and $alpha = 2 \/ 3$.
  It gives $h = o \( d \)$, $T = o \( d^2 \)$, and padded log-width $o \( d^2 \)$.
  Pad to $k = ceil.l T \/ m ceil.r = o \( d \)$ blocks with $W = \( T + 2 \) 2^M$.
  Then (46) holds for all sufficiently large such dimensions:
  $n_0 + 2 k lt.eq d$, and $log_2 W = o \( d^2 \)$ with $p gt.eq d \/ 16$ eventually gives $W^(1 \/ p) lt.eq 2^d$.

At the initial sphere $z = 0 \, r = 1 \, H = bb(R)^d$, average the bound over initialization conditional on the
  shared seed, and then over that seed. Since $a gt.eq 1$,

#[#set math.equation(numbering: n => "(51)")
 $ 2 / 3 lt.eq \( 16 C_(*)^k epsilon.alt \)^a \, wide h lt.eq k log_2 C_(*) +
   log_2 24 lt.eq \( T \/ m + 1 \) log_2 C_(*) + log_2 24 . $ <s:affine-endgame>]

For $h gt.eq 2 \( log_2 C_(*) + log_2 24 \)$, this gives

$ T gt.eq frac(m h, 2 log_2 C_(*)) \, wide m gt.eq d \/ 32 $

eventually. For smaller $h$, (19) gives the same $d h$ rate with an absolute constant.
  This completes the all-affine proof, including its terminal dimension and bounded-precision cases.

== 8 A fixed-length theorem in varying dimensions <s:fixed-length>

The same conditional direction law gives a different intermediate theorem.
  Instead of testing one continuation on every affine subsphere in $bb(R)^d$,
  we compare learners in different ambient dimensions. The theorem allows an arbitrary Euclidean output and any
  positive error tolerance. A latitude is simulated by a smaller Gaussian learner,
  so the induction remains a statement about actual sample laws.

#thm([Proposition 8.1.])[
  (Dimension-parameterized success bound).  #emph[There are absolute constants $C gt.eq
    2$ and $d_(*)$ such that the following holds for every integer $d gt.eq d_(*)$. Set
$ k = p = floor.l d \/ 32 floor.r \, wide gamma = d \/ 32 . $

 Let $j gt.eq 0$ and $m$ be integers with $d \/ 2 + 2 j lt.eq m lt.eq d$.
   Consider a fixed-length learner with $j k$ independent exact Gaussian samples in dimension $m$, Borel rules,
   and at most $2^(d^2)$ states at each layer. Its output may be any vector in $bb(R)^m$.
   Its rules may use arbitrary fixed parameters independent of the target.
   Its randomized experiment, initialization, any shared rule seed,
   and fresh randomness obey the joint measurability, independence, and information restrictions in Definition 1,
   with $m$ in place of $d$. If the target $s$ is uniform on $S^(m - 1)$, then for every $eta > 0$,
#[#set math.equation(numbering: n => "(52)")
 $ bb(P) { ∥upright("output") - s∥ lt.eq eta } lt.eq \( C^(j + 1) eta \)^gamma . $ <s:fixed-bound>]

]
] <s:fixed-proposition>

#proof[
  We induct on $j$, simultaneously over all stated dimensions, learners, fixed parameters, and tolerances.
    All numerical factors introduced below are absolute and independent of the eventual choice of $C$.
    We may condition on the shared seed and start in a fixed state.
    The joint independence and measurability requirements then permit averaging the original conditional
    probabilities as in Lemma 4.
  If $j = 0$, the output is independent of the target. When $eta gt.eq 1$, (52) is trivial.
    When $eta < 1$, a zero output cannot succeed. For a nonzero output $v$, success implies
  $ ∥frac(v, ∥∥ v) - s∥ lt.eq lr(|1 - ∥∥ v|) + ∥v - s∥ lt.eq 2 eta . $
  Equation (10) therefore bounds the success probability by $K_0^d eta^gamma$, because $m - 1 gt.eq
    gamma$ and $eta < 1$. Choosing $C$ large enough proves the base case, including random output laws.
  Suppose $j gt.eq 1$. Let $A$ be the first $k$ rows, let $R$ be their row span, and put
  $ N_0 = R^perp \, wide u = P_R s \, wide r = sqrt(1 - ∥∥ u^2) . $
  Almost surely $u eq.not 0$ and $r > 0$. Conditional on $A \, u$, the target is $u +
    r z$ with $z tilde.op sigma_(N_0)$, and the first labels are $A u$.
    Thus the first block’s selected state supplies no additional information about $z$ under this conditioning.
  For fixed $u$, let $E = u^perp$ and $D = m - 1$. Write $bb(P)_(v \, s)$ for the law of the continuation from
    state $v$ at target $s$, and $hat(s)$ for its output. Define on $S \( E \)$
  $ f_v \( z \) = bb(P)_(v \, u + r z) { ∥hat(s) - \( u + r z \)∥ lt.eq eta } . $
  These Borel functions use fresh samples and do not depend on the remaining matrix data.
    Conditional success is at most $max_v integral f_v thin d sigma_(N_0)$.
    By Lemma 7, conditional on $u$, $N_0$ is a uniform $\( m - k \)$-space in $E$.
    Here $u = sqrt(1 - t) thin e$ fixes the beta fraction and direction in that lemma.
    The state maximum is taken before this marginal subspace law is used.
  We obtain a cap bound for $f = f_v$ from the induction hypothesis.
    Fix $e in S \( E \)$, a coordinate $t in \( - 1 \, 1 \)$, and set
  $ H = E ∩ e^perp \, wide c = u + r t e \, wide rho = r sqrt(1 - t^2) . $
  The target on this latitude is $c + rho z'$ with $z' tilde.op sigma_H$, where $dim H = m - 2$ and $c perp H$.
    Simulate the continuation as a learner for $z'$ in $H$. From a fresh pair
    $\( x' \, chevron.l x' \, z' chevron.r \)$ in $H$, draw a standard Gaussian $x''$ in $H^perp$,
    independently of the joint tuple consisting of $z'$, $x'$, and all previously used learner randomness.
    Supply the original continuation with
  #[#set math.equation(numbering: n => "(53)")
   $ x = x' + x'' \, wide y = chevron.l x'' \, c chevron.r + rho chevron.l x' \, z' chevron.r = chevron.l x \, c +
     rho z' chevron.r . $ <s:latitude-simulation>]
  This is exactly a fresh standard Gaussian pair in $bb(R)^m$ for the latitude target.
    The extra Gaussian is used within the transition, so the state set does not grow.
    The parameters $H \, c \, rho \, v$ are fixed independently of the varying target $z'$.
    At the end, project the original output onto $H$ and divide by $rho$.
    Original error at most $eta$ implies simulated error at most $eta \/ rho$.
  The simulated learner has $\( j - 1 \) k$ samples, and $m - 2 gt.eq d \/ 2 + 2 \( j - 1 \)$.
    The induction hypothesis therefore gives the latitude average
  $ integral f \( t e + sqrt(1 - t^2) thin z' \) thin d sigma_H \( z' \) lt.eq
    (frac(C^j eta, r sqrt(1 - t^2)))^gamma . $
  Put $B = C^j eta \/ r$. Integrating the latitude bound against the coordinate density in dimension $D$,
    whose remaining exponent is $\( D - 3 - gamma \) \/ 2 gt.eq 0$, gives
  #[#set math.equation(numbering: n => "(54)")
   $ integral_(∥z - e∥ lt.eq tau) f \( z \) thin d sigma_E \( z \) lt.eq \( c_D \/ 2 \) B^gamma
     tau^(D - 1 - gamma) wide \( tau > 0 \) . $ <s:fixed-cap>]
  Indeed, the coordinate interval has length at most $tau^2 \/ 2$, and $1 - t^2 lt.eq
    tau^2$ throughout that interval. At $tau = 2$, the cap is the whole sphere.
    Since $c_D lt.eq sqrt(d)$ and $D lt.eq d$, both the cap estimate and this total-mass estimate have
    coefficients at most $4^d$.
  We can therefore apply Lemma 16 to every $f_v$, with ambient dimension $D = m - 1$, subspace dimension $m - k$,
    moment $p = k$, exponent $a = gamma$, and $Lambda = B^gamma$, taking $A_0 = A_1 = 4$.
    Its hypotheses hold for all sufficiently large $d$: $1 lt.eq p < m - k lt.eq D lt.eq d$, $0 lt.eq gamma < D -
    1$, and
  $ D - 1 - gamma - \( p - 1 \) - \( k - 1 \) = m - gamma - 2 k gt.eq 13 d \/ 32 + 2 j gt.eq 1 . $
  The maximum conclusion of the lemma, over at most $2^(d^2)$ states, yields
  #[#set math.equation(numbering: n => "(55)")
   $ bb(E) [max_v integral f_v thin d sigma_(N_0) thin mid(bar.v) thin u] lt.eq
     2^(d^2 \/ p) 144^d \( C^j eta \/ r \)^gamma . $ <s:fixed-moment>]
  Thus the latitude simulation supplies the cap hypothesis,
    and the common moment lemma accounts for all dependence between directions in the residual space.
  It remains to average the inverse radius. By Lemma 7, $r^2 tilde.op "Beta" \( \( m - k \) \/ 2 \, k \/ 2 \)$.
    The real-exponent identity (5) gives
  #[#set math.equation(numbering: n => "(56)")
   $ bb(E) r^(- gamma) =
     frac(upright(B) \( \( m - k - gamma \) \/ 2 \, k \/ 2 \), upright(B) \( \( m - k \) \/ 2 \, k \/ 2 \)) lt.eq
     4^d . $ <s:fixed-radius>]
  To see the bound, note that $m - k - gamma gt.eq 7 d \/ 16 + 2 j$,
    so both exponents in the numerator’s beta integral are nonnegative for large $d$,
    and that integral is at most one. Restricting the denominator to $\[ 1 \/ 4 \, 3 \/ 4 \]$ gives
  $ upright(B) \( \( m - k \) \/ 2 \, k \/ 2 \) gt.eq 1 / 2 thin 4^(- \( m \/ 2 - 2 \)) gt.eq 4^(- d) . $
  In particular, this argument applies to the real exponent $gamma = d \/ 32$.
  Finally $p gt.eq d \/ 64$ for large $d$. Averaging (55) and applying (56) bounds success by
  $ \( 2^64 dot.op 576 \)^d \( C^j eta \)^gamma . $
  Since $gamma = d \/ 32$, choose the absolute constant $C$ large enough that $C^gamma$ absorbs this factor and
    the base-case factor. This completes the simultaneous induction. ◻
]

The dimension condition in the proposition is essential to its application.
  Here is the complete reduction that ensures it. Let $F = log \( 1 \/ epsilon.alt \)$ use natural logarithms,
  put $F_0 = 8 log C$, and choose an absolute $a_0 > 0$ with

#[#set math.equation(numbering: n => "(57)")
 $ a_0 lt.eq frac(1, 8 F_0) \, wide a_0 lt.eq frac(1, 256 log C) . $ <s:fixed-end-constants>]

Suppose that along arbitrarily large dimensions, learners with $M \( d \) =
  o \( d^2 \)$ and uniform-prior angular success at least $2 \/ 3$ satisfy $T < a_0 d F$.
  Apply Lemma 12 with $L = F \/ log 2$, $c = a_0 log 2$, and $alpha = 2 \/ 3$.
  It gives $F = o \( d \)$, $T = o \( d^2 \)$, and padded log-width $o \( d^2 \)$ on this supposed sequence only.

Pad to $n = ceil.l T \/ k ceil.r = o \( d \)$ blocks. The padded width $\( T + 2 \)
  2^M$ is eventually at most $2^(d^2)$, and $d \/ 2 + 2 n lt.eq d$.
  If $F lt.eq F_0$, the supposed sample bound and (57) give $T < d \/ 8$, contradicting (19).
  If $F > F_0$, then $k gt.eq d \/ 64$ and

$ \( n + 1 \) log C lt.eq \( 64 a_0 F + 2 \) log C lt.eq F \/ 2 . $

Apply Proposition 19 with $m = d \, j = n$, and $eta = epsilon.alt$.
  The original unit-output angular success event implies Euclidean error at most $epsilon.alt$,
  whereas the proposition bounds that Euclidean success by $exp \( - gamma F \/ 2 \) < 2 \/ 3$ at large $d$.
  This contradiction proves the precision lower bound by the fixed-length route,
  while retaining its stronger arbitrary-vector intermediate statement.

#bibliography("refs.bib", style: "ieee", title: [References])
