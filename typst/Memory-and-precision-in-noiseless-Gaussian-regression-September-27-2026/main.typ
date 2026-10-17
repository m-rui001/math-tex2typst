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

#align(center)[#text(size: 16pt, weight: "bold")[Memory and precision in noiseless Gaussian regression]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Exact observations and finite memory <h:introduction>

An exact linear equation carries arbitrarily fine information. Indeed, $d$ independent Gaussian equations determine an unknown vector in $bb(R)^d$ almost surely if all the equations can be retained. A learner that reads the equations once and remembers only a finite state faces a different problem. Increasing the required accuracy can force it to read more equations even when every equation is noiseless.

#prodef([Definition 1.1.])[
  (Finite-state Gaussian regression).  Fix integers $d gt.eq 2$, $M gt.eq 0$, and $T gt.eq 0$. A data-independent shared seed may choose the learner’s rules; the descriptions of its transitions and output below are conditional on that seed. A signal $s in S^(d - 1)$ is chosen before sampling. At sample index $t in { 1 \, dots.h \, T }$, the observation is
  $ x_t tilde.op N \( 0 \, I_d \) \, #h(2em) y_t = chevron.l x_t \, s chevron.r \, $
  where the rows $x_1 \, dots.h \, x_T$ are independent. A learner reads the pairs once, in order. After each number of samples its persistent state belongs to a prescribed set of at most $2^M$ elements. The initial state and shared seed are jointly independent of the signal and all rows, but may depend on each other. Conditional on the seed and state, a transition may use the entire current pair and fresh randomness, with unrestricted computation, but only the next finite state is retained.
  The learner may stop, including before the first sample, but must stop by the prescribed deterministic finite horizon $T$. At a stopping index its unit output $hat(s) in S^(d - 1)$ is generated from the terminal state, the stopping index, and fresh randomness only. In particular, a discarded observation cannot be read again by the output rule. The transitions and stopping rules may depend on $d$, the requested accuracy $epsilon.alt$, and the index, but not on $s$.
  The experiment must be jointly measurable in the signal, the complete pre-generated rows, the shared seed, the initial state, and all fresh transition and output randomness. Conditional on the seed, each fixed state/index transition and stopping probability must be Borel in $\( x \, y \)$, or measurable in the completion of $lambda_1 \( d x \, d y \) = gamma_1 \( d x \) thin d y$, where $gamma_1$ is standard Gaussian probability on $bb(R)^d$. Fresh randomness supplies no information about the signal or samples beyond the permitted rule arguments. Accuracy means
  $ arccos chevron.l hat(s) \, s chevron.r lt.eq epsilon.alt . $
] <h:model>

The state bound measures bits, not real registers. The rules can be nonuniform in the dimension and sample index, and randomization is allowed both in choosing the rules and during the run. The model fixes the rows in advance through their independent Gaussian law: it does not allow a learner to choose a row or revisit an earlier one.

Write $sigma_d$ for uniform probability on $S^(d - 1)$. Our main statement assumes success only after averaging over this prior.

#thm([Theorem 1.2.])[
  (Memory and precision).  #emph[For every fixed finite $A > 0$, there are constants $c_A > 0$ and $d_A$ such that the following holds. Let $d gt.eq d_A$, let $0 lt.eq M lt.eq A d^2$ be an integer, and let $0 < epsilon.alt lt.eq 1 \/ 10$. For any learner in Definition 1, draw $S tilde.op sigma_d$ independently of the rows and the learner’s data-independent randomness. If 
$ bb(P) { arccos chevron.l hat(s) \, S chevron.r lt.eq epsilon.alt } gt.eq 2 / 3 \, $

 then its prescribed horizon satisfies 
$ T gt.eq c_A thin d log \( 1 \/ epsilon.alt \) . $

]
] <h:main>

Here and throughout the paper logarithms are natural unless a base is shown. The constants in Theorem 2 may depend on the fixed number $A$. The statement makes no uniform claim when $A = A \( d \)$ tends to infinity. No relation between $epsilon.alt$ and $M$ is assumed.

#thm([Corollary 1.3.])[
  (Subquadratic memory).  #emph[Let $M \( d \) gt.eq 0$ be integer-valued with $M \( d \) = o \( d^2 \)$, and let $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$ be any accuracy sequence. A family of learners in Definition 1 with uniform-sphere average success at least $2 \/ 3$ satisfies 
$ T \( d \) gt.eq c thin d log \( 1 \/ epsilon.alt \( d \) \) $

 for all sufficiently large $d$, where $c > 0$ is absolute. The dimension threshold may depend on the memory sequence.]
] <h:subquadratic>

#thm([Corollary 1.4.])[
  (A guarantee for every signal).  #emph[The conclusions of Theorem 2 and Corollary 3 also hold when their average-success assumption is replaced by 
$ bb(P) { arccos chevron.l hat(s) \, s chevron.r lt.eq epsilon.alt } gt.eq 2 / 3 #h(2em) upright("for every ") s in S^(d - 1) \, $

 where this probability is over the rows and the learner’s randomness.]
] <h:worst-signal>

The every-signal consequence follows by averaging the same learner over $sigma_d$; it does not say that every individual signal is hard for every learner. We prove Theorem 2 and both corollaries after completing the backward argument in Section 6.

===== 1.1 The original experiment and measurable versions. <the-original-experiment-and-measurable-versions.>

All success probabilities refer to the original jointly measurable experiment. Joint independence of the initial state and seed from the signal and rows permits conditioning on the seed without changing the prior or supplying information through initialization. Section 5 replaces completed-measurable rules by Borel versions separately for almost every seed, preserving the corresponding prior success probabilities. Their average is taken in the original experiment; no jointly measurable choice of all these versions is assumed.

=== 1.1 The precision problem and its predecessors <the-precision-problem-and-its-predecessors>

Memory constraints in statistical learning were studied before this precision question. Shamir’s finite-message framework included bounded-memory online processing as a special case #cite(label("Shamir2014")) Section 2, Definition 1. In its general form a protocol may retain an entire transcript, so its per-message budget is not a bound on total persistent memory. Steinhardt and Duchi proved memory-dependent minimax risk bounds for sparse noisy regression #cite(label("SteinhardtDuchi2015")) Section 1.1, Equation (2). Their hard family uses positive noise and a different covariate distribution. These works established that information retained from earlier samples can be a statistical resource in its own right.

Steinhardt, Valiant, and Wager connected memory, communication, and statistical queries, and formulated a quadratic-memory versus exponential-sample question for parity learning #cite(label("SVW2016")) Section 1.1, Conjecture 1. Raz proved the qualitative separation for parity #cite(label("Raz2016")) Theorem 1 and Remark 1.1 and developed a spectral method for a wider class of learning problems #cite(label("Raz2017")). The qualifier #emph[qualitative] matters: Raz’s theorem and the published conjecture have different numerical memory coefficients. These discrete results explain the usefulness of finite-width computation models, but they do not supply an estimate for exact real-valued observations.

Among the sources discussed here, the closest continuous-regression comparison is due to Sharan, Sidford, and Valiant #cite(label("SSV2019")). Their Theorem 1 uses independent $N \( 0 \, I_d \)$ covariates, a fixed unit target, and independent uniform additive noise of half-width $2^(- d \/ 5)$. With at most $d^2 \/ 4$ bits and Euclidean accuracy $epsilon.alt = d^(- r)$, it gives an $Omega \( d log r \)$ sample lower bound for $r$ from a sufficiently large absolute constant up to order $d \/ log d$, in the range stated there. Their proof experiment draws the target uniformly on the sphere and averages over it and the samples #cite(label("SSV2019")) Section 2. Their nonuniform finite-width layered program is a predecessor of the model above; the measurable randomized rules and bounded stopping used here are handled directly in Section 5.

The observation law is the important difference. A lower bound with additive noise does not by itself bound the more informative exact experiment. Theorem 2 treats the exact-observation precision question for isotropic Gaussian rows. Section 1.1 of #cite(label("SSV2019")) asks whether the first-order sample dependence on precision is optimal under bounded memory. This is distinct from its separate condition-number conjecture for ill-conditioned Gaussian laws and constant Euclidean accuracy in #cite(label("SSV2019")) Section 1.1.

Dagan, Kur, and Shamir obtained related quadratic-space obstructions for two other linear-prediction tasks #cite(label("DKS2019")). Their published Theorem 3 asks for a unit approximate null vector of independent Gaussian rows. Their Theorem 10 asks for small empirical residual on a finite random-order system built from jointly conditioned sphere rows and one fixed equation. These are different targets and observation laws from the fixed-signal stream considered here.

===== 1.1.1 A consequence for the noisy experiment. <a-consequence-for-the-noisy-experiment.>

Theorem 2 implies an $Omega_A \( d r log d \)$ sample lower bound in the noisy Gaussian experiment of Sharan, Sidford, and Valiant #cite(label("SSV2019")), for every fixed finite $A > 0$, memory $M lt.eq A d^2$, and Euclidean accuracy $e = d^(- r)$ in their fine-accuracy range described above, for sufficiently large $d$. Here success is at least $2 \/ 3$ averaged over the uniform-sphere target, and learners retain the state, deterministic-horizon, randomness, and joint and per-seed measurability conventions of Definition 1, with a terminal estimate $V in bb(R)^d$ depending only on the terminal state, stopping index, and fresh randomness. An exact-observation learner generates the prescribed independent uniform noise inside each current-pair transition and simulates the noisy learner with the same states and horizon. For completed rules, the noisy pair law has a density with respect to $lambda_1$, so the Borel-version and seed-conditioning argument of Section 5 applies before this simulation. On $parallel V - S parallel lt.eq e lt.eq 1 \/ 20$, normalizing $V$ gives angular error at most $arcsin e lt.eq 2 e$; assign any unit output when $V = 0$. Theorem 2 at accuracy $2 e$ therefore gives $T gt.eq c_A d log \( 1 \/ \( 2 e \) \) = Omega_A \( d r log d \)$.

=== 1.2 Why the precision scale is natural <why-the-precision-scale-is-natural>

With real registers, the classical Kaczmarz projection step #cite(label("Kaczmarz1937")), in the form stated by Strohmer and Vershynin #cite(label("SV2009")) Algorithm 1, gives a simple benchmark. Starting with $z_0 = 0$, use

#[#set math.equation(numbering: n => "(1)")
 $ z_t = z_(t - 1) + frac(y_t - chevron.l x_t \, z_(t - 1) chevron.r, ∥x_t∥^2) thin x_t #h(2em) \( x_t eq.not 0 \) \, $ <h:kaczmarz>]

and set $z_t = z_(t - 1)$ on the Gaussian-null event $x_t = 0$. For $u_t = x_t \/ parallel x_t parallel$, the error is multiplied by $I - u_t u_t^(sans(T))$. The direction $u_t$ is fresh and uniform on the sphere, so $bb(E) \( u_t u_t^(sans(T)) \) = I_d \/ d$. Conditional on the previous error,

$ bb(E) #h(-0.16667em) (∥z_t - s∥^2 divides z_(t - 1)) = \( 1 - 1 \/ d \) ∥z_(t - 1) - s∥^2 . $

Induction gives

#[#set math.equation(numbering: n => "(2)")
 $ bb(E) ∥z_t - s∥^2 = \( 1 - 1 \/ d \)^t . $ <h:kaczmarz-contraction>]

This calculation explains the scale $d log \( 1 \/ epsilon.alt \)$ for fresh isotropic observations. Strohmer and Vershynin’s theorem concerns norm-weighted sampling from a fixed finite matrix; the equality above is the separate symmetry calculation for this stream. The displayed update stores real scalars and supplies no finite-bit upper bound.

=== 1.3 A backward proof under the original prior <a-backward-proof-under-the-original-prior>

Conditioning the uniform prior on one raw exact observation almost surely confines the signal to a hyperplane section of the sphere. That conditional law is singular relative to the original spherical measure. We instead keep the original prior fixed and study the probability of future success from a prescribed state.

Start the learner at a chosen state and index, whether or not the state was reached in an actual run. Let $h \( s \)$ be its success probability with signal $s$, using fresh future samples. For a closed Euclidean ball $B \( z \, r \)$, our invariant is

#[#set math.equation(numbering: n => "(3)")
 $ integral_(B \( z \, r \)) h thin d sigma_d lt.eq \( R r \)^(\( d - 1 \) \/ 2) #h(2em) \( z in S^(d - 1) \, med r > 0 \) . $ <h:intro:invariant>]

The number $R$ bounds the concentration of successful signals; it is not a radius supporting a posterior. A terminal output rule has $R = epsilon.alt$. Moving backward across a block of order $d$ observations multiplies $R$ by at most a constant for fixed $M \/ d^2$. Constant average success requires $R$ bounded below, so reaching it from $epsilon.alt$ takes order $log \( 1 \/ epsilon.alt \)$ blocks.

The bound at every radius makes this iteration close. Restrict $h thin d sigma_d$ to a ball $B \( z \, r \)$, without conditioning on reaching a state or dividing by the restricted mass. This finite measure has an ambient ball bound $H t^beta$, with $beta = \( d - 1 \) \/ 2$ and $H$ controlled by $R^beta$. The general projection estimate in Section 3 gives the joint law of a Gaussian matrix and its exact labels an $L^q$ density whose norm is bounded by

$ e^(C d) H r^(beta - m \( 1 - 1 \/ q \)) $

for a block of $m lt.eq q$ rows, where $q$ is proportional to $d$. The density loses a radius power. The volume of the common projected ellipsoid is at most $e^(C d) r^m$, and its power $1 - 1 \/ q$ restores exactly that loss in Hölder’s inequality.

The geometric step controls inverse distances to affine spans, hence an inverse Gram determinant. Local growth and inverse-distance averaging belong to the classical projection methods represented by Mattila #cite(label("Mattila1975")) Lemma 5.1 and Theorem 5.4; the independent-copy expansion and successive orthogonalization have a closer regression predecessor in #cite(label("SSV2019")) Section 7, Lemma 12. We derive the exact multirow density and its quantitative bounds here. Its finite-measure formulation does not require a density relative to spherical area.

Section 4 combines the projection and volume bounds with a second application of Hölder on the $N$ possible destinations. Selection costs $N^(1 \/ q)$, so taking the $\( d - 1 \) \/ 2$-th root in (3) gives the memory contribution $exp \( O \( log N \/ d^2 \) \)$. Section 5 constructs fresh continuation functions, counts only stopping indices within one block, and passes from Borel rules to the full randomized model. Reflection across the span of the observed rows gives the independent constant-accuracy endpoint in Section 6, completing the theorem.

The general projection estimate also applies to a lower-dimensional cube prior on the sphere. That application has its own distributional precision bound; the conclusion throughout the stated accuracy range uses an every-signal guarantee and the separate uniform-sphere endpoint. The appendices give distinct exact-label interfaces, compare coefficient normalizations through one backward bound, and retain a sharper full-data residual estimate.

== 2 Local mass of terminal success <h:local>

At a terminal state, the output law is independent of the unknown signal. A small spherical ball has small uniform mass, and the same is true of the set of signals close to a fixed output. Combining these two facts initializes the bound that will be propagated backward.

Write $sigma = sigma_d$, and let $B \( z \, r \)$ denote a closed Euclidean ball in the ambient space of its center. Vector norms are Euclidean, and $parallel A parallel_(upright("op"))$ is the Euclidean operator norm. Constants denoted by $C$ are positive and absolute and may increase between displays. For the main proof set

#[#set math.equation(numbering: n => "(4)")
 $ n = d - 1 \, #h(2em) a = n / 2 \, #h(2em) q = ⌊n / 8⌋ . $ <h:local:parameters>]

We work in sufficiently large dimension that $q gt.eq 2$, $q gt.eq d \/ 16$, and $a gt.eq d \/ 3$. These are absolute dimension requirements. The real number $a$ is a local-mass exponent, whereas the integer $q$ is a projection-moment order.

For $R > 0$, say that a measurable $h : S^(d - 1) arrow.r \[ 0 \, 1 \]$ has local mass at scale $R$ if

#[#set math.equation(numbering: n => "(5)")
 $ integral_(B \( z \, r \)) h thin d sigma lt.eq \( R r \)^a #h(2em) \( z in S^(d - 1) \, med r > 0 \) . $ <h:local:bound>]

The scale is an upper-bound parameter; it is not a support radius.

#thm([Lemma 2.1.])[
  (Spherical balls and terminal outputs).  #emph[For $d gt.eq 2$, $z in S^(d - 1)$, and $r > 0$, 
#[#set math.equation(numbering: n => "(6)")
 $ sigma_d \( B \( z \, r \) \) lt.eq r^(d - 1) . $ <h:local:cap>]

 Consequently, if $Q$ is any probability law on $S^(d - 1)$ independent of the signal and 
$ h \( s \) = Q { v : arccos chevron.l v \, s chevron.r lt.eq epsilon.alt } \, $

 then $h$ has local mass at scale $R = epsilon.alt$: 
#[#set math.equation(numbering: n => "(7)")
 $ integral_(B \( z \, r \)) h thin d sigma_d lt.eq \( epsilon.alt r \)^(\( d - 1 \) \/ 2) . $ <h:local:terminal>]

]
] <h:local:caps>

#proof[
  For $0 < r lt.eq 1$, rotate $z$ to the north pole and write $n = d - 1$. A point of $S^(d - 1) ∩ B \( z \, r \)$ has last coordinate at least $1 - r^2 \/ 2 gt.eq 1 \/ 2$. On the upper hemisphere the surface-area element as a graph over the first $n$ coordinates is the reciprocal of that last coordinate, hence at most two on this cap. Its projection is contained in the $n$-ball of radius $r$. The full sphere has area at least twice the volume of the unit $n$-ball, since both hemispheres project onto that ball with area element at least one. The ratio is at most $r^n$. For $r > 1$, the total mass one gives the same inequality.
  If the angular distance from a fixed unit output $v$ is at most $epsilon.alt$, its chordal distance is $2 sin \( theta \/ 2 \) lt.eq theta lt.eq epsilon.alt$. Thus the global successful mass for $v$ is at most $epsilon.alt^n$. Integrating this inequality against $Q$ gives the same global bound for $h$. Independently, $0 lt.eq h lt.eq 1$ and (6) give local mass at most $r^n$. Therefore
  $ integral_(B \( z \, r \)) h thin d sigma_d lt.eq min { r^n \, epsilon.alt^n } lt.eq \( epsilon.alt r \)^(n \/ 2) \, $
  where the last inequality follows by considering $r lt.eq epsilon.alt$ and $r gt.eq epsilon.alt$. ◻
]

The two bounds play different roles: $r^(d - 1)$ controls concentration in a small region, and $epsilon.alt^(d - 1)$ controls the total successful mass. Their geometric mean has the same exponent in $r$ and $epsilon.alt$, which is the form preserved by one block.

== 3 Exact Gaussian projection <h:projection>

A block of exact equations acts on a localized part of each continuation’s successful mass. We prove its projection bound for an arbitrary finite measure with controlled mass in every ambient ball. Keeping the coefficient and support radius visible will expose the cancellation in the block estimate. The same theorem will later apply to a prior supported on a lower-dimensional part of the sphere.

For a positive integer $m$, let $gamma_m$ be the law of an $m$-by-$d$ matrix with independent standard Gaussian entries, and set

$ lambda_m \( d A \, d y \) = gamma_m \( d A \) thin d y . $

For a finite nonnegative Borel measure $mu$, let $eta_mu$ be the image of $gamma_m \( d A \) mu \( d s \)$ under $\( A \, s \) mapsto \( A \, A s \)$. The matrix remains part of the observed data; no normalization of $mu$ is made. The integer $m$ counts rows, while $p$ below is a density moment order. Write $v_m$ for the unit $m$-ball volume. For a closed support ball $B \( z \, R \)$, define

#[#set math.equation(numbering: n => "(8)")
 $ cal(E)_(z \, R) = { \( A \, y \) : y in A z + A B \( 0 \, R \) } subset.eq cal(S)_(z \, R) = { \( A \, y \) : parallel y - A z parallel lt.eq R parallel A parallel_(upright("op")) } . $ <h:dv:support-sets>]

The exact image is carried by $cal(E)_(z \, R)$. This set is Borel: it is the zero set of the continuous function $\( A \, y \) mapsto min_(parallel v parallel lt.eq R) parallel y - A z - A v parallel$. Changing $\( A \, y \)$ changes this minimum by at most $parallel y - y' parallel + parallel A - A' parallel_(upright("op")) \( parallel z parallel + R \)$.

In this section $H$ is a local-mass coefficient and $R$ is the geometric radius of a supporting ball. This use of $R$ is separate from the propagated scale in (5).

#thm([Theorem 3.1.])[
  (Exact projection density from an ambient ball bound).  #emph[Let $d \, m gt.eq 1$ and $p gt.eq 2$ be integers, and let $beta > m + p - 2$, $H \, R > 0$, and $z in bb(R)^d$. Suppose that $mu$ is a finite nonnegative Borel measure supported on $B \( z \, R \)$ and satisfying 
#[#set math.equation(numbering: n => "(9)")
 $ mu \( B \( x \, r \) \) lt.eq H r^beta #h(2em) \( x in bb(R)^d \, med r > 0 \) . $ <h:dv:ambient-bound>]

 For $0 lt.eq j lt.eq p - 2$, put 
$ J_j = 1 + 3^j 2^beta frac(m, beta - j - m) \, $

 and define 
#[#set math.equation(numbering: n => "(10)")
 $ cal(B) = \( 2 pi \)^(- m \( p - 1 \) \/ \( 2 p \)) H R^(beta - m \( 1 - 1 \/ p \)) (product_(j = 0)^(p - 2) J_j)^(1 \/ p) . $ <h:dv:moment-scale>]

 Then $eta_mu$ has a nonnegative jointly Borel density $F$ with respect to $lambda_m$, which can be chosen to vanish outside $cal(E)_(z \, R)$, and 
#[#set math.equation(numbering: n => "(11)")
 $ parallel F parallel_(L^p \( lambda_m \)) lt.eq cal(B) . $ <h:dv:finite-density-bound>]

]
] <h:dv:finite-density>

Projection loses $m \( 1 - 1 \/ p \)$ powers of the support radius. The volume of the projected ball will restore exactly this power. We prove the theorem by controlling inverse affine distances, expanding a smoothed density moment, and then removing the smoothing on matrix–label space. The independent-copy moment and successive orthogonalization have a close predecessor in the noisy regression analysis of #cite(label("SSV2019")) Section 7, Lemma 12. That result treats a one-row noisy interval under a global $L^2$ density condition; here the input is local growth, and the output concerns several rows and exact labels.

=== 3.1 Affine distances and the Gram determinant <affine-distances-and-the-gram-determinant>

#thm([Proposition 3.2.])[
  (Affine-distance and Gram bounds).  #emph[Under the assumptions of Theorem 6, use the factors $J_j$ defined there. If $L$ is an affine $j$-plane with $0 lt.eq j lt.eq p - 2$, then, for $0 < t lt.eq R$, 
#[#set math.equation(numbering: n => "(12)")
 $ mu { s : "dist" \( s \, L \) lt.eq t } & lt.eq 3^j 2^beta H R^j t^(beta - j) \,\
integral "dist" \( s \, L \)^(- m) thin d mu \( s \) & lt.eq J_j H R^(beta - m) . $ <h:dv:tube>]

 For a tuple $\( s_1 \, dots.h \, s_p \)$, let $V = \[ s_2 - s_1 \, dots.h \, s_p - s_1 \]$. The matrix $V$ has full column rank for $mu^(⊗ p)$-almost every tuple, and 
#[#set math.equation(numbering: n => "(13)")
 $ integral det \( V^(sans(T)) V \)^(- m \/ 2) thin d mu^(⊗ p) lt.eq H^p R^(beta p - m \( p - 1 \)) product_(j = 0)^(p - 2) J_j . $ <h:dv:gram-product>]

 The integrand in (13) may be assigned any value on the null set of rank-deficient tuples.]
] <h:dv:ambient-gram>

#proof[
  The local growth hypothesis is of Frostman type, and inverse-distance averaging is a classical projection method; compare #cite(label("Mattila1975")) Lemmas 3.5 and 5.1, pp. 230–231 and 236. Here we retain the coefficient and radius throughout the calculation.
  The orthogonal projection of $B \( z \, R \)$ onto $L$ lies in a $j$-dimensional ball of radius $R$. A maximal $t$-separated set in that ball is a $t$-net and has at most $\( 1 + 2 R \/ t \)^j lt.eq \( 3 R \/ t \)^j$ points, by comparing disjoint balls of radius $t \/ 2$ with the ball of radius $R + t \/ 2$. When $j = 0$, use its single point. Every point of $B \( z \, R \)$ at distance at most $t$ from $L$ is within $2 t$ of a net point. Applying (9) to these ambient balls proves (12). Since $beta - j > 0$, letting $t arrow.b 0$ also gives $mu \( L \) = 0$.
  The total mass is at most $H R^beta$. Integrating the elementary identity for an inverse power up to radius $R$, and using Tonelli’s theorem, gives
  $ integral "dist" \( s \, L \)^(- m) thin d mu \( s \) & lt.eq R^(- m) mu \( bb(R)^d \) + m integral_0^R t^(- m - 1) mu { s : "dist" \( s \, L \) lt.eq t } thin d t\
 & lt.eq (1 + 3^j 2^beta frac(m, beta - j - m)) H R^(beta - m) . $
  The denominator is positive by the stated hypothesis on $beta$. This proves (12).
  If $p - 1 > d$, then $d lt.eq p - 2$; applying the tube estimate to $L = bb(R)^d$ and letting $t arrow.b 0$ shows that $mu = 0$. The Gram conclusion is then immediate. Otherwise, the nullity of affine planes of dimensions at most $p - 2$ shows by successive integration that $s_i$ lies outside $"aff" \( s_1 \, dots.h \, s_(i - 1) \)$ for almost every tuple and every $2 lt.eq i lt.eq p$. Hence $V$ has full column rank almost everywhere. Gram–Schmidt orthogonalization gives, on this set,
  $ det \( V^(sans(T)) V \)^(- m \/ 2) = product_(i = 2)^p "dist" #scale(x: 120%, y: 120%)[\(] s_i \, "aff" \( s_1 \, dots.h \, s_(i - 1) \) #scale(x: 120%, y: 120%)[\)]^(- m) . $
  The product of the corresponding positive heights is $\( p - 1 \) !$ times the $\( p - 1 \)$-simplex volume. Related simplex-volume factors occur in Drury’s affine-plane Jacobian #cite(label("Drury1984")) Lemma 1, pp. 497–498; its normalization and exponent differ from this Gaussian calculation.
  Integrate first in $s_p$, then in $s_(p - 1)$, and continue down to $s_2$. At the $s_i$ step the preceding affine span has dimension $i - 2$ almost everywhere, so (12) contributes $J_(i - 2) H R^(beta - m)$. The final $s_1$ integral contributes at most $H R^beta$. All integrands are nonnegative, and Tonelli’s theorem therefore justifies this order and proves (13). ◻
]

=== 3.2 Smoothing and exact labels <smoothing-and-exact-labels>

Let $phi.alt_delta$ be the $N \( 0 \, delta^2 I_m \)$ density on $bb(R)^m$. We first record the Gaussian identity for all tuples, including rank-deficient ones.

#thm([Lemma 3.3.])[
  (Gaussian difference identity).  #emph[Let $d \, m gt.eq 1$ and $k gt.eq 2$ be integers, let $delta > 0$, and let $t_1 \, dots.h \, t_k in bb(R)^d$. Put $D = \[ t_2 - t_1 \, dots.h \, t_k - t_1 \]$. If $A$ has law $gamma_m$, then 
#[#set math.equation(numbering: n => "(14)")
 $ bb(E)_A integral_(bb(R)^m) product_(i = 1)^k phi.alt_delta \( y - A t_i \) thin d y =  & \( 2 pi \)^(- m \( k - 1 \) \/ 2)\
 &  times det #h(-0.16667em) (D^(sans(T)) D + delta^2 \( I_(k - 1) + upright(bold(1)) upright(bold(1))^(sans(T)) \))^(- m \/ 2) . $ <h:proj:gaussian-identity>]

 If $D$ has full column rank, the right side is at most $\( 2 pi \)^(- m \( k - 1 \) \/ 2) det \( D^(sans(T)) D \)^(- m \/ 2)$.]
] <h:proj:gaussian>

#proof[
  Let $eta_1 \, dots.h \, eta_k$ be independent $N \( 0 \, delta^2 I_m \)$ vectors. For fixed $A$, integrating the product over the common location $y$ gives the density at zero of the $k - 1$ differences
  $ \( A t_i + eta_i \) - \( A t_1 + eta_1 \) \, #h(2em) 2 lt.eq i lt.eq k . $
  Indeed, the linear change from $k$ vectors to the first vector and these differences has determinant one. After averaging over $A$, each of the $m$ rows is a centered Gaussian difference vector with covariance
  $ D^(sans(T)) D + delta^2 \( I_(k - 1) + upright(bold(1)) upright(bold(1))^(sans(T)) \) . $
  The $m$ row vectors are independent. Evaluating their joint density at zero gives (14). For fixed $delta > 0$, the conditional difference densities are continuous and bounded uniformly in $A$, so their averaged value at zero equals the value of the averaged density. The covariance is positive definite even when $D$ is rank deficient.
  If $G = D^(sans(T)) D$ is positive definite and $B$ is positive semidefinite, then $det \( G + B \) = det G thin det \( I + G^(- 1 \/ 2) B G^(- 1 \/ 2) \) gt.eq det G$. Apply this with $B = delta^2 \( I + upright(bold(1)) upright(bold(1))^(sans(T)) \)$. ◻
]

#thm([Lemma 3.4.])[
  (Gaussian smoothing with the full mass factor).  #emph[Under the assumptions of Theorem 6, use the scale $cal(B)$ from (10). Let $phi.alt_delta$ be the $N \( 0 \, delta^2 I_m \)$ density and put 
$ F_delta \( A \, y \) = integral phi.alt_delta \( y - A s \) thin d mu \( s \) \, #h(2em) delta > 0 . $

 Then $F_delta$ is jointly Borel, and, with $V = \[ s_2 - s_1 \, dots.h \, s_p - s_1 \]$, 
#[#set math.equation(numbering: n => "(15)")
 $ integral F_delta^p thin d lambda_m & = \( 2 pi \)^(- m \( p - 1 \) \/ 2) integral det #h(-0.16667em) (V^(sans(T)) V + delta^2 \( I_(p - 1) + upright(bold(1)) upright(bold(1))^(sans(T)) \))^(- m \/ 2) thin d mu^(⊗ p)\
 & lt.eq cal(B)^p . $ <h:dv:gaussian-moment-bound>]

]
] <h:dv:gaussian-moment>

#proof[
  The defining integrand is nonnegative and Borel, so its parameter integral is Borel. Expand the $p$th power and use Tonelli’s theorem. The general Gaussian difference identity (14), with $k = p$, $m$ rows, and the tuple $s_1 \, dots.h \, s_p$, gives the displayed equality. In particular the common first noise contributes $delta^2 upright(bold(1)) upright(bold(1))^(sans(T))$, and the prefactor is $\( 2 pi \)^(- m \( p - 1 \) \/ 2)$.
  On the full-rank tuples of Proposition 7, adding the positive definite noise covariance can only increase the determinant. Indeed, for positive definite $G$ and positive semidefinite $Q$, $det \( G + Q \) = det \( G \) det \( I + G^(- 1 \/ 2) Q G^(- 1 \/ 2) \) gt.eq det \( G \)$. The rank-deficient tuples have product measure zero. The bound now follows from (13) and the definition of $cal(B)$. ◻
]

To pass from the uniform moment bound to exact observations, we use the following compact-test form of $L^p$ duality.

#thm([Lemma 3.5.])[
  (A density from compactly supported tests).  #emph[Let $E$ be a Euclidean space, let $lambda$ be a locally finite, sigma-finite Borel measure on $E$, and let $eta$ be a finite nonnegative Borel measure on $E$. Suppose $p > 1$, $U gt.eq 0$, and 
$ lr(|integral psi thin d eta|) lt.eq U parallel psi parallel_(L^(p \/ \( p - 1 \)) \( lambda \)) #h(2em) upright("for every real ") psi in C_c \( E \) . $

 Then $eta = f lambda$ for a nonnegative $f in L^p \( lambda \)$ with $parallel f parallel_p lt.eq U$.]
] <h:proj:density-by-tests>

#proof[
  The locally finite Borel measures here have Radon extensions #cite(label("StanfordRadonMeasures")) Corollary 2.11; on Euclidean space these are the completions of the Borel measures. On the completion of $lambda$, the space $C_c \( E \)$ is dense in $L^(p \/ \( p - 1 \)) \( lambda \)$ #cite(label("FremlinRadonMeasures")) Proposition 416I. The assumed functional extends by continuity to that space. Real $L^p$ duality #cite(label("FremlinFunctionSpaces")) Theorem 244K gives a representing $f in L^p \( lambda \)$ of norm at most $U$.
  Choose a Borel representative of $f$ #cite(label("FremlinFunctionSpaces")) Section 241B(k). Hölder makes $f^(+) lambda$ and $f^(-) lambda$ finite on compact sets. Their Radon extensions obey
  $ integral psi thin d \( f^(+) lambda \) = integral psi thin d \( eta + f^(-) lambda \) #h(2em) \( psi in C_c \( E \) \) . $
  Radon measures are determined by these tests #cite(label("FremlinRadonMeasures")) Proposition 416E(b). The two measures therefore agree. Evaluating on the Borel set where $f < 0$ gives $f^(-) lambda = 0$, and then $eta = f lambda$. ◻
]

#proof[
  For a real $psi in C_c \( bb(R)^(m d) times bb(R)^m \)$, let $Z tilde.op N \( 0 \, I_m \)$ be independent. Then
  $ integral psi F_delta thin d lambda_m = integral bb(E)_Z psi \( A \, A s + delta Z \) thin d gamma_m \( A \) d mu \( s \) arrow.r integral psi thin d eta_mu $
  by bounded convergence, since $mu$ is finite. Hölder’s inequality and Lemma 9 bound the limiting functional by $cal(B) parallel psi parallel_(L^(p \/ \( p - 1 \)) \( lambda_m \))$. The measure $lambda_m$ is locally finite and $sigma$-finite Borel, and $eta_mu$ is finite nonnegative Borel. Applying Lemma 10 with $U = cal(B)$ gives (11). Choose a Borel representative and multiply it by the indicator of $cal(E)_(z \, R)$. The image measure is supported on the Borel set $cal(E)_(z \, R)$, so its nonnegative density vanishes almost everywhere outside that set. ◻
]

#thm([Corollary 3.6.])[
  (Normalized exact projection).  #emph[Use the parameters in (4), and let $1 lt.eq m lt.eq q$. Let $nu$ be a finite nonnegative Borel measure of mass at most one, supported on the unit ball in $bb(R)^d$, such that 
#[#set math.equation(numbering: n => "(16)")
 $ nu \( B \( t \, rho \) \) lt.eq rho^a #h(2em) \( t in "supp" nu \, med rho > 0 \) . $ <h:proj:growth>]

 The image of $gamma_m \( d A \) nu \( d t \)$ under $\( A \, t \) mapsto \( A \, A t \)$ has a nonnegative jointly Borel density $f_nu$ relative to $lambda_m$, and 
#[#set math.equation(numbering: n => "(17)")
 $ parallel f_nu parallel_(L^q \( lambda_m \)) lt.eq exp \( C d \) . $ <h:proj:norm>]

 The constant is independent of $nu$ and $m$.]
] <h:proj:normalized>

#proof[
  The zero measure is immediate. Any ambient ball of radius $rho$ with positive mass contains a support point, and is contained in the ball of radius $2 rho$ about that point. Hence its mass is at most $\( 2 rho \)^a$. Apply Theorem 6 with $beta = a$, $p = q$, $H = 2^a$, and support radius $R = 1$. For $0 lt.eq j lt.eq q - 2$, the parameters in (4) give
  #[#set math.equation(numbering: n => "(18)")
   $ a - j - m gt.eq n \/ 2 - 2 q + 2 gt.eq n \/ 4 + 2 \, #h(2em) frac(m, a - j - m) lt.eq 1 / 2 . $ <h:proj:margin>]
  Thus $J_j lt.eq exp \( C d \)$, and the stated norm bound follows. ◻
]

=== 3.3 The common projected support <the-common-projected-support>

A density bound alone cannot control a bounded routing function over all label space. We also need a common support of controlled average volume. The exact image ellipsoid supplies it.

#thm([Lemma 3.7.])[
  (Exact projected volume, including short blocks).  #emph[Let $1 lt.eq m lt.eq d$, $z in bb(R)^d$, and $R > 0$. Use the Borel set $cal(E)_(z \, R)$ from (8). There is an absolute $C_(upright(E)) gt.eq 1$ such that, for a standard Gaussian $m$-by-$d$ matrix, 
#[#set math.equation(numbering: n => "(19)")
 $ lambda_m \( cal(E)_(z \, R) \) & = v_m R^m bb(E)_A sqrt(det \( A A^(sans(T)) \))\
 & lt.eq v_m R^m d^(m \/ 2) lt.eq R^m \( 2 pi e d \/ m \)^(m \/ 2) lt.eq C_(upright(E))^d R^m . $ <h:ev:ellipsoid-volume>]

 Every density of the exact image of a measure supported on $B \( z \, R \)$ vanishes almost everywhere outside $cal(E)_(z \, R)$.]
] <h:ev:ellipsoid>

#proof[
  The image measure is carried by $cal(E)_(z \, R)$, which proves the support assertion.
  Almost surely $A$ has full row rank. In singular-value coordinates, $A B \( 0 \, R \)$ is an ellipsoid whose semiaxes are $R$ times the $m$ singular values of $A$. Its volume is therefore exactly $v_m R^m sqrt(det \( A A^(sans(T)) \))$. Hadamard’s inequality bounds the square root by the product of the row norms: Gram–Schmidt replaces each row norm by the length of its component perpendicular to the preceding rows, which can only decrease it. Those rows are independent and each has expected norm at most $sqrt(bb(E) parallel a_i parallel^2) = sqrt(d)$, giving the first inequality. Also
  $ \( 2 pi \)^(m \/ 2) = integral_(bb(R)^m) e^(- parallel y parallel^2 \/ 2) thin d y gt.eq e^(- m \/ 2) v_m m^(m \/ 2) \, $
  which proves $v_m lt.eq \( 2 pi e \/ m \)^(m \/ 2)$.
  To see uniformity for short blocks, put $t = m \/ d in \( 0 \, 1 \]$. Since $t log \( 1 \/ t \) lt.eq 1 \/ e$,
  $ 1 / d log #h(-0.16667em) (\( 2 pi e d \/ m \)^(m \/ 2)) = t / 2 log \( 2 pi e \) + t / 2 log \( 1 \/ t \) lt.eq 1 / 2 log \( 2 pi e \) + frac(1, 2 e) . $
  This supplies an absolute $C_(upright(E))$ in (19). For any full-block choice $m = p$ with $d \/ 16 lt.eq p lt.eq d$, one can instead use $d \/ p lt.eq 16$ directly to obtain
  #[#set math.equation(numbering: n => "(20)")
   $ lambda_p \( cal(E)_(z \, R) \) lt.eq #scale(x: 120%, y: 120%)[\(] sqrt(32 pi e) thin R #scale(x: 120%, y: 120%)[\)]^p . $ <h:ev:full-ellipsoid>]
  ◻
]

== 4 One block of arbitrary computation <h:blocks>

Fix an incoming state and a block of $m$ Gaussian rows. Its complete exact data are $\( A \, A s \)$. Suppose the block routes to one of $N$ destinations and destination $j$ has future success function $h_j \( s \)$. We allow the route to use the whole real-valued block and fresh randomness. This is at least as much within-block access as the streaming learner has.

#thm([Lemma 4.1.])[
  (Backward block bound).  #emph[Let $1 lt.eq m lt.eq q$ and $N gt.eq 1$. Suppose the measurable functions $h_1 \, dots.h \, h_N : S^(d - 1) arrow.r \[ 0 \, 1 \]$ have local mass at a common scale $R > 0$, as in (5). Let $g_j : bb(R)^(m times d) times bb(R)^m arrow.r \[ 0 \, 1 \]$ be Borel routing probabilities with $sum_(j = 1)^N g_j lt.eq 1$, and define 
$ h \( s \) = sum_(j = 1)^N h_j \( s \) integral g_j \( A \, A s \) thin d gamma_m \( A \) . $

 Then, for every $z in S^(d - 1)$ and $r > 0$, 
#[#set math.equation(numbering: n => "(21)")
 $ integral_(B \( z \, r \)) h thin d sigma lt.eq exp \( C d \) N^(1 \/ q) \( R r \)^a . $ <h:block:mass>]

 Equivalently, $h$ has local mass at scale 
#[#set math.equation(numbering: n => "(22)")
 $ R' = R exp \( C d \/ a \) N^(1 \/ \( a q \)) . $ <h:block:scale>]

]
] <h:block:bound>

#proof[
  Fix $z in S^(d - 1)$ and $r > 0$, and let $mu_j = upright(bold(1))_(B \( z \, r \)) h_j sigma$. This is a finite Borel measure supported on $B \( z \, r \)$. If an ambient ball $B \( x \, t \)$ has positive $mu_j$-mass, choose a point of its intersection with the sphere. The intersection is contained in a sphere-centered ball of radius $2 t$. The local bound therefore gives
  $ mu_j \( B \( x \, t \) \) lt.eq \( 2 R t \)^a #h(2em) \( x in bb(R)^d \, med t > 0 \) . $
  Apply Theorem 6 with exponent $beta = a$, moment order $p = q$, coefficient $H = \( 2 R \)^a$, and support radius $r$. The margin (18) shows that every $J_ell lt.eq exp \( C d \)$ for $0 lt.eq ell lt.eq q - 2$. Absorbing $2^a$, we obtain exact joint densities $f_j$, all supported on $cal(E)_(z \, r)$, with
  $ parallel f_j parallel_(L^q \( lambda_m \)) lt.eq exp \( C d \) R^a r^(a - m \( 1 - 1 \/ q \)) . $
  These represent unnormalized successful mass, not posteriors conditioned on a reached state.
  Put $q' = q \/ \( q - 1 \)$. The exact image-measure identity and two applications of Hölder give
  $ integral_(B \( z \, r \)) h thin d sigma & = sum_j integral_(cal(E)_(z \, r)) f_j g_j thin d lambda_m\
 & lt.eq exp \( C d \) R^a r^(a - m \( 1 - 1 \/ q \)) sum_j (integral_(cal(E)_(z \, r)) g_j^(q') thin d lambda_m)^(1 \/ q')\
 & lt.eq exp \( C d \) R^a r^(a - m \( 1 - 1 \/ q \)) N^(1 \/ q) (integral_(cal(E)_(z \, r)) sum_j g_j^(q') thin d lambda_m)^(1 \/ q') . $
  The first inequality acts on matrix–label space; the second acts on the finite set of destinations. Since $0 lt.eq g_j lt.eq 1$ and $sum_j g_j lt.eq 1$, the last integral is at most
  $ lambda_m \( cal(E)_(z \, r) \) lt.eq C_(upright(E))^d r^m $
  by Lemma 12. Multiplication by its $1 \/ q' = 1 - 1 \/ q$ power restores the radius exponent:
  $ r^(a - m \( 1 - 1 \/ q \)) \( r^m \)^(1 - 1 \/ q) = r^a . $
  Absorbing the absolute exponential factor proves (21), and taking the $a$-th root gives (22). ◻
]

The localization radius does not change the scale: its loss in the density bound cancels its gain in the projected volume. Only the absolute density and volume constants, and the finite choice of destinations, contribute to the update. Figure 1 displays this cancellation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.082cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Future success at scale $R$#linebreak()$ integral_(B(z,r))h_j#h(0.1667em) d sigma lt.eq ("Rr")^a$#linebreak()for every sphere center $z$ and $r>0$]]])])
  content((0, -1.694), [#box(width: 6.082cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Restrict successful mass to $B(z,r)$#linebreak()$mu_j= bold(1)_(B(z,r))h_j sigma$]]])])
  content((-3.1, -3.19), [#box(width: 6.082cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Exact density from local mass#linebreak()$\|f_j\|_q lt.eq e^(C d)R^a r^(a-m(1-1"/"q))$]]])])
  content((3.1, -3.185), [#box(width: 6.082cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Exact ellipsoid support#linebreak()$lambda_m( cal(E)_(z,r)) lt.eq C_( upright(E) )^d r^m$]]])])
  content((0, -4.932), [#box(width: 6.082cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hölder restores $r^a$ and costs $N^(1"/"q)$#linebreak()$ integral_(B(z,r))h#h(0.1667em) d sigma lt.eq e^(C d)N^(1"/"q)("Rr")^a$]]])])
  content((0, -6.449), [#box(width: 6.082cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[The preceding state has local scale#linebreak()$R'=R exp ("Cd""/"a)N^(1"/"("aq"))$]]])])
  line((0, -0.6879), (0, -1.188), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-1.048, -2.2), (-2.084, -2.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((1.052, -2.2), (2.091, -2.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-2.227, -3.681), (-0.9473, -4.4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((2.239, -3.67), (0.9442, -4.4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -5.464), (0, -5.964), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The backward block estimate separates the exact projection density from its common support volume. Hölder combines their radius powers to recover $r^a$, while the routing constraint charges $N^(1 \/ q)$ for the number of destinations. Absolute constants $C$ may change between bounds. ],
) <h:fig:block-scaling>

In particular, if $log N lt.eq d^2$, then (22) gives $R' lt.eq K R$ for an absolute $K$: the bounds $a gt.eq d \/ 3$ and $q gt.eq d \/ 16$ make both terms in $C d \/ a + \( log N \) \/ \( a q \)$ absolute. This form applies to the local alphabet whenever $log \( \( q + 2 \) 2^M \) lt.eq d^2$.

For the local count $N lt.eq \( m + 2 \) 2^M$ that will be proved in the next section, (22) gives

$ log \( R' \/ R \) lt.eq frac(C d, a) + frac(M log 2 + log \( m + 2 \), a q) lt.eq C (1 + M / d^2) . $

This is where quadratic memory enters: $q asymp d$ divides the logarithm of the number of choices, and $a asymp d$ converts mass growth into scale growth.

== 5 From one block to a finite stream <h:stream:section>

The block estimate applies to the success function obtained by starting the learner from a specified state. We first construct these fresh continuations and show that a block has only a bounded number of possible destinations. This count will let us propagate the local bound (5) backward through the stream.

For now fix the shared rule seed and suppose that all finite transition and stopping kernels are Borel and defined at every input pair. Future rows and fresh random choices are independent of the past. We take the action at the horizon to be terminal from every state. Section 5.2 justifies these conventions for the full randomized, completed-measurable model of Definition 1, without changing its prior expected terminal score.

=== 5.1 Fresh continuations and local destinations <fresh-continuations-and-local-destinations>

Write $Q_t$ for the set of persistent states at sample index $t$, with $\| Q_t \| lt.eq 2^M$. For each terminal state $w in Q_k$, write $sans(Q)_(k \, w)$ for its output probability law on $S^(d - 1)$; with the seed fixed, this law depends only on $k \, w$. Fix a Borel terminal score $ell : S^(d - 1) times S^(d - 1) arrow.r \[ 0 \, 1 \]$. Starting from a specified state $u in Q_t$ before its sample-free stopping check, define $h_(t \, u) \( s \)$ to be the expected terminal score $bb(E) \[ ell \( s \, hat(s) \) \]$ with signal $s$ and fresh future samples and randomness. This definition also applies to states the original run never reaches.

A block from index $t$ to index $t + m$ includes the stopping check at its entrance. An active exit is cut before the check at $t + m$, which the continuation performs. A terminal tag produced by the last transition has already stopped at $t + m$. These phase conventions use only the state and the index.

#thm([Lemma 5.1.])[
  (The destinations of a block).  #emph[For a fixed-seed Borel learner with the state sets, output laws, and phase convention just specified, and the Borel terminal score $ell$, let $0 lt.eq t < T$, $u in Q_t$, and $1 lt.eq m lt.eq T - t$. There are an integer 
#[#set math.equation(numbering: n => "(23)")
 $ 1 lt.eq N lt.eq \( m + 2 \) 2^M \, $ <h:stream:destinations>]

 Borel routing functions $g_j : bb(R)^(m times d) times bb(R)^m arrow.r \[ 0 \, 1 \]$ with $sum_j g_j lt.eq 1$, and Borel functions $h_j : S^(d - 1) arrow.r \[ 0 \, 1 \]$ such that, for every $s in S^(d - 1)$, 
#[#set math.equation(numbering: n => "(24)")
 $ h_(t \, u) \( s \) = sum_(j = 1)^N h_j \( s \) integral g_j \( A \, A s \) thin d gamma_m \( A \) . $ <h:stream:category-representation>]

 Here $gamma_m$ is the law of an $m$-by-$d$ standard Gaussian matrix. Each destination is either a terminal state $w in Q_k$ at an index $k in { t \, dots.h \, t + m }$, with score function 
$ h_(k \, w)^(upright("out")) \( s \) = integral_(S^(d - 1)) ell \( s \, v \) thin sans(Q)_(k \, w) \( d v \) \, $

 or a continuing state $w in Q_(t + m)$ before its stopping check, with score function $h_(t + m \, w) \( s \)$. The terminal output law $sans(Q)_(k \, w)$ depends only on its state and index. The value $g_j \( A \, b \)$ is the probability of destination $j$ when the block data are $\( A \, b \)$.]
] <h:stream:categories>

#proof[
  The everywhere-defined kernels and the forced terminal action at $T$ give a finite scored experiment from every specified state. Its score function is Borel in the signal. Indeed, the map $\( s \, x \) mapsto \( x \, chevron.l x \, s chevron.r \)$ is continuous, and each path probability is a finite product of Borel coordinate probabilities. Summing over the finitely many paths and integrating against the fixed laws of future rows preserves Borel measurability. The same argument applied to $ell \( s \, v \)$ and each fixed output law shows that $h_(k \, w)^(upright("out"))$ is Borel. The integration fact follows first for indicators of rectangles and then for nonnegative Borel functions by the monotone class theorem and monotone convergence; see also the composition of kernels in #cite(label("GagnePanangaden2023")) Section 2.3.
  Pre-generate all $m$ rows of the block, including those after an early stop. At each $k = t \, dots.h \, t + m - 1$, perform the sample-free stopping check and, if still active, process the next pair through the transition to $k + 1$. A terminal tag from that transition stops at $k + 1$. An active exit from the final transition is passed to the continuation before the stopping check at $t + m$, so that check is performed exactly once. If $t + m = T$, the continuation performs the forced terminal action.
  A terminal destination records its local stopping offset $i in { 0 \, dots.h \, m }$ and its terminal state in $Q_(t + i)$. The offset $i = 0$ includes an immediate stop, and $i = m$ can arise from the last transition. A transition tag and a sample-free stop at the same state and index have the same output law, so their outcomes can be merged. Continuing destinations form one additional copy of $Q_(t + m)$, distinguished from the terminal destinations at that index. Consequently the number of destinations is at most
  $ sum_(i = 0)^m \| Q_(t + i) \| + \| Q_(t + m) \| lt.eq \( m + 2 \) 2^M . $
  The block’s entrance index is fixed, so local offsets determine all absolute stopping indices; the count has no factor depending on $T$.
  For arbitrary data $\( A \, b \)$, each destination probability $g_j \( A \, b \)$ is a finite sum over paths of products of Borel coordinate probabilities. It is therefore Borel. The probabilities are nonnegative and sum to one when all destinations are included. A path that stops early is simply independent of the unused rows. After a continuing destination is fixed, independent future rows and fresh choices give its prescribed continuation score. After a terminal destination is fixed, the prescribed output law gives its terminal score. Conditioning first on the block data and then on its destination proves (24). Because the kernels are defined everywhere, this equality holds for every signal and every starting state, rather than only at states reached by the original run. ◻
]

The angular and chordal success scores are, respectively,

$ ell \( s \, v \) = upright(bold(1))_({ arccos chevron.l s \, v chevron.r lt.eq epsilon.alt }) \, #h(2em) ell \( s \, v \) = upright(bold(1))_({ parallel s - v parallel lt.eq epsilon.alt }) . $

Both are Borel. The backward induction below uses the angular score.

=== 5.2 Borel versions and the original randomized experiment <h:stream:reduction>

The fresh continuations require kernels defined even at inputs and states absent from the original run. The model permits transition coordinates measurable in a completed sigma field. Under a dominated fresh-pair law, these coordinates admit everywhere-defined Borel versions that preserve the prior experiment. The following statement keeps the prior general for the later cube application.

#thm([Lemma 5.2.])[
  (Borel versions under a dominated sample law).  #emph[Let $d gt.eq 2$, let $pi$ be a Borel probability measure on $S^(d - 1)$, and let $X tilde.op gamma_1 = N \( 0 \, I_d \)$ be independent of $S tilde.op pi$. Suppose that 
#[#set math.equation(numbering: n => "(25)")
 $ cal(L) \( X \, chevron.l X \, S chevron.r \) lt.double lambda \, #h(2em) lambda \( d x \, d y \) = gamma_1 \( d x \) thin d y $ <h:stream:pair-domination>]

 on $bb(R)^d times bb(R)$. Fix an integer horizon $T gt.eq 0$ and finite state sets at every sample index. For each state and index, suppose every coordinate of the finite vector of transition and stopping probabilities is measurable in the $lambda$-completion of the Borel sigma field. A terminal output law is a Borel probability measure on $S^(d - 1)$ indexed only by its terminal state and stopping index. Decisions made without a new sample also depend only on the state and index.]
  #emph[There are everywhere-defined Borel transition and stopping kernels, with the same state sets and terminal output laws, whose $pi$-prior joint law of the signal, state path, stopping index and output is the same as for the original rules. The domination (25) holds when $pi = sigma$ is uniform spherical probability, for every $d gt.eq 2$.]
] <h:stream:borel>

#proof[
  We first construct versions for a fixed set of rules. If $f : bb(R)^d times bb(R) arrow.r \[ 0 \, 1 \]$ is measurable in the $lambda$-completion, each dyadic superlevel set ${ f gt.eq k 2^(- n) }$, $1 lt.eq k lt.eq 2^n$, agrees with a Borel set outside a Borel $lambda$-null set, by the description of completion in Tao #cite(label("TaoMeasure2011")) Exercise 1.4.26. Replace these superlevel sets by their Borel representatives in
  $ f_n = 2^(- n) sum_(k = 1)^(2^n) upright(bold(1))_({ f gt.eq k 2^(- n) }) . $
  The resulting Borel functions have a Borel $limsup$ equal to $f$ outside the union of the countably many null sets, since $f_n arrow.r f$. Thus each coordinate of each finite kernel has a Borel version. For one state and index, choose all of its coordinate versions simultaneously. The Borel set on which the resulting vector is not nonnegative with sum one is null; on this set replace the vector by a fixed point mass. The result is a Borel probability vector at every sample pair. There are finitely many coordinates, states and indices, so one Borel $lambda$-null set $Z$ contains every pair where any coordinate was changed. Sample-free decisions and terminal output laws require no such modification.
  Pre-generate all $T$ input rows, including rows after an early stop. Every pair $\( X_t \, chevron.l X_t \, S chevron.r \)$ has the marginal law in (25), so
  $ bb(P) { \( X_t \, chevron.l X_t \, S chevron.r \) in Z } = 0 . $
  For a state $u$ chosen from earlier observations, the event that the learner is in $u$ before sample $t$ and this pair lies in $Z$ is a subset of the displayed null event. We do not need a density for a sample conditioned on a particular state. A finite union over $t$ shows that no changed pair is visited almost surely. Couple the original and modified finite choices by the same uniform random numbers. Starting from the same initial state, induction makes their states and stopping decisions equal almost surely. At an equal terminal state and index the output laws are identical, so use their diagonal coupling. This proves the asserted joint-law equality. When $T = 0$ there is no sample pair to modify and the same conclusion is immediate.
  It remains to check the spherical prior. Conditional on a nonzero $X = x$, rotate coordinates so that $x \/ parallel x parallel$ is the first coordinate vector. Write a uniform sphere point as $G \/ parallel G parallel$ for a standard Gaussian vector $G = \( G_1 \, G_perp \)$. When $d gt.eq 2$, $R = parallel G_perp parallel > 0$ almost surely and is independent of $G_1$. For each fixed $R > 0$, the map
  $ g mapsto g / sqrt(g^2 + R^2) $
  is a smooth strictly increasing bijection from $bb(R)$ to $\( - 1 \, 1 \)$ with nonzero derivative. The image of the Gaussian law of $G_1$ therefore has a Lebesgue density. Mixing over $R$ and then multiplying by $parallel x parallel$ shows that $chevron.l x \, S chevron.r$ is absolutely continuous for every $x eq.not 0$. The point $x = 0$ has $gamma_1$-measure zero. Fubini’s theorem applied to the sections of a $lambda$-null Borel set now proves (25). ◻
]

The equality in Lemma 15 concerns the experiment under the chosen prior. It need not preserve behavior at every exceptional individual signal. In particular, an every-signal success premise will be averaged over the prior before versions are chosen.

We now return to the model’s original jointly measurable randomized experiment. Fix any Borel prior $pi$ satisfying (25), and draw the signal from $pi$ independently of the rows and the model’s data-independent randomness. The preceding lemma supplies the domination condition for the uniform-sphere prior. Write $W$ for the shared rule seed, taking $W$ constant when no seed is used, and $I$ for its initial state. The observable signal, rows, state path, stopping index, and output take values in standard Borel spaces. For a Borel terminal score $ell$, its original conditional expectation is a measurable function of $W$ and integrates to the mixed expected score. Since $\( I \, W \)$ is jointly independent of the signal and all pre-generated rows, conditional on almost every $W = w$ those inputs retain their joint law and $I$ is independent of them. The dependence allowed between $I$ and $W$ does not affect this conclusion.

Fix such a seed value for which the model’s per-seed kernel hypotheses also hold. Lemma 15 replaces its completed transition and stopping coordinates by everywhere-defined Borel kernels while preserving the original conditional $pi$-prior law. Keep its terminal output laws. At index $T$, force the sample-free action to stop at every state, retaining each prescribed state/index output law. Assign a fixed unit output only where no law was specified, a case absent from original terminating paths. This does not change the original conditional experiment, which already stops by $T$. It makes the horizon convention in the continuation construction valid even at states absent from that experiment.

The preceding continuation lemma now applies to this fixed-seed Borel learner with any Borel terminal score $ell$. A numerical score bound uniform over its initial states can be averaged against the conditional law of $I$. If the bound is also uniform in the fixed seed, the final seed average uses the original conditional expected scores. Borel versions may be chosen separately for each seed; no jointly measurable choice of these replacements is required.

=== 5.3 The quantitative success bound <the-quantitative-success-bound>

We apply the block bound to the fresh continuations just constructed. At every step, all terminal destinations have the original terminal local bound, and all continuing destinations have the inductive bound at that boundary. The following statement records the resulting finite-horizon estimate before we extract the sample lower bound.

#thm([Proposition 5.3.])[
  (Success after a bounded number of samples).  #emph[There are absolute constants $C \, d_0 > 0$ with the following property. For $d gt.eq d_0$, every learner in the stated finite-state model with $M gt.eq 0$ bits and an integer deterministic horizon $T gt.eq 0$ has, for $S tilde.op sigma$ independent of its fresh Gaussian rows, 
#[#set math.equation(numbering: n => "(26)")
 $ bb(P) { arccos chevron.l hat(s) \, S chevron.r lt.eq epsilon.alt } lt.eq min {1 \, [2 epsilon.alt exp #h(-0.16667em) (C (1 + M / d^2) ⌈T / q⌉)]^a} \, $ <h:stream:success-bound>]

 where $0 < epsilon.alt lt.eq 1 \/ 10$ and $a = \( d - 1 \) \/ 2$, $q = floor.l \( d - 1 \) \/ 8 floor.r$ as in (4). The probability includes data-independent initialization, the shared seed, and fresh random choices.]
] <h:stream:success>

#proof[
  Use the angular score in Lemma 14. Fix a seed and a prior-preserving Borel replacement as in Section 5.2, with prior $sigma$. If $T = 0$, its output is a signal-independent mixture of terminal laws. Lemma 5 gives local mass at scale $epsilon.alt$. The radius-two ball about a sphere point covers $S^(d - 1)$, so total success is at most $\( 2 epsilon.alt \)^a$, as required when $ceil.l T \/ q ceil.r = 0$. We may now suppose $T gt.eq 1$.
  Increase the absolute threshold $d_0$ so that $q gt.eq 2$, $q gt.eq d \/ 16$, and $a gt.eq d \/ 3$. Partition the $T$ sample indices into $B = ceil.l T \/ q ceil.r$ consecutive nonempty blocks, each of length at most $q$. At the final boundary every continuation is a terminal output function and obeys (5) at scale $epsilon.alt$. Suppose that at the end of one block, all continuing functions obey that bound at a common scale $R gt.eq epsilon.alt$. Its terminal destinations also obey the bound at scale $R$, by Lemma 5 and monotonicity in the scale.
  For a block of length $m lt.eq q$, Lemma 14 places every preceding continuation in the form required by Lemma 13, with $N lt.eq \( m + 2 \) 2^M lt.eq \( q + 2 \) 2^M$. That block lemma multiplies the scale by at most
  $ exp \( C_0 d \/ a \) N^(1 \/ \( a q \)) $
  for an absolute $C_0$. Its logarithm is at most
  #[#set math.equation(numbering: n => "(27)")
   $ frac(C_0 d, a) + frac(M log 2 + log \( q + 2 \), a q) lt.eq C (1 + M / d^2) = : Lambda \, $ <h:stream:multiplier>]
  where $d \/ a lt.eq 3$, $1 \/ \( a q \) lt.eq 48 \/ d^2$, and $log \( q + 2 \) \/ \( a q \) lt.eq 48 log \( d + 2 \) \/ d^2$ allow an absolute $C$. Backward induction gives (5) at scale $R = epsilon.alt e^(Lambda B)$ for every initial state. Averaging over the conditional initial-state law preserves this bound, because that law is independent of the signal and rows. Taking the radius-two ball gives total success at most $\( 2 epsilon.alt e^(Lambda B) \)^a$, and a probability is also at most one.
  By the reduction in Section 5.2, this is a uniform bound on the original conditional success probabilities for almost every seed. Averaging them proves (26); no joint choice of the Borel replacements is used. ◻
]

== 6 Constant accuracy and the main lower bound <h:end:section>

Rounding the horizon up to a whole number of blocks loses less than one block. At fine accuracy this loss is negligible. For the remaining accuracies, even an estimator retaining all the data needs a linear number of equations. Reflection across their row span proves this without identifying the full conditional law of the signal.

#thm([Lemma 6.1.])[
  (Reflection with full data).  #emph[Let $d gt.eq 1$ be an integer and $T gt.eq 0$. Let $S$ be uniform on $S^(d - 1)$. Let a matrix $A$ with $d$ columns, independent of $S$, have row span $U$ of dimension at most $T$. Suppose an output $hat(S)$ is drawn from a probability kernel depending only on $\( A \, A S \)$. Put $u = P_U S$ and $v = \( I - P_U \) S$. For an arbitrary output in $bb(R)^d$ and $0 < epsilon.alt < 1$, 
#[#set math.equation(numbering: n => "(28)")
 $ Pr { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq 1 / 2 + frac(T, 2 d \( 1 - epsilon.alt^2 \)) . $ <h:ev:direct-residual>]

 More generally, for $0 < b_0 < 1$ and $0 lt.eq epsilon.alt < sqrt(1 - b_0)$, 
#[#set math.equation(numbering: n => "(29)")
 $ Pr { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq 1 / 2 + 1 / 2 Pr { parallel u parallel^2 gt.eq b_0 } lt.eq 1 / 2 + frac(T, 2 b_0 d) . $ <h:ev:antipodal>]

 For a unit output one also has 
#[#set math.equation(numbering: n => "(30)")
 $ bb(E) chevron.l hat(S) \, v chevron.r = 0 \, #h(2em) bb(E) chevron.l hat(S) \, S chevron.r lt.eq bb(E) parallel u parallel lt.eq sqrt(T \/ d) . $ <h:ev:reflection-expectation>]

]
] <h:ev:reflection>

#proof[
  The projection $P_U$ is a Borel function of $A$, since $P_U = lim_(eta arrow.b 0) A^(sans(T)) \( A A^(sans(T)) + eta I \)^(- 1) A$; for a matrix with no rows it is zero. Conditional on $A$, reflection across $U$ sends $S = u + v$ to $u - v$. It preserves uniform spherical measure and the data $\( A \, A S \)$, because $A v = 0$, so the output kernel is the same at both signals. If $parallel v parallel > epsilon.alt$, the reflected signals have distance greater than $2 epsilon.alt$; a fixed estimate can succeed for at most one of them. Averaging the common output kernel over the reflected pair gives success at most one half on this event. On its complement use the bound one. Therefore
  $ Pr { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq 1 / 2 + 1 / 2 Pr { parallel u parallel^2 gt.eq 1 - epsilon.alt^2 } . $
  Spherical isotropy and independence of $A$ give
  $ bb(E) \( parallel u parallel^2 divides A \) = frac(dim U, d) lt.eq T / d . $
  Markov’s inequality proves (28). The same pairing on the event $parallel u parallel^2 < b_0$, where $parallel v parallel > sqrt(1 - b_0) > epsilon.alt$, proves (29). For unit outputs, reflection cancels $bb(E) chevron.l hat(S) \, v chevron.r$, whereas $chevron.l hat(S) \, u chevron.r lt.eq parallel u parallel$. Cauchy–Schwarz and the same second-moment identity prove (30). ◻
]

For almost every fixed shared seed, use the prior-preserving Borel rules justified in Section 5. Pre-generate all $T$ Gaussian rows and grant the learner the full matrix and labels. After averaging its signal-independent initial state and fresh choices, its stopped output law is a Borel kernel of those data. Angular error at most $epsilon.alt$ implies Euclidean error at most $epsilon.alt$. If $T lt.eq d \/ 4$ and $epsilon.alt lt.eq 1 \/ 10$, then (28) gives success probability at most

$ 1 / 2 + frac(1, 8 \( 1 - epsilon.alt^2 \)) lt.eq 62 / 99 < 2 / 3 . $

This uniform bound also holds for the original conditional success probabilities and hence for their average over the seed. Thus any learner with the stipulated average success must satisfy

#[#set math.equation(numbering: n => "(31)")
 $ T > d \/ 4 . $ <h:end:linear-threshold>]

#proof[
  Fix the finite constant $A > 0$ in the theorem. Take $d$ above the absolute threshold in Proposition 16, and large enough that $a gt.eq 1$ and $q gt.eq d \/ 16$. Put
  $ K_A = exp \( C \( 1 + A \) \) > 1 \, #h(2em) L = log \( 1 \/ epsilon.alt \) \, #h(2em) B = ceil.l T \/ q ceil.r \, $
  where $C$ is the absolute constant in that proposition. Since $M lt.eq A d^2$ and prior success is at least $2 \/ 3$,
  $ 2 / 3 lt.eq \( 2 epsilon.alt K_A^B \)^a . $
  Taking the $a$th root gives $epsilon.alt K_A^B gt.eq 1 \/ 3$. Since $B lt.eq T \/ q + 1$,
  #[#set math.equation(numbering: n => "(32)")
   $ T gt.eq q (frac(L - log 3, log K_A) - 1) . $ <h:end:rounding>]
  Let $H_A = 2 \( log 3 + log K_A \)$. If $L gt.eq H_A$, this gives
  $ T gt.eq frac(q L, 2 log K_A) gt.eq frac(d L, 32 log K_A) . $
  If $L < H_A$, (31) instead gives $T > d \/ 4 > d L \/ \( 4 H_A \)$. Thus the same choice
  $ c_A = min {frac(1, 32 log K_A) \, frac(1, 4 H_A)} > 0 $
  works uniformly over $0 < epsilon.alt lt.eq 1 \/ 10$ and $M lt.eq A d^2$ for this fixed $A$. No positive constant uniform as $A$ tends to infinity is asserted. ◻
]

#proof[
  Since $M \( d \) = o \( d^2 \)$, there is a dimension $d_M$ after which $M \( d \) lt.eq d^2$. Apply Theorem 2 with the numerical choice $A = 1$ at every $d gt.eq d_M$, so $K_1 = e^(2 C)$ in the preceding proof. Its constant $c_1$ is absolute, and the eventual dimension threshold may depend on the memory sequence through $d_M$. The argument applies separately at every accuracy $0 < epsilon.alt \( d \) lt.eq 1 \/ 10$, so it requires neither monotonicity of that sequence nor a relation between memory and accuracy. ◻
]

#proof[
  Average the original fixed-signal experiment over $S tilde.op sigma$ before choosing Borel versions. Its measurability makes the resulting success probability the integral of the fixed-signal success probabilities. A success probability at least $2 \/ 3$ for every signal therefore gives uniform-prior success at least $2 \/ 3$. Theorem 2 and Corollary 3 give the corresponding conclusions with their unchanged constants and dimension thresholds. Lemma 15 preserves the average used in those arguments even if a version changes behavior at exceptional individual signals. ◻
]

== 7 Selection on a common data domain <h:alternatives>

The two applications use the same analytic selection step: several continuation measures are supported on one data domain, and a measurable route chooses among them. The strong density estimate of Theorem 6 is sufficient, but a bound for measurable tests already gives the required $N^(1 \/ p)$ cost.

We state this common step before applying the projection theorem to a lower-dimensional cube prior in Section 8. The later sections examine additional exact-label interfaces and alternative coefficient normalizations; they do not assert a stronger main theorem.

#thm([Lemma 7.1.])[
  (Selection on a common data domain).  #emph[Let $\( E \, cal(E) \, lambda \)$ be a measure space, let $cal(D) in cal(E)$ have finite measure, let $p > 1$, let $U gt.eq 0$, and let $N gt.eq 1$ be an integer. Suppose finite nonnegative measures $eta_1 \, dots.h \, eta_N$ are supported on $cal(D)$, and that for every measurable $0 lt.eq g lt.eq 1$, 
#[#set math.equation(numbering: n => "(33)")
 $ integral g thin d eta_j lt.eq U (integral_(cal(D)) g thin d lambda)^(1 - 1 \/ p) #h(2em) \( 1 lt.eq j lt.eq N \) . $ <h:alt:test>]

 For measurable routes $g_j gt.eq 0$ with $sum_j g_j lt.eq 1$, 
#[#set math.equation(numbering: n => "(34)")
 $ sum_(j = 1)^N integral g_j thin d eta_j lt.eq N^(1 \/ p) U thin lambda \( cal(D) \)^(1 - 1 \/ p) . $ <h:alt:selection-bound>]

 A sufficient condition for (33) is $eta_j = f_j lambda$, where $f_j gt.eq 0$ vanishes outside $cal(D)$ and $parallel f_j parallel_(L^p \( lambda \)) lt.eq U$.]
  #emph[In particular, if $r > 0$, $m \, beta in bb(R)$, and positive constants $H \, V \, L$ satisfy 
$ U lt.eq H L r^(beta - m \( 1 - 1 \/ p \)) \, #h(2em) lambda \( cal(D) \) lt.eq V r^m \, $

 then the right side of (34) is at most 
#[#set math.equation(numbering: n => "(35)")
 $ N^(1 \/ p) H V^(1 - 1 \/ p) L r^beta . $ <h:alt:scale-cancellation>]

]
] <h:alt:selection>

#proof[
  Each $g_j$ lies in $\[ 0 \, 1 \]$. Put $b_j = integral_(cal(D)) g_j thin d lambda$. Equation (33) and Hölder on the finite index set give
  $ sum_j integral g_j thin d eta_j lt.eq U sum_j b_j^(1 - 1 \/ p) lt.eq U N^(1 \/ p) (sum_j b_j)^(1 - 1 \/ p) . $
  Since $sum_j g_j lt.eq 1$, we have $sum_j b_j lt.eq lambda \( cal(D) \)$, proving (34). Under the density condition, Hölder gives
  $ integral g thin d eta_j lt.eq U (integral_(cal(D)) g^(p \/ \( p - 1 \)) thin d lambda)^(1 - 1 \/ p) lt.eq U (integral_(cal(D)) g thin d lambda)^(1 - 1 \/ p) \, $
  because $0 lt.eq g lt.eq 1$. Finally the powers of $r$ in the two assumed bounds add to $beta$, giving (35). ◻
]

The test formulation accommodates a direct open-set limit even when one chooses not to infer a strong $L^p$ density from that limit. The density formulation applies to the other passages. In both cases, the reference measure and the common support must be the ones specified by the corresponding projection estimate.

== 8 A paired-coordinate cube application <h:cube:section>

The exact-density theorem for finite measures also applies to a prior supported on a lower-dimensional subset of the sphere. We illustrate this with a cube embedded by coordinate pairs. Its first coordinates transfer the local mass bound to ambient Euclidean balls, and its Lipschitz bound supplies a common support for the projected labels. These are the hypotheses needed by the general projection and selection estimates.

The resulting success bound concerns the cube prior. It gives a sample lower bound at fine accuracy from cube-average success alone. To cover the remaining accuracies for a learner that succeeds at every unit signal, we use the uniform-sphere endpoint from the main proof.

=== 8.1 The prior and its terminal mass <the-prior-and-its-terminal-mass>

Let $d gt.eq 16$ be an integer, set $n = floor.l d \/ 2 floor.r$, and give

$ Q = \[ - 1 \/ 2 \, 1 \/ 2 \]^n $

Lebesgue probability measure $d u$. The cube has volume one. Define

#[#set math.equation(numbering: n => "(36)")
 $ iota \( u \) = 1 / sqrt(n) #scale(x: 120%, y: 120%)[\(] u_1 \, dots.h \, u_n \, sqrt(1 - u_1^2) \, dots.h \, sqrt(1 - u_n^2) \, 0 \, dots.h \, 0 #scale(x: 120%, y: 120%)[\)] in bb(R)^d \, $ <h:cube:map>]

with $d - 2 n$ zero coordinates. Each coordinate pair contributes $1 \/ n$ to the squared norm, so $iota \( Q \) subset S^(d - 1)$. The signal prior is $iota_(\#) d u$.

Write $"pr" : bb(R)^d arrow.r bb(R)^n$ for projection onto the first $n$ coordinates. Then $"pr" iota \( u \) = u \/ sqrt(n)$. On $\[ - 1 \/ 2 \, 1 \/ 2 \]$, the derivative of $a mapsto sqrt(1 - a^2)$ has absolute value at most $1 \/ sqrt(3)$. The mean value theorem therefore gives

#[#set math.equation(numbering: n => "(37)")
 $ parallel iota \( u \) - iota \( v \) parallel lt.eq 2 / sqrt(n) parallel u - v parallel #h(2em) \( u \, v in Q \) . $ <h:cube:lipschitz>]

Set

#[#set math.equation(numbering: n => "(38)")
 $ alpha = n / 4 \, #h(2em) beta = n - alpha = frac(3 n, 4) \, #h(2em) p = ⌊n / 4⌋ gt.eq 2 . $ <h:cube:parameters>]

For $z in bb(R)^n$ and $r > 0$, abbreviate

$ cal(B) \( z \, r \) = Q ∩ B_n \( z \, sqrt(n) thin r \) \, $

where $B_j \( x \, t \)$ is the closed Euclidean ball in $bb(R)^j$. The local bound for a function $f : Q arrow.r \[ 0 \, 1 \]$ will be

#[#set math.equation(numbering: n => "(39)")
 $ integral_(cal(B) \( z \, r \)) f \( u \) thin d u lt.eq L r^beta #h(2em) \( z in bb(R)^n \, med r > 0 \) . $ <h:cube:local>]

We will propagate the coefficient $L$ backward through the stream.

Fix a terminal state and stopping index, after fixing the independent rule seed. Its output law is independent of the signal. Let $f_(upright("term")) \( u \)$ be the probability that this output has angular error at most $epsilon.alt$ at $iota \( u \)$. For a fixed unit output $hat(s)$, angular error at most $epsilon.alt$ implies chordal error at most $epsilon.alt$. Projection onto the first coordinates then gives

$ parallel u - sqrt(n) thin "pr" hat(s) parallel lt.eq sqrt(n) thin epsilon.alt . $

Let $omega_j$ be the volume of the unit ball in $bb(R)^j$. The Gaussian integral gives $omega_j j^(j \/ 2) lt.eq \( 2 pi e \)^(j \/ 2)$: integrate $e^(- parallel x parallel^2 \/ 2)$ over the ball of radius $sqrt(j)$ and compare with its integral over $bb(R)^j$. The successful part of $cal(B) \( z \, r \)$ lies in two parameter balls, so its volume is at most the smaller of their volumes. With $C_0 = sqrt(2 pi e)$, the terminal success function consequently satisfies

#[#set math.equation(numbering: n => "(40)")
 $ integral_(cal(B) \( z \, r \)) f_(upright("term")) \( u \) thin d u lt.eq C_0^n min \( r \, epsilon.alt \)^n lt.eq C_0^n epsilon.alt^alpha r^beta . $ <h:cube:terminal>]

The last inequality uses $alpha + beta = n$; the same estimate for a random output follows by integration against its signal-independent law.

=== 8.2 Transferring local mass to the embedded measure <transferring-local-mass-to-the-embedded-measure>

Let $gamma_k$ be the law of a $k$-by-$d$ matrix with independent standard Gaussian entries, and put

$ lambda_k \( d A \, d y \) = gamma_k \( d A \) thin d y . $

The following specialization supplies both the exact density and its common support. A parameter function measurable in the Lebesgue completion can first be replaced by a Borel version under $d u$, without changing any local integral.

#thm([Lemma 8.1.])[
  (Exact density and a common projected ellipsoid).  #emph[Let $k$ be an integer with $1 lt.eq k lt.eq p$, and let a Borel function $f : Q arrow.r \[ 0 \, 1 \]$ satisfy (39) with $L gt.eq 0$. For $z in bb(R)^n$ and $r > 0$, define the finite joint measure 
#[#set math.equation(numbering: n => "(41)")
 $ eta_(f \, z \, r) \( E \) = integral #h(-0.16667em) integral_(cal(B) \( z \, r \)) upright(bold(1))_E \( A \, A iota \( u \) \) f \( u \) thin d u thin gamma_k \( d A \) $ <h:cube:joint-measure>]

 for Borel $E subset.eq bb(R)^(k times d) times bb(R)^k$. There is a universal $C_2 gt.eq 1$ such that $eta_(f \, z \, r) = h_(f \, z \, r) lambda_k$ for a nonnegative density with 
#[#set math.equation(numbering: n => "(42)")
 $ parallel h_(f \, z \, r) parallel_(L^p \( lambda_k \)) lt.eq C_2^n L r^(beta - k \( 1 - 1 \/ p \)) . $ <h:cube:density-bound>]

 If $cal(B) \( z \, r \) eq.not diameter$, fix any $u_(*) in cal(B) \( z \, r \)$ and set 
#[#set math.equation(numbering: n => "(43)")
 $ cal(E)_(u_(*) \, r) = { \( A \, y \) : y in A iota \( u_(*) \) + A B_d \( 0 \, 4 r \) } . $ <h:cube:ellipsoid-support>]

 Every such density, for this same $z \, r \, u_(*)$, vanishes almost everywhere outside $cal(E)_(u_(*) \, r)$, and 
#[#set math.equation(numbering: n => "(44)")
 $ lambda_k \( cal(E)_(u_(*) \, r) \) lt.eq C_2^n r^k . $ <h:cube:ellipsoid-volume>]

]
] <h:cube:density>

#proof[
  An empty $cal(B) \( z \, r \)$ gives the zero measure. Otherwise fix $u_(*) in cal(B) \( z \, r \)$, and let
  $ mu = iota_(\#) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(cal(B) \( z \, r \)) f \( u \) thin d u #scale(x: 120%, y: 120%)[\)] . $
  For any $x in bb(R)^d$ and $t > 0$, projection onto the first coordinates gives
  #[#set math.equation(numbering: n => "(45)")
   $ mu \( B_d \( x \, t \) \) & lt.eq integral_(cal(B) \( sqrt(n) thin "pr" x \, t \)) f \( u \) thin d u\
 & lt.eq L t^beta . $ <h:cube:ambient-growth>]
  For $u in cal(B) \( z \, r \)$, the distance from $u$ to $u_(*)$ is at most $2 sqrt(n) thin r$. Thus (37) puts $mu$ inside $B_d \( iota \( u_(*) \) \, 4 r \)$.
  If $L = 0$, (39) applied to a ball containing $Q$ gives $f = 0$ almost everywhere, and the zero density suffices. Suppose now that $L > 0$. Apply the general finite-measure result Theorem 6 with
  $ H = L \, #h(2em) R = 4 r \, #h(2em) m = k \, #h(2em) beta = 3 n \/ 4 \, #h(2em) p = floor.l n \/ 4 floor.r . $
  For its factors $J_j$, the required margin and their uniform bounds are
  #[#set math.equation(numbering: n => "(46)")
   $ beta - j - k gt.eq frac(3 n, 4) - 2 p + 2 gt.eq n / 4 + 2 \, #h(2em) J_j = 1 + 3^j 2^beta frac(k, beta - j - k) lt.eq 1 + 3^(n \/ 4) 2^(3 n \/ 4) #h(2em) \( 0 lt.eq j lt.eq p - 2 \) . $ <h:cube:margin>]
  In particular $beta > k + p - 2$. We use the general parameter range of that theorem, not the specialization to exponents near half the ambient dimension. Its exact norm bound is
  $ \( 2 pi \)^(- k \( p - 1 \) \/ \( 2 p \)) L \( 4 r \)^(beta - k \( 1 - 1 \/ p \)) (product_(j = 0)^(p - 2) J_j)^(1 \/ p) . $
  The first factor is at most one, each $J_j lt.eq C^n$, and $0 < beta - k \( 1 - 1 \/ p \) lt.eq beta$. Absorbing $4^(beta - k \( 1 - 1 \/ p \)) lt.eq 4^beta$ into $C_2^n$ proves (42). This is the density of the exact joint measure (41); no density relative to spherical area is assumed.
  The set $cal(E)_(u_(*) \, r)$ is the exact projected image of the enclosing ball $B_d \( iota \( u_(*) \) \, 4 r \)$. Lemma 12 makes this set Borel and gives the asserted common support. The same lemma gives
  $ lambda_k \( cal(E)_(u_(*) \, r) \) lt.eq C_(upright(E))^d \( 4 r \)^k lt.eq C_2^n r^k \, $
  after one universal increase of $C_2$, since $d lt.eq 2 n + 1$ and $k lt.eq n \/ 4$. This calculation also covers the zero-density case. ◻
]

=== 8.3 The block bound and the streaming consequence <the-block-bound-and-the-streaming-consequence>

The power of $r$ lost in the density norm is restored by the common support volume. Selection then costs only the $p$th root of the number of continuations.

#thm([Corollary 8.2.])[
  (A block on the paired-coordinate prior).  #emph[Let $k \, N$ be integers with $1 lt.eq k lt.eq p$ and $N gt.eq 1$, and let Borel $f_1 \, dots.h \, f_N : Q arrow.r \[ 0 \, 1 \]$ satisfy (39) with the same $L gt.eq 0$. Suppose Borel functions $g_v : bb(R)^(k times d) times bb(R)^k arrow.r \[ 0 \, oo \)$ obey $sum_(v = 1)^N g_v \( A \, y \) lt.eq 1$. Then 
$ F \( u \) = bb(E)_(A tilde.op gamma_k) sum_(v = 1)^N g_v \( A \, A iota \( u \) \) f_v \( u \) $

 satisfies (39) with $C_3^n N^(1 \/ p) L$ in place of $L$, for a universal $C_3 gt.eq 1$.]
] <h:cube:block>

#proof[
  Fix $z \, r$. An empty $cal(B) \( z \, r \)$ is immediate. Otherwise choose the same $u_(*) in cal(B) \( z \, r \)$ for all $v$. The exact joint densities from Lemma 19 share its region $cal(E)_(u_(*) \, r)$. Apply Lemma 18 with density norm at most $C_2^n L r^(beta - k \( 1 - 1 \/ p \))$ and domain measure at most $C_2^n r^k$. The image-measure identity and that lemma give
  #[#set math.equation(numbering: n => "(47)")
   $ integral_(cal(B) \( z \, r \)) F \( u \) thin d u lt.eq N^(1 \/ p) C_2^n \( C_2^n \)^(1 - 1 \/ p) L r^beta lt.eq C_3^n N^(1 \/ p) L r^beta . $ <h:cube:selection>]
  The radius powers cancel, and the same $C_3$ works for every $1 lt.eq k lt.eq p$. ◻
]

To apply this bound to the model’s completed-measurable rules, first observe that $f = 1$ satisfies

$ \| cal(B) \( z \, r \) \| lt.eq min { 1 \, C_0^n r^n } lt.eq C_0^n r^beta . $

Take $k = 1$ in Lemma 19 and a parameter ball containing $Q$. The fresh pair $\( X \, chevron.l X \, iota \( u \) chevron.r \)$, for $u tilde.op d u$, is therefore absolutely continuous relative to $gamma_1 \( d x \) thin d y$. We may consequently use the seedwise Borel reduction and fresh-state continuations of Section 5.2 under this cube prior. As there, the conditional numerical estimates are averaged using the original measurable experiment; no jointly chosen family of Borel replacements is required.

#thm([Proposition 8.3.])[
  (Precision bound for the cube prior).  #emph[There are universal constants $D gt.eq e$, $d_0 gt.eq 16$, and $c > 0$ with the following property. Let $d gt.eq d_0$, $M gt.eq 0$, and $T gt.eq 0$ be integers, with $M lt.eq d^2$ and $0 < epsilon.alt lt.eq 1 \/ 10$. Every learner in Definition 1 with these memory and sample bounds has angular success probability under $s = iota \( u \)$, $u tilde.op d u$, at most 
#[#set math.equation(numbering: n => "(48)")
 $ min {1 \, thin D^(n \( m + 1 \)) epsilon.alt^(n \/ 4)} \, #h(2em) m = ⌈T / k_0⌉ \, #h(2em) k_0 = ⌊n / 4⌋ . $ <h:cube:success-bound>]

 The probability averages over $u$, the fresh Gaussian samples, and the learner’s randomness. If that same learner has angular success probability at least $2 \/ 3$ for every $s in S^(d - 1)$, then 
#[#set math.equation(numbering: n => "(49)")
 $ T gt.eq c thin d log \( 1 \/ epsilon.alt \) . $ <h:cube:sample-result>]

]
] <h:cube:success>

#proof[
  Use the seedwise convention just established, and first start from any prescribed initial state. For $T > 0$, partition the stream into $m = ceil.l T \/ p ceil.r$ consecutive blocks, each of length at most $p = k_0$. Lemma 14, with angular terminal score and signal $iota \( u \)$, represents the preceding success function by the exact block formula in Corollary 20. For a block of length $k$, its Borel routes have at most
  #[#set math.equation(numbering: n => "(50)")
   $ N lt.eq \( k + 2 \) 2^M $ <h:cube:destinations>]
  destinations. The stopping offsets are local to this block, including an immediate stop; its continuing functions use fresh future samples. These are the same phase and terminal-state conventions as in that lemma.
  For $n gt.eq 8$, $p gt.eq n \/ 8$, $d lt.eq 2 n + 1$, and $M lt.eq d^2$,
  $ frac(log N, p) lt.eq frac(d^2 log 2 + log \( p + 2 \), p) lt.eq C_4 n $
  with a universal $C_4$. Choose a universal $D gt.eq e$ so that $D gt.eq C_0$ and $C_3^n N^(1 \/ p) lt.eq D^n$. The terminal coefficient is $C_0^n epsilon.alt^(n \/ 4)$ by (40). Backward induction, applying the block bound and retaining the terminal estimate at earlier stops, gives coefficient
  $ L = D^(n \( m + 1 \)) epsilon.alt^(n \/ 4) $
  for every initial state. The ball $cal(B) \( 0 \, 1 \)$ contains $Q$, so this coefficient bounds total cube-average success. For $T = 0$, the terminal bound gives the same statement with $m = 0$. All constants are uniform over the seedwise Borel rules and prescribed states. The independent conditional initialization and the averaging of original conditional success probabilities from Section 5.2 therefore prove (48) for the original learner, including every short last block.
  Suppose now only that the cube-average success is at least $2 \/ 3$. Taking natural logarithms in (48) and using $m lt.eq T \/ k_0 + 1$ gives
  #[#set math.equation(numbering: n => "(51)")
   $ T / k_0 gt.eq frac(log \( 1 \/ epsilon.alt \), 4 log D) - 2 - frac(log \( 3 \/ 2 \), n log D) . $ <h:cube:sample-bound>]
  If $log \( 1 \/ epsilon.alt \) gt.eq 24 log D$, its right side is at least $log \( 1 \/ epsilon.alt \) \/ \( 8 log D \)$. Since $k_0 gt.eq n \/ 8$ and $n gt.eq d \/ 3$, this already gives $T gt.eq d log \( 1 \/ epsilon.alt \) \/ \( 192 log D \)$ in that accuracy range.
  For the all-accuracy conclusion (49), assume the stated every-signal guarantee. It gives the cube-average premise just used. It also gives uniform-sphere average success at least $2 \/ 3$ for the same original learner. The reflection consequence (31) therefore forces $T > d \/ 4$. For $log \( 1 \/ epsilon.alt \) < 24 log D$, this implies
  $ T > d / 4 > frac(d log \( 1 \/ epsilon.alt \), 96 log D) . $
  Combining the two ranges proves (49), for example with $c = 1 \/ \( 192 log D \)$, after increasing the universal dimension threshold as needed. The memory condition $M lt.eq d^2$ in particular holds eventually for every sequence $M \( d \) = o \( d^2 \)$. ◻
]

=== 8.4 An affine-distance interpretation <an-affine-distance-interpretation>

The application is complete. The embedding also gives a direct interpretation of the Gram moment behind its projection bound. This alternative calculation isolates what the first coordinates guarantee about affine spans. For $u \, u_1 \, dots.h \, u_j in Q$, $j gt.eq 1$,

#[#set math.equation(numbering: n => "(52)")
 $ "dist" #scale(x: 120%, y: 120%)[\(] iota \( u \) \, "aff" \( iota \( u_1 \) \, dots.h \, iota \( u_j \) \) #scale(x: 120%, y: 120%)[\)] gt.eq 1 / sqrt(n) "dist" #scale(x: 120%, y: 120%)[\(] u \, "aff" \( u_1 \, dots.h \, u_j \) #scale(x: 120%, y: 120%)[\)] . $ <h:cube:affine>]

Indeed, for $sum_i c_i = 1$, projection of $iota \( u \) - sum_i c_i iota \( u_i \)$ is $\( u - sum_i c_i u_i \) \/ sqrt(n)$. Projection cannot increase norm, and taking the infimum proves the claim, including dependent points.

#thm([Lemma 8.4.])[
  (Affine inverse moments).  #emph[Let $f : Q arrow.r \[ 0 \, 1 \]$ be Borel and satisfy (39) with $L gt.eq 0$. Let $k$ be an integer with $1 lt.eq k lt.eq p$, and let $V subset.eq bb(R)^n$ be a nonempty affine subspace of dimension $j lt.eq p - 2$. There is a universal $C_1 gt.eq 1$ such that, for every $z in bb(R)^n$, $r > 0$, and $0 < t lt.eq 1$, 
#[#set math.equation(numbering: n => "(53)")
 $ integral_(cal(B) \( z \, r \)) f \( u \) upright(bold(1))_({ "dist" \( u \, V \) lt.eq sqrt(n) thin t r }) thin d u & lt.eq C_1^n L r^beta t^(beta - j) \,\
integral_(cal(B) \( z \, r \)) f \( u \) (frac("dist" \( u \, V \), sqrt(n)))^(- k) thin d u & lt.eq C_1^n L r^(beta - k) . $ <h:cube:tube>]

 The second integrand is nonnegative and extended-valued on $V$.]
] <h:cube:inverse>

#proof[
  The cases $L = 0$ and an empty parameter ball are immediate as above. Apply Proposition 7 in parameter dimension $n$ to $upright(bold(1))_(cal(B) \( z \, r \)) f \( u \) thin d u$, with
  $ H = L n^(- beta \/ 2) \, #h(2em) R = sqrt(n) thin r \, #h(2em) m = k . $
  The growth hypothesis follows because a parameter ball of radius $a > 0$ is $cal(B) \( x \, a \/ sqrt(n) \)$ after intersection with $Q$. Its tube bound, evaluated at $sqrt(n) thin t r$, is
  $ 3^j 2^beta \( L n^(- beta \/ 2) \) \( sqrt(n) thin r \)^j \( sqrt(n) thin t r \)^(beta - j) = 3^j 2^beta L r^beta t^(beta - j) . $
  Its inverse-distance bound is $J_j L n^(- k \/ 2) r^(beta - k)$. Multiplication by $n^(k \/ 2)$ gives the normalization in (53). The bounds (46) absorb both constants into a universal $C_1^n$. ◻
]

For example, let $G$ be the Gram matrix of the $p - 1$ differences $iota \( u_i \) - iota \( u_1 \)$, $2 lt.eq i lt.eq p$. Almost every parameter tuple is affinely independent, since proper affine subspaces of $bb(R)^n$ have zero Lebesgue measure. Writing $V_(i - 1) = "aff" \( u_1 \, dots.h \, u_(i - 1) \)$, Gram–Schmidt and (52) give

#[#set math.equation(numbering: n => "(54)")
 $ det G gt.eq product_(i = 2)^p (frac("dist" \( u_i \, V_(i - 1) \), sqrt(n)))^2 > 0 . $ <h:cube:gram>]

Integrating in the order $u_p \, dots.h \, u_2$, followed by $u_1$, therefore yields

$ integral_(cal(B) \( z \, r \)^p) det G^(- k \/ 2) product_(i = 1)^p f \( u_i \) thin d u_1 dots.h.c d u_p lt.eq C_1^(n \( p - 1 \)) L^p r^(beta p - k \( p - 1 \)) . $

Thus one can also obtain the projection bound by inserting this Gram estimate into the Gaussian difference identity and compact-test passage of Section 3. The main application instead uses the general finite-measure theorem through the ambient ball bound (45).

===== 8.4.1 An enclosing-ball alternative. <an-enclosing-ball-alternative.>

The common ellipsoid may instead be enclosed in the larger label ball

#[#set math.equation(numbering: n => "(55)")
 $ cal(R)_A = B_k #scale(x: 120%, y: 120%)[\(] A iota \( u_(*) \) \, 4 r parallel A parallel_(upright("op")) #scale(x: 120%, y: 120%)[\)] . $ <h:cube:support>]

Thus every density in Lemma 19, with the same $z \, r \, u_(*)$, also vanishes almost everywhere outside ${ \( A \, y \) : y in cal(R)_A }$. Its volume has the bound

#[#set math.equation(numbering: n => "(56)")
 $ bb(E)_(A tilde.op gamma_k) \| cal(R)_A \| = \( 4 r \)^k bb(E) thin "vol"_k B_k \( 0 \, parallel A parallel_(upright("op")) \) lt.eq 4^k e^(C d) r^k lt.eq C_2^n r^k \, $ <h:cube:volume>]

after a universal increase of $C_2$, where $\| cal(R)_A \|$ is $k$-dimensional Lebesgue volume. This estimate follows independently from the Gaussian net bound in Lemma 30, not from the smaller ellipsoid’s volume. It gives the same block bound, although the direct proof above uses the exact projected ellipsoid and does not require this enlargement.

== 9 Other exact-label interfaces <h:dv:section>

Theorem 6 supplies the strong joint $L^p$ density used in both applications. We now separate three additional conclusions that need not be built into that theorem. A direct difference-kernel argument proves the measurable-test estimate needed for selection without using compact-test duality. For spherical restrictions, joint $L^1$ convergence identifies the limiting density; a specified pointwise version works for every full-row-rank matrix, rather than only almost every matrix.

We retain the notation $eta_mu \, lambda_m \, cal(E)_(z \, R)$ of Section 3 and the exact norm scale $cal(B)$ in (10). The coefficient $H$ controls mass in all ambient balls, while $R$ is the radius of a supporting ball; neither measure is normalized to a posterior.

=== 9.1 A direct bound for measurable tests <a-direct-bound-for-measurable-tests>

#thm([Proposition 9.1.])[
  (A direct inequality for measurable tests).  #emph[Under the assumptions of Proposition 7, the exact image measure satisfies 
#[#set math.equation(numbering: n => "(57)")
 $ eta_mu \( E \) lt.eq cal(B) thin lambda_m \( E \)^(1 - 1 \/ p) $ <h:dv:set-bound>]

 for every Borel set $E$ of finite $lambda_m$-measure. In particular $eta_mu lt.double lambda_m$, and the same inequality holds on the $lambda_m$-completion after extending $eta_mu$ to that completion. For every $lambda_m$-completed-measurable $0 lt.eq phi lt.eq 1$, 
#[#set math.equation(numbering: n => "(58)")
 $ integral phi thin d eta_mu lt.eq cal(B) (integral_(cal(E)_(z \, R)) phi thin d lambda_m)^(1 - 1 \/ p) . $ <h:dv:test-bound>]

 An infinite integral on the right is allowed.]
] <h:dv:measurable-test>

#proof[
  Let $rho_delta = \( v_m delta^m \)^(- 1) upright(bold(1))_(B \( 0 \, delta \))$ be the uniform probability density of the radius-$delta$ ball in $bb(R)^m$, and set $U_delta \( A \, y \) = integral rho_delta \( y - A s \) thin d mu \( s \)$. After translating the common label variable by $A s_1$, the tuple kernel in its $p$th moment becomes
  $ K_delta \( v_2 \, dots.h \, v_p \) = integral_(bb(R)^m) rho_delta \( b \) product_(i = 2)^p rho_delta \( b - v_i \) thin d b \, #h(2em) v_i = A \( s_i - s_1 \) . $
  It is nonnegative, and Tonelli’s theorem gives the exact normalization
  #[#set math.equation(numbering: n => "(59)")
   $ integral_(bb(R)^(m \( p - 1 \))) K_delta \( v_2 \, dots.h \, v_p \) thin d v_2 dots.h.c d v_p = 1 . $ <h:dv:difference-kernel>]
  In particular the kernel depends on $A$ only through the differences; no independence of $A s_1$ from those differences is used.
  For a full-rank $V$, the rows of $A V$ are independent centered Gaussian vectors with covariance $V^(sans(T)) V$. Their joint density has supremum $\( 2 pi \)^(- m \( p - 1 \) \/ 2) det \( V^(sans(T)) V \)^(- m \/ 2)$. Multiplying this density by the unit-mass kernel (59) bounds the expected tuple kernel by that supremum. Expand $integral U_delta^p thin d lambda_m$, discard only the product-null rank exceptions, and apply (13). This gives
  #[#set math.equation(numbering: n => "(60)")
   $ parallel U_delta parallel_(L^p \( lambda_m \)) lt.eq cal(B) #h(2em) \( delta > 0 \) . $ <h:dv:difference-moment>]
  The measure $lambda_m$ is Borel and finite on compact sets in a Euclidean space. The Radon extension theorem #cite(label("StanfordRadonMeasures")) Corollary 2.11 applies and gives outer regularity on Borel sets. If $O$ is open, then for each $\( A \, A s \) in O$, all sufficiently small label perturbations remain in $O$. Fatou’s lemma followed by Hölder’s inequality gives
  $ eta_mu \( O \) lt.eq liminf_(delta arrow.b 0) integral_O U_delta thin d lambda_m lt.eq cal(B) thin lambda_m \( O \)^(1 - 1 \/ p) . $
  For a Borel $E$ with finite $lambda_m \( E \)$, take open supersets whose $lambda_m$-measures decrease to $lambda_m \( E \)$. The last inequality proves (57). Applied to null sets, it gives $eta_mu lt.double lambda_m$. Extending $eta_mu$ by zero on $lambda_m$-null sets gives the asserted version on the $lambda_m$-completion.
  The measure $eta_mu$ is supported on the Borel set $cal(E)_(z \, R)$. If $integral_(cal(E)_(z \, R)) phi thin d lambda_m < oo$, apply (57) to ${ phi > t } ∩ cal(E)_(z \, R)$ for $t > 0$. Layer cake and concavity of $x^(1 - 1 \/ p)$ yield
  $ integral phi thin d eta_mu & lt.eq cal(B) integral_0^1 lambda_m \( { phi > t } ∩ cal(E)_(z \, R) \)^(1 - 1 \/ p) thin d t\
 & lt.eq cal(B) (integral_0^1 lambda_m \( { phi > t } ∩ cal(E)_(z \, R) \) thin d t)^(1 - 1 \/ p) \, $
  which is (58). The case of an infinite right side is immediate. This proof supplies the measurable-test estimate directly; it does not infer a strong $L^p$ bound from the set inequality alone. ◻
]

=== 9.2 Spherical absolute continuity and compatible fibers <spherical-absolute-continuity-and-compatible-fibers>

The remaining constructions use an additional hypothesis: $mu lt.double sigma_d$ and $m < d$. It provides absolute continuity for each full-row-rank matrix separately. This hypothesis is not needed by the general finite-measure theorem or the preceding direct-test bound.

#thm([Lemma 9.2.])[
  (Absolute continuity of spherical projections).  #emph[Let $d gt.eq 2$ and $1 lt.eq m < d$. If $A : bb(R)^d arrow.r bb(R)^m$ has full row rank, then $A_(\#) sigma_d$ is absolutely continuous with respect to Lebesgue measure. The same holds for $A_(\#) mu$ whenever $mu$ is a finite Borel measure with $mu lt.double sigma_d$.]
] <h:dv:gaussian-ac>

#proof[
  Rotate the row space of $A$ to the first $m$ coordinates. The restriction of $A$ to that row space is an invertible map onto $bb(R)^m$, so it suffices to consider the orthogonal projection onto those coordinates. Write a uniform sphere point as
  $ frac(\( Z \, W \), sqrt(parallel Z parallel^2 + parallel W parallel^2)) \, $
  where $Z$ and $W$ are independent standard Gaussian vectors in $bb(R)^m$ and $bb(R)^(d - m)$. Almost surely $c = parallel W parallel > 0$. Conditional on $c$, the projection is the image of $Z$ under
  $ z mapsto z / sqrt(parallel z parallel^2 + c^2) . $
  This is a smooth diffeomorphism from $bb(R)^m$ onto the open unit ball; its inverse is $u mapsto c u \/ sqrt(1 - parallel u parallel^2)$. Thus the conditional projection law has a Lebesgue density, and integrating in $c$ preserves absolute continuity. Applying the invertible row-space map proves the assertion for $A_(\#) sigma_d$. Absolute continuity of $A_(\#) mu$ follows from $mu lt.double sigma_d$. ◻
]

#proof[
  #emph[A second proof by hemisphere graphs.]  The two open hemispheres of $S^(d - 1)$ are the graphs
  $ x mapsto #scale(x: 120%, y: 120%)[\(] x \, plus.minus sqrt(1 - parallel x parallel^2) #scale(x: 120%, y: 120%)[\)] \, #h(2em) parallel x parallel < 1 \, quad x in bb(R)^(d - 1) . $
  Their surface-area element is $\( 1 - parallel x parallel^2 \)^(- 1 \/ 2) d x$, and the omitted equator has surface measure zero. Projection of $sigma_d$ onto the first $d - 1$ coordinates therefore has a Lebesgue density. Integrating that density in the last $d - 1 - m$ coordinates proves the same for projection onto the first $m$ coordinates. Rotation, the invertible row-space map, and $mu lt.double sigma_d$ finish the argument as in the first proof. ◻
]

#thm([Lemma 9.3.])[
  (A joint density and its fibers).  #emph[Let $d gt.eq 2$, $1 lt.eq m < d$, and let $mu$ be a finite nonnegative Borel measure with $mu lt.double sigma_d$. Then $eta_mu$ has a nonnegative jointly Borel density $F \( A \, y \)$ with respect to $lambda_m$. For $gamma_m$-almost every $A$, $F \( A \, dot.op \)$ is a density of $A_(\#) mu$.]
  #emph[If $mu$ is supported on $B \( z \, R \)$, the density can be chosen to vanish outside the Borel set $cal(E)_(z \, R) subset.eq cal(S)_(z \, R)$ defined in (8).]
] <h:dv:joint-density>

#proof[
  For a Borel set $E$ in the matrix–label space, put $E_A = { y : \( A \, y \) in E }$. If $lambda_m \( E \) = 0$, Fubini’s theorem gives $\| E_A \| = 0$ for $gamma_m$-almost every $A$. Such a matrix has full row rank almost surely, and Lemma 24 therefore gives $\( A_(\#) mu \) \( E_A \) = 0$. A second application of Fubini shows that $eta_mu \( E \) = 0$. Thus the finite measure $eta_mu$ is absolutely continuous with respect to the $sigma$-finite measure $lambda_m$. The ordinary Radon–Nikodym theorem #cite(label("HunterMeasure2011")) Theorem 6.27, applied on the product Borel $sigma$-algebra, gives a nonnegative jointly Borel density $F$.
  We verify that one common full-measure set of matrices has the asserted fiber property. Let $cal(C)$ be the countable $pi$-system of half-open boxes with rational endpoints, the empty set, and $bb(R)^m$ itself. It generates the Borel sets of $bb(R)^m$. For $C in cal(C)$ and every Borel matrix set $D$, the density identity applied to $D times C$ gives
  $ integral_D \( A_(\#) mu \) \( C \) thin d gamma_m \( A \) = integral_D integral_C F \( A \, y \) thin d y thin d gamma_m \( A \) . $
  Both integrands are measurable functions of $A$. Since this equality holds for every $D$, they agree almost everywhere. Remove the union of these exceptional sets over the countable class $cal(C)$. For every remaining $A$, the two finite measures agree on $cal(C)$, and hence on every Borel set by the uniqueness theorem for measures. This proves the fiber assertion.
  When $mu$ is supported on $B \( z \, R \)$, its image is carried by the Borel set $cal(E)_(z \, R)$. Multiplying $F$ by the indicator of that set preserves the density identity. ◻
]

=== 9.3 Convergence and an everywhere-full-rank version <convergence-and-an-everywhere-full-rank-version>

The next result asserts actual convergence in the joint $L^1$ space. The final proposition specifies a single Borel version whose fiber is a density for every full-row-rank matrix, with a separate Lebesgue-null exceptional set of labels allowed for each matrix.

#thm([Proposition 9.4.])[
  (Joint $L^1$ convergence).  #emph[In addition to the assumptions of Proposition 7, suppose that $d gt.eq 2$, $1 lt.eq m < d$, and $mu lt.double sigma_d$. Let $F$ be the joint density from Lemma 25, and let $F_delta$ be the Gaussian regularization in Lemma 9. Then 
#[#set math.equation(numbering: n => "(61)")
 $ parallel F_delta - F parallel_(L^1 \( lambda_m \)) arrow.r 0 quad upright("as ") delta arrow.b 0 \, #h(2em) parallel F parallel_(L^p \( lambda_m \)) lt.eq cal(B) . $ <h:dv:joint-l1-bound>]

]
] <h:dv:joint-l1>

#proof[
  For almost every $A$, the function $F_A = F \( A \, dot.op \)$ is a nonnegative $L^1$ density of $A_(\#) mu$, of mass $mu \( bb(R)^d \)$, and $F_delta \( A \, dot.op \) = F_A * phi.alt_delta$. Tao’s continuity theorem for translations in $L^1 \( bb(R)^m \)$ #cite(label("TaoMeasure2011")) Proposition 1.6.13 gives
  $ parallel F_A * phi.alt_delta - F_A parallel_1 lt.eq integral phi.alt_delta \( z \) thin parallel F_A \( thin dot.op - z \) - F_A parallel_1 thin d z arrow.r 0 . $
  For completeness, fix a small translation radius on which the translation norm is small. The integral inside that radius is then small, and the remaining part is at most $2 parallel F_A parallel_1$ times the Gaussian mass outside that radius, which tends to zero. This proves the displayed limit.
  The fiber difference norm is at most $2 mu \( bb(R)^d \)$. Because $F$ and $F_delta$ are jointly measurable, these norms are measurable functions of $A$. Dominated convergence in $gamma_m$ therefore proves the joint $L^1$ limit. Choose a sequence $delta_i arrow.b 0$ for which $sum_i parallel F_(delta_i) - F parallel_(L^1 \( lambda_m \)) < oo$. Tonelli’s theorem implies $F_(delta_i) arrow.r F$ almost everywhere. Fatou’s lemma and (15) then give $integral F^p thin d lambda_m lt.eq cal(B)^p$. The density identity from Lemma 25 now applies to arbitrary bounded $lambda_m$-completed-measurable functions of the exact matrix–label pair. ◻
]

#thm([Proposition 9.5.])[
  (A pointwise joint density version).  #emph[Assume the same hypotheses as in Proposition 26. For the Gaussian density $phi.alt_delta$, define 
#[#set math.equation(numbering: n => "(62)")
 $ w_delta \( r \) = v_m r^m r / delta^2 phi.alt_delta \( r e_1 \) \, #h(2em) r > 0 \, $ <h:dv:radial-mixture>]

 where $e_1$ is a unit coordinate vector. This is a probability density on $\( 0 \, oo \)$, and $phi.alt_delta$ is the corresponding mixture of uniform ball densities. Define 
#[#set math.equation(numbering: n => "(63)")
 $ F^sharp \( A \, y \) = cases(delim: "{", lim_(i arrow.r oo) F_(1 \/ i) \( A \, y \) \, & upright("if this limit exists and is finite") \,, 0 \, & upright("otherwise") .) $ <h:dv:pointwise-version>]

 Then $F^sharp$ is jointly Borel. For every full-row-rank $A$, $F^sharp \( A \, dot.op \)$ is a density of $A_(\#) mu$ up to a Lebesgue null set, and it is a density of $eta_mu$ with respect to $lambda_m$. Moreover 
#[#set math.equation(numbering: n => "(64)")
 $ integral \( F^sharp \)^p thin d lambda_m lt.eq cal(B)^p . $ <h:dv:pointwise-moment>]

]
] <h:dv:pointwise-density>

#proof[
  The negative radial derivative of the Gaussian is $- frac(d, d r) phi.alt_delta \( r e_1 \) = \( r \/ delta^2 \) phi.alt_delta \( r e_1 \)$. Hence
  $ integral_(parallel y parallel)^oo frac(w_delta \( r \), v_m r^m) thin d r = phi.alt_delta \( y \) . $
  This is precisely the claimed ball mixture. Integrating it in $y$ and using Tonelli proves $integral_0^oo w_delta \( r \) thin d r = 1$. Also $w_delta \( r \) = delta^(- 1) w_1 \( r \/ delta \)$; its probability mass therefore concentrates at radius zero as $delta arrow.b 0$.
  Fix a full-row-rank $A$. Lemma 24 gives a nonnegative $L^1$ density $f_A$ of $A_(\#) mu$. At a Lebesgue point $y$ of $f_A$, its ball averages
  $ a_r \( y \) = frac(1, v_m r^m) integral_(B \( y \, r \)) f_A \( x \) thin d x $
  tend to $f_A \( y \)$ as $r arrow.b 0$, by the Lebesgue differentiation theorem #cite(label("TaoMeasure2011")) Theorem 1.6.19. The mixture formula gives
  $ F_delta \( A \, y \) = \( f_A * phi.alt_delta \) \( y \) = integral_0^oo w_delta \( r \) a_r \( y \) thin d r . $
  Given an error tolerance, choose $r_0 > 0$ such that $a_r \( y \)$ is within that tolerance of $f_A \( y \)$ for $0 < r < r_0$. For $r gt.eq r_0$, the averages are bounded by $mu \( bb(R)^d \) \/ \( v_m r_0^m \)$. The part of the mixture on $\[ r_0 \, oo \)$ thus tends to zero after subtracting $f_A \( y \)$, while the part on $\( 0 \, r_0 \)$ has the chosen error bound. It follows that $F_delta \( A \, y \) arrow.r f_A \( y \)$ at every Lebesgue point.
  Each $F_(1 \/ i)$ is jointly Borel. The set where its sequence has a finite limit is Borel, so (63) is jointly Borel as well. The preceding fixed-$A$ argument shows that its fiber is a density for every full-row-rank $A$, outside a null set of labels. Full row rank holds $gamma_m$-almost surely, and Fubini therefore identifies $F^sharp$ with a joint density of $eta_mu$. Finally $\( F^sharp \)^p lt.eq liminf_i F_(1 \/ i)^p$ everywhere by its definition. Fatou’s lemma and (15) prove (64). ◻
]

The direct-test argument applies to the arbitrary finite measure in Proposition 7. The joint $L^1$ and pointwise constructions use the additional spherical absolute continuity, which holds for every restriction $mu = upright(bold(1))_(B \( z \, R \)) h thin sigma_d$ with $0 lt.eq h lt.eq 1$. In each case the resulting test or density identity is for exact observations.

== 10 Coefficient recurrences and support alternatives <h:ev:section>

The main block estimate propagated a scale inside a fixed radius power. An equivalent formulation propagates the coefficient of that power. Keeping the exponent variable makes the different terminal accuracy powers visible, while one recurrence handles all of them. The density and exact ellipsoid estimates have already been proved. We first record their spherical specialization and two optional calculations, then give the common coefficient recurrence.

Write $sigma = sigma_d$ and $n = d - 1$. For unit vectors $u \, v$, put $"angle" \( u \, v \) = arccos chevron.l u \, v chevron.r$. The following specialization keeps the local exponent variable while fixing a common moment order.

#thm([Corollary 10.1.])[
  (The dimension-scale parameter regime).  #emph[Under the hypotheses of Proposition 7, suppose that 
#[#set math.equation(numbering: n => "(65)")
 $ d gt.eq 16 \, #h(2em) p = floor.l d \/ 8 floor.r \, #h(2em) 1 lt.eq m lt.eq p \, #h(2em) frac(d - 1, 2) lt.eq beta lt.eq d / 2 \, $ <h:dv:parameters>]

 Then, for every $0 lt.eq j lt.eq p - 2$, 
#[#set math.equation(numbering: n => "(66)")
 $ beta - j - m gt.eq frac(d - 1, 2) - 2 p + 2 gt.eq d / 4 + 3 / 2 \, #h(2em) J_j lt.eq C^d \, $ <h:dv:dimension-margin>]

 where $C gt.eq 1$ is an absolute constant. Thus the right side of (13) is at most $C^(d \( p - 1 \)) H^p R^(beta p - m \( p - 1 \))$, uniformly also for short blocks $m < p$.]
]

#proof[
  Under (65), $p lt.eq d \/ 8$ gives the displayed margin. Also $m \/ \( beta - j - m \) lt.eq 1 \/ 2$, while $3^j 2^beta lt.eq 3^(d \/ 8) 2^(d \/ 2)$. Enlarging one absolute $C$ gives $J_j lt.eq C^d$, and multiplying over the $p - 1$ values of $j$ proves the specialization. ◻
]

Here $p gt.eq d \/ 16$ is the moment order and maximum block length, whereas $m$ is the current number of rows. The constants below are absolute unless a dependence is stated.

=== 10.1 Spherical restrictions and a second moment calculation <spherical-restrictions-and-a-second-moment-calculation>

#thm([Lemma 10.2.])[
  (Exact projection density from an ambient ball bound).  #emph[Assume (65), and let $H \, R > 0$ and $z in bb(R)^d$. Let $f : S^(d - 1) arrow.r \[ 0 \, 1 \]$ be Borel measurable, let $nu = f sigma$, and suppose $nu \( B \( x \, r \) \) lt.eq H r^beta$ for every $x in bb(R)^d$ and $r > 0$. For $mu = upright(bold(1))_(B \( z \, R \)) nu$, the pushforward $A_(\#) mu$ has, for almost every $A$, a Lebesgue density $F \( A \, dot.op \)$. There is an absolute $C_(upright(D)) gt.eq 1$ for which a jointly measurable nonnegative choice of these densities satisfies 
#[#set math.equation(numbering: n => "(67)")
 $ integral F \( A \, y \)^p thin d lambda_m \( A \, y \) lt.eq C_(upright(D))^(d \( p - 1 \)) H^p R^(beta p - m \( p - 1 \)) . $ <h:ev:density-moment>]

 The density represents the exact labels $A s$.]
] <h:ev:density>

#proof[
  The restriction $mu$ is supported on $B \( z \, R \)$ and inherits the all-radius bound. Theorem 6, together with (66), gives its strong joint $L^p$ density and (67). The fiber identification in Lemma 25 gives the asserted common almost-everywhere choice of projection densities. ◻
]

The same bound can be obtained from ball averages with a less sharp explicit prefactor. This calculation is independent of the choice of terminal coefficient or support domain.

For $delta > 0$, set

$ F_delta^(upright("ball")) \( A \, y \) = frac(1, v_m delta^m) integral upright(bold(1))_({ parallel A s - y parallel lt.eq delta }) thin d mu \( s \) . $

These functions are jointly measurable. For almost every $A$ they are the ball averages of the exact density $F \( A \, dot.op \)$; hence Lebesgue differentiation and Fubini give $F_delta^(upright("ball")) arrow.r F$ for $lambda_m$-almost every $\( A \, y \)$ along $delta = 1 \/ k$. In particular this limit, set to zero where it does not exist finitely, is a jointly measurable density version. Expand the $p$th moment and apply Tonelli’s theorem. The intersection of the $p$ balls of radius $delta$ about $A s_1 \, dots.h \, A s_p$ has volume at most $v_m delta^m$, and is empty unless $parallel A \( s_i - s_1 \) parallel lt.eq 2 delta$ for every $i gt.eq 2$. Therefore

#[#set math.equation(numbering: n => "(68)")
 $ integral \( F_delta^(upright("ball")) \)^p thin d lambda_m & lt.eq \( v_m delta^m \)^(- \( p - 1 \)) integral Pr_A { parallel A \( s_i - s_1 \) parallel lt.eq 2 delta \, med 2 lt.eq i lt.eq p } thin d mu^(⊗ p) . $ <h:ev:ball-intersection>]

For a full-column-rank $V = \[ s_2 - s_1 \, dots.h \, s_p - s_1 \]$, the rows of $A V$ are independent centered Gaussian vectors with covariance $V^(sans(T)) V$. Their joint density is bounded above by

$ \( 2 pi \)^(- m \( p - 1 \) \/ 2) det \( V^(sans(T)) V \)^(- m \/ 2) . $

In the difference variables $A V$, the event in (68) lies in the product of $p - 1$ radius-$2 delta$ balls in $bb(R)^m$, whose $m \( p - 1 \)$-dimensional volume is $\( v_m \( 2 delta \)^m \)^(p - 1)$. The exceptional rank-deficient tuples are null by (13). It follows that

#[#set math.equation(numbering: n => "(69)")
 $ integral \( F_delta^(upright("ball")) \)^p thin d lambda_m lt.eq 2^(m \( p - 1 \)) \( 2 pi \)^(- m \( p - 1 \) \/ 2) integral det \( V^(sans(T)) V \)^(- m \/ 2) thin d mu^(⊗ p) . $ <h:ev:ball-moment>]

All factors $v_m delta^m$ have canceled. Combining (69) with (13), absorbing $2^(m \( p - 1 \))$ into an absolute constant to the power $d \( p - 1 \)$, and using Fatou’s lemma proves (67).

For the full-block choice $beta = \( d - 1 \) \/ 2$ and $m = p = floor.l d \/ 8 floor.r$, (69) retains the factor $2^(p \( p - 1 \))$. The margin in (66) is in particular at least $d \/ 8$. Taking the $p$th root gives the form

#[#set math.equation(numbering: n => "(70)")
 $ parallel F parallel_(L^p \( lambda_p \)) lt.eq C_(upright("ball"))^d H R^(beta - p \( 1 - 1 \/ p \)) . $ <h:ev:half-sphere-density>]

For Gaussian averages no new identity is needed: (14) with $k = p$ and (15) give the exact covariance $V^(sans(T)) V + delta^2 \( I_(p - 1) + upright(bold(1)) upright(bold(1))^(sans(T)) \)$ and prefactor $\( 2 pi \)^(- m \( p - 1 \) \/ 2)$. The compact-test, joint-$L^1$, and pointwise passages all give the same moment estimate under their respective hypotheses. In particular, setting $beta = d \/ 2$ in (67) gives, for every $1 lt.eq m lt.eq p$,

#[#set math.equation(numbering: n => "(71)")
 $ bb(E)_A integral F \( A \, y \)^p thin d y lt.eq C_(upright(D))^(d \( p - 1 \)) H^p R^(\( d \/ 2 \) p - m \( p - 1 \)) . $ <h:ev:half-ambient-density>]

=== 10.2 Enclosing balls as an alternative support <enclosing-balls-as-an-alternative-support>

The exact image domain $cal(E)_(z \, R)$ has the volume in Lemma 12. The larger operator-norm ball $cal(S)_(z \, R)$ from (8) also suffices; the following proof records its uniformity for short blocks.

#thm([Lemma 10.3.])[
  (Projected support volume).  #emph[For a standard Gaussian $m$-by-$d$ matrix $A$, where $1 lt.eq m lt.eq d$, 
#[#set math.equation(numbering: n => "(72)")
 $ bb(E) thin "vol"_m B \( 0 \, parallel A parallel_(upright("op")) \) lt.eq exp \( C d \) . $ <h:proj:volume-bound>]

]
] <h:proj:volume>

#proof[
  Choose $1 \/ 4$-nets of the unit spheres in $bb(R)^d$ and $bb(R)^m$ with at most $9^d$ and $9^m$ points. Approximating both arguments in the bilinear supremum loses at most $parallel A parallel_(upright("op")) \/ 2$, so
  $ parallel A parallel_(upright("op")) lt.eq 2 max_(u \, v) \| v^(sans(T)) A u \| $
  over the net pairs. Each scalar is standard Gaussian. For such a scalar $Z$, $bb(E) \| Z \|^m lt.eq \( C sqrt(m) \)^m$: use $\| z \|^m e^(- z^2 \/ 4) lt.eq \( 2 m \/ e \)^(m \/ 2)$ and $bb(E) e^(Z^2 \/ 4) = sqrt(2)$. Bounding the maximum’s $m$-th power by the sum gives
  $ bb(E) parallel A parallel_(upright("op"))^m lt.eq 2^m 9^(m + d) \( C sqrt(m) \)^m . $
  The unit $m$-ball volume $v_m$ obeys $v_m lt.eq \( 2 pi e \/ m \)^(m \/ 2)$: integrate $e^(- parallel y parallel^2 \/ 2)$ over the ball of radius $sqrt(m)$ and compare with its full Gaussian integral. Multiplication cancels $m^(m \/ 2)$, proving (72) uniformly even for a short block. ◻
]

Since $lambda_m \( cal(S)_(z \, R) \) = v_m R^m bb(E) parallel A parallel_(upright("op"))^m$, this proves

#[#set math.equation(numbering: n => "(73)")
 $ lambda_m \( cal(S)_(z \, R) \) lt.eq C_(upright(V))^d R^m #h(2em) \( 1 lt.eq m lt.eq d \) . $ <h:dv:enclosing-volume>]

There is a second net calculation with a different explicit factor. Maximal $1 \/ 2$-separated subsets of the unit spheres in $bb(R)^d$ and $bb(R)^m$ are $1 \/ 2$-nets of sizes at most $5^d$ and $5^m$. Approximating the supremum of a linear form in each argument in turn gives $parallel A parallel_(upright("op")) lt.eq 4 max \| v^(sans(T)) A u \|$ over the net pairs. Each scalar in this maximum is a standard Gaussian $Z$, and

$ bb(E) \| Z \|^m lt.eq sqrt(2) \( 2 m \/ e \)^(m \/ 2) \, $

because $\| t \|^m e^(- t^2 \/ 4) lt.eq \( 2 m \/ e \)^(m \/ 2)$ and $bb(E) e^(Z^2 \/ 4) = sqrt(2)$. Bounding the maximum’s $m$th power by the sum therefore gives

#[#set math.equation(numbering: n => "(74)")
 $ bb(E) parallel A parallel_(upright("op"))^m lt.eq 4^m 5^(d + m) sqrt(2) \( 2 m \/ e \)^(m \/ 2) . $ <h:dv:half-net>]

Again multiplying by $v_m R^m$ proves (73), with a possibly larger absolute constant. This calculation retains the $1 \/ 2$-net factor $4$.

=== 10.3 Terminal coefficients <terminal-coefficients>

The geometric exponent $beta$ may be chosen before either of the following terminal estimates. The hemisphere proof keeps the explicit coefficient $4^n$; the polar proof records two useful denominator bounds.

#thm([Lemma 10.4.])[
  (An ambient ball bound from a hemisphere).  #emph[Let $d gt.eq 2$, $n = d - 1$, and let $sigma_d$ be uniform probability on $S^(d - 1)$. Then 
#[#set math.equation(numbering: n => "(75)")
 $ sigma_d \( B \( z \, r \) \) lt.eq \( 4 r \)^n #h(2em) \( z in bb(R)^d \, med r > 0 \) . $ <h:dv:hemisphere-ball>]

 Let $epsilon.alt > 0$, let $kappa$ be any probability law on $S^(d - 1)$, independent of the target, and put $h \( s \) = integral upright(bold(1))_({ parallel s - u parallel lt.eq epsilon.alt }) thin kappa \( d u \)$. For $0 < beta < n$, every $z in bb(R)^d$, and every $r > 0$, 
#[#set math.equation(numbering: n => "(76)")
 $ integral_(B \( z \, r \)) h thin d sigma_d lt.eq 4^n min { r^n \, epsilon.alt^n } lt.eq 4^n epsilon.alt^(n - beta) r^beta . $ <h:dv:terminal-coefficient>]

 The same upper bound holds for the angular-success function, since angular distance at most $epsilon.alt$ implies chordal distance at most $epsilon.alt$.]
] <h:dv:hemisphere-cap>

#proof[
  Suppose first that $0 < r lt.eq 1 \/ 4$ and that $B \( z \, r \)$ meets the sphere. Choose a point $a$ of the intersection and rotate it to a coordinate axis. Every other point of the intersection is within chordal distance $2 r$ of $a$, lies in the corresponding open hemisphere, and projects into the radius-$2 r$ ball in $bb(R)^n$. On that projected ball the graph area element is at most $2$, because $2 r lt.eq 1 \/ 2$. Thus the area of the patch is at most $2 v_n \( 2 r \)^n$, where $v_n$ is the volume of the unit $n$-ball. The two hemisphere graphs together have area at least $2 v_n$. The resulting probability is at most $\( 2 r \)^n$, and hence at most $\( 4 r \)^n$. An empty intersection is harmless. For $r > 1 \/ 4$, the bound $sigma_d \( B \( z \, r \) \) lt.eq 1 < \( 4 r \)^n$ proves (75).
  For fixed $u$, the successful part of $B \( z \, r \)$ is contained both in $B \( z \, r \)$ and in $B \( u \, epsilon.alt \)$. Apply (75) to each ball, take the smaller bound, and integrate in $kappa$. Finally $min { r^n \, epsilon.alt^n } lt.eq epsilon.alt^(n - beta) r^beta$, by considering $r lt.eq epsilon.alt$ and $r gt.eq epsilon.alt$ separately. ◻
]

#thm([Lemma 10.5.])[
  (Polar cap estimates).  #emph[Let $d gt.eq 2$, $n = d - 1$, and let $sigma$ be uniform on $S^(d - 1)$. There is an absolute $C_0 gt.eq 1$ such that $sigma \( B \( z \, R \) \) lt.eq C_0^d R^n$ for every ambient center $z$ and every $R > 0$. Let $epsilon.alt > 0$. If a unit output is drawn from a law independent of the signal, its success function $h \( s \)$, for either angular error at most $epsilon.alt$ or chordal error at most $epsilon.alt$, satisfies 
#[#set math.equation(numbering: n => "(77)")
 $ integral_(B \( z \, R \)) h thin d sigma lt.eq C_0^d min \( R^n \, epsilon.alt^n \) lt.eq C_0^d epsilon.alt^(n - beta) R^beta #h(2em) \( 0 < beta < n \) . $ <h:ev:polar-terminal>]

]
] <h:ev:polar-cap>

#proof[
  In spherical polar coordinates, the area element at polar angle $t$ is $sin^(d - 2) t thin d t$ times the area element on $S^(d - 2)$. Dividing the cap area by the total area therefore shows that a cap of angular radius $0 lt.eq theta lt.eq pi$ has mass
  $ frac(integral_0^theta sin^(d - 2) t thin d t, integral_0^pi sin^(d - 2) t thin d t) . $
  The numerator is at most $theta^n \/ n$, since $sin t lt.eq t$. Restricting the denominator to two different intervals gives
  #[#set math.equation(numbering: n => "(78)")
   $ integral_0^pi sin^(d - 2) t thin d t & gt.eq pi / 3 (sqrt(3) / 2)^(d - 2) &  & upright("from ") \[ pi \/ 3 \, 2 pi \/ 3 \] \,\
integral_0^pi sin^(d - 2) t thin d t & gt.eq frac(2 pi, 3) thin 2^(- \( d - 2 \)) &  & upright("from ") \[ pi \/ 6 \, 5 pi \/ 6 \] . $ <h:ev:polar-denominators>]
  Either estimate gives an upper bound $C^d theta^n$ for the cap.
  If $B \( z \, R \)$ meets the sphere, choose $s_0$ in the intersection. Every other point in it has chordal distance at most $2 R$ from $s_0$. The angle between two unit vectors is at most $pi \/ 2$ times their chordal distance. Thus their angle is at most $pi R$ when $R lt.eq 1$; for $R lt.eq 1 \/ 4$ the bound $2 arcsin R lt.eq 4 R$ is also available. The cap estimate and the trivial mass bound one for $R gt.eq 1$ give the asserted ambient-ball bound after enlarging $C_0$.
  For a fixed unit output, angular error at most $epsilon.alt$ implies chordal error at most $epsilon.alt$, because $2 sin \( theta \/ 2 \) lt.eq theta$. The global success mass is therefore at most $C_0^d epsilon.alt^n$, while its mass in $B \( z \, R \)$ is at most the ambient-ball bound $C_0^d R^n$. Averaging these bounds over the output law proves the minimum in (77). If $R lt.eq epsilon.alt$, then $R^n lt.eq epsilon.alt^(n - beta) R^beta$; if $R gt.eq epsilon.alt$, then $epsilon.alt^n lt.eq epsilon.alt^(n - beta) R^beta$. ◻
]

Lemma 31 gives the alternative coefficient

#[#set math.equation(numbering: n => "(79)")
 $ integral_(B \( z \, R \)) h thin d sigma lt.eq 4^n min \( R^n \, epsilon.alt^n \) lt.eq 4^n epsilon.alt^(n - beta) R^beta . $ <h:ev:hemisphere-terminal>]

For $beta = n \/ 2$, the looser coefficient $L_0 = 4^d epsilon.alt^beta$ follows immediately from (79). For $beta = d \/ 2$, (77) gives

#[#set math.equation(numbering: n => "(80)")
 $ H_0 = C_0^d epsilon.alt^(d - 1 - d \/ 2) = C_0^d epsilon.alt^(d \/ 2 - 1) . $ <h:ev:half-ambient-terminal>]

=== 10.4 One coefficient recurrence <one-coefficient-recurrence>

#thm([Proposition 10.6.])[
  (Backward coefficient step).  #emph[Assume (65). Let $H > 0$ and let $N gt.eq 1$ be an integer. Let $h_1 \, dots.h \, h_N : S^(d - 1) arrow.r \[ 0 \, 1 \]$ be Borel functions satisfying 
$ integral_(B \( x \, r \)) h_w thin d sigma lt.eq H r^beta #h(2em) \( x in bb(R)^d \, med r > 0 \, med 1 lt.eq w lt.eq N \) . $

 Let $g_w \( A \, y \) gt.eq 0$ be Borel functions with $sum_w g_w lt.eq 1$, and define 
$ h \( s \) = bb(E)_A sum_(w = 1)^N g_w \( A \, A s \) h_w \( s \) . $

 There is an absolute $C_(upright("step")) gt.eq 1$ such that 
#[#set math.equation(numbering: n => "(81)")
 $ integral_(B \( z \, R \)) h thin d sigma lt.eq C_(upright("step"))^d N^(1 \/ p) H R^beta #h(2em) \( z in bb(R)^d \, med R > 0 \) . $ <h:ev:coefficient-bound>]

]
] <h:ev:coefficient-step>

#proof[
  For the fixed ball $B \( z \, R \)$, take $mu_w = upright(bold(1))_(B \( z \, R \)) h_w sigma$ in Lemma 29. Its exact density $F_w$ is supported on the common domain $cal(E)_(z \, R)$ of Lemma 12. The image identity gives
  $ integral_(B \( z \, R \)) h thin d sigma = integral_(cal(E)_(z \, R)) sum_w g_w \( A \, y \) F_w \( A \, y \) thin d lambda_m \( A \, y \) . $
  The density condition of Lemma 18 applies on this domain with its norm parameter equal to
  $ cal(U) = C_(upright(D))^(d \( 1 - 1 \/ p \)) H R^(beta - m \( 1 - 1 \/ p \)) . $
  Its conclusion and Lemma 12 give
  $ integral_(B \( z \, R \)) h thin d sigma & lt.eq N^(1 \/ p) cal(U) lambda_m \( cal(E)_(z \, R) \)^(1 - 1 \/ p)\
 & lt.eq N^(1 \/ p) C_(upright(D))^(d \( 1 - 1 \/ p \)) H R^(beta - m \( 1 - 1 \/ p \)) \( C_(upright(E))^d R^m \)^(1 - 1 \/ p)\
 & lt.eq C_(upright("step"))^d N^(1 \/ p) H R^beta . $
  The maximum-density proof of the same estimate observes pointwise that $sum_w g_w F_w lt.eq max_w F_w$ and $\( max_w F_w \)^p lt.eq sum_w F_w^p$, then applies Hölder on $cal(E)_(z \, R)$. It gives $lambda_m \( cal(E)_(z \, R) \)^(1 - 1 \/ p) \( sum_w integral F_w^p thin d lambda_m \)^(1 \/ p)$, bounded by the same expression. The radius exponents are $m \( 1 - 1 \/ p \) + beta - m \( 1 - 1 \/ p \) = beta$. The densities in this calculation represent exact observations, so the measurable routing functions are evaluated at the exact labels. ◻
]

The exact density can be replaced in this step by Proposition 23 and the test form of Lemma 18. For spherical restrictions, Propositions 26 and 27 give the same norm. Likewise, either enclosing-ball calculation can replace the exact ellipsoid volume. These choices change only the absolute constant, not the coefficient or radius powers.

#thm([Proposition 10.7.])[
  (A common finite success bound).  #emph[Assume $d gt.eq 16$, set $n = d - 1$, $p = floor.l d \/ 8 floor.r$, and let $n \/ 2 lt.eq beta lt.eq d \/ 2$. Let $M \, T gt.eq 0$ be integers, $0 < epsilon.alt lt.eq 1 \/ 10$, and consider a learner in Definition 1. Under the uniform-sphere signal prior, write $P_(upright("succ"))$ for its success probability with either angular or chordal error at most $epsilon.alt$, and put $b = ceil.l T \/ p ceil.r$. Then 
#[#set math.equation(numbering: n => "(82)")
 $ P_(upright("succ")) lt.eq min {1 \, thin 4^n epsilon.alt^(n - beta) [C_(upright("step"))^d #scale(x: 120%, y: 120%)[\(] \( p + 2 \) 2^M #scale(x: 120%, y: 120%)[\)]^(1 \/ p)]^b} . $ <h:ev:common-success>]

 The same assertion holds with the initial factor $4^n$ replaced by the polar-cap constant $C_0^d$.]
] <h:ev:coefficient-success>

#proof[
  Use the seedwise conditional experiment and Borel replacement from Section 5.2. Conditional on almost every shared seed, the initial state remains independent of the signal and rows. Lemma 14 supplies, from every specified boundary state, including an unreachable one, Borel routes to fresh continuations. In a block of $m$ rows their number is at most $\( m + 2 \) 2^M$: continuing states and terminal states tagged with one of the $m + 1$ local stopping indices. The lemma applies to either Borel terminal score.
  The terminal bound (76) starts the all-radius coefficient at $H_0 = 4^n epsilon.alt^(n - beta)$. With $N = \( p + 2 \) 2^M$, Proposition 33 gives one recurrence for all actual block lengths $1 lt.eq m lt.eq p$:
  #[#set math.equation(numbering: n => "(83)")
   $ H_j = H_0 #scale(x: 120%, y: 120%)[\(] C_(upright("step"))^d N^(1 \/ p) #scale(x: 120%, y: 120%)[\)]^j . $ <h:ev:coefficient-recursion>]
  Each multiplier is at least one, so terminal options, whose coefficient is $H_0$, satisfy every later bound. The ball $B \( 0 \, 1 \)$ contains the whole sphere; hence the initial coefficient bounds total success. Average first over the independent conditional initialization and then over the original seed experiment. As in Section 5.2, this averages original conditional probabilities and requires no jointly measurable choice of the seedwise replacements. The trivial probability bound gives the minimum with one. For $T = 0$ this is the terminal estimate. Starting instead from (77) proves the polar version.
  One may instead pad the last block of actual length $m < p$ with independent Gaussian rows and extend each route by ignoring them. Its matrix–label marginal on the first $m$ rows is unchanged. Thus full padded blocks give exactly the same estimate and count. ◻
]

The two endpoint exponents recover the following bounds.

#thm([Corollary 10.8.])[
  (Finite success bounds for the two coefficients).  #emph[Assume $d gt.eq 16$ and $p = floor.l d \/ 8 floor.r$. Let $M \, T gt.eq 0$ be integers, let $0 < epsilon.alt lt.eq 1 \/ 10$, and consider a learner in Definition 1 with these parameters. Draw $S tilde.op sigma$ independently of its Gaussian rows $x_1 \, dots.h \, x_T$ and its data-independent randomness, and set the exact labels $y_t = chevron.l x_t \, S chevron.r$. Write $Pr_sigma$ for the resulting joint law and put $b = ceil.l T \/ p ceil.r$. With an absolute $C_(upright("step")) gt.eq 1$, the uniform-prior angular success probability satisfies 
#[#set math.equation(numbering: n => "(84)")
 $ Pr_sigma { "angle" \( hat(S) \, S \) lt.eq epsilon.alt } lt.eq min #h(-0.16667em) {1 \, thin 4^d epsilon.alt^(\( d - 1 \) \/ 2) [C_(upright("step"))^d #scale(x: 120%, y: 120%)[\(] \( p + 2 \) 2^M #scale(x: 120%, y: 120%)[\)]^(1 \/ p)]^b} . $ <h:ev:half-sphere-success>]

 The uniform-prior chordal success probability satisfies 
#[#set math.equation(numbering: n => "(85)")
 $ Pr_sigma { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq min #h(-0.16667em) {1 \, thin C_0^d epsilon.alt^(d \/ 2 - 1) [C_(upright("step"))^d #scale(x: 120%, y: 120%)[\(] \( 2 p + 4 \) 2^M #scale(x: 120%, y: 120%)[\)]^(1 \/ p)]^b} . $ <h:ev:half-ambient-success>]

 The second event contains the angular success event.]
] <h:ev:success>

#proof[
  In Proposition 34, set $beta = n \/ 2$ and use $4^n lt.eq 4^d$ for the first formula. For the second, set $beta = d \/ 2$, use the polar terminal coefficient, and enlarge the category bound to $N = \( 2 p + 4 \) 2^M$. The same recurrence then reads
  #[#set math.equation(numbering: n => "(86)")
   $ H_j = C_0^d epsilon.alt^(d \/ 2 - 1) #scale(x: 120%, y: 120%)[\(] C_(upright("step"))^d N^(1 \/ p) #scale(x: 120%, y: 120%)[\)]^j . $ <h:ev:half-ambient-recursion>]
  The final ball $B \( 0 \, 1 \)$ gives the second formula. Angular success implies chordal success. ◻
]

== 11 Normalizations and quantitative consequences <h:dv:applications>

The common recurrence separates choices that need not be coupled: the local exponent, the exact-label passage, the common support, and the use of actual or padded blocks. This section records their substitutions and extracts the sample bounds once. Throughout, $d gt.eq 16$, $n = d - 1$, $p = floor.l d \/ 8 floor.r$, and $b = ceil.l T \/ p ceil.r$. The nearby integer $p$ need not equal the moment order $q$ used in the main proof. All success probabilities average the uniform signal, Gaussian rows, and learner randomness. A success guarantee for every signal implies these premises by averaging.

=== 11.1 The density interfaces in the same recurrence <the-density-interfaces-in-the-same-recurrence>

For $n \/ 2 lt.eq beta lt.eq d \/ 2$, a restricted continuation measure $mu_w = upright(bold(1))_(B \( z \, R \)) h_w sigma_d$ with ambient coefficient $H$ has an exact joint density satisfying

#[#set math.equation(numbering: n => "(87)")
 $ integral F_w^p thin d lambda_m lt.eq C_(upright(D))^(d \( p - 1 \)) H^p R^(beta p - m \( p - 1 \)) #h(2em) \( 1 lt.eq m lt.eq p \) . $ <h:dv:application-moment>]

This is Lemma 29; the joint-$L^1$ or pointwise construction gives the same bound. Either $lambda_m \( cal(E)_(z \, R) \) lt.eq C_(upright(E))^d R^m$ or $lambda_m \( cal(S)_(z \, R) \) lt.eq C_(upright(V))^d R^m$ restores $R^beta$ in Lemma 18. Thus no normalization to a posterior and no repeated backward induction is needed.

===== 11.1.1 Direct measurable tests. <h:dv:half-ambient-application>

At $beta = d \/ 2 \, m = p$, the inverse-distance bound for an affine $j$-plane, $0 lt.eq j lt.eq p - 2$, has the explicit form

$ integral "dist" \( s \, L \)^(- p) thin d mu \( s \) lt.eq (1 + 3^j 2^(d \/ 2) frac(p, d \/ 2 - j - p)) H R^(d \/ 2 - p) \, #h(2em) d \/ 2 - j - p gt.eq d \/ 4 . $

Proposition 23 therefore supplies the test scale $C^d H R^(d \/ 2 - p \( 1 - 1 \/ p \))$, without using a strong density conclusion. The full-block volume (20) and the test form of Lemma 18 give the same coefficient step. The hemisphere terminal coefficient and count $\( p + 2 \) 2^M$ give (82) at this exponent, and hence the base-two bounds below for either success event.

===== 11.1.2 Joint $L^1$ convergence. <h:dv:half-sphere-application>

At $beta = n \/ 2$, Proposition 26 applies for every actual row count $1 lt.eq m lt.eq p$, since $mu_w lt.double sigma_d$ and $m < d$. With the polar terminal coefficient, either support estimate and the common recurrence give

#[#set math.equation(numbering: n => "(88)")
 $ Pr_sigma { "angle" \( hat(S) \, S \) lt.eq epsilon.alt } lt.eq C_0^d epsilon.alt^(n \/ 2) [C_(upright(L 1))^d #scale(x: 120%, y: 120%)[\(] \( p + 2 \) 2^M #scale(x: 120%, y: 120%)[\)]^(1 \/ p)]^b $ <h:dv:l1-success>]

for an absolute $C_(upright(L 1))$. Neither the quarter-net proof nor a particular polar denominator interval is required for this density passage.

===== 11.1.3 Factored accuracy. <h:dv:factored-application>

Writing $H = D epsilon.alt^(n - beta)$ moves the fixed accuracy factor outside (83); the recurrence simply multiplies $D$ by $C^d N^(1 \/ p)$. For example, at $beta = n \/ 2 \, m = p$, the specified pointwise density of Proposition 27 satisfies

#[#set math.equation(numbering: n => "(89)")
 $ integral \( F_w^sharp \)^p thin d lambda_p lt.eq #scale(x: 120%, y: 120%)[\(] D epsilon.alt^(n \/ 2) R^(n \/ 2) #scale(x: 120%, y: 120%)[\)]^p #scale(x: 120%, y: 120%)[\(] C_3^d R^(- p) #scale(x: 120%, y: 120%)[\)]^(p - 1) . $ <h:dv:factored-moment>]

This follows by substituting $H = D epsilon.alt^(n \/ 2)$ in (64). The corresponding inverse-distance bound is $C_3^d D epsilon.alt^(n \/ 2) R^(n \/ 2 - p)$, with margin at least $d \/ 4$. Either net volume or the ellipsoid volume cancels the negative radius power. The valid looser category count $cal(N) = 2 \( p + 1 \) 2^M gt.eq \( p + 2 \) 2^M$ consequently gives

$ Pr_sigma { "angle" \( hat(S) \, S \) lt.eq epsilon.alt } lt.eq C_0^d #scale(x: 120%, y: 120%)[\(] C^d cal(N)^(1 \/ p) #scale(x: 120%, y: 120%)[\)]^b epsilon.alt^(n \/ 2) . $

This enlargement has no connection to the pointwise fiber quantifier; all category counts concern only local stopping offsets, not $T$.

=== 11.2 One logarithmic extraction <one-logarithmic-extraction>

Suppose an upper bound obtained above has the form

$ P_(upright("succ")) lt.eq K epsilon.alt^kappa e^(d b Lambda) \, #h(2em) K > 0 \, quad kappa \, Lambda > 0 . $

If $P_(upright("succ")) gt.eq 2 \/ 3$, taking natural logarithms and using $b lt.eq T \/ p + 1$ gives

#[#set math.equation(numbering: n => "(90)")
 $ b gt.eq frac(kappa log \( 1 \/ epsilon.alt \) - log K - log \( 3 \/ 2 \), d Lambda) \, #h(2em) T / p gt.eq frac(kappa log \( 1 \/ epsilon.alt \) - log K - log \( 3 \/ 2 \), d Lambda) - 1 . $ <h:dv:log-extraction>]

All the exponents above satisfy $kappa = n - beta gt.eq d \/ 3$. The negative constant in this inequality is the rounded-block loss. The full-data reflection estimate handles the remaining bounded logarithms; the following elementary consequences retain several useful numerical endpoints.

For a learner with a deterministic sample limit $T$, use the fixed-seed Borel experiment of Section 5.2. Pre-generate all $T$ Gaussian rows and grant it the full data; its stopped output law is then a kernel of those rows and labels. Apply Lemma 17 conditionally and average the original conditional probabilities and expectations, as in the main endpoint argument. If its angular success probability is at least $2 \/ 3$ and $epsilon.alt lt.eq 1 \/ 10$, then

$ bb(E) chevron.l hat(S) \, S chevron.r gt.eq 2 / 3 cos \( 1 \/ 10 \) - 1 / 3 > 1 / 4 . $

Together with (30) this proves

#[#set math.equation(numbering: n => "(91)")
 $ T > d \/ 16 . $ <h:ev:reflection-sixteenth>]

For chordal success, $T lt.eq d \/ 8$ and $b_0 = 3 \/ 4$ in (29) give

#[#set math.equation(numbering: n => "(92)")
 $ Pr { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq 7 / 12 #h(2em) \( epsilon.alt lt.eq 1 \/ 10 \) . $ <h:ev:reflection-seven-twelfths>]

Equivalently, Markov’s inequality bounds $Pr { parallel u parallel^2 gt.eq 3 \/ 4 }$ by $1 \/ 6$; on its complement the reflected points have distance greater than one, and at most half of that mass can succeed. The choices $b_0 = 1 \/ 2$ and $T lt.eq d \/ 8$ give $5 \/ 8$. Formula (28) also shows that $T lt.eq d \/ 5$ is incompatible with success $2 \/ 3$ when $epsilon.alt lt.eq 1 \/ 10$.

=== 11.3 Explicit constants and thresholds <explicit-constants-and-thresholds>

All statements here assume $0 < epsilon.alt lt.eq 1 \/ 10$ and success at least $2 \/ 3$, with angular success sufficient whenever the displayed upper bound uses chordal success. Constants may be enlarged to cover any of the preceding density or support calculations.

===== 11.3.1 Half the spherical dimension. <half-the-spherical-dimension.>

For $M lt.eq d^2$, the count satisfies

$ #scale(x: 120%, y: 120%)[\(] \( p + 2 \) 2^M #scale(x: 120%, y: 120%)[\)]^(1 \/ p) lt.eq 2^(32 d) \, $

since $p + 2 lt.eq 2^p$ and $M \/ p + 1 lt.eq 16 d + 1 lt.eq 32 d$. Choose $D gt.eq max { 4 \, e }$ so that the per-block factor in (84) is at most $D^d$. Then

#[#set math.equation(numbering: n => "(93)")
 $ Pr_sigma { "angle" \( hat(S) \, S \) lt.eq epsilon.alt } lt.eq D^(d \( b + 1 \)) epsilon.alt^(n \/ 2) . $ <h:ev:half-sphere-absolute>]

Set $L = log \( 1 \/ epsilon.alt \)$ and $c_0 = \( 3 log D \)^(- 1)$. Substitution of $K = D^d \, Lambda = log D \, kappa = n \/ 2$ into (90) gives $b gt.eq c_0 L - 2$ and $T gt.eq p \( c_0 L - 3 \)$. Hence

#[#set math.equation(numbering: n => "(94)")
 $ L gt.eq 6 \/ c_0 quad arrow.r.double quad T gt.eq d / 16 c_0 / 2 L . $ <h:ev:half-sphere-threshold>]

For $L < 6 \/ c_0$, (91) gives $T > \( c_0 \/ 96 \) d L$.

Equivalently, absorb the initial and block factors into $e^(C_(*) d)$, $C_(*) gt.eq max { 1 \, log 4 }$. The substitution $K = e^(C_(*) d) \, Lambda = C_(*) \, kappa = n \/ 2$ gives

#[#set math.equation(numbering: n => "(95)")
 $ T / p gt.eq frac(L, 3 C_(*)) - 3 \, #h(2em) L gt.eq 18 C_(*) quad arrow.r.double quad T gt.eq frac(d L, 96 C_(*)) . $ <h:ev:exponential-threshold>]

This also applies to (88) when $M = o \( d^2 \)$: its logarithmic category cost is $o \( d \)$, so an absolute $C_(*)$ works after a dimension threshold depending on that memory sequence. The direct residual estimate rules out $T lt.eq d \/ 5$ for the bounded complementary range.

===== 11.3.2 Half the ambient dimension. <half-the-ambient-dimension.>

For $M = o \( d^2 \)$, $log \( \( 2 p + 4 \) 2^M \) \/ p = o \( d \)$. Thus an absolute $A gt.eq e$, after an eventual dimension threshold depending on the memory sequence, gives

#[#set math.equation(numbering: n => "(96)")
 $ Pr_sigma { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq A^(d \( b + 1 \)) epsilon.alt^(d \/ 2 - 1) . $ <h:ev:half-ambient-absolute>]

With $a_0 = \( 3 log A \)^(- 1)$, substitute $K = A^d \, Lambda = log A \, kappa = d \/ 2 - 1$ in (90) to obtain

#[#set math.equation(numbering: n => "(97)")
 $ b gt.eq a_0 L - 2 \, #h(2em) T gt.eq p \( a_0 L - 3 \) \, $ <h:ev:half-ambient-log>]

and therefore

#[#set math.equation(numbering: n => "(98)")
 $ L gt.eq 6 \/ a_0 quad arrow.r.double quad T gt.eq d / 16 a_0 / 2 L . $ <h:ev:half-ambient-threshold>]

For $L < 6 \/ a_0$, (92) forces $T > d \/ 8 > \( a_0 \/ 48 \) d L$.

For the base-two form, use instead the hemisphere coefficient $4^(d - 1) epsilon.alt^(d \/ 2 - 1)$ and the count $\( p + 2 \) 2^M$. When $M lt.eq d^2$, an absolute $C_1 gt.eq 1$ bounds the block factor by $2^(C_1 d)$. With $L_2 = log_2 \( 1 \/ epsilon.alt \)$, the same logarithmic extraction, using $2 \( d - 1 \) - log_2 \( 2 \/ 3 \) lt.eq 3 d$, gives

#[#set math.equation(numbering: n => "(99)")
 $ Pr_sigma { parallel hat(S) - S parallel lt.eq epsilon.alt } lt.eq 2^(C_1 d b) 4^(d - 1) epsilon.alt^(d \/ 2 - 1) \, #h(2em) T / p gt.eq frac(L_2 \/ 3 - 3, C_1) - 1 . $ <h:ev:binary-endgame>]

In particular,

#[#set math.equation(numbering: n => "(100)")
 $ L_2 gt.eq 6 \( 3 + C_1 \) quad arrow.r.double quad T gt.eq frac(d L_2, 96 C_1) . $ <h:ev:binary-threshold>]

Here $L_2 \/ 3 - 3 - C_1 gt.eq L_2 \/ 6$ and $p gt.eq d \/ 16$. In the complementary range, the antipodal choice $b_0 = 1 \/ 2$ gives $5 \/ 8 < 2 \/ 3$ when $T lt.eq d \/ 8$. These formulas also apply to the direct-test route above.

===== 11.3.3 The accuracy-factored form. <the-accuracy-factored-form.>

For $M = o \( d^2 \)$, the count in the factored recurrence obeys $cal(N)^(1 \/ p) lt.eq e^d$ eventually. For absolute constants $C_4 \, C_5$ it follows that

#[#set math.equation(numbering: n => "(101)")
 $ Pr_sigma { "angle" \( hat(S) \, S \) lt.eq epsilon.alt } lt.eq e^(C_4 d \( b + 1 \)) epsilon.alt^(\( d - 1 \) \/ 2) \, #h(2em) log \( 1 \/ epsilon.alt \) lt.eq C_5 \( T \/ p + 2 \) . $ <h:dv:factored-endpoint>]

The second inequality is (90), with $n \/ 2 gt.eq d \/ 3$ and the fixed $log \( 3 \/ 2 \)$ absorbed into $C_5$. Reflection gives $T > d \/ 8$, and $p gt.eq d \/ 16$ then gives $T \/ p + 2 < 32 T \/ d$. Consequently $T gt.eq d log \( 1 \/ epsilon.alt \) \/ \( 32 C_5 \)$ over the entire accuracy range, without a relation between precision and memory.

For each fixed $A_0 > 0$, replacing the memory condition by $M lt.eq A_0 d^2$ changes only the constants and bounded-logarithm thresholds, which may depend on $A_0$. These arguments do not give a uniform positive constant for unbounded $A_0 = A_0 \( d \)$.

== 12 A sharper full-data residual bound <h:end:tail-section>

The reflection estimate suffices for the main theorem. The following bound gives a sharper success probability by identifying the full conditional residual sphere. It allows arbitrary data-based Euclidean outputs, including randomized ones.

#thm([Lemma 12.1.])[
  (A memory-independent constant-accuracy bound).  #emph[For all sufficiently large $d$, let $0 lt.eq T lt.eq d \/ 4$ be an integer. Let $S$ be uniform on $S^(d - 1)$, let $X$ be an independent $T$-by-$d$ standard Gaussian matrix, and put $Y = X S$. For every $0 < epsilon.alt lt.eq 1 \/ 10$, any possibly randomized estimator $W in bb(R)^d$ based on the entire pair $\( X \, Y \)$ satisfies 
#[#set math.equation(numbering: n => "(102)")
 $ bb(P) { parallel W - S parallel lt.eq epsilon.alt } lt.eq 1 / 3 + (2 / 5)^(3 d \/ 4 - 1) < 2 / 3 . $ <h:end:full-data-bound>]

 Consequently, a learner with uniform-sphere angular success at least $2 \/ 3$ at accuracy $epsilon.alt lt.eq 1 \/ 10$ must have $T > d \/ 4$, even with unlimited memory and access to all pre-generated samples.]
] <h:end:linear>

#proof[
  Let $U$ be the row span of $X$, write $r = dim U lt.eq T$, and put $k = d - r$. The labels determine $u = P_U S$: the restriction of $X$ to $U = \( ker X \)^perp$ is injective. More explicitly, when $T > 0$, diagonalizing $X X^(sans(T))$ shows that the consistent label $Y$ determines
  $ u = lim_(eta arrow.b 0) X^(sans(T)) \( X X^(sans(T)) + eta I_T \)^(- 1) Y . $
  This also shows that $u$ is a measurable function of the data. The analogous limit
  $ P_U = lim_(eta arrow.b 0) X^(sans(T)) \( X X^(sans(T)) + eta I_T \)^(- 1) X $
  shows that the projection is measurable in $X$. For the empty horizon $T = 0$, $X$ has no rows and $U = { 0 }$, $u = 0$. The same values hold whenever the row span is zero, including an all-zero matrix. In all these cases the residual radius $rho = sqrt(1 - parallel u parallel^2)$ equals one.
  Standard Borel disintegration supplies a conditional probability kernel for the actual joint law and the Borel data map $\( X \, S \) mapsto \( X \, X S \)$ #cite(label("GagnePanangaden2023")) Theorem 2.3. To identify it almost everywhere, condition first on any fixed matrix $X$ with $r < d$, and generate $S$ as $G \/ parallel G parallel$ from an independent standard Gaussian vector. Its orthogonal components $G_U$ and $G_(U^perp)$ are independent. In polar coordinates on $U^perp$, the Gaussian volume element factors as a constant times $e^(- 𝜚^2 \/ 2) 𝜚^(k - 1) thin d 𝜚 thin d omega$ for $𝜚 > 0$, where $d omega$ is spherical area. Hence
  $ V = frac(G_(U^perp), parallel G_(U^perp) parallel) $
  is uniform on the unit sphere of $U^perp$ and is independent of $\( G_U \, parallel G_(U^perp) parallel \)$. Here $parallel G_(U^perp) parallel > 0$ almost surely because $k = d - r gt.eq d - T > 0$. The decomposition
  $ S = u + rho V \, #h(2em) u = G_U / sqrt(parallel G_U parallel^2 + parallel G_(U^perp) parallel^2) \, #h(2em) rho = frac(parallel G_(U^perp) parallel, sqrt(parallel G_U parallel^2 + parallel G_(U^perp) parallel^2)) $
  shows that $V$ is independent of $\( u \, rho \)$ conditional on $X$. Since $u$ and $rho$ are determined by $\( X \, Y \)$, the conditional law of the residual signal given the data is uniform on the sphere of radius $rho$ in $U^perp$, for almost every data pair. When $U = { 0 }$ this is the whole unit sphere and $rho = 1$. This argument uses the Gaussian direction directly, including that zero-rank case.
  Independence of $X$ and $S$, together with $bb(E) S S^(sans(T)) = I_d \/ d$, gives
  $ bb(E) parallel u parallel^2 = bb(E) frac(dim U, d) lt.eq T / d lt.eq 1 / 4 . $
  Markov’s inequality therefore yields
  #[#set math.equation(numbering: n => "(103)")
   $ bb(P) { rho < 1 \/ 2 } = bb(P) { parallel u parallel^2 > 3 \/ 4 } lt.eq 1 / 3 . $ <h:end:radius>]
  On data with $rho gt.eq 1 \/ 2$, fix any proposed estimate $w in bb(R)^d$. If $parallel w - S parallel lt.eq epsilon.alt$, orthogonal projection onto $U^perp$ and division by $rho$ imply
  $ ∥V - frac(P_(U^perp) w, rho)∥ lt.eq epsilon.alt / rho lt.eq 1 / 5 . $
  If this ball meets the unit sphere of $U^perp$, choose a point of the intersection. The entire intersection lies in the ball of radius $2 \/ 5$ about that sphere point. Lemma 5, applied in ambient dimension $k gt.eq d - T gt.eq 3 d \/ 4$, bounds its conditional spherical probability by
  $ (2 / 5)^(k - 1) lt.eq (2 / 5)^(3 d \/ 4 - 1) . $
  An empty intersection has probability zero. This bound holds for each $w$, so it also holds after averaging any output probability kernel based on the data. Combining it with (103) proves (102) for large $d$. Finally, for unit vectors angular error at most $epsilon.alt$ implies Euclidean error at most $epsilon.alt$, since $2 sin \( theta \/ 2 \) lt.eq theta$. Granting all pre-generated rows lets a full-data estimator simulate any earlier stopping rule, which proves the stated consequence. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
