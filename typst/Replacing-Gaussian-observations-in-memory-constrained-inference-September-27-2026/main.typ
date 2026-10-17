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

#align(center)[#text(size: 16pt, weight: "bold")[Replacing Gaussian observations in memory-constrained inference]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:r-introduction>

A finite message chosen from data changes the conditional distribution of those data. This elementary fact becomes a central issue in memory-constrained inference. Suppose a signal $S$ is observed through exact Gaussian equations and a learner retains a finite state $W$. After conditioning on $W$, the rows used to select that state are generally biased. An independent Gaussian matrix has the same unconditional row law, but it need not leave the same information about $S$ once its labels are revealed.

This paper quantifies that change. We compare information beyond a wholly independent auxiliary projection with information beyond a projection containing the actual rows used by the learner. The two experiments keep the signal–message marginal and the signal–matrix marginal fixed. Their full joint laws differ. At suitable row dimensions proportional to $d$, the comparison cost is $O \( d \)$ when the message entropy is at most $d^2$. We also prove the projection moment that makes this possible and develop two further comparisons based on replacing one row at a time and on a two-signal fiber measure.

Here is one precise comparison. Write $H$ for discrete entropy in nats, $h$ for differential entropy, and $I \( dot.op \; dot.op divides dot.op \)$ for conditional mutual information. Let $S$ be uniform on $S^(d - 1)$, put $m = floor.l d \/ 10 floor.r$ and $ell = floor.l d \/ 2 floor.r$, and let $A$ be an $m$-row standard Gaussian matrix independent of $S$. A countable message $W$ may have arbitrary joint dependence on $\( S \, A \)$, subject to $H \( W \) lt.eq d^2$. Draw an $\( ell - m \)$-row Gaussian matrix $C$ independently of $\( S \, A \, W \)$, and an $ell$-row Gaussian matrix $G$ independently of $\( S \, W \)$. Theorem 10 proves

$ I \( S \; W divides G \, G S \) lt.eq I \( S \; W divides A \, C \, A S \, C S \) + K d $

for all sufficiently large $d$, with an absolute threshold and an absolute constant $K$. Thus replacing rows that helped select the message by fresh rows costs only $O \( d \)$ additional conditional information, despite the possible bias of $A$ given $W$.

=== Memory, exact equations, and prior methods <memory-exact-equations-and-prior-methods>

Memory restrictions affect statistical estimation even when computation is unrestricted. Steinhardt and Duchi established memory-dependent minimax bounds for sparse noisy regression [10]. Raz’s branching-program lower bounds for parity learning and broader discrete learning tasks showed how finite width can force a large sample cost [6,7]. Sharan, Sidford, and Valiant developed a closely related finite-state framework for continuous regression [9].

Their precision theorem uses isotropic Gaussian covariates with independent uniform additive noise of half-width $2^(- d \/ 5)$. For Euclidean accuracy $d^(- r)$, with $r lt.eq O \( d \/ log d \)$, at most $d^2 \/ 4$ bits of memory, and success probability at least $2 \/ 3$, it gives an $Omega \( d log r \)$ sample lower bound [9] Theorem 1. The present observation law has exact labels, which contain more information than noisy labels. Accordingly, our proof needs an estimate for exact projection densities. Sharan, Sidford, and Valiant’s expansion of a projection moment into independent signal copies is a direct method precedent [9] Section 7, Lemma 12; their one-row interval estimate uses a positive noise scale and global $L^2$ control, while the mixed multirow estimate below is proved from local mass bounds. Dagan, Kur, and Shamir give related space lower bounds for an approximate-nullvector task with independent Gaussian rows and for empirical regression on a randomly ordered finite data set with exactly consistent labels [2] Theorems 3 and 10. The latter result bounds the empirical residual under a hard joint data distribution; our recovery problem uses independent Gaussian rows and a fixed signal.

Information-theoretic analyses of adaptive selection also compare a selected statistic with an independent reference. Russo and Zou bound the divergence between a selected statistic on the observed data and its evaluation on an independent copy by the information used for selection [8] Section 2.4, Proposition 4. Xu and Raginsky bound an expectation difference between a joint law and the product of its marginals for a test that is sub-Gaussian under the product law [12] Section 3.1, Lemma 1. These comparisons explain the role of an information charge for selection. Here the test is an exact projection density, and a locally proved $q$th moment makes the row-information charge appear with coefficient $1 \/ q$.

The geometric calculation also belongs to the tradition of controlling projection energies by inverse distances. Mattila’s two-point averaging estimate gives a classical instance of that principle [4] proof of Lemma 5.1, p. 236. Our mixed moment contains both inverse lengths and inverse distances to the span of earlier signal differences. The specific Gaussian factors, dimension conditions, and finite fiber normalization are proved in this paper.

=== The streaming model and the application <the-streaming-model-and-the-application>

The comparison theorems concern finite messages with arbitrary dependence on a signal and some Gaussian rows. Their streaming application uses the following model.

#prodef([Definition 1.1.])[
  (Finite persistent-state learner).  Fix $d gt.eq 2$, an integer memory bound $M gt.eq 0$, an angular accuracy $0 < epsilon.alt lt.eq 1 \/ 10$, and a deterministic finite integer horizon $T gt.eq 0$. The signal is a unit vector. It may be fixed before sampling, or sampled from a specified prior; the average-case statements in this paper use uniform probability on $S^(d - 1)$. Pre-generate independent
  $ X_t tilde.op N \( 0 \, I_d \) \, #h(2em) Y_t = chevron.l X_t \, S chevron.r \, #h(2em) t gt.eq 1 . $
  The row sequence is independent of $S$.
  Let $Xi$ be a shared rule seed, constant if no shared seed is used, and let $U_0$ be the initial finite state. The pair $\( Xi \, U_0 \)$ is jointly independent of $\( S \, \( X_t \)_(t gt.eq 1) \)$; $Xi$ and $U_0$ may depend on one another. The original randomized experiment is jointly measurable in the signal, the complete row sequence, the shared seed, initialization, and all transition and output randomness. All variables and kernels are taken on standard Borel spaces, with the completed-measurability convention below for sample arguments.
  At every index, including index zero, the persistent state has at most $2^M$ possible values. Conditional on $Xi$, the rule at time $t$ uses only the current state, the index $t$, and the entire current pair $\( X_t \, Y_t \)$, together with fresh randomness that has no additional signal or sample information. The rule may perform unrestricted computation on that pair, but everything retained for later samples must be encoded in the new finite state. The learner receives the rows once in their prescribed order and cannot choose a row or revisit an earlier one.
  The learner stops at an index $tau in { 0 \, dots.h \, T }$. Conditional on the fixed seed, its unit-vector output $hat(S)$ is drawn from a kernel depending only on the terminal state and $tau$, using fresh output randomness. In particular the last observed pair can affect the output only through that terminal state. The seed may select nonuniform rules depending on $d \, epsilon.alt \, t$, but it has no data-dependent content. Before the first sample, a stopping choice may use only the seed, the initial state, and fresh randomness.
  For each fixed seed, state, and index, the transition and stopping probabilities may be Borel functions of the sample pair, or measurable in the completion of Gaussian row measure times Lebesgue label measure. This per-seed convention supplements the required joint measurability of the original mixed experiment; it does not replace it. Success means $arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt$.
] <def:r-streaming-model>

The joint condition on $\( Xi \, U_0 \)$ ensures that fixing the rule seed leaves initialization data-independent. We record this reduction because the information potentials start from the conditional initial-state law.

#thm([Lemma 1.2.])[
  (Fixing the shared rule seed).  #emph[In the model above, for almost every seed value $xi$, 
#[#set math.equation(numbering: n => "(1)")
 $ cal(L) #scale(x: 120%, y: 120%)[\(] S \, \( X_t \)_(t gt.eq 1) \, U_0 divides Xi = xi #scale(x: 120%, y: 120%)[\)] = cal(L) #scale(x: 120%, y: 120%)[\(] S \, \( X_t \)_(t gt.eq 1) #scale(x: 120%, y: 120%)[\)] ⊗ cal(L) \( U_0 divides Xi = xi \) . $ <eq:r-seed-factorization>]

 If the original uniform-prior success probability is at least $p_0$, one may choose such a seed value whose conditional uniform-prior success is at least $p_0$, with the same state bound and horizon. This assertion is about the uniform-prior experiment.]
] <lem:r-seed-reduction>

#proof[
  Disintegrate the joint independence of $\( Xi \, U_0 \)$ and $\( S \, \( X_t \)_(t gt.eq 1) \)$ over $Xi$. It gives (1) for almost every seed. Joint measurability of the original experiment makes its conditional success probability a measurable function of $xi$, whose mean is the original success probability. Averaging therefore supplies a seed with the stated success and factorization. The conditional initial-state law is retained. A later Borel replacement is performed separately in this fixed-seed experiment; no jointly measurable selection of replacement versions is required. ◻
]

The critical-radius comparison gives the following streaming consequence: for $M \( d \) = o \( d^2 \)$, every accuracy sequence $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$, and uniform-sphere average success at least $3 \/ 5$, the deterministic horizon must satisfy

$ T \( d \) = Omega #h(-0.16667em) (d log frac(1, epsilon.alt \( d \))) . $

The lower-bound constant is absolute; the eventual dimension threshold may depend on the memory sequence. Section 8 proves this statement and records the distinct constants and thresholds arising from the other comparisons. A learner that succeeds with probability at least $2 \/ 3$ for every fixed signal also has that success under the uniform prior, so the worst-signal consequence follows separately. The auxiliary projections used in the proof are analysis variables; the learner receives only the exact stream in Definition 1.

=== How the comparisons work <how-the-comparisons-work>

Section 2 defines the aligned and independent experiments explicitly. Their information difference contains a negative conditional row-information term. Data processing compares that term with the divergence between the actual conditional label law and the projection of the posterior $P_(S divides W)$. What remains is the entropy of the independent projection plus an aligned log density.

Section 3 proves the analytic estimate for that density. In a $q$th moment, the actual rows are shared by all $q$ factors while independent auxiliary rows are averaged separately in each factor. Gaussian integration produces inverse lengths and the inverse Gram determinant of the signal differences. A local mass bound controls thin tubes around their successive spans, and a second bound controls the sum over small radial scales. The section treats exact density versions and the order of the change of row law and limiting operation.

Sections 4 and Section 5 use this estimate after refining a posterior by its local mass. The critical-radius refinement records both a radius and its logarithmic mass level. Two further comparisons use a single maximal level or a pair of density labels. Their entropy costs are explicit, and the density-level terms cancel with opposite signs. The two-label argument also retains its own Gaussian-mollifier and first-density passage.

These comparisons have different scopes. The critical-radius result allows countable messages and $floor.l d \/ 10 floor.r$ actual rows. The two-label result treats finite messages with the larger actual block $floor.l d \/ 8 floor.r$; its Gaussian-mollifier density version supports an estimate at every fixed target. The one-level result uses only one refinement label, a net-weight entropy estimate, and $floor.l d \/ 32 floor.r$ actual rows. It keeps the entropy-dependent comparison cost explicit rather than imposing $H \( W \) lt.eq d^2$ in its statement.

The last two comparisons use different geometric objects. Section 6 keeps the actual ending state fixed while replacing an actual prefix of rows by an independent suffix, one row at a time. Independent random kernels and a normalized reciprocal-distance selection control the successive changes. Section 7 constructs a finite measure on pairs having the same Gaussian label. It proves that measure’s exact kernel and normalizes the reference before applying probability data processing. Local-mass ratios then bound the resulting information difference. The hybrid argument averages over the number of auxiliary observations, whereas the fiber comparison concerns a state transition through an actual block, rather than an arbitrary message jointly distributed with its rows. These scopes explain the separate applications below.

Finally, Section 8 applies these comparisons to successive fresh blocks. It includes a local Borel-version reduction for the fixed-seed uniform-prior experiment, the state and stopping-index costs, and the residual-sphere information required by an accurate output. A separate memory-unrestricted sample bound absorbs the final-block rounding cost. This separates the analytic comparisons from the bookkeeping needed to apply them to a learner.

== 2 The two experiments and their information difference <sec:r-experiments>

The comparison begins with two experiments that give the signal and the finite message the same joint distribution. They differ in the rows revealed alongside that message. Before defining them, we fix the measure and entropy conventions needed to interpret their exact labels.

Write $sigma$ for uniform probability on $S^(d - 1)$, put $n = d - 1$, and let $B \( z \, t \)$ be the closed Euclidean ball with center $z$ and radius $t$. The notation $gamma_a$ denotes the law of an $a times d$ matrix with independent $N \( 0 \, 1 \)$ entries. All logarithms are natural. Constants denoted by $C$ are positive and absolute and may increase between occurrences.

#thm([Lemma 2.1.])[
  (Spherical caps and ambient balls).  #emph[On the unit sphere in $bb(R)^a$, $a gt.eq 2$, a cap of angular radius $0 lt.eq theta lt.eq pi$ has uniform probability at most $theta^(a - 1)$. On $S^(d - 1)$, 
$ sigma \( B \( s \, t \) \) lt.eq t^n quad \( s in S^(d - 1) \) \, #h(2em) sigma \( B \( z \, t \) \) lt.eq \( 2 t \)^n quad \( z in bb(R)^d \) \, #h(2em) t > 0 . $

 Consequently a fixed unit-vector output, or a random unit-vector output independent of the signal, succeeds to angular error $epsilon.alt$ on a set of $sigma$-mass at most $epsilon.alt^n$.]
] <lem:r-caps>

#proof[
  The cap probability is the ratio of the integrals of $sin^(a - 2) u$ over $\[ 0 \, theta \]$ and $\[ 0 \, pi \]$. The numerator is at most $theta^(a - 1) \/ \( a - 1 \)$. Symmetry and $sin u gt.eq 2 u \/ pi$ on $\[ 0 \, pi \/ 2 \]$ bound the denominator below by $pi \/ \( a - 1 \)$, proving the angular estimate.
  For the centered Euclidean estimate it suffices to consider $t lt.eq 1$. Rotate $s$ to the north pole. Points in $B \( s \, t \)$ have last coordinate at least $1 - t^2 \/ 2 gt.eq 1 \/ 2$. As a graph above the first $n$ coordinates, this part of the sphere has area element at most twice Lebesgue measure and projects into the $n$-ball of radius $t$. The entire sphere has area at least twice the volume of the unit $n$-ball, by projecting the two hemispheres. Their ratio is at most $t^n$. For $t > 1$, total mass one suffices. An ambient ball meeting the sphere is contained, on the sphere, in the ball of radius $2 t$ about any one point of that intersection. This gives the second bound. Finally, angular error at most $epsilon.alt$ implies Euclidean error at most $epsilon.alt$, since $2 sin \( theta \/ 2 \) lt.eq theta$. Integrating the centered bound over an independent output law proves the last assertion. ◻
]

For probability measures $P \, Q$, relative entropy means

$ D \( P bar.v.double Q \) = cases(delim: "{", integral log frac(d P, d Q) thin d P \, & P lt.double Q \,, + oo \, & upright("otherwise") .) $

For a countable discrete variable $W$, $H \( W \)$ is its Shannon entropy in nats. Mutual information and conditional mutual information are the corresponding relative entropies of a joint law from the product of its marginals, conditionally when appropriate. We use regular conditional laws on standard Borel spaces. The conditional chain rule and average conditional relative-entropy formulas used here are given by Austin [1] Lemma 3.6 and Equations (13)–(18). For probability data processing under a measurable map or a common Markov kernel, see van Erven and Harremoës [11] Theorems 5 and 9; Example 2. Our finite-reference comparisons use the following precise normalization.

#thm([Lemma 2.2.])[
  (A finite reference measure).  #emph[Let $P$ be a probability measure and let $Q$ be a finite nonzero measure on the same measurable space. Put $c = Q \( Omega \)$ and $overline(Q) = Q \/ c$. When $P lt.double Q$, define 
$ D_(upright("fin")) \( P bar.v.double Q \) = integral log frac(d P, d Q) thin d P . $

 This extended quantity is bounded below by $- log c$ and satisfies 
$ D_(upright("fin")) \( P bar.v.double Q \) = D \( P bar.v.double overline(Q) \) - log c . $

 If $T$ is measurable, then 
$ D_(upright("fin")) \( T_(\#) P bar.v.double T_(\#) Q \) lt.eq D_(upright("fin")) \( P bar.v.double Q \) . $

]
] <lem:r-finite-reference>

#proof[
  The density identity $d P \/ d Q = c^(- 1) d P \/ d overline(Q)$ gives the displayed equality and lower bound. Both $Q$ and $T_(\#) Q$ have mass $c$, and $overline(T_(\#) Q) = T_(\#) overline(Q)$. Probability data processing applied to $\( P \, overline(Q) \)$, followed by subtracting the same $log c$ from both sides, proves the claim. For completeness, probability data processing follows from the identity
  $ frac(d T_(\#) P, d T_(\#) overline(Q)) \( T \) = bb(E)_(overline(Q)) [frac(d P, d overline(Q)) thin mid(bar.v) thin T] $
  and conditional Jensen for $x log x$. Thus the finite comparison uses a normalized probability reference before the inequality is applied. ◻
]

We will also use the entropy variational inequality. If $P lt.double Q$ are probabilities and $f$ is bounded and measurable, then

#[#set math.equation(numbering: n => "(2)")
 $ bb(E)_P f lt.eq D \( P bar.v.double Q \) + log bb(E)_Q e^f . $ <eq:r-entropy-variational>]

Indeed, normalize $e^f Q$ to a probability measure and expand the nonnegative relative entropy from $P$ to that measure. Truncation gives the same statement for nonnegative $f$ whenever $bb(E)_Q e^f < oo$, and for integrable $f$ with a finite exponential moment. This is the standard variational relation between entropy and exponential moments; see Dupuis and Mao [3] Equations (1.1)–(1.2), pp. 1–2.

=== 2.1 Density versions for exact labels <subsec:r-densities>

A Gaussian block maps a spherical signal into Euclidean label space. The next lemma specifies a common measurable density version and the integrability that permits subsequent entropy subtractions. Its first-moment argument is also a separate route from cube averages to the exact density.

#thm([Lemma 2.3.])[
  (Projection densities and logarithmic integrability).  #emph[Let $1 lt.eq ell < n$. If $rho$ is a finite measure with $rho lt.double sigma$, then the image $g_(\#) rho$ of $rho$ under every full-row-rank $g in bb(R)^(ell times d)$ has a Lebesgue density. For $delta > 0$, put 
$ p_(rho \, delta) \( g \, y \) = \( 2 delta \)^(- ell) integral upright(bold(1))_({ ∥g u - y∥_oo lt.eq delta }) thin d rho \( u \) . $

 A jointly Borel density version is 
#[#set math.equation(numbering: n => "(3)")
 $ p_rho \( g \, y \) = lim_(j arrow.r oo) p_(rho \, 1 \/ j) \( g \, y \) $ <eq:r-density-version>]

 where the limit exists and is finite, and zero otherwise.]
  #emph[Suppose now that $nu$ is a probability measure with $nu lt.eq H sigma$, $H < oo$, and $G tilde.op gamma_ell$ is independent of $S tilde.op nu$. Then $log p_nu \( G \, G S \)$ is integrable. In addition, 
#[#set math.equation(numbering: n => "(4)")
 $ sup_(delta > 0) bb(E) p_(nu \, delta) \( G \, G S \) lt.eq \( 2 pi \)^(- ell \/ 2) integral.double ∥u - s∥^(- ell) thin d nu \( u \) d nu \( s \) < oo \, $ <eq:r-first-density-moment>]

 and the same upper bound holds for $bb(E) p_nu \( G \, G S \)$.]
  #emph[Finally, let a countable $W$ with $H \( W \) < oo$ have any joint law with $\( S \, G \)$ that leaves the latter’s product marginal unchanged. For each positive-probability $w$, put $nu_w = P_(S divides W = w)$. The actual conditional law of $G S$ given $\( G \, W \)$ has a Lebesgue density. The logarithm of that density and $log p_(nu_W) \( G \, G S \)$ are both integrable under the actual law.]
] <lem:r-projection-density>

#proof[
  The first $ell$ coordinates of a uniform spherical point have density
  $ frac(Gamma \( d \/ 2 \), pi^(ell \/ 2) Gamma \( \( d - ell \) \/ 2 \)) \( 1 - ∥y∥^2 \)^(\( d - ell - 2 \) \/ 2) upright(bold(1))_({ ∥y∥ < 1 }) . $
  To see the normalization, write the point as a standard Gaussian vector divided by its length. Its projected squared length has the $"Beta" \( ell \/ 2 \, \( d - ell \) \/ 2 \)$ law and its projected direction is uniform. Polar coordinates give the displayed density. An orthogonal change of coordinates followed by the invertible map $\( g g^(sans(T)) \)^(1 \/ 2)$ gives the density for $g_(\#) sigma$, with Jacobian $det \( g g^(sans(T)) \)^(- 1 \/ 2)$. Absolute continuity gives a density for $g_(\#) rho$. Each cube average is Borel in $\( g \, y \)$ by integration of a Borel indicator. Lebesgue differentiation shows that (3) is a density version for each full-rank $g$; the specified limit is jointly Borel.
  We first verify logarithmic integrability from this explicit spherical density. Under the product law $gamma_ell ⊗ sigma$, the logarithm of the residual squared radius is integrable by the beta law. Gram–Schmidt expresses $det \( G G^(sans(T)) \)$ as a product of chi-square variables with positive degrees of freedom, whose logarithms have finite absolute means. Hence $log p_sigma \( G \, G S \)$ is integrable. Domination by $H$ preserves this integrability under $gamma_ell ⊗ nu$. For every full-rank $g$, data processing gives
  $ D \( g_(\#) nu bar.v.double g_(\#) sigma \) lt.eq D \( nu bar.v.double sigma \) lt.eq log H . $
  The negative logarithmic part of any probability density ratio $a \/ b$, integrated under $a$, is at most $1 \/ e$, because $t log^(-) \( t \) lt.eq 1 \/ e$. Its positive part is therefore finite when the relative entropy is finite. Apply this to $p_nu \/ p_sigma$ and add the integrable baseline logarithm.
  Here is a direct proof that retains the first density moment in (4). For distinct $u \, s$, the $ell$ coordinates of $G \( u - s \)$ are independent centered normals with variance $∥u - s∥^2$. Their joint density is at most $\( 2 pi \)^(- ell \/ 2) ∥u - s∥^(- ell)$. The cube volume is $\( 2 delta \)^ell$. Multiplying these quantities and applying Tonelli proves the first inequality in (4); the diagonal is null since $nu lt.eq H sigma$ is nonatomic. For each $s in S^(d - 1)$, Lemma 3 and dyadic shells give
  $ integral ∥u - s∥^(- ell) thin d nu \( u \) lt.eq 1 + H 2^ell sum_(j gt.eq 0) 2^(- j \( n - ell \)) < oo . $
  The term $1$ covers distances greater than one, and $n - ell > 0$ makes the series converge. This is uniform in $s$.
  For each full-rank $G$, Lebesgue differentiation holds at $G S$ for $nu$-almost every $S$, since $G_(\#) nu$ has a density. Fubini and Fatou pass the first-moment bound to $p_nu \( G \, G S \)$. It follows that $bb(E) log^(+) p_nu \( G \, G S \) < oo$. To control the other part, let $phi.alt_ell$ be the standard Gaussian density on $bb(R)^ell$. For each $G$,
  $ integral p_nu \( G \, y \) (log frac(p_nu \( G \, y \), phi.alt_ell \( y \)))_(-) d y lt.eq 1 / e . $
  Also $bb(E) ∥G S∥^2 = ell$, so $bb(E) \[ - log phi.alt_ell \( G S \) \] = ell / 2 log \( 2 pi \) + ell / 2$. The inequality
  $ \( - log p_nu \)_(+) lt.eq (log \( p_nu \/ phi.alt_ell \))_(-) + \( - log phi.alt_ell \)_(+) $
  proves the negative logarithmic bound directly. The densities in these conclusions describe the exact labels; the cube averages only prove their estimates.
  For the last assertion, conditioning on $W = w$ dominates the joint law of $\( G \, S \)$ by $P \( W = w \)^(- 1)$ times $gamma_ell ⊗ nu$. This gives an actual conditional image density for every full-rank $G$, up to the usual null set in $G$. The product marginal is unchanged after averaging over $w$, so the actual expectation of $\| log p_nu \( G \, G S \) \|$ is finite. The relative entropy of the actual conditional image density from $p_nu \( G \, dot.op \)$, averaged over $\( G \, W \)$, equals $I \( W \; G S divides G \) lt.eq H \( W \)$. The density-ratio negative part is at most $1 \/ e$, hence its logarithm is integrable and so is the actual log density.
  Similarly, conditional data processing gives
  $ bb(E) D #scale(x: 120%, y: 120%)[\(] P_(G S divides G \, W) bar.v.double G_(\#) nu_W #scale(x: 120%, y: 120%)[\)] lt.eq bb(E) D #scale(x: 120%, y: 120%)[\(] P_(S divides G \, W) bar.v.double nu_W #scale(x: 120%, y: 120%)[\)] = I \( S \; G divides W \) lt.eq H \( W \) . $
  The last inequality follows from $I \( S \; G \) = 0$ and the chain rule. The log ratio in this display is integrable by the same negative-part bound. Subtracting it from the actual log density proves integrability of $log p_(nu_W) \( G \, G S \)$. The argument also applies to a deterministic refinement $W' = \( W \, E \( S \, W \) \)$ whenever $H \( W' \) < oo$. ◻
]

=== 2.2 A message selected using actual rows <subsec:r-two-experiments>

Let $m \, r gt.eq 1$, $ell = m + r < n$, and let $S tilde.op sigma$. Let $A tilde.op gamma_m$ be independent of $S$, and let $W$ be a countable message with $H \( W \) < oo$, coupled arbitrarily to $\( S \, A \)$. We define two laws:

- In the #emph[aligned experiment] $P_1$, retain the joint law of $\( S \, A \, W \)$, take $C tilde.op gamma_r$ independently, and set $G = \( A \; C \)$ and $Y = G S$.
- In the #emph[independent experiment] $P_0$, retain the marginal law of $\( S \, W \)$, draw $G tilde.op gamma_ell$ independently of that pair, and again set $Y = G S$.

Both laws have the same $\( S \, W \)$ marginal and the same product $\( S \, G \)$ marginal. In the aligned law, $W$ may be dependent on the rows $G$; in the independent law, $G$ is independent of $\( S \, W \)$. Define

$ J_i \( W \) = I_i \( S \; W divides G \, Y \) \, #h(2em) i = 0 \, 1 \, $

and, for positive-probability $w$, let $nu_w = P_(S divides W = w)$, which is common to both experiments.

#thm([Proposition 2.4.])[
  (The information identity and its density bound).  #emph[In the two experiments just defined, all quantities below are finite, and 
#[#set math.equation(numbering: n => "(5)")
 $ J_0 \( W \) - J_1 \( W \) & = h_0 \( Y divides G \, W \) - h_1 \( Y divides G \, W \) - I_1 \( S \; G divides W \)\
 & lt.eq h_0 \( Y divides G \, W \) + bb(E)_1 log p_(nu_W) \( G \, Y \) . $ <eq:r-information-identity>]

 If $E = E \( S \, W \)$ is countable and $H \( E divides W \) < oo$, and the same deterministic refinement $W' = \( W \, E \)$ is used in both laws, then 
#[#set math.equation(numbering: n => "(6)")
 $ J_0 \( W \) - J_1 \( W \) lt.eq J_0 \( W' \) - J_1 \( W' \) + H \( E divides W \) . $ <eq:r-refinement-charge>]

]
] <prop:r-information-comparison>

#proof[
  Because $Y$ is determined by $\( S \, G \)$, the conditional chain rule gives
  $ J_i \( W \) = I_i \( S \; W divides G \) - I_i \( W \; Y divides G \) . $
  Since $S$ and $G$ are independent in both laws,
  $ I_i \( S \; W divides G \) = I \( S \; W \) + I_i \( S \; G divides W \) \, $
  and $I_0 \( S \; G divides W \) = 0$. The $\( S \, W \)$ and $\( S \, G \)$ marginals agree, so subtraction gives
  $ J_0 \( W \) - J_1 \( W \) = I_1 \( W \; Y divides G \) - I_0 \( W \; Y divides G \) - I_1 \( S \; G divides W \) . $
  All mutual information terms are finite: those involving the countable message are at most $H \( W \)$, and the last is at most $H \( W \)$ by this same chain rule. Lemma 5 makes the conditional differential entropies finite. Expressing the two $I \( W \; Y divides G \)$ terms as entropy differences, whose $h \( Y divides G \)$ terms agree, proves (5). In particular the conditional row-information term has a negative sign.
  Apply conditional data processing to $s mapsto G s$:
  $ - h_1 \( Y divides G \, W \) - bb(E)_1 log p_(nu_W) \( G \, Y \) & = bb(E)_1 D \( P_1 \( Y in dot.op divides G \, W \) bar.v.double G_(\#) nu_W \)\
 & lt.eq bb(E)_1 D \( P_1 \( S in dot.op divides G \, W \) bar.v.double nu_W \)\
 & = I_1 \( S \; G divides W \) . $
  The integrability assertion of the same lemma justifies these subtractions. Substituting this inequality into (5) proves (5).
  Finally
  $ J_i \( W' \) = J_i \( W \) + I_i \( S \; E divides W \, G \, Y \) . $
  The difference for $W$ therefore equals the difference for $W'$ minus the $i = 0$ term and plus the $i = 1$ term. The former is nonnegative and the latter is at most $H \( E divides W \)$. This proves (6). ◻
]

== 3 A projection moment with shared and fresh rows <sec:r-mixed-moments>

The information bound in Proposition 6 contains a projection density evaluated at the true label. The rows used to select the message can be biased after conditioning on that message. We first bound a high moment under the original Gaussian row law. Some rows are shared across all factors in this moment; the other rows are averaged independently in each factor. The high moment will then pay for the change from Gaussian rows to selected rows.

Expanding a projection moment into independent signal copies is part of the projection method of Sharan, Sidford, and Valiant [9] Section 7, Lemma 12. The estimate below treats exact multirow projections. Its geometric hypothesis has two local mass bounds: one controls distance to a span, and the other controls the small radial scales.

For $x > 0$, write $log^(+) x = max { log x \, 0 }$.

#thm([Theorem 3.1.])[
  (Mixed projection moment and exact density version).  #emph[Let $n = d - 1$, let $m \, r \, q gt.eq 1$ be integers, and put $ell = m + r$. Suppose 
#[#set math.equation(numbering: n => "(7)")
 $ ell < n \, #h(2em) ell - m - \( q - 1 \) gt.eq 1 . $ <eq:r-mixed-dimensions>]

 Let $rho$ be a finite nonnegative Borel measure on $S^(d - 1)$. Suppose that $B \, D > 0$ and, for every $z in bb(R)^d$ and $t > 0$, 
#[#set math.equation(numbering: n => "(8)")
 $ rho \( B \( z \, t \) \) lt.eq B t^ell \, #h(2em) rho \( B \( z \, t \) \) lt.eq D t^n . $ <eq:r-mixed-growth>]

 Let $X tilde.op gamma_m$ and $Z tilde.op gamma_r$ be independent, and set $G = \( X \; Z \)$. For $delta > 0$, define the cube average 
$ p_(rho \, delta) \( g \, y \) = \( 2 delta \)^(- ell) integral upright(bold(1))_({ ∥g u - y∥_oo lt.eq delta }) thin d rho \( u \) . $

 There is an absolute $C$ such that, for every fixed $s in S^(d - 1)$ and every $delta > 0$, 
#[#set math.equation(numbering: n => "(9)")
 $ [bb(E)_X (bb(E)_Z p_(rho \, delta) \( \( X \; Z \) \, \( X \; Z \) s \))^q]^(1 \/ q) lt.eq e^(C d) B #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( D \/ B \) #scale(x: 120%, y: 120%)[\)] . $ <eq:r-mixed-smoothed>]

]
  #emph[If in addition $rho lt.double sigma$, use the jointly Borel density $p_rho$ in (3). There is a measurable set $E_rho subset S^(d - 1)$, with $rho \( E_rho \) = 0$, such that for every $s in.not E_rho$ the cube averages converge to $p_rho \( G \, G s \)$ for $gamma_ell$-almost every $G$, and 
#[#set math.equation(numbering: n => "(10)")
 $ [bb(E)_X (bb(E)_Z p_rho \( \( X \; Z \) \, \( X \; Z \) s \))^q]^(1 \/ q) lt.eq e^(C d) B #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( D \/ B \) #scale(x: 120%, y: 120%)[\)] . $ <eq:r-mixed-exact>]

 When $rho eq.not 0$, $E_rho$ may also be chosen so that $0 < p_rho \( G \, G s \) < oo$ for $gamma_ell$-almost every $G$ and every $s in.not E_rho$.]
] <thm:r-mixed-moment>

#proof[
  We begin with the inverse-distance integral that appears after expanding the moment. Fix $s in S^(d - 1)$ and a linear subspace $V subset bb(R)^d$ of dimension $h lt.eq q - 1$. On a radial shell
  $ R \/ 2 < ∥u - s∥ lt.eq R \, #h(2em) R = 2^(1 - i) \, quad i gt.eq 0 \, $
  consider the points satisfying $"dist" \( u - s \, V \) lt.eq eta R$, where $0 < eta lt.eq 1$. Project them onto the radius-$R$ ball in $s + V$. An $eta R$-net of this ball has at most $\( 3 \/ eta \)^h$ points: a maximal separated set has disjoint $h$-balls of radius $eta R \/ 2$, all lying in the ball of radius $R + eta R \/ 2$. For $h = 0$, take the single point of the zero-dimensional ball. Every point under consideration is within $2 eta R$ of one of the net points. The ambient-center bounds in (8) therefore give
  #[#set math.equation(numbering: n => "(11)")
   $ rho { R \/ 2 < ∥u - s∥ lt.eq R \, med "dist" \( u - s \, V \) lt.eq eta R } lt.eq e^(C d) min { B R^ell eta^(ell - h) \, D R^n eta^(n - h) } . $ <eq:r-mixed-tube>]
  Both powers of $eta$ are positive, so the part of the shell at zero distance from $V$ has zero $rho$-mass. The ball bounds also give $rho \( { s } \) = 0$, by sending their radius to zero.
  On the band $2^(- a - 1) R < "dist" \( u - s \, V \) lt.eq 2^(- a) R$, $a gt.eq 0$, we have
  $ ∥u - s∥^(- r) "dist" \( u - s \, V \)^(- m) lt.eq 2^(r + m) R^(- ell) 2^(a m) . $
  Summing (11) over these bands with either of its two terms gives a geometric series. The relevant exponents satisfy
  $ ell - h - m gt.eq ell - \( q - 1 \) - m gt.eq 1 \, #h(2em) n - h - m gt.eq 1 . $
  Thus the integral on one radial shell is at most
  $ e^(C d) min { B \, D R^(thin n - ell) } . $
  The shells $R = 2^(1 - i)$ cover all nonzero distances on the unit sphere. Put $b = n - ell gt.eq 1$. Their sum obeys
  $ sum_(i gt.eq 0) min { B \, D 2^(b \( 1 - i \)) } lt.eq C B #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( D \/ B \) #scale(x: 120%, y: 120%)[\)] . $
  For example, after the $i = 0$ term, if $D \/ B lt.eq 1$ the terms form a geometric tail of ratio at most $1 \/ 2$. If $D \/ B > 1$, at most $1 + log_2 \( D \/ B \) \/ b$ further terms equal $B$, followed by such a tail. We have proved the uniform estimate
  #[#set math.equation(numbering: n => "(12)")
   $ integral ∥u - s∥^(- r) "dist" \( u - s \, V \)^(- m) thin d rho \( u \) lt.eq e^(C d) B #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( D \/ B \) #scale(x: 120%, y: 120%)[\)] . $ <eq:r-mixed-inverse>]
  We now expand the projection moment. For fixed $u eq.not s$, the $r$ coordinates of $Z \( u - s \)$ are independent centered normals of variance $∥u - s∥^2$. Bounding each cube probability by its volume times the peak density shows that the fresh-row average, after division by $\( 2 delta \)^r$, is at most $\( 2 pi \)^(- r \/ 2) ∥u - s∥^(- r)$. Expand the $q$th power of the remaining integral over $u_1 \, dots.h \, u_q$. Write $v_i = u_i - s$. For one shared row of $X$, the vector of its $q$ evaluations on the $v_i$ is Gaussian with covariance $"Gram" \( v_1 \, dots.h \, v_q \)$. On the set where this matrix is nonsingular, its peak density bounds its cube probability by
  $ \( 2 delta \)^q \( 2 pi \)^(- q \/ 2) det "Gram" \( v_1 \, dots.h \, v_q \)^(- 1 \/ 2) . $
  The singular tuples have zero $rho^(⊗ q)$-mass: successively, (11) gives zero mass to $s + "span" \( v_1 \, dots.h \, v_(i - 1) \)$. Independence of the $m$ shared rows and the $r$ fresh rows cancels all cube volumes and bounds the expanded moment by
  #[#set math.equation(numbering: n => "(13)")
   $ \( 2 pi \)^(- ell q \/ 2) integral product_(i = 1)^q ∥v_i∥^(- r) thin det "Gram" \( v_1 \, dots.h \, v_q \)^(- m \/ 2) thin d rho^(⊗ q) . $ <eq:r-mixed-collision>]
  Gram–Schmidt gives
  $ det "Gram" \( v_1 \, dots.h \, v_q \) = product_(i = 1)^q "dist" #scale(x: 120%, y: 120%)[\(] v_i \, "span" \( v_1 \, dots.h \, v_(i - 1) \) #scale(x: 120%, y: 120%)[\)]^2 \, $
  with the empty span equal to ${ 0 }$. Integrate in the reverse order $u_q \, dots.h \, u_1$. Every inner integral is bounded by (12), uniformly in the previous vectors. This proves (9). All integrands used in the expansion are nonnegative, so Tonelli justifies each interchange.
  Suppose now that $rho lt.double sigma$. For every full-rank $g$, Lemma 5 and Lebesgue differentiation give cube convergence outside a Lebesgue-null subset of label space. Its inverse image is $rho$-null because $g_(\#) rho$ has a density. The same argument shows that the exact density is finite and, when $rho eq.not 0$, positive at $g s$ for $rho$-almost every $s$. Since $gamma_ell$ gives full row rank almost surely, Fubini supplies a single $rho$-null set $E_rho$ with these properties for every $s in.not E_rho$ and almost every independent $G$.
  Fix such an $s$. Fatou in the fresh rows gives
  $ bb(E)_Z p_rho \( \( X \; Z \) \, \( X \; Z \) s \) lt.eq liminf_(j arrow.r oo) bb(E)_Z p_(rho \, 1 \/ j) \( \( X \; Z \) \, \( X \; Z \) s \) $
  for almost every $X$. Raise to the $q$th power and use Fatou again in $X$. The uniform bound (9) then proves (10). This last assertion has the stated $rho$-almost-everywhere qualification. ◻
]

=== 3.1 Changing the actual row law before taking the density limit <subsec:r-actual-row-limit>

The exceptional set in the exact moment theorem is measured using $rho$. A selected message produces a different conditional law of the true signal and the actual rows. The following form uses the uniform cube estimate for every signal, pays for that row selection, and then takes the density limit under the actual label law. The localization application uses this order in its own specialized proof.

#thm([Proposition 3.2.])[
  (Actual-row tilt and exact-label limit).  #emph[Keep the dimensions of Theorem 7. Let $nu lt.eq H sigma$, $H < oo$, be a probability measure. Let $S tilde.op nu$ and $X tilde.op gamma_m$ be independent, let $W$ be countable with $H \( W \) < oo$ and any joint law with $\( S \, X \)$, and let $Z tilde.op gamma_r$ be independent of $\( S \, X \, W \)$. Put $G = \( X \; Z \)$ and $Y = G S$. For every positive-probability $w$, let $rho_w lt.double sigma$ be a finite nonnegative measure satisfying (8) with constants $B_w \, D_w > 0$, and set 
$ C_w = e^(C d) B_w #scale(x: 120%, y: 120%)[\(] 1 + log^(+) \( D_w \/ B_w \) #scale(x: 120%, y: 120%)[\)] \, $

 where $C$ is the constant in the theorem. Assume $bb(E) log \( 1 + C_W \) < oo$.]
  #emph[The actual conditional law of $Y$ given $\( G \, W \)$ has a Lebesgue density. With the versions (3), 
$ p_(rho_W \, 1 \/ j) \( G \, Y \) arrow.r p_(rho_W) \( G \, Y \) quad upright("almost surely under the actual law") . $

 For every $delta > 0$, and also for the exact density, 
#[#set math.equation(numbering: n => "(14)")
 $ bb(E) log #scale(x: 120%, y: 120%)[\(] 1 + p_(rho_W \, delta) \( G \, Y \) #scale(x: 120%, y: 120%)[\)] & lt.eq frac(I \( X \; W divides S \), q) + bb(E) log \( 1 + C_W \) \,\
bb(E) log #scale(x: 120%, y: 120%)[\(] 1 + p_(rho_W) \( G \, Y \) #scale(x: 120%, y: 120%)[\)] & lt.eq frac(I \( X \; W divides S \), q) + bb(E) log \( 1 + C_W \) lt.eq frac(H \( W \), q) + bb(E) log \( 1 + C_W \) . $ <eq:r-actual-smoothed>]

 In particular $log^(+) p_(rho_W) \( G \, Y \)$ is integrable, and the extended expectation of $log p_(rho_W) \( G \, Y \)$, with $log 0 = - oo$, is defined and bounded above by the same right-hand side. For a deterministic countable refinement $W' = \( W \, E \( S \, W \) \)$ of finite entropy, the row charge is unchanged: 
$ I \( X \; W' divides S \) = I \( X \; W divides S \) . $

]
] <prop:r-actual-row-limit>

#proof[
  For almost every $\( s \, w \)$, let $K_(s \, w)$ be the conditional law of $X$. Since $X$ and $S$ are initially independent, the conditional chain rule gives
  #[#set math.equation(numbering: n => "(15)")
   $ bb(E)_(S \, W) D \( K_(S \, W) bar.v.double gamma_m \) = I \( X \; W divides S \) lt.eq H \( W \) < oo . $ <eq:r-conditional-row-kl>]
  Thus $K_(s \, w) lt.double gamma_m$ for almost every $\( s \, w \)$. For fixed $s \, w \, delta$, define
  $ F_(w \, delta) \( s \, x \) = bb(E)_Z p_(rho_w \, delta) \( \( x \; Z \) \, \( x \; Z \) s \) . $
  The every-signal estimate (9) says that $parallel F_(w \, delta) \( s \, dot.op \) parallel_(L^q \( gamma_m \)) lt.eq C_w$, uniformly in $delta$. Conditional on $\( S \, X \, W \)$, $Z$ still has its independent Gaussian law. Jensen in $Z$, followed by (2) with the nonnegative test $q log \( 1 + F_(w \, delta) \)$, gives
  $ bb(E) #h(-0.16667em) [log \( 1 + p_(rho_w \, delta) \( G \, Y \) \) thin mid(bar.v) thin S = s \, W = w] & lt.eq bb(E)_(K_(s \, w)) log \( 1 + F_(w \, delta) \( s \, X \) \)\
 & lt.eq frac(D \( K_(s \, w) bar.v.double gamma_m \), q) + 1 / q log bb(E)_(gamma_m) \( 1 + F_(w \, delta) \( s \, X \) \)^q\
 & lt.eq frac(D \( K_(s \, w) bar.v.double gamma_m \), q) + log \( 1 + C_w \) . $
  The last step is the $L^q$ triangle inequality, valid since $q gt.eq 1$. Average over $\( S \, W \)$ and use (15) to obtain (14).
  It remains to specify the null set for the limit in the actual experiment. The marginal law of $\( G \, S \)$ is $gamma_ell ⊗ nu$. Lemma 5 therefore gives a Lebesgue density for the actual conditional law of $Y$ given $\( G \, W \)$. For each $w$ and every full-rank $g$, Lebesgue differentiation for $g_(\#) rho_w$ says that $p_(rho_w \, 1 \/ j) \( g \, y \) arrow.r p_(rho_w) \( g \, y \)$ outside a Lebesgue-null set of $y$. The actual conditional density gives that set zero probability. Gaussian $G$ has full rank almost surely, and there are only countably many $w$, proving the asserted almost-sure convergence under the actual law.
  The functions $log \( 1 + p_(rho_W \, 1 \/ j) \( G \, Y \) \)$ are nonnegative. Fatou applied now, after the row-law change, passes (14) to (14). Since $log^(+) x lt.eq log \( 1 + x \)$, the positive logarithmic part is integrable; the negative part may have infinite mean, in which case the extended expectation of $log p_(rho_W)$ is $- oo$ and the upper bound remains valid. Applications that subtract this logarithm verify its full integrability separately. Finally, $E$ is determined by $\( S \, W \)$, so $I \( X \; E divides S \, W \) = 0$; the chain rule proves the refinement identity. ◻
]

#prodef([Remark 3.3.])[
  (The parameters used by the localization potential).  The inverse-distance potential in the localization companion [5] Section 12, Lemma 12.5 takes
  $ m = r = q = k = floor.l d \/ 16 floor.r \, #h(2em) ell = p = 2 k \, #h(2em) n = d - 1 . $
  For its bounded-density probability $nu lt.eq H sigma$, it defines $J_nu \( s \) = integral ∥u - s∥^(- p) thin d nu \( u \)$ and $d rho = d nu \/ J_nu$. The application proves locally that
  $ rho \( B \( z \, t \) \) lt.eq 2^p t^p \, #h(2em) rho \( B \( z \, t \) \) lt.eq 2^(p + n) H t^n . $
  Thus the precise constants in Theorem 7 are $B = 2^p$ and $D = 2^(p + n) H$, the angular margin is $p - k - \( k - 1 \) = 1$, and the radial margin is $n - p > 0$. The theorem supplies the uniform cube estimate and its exact-density scope. The localization application imports the positive-scale estimate and proves its reweighting, specialized row-law change, and actual-law Fatou passage locally, together with its potential calculations. Proposition 8 gives a general comparison of the same type within the present paper.
] <rem:r-localization-substitution>

== 4 A critical radius makes the density terms cancel <sec:r-critical-radius>

The two terms in (5) can each be large when the message concentrates the signal on a small region. We will compare them at the same region and scale. A discrete refinement records a radius where the posterior mass is largest relative to the projection dimension, together with its logarithmic mass level. Confinement at that radius lowers the entropy in the independent experiment. The same level raises the aligned projection density by the opposite amount.

Throughout this section $d$ is sufficiently large and

#[#set math.equation(numbering: n => "(16)")
 $ m = k = floor.l d \/ 10 floor.r \, #h(2em) ell = floor.l d \/ 2 floor.r \, #h(2em) r = ell - m \, #h(2em) n = d - 1 . $ <eq:r-critical-parameters>]

The integer $k$ is a moment order. We reserve $q$ in this section for a logarithmic mass level. In particular $ell < n$, $ell - k - m gt.eq 1$, and $n - k - m gt.eq 1$.

#thm([Theorem 4.1.])[
  (Critical-radius comparison).  #emph[In the two experiments of Subsection 2.2, use the dimensions (16). Thus $S tilde.op sigma$, $A tilde.op gamma_m$ is independent of $S$, and $W$ is countable with an arbitrary joint dependence on $\( S \, A \)$. The aligned law retains $\( S \, A \, W \)$ and appends independent $r$-row $C$, whereas the independent law retains $\( S \, W \)$ and draws an independent $ell$-row matrix $G$. If $H \( W \) lt.eq d^2$, then, for an absolute constant $K$, 
#[#set math.equation(numbering: n => "(17)")
 $ I_0 \( S \; W divides G \, G S \) lt.eq I_1 \( S \; W divides G \, G S \) + K d . $ <eq:r-critical-comparison>]

]
] <thm:r-critical-comparison>

#proof[
  For a positive-probability message $w$, write
  $ p_w = bb(P) \( W = w \) \, #h(2em) D_w = p_w^(- 1) \, #h(2em) F_w = P_(S divides W = w) . $
  Then $F_w lt.eq D_w sigma$. The common density lemma and Proposition 6 apply to every finite-entropy refinement used below.
  === Selecting a radius and a mass level <selecting-a-radius-and-a-mass-level>
  Let $R_j = 2^(1 - j)$ for $j gt.eq 0$, and define
  #[#set math.equation(numbering: n => "(18)")
   $ b_w \( s \) = max_(j gt.eq 0) R_j^(- ell) F_w \( B \( s \, R_j \) \) . $ <eq:r-critical-selector>]
  The $j = 0$ term is $2^(- ell)$. On the other hand, Lemma 3 gives
  $ R_j^(- ell) F_w \( B \( s \, R_j \) \) lt.eq 2^n D_w R_j^(thin n - ell) arrow.r 0 . $
  Hence the maximum is attained. Let $j_w \( s \)$ be the least maximizing index, and put $q_w \( s \) = ceil.l log b_w \( s \) ceil.r$. Ball masses are measurable functions of their centers, and a countable comparison selects the least maximizing index, so these choices are measurable.
  The preceding upper bound and $b_w gt.eq 2^(- ell)$ give
  $ 0 lt.eq j_w \( s \) lt.eq C \( d + 1 + log D_w \) . $
  For $R_j lt.eq 1$, the same upper bound is at most $2^n D_w$; for $R_j > 1$, total mass one suffices. Therefore
  $ - C d lt.eq q_w \( s \) lt.eq C \( d + 1 + log D_w \) . $
  Define the discrete refinement
  $ E = \( j_W \( S \) \, q_W \( S \) \) \, #h(2em) W' = \( W \, E \) . $
  For a positive-probability value $w'$, write $F_(w') = P_(S divides W' = w')$. There are at most $C \( d + 1 + log D_w \)^2$ possible pairs conditional on $W = w$. Since $bb(E) log D_W = H \( W \)$, counting those pairs and then using Jensen gives
  #[#set math.equation(numbering: n => "(19)")
   $ H \( E divides W \) lt.eq C log \( d + 1 + H \( W \) \) . $ <eq:r-critical-refinement-entropy>]
  In particular $H \( W' \) = H \( W \) + H \( E divides W \) < oo$. The same deterministic function of $\( S \, W \)$ is used in both experiments, so (6) gives
  #[#set math.equation(numbering: n => "(20)")
   $ J_0 \( W \) - J_1 \( W \) lt.eq J_0 \( W' \) - J_1 \( W' \) + H \( E divides W \) . $ <eq:r-critical-refinement-charge>]
  Fix a positive-probability $w' = \( w \, j \, q \)$ and put
  $ eta = bb(P) \( E = \( j \, q \) divides W = w \) \, #h(2em) F = P_(S divides W' = w') . $
  The measure $F$ is the restriction of $F_w$ to the selected class, divided by $eta$. It satisfies
  #[#set math.equation(numbering: n => "(21)")
   $ F lt.eq D' sigma \, #h(2em) F \( B \( z \, t \) \) lt.eq B' t^ell quad \( z in bb(R)^d \, med t > 0 \) \, #h(2em) D' = D_w / eta \, quad B' = frac(4^ell e^q, eta) gt.eq 1 . $ <eq:r-critical-growth>]
  For the local mass bound, if $t lt.eq 1$ and $B \( z \, t \)$ has positive $F$-mass, choose a selected-class point $s_0$ in that ball. Choose a dyadic radius $R_h lt.eq 2$ satisfying $2 t lt.eq R_h lt.eq 4 t$; its ball about $s_0$ covers $B \( z \, t \)$. Its $F_w$-mass is at most $e^q \( 4 t \)^ell$ by (18). Divide by $eta$. For $t > 1$, use total mass one and $B' gt.eq 1$. The latter bound follows from $e^q gt.eq b_w gt.eq 2^(- ell)$ and $eta lt.eq 1$.
  === The independent projection loses the mass level <the-independent-projection-loses-the-mass-level>
  The selected class can be covered by at most
  #[#set math.equation(numbering: n => "(22)")
   $ N lt.eq e^(1 - q) R_j^(- ell) $ <eq:r-critical-cover>]
  balls of radius $2 R_j$. Indeed, choose successive class points at mutual distances greater than $2 R_j$. Their radius-$R_j$ balls are disjoint. Each such ball has $F_w$-mass at least $e^(q - 1) R_j^ell$, since $j$ maximizes the ratio and $q = ceil.l log b_w ceil.r$. Total mass one bounds the number of points and forces the selection to terminate with the asserted cover. For each of the countably many labels $w'$, fix one such finite cover and assign a point to the first ball containing it. The resulting center label $c$ is measurable and has conditional entropy at most $log N$.
  In the independent experiment, conditional on $W' = w'$, the matrix $G$ is independent of $\( S \, c \)$ and $∥S - c∥ lt.eq 2 R_j$. Consequently
  $ bb(E)_0 \[ ∥G \( S - c \)∥^2 divides W' = w' \] lt.eq 4 ell R_j^2 . $
  Compare the conditional density of $Y - G c$, given $\( G \, c \, w' \)$, with the centered Gaussian density of covariance $4 R_j^2 I_ell$. Nonnegative relative entropy and the displayed second moment give
  $ h_0 \( Y divides G \, c \, W' = w' \) lt.eq ell log R_j + C ell . $
  The conditional densities and their logarithms are integrable by Lemma 5, also after the finite center refinement. Removing $c$ costs at most $log N$. Using (22) cancels the radius and gives
  #[#set math.equation(numbering: n => "(23)")
   $ h_0 \( Y divides G \, W' = w' \) lt.eq - q + C d . $ <eq:r-critical-independent-entropy>]
  === The aligned density gains the same level <the-aligned-density-gains-the-same-level>
  For the same $F$, the exact moment bound needed here is
  #[#set math.equation(numbering: n => "(24)")
   $ bb(E)_A (bb(E)_C p_F \( \( A \; C \) \, \( A \; C \) s \))^k lt.eq \[ C^d B' \( 1 + log D' \) \]^k quad upright("for ") F upright("-almost every ") s . $ <eq:r-critical-moment>]
  To check the exact substitution in Theorem 7, use $m$ shared rows, $r$ fresh rows, moment order $k$, and $ell = m + r$. The angular gap is $ell - m - \( k - 1 \) = ell - m - k + 1 gt.eq 2$, and $ell < n$. The first growth coefficient is $B = B'$. The second is $D = 2^n D'$, by $F lt.eq D' sigma$ and Lemma 3. Since $B' \, D' gt.eq 1$,
  $ e^(C d) B' \[ 1 + log^(+) \( 2^n D' \/ B' \) \] lt.eq C^d B' \( 1 + log D' \) . $
  The exact conclusion of the theorem yields (24).
  In the aligned law, conditioning on $\( S \, W' \)$ can bias the actual rows $A$. Its precise average cost is
  #[#set math.equation(numbering: n => "(25)")
   $ bb(E)_1 D \( P_1 \( A in dot.op divides S \, W' \) bar.v.double gamma_m \) = I_1 \( A \; W' divides S \) = I_1 \( A \; W divides S \) lt.eq H \( W \) . $ <eq:r-critical-row-charge>]
  Here $A$ is initially independent of $S$, and $E$ is determined by $\( S \, W \)$. The finite average divergence also gives absolute continuity of the conditional actual row law for almost every $\( S \, W' \)$.
  For $w'$ fixed, the actual marginal $S divides W' = w'$ is exactly $F$. Hence the $F$-null exceptional set in (24) has zero actual probability. For such an $s$, set
  $ K_F \( A \, s \) = bb(E)_C log p_F \( \( A \; C \) \, \( A \; C \) s \) . $
  The reference and actual logarithmic integrability follow from Lemma 5; null sets in $A$ transfer to its conditional actual law by the preceding absolute continuity. Jensen and (24) imply
  $ bb(E)_A e^(k K_F \( A \, s \)) lt.eq \[ C^d B' \( 1 + log D' \) \]^k . $
  Apply (2) to $k K_F$ under the conditional actual row law relative to $gamma_m$. The rows $C$ remain independent after conditioning on $\( S \, W' \, A \)$. Averaging and using (25) therefore gives
  #[#set math.equation(numbering: n => "(26)")
   $ bb(E)_1 log p_(F_(W')) \( G \, Y \) lt.eq  & frac(H \( W \), k) + C d + bb(E) q + H \( E divides W \) + log \( 1 + H \( W' \) \) . $ <eq:r-critical-aligned-density>]
  Indeed,
  $ log B' = ell log 4 + q + log \( 1 \/ eta \) \, quad bb(E) log \( 1 \/ eta \) = H \( E divides W \) \, quad bb(E) log D' = H \( W' \) \, $
  and Jensen bounds $bb(E) log \( 1 + log D' \)$ by $log \( 1 + H \( W' \) \)$. These expectations are finite by the preceding entropy bounds.
  We now have the two estimates at the same selected radius and mass level. Apply (5) to $W'$, average (23), and use (26). The terms $- bb(E) q$ and $+ bb(E) q$ cancel. Including the refinement charge (20) yields the more precise inequality
  #[#set math.equation(numbering: n => "(27)")
   $ J_0 \( W \) - J_1 \( W \) lt.eq frac(H \( W \), k) + C d + 2 H \( E divides W \) + log \( 1 + H \( W' \) \) . $ <eq:r-critical-quantitative-gap>]
  Now $k = floor.l d \/ 10 floor.r$, $H \( W \) lt.eq d^2$, and (19) make the right-hand side at most $K d$ for an absolute $K$. This proves (17). ◻
]

== 5 Posterior density levels and auxiliary projections <rlevels:section>

A state can be informative because its posterior concentrates on a small part of the sphere. The two comparisons in this section measure that concentration at dyadic radii. In each comparison, a state is tested after independent Gaussian observations have been supplied to the analysis. Replacing some of those rows by the current block makes the state update a conditional Markov channel. The task is to bound the information cost of returning from the current rows to independent ones.

The two arguments use different refinements. The first retains only the level of the largest normalized ball mass and uses a net to estimate the independent projection entropy. The second retains both the first maximizing radius and the density level; its covering estimate cancels the radius directly. These choices lead to different row counts and to complementary exact-density estimates.

We use the measure, Gaussian law $gamma_t$, and entropy conventions of Section 2. Locally, write $N = d - 1$ for the sphere dimension; this avoids confusing it with the actual-row count $n$ in the second comparison. The row symbols have the following roles, with their numerical values specified in each subsection:

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (left, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Comparison
], table.cell(rowspan: 1, colspan: 1)[Total rows
], table.cell(rowspan: 1, colspan: 1)[Actual rows
], table.cell(rowspan: 1, colspan: 1)[Fresh rows
], table.cell(rowspan: 1, colspan: 1)[Moment
]),
  table.cell(rowspan: 1, colspan: 1)[One level
], table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[$j = m - k$
], table.cell(rowspan: 1, colspan: 1)[$q$
],
  table.cell(rowspan: 1, colspan: 1)[Two labels
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[$l = k - n$
], table.cell(rowspan: 1, colspan: 1)[$q$
],
)
]

Constants $C \, C_0$ are positive and absolute and may increase. All claims are for sufficiently large $d$, with an absolute threshold unless otherwise stated.

We use the local spherical-ball and projection-density results, Lemmas 3 and 5. In particular, for every $z in bb(R)^d$ and $rho > 0$,

#[#set math.equation(numbering: n => "(28)")
 $ sigma \( B \( z \, rho \) \) lt.eq \( 2 rho \)^N . $ <rlevels:ambient-cap>]

For $nu lt.eq K sigma$ and a full-row-rank matrix $g$ with fewer than $N$ rows, write $p_nu \( g \, dot.op \)$ for the jointly measurable cube-average version of the density of $g S$, $S tilde.op nu$. For independent Gaussian $G$ and $S tilde.op nu$, the logarithm $log p_nu \( G \, G S \)$ is integrable. The same lemma supplies the actual conditional image densities and the integrable log ratios used below when a finite state is correlated with the rows. These density statements concern the exact observations.

We use (2) with $f = q log F$ in the form

#[#set math.equation(numbering: n => "(29)")
 $ bb(E)_P log F lt.eq frac(D \( P bar.v.double Q \) + log bb(E)_Q F^q, q) \, #h(2em) P lt.double Q \, quad q > 0 \, quad F gt.eq 0 . $ <rlevels:tilt>]

Truncation gives the integrable form and the upper bound when the left side is negative infinite.

=== 5.1 A comparison using one density level <rlevels:one-level>

Set, locally in this subsection,

#[#set math.equation(numbering: n => "(30)")
 $ m = floor.l d \/ 4 floor.r \, #h(2em) k = floor.l d \/ 32 floor.r \, #h(2em) j = m - k \, #h(2em) q = floor.l d \/ 16 floor.r . $ <rlevels:one-parameters>]

The auxiliary projection has $m$ rows, of which $k$ can be actual rows and $j$ remain independent. The integer $q$ is the moment order. For large $d$,

$ m < N \, #h(2em) m - k - \( q - 1 \) gt.eq 1 . $

For a probability measure $nu lt.eq K sigma$, $K < oo$, put $r_i = 2^(1 - i)$, $i gt.eq 0$, and define

#[#set math.equation(numbering: n => "(31)")
 $ L_nu \( s \) = max_(i gt.eq 0) r_i^(- m) nu \( B \( s \, r_i \) \) . $ <rlevels:one-maximal>]

The $i = 0$ term is $2^(- m)$. On the other hand,

$ r_i^(- m) nu \( B \( s \, r_i \) \) lt.eq K 2^N r_i^(N - m) \, $

which tends to zero uniformly in $s$. Hence the maximum is attained among at most $C \( 1 + d + log K \)$ initial scales, and

$ 2^(- m) lt.eq L_nu \( s \) lt.eq K e^(C d) . $

The ball-mass functions are Borel, by integration of the Borel indicator $upright(bold(1))_({ parallel s - u parallel lt.eq r_i })$. Thus $L_nu$ and the first maximizing scale are Borel. For $a = 2^b$, $b in bb(Z)$, let

$ F_a = { s : a lt.eq L_nu \( s \) < 2 a } \, #h(2em) w_a = nu \( F_a \) . $

Only $C \( 1 + d + log K \)$ levels can be nonempty, and a nonempty level has $a gt.eq 2^(- m)$.

#thm([Lemma 5.1.])[
  (Independent projection entropy from a net).  #emph[If $G tilde.op gamma_m$ and $S tilde.op nu lt.eq K sigma$ are independent, then 
#[#set math.equation(numbering: n => "(32)")
 $ bb(E) log p_nu \( G \, G S \) gt.eq bb(E) log L_nu \( S \) - C d - log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C \( 1 + d + log K \) #scale(x: 120%, y: 120%)[\)] . $ <rlevels:one-net-bound>]

]
] <rlevels:one-net>

#proof[
  At each relevant scale $i$, take a maximal $r_i$-separated set of centers on the sphere, and assign each point to a nearest center, breaking ties in a fixed order. Denote the cells and centers by $C_(i h)$ and $c_(i h)$. Each cell is contained in $B \( c_(i h) \, r_i \)$. At most $7^d$ centers lie within $3 r_i$ of a fixed center: the ambient balls of radius $r_i \/ 2$ about those centers have disjoint interiors and lie in a ball of radius $7 r_i \/ 2$.
  Let $b_(i h)$ be the sum of the $nu$-masses of cells with centers within $3 r_i$ of $c_(i h)$. For $s in C_(i h)$, $nu \( B \( s \, r_i \) \) lt.eq b_(i h)$, and $sum_h b_(i h) lt.eq 7^d$. Partition the sphere by its first maximizing scale $i \( s \)$ and its cell at that scale. Write $w_(i h)$ for the masses of these classes, omitting zero-mass classes. If $N_0 lt.eq C \( 1 + d + log K \)$ is the number of relevant scales, Jensen gives
  #[#set math.equation(numbering: n => "(33)")
   $ bb(E) log frac(nu \( B \( S \, r_(i \( S \)) \) \), w_(i \( S \) \, h \( S \))) lt.eq log sum_(i \, h : w_(i h) > 0) b_(i h) lt.eq d log 7 + log N_0 . $ <rlevels:one-net-weight>]
  In a class $\( i \, h \)$, let $nu_(i h)$ be the conditional law of $S$. Its points are within $r_i$ of $c_(i h)$. Comparing the density of $G S$ with the Gaussian density of mean $G c_(i h)$ and covariance $r_i^2 I_m$, nonnegative relative entropy yields
  $ bb(E)_(G \, S tilde.op nu_(i h)) log p_(nu_(i h)) \( G \, G S \) gt.eq m log \( 1 \/ r_i \) - C m \, $
  because independence gives $bb(E) parallel G \( S - c_(i h) \) parallel^2 lt.eq m r_i^2$. Also $p_nu gt.eq w_(i h) p_(nu_(i h))$ almost everywhere. Average its logarithm under each class. The identity $L_nu \( S \) = r_(i \( S \))^(- m) nu \( B \( S \, r_(i \( S \)) \) \)$ then gives
  $ bb(E) log p_nu \( G \, G S \) gt.eq bb(E) log L_nu \( S \) - bb(E) log frac(nu \( B \( S \, r_(i \( S \)) \) \), w_(i \( S \) \, h \( S \))) - C m . $
  Apply (33). The refinement is finite, and every class is dominated by a finite multiple of $sigma$; Lemma 5 justifies all logarithmic expectations. ◻
]

The next bound uses the same density level to control the projection when the $k$ rows will later be allowed to depend on the state. The order of averaging is essential: the $j$ independent rows are averaged before taking a $q$-th moment in the other rows.

#thm([Lemma 5.2.])[
  (A moment on one level).  #emph[Let $w_a > 0$ and $mu = nu \( thin dot.op thin divides F_a \)$. For independent $X tilde.op gamma_k$, $B tilde.op gamma_j$, and $G = \( X \; B \)$, 
#[#set math.equation(numbering: n => "(34)")
 $ [bb(E)_X #scale(x: 120%, y: 120%)[\(] bb(E)_B p_mu \( G \, G s \) #scale(x: 120%, y: 120%)[\)]^q]^(1 \/ q) lt.eq e^(C d) a / w_a \( 1 + d + log K \) $ <rlevels:one-moment-bound>]

 for $mu$-almost every $s$.]
] <rlevels:one-moment>

#proof[
  For every ambient ball and $t > 0$,
  #[#set math.equation(numbering: n => "(35)")
   $ mu \( B \( z \, t \) \) lt.eq C_0^d a / w_a t^m \, #h(2em) mu \( B \( z \, t \) \) lt.eq C_0^d K / w_a t^N $ <rlevels:one-two-powers>]
  with one absolute $C_0$. For the first estimate, if the ball has positive $mu$-mass, choose $s_0 in F_a ∩ B \( z \, t \)$. For $t lt.eq 1$, a dyadic radius between $2 t$ and $4 t$ contains $B \( z \, t \) ∩ F_a$, and its $nu$-mass is at most $2 a \( 4 t \)^m$. For $t > 1$, use total mass one and $a gt.eq 2^(- m)$. The second estimate follows from $mu lt.eq \( K \/ w_a \) sigma$ and (28).
  Apply the shared/fresh moment theorem, Theorem 7, with $k$ shared rows, $j$ fresh rows, total row count $m$, moment order $q$, and
  $ B_0 = C_0^d a \/ w_a \, #h(2em) D_0 = C_0^d K \/ w_a . $
  Its angular gap is $m - k - \( q - 1 \) gt.eq 1$, and its radial gap is $N - m > 0$. The inverse factor in its one-point integration is exactly
  $ parallel u - s parallel^(- j) "dist" \( u - s \, V \)^(- k) \, #h(2em) dim V lt.eq q - 1 . $
  The ratio $D_0 \/ B_0 = K \/ a$ does not contain $w_a$, and $log^(+) \( K \/ a \) lt.eq log K + m log 2$. The theorem therefore gives the right side of (34) uniformly in the cube-average scale, for every fixed $s$.
  For completeness, the passage to the exact density has the almost-everywhere scope asserted here. At $G s$ the cube averages converge for almost every $\( G \, s \)$ under $gamma_m ⊗ mu$: condition on $G$, use absolute continuity of its image law and Lebesgue differentiation, and then apply Fubini. For $mu$-almost every fixed $s$, Fatou first in $B$ and then in $X$ after taking the $q$-th power gives (34). This passage estimates the exact label; it does not change the learner’s observation. The expansion into independent points underlying the moment theorem is related to the projection-moment method of Sharan, Sidford, and Valiant [9] Section 7, Lemma 12; the multirow estimate used here is the local theorem with the displayed parameters. ◻
]

We now specify both experiments. For a finite variable $V$ jointly distributed with $S tilde.op sigma$, define

$ cal(D) \( V \) = I_(upright("ind")) \( S \; V divides G \, G S \) \, #h(2em) G tilde.op gamma_m upright(" independent of ") \( S \, V \) . $

In the actual experiment, $X tilde.op gamma_k$ is independent of $S tilde.op sigma$, $U$ is any finite variable jointly distributed with $\( S \, X \)$, and $B tilde.op gamma_j$ is independent of $\( S \, X \, U \)$. Put $G = \( X \; B \)$ and

$ tilde(cal(D)) \( U \) = I_(upright("act")) \( S \; U divides G \, G S \) . $

The same definition applies to a finite refinement $V$ determined by $\( S \, U \)$. Thus $G$ and $S$ are marginally independent in both experiments, but $G$ can depend on $U$ in the actual one. The independent experiment uses the same $\( S \, U \)$ marginal as the actual one.

#thm([Proposition 5.3.])[
  (One-level auxiliary-row comparison).  #emph[For the preceding experiments and parameters, 
#[#set math.equation(numbering: n => "(36)")
 $ cal(D) \( U \) lt.eq tilde(cal(D)) \( U \) + C (d + log \( 1 + d + H \( U \) \) + frac(H \( U \), d)) . $ <rlevels:one-comparison-bound>]

 The proposition applies to every finite $U$ with the specified joint law.]
] <rlevels:one-comparison>

#proof[
  First take $V = U$, or a finite refinement of $U$ determined by $\( S \, U \)$. Let $P$ be the actual law and $Q$ the law with the same $\( S \, V \)$ marginal and an independent $G tilde.op gamma_m$. Their $\( G \, S \)$ marginals also agree. Write $nu_v = P_(S divides V = v) = Q_(S divides V = v)$. Proposition 6 gives the exact identity
  #[#set math.equation(numbering: n => "(37)")
   $ cal(D) \( V \) - tilde(cal(D)) \( V \) = I_P \( V \; G S divides G \) - I_Q \( V \; G S divides G \) - I_P \( S \; G divides V \) . $ <rlevels:one-information-identity>]
  Its density bound specializes to
  #[#set math.equation(numbering: n => "(38)")
   $ cal(D) \( V \) - tilde(cal(D)) \( V \) lt.eq bb(E)_P log p_(nu_V) \( G \, G S \) - bb(E)_Q log p_(nu_V) \( G \, G S \) . $ <rlevels:one-density-comparison>]
  The negative term in (37) is what pays for the changed conditional image density. All quantities are finite by Lemma 5 and $I_P \( S \; G divides V \) lt.eq H \( V \)$.
  For $u$ of positive probability let $K_u = P \( U = u \)^(- 1)$, so $nu_u lt.eq K_u sigma$. Let $J$ be the integer with $S in F_(2^J)$ for the levels of $L_(nu_U)$, and put $V = \( U \, J \)$. The level count and Jensen give
  #[#set math.equation(numbering: n => "(39)")
   $ H \( J divides U \) lt.eq bb(E) log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C \( 1 + d + log K_U \) #scale(x: 120%, y: 120%)[\)] lt.eq log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C \( 1 + d + H \( U \) \) #scale(x: 120%, y: 120%)[\)] . $ <rlevels:one-label-entropy>]
  Under $Q$, refinement increases the mean log projection density by $I_Q \( J \; G S divides G \, U \) gt.eq 0$. Applying Lemma 11 to each $nu_u$ therefore yields
  #[#set math.equation(numbering: n => "(40)")
   $ bb(E)_Q log p_(nu_V) \( G \, G S \) gt.eq bb(E) log L_(nu_U) \( S \) - C d - log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C \( 1 + d + H \( U \) \) #scale(x: 120%, y: 120%)[\)] . $ <rlevels:one-independent-lower>]
  For the actual upper bound, condition on $S = s \, V = v = \( u \, b \)$ and write $a = 2^b$. Conditional on $\( s \, v \, X \)$, $B$ is still independent with law $gamma_j$. Jensen in $B$ bounds the conditional mean of $log p_(nu_v) \( G \, G s \)$ by the mean, under $P_(X divides s \, v)$, of $log bb(E)_B p_(nu_v) \( \( X \; B \) \, \( X \; B \) s \)$. Apply (29) with reference $gamma_k$, order $q$, and Lemma 12. The conditional divergences average to
  #[#set math.equation(numbering: n => "(41)")
   $ bb(E) D \( P_(X divides S \, V) bar.v.double gamma_k \) = I_P \( X \; V divides S \) = I_P \( X \; U divides S \) lt.eq H \( U \) . $ <rlevels:one-row-kl>]
  The first equality uses marginal independence of $X \, S$; the second uses that $J$ is determined by $\( S \, U \)$. Thus the refinement creates no additional conditional row information. Finite average divergence also gives $P_(X divides S \, V) lt.double gamma_k$ almost everywhere. The exact moment is needed only for $nu_v$-almost every $s$, which is precisely the conditional signal law at $V = v$.
  If $w_a = nu_u \( F_a \)$, the logarithm of the moment bound is
  $ C d + log a + log \( 1 \/ w_a \) + log \( 1 + d + log K_u \) . $
  Averaging, using $bb(E) log \( 1 \/ w_a \) = H \( J divides U \)$, and applying Jensen once more, we obtain
  #[#set math.equation(numbering: n => "(42)")
   $ bb(E)_P log p_(nu_V) \( G \, G S \) lt.eq C d + bb(E) log a + H \( J divides U \) + log \( 1 + d + H \( U \) \) + frac(H \( U \), q) . $ <rlevels:one-actual-upper>]
  The log expectations and the truncated use of (29) are justified by the integrability already established.
  Finally, $log a lt.eq log L_(nu_U) \( S \)$, so the local-density terms in (40) and (42) cancel. Refinement gives
  $ cal(D) \( U \) lt.eq cal(D) \( V \) \, #h(2em) tilde(cal(D)) \( V \) lt.eq tilde(cal(D)) \( U \) + H \( J divides U \) . $
  Combine these inequalities with (38) and (39). Since $q$ is a fixed positive fraction of $d$ for large $d$, the result is (36). ◻
]

=== 5.2 A comparison retaining the radius and the level <rlevels:two-level>

We now use more auxiliary rows and retain the first maximizing radius as a second label. This lets a covering argument estimate the independent entropy without the net-weight average above. In this subsection the local parameters are

#[#set math.equation(numbering: n => "(43)")
 $ k = floor.l d \/ 2 floor.r \, #h(2em) n = floor.l d \/ 8 floor.r \, #h(2em) l = k - n \, #h(2em) q = n . $ <rlevels:two-parameters>]

Here $n$ is the number of actual rows; the surface exponent remains $N = d - 1$. In particular

$ N - k gt.eq d \/ 3 \, #h(2em) k - q - n gt.eq 1 \, #h(2em) N - q - n gt.eq 1 $

for large $d$.

For a finite variable $V$ with $S tilde.op sigma$, let

$ cal(J) \( V \) = I_(upright("ind")) \( S \; V divides G \, G S \) \, #h(2em) G tilde.op gamma_k upright(" independent of ") \( S \, V \) . $

In the actual experiment $A tilde.op gamma_n$ is independent of $S tilde.op sigma$, $V$ has any joint law with $\( S \, A \)$, and $B tilde.op gamma_l$ is independent of $\( S \, A \, V \)$. Put $D = \( A \; B \)$. Thus $D$ is marginally independent of $S$ with law $gamma_k$, although its conditional law given $\( S \, V \)$ need not be Gaussian. The independent experiment defining $cal(J) \( V \)$ preserves the actual $\( S \, V \)$ marginal.

#thm([Proposition 5.4.])[
  (Two-label auxiliary-row comparison).  #emph[If $V$ is finite and $H \( V \) lt.eq d^2$ in the preceding actual experiment, then 
#[#set math.equation(numbering: n => "(44)")
 $ cal(J) \( V \) lt.eq I_(upright("act")) \( S \; V divides D \, D S \) + C d . $ <rlevels:two-comparison-bound>]

]
] <rlevels:two-comparison>

#proof[
  Let $P$ denote the actual law. We first construct the refinement and obtain the two geometric estimates it supplies. For $pi_v = P \( V = v \) > 0$, write $nu_v = P_(S divides V = v) lt.eq pi_v^(- 1) sigma$, and define
  $ lambda_v \( s \) = max_(i gt.eq 0) r_i^(- k) nu_v \( B \( s \, r_i \) \) \, #h(2em) r_i = 2^(1 - i) . $
  Let $j$ be the first maximizing index and let $b = floor.l log_2 lambda_v \( s \) floor.r$. The maximum is attained: its $i = 0$ term is $2^(- k)$, while $pi_v^(- 1) 2^N r_i^(N - k)$ bounds the $i$-th term and tends to zero. The ball-mass functions are Borel, so both labels are measurable. The same bounds give
  $ b gt.eq - k \, #h(2em) 2^b lt.eq pi_v^(- 1) C^d \, #h(2em) 2^(- k) lt.eq pi_v^(- 1) C^d r_j^(N - k) . $
  Because $N - k gt.eq d \/ 3$, the last inequality implies $j lt.eq C \( 1 + log \( 1 \/ pi_v \) \/ d \)$. At fixed $v$, the number of pairs $\( j \, b \)$ is at most $C \( d + 1 + log \( 1 \/ pi_v \) \)^2$. For $W = \( V \, j \, b \)$ evaluated at $s = S$, this proves finiteness and
  #[#set math.equation(numbering: n => "(45)")
   $ H \( W divides V \) lt.eq C + 2 log \( d + 1 + H \( V \) \) . $ <rlevels:two-label-entropy>]
  For $w = \( v \, j \, b \)$ with $pi_w = P \( W = w \) > 0$, set $R = r_j$. Let $E_w$ be the corresponding subset of the sphere, and write
  $ nu_w = P_(S divides W = w) = alpha_w thin nu_v \|_(E_w) \, #h(2em) alpha_w = pi_v / pi_w . $
  Every $s_0 in E_w$ satisfies
  $ nu_v \( B \( s_0 \, R \) \) gt.eq 2^b R^k \, #h(2em) nu_v \( B \( s_0 \, r_i \) \) lt.eq 2^(b + 1) r_i^k quad \( i gt.eq 0 \) . $
  Choose centers in $E_w$ successively at distances greater than $2 R$ from those already chosen, until their $2 R$-balls cover $E_w$. Their $R$-balls are disjoint and each has $nu_v$-mass at least $2^b R^k$; hence the process stops with at most $\( 2^b R^k \)^(- 1)$ centers. Assign each point to one of its covering balls. Under the independent matrix $G$, conditioning also on this finite index adds at most $- b log 2 - k log R$ to the entropy. Within a ball, comparison with a Gaussian of covariance $\( 2 R \)^2 I_k$ adds at most $k log R + C k$, since $bb(E) parallel G \( S - z \) parallel^2 lt.eq 4 k R^2$ for its center $z$. Consequently
  #[#set math.equation(numbering: n => "(46)")
   $ h_(upright("ind")) \( G S divides G \, W = w \) lt.eq - b log 2 + C k . $ <rlevels:two-independent-entropy>]
  The entropies are finite by Lemma 5.
  The same labels give, for all $z in bb(R)^d$ and $rho > 0$,
  #[#set math.equation(numbering: n => "(47)")
   $ nu_w \( B \( z \, rho \) \) lt.eq C_0^d min { U_w rho^k \, med Gamma_w rho^N } \, #h(2em) U_w = alpha_w 2^b \, quad Gamma_w = pi_w^(- 1) . $ <rlevels:two-two-powers>]
  For the first bound, choose a point of $E_w$ in the ball when there is one, double the radius, and use a dyadic radius in $\[ 2 rho \, 4 rho \]$ if $rho lt.eq 1$. The upper ball bound at that point and restriction by $alpha_w$ prove the assertion. For larger $rho$, use total mass one and $U_w gt.eq 2^(- k)$. The second bound follows from $nu_w lt.eq Gamma_w sigma$ and (28). Notice that $alpha_w gt.eq 1$, $Gamma_w gt.eq 1$, and $U_w gt.eq 2^(- k)$.
  We next express the information difference in terms of exact projection densities. Let $Q$ denote the independent law preserving $\( S \, W \)$. Their $\( D \, S \)$ and $\( G \, S \)$ marginals agree after identifying the matrices. Hence $h_Q \( G S divides G \) = h_P \( D S divides D \)$. Proposition 6 gives
  #[#set math.equation(numbering: n => "(48)")
   $ cal(J) \( W \) - I_P \( S \; W divides D \, D S \) = h_Q \( G S divides G \, W \) - h_P \( D S divides D \, W \) - I_P \( S \; A divides W \) . $ <rlevels:two-information-identity>]
  Here independence of $B$ from $\( S \, A \, W \)$ reduces $I_P \( S \; D divides W \)$ to $I_P \( S \; A divides W \)$. Lemma 5 makes the baseline and conditional entropies finite; it also gives the actual conditional image density. Thus (48) is an identity of finite quantities, with the displayed negative sign.
  For a matrix $D$, let $p_(w \, D)$ be a density of the image of $nu_w$ under $s mapsto D s$. This denominator uses $nu_w = P_(S divides W = w)$ before conditioning on the actual rows. Contraction of
  $ bb(E) D \( P_(S divides A \, W) bar.v.double nu_W \) = I_P \( S \; A divides W \) $
  under $s mapsto D s$, with $B$ still independent, gives
  #[#set math.equation(numbering: n => "(49)")
   $ - h_P \( D S divides D \, W \) - I_P \( S \; A divides W \) lt.eq bb(E)_P log p_(W \, D) \( D S \) . $ <rlevels:two-cross-entropy>]
  The numerator after contraction is the true conditional image density given $\( D \, W \)$. Its log ratio to $p_(W \, D)$ is integrable: the relative entropy is finite, and the negative part of a log likelihood ratio has expectation at most $1 \/ e$. Subtracting this ratio from the integrable actual log density also proves integrability of the right side.
  Here we choose a density version that retains a bound at every fixed target $s$. For each positive integer $a$, let $phi_delta^a$ be the centered Gaussian density of covariance $delta^2 I_a$, and fix a sequence $delta_t arrow.b 0$. For any probability measure $nu lt.eq K sigma$, define
  $ F_delta^nu \( g \, s \) = integral phi_delta^k \( g \( u - s \) \) thin nu \( d u \) \, #h(2em) p_nu^flat \( g \, y \) = liminf_(t arrow.r oo) integral phi_(delta_t)^k \( g u - y \) thin nu \( d u \) . $
  These functions are measurable. For each full-rank $g$, the Gaussian approximate identity converges to the image density at its Lebesgue points, so $p_nu^flat \( g \, dot.op \)$ is a density version. It may be defined by a liminf on the exceptional set; this choice is useful at a fixed target. It is valid in (49), since the actual conditional image law is absolutely continuous.
  There is a quantitative first-density passage under the independent law, before taking logarithms. For independent $G tilde.op gamma_k$ and $S tilde.op nu$, Gaussian integration and Tonelli give
  #[#set math.equation(numbering: n => "(50)")
   $ bb(E)_(G \, S) F_delta^nu \( G \, S \) & = \( 2 pi \)^(- k \/ 2) integral.double \( parallel u - s parallel^2 + delta^2 \)^(- k \/ 2) thin nu \( d u \) nu \( d s \)\
 & lt.eq \( 2 pi \)^(- k \/ 2) integral.double parallel u - s parallel^(- k) thin nu \( d u \) nu \( d s \) < oo . $ <rlevels:two-first-density>]
  The last integral is finite uniformly in $s$: the diagonal has zero mass, and the centered cap bound on dyadic shells gives
  $ sup_(s in S^(d - 1)) integral parallel u - s parallel^(- k) thin nu \( d u \) lt.eq 1 + K 2^k sum_(i gt.eq 0) 2^(- i \( N - k \)) < oo . $
  At $G S$ the approximate identity converges almost surely under the independent law, by absolute continuity of the image, Lebesgue differentiation, and Fubini. Fatou in (50) therefore gives
  $ bb(E)_(G \, S) p_nu^flat \( G \, G S \) lt.eq \( 2 pi \)^(- k \/ 2) integral.double parallel u - s parallel^(- k) thin nu \( d u \) nu \( d s \) < oo . $
  This proves the positive logarithmic part directly. For the negative part compare with the standard Gaussian density $phi.alt$ on $bb(R)^k$: $t \( log t \)_(-) lt.eq 1 \/ e$ bounds the negative part of $log \( p_nu^flat \/ phi.alt \)$, and $bb(E) parallel G S parallel^2 = k$ bounds the cross entropy with $phi.alt$. This recovers independent log integrability for this density version. Actual log integrability is supplied by the contraction preceding (49). In what follows take $p_(w \, D) = p_(nu_w)^flat \( D \, dot.op \)$. The mollifiers here only specify and estimate densities at exact labels.
  It remains to bound those densities under independent rows before changing the law of $A$. We claim that for every fixed $w$ of positive probability and every $s in S^(d - 1)$,
  #[#set math.equation(numbering: n => "(51)")
   $ [bb(E)_A #scale(x: 120%, y: 120%)[\(] bb(E)_B p_(nu_w)^flat \( \( A \; B \) \, \( A \; B \) s \) #scale(x: 120%, y: 120%)[\)]^q]^(1 \/ q) lt.eq e^(C d) U_w \( 1 + log Gamma_w \) \, $ <rlevels:two-moment>]
  where $A tilde.op gamma_n$ and $B tilde.op gamma_l$ are independent in this displayed expectation. We prove the uniform-in-$delta$ version first, with
  $ F_delta \( A \, B \, s \) = integral phi_delta^k \( \( A \; B \) \( u - s \) \) thin nu_w \( d u \) . $
  For $h = u - s$,
  $ bb(E)_B phi_delta^l \( B h \) = \( 2 pi \)^(- l \/ 2) \( parallel h parallel^2 + delta^2 \)^(- l \/ 2) . $
  Expanding the $q$-th power introduces $u_1 \, dots.h \, u_q$ and $h_i = u_i - s$. For their Gram matrix $K = \( chevron.l h_i \, h_j chevron.r \)_(i \, j)$, Gaussian integration in the $n$ shared rows gives exactly
  $ bb(E)_A product_(i = 1)^q phi_delta^n \( A h_i \) = \( 2 pi \)^(- n q \/ 2) det \( K + delta^2 I_q \)^(- n \/ 2) . $
  Using $det \( K + delta^2 I_q \) gt.eq det K$ and Gram–Schmidt, we conclude
  #[#set math.equation(numbering: n => "(52)")
   $ bb(E)_A #scale(x: 120%, y: 120%)[\(] bb(E)_B F_delta \( A \, B \, s \) #scale(x: 120%, y: 120%)[\)]^q lt.eq \( 2 pi \)^(- k q \/ 2) integral product_(i = 1)^q parallel u_i - s parallel^(- l) "dist" \( u_i - s \, L_(i - 1) \)^(- n) thin nu_w^(⊗ q) \( d upright(bold(u)) \) \, $ <rlevels:two-gram>]
  where $L_(i - 1)$ is the span of $u_1 - s \, dots.h \, u_(i - 1) - s$, starting with ${ 0 }$. An infinite upper bound is allowed at singular Gram matrices. All integrations so far are nonnegative.
  We bound the corresponding one-point integral uniformly over $s$ and every linear subspace $L$ of dimension at most $q$. On a radial shell $R \/ 2 < parallel u - s parallel lt.eq R$, $R = 2^(1 - i)$, the part at distance at most $2^(- a) R$ from $L$ is covered by at most $\( 3 dot.op 2^a \)^q$ balls of radius $2^(1 - a) R$. This follows by covering the radius-$R$ projection ball in $L$ with a $2^(- a) R$-net. By (47) its $nu_w$-mass is at most
  $ C^d min { U_w 2^(- a \( k - q \)) R^k \, thin Gamma_w 2^(- a \( N - q \)) R^N } . $
  In particular the set at distance zero has zero mass. On the band $2^(- a - 1) R < "dist" \( u - s \, L \) lt.eq 2^(- a) R$, the integrand $parallel u - s parallel^(- l) "dist" \( u - s \, L \)^(- n)$ is at most $2^k 2^(a n) R^(- k)$. Sum the transverse bands first. The positive gaps $k - q - n$ and $N - q - n$ make both sums geometric, so the integral on the radial shell is at most
  $ C^d min { U_w \, Gamma_w R^(N - k) } . $
  For the radial sum put $a_0 = N - k gt.eq d \/ 3$. The sum of $min { 1 \, \( Gamma_w \/ U_w \) 2^(a_0 \( 1 - i \)) }$ has at most $2 + \( log_2 \( Gamma_w \/ U_w \) \)_(+) \/ a_0$ saturated terms followed by a geometric tail. Since $U_w gt.eq 2^(- k)$ and $Gamma_w gt.eq 1$, this proves
  #[#set math.equation(numbering: n => "(53)")
   $ integral parallel u - s parallel^(- l) "dist" \( u - s \, L \)^(- n) thin nu_w \( d u \) lt.eq e^(C d) U_w \( 1 + log Gamma_w \) . $ <rlevels:two-inverse>]
  Integrate (52) from its last point to its first, applying (53) each time. This proves the claimed bound uniformly in $delta$.
  The liminf version now gives the exact fixed-target conclusion: for every fixed $s$,
  $ bb(E)_B p_(nu_w)^flat \( \( A \; B \) \, \( A \; B \) s \) lt.eq liminf_(t arrow.r oo) bb(E)_B F_(delta_t) \( A \, B \, s \) $
  by Fatou in $B$. Raise to the $q$-th power and apply Fatou in $A$. The uniform moment bound proves (51), including at targets where a density version specified only almost everywhere would not have sufficed. This is the distinct fixed-target passage used in this comparison.
  We finally pay for dependence of the actual rows. Their conditional relative entropies satisfy
  #[#set math.equation(numbering: n => "(54)")
   $ bb(E) D \( P_(A divides S \, W) bar.v.double gamma_n \) = I_P \( A \; W divides S \) = I_P \( A \; V divides S \) lt.eq H \( V \) . $ <rlevels:two-row-kl>]
  Here $A \, S$ are marginally independent, and $W$ adds only a function of $\( S \, V \)$. Given $\( S \, W \, A \)$, $B$ is still independent. Jensen in $B$, followed by (29) for the true $P_(A divides S \, W)$ relative to $gamma_n$, uses (51) to give
  #[#set math.equation(numbering: n => "(55)")
   $ bb(E)_P log p_(nu_W)^flat \( D \, D S \) lt.eq frac(H \( V \), q) + C d + bb(E) #scale(x: 120%, y: 120%)[\[] log alpha_W + b log 2 + log \( 1 + log Gamma_W \) #scale(x: 120%, y: 120%)[\]] . $ <rlevels:two-actual-upper>]
  Finite average divergence ensures the required absolute continuity. Truncation permits the conditional inequality wherever a log expectation is negative infinite; the integrated cross entropy is finite by (49).
  The $b log 2$ term cancels (46) when substituted with (55) into (48)–(49). Moreover
  $ bb(E) log alpha_W = H \( W divides V \) \, #h(2em) bb(E) log \( 1 + log Gamma_W \) lt.eq log \( 1 + H \( W \) \) . $
  Removing the refinement costs another $H \( W divides V \)$, since
  $ cal(J) \( V \) lt.eq cal(J) \( W \) \, #h(2em) I_P \( S \; W divides D \, D S \) lt.eq I_P \( S \; V divides D \, D S \) + H \( W divides V \) . $
  Thus the full quantitative budget is
  #[#set math.equation(numbering: n => "(56)")
   $ cal(J) \( V \) - I_P \( S \; V divides D \, D S \) lt.eq C d + frac(H \( V \), q) + 2 H \( W divides V \) + log \( 1 + H \( W \) \) . $ <rlevels:two-budget>]
  Only now use $H \( V \) lt.eq d^2$, $q = floor.l d \/ 8 floor.r$, and (45). They bound the right side by $C d$, proving (44). ◻
]

The applications of both comparisons, including their distinct residual-sphere constants, are proved in Subsection 8.4.

== 6 Actual and fresh projections through independent kernels <rhyb:section>

We compare the information in a block’s incoming and ending states after revealing independent auxiliary measurements of the same signal. The comparison averages over the number of auxiliary rows.

We use the uniform-sphere experiment in Definition 1 and the entropy conventions of Section 2. Write $gamma = N \( 0 \, I_d \)$ for the law of a single row. All intermediate lemmas concern the fixed-seed experiment supplied by Lemma 2 and the Borel reduction in Lemma 25; in particular initialization remains jointly independent of the signal and all rows. Transitions may use fresh randomness, and the terminal output uses only its state and index. Auxiliary rows are analysis variables, independent of the joint signal and learner variables as specified below. Constants $c \, C > 0$ are absolute and may increase. The estimates are for sufficiently large integer $d$.

For a nonnegative integer $j$, write $D'_j = \( Z \, Z S \)$ for $j$ fresh measurements. The matrix $Z$ is independent of the joint vector consisting of the signal and all learner variables already generated; $D'_0$ is empty. Set

#[#set math.equation(numbering: n => "(57)")
 $ k_0 = ceil.l d \/ 4 ceil.r \, #h(2em) k_1 = floor.l d \/ 2 floor.r \, #h(2em) N_k = k_1 - k_0 + 1 \, #h(2em) h_0 = floor.l d \/ 8 floor.r \, #h(2em) q = floor.l d \/ 32 floor.r . $ <rhyb:parameters>]

For a finite state $V$, with fresh rows independent of $\( S \, V \)$, define

#[#set math.equation(numbering: n => "(58)")
 $ J_k \( V \) = I \( S \; V divides D'_k \) \, #h(2em) overline(J) \( V \) = 1 / N_k sum_(k = k_0)^(k_1) J_k \( V \) . $ <rhyb:potential>]

These quantities are finite and nonnegative because they are at most $H \( V \)$.

Consider a block of $1 lt.eq m lt.eq h_0$ actual observations, with incoming state $U$ and ending state $V$. Assume $H \( V \) lt.eq B < oo$. The block rows $X_1 \, dots.h \, X_m$ are independent of $\( S \, U \)$. The block transition produces $V$ from $U$ and the block data by a measurable kernel, conditionally independently of $S$.

#thm([Proposition 6.1.])[
  (Averaged information increase per block).  #emph[For the block above, with $1 lt.eq m lt.eq h_0$ and $H \( V \) lt.eq B$, 
#[#set math.equation(numbering: n => "(59)")
 $ overline(J) \( V \) - overline(J) \( U \) lt.eq C m + m / N_k (C + B / h_0) + B / q . $ <rhyb:block-cost>]

 When $B lt.eq d^2$, the right side is at most $C' d$ for an absolute constant $C'$.]
] <rhyb:block>

Keeping $V$ as produced by the actual block, replace fresh auxiliary rows one at a time by rows the learner actually saw. Conditioning on the ending state can bias an actual row; the total row-information cost is at most $H \( V \)$. Independent random kernels control the accompanying entropy cost, and averaging over the auxiliary count reduces the difference of successive conditional entropies to two endpoint terms.

=== 6.1 Residual geometry and finite label entropies <residual-geometry-and-finite-label-entropies>

The following residual-sphere estimates justify the entropy subtractions and will also normalize the row comparison.

#thm([Lemma 6.2.])[
  (Residual-sphere estimates).  #emph[Let $D_j = \( X \, X S \)$ consist of $j$ independent Gaussian measurements, where $0 lt.eq j < d$, and put $n = d - j$. Conditional on $D_j$, the signal is uniform on a sphere of radius $R$ in the affine solution space. Marginally, 
#[#set math.equation(numbering: n => "(60)")
 $ R^2 =^(upright("law")) frac(G_n, G_n + G_j) \, #h(2em) bb(E) R^(- 2) = 1 + frac(j, n - 2) quad \( n > 2 \) \, $ <rhyb:radius>]

 where $G_n \, G_j$ are independent chi-squared variables and $G_0 = 0$.]
  #emph[If $j lt.eq 3 d \/ 4$, the entropy of one further label given its row and $D_j$ lies between two absolute constants, and its conditional log density is absolutely integrable. Joint label entropies, and the conditional label entropies obtained by also conditioning on a finite state $V$, are finite whenever the total number of rows is at most $3 d \/ 4$. The associated conditional log densities are absolutely integrable. Removing $V$ can increase any such joint entropy by at most $H \( V \)$.]
  #emph[Let $sigma_R$ be uniform probability on a sphere of radius $R > 0$ in an $n$-dimensional affine space. A Euclidean ball of radius $a$ with arbitrary center has $sigma_R$-mass at most $\( 2 a \/ R \)^(n - 1)$ when $2 a \/ R lt.eq 1 \/ 2$. For $n gt.eq 3$, 
#[#set math.equation(numbering: n => "(61)")
 $ sup_(s in "supp" sigma_R) integral frac(sigma_R \( d t \), parallel t - s parallel) lt.eq C / R . $ <rhyb:reciprocal-sphere>]

]
] <rhyb:residual>

#proof[
  The rows have full rank almost surely. Their labels determine the row-space component of $S$. Rotational invariance makes the remaining direction uniform in the kernel, conditionally on its length and the data. Representing a uniform sphere point as a standard Gaussian vector divided by its norm proves the ratio law in (60). For $n > 2$, independence and the chi-squared density give $bb(E) G_n^(- 1) = 1 \/ \( n - 2 \)$ and $bb(E) G_j = j$, proving the inverse moment.
  Let $P$ be projection onto the kernel and let $x$ be a new row. Conditional on $D_j \, x$, the new label is a fixed shift plus
  $ R parallel P x parallel U_1 \, $
  where $U$ is uniform on $S^(n - 1)$. The density of $U_1$ is proportional to $\( 1 - u^2 \)^(\( n - 3 \) \/ 2)$ on $\( - 1 \, 1 \)$. Its normalizing integral is at least $c \/ sqrt(n)$, by integrating over $\| u \| lt.eq 1 \/ sqrt(n)$. For the dimensions in use this density is at most $C sqrt(n)$, and hence
  $ h \( U_1 \) gt.eq - log \( C sqrt(n) \) . $
  Its log density is integrable: near an endpoint this is the integrability of $t^alpha \| log t \|$ for $alpha > - 1$.
  Also $parallel P x parallel^2$ is chi-squared with $n$ degrees of freedom. For $j lt.eq 3 d \/ 4$, the inverse moments of $R$ and $parallel P x parallel \/ sqrt(n)$ are bounded by absolute constants. Jensen’s inequality gives, for example,
  $ bb(E) log R gt.eq - 1 / 2 log bb(E) R^(- 2) gt.eq - C \, #h(2em) bb(E) log \( parallel P x parallel \/ sqrt(n) \) gt.eq - C . $
  Ordinary positive moments control the positive logarithmic parts. The entropy formula under scaling now gives an absolute lower bound for the conditional entropy of the next label. The upper bound is $1 / 2 log \( 2 pi e \)$, the entropy of its marginal standard normal law. These calculations also give absolute integrability of the conditional log density. Applying the chain rule in any order gives the same conclusion for all ordered subsets of labels with the stated row budget. Extra independent rows may be conditioned on before $V$ is added, since they do not change these baseline distributions.
  Adding the finite state reduces a joint label entropy by a conditional mutual information at most $H \( V \)$. To check absolute integrability as well, let $r = d Q \/ d P$ be the density ratio of the conditional joint law to its product-of-conditionals reference law. The negative part of $integral log r thin d Q$ is at most $1 \/ e$, because $- r log r lt.eq 1 \/ e$ for $0 < r lt.eq 1$. Finite relative entropy therefore also makes the positive part integrable. The log density after conditioning on $V$ is the baseline log density plus this integrable log ratio. All label-entropy chain rules just used are consequently between finite quantities.
  For $n = 1$ the cap bound is the trivial bound one. For $n gt.eq 2$, first scale to $R = 1$ and center the ball at a sphere point. If its radius is $a lt.eq 1 \/ 2$, its projection onto the tangent coordinate plane lies in an $\( n - 1 \)$-ball of radius $a$. The graph area factor there is at most $2$, while the whole sphere has area at least twice the volume of the unit $\( n - 1 \)$-ball. The cap has mass at most $a^(n - 1)$. For an arbitrary center, choose a sphere point in the intersection, if one exists, and double the radius. This proves the displayed arbitrary-center bound.
  Finally, for a sphere point $s$, integrate the centered cap estimate against $t^(- 2) thin d t$ for $0 < t lt.eq R \/ 2$; the integral is bounded by
  $ R^(- \( n - 1 \)) integral_0^(R \/ 2) t^(n - 3) thin d t lt.eq C \/ R $
  when $n gt.eq 3$. The part with $t > R \/ 2$ is at most $C \/ R$ using total mass one. The layer-cake formula for $parallel t - s parallel^(- 1)$ proves (61). ◻
]

=== 6.2 A block reduction and its row-information cost <a-block-reduction-and-its-row-information-cost>

For this block, write

$ X_(lt.eq i) = \( X_1 \, dots.h \, X_i \) \, #h(2em) Y_(lt.eq i) = X_(lt.eq i) S \, #h(2em) D_i = \( X_(lt.eq i) \, Y_(lt.eq i) \) \, #h(2em) L_i = \( V \, D_i \) $

for $0 lt.eq i lt.eq m$, with the evident empty tuples at $i = 0$. The rows are Gaussian before conditioning on $V$; their conditional laws after $V$ is known need not be Gaussian.

For an independent sequence of fresh rows $z_1 \, z_2 \, dots.h$, define the successive conditional entropies

#[#set math.equation(numbering: n => "(62)")
 $ a_j^(\( i \)) = h \( z_j S divides z_j \, D'_(j - 1) \, L_i \) \, #h(2em) j gt.eq 1 \, quad i + j lt.eq 3 d \/ 4 . $ <rhyb:slopes>]

All the entropies used below have a total row count at most $3 d \/ 4$, so Lemma 16 applies.

#thm([Lemma 6.3.])[
  (One-row hybrid identity).  #emph[For $k_0 lt.eq k lt.eq k_1$ and $0 lt.eq i lt.eq m$, let $Z^(\( i \, k \))$ be a fresh matrix of $k - i$ rows and define 
$ G_i \( k \) = h #scale(x: 120%, y: 120%)[\(] \( Y_(lt.eq i) \, Z^(\( i \, k \)) S \) divides X_(lt.eq i) \, Z^(\( i \, k \)) \, V #scale(x: 120%, y: 120%)[\)] + I \( S \; X_(lt.eq i) divides V \) . $

 For $i < m$, put $x = X_(i + 1)$, $Y = x S$, $L = L_i$, and $r = k - i - 1$. With $F_r = \( Z \, Z S \)$ denoting common fresh data of size $r$, 
#[#set math.equation(numbering: n => "(63)")
 $ G_i \( k \) - G_(i + 1) \( k \) = a_(r + 1)^(\( i \)) - #scale(x: 120%, y: 120%)[\[] h \( Y divides x \, F_r \, L \) + I \( S \; x divides F_r \, L \) #scale(x: 120%, y: 120%)[\]] . $ <rhyb:hybrid-step>]

 The actual-row divergence costs are 
#[#set math.equation(numbering: n => "(64)")
 $ K_i & := bb(E) D_(upright("KL")) #scale(x: 120%, y: 120%)[\(] cal(L) \( X_(i + 1) divides S \, L_i \) thin parallel thin gamma #scale(x: 120%, y: 120%)[\)] = I \( X_(i + 1) \; V divides S \, X_(lt.eq i) \) \,\
sum_(i = 0)^(m - 1) K_i & = I \( X_1 \, dots.h \, X_m \; V divides S \) lt.eq H \( V \) lt.eq B . $ <rhyb:row-cost>]

 Finally, 
#[#set math.equation(numbering: n => "(65)")
 $ J_k \( V \) lt.eq J_k \( U \) + G_0 \( k \) - G_m \( k \) . $ <rhyb:block-reduction>]

]
] <rhyb:hybrid>

#proof[
  We first relate $G_i \( k \)$ to conditional information without subtracting differential entropies of the singular signal. Suppose $D = \( A \, A S \)$ has the marginal law of $k$ independent Gaussian measurements, although its rows may have helped produce $V$. The conditional relative-entropy chain rule gives
  $ I \( S \; V divides D \) - I \( S \; V \) = I \( D \; V divides S \) - I \( D \; V \) . $
  Every term here is finite, being bounded by $H \( V \)$. The labels are determined by $A \, S$, and $A$ is marginally independent of $S$. Expanding the finite terms involving $V$ therefore yields
  #[#set math.equation(numbering: n => "(66)")
   $ I \( S \; V divides D \) = I \( S \; V \) - h \( A S divides A \) + h \( A S divides A \, V \) + I \( S \; A divides V \) . $ <rhyb:information-identity>]
  The label entropies are finite by Lemma 16. In a hybrid, the fresh rows contribute zero to the last mutual information. All hybrids have the same baseline entropy $h \( A S divides A \)$. Thus
  $ J_k \( V \) - I \( S \; V divides D_m \, D'_(k - m) \) = G_0 \( k \) - G_m \( k \) . $
  Given $D_m \, D'_(k - m)$, the block transition is a Markov kernel from $U$ to $V$, conditionally independently of $S$. Conditional data processing gives
  $ I \( S \; V divides D_m \, D'_(k - m) \) lt.eq I \( S \; U divides D_m \, D'_(k - m) \) = J_k \( U \) . $
  The equality holds because these $k$ rows are fresh relative to $\( S \, U \)$. This proves (65).
  For the one-row identity, realize the two adjacent hybrids using the same $r$ fresh rows $Z$, one further fresh row for $G_i \( k \)$, and the actual row $x$ for $G_(i + 1) \( k \)$. Expand the labels in the order $Y_(lt.eq i) \, Z S \, upright("last label")$. Before the last row is added the common part is
  $ h \( Y_(lt.eq i) divides X_(lt.eq i) \, V \) + I \( S \; X_(lt.eq i) divides V \) + h \( Z S divides Z \, L \) . $
  The remaining term for $G_i \( k \)$ is $a_(r + 1)^(\( i \))$. For $G_(i + 1) \( k \)$, conditioning the first two label groups on the actual row subtracts, respectively,
  $ I \( Y_(lt.eq i) \; x divides X_(lt.eq i) \, V \) quad upright("and") quad I \( Z S \; x divides Z \, L \) . $
  Its new row-information term is initially $I \( S \; x divides X_(lt.eq i) \, V \)$. The first subtraction leaves $I \( S \; x divides L \)$, because the old labels are determined by $S \, X_(lt.eq i)$. The second leaves $I \( S \; x divides F_r \, L \)$: the fresh matrix $Z$ is independent, and $Z S$ is determined by $S \, Z$. The last label then contributes $h \( Y divides x \, F_r \, L \)$. This proves (63) and retains both earlier-label subtractions.
  Conditional on $S \, X_(lt.eq i)$, the unconditioned law of $X_(i + 1)$ is $gamma$, and the labels in $L_i$ are redundant. The definition of conditional mutual information proves (64). Summing it is the conditional chain rule for $X_1 \, dots.h \, X_m$. The resulting information is at most $H \( V \)$, proving (64). In particular the conditional actual-row laws have finite divergence from $gamma$ almost surely. ◻
]

The identity has isolated the issue caused by conditioning on $V$. We next lower-bound the bracket in (63). Its reference posterior will exclude the actual row, and the change from a Gaussian row to the actual row will be charged through $K_i$.

=== 6.3 Independent kernels and the biased-row comparison <independent-kernels-and-the-biased-row-comparison>

Two signals giving the same fresh labels differ by a vector in the fresh matrix’s kernel. The posterior will select such directions nonuniformly, so we need an inverse-volume estimate that holds for every selection rule allowed below.

#thm([Lemma 6.4.])[
  (Inverse volumes for independent kernels).  #emph[Let $r \, q$ be integers satisfying 
$ d \/ 8 lt.eq r < d \, #h(2em) 1 lt.eq q lt.eq r \/ 2 \, #h(2em) r - q gt.eq 2 . $

 Generate independent standard Gaussian $r$-by-$d$ matrices $Z_1 \, dots.h \, Z_q$. After generating $Z_j$, select a unit vector $u_j in ker Z_j$ by a probability kernel that may depend on $Z_j$ and all preceding matrices and selections, but not on future matrices. Then 
#[#set math.equation(numbering: n => "(67)")
 $ bb(E) thin "vol" \( u_1 \, dots.h \, u_q \)^(- 1) lt.eq C^q \, $ <rhyb:volume-moment>]

 uniformly over all such selection kernels. In particular the volume is positive almost surely.]
] <rhyb:inverse-volume>

#proof[
  Fix a previous span $P$ of dimension $p < q$, and let $E$ be the row space of the next matrix. When $p > 0$, set
  $ xi \( P \, E \) = inf_(v in P\
parallel v parallel = 1) parallel P_E v parallel \, $
  and set $xi = 1$ for $p = 0$. An operator and its adjoint have the same norm, so $parallel P_P \|_(E^perp) parallel = parallel P_(E^perp) \|_P parallel$. For $p > 0$, taking complements of their squared norms shows, for every unit $u in E^perp$, that
  #[#set math.equation(numbering: n => "(68)")
   $ "dist" \( u \, P \)^2 gt.eq 1 - parallel P_P \|_(E^perp) parallel^2 = inf_(v in P\
parallel v parallel = 1) parallel P_E v parallel^2 = xi \( P \, E \)^2 . $ <rhyb:adjoint>]
  For $p = 0$, both the distance and $xi$ equal one, so all the bounds below are immediate. We may therefore assume $p > 0$ in the small-ball calculation.
  The new $E$ is a uniform $r$-dimensional subspace independent of the preceding selections. For a fixed unit $v$ and $0 < t lt.eq 1 \/ 4$,
  #[#set math.equation(numbering: n => "(69)")
   $ bb(P) { parallel P_E v parallel lt.eq 2 t } lt.eq \( C t \)^r . $ <rhyb:fixed-vector-small-ball>]
  Indeed $parallel P_E v parallel$ has the distribution of $parallel g parallel \/ \( parallel g parallel^2 + parallel g' parallel^2 \)^(1 \/ 2)$, with independent standard Gaussian vectors of dimensions $r$ and $d - r$. The event forces $parallel g parallel lt.eq C t parallel g' parallel$. The Gaussian integral, restricted to the ball of radius $sqrt(r)$, gives $\( 2 pi \)^(r \/ 2) gt.eq e^(- r \/ 2) v_r r^(r \/ 2)$, hence $v_r lt.eq \( C \/ sqrt(r) \)^r$. Conditional on $g'$, this volume estimate and the Gaussian density bound make its probability at most $\( C t parallel g' parallel \/ sqrt(r) \)^r$. For $z gt.eq 0$,
  $ z^(r \/ 2) lt.eq \( 2 r \/ e \)^(r \/ 2) e^(z \/ 4) \, #h(2em) bb(E) e^(parallel g' parallel^2 \/ 4) = 2^(\( d - r \) \/ 2) . $
  Since $r gt.eq d \/ 8$, these estimates give $bb(E) parallel g' parallel^r lt.eq \( C sqrt(d) \)^r$. Averaging proves (69).
  A maximal $t$-separated subset of the unit sphere in $P$ is a $t$-net with at most $\( 1 + 2 \/ t \)^p lt.eq \( 3 \/ t \)^p$ points, by packing disjoint balls of radius $t \/ 2$ in the ball of radius $1 + t \/ 2$. Projection is a contraction, so $xi lt.eq t$ puts some net point at projection distance at most $2 t$. By (69),
  #[#set math.equation(numbering: n => "(70)")
   $ bb(P) { xi lt.eq t } lt.eq \( 3 \/ t \)^p \( C t \)^r lt.eq \( C_0 t \)^(r - p) \, #h(2em) 0 < t lt.eq 1 \/ 4 . $ <rhyb:subspace-small-ball>]
  Here $C_0$ is absolute because $p < q lt.eq r \/ 2$. Choose a fixed $t_0 lt.eq 1 \/ 4$ such that $C_0 t_0 lt.eq 1 \/ 2$. Since $r - p > 1$, integration of (70) gives
  $ bb(E) xi^(- 1) = 1 + integral_0^1 bb(P) { xi < t } thin frac(d t, t^2) lt.eq C . $
  For $t gt.eq t_0$, the trivial probability bound suffices. The estimate is uniform in the preceding span $P$.
  Gram–Schmidt expresses the volume as the product of distances from successive preceding spans. Conditional on all previous selections, the $p = 0$ observation and (68) bound the reciprocal of the next distance by $xi^(- 1)$, whatever vector the new kernel selects. The new row space is still independent of that history. Iterated conditional expectation therefore bounds the inverse-volume product by $C^q$, and also shows that none of the distances vanishes with positive probability. ◻
]

Return to a fixed $i \, k$ in Lemma 17. Thus $x = X_(i + 1)$, $L = \( V \, D_i \)$, $r = k - i - 1$, and $F_r = \( Z \, Z S \)$ is fresh. Define the reference posterior and its reciprocal-distance scale by

#[#set math.equation(numbering: n => "(71)")
 $ mu = cal(L) \( S divides L \, F_r \) \, #h(2em) A \( s \, L \, F_r \) = integral frac(mu \( d s' \), parallel s' - s parallel) . $ <rhyb:reciprocal-scale>]

The posterior $mu$ includes the ending state but does not condition on the actual row $x$. This distinction is essential: we will compare the actual conditional law of $x$ with a Gaussian row.

#thm([Lemma 6.5.])[
  (A row biased by the ending state).  #emph[In the preceding experiment, $A \( S \, L \, F_r \) gt.eq 1 \/ 2$ almost surely and $bb(E) A \( S \, L \, F_r \) < oo$ for each fixed $d$. For almost every Gaussian row $x$, the projection of $mu$ by $s mapsto x s$ has a Lebesgue density $p_(mu \, x)$. With $q = floor.l d \/ 32 floor.r$, 
#[#set math.equation(numbering: n => "(72)")
 $ h \( x S divides x \, L \, F_r \) + I \( S \; x divides L \, F_r \) & gt.eq - bb(E) log p_(mu \, x) \( x S \) \,\
bb(E) log frac(p_(mu \, x) \( x S \), A \( S \, L \, F_r \)) & lt.eq C + K_i / q . $ <rhyb:cross-entropy>]

 Both expectations use the actual row law. The logarithms in these displays are absolutely integrable.]
] <rhyb:row-comparison>

#proof[
  Conditional on $D_i \, F_r$, before $V$ is imposed, the signal is uniform on a residual sphere of affine dimension
  $ n = d - i - r = d - k + 1 > 2 . $
  For a state $v$ with $pi_v = bb(P) { V = v divides D_i \, F_r } > 0$, its posterior density relative to the uniform residual law is at most $1 \/ pi_v$. This follows directly from Bayes’ formula, since the conditional probability of $V = v$ given the signal and these data is at most one. Lemma 16 therefore gives
  $ A \( s \, L \, F_r \) lt.eq frac(C, R pi_v) $
  for every point $s$ on the residual sphere. Average first over $s$ and $v$. The factor $pi_v$ cancels, and the sum has at most $W$ terms if $V$ has at most $W$ values. Consequently
  #[#set math.equation(numbering: n => "(73)")
   $ bb(E) A \( S \, L \, F_r \) lt.eq C W thin bb(E) R^(- 1) < oo . $ <rhyb:scale-integrability>]
  The inverse moment in (60) proves the last inequality. Every pairwise distance on the unit sphere is at most two, giving $A gt.eq 1 \/ 2$. In particular $log A$ is absolutely integrable.
  The posterior is nonatomic and is absolutely continuous relative to the uniform residual law. For every row whose projection into the residual kernel is nonzero, the projection of that uniform law has a Lebesgue density, by the one-coordinate formula in Lemma 16. The exceptional rows have Gaussian measure zero. Absolute continuity passes to the projected posterior, proving the assertion about $p_(mu \, x)$.
  The information cost of conditioning this posterior on $x$ is finite. Indeed $x$ and $F_r$ are conditionally independent given $S \, L$, so the conditional chain rule yields
  $ I \( S \; x divides L \) - I \( S \; x divides L \, F_r \) = I \( x \; F_r divides L \) gt.eq 0 . $
  Also the chain rule for the relative entropy in $K_i$ gives
  $ K_i = I \( S \; x divides L \) + bb(E) D_(upright("KL")) #scale(x: 120%, y: 120%)[\(] cal(L) \( x divides L \) thin parallel thin gamma #scale(x: 120%, y: 120%)[\)] . $
  Thus
  #[#set math.equation(numbering: n => "(74)")
   $ I \( S \; x divides L \, F_r \) lt.eq I \( S \; x divides L \) lt.eq K_i . $ <rhyb:information-charge>]
  The conditional actual law of $S$ given $x \, L \, F_r$ is therefore dominated by $mu$ almost surely. Projecting by $s mapsto x s$ contracts its relative entropy, so the actual projected law is dominated by the reference projected law with expected divergence at most $I \( S \; x divides L \, F_r \)$. Lemma 16 supplies an integrable log density for the actual conditional label. Applying the log-density-ratio argument from that lemma to the finite projected divergence shows that $log p_(mu \, x) \( x S \)$ is absolutely integrable as well. We may now expand the projected divergence:
  $ - bb(E) log p_(mu \, x) \( x S \) - h \( x S divides x \, L \, F_r \) lt.eq I \( S \; x divides L \, F_r \) . $
  This is (72).
  It remains to prove (72). Fix a typical pair $\( s \, L \)$ under the joint law of $\( S \, L \)$. Generate $q$ independent copies $Z_1 \, dots.h \, Z_q$ of the $r$ fresh rows, and put $F^(\( j \)) = \( Z_j \, Z_j s \)$. Let $mu_j \, A_j$ be the corresponding posterior and scale from (71). Initially let $x tilde.op gamma$ be independent of all these matrices. We claim
  #[#set math.equation(numbering: n => "(75)")
   $ bb(E)_(Z_1 \, dots.h \, Z_q \, x) product_(j = 1)^q frac(p_(mu_j \, x) \( x s \), A_j) lt.eq C^q . $ <rhyb:product-moment>]
  For $delta > 0$, replace the density in the $j$-th factor by its symmetric slab average
  $ p_(mu_j \, x)^delta \( x s \) = frac(1, 2 delta) mu_j { s' : \| x \( s' - s \) \| lt.eq delta } . $
  Draw $s'_j$ separately from $mu_j$, and write $Delta_j = s'_j - s$, $u_j = Delta_j \/ parallel Delta_j parallel$. The posteriors are nonatomic, so the differences are nonzero almost surely. Conditional on these differences, the vector $\( x Delta_1 \, dots.h \, x Delta_q \)$ is Gaussian. Its density is bounded by
  #[#set math.equation(numbering: n => "(76)")
   $ \( 2 pi \)^(- q \/ 2) product_(j = 1)^q parallel Delta_j parallel^(- 1) "vol" \( u_1 \, dots.h \, u_q \)^(- 1) \; $ <rhyb:gaussian-density>]
  we may use $+ oo$ for a singular tuple. This is the usual Gaussian density bound with covariance matrix $\( chevron.l Delta_j \, Delta_ell chevron.r \)_(j \, ell)$. Its probability in $\[ - delta \, delta \]^q$ is at most (76) times $\( 2 delta \)^q$.
  After division by $product_j A_j$, nonnegative integration converts the resulting bound into $\( 2 pi \)^(- q \/ 2)$ times an inverse-volume expectation. Conditional on each $Z_j$, the selected point in that expectation has the probability law
  #[#set math.equation(numbering: n => "(77)")
   $ nu_j \( d s' \) = frac(mu_j \( d s' \), parallel s' - s parallel A_j) . $ <rhyb:normalized-kernel>]
  Each law is normalized by its own $A_j$. Its total mass is one for every typical $Z_j$, so the marginal law of the matrices remains the product of their original Gaussian laws. In particular the matrices have not been tilted. Both $s$ and $s'_j$ satisfy the labels $Z_j s$; therefore $u_j in ker Z_j$. These selections, made separately conditional on their matrices and $\( s \, L \)$, satisfy the hypotheses of Lemma 18. Indeed
  $ r = k - i - 1 gt.eq k_0 - h_0 gt.eq d \/ 8 \, #h(2em) q lt.eq r \/ 2 \, #h(2em) r - q gt.eq 2 $
  for sufficiently large $d$. The lemma bounds the smoothed product expectation by $C^q$, uniformly in $delta$.
  Here is a density version that makes passage to exact evaluations legitimate. In the unbiased one-copy experiment, $x$ is independent of $\( S \, L \, F_r \)$, so conditional on $L \, F_r \, x$, the signal has law $mu$. The one-dimensional Lebesgue differentiation theorem applied to the integrable density $p_(mu \, x)$ shows that $x S$ is almost surely a Lebesgue point and that the symmetric slab averages converge to $p_(mu \, x) \( x S \)$. Each slab average is jointly measurable in its kernel parameters and evaluation point. Taking its limit along $delta = 2^(- n)$, and assigning zero when no finite limit exists, therefore gives a jointly measurable density version that agrees at these evaluations. Fubini’s theorem gives the same assertion for almost every fixed $\( s \, L \)$. For such a pair it holds simultaneously for all $q$ copies, since $q$ is finite. Fatou’s lemma now proves (75).
  Change only $x$ from its unbiased law to its actual conditional law given $S = s \, L$. The $Z_j$ remain independent of it and of one another. The divergence from the unbiased product experiment is exactly $D_(upright("KL")) \( cal(L) \( x divides s \, L \) thin parallel thin gamma \)$. For probability laws $Q lt.double P$ and a nonnegative function $g$, the entropy variational inequality gives
  #[#set math.equation(numbering: n => "(78)")
   $ bb(E)_Q log g lt.eq D_(upright("KL")) \( Q parallel P \) + log bb(E)_P g . $ <rhyb:entropy-inequality>]
  For positive bounded $g$ this follows from Jensen’s inequality applied to $g \/ \( d Q \/ d P \)$; truncation gives the extended form. This is the standard variational identity recorded in [3] Equations (1.1)–(1.2). Apply it to the product in (75). Finite row divergence transfers the unbiased almost-sure density statements to the actual law. The logarithms are integrable by (72) and (73). The expectation of the log product is $q$ times the one-copy expectation, since the $q$ fresh copies have the same marginal law. Divide by $q$ and average over $\( S \, L \)$. Equation (64) then gives (72). ◻
]

The independent-kernel estimate bounds the actual projected density at the scale $A$. To compare this scale to a fresh conditional entropy, we use two fresh rows after the $r$ common rows. The second of the two is the next slope beyond the one already present in the hybrid identity.

=== 6.4 A reciprocal-distance tilt and two fresh rows <a-reciprocal-distance-tilt-and-two-fresh-rows>

#thm([Lemma 6.6.])[
  (The next fresh entropy slope).  #emph[For the posterior and scale in (71), 
#[#set math.equation(numbering: n => "(79)")
 $ a_(r + 2)^(\( i \)) lt.eq - bb(E) log A \( S \, L \, F_r \) + C . $ <rhyb:next-slope>]

]
] <rhyb:tilted-coupling>

#proof[
  Write $C_(*) = \( L \, F_r \)$. Conditional on $C_(*)$, the signal has law $mu$. For an integer $N gt.eq 1$, define
  $ w_N \( s \, t \) = min { N \, parallel t - s parallel^(- 1) } \, #h(2em) A_N \( s \, C_(*) \) = integral w_N \( s \, t \) thin mu \( d t \) \, $
  where $w_N \( s \, s \) = N$. Given $S = s \, C_(*)$, draw an auxiliary point $S^(*)$ from the probability kernel
  $ nu_s^N \( d t \) = frac(w_N \( s \, t \), A_N \( s \, C_(*) \)) thin mu \( d t \) . $
  Distances on the unit sphere are at most two, so $1 \/ 2 lt.eq A_N lt.eq N$ and $d nu_s^N \/ d mu lt.eq 2 N$. The marginal law of $S^(*)$ need not equal $mu$.
  Compare the joint conditional law of $\( S \, S^(*) \)$ with $mu ⊗ mu$. Its divergence is
  $ bb(E) log frac(w_N \( S \, S^(*) \), A_N \( S \, C_(*) \)) . $
  The relative-entropy chain rule splits this into $I \( S \; S^(*) divides C_(*) \)$ plus the divergence of the actual $S^(*)$ marginal from the comparator $mu$. Hence
  #[#set math.equation(numbering: n => "(80)")
   $ I \( S \; S^(*) divides C_(*) \) & lt.eq bb(E) log frac(w_N \( S \, S^(*) \), A_N \( S \, C_(*) \))\
 & lt.eq - bb(E) log parallel S - S^(*) parallel - bb(E) log A_N \( S \, C_(*) \) . $ <rhyb:tilt-information>]
  The comparator divergence is finite, at most $log \( 2 N \)$. The points differ almost surely because $mu$ is nonatomic. Their log distance is absolutely integrable: its positive part is at most $log 2$; under $mu ⊗ mu$ its negative part is bounded by an integrable multiple of $parallel S - S^(*) parallel^(- 1)$ by (73), and the tilted density is at most $2 N$. Thus both inequalities in (80) are between well-defined finite quantities.
  After drawing $S^(*)$, generate independent fresh Gaussian rows $x_1 \, x_2$ and labels $b_1 = x_1 S$, $b_2 = x_2 S$. Before $S^(*)$ is added to the conditioning, Lemma 16 gives a joint conditional density with an integrable logarithm for these labels, since $i + r + 2 = k + 1 lt.eq 3 d \/ 4$. Fresh-row independence and data processing give
  #[#set math.equation(numbering: n => "(81)")
   $ I \( b_2 \; S^(*) divides b_1 \, x_1 \, x_2 \, C_(*) \) & lt.eq I \( \( b_1 \, b_2 \) \; S^(*) divides x_1 \, x_2 \, C_(*) \)\
 & lt.eq I \( S \; S^(*) divides C_(*) \) . $ <rhyb:remove-coupling>]
  This is finite. The log-density-ratio argument from Lemma 16 consequently gives integrable conditional log densities after $S^(*)$ is added, both for the joint labels and for the first label. Their entropy chain rule justifies the conditional entropy of the second label used next.
  Given $b_1 \, x_1 \, x_2 \, C_(*) \, S^(*)$, compare the density of $b_2$ with the Cauchy density centered at $x_2 S^(*)$ and with scale $\| b_1 - x_1 S^(*) \|$. The scale is positive almost surely. With $Delta = S - S^(*)$, the expected negative log of this reference density at $b_2$ is
  #[#set math.equation(numbering: n => "(82)")
   $ & log pi + bb(E) log \| x_1 Delta \| + bb(E) log (1 + frac(\( x_2 Delta \)^2, \( x_1 Delta \)^2))\
 & #h(35mm)  = bb(E) log parallel Delta parallel + C_1 \, $ <rhyb:cauchy>]
  where $C_1$ is absolute. Conditional on nonzero $Delta$, the two projections divided by $parallel Delta parallel$ are independent standard normals $G_1 \, G_2$. The first logarithm is integrable because $bb(E) \| log \| G_1 \| \| < oo$. For the ratio term,
  $ log #scale(x: 120%, y: 120%)[\(] 1 + \( G_2 \/ G_1 \)^2 #scale(x: 120%, y: 120%)[\)] = log \( G_1^2 + G_2^2 \) - log G_1^2 \, $
  and both logarithms on the right are integrable by the one- and two-dimensional chi-squared densities. The cross-entropy inequality therefore gives
  $ h \( b_2 divides b_1 \, x_1 \, x_2 \, C_(*) \, S^(*) \) lt.eq bb(E) log parallel Delta parallel + C_1 . $
  Removing $S^(*)$ from the conditioning in this entropy bound and using (80)–(81) cancels $bb(E) log parallel Delta parallel$. We obtain
  $ h \( b_2 divides b_1 \, x_1 \, x_2 \, C_(*) \) lt.eq - bb(E) log A_N \( S \, C_(*) \) + C_1 . $
  The left side is exactly $a_(r + 2)^(\( i \))$ and is independent of $N$. Finally $A_N arrow.t A$ and $log A_N gt.eq - log 2$. Monotone convergence, with the integrability of $log A$ already proved, yields (79). ◻
]

=== 6.5 Averaging over the number of side measurements <averaging-over-the-number-of-side-measurements>

The row comparison and the two-row coupling now leave only a difference of consecutive fresh entropy slopes. Averaging over consecutive values of $k$ makes this difference telescope.

#proof[
  Equations (72) and (72) lower-bound the bracket in (63) by $- bb(E) log A - C - K_i \/ q$. Equation (79) then gives
  $ h \( x S divides x \, L \, F_r \) + I \( S \; x divides L \, F_r \) gt.eq a_(r + 2)^(\( i \)) - C - K_i \/ q . $
  Since $r = k - i - 1$, the hybrid identity becomes
  #[#set math.equation(numbering: n => "(83)")
   $ G_i \( k \) - G_(i + 1) \( k \) lt.eq a_(k - i)^(\( i \)) - a_(k - i + 1)^(\( i \)) + C + K_i \/ q . $ <rhyb:slope-difference>]
  For fixed $i$, the fresh observations are exchangeable conditional on $L_i$. Relabel two consecutive fresh observations and then condition on the additional earlier one. Conditional entropy can only decrease, so the successive slopes $a_j^(\( i \))$ are nonincreasing in their finite range. Also
  $ a_j^(\( i \)) lt.eq 1 / 2 log \( 2 pi e \) $
  by comparison with the marginal standard normal label.
  For $i + j lt.eq k_1 + 1$, a useful lower bound is
  #[#set math.equation(numbering: n => "(84)")
   $ a_j^(\( i \)) gt.eq - C - B \/ h_0 . $ <rhyb:slope-lower>]
  To prove it, use monotonicity to bound $a_j^(\( i \))$ below by the average of the next $h_0$ slopes. Their sum is the joint entropy of the next $h_0$ fresh labels given their rows, $D'_j$, and $L_i$. Removing $V$ from that conditioning increases the entropy by at most $H \( V \) lt.eq B$. Without $V$, the actual prefix and all fresh rows have the ordinary independent-row law. Each successive baseline label entropy is at least $- C$ by Lemma 16, since the total number of rows is at most
  $ i + j + h_0 lt.eq k_1 + 1 + h_0 lt.eq 3 d \/ 4 $
  for sufficiently large $d$. The sum is therefore at least $- C h_0 - B$, proving (84).
  Average (83) over $k_0 lt.eq k lt.eq k_1$. For each $i$, its slope term is exactly
  $ 1 / N_k sum_(k = k_0)^(k_1) #scale(x: 120%, y: 120%)[\(] a_(k - i)^(\( i \)) - a_(k - i + 1)^(\( i \)) #scale(x: 120%, y: 120%)[\)] = frac(a_(k_0 - i)^(\( i \)) - a_(k_1 - i + 1)^(\( i \)), N_k) lt.eq frac(C + B \/ h_0, N_k) . $
  Now sum over $i = 0 \, dots.h \, m - 1$, use $sum_i K_i lt.eq B$ from (64), and apply (65). This gives (59). Finally $N_k \, h_0 \, q gt.eq c d$ and $m lt.eq d \/ 8$, so $B lt.eq d^2$ makes the displayed block cost at most $C' d$. ◻
]

Subsection 8.5 combines this block estimate with the stopping clock and the terminal residual-sphere bound.

== 7 A finite Gaussian-fiber comparison <sec:r-fiber>

We now bound the information retained after a block of exact Gaussian measurements by comparing two ways to average the state likelihood along a measurement fiber. The comparison measure is finite but need not have mass one. Its marginal is an inverse-distance kernel involving the rows actually used by the transition. A common local-mass quantity then connects that marginal to a projection independent of the new state.

We retain the measure and entropy conventions of Section 2. Constants denoted by $K$ are positive and absolute and may increase. The local row counts are

#[#set math.equation(numbering: n => "(85)")
 $ n = floor.l d \/ 10 floor.r \, #h(2em) k = floor.l d \/ 3 floor.r \, #h(2em) ell = floor.l d \/ 10 floor.r . $ <rfib:parameters>]

Here $n$ is the number of rows read in one block, $k$ is the number of rows in an auxiliary projection, and $ell$ is an integer moment order. We take $d$ sufficiently large that $ell gt.eq 2$ and $k - ell - n gt.eq d \/ 10$.

=== 7.1 Projection fibers and conditional information <projection-fibers-and-conditional-information>

We first record the geometric facts used both in the block estimate and at the terminal state. If $sigma_m$ is uniform probability on $S^(m - 1)$, then for $m gt.eq 2$, $z in S^(m - 1)$, and $0 < r lt.eq 1 \/ 2$,

#[#set math.equation(numbering: n => "(86)")
 $ sigma_m \( B \( z \, r \) \) lt.eq r^(m - 1) . $ <rfib:cap>]

This is the centered-ball estimate of Lemma 3 in dimension $m$.

For a full-row-rank $b times d$ matrix $C$, where $1 lt.eq b lt.eq d - 2$, put

$ P_C = C^(sans(T)) \( C C^(sans(T)) \)^(- 1) C \, #h(2em) x_C \( z \) = C^(sans(T)) \( C C^(sans(T)) \)^(- 1) z . $

Write $S \( H \) = { u in H : parallel u parallel = 1 }$ for the unit sphere of a subspace $H$. The conditional law of $S tilde.op sigma$ given $C S = z$, denoted by $sigma_(C \, z)$, fixes $P_C S = x_C \( z \)$ and is uniform on the remaining sphere

$ x_C \( z \) + sqrt(1 - parallel x_C \( z \) parallel^2) thin S \( ker C \) \, #h(2em) parallel x_C \( z \) parallel < 1 . $

This formula specifies a Borel probability kernel on the indicated set. For example, the uniform direction in $ker C$ can be realized as $\( I - P_C \) Z \/ parallel \( I - P_C \) Z parallel$ with $Z$ a standard Gaussian vector; the map is Borel away from a null set. Set the kernel to a fixed point mass off the full-rank interior set. To verify the formula, write a uniform sphere point as a standard Gaussian vector divided by its length. The squared lengths in the row space and its orthogonal complement are independent chi-squared variables with $b$ and $d - b$ degrees of freedom before division. The first divided by their sum has the beta distribution with parameters $b \/ 2$ and $\( d - b \) \/ 2$, and the two directions are independent and uniform. Consequently the row-space projection, in orthonormal coordinates, has density

#[#set math.equation(numbering: n => "(87)")
 $ c_(d \, b) \( 1 - parallel x parallel^2 \)^(\( d - b - 2 \) \/ 2) quad \( parallel x parallel < 1 \) \, #h(2em) c_(d \, b) = frac(Gamma \( d \/ 2 \), pi^(b \/ 2) Gamma \( \( d - b \) \/ 2 \)) . $ <rfib:projection-density>]

The density is zero outside the unit ball. In particular, the conditional statement holds for almost every observation. Since $parallel x_C \( z \) parallel^2 = z^(sans(T)) \( C C^(sans(T)) \)^(- 1) z$, the Lebesgue density $p_C$ of $C S$ is

#[#set math.equation(numbering: n => "(88)")
 $ p_C \( z \) = cases(delim: "{", frac(c_(d \, b), det \( C C^(sans(T)) \)^(1 \/ 2)) #scale(x: 120%, y: 120%)[\(] 1 - parallel x_C \( z \) parallel^2 #scale(x: 120%, y: 120%)[\)]^(\( d - b - 2 \) \/ 2) \, & parallel x_C \( z \) parallel < 1 \,, 0 \, & upright("otherwise") .) $ <rfib:label-density>]

Boundary values do not affect any of the integrals below.

For $b = k$, the exponent in (87) is nonnegative. Integrating its normalization over the ball of radius $1 \/ 2$ shows that its supremum times the volume of the unit $k$-ball is at most $2^k \( 4 \/ 3 \)^(d \/ 2)$. Thus, for every ball $D$ of radius $r$ in the row space,

#[#set math.equation(numbering: n => "(89)")
 $ Pr { P_C S in D } lt.eq 2^k \( 4 \/ 3 \)^(d \/ 2) r^k lt.eq e^(K d) r^k . $ <rfib:projection-ball>]

The estimate is for the unweighted uniform measure $sigma$.

Let $V$ take values in a finite set $cal(V)$ and be jointly distributed with $S$. Choose Borel versions of the state likelihoods

$ f_v \( s \) = Pr { V = v divides S = s } \, #h(2em) macron(f)_v \( C \, z \) = integral f_v \( t \) thin d sigma_(C \, z) \( t \) . $

Modify the first family on a Borel $sigma$-null set, if needed, so that $f_v gt.eq 0$ and $sum_v f_v = 1$ everywhere. These are likelihoods, not probability densities normalized separately for each state. When $C$ has $k$ independent standard Gaussian rows and is independent of $\( S \, V \)$, disintegration identifies $macron(f)_v \( C \, z \)$ with $Pr { V = v divides C \, C S = z }$. The conditional relative-entropy chain rule therefore gives

#[#set math.equation(numbering: n => "(90)")
 $ Phi \( V \) & := I \( S \; V divides C \, C S \) = bb(E) log frac(f_V \( S \), macron(f)_V \( C \, C S \))\
 & = H \( V divides C \, C S \) - H \( V divides S \) . $ <rfib:potential>]

Here $H$ denotes Shannon entropy in nats. For the standard-Borel form of this chain rule, see [1] Section 3.3. Nonnegativity of conditional relative entropy and the displayed difference give $0 lt.eq Phi \( V \) lt.eq log \| cal(V) \|$. Terms on zero-probability state or fiber events are omitted.

#thm([Proposition 7.1.])[
  (Information through a Gaussian block).  #emph[Let $S tilde.op sigma$, let $V$ be finite-valued, and let $A$ have $n$ independent standard Gaussian rows, independently of $\( S \, V \)$. Suppose $W$ takes at most $N$ values, where $N gt.eq 1$ is an integer, and is obtained from $\( V \, A \, A S \)$ by a Borel transition kernel. If $log N lt.eq d^2$, then for the dimensions in (85) and all sufficiently large $d$, 
#[#set math.equation(numbering: n => "(91)")
 $ Phi \( W \) lt.eq Phi \( V \) + K d . $ <rfib:drift>]

 The auxiliary matrix in each occurrence of $Phi$ is independent of the pair consisting of the signal and the state in that occurrence.]
] <rfib:block>

The proof first compares the real law to a finite measure. We next identify the latter’s signal/state marginal by a two-point Borel measure identity. Finally, two estimates with different geometric proofs compare that marginal and the fresh-projection likelihood to one local mass.

=== 7.2 The finite measure and its exact marginal <the-finite-measure-and-its-exact-marginal>

Write the transition probabilities as $h_(v w) \( A \, A S \)$. Define

#[#set math.equation(numbering: n => "(92)")
 $ g_w \( A \, t \) = sum_v f_v \( t \) h_(v w) \( A \, A t \) \, #h(2em) f_w \( t \) = bb(E)_A g_w \( A \, t \) . $ <rfib:routing>]

Thus $0 lt.eq g_w lt.eq 1$, $0 lt.eq f_w lt.eq 1$, and the sums over $w$ of each of these functions are one. The function $f_w$ is precisely the new state’s likelihood given $S = t$. In particular neither $g_w$ nor $f_w$ is divided by the marginal probability of state $w$.

Augment $A$ by $k - n$ independent Gaussian rows and call the result $C$, with $A$ as its first $n$ rows. Relative to the product measure $frak(m)$ of the Gaussian law of $C$, $sigma \( d s \)$, and counting measure on the two state sets, the real law $P$ and the comparison measure $Q$ on $\( C \, S \, V \, W \)$ have densities

#[#set math.equation(numbering: n => "(93)")
 $ frac(d P, d frak(m)) \( C \, s \, v \, w \) & = f_v \( s \) h_(v w) \( A \, A s \) \,\
frac(d Q, d frak(m)) \( C \, s \, v \, w \) & = p_C \( C s \) macron(f)_v \( C \, C s \) h_(v w) \( A \, A s \) . $ <rfib:PQ>]

The factor $p_C \( C s \)$ turns the conditional fiber average $macron(f)_v \( C \, C s \)$ into the density at $C s$ of the projection of $f_v thin d sigma$. This unnormalized equal-label measure will yield the inverse-distance kernel in Lemma 22. The routing weights in $Q$ remain the actual weights $h_(v w) \( A \, A s \)$. We have $P lt.double Q$: $p_C \( C s \) > 0$ almost surely, and a fiber on which $macron(f)_v \( C \, C s \) = 0$ has $f_v = 0$ almost everywhere on that fiber.

The comparison measure has strictly positive finite mass. Indeed, summing the routing probabilities and then the old-state likelihoods gives

$ m_Q := Q \( Omega \) = bb(E)_C integral p_C \( C s \) thin d sigma \( s \) = bb(E)_C integral p_C \( z \)^2 thin d z lt.eq bb(E)_C sup_z p_C \( z \) < oo . $

The last expectation is finite by (88). Gram–Schmidt on the Gaussian rows expresses $det \( C C^(sans(T)) \)^(1 \/ 2)$ as a product of successive perpendicular lengths with conditional chi laws of degrees $d \, d - 1 \, dots.h \, d - k + 1$. A chi variable of degree $nu > 1$ has finite inverse first moment $2^(- 1 \/ 2) Gamma \( \( nu - 1 \) \/ 2 \) \/ Gamma \( nu \/ 2 \)$, and all these degrees are greater than one. Strict positivity follows from the positivity of $p_C$ on the interior of its support.

Use the signed finite-reference entropy $D_(upright("fin")) \( P parallel Q \) = bb(E)_P log \( d P \/ d Q \)$ from Lemma 4. Cancellation in (93), together with the independence of $C$ from $\( S \, V \)$, yields

#[#set math.equation(numbering: n => "(94)")
 $ D_(upright("fin")) \( P parallel Q \) = Phi \( V \) + bb(E) \[ - log p_C \( C S \) \] lt.eq Phi \( V \) + k / 2 log \( 2 pi e \) . $ <rfib:finite-entropy>]

Here $log p_C \( C S \)$ is integrable: the logarithm of the determinant has finite log moments by the same chi factorization, and the residual factor in (88) has finite log moments by the beta law. For the inequality, let $phi_k$ be the standard Gaussian density. Nonnegativity of $D \( p_C thin d z parallel phi_k thin d z \)$, integrated over $C$, gives $bb(E) \[ - log p_C \( C S \) \] lt.eq bb(E) \[ - log phi_k \( C S \) \]$. Unconditionally $C S$ is standard Gaussian, because $S$ has unit length and is independent of the Gaussian rows. This assertion is not a conditional Gaussian assertion given $C$ or the state.

It is necessary to normalize $Q$ before invoking probability data processing. Set $Q_0 = Q \/ m_Q$, and let $pi$ be any measurable map. Both $Q$ and its pushforward have mass $m_Q$, so

#[#set math.equation(numbering: n => "(95)")
 $ D_(upright("fin")) \( P parallel Q \) & = D \( P parallel Q_0 \) - log m_Q \,\
D_(upright("fin")) \( pi_(\#) P parallel pi_(\#) Q \) & = D \( pi_(\#) P parallel pi_(\#) Q_0 \) - log m_Q\
 & lt.eq D \( P parallel Q_0 \) - log m_Q = D_(upright("fin")) \( P parallel Q \) . $ <rfib:finite-dp>]

No nonnegativity of $D_(upright("fin")) \( P parallel Q \)$ is used.

Let $q_w \( s \)$ be the density of the $\( S \, W \)$ marginal of $Q$ relative to $sigma$ and counting measure. The corresponding real density is $f_w \( s \)$. Equations (94) and (95) imply

#[#set math.equation(numbering: n => "(96)")
 $ bb(E) log frac(f_W \( S \), q_W \( S \)) lt.eq Phi \( V \) + K d \, $ <rfib:marginal-entropy>]

where this expectation, and all state expectations below, are under the real law. The densities $q_w$ need not sum to a probability density.

We next calculate this marginal in a form suitable for geometric estimates. Let $gamma_b$ denote the law of $b$ unrestricted standard Gaussian rows. For a unit vector $u$, let $gamma_(b \, perp u)$ be the law of $b$ independent rows with Gaussian covariance $I - u u^(sans(T))$, supported on $u^perp$.

#thm([Lemma 7.2.])[
  (Two-point Gaussian fiber measure).  #emph[Assume $1 lt.eq k < d - 1$. For every bounded Borel function $H \( C \, s \, t \)$ on $bb(R)^(k times d) times S^(d - 1) times S^(d - 1)$, 
#[#set math.equation(numbering: n => "(97)")
 $ & integral gamma_k \( d C \) integral sigma \( d s \) thin p_C \( C s \) integral sigma_(C \, C s) \( d t \) thin H \( C \, s \, t \)\
 & quad = \( 2 pi \)^(- k \/ 2) integral sigma \( d s \) integral sigma \( d t \) thin parallel s - t parallel^(- k) integral gamma_(k \, perp accent(s - t, ̂)) \( d C \) thin H \( C \, s \, t \) \, $ <rfib:two-point-id>]

 where $accent(s - t, ̂) = \( s - t \) \/ parallel s - t parallel$ off the diagonal. The diagonal has product measure zero, and its assigned value is immaterial. Both sides define finite Borel measures.]
] <rfib:two-point>

#proof[
  For $delta > 0$, let $kappa_delta \( z \) = \( 2 pi delta^2 \)^(- k \/ 2) e^(- parallel z parallel^2 \/ \( 2 delta^2 \))$. First let $H$ be bounded and continuous, and integrate
  $ H \( C \, s \, t \) kappa_delta \( C \( t - s \) \) quad upright("against") quad gamma_k \( d C \) sigma \( d s \) sigma \( d t \) . $
  Fix full-rank $C$ and $s$ with $parallel P_C s parallel < 1$. Disintegration in $z = C t$ makes the integral in $t$
  $ integral kappa_delta \( z - C s \) thin p_C \( z \) (integral H \( C \, s \, t \) thin d sigma_(C \, z) \( t \)) d z . $
  The function multiplied by $kappa_delta$ is continuous at $C s$. Indeed the displayed fiber parametrization is continuous at interior observations, and the test is bounded and continuous. It is bounded in absolute value by $parallel H parallel_oo sup_z p_C \( z \)$. The Gaussian approximate identity therefore converges to the left integrand in (97); the preceding inverse determinant estimate makes this bound integrable in $C$.
  Alternatively fix $s eq.not t$, and integrate first in $C$. Writing $v = t - s$, each row integral has total weight
  $ \( 2 pi \)^(- 1 \/ 2) \( parallel v parallel^2 + delta^2 \)^(- 1 \/ 2) . $
  After division by that weight, the row is a centered Gaussian with covariance $I - v v^(sans(T)) \/ \( parallel v parallel^2 + delta^2 \)$. As $delta arrow.b 0$ this law converges to the Gaussian law on $v^perp$. The $k$ rows remain independent, so the limit is the right integrand in (97). Its absolute value is dominated by $\( 2 pi \)^(- k \/ 2) parallel H parallel_oo parallel s - t parallel^(- k)$. This is integrable under $sigma ⊗ sigma$: dyadic annuli about $s$, with (86) for the small radii, give a convergent geometric series because $k < d - 1$.
  The two orders compute the same limit. They prove equality on bounded continuous tests of two finite Borel measures on the indicated Polish space. Uniqueness of finite Borel measures then proves the equality for bounded Borel tests as well. This last step is what permits measurable routing functions in the application. ◻
]

On the fiber $C t = C s$, the first $n$ rows give $A t = A s$. Consequently, using (92) without normalizing its weights,

$ q_w \( s \) = bb(E)_C [p_C \( C s \) integral g_w \( A \, t \) thin d sigma_(C \, C s) \( t \)] . $

Apply Lemma 22 to $H \( C \, s \, t \) = psi \( s \) g_w \( A \, t \)$ for bounded Borel $psi$. The extra $k - n$ rows do not enter $g_w$, so integrating them out leaves precisely the marginal law of the $n$ actual rows. We obtain, for $sigma$-almost every $s$,

#[#set math.equation(numbering: n => "(98)")
 $ q_w \( s \) = \( 2 pi \)^(- k \/ 2) integral parallel s - t parallel^(- k) bb(E)_(A tilde.op gamma_(n \, perp accent(s - t, ̂))) g_w \( A \, t \) thin d sigma \( t \) . $ <rfib:kernel>]

This is an equality of marginal densities of the finite measure $Q$; there is no additional normalization on its right-hand side.

=== 7.3 Two estimates for a common local mass <two-estimates-for-a-common-local-mass>

Put $a_w = integral f_w thin d sigma = Pr { W = w }$, and omit states with $a_w = 0$. Define

#[#set math.equation(numbering: n => "(99)")
 $ L_(w \, r) \( s \) = r^(- k) integral_(B \( s \, r \)) f_w \( t \) thin d sigma \( t \) \, #h(2em) L_w \( s \) = sup_(r > 0) L_(w \, r) \( s \) . $ <rfib:local-mass>]

For each $r$ the integral is Borel in $s$. Rational radii suffice in the supremum: approximate any radius from above and use continuity from above of the finite measure $f_w sigma$. Thus $L_w$ is Borel. The diameter-two ball gives its lower bound, while (86) for $r lt.eq 1 \/ 2$ and total mass at most one for larger radii give the upper bound

#[#set math.equation(numbering: n => "(100)")
 $ 2^(- k) a_w lt.eq L_w \( s \) lt.eq 2^k . $ <rfib:local-bounds>]

Choose the state-count-dependent cutoff

#[#set math.equation(numbering: n => "(101)")
 $ J = 1 + ⌈frac(log_2 N, d - 1 - k)⌉ \, #h(2em) r_(*) = 2^(- J) . $ <rfib:cutoff>]

Then $r_(*) lt.eq 1 \/ 2$, $N r_(*)^(d - 1 - k) lt.eq 1$, and $J = O \( d \)$, since $d - 1 - k gt.eq d \/ 2$ for large $d$ and $log N lt.eq d^2$.

#thm([Lemma 7.3.])[
  (Comparison with an independent projection).  #emph[Let $C'$ have $k$ independent standard Gaussian rows and be independent of $\( S \, W \)$. Then 
#[#set math.equation(numbering: n => "(102)")
 $ bb(E) frac(L_W \( S \), macron(f)_W \( C' \, C' S \)) lt.eq e^(K d) . $ <rfib:ratio-fresh>]

]
] <rfib:first-ratio>

#proof[
  Fix a full-rank $C'$ and a radius $r lt.eq 2$. Choose a finite maximal $r$-separated set ${ z_i }$ on the sphere, and partition the sphere into Borel cells $E_i subset.eq B \( z_i \, r \)$, breaking ties by their indices. The enlarged balls $B \( z_i \, 2 r \)$ overlap at most $5^d$ times: balls of radius $r \/ 2$ about their separated centers have disjoint interiors, and all those meeting a given point in an enlarged ball lie inside the ambient ball of radius $5 r \/ 2$ about that point.
  On $E_i$,
  $ L_(w \, r) \( s \) lt.eq r^(- k) integral_(B \( z_i \, 2 r \)) f_w thin d sigma . $
  Write $R$ for the row space of $C'$, $p_R$ for the density in (87), and $sigma_x$ for the corresponding uniform fiber law. Conditioning on $P_(C') S = x$ gives
  $ integral_(E_i) frac(f_w \( s \), macron(f)_w \( C' \, C' s \)) thin d sigma \( s \) & = integral_R p_R \( x \) frac(integral_(E_i) f_w \( s \) thin d sigma_x \( s \), macron(f)_w \( C' \, C' x \)) thin d x\
 & lt.eq Pr { P_(C') S in B \( P_(C') z_i \, r \) } lt.eq e^(K d) r^k . $
  The quotient is defined to be zero on zero-denominator fibers; on all other fibers its numerator is at most its denominator. The numerator vanishes on fibers outside the displayed projected ball. The last probability is under the unweighted prior and is bounded by (89). Multiplying the last two estimates and summing the cells, with their $5^d$ overlap, yields
  #[#set math.equation(numbering: n => "(103)")
   $ integral frac(f_w \( s \) L_(w \, r) \( s \), macron(f)_w \( C' \, C' s \)) thin d sigma \( s \) lt.eq e^(K d) a_w . $ <rfib:fixed-radius>]
  For $r gt.eq r_(*)$, one of the grid radii $2 \, 1 \, 1 \/ 2 \, dots.h \, r_(*)$ gives $L_(w \, r) lt.eq 2^k L_(w \, upright("grid"))$; radii greater than two are already bounded by the radius-two expression. For $r < r_(*)$, (86) gives $L_(w \, r) lt.eq r^(d - 1 - k) lt.eq r_(*)^(d - 1 - k)$. A second conditioning on the projection gives $integral f_w \/ macron(f)_w \( C' \, C' dot.op \) thin d sigma lt.eq 1$. We may therefore sum (103) over the grid and over states, obtaining
  $ sum_w integral frac(f_w L_w, macron(f)_w \( C' \, C' dot.op \)) thin d sigma lt.eq 2^k \( J + 2 \) e^(K d) sum_w a_w + N r_(*)^(d - 1 - k) lt.eq e^(K d) . $
  The bound is uniform in full-rank $C'$, and averaging proves the claim. ◻
]

The other comparison is with the actual finite-measure marginal:

#[#set math.equation(numbering: n => "(104)")
 $ bb(E) frac(q_W \( S \), L_W \( S \)) lt.eq e^(K d) . $ <rfib:ratio-kernel>]

We prove it now. For each positive-mass state introduce the finite measure

$ d nu_w \( s \) = frac(f_w \( s \), L_w \( s \)) thin d sigma \( s \) . $

Equation (100) gives $nu_w \( S^(d - 1) \) lt.eq 2^k$. More locally, for every ambient center $z$ and $r > 0$,

#[#set math.equation(numbering: n => "(105)")
 $ nu_w \( B \( z \, r \) \) lt.eq \( 2 r \)^k . $ <rfib:nu-ball>]

Indeed, if $m = integral_(B \( z \, r \)) f_w thin d sigma > 0$, every $s$ in that ball on the sphere has $L_w \( s \) gt.eq \( 2 r \)^(- k) m$; integration of $f_w \/ L_w$ over the ball gives the bound. The case $m = 0$ is immediate.

Inserting (98) shows that the left side of (104) is $sum_w integral q_w thin d nu_w$. First take the portion with $parallel s - t parallel lt.eq r_(*)$. Uniformly in $s$, dyadic annuli and (86) give

#[#set math.equation(numbering: n => "(106)")
 $ integral_({ parallel s - t parallel lt.eq r_(*) }) parallel s - t parallel^(- k) thin d sigma \( t \) lt.eq frac(2^k r_(*)^(d - 1 - k), 1 - 2^(- \( d - 1 - k \))) . $ <rfib:near>]

Using $g_w lt.eq 1$, summing the at most $N$ masses $nu_w \( S^(d - 1) \) lt.eq 2^k$, and retaining the prefactor in (98), this portion is at most

$ \( 2 pi \)^(- k \/ 2) thin frac(N thin 2^(2 k) r_(*)^(d - 1 - k), 1 - 2^(- \( d - 1 - k \))) lt.eq e^(K d) . $

Thus the state count in the near singular part is paid by the cutoff chosen in (101).

For the remaining distances use the annuli $r \/ 2 < parallel s - t parallel lt.eq r$ with outer radii $r = 2 \, 1 \, dots.h \, 2 r_(*)$. Fix $w \, t \, r$, and push $r^(- k) nu_w$ restricted to that annulus to the unit direction $u = \( s - t \) \/ parallel s - t parallel$; call the resulting measure $mu$. It has total mass at most $2^k$ by (105). For a linear subspace $E$ of dimension $0 lt.eq j lt.eq ell - 1$ and $0 < eta lt.eq 1$, its directions satisfy

#[#set math.equation(numbering: n => "(107)")
 $ mu { u : "dist" \( u \, E \) lt.eq eta } lt.eq 3^j 4^k eta^(k - j) . $ <rfib:tube>]

In fact the corresponding $s$’s lie within distance $eta r$ of the affine subspace $t + E$, with their projections there in the radius-$r$ ball about $t$. That $j$-ball has an $eta r$-net of at most $\( 3 \/ eta \)^j$ points by ambient packing. Balls of radius $2 eta r$ about these points cover the $s$’s. Applying (105) and multiplying by $r^(- k)$ proves (107).

#thm([Lemma 7.4.])[
  (Averaging perpendicular Gaussian laws).  #emph[Let $mu$ be a finite measure on $S^(d - 1)$ of mass at most $2^k$ satisfying (107) for every linear subspace of dimension $j lt.eq ell - 1$. Define the finite measure on $n times d$ matrices 
$ lambda = integral gamma_(n \, perp u) thin d mu \( u \) . $

 This is a Borel measure: a perpendicular matrix can be realized as $Z \( I - u u^(sans(T)) \)$ with $Z tilde.op gamma_n$. Then every bounded Borel function $H$ on this matrix space satisfies 
#[#set math.equation(numbering: n => "(108)")
 $ lr(|integral H thin d lambda|) lt.eq e^(K d) parallel H parallel_(L^(ell \/ \( ell - 1 \)) \( gamma_n \)) . $ <rfib:mixture-dual>]

]
] <rfib:mixture>

#proof[
  For $E$ of dimension $j lt.eq ell - 1$, layer-cake integration of (107) gives the inverse moment
  #[#set math.equation(numbering: n => "(109)")
   $ integral "dist" \( u \, E \)^(- n) thin d mu \( u \) lt.eq 2^k + frac(n thin 3^j 4^k, k - j - n) lt.eq e^(K d) . $ <rfib:inverse-distance>]
  Here $"dist" \( u \, E \) lt.eq 1$; its layer-cake integral below one is $n integral_0^1 eta^(- n - 1) mu { "dist" \( u \, E \) lt.eq eta } thin d eta$. The denominator is positive because $k - j - n gt.eq k - ell + 1 - n gt.eq d \/ 10$.
  For $u_1 \, dots.h \, u_ell$, let $G = \( chevron.l u_i \, u_j chevron.r \)_(i \, j lt.eq ell)$. The tube estimate, sent to $eta arrow.b 0$, shows that each proper span of at most $ell - 1$ preceding directions has $mu$-mass zero. Thus $G$ is invertible for $mu^(⊗ ell)$-almost every tuple. Gram–Schmidt gives
  $ det G = product_(i = 1)^ell "dist" #scale(x: 120%, y: 120%)[\(] u_i \, "span" \( u_1 \, dots.h \, u_(i - 1) \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Integrate $u_ell \, u_(ell - 1) \, dots.h \, u_1$ in that order and apply (109) at each step. This proves
  #[#set math.equation(numbering: n => "(110)")
   $ integral \( det G \)^(- n \/ 2) product_(i = 1)^ell d mu \( u_i \) lt.eq e^(K d ell) . $ <rfib:inverse-gram>]
  It remains to pass from this determinant moment to singular row laws. For $0 < delta lt.eq 1$, set
  $ alpha_delta & = Pr { \| Z \| lt.eq delta } \, #h(2em) Z tilde.op N \( 0 \, 1 \) \,\
D_delta \( A \) & = integral upright(bold(1))_({ parallel A u parallel_oo lt.eq delta }) / alpha_delta^n thin d mu \( u \) . $
  There is an absolute $c > 0$ such that $alpha_delta gt.eq c delta$. Expanding the integer $ell$-th moment under $gamma_n$ produces one tuple $u_1 \, dots.h \, u_ell$. For an invertible Gram matrix $G$, the projections of each unrestricted Gaussian row onto those directions have density at most $\( 2 pi \)^(- ell \/ 2) \( det G \)^(- 1 \/ 2)$. The box of allowed projections has volume $\( 2 delta \)^ell$. Row independence and (110) therefore give
  $ bb(E)_(gamma_n) D_delta^ell lt.eq (frac(\( 2 delta \)^ell \( 2 pi \)^(- ell \/ 2), alpha_delta^ell))^n e^(K d ell) lt.eq e^(K d ell) . $
  The null set of dependent tuples was removed above. Thus $parallel D_delta parallel_(L^ell \( gamma_n \)) lt.eq e^(K d)$ uniformly in $delta$.
  The measure $D_delta thin d gamma_n$ is the mixture, with mixing measure $mu$, of the laws conditioned on $parallel A u parallel_oo lt.eq delta$. For each $u$, this conditioning preserves the independent perpendicular components and makes all components along $u$ tend to zero. For every bounded continuous test $H$, bounded convergence in $u$ consequently gives $integral H D_delta thin d gamma_n arrow.r integral H thin d lambda$. Hölder’s inequality proves (108) for those tests. Both $gamma_n$ and $lambda$ are finite Euclidean Borel measures. Bounded continuous functions are dense in $L^(ell \/ \( ell - 1 \)) \( gamma_n + lambda \)$; approximation in this space passes the inequality to every bounded Borel $H$. In particular no absolute continuity of the singular mixture $lambda$ was assumed before the dual estimate. ◻
]

For the far-annulus contribution to $sum_w integral q_w thin d nu_w$, apply Lemma 24 to the annular measure above and $H \( A \) = g_w \( A \, t \)$. Since $0 lt.eq g_w lt.eq 1$,

$ integral bb(E)_(gamma_(n \, perp u)) g_w \( A \, t \) thin d mu \( u \) lt.eq e^(K d) #scale(x: 120%, y: 120%)[\(] bb(E)_(gamma_n) g_w \( A \, t \) #scale(x: 120%, y: 120%)[\)]^(1 - 1 \/ ell) = e^(K d) f_w \( t \)^(1 - 1 \/ ell) . $

On its annulus, $parallel s - t parallel^(- k) lt.eq 2^k r^(- k)$. The definition of $mu$ thus bounds the annular integration in $s$ in (98) by $2^k e^(K d) f_w \( t \)^(1 - 1 \/ ell)$, apart from the displayed kernel prefactor. Concavity gives, pointwise in $t$,

$ sum_w f_w \( t \)^(1 - 1 \/ ell) lt.eq N^(1 \/ ell) (sum_w f_w \( t \))^(1 - 1 \/ ell) lt.eq N^(1 \/ ell) lt.eq e^(K d) . $

There are $J + 1 = O \( d \)$ far annuli. Summing them and integrating in $t$, then adding the near contribution, proves (104).

=== 7.4 Logarithmic combination <logarithmic-combination>

We can now finish Proposition 21. All logarithms in the following split are integrable under the real $\( S \, W \)$ law and the independent $C'$. Indeed

$ bb(E) \[ - log f_W \( S \) \] = H \( W divides S \) lt.eq log N \, #h(2em) bb(E) \[ - log macron(f)_W \( C' \, C' S \) \] = H \( W divides C' \, C' S \) lt.eq log N . $

Also (100) and $bb(E) \[ - log a_W \] = H \( W \) lt.eq log N$ make $log L_W \( S \)$ integrable. Finally $P_(S \, W) lt.double Q_(S \, W)$. For any finite measure $Q'$ and probability $P' lt.double Q'$, the negative part of its log density ratio has bound

$ integral_({ r < 1 }) r log \( 1 \/ r \) thin d Q' lt.eq Q' \( Omega \) \/ e \, #h(2em) r = frac(d P', d Q') . $

Applied to the marginal comparison, this and the finite upper bound (96) make $log \( f_W \( S \) \/ q_W \( S \) \)$ integrable. Hence $log q_W \( S \)$ is integrable as well, and $q_W \( S \) > 0$ almost surely under the real law.

Using the fresh $C'$ in the new-state potential, we may therefore write

$ Phi \( W \) & = bb(E) log frac(f_W \( S \), q_W \( S \)) + bb(E) log frac(q_W \( S \), L_W \( S \))\
 & quad + bb(E) log frac(L_W \( S \), macron(f)_W \( C' \, C' S \))\
 & lt.eq Phi \( V \) + K d + log bb(E) frac(q_W \( S \), L_W \( S \))\
 & quad + log bb(E) frac(L_W \( S \), macron(f)_W \( C' \, C' S \)) lt.eq Phi \( V \) + K d . $

The first inequality uses (96) and Jensen; the last uses (104) and Lemma 23. This proves the proposition. The extra $k - n$ rows allowed both local comparisons to use exponent $k$, whereas only the $n$ actual rows entered the perpendicular mixture moment.

Subsection 8.6 applies the estimate to a learner and combines it with stopping and terminal accuracy to obtain a sample lower bound.

== 8 From row comparisons to streaming lower bounds <sec:r-streaming>

To apply the row comparisons to the learner in Definition 1, we first replace completed-measurable rules by Borel versions in the selected uniform-prior experiment. We then account for the stopping index and quantify the information that an accurate output must retain after independent auxiliary rows are revealed. These common reductions leave each comparison its own block estimate, row dimensions, and terminal residual-radius bound.

=== 8.1 Borel rules after the shared seed is fixed <subsec:r-borel-reduction>

Lemma 2 is applied to the original jointly measurable experiment. It supplies a fixed seed for which (1) holds and the required uniform-prior success is retained. The following reduction is performed only after that choice. It does not assert preservation of behavior at every individual signal.

#thm([Lemma 8.1.])[
  (Borel versions of the finite-state rules).  #emph[Fix a seed satisfying (1), a dimension $d gt.eq 2$, and a deterministic finite horizon $T$. Retain the conditional law of $U_0$ at that seed. Suppose each transition and stopping probability at a positive sample index is measurable in the completion of the Borel sigma field on $bb(R)^d times bb(R)$ under 
$ lambda \( d x \, d y \) = gamma_1 \( d x \) thin d y . $

 There are everywhere defined Borel transition and stopping kernels with the same state sets and terminal output kernels whose fixed-seed uniform-prior joint law of the signal, state path, stopping index, and output is the same as before. Their block routing probabilities are Borel functions of the entering state and the entire block data, including at states and data that have zero probability in the original run.]
] <lem:r-borel-kernels>

#proof[
  For each state and positive index, combine the next-state and stopping choices into one finite destination set, tagging a destination as continuing or terminal. The kernel is a finite vector of completed-measurable nonnegative functions of $\( x \, y \)$ whose sum is one. Every completed-measurable real function has a Borel version: approximate it by simple functions and replace their level sets by Borel sets modulo null sets. Choose such a version for every coordinate. The union of the exceptional sets is contained in a Borel $lambda$-null set. On the Borel set where the chosen vector is not a probability vector, replace it by a fixed point mass. That set is also null. Since the horizon and all state sets are finite, a single Borel $lambda$-null set $Z$ contains every sample-pair modification. A stopping choice at index zero depends only on the initial state and the fixed seed, with fresh randomness, and has no sample argument to replace.
  In the fixed-seed law, (1) leaves $S tilde.op sigma$ independent of the pre-generated Gaussian rows. For a nonzero row $x$, the image of $sigma$ under $s mapsto chevron.l x \, s chevron.r$ has a Lebesgue density when $d gt.eq 2$. This follows from the one-coordinate sphere formula after rotation and multiplication by $parallel x parallel$. The zero row has Gaussian probability zero. Hence every marginal sample pair $\( X_t \, chevron.l X_t \, S chevron.r \)$ is absolutely continuous with respect to $lambda$. In particular,
  $ bb(P) { \( X_t \, chevron.l X_t \, S chevron.r \) in Z } = 0 . $
  For any state $u$, even one selected using previous observations, the probability that the state before time $t$ is $u$ and the current pair lies in $Z$ is bounded by this same zero probability. A finite union over the pre-generated indices therefore shows that no modified input is visited almost surely.
  Couple the original and Borel finite kernels with the same fresh uniform random variable at each step. Induction makes their state paths and stopping choices identical almost surely. At identical terminal state-index pairs their output kernels agree, so the outputs may also be coupled identically. This proves the claimed joint-law equality. For any specified entering state, finite composition of the everywhere Borel kernels gives Borel block routing probabilities on every block-data vector. Such a routing function is a continuation from the specified state; it need not be a conditional law given that the state was reached. ◻
]

The order of these reductions matters. Original joint measurability makes the conditional success function of the shared seed measurable, so it can be averaged in Lemma 2. Lemma 25 then chooses versions separately for the selected seed. No jointly measurable selection of replacement versions across seed values is needed. In particular the global Borel extensions used in the finite fiber comparison are fixed before its singular comparison measure is constructed; no real-law null set is transferred to a perpendicular Gaussian law.

In each fixed-seed experiment below, unused future rows are still independent of the joint vector consisting of the signal and the current state. This follows from the pre-generated product row law, (1), and the fresh transition randomness in the model. If stopping is allowed at index zero, let $overline(U)_0$ denote the initial padded state, including that status. It is generated from $U_0$ and fresh time-zero randomness, so

$ overline(U)_0 med perp #h(-0.16667em) #h(-0.16667em) #h(-0.16667em) perp med \( S \, \( X_t \)_(t gt.eq 1) \) $

in the fixed-seed law. Whenever an auxiliary matrix is introduced, it is sampled independently of the pair consisting of $S$ and the state in question. These joint independence statements justify the zero initial potentials and the fresh-block comparisons.

=== 8.2 Common stopping and terminal estimates <subsec:r-stopping-reduction>

The five comparisons use different information potentials. Their application to a learner shares two estimates. First we account for the stopping index before any analytic comparison is invoked. We then bound the information that success requires after auxiliary rows have been revealed.

#thm([Lemma 8.2.])[
  (Padding, output capacity, and unrestricted data).  #emph[Consider a fixed-seed Borel learner from Lemmas 2 and 25. Suppose its accuracy satisfies $0 < epsilon.alt lt.eq 1 \/ 10$, its persistent states have at most $2^M$ values, and its deterministic finite horizon is $T$. Write $L = log \( 1 \/ epsilon.alt \)$. It admits an absorbing extension, including to the end of a longer final block, with at most 
$ N = \( T + 2 \) 2^M $

 values at each layer. The terminal output is a kernel of the extended state alone. The initial extended state is independent of the joint signal and row sequence. At every deterministic block boundary, unused future rows are independent of the pair consisting of the signal and the entering extended state. The block transition is a Borel kernel of that state and the exact block data.]
  #emph[If its uniform-prior angular success probability is $p$, then 
#[#set math.equation(numbering: n => "(111)")
 $ p lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) . $ <eq:r-common-output-capacity>]

 For a sequence of such learners with $p gt.eq 3 \/ 5$ and $M \( d \) = o \( d^2 \)$, on the branch $T lt.eq d L$, 
#[#set math.equation(numbering: n => "(112)")
 $ d L = O \( M + 1 \) \, #h(2em) L = o \( d \) \, #h(2em) log N = M log 2 + log \( T + 2 \) = o \( d^2 \) . $ <eq:r-common-clock>]

 All these estimates are uniform over the allowed accuracies. For all sufficiently large $d$, even a learner given all its exact observations must have $T > d \/ 4$ to achieve success at least $3 \/ 5$.]
] <lem:r-stopping-reduction>

#proof[
  After stopping, retain the terminal state together with its stopping index in an absorbing state. Defer the output until the end of the extension and apply its original state-index kernel. Active states and all stopped pairs number at most $\( T + 2 \) 2^M$. At index zero the stopping status is generated from the data-independent initialization and fresh randomness. The independence statements then follow from the pre-generated product row law. Finite composition of the Borel rules gives the asserted block kernel, including on inputs never visited in the original run.
  There are at most $\( T + 1 \) 2^M$ terminal state-index labels. For each label, its output kernel has no further dependence on the signal. In the success integral for that label, bound the conditional probability of reaching it by one. Lemma 3, averaged over the output kernel, bounds the remaining integral by $epsilon.alt^(d - 1)$. Summing proves (111), including for randomized output. When $p gt.eq 3 \/ 5$, taking logarithms gives
  $ \( d - 1 \) L lt.eq M log 2 + log \( T + 1 \) + log \( 5 \/ 3 \) . $
  For sufficiently large $d$, uniformly for $L gt.eq log 10$, $\( d - 1 \) L gt.eq 3 d L \/ 4$ and $log \( d L + 1 \) lt.eq d L \/ 4$. On $T lt.eq d L$, subtraction gives $d L = O \( M + 1 \)$. Consequently $L = o \( d \)$, $T = o \( d^2 \)$, and $log N = o \( d^2 \)$. This is a conclusion only on the stated branch; no restriction on the accuracy sequence has been imposed.
  For the unrestricted-data bound, suppose $T lt.eq d \/ 4$ and grant the output all $T$ pre-generated rows and labels, including unused pairs after a stop. Given those data, the remaining signal is uniform on a sphere of radius $R$ in a $\( d - T \)$-dimensional affine space. Indeed the row-space component is determined, while rotational invariance leaves a uniform direction in the kernel. More generally, if $U$ is the span of $t < d$ independent Gaussian rows, isotropy and independence give
  #[#set math.equation(numbering: n => "(113)")
   $ bb(E) parallel P_U S parallel^2 = t \/ d . $ <rlevels:residual-mean>]
  Taking $t = T$ gives $bb(E) \( 1 - R^2 \) = T \/ d$, so
  $ Pr { R < 1 \/ 2 } lt.eq frac(4 T, 3 d) lt.eq 1 / 3 . $
  On the complementary event, an output ball of radius $epsilon.alt$ intersecting that residual sphere is contained in a ball of radius $2 epsilon.alt$ centered at a residual-sphere point. Rescaling by $R gt.eq 1 \/ 2$ and applying Lemma 3 bounds conditional success by $\( 4 epsilon.alt \)^(d - T - 1)$. The learner’s remaining randomness has no further signal information after all data are given, so the same estimate holds after averaging its output. Thus success is at most
  $ 1 / 3 + \( 2 \/ 5 \)^(3 d \/ 4 - 1) < 3 / 5 $
  for large $d$, a contradiction. This argument includes $T = 0$, when the residual sphere is the original unit sphere. ◻
]

#thm([Lemma 8.3.])[
  (Residual information in a successful state).  #emph[Let $S tilde.op sigma$, let $V$ be a finite state jointly distributed with $S$, and let $G$ have $0 lt.eq k < d - 1$ independent standard Gaussian rows, independently of $\( S \, V \)$. Suppose a unit-vector output is drawn from a kernel of $V$ alone and has angular success probability at least $p$ at accuracy $epsilon.alt > 0$. Let $R$ be the radius of the conditional sphere of $S$ given $\( G \, G S \)$. If 
$ 0 < rho lt.eq 1 \, #h(2em) 2 epsilon.alt < rho \, #h(2em) Pr { R < rho } lt.eq eta < p \, $

 then 
#[#set math.equation(numbering: n => "(114)")
 $ I \( S \; V divides G \, G S \) gt.eq \( p - eta \) \( d - k - 1 \) log frac(rho, 2 epsilon.alt) - log 2 . $ <eq:r-residual-terminal>]

 For $rho < 1$, one available bad-radius bound is 
#[#set math.equation(numbering: n => "(115)")
 $ Pr { R < rho } lt.eq frac(k, d \( 1 - rho^2 \)) . $ <eq:r-residual-markov>]

]
] <lem:r-residual-terminal>

#proof[
  Let $Q$ preserve the side-data marginal $\( G \, G S \)$ and the conditional marginals of $S \, V$ given those data, while making $S$ and $V$ conditionally independent. Apply the same state-output kernel under both laws. Their relative entropy, including the output, is $I \( S \; V divides G \, G S \)$.
  The event of angular success and $R gt.eq rho$ has actual probability at least $p - eta$. Under $Q$, condition also on the output. The residual signal remains uniform on its sphere in the kernel of $G$, independently of the output. Angular success implies Euclidean error at most $epsilon.alt$. If the corresponding output ball intersects the residual sphere, centering it at one point of the intersection enlarges its radius to at most $2 epsilon.alt$. Rescaling the residual sphere to unit radius and applying Lemma 3 bounds the conditional success probability by $\( 2 epsilon.alt \/ rho \)^(d - k - 1)$.
  For any event with actual probability $a$ and reference probability at most $b$, where $0 < b lt.eq 1$, binary relative entropy and data processing give
  #[#set math.equation(numbering: n => "(116)")
   $ D \( P bar.v.double Q \) gt.eq a log \( 1 \/ b \) - log 2 . $ <rlevels:binary-kl>]
  Indeed the binary entropy of $a$ is at most $log 2$. Applying this inequality to the preceding event proves (114). Finally (113) gives $bb(E) \( 1 - R^2 \) = k \/ d$; Markov’s inequality proves (115). ◻
]

We now apply the comparisons to these extended states. The critical-radius, density-level, and hybrid comparisons use an entropy bound for the outgoing state; the fiber comparison uses its number of values. The same width bound supplies both hypotheses. Each route retains its own auxiliary dimension and terminal residual-sphere estimate.

=== 8.3 The critical-radius comparison <subsec:r-critical-application>

#thm([Theorem 8.4.])[
  (Streaming consequence of the critical radius).  #emph[Let $M \( d \)$ be a nonnegative integer sequence with $M \( d \) = o \( d^2 \)$, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$. For each $d$, consider a learner in Definition 1 with deterministic finite horizon $T \( d \)$. If its uniform-sphere angular success probability, including all learner randomness, is at least $3 \/ 5$, then 
$ T \( d \) gt.eq c thin d log frac(1, epsilon.alt \( d \)) $

 for an absolute $c > 0$ and all sufficiently large $d$. The eventual dimension threshold may depend on the memory sequence.]
] <thm:r-critical-streaming>

#proof[
  Use Lemma 2 with $p_0 = 3 \/ 5$, and then Lemma 25. The resulting fixed-seed uniform-prior experiment retains success at least $3 \/ 5$, the conditional initial-state law, the same state bound, and the same horizon. Transition and terminal output randomness remain fresh.
  Put $L = log \( 1 \/ epsilon.alt \) gt.eq log 10$. The branch $T gt.eq d L$ already has the desired order. On $T < d L$, Lemma 26 gives padded states of entropy at most $H_(*) = M log 2 + log \( T + 2 \) lt.eq d^2$ eventually. In particular its output-capacity estimate specializes to
  #[#set math.equation(numbering: n => "(117)")
   $ 3 / 5 lt.eq \( T + 1 \) 2^M epsilon.alt^(d - 1) . $ <eq:r-critical-output-capacity>]
  Use $B = ceil.l T \/ m ceil.r$ full padded blocks, where $m = floor.l d \/ 10 floor.r$ as in (16).
  For a boundary state $U$, define
  $ J \( U \) = I \( S \; U divides G \, G S \) $
  with an independent $ell$-row matrix $G$, $ell = floor.l d \/ 2 floor.r$, sampled independently of the pair $\( S \, U \)$. In a block, write $U \, W$ for the entering and exiting states and $A$ for its $m$ rows. The matrix $A$ is independent of $\( S \, U \)$. Append an independent $r = ell - m$ row matrix $C$ and set $G = \( A \; C \)$. In the aligned experiment $\( G \, G S \)$ reveals the entire exact block data $\( A \, A S \)$. Conditional on these data and $U$, the block transition has no further dependence on $S$. Conditional data processing therefore gives
  $ I_1 \( S \; W divides G \, G S \) lt.eq I_1 \( S \; U divides G \, G S \) = J \( U \) . $
  The equality uses independence of $G$ from the pair $\( S \, U \)$. Theorem 10, applied to the outgoing state with $H \( W \) lt.eq H_(*) lt.eq d^2$, yields
  $ J \( W \) lt.eq J \( U \) + K d . $
  The initial padded state $overline(U)_0$ is independent of $S$, and its auxiliary matrix is independent of $\( S \, overline(U)_0 \)$, so $J \( overline(U)_0 \) = 0$. Iteration gives for the final padded state $W_f$
  #[#set math.equation(numbering: n => "(118)")
   $ J \( W_f \) lt.eq K d ⌈T / m⌉ . $ <eq:r-critical-iteration>]
  We next lower-bound that final information. Conditional on $\( G \, G S \)$, the row-space projection of $S$ is determined and the residual direction is uniform in $ker G$. If $a = d - ell$, its radius $R$ has the marginal representation
  $ R^2 =^(upright("law")) frac(X, X + Y) \, #h(2em) X tilde.op chi_a^2 \, quad Y tilde.op chi_ell^2 $
  with independent $X \, Y$. This follows by normalizing a standard Gaussian vector. Since $a gt.eq d \/ 2$, the events $X gt.eq 0.75 a$ and $X + Y lt.eq 1.4 d$ imply $R gt.eq 1 \/ 2$. Chebyshev’s inequality, using variances $2 a$ and $2 d$, gives
  #[#set math.equation(numbering: n => "(119)")
   $ bb(P) { R < 1 \/ 2 } lt.eq 32 / a + frac(25, 2 d) = O \( 1 \/ d \) . $ <eq:r-critical-radius-tail>]
  For sufficiently large $d$, the radius tail in (119) leaves success probability at least $1 \/ 2$ on $R gt.eq 1 \/ 2$. Apply Lemma 27 with $rho = 1 \/ 2$ and that tail bound. It gives
  #[#set math.equation(numbering: n => "(120)")
   $ J \( W_f \) gt.eq frac(a - 1, 2) #scale(x: 120%, y: 120%)[\(] L - log 4 #scale(x: 120%, y: 120%)[\)] - log 2 gt.eq c_0 d L $ <eq:r-critical-required-information>]
  for an absolute $c_0 > 0$ and all sufficiently large $d$. This is uniform over $L gt.eq log 10$, because
  $ L - log 4 gt.eq (1 - frac(log 4, log 10)) L > 0 . $
  The common stopping reduction gives $T > d \/ 4 gt.eq m$, so $ceil.l T \/ m ceil.r lt.eq 2 T \/ m$. Equation (118) is therefore an $O \( T \)$ upper bound. Comparing it with (120) proves $T gt.eq c d L$ uniformly over the stated accuracies. ◻
]

=== 8.4 The density-level comparisons <rlevels:endpoints>

We apply both comparisons to Definition 1. Assume that the original uniform-prior experiment has angular success probability at least $2 \/ 3$, that $0 < epsilon.alt lt.eq 1 \/ 10$, and that $M = M \( d \) = o \( d^2 \)$; $T$ is its deterministic finite horizon. Put $L = log \( 1 \/ epsilon.alt \) gt.eq log 10$. A worst-signal success premise of $2 \/ 3$ first implies this uniform-prior premise by integration.

Apply Lemma 2 to the original jointly measurable experiment with $p_0 = 2 \/ 3$. Fix a seed $xi$ for which (1) holds and conditional success is at least $2 \/ 3$, retain $cal(L) \( U_0 divides Xi = xi \)$, and then apply Lemma 25. These reductions preserve the fixed-seed uniform-prior joint law, the state bound, and the horizon. All learner statements in this subsection concern that experiment. We prove $T gt.eq c d L$ for an absolute $c > 0$ in all sufficiently large dimensions; the eventual threshold may depend on the memory sequence.

For completeness, (116) applied to success under the product signal/output law and Lemma 3 give the unconditional bound

#[#set math.equation(numbering: n => "(121)")
 $ I \( S \; hat(S) \) gt.eq 2 / 3 \( d - 1 \) L - log 2 . $ <rlevels:output-information>]

Restrict to $T < d L$. Lemma 26 provides absorbing padded states, a state-only terminal output, data-independent initial state $overline(U)_0$, and fresh future blocks. Its clock bound implies, in particular,

#[#set math.equation(numbering: n => "(122)")
 $ L lt.eq C frac(M + 1 + log d, d) \, #h(2em) T = O \( M + d \) \, #h(2em) H_(*) := M log 2 + log \( T + 2 \) = o \( d^2 \) . $ <rlevels:clock>]

The lemma also gives

#[#set math.equation(numbering: n => "(123)")
 $ T > d \/ 4 . $ <rlevels:linear>]

Both comparisons below use this padded learner. Their auxiliary matrices and block lengths remain distinct.

For the one-level comparison, return to (30) and use $B_(upright("one")) = ceil.l T \/ k ceil.r$ padded blocks. In a block let $Z$ and $U$ be the entering and exiting states. The next matrix $X$ is independent of the pair $\( S \, Z \)$. Draw $B$ independently of $\( S \, Z \, X \, U \)$, and put $G = \( X \; B \)$ as in Proposition 13. Conditional on $\( G \, G S \)$, the entire block data $\( X \, X S \)$ are known. The transition kernel from $Z$ to $U$ then has no additional dependence on $S$. Conditional data processing gives

$ tilde(cal(D)) \( U \) lt.eq I_(upright("act")) \( S \; Z divides G \, G S \) = cal(D) \( Z \) \, $

where the equality uses independence of $G$ from $\( S \, Z \)$. By (122), $H \( U \) lt.eq H_(*) lt.eq d^2$ eventually, so Proposition 13 costs at most $C d$ per block. The initial boundary $overline(U)_0$ is independent of $S$, and its auxiliary $G$ is independent of the pair $\( S \, overline(U)_0 \)$; hence $cal(D) \( overline(U)_0 \) = 0$, and

#[#set math.equation(numbering: n => "(124)")
 $ cal(D) \( U_f \) lt.eq C d B_(upright("one")) $ <rlevels:one-recurrence>]

for the final padded state.

Take the independent $m$-row matrix in the definition of $cal(D)$. Its residual radius $R$ satisfies

$ Pr { R < 1 \/ 2 } lt.eq frac(m \/ d, 3 \/ 4) lt.eq 1 / 3 . $

Lemma 27, with $p = 2 \/ 3$, $rho = 1 \/ 2$, and $eta = 1 \/ 3$, now gives

#[#set math.equation(numbering: n => "(125)")
 $ cal(D) \( U_f \) gt.eq frac(d - m - 1, 3) \( L - log 4 \) - log 2 gt.eq c_0 d L $ <rlevels:one-endpoint>]

for an absolute $c_0 > 0$ in sufficiently large dimension. The final inequality is uniform for $L gt.eq log 10 > log 4$. Since $T > d \/ 4 gt.eq k$, the common raw-data bound makes $ceil.l T \/ k ceil.r lt.eq 2 T \/ k$. Hence (124) is $O \( T \)$, and comparison with (125) proves $T gt.eq c d L$.

For the two-label comparison, use (43) and $B_(upright("two")) = ceil.l T \/ n ceil.r$ padded batches. Let $V_i$ be the state after $i$ batches. At a batch the incoming $A$ is independent of $\( S \, V_i \)$, and $B$ is independent of the whole actual experiment. Apply Proposition 14 to the outgoing state $V_(i + 1)$; the required entropy bound follows from (122) on the branch $T < d L$. Given $\( D \, D S \)$, the exact batch $\( A \, A S \)$ is known, so the update is conditionally a channel from $V_i$ without further access to $S$. Therefore

$ cal(J) \( V_(i + 1) \) lt.eq I_(upright("act")) \( S \; V_(i + 1) divides D \, D S \) + C d lt.eq I_(upright("act")) \( S \; V_i divides D \, D S \) + C d = cal(J) \( V_i \) + C d . $

The last equality uses independence of $D$ from $\( S \, V_i \)$. Set $V_0 = overline(U)_0$. It is independent of $S$, and its auxiliary $G$ is independent of the pair $\( S \, V_0 \)$; hence $cal(J) \( V_0 \) = 0$. Iteration gives

#[#set math.equation(numbering: n => "(126)")
 $ cal(J) \( V_(B_(upright("two"))) \) lt.eq C d B_(upright("two")) lt.eq C' \( T + d \) . $ <rlevels:two-recurrence>]

For the independent $k$-row matrix defining $cal(J)$, (115) at $rho = 1 \/ 4$ gives

$ Pr { R < 1 \/ 4 } lt.eq 16 / 15 k / d lt.eq 8 / 15 . $

Apply Lemma 27 with $p = 2 \/ 3$ and $eta = 8 \/ 15$. It gives

#[#set math.equation(numbering: n => "(127)")
 $ cal(J) \( V_(B_(upright("two"))) \) gt.eq 2 / 15 \( d - k - 1 \) \( L - log 8 \) - log 2 . $ <rlevels:two-endpoint>]

This is at least $c d L$ uniformly for $L gt.eq log 10$, since $L - log 8 gt.eq \( 1 - log 8 \/ log 10 \) L > 0$ and $d - k - 1 gt.eq d \/ 3$. The upper bound (126) is $O \( T \)$ by $T > d \/ 4$. This proves $T gt.eq c d L$; the discarded branch $T gt.eq d L$ already has the same order.

In both arguments the auxiliary rows are analysis variables. The learner receives only its prescribed fresh Gaussian stream with exact labels, and the comparisons permit arbitrary computation within a transition subject to the persistent finite-state restriction.

=== 8.5 The hybrid comparison: stopping and terminal information <subsec:r-hybrid-application>

The averaged block estimate combines with the common stopping reduction. We need a terminal information bound uniform over the auxiliary row counts in that average.

#thm([Lemma 8.5.])[
  (Information in a successful terminal state).  #emph[Let $V$ be a padded final state whose unit-vector output has uniform-prior angular success at least $2 \/ 3$ at $0 < epsilon.alt lt.eq 1 \/ 10$. For every $k_0 lt.eq k lt.eq k_1$, 
#[#set math.equation(numbering: n => "(128)")
 $ J_k \( V \) gt.eq frac(d - k - 1, 14) log frac(1, 5 epsilon.alt) - log 2 . $ <rhyb:terminal-information>]

]
] <rhyb:terminal>

#proof[
  For every $k_0 lt.eq k lt.eq k_1$, the auxiliary matrix has $k lt.eq d \/ 2$ rows. At $rho = 2 \/ 5$, (115) therefore gives
  $ Pr { R < 2 \/ 5 } lt.eq frac(k \/ d, 1 - 4 \/ 25) lt.eq 25 / 42 . $
  The success probability is at least $2 \/ 3$, and $2 \/ 3 - 25 \/ 42 = 1 \/ 14$. Lemma 27 now gives (128), because $rho \/ \( 2 epsilon.alt \) = 1 \/ \( 5 epsilon.alt \)$. Its radius condition holds for $epsilon.alt lt.eq 1 \/ 10$. ◻
]

#thm([Theorem 8.6.])[
  (Precision lower bound from hybrid projections).  #emph[Let $M \( d \)$ be a nonnegative integer sequence with $M \( d \) = o \( d^2 \)$, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$. For each $d$, consider a learner in Definition 1 with memory bound $M \( d \)$, accuracy $epsilon.alt \( d \)$, deterministic horizon $T \( d \) gt.eq 0$, and uniform prior on $S^(d - 1)$. If 
$ bb(P) { angle \( hat(S) \, S \) lt.eq epsilon.alt \( d \) } gt.eq 2 / 3 \, $

 then 
$ T \( d \) gt.eq c thin d log frac(1, epsilon.alt \( d \)) $

 for all sufficiently large $d$. The constant $c > 0$ is absolute; the dimension threshold may depend on the memory sequence.]
] <rhyb:conclusion>

#proof[
  Apply Lemma 2 with $p_0 = 2 \/ 3$ to the original jointly measurable experiment. Fix a seed satisfying (1) with conditional uniform-prior success at least $2 \/ 3$, retain its conditional initial-state law, and then apply Lemma 25. The fixed-seed joint experiment, state bound, and horizon are preserved.
  Put $b = log \( 1 \/ epsilon.alt \)$. In dimensions with $T > d b$, the conclusion already holds. In the remaining dimensions, Lemma 26 permits padding with $W = \( T + 2 \) 2^M$ states and $B = log W = o \( d^2 \)$, so eventually $B lt.eq d^2$. Break the padded computation into blocks of $h_0$ observations, with a shorter final block if necessary. The initial padded state $overline(U)_0$ is independent of $S$, and the side matrix is independent of the pair $\( S \, overline(U)_0 \)$. Thus $J_k \( overline(U)_0 \) = 0$ for every $k$, and its averaged potential is zero. Proposition 15 gives
  $ overline(J) \( V_(upright("final")) \) lt.eq C d ⌈T / h_0⌉ lt.eq C' \( T + d \) lt.eq C'' T . $
  The last inequality uses the independent bound $T > d \/ 4$ from Lemma 26; thus it also covers a shorter last block.
  Lemma 29 gives the opposite bound for every $k$ in the average. Since $k lt.eq d \/ 2$ and $b gt.eq log 10$,
  $ log frac(1, 5 epsilon.alt) = b - log 5 gt.eq frac(log 2, log 10) thin b . $
  The right side of (128) is consequently at least $c' d b$ for all sufficiently large $d$, uniformly over the allowed accuracies. Comparing the two bounds proves $T gt.eq c d b$. The dimensions with $T > d b$ were already covered. ◻
]

If a learner succeeds for every unit signal with probability at least $2 \/ 3$, it also satisfies the uniform-prior hypothesis, so the theorem applies to that worst-signal guarantee. The shared-seed case is covered by the joint-independence reduction at the start of the proof, which retains fresh randomized transition and output kernels. The proof uses exact labels and imposes no linearity or within-transition precision restriction.

=== 8.6 The finite Gaussian-fiber comparison <subsec:r-fiber-application>

We apply Proposition 21 to Definition 1, including its common notation $Xi \, U_0 \, \( X_t \)_(t gt.eq 1)$. This route also fixes the remaining randomness after choosing the seed, so its terminal count uses a deterministic decoder.

#thm([Corollary 8.7.])[
  (Uniform-sphere sample lower bound).  #emph[Let $M \( d \) gt.eq 0$ be integer-valued with $M \( d \) = o \( d^2 \)$, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$. Suppose learners in Definition 1, with $S tilde.op sigma$, satisfy 
$ Pr { arccos chevron.l hat(S) \, S chevron.r lt.eq epsilon.alt \( d \) } gt.eq 2 \/ 3 \, $

 where the probability includes the signal, rows, and learner randomness. Then 
$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

 for an absolute $c > 0$ and all sufficiently large $d$. The eventual dimension threshold may depend on the memory sequence.]
] <rfib:streaming>

#proof[
  Apply Lemma 2 with $p_0 = 2 \/ 3$ to the original jointly measurable uniform-prior experiment. Fix a seed $xi$ satisfying (1) whose conditional success is at least $2 \/ 3$, and retain the conditional initial-state law. Then apply Lemma 25 in that fixed-seed experiment. In particular all global Borel routing extensions are fixed before (92) and the finite measure $Q$ are formed. The two-point identity applies to those Borel functions without transferring a null set from the real observation law to a perpendicular row law.
  On a product extension of this fixed-seed experiment, choose an array $cal(R)$ of independent uniform random variables consisting of $R_t$, $0 lt.eq t lt.eq T$, and $R_(t \, j)^(upright("out"))$, $0 lt.eq t lt.eq T$, $1 lt.eq j lt.eq 2^M$. Choose the whole array independently of $\( U_0 \, S \, \( X_t \)_(t gt.eq 1) \)$. The factorization (1) then implies that the complete conditional choice vector $\( U_0 \, cal(R) \)$ is independent of $\( S \, \( X_t \)_(t gt.eq 1) \)$.
  Enumerate each finite state alphabet by slots $j lt.eq 2^M$. Use $R_0$ for a stopping choice before the first sample and, at time $t gt.eq 1$, use $R_t$ to realize the joint next-state and stopping outcome by the inverse distribution function of its finite probability row. Use $R_(t \, j)^(upright("out"))$ to realize the unit-vector output kernel at terminal pair $\( t \, j \)$. Such a realization can be chosen Borel for a probability kernel on the standard Borel sphere, by mapping the sphere into a Borel subset of $\[ 0 \, 1 \]$ and using an inverse distribution function. The resulting fixed-seed experiment is jointly measurable and has the same conditional law as the Borel learner.
  Its success probability averaged over $\( U_0 \, cal(R) \)$ is at least $2 \/ 3$. Fubini and averaging give a complete realization with uniform-prior success at least $3 \/ 5$. Fix it. The initial state, all transition and stopping rules, and all terminal outputs are now deterministic. Independence of the complete choice vector leaves the joint law of the signal and all rows unchanged. Thus the complete vector $\( xi \, U_0 \, cal(R) \)$, including the seed and initialization, is fixed before any state comparison. Its unused entries add no persistent learner state.
  Put $X_(*) = d log \( 1 \/ epsilon.alt \)$, and restrict to $T < X_(*)$. Apply Lemma 26 to the fixed decoder with success at least $3 \/ 5$. Its output count gives
  #[#set math.equation(numbering: n => "(129)")
   $ \( d - 1 \) log \( 1 \/ epsilon.alt \) lt.eq M log 2 + log \( T + 1 \) + log \( 5 \/ 3 \) . $ <rfib:output-count>]
  The common short-run estimate yields $X_(*) = O \( M + 1 \)$, and the absorbing padded state has width at most
  #[#set math.equation(numbering: n => "(130)")
   $ N & = \( T + 2 \) 2^M \,\
log N & lt.eq M log 2 + log \( X_(*) + 2 \) = O \( M + 1 \) lt.eq d^2 $ <rfib:width>]
  for all sufficiently large $d$. The padded decoder is a function of this state, and rows generated after stopping remain fresh.
  Pad also to $ceil.l T \/ n ceil.r$ full $n$-row blocks. Each block’s row matrix is independent of the pair consisting of the signal and old state, while its labels remain exact. After the complete fixation, the initial padded state is deterministic, so its potential is zero. Iterating Proposition 21 for the padded final state $F$ gives
  #[#set math.equation(numbering: n => "(131)")
   $ Phi \( F \) lt.eq K d ceil.l T \/ n ceil.r . $ <rfib:iteration>]
  For a lower bound use the independent $k$-row matrix in $Phi \( F \)$. Equation (115) gives
  $ Pr { R < 1 \/ 2 } lt.eq frac(4 k, 3 d) lt.eq 4 / 9 . $
  The fixed decoder has success at least $3 \/ 5$. Apply Lemma 27 with $p = 3 \/ 5$, $rho = 1 \/ 2$, and $eta = 4 \/ 9$, and write $p_0 = 3 \/ 5 - 4 \/ 9 > 0$. It gives
  #[#set math.equation(numbering: n => "(132)")
   $ Phi \( F \) & gt.eq p_0 \( d - k - 1 \) log \( 1 \/ \( 4 epsilon.alt \) \) - log 2\
 & gt.eq c thin d log \( 1 \/ epsilon.alt \) $ <rfib:terminal>]
  for sufficiently large $d$. The constant is absolute because $d - k - 1 gt.eq d \/ 2$ and $log \( 1 \/ \( 4 epsilon.alt \) \) gt.eq \( 1 - log 4 \/ log 10 \) log \( 1 \/ epsilon.alt \)$ on the stated accuracy range.
  Finally, Lemma 26 gives $T > d \/ 4 gt.eq n$, including the exclusion of $T = 0$. Hence $ceil.l T \/ n ceil.r lt.eq 2 T \/ n$, and $d \/ n$ is absolutely bounded for large $d$. The upper bound (131) is therefore $O \( T \)$. Combining it with (132) proves the corollary. ◻
]

If a learner has angular success at least $2 \/ 3$ for every fixed signal, averaging that guarantee over the uniform sphere supplies the hypothesis of Corollary 31. It therefore gives the same lower bound with the stated worst-signal premise.

#heading(level: 1)[References]
#bibitem([1])[Tim Austin. Multi-variate correlation and mixtures of product measures. #emph[Kybernetika], 56(3):459--499, 2020. #link("https://doi.org/10.14736/kyb-2020-3-0459")[doi:10.14736/kyb-2020-3-0459].]
#bibitem([2])[Yuval Dagan, Gil Kur, and Ohad Shamir. Space lower bounds for linear prediction in the streaming model. In #emph[Proceedings of the Thirty-Second Conference on Learning Theory], Proceedings of Machine Learning Research 99, pages 929--954, 2019. #link("https://proceedings.mlr.press/v99/dagan19b.html"). Theorem 3 and Theorem 10 locators refer to this published PMLR version.]
#bibitem([3])[Paul Dupuis and Yixiang Mao. Formulation and properties of a divergence used to compare probability measures without absolute continuity. #emph[ESAIM: Control, Optimisation and Calculus of Variations], 28, Article 10, 2022. #link("https://doi.org/10.1051/cocv/2022002")[doi:10.1051/cocv/2022002].]
#bibitem([4])[Pertti Mattila. Hausdorff dimension, orthogonal projections and intersections with planes. #emph[Annales Academiae Scientiarum Fennicae, Series A I, Mathematica], 1(2):227--244, 1975. #link("https://doi.org/10.5186/aasfm.1975.0110")[doi:10.5186/aasfm.1975.0110].]
#bibitem([5])[OpenAI. Localization costs and information growth for exact Gaussian observations. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Localization-costs-and-information-growth-for-exact-Gaussian-observations-September-27-2026/paper.pdf")[OAI:Localization-costs-and-information-growth-for-exact-Gaussian-observations-September-27-2026], 2026.]
#bibitem([6])[Ran Raz. Fast learning requires good memory: A time-space lower bound for parity learning. arXiv:1602.05161v1, 16 February 2016. #link("https://arxiv.org/abs/1602.05161v1").]
#bibitem([7])[Ran Raz. A time-space lower bound for a large class of learning problems. In #emph[Proceedings of the 58th Annual IEEE Symposium on Foundations of Computer Science], pages 732--742, 2017. #link("https://doi.org/10.1109/FOCS.2017.73")[doi:10.1109/FOCS.2017.73]. Theorem and section locators refer to ECCC Report TR17-020, 12 February 2017: #link("https://eccc.weizmann.ac.il/report/2017/020/").]
#bibitem([8])[Daniel Russo and James Zou. Controlling bias in adaptive data analysis using information theory. In #emph[Proceedings of the 19th International Conference on Artificial Intelligence and Statistics], Proceedings of Machine Learning Research 51, pages 1232--1240, 2016. #link("https://proceedings.mlr.press/v51/russo16.html").]
#bibitem([9])[Vatsal Sharan, Aaron Sidford, and Gregory Valiant. Memory-sample tradeoffs for linear regression with small error. In #emph[Proceedings of the 51st Annual ACM SIGACT Symposium on Theory of Computing], pages 890--901, 2019. #link("https://doi.org/10.1145/3313276.3316403")[doi:10.1145/3313276.3316403]. Theorem and section locators refer to the full version arXiv:1904.08544v2, 10 October 2020: #link("https://arxiv.org/abs/1904.08544v2").]
#bibitem([10])[Jacob Steinhardt and John Duchi. Minimax rates for memory-bounded sparse linear regression. In #emph[Proceedings of the 28th Conference on Learning Theory], Proceedings of Machine Learning Research 40, pages 1564--1587, 2015. #link("https://proceedings.mlr.press/v40/Steinhardt15.html").]
#bibitem([11])[Tim van Erven and Peter Harremoës. Rényi divergence and Kullback--Leibler divergence. arXiv:1206.2459v2, 24 April 2014. #link("https://arxiv.org/abs/1206.2459v2"). Theorem and equation locators refer to this version.]
#bibitem([12])[Aolin Xu and Maxim Raginsky. Information-theoretic analysis of generalization capability of learning algorithms. In #emph[Advances in Neural Information Processing Systems] 30, pages 2524--2533, 2017. #link("https://papers.nips.cc/paper_files/paper/2017/hash/ad71c82b22f4f65b9398f76d8be4c615-Abstract.html").]


