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

#align(center)[#text(size: 16pt, weight: "bold")[Almost-everywhere Fourier convergence in $L log L$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $bb(T) = bb(R) \/ \( 2 pi bb(Z) \)$, with normalized Lebesgue measure $d mu \( x \) = d x \/ \( 2 pi \)$. For an integrable complex-valued function $f$, write

$ hat(f) \( k \) = integral_(bb(T)) f \( x \) e^(- i k x) thin d mu \( x \) \, #h(2em) S_N f \( x \) = sum_(k = - N)^N hat(f) \( k \) e^(i k x) . $

The endpoint question concerns the Orlicz class

$ L log L \( bb(T) \) = {f : integral_(bb(T)) \| f \( x \) \| log \( 2 + \| f \( x \) \| \) thin d mu \( x \) < oo} . $

#thm([Theorem 1.1.])[
  (Almost-everywhere convergence in $L log L$).  #emph[For every complex-valued $f in L log L \( bb(T) \)$, there is a measurable set $N_f$ of measure zero such that 
$ lim_(N arrow.r oo) S_N f \( x \) = f \( x \) #h(2em) \( x in bb(T) \\ N_f \) . $

 The limit is along the full sequence $N = 0 \, 1 \, 2 \, dots.h$.]
] <thm:main>

Carleson proved almost-everywhere convergence for square-integrable functions #cite(label("Carleson1966")), and Hunt extended this conclusion to $L^p$ for every $p > 1$ #cite(label("Hunt1968")). Kolmogorov’s integrable counterexample shows that the conclusion cannot hold throughout $L^1$ #cite(label("Kolmogorov1923")). Between these cases, Sjölin obtained convergence in $L log L log log L$ #cite(label("Sjolin1969")), and Soria developed larger convergence spaces through extrapolation #cite(label("Soria1985")) #cite(label("Soria1989")). Antonov proved convergence in $L log L log log log L$ #cite(label("Antonov1996")). Arias de Reyna subsequently introduced the quasi-Banach space $upright("QA")$, which strictly contains both Antonov’s class and Soria’s space #cite(label("AriasDeReyna2002")). Carro, Mastyło and Rodríguez-Piazza further studied $upright("QA")$ and obtained a Lorentz convergence space strictly larger than Antonov’s space #cite(label("CarroMastyloRodriguezPiazza2012")). Here the iterated-log class names describe growth at infinity; the logarithms may be regularized near zero.

Lie gave a time-frequency proof of the full-sequence maximal bound from $upright("QA")$ to weak-$L^1$, avoiding extrapolation #cite(label("Lie2013")) Corollary 1.2(5)–(7). Di Plinio and Fragkos proved weak-$L^p$ bounds of order $\( p - 1 \)^(- 1)$ as $p arrow.b 1$, together with sparse estimates and weighted endpoint convergence results #cite(label("DiPlinioFragkos2025")). The $L log L$ conjecture is also formulated through a weak-$L^1$ maximal estimate in #cite(label("Lie2017")) Definition 1.1 and Conjecture 1. 1 establishes the conjectured sufficiency of $L log L$ for the ordinary Fourier sums along the full sequence. Stein’s Banach-space theorem also yields the corresponding Luxemburg-norm weak-$L^1$ maximal bound; see Corollary 31. Our proof proceeds through the good-set integral estimate described next.

=== 1.1 The estimate behind the convergence theorem <the-estimate-behind-the-convergence-theorem>

The main analytic estimate concerns one nonnegative input $rho$ of mass one and height at most $e^d$, where $d$ is large. Its uncentered spatial maximal density is

$ M rho \( x \) = sup_(I in.rev x\
I upright(" a circle arc")) frac(1, mu \( I \)) integral_I rho thin d mu \, #h(2em) 0 < mu \( I \) lt.eq 1 . $

Set $h = log log d$ and remove the points where $M rho > e^(4 h)$. The removed set has measure at most $C e^(- 4 h)$, while on its complement we prove

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_({ M rho lt.eq e^(4 h) }) sup_(N gt.eq 0) \| S_N rho \| thin d mu lt.eq C d . $ <eq:intro-good-set>]

The two bounds have different roles. The integral bound is summable with the masses of the height layers of an $L log L$ function. The exceptional sets are summable when the layers have doubly exponential heights. 10 makes both statements precise and proves 1 from (1.1).

Good-set integral estimates also occur in Lie’s near-endpoint argument #cite(label("Lie2013")) Proposition 3.1 and (3.13). Here the bounded-density estimate and exceptional-set bound are quantified for the summation at the $L log L$ endpoint.

To obtain (1.1), we first use a finite binary tree of dyadic intervals. In unit-period coordinates, modulation multiplies the input by $e^(2 pi i u y)$, where $u$ is an integer. At each interval, take half the difference between the averages of this modulated input on its two children. Along a uniformly chosen output path, this coefficient is known before the next left-or-right choice. Its output uses the sign of one further binary choice; a multiplier of modulus at most one may depend on the intervening choice. Stop the path when the average of the original input first exceeds $e^(4 h)$. 15 bounds the integral of the supremum over all integer modulations of the resulting sum by $C d$, uniformly in the tree depth. This is the finite estimate assembled by the combinatorial part of the proof.

Translation and scale averaging of these delayed Haar kernels produce a nonzero multiple of the Hilbert kernel, with an error controlled on the same good set. The periodic Hilbert transform then gives the ordinary symmetric Fourier projections. The averaging follows the dyadic representation method of Petermichl and Hytönen #cite(label("Petermichl2000")) #cite(label("Hytonen2008")); 10 includes the kernel calculation and all limiting steps.

=== 1.2 The structural argument <the-structural-argument>

Fefferman’s proof organized the Carleson operator by a measurable frequency selector #cite(label("Fefferman1973")) #cite(label("Fefferman1997Erratum")). Lacey and Thiele later gave a simplified proof of its weak-$\( 2 \, 2 \)$ bound using phase-plane tiles and trees #cite(label("LaceyThiele2000")).

The finite proof must control many modulation frequencies without a loss that grows with their number. It splits the input into pieces and, on each piece, uses a noisy observation of the input point to identify frequencies with nearly the same phase. The input point is sampled with probability proportional to the density, whereas the transform is estimated along a uniformly sampled output path. Information is counted under the first law and converted to path estimates under the second.

Three constructions make these estimates compatible.

+ #emph[One phase region for a large set of frequencies.] The compression lemma starts with a finite set of integer frequencies and a uniform bound on noisy sums of independent samples from any probability law on that set. It produces a large subset whose phase defects, relative to one center frequency, are small on average over one common region. The conclusion remains valid for every probability law on the retained subset, so later spectral weights may be chosen after the subset is found. The proof introduces correlated samples with prescribed marginals and controls their relative entropy together with the information in the noisy sum. Two orders of refining their conditional laws reach the required phase concentration with a small loss of frequencies (Section 3, Section 4).
+ #emph[Two bounds for the cost of a new observation.] For an input point $Y$, a label has the form $Z = Y + theta$ on the circle, where the noise density is proportional to $e^(- A)$ and $A$ is a nonnegative linear combination of functions $1 - cos \( 2 pi s y \)$, $s in bb(Z)$. Nonnegative Fourier coefficients and the Griffiths–Ginibre positive-correlation method #cite(label("Ginibre1970")) control how this density changes when a new term is added to $A$. If too many large conditional Fourier coefficients are separated, compression supplies such an addition. It either produces an event unlikely under a comparison law, or enlarges the set of frequencies whose phases vary little under the noise. The first alternative is bounded by likelihood information, the second by a packing estimate. Together they bound the total cost of the labels (Section 5, Section 6).
+ #emph[Separate costs for information and for choosing frequencies.] A part of the tree with fixed noise law and mass normalization is called a live plateau; its normalization is the mean of its input piece at entry. On each plateau a cumulative list approximates the relevant frequencies by signed sums. At selected spatial intervals we store a smaller list of representatives and the current mass measures divided by that normalization; these records are the snapshots. They are refreshed before the next output bit whenever those measures have changed enough.
  For a representative frequency, the path estimate controls a transform whose values are functions of the label. Integrating against a label character recovers the scalar transform at a shifted frequency, multiplied by the corresponding Fourier coefficient of the noise density. The choice of representative makes this coefficient close to one; the remaining frequency discrepancy contributes a small spatial phase error, which sums geometrically along the path.
  The delayed vector estimate charges label information with an absolute coefficient; the logarithms of the representative counts appear only in a separate probability tail. The distinction is needed when the local estimates are summed. The expected costs of choosing representatives and the remaining path terms, under uniform output sampling, are $O \( d \/ h \)$ on each live plateau. The total starting weight of these plateaus is $O \( h \)$, where a starting weight is the uniform probability of its root interval relative to the top interval, multiplied by its mass normalization. Their product is $O \( d \)$. Information and errors from input near dyadic interval boundaries are instead charged directly across all plateaus (Section 7, Section 8, Section 9).

=== 1.3 Organization <organization>

Section 3, Section 4 prove the entropy compression lemma. 5 constructs and estimates the label updates. 6 states the finite dyadic estimate, defines its splitting procedure, and proves the global budgets. 7 constructs frequency lists, controls exceptional edges, and fixes the timing of snapshots. 8 proves the scalar and vector path estimates, and 9 assembles the dyadic bound. 10 transfers that bound to Fourier sums and completes the layer summation.

== 2 Conventions and probability notation <sec:preliminaries>

After stating 1, we use unit-period coordinates $y = x \/ \( 2 pi \)$ and normalized length $d y$ on $bb(R) \/ bb(Z)$. Characters are

$ chi_u \( y \) = e^(2 pi i u y) \, #h(2em) u in bb(Z) . $

For real $u$ the same exponential notation is used on real intervals; only integer frequencies are regarded as characters of the circle. Periodic functions are extended to the real line when restricted to spatial intervals. All conclusions are unchanged by modifications on null sets.

All logarithms are natural. Write $log^(-) t = max { 0 \, - log t }$ for $t > 0$. The parameter $d$ is sufficiently large; its lower threshold may depend on fixed auxiliary constants chosen earlier. Numerical constants denoted by $c \, C$ can change from line to line. Any other dependence is displayed or explicitly stated. No constant depends on the spatial depth or on a frequency cutoff. The notation $"poly" \( x_1 \, dots.h \, x_k \)$ denotes a polynomial upper bound with fixed nonnegative coefficients and fixed finite exponents. Dyadic levels of a positive parameter are integer powers of two. Integer roundings that matter are stated explicitly.

For a probability law $P$ on a finite set, its Shannon entropy is

$ upright(H) \( P \) = - sum_x P \( x \) log P \( x \) \, $

with $0 log 0 = 0$. Conditional entropy is averaged over the conditioning law. For general probability measures, relative entropy is

$ D \( P parallel Q \) = integral log #h(-0.16667em) (frac(d P, d Q)) d P $

when $P lt.double Q$, with value $+ oo$ otherwise. The same convention applies when the integral diverges. Mutual information is $upright(I) \( X \; Y \) = D \( P_(X \, Y) parallel P_X ⊗ P_Y \)$, and conditional mutual information is the corresponding average over the conditioning variable. A random variable may stand for its law inside $D$ or a distance between measures.

We use nonnegativity, the chain rules, and contraction of relative entropy under measurable maps. For background on these quantities and their chain rules, see #cite(label("CoverThomas2006")) Chapter 2. With

$ parallel P - Q parallel_(upright("TV")) = sup_A \| P \( A \) - Q \( A \) \| \, $

Pinsker’s inequality takes the form $parallel P - Q parallel_(upright("TV")) lt.eq sqrt(D \( P parallel Q \) \/ 2)$. For probability densities this is one half of their $L^1$ distance. Numerical constants absorb the harmless choice between total variation and $L^1$ conventions when an estimate is stated with an unspecified constant.

In the entropy compression argument, all Shannon entropies concern finite-valued variables. For a finite set $S subset bb(Z)$, $n S$ is the $n$-fold sumset with repetitions. Later, $\[ D \]$ denotes the signed span of a finite list $D$:

$ \[ D \] = {sum_(v in D) epsilon_v v : epsilon_v in { - 1 \, 0 \, 1 }} . $

Lists retain their order of insertion; repeated coordinates, if present, are treated as separately indexed entries.

The dyadic construction uses two probability laws. The law $upright(bold(U))$ follows a uniformly chosen spatial output point and therefore has fair binary bits. The true input law $upright(bold(P))$ is weighted by the current nonnegative input. Additional noisy labels are observations conditional on the input point. The deterministic processing choices depend on the spatial and membership state, not on the realized label noise. These distinctions will be used explicitly in 6; they are essential when converting information under the input law into estimates on output paths.

== 3 Entropy foundations for compression <sec:entropy-foundations>

We first establish a finite probabilistic mechanism for replacing control of relatively short random sums by a common region of phase alignment. The letters in the intermediate construction are allowed to be correlated. The quantity that pays for this correlation is a relative entropy together with the information in a noisy sum; neither term will be used in isolation when coordinates are selected or conditioned.

We use the entropy conventions of 2. All Shannon entropies in this section concern finite-valued variables, and sums of letters are taken in $bb(Z)$.

For the large parameter $d$, set

#[#set math.equation(numbering: n => "(3.1)")
 $ h = log log d \, #h(2em) T = floor.l d h^(- 5) floor.r \, #h(2em) w = \( log d \)^(1 \/ 4) \, #h(2em) L = d exp \( w \) \, #h(2em) m_(*) = floor.l exp \( w^3 \) floor.r . $ <entropy-foundations:parameters>]

In particular, $m_(*) = d^(o \( 1 \)) = o \( T \)$. Each assertion below is for all sufficiently large $d$; the threshold may depend on the fixed constants in the hypotheses, but never on the finite sets under consideration.

#thm([Lemma 3.1.])[
  (Entropy compression).  #emph[Fix $D_0 \, P_0 gt.eq 1$. Let $q$ be a strictly positive probability mass function on $bb(Z)$. Suppose that, for a positive integer $g$ and a probability measure $omega$ on $bb(R) \/ bb(Z)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ H_q \( x \) := frac(q \( x \), q \( 0 \)) = integral chi_(g x) \( theta \) thin d omega \( theta \) \, #h(2em) chi_v \( theta \) = e^(2 pi i v theta) \, #h(2em) F_0 := - log q \( 0 \) lt.eq D_0 d . $ <entropy-foundations:characteristic>]

 Let $S subset bb(Z)$ be finite and nonempty and assume 
#[#set math.equation(numbering: n => "(3.3)")
 $ log \| n S \| lt.eq D_0 d h^(P_0) log d #h(2em) upright("for every integer ") 1 lt.eq n lt.eq d^2 . $ <entropy-foundations:sumset-hypothesis>]

 Suppose $d \/ h^2 lt.eq E lt.eq D_0 d$ and, for every probability measure $lambda$ on $S$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ - log bb(E)_lambda H_q \( X_1 + dots.h.c + X_T - X'_1 - dots.h.c - X'_T \) lt.eq E \, $ <entropy-foundations:moment-hypothesis>]

 where the $2 T$ letters in this expectation are independent with common law $lambda$. Then there exist $x_0 in S$ and a nonempty subset $S' subset S$ such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ log \| S \| - log \| S' \| lt.eq C \( D_0 \) frac(d^2, E h^2) $ <entropy-foundations:size-conclusion>]

 and, for every probability measure $v$ on $S'$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ integral exp #h(-0.16667em) (- L sum_(x in S') v \( x \) \( 1 - "Re" chi_(g \( x - x_0 \)) \( theta \) \)) thin d omega \( theta \) gt.eq e^(- C E) . $ <entropy-foundations:volume-conclusion>]

 The constant $C$ in (3.6) is numerical. The constant in (3.5) depends only on $D_0$; the lower threshold for $d$ may also depend on $P_0$.]
] <lemma:compression>

The same subset and center work for every $v$ in (3.6). This uniformity will allow a later procedure to choose a distribution after the subset has been found. We prove 2 in stages. This section constructs the letter laws and the entropy quantities used in the argument; 4 performs the refinement and extracts the common region of phases.

=== 3.1 A variational construction of correlated letters <a-variational-construction-of-correlated-letters>

Throughout the proof of 2, let $U_S$ be the uniform law on $S$, and put

$ c \( u \) = - log H_q \( u \) \, #h(2em) u in bb(Z) . $

By (3.2), $0 < H_q \( u \) lt.eq 1$, since it is a positive real characteristic coefficient. Thus $c$ is finite and nonnegative, and $c \( 0 \) = 0$.

The optimization below uses finite Gibbs variational duality: subtracting linear constraints from an entropy functional produces a normalized exponential law. Related entropy-minimization arguments appear in #cite(label("Lee2017")) Section 2.1. Here the constraints prescribe the one-letter marginals, and the objective also retains the information in a noisy sum. We give the duality calculation for this precise setting.

#thm([Lemma 3.2.])[
  (A noisy sum with prescribed marginals).  #emph[Under the hypotheses of 2, there is a law of $X^T = \( X_1 \, dots.h \, X_T \)$ and $Gamma in T S - T S$ such that every $X_i$ has law $U_S$, the joint law is invariant under permutations of the letters, and, with $Z = sum_(i = 1)^T X_i + Gamma$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ D \( X^T parallel U_S^(⊗ T) \) + upright(I) \( X^T \; Z \) + bb(E) c \( Gamma \) lt.eq E . $ <eq:source-1>]

 The construction may be made with $Z in T S$.]
] <entropy-foundations:variational>

#proof[
  Consider probability laws on $S^T times T S$, with coordinates $\( X^T \, Z \)$, having uniform one-letter marginals. Minimize
  $ T upright(H) \( U_S \) - upright(H) \( X^T divides Z \) + bb(E) c #h(-0.16667em) (Z - sum_i X_i) . $
  The feasible set is a nonempty compact polytope. Conditional entropy is continuous on finite probability simplices, including their boundaries, so the minimum is attained. It is a convex minimization problem because conditional entropy is concave in the joint law and the other terms are linear or constant.
  We give the dual formula, including the marginal constraint. For a tuple $bold(mu) = \( mu_1 \, dots.h \, mu_T \)$ of probability laws on $S$, let $f \( bold(mu) \)$ be the minimum of $- upright(H) \( X^T divides Z \) + bb(E) c \( Z - sum_i X_i \)$ with these marginals. It is finite everywhere on the product of simplices: a product law for the letters and any fixed $z in T S$ is feasible and has finite cost. It is convex by mixing feasible laws. At the tuple of uniform laws, a relative interior point of this product, the finite convex function $f$ has a supporting affine function. Equivalently, separating its epigraph from points strictly below its value yields finite multipliers for the marginal constraints. Therefore there is no duality gap, and the desired minimum equals
  #[#set math.equation(numbering: n => "(3.8)")
   $ T upright(H) \( U_S \) + sup_(a_1 \, dots.h \, a_T : S arrow.r bb(R)) {sum_(i = 1)^T bb(E)_(U_S) a_i - log max_(z in T S) sum_(bold(x) in S^T) e^(sum_i a_i \( x_i \)) H_q #h(-0.16667em) (z - sum_i x_i)} . $ <entropy-foundations:dual>]
  To check the expression inside this dual, set
  $ B_z = sum_(bold(x) in S^T) e^(sum_i a_i \( x_i \)) H_q #h(-0.16667em) (z - sum_i x_i) > 0 . $
  For a conditional law $pi$ of $X^T$ given $Z = z$, its entropy and cost, after subtracting the multipliers, equal
  $ sum_(bold(x)) pi \( bold(x) \) log frac(pi \( bold(x) \), e^(sum_i a_i \( x_i \)) H_q \( z - sum_i x_i \)) = D \( pi parallel B_z^(- 1) e^(sum_i a_i) H_q \( z - sum_i x_i \) \) - log B_z . $
  The minimum is $- log B_z$, attained at the displayed normalized Gibbs law. The remaining optimization over the distribution of $Z$ selects a maximizer of $B_z$, giving $- log max_z B_z$ as in (3.8).
  The dual objective is concave in the tuple $\( a_1 \, dots.h \, a_T \)$: the negative logarithm in (3.8) is the negative of a maximum of convex log-sum-exponential functions. The objective is also invariant under coordinate permutations. Averaging over all such permutations can only increase it. Hence it suffices to consider $a_i = a$ for every $i$. Write
  $ A_a = sum_(x in S) e^(a \( x \)) \, #h(2em) lambda \( x \) = e^(a \( x \)) \/ A_a . $
  For these multipliers, the full expression in (3.8) is
  $ - T D \( U_S parallel lambda \) - log max_(z in T S) bb(E)_(lambda^(⊗ T)) H_q #h(-0.16667em) (z - sum_i X_i) . $
  The maximum is at least its average when $z$ is the sum of an independent $T$-tuple with law $lambda$. That average is at least $e^(- E)$ by (3.4); the two independent tuples can be interchanged to obtain the sign convention there. Since relative entropy is nonnegative, the displayed dual value is at most $E$. This proves the same upper bound for the primal minimum.
  Finally average a minimizing joint law of $\( X^T \, Z \)$ over all permutations of $X^T$. Convexity preserves the upper bound, and both the constraints and the cost are permutation invariant. Define $Gamma = Z - sum_i X_i in T S - T S$. The identity
  $ D \( X^T parallel U_S^(⊗ T) \) + upright(I) \( X^T \; Z \) = T upright(H) \( U_S \) - upright(H) \( X^T divides Z \) $
  then gives (3.7) and the required exchangeability, including the error variable. ◻
]

=== 3.2 Rules for keeping the same error <rules-for-keeping-the-same-error>

For a probability law $p$ on a finite set of integer letters and a law of $\( X^s \, Gamma \)$ supported on the support of $p$ in every coordinate, define

#[#set math.equation(numbering: n => "(3.9)")
 $ cal(C)_p \( X^s \, Gamma \) & := D \( X^s parallel p^(⊗ s) \) + upright(I) \( X^s \; Z \) + bb(E) c \( Gamma \)\
 & = bb(E) \[ - log p^(⊗ s) \( X^s \) \] - upright(H) \( X^s divides Z \) + bb(E) c \( Gamma \) \, #h(2em) Z = sum_i X_i + Gamma . $ <entropy-foundations:cost-definition>]

When $p$ has zeros, all statements concern its support, on which the cross entropy is finite. The cost is nonnegative and is convex in the joint law of $\( X^s \, Gamma \)$ for fixed $p$. For convexity, the map to $\( X^s \, Z \)$ is deterministic, the cross entropy and error cost are linear, and $- upright(H) \( X^s divides Z \)$ is convex.

#thm([Lemma 3.3.])[
  (Projection and conditioning rules).  #emph[Let the letters and error in (3.9) be finite-valued, with $p$ positive on every coordinate support. The following operations apply to that cost.]
  + #emph[Keeping any fixed subset of the letters, in any fixed order, and adding the same error $Gamma$ to their sum does not increase $cal(C)_p$.]
  + #emph[If $J$ is any finite-valued variable, then the average cost of the laws conditional on $J$ is at most the original cost plus $upright(H) \( J \)$. After this conditioning, the projection and reordering in (i) may depend on $J$.]
  + #emph[Conditioning on a fixed prefix of the letters and keeping the remaining $k$ letters, with the same error, has no additional average cost. If those letters have a common conditional marginal $nu$ at a given prefix value, their comparison product may be changed from $p^(⊗ k)$ to $nu^(⊗ k)$ without increasing the conditional cost.]
] <entropy-foundations:cost-rules>

#proof[
  For (i), write $B$ and $O$ for the kept and omitted vectors, and let $Z_B = Z - sum O$. The cross entropy with respect to the product comparison separates over $B \, O$. Also
  $ upright(H) \( B divides Z_B \) gt.eq upright(H) \( B divides Z \, O \) . $
  It follows from the chain rule that
  $ cal(C)_p \( B \, O \; Gamma \) - cal(C)_p \( B \, Gamma \) & = bb(E) \[ - log p^(⊗ \| O \|) \( O \) \] - upright(H) \( B \, O divides Z \) + upright(H) \( B divides Z_B \)\
 & gt.eq bb(E) \[ - log p^(⊗ \| O \|) \( O \) \] - upright(H) \( O divides Z \) gt.eq 0 . $
  The last inequality follows by first removing the conditioning on $Z$ and then using nonnegativity of $D \( O parallel p^(⊗ \| O \|) \)$. Reordering does not change either the sum or the product comparison.
  For (ii), the cross entropy and error cost are unchanged after averaging conditional laws, whereas the conditional entropy becomes $upright(H) \( X^s divides Z \, J \)$. Thus the exact average increase is
  #[#set math.equation(numbering: n => "(3.10)")
   $ sum_j bb(P) \( J = j \) cal(C)_p \( X^s \, Gamma divides J = j \) - cal(C)_p \( X^s \, Gamma \) = upright(I) \( X^s \; J divides Z \) lt.eq upright(H) \( J \) . $ <entropy-foundations:index-cost>]
  This argument does not impose independence on $J$: it may depend on the letters, the error, and additional randomness. Apply (i) within each conditional law to obtain the final assertion.
  For (iii), let $B$ be the revealed prefix and $O$ the remaining vector. Conditional on $B$, replacing $Z$ by $Z - sum B$ is an invertible translation of the output. Consequently
  $ & cal(C)_p \( B \, O \; Gamma \) - bb(E)_B cal(C)_p \( O \, Gamma divides B \)\
 & #h(1cm)  = bb(E) \[ - log p^(⊗ \| B \|) \( B \) \] - upright(H) \( B divides Z \) gt.eq 0 . $
  In a conditional law where each remaining letter has marginal $nu$, changing the product comparison decreases its cross entropy by $\| O \| D \( nu parallel p \)$. The other two terms are unchanged. This proves the claim, including when $nu$ vanishes at some letters. ◻
]

=== 3.3 An exchangeable law with nearly independent short blocks <an-exchangeable-law-with-nearly-independent-short-blocks>

Let $T_0 = floor.l T \/ 4 floor.r$. Conditioning an exchangeable vector on a suitable prefix both preserves a long exchangeable remainder and makes short subblocks close to independent copies of its conditional marginal. The next lemma retains the noisy-sum cost at the same time.

#thm([Lemma 3.4.])[
  (Selection of a conditional marginal).  #emph[Under the hypotheses of 2, there is a probability law $nu$ on $S$ and a joint law $Psi$ of an exchangeable $T_0$-tuple with common marginal $nu$ and an error $Gamma in T S - T S$ such that, writing $Z = sum_(i = 1)^(T_0) X_i + Gamma$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ & log \| S \| - upright(H) \( nu \) lt.eq C E \/ T \,\
 & D \( X^(T_0) parallel nu^(⊗ T_0) \) + upright(I) \( X^(T_0) \; Z \) + bb(E) c \( Gamma \) lt.eq C E \,\
 & parallel cal(L)_Psi \( X^m \) - nu^(⊗ m) parallel_(upright("TV")) lt.eq C m_(*) sqrt(E) \/ T #h(2em) \( 1 lt.eq m lt.eq m_(*) \) . $ <eq:source-2>]

 All constants here are numerical.]
] <entropy-foundations:exchangeable>

#proof[
  Start with 3 and put
  $ s_j = upright(H) \( X_(j + 1) divides X_1 \, dots.h \, X_j \) \, #h(2em) 0 lt.eq j < T . $
  These numbers are nonincreasing. Indeed conditioning decreases entropy, and exchangeability of the unrevealed coordinates gives
  $ s_(j + 1) lt.eq upright(H) \( X_(j + 2) divides X_1 \, dots.h \, X_j \) = s_j . $
  The chain rule and (3.7) also give
  #[#set math.equation(numbering: n => "(3.12)")
   $ sum_(j = 0)^(T - 1) \( log \| S \| - s_j \) = D \( X^T parallel U_S^(⊗ T) \) lt.eq E . $ <entropy-foundations:deficit-sum>]
  The nonnegative deficits in this sum are nondecreasing. Therefore, for $j < T$,
  $ log \| S \| - s_j lt.eq frac(E, T - j) . $
  Let $a = floor.l T \/ 4 floor.r$, $b = floor.l T \/ 2 floor.r$, and choose a prefix length $j$ uniformly in the integer interval $\[ a \, b \]$. Since $m_(*) = o \( T \)$, we may assume $b + m_(*) lt.eq 3 T \/ 4$. For all indices in the enlarged interval $\[ a \, b + m_(*) \]$, the entropy deficit, and hence the total variation of the sequence $s_j$ on that interval, is at most $C E \/ T$.
  For a fixed prefix realization $x^j$ of positive probability, write $nu_(j \, x^j)$ for the conditional law of $X_(j + 1)$. It is the conditional marginal of every unrevealed coordinate. The expected divergence of the next $m$ letters from its product is exactly
  #[#set math.equation(numbering: n => "(3.13)")
   $ & bb(E)_(X^j) D #h(-0.16667em) (cal(L) \( X_(j + 1) \, dots.h \, X_(j + m) divides X^j \) thin mid(parallel) thin nu_(j \, X^j)^(⊗ m))\
 & #h(2cm)  = m s_j - sum_(i = 0)^(m - 1) s_(j + i) = sum_(i = 0)^(m - 1) \( s_j - s_(j + i) \) . $ <entropy-foundations:conditional-block-divergence>]
  For $0 lt.eq i < m_(*)$, summing the differences over $j$ cancels all interior terms:
  $ sum_(j = a)^b \( s_j - s_(j + i) \) = sum_(j = a)^(a + i - 1) s_j - sum_(j = b + 1)^(b + i) s_j lt.eq i \( s_a - s_(b + i) \) lt.eq C i E \/ T . $
  The equality for $i = 0$ means that both sides are zero; for $i > 0$ it is valid because $i lt.eq b - a + 1$ for sufficiently large $d$. Averaging (3.13) over $j$, with $m = m_(*)$, now gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ bb(E)_(j \, X^j) D #h(-0.16667em) (cal(L) \( X_(j + 1) \, dots.h \, X_(j + m_(*)) divides X^j \) thin mid(parallel) thin nu_(j \, X^j)^(⊗ m_(*))) lt.eq C m_(*)^2 E \/ T^2 . $ <entropy-foundations:averaged-block-divergence>]
  The expectation of $log \| S \| - upright(H) \( nu_(j \, X^j) \)$ is $log \| S \| - s_j lt.eq C E \/ T$. In addition, for each fixed $j$, 4 allows us to condition on the prefix, keep $T_0$ of the remaining coordinates, and change the comparison to $nu_(j \, X^j)^(⊗ T_0)$ with cost at most $E$ after averaging over $X^j$. Averaging these bounds over $j$ retains the same upper bound.
  All three quantities just bounded are nonnegative. Dividing each by its stated positive upper scale and averaging their sum shows that some common $j$ and positive-probability prefix realization meet all three bounds, with a larger numerical constant. Freeze this choice, set its conditional marginal equal to $nu$, and keep the first $T_0$ remaining letters. Conditional exchangeability of the unrevealed letters, including their joint law with $Gamma$, gives the claimed exchangeable law $Psi$. For the $m_(*)$-letter marginal, Pinsker’s inequality $parallel P - Q parallel_(upright("TV")) lt.eq sqrt(D \( P parallel Q \) \/ 2)$ gives the last line of (3.11); projection contracts total variation and proves it for every smaller $m$. ◻
]

=== 3.4 Contexts and bounded exact-sum costs <contexts-and-bounded-exact-sum-costs>

Our remaining aim is to reach a longer block length with small noisy cost while losing little one-letter entropy under conditioning. The refinement will be controlled by a bounded exact-sum cost that decreases as information is revealed.

Fix the one-letter marginal $X tilde.op nu$ supplied by 5. A #emph[context] is a finite-valued variable $W$ jointly distributed with $X$. We start with a constant, denoted by $diameter$. A refinement replaces $W$ by $\( W \, A \)$, where $A$ is sampled by a finite channel conditional on the current pair $\( X \, W \)$; thus it keeps the old context and never changes the marginal of $X$.

For $s$ independent copies of the current pair $\( X \, W \)$, define

#[#set math.equation(numbering: n => "(3.15)")
 $ G_s \( W \) = upright(H) #h(-0.16667em) (sum_(i = 1)^s X_i thin mid(bar.v) thin W_1 \, dots.h \, W_s) \, #h(2em) G_0 \( W \) = 0 . $ <entropy-foundations:G-definition>]

The independence in this definition is part of the notation. In contrast, the next quantity permits arbitrary dependence between its rows:

#[#set math.equation(numbering: n => "(3.16)")
 $ I_r \( W \) = inf {r upright(H) \( X divides W \) - upright(H) #h(-0.16667em) (X_1 \, dots.h \, X_r thin mid(bar.v) thin sum_(a = 1)^r X_a \, W_1 \, dots.h \, W_r)} . $ <entropy-foundations:I-definition>]

The infimum is over joint laws of the $r$ pairs $\( X_a \, W_a \)$, each with the prescribed one-row marginal $\( X \, W \)$. All these optimizations are over compact finite probability polytopes with continuous objectives, so their infima are attained.

We will use the following observation for several conditional costs. Suppose a trial has prescribed row marginals $\( B_a \, V_a \)$ and a possibly random output $Z$. Its conditional entropy cost is

$ cal(F) = sum_a upright(H) \( B_a divides V_a \) - upright(H) \( B^r divides Z \, V^r \) gt.eq 0 . $

Nonnegativity follows by conditioning and subadditivity; equivalently,

$ cal(F) = bb(E)_(V^r) D #h(-0.16667em) (cal(L) \( B^r divides V^r \) thin mid(parallel) thin product_a cal(L) \( B_a divides V_a \)) + upright(I) \( B^r \; Z divides V^r \) . $

To extend this trial to new contexts, sample $A_a$ independently across rows, conditional on their old pairs, and independently of $Z$ given all the old pairs. Thus

$ cal(L) \( A^r divides B^r \, V^r \, Z \) = product_a Q_a \( thin dot.op divides B_a \, V_a \) . $

Let $cal(F)'$ be the cost after the contexts become $\( V_a \, A_a \)$. The chain rule gives

#[#set math.equation(numbering: n => "(3.17)")
 $ cal(F) - cal(F)' & = sum_a upright(I) \( B_a \; A_a divides V_a \) - upright(I) \( B^r \; A^r divides Z \, V^r \)\
 & = sum_a upright(H) \( A_a divides V_a \) - upright(H) \( A^r divides Z \, V^r \) gt.eq 0 . $ <entropy-foundations:refinement-identity>]

For the second equality, conditional independence cancels the terms $upright(H) \( A_a divides B_a \, V_a \)$ against $upright(H) \( A^r divides B^r \, Z \, V^r \)$. The last inequality is again conditioning and subadditivity. This calculation applies even when the old rows are highly correlated.

#thm([Lemma 3.5.])[
  (Monotonicities and uniform entropy bounds).  #emph[Let $nu \, Psi$ be as in 5, and define $G_s \, I_r$ by (3.15), (3.16). There is a constant $C'_0 \( D_0 \)$ such that, with 
#[#set math.equation(numbering: n => "(3.18)")
 $ D_(*) = C'_0 \( D_0 \) d \, $ <entropy-foundations:D-star>]

 every finite refinement of the initial constant context satisfies:]
  + #emph[$G_s \( W \)$ is nondecreasing in $s$, nonincreasing under refinement of $W$, and $0 lt.eq G_s \( W \) lt.eq D_(*)$ for $0 lt.eq s lt.eq m_(*)$.]
  + #emph[$I_r \( W \)$ is nonnegative, nondecreasing in $r$, and nonincreasing under refinement of $W$. Moreover $I_r \( W \) lt.eq D_(*)$ for $1 lt.eq r lt.eq T_0$.]
  #emph[The same $D_(*)$ works for all the contexts in any finite sequence of refinements.]
] <entropy-foundations:context-bounds>

#proof[
  First consider sums under the correlated law $Psi$, before introducing contexts. By 4, for every $s lt.eq T_0$ the law of $\( X^s \, Gamma \)$ has $cal(C)_nu lt.eq C E$. Relative entropy to $q$ gives
  #[#set math.equation(numbering: n => "(3.19)")
   $ upright(H) \( Gamma \) lt.eq bb(E) \[ - log q \( Gamma \) \] = F_0 + bb(E) c \( Gamma \) . $ <entropy-foundations:error-entropy>]
  This comparison is legitimate although $q$ lives on all of $bb(Z)$: $Gamma$ is finite-valued and $q$ is positive on its support. Write $Z_s = sum_(i = 1)^s X_i + Gamma$. Given $X^s$, the two variables $Z_s$ and $Gamma$ are translates of one another. Hence
  $ upright(H) \( Z_s \) = upright(I) \( X^s \; Z_s \) + upright(H) \( Gamma divides X^s \) lt.eq upright(I) \( X^s \; Z_s \) + upright(H) \( Gamma \) . $
  Since $sum_i X_i = Z_s - Gamma$, it follows that
  #[#set math.equation(numbering: n => "(3.20)")
   $ upright(H)_Psi #h(-0.16667em) (sum_(i = 1)^s X_i) lt.eq upright(I) \( X^s \; Z_s \) + 2 upright(H) \( Gamma \) lt.eq 2 F_0 + C E . $ <entropy-foundations:correlated-sum-entropy>]
  We transfer this bound to independent letters only for $s lt.eq m_(*)$. The sum laws then have total variation distance at most $eta = C m_(*) sqrt(E) \/ T$ by (3.11). For completeness, if two laws on a finite alphabet of size $N$ have distance $eta'$, couple them as $U \, V$ with $bb(P) \( U eq.not V \) = eta'$. Such a coupling uses their common submeasure, the pointwise minimum, for the equal values; the two residual submeasures have disjoint supports and total mass $eta'$. Let $J$ be the disagreement indicator. The chain rule gives
  $ upright(H) \( U \) lt.eq upright(H) \( V \) + upright(H) \( J \) + upright(H) \( U divides V \, J \) lt.eq upright(H) \( V \) + log 2 + eta' log N . $
  Interchanging $U \, V$ yields the corresponding absolute difference bound. Apply this with the common alphabet $s S$. The added error is at most
  #[#set math.equation(numbering: n => "(3.21)")
   $ log 2 + C frac(m_(*) sqrt(E), T) log \| s S \| = o \( d \/ h^2 \) . $ <entropy-foundations:continuity-error>]
  Indeed $m_(*) sqrt(E) \/ T lt.eq d^(- 1 \/ 2 + o \( 1 \))$ for fixed $D_0$, while (3.3) bounds the logarithm by $D_0 d h^(P_0) log d$; the product is $d^(1 \/ 2 + o \( 1 \))$. This estimate is uniform in $s lt.eq m_(*)$, and $s lt.eq d^2$ for large $d$. Combining (3.20), (3.21) shows $G_s \( diameter \) lt.eq C \( D_0 \) d$.
  For independent current pairs, conditioning on all the contexts makes the letters independent. For any independent finite-valued $A \, B$ on $bb(Z)$, one has $upright(H) \( A + B \) gt.eq upright(H) \( A + B divides B \) = upright(H) \( A \)$. Applying this at each fixed context tuple and averaging proves that $G_s \( W \)$ is nondecreasing in $s$. Adding the last context does not change the law of the first $s$ pairs, so the averaged right-hand side is exactly $G_s \( W \)$. Refinement decreases $G_s$ by conditioning on more information in an iid extension of all pairs. The established initial bound therefore proves (i).
  Nonnegativity of $I_r$ follows from that of $cal(F)$. For its monotonicity in $r$, take any $\( r + 1 \)$-row trial and put $S_r = sum_(a = 1)^r X_a$. The chain rule and removal of conditioning give
  $ & upright(H) \( X^(r + 1) divides S_(r + 1) \, W^(r + 1) \)\
 & quad = upright(H) \( X_(r + 1) divides S_(r + 1) \, W^(r + 1) \) + upright(H) \( X^r divides X_(r + 1) \, S_r \, W^(r + 1) \)\
 & quad lt.eq upright(H) \( X divides W \) + upright(H) \( X^r divides S_r \, W^r \) . $
  The projected first $r$ pairs form an admissible trial. Subtracting this inequality from $\( r + 1 \) upright(H) \( X divides W \)$ and taking infima proves $I_(r + 1) \( W \) gt.eq I_r \( W \)$. To refine a trial for $I_r$, use independent channels given each old pair as in (3.17), with $Z = S_r$. They preserve the required new one-row marginal and do not increase the objective. Taking an optimal old trial proves refinement monotonicity.
  Finally use the projection of $Psi$ to $r lt.eq T_0$ letters as a trial at the constant context. Its exact-sum objective is
  $ r upright(H) \( nu \) - upright(H) \( X^r divides S_r \) = D \( X^r parallel nu^(⊗ r) \) + upright(H) \( S_r \) lt.eq 2 F_0 + C E \, $
  using (3.11), Lemma 3.3, (3.20). Choose $C'_0 \( D_0 \)$ large enough for this and the $G_s$ bound. Refinement monotonicity then proves (ii) with the same fixed $D_(*)$. ◻
]

=== 3.5 Noisy block costs and their full-vector interpretation <noisy-block-costs-and-their-full-vector-interpretation>

For $m$ independent current pairs, put $Y_m = sum_(i = 1)^m X_i$ and $V_m = \( W_1 \, dots.h \, W_m \)$. At a fixed positive integer $r$, define

#[#set math.equation(numbering: n => "(3.22)")
 $ K_m = K_m \( W \; r \) := inf { & r upright(H) \( Y_m divides V_m \) - upright(H) #h(-0.16667em) (Y_(m \, 1) \, dots.h \, Y_(m \, r) thin mid(bar.v) thin sum_(a = 1)^r Y_(m \, a) + Gamma \, V_m^r)\
 & #h(3cm)  + bb(E) c \( Gamma \) } . $ <entropy-foundations:K-definition>]

Here each row pair $\( Y_(m \, a) \, V_(m \, a) \)$ has the prescribed marginal $\( Y_m \, V_m \)$, the rows may be arbitrarily coupled, and the error may be arbitrarily coupled with them subject to $Gamma in T S - T S$. The notation $K_m$ suppresses $W$ and $r$ only when both are fixed. As before, the infimum is attained and the objective is nonnegative.

#thm([Lemma 3.6.])[
  (Lifting block sums and refining contexts).  #emph[Let $m \, r$ be positive integers and $W$ a finite context of $X tilde.op nu$. The value of (3.22) is unchanged if each row sum $Y_(m \, a)$ is replaced in both entropy terms by its entire $m$-letter vector, with that row constrained to have the law of $m$ iid current pairs. The output remains the sum of all $m r$ letters plus $Gamma$, and independence is required within each prescribed row marginal, but not between rows. Moreover $K_m \( W \; r \)$ is nonincreasing under finite context refinement.]
] <entropy-foundations:block-cost>

#proof[
  Write $B_a = \( X_(a \, 1) \, dots.h \, X_(a \, m) \)$, $V_a = \( W_(a \, 1) \, dots.h \, W_(a \, m) \)$, $Y_a = sum_i X_(a \, i)$, and $Z = sum_a Y_a + Gamma$. For any full-vector trial, the full-vector objective minus its projected sum objective equals
  #[#set math.equation(numbering: n => "(3.23)")
   $ sum_(a = 1)^r upright(H) \( B_a divides Y_a \, V_a \) - upright(H) \( B^r divides Y^r \, Z \, V^r \) gt.eq 0 . $ <entropy-foundations:lift-difference>]
  The equality follows from the chain rule, since $Y_a$ is a function of $B_a$; the inequality follows by subadditivity and conditioning. Thus projection to block sums does not increase the cost.
  Conversely, start with any admissible joint law of $\( Y^r \, V^r \, Gamma \)$. In each row, independently of all the other new rows and of $Gamma$ conditional on $\( Y^r \, V^r \)$, sample the block from the genuine iid block law conditioned on its own sum and contexts:
  $ cal(L) \( B^r divides Y^r \, V^r \, Gamma \) = product_(a = 1)^r cal(L)_(upright("iid")) \( B_a divides Y_a \, V_a \) . $
  Each full row then has precisely the prescribed iid marginal. Conditioning further on $Z$, a function of $\( Y^r \, Gamma \)$, does not change these independent conditional row laws. Consequently the last entropy in (3.23) equals the sum of the first entropies after averaging. The two objectives are equal for this lift, which proves equality of their infima.
  For refinement, use this full-vector formulation. At every one of its $m r$ positions, run the prescribed one-letter channel independently given the old pairs, also independently of the old error given those pairs. The iid old-pair marginal within a row and the independent channels give exactly the iid refined-pair marginal required in that row. Apply (3.17) with the whole row as $B_a$ and its vector of new observations as $A_a$. The error law and its cost are unchanged, and the entropy objective cannot increase. Taking an optimal old trial proves the stated monotonicity.
  A new one-letter channel may itself be specified by an experiment using auxiliary letters, as will occur in 4. In the construction just used, each channel is run with fresh auxiliary randomness conditional on its own old pair. One does not substitute the other actual letters of its row for those auxiliary samples. This distinction is what preserves the prescribed iid row marginal. ◻
]

=== 3.6 Thinning correlated blocks to exact iid marginals <thinning-correlated-blocks-to-exact-iid-marginals>

The short blocks of $Psi$ are only approximately iid. A later refinement argument needs exact iid marginals inside each row. We obtain them by selecting blocks with a weighted acceptance rule and filling the missing row mass.

#thm([Lemma 3.7.])[
  (The low-end noisy cost).  #emph[Under the hypotheses of 2, fix the law $nu$ from 5. Let $m \, r$ be positive integers satisfying 
$ m lt.eq m_(*) \, #h(2em) 2 m r lt.eq T_0 \, #h(2em) r lt.eq 1 / 2 T e^(- w^2) . $

 For the constant context and for every finite refinement of it, 
#[#set math.equation(numbering: n => "(3.24)")
 $ K_m \( W \; r \) lt.eq C E \, $ <eq:source-3>]

 where $C$ is numerical, with the threshold for $d$ allowed to depend on $D_0 \, P_0$.]
] <entropy-foundations:thinning>

#proof[
  It suffices to construct a trial for the constant context; the rest follows from 7. Take $2 r$ disjoint blocks of $m$ coordinates from $Psi$. Their common marginal is a law $mu$ on $S^m$. Put $Q = nu^(⊗ m)$ and
  $ epsilon = parallel mu - Q parallel_(upright("TV")) lt.eq C m_(*) sqrt(E) \/ T . $
  Define the common submeasure $gamma \( bold(x) \) = min \( mu \( bold(x) \) \, Q \( bold(x) \) \)$, which has total mass $1 - epsilon$. Conditional on a block value $bold(x)$ with $mu \( bold(x) \) > 0$, tag it with probability $gamma \( bold(x) \) \/ mu \( bold(x) \)$. The choices of tags may be made independently given all block values. Each tagged block has unnormalized law $gamma$; independence between the block values is not assumed.
  Let $B$ be the number of tagged blocks. If $B < r$, reject. If $B gt.eq r$, accept with probability $B \/ \( 2 r \)$, using a fresh coin, and upon acceptance select $r$ distinct tagged blocks uniformly in random order. Let the acceptance probability be $1 - delta$. Each block fails to be tagged with probability $epsilon$, so
  $ bb(E) \( 2 r - B \) = 2 r epsilon \, #h(2em) bb(P) \( B < r \) lt.eq 2 epsilon . $
  The rule consequently gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ delta & = 1 - bb(E) [frac(B, 2 r) upright(bold(1))_({ B gt.eq r })]\
 & = epsilon + bb(E) [frac(B, 2 r) upright(bold(1))_({ B < r })] lt.eq 3 epsilon . $ <entropy-foundations:acceptance-error>]
  In particular $delta < 1$ for sufficiently large $d$.
  We check the marginal of an accepted row before normalizing by the acceptance probability. Given the tags, a particular tagged block has probability $1 \/ B$ of occupying any specified selected row. Multiplying this by the acceptance probability $B \/ \( 2 r \)$ cancels $B$. Therefore all selected rows have the same unnormalized marginal $eta$, and, for each $bold(x) in S^m$,
  #[#set math.equation(numbering: n => "(3.26)")
   $ eta \( bold(x) \) & = frac(1, 2 r) sum_(i = 1)^(2 r) bb(E) #h(-0.16667em) [upright(bold(1))_({ B gt.eq r }) upright(bold(1))_({ i upright(" tagged") }) upright(bold(1))_({ upright("block ") i = bold(x) })]\
 & lt.eq gamma \( bold(x) \) lt.eq Q \( bold(x) \) . $ <entropy-foundations:accepted-submeasure>]
  Its total mass is $1 - delta$. This domination is the reason for the acceptance weight $B \/ \( 2 r \)$.
  On acceptance, retain the selected letters in their selected order and keep the same error $Gamma$. To bound their cost, first project $Psi$ to the $2 r m$ letters used above. Its cost with respect to $nu^(⊗ 2 r m)$ is at most $C E$. Record a finite index $J$ that is either a rejection symbol or the ordered tuple of the $r$ selected block indices. The full tag pattern is not recorded. Thus
  $ upright(H) \( J \) lt.eq log #scale(x: 120%, y: 120%)[\(] 1 + \( 2 r \)^r #scale(x: 120%, y: 120%)[\)] lt.eq log 2 + r log \( 2 r \) . $
  By 4, conditioning on $J$ and then projecting and reordering on accepted outcomes has average cost at most $C E + upright(H) \( J \)$. Nonnegativity permits us to drop the rejected outcomes from this upper bound. Finally, forgetting the ordered indices on the accepted outcomes uses convexity of the combined cost $cal(C)_nu$. If $P_(upright("acc"))$ is the normalized accepted joint law of the $m r$ letters and the error, we obtain
  #[#set math.equation(numbering: n => "(3.27)")
   $ \( 1 - delta \) cal(C)_nu \( P_(upright("acc")) \) lt.eq C E + log 2 + r log \( 2 r \) . $ <entropy-foundations:accepted-cost>]
  Keeping the acceptance mass on the left avoids any division by a small conditional acceptance probability for a particular ordered selection.
  If $delta = 0$, the accepted rows already have marginal $Q$ and the construction is complete. Otherwise let
  $ R = frac(Q - eta, delta) . $
  This is a probability law on $S^m$ by (3.26). Complete the trial by mixing $P_(upright("acc"))$, with weight $1 - delta$, and the law of $r$ independent blocks with marginal $R$, with weight $delta$; in the latter law set $Gamma = 0$. Every row of the mixture now has exact marginal $eta + delta R = Q$. Thus it is an admissible full-vector trial for $K_m$. The error still lies in $T S - T S$, which contains zero.
  For the filling law, $R lt.eq Q \/ delta$ pointwise, and hence
  $ D \( R parallel Q \) lt.eq log \( 1 \/ delta \) . $
  Independence between its $r$ blocks makes its divergence to $nu^(⊗ m r) = Q^(⊗ r)$ equal to $r D \( R parallel Q \)$. Its noisy sum is the exact sum, which lies in $m r S$, so the mutual information in the output is its entropy, at most $log \| m r S \|$. The error cost is $c \( 0 \) = 0$. Its weighted additional cost is therefore at most
  #[#set math.equation(numbering: n => "(3.28)")
   $ delta r log \( 1 \/ delta \) + delta log \| m r S \| . $ <entropy-foundations:residual-cost>]
  Convexity of $cal(C)_nu$ on mixing, followed by the full-vector identity of 7, bounds $K_m$ by the sum of the right-hand sides of (3.27), (3.28).
  It remains to verify the scale of all additional terms. Since $w^2 = sqrt(log d)$ and $r lt.eq T e^(- w^2) \/ 2$,
  $ r log \( 2 r \) lt.eq C d h^(- 5) e^(- sqrt(log d)) log d = o \( d \/ h^2 \) . $
  Also $delta log \( 1 \/ delta \) lt.eq 1 \/ e$, so the first term of (3.28) is at most $r \/ e = o \( d \/ h^2 \)$. For its second term, (3.25) gives $delta lt.eq d^(- 1 \/ 2 + o \( 1 \))$, and $m r lt.eq T_0 \/ 2 < d^2$ allows the sumset hypothesis to give
  $ delta log \| m r S \| lt.eq d^(- 1 \/ 2 + o \( 1 \)) D_0 d h^(P_0) log d = o \( d \/ h^2 \) . $
  These estimates include all entropy paid for the selection index. They are uniform in admissible $m \, r$. Since $E gt.eq d \/ h^2$, the additional terms can be absorbed into a numerical multiple of $E$ once $d$ is sufficiently large depending on $D_0 \, P_0$. This proves (3.24). ◻
]

We now have a fixed one-letter law $nu$, uniformly bounded exact-sum quantities $G_s$ and $I_r$, and the small noisy cost (3.24) at the low block lengths. The next section uses context refinements to reach a substantially larger block length while retaining a comparable noisy cost, and then completes the proof of 2.

== 4 Refinement and common phase volume <sec:entropy-refinement>

We complete the proof of 2. All parameters and costs retain their meanings from 3; in particular, $X tilde.op nu$, $G_0 = 0$, $T_0 = floor.l T \/ 4 floor.r$, and $D_(*) = C'_0 \( D_0 \) d$ bounds the relevant $G_s$ and $I_r$. Choose $C'_0 \( D_0 \)$ large enough that $E lt.eq D_(*)$ as well. We occasionally write $K_m \( W \; r \)$ to display the context and row count. A prime denotes a value after the specified refinement.

First, a block observation converts a noisy-cost difference into a decrease of an exact-sum cost. A finite search then finds a long block with small noisy cost while spending little one-letter entropy. Finally, we extract a common region of phases and a large subset of the original letters.

=== 4.1 Gluing two couplings <gluing-two-couplings>

#thm([Lemma 4.1.])[
  (A block observation pays a noisy-cost difference).  #emph[Fix a current finite-valued context $W$, integers $m gt.eq 2$ and $r gt.eq 1$, and an independent block of $m$ current pairs $\( X_i \, W_i \)$. Refine the context of $X_1$ by observing $#scale(x: 120%, y: 120%)[\(] sum_(i = 1)^m X_i \, W_2 \, dots.h \, W_m #scale(x: 120%, y: 120%)[\)]$, retaining $W_1$. For the resulting context $W'$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ G_1 \( W \) - G_1 \( W' \) = G_m \( W \) - G_(m - 1) \( W \) \, $ <entropy-refinement:one-letter-loss>]

 and 
#[#set math.equation(numbering: n => "(4.2)")
 $ I_r \( W \) - I_r \( W' \) gt.eq K_m \( W \; r \) - K_(m - 1) \( W \; r \) . $ <eq:source-4>]

 If the observation is made only on an independent Bernoulli mark of probability $zeta in \[ 0 \, 1 \]$, retaining the mark in the new context, its one-letter entropy loss is multiplied by $zeta$, and its decrease of $I_r$ is at least $zeta #scale(x: 120%, y: 120%)[\(] I_r \( W \) - I_r \( W' \) #scale(x: 120%, y: 120%)[\)]$.]
] <entropy-refinement:gluing>

#proof[
  Independence of the pairs gives
  $ & upright(I) (X_1 \; sum_(i = 1)^m X_i \, W_2 \, dots.h \, W_m divides W_1)\
 & quad = upright(H) (sum_(i = 1)^m X_i divides W_1 \, dots.h \, W_m) - upright(H) (sum_(i = 2)^m X_i divides W_2 \, dots.h \, W_m) \, $
  which proves (4.1).
  Take independent minimizing trials for $I_r \( W \)$ and $K_(m - 1) \( W \; r \)$. Their alphabets, including the error alphabet $T S - T S$, are finite, so minimizers exist. Write their row vectors and contexts as
  $ U = \( U_a \)_(a = 1)^r \, quad cal(W) = \( W_a \)_(a = 1)^r \, #h(2em) Y = \( Y_a \)_(a = 1)^r \, quad cal(V) = \( V_a \)_(a = 1)^r \, $
  where each $\( Y_a \, V_a \)$ has the sum-and-context law of an independent $\( m - 1 \)$-letter block. Set
  $ P = \( cal(W) \, cal(V) \) \, #h(2em) Z_U = sum_a U_a \, #h(2em) Z_Y = sum_a Y_a + Gamma . $
  The whole $\( U \, cal(W) \)$ trial is independent of the whole $\( Y \, cal(V) \, Gamma \)$ trial. Consequently $\( U + Y \, P \, Gamma \)$ is admissible for $K_m \( W \; r \)$, and $\( U \, \( U + Y \, P \) \)$, with exact output $Z_U$, is admissible for $I_r \( W' \)$. Each row has the prescribed marginal in both trials; independence across rows is not required.
  The two positive one-row entropy terms add to
  $ & upright(H) \( U_a + Y_a divides W_a \, V_a \) + upright(H) \( U_a divides U_a + Y_a \, W_a \, V_a \)\
 & quad = upright(H) \( U_a \, Y_a divides W_a \, V_a \) = upright(H) \( U_a divides W_a \) + upright(H) \( Y_a divides V_a \) . $
  For the subtracted joint entropies, condition both terms on both old outputs:
  #[#set math.equation(numbering: n => "(4.3)")
   $ & upright(H) \( U + Y divides Z_U + Z_Y \, P \) + upright(H) \( U divides U + Y \, Z_U \, P \)\
 & quad gt.eq upright(H) \( U + Y divides Z_U \, Z_Y \, P \) + upright(H) \( U divides U + Y \, Z_U \, Z_Y \, P \)\
 & quad = upright(H) \( U \, Y divides Z_U \, Z_Y \, P \)\
 & quad = upright(H) \( U divides Z_U \, cal(W) \) + upright(H) \( Y divides Z_Y \, cal(V) \) . $ <entropy-refinement:gluing-entropy>]
  The middle equality uses the invertible map $\( U \, Y \) mapsto \( U + Y \, U \)$; the last uses independence of the old trials. This argument permits random $Gamma$. The error cost stays unchanged. Adding the new trial costs and taking infima proves $K_m \( W \; r \) + I_r \( W' \) lt.eq K_(m - 1) \( W \; r \) + I_r \( W \)$.
  For a partial observation $W^(\( zeta \))$, conditioning on the independent mark gives its entropy loss. To bound its exact cost, synchronize the mark across rows, using a minimizing old coupling on mark zero and a minimizing fully refined coupling on mark one. This has the prescribed refined pair marginal in each row, so
  $ I_r \( W^(\( zeta \)) \) lt.eq \( 1 - zeta \) I_r \( W \) + zeta I_r \( W' \) . $
  The assertion follows. ◻
]

=== 4.2 A search with two orders of refinement <a-search-with-two-orders-of-refinement>

We choose block ranges whose lower endpoints decrease as their row counts increase. For sufficiently large $d$, put

$ Q = ⌊frac(w^3 \/ 2 - w^2, 3 w)⌋ \, #h(2em) M = Q + 1 \, $

and, for $1 lt.eq j lt.eq M$, set

#[#set math.equation(numbering: n => "(4.4)")
 $ m_(j \, 0) & = ⌈exp #scale(x: 120%, y: 120%)[\(] w^2 + 3 w \( M - j \) #scale(x: 120%, y: 120%)[\)]⌉ \,\
r_j & = ⌊frac(T_0, 2 m_(j \, 0))⌋ \, & m_(j \, 1) & = ⌈L / r_j⌉ . $ <entropy-refinement:ranges>]

Here $M asymp w^2$. Uniformly in $j$, $T_0 \/ \( 2 m_(j \, 0) \) arrow.r oo$, so

$ frac(T_0, 4 m_(j \, 0)) lt.eq r_j lt.eq frac(T_0, 2 m_(j \, 0)) \, #h(2em) 1 < m_(j \, 1) / m_(j \, 0) lt.eq frac(4 L, T_0) + 1 / m_(j \, 0) lt.eq e^(2 w) . $

Successive lower endpoints have ratio at least $e^(3 w) \/ \( 1 + e^(- w^2) \) > e^(2 w)$. Thus the integer ranges $\[ m_(j \, 0) \, m_(j \, 1) \]$ are disjoint and descend as $j$ increases. The floor bounds also show that $r_j$ increases strictly. Moreover,

#[#set math.equation(numbering: n => "(4.5)")
 $ e^(w^2) lt.eq m_(j \, 0) < m_(j \, 1) lt.eq m_(*) \, #h(2em) 2 r_j m_(j \, 0) lt.eq T_0 \, #h(2em) r_j lt.eq T e^(- w^2) \/ 8 \,\
L lt.eq r_j m_(j \, 1) < L + r_j < 2 L < d^2 . $ <entropy-refinement:range-bounds>]

For the upper endpoint, use $m_(j \, 1) lt.eq 2 exp \( w^3 \/ 2 + 2 w \) lt.eq m_(*)$ for large $d$. The low endpoints therefore satisfy all hypotheses of (3.24), and all the $G_s \, I_(r_j)$ used below are bounded by $D_(*)$.

#thm([Proposition 4.2.])[
  (Finite refinement search).  #emph[Under the hypotheses of 2, there is a finite sequence of context refinements from empty context to $W$, and an index $j$, such that 
#[#set math.equation(numbering: n => "(4.6)")
 $ G_1 \( diameter \) - G_1 \( W \) & lt.eq frac(C D_(*)^2, E h^2) \,\
K_(m_(j \, 1)) \( W \; r_j \) & lt.eq K_(m_(j \, 0)) \( W \; r_j \) + E . $ <entropy-refinement:search-conclusion>]

 The constant $C$ is numerical, and every context produced is finite-valued.]
] <entropy-refinement:search>

#proof[
  Normalize by
  $ a_j = I_(r_j) \/ D_(*) \, #h(2em) g_s = G_s \/ D_(*) \, #h(2em) tau = E \/ D_(*) in \( 0 \, 1 \] . $
  These functions take values in $\[ 0 \, 1 \]$. At a fixed state $a_j$ increases with $j$ and $g_s$ increases with $s$; all decrease under refinement. Measure refinement cost by $tau$ times the loss in $g_1$. Costs add, and total cost $c$ means entropy loss $c D_(*)^2 \/ E$.
  ===== 4.2.1 Available updates. <available-updates.>
  Suppose the desired $K$ inequality fails at index $j$ in a given state. Consider separately from that same state the full observations of 9 for $m_(j \, 0) < m lt.eq m_(j \, 1)$. Let $d_m gt.eq 0$ be their decreases in $a_j$, and $c_m gt.eq 0$ their costs. Telescoping (4.2), (4.1) gives
  $ sum_m d_m > tau \, #h(2em) sum_m c_m = tau p_j \, #h(2em) p_j = g_(m_(j \, 1)) - g_(m_(j \, 0)) . $
  For $p_j > 0$, offers with $c_m > 2 p_j d_m$ have total decrease less than $tau \/ 2$. The other offers have total decrease greater than $tau \/ 2$. There are at most $m_(*)$ offers, so one satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ d_m gt.eq eta := frac(tau, 2 m_(*)) \, #h(2em) c_m lt.eq 2 p_j d_m . $ <entropy-refinement:offer>]
  If $p_j = 0$, all costs are zero and the same conclusion follows. For any target $x in \( 0 \, d_m \]$, use a partial observation with probability $x \/ d_m$. Its actual decrease is at least $x$ and its cost at most $2 p_j x$.
  ===== 4.2.2 Why two visit orders are needed. <why-two-visit-orders-are-needed.>
  The available update decreases $a_j$ at a cost controlled by the current width $p_j$. Although both endpoints $g_(m_(j \, 0))$ and $g_(m_(j \, 1))$ decrease under refinement, their difference need not decrease. We will therefore stop working at an index when the difference between the $g$-value at its upper endpoint on entry and the $g$-value at its lower endpoint in the current state is too large relative to the cost already spent there.
  Two comparisons determine the order of the search. When we visit indices in increasing order, their block-length ranges descend: the $g$-value at the upper endpoint on entry to the next visited index is bounded by the $g$-value at the lower endpoint on exit from the earlier index. These endpoint differences telescope in $\[ 0 \, 1 \]$ and will control the cost of skipped work. Completed decreases of $a_j$ telescope in the opposite index order, because $a_j$ increases with $j$ and decreases under refinement. The nested partition below uses increasing indices within a subblock to control skips, decreasing subblocks within a macroblock to control completed decreases, and increasing macroblocks to control the remaining skips. The numerical thresholds make the total cost $O \( h^(- 2) \)$.
  ===== 4.2.3 Partitions and visit orders. <partitions-and-visit-orders.>
  Put
  #[#set math.equation(numbering: n => "(4.8)")
   $ N = floor.l M^(1 \/ 10) floor.r \, quad n = floor.l M^(1 \/ 2) floor.r \, quad u = \( log N \)^(- 2) \, quad q_(*) = ceil.l 2 \/ u ceil.r \,\
alpha_0 = frac(100 u, log n) \, quad delta_0 = n^(- 1 \/ 2) \, #h(2em) alpha_1 = frac(10^5, log n log N) \, quad delta_1 = N^(- 1 \/ 2) . $ <entropy-refinement:skip-parameters>]
  Take $d$ large enough that $N gt.eq 4$. Partition the first $N q_(*) n$ indices into $N$ successive macroblocks, each containing $q_(*)$ successive subblocks of $n$ indices. There is room since
  $ N q_(*) n lt.eq M^(3 \/ 5) (1 + frac(\( log M \)^2, 50)) lt.eq M . $
  Process macroblocks in ascending index order; within a macroblock, process subblocks in descending order; within a subblock, process indices in ascending order. A subblock finishes when $a_j$ at one of its indices has decreased by at least $u$ since entry to that index. Discovery of the desired $K$ inequality stops the whole search. The skip rules below can end an index or a macroblock earlier.
  ===== 4.2.4 One index and one subblock. <one-index-and-one-subblock.>
  At index $j$, let $c_0$ be the cost spent there so far and put
  $ p = g_(m_(j \, 1)) \( upright("entry to ") j \) - g_(m_(j \, 0)) \( upright("current state") \) . $
  This nonnegative quantity dominates the current $p_j$. Skip this index if
  #[#set math.equation(numbering: n => "(4.9)")
   $ p > c_0 \/ alpha_0 + delta_0 . $ <entropy-refinement:index-skip>]
  Otherwise check the desired $K$ inequality. If it fails, take an offer from (4.7). Write $Delta_j = a_j \( upright("entry to ") j \) - a_j \( upright("current state") \) < u$ for the decrease already achieved at this index, and choose the partial observation with target
  $ x = min { d_m \, u - Delta_j } . $
  Repeat until a skip, completed target, or discovery. The sum of the targets $x$ in an index is at most $u$, since actual decreases are at least their targets and a clipped last target finishes the attempt. Each unclipped target equals $d_m gt.eq eta$, so the loop is finite.
  At every update the skip test has failed, whence
  $ Delta c_0 lt.eq 2 \( c_0 \/ alpha_0 + delta_0 \) x \, #h(2em) c_(0 \, upright("new")) + alpha_0 delta_0 lt.eq \( c_(0 \, upright("old")) + alpha_0 delta_0 \) \( 1 + 2 x \/ alpha_0 \) . $
  Starting at $c_0 = 0$, and using $1 + t lt.eq e^t$, the cost at every stage satisfies
  #[#set math.equation(numbering: n => "(4.10)")
   $ c_0 lt.eq alpha_0 delta_0 \( e^(2 u \/ alpha_0) - 1 \) lt.eq alpha_0 n^(- 12 \/ 25) lt.eq alpha_0 n^(- 2 \/ 5) . $ <entropy-refinement:index-cost>]
  Write $H \, ell$ for the highest and lowest block-length endpoints in the current macroblock and set
  $ P = g_H \( upright("entry to the macroblock") \) - g_ell \( upright("current state") \) in \[ 0 \, 1 \] . $
  For successive skipped indices $j < j'$ within a subblock, the block-length ranges descend, so $m_(j' \, 1) < m_(j \, 0)$. Decrease over refinement time then gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ g_(m_(j' \, 1)) \( upright("entry to ") j' \) lt.eq g_(m_(j \, 0)) \( upright("exit from ") j \) . $ <entropy-refinement:mirror-telescope>]
  Thus the values of $p$ at skips sum to at most $P$, including at every intermediate state in this subblock. A skipped index has $c_0 < alpha_0 \( p - delta_0 \) lt.eq alpha_0 p$ and $p > delta_0$. There are therefore fewer than $1 \/ delta_0 = sqrt(n)$ skips; all $n$ indices cannot be skipped. Skipped attempts cost at most $alpha_0 P$, and there is at most one other, active or terminal, index attempt. By (4.10), every prefix or completed run of the subblock costs at most
  #[#set math.equation(numbering: n => "(4.12)")
   $ alpha_0 \( P + n^(- 2 \/ 5) \) . $ <entropy-refinement:subblock-cost>]
  A completed subblock without discovery must consequently reach a target.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[Macroblocks: advance in index order]], anchor: "west", padding: 0.1176cm)
  content((1.35, -0.65), [#box(width: 2.45cm, height: 0.62cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_1$]]])])
  content((5.05, -0.65), [#box(width: 2.45cm, height: 0.62cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_2$]]])])
  content((8.75, -0.65), [#box(width: 2.45cm, height: 0.62cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$dots.h B_N$]]])])
  line((2.575, -0.65), (3.825, -0.65), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.275, -0.65), (7.525, -0.65), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((10.5, -0.65), [#text(size: 9pt)[$j,r$ increase#linebreak()$m$ decreases]], anchor: "west", padding: 0.1176cm)
  content((0, -1.65), [#text(size: 9pt)[Inside one macroblock: reverse the subblocks]], anchor: "west", padding: 0.1176cm)
  line((11.55, -2.18), (0.45, -2.18), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((1.95, -2.95), [#box(width: 3.4cm, height: 0.95cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_1: j arrow.r.long$]]])])
  content((6, -2.95), [#box(width: 3.4cm, height: 0.95cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_2: j arrow.r.long$]]])])
  content((10.05, -2.95), [#box(width: 3.4cm, height: 0.95cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_3: j arrow.r.long$]]])])
  content((0, -3.83), [#text(size: 8pt)[Three subblocks shown schematically; within each, visit indices from left to right.]], anchor: "west", padding: 0.1176cm)
  line((0, -4.18), (13, -4.18), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  content((0, -4.6), [#text(size: 9pt)[Endpoint telescope: skipped work]], anchor: "west", padding: 0.1176cm)
  content((0.15, -5.16), [#text(size: 9pt)[$U_1 gt.eq V_1 gt.eq U_2 gt.eq V_2 gt.eq dots.h$]], anchor: "west", padding: 0.1176cm)
  content((0.15, -5.65), [#text(size: 8pt)[$U_k,V_k$: entry and exit entropy values]], anchor: "west", padding: 0.1176cm)
  content((7.3, -5.14), [#text(size: 9pt)[$ sum_k(U_k-V_k) lt.eq P$]], anchor: "west", padding: 0.1176cm)
  content((7.3, -5.85), [#text(size: 9pt)[$ sum_( "macroblock" "skips" )P lt.eq 1$]], anchor: "west", padding: 0.1176cm)
  content((0, -6.32), [#text(size: 9pt)[Exact-cost telescope: completed targets]], anchor: "west", padding: 0.1176cm)
  content((0.15, -6.91), [#text(size: 9pt)[$j_1>j_2> dots.h , a_(j_(k+1))( upright("entry") ) lt.eq a_(j_k)( upright("exit") )$]], anchor: "west", padding: 0.1176cm)
  content((9.3, -6.91), [#text(size: 9pt)[$ arrow.r.double.long#h(0.3333em) sum "drops" lt.eq 1$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Visit orders in the refinement search. Macroblocks advance with $j$, subblocks inside one macroblock are visited in reverse order, and indices inside one subblock again advance with $j$. Block lengths $m$ decrease with $j$. The endpoint telescope controls skipped work, while the exact-cost telescope controls completed targets. In the first sum, $j_k$ runs through skipped indices in one subblock, $U_k = g_(m_(j_k \, 1))$ at entry to $j_k$, and $V_k = g_(m_(j_k \, 0))$ at exit from $j_k$. For a macroblock with highest and lowest block-length endpoints $H \, ell$, put $P = g_H \( upright("entry to the macroblock") \) - g_ell \( upright("current state") \)$. Each $P$ in the macroblock sum is evaluated at that macroblock’s own skip. Entry and exit values include changes caused by intervening refinements. ],
  ) <entropy-refinement:skip-figure>
  ===== 4.2.5 One macroblock. <one-macroblock.>
  Let $c_1$ be the cumulative cost in the current macroblock. At boundaries before or after subblock runs, skip the rest of the macroblock if
  #[#set math.equation(numbering: n => "(4.13)")
   $ P > c_1 \/ alpha_1 + delta_1 . $ <entropy-refinement:macro-skip>]
  Target indices decrease strictly between completed subblocks. For successive such indices $j > j'$, monotonicity in index and time gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ a_(j') \( upright("entry to ") j' \) lt.eq a_j \( upright("exit from ") j \) . $ <entropy-refinement:target-telescope>]
  Their actual targeted decreases telescope to at most one. At most $1 \/ u$ subblocks can complete targets, whereas there are $q_(*) > 1 \/ u$ subblocks. Thus this macroblock must be skipped or discover the desired inequality before it can be exhausted.
  For a completed subblock after which no macroblock skip is made and processing continues, apply (4.12) with the new $P$, and then the failure of (4.13):
  $ c_(1 \, upright("new")) - c_(1 \, upright("old")) lt.eq alpha_0 \( c_(1 \, upright("new")) \/ alpha_1 + delta_1 + n^(- 2 \/ 5) \) . $
  Put $beta_(*) = alpha_0 \/ alpha_1 = 1 \/ \( 1000 log N \)$ and $delta_(*) = delta_1 + n^(- 2 \/ 5)$. Iteration over at most $1 \/ u$ such runs yields
  #[#set math.equation(numbering: n => "(4.15)")
   $ c_1 lt.eq alpha_1 delta_(*) #scale(x: 120%, y: 120%)[\(] \( 1 - beta_(*) \)^(- 1 \/ u) - 1 #scale(x: 120%, y: 120%)[\)] lt.eq alpha_1 . $ <entropy-refinement:macro-cost>]
  Indeed $n gt.eq N^5$, so $n^(- 2 \/ 5) lt.eq N^(- 2)$. Also $- log \( 1 - beta_(*) \) lt.eq 2 beta_(*)$, and hence $\( 1 - beta_(*) \)^(- 1 \/ u) lt.eq N^(1 \/ 500)$. The factor multiplying $alpha_1$ is at most $N^(- 249 \/ 500) + N^(- 999 \/ 500) < 1$ for $N gt.eq 4$. One last or partial subblock costs at most $2 alpha_0$ by (4.12) and $P lt.eq 1$.
  ===== 4.2.6 Across macroblocks and termination. <across-macroblocks-and-termination.>
  Macroblocks advance in index order, so their block-length ranges descend as in (4.11). The values of $P$ at macroblock skips sum to at most one. Their total cost is at most $alpha_1$, and fewer than $1 \/ delta_1 = sqrt(N)$ macroblocks can be skipped. Since a macroblock cannot be exhausted without a skip or discovery, the whole search must discover the desired $K$ inequality. Its loops are finite by the positive minimum offer before clipping. Total cost through discovery is bounded by
  $ underbrace(alpha_1, upright("skipped macroblocks")) + underbrace(alpha_1, upright("continuing subblocks")) + underbrace(2 alpha_0, upright("last subblock")) lt.eq 4 alpha_1 . $
  Both telescopes allow decreases caused by intervening refinements; see 1.
  Since $h = 4 log w$ and $M asymp w^2$, both $log n$ and $log N$ are of order $h$. Thus $4 alpha_1 lt.eq C \/ h^2$. Undoing the cost normalization proves (4.6). Each new observation and mark has a finite alphabet, so the finite sequence leaves a finite-valued context. ◻
]

=== 4.3 Freezing contexts and extracting one phase region <freezing-contexts-and-extracting-one-phase-region>

#proof[
  #emph[Completion of the proof of 2.] Use the context $W$, index $j$, and high endpoint $m = m_(j \, 1)$ supplied by 10. Put $r = r_j$ and $s = m r gt.eq L$. Combining (4.6) with the low-end bound (3.24), preserved under refinement, gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ K_m \( W \; r \) lt.eq C E $ <entropy-refinement:high-cost>]
  with numerical $C$. Lift a minimizing coupling to all $s$ letters using the full-vector interpretation of the cost. Write $bold(W) = \( W_i \)_(i = 1)^s$ for their whole context stack, and $nu_z$ for the prescribed one-letter conditional law given context $z$.
  At any fixed stack $bold(w)$ of positive probability, compute
  #[#set math.equation(numbering: n => "(4.17)")
   $ C \( bold(w) \) & = D (X^s thin mid(parallel) thin product_i nu_(w_i)) + upright(I) \( X^s \; Z \) + bb(E) c \( Gamma \) \,\
 & #h(35mm)  Z = sum_i X_i + Gamma \, $ <entropy-refinement:frozen-cost>]
  under the actual conditional law at that stack. All three terms are nonnegative. The actual conditional letter marginals after freezing the whole stack may differ from the comparator laws $nu_(w_i)$. Nevertheless the comparison has finite divergence: an event $X_i = x \, W_i = w_i$ with $nu_(w_i) \( x \) = 0$ has zero probability even before conditioning, so it also has zero probability at any positive-probability stack. Before freezing, however, each row has its prescribed independent block marginal, and consequently
  $ bb(E) [- log product_i nu_(W_i) \( X_i \)] = s upright(H) \( X divides W \) . $
  Subtracting $upright(H) \( X^s divides Z \, bold(W) \)$ and adding the error cost therefore shows that $bb(E) C \( bold(W) \) = K_m \( W \; r \) lt.eq C E$.
  For the separate quantity $B \( bold(w) \) = s^(- 1) sum_i D \( nu_(w_i) parallel U_S \)$, the prescribed pair marginals give
  #[#set math.equation(numbering: n => "(4.18)")
   $ bb(E) B \( bold(W) \) & = log \| S \| - upright(H) \( X divides W \)\
 & = log \| S \| - upright(H) \( nu \) + G_1 \( diameter \) - G_1 \( W \)\
 & lt.eq C E \/ T + frac(C D_(*)^2, E h^2) lt.eq frac(C \( D_0 \) d^2, E h^2) . $ <entropy-refinement:frozen-divergence>]
  This uses (3.11), (4.6). The $E \/ T$ term is absorbed because $T asymp d \/ h^5$, $E lt.eq D_0 d$, and $E^2 h^7 \/ d^3 arrow.r 0$ for fixed $D_0$. Markov’s inequality, with factor four for each quantity, selects one stack such that
  #[#set math.equation(numbering: n => "(4.19)")
   $ C \( bold(w) \) lt.eq C E \, #h(2em) B \( bold(w) \) lt.eq frac(C \( D_0 \) d^2, E h^2) . $ <entropy-refinement:chosen-stack>]
  A zero-mean quantity is zero almost surely, which covers that case as well. Freeze this stack.
  ===== 4.3.1 A large independent noisy-sum atom. <a-large-independent-noisy-sum-atom.>
  Let $p = product_i nu_(w_i)$, and compare the actual conditional law of $\( X^s \, Gamma \)$ to the independent law $p times q$. The map $\( X^s \, Gamma \) mapsto \( X^s \, Z \)$ is invertible, and $- log q \( Gamma \) = F_0 + c \( Gamma \)$. Thus
  #[#set math.equation(numbering: n => "(4.20)")
   $ C \( bold(w) \) = D #scale(x: 120%, y: 120%)[\(] \( X^s \, Gamma \) parallel p times q #scale(x: 120%, y: 120%)[\)] + upright(H) \( Z \) - F_0 . $ <entropy-refinement:noisy-identity>]
  Let $Q_Z$ be the sum law under $p times q$. Data processing gives
  $ C \( bold(w) \) + F_0 gt.eq D \( cal(L) \( Z \) parallel Q_Z \) + upright(H) \( Z \) = bb(E) \[ - log Q_Z \( Z \) \] . $
  Some integer $z_(*)$ in the support of the actual output therefore has $Q_Z \( z_(*) \) gt.eq e^(- F_0 - C E) = q \( 0 \) e^(- C E)$. All $Q_Z$ masses are positive since $q$ is strictly positive. Divide the convolution formula by $q \( 0 \)$ and use the characteristic formula:
  #[#set math.equation(numbering: n => "(4.21)")
   $ e^(- C E) & lt.eq Q_Z \( z_(*) \) \/ q \( 0 \)\
 & = integral chi_(g z_(*)) \( theta \) product_i bb(E)_(nu_(w_i)) chi_(- g X) \( theta \) thin d omega \( theta \)\
 & lt.eq integral product_i lr(|bb(E)_(nu_(w_i)) chi_(g X) \( theta \)|) thin d omega \( theta \) . $ <entropy-refinement:phase-product>]
  The last step takes the absolute value of the preceding integral, whose value is a positive real mass.
  ===== 4.3.2 One region and one coordinate. <one-region-and-one-coordinate.>
  Put $phi.alt_i \( theta \) = bb(E)_(nu_(w_i)) chi_(g X) \( theta \)$ and $A \( theta \) = sum_i \( 1 - \| phi.alt_i \( theta \) \|^2 \)$. The bound $0 lt.eq \| phi.alt_i \| lt.eq 1$ implies $product_i \| phi.alt_i \| lt.eq e^(- A \/ 2)$. Choose a numerical $C_R$ larger than twice the constant in (4.21), with a fixed additional margin, and set $cal(R) = { A lt.eq C_R E }$. Since $E gt.eq d \/ h^2 gt.eq 1$, the contribution of $cal(R)^c$ to the product integral is at most half its lower bound. The product is at most one, so
  #[#set math.equation(numbering: n => "(4.22)")
   $ omega \( cal(R) \) gt.eq e^(- C E) \, #h(2em) sum_i integral \( 1 - \| phi.alt_i \|^2 \) thin d omega_(cal(R)) lt.eq C E \, $ <entropy-refinement:region>]
  where $omega_(cal(R))$ is normalized restriction to $cal(R)$. Apply Markov’s inequality to a uniform choice of coordinate, using (4.19), (4.22). One coordinate satisfies both
  #[#set math.equation(numbering: n => "(4.23)")
   $ integral \( 1 - \| phi.alt_i \|^2 \) thin d omega_(cal(R)) lt.eq C E \/ s \, #h(2em) D \( nu_(w_i) parallel U_S \) lt.eq frac(C \( D_0 \) d^2, E h^2) . $ <entropy-refinement:coordinate>]
  Only numerical factors are lost in the first bound. Write $mu = nu_(w_i)$.
  ===== 4.3.3 A center and a subset valid for every weight. <a-center-and-a-subset-valid-for-every-weight.>
  For independent $X \, breve(X) tilde.op mu$,
  $ 1 - \| phi.alt_i \( theta \) \|^2 = bb(E) \[ 1 - "Re" chi_(g \( X - breve(X) \)) \( theta \) \] . $
  Averaging over $omega_(cal(R))$ and then over $breve(X)$ selects $x_0 in "supp" mu subset S$ with
  $ sum_x mu \( x \) integral \( 1 - "Re" chi_(g \( x - x_0 \)) \) thin d omega_(cal(R)) lt.eq C E \/ s . $
  Prune by Markov’s inequality to a subset $S' subset "supp" mu$ of $mu$-mass at least $1 \/ 2$, on which every $x$ satisfies
  #[#set math.equation(numbering: n => "(4.24)")
   $ integral \( 1 - "Re" chi_(g \( x - x_0 \)) \) thin d omega_(cal(R)) lt.eq C E \/ s . $ <entropy-refinement:pruned-defect>]
  If the average defect is zero, its zero-defect set has full $mu$-mass and can be used for $S'$. In all cases $S'$ is nonempty.
  Write $t = mu \( S' \) gt.eq 1 \/ 2$ and $v_0 = \| S' \| \/ \| S \|$. Binary data processing gives
  $ D \( mu parallel U_S \) gt.eq t log t / v_0 + \( 1 - t \) log frac(1 - t, 1 - v_0) gt.eq t log 1 / v_0 - log 2 . $
  Together with (4.23), this implies
  $ log \| S \| - log \| S' \| lt.eq 2 D \( mu parallel U_S \) + 2 log 2 lt.eq frac(C \( D_0 \) d^2, E h^2) . $
  The constant is absorbed because $d^2 \/ \( E h^2 \) arrow.r oo$.
  Finally, let $v$ be any probability measure on this same $S'$. By (4.24), its averaged phase defect on $cal(R)$ is at most $C E \/ s$. Jensen’s inequality and $L lt.eq s$ yield
  $ & integral exp [- L sum_(x in S') v \( x \) \( 1 - "Re" chi_(g \( x - x_0 \)) \( theta \) \)] thin d omega \( theta \)\
 & quad gt.eq omega \( cal(R) \) exp [- L sum_(x in S') v \( x \) integral \( 1 - "Re" chi_(g \( x - x_0 \)) \) thin d omega_(cal(R))]\
 & quad gt.eq e^(- C E) e^(- C E L \/ s) gt.eq e^(- C E) . $
  The region, center, and subset were fixed before $v$ was chosen, establishing the conclusion for every probability on $S'$. The exponential constant is numerical: dependence on $D_0$ occurs in the entropy loss and in the sufficiently large threshold for $d$, whereas (4.16) and all subsequent constant-factor selections have numerical bounds. This completes the proof. ◻
]

== 5 Thermal labels and the spectral update <sec:thermal>

This section constructs the channels that will be attached to the spatial pieces. It also supplies two ways to pay for a change of channel: a deterministic increase in a metric ball, and an observable event that is unlikely under a comparison law. The choices of channels and of input membership sets will always be made without inspecting a sampled label.

=== 5.1 Positive Fourier kernels and form order <positive-fourier-kernels-and-form-order>

#prodef([Definition 5.1.])[
  (Thermal forms).  A thermal form on the unit circle is a finite sum
  $ A \( y \) = sum_s lambda_s \( 1 - "Re" chi_s \( y \) \) \, #h(2em) lambda_s gt.eq 0 \, quad s in bb(Z) . $
  We write $A prec.curly.eq A'$ if $A' = A + D$ for a thermal form $D$. Define
  #[#set math.equation(numbering: n => "(5.1)")
   $ q_A \( u \) = integral_(bb(T)) e^(- A \( y \)) overline(chi_u \( y \)) thin d y \, #h(2em) F \( A \) = - log q_A \( 0 \) \, #h(2em) K_A = e^(F \( A \) - A) \,\
Delta_A \( u \) = (integral_(bb(T)) \| 1 - chi_u \( y \) \|^2 K_A \( y \) thin d y)^(1 \/ 2) \, #h(2em) B_A \( r \) = { u in bb(Z) : Delta_A \( u \) lt.eq r } . $ <eq:thermal-definitions>]
  Thus $K_A$ is a probability density. All circle integrals in this section use normalized measure of total mass one.
]

The covariance argument below belongs to the Griffiths–Ginibre positive-correlation method #cite(label("Ginibre1970")). We include the circle calculation, together with the form-order consequences needed for the label updates.

#thm([Lemma 5.2.])[
  (Thermal positivity and monotonicity).  #emph[For every thermal form, $q_A$ is a nonnegative, even probability mass function on $bb(Z)$. The coefficients $integral chi_u K_A = q_A \( u \) \/ q_A \( 0 \)$ are real and nonnegative. For all integers $u \, v$, 
$ "Cov"_(K_A) \( "Re" chi_u \, "Re" chi_v \) gt.eq 0 . $

 Consequently these characteristic coefficients increase in form order, $Delta_A \( u \)$ decreases in form order, and $Delta_A \( u + v \) lt.eq Delta_A \( u \) + Delta_A \( v \)$. The function $F$ increases in form order. For every thermal form $D$, the increment $F \( A + D \) - F \( A \)$ decreases when $A$ increases in form order.]
  #emph[If $P = sum_j P_j$ is a finite sum of thermal forms and $P_(upright("lo")) prec.curly.eq P prec.curly.eq P_(upright("hi"))$, then, for arbitrary shifts $z_j$ and every integer $u$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ lr(|integral chi_u \( y \) product_j e^(- P_j \( z_j - y \)) thin d y|) lt.eq q_P \( u \) lt.eq e^(- F \( P_(upright("lo")) \)) integral chi_u K_(P_(upright("hi"))) . $ <eq:thermal-envelope>]

]
] <lemma:thermal-monotonicity>

#proof[
  Expand each factor as
  $ e^(- lambda \( 1 - "Re" chi_s \)) = e^(- lambda) exp #scale(x: 120%, y: 120%)[\(] \( lambda \/ 2 \) chi_s #scale(x: 120%, y: 120%)[\)] exp #scale(x: 120%, y: 120%)[\(] \( lambda \/ 2 \) chi_(- s) #scale(x: 120%, y: 120%)[\)] . $
  Its Fourier coefficients are nonnegative, with sum one. The expansions are absolutely summable, as is their finite product. Evaluation at zero therefore gives $sum_u q_A \( u \) = 1$; evenness gives $q_A \( - u \) = q_A \( u \)$.
  For completeness, write $c_s \( y \) = cos \( 2 pi s y \)$ and $Z_A = integral exp \( sum_s lambda_s c_s \)$. Express the covariance using two independent copies as half the expectation of the product of their differences. The map $\( x \, z \) mapsto \( x + z \, x - z \)$ pushes Haar probability on the two-dimensional torus to Haar probability. The two differences are $- 2 sin \( 2 pi u x \) sin \( 2 pi u z \)$ and the analogous expression for $v$, whereas the unnormalized product density is $exp \( 2 sum_s lambda_s c_s \( x \) c_s \( z \) \)$. Expanding this last exponential gives the identity
  $ "Cov"_(K_A) \( c_u \, c_v \) = 2 / Z_A^2 sum_(\( n_s \) gt.eq 0) (product_s frac(\( 2 lambda_s \)^(n_s), n_s !)) (integral sin \( 2 pi u x \) sin \( 2 pi v x \) product_s c_s \( x \)^(n_s) thin d x)^2 . $
  Absolute convergence justifies the expansion and proves nonnegativity. Differentiation under the integral yields
  $ frac(partial, partial lambda_v) integral c_u K_A = "Cov"_(K_A) \( c_u \, c_v \) \, #h(2em) frac(partial F, partial lambda_u) = integral \( 1 - c_u \) K_A . $
  The latter derivatives are nonnegative and decrease in every nonnegative coefficient direction. Integrating these derivative statements proves the assertions about $F$ and its increments. Since $Delta_A \( u \)^2 = 2 \( 1 - integral c_u K_A \)$, the metric monotonicity follows as well. Subadditivity follows from $1 - chi_(u + v) = \( 1 - chi_u \) + chi_u \( 1 - chi_v \)$ and the triangle inequality in $L^2 \( K_A \)$.
  Translation multiplies each Fourier coefficient of $e^(- P_j)$ by a unit complex number. Absolute values in the convolution of these coefficients are therefore bounded by the corresponding convolution of the centered coefficients, which is $q_P \( u \)$. Finally $q_P \( u \) = e^(- F \( P \)) integral chi_u K_P$, and both required comparisons follow from the monotonicities already proved. ◻
]

For a real interval $p$ of length at most one, set

$ R_p = \| p \|^(- 1) \, #h(2em) S_p \( y \) = R_p^2 \( 1 - "Re" chi_1 \( y \) \) . $

The interval may be viewed on the circle when integrating. We will use the following bounds, also with any larger spatial scaling in place of $R_p$:

#[#set math.equation(numbering: n => "(5.3)")
 $ F \( S_p \) = log R_p + O \( 1 \) \, #h(2em) integral \( 1 - "Re" chi_1 \) K_(A + S_p) lt.eq C R_p^(- 2) \,\
q_(S_p) \( u \) gt.eq c R_p^(- 1) quad \( \| u \| lt.eq c R_p \) \, #h(2em) Delta_(A + S_p) \( u \) lt.eq C \| u \| \/ R_p . $ <eq:thermal-spatial>]

Indeed, if $parallel y parallel$ denotes distance to the nearest integer, then $8 parallel y parallel^2 lt.eq 1 - cos \( 2 pi y \) lt.eq 2 pi^2 parallel y parallel^2$. Gaussian comparison gives $integral e^(- S_p) asymp R_p^(- 1)$ and $integral \( 1 - "Re" chi_1 \) K_(S_p) lt.eq C R_p^(- 2)$. Monotonicity gives the second bound for $A + S_p$. The elementary inequality $\| 1 - chi_u \| lt.eq \| u \| \| 1 - chi_1 \|$ gives the last bound and, for sufficiently small $\| u \| \/ R_p$, gives $integral chi_u K_(S_p) gt.eq 1 \/ 2$, proving the remaining lower bound. In particular $integral S_p K_(A + S_p) lt.eq C$.

=== 5.2 Channels, scales, and the cost of tightening a form <channels-scales-and-the-cost-of-tightening-a-form>

Take $b_0$ dyadic with $h^(- 16) \/ 2 < b_0 lt.eq h^(- 16)$. The computation levels are the dyadic $b$ from $b_0 \/ 8$ to $1$, and

#[#set math.equation(numbering: n => "(5.4)")
 $ k_b = A_0 d / h \( 1 + log \( 1 \/ b \) \)^2 \, #h(2em) r_(upright("sep")) = h^(- 30) \, #h(2em) sigma = h^(- 40) . $ <eq:thermal-parameters>]

The constants will be fixed in the order stated below. Every estimate holds for sufficiently large $d$, uniformly in the spatial depth and in any frequency cutoff.

A label of type $A$ is $Z = Y + theta$ modulo one, where the error $theta$ has density $K_A$. Initially $A = 0$, so a dummy independent uniform label may be drawn. Only the current main channel is used in the spectra and transforms. A successful update adds a spatial form and a metric form, $A^(+) = A + S_p + D_i$. The errors used for different label draws are independent given $Y$. Their parameters are selected from spatial prefixes and earlier input membership events. In particular neither a sampled old label nor a sampled fresh label selects a membership set, channel, or test. Conditional on $Y$ and its discrete parameter path, the errors thus retain their prescribed independent laws.

We will need to tighten the forms of past labels at small free-energy cost and to keep their own-error energies $integral A K_A$ small. Both estimates follow by choosing each metric addition on a sufficiently flat interval of free energy. We require, with $A_(upright("base"))$ the form immediately before the addition and including its new spatial term,

#[#set math.equation(numbering: n => "(5.5)")
 $ F \( A_(upright("base")) + h^140 D_i \) - F \( A_(upright("base")) + D_i \/ 2 \) lt.eq d h^(- 400) . $ <eq:source-5>]

Before a requested update assume that fewer than $C_0 h$ main additions have occurred and that

#[#set math.equation(numbering: n => "(5.6)")
 $ F \( A \) lt.eq log R_(*) + C_(*) d . $ <eq:source-6>]

Here $p_(*)$ is the interval of the most recent addition, $R_(*) = R_(p_(*))$, and the current $p$ is contained in $p_(*)$. Before the first addition $p_(*)$ is the top interval, whose length lies in $\[ 1 \/ 2 \, 1 \]$. The procedure in 6 will establish these hypotheses inductively.

Fix a sufficiently large numerical $C_s$ and put $tilde(A) = h^130 A + C_s S_p$. Then

#[#set math.equation(numbering: n => "(5.7)")
 $ F \( tilde(A) \) - F \( A + S_p \) & lt.eq C + C C_0 h #scale(x: 120%, y: 120%)[\(] d h^(- 400) + C log h #scale(x: 120%, y: 120%)[\)] \,\
integral A K_A & lt.eq C C_0 h #scale(x: 120%, y: 120%)[\(] d h^(- 400) + 1 #scale(x: 120%, y: 120%)[\)] . $ <eq:source-7>]

To prove the first line, enlarge the constituent forms one at a time. For an old metric term $D_i$, decreasing increments bound its cost of tightening by the left side of (5.5): the other terms already contain its original $A_(upright("base"))$. Tightening an old spatial term costs at most $F \( h^130 S_(p_i) \) - F \( S_(p_i) \) lt.eq C \( 1 + log h \)$ by (5.3). Tightening the current newly inserted $S_p$ to $C_s S_p$ costs $O \( 1 \)$. For the energy bound, concavity along the $D_i$ direction and (5.5) give

$ integral D_i K_A lt.eq 2 { F \( A_(upright("base") \, i) + D_i \) - F \( A_(upright("base") \, i) + D_i \/ 2 \) } lt.eq 2 d h^(- 400) . $

Each spatial constituent contributes $O \( 1 \)$ by (5.3) and monotonicity. This energy argument uses the count bound and (5.5), but does not use (5.6); it remains valid, with the same type of bound, just after a final allowed addition that breaches a later stopping cap.

The spatial increment itself obeys

#[#set math.equation(numbering: n => "(5.8)")
 $ F \( A + S_p \) lt.eq F \( A \) + log \( R_p \/ R_(*) \) + C . $ <eq:thermal-spatial-increment>]

After an addition, $A$ contains $S_(p_(*))$, so $q_A \( u \) gt.eq c e^(- F \( A \))$ for $\| u \| lt.eq c R_(*)$. Convolution with $q_(S_p)$ over those integers gives $q_(A + S_p) \( 0 \) gt.eq c e^(- F \( A \)) R_(*) \/ R_p$. Initially use the term $u = 0$ alone and $1 lt.eq R_(*) lt.eq 2$.

=== 5.3 From a separated spectrum to a finite compression problem <from-a-separated-spectrum-to-a-finite-compression-problem>

Consider a subdensity $a$ at an interval $p$, with

$ 0 lt.eq a lt.eq e^d \, #h(2em) e^(- d) lt.eq m = bb(E)_p a lt.eq 2 alpha \, #h(2em) alpha > 0 . $

Here $bb(E)_p$ is uniform spatial average, and $cal(P)$ is the law of $Y$ with density $a \/ m$ relative to that average. For either prospective child $p'$ define

#[#set math.equation(numbering: n => "(5.9)")
 $ M_(p') \( z \) & = bb(E)_(p') \[ a K_A \( z - Y \) \] \/ alpha \,\
f_(p')^u \( z \) & = bb(E)_(p') \[ a chi_u \( Y \) K_A \( z - Y \) \] \/ alpha \,\
G_(p')^u & = integral \| f_(p')^u \( z \) \|^2 \/ M_(p') \( z \) thin d z . $ <eq:thermal-child-moments>]

The integrand is zero at zero mass. An integer is high at $b$ when some $G_(p')^u gt.eq b^2$. A test requests an update if there is a collection of $ceil.l e^(k_b) ceil.r$ high integers whose pairwise differences avoid

#[#set math.equation(numbering: n => "(5.10)")
 $ B_A \( r_(upright("sep")) \) + { j in bb(Z) : \| j \| lt.eq sigma R_p } . $ <eq:thermal-separation>]

One offending level and one collection are used at a time.

Keep at least half this collection having a common high child, and snap each retained integer to a nearest multiple $g x$, where

$ g = max \( 1 \, floor.l sigma R_p \/ 20 floor.r \) . $

The snapping error is at most $sigma R_p \/ 20$, and is zero when $g = 1$. The snapped indices are distinct, since otherwise the original difference would violate (5.10). Denote by $S$ the resulting set of integer indices $x$. For each $x in S$ choose a measurable complex function $v_x$, with $\| v_x \| lt.eq 1$, so that

#[#set math.equation(numbering: n => "(5.11)")
 $ "Re" bb(E)_(cal(P)) \[ upright(bold(1))_(upright("child")) v_x \( Z \) chi_(g x) \( Y \) \] gt.eq beta \, #h(2em) beta = b^2 \/ 100 . $ <eq:source-8>]

The expectation here includes the type-$A$ channel. To see the bias, $\| f_(p')^u \| lt.eq M_(p')$ implies $integral \| f_(p')^u \| gt.eq G_(p')^u$. Choosing the polarizing sign gives bias $\( alpha \/ \( 2 m \) \) integral \| f_(p')^u \| gt.eq b^2 \/ 4$ before snapping. A constant phase rotation at the center of $p$ makes the error of replacing $u$ by $g x$ at most $C sigma$. This is smaller than the required slack because $sigma = o \( b^2 \)$ uniformly over the computation levels.

We apply 2 with

$ d omega = K_(tilde(A)) thin d y \, #h(2em) q \( x \) = frac(q_(tilde(A)) \( g x \), N_g) \, #h(2em) N_g = sum_(x in bb(Z)) q_(tilde(A)) \( g x \) . $

The spatial frequency-one term makes every Fourier coefficient strictly positive: in its exponential expansion, every integer frequency occurs with positive coefficient. Therefore $q$ is strictly positive. The grid identity and Gaussian comparison give

#[#set math.equation(numbering: n => "(5.12)")
 $ N_g = 1 / g sum_(l = 0)^(g - 1) e^(- tilde(A) \( l \/ g \)) \, #h(2em) 1 / g lt.eq N_g lt.eq C / g . $ <eq:thermal-grid-normalizer>]

Indeed $g lt.eq R_p$, and the summands are bounded by $exp \( - c R_p^2 parallel l \/ g parallel^2 \)$. Moreover $R_p \/ g lt.eq C \/ sigma$, also when $g = 1$ by its definition. Thus (5.6), (5.7), (5.8) imply

$ F_0 = - log q \( 0 \) = F \( tilde(A) \) - log g + O \( 1 \) lt.eq D_0 d $

for a fixed sufficiently large $D_0$ depending only on the fixed caps. Evenness gives precisely $q \( x \) \/ q \( 0 \) = integral chi_(g x) thin d omega$.

We verify both remaining uniform hypotheses of compression.

===== 5.3.1 Sumset size. <sumset-size.>

We use the dissociated-spectrum method underlying Chang’s lemma #cite(label("Chang2002")) Section 3, in its entropy and positive-product form #cite(label("Lee2017")) Section 3.2. The following calculation includes the side information carried by the label: the comparison law makes that information independent of the uniform circle coordinate.

The law of $g Y$ modulo one has density at most $e^(2 d) \( 1 + R_p \/ g \)$: its preimage count in $p$ is at most $g \/ R_p + 1$, and the density of $Y$ relative to circle length is at most $R_p e^(2 d)$. Also

#[#set math.equation(numbering: n => "(5.13)")
 $ upright(I) \( Y \; Z \) lt.eq F \( A \) - log R_(*) + C . $ <eq:thermal-label-information>]

Compare each $K_A \( z - Y \)$ to the fixed density $K_(S_(p_(*))) \( z - "center" \( p_(*) \) \)$. The average relative entropy is

$ F \( A \) - F \( S_(p_(*)) \) - integral A K_A + bb(E) S_(p_(*)) \( theta + Y - "center" \( p_(*) \) \) . $

The last expectation is $O \( 1 \)$: use $S \( v + w \) lt.eq 2 S \( v \) + 2 S \( w \)$, the spatial energy bound, and $\| Y - "center" \( p_(*) \) \| lt.eq \| p_(*) \| \/ 2$. In the initial case $A = 0$ and $R_(*) lt.eq 2$, the same bound is immediate. Dropping the nonpositive term proves (5.13).

Let $Q$ denote the side information consisting of $Z$ and the child bit. Data processing and its one-bit entropy imply

$ D #scale(x: 120%, y: 120%)[\(] \( g Y \, Q \) thin parallel thin upright("uniform") ⊗ cal(L) \( Q \) #scale(x: 120%, y: 120%)[\)] = D \( g Y parallel upright("uniform") \) + upright(I) \( g Y \; Q \) lt.eq C \( C_(*) \) d . $

If $Lambda subset S$ is dissociated, meaning that no nonzero coefficient choice from ${ 0 \, plus.minus 1 }$ sums to zero, form the positive product

$ product_(x in Lambda) (1 + c beta "Re" \[ upright(bold(1))_(upright("child")) v_x \( Z \) chi_x \( g Y \) \]) . $

For sufficiently small numerical $c$, the factors lie in $\[ 1 \/ 2 \, 3 \/ 2 \]$. Under the reference law the first coordinate is uniform and independent of $Q$; expansion and dissociation make the expectation of the product exactly one. Relative entropy is at least the true expected logarithm of this product. The inequality $log \( 1 + s \) gt.eq s - C s^2$, together with (5.11), bounds the expected logarithm of each factor below by $c' beta^2$. Hence $\| Lambda \| lt.eq C \( C_(*) \) d \/ beta^2$. A maximal dissociated subset spans $S$ by coefficients $0 \, plus.minus 1$: otherwise adjoining an unspanned element preserves dissociation. Consequently

$ \| n S \| lt.eq \( 2 n + 1 \)^(\| Lambda \|) \, #h(2em) log \| n S \| lt.eq D_0 d h^(P_0) log d quad \( 1 lt.eq n lt.eq d^2 \) $

for fixed $D_0 \, P_0$, because $beta gt.eq c h^(- 32)$.

===== 5.3.2 The uniform moment cap. <the-uniform-moment-cap.>

For any probability $nu$ on $S$ set

#[#set math.equation(numbering: n => "(5.14)")
 $ E_T \( nu \) & = - log bb(E)_nu H_q (sum_(i = 1)^T X_i - sum_(i = 1)^T X'_i) \,\
e^(- E_T \( nu \)) & = integral lr(|sum_x nu \( x \) chi_(g x) \( y \)|)^(2 T) K_(tilde(A)) \( y \) thin d y \, $ <eq:thermal-moment-cost>]

where the $2 T$ letters are independent with common law $nu$. Then

#[#set math.equation(numbering: n => "(5.15)")
 $ 0 lt.eq E_T \( nu \) lt.eq D_0 d #h(2em) upright("for every such ") nu . $ <eq:thermal-moment-cap>]

Here is a direct proof of the upper bound. Restrict $Z$ to the domain $Omega$ at circle distance at most $h^40 \/ R_(*)$ from $p$. The channel spatial variance bounds the discarded probability by $C h^(- 80)$ (the assertion is trivial if $Omega$ is the full circle). This loses $o \( beta \)$ in (5.11). Summing the biases with weights $nu$ and applying Jensen on a subprobability measure gives

$ bb(E)_(cal(P)) [upright(bold(1))_(upright("child")) upright(bold(1))_({ Z in Omega }) lr(|sum_x nu \( x \) v_x \( Z \) chi_(g x) \( Y \)|)^(2 T)] gt.eq \( beta \/ 2 \)^(2 T) . $

For an upper bound discard the child indicator. At fixed $z$, first majorize the nonnegative moment integrand using the spatial density bound $R_p e^(2 d)$ and

$ upright(bold(1))_p \( y \) lt.eq exp #scale(x: 120%, y: 120%)[\(] C - S_p \( y - "center" \( p \) \) #scale(x: 120%, y: 120%)[\)] . $

Only after this majorization expand the even power and the shifted thermal weights. By (5.2), the Fourier coefficients of those weights are bounded absolutely by

$ C q_(A + S_p) \( u \) lt.eq C e^(- F \( A + S_p \)) integral chi_u K_(tilde(A)) . $

The coefficients $v_x \( z \)$ have modulus at most one. The absolute coefficient sum in the even-power expansion therefore averages this envelope at $u = g \( sum X_i - sum X'_i \)$ over the independent letters in (5.14). Using $\| Omega \| lt.eq C h^40 \/ R_(*)$, the joint moment is at most

$ C R_p e^(2 d + F \( A \)) h^40 / R_(*) e^(- F \( A + S_p \)) e^(- E_T \( nu \)) . $

Now $F \( A + S_p \) gt.eq log R_p - C$, $F \( A \) lt.eq log R_(*) + C_(*) d$, and $T log \( 2 \/ beta \) = o \( d \)$. Comparison with the lower moment proves (5.15) after increasing the fixed $D_0$. This argument uses a density bound only in a nonnegative integral; it does not assert a Fourier coefficient bound for $a$.

=== 5.4 The iterative update and the deterministic alternative <the-iterative-update-and-the-deterministic-alternative>

#thm([Lemma 5.3.])[
  (Spectral update).  #emph[Fix $C_0 \, C_(*) gt.eq 1$. Let the current form $A$ arise from the initial form zero by fewer than $C_0 h$ additions of spatial and metric forms, each metric satisfying (5.5). Let $p subset p_(*)$, where $p_(*)$ is the latest addition interval, or the top interval of length in $\[ 1 \/ 2 \, 1 \]$ if there has been no addition, and assume $F \( A \) lt.eq log R_(p_(*)) + C_(*) d$. On $p$ suppose $0 lt.eq a lt.eq e^d$ and $e^(- d) lt.eq m = bb(E)_p a lt.eq 2 alpha$, with $alpha > 0$. Suppose there is a request at a computation level $b$ in the sense of (5.10), using the prospective child moments in (5.9) and the type-$A$ channel. There are numerical constants $C_1 \, C_2$ and a sufficiently small numerical $epsilon > 0$ with the following property. After the caps are fixed, choose fixed sufficiently large $D_0 \, P_0$, then $A_0$, and finally take $d$ sufficiently large. A finite deterministic construction supplies a parameter 
$ d \/ h^2 lt.eq t lt.eq D_0 d \, #h(2em) t gt.eq epsilon k_b \, $

 a thermal metric form $D_i = lambda B$, and an input-only success set. On success set $A^(+) = A + S_p + D_i$. The new metric satisfies (5.5) and 
#[#set math.equation(numbering: n => "(5.16)")
 $ A^(+) = A + S_p + D_i \, #h(2em) integral B K_(A^(+)) lt.eq C_1 t \/ lambda \,\
lambda gt.eq d h^200 \, #h(2em) h^140 lambda lt.eq L \, $ <eq:source-9>]

 and $F \( A^(+) \) - F \( A + S_p \) lt.eq C_1 t$. There are two alternatives:]
  + #emph[A regular test has success probability $delta gt.eq beta \/ 2$ under the current input law, where $beta = b^2 \/ 100$. It also supplies a probability $nu$ on a set $S'$ and a center $x_0 in S$ for which $E_T \( nu \) gt.eq t \/ 4$.]
  + #emph[A cheap update succeeds deterministically, has $t = epsilon k_b$, and uses the uniform probability on $S'$.]
  #emph[In both alternatives $log \| S' \| gt.eq 0.8 k_b$ and $B = sum_x nu \( x \) \( 1 - "Re" chi_(g \( x - x_0 \)) \)$. Track a radius starting at $r_(upright("sep")) \/ 4$ and increasing by $eta = r_(upright("sep")) \/ \( 10 C_0 h \)$ at every main addition. As long as the count cap applies, the gap $F \( A \) - log \| B_A \( r \) \|$ starts at zero, stays bounded below by a numerical negative constant, increases by at most $C_2 t$ at a regular success, and decreases by at least $k_b \/ 2$ at a cheap success. On failure there is no main addition and no label draw. All these conclusions are independent of spatial depth and frequency cutoff.]
] <lemma:spectral-update>

#proof[
  #strong[Selecting the subset and its weight.] On $S$ and then on its successive restrictions set
  $ t = max (epsilon k_b \, max_(nu upright(" supported on the current set")) E_T \( nu \)) . $
  The maximum exists: the simplex is compact, its moment integral is continuous and strictly positive, and therefore its negative logarithm is continuous. For large $d$, the floor is between $d \/ h^2$ and $D_0 d$; the upper bound follows also for the maximum from (5.15). Apply 2 with $E = t$ to obtain a subset $S'$ and center $x_0$. Its conclusion holds for every probability on this fixed $S'$, so the weight may now be chosen by the following test. If the maximum of $E_T$ on $S'$ is at least $t \/ 4$, keep a maximizing witness and terminate with a regular test. If that maximum is smaller than $t \/ 4$ and $t = epsilon k_b$, take uniform $nu$ on $S'$ and terminate with a cheap update. Otherwise replace the current set by $S'$ and repeat. Every nonterminal iteration reduces $t$ by a factor of at least four, except possibly for the last transition to the fixed floor. Thus the process terminates in finitely many iterations, and the sum of the logarithmic cardinality losses is at most
  $ C \( D_0 \) frac(d^2, epsilon k_b h^2) . $
  The initial child restriction lost at most $log 2$ in logarithmic cardinality. Since $k_b gt.eq A_0 d \/ h$, choosing $A_0$ sufficiently large in terms of $D_0 \, P_0 \, epsilon$ makes the final loss less than $0.2 k_b$, proving $log \| S' \| gt.eq 0.8 k_b$.
  #strong[Choosing a flat coefficient range.] For the last center and chosen probability, the compression conclusion is
  $ F \( tilde(A) + L B \) - F \( tilde(A) \) lt.eq C t . $
  Put $A_(upright("base")) = A + S_p$. Monotonicity of $F$ and $A_(upright("base")) prec.curly.eq tilde(A)$ give
  $ F \( A_(upright("base")) + L B \) - F \( A_(upright("base")) \) lt.eq #scale(x: 120%, y: 120%)[\[] F \( tilde(A) + L B \) - F \( tilde(A) \) #scale(x: 120%, y: 120%)[\]] + #scale(x: 120%, y: 120%)[\[] F \( tilde(A) \) - F \( A_(upright("base")) \) #scale(x: 120%, y: 120%)[\]] . $
  The first bracket is controlled by compression and the second by the tightening bound in (5.7). Hence
  #[#set math.equation(numbering: n => "(5.17)")
   $ F \( A_(upright("base")) + L B \) - F \( A_(upright("base")) \) lt.eq C_1 t . $ <eq:thermal-volume-cost>]
  The constant $C_1$ is numerical: the volume constant of compression is numerical, and the cap-dependent error in (5.7) is $o \( t \)$ after the fixed caps and $A_0$ have been selected.
  To find a flat range, set
  $ lambda_j = d h^200 \( 2 h^140 \)^j \, #h(2em) N = ⌊frac(log \( 2 L \/ \( d h^200 \) \), log \( 2 h^140 \))⌋ . $
  For $0 lt.eq j < N$, the intervals $\[ lambda_j \/ 2 \, h^140 lambda_j \]$ are adjacent and lie in $\[ d h^200 \/ 2 \, L \]$. Since $log \( L \/ d \) = w = e^(h \/ 4)$, $N asymp e^(h \/ 4) \/ log h > C_1 D_0 h^400$ for sufficiently large $d$. The sum of the free-energy increments on these intervals is bounded by (5.17), hence by $C_1 D_0 d$. At least one increment is at most $d h^(- 400)$. Take its $lambda$ and $D_i = lambda B$; this is (5.5). Concavity along the $B$ direction gives
  $ integral B K_(A_(upright("base")) + lambda B) lt.eq frac(F \( A_(upright("base")) + lambda B \) - F \( A_(upright("base")) \), lambda) lt.eq C_1 t \/ lambda \, $
  which proves (5.16) and the metric increment bound.
  #strong[The input-only success set.] For a regular test define the success set by
  #[#set math.equation(numbering: n => "(5.18)")
   $ lr(|sum_x nu \( x \) chi_(g x) \( Y \) bb(E) \[ v_x \( Z \) divides Y \]|) gt.eq beta \/ 2 . $ <eq:thermal-success-set>]
  The expectation uses the specified type-$A$ channel, rather than the sampled old observation. The expression has modulus at most one, and (5.11), averaged with $nu$, gives its expected modulus at least $beta$. Thus its probability of exceeding $beta \/ 2$ is at least $beta \/ 2$. In the cheap alternative take the entire input as success. The data $a \, p \, alpha \, A$ determine all these sets and choices.
  #strong[The change in the gap potential.] It remains to prove the gap assertions. Since $r lt.eq r_(upright("sep")) \/ 2$ through the count cap, summability of $q_A$ gives
  $ \| B_A \( r \) \| e^(- F \( A \)) \( 1 - r^2 \/ 2 \) lt.eq 1 \, #h(2em) F \( A \) - log \| B_A \( r \) \| gt.eq log \( 1 - r^2 \/ 2 \) gt.eq - C . $
  The balls are finite by the same inequality. Initially $A = 0$ and $B_0 \( r \) = { 0 }$, so the gap is zero. The spatial addition raises $F$, but also allows short integer translates of the old ball inside a slightly larger new ball. We compare these changes using the same overlap multiplicity. Write
  $ U = B_A \( r \) \, #h(2em) D_p = bb(Z) ∩ \[ - sigma R_p \/ 10 \, sigma R_p \/ 10 \] \, #h(2em) l = \| \( U - U \) ∩ \( D_p - D_p \) \| . $
  Here $l gt.eq 1$. On this intersection $Delta_A lt.eq 2 r$ and $\| u \| lt.eq sigma R_p \/ 5$, so convolution and (5.3) imply
  #[#set math.equation(numbering: n => "(5.19)")
   $ F \( A + S_p \) - F \( A \) lt.eq log R_p - log l + C \, #h(2em) \| U + D_p \| gt.eq \| U \| \| D_p \| \/ l . $ <eq:thermal-packing-pair>]
  For the second inequality, each representation of a fixed element of $U + D_p$ differs from one fixed representation by an element of the intersection defining $l$, so its multiplicity is at most $l$.
  After either addition, $U + D_p$ lies in $B_(A^(+)) \( r + eta \/ 2 \)$, since monotonicity preserves the old radius and $Delta_(A^(+)) \( j \) lt.eq C \| j \| \/ R_p lt.eq C sigma = o \( eta \)$ for $j in D_p$. On a cheap success, uniformity of $nu$ and (5.16) give
  $ frac(1, \| S' \|) sum_(x in S') Delta_(A^(+)) \( g \( x - x_0 \) \)^2 lt.eq 2 C_1 t \/ lambda . $
  At least half the $x$ therefore have $Delta_(A^(+)) \( g \( x - x_0 \) \) lt.eq sqrt(4 C_1 t \/ lambda) lt.eq C \( D_0 \) h^(- 100) = o \( eta \)$. Their translates $g \( x - x_0 \) + U + D_p$ lie in the new tracked ball $B_(A^(+)) \( r + eta \)$. They are disjoint. A collision would put $g \( x - x' \)$ in $U - U + D_p - D_p$; after restoring the two snapping errors, the difference of the original frequencies would lie in
  $ B_A \( 2 r \) + { j in bb(Z) : \| j \| lt.eq 3 sigma R_p \/ 10 } \, $
  contrary to (5.10).
  Since $R_p \/ \| D_p \| lt.eq C \/ sigma$, including the case $D_p = { 0 }$, (5.19) cancels the same $log l$ in the free-energy and cardinality costs. On a regular success the gap increase is at most $C_1 t + O \( log h \) lt.eq C_2 t$ for a numerical $C_2$. On a cheap success it is at most
  $ C_1 epsilon k_b - log \( \| S' \| \/ 2 \) + O \( log h \) lt.eq C_1 epsilon k_b - 0.8 k_b + O \( log h \) lt.eq - k_b \/ 2 \, $
  on choosing $epsilon$ sufficiently small numerically and then taking $d$ sufficiently large. These choices precede the cap choices; only the size-loss bound and the small-error thresholds require the subsequent choices of $A_0$ and $d$. ◻
]

=== 5.5 Evidence under the comparison law and under truth <evidence-under-the-comparison-law-and-under-truth>

At every success draw a new main label $V$ of type $A^(+)$. On a regular success also draw $N_h = ceil.l h^120 ceil.r$ fresh, independent type-$A$ clones $Z'$. They serve only the evidence calculation. These draws are made even when this very success will breach a cap and transfer the piece out of live processing. A failure causes neither a new main draw nor an evidence draw.

The comparison experiment starts with $Y$ uniform on the top interval. Spatial bits continue to observe $Y$, and all label draws use the same channels prescribed on their recorded branches. At a membership test, however, success is an independent coin with probabilities $delta \, 1 - delta$ computed from the current true input law before conditioning on sampled labels. For a fixed recorded spatial and membership branch, the computed state is fixed. Its membership coin probabilities therefore contribute no $y$-dependent likelihood. Given the full past observations at a test in $p$, the comparison posterior has density on $p$ proportional to

#[#set math.equation(numbering: n => "(5.20)")
 $ exp (- sum_j A_j \( z_j - y \)) . $ <eq:thermal-reference-posterior>]

The sum includes past main labels and past evidence clones. Each $A_j prec.curly.eq A$, and their number is at most $1 + C_0 h \( 1 + N_h \)$. This statement conditions on the observed branch, not on the actual truth-membership event within the reference law.

Set $s_d = d h^(- 100)$. A past is admissible when some $y_0 in overline(p)$ satisfies

$ sum_j A_j \( z_j - y_0 \) lt.eq s_d . $

This is an observable condition: the continuous function in the display attains its infimum on the compact interval closure.

#thm([Proposition 5.4.])[
  (Regular evidence).  #emph[Consider any finite procedure starting with the type-zero label, making at most $floor.l C_0 h floor.r$ successful main additions and using the updates of 13 with its hypotheses at every attempt. Require all discrete choices to depend only on spatial prefixes and input memberships, with independent label errors given $Y$ and its parameter path, and include all the success draws specified above. Then an admissible regular attempt has the following conditional reference bound, given its past and its success coin. The observable event 
#[#set math.equation(numbering: n => "(5.21)")
 $ upright("for some fresh clone ") Z' \, #h(2em) A \( Z' - Z \) lt.eq 4 s_d \,\
lr(|sum_x nu \( x \) v_x \( Z' \) chi_(g x) \( V \)|) gt.eq beta \/ 4 . $ <eq:source-10>]

 has probability at most $e^(- t \/ 8)$, where $Z$ is the old main label. Under the true input law, all attempted pasts are admissible and (5.21) occurs at every regular success simultaneously, except on a set of probability $o \( h^(- 20) \)$. This includes the label draws at a final success breaching a cap. The bounds are uniform in depth, cutoff, and the deterministic choices made at the states.]
] <prop:thermal-evidence>

#proof[
  First bound the posterior normalizing integral from below at an admissible past. The phase triangle inequality gives $A_j \( v + u \) lt.eq 2 A_j \( v \) + 2 A_j \( u \)$, and the observation count gives $2 sum_j A_j prec.curly.eq h^130 A$ for sufficiently large $d$. Thus
  #[#set math.equation(numbering: n => "(5.22)")
   $ integral_p exp (- sum_j A_j \( z_j - y \)) d y gt.eq c exp \( - 2 s_d - F \( tilde(A) \) \) . $ <eq:thermal-posterior-denominator>]
  Indeed in one direction from $y_0$ a segment of length $\| p \| \/ 2$ remains inside $overline(p)$. By symmetry and the spatial variance estimate, the density $K_(tilde(A)) \( y - y_0 \)$ assigns this segment at least a numerical positive mass if $C_s$ is large enough: the circular second-moment bound puts a fixed positive mass within distance $\| p \| \/ 2$ of zero, and symmetry gives half of that mass in either direction. On this segment the integrand is at least $e^(- 2 s_d) exp \( - h^130 A \( y - y_0 \) \)$, which is at least $e^(- 2 s_d) exp \( - tilde(A) \( y - y_0 \) \)$.
  Fix one fresh clone and integrate over its value $z'$ in the consistency set ${ z' : A \( z' - Z \) lt.eq 4 s_d }$. Also use the variable $theta^(+) = V - Y$, whose independent conditional density is $K_(A^(+))$. At fixed $z' \, theta^(+)$ expand the $2 T$-moment of
  $ lr(|sum_x nu \( x \) v_x \( z' \) chi_(g x) \( Y + theta^(+) \)|) $
  in the posterior integral. Its weights include the extra clone factor $e^(- A \( z' - y \))$ and the spatial majorant used above. The centered summed form is
  $ P = sum_j A_j + A + S_p \, #h(2em) A + S_p prec.curly.eq P prec.curly.eq tilde(A) . $
  The upper comparison follows from the observation count and large $d$. By (5.2), the $y$ integral before the clone normalization and the posterior division is at most
  $ C e^(- F \( A + S_p \)) e^(- E_T \( nu \)) lt.eq C e^(- F \( A + S_p \)) e^(- t \/ 4) . $
  Here the phase factors involving $theta^(+)$ have modulus one, and $\| v_x \( z' \) \| lt.eq 1$, so the same coefficientwise moment bound applies. The consistency set has length at most $e^(4 s_d - F \( A \))$, since $e^(- A) gt.eq e^(- 4 s_d)$ there. This cancels the clone normalization $e^(F \( A \))$ up to $e^(4 s_d)$. The density in $theta^(+)$ integrates to one. Dividing by (5.22), applying the moment tail bound at $beta \/ 4$, and summing over the clones gives
  $ C N_h exp (6 s_d + F \( tilde(A) \) - F \( A + S_p \) + 2 T log \( 4 \/ beta \) - t \/ 4) lt.eq e^(- t \/ 8) . $
  Indeed (5.7), $t gt.eq epsilon k_b$, and $2 T log \( 4 \/ beta \) = o \( t \)$ absorb every positive term. The reference success coin is independent of $Y$ given the past and so has not altered its posterior.
  For the true-law assertion, condition on $Y$ and its entire discrete parameter path. At a regular success the conditional mean in (5.18) has modulus at least $beta \/ 2$. The empirical mean of the $N_h$ clone polynomials evaluated at $Y$ approximates it to error $beta \/ 16$ except with probability $C \/ \( beta^2 N_h \)$, by the second-moment bound for independent bounded complex variables. Replacing $Y$ by $V$, and removing the common phase $chi_(g x_0) \( V - Y \)$, changes each of these polynomials by at most
  $ sum_x nu \( x \) \| 1 - chi_(g \( x - x_0 \)) \( V - Y \) \| . $
  Its conditional expectation is at most $sqrt(2 integral B K_(A^(+))) lt.eq C sqrt(t \/ lambda) = O \( h^(- 100) \)$ by (5.16). Markov’s inequality makes this error at most $beta \/ 16$ except with probability $C sqrt(t \/ lambda) \/ beta = o \( h^(- 30) \)$, since $beta gt.eq c h^(- 32)$. Outside these errors the clone average after replacement has modulus at least $3 beta \/ 8$, so at least one clone satisfies the large-polynomial condition in (5.21). The empirical-mean error probability is $O \( h^(- 56) \)$, also $o \( h^(- 30) \)$.
  Finally sum the own-error energies of every observation on the capped true path, each measured in its own form. Conditional independence and the input-only selection rule let us apply the energy estimate in (5.7) at each draw, including final draws. There are at most $O \( h^121 \)$ observations, each of conditional expected energy $O \( h \( d h^(- 400) + 1 \) \)$. Their total expected energy is therefore
  $ O \( d h^(- 278) + h^122 \) = o \( s_d h^(- 30) \) . $
  With exception probability $o \( h^(- 30) \)$, their total energy is at most $s_d$. This single event makes every past admissible by taking $y_0 = Y$. It also gives every consistency condition, since the old main and its clone both have type $A$ and
  $ A \( Z' - Z \) lt.eq 2 A \( Z' - Y \) + 2 A \( Z - Y \) lt.eq 4 s_d . $
  There are only $O \( h \)$ regular successes. Unioning their conditional large-polynomial failure bounds and adding the total-energy exception proves the simultaneous $o \( h^(- 20) \)$ assertion. The bound is over successes rather than over all attempts; past admissibility at all attempts followed from the single total-energy event. ◻
]

The numerical constants $C_1 \, C_2$ and the permitted small $epsilon$ have now been fixed independently of the later caps. The next section chooses those caps, then fixes $D_0 \, P_0 \, A_0$, and finally increases the threshold for $d$. The evidence clones enter only the likelihood estimate for regular charges. The main labels also enter the conditional-information bounds for the spatial budgets. The realized values of both kinds of labels do not control the spatial splitting procedure.

== 6 The finite dyadic procedure and its budgets <sec:procedure>

We seek a bound for modulated sums whose coefficients are formed from one input bit and emitted with a later output bit. The bound must be uniform in the tree depth and in the number of frequencies. We state it first; the construction in this section supplies the pieces and budgets used in its proof in 9.

#thm([Proposition 6.1.])[
  (Modulated delayed Haar estimate).  #emph[There are absolute constants $C$ and $d_0$ with the following property. Let $d gt.eq d_0$, put $h = log log d$, and let $I subset bb(R)$ be a half-open interval with $1 \/ 2 lt.eq \| I \| lt.eq 1$. Let $rho : I arrow.r \[ 0 \, oo \)$ be measurable, with $rho lt.eq e^d$ almost everywhere and 
$ m_(upright("top")) = frac(1, \| I \|) integral_I rho lt.eq 2 . $

 Give $I$ its normalized uniform probability $upright(bold(U))$. Write $cal(F)_j$ for its depth-$j$ dyadic sigma field, $p_j \( x \)$ for the depth-$j$ interval containing $x$, and $r_(j + 1)$ for the sign that is $+ 1$ on the left child and $- 1$ on the right child of each such interval. Let $J gt.eq 1$ and $Q gt.eq 0$ be integers. For $0 lt.eq j < J$, let $epsilon.alt_j : I arrow.r bb(C)$ be $cal(F)_(j + 1)$-measurable with $\| epsilon.alt_j \| lt.eq 1$, and use the same $epsilon.alt_j$ for all modulations. The bits through depth $J + 1$ are retained, so the last output sign is $r_(J + 1)$.]
  #emph[Set 
$ tau \( x \) = min #scale(x: 120%, y: 120%)[\(] { 0 lt.eq j < J : med bb(E)_(p_j \( x \)) rho > e^(4 h) } union { J } #scale(x: 120%, y: 120%)[\)] \, #h(2em) bb(E)_p v = frac(1, \| p \|) integral_p v \( y \) thin d y \, $

 and, with $chi_u \( y \) = e^(2 pi i u y)$, define 
$ cal(H)_(I \, J)^u rho \( x \) = sum_(0 lt.eq j < tau \( x \)) bb(E)_(p_j \( x \)) \[ rho \( Y \) chi_u \( Y \) r_(j + 1) \( Y \) \] thin epsilon.alt_j \( x \) r_(j + 2) \( x \) . $

 Then 
#[#set math.equation(numbering: n => "(6.1)")
 $ integral_I max_(u in bb(Z)\
\| u \| lt.eq Q) \| cal(H)_(I \, J)^u rho \( x \) \| thin frac(d x, \| I \|) lt.eq C d . $ <eq:dyadic-estimate>]

 The constants are independent of $I \, rho \, J \, Q$, and the multipliers. Consequently the same estimate holds with $sup_(u in bb(Z))$ in place of the finite maximum.]
] <prop:dyadic>

=== 6.1 Input pieces and the order of processing <input-pieces-and-the-order-of-processing>

Fix the data of 15. At an output point $x$ in a depth-$j$ interval $p$, the summand in that proposition is

#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E)_p \[ rho \( Y \) chi_u \( Y \) r_(j + 1) \( Y \) \] thin epsilon.alt_j \( x \) r_(j + 2) \( x \) \, #h(2em) u in bb(Z) . $ <eq:source-11>]

The input variable $Y$ and output point $x$ play different roles. The coefficient is known before the output bit $r_(j + 1) \( x \)$, whereas its multiplier $epsilon.alt_j \( x \)$ need only be known before $r_(j + 2) \( x \)$. The bits retained through depth $J + 1$ supply this delayed sign even for the last contributing jump. The same multipliers are used for every piece and every label coordinate.

Every piece and frequency uses the common stopping rule $tau$ of 15, defined from the original density $rho$. No processing is needed at a node where this rule has already stopped the output path. At all other nodes, the processing below is completed before the jump.

Discard the zero input. If $0 < m_(upright("top")) < 1 \/ h$, put the whole input into static handling at the top. Otherwise define the true input law

$ d upright(bold(P)) \( Y \) = frac(rho \( Y \), m_(upright("top"))) thin d upright(bold(U)) \( Y \) . $

The word “true” will always refer to this input law, or to its conditional laws, and not to uniform output sampling.

A processing state at a spatial interval $p$ consists of a subdensity $a$, its mean $m = bb(E)_p a$, and its recorded spatial and membership history. The subdensity is the restriction of $rho$ by the membership sets on that history. A zero-mass state is discarded. A live state also carries a main thermal form $A$, a count $n$ of successful main additions, and the charge

$ cal(Q) = sum_(upright("regular successes so far")) t . $

Initially $A = 0$, $n = 0$, and $cal(Q) = 0$. These three quantities carry along the entire branch and are never reset at a new epoch or plateau.

Fix constants $R_0 \, C_0 \, C_(*)$ in the order specified below. The processing rules are as follows.

+ At every incoming live state, transfer its entire current subdensity to static handling if
  $ m < e^(- d) \, #h(2em) cal(Q) > R_0 d \, #h(2em) upright("or") #h(2em) n gt.eq floor.l C_0 h floor.r . $
  This transfer ends its live processing. Its density is subsequently only restricted to spatial descendants; it is never split by another membership test.
+ The initial live piece starts an epoch. Every successful main addition starts a new epoch on its success piece unless that piece transfers immediately. Within an epoch, a plateau starts with normalization $alpha = m$ at entry. At a subsequent incoming state it ends and a new plateau starts if $m > 2 alpha$. The new normalization is the incoming mean. No new main label is drawn at such a reset.
+ At a live state that has passed the transfer and reset rules, apply the spectral test of 13 to $\( a \, p \, alpha \, A \)$, using the prospective child moments. Thus $e^(- d) lt.eq m lt.eq 2 alpha$. The tests range over all computation levels $b in \[ b_0 \/ 8 \, 1 \]$ that are powers of two; stabilization means that at each such level there is no separated high collection of size $ceil.l e^(k_b) ceil.r$. If a test requests an update, its success set $E$ is a measurable set of inputs, determined from this state. Replace the current density by the two subdensities
  $ a upright(bold(1))_E quad upright("and") quad a upright(bold(1))_(E^c) . $
  Only the success piece receives the new form $A^(+)$ and the increment of the count; a regular success also adds $t$ to $cal(Q)$. Its mean is $delta m$, where $delta$ is its conditional success probability. The failure piece, if it has positive mass, has mean $\( 1 - delta \) m$ and retains the old epoch, plateau, form, and charge. For a cheap update $delta = 1$.
+ Process both resulting pieces at the same spatial interval $p$, enforcing transfer and reset rules anew. Continue until every remaining live piece at $p$ passes all spectral tests. Then, and only then, take the spatial jump for each surviving live piece and each static piece, and proceed to its children subject to the common stop.

Static pieces also have plateaus: start with normalization equal to their mean at transfer (or at initial static entry), and restart whenever the incoming mean exceeds twice that normalization. They undergo no spectral tests or membership splits. Their estimates will use only the scalar construction.

Every test, witness, and membership set is chosen from the spatial prefix and the preceding membership outcomes. In particular, none of these choices uses a realized noisy observation or the next spatial bit. The label experiments are attached to these already specified discrete branches. Start with a type-$0$ main observation, independent of the input. Draw a fresh main observation of type $A^(+)$ on every success. On a regular success also draw the old-type evidence clones specified in 14. Make these draws even when that success immediately causes a transfer. Moving to a smaller interval, following a failure, or resetting $alpha$ does not redraw the main observation. Given the input and its discrete branch, every draw uses fresh independent error with its specified channel law.

At a jumping node the density belonging to a plateau is its final #emph[post-processing survivor]. Its prospective child densities are the restrictions of that survivor, before any processing at the children. Removed mass has instead been assigned to another plateau or to static handling. Therefore the densities of all jumping pieces at $p$ sum exactly to $rho \|_p$, and their normalized contributions, after multiplication by their respective normalizations, sum exactly to (6.2). A true input follows just one of these pieces; uniform output estimates must sum all of their starting weights.

=== 6.2 Statement of the budgets <statement-of-the-budgets>

For a live plateau $e$, write $p_e$ for its root and $alpha_e$ for its initial mean, and put $upright(bold(U))_e = upright(bold(U)) \( thin dot.op divides p_e \)$. At a final live jumping state $p$ belonging to $e$, use its post density $a$ and its fixed main channel to define

$ M_plus.minus \( z \) = frac(bb(E)_(p_plus.minus) \[ a \( Y \) K_A \( z - Y \) \], alpha_e) \, #h(2em) M = frac(M_(+) + M_(-), 2) \, #h(2em) D = frac(M_(+) - M_(-), 2) \, #h(2em) J_p = integral frac(\| D \|^2, M) thin d z . $

The piece and plateau are implicit in $J_p$; zero divided by zero is taken to be zero. Notice that $integral M = m_p \/ alpha_e lt.eq 2$, where $m_p = bb(E)_p a$, whereas $integral M_plus.minus lt.eq 4$. In particular $J_p lt.eq 2$.

#thm([Proposition 6.2.])[
  (Live budgets).  #emph[There are fixed absolute choices of the constants in the procedure and in 13 such that, for all sufficiently large $d$, the procedure is finite in every finite spatial tree and preserves the exact splitting identity above. When $1 \/ h lt.eq m_(upright("top")) lt.eq 2$, it has the following bounds, with constants independent of $J$, $I$, the input, and any frequency cutoff.]
  + #emph[Before every requested live update the count and form hypotheses of 13 hold. On every input branch, including its final success if a cap is crossed, 
$ sum_(upright("successes")) k_b + sum_(upright("successes")) t + sum_(upright("successes")) #scale(x: 120%, y: 120%)[\(] F \( A^(+) \) - F \( A + S_p \) #scale(x: 120%, y: 120%)[\)] lt.eq C d \, #h(2em) n lt.eq C h . $

 The count flag cannot cause transfer unless the charge flag has already been crossed at that success.]
  + #emph[Let $B_(upright("mem"))$ be the sum of the negative logarithms of the conditional probabilities of all observed membership outcomes along the true path through live termination. Let $X_(*) = max log^(-) m$ over its processing states, including the state at transfer or at the common stop, but excluding later static descendants. Then 
#[#set math.equation(numbering: n => "(6.3)")
 $ parallel B_(upright("mem")) parallel_(L^2 \( upright(bold(P)) \)) + parallel X_(*) parallel_(L^2 \( upright(bold(P)) \)) lt.eq C h \, $ <eq:source-12>]

 and $upright(bold(P)) \( upright("transfer") \) lt.eq C h^(- 10)$.]
  + #emph[The live plateau weights satisfy 
$ sum_(e upright(" live")) upright(bold(U)) \( p_e \) alpha_e lt.eq C h . $

 If $xi_p$ is the local average of mass removed from the survivor of one plateau at $p$, divided by its $alpha_e$, then $bb(E)_(upright(bold(U))_e) sum_p xi_p lt.eq 1$. Full removal at an exit may be included. Starting from a final jumping post state $p_0$, the corresponding future bound under uniform probability on $p_0$ is at most $m_(p_0) \/ alpha_e lt.eq 2$.]
  + #emph[The global label Fisher sum obeys 
#[#set math.equation(numbering: n => "(6.4)")
 $ sum_(upright("all live jumping pieces ") p) upright(bold(U)) \( p \) alpha_e J_p lt.eq C d . $ <eq:source-13>]

]
  + #emph[Ignore the labels and use the filtration of spatial bits and memberships. After live termination one may keep the final piece fixed and reveal any finite number of additional spatial bits, making no further membership observations. The expected sum of the spatial bit relative entropies to a fair bit is $O \( d \)$. If this spatial extension is stopped at the common density cutoff, the bound is $O \( h \)$.]
] <prop:live-budgets>

#proof[
  ==== Caps, constant order, and finite termination <caps-constant-order-and-finite-termination>
  Let $C_1$ be the numerical constant bounding a relative metric cost by $C_1 t$ in 13, and let $C_2$ be its numerical regular gap-increase constant. Choose the numerical $epsilon > 0$ there small enough for the cheap gap decrease, and take $R_0 = 1000$. Consider a prefix of successes for which the update hypotheses have been justified. The gap potential
  $ F \( A \) - log \| B_A \( r \) \| $
  starts at zero and is bounded below by an absolute constant. Here $r$ begins at $r_(upright("sep")) \/ 4$ and increases by $r_(upright("sep")) \/ \( 10 C_0 h \)$ at each addition, so $r lt.eq r_(upright("sep")) \/ 2$ under the count cap. Telescoping its regular increases and cheap decreases gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ sum_(upright("cheap")) k_b lt.eq 2 C_2 sum_(upright("regular")) t + C \, #h(2em) sum_(upright("successes")) t lt.eq \( 1 + 2 epsilon C_2 \) sum_(upright("regular")) t + C . $ <eq:06-gap-accounting>]
  In the second inequality we used $t = epsilon k_b$ on cheap successes. Regular successes also satisfy $epsilon k_b lt.eq t$. Consequently, while $cal(Q) lt.eq R_0 d$, the sum of all success $k_b$’s is at most $C \( R_0 \, epsilon \, C_2 \) d$. Since every $k_b gt.eq d \/ h$, the number of those successes is at most $C' h$. Choose $C_0 > C' + 2$. A first count breach without a charge breach would obey this same prefix bound, contradicting that choice for large $d$.
  The form cap is also inductive. If the preceding main addition occurred at $p_(*)$, the spatial and metric estimates give
  $ F \( A^(+) \) - F \( A \) lt.eq log \( R_p \/ R_(*) \) + C + C_1 t . $
  The spatial scale ratios telescope along a branch. Before a charge breach, (6.5) and the count estimate therefore give $F \( A \) lt.eq log R_(*) + C_(*) d$ for a sufficiently large fixed $C_(*)$. The initial case is $A = 0$ with $p_(*) = I$. At the next update, the flat-increment condition (5.5) is supplied by the update itself. Thus the assumptions needed to construct each successive update have been established from its predecessors.
  Fix $D_0 \, P_0$ in the compression application using these caps, then fix $A_0$ sufficiently large for the cardinality loss, and finally take $d$ sufficiently large for all required asymptotic inequalities. The constants $C_1 \, C_2$ and the choice of $epsilon$ precede the caps; their numerical nature is what permits this order. A regular success that first crosses the charge cap adds at most $D_0 d$ and is followed immediately by transfer. Hence that final overshoot only changes the absolute constants in the claimed path budgets. No subsequent update uses a form cap for this terminal form. The energy estimate in (5.7) remains valid for the labels drawn at that success, as it uses the flat-increment and count bounds. This proves all the deterministic budget assertions.
  At a fixed spatial node, the number of successes along any recurrence path is bounded by the count cap. Between successes, every failure multiplies $m$ by at most $1 - c \( b_0 \/ 8 \)^2$. Since $m lt.eq e^d$, only finitely many consecutive failures are possible before $m < e^(- d)$. There is a uniform finite bound, depending on $d$ but not the node, on the length of this local binary recursion. Its branching is finite; induction over the finite spatial depth proves termination of the entire procedure. Integer frequencies and finite offending collections can be chosen in a fixed enumeration. Polarization uses measurable bounded signs of the moment functions, and all membership probabilities are computed from their channel laws. Thus all resulting input sets are measurable. No joint choice over different dyadic grids is required.
  ==== The spatial likelihood and membership costs <the-spatial-likelihood-and-membership-costs>
  At a positive-mass discrete state with density $a$ on $p$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ upright(bold(P)) \( upright("state") \) = frac(upright(bold(U)) \( p \) m, m_(upright("top"))) \, #h(2em) cal(L) \( Y divides upright("state") \) = a / m thin cal(L) \( upright(bold(U)) divides p \) . $ <eq:06-state-law>]
  This follows directly by restricting the initial density to the recorded spatial interval and membership sets. Define, at each such state,
  $ L_(upright("sp")) = log \( m \/ m_(upright("top")) \) + B_(upright("mem")) . $
  A membership outcome with probability $q > 0$ replaces $m$ by $q m$ and increases $B_(upright("mem"))$ by $- log q$, so $L_(upright("sp"))$ is unchanged. At a spatial step its increment is $log \( 2 q \)$, where $q$ is the conditional probability of the actual child under the unlabelled true law. It follows that
  $ bb(E)_(upright(bold(P))) #h(-0.16667em) [e^(- L_(upright(s p \, n e w))) divides upright("past")] lt.eq e^(- L_(upright(s p \, o l d))) . $
  Indeed the conditional sum over positive-probability children is $sum_q q \/ \( 2 q \) lt.eq 1$; equality need not hold if a child has zero mass. Thus $e^(- L_(upright("sp")))$ is a nonnegative supermartingale starting at one. It remains so after stopping or after keeping the piece fixed and revealing further spatial bits.
  A success has surprisal at most $C \( 1 + log \( 1 \/ b \) \)$ because $delta gt.eq c b^2$; a cheap success has zero surprisal. The deterministic $k_b$ budget and
  $ 1 + log \( 1 \/ b \) lt.eq C \( h \/ d \) k_b $
  bound the total success surprisal by $C h$ on every path. Between one success and the next, let $F$ accumulate only failure surprisal. Until that stretch ends, $e^F$ is unchanged at spatial steps; at a membership test keep it multiplied by $\( 1 - delta \)^(- 1)$ on failure and send it to zero on success. The resulting process is a nonnegative supermartingale starting at one. Therefore its maximal inequality implies, conditionally on the stretch’s start,
  $ upright(bold(P)) \( F_(upright("final")) > s divides upright("start") \) lt.eq e^(- s) \, #h(2em) s gt.eq 0 . $
  Here $F_(upright("final"))$ includes the failures preceding a terminal success, even though the auxiliary process is then sent to zero. There are at most $C h + 1$ stretches. Their conditional second moments are at most $2$; pad with zero stretches and use the triangle inequality in $L^2$. This proves $parallel B_(upright("mem")) parallel_2 lt.eq C h$. The same maximal inequality applied to $e^(- L_(upright("sp")))$ bounds the $L^2$ norm of $max \( - L_(upright("sp")) \)_(+)$ by an absolute constant. Since $m_(upright("top")) gt.eq 1 \/ h$,
  $ X_(*) lt.eq log h + B_(upright("mem")) + max \( - L_(upright("sp")) \)_(+) \, $
  which proves (6.3), including the mean at transfer.
  We shall also need the expected number $N_(upright("att"))$ of regular attempts. Each has conditional success probability at least $c \( b_0 \/ 8 \)^2 gt.eq c' h^(- 32)$, whereas there are at most $C h$ successes. Summing conditional success probabilities over the finite processing tree gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ bb(E)_(upright(bold(P))) N_(upright("att")) lt.eq C h^33 . $ <eq:06-attempt-count>]
  ==== Likelihood evidence and the transfer probability <likelihood-evidence-and-the-transfer-probability>
  The small-mass flag implies $X_(*) > d$, so its probability is at most $C h^2 \/ d^2 = o \( h^(- 10) \)$. The count flag is already accounted for by the charge flag. To control the latter, attach all the main and evidence observations specified above. Compare the true experiment with a reference law $upright(bold(Q))$ in which the prior for $Y$ is $upright(bold(U))$, the spatial bits and all channel draws still observe $Y$, but each membership outcome is an independent toss with the state’s prescribed probabilities $delta \, 1 - delta$. On a recorded branch those probabilities are constants in $Y$. All subsequent states and channel parameters are the same predetermined functions of its spatial and membership history as in the true experiment. One may stop any zero-true-mass branch in the reference as well.
  Let $cal(O)$ denote the terminal observations through live termination, including draws at its final success, and let $R = d upright(bold(P))_(cal(O)) \/ d upright(bold(Q))_(cal(O))$. On true histories,
  #[#set math.equation(numbering: n => "(6.8)")
   $ R lt.eq exp \( d + log h + B_(upright("mem")) \) . $ <eq:06-reference-ratio>]
  To verify this even for histories of different lengths, fix one complete discrete history and all its label values, using densities for the latter. The true likelihood integrates the same channel weights over inputs compatible with both the spatial bits and the actual membership sets, with prior density at most $e^d \/ m_(upright("top"))$. The reference integrates over all inputs compatible with the spatial bits, and its additional coin factors have product $e^(- B_(upright("mem")))$. The domain of the true integral is a subset of that reference domain. This proves (6.8) on each terminal branch separately.
  At every regular attempt whose observed past is admissible, multiply a score by the following factor, writing $E_(upright("ev"))$ for the evidence event in (5.21):
  $ frac(exp #scale(x: 120%, y: 120%)[\(] \( t \/ 16 \) upright(bold(1))_({ upright("success") } ∩ E_(upright("ev"))) #scale(x: 120%, y: 120%)[\)], 1 + e^(- t \/ 16)) \; $
  otherwise leave the score unchanged. Group the fresh observations of this test into that step. The conditional reference probability of the evidence given success is at most $e^(- t \/ 8)$ by 14. Consequently the conditional mean of the numerator is at most $1 + \( e^(t \/ 16) - 1 \) e^(- t \/ 8) lt.eq 1 + e^(- t \/ 16)$. The score $cal(S)$ is therefore a nonnegative reference supermartingale, with $bb(E)_(upright(bold(Q))) cal(S) lt.eq 1$ at termination. Change of measure gives the particularly useful bound
  #[#set math.equation(numbering: n => "(6.9)")
   $ upright(bold(P)) \( cal(S) > R e^d \) = integral_({ cal(S) > R e^d }) R thin d upright(bold(Q)) lt.eq e^(- d) bb(E)_(upright(bold(Q))) cal(S) lt.eq e^(- d) . $ <eq:06-score-transfer>]
  The simultaneous true admissibility and evidence assertion of 14 fails with probability $o \( h^(- 20) \)$ under the count cap; it includes evidence at a success that immediately transfers. Also $upright(bold(P)) \( B_(upright("mem")) > d \) lt.eq C h^2 \/ d^2$ by (6.3). Finally, the total logarithmic denominator cost in the score is at most $N_(upright("att")) e^(- c d \/ h)$. Its expectation tends to zero faster than $h^(- 10)$ by (6.7), so with that allowed exception it is at most one. Outside these exceptions and (6.9),
  $ cal(Q) / 16 - 1 lt.eq log cal(S) lt.eq log R + d lt.eq 2 d + log h + B_(upright("mem")) lt.eq 3 d + log h . $
  This excludes $cal(Q) > 1000 d$ for large $d$. It proves the stated transfer probability. The score and evidence draws have only served to estimate this probability; they never select a piece or an update.
  ==== The sum of live plateau weights <the-sum-of-live-plateau-weights>
  At a plateau’s root its mean is $alpha_e$, so (6.6) gives
  $ sum_(e upright(" live")) upright(bold(U)) \( p_e \) alpha_e = m_(upright("top")) thin bb(E)_(upright(bold(P))) \[ upright("number of live plateau starts") \] . $
  Epoch starts number at most $C h + 1$ on each path. It remains to bound upward resets without multiplying that bound by another $h$.
  Consider one epoch, with start and end stopping times $sigma \, tau$ in the unlabelled filtration. Include its ending membership success in $tau$ if there is one. Write $Delta = L_(upright("sp")) \( tau \) - L_(upright("sp")) \( sigma \)$, and let $N$ be its number of upward resets. At its $j$th reset time $rho_j$,
  $ L_(upright("sp")) \( rho_j \) gt.eq L_(upright("sp")) \( sigma \) + j log 2 : $
  the normalizations have more than doubled at each reset and the membership surprisal is nondecreasing. For any fixed $r > 0$, optional sampling of the inverse likelihood gives
  $ upright(bold(P)) #scale(x: 120%, y: 120%)[\(] L_(upright("sp")) \( tau \) < L_(upright("sp")) \( rho_j \) - r divides cal(F)_(rho_j)^(upright("disc")) #scale(x: 120%, y: 120%)[\)] lt.eq e^(- r) \, #h(2em) bb(E) \[ \( - Delta \)_(+) divides cal(F)_sigma^(upright("disc")) \] lt.eq 1 . $
  Here $cal(F)^(upright("disc"))$ denotes the spatial and membership history, not the uniform-output filtration used earlier. The second bound follows by integrating the corresponding exponential tail. Every reset not in the exceptional event in the first bound has $j log 2 lt.eq Delta + r$. Summing reset indicators and then conditioning at the epoch start yields
  $ \( 1 - e^(- r) \) bb(E) \[ N divides cal(F)_sigma^(upright("disc")) \] lt.eq frac(bb(E) \[ \( Delta + r \)_(+) divides cal(F)_sigma^(upright("disc")) \], log 2) lt.eq frac(bb(E) \[ Delta divides cal(F)_sigma^(upright("disc")) \] + r + 1, log 2) . $
  Sum this inequality over epochs, weighting by the probability that each epoch starts, and set $r = 2$. From one epoch’s end to the next epoch’s start $L_(upright("sp"))$ does not change, because only a membership step separates them. Thus all $Delta$ terms telescope to the terminal $L_(upright("sp"))$. At termination,
  $ m lt.eq 2 e^(4 h) \, #h(2em) L_(upright("sp")) lt.eq 4 h + log 2 + log h + B_(upright("mem")) . $
  The factor two allows the last spatial step that first crosses the common cutoff; membership restrictions cannot increase the mean. The expected total number of resets is therefore $O \( h \)$ by (6.3). Since $m_(upright("top")) lt.eq 2$, this proves the plateau weight bound.
  For a fixed plateau, the portions removed from its survivor before its end are disjoint subsets of its original input mass. Multiplying each local removed mean by $upright(bold(U))_e \( p \)$ and summing counts each removed input at most once. Division by the entry mean $alpha_e$ gives $bb(E)_(upright(bold(U))_e) sum xi_p lt.eq 1$. The identical argument from a final post state $p_0$, excluding its past removals, starts with mass $m_(p_0) \/ alpha_e$. This proves the remaining assertions in part (iii).
  ==== The information cost of main labels <the-information-cost-of-main-labels>
  We first recall the finite entropy accounting used here. For any finite remaining spatial bit string, track its conditional relative entropy to uniform future bits. Revealing the next bit consumes, in conditional expectation, precisely that bit’s relative entropy to fair, by the chain rule. An intervening observation increases the expected deficit by its conditional information about the remaining string, at most its conditional information about $Y$. The remaining deficit is nonnegative, so the same inequality holds when the process is stopped. The initial deficit is at most
  $ D \( upright(bold(P)) parallel upright(bold(U)) \) = bb(E)_(upright(bold(P))) log \( rho \/ m_(upright("top")) \) lt.eq d + log h . $
  For a membership bit its information cost is at most its conditional entropy. Averaging and removing all observed-label conditioning only increases this entropy, so the total membership cost is at most $bb(E) B_(upright("mem")) = O \( h \)$.
  For the main-label filtration we retain all main observations, but not the evidence clones. The initial type-$0$ observation has zero information. At a success at $p$, let $Z$ be the old main observation and $V$ the new observation of type $A^(+)$. Given the full main-observation history through that success, compare the conditional channel of $V$ with the probability density
  $ Q_Z \( v \) = frac(exp \[ - A \( v - Z \) - S_p \( v - c_p \) \], integral exp \[ - A \( w - Z \) - S_p \( w - c_p \) \] thin d w) \, #h(2em) c_p = "center" \( p \) . $
  For every conditional prior on $Y$, its information about $V$ is bounded above by the expected relative entropy of the channel to any fixed comparison density. The centered envelope bounds the logarithm of the denominator above by $- F \( A + S_p \)$. Expanding that relative entropy and dropping the nonpositive new-form energy gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ upright(I) \( Y \; V divides upright("history through success") \) lt.eq  & F \( A^(+) \) - F \( A + S_p \)\
 & + bb(E) \[ A \( V - Z \) + S_p \( V - c_p \) divides upright("history through success") \] . $ <eq:06-channel-information>]
  The notation denotes the usual averaged conditional-information bound; it may first be read for each fixed value of the history.
  Now average this inequality over the main-observation histories at the fixed discrete success state. Conditional on $Y$ and that discrete state, the old and new errors still have their prescribed independent laws, because every membership decision is input-only. The phase triangle inequality and form monotonicity imply
  $ bb(E) A \( V - Z \) lt.eq 2 integral A K_(A^(+)) + 2 integral A K_A lt.eq 4 integral A K_A lt.eq C h \( d h^(- 400) + 1 \) . $
  This averaging step is essential: conditioning on an observed old label alone would not give its unconditional error law. Also $Y in p$ and $A^(+)$ contains $S_p$, so
  $ bb(E) S_p \( V - c_p \) lt.eq 2 bb(E) S_p \( V - Y \) + 2 S_p \( Y - c_p \) lt.eq C . $
  Multiply each such estimate by the true probability of its success state and sum. Those probabilities sum to the expected number of successes, at most $C h$. Their total old-error energy is therefore
  $ O #scale(x: 120%, y: 120%)[\(] h^2 \( d h^(- 400) + 1 \) #scale(x: 120%, y: 120%)[\)] = o \( d \) \, $
  and their spatial energy is $O \( h \)$. The relative metric terms in (6.10) sum to $O \( d \)$ on every path by part (i). Thus all incremental main-channel informations together cost $O \( d \)$, including a terminal cap-crossing success.
  ==== The Fisher sum and the unlabelled deficits <the-fisher-sum-and-the-unlabelled-deficits>
  At a final live state $p$, the conditional density of the current main label, ignoring the older labels, is $alpha_e M \/ m_p$. Given this label, the next spatial bit has bias $D \/ M$. Hence its expected squared bias at this state is
  $ alpha_e / m_p integral frac(\| D \|^2, M) = alpha_e / m_p J_p . $
  Multiplication by the state’s probability in (6.6) gives exactly $upright(bold(U)) \( p \) alpha_e J_p \/ m_(upright("top"))$. Conditioning also on all older main labels can only increase the average squared conditional bias, by conditional Jensen. For a binary law of bias $b$, its relative entropy to a fair bit is at least $b^2 \/ 2$. The finite entropy accounting just proved therefore bounds the sum of these weighted $J_p$’s by a constant times $m_(upright("top")) \( d + log h + bb(E) B_(upright("mem")) + O \( d \) \) lt.eq C d$. This proves (6.4) with no lower bound on the surviving mass needed in this conversion.
  Finally ignore all labels. The conditional expected increment of $L_(upright("sp"))$ at a spatial bit is exactly its relative entropy to fair, while memberships leave $L_(upright("sp"))$ unchanged. Starting from $L_(upright("sp")) = 0$, the expected sum of bit deficits equals its expected terminal value. On any finite spatial extension with the last piece fixed, $m lt.eq e^d$, so
  $ L_(upright(s p \, f i n a l)) lt.eq d + log h + B_(upright("mem")) . $
  If that extension stops at the common density cutoff, instead $m lt.eq 2 e^(4 h)$ and $L_(upright(s p \, f i n a l)) lt.eq 4 h + log 2 + log h + B_(upright("mem"))$. Taking expectations and using (6.3) gives respectively $O \( d \)$ and $O \( h \)$. This completes the proof. ◻
]

== 7 Capture, edge charges, and snapshots <sec:capture>

The frequency lists in this section serve two different purposes. A cumulative list gives a deterministic approximation by signed sums. At selected spatial prefixes we compress the relevant signed sums into a smaller list of representatives. The first list controls how long approximation can fail; only the smaller lists will enter the probability estimates of 8. All constructions take place in the finite procedure of 6, uniformly in its depth and in any frequency cutoff.

=== 7.1 The two laws on a fixed plateau <the-two-laws-on-a-fixed-plateau>

For static pieces, start a plateau at entry to static handling and restart whenever the incoming mean exceeds twice its current normalization. There are no membership tests on these plateaus. They obey the same common stopping rule as live pieces. Discard zero pieces.

Fix a live or static plateau $e$, with root $p_e$ and normalization $alpha = alpha_e > 0$. Under $upright(bold(U))_e$, spatial uniform probability on $p_e$, follow only this plateau’s surviving density, through its failures, until its exit or the common stop. Its jumps on an output path occur at consecutive depths. At a jumping node $p$, write $a$ for the final #emph[post] density, after all removals there, and $m_p = bb(E)_p a$. The two prospective child measures use this same density restricted to the children, #emph[before] any processing in a child. Thus

#[#set math.equation(numbering: n => "(7.1)")
 $ m_p \/ alpha lt.eq 2 \, #h(2em) bb(E)_(p') a \/ alpha lt.eq 4 quad \( p' upright(" a child of ") p \) . $ <eq:07-mass-bounds>]

Let $xi_p$ be the mass removed at $p$, measured as its local spatial average divided by $alpha$. Full removal at an exit can be included. The removed input sets are disjoint, so

#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E)_(upright(bold(U))_e) sum_p xi_p lt.eq 1 \, #h(2em) bb(E)_(upright(bold(U))_(p_0)) sum_(p upright(" after the post state ") p_0) xi_p lt.eq m_(p_0) \/ alpha lt.eq 2 . $ <eq:07-kill-bounds>]

The second sum excludes removals already made at $p_0$. Here and below a sum along a path includes only states of the specified plateau. Put

$ d_1 = d quad upright("on a live plateau") \, #h(2em) d_1 = d + 2 + log^(-) alpha quad upright("on a static plateau") . $

For comparison, let $upright(bold(P))_e$ be the input experiment starting with the entry piece normalized to probability on $p_e$. It observes the spatial bits of its input $Y$ and its actual memberships; hence it can leave the plateau on a success. It may subsequently reveal more spatial bits, with no further observations, when a finite extension is useful. A final jumping post state has probability

#[#set math.equation(numbering: n => "(7.3)")
 $ upright(bold(P))_e \( upright("post state at ") p \) = upright(bold(U))_e \( p \) m_p / alpha . $ <eq:07-state-conversion>]

Conditional on that state, the input density is $a \/ m_p$ relative to uniform on $p$. If the experiment instead begins at a jumping post state $p_0$, the corresponding probability of a later post state $p subset.eq p_0$ is $upright(bold(U))_(p_0) \( p \) m_p \/ m_(p_0)$. These identities follow directly because each survivor is the entry density restricted by its spatial prefix and membership events.

The uniform output law does not condition on a random input membership. At each reached output prefix, the survivor and all removals are already determined functions. Both prospective children can therefore be examined before the next fair output bit. For a live plateau the side information will be its fixed main label $Z$, with conditional density $K_A \( z - Y \)$ given $Y$. The discrete decisions do not inspect its realized value. For a scalar construction there is no side information.

#thm([Lemma 7.1.])[
  (Local entropy and Fisher budgets).  #emph[On the plateau just described, the expected sum of spatial bit relative entropies to a fair bit is $O \( d_1 \)$, with or without the fixed side label. This includes every finite extension after exit. If finite-valued observations are made at predictable states and their total conditional entropy cost has expectation at most $B$, the bound becomes $C d_1 + B$.]
  #emph[Let $M$ be the normalized joint post mass measure of the side information and the finite observations so far, and let $D_(upright("jump"))$ be the half-difference of its prospective child measures. Then 
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E)_(upright(bold(U))_e) sum_p integral frac(\| D_(upright("jump")) \|^2, M) lt.eq C \( d_1 + B \) . $ <eq:07-local-fisher>]

 For a forward estimate from a live jumping post state $p_0$, restart the input experiment with its post density, retaining the fixed main label when present but discarding all earlier auxiliary observations. The same bounds then hold with $d_1 = d$, with $B$ charging the auxiliary observations made in this restarted experiment, and with an extra factor $m_(p_0) \/ alpha lt.eq 2$ in the mass conversion. Already completed removals are excluded. In particular the future main-label Fisher sum has conditional expectation at most $C d$. If earlier auxiliary information $W$ is retained instead, its conditional information $upright(I) \( Y \; W divides Z \)$ under the restarted input law must also be added to the initial budget; omit $Z$ when there is no side label. All quotients are zero at zero mass; for measures, densities to a common dominating measure are understood.]
] <lemma:07-local-budget>

#proof[
  The initial density deficit relative to spatial uniform is at most $d - log alpha lt.eq C d_1$. On a live plateau with jumps, $alpha gt.eq e^(- d)$. To pay for its fixed label, let $p_(*)$ be the interval of the last main addition and $c_(*)$ its center. Compare its channel with the fixed density $K_(S_(p_(*))) \( z - c_(*) \)$. Writing $Z = Y + theta$ gives
  $ upright(I) \( Y \; Z \) & lt.eq bb(E)_Y D #scale(x: 120%, y: 120%)[\(] K_A \( z - Y \) thin d z thin parallel thin K_(S_(p_(*))) \( z - c_(*) \) thin d z #scale(x: 120%, y: 120%)[\)]\
 & = F \( A \) - F \( S_(p_(*)) \) - bb(E) A \( theta \) + bb(E) S_(p_(*)) \( Y + theta - c_(*) \)\
 & lt.eq F \( A \) - log R_(p_(*)) + C lt.eq C d . $
  Indeed $p_e subset.eq p_(*)$, the channel includes $S_(p_(*))$, and the spatial variance and form monotonicity in 5 bound the last energy by a constant: use the phase triangle inequality and $\| Y - c_(*) \| lt.eq \| p_(*) \| \/ 2$. The negative energy can be dropped. The initial dummy channel has zero information. This estimate holds for every input law supported on $p_e$, so also for the post law at a later live jumping state.
  Within one live plateau a true path has at most one success, which is terminal for that plateau. Its success probability at a test is at least $c b_0^2$, so its success surprisal is $O \( 1 + log h \)$. The accumulated failure surprisal has an exponential tail by the failure-stretch supermartingale used in 6. Thus the expected total membership entropy cost is $O \( 1 + log h \)$. Static plateaus have no such cost. Forward from a live post state, $m_p gt.eq e^(- d)$, so the initial density deficit is again at most $2 d$, and the same membership argument applies. This forward argument begins without earlier auxiliary observations. Retaining such information $W$ instead increases the initial information term from $upright(I) \( Y \; Z \)$ to $upright(I) \( Y \; Z \, W \) = upright(I) \( Y \; Z \) + upright(I) \( Y \; W divides Z \)$.
  For completeness, apply the entropy chain rule to any finite remaining spatial bit string. Its expected deficit relative to the uniform string starts below the density deficit, plus the information of any label already observed. Revealing a bit consumes its conditional deficit relative to a fair bit. An additional observation increases the expected remaining deficit by its conditional information about the remaining string, at most its conditional Shannon entropy if finite-valued. The remaining deficit is nonnegative at stopping. Membership entropy can be bounded before conditioning on side and auxiliary observations, using the discrete state history that prescribes the tests. This proves the first assertion, including finite extensions.
  At a post state $p$, the joint observations have conditional density $\( alpha \/ m_p \) M$ under truth and the next bit bias is $D_(upright("jump")) \/ M$. Their averaged squared bias is therefore
  $ alpha / m_p integral frac(\| D_(upright("jump")) \|^2, M) . $
  Observing further past information only increases the mean squared conditional bias, by conditional Jensen. For a bit with bias $theta$, its relative entropy to fair is at least $theta^2 \/ 2$. Multiply by (7.3) and sum: the factors $m_p \/ alpha$ and $alpha \/ m_p$ cancel. This proves (7.4) without any lower bound on surviving mass. Starting at $p_0$ instead leaves the factor $m_(p_0) \/ alpha lt.eq 2$, as asserted. ◻
]

=== 7.2 The capture statement <the-capture-statement>

There are two separate constructions at each allowed dyadic level $b$. For the #emph[main] criterion, used on live plateaus for $b_0 lt.eq b lt.eq 1$, set $kappa = 2$ and say that $u$ is high if $max_(p') G_(p')^u gt.eq b^2$, using the prospective labeled child moments. For the #emph[scalar] criterion, set $kappa = 1$ and say that $u$ is high if $max_(p') \| f_(p')^u \| gt.eq b$, where $f_(p')^u = bb(E)_(p') \[ a chi_u \] \/ alpha$ has no label. Scalar levels are $0 < b lt.eq b_0$ on live plateaus and $0 < b lt.eq 1$ on static plateaus. In particular the main and scalar constructions at $b_0$ are distinct.

Set

#[#set math.equation(numbering: n => "(7.5)")
 $ l_b = ⌈20 log_2 frac(d_1 + 2, b)⌉ \, quad delta_p = 2^(- l_b) \| p \| \, quad e_(p \, b) = frac(bb(E)_p \[ a upright(bold(1))_(upright("edge") \( p \, b \)) \], alpha) \, $ <eq:07-edge-definition>]

where $upright("edge") \( p \, b \)$ consists of points inside $p$ within $4 delta_p$ of an endpoint or the midpoint. The jump is #emph[bad] for this criterion and level if $e_(p \, b) gt.eq c b^kappa$, for a sufficiently small fixed positive $c$. Everything in this definition is known at the post state before the next output bit.

#thm([Proposition 7.2.])[
  (Capture on a plateau).  #emph[In the finite procedure, for every plateau, allowed level, and criterion above, there is a cumulative finite list $D$ of integers, initially empty, whose appends are prescribed at jumping post states, such that, after the appends at $p$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ u upright(" high and the jump not bad") quad arrow.r.double quad \| u - v \| \| p \| lt.eq "poly" \( 1 + \| D \| \, d_1 \, 1 \/ b \) quad upright("for some ") v in \[ D \] \,\
= {sum_(n in D) eta_n n : eta_n in { 0 \, 1 \, - 1 }} \, #h(2em) bb(E)_(upright(bold(U))_e) \| D \|_(upright("final")) lt.eq C d_1 b^(- C) . $ <eq:source-14>]

 The construction is independent of the caps used below.]
  #emph[The bad-edge charge at $p$ and level $b$ is $e_(p \, b) upright(bold(1))_({ p upright(" bad at level ") b })$. Its global live sum, with weights $upright(bold(U)) \( p \) alpha_e$, is $O \( d \)$ when one scalar level is selected predictably at each piece, and $O \( "poly" \( h \) \( h + log d \) \)$ when all main levels are summed. The local one-scalar-level charge is $O \( d_1 \)$ under $upright(bold(U))_e$. Forward from a live post state the conditional expected number of bad jumps at a fixed main level is at most $d "poly" \( h \)$.]
  #emph[For each deterministic dyadic $D_max gt.eq 1$, the scheme stopped when $\| D \| > D_max$ admits snapshots with expected number $"poly" \( D_max \, d_1 \, 1 \/ b \)$. A snapshot at level $b$ stores at most $ceil.l e^(k_(b \/ 2)) ceil.r$ main representatives, or $exp \( C \( d_1 + log \( 1 \/ b \) \) \)$ scalar representatives. Each birth and its list are determined by the spatial prefix before its birth jump.]
  #emph[At a jump $p$, call a high integer $u$ activated when some $v in \[ D \]$ satisfies $\| u - v \| \| p \| lt.eq sigma$ in the main case, or $\| u - v \| \| p \| lt.eq c_8 b^4$ in the scalar case, for a sufficiently small fixed $c_8 > 0$. At activation its chosen representative $s$ has, for the remainder of that plateau, a fixed decomposition 
$ u = s + n + a' \, quad Delta_A \( n \) lt.eq r_(upright("sep")) \, quad \| a' \| \| p_(upright("act")) \| lt.eq C sigma \, & upright("main") \,\
u = s + a' \, quad \| a' \| \| p_(upright("act")) \| lt.eq c_1 b^4 \, & upright("scalar") \, $

 where $p_(upright("act"))$ is the activation node and $c_1$ can be made a sufficiently small absolute constant. Before first activation, all non-bad high jumps for this $u$ lie in a single block of at most 
$ H_b = C log \( C D_max d_1 \/ b \) + C log \( 1 \/ sigma \) $

 consecutive depths, as long as the cap is not breached. The construction does not use sampled side or auxiliary values on an output path.]
] <prop:capture>

We prove the assertions in turn. The intermediate lemmas also specify the conditioning needed for their later use.

=== 7.3 Broad capture by trimmed masks and polynomial products <broad-capture-by-trimmed-masks-and-polynomial-products>

Suppose $u$ is high at a jumping post piece. Polarize on one high child: there is a measurable complex $v \( z \)$ with $\| v \( z \) \| lt.eq 1$ (a constant in the scalar case) such that the normalized real bias

#[#set math.equation(numbering: n => "(7.7)")
 $ "Re" 1 / alpha bb(E)_p \[ a upright(bold(1))_(p') \( Y \) v \( Z \) chi_u \( Y \) \] gt.eq b^kappa \/ 2 . $ <eq:07-polarized-bias>]

For the main criterion, $\| f_(p')^u \| lt.eq M_(p')$ implies $integral \| f_(p')^u \| gt.eq G_(p')^u$; choosing its pointwise conjugate phase proves the assertion. In particular every append state below satisfies $m_p \/ alpha gt.eq b^kappa \/ 2$.

We first replace the child indicator by a trigonometric polynomial. Write $n = \| D \|$ at this stage. Trim a distance $delta_p$ from both ends of $p'$, and convolve its indicator on the unit circle with the positive normalized kernel proportional to

$ (frac(sin \( pi N x \), N sin \( pi x \)))^(2 s) \, #h(2em) N = ⌈C 2^(l_b) \/ \| p \|⌉ \, #h(2em) s = ⌈C \( 1 + n + log \( 1 \/ b \) \)⌉ . $

Its continuous values at integers are understood. The result $P_p$ is a real trigonometric polynomial, $0 lt.eq P_p lt.eq 1$, of degree at most $s N$. The unnormalized kernel integral is at least $c \/ \( N sqrt(s) \)$: on circle distance at most $c \/ \( N sqrt(s) \)$ from zero, the ratio has $2 s$-th power bounded below by a positive numerical constant. The bound $\| sin pi x \| gt.eq 2 "dist" \( x \, bb(Z) \)$ gives its unnormalized tail outside distance $delta_p$ at most $C e^(- c' s) \/ N$, after choosing the constant in $N$ large. Consequently the normalized tail is at most $C sqrt(s) e^(- c' s)$. Outside the edge inside $p$, the mask approximates $upright(bold(1))_(p')$ uniformly with this error. Integrating the convolution in the other order also gives

#[#set math.equation(numbering: n => "(7.8)")
 $ deg P_p lt.eq frac(C 2^(l_b) \( 1 + n + log \( 1 \/ b \) \), \| p \|) \, #h(2em) integral_(bb(T) \\ p) P_p lt.eq \| p \| exp \[ - C' \( 1 + n + log \( 1 \/ b \) \) \] . $ <eq:07-mask-bounds>]

Here $C'$ can be chosen as large as needed by increasing the fixed kernel constants. The edge error in (7.7) is at most $e_(p \, b)$, and the remaining error is at most $2 C sqrt(s) e^(- c' s)$. Thus, at a non-bad jump, the replacement retains bias $gt.eq c_2 b^kappa$. This argument also covers intervals that cross the circle coordinate boundary.

For each fixed side value $z$, keep a full-circle polynomial product $Q_z$, initially one. Its restriction to the current $p$, normalized by its integral there, is the reference probability density for $Y$ conditional on that side value. After $n$ appends its factors lie between $1 \/ 2$ and $2$, so

$ 2^(- n) lt.eq Q_z lt.eq 2^n \, #h(2em) integral_p Q_z gt.eq 2^(- n) \| p \| . $

If a non-bad high $u$ is outside $\[ D \]$ enlarged by the sum of all previous mask bandwidths and the prospective bandwidth in (7.8), append it and multiply $Q_z$ by

#[#set math.equation(numbering: n => "(7.9)")
 $ 1 + eta b^kappa "Re" \[ v \( z \) chi_u P_p \] \, $ <eq:07-product-factor>]

where $eta > 0$ is a sufficiently small fixed constant. The old product has Fourier support inside $\[ D \]$ enlarged by its accumulated mask bandwidths. Thus the full-circle integral of $Q_z chi_u P_p$ vanishes. Restriction to $p$ changes its normalized integral by at most

$ frac(2^n integral_(bb(T) \\ p) P_p, 2^(- n) \| p \|) lt.eq 4^n exp \[ - C' \( 1 + n + log \( 1 \/ b \) \) \] . $

Choose $C'$ so this is a suitably small multiple of $b^kappa$, uniformly in $n$ and $z$.

The relevant entropy is the true average, over the current conditional side law, of the relative entropy of $Y$ conditional on that side value to this reference. Its drop at an append equals the true expectation of the logarithm of (7.9), minus the average logarithm of the reference expectation of that factor. By (7.1), the retained normalized bias becomes at least $c_2 b^kappa \/ 2$ when divided by $m_p \/ alpha$ to obtain a probability-law bias. The inequality $log \( 1 + x \) gt.eq x - C x^2$ for $\| x \| lt.eq 1 \/ 2$ therefore bounds the first logarithm below by $c eta b^(2 kappa)$, after fixing $eta$ small. The leakage estimate bounds the normalization logarithm by a smaller multiple of the same quantity. Every append hence consumes at least $c_3 b^(2 kappa)$ of this conditional entropy.

Here is the budget across states, including the change in the side law. Denote a discrete state history by $H$, and the current reference by $Q_(H \, z)$, restricted and normalized on its interval. Set

$ cal(B) \( H \) = bb(E)_(Z divides H) D \( cal(L) \( Y divides H \, Z \) parallel Q_(H \, Z) \) . $

At a spatial bit $X$, restrict the reference to the selected child. The relative entropy chain rule gives exactly

$ sum_x bb(P) \( x divides H \) cal(B) \( H \, x \) = cal(B) \( H \) - bb(E)_(Z divides H) D \( cal(L) \( X divides H \, Z \) parallel cal(L)_(Q_(H \, Z)) \( X \) \) lt.eq cal(B) \( H \) . $

At a membership observation $C$, keep the old reference on both outcomes. Its average entropy increment is $upright(I) \( Y \; C divides H \, Z \) lt.eq upright(H) \( C divides H \)$, since the current side posterior is used on each outcome. Nonnegative entropy on exited branches can be discarded. Initially the budget is $D \( cal(L) \( Y \) parallel upright(bold(U))_e \) + upright(I) \( Y \; Z \) lt.eq C d_1$; the membership costs are those in 17. Thus

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E)_(upright(bold(P))_e) \( upright("number of appends") \) lt.eq C d_1 b^(- 2 kappa) \, #h(2em) bb(E)_(upright(bold(U))_e) \| D \|_(upright("final")) lt.eq C d_1 b^(- 3 kappa) . $ <eq:07-append-budget>]

The second estimate uses (7.3) and $m_p \/ alpha gt.eq b^kappa \/ 2$ at every append. At a fixed positive-mass state the entropy is finite and drops strictly, so the append loop is finite. This finiteness propagates down every positive-probability branch of the finite processing tree.

If no further append is possible, every non-bad high $u$ is within the accumulated bandwidth of $\[ D \]$. Previous append intervals are ancestors of $p$, and previous list lengths are at most the current length. Hence that bandwidth, multiplied by $\| p \|$, is bounded by

$ C 2^(l_b) \( n + 1 \) \( n + 1 + log \( 1 \/ b \) \) . $

For example $C \( d_1 + 2 \)^20 b^(- 21) \( n + 1 \)^2$ is a permissible fixed polynomial upper bound. This proves (7.6). The signs, products, and appended frequencies are chosen from the laws at each state; no realized side value is used to decide an append.

=== 7.4 Charging thin spatial edges <charging-thin-spatial-edges>

#thm([Lemma 7.3.])[
  (Edge charges).  #emph[With the bad-jump convention (7.5), the following bounds hold.]
  + #emph[Across all live jumping pieces, the sum of $upright(bold(U)) \( p \) alpha_e e_(p \, b) upright(bold(1))_(upright("bad"))$ is at most $C d$ if a single scalar level $b$ is selected at each piece before its next output bit, without using noisy label values.]
  + #emph[The corresponding sum over all main levels and live pieces is at most $C "poly" \( h \) \( h + log d \)$.]
  + #emph[Within one plateau, the expected one-scalar-level sum under $upright(bold(U))_e$ is at most $C d_1$.]
  + #emph[From any live jumping post state, under spatial uniform conditional on that prefix, the expected number of future bad jumps of the same plateau at main level $b$ is at most $C d b^(- 2)$, and hence $d "poly" \( h \)$.]
] <lemma:07-edge-charges>

#proof[
  For (i) and (ii), fix the global unlabelled input experiment of 16, following memberships through all live epochs and freezing the terminal piece only at live termination. For (iii) and (iv), first fix one plateau and use the corresponding local input experiment of 17, freezing the terminal piece at that plateau’s exit. In each application, all windows below belong to one common finite spatial extension of this fixed experiment and use the same predictable spatial entropy sequence.
  At a final post state the conditional input edge probability is
  $ q = frac(alpha e_(p \, b), m_p) gt.eq c b^kappa \/ 2 quad upright("if the jump is bad") . $
  From this state compare the next $l = l_b$ spatial bits, starting with its jump bit, to a reference experiment with fair spatial bits. At intervening membership tests use the very same state-conditional outcome probabilities as in the true unlabelled experiment. Thus membership likelihood factors cancel. This reference can be generated by sampling each bit fairly, regardless of earlier memberships, and by tossing the stated membership coins on their recorded branches. In particular its spatial path remains uniform. Continue bits after exits or stops as needed, keeping the piece fixed and taking no new observations. Histories of zero true mass can be extended arbitrarily under the reference while leaving its bits fair.
  The edge is determined by the next $l$ bits, up to null endpoints, and its reference probability is at most $16 thin 2^(- l)$. If $L$ is the true-to-reference likelihood ratio of this segment, then
  $ bb(P)_(upright("true")) \( upright("edge") ∩ { L < 2^(l \/ 2) } divides upright("post state") \) lt.eq 16 thin 2^(- l \/ 2) lt.eq q \/ 2 . $
  The last inequality follows uniformly from the choice of $l_b$, the badness lower bound on $q$, and sufficiently large $d$. Call the starting depth #emph[marked] if the edge occurs and $log L gt.eq \( l \/ 2 \) log 2$. Conditional on a bad post state, its probability is at least $q \/ 2$.
  Let $s_j$ be the predictable relative entropy to fair of the spatial bit at depth $j$, in this unlabelled true history. If its bias is $theta_j$, then $s_j gt.eq theta_j^2 \/ 2$, whereas the positive part of its realized log likelihood increment satisfies
  $ #scale(x: 120%, y: 120%)[\[] log \( 1 plus.minus theta_j \) #scale(x: 120%, y: 120%)[\]]_(+) lt.eq \| theta_j \| lt.eq sqrt(2 s_j) . $
  Memberships contribute no log increment to $L$. On a mark, Cauchy–Schwarz on the length-$l$ window consequently yields
  #[#set math.equation(numbering: n => "(7.11)")
   $ sum_(j upright(" in its window")) s_j gt.eq c_4 l . $ <eq:07-marked-window>]
  There is at most one final jumping piece at each spatial depth along an actual input path, although membership splitting may have preceded it. For any finite family of marked starting indices, select disjoint windows whose triples cover the union, for example by successively taking a longest remaining window. The number of starting indices is no larger than a constant times the sum of the selected window lengths. By (7.11), this is at most $C sum_j s_j$, since the selected windows are disjoint. This proves the interval charging bound for variable window lengths as well as for fixed $l$.
  Globally, the unlabelled full spatial entropy budget of 16 is $O \( d \)$ when live pieces occur. Apply the interval bound with the one selected scalar level per index. The marking probability and the state law imply
  $ sum_(upright(l i v e med p i e c e s)) upright(bold(U)) \( p \) alpha_e e_(p \, b) upright(bold(1))_(upright("bad")) = m_(upright("top")) bb(E)_(upright(bold(P))) sum_(upright(l i v e med p o s t med s t a t e s)) q upright(bold(1))_(upright("bad")) lt.eq 2 m_(upright("top")) bb(E)_(upright(bold(P))) \( upright("number of marks") \) lt.eq C d . $
  Only a finite spatial extension is needed for any finite selection of windows; the bound for the full sum follows by nonnegativity. This also handles arbitrarily small selected scalar levels.
  For a fixed main level, $l_b$ is constant along the live path. Windows wholly before the common cutoff use only its $O \( h \)$ truncated unlabelled bit budget. At most $l_b$ starting indices straddle that cutoff. The truncated budget remains valid on paths that transferred earlier: keep their membership state fixed and continue their spatial sampling. Therefore the main-level weighted edge sum is $O \( h + l_b \)$. There are $O \( log h \)$ main levels and $l_b = O \( log d + log \( 1 \/ b_0 \) \)$ on them, proving (ii).
  For (iii), use $upright(bold(P))_e$ and 17, with no side label, in the same proof. The state conversion now has root mass normalization one, giving $C d_1$. Starting instead at a live post state $p_0$, the conversion leaves a factor $m_(p_0) \/ alpha lt.eq 2$, and the forward entropy budget is $C d$. Thus the expected forward sum of $e_(p \, b) upright(bold(1))_(upright("bad"))$ under $upright(bold(U))_(p_0)$ is at most $C d$. At a bad main jump $e_(p \, b) gt.eq c b^2$; dividing gives (iv). ◻
]

=== 7.5 Snapshots in fixed rounded coordinates <snapshots-in-fixed-rounded-coordinates>

Fix a deterministic dyadic cap $D_max gt.eq 1$ and stop this level’s snapshot scheme on a branch as soon as its independently constructed broad list has $\| D \| > D_max$. Use a fixed partition of the unit circle into $O \( D_max \/ b^6 \)$ arcs, rounding each $chi_n \( Y \)$, $n in D$, to a chosen point of its arc with error at most $c_5 b^6 \/ D_max$. Track the joint #emph[finite mass measure] of these rounded coordinates and the side information, normalized by $alpha$; do not renormalize it to probability. For a finite signed measure $mu$ on $Omega$, write $parallel mu parallel_(upright("var")) = \| mu \| \( Omega \)$ for its full variation norm, without a factor $1 \/ 2$.

After the broad-list step at each jumping post node, refresh the snapshot once if it is the first snapshot, if any coordinate was appended, or if some prospective child pre measure differs in total variation by more than $c_6 b^6$ from the stored #emph[post] measure of the current snapshot. The last comparison uses the same coordinates on both measures; an append itself causes replacement. On refresh store the present post measure. All these decisions inspect deterministic measures at the current prefix.

At a snapshot take a maximal separated subcollection of the elements of $\[ D \]$ high at threshold $b \/ 2$ at this node. In the main case separation means that differences avoid

$ B_A \( r_(upright("sep")) \) + { j in bb(Z) : \| j \| \| p \| lt.eq sigma } \; $

in the scalar case it means that differences have magnitude greater than $c_7 b^4 \/ \| p \|$. Take all the constants $c_5 \, c_6 \, c_7$ sufficiently small.

#thm([Lemma 7.4.])[
  (Snapshot covers and birth count).  #emph[The main and scalar snapshot lists have respectively the cardinality bounds in 18. While a snapshot is current, it covers every $v in \[ D \]$ that is high at threshold $0.9 b$ at a jumping node, with its stored separation neighborhoods measured at the snapshot’s birth interval. Moreover, if $N_(upright("snap"))$ is the number of snapshots on the capped uniform output path, then 
#[#set math.equation(numbering: n => "(7.12)")
 $ bb(E)_(upright(bold(U))_e) N_(upright("snap")) lt.eq 1 + D_max + C b^(- 6) + C b^(- 12) #scale(x: 120%, y: 120%)[\(] d_1 + D_max log \( C D_max \/ b \) #scale(x: 120%, y: 120%)[\)] . $ <eq:07-snapshot-count>]

 Every snapshot is born before its node’s next fair bit. Its stored representatives may subsequently be used on the same plateau even after replacement of that snapshot.]
] <lemma:07-snapshots>

#proof[
  At a stabilized live node, a separated high collection of size $ceil.l e^(k_(b \/ 2)) ceil.r$ would request another update. The computation levels include $b \/ 2$. Thus a maximal collection has at most this size and covers all high elements of $\[ D \]$ by the indicated symmetric neighborhoods.
  For scalar lists, Parseval applied to $a upright(bold(1))_(p')$ on each prospective child gives
  $ sum_(u in bb(Z)) \| f_(p')^u \|^2 = frac(1, alpha^2 \| p' \|^2) integral_(p') a^2 lt.eq frac(C e^d, alpha \| p \|) . $
  After rotating by the phase at a point of $p'$, its moments vary by at most $C \| u - u' \| \| p \|$. Around each separated representative take an integer neighborhood of radius $c_7 b^4 \/ \( 3 \| p \| \)$. These neighborhoods are disjoint; each contains at least $c b^4 \/ \| p \|$ integers, with the bound also true when that number is less than one. On one of the two children their moments are still at least $c b$. Summing their squared moments over the two children bounds the list length by $C e^d \/ \( alpha b^6 \) lt.eq exp \( C \( d_1 + log \( 1 \/ b \) \) \)$. For the final inequality use $alpha gt.eq e^(- d)$ on a live plateau and the definition of $d_1$ on a static plateau.
  For the transfer from one node to another, the phase of any signed sum $v in \[ D \]$ is approximated by the corresponding product of rounded phases with uniform error at most $c_5 b^6$. Scalar moments consequently change by $O \( \( c_5 + c_6 \) b^6 \)$ between a prospective child measure and the stored post measure if no refresh occurs. For the main functional, if $mu$ is a joint mass measure of input phase and side value, write $M$ for its side marginal and $f$ for its phase moment. Then
  #[#set math.equation(numbering: n => "(7.13)")
   $ integral frac(\| f \|^2, M) = sup_(\| gamma \( z \) \| lt.eq 1) integral #scale(x: 120%, y: 120%)[\(] 2 "Re" \( gamma \( z \) chi_v \) - \| gamma \( z \) \|^2 #scale(x: 120%, y: 120%)[\)] thin d mu . $ <eq:07-bounded-test>]
  The tests have absolute value at most three. Phase rounding contributes at most twice the phase error times the total mass, which is at most four; total variation contributes at most three times the distance. Hence the same $O \( \( c_5 + c_6 \) b^6 \)$ transfer applies to the main functional. A prospective child high at $0.9 b$ therefore makes the stored post law high with ample slack above $b \/ 2$. The scalar triangle inequality and the convexity of $\( M \, f \) mapsto \| f \|^2 \/ M$ imply that at least one prospective child of that stored post law is high at $b \/ 2$. Its signed sum belongs to the stored cover. If a fresh snapshot is born at the current node, use its prospective cover directly. This proves the transfer assertion in every case. ◻
]

#proof[
  Each rounded coordinate is observed only once, when appended, and costs at most $C log \( C D_max \/ b \)$ in conditional entropy. The successive coordinate spaces increase by retaining all previous coordinates. Before cap breach there are at most $D_max$ new coordinates on a path. Thus 17 gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ bb(E)_(upright(bold(U))_e) sum_p integral frac(\| D_(upright("jump")) \|^2, M) lt.eq C d_1 + C D_max log \( C D_max \/ b \) . $ <eq:07-rounded-fisher>]
  Here $M$ has the full coordinate list available at that jump. A Fisher term computed after forgetting some coordinates is smaller, by conditional Jensen. This permits comparisons in old coordinate spaces while charging all of them to (7.14).
  Start a comparison interval at each snapshot’s post state in its fixed coordinates. If its next replacement is caused by an append, or if the cap is breached, end the old comparison before that node’s jump, in the old coordinates. Intervening removals at that node can be included. If the next replacement is caused by distance with no append, include its node’s jump in the #emph[old] comparison and end at the selected child pre measure. The new snapshot nevertheless starts at that trigger node’s post measure, before this same bit. A terminal interval ends at the plateau stop. 2 records this order. Inclusion of a trigger bit is predictable, because the trigger is a test of both prospective children before either is selected.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((6, 5.1), [#box(width: 15.12cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Before $r_(j+1)$: test both prospective children against the old snapshot $M_*$.#linebreak() $M_p^ plus.minus =M_p plus.minus D_p, max_( plus.minus )\|M_p^ plus.minus -M_*\|_( upright(v) "ar")>c_6b^6$.#linebreak() The selected child is far with probability at least $1"/"2$.]]])])
  content((0, 3.25), [#box(width: 3.835cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Replace now:#linebreak()store the post measure $M_p$]]])])
  content((0, 1.6), [#box(width: 3.235cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Post state $p$ \(depth $j$\)#linebreak() $M_p$ after removals#linebreak() coefficient $c_p$ fixed]]])])
  content((4, 1.6), [#box(width: 3.235cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Selected child pre#linebreak() $M_p+r_(j+1)D_p$#linebreak() before any removals]]])])
  content((8, 1.6), [#box(width: 3.235cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Next prefix \(depth $j+1$\)#linebreak() $epsilon_j$ known#linebreak() process child if not stopped]]])])
  content((12, 1.6), [#box(width: 3.235cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Delayed output#linebreak() $c_p epsilon_j r_(j+2)$#linebreak() one bit later]]])])
  line((1.618, 1.6), (2.382, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2, 1.6), [#text(size: 9pt)[$r_(j+1)$]], anchor: "south", padding: 0.1176cm)
  line((5.618, 1.6), (6.382, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((9.618, 1.6), (10.38, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10, 1.6), [#text(size: 9pt)[$r_(j+2)$]], anchor: "south", padding: 0.1176cm)
  line((4, 0.675), (4, 0), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-1.3, 0), (4, 0), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.35, -0.65), [#box(width: 6.441cm, inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Old comparison includes $r_(j+1)$.#linebreak()Stop at the selected child pre measure.]]])])
  line((0, -1.5), (13.3, -1.5), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.6, -2.05), [#box(width: 13.44cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[New comparison starts at $M_p$ before the same bit and continues forward.#linebreak()Only the trigger bit overlaps; an append ends the old comparison before that bit.]]])])
})],
    caption: [Figure 2: A distance trigger without an append. At the post state $p$, both child pre measures are compared with the old snapshot $M_(*)$. The snapshot is replaced by $M_p$ before $r_(j + 1)$ is read. The old comparison includes that bit and ends at the actual child pre measure; the new comparison starts at $M_p$, so this bit is used twice at most. Any child removals occur afterward. The coefficient of the jump from $p$ is emitted using the delayed sign $r_(j + 2)$, even if no child jump is made. Here $c_p$ denotes that fixed normalized transform coefficient. An append instead ends the old comparison before $r_(j + 1)$, in its old coordinates. ],
  ) <fig:07-snapshot-timing>
  On one comparison interval let $k$ be each removed positive joint mass measure, expressed in its fixed coordinate space. Retain $k$ unchanged after its removal and let $K$ be the sum retained so far. Then
  $ N = M + K $
  is a positive measure martingale under the uniform output bits. At a kill, $M$ loses precisely the measure added to $K$. At a spatial bit its two values are $N plus.minus D_(upright("jump"))$, with $\| D_(upright("jump")) \| lt.eq M lt.eq N$. In particular the martingale starts from the snapshot measure $M_(*)$, and all later measures are absolutely continuous with respect to $M_(*)$: a zero coordinate set remains zero under positive child averaging and removals.
  Use generalized relative entropy for finite measures,
  $ cal(E) \( N divides M_(*) \) = integral \( n log n - n + 1 \) thin d M_(*) \, #h(2em) n = d N \/ d M_(*) . $
  At a spatial bit, writing $t = D_(upright("jump")) \/ N$, its average increment is
  $ integral N / 2 #scale(x: 120%, y: 120%)[\(] \( 1 + t \) log \( 1 + t \) + \( 1 - t \) log \( 1 - t \) #scale(x: 120%, y: 120%)[\)] lt.eq C integral frac(\| D_(upright("jump")) \|^2, N) lt.eq C integral frac(\| D_(upright("jump")) \|^2, M) . $
  The scalar ratio in this inequality is bounded on $- 1 lt.eq t lt.eq 1$, with its limit at zero understood. Kills leave $N$ unchanged. Bounded stopping in the finite-depth tree therefore bounds the expected terminal entropy by the expected Fisher sum on the comparison interval.
  At a distance trigger, one of the two prospective children differs from $M_(*)$ by more than $c_6 b^6$, so the selected child has this property with conditional probability at least one half. On that event either $parallel K parallel gt.eq c_6 b^6 \/ 2$, or $parallel N - M_(*) parallel_(upright("var")) > c_6 b^6 \/ 2$. On the complementary event $parallel K parallel < c_6 b^6 \/ 2$, the latter alternative holds, $N$ has mass at most $4 + c_6 b^6 \/ 2$, and $M_(*)$ has mass at most two. The scalar inequality
  $ frac(\( x - 1 \)^2, 1 + x) lt.eq C \( x log x - x + 1 \) \, #h(2em) x gt.eq 0 \, $
  followed by Cauchy–Schwarz gives
  $ parallel N - M_(*) parallel_(upright("var"))^2 lt.eq C #scale(x: 120%, y: 120%)[\(] N \( Omega \) + M_(*) \( Omega \) #scale(x: 120%, y: 120%)[\)] cal(E) \( N divides M_(*) \) \, $
  where $Omega$ is the fixed observation space of the comparison interval. Thus the latter event forces $cal(E) \( N divides M_(*) \) gt.eq c b^12$. Conditional on the comparison start, the probability that its next replacement is a distance trigger is at most
  #[#set math.equation(numbering: n => "(7.15)")
   $ C bb(E) [b^(- 6) sum_(upright("interval")) xi_p + b^(- 12) sum_(upright("interval")) integral frac(\| D_(upright("jump")) \|^2, M) thin mid(bar.v) thin upright("comparison start")] . $ <eq:07-trigger-charge>]
  Indeed the far-child event has at least half the trigger probability, and the preceding deterministic alternatives charge it to removals or to terminal entropy, whose expectation was just bounded.
  Sum (7.15) with the probabilities of the starts. Every jump is in at most two comparison intervals: at a distance trigger it is the final bit of the old interval and the first bit of the new one. Appends stop old comparisons before their jump. Removals likewise have bounded overlap. By (7.2), (7.14), distance triggers contribute the last two terms in (7.12). Initialization contributes at most one, and append replacements at most $D_max$. This proves the count. No coordinate is re-observed merely because a snapshot is replaced, and the conditional argument did not condition on a realized side or rounded value. ◻
]

=== 7.6 Activation and the one block of missed jumps <activation-and-the-one-block-of-missed-jumps>

#thm([Lemma 7.5.])[
  (Activation and localization before activation).  #emph[On a capped scheme, declare a high $u$ activated at a jump $p$ if there is $v in \[ D \]$ such that $\| u - v \| \| p \| lt.eq sigma$ in the main case, or $\| u - v \| \| p \| lt.eq c_8 b^4$ in the scalar case. A representative from the current snapshot then gives the fixed decompositions and bounds in 18. All non-bad high jumps before first activation lie in one block of at most $H_b$ depths as stated there.]
] <lemma:07-activation>

#proof[
  Freeze the spatial phase $chi_(u - v)$ at any point of $p$. The normalized scalar error on a prospective child is at most $C \| u - v \| \| p \|$, by its mass bound. In the main case conditional Cauchy–Schwarz gives
  $ lr(|sqrt(G_(p')^u) - sqrt(G_(p')^v)|) lt.eq (1 / alpha bb(E)_(p') \[ a \| chi_(u - v) \( Y \) - chi_(u - v) \( y_p \) \|^2 \])^(1 \/ 2) lt.eq C \| u - v \| \| p \| . $
  Thus $v$ is high at $0.9 b$, since $sigma lt.double b_0$ and the scalar prefactor is small. By 20, it is covered by a stored $s$. If that snapshot was born at $q supset.eq p$, its main cover gives $v - s = n + j$, with $Delta_A \( n \) lt.eq r_(upright("sep"))$ and $\| j \| \| q \| lt.eq sigma$. Set $a' = u - v + j$. Then $\| a' \| \| p \| lt.eq 2 sigma$. The channel $A$ is fixed throughout the plateau, so $n$ retains its metric bound. The scalar cover instead gives $\| v - s \| \| q \| lt.eq c_7 b^4$, and hence $\| \( u - v \) + \( v - s \) \| \| p \| lt.eq \( c_7 + c_8 \) b^4$. Fix this $s \, n \, a'$ at activation; all their spatial error bounds only improve on descendants.
  Now let $p_0$ be the first non-bad high jump before any activation, if one exists. By (7.6) there is a signed combination $v in \[ D \]$ at that node with
  $ \| u - v \| \| p_0 \| lt.eq P \( D_max \, d_1 \, 1 \/ b \) $
  for a fixed polynomial $P$. The same signed combination remains available as the list grows. After $r$ further depths the left side with the new interval is at most $2^(- r) P \( D_max \, d_1 \, 1 \/ b \)$. For
  $ r gt.eq C log \( C D_max d_1 \/ b \) + C log \( 1 \/ sigma \) $
  this is at most the relevant activation tolerance, $sigma$ or $c_8 b^4$. Any subsequent high jump then activates, whether or not it is bad. Hence every non-bad high jump strictly before first activation lies in the one depth block beginning at $p_0$ of the claimed length. If no such $p_0$ exists there is no missed non-bad high jump. This proves the assertion and completes 18. ◻
]

The cap has been deterministic throughout the probability estimates. In 8 the estimates will first be made simultaneous over all dyadic caps, after which a cap comparable to $1 + \| D \|_(upright("final"))$ may be selected on each path. In particular (7.10) and Jensen give

$ bb(E)_(upright(bold(U))_e) log \( C \( 1 + \| D \|_(upright("final")) \) \) lt.eq C log \( C d_1 \/ b \) \, $

so this later choice incurs a logarithmic expected cost and excludes no large-list paths.

== 8 Delayed transforms along a plateau path <sec:paths>

The representatives from 7 will be used on intervals of depths chosen while estimating an actual modulation. We therefore prove interval bounds under explicit amplitude conditions, then make the bounds simultaneous over all snapshot representatives and dyadic list caps. Scalar moments handle small amplitudes and static plateaus; moments that retain the main label handle the main levels on live plateaus.

Fix a plateau $e$, with normalization $alpha = alpha_e$, and use uniform probability $upright(bold(U))_e$ on its root. Write $cal(F)_j$ for the spatial prefix through depth $j$, together with the deterministic processing data at that prefix. In particular, every post state, its two prospective pre-child states, and the decision to retain its jump are $cal(F)_j$-measurable. The sign $r_(j + 1)$ is independent and fair conditional on $cal(F)_j$. The multiplier $epsilon.alt_j$ satisfies $\| epsilon.alt_j \| lt.eq 1$ and is $cal(F)_(j + 1)$-measurable. It is the same for every label coordinate. Thus a coefficient formed at depth $j$ has its output multiplied by the later sign $r_(j + 2)$. The additional bit allowed in the finite model supplies this sign even for the final contributing jump.

All moments below are divided by $alpha$. At a jumping post state the total mass is at most $2$, and at either prospective pre-child it is at most $4$. Intervening removals have normalized masses $xi_p$; full removal at an exit can be included. We write $K_e = sum_p xi_p$ for the sum along the entire plateau path. These quantities and the local budget statements are those of 17. No realized input membership or noisy label is sampled on this uniform output path. All statements use the sufficiently large $d$ convention already fixed; their constants are uniform in the finite spatial depth and in every integer-frequency cutoff.

=== 8.1 The predictable sign inequality <the-predictable-sign-inequality>

We use the standard exponential-supermartingale proof of a maximal inequality, based on Ville’s stopping argument #cite(label("Ville1939")) Chapter V, first section, Theorem 1, pp. 84–85. The finite-depth version below also records the conditional and predictable-masking forms required later.

#thm([Lemma 8.1.])[
  (Predictable signs).  #emph[Let $\( r_(i + 1) \)$ be fair signs in a filtration $\( cal(F)_i \)$, and let $c_i$ be real $cal(F)_i$-measurable coefficients. For every $theta > 0$ and $t gt.eq 0$, outside an event of probability at most $e^(- t)$, 
$ sum_(i < n) c_i r_(i + 1) lt.eq theta / 2 sum_(i < n) c_i^2 + t / theta #h(2em) upright("for every prefix ") n . $

 The same statement holds conditionally at a stopping-time origin and with predictable stopping or masking of the coefficients. For complex sums one may apply the assertion to both signs of each real component, at a total failure probability at most $4 e^(- t)$.]
] <lemma:paths-sign>

#proof[
  The elementary inequality $cosh x lt.eq e^(x^2 \/ 2)$ shows that
  $ exp (theta sum_(i < n) c_i r_(i + 1) - theta^2 / 2 sum_(i < n) c_i^2) $
  is a nonnegative supermartingale starting at one. Stop at the first crossing of $e^t$ to obtain the asserted maximal inequality. Everything is in finite depth, so optional sampling needs no limiting argument. Starting the same calculation with conditional expectation given the origin proves the conditional assertion. Predictable masks are absorbed in $c_i$. ◻
]

=== 8.2 Scalar moments and their masked transforms <scalar-moments-and-their-masked-transforms>

#thm([Proposition 8.2.])[
  (Scalar plateau paths).  #emph[Let $0 < b lt.eq 1$ be a scalar level, and let $s$ be a representative selected at a predictable snapshot birth on a live or static plateau. At a jumping post state put 
$ f_p = frac(bb(E)_p \[ a chi_s \], alpha) \, #h(2em) u_p = frac(f_(p \, +) - f_(p \, -), 2) \, #h(2em) eta_p = upright(bold(1))_({ max \( \| f_(p \, +) \| \, \| f_(p \, -) \| \) lt.eq C_3 b }) \, $

 where $C_3$ is a fixed constant and $f_(p \, plus.minus) = f_p plus.minus u_p$ are prospective pre-child moments. For every $t gt.eq 0$, with conditional failure probability at most $C e^(- t)$ at the birth, every contiguous interval $I$ of subsequent plateau jumps satisfies 
#[#set math.equation(numbering: n => "(8.1)")
 $ lr(|sum_(p in I) eta_p u_p epsilon.alt_(j \( p \)) r_(j \( p \) + 2)|) lt.eq C b^(1 \/ 4) \( 1 + K_e + t \) . $ <eq:source-15>]

 Constants are independent of depth, $s$, and $b$; they may depend on the fixed mask constant $C_3$.]
] <prop:scalar-path>

#proof[
  Identify a complex moment with a point in $bb(R)^2$ and set
  $ psi \( x \) = b^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] \( \| x \|^2 + b^2 \)^(3 \/ 4) - b^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  On $\| x \| lt.eq 4$ one has $0 lt.eq psi \( x \) lt.eq C b^(1 \/ 2)$ and $\| nabla psi \( x \) \| lt.eq C b^(1 \/ 2)$. More precisely,
  $ nabla^2 psi \( x \) = 3 / 2 b^(1 \/ 2) \( \| x \|^2 + b^2 \)^(- 5 \/ 4) (\( \| x \|^2 + b^2 \) "Id" - 1 / 2 x x^(sans(T))) . $
  Its least eigenvalue is at least $3 / 4 b^(1 \/ 2) \( \| x \|^2 + b^2 \)^(- 1 \/ 4)$. Consequently it is at least $c b^(1 \/ 2)$ throughout that ball, and at least $c \( C_3 \) > 0$ on $\| x \| lt.eq C_3 b$.
  Define the nonnegative averaging drift and the signed fluctuation by
  $ delta_p = frac(psi \( f_p + u_p \) + psi \( f_p - u_p \), 2) - psi \( f_p \) \, #h(2em) n_p = frac(psi \( f_p + u_p \) - psi \( f_p - u_p \), 2) . $
  Taylor’s formula on the two segments $f_p plus.minus t u_p$, $0 lt.eq t lt.eq 1$, gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ delta_p gt.eq c b^(1 \/ 2) \| u_p \|^2 \, #h(2em) delta_p gt.eq c \( C_3 \) eta_p \| u_p \|^2 \, #h(2em) n_p^2 lt.eq C b \| u_p \|^2 lt.eq C b^(1 \/ 2) delta_p . $ <eq:paths-scalar-drift>]
  For the second inequality the masked segment lies in the ball of radius $C_3 b$, since its endpoints do. The last inequality follows from the gradient bound and the first inequality.
  At the actual pre-child the potential is exactly $psi \( f_p \) + delta_p + r_(j + 1) n_p$. A removal of normalized mass $xi$ changes the complex moment by at most $xi$, and hence changes $psi$ by at most $C b^(1 \/ 2) xi$. Telescoping from birth to any prefix end therefore gives
  $ sum delta_p lt.eq C b^(1 \/ 2) \( 1 + K_e \) - sum r_(j + 1) n_p . $
  Apply 22 to the negative fluctuation with $theta = gamma b^(- 1 \/ 2)$, where $gamma > 0$ is a sufficiently small numerical constant. By (8.2) its quadratic term is at most $1 / 2 sum delta_p$. Outside probability $e^(- t)$ this proves, on every prefix,
  $ sum eta_p \| u_p \|^2 lt.eq C b^(1 \/ 2) \( 1 + K_e + t \) . $
  Now $eta_p u_p epsilon.alt_j$ is known in $cal(F)_(j + 1)$ before $r_(j + 2)$. Apply 22 to the real and imaginary components of this delayed transform with $theta = b^(- 1 \/ 4)$. Their quadratic sums are bounded by the preceding display. Thus every prefix transform has absolute value at most $C b^(1 \/ 4) \( 1 + K_e + t \)$ except on probability $C e^(- t)$. Subtracting the two prefixes bounding any contiguous interval proves (8.1). This subtraction retains precisely the fixed mask $eta_p$ within the interval. ◻
]

=== 8.3 The energy of label-valued moments <the-energy-of-label-valued-moments>

For the main levels we need an $L^1 \( d z \)$ estimate with an absolute coefficient on the Fisher sum. This will let the assembly charge information over disjoint intervals while paying separately for the choice of a representative. The label norm controls the scalar transform because integration against a label character recovers a shifted scalar modulation multiplied by a thermal Fourier coefficient. The main representative is chosen so that the coefficient needed in this recovery is close to one; 9 gives the exact decoding and the remaining spatial phase error. We begin with the energy identities for the label-valued moments.

Fix a main representative $s$ on a live plateau, so its main channel $A$ is fixed. At a jumping post state $p$ with post density $a_p$, define

$ M \( z \) = frac(bb(E)_p \[ a_p \( Y \) K_A \( z - Y \) \], alpha) \, #h(2em) f \( z \) = frac(bb(E)_p \[ a_p \( Y \) chi_s \( Y \) K_A \( z - Y \) \], alpha) . $

Here the observation consists only of the main label: the rounded coordinates used to construct snapshots have been integrated out. Define $M_plus.minus \, f_plus.minus$ by the same formulas on the two prospective children, using the same post density $a_p$. Write

$ f = M v \, #h(2em) f_plus.minus = M_plus.minus v_plus.minus \, #h(2em) \| v \| \, \| v_plus.minus \| lt.eq 1 \, #h(2em) D = frac(M_(+) - M_(-), 2) \, #h(2em) frak(a) = frac(f_(+) - f_(-), 2) . $

The functions $v$ are set to zero at zero mass. Define

$ G = integral M \| v \|^2 thin d z \, #h(2em) J = integral D^2 / M thin d z \, #h(2em) G_plus.minus = integral M_plus.minus \| v_plus.minus \|^2 thin d z . $

In particular $J$ agrees with (6.4). Quotients with zero denominator are assigned zero; nonnegativity and child averaging make their numerators zero as well.

#thm([Lemma 8.3.])[
  (Energy drift and innovations).  #emph[Put 
$ g_z = 1 / 2 #scale(x: 120%, y: 120%)[\(] M_(+) \| v_(+) - v \|^2 + M_(-) \| v_(-) - v \|^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) g = integral g_z thin d z \, #h(2em) U_p = frac(G_(+) - G_(-), 2) . $

 Then 
#[#set math.equation(numbering: n => "(8.3)")
 $ & g_z = frac(M_(+) \| v_(+) \|^2 + M_(-) \| v_(-) \|^2, 2) - M \| v \|^2 gt.eq 0 \, & \| frak(a) - v D \|^2 & lt.eq M g_z \,\
 & G_(upright(a c t u a l med p r e)) = G + g + r_(j + 1) U_p \, & \| U_p \|^2 & lt.eq C max \( G_(+) \, G_(-) \) \( J + g \) \,\
 &  & (integral \| frak(a) \| thin d z)^2 & lt.eq C \( G J + g \) . $ <eq:paths-innovation-pointwise>]

 A removal of normalized mass $xi$ changes $G$ in absolute value by at most $3 xi$. From any live jumping post state, 
#[#set math.equation(numbering: n => "(8.4)")
 $ bb(E) sum_(upright("future")) g lt.eq C \, #h(2em) bb(E) sum_(upright("future")) J lt.eq C d \, #h(2em) bb(E) sum_(upright("future")) xi lt.eq 2 \, $ <eq:paths-forward-budgets>]

 where the conditional law is spatially uniform on that state.]
] <lemma:paths-innovation>

#proof[
  Child averaging gives $M_(+) \( v_(+) - v \) = frak(a) - v D$ and $M_(-) \( v_(-) - v \) = - \( frak(a) - v D \)$. Expansion around $v$ proves the first identity. If both child masses are positive, it also gives
  $ g_z = frac(M \| frak(a) - v D \|^2, M^2 - D^2) . $
  This implies the innovation inequality. If a child mass is zero, the corresponding moment is zero and $frak(a) - v D = 0$, giving the same inequality. Write $e = frak(a) - v D$. Expanding the difference of the two child energies yields
  $ U_p = integral D \| v \|^2 thin d z + 2 "Re" integral overline(v) e thin d z + R \, #h(2em) \| R \| lt.eq g . $
  Cauchy–Schwarz bounds the first two integrals in absolute value by $sqrt(G J)$ and $sqrt(G g)$, respectively. Since $G + g = \( G_(+) + G_(-) \) \/ 2 lt.eq max \( G_(+) \, G_(-) \)$, squaring proves (8.3). The decomposition $frak(a) = v D + e$ gives
  $ integral \| frak(a) \| thin d z lt.eq sqrt(G J) + sqrt((integral M thin d z) g) lt.eq sqrt(G J) + sqrt(2 g) \, $
  which proves (8.3).
  For the removal assertion, the energy has the variational expression
  $ integral frac(\| f \|^2, M) thin d z = sup_(\| gamma \( z \) \| lt.eq 1) integral #scale(x: 120%, y: 120%)[\(] 2 "Re" \( overline(gamma f) \) - \| gamma \|^2 M #scale(x: 120%, y: 120%)[\)] thin d z . $
  Removing $k_M gt.eq 0$ and $k_f$ with $\| k_f \| lt.eq k_M$ changes every test in this supremum by at most $3 integral k_M = 3 xi$. Both the old and new moment-to-mass ratios have modulus at most one, so the same test class represents both energies. Finally telescope (8.3) over the entire future stopped plateau path. Its martingale terms have zero conditional expectation, its terminal pre energy is at most $4$, and the removals have expected total at most $2$. This gives the first bound in (8.4). The other two are 17. ◻
]

=== 8.4 A vector estimate on an outer-valid run <a-vector-estimate-on-an-outer-valid-run>

For a main dyadic level $b in \[ b_0 \, 1 \]$, declare a jump exceptional when $b < 1$ and it is bad for the #emph[main] criterion at level $2 b$. Put

$ e'_p = C b_0^(- 2) e_(p \, 2 b) upright(bold(1))_({ p upright(" exceptional") }) quad \( b < 1 \) \, #h(2em) e'_p = 0 quad \( b = 1 \) . $

Choose $C$ so that $e'_p gt.eq 1$ on every exceptional jump; this is possible because a bad main jump has edge mass at least $c \( 2 b \)^2$. Let $E_(e \, b) = sum_p e'_p$ on the whole plateau path. Fix a sufficiently large numerical $C_4$. For the specified $s \, b$, call a jump #emph[inner-valid] if it is exceptional or $max \( G_(+) \, G_(-) \) lt.eq C_4 b^2$, and #emph[outer-valid] if it is exceptional or $max \( G_(+) \, G_(-) \) lt.eq 2 C_4 b^2$. At $b = 1$ choose $C_4$ large enough that every jump is inner-valid.

#thm([Lemma 8.4.])[
  (Drift on a run).  #emph[Start predictably at an outer-valid jump, and stop before the first outer-invalid jump or at plateau end. For $t gt.eq 0$, outside conditional probability $e^(- t)$, every prefix $P$ of this run satisfies 
#[#set math.equation(numbering: n => "(8.5)")
 $ sum_(p in P) g_p lt.eq C (1 + sum_(p in P) xi_p + sum_(p in P) e'_p) + C b sum_(p in P) J_p + C b t . $ <eq:source-16>]

 Removals here include those between consecutive jumps and may also be enlarged to the whole plateau sum.]
] <lemma:paths-run-drift>

#proof[
  Telescope the exact energy identity of (8.3). Initial and terminal energies are bounded by $4$ and removals cost at most $3 xi$. On an exceptional jump, $\| U_p \| lt.eq 4 lt.eq 4 e'_p$, so pay its noise directly. On the remaining jumps, (8.3) gives $\| U_p \|^2 lt.eq C b^2 \( J_p + g_p \)$. Apply 22 to minus this remaining noise with parameter $theta = gamma \/ b$. Its quadratic bound is $C gamma b sum \( J_p + g_p \)$. Choose $gamma$ small enough to absorb the $g$ term, using $b lt.eq 1$. Its other term is $C b t$, which proves the simultaneous prefix assertion. ◻
]

#thm([Lemma 8.5.])[
  (Delayed norm estimate on a run).  #emph[Under the hypotheses of 25, set $lambda = b^(1 \/ 2)$ and $W_P \( z \) = sum_(p in P) frak(a)_p \( z \) epsilon.alt_(j \( p \)) r_(j \( p \) + 2)$. With conditional failure probability at most $C e^(- t)$, simultaneously for every run prefix, 
#[#set math.equation(numbering: n => "(8.6)")
 $ integral \| W_P \( z \) \| thin d z lt.eq C sum_(p in P) J_p + C lambda^(- 1) (1 + sum_(p in P) xi_p + sum_(p in P) e'_p) + C lambda t . $ <eq:source-17>]

 In particular, the coefficient of the Fisher sum is absolute, independent of $b$ and of the number of representatives.]
] <lemma:paths-run-norm>

#proof[
  We prove the norm estimate using both signs of a two-step block. Separate contributing depths into their two parities. For one parity start at its first depth in the run and group successive spatial jumps into blocks $j \, j + 1$, with $j$ contributing to this parity. Only complete blocks lying in the prefix will be used in the norm telescope. Denote the accumulated transform for this parity at the block start by $W^(\( 0 \))$, and put
  $ X_0 = \( W^(\( 0 \)) \, f_0 \, lambda M_0 \) \, #h(2em) Phi = \| X_0 \| = #scale(x: 120%, y: 120%)[\(] \| W^(\( 0 \)) \|^2 + \| f_0 \|^2 + lambda^2 M_0^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  The complex coordinates are viewed as pairs of real coordinates. Subscript $0$ denotes the first post state. After its sign $r = r_(j + 1)$, write $\( macron(M) \, macron(f) \)$ for the actual pre-child, and $\( M_1 \, f_1 \)$ for its post state after removals $\( k_M \, k_f \)$, where
  $ macron(M) = M_0 + r D_0 \, quad macron(f) = f_0 + r frak(a)_0 \, quad M_1 = macron(M) - k_M \, quad f_1 = macron(f) - k_f \, quad k_M gt.eq 0 \, quad \| k_f \| lt.eq k_M . $
  Here and in this proof these are pointwise identities in $z$; in particular $integral k_M = xi_(j + 1)$. At the end of the second jump, before its child’s processing, the change in $X_0$ is exactly
  #[#set math.equation(numbering: n => "(8.7)")
   $ Delta = #scale(x: 120%, y: 120%)[\(] frak(a)_0 epsilon.alt_j r' \, #h(0.27778em) r frak(a)_0 - k_f + r' frak(a)_1 \, lambda \( r D_0 - k_M + r' D_1 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) r' = r_(j + 2) . $ <eq:paths-two-step-increment>]
  We first prove the required pointwise quadratic estimate. Put
  $ q = \( \| v_0 \|^2 + lambda^2 \)^(1 \/ 2) \, #h(2em) H = M_0 q lt.eq Phi \, #h(2em) j_i = D_i^2 / M_i \, #h(2em) e_i = frak(a)_i - v_i D_i . $
  For $M_0 > 0$, $q gt.eq lambda$ and $\| v_0 \|^2 \/ q lt.eq 1$. Positivity of the child masses and of the removed density gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ 0 lt.eq M_1 lt.eq macron(M) lt.eq 2 M_0 \, quad 0 lt.eq k_M lt.eq macron(M) lt.eq 2 M_0 \, quad \| D_i \| lt.eq M_i \, quad \| e_i \|^2 lt.eq M_i g_(i \, z) . $ <eq:paths-positive-domination>]
  There is also a comparison of the child’s post mean with the starting mean:
  #[#set math.equation(numbering: n => "(8.9)")
   $ M_1 \| v_1 - v_0 \|^2 lt.eq 4 g_(0 \, z) + 8 k_M . $ <eq:paths-child-mean>]
  To verify it, let $macron(v) = macron(f) \/ macron(M)$ when $macron(M) > 0$, and zero otherwise. The actual child’s term in the definition of $g_(0 \, z)$ gives $macron(M) \| macron(v) - v_0 \|^2 lt.eq 2 g_(0 \, z)$. If $M_1 = 0$, the left side of (8.9) is zero. If $0 < M_1 lt.eq macron(M) \/ 2$, then $M_1 lt.eq k_M$ and the bound $\| v_1 - macron(v) \| lt.eq 2$ gives $M_1 \| v_1 - macron(v) \|^2 lt.eq 4 k_M$. If $M_1 > macron(M) \/ 2$, the identity
  $ M_1 \( v_1 - macron(v) \) = k_M macron(v) - k_f $
  instead gives $M_1 \| v_1 - macron(v) \|^2 lt.eq 4 k_M^2 \/ M_1 lt.eq 4 k_M$, since $k_M < M_1$. Thus the same bound covers every intermediate or arbitrarily small remaining mass. The squared triangle inequality, and $M_1 lt.eq macron(M)$, now prove (8.9).
  Splitting $frak(a)_0 = v_0 D_0 + e_0$ and retaining the factor $q$ yields
  #[#set math.equation(numbering: n => "(8.10)")
   $ frac(\| frak(a)_0 \|^2, H) lt.eq 2 j_0 + frac(2 g_(0 \, z), lambda) . $ <eq:paths-first-remainder>]
  For the child jump use the three terms $frak(a)_1 = v_0 D_1 + \( v_1 - v_0 \) D_1 + e_1$. Their separate squared ratios obey
  $ frac(\| v_0 D_1 \|^2, H) & lt.eq 2 j_1 \,\
frac(\| v_1 - v_0 \|^2 D_1^2, H) & lt.eq 2 / lambda M_1 \| v_1 - v_0 \|^2 lt.eq frac(8 g_(0 \, z) + 16 k_M, lambda) \,\
frac(\| e_1 \|^2, H) & lt.eq frac(2 g_(1 \, z), lambda) . $
  The factor $M_1 \/ M_0 lt.eq 2$ supplies the first and third bounds; the second uses $\| D_1 \| lt.eq M_1$ and (8.9). In particular no lower bound on $M_1 \/ M_0$ is used. Hence
  #[#set math.equation(numbering: n => "(8.11)")
   $ frac(\| frak(a)_1 \|^2, H) lt.eq 6 j_1 + frac(24 g_(0 \, z) + 6 g_(1 \, z) + 48 k_M, lambda) . $ <eq:paths-second-remainder>]
  The mass-coordinate and removal terms satisfy
  $ frac(lambda^2 D_0^2, H) lt.eq j_0 \, #h(2em) frac(lambda^2 D_1^2, H) lt.eq 2 j_1 \, #h(2em) frac(k_M^2 + \| k_f \|^2, H) lt.eq frac(4 k_M, lambda) . $
  These follow again from (8.8) and $0 < lambda lt.eq 1$. If $M_0 = 0$, all the masses, half-differences, and removals in (8.7) are zero by positivity, so $Delta = 0$ whether or not $W^(\( 0 \))$ is zero. This deals with every zero denominator without an approximation argument.
  For $Phi > 0$, concavity of the square root gives the global norm bound
  $ \| X_0 + Delta \| lt.eq Phi + ⟨X_0 / Phi \, Delta⟩ + frac(\| Delta \|^2, 2 Phi) . $
  Combining the preceding pointwise inequalities and integrating proves
  #[#set math.equation(numbering: n => "(8.12)")
   $ integral frac(\| Delta \|^2, 2 Phi) thin d z lt.eq C \( J_0 + J_1 \) + C lambda^(- 1) \( g_0 + g_1 + xi_(j + 1) \) . $ <eq:paths-norm-remainder>]
  The absolute Fisher coefficient results from the estimates of $v_0 D_i$ with $q$, rather than replacing $q$ by $lambda$ in those terms.
  It remains to control the integrated linear term and its timing. Write $Gamma_0 = X_0 \/ Phi$, with value zero where $Phi = 0$. Its norm is at most one. The linear term is
  $ r L_0 + r' L_1 + L_(upright("kill")) \, $
  where $L_(upright("kill"))$ has absolute value at most $2 xi_(j + 1)$, and $L_0 \, L_1$ are real integrated coefficients. Specifically $L_0$ pairs $Gamma_0$ with $\( 0 \, frak(a)_0 \, lambda D_0 \)$, whereas $L_1$ pairs it with $\( frak(a)_0 epsilon.alt_j \, frak(a)_1 \, lambda D_1 \)$. By (8.3) and $\( integral \| D_i \| \)^2 lt.eq \( integral M_i \) J_i lt.eq 2 J_i$, their squares satisfy
  #[#set math.equation(numbering: n => "(8.13)")
   $ \| L_0 \|^2 + \| L_1 \|^2 lt.eq C sum_(i = 0 \, 1) #scale(x: 120%, y: 120%)[\(] \( lambda^2 + G_i \) J_i + g_i #scale(x: 120%, y: 120%)[\)] . $ <eq:paths-linear-variance>]
  At a block start $W^(\( 0 \))$ is $cal(F)_j$-measurable: the previous output of the same parity, if present, used $r_j$. Thus $L_0$ is known before $r_(j + 1)$. After that bit the removals, second post state, and $epsilon.alt_j$ are all known, so $L_1$ is known before $r_(j + 2)$. Form one scalar sign scheme by including $r L_0$ whenever the first jump is in the run, and including $r' L_1$ only if the second jump is also in the run. Both inclusion decisions are known before their respective signs. The linear sum through the last complete block of any prefix is itself a prefix of this scheme. If the run stops after a first step, no first coefficient is retrospectively conditioned on the next validity decision.
  On a nonexceptional included state $G_i lt.eq 2 C_4 b^2$. At an exceptional state both $G_i$ and $J_i$ are at most $2$, and $e'_i gt.eq 1$. Therefore
  $ G_i J_i lt.eq C b^2 J_i + C e'_i . $
  Apply 22 to the linear scheme with parameter $1 \/ lambda$. Its quadratic term, by (8.13), is at most
  $ C sum J_p + C lambda^(- 1) sum \( g_p + e'_p \) \, $
  because $lambda = b^(1 \/ 2)$ and $b lt.eq 1$. The tail term is $lambda t$. All sums here can be restricted to the complete blocks of the prefix. At the first block $W^(\( 0 \)) = 0$ and $integral Phi lt.eq C$. Between complete blocks, passing from a pre state to the next post state changes the integrated norm by at most $2 xi$, by the norm’s Lipschitz property. Telescoping, using (8.12), proves for the completed blocks the bound
  $ C sum J_p + C lambda^(- 1) (1 + sum xi_p + sum e'_p + sum g_p) + C lambda t . $
  At most one contributing output of this parity is unmatched at a prefix end. It costs at most $integral \| frak(a)_p \| lt.eq integral M_p lt.eq 2$, even if its delayed sign occurs after the run has stopped. Add this output directly. The other parity is started conditionally on reaching its first jump, one step later if necessary, and obeys the same bound with the same conditional failure estimate. Each prefix jump is used in at most two of the completed-block estimates. Finally apply (8.5) on this prefix. Its $g$ contribution becomes $C lambda^(- 1) \( 1 + sum xi + sum e' \) + C \( b \/ lambda \) sum J + C \( b \/ lambda \) t$. Since $b \/ lambda = lambda lt.eq 1$, adding the two parity bounds gives (8.6). ◻
]

=== 8.5 Predictable runs and Fisher checkpoints <predictable-runs-and-fisher-checkpoints>

The run estimate charges the Fisher sum from its origin. Subtracting two prefixes to estimate a later interval would therefore charge the earlier part of the run twice. We introduce predictable checkpoints so that this extra Fisher charge is bounded by an absolute constant.

#thm([Proposition 8.6.])[
  (Vector estimates on arbitrary inner-valid intervals).  #emph[Fix a live plateau, a main level $b in \[ b_0 \, 1 \]$, and a representative $s$ at its snapshot birth. There is a family of predictable estimate origins, containing run starts and the checkpoints described below, whose conditional expected size at the birth is at most $P \( d \, b_0^(- 1) \)$ for an absolute fixed polynomial $P$. For every $t gt.eq 0$, outside a conditional event of probability at most $C P \( d \, b_0^(- 1) \) e^(- t)$, every contiguous interval $I$ of inner-valid jumps after this birth satisfies 
#[#set math.equation(numbering: n => "(8.14)")
 $ integral lr(|sum_(p in I) frak(a)_p \( z \) epsilon.alt_(j \( p \)) r_(j \( p \) + 2)|) thin d z lt.eq C sum_(p in I) J_p + C b^(- 1 \/ 2) \( 1 + K_e + E_(e \, b) \) + C b^(1 \/ 2) t . $ <eq:paths-inner-interval>]

 The Fisher sum is taken only over $I$. The representative remains eligible for these estimates until the plateau ends, even if another snapshot has meanwhile replaced the one at which it was born.]
] <prop:vector-path>

#proof[
  Start a run at the first inner-valid opportunity after birth, possibly at the birth jump itself. Follow consecutive outer-valid jumps, stopping before the first outer-invalid jump or at plateau end. After a break, start the next run at the first later inner-valid opportunity. These are predictable rules: both prospective child energies and the exceptional indicator are known before the jump sign. Every contiguous inner-valid interval lies in one of these outer-valid runs.
  We first bound the number of run starts conditionally on the birth prefix. A start on an exceptional jump can be charged to that jump. 19 bounds the expected number of these by $d "poly" \( h \)$; there are none when $b = 1$. At a nonexceptional start, $G_(upright("start")) lt.eq C_4 b^2$. If its run breaks, include the first invalid jump in a comparison interval, although the transform estimate stops before it. At that jump $max \( G_(+) \, G_(-) \) > 2 C_4 b^2$. Conditional on the prefix there, with probability at least $1 \/ 2$ its actual pre-child energy exceeds $2 C_4 b^2$. Mark such a break. The comparison intervals for different runs are disjoint, including their invalid jumps.
  Let $Q$ denote one such start-to-break comparison interval, and put $cal(M)_Q = sum_(p in Q) r_(j \( p \) + 1) U_p$. By the exact energy identity and the removal bound, a marked break implies
  $ C_4 b^2 lt.eq sum_(p in Q) g_p + 3 sum_(p in Q) xi_p + \| cal(M)_Q \| . $
  Consequently, with a numerical constant depending only on $C_4$,
  #[#set math.equation(numbering: n => "(8.15)")
   $ upright(bold(1))_({ Q upright(" marked") }) lt.eq C b^(- 2) sum_(p in Q) \( g_p + xi_p \) + C b^(- 4) \| cal(M)_Q \|^2 . $ <eq:paths-marked-break>]
  To use orthogonality, first include every start-to-break interval of this type and the possible unfinished terminal interval, without conditioning on a mark. Its starting rule and inclusion through the invalid bit are predictable. Thus stopped martingale orthogonality gives
  $ bb(E) sum_Q \| cal(M)_Q \|^2 = bb(E) sum_(p in union.big Q) U_p^2 lt.eq C bb(E) sum_p \( J_p + g_p \) \, $
  using (8.3) and $max \( G_(+) \, G_(-) \) lt.eq 4$. All expectations here are conditional at birth. Each nonexceptional break is marked with conditional probability at least $1 \/ 2$, so (8.15), (8.4) imply
  $ bb(E) \# { upright("nonexceptional-start runs that break") } lt.eq C b^(- 2) + C d b^(- 4) . $
  At most one final run fails to break. Including exceptional starts proves a bound $P \( d \, b_0^(- 1) \)$ for all starts, uniformly in $s$. The factor $"poly" \( h \)$ is absorbed in a fixed power of $b_0^(- 1)$.
  Within each outer-valid run, also start an estimate whenever the accumulated $J$ since the preceding origin reaches one. More precisely, after including the jump that reaches this threshold, reset the counter and use the next jump as a new origin if it remains in the run. Each such origin’s estimate continues to that run’s same break or end. The counter decision is known at this next origin; no future bit is used. The number of additional origins is at most the total $J$ of the path, and $J_p lt.eq integral M_p lt.eq 2$ bounds a threshold overshoot. Therefore their conditional expected number is at most $C d$ by (8.4).
  Apply 26 conditionally at every origin, with the same parameter $t$. Summing its conditional failure probabilities weights each origin by its probability of being reached. The expected origin count just proved bounds the resulting probability by $C P \( d \, b_0^(- 1) \) e^(- t)$. On the event of simultaneous success, fix any desired interval $I$ and choose the latest origin $q$ in its outer-valid run at or before its first jump. The total $J$ between $q$ and that first jump is at most $3$; indeed the counter is below one before a threshold crossing, and one jump adds at most two. The interval transform is the difference of two prefixes from $q$. Their Fisher sums add to
  $ sum_(p in I) J_p + 2 sum_(q lt.eq p < min I) J_p lt.eq sum_(p in I) J_p + 6 . $
  Their removal and exceptional sums are bounded by twice $K_e$ and $E_(e \, b)$, respectively. The extra constant is absorbed by $b^(- 1 \/ 2) \( 1 + K_e + E_(e \, b) \)$. The triangle inequality in $L^1 \( d z \)$ then proves (8.14). This argument also permits the interval to begin long after the snapshot’s replacement. ◻
]

=== 8.6 Simultaneous representatives and random list caps <simultaneous-representatives-and-random-list-caps>

#thm([Lemma 8.7.])[
  (Parameters for all representatives at a level).  #emph[On each plateau and at each permitted level there are nonnegative random parameters $t_b \, H_b$, independent of the actual frequency later being estimated, with the following properties. Almost surely the scalar bound of 23, or the vector interval bound of 27, holds with $t = t_b$ for every representative in the snapshot construction used on the path. The activation conclusion of 21 holds with miss-block length $H_b$. Moreover 
#[#set math.equation(numbering: n => "(8.16)")
 $ bb(E)_(upright(bold(U))_e) t_b & lt.eq C k_(b \/ 4) + C log \( C d \/ b \) &  & upright("for main levels") \,\
bb(E)_(upright(bold(U))_e) t_b & lt.eq C #scale(x: 120%, y: 120%)[\(] d_1 + log \( 1 \/ b \) #scale(x: 120%, y: 120%)[\)] &  & upright("for scalar levels") \,\
bb(E)_(upright(bold(U))_e) H_b & lt.eq C log \( C d_1 \/ b \) + C log \( 1 \/ sigma \) &  & upright("for either criterion") . $ <eq:paths-main-parameter>]

 These assertions hold simultaneously over the countably many levels.]
] <lemma:paths-simultaneous>

#proof[
  Begin with a deterministic dyadic cap $D_max = 2^m$, $m gt.eq 0$. The broad list is constructed independently of this cap. The capped snapshot scheme creates snapshots only while its list length is at most $D_max$; estimates for representatives already born continue to the plateau end. By 20, the expected number of births is bounded by a fixed polynomial in $\( D_max \, d_1 \, 1 \/ b \)$. The number of representatives in each snapshot is at most
  $ R_b^(upright("main")) = ceil.l e^(k_(b \/ 2)) ceil.r \, #h(2em) R_b^(upright("sc")) = exp #scale(x: 120%, y: 120%)[\(] C \( d_1 + log \( 1 \/ b \) \) #scale(x: 120%, y: 120%)[\)] \, $
  as established in that lemma. Scalar estimates originate at these births. For each main representative, 27 bounds the conditional expected number of run and checkpoint origins by a fixed polynomial in $\( d \, b_0^(- 1) \)$. For sufficiently large $d$ this factor is also bounded by a fixed power of $d$, because $b_0^(- 1) lt.eq 2 h^16 lt.eq d$.
  Here is the conditional union argument, which also applies when the number of origins is random. Enumerate predictable origins by their finite tree addresses and, within an address, by their representative indices. If $B_o$ is the event that origin $o$ is reached and an estimate starting there fails with deterministic parameter $t$, then
  $ bb(P) \( B_o \) lt.eq C e^(- t) bb(P) \( o upright(" is reached") \) . $
  Sum this inequality over origins and then use their expected count. Thus the failure probability for a capped scheme is at most $C e^(- t)$ times its stated representative cardinality and polynomial count. No union over the signed span of the broad list is taken.
  Choose sufficiently large fixed constants and define baseline parameters
  $ T_b^(upright("main")) = C k_(b \/ 4) + C log \( C d \/ b \) \, #h(2em) T_b^(upright("sc")) = C \( d_1 + log \( 1 \/ b \) \) . $
  They absorb the logarithms of the representative cardinalities and all polynomial factors except the cap. For a sufficiently large further fixed $C_(upright("cap"))$, use
  $ t = T_b + C_(upright("cap")) log \( C D_max \) + z $
  in each deterministic capped scheme. Its failure probability is at most $C 2^(- 2 m) e^(- z)$, after increasing $C_(upright("cap"))$ if necessary. Summing over all dyadic caps gives $C e^(- z)$. These events are nested as $z$ increases, since every right-hand side in the path estimates increases. Let $Z_b$ be the least nonnegative integer $z$ for which all these capped schemes succeed. Integer tail summation gives
  $ bb(P) \( Z_b > n \) lt.eq C e^(- n) \, #h(2em) bb(E) Z_b lt.eq C \, $
  and $Z_b$ is finite almost surely.
  Only now choose a cap from the realized output path: let $hat(D)$ be the least dyadic integer at least $1 + \| D \|_(upright("final"))$ for the broad list at this level. Thus $1 + \| D \|_(upright("final")) lt.eq hat(D) < 2 \( 1 + \| D \|_(upright("final")) \)$, and its capped scheme never breaches the cap on this path. The simultaneous assertion over deterministic caps permits this selection without a stopping-time claim about $hat(D)$. Set
  $ t_b = T_b + C_(upright("cap")) log \( C hat(D) \) + Z_b . $
  Broad capture gives $bb(E) \| D \|_(upright("final")) lt.eq C d_1 b^(- C)$, so Jensen’s inequality yields
  $ bb(E) log \( C hat(D) \) lt.eq C + log #scale(x: 120%, y: 120%)[\(] C \( 1 + bb(E) \| D \|_(upright("final")) \) #scale(x: 120%, y: 120%)[\)] lt.eq C log \( C d_1 \/ b \) . $
  This proves (8.16), (8.16), using $d_1 = d$ for main levels and $log d_1 lt.eq d_1$ for scalar levels. Use 21 with this same cap and put
  $ H_b = C log \( C hat(D) d_1 \/ b \) + C log \( 1 \/ sigma \) . $
  Its expectation satisfies (8.16). In the static case the optional term $log \( 1 \/ sigma \) = 40 log h$ is at most $C d lt.eq C d_1$; thus it causes no loss in the scalar plateau bound used below.
  For each level the construction has a probability-one success event. Their countable intersection still has probability one. The resulting parameters depend on the plateau path and the level, but not on the integer frequency whose transform will be compared to these representatives. ◻
]

== 9 Assembly of the dyadic estimate <sec:assembly>

We prove the modulated delayed Haar estimate stated in 15. First we bound the contribution of a single plateau, using its representatives to recover each actual modulation. We then sum these contributions with the plateau starting weights, keeping the live Fisher and edge charges global.

#proof[
  The zero input is immediate. For positive input, apply the finite procedure of 6, with the common stopping rule in the statement. In particular, the cutoff always refers to the original $rho$, including when a subpiece is being processed. The parameter constants are fixed in the order specified there, and $d_0$ is increased to satisfy their finitely many large-$d$ requirements.
  === The contribution of one plateau <the-contribution-of-one-plateau>
  For a plateau $e$, write $p_e$ for its root, $alpha_e$ for its normalization, and $upright(bold(U))_e$ for uniform probability on $p_e$. On an output path $x in p_e$, let $cal(P)_e \( x \)$ be its consecutive jumping nodes belonging to this plateau. The post density at a node $p in cal(P)_e \( x \)$ is denoted by $a_p$. Thus all removals at $p$ have already occurred, and $a_p$ is the density whose two prospective child moments are used in that jump. In sums over nodes $p$, write $j = "depth" \( p \)$. Define
  $ c_p^u = 1 / alpha_e bb(E)_p \[ a_p \( Y \) chi_u \( Y \) r_(j + 1) \( Y \) \] \, #h(2em) cal(T)_e^u \( x \) = sum_(p in cal(P)_e \( x \)) c_p^u epsilon.alt_j \( x \) r_(j + 2) \( x \) . $
  At each jumping node the post pieces partition the original density. Consequently their transforms satisfy the exact identity
  $ cal(H)_(I \, J)^u rho \( x \) = sum_(e : thin x in p_e) alpha_e cal(T)_e^u \( x \) . $
  Put $w_e = upright(bold(U)) \( p_e \) alpha_e$. The triangle inequality and integration with respect to $upright(bold(U))$ give
  #[#set math.equation(numbering: n => "(9.1)")
   $ integral_I max_(u in bb(Z)\
\| u \| lt.eq Q) \| cal(H)_(I \, J)^u rho \| thin d upright(bold(U)) lt.eq sum_e w_e bb(E)_(upright(bold(U))_e) sup_(u in bb(Z)) \| cal(T)_e^u \| . $ <eq:09-plateau-reduction>]
  We will bound this weighted sum by $C d$, charging the live Fisher and edge terms across all pieces and the remaining terms one plateau at a time.
  The local mass bound gives $\| c_p^u \| lt.eq 2$ and prospective child masses at most $4$, in this normalization. Let $K_e \( x \)$ denote the sum of all normalized removal masses $xi_p$ on the plateau’s processing path, including the intervening and terminal removals allowed in 18; then
  #[#set math.equation(numbering: n => "(9.2)")
   $ bb(E)_(upright(bold(U))_e) K_e lt.eq 1 . $ <eq:09-kills>]
  For live plateaus set $d_1 = d$, and for static plateaus set $d_1 = d + 2 + log^(-) alpha_e$.
  Use the main levels $cal(B)_(upright(m)) = { 2^(- j) : b_0 lt.eq 2^(- j) lt.eq 1 }$ on live plateaus. Use scalar levels $cal(B)_(upright(s)) \( B \) = { B 2^(- j) : j gt.eq 0 }$, where $B = b_0$ on a live plateau and $B = 1$ on a static plateau. At the shared level $b_0$ the main and scalar constructions are distinct. By 28, they have nonnegative, frequency-independent path parameters $t_b^(upright(m)) \, t_b^(upright(s))$ and miss-block lengths $H_b^(upright(m)) \, H_b^(upright(s))$, satisfying
  #[#set math.equation(numbering: n => "(9.3)")
   $ bb(E)_(upright(bold(U))_e) t_b^(upright(m)) & lt.eq C k_(b \/ 4) + C log \( C d \/ b \) \, &  & b in cal(B)_(upright(m)) \,\
bb(E)_(upright(bold(U))_e) t_b^(upright(s)) & lt.eq C \( d_1 + log \( 1 \/ b \) \) \, &  & b in cal(B)_(upright(s)) \( B \) \,\
bb(E)_(upright(bold(U))_e) H_b^(upright(m)) \, quad bb(E)_(upright(bold(U))_e) H_b^(upright(s)) & lt.eq C log \( C d_1 \/ b \) + C log \( 1 \/ sigma \) &  & upright("for the levels where they are used.") $ <eq:09-main-parameters>]
  These statements already include all snapshot births, representative choices, starts, checkpoints, and dyadic list caps. In particular we may use the same parameters for every actual integer $u$.
  At a live jumping piece write
  $ E_(p \, b)^(upright(m)) = e_(p \, b) upright(bold(1))_({ p upright(" bad at main level ") b }) . $
  For the scalar construction let $macron(b) \( p \)$ be its largest bad level, if there is one, and put
  $ E_p^(upright(s)) = e_(p \, macron(b) \( p \)) quad upright("if a bad scalar level exists") \, #h(2em) E_p^(upright(s)) = 0 quad upright("otherwise") . $
  A nonempty subset of the dyadic levels bounded above by $B$ has a largest member. This choice is determined by the jumping piece before its bit and is independent of $u$. The scalar edge regions are nested as $b$ increases: their defining $l_b$ decreases. Hence
  #[#set math.equation(numbering: n => "(9.4)")
   $ b lt.eq macron(b) \( p \) quad arrow.r.double quad e_(p \, b) lt.eq e_(p \, macron(b) \( p \)) . $ <eq:09-edge-monotonicity>]
  === Main amplitudes and exact decoding <main-amplitudes-and-exact-decoding>
  Fix an integer $u$ and a live plateau path. Starting with its first main activation, including that jump, retain the largest main level activated so far. This level is nondecreasing. Its positive intervals therefore use each level $b$ at most once. On the interval assigned to $b$, keep the representative $s$ and decomposition supplied at its first activation:
  #[#set math.equation(numbering: n => "(9.5)")
   $ u = s + n + a' \, #h(2em) Delta_A \( n \) lt.eq r_(upright("sep")) \, #h(2em) \| a' \| thin \| p_(upright("act")) \| lt.eq C sigma . $ <eq:09-main-decomposition>]
  The form $A$ is fixed on this plateau. All subsequent nodes in the interval lie below $p_(upright("act"))$.
  For clarity, the comparison of criteria uses no loss depending on the number of representatives. For a prospective child $q$ of $p$, write $f_q^v \( z \) = alpha_e^(- 1) bb(E)_q \[ a_p \( Y \) chi_v \( Y \) K_A \( z - Y \) \]$ and $M_q \( z \) = alpha_e^(- 1) bb(E)_q \[ a_p \( Y \) K_A \( z - Y \) \]$. For the fixed output point $x in p$, conditional Cauchy–Schwarz gives
  $ ∥f_q^u - chi_n \( dot.op \) chi_(a') \( x \) f_q^s∥_(L^2 \( M_q^(- 1) d z \)) lt.eq C Delta_A \( n \) + C \| a' \| thin \| p \| . $
  Indeed the square of the channel part is at most
  $ 1 / alpha_e bb(E)_q [a_p \( Y \) integral \| chi_n \( Y \) - chi_n \( z \) \|^2 K_A \( z - Y \) thin d z] = frac(bb(E)_q a_p, alpha_e) Delta_A \( n \)^2 \, $
  and the spatial part uses $\| chi_(a') \( Y \) - chi_(a') \( x \) \| lt.eq 2 pi \| a' \| thin \| p \|$ and $bb(E)_q a_p \/ alpha_e lt.eq 4$. The triangle inequality in this weighted Hilbert space proves
  #[#set math.equation(numbering: n => "(9.6)")
   $ lr(|sqrt(G_q^u) - sqrt(G_q^s)|) lt.eq C \( r_(upright("sep")) + sigma \) lt.double b_0 lt.eq b . $ <eq:09-criterion-comparison>]
  If $b < 1$, level $2 b$ has not activated at any jump of this interval. Its non-bad high jumps before activation lie in one block of at most $H_(2 b)^(upright(m))$ depths, by 18. Remove the intersection of that entire block with the current interval and pay $C H_(2 b)^(upright(m))$ directly, using $\| c_p^u \| lt.eq 2$. The remaining jumps form at most two contiguous intervals. On each, a nonexceptional jump is not high for $u$ at $2 b$; thus (9.6) makes it inner-valid for $s \, b$ in 27. Here the exceptional jumps are precisely the bad main jumps at $2 b$. When $b = 1$, every jump is inner-valid after the fixed constant in that definition is chosen large enough, since all $G_q^s lt.eq 4$; no block is removed and no exception is needed.
  We next verify the decoding of the vector estimate back to the actual scalar modulation. Put
  $ frak(a)_p^s \( z \) = 1 / alpha_e bb(E)_p \[ a_p \( Y \) chi_s \( Y \) r_(j + 1) \( Y \) K_A \( z - Y \) \] \, #h(2em) c_A \( n \) = integral chi_n \( theta \) K_A \( theta \) thin d theta . $
  Evenness and positivity of the thermal Fourier coefficients imply
  #[#set math.equation(numbering: n => "(9.7)")
   $ c_A \( n \) = 1 - 1 / 2 Delta_A \( n \)^2 gt.eq 1 / 2 \, #h(2em) integral chi_n \( z \) frak(a)_p^s \( z \) thin d z = c_A \( n \) c_p^(s + n) . $ <eq:09-decoding>]
  This is an exact identity, obtained by putting $z = Y + theta$ in the inner integral. On any subset of the nodes below $p_(upright("act"))$,
  $ sum_p \| c_p^u - chi_(a') \( x \) c_p^(s + n) \| lt.eq C \| a' \| sum_p \| p \| lt.eq C \| a' \| thin \| p_(upright("act")) \| lt.eq C sigma . $
  The sum of lengths is geometric because the nodes lie on one descending path. The bound applies in particular to each retained subinterval. Since the multipliers are common to all label coordinates, (9.7) now gives
  #[#set math.equation(numbering: n => "(9.8)")
   $ lr(|sum_(p in L) c_p^u epsilon.alt_j r_(j + 2)|) lt.eq 2 integral lr(|sum_(p in L) frak(a)_p^s \( z \) epsilon.alt_j r_(j + 2)|) thin d z + C sigma $ <eq:09-vector-to-scalar>]
  for every retained subinterval $L$.
  Apply 27 to $L$. Its Fisher sum is charged only on $L$. The intervals at distinct retained levels are disjoint, and there are at most two retained subintervals at each level. Thus these Fisher charges have an absolute bounded multiplicity at every jumping piece. All kill and exceptional sums may use the whole plateau path. Writing the exceptional proxy as $e'_p = C b_0^(- 2) E_(p \, 2 b)^(upright(m))$, and using $b^(- 1 \/ 2) b_0^(- 2) lt.eq b_0^(- 3)$ for $b gt.eq b_0$, we have bounded the whole main part by a constant times
  #[#set math.equation(numbering: n => "(9.9)")
   $ sum_p J_p + b_0^(- 3) sum_p sum_(b in cal(B)_(upright(m))) E_(p \, b)^(upright(m)) + sum_(b in cal(B)_(upright(m))) [b^(- 1 \/ 2) \( 1 + K_e \) + b^(1 \/ 2) t_b^(upright(m)) + H_b^(upright(m))] . $ <eq:09-main-path-bound>]
  The constants in the vector estimates and the geometric decoding errors are absorbed by the displayed $b^(- 1 \/ 2)$ terms.
  === The scalar prefix and all static paths <the-scalar-prefix-and-all-static-paths>
  On a live plateau consider the prefix strictly before the first main activation, or the whole path if no main activation occurs. On a static plateau consider the entire path. Use the scalar levels through $B$ specified above, again retaining the largest activated level so far, including activations at the current jump, and using zero if none has activated. There are finitely many changes on this finite path even though the available scalar levels extend arbitrarily close to zero. Each positive level $b$ is retained on at most one contiguous interval.
  For its fixed representative $s$, scalar activation supplies $u = s + a'$ with $\| a' \| thin \| p_(upright("act")) \| lt.eq C b^4$, with the sufficiently small constant in 18. On this level interval sum first over the fixed scalar mask
  $ max { \| f_(p \, +)^s \| \, \| f_(p \, -)^s \| } lt.eq C_3 b . $
  This is precisely the masked transform in 23; that proposition applies to the masked sum over the whole contiguous level interval. Freezing $chi_(a')$ at $x$ changes this masked sum by at most $C b^4$, by the same geometric sum of interval lengths as above. Hence all such masked sums cost at most
  #[#set math.equation(numbering: n => "(9.10)")
   $ C sum_(b in cal(B)_(upright(s)) \( B \)) b^(1 \/ 4) \( 1 + K_e + t_b^(upright(s)) \) . $ <eq:09-scalar-mask-sum>]
  Treat every remaining jump directly. This includes all jumps while the retained level is zero. Put $A'_p = max { \| f_(p \, +)^u \| \, \| f_(p \, -)^u \| } lt.eq 4$ in the unlabelled scalar notation. The direct jump costs at most $A'_p$, and a zero value needs no charge. If a positive level $b$ is currently retained, the jump is outside its mask; the spatial phase comparison gives $A'_p gt.eq C_3 b - C b^4 > 4 b$, on taking $C_3$ large enough.
  For a live prefix, any direct jump with $A'_p > 4 b_0$ is high at main level $b_0$. In fact $f_(p \, plus.minus)^u = integral f_(p \, plus.minus)^u \( z \) thin d z$ and Cauchy–Schwarz gives $\| f_(p \, plus.minus)^u \|^2 lt.eq \( integral M_(p \, plus.minus) \) G_(p \, plus.minus)^u lt.eq 4 G_(p \, plus.minus)^u$. No main level has yet activated in this prefix. All its non-bad main high jumps at $b_0$ are therefore paid by its one miss block, and its bad jumps are paid by $C b_0^(- 2) E_(p \, b_0)^(upright(m))$, since each direct coefficient is at most $4$. These costs are already included, up to constants, in (9.9).
  At every other nonzero direct jump we have $A'_p lt.eq 4 B$; this holds automatically on a static path with $B = 1$. Choose the largest available scalar level $tilde(b) lt.eq A'_p$. Then
  $ A'_p \/ 4 lt.eq tilde(b) lt.eq A'_p \, $
  and the jump is high at $tilde(b)$. This level has not activated: if the current level is positive, $A'_p > 4 b$ implies $tilde(b) > b$, and otherwise none has activated. All non-bad jumps assigned to a fixed $tilde(b)$ consequently lie in its single preactivation miss block and cost at most $C tilde(b) H_(tilde(b))^(upright(s))$ together. If the assigned level is bad, then $e_(p \, tilde(b)) gt.eq c tilde(b)$ and (9.4) gives
  $ A'_p lt.eq 4 tilde(b) lt.eq C e_(p \, tilde(b)) lt.eq C E_p^(upright(s)) . $
  Thus only one predictably selected scalar edge level per jump is charged. This establishes the scalar accounting for every positive amplitude, including arbitrarily small amplitudes.
  Combining these conclusions, the same frequency-independent quantity bounds $sup_u \| cal(T)_e^u \|$ on a live plateau:
  #[#set math.equation(numbering: n => "(9.11)")
   $ C^(- 1) sup_(u in bb(Z)) \| cal(T)_e^u \| lt.eq  & sum_(p in cal(P)_e \( x \)) (J_p + b_0^(- 3) sum_(b in cal(B)_(upright(m))) E_(p \, b)^(upright(m)) + E_p^(upright(s)))\
 & + sum_(b in cal(B)_(upright(m))) [b^(- 1 \/ 2) \( 1 + K_e \) + b^(1 \/ 2) t_b^(upright(m)) + H_b^(upright(m))]\
 & + sum_(b in cal(B)_(upright(s)) \( b_0 \)) [b^(1 \/ 4) \( 1 + K_e + t_b^(upright(s)) \) + b H_b^(upright(s))] . $ <eq:09-live-majorant>]
  For a static plateau the corresponding bound is
  #[#set math.equation(numbering: n => "(9.12)")
   $ sup_(u in bb(Z)) \| cal(T)_e^u \| lt.eq C sum_p E_p^(upright(s)) + C sum_(b in cal(B)_(upright(s)) \( 1 \)) [b^(1 \/ 4) \( 1 + K_e + t_b^(upright(s)) \) + b H_b^(upright(s))] . $ <eq:09-static-majorant>]
  The path constructions and bounds used here hold simultaneously outside one $upright(bold(U))_e$-null set. The countable scalar-level sums have finite expectation by the estimates below. In particular no exceptional set depending on the actual modulation is introduced in these majorants.
  === Summing levels and live weights <summing-levels-and-live-weights>
  Write $b_0 = 2^(- M)$, so $M = O \( 1 + log h \)$. Since $k_b = A_0 \( d \/ h \) \( 1 + log \( 1 \/ b \) \)^2$, the main cardinality tails satisfy
  #[#set math.equation(numbering: n => "(9.13)")
   $ sum_(b in cal(B)_(upright(m))) b^(1 \/ 2) k_(b \/ 4) = A_0 d / h sum_(j = 0)^M 2^(- j \/ 2) #scale(x: 120%, y: 120%)[\(] 1 + \( j + 2 \) log 2 #scale(x: 120%, y: 120%)[\)]^2 lt.eq C d / h . $ <eq:09-main-series>]
  The additional logarithms in (9.3) sum to $O \( log \( C d \) \)$ with the same $b^(1 \/ 2)$ weights. Also,
  $ sum_(b in cal(B)_(upright(m))) b^(- 1 \/ 2) bb(E) \( 1 + K_e \) lt.eq C b_0^(- 1 \/ 2) lt.eq C h^8 \, #h(2em) sum_(b in cal(B)_(upright(m))) bb(E) H_b^(upright(m)) lt.eq C \( 1 + log h \) #scale(x: 120%, y: 120%)[\(] log \( C d \) + log h #scale(x: 120%, y: 120%)[\)] . $
  Every fixed polynomial in $h$, multiplied by $1 + log d$, is $o \( d \/ h \)$ because $h = log log d$. Thus the second line of (9.11) has expectation $O \( d \/ h \)$.
  For the scalar series write $b = B 2^(- j)$. The convergent sums $sum_(j gt.eq 0) 2^(- j \/ 4)$ and $sum_(j gt.eq 0) j 2^(- j \/ 4)$, together with (9.2), (9.3), (9.3), give
  #[#set math.equation(numbering: n => "(9.14)")
   $ & sum_(b in cal(B)_(upright(s)) \( B \)) bb(E) [b^(1 \/ 4) \( 1 + K_e + t_b^(upright(s)) \) + b H_b^(upright(s))]\
 & #h(1cm)  lt.eq C B^(1 \/ 4) #scale(x: 120%, y: 120%)[\(] d_1 + 1 + log \( 1 \/ B \) + log \( 1 \/ sigma \) #scale(x: 120%, y: 120%)[\)] . $ <eq:09-scalar-series>]
  For example the miss-block part alone is bounded by $C B \( log \( C d_1 \/ B \) + log \( 1 \/ sigma \) + 1 \)$, which is no larger than the displayed right side. On live plateaus $B = b_0 lt.eq h^(- 16)$ and $d_1 = d$, so this is $O \( d \/ h^4 \)$ and hence $O \( d \/ h \)$. On static plateaus $B = 1$ and $d_1 gt.eq d$, so $log \( 1 \/ sigma \) = 40 log h lt.eq C d_1$ makes it $O \( d_1 \)$. The local scalar edge bound in 18 therefore proves
  #[#set math.equation(numbering: n => "(9.15)")
   $ bb(E)_(upright(bold(U))_e) sup_u \| cal(T)_e^u \| lt.eq C \( d + 2 + log^(-) alpha_e \) quad upright("for every static plateau.") $ <eq:09-static-plateau>]
  For every nonnegative jump quantity $V_p$ of a plateau, change of the uniform root measure gives exactly
  #[#set math.equation(numbering: n => "(9.16)")
   $ sum_e w_e bb(E)_(upright(bold(U))_e) sum_(p in cal(P)_e \( x \)) V_p = sum_(upright("jumping pieces ") p) upright(bold(U)) \( p \) alpha_e V_p . $ <eq:09-weight-conversion>]
  The Fisher bound in 16 bounds the right side by $C d$ when $V_p = J_p$ and $e$ is live. The global scalar edge assertion of 18 does the same for $V_p = E_p^(upright(s))$. Its global main edge assertion yields
  $ b_0^(- 3) sum_(upright("live jumping pieces ") p) upright(bold(U)) \( p \) alpha_e sum_(b in cal(B)_(upright(m))) E_(p \, b)^(upright(m)) lt.eq "poly" \( h \) \( h + log d \) = o \( d \) . $
  Finally $sum_(e upright(" live")) w_e lt.eq C h$ by 16. Multiplying the $O \( d \/ h \)$ per-plateau costs in (9.11) by these weights therefore proves
  #[#set math.equation(numbering: n => "(9.17)")
   $ sum_(e upright(" live")) w_e bb(E)_(upright(bold(U))_e) sup_u \| cal(T)_e^u \| lt.eq C d . $ <eq:09-live-total>]
  === Static roots, small mass, and rare transfers <static-roots-small-mass-and-rare-transfers>
  Consider static handling starting with a positive piece of mean $m$ at an interval $q$. Its later plateaus restart only when their incoming mean exceeds twice the previous normalization. Along any input path each new normalization is therefore more than twice its predecessor, and every normalization is at least $m$. A plateau with a jump has normalization at most $e^(4 h)$; allowing a final non-jumping overshoot changes this bound only by a factor of two. Consequently the number $N_(upright("st"))$ of static starts on the path obeys
  #[#set math.equation(numbering: n => "(9.18)")
   $ N_(upright("st")) lt.eq C \( 1 + h + log^(-) m \) \, #h(2em) d + 2 + log^(-) alpha_e lt.eq d + 2 + log^(-) m . $ <eq:09-static-count>]
  Starts with no subsequent jump may also simply be omitted.
  Let $upright(bold(P))_q$ be the probability with density equal to this entry piece divided by $m$ relative to uniform probability on $q$. Since the piece is never split again, the probability of reaching a later static plateau root $p_e$ is $upright(bold(U))_q \( p_e \) alpha_e \/ m$. Thus the sum of its starting weights is the original weight $upright(bold(U)) \( q \) m$ multiplied by $bb(E)_(upright(bold(P))_q) N_(upright("st"))$. Applying (9.15), (9.18), the entire static descendant family costs at most
  #[#set math.equation(numbering: n => "(9.19)")
   $ C upright(bold(U)) \( q \) m \( 1 + h + log^(-) m \) \( d + 2 + log^(-) m \) . $ <eq:09-static-family>]
  This uses the input path only to sum weights; each individual transform estimate remains an integral over its uniform output path.
  If $0 < m_(upright("top")) < 1 \/ h$, the procedure takes the top static immediately. Writing $ell = log \( 1 \/ m_(upright("top")) \)$, its total cost is bounded by
  $ C m_(upright("top")) \( 1 + h + ell \) \( d + 2 + ell \) lt.eq C d . $
  For an explicit verification, $m_(upright("top")) h lt.eq 1$, $sup_(0 < t lt.eq 1) t log \( 1 \/ t \) = 1 \/ e$, and $sup_(0 < t lt.eq 1) t log^2 \( 1 \/ t \) = 4 \/ e^2$. Expanding the product and using $h lt.eq d$ proves the inequality.
  It remains to sum static families transferred out of an initially live top, so $m_(upright("top")) gt.eq 1 \/ h$. Every true input path undergoes at most one such transfer. Let $A_(upright("tr"))$ be the transfer event under its input probability $upright(bold(P))$, and let $X_(*)$ be the maximum negative logarithm of the mean through transfer or stopping, including the transfer state. 16 gives
  #[#set math.equation(numbering: n => "(9.20)")
   $ upright(bold(P)) \( A_(upright("tr")) \) lt.eq C h^(- 10) \, #h(2em) parallel X_(*) parallel_(L^2 \( upright(bold(P)) \)) lt.eq C h . $ <eq:09-transfer-data>]
  This includes both charge/count transfers and the small-mass flag. In particular the small-mass event has $X_(*) > d$, hence probability at most $C h^2 \/ d^2 lt.eq C h^(- 10)$. The cap accounting and the evidence argument in that proposition bound the probability of the other transfers; there is no further sequence of live restarts after transfer.
  For a transfer piece of mean $m$, its true reaching probability is $upright(bold(U)) \( q \) m \/ m_(upright("top"))$ and $log^(-) m lt.eq X_(*)$ on that event. Summing (9.19) over all transfer roots therefore bounds their entire cost by
  $ C m_(upright("top")) bb(E)_(upright(bold(P))) \[ upright(bold(1))_(A_(upright("tr"))) \( 1 + h + X_(*) \) \( d + 2 + X_(*) \) \] . $
  Only the second moment in (9.20) is needed. Indeed, with $delta = upright(bold(P)) \( A_(upright("tr")) \)$,
  $ & bb(E) \[ upright(bold(1))_(A_(upright("tr"))) \( 1 + h + X_(*) \) \( d + 2 + X_(*) \) \]\
 & quad = \( 1 + h \) \( d + 2 \) delta + \( d + 3 + h \) bb(E) \[ upright(bold(1))_(A_(upright("tr"))) X_(*) \] + bb(E) \[ upright(bold(1))_(A_(upright("tr"))) X_(*)^2 \]\
 & quad lt.eq C d h^(- 9) + C \( d + h \) h^(- 4) + C h^2 lt.eq C d . $
  Here Cauchy–Schwarz gives $bb(E) \[ upright(bold(1))_(A_(upright("tr"))) X_(*) \] lt.eq sqrt(delta) thin parallel X_(*) parallel_2 lt.eq C h^(- 4)$, whereas the quadratic term uses its full bound $bb(E) X_(*)^2 lt.eq C h^2$. Multiplying by $m_(upright("top")) lt.eq 2$ preserves $C d$.
  === Completion <completion>
  The live estimate (9.17) and the static-family estimates bound the right side of (9.1) by $C d$. This proves (6.1). Every construction was in fixed finite depth and every estimate was independent of $Q$. Increasing $Q$ and applying monotone convergence proves the assertion for all integer modulations as well. ◻
]

== 10 Fourier sums and the endpoint summation <sec:fourier>

We now return to periodic functions. In this section the circle has period one and measure $d y$, as in 2. The Fourier coefficients use $chi_k \( y \) = e^(2 pi i k y)$; changing coordinates at the end recovers precisely the normalization of 1.

=== 10.1 A good-set integral bound <a-good-set-integral-bound>

For a nonnegative periodic function $rho$, let

$ M rho \( x \) = sup_(I in.rev x\
0 < \| I \| lt.eq 1) frac(1, \| I \|) integral_I rho \( y \) thin d y $

be its uncentered interval maximal function, with intervals interpreted on the periodic extension. The elementary interval covering argument gives

#[#set math.equation(numbering: n => "(10.1)")
 $ \| { M rho > lambda } #scale(x: 120%, y: 120%)[\|] lt.eq C / lambda integral_0^1 rho \( y \) thin d y . $ <eq:fourier-maximal-weak>]

Indeed, for a compact subset of the level set, choose finitely many witnessing intervals and a disjoint subfamily whose intervals enlarged by a fixed factor cover that subset. The sum of the lengths of the disjoint intervals is at most $lambda^(- 1) integral rho$, up to an absolute periodic overlap constant. Inner regularity proves the stated inequality. In particular, for a mass-one input and $h = log log d$,

$ G_rho = { M rho lt.eq e^(4 h) } \, #h(2em) \| G_rho^c \| lt.eq C e^(- 4 h) = C \( log d \)^(- 4) . $

#thm([Theorem 10.1.])[
  (Truncated integral estimate).  #emph[There are absolute constants $C$ and $d_(*)$ such that, whenever $d gt.eq d_(*)$ and $rho$ is a nonnegative periodic function with $integral_0^1 rho = 1$ and $rho lt.eq e^d$ almost everywhere, 
#[#set math.equation(numbering: n => "(10.2)")
 $ integral_(G_rho) sup_(N gt.eq 0) \| S_N rho \( x \) \| thin d x lt.eq C d . $ <eq:source-18>]

]
] <thm:good-set>

#proof[
  We first pass from 15 to modulated convolutions, then identify the periodic Hilbert transform.
  ===== 10.1.1 The two Haar profiles. <the-two-haar-profiles.>
  Extend the following functions by zero outside $\[ 0 \, 1 \)$:
  $ frak(h) = upright(bold(1))_(\[ 0 \, 1 \/ 2 \)) - upright(bold(1))_(\[ 1 \/ 2 \, 1 \)) \, #h(2em) frak(g) = upright(bold(1))_(\[ 0 \, 1 \/ 4 \)) - upright(bold(1))_(\[ 1 \/ 4 \, 1 \/ 2 \)) - upright(bold(1))_(\[ 1 \/ 2 \, 3 \/ 4 \)) + upright(bold(1))_(\[ 3 \/ 4 \, 1 \)) . $
  For a dyadic interval $I = \[ a \, a + r \)$ put $frak(h)_I \( y \) = frak(h) \( \( y - a \) \/ r \)$ and $frak(g)_I \( x \) = frak(g) \( \( x - a \) \/ r \)$. The shift summand
  $ (frac(1, \| I \|) integral_I rho \( y \) chi_n \( y \) frak(h)_I \( y \) thin d y) frak(g)_I \( x \) $
  is an admissible summand in 15: on the output side choose $epsilon.alt_j = r_(j + 1)$, so that $frak(g)_I = r_(j + 1) r_(j + 2)$.
  Tile the line by top intervals of length $s in \[ 1 \/ 2 \, 1 \]$, translate the tiling by $a in \[ 0 \, s \)$, and use depths $j = 0 \, dots.h \, J - 1$ below every top, where $J gt.eq 1$. Denote the resulting finite-depth shift by $cal(S)_(a \, s \, J)$. This shift need not be periodic, so in the next estimate $G_rho$ denotes its representative in $\[ 0 \, 1 \)$. At most a fixed number of top intervals meet $\[ 0 \, 1 \)$. Each has input average at most $2$, since $rho$ has mass one in a period and $s gt.eq 1 \/ 2$. At every $x in G_rho$, the density cutoff in 15 is inactive on all intervals of its spatial path. Thus the stopped and unstopped shifts agree there, and
  #[#set math.equation(numbering: n => "(10.3)")
   $ integral_(G_rho) sup_(n in bb(Z)) \| cal(S)_(a \, s \, J) \( rho chi_n \) \( x \) \| thin d x lt.eq C d $ <eq:fourier-finite-shift>]
  uniformly in $a \, s \, J$. Here a uniform-probability integral on a top interval is multiplied by its length to obtain the ordinary spatial integral. Only a bounded number of top intervals is involved.
  ===== 10.1.2 Translation and scale averaging. <translation-and-scale-averaging.>
  Define
  $ kappa \( u \) = integral_(bb(R)) frak(g) \( v \) frak(h) \( v - u \) thin d v . $
  For a fixed length $r = s 2^(- j)$, uniform translation modulo $s$ is also uniform translation modulo $r$. Changing variables from an interval’s left endpoint to the output’s position $v$ in that interval shows that the translation average of its full tiling is convolution with $r^(- 1) kappa \( t \/ r \)$. This identity is just Fubini’s theorem applied to the bounded, compactly supported profiles. For $F = rho chi_n$, integrating the translation average in $d s \/ s$ gives
  $ integral_(1 \/ 2)^1 integral_0^s cal(S)_(a \, s \, J) F \( x \) thin frac(d a, s) thin frac(d s, s) = \( K_J * F \) \( x \) \, $
  where, because the intervals $\[ 2^(- j - 1) \, 2^(- j) \]$ partition $\[ 2^(- J) \, 1 \]$,
  #[#set math.equation(numbering: n => "(10.4)")
   $ K_J \( t \) = integral_(2^(- J))^1 kappa \( t \/ r \) thin frac(d r, r^2) . $ <eq:fourier-averaged-kernel>]
  The triangle inequality, followed by (10.3), therefore yields
  #[#set math.equation(numbering: n => "(10.5)")
   $ integral_(G_rho) sup_(n in bb(Z)) \| K_J * \( rho chi_n \) \( x \) \| thin d x lt.eq C d . $ <eq:fourier-kernel-bound>]
  The measure $d s \/ s$ on $\[ 1 \/ 2 \, 1 \]$ has mass $log 2$; it has not been normalized to a probability measure. This fixed factor is absorbed in $C$. The functions being averaged are finite shift outputs, measurable in the translation and scale parameters. No measurability of the auxiliary processing choices used to prove their uniform bound is required.
  ===== 10.1.3 The nonzero singular kernel. <the-nonzero-singular-kernel.>
  Reflection about $1 \/ 2$ fixes $frak(g)$ and reverses the sign of $frak(h)$, so $kappa$ is odd. It is supported in $\[ - 1 \, 1 \]$ and is Lipschitz, since it is a finite linear combination of overlaps of intervals. Moreover
  #[#set math.equation(numbering: n => "(10.6)")
   $ c := integral_0^1 kappa \( u \) thin d u & = integral_0^1 frak(g) \( v \) (integral_0^v frak(h) \( t \) thin d t) thin d v\
 & = 1 / 32 - 3 / 32 - 3 / 32 + 1 / 32 = - 1 / 8 . $ <eq:fourier-c>]
  The inner primitive is the tent function $min \( v \, 1 - v \)$. Thus the average in (10.4) has a nonzero Hilbert-transform component. This calculation agrees with the Haar-shift kernel evaluation in #cite(label("Hytonen2008")) Section 3, pp. 1135–1136.
  Put $delta = 2^(- J)$. When $delta < t lt.eq 1$, the substitution $u = t \/ r$ and the support of $kappa$ give
  $ K_J \( t \) = 1 / t integral_t^1 kappa \( u \) thin d u = c / t - 1 / t integral_0^t kappa \( u \) thin d u . $
  The second term is bounded by an absolute constant; oddness gives the same conclusion for negative $t$. On $\| t \| lt.eq delta$,
  $ \| K_J \( t \) \| lt.eq parallel kappa parallel_oo integral_delta^1 frac(d r, r^2) lt.eq C delta^(- 1) . $
  Compare $K_J$ to
  $ pi c thin cot \( pi t \) thin upright(bold(1))_({ delta < \| t \| lt.eq 1 \/ 2 }) . $
  On the central annulus the difference is bounded, because $pi cot \( pi t \) - 1 \/ t$ is bounded on $\[ - 1 \/ 2 \, 1 \/ 2 \]$. On $1 \/ 2 < \| t \| lt.eq 1$ the original kernel is bounded as well. Those bounded errors have convolution at most $C$ in absolute value against any $rho chi_n$, using periodicity and mass one. The inner window contributes at most
  $ C delta^(- 1) integral_(\| t \| lt.eq delta) rho \( x - t \) thin d t lt.eq C M rho \( x \) lt.eq C e^(4 h) #h(2em) \( x in G_rho \) . $
  It follows from (10.5) and $e^(4 h) = o \( d \)$ that
  #[#set math.equation(numbering: n => "(10.7)")
   $ integral_(G_rho) sup_(n in bb(Z)) \| H_delta \( rho chi_n \) \( x \) \| thin d x lt.eq C d \, #h(2em) H_delta F \( x \) = integral_(delta < \| t \| lt.eq 1 \/ 2) F \( x - t \) cot \( pi t \) thin d t . $ <eq:fourier-truncated-H>]
  Division by the fixed nonzero number $pi c$ is harmless.
  ===== 10.1.4 The Hilbert multiplier and Fourier projections. <the-hilbert-multiplier-and-fourier-projections.>
  For completeness, $H_delta$ converges in $L^2$ to the periodic Hilbert transform $H$ whose multiplier is $- i thin "sgn" \( k \)$ for $k eq.not 0$ and zero at $k = 0$. To see this directly, oddness reduces its multiplier to a sine integral. These multipliers are uniformly bounded: write $cot \( pi t \) = 1 \/ \( pi t \) + O \( 1 \)$, split the sine integral at inverse frequency, and integrate by parts on the remaining interval. For a fixed positive integer $k$,
  #[#set math.equation(numbering: n => "(10.8)")
   $ integral_(- 1 \/ 2)^(1 \/ 2) sin \( 2 pi k t \) cot \( pi t \) thin d t = 1 . $ <eq:fourier-symbol>]
  Indeed, setting $x = pi t$ and using
  $ sin \( 2 k x \) = 2 sin x sum_(a = 1)^k cos \( \( 2 a - 1 \) x \) $
  reduces the integral to the constant term in $2 cos x sum_(a = 1)^k cos \( \( 2 a - 1 \) x \)$; all its nonconstant even-frequency cosines have integral zero on $\[ - pi \/ 2 \, pi \/ 2 \]$. The constant term occurs only for $a = 1$ and gives one after division by $pi$. Negative frequencies have the opposite sign. Pointwise multiplier convergence and the uniform bound now imply $L^2$ convergence by Parseval’s identity.
  Every $rho chi_n$ is bounded and hence belongs to $L^2$. For a fixed finite set of integers, the maximum of the differences $\| H_delta \( rho chi_n \) - H \( rho chi_n \) \|$ tends to zero in $L^1$, by the finite sum of their $L^2$ norms. Pass to the limit in (10.7) for that finite set and then increase the set to $bb(Z)$. Monotone convergence gives
  #[#set math.equation(numbering: n => "(10.9)")
   $ integral_(G_rho) sup_(n in bb(Z)) \| H \( rho chi_n \) \( x \) \| thin d x lt.eq C d . $ <eq:fourier-H-max>]
  Let $P_0$ be projection onto constants and let $Pi_(gt.eq 0)$ be projection onto the nonnegative Fourier frequencies. As $L^2$ multiplier identities,
  $ Pi_(gt.eq 0) = frac(I + i H + P_0, 2) \, #h(2em) S_N rho = chi_(- N) Pi_(gt.eq 0) \( rho chi_N \) - chi_(N + 1) Pi_(gt.eq 0) \( rho chi_(- \( N + 1 \)) \) . $
  They hold almost everywhere simultaneously for all the indicated integer indices, after removing one null set. Since $\| hat(rho) \( k \) \| lt.eq 1$, their identity and constant terms give the pointwise upper bound
  $ sup_(N gt.eq 0) \| S_N rho \| lt.eq rho + 1 + sup_(n in bb(Z)) \| H \( rho chi_n \) \| . $
  Integrating and applying (10.9) proves (10.2). ◻
]

=== 10.2 Bounded inputs <bounded-inputs>

#thm([Proposition 10.2.])[
  #emph[Every bounded complex-valued periodic function has almost-everywhere convergence of its symmetric Fourier partial sums along the full sequence.]
] <prop:fourier-bounded>

#proof[
  Let $parallel f parallel_oo lt.eq B$. The case $B = 0$ is immediate. Take the Fejér means $P_ell$ of $f$. They are trigonometric polynomials satisfying $parallel P_ell parallel_oo lt.eq B$ and $parallel f - P_ell parallel_1 arrow.r 0$. The latter fact follows from the approximate-identity property of the nonnegative, mass-one Fejér kernels and continuity of translations in $L^1$.
  Split $f - P_ell$ into the positive and negative parts of its real and imaginary components. Each nonnegative part $q_ell$ is at most $2 B$ and has mass $m_ell arrow.r 0$. If $m_ell = 0$ its partial sums vanish. Otherwise normalize to $rho_ell = q_ell \/ m_ell$ and choose
  $ d_ell = d_(*) + max { 0 \, log \( 2 B \/ m_ell \) } . $
  As $m_ell arrow.r 0$ through positive values, $d_ell arrow.r oo$, $m_ell d_ell arrow.r 0$, and $rho_ell lt.eq e^(d_ell)$. 29 and Markov’s inequality show, for each $eta > 0$,
  $ lr(|{sup_N \| S_N q_ell \| > eta}|) lt.eq C \( log d_ell \)^(- 4) + frac(C m_ell d_ell, eta) arrow.r 0 . $
  Applying this to the four component parts proves $sup_N \| S_N \( f - P_ell \) \| arrow.r 0$ in measure.
  For each $ell$, the partial sums of $P_ell$ are eventually equal to $P_ell$ itself. Consequently the measurable function
  $ A \( x \) = limsup_(N arrow.r oo) \| S_N f \( x \) - f \( x \) \| $
  satisfies
  $ A \( x \) lt.eq sup_N \| S_N \( f - P_ell \) \( x \) \| + \| f \( x \) - P_ell \( x \) \| $
  almost everywhere. Both terms on the right tend to zero in measure. For each $eta > 0$ this bounds $\| { A > eta } \|$ by a quantity tending to zero. Thus $A = 0$ almost everywhere, as required. ◻
]

=== 10.3 Summation of the height layers <summation-of-the-height-layers>

#proof[
  It suffices to work in unit-period coordinates. Write
  $ f = f_(upright("bd")) + sum_(j gt.eq 1) f_j \, #h(2em) f_(upright("bd")) = f thin upright(bold(1))_({ \| f \| < e^2 }) \, #h(2em) f_j = f thin upright(bold(1))_({ e^(2^j) lt.eq \| f \| < e^(2^(j + 1)) }) . $
  For each $j$, split $f_j$ into four nonnegative parts with coefficients $1 \, - 1 \, i \, - i$, using the positive and negative parts of its real and imaginary components. Consider one such sequence $q_j$, and write $m_j = integral q_j$. Discard its zero-mass members. Put
  $ rho_j = q_j \/ m_j \, #h(2em) d_j = 2^(j + 1) + log^(-) m_j . $
  Then $integral rho_j = 1$ and $rho_j lt.eq e^(d_j)$. For all sufficiently large $j$, 29 applies.
  We claim
  #[#set math.equation(numbering: n => "(10.10)")
   $ sum_j m_j d_j < oo . $ <eq:fourier-layer-cost>]
  On the support of $q_j$, $log \| f \| gt.eq 2^j$, and $q_j lt.eq \| f \|$. Disjointness of the layers therefore gives
  $ sum_j 2^(j + 1) m_j lt.eq 2 integral_({ \| f \| gt.eq e^2 }) \| f \| log \| f \| < oo . $
  For the additional entropy term, if $m_j gt.eq e^(- 2^j)$, then $m_j log^(-) m_j lt.eq 2^j m_j$. If $m_j < e^(- 2^j)$, the monotonicity of $t log \( 1 \/ t \)$ on $\( 0 \, e^(- 1) \)$ gives $m_j log \( 1 \/ m_j \) lt.eq 2^j e^(- 2^j)$. Both bounds are summable. This proves (10.10).
  Let $G_j$ be the good set associated to $rho_j$. Since $log d_j gt.eq \( j + 1 \) log 2$,
  $ sum_j \| G_j^c \| lt.eq C sum_j \( log d_j \)^(- 4) < oo . $
  Borel–Cantelli implies that almost every point belongs to all but finitely many $G_j$. On the other hand, Tonelli’s theorem and (10.2), (10.10) give
  $ integral sum_j upright(bold(1))_(G_j) \( x \) sup_N \| S_N q_j \( x \) \| thin d x lt.eq C sum_j m_j d_j < oo \, $
  where a finite number of initial layers may be omitted. Therefore, at almost every point, the partial-sum maxima of the tail layers are absolutely summable. Every individual $q_j$ is bounded, so 30 also gives its full-sequence limit and the finiteness of its partial-sum maximum outside a null set. Restoring finitely many omitted layers causes no difficulty. Intersect these full-measure sets for the four component sequences and for $f_(upright("bd"))$.
  The layers are summable in $L^1$. For each fixed $N$, Fourier coefficients can consequently be summed term by term; equivalently, the finite-rank operator $S_N$ is bounded from $L^1$ to $L^oo$. Thus
  $ S_N f = S_N f_(upright("bd")) + sum_(j gt.eq 1) S_N f_j $
  with the four component parts understood in the last sum. At every point of the full-measure set just constructed, the absolute sum of their partial-sum maxima is finite. Its tail tends to zero uniformly in $N$. Take the limit first on a finite collection of layers, using 30, and then let the collection increase. The result is $S_N f \( x \) arrow.r f_(upright("bd")) \( x \) + sum_j f_j \( x \) = f \( x \)$. All excluded sets are measurable, and only countably many are used. Changing back to $x = 2 pi y$ proves the stated theorem with normalized measure $d x \/ \( 2 pi \)$. ◻
]

=== 10.4 The maximal consequence <the-maximal-consequence>

#thm([Corollary 10.3.])[
  (Weak-$L^1$ maximal bound).  #emph[On $bb(T) = bb(R) \/ \( 2 pi bb(Z) \)$ with $d mu = d x \/ \( 2 pi \)$, set $Phi \( t \) = t log \( 2 + t \)$ and define the Luxemburg norm by 
$ parallel f parallel_Phi = inf {b > 0 : integral_(bb(T)) Phi \( \| f \| \/ b \) thin d mu lt.eq 1} . $

 For the ordinary symmetric partial sums of 1, put $S^(*) f = sup_(N gt.eq 0) \| S_N f \|$. There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(10.11)")
 $ sup_(lambda > 0) lambda thin mu { S^(*) f > lambda } lt.eq C parallel f parallel_Phi #h(2em) \( f in L log L \( bb(T) \; bb(C) \) \) . $ <eq:fourier-weak-l1>]

]
] <cor:fourier-weak-l1>

#proof[
  The real Luxemburg space $B = L^Phi \( bb(T) \; bb(R) \)$ is Banach. Since $Phi \( 2 t \) lt.eq 4 Phi \( t \)$, its underlying set is exactly the real $L log L$ class used in 1; moreover $parallel f parallel_1 lt.eq parallel f parallel_Phi \/ log 2$. Translations are isometries of $B$ by invariance of $mu$. Each $S_N$ is a real linear operator commuting with translations and is bounded from $B$ into itself: indeed, $parallel S_N f parallel_oo lt.eq \( 2 N + 1 \) parallel f parallel_1$, and $L^oo$ embeds continuously in $B$. These bounds need not be uniform in $N$. By 1, $S^(*) f$ is finite almost everywhere for every $f in B$. Stein’s theorem #cite(label("Stein1961")) Appendix, Theorem 10, applied to the sequence $S_0 \, - S_0 \, S_1 \, - S_1 \, dots.h$, therefore gives (10.11) for real inputs; the signed supremum in that theorem is precisely $S^(*) f$ for this sequence. For $f = u + i v$, use $S^(*) f lt.eq S^(*) u + S^(*) v$ and $parallel u parallel_Phi \, parallel v parallel_Phi lt.eq parallel f parallel_Phi$, splitting the level at $lambda \/ 2$. This proves the complex-valued assertion after enlarging $C$ by a fixed factor. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
